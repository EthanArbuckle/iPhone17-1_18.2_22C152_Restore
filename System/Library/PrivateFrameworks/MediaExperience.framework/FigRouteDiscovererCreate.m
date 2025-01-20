@interface FigRouteDiscovererCreate
@end

@implementation FigRouteDiscovererCreate

CFArrayRef __FigRouteDiscovererCreate_block_invoke_2(void *a1)
{
  FigRouteDiscoveryManagerCopyRoutesForTypeAndAudioSessionID(*MEMORY[0x1E4F1CF80], *(_DWORD *)(a1[6] + 40), *(_DWORD *)(a1[6] + 8), *(void *)(a1[6] + 24), (CFMutableArrayRef *)(*(void *)(a1[4] + 8) + 24));
  CFArrayRef result = FigRouteDiscoveryManagerCopyRouteDescriptorsFromEndpointsAndAudioSessionID(*(const __CFArray **)(*(void *)(a1[4] + 8) + 24), *(unsigned int *)(a1[6] + 8));
  *(void *)(*(void *)(a1[5] + 8) + 24) = result;
  return result;
}

@end