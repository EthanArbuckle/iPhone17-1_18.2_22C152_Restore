@interface HDDatabaseTransactionContext
+ (id)_cachedContextForOptions:(uint64_t)a1;
+ (id)contextForAccessibilityAssertion:(id)a3;
+ (id)contextForReading;
+ (id)contextForReadingProtectedData;
+ (id)contextForWriting;
+ (id)contextForWritingProtectedData;
+ (id)highPriorityContext;
- (BOOL)allowsJournalingDuringProtectedRead;
- (BOOL)containsContext:(id)a3 error:(id *)a4;
- (BOOL)highPriority;
- (BOOL)isEmpty;
- (BOOL)isEqual:(id)a3;
- (BOOL)requiresNewDatabaseConnection;
- (BOOL)requiresProtectedData;
- (BOOL)requiresWrite;
- (BOOL)skipJournalMerge;
- (BOOL)skipTransactionStartTasks;
- (HDDatabaseTransactionContext)init;
- (HDDatabaseTransactionContextStatistics)statistics;
- (NSSet)accessibilityAssertions;
- (id)_initWithOptions:(unint64_t)a3;
- (id)_initWithOptions:(void *)a3 journalType:(void *)a4 cacheScope:(void *)a5 assertions:(void *)a6 statistics:;
- (id)copyForReadingProtectedData;
- (id)copyForWriting;
- (id)copyForWritingProtectedData;
- (id)description;
- (id)mergedContextWithContext:(id)a3 error:(id *)a4;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (int64_t)cacheScope;
- (int64_t)journalType;
- (unint64_t)hash;
@end

@implementation HDDatabaseTransactionContext

- (HDDatabaseTransactionContext)init
{
  return (HDDatabaseTransactionContext *)-[HDDatabaseTransactionContext _initWithOptions:journalType:cacheScope:assertions:statistics:]((id *)&self->super.isa, 0, 0, 0, 0, 0);
}

- (id)_initWithOptions:(void *)a3 journalType:(void *)a4 cacheScope:(void *)a5 assertions:(void *)a6 statistics:
{
  id v11 = a5;
  id v12 = a6;
  if (a1)
  {
    v17.receiver = a1;
    v17.super_class = (Class)HDDatabaseTransactionContext;
    v13 = (id *)objc_msgSendSuper2(&v17, sel_init);
    a1 = v13;
    if (v13)
    {
      v13[2] = a4;
      v13[3] = a2;
      v13[1] = a3;
      if ([v11 count])
      {
        uint64_t v14 = [v11 mutableCopy];
        id v15 = a1[4];
        a1[4] = (id)v14;
      }
      objc_storeStrong(a1 + 5, a6);
    }
  }

  return a1;
}

- (id)_initWithOptions:(unint64_t)a3
{
  return -[HDDatabaseTransactionContext _initWithOptions:journalType:cacheScope:assertions:statistics:]((id *)&self->super.isa, (void *)a3, 0, 0, 0, 0);
}

- (id)copyForWriting
{
  if ([(HDDatabaseTransactionContext *)self requiresWrite])
  {
    return (id)[(HDDatabaseTransactionContext *)self copy];
  }
  else
  {
    v4 = (void *)[(HDDatabaseTransactionContext *)self mutableCopy];
    [v4 setRequiresWrite:1];
    return v4;
  }
}

- (id)copyForWritingProtectedData
{
  if ([(HDDatabaseTransactionContext *)self requiresWrite]
    && [(HDDatabaseTransactionContext *)self requiresProtectedData])
  {
    return (id)[(HDDatabaseTransactionContext *)self copy];
  }
  else
  {
    v4 = (void *)[(HDDatabaseTransactionContext *)self mutableCopy];
    [v4 setRequiresWrite:1];
    [v4 setRequiresProtectedData:1];
    return v4;
  }
}

