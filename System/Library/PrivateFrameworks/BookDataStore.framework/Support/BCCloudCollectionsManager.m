@interface BCCloudCollectionsManager
+ (id)sharedManager;
+ (id)sharedService;
+ (void)deleteCloudDataWithCompletion:(id)a3;
- (BCCloudChangeTokenController)changeTokenController;
- (BCCloudCollectionDetailManager)collectionDetailManager;
- (BCCloudCollectionMemberManager)collectionMemberManager;
- (BCCloudDataSource)collectionDataSource;
- (BDSSaltVersionIdentifierManager)saltVersionIdentifierManager;
- (BOOL)proxyMode;
- (NSManagedObjectModel)objectModel;
- (id)collectionDetailManagerInstance;
- (id)collectionMemberManagerInstance;
- (id)diagnosticEntityInfos:(BOOL)a3;
- (id)initService;
- (void)dataSource:(id)a3 storeDidReset:(id)a4;
- (void)dissociateCloudDataFromSyncWithCompletion:(id)a3;
- (void)hasSaltChangedWithCompletion:(id)a3;
- (void)saltUpdatedWithSaltVersionIdentifier:(id)a3;
- (void)setChangeTokenController:(id)a3;
- (void)setCollectionDataSource:(id)a3;
- (void)setCollectionDetailManager:(id)a3;
- (void)setCollectionMemberManager:(id)a3;
- (void)setEnableCloudSync:(BOOL)a3;
- (void)setEnableCloudSync:(BOOL)a3 completion:(id)a4;
- (void)setObjectModel:(id)a3;
- (void)setProxyMode:(BOOL)a3;
- (void)setSaltVersionIdentifierManager:(id)a3;
@end

@implementation BCCloudCollectionsManager

- (BCCloudCollectionMemberManager)collectionMemberManager
{
  return self->_collectionMemberManager;
}

- (BCCloudCollectionDetailManager)collectionDetailManager
{
  return self->_collectionDetailManager;
}

+ (id)sharedManager
{
  v2 = objc_opt_class();
  return [v2 sharedService];
}

+ (id)sharedService
{
  if (qword_1002975D8[0] != -1) {
    dispatch_once(qword_1002975D8, &stru_100261F68);
  }
  v2 = (void *)qword_1002975D0;
  return v2;
}

- (id)initService
{
  v22.receiver = self;
  v22.super_class = (Class)BCCloudCollectionsManager;
  v2 = [(BCCloudCollectionsManager *)&v22 init];
  if (v2)
  {
    v3 = sub_1000083A0();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v21 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Initializing BCCloudCollectionsManager - Service mode", v21, 2u);
    }

    v4 = +[BCCloudKitController sharedInstance];
    v5 = [BCCloudDataSource alloc];
    v6 = [(BCCloudCollectionsManager *)v2 objectModel];
    v7 = [(BCCloudDataSource *)v5 initWithManagedObjectModel:v6 nameOnDisk:@"BCCloudCollections" delegate:v2];
    collectionDataSource = v2->_collectionDataSource;
    v2->_collectionDataSource = v7;

    v9 = [[BCCloudCollectionDetailManager alloc] initWithCloudDataSource:v2->_collectionDataSource cloudKitController:v4];
    collectionDetailManager = v2->_collectionDetailManager;
    v2->_collectionDetailManager = v9;

    v11 = [[BCCloudCollectionMemberManager alloc] initWithCloudDataSource:v2->_collectionDataSource cloudKitController:v4];
    collectionMemberManager = v2->_collectionMemberManager;
    v2->_collectionMemberManager = v11;

    v13 = [BCCloudChangeTokenController alloc];
    v14 = [(BCCloudDataSource *)v2->_collectionDataSource managedObjectContext];
    v15 = [(BCCloudChangeTokenController *)v13 initWithMOC:v14 zoneName:@"CollectionZone" cloudKitController:v4];
    changeTokenController = v2->_changeTokenController;
    v2->_changeTokenController = v15;

    v17 = [[BDSSaltVersionIdentifierManager alloc] initWithZoneDataManager:v2 tokenController:v2->_changeTokenController databaseController:0];
    saltVersionIdentifierManager = v2->_saltVersionIdentifierManager;
    v2->_saltVersionIdentifierManager = v17;

    v19 = +[BDSSyncEngine shared];
    [v19 addSaltChangeObserver:v2];
  }
  return v2;
}

