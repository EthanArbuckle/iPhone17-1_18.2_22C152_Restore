@interface CAMBarsAccessibilityHUDManager
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (CAMBarsAccessibilityHUDManager)initWithView:(id)a3 delegate:(id)a4 cancelsTouchesInView:(BOOL)a5;
- (CAMBarsAccessibilityHUDManagerDelegate)delegate;
- (CAMBarsAccessibilityHUDManagerGestureProvider)view;
- (CGPoint)locationOfAccessibilityGestureInView:(id)a3;
- (UILongPressGestureRecognizer)_accessibilityLongPressGestureRecognizer;
- (void)_handleAccessibilityLongPressGesture:(id)a3;
- (void)_setAccessibilityLongPressGestureRecognizer:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setView:(id)a3;
@end

@implementation CAMBarsAccessibilityHUDManager

- (CAMBarsAccessibilityHUDManager)initWithView:(id)a3 delegate:(id)a4 cancelsTouchesInView:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  v15.receiver = self;
  v15.super_class = (Class)CAMBarsAccessibilityHUDManager;
  v10 = [(CAMBarsAccessibilityHUDManager *)&v15 init];
  v11 = v10;
  if (v10)
  {
    [(CAMBarsAccessibilityHUDManager *)v10 setDelegate:v9];
    [(CAMBarsAccessibilityHUDManager *)v11 setView:v8];
    v12 = (void *)[objc_alloc(MEMORY[0x263F82938]) initWithTarget:v11 action:sel__handleAccessibilityLongPressGesture_];
    [v12 setMinimumPressDuration:0.15];
    [v12 setDelegate:v11];
    [v12 setCancelsTouchesInView:v5];
    [(CAMBarsAccessibilityHUDManager *)v11 _setAccessibilityLongPressGestureRecognizer:v12];
    v13 = [(CAMBarsAccessibilityHUDManager *)v11 view];
    [v13 addGestureRecognizer:v12];
  }
  return v11;
}

- (CGPoint)locationOfAccessibilityGestureInView:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CAMBarsAccessibilityHUDManager *)self _accessibilityLongPressGestureRecognizer];
  [v5 locationInView:v4];
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.y = v11;
  result.x = v10;
  return result;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v5 = a3;
  double v6 = [(CAMBarsAccessibilityHUDManager *)self _accessibilityLongPressGestureRecognizer];
  char v7 = [v5 isEqual:v6];

  return v7;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = [(CAMBarsAccessibilityHUDManager *)self view];
  id v5 = [v4 traitCollection];
  double v6 = [v5 preferredContentSizeCategory];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v6);

  if (!IsAccessibilityCategory) {
    return 0;
  }
  double v8 = [(CAMBarsAccessibilityHUDManager *)self view];
  char v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) == 0) {
    return 1;
  }
  double v10 = [(CAMBarsAccessibilityHUDManager *)self view];
  char v11 = [v10 shouldAccessibilityGestureBeginForHUDManager:self];

  return v11;
}

- (void)_handleAccessibilityLongPressGesture:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  uint64_t v4 = [a3 state];
  switch(v4)
  {
    case 3:
      v17 = [(CAMBarsAccessibilityHUDManager *)self delegate];
      [v17 dismissAccessibilityHUDViewForAccessibilityHUDManager:self];

      id v18 = [(CAMBarsAccessibilityHUDManager *)self view];
      [v18 selectedByAccessibilityHUDManager:self];
      break;
    case 2:
LABEL_12:
      v13 = [(CAMBarsAccessibilityHUDManager *)self view];
      v14 = [v13 hudItemForAccessibilityHUDManager:self];

      objc_super v15 = [(CAMBarsAccessibilityHUDManager *)self delegate];
      v16 = v15;
      if (v14) {
        [v15 accessibilityHUDManager:self wantsToShowHUDItem:v14];
      }
      else {
        [v15 dismissAccessibilityHUDViewForAccessibilityHUDManager:self];
      }

      return;
    case 1:
      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      id v5 = [(CAMBarsAccessibilityHUDManager *)self view];
      double v6 = [v5 touchingRecognizersToCancel];

      uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v20;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v20 != v9) {
              objc_enumerationMutation(v6);
            }
            char v11 = *(void **)(*((void *)&v19 + 1) + 8 * i);
            uint64_t v12 = [v11 isEnabled];
            [v11 setEnabled:0];
            [v11 setEnabled:v12];
          }
          uint64_t v8 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
        }
        while (v8);
      }

      goto LABEL_12;
    default:
      id v18 = [(CAMBarsAccessibilityHUDManager *)self delegate];
      [v18 dismissAccessibilityHUDViewForAccessibilityHUDManager:self];
      break;
  }
}

- (CAMBarsAccessibilityHUDManagerGestureProvider)view
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  return (CAMBarsAccessibilityHUDManagerGestureProvider *)WeakRetained;
}

- (void)setView:(id)a3
{
}

- (CAMBarsAccessibilityHUDManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CAMBarsAccessibilityHUDManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UILongPressGestureRecognizer)_accessibilityLongPressGestureRecognizer
{
  return self->__accessibilityLongPressGestureRecognizer;
}

- (void)_setAccessibilityLongPressGestureRecognizer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__accessibilityLongPressGestureRecognizer, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_view);
}

@end