- (id)copyForReadingProtectedData
{
  if ([(HDDatabaseTransactionContext *)self requiresProtectedData])
  {
    return (id)[(HDDatabaseTransactionContext *)self copy];
  }
  else
  {
    v4 = (void *)[(HDDatabaseTransactionContext *)self mutableCopy];
    [v4 setRequiresProtectedData:1];
    return v4;
  }
}

+ (id)_cachedContextForOptions:(uint64_t)a1
{
  self;
  if (qword_1EBA18C08 != -1) {
    dispatch_once(&qword_1EBA18C08, &__block_literal_global_105);
  }
  v3 = (void *)_MergedGlobals_205;
  v4 = [NSNumber numberWithUnsignedInteger:a2];
  v5 = [v3 objectForKeyedSubscript:v4];

  return v5;
}

void __57__HDDatabaseTransactionContext__cachedContextForOptions___block_invoke()
{
  v7[4] = *MEMORY[0x1E4F143B8];
  v6[0] = &unk_1F17ED140;
  id v0 = [[HDDatabaseTransactionContext alloc] _initWithOptions:0];
  v7[0] = v0;
  v6[1] = &unk_1F17ED158;
  id v1 = [[HDDatabaseTransactionContext alloc] _initWithOptions:1];
  v7[1] = v1;
  v6[2] = &unk_1F17ED170;
  id v2 = [[HDDatabaseTransactionContext alloc] _initWithOptions:2];
  v7[2] = v2;
  v6[3] = &unk_1F17ED188;
  id v3 = [[HDDatabaseTransactionContext alloc] _initWithOptions:3];
  v7[3] = v3;
  uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:4];
  v5 = (void *)_MergedGlobals_205;
  _MergedGlobals_205 = v4;
}

+ (id)contextForWriting
{
  return +[HDDatabaseTransactionContext _cachedContextForOptions:]((uint64_t)a1, 1);
}

+ (id)contextForWritingProtectedData
{
  return +[HDDatabaseTransactionContext _cachedContextForOptions:]((uint64_t)a1, 3);
}

+ (id)contextForReading
{
  return +[HDDatabaseTransactionContext _cachedContextForOptions:]((uint64_t)a1, 0);
}

+ (id)contextForReadingProtectedData
{
  return +[HDDatabaseTransactionContext _cachedContextForOptions:]((uint64_t)a1, 2);
}

+ (id)highPriorityContext
{
  id v2 = (void *)[objc_alloc((Class)a1) _initWithOptions:16];

  return v2;
}

+ (id)contextForAccessibilityAssertion:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [HDDatabaseTransactionContext alloc];
  p_isa = (id *)&v4->super.isa;
  if (v3)
  {
    v6 = [MEMORY[0x1E4F1CA80] setWithObject:v3];
    v7 = -[HDDatabaseTransactionContext _initWithOptions:journalType:cacheScope:assertions:statistics:](p_isa, 0, 0, 0, v6, 0);
  }
  else
  {
    v7 = -[HDDatabaseTransactionContext _initWithOptions:journalType:cacheScope:assertions:statistics:]((id *)&v4->super.isa, 0, 0, 0, 0, 0);
  }

  return v7;
}

