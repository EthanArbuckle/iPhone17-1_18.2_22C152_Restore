@interface ABNamePredicate
- (ABNamePredicate)init;
- (BOOL)generateExceprts;
- (BOOL)isValid;
- (BOOL)matchPersonOrCompanyNamesExclusively;
- (BOOL)matchPreferredName;
- (BOOL)matchSmartDialerFormatsExclusively;
- (BOOL)matchWholeWords;
- (NSArray)groups;
- (NSArray)scopedContactIdentifiers;
- (NSArray)sources;
- (NSString)accountIdentifier;
- (NSString)name;
- (id)_matchClauseForColumns:(id)a3 requiringAllTerms:(BOOL)a4;
- (id)_personNameKeys;
- (id)_personNonNameKeys;
- (id)ab_metadataForMatchingRow:(CPSqliteStatement *)a3 columnOffset:(int)a4;
- (id)emphasizedExcerptStringForMatchString:(id)a3;
- (id)predicateFormat;
- (id)queryJoinsInCompound:(BOOL)a3 predicateIdentifier:(int)a4;
- (id)queryRankStringForPredicateIdentifier:(int)a3;
- (id)querySelectPropertiesForPredicateIdentifier:(int)a3;
- (id)queryWhereStringForPredicateIdentifier:(int)a3;
- (void)ab_bindJoinClauseComponentOfStatement:(CPSqliteStatement *)a3 withBindingOffset:(int *)a4 predicateIdentifier:(int)a5;
- (void)ab_bindWhereClauseComponentOfStatement:(CPSqliteStatement *)a3 withBindingOffset:(int *)a4 predicateIdentifier:(int)a5;
- (void)addressBook;
- (void)dealloc;
- (void)group;
- (void)setAccountIdentifier:(id)a3;
- (void)setAddressBook:(void *)a3;
- (void)setGenerateExceprts:(BOOL)a3;
- (void)setGroup:(void *)a3;
- (void)setGroups:(id)a3;
- (void)setMatchPersonOrCompanyNamesExclusively:(BOOL)a3;
- (void)setMatchPreferredName:(BOOL)a3;
- (void)setMatchSmartDialerFormatsExclusively:(BOOL)a3;
- (void)setMatchWholeWords:(BOOL)a3;
- (void)setName:(id)a3;
- (void)setScopedContactIdentifiers:(id)a3;
- (void)setSource:(void *)a3;
- (void)setSources:(id)a3;
- (void)source;
- (void)tokenizations;
@end

@implementation ABNamePredicate

- (ABNamePredicate)init
{
  v5.receiver = self;
  v5.super_class = (Class)ABNamePredicate;
  v2 = [(ABPredicate *)&v5 init];
  v3 = v2;
  if (v2)
  {
    v2->_matchPreferredName = 1;
    v2->_tokenizations = (void *)ABTokenListCreate();
    v3->_generateExceprts = 0;
  }
  return v3;
}

- (void)dealloc
{
  addressBook = self->_addressBook;
  if (addressBook) {
    CFRelease(addressBook);
  }
  tokenizationSortKeys = self->_tokenizationSortKeys;
  if (tokenizationSortKeys) {
    releaseTokenizationSortKeys(tokenizationSortKeys);
  }
  CFRelease(self->_tokenizations);

  v5.receiver = self;
  v5.super_class = (Class)ABNamePredicate;
  [(ABPredicate *)&v5 dealloc];
}

- (void)setAddressBook:(void *)a3
{
  addressBook = self->_addressBook;
  if (addressBook != a3)
  {
    if (addressBook) {
      CFRelease(addressBook);
    }
    if (a3) {
      CFRetain(a3);
    }
    self->_addressBook = a3;
  }
}

- (void)addressBook
{
  return self->_addressBook;
}

- (void)setName:(id)a3
{
  name = self->_name;
  if (name != a3)
  {

    self->_name = (NSString *)[a3 copy];
    tokenizations = self->_tokenizations;
    ABTokenListRemoveAllTokens((uint64_t)tokenizations);
  }
}

- (void)setGroup:(void *)a3
{
  if (a3) {
    a3 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObject:");
  }
  [(ABNamePredicate *)self setGroups:a3];
}

- (void)group
{
  return 0;
}

- (void)setSource:(void *)a3
{
  if (a3) {
    a3 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObject:");
  }
  [(ABNamePredicate *)self setSources:a3];
}

