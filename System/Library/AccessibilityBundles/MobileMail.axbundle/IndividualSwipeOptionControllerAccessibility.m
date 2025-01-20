@interface IndividualSwipeOptionControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
@end

@implementation IndividualSwipeOptionControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"IndividualSwipeOptionController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  v10.receiver = self;
  v10.super_class = (Class)IndividualSwipeOptionControllerAccessibility;
  id v7 = a4;
  [(IndividualSwipeOptionControllerAccessibility *)&v10 tableView:a3 willDisplayCell:v7 forRowAtIndexPath:a5];
  v8 = objc_msgSend(v7, "textLabel", v10.receiver, v10.super_class);
  if ([v8 isEnabled]) {
    uint64_t v9 = 0;
  }
  else {
    uint64_t v9 = *MEMORY[0x263F1CF20];
  }
  [v7 setAccessibilityTraits:v9];
}

@end