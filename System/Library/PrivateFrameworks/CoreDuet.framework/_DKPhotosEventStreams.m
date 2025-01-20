@interface _DKPhotosEventStreams
+ (id)addToAlbumStream;
+ (id)addToSharedAlbumStream;
+ (id)airdropStream;
+ (id)airplayStream;
+ (id)allDeletionsStream;
+ (id)assignToContactStream;
+ (id)createWatchFaceStream;
+ (id)editAllStream;
+ (id)editCropStream;
+ (id)editFilterStream;
+ (id)editLightingStream;
+ (id)eyeCatchinessStream;
+ (id)hideStream;
+ (id)livePhotosBounceStream;
+ (id)livePhotosLongExposureStream;
+ (id)livePhotosLoopStream;
+ (id)livePhotosOtherStream;
+ (id)memoriesBlockedStream;
+ (id)memoriesCreatedViaAddToMemoriesStream;
+ (id)memoriesDeletedStream;
+ (id)memoriesEngagementHighStream;
+ (id)memoriesEngagementLowStream;
+ (id)memoriesEngagementMediumStream;
+ (id)memoriesFavoritedStream;
+ (id)memoriesMoviePlayedStream;
+ (id)memoriesNotificationRespondedStream;
+ (id)memoriesNotificationSeenStream;
+ (id)memoriesUnfavoritedStream;
+ (id)memoriesViewedStream;
+ (id)oldDeletionsStream;
+ (id)oldFavoritesStream;
+ (id)otherEngagementStream;
+ (id)otherFavoritesStream;
+ (id)recentDeletionsStream;
+ (id)recentFavoritesStream;
+ (id)saveToFilesStream;
+ (id)shareExtensionStream;
+ (id)sharesStream;
+ (id)useAsWallpaperStream;
+ (id)viewedFor1SecondStream;
+ (id)viewedFor2SecondsStream;
+ (id)viewedFor3SecondsStream;
+ (id)zoomEngagementStream;
@end

@implementation _DKPhotosEventStreams

+ (id)sharesStream
{
  return +[_DKEventStream eventStreamWithName:@"/photos/share/all"];
}

+ (id)shareExtensionStream
{
  return +[_DKEventStream eventStreamWithName:@"/photos/share/extension"];
}

+ (id)useAsWallpaperStream
{
  return +[_DKEventStream eventStreamWithName:@"/photos/share/useAsWallpaper"];
}

+ (id)createWatchFaceStream
{
  return +[_DKEventStream eventStreamWithName:@"/photos/share/createWatchFace"];
}

+ (id)airplayStream
{
  return +[_DKEventStream eventStreamWithName:@"/photos/share/airplay"];
}

+ (id)airdropStream
{
  return +[_DKEventStream eventStreamWithName:@"/photos/share/airdrop"];
}

+ (id)saveToFilesStream
{
  return +[_DKEventStream eventStreamWithName:@"/photos/share/saveToFiles"];
}

+ (id)assignToContactStream
{
  return +[_DKEventStream eventStreamWithName:@"/photos/share/assignToContact"];
}

+ (id)addToAlbumStream
{
  return +[_DKEventStream eventStreamWithName:@"/photos/share/addToAlbum"];
}

+ (id)addToSharedAlbumStream
{
  return +[_DKEventStream eventStreamWithName:@"/photos/share/addToSharedAlbum"];
}

+ (id)hideStream
{
  return +[_DKEventStream eventStreamWithName:@"/photos/share/hide"];
}

+ (id)viewedFor1SecondStream
{
  return +[_DKEventStream eventStreamWithName:@"/photos/engagement/0To1Seconds"];
}

+ (id)viewedFor2SecondsStream
{
  return +[_DKEventStream eventStreamWithName:@"/photos/engagement/1To2Seconds"];
}

+ (id)viewedFor3SecondsStream
{
  return +[_DKEventStream eventStreamWithName:@"/photos/engagement/2To3Seconds"];
}

+ (id)eyeCatchinessStream
{
  return +[_DKEventStream eventStreamWithName:@"/photos/engagement/eyeCatchiness"];
}