- (void)source
{
  return 0;
}

- (void)setAccountIdentifier:(id)a3
{
  if ([(ABNamePredicate *)self addressBook])
  {
    if (!a3) {
      return;
    }
  }
  else
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"ABNamePredicate.m", 111, @"Should have address book before attempting to use [ABNamePredicate setAccountIdentifier:].  Or preferably, use [ABNamePredicate setSources:].");
    if (!a3) {
      return;
    }
  }
  uint64_t v6 = ABAddressBookCopyArrayOfAllSourcesWithAccountIdentifier((uint64_t)[(ABNamePredicate *)self addressBook], (uint64_t)a3);
  if (v6)
  {
    id v7 = (id)v6;
    [(ABNamePredicate *)self setSources:v6];
  }
}

- (NSString)accountIdentifier
{
  return 0;
}

- (void)tokenizations
{
  if ([(ABNamePredicate *)self name] && !ABTokenListGetCount((uint64_t)self->_tokenizations))
  {
    tokenizations = self->_tokenizations;
    WordTokenizer = ABAddressBookGetWordTokenizer((uint64_t)[(ABNamePredicate *)self addressBook]);
    ABTokenListPopulateFromString((uint64_t)tokenizations, WordTokenizer, 0, (const __CFString *)[(ABNamePredicate *)self name], 0, 1, 0);
  }
  return self->_tokenizations;
}

- (BOOL)isValid
{
  v2 = [(ABNamePredicate *)self tokenizations];
  if (v2) {
    LOBYTE(v2) = ABTokenListGetCount((uint64_t)v2) > 0;
  }
  return (char)v2;
}

- (id)ab_metadataForMatchingRow:(CPSqliteStatement *)a3 columnOffset:(int)a4
{
  v20[3] = *MEMORY[0x1E4F143B8];
  if (!ABCFTSIsEnabled()) {
    return 0;
  }
  uint64_t v7 = sqlite3_column_int(a3->var1, a4);
  uint64_t v8 = *(void *)sqlite3_column_blob(a3->var1, a4 + 1);
  if ([(ABNamePredicate *)self generateExceprts])
  {
    v9 = sqlite3_column_text(a3->var1, a4 + 2);
    if (v9) {
      v10 = (const char *)v9;
    }
    else {
      v10 = "";
    }
    id v11 = -[ABNamePredicate emphasizedExcerptStringForMatchString:](self, "emphasizedExcerptStringForMatchString:", [NSString stringWithUTF8String:v10]);
    v19[0] = @"relevance";
    v20[0] = [NSNumber numberWithInt:v7];
    v20[1] = v8;
    v19[1] = @"matchedProperties";
    v19[2] = @"excerpt";
    v20[2] = v11;
    v12 = (void *)MEMORY[0x1E4F1C9E8];
    v13 = v20;
    v14 = v19;
    uint64_t v15 = 3;
  }
  else
  {
    v17[0] = @"relevance";
    v17[1] = @"matchedProperties";
    v18[0] = [NSNumber numberWithInt:v7];
    v18[1] = v8;
    v12 = (void *)MEMORY[0x1E4F1C9E8];
    v13 = v18;
    v14 = v17;
    uint64_t v15 = 2;
  }
  return (id)[v12 dictionaryWithObjects:v13 forKeys:v14 count:v15];
}

- (id)emphasizedExcerptStringForMatchString:(id)a3
{
  id v5 = objc_alloc_init(MEMORY[0x1E4F28E48]);
  uint64_t v6 = (void *)[a3 componentsSeparatedByString:@"\n"];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __57__ABNamePredicate_emphasizedExcerptStringForMatchString___block_invoke;
  v8[3] = &unk_1E5988F80;
  v8[4] = self;
  v8[5] = v5;
  [v6 enumerateObjectsUsingBlock:v8];
  return v5;
}

