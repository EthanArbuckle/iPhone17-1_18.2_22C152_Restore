@interface LPTapToLoadViewStyle
- (LPPointUnit)height;
- (LPPointUnit)width;
- (LPTapToLoadViewStyle)initWithPlatform:(int64_t)a3 sizeClass:(unint64_t)a4 fontScalingFactor:(double)a5;
- (LPTextViewStyle)caption;
- (UIColor)backgroundColor;
- (UIColor)tapHighlightColor;
- (void)setBackgroundColor:(id)a3;
- (void)setHeight:(id)a3;
- (void)setTapHighlightColor:(id)a3;
- (void)setWidth:(id)a3;
@end

@implementation LPTapToLoadViewStyle

- (LPTapToLoadViewStyle)initWithPlatform:(int64_t)a3 sizeClass:(unint64_t)a4 fontScalingFactor:(double)a5
{
  v27.receiver = self;
  v27.super_class = (Class)LPTapToLoadViewStyle;
  v8 = [(LPTapToLoadViewStyle *)&v27 init];
  if (v8)
  {
    uint64_t v9 = +[LPResources linkMediaBackgroundColor];
    backgroundColor = v8->_backgroundColor;
    v8->_backgroundColor = (UIColor *)v9;

    uint64_t v11 = +[LPResources tapToLoadHighlightColor];
    tapHighlightColor = v8->_tapHighlightColor;
    v8->_tapHighlightColor = (UIColor *)v11;

    v13 = [[LPTextViewStyle alloc] initWithPlatform:a3 fontScalingFactor:a5];
    caption = v8->_caption;
    v8->_caption = v13;

    v15 = bottomCaptionFont(a3, a4);
    [(LPTextViewStyle *)v8->_caption setFont:v15];

    v16 = [MEMORY[0x1E4FB1618] linkColor];
    [(LPTextViewStyle *)v8->_caption setColor:v16];

    [(LPTextViewStyle *)v8->_caption setMaximumLines:0];
    [(LPTextViewStyle *)v8->_caption setTextAlignment:2];
    v17 = [[LPPointUnit alloc] initWithValue:12.0];
    v18 = [(LPTextViewStyle *)v8->_caption padding];
    [v18 setLeading:v17];

    v19 = [[LPPointUnit alloc] initWithValue:12.0];
    v20 = [(LPTextViewStyle *)v8->_caption padding];
    [v20 setTrailing:v19];

    v21 = [[LPPointUnit alloc] initWithValue:a5 * 160.0];
    width = v8->_width;
    v8->_width = v21;

    v23 = [[LPPointUnit alloc] initWithValue:a5 * 80.0];
    height = v8->_height;
    v8->_height = v23;

    v25 = v8;
  }

  return v8;
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
}

- (UIColor)tapHighlightColor
{
  return self->_tapHighlightColor;
}

- (void)setTapHighlightColor:(id)a3
{
}

- (LPTextViewStyle)caption
{
  return self->_caption;
}

- (LPPointUnit)width
{
  return self->_width;
}

- (void)setWidth:(id)a3
{
}

- (LPPointUnit)height
{
  return self->_height;
}

- (void)setHeight:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_height, 0);
  objc_storeStrong((id *)&self->_width, 0);
  objc_storeStrong((id *)&self->_caption, 0);
  objc_storeStrong((id *)&self->_tapHighlightColor, 0);

  objc_storeStrong((id *)&self->_backgroundColor, 0);
}

@end