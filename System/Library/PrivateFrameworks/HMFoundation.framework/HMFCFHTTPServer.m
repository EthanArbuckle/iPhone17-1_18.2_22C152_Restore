@interface HMFCFHTTPServer
@end

@implementation HMFCFHTTPServer

uint64_t __31___HMFCFHTTPServer_logCategory__block_invoke()
{
  qword_1EB4EEA00 = HMFCreateOSLogHandle(@"Networking.HTTP.Server.Internal", @"com.apple.HMFoundation");
  return MEMORY[0x1F41817F8]();
}

@end