@interface AXInvertColors_Compass
+ (int64_t)helperType;
+ (void)installCategories:(id)a3;
+ (void)performValidations:(id)a3;
@end

@implementation AXInvertColors_Compass

+ (void)performValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CompassAppDelegate", @"window", "@", 0);
  [v3 validateClass:@"CompassAppDelegate"];
}

+ (void)installCategories:(id)a3
{
}

+ (int64_t)helperType
{
  return 2;
}

@end