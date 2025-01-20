@interface AMSUICommonImageView
- (AMSUICommonImageView)init;
- (AMSUICommonImageView)initWithCoder:(id)a3;
- (AMSUICommonImageView)initWithFrame:(CGRect)a3;
@end

@implementation AMSUICommonImageView

- (AMSUICommonImageView)init
{
  return -[AMSUICommonImageView initWithFrame:](self, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
}

- (AMSUICommonImageView)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)AMSUICommonImageView;
  v3 = [(AMSUICommonImageView *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(AMSUICommonImageView *)v3 _setup];
  }
  return v4;
}

- (AMSUICommonImageView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)AMSUICommonImageView;
  v3 = -[AMSUICommonImageView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(AMSUICommonImageView *)v3 _setup];
  }
  return v4;
}

@end