@interface PHBottomBarMuteButton
- (PHBottomBarButtonConfiguration)muteButtonConfiguration;
- (PHBottomBarMuteButton)initWithConfiguration:(id)a3;
- (void)_performSetEnabled:(BOOL)a3;
- (void)_performSetHighlighted:(BOOL)a3;
- (void)_performSetSelected:(BOOL)a3;
- (void)setMuteButtonConfiguration:(id)a3;
- (void)updateButtonAnimated:(BOOL)a3;
- (void)updateButtonColor;
- (void)updateIcon;
@end

@implementation PHBottomBarMuteButton

- (PHBottomBarMuteButton)initWithConfiguration:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PHBottomBarMuteButton;
  v6 = [(PHBottomBarButton *)&v9 initWithConfiguration:v5];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_muteButtonConfiguration, a3);
    [(PHBottomBarMuteButton *)v7 updateButtonAnimated:0];
  }

  return v7;
}

- (void)_performSetSelected:(BOOL)a3
{
}

- (void)_performSetHighlighted:(BOOL)a3
{
}

- (void)_performSetEnabled:(BOOL)a3
{
}

- (void)updateButtonAnimated:(BOOL)a3
{
  double v3 = 0.170000002;
  if (!a3) {
    double v3 = 0.0;
  }
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10006D184;
  v4[3] = &unk_1002CD518;
  v4[4] = self;
  +[UIView animateWithDuration:v4 animations:v3];
}

- (void)updateButtonColor
{
  if ([(PHBottomBarMuteButton *)self isSelected])
  {
    id v7 = [(PHBottomBarMuteButton *)self muteButtonConfiguration];
    uint64_t v3 = [v7 selectedColor];
  }
  else
  {
    unsigned int v4 = [(PHBottomBarMuteButton *)self isHighlighted];
    id v5 = [(PHBottomBarMuteButton *)self muteButtonConfiguration];
    id v7 = v5;
    if (v4) {
      [v5 highlightedColor];
    }
    else {
    uint64_t v3 = [v5 backgroundColor];
    }
  }
  v6 = (void *)v3;
  [(PHBottomBarButton *)self setBackgroundColor:v3];
}

- (void)updateIcon
{
  unsigned __int8 v3 = [(PHBottomBarMuteButton *)self isSelected];
  unsigned int v4 = [(PHBottomBarMuteButton *)self muteButtonConfiguration];
  id v5 = v4;
  if (v3) {
    [v4 selectedIcon];
  }
  else {
  id v6 = [v4 icon];
  }

  [(PHBottomBarMuteButton *)self setImage:v6 forStates:0];
}

- (PHBottomBarButtonConfiguration)muteButtonConfiguration
{
  return self->_muteButtonConfiguration;
}

- (void)setMuteButtonConfiguration:(id)a3
{
}

- (void).cxx_destruct
{
}

@end