+ (id)zoomEngagementStream
{
  return +[_DKEventStream eventStreamWithName:@"/photos/engagement/zoom"];
}

+ (id)otherEngagementStream
{
  return +[_DKEventStream eventStreamWithName:@"/photos/engagement/other"];
}

+ (id)recentFavoritesStream
{
  return +[_DKEventStream eventStreamWithName:@"/photos/favorites/recent"];
}

+ (id)oldFavoritesStream
{
  return +[_DKEventStream eventStreamWithName:@"/photos/favorites/old"];
}

+ (id)otherFavoritesStream
{
  return +[_DKEventStream eventStreamWithName:@"/photos/favorites/other"];
}

+ (id)recentDeletionsStream
{
  return +[_DKEventStream eventStreamWithName:@"/photos/deletes/recent"];
}

+ (id)oldDeletionsStream
{
  return +[_DKEventStream eventStreamWithName:@"/photos/deletes/old"];
}

+ (id)allDeletionsStream
{
  return +[_DKEventStream eventStreamWithName:@"/photos/deletes/all"];
}

+ (id)editFilterStream
{
  return +[_DKEventStream eventStreamWithName:@"/photos/edit/filter"];
}

+ (id)editLightingStream
{
  return +[_DKEventStream eventStreamWithName:@"/photos/edit/lighting"];
}

+ (id)editCropStream
{
  return +[_DKEventStream eventStreamWithName:@"/photos/edit/crop"];
}

+ (id)editAllStream
{
  return +[_DKEventStream eventStreamWithName:@"/photos/edit/all"];
}

+ (id)livePhotosLoopStream
{
  return +[_DKEventStream eventStreamWithName:@"/photos/livePhotos/loop"];
}

+ (id)livePhotosBounceStream
{
  return +[_DKEventStream eventStreamWithName:@"/photos/livePhotos/bounce"];
}

+ (id)livePhotosLongExposureStream
{
  return +[_DKEventStream eventStreamWithName:@"/photos/livePhotos/longExposure"];
}

+ (id)livePhotosOtherStream
{
  return +[_DKEventStream eventStreamWithName:@"/photos/livePhotos/other"];
}

+ (id)memoriesViewedStream
{
  return +[_DKEventStream eventStreamWithName:@"/photos/memories/viewed"];
}

+ (id)memoriesEngagementLowStream
{
  return +[_DKEventStream eventStreamWithName:@"/photos/memories/engagement/low"];
}

+ (id)memoriesEngagementMediumStream
{
  return +[_DKEventStream eventStreamWithName:@"/photos/memories/engagement/medium"];
}

+ (id)memoriesEngagementHighStream
{
  return +[_DKEventStream eventStreamWithName:@"/photos/memories/engagement/high"];
}

+ (id)memoriesFavoritedStream
{
  return +[_DKEventStream eventStreamWithName:@"/photos/memories/favorited"];
}

+ (id)memoriesUnfavoritedStream
{
  return +[_DKEventStream eventStreamWithName:@"/photos/memories/unfavorited"];
}

+ (id)memoriesBlockedStream
{
  return +[_DKEventStream eventStreamWithName:@"/photos/memories/blocked"];
}

+ (id)memoriesDeletedStream
{
  return +[_DKEventStream eventStreamWithName:@"/photos/memories/deleted"];
}

+ (id)memoriesMoviePlayedStream
{
  return +[_DKEventStream eventStreamWithName:@"/photos/memories/moviePlayed"];
}

+ (id)memoriesNotificationSeenStream
{
  return +[_DKEventStream eventStreamWithName:@"/photos/memories/notification/seen"];
}

+ (id)memoriesNotificationRespondedStream
{
  return +[_DKEventStream eventStreamWithName:@"/photos/memories/notification/responded"];
}

+ (id)memoriesCreatedViaAddToMemoriesStream
{
  return +[_DKEventStream eventStreamWithName:@"/photos/memories/createdViaAddToMemories"];
}

@end