@interface ETCanvasViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityIsDirectTouching;
- (BOOL)_accessibilityServesAsFirstElement;
- (BOOL)accessibilityActivate;
- (BOOL)accessibilityElementsHidden;
- (BOOL)isAccessibilityElement;
- (CGRect)accessibilityFrame;
- (ETCanvasViewAccessibility)initWithFrame:(CGRect)a3;
- (id)_accessibilityDisableDirectTouchTimer;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
- (void)_accessibilityFocusChanged:(id)a3;
- (void)_accessibilityInvalidateDirectTouchTimerAndReschedule:(BOOL)a3;
- (void)_accessibilitySetDisableDirectTouchTimer:(id)a3;
- (void)_accessibilitySetIsDirectTouching:(BOOL)a3;
- (void)_checkForIdle;
- (void)_endMessage:(id)a3 withSend:(BOOL)a4;
- (void)_setIsComposingMessageOfType:(unsigned __int16)a3;
- (void)dealloc;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
@end

@implementation ETCanvasViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ETCanvasView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"ETCanvasView"];
  [v3 validateClass:@"ETCanvasView" isKindOfClass:@"UIView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ETCanvasView", @"isComposing", "B", 0);
  [v3 validateClass:@"ETCanvasView" hasInstanceVariable:@"_currentSketchView" withType:"ETGLSketchView"];
  [v3 validateClass:@"ETCanvasView" hasInstanceVariable:@"_lastActivityTimestamp" withType:"d"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ETCanvasView", @"_sketchInProgress", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ETCanvasView", @"sendCurrentMessage", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ETCanvasView", @"_setIsComposingMessageOfType:", "v", "S", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ETCanvasView", @"_endMessage: withSend:", "v", "@", "B", 0);
  [v3 validateClass:@"MediaInstructionView"];
  [v3 validateClass:@"MediaInstructionView" hasInstanceVariable:@"_textLabel" withType:"UILabel"];
}

- (BOOL)_accessibilityIsDirectTouching
{
  return MEMORY[0x270F0A438](self, &__ETCanvasView___accessibilityIsDirectTouching);
}

- (void)_accessibilitySetIsDirectTouching:(BOOL)a3
{
}

- (id)_accessibilityDisableDirectTouchTimer
{
}

- (void)_accessibilitySetDisableDirectTouchTimer:(id)a3
{
}

- (ETCanvasViewAccessibility)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ETCanvasViewAccessibility;
  id v3 = -[ETCanvasViewAccessibility initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x263F08A00] defaultCenter];
    [v4 addObserver:v3 selector:sel__accessibilityFocusChanged_ name:*MEMORY[0x263F1CDF8] object:0];
  }
  return v3;
}

- (void)dealloc
{
  [(ETCanvasViewAccessibility *)self _accessibilityInvalidateDirectTouchTimerAndReschedule:0];
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x263F1CDF8] object:0];

  v4.receiver = self;
  v4.super_class = (Class)ETCanvasViewAccessibility;
  [(ETCanvasViewAccessibility *)&v4 dealloc];
}

- (BOOL)accessibilityActivate
{
  [(ETCanvasViewAccessibility *)self _accessibilitySetIsDirectTouching:1];
  id v3 = accessibilityLocalizedString(@"people.drawing.canvas.start.drawing");
  UIAccessibilitySpeakAndDoNotBeInterrupted();

  [(ETCanvasViewAccessibility *)self _accessibilityInvalidateDirectTouchTimerAndReschedule:1];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
  return 1;
}

- (BOOL)isAccessibilityElement
{
  v2 = [(ETCanvasViewAccessibility *)self storedIsAccessibilityElement];
  id v3 = v2;
  if (v2) {
    char v4 = [v2 BOOLValue];
  }
  else {
    char v4 = 1;
  }

  return v4;
}

- (BOOL)accessibilityElementsHidden
{
  return ![(ETCanvasViewAccessibility *)self isAccessibilityElement];
}

