@interface _UIDocumentPickerContainerViewHuggingTableView
- (UIView)ancestralContainerView;
- (void)setAncestralContainerView:(id)a3;
- (void)setFrame:(CGRect)a3;
- (void)willMoveToSuperview:(id)a3;
@end

@implementation _UIDocumentPickerContainerViewHuggingTableView

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8 = [(_UIDocumentPickerContainerViewHuggingTableView *)self superview];

  if (v8)
  {
    v9 = [(_UIDocumentPickerContainerViewHuggingTableView *)self superview];
    [v9 bounds];
    double x = v10;
    double y = v11;
    double width = v12;
    double height = v13;
  }
  v14.receiver = self;
  v14.super_class = (Class)_UIDocumentPickerContainerViewHuggingTableView;
  -[_UIDocumentPickerContainerViewHuggingTableView setFrame:](&v14, sel_setFrame_, x, y, width, height);
}

- (void)willMoveToSuperview:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_ancestralContainerView);

  if (WeakRetained)
  {
    id v6 = v4;
    if (v6)
    {
      v7 = v6;
      id v8 = v6;
      while (1)
      {
        id v9 = objc_loadWeakRetained((id *)&self->_ancestralContainerView);

        if (v8 == v9) {
          break;
        }
        uint64_t v10 = [v8 superview];

        id v8 = (id)v10;
        if (!v10) {
          goto LABEL_11;
        }
      }
      id v11 = v7;

      do
      {
        id v12 = objc_loadWeakRetained((id *)&self->_ancestralContainerView);

        if (v11 == v12) {
          break;
        }
        [v11 setAutoresizingMask:18];
        uint64_t v13 = [v11 superview];

        id v11 = (id)v13;
      }
      while (v13);
    }
  }
LABEL_11:
  v14.receiver = self;
  v14.super_class = (Class)_UIDocumentPickerContainerViewHuggingTableView;
  [(_UIDocumentPickerContainerViewHuggingTableView *)&v14 willMoveToSuperview:v4];
}

- (UIView)ancestralContainerView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_ancestralContainerView);

  return (UIView *)WeakRetained;
}

- (void)setAncestralContainerView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end