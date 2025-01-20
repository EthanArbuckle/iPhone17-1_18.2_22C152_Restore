@interface LSURLPropertyProviderAllKeys
@end

@implementation LSURLPropertyProviderAllKeys

void ___LSURLPropertyProviderAllKeys_block_invoke()
{
  if (getPropertyTable(void)::onceToken != -1) {
    dispatch_once(&getPropertyTable(void)::onceToken, &__block_literal_global_14);
  }
  v0 = (void *)LaunchServices::URLPropertyProvider::propertyTable;
  v1 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v0[1] - *v0) >> 3)];
  v2 = (void *)*v0;
  v3 = (void *)v0[1];
  for (id i = v1; v2 != v3; v1 = i)
  {
    [v1 addObject:*v2];
    v2 += 7;
  }
  uint64_t v4 = [v1 copy];
  v5 = (void *)_LSURLPropertyProviderAllKeys::result;
  _LSURLPropertyProviderAllKeys::result = v4;
}

@end