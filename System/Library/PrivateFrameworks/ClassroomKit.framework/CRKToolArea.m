@interface CRKToolArea
+ (id)aliases;
+ (id)subareaPath;
+ (id)subareaSummary;
- (id)description;
@end

@implementation CRKToolArea

+ (id)subareaPath
{
  return (id)MEMORY[0x263EFFA68];
}

+ (id)aliases
{
  return (id)MEMORY[0x263EFFA68];
}

+ (id)subareaSummary
{
  return &stru_26D7E7B00;
}

- (id)description
{
  v2 = [(id)objc_opt_class() subareaPath];
  v3 = NSString;
  v4 = [v2 componentsJoinedByString:@" --> "];
  v5 = [(id)objc_opt_class() subareaSummary];
  v6 = [v3 stringWithFormat:@"%@: %@", v4, v5];

  return v6;
}

@end