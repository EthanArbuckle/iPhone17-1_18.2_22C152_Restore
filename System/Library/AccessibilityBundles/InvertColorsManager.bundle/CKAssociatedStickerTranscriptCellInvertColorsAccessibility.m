@interface CKAssociatedStickerTranscriptCellInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)accessibilityIgnoresInvertColors;
@end

@implementation CKAssociatedStickerTranscriptCellInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CKAssociatedStickerTranscriptCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)accessibilityIgnoresInvertColors
{
  return 1;
}

@end