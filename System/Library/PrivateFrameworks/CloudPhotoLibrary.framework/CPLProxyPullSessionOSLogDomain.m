@interface CPLProxyPullSessionOSLogDomain
@end

@implementation CPLProxyPullSessionOSLogDomain

uint64_t ____CPLProxyPullSessionOSLogDomain_block_invoke()
{
  v0 = _CPLOSLogSubsystem();
  __CPLProxyPullSessionOSLogDomain_result = (uint64_t)os_log_create(v0, "client.session.pull.proxy");
  return MEMORY[0x1F41817F8]();
}

@end