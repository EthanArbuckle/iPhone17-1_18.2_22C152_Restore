@interface AXMTLookAtPointTrackerObserver
- (AXMTLookAtPointTrackerObserver)init;
- (AXMTLookAtPointTrackerObserverDelegate)delegate;
- (AXSSMotionTrackingState)state;
- (CGPoint)_lookAtPoint;
- (NSError)_error;
- (NSMutableSet)_expressions;
- (NSTimer)_initializationTimer;
- (void)_initializationTimerFired:(id)a3;
- (void)_stateUpdated;
- (void)_updateError:(id)a3;
- (void)_updateExpressions:(id)a3;
- (void)_updateLookAtPoint:(CGPoint)a3;
- (void)lookAtPointTracker:(id)a3 didFailToTrackFaceWithError:(id)a4;
- (void)lookAtPointTracker:(id)a3 expressionEnded:(unint64_t)a4;
- (void)lookAtPointTracker:(id)a3 expressionStarted:(unint64_t)a4;
- (void)lookAtPointTracker:(id)a3 trackedOnScreenPoint:(CGPoint)a4;
- (void)lookAtPointTracker:(id)a3 trackedOnScreenPoint:(CGPoint)a4 error:(id)a5;
- (void)lookAtPointTrackerFoundFace:(id)a3;
- (void)lookAtPointTrackerLostFace:(id)a3 error:(id)a4;
- (void)lookAtPointTrackerWasInterrupted:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setState:(id)a3;
- (void)set_error:(id)a3;
- (void)set_expressions:(id)a3;
- (void)set_initializationTimer:(id)a3;
- (void)set_lookAtPoint:(CGPoint)a3;
@end

@implementation AXMTLookAtPointTrackerObserver

- (AXMTLookAtPointTrackerObserver)init
{
  v6.receiver = self;
  v6.super_class = (Class)AXMTLookAtPointTrackerObserver;
  v2 = [(AXMTLookAtPointTrackerObserver *)&v6 init];
  if (v2)
  {
    v3 = +[NSError errorWithDomain:AXSSMotionTrackingErrorDomain code:11 userInfo:0];
    [(AXMTLookAtPointTrackerObserver *)v2 set_error:v3];

    -[AXMTLookAtPointTrackerObserver set_lookAtPoint:](v2, "set_lookAtPoint:", AXSSMotionTrackingInvalidPoint[0], AXSSMotionTrackingInvalidPoint[1]);
    v4 = +[NSMutableSet set];
    [(AXMTLookAtPointTrackerObserver *)v2 set_expressions:v4];

    [(AXMTLookAtPointTrackerObserver *)v2 _stateUpdated];
  }
  return v2;
}

- (void)lookAtPointTracker:(id)a3 trackedOnScreenPoint:(CGPoint)a4
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001AD94;
  block[3] = &unk_1000489C8;
  block[4] = self;
  CGPoint v5 = a4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)lookAtPointTracker:(id)a3 trackedOnScreenPoint:(CGPoint)a4 error:(id)a5
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10001AE80;
  v6[3] = &unk_100048EE8;
  CGPoint v8 = a4;
  v6[4] = self;
  id v7 = a5;
  id v5 = v7;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
}

- (void)lookAtPointTracker:(id)a3 expressionStarted:(unint64_t)a4
{
  objc_super v6 = AXSSLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = AXSSHumanReadableDescriptionForMotionTrackingFacialExpression();
    *(_DWORD *)buf = 134218242;
    unint64_t v10 = a4;
    __int16 v11 = 2112;
    v12 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "AXMTLookAtPointTrackerObserver: expressionStarted %lu %@", buf, 0x16u);
  }
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10001B02C;
  v8[3] = &unk_1000489A0;
  v8[4] = self;
  v8[5] = a4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v8);
}

