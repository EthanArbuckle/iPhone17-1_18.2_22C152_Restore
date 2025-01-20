@interface EKEventCreationGestureController
- (BOOL)currentlyCreatingEvent;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (EKEventCreationGestureController)initWithView:(id)a3 delegate:(id)a4;
- (id)_snapDateTo15MinuteInterval:(id)a3;
- (void)_adjustPreviewFrame;
- (void)_cleanUp;
- (void)_gestureBegan;
- (void)_gestureCanceled;
- (void)_gestureChangedEnoughToCreateEvent;
- (void)_gestureCompleted;
- (void)_gestureUpdated;
- (void)dealloc;
- (void)handleGesture:(id)a3;
- (void)invalidate;
@end

@implementation EKEventCreationGestureController

- (EKEventCreationGestureController)initWithView:(id)a3 delegate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)EKEventCreationGestureController;
  v8 = [(EKEventCreationGestureController *)&v17 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_gestureDelegate, v7);
    objc_storeWeak((id *)&v9->_targetView, v6);
    uint64_t v10 = [objc_alloc(MEMORY[0x1E4FB1968]) initWithTarget:v9 action:sel_handleGesture_];
    gestureRecognizer = v9->_gestureRecognizer;
    v9->_gestureRecognizer = (UILongPressGestureRecognizer *)v10;

    [(UILongPressGestureRecognizer *)v9->_gestureRecognizer setDelegate:v9];
    [(UILongPressGestureRecognizer *)v9->_gestureRecognizer setMinimumPressDuration:0.16];
    [(UILongPressGestureRecognizer *)v9->_gestureRecognizer setAllowableMovement:1000.0];
    v12 = (void *)MEMORY[0x1E4F1C978];
    v13 = [NSNumber numberWithInteger:3];
    v14 = [v12 arrayWithObject:v13];
    [(UILongPressGestureRecognizer *)v9->_gestureRecognizer setAllowedTouchTypes:v14];

    id WeakRetained = objc_loadWeakRetained((id *)&v9->_targetView);
    [WeakRetained addGestureRecognizer:v9->_gestureRecognizer];

    v9->_state = 0;
  }

  return v9;
}

- (void)dealloc
{
  [(EKEventCreationGestureController *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)EKEventCreationGestureController;
  [(EKEventCreationGestureController *)&v3 dealloc];
}

- (BOOL)currentlyCreatingEvent
{
  return self->_state != 0;
}

- (void)invalidate
{
  p_targetView = &self->_targetView;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_targetView);
  [WeakRetained removeGestureRecognizer:self->_gestureRecognizer];

  gestureRecognizer = self->_gestureRecognizer;
  self->_gestureRecognizer = 0;

  objc_storeWeak((id *)&self->_gestureDelegate, 0);

  objc_storeWeak((id *)p_targetView, 0);
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  objc_super v3 = self;
  p_gestureDelegate = &self->_gestureDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_gestureDelegate);
  id v6 = [WeakRetained creationGestureControllerRequestedContainerView:v3];

  [(UILongPressGestureRecognizer *)v3->_gestureRecognizer locationInView:v6];
  double v8 = v7;
  double v10 = v9;
  id v11 = objc_loadWeakRetained((id *)p_gestureDelegate);
  LOBYTE(v3) = objc_msgSend(v11, "creationGestureController:canActivateAtPoint:", v3, v8, v10);

  return (char)v3;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  v4 = self;
  p_gestureDelegate = &self->_gestureDelegate;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_gestureDelegate);
  double v8 = [WeakRetained creationGestureControllerRequestedContainerView:v4];

  [v6 locationInView:v8];
  double v10 = v9;
  double v12 = v11;

  id v13 = objc_loadWeakRetained((id *)p_gestureDelegate);
  LOBYTE(v4) = objc_msgSend(v13, "creationGestureController:canActivateAtPoint:", v4, v10, v12);

  return (char)v4;
}

