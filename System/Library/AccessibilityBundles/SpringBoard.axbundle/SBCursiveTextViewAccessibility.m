@interface SBCursiveTextViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityOverridesInvalidFrames;
- (BOOL)_accessibilityOverridesInvisibility;
- (BOOL)_accessibilityUseAccessibilityFrameForHittest;
- (BOOL)_accessibilityViewIsVisible;
- (BOOL)isAccessibilityElement;
- (CGRect)accessibilityFrame;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
- (void)loadText:(id)a3 pointSize:(double)a4;
@end

@implementation SBCursiveTextViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBCursiveTextView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (void)loadText:(id)a3 pointSize:(double)a4
{
  v14.receiver = self;
  v14.super_class = (Class)SBCursiveTextViewAccessibility;
  id v6 = a3;
  [(SBCursiveTextViewAccessibility *)&v14 loadText:v6 pointSize:a4];
  v7 = [MEMORY[0x263EFF8F8] dataWithContentsOfURL:v6];

  if (!v7) {
    goto LABEL_7;
  }
  id v13 = 0;
  v8 = [MEMORY[0x263F08AC0] propertyListWithData:v7 options:0 format:0 error:&v13];
  id v9 = v13;
  if (!v9)
  {
    v12 = [v8 objectForKey:@"language"];
    [(SBCursiveTextViewAccessibility *)self setAccessibilityLanguage:v12];

LABEL_7:
    UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
    goto LABEL_8;
  }
  v10 = v9;
  v11 = AXLogCommon();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    -[SBCursiveTextViewAccessibility loadText:pointSize:]((uint64_t)v10, v11);
  }

LABEL_8:
}

- (BOOL)_accessibilityOverridesInvisibility
{
  return 1;
}

- (BOOL)_accessibilityUseAccessibilityFrameForHittest
{
  return 1;
}

- (BOOL)_accessibilityOverridesInvalidFrames
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CF68];
}

- (CGRect)accessibilityFrame
{
  v2 = self;
  v3 = [(SBCursiveTextViewAccessibility *)v2 window];
  [v3 frame];
  CGFloat v5 = v4 * 0.5 + -150.0;
  id v6 = [(SBCursiveTextViewAccessibility *)v2 window];
  [v6 frame];
  CGFloat v8 = v7;
  id v9 = [(SBCursiveTextViewAccessibility *)v2 window];

  v18.size.CGFloat height = 300.0;
  v18.origin.CGFloat x = 0.0;
  v18.origin.CGFloat y = v5;
  v18.size.CGFloat width = v8;
  CGRect v19 = UIAccessibilityConvertFrameToScreenCoordinates(v18, v9);
  CGFloat x = v19.origin.x;
  CGFloat y = v19.origin.y;
  CGFloat width = v19.size.width;
  CGFloat height = v19.size.height;

  double v14 = x;
  double v15 = y;
  double v16 = width;
  double v17 = height;
  result.size.CGFloat height = v17;
  result.size.CGFloat width = v16;
  result.origin.CGFloat y = v15;
  result.origin.CGFloat x = v14;
  return result;
}

- (BOOL)_accessibilityViewIsVisible
{
  return 1;
}

- (id)accessibilityLabel
{
  v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  double v4 = [(SBCursiveTextViewAccessibility *)self accessibilityLanguage];
  CGFloat v5 = AXNSLocalizedStringForLocale();

  return v5;
}

- (id)accessibilityHint
{
  AXDeviceHasHomeButton();
  v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  double v4 = [(SBCursiveTextViewAccessibility *)self accessibilityLanguage];
  CGFloat v5 = AXNSLocalizedStringForLocale();

  return v5;
}

- (void)loadText:(uint64_t)a1 pointSize:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_242561000, a2, OS_LOG_TYPE_ERROR, "Failed to create NSPropertyList: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end