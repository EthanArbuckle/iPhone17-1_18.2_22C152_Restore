@interface CRRecentContact
+ (BOOL)supportsSecureCoding;
- (BOOL)hasFullTextMatch:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isGroup;
- (CRRecentContact)initWithAddress:(id)a3 displayName:(id)a4 kind:(id)a5 recentDate:(id)a6 recentsDomain:(id)a7;
- (CRRecentContact)initWithCoder:(id)a3;
- (CRRecentContact)initWithContactID:(int64_t)a3;
- (CRRecentContact)initWithMembers:(id)a3 displayName:(id)a4 recentDate:(id)a5 recentsDomain:(id)a6;
- (NSArray)members;
- (NSArray)recentDates;
- (NSDate)leastRecentDate;
- (NSDate)mostRecentDate;
- (NSDictionary)metadata;
- (NSNumber)decayedWeight;
- (NSNumber)weight;
- (NSString)address;
- (NSString)displayName;
- (NSString)groupName;
- (NSString)kind;
- (NSString)lastSendingAddress;
- (NSString)originalSource;
- (NSString)rawAddress;
- (NSString)recentsDomain;
- (__CFStringTokenizer)_wordTokenizerForString:(id)a3 locale:(id)a4;
- (id)archivableContactID;
- (id)archivableGroupKind;
- (id)archivableMetadata;
- (id)archivableRecentID;
- (id)description;
- (id)sanitizedDescription;
- (int64_t)contactID;
- (int64_t)recentID;
- (unint64_t)countOfRecents;
- (unint64_t)groupKind;
- (unint64_t)hash;
- (unint64_t)insertionIndexForDate:(id)a3 wouldBeUnique:(BOOL *)a4;
- (void)_enumerateWordsInString:(id)a3 usingBlock:(id)a4;
- (void)appendSanitizedDescriptionTo:(id)a3;
- (void)applyWeight:(id)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)enumerateArchivablePropertiesWithBlock:(id)a3;
- (void)insertDate:(id)a3 atIndex:(unint64_t)a4 required:(BOOL)a5;
- (void)lazilyCreateRecentDates;
- (void)recordRecentEventForDate:(id)a3 userInitiated:(BOOL)a4;
- (void)setAddress:(id)a3;
- (void)setArchivableContactID:(id)a3;
- (void)setArchivableGroupKind:(id)a3;
- (void)setArchivableGroupMembers:(id)a3;
- (void)setArchivableMetadata:(id)a3;
- (void)setArchivableRecentID:(id)a3;
- (void)setContactID:(int64_t)a3;
- (void)setDecayedWeight:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setGroupKind:(unint64_t)a3;
- (void)setGroupName:(id)a3;
- (void)setKind:(id)a3;
- (void)setLastSendingAddress:(id)a3;
- (void)setMembers:(id)a3;
- (void)setMetadata:(id)a3;
- (void)setOriginalSource:(id)a3;
- (void)setRawAddress:(id)a3;
- (void)setRecentDates:(id)a3;
- (void)setRecentID:(int64_t)a3;
- (void)setRecentsDomain:(id)a3;
- (void)setWeight:(id)a3;
@end

@implementation CRRecentContact

- (CRRecentContact)initWithContactID:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CRRecentContact;
  result = [(CRRecentContact *)&v5 init];
  if (result) {
    result->_contactID = a3;
  }
  return result;
}

