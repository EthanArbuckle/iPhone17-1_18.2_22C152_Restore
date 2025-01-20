@interface MediaControlsExpandableButtonOption
- (BOOL)isEnabled;
- (MRUAsset)asset;
- (MediaControlsExpandableButtonOption)init;
- (NSString)selectedState;
- (NSString)title;
- (UIColor)selectedBackgroundColor;
- (id)description;
- (id)identifier;
- (int64_t)selectedBackground;
- (void)setAsset:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setSelectedBackground:(int64_t)a3;
- (void)setSelectedBackgroundColor:(id)a3;
- (void)setSelectedState:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation MediaControlsExpandableButtonOption

- (MediaControlsExpandableButtonOption)init
{
  v3.receiver = self;
  v3.super_class = (Class)MediaControlsExpandableButtonOption;
  result = [(MediaControlsExpandableButtonOption *)&v3 init];
  if (result) {
    result->_enabled = 1;
  }
  return result;
}

- (id)description
{
  objc_super v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(MediaControlsExpandableButtonOption *)self identifier];
  v6 = [v3 stringWithFormat:@"<%@: %p identifer: %@ | asset: %@ | title: %@ | state: %@>", v4, self, v5, self->_asset, self->_title, self->_selectedState];

  return v6;
}

- (id)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (MRUAsset)asset
{
  return self->_asset;
}

- (void)setAsset:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)selectedState
{
  return self->_selectedState;
}

- (void)setSelectedState:(id)a3
{
}

- (UIColor)selectedBackgroundColor
{
  return self->_selectedBackgroundColor;
}

- (void)setSelectedBackgroundColor:(id)a3
{
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (int64_t)selectedBackground
{
  return self->_selectedBackground;
}

- (void)setSelectedBackground:(int64_t)a3
{
  self->_selectedBackground = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedBackgroundColor, 0);
  objc_storeStrong((id *)&self->_selectedState, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_asset, 0);

  objc_storeStrong(&self->_identifier, 0);
}

@end