void __57__ABNamePredicate_emphasizedExcerptStringForMatchString___block_invoke(uint64_t a1, void *a2, char a3)
{
  v17[1] = *MEMORY[0x1E4F143B8];
  char v5 = [a2 isEqualToString:@"…"];
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:a2];
  if ((a3 & 1) != 0 && (v5 & 1) == 0)
  {
    uint64_t v7 = [*(id *)(a1 + 32) tokenizations];
    uint64_t Count = ABTokenListGetCount(v7);
    if (Count >= 1)
    {
      uint64_t v9 = Count;
      for (uint64_t i = 0; i != v9; ++i)
      {
        uint64_t v11 = objc_msgSend(a2, "rangeOfString:options:", ABTokenListGetTokenAtIndex(v7, i), 393);
        if (v11 != 0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v13 = v11;
          uint64_t v14 = v12;
          v16 = @"excerptEmphasized";
          v17[0] = [NSNumber numberWithBool:1];
          objc_msgSend(v6, "setAttributes:range:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1), v13, v14);
        }
      }
    }
  }
  [*(id *)(a1 + 40) appendAttributedString:v6];
}

- (id)querySelectPropertiesForPredicateIdentifier:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v10[2] = *MEMORY[0x1E4F143B8];
  if (!ABCFTSIsEnabled()) {
    return 0;
  }
  if (self->_matchPersonOrCompanyNamesExclusively
    || self->_matchSmartDialerFormatsExclusively
    || ![(ABNamePredicate *)self generateExceprts])
  {
    v10[0] = objc_msgSend(NSString, "stringWithFormat:", @"RankResults_%d.Rank", v3);
    v10[1] = objc_msgSend(NSString, "stringWithFormat:", @"RankResults_%d.MatchedColumns", v3);
    char v5 = (void *)MEMORY[0x1E4F1C978];
    uint64_t v6 = v10;
    uint64_t v7 = 2;
  }
  else
  {
    v9[0] = objc_msgSend(NSString, "stringWithFormat:", @"RankResults_%d.Rank", v3);
    v9[1] = objc_msgSend(NSString, "stringWithFormat:", @"RankResults_%d.MatchedColumns", v3);
    v9[2] = objc_msgSend(NSString, "stringWithFormat:", @"RankResults_%d.MatchedSnippet", v3);
    char v5 = (void *)MEMORY[0x1E4F1C978];
    uint64_t v6 = v9;
    uint64_t v7 = 3;
  }
  return (id)[v5 arrayWithObjects:v6 count:v7];
}

- (id)_matchClauseForColumns:(id)a3 requiringAllTerms:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v7 = (void *)[MEMORY[0x1E4F28E78] stringWithString:@" MATCH ' "];
  uint64_t v8 = [(ABNamePredicate *)self tokenizations];
  if (ABTokenListGetCount((uint64_t)v8))
  {
    unint64_t v9 = 0;
    if (v4) {
      v10 = @" AND ";
    }
    else {
      v10 = @" OR ";
    }
    do
    {
      if (v9) {
        [v7 appendFormat:v10];
      }
      objc_msgSend(v7, "appendFormat:", @"(");
      if ([a3 count])
      {
        unint64_t v11 = 0;
        do
        {
          if (v11) {
            [v7 appendFormat:@" OR "];
          }
          [v7 appendFormat:@"%@:' || ? || '", objc_msgSend(a3, "objectAtIndex:", v11++)];
        }
        while (v11 < [a3 count]);
      }
      [v7 appendFormat:@""]);
      ++v9;
    }
    while (v9 < ABTokenListGetCount((uint64_t)v8));
  }
  [v7 appendFormat:@"'"];
  return v7;
}

