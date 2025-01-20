@interface NBFamilyCircleDataSource
+ (id)sharedInstance;
- (AAUIProfilePictureStore)profilePictureStore;
- (NBFamilyCircleDataSource)init;
- (NSArray)familyMemberDSIDs;
- (NSArray)familyMembers;
- (NSMutableArray)observers;
- (NSNumber)refreshing;
- (id)_profileImageForFamilyMember:(id)a3;
- (os_unfair_lock_s)accessLock;
- (os_unfair_lock_s)observerLock;
- (void)_notifyDidFetchFamilyCircle;
- (void)_notifyProfileImagesDidChange;
- (void)_profilePictureStoreDidChange:(id)a3;
- (void)_updateProfilePictures;
- (void)addObserver:(id)a3;
- (void)refresh;
- (void)removeObserver:(id)a3;
- (void)setAccessLock:(os_unfair_lock_s)a3;
- (void)setFamilyMembers:(id)a3;
- (void)setObserverLock:(os_unfair_lock_s)a3;
- (void)setObservers:(id)a3;
- (void)setProfilePictureStore:(id)a3;
- (void)setRefreshing:(id)a3;
@end

@implementation NBFamilyCircleDataSource

- (NBFamilyCircleDataSource)init
{
  v11.receiver = self;
  v11.super_class = (Class)NBFamilyCircleDataSource;
  v2 = [(NBFamilyCircleDataSource *)&v11 init];
  if (v2)
  {
    v3 = (AAUIProfilePictureStore *)objc_alloc_init((Class)AAUIProfilePictureStore);
    profilePictureStore = v2->_profilePictureStore;
    v2->_profilePictureStore = v3;

    [(AAUIProfilePictureStore *)v2->_profilePictureStore setMonogramType:0];
    [(AAUIProfilePictureStore *)v2->_profilePictureStore setPictureDiameter:50.0];
    v2->_accessLock._os_unfair_lock_opaque = 0;
    familyMembers = v2->_familyMembers;
    v2->_familyMembers = (NSArray *)&__NSArray0__struct;

    refreshing = v2->_refreshing;
    v2->_refreshing = (NSNumber *)&__kCFBooleanFalse;

    v2->_observerLock._os_unfair_lock_opaque = 0;
    uint64_t v7 = objc_opt_new();
    observers = v2->_observers;
    v2->_observers = (NSMutableArray *)v7;

    v9 = +[NSNotificationCenter defaultCenter];
    [v9 addObserver:v2 selector:"_profilePictureStoreDidChange:" name:AAUIProfilePictureStoreDidChangeNotification object:0];
  }
  return v2;
}

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_5884;
  block[3] = &unk_208C8;
  block[4] = a1;
  if (qword_280D8 != -1) {
    dispatch_once(&qword_280D8, block);
  }
  v2 = (void *)qword_280D0;

  return v2;
}

- (NSArray)familyMembers
{
  p_accessLock = &self->_accessLock;
  os_unfair_lock_lock(&self->_accessLock);
  id v4 = [(NSArray *)self->_familyMembers copy];
  os_unfair_lock_unlock(p_accessLock);

  return (NSArray *)v4;
}

- (NSArray)familyMemberDSIDs
{
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = sub_5A50;
  v16 = sub_5A60;
  id v17 = (id)objc_opt_new();
  p_accessLock = &self->_accessLock;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v8 = sub_5A68;
  v9 = &unk_208F0;
  v10 = self;
  objc_super v11 = &v12;
  id v4 = v7;
  os_unfair_lock_lock(p_accessLock);
  v8((uint64_t)v4);
  os_unfair_lock_unlock(p_accessLock);

  id v5 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return (NSArray *)v5;
}

- (void)setFamilyMembers:(id)a3
{
  p_accessLock = &self->_accessLock;
  id v5 = a3;
  os_unfair_lock_lock(p_accessLock);
  v6 = (NSArray *)[v5 copy];

  familyMembers = self->_familyMembers;
  self->_familyMembers = v6;

  os_unfair_lock_unlock(p_accessLock);
}

- (void)refresh
{
  v3 = self->_refreshing;
  objc_sync_enter(v3);
  if ([(NSNumber *)self->_refreshing BOOLValue])
  {
    objc_sync_exit(v3);

    id v4 = NBDefaultLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_INFO, "Already refreshing the family circle data source", buf, 2u);
    }
  }
  else
  {
    refreshing = self->_refreshing;
    self->_refreshing = (NSNumber *)&__kCFBooleanTrue;

    objc_sync_exit(v3);
    v6 = +[BUAccountsProvider sharedProvider];
    id v4 = [v6 activeStoreAccount];

    uint64_t v7 = +[BUBag defaultBag];
    id v8 = [objc_alloc((Class)AMSFamilyInfoLookupTask) initWithAccount:v4 bag:v7];
    v9 = [v8 performFamilyInfoLookup];
    v10 = NBDefaultLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      objc_super v11 = [v4 ams_DSID];
      *(_DWORD *)buf = 138412290;
      v15 = v11;
      _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "Starting family Circle lookup request for (%@)", buf, 0xCu);
    }
    objc_initWeak((id *)buf, self);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_5F14;
    v12[3] = &unk_20940;
    objc_copyWeak(&v13, (id *)buf);
    [v9 addFinishBlock:v12];
    objc_destroyWeak(&v13);
    objc_destroyWeak((id *)buf);
  }
}

