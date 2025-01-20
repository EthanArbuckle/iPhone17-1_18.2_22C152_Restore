@interface AVFragmentedMovie
+ (BOOL)expectsPropertyRevisedNotifications;
- (AVFragmentedMovie)initWithURL:(id)a3 options:(id)a4;
- (AVFragmentedMovieTrack)trackWithTrackID:(CMPersistentTrackID)trackID;
- (BOOL)_mindsFragments;
- (BOOL)_needsLegacyChangeNotifications;
- (BOOL)isAssociatedWithFragmentMinder;
- (Class)_classForMovieTracks;
- (NSArray)tracks;
- (NSArray)tracksWithMediaCharacteristic:(AVMediaCharacteristic)mediaCharacteristic;
- (NSArray)tracksWithMediaType:(AVMediaType)mediaType;
- (void)_setIsAssociatedWithFragmentMinder:(BOOL)a3;
@end

@implementation AVFragmentedMovie

+ (BOOL)expectsPropertyRevisedNotifications
{
  return 1;
}

- (AVFragmentedMovie)initWithURL:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (v7)
  {
    v9 = (void *)[v7 mutableCopy];
  }
  else
  {
    v9 = [MEMORY[0x1E4F1CA60] dictionary];
  }
  v10 = v9;
  [v9 setValue:*MEMORY[0x1E4F1CFD0] forKey:0x1EE5949F8];
  v13.receiver = self;
  v13.super_class = (Class)AVFragmentedMovie;
  v11 = [(AVMovie *)&v13 initWithURL:v6 options:v10];

  return v11;
}

- (BOOL)_mindsFragments
{
  return 1;
}

- (BOOL)_needsLegacyChangeNotifications
{
  return 1;
}

- (Class)_classForMovieTracks
{
  return (Class)objc_opt_class();
}

- (NSArray)tracks
{
  v4.receiver = self;
  v4.super_class = (Class)AVFragmentedMovie;
  v2 = [(AVMovie *)&v4 tracks];
  return (NSArray *)v2;
}

- (AVFragmentedMovieTrack)trackWithTrackID:(CMPersistentTrackID)trackID
{
  v5.receiver = self;
  v5.super_class = (Class)AVFragmentedMovie;
  v3 = [(AVMovie *)&v5 trackWithTrackID:*(void *)&trackID];
  return (AVFragmentedMovieTrack *)v3;
}

- (NSArray)tracksWithMediaType:(AVMediaType)mediaType
{
  v5.receiver = self;
  v5.super_class = (Class)AVFragmentedMovie;
  v3 = [(AVMovie *)&v5 tracksWithMediaType:mediaType];
  return (NSArray *)v3;
}

- (NSArray)tracksWithMediaCharacteristic:(AVMediaCharacteristic)mediaCharacteristic
{
  v5.receiver = self;
  v5.super_class = (Class)AVFragmentedMovie;
  v3 = [(AVMovie *)&v5 tracksWithMediaCharacteristic:mediaCharacteristic];
  return (NSArray *)v3;
}

- (BOOL)isAssociatedWithFragmentMinder
{
  v2 = [(AVMovie *)self _assetInspectorLoader];
  char v3 = [v2 isAssociatedWithFragmentMinder];

  return v3;
}

- (void)_setIsAssociatedWithFragmentMinder:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(AVMovie *)self _assetInspectorLoader];
  [v4 _setIsAssociatedWithFragmentMinder:v3];
}

@end