- (BOOL)_accessibilityServesAsFirstElement
{
  return 1;
}

- (CGRect)accessibilityFrame
{
  v6.receiver = self;
  v6.super_class = (Class)ETCanvasViewAccessibility;
  [(ETCanvasViewAccessibility *)&v6 accessibilityFrame];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (unint64_t)accessibilityTraits
{
  BOOL v2 = [(ETCanvasViewAccessibility *)self _accessibilityIsDirectTouching];
  double v3 = (unint64_t *)MEMORY[0x263F1CEE0];
  if (!v2) {
    double v3 = (unint64_t *)MEMORY[0x263F1CF40];
  }
  return *v3;
}

- (id)accessibilityLabel
{
  if ([(ETCanvasViewAccessibility *)self _accessibilityIsDirectTouching])
  {
    BOOL v2 = 0;
  }
  else
  {
    double v3 = accessibilityLocalizedString(@"people.drawing.canvas");
    double v5 = accessibilityLocalizedString(@"people.drawing.canvas.hint");
    BOOL v2 = __UIAXStringForVariables();
  }

  return v2;
}

- (id)accessibilityHint
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  char v18 = 0;
  objc_opt_class();
  double v3 = [(ETCanvasViewAccessibility *)self safeValueForKey:@"subviews"];
  double v4 = __UIAccessibilityCastAsClass();

  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        MEMORY[0x24564AC10](@"MediaInstructionView");
        if (objc_opt_isKindOfClass())
        {
          v12 = objc_msgSend(v10, "safeValueForKey:", @"_textLabel", (void)v14);
          v11 = [v12 accessibilityLabel];

          goto LABEL_11;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v19 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  v11 = 0;
LABEL_11:

  return v11;
}

- (void)_setIsComposingMessageOfType:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  char v5 = [(ETCanvasViewAccessibility *)self safeBoolForKey:@"isComposing"];
  v11.receiver = self;
  v11.super_class = (Class)ETCanvasViewAccessibility;
  [(ETCanvasViewAccessibility *)&v11 _setIsComposingMessageOfType:v3];
  if ((v5 & 1) == 0
    && [(ETCanvasViewAccessibility *)self safeBoolForKey:@"isComposing"])
  {
    switch((int)v3)
    {
      case 0:
        uint64_t v6 = @"tap.announcement";
        goto LABEL_10;
      case 1:
        uint64_t v6 = @"doodle.announcement";
        goto LABEL_10;
      case 2:
        uint64_t v6 = @"heartbeat.announcement";
        goto LABEL_10;
      case 9:
        uint64_t v6 = @"kiss.announcement";
        goto LABEL_10;
      case 10:
        uint64_t v6 = @"anger.announcement";
LABEL_10:
        uint64_t v7 = accessibilityLocalizedString(v6);
        break;
      default:
        uint64_t v7 = [NSString string];
        break;
    }
    uint64_t v8 = (void *)v7;
    UIAccessibilitySpeakAndDoNotBeInterrupted();
    v9 = [(ETCanvasViewAccessibility *)self _accessibilityDisableDirectTouchTimer];
    v10 = v9;
    if (v9) {
      [v9 invalidate];
    }
  }
}

- (void)_endMessage:(id)a3 withSend:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v4)
  {
    uint64_t v7 = accessibilityLocalizedString(@"sent.announcement");
    UIAccessibilitySpeakAndDoNotBeInterrupted();
  }
  _axSetIsWaitingOnETMessageStart(1);
  [(ETCanvasViewAccessibility *)self _accessibilitySetIsDirectTouching:0];
  [(ETCanvasViewAccessibility *)self _accessibilityInvalidateDirectTouchTimerAndReschedule:0];
  v8.receiver = self;
  v8.super_class = (Class)ETCanvasViewAccessibility;
  [(ETCanvasViewAccessibility *)&v8 _endMessage:v6 withSend:v4];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  _axSetIsWaitingOnETMessageStart(0);
  v8.receiver = self;
  v8.super_class = (Class)ETCanvasViewAccessibility;
  [(ETCanvasViewAccessibility *)&v8 touchesBegan:v7 withEvent:v6];
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)ETCanvasViewAccessibility;
  [(ETCanvasViewAccessibility *)&v5 touchesEnded:a3 withEvent:a4];
  [(ETCanvasViewAccessibility *)self _accessibilityInvalidateDirectTouchTimerAndReschedule:1];
}

