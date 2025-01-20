@interface FamilyManager
- (FamilyManager)init;
- (void)_handleAccountChangedNotification;
@end

@implementation FamilyManager

- (FamilyManager)init
{
  v15.receiver = self;
  v15.super_class = (Class)FamilyManager;
  v2 = [(FamilyManager *)&v15 init];
  if (v2)
  {
    v3 = (NSLock *)objc_alloc_init((Class)NSLock);
    lock = v2->_lock;
    v2->_lock = v3;

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.appstored.FamilyManager.dispatch", (dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent);
    dispatch = v2->_dispatch;
    v2->_dispatch = (OS_dispatch_queue *)v5;

    dispatch_queue_t v7 = dispatch_queue_create("com.apple.appstored.FamilyManager.notifications", (dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent);
    notificationQueue = v2->_notificationQueue;
    v2->_notificationQueue = (OS_dispatch_queue *)v7;

    v9 = +[NSNotificationCenter defaultCenter];
    v10 = +[ActiveAccountObserver sharedInstance];
    [v9 addObserver:v2 selector:"_handleAccountChangedNotification" name:@"AccountStorePrimaryAccountDidChange" object:v10];

    v11 = +[ActiveAccountObserver activeAccount];
    uint64_t v12 = objc_msgSend(v11, "ams_DSID");
    currentAccountDSID = v2->_currentAccountDSID;
    v2->_currentAccountDSID = (NSNumber *)v12;
  }
  return v2;
}

- (void)_handleAccountChangedNotification
{
  notificationQueue = self->_notificationQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100421D20;
  block[3] = &unk_100521388;
  block[4] = self;
  dispatch_async(notificationQueue, block);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationQueue, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_familyMembers, 0);
  objc_storeStrong((id *)&self->_familyAccountIDs, 0);
  objc_storeStrong((id *)&self->_dispatch, 0);
  objc_storeStrong((id *)&self->_currentAccountDSID, 0);
}

@end