@interface PreviousDraftPickerControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation PreviousDraftPickerControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PreviousDraftPickerController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)viewDidAppear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)PreviousDraftPickerControllerAccessibility;
  [(PreviousDraftPickerControllerAccessibility *)&v3 viewDidAppear:a3];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE68], 0);
}

@end