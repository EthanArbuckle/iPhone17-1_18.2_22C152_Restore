@interface CNSharingProfilePhotoPickerViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)viewDidLoad;
@end

@implementation CNSharingProfilePhotoPickerViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CNSharingProfilePhotoPickerViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"CNSharingProfilePhotoPickerViewController" isKindOfClass:@"UIViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CNSharingProfilePhotoPickerViewController", @"previewView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CNSharingProfilePhotoPickerViewController", @"selectedItem", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CNSharingProfilePhotoPickerViewController", @"collectionView:cellForItemAtIndexPath:", "@", "@", "@", 0);
  [v3 validateClass:@"CNSharingProfilePhotoPickerItemCell"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CNSharingProfilePhotoPickerItemCell", @"pickerItem", "@", 0);
  [v3 validateClass:@"CNSharingProfilePhotoPickerItem"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CNSharingProfilePhotoPickerItem", @"avatarItem", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v8.receiver = self;
  v8.super_class = (Class)CNSharingProfilePhotoPickerViewControllerAccessibility;
  [(CNSharingProfilePhotoPickerViewControllerAccessibility *)&v8 _accessibilityLoadAccessibilityInformation];
  objc_initWeak(&location, self);
  id v3 = [(CNSharingProfilePhotoPickerViewControllerAccessibility *)self safeUIViewForKey:@"previewView"];
  [v3 setIsAccessibilityElement:1];
  v4 = accessibilityLocalizedString(@"preview.image.label");
  [v3 setAccessibilityLabel:v4];

  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __100__CNSharingProfilePhotoPickerViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v5[3] = &unk_265118160;
  objc_copyWeak(&v6, &location);
  [v3 _setAccessibilityValueBlock:v5];
  objc_destroyWeak(&v6);

  objc_destroyWeak(&location);
}

id __100__CNSharingProfilePhotoPickerViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained safeValueForKey:@"selectedItem"];
  id v3 = [v2 safeValueForKey:@"avatarItem"];

  v4 = [v3 accessibilityValue];

  return v4;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)CNSharingProfilePhotoPickerViewControllerAccessibility;
  [(CNSharingProfilePhotoPickerViewControllerAccessibility *)&v3 viewDidLoad];
  [(CNSharingProfilePhotoPickerViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)CNSharingProfilePhotoPickerViewControllerAccessibility;
  objc_super v8 = [(CNSharingProfilePhotoPickerViewControllerAccessibility *)&v17 collectionView:v6 cellForItemAtIndexPath:v7];
  objc_initWeak(&location, self);
  objc_initWeak(&from, v8);
  [v8 setIsAccessibilityElement:1];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __96__CNSharingProfilePhotoPickerViewControllerAccessibility_collectionView_cellForItemAtIndexPath___block_invoke;
  v12[3] = &unk_2651181D0;
  objc_copyWeak(&v13, &location);
  objc_copyWeak(&v14, &from);
  [v8 _setAccessibilityTraitsBlock:v12];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __96__CNSharingProfilePhotoPickerViewControllerAccessibility_collectionView_cellForItemAtIndexPath___block_invoke_2;
  v10[3] = &unk_265118160;
  objc_copyWeak(&v11, &from);
  [v8 _setAccessibilityLabelBlock:v10];
  objc_destroyWeak(&v11);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

  return v8;
}

uint64_t __96__CNSharingProfilePhotoPickerViewControllerAccessibility_collectionView_cellForItemAtIndexPath___block_invoke(uint64_t a1)
{
  uint64_t v2 = *MEMORY[0x263F1CEE8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = [WeakRetained safeValueForKey:@"selectedItem"];

  id v5 = objc_loadWeakRetained((id *)(a1 + 40));
  id v6 = [v5 safeValueForKey:@"pickerItem"];

  uint64_t v7 = *MEMORY[0x263F1CF38];
  if (v6 != v4) {
    uint64_t v7 = 0;
  }
  uint64_t v8 = v7 | v2;

  return v8;
}

id __96__CNSharingProfilePhotoPickerViewControllerAccessibility_collectionView_cellForItemAtIndexPath___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = [WeakRetained safeValueForKey:@"pickerItem"];

  objc_super v3 = [v2 safeStringForKey:@"symbolImageName"];
  if ([v3 isEqualToString:@"ellipsis"])
  {
    v4 = accessibilityLocalizedString(@"more.button.label");
  }
  else
  {
    id v5 = [v2 safeValueForKey:@"avatarItem"];
    v4 = [v5 accessibilityValue];
  }

  return v4;
}

@end