- (void)_checkForIdle
{
  if (!UIAccessibilityIsVoiceOverRunning() || (_axIsWaitingOnETMessageStart() & 1) == 0)
  {
    v3.receiver = self;
    v3.super_class = (Class)ETCanvasViewAccessibility;
    [(ETCanvasViewAccessibility *)&v3 _checkForIdle];
  }
}

- (void)_accessibilityInvalidateDirectTouchTimerAndReschedule:(BOOL)a3
{
  BOOL v3 = a3;
  objc_super v5 = [(ETCanvasViewAccessibility *)self _accessibilityDisableDirectTouchTimer];
  [v5 invalidate];

  if (v3)
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __83__ETCanvasViewAccessibility__accessibilityInvalidateDirectTouchTimerAndReschedule___block_invoke;
    v7[3] = &unk_26511CC78;
    v7[4] = self;
    id v6 = [MEMORY[0x263EFFA20] scheduledTimerWithTimeInterval:0 repeats:v7 block:3.0];
  }
  else
  {
    id v6 = 0;
  }
  [(ETCanvasViewAccessibility *)self _accessibilitySetDisableDirectTouchTimer:v6];
}

void __83__ETCanvasViewAccessibility__accessibilityInvalidateDirectTouchTimerAndReschedule___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _accessibilitySetIsDirectTouching:0];
  v1 = accessibilityLocalizedString(@"people.drawing.canvas.stopped.drawing");
  UIAccessibilitySpeakAndDoNotBeInterrupted();

  UIAccessibilityNotifications v2 = *MEMORY[0x263F1CE18];

  UIAccessibilityPostNotification(v2, 0);
}

- (void)_accessibilityFocusChanged:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_super v5 = [v4 userInfo];
  id v6 = [v5 objectForKeyedSubscript:*MEMORY[0x263F1CE00]];

  id v7 = [v4 userInfo];
  objc_super v8 = [v7 objectForKeyedSubscript:*MEMORY[0x263F1CF70]];

  uint64_t v9 = MEMORY[0x24564AC10](@"ETPaletteCircleView");
  uint64_t v10 = MEMORY[0x24564AC10](@"ETCanvasView");
  uint64_t v11 = MEMORY[0x24564AC10](@"ETTranscriptColorWheelAccessibility");
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v12 = [MEMORY[0x263EFF8C0] axArrayByIgnoringNilElementsWithCount:4, v9, v10, v11, MEMORY[0x24564AC10](@"GestureInstructionButton"), 0, 0];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    char isKindOfClass = 0;
    uint64_t v16 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v24 != v16) {
          objc_enumerationMutation(v12);
        }
        if (isKindOfClass & 1) != 0 || (objc_opt_isKindOfClass()) {
          char isKindOfClass = 1;
        }
        else {
          char isKindOfClass = objc_opt_isKindOfClass();
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v14);
  }
  else
  {
    char isKindOfClass = 0;
  }

  char v18 = [v6 accessibilityIdentifier];
  char v19 = [v18 isEqualToString:@"digital.touch.picker.circle.identifier"];

  uint64_t v20 = [v8 accessibilityIdentifier];
  int v21 = [v20 isEqualToString:@"digital.touch.picker.circle.identifier"];

  if ((isKindOfClass & 1) != 0 || (v19 & 1) != 0 || v21)
  {
    v22 = [NSNumber numberWithDouble:CFAbsoluteTimeGetCurrent()];
    [(ETCanvasViewAccessibility *)self setValue:v22 forKey:@"_lastActivityTimestamp"];
  }
}

@end