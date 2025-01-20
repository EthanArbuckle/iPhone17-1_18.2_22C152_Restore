@interface MUPlaceExtensionDiscoveryResult
- (GEOAppleMediaServicesResult)appStoreApp;
- (MUPlaceExtensionDiscoveryResult)initWithExtension:(id)a3 appStoreApp:(id)a4 vendorIdentifier:(id)a5;
- (NSString)vendorIdentifier;
- (_MXExtension)extension;
@end

@implementation MUPlaceExtensionDiscoveryResult

- (MUPlaceExtensionDiscoveryResult)initWithExtension:(id)a3 appStoreApp:(id)a4 vendorIdentifier:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)MUPlaceExtensionDiscoveryResult;
  v12 = [(MUPlaceExtensionDiscoveryResult *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_extension, a3);
    objc_storeStrong((id *)&v13->_appStoreApp, a4);
    objc_storeStrong((id *)&v13->_vendorIdentifier, a5);
  }

  return v13;
}

- (_MXExtension)extension
{
  return self->_extension;
}

- (GEOAppleMediaServicesResult)appStoreApp
{
  return self->_appStoreApp;
}

- (NSString)vendorIdentifier
{
  return self->_vendorIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vendorIdentifier, 0);
  objc_storeStrong((id *)&self->_appStoreApp, 0);
  objc_storeStrong((id *)&self->_extension, 0);
}

@end