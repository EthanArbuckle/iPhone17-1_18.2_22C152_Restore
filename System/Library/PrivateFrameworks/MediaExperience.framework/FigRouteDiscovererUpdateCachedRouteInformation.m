@interface FigRouteDiscovererUpdateCachedRouteInformation
@end

@implementation FigRouteDiscovererUpdateCachedRouteInformation

CFArrayRef __FigRouteDiscovererUpdateCachedRouteInformation_block_invoke(uint64_t a1)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = FigRouteDiscoveryManagerCopyRoutesForTypeAndAudioSessionID(*MEMORY[0x1E4F1CF80], *(_DWORD *)(*(void *)(a1 + 56) + 40), *(_DWORD *)(a1 + 64), *(void *)(*(void *)(a1 + 56) + 24), (CFMutableArrayRef *)(*(void *)(*(void *)(a1 + 40)+ 8)+ 24));
  CFArrayRef result = FigRouteDiscoveryManagerCopyRouteDescriptorsFromEndpointsAndAudioSessionID(*(const __CFArray **)(*(void *)(*(void *)(a1 + 40) + 8) + 24), *(unsigned int *)(a1 + 64));
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

@end