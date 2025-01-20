@interface TVLatencySetupBaseViewController
- (BOOL)_canShowWhileLocked;
- (UILabel)titleLabel;
- (UIView)animationContainerView;
- (void)setAnimationContainerView:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation TVLatencySetupBaseViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_titleLabel + 1), 0);

  objc_storeStrong((id *)(&self->super._didReactivateContainerViewAfterLayingOut + 1), 0);
}

- (void)setAnimationContainerView:(id)a3
{
}

- (UIView)animationContainerView
{
  return *(UIView **)((char *)&self->_titleLabel + 1);
}

- (void)setTitleLabel:(id)a3
{
}

- (UILabel)titleLabel
{
  return *(UILabel **)(&self->super._didReactivateContainerViewAfterLayingOut + 1);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TVLatencySetupBaseViewController;
  [(SVSBaseViewController *)&v5 viewWillAppear:a3];
  v4 = +[UIFont _preferredFontForTextStyle:UIFontTextStyleTitle1 variant:1280];
  [*(id *)(&self->super._didReactivateContainerViewAfterLayingOut + 1) setFont:v4];
}

@end