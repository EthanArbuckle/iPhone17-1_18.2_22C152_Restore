@interface NSMutableDictionary(MediaAnalysisPauseResume)
- (uint64_t)vcp_removeSyncPoint;
- (void)vcp_setSyncPoint:()MediaAnalysisPauseResume;
@end

@implementation NSMutableDictionary(MediaAnalysisPauseResume)

- (void)vcp_setSyncPoint:()MediaAnalysisPauseResume
{
  CMTime v5 = *a3;
  CFDictionaryRef v4 = CMTimeCopyAsDictionary(&v5, 0);
  [a1 setObject:v4 forKey:@"SyncPoint"];
}

- (uint64_t)vcp_removeSyncPoint
{
  return [a1 removeObjectForKey:@"SyncPoint"];
}

@end