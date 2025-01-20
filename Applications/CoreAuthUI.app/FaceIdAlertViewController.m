@interface FaceIdAlertViewController
- (BOOL)_canShowWhileLocked;
- (LAUIPearlGlyphView)glyph;
- (id)onDismiss;
- (int)_preferredStatusBarVisibility;
- (void)_shakeTitleLabel;
- (void)dismissWithDelay:(double)a3 completion:(id)a4;
- (void)setGlyph:(id)a3;
- (void)setOnDismiss:(id)a3;
- (void)shake;
- (void)viewDidDisappear:(BOOL)a3;
@end

@implementation FaceIdAlertViewController

- (LAUIPearlGlyphView)glyph
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_glyph);

  return (LAUIPearlGlyphView *)WeakRetained;
}

- (void)setGlyph:(id)a3
{
  id v5 = objc_storeWeak((id *)&self->_glyph, a3);
  if (a3)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000070A4;
    v7[3] = &unk_100086040;
    v7[4] = self;
    v6 = sub_1000070A4((uint64_t)v7);
    [(FaceIdAlertViewController *)self _setHeaderContentViewController:v6];
  }
  else
  {
    [(FaceIdAlertViewController *)self _setHeaderContentViewController:0];
  }
}

- (void)shake
{
  p_glyph = &self->_glyph;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_glyph);

  if (WeakRetained)
  {
    id v5 = objc_loadWeakRetained((id *)p_glyph);
    [v5 setState:4 animated:1];
  }
  else
  {
    [(FaceIdAlertViewController *)self _shakeTitleLabel];
  }
}

- (void)_shakeTitleLabel
{
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100007698;
  v23[3] = &unk_100086068;
  v23[4] = self;
  v2 = sub_100007698((uint64_t)v23);
  v3 = v2;
  if (v2)
  {
    v4 = [v2 layer];
    [v4 removeAllAnimations];
    id v5 = +[CASpringAnimation animationWithKeyPath:@"position.x"];
    [v5 setMass:1.20000005];
    [v5 setStiffness:1200.0];
    [v5 setDamping:12.0];
    LODWORD(v6) = 1028389654;
    LODWORD(v7) = 990057071;
    LODWORD(v8) = 1059712716;
    LODWORD(v9) = 1.0;
    v10 = +[CAMediaTimingFunction functionWithControlPoints:v6 :v7 :v8 :v9];
    [v5 setTimingFunction:v10];

    [v5 setDuration:0.860000014];
    [v5 setVelocity:0.0];
    [v5 setFillMode:kCAFillModeBackwards];
    [v4 position];
    double v12 = v11 + 60.0;
    *(float *)&double v12 = v12;
    v13 = +[NSNumber numberWithFloat:v12];
    [v5 setFromValue:v13];

    [v4 addAnimation:v5 forKey:@"position"];
    v14 = +[CABasicAnimation animationWithKeyPath:@"position.x"];
    LODWORD(v15) = 1036831949;
    LODWORD(v16) = 0.25;
    LODWORD(v17) = 0.25;
    LODWORD(v18) = 1.0;
    v19 = +[CAMediaTimingFunction functionWithControlPoints:v16 :v15 :v17 :v18];
    [v14 setTimingFunction:v19];

    [v14 setDuration:0.0700000003];
    [v14 setFillMode:kCAFillModeBackwards];
    [v4 position];
    double v21 = v20 + -60.0;
    *(float *)&double v21 = v21;
    v22 = +[NSNumber numberWithFloat:v21];
    [v14 setFromValue:v22];

    [v4 addAnimation:v14 forKey:@"force"];
  }
}

- (void)dismissWithDelay:(double)a3 completion:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000078E4;
  v8[3] = &unk_100085F40;
  v8[4] = self;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000079C4;
  v6[3] = &unk_100086090;
  v6[4] = self;
  id v7 = a4;
  id v5 = v7;
  +[UIView animateWithDuration:2 delay:v8 options:v6 animations:0.2 completion:a3];
}

- (int)_preferredStatusBarVisibility
{
  return 0;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewDidDisappear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)FaceIdAlertViewController;
  [(AlertController *)&v6 viewDidDisappear:a3];
  v4 = [(FaceIdAlertViewController *)self onDismiss];

  if (v4)
  {
    id v5 = [(FaceIdAlertViewController *)self onDismiss];
    v5[2]();
  }
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
  objc_storeStrong(&self->_onDismiss, 0);

  objc_destroyWeak((id *)&self->_glyph);
}

@end