@interface AXInvertColors_TVRemoteModule
+ (int64_t)helperType;
+ (void)installCategories:(id)a3;
+ (void)performValidations:(id)a3;
@end

@implementation AXInvertColors_TVRemoteModule

+ (void)performValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"TVRMContentViewController" isKindOfClass:@"CCUIButtonModuleViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CCUIButtonModuleViewController", @"buttonView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MTMaterialView", @"_materialLayer", "@", 0);
}

+ (void)installCategories:(id)a3
{
}

+ (int64_t)helperType
{
  return 4;
}

@end