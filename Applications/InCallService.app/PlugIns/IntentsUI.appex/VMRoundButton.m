@interface VMRoundButton
- (UIColor)actualBackgroundColor;
- (UIColor)actualTintColor;
- (VMRoundButton)initWithType:(unint64_t)a3;
- (unint64_t)type;
- (void)_updateButtonState;
- (void)configureButtonUsingAudioRoute:(id)a3;
- (void)layoutSubviews;
- (void)setActualBackgroundColor:(id)a3;
- (void)setActualTintColor:(id)a3;
- (void)setButtonType:(unint64_t)a3 enabled:(BOOL)a4;
- (void)setEnabled:(BOOL)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setSelected:(BOOL)a3;
- (void)setType:(unint64_t)a3;
@end

@implementation VMRoundButton

- (VMRoundButton)initWithType:(unint64_t)a3
{
  v4 = -[VMRoundButton initWithSize:](self, "initWithSize:", 37.0, 37.0);
  v5 = v4;
  if (v4)
  {
    [(VMRoundButton *)v4 setClipsToBounds:1];
    v6 = [(VMRoundButton *)v5 layer];
    [v6 setMasksToBounds:1];

    [(VMRoundButton *)v5 bounds];
    double v8 = v7 * 0.5;
    v9 = [(VMRoundButton *)v5 layer];
    [v9 setCornerRadius:v8];

    [(VMRoundButton *)v5 setAdjustsImageWhenDisabled:0];
    [(VMRoundButton *)v5 setButtonType:a3 enabled:1];
    LODWORD(v10) = 1148846080;
    -[VMRoundButton setLayoutSize:withContentPriority:](v5, "setLayoutSize:withContentPriority:", 37.0, 37.0, v10);
  }
  return v5;
}

- (void)layoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)VMRoundButton;
  [(VMRoundButton *)&v6 layoutSubviews];
  [(VMRoundButton *)self bounds];
  double v4 = v3 * 0.5;
  v5 = [(VMRoundButton *)self layer];
  [v5 setCornerRadius:v4];
}

- (void)setButtonType:(unint64_t)a3 enabled:(BOOL)a4
{
  [(VMRoundButton *)self setEnabled:a4];
  if (self->_type != a3)
  {
    self->_type = a3;
    switch(a3)
    {
      case 1uLL:
        objc_super v6 = +[UIColor systemLightGrayColor];
        id v9 = +[UIColor systemWhiteColor];
        uint64_t v7 = +[UIImage voicemailAudioRouteGlyphImage];
        goto LABEL_8;
      case 2uLL:
        objc_super v6 = +[UIColor systemBlueColor];
        id v9 = +[UIColor systemWhiteColor];
        uint64_t v7 = +[UIImage voicemailDialRequestGlyphImage];
        goto LABEL_8;
      case 3uLL:
        objc_super v6 = +[UIColor systemRedColor];
        id v9 = +[UIColor systemWhiteColor];
        uint64_t v7 = +[UIImage voicemailDeleteGlyphImage];
        goto LABEL_8;
      case 4uLL:
        objc_super v6 = +[UIColor systemRedColor];
        id v9 = +[UIColor systemWhiteColor];
        uint64_t v7 = +[UIImage voicemailUndeleteGlyphImage];
LABEL_8:
        double v8 = (void *)v7;
        break;
      default:
        id v9 = 0;
        objc_super v6 = 0;
        double v8 = 0;
        break;
    }
    [(VMRoundButton *)self setActualBackgroundColor:v6];
    [(VMRoundButton *)self setActualTintColor:v9];
    [(VMRoundButton *)self setImage:v8 forState:0];
  }
}

