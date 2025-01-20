@interface AVTFunCamAvatarPickerCollectionViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)viewDidLoad;
@end

@implementation AVTFunCamAvatarPickerCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"AVTFunCamAvatarPickerCollectionViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVTFunCamAvatarPickerCollectionViewCell", @"accessoryButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVTFunCamAvatarPickerCollectionViewCell", @"selectionVisible", "B", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v5.receiver = self;
  v5.super_class = (Class)AVTFunCamAvatarPickerCollectionViewCellAccessibility;
  [(AVTFunCamAvatarPickerCollectionViewCellAccessibility *)&v5 _accessibilityLoadAccessibilityInformation];
  id v3 = [(AVTFunCamAvatarPickerCollectionViewCellAccessibility *)self safeValueForKey:@"accessoryButton"];
  [v3 setIsAccessibilityElement:0];

  v4 = [(AVTFunCamAvatarPickerCollectionViewCellAccessibility *)self safeValueForKeyPath:@"accessoryButton.titleLabel"];
  [v4 setIsAccessibilityElement:0];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)AVTFunCamAvatarPickerCollectionViewCellAccessibility;
  [(AVTFunCamAvatarPickerCollectionViewCellAccessibility *)&v3 viewDidLoad];
  [(AVTFunCamAvatarPickerCollectionViewCellAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end