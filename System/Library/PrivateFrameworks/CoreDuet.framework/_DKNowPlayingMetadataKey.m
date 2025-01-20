@interface _DKNowPlayingMetadataKey
+ (id)album;
+ (id)artist;
+ (id)duration;
+ (id)elapsed;
+ (id)genre;
+ (id)iTunesStoreIdentifier;
+ (id)iTunesSubscriptionIdentifier;
+ (id)identifier;
+ (id)isAirPlayVideo;
+ (id)mediaType;
+ (id)outputDeviceIDs;
+ (id)playing;
+ (id)title;
@end

@implementation _DKNowPlayingMetadataKey

+ (id)playing
{
  return @"_DKNowPlayingMetadataKey-playing";
}

+ (id)album
{
  return @"_DKNowPlayingMetadataKey-album";
}

+ (id)artist
{
  return @"_DKNowPlayingMetadataKey-artist";
}

+ (id)duration
{
  return @"_DKNowPlayingMetadataKey-duration";
}

+ (id)elapsed
{
  return @"_DKNowPlayingMetadataKey-elapsed";
}

+ (id)genre
{
  return @"_DKNowPlayingMetadataKey-genre";
}

+ (id)title
{
  return @"_DKNowPlayingMetadataKey-title";
}

+ (id)identifier
{
  return @"_DKNowPlayingMetadataKey-identifier";
}

+ (id)mediaType
{
  return @"_DKNowPlayingMetadataKey-mediaType";
}

+ (id)iTunesStoreIdentifier
{
  return @"_DKNowPlayingMetadataKey-iTunesStoreIdentifier";
}

+ (id)iTunesSubscriptionIdentifier
{
  return @"_DKNowPlayingMetadataKey-iTunesSubscriptionIdentifier";
}

+ (id)outputDeviceIDs
{
  return @"_DKNowPlayingMetadataKey-outputDeviceIDs";
}

+ (id)isAirPlayVideo
{
  return @"_DKNowPlayingMetadataKey-isAirPlayVideo";
}

@end