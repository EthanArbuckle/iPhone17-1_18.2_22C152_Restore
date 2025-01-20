@interface HMMTRSoftwareUpdateProviderApplyUpdateRequestParams
- (HMMTRSoftwareUpdateProviderApplyUpdateRequestParams)initWithUpdateToken:(id)a3 softwareVersion:(id)a4;
- (NSData)updateToken;
- (NSNumber)softwareVersion;
@end

@implementation HMMTRSoftwareUpdateProviderApplyUpdateRequestParams

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_softwareVersion, 0);
  objc_storeStrong((id *)&self->_updateToken, 0);
}

- (NSNumber)softwareVersion
{
  return (NSNumber *)objc_getProperty(self, a2, 16, 1);
}

- (NSData)updateToken
{
  return (NSData *)objc_getProperty(self, a2, 8, 1);
}

- (HMMTRSoftwareUpdateProviderApplyUpdateRequestParams)initWithUpdateToken:(id)a3 softwareVersion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMMTRSoftwareUpdateProviderApplyUpdateRequestParams;
  v9 = [(HMMTRSoftwareUpdateProviderApplyUpdateRequestParams *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_updateToken, a3);
    objc_storeStrong((id *)&v10->_softwareVersion, a4);
  }

  return v10;
}

@end