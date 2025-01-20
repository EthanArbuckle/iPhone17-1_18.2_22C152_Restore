@interface UIAutocorrectInlinePromptAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (CGRect)accessibilityFrame;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
- (void)setCorrection:(id)a3 typedText:(id)a4 inRect:(CGRect)a5 maxX:(double)a6;
@end

@implementation UIAutocorrectInlinePromptAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIAutocorrectInlinePrompt";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  v5 = location;
  id v4 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = @"UIAutocorrectInlinePrompt";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", "@", "@", "{CGRect={CGPoint=dd}{CGSize=dd}}", "d", 0);
  [location[0] validateClass:v3 hasInstanceVariable:@"m_correctionView" withType:"UIView"];
  objc_storeStrong(v5, v4);
}

- (void)setCorrection:(id)a3 typedText:(id)a4 inRect:(CGRect)a5 maxX:(double)a6
{
  CGRect v15 = a5;
  v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v12 = 0;
  objc_storeStrong(&v12, a4);
  double v11 = a6;
  v10.receiver = v14;
  v10.super_class = (Class)UIAutocorrectInlinePromptAccessibility;
  -[UIAutocorrectInlinePromptAccessibility setCorrection:typedText:inRect:maxX:](&v10, sel_setCorrection_typedText_inRect_maxX_, location[0], v12, v15.origin.x, v15.origin.y, v15.size.width, v15.size.height, a6);
  id v8 = (id)[(UIAutocorrectInlinePromptAccessibility *)v14 safeValueForKey:@"m_correctionView"];
  char v9 = [v8 _accessibilityViewIsVisible];

  if (v9) {
    UIAccessibilityPostNotification(*MEMORY[0x263F81200], 0);
  }
  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);
}

- (unint64_t)accessibilityTraits
{
  v5 = self;
  SEL v4 = a2;
  v3.receiver = self;
  v3.super_class = (Class)UIAutocorrectInlinePromptAccessibility;
  return [(UIAutocorrectInlinePromptAccessibility *)&v3 accessibilityTraits] | *MEMORY[0x263F1CEE8] | *MEMORY[0x263F219A8];
}

- (BOOL)isAccessibilityElement
{
  id v5 = (id)[(UIAutocorrectInlinePromptAccessibility *)self safeValueForKey:@"m_correction"];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0) {
    return 0;
  }
  id v3 = [(UIAutocorrectInlinePromptAccessibility *)self accessibilityLabel];
  BOOL v4 = [v3 length] != 0;

  return v4;
}

- (CGRect)accessibilityFrame
{
  id v10 = (id)[(UIAutocorrectInlinePromptAccessibility *)self safeValueForKey:@"correctionView"];
  [v10 accessibilityFrame];
  double v11 = v2;
  double v12 = v3;
  double v13 = v4;
  double v14 = v5;

  double v6 = v11;
  double v7 = v12;
  double v8 = v13;
  double v9 = v14;
  result.size.height = v9;
  result.size.width = v8;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

- (id)accessibilityLabel
{
  return (id)[(UIAutocorrectInlinePromptAccessibility *)self safeValueForKey:@"m_correction", a2, self];
}

@end