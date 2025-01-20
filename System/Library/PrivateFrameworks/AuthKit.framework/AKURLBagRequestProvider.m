@interface AKURLBagRequestProvider
- (AKURLBagRequestProvider)initWithAltDSID:(id)a3 urlSwitchData:(id)a4;
- (NSString)altDSID;
- (NSString)urlSwitchData;
- (id)_bagURLForAltDSID:(id)a3;
- (id)newBagURLRequest;
- (void)setAltDSID:(id)a3;
- (void)setUrlSwitchData:(id)a3;
@end

@implementation AKURLBagRequestProvider

- (AKURLBagRequestProvider)initWithAltDSID:(id)a3 urlSwitchData:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)AKURLBagRequestProvider;
  v8 = [(AKURLBagRequestProvider *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(AKURLBagRequestProvider *)v8 setAltDSID:v6];
    [(AKURLBagRequestProvider *)v9 setUrlSwitchData:v7];
  }

  return v9;
}

- (id)_bagURLForAltDSID:(id)a3
{
  if (a3)
  {
    v3 = +[NSString stringWithFormat:@"%@/%@", @"https://gsa.apple.com/grandslam/GsService2/lookup/v2", a3];
    v4 = +[NSURL URLWithString:v3];
  }
  else
  {
    v4 = +[NSURL URLWithString:@"https://gsa.apple.com/grandslam/GsService2/lookup/v2"];
  }

  return v4;
}

- (id)newBagURLRequest
{
  v3 = [(AKURLBagRequestProvider *)self _bagURLForAltDSID:self->_altDSID];
  if (self->_urlSwitchData)
  {
    v4 = +[NSURLComponents componentsWithURL:v3 resolvingAgainstBaseURL:0];
    id v5 = [objc_alloc((Class)NSURLQueryItem) initWithName:@"idata" value:self->_urlSwitchData];
    id v10 = v5;
    id v6 = +[NSArray arrayWithObjects:&v10 count:1];
    [v4 setQueryItems:v6];

    uint64_t v7 = [v4 URL];

    v3 = (void *)v7;
  }
  id v8 = [objc_alloc((Class)NSMutableURLRequest) initWithURL:v3];
  objc_msgSend(v8, "ak_addClientInfoHeader");
  objc_msgSend(v8, "ak_addCountryHeader");
  objc_msgSend(v8, "ak_addDeviceUDIDHeader");
  objc_msgSend(v8, "ak_addInternalBuildHeader");
  objc_msgSend(v8, "ak_addSeedBuildHeader");
  objc_msgSend(v8, "ak_addFeatureMaskHeader");
  objc_msgSend(v8, "ak_addLocaleHeader");
  objc_msgSend(v8, "ak_addTimeZoneHeaders");
  objc_msgSend(v8, "ak_addSKUCountryHeader");
  objc_msgSend(v8, "ak_addExperimentModeHeader");

  return v8;
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (void)setAltDSID:(id)a3
{
}

- (NSString)urlSwitchData
{
  return self->_urlSwitchData;
}

- (void)setUrlSwitchData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlSwitchData, 0);

  objc_storeStrong((id *)&self->_altDSID, 0);
}

@end