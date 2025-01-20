@interface DeepSyncVerificationService
- (DeepSyncVerificationService)init;
- (void)_prepareVerificationServiceProviders;
- (void)getVerificationResultsWithHandler:(id)a3;
- (void)handleSyncChunk:(id)a3;
- (void)startVerificationForKeys:(id)a3;
@end

@implementation DeepSyncVerificationService

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_verificationProviders, 0);
  objc_storeStrong((id *)&self->_currentKeysInVerification, 0);
}

- (void)getVerificationResultsWithHandler:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100008B24;
  v7[3] = &unk_10000C4B8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)handleSyncChunk:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100009088;
  v7[3] = &unk_10000C440;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)startVerificationForKeys:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100009340;
  v7[3] = &unk_10000C440;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)_prepareVerificationServiceProviders
{
  v3 = objc_alloc_init(DSVServiceProviderApps);
  id v4 = objc_alloc_init(DSVServiceProviderContacts);
  v7[0] = v3;
  v7[1] = v4;
  v5 = +[NSArray arrayWithObjects:v7 count:2];
  verificationProviders = self->_verificationProviders;
  self->_verificationProviders = v5;
}

- (DeepSyncVerificationService)init
{
  v6.receiver = self;
  v6.super_class = (Class)DeepSyncVerificationService;
  v2 = [(DeepSyncVerificationService *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("DeepSyncVerificationService", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    AFLogInitIfNeeded();
  }
  return v2;
}

@end