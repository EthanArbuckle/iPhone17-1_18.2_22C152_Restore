@interface NCSizeObservingView
- (NCSizeObservingViewDelegate)delegate;
- (void)setBounds:(CGRect)a3;
- (void)setDelegate:(id)a3;
- (void)setFrame:(CGRect)a3;
@end

@implementation NCSizeObservingView

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    self->_delegateInterestedInSizeChanges = objc_opt_respondsToSelector() & 1;
  }
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(NCSizeObservingView *)self bounds];
  double v9 = v8;
  double v11 = v10;
  v16.receiver = self;
  v16.super_class = (Class)NCSizeObservingView;
  -[NCSizeObservingView setBounds:](&v16, sel_setBounds_, x, y, width, height);
  if (self->_delegateInterestedInSizeChanges)
  {
    [(NCSizeObservingView *)self bounds];
    if (v9 != v13 || v11 != v12)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "sizeObservingView:didChangeSize:", self, v9, v11);
    }
  }
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(NCSizeObservingView *)self bounds];
  double v9 = v8;
  double v11 = v10;
  v16.receiver = self;
  v16.super_class = (Class)NCSizeObservingView;
  -[NCSizeObservingView setFrame:](&v16, sel_setFrame_, x, y, width, height);
  if (self->_delegateInterestedInSizeChanges)
  {
    [(NCSizeObservingView *)self bounds];
    if (v9 != v13 || v11 != v12)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "sizeObservingView:didChangeSize:", self, v9, v11);
    }
  }
}

- (NCSizeObservingViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NCSizeObservingViewDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
}

@end