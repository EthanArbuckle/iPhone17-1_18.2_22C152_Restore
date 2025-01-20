@interface TUIPredictionViewCellInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)accessibilityIgnoresInvertColors;
- (void)layoutSubviews;
@end

@implementation TUIPredictionViewCellInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TUIPredictionViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)TUIPredictionViewCellInvertColorsAccessibility;
  [(TUIPredictionViewCellInvertColorsAccessibility *)&v3 layoutSubviews];
  [(TUIPredictionViewCellInvertColorsAccessibility *)self setAccessibilityIgnoresInvertColors:[(TUIPredictionViewCellInvertColorsAccessibility *)self accessibilityIgnoresInvertColors]];
}

- (BOOL)accessibilityIgnoresInvertColors
{
  if ([(TUIPredictionViewCellInvertColorsAccessibility *)self safeBoolForKey:@"highlighted"])return 0; {
  v4 = [(TUIPredictionViewCellInvertColorsAccessibility *)self safeValueForKey:@"candidate"];
  }
  v5 = [v4 safeStringForKey:@"candidate"];
  char IsSpeakableEmojiString = AXLanguageIsSpeakableEmojiString();

  return IsSpeakableEmojiString;
}

@end