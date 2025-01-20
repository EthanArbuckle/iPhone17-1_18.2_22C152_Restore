@interface WKSwipeTransitionController
- (BOOL)interactiveTransition:(id)a3 gestureRecognizer:(id)a4 shouldReceiveTouch:(id)a5;
- (BOOL)interactiveTransition:(id)a3 gestureRecognizer:(id)a4 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a5;
- (BOOL)isNavigationSwipeGestureRecognizer:(id)a3;
- (BOOL)shouldBeginInteractiveTransition:(id)a3;
- (WKSwipeTransitionController)initWithViewGestureController:(void *)a3 gestureRecognizerView:(id)a4;
- (id).cxx_construct;
- (id)gestureRecognizerForInteractiveTransition:(id)a3 WithTarget:(id)a4 action:(SEL)a5;
- (id)transitionForDirection:(int)a3;
- (int)directionForTransition:(id)a3;
- (void)invalidate;
- (void)startInteractiveTransition:(id)a3;
@end

@implementation WKSwipeTransitionController

- (id).cxx_construct
{
  *((void *)self + 2) = 0;
  *((void *)self + 3) = 0;
  *((void *)self + 4) = 0;
  return self;
}

- (id)gestureRecognizerForInteractiveTransition:(id)a3 WithTarget:(id)a4 action:(SEL)a5
{
  v7 = (void *)[objc_alloc(MEMORY[0x1E4F43278]) initWithTarget:a4 action:a5];
  v8 = (void *)MEMORY[0x1E4F42FF0];
  id WeakRetained = objc_loadWeakRetained(&self->_gestureRecognizerView.m_weakReference);
  uint64_t v10 = objc_msgSend(v8, "userInterfaceLayoutDirectionForSemanticContentAttribute:", objc_msgSend(WeakRetained, "semanticContentAttribute"));
  if (WeakRetained) {
    CFRelease(WeakRetained);
  }
  int v11 = [(WKSwipeTransitionController *)self directionForTransition:a3];
  if (v11)
  {
    if (v11 != 1) {
      return (id)(id)CFMakeCollectable(v7);
    }
    BOOL v12 = v10 == 0;
    uint64_t v13 = 2;
    uint64_t v14 = 8;
  }
  else
  {
    BOOL v12 = v10 == 0;
    uint64_t v13 = 8;
    uint64_t v14 = 2;
  }
  if (v12) {
    uint64_t v15 = v14;
  }
  else {
    uint64_t v15 = v13;
  }
  [v7 setEdges:v15];
  return (id)(id)CFMakeCollectable(v7);
}

- (int)directionForTransition:(id)a3
{
  return self->_backTransitionController.m_ptr != a3;
}

- (WKSwipeTransitionController)initWithViewGestureController:(void *)a3 gestureRecognizerView:(id)a4
{
  v19.receiver = self;
  v19.super_class = (Class)WKSwipeTransitionController;
  v6 = [(WKSwipeTransitionController *)&v19 init];
  v7 = v6;
  if (v6)
  {
    v6->_gestureController = a3;
    objc_storeWeak(&v6->_gestureRecognizerView.m_weakReference, a4);
    id v8 = objc_alloc(MEMORY[0x1E4F43258]);
    m_ptr = v7->_backTransitionController.m_ptr;
    v7->_backTransitionController.m_ptr = v8;
    if (m_ptr)
    {
      CFRelease(m_ptr);
      id v8 = v7->_backTransitionController.m_ptr;
    }
    uint64_t v10 = (void *)[v8 initWithGestureRecognizerView:a4 animator:0 delegate:v7];
    int v11 = v10;
    if (v10) {
      CFRetain(v10);
    }
    BOOL v12 = v7->_backTransitionController.m_ptr;
    v7->_backTransitionController.m_ptr = v11;
    if (v12) {
      CFRelease(v12);
    }
    id v13 = objc_alloc(MEMORY[0x1E4F43258]);
    uint64_t v14 = v7->_forwardTransitionController.m_ptr;
    v7->_forwardTransitionController.m_ptr = v13;
    if (v14)
    {
      CFRelease(v14);
      id v13 = v7->_forwardTransitionController.m_ptr;
    }
    uint64_t v15 = (void *)[v13 initWithGestureRecognizerView:a4 animator:0 delegate:v7];
    v16 = v15;
    if (v15) {
      CFRetain(v15);
    }
    v17 = v7->_forwardTransitionController.m_ptr;
    v7->_forwardTransitionController.m_ptr = v16;
    if (v17)
    {
      CFRelease(v17);
      v16 = v7->_forwardTransitionController.m_ptr;
    }
    [v16 setShouldReverseTranslation:1];
  }
  return v7;
}

- (void)invalidate
{
  self->_gestureController = 0;
}

- (id)transitionForDirection:(int)a3
{
  uint64_t v3 = 24;
  if (!a3) {
    uint64_t v3 = 16;
  }
  return *(Class *)((char *)&self->super.isa + v3);
}

- (void)startInteractiveTransition:(id)a3
{
  gestureController = self->_gestureController;
  int v5 = -[WKSwipeTransitionController directionForTransition:](self, "directionForTransition:");

  WebKit::ViewGestureController::beginSwipeGesture((uint64_t)gestureController, a3, v5);
}

- (BOOL)shouldBeginInteractiveTransition:(id)a3
{
  gestureController = self->_gestureController;
  int v4 = [(WKSwipeTransitionController *)self directionForTransition:a3];

  return WebKit::ViewGestureController::canSwipeInDirection((uint64_t)gestureController, v4);
}

- (BOOL)interactiveTransition:(id)a3 gestureRecognizer:(id)a4 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a5
{
  return objc_opt_isKindOfClass() & 1;
}

- (BOOL)interactiveTransition:(id)a3 gestureRecognizer:(id)a4 shouldReceiveTouch:(id)a5
{
  return 1;
}

- (BOOL)isNavigationSwipeGestureRecognizer:(id)a3
{
  return (id)[self->_backTransitionController.m_ptr gestureRecognizer] == a3
      || [self->_forwardTransitionController.m_ptr gestureRecognizer] == (void)a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_gestureRecognizerView.m_weakReference);
  m_ptr = self->_forwardTransitionController.m_ptr;
  self->_forwardTransitionController.m_ptr = 0;
  if (m_ptr) {
    CFRelease(m_ptr);
  }
  int v4 = self->_backTransitionController.m_ptr;
  self->_backTransitionController.m_ptr = 0;
  if (v4)
  {
    CFRelease(v4);
  }
}

@end