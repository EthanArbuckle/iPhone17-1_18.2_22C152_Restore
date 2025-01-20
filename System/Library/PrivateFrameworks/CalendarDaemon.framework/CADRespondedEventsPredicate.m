@interface CADRespondedEventsPredicate
+ (BOOL)supportsSecureCoding;
+ (id)predicate;
- (id)defaultPropertiesToLoad;
- (id)predicateFormat;
@end

@implementation CADRespondedEventsPredicate

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)predicate
{
  objc_opt_class();
  v2 = objc_opt_new();
  return v2;
}

- (id)defaultPropertiesToLoad
{
  v8[5] = *MEMORY[0x1E4F143B8];
  v2 = CADEKPersistentEventDefaultPropertiesToLoad();
  uint64_t v3 = *MEMORY[0x1E4F57150];
  v8[0] = *MEMORY[0x1E4F56D38];
  v8[1] = v3;
  uint64_t v4 = *MEMORY[0x1E4F56FF8];
  v8[2] = *MEMORY[0x1E4F56FD8];
  v8[3] = v4;
  v8[4] = *MEMORY[0x1E4F56FD0];
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:5];
  v6 = [v2 arrayByAddingObjectsFromArray:v5];

  return v6;
}

- (id)predicateFormat
{
  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

@end