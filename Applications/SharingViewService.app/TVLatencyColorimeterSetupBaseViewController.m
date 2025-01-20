@interface TVLatencyColorimeterSetupBaseViewController
- (BOOL)_canShowWhileLocked;
- (TVLatencyColorimeterSetupMainController)mainController;
- (TVLatencyColorimeterTrainingView)trainingView;
- (UIImageView)statusImageViewIcon;
- (UIView)animationContainerView;
- (void)setAnimationContainerView:(id)a3;
- (void)setMainController:(id)a3;
- (void)setStatusImageViewIcon:(id)a3;
- (void)setTrainingView:(id)a3;
@end

@implementation TVLatencyColorimeterSetupBaseViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mainController, 0);
  objc_storeStrong((id *)&self->_statusImageViewIcon, 0);
  objc_storeStrong((id *)&self->_trainingView, 0);

  objc_storeStrong((id *)&self->_animationContainerView, 0);
}

- (void)setStatusImageViewIcon:(id)a3
{
}

- (UIImageView)statusImageViewIcon
{
  return self->_statusImageViewIcon;
}

- (void)setTrainingView:(id)a3
{
}

- (TVLatencyColorimeterTrainingView)trainingView
{
  return self->_trainingView;
}

- (void)setAnimationContainerView:(id)a3
{
}

- (UIView)animationContainerView
{
  return self->_animationContainerView;
}

- (void)setMainController:(id)a3
{
}

- (TVLatencyColorimeterSetupMainController)mainController
{
  return self->_mainController;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

@end