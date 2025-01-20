@interface DDActionSuggestionsContext
- (NSString)bundleIdentifier;
- (NSString)coreSpotlightUniqueIdentifier;
- (void)setBundleIdentifier:(id)a3;
- (void)setCoreSpotlightUniqueIdentifier:(id)a3;
@end

@implementation DDActionSuggestionsContext

- (NSString)coreSpotlightUniqueIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setCoreSpotlightUniqueIdentifier:(id)a3
{
}

- (NSString)bundleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setBundleIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_coreSpotlightUniqueIdentifier, 0);
}

@end