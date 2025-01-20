@interface CKStickerTranscriptCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)accessibilityElementsHidden;
- (BOOL)isAccessibilityElement;
- (id)accessibilityIdentifier;
@end

@implementation CKStickerTranscriptCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CKStickerTranscriptCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return AXDoesRequestingClientDeserveAutomation() != 0;
}

- (id)accessibilityIdentifier
{
  return @"dragged.and.dropped.sticker.cell";
}

- (BOOL)accessibilityElementsHidden
{
  return AXDoesRequestingClientDeserveAutomation() == 0;
}

@end