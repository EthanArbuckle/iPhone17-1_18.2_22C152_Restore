@interface STUIStatusBarIndicatorRingerSilenceItemAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
@end

@implementation STUIStatusBarIndicatorRingerSilenceItemAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"STUIStatusBarIndicatorRingerSilenceItem";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"STUIStatusBarIndicatorRingerSilenceItem" isKindOfClass:@"STUIStatusBarIndicatorItem"];
  [v3 validateClass:@"STUIStatusBarIndicatorItem" hasInstanceVariable:@"_imageView" withType:"STUIStatusBarImageView"];
  [v3 validateClass:@"STUIStatusBarImageView" isKindOfClass:@"UIImageView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIImageAsset", @"assetName", "@", 0);
}

- (id)accessibilityLabel
{
  char v12 = 0;
  objc_opt_class();
  id v3 = [(STUIStatusBarIndicatorRingerSilenceItemAccessibility *)self safeValueForKey:@"imageView"];
  v4 = __UIAccessibilityCastAsClass();

  v5 = [v4 image];

  if ([v5 isSymbolImage])
  {
    v6 = [v5 imageAsset];
    v7 = [v6 safeStringForKey:@"assetName"];

    if ([v7 isEqualToString:@"bell.slash.fill"])
    {
      v8 = @"status.bar.item.ringer.silent.mode.label";
LABEL_6:
      v9 = accessibilityLocalizedString(v8);

      goto LABEL_9;
    }
    if ([v7 isEqualToString:@"bell.fill"])
    {
      v8 = @"status.bar.item.ringer.ring.mode.label";
      goto LABEL_6;
    }
  }
  v11.receiver = self;
  v11.super_class = (Class)STUIStatusBarIndicatorRingerSilenceItemAccessibility;
  v9 = [(STUIStatusBarIndicatorRingerSilenceItemAccessibility *)&v11 accessibilityLabel];
LABEL_9:

  return v9;
}

@end