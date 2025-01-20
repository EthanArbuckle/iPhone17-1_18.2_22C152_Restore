@interface MFPhotoPickerControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityPerformEscape;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)viewDidLoad;
@end

@implementation MFPhotoPickerControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MFPhotoPickerController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"MFPhotoPickerController" isKindOfClass:@"UICollectionViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MFPhotoPickerController", @"photosFetchResult", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MFPhotoPickerController", @"close:", "v", "@", 0);
  [v3 validateClass:@"UICollectionViewController" isKindOfClass:@"UIViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIViewController", @"navigationItem", "@", 0);
  [v3 validateClass:@"MFPhotoPickerController" isKindOfClass:@"UICollectionViewController"];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v9.receiver = self;
  v9.super_class = (Class)MFPhotoPickerControllerAccessibility;
  [(MFPhotoPickerControllerAccessibility *)&v9 _accessibilityLoadAccessibilityInformation];
  objc_opt_class();
  v2 = __UIAccessibilityCastAsClass();
  uint64_t v3 = *MEMORY[0x263F1CEF8];
  v4 = [v2 navigationItem];
  v5 = [v4 leftBarButtonItem];
  [v5 setAccessibilityTraits:v3];

  v6 = UIKitAccessibilityLocalizedString();
  v7 = [v2 navigationItem];
  v8 = [v7 rightBarButtonItem];
  [v8 setAccessibilityLabel:v6];
}

- (BOOL)accessibilityPerformEscape
{
  return 1;
}

uint64_t __66__MFPhotoPickerControllerAccessibility_accessibilityPerformEscape__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) close:0];
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)MFPhotoPickerControllerAccessibility;
  v8 = [(MFPhotoPickerControllerAccessibility *)&v15 collectionView:v6 cellForItemAtIndexPath:v7];
  objc_opt_class();
  objc_super v9 = [(MFPhotoPickerControllerAccessibility *)self safeValueForKey:@"photosFetchResult"];
  v10 = __UIAccessibilityCastAsClass();

  v11 = objc_msgSend(v10, "objectAtIndex:", objc_msgSend(v7, "item"));
  v12 = [v11 accessibilityLabel];
  [v8 setAccessibilityLabel:v12];

  v13 = [v11 accessibilityCustomContent];
  [v8 setAccessibilityCustomContent:v13];

  return v8;
}

- (void)viewDidLoad
{
  v7.receiver = self;
  v7.super_class = (Class)MFPhotoPickerControllerAccessibility;
  [(MFPhotoPickerControllerAccessibility *)&v7 viewDidLoad];
  [(MFPhotoPickerControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
  objc_opt_class();
  uint64_t v3 = __UIAccessibilityCastAsClass();
  UIAccessibilityNotifications v4 = *MEMORY[0x263F1CE18];
  v5 = [v3 navigationItem];
  id v6 = [v5 titleView];
  UIAccessibilityPostNotification(v4, v6);
}

@end