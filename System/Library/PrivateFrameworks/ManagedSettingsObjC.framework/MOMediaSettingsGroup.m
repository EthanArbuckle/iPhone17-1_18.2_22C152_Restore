@interface MOMediaSettingsGroup
+ (MOBoolSettingMetadata)denyBookstoreEroticaMetadata;
+ (MOBoolSettingMetadata)denyBookstoreMetadata;
+ (MOBoolSettingMetadata)denyExplicitContentMetadata;
+ (MOBoolSettingMetadata)denyMusicArtistActivityMetadata;
+ (MOBoolSettingMetadata)denyMusicServiceMetadata;
+ (MOBoolSettingMetadata)denyMusicVideosMetadata;
+ (MOBoolSettingMetadata)denyPodcastsMetadata;
+ (MOBoolSettingMetadata)denySharedMediaLibrariesMetadata;
+ (MOBoolSettingMetadata)denyiTunesMetadata;
+ (MOBoolSettingMetadata)lockSpeakerVolumeLimitMetadata;
+ (MOBoolSettingMetadata)lockTVProviderMetadata;
+ (MOIntegerSettingMetadata)maximumMovieRatingMetadata;
+ (MOIntegerSettingMetadata)maximumTVShowRatingMetadata;
+ (id)groupName;
- (NSNumber)denyBookstore;
- (NSNumber)denyBookstoreErotica;
- (NSNumber)denyExplicitContent;
- (NSNumber)denyMusicArtistActivity;
- (NSNumber)denyMusicService;
- (NSNumber)denyMusicVideos;
- (NSNumber)denyPodcasts;
- (NSNumber)denySharedMediaLibraries;
- (NSNumber)denyiTunes;
- (NSNumber)lockSpeakerVolumeLimit;
- (NSNumber)lockTVProvider;
- (NSNumber)maximumMovieRating;
- (NSNumber)maximumTVShowRating;
- (void)setDenyBookstore:(id)a3;
- (void)setDenyBookstoreErotica:(id)a3;
- (void)setDenyExplicitContent:(id)a3;
- (void)setDenyMusicArtistActivity:(id)a3;
- (void)setDenyMusicService:(id)a3;
- (void)setDenyMusicVideos:(id)a3;
- (void)setDenyPodcasts:(id)a3;
- (void)setDenySharedMediaLibraries:(id)a3;
- (void)setDenyiTunes:(id)a3;
- (void)setLockSpeakerVolumeLimit:(id)a3;
- (void)setLockTVProvider:(id)a3;
- (void)setMaximumMovieRating:(id)a3;
- (void)setMaximumTVShowRating:(id)a3;
@end

@implementation MOMediaSettingsGroup

+ (id)groupName
{
  return @"media";
}

- (NSNumber)denyBookstore
{
  return (NSNumber *)[(MOSettingsGroup *)self valueForSetting:@"denyBookstore"];
}

- (void)setDenyBookstore:(id)a3
{
}

+ (MOBoolSettingMetadata)denyBookstoreMetadata
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__MOMediaSettingsGroup_denyBookstoreMetadata__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (denyBookstoreMetadata_onceToken != -1) {
    dispatch_once(&denyBookstoreMetadata_onceToken, block);
  }
  v2 = (void *)denyBookstoreMetadata_metadata;
  return (MOBoolSettingMetadata *)v2;
}

void __45__MOMediaSettingsGroup_denyBookstoreMetadata__block_invoke()
{
  v0 = NSString;
  v1 = [(id)objc_opt_class() groupName];
  id v4 = [v0 stringWithFormat:@"%@.%@", v1, @"denyBookstore"];

  v2 = [[MOBoolSettingMetadata alloc] initWithSettingName:v4 defaultBool:0 combineOperator:0 isPublic:0 scope:@"user" isPrivacySensitive:0];
  v3 = (void *)denyBookstoreMetadata_metadata;
  denyBookstoreMetadata_metadata = (uint64_t)v2;
}

