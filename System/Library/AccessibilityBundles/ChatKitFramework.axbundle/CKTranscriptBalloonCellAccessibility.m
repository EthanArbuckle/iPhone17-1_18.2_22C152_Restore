@interface CKTranscriptBalloonCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilitySupportsActivateAction;
- (BOOL)accessibilityActivate;
- (BOOL)isAccessibilityElement;
- (CGPoint)accessibilityActivationPoint;
- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)_accessibilityTextViewTextOperationResponder;
- (id)accessibilityCustomRotors;
- (id)accessibilityLabel;
- (id)automationElements;
- (void)updateCheckmarkImage;
@end

@implementation CKTranscriptBalloonCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CKTranscriptBalloonCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"CKTranscriptBalloonCell" isKindOfClass:@"CKEditableCollectionViewCell"];
  [v3 validateClass:@"CKEditableCollectionViewCell" isKindOfClass:@"UICollectionViewCell"];
  [v3 validateClass:@"CKTranscriptBalloonCell" isKindOfClass:@"CKTranscriptMessageCell"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKTranscriptMessageCell", @"failureButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKEditableCollectionViewCell", @"updateCheckmarkImage", "v", 0);
  [v3 validateClass:@"CKTranscriptBalloonCell" isKindOfClass:@"UICollectionViewCell"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UICollectionViewCell", @"isSelected", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UICollectionViewCell", @"isHighlighted", "B", 0);
}

- (id)_accessibilityTextViewTextOperationResponder
{
  return (id)[(CKTranscriptBalloonCellAccessibility *)self safeValueForKey:@"_balloonView"];
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (id)accessibilityLabel
{
  v2 = [(CKTranscriptBalloonCellAccessibility *)self safeValueForKey:@"_balloonView"];
  id v3 = [v2 accessibilityLabel];

  return v3;
}

- (BOOL)_accessibilitySupportsActivateAction
{
  v2 = [(CKTranscriptBalloonCellAccessibility *)self safeValueForKey:@"_balloonView"];
  char v3 = [v2 _accessibilitySupportsActivateAction];

  return v3;
}

- (id)accessibilityCustomRotors
{
  v2 = [(CKTranscriptBalloonCellAccessibility *)self safeValueForKey:@"_balloonView"];
  char v3 = [v2 accessibilityCustomRotors];

  return v3;
}

- (BOOL)accessibilityActivate
{
  v2 = [(CKTranscriptBalloonCellAccessibility *)self safeValueForKey:@"_balloonView"];
  char v3 = [v2 accessibilityActivate];

  return v3;
}

- (CGPoint)accessibilityActivationPoint
{
  v2 = [(CKTranscriptBalloonCellAccessibility *)self safeValueForKey:@"_balloonView"];
  [v2 accessibilityActivationPoint];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.y = v8;
  result.x = v7;
  return result;
}

- (id)automationElements
{
  double v3 = [(CKTranscriptBalloonCellAccessibility *)self safeValueForKey:@"_balloonView"];
  double v4 = [(CKTranscriptBalloonCellAccessibility *)self safeValueForKey:@"failureButton"];
  double v5 = objc_msgSend(MEMORY[0x263EFF8C0], "axArrayByIgnoringNilElementsWithCount:", 2, v3, v4);

  return v5;
}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  if (![v7 _accessibilityAutomationHitTest]) {
    goto LABEL_3;
  }
  double v8 = [(CKTranscriptBalloonCellAccessibility *)self safeValueForKey:@"_balloonView"];
  v9 = [(CKTranscriptBalloonCellAccessibility *)self safeValueForKey:@"_balloonView"];
  -[CKTranscriptBalloonCellAccessibility convertPoint:toView:](self, "convertPoint:toView:", v9, x, y);
  v10 = objc_msgSend(v8, "_accessibilityHitTest:withEvent:", v7);

  if (!v10)
  {
LABEL_3:
    v12.receiver = self;
    v12.super_class = (Class)CKTranscriptBalloonCellAccessibility;
    v10 = -[CKTranscriptBalloonCellAccessibility _accessibilityHitTest:withEvent:](&v12, sel__accessibilityHitTest_withEvent_, v7, x, y);
  }

  return v10;
}

- (void)updateCheckmarkImage
{
  v5.receiver = self;
  v5.super_class = (Class)CKTranscriptBalloonCellAccessibility;
  [(CKTranscriptBalloonCellAccessibility *)&v5 updateCheckmarkImage];
  double v3 = [(CKTranscriptBalloonCellAccessibility *)self safeValueForKey:@"_balloonView"];
  if (([(CKTranscriptBalloonCellAccessibility *)self safeBoolForKey:@"isHighlighted"] & 1) != 0
    || [(CKTranscriptBalloonCellAccessibility *)self safeBoolForKey:@"isSelected"])
  {
    double v4 = (void *)MEMORY[0x263F1CF38];
  }
  else
  {
    double v4 = (void *)MEMORY[0x263F1CF18];
  }
  [v3 setAccessibilityTraits:*v4];
}

@end