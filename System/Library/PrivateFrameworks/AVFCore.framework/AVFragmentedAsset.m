@interface AVFragmentedAsset
+ (AVFragmentedAsset)fragmentedAssetWithURL:(NSURL *)URL options:(NSDictionary *)options;
+ (BOOL)expectsPropertyRevisedNotifications;
- (AVFragmentedAsset)initWithURL:(id)a3 options:(id)a4;
- (AVFragmentedAssetTrack)trackWithTrackID:(CMPersistentTrackID)trackID;
- (BOOL)_mindsFragments;
- (BOOL)isAssociatedWithFragmentMinder;
- (Class)_classForAssetTracks;
- (NSArray)tracks;
- (NSArray)tracksWithMediaCharacteristic:(AVMediaCharacteristic)mediaCharacteristic;
- (NSArray)tracksWithMediaType:(AVMediaType)mediaType;
- (void)_setIsAssociatedWithFragmentMinder:(BOOL)a3;
@end

@implementation AVFragmentedAsset

+ (BOOL)expectsPropertyRevisedNotifications
{
  return 1;
}

+ (AVFragmentedAsset)fragmentedAssetWithURL:(NSURL *)URL options:(NSDictionary *)options
{
  v4 = (void *)[objc_alloc((Class)a1) initWithURL:URL options:options];
  return (AVFragmentedAsset *)v4;
}

- (AVFragmentedAsset)initWithURL:(id)a3 options:(id)a4
{
  if (a4) {
    id v6 = (id)[a4 mutableCopy];
  }
  else {
    id v6 = (id)[MEMORY[0x1E4F1CA60] dictionary];
  }
  id v7 = v6;
  [v6 setValue:*MEMORY[0x1E4F1CFD0] forKey:0x1EE5949F8];
  v9.receiver = self;
  v9.super_class = (Class)AVFragmentedAsset;
  return [(AVURLAsset *)&v9 initWithURL:a3 options:v7];
}

- (BOOL)_mindsFragments
{
  return 1;
}

- (Class)_classForAssetTracks
{
  return (Class)objc_opt_class();
}

- (NSArray)tracks
{
  v3.receiver = self;
  v3.super_class = (Class)AVFragmentedAsset;
  return (NSArray *)[(AVURLAsset *)&v3 tracks];
}

- (AVFragmentedAssetTrack)trackWithTrackID:(CMPersistentTrackID)trackID
{
  v4.receiver = self;
  v4.super_class = (Class)AVFragmentedAsset;
  return (AVFragmentedAssetTrack *)[(AVAsset *)&v4 trackWithTrackID:*(void *)&trackID];
}

- (NSArray)tracksWithMediaType:(AVMediaType)mediaType
{
  v4.receiver = self;
  v4.super_class = (Class)AVFragmentedAsset;
  return [(AVAsset *)&v4 tracksWithMediaType:mediaType];
}

- (NSArray)tracksWithMediaCharacteristic:(AVMediaCharacteristic)mediaCharacteristic
{
  v4.receiver = self;
  v4.super_class = (Class)AVFragmentedAsset;
  return [(AVAsset *)&v4 tracksWithMediaCharacteristic:mediaCharacteristic];
}

- (BOOL)isAssociatedWithFragmentMinder
{
  id v2 = [(AVURLAsset *)self _assetInspectorLoader];
  return [v2 isAssociatedWithFragmentMinder];
}

- (void)_setIsAssociatedWithFragmentMinder:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(AVURLAsset *)self _assetInspectorLoader];
  [v4 _setIsAssociatedWithFragmentMinder:v3];
}

@end