- (CRRecentContact)initWithAddress:(id)a3 displayName:(id)a4 kind:(id)a5 recentDate:(id)a6 recentsDomain:(id)a7
{
  if (a7)
  {
    if (a3) {
      goto LABEL_3;
    }
LABEL_11:
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CRRecentContact.m", 66, @"Invalid parameter not satisfying: %@", @"address");
    if (a5) {
      goto LABEL_4;
    }
    goto LABEL_12;
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CRRecentContact.m", 65, @"Invalid parameter not satisfying: %@", @"recentsDomain");
  if (!a3) {
    goto LABEL_11;
  }
LABEL_3:
  if (a5) {
    goto LABEL_4;
  }
LABEL_12:
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CRRecentContact.m", 67, @"Invalid parameter not satisfying: %@", @"kind");
LABEL_4:
  v14 = [(CRRecentContact *)self initWithContactID:0x7FFFFFFFLL];
  v15 = v14;
  if (v14)
  {
    v14->_recentID = 0x7FFFFFFFFFFFFFFFLL;
    v14->_recentsDomain = (NSString *)[a7 copy];
    v15->_address = (NSString *)[a3 copy];
    v15->_kind = (NSString *)[a5 copy];
    if (a4 && [a4 caseInsensitiveCompare:a3]) {
      v15->_displayName = (NSString *)[a4 copy];
    }
    v15->_recentDates = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", a6, 0);
    v15->_groupKind = 0;
  }
  return v15;
}

- (CRRecentContact)initWithMembers:(id)a3 displayName:(id)a4 recentDate:(id)a5 recentsDomain:(id)a6
{
  if (a6)
  {
    if (a3) {
      goto LABEL_3;
    }
  }
  else
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CRRecentContact.m", 92, @"Invalid parameter not satisfying: %@", @"recentsDomain");
    if (a3) {
      goto LABEL_3;
    }
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CRRecentContact.m", 93, @"Invalid parameter not satisfying: %@", @"members");
LABEL_3:
  v12 = [(CRRecentContact *)self initWithContactID:0x7FFFFFFFLL];
  [(CRRecentContact *)v12 setRecentID:0x7FFFFFFFFFFFFFFFLL];
  [(CRRecentContact *)v12 setDisplayName:a4];
  [(CRRecentContact *)v12 setKind:@"group"];
  [(CRRecentContact *)v12 setRecentsDomain:a6];
  if (a5) {
    -[CRRecentContact setRecentDates:](v12, "setRecentDates:", [MEMORY[0x1E4F1CA48] arrayWithObject:a5]);
  }
  if (v12) {
    [(CRRecentContact *)v12 setMembers:a3];
  }
  return v12;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CRRecentContact;
  [(CRRecentContact *)&v3 dealloc];
}

- (id)description
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  objc_super v3 = (void *)[MEMORY[0x1E4F28E78] string];
  [(CRRecentContact *)self appendSanitizedDescriptionTo:v3];
  [v3 appendFormat:@" %@ <%@:%@>", self->_displayName, self->_kind, self->_address];
  if ([(CRRecentContact *)self isGroup])
  {
    unint64_t groupKind = self->_groupKind;
    objc_super v5 = groupKind > 2 ? 0 : off_1E5CFBE58[groupKind];
    [v3 appendFormat:@" groupKind: %@", v5];
    [v3 appendString:@"\n      Members:\n"];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    v6 = [(CRRecentContact *)self members];
    uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v13;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v6);
          }
          [v3 appendFormat:@"      %@\n", *(void *)(*((void *)&v12 + 1) + 8 * v10++)];
        }
        while (v8 != v10);
        uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v8);
    }
  }
  [v3 appendString:@">"];
  return v3;
}

- (id)sanitizedDescription
{
  objc_super v3 = (void *)[MEMORY[0x1E4F28E78] string];
  [(CRRecentContact *)self appendSanitizedDescriptionTo:v3];
  [v3 appendString:@">"];
  return v3;
}

- (void)appendSanitizedDescriptionTo:(id)a3
{
  objc_super v5 = (objc_class *)objc_opt_class();
  [a3 appendFormat:@"<%@ %p", NSStringFromClass(v5), self];
  if (self->_recentID == 0x7FFFFFFFFFFFFFFFLL) {
    [a3 appendString:@" rid=<null-recent-id>"];
  }
  else {
    objc_msgSend(a3, "appendFormat:", @" rid=%lld", self->_recentID);
  }
  if (self->_contactID == 0x7FFFFFFF) {
    [a3 appendString:@" cid=<null-contact-id>"];
  }
  else {
    objc_msgSend(a3, "appendFormat:", @" cid=%lld", self->_contactID);
  }
  objc_msgSend(a3, "appendFormat:", @" metadata-keys=%lu", -[NSDictionary count](self->_metadata, "count"));
  BOOL v6 = [(CRRecentContact *)self isGroup];
  uint64_t v7 = "n";
  if (v6) {
    uint64_t v7 = "y";
  }
  objc_msgSend(a3, "appendFormat:", @" isGroup=%s", v7);
}

- (BOOL)isGroup
{
  v2 = [(CRRecentContact *)self kind];
  return [(NSString *)v2 isEqualToString:@"group"];
}

