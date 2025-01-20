@interface AVTUIStyle
+ (id)darkStyle;
+ (id)lightStyle;
- (UIColor)backgroundColor;
- (UIColor)textColor;
- (void)setBackgroundColor:(id)a3;
- (void)setTextColor:(id)a3;
@end

@implementation AVTUIStyle

+ (id)lightStyle
{
  v2 = objc_alloc_init(AVTUIStyle);
  v3 = [MEMORY[0x263F1C550] labelColor];
  [(AVTUIStyle *)v2 setTextColor:v3];

  v4 = [MEMORY[0x263F1C550] systemBackgroundColor];
  [(AVTUIStyle *)v2 setBackgroundColor:v4];

  return v2;
}

+ (id)darkStyle
{
  v2 = objc_alloc_init(AVTUIStyle);
  v3 = [MEMORY[0x263F1C550] clearColor];
  [(AVTUIStyle *)v2 setBackgroundColor:v3];

  v4 = [MEMORY[0x263F1C550] whiteColor];
  [(AVTUIStyle *)v2 setTextColor:v4];

  return v2;
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (void)setTextColor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
}

@end