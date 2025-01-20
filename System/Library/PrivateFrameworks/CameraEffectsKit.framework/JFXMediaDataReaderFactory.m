@interface JFXMediaDataReaderFactory
+ (JFXMediaDataReaderFactory)sharedInstance;
- (id)createARMetadataReaderWithCreationAttributesProvider:(id)a3 name:(id)a4;
- (id)createDepthDataReaderWithCreationAttributesProvider:(id)a3 name:(id)a4;
@end

@implementation JFXMediaDataReaderFactory

+ (JFXMediaDataReaderFactory)sharedInstance
{
  if (sharedInstance_onceToken_1 != -1) {
    dispatch_once(&sharedInstance_onceToken_1, &__block_literal_global_16);
  }
  v2 = (void *)sharedInstance_sInstance_0;
  return (JFXMediaDataReaderFactory *)v2;
}

uint64_t __43__JFXMediaDataReaderFactory_sharedInstance__block_invoke()
{
  sharedInstance_sInstance_0 = objc_opt_new();
  return MEMORY[0x270F9A758]();
}

- (id)createARMetadataReaderWithCreationAttributesProvider:(id)a3 name:(id)a4
{
  id v5 = a4;
  v6 = [a3 arMetadataReaderAssetTrackAttributes];
  if (v6)
  {
    v7 = [JFXAVMediaMetaDataReader alloc];
    v8 = [v6 assetTrack];
    v9 = [(JFXAVMediaDataReader *)v7 initWithAVAssetTrack:v8 withName:v5];

    v10 = [[JFXARMetadataMediaReader alloc] initWithMetadataReader:v9];
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)createDepthDataReaderWithCreationAttributesProvider:(id)a3 name:(id)a4
{
  id v5 = a4;
  v6 = [a3 depthDataReaderAssetTrackAttributes];
  if (v6)
  {
    v7 = [JFXAVMediaVideoTrackReader alloc];
    v8 = [v6 assetTrack];
    v9 = [(JFXAVMediaDataReader *)v7 initWithAVAssetTrack:v8 withName:v5];

    v10 = [[JFXDepthDataMediaReader alloc] initWithVideoTrackReader:v9];
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

@end