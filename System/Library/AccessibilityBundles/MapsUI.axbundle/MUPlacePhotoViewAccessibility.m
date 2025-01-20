@interface MUPlacePhotoViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation MUPlacePhotoViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MUPlacePhotoView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CF00];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  char v13 = 0;
  objc_opt_class();
  v3 = [(MUPlacePhotoViewAccessibility *)self safeValueForKey:@"imageView"];
  v4 = __UIAccessibilityCastAsClass();

  v5 = [v4 image];

  id v6 = v5;
  v7 = (CGImage *)[v6 CGImage];
  if (v7)
  {
    DataProvider = CGImageGetDataProvider(v7);
    CGImageSourceRef v9 = CGImageSourceCreateWithDataProvider(DataProvider, 0);
    v10 = (void *)MAImageCaptioningCopyCaptionWithSource();
    if (v9) {
      CFRelease(v9);
    }
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)MUPlacePhotoViewAccessibility;
    v10 = [(MUPlacePhotoViewAccessibility *)&v12 accessibilityLabel];
  }

  return v10;
}

@end