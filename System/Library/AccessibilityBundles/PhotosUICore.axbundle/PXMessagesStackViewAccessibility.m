@interface PXMessagesStackViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (CGPoint)accessibilityActivationPoint;
- (id)accessibilityCustomActions;
- (id)accessibilityValue;
- (int64_t)_accessibilityPlaybackStyle;
- (unint64_t)_accessibilityCurrentIndex;
- (void)accessibilityDecrement;
- (void)accessibilityIncrement;
@end

@implementation PXMessagesStackViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PXMessagesStackView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"PXMessagesStackPlaybackControlView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXBaseMessagesStackView", @"layout", "@", 0);
  [v3 validateClass:@"PXMessagesStackView" isKindOfClass:@"PXBaseMessagesStackView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXMessagesStackView", @"currentAssetReference", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXMessagesStackItemsLayout", @"primaryItemIndex", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXAssetReference", @"asset", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXMessagesStackItemsLayout", @"stackedItemsCount", "Q", 0);
  [v3 validateClass:@"PXMessagesStackPlaybackControlView" hasInstanceVariable:@"_button" withType:"_PXMessagesStackPlayButton"];
}

- (id)accessibilityValue
{
  id v3 = [(PXMessagesStackViewAccessibility *)self accessibilityUserDefinedValue];

  if (v3)
  {
    v4 = [(PXMessagesStackViewAccessibility *)self accessibilityUserDefinedValue];
  }
  else
  {
    unint64_t v5 = [(PXMessagesStackViewAccessibility *)self _accessibilityCurrentIndex] + 1;
    v6 = [(PXMessagesStackViewAccessibility *)self safeValueForKey:@"layout"];
    uint64_t v7 = [v6 safeUnsignedIntegerForKey:@"stackedItemsCount"];

    if ([(PXMessagesStackViewAccessibility *)self _accessibilityPlaybackStyle] == 4) {
      v8 = @"photo.label.type.video";
    }
    else {
      v8 = @"photo.label.type.image";
    }
    v9 = accessibilityPhotoLibraryServicesLocalizedString(v8);
    v10 = NSString;
    v11 = accessibilityPhotosUICoreLocalizedString(@"messages.attachment.stack.view.format");
    v13 = objc_msgSend(v10, "localizedStringWithFormat:", v11, v5, v7);
    v4 = __UIAXStringForVariables();
  }

  return v4;
}

- (void)accessibilityIncrement
{
}

uint64_t __58__PXMessagesStackViewAccessibility_accessibilityIncrement__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = [v1 _accessibilityCurrentIndex] + 1;

  return [v1 scrollToIndex:v2 animated:1];
}

- (void)accessibilityDecrement
{
}

uint64_t __58__PXMessagesStackViewAccessibility_accessibilityDecrement__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = [v1 _accessibilityCurrentIndex] - 1;

  return [v1 scrollToIndex:v2 animated:1];
}

- (CGPoint)accessibilityActivationPoint
{
  v12.receiver = self;
  v12.super_class = (Class)PXMessagesStackViewAccessibility;
  [(PXMessagesStackViewAccessibility *)&v12 accessibilityActivationPoint];
  double v4 = v3;
  double v6 = v5;
  if ([(PXMessagesStackViewAccessibility *)self _accessibilityPlaybackStyle] == 4)
  {
    [(PXMessagesStackViewAccessibility *)self accessibilityFrame];
    double v8 = (v6 - v7) * 0.5;
    [(PXMessagesStackViewAccessibility *)self accessibilityFrame];
    double v6 = v9 + v8;
  }
  double v10 = v4;
  double v11 = v6;
  result.y = v11;
  result.x = v10;
  return result;
}

- (id)accessibilityCustomActions
{
  objc_initWeak(&location, self);
  id v2 = objc_alloc(MEMORY[0x263F1C390]);
  double v3 = accessibilityPhotosUICoreLocalizedString(@"memory.video.play");
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __62__PXMessagesStackViewAccessibility_accessibilityCustomActions__block_invoke;
  v7[3] = &unk_2650A6188;
  objc_copyWeak(&v8, &location);
  double v4 = (void *)[v2 initWithName:v3 actionHandler:v7];

  double v5 = objc_msgSend(MEMORY[0x263EFF8C0], "axArrayByIgnoringNilElementsWithCount:", 1, v4);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

  return v5;
}

uint64_t __62__PXMessagesStackViewAccessibility_accessibilityCustomActions__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  double v5 = [WeakRetained _accessibilityDescendantOfType:MEMORY[0x2455E3C60](@"PXMessagesStackPlaybackControlView")];

  double v6 = [v5 safeUIViewForKey:@"_button"];
  uint64_t v11 = 0;
  objc_super v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  id v9 = v5;
  id v10 = v6;
  AXPerformSafeBlock();
  uint64_t v7 = *((unsigned __int8 *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return v7;
}

uint64_t __62__PXMessagesStackViewAccessibility_accessibilityCustomActions__block_invoke_2(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  [*(id *)(a1 + 40) frame];
  AX_CGRectGetCenter();
  uint64_t result = objc_msgSend(v2, "handleTapAtPoint:");
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (int64_t)_accessibilityPlaybackStyle
{
  id v2 = [(PXMessagesStackViewAccessibility *)self safeValueForKeyPath:@"currentAssetReference.asset"];
  int64_t v3 = [v2 safeIntegerForKey:@"playbackStyle"];

  return v3;
}

- (unint64_t)_accessibilityCurrentIndex
{
  id v2 = [(PXMessagesStackViewAccessibility *)self safeValueForKey:@"layout"];
  unint64_t v3 = [v2 safeIntegerForKey:@"currentIndex"];

  return v3;
}

@end