@interface WSBundleCollectionOptionViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (id)accessibilityUserInputLabels;
- (unint64_t)accessibilityTraits;
@end

@implementation WSBundleCollectionOptionViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"WSBundleCollectionOptionView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WSBundleCollectionOptionView", @"bundleCollection", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WKWallpaperBundleCollection", @"wallpaperType", "Q", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CEE8];
}

- (id)accessibilityLabel
{
  v2 = [(WSBundleCollectionOptionViewAccessibility *)self safeValueForKey:@"bundleCollection"];
  uint64_t v3 = [v2 safeUnsignedIntegerForKey:@"wallpaperType"];

  switch(v3)
  {
    case 0:
      v4 = @"still.wallpapers";
      goto LABEL_8;
    case 1:
      v6 = accessibilityLocalizedString(@"motion.wallpapers");
      v5 = AXAttributedStringForBetterPronuciation();

      break;
    case 2:
      v4 = @"dynamic.wallpapers";
      goto LABEL_8;
    case 3:
      v4 = @"stripe.wallpapers";
      goto LABEL_8;
    case 4:
      v4 = @"photo.wallpapers";
LABEL_8:
      v5 = accessibilityLocalizedString(v4);
      break;
    default:
      v5 = 0;
      break;
  }

  return v5;
}

- (id)accessibilityUserInputLabels
{
  v12[1] = *MEMORY[0x263EF8340];
  uint64_t v3 = [(WSBundleCollectionOptionViewAccessibility *)self safeValueForKey:@"bundleCollection"];
  uint64_t v4 = [v3 safeUnsignedIntegerForKey:@"wallpaperType"];

  if (v4 == 2)
  {
    v5 = accessibilityLocalizedString(@"dynamic.wallpapers.short");
    v11 = v5;
    v6 = (void *)MEMORY[0x263EFF8C0];
    v7 = &v11;
    goto LABEL_5;
  }
  if (!v4)
  {
    v5 = accessibilityLocalizedString(@"still.wallpapers.short");
    v12[0] = v5;
    v6 = (void *)MEMORY[0x263EFF8C0];
    v7 = (void **)v12;
LABEL_5:
    v8 = [v6 arrayWithObjects:v7 count:1];

    goto LABEL_7;
  }
  v10.receiver = self;
  v10.super_class = (Class)WSBundleCollectionOptionViewAccessibility;
  v8 = [(WSBundleCollectionOptionViewAccessibility *)&v10 accessibilityUserInputLabels];
LABEL_7:

  return v8;
}

@end