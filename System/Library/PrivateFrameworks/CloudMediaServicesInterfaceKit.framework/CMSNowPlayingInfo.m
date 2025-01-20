@interface CMSNowPlayingInfo
+ (id)instanceFromCMSCoded:(id)a3;
+ (id)nowPlayingInfoFromDictionary:(id)a3;
- (BOOL)isAdvertisement;
- (BOOL)isLive;
- (NSString)albumName;
- (NSString)applicationBundleID;
- (NSString)artistName;
- (NSString)artworkURLString;
- (NSString)collectionIdentifier;
- (NSString)composerName;
- (NSString)endpointID;
- (NSString)externalContentIdentifier;
- (NSString)externalUserProfileIdentifier;
- (NSString)genre;
- (NSString)requesterSharedUserID;
- (NSString)title;
- (NSString)userAccountHomeUserID;
- (NSString)userActivityPersistentIdentifier;
- (double)duration;
- (double)elapsedTime;
- (float)defaultPlaybackRate;
- (float)playbackRate;
- (id)cmsCoded;
- (unint64_t)discNumber;
- (unint64_t)mediaType;
- (unint64_t)queueIndex;
- (unint64_t)trackNumber;
- (void)setAlbumName:(id)a3;
- (void)setApplicationBundleID:(id)a3;
- (void)setArtistName:(id)a3;
- (void)setArtworkURLString:(id)a3;
- (void)setCollectionIdentifier:(id)a3;
- (void)setComposerName:(id)a3;
- (void)setDefaultPlaybackRate:(float)a3;
- (void)setDiscNumber:(unint64_t)a3;
- (void)setDuration:(double)a3;
- (void)setElapsedTime:(double)a3;
- (void)setEndpointID:(id)a3;
- (void)setExternalContentIdentifier:(id)a3;
- (void)setExternalUserProfileIdentifier:(id)a3;
- (void)setGenre:(id)a3;
- (void)setIsAdvertisement:(BOOL)a3;
- (void)setIsLive:(BOOL)a3;
- (void)setMediaType:(unint64_t)a3;
- (void)setPlaybackRate:(float)a3;
- (void)setQueueIndex:(unint64_t)a3;
- (void)setRequesterSharedUserID:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTrackNumber:(unint64_t)a3;
- (void)setUserAccountHomeUserID:(id)a3;
- (void)setUserActivityPersistentIdentifier:(id)a3;
@end

@implementation CMSNowPlayingInfo

+ (id)nowPlayingInfoFromDictionary:(id)a3
{
  id v3 = a3;
  v4 = [(id)objc_opt_class() instanceFromCMSCoded:v3];

  return v4;
}

- (id)cmsCoded
{
  return 0;
}

