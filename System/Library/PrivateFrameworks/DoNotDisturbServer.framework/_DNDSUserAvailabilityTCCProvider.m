@interface _DNDSUserAvailabilityTCCProvider
- (id)userAvailabilityTCCApprovedBundleIds;
@end

@implementation _DNDSUserAvailabilityTCCProvider

- (id)userAvailabilityTCCApprovedBundleIds
{
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  v3 = (void *)TCCAccessCopyBundleIdentifiersForService();
  v4 = [v2 setWithArray:v3];

  return v4;
}

@end