@interface PXStoryChromeButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityIsInFeedView;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation PXStoryChromeButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PXStoryChromeButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXStoryChromeButton", @"userData", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXStoryChromeButtonConfiguration", @"systemImageName", "@", 0);
  [v3 validateClass:@"PXFeedView"];
}

- (id)accessibilityLabel
{
  id v3 = [(PXStoryChromeButtonAccessibility *)self safeValueForKey:@"userData"];
  v4 = [v3 safeStringForKey:@"systemImageName"];

  if ([v4 isEqualToString:@"speaker.wave.2"])
  {
    v5 = @"photo.volume.button";
LABEL_5:
    v6 = accessibilityPhotosUICoreLocalizedString(v5);
    goto LABEL_6;
  }
  if ([v4 isEqualToString:@"speaker.slash"])
  {
    v5 = @"photo.volume.muted.button";
    goto LABEL_5;
  }
  v7 = AXSSAccessibilityDescriptionForSymbolName();
  v6 = v7;
  if (v7 && [v7 length]) {
    goto LABEL_10;
  }
  if ([v4 isEqualToString:@"arrow.counterclockwise"])
  {
    uint64_t v9 = accessibilityPhotosUICoreLocalizedString(@"story.replay");

    v6 = (void *)v9;
  }
LABEL_6:
  if (!v6)
  {
    v10.receiver = self;
    v10.super_class = (Class)PXStoryChromeButtonAccessibility;
    v6 = [(PXStoryChromeButtonAccessibility *)&v10 accessibilityLabel];
  }
LABEL_10:

  return v6;
}

- (BOOL)_accessibilityIsInFeedView
{
  v2 = [(PXStoryChromeButtonAccessibility *)self _accessibilityFindAncestor:&__block_literal_global_1 startWithSelf:1];
  BOOL v3 = v2 != 0;

  return v3;
}

uint64_t __62__PXStoryChromeButtonAccessibility__accessibilityIsInFeedView__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  MEMORY[0x2455E3C60](@"PXFeedView");
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)isAccessibilityElement
{
  return ![(PXStoryChromeButtonAccessibility *)self _accessibilityIsInFeedView];
}

@end