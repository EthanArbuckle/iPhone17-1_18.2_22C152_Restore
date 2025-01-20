@interface CNUINavigationListView
+ (BOOL)disableHeaderAccessibilityElements;
- (BOOL)location:(CGPoint)a3 isInAccessoryControlTouchArea:(id)a4;
- (CGPoint)gestureStartLocation;
- (CGPoint)gestureStartLocationInWindow;
- (CNUINavigationListView)initWithFrame:(CGRect)a3 style:(int64_t)a4;
- (CNUINavigationListViewDataSource)navigationListViewDataSource;
- (CNUINavigationListViewDelegate)navigationListViewDelegate;
- (NSIndexPath)trackedElementIndexPath;
- (UIGestureRecognizer)additionalSelectionGestureRecognizer;
- (UIGestureRecognizer)pressGestureRecognizer;
- (UILongPressGestureRecognizer)selectionGestureRecognizer;
- (UISelectionFeedbackGenerator)retargetBehavior;
- (_CNUINavigationListViewPermissiveGestureRecognizerDelegate)selectionGestureRecognizerDelegate;
- (id)dequeueDetailNavigationListViewCell;
- (id)dequeueNavigationListViewCell;
- (id)disclosureNavigationListViewCellForRowAtIndexPath:(id)a3;
- (id)elementAtLocation:(CGPoint)a3;
- (void)clearAdditionalSelectionGestureRecognizer;
- (void)handlePanGestureRecognizerUpdate:(id)a3;
- (void)handlePressSelection;
- (void)handleSelectionGestureRecognizerUpdate:(id)a3;
- (void)notifyDelegateWithSelectionEventAtIndexPath:(id)a3;
- (void)notifyDelegateWithSelectionEventAtPoint:(CGPoint)a3 trackedElementIndexPath:(id)a4;
- (void)setAdditionalSelectionGestureRecognizer:(id)a3;
- (void)setGestureStartLocation:(CGPoint)a3;
- (void)setGestureStartLocationInWindow:(CGPoint)a3;
- (void)setNavigationListViewDataSource:(id)a3;
- (void)setNavigationListViewDelegate:(id)a3;
- (void)setPressGestureRecognizer:(id)a3;
- (void)setRetargetBehavior:(id)a3;
- (void)setSelectionGestureRecognizer:(id)a3;
- (void)setSelectionGestureRecognizerDelegate:(id)a3;
- (void)setTrackedElementIndexPath:(id)a3;
- (void)startTrackingElementAtIndexPath:(id)a3;
- (void)startTrackingSelectionFromGestureRecognizer:(id)a3;
- (void)stopTrackingElementAtIndexPath:(id)a3;
- (void)updateCellAccessoryControlState:(id)a3 withTrackedLocation:(CGPoint)a4;
- (void)willMoveToWindow:(id)a3;
@end

@implementation CNUINavigationListView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectionGestureRecognizerDelegate, 0);
  objc_storeStrong((id *)&self->_retargetBehavior, 0);
  objc_storeStrong((id *)&self->_trackedElementIndexPath, 0);
  objc_storeStrong((id *)&self->_pressGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_additionalSelectionGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_selectionGestureRecognizer, 0);
  objc_destroyWeak((id *)&self->_navigationListViewDelegate);

  objc_destroyWeak((id *)&self->_navigationListViewDataSource);
}

- (void)setSelectionGestureRecognizerDelegate:(id)a3
{
}

- (_CNUINavigationListViewPermissiveGestureRecognizerDelegate)selectionGestureRecognizerDelegate
{
  return self->_selectionGestureRecognizerDelegate;
}

- (void)setRetargetBehavior:(id)a3
{
}

- (UISelectionFeedbackGenerator)retargetBehavior
{
  return self->_retargetBehavior;
}

- (void)setGestureStartLocationInWindow:(CGPoint)a3
{
  self->_gestureStartLocationInWindow = a3;
}