- (NSNumber)denyBookstoreErotica
{
  return (NSNumber *)[(MOSettingsGroup *)self valueForSetting:@"denyBookstoreErotica"];
}

- (void)setDenyBookstoreErotica:(id)a3
{
}

+ (MOBoolSettingMetadata)denyBookstoreEroticaMetadata
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__MOMediaSettingsGroup_denyBookstoreEroticaMetadata__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (denyBookstoreEroticaMetadata_onceToken != -1) {
    dispatch_once(&denyBookstoreEroticaMetadata_onceToken, block);
  }
  v2 = (void *)denyBookstoreEroticaMetadata_metadata;
  return (MOBoolSettingMetadata *)v2;
}

void __52__MOMediaSettingsGroup_denyBookstoreEroticaMetadata__block_invoke()
{
  v0 = NSString;
  v1 = [(id)objc_opt_class() groupName];
  id v4 = [v0 stringWithFormat:@"%@.%@", v1, @"denyBookstoreErotica"];

  v2 = [[MOBoolSettingMetadata alloc] initWithSettingName:v4 defaultBool:0 combineOperator:0 isPublic:1 scope:@"user" isPrivacySensitive:0];
  v3 = (void *)denyBookstoreEroticaMetadata_metadata;
  denyBookstoreEroticaMetadata_metadata = (uint64_t)v2;
}

- (NSNumber)denyExplicitContent
{
  return (NSNumber *)[(MOSettingsGroup *)self valueForSetting:@"denyExplicitContent"];
}

- (void)setDenyExplicitContent:(id)a3
{
}

+ (MOBoolSettingMetadata)denyExplicitContentMetadata
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__MOMediaSettingsGroup_denyExplicitContentMetadata__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (denyExplicitContentMetadata_onceToken != -1) {
    dispatch_once(&denyExplicitContentMetadata_onceToken, block);
  }
  v2 = (void *)denyExplicitContentMetadata_metadata;
  return (MOBoolSettingMetadata *)v2;
}

void __51__MOMediaSettingsGroup_denyExplicitContentMetadata__block_invoke()
{
  v0 = NSString;
  v1 = [(id)objc_opt_class() groupName];
  id v4 = [v0 stringWithFormat:@"%@.%@", v1, @"denyExplicitContent"];

  v2 = [[MOBoolSettingMetadata alloc] initWithSettingName:v4 defaultBool:0 combineOperator:0 isPublic:1 scope:@"user" isPrivacySensitive:0];
  v3 = (void *)denyExplicitContentMetadata_metadata;
  denyExplicitContentMetadata_metadata = (uint64_t)v2;
}

- (NSNumber)denyiTunes
{
  return (NSNumber *)[(MOSettingsGroup *)self valueForSetting:@"denyiTunes"];
}

- (void)setDenyiTunes:(id)a3
{
}

+ (MOBoolSettingMetadata)denyiTunesMetadata
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__MOMediaSettingsGroup_denyiTunesMetadata__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (denyiTunesMetadata_onceToken != -1) {
    dispatch_once(&denyiTunesMetadata_onceToken, block);
  }
  v2 = (void *)denyiTunesMetadata_metadata;
  return (MOBoolSettingMetadata *)v2;
}

void __42__MOMediaSettingsGroup_denyiTunesMetadata__block_invoke()
{
  v0 = NSString;
  v1 = [(id)objc_opt_class() groupName];
  id v4 = [v0 stringWithFormat:@"%@.%@", v1, @"denyiTunes"];

  v2 = [[MOBoolSettingMetadata alloc] initWithSettingName:v4 defaultBool:0 combineOperator:0 isPublic:0 scope:@"user" isPrivacySensitive:0];
  v3 = (void *)denyiTunesMetadata_metadata;
  denyiTunesMetadata_metadata = (uint64_t)v2;
}

- (NSNumber)denyMusicArtistActivity
{
  return (NSNumber *)[(MOSettingsGroup *)self valueForSetting:@"denyMusicArtistActivity"];
}

