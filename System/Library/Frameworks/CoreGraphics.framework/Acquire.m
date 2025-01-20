@interface Acquire
@end

@implementation Acquire

const void *__ripr_Acquire_block_invoke()
{
  return get_BOOLean_property("RIP_AALINE_ENABLE", (const void *(*)(const char *))copy_local_domain_value, (BOOL *)&should_use_aaline);
}

@end