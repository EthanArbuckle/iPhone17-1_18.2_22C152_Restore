@interface PUReviewScreenControlBarAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (PUReviewScreenControlBarAccessibility)initWithFrame:(CGRect)a3;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation PUReviewScreenControlBarAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PUReviewScreenControlBar";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUReviewScreenControlBar", @"initWithFrame:", "@", "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUReviewScreenControlBar", @"sendButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUReviewScreenControlBar", @"markupButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUReviewScreenControlBar", @"editButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUReviewScreenControlBar", @"funEffectsButton", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v11.receiver = self;
  v11.super_class = (Class)PUReviewScreenControlBarAccessibility;
  [(PUReviewScreenControlBarAccessibility *)&v11 _accessibilityLoadAccessibilityInformation];
  id v3 = [(PUReviewScreenControlBarAccessibility *)self safeValueForKey:@"sendButton"];
  v4 = accessibilityPULocalizedString(@"send.button");
  [v3 setAccessibilityLabel:v4];

  v5 = [(PUReviewScreenControlBarAccessibility *)self safeValueForKey:@"markupButton"];
  v6 = accessibilityPULocalizedString(@"markup.button");
  [v5 setAccessibilityLabel:v6];

  v7 = [(PUReviewScreenControlBarAccessibility *)self safeValueForKey:@"editButton"];
  v8 = accessibilityPULocalizedString(@"edit.button");
  [v7 setAccessibilityLabel:v8];

  v9 = [(PUReviewScreenControlBarAccessibility *)self safeValueForKey:@"funEffectsButton"];
  v10 = accessibilityPULocalizedString(@"effects.button");
  [v9 setAccessibilityLabel:v10];
}

- (PUReviewScreenControlBarAccessibility)initWithFrame:(CGRect)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PUReviewScreenControlBarAccessibility;
  id v3 = -[PUReviewScreenControlBarAccessibility initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(PUReviewScreenControlBarAccessibility *)v3 _accessibilityLoadAccessibilityInformation];
  return v3;
}

@end