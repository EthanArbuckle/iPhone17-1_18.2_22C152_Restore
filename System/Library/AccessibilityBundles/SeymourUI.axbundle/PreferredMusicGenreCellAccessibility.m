@interface PreferredMusicGenreCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (unint64_t)accessibilityTraits;
- (void)accessibilityApplyState:(BOOL)a3;
@end

@implementation PreferredMusicGenreCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SeymourUI.PreferredMusicGenreCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)PreferredMusicGenreCellAccessibility;
  return *MEMORY[0x263F1CEE8] | [(PreferredMusicGenreCellAccessibility *)&v3 accessibilityTraits];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (void)accessibilityApplyState:(BOOL)a3
{
  BOOL v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PreferredMusicGenreCellAccessibility;
  -[PreferredMusicGenreCellAccessibility accessibilityApplyState:](&v8, sel_accessibilityApplyState_);
  if (v3)
  {
    unint64_t v5 = [(PreferredMusicGenreCellAccessibility *)self accessibilityTraits];
    unint64_t v6 = *MEMORY[0x263F1CF38] | v5;
  }
  else
  {
    uint64_t v7 = *MEMORY[0x263F1CF38];
    unint64_t v6 = [(PreferredMusicGenreCellAccessibility *)self accessibilityTraits] & ~v7;
  }
  [(PreferredMusicGenreCellAccessibility *)self setAccessibilityTraits:v6];
}

@end