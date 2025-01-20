@interface NSDictionary(MediaAnalysisPauseResume)
- (void)vcp_syncPoint;
@end

@implementation NSDictionary(MediaAnalysisPauseResume)

- (void)vcp_syncPoint
{
  CFDictionaryRef v3 = [a1 objectForKey:@"SyncPoint"];
  CFDictionaryRef v5 = v3;
  if (v3)
  {
    CMTimeMakeFromDictionary(a2, v3);
  }
  else
  {
    uint64_t v4 = MEMORY[0x1E4F1F9F8];
    *(_OWORD *)&a2->value = *MEMORY[0x1E4F1F9F8];
    a2->epoch = *(void *)(v4 + 16);
  }
}

@end