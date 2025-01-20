@interface SKObservableView
- (SKObservableViewDelegate)delegate;
- (void)setAlpha:(double)a3;
- (void)setDelegate:(id)a3;
- (void)setHidden:(BOOL)a3;
@end

@implementation SKObservableView

- (void)setAlpha:(double)a3
{
  v10.receiver = self;
  v10.super_class = (Class)SKObservableView;
  -[SKObservableView setAlpha:](&v10, sel_setAlpha_);
  uint64_t v5 = [(SKObservableView *)self delegate];
  if (v5)
  {
    v6 = (void *)v5;
    v7 = [(SKObservableView *)self delegate];
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      v9 = [(SKObservableView *)self delegate];
      [v9 didChangeAlpha:a3];
    }
  }
}

- (void)setHidden:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SKObservableView;
  [(SKObservableView *)&v9 setHidden:a3];
  uint64_t v4 = [(SKObservableView *)self delegate];
  if (v4)
  {
    uint64_t v5 = (void *)v4;
    v6 = [(SKObservableView *)self delegate];
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      char v8 = [(SKObservableView *)self delegate];
      [v8 didChangeHidden];
    }
  }
}

- (SKObservableViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SKObservableViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end