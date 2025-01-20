@interface ARLogTechnique
@end

@implementation ARLogTechnique

void ___ARLogTechnique_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.ARKit", "Technique");
  v1 = (void *)_ARLogTechnique_logObj;
  _ARLogTechnique_logObj = (uint64_t)v0;
}

@end