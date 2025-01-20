@interface MPModelPodcastChapter
+ (id)__URL_KEY;
+ (id)__duration_KEY;
+ (id)__startTime_KEY;
+ (id)__title_KEY;
+ (void)__MPModelPropertyPodcastChapterDuration__MAPPING_MISSING__;
+ (void)__MPModelPropertyPodcastChapterStartTime__MAPPING_MISSING__;
+ (void)__MPModelPropertyPodcastChapterTitle__MAPPING_MISSING__;
+ (void)__MPModelPropertyPodcastChapterURL__MAPPING_MISSING__;
@end

@implementation MPModelPodcastChapter

+ (id)__title_KEY
{
  return @"MPModelPropertyPodcastChapterTitle";
}

+ (id)__startTime_KEY
{
  return @"MPModelPropertyPodcastChapterStartTime";
}

+ (id)__duration_KEY
{
  return @"MPModelPropertyPodcastChapterDuration";
}

+ (id)__URL_KEY
{
  return @"MPModelPropertyPodcastChapterURL";
}

+ (void)__MPModelPropertyPodcastChapterStartTime__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelPodcastChapter.m" lineNumber:19 description:@"Translator was missing mapping for MPModelPropertyPodcastChapterStartTime"];
}

+ (void)__MPModelPropertyPodcastChapterDuration__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelPodcastChapter.m" lineNumber:18 description:@"Translator was missing mapping for MPModelPropertyPodcastChapterDuration"];
}

+ (void)__MPModelPropertyPodcastChapterURL__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelPodcastChapter.m" lineNumber:17 description:@"Translator was missing mapping for MPModelPropertyPodcastChapterURL"];
}

+ (void)__MPModelPropertyPodcastChapterTitle__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelPodcastChapter.m" lineNumber:16 description:@"Translator was missing mapping for MPModelPropertyPodcastChapterTitle"];
}

@end