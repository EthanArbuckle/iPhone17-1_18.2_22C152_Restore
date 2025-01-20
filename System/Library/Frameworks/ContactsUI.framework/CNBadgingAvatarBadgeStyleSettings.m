@interface CNBadgingAvatarBadgeStyleSettings
+ (id)doNotDisturbBadgeSettings;
+ (id)markedForSyndicationBadgeSettings;
+ (int64_t)cnuiBadgePosition:(int64_t)a3;
+ (unint64_t)cnuiBadgeCropStyle:(int64_t)a3;
- (BOOL)isEqual:(id)a3;
- (CNBadgingAvatarBadgeStyleSettings)init;
- (CNBadgingAvatarBadgeStyleSettings)initWithPosition:(int64_t)a3 color:(id)a4 backgroundColor:(id)a5 cropStyle:(int64_t)a6;
- (UIColor)backgroundColor;
- (UIColor)color;
- (int64_t)cnuiBadgePosition;
- (int64_t)contentMode;
- (int64_t)cropStyle;
- (int64_t)position;
- (unint64_t)cnuiCropStyle;
- (void)setBackgroundColor:(id)a3;
- (void)setColor:(id)a3;
- (void)setContentMode:(int64_t)a3;
- (void)setCropStyle:(int64_t)a3;
- (void)setPosition:(int64_t)a3;
@end

@implementation CNBadgingAvatarBadgeStyleSettings

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundColor, 0);

  objc_storeStrong((id *)&self->_color, 0);
}

- (void)setContentMode:(int64_t)a3
{
  self->_contentMode = a3;
}

- (int64_t)contentMode
{
  return self->_contentMode;
}

- (void)setCropStyle:(int64_t)a3
{
  self->_cropStyle = a3;
}

- (int64_t)cropStyle
{
  return self->_cropStyle;
}

- (void)setBackgroundColor:(id)a3
{
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setColor:(id)a3
{
}

- (UIColor)color
{
  return self->_color;
}

- (void)setPosition:(int64_t)a3
{
  self->_position = a3;
}

- (int64_t)position
{
  return self->_position;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CNBadgingAvatarBadgeStyleSettings *)a3;
  if (self == v4)
  {
    BOOL v7 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v7 = (objc_opt_isKindOfClass() & 1) != 0
      && ((color = self->_color, !((unint64_t)color | (unint64_t)v4->_color))
       || -[UIColor isEqual:](color, "isEqual:"))
      && ((backgroundColor = self->_backgroundColor,
           !((unint64_t)backgroundColor | (unint64_t)v4->_backgroundColor))
       || -[UIColor isEqual:](backgroundColor, "isEqual:"))
      && self->_position == v4->_position
      && self->_cropStyle == v4->_cropStyle;
  }

  return v7;
}

- (unint64_t)cnuiCropStyle
{
  v3 = objc_opt_class();
  int64_t v4 = [(CNBadgingAvatarBadgeStyleSettings *)self cropStyle];

  return [v3 cnuiBadgeCropStyle:v4];
}

- (int64_t)cnuiBadgePosition
{
  v3 = objc_opt_class();
  int64_t v4 = [(CNBadgingAvatarBadgeStyleSettings *)self position];

  return [v3 cnuiBadgePosition:v4];
}

- (CNBadgingAvatarBadgeStyleSettings)initWithPosition:(int64_t)a3 color:(id)a4 backgroundColor:(id)a5 cropStyle:(int64_t)a6
{
  id v11 = a4;
  id v12 = a5;
  v17.receiver = self;
  v17.super_class = (Class)CNBadgingAvatarBadgeStyleSettings;
  v13 = [(CNBadgingAvatarBadgeStyleSettings *)&v17 init];
  v14 = v13;
  if (v13)
  {
    v13->_position = a3;
    objc_storeStrong((id *)&v13->_color, a4);
    v14->_cropStyle = a6;
    objc_storeStrong((id *)&v14->_backgroundColor, a5);
    v14->_contentMode = 0;
    v15 = v14;
  }

  return v14;
}

- (CNBadgingAvatarBadgeStyleSettings)init
{
  v3 = [MEMORY[0x1E4FB1618] whiteColor];
  int64_t v4 = [(CNBadgingAvatarBadgeStyleSettings *)self initWithPosition:0 color:0 backgroundColor:v3 cropStyle:0];

  return v4;
}

+ (id)doNotDisturbBadgeSettings
{
  v2 = [CNBadgingAvatarBadgeStyleSettings alloc];
  v3 = [MEMORY[0x1E4FB1618] systemIndigoColor];
  int64_t v4 = [MEMORY[0x1E4FB1618] whiteColor];
  v5 = [(CNBadgingAvatarBadgeStyleSettings *)v2 initWithPosition:0 color:v3 backgroundColor:v4 cropStyle:0];

  [(CNBadgingAvatarBadgeStyleSettings *)v5 setContentMode:4];

  return v5;
}

+ (id)markedForSyndicationBadgeSettings
{
  v2 = [CNBadgingAvatarBadgeStyleSettings alloc];
  v3 = [MEMORY[0x1E4FB1618] colorWithRed:0.945098039 green:0.737254902 blue:0.28627451 alpha:1.0];
  int64_t v4 = [MEMORY[0x1E4FB1618] whiteColor];
  v5 = [(CNBadgingAvatarBadgeStyleSettings *)v2 initWithPosition:0 color:v3 backgroundColor:v4 cropStyle:0];

  return v5;
}

+ (unint64_t)cnuiBadgeCropStyle:(int64_t)a3
{
  return a3 != 0;
}

+ (int64_t)cnuiBadgePosition:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) >= 3) {
    return 0;
  }
  else {
    return a3;
  }
}

@end