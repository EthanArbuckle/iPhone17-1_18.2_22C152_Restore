@interface AddImageQueueReceiverToConfiguration
@end

@implementation AddImageQueueReceiverToConfiguration

CFIndex __videoReceiver_AddImageQueueReceiverToConfiguration_block_invoke(uint64_t a1)
{
  CFIndex result = FigDataChannelConfigurationGetChannelCount(*(void *)(a1 + 40));
  if (result >= 1)
  {
    CFIndex v3 = result;
    CFIndex v4 = 0;
    while (1)
    {
      while (1)
      {
        CFIndex result = FigDataChannelConfigurationGetOutputQueueTypeAtIndex(*(void *)(a1 + 40), v4);
        if (result == 1) {
          break;
        }
        if (++v4 >= v3) {
          return result;
        }
      }
      FigDataChannelConfigurationGetCAImageQueueIDAtIndex(*(void *)(a1 + 40), v4);
      CFDictionaryRef ImageQueueReceiverByID = videoReceiver_getImageQueueReceiverByID();
      if (!ImageQueueReceiverByID) {
        break;
      }
      CFIndex result = FigDataChannelConfigurationSetCAImageQueueReceiverAtIndex(*(void *)(a1 + 40), v4, (uint64_t)ImageQueueReceiverByID);
      *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
      ++v4;
      if (*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
        BOOL v6 = 0;
      }
      else {
        BOOL v6 = v4 < v3;
      }
      if (!v6) {
        return result;
      }
    }
    CFIndex result = FigSignalErrorAt();
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  }
  return result;
}

@end