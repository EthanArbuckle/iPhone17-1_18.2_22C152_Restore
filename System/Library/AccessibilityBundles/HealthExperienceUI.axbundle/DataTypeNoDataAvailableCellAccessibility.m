@interface DataTypeNoDataAvailableCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation DataTypeNoDataAvailableCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HealthExperienceUI.DataTypeNoDataAvailableCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)MEMORY[0x270F80938](self, a2);
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)DataTypeNoDataAvailableCellAccessibility;
  return *MEMORY[0x263F1CEE8] | [(DataTypeNoDataAvailableCellAccessibility *)&v3 accessibilityTraits];
}

@end