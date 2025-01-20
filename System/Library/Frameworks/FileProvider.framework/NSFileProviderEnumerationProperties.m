@interface NSFileProviderEnumerationProperties
- (NSArray)fileTypes;
- (NSDictionary)userInfo;
- (NSString)enumeratedItemIdentifier;
- (NSString)enumeratingApplicationBundleIdentifier;
- (void)setEnumeratedItemIdentifier:(id)a3;
- (void)setEnumeratingApplicationBundleIdentifier:(id)a3;
- (void)setFileTypes:(id)a3;
- (void)setUserInfo:(id)a3;
@end

@implementation NSFileProviderEnumerationProperties

- (NSArray)fileTypes
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setFileTypes:(id)a3
{
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
}

- (NSString)enumeratingApplicationBundleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setEnumeratingApplicationBundleIdentifier:(id)a3
{
}

- (NSString)enumeratedItemIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setEnumeratedItemIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enumeratedItemIdentifier, 0);
  objc_storeStrong((id *)&self->_enumeratingApplicationBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);

  objc_storeStrong((id *)&self->_fileTypes, 0);
}

@end