@interface VideoCollectionViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)_accessibilityContextDescriptors;
@end

@implementation VideoCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ProductPageExtension.VideoCollectionViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_accessibilityContextDescriptors
{
  v9[1] = *MEMORY[0x263EF8340];
  v6 = @"category";
  v7 = @"value";
  v8[0] = @"VIDEO";
  v2 = accessibilityAppStoreLocalizedString(@"video.view");
  v8[1] = v2;
  v3 = [NSDictionary dictionaryWithObjects:v8 forKeys:&v6 count:2];
  v9[0] = v3;
  v4 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v9, 1, v6, v7, v8[0]);

  return v4;
}

@end