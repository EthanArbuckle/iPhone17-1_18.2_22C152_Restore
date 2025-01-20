@interface CKAvatarNavigationBarAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityPerformEscape;
- (id)accessibilityElements;
@end

@implementation CKAvatarNavigationBarAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CKAvatarNavigationBar";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"CKAvatarNavigationBar" isKindOfClass:@"UINavigationBar"];
  [v3 validateClass:@"CKNavigationBarCanvasView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKNavigationBarCanvasView", @"leftItemView", "@", 0);
  [v3 validateClass:@"CKCanvasBackButtonView"];
}

- (BOOL)accessibilityPerformEscape
{
  id v3 = [(CKAvatarNavigationBarAccessibility *)self safeValueForKeyPath:@"topItem._canvasView"];
  NSClassFromString(&cfstr_Cknavigationba_0.isa);
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_5;
  }
  v4 = [v3 safeValueForKey:@"leftItemView"];
  NSClassFromString(&cfstr_Ckcanvasbackbu_0.isa);
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

LABEL_5:
    v8.receiver = self;
    v8.super_class = (Class)CKAvatarNavigationBarAccessibility;
    BOOL v6 = [(CKAvatarNavigationBarAccessibility *)&v8 accessibilityPerformEscape];
    goto LABEL_6;
  }
  char v9 = 0;
  objc_opt_class();
  v5 = __UIAccessibilityCastAsClass();
  [v5 sendActionsForControlEvents:64];

  BOOL v6 = 1;
LABEL_6:

  return v6;
}

- (id)accessibilityElements
{
  return 0;
}

@end