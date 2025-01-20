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
  v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v6 = [MEMORY[0x263F1C6B0] imageNamed:@"RPVideoOverlayGlyphMask" inBundle:v5];
  id v7 = objc_alloc(MEMORY[0x263F1C488]);
  v8 = objc_msgSend(v7, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  [v8 setImage:v6 forState:0];
  [v8 sizeToFit];
  [v8 frame];
  v17.receiver = self;
  v17.super_class = (Class)RPHighFidelityVideoOverlayButton;
  v9 = -[RPHighFidelityVideoOverlayButton initWithFrame:](&v17, sel_initWithFrame_);
  v10 = v9;
  if (v9)
  {
    v9->_style = a3;
    p_button = (id *)&v9->_button;
    objc_storeStrong((id *)&v9->_button, v8);
    [v8 addTarget:v10 action:sel__playButtonTapped_ forControlEvents:64];
    [v8 addTarget:v10 action:sel__playButtonActivate_ forControlEvents:64];
    [v8 addTarget:v10 action:sel__playButtonActivate_ forControlEvents:4];
    [v8 addTarget:v10 action:sel__playButtonDeactivate_ forControlEvents:8];
    [v8 setDeliversTouchesForGesturesToSuperview:0];
    [(RPHighFidelityVideoOverlayButton *)v10 addSubview:*p_button];
    [(RPHighFidelityVideoOverlayButton *)v10 setAutoresizingMask:45];
    if (!a3)
    {
      v12 = [MEMORY[0x263F1C6B0] imageNamed:@"RPVideoOverlayBackgroundMask" inBundle:v5];
      v13 = (void *)[objc_alloc(MEMORY[0x263F1C6D0]) initWithImage:v12];
      uint64_t v14 = [objc_alloc(MEMORY[0x263F1CBE8]) initWithPrivateStyle:2010];
      backdropView = v10->_backdropView;
      v10->_backdropView = (_UIBackdropView *)v14;

      [(RPHighFidelityVideoOverlayButton *)v10 insertSubview:v10->_backdropView belowSubview:*p_button];
      [(RPHighFidelityVideoOverlayButton *)v10 addSubview:v13];
      [v13 _setBackdropMaskViewFlags:7];
      [v13 setAlpha:0.0];
      [(_UIBackdropView *)v10->_backdropView updateMaskViewsForView:v13];
      [*p_button _setBackdropMaskViewFlags:3];
      [(_UIBackdropView *)v10->_backdropView updateMaskViewsForView:*p_button];
    }
  }
  [(RPHighFidelityVideoOverlayButton *)v10 _playButtonDeactivate:0];

  return v10;
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