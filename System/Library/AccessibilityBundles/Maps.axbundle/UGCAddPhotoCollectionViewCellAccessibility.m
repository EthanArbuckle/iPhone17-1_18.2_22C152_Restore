@interface UGCAddPhotoCollectionViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation UGCAddPhotoCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UGCAddPhotoCollectionViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"UGCAddPhotoCollectionViewCell" hasInstanceVariable:@"_cameraLabel" withType:"UILabel"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UGCAddPhotoCollectionViewCell", @"isDimmed", "B", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  v2 = [(UGCAddPhotoCollectionViewCellAccessibility *)self safeValueForKey:@"_cameraLabel"];
  id v3 = [v2 accessibilityLabel];

  return v3;
}

- (unint64_t)accessibilityTraits
{
  uint64_t v2 = *MEMORY[0x263F1CEE8];
  int v3 = [(UGCAddPhotoCollectionViewCellAccessibility *)self safeBoolForKey:@"isDimmed"];
  uint64_t v4 = *MEMORY[0x263F1CF20];
  if (!v3) {
    uint64_t v4 = 0;
  }
  return v4 | v2;
}

@end