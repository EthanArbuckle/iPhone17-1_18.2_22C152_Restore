@interface NSDictionary(MediaAnalysisResults)
- (void)vcp_time;
@end

@implementation NSDictionary(MediaAnalysisResults)

- (void)vcp_time
{
  CFDictionaryRef v3 = [a1 objectForKeyedSubscript:@"start"];
  CMTimeMakeFromDictionary(a2, v3);
}

@end