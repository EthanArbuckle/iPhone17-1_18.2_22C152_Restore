@interface AVTPoseSelectionViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)setMode:(unint64_t)a3;
@end

@implementation AVTPoseSelectionViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"AVTPoseSelectionViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVTPoseSelectionViewController", @"setMode:", "v", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVTPoseSelectionViewController", @"mode", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVTPoseSelectionViewController", @"headerViewController", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVTPoseSelectionViewController", @"gridViewController", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVTAnimojiPoseSelectionHeaderViewController", @"avtView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVTPoseSelectionGridViewController", @"selectedStickerConfiguration", "@", 0);
}

- (void)setMode:(unint64_t)a3
{
  v9.receiver = self;
  v9.super_class = (Class)AVTPoseSelectionViewControllerAccessibility;
  -[AVTPoseSelectionViewControllerAccessibility setMode:](&v9, sel_setMode_);
  if (a3)
  {
    v5 = [(AVTPoseSelectionViewControllerAccessibility *)self safeValueForKeyPath:@"headerViewController.avtView"];
    [v5 setAccessibilityLabel:0];
  }
  else
  {
    objc_opt_class();
    v6 = [(AVTPoseSelectionViewControllerAccessibility *)self safeValueForKeyPath:@"gridViewController.selectedStickerConfiguration"];
    v5 = __UIAccessibilityCastAsClass();

    v7 = [(AVTPoseSelectionViewControllerAccessibility *)self safeValueForKeyPath:@"headerViewController.avtView"];
    v8 = [v5 localizedName];
    [v7 setAccessibilityLabel:v8];
  }
}

@end