- (id)queryJoinsInCompound:(BOOL)a3 predicateIdentifier:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  v17[1] = *MEMORY[0x1E4F143B8];
  if (!ABCFTSIsEnabled()) {
    return 0;
  }
  uint64_t v6 = (void *)[MEMORY[0x1E4F28E78] string];
  [v6 appendFormat:@"LEFT JOIN "];
  if ([(ABNamePredicate *)self matchPersonOrCompanyNamesExclusively])
  {
    id v7 = [(ABNamePredicate *)self _personNameKeys];
    objc_msgSend(v6, "appendFormat:", @"(select ROWID as RankRow, ab_cf_tokenizer_namerank(matchinfo(ABPersonFullTextSearch), ?) as Rank, ab_cf_tokenizer_matched_properties(matchinfo(ABPersonFullTextSearch), ?) as MatchedColumns, 1 as HasFTSMatch from ABPersonFullTextSearch join ABPerson on ABPerson.rowid=ABPersonFullTextSearch.rowid WHERE ABPersonFullTextSearch.Organization MATCH ? and Kind=%@"), kABPersonKindOrganization;
    [v6 appendFormat:@" UNION "];
    [v6 appendFormat:@"select ROWID as RankRow, ab_cf_tokenizer_namerank(matchinfo(ABPersonFullTextSearch), ?) as Rank, ab_cf_tokenizer_matched_properties(matchinfo(ABPersonFullTextSearch), ?) as MatchedColumns, 1 as HasFTSMatch from ABPersonFullTextSearch join ABPerson on ABPerson.rowid=ABPersonFullTextSearch.rowid WHERE ABPersonFullTextSearch "];
    objc_msgSend(v6, "appendString:", -[ABNamePredicate _matchClauseForColumns:requiringAllTerms:](self, "_matchClauseForColumns:requiringAllTerms:", v7, 1));
    [v6 appendFormat:@" AND Kind=%@"], kABPersonKindPerson);
  }
  else if (self->_matchSmartDialerFormatsExclusively)
  {
    objc_msgSend(v6, "appendFormat:", @"(select ROWID as RankRow, ab_cf_tokenizer_namerank(matchinfo(ABPersonSmartDialerFullTextSearch), ?) as Rank, ab_cf_tokenizer_sd_matched_properties(matchinfo(ABPersonSmartDialerFullTextSearch), ?) as MatchedColumns, 1 as HasFTSMatch from ABPersonSmartDialerFullTextSearch join ABPerson on ABPerson.rowid=ABPersonSmartDialerFullTextSearch.rowid WHERE ABPersonSmartDialerFullTextSearch MATCH ?");
    [v6 appendFormat:@" UNION "];
    [v6 appendFormat:@"select ROWID as RankRow, ab_cf_tokenizer_namerank(matchinfo(ABPersonFullTextSearch), ?) as Rank, ab_cf_tokenizer_matched_properties(matchinfo(ABPersonFullTextSearch), ?) as MatchedColumns, 1 as HasFTSMatch from ABPersonFullTextSearch join ABPerson on ABPerson.rowid=ABPersonFullTextSearch.rowid WHERE ABPersonFullTextSearch.Phone MATCH ?"], v16);
  }
  else
  {
    unint64_t v9 = [(ABNamePredicate *)self tokenizations];
    BOOL v10 = [(ABNamePredicate *)self generateExceprts];
    unint64_t v11 = &stru_1EF03E278;
    uint64_t v12 = @"snippet(ABPersonFullTextSearch, '\n', '\n', '…', ab_cf_tokenizer_select_snippet_column(matchinfo(ABPersonFullTextSearch)), -5) as MatchedSnippet,";
    if (!v10) {
      uint64_t v12 = &stru_1EF03E278;
    }
    objc_msgSend(v6, "appendFormat:", @"(select fts.ROWID as RankRow, ab_cf_tokenizer_namerank(matchinfo(ABPersonFullTextSearch), ?) as Rank, ab_cf_tokenizer_matched_properties(matchinfo(ABPersonFullTextSearch), ?) as MatchedColumns, %@ 1 as HasFTSMatch from ABPersonFullTextSearch fts "), v12;
    if ([(NSArray *)[(ABNamePredicate *)self scopedContactIdentifiers] count])
    {
      unint64_t v11 = (__CFString *)objc_msgSend(MEMORY[0x1E4F28E78], "stringWithString:", @"fts.rowid IN(");
      if ([(NSArray *)[(ABNamePredicate *)self scopedContactIdentifiers] count])
      {
        unint64_t v13 = 0;
        do
        {
          if (v13) {
            uint64_t v14 = @", ?";
          }
          else {
            uint64_t v14 = @"?";
          }
          [(__CFString *)v11 appendString:v14];
          ++v13;
        }
        while (v13 < [(NSArray *)[(ABNamePredicate *)self scopedContactIdentifiers] count]);
      }
      [(__CFString *)v11 appendString:@" AND"]);
    }
    [v6 appendFormat:@"where %@ ABPersonFullTextSearch MATCH ' ' || ? || ' ", v11];
    if (!self->_matchWholeWords)
    {
      objc_msgSend(v6, "appendString:", @" OR (");
      if (ABTokenListGetCount((uint64_t)v9) >= 1)
      {
        uint64_t v15 = 0;
        do
        {
          if (v15) {
            [v6 appendString:@" AND "];
          }
          [v6 appendString:@" ' || ? || ' "];
          ++v15;
        }
        while (v15 < ABTokenListGetCount((uint64_t)v9));
      }
      [v6 appendString:@""]);
    }
    [v6 appendString:@" '"];
    [v6 appendString:@""]);
  }
  objc_msgSend(v6, "appendFormat:", @" AS RankResults_%d ON abp.ROWID=RankResults_%d.RankRow ", v4, v4);
  v17[0] = v6;
  return (id)[MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
}

