@interface LSBundleRecord
- (BOOL)mb_isContainerized;
- (id)mb_bundleURL;
- (id)mb_entitlements;
@end

@implementation LSBundleRecord

- (BOOL)mb_isContainerized
{
  v2 = [(LSBundleRecord *)self dataContainerURL];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)mb_bundleURL
{
  return [(LSBundleRecord *)self URL];
}

- (id)mb_entitlements
{
  v2 = [(LSBundleRecord *)self compatibilityObject];
  BOOL v3 = [v2 entitlements];

  return v3;
}

@end