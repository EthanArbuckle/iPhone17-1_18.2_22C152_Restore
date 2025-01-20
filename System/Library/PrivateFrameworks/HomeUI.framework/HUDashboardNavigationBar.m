@interface HUDashboardNavigationBar
- (BOOL)isBackgroundVisible;
- (HUDashboardNavigationBar)initWithFrame:(CGRect)a3;
- (HUDashboardNavigationTitleView)titleView;
- (int64_t)_sceneDraggingBehaviorOnPan;
- (void)largeTitleHeightDidChange:(double)a3;
- (void)setIsBackgroundVisible:(BOOL)a3;
- (void)setTitleView:(id)a3;
@end

@implementation HUDashboardNavigationBar

- (HUDashboardNavigationBar)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)HUDashboardNavigationBar;
  v3 = -[HUDashboardNavigationBar initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(HUDashboardNavigationBar *)v3 setPrefersLargeTitles:1];
    v5 = objc_msgSend(MEMORY[0x1E4F42BF0], "hu_dashboardAppearance");
    [(HUDashboardNavigationBar *)v4 setStandardAppearance:v5];

    v6 = [MEMORY[0x1E4F428B8] systemWhiteColor];
    [(HUDashboardNavigationBar *)v4 setTintColor:v6];
  }
  return v4;
}

- (BOOL)isBackgroundVisible
{
  return self->_isBackgroundVisible;
}

- (void)largeTitleHeightDidChange:(double)a3
{
  v5 = [(HUDashboardNavigationBar *)self titleView];
  [v5 largeTitleHeightRange];
  double v7 = v6;
  BOOL v8 = v6 >= a3;

  if (v8 != [(HUDashboardNavigationBar *)self isBackgroundVisible])
  {
    [(HUDashboardNavigationBar *)self setIsBackgroundVisible:v7 >= a3];
    v9 = [(HUDashboardNavigationBar *)self delegate];
    if ([v9 conformsToProtocol:&unk_1F1A78C58]) {
      v10 = v9;
    }
    else {
      v10 = 0;
    }
    id v11 = v10;

    if (v11 && (objc_opt_respondsToSelector() & 1) != 0) {
      objc_msgSend(v11, "navigationBar:didChangeBackgroundVisibility:", self, -[HUDashboardNavigationBar isBackgroundVisible](self, "isBackgroundVisible"));
    }
  }
}

- (int64_t)_sceneDraggingBehaviorOnPan
{
  return 2;
}

- (void)setIsBackgroundVisible:(BOOL)a3
{
  self->_isBackgroundVisible = a3;
}

- (HUDashboardNavigationTitleView)titleView
{
  return self->_titleView;
}

- (void)setTitleView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end