@interface SCATXYAxisPointPicker
+ (unint64_t)minimumNumberOfCycles;
- (BOOL)allowsSelectionRefinement;
- (BOOL)handleInputAction:(id)a3 withElement:(id)a4;
- (BOOL)isRefiningPoint;
- (BOOL)pauseForNumberOfCycles:(unint64_t)a3;
- (BOOL)providesElements;
- (BOOL)shouldKeepScannerAwake;
- (BOOL)shouldRescanAfterTap;
- (BOOL)usesTwoLevelRefinement;
- (SCATFocusContext)sweepFocusContext;
- (id)_initWithMenu:(id)a3;
- (int64_t)pickerType;
- (unint64_t)pickerPhase;
- (void)_handleScannerUIWillHide:(id)a3;
- (void)_handleScannerUIWillShow:(id)a3;
- (void)_updateVisualProviderWithMenu:(id)a3;
- (void)didFetchElements:(id)a3 foundNewElements:(BOOL)a4 currentFocusContext:(id)a5 didChangeActiveElementManager:(BOOL)a6;
- (void)didGetPhaseChangingAction;
- (void)didSweepOverPoint:(CGPoint)a3;
- (void)setPickerPhase:(unint64_t)a3;
- (void)setSweepFocusContext:(id)a3;
- (void)setUsesTwoLevelRefinement:(BOOL)a3;
- (void)visualProviderDidDismiss;
- (void)visualProviderDidPresent;
- (void)visualProviderDidUpdate;
@end

@implementation SCATXYAxisPointPicker

- (id)_initWithMenu:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SCATXYAxisPointPicker;
  id v5 = [(SCATPointPicker *)&v9 _initWithMenu:v4];
  v6 = v5;
  if (v5)
  {
    [v5 _updateVisualProviderWithMenu:v4];
    v7 = +[NSNotificationCenter defaultCenter];
    [v7 addObserver:v6 selector:"_handleScannerUIWillHide:" name:off_1001EF460 object:0];
    [v7 addObserver:v6 selector:"_handleScannerUIWillShow:" name:off_1001EF468 object:0];
  }
  return v6;
}

- (void)_updateVisualProviderWithMenu:(id)a3
{
  id v4 = a3;
  id v5 = [[SCATXYAxisPointPickerViewController alloc] initWithElementManager:self menu:v4];

  [(SCATElementManager *)self setVisualProvider:v5];
}

+ (unint64_t)minimumNumberOfCycles
{
  return 1;
}

- (void)didSweepOverPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  v6 = [(SCATXYAxisPointPicker *)self sweepFocusContext];
  unsigned __int8 v7 = objc_msgSend(v6, "containsPoint:", x, y);

  if ((v7 & 1) == 0)
  {
    v8 = [(SCATXYAxisPointPicker *)self sweepFocusContext];

    if (v8)
    {
      objc_super v9 = [(SCATPointPicker *)self delegate];
      char v10 = objc_opt_respondsToSelector();

      if (v10)
      {
        v11 = [(SCATPointPicker *)self delegate];
        v12 = [(SCATXYAxisPointPicker *)self sweepFocusContext];
        objc_msgSend(v11, "pointPicker:didSweepOutOfFocusContext:isRefiningPoint:", self, v12, -[SCATXYAxisPointPicker isRefiningPoint](self, "isRefiningPoint"));

        [(SCATXYAxisPointPicker *)self setSweepFocusContext:0];
      }
    }
    v13 = +[HNDAccessibilityManager sharedManager];
    objc_msgSend(v13, "elementAtPoint:", x, y);
    id v19 = (id)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      v14 = +[SCATScannerManager sharedManager];
      uint64_t v15 = [v14 activeElementManager];
      v16 = +[SCATFocusContext focusContextWithElement:v19 elementManager:v15 selectBehavior:0 options:0];

      [(SCATXYAxisPointPicker *)self setSweepFocusContext:v16];
      v17 = [(SCATPointPicker *)self delegate];
      LOBYTE(v15) = objc_opt_respondsToSelector();

      if (v15)
      {
        v18 = [(SCATPointPicker *)self delegate];
        objc_msgSend(v18, "pointPicker:didSweepIntoFocusContext:isRefiningPoint:", self, v16, -[SCATXYAxisPointPicker isRefiningPoint](self, "isRefiningPoint"));
      }
    }
    else
    {
      [(SCATXYAxisPointPicker *)self setSweepFocusContext:0];
    }
  }
}

- (BOOL)pauseForNumberOfCycles:(unint64_t)a3
{
  id v5 = [(SCATPointPicker *)self delegate];
  LOBYTE(a3) = [v5 pointPicker:self pauseForNumberOfCycles:a3];

  return a3;
}

- (BOOL)isRefiningPoint
{
  v6.receiver = self;
  v6.super_class = (Class)SCATXYAxisPointPicker;
  if ([(SCATPointPicker *)&v6 isRefiningPoint]) {
    return 1;
  }
  unint64_t v4 = [(SCATXYAxisPointPicker *)self pickerPhase];
  return (v4 & 0xFFFFFFFFFFFFFFFELL) == 2 || v4 - 5 < 2;
}

