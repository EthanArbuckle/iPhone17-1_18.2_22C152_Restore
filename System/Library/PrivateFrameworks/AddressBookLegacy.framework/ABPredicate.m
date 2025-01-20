@interface ABPredicate
+ (id)newQueryFromABPredicate:(id)a3 withSortOrder:(unsigned int)a4 ranked:(BOOL)a5 addressBook:(void *)a6 propertyIndices:(const __CFDictionary *)a7;
+ (id)newQueryFromCompoundPredicate:(id)a3 withSortOrder:(unsigned int)a4 ranked:(BOOL)a5 addressBook:(void *)a6 propertyIndices:(const __CFDictionary *)a7;
+ (id)newQueryWithProperties:(id)a3 joins:(id)a4 whereString:(id)a5 sortOrder:(unsigned int)a6 rankString:(id)a7 groupByProperties:(id)a8 addressBook:(void *)a9 propertyIndices:(const __CFDictionary *)a10;
+ (id)personPredicateWithAnyValueForProperty:(int)a3;
+ (id)personPredicateWithGroup:(void *)a3 source:(void *)a4 account:(id)a5;
+ (id)personPredicateWithName:(id)a3 addressBook:(void *)a4;
+ (id)personPredicateWithNameLike:(id)a3 addressBook:(void *)a4;
+ (id)personPredicateWithNameLike:(id)a3 group:(void *)a4 source:(void *)a5 account:(id)a6 addressBook:(void *)a7;
+ (id)personPredicateWithNameLike:(id)a3 group:(void *)a4 source:(void *)a5 account:(id)a6 includeSourceInResults:(BOOL)a7 addressBook:(void *)a8;
+ (id)personPredicateWithNameLike:(id)a3 groups:(id)a4 sources:(id)a5 addressBook:(void *)a6;
+ (id)personPredicateWithNameLike:(id)a3 groups:(id)a4 sources:(id)a5 includeSourceInResults:(BOOL)a6 addressBook:(void *)a7;
+ (id)personPredicateWithNameLike:(id)a3 groups:(id)a4 sources:(id)a5 includeSourceInResults:(BOOL)a6 includePhotosInResults:(BOOL)a7 addressBook:(void *)a8;
+ (id)personPredicateWithNameOnly:(id)a3 account:(id)a4 addressBook:(void *)a5;
+ (id)personPredicateWithPhoneLike:(id)a3 countryHint:(id)a4 addressBook:(void *)a5;
+ (id)personPredicateWithSmartDialerStringLike:(id)a3 addressBook:(void *)a4;
+ (id)personPredicateWithValue:(id)a3 comparison:(int64_t)a4 forProperty:(int)a5;
+ (void)searchPeopleWithPredicate:(id)a3 sortOrder:(unsigned int)a4 inAddressBook:(void *)a5 withDelegate:(id)a6;
+ (void)searchPeopleWithPredicate:(id)a3 sortOrder:(unsigned int)a4 ranked:(BOOL)a5 inAddressBook:(void *)a6 withDelegate:(id)a7;
- (ABPredicate)init;
- (BOOL)hasCallback;
- (BOOL)isValid;
- (id)_querySelectStringForPredicateIdentifier:(int)a3;
- (id)ab_newQueryWithSortOrder:(unsigned int)a3 ranked:(BOOL)a4 addressBook:(void *)a5 propertyIndices:(const __CFDictionary *)a6;
- (id)callbackContext;
- (id)predicateFormat;
- (id)queryGroupByProperties;
- (id)queryJoinsInCompound:(BOOL)a3 predicateIdentifier:(int)a4;
- (id)queryRankStringForPredicateIdentifier:(int)a3;
- (id)querySelectPropertiesForPredicateIdentifier:(int)a3;
- (id)querySerializationIdentifier;
- (id)queryWhereStringForPredicateIdentifier:(int)a3;
- (void)ab_addCallbackContextToArray:(id)a3;
- (void)bindDouble:(double)a3 toStatement:(CPSqliteStatement *)a4 withBindingOffset:(int *)a5;
- (void)bindString:(id)a3 toStatement:(CPSqliteStatement *)a4 withBindingOffset:(int *)a5;
- (void)dealloc;
@end