- (NSManagedObjectModel)objectModel
{
  objectModel = self->_objectModel;
  if (!objectModel)
  {
    v4 = +[NSBundle bundleForClass:objc_opt_class()];
    v5 = [v4 pathForResource:@"BCCloudCollections" ofType:@"momd"];

    v6 = +[NSURL fileURLWithPath:v5 isDirectory:1];
    v7 = (NSManagedObjectModel *)[objc_alloc((Class)NSManagedObjectModel) initWithContentsOfURL:v6];
    v8 = self->_objectModel;
    self->_objectModel = v7;

    objectModel = self->_objectModel;
  }
  return objectModel;
}

- (id)collectionDetailManagerInstance
{
  objc_opt_class();
  v3 = [(BCCloudCollectionsManager *)self collectionDetailManager];
  v4 = BUDynamicCast();

  return v4;
}

- (id)collectionMemberManagerInstance
{
  objc_opt_class();
  v3 = [(BCCloudCollectionsManager *)self collectionMemberManager];
  v4 = BUDynamicCast();

  return v4;
}

- (void)dataSource:(id)a3 storeDidReset:(id)a4
{
  id v4 = a4;
  v5 = sub_1000083A0();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138543362;
    id v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "BCCloudCollectionsManager dataSource:storeDidReset:%{public}@", (uint8_t *)&v8, 0xCu);
  }

  id v6 = [objc_alloc((Class)CKRecordZoneID) initWithZoneName:@"CollectionZone" ownerName:CKCurrentUserDefaultName];
  v7 = +[BDSSyncEngine shared];
  [v7 resetChangeToken:v6];
}

- (void)setEnableCloudSync:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  v7 = sub_1000083A0();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v8 = @"NO";
    if (v4) {
      CFStringRef v8 = @"YES";
    }
    *(_DWORD *)buf = 138412290;
    CFStringRef v27 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "BCCloudCollectionsManager SERVICE #enableCloudSync setEnableCloudSync:completion %@", buf, 0xCu);
  }

  id v9 = [objc_alloc((Class)CKRecordZoneID) initWithZoneName:@"CollectionZone" ownerName:CKCurrentUserDefaultName];
  v10 = +[BDSSyncEngine shared];
  [v10 setCloudKitZone:v9 enabled:v4];

  v11 = dispatch_group_create();
  dispatch_group_enter(v11);
  dispatch_group_enter(v11);
  v12 = [(BCCloudCollectionsManager *)self collectionDetailManagerInstance];
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100075478;
  v23[3] = &unk_10025FB10;
  BOOL v25 = v4;
  v13 = v11;
  v24 = v13;
  [v12 setEnableCloudSync:v4 completion:v23];

  v14 = [(BCCloudCollectionsManager *)self collectionMemberManagerInstance];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1000754CC;
  v20[3] = &unk_10025FB10;
  BOOL v22 = v4;
  v21 = v13;
  v15 = v13;
  [v14 setEnableCloudSync:v4 completion:v20];

  [(BCCloudChangeTokenController *)self->_changeTokenController setEnableCloudSync:v4];
  v16 = dispatch_get_global_queue(2, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100075520;
  block[3] = &unk_100260330;
  id v19 = v6;
  id v17 = v6;
  dispatch_group_notify(v15, v16, block);
}

- (void)setEnableCloudSync:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = sub_1000083A0();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v6 = @"NO";
    if (v3) {
      CFStringRef v6 = @"YES";
    }
    int v11 = 138412290;
    CFStringRef v12 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "BCCloudCollectionsManager #enableCloudSync setEnableCloudSync %@", (uint8_t *)&v11, 0xCu);
  }

  id v7 = [objc_alloc((Class)CKRecordZoneID) initWithZoneName:@"CollectionZone" ownerName:CKCurrentUserDefaultName];
  CFStringRef v8 = +[BDSSyncEngine shared];
  [v8 setCloudKitZone:v7 enabled:v3];

  id v9 = [(BCCloudCollectionsManager *)self collectionDetailManagerInstance];
  [v9 setEnableCloudSync:v3];

  v10 = [(BCCloudCollectionsManager *)self collectionMemberManagerInstance];
  [v10 setEnableCloudSync:v3];

  [(BCCloudChangeTokenController *)self->_changeTokenController setEnableCloudSync:v3];
}

- (void)saltUpdatedWithSaltVersionIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(BCCloudCollectionsManager *)self saltVersionIdentifierManager];
  [v5 handleSaltVersionIdentifierChange:v4 completion:&stru_100261FA8];
}

- (void)hasSaltChangedWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSMutableArray);
  CFStringRef v6 = [(BCCloudCollectionsManager *)self collectionDetailManagerInstance];
  objc_msgSend(v5, "bds_addObjectIfNotNil:", v6);

  id v7 = [(BCCloudCollectionsManager *)self collectionMemberManagerInstance];
  objc_msgSend(v5, "bds_addObjectIfNotNil:", v7);

  CFStringRef v8 = sub_10000CE18();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v9 = 138412290;
    id v10 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "BCCloudCollectionsManager hasSaltChangedWithCompletion %@", (uint8_t *)&v9, 0xCu);
  }

  objc_msgSend(v5, "bds_chainUntilNoErrorCompletionSelectorCallsForSelector:completion:", "hasSaltChangedWithCompletion:", v4);
}

- (void)dissociateCloudDataFromSyncWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = sub_10000CE18();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "BCCloudCollectionsManager dissociateCloudDataFromSyncWithCompletion", v10, 2u);
  }

  CFStringRef v6 = [(BCCloudCollectionsManager *)self collectionDetailManagerInstance];
  v11[0] = v6;
  id v7 = [(BCCloudCollectionsManager *)self collectionMemberManagerInstance];
  changeTokenController = self->_changeTokenController;
  v11[1] = v7;
  v11[2] = changeTokenController;
  int v9 = +[NSArray arrayWithObjects:v11 count:3];
  objc_msgSend(v9, "bds_chainSuccessAndErrorCompletionSelectorCallsForSelector:completion:", "dissociateCloudDataFromSyncWithCompletion:", v4);
}

+ (void)deleteCloudDataWithCompletion:(id)a3
{
  id v3 = a3;
  id v4 = +[BULogUtilities shared];
  unsigned int v5 = [v4 verboseLoggingEnabled];

  if (v5)
  {
    CFStringRef v6 = sub_10000CD80();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "\"\\\"BCCloudCollectionsManager deleteCloudDataWithCompletion:\\\"\"", v7, 2u);
    }
  }
  +[BCCloudDataSource deleteCloudDataWithCompletion:v3];
}

- (id)diagnosticEntityInfos:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = objc_alloc_init((Class)NSMutableArray);
  CFStringRef v6 = [(BCCloudCollectionsManager *)self collectionDetailManagerInstance];
  id v7 = [v6 diagnosticEntityInfos:v3];
  [v5 addObjectsFromArray:v7];

  CFStringRef v8 = [(BCCloudCollectionsManager *)self collectionMemberManagerInstance];
  int v9 = [v8 diagnosticEntityInfos:v3];
  [v5 addObjectsFromArray:v9];

  return v5;
}

- (void)setObjectModel:(id)a3
{
}

- (BCCloudDataSource)collectionDataSource
{
  return self->_collectionDataSource;
}

- (void)setCollectionDataSource:(id)a3
{
}

- (void)setCollectionDetailManager:(id)a3
{
}

- (void)setCollectionMemberManager:(id)a3
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

- (BOOL)proxyMode
{
  return self->_proxyMode;
}

- (void)setProxyMode:(BOOL)a3
{
  self->_proxyMode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_saltVersionIdentifierManager, 0);
  objc_storeStrong((id *)&self->_changeTokenController, 0);
  objc_storeStrong((id *)&self->_collectionMemberManager, 0);
  objc_storeStrong((id *)&self->_collectionDetailManager, 0);
  objc_storeStrong((id *)&self->_collectionDataSource, 0);
  objc_storeStrong((id *)&self->_objectModel, 0);
}

@end