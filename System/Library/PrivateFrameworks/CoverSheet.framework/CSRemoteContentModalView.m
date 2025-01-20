@interface CSRemoteContentModalView
- (CSRemoteContentModalView)initWithFrame:(CGRect)a3;
- (CSRemoteModalContentViewTouchDelegate)touchDelegate;
- (UIButton)backgroundDismissButton;
- (void)setBackgroundDismissButton:(id)a3;
- (void)setTouchDelegate:(id)a3;
@end

@implementation CSRemoteContentModalView

- (CSRemoteContentModalView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v11.receiver = self;
  v11.super_class = (Class)CSRemoteContentModalView;
  v7 = -[CSModalView initWithFrame:](&v11, sel_initWithFrame_);
  if (v7)
  {
    uint64_t v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F427E0]), "initWithFrame:", x, y, width, height);
    backgroundDismissButton = v7->_backgroundDismissButton;
    v7->_backgroundDismissButton = (UIButton *)v8;

    [(CSRemoteContentModalView *)v7 addSubview:v7->_backgroundDismissButton];
    [(CSRemoteContentModalView *)v7 sendSubviewToBack:v7->_backgroundDismissButton];
  }
  return v7;
}

- (void)setTouchDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_touchDelegate);
  if (WeakRetained != obj)
  {
    if (WeakRetained) {
      [(UIButton *)self->_backgroundDismissButton removeTarget:WeakRetained action:sel_didReceiveTouch forControlEvents:64];
    }
    objc_storeWeak((id *)&self->_touchDelegate, obj);
    [(UIButton *)self->_backgroundDismissButton addTarget:obj action:sel_didReceiveTouch forControlEvents:64];
  }
}

- (CSRemoteModalContentViewTouchDelegate)touchDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_touchDelegate);

  return (CSRemoteModalContentViewTouchDelegate *)WeakRetained;
}

- (UIButton)backgroundDismissButton
{
  return self->_backgroundDismissButton;
}

- (void)setBackgroundDismissButton:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundDismissButton, 0);

  objc_destroyWeak((id *)&self->_touchDelegate);
}

@end