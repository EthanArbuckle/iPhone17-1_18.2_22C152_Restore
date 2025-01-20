@interface EKUIAvailabilityTitleContainerView
- (CGSize)intrinsicContentSize;
- (EKUIAvailabilityViewController)controller;
- (void)layoutSubviews;
- (void)setController:(id)a3;
@end

@implementation EKUIAvailabilityTitleContainerView

- (CGSize)intrinsicContentSize
{
  double v2 = 1000.0;
  double v3 = 1000.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)EKUIAvailabilityTitleContainerView;
  [(EKUIAvailabilityTitleContainerView *)&v4 layoutSubviews];
  double v3 = [(EKUIAvailabilityTitleContainerView *)self controller];
  [v3 configureNavBarAndToolBar];
}

- (EKUIAvailabilityViewController)controller
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);

  return (EKUIAvailabilityViewController *)WeakRetained;
}

- (void)setController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end