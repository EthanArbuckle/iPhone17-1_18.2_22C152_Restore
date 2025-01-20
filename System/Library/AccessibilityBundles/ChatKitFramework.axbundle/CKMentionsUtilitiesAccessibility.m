@interface CKMentionsUtilitiesAccessibility
+ (BOOL)range:(_NSRange)a3 containsEmptySelectedRange:(_NSRange)a4;
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
@end

@implementation CKMentionsUtilitiesAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CKMentionsUtilities";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasClassMethod:withFullSignature:", @"CKMentionsUtilities", @"range:containsEmptySelectedRange:", "B", "{_NSRange=QQ}", "{_NSRange=QQ}", 0);
}

+ (BOOL)range:(_NSRange)a3 containsEmptySelectedRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  NSUInteger v6 = a3.length;
  NSUInteger v7 = a3.location;
  if (UIAccessibilityIsVoiceOverRunning() && !length && v6) {
    return 1;
  }
  v10.receiver = a1;
  v10.super_class = (Class)&OBJC_METACLASS___CKMentionsUtilitiesAccessibility;
  return objc_msgSendSuper2(&v10, sel_range_containsEmptySelectedRange_, v7, v6, location, length);
}

@end