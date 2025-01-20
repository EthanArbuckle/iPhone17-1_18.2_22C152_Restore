@interface VUIListLockupCollectionViewCellViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (CGPoint)accessibilityActivationPoint;
- (id)accessibilityCustomActions;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
@end

@implementation VUIListLockupCollectionViewCellViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"VUIListLockupCollectionViewCellView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"VUIListLockupCollectionViewCellView" hasProperty:@"titleLabel" withType:"@"];
  [v3 validateClass:@"VUIListLockupCollectionViewCellView" hasProperty:@"subTitleLabel" withType:"@"];
  [v3 validateClass:@"VUIListLockupCollectionViewCellView" hasProperty:@"primaryButton" withType:"@"];
  [v3 validateClass:@"VUIListLockupCollectionViewCellView" hasProperty:@"secondaryButton" withType:"@"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  id v3 = [(VUIListLockupCollectionViewCellViewAccessibility *)self safeValueForKeyPath:@"titleLabel"];
  v4 = [v3 accessibilityLabel];
  v5 = [(VUIListLockupCollectionViewCellViewAccessibility *)self safeValueForKeyPath:@"subTitleLabel"];
  v8 = [v5 accessibilityLabel];
  v6 = __UIAXStringForVariables();

  return v6;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CEE8];
}

- (id)accessibilityValue
{
  id v3 = [(VUIListLockupCollectionViewCellViewAccessibility *)self safeValueForKey:@"primaryButton"];
  v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 accessibilityLabel];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)VUIListLockupCollectionViewCellViewAccessibility;
    uint64_t v5 = [(VUIListLockupCollectionViewCellViewAccessibility *)&v8 accessibilityValue];
  }
  v6 = (void *)v5;

  return v6;
}

- (CGPoint)accessibilityActivationPoint
{
  id v3 = [(VUIListLockupCollectionViewCellViewAccessibility *)self safeValueForKey:@"primaryButton"];
  v4 = v3;
  if (v3)
  {
    [v3 accessibilityActivationPoint];
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)VUIListLockupCollectionViewCellViewAccessibility;
    [(VUIListLockupCollectionViewCellViewAccessibility *)&v11 accessibilityActivationPoint];
  }
  double v7 = v5;
  double v8 = v6;

  double v9 = v7;
  double v10 = v8;
  result.y = v10;
  result.x = v9;
  return result;
}

- (id)accessibilityCustomActions
{
  char v19 = 0;
  objc_opt_class();
  id v3 = [(VUIListLockupCollectionViewCellViewAccessibility *)self safeValueForKey:@"secondaryButton"];
  v4 = __UIAccessibilityCastAsClass();

  double v5 = [v4 accessibilityLabel];
  double v6 = v5;
  if (v4 && [v5 length])
  {
    v17.receiver = self;
    v17.super_class = (Class)VUIListLockupCollectionViewCellViewAccessibility;
    double v7 = [(VUIListLockupCollectionViewCellViewAccessibility *)&v17 accessibilityCustomActions];
    double v8 = (void *)[v7 mutableCopy];

    if (!v8)
    {
      double v8 = [MEMORY[0x263EFF980] array];
    }
    id v9 = objc_alloc(MEMORY[0x263F1C390]);
    uint64_t v12 = MEMORY[0x263EF8330];
    uint64_t v13 = 3221225472;
    v14 = __78__VUIListLockupCollectionViewCellViewAccessibility_accessibilityCustomActions__block_invoke;
    v15 = &unk_2651662F8;
    id v16 = v4;
    double v10 = (void *)[v9 initWithName:v6 actionHandler:&v12];
    objc_msgSend(v8, "addObject:", v10, v12, v13, v14, v15);
  }
  else
  {
    v18.receiver = self;
    v18.super_class = (Class)VUIListLockupCollectionViewCellViewAccessibility;
    double v8 = [(VUIListLockupCollectionViewCellViewAccessibility *)&v18 accessibilityCustomActions];
  }

  return v8;
}

uint64_t __78__VUIListLockupCollectionViewCellViewAccessibility_accessibilityCustomActions__block_invoke(uint64_t a1)
{
  return 1;
}

@end