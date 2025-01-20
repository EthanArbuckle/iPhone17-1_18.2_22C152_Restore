@interface SleepScheduleClockAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityDraggingBedtimeHand;
- (double)_axLastOutputTimeInterval;
- (id)_axClockComponentsHeader;
- (id)_axClockTimeLabelText;
- (id)_axLastSpokenMessage;
- (void)_axSetLastOutputTimeInterval:(double)a3;
- (void)_axSetLastSpokenMessage:(id)a3;
- (void)_axSpeakMessageIfNeeded:(id)a3;
- (void)gestureRecognizerDidEnd:(id)a3;
- (void)gestureRecognizerDidMove:(id)a3;
- (void)gestureRecognizerDidStart:(id)a3;
- (void)setAccessibilityDraggingBedtimeHand:(BOOL)a3;
@end

@implementation SleepScheduleClockAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SleepHealthUI.SleepScheduleClock";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (double)_axLastOutputTimeInterval
{
  MEMORY[0x270F0A470](self, &__SleepScheduleClockAccessibility___axLastOutputTimeInterval);
  return result;
}

- (void)_axSetLastOutputTimeInterval:(double)a3
{
}

- (id)_axLastSpokenMessage
{
}

- (void)_axSetLastSpokenMessage:(id)a3
{
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SleepHealthUI.SleepScheduleClock", @"accessibilityBedtimeHand", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SleepHealthUI.SleepScheduleComponentsEditView", @"accessibilityComponentsHeader", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SleepHealthUI.SleepScheduleComponentsHeader", @"accessibilityBedtimeTimeLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SleepHealthUI.SleepScheduleComponentsHeader", @"accessibilityWakeUpTimeLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SleepHealthUI.SleepScheduleClock", @"gestureRecognizerDidStart:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SleepHealthUI.SleepScheduleClock", @"gestureRecognizerDidMove:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SleepHealthUI.SleepScheduleComponentsEditView", @"accessibilityClockCaption", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SleepHealthUI.SleepScheduleClockCaption", @"accessibilityClockCaptionMessage", "@", 0);
}

- (void)gestureRecognizerDidStart:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SleepScheduleClockAccessibility;
  [(SleepScheduleClockAccessibility *)&v11 gestureRecognizerDidStart:v4];
  v5 = [(SleepScheduleClockAccessibility *)self safeUIViewForKey:@"accessibilityBedtimeHand"];
  objc_opt_class();
  v6 = __UIAccessibilityCastAsClass();
  [v4 locationInView:v6];
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  [v5 bounds];
  objc_msgSend(v6, "convertRect:fromView:", v5);
  v12.x = v8;
  v12.y = v10;
  [(SleepScheduleClockAccessibility *)self setAccessibilityDraggingBedtimeHand:CGRectContainsPoint(v13, v12)];
}

- (void)gestureRecognizerDidMove:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SleepScheduleClockAccessibility;
  [(SleepScheduleClockAccessibility *)&v7 gestureRecognizerDidMove:a3];
  double Current = CFAbsoluteTimeGetCurrent();
  [(SleepScheduleClockAccessibility *)self _axLastOutputTimeInterval];
  if (Current - v5 > 1.0)
  {
    v6 = [(SleepScheduleClockAccessibility *)self _axClockTimeLabelText];
    [(SleepScheduleClockAccessibility *)self _axSpeakMessageIfNeeded:v6];

    [(SleepScheduleClockAccessibility *)self _axSetLastOutputTimeInterval:Current];
  }
}

- (void)gestureRecognizerDidEnd:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SleepScheduleClockAccessibility;
  [(SleepScheduleClockAccessibility *)&v9 gestureRecognizerDidEnd:a3];
  id v4 = [(SleepScheduleClockAccessibility *)self accessibilityContainer];
  double v5 = [v4 safeValueForKey:@"accessibilityClockCaption"];
  v6 = [v5 safeStringForKey:@"accessibilityClockCaptionMessage"];

  LODWORD(v4) = *MEMORY[0x263F1CDC8];
  objc_super v7 = [(SleepScheduleClockAccessibility *)self _axClockTimeLabelText];
  CGFloat v8 = __UIAXStringForVariables();
  UIAccessibilityPostNotification((UIAccessibilityNotifications)v4, v8);
}

- (void)_axSpeakMessageIfNeeded:(id)a3
{
  id v6 = a3;
  id v4 = [(SleepScheduleClockAccessibility *)self _axLastSpokenMessage];
  char v5 = [v6 isEqualToString:v4];

  if ((v5 & 1) == 0)
  {
    UIAccessibilitySpeakOrQueueIfNeeded();
    [(SleepScheduleClockAccessibility *)self _axSetLastSpokenMessage:v6];
  }
}

- (id)_axClockComponentsHeader
{
  v2 = [(SleepScheduleClockAccessibility *)self accessibilityContainer];
  id v3 = [v2 safeValueForKey:@"accessibilityComponentsHeader"];

  return v3;
}

- (id)_axClockTimeLabelText
{
  objc_opt_class();
  id v3 = [(SleepScheduleClockAccessibility *)self _axClockComponentsHeader];
  if ([(SleepScheduleClockAccessibility *)self accessibilityDraggingBedtimeHand]) {
    id v4 = @"accessibilityBedtimeTimeLabel";
  }
  else {
    id v4 = @"accessibilityWakeUpTimeLabel";
  }
  char v5 = [v3 safeValueForKey:v4];
  id v6 = __UIAccessibilityCastAsClass();

  objc_super v7 = [v6 text];

  return v7;
}

- (BOOL)accessibilityDraggingBedtimeHand
{
  return self->_accessibilityDraggingBedtimeHand;
}

- (void)setAccessibilityDraggingBedtimeHand:(BOOL)a3
{
  self->_accessibilityDraggingBedtimeHand = a3;
}

@end