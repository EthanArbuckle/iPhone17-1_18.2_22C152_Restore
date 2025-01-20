@interface CPLCloudPhotoServicesOSLogDomain
@end

@implementation CPLCloudPhotoServicesOSLogDomain

uint64_t ____CPLCloudPhotoServicesOSLogDomain_block_invoke()
{
  v0 = (const char *)_CPLOSLogSubsystem();
  __CPLCloudPhotoServicesOSLogDomain_result = (uint64_t)os_log_create(v0, "cloudphotoservices");

  return MEMORY[0x1F41817F8]();
}

@end