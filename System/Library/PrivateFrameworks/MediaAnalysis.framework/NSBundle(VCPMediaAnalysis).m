@interface NSBundle(VCPMediaAnalysis)
+ (id)vcp_mediaAnalysisBundle;
@end

@implementation NSBundle(VCPMediaAnalysis)

+ (id)vcp_mediaAnalysisBundle
{
  v0 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.MediaAnalysis"];
  if (!v0)
  {
    v0 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.mediaanalysisd"];
  }
  return v0;
}

@end