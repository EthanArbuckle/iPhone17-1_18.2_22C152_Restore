@interface COSFaceGalleryHeaderViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityElements;
@end

@implementation COSFaceGalleryHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"COSFaceGalleryHeaderView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (id)accessibilityElements
{
  v6[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = [(COSFaceGalleryHeaderViewAccessibility *)self safeValueForKey:@"galleryView"];
  v3 = (void *)v2;
  if (v2)
  {
    v6[0] = v2;
    v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:1];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

@end