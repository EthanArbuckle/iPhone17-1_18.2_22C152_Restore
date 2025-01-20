@interface SCATPointPicker
+ (SCATPointPicker)pointPickerWithMode:(int64_t)a3 menu:(id)a4;
+ (id)mostSuitablePointPickerWithMenu:(id)a3;
- (BOOL)allowsSelectionRefinement;
- (BOOL)hasPickedPoint;
- (BOOL)isRefiningPoint;
- (BOOL)shouldKeepScannerAwake;
- (BOOL)shouldRescanAfterTap;
- (CGPoint)lastReceivedPoint;
- (CGPoint)pickedPoint;
- (CGPoint)pickedPointInDeviceCoordinates;
- (NSValue)realPickedPoint;
- (SCATMenu)menu;
- (SCATPointPickerDelegate)delegate;
- (id)_initWithMenu:(id)a3;
- (id)description;
- (id)identifier;
- (int64_t)pickerType;
- (unint64_t)refinementCount;
- (unsigned)currentDisplayID;
- (void)_savePoint:(CGPoint)a3 andNotifyDelegate:(BOOL)a4;
- (void)didFetchElements:(id)a3 foundNewElements:(BOOL)a4 currentFocusContext:(id)a5 didChangeActiveElementManager:(BOOL)a6;
- (void)moveToPoint:(CGPoint)a3;
- (void)refineSelectedPoint;
- (void)resetRefinedSelectedPoint;
- (void)scannerManager:(id)a3 didActivateElement:(id)a4;
- (void)setCurrentDisplayID:(unsigned int)a3;
- (void)setDelegate:(id)a3;
- (void)setLastReceivedPoint:(CGPoint)a3;
- (void)setMenu:(id)a3;
- (void)setRealPickedPoint:(id)a3;
- (void)setRefinementCount:(unint64_t)a3;
- (void)setShouldKeepScannerAwake:(BOOL)a3;
@end

@implementation SCATPointPicker

+ (id)mostSuitablePointPickerWithMenu:(id)a3
{
  id v3 = a3;
  v4 = +[AXSettings sharedInstance];
  id v5 = [v4 assistiveTouchPreferredPointPicker];
  if (([v4 switchControlUseCameraForPointMode] & (v5 == (id)2)) != 0) {
    uint64_t v6 = 2;
  }
  else {
    uint64_t v6 = (uint64_t)v5;
  }
  v7 = +[SCATPointPicker pointPickerWithMode:v6 menu:v3];

  return v7;
}

+ (SCATPointPicker)pointPickerWithMode:(int64_t)a3 menu:(id)a4
{
  id v5 = a4;
  uint64_t v6 = (Class *)off_1001AA410;
  v7 = off_1001AA3E0;
  if (a3) {
    v7 = &off_1001AA418;
  }
  if (a3 != 2) {
    uint64_t v6 = (Class *)v7;
  }
  id v8 = [objc_alloc(*v6) _initWithMenu:v5];

  return (SCATPointPicker *)v8;
}

- (id)_initWithMenu:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SCATPointPicker;
  id v5 = [(SCATPointPicker *)&v8 init];
  uint64_t v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_menu, v4);
    v6->_currentDisplayID = 1;
  }

  return v6;
}

- (id)description
{
  id v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  id v5 = +[NSNumber numberWithBool:[(SCATPointPicker *)self hasPickedPoint]];
  [(SCATPointPicker *)self pickedPoint];
  uint64_t v6 = NSStringFromCGPoint(v12);
  [(SCATPointPicker *)self pickedPointInDeviceCoordinates];
  v7 = NSStringFromCGPoint(v13);
  objc_super v8 = +[NSNumber numberWithBool:[(SCATPointPicker *)self allowsSelectionRefinement]];
  v9 = +[NSString stringWithFormat:@"%@<%p>. HasPoint:%@ localPoint:%@ screenCoordPoint:%@ AllowsRefine:%@", v4, self, v5, v6, v7, v8];

  return v9;
}