- (id)mergedContextWithContext:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (!v6
    || [(HDDatabaseTransactionContext *)self isEqual:v6]
    || [v6 isEmpty])
  {
    v7 = self;
LABEL_5:
    p_isa = (id *)&v7->super.isa;
    goto LABEL_6;
  }
  if ([(HDDatabaseTransactionContext *)self isEmpty])
  {
    v7 = (HDDatabaseTransactionContext *)v6;
    goto LABEL_5;
  }
  journalType = (void *)self->_journalType;
  uint64_t v11 = [v6 journalType];
  int64_t v12 = self->_journalType;
  if (v12)
  {
    if (v11 && v11 != v12)
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a4, 107, @"Outer transaction journal type %ld is incompatible with type %ld", self->_journalType, v11);
LABEL_20:
      p_isa = 0;
      goto LABEL_6;
    }
  }
  else
  {
    journalType = (void *)v11;
  }
  cacheScope = (void *)self->_cacheScope;
  uint64_t v14 = [v6 cacheScope];
  int64_t v15 = self->_cacheScope;
  if (v15)
  {
    if (v14 && v14 != v15)
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a4, 107, @"Outer transaction cache scope %ld is incompatible with %ld", self->_cacheScope, v14);
      goto LABEL_20;
    }
  }
  else
  {
    cacheScope = (void *)v14;
  }
  id v16 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  if ([(NSMutableSet *)self->_accessibilityAssertions count]) {
    [v16 unionSet:self->_accessibilityAssertions];
  }
  if ([*((id *)v6 + 4) count]) {
    [v16 unionSet:*((void *)v6 + 4)];
  }
  objc_super v17 = self->_statistics;
  v18 = (HDDatabaseTransactionContextStatistics *)*((void *)v6 + 5);
  if (!v17)
  {
    v19 = v18;
LABEL_31:
    p_isa = -[HDDatabaseTransactionContext _initWithOptions:journalType:cacheScope:assertions:statistics:]((id *)[HDDatabaseTransactionContext alloc], (void *)(*((void *)v6 + 3) | self->_options), journalType, cacheScope, v16, v19);
    goto LABEL_32;
  }
  v19 = v17;
  if (!v18 || v18 == self->_statistics) {
    goto LABEL_31;
  }
  objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:description:", a4, 107, @"Transaction statistics are not mergeable");
  p_isa = 0;
LABEL_32:

LABEL_6:

  return p_isa;
}

- (BOOL)containsContext:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (!v6 || [(HDDatabaseTransactionContext *)self isEqual:v6]) {
    goto LABEL_3;
  }
  if ([v6 journalType])
  {
    uint64_t v8 = [v6 journalType];
    int64_t journalType = self->_journalType;
    if (v8 != journalType)
    {
      id v16 = (void *)MEMORY[0x1E4F28C58];
      int64_t v22 = journalType;
      uint64_t v23 = [v6 journalType];
      int64_t v15 = @"Outer transaction journal type %ld is incompatible with type %ld";
LABEL_25:
      uint64_t v14 = v16;
      goto LABEL_35;
    }
  }
  if ([v6 cacheScope] == 1)
  {
    uint64_t v10 = [v6 cacheScope];
    int64_t cacheScope = self->_cacheScope;
    if (v10 != cacheScope)
    {
      id v16 = (void *)MEMORY[0x1E4F28C58];
      int64_t v22 = cacheScope;
      uint64_t v23 = [v6 cacheScope];
      int64_t v15 = @"Outer transaction cache scope %ld is incompatible with %ld";
      goto LABEL_25;
    }
  }
  if ([v6 requiresWrite]
    && ![(HDDatabaseTransactionContext *)self requiresWrite])
  {
    uint64_t v14 = (void *)MEMORY[0x1E4F28C58];
    int64_t v15 = @"Outer transaction must require write";
    goto LABEL_35;
  }
  if ([v6 requiresProtectedData]
    && ![(HDDatabaseTransactionContext *)self requiresProtectedData])
  {
    uint64_t v14 = (void *)MEMORY[0x1E4F28C58];
    int64_t v15 = @"Outer transaction must require protected data";
    goto LABEL_35;
  }
  if ([v6 skipJournalMerge]
    && ![(HDDatabaseTransactionContext *)self skipJournalMerge])
  {
    uint64_t v14 = (void *)MEMORY[0x1E4F28C58];
    int64_t v15 = @"Outer transaction must skip journal merge";
    goto LABEL_35;
  }
  if ([v6 requiresNewDatabaseConnection]
    && ![(HDDatabaseTransactionContext *)self requiresNewDatabaseConnection])
  {
    uint64_t v14 = (void *)MEMORY[0x1E4F28C58];
    int64_t v15 = @"Outer transaction must require new database connection";
    goto LABEL_35;
  }
  if ([v6 allowsJournalingDuringProtectedRead]
    && ![(HDDatabaseTransactionContext *)self allowsJournalingDuringProtectedRead]
    && (![(HDDatabaseTransactionContext *)self requiresProtectedData]
     || ![(HDDatabaseTransactionContext *)self requiresWrite]))
  {
    uint64_t v14 = (void *)MEMORY[0x1E4F28C58];
    int64_t v15 = @"Outer transaction must allow journaling during protected read or allow writing protected data";
    goto LABEL_35;
  }
  int64_t v12 = [v6 accessibilityAssertions];
  if ([v12 count])
  {
    uint64_t v13 = [(NSMutableSet *)self->_accessibilityAssertions count];

    if (!v13)
    {
      uint64_t v14 = (void *)MEMORY[0x1E4F28C58];
      int64_t v15 = @"Outer transaction must have database accessibility assertion";
LABEL_35:
      objc_msgSend(v14, "hk_assignError:code:format:", a4, 107, v15, v22, v23);
      BOOL v7 = 0;
      goto LABEL_36;
    }
  }
  else
  {
  }
  uint64_t v17 = [v6 statistics];
  if (v17)
  {
    v18 = (void *)v17;
    v19 = [(HDDatabaseTransactionContext *)self statistics];
    v20 = [v6 statistics];

    if (v19 != v20)
    {
      uint64_t v14 = (void *)MEMORY[0x1E4F28C58];
      int64_t v15 = @"Outer transaction must have the same statistics object";
      goto LABEL_35;
    }
  }
