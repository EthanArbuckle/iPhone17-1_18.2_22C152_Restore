@interface HNDTrackpadEventManager
- (BOOL)canMoveTrackpadBorder:(CGPoint)a3;
- (BOOL)canPerformPinch;
- (BOOL)canResizeTrackpad:(CGPoint)a3;
- (BOOL)fullScreen;
- (BOOL)naturalScroll;
- (BOOL)pointOnTrackpad:(CGPoint)a3;
- (BOOL)pointOnTrackpadView:(CGPoint)a3;
- (BOOL)systemPointerOnRocker;
- (BOOL)systemPointerOnTrackpad;
- (BOOL)trackpadAtBottomLeft;
- (BOOL)trackpadAtBottomRight;
- (BOOL)trackpadAtTopLeft;
- (BOOL)trackpadAtTopRight;
- (BOOL)trackpadBorderIsMoving;
- (BOOL)trackpadInPinchMode;
- (BOOL)trackpadInScrollMode;
- (CGPoint)convertSystemPointFromOrientation;
- (CGPoint)convertSystemPointToOrientation;
- (CGPoint)convertToTrackpadBorder:(CGPoint)a3;
- (CGPoint)getPinchPoint:(CGPoint)a3 startPoint:(CGPoint)a4 pinchPoint:(CGPoint)a5;
- (CGPoint)getPointsDelta:(CGPoint)a3 startPoint:(CGPoint)a4 scale:(double)a5;
- (CGPoint)getUpdatedPinchPoint:(CGPoint)a3;
- (HNDTrackpadEventManager)initWithTrackpad:(id)a3 trackpadBorder:(id)a4;
- (double)getScreenHeight;
- (double)getScreenWidth;
- (double)pointerSpeed;
- (double)scrollSpeed;
- (void)endPinch;
- (void)endScroll;
- (void)handleMoveTrackpadBorder:(id)a3;
- (void)handleOrientationChange;
- (void)handlePointerMoveTrackpadBorder:(id)a3;
- (void)handlePrimaryButtonPress:(BOOL)a3;
- (void)handleTrackpadBorderTap:(id)a3 moveAmount:(double)a4;
- (void)handleTrackpadCornerPlacement;
- (void)handleTrackpadMovePointer:(id)a3;
- (void)handleTrackpadPress:(id)a3;
- (void)handleTrackpadPrimaryClick;
- (void)initSettings;
- (void)moveSystemPointer:(CGPoint)a3 startPoint:(CGPoint)a4;
- (void)moveTrackpadBorderWithDelta:(CGPoint)a3;
- (void)performBlockAfterHitTestWithDelay:(double)a3 block:(id)a4;
- (void)performPinch:(CGPoint)a3 secondPoint:(CGPoint)a4;
- (void)performTrackpadScroll:(CGPoint)a3;
- (void)registerForSettingsUpdates;
- (void)sendGestureHandEventAtPoints:(CGPoint)a3 pointTwo:(CGPoint)a4 handEventType:(unsigned int)a5;
- (void)sendHandEventAtPoint:(CGPoint)a3 handEventType:(unsigned int)a4;
- (void)setFullScreen;
- (void)setFullScreen:(BOOL)a3;
- (void)setNaturalScroll:(BOOL)a3;
- (void)setPointerSpeed:(double)a3;
- (void)setScrollSpeed:(double)a3;
- (void)setTrackpadBorderAction:(CGPoint)a3;
- (void)setTrackpadCornerPlacement;
- (void)setTrackpadHitTest:(BOOL)a3;
- (void)setTrackpadPositionBottomLeft;
- (void)setTrackpadPositionBottomRight;
- (void)setTrackpadPositionTopLeft;
- (void)setTrackpadPositionTopRight;
- (void)startPinch:(CGPoint)a3 pointTwo:(CGPoint)a4 systemPoint:(CGPoint)a5;
- (void)startScroll:(CGPoint)a3;
- (void)updateTrackpadFrameBounds:(CGRect)a3;
- (void)updateTrackpadSize;
@end

@implementation HNDTrackpadEventManager

- (HNDTrackpadEventManager)initWithTrackpad:(id)a3 trackpadBorder:(id)a4
{
  v6 = (HNDTrackpadView *)a3;
  v7 = (HNDTrackpadBorderView *)a4;
  v17.receiver = self;
  v17.super_class = (Class)HNDTrackpadEventManager;
  v8 = [(HNDTrackpadEventManager *)&v17 init];
  uint64_t v9 = +[HNDHandManager sharedManager];
  handManager = v8->_handManager;
  v8->_handManager = (HNDHandManager *)v9;

  uint64_t v11 = [(HNDHandManager *)v8->_handManager mainDisplayManager];
  displayManager = v8->_displayManager;
  v8->_displayManager = (HNDDisplayManager *)v11;

  trackpadBorder = v8->_trackpadBorder;
  v8->_trackpadBorder = v7;
  v14 = v7;

  trackpad = v8->_trackpad;
  v8->_trackpad = v6;

  [(HNDTrackpadEventManager *)v8 initSettings];
  [(HNDTrackpadEventManager *)v8 registerForSettingsUpdates];
  return v8;
}

- (void)initSettings
{
  v3 = +[AXSettings sharedInstance];
  [v3 assistiveTouchVirtualTrackpadSpeed];
  -[HNDTrackpadEventManager setPointerSpeed:](self, "setPointerSpeed:");

  v4 = +[AXSettings sharedInstance];
  [v4 assistiveTouchVirtualTrackpadScrollSpeed];
  -[HNDTrackpadEventManager setScrollSpeed:](self, "setScrollSpeed:");

  v5 = +[AXSettings sharedInstance];
  -[HNDTrackpadEventManager setNaturalScroll:](self, "setNaturalScroll:", [v5 assistiveTouchVirtualTrackpadScrollToggleEnabled]);

  id v6 = +[AXSettings sharedInstance];
  -[HNDTrackpadEventManager setFullScreen:](self, "setFullScreen:", [v6 assistiveTouchVirtualTrackpadFullScreenToggleEnabled]);
}

