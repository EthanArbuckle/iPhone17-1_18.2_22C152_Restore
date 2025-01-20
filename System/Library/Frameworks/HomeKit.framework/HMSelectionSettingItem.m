@interface HMSelectionSettingItem
+ (BOOL)supportsSecureCoding;
- (NSString)localizedTitle;
- (NSString)title;
- (NSUUID)identifier;
@end

@implementation HMSelectionSettingItem

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedTitle, 0);
  objc_storeStrong((id *)&self->_title, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (NSString)localizedTitle
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)title
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end