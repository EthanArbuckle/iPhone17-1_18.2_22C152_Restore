@interface PKPeerPaymentMessageBalloonViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation PKPeerPaymentMessageBalloonViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PKPeerPaymentMessageBalloonView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKPeerPaymentMessageBalloonView", @"bubbleView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKPeerPaymentMessageBalloonView", @"peerPaymentType", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKPeerPaymentBubbleView", @"_messageText", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKPeerPaymentBubbleView", @"_statusText", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  uint64_t v3 = [(PKPeerPaymentMessageBalloonViewAccessibility *)self safeIntegerForKey:@"peerPaymentType"];
  v4 = [(PKPeerPaymentMessageBalloonViewAccessibility *)self safeValueForKey:@"bubbleView"];
  v5 = __UIAccessibilitySafeClass();

  v6 = [v5 safeStringForKey:@"_messageText"];
  v7 = [v5 safeStringForKey:@"_statusText"];
  if (v6)
  {
    v8 = @"unknown.transfer.format";
    if (v3 == 1) {
      v8 = @"sent.transfer.format";
    }
    if (v3 == 2) {
      v9 = @"received.transfer.format";
    }
    else {
      v9 = v8;
    }
    v10 = NSString;
    v11 = accessibilityLocalizedString(v9);
    v12 = objc_msgSend(v10, "stringWithFormat:", v11, v6);
  }
  else
  {
    v12 = accessibilityLocalizedString(@"unknown.transfer");
  }
  v13 = __UIAXStringForVariables();

  return v13;
}

@end