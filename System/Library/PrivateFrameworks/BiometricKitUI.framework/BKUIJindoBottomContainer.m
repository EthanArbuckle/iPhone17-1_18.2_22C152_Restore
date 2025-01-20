@interface BKUIJindoBottomContainer
- (BOOL)_shouldShowBottomLinkButton;
- (BOOL)showStartOverForState:(int)a3;
- (id)escapeHatchButtonForState:(int)a3;
- (void)_updateButtonVisibilityForScrollView:(id)a3 state:(int)a4 subState:(int)a5;
- (void)buttonSelectedWithButtonTrayPosition:(int64_t)a3;
- (void)setupInitialUI;
@end

@implementation BKUIJindoBottomContainer

- (void)setupInitialUI
{
  v7.receiver = self;
  v7.super_class = (Class)BKUIJindoBottomContainer;
  [(BKUIPearlEnrollViewBottomContainer *)&v7 setupInitialUI];
  v3 = [(BKUIPearlEnrollViewBottomContainer *)self onScreenScrollview];
  v4 = [v3 buttonTray];
  [v4 setActionDelegate:self];

  v5 = [(BKUIPearlEnrollViewBottomContainer *)self offScreenScrollview];
  v6 = [v5 buttonTray];
  [v6 setActionDelegate:self];
}

- (void)_updateButtonVisibilityForScrollView:(id)a3 state:(int)a4 subState:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  id v46 = a3;
  v8 = [(BKUIPearlEnrollViewBottomContainer *)self delegate];
  v9 = [v8 _nextStateButtonTitleForState:v6 subState:v5];

  v10 = [(BKUIPearlEnrollViewBottomContainer *)self delegate];
  int v11 = [v10 state];

  if (v9) {
    uint64_t v12 = v11 != 2;
  }
  else {
    uint64_t v12 = 0;
  }
  if (v11 == 2 && v9)
  {
    v13 = [(BKUIPearlEnrollViewBottomContainer *)self delegate];
    v14 = [v13 currentOperationHandler];
    uint64_t v12 = [v14 canStartEnrollmentOperation];
  }
  v15 = [v46 buttonTray];
  v16 = [v15 nextStateButton];
  [v16 setEnabled:v12];

  v17 = [v46 buttonTray];
  v18 = v17;
  switch((int)v6)
  {
    case 0:
    case 1:
    case 2:
    case 6:
      v19 = [v17 topLinkButton];
      [v19 setAlpha:0.0];

      v20 = [v18 nextStateButton];
      [v20 setAlpha:(double)v12];

      v21 = [v18 bottomLinkButton];
      v22 = v21;
      double v23 = 0.0;
      goto LABEL_15;
    case 3:
    case 4:
      v24 = [(BKUIPearlEnrollViewBottomContainer *)self delegate];
      if ([v24 state] == 3)
      {
        v25 = [(BKUIPearlEnrollViewBottomContainer *)self delegate];
        v26 = [v25 currentOperationHandler];
        int v27 = [v26 shouldShowRetryUI];
      }
      else
      {
        int v27 = 0;
      }

      v22 = [v18 topLinkButton];
      if (v27)
      {
        v39 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        v40 = [v39 localizedStringForKey:@"TRY_AGAIN" value:&stru_1F4081468 table:@"Pearl-periocular"];
        [v22 setTitle:v40 forState:0];

        v41 = [v18 bottomLinkButton];
        v42 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        v43 = [v42 localizedStringForKey:@"SET_UP_LATER_IN_SETTINGS" value:&stru_1F4081468 table:@"Pearl-periocular"];
        [v41 setTitle:v43 forState:0];

        [v22 setAlpha:1.0];
      }
      else
      {
        v44 = [(BKUIPearlEnrollViewBottomContainer *)self delegate];
        objc_msgSend(v22, "setAlpha:", (double)objc_msgSend(v44, "inBuddy"));
      }
      v45 = [v18 nextStateButton];
      [v45 setAlpha:(double)v12];

      v32 = [v18 bottomLinkButton];
      [v32 setAlpha:1.0];
      goto LABEL_23;
    case 5:
    case 7:
      v28 = [v17 topLinkButton];
      [v28 setAlpha:1.0];

      v29 = [v18 nextStateButton];
      [v29 setAlpha:0.0];

      goto LABEL_14;
    case 8:
      v30 = [v17 topLinkButton];
      [v30 setAlpha:0.0];

      v31 = [v18 nextStateButton];
      [v31 setAlpha:(double)v12];

      v22 = [v18 bottomLinkButton];
      v32 = [(BKUIPearlEnrollViewBottomContainer *)self delegate];
      v33 = [v32 currentOperationHandler];
      unsigned int v34 = [v33 glassesFound];
      goto LABEL_17;
    case 9:
      v35 = [v17 topLinkButton];
      [v35 setAlpha:0.0];

      v36 = [v18 nextStateButton];
      [v36 setAlpha:(double)v12];

LABEL_14:
      v21 = [v18 bottomLinkButton];
      v22 = v21;
      double v23 = 1.0;
LABEL_15:
      [v21 setAlpha:v23];
      goto LABEL_24;
    case 10:
      v37 = [v17 topLinkButton];
      [v37 setAlpha:0.0];

      v38 = [v18 nextStateButton];
      [v38 setAlpha:(double)v12];

      v22 = [v18 bottomLinkButton];
      v32 = [(BKUIPearlEnrollViewBottomContainer *)self delegate];
      v33 = [v32 currentOperationHandler];
      unsigned int v34 = [v33 showAddGlassesButton];
LABEL_17:
      [v22 setAlpha:(double)v34];

LABEL_23:
LABEL_24:

      break;
    default:
      break;
  }
  [(BKUIPearlEnrollViewBottomContainer *)self _updateButtonLayoutForScrollView:v46];
}

