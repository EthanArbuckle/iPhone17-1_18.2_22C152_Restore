@interface CSScrollGestureController
- (BOOL)_shouldAllowScrollForScrollingStrategy:(int64_t)a3;
- (BOOL)_shouldFailHorizontalSwipesForScrollingStrategy:(int64_t)a3;
- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4;
- (BOOL)handleEvent:(id)a3;
- (BOOL)wouldHandleButtonEvent:(id)a3;
- (CSHorizontalScrollFailureRecognizer)horizontalFailureGestureRecognizer;
- (CSScrollGestureController)initWithScrollableView:(id)a3;
- (CSScrollGestureControllerDelegate)delegate;
- (NSString)debugDescription;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int64_t)scrollingStrategy;
- (void)_horizontalScrollFailureGestureRecognizerChanged:(id)a3;
- (void)_updateForScrollingStrategy:(int64_t)a3 fromScrollingStrategy:(int64_t)a4;
- (void)dealloc;
- (void)invalidate;
- (void)setDelegate:(id)a3;
- (void)setHorizontalFailureGestureRecognizer:(id)a3;
- (void)setScrollingStrategy:(int64_t)a3;
@end

@implementation CSScrollGestureController

- (CSScrollGestureController)initWithScrollableView:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CSScrollGestureController;
  v6 = [(CSScrollGestureController *)&v15 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_scrollableView, a3);
    uint64_t v8 = [(CSScrollableView *)v7->_scrollableView scrollView];
    scrollView = v7->_scrollView;
    v7->_scrollView = (UIScrollView *)v8;

    uint64_t v10 = [(UIScrollView *)v7->_scrollView panGestureRecognizer];
    scrollViewGestureRecognizer = v7->_scrollViewGestureRecognizer;
    v7->_scrollViewGestureRecognizer = (UIGestureRecognizer *)v10;

    [(UIGestureRecognizer *)v7->_scrollViewGestureRecognizer sbf_setPencilTouchesAllowed:1];
    v12 = [[CSHorizontalScrollFailureRecognizer alloc] initWithTarget:v7 action:sel__horizontalScrollFailureGestureRecognizerChanged_];
    horizontalFailureGestureRecognizer = v7->_horizontalFailureGestureRecognizer;
    v7->_horizontalFailureGestureRecognizer = v12;

    [(CSHorizontalScrollFailureRecognizer *)v7->_horizontalFailureGestureRecognizer setAllowMultiTouch:0];
    [(CSHorizontalScrollFailureRecognizer *)v7->_horizontalFailureGestureRecognizer setDelegate:v7];
    [(CSHorizontalScrollFailureRecognizer *)v7->_horizontalFailureGestureRecognizer sbf_setPencilTouchesAllowed:1];
    [(CSScrollableView *)v7->_scrollableView addGestureRecognizer:v7->_horizontalFailureGestureRecognizer];
  }

  return v7;
}

- (void)dealloc
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained)
  {
    id v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:a2 object:self file:@"CSScrollGestureController.m" lineNumber:62 description:@"ScrollGestureController must be invalidated before it hits dealloc."];
  }
  v6.receiver = self;
  v6.super_class = (Class)CSScrollGestureController;
  [(CSScrollGestureController *)&v6 dealloc];
}

- (void)setScrollingStrategy:(int64_t)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (self->_scrollingStrategy != a3)
  {
    id v5 = SBLogDashBoardScrollGestures();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      objc_super v6 = (objc_class *)objc_opt_class();
      v7 = NSStringFromClass(v6);
      uint64_t v8 = NSStringFromCoverSheetScrollingStrategy(self->_scrollingStrategy);
      v9 = NSStringFromCoverSheetScrollingStrategy(a3);
      int v10 = 138543874;
      v11 = v7;
      __int16 v12 = 2112;
      v13 = v8;
      __int16 v14 = 2112;
      objc_super v15 = v9;
      _os_log_impl(&dword_1D839D000, v5, OS_LOG_TYPE_INFO, "%{public}@: scrolling strategy changed from %@ to %@", (uint8_t *)&v10, 0x20u);
    }
    [(CSScrollGestureController *)self _updateForScrollingStrategy:a3 fromScrollingStrategy:self->_scrollingStrategy];
    self->_scrollingStrategy = a3;
  }
}

