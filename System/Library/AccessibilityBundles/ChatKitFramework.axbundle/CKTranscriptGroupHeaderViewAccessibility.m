@interface CKTranscriptGroupHeaderViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (CKTranscriptGroupHeaderViewAccessibility)initWithFrame:(CGRect)a3 conversation:(id)a4;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation CKTranscriptGroupHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CKTranscriptGroupHeaderView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKTranscriptGroupHeaderView", @"actionButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKTranscriptGroupHeaderView", @"textView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKTranscriptGroupHeaderView", @"initWithFrame: conversation:", "@", "{CGRect={CGPoint=dd}{CGSize=dd}}", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CNComposeRecipientTextView", @"textView", "@", 0);
}

- (CKTranscriptGroupHeaderViewAccessibility)initWithFrame:(CGRect)a3 conversation:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)CKTranscriptGroupHeaderViewAccessibility;
  v4 = -[CKTranscriptGroupHeaderViewAccessibility initWithFrame:conversation:](&v6, sel_initWithFrame_conversation_, a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(CKTranscriptGroupHeaderViewAccessibility *)v4 _accessibilityLoadAccessibilityInformation];

  return v4;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v7.receiver = self;
  v7.super_class = (Class)CKTranscriptGroupHeaderViewAccessibility;
  [(CKTranscriptGroupHeaderViewAccessibility *)&v7 _accessibilityLoadAccessibilityInformation];
  id v3 = [(CKTranscriptGroupHeaderViewAccessibility *)self safeValueForKey:@"actionButton"];
  [v3 setIsAccessibilityElement:0];

  v4 = [(CKTranscriptGroupHeaderViewAccessibility *)self safeValueForKey:@"textView"];
  v5 = [v4 safeValueForKey:@"textView"];
  objc_super v6 = accessibilityLocalizedString(@"to.field");
  [v5 setAccessibilityLabel:v6];
}

@end