@interface MPModelLyrics
+ (id)__TTML_KEY;
+ (id)__hasLibraryLyrics_KEY;
+ (id)__hasStoreLyrics_KEY;
+ (id)__hasTimeSyncedLyrics_KEY;
+ (id)__text_KEY;
+ (void)__MPModelPropertyLyricsHasLibraryLyrics__MAPPING_MISSING__;
+ (void)__MPModelPropertyLyricsHasStoreLyrics__MAPPING_MISSING__;
+ (void)__MPModelPropertyLyricsHasTimeSyncedLyrics__MAPPING_MISSING__;
+ (void)__MPModelPropertyLyricsTTML__MAPPING_MISSING__;
+ (void)__MPModelPropertyLyricsText__MAPPING_MISSING__;
@end

@implementation MPModelLyrics

+ (id)__text_KEY
{
  return @"MPModelPropertyLyricsText";
}

+ (id)__hasTimeSyncedLyrics_KEY
{
  return @"MPModelPropertyLyricsHasTimeSyncedLyrics";
}

+ (id)__hasStoreLyrics_KEY
{
  return @"MPModelPropertyLyricsHasStoreLyrics";
}

+ (id)__hasLibraryLyrics_KEY
{
  return @"MPModelPropertyLyricsHasLibraryLyrics";
}

+ (id)__TTML_KEY
{
  return @"MPModelPropertyLyricsTTML";
}

+ (void)__MPModelPropertyLyricsHasTimeSyncedLyrics__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelLyrics.m" lineNumber:31 description:@"Translator was missing mapping for MPModelPropertyLyricsHasTimeSyncedLyrics"];
}

+ (void)__MPModelPropertyLyricsHasLibraryLyrics__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelLyrics.m" lineNumber:30 description:@"Translator was missing mapping for MPModelPropertyLyricsHasLibraryLyrics"];
}

+ (void)__MPModelPropertyLyricsHasStoreLyrics__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelLyrics.m" lineNumber:29 description:@"Translator was missing mapping for MPModelPropertyLyricsHasStoreLyrics"];
}

+ (void)__MPModelPropertyLyricsTTML__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelLyrics.m" lineNumber:28 description:@"Translator was missing mapping for MPModelPropertyLyricsTTML"];
}

+ (void)__MPModelPropertyLyricsText__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelLyrics.m" lineNumber:27 description:@"Translator was missing mapping for MPModelPropertyLyricsText"];
}

@end