- (CGPoint)gestureStartLocationInWindow
{
  double x = self->_gestureStartLocationInWindow.x;
  double y = self->_gestureStartLocationInWindow.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setGestureStartLocation:(CGPoint)a3
{
  self->_gestureStartLocation = a3;
}

- (CGPoint)gestureStartLocation
{
  double x = self->_gestureStartLocation.x;
  double y = self->_gestureStartLocation.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setTrackedElementIndexPath:(id)a3
{
}

- (NSIndexPath)trackedElementIndexPath
{
  return self->_trackedElementIndexPath;
}

- (void)setPressGestureRecognizer:(id)a3
{
}

- (UIGestureRecognizer)pressGestureRecognizer
{
  return self->_pressGestureRecognizer;
}

- (void)setAdditionalSelectionGestureRecognizer:(id)a3
{
}

- (UIGestureRecognizer)additionalSelectionGestureRecognizer
{
  return self->_additionalSelectionGestureRecognizer;
}

- (void)setSelectionGestureRecognizer:(id)a3
{
}

- (UILongPressGestureRecognizer)selectionGestureRecognizer
{
  return self->_selectionGestureRecognizer;
}

- (void)setNavigationListViewDelegate:(id)a3
{
}

- (CNUINavigationListViewDelegate)navigationListViewDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_navigationListViewDelegate);

  return (CNUINavigationListViewDelegate *)WeakRetained;
}

- (void)setNavigationListViewDataSource:(id)a3
{
}

- (CNUINavigationListViewDataSource)navigationListViewDataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_navigationListViewDataSource);

  return (CNUINavigationListViewDataSource *)WeakRetained;
}

- (void)clearAdditionalSelectionGestureRecognizer
{
  v3 = [(CNUINavigationListView *)self additionalSelectionGestureRecognizer];
  [v3 removeTarget:self action:0];

  [(CNUINavigationListView *)self setAdditionalSelectionGestureRecognizer:0];
}

- (void)startTrackingSelectionFromGestureRecognizer:(id)a3
{
  id v5 = a3;
  [(CNUINavigationListView *)self clearAdditionalSelectionGestureRecognizer];
  [(CNUINavigationListView *)self setAdditionalSelectionGestureRecognizer:v5];
  v4 = [(CNUINavigationListView *)self additionalSelectionGestureRecognizer];
  [v4 addTarget:self action:sel_handleSelectionGestureRecognizerUpdate_];

  [(CNUINavigationListView *)self handleSelectionGestureRecognizerUpdate:v5];
}

- (void)notifyDelegateWithSelectionEventAtIndexPath:(id)a3
{
  id v7 = a3;
  v4 = [(CNUINavigationListView *)self navigationListViewDelegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    v6 = [(CNUINavigationListView *)self navigationListViewDelegate];
    [v6 navigationListView:self didSelectRowAtIndexPath:v7];
  }
}

- (void)notifyDelegateWithSelectionEventAtPoint:(CGPoint)a3 trackedElementIndexPath:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v17 = a4;
  id v7 = -[CNUINavigationListView disclosureNavigationListViewCellForRowAtIndexPath:](self, "disclosureNavigationListViewCellForRowAtIndexPath:");
  if (v7
    && -[CNUINavigationListView location:isInAccessoryControlTouchArea:](self, "location:isInAccessoryControlTouchArea:", v7, x, y))
  {
    v8 = [(CNUINavigationListView *)self navigationListViewDelegate];
    char v9 = objc_opt_respondsToSelector();

    if ((v9 & 1) == 0) {
      goto LABEL_10;
    }
    v10 = [(CNUINavigationListView *)self navigationListViewDelegate];
    [v10 navigationListView:self accessoryButtonTappedForRowWithIndexPath:v17];
  }
  else
  {
    v11 = [(CNUINavigationListView *)self navigationListViewDelegate];
    char v12 = objc_opt_respondsToSelector();

    if (v12)
    {
      v13 = [(CNUINavigationListView *)self navigationListViewDelegate];
      int v14 = [v13 navigationListView:self shouldSelectRowAtIndexPath:v17];

      if (!v14) {
        goto LABEL_10;
      }
    }
    v15 = [(CNUINavigationListView *)self navigationListViewDelegate];
    char v16 = objc_opt_respondsToSelector();

    if ((v16 & 1) == 0) {
      goto LABEL_10;
    }
    v10 = [(CNUINavigationListView *)self navigationListViewDelegate];
    [v10 navigationListView:self didSelectRowAtIndexPath:v17];
  }

LABEL_10:
}