- (void)lookAtPointTracker:(id)a3 expressionEnded:(unint64_t)a4
{
  objc_super v6 = AXSSLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = AXSSHumanReadableDescriptionForMotionTrackingFacialExpression();
    *(_DWORD *)buf = 134218242;
    unint64_t v10 = a4;
    __int16 v11 = 2112;
    v12 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "AXMTLookAtPointTrackerObserver: expressionEnded %lu %@", buf, 0x16u);
  }
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10001B208;
  v8[3] = &unk_1000489A0;
  v8[4] = self;
  v8[5] = a4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v8);
}

- (void)lookAtPointTrackerFoundFace:(id)a3
{
  v3 = AXSSLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_10001BE10(v3);
  }
}

- (void)lookAtPointTrackerLostFace:(id)a3 error:(id)a4
{
  id v5 = a4;
  objc_super v6 = AXSSLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_10001BE54((uint64_t)v5, v6);
  }

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10001B3D4;
  v8[3] = &unk_100048928;
  id v9 = v5;
  unint64_t v10 = self;
  id v7 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v8);
}

- (void)lookAtPointTracker:(id)a3 didFailToTrackFaceWithError:(id)a4
{
  id v5 = a4;
  objc_super v6 = AXSSLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_10001BECC((uint64_t)v5, v6);
  }

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10001B58C;
  v8[3] = &unk_100048928;
  void v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v8);
}

