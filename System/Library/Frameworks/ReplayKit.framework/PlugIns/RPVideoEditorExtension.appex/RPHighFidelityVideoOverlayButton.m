@interface RPHighFidelityVideoOverlayButton
- (RPHighFidelityVideoOverlayButton)initWithStyle:(int64_t)a3;
- (SEL)action;
- (id)target;
- (int64_t)style;
- (void)_playButtonActivate:(id)a3;
- (void)_playButtonDeactivate:(id)a3;
- (void)_playButtonTapped:(id)a3;
- (void)setAction:(SEL)a3;
- (void)setTarget:(id)a3;
- (void)setTarget:(id)a3 action:(SEL)a4;
@end

@implementation RPHighFidelityVideoOverlayButton

- (RPHighFidelityVideoOverlayButton)initWithStyle:(int64_t)a3
{
  v5 = +[NSBundle bundleForClass:objc_opt_class()];
  v6 = +[UIImage imageNamed:@"RPVideoOverlayGlyphMask" inBundle:v5];
  id v7 = objc_msgSend(objc_alloc((Class)UIButton), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  [v7 setImage:v6 forState:0];
  [v7 sizeToFit];
  [v7 frame];
  v16.receiver = self;
  v16.super_class = (Class)RPHighFidelityVideoOverlayButton;
  v8 = -[RPHighFidelityVideoOverlayButton initWithFrame:](&v16, "initWithFrame:");
  v9 = v8;
  if (v8)
  {
    v8->_style = a3;
    p_button = (id *)&v8->_button;
    objc_storeStrong((id *)&v8->_button, v7);
    [v7 addTarget:v9 action:"_playButtonTapped:" forControlEvents:64];
    [v7 addTarget:v9 action:"_playButtonActivate:" forControlEvents:64];
    [v7 addTarget:v9 action:"_playButtonActivate:" forControlEvents:4];
    [v7 addTarget:v9 action:"_playButtonDeactivate:" forControlEvents:8];
    [v7 setDeliversTouchesForGesturesToSuperview:0];
    [(RPHighFidelityVideoOverlayButton *)v9 addSubview:*p_button];
    [(RPHighFidelityVideoOverlayButton *)v9 setAutoresizingMask:45];
    if (!a3)
    {
      v11 = +[UIImage imageNamed:@"RPVideoOverlayBackgroundMask" inBundle:v5];
      id v12 = [objc_alloc((Class)UIImageView) initWithImage:v11];
      v13 = (_UIBackdropView *)[objc_alloc((Class)_UIBackdropView) initWithPrivateStyle:2010];
      backdropView = v9->_backdropView;
      v9->_backdropView = v13;

      [(RPHighFidelityVideoOverlayButton *)v9 insertSubview:v9->_backdropView belowSubview:*p_button];
      [(RPHighFidelityVideoOverlayButton *)v9 addSubview:v12];
      [v12 _setBackdropMaskViewFlags:7];
      [v12 setAlpha:0.0];
      [(_UIBackdropView *)v9->_backdropView updateMaskViewsForView:v12];
      [*p_button _setBackdropMaskViewFlags:3];
      [(_UIBackdropView *)v9->_backdropView updateMaskViewsForView:*p_button];
    }
  }
  [(RPHighFidelityVideoOverlayButton *)v9 _playButtonDeactivate:0];

  return v9;
}

- (int64_t)style
{
  return self->_style;
}

- (void)setTarget:(id)a3 action:(SEL)a4
{
  self->_action = a4;
}

- (void)_playButtonActivate:(id)a3
{
}

- (void)_playButtonDeactivate:(id)a3
{
}

- (void)_playButtonTapped:(id)a3
{
  [(RPHighFidelityVideoOverlayButton *)self _playButtonDeactivate:a3];
  id WeakRetained = objc_loadWeakRetained(&self->_target);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = objc_loadWeakRetained(&self->_target);
    [v6 performSelector:self->_action withObject:self];
  }
}

- (id)target
{
  id WeakRetained = objc_loadWeakRetained(&self->_target);

  return WeakRetained;
}

- (void)setTarget:(id)a3
{
}

- (SEL)action
{
  return self->_action;
}

- (void)setAction:(SEL)a3
{
  self->_action = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_target);
  objc_storeStrong((id *)&self->_backdropView, 0);

  objc_storeStrong((id *)&self->_button, 0);
}

@end