- (void)buttonSelectedWithButtonTrayPosition:(int64_t)a3
{
  if (a3 == 3)
  {
    v8 = [(BKUIPearlEnrollViewBottomContainer *)self delegate];
    v9 = -[BKUIJindoBottomContainer escapeHatchButtonForState:](self, "escapeHatchButtonForState:", [v8 state]);
    v10 = [(BKUIPearlEnrollViewBottomContainer *)self buttonTray];
    int v11 = [v10 bottomLinkButton];

    id v12 = [(BKUIPearlEnrollViewBottomContainer *)self delegate];
    if (v9 != v11)
    {
      [v12 cancelEnroll];
      goto LABEL_11;
    }
LABEL_10:
    [v12 escapeHatchButtonPressed];
    goto LABEL_11;
  }
  if (a3 == 2)
  {
    id v12 = [(BKUIPearlEnrollViewBottomContainer *)self delegate];
    [v12 nextStateButtonPressed:self];
    goto LABEL_11;
  }
  if (a3 != 1) {
    return;
  }
  v4 = [(BKUIPearlEnrollViewBottomContainer *)self delegate];
  uint64_t v5 = -[BKUIJindoBottomContainer escapeHatchButtonForState:](self, "escapeHatchButtonForState:", [v4 state]);
  uint64_t v6 = [(BKUIPearlEnrollViewBottomContainer *)self buttonTray];
  objc_super v7 = [v6 topLinkButton];

  id v12 = [(BKUIPearlEnrollViewBottomContainer *)self delegate];
  if (v5 == v7) {
    goto LABEL_10;
  }
  [v12 retryPressed];
LABEL_11:
}

- (id)escapeHatchButtonForState:(int)a3
{
  if (a3 > 0xA)
  {
    uint64_t v5 = 0;
  }
  else
  {
    if (((1 << a3) & 0x747) != 0)
    {
      v4 = [(BKUIPearlEnrollViewBottomContainer *)self buttonTray];
      uint64_t v5 = [v4 bottomLinkButton];
    }
    else
    {
      v4 = [(BKUIPearlEnrollViewBottomContainer *)self delegate];
      uint64_t v6 = [v4 currentOperationHandler];
      if ([v6 shouldShowRetryUI])
      {
        uint64_t v5 = [(BKUIPearlEnrollViewBottomContainer *)self bottomLinkButton];
      }
      else
      {
        objc_super v7 = [(BKUIPearlEnrollViewBottomContainer *)self buttonTray];
        uint64_t v5 = [v7 topLinkButton];
      }
    }
  }

  return v5;
}

- (BOOL)_shouldShowBottomLinkButton
{
  return 1;
}

- (BOOL)showStartOverForState:(int)a3
{
  uint64_t v5 = [(BKUIPearlEnrollViewBottomContainer *)self delegate];
  if ([v5 state] == 3)
  {
    uint64_t v6 = [(BKUIPearlEnrollViewBottomContainer *)self delegate];
    objc_super v7 = [v6 currentOperationHandler];
    char v8 = [v7 shouldShowRetryUI];

    if (v8) {
      return 0;
    }
  }
  else
  {
  }
  if (a3 <= 0xA) {
    return (0x1F8u >> a3) & 1;
  }
  else {
    return 1;
  }
}

@end