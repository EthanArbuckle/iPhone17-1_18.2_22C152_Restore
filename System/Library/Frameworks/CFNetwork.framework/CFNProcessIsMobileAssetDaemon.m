@interface CFNProcessIsMobileAssetDaemon
@end

@implementation CFNProcessIsMobileAssetDaemon

uint64_t ____CFNProcessIsMobileAssetDaemon_block_invoke()
{
  uint64_t result = _CFGetProgname();
  if (result)
  {
    uint64_t result = *(void *)result;
    if (result)
    {
      uint64_t result = strcmp((const char *)result, "mobileassetd");
      __CFNProcessIsMobileAssetDaemon::uint64_t result = result == 0;
    }
  }
  return result;
}

@end