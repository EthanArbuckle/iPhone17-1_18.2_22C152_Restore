@interface APEndpointPlaybackSessionCreateVideoSyncTimeHistogram
@end

@implementation APEndpointPlaybackSessionCreateVideoSyncTimeHistogram

__CFDictionary *__APEndpointPlaybackSessionCreateVideoSyncTimeHistogram_block_invoke()
{
  result = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  APEndpointPlaybackSessionCreateVideoSyncTimeHistogram_histogramCreationOptions = (uint64_t)result;
  if (result)
  {
    CFDictionarySetValue(result, (const void *)*MEMORY[0x1E4F4A200], @"second");
    FigCFDictionarySetDouble();
    FigCFDictionarySetDouble();
    return (__CFDictionary *)FigCFDictionarySetInt32();
  }
  return result;
}

@end