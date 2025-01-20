@interface CPLProxyPushSessionOSLogDomain
@end

@implementation CPLProxyPushSessionOSLogDomain

uint64_t ____CPLProxyPushSessionOSLogDomain_block_invoke()
{
  v0 = _CPLOSLogSubsystem();
  __CPLProxyPushSessionOSLogDomain_result = (uint64_t)os_log_create(v0, "client.session.push.proxy");
  return MEMORY[0x1F41817F8]();
}

@end