LABEL_3:
  BOOL v7 = 1;
LABEL_36:

  return v7;
}

- (BOOL)skipJournalMerge
{
  return (LOBYTE(self->_options) >> 2) & 1;
}

- (BOOL)skipTransactionStartTasks
{
  return (LOBYTE(self->_options) >> 5) & 1;
}

- (BOOL)requiresNewDatabaseConnection
{
  return (LOBYTE(self->_options) >> 3) & 1;
}

- (BOOL)allowsJournalingDuringProtectedRead
{
  return (LOBYTE(self->_options) >> 6) & 1;
}

- (BOOL)isEmpty
{
  return !self->_options
      && !self->_journalType
      && !self->_cacheScope
      && ![(NSMutableSet *)self->_accessibilityAssertions count]
      && self->_statistics == 0;
}

- (BOOL)requiresWrite
{
  return self->_options & 1;
}

- (BOOL)requiresProtectedData
{
  return (LOBYTE(self->_options) >> 1) & 1;
}

- (BOOL)highPriority
{
  return (LOBYTE(self->_options) >> 4) & 1;
}

- (NSSet)accessibilityAssertions
{
  id v2 = (void *)[(NSMutableSet *)self->_accessibilityAssertions copy];
  id v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    id v4 = [MEMORY[0x1E4F1CAD0] set];
  }
  v5 = v4;

  return (NSSet *)v5;
}

- (unint64_t)hash
{
  unint64_t v2 = self->_options ^ (self->_journalType << 8) ^ (self->_cacheScope << 16);
  return v2 ^ [(HDDatabaseTransactionContextStatistics *)self->_statistics hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HDDatabaseTransactionContext *)a3;
  if (self == v4)
  {
    BOOL v9 = 1;
    goto LABEL_16;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    BOOL v9 = 0;
    goto LABEL_16;
  }
  v5 = v4;
  id v6 = v5;
  if (self->_journalType != v5->_journalType || self->_options != v5->_options || self->_cacheScope != v5->_cacheScope) {
    goto LABEL_12;
  }
  accessibilityAssertions = self->_accessibilityAssertions;
  uint64_t v8 = v6->_accessibilityAssertions;
  if (accessibilityAssertions == v8) {
    goto LABEL_17;
  }
  if (v8)
  {
    if ((-[NSMutableSet isEqual:](accessibilityAssertions, "isEqual:") & 1) == 0)
    {
      accessibilityAssertions = self->_accessibilityAssertions;
      goto LABEL_10;
    }
LABEL_17:
    BOOL v9 = self->_statistics == v6->_statistics;
    goto LABEL_13;
  }
LABEL_10:
  if (![(NSMutableSet *)accessibilityAssertions count]
    && ![(NSMutableSet *)v6->_accessibilityAssertions count])
  {
    goto LABEL_17;
  }
LABEL_12:
  BOOL v9 = 0;
LABEL_13:

LABEL_16:
  return v9;
}