- (void)configureButtonUsingAudioRoute:(id)a3
{
  id v4 = a3;
  if ([v4 isReceiver]) {
    +[UIColor systemBlueColor];
  }
  else {
  v5 = +[UIColor systemWhiteColor];
  }
  if ([v4 deviceType]) {
    +[UIImage routeGlyphForDeviceType:displayStyle:color:](UIImage, "routeGlyphForDeviceType:displayStyle:color:", [v4 deviceType], 0, v5);
  }
  else {
  objc_super v6 = +[UIImage voicemailAudioRouteGlyphImage];
  }
  if ([v4 isReceiver]) {
    +[UIColor systemLightGrayColor];
  }
  else {
  uint64_t v7 = +[UIColor systemBlueColor];
  }
  [(VMRoundButton *)self setActualBackgroundColor:v7];

  [(VMRoundButton *)self setActualTintColor:v5];
  [(VMRoundButton *)self setImage:v6 forState:0];
  double v8 = PHDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Configuring audio route button using route: %@", (uint8_t *)&v9, 0xCu);
  }
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)VMRoundButton;
  -[VMRoundButton setHighlighted:](&v8, "setHighlighted:");
  v5 = [(VMRoundButton *)self actualBackgroundColor];
  objc_super v6 = v5;
  if (v3)
  {
    uint64_t v7 = [v5 colorWithAlphaComponent:0.6];
    [(VMRoundButton *)self setBackgroundColor:v7];
  }
  else
  {
    [(VMRoundButton *)self setBackgroundColor:v5];
  }
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v11.receiver = self;
  v11.super_class = (Class)VMRoundButton;
  -[VMRoundButton setEnabled:](&v11, "setEnabled:");
  if (v3)
  {
    v5 = [(VMRoundButton *)self actualBackgroundColor];
    [(VMRoundButton *)self setBackgroundColor:v5];

    [(VMRoundButton *)self actualTintColor];
  }
  else
  {
    objc_super v6 = +[UIColor secondaryLabelColor];
    uint64_t v7 = +[UIColor secondaryLabelColor];
    [v7 alphaComponent];
    int v9 = [v6 colorWithAlphaComponent:v8 * 0.5];
    [(VMRoundButton *)self setBackgroundColor:v9];

    +[UIColor colorWithWhite:1.0 alpha:0.5];
  id v10 = };
  [(VMRoundButton *)self setTintColor:v10];
}

- (void)setSelected:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)VMRoundButton;
  [(VMRoundButton *)&v4 setSelected:a3];
  [(VMRoundButton *)self _updateButtonState];
}

- (void)setActualBackgroundColor:(id)a3
{
  p_actualBackgroundColor = &self->_actualBackgroundColor;
  id v6 = a3;
  if ((-[UIColor isEqual:](*p_actualBackgroundColor, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_actualBackgroundColor, a3);
    [(VMRoundButton *)self setBackgroundColor:*p_actualBackgroundColor];
  }
}

- (void)setActualTintColor:(id)a3
{
  p_actualTintColor = &self->_actualTintColor;
  id v6 = a3;
  if ((-[UIColor isEqual:](*p_actualTintColor, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_actualTintColor, a3);
    [(VMRoundButton *)self setTintColor:*p_actualTintColor];
  }
}

- (void)_updateButtonState
{
  unint64_t v3 = [(VMRoundButton *)self type];
  if (v3 - 3 < 2)
  {
    if (![(VMRoundButton *)self isSelected])
    {
      double v8 = +[UIColor systemLightGrayColor];
      [(VMRoundButton *)self setBackgroundColor:v8];

      uint64_t v6 = +[UIColor systemRedColor];
      goto LABEL_11;
    }
    uint64_t v4 = +[UIColor systemRedColor];
  }
  else
  {
    if (v3 - 1 > 1) {
      return;
    }
    if (![(VMRoundButton *)self isSelected])
    {
      uint64_t v7 = +[UIColor systemLightGrayColor];
      [(VMRoundButton *)self setBackgroundColor:v7];

      uint64_t v6 = +[UIColor systemBlueColor];
      goto LABEL_11;
    }
    uint64_t v4 = +[UIColor systemBlueColor];
  }
  v5 = (void *)v4;
  [(VMRoundButton *)self setBackgroundColor:v4];

  uint64_t v6 = +[UIColor systemWhiteColor];
LABEL_11:
  id v9 = (id)v6;
  [(VMRoundButton *)self setTintColor:v6];
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (UIColor)actualBackgroundColor
{
  return self->_actualBackgroundColor;
}

- (UIColor)actualTintColor
{
  return self->_actualTintColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actualTintColor, 0);

  objc_storeStrong((id *)&self->_actualBackgroundColor, 0);
}

@end