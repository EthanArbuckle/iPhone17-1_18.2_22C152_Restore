@interface AXInvertColors_SharingUI
+ (int64_t)helperType;
+ (void)installCategories:(id)a3;
+ (void)performValidations:(id)a3;
@end

@implementation AXInvertColors_SharingUI

+ (void)performValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"SFPersonCollectionViewCell" hasInstanceVariable:@"_person" withType:"SFAirDropNode"];
  [v3 validateClass:@"SFPersonImageView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SFPersonCollectionViewCell", @"imageView", "@", 0);
}

+ (void)installCategories:(id)a3
{
}

+ (int64_t)helperType
{
  return 1;
}

@end