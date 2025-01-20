@interface AVTAvatarActionButton
+ (id)buttonWithAction:(id)a3;
+ (id)defaultButtonWithAction:(id)a3;
+ (id)destructiveButtonWithAction:(id)a3;
- (AVTAvatarActionButton)initWithFrame:(CGRect)a3;
- (BOOL)isDestructive;
- (void)setHighlighted:(BOOL)a3;
- (void)setIsDestructive:(BOOL)a3;
@end

@implementation AVTAvatarActionButton

+ (id)buttonWithAction:(id)a3
{
  return +[AVTAvatarActionButton buttonWithType:0 primaryAction:a3];
}

+ (id)defaultButtonWithAction:(id)a3
{
  v3 = +[AVTAvatarActionButton buttonWithAction:a3];
  v4 = +[AVTUIFontRepository avatarActionButtonTitleFont];
  v5 = [v3 titleLabel];
  [v5 setFont:v4];

  return v3;
}

+ (id)destructiveButtonWithAction:(id)a3
{
  v3 = +[AVTAvatarActionButton buttonWithAction:a3];
  v4 = +[AVTUIFontRepository avatarActionButtonTitleFont];
  v5 = [v3 titleLabel];
  [v5 setFont:v4];

  [v3 setIsDestructive:1];
  return v3;
}

- (AVTAvatarActionButton)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)AVTAvatarActionButton;
  v3 = -[AVTAvatarActionButton initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = +[AVTUIColorRepository actionButtonBackgroundColor];
    [(AVTAvatarActionButton *)v3 setBackgroundColor:v4];

    v5 = +[AVTUIColorRepository actionButtonTextColor];
    [(AVTAvatarActionButton *)v3 setTitleColor:v5 forState:0];

    [(AVTAvatarActionButton *)v3 _setContinuousCornerRadius:8.0];
  }
  return v3;
}

- (void)setIsDestructive:(BOOL)a3
{
  if (self->_isDestructive != a3)
  {
    self->_isDestructive = a3;
    if (a3) {
      +[AVTUIColorRepository actionButtonDestructiveTextColor];
    }
    else {
    id v4 = +[AVTUIColorRepository actionButtonTextColor];
    }
    [(AVTAvatarActionButton *)self setTitleColor:v4 forState:0];
  }
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)AVTAvatarActionButton;
  -[AVTAvatarActionButton setHighlighted:](&v7, sel_setHighlighted_);
  if (v3) {
    double v5 = 0.2;
  }
  else {
    double v5 = 1.0;
  }
  v6 = [(AVTAvatarActionButton *)self titleLabel];
  [v6 setAlpha:v5];
}

- (BOOL)isDestructive
{
  return self->_isDestructive;
}

@end