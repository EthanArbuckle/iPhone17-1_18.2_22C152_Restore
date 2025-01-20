@interface DOCAddTagViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (DOCAddTagViewAccessibility)initWithFrame:(CGRect)a3;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation DOCAddTagViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"DOCAddTagView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"DOCAddTagView" hasInstanceVariable:@"_tagNameTextField" withType:"DOCAddTagViewTextField"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"DOCAddTagView", @"initWithFrame:", "@", "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
}

- (DOCAddTagViewAccessibility)initWithFrame:(CGRect)a3
{
  v5.receiver = self;
  v5.super_class = (Class)DOCAddTagViewAccessibility;
  id v3 = -[DOCAddTagViewAccessibility initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(DOCAddTagViewAccessibility *)v3 _accessibilityLoadAccessibilityInformation];

  return v3;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v5.receiver = self;
  v5.super_class = (Class)DOCAddTagViewAccessibility;
  [(DOCAddTagViewAccessibility *)&v5 _accessibilityLoadAccessibilityInformation];
  id v3 = [(DOCAddTagViewAccessibility *)self safeValueForKey:@"_tagNameTextField"];
  v4 = accessibilityLocalizedString(@"add.tag.text.field");
  [v3 setAccessibilityLabel:v4];
}

@end