@implementation ABPredicate

+ (id)personPredicateWithNameLike:(id)a3 addressBook:(void *)a4
{
  v6 = objc_opt_new();
  [v6 setAddressBook:a4];
  [v6 setName:a3];
  if (([v6 isValid] & 1) == 0)
  {

    v6 = 0;
  }
  return v6;
}

+ (id)personPredicateWithNameLike:(id)a3 group:(void *)a4 source:(void *)a5 account:(id)a6 addressBook:(void *)a7
{
  return (id)[a1 personPredicateWithNameLike:a3 group:a4 source:a5 account:a6 includeSourceInResults:0 addressBook:a7];
}

+ (id)personPredicateWithNameLike:(id)a3 group:(void *)a4 source:(void *)a5 account:(id)a6 includeSourceInResults:(BOOL)a7 addressBook:(void *)a8
{
  BOOL v9 = a7;
  if (a4)
  {
    uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObject:a4];
    if (a5) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v14 = 0;
    if (a5)
    {
LABEL_3:
      id v15 = (id)[MEMORY[0x1E4F1C978] arrayWithObject:a5];
      if (!a6) {
        goto LABEL_10;
      }
      goto LABEL_7;
    }
  }
  id v15 = 0;
  if (!a6) {
    goto LABEL_10;
  }
LABEL_7:
  if (!v14 && !v15) {
    id v15 = (id)ABAddressBookCopyArrayOfAllSourcesWithAccountIdentifier((uint64_t)a8, (uint64_t)a6);
  }
LABEL_10:
  return (id)[a1 personPredicateWithNameLike:a3 groups:v14 sources:v15 includeSourceInResults:v9 addressBook:a8];
}

+ (id)personPredicateWithNameLike:(id)a3 groups:(id)a4 sources:(id)a5 addressBook:(void *)a6
{
  return (id)[a1 personPredicateWithNameLike:a3 groups:a4 sources:a5 includeSourceInResults:0 addressBook:a6];
}

+ (id)personPredicateWithNameLike:(id)a3 groups:(id)a4 sources:(id)a5 includeSourceInResults:(BOOL)a6 addressBook:(void *)a7
{
  return (id)[a1 personPredicateWithNameLike:a3 groups:a4 sources:a5 includeSourceInResults:a6 includePhotosInResults:1 addressBook:a7];
}

