@interface FigRouteDiscoveryManagerCopyRouteDescriptorsFromEndpointsAndAudioSessionID
@end

@implementation FigRouteDiscoveryManagerCopyRouteDescriptorsFromEndpointsAndAudioSessionID

__CFArray *__FigRouteDiscoveryManagerCopyRouteDescriptorsFromEndpointsAndAudioSessionID_block_invoke(uint64_t a1)
{
  result = FigEndpointDescriptorUtility_CopyDescriptorsForEndpoints(*(const __CFArray **)(a1 + 40), *(unsigned int *)(a1 + 48));
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

@end