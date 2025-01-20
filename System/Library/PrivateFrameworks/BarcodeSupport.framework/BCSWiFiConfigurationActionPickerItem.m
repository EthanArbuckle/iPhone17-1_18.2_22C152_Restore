@interface BCSWiFiConfigurationActionPickerItem
- (UIImage)icon;
- (void)setIcon:(id)a3;
@end

@implementation BCSWiFiConfigurationActionPickerItem

- (UIImage)icon
{
  icon = self->_icon;
  if (icon)
  {
    v3 = icon;
  }
  else
  {
    v3 = [getUIImageClass() systemImageNamed:@"wifi"];
  }
  return v3;
}

- (void)setIcon:(id)a3
{
}

- (void).cxx_destruct
{
}

@end