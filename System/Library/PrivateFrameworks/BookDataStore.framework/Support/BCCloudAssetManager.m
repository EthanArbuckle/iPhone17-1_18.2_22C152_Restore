@interface BCCloudAssetManager
+ (id)sharedManager;
+ (id)sharedService;
+ (void)deleteCloudDataWithCompletion:(id)a3;
- (BCCloudAssetDetailManager)assetDetailManager;
- (BCCloudAssetReviewManager)assetReviewManager;
- (BCCloudChangeTokenController)changeTokenController;
- (BCCloudDataSource)assetDataSource;
- (BCCloudReadingNowDetailManager)readingNowDetailManager;
- (BCCloudStoreAssetManager)storeAssetManager;
- (BDSSaltVersionIdentifierManager)saltVersionIdentifierManager;
- (NSManagedObjectModel)objectModel;
- (id)assetDetailManagerInstance;
- (id)assetReviewManagerInstance;
- (id)diagnosticEntityInfos:(BOOL)a3;
- (id)initService;
- (id)readingNowDetailManagerInstance;
- (id)storeAssetManagerInstance;
- (void)dealloc;
- (void)dissociateCloudDataFromSyncWithCompletion:(id)a3;
- (void)hasSaltChangedWithCompletion:(id)a3;
- (void)setAssetDataSource:(id)a3;
- (void)setAssetDetailManager:(id)a3;
- (void)setAssetReviewManager:(id)a3;
- (void)setChangeTokenController:(id)a3;
- (void)setEnableCloudSync:(BOOL)a3 enableReadingNowSync:(BOOL)a4;
- (void)setObjectModel:(id)a3;
- (void)setReadingNowDetailManager:(id)a3;
- (void)setSaltVersionIdentifierManager:(id)a3;
- (void)setStoreAssetManager:(id)a3;
@end

@implementation BCCloudAssetManager

- (BCCloudReadingNowDetailManager)readingNowDetailManager
{
  return self->_readingNowDetailManager;
}

- (BCCloudAssetDetailManager)assetDetailManager
{
  return self->_assetDetailManager;
}

+ (id)sharedManager
{
  v2 = objc_opt_class();
  return [v2 sharedService];
}

+ (id)sharedService
{
  if (qword_1002975A0 != -1) {
    dispatch_once(&qword_1002975A0, &stru_1002616D8);
  }
  v2 = (void *)qword_100297598;
  return v2;
}

- (id)initService
{
  v26.receiver = self;
  v26.super_class = (Class)BCCloudAssetManager;
  v2 = [(BCCloudAssetManager *)&v26 init];
  if (v2)
  {
    v3 = +[BCCloudKitController sharedInstance];
    v4 = [BCCloudDataSource alloc];
    v5 = [(BCCloudAssetManager *)v2 objectModel];
    v6 = [(BCCloudDataSource *)v4 initWithManagedObjectModel:v5 nameOnDisk:@"BCAssetData"];
    assetDataSource = v2->_assetDataSource;
    v2->_assetDataSource = v6;

    v8 = [BCCloudChangeTokenController alloc];
    v9 = [(BCCloudDataSource *)v2->_assetDataSource managedObjectContext];
    v10 = [(BCCloudChangeTokenController *)v8 initWithMOC:v9 zoneName:@"AssetZone" cloudKitController:v3];
    changeTokenController = v2->_changeTokenController;
    v2->_changeTokenController = v10;

    v12 = [BDSSaltVersionIdentifierManager alloc];
    v13 = v2->_changeTokenController;
    v14 = [v3 privateCloudDatabaseController];
    v15 = [(BDSSaltVersionIdentifierManager *)v12 initWithZoneDataManager:v2 tokenController:v13 databaseController:v14];
    saltVersionIdentifierManager = v2->_saltVersionIdentifierManager;
    v2->_saltVersionIdentifierManager = v15;

    v17 = [[BCCloudStoreAssetManager alloc] initWithCloudDataSource:v2->_assetDataSource cloudKitController:v3];
    storeAssetManager = v2->_storeAssetManager;
    v2->_storeAssetManager = v17;

    v19 = [[BCCloudAssetReviewManager alloc] initWithCloudDataSource:v2->_assetDataSource cloudKitController:v3];
    assetReviewManager = v2->_assetReviewManager;
    v2->_assetReviewManager = v19;

    v21 = [[BCCloudAssetDetailManager alloc] initWithCloudDataSource:v2->_assetDataSource cloudKitController:v3];
    assetDetailManager = v2->_assetDetailManager;
    v2->_assetDetailManager = v21;

    v23 = [[BCCloudReadingNowDetailManager alloc] initWithCloudDataSource:v2->_assetDataSource cloudKitController:v3];
    readingNowDetailManager = v2->_readingNowDetailManager;
    v2->_readingNowDetailManager = v23;
  }
  return v2;
}

