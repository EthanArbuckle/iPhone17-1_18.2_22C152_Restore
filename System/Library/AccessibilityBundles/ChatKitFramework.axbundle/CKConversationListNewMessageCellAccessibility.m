@interface CKConversationListNewMessageCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation CKConversationListNewMessageCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CKConversationListNewMessageCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v4.receiver = self;
  v4.super_class = (Class)CKConversationListNewMessageCellAccessibility;
  [(CKConversationListNewMessageCellAccessibility *)&v4 _accessibilityLoadAccessibilityInformation];
  v3 = [(CKConversationListNewMessageCellAccessibility *)self safeValueForKey:@"_closeButton"];
  [v3 setIsAccessibilityElement:0];
}

@end