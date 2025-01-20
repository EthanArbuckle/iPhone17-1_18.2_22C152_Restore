@interface CLSDarwinNotificationCenter
+ (id)defaultCenter;
- (CLSDarwinNotificationCenter)init;
- (void)addObserver:(id)a3 notificationName:(id)a4 block:(id)a5;
- (void)handleObserverRemoval;
- (void)postLocalNotificationName:(id)a3;
- (void)postNotificationName:(id)a3;
- (void)removeObserver:(id)a3 notificationName:(id)a4;
- (void)unregisterFromDarwinNotification:(id)a3;
@end

@implementation CLSDarwinNotificationCenter

+ (id)defaultCenter
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1DC63F244;
  block[3] = &unk_1E6C95AC0;
  block[4] = a1;
  if (qword_1EB5D4998 != -1) {
    dispatch_once(&qword_1EB5D4998, block);
  }
  v2 = (void *)qword_1EB5D49A0;

  return v2;
}

- (CLSDarwinNotificationCenter)init
{
  v24.receiver = self;
  v24.super_class = (Class)CLSDarwinNotificationCenter;
  v2 = [(CLSDarwinNotificationCenter *)&v24 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_UTILITY, 0);

    dispatch_queue_t v5 = dispatch_queue_create("CLSDarwinNotificationCenterQ", v4);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    uint64_t v9 = objc_msgSend_strongToStrongObjectsMapTable(MEMORY[0x1E4F28E10], v7, v8);
    notificationsByName = v2->_notificationsByName;
    v2->_notificationsByName = (NSMapTable *)v9;

    uint64_t v13 = objc_msgSend_weakToStrongObjectsMapTable(MEMORY[0x1E4F28E10], v11, v12);
    notificationsByObserver = v2->_notificationsByObserver;
    v2->_notificationsByObserver = (NSMapTable *)v13;

    uint64_t v17 = objc_msgSend_strongToStrongObjectsMapTable(MEMORY[0x1E4F28E10], v15, v16);
    tokenByName = v2->_tokenByName;
    v2->_tokenByName = (NSMapTable *)v17;

    uint64_t v21 = objc_msgSend_strongToWeakObjectsMapTable(MEMORY[0x1E4F28E10], v19, v20);
    observerByHash = v2->_observerByHash;
    v2->_observerByHash = (NSMapTable *)v21;
  }
  return v2;
}

- (void)unregisterFromDarwinNotification:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v6 = objc_msgSend_objectForKey_(self->_tokenByName, v5, (uint64_t)v4);
  uint64_t v9 = v6;
  if (v6)
  {
    int v10 = objc_msgSend_intValue(v6, v7, v8);
    if (notify_is_valid_token(v10))
    {
      uint32_t v12 = notify_cancel(v10);
      if (qword_1EB5D4D10 != -1) {
        dispatch_once(&qword_1EB5D4D10, &unk_1F37A1810);
      }
      uint64_t v13 = CLSLogNotifications;
      if (v12)
      {
        if (os_log_type_enabled((os_log_t)CLSLogNotifications, OS_LOG_TYPE_ERROR))
        {
          int v14 = 138412546;
          id v15 = v4;
          __int16 v16 = 1024;
          uint32_t v17 = v12;
            (uint8_t *)&v14,
            0x12u);
        }
      }
      else if (os_log_type_enabled((os_log_t)CLSLogNotifications, OS_LOG_TYPE_DEFAULT))
      {
        int v14 = 138412290;
        id v15 = v4;
      }
    }
    objc_msgSend_removeObjectForKey_(self->_tokenByName, v11, (uint64_t)v4);
  }
}

- (void)handleObserverRemoval
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1DC63F578;
  block[3] = &unk_1E6C96348;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)addObserver:(id)a3 notificationName:(id)a4 block:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v8) {
    __assert_rtn("-[CLSDarwinNotificationCenter addObserver:notificationName:block:]", "CLSDarwinNotificationCenter.m", 161, "observer != nil");
  }
  if (!v9) {
    __assert_rtn("-[CLSDarwinNotificationCenter addObserver:notificationName:block:]", "CLSDarwinNotificationCenter.m", 162, "name != nil");
  }
  if (!v10) {
    __assert_rtn("-[CLSDarwinNotificationCenter addObserver:notificationName:block:]", "CLSDarwinNotificationCenter.m", 163, "block != nil");
  }
  queue = self->_queue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = sub_1DC63F8B4;
  v15[3] = &unk_1E6C96490;
  v15[4] = self;
  id v16 = v9;
  id v17 = v8;
  id v18 = v10;
  id v12 = v10;
  id v13 = v8;
  id v14 = v9;
  dispatch_async(queue, v15);
}

- (void)postNotificationName:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1DC63FF20;
    block[3] = &unk_1E6C96348;
    id v8 = v4;
    dispatch_async(queue, block);
  }
}

- (void)postLocalNotificationName:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = sub_1DC64010C;
    v7[3] = &unk_1E6C964B8;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

- (void)removeObserver:(id)a3 notificationName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6) {
    __assert_rtn("-[CLSDarwinNotificationCenter removeObserver:notificationName:]", "CLSDarwinNotificationCenter.m", 269, "observer != nil");
  }
  id v10 = v7;
  uint64_t v11 = objc_msgSend_hash(v6, v8, v9);
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1DC6403F4;
  block[3] = &unk_1E6C962D8;
  id v15 = v10;
  uint64_t v16 = v11;
  void block[4] = self;
  id v13 = v10;
  dispatch_async(queue, block);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observerByHash, 0);
  objc_storeStrong((id *)&self->_tokenByName, 0);
  objc_storeStrong((id *)&self->_notificationsByObserver, 0);
  objc_storeStrong((id *)&self->_notificationsByName, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end