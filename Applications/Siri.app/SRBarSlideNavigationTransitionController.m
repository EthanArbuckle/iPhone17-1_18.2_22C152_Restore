@interface SRBarSlideNavigationTransitionController
- (SiriUINavigationController)_navigationController;
- (int64_t)operation;
- (void)_setNavigationController:(id)a3;
- (void)configureWithNavigationController:(id)a3;
- (void)coordinateAdditionalTransitionsWithTransitionCoordinator:(id)a3;
- (void)setOperation:(int64_t)a3;
@end

@implementation SRBarSlideNavigationTransitionController

- (void)configureWithNavigationController:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(SRBarSlideNavigationTransitionController *)self _setNavigationController:v4];
  }
  else
  {
    v5 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR)) {
      sub_1000B76F8(v5);
    }
  }
  v6 = [v4 navigationBar];
  [v6 setAlpha:0.0];
}

- (void)coordinateAdditionalTransitionsWithTransitionCoordinator:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001901C;
  v7[3] = &unk_100143460;
  objc_copyWeak(&v8, &location);
  v7[4] = self;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100019070;
  v5[3] = &unk_100143488;
  objc_copyWeak(&v6, &location);
  [v4 animateAlongsideTransition:v7 completion:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (int64_t)operation
{
  return self->_operation;
}

- (void)setOperation:(int64_t)a3
{
  self->_operation = a3;
}

- (SiriUINavigationController)_navigationController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_navigationController);

  return (SiriUINavigationController *)WeakRetained;
}

- (void)_setNavigationController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end