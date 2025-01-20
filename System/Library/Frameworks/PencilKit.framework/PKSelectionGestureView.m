@interface PKSelectionGestureView
- (PKSelectionController)selectionController;
- (PKSelectionGestureView)initWithFrame:(CGRect)a3 selectionController:(id)a4;
- (PKSelectionInteraction)selectionInteraction;
- (void)didMoveToWindow;
- (void)setSelectionController:(id)a3;
- (void)setSelectionInteraction:(id)a3;
@end

@implementation PKSelectionGestureView

- (PKSelectionInteraction)selectionInteraction
{
  return self->_selectionInteraction;
}

- (PKSelectionGestureView)initWithFrame:(CGRect)a3 selectionController:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  v15.receiver = self;
  v15.super_class = (Class)PKSelectionGestureView;
  v10 = -[PKSelectionGestureView initWithFrame:](&v15, sel_initWithFrame_, x, y, width, height);
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_selectionController, v9);
    v12 = [[PKSelectionInteraction alloc] initWithSelectionController:v9];
    selectionInteraction = v11->_selectionInteraction;
    v11->_selectionInteraction = v12;

    [(PKSelectionGestureView *)v11 addInteraction:v11->_selectionInteraction];
  }

  return v11;
}

- (void)didMoveToWindow
{
  v3 = [(PKSelectionGestureView *)self window];

  if (v3)
  {
    id v8 = [(PKSelectionGestureView *)self selectionInteraction];
    WeakRetained = (id *)objc_loadWeakRetained((id *)&self->_selectionController);
    v5 = WeakRetained;
    if (WeakRetained) {
      id v6 = objc_loadWeakRetained(WeakRetained + 15);
    }
    else {
      id v6 = 0;
    }
    v7 = [v6 ink];
    [v8 _updateAllowedTouchTypesForSelectedInk:v7];
  }
}

- (void)setSelectionInteraction:(id)a3
{
}

- (PKSelectionController)selectionController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_selectionController);

  return (PKSelectionController *)WeakRetained;
}

- (void)setSelectionController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_selectionController);

  objc_storeStrong((id *)&self->_selectionInteraction, 0);
}

@end