+ (id)personPredicateWithNameLike:(id)a3 groups:(id)a4 sources:(id)a5 includeSourceInResults:(BOOL)a6 includePhotosInResults:(BOOL)a7 addressBook:(void *)a8
{
  BOOL v9 = a7;
  BOOL v10 = a6;
  if ([a5 count])
  {
    ABRecordRef v15 = (id)[a5 objectAtIndex:0];
  }
  else
  {
    if (![a4 count])
    {
      v16 = 0;
      goto LABEL_6;
    }
    ABRecordRef v15 = ABGroupCopySource((ABRecordRef)[a4 objectAtIndex:0]);
  }
  v16 = v15;
LABEL_6:
  if (!ABSourceIsRemote((uint64_t)v16)
    || (AccountForSource = (const void *)ABAddressBookGetAccountForSource((uint64_t)a8, (uint64_t)v16)) == 0
    || (CFTypeRef v18 = ABAccountCopyIdentifier(AccountForSource)) == 0)
  {
    v20 = 0;
    if (!v16) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  v19 = v18;
  v20 = [[ABServerSearchPredicate alloc] initWithSearchString:a3 source:v16 account:v18 includeSourceInResults:v10 includePhotosInResults:v9];
  CFRelease(v19);
  if (v16) {
LABEL_12:
  }
    CFRelease(v16);
LABEL_13:
  if (!v20)
  {
    v20 = (ABServerSearchPredicate *)[a1 personPredicateWithNameLike:a3 addressBook:a8];
    [(ABServerSearchPredicate *)v20 setSources:a5];
    [(ABServerSearchPredicate *)v20 setGroups:a4];
  }
  return v20;
}

+ (id)personPredicateWithName:(id)a3 addressBook:(void *)a4
{
  v4 = (void *)[a1 personPredicateWithNameLike:a3 addressBook:a4];
  [v4 setMatchWholeWords:1];
  return v4;
}

+ (id)personPredicateWithNameOnly:(id)a3 account:(id)a4 addressBook:(void *)a5
{
  v6 = (void *)[a1 personPredicateWithNameLike:a3 addressBook:a5];
  [v6 setMatchWholeWords:1];
  [v6 setMatchPersonOrCompanyNamesExclusively:1];
  [v6 setMatchPreferredName:0];
  if (a4)
  {
    [v6 setAccountIdentifier:a4];
    if (!objc_msgSend((id)objc_msgSend(v6, "sources"), "count")) {
      return 0;
    }
  }
  return v6;
}

+ (id)personPredicateWithSmartDialerStringLike:(id)a3 addressBook:(void *)a4
{
  v4 = (void *)[a1 personPredicateWithNameLike:a3 addressBook:a4];
  [v4 setMatchSmartDialerFormatsExclusively:1];
  return v4;
}

+ (id)personPredicateWithValue:(id)a3 comparison:(int64_t)a4 forProperty:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  v8 = objc_opt_new();
  [v8 setValue:a3];
  [v8 setProperty:v5];
  [v8 setComparison:a4];
  if (([v8 isValid] & 1) == 0)
  {

    v8 = 0;
  }
  return v8;
}

+ (id)personPredicateWithAnyValueForProperty:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v4 = objc_opt_new();
  [v4 setProperty:v3];
  if (([v4 isValid] & 1) == 0)
  {

    v4 = 0;
  }
  return v4;
}

+ (id)personPredicateWithPhoneLike:(id)a3 countryHint:(id)a4 addressBook:(void *)a5
{
  v7 = objc_opt_new();
  [v7 setCountry:a4];
  [v7 setPhoneNumber:a3];
  if (([v7 isValid] & 1) == 0)
  {

    v7 = 0;
  }
  return v7;
}

+ (id)personPredicateWithGroup:(void *)a3 source:(void *)a4 account:(id)a5
{
  v8 = objc_opt_new();
  [v8 setGroup:a3];
  [v8 setStore:a4];
  [v8 setAccountIdentifier:a5];
  if (([v8 isValid] & 1) == 0)
  {

    v8 = 0;
  }
  return v8;
}

