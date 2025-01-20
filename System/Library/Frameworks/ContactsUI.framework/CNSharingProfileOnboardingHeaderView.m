@interface CNSharingProfileOnboardingHeaderView
+ (id)reuseIdentifier;
- (CNSharingProfileOnboardingHeaderView)initWithTitle:(id)a3;
- (OBHeaderView)headerView;
- (id)reuseIdentifier;
- (void)setHeaderView:(id)a3;
@end

@implementation CNSharingProfileOnboardingHeaderView

- (void).cxx_destruct
{
}

- (OBHeaderView)headerView
{
  return self->_headerView;
}

- (id)reuseIdentifier
{
  v2 = objc_opt_class();

  return (id)[v2 reuseIdentifier];
}

- (CNSharingProfileOnboardingHeaderView)initWithTitle:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CNSharingProfileOnboardingHeaderView;
  v3 = -[CNSharingProfileOnboardingHeaderView initWithFrame:](&v7, sel_initWithFrame_, a3, 0.0, 0.0, 50.0, 50.0);
  v4 = v3;
  if (v3) {
    v5 = v3;
  }

  return v4;
}

- (void)setHeaderView:(id)a3
{
  v5 = (OBHeaderView *)a3;
  p_headerView = &self->_headerView;
  headerView = self->_headerView;
  if (headerView != v5)
  {
    v8 = v5;
    [(OBHeaderView *)headerView removeFromSuperview];
    objc_storeStrong((id *)&self->_headerView, a3);
    v5 = v8;
    if (v8)
    {
      [(CNSharingProfileOnboardingHeaderView *)self bounds];
      -[OBHeaderView setFrame:](*p_headerView, "setFrame:");
      [(OBHeaderView *)*p_headerView setAutoresizingMask:18];
      [(CNSharingProfileOnboardingHeaderView *)self addSubview:*p_headerView];
      v5 = v8;
    }
  }
}

+ (id)reuseIdentifier
{
  return @"CNSharingProfileOnboardingHeaderView";
}

@end