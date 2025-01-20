@interface NSString(AccessibilityIdentifiers)
+ (id)hk_chartAccessibilityIdentifier:()AccessibilityIdentifiers;
+ (id)hk_chartLollipopAccessibilityIdentifier:()AccessibilityIdentifiers;
+ (id)hk_chartOverlayAccessibilityIdentifier:()AccessibilityIdentifiers;
+ (id)hk_chartOverlayCardioFitnessAccessibilityIdentifier:()AccessibilityIdentifiers;
@end

@implementation NSString(AccessibilityIdentifiers)

+ (id)hk_chartAccessibilityIdentifier:()AccessibilityIdentifiers
{
  v3 = [a3 stringByReplacingOccurrencesOfString:@" " withString:@"_"];
  v4 = [@"UIA.Health" stringByAppendingFormat:@".Chart.%@", v3];

  return v4;
}

+ (id)hk_chartOverlayAccessibilityIdentifier:()AccessibilityIdentifiers
{
  v4 = [NSString stringWithFormat:@"Overlay.%@", a3];
  v5 = objc_msgSend(a1, "hk_chartAccessibilityIdentifier:", v4);

  return v5;
}

+ (id)hk_chartOverlayCardioFitnessAccessibilityIdentifier:()AccessibilityIdentifiers
{
  v4 = [NSString stringWithFormat:@"CardioFitnessLevel.%@", a3];
  v5 = objc_msgSend(a1, "hk_chartOverlayAccessibilityIdentifier:", v4);

  return v5;
}

+ (id)hk_chartLollipopAccessibilityIdentifier:()AccessibilityIdentifiers
{
  v4 = [NSString stringWithFormat:@"LollipopContainer.%@", a3];
  v5 = objc_msgSend(a1, "hk_chartAccessibilityIdentifier:", v4);

  return v5;
}

@end