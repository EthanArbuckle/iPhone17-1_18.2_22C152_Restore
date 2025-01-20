@interface AXInvertColors_StorageSettings
+ (int64_t)helperType;
+ (void)installCategories:(id)a3;
+ (void)performValidations:(id)a3;
@end

@implementation AXInvertColors_StorageSettings

+ (void)performValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"STStorageTipCell" hasInstanceVariable:@"_appIconView" withType:"UIImageView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"STStorageTipCell", @"initWithStyle:reuseIdentifier:specifier:", "q", "@", "@", 0);
}

+ (void)installCategories:(id)a3
{
}

+ (int64_t)helperType
{
  return 1;
}

@end