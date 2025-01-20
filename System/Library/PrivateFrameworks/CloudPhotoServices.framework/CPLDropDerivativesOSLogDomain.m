@interface CPLDropDerivativesOSLogDomain
@end

@implementation CPLDropDerivativesOSLogDomain

uint64_t ____CPLDropDerivativesOSLogDomain_block_invoke()
{
  v0 = (const char *)_CPLOSLogSubsystem();
  __CPLDropDerivativesOSLogDomain_result = (uint64_t)os_log_create(v0, "cloudphotoservices.dropderivatives");

  return MEMORY[0x1F41817F8]();
}

@end