- (__CFStringTokenizer)_wordTokenizerForString:(id)a3 locale:(id)a4
{
  CFLocaleRef v4 = (const __CFLocale *)a4;
  if (!a4) {
    CFLocaleRef v4 = (const __CFLocale *)[MEMORY[0x1E4F1CA20] systemLocale];
  }
  BOOL v6 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F29060], "currentThread"), "threadDictionary");
  uint64_t v7 = (void *)[v6 objectForKeyedSubscript:@"CRCachedWordTokenizerLocale"];
  uint64_t v8 = [v6 objectForKeyedSubscript:@"CRCachedWordTokenizer"];
  CFStringTokenizerRef v9 = (CFStringTokenizerRef)v8;
  if (v7) {
    BOOL v10 = v8 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (v10)
  {
    if (!v8)
    {
LABEL_11:
      v13.length = [a3 length];
      v13.location = 0;
      CFStringTokenizerRef v9 = CFStringTokenizerCreate(0, (CFStringRef)a3, v13, 4uLL, v4);
      [v6 setObject:CFAutorelease(v9) forKeyedSubscript:@"CRCachedWordTokenizer"];
      [v6 setObject:v4 forKeyedSubscript:@"CRCachedWordTokenizerLocale"];
      return v9;
    }
  }
  else if (([v7 isEqual:v4] & 1) == 0)
  {
    goto LABEL_11;
  }
  v12.length = [a3 length];
  v12.location = 0;
  CFStringTokenizerSetString(v9, (CFStringRef)a3, v12);
  return v9;
}

- (void)_enumerateWordsInString:(id)a3 usingBlock:(id)a4
{
  objc_super v5 = -[CRRecentContact _wordTokenizerForString:locale:](self, "_wordTokenizerForString:locale:", a3, [MEMORY[0x1E4F1CA20] currentLocale]);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  CFStringTokenizerRef v9 = __54__CRRecentContact__enumerateWordsInString_usingBlock___block_invoke;
  BOOL v10 = &__block_descriptor_40_e5_Q8__0l;
  v11 = v5;
  char v7 = 0;
  if (__54__CRRecentContact__enumerateWordsInString_usingBlock___block_invoke((uint64_t)v8))
  {
    do
    {
      CFRange CurrentTokenRange = CFStringTokenizerGetCurrentTokenRange(v5);
      (*((void (**)(id, CFIndex, CFIndex, char *))a4 + 2))(a4, CurrentTokenRange.location, CurrentTokenRange.length, &v7);
    }
    while (!v7 && (uint64_t)v9((uint64_t)v8));
  }
}

CFStringTokenizerTokenType __54__CRRecentContact__enumerateWordsInString_usingBlock___block_invoke(uint64_t a1)
{
  do
  {
    while (1)
    {
      CFStringTokenizerTokenType Token = CFStringTokenizerAdvanceToNextToken(*(CFStringTokenizerRef *)(a1 + 32));
      CFStringTokenizerTokenType v3 = Token;
      if (!Token) {
        break;
      }
      if ((Token & 0x10) == 0) {
        return v3;
      }
    }
  }
  while (CFStringTokenizerGetCurrentTokenRange((CFStringTokenizerRef)*(void *)(a1 + 32)).location != -1);
  return v3;
}

- (BOOL)hasFullTextMatch:(id)a3
{
  objc_super v5 = &v15;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x2020000000;
  BOOL v18 = 0;
  address = self->_address;
  if (address)
  {
    BOOL v7 = [(NSString *)address caseInsensitiveCompare:a3] == NSOrderedSame;
    objc_super v5 = v16;
  }
  else
  {
    BOOL v7 = 0;
  }
  BOOL v18 = v7;
  if (!*((unsigned char *)v5 + 24))
  {
    if ([(NSString *)self->_kind isEqualToString:@"email"])
    {
      unint64_t v8 = [(NSString *)self->_address cr_rangeOfAddressDomain];
      if (v8 >= 3 && v8 != 0x7FFFFFFFFFFFFFFFLL)
      {
        BOOL v9 = -[NSString compare:options:range:](self->_address, "compare:options:range:", a3, 9, 0, v8 - ([a3 hasSuffix:@"@"] ^ 1)) == NSOrderedSame;
        *((unsigned char *)v16 + 24) = v9;
      }
    }
  }
  if (!*((unsigned char *)v16 + 24) && [(NSString *)self->_displayName length])
  {
    uint64_t v10 = [MEMORY[0x1E4F1CA20] currentLocale];
    displayName = self->_displayName;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __36__CRRecentContact_hasFullTextMatch___block_invoke;
    v14[3] = &unk_1E5CFBD90;
    v14[4] = self;
    v14[5] = a3;
    v14[7] = &v15;
    v14[8] = 385;
    v14[6] = v10;
    [(CRRecentContact *)self _enumerateWordsInString:displayName usingBlock:v14];
  }
  char v12 = *((unsigned char *)v16 + 24);
  _Block_object_dispose(&v15, 8);
  return v12;
}

