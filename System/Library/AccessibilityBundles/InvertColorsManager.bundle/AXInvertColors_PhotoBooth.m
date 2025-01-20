@interface AXInvertColors_PhotoBooth
+ (id)bundleName;
+ (int64_t)helperType;
+ (void)installCategories:(id)a3;
+ (void)performValidations:(id)a3;
@end

@implementation AXInvertColors_PhotoBooth

+ (void)performValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"PBController" isKindOfClass:@"UIViewController"];
  [v3 validateClass:@"PBController"];
}

+ (void)installCategories:(id)a3
{
}

+ (int64_t)helperType
{
  return 2;
}

+ (id)bundleName
{
  return @"Photo Booth";
}

@end