- (void)updateCellAccessoryControlState:(id)a3 withTrackedLocation:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v7 = a3;
  BOOL v8 = -[CNUINavigationListView location:isInAccessoryControlTouchArea:](self, "location:isInAccessoryControlTouchArea:", v7, x, y);
  id v9 = [v7 accessoryImageView];

  [v9 setHighlighted:v8];
}

- (BOOL)location:(CGPoint)a3 isInAccessoryControlTouchArea:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  BOOL v8 = [v7 accessoryImageView];
  char v9 = [v8 isHidden];

  if (v9)
  {
    BOOL v10 = 0;
  }
  else
  {
    objc_msgSend(v7, "convertPoint:fromView:", self, x, y);
    CGFloat v12 = v11;
    CGFloat v14 = v13;
    v15 = [v7 accessoryImageView];
    [v15 frame];

    UIRectGetCenter();
    UIRectCenteredAboutPoint();
    v17.double x = v12;
    v17.double y = v14;
    BOOL v10 = CGRectContainsPoint(v18, v17);
  }

  return v10;
}

- (void)startTrackingElementAtIndexPath:(id)a3
{
  id v14 = a3;
  v4 = [(CNUINavigationListView *)self trackedElementIndexPath];

  if (v4)
  {
    char v5 = [(CNUINavigationListView *)self trackedElementIndexPath];
    [(CNUINavigationListView *)self stopTrackingElementAtIndexPath:v5];
  }
  [(CNUINavigationListView *)self setTrackedElementIndexPath:v14];
  v6 = [(CNUINavigationListView *)self navigationListViewDelegate];
  char v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) == 0
    || ([(CNUINavigationListView *)self navigationListViewDelegate],
        BOOL v8 = objc_claimAutoreleasedReturnValue(),
        int v9 = [v8 navigationListView:self shouldHighlightRowAtIndexPath:v14],
        v8,
        v9))
  {
    BOOL v10 = [(CNUINavigationListView *)self disclosureNavigationListViewCellForRowAtIndexPath:v14];
    double v11 = v10;
    if (v10)
    {
      [v10 setHighlighted:1 animated:0];
      if (!v4)
      {
LABEL_8:

        goto LABEL_9;
      }
    }
    else
    {
      double v13 = [(CNUINavigationListView *)self cellForRowAtIndexPath:v14];
      [v13 setHighlighted:1 animated:0];

      if (!v4) {
        goto LABEL_8;
      }
    }
    CGFloat v12 = [(CNUINavigationListView *)self retargetBehavior];
    [v12 selectionChanged];

    goto LABEL_8;
  }
LABEL_9:
}

- (void)stopTrackingElementAtIndexPath:(id)a3
{
  id v7 = a3;
  v4 = -[CNUINavigationListView disclosureNavigationListViewCellForRowAtIndexPath:](self, "disclosureNavigationListViewCellForRowAtIndexPath:");
  char v5 = v4;
  if (v4)
  {
    [v4 setHighlighted:0 animated:0];
    v6 = [v5 accessoryImageView];
    [v6 setHighlighted:0];
  }
  else
  {
    v6 = [(CNUINavigationListView *)self cellForRowAtIndexPath:v7];
    [v6 setHighlighted:0 animated:0];
  }

  [(CNUINavigationListView *)self setTrackedElementIndexPath:0];
}

- (void)handlePanGestureRecognizerUpdate:(id)a3
{
  id v6 = a3;
  v4 = [(CNUINavigationListView *)self selectionGestureRecognizer];
  BOOL v5 = ![v6 state]
    || [v6 state] == 4
    || [v6 state] == 5
    || [v6 state] == 3;
  [v4 setEnabled:v5];
}

- (void)handlePressSelection
{
  v3 = [(CNUINavigationListView *)self visibleCells];
  v4 = objc_msgSend(v3, "_cn_filter:", &__block_literal_global_20196);
  id v6 = [v4 firstObject];

  BOOL v5 = [(CNUINavigationListView *)self indexPathForCell:v6];
  [(CNUINavigationListView *)self notifyDelegateWithSelectionEventAtIndexPath:v5];
}

uint64_t __46__CNUINavigationListView_handlePressSelection__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isFocused];
}