- (id)_personNameKeys
{
  unint64_t v13 = (void *)MEMORY[0x1E4F1C978];
  v2 = ABCPersonNameForProperty(kABPersonFirstNamePhoneticProperty);
  uint64_t v3 = ABCPersonNameForProperty(kABPersonMiddleNamePhoneticProperty);
  uint64_t v4 = ABCPersonNameForProperty(kABPersonLastNamePhoneticProperty);
  char v5 = ABCPersonNameForProperty(kABPersonFirstNameProperty);
  uint64_t v6 = ABCPersonNameForProperty(kABPersonMiddleNameProperty);
  id v7 = ABCPersonNameForProperty(kABPersonLastNameProperty);
  uint64_t v8 = ABCPersonNameForProperty(kABPersonPreviousFamilyNameProperty);
  unint64_t v9 = ABCPersonNameForProperty(kABPersonNicknameProperty);
  BOOL v10 = ABCPersonNameForProperty(kABPersonDisplayNameProperty);
  unint64_t v11 = ABCPersonNameForProperty(kABPersonSuffixProperty);
  return (id)objc_msgSend(v13, "arrayWithObjects:", v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, ABCPersonNameForProperty(kABPersonPrefixProperty), 0);
}

- (id)_personNonNameKeys
{
  uint64_t v15 = (void *)MEMORY[0x1E4F1C978];
  uint64_t v14 = ABCPersonNameForProperty(kABPersonOrganizationPhoneticProperty);
  unint64_t v13 = ABCPersonNameForProperty(kABPersonOrganizationProperty);
  v2 = ABCPersonNameForProperty(kABPersonDepartmentProperty);
  uint64_t v3 = ABCPersonNameForProperty(kABPersonNoteProperty);
  uint64_t v4 = ABCPersonNameForProperty(kABPersonBirthdayProperty);
  char v5 = ABCPersonNameForProperty(kABPersonJobTitleProperty);
  uint64_t v6 = ABCPersonNameForProperty(kABPersonPhoneProperty);
  id v7 = ABCPersonNameForProperty(kABPersonEmailProperty);
  uint64_t v8 = ABCPersonNameForProperty(kABPersonAddressProperty);
  unint64_t v9 = ABCPersonNameForProperty(kABPersonSocialProfileProperty);
  BOOL v10 = ABCPersonNameForProperty(kABPersonURLProperty);
  unint64_t v11 = ABCPersonNameForProperty(kABPersonInstantMessageProperty);
  return (id)objc_msgSend(v15, "arrayWithObjects:", v14, v13, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, ABCPersonNameForProperty(kABPersonDateProperty), @"SupplementalCompositeNameTerms", 0);
}

- (id)queryWhereStringForPredicateIdentifier:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  char v5 = (__CFString *)objc_opt_new();
  tokenizationSortKeys = self->_tokenizationSortKeys;
  if (tokenizationSortKeys) {
    releaseTokenizationSortKeys(tokenizationSortKeys);
  }
  if ([(NSArray *)self->_groups count]) {
    char v7 = 1;
  }
  else {
    char v7 = [(NSArray *)self->_sources count] != 0;
  }
  uint64_t v8 = ABAddressBookCopyWhereClauseForLinkedPeopleInGroupsAndSources(self->_matchPreferredName, v7, (CFArrayRef)[(ABNamePredicate *)self groups], (const __CFArray *)[(ABNamePredicate *)self sources], @"abp");
  if (v8) {
    [(__CFString *)v5 appendString:v8];
  }
  if ([(NSString *)self->_name length])
  {
    if (v8) {
      [(__CFString *)v5 appendString:@" AND "];
    }
    if (ABCFTSIsEnabled())
    {
      [(__CFString *)v5 appendFormat:@" RankResults_%d.HasFTSMatch = 1 ", v3];
    }
    else
    {
      WordTokenizer = ABAddressBookGetWordTokenizer((uint64_t)[(ABNamePredicate *)self addressBook]);
      CFArrayRef v10 = ABCCreateArrayOfTokenizationsBySeparatingWordsInCompositeName(WordTokenizer, (const __CFString *)self->_name, 1);
      if (v10)
      {
        CFArrayRef v11 = v10;
        if (CFArrayGetCount(v10) >= 1)
        {
          uint64_t SearchCollator = ABAddressBookGetSearchCollator((uint64_t)self->_addressBook);
          uint64_t v14 = 0;
          -[__CFString appendFormat:](v5, "appendFormat:", @"abp.ROWID in (select abs.person_id from ABPersonSearchKey abs WHERE");
          appendTokenizations(self->_name, v11, SearchCollator, v5, &self->_tokenizationSortKeys, &v14, [(ABNamePredicate *)self matchWholeWords], [(ABNamePredicate *)self matchPersonOrCompanyNamesExclusively]);
          [(__CFString *)v5 appendFormat:@""]);
        }
        CFRelease(v11);
      }
    }
  }
  return v5;
}

