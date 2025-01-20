@interface CXCallDirectoryStoreIdentificationEntry
- (NSString)extensionBundleIdentifier;
- (NSString)localizedLabel;
- (void)setExtensionBundleIdentifier:(id)a3;
- (void)setLocalizedLabel:(id)a3;
@end

@implementation CXCallDirectoryStoreIdentificationEntry

- (NSString)extensionBundleIdentifier
{
  return self->_extensionBundleIdentifier;
}

- (void)setExtensionBundleIdentifier:(id)a3
{
}

- (NSString)localizedLabel
{
  return self->_localizedLabel;
}

- (void)setLocalizedLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedLabel, 0);

  objc_storeStrong((id *)&self->_extensionBundleIdentifier, 0);
}

@end