- (void)setDenyMusicArtistActivity:(id)a3
{
}

+ (MOBoolSettingMetadata)denyMusicArtistActivityMetadata
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__MOMediaSettingsGroup_denyMusicArtistActivityMetadata__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (denyMusicArtistActivityMetadata_onceToken != -1) {
    dispatch_once(&denyMusicArtistActivityMetadata_onceToken, block);
  }
  v2 = (void *)denyMusicArtistActivityMetadata_metadata;
  return (MOBoolSettingMetadata *)v2;
}

void __55__MOMediaSettingsGroup_denyMusicArtistActivityMetadata__block_invoke()
{
  v0 = NSString;
  v1 = [(id)objc_opt_class() groupName];
  id v4 = [v0 stringWithFormat:@"%@.%@", v1, @"denyMusicArtistActivity"];

  v2 = [[MOBoolSettingMetadata alloc] initWithSettingName:v4 defaultBool:0 combineOperator:0 isPublic:0 scope:@"user" isPrivacySensitive:0];
  v3 = (void *)denyMusicArtistActivityMetadata_metadata;
  denyMusicArtistActivityMetadata_metadata = (uint64_t)v2;
}

- (NSNumber)denyMusicService
{
  return (NSNumber *)[(MOSettingsGroup *)self valueForSetting:@"denyMusicService"];
}

- (void)setDenyMusicService:(id)a3
{
}

+ (MOBoolSettingMetadata)denyMusicServiceMetadata
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__MOMediaSettingsGroup_denyMusicServiceMetadata__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (denyMusicServiceMetadata_onceToken != -1) {
    dispatch_once(&denyMusicServiceMetadata_onceToken, block);
  }
  v2 = (void *)denyMusicServiceMetadata_metadata;
  return (MOBoolSettingMetadata *)v2;
}

void __48__MOMediaSettingsGroup_denyMusicServiceMetadata__block_invoke()
{
  v0 = NSString;
  v1 = [(id)objc_opt_class() groupName];
  id v4 = [v0 stringWithFormat:@"%@.%@", v1, @"denyMusicService"];

  v2 = [[MOBoolSettingMetadata alloc] initWithSettingName:v4 defaultBool:0 combineOperator:0 isPublic:1 scope:@"user" isPrivacySensitive:0];
  v3 = (void *)denyMusicServiceMetadata_metadata;
  denyMusicServiceMetadata_metadata = (uint64_t)v2;
}

- (NSNumber)denyMusicVideos
{
  return (NSNumber *)[(MOSettingsGroup *)self valueForSetting:@"denyMusicVideos"];
}

- (void)setDenyMusicVideos:(id)a3
{
}

+ (MOBoolSettingMetadata)denyMusicVideosMetadata
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__MOMediaSettingsGroup_denyMusicVideosMetadata__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (denyMusicVideosMetadata_onceToken != -1) {
    dispatch_once(&denyMusicVideosMetadata_onceToken, block);
  }
  v2 = (void *)denyMusicVideosMetadata_metadata;
  return (MOBoolSettingMetadata *)v2;
}

void __47__MOMediaSettingsGroup_denyMusicVideosMetadata__block_invoke()
{
  v0 = NSString;
  v1 = [(id)objc_opt_class() groupName];
  id v4 = [v0 stringWithFormat:@"%@.%@", v1, @"denyMusicVideos"];

  v2 = [[MOBoolSettingMetadata alloc] initWithSettingName:v4 defaultBool:0 combineOperator:0 isPublic:0 scope:@"user" isPrivacySensitive:0];
  v3 = (void *)denyMusicVideosMetadata_metadata;
  denyMusicVideosMetadata_metadata = (uint64_t)v2;
}

- (NSNumber)denyPodcasts
{
  return (NSNumber *)[(MOSettingsGroup *)self valueForSetting:@"denyPodcasts"];
}

- (void)setDenyPodcasts:(id)a3
{
}