- (void)registerForSettingsUpdates
{
  objc_initWeak(&location, self);
  v3 = +[AXSettings sharedInstance];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000AEED8;
  v13[3] = &unk_1001AAA68;
  objc_copyWeak(&v14, &location);
  [v3 registerUpdateBlock:v13 forRetrieveSelector:"assistiveTouchVirtualTrackpadSpeed" withListener:self];

  objc_destroyWeak(&v14);
  v4 = +[AXSettings sharedInstance];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000AEF50;
  v11[3] = &unk_1001AAA68;
  objc_copyWeak(&v12, &location);
  [v4 registerUpdateBlock:v11 forRetrieveSelector:"assistiveTouchVirtualTrackpadScrollSpeed" withListener:self];

  objc_destroyWeak(&v12);
  v5 = +[AXSettings sharedInstance];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000AEFC8;
  v9[3] = &unk_1001AAA68;
  objc_copyWeak(&v10, &location);
  [v5 registerUpdateBlock:v9 forRetrieveSelector:"assistiveTouchVirtualTrackpadScrollToggleEnabled" withListener:self];

  objc_destroyWeak(&v10);
  id v6 = +[AXSettings sharedInstance];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000AF038;
  v7[3] = &unk_1001AAA68;
  objc_copyWeak(&v8, &location);
  [v6 registerUpdateBlock:v7 forRetrieveSelector:"assistiveTouchVirtualTrackpadFullScreenToggleEnabled" withListener:self];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)handleTrackpadBorderTap:(id)a3 moveAmount:(double)a4
{
  [a3 locationInView:self->_trackpadBorder];
  double v7 = v6;
  double v9 = v8;
  [(HNDTrackpadBorderView *)self->_trackpadBorder frame];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  if (-[HNDTrackpadBorderView pointOnTopBorder:](self->_trackpadBorder, "pointOnTopBorder:", v7, v9))
  {
    double v13 = v13 - a4;
  }
  else if (-[HNDTrackpadBorderView pointOnBottomBorder:](self->_trackpadBorder, "pointOnBottomBorder:", v7, v9))
  {
    double v13 = v13 + a4;
  }
  else if (-[HNDTrackpadBorderView pointOnLeftBorder:](self->_trackpadBorder, "pointOnLeftBorder:", v7, v9))
  {
    double v11 = v11 - a4;
  }
  else
  {
    unsigned int v18 = -[HNDTrackpadBorderView pointOnRightBorder:](self->_trackpadBorder, "pointOnRightBorder:", v7, v9);
    double v19 = -0.0;
    if (v18) {
      double v19 = a4;
    }
    double v11 = v11 + v19;
  }

  -[HNDTrackpadEventManager updateTrackpadFrameBounds:](self, "updateTrackpadFrameBounds:", v11, v13, v15, v17);
}

- (void)handlePointerMoveTrackpadBorder:(id)a3
{
  handManager = self->_handManager;
  id v5 = a3;
  [(HNDHandManager *)handManager systemPointerLocation];
  double v7 = v6;
  double v9 = v8;
  double v10 = (char *)[v5 state];

  if ((unint64_t)(v10 - 3) >= 3)
  {
    if (v10 == (char *)2)
    {
      -[HNDTrackpadEventManager getPointsDelta:startPoint:scale:](self, "getPointsDelta:startPoint:scale:", v7, v9, self->_pointerLastPoint.x, self->_pointerLastPoint.y, 1.0);
      unint64_t borderAction = self->_borderAction;
      if (borderAction == 2)
      {
        -[HNDTrackpadEventManager moveTrackpadBorderWithDelta:](self, "moveTrackpadBorderWithDelta:");
      }
      else if (borderAction == 1)
      {
        -[HNDTrackpadBorderView resizeTrackpadWithDelta:](self->_trackpadBorder, "resizeTrackpadWithDelta:");
      }
    }
    else
    {
      if (v10 != (char *)1) {
        return;
      }
      if (self->_borderAction) {
        [(HNDDisplayManager *)self->_displayManager moveTrackpadViewToFront:1];
      }
    }
    self->_pointerLastPoint.x = v7;
    self->_pointerLastPoint.y = v9;
  }
  else
  {
    self->_unint64_t borderAction = 0;
    displayManager = self->_displayManager;
    [(HNDDisplayManager *)displayManager moveTrackpadViewToFront:0];
  }
}

- (void)handleMoveTrackpadBorder:(id)a3
{
  id v4 = a3;
  [v4 locationInView:0];
  double v6 = v5;
  double v8 = v7;
  [v4 locationInView:self->_trackpadBorder];
  double v10 = v9;
  double v12 = v11;
  double v13 = (char *)[v4 state];

  if ((unint64_t)(v13 - 3) >= 3)
  {
    if (v13 == (char *)2)
    {
      -[HNDTrackpadEventManager getPointsDelta:startPoint:scale:](self, "getPointsDelta:startPoint:scale:", v6, v8, self->_lastPoint.x, self->_lastPoint.y, 1.0);
      unint64_t borderAction = self->_borderAction;
      if (borderAction == 2)
      {
        -[HNDTrackpadEventManager moveTrackpadBorderWithDelta:](self, "moveTrackpadBorderWithDelta:");
      }
      else if (borderAction == 1)
      {
        -[HNDTrackpadBorderView resizeTrackpadWithDelta:](self->_trackpadBorder, "resizeTrackpadWithDelta:");
      }
    }
    else
    {
      if (v13 != (char *)1) {
        return;
      }
      -[HNDTrackpadEventManager setTrackpadBorderAction:](self, "setTrackpadBorderAction:", v10, v12);
      if (self->_borderAction) {
        [(HNDDisplayManager *)self->_displayManager moveTrackpadViewToFront:1];
      }
    }
    self->_lastPoint.x = v6;
    self->_lastPoint.y = v8;
  }
  else
  {
    self->_unint64_t borderAction = 0;
    displayManager = self->_displayManager;
    [(HNDDisplayManager *)displayManager moveTrackpadViewToFront:0];
  }
}