- (id)description
{
  int64_t journalType = self->_journalType;
  if (journalType)
  {
    objc_msgSend(NSString, "stringWithFormat:", @" journal=%ld", journalType);
    id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v4 = &stru_1F1728D60;
  }
  if (self->_cacheScope)
  {
    objc_msgSend(NSString, "stringWithFormat:", @" cache-scope=%ld", self->_cacheScope);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = &stru_1F1728D60;
  }
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ([(HDDatabaseTransactionContext *)self skipJournalMerge]) {
    [v6 addObject:@"skip-journal"];
  }
  if ([(HDDatabaseTransactionContext *)self requiresNewDatabaseConnection]) {
    [v6 addObject:@"new-connection"];
  }
  if ([(HDDatabaseTransactionContext *)self requiresWrite]) {
    [v6 addObject:@"write"];
  }
  if ([(HDDatabaseTransactionContext *)self requiresProtectedData]) {
    [v6 addObject:@"protected-data"];
  }
  if ([(HDDatabaseTransactionContext *)self highPriority]) {
    [v6 addObject:@"high-priority"];
  }
  if ([(HDDatabaseTransactionContext *)self skipTransactionStartTasks]) {
    [v6 addObject:@"skip-transaction-start"];
  }
  if ([(HDDatabaseTransactionContext *)self allowsJournalingDuringProtectedRead]) {
    [v6 addObject:@"allows-journaling-during-protected-read"];
  }
  if ([v6 count])
  {
    BOOL v7 = [v6 componentsJoinedByString:@","];
  }
  else
  {
    BOOL v7 = @"none";
  }
  if ([(NSMutableSet *)self->_accessibilityAssertions count])
  {
    uint64_t v8 = NSString;
    BOOL v9 = [(NSMutableSet *)self->_accessibilityAssertions allObjects];
    uint64_t v10 = objc_msgSend(v9, "hk_map:", &__block_literal_global_363);
    uint64_t v11 = [v10 componentsJoinedByString:@", "];
    [v8 stringWithFormat:@" assertions={%@}", v11];
    int64_t v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    int64_t v12 = &stru_1F1728D60;
  }
  uint64_t v13 = [NSString stringWithFormat:@"<%@%@%@ options=%@%@>", objc_opt_class(), v4, v5, v7, v12, 0];

  return v13;
}

uint64_t __43__HDDatabaseTransactionContext_description__block_invoke(uint64_t a1, void *a2)
{
  return [a2 ownerIdentifier];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = [HDMutableDatabaseTransactionContext alloc];
  int64_t journalType = (void *)self->_journalType;
  int64_t cacheScope = (void *)self->_cacheScope;
  options = (void *)self->_options;
  accessibilityAssertions = self->_accessibilityAssertions;
  statistics = self->_statistics;

  return -[HDDatabaseTransactionContext _initWithOptions:journalType:cacheScope:assertions:statistics:]((id *)&v4->super.super.isa, options, journalType, cacheScope, accessibilityAssertions, statistics);
}

- (int64_t)journalType
{
  return self->_journalType;
}

- (int64_t)cacheScope
{
  return self->_cacheScope;
}

- (HDDatabaseTransactionContextStatistics)statistics
{
  return self->_statistics;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statistics, 0);

  objc_storeStrong((id *)&self->_accessibilityAssertions, 0);
}

@end