- (void)dealloc
{
  v3 = sub_1000083A0();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Dealloc BCCloudAssetManager", buf, 2u);
  }

  v4.receiver = self;
  v4.super_class = (Class)BCCloudAssetManager;
  [(BCCloudAssetManager *)&v4 dealloc];
}

- (NSManagedObjectModel)objectModel
{
  objectModel = self->_objectModel;
  if (!objectModel)
  {
    objc_super v4 = +[NSBundle bundleForClass:objc_opt_class()];
    v5 = [v4 pathForResource:@"BCAssetData" ofType:@"momd"];

    v6 = +[NSURL fileURLWithPath:v5 isDirectory:1];
    v7 = (NSManagedObjectModel *)[objc_alloc((Class)NSManagedObjectModel) initWithContentsOfURL:v6];
    v8 = self->_objectModel;
    self->_objectModel = v7;

    objectModel = self->_objectModel;
  }
  return objectModel;
}

- (id)assetDetailManagerInstance
{
  objc_opt_class();
  v3 = [(BCCloudAssetManager *)self assetDetailManager];
  objc_super v4 = BUDynamicCast();

  return v4;
}

- (id)readingNowDetailManagerInstance
{
  objc_opt_class();
  v3 = [(BCCloudAssetManager *)self readingNowDetailManager];
  objc_super v4 = BUDynamicCast();

  return v4;
}

- (id)assetReviewManagerInstance
{
  objc_opt_class();
  v3 = [(BCCloudAssetManager *)self assetReviewManager];
  objc_super v4 = BUDynamicCast();

  return v4;
}

- (id)storeAssetManagerInstance
{
  objc_opt_class();
  v3 = [(BCCloudAssetManager *)self storeAssetManager];
  objc_super v4 = BUDynamicCast();

  return v4;
}

- (void)setEnableCloudSync:(BOOL)a3 enableReadingNowSync:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  v7 = sub_1000083A0();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v8 = @"NO";
    if (v5) {
      CFStringRef v9 = @"YES";
    }
    else {
      CFStringRef v9 = @"NO";
    }
    if (v4) {
      CFStringRef v8 = @"YES";
    }
    int v15 = 138412546;
    CFStringRef v16 = v9;
    __int16 v17 = 2112;
    CFStringRef v18 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "BCCloudAssetManager - Service build - #enableCloudSync setEnableCloudSync %@ enableReadingNowSync %@", (uint8_t *)&v15, 0x16u);
  }

  v10 = [(BCCloudAssetManager *)self storeAssetManagerInstance];
  [v10 setEnableCloudSync:v5];

  v11 = [(BCCloudAssetManager *)self assetDetailManagerInstance];
  [v11 setEnableCloudSync:v5];

  v12 = [(BCCloudAssetManager *)self readingNowDetailManagerInstance];
  [v12 setEnableCloudSync:v4];

  v13 = [(BCCloudAssetManager *)self assetReviewManagerInstance];
  [v13 setEnableCloudSync:v5];

  v14 = [(BCCloudAssetManager *)self changeTokenController];
  [v14 setEnableCloudSync:v5];
}

