@interface STSegmentItemAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (id)accessibilityValue;
@end

@implementation STSegmentItemAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"STSegmentItem";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"STSegmentItem" hasInstanceVariable:@"_titleText" withType:"NSString"];
  [v3 validateClass:@"STSegmentItem" hasInstanceVariable:@"_detailText" withType:"NSString"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)[(STSegmentItemAccessibility *)self safeStringForKey:@"_titleText"];
}

- (id)accessibilityValue
{
  return (id)[(STSegmentItemAccessibility *)self safeStringForKey:@"_detailText"];
}

@end