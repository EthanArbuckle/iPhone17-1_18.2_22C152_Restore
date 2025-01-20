@interface MOSuggestionActivityIconAssetViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)accessibilityLabel;
@end

@implementation MOSuggestionActivityIconAssetViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MomentsUIService.MOSuggestionActivityIconAssetView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  v2 = UIAXStringForAllChildren();
  v4 = _accessibilityReplaceStylsticBulletsForSpeaking(v2, v3);

  return v4;
}

@end