@interface AXSpeakScreenButton
- (UIVisualEffectView)borderEffectView;
- (UIVisualEffectView)buttonEffectView;
- (void)setAlpha:(double)a3;
- (void)setBorderEffectView:(id)a3;
- (void)setButtonEffectView:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setHidden:(BOOL)a3;
@end

@implementation AXSpeakScreenButton

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)AXSpeakScreenButton;
  -[AXSpeakScreenButton setEnabled:](&v8, "setEnabled:");
  v5 = +[UIBlurEffect effectWithStyle:19];
  v6 = +[UIVibrancyEffect effectForBlurEffect:v5 style:!v3];
  v7 = [(AXSpeakScreenButton *)self buttonEffectView];
  [v7 setEffect:v6];
}

- (void)setHidden:(BOOL)a3
{
  BOOL v3 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AXSpeakScreenButton;
  -[AXSpeakScreenButton setHidden:](&v11, "setHidden:");
  v5 = [(AXSpeakScreenButton *)self buttonEffectView];
  [v5 setHidden:v3];

  v6 = [(AXSpeakScreenButton *)self borderEffectView];
  [v6 setHidden:v3];

  v7 = [(AXSpeakScreenButton *)self borderEffectView];
  objc_super v8 = [v7 contentView];
  v9 = [v8 subviews];
  v10 = [v9 lastObject];
  [v10 setHidden:v3];
}

- (void)setAlpha:(double)a3
{
  v11.receiver = self;
  v11.super_class = (Class)AXSpeakScreenButton;
  -[AXSpeakScreenButton setAlpha:](&v11, "setAlpha:");
  v5 = [(AXSpeakScreenButton *)self borderEffectView];
  v6 = [v5 contentView];
  v7 = [v6 subviews];
  objc_super v8 = [v7 lastObject];
  [v8 setAlpha:a3];

  v9 = [(AXSpeakScreenButton *)self borderEffectView];
  [v9 setAlpha:a3];

  v10 = [(AXSpeakScreenButton *)self buttonEffectView];
  [v10 setAlpha:a3];
}

- (UIVisualEffectView)buttonEffectView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_buttonEffectView);

  return (UIVisualEffectView *)WeakRetained;
}

- (void)setButtonEffectView:(id)a3
{
}

- (UIVisualEffectView)borderEffectView
{
  return self->_borderEffectView;
}

- (void)setBorderEffectView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_borderEffectView, 0);

  objc_destroyWeak((id *)&self->_buttonEffectView);
}

@end