- (id)queryRankStringForPredicateIdentifier:(int)a3
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"RankResults_%d.Rank", *(void *)&a3);
}

- (void)ab_bindJoinClauseComponentOfStatement:(CPSqliteStatement *)a3 withBindingOffset:(int *)a4 predicateIdentifier:(int)a5
{
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  if (ABCFTSIsEnabled())
  {
    char v5 = [(ABNamePredicate *)self tokenizations];
    uint64_t v6 = (void *)[MEMORY[0x1E4F28E78] string];
    uint64_t Count = ABTokenListGetCount((uint64_t)v5);
    CFMutableArrayRef Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x1E4F1D510]);
    CFAutorelease(Mutable);
    if (Count)
    {
      for (uint64_t i = 0; i != Count; ++i)
      {
        TokenAtIndex = (const void *)ABTokenListGetTokenAtIndex((uint64_t)v5, i);
        if ([(ABNamePredicate *)self matchWholeWords]) {
          CFArrayRef v11 = &stru_1EF03E278;
        }
        else {
          CFArrayRef v11 = @"*";
        }
        [v6 appendFormat:@"##&%@%@ ", TokenAtIndex, v11];
        CFArrayAppendValue(Mutable, TokenAtIndex);
      }
    }
    CFArrayRef v12 = Mutable;
    uint64_t v74 = Count;
    if ([v6 length])
    {
      if (self->_matchPersonOrCompanyNamesExclusively)
      {
        var1 = a3->var1;
        int v14 = *a4;
        CFTypeRef v15 = CFRetain(Mutable);
        uint64_t v16 = (void (__cdecl *)(void *))MEMORY[0x1E4F1C278];
        sqlite3_bind_blob(var1, v14, v15, 8, MEMORY[0x1E4F1C278]);
        LODWORD(var1) = *a4 + 1;
        *a4 = (int)var1;
        v17 = a3->var1;
        CFTypeRef v18 = CFRetain(Mutable);
        sqlite3_bind_blob(v17, (int)var1, v18, 8, v16);
        LODWORD(var1) = *a4 + 1;
        *a4 = (int)var1;
        v19 = a3->var1;
        v20 = (const char *)_CPCreateUTF8StringFromCFString();
        sqlite3_bind_text(v19, (int)var1, v20, -1, MEMORY[0x1E4F14838]);
        ++*a4;
        id v21 = [(ABNamePredicate *)self _personNameKeys];
        uint64_t v22 = [v21 count];
        v23 = CFArrayCreateMutable(0, v22 * Count, MEMORY[0x1E4F1D510]);
        if ([v21 count])
        {
          unint64_t v24 = 0;
          do
          {
            v84.length = CFArrayGetCount(v12);
            v84.location = 0;
            CFArrayAppendArray(v23, v12, v84);
            ++v24;
          }
          while (v24 < [v21 count]);
        }
        v25 = a3->var1;
        int v26 = *a4;
        CFTypeRef v27 = CFRetain(v23);
        v28 = (void (__cdecl *)(void *))MEMORY[0x1E4F1C278];
        sqlite3_bind_blob(v25, v26, v27, 8, MEMORY[0x1E4F1C278]);
        LODWORD(v25) = *a4 + 1;
        *a4 = (int)v25;
        v29 = a3->var1;
        CFTypeRef v30 = CFRetain(v23);
        v31 = v29;
        v32 = v21;
        sqlite3_bind_blob(v31, (int)v25, v30, 8, v28);
        ++*a4;
        CFRelease(v23);
        if (Count)
        {
          uint64_t v33 = 0;
          do
          {
            if ([v32 count])
            {
              unint64_t v34 = 0;
              do
              {
                uint64_t v35 = ABTokenListGetTokenAtIndex((uint64_t)v5, v33);
                v36 = NSString;
                BOOL v37 = [(ABNamePredicate *)self matchWholeWords];
                v38 = @"*";
                if (v37) {
                  v38 = &stru_1EF03E278;
                }
                [v36 stringWithFormat:@"##&%@%@ ", v35, v38];
                v39 = a3->var1;
                int v40 = *a4;
                v41 = (const char *)_CPCreateUTF8StringFromCFString();
                v42 = v39;
                v32 = v21;
                sqlite3_bind_text(v42, v40, v41, -1, MEMORY[0x1E4F14838]);
                ++*a4;
                ++v34;
              }
              while (v34 < [v21 count]);
            }
            ++v33;
          }
          while (v33 != v74);
        }
      }
      else
      {
        BOOL matchSmartDialerFormatsExclusively = self->_matchSmartDialerFormatsExclusively;
        v44 = a3->var1;
        int v45 = *a4;
        CFTypeRef v46 = CFRetain(v12);
        v47 = (void (__cdecl *)(void *))MEMORY[0x1E4F1C278];
        sqlite3_bind_blob(v44, v45, v46, 8, MEMORY[0x1E4F1C278]);
        LODWORD(v44) = *a4 + 1;
        *a4 = (int)v44;
        v48 = a3->var1;
        CFTypeRef v49 = CFRetain(v12);
        sqlite3_bind_blob(v48, (int)v44, v49, 8, v47);
        int v50 = *a4 + 1;
        *a4 = v50;
        if (matchSmartDialerFormatsExclusively)
        {
          v51 = a3->var1;
          v52 = (const char *)_CPCreateUTF8StringFromCFString();
          v53 = (void (__cdecl *)(void *))MEMORY[0x1E4F14838];
          sqlite3_bind_text(v51, v50, v52, -1, MEMORY[0x1E4F14838]);
          LODWORD(v51) = *a4 + 1;
          *a4 = (int)v51;
          v54 = a3->var1;
          CFTypeRef v55 = CFRetain(v12);
          v56 = (void (__cdecl *)(void *))MEMORY[0x1E4F1C278];
          sqlite3_bind_blob(v54, (int)v51, v55, 8, MEMORY[0x1E4F1C278]);
          LODWORD(v51) = *a4 + 1;
          *a4 = (int)v51;
          v57 = a3->var1;
          CFTypeRef v58 = CFRetain(v12);
          sqlite3_bind_blob(v57, (int)v51, v58, 8, v56);
          LODWORD(v51) = *a4 + 1;
          *a4 = (int)v51;
          v59 = a3->var1;
          v60 = (const char *)_CPCreateUTF8StringFromCFString();
          sqlite3_bind_text(v59, (int)v51, v60, -1, v53);
          ++*a4;
        }
        else
        {
          if ([(NSArray *)[(ABNamePredicate *)self scopedContactIdentifiers] count])
          {
            long long v80 = 0u;
            long long v81 = 0u;
            long long v78 = 0u;
            long long v79 = 0u;
            v61 = [(ABNamePredicate *)self scopedContactIdentifiers];
            uint64_t v62 = [(NSArray *)v61 countByEnumeratingWithState:&v78 objects:v82 count:16];
            if (v62)
            {
              uint64_t v63 = v62;
              uint64_t v64 = *(void *)v79;
              do
              {
                for (uint64_t j = 0; j != v63; ++j)
                {
                  if (*(void *)v79 != v64) {
                    objc_enumerationMutation(v61);
                  }
                  sqlite3_bind_int(a3->var1, *a4, [*(id *)(*((void *)&v78 + 1) + 8 * j) intValue]);
                  ++*a4;
                }
                uint64_t v63 = [(NSArray *)v61 countByEnumeratingWithState:&v78 objects:v82 count:16];
              }
              while (v63);
            }
          }
          v66 = a3->var1;
          int v67 = *a4;
          v68 = (const char *)_CPCreateUTF8StringFromCFString();
          sqlite3_bind_text(v66, v67, v68, -1, MEMORY[0x1E4F14838]);
          ++*a4;
          if (!self->_matchWholeWords && Count != 0)
          {
            uint64_t v70 = 0;
            do
            {
              [NSString stringWithFormat:@"##&%@ ", ABTokenListGetTokenAtIndex((uint64_t)v5, v70)];
              v71 = a3->var1;
              int v72 = *a4;
              v73 = (const char *)_CPCreateUTF8StringFromCFString();
              sqlite3_bind_text(v71, v72, v73, -1, MEMORY[0x1E4F14838]);
              ++*a4;
              ++v70;
            }
            while (v74 != v70);
          }
        }
      }
    }
  }
}