+ (MOBoolSettingMetadata)denyPodcastsMetadata
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__MOMediaSettingsGroup_denyPodcastsMetadata__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (denyPodcastsMetadata_onceToken != -1) {
    dispatch_once(&denyPodcastsMetadata_onceToken, block);
  }
  v2 = (void *)denyPodcastsMetadata_metadata;
  return (MOBoolSettingMetadata *)v2;
}

void __44__MOMediaSettingsGroup_denyPodcastsMetadata__block_invoke()
{
  v0 = NSString;
  v1 = [(id)objc_opt_class() groupName];
  id v4 = [v0 stringWithFormat:@"%@.%@", v1, @"denyPodcasts"];

  v2 = [[MOBoolSettingMetadata alloc] initWithSettingName:v4 defaultBool:0 combineOperator:0 isPublic:0 scope:@"user" isPrivacySensitive:0];
  v3 = (void *)denyPodcastsMetadata_metadata;
  denyPodcastsMetadata_metadata = (uint64_t)v2;
}

- (NSNumber)denySharedMediaLibraries
{
  return (NSNumber *)[(MOSettingsGroup *)self valueForSetting:@"denySharedMediaLibraries"];
}

- (void)setDenySharedMediaLibraries:(id)a3
{
}

+ (MOBoolSettingMetadata)denySharedMediaLibrariesMetadata
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__MOMediaSettingsGroup_denySharedMediaLibrariesMetadata__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (denySharedMediaLibrariesMetadata_onceToken != -1) {
    dispatch_once(&denySharedMediaLibrariesMetadata_onceToken, block);
  }
  v2 = (void *)denySharedMediaLibrariesMetadata_metadata;
  return (MOBoolSettingMetadata *)v2;
}

void __56__MOMediaSettingsGroup_denySharedMediaLibrariesMetadata__block_invoke()
{
  v0 = NSString;
  v1 = [(id)objc_opt_class() groupName];
  id v4 = [v0 stringWithFormat:@"%@.%@", v1, @"denySharedMediaLibraries"];

  v2 = [[MOBoolSettingMetadata alloc] initWithSettingName:v4 defaultBool:0 combineOperator:0 isPublic:0 scope:@"user" isPrivacySensitive:0];
  v3 = (void *)denySharedMediaLibrariesMetadata_metadata;
  denySharedMediaLibrariesMetadata_metadata = (uint64_t)v2;
}

- (NSNumber)lockSpeakerVolumeLimit
{
  return (NSNumber *)[(MOSettingsGroup *)self valueForSetting:@"lockSpeakerVolumeLimit"];
}

- (void)setLockSpeakerVolumeLimit:(id)a3
{
}

+ (MOBoolSettingMetadata)lockSpeakerVolumeLimitMetadata
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__MOMediaSettingsGroup_lockSpeakerVolumeLimitMetadata__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (lockSpeakerVolumeLimitMetadata_onceToken != -1) {
    dispatch_once(&lockSpeakerVolumeLimitMetadata_onceToken, block);
  }
  v2 = (void *)lockSpeakerVolumeLimitMetadata_metadata;
  return (MOBoolSettingMetadata *)v2;
}

void __54__MOMediaSettingsGroup_lockSpeakerVolumeLimitMetadata__block_invoke()
{
  v0 = NSString;
  v1 = [(id)objc_opt_class() groupName];
  id v4 = [v0 stringWithFormat:@"%@.%@", v1, @"lockSpeakerVolumeLimit"];

  v2 = [[MOBoolSettingMetadata alloc] initWithSettingName:v4 defaultBool:0 combineOperator:0 isPublic:0 scope:@"user" isPrivacySensitive:0];
  v3 = (void *)lockSpeakerVolumeLimitMetadata_metadata;
  lockSpeakerVolumeLimitMetadata_metadata = (uint64_t)v2;
}

- (NSNumber)lockTVProvider
{
  return (NSNumber *)[(MOSettingsGroup *)self valueForSetting:@"lockTVProvider"];
}

