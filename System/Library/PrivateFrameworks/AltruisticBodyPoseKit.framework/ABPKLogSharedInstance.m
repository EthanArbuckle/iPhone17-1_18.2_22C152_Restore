@interface ABPKLogSharedInstance
@end

@implementation ABPKLogSharedInstance

void ____ABPKLogSharedInstance_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.abpkalgorithm", "ABPKAlgorithm");
  v1 = (void *)sharedInstance;
  sharedInstance = (uint64_t)v0;
}

@end