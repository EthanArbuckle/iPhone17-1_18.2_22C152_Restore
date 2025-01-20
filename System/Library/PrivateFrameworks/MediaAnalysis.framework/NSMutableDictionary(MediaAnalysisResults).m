@interface NSMutableDictionary(MediaAnalysisResults)
- (void)vcp_setTimerange:()MediaAnalysisResults;
@end

@implementation NSMutableDictionary(MediaAnalysisResults)

- (void)vcp_setTimerange:()MediaAnalysisResults
{
  long long v4 = a3[1];
  *(_OWORD *)&v6.start.value = *a3;
  *(_OWORD *)&v6.start.epoch = v4;
  *(_OWORD *)&v6.duration.timescale = a3[2];
  CFDictionaryRef v5 = CMTimeRangeCopyAsDictionary(&v6, 0);
  [a1 addEntriesFromDictionary:v5];
}

@end