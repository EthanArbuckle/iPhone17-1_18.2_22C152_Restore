@interface StickerCollectionStickerCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation StickerCollectionStickerCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"StickersUI.StickerCollectionStickerCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (id)accessibilityLabel
{
  v3 = [(StickerCollectionStickerCellAccessibility *)self safeSwiftValueForKey:@"stickerView"];
  v9.receiver = self;
  v9.super_class = (Class)StickerCollectionStickerCellAccessibility;
  v4 = [(StickerCollectionStickerCellAccessibility *)&v9 accessibilityLabel];
  if ([v4 length])
  {
    v8.receiver = self;
    v8.super_class = (Class)StickerCollectionStickerCellAccessibility;
    uint64_t v5 = [(StickerCollectionStickerCellAccessibility *)&v8 accessibilityLabel];
  }
  else
  {
    uint64_t v5 = [v3 accessibilityLabel];
  }
  v6 = (void *)v5;

  return v6;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

@end