@interface _UIToolbarConfiguration
- (BOOL)isTranslucent;
- (UIColor)backgroundColor;
- (UIColor)barTintColor;
- (UIImage)backgroundImage;
- (UIImage)shadowImage;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)barStyle;
- (void)setBackgroundColor:(id)a3;
- (void)setBackgroundImage:(id)a3;
- (void)setBarStyle:(int64_t)a3;
- (void)setBarTintColor:(id)a3;
- (void)setShadowImage:(id)a3;
- (void)setTranslucent:(BOOL)a3;
@end

@implementation _UIToolbarConfiguration

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  if (v4)
  {
    objc_msgSend(v4, "setBarStyle:", -[_UIToolbarConfiguration barStyle](self, "barStyle"));
    objc_msgSend(v4, "setTranslucent:", -[_UIToolbarConfiguration isTranslucent](self, "isTranslucent"));
    v5 = [(_UIToolbarConfiguration *)self shadowImage];
    [v4 setShadowImage:v5];

    v6 = [(_UIToolbarConfiguration *)self backgroundImage];
    [v4 setBackgroundImage:v6];

    v7 = [(_UIToolbarConfiguration *)self backgroundColor];
    [v4 setBackgroundColor:v7];

    v8 = [(_UIToolbarConfiguration *)self barTintColor];
    [v4 setBarTintColor:v8];
  }
  return v4;
}

- (int64_t)barStyle
{
  return self->_barStyle;
}

- (void)setBarStyle:(int64_t)a3
{
  self->_barStyle = a3;
}

- (BOOL)isTranslucent
{
  return self->_translucent;
}

- (void)setTranslucent:(BOOL)a3
{
  self->_translucent = a3;
}

- (UIImage)shadowImage
{
  return self->_shadowImage;
}

- (void)setShadowImage:(id)a3
{
}

- (UIImage)backgroundImage
{
  return self->_backgroundImage;
}

- (void)setBackgroundImage:(id)a3
{
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
}

- (UIColor)barTintColor
{
  return self->_barTintColor;
}

- (void)setBarTintColor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_barTintColor, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_backgroundImage, 0);

  objc_storeStrong((id *)&self->_shadowImage, 0);
}

@end