- (BOOL)usesTwoLevelRefinement
{
  v3 = +[AXSettings sharedInstance];
  BOOL v4 = [v3 switchControlPointPickerSelectionStyle] != (id)1
    && [(SCATPointPicker *)self refinementCount] == 0;

  return v4;
}

- (void)setPickerPhase:(unint64_t)a3
{
  self->_pickerPhase = a3;
  id v5 = [(SCATElementManager *)self visualProvider];
  [v5 updateWithPhase:a3 withPicker:self];
}

- (int64_t)pickerType
{
  return 1;
}

- (BOOL)shouldRescanAfterTap
{
  v2 = +[SCATScannerManager sharedManager];
  v3 = [v2 selectActionHandler];
  char v4 = [v3 isPending] ^ 1;

  return v4;
}

- (BOOL)allowsSelectionRefinement
{
  return 1;
}

- (BOOL)providesElements
{
  return 0;
}

- (BOOL)handleInputAction:(id)a3 withElement:(id)a4
{
  id v5 = a3;
  if ([v5 action] == (id)100
    || [v5 action] == (id)103
    || [v5 action] == (id)109
    || [v5 action] == (id)104
    || [v5 action] == (id)105)
  {
    [(SCATXYAxisPointPicker *)self didGetPhaseChangingAction];
    BOOL v6 = 1;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)shouldKeepScannerAwake
{
  v6.receiver = self;
  v6.super_class = (Class)SCATXYAxisPointPicker;
  if ([(SCATPointPicker *)&v6 shouldKeepScannerAwake]
    || (id)[(SCATXYAxisPointPicker *)self pickerPhase] != (id)1)
  {
    return 1;
  }
  v3 = [(SCATElementManager *)self visualProvider];
  BOOL v4 = [v3 numberOfCycles] == 0;

  return v4;
}

- (void)didFetchElements:(id)a3 foundNewElements:(BOOL)a4 currentFocusContext:(id)a5 didChangeActiveElementManager:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a5;
  if (![(SCATXYAxisPointPicker *)self isRefiningPoint])
  {
    v12.receiver = self;
    v12.super_class = (Class)SCATXYAxisPointPicker;
    [(SCATPointPicker *)&v12 didFetchElements:v10 foundNewElements:v8 currentFocusContext:v11 didChangeActiveElementManager:v6];
  }
}

- (void)visualProviderDidPresent
{
}

- (void)visualProviderDidUpdate
{
  [(SCATXYAxisPointPicker *)self setPickerPhase:0];

  [(SCATXYAxisPointPicker *)self setPickerPhase:1];
}

- (void)visualProviderDidDismiss
{
}

- (void)didGetPhaseChangingAction
{
  if ([(SCATXYAxisPointPicker *)self usesTwoLevelRefinement]) {
    unsigned int v3 = ![(SCATXYAxisPointPicker *)self isRefiningPoint];
  }
  else {
    unsigned int v3 = 0;
  }
  BOOL v4 = +[AXSettings sharedInstance];
  id v5 = [v4 switchControlPointPickerSelectionStyle];

  switch([(SCATXYAxisPointPicker *)self pickerPhase])
  {
    case 0uLL:
      uint64_t v6 = 1;
      break;
    case 1uLL:
      BOOL v7 = v3 == 0;
      uint64_t v8 = 4;
      uint64_t v9 = 2;
      goto LABEL_11;
    case 2uLL:
      BOOL v10 = v5 == (id)2;
      uint64_t v11 = 3;
      goto LABEL_15;
    case 3uLL:
      uint64_t v6 = 4;
      break;
    case 4uLL:
      BOOL v7 = v3 == 0;
      uint64_t v8 = 7;
      uint64_t v9 = 5;
LABEL_11:
      if (v7) {
        uint64_t v6 = v8;
      }
      else {
        uint64_t v6 = v9;
      }
      break;
    case 5uLL:
      BOOL v10 = v5 == (id)2;
      uint64_t v11 = 6;
LABEL_15:
      if (v10) {
        uint64_t v6 = v11;
      }
      else {
        uint64_t v6 = v11 + 1;
      }
      break;
    case 6uLL:
      uint64_t v6 = 7;
      break;
    default:
      uint64_t v6 = 0;
      break;
  }

  [(SCATXYAxisPointPicker *)self setPickerPhase:v6];
}

- (void)_handleScannerUIWillHide:(id)a3
{
}

- (void)_handleScannerUIWillShow:(id)a3
{
  BOOL v4 = [(SCATElementManager *)self visualProvider];
  unsigned int v5 = [v4 isDisplayed];

  if (v5)
  {
    [(SCATXYAxisPointPicker *)self setPickerPhase:1];
  }
}

- (SCATFocusContext)sweepFocusContext
{
  return self->_sweepFocusContext;
}

- (void)setSweepFocusContext:(id)a3
{
}

- (void)setUsesTwoLevelRefinement:(BOOL)a3
{
  self->_usesTwoLevelRefinement = a3;
}

- (unint64_t)pickerPhase
{
  return self->_pickerPhase;
}

- (void).cxx_destruct
{
}

@end