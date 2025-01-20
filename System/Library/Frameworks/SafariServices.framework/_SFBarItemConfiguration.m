@interface _SFBarItemConfiguration
- (BOOL)hasImage;
- (BOOL)isEnabled;
- (BOOL)isHidden;
- (BOOL)isSelected;
- (NSAttributedString)attributedTitle;
- (NSString)title;
- (UIImage)image;
- (UIMenu)menu;
- (_SFBarItemConfiguration)init;
- (void)setAttributedTitle:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setHidden:(BOOL)a3;
- (void)setImage:(id)a3;
- (void)setMenu:(id)a3;
- (void)setSelected:(BOOL)a3;
- (void)setTitle:(id)a3;
@end

@implementation _SFBarItemConfiguration

- (void)setHidden:(BOOL)a3
{
  self->_hidden = a3;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (void)setAttributedTitle:(id)a3
{
}

- (_SFBarItemConfiguration)init
{
  v6.receiver = self;
  v6.super_class = (Class)_SFBarItemConfiguration;
  v2 = [(_SFBarItemConfiguration *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_enabled = 1;
    v4 = v2;
  }

  return v3;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (UIMenu)menu
{
  return self->_menu;
}

- (BOOL)isHidden
{
  return self->_hidden;
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (BOOL)hasImage
{
  return self->_hasImage;
}

- (void)setMenu:(id)a3
{
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
  self->_hasImage = 1;
}

- (void)setSelected:(BOOL)a3
{
  self->_selected = a3;
}

- (NSAttributedString)attributedTitle
{
  return self->_attributedTitle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributedTitle, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_title, 0);

  objc_storeStrong((id *)&self->_menu, 0);
}

@end