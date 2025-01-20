@interface HMAccessoryLinkQualityResult
- (BOOL)supported;
- (HMAccessoryLinkQualityResult)initWithLinkQualitySupported:(BOOL)a3 linkLayerType:(unint64_t)a4 macAddress:(id)a5 networkName:(id)a6 linkQuality:(unint64_t)a7;
- (NSString)macAddress;
- (NSString)networkName;
- (unint64_t)linkLayerType;
- (unint64_t)linkQuality;
@end

@implementation HMAccessoryLinkQualityResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkName, 0);

  objc_storeStrong((id *)&self->_macAddress, 0);
}

- (unint64_t)linkQuality
{
  return self->_linkQuality;
}

- (NSString)networkName
{
  return self->_networkName;
}

- (NSString)macAddress
{
  return self->_macAddress;
}

- (unint64_t)linkLayerType
{
  return self->_linkLayerType;
}

- (BOOL)supported
{
  return self->_supported;
}

- (HMAccessoryLinkQualityResult)initWithLinkQualitySupported:(BOOL)a3 linkLayerType:(unint64_t)a4 macAddress:(id)a5 networkName:(id)a6 linkQuality:(unint64_t)a7
{
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)HMAccessoryLinkQualityResult;
  v15 = [(HMAccessoryLinkQualityResult *)&v18 init];
  v16 = v15;
  if (v15)
  {
    v15->_supported = a3;
    v15->_linkLayerType = a4;
    objc_storeStrong((id *)&v15->_macAddress, a5);
    objc_storeStrong((id *)&v16->_networkName, a6);
    v16->_linkQuality = a7;
  }

  return v16;
}

@end