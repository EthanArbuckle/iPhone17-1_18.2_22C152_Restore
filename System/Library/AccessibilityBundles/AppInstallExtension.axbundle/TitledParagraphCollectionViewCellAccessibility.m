@interface TitledParagraphCollectionViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation TitledParagraphCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"AppInstallExtension.TitledParagraphCollectionViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AppInstallExtension.TitledParagraphCollectionViewCell", @"accessibilitytPrimarySubtitleLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AppInstallExtension.TitledParagraphCollectionViewCell", @"accessibilitySecondarySubtitleLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AppInstallExtension.TitledParagraphCollectionViewCell", @"accessibilityExpandableTextView", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)[(TitledParagraphCollectionViewCellAccessibility *)self _accessibilityStringForLabelKeyValues:@"accessibilitytPrimarySubtitleLabel, accessibilitySecondarySubtitleLabel, accessibilityExpandableTextView"];
}

@end