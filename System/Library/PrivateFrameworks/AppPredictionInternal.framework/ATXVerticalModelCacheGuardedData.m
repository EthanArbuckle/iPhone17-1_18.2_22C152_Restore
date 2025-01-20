@interface ATXVerticalModelCacheGuardedData
@end

@implementation ATXVerticalModelCacheGuardedData

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->websiteTitlesAndSubtitles, 0);
  objc_storeStrong((id *)&self->websiteSuggestions, 0);
}

@end