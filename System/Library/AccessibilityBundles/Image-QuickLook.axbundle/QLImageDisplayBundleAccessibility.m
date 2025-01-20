@interface QLImageDisplayBundleAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_axPhotoDescriptionFromItem:(id)a3;
- (void)loadWithHints:(id)a3;
@end

@implementation QLImageDisplayBundleAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"QLImageDisplayBundle";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"QLImageDisplayBundle", @"loadWithHints:", "v", "@", 0);
  [v3 validateClass:@"QLImageDisplayBundle" hasInstanceVariable:@"_previewItem" withType:"id<QLPreviewItem>"];
  [v3 validateClass:@"QLImageDisplayBundle" hasInstanceVariable:@"_imageView" withType:"UIImageView"];
  [v3 validateProtocol:@"QLPreviewItem" hasRequiredInstanceMethod:@"previewItemURL"];
  [v3 validateProtocol:@"QLPreviewItem" hasOptionalInstanceMethod:@"previewItemTitle"];
}

- (void)loadWithHints:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)QLImageDisplayBundleAccessibility;
  [(QLImageDisplayBundleAccessibility *)&v8 loadWithHints:a3];
  v4 = [(QLImageDisplayBundleAccessibility *)self safeValueForKey:@"_previewItem"];
  v5 = [(QLImageDisplayBundleAccessibility *)self _axPhotoDescriptionFromItem:v4];

  v6 = [(QLImageDisplayBundleAccessibility *)self safeValueForKey:@"_imageView"];
  [v6 setIsAccessibilityElement:1];

  v7 = [(QLImageDisplayBundleAccessibility *)self safeValueForKey:@"_imageView"];
  [v7 setAccessibilityLabel:v5];
}

- (id)_axPhotoDescriptionFromItem:(id)a3
{
  id v3 = a3;
  CFURLRef v4 = [v3 safeValueForKey:@"previewItemURL"];
  v5 = [v3 safeValueForKey:@"previewItemTitle"];

  v6 = CGImageSourceCreateWithURL(v4, 0);
  CGImageRef ImageAtIndex = CGImageSourceCreateImageAtIndex(v6, 0, 0);
  objc_super v8 = UIAccessibilityMetadataDescriptionForImage();
  v9 = UIAXPhotoDescriptionString();
  if (ImageAtIndex) {
    CFRelease(ImageAtIndex);
  }
  if (v6) {
    CFRelease(v6);
  }
  v10 = __UIAXStringForVariables();

  return v10;
}

@end