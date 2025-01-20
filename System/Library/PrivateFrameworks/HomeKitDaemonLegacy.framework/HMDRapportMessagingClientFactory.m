@interface HMDRapportMessagingClientFactory
- (id)newCompanionLinkClient;
- (id)newCompanionLinkDevice;
- (id)newRapportDeviceClientWrapperWithClient:(id)a3;
@end

@implementation HMDRapportMessagingClientFactory

- (id)newRapportDeviceClientWrapperWithClient:(id)a3
{
  id v3 = a3;
  v4 = [[HMDRapportDeviceClientWrapper alloc] initWithClient:v3];

  return v4;
}

- (id)newCompanionLinkDevice
{
  return objc_alloc_init(MEMORY[0x1E4F946E8]);
}

- (id)newCompanionLinkClient
{
  return objc_alloc_init(MEMORY[0x1E4F946E0]);
}

@end