- (void)ab_bindWhereClauseComponentOfStatement:(CPSqliteStatement *)a3 withBindingOffset:(int *)a4 predicateIdentifier:(int)a5
{
  if ([(NSArray *)self->_groups count]) {
    BOOL v8 = 1;
  }
  else {
    BOOL v8 = [(NSArray *)self->_sources count] != 0;
  }
  ABAddressBookBindWhereClauseForLinkedPeopleInGroupsAndSources(v8, (CFArrayRef)[(ABNamePredicate *)self groups], (CFArrayRef)[(ABNamePredicate *)self sources], a3->var1, a4);
  if ((ABCFTSIsEnabled() & 1) == 0)
  {
    tokenizationSortKeys = self->_tokenizationSortKeys;
    bindTokenizations((uint64_t)a3, tokenizationSortKeys, a4);
  }
}

- (id)predicateFormat
{
  uint64_t v3 = NSString;
  uint64_t v4 = [(ABNamePredicate *)self name];
  char v5 = @"YES";
  if ([(ABNamePredicate *)self matchWholeWords]) {
    uint64_t v6 = @"YES";
  }
  else {
    uint64_t v6 = @"NO";
  }
  if ([(ABNamePredicate *)self matchPersonOrCompanyNamesExclusively]) {
    char v7 = @"YES";
  }
  else {
    char v7 = @"NO";
  }
  if ([(ABNamePredicate *)self matchSmartDialerFormatsExclusively]) {
    BOOL v8 = @"YES";
  }
  else {
    BOOL v8 = @"NO";
  }
  if (![(ABNamePredicate *)self matchPreferredName]) {
    char v5 = @"NO";
  }
  return (id)[v3 stringWithFormat:@"ABNamePredicate %p - Name matching <%@> - Match whole words <%@> - Match name only <%@> - Match smart dialer format only <%@> - Match preferred name <%@> - Sources <%@> - Groups <%@>", self, v4, v6, v7, v8, v5, -[ABNamePredicate sources](self, "sources"), -[ABNamePredicate groups](self, "groups")];
}