- (void)lookAtPointTrackerWasInterrupted:(id)a3
{
  v4 = AXSSLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_10001BF44(v4);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001B678;
  block[3] = &unk_1000488D8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_stateUpdated
{
  id v16 = objc_alloc_init((Class)AXSSMotionTrackingState);
  [(AXMTLookAtPointTrackerObserver *)self _lookAtPoint];
  objc_msgSend(v16, "setLookAtPoint:");
  v3 = [(AXMTLookAtPointTrackerObserver *)self _expressions];
  id v4 = [v3 copy];
  [v16 setExpressions:v4];

  id v5 = [(AXMTLookAtPointTrackerObserver *)self _error];
  [v16 setError:v5];

  [(AXMTLookAtPointTrackerObserver *)self setState:v16];
  objc_super v6 = [(AXMTLookAtPointTrackerObserver *)self delegate];
  LOBYTE(v4) = objc_opt_respondsToSelector();

  if (v4)
  {
    id v7 = [(AXMTLookAtPointTrackerObserver *)self delegate];
    [v7 lookAtPointTrackerObserver:self updatedState:v16];
  }
  CGPoint v8 = [(AXMTLookAtPointTrackerObserver *)self state];
  id v9 = [v8 error];
  unint64_t v10 = [v9 domain];
  if (![v10 isEqualToString:AXSSMotionTrackingErrorDomain]) {
    goto LABEL_8;
  }
  __int16 v11 = [(AXMTLookAtPointTrackerObserver *)self state];
  v12 = [v11 error];
  if ([v12 code] != (id)11)
  {

LABEL_8:
    goto LABEL_9;
  }
  v13 = [(AXMTLookAtPointTrackerObserver *)self _initializationTimer];

  if (!v13)
  {
    v14 = +[NSTimer scheduledTimerWithTimeInterval:self target:"_initializationTimerFired:" selector:0 userInfo:0 repeats:7.0];
    [(AXMTLookAtPointTrackerObserver *)self set_initializationTimer:v14];

    goto LABEL_10;
  }
LABEL_9:
  v15 = [(AXMTLookAtPointTrackerObserver *)self _initializationTimer];
  [v15 invalidate];

  [(AXMTLookAtPointTrackerObserver *)self set_initializationTimer:0];
LABEL_10:
}

- (void)_initializationTimerFired:(id)a3
{
  id v4 = [(AXMTLookAtPointTrackerObserver *)self state];
  id v5 = [v4 error];
  objc_super v6 = [v5 domain];
  uint64_t v7 = AXSSMotionTrackingErrorDomain;
  if ([v6 isEqualToString:AXSSMotionTrackingErrorDomain])
  {
    CGPoint v8 = [(AXMTLookAtPointTrackerObserver *)self state];
    id v9 = [v8 error];
    id v10 = [v9 code];

    if (v10 != (id)11) {
      goto LABEL_6;
    }
    id v4 = [objc_alloc((Class)NSError) initWithDomain:v7 code:12 userInfo:0];
    [(AXMTLookAtPointTrackerObserver *)self _updateError:v4];
    [(AXMTLookAtPointTrackerObserver *)self _stateUpdated];
  }
  else
  {
  }
LABEL_6:
  __int16 v11 = [(AXMTLookAtPointTrackerObserver *)self _initializationTimer];
  [v11 invalidate];

  [(AXMTLookAtPointTrackerObserver *)self set_initializationTimer:0];
}

- (void)_updateError:(id)a3
{
  id v8 = a3;
  id v4 = [(AXMTLookAtPointTrackerObserver *)self _error];
  unsigned __int8 v5 = [v8 isEqual:v4];

  if ((v5 & 1) == 0)
  {
    id v6 = v8;
    if (v8)
    {
      -[AXMTLookAtPointTrackerObserver set_lookAtPoint:](self, "set_lookAtPoint:", AXSSMotionTrackingInvalidPoint[0], AXSSMotionTrackingInvalidPoint[1]);
      uint64_t v7 = [(AXMTLookAtPointTrackerObserver *)self _expressions];
      [v7 removeAllObjects];

      id v6 = v8;
    }
    [(AXMTLookAtPointTrackerObserver *)self set_error:v6];
  }
}

- (void)_updateExpressions:(id)a3
{
  id v9 = a3;
  id v4 = [(AXMTLookAtPointTrackerObserver *)self _expressions];
  unsigned __int8 v5 = [v9 isEqual:v4];

  if ((v5 & 1) == 0)
  {
    id v6 = [(AXMTLookAtPointTrackerObserver *)self _expressions];
    [v6 removeAllObjects];

    uint64_t v7 = [(AXMTLookAtPointTrackerObserver *)self _expressions];
    id v8 = [v9 allObjects];
    [v7 addObjectsFromArray:v8];

    if ([v9 count]) {
      [(AXMTLookAtPointTrackerObserver *)self set_error:0];
    }
  }
}

- (void)_updateLookAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(AXMTLookAtPointTrackerObserver *)self _lookAtPoint];
  v9.double x = x;
  v9.double y = y;
  if (!NSEqualPoints(v7, v9))
  {
    -[AXMTLookAtPointTrackerObserver set_lookAtPoint:](self, "set_lookAtPoint:", x, y);
    [(AXMTLookAtPointTrackerObserver *)self _lookAtPoint];
    v10.double x = AXSSMotionTrackingInvalidPoint[0];
    v10.double y = AXSSMotionTrackingInvalidPoint[1];
    if (!NSEqualPoints(v8, v10))
    {
      [(AXMTLookAtPointTrackerObserver *)self set_error:0];
    }
  }
}

- (AXSSMotionTrackingState)state
{
  return self->_state;
}

- (void)setState:(id)a3
{
}

- (AXMTLookAtPointTrackerObserverDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AXMTLookAtPointTrackerObserverDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSMutableSet)_expressions
{
  return self->__expressions;
}

- (void)set_expressions:(id)a3
{
}

- (CGPoint)_lookAtPoint
{
  double x = self->__lookAtPoint.x;
  double y = self->__lookAtPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)set_lookAtPoint:(CGPoint)a3
{
  self->__lookAtPoint = a3;
}

- (NSError)_error
{
  return self->__error;
}

- (void)set_error:(id)a3
{
}

- (NSTimer)_initializationTimer
{
  return self->__initializationTimer;
}

- (void)set_initializationTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__initializationTimer, 0);
  objc_storeStrong((id *)&self->__error, 0);
  objc_storeStrong((id *)&self->__expressions, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_state, 0);
}

@end