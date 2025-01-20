@interface GPU
@end

@implementation GPU

CFDictionaryRef __get_disable_GPU_provider_options_block_invoke()
{
  keys[1] = *(void **)MEMORY[0x1E4F143B8];
  keys[0] = @"kCGImagePreferGPUForColorConversion";
  values = (void *)*MEMORY[0x1E4F1CFC8];
  CFDictionaryRef result = CFDictionaryCreate(0, (const void **)keys, (const void **)&values, 1, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  get_disable_GPU_provider_options_options_singleton = (uint64_t)result;
  return result;
}

@end