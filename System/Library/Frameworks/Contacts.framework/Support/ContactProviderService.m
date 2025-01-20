@interface ContactProviderService
+ (id)sharedInstance;
- (CNScheduler)workQueue;
- (ContactProviderService)init;
- (ContactProviderService)initWithSchedulerProvider:(id)a3;
- (OS_os_log)log;
- (void)handleBundleIdentifiers:(id)a3;
@end

@implementation ContactProviderService

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100010FC0;
  block[3] = &unk_100024B30;
  block[4] = a1;
  if (qword_10002CB18 != -1) {
    dispatch_once(&qword_10002CB18, block);
  }
  v2 = (void *)qword_10002CB20;

  return v2;
}

- (ContactProviderService)init
{
  v3 = +[CNSchedulerProvider defaultProvider];
  v4 = [(ContactProviderService *)self initWithSchedulerProvider:v3];

  return v4;
}

- (ContactProviderService)initWithSchedulerProvider:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ContactProviderService;
  v5 = [(ContactProviderService *)&v13 init];
  if (v5)
  {
    id v6 = [v4 newSerialSchedulerWithName:@"com.apple.contactsd.ContactProviderService"];
    v7 = (CNScheduler *)[objc_alloc((Class)CNQualityOfServiceSchedulerDecorator) initWithScheduler:v6 qualityOfService:2];
    workQueue = v5->_workQueue;
    v5->_workQueue = v7;

    os_log_t v9 = os_log_create("com.apple.contacts.provider", "ContactProviderService");
    log = v5->_log;
    v5->_log = (OS_os_log *)v9;

    v11 = v5;
  }

  return v5;
}

- (void)handleBundleIdentifiers:(id)a3
{
  id v4 = a3;
  v5 = [(ContactProviderService *)self workQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000111C0;
  v7[3] = &unk_100024C40;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 performBlock:v7];
}

- (CNScheduler)workQueue
{
  return self->_workQueue;
}

- (OS_os_log)log
{
  return self->_log;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);

  objc_storeStrong((id *)&self->_workQueue, 0);
}

@end