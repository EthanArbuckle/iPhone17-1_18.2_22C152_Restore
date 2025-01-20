@interface SiriMoviesIndividualShowtimeViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityIsShowtimeHighlighted;
- (BOOL)accessibilityIsShowtimeSelected;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
- (void)setAccessibilityShowtimeHighlighted:(BOOL)a3;
- (void)setAccessibilityShowtimeSelected:(BOOL)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setSelected:(BOOL)a3;
@end

@implementation SiriMoviesIndividualShowtimeViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SiriMoviesIndividualShowtimeView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)accessibilityIsShowtimeSelected
{
  return MEMORY[0x270F0A438](self, &__SiriMoviesIndividualShowtimeViewAccessibility__accessibilityIsShowtimeSelected);
}

- (void)setAccessibilityShowtimeSelected:(BOOL)a3
{
}

- (BOOL)accessibilityIsShowtimeHighlighted
{
  return MEMORY[0x270F0A438](self, &__SiriMoviesIndividualShowtimeViewAccessibility__accessibilityIsShowtimeHighlighted);
}

- (void)setAccessibilityShowtimeHighlighted:(BOOL)a3
{
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SiriMoviesIndividualShowtimeView", @"setSelected:", "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SiriMoviesIndividualShowtimeView", @"setHighlighted:", "v", "B", 0);
  [v3 validateClass:@"SiriMoviesIndividualShowtimeView" hasInstanceVariable:@"_timeLabel" withType:"UILabel"];
  [v3 validateClass:@"SiriMoviesIndividualShowtimeView" hasInstanceVariable:@"_showtimeTypeLabel" withType:"UILabel"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  id v3 = [(SiriMoviesIndividualShowtimeViewAccessibility *)self safeValueForKey:@"_timeLabel"];
  v4 = [v3 accessibilityLabel];
  v5 = [(SiriMoviesIndividualShowtimeViewAccessibility *)self safeValueForKey:@"_showtimeTypeLabel"];
  v8 = [v5 accessibilityLabel];
  v6 = __UIAXStringForVariables();

  return v6;
}

- (unint64_t)accessibilityTraits
{
  if ([(SiriMoviesIndividualShowtimeViewAccessibility *)self accessibilityIsShowtimeSelected]|| [(SiriMoviesIndividualShowtimeViewAccessibility *)self accessibilityIsShowtimeHighlighted])
  {
    return *MEMORY[0x263F1CF38];
  }
  v4.receiver = self;
  v4.super_class = (Class)SiriMoviesIndividualShowtimeViewAccessibility;
  return [(SiriMoviesIndividualShowtimeViewAccessibility *)&v4 accessibilityTraits];
}

- (void)setSelected:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)SiriMoviesIndividualShowtimeViewAccessibility;
  -[SiriMoviesIndividualShowtimeViewAccessibility setSelected:](&v5, sel_setSelected_);
  [(SiriMoviesIndividualShowtimeViewAccessibility *)self setAccessibilityShowtimeSelected:v3];
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)SiriMoviesIndividualShowtimeViewAccessibility;
  -[SiriMoviesIndividualShowtimeViewAccessibility setHighlighted:](&v5, sel_setHighlighted_);
  [(SiriMoviesIndividualShowtimeViewAccessibility *)self setAccessibilityShowtimeHighlighted:v3];
}

@end