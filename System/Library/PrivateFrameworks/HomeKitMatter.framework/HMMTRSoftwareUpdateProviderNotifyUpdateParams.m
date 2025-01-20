@interface HMMTRSoftwareUpdateProviderNotifyUpdateParams
- (HMMTRSoftwareUpdateProviderNotifyUpdateParams)initWithUpdateToken:(id)a3 softwareVersion:(id)a4 didTimeout:(id)a5;
- (HMMTRSoftwareUpdateProviderNotifyUpdateParams)initWithUpdateToken:(id)a3 softwareVersion:(id)a4 linkTypeForMetrics:(id)a5 previousSoftwareVersionNumberForMetrics:(id)a6 didTimeout:(id)a7;
- (NSData)updateToken;
- (NSNumber)didTimeout;
- (NSNumber)linkTypeForMetrics;
- (NSNumber)previousSoftwareVersionNumberForMetrics;
- (NSNumber)softwareVersion;
@end

@implementation HMMTRSoftwareUpdateProviderNotifyUpdateParams

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_didTimeout, 0);
  objc_storeStrong((id *)&self->_previousSoftwareVersionNumberForMetrics, 0);
  objc_storeStrong((id *)&self->_linkTypeForMetrics, 0);
  objc_storeStrong((id *)&self->_softwareVersion, 0);
  objc_storeStrong((id *)&self->_updateToken, 0);
}

- (NSNumber)didTimeout
{
  return (NSNumber *)objc_getProperty(self, a2, 40, 1);
}

- (NSNumber)previousSoftwareVersionNumberForMetrics
{
  return (NSNumber *)objc_getProperty(self, a2, 32, 1);
}

- (NSNumber)linkTypeForMetrics
{
  return (NSNumber *)objc_getProperty(self, a2, 24, 1);
}

- (NSNumber)softwareVersion
{
  return (NSNumber *)objc_getProperty(self, a2, 16, 1);
}

- (NSData)updateToken
{
  return (NSData *)objc_getProperty(self, a2, 8, 1);
}

- (HMMTRSoftwareUpdateProviderNotifyUpdateParams)initWithUpdateToken:(id)a3 softwareVersion:(id)a4 linkTypeForMetrics:(id)a5 previousSoftwareVersionNumberForMetrics:(id)a6 didTimeout:(id)a7
{
  id v20 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)HMMTRSoftwareUpdateProviderNotifyUpdateParams;
  v17 = [(HMMTRSoftwareUpdateProviderNotifyUpdateParams *)&v21 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_updateToken, a3);
    objc_storeStrong((id *)&v18->_softwareVersion, a4);
    objc_storeStrong((id *)&v18->_linkTypeForMetrics, a5);
    objc_storeStrong((id *)&v18->_previousSoftwareVersionNumberForMetrics, a6);
    objc_storeStrong((id *)&v18->_didTimeout, a7);
  }

  return v18;
}

- (HMMTRSoftwareUpdateProviderNotifyUpdateParams)initWithUpdateToken:(id)a3 softwareVersion:(id)a4 didTimeout:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HMMTRSoftwareUpdateProviderNotifyUpdateParams;
  v12 = [(HMMTRSoftwareUpdateProviderNotifyUpdateParams *)&v15 init];
  id v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_updateToken, a3);
    objc_storeStrong((id *)&v13->_softwareVersion, a4);
    objc_storeStrong((id *)&v13->_didTimeout, a5);
  }

  return v13;
}

@end