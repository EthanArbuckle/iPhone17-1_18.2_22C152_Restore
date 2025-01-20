@interface MPModelPlaybackPosition
+ (id)__bookmarkTime_KEY;
+ (id)__hasBeenPlayed_KEY;
+ (id)__shouldRememberBookmarkTime_KEY;
+ (id)__startTime_KEY;
+ (id)__stopTime_KEY;
+ (id)__storeUbiquitousIdentifier_KEY;
+ (id)__userPlayCount_KEY;
+ (void)__MPModelPropertyPlaybackPositionBookmarkTime__MAPPING_MISSING__;
+ (void)__MPModelPropertyPlaybackPositionHasBeenPlayed__MAPPING_MISSING__;
+ (void)__MPModelPropertyPlaybackPositionShouldRememberBookmarkTime__MAPPING_MISSING__;
+ (void)__MPModelPropertyPlaybackPositionStartTime__MAPPING_MISSING__;
+ (void)__MPModelPropertyPlaybackPositionStopTime__MAPPING_MISSING__;
+ (void)__MPModelPropertyPlaybackPositionStoreUbiquitousIdentifier__MAPPING_MISSING__;
+ (void)__MPModelPropertyPlaybackPositionUserPlayCount__MAPPING_MISSING__;
@end

@implementation MPModelPlaybackPosition

+ (id)__userPlayCount_KEY
{
  return @"MPModelPropertyPlaybackPositionUserPlayCount";
}

+ (id)__storeUbiquitousIdentifier_KEY
{
  return @"MPModelPropertyPlaybackPositionStoreUbiquitousIdentifier";
}

+ (id)__stopTime_KEY
{
  return @"MPModelPropertyPlaybackPositionStopTime";
}

+ (id)__startTime_KEY
{
  return @"MPModelPropertyPlaybackPositionStartTime";
}

+ (id)__shouldRememberBookmarkTime_KEY
{
  return @"MPModelPropertyPlaybackPositionShouldRememberBookmarkTime";
}

+ (id)__hasBeenPlayed_KEY
{
  return @"MPModelPropertyPlaybackPositionHasBeenPlayed";
}

+ (id)__bookmarkTime_KEY
{
  return @"MPModelPropertyPlaybackPositionBookmarkTime";
}

+ (void)__MPModelPropertyPlaybackPositionUserPlayCount__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelPlaybackPosition.m" lineNumber:24 description:@"Translator was missing mapping for MPModelPropertyPlaybackPositionUserPlayCount"];
}

+ (void)__MPModelPropertyPlaybackPositionStoreUbiquitousIdentifier__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelPlaybackPosition.m" lineNumber:23 description:@"Translator was missing mapping for MPModelPropertyPlaybackPositionStoreUbiquitousIdentifier"];
}

+ (void)__MPModelPropertyPlaybackPositionStopTime__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelPlaybackPosition.m" lineNumber:22 description:@"Translator was missing mapping for MPModelPropertyPlaybackPositionStopTime"];
}

+ (void)__MPModelPropertyPlaybackPositionStartTime__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelPlaybackPosition.m" lineNumber:21 description:@"Translator was missing mapping for MPModelPropertyPlaybackPositionStartTime"];
}

+ (void)__MPModelPropertyPlaybackPositionHasBeenPlayed__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelPlaybackPosition.m" lineNumber:20 description:@"Translator was missing mapping for MPModelPropertyPlaybackPositionHasBeenPlayed"];
}

+ (void)__MPModelPropertyPlaybackPositionShouldRememberBookmarkTime__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelPlaybackPosition.m" lineNumber:19 description:@"Translator was missing mapping for MPModelPropertyPlaybackPositionShouldRememberBookmarkTime"];
}

+ (void)__MPModelPropertyPlaybackPositionBookmarkTime__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelPlaybackPosition.m" lineNumber:18 description:@"Translator was missing mapping for MPModelPropertyPlaybackPositionBookmarkTime"];
}

@end