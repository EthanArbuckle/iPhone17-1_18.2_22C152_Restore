@interface NSSoftLinkFileProvider
@end

@implementation NSSoftLinkFileProvider

void *___NSSoftLinkFileProvider_block_invoke()
{
  result = dlopen("/System/Library/Frameworks/FileProvider.framework/FileProvider", 256);
  if (result)
  {
    v1 = result;
    off_1EB1ECEA0 = (uint64_t (*)(void, void))dlsym(result, "FPFileProviderMessageInterfacesForItemAtURL");
    off_1EB1ECEB8 = (uint64_t (*)(void, void))dlsym(v1, "FPFileProviderFetchProxyFactoryEndpointForMessageInterface");
    off_1EB1ECEA8 = (uint64_t (*)(void, void, void))dlsym(v1, "FPFetchServiceEndpointCreatorForItemAtURL");
    off_1EB1ECEB0 = (uint64_t (*)(void, void, void, void))dlsym(v1, "FPFetchServiceEndpointCreatorByNameForItemAtURL");
    off_1EB1ECE48 = (uint64_t (*)(void, void))dlsym(v1, "FPStartDownloadingItemAtURL");
    result = dlsym(v1, "FPEvictItemAtURL");
    off_1EB1ECE60 = (uint64_t (*)(void, void))result;
  }
  return result;
}

@end