uint64_t __36__CRRecentContact_hasFullTextMatch___block_invoke(void *a1, uint64_t a2, uint64_t a3, BOOL *a4)
{
  uint64_t result = objc_msgSend(*(id *)(a1[4] + 32), "compare:options:range:locale:", a1[5], a1[8], a2, a3, a1[6]);
  *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = result == 0;
  *a4 = result == 0;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  BOOL v5 = self->_address
    && [a3 address]
    && -[NSString isEqualToString:](self->_address, "isEqualToString:", [a3 address]);
  if ([(CRRecentContact *)self isGroup])
  {
    if ([a3 isGroup])
    {
      if ([a3 recentID] == self->_recentID) {
        return 1;
      }
      return v5;
    }
    return 0;
  }
  return v5;
}

- (unint64_t)hash
{
  address = self->_address;
  if (address) {
    return [(NSString *)address hash];
  }
  else {
    return self->_recentID;
  }
}

- (void)applyWeight:(id)a3
{
  if (self->_weight)
  {
    if (objc_msgSend(a3, "compare:") != 1) {
      return;
    }
    weight = self->_weight;
  }
  else
  {
    weight = 0;
  }

  self->_weight = (NSNumber *)a3;
}

- (unint64_t)countOfRecents
{
  return [(NSMutableArray *)self->_recentDates count];
}

- (NSDate)mostRecentDate
{
  uint64_t result = (NSDate *)[(NSMutableArray *)self->_recentDates count];
  if (result)
  {
    recentDates = self->_recentDates;
    return (NSDate *)[(NSMutableArray *)recentDates objectAtIndex:0];
  }
  return result;
}

- (NSDate)leastRecentDate
{
  return (NSDate *)[(NSMutableArray *)self->_recentDates lastObject];
}

- (NSArray)recentDates
{
  return (NSArray *)[MEMORY[0x1E4F1C978] arrayWithArray:self->_recentDates];
}

- (void)setRecentDates:(id)a3
{
  recentDates = self->_recentDates;
  if (recentDates != a3)
  {

    self->_recentDates = (NSMutableArray *)[a3 mutableCopy];
  }
}

- (void)recordRecentEventForDate:(id)a3 userInitiated:(BOOL)a4
{
  BOOL v4 = a4;
  [(CRRecentContact *)self lazilyCreateRecentDates];
  char v8 = 1;
  unint64_t v7 = [(CRRecentContact *)self insertionIndexForDate:a3 wouldBeUnique:&v8];
  if (v4 || v8) {
    [(CRRecentContact *)self insertDate:a3 atIndex:v7 required:v4];
  }
}

- (void)lazilyCreateRecentDates
{
  if (!self->_recentDates) {
    self->_recentDates = (NSMutableArray *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:6];
  }
}

- (unint64_t)insertionIndexForDate:(id)a3 wouldBeUnique:(BOOL *)a4
{
  char v6 = 0;
  unint64_t result = [(NSMutableArray *)self->_recentDates cr_binaryInsertionIndexOfObject:a3 usingComparator:&__block_literal_global_321 match:&v6];
  if (result == 0x7FFFFFFFFFFFFFFFLL) {
    -[CRRecentContact insertionIndexForDate:wouldBeUnique:]();
  }
  *a4 = v6 ^ 1;
  return result;
}

- (void)insertDate:(id)a3 atIndex:(unint64_t)a4 required:(BOOL)a5
{
  BOOL v5 = a5;
  -[NSMutableArray insertObject:atIndex:](self->_recentDates, "insertObject:atIndex:", a3);
  if (a4 >= 5 && v5) {
    [(NSMutableArray *)self->_recentDates removeObjectAtIndex:0];
  }
  recentDates = self->_recentDates;
  [(NSMutableArray *)recentDates cr_removeObjectsStartingAtIndex:5];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CRRecentContact)initWithCoder:(id)a3
{
  BOOL v4 = [(CRRecentContact *)self initWithContactID:0x7FFFFFFFFFFFFFFFLL];
  BOOL v5 = v4;
  if (v4)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __33__CRRecentContact_initWithCoder___block_invoke;
    v7[3] = &unk_1E5CFBDB8;
    v7[4] = a3;
    v7[5] = v4;
    [(CRRecentContact *)v4 enumerateArchivablePropertiesWithBlock:v7];
  }
  return v5;
}

