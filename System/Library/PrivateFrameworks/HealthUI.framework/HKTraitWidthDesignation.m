@interface HKTraitWidthDesignation
+ (NSString)identifier;
+ (NSString)name;
+ (int64_t)defaultValue;
@end

@implementation HKTraitWidthDesignation

+ (NSString)name
{
  return (NSString *)@"com.apple.Health.HKTraitWidthDesignation";
}

+ (NSString)identifier
{
  return (NSString *)@"com.apple.Health.HKTraitWidthDesignation";
}

+ (int64_t)defaultValue
{
  return 1;
}

@end