- (void)setTrackpadBorderAction:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if (-[HNDTrackpadEventManager canResizeTrackpad:](self, "canResizeTrackpad:"))
  {
    unint64_t v6 = 1;
LABEL_5:
    self->_unint64_t borderAction = v6;
    return;
  }
  if (-[HNDTrackpadEventManager canMoveTrackpadBorder:](self, "canMoveTrackpadBorder:", x, y))
  {
    unint64_t v6 = 2;
    goto LABEL_5;
  }
  self->_unint64_t borderAction = 0;
}

- (void)moveTrackpadBorderWithDelta:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(HNDTrackpadBorderView *)self->_trackpadBorder frame];
  double v7 = x + v6;
  double v9 = y + v8;

  -[HNDTrackpadEventManager updateTrackpadFrameBounds:](self, "updateTrackpadFrameBounds:", v7, v9);
}

- (void)handleTrackpadPrimaryClick
{
  if (![(HNDTrackpadEventManager *)self systemPointerOnTrackpad])
  {
    [(HNDTrackpadEventManager *)self handlePrimaryButtonPress:1];
    AXPerformBlockOnMainThreadAfterDelay();
    return;
  }
  v3 = [(HNDDisplayManager *)self->_displayManager rocker];
  if (![v3 isFullMenuVisible])
  {

    goto LABEL_9;
  }
  unsigned __int8 v4 = [(HNDTrackpadEventManager *)self systemPointerOnRocker];

  if (v4)
  {
LABEL_9:
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000AF61C;
    v6[3] = &unk_1001AAA90;
    v6[4] = self;
    [(HNDTrackpadEventManager *)self performBlockAfterHitTestWithDelay:v6 block:0.03];
    return;
  }
  displayManager = self->_displayManager;

  [(HNDDisplayManager *)displayManager showMenu:0];
}

- (void)handleTrackpadMovePointer:(id)a3
{
  id v13 = a3;
  [v13 locationInView:0];
  double v5 = v4;
  double v7 = v6;
  id v8 = [v13 state];
  if (v8 == (id)2)
  {
    id v9 = -[HNDTrackpadEventManager moveSystemPointer:startPoint:](self, "moveSystemPointer:startPoint:", v5, v7, self->_lastPoint.x, self->_lastPoint.y);
    self->_lastPoint.double x = v5;
    self->_lastPoint.double y = v7;
  }
  else
  {
    if (v8 == (id)1)
    {
      id v9 = (id)-[HNDTrackpadEventManager pointOnTrackpadView:](self, "pointOnTrackpadView:", v5, v7);
      id v10 = v13;
      if (v9)
      {
        self->_lastPoint.double x = v5;
        self->_lastPoint.double y = v7;
        goto LABEL_10;
      }
      double v11 = v13;
      uint64_t v12 = 0;
    }
    else
    {
      double v11 = v13;
      uint64_t v12 = 1;
    }
    id v9 = [v11 setEnabled:v12];
  }
  id v10 = v13;
LABEL_10:

  _objc_release_x1(v9, v10);
}

- (void)moveSystemPointer:(CGPoint)a3 startPoint:(CGPoint)a4
{
  -[HNDTrackpadEventManager getPointsDelta:startPoint:scale:](self, "getPointsDelta:startPoint:scale:", a3.x, a3.y, a4.x, a4.y, self->_pointerSpeed);
  double v6 = v5;
  double v8 = v7;
  id v10 = [objc_allocWithZone((Class)HNDEvent) init];
  [v10 setType:3];
  [v10 setDeltaX:v6];
  [v10 setDeltaY:v8];
  [v10 setIsVirtualTrackpadEvent:1];
  id v9 = [(HNDHandManager *)self->_handManager deviceManager];
  [v9 device:0 didPostEvent:v10];
}

- (void)handleTrackpadPress:(id)a3
{
  double v4 = (char *)[a3 state];
  if ((unint64_t)(v4 - 3) >= 3)
  {
    if (v4 == (char *)1)
    {
      [(HNDHandManager *)self->_handManager systemPointerLocation];
      -[HNDTrackpadEventManager convertToTrackpadBorder:](self, "convertToTrackpadBorder:");
      -[HNDTrackpadEventManager setTrackpadBorderAction:](self, "setTrackpadBorderAction:");
      if ([(HNDTrackpadEventManager *)self systemPointerOnTrackpad] && !self->_borderAction)
      {
        v5[0] = _NSConcreteStackBlock;
        v5[1] = 3221225472;
        v5[2] = sub_1000AF9F8;
        v5[3] = &unk_1001AAA90;
        v5[4] = self;
        [(HNDTrackpadEventManager *)self performBlockAfterHitTestWithDelay:v5 block:0.05];
      }
      else
      {
        [(HNDTrackpadEventManager *)self handlePrimaryButtonPress:1];
      }
    }
  }
  else
  {
    [(HNDTrackpadEventManager *)self handlePrimaryButtonPress:0];
    [(HNDTrackpadEventManager *)self setTrackpadHitTest:1];
  }
}