+ (id)newQueryWithProperties:(id)a3 joins:(id)a4 whereString:(id)a5 sortOrder:(unsigned int)a6 rankString:(id)a7 groupByProperties:(id)a8 addressBook:(void *)a9 propertyIndices:(const __CFDictionary *)a10
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  ColumnListWithAliasAndExtraColumns = (void *)CPRecordStoreCreateColumnListWithAliasAndExtraColumns();
  v17 = ColumnListWithAliasAndExtraColumns;
  if (a3) {
    [ColumnListWithAliasAndExtraColumns appendString:a3];
  }
  [v17 appendString:@" FROM ABPerson abp "];
  if (a4)
  {
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    uint64_t v18 = [a4 countByEnumeratingWithState:&v33 objects:v37 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v34 != v20) {
            objc_enumerationMutation(a4);
          }
          [v17 appendString:*(void *)(*((void *)&v33 + 1) + 8 * i)];
          [v17 appendString:@" "];
        }
        uint64_t v19 = [a4 countByEnumeratingWithState:&v33 objects:v37 count:16];
      }
      while (v19);
    }
  }
  if (a5)
  {
    [v17 appendString:@"WHERE "];
    [v17 appendString:a5];
  }
  uint64_t v22 = [a8 count];
  if (v22 >= 1)
  {
    uint64_t v23 = v22;
    objc_msgSend(v17, "appendString:", @" GROUP BY (");
    for (unint64_t j = 0; j != v23; ++j)
    {
      uint64_t v25 = [a8 objectAtIndex:j];
      if (j >= 2) {
        [v17 appendString:@", "];
      }
      [v17 appendString:v25];
    }
    [v17 appendString:@""]);
  }
  if (a6 != -1)
  {
    if (a6) {
      v26 = @" ORDER BY LastSortLanguageIndex, LastSortSection, LastSort";
    }
    else {
      v26 = @" ORDER BY FirstSortLanguageIndex, FirstSortSection, FirstSort";
    }
    [v17 appendString:v26];
  }
  if ([a7 length])
  {
    uint64_t v27 = [v17 rangeOfString:@"ORDER BY" options:5];
    if (v27 == 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v29 = [v17 length];
      v30 = @" ORDER BY ";
      v31 = &stru_1EF03E278;
    }
    else
    {
      uint64_t v29 = v27 + v28;
      v30 = @" ";
      v31 = @", ";
    }
    [v17 insertString:objc_msgSend(NSString, "stringWithFormat:", @"%@%@ DESC %@", v30, a7, v31), v29 atIndex];
  }
  return v17;
}

+ (id)newQueryFromABPredicate:(id)a3 withSortOrder:(unsigned int)a4 ranked:(BOOL)a5 addressBook:(void *)a6 propertyIndices:(const __CFDictionary *)a7
{
  BOOL v9 = a5;
  uint64_t v10 = *(void *)&a4;
  uint64_t v13 = [a3 _querySelectStringForPredicateIdentifier:0];
  uint64_t v14 = [a3 queryJoinsInCompound:0 predicateIdentifier:0];
  uint64_t v15 = [a3 queryWhereStringForPredicateIdentifier:0];
  if (v9) {
    uint64_t v16 = [a3 queryRankStringForPredicateIdentifier:0];
  }
  else {
    uint64_t v16 = 0;
  }
  return (id)objc_msgSend(a1, "newQueryWithProperties:joins:whereString:sortOrder:rankString:groupByProperties:addressBook:propertyIndices:", v13, v14, v15, v10, v16, objc_msgSend(a3, "queryGroupByProperties"), a6, a7);
}

