@interface UIContextualActionAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
@end

@implementation UIContextualActionAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIContextualAction";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  v4 = location;
  id obj = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"UIContextualAction", @"title", "@", 0);
  objc_storeStrong(v4, obj);
}

- (id)accessibilityLabel
{
  v5 = self;
  location[1] = (id)a2;
  location[0] = (id)[(UIContextualActionAccessibility *)self accessibilityUserDefinedLabel];
  if (location[0]) {
    id v6 = location[0];
  }
  else {
    id v6 = (id)[(UIContextualActionAccessibility *)v5 _accessibilityStringForLabelKeyValues:@"title"];
  }
  objc_storeStrong(location, 0);
  v2 = v6;

  return v2;
}

@end