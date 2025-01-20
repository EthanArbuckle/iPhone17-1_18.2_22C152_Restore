@interface MusicVideoHorizontalCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation MusicVideoHorizontalCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MusicApplication.MusicVideoHorizontalCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicApplication.MusicVideoHorizontalCell", @"title", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicApplication.MusicVideoHorizontalCell", @"subtitle", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicApplication.MusicVideoHorizontalCell", @"additionalDescription", "@", 0);
  [v3 validateClass:@"MusicApplication.SongCell" isKindOfClass:@"MusicApplication.HorizontalLockupCollectionViewCell"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicApplication.HorizontalLockupCollectionViewCell", @"accessibilityMediaPickerAddButton", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)[(MusicVideoHorizontalCellAccessibility *)self _accessibilityStringForLabelKeyValues:@"title, subtitle, additionalDescription"];
}

- (unint64_t)accessibilityTraits
{
  v9.receiver = self;
  v9.super_class = (Class)MusicVideoHorizontalCellAccessibility;
  unint64_t v3 = [(MusicVideoHorizontalCellAccessibility *)&v9 accessibilityTraits];
  objc_opt_class();
  v4 = [(MusicVideoHorizontalCellAccessibility *)self safeValueForKey:@"accessibilityMediaPickerAddButton"];
  v5 = __UIAccessibilityCastAsClass();

  unint64_t v6 = *MEMORY[0x263F1CEE8] | v3;
  LODWORD(v3) = [v5 safeBoolForKey:@"selected"];

  uint64_t v7 = *MEMORY[0x263F1CF38];
  if (!v3) {
    uint64_t v7 = 0;
  }
  return v6 | v7;
}

@end