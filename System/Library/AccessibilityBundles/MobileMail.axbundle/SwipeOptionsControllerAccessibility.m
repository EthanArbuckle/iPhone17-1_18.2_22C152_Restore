@interface SwipeOptionsControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_configureSwipeDiagramInCell:(id)a3 atIndexPath:(id)a4;
@end

@implementation SwipeOptionsControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SwipeOptionsController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)_configureSwipeDiagramInCell:(id)a3 atIndexPath:(id)a4
{
  id v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SwipeOptionsControllerAccessibility;
  id v7 = a4;
  [(SwipeOptionsControllerAccessibility *)&v13 _configureSwipeDiagramInCell:v6 atIndexPath:v7];
  uint64_t v8 = objc_msgSend(v7, "section", v13.receiver, v13.super_class);

  v9 = @"right";
  if (!v8) {
    v9 = @"left";
  }
  v10 = v9;
  if ([(__CFString *)v10 isEqualToString:@"left"])
  {
    v11 = @"diagram.swipe.left";
LABEL_7:
    v12 = accessibilityLocalizedString(v11);
    [v6 setAccessibilityLabel:v12];

    goto LABEL_8;
  }
  if ([(__CFString *)v10 isEqualToString:@"right"])
  {
    v11 = @"diagram.swipe.right";
    goto LABEL_7;
  }
LABEL_8:
  [v6 setIsAccessibilityElement:1];
  [v6 setAccessibilityTraits:*MEMORY[0x263F1CF00]];
}

@end