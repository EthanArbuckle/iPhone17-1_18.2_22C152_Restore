@interface CKTranscriptStatusCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (id)statusButton;
+ (void)_accessibilityPerformValidations:(id)a3;
@end

@implementation CKTranscriptStatusCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CKTranscriptStatusCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

+ (id)statusButton
{
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___CKTranscriptStatusCellAccessibility;
  v2 = objc_msgSendSuper2(&v4, sel_statusButton);
  [v2 accessibilitySetIdentification:@"CKTranscriptStatusButton"];

  return v2;
}

@end