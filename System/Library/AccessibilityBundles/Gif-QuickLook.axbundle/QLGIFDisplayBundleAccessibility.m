@interface QLGIFDisplayBundleAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation QLGIFDisplayBundleAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"QLGIFDisplayBundle";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)MEMORY[0x270F9A6F8](MEMORY[0x263F8B098], a2);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"QLGIFDisplayBundle" hasInstanceVariable:@"_imageView" withType:"UIImageView"];
  [v3 validateProtocol:@"QLSwippableItemProtocol" hasRequiredInstanceMethod:@"previewItem"];
  [v3 validateProtocol:@"QLPreviewItem" hasRequiredInstanceMethod:@"previewItemURL"];
}

- (void)viewDidAppear:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)QLGIFDisplayBundleAccessibility;
  [(QLGIFDisplayBundleAccessibility *)&v9 viewDidAppear:a3];
  v4 = [(QLGIFDisplayBundleAccessibility *)self safeValueForKey:@"_imageView"];
  [v4 setIsAccessibilityElement:1];

  v5 = [(QLGIFDisplayBundleAccessibility *)self safeValueForKey:@"previewItem"];
  v6 = [v5 safeValueForKey:@"previewItemURL"];

  v7 = [(QLGIFDisplayBundleAccessibility *)self safeValueForKey:@"_imageView"];
  v8 = UIAccessibilityEmojiDescription();
  [v7 setAccessibilityLabel:v8];
}

@end