- (void)startScroll:(CGPoint)a3
{
  self->_lastPoint = a3;
  [(HNDTrackpadEventManager *)self convertSystemPointFromOrientation];
  self->_scrollPoint.double x = v4;
  self->_scrollPoint.double y = v5;
  if ([(HNDTrackpadEventManager *)self systemPointerOnTrackpad])
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000AFAD4;
    v6[3] = &unk_1001AAA90;
    v6[4] = self;
    [(HNDTrackpadEventManager *)self performBlockAfterHitTestWithDelay:v6 block:0.02];
  }
  else
  {
    [(HNDTrackpadEventManager *)self setTrackpadHitTest:0];
    [(HNDTrackpadEventManager *)self handlePrimaryButtonPress:1];
  }
}

- (void)performTrackpadScroll:(CGPoint)a3
{
  -[HNDTrackpadEventManager getPointsDelta:startPoint:scale:](self, "getPointsDelta:startPoint:scale:", a3.x, a3.y, self->_lastPoint.x, self->_lastPoint.y, self->_scrollSpeed * 0.03);
  BOOL v6 = fabs(v5) < fabs(v4);
  if (v6) {
    double v7 = 0.0;
  }
  else {
    double v7 = v5;
  }
  if (v6) {
    double v8 = v4;
  }
  else {
    double v8 = 0.0;
  }
  unsigned int v9 = [(HNDTrackpadEventManager *)self naturalScroll];
  double v10 = -v8;
  if (!v9)
  {
    double v7 = -v7;
    double v8 = -v8;
  }
  [(HNDDisplayManager *)self->_displayManager screenBounds];
  id v12 = [objc_allocWithZone((Class)HNDEvent) init];
  [v12 setType:3];
  [v12 setDeltaX:v8];
  [v12 setDeltaY:v7];
  [v12 setIsVirtualTrackpadEvent:1];
  double v11 = [(HNDHandManager *)self->_handManager deviceManager];
  [v11 device:0 didPostEvent:v12];
}

- (void)endScroll
{
  [(HNDTrackpadEventManager *)self setTrackpadHitTest:1];

  [(HNDTrackpadEventManager *)self handlePrimaryButtonPress:0];
}

- (void)startPinch:(CGPoint)a3 pointTwo:(CGPoint)a4 systemPoint:(CGPoint)a5
{
  double y = a4.y;
  double x = a4.x;
  double v7 = a3.y;
  double v8 = a3.x;
  AX_CGPointGetMidpointToPoint();
  double v11 = v10;
  double v13 = v12;
  -[HNDTrackpadEventManager getPointsDelta:startPoint:scale:](self, "getPointsDelta:startPoint:scale:", v8, v7, v10, v12, 1.0);
  double v15 = v14;
  double v17 = v16;
  -[HNDTrackpadEventManager getPointsDelta:startPoint:scale:](self, "getPointsDelta:startPoint:scale:", x, y, v11, v13, 1.0);
  double v36 = v19;
  double v37 = v18;
  -[HNDTrackpadEventManager getPointsDelta:startPoint:scale:](self, "getPointsDelta:startPoint:scale:", a5.x, a5.y, v15, v17, 1.0);
  double v21 = v20;
  double v23 = v22;
  -[HNDTrackpadEventManager getPointsDelta:startPoint:scale:](self, "getPointsDelta:startPoint:scale:", a5.x, a5.y, v37, v36, 1.0);
  double v25 = v24;
  double v27 = v26;
  self->_lastPoint.double x = v8;
  self->_lastPoint.double y = v7;
  self->_secondLastPoint.double x = x;
  self->_secondLastPoint.double y = y;
  -[HNDTrackpadEventManager getUpdatedPinchPoint:](self, "getUpdatedPinchPoint:", v21, v23);
  self->_pinchFirstPoint.double x = v28;
  self->_pinchFirstPoint.double y = v29;
  -[HNDTrackpadEventManager getUpdatedPinchPoint:](self, "getUpdatedPinchPoint:", v25, v27);
  self->_pinchSecondPoint.double x = v30;
  self->_pinchSecondPoint.double y = v31;
  if ([(HNDTrackpadEventManager *)self canPerformPinch])
  {
    if ([(HNDTrackpadEventManager *)self systemPointerOnTrackpad])
    {
      v39[0] = _NSConcreteStackBlock;
      v39[1] = 3221225472;
      v39[2] = sub_1000AFDF0;
      v39[3] = &unk_1001AAA90;
      v39[4] = self;
      [(HNDTrackpadEventManager *)self performBlockAfterHitTestWithDelay:v39 block:0.02];
    }
    else
    {
      double v32 = self->_pinchFirstPoint.x;
      double v33 = self->_pinchFirstPoint.y;
      double v34 = self->_pinchSecondPoint.x;
      double v35 = self->_pinchSecondPoint.y;
      -[HNDTrackpadEventManager sendGestureHandEventAtPoints:pointTwo:handEventType:](self, "sendGestureHandEventAtPoints:pointTwo:handEventType:", 1, v32, v33, v34, v35);
    }
  }
}