- (void)invalidate
{
  [(CSScrollableView *)self->_scrollableView removeGestureRecognizer:self->_horizontalFailureGestureRecognizer];
  [(CSScrollGestureController *)self setDelegate:0];

  [(CSScrollGestureController *)self setScrollingStrategy:1];
}

- (BOOL)handleEvent:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 type];
  if (v5 == 10 || v5 == 6)
  {
    [(CSScrollGestureController *)self setScrollingStrategy:1];
    int v7 = [v4 isConsumable] ^ 1;
  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (BOOL)wouldHandleButtonEvent:(id)a3
{
  return 0;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  return 0;
}

- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4
{
  return 0;
}

- (void)_horizontalScrollFailureGestureRecognizerChanged:(id)a3
{
  id v8 = a3;
  id v4 = [(CSScrollGestureController *)self horizontalFailureGestureRecognizer];

  uint64_t v5 = v8;
  if (v4 == v8)
  {
    BOOL v6 = [v8 state] == 1;
    uint64_t v5 = v8;
    if (v6)
    {
      if ([(UIGestureRecognizer *)self->_scrollViewGestureRecognizer state] == UIGestureRecognizerStateBegan
        || (BOOL v6 = [(UIGestureRecognizer *)self->_scrollViewGestureRecognizer state] == UIGestureRecognizerStateChanged,
            uint64_t v5 = v8,
            v6))
      {
        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        if (objc_opt_respondsToSelector()) {
          [WeakRetained controllerWillCancelHorizontalScrolling:self];
        }
        [(UIScrollView *)self->_scrollView _forcePanGestureToEndImmediately];
        if (objc_opt_respondsToSelector()) {
          [WeakRetained controllerDidCancelHorizontalScrolling:self];
        }

        uint64_t v5 = v8;
      }
    }
  }
}

- (NSString)debugDescription
{
  return (NSString *)[(CSScrollGestureController *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(CSScrollGestureController *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = NSStringFromCoverSheetScrollingStrategy(self->_scrollingStrategy);
  [v3 appendString:v4 withName:@"scrollingStrategy"];

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(CSScrollGestureController *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = [(CSScrollGestureController *)self succinctDescriptionBuilder];
  id v5 = (id)[v4 appendObject:self->_scrollViewGestureRecognizer withName:@"scrollGesture"];
  id v6 = (id)[v4 appendObject:self->_horizontalFailureGestureRecognizer withName:@"horizontalCancelGesture"];

  return v4;
}

- (void)_updateForScrollingStrategy:(int64_t)a3 fromScrollingStrategy:(int64_t)a4
{
  BOOL v7 = -[CSScrollGestureController _shouldFailHorizontalSwipesForScrollingStrategy:](self, "_shouldFailHorizontalSwipesForScrollingStrategy:");
  BOOL v8 = [(CSScrollGestureController *)self _shouldAllowScrollForScrollingStrategy:a4];
  BOOL v9 = [(CSScrollGestureController *)self _shouldAllowScrollForScrollingStrategy:a3];
  int v10 = [(CSScrollGestureController *)self horizontalFailureGestureRecognizer];
  [v10 setEnabled:v7];

  if (v8 != v9)
  {
    scrollView = self->_scrollView;
    [(UIScrollView *)scrollView setScrollEnabled:v9];
  }
}

- (BOOL)_shouldFailHorizontalSwipesForScrollingStrategy:(int64_t)a3
{
  return a3 == 1;
}

- (BOOL)_shouldAllowScrollForScrollingStrategy:(int64_t)a3
{
  return a3 != 3;
}

- (int64_t)scrollingStrategy
{
  return self->_scrollingStrategy;
}

- (CSScrollGestureControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CSScrollGestureControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (CSHorizontalScrollFailureRecognizer)horizontalFailureGestureRecognizer
{
  return self->_horizontalFailureGestureRecognizer;
}

- (void)setHorizontalFailureGestureRecognizer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_horizontalFailureGestureRecognizer, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_scrollViewGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_scrollableView, 0);

  objc_storeStrong((id *)&self->_scrollView, 0);
}

@end