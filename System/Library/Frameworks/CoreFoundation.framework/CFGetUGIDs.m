@interface CFGetUGIDs
@end

@implementation CFGetUGIDs

uint64_t ____CFGetUGIDs_block_invoke()
{
  v1[1] = *(void *)off_1ECE0A5B0;
  v1[0] = 0;
  if (pthread_getugid_np((uid_t *)v1, (gid_t *)v1 + 1))
  {
    LODWORD(v1[0]) = geteuid();
    HIDWORD(v1[0]) = getegid();
  }
  return v1[0];
}

uint64_t ____CFGetUGIDs_block_invoke_2(uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  __CFGetUGIDs_cachedUGIDs = result;
  return result;
}

@end