- (void)performPinch:(CGPoint)a3 secondPoint:(CGPoint)a4
{
  CGFloat y = a4.y;
  CGFloat x = a4.x;
  double v6 = a3.y;
  double v7 = a3.x;
  -[HNDTrackpadEventManager getPinchPoint:startPoint:pinchPoint:](self, "getPinchPoint:startPoint:pinchPoint:", a4.x, a4.y, self->_secondLastPoint.x, self->_secondLastPoint.y, self->_pinchFirstPoint.x, self->_pinchFirstPoint.y);
  self->_pinchFirstPoint.CGFloat x = v9;
  self->_pinchFirstPoint.CGFloat y = v10;
  -[HNDTrackpadEventManager getPinchPoint:startPoint:pinchPoint:](self, "getPinchPoint:startPoint:pinchPoint:", v7, v6, self->_lastPoint.x, self->_lastPoint.y, self->_pinchSecondPoint.x, self->_pinchSecondPoint.y);
  self->_pinchSecondPoint.CGFloat x = v11;
  self->_pinchSecondPoint.CGFloat y = v12;
  -[HNDTrackpadEventManager sendGestureHandEventAtPoints:pointTwo:handEventType:](self, "sendGestureHandEventAtPoints:pointTwo:handEventType:", 2, self->_pinchFirstPoint.x, self->_pinchFirstPoint.y, v11, v12);
  self->_lastPoint.CGFloat x = v7;
  self->_lastPoint.CGFloat y = v6;
  self->_secondLastPoint.CGFloat x = x;
  self->_secondLastPoint.CGFloat y = y;
}

- (void)endPinch
{
  -[HNDTrackpadEventManager sendGestureHandEventAtPoints:pointTwo:handEventType:](self, "sendGestureHandEventAtPoints:pointTwo:handEventType:", 6, self->_pinchFirstPoint.x, self->_pinchFirstPoint.y, self->_pinchSecondPoint.x, self->_pinchSecondPoint.y);

  [(HNDTrackpadEventManager *)self setTrackpadHitTest:1];
}

- (CGPoint)getPinchPoint:(CGPoint)a3 startPoint:(CGPoint)a4 pinchPoint:(CGPoint)a5
{
  double y = a5.y;
  double x = a5.x;
  -[HNDTrackpadEventManager getPointsDelta:startPoint:scale:](self, "getPointsDelta:startPoint:scale:", a3.x, a3.y, a4.x, a4.y, 1.0);
  double v9 = x + v8;
  double v11 = y + v10;

  -[HNDTrackpadEventManager getUpdatedPinchPoint:](self, "getUpdatedPinchPoint:", v9, v11);
  result.double y = v13;
  result.double x = v12;
  return result;
}

- (CGPoint)getUpdatedPinchPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  double v5 = +[UIScreen mainScreen];
  [v5 bounds];
  double v7 = v6;
  double v9 = v8;

  double v10 = 0.0;
  if (x >= 0.0) {
    double v11 = x;
  }
  else {
    double v11 = 0.0;
  }
  if (v11 > v7) {
    double v11 = v7;
  }
  if (y >= 0.0) {
    double v10 = y;
  }
  if (v10 > v9) {
    double v10 = v9;
  }
  result.double y = v10;
  result.double x = v11;
  return result;
}

- (void)sendHandEventAtPoint:(CGPoint)a3 handEventType:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  AXNormalizePoint();
  double v6 = v5;
  double v8 = v7;
  +[AXEventRepresentation touchRepresentationWithHandType:location:](AXEventRepresentation, "touchRepresentationWithHandType:location:", v4);
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  double v9 = [v15 handInfo];
  double v10 = [v9 paths];
  double v11 = [v10 firstPath];
  [v11 setTransducerType:2];

  double v12 = +[AXBackBoardServer server];
  id v13 = objc_msgSend(v12, "contextIdForPosition:", v6, v8);

  [v15 setContextId:v13];
  double v14 = +[AXBackBoardServer server];
  [v14 postEvent:v15 systemEvent:1];
}

- (void)sendGestureHandEventAtPoints:(CGPoint)a3 pointTwo:(CGPoint)a4 handEventType:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  AXNormalizePoint();
  double v7 = v6;
  double v9 = v8;
  AXNormalizePoint();
  uint64_t v11 = v10;
  uint64_t v13 = v12;
  *(double *)CGFloat v28 = v7;
  *(double *)&v28[1] = v9;
  double v14 = +[NSValue valueWithBytes:v28 objCType:"{CGPoint=dd}"];
  v29[0] = v14;
  v27[0] = v11;
  v27[1] = v13;
  id v15 = +[NSValue valueWithBytes:v27 objCType:"{CGPoint=dd}"];
  v29[1] = v15;
  double v16 = +[NSArray arrayWithObjects:v29 count:2];

  double v17 = +[AXEventRepresentation gestureRepresentationWithHandType:v5 locations:v16];
  double v18 = [v17 handInfo];
  double v19 = [v18 paths];
  double v20 = [v19 firstPath];
  [v20 setTransducerType:2];

  double v21 = [v17 handInfo];
  double v22 = [v21 paths];
  double v23 = [v22 secondPath];
  [v23 setTransducerType:2];

  double v24 = +[AXBackBoardServer server];
  id v25 = objc_msgSend(v24, "contextIdForPosition:", v7, v9);

  [v17 setContextId:v25];
  double v26 = +[AXBackBoardServer server];
  [v26 postEvent:v17 systemEvent:1];
}

- (void)updateTrackpadFrameBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(HNDDisplayManager *)self->_displayManager screenBounds];
  double v9 = v8 - height;
  double v11 = v10 - width;
  double v12 = 0.0;
  if (x >= 0.0) {
    double v13 = x;
  }
  else {
    double v13 = 0.0;
  }
  if (v13 <= v11) {
    double v11 = v13;
  }
  if (y >= 0.0) {
    double v12 = y;
  }
  if (v12 <= v9) {
    double v9 = v12;
  }
  trackpadBorder = self->_trackpadBorder;

  -[HNDTrackpadBorderView setFrame:](trackpadBorder, "setFrame:", v11, v9, width, height);
}

