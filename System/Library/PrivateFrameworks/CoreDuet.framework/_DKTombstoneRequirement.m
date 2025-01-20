@interface _DKTombstoneRequirement
+ (id)requirement;
- (NSArray)propertiesToFetch;
- (NSPredicate)eventPredicate;
- (NSPredicate)predicate;
- (NSString)identifier;
@end

@implementation _DKTombstoneRequirement

- (void).cxx_destruct
{
}

+ (id)requirement
{
  id v2 = objc_alloc_init((Class)objc_opt_class());
  return v2;
}

- (NSPredicate)predicate
{
  return (NSPredicate *)[MEMORY[0x1E4F28F60] predicateWithValue:0];
}

- (NSPredicate)eventPredicate
{
  return 0;
}

- (NSArray)propertiesToFetch
{
  return 0;
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

@end