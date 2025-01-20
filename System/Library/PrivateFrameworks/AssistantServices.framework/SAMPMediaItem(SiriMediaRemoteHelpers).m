@interface SAMPMediaItem(SiriMediaRemoteHelpers)
+ (id)_af_mediaItemWithMRContentItem:()SiriMediaRemoteHelpers;
+ (id)_af_mediaItemWithMRContentItemRef:()SiriMediaRemoteHelpers;
@end

@implementation SAMPMediaItem(SiriMediaRemoteHelpers)

+ (id)_af_mediaItemWithMRContentItem:()SiriMediaRemoteHelpers
{
  if (a3)
  {
    v3 = [a3 metadata];
    id v4 = objc_alloc_init(MEMORY[0x1E4F96808]);
    id v5 = objc_alloc_init(MEMORY[0x1E4F96830]);
    [v3 duration];
    [v5 setDurationMillis:(uint64_t)(v6 * 1000.0)];
    [v3 calculatedPlaybackPosition];
    if (v7 == 0.0) {
      [v3 elapsedTime];
    }
    [v5 setPlaybackPositionMillis:(uint64_t)(v7 * 1000.0)];
    objc_msgSend(v5, "setPlays:", objc_msgSend(v3, "playCount"));
    [v4 setPlaybackInfo:v5];
    v8 = [v3 title];
    [v4 setTitle:v8];

    v9 = [v3 albumName];
    [v4 setAlbum:v9];

    v10 = [v3 trackArtistName];
    if (![v10 length])
    {
      uint64_t v11 = [v3 albumArtistName];

      v10 = (void *)v11;
    }
    [v4 setArtist:v10];
    v12 = [v3 releaseDate];
    v13 = objc_msgSend(MEMORY[0x1E4F96858], "_af_releaseInfoWithReleaseDate:", v12);
    [v4 setReleaseInfo:v13];

    uint64_t v14 = [v3 iTunesStoreIdentifier];
    if (v14 > 0 || (uint64_t v14 = objc_msgSend(v3, "iTunesStoreSubscriptionIdentifier", v14), v14 >= 1))
    {
      v15 = [MEMORY[0x1E4F28ED0] numberWithLongLong:v14];
      v16 = [v15 stringValue];
      v17 = _AFMediaIdURLFromHostAndIdentifier(@"store", v16);
      [v4 setIdentifier:v17];
    }
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

+ (id)_af_mediaItemWithMRContentItemRef:()SiriMediaRemoteHelpers
{
  if (a3)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F96808]);
    id v4 = objc_alloc_init(MEMORY[0x1E4F96830]);
    MRContentItemGetDuration();
    [v4 setDurationMillis:(uint64_t)(v5 * 1000.0)];
    MRContentItemGetCalculatedPlaybackPosition();
    if (v6 == 0.0) {
      MRContentItemGetElapsedTime();
    }
    [v4 setPlaybackPositionMillis:(uint64_t)(v6 * 1000.0)];
    [v4 setPlays:MRContentItemGetPlayCount()];
    [v3 setPlaybackInfo:v4];
    [v3 setTitle:MRContentItemGetTitle()];
    [v3 setAlbum:MRContentItemGetAlbumName()];
    double v7 = MRContentItemGetTrackArtistName();
    if (![v7 length])
    {
      uint64_t v8 = MRContentItemGetAlbumArtistName();

      double v7 = (void *)v8;
    }
    [v3 setArtist:v7];
    v9 = MRContentItemGetReleaseDate();
    v10 = objc_msgSend(MEMORY[0x1E4F96858], "_af_releaseInfoWithReleaseDate:", v9);
    [v3 setReleaseInfo:v10];

    uint64_t ITunesStoreIdentifier = MRContentItemGetITunesStoreIdentifier();
    if (ITunesStoreIdentifier > 0
      || (uint64_t ITunesStoreIdentifier = MRContentItemGetITunesStoreSubscriptionIdentifier(), ITunesStoreIdentifier >= 1))
    {
      v12 = [MEMORY[0x1E4F28ED0] numberWithLongLong:ITunesStoreIdentifier];
      v13 = [v12 stringValue];
      uint64_t v14 = _AFMediaIdURLFromHostAndIdentifier(@"store", v13);
      [v3 setIdentifier:v14];
    }
  }
  else
  {
    id v3 = 0;
  }
  return v3;
}

@end