@interface BLAssetContainerAudiobookiOS
- (BAMetadataStoreManager)metadataStoreManager;
- (BLAssetContainerAudiobookiOS)initWithMetadataStoreManager:(id)a3;
- (BLMediaLibraryManager)mediaLibraryManager;
- (id)installOperationForInstallInfo:(id)a3;
- (void)cancelPurchasesWithMetadata:(id)a3 subitemsToIgnore:(id)a4;
- (void)purchasedAssetWithMetadata:(id)a3 familyAccountID:(id)a4;
@end

@implementation BLAssetContainerAudiobookiOS

- (BLAssetContainerAudiobookiOS)initWithMetadataStoreManager:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)BLAssetContainerAudiobookiOS;
  v6 = [(BLAssetContainerAudiobookiOS *)&v10 init];
  if (v6)
  {
    v7 = objc_alloc_init(BLMediaLibraryManager);
    mediaLibraryManager = v6->_mediaLibraryManager;
    v6->_mediaLibraryManager = v7;

    objc_storeStrong((id *)&v6->_metadataStoreManager, a3);
  }

  return v6;
}

- (void)purchasedAssetWithMetadata:(id)a3 familyAccountID:(id)a4
{
  id v9 = a4;
  id v6 = a3;
  v7 = objc_alloc_init(BLMLImporterItem);
  [(BLMLImporterItem *)v7 setItemMetadata:v6];

  if ([v9 longLongValue]) {
    [(BLMLImporterItem *)v7 setValue:v9 forAdditionalEntityProperty:ML3TrackPropertyStoreFamilyAccountID];
  }
  v8 = [(BLAssetContainerAudiobookiOS *)self mediaLibraryManager];
  [v8 addLibraryItemWithoutWaiting:v7];
}

- (void)cancelPurchasesWithMetadata:(id)a3 subitemsToIgnore:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10000B330;
  v10[3] = &unk_1001A1218;
  id v8 = objc_alloc_init((Class)NSMutableArray);
  id v11 = v8;
  +[BLMediaLibraryUtilities enumerateTracksWithStorePlaylistIdentifier:v7 usingBlock:v10];

  [v8 removeObjectsInArray:v6];
  if ([v8 count])
  {
    id v9 = [(BLAssetContainerAudiobookiOS *)self mediaLibraryManager];
    [v9 removeMediaItemsForStoreIDs:v8];
  }
}

- (id)installOperationForInstallInfo:(id)a3
{
  id v4 = a3;
  id v5 = [BLAudiobookInstallOperation alloc];
  id v6 = [(BLAssetContainerAudiobookiOS *)self mediaLibraryManager];
  id v7 = [(BLAssetContainerAudiobookiOS *)self metadataStoreManager];
  id v8 = [(BLAudiobookInstallOperation *)v5 initWithInfo:v4 mediaLibraryManager:v6 metadataStoreManager:v7];

  return v8;
}

- (BLMediaLibraryManager)mediaLibraryManager
{
  return self->_mediaLibraryManager;
}

- (BAMetadataStoreManager)metadataStoreManager
{
  return self->_metadataStoreManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadataStoreManager, 0);

  objc_storeStrong((id *)&self->_mediaLibraryManager, 0);
}

@end