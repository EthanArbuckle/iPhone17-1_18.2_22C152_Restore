@interface VOTUISystemPointerController
- (BOOL)handlePointerEvent:(id)a3;
- (CGPoint)lastPointerEventPoint;
- (VOTUISystemPointerController)initWithContextId:(unsigned int)a3;
- (VOTUISystemPointerControllerDelegate)delegate;
- (unsigned)contextId;
- (void)dealloc;
- (void)movePointerToPoint:(CGPoint)a3 contextId:(unsigned int)a4;
- (void)setDelegate:(id)a3;
- (void)setLastPointerEventPoint:(CGPoint)a3;
@end

@implementation VOTUISystemPointerController

- (VOTUISystemPointerController)initWithContextId:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  v16.receiver = self;
  v16.super_class = (Class)VOTUISystemPointerController;
  v4 = [(VOTUISystemPointerController *)&v16 init];
  v5 = v4;
  if (v4)
  {
    v4->_contextId = v3;
    if (v3)
    {
      v6 = +[BKSMousePointerService sharedInstance];
      uint64_t v7 = [v6 requestGlobalMouseEventsForDisplay:0 targetContextID:v3];
      pointerEventStream = v5->_pointerEventStream;
      v5->_pointerEventStream = (BSInvalidatable *)v7;
    }
    __asm { FMOV            V0.2D, #-1.0 }
    v5->_lastPointerEventPoint = _Q0;
    v14 = +[AXUIEventManager sharedEventManager];
    [v14 registerEventHandler:v5];
  }
  return v5;
}

- (void)dealloc
{
  uint64_t v3 = +[AXUIEventManager sharedEventManager];
  [v3 unregisterEventHandler:self];

  [(BSInvalidatable *)self->_pointerEventStream invalidate];
  pointerEventStream = self->_pointerEventStream;
  self->_pointerEventStream = 0;

  v5.receiver = self;
  v5.super_class = (Class)VOTUISystemPointerController;
  [(VOTUISystemPointerController *)&v5 dealloc];
}

- (void)movePointerToPoint:(CGPoint)a3 contextId:(unsigned int)a4
{
  id v5 = objc_msgSend(objc_alloc((Class)BKSContextRelativePoint), "initWithPoint:contextID:", *(void *)&a4, a3.x, a3.y);
  v4 = +[BKSMousePointerService sharedInstance];
  [v4 setContextRelativePointerPosition:v5 onDisplay:0 withAnimationParameters:0 restrictingToPID:0xFFFFFFFFLL];
}

- (BOOL)handlePointerEvent:(id)a3
{
  id v4 = a3;
  double Current = CFAbsoluteTimeGetCurrent();
  if (Current - *(double *)&qword_4BEC8 > 0.05)
  {
    v6 = [v4 pointerControllerInfo];
    unsigned int v7 = [v6 pointerIsAbsolute];

    if (v7)
    {
      v8 = [v4 pointerControllerInfo];
      [v8 pointerX];
      double v10 = v9;
      v11 = [v4 pointerControllerInfo];
      [v11 pointerY];
      double v13 = v12;

      [(VOTUISystemPointerController *)self lastPointerEventPoint];
      if (v15 != v10 || v14 != v13)
      {
        qword_4BEC8 = *(void *)&Current;
        -[VOTUISystemPointerController setLastPointerEventPoint:](self, "setLastPointerEventPoint:", v10, v13);
        objc_super v16 = +[AXBackBoardServer server];
        objc_msgSend(v16, "convertPoint:fromContextId:", -[VOTUISystemPointerController contextId](self, "contextId"), v10, v13);
        double v18 = v17;
        double v20 = v19;

        v21 = [(VOTUISystemPointerController *)self delegate];
        objc_msgSend(v21, "systemPointerController:pointerDidMoveToGlobalPoint:", self, v18, v20);
      }
    }
  }

  return 0;
}

- (VOTUISystemPointerControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (VOTUISystemPointerControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (unsigned)contextId
{
  return self->_contextId;
}

- (CGPoint)lastPointerEventPoint
{
  double x = self->_lastPointerEventPoint.x;
  double y = self->_lastPointerEventPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setLastPointerEventPoint:(CGPoint)a3
{
  self->_lastPointerEventPoint = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_pointerEventStream, 0);
}

@end