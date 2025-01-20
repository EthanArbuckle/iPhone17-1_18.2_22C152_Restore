@interface HMFLocationAuthorizationMarkOperation
@end

@implementation HMFLocationAuthorizationMarkOperation

uint64_t __54____HMFLocationAuthorizationMarkOperation_logCategory__block_invoke()
{
  qword_1EB4EEC60 = HMFCreateOSLogHandle(@"Location.Authorization.Mark", @"com.apple.HMFoundation");
  return MEMORY[0x1F41817F8]();
}

@end