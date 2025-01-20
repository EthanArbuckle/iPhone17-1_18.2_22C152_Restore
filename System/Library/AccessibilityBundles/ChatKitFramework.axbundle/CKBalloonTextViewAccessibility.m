@interface CKBalloonTextViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityTextViewShouldBreakUpParagraphs;
- (BOOL)isAccessibilityElement;
- (id)accessibilityValue;
@end

@implementation CKBalloonTextViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CKBalloonTextView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"CKBalloonTextView" isKindOfClass:@"UITextView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UITextView", @"selectedRange", "{_NSRange=QQ}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKBalloonTextView", @"_selectedRange", "{_NSRange=QQ}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UITextView", @"accessibilityContainsOneLink", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIMenu", @"options", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKChatController", @"_menuForChatItem:withParentChatItem:menuAppearance:", "@", "@", "@", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKChatController", @"_parentChatItemForIndexPath:", "@", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (id)accessibilityValue
{
  return (id)[(CKBalloonTextViewAccessibility *)self safeValueForKey:@"_accessibilityGetValue"];
}

- (BOOL)_accessibilityTextViewShouldBreakUpParagraphs
{
  return 0;
}

@end