- (void)handleSelectionGestureRecognizerUpdate:(id)a3
{
  id v31 = a3;
  [v31 locationInView:self];
  double v5 = v4;
  double v7 = v6;
  BOOL v8 = [(CNUINavigationListView *)self window];
  [v31 locationInView:v8];
  double v10 = v9;
  double v12 = v11;

  double v13 = -[CNUINavigationListView elementAtLocation:](self, "elementAtLocation:", v5, v7);
  BOOL v14 = [v31 state] != 1 && objc_msgSend(v31, "state") != 2;
  BOOL v15 = [v31 state] == 3 || objc_msgSend(v31, "state") == 4;
  uint64_t v16 = [v31 state];
  if ([v31 state] == 1)
  {
    -[CNUINavigationListView setGestureStartLocation:](self, "setGestureStartLocation:", v5, v7);
    -[CNUINavigationListView setGestureStartLocationInWindow:](self, "setGestureStartLocationInWindow:", v10, v12);
  }
  if (v13) {
    char v17 = v14;
  }
  else {
    char v17 = 1;
  }
  if (v17)
  {
    if (v13) {
      int v18 = v15;
    }
    else {
      int v18 = 1;
    }
    if (v18 == 1)
    {
      v19 = [(CNUINavigationListView *)self trackedElementIndexPath];
      [(CNUINavigationListView *)self stopTrackingElementAtIndexPath:v19];

      if (v15)
      {
        id v20 = [(CNUINavigationListView *)self additionalSelectionGestureRecognizer];

        if (v20 == v31) {
          [(CNUINavigationListView *)self clearAdditionalSelectionGestureRecognizer];
        }
        if (v13 && v16 == 3)
        {
          -[CNUINavigationListView notifyDelegateWithSelectionEventAtPoint:trackedElementIndexPath:](self, "notifyDelegateWithSelectionEventAtPoint:trackedElementIndexPath:", v13, v5, v7);
        }
        else
        {
          id v30 = [(CNUINavigationListView *)self pressGestureRecognizer];

          if (v30 == v31 && v16 == 3) {
            [(CNUINavigationListView *)self handlePressSelection];
          }
        }
      }
    }
  }
  else
  {
    [(CNUINavigationListView *)self gestureStartLocationInWindow];
    double v22 = v21 - v12;
    [(CNUINavigationListView *)self gestureStartLocation];
    if (v22 == v23 - v7)
    {
      v26 = [(CNUINavigationListView *)self trackedElementIndexPath];
      char v27 = [v13 isEqual:v26];

      if ((v27 & 1) == 0) {
        [(CNUINavigationListView *)self startTrackingElementAtIndexPath:v13];
      }
      v28 = [(CNUINavigationListView *)self trackedElementIndexPath];
      v29 = [(CNUINavigationListView *)self disclosureNavigationListViewCellForRowAtIndexPath:v28];

      if (v29) {
        -[CNUINavigationListView updateCellAccessoryControlState:withTrackedLocation:](self, "updateCellAccessoryControlState:withTrackedLocation:", v29, v5, v7);
      }
    }
    else
    {
      v24 = [(CNUINavigationListView *)self selectionGestureRecognizer];
      [v24 setEnabled:0];

      v25 = [(CNUINavigationListView *)self selectionGestureRecognizer];
      [v25 setEnabled:1];
    }
  }
}

- (void)willMoveToWindow:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CNUINavigationListView;
  -[CNUINavigationListView willMoveToWindow:](&v7, sel_willMoveToWindow_);
  double v5 = [(CNUINavigationListView *)self retargetBehavior];
  double v6 = v5;
  if (a3) {
    [v5 activateWithCompletionBlock:0];
  }
  else {
    [v5 deactivate];
  }
}

- (id)elementAtLocation:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(CNUINavigationListView *)self bounds];
  v9.double x = x;
  v9.double y = y;
  if (CGRectContainsPoint(v10, v9))
  {
    double v6 = -[CNUINavigationListView indexPathForRowAtPoint:](self, "indexPathForRowAtPoint:", x, y);
  }
  else
  {
    double v6 = 0;
  }

  return v6;
}