- (NSString)name
{
  return self->_name;
}

- (NSArray)sources
{
  return self->_sources;
}

- (void)setSources:(id)a3
{
}

- (NSArray)groups
{
  return self->_groups;
}

- (void)setGroups:(id)a3
{
}

- (BOOL)matchWholeWords
{
  return self->_matchWholeWords;
}

- (void)setMatchWholeWords:(BOOL)a3
{
  self->_matchWholeWords = a3;
}

- (BOOL)matchPersonOrCompanyNamesExclusively
{
  return self->_matchPersonOrCompanyNamesExclusively;
}

- (void)setMatchPersonOrCompanyNamesExclusively:(BOOL)a3
{
  self->_matchPersonOrCompanyNamesExclusively = a3;
}

- (BOOL)matchSmartDialerFormatsExclusively
{
  return self->_matchSmartDialerFormatsExclusively;
}

- (void)setMatchSmartDialerFormatsExclusively:(BOOL)a3
{
  self->_BOOL matchSmartDialerFormatsExclusively = a3;
}

- (BOOL)matchPreferredName
{
  return self->_matchPreferredName;
}

- (void)setMatchPreferredName:(BOOL)a3
{
  self->_matchPreferredName = a3;
}

- (BOOL)generateExceprts
{
  return self->_generateExceprts;
}

- (void)setGenerateExceprts:(BOOL)a3
{
  self->_generateExceprts = a3;
}

- (NSArray)scopedContactIdentifiers
{
  return self->_scopedContactIdentifiers;
}

- (void)setScopedContactIdentifiers:(id)a3
{
}

@end