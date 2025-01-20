@interface APSDiagnostic
+ (id)sharedInstance;
- (APSDiagnostic)init;
- (void)promptTapToRadarWithURL:(id)a3;
@end

@implementation APSDiagnostic

+ (id)sharedInstance
{
  if (qword_10015A980 != -1) {
    dispatch_once(&qword_10015A980, &stru_10012BF10);
  }
  v2 = (void *)qword_10015A978;
  return v2;
}

- (APSDiagnostic)init
{
  v8.receiver = self;
  v8.super_class = (Class)APSDiagnostic;
  v2 = [(APSDiagnostic *)&v8 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.aps.diagnostic-queue", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    v5 = v2->_queue;
    v6 = dispatch_get_global_queue(-32768, 0);
    dispatch_set_target_queue(v5, v6);
  }
  return v2;
}

- (void)promptTapToRadarWithURL:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10008DD7C;
  block[3] = &unk_10012A5E0;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, block);
}

- (void).cxx_destruct
{
}

@end