- (id)disclosureNavigationListViewCellForRowAtIndexPath:(id)a3
{
  v3 = [(CNUINavigationListView *)self cellForRowAtIndexPath:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    id v4 = v3;
    if (objc_opt_isKindOfClass()) {
      double v5 = v4;
    }
    else {
      double v5 = 0;
    }
    id v6 = v5;
  }
  else
  {
    id v6 = 0;
  }
  objc_super v7 = [v6 accessoryImageView];
  if ([v7 isHidden]) {
    BOOL v8 = 0;
  }
  else {
    BOOL v8 = v6;
  }
  id v9 = v8;

  return v9;
}

- (id)dequeueDetailNavigationListViewCell
{
  v3 = +[CNUINavigationListViewDetailCell reuseIdentifier];
  id v4 = [(CNUINavigationListView *)self dequeueReusableCellWithIdentifier:v3];

  return v4;
}

- (id)dequeueNavigationListViewCell
{
  v3 = +[CNUINavigationListViewCell reuseIdentifier];
  id v4 = [(CNUINavigationListView *)self dequeueReusableCellWithIdentifier:v3];

  return v4;
}

- (CNUINavigationListView)initWithFrame:(CGRect)a3 style:(int64_t)a4
{
  v22.receiver = self;
  v22.super_class = (Class)CNUINavigationListView;
  id v4 = -[CNUINavigationListView initWithFrame:style:](&v22, sel_initWithFrame_style_, a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v4)
  {
    uint64_t v5 = [objc_alloc(MEMORY[0x1E4FB1968]) initWithTarget:v4 action:sel_handleSelectionGestureRecognizerUpdate_];
    selectionGestureRecognizer = v4->_selectionGestureRecognizer;
    v4->_selectionGestureRecognizer = (UILongPressGestureRecognizer *)v5;

    [(UILongPressGestureRecognizer *)v4->_selectionGestureRecognizer setMinimumPressDuration:0.0];
    objc_super v7 = objc_alloc_init(_CNUINavigationListViewPermissiveGestureRecognizerDelegate);
    selectionGestureRecognizerDelegate = v4->_selectionGestureRecognizerDelegate;
    v4->_selectionGestureRecognizerDelegate = v7;

    [(UILongPressGestureRecognizer *)v4->_selectionGestureRecognizer setDelegate:v4->_selectionGestureRecognizerDelegate];
    [(CNUINavigationListView *)v4 addGestureRecognizer:v4->_selectionGestureRecognizer];
    uint64_t v9 = objc_opt_class();
    CGRect v10 = +[CNUINavigationListViewCell reuseIdentifier];
    [(CNUINavigationListView *)v4 registerClass:v9 forCellReuseIdentifier:v10];

    uint64_t v11 = objc_opt_class();
    double v12 = +[CNUINavigationListViewDetailCell reuseIdentifier];
    [(CNUINavigationListView *)v4 registerClass:v11 forCellReuseIdentifier:v12];

    double v13 = [MEMORY[0x1E4FB2290] defaultConfiguration];
    uint64_t v14 = [objc_alloc(MEMORY[0x1E4FB1C18]) initWithConfiguration:v13 coordinateSpace:v4];
    retargetBehavior = v4->_retargetBehavior;
    v4->_retargetBehavior = (UISelectionFeedbackGenerator *)v14;

    [(CNUINavigationListView *)v4 setAlwaysBounceVertical:0];
    uint64_t v16 = [(CNUINavigationListView *)v4 panGestureRecognizer];
    [v16 addTarget:v4 action:sel_handlePanGestureRecognizerUpdate_];

    char v17 = (void *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:v4 action:sel_handleSelectionGestureRecognizerUpdate_];
    [(CNUINavigationListView *)v4 setPressGestureRecognizer:v17];

    int v18 = [(CNUINavigationListView *)v4 pressGestureRecognizer];
    [v18 setAllowedTouchTypes:MEMORY[0x1E4F1CBF0]];

    v19 = [(CNUINavigationListView *)v4 pressGestureRecognizer];
    [v19 setAllowedPressTypes:&unk_1ED915A88];

    id v20 = [(CNUINavigationListView *)v4 pressGestureRecognizer];
    [(CNUINavigationListView *)v4 addGestureRecognizer:v20];
  }
  return v4;
}

+ (BOOL)disableHeaderAccessibilityElements
{
  return 0;
}

@end