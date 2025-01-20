@interface HMFLocationManagerOperation
@end

@implementation HMFLocationManagerOperation

uint64_t __44____HMFLocationManagerOperation_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle(@"Location.Authorization.Operation", @"com.apple.HMFoundation");
  uint64_t v1 = qword_1EB4EEBD0;
  qword_1EB4EEBD0 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end