- (void)updateTrackpadSize
{
  [(HNDDisplayManager *)self->_displayManager screenBounds];
  double v4 = v3;
  [(HNDTrackpadBorderView *)self->_trackpadBorder frame];
  double v23 = v5;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  [(HNDTrackpadView *)self->_trackpad frame];
  double v15 = v14;
  double v17 = v16;
  double v18 = v12;
  double v19 = v13;
  if (v11 <= v4)
  {
    if (v9 > v4)
    {
      double v21 = v9 - v4;
      double v9 = v9 - (v9 - v4);
      double v18 = v12 - v21;
    }
  }
  else
  {
    double v20 = v11 - v4;
    double v11 = v11 - (v11 - v4);
    double v19 = v13 - v20;
  }
  -[HNDTrackpadBorderView setFrame:](self->_trackpadBorder, "setFrame:", v23, v7, v9, v11);
  -[HNDTrackpadView setFrame:](self->_trackpad, "setFrame:", v15, v17, v18, v19);
  trackpadBorder = self->_trackpadBorder;

  [(HNDTrackpadBorderView *)trackpadBorder updateTrackpadFrameLayer];
}

- (void)setFullScreen
{
  if (self->_fullScreen)
  {
    [(HNDDisplayManager *)self->_displayManager screenBounds];
    double v26 = v4;
    double v27 = v3;
    [(HNDTrackpadBorderView *)self->_trackpadBorder frame];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    [(HNDTrackpadView *)self->_trackpad frame];
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
    v29.origin.double x = CGRectZero.origin.x;
    v29.origin.double y = CGRectZero.origin.y;
    v29.size.double width = CGRectZero.size.width;
    v29.size.double height = CGRectZero.size.height;
    if (CGRectEqualToRect(self->_oldBorderFrame, v29))
    {
      self->_oldBorderFrame.origin.double x = v6;
      self->_oldBorderFrame.origin.double y = v8;
      self->_oldBorderFrame.size.double width = v10;
      self->_oldBorderFrame.size.double height = v12;
      self->_oldTrackpadFrame.origin.double x = v14;
      self->_oldTrackpadFrame.origin.double y = v16;
      self->_oldTrackpadFrame.size.double width = v18;
      self->_oldTrackpadFrame.size.double height = v20;
    }
    -[HNDTrackpadView setFrame:](self->_trackpad, "setFrame:", v14, v16, v27 - v10 + v18, v26 - v12 + v20);
    -[HNDTrackpadEventManager updateTrackpadFrameBounds:](self, "updateTrackpadFrameBounds:", v6, v8, v10 + v27 - v10, v12 + v26 - v12);
    [(HNDTrackpadBorderView *)self->_trackpadBorder updateTrackpadFrameLayer];
  }
  else
  {
    p_oldBorderFrame = &self->_oldBorderFrame;
    v30.origin.double x = CGRectZero.origin.x;
    v30.origin.double y = CGRectZero.origin.y;
    v30.size.double width = CGRectZero.size.width;
    v30.size.double height = CGRectZero.size.height;
    if (!CGRectEqualToRect(self->_oldBorderFrame, v30))
    {
      -[HNDTrackpadView setFrame:](self->_trackpad, "setFrame:", self->_oldTrackpadFrame.origin.x, self->_oldTrackpadFrame.origin.y, self->_oldTrackpadFrame.size.width, self->_oldTrackpadFrame.size.height);
      -[HNDTrackpadBorderView setFrame:](self->_trackpadBorder, "setFrame:", self->_oldBorderFrame.origin.x, self->_oldBorderFrame.origin.y, self->_oldBorderFrame.size.width, self->_oldBorderFrame.size.height);
      [(HNDTrackpadEventManager *)self updateTrackpadSize];
      [(HNDTrackpadBorderView *)self->_trackpadBorder frame];
      -[HNDTrackpadEventManager updateTrackpadFrameBounds:](self, "updateTrackpadFrameBounds:");
      [(HNDTrackpadBorderView *)self->_trackpadBorder updateTrackpadFrameLayer];
    }
    CGPoint origin = CGRectZero.origin;
    CGSize size = CGRectZero.size;
    p_oldBorderFrame->CGPoint origin = CGRectZero.origin;
    self->_oldBorderFrame.CGSize size = size;
    self->_oldTrackpadFrame.CGPoint origin = origin;
    self->_oldTrackpadFrame.CGSize size = size;
  }
  trackpadBorder = self->_trackpadBorder;
  BOOL v25 = !self->_fullScreen;

  [(HNDTrackpadBorderView *)trackpadBorder showResizeIcon:v25];
}

- (BOOL)trackpadInPinchMode
{
  double v3 = [(HNDTrackpadView *)self->_trackpad pinchGestureRecognizer];
  double v4 = (char *)[v3 state];

  double v5 = [(HNDTrackpadView *)self->_trackpad pinchGestureRecognizer];
  [v5 scale];
  double v7 = v6;

  if ((unint64_t)(v4 - 1) > 1) {
    return 0;
  }
  if (v7 < 0.95) {
    return 1;
  }
  return v7 > 1.05;
}

- (BOOL)trackpadInScrollMode
{
  v2 = [(HNDTrackpadView *)self->_trackpad scrollGestureRecognizer];
  double v3 = (char *)[v2 state];

  return (unint64_t)(v3 - 1) < 2;
}

- (BOOL)trackpadBorderIsMoving
{
  double v3 = [(HNDTrackpadBorderView *)self->_trackpadBorder pointerMoveGestureRecognizer];
  id v4 = [v3 state];

  double v5 = [(HNDTrackpadBorderView *)self->_trackpadBorder moveGestureRecognizer];
  id v6 = [v5 state];

  return v4 == (id)2 || v6 == (id)2;
}

