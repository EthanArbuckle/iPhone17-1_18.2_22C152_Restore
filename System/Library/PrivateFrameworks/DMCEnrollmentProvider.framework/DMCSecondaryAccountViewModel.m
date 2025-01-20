@interface DMCSecondaryAccountViewModel
- (ACAccount)account;
- (NSNumber)reauthBadgeNumber;
- (NSString)identifier;
- (NSString)reauthIdentifer;
- (NSString)reauthTitle;
- (NSString)subtitle;
- (NSString)title;
- (UIImage)icon;
- (void)setAccount:(id)a3;
- (void)setIcon:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setReauthBadgeNumber:(id)a3;
- (void)setReauthIdentifer:(id)a3;
- (void)setReauthTitle:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation DMCSecondaryAccountViewModel

- (ACAccount)account
{
  return (ACAccount *)objc_getProperty(self, a2, 8, 1);
}

- (void)setAccount:(id)a3
{
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)title
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setTitle:(id)a3
{
}

- (NSString)subtitle
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setSubtitle:(id)a3
{
}

- (UIImage)icon
{
  return (UIImage *)objc_getProperty(self, a2, 40, 1);
}

- (void)setIcon:(id)a3
{
}

- (NSString)reauthIdentifer
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setReauthIdentifer:(id)a3
{
}

- (NSString)reauthTitle
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setReauthTitle:(id)a3
{
}

- (NSNumber)reauthBadgeNumber
{
  return (NSNumber *)objc_getProperty(self, a2, 64, 1);
}

- (void)setReauthBadgeNumber:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reauthBadgeNumber, 0);
  objc_storeStrong((id *)&self->_reauthTitle, 0);
  objc_storeStrong((id *)&self->_reauthIdentifer, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end