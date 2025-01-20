@interface TouchIdAlertController
- (BOOL)_canShowWhileLocked;
- (TouchIdAlertController)init;
- (id)onDismiss;
- (void)_setupHeaderContentViewController;
- (void)setOnDismiss:(id)a3;
- (void)shake;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation TouchIdAlertController

- (TouchIdAlertController)init
{
  v5.receiver = self;
  v5.super_class = (Class)TouchIdAlertController;
  v2 = [(TouchIdAlertController *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(TouchIdAlertController *)v2 setPreferredStyle:1];
    [(TouchIdAlertController *)v3 _setupHeaderContentViewController];
  }
  return v3;
}

- (void)_setupHeaderContentViewController
{
  sub_100026568();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [(TouchIdAlertController *)self _setHeaderContentViewController:v3];
}

- (void)shake
{
  id v3 = [(TouchIdAlertController *)self _headerContentViewController];

  if (v3)
  {
    v4 = [(TouchIdAlertController *)self _headerContentViewController];
    objc_super v5 = [v4 view];
    id v24 = [v5 layer];

    [v24 removeAllAnimations];
    v6 = +[CASpringAnimation animationWithKeyPath:@"position.x"];
    [v6 setMass:1.20000005];
    [v6 setStiffness:1200.0];
    [v6 setDamping:12.0];
    LODWORD(v7) = 1028389654;
    LODWORD(v8) = 990057071;
    LODWORD(v9) = 1059712716;
    LODWORD(v10) = 1.0;
    v11 = +[CAMediaTimingFunction functionWithControlPoints:v7 :v8 :v9 :v10];
    [v6 setTimingFunction:v11];

    [v6 setDuration:0.860000014];
    [v6 setVelocity:0.0];
    [v6 setFillMode:kCAFillModeBackwards];
    [v24 position];
    double v13 = v12 + 60.0;
    *(float *)&double v13 = v13;
    v14 = +[NSNumber numberWithFloat:v13];
    [v6 setFromValue:v14];

    [v24 addAnimation:v6 forKey:@"position"];
    v15 = +[CABasicAnimation animationWithKeyPath:@"position.x"];
    LODWORD(v16) = 1036831949;
    LODWORD(v17) = 0.25;
    LODWORD(v18) = 0.25;
    LODWORD(v19) = 1.0;
    v20 = +[CAMediaTimingFunction functionWithControlPoints:v17 :v16 :v18 :v19];
    [v15 setTimingFunction:v20];

    [v15 setDuration:0.0700000003];
    [v15 setFillMode:kCAFillModeBackwards];
    [v24 position];
    double v22 = v21 + -60.0;
    *(float *)&double v22 = v22;
    v23 = +[NSNumber numberWithFloat:v22];
    [v15 setFromValue:v23];

    [v24 addAnimation:v15 forKey:@"force"];
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TouchIdAlertController;
  [(TouchIdAlertController *)&v5 viewWillDisappear:a3];
  onDismiss = (void (**)(void))self->_onDismiss;
  if (onDismiss) {
    onDismiss[2]();
  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (id)onDismiss
{
  return self->_onDismiss;
}

- (void)setOnDismiss:(id)a3
{
}

- (void).cxx_destruct
{
}

@end