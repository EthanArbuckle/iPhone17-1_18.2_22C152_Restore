@interface ODRBundleTagManifest
- (ODRBundleTagManifest)init;
@end

@implementation ODRBundleTagManifest

- (ODRBundleTagManifest)init
{
  return (ODRBundleTagManifest *)sub_1003E0524(self, &__NSDictionary0__struct);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastModified, 0);
  objc_storeStrong((id *)&self->_dictionary, 0);
}

@end