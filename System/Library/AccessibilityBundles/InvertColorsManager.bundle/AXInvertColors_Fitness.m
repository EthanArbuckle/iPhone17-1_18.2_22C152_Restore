@interface AXInvertColors_Fitness
+ (int64_t)helperType;
+ (void)installCategories:(id)a3;
+ (void)performValidations:(id)a3;
@end

@implementation AXInvertColors_Fitness

+ (void)performValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PhoneSceneDelegate", @"window", "@", 0);
  [v3 validateClass:@"PhoneSceneDelegate"];
}

+ (void)installCategories:(id)a3
{
}

+ (int64_t)helperType
{
  return 2;
}

@end