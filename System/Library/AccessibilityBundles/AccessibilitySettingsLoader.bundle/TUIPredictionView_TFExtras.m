@interface TUIPredictionView_TFExtras
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (TUIPredictionView_TFExtras)initWithFrame:(CGRect)a3;
- (void)_handleAXLongPress:(id)a3;
- (void)_speakLabelAtCell:(id)a3 forCurrentInputMode:(id)a4;
- (void)layoutSubviews;
- (void)speakTypingLoadAccessibilityInformation;
@end

@implementation TUIPredictionView_TFExtras

+ (id)safeCategoryTargetClassName
{
  return @"TUIPredictionView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (TUIPredictionView_TFExtras)initWithFrame:(CGRect)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TUIPredictionView_TFExtras;
  v3 = -[TUIPredictionView_TFExtras initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3 && _AXSQuickTypePredictionFeedbackEnabled()) {
    [(TUIPredictionView_TFExtras *)v3 speakTypingLoadAccessibilityInformation];
  }
  return v3;
}

- (void)layoutSubviews
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v14.receiver = self;
  v14.super_class = (Class)TUIPredictionView_TFExtras;
  [(TUIPredictionView_TFExtras *)&v14 layoutSubviews];
  if (_AXSQuickTypePredictionFeedbackEnabled()) {
    [(TUIPredictionView_TFExtras *)self speakTypingLoadAccessibilityInformation];
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v3 = [(TUIPredictionView_TFExtras *)self gestureRecognizers];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if ([v8 _accessibilityBoolValueForKey:@"SpeakCell"])
        {
          [(TUIPredictionView_TFExtras *)self frame];
          [v8 setAllowableMovement:v9];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v15 count:16];
    }
    while (v5);
  }
}

- (void)speakTypingLoadAccessibilityInformation
{
  if (([(TUIPredictionView_TFExtras *)self _accessibilityBoolValueForKey:@"accessibilityLongPressGestureRecognizerEnabled"] & 1) == 0)
  {
    id v4 = (id)[objc_alloc(MEMORY[0x263F1C7A0]) initWithTarget:self action:sel__handleAXLongPress_];
    [v4 _accessibilitySetBoolValue:1 forKey:@"SpeakCell"];
    [(TUIPredictionView_TFExtras *)self frame];
    [v4 setAllowableMovement:v3];
    [(TUIPredictionView_TFExtras *)self addGestureRecognizer:v4];
    [(TUIPredictionView_TFExtras *)self _accessibilitySetBoolValue:1 forKey:@"accessibilityLongPressGestureRecognizerEnabled"];
  }
}

- (void)_handleAXLongPress:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(TUIPredictionView_TFExtras *)self safeArrayForKey:@"allVisibleCells"];
  uint64_t v6 = [MEMORY[0x263F1C748] sharedInputModeController];
  v7 = [v6 currentInputMode];
  v8 = [v7 primaryLanguage];

  [v4 locationInView:self];
  double v10 = v9;
  double v12 = v11;
  if ([v4 state] == 1)
  {
    unint64_t v13 = -[TUIPredictionView_TFExtras _predictionCellIndexAtLocation:](self, "_predictionCellIndexAtLocation:", v10, v12);
LABEL_6:
    [(TUIPredictionView_TFExtras *)self _accessibilitySetIntegerValue:v13 forKey:@"accessibilityCurrentIndex"];
    if (v13 < [v5 count])
    {
      objc_super v14 = [v5 objectAtIndexedSubscript:v13];
      [(TUIPredictionView_TFExtras *)self _speakLabelAtCell:v14 forCurrentInputMode:v8];
    }
    goto LABEL_13;
  }
  if ([v4 state] == 2)
  {
    unint64_t v13 = -[TUIPredictionView_TFExtras _predictionCellIndexAtLocation:](self, "_predictionCellIndexAtLocation:", v10, v12);
    if (v13 == [(TUIPredictionView_TFExtras *)self _accessibilityIntegerValueForKey:@"accessibilityCurrentIndex"])goto LABEL_13; {
    v22[0] = MEMORY[0x263EF8330];
    }
    v22[1] = 3221225472;
    v22[2] = __49__TUIPredictionView_TFExtras__handleAXLongPress___block_invoke;
    v22[3] = &unk_26509DD80;
    v22[4] = self;
    v22[5] = v13;
    soft_AXPerformSafeBlock_0(v22);
    goto LABEL_6;
  }
  if ([v4 state] == 3)
  {
    uint64_t v15 = [(TUIPredictionView_TFExtras *)self safeIntegerForKey:@"selectedIndex"];
    uint64_t v16 = [v5 count];
    if ((v15 & 0x8000000000000000) == 0 && v15 < v16)
    {
      v18[0] = MEMORY[0x263EF8330];
      v18[1] = 3221225472;
      v18[2] = __49__TUIPredictionView_TFExtras__handleAXLongPress___block_invoke_2;
      v18[3] = &unk_26509DDA8;
      v20 = self;
      uint64_t v21 = v15;
      id v19 = v5;
      soft_AXPerformSafeBlock_0(v18);
    }
  }
  else
  {
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __49__TUIPredictionView_TFExtras__handleAXLongPress___block_invoke_3;
    v17[3] = &unk_26509DBB0;
    v17[4] = self;
    soft_AXPerformSafeBlock_0(v17);
  }
LABEL_13:
}

- (void)_speakLabelAtCell:(id)a3 forCurrentInputMode:(id)a4
{
  id v9 = a3;
  id v5 = a4;
  if (_AXSQuickTypePredictionFeedbackEnabled())
  {
    uint64_t v6 = [v9 safeValueForKey:@"morphingLabel"];
    v7 = [v6 safeStringForKey:@"text"];

    v8 = [getSpeakTypingServicesClass_0() sharedInstance];
    [v8 notifySpeakServicesToFeedbackQuickTypePrediction:v7 forCurrentInputMode:v5];
  }
}

@end