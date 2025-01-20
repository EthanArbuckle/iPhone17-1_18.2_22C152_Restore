@interface GEOSiriSyncHandlerHelper
- (GEOSiriSyncHandlerHelper)init;
- (NSArray)additionalEnabledMarkets;
- (NSData)clientMetadata;
- (NSString)manifestEnvironment;
- (NSString)postAnchor;
- (void)notifySiriIfNecessary;
@end

@implementation GEOSiriSyncHandlerHelper

- (GEOSiriSyncHandlerHelper)init
{
  v14.receiver = self;
  v14.super_class = (Class)GEOSiriSyncHandlerHelper;
  v2 = [(GEOSiriSyncHandlerHelper *)&v14 init];
  if (v2)
  {
    v3 = +[GEOAdditionalEnabledMarkets additionalEnabledMarkets];
    [v3 reload];
    uint64_t v4 = [v3 transitMarkets];
    additionalEnabledMarkets = v2->_additionalEnabledMarkets;
    v2->_additionalEnabledMarkets = (NSArray *)v4;

    v6 = objc_alloc_init(GEOResourceManifestConfiguration);
    v7 = [(GEOResourceManifestConfiguration *)v6 environment];
    uint64_t v8 = [v7 copy];
    manifestEnvironment = v2->_manifestEnvironment;
    v2->_manifestEnvironment = (NSString *)v8;

    v10 = +[GEOMapService sharedService];
    uint64_t v11 = [v10 serializedClientMetadataForSiri];
    clientMetadata = v2->_clientMetadata;
    v2->_clientMetadata = (NSData *)v11;
  }
  return v2;
}

- (void)notifySiriIfNecessary
{
  _getValue(GeoServicesConfig_PreviousSiriSyncAnchor, (uint64_t)off_1E9115058, 1, 0, 0, 0);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  v3 = [(GEOSiriSyncHandlerHelper *)self postAnchor];
  char v4 = [v6 isEqualToString:v3];

  if ((v4 & 1) == 0)
  {
    v5 = [(GEOSiriSyncHandlerHelper *)self postAnchor];
    _setValue(GeoServicesConfig_PreviousSiriSyncAnchor, (uint64_t)off_1E9115058, v5, 1, 0);

    notify_post("com.apple.geoservices.siri_data_changed");
  }
}

- (NSString)postAnchor
{
  uint64_t v3 = [(GEOSiriSyncHandlerHelper *)self manifestEnvironment];
  char v4 = (void *)v3;
  v5 = &stru_1ED51F370;
  if (v3) {
    id v6 = (__CFString *)v3;
  }
  else {
    id v6 = &stru_1ED51F370;
  }
  v7 = v6;

  uint64_t v8 = [(GEOSiriSyncHandlerHelper *)self additionalEnabledMarkets];
  if (v8)
  {
    v9 = [(GEOSiriSyncHandlerHelper *)self additionalEnabledMarkets];
    v5 = [v9 componentsJoinedByString:@"__"];
  }
  v10 = [(__CFString *)v7 stringByAppendingString:v5];
  uint64_t v11 = [(GEOSiriSyncHandlerHelper *)self clientMetadata];
  v12 = [v11 base64EncodedStringWithOptions:0];

  if (v12)
  {
    uint64_t v13 = [v10 stringByAppendingString:v12];

    v10 = (void *)v13;
  }

  return (NSString *)v10;
}

- (NSString)manifestEnvironment
{
  return self->_manifestEnvironment;
}

- (NSData)clientMetadata
{
  return self->_clientMetadata;
}

- (NSArray)additionalEnabledMarkets
{
  return self->_additionalEnabledMarkets;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientMetadata, 0);
  objc_storeStrong((id *)&self->_manifestEnvironment, 0);

  objc_storeStrong((id *)&self->_additionalEnabledMarkets, 0);
}

@end