- (void)hasSaltChangedWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSMutableArray);
  v6 = [(BCCloudAssetManager *)self storeAssetManagerInstance];
  objc_msgSend(v5, "bds_addObjectIfNotNil:", v6);

  v7 = [(BCCloudAssetManager *)self assetDetailManagerInstance];
  objc_msgSend(v5, "bds_addObjectIfNotNil:", v7);

  CFStringRef v8 = [(BCCloudAssetManager *)self readingNowDetailManagerInstance];
  objc_msgSend(v5, "bds_addObjectIfNotNil:", v8);

  CFStringRef v9 = [(BCCloudAssetManager *)self assetReviewManagerInstance];
  objc_msgSend(v5, "bds_addObjectIfNotNil:", v9);

  v10 = sub_10000CE18();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    int v11 = 138412290;
    id v12 = v5;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "BCCloudAssetManager hasSaltChangedWithCompletion with managers:%@", (uint8_t *)&v11, 0xCu);
  }

  objc_msgSend(v5, "bds_chainUntilNoErrorCompletionSelectorCallsForSelector:completion:", "hasSaltChangedWithCompletion:", v4);
}

- (void)dissociateCloudDataFromSyncWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = sub_1000083A0();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "BCCloudAssetManager dissociateCloudDataFromSyncWithCompletion - Service mode - non watch", v12, 2u);
  }

  v6 = [(BCCloudAssetManager *)self storeAssetManagerInstance];
  v13[0] = v6;
  v7 = [(BCCloudAssetManager *)self assetDetailManagerInstance];
  v13[1] = v7;
  CFStringRef v8 = [(BCCloudAssetManager *)self readingNowDetailManagerInstance];
  v13[2] = v8;
  CFStringRef v9 = [(BCCloudAssetManager *)self assetReviewManagerInstance];
  v13[3] = v9;
  v10 = [(BCCloudAssetManager *)self changeTokenController];
  v13[4] = v10;
  int v11 = +[NSArray arrayWithObjects:v13 count:5];
  objc_msgSend(v11, "bds_chainSuccessAndErrorCompletionSelectorCallsForSelector:completion:", "dissociateCloudDataFromSyncWithCompletion:", v4);
}

+ (void)deleteCloudDataWithCompletion:(id)a3
{
  id v3 = a3;
  id v4 = +[BULogUtilities shared];
  unsigned int v5 = [v4 verboseLoggingEnabled];

  if (v5)
  {
    v6 = sub_10000CD80();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "\"\\\"BCCloudAssetManager deleteCloudDataWithCompletion:\\\"\"", v7, 2u);
    }
  }
  +[BCCloudDataSource deleteCloudDataWithCompletion:v3];
}

- (id)diagnosticEntityInfos:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = objc_alloc_init((Class)NSMutableArray);
  v6 = [(BCCloudAssetManager *)self assetDetailManagerInstance];
  v7 = [v6 diagnosticEntityInfos:v3];
  [v5 addObjectsFromArray:v7];

  CFStringRef v8 = [(BCCloudAssetManager *)self readingNowDetailManagerInstance];
  CFStringRef v9 = [v8 diagnosticEntityInfos:v3];
  [v5 addObjectsFromArray:v9];

  return v5;
}

- (void)setObjectModel:(id)a3
{
}

- (BCCloudDataSource)assetDataSource
{
  return self->_assetDataSource;
}

- (void)setAssetDataSource:(id)a3
{
}

- (void)setAssetDetailManager:(id)a3
{
}

- (void)setReadingNowDetailManager:(id)a3
{
}

- (BCCloudAssetReviewManager)assetReviewManager
{
  return self->_assetReviewManager;
}

- (void)setAssetReviewManager:(id)a3
{
}

- (BCCloudStoreAssetManager)storeAssetManager
{
  return self->_storeAssetManager;
}

- (void)setStoreAssetManager:(id)a3
{
}

- (BCCloudChangeTokenController)changeTokenController
{
  return self->_changeTokenController;
}

- (void)setChangeTokenController:(id)a3
{
}

- (BDSSaltVersionIdentifierManager)saltVersionIdentifierManager
{
  return self->_saltVersionIdentifierManager;
}

- (void)setSaltVersionIdentifierManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_saltVersionIdentifierManager, 0);
  objc_storeStrong((id *)&self->_changeTokenController, 0);
  objc_storeStrong((id *)&self->_storeAssetManager, 0);
  objc_storeStrong((id *)&self->_assetReviewManager, 0);
  objc_storeStrong((id *)&self->_readingNowDetailManager, 0);
  objc_storeStrong((id *)&self->_assetDetailManager, 0);
  objc_storeStrong((id *)&self->_assetDataSource, 0);
  objc_storeStrong((id *)&self->_objectModel, 0);
}

@end