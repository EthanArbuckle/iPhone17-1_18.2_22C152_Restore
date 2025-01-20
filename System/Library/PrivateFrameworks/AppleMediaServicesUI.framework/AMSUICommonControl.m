@interface AMSUICommonControl
- (AMSUICommonControl)init;
- (AMSUICommonControl)initWithCoder:(id)a3;
- (AMSUICommonControl)initWithFrame:(CGRect)a3;
- (BOOL)isTrackingMouse;
- (void)_setup;
- (void)setTrackingMouse:(BOOL)a3;
@end

@implementation AMSUICommonControl

- (AMSUICommonControl)init
{
  return -[AMSUICommonControl initWithFrame:](self, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
}

- (AMSUICommonControl)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)AMSUICommonControl;
  v3 = [(AMSUICommonControl *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(AMSUICommonControl *)v3 _setup];
  }
  return v4;
}

- (AMSUICommonControl)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)AMSUICommonControl;
  v3 = -[AMSUICommonControl initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(AMSUICommonControl *)v3 _setup];
  }
  return v4;
}

- (void)_setup
{
}

- (BOOL)isTrackingMouse
{
  return self->_trackingMouse;
}

- (void)setTrackingMouse:(BOOL)a3
{
  self->_trackingMouse = a3;
}

@end