+ (id)instanceFromCMSCoded:(id)a3
{
  id v3 = cmsSafeDictionary(a3);
  if (v3)
  {
    v4 = objc_opt_new();
    v5 = [v3 cmsOptionalStringForKey:@"albumName"];
    [v4 setAlbumName:v5];

    v6 = [v3 cmsOptionalStringForKey:@"artistName"];
    [v4 setArtistName:v6];

    v7 = [v3 cmsOptionalDictionaryForKey:@"artwork"];
    v8 = [v7 objectForKey:@"url"];
    [v4 setArtworkURLString:v8];

    v9 = [v3 cmsOptionalStringForKey:@"composerName"];
    [v4 setComposerName:v9];

    objc_msgSend(v4, "setDiscNumber:", objc_msgSend(v3, "cmsUnsignedForKey:withDefault:", @"discNumber", 0));
    objc_msgSend(v4, "setTrackNumber:", objc_msgSend(v3, "cmsUnsignedForKey:withDefault:", @"trackNumber", 0));
    v10 = [v3 cmsOptionalStringForKey:@"name"];
    [v4 setTitle:v10];

    v11 = [v3 cmsOptionalArrayOfClass:objc_opt_class() forKey:@"genreNames"];
    v12 = [v11 firstObject];
    [v4 setGenre:v12];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (NSString)albumName
{
  return self->_albumName;
}

- (void)setAlbumName:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)artistName
{
  return self->_artistName;
}

- (void)setArtistName:(id)a3
{
}

- (NSString)genre
{
  return self->_genre;
}

- (void)setGenre:(id)a3
{
}

- (NSString)composerName
{
  return self->_composerName;
}

- (void)setComposerName:(id)a3
{
}

- (NSString)externalContentIdentifier
{
  return self->_externalContentIdentifier;
}

- (void)setExternalContentIdentifier:(id)a3
{
}

- (NSString)collectionIdentifier
{
  return self->_collectionIdentifier;
}

- (void)setCollectionIdentifier:(id)a3
{
}

- (NSString)externalUserProfileIdentifier
{
  return self->_externalUserProfileIdentifier;
}

- (void)setExternalUserProfileIdentifier:(id)a3
{
}

- (NSString)artworkURLString
{
  return self->_artworkURLString;
}

- (void)setArtworkURLString:(id)a3
{
}

- (unint64_t)mediaType
{
  return self->_mediaType;
}

- (void)setMediaType:(unint64_t)a3
{
  self->_mediaType = a3;
}

- (unint64_t)trackNumber
{
  return self->_trackNumber;
}

- (void)setTrackNumber:(unint64_t)a3
{
  self->_trackNumber = a3;
}

- (unint64_t)discNumber
{
  return self->_discNumber;
}

- (void)setDiscNumber:(unint64_t)a3
{
  self->_discNumber = a3;
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (double)elapsedTime
{
  return self->_elapsedTime;
}

- (void)setElapsedTime:(double)a3
{
  self->_elapsedTime = a3;
}

- (float)playbackRate
{
  return self->_playbackRate;
}

- (void)setPlaybackRate:(float)a3
{
  self->_playbackRate = a3;
}

- (float)defaultPlaybackRate
{
  return self->_defaultPlaybackRate;
}

- (void)setDefaultPlaybackRate:(float)a3
{
  self->_defaultPlaybackRate = a3;
}

- (unint64_t)queueIndex
{
  return self->_queueIndex;
}

- (void)setQueueIndex:(unint64_t)a3
{
  self->_queueIndex = a3;
}

- (BOOL)isAdvertisement
{
  return self->_isAdvertisement;
}

- (void)setIsAdvertisement:(BOOL)a3
{
  self->_isAdvertisement = a3;
}

- (BOOL)isLive
{
  return self->_isLive;
}

- (void)setIsLive:(BOOL)a3
{
  self->_isLive = a3;
}

- (NSString)requesterSharedUserID
{
  return self->_requesterSharedUserID;
}

- (void)setRequesterSharedUserID:(id)a3
{
}

- (NSString)userAccountHomeUserID
{
  return self->_userAccountHomeUserID;
}

- (void)setUserAccountHomeUserID:(id)a3
{
}

- (NSString)endpointID
{
  return self->_endpointID;
}

- (void)setEndpointID:(id)a3
{
}

- (NSString)applicationBundleID
{
  return self->_applicationBundleID;
}

- (void)setApplicationBundleID:(id)a3
{
}

- (NSString)userActivityPersistentIdentifier
{
  return self->_userActivityPersistentIdentifier;
}

- (void)setUserActivityPersistentIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userActivityPersistentIdentifier, 0);
  objc_storeStrong((id *)&self->_applicationBundleID, 0);
  objc_storeStrong((id *)&self->_endpointID, 0);
  objc_storeStrong((id *)&self->_userAccountHomeUserID, 0);
  objc_storeStrong((id *)&self->_requesterSharedUserID, 0);
  objc_storeStrong((id *)&self->_artworkURLString, 0);
  objc_storeStrong((id *)&self->_externalUserProfileIdentifier, 0);
  objc_storeStrong((id *)&self->_collectionIdentifier, 0);
  objc_storeStrong((id *)&self->_externalContentIdentifier, 0);
  objc_storeStrong((id *)&self->_composerName, 0);
  objc_storeStrong((id *)&self->_genre, 0);
  objc_storeStrong((id *)&self->_artistName, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_albumName, 0);
}

@end