- (void)setLockTVProvider:(id)a3
{
}

+ (MOBoolSettingMetadata)lockTVProviderMetadata
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__MOMediaSettingsGroup_lockTVProviderMetadata__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (lockTVProviderMetadata_onceToken != -1) {
    dispatch_once(&lockTVProviderMetadata_onceToken, block);
  }
  v2 = (void *)lockTVProviderMetadata_metadata;
  return (MOBoolSettingMetadata *)v2;
}

void __46__MOMediaSettingsGroup_lockTVProviderMetadata__block_invoke()
{
  v0 = NSString;
  v1 = [(id)objc_opt_class() groupName];
  id v4 = [v0 stringWithFormat:@"%@.%@", v1, @"lockTVProvider"];

  v2 = [[MOBoolSettingMetadata alloc] initWithSettingName:v4 defaultBool:0 combineOperator:0 isPublic:0 scope:@"user" isPrivacySensitive:0];
  v3 = (void *)lockTVProviderMetadata_metadata;
  lockTVProviderMetadata_metadata = (uint64_t)v2;
}

- (NSNumber)maximumMovieRating
{
  return (NSNumber *)[(MOSettingsGroup *)self valueForSetting:@"maximumMovieRating"];
}

- (void)setMaximumMovieRating:(id)a3
{
}

+ (MOIntegerSettingMetadata)maximumMovieRatingMetadata
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__MOMediaSettingsGroup_maximumMovieRatingMetadata__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (maximumMovieRatingMetadata_onceToken != -1) {
    dispatch_once(&maximumMovieRatingMetadata_onceToken, block);
  }
  v2 = (void *)maximumMovieRatingMetadata_metadata;
  return (MOIntegerSettingMetadata *)v2;
}

void __50__MOMediaSettingsGroup_maximumMovieRatingMetadata__block_invoke()
{
  v0 = NSString;
  v1 = [(id)objc_opt_class() groupName];
  id v5 = [v0 stringWithFormat:@"%@.%@", v1, @"maximumMovieRating"];

  LOBYTE(v4) = 0;
  v2 = [[MOIntegerSettingMetadata alloc] initWithSettingName:v5 defaultInt:1000 combineOperator:0 lowerBound:0 upperBound:1000 isPublic:1 scope:@"user" isPrivacySensitive:v4];
  v3 = (void *)maximumMovieRatingMetadata_metadata;
  maximumMovieRatingMetadata_metadata = (uint64_t)v2;
}

- (NSNumber)maximumTVShowRating
{
  return (NSNumber *)[(MOSettingsGroup *)self valueForSetting:@"maximumTVShowRating"];
}

- (void)setMaximumTVShowRating:(id)a3
{
}

+ (MOIntegerSettingMetadata)maximumTVShowRatingMetadata
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__MOMediaSettingsGroup_maximumTVShowRatingMetadata__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (maximumTVShowRatingMetadata_onceToken != -1) {
    dispatch_once(&maximumTVShowRatingMetadata_onceToken, block);
  }
  v2 = (void *)maximumTVShowRatingMetadata_metadata;
  return (MOIntegerSettingMetadata *)v2;
}

void __51__MOMediaSettingsGroup_maximumTVShowRatingMetadata__block_invoke()
{
  v0 = NSString;
  v1 = [(id)objc_opt_class() groupName];
  id v5 = [v0 stringWithFormat:@"%@.%@", v1, @"maximumTVShowRating"];

  LOBYTE(v4) = 0;
  v2 = [[MOIntegerSettingMetadata alloc] initWithSettingName:v5 defaultInt:1000 combineOperator:0 lowerBound:0 upperBound:1000 isPublic:1 scope:@"user" isPrivacySensitive:v4];
  v3 = (void *)maximumTVShowRatingMetadata_metadata;
  maximumTVShowRatingMetadata_metadata = (uint64_t)v2;
}

@end