+ (id)newQueryFromCompoundPredicate:(id)a3 withSortOrder:(unsigned int)a4 ranked:(BOOL)a5 addressBook:(void *)a6 propertyIndices:(const __CFDictionary *)a7
{
  BOOL v61 = a5;
  uint64_t v105 = *MEMORY[0x1E4F143B8];
  ColumnListWithAliasAndExtraColumns = (void *)CPRecordStoreCreateColumnListWithAliasAndExtraColumns();
  uint64_t v9 = [a3 compoundPredicateType];
  uint64_t v10 = @" OR ";
  v11 = @" AND ";
  if (v9 != 1) {
    v11 = 0;
  }
  BOOL v12 = v9 == 2 || v9 == 1;
  if (v9 != 2) {
    uint64_t v10 = v11;
  }
  v63 = v10;
  long long v94 = 0u;
  long long v95 = 0u;
  long long v96 = 0u;
  long long v97 = 0u;
  obuint64_t j = (id)[a3 subpredicates];
  uint64_t v13 = [obj countByEnumeratingWithState:&v94 objects:v104 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = 0;
    uint64_t v16 = *(void *)v95;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v95 != v16) {
          objc_enumerationMutation(obj);
        }
        uint64_t v18 = [*(id *)(*((void *)&v94 + 1) + 8 * i) _querySelectStringForPredicateIdentifier:v15 + i];
        if (v18) {
          [ColumnListWithAliasAndExtraColumns appendString:v18];
        }
      }
      uint64_t v14 = [obj countByEnumeratingWithState:&v94 objects:v104 count:16];
      uint64_t v15 = (v15 + i);
    }
    while (v14);
  }
  BOOL v60 = v12;
  [ColumnListWithAliasAndExtraColumns appendString:@" FROM ABPerson abp "];
  uint64_t v19 = objc_opt_new();
  long long v90 = 0u;
  long long v91 = 0u;
  long long v92 = 0u;
  long long v93 = 0u;
  uint64_t v67 = [obj countByEnumeratingWithState:&v90 objects:v103 count:16];
  if (v67)
  {
    uint64_t v20 = 0;
    uint64_t v65 = *(void *)v91;
    do
    {
      for (uint64_t j = 0; j != v67; ++j)
      {
        if (*(void *)v91 != v65) {
          objc_enumerationMutation(obj);
        }
        uint64_t v22 = (void *)[*(id *)(*((void *)&v90 + 1) + 8 * j) queryJoinsInCompound:1 predicateIdentifier:v20];
        long long v86 = 0u;
        long long v87 = 0u;
        long long v88 = 0u;
        long long v89 = 0u;
        uint64_t v23 = [v22 countByEnumeratingWithState:&v86 objects:v102 count:16];
        if (v23)
        {
          uint64_t v24 = v23;
          uint64_t v25 = *(void *)v87;
          do
          {
            for (uint64_t k = 0; k != v24; ++k)
            {
              if (*(void *)v87 != v25) {
                objc_enumerationMutation(v22);
              }
              uint64_t v27 = *(void *)(*((void *)&v86 + 1) + 8 * k);
              if (([v19 containsObject:v27] & 1) == 0)
              {
                [ColumnListWithAliasAndExtraColumns appendString:v27];
                [ColumnListWithAliasAndExtraColumns appendString:@" "];
                [v19 addObject:v27];
              }
            }
            uint64_t v24 = [v22 countByEnumeratingWithState:&v86 objects:v102 count:16];
          }
          while (v24);
        }
        uint64_t v20 = (v20 + 1);
      }
      uint64_t v67 = [obj countByEnumeratingWithState:&v90 objects:v103 count:16];
    }
    while (v67);
  }

  [ColumnListWithAliasAndExtraColumns appendString:@"WHERE "];
  long long v84 = 0u;
  long long v85 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  uint64_t v28 = [obj countByEnumeratingWithState:&v82 objects:v101 count:16];
  if (v28)
  {
    uint64_t v29 = v28;
    int v30 = 0;
    uint64_t v31 = 0;
    uint64_t v32 = *(void *)v83;
    do
    {
      for (uint64_t m = 0; m != v29; ++m)
      {
        if (*(void *)v83 != v32) {
          objc_enumerationMutation(obj);
        }
        long long v34 = (void *)[*(id *)(*((void *)&v82 + 1) + 8 * m) queryWhereStringForPredicateIdentifier:v31 + m];
        if ((v60 & v30) == 1) {
          [ColumnListWithAliasAndExtraColumns appendString:v63];
        }
        if ([v34 length])
        {
          objc_msgSend(ColumnListWithAliasAndExtraColumns, "appendString:", @"(");
          [ColumnListWithAliasAndExtraColumns appendString:v34];
          [ColumnListWithAliasAndExtraColumns appendString:@""]);
          int v30 = 1;
        }
      }
      uint64_t v29 = [obj countByEnumeratingWithState:&v82 objects:v101 count:16];
      uint64_t v31 = (v31 + m);
    }
    while (v29);
  }
  if (v61)
  {
    long long v35 = (void *)[MEMORY[0x1E4F28E78] string];
    long long v78 = 0u;
    long long v79 = 0u;
    long long v80 = 0u;
    long long v81 = 0u;
    uint64_t v36 = [obj countByEnumeratingWithState:&v78 objects:v100 count:16];
    v64 = v35;
    if (v36)
    {
      uint64_t v37 = v36;
      char v38 = 0;
      uint64_t v39 = 0;
      uint64_t v40 = *(void *)v79;
      do
      {
        for (uint64_t n = 0; n != v37; ++n)
        {
          if (*(void *)v79 != v40) {
            objc_enumerationMutation(obj);
          }
          uint64_t v42 = [*(id *)(*((void *)&v78 + 1) + 8 * n) queryRankStringForPredicateIdentifier:v39 + n];
          if (v42)
          {
            uint64_t v43 = v42;
            if (v38) {
              [v35 appendString:@" + "];
            }
            [v35 appendString:v43];
          }
          v38 |= ColumnListWithAliasAndExtraColumns != 0;
        }
        uint64_t v37 = [obj countByEnumeratingWithState:&v78 objects:v100 count:16];
        uint64_t v39 = (v39 + n);
      }
      while (v37);
    }
  }
  else
  {
    v64 = 0;
  }
  v44 = objc_opt_new();
  long long v74 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  uint64_t v68 = [obj countByEnumeratingWithState:&v74 objects:v99 count:16];
  if (v68)
  {
    uint64_t v66 = *(void *)v75;
    do
    {
      for (iuint64_t i = 0; ii != v68; ++ii)
      {
        if (*(void *)v75 != v66) {
          objc_enumerationMutation(obj);
        }
        v46 = (void *)[*(id *)(*((void *)&v74 + 1) + 8 * ii) queryGroupByProperties];
        long long v70 = 0u;
        long long v71 = 0u;
        long long v72 = 0u;
        long long v73 = 0u;
        uint64_t v47 = [v46 countByEnumeratingWithState:&v70 objects:v98 count:16];
        if (v47)
        {
          uint64_t v48 = v47;
          uint64_t v49 = *(void *)v71;
          do
          {
            for (juint64_t j = 0; jj != v48; ++jj)
            {
              if (*(void *)v71 != v49) {
                objc_enumerationMutation(v46);
              }
              uint64_t v51 = *(void *)(*((void *)&v70 + 1) + 8 * jj);
              if (([v44 containsObject:v51] & 1) == 0)
              {
                if ([v44 count]) {
                  v52 = @", ";
                }
                else {
                  v52 = @" GROUP BY ";
                }
                [ColumnListWithAliasAndExtraColumns appendString:v52];
                [ColumnListWithAliasAndExtraColumns appendString:v51];
                [v44 addObject:v51];
              }
            }
            uint64_t v48 = [v46 countByEnumeratingWithState:&v70 objects:v98 count:16];
          }
          while (v48);
        }
      }
      uint64_t v68 = [obj countByEnumeratingWithState:&v74 objects:v99 count:16];
    }
    while (v68);
  }

  if (a4 != -1)
  {
    if (a4) {
      v53 = @" ORDER BY LastSortLanguageIndex, LastSortSection, LastSort";
    }
    else {
      v53 = @" ORDER BY FirstSortLanguageIndex, FirstSortSection, FirstSort";
    }
    [ColumnListWithAliasAndExtraColumns appendString:v53];
  }
  if ([v64 length])
  {
    uint64_t v54 = [ColumnListWithAliasAndExtraColumns rangeOfString:@"ORDER BY" options:5];
    if (v54 == 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v56 = [ColumnListWithAliasAndExtraColumns length];
      v57 = @" ORDER BY ";
      v58 = &stru_1EF03E278;
    }
    else
    {
      uint64_t v56 = v54 + v55;
      v57 = @" ";
      v58 = @", ";
    }
    [ColumnListWithAliasAndExtraColumns insertString:objc_msgSend(NSString, "stringWithFormat:", @"%@%@%@", v57, v64, v58), v56 atIndex];
  }
  return ColumnListWithAliasAndExtraColumns;
}

