@interface HDJournalEntry
+ (BOOL)supportsSecureCoding;
+ (void)applyEntries:(id)a3 withProfile:(id)a4;
- (HDJournalEntry)initWithCoder:(id)a3;
- (NSString)entryClassName;
- (int64_t)size;
@end

@implementation HDJournalEntry

- (NSString)entryClassName
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

- (int64_t)size
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (void)applyEntries:(id)a3 withProfile:(id)a4
{
  objc_opt_class();

  NSRequestConcreteImplementation();
}

- (HDJournalEntry)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HDJournalEntry;
  return [(HDJournalEntry *)&v4 init];
}

@end