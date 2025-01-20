@interface CKAvatarContactNameCollectionReusableViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (CKAvatarContactNameCollectionReusableViewAccessibility)initWithFrame:(CGRect)a3;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation CKAvatarContactNameCollectionReusableViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CKAvatarContactNameCollectionReusableView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKAvatarContactNameCollectionReusableView", @"titleLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKAvatarContactNameCollectionReusableView", @"initWithFrame:", "@", "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v5.receiver = self;
  v5.super_class = (Class)CKAvatarContactNameCollectionReusableViewAccessibility;
  [(CKAvatarContactNameCollectionReusableViewAccessibility *)&v5 _accessibilityLoadAccessibilityInformation];
  objc_opt_class();
  id v3 = [(CKAvatarContactNameCollectionReusableViewAccessibility *)self safeValueForKeyPath:@"titleLabel"];
  v4 = __UIAccessibilityCastAsClass();

  [v4 setIsAccessibilityElement:0];
}

- (CKAvatarContactNameCollectionReusableViewAccessibility)initWithFrame:(CGRect)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CKAvatarContactNameCollectionReusableViewAccessibility;
  id v3 = -[CKAvatarContactNameCollectionReusableViewAccessibility initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(CKAvatarContactNameCollectionReusableViewAccessibility *)v3 _accessibilityLoadAccessibilityInformation];
  return v3;
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

@end