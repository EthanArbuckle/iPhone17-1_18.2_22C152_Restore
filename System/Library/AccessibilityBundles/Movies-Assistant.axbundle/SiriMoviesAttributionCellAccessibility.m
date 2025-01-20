@interface SiriMoviesAttributionCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (BOOL)isBuyTicketsCell;
- (id)accessibilityLabel;
@end

@implementation SiriMoviesAttributionCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SiriMoviesAttributionCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (BOOL)isBuyTicketsCell
{
  v2 = [(SiriMoviesAttributionCellAccessibility *)self safeValueForKey:@"_titleLabel"];
  v3 = [v2 accessibilityLabel];
  v4 = accessibilityLocalizedString(@"BUY_TICKETS_TITLE");
  char v5 = [v3 isEqualToString:v4];

  return v5;
}

- (id)accessibilityLabel
{
  if ([(SiriMoviesAttributionCellAccessibility *)self isBuyTicketsCell])
  {
    v3 = accessibilityLocalizedString(@"buy.tickets.fandango");
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)SiriMoviesAttributionCellAccessibility;
    v3 = [(SiriMoviesAttributionCellAccessibility *)&v5 accessibilityLabel];
  }

  return v3;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

@end