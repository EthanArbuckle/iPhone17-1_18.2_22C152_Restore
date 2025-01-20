@interface PXStoryViewModelAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)setWantsRelatedOverlayVisible:(BOOL)a3;
@end

@implementation PXStoryViewModelAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PXStoryViewModel";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)setWantsRelatedOverlayVisible:(BOOL)a3
{
  BOOL v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXStoryViewModelAccessibility;
  -[PXStoryViewModelAccessibility setWantsRelatedOverlayVisible:](&v9, sel_setWantsRelatedOverlayVisible_);
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
  if (v3)
  {
    v4 = (void *)MEMORY[0x263F21660];
    v5 = accessibilityPhotosUICoreLocalizedString(@"watch.next.memories");
    v6 = [v4 axAttributedStringWithString:v5];

    [v6 setAttribute:&unk_26F42DF58 forKey:*MEMORY[0x263F216D8]];
    v8 = v6;
    id v7 = v6;
    AXPerformBlockOnMainThreadAfterDelay();
  }
}

void __63__PXStoryViewModelAccessibility_setWantsRelatedOverlayVisible___block_invoke(uint64_t a1)
{
}

@end