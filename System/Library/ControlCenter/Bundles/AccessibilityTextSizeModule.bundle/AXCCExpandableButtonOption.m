@interface AXCCExpandableButtonOption
- (BOOL)supportsAnimation;
- (NSString)identifier;
- (NSString)packageName;
- (NSString)title;
- (UIColor)selectedBackgroundColor;
- (UIImage)image;
- (id)description;
- (int)correspondingState;
- (void)setCorrespondingState:(int)a3;
- (void)setIdentifier:(id)a3;
- (void)setImage:(id)a3;
- (void)setPackageName:(id)a3;
- (void)setSelectedBackgroundColor:(id)a3;
- (void)setSupportsAnimation:(BOOL)a3;
- (void)setTitle:(id)a3;
@end

@implementation AXCCExpandableButtonOption

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  uint64_t v8 = objc_msgSend_identifier(self, v5, v6, v7);
  v11 = (void *)v8;
  packageName = self->_packageName;
  if (self->_supportsAnimation) {
    objc_msgSend_stringWithFormat_(v3, v9, @"<%@: %p identifer=%@ packageName=%@ title=%@ animated=%@>", v10, v4, self, v8, packageName, self->_title, @"Yes");
  }
  else {
  v13 = objc_msgSend_stringWithFormat_(v3, v9, @"<%@: %p identifer=%@ packageName=%@ title=%@ animated=%@>", v10, v4, self, v8, packageName, self->_title, @"No");
  }

  return v13;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)packageName
{
  return self->_packageName;
}

- (void)setPackageName:(id)a3
{
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (UIColor)selectedBackgroundColor
{
  return self->_selectedBackgroundColor;
}

- (void)setSelectedBackgroundColor:(id)a3
{
}

- (BOOL)supportsAnimation
{
  return self->_supportsAnimation;
}

- (void)setSupportsAnimation:(BOOL)a3
{
  self->_supportsAnimation = a3;
}

- (int)correspondingState
{
  return self->_correspondingState;
}

- (void)setCorrespondingState:(int)a3
{
  self->_correspondingState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedBackgroundColor, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_packageName, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end