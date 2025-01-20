@interface TKHostKeychainHandler
+ (BOOL)isUnlocked;
- (TKHostKeychainHandler)init;
- (id)operations;
- (void)accessKeychainWithBlock:(id)a3;
- (void)dealloc;
@end

@implementation TKHostKeychainHandler

- (TKHostKeychainHandler)init
{
  v7.receiver = self;
  v7.super_class = (Class)TKHostKeychainHandler;
  v2 = [(TKHostKeychainHandler *)&v7 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("mkb-keychain-monitor", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;
  }
  return v2;
}

+ (BOOL)isUnlocked
{
  int v2 = MKBGetDeviceLockState();
  return !v2 || v2 == 3;
}

- (void)accessKeychainWithBlock:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000D35C;
  v7[3] = &unk_100020800;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

- (void)dealloc
{
  int notifyToken = self->_notifyToken;
  if (notifyToken) {
    notify_cancel(notifyToken);
  }
  v4.receiver = self;
  v4.super_class = (Class)TKHostKeychainHandler;
  [(TKHostKeychainHandler *)&v4 dealloc];
}

- (id)operations
{
  if (qword_100028060 != -1) {
    dispatch_once(&qword_100028060, &stru_100020820);
  }
  int v2 = (void *)qword_100028058;

  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_queuedBlocks, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end