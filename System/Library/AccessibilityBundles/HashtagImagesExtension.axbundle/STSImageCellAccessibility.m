@interface STSImageCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation STSImageCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"STSImageCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"STSImageCell", @"imageInfo", "@", 0);
  [v3 validateClass:@"STSAnimatedImageInfo"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"STSAnimatedImageInfo", @"duration", "d", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CF00];
}

- (id)accessibilityLabel
{
  id v3 = accessibilityLocalizedString(@"meme.label");
  v4 = [(STSImageCellAccessibility *)self safeValueForKey:@"imageInfo"];
  v5 = v4;
  if (!v4 || ([v4 safeFloatForKey:@"duration"], v6 == 0.0))
  {
    v7 = 0;
  }
  else
  {
    v7 = AXDurationStringForDuration();
  }
  v8 = __UIAXStringForVariables();

  return v8;
}

@end