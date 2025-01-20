@interface HDMutableDatabaseTransactionContext
+ (id)contextForAccessibilityAssertion:(id)a3;
+ (id)contextForReading;
+ (id)contextForReadingProtectedData;
+ (id)contextForWriting;
+ (id)contextForWritingProtectedData;
- (HDMutableDatabaseTransactionContext)contextWithAccessibilityAssertion:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)addAccessibilityAssertion:(id)a3;
- (void)addAccessibilityAssertions:(id)a3;
- (void)setAllowsJournalingDuringProtectedRead:(BOOL)a3;
- (void)setCacheScope:(int64_t)a3;
- (void)setHighPriority:(BOOL)a3;
- (void)setJournalType:(int64_t)a3;
- (void)setRequiresNewDatabaseConnection:(BOOL)a3;
- (void)setRequiresProtectedData:(BOOL)a3;
- (void)setRequiresWrite:(BOOL)a3;
- (void)setSkipJournalMerge:(BOOL)a3;
- (void)setSkipTransactionStartTasks:(BOOL)a3;
- (void)setStatistics:(id)a3;
@end

@implementation HDMutableDatabaseTransactionContext

- (void)addAccessibilityAssertion:(id)a3
{
  id v4 = a3;
  accessibilityAssertions = self->super._accessibilityAssertions;
  id v8 = v4;
  if (!accessibilityAssertions)
  {
    v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    v7 = self->super._accessibilityAssertions;
    self->super._accessibilityAssertions = v6;

    id v4 = v8;
    accessibilityAssertions = self->super._accessibilityAssertions;
  }
  [(NSMutableSet *)accessibilityAssertions addObject:v4];
}

- (void)addAccessibilityAssertions:(id)a3
{
  accessibilityAssertions = self->super._accessibilityAssertions;
  if (accessibilityAssertions)
  {
    v9 = (NSMutableSet *)a3;
    [(NSMutableSet *)accessibilityAssertions addObjectsFromArray:v9];
    id v4 = v9;
  }
  else
  {
    v6 = (objc_class *)MEMORY[0x1E4F1CA80];
    id v7 = a3;
    id v8 = (NSMutableSet *)[[v6 alloc] initWithArray:v7];

    id v4 = self->super._accessibilityAssertions;
    self->super._accessibilityAssertions = v8;
  }
}

- (HDMutableDatabaseTransactionContext)contextWithAccessibilityAssertion:(id)a3
{
  if (a3) {
    -[HDMutableDatabaseTransactionContext addAccessibilityAssertion:](self, "addAccessibilityAssertion:");
  }
  return self;
}

+ (id)contextForWriting
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___HDMutableDatabaseTransactionContext;
  v2 = objc_msgSendSuper2(&v5, sel_contextForWriting);
  v3 = (void *)[v2 mutableCopy];

  return v3;
}

+ (id)contextForWritingProtectedData
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___HDMutableDatabaseTransactionContext;
  v2 = objc_msgSendSuper2(&v5, sel_contextForWritingProtectedData);
  v3 = (void *)[v2 mutableCopy];

  return v3;
}

+ (id)contextForReading
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___HDMutableDatabaseTransactionContext;
  v2 = objc_msgSendSuper2(&v5, sel_contextForReading);
  v3 = (void *)[v2 mutableCopy];

  return v3;
}

+ (id)contextForReadingProtectedData
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___HDMutableDatabaseTransactionContext;
  v2 = objc_msgSendSuper2(&v5, sel_contextForReadingProtectedData);
  v3 = (void *)[v2 mutableCopy];

  return v3;
}

+ (id)contextForAccessibilityAssertion:(id)a3
{
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___HDMutableDatabaseTransactionContext;
  v3 = objc_msgSendSuper2(&v6, sel_contextForAccessibilityAssertion_, a3);
  id v4 = (void *)[v3 mutableCopy];

  return v4;
}

- (void)setJournalType:(int64_t)a3
{
  self->super._journalType = a3;
}

- (void)setCacheScope:(int64_t)a3
{
  self->super._cacheScope = a3;
}

- (void)setRequiresWrite:(BOOL)a3
{
  if (self) {
    self->super._options = self->super._options & 0xFFFFFFFFFFFFFFFELL | a3;
  }
}

- (void)setRequiresProtectedData:(BOOL)a3
{
  if (self)
  {
    uint64_t v3 = 2;
    if (!a3) {
      uint64_t v3 = 0;
    }
    self->super._options = self->super._options & 0xFFFFFFFFFFFFFFFDLL | v3;
  }
}

- (void)setHighPriority:(BOOL)a3
{
  if (self)
  {
    uint64_t v3 = 16;
    if (!a3) {
      uint64_t v3 = 0;
    }
    self->super._options = self->super._options & 0xFFFFFFFFFFFFFFEFLL | v3;
  }
}

- (void)setSkipJournalMerge:(BOOL)a3
{
  if (self)
  {
    uint64_t v3 = 4;
    if (!a3) {
      uint64_t v3 = 0;
    }
    self->super._options = self->super._options & 0xFFFFFFFFFFFFFFFBLL | v3;
  }
}

- (void)setSkipTransactionStartTasks:(BOOL)a3
{
  if (self)
  {
    uint64_t v3 = 32;
    if (!a3) {
      uint64_t v3 = 0;
    }
    self->super._options = self->super._options & 0xFFFFFFFFFFFFFFDFLL | v3;
  }
}

- (void)setRequiresNewDatabaseConnection:(BOOL)a3
{
  if (self)
  {
    uint64_t v3 = 8;
    if (!a3) {
      uint64_t v3 = 0;
    }
    self->super._options = self->super._options & 0xFFFFFFFFFFFFFFF7 | v3;
  }
}

- (void)setAllowsJournalingDuringProtectedRead:(BOOL)a3
{
  if (self)
  {
    uint64_t v3 = 64;
    if (!a3) {
      uint64_t v3 = 0;
    }
    self->super._options = self->super._options & 0xFFFFFFFFFFFFFFBFLL | v3;
  }
}

- (void)setStatistics:(id)a3
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [HDDatabaseTransactionContext alloc];
  journalType = (void *)self->super._journalType;
  cacheScope = (void *)self->super._cacheScope;
  options = (void *)self->super._options;
  accessibilityAssertions = self->super._accessibilityAssertions;
  statistics = self->super._statistics;

  return -[HDDatabaseTransactionContext _initWithOptions:journalType:cacheScope:assertions:statistics:]((id *)&v4->super.isa, options, journalType, cacheScope, accessibilityAssertions, statistics);
}

@end