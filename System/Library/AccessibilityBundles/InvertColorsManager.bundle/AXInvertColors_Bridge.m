@interface AXInvertColors_Bridge
+ (int64_t)helperType;
+ (void)installCategories:(id)a3;
+ (void)performValidations:(id)a3;
@end

@implementation AXInvertColors_Bridge

+ (void)performValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"COSPreferencesAppController" hasInstanceVariable:@"_window" withType:"UIWindow"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"COSPreferencesAppController", @"application:didFinishLaunchingWithOptions:", "B", "@", "@", 0);
  [v3 validateClass:@"COSPreferencesAppController"];
}

+ (void)installCategories:(id)a3
{
}

+ (int64_t)helperType
{
  return 2;
}

@end