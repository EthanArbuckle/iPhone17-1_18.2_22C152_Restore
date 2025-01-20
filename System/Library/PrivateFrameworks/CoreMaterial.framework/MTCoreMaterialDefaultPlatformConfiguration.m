@interface MTCoreMaterialDefaultPlatformConfiguration
- (NSString)blurEdgesOptimization;
- (NSURL)overrideRecipeBundleURL;
- (void)setOverrideRecipeBundleURL:(id)a3;
@end

@implementation MTCoreMaterialDefaultPlatformConfiguration

- (NSString)blurEdgesOptimization
{
  return (NSString *)@"inputNormalizeEdges";
}

- (NSURL)overrideRecipeBundleURL
{
  return self->_overrideRecipeBundleURL;
}

- (void)setOverrideRecipeBundleURL:(id)a3
{
}

- (void).cxx_destruct
{
}

@end