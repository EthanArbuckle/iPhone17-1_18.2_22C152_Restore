@interface _UNBlockTouchesViewAcessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (_UNBlockTouchesViewAcessibility)initWithFrame:(CGRect)a3;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation _UNBlockTouchesViewAcessibility

+ (id)safeCategoryTargetClassName
{
  return @"_UNBlockTouchesView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)MEMORY[0x270F9A6F8](MEMORY[0x263F8B098], a2);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"_UNBlockTouchesView" isKindOfClass:@"UIView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_UNBlockTouchesView", @"initWithFrame:", "@", "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v4.receiver = self;
  v4.super_class = (Class)_UNBlockTouchesViewAcessibility;
  [(_UNBlockTouchesViewAcessibility *)&v4 _accessibilityLoadAccessibilityInformation];
  id v3 = [(_UNBlockTouchesViewAcessibility *)self layer];
  [v3 setAccessibilityIdentifier:@"NCBlockTouchesViewCALayer"];
}

- (_UNBlockTouchesViewAcessibility)initWithFrame:(CGRect)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_UNBlockTouchesViewAcessibility;
  id v3 = -[_UNBlockTouchesViewAcessibility initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(_UNBlockTouchesViewAcessibility *)v3 _accessibilityLoadAccessibilityInformation];
  return v3;
}

@end