@interface TUIPredictionViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (int64_t)accessibilityNavigationStyle;
- (unint64_t)_accessibilityScannerGroupTraits;
- (void)_accessibilitySendCandidateNotificationIfNecessary:(BOOL)a3;
- (void)_reloadCellsAnimated:(BOOL)a3;
- (void)configurePredictionCell:(id)a3 forCandidate:(id)a4 animated:(BOOL)a5;
@end

@implementation TUIPredictionViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TUIPredictionView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TUIPredictionView", @"_reloadCellsAnimated:", "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TUIPredictionView", @"configurePredictionCell:forCandidate:animated:", "v", "@", "@", "B", 0);
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (int64_t)accessibilityNavigationStyle
{
  return 2;
}

- (unint64_t)_accessibilityScannerGroupTraits
{
  v3.receiver = self;
  v3.super_class = (Class)TUIPredictionViewAccessibility;
  return [(TUIPredictionViewAccessibility *)&v3 _accessibilityScannerGroupTraits] | 2;
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(@"prediction.view.collapsed.label");
}

- (void)_accessibilitySendCandidateNotificationIfNecessary:(BOOL)a3
{
  v4 = [(TUIPredictionViewAccessibility *)self autocorrectionList];
  id v7 = [v4 autocorrection];

  if ([v7 isContinuousPathConversion])
  {
    v5 = [v7 label];
    if ([v5 length]
      && (![(id)_accessibilitySendCandidateNotificationIfNecessary__PreviousLabel isEqualToString:v5]|| CFAbsoluteTimeGetCurrent()- *(double *)&_accessibilitySendCandidateNotificationIfNecessary__PreviousSentNotificationTime > 1.0))
    {
      v6 = [MEMORY[0x263F21660] axAttributedStringWithString:v5];
      [v6 setAttribute:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F81208]];
      UIAccessibilityPostNotification(*MEMORY[0x263F81200], v6);
      objc_storeStrong((id *)&_accessibilitySendCandidateNotificationIfNecessary__PreviousLabel, v5);
      _accessibilitySendCandidateNotificationIfNecessary__PreviousSentNotificationTime = CFAbsoluteTimeGetCurrent();
    }
  }
  else if (!a3)
  {
    UIAccessibilityPostNotification(*MEMORY[0x263F81200], 0);
  }
}

- (void)_reloadCellsAnimated:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)TUIPredictionViewAccessibility;
  [(TUIPredictionViewAccessibility *)&v4 _reloadCellsAnimated:a3];
  [(TUIPredictionViewAccessibility *)self _accessibilitySendCandidateNotificationIfNecessary:1];
}

- (void)configurePredictionCell:(id)a3 forCandidate:(id)a4 animated:(BOOL)a5
{
  uint64_t v5 = a5;
  v9.receiver = self;
  v9.super_class = (Class)TUIPredictionViewAccessibility;
  id v8 = a3;
  [(TUIPredictionViewAccessibility *)&v9 configurePredictionCell:v8 forCandidate:a4 animated:v5];
  LODWORD(v5) = objc_msgSend(v8, "highlighted", v9.receiver, v9.super_class);

  if (v5) {
    [(TUIPredictionViewAccessibility *)self _accessibilitySendCandidateNotificationIfNecessary:0];
  }
}

@end