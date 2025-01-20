@interface QLOverlayPlayButton
- (QLOverlayPlayButton)init;
- (QLOverlayPlayButton)initWithFrame:(CGRect)a3;
- (void)_playButtonActivate:(id)a3;
- (void)_playButtonDeactivate:(id)a3;
- (void)_playButtonTapped:(id)a3;
- (void)layoutSubviews;
- (void)setTarget:(id)a3 action:(SEL)a4;
@end

@implementation QLOverlayPlayButton

- (QLOverlayPlayButton)init
{
  v5.receiver = self;
  v5.super_class = (Class)QLOverlayPlayButton;
  v2 = [(QLOverlayPlayButton *)&v5 init];
  v3 = v2;
  if (v2) {
    [(QLOverlayPlayButton *)v2 setAccessibilityIdentifier:@"QLOverlayPlayButtonDefaultAccessibilityIdentifier"];
  }
  return v3;
}

- (QLOverlayPlayButton)initWithFrame:(CGRect)a3
{
  v4 = QLFrameworkBundle();
  objc_super v5 = [MEMORY[0x263F827E8] imageNamed:@"overlay-play-inside" inBundle:v4 compatibleWithTraitCollection:0];
  v6 = [MEMORY[0x263F827E8] imageNamed:@"overlay-play-outside" inBundle:v4 compatibleWithTraitCollection:0];
  id v7 = objc_alloc(MEMORY[0x263F824E8]);
  v8 = (UIButton *)objc_msgSend(v7, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  [(UIButton *)v8 setImage:v5 forState:0];
  [(UIButton *)v8 addTarget:self action:sel__playButtonTapped_ forControlEvents:64];
  [(UIButton *)v8 addTarget:self action:sel__playButtonActivate_ forControlEvents:1];
  [(UIButton *)v8 addTarget:self action:sel__playButtonActivate_ forControlEvents:4];
  [(UIButton *)v8 addTarget:self action:sel__playButtonDeactivate_ forControlEvents:8];
  [(UIButton *)v8 sizeToFit];
  [(UIButton *)v8 frame];
  v16.receiver = self;
  v16.super_class = (Class)QLOverlayPlayButton;
  v9 = -[QLOverlayPlayButton initWithFrame:](&v16, sel_initWithFrame_);
  v10 = (void *)[objc_alloc(MEMORY[0x263F82828]) initWithImage:v6];
  uint64_t v11 = [objc_alloc(MEMORY[0x263F82EB8]) initWithPrivateStyle:2010];
  backdropView = v9->_backdropView;
  v9->_backdropView = (_UIBackdropView *)v11;

  [(QLOverlayPlayButton *)v9 frame];
  -[_UIBackdropView setFrame:](v9->_backdropView, "setFrame:");
  button = v9->_button;
  v9->_button = v8;
  v14 = v8;

  [(QLOverlayPlayButton *)v9 frame];
  -[UIButton setFrame:](v9->_button, "setFrame:");
  [(QLOverlayPlayButton *)v9 addSubview:v9->_backdropView];
  [(QLOverlayPlayButton *)v9 addSubview:v9->_button];
  [(QLOverlayPlayButton *)v9 addSubview:v10];
  [v10 _setBackdropMaskViewFlags:7];
  [v10 setAlpha:0.0];
  [(_UIBackdropView *)v9->_backdropView updateMaskViewsForView:v10];
  [(UIButton *)v9->_button _setBackdropMaskViewFlags:3];
  [(_UIBackdropView *)v9->_backdropView updateMaskViewsForView:v9->_button];

  [(QLOverlayPlayButton *)v9 _playButtonDeactivate:0];
  [(QLOverlayPlayButton *)v9 setAccessibilityIdentifier:@"QLOverlayPlayButtonDefaultAccessibilityIdentifier"];

  return v9;
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)QLOverlayPlayButton;
  [(QLOverlayPlayButton *)&v5 layoutSubviews];
  v3 = [(QLOverlayPlayButton *)self layer];
  [(QLOverlayPlayButton *)self bounds];
  [v3 setCornerRadius:v4 * 0.5];
}

- (void)setTarget:(id)a3 action:(SEL)a4
{
  objc_storeWeak(&self->_target, a3);
  if (a4) {
    v6 = a4;
  }
  else {
    v6 = 0;
  }
  self->_action = v6;
}

- (void)_playButtonActivate:(id)a3
{
}

- (void)_playButtonDeactivate:(id)a3
{
}

- (void)_playButtonTapped:(id)a3
{
  id v10 = a3;
  -[QLOverlayPlayButton _playButtonDeactivate:](self, "_playButtonDeactivate:");
  id WeakRetained = objc_loadWeakRetained(&self->_target);
  p_action = &self->_action;
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained(&self->_target);
    v8 = v7;
    if (*p_action) {
      SEL v9 = *p_action;
    }
    else {
      SEL v9 = 0;
    }
    [v7 performSelector:v9 withObject:self];
  }
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_target);
  objc_storeStrong((id *)&self->_backdropView, 0);

  objc_storeStrong((id *)&self->_button, 0);
}

@end