- (void)addObserver:(id)a3
{
  p_observerLock = &self->_observerLock;
  id v5 = a3;
  os_unfair_lock_lock(p_observerLock);
  [(NSMutableArray *)self->_observers addObject:v5];

  os_unfair_lock_unlock(p_observerLock);
}

- (void)removeObserver:(id)a3
{
  p_observerLock = &self->_observerLock;
  id v5 = a3;
  os_unfair_lock_lock(p_observerLock);
  [(NSMutableArray *)self->_observers removeObject:v5];

  os_unfair_lock_unlock(p_observerLock);
}

- (void)_notifyDidFetchFamilyCircle
{
  p_observerLock = &self->_observerLock;
  os_unfair_lock_lock(&self->_observerLock);
  id v4 = [(NSMutableArray *)self->_observers copy];
  os_unfair_lock_unlock(p_observerLock);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v12 + 1) + 8 * (void)v9);
        objc_super v11 = [(NBFamilyCircleDataSource *)self familyMembers];
        [v10 familyCircleDataSource:self didFetchFamilyCircle:v11];

        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
}

- (void)_notifyProfileImagesDidChange
{
  p_observerLock = &self->_observerLock;
  os_unfair_lock_lock(&self->_observerLock);
  id v4 = [(NSMutableArray *)self->_observers copy];
  os_unfair_lock_unlock(p_observerLock);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * (void)v9), "familyCircleDataSourceProfileImagesDidChange:", self, (void)v10);
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (id)_profileImageForFamilyMember:(id)a3
{
  id v4 = a3;
  id v5 = [v4 firstName];
  if (v5)
  {
    id v6 = [v4 lastName];
    if (v6)
    {

LABEL_6:
      goto LABEL_7;
    }
  }
  id v7 = [v4 iCloudUsername];
  if (v7)
  {

    if (!v5) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  long long v15 = [v4 iCloudDSID];

  if (v5) {
  if (v15)
  }
  {
LABEL_7:
    id v8 = objc_alloc_init((Class)AAFamilyMember);
    v9 = [v4 firstName];
    [v8 setFirstName:v9];

    long long v10 = [v4 lastName];
    [v8 setLastName:v10];

    long long v11 = [v4 iCloudDSID];
    [v8 setPersonID:v11];

    long long v12 = [v4 iCloudUsername];
    [v8 setAppleID:v12];

    long long v13 = [(NBFamilyCircleDataSource *)self profilePictureStore];
    long long v14 = [v13 profilePictureForFamilyMember:v8];

    if (v14) {
      goto LABEL_17;
    }
  }
  id v16 = [objc_alloc((Class)CNMonogrammer) initWithStyle:0 diameter:50.0];
  uint64_t v17 = [v4 firstName];
  if (v17
    && (v18 = (void *)v17,
        [v4 lastName],
        v19 = objc_claimAutoreleasedReturnValue(),
        v19,
        v18,
        v19))
  {
    v20 = [v4 firstName];
    v21 = [v4 lastName];
    long long v14 = [v16 monogramForPersonWithFirstName:v20 lastName:v21];
  }
  else
  {
    long long v14 = [v16 silhouetteMonogram];
  }

LABEL_17:

  return v14;
}

- (void)_updateProfilePictures
{
  p_accessLock = &self->_accessLock;
  os_unfair_lock_lock(&self->_accessLock);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = self->_familyMembers;
  id v5 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        long long v10 = -[NBFamilyCircleDataSource _profileImageForFamilyMember:](self, "_profileImageForFamilyMember:", v9, (void)v11);
        objc_msgSend(v9, "setNb_profileImage:", v10);
      }
      id v6 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  os_unfair_lock_unlock(p_accessLock);
  [(NBFamilyCircleDataSource *)self _notifyProfileImagesDidChange];
}

- (void)_profilePictureStoreDidChange:(id)a3
{
}

- (NSNumber)refreshing
{
  return self->_refreshing;
}

- (void)setRefreshing:(id)a3
{
}

- (os_unfair_lock_s)accessLock
{
  return self->_accessLock;
}

- (void)setAccessLock:(os_unfair_lock_s)a3
{
  self->_accessLock = a3;
}

- (os_unfair_lock_s)observerLock
{
  return self->_observerLock;
}

- (void)setObserverLock:(os_unfair_lock_s)a3
{
  self->_observerLock = a3;
}

- (NSMutableArray)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (AAUIProfilePictureStore)profilePictureStore
{
  return self->_profilePictureStore;
}

- (void)setProfilePictureStore:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_profilePictureStore, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_refreshing, 0);

  objc_storeStrong((id *)&self->_familyMembers, 0);
}

@end