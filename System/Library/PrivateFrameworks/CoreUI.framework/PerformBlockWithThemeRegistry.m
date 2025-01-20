@interface PerformBlockWithThemeRegistry
@end

@implementation PerformBlockWithThemeRegistry

NSMapTable *____PerformBlockWithThemeRegistry_block_invoke()
{
  long long v0 = *(_OWORD *)&NSIntegerMapKeyCallBacks.retain;
  *(_OWORD *)&keyCallBacks.hash = *(_OWORD *)&NSIntegerMapKeyCallBacks.hash;
  *(_OWORD *)&keyCallBacks.retain = v0;
  *(_OWORD *)&keyCallBacks.describe = *(_OWORD *)&NSIntegerMapKeyCallBacks.describe;
  NSMapTableValueCallBacks v2 = NSObjectMapValueCallBacks;
  result = NSCreateMapTable(&keyCallBacks, &v2, 0);
  __PerformBlockWithThemeRegistry___themeRegistry = (uint64_t)result;
  __PerformBlockWithThemeRegistry___lock = 0;
  return result;
}

@end