uint64_t __33__CRRecentContact_initWithCoder___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  char v6 = *(void **)(a1 + 32);
  if (a4) {
    uint64_t v7 = [v6 decodeObjectOfClasses:a4 forKey:a2];
  }
  else {
    uint64_t v7 = [v6 decodePropertyListForKey:a2];
  }
  uint64_t v8 = v7;
  BOOL v9 = *(void **)(a1 + 40);
  return [v9 setValue:v8 forKey:a3];
}

- (void)encodeWithCoder:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __35__CRRecentContact_encodeWithCoder___block_invoke;
  v3[3] = &unk_1E5CFBDB8;
  v3[4] = self;
  v3[5] = a3;
  [(CRRecentContact *)self enumerateArchivablePropertiesWithBlock:v3];
}

uint64_t __35__CRRecentContact_encodeWithCoder___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = objc_msgSend(*(id *)(a1 + 32), "valueForKey:");
  BOOL v5 = *(void **)(a1 + 40);
  return [v5 encodeObject:v4 forKey:a2];
}

- (void)enumerateArchivablePropertiesWithBlock:(id)a3
{
  if (enumerateArchivablePropertiesWithBlock__onceToken != -1) {
    dispatch_once(&enumerateArchivablePropertiesWithBlock__onceToken, &__block_literal_global_2);
  }
  (*((void (**)(id, __CFString *, __CFString *, uint64_t))a3 + 2))(a3, @"contactID", @"archivableContactID", enumerateArchivablePropertiesWithBlock__sNumberSet);
  (*((void (**)(id, __CFString *, __CFString *, uint64_t))a3 + 2))(a3, @"recentID", @"archivableRecentID", enumerateArchivablePropertiesWithBlock__sNumberSet);
  (*((void (**)(id, __CFString *, __CFString *, uint64_t))a3 + 2))(a3, @"recentsDomain", @"recentsDomain", enumerateArchivablePropertiesWithBlock__sStringSet);
  (*((void (**)(id, __CFString *, __CFString *, uint64_t))a3 + 2))(a3, @"kind", @"kind", enumerateArchivablePropertiesWithBlock__sStringSet);
  (*((void (**)(id, __CFString *, __CFString *, uint64_t))a3 + 2))(a3, @"address", @"address", enumerateArchivablePropertiesWithBlock__sStringSet);
  (*((void (**)(id, __CFString *, __CFString *, uint64_t))a3 + 2))(a3, @"rawAddress", @"rawAddress", enumerateArchivablePropertiesWithBlock__sStringSet);
  (*((void (**)(id, __CFString *, __CFString *, uint64_t))a3 + 2))(a3, @"recentDates", @"recentDates", enumerateArchivablePropertiesWithBlock__sArrayOfDatesSet);
  (*((void (**)(id, __CFString *, __CFString *, uint64_t))a3 + 2))(a3, @"displayName", @"displayName", enumerateArchivablePropertiesWithBlock__sStringSet);
  (*((void (**)(id, __CFString *, __CFString *, uint64_t))a3 + 2))(a3, @"groupName", @"groupName", enumerateArchivablePropertiesWithBlock__sStringSet);
  (*((void (**)(id, __CFString *, __CFString *, uint64_t))a3 + 2))(a3, @"lastSendingAddress", @"lastSendingAddress", enumerateArchivablePropertiesWithBlock__sStringSet);
  (*((void (**)(id, __CFString *, __CFString *, uint64_t))a3 + 2))(a3, @"originalSource", @"originalSource", enumerateArchivablePropertiesWithBlock__sStringSet);
  (*((void (**)(id, __CFString *, __CFString *, void))a3 + 2))(a3, @"metadata", @"archivableMetadata", 0);
  (*((void (**)(id, __CFString *, __CFString *, uint64_t))a3 + 2))(a3, @"weight", @"weight", enumerateArchivablePropertiesWithBlock__sNumberSet);
  if ([(CRRecentContact *)self isGroup])
  {
    (*((void (**)(id, __CFString *, __CFString *, uint64_t))a3 + 2))(a3, @"members", @"archivableGroupMembers", enumerateArchivablePropertiesWithBlock__sArrayOfContactsSet);
    uint64_t v5 = enumerateArchivablePropertiesWithBlock__sNumberSet;
    char v6 = (void (*)(id, __CFString *, __CFString *, uint64_t))*((void *)a3 + 2);
    v6(a3, @"groupKind", @"archivableGroupKind", v5);
  }
}