- (void)performBlockAfterHitTestWithDelay:(double)a3 block:(id)a4
{
  id v5 = a4;
  [(HNDTrackpadEventManager *)self setTrackpadHitTest:0];
  id v6 = v5;
  AXPerformBlockOnMainThreadAfterDelay();
}

- (void)handlePrimaryButtonPress:(BOOL)a3
{
}

- (BOOL)systemPointerOnTrackpad
{
  [(HNDHandManager *)self->_handManager systemPointerLocation];
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  [(HNDTrackpadBorderView *)self->_trackpadBorder frame];
  uint64_t v11 = v4;
  uint64_t v12 = v6;

  return CGRectContainsPoint(*(CGRect *)&v7, *(CGPoint *)&v11);
}

- (BOOL)systemPointerOnRocker
{
  [(HNDHandManager *)self->_handManager systemPointerLocation];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  uint64_t v7 = [(HNDDisplayManager *)self->_displayManager rocker];
  [v7 frame];
  v10.double x = v4;
  v10.double y = v6;
  BOOL v8 = CGRectContainsPoint(v11, v10);

  return v8;
}

- (BOOL)pointOnTrackpad:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  [(HNDTrackpadBorderView *)self->_trackpadBorder frame];
  CGFloat v9 = x;
  CGFloat v10 = y;

  return CGRectContainsPoint(*(CGRect *)&v5, *(CGPoint *)&v9);
}

- (BOOL)pointOnTrackpadView:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  CGFloat v6 = [(HNDDisplayManager *)self->_displayManager window];
  objc_msgSend(v6, "convertPoint:toView:", self->_trackpad, x, y);
  uint64_t v8 = v7;
  uint64_t v10 = v9;

  [(HNDTrackpadView *)self->_trackpad frame];
  uint64_t v15 = v8;
  uint64_t v16 = v10;

  return CGRectContainsPoint(*(CGRect *)&v11, *(CGPoint *)&v15);
}

- (BOOL)canPerformPinch
{
  double v3 = [(HNDDisplayManager *)self->_displayManager rocker];
  [v3 frame];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;

  v13.origin.double x = v5;
  v13.origin.double y = v7;
  v13.size.double width = v9;
  v13.size.double height = v11;
  if (CGRectContainsPoint(v13, self->_pinchFirstPoint)) {
    return 0;
  }
  v14.origin.double x = v5;
  v14.origin.double y = v7;
  v14.size.double width = v9;
  v14.size.double height = v11;
  return !CGRectContainsPoint(v14, self->_pinchSecondPoint);
}

- (BOOL)canMoveTrackpadBorder:(CGPoint)a3
{
  BOOL v4 = -[HNDTrackpadBorderView pointOnBorder:](self->_trackpadBorder, "pointOnBorder:", a3.x, a3.y);
  if (v4) {
    LOBYTE(v4) = !self->_fullScreen;
  }
  return v4;
}

- (BOOL)canResizeTrackpad:(CGPoint)a3
{
  if (self->_fullScreen) {
    return 0;
  }
  else {
    return -[HNDTrackpadBorderView pointOnTopLeftCorner:](self->_trackpadBorder, "pointOnTopLeftCorner:", a3.x, a3.y);
  }
}

- (CGPoint)convertSystemPointFromOrientation
{
  [(HNDHandManager *)self->_handManager systemPointerLocation];
  result.double y = v3;
  result.double x = v2;
  return result;
}

- (CGPoint)convertSystemPointToOrientation
{
  [(HNDHandManager *)self->_handManager systemPointerLocation];
  result.double y = v3;
  result.double x = v2;
  return result;
}

- (CGPoint)convertToTrackpadBorder:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  double v6 = [(HNDDisplayManager *)self->_displayManager window];
  objc_msgSend(v6, "convertPoint:toView:", self->_trackpadBorder, x, y);
  double v8 = v7;
  double v10 = v9;

  double v11 = v8;
  double v12 = v10;
  result.double y = v12;
  result.double x = v11;
  return result;
}

- (void)setTrackpadHitTest:(BOOL)a3
{
  BOOL v3 = a3;
  CGFloat v5 = [(HNDTrackpadBorderView *)self->_trackpadBorder layer];
  [v5 setAllowsHitTesting:v3];

  id v6 = [(HNDTrackpadView *)self->_trackpad layer];
  [v6 setAllowsHitTesting:v3];
}

- (CGPoint)getPointsDelta:(CGPoint)a3 startPoint:(CGPoint)a4 scale:(double)a5
{
  double v5 = (a3.x - a4.x) * a5;
  double v6 = (a3.y - a4.y) * a5;
  result.double y = v6;
  result.double x = v5;
  return result;
}

- (double)getScreenWidth
{
  double v2 = +[UIScreen mainScreen];
  [v2 bounds];
  double v4 = v3;
  double v6 = v5;

  if (v4 >= v6) {
    return v6;
  }
  else {
    return v4;
  }
}

- (double)getScreenHeight
{
  double v2 = +[UIScreen mainScreen];
  [v2 bounds];
  double v4 = v3;
  double v6 = v5;

  if (v4 >= v6) {
    return v4;
  }
  else {
    return v6;
  }
}

- (void)handleOrientationChange
{
  [(HNDTrackpadEventManager *)self updateTrackpadSize];
  [(HNDTrackpadBorderView *)self->_trackpadBorder frame];
  -[HNDTrackpadEventManager updateTrackpadFrameBounds:](self, "updateTrackpadFrameBounds:");

  [(HNDTrackpadEventManager *)self setFullScreen];
}

