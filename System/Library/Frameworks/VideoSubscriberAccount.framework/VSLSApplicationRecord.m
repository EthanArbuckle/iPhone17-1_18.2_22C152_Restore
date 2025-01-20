@interface VSLSApplicationRecord
+ (BOOL)isAppStoreVendableForBundleIdentifier:(id)a3;
+ (BOOL)isDeletableForBundleIdentifier:(id)a3;
@end

@implementation VSLSApplicationRecord

+ (BOOL)isAppStoreVendableForBundleIdentifier:(id)a3
{
  v3 = (objc_class *)MEMORY[0x1E4F223C8];
  id v4 = a3;
  v5 = (void *)[[v3 alloc] initWithBundleIdentifier:v4 allowPlaceholder:0 error:0];

  LOBYTE(v4) = [v5 isAppStoreVendable];
  return (char)v4;
}

+ (BOOL)isDeletableForBundleIdentifier:(id)a3
{
  v3 = (objc_class *)MEMORY[0x1E4F223C8];
  id v4 = a3;
  v5 = (void *)[[v3 alloc] initWithBundleIdentifier:v4 allowPlaceholder:0 error:0];

  LOBYTE(v4) = [v5 isDeletable];
  return (char)v4;
}

@end