uint64_t __58__CRRecentContact_enumerateArchivablePropertiesWithBlock___block_invoke()
{
  enumerateArchivablePropertiesWithBlock__sNumberSet = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
  enumerateArchivablePropertiesWithBlock__sStringSet = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
  id v0 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v1 = objc_opt_class();
  enumerateArchivablePropertiesWithBlock__sArrayOfDatesSet = objc_msgSend(v0, "initWithObjects:", v1, objc_opt_class(), 0);
  id v2 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v3 = objc_opt_class();
  uint64_t result = objc_msgSend(v2, "initWithObjects:", v3, objc_opt_class(), 0);
  enumerateArchivablePropertiesWithBlock__sArrayOfContactsSet = result;
  return result;
}

- (void)setArchivableRecentID:(id)a3
{
  uint64_t v4 = objc_msgSend(a3, "cr_CRRecentIDValue");
  [(CRRecentContact *)self setRecentID:v4];
}

- (id)archivableRecentID
{
  id v2 = NSNumber;
  int64_t v3 = [(CRRecentContact *)self recentID];
  return (id)objc_msgSend(v2, "cr_numberWithCRRecentID:", v3);
}

- (void)setArchivableContactID:(id)a3
{
  self->_contactID = objc_msgSend(a3, "cr_CRContactIDValue");
}

- (id)archivableContactID
{
  id v2 = NSNumber;
  int64_t v3 = [(CRRecentContact *)self contactID];
  return (id)objc_msgSend(v2, "cr_numberWithCRContactID:", v3);
}

- (void)setArchivableGroupMembers:(id)a3
{
  self->_members = (NSArray *)a3;
}

- (void)setArchivableMetadata:(id)a3
{
  self->_metadata = (NSDictionary *)a3;
}

- (id)archivableMetadata
{
  id v2 = self->_metadata;
  return v2;
}

- (void)setArchivableGroupKind:(id)a3
{
  self->_unint64_t groupKind = [a3 unsignedIntegerValue];
}

- (id)archivableGroupKind
{
  return (id)[NSNumber numberWithUnsignedInteger:self->_groupKind];
}

- (int64_t)contactID
{
  return self->_contactID;
}

- (void)setContactID:(int64_t)a3
{
  self->_contactID = a3;
}

- (NSString)recentsDomain
{
  return self->_recentsDomain;
}

- (void)setRecentsDomain:(id)a3
{
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
}

- (NSString)kind
{
  return self->_kind;
}

- (void)setKind:(id)a3
{
}

- (NSString)address
{
  return self->_address;
}

- (void)setAddress:(id)a3
{
}

- (NSString)lastSendingAddress
{
  return self->_lastSendingAddress;
}

- (void)setLastSendingAddress:(id)a3
{
}

- (NSString)originalSource
{
  return self->_originalSource;
}

- (void)setOriginalSource:(id)a3
{
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
}

- (NSNumber)weight
{
  return self->_weight;
}

- (void)setWeight:(id)a3
{
}

- (NSNumber)decayedWeight
{
  return self->_decayedWeight;
}

- (void)setDecayedWeight:(id)a3
{
}

- (NSArray)members
{
  return self->_members;
}

- (void)setMembers:(id)a3
{
}

- (unint64_t)groupKind
{
  return self->_groupKind;
}

- (void)setGroupKind:(unint64_t)a3
{
  self->_unint64_t groupKind = a3;
}

- (int64_t)recentID
{
  return self->_recentID;
}

- (void)setRecentID:(int64_t)a3
{
  self->_recentID = a3;
}

- (NSString)groupName
{
  return self->_groupName;
}

- (void)setGroupName:(id)a3
{
}

- (NSString)rawAddress
{
  return self->_rawAddress;
}

- (void)setRawAddress:(id)a3
{
}

- (void)insertionIndexForDate:wouldBeUnique:.cold.1()
{
  __assert_rtn("-[CRRecentContact insertionIndexForDate:wouldBeUnique:]", "CRRecentContact.m", 383, "idx != NSNotFound");
}

@end