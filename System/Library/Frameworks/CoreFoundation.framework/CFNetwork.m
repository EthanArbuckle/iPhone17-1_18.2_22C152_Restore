@interface CFNetwork
@end

@implementation CFNetwork

void *____CFNetwork__CFURLCreateDataAndPropertiesFromResource_block_invoke()
{
  result = __CFLookupCFNetworkFunction("_CFURLCreateDataAndPropertiesFromResource");
  __CFNetwork__CFURLCreateDataAndPropertiesFromResource_dyfunc = (uint64_t (*)(void, void, void, void, void, void))result;
  return result;
}

void *____CFNetwork__CFURLWriteDataAndPropertiesToResource_block_invoke()
{
  result = __CFLookupCFNetworkFunction("_CFURLWriteDataAndPropertiesToResource");
  __CFNetwork__CFURLWriteDataAndPropertiesToResource_dyfunc = result;
  return result;
}

void *____CFNetwork__CFURLDestroyResource_block_invoke()
{
  result = __CFLookupCFNetworkFunction("_CFURLDestroyResource");
  __CFNetwork__CFURLDestroyResource_dyfunc = (uint64_t (*)(void, void))result;
  return result;
}

@end