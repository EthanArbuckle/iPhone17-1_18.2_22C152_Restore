@interface AVTNotifyingContainerView
- (AVTNotifyingContainerViewDelegate)delegate;
- (void)setBounds:(CGRect)a3;
- (void)setDelegate:(id)a3;
- (void)setFrame:(CGRect)a3;
@end

@implementation AVTNotifyingContainerView

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(AVTNotifyingContainerView *)self frame];
  if (width == v9 && height == v8)
  {
    v13.receiver = self;
    v13.super_class = (Class)AVTNotifyingContainerView;
    -[AVTNotifyingContainerView setFrame:](&v13, sel_setFrame_, x, y, width, height);
  }
  else
  {
    v11 = [(AVTNotifyingContainerView *)self delegate];
    objc_msgSend(v11, "notifyingContainerViewWillChangeSize:", width, height);

    v13.receiver = self;
    v13.super_class = (Class)AVTNotifyingContainerView;
    -[AVTNotifyingContainerView setFrame:](&v13, sel_setFrame_, x, y, width, height);
    v12 = [(AVTNotifyingContainerView *)self delegate];
    objc_msgSend(v12, "notifyingContainerViewDidChangeSize:", width, height);
  }
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(AVTNotifyingContainerView *)self bounds];
  if (width == v9 && height == v8)
  {
    v13.receiver = self;
    v13.super_class = (Class)AVTNotifyingContainerView;
    -[AVTNotifyingContainerView setBounds:](&v13, sel_setBounds_, x, y, width, height);
  }
  else
  {
    v11 = [(AVTNotifyingContainerView *)self delegate];
    objc_msgSend(v11, "notifyingContainerViewWillChangeSize:", width, height);

    v13.receiver = self;
    v13.super_class = (Class)AVTNotifyingContainerView;
    -[AVTNotifyingContainerView setBounds:](&v13, sel_setBounds_, x, y, width, height);
    v12 = [(AVTNotifyingContainerView *)self delegate];
    objc_msgSend(v12, "notifyingContainerViewDidChangeSize:", width, height);
  }
}

- (AVTNotifyingContainerViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (AVTNotifyingContainerViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end