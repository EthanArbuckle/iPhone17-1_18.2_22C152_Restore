@interface HNDView
- (BOOL)isActive;
- (BOOL)requiresRealUpEvent;
- (HNDView)initWithFrame:(CGRect)a3;
- (HNDViewDelegateControl)controlDelegate;
- (double)inactiveAlpha;
- (id)description;
- (void)handleRealCancelEvent:(CGPoint)a3;
- (void)handleRealUpEvent:(CGPoint)a3 maxOrb:(double)a4;
- (void)setControlDelegate:(id)a3;
- (void)setInactiveAlpha:(double)a3;
- (void)setIsActive:(BOOL)a3;
- (void)setIsActive:(BOOL)a3 withDuration:(double)a4;
- (void)setIsActive:(BOOL)a3 withDuration:(double)a4 options:(unint64_t)a5;
- (void)setIsActive:(BOOL)a3 withDuration:(double)a4 options:(unint64_t)a5 inactiveAlpha:(double)a6;
- (void)setRequiresRealUpEvent:(BOOL)a3;
@end

@implementation HNDView

- (HNDView)initWithFrame:(CGRect)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HNDView;
  v3 = -[HNDView initWithFrame:](&v5, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(HNDView *)v3 setInactiveAlpha:0.2];
  return v3;
}

- (BOOL)isActive
{
  return self->_active;
}

- (void)setIsActive:(BOOL)a3
{
}

- (void)setIsActive:(BOOL)a3 withDuration:(double)a4
{
}

- (void)setIsActive:(BOOL)a3 withDuration:(double)a4 options:(unint64_t)a5
{
  BOOL v7 = a3;
  [(HNDView *)self inactiveAlpha];

  [(HNDView *)self setIsActive:v7 withDuration:a5 options:a4 inactiveAlpha:v9];
}

- (void)setIsActive:(BOOL)a3 withDuration:(double)a4 options:(unint64_t)a5 inactiveAlpha:(double)a6
{
  self->_active = a3;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10005F45C;
  v6[3] = &unk_1001AB728;
  v6[4] = self;
  BOOL v7 = a3;
  *(double *)&v6[5] = a6;
  +[UIView animateWithDuration:a5 delay:v6 options:0 animations:a4 completion:0.0];
}

- (void)handleRealCancelEvent:(CGPoint)a3
{
}

- (void)handleRealUpEvent:(CGPoint)a3 maxOrb:(double)a4
{
  p_controlDelegate = &self->_controlDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_controlDelegate);

  if (WeakRetained)
  {
    id v7 = objc_loadWeakRetained((id *)p_controlDelegate);
    [v7 viewPressedUp:self];
  }
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)HNDView;
  v3 = [(HNDView *)&v7 description];
  v4 = [(HNDView *)self accessibilityIdentifier];
  objc_super v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (HNDViewDelegateControl)controlDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_controlDelegate);

  return (HNDViewDelegateControl *)WeakRetained;
}

- (void)setControlDelegate:(id)a3
{
}

- (BOOL)requiresRealUpEvent
{
  return self->_requiresRealUpEvent;
}

- (void)setRequiresRealUpEvent:(BOOL)a3
{
  self->_requiresRealUpEvent = a3;
}

- (double)inactiveAlpha
{
  return self->_inactiveAlpha;
}

- (void)setInactiveAlpha:(double)a3
{
  self->_inactiveAlpha = a3;
}

- (void).cxx_destruct
{
}

@end