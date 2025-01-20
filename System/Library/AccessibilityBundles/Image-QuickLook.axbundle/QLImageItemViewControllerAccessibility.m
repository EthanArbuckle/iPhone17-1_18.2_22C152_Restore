@interface QLImageItemViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_axPhotoDescriptionFromContents:(id)a3 context:(id)a4;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)loadPreviewControllerWithContents:(id)a3 context:(id)a4 completionHandler:(id)a5;
- (void)previewDidAppear:(BOOL)a3;
@end

@implementation QLImageItemViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"QLImageItemViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"QLImageItemViewController", @"loadPreviewControllerWithContents:context:completionHandler:", "v", "@", "@", "@?", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"QLImageItemViewController", @"previewDidAppear:", "v", "B", 0);
  [v3 validateClass:@"QLImageItemViewController" hasInstanceVariable:@"_imageView" withType:"UIImageView"];
  [v3 validateClass:@"QLImageItemViewController" isKindOfClass:@"QLItemViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"QLItemViewController", @"contents", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"QLItemViewController", @"context", "@", 0);
  [v3 validateClass:@"QLPreviewContext"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"QLPreviewContext", @"previewTitle", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"QLPreviewContext", @"item", "@", 0);
  [v3 validateClass:@"QLItem" conformsToProtocol:@"QLPreviewItem"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"QLItem", @"editedFileURL", "@", 0);
  [v3 validateClass:@"QLAnimatedImage"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"QLAnimatedImage", @"frameAtTime:", "@", "d", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v7.receiver = self;
  v7.super_class = (Class)QLImageItemViewControllerAccessibility;
  [(QLImageItemViewControllerAccessibility *)&v7 _accessibilityLoadAccessibilityInformation];
  id v3 = [(QLImageItemViewControllerAccessibility *)self safeValueForKey:@"contents"];
  v4 = [(QLImageItemViewControllerAccessibility *)self safeValueForKey:@"context"];
  v5 = [(QLImageItemViewControllerAccessibility *)self _axPhotoDescriptionFromContents:v3 context:v4];
  v6 = [(QLImageItemViewControllerAccessibility *)self safeValueForKey:@"_imageView"];
  [v6 setIsAccessibilityElement:1];
  [v6 setAccessibilityLabel:v5];
}

- (void)loadPreviewControllerWithContents:(id)a3 context:(id)a4 completionHandler:(id)a5
{
  v6.receiver = self;
  v6.super_class = (Class)QLImageItemViewControllerAccessibility;
  [(QLImageItemViewControllerAccessibility *)&v6 loadPreviewControllerWithContents:a3 context:a4 completionHandler:a5];
  [(QLImageItemViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)previewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)QLImageItemViewControllerAccessibility;
  [(QLImageItemViewControllerAccessibility *)&v4 previewDidAppear:a3];
  [(QLImageItemViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (id)_axPhotoDescriptionFromContents:(id)a3 context:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  objc_super v7 = [v6 accessibilityLabel];
  if (!v7)
  {
    objc_super v7 = [v6 safeValueForKey:@"previewTitle"];
  }
  LOBYTE(v22) = 0;
  v8 = [v6 safeValueForKey:@"item"];
  v9 = [v8 safeValueForKey:@"editedFileURL"];
  __UIAccessibilitySafeClass();
  CFURLRef v10 = (const __CFURL *)objc_claimAutoreleasedReturnValue();

  MEMORY[0x245650FB0](@"QLAnimatedImage");
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v17 = CGImageSourceCreateWithURL(v10, 0);
    CGImageRef ImageAtIndex = CGImageSourceCreateImageAtIndex(v17, 0, 0);
    v15 = UIAccessibilityMetadataDescriptionForImage();
    if (v17) {
      CFRelease(v17);
    }
    if (!ImageAtIndex)
    {
      v16 = 0;
      goto LABEL_13;
    }
    CFAutorelease(ImageAtIndex);
LABEL_11:
    v16 = UIAXPhotoDescriptionString();
    goto LABEL_13;
  }
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x3032000000;
  v25 = __Block_byref_object_copy_;
  v26 = __Block_byref_object_dispose_;
  id v27 = 0;
  id v21 = v5;
  AXPerformSafeBlock();
  id v11 = (id)v23[5];

  _Block_object_dispose(&v22, 8);
  LOBYTE(v22) = 0;
  objc_opt_class();
  v12 = __UIAccessibilityCastAsClass();
  if ((_BYTE)v22) {
    abort();
  }
  id v13 = v12;
  uint64_t v14 = [v13 CGImage];

  v15 = 0;
  v16 = 0;
  if (v14) {
    goto LABEL_11;
  }
LABEL_13:
  v19 = __UIAXStringForVariables();

  return v19;
}

uint64_t __82__QLImageItemViewControllerAccessibility__axPhotoDescriptionFromContents_context___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) frameAtTime:0.0];

  return MEMORY[0x270F9A758]();
}

@end