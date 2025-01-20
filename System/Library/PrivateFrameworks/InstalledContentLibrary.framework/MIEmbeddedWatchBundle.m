@interface MIEmbeddedWatchBundle
- (BOOL)allowsAppleAppExtensionsNotInExtensionCache;
- (BOOL)isApplicableToKnownWatchOSVersion;
- (BOOL)isPlaceholder;
- (MIEmbeddedWatchBundle)initWithParentBundle:(id)a3 parentSubdirectory:(id)a4 bundleName:(id)a5 isPlaceholder:(BOOL)a6 error:(id *)a7;
- (id)currentOSVersionForValidationUsingPlatform:(unint64_t *)a3 withError:(id *)a4;
- (id)extensionKitBundlesPerformingPlatformValidation:(unsigned __int8)a3 withError:(id *)a4;
- (id)extensionKitBundlesWithError:(id *)a3;
- (id)pluginKitBundlesPerformingPlatformValidation:(unsigned __int8)a3 withError:(id *)a4;
- (id)pluginKitBundlesWithError:(id *)a3;
- (unsigned)bundleType;
@end

@implementation MIEmbeddedWatchBundle

- (unsigned)bundleType
{
  return 9;
}

- (BOOL)isApplicableToKnownWatchOSVersion
{
  return [(MIBundle *)self isApplicableToOSVersion:@"11.9999" error:0];
}

- (BOOL)isPlaceholder
{
  return self->_isPlaceholder;
}

- (MIEmbeddedWatchBundle)initWithParentBundle:(id)a3 parentSubdirectory:(id)a4 bundleName:(id)a5 isPlaceholder:(BOOL)a6 error:(id *)a7
{
  result = [(MIBundle *)self initWithParentBundle:a3 parentSubdirectory:a4 bundleName:a5 error:a7];
  if (result) {
    result->_isPlaceholder = a6;
  }
  return result;
}

- (id)currentOSVersionForValidationUsingPlatform:(unint64_t *)a3 withError:(id *)a4
{
  if (a3) {
    *a3 = 1;
  }
  return @"11.9999";
}

- (BOOL)allowsAppleAppExtensionsNotInExtensionCache
{
  return 1;
}

- (id)pluginKitBundlesWithError:(id *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MIEmbeddedWatchBundle;
  v3 = [(MIBundle *)&v5 pluginKitBundlesPerformingPlatformValidation:2 withError:a3];
  return v3;
}

- (id)pluginKitBundlesPerformingPlatformValidation:(unsigned __int8)a3 withError:(id *)a4
{
  v6.receiver = self;
  v6.super_class = (Class)MIEmbeddedWatchBundle;
  v4 = [(MIBundle *)&v6 pluginKitBundlesPerformingPlatformValidation:a3 & 2 withError:a4];
  return v4;
}

- (id)extensionKitBundlesWithError:(id *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MIEmbeddedWatchBundle;
  v3 = [(MIBundle *)&v5 extensionKitBundlesPerformingPlatformValidation:2 withError:a3];
  return v3;
}

- (id)extensionKitBundlesPerformingPlatformValidation:(unsigned __int8)a3 withError:(id *)a4
{
  v6.receiver = self;
  v6.super_class = (Class)MIEmbeddedWatchBundle;
  v4 = [(MIBundle *)&v6 extensionKitBundlesPerformingPlatformValidation:a3 & 2 withError:a4];
  return v4;
}

@end