- (void)_savePoint:(CGPoint)a3 andNotifyDelegate:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v6 = +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", a3.x, a3.y);
  [(SCATPointPicker *)self setRealPickedPoint:v6];

  if (v4)
  {
    v7 = [(SCATPointPicker *)self delegate];
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      id v9 = [(SCATPointPicker *)self delegate];
      [(SCATPointPicker *)self pickedPoint];
      objc_msgSend(v9, "pointPicker:didPickPoint:", self);
    }
  }
}

- (void)moveToPoint:(CGPoint)a3
{
}

- (BOOL)isRefiningPoint
{
  return [(SCATPointPicker *)self refinementCount] != 0;
}

- (BOOL)hasPickedPoint
{
  v2 = [(SCATPointPicker *)self realPickedPoint];
  BOOL v3 = v2 != 0;

  return v3;
}

- (CGPoint)pickedPoint
{
  v2 = [(SCATPointPicker *)self realPickedPoint];
  [v2 CGPointValue];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.y = v8;
  result.x = v7;
  return result;
}

- (CGPoint)pickedPointInDeviceCoordinates
{
  double v3 = +[SCATScannerManager sharedManager];
  double v4 = objc_msgSend(v3, "scatUIContextForDisplayID:", -[SCATPointPicker currentDisplayID](self, "currentDisplayID"));

  [(SCATPointPicker *)self pickedPoint];
  +[HNDScreen convertPoint:fromView:](HNDScreen, "convertPoint:fromView:", v4);
  double v6 = v5;
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.y = v10;
  result.x = v9;
  return result;
}

- (BOOL)allowsSelectionRefinement
{
  return 0;
}

- (id)identifier
{
  return off_1001EF8A0[0];
}

- (void)refineSelectedPoint
{
  if (![(SCATPointPicker *)self hasPickedPoint]) {
    _AXAssert();
  }
  ++self->_refinementCount;
}

- (void)resetRefinedSelectedPoint
{
  self->_refinementCount = 0;
}

- (BOOL)shouldRescanAfterTap
{
  return 0;
}

- (void)scannerManager:(id)a3 didActivateElement:(id)a4
{
}

- (void)didFetchElements:(id)a3 foundNewElements:(BOOL)a4 currentFocusContext:(id)a5 didChangeActiveElementManager:(BOOL)a6
{
  if (a6) {
    objc_msgSend(a3, "beginScanningWithFocusContext:", 0, a4, a5);
  }
}

- (SCATPointPickerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SCATPointPickerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSValue)realPickedPoint
{
  return self->_realPickedPoint;
}

- (void)setRealPickedPoint:(id)a3
{
}

- (unint64_t)refinementCount
{
  return self->_refinementCount;
}

- (void)setRefinementCount:(unint64_t)a3
{
  self->_refinementCount = a3;
}

- (BOOL)shouldKeepScannerAwake
{
  return self->_shouldKeepScannerAwake;
}

- (void)setShouldKeepScannerAwake:(BOOL)a3
{
  self->_shouldKeepScannerAwake = a3;
}

- (int64_t)pickerType
{
  return self->_pickerType;
}

- (CGPoint)lastReceivedPoint
{
  double x = self->_lastReceivedPoint.x;
  double y = self->_lastReceivedPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setLastReceivedPoint:(CGPoint)a3
{
  self->_lastReceivedPoint = a3;
}

- (unsigned)currentDisplayID
{
  return self->_currentDisplayID;
}

- (void)setCurrentDisplayID:(unsigned int)a3
{
  self->_currentDisplayID = a3;
}

- (SCATMenu)menu
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_menu);

  return (SCATMenu *)WeakRetained;
}

- (void)setMenu:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_menu);
  objc_storeStrong((id *)&self->_realPickedPoint, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end