- (void)handleGesture:(id)a3
{
  switch([a3 state])
  {
    case 1:
      [(EKEventCreationGestureController *)self _gestureBegan];
      break;
    case 2:
      [(EKEventCreationGestureController *)self _gestureUpdated];
      break;
    case 3:
      [(EKEventCreationGestureController *)self _gestureCompleted];
      break;
    case 4:
    case 5:
      [(EKEventCreationGestureController *)self _gestureCanceled];
      break;
    default:
      return;
  }
}

- (id)_snapDateTo15MinuteInterval:(id)a3
{
  [a3 timeIntervalSinceReferenceDate];
  double v4 = round(v3 / 900.0) * 900.0;
  v5 = (void *)MEMORY[0x1E4F1C9C8];

  return (id)[v5 dateWithTimeIntervalSinceReferenceDate:v4];
}

- (void)_adjustPreviewFrame
{
  p_gestureDelegate = &self->_gestureDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_gestureDelegate);
  objc_msgSend(WeakRetained, "creationGestureController:requestedWidthForEventPreview:atPoint:", self, self->_eventPreview, self->_originPoint.x, self->_originPoint.y);
  double v6 = v5;

  [(UILongPressGestureRecognizer *)self->_gestureRecognizer locationInView:self->_containerView];
  double v8 = v7;
  double v9 = self->_originPoint.y - v7;
  if (v9 >= 0.0) {
    double v10 = self->_originPoint.y - v7;
  }
  else {
    double v10 = -v9;
  }
  id v11 = objc_loadWeakRetained((id *)p_gestureDelegate);
  objc_msgSend(v11, "creationGestureController:requestedXCoordinateForEventPreviewAtPoint:", self, self->_originPoint.x, self->_originPoint.y);
  double v13 = v12;

  if (self->_originPoint.y >= v8) {
    double y = v8;
  }
  else {
    double y = self->_originPoint.y;
  }
  -[EKDayOccurrenceView setFrame:](self->_eventPreview, "setFrame:", v13, y, v6, v10);
  eventPreview = self->_eventPreview;

  [(EKDayOccurrenceView *)eventPreview requestContentIfNeeded:16 completion:0];
}

- (void)_cleanUp
{
  [(EKDayOccurrenceView *)self->_eventPreview removeFromSuperview];
  newEvent = self->_newEvent;
  self->_newEvent = 0;

  containerView = self->_containerView;
  self->_containerView = 0;

  eventPreview = self->_eventPreview;
  self->_eventPreview = 0;

  self->_originPoint = (CGPoint)*MEMORY[0x1E4F1DAD8];
  self->_state = 0;
}

- (void)_gestureBegan
{
  p_gestureDelegate = &self->_gestureDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_gestureDelegate);
  double v5 = [WeakRetained creationGestureControllerRequestedContainerView:self];
  containerView = self->_containerView;
  self->_containerView = v5;

  [(UILongPressGestureRecognizer *)self->_gestureRecognizer locationInView:self->_containerView];
  double v8 = v7;
  double v10 = v9;
  id v11 = objc_loadWeakRetained((id *)p_gestureDelegate);
  objc_msgSend(v11, "creationGestureController:dateForPoint:", self, v8, v10);
  id v18 = (id)objc_claimAutoreleasedReturnValue();

  double v12 = [(EKEventCreationGestureController *)self _snapDateTo15MinuteInterval:v18];
  id v13 = objc_loadWeakRetained((id *)p_gestureDelegate);
  [v13 creationGestureController:self requestsPointForDate:v12];
  CGFloat v15 = v14;
  CGFloat v17 = v16;

  self->_originPoint.x = v15;
  self->_originPoint.double y = v17;
  self->_state = 1;
}

- (void)_gestureChangedEnoughToCreateEvent
{
  p_gestureDelegate = &self->_gestureDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_gestureDelegate);
  double v5 = (EKEvent *)[WeakRetained creationGestureControllerRequestsNewEvent:self];
  newEvent = self->_newEvent;
  self->_newEvent = v5;

  id v7 = objc_loadWeakRetained((id *)p_gestureDelegate);
  double v8 = (EKDayOccurrenceView *)[v7 creationGestureController:self requestedPreviewForEvent:self->_newEvent];
  eventPreview = self->_eventPreview;
  self->_eventPreview = v8;

  [(EKEventCreationGestureController *)self _adjustPreviewFrame];
  [(UIView *)self->_containerView addSubview:self->_eventPreview];
  self->_state = 2;
}

