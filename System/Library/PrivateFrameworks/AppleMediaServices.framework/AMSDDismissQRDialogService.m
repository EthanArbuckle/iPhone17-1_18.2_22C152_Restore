@interface AMSDDismissQRDialogService
+ (AMSDDismissQRDialogService)sharedService;
+ (BOOL)isConnectionEntitled:(id)a3;
- (AMSDDismissQRDialogService)init;
- (NSMutableDictionary)dismissalCompletionQueue;
- (OS_dispatch_queue)taskQueue;
- (os_unfair_lock_s)queueLock;
- (void)notifyDismissDialogWithIdentifier:(id)a3;
- (void)observeQRDialogDismissalNotificationForIdentifier:(id)a3 completion:(id)a4;
- (void)removeQRDialogDismissalObserverForIdentifier:(id)a3 completion:(id)a4;
@end

@implementation AMSDDismissQRDialogService

- (AMSDDismissQRDialogService)init
{
  v9.receiver = self;
  v9.super_class = (Class)AMSDDismissQRDialogService;
  v2 = [(AMSDDismissQRDialogService *)&v9 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.AppleMediaServices.QRCodeDismissal", v3);
    taskQueue = v2->_taskQueue;
    v2->_taskQueue = (OS_dispatch_queue *)v4;

    v6 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    dismissalCompletionQueue = v2->_dismissalCompletionQueue;
    v2->_dismissalCompletionQueue = v6;

    v2->_queueLock._os_unfair_lock_opaque = 0;
  }
  return v2;
}

+ (AMSDDismissQRDialogService)sharedService
{
  if (qword_1001302A8 != -1) {
    dispatch_once(&qword_1001302A8, &stru_1001126F8);
  }
  v2 = (void *)qword_1001302B0;
  return (AMSDDismissQRDialogService *)v2;
}

- (void)observeQRDialogDismissalNotificationForIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(AMSDDismissQRDialogService *)self taskQueue];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10002AD6C;
  v11[3] = &unk_100112408;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  +[AMSDTransactionStore takeKeepAliveTransaction:@"com.apple.amsaccountsd.qrcodedismissal" withQueue:v8 whilePerformingBlock:v11];
}

- (void)removeQRDialogDismissalObserverForIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(AMSDDismissQRDialogService *)self taskQueue];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10002AFD0;
  v11[3] = &unk_100112408;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  +[AMSDTransactionStore takeKeepAliveTransaction:@"com.apple.amsaccountsd.qrcodedismissal" withQueue:v8 whilePerformingBlock:v11];
}

- (void)notifyDismissDialogWithIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(AMSDDismissQRDialogService *)self taskQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10002B208;
  v7[3] = &unk_100112170;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  +[AMSDTransactionStore takeKeepAliveTransaction:@"com.apple.amsaccountsd.qrcodedismissal" withQueue:v5 whilePerformingBlock:v7];
}

+ (BOOL)isConnectionEntitled:(id)a3
{
  v3 = [a3 valueForEntitlement:@"com.apple.private.applemediaservices"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  unsigned __int8 v5 = [v4 BOOLValue];
  return v5;
}

- (OS_dispatch_queue)taskQueue
{
  return self->_taskQueue;
}

- (os_unfair_lock_s)queueLock
{
  return self->_queueLock;
}

- (NSMutableDictionary)dismissalCompletionQueue
{
  return self->_dismissalCompletionQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dismissalCompletionQueue, 0);
  objc_storeStrong((id *)&self->_taskQueue, 0);
}

@end