+ (void)searchPeopleWithPredicate:(id)a3 sortOrder:(unsigned int)a4 inAddressBook:(void *)a5 withDelegate:(id)a6
{
}

+ (void)searchPeopleWithPredicate:(id)a3 sortOrder:(unsigned int)a4 ranked:(BOOL)a5 inAddressBook:(void *)a6 withDelegate:(id)a7
{
  BOOL v9 = a5;
  uint64_t v10 = *(void *)&a4;
  if (a3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"ABPredicate.m", 490, @"Only address book specific predicates and compound predicates are supported");
      }
    }
  }
  objc_msgSend(a3, "ab_runPredicateWithSortOrder:ranked:inAddressBook:withDelegate:", v10, v9, a6, a7);
}

- (ABPredicate)init
{
  v3.receiver = self;
  v3.super_class = (Class)ABPredicate;
  return [(ABPredicate *)&v3 init];
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)ABPredicate;
  [(ABPredicate *)&v2 dealloc];
}

- (id)predicateFormat
{
  return (id)[NSString stringWithFormat:@"ABPredicate (%@) %p", objc_opt_class(), self];
}

- (BOOL)isValid
{
  return 0;
}

- (id)querySelectPropertiesForPredicateIdentifier:(int)a3
{
  return 0;
}

