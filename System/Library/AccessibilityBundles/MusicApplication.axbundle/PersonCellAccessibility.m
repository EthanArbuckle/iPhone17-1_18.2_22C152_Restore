@interface PersonCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityActivate;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
@end

@implementation PersonCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MusicApplication.PersonCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicApplication.PersonCell", @"personName", "@", 0);
  [v3 validateClass:@"MusicApplication.PersonCell" isKindOfClass:@"MusicApplication.HorizontalLockupCollectionViewCell"];
  [v3 validateClass:@"MusicApplication.HorizontalLockupCollectionViewCell" hasProperty:@"accessoryView" withType:"@"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)[(PersonCellAccessibility *)self safeValueForKey:@"personName"];
}

- (id)accessibilityValue
{
  v2 = [(PersonCellAccessibility *)self safeValueForKey:@"accessoryView"];
  id v3 = [v2 accessibilityLabel];

  return v3;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)PersonCellAccessibility;
  return *MEMORY[0x263F1CEE8] | [(PersonCellAccessibility *)&v3 accessibilityTraits];
}

- (BOOL)accessibilityActivate
{
  objc_super v3 = [(PersonCellAccessibility *)self safeValueForKey:@"accessoryView"];
  v4 = v3;
  if (v3)
  {
    uint64_t v8 = MEMORY[0x263EF8330];
    uint64_t v9 = 3221225472;
    v10 = __48__PersonCellAccessibility_accessibilityActivate__block_invoke;
    v11 = &unk_26513CB60;
    id v12 = v3;
    AXPerformSafeBlock();
    UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);

    BOOL v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)PersonCellAccessibility;
    BOOL v5 = [(PersonCellAccessibility *)&v7 accessibilityActivate];
  }

  return v5;
}

uint64_t __48__PersonCellAccessibility_accessibilityActivate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) accessibilityActivate];
}

@end