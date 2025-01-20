@interface BuddyBetaEnrollmentStateManager
- (BOOL)isRestorableSeedEnrolled:(id)a3;
- (BuddyBetaEnrollmentStateManager)init;
- (NSMutableDictionary)backupUDIDToSeedEnrolledMap;
- (OS_dispatch_queue)backupUDIDToSeedEnrolledMapAccessQueue;
- (id)fetchBackupMetadataBlock;
- (void)loadSeedEnrollmentStateForRestorables:(id)a3 incompatibleWithUpdateVersion:(id)a4 completion:(id)a5;
- (void)setBackupUDIDToSeedEnrolledMap:(id)a3;
- (void)setBackupUDIDToSeedEnrolledMapAccessQueue:(id)a3;
- (void)setFetchBackupMetadataBlock:(id)a3;
@end

@implementation BuddyBetaEnrollmentStateManager

- (BuddyBetaEnrollmentStateManager)init
{
  SEL v11 = a2;
  id location = 0;
  v10.receiver = self;
  v10.super_class = (Class)BuddyBetaEnrollmentStateManager;
  id location = [(BuddyBetaEnrollmentStateManager *)&v10 init];
  objc_storeStrong(&location, location);
  if (location)
  {
    id v2 = objc_alloc_init((Class)NSMutableDictionary);
    v3 = (void *)*((void *)location + 1);
    *((void *)location + 1) = v2;

    dispatch_queue_t v4 = dispatch_queue_create("com.apple.setup.backup_seed_enrolled", 0);
    v5 = (void *)*((void *)location + 2);
    *((void *)location + 2) = v4;

    v6 = objc_retainBlock(&stru_1002B33A8);
    v7 = (void *)*((void *)location + 3);
    *((void *)location + 3) = v6;
  }
  v8 = (BuddyBetaEnrollmentStateManager *)location;
  objc_storeStrong(&location, 0);
  return v8;
}

- (void)loadSeedEnrollmentStateForRestorables:(id)a3 incompatibleWithUpdateVersion:(id)a4 completion:(id)a5
{
  v42 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v40 = 0;
  objc_storeStrong(&v40, a4);
  id v39 = 0;
  objc_storeStrong(&v39, a5);
  id v38 = objc_alloc_init((Class)NSMutableArray);
  memset(__b, 0, sizeof(__b));
  id v7 = location[0];
  id v8 = [v7 countByEnumeratingWithState:__b objects:v44 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)__b[2];
    do
    {
      for (unint64_t i = 0; i < (unint64_t)v8; ++i)
      {
        if (*(void *)__b[2] != v9) {
          objc_enumerationMutation(v7);
        }
        id v37 = *(id *)(__b[1] + 8 * i);
        if (([v37 isCompatible] & 1) == 0
          && ([v37 isCompatibleWithUpdateToSystemVersion:v40] & 1) == 0)
        {
          SEL v11 = [(BuddyBetaEnrollmentStateManager *)v42 backupUDIDToSeedEnrolledMapAccessQueue];
          block = _NSConcreteStackBlock;
          int v29 = -1073741824;
          int v30 = 0;
          v31 = sub_10010FA20;
          v32 = &unk_1002B15F0;
          v33 = v42;
          id v34 = v37;
          id v35 = v38;
          dispatch_sync(v11, &block);

          objc_storeStrong(&v35, 0);
          objc_storeStrong(&v34, 0);
          objc_storeStrong((id *)&v33, 0);
        }
      }
      id v8 = [v7 countByEnumeratingWithState:__b objects:v44 count:16];
    }
    while (v8);
  }

  if ([v38 count])
  {
    os_log_t v24 = (os_log_t)(id)_BYLoggingFacility();
    os_log_type_t v23 = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      sub_100046588((uint64_t)v43, (uint64_t)[v38 count]);
      _os_log_debug_impl((void *)&_mh_execute_header, v24, v23, "Will load seed enrollment state for %lu restorable items", v43, 0xCu);
    }
    objc_storeStrong((id *)&v24, 0);
    v14 = dispatch_get_global_queue(25, 0);
    v15 = _NSConcreteStackBlock;
    int v16 = -1073741824;
    int v17 = 0;
    v18 = sub_10010FAC0;
    v19 = &unk_1002B1758;
    id v20 = v38;
    v21 = v42;
    id v22 = v39;
    dispatch_async(v14, &v15);

    objc_storeStrong(&v22, 0);
    objc_storeStrong((id *)&v21, 0);
    objc_storeStrong(&v20, 0);
  }
  else
  {
    os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
    char v26 = 2;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    {
      v12 = oslog;
      os_log_type_t v13 = v26;
      sub_10004B24C(buf);
      _os_log_debug_impl((void *)&_mh_execute_header, v12, v13, "No restorable items need to load seed enrollment state", buf, 2u);
    }
    objc_storeStrong((id *)&oslog, 0);
    (*((void (**)(void))v39 + 2))();
  }
  objc_storeStrong(&v38, 0);
  objc_storeStrong(&v39, 0);
  objc_storeStrong(&v40, 0);
  objc_storeStrong(location, 0);
}

- (BOOL)isRestorableSeedEnrolled:(id)a3
{
  v18 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  uint64_t v12 = 0;
  os_log_type_t v13 = &v12;
  int v14 = 0x20000000;
  int v15 = 32;
  char v16 = 0;
  v3 = [(BuddyBetaEnrollmentStateManager *)v18 backupUDIDToSeedEnrolledMapAccessQueue];
  v5 = _NSConcreteStackBlock;
  int v6 = -1073741824;
  int v7 = 0;
  id v8 = sub_100110104;
  uint64_t v9 = &unk_1002B2360;
  v11[1] = &v12;
  objc_super v10 = v18;
  v11[0] = location[0];
  dispatch_sync(v3, &v5);

  LOBYTE(v3) = *((unsigned char *)v13 + 24);
  objc_storeStrong(v11, 0);
  objc_storeStrong((id *)&v10, 0);
  _Block_object_dispose(&v12, 8);
  objc_storeStrong(location, 0);
  return v3 & 1;
}

- (NSMutableDictionary)backupUDIDToSeedEnrolledMap
{
  return self->_backupUDIDToSeedEnrolledMap;
}

- (void)setBackupUDIDToSeedEnrolledMap:(id)a3
{
}

- (OS_dispatch_queue)backupUDIDToSeedEnrolledMapAccessQueue
{
  return self->_backupUDIDToSeedEnrolledMapAccessQueue;
}

- (void)setBackupUDIDToSeedEnrolledMapAccessQueue:(id)a3
{
}

- (id)fetchBackupMetadataBlock
{
  return self->_fetchBackupMetadataBlock;
}

- (void)setFetchBackupMetadataBlock:(id)a3
{
}

- (void).cxx_destruct
{
}

@end