- (id)_querySelectStringForPredicateIdentifier:(int)a3
{
  id v3 = [(ABPredicate *)self querySelectPropertiesForPredicateIdentifier:*(void *)&a3];
  id result = (id)[v3 count];
  if (result) {
    return (id)[NSString stringWithFormat:@", %@", objc_msgSend(v3, "componentsJoinedByString:", @", ")];
  }
  return result;
}

- (id)queryJoinsInCompound:(BOOL)a3 predicateIdentifier:(int)a4
{
  return 0;
}

- (id)queryGroupByProperties
{
  return 0;
}

- (id)queryWhereStringForPredicateIdentifier:(int)a3
{
  return 0;
}

- (id)queryRankStringForPredicateIdentifier:(int)a3
{
  return 0;
}

- (BOOL)hasCallback
{
  return 0;
}

- (id)callbackContext
{
  return 0;
}

- (void)bindString:(id)a3 toStatement:(CPSqliteStatement *)a4 withBindingOffset:(int *)a5
{
  v7 = (const char *)_CPCreateUTF8StringFromCFString();
  int v8 = sqlite3_bind_text(a4->var1, *a5, v7, -1, MEMORY[0x1E4F14838]);
  ++*a5;
  if (v8)
  {
    ABDiagnosticsEnabled();
    _ABLog2(3, (uint64_t)"-[ABPredicate bindString:toStatement:withBindingOffset:]", 581, 0, @"Binding error at index %d", v9, v10, v11, *a5);
  }
}

- (void)bindDouble:(double)a3 toStatement:(CPSqliteStatement *)a4 withBindingOffset:(int *)a5
{
}

- (id)querySerializationIdentifier
{
  return 0;
}

- (void)ab_addCallbackContextToArray:(id)a3
{
  id v5 = [(ABPredicate *)self callbackContext];
  if (!v5) {
    id v5 = (id)[MEMORY[0x1E4F1CA98] null];
  }
  objc_msgSend(a3, "addObject:", objc_msgSend(MEMORY[0x1E4F29238], "valueWithNonretainedObject:", self));
  [a3 addObject:v5];
}

- (id)ab_newQueryWithSortOrder:(unsigned int)a3 ranked:(BOOL)a4 addressBook:(void *)a5 propertyIndices:(const __CFDictionary *)a6
{
  return +[ABPredicate newQueryFromABPredicate:self withSortOrder:*(void *)&a3 ranked:a4 addressBook:a5 propertyIndices:a6];
}

@end