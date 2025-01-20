@interface HMAccessoryAdvertisementInfo
- (HMAccessoryAdvertisementInfo)initWithAccessoryIdentifier:(id)a3;
- (NSString)deviceIdentifier;
@end

@implementation HMAccessoryAdvertisementInfo

- (void).cxx_destruct
{
}

- (NSString)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (HMAccessoryAdvertisementInfo)initWithAccessoryIdentifier:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMAccessoryAdvertisementInfo;
  v5 = [(HMAccessoryAdvertisementInfo *)&v9 init];
  if (v5)
  {
    uint64_t v6 = objc_msgSend(MEMORY[0x1E4F654E8], "hmf_cachedInstanceForString:", v4);
    deviceIdentifier = v5->_deviceIdentifier;
    v5->_deviceIdentifier = (NSString *)v6;
  }
  return v5;
}

@end