- (void)setTrackpadCornerPlacement
{
  if ([(HNDTrackpadEventManager *)self trackpadAtBottomRight])
  {
    unint64_t v3 = 1;
LABEL_9:
    self->_trackpadPosition = v3;
    return;
  }
  if ([(HNDTrackpadEventManager *)self trackpadAtBottomLeft])
  {
    unint64_t v3 = 2;
    goto LABEL_9;
  }
  if ([(HNDTrackpadEventManager *)self trackpadAtTopRight])
  {
    unint64_t v3 = 3;
    goto LABEL_9;
  }
  if ([(HNDTrackpadEventManager *)self trackpadAtTopLeft])
  {
    unint64_t v3 = 4;
    goto LABEL_9;
  }
  self->_trackpadPosition = 0;
}

- (void)handleTrackpadCornerPlacement
{
  switch(self->_trackpadPosition)
  {
    case 1uLL:
      [(HNDTrackpadEventManager *)self setTrackpadPositionBottomRight];
      break;
    case 2uLL:
      [(HNDTrackpadEventManager *)self setTrackpadPositionBottomLeft];
      break;
    case 3uLL:
      [(HNDTrackpadEventManager *)self setTrackpadPositionTopRight];
      break;
    case 4uLL:
      [(HNDTrackpadEventManager *)self setTrackpadPositionTopLeft];
      break;
    default:
      return;
  }
}

- (BOOL)trackpadAtBottomRight
{
  [(HNDTrackpadEventManager *)self getScreenWidth];
  double v4 = v3;
  [(HNDTrackpadEventManager *)self getScreenHeight];
  double v6 = v5;
  [(HNDTrackpadBorderView *)self->_trackpadBorder bounds];
  double v8 = v7;
  double v10 = v9;
  [(HNDTrackpadBorderView *)self->_trackpadBorder frame];
  return v12 == v6 - v10 && v11 == v4 - v8;
}

- (BOOL)trackpadAtBottomLeft
{
  [(HNDTrackpadEventManager *)self getScreenHeight];
  double v4 = v3;
  [(HNDTrackpadBorderView *)self->_trackpadBorder bounds];
  double v6 = v5;
  [(HNDTrackpadBorderView *)self->_trackpadBorder frame];
  return v8 == v4 - v6 && v7 == 0.0;
}

- (BOOL)trackpadAtTopRight
{
  [(HNDTrackpadEventManager *)self getScreenWidth];
  double v4 = v3;
  [(HNDTrackpadBorderView *)self->_trackpadBorder bounds];
  double v6 = v5;
  [(HNDTrackpadBorderView *)self->_trackpadBorder frame];
  return v8 == 0.0 && v7 == v4 - v6;
}

- (BOOL)trackpadAtTopLeft
{
  [(HNDTrackpadBorderView *)self->_trackpadBorder frame];
  return v3 == 0.0 && v2 == 0.0;
}

- (void)setTrackpadPositionBottomRight
{
  [(HNDTrackpadEventManager *)self getScreenWidth];
  double v4 = v3;
  [(HNDTrackpadEventManager *)self getScreenHeight];
  double v6 = v5;
  [(HNDTrackpadBorderView *)self->_trackpadBorder bounds];
  double v8 = v7;
  double v10 = v9;
  [(HNDTrackpadBorderView *)self->_trackpadBorder frame];
  trackpadBorder = self->_trackpadBorder;

  -[HNDTrackpadBorderView setFrame:](trackpadBorder, "setFrame:", v4 - v8, v6 - v10);
}

- (void)setTrackpadPositionBottomLeft
{
  [(HNDTrackpadEventManager *)self getScreenHeight];
  double v4 = v3;
  [(HNDTrackpadBorderView *)self->_trackpadBorder bounds];
  double v6 = v5;
  [(HNDTrackpadBorderView *)self->_trackpadBorder frame];
  trackpadBorder = self->_trackpadBorder;

  -[HNDTrackpadBorderView setFrame:](trackpadBorder, "setFrame:", 0.0, v4 - v6);
}

- (void)setTrackpadPositionTopRight
{
  [(HNDTrackpadEventManager *)self getScreenWidth];
  double v4 = v3;
  [(HNDTrackpadBorderView *)self->_trackpadBorder bounds];
  double v6 = v5;
  [(HNDTrackpadBorderView *)self->_trackpadBorder frame];
  trackpadBorder = self->_trackpadBorder;

  -[HNDTrackpadBorderView setFrame:](trackpadBorder, "setFrame:", v4 - v6, 0.0);
}

- (void)setTrackpadPositionTopLeft
{
  [(HNDTrackpadBorderView *)self->_trackpadBorder frame];
  trackpadBorder = self->_trackpadBorder;

  -[HNDTrackpadBorderView setFrame:](trackpadBorder, "setFrame:", 0.0, 0.0);
}

- (double)pointerSpeed
{
  return self->_pointerSpeed;
}

- (void)setPointerSpeed:(double)a3
{
  self->_pointerSpeed = a3;
}

- (double)scrollSpeed
{
  return self->_scrollSpeed;
}

- (void)setScrollSpeed:(double)a3
{
  self->_scrollSpeed = a3;
}

- (BOOL)naturalScroll
{
  return self->_naturalScroll;
}

- (void)setNaturalScroll:(BOOL)a3
{
  self->_naturalScroll = a3;
}

- (BOOL)fullScreen
{
  return self->_fullScreen;
}

- (void)setFullScreen:(BOOL)a3
{
  self->_fullScreen = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trackpad, 0);
  objc_storeStrong((id *)&self->_trackpadBorder, 0);
  objc_storeStrong((id *)&self->_displayManager, 0);

  objc_storeStrong((id *)&self->_handManager, 0);
}

@end