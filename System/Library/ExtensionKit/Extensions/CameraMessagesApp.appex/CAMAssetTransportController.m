@interface CAMAssetTransportController
- (AECameraAssetPackageGenerator)_assetPackageGenerator;
- (AEChatKitStatisticsManager)_statisticsManager;
- (CAMAssetTransportController)initWithConversation:(id)a3 packageGeneratorClass:(Class)a4 statisticsManagerClass:(Class)a5 previewImageKey:(id)a6;
- (MSConversation)_activeConversation;
- (NSString)_previewImageKey;
- (void)_transportAsset:(id)a3 toShelf:(BOOL)a4 suppressLivePhoto:(BOOL)a5 mediaOrigin:(int64_t)a6 completion:(id)a7;
- (void)sendAsset:(id)a3 suppressLivePhoto:(BOOL)a4 mediaOrigin:(int64_t)a5 completion:(id)a6;
- (void)stageAsset:(id)a3 suppressLivePhoto:(BOOL)a4 mediaOrigin:(int64_t)a5 completion:(id)a6;
@end

@implementation CAMAssetTransportController

- (CAMAssetTransportController)initWithConversation:(id)a3 packageGeneratorClass:(Class)a4 statisticsManagerClass:(Class)a5 previewImageKey:(id)a6
{
  id v11 = a3;
  id v12 = a6;
  v21.receiver = self;
  v21.super_class = (Class)CAMAssetTransportController;
  v13 = [(CAMAssetTransportController *)&v21 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->__activeConversation, a3);
    v15 = (AECameraAssetPackageGenerator *)objc_alloc_init(a4);
    assetPackageGenerator = v14->__assetPackageGenerator;
    v14->__assetPackageGenerator = v15;

    objc_storeStrong((id *)&v14->__previewImageKey, a6);
    v17 = (AEChatKitStatisticsManager *)objc_alloc_init(a5);
    statisticsManager = v14->__statisticsManager;
    v14->__statisticsManager = v17;

    v19 = v14;
  }

  return v14;
}

- (void)stageAsset:(id)a3 suppressLivePhoto:(BOOL)a4 mediaOrigin:(int64_t)a5 completion:(id)a6
{
}

- (void)sendAsset:(id)a3 suppressLivePhoto:(BOOL)a4 mediaOrigin:(int64_t)a5 completion:(id)a6
{
}

- (void)_transportAsset:(id)a3 toShelf:(BOOL)a4 suppressLivePhoto:(BOOL)a5 mediaOrigin:(int64_t)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a7;
  v14 = [(CAMAssetTransportController *)self _activeConversation];
  v15 = [(CAMAssetTransportController *)self _previewImageKey];
  v16 = [(CAMAssetTransportController *)self _statisticsManager];
  assetPackageGenerator = self->__assetPackageGenerator;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_10000244C;
  v23[3] = &unk_1000145A0;
  BOOL v30 = a5;
  id v24 = v15;
  id v25 = v12;
  BOOL v31 = a4;
  id v26 = v14;
  id v27 = v16;
  id v28 = v13;
  int64_t v29 = a6;
  id v18 = v13;
  id v19 = v16;
  id v20 = v14;
  id v21 = v12;
  id v22 = v15;
  [(AECameraAssetPackageGenerator *)assetPackageGenerator generatePackageFromReviewAsset:v21 withCompletionHandler:v23];
}

- (MSConversation)_activeConversation
{
  return self->__activeConversation;
}

- (AECameraAssetPackageGenerator)_assetPackageGenerator
{
  return self->__assetPackageGenerator;
}

- (AEChatKitStatisticsManager)_statisticsManager
{
  return self->__statisticsManager;
}

- (NSString)_previewImageKey
{
  return self->__previewImageKey;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__previewImageKey, 0);
  objc_storeStrong((id *)&self->__statisticsManager, 0);
  objc_storeStrong((id *)&self->__assetPackageGenerator, 0);

  objc_storeStrong((id *)&self->__activeConversation, 0);
}

@end