- (void)_gestureUpdated
{
  int state = self->_state;
  if (state == 1)
  {
    [(UILongPressGestureRecognizer *)self->_gestureRecognizer locationInView:self->_containerView];
    double v5 = v4 - self->_originPoint.y;
    if (v5 < 0.0) {
      double v5 = -v5;
    }
    if (v5 > 10.0) {
      [(EKEventCreationGestureController *)self _gestureChangedEnoughToCreateEvent];
    }
    int state = self->_state;
  }
  if (state == 2)
  {
    [(EKEventCreationGestureController *)self _adjustPreviewFrame];
    [(UILongPressGestureRecognizer *)self->_gestureRecognizer locationInView:self->_containerView];
    double v7 = v6;
    double v9 = v8;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_gestureDelegate);
    id v11 = objc_msgSend(WeakRetained, "creationGestureController:dateForPoint:", self, v7, v9);

    id v13 = [(EKEventCreationGestureController *)self _snapDateTo15MinuteInterval:v11];

    id v12 = objc_loadWeakRetained((id *)&self->_gestureDelegate);
    [v12 creationGestureController:self didResizeToDate:v13];
  }
}

- (void)_gestureCompleted
{
  v22 = self->_newEvent;
  if (self->_state == 2)
  {
    [(EKDayOccurrenceView *)self->_eventPreview frame];
    double v4 = v3;
    double v6 = v5;
    [(EKDayOccurrenceView *)self->_eventPreview frame];
    CGFloat v7 = CGRectGetMaxX(v24) + -1.0;
    [(EKDayOccurrenceView *)self->_eventPreview frame];
    double MaxY = CGRectGetMaxY(v25);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_gestureDelegate);
    double v10 = objc_msgSend(WeakRetained, "creationGestureController:dateForPoint:", self, v4, v6);

    id v11 = objc_loadWeakRetained((id *)&self->_gestureDelegate);
    id v12 = objc_msgSend(v11, "creationGestureController:dateForPoint:", self, v7, MaxY);

    id v13 = [(EKEventCreationGestureController *)self _snapDateTo15MinuteInterval:v10];

    double v14 = [(EKEventCreationGestureController *)self _snapDateTo15MinuteInterval:v12];

    [v14 timeIntervalSinceReferenceDate];
    double v16 = v15;
    [v13 timeIntervalSinceReferenceDate];
    double v18 = v16 - v17;
    newEvent = self->_newEvent;
    if (v18 <= 15.0)
    {
      v20 = [(EKEvent *)newEvent eventStore];
      [v20 removeEvent:self->_newEvent span:0 error:0];
    }
    else
    {
      [(EKEvent *)newEvent setStartDate:v13];
      [(EKEvent *)self->_newEvent setEndDateUnadjustedForLegacyClients:v14];
    }

    [(EKEventCreationGestureController *)self _cleanUp];
    if (v18 > 15.0)
    {
      id v21 = objc_loadWeakRetained((id *)&self->_gestureDelegate);
      [v21 creationGestureController:self didCreateNewEvent:v22];
      goto LABEL_9;
    }
  }
  else
  {
    [(EKEventCreationGestureController *)self _cleanUp];
  }
  id v21 = objc_loadWeakRetained((id *)&self->_gestureDelegate);
  [v21 creationGestureControllerDidCancel:self];
LABEL_9:
}

- (void)_gestureCanceled
{
  [(EKEventCreationGestureController *)self _cleanUp];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_gestureDelegate);
  [WeakRetained creationGestureControllerDidCancel:self];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventPreview, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_newEvent, 0);
  objc_storeStrong((id *)&self->_gestureRecognizer, 0);
  objc_destroyWeak((id *)&self->_targetView);

  objc_destroyWeak((id *)&self->_gestureDelegate);
}

@end