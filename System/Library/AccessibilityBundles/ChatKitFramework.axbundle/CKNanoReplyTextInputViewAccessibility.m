@interface CKNanoReplyTextInputViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityElements;
@end

@implementation CKNanoReplyTextInputViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CKNanoReplyTextInputView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"CKNanoReplyTextInputView" hasProperty:@"sendMenuButton" withType:"@"];
  [v3 validateClass:@"CKNanoReplyTextInputView" hasProperty:@"textInputView" withType:"@"];
}

- (id)accessibilityElements
{
  id v3 = objc_opt_new();
  v4 = [(CKNanoReplyTextInputViewAccessibility *)self safeValueForKey:@"sendMenuButton"];
  [v3 axSafelyAddObject:v4];

  v5 = [(CKNanoReplyTextInputViewAccessibility *)self safeValueForKey:@"textInputView"];
  [v3 axSafelyAddObject:v5];

  if ([v3 count]) {
    v6 = v3;
  }
  else {
    v6 = 0;
  }
  id v7 = v6;

  return v7;
}

@end