@interface IDSDaemonPriorityQueueController
+ (id)sharedInstance;
- (IDSDaemonPriorityQueueController)init;
- (id)_queueForImplicitPriority:(int64_t)a3;
- (id)queueForPriority:(int64_t)a3;
- (void)assertRunningOnMain;
- (void)assertRunningWithPriority:(int64_t)a3;
- (void)performBlock:(id)a3 withImplicitPriority:(int64_t)a4;
- (void)performBlockDefaultPriority:(id)a3;
- (void)performBlockMainQueue:(id)a3;
- (void)performBlockMainQueue:(id)a3 afterTimeMSec:(unsigned int)a4;
- (void)performBlockSYNCHRONOUSLYWithPriority:(id)a3 priority:(int64_t)a4;
- (void)performBlockSyncPriority:(id)a3;
- (void)performBlockUrgentPriority:(id)a3;
- (void)performBlockWithPriority:(id)a3 priority:(int64_t)a4;
@end

@implementation IDSDaemonPriorityQueueController

+ (id)sharedInstance
{
  if (qword_100A4C8E8 != -1) {
    dispatch_once(&qword_100A4C8E8, &stru_10098B3B8);
  }
  v2 = (void *)qword_100A4C8F0;

  return v2;
}

- (void)assertRunningWithPriority:(int64_t)a3
{
  v3 = [(IDSDaemonPriorityQueueController *)self queueForPriority:a3];
  dispatch_assert_queue_V2(v3);
}

- (void)performBlockSYNCHRONOUSLYWithPriority:(id)a3 priority:(int64_t)a4
{
  id v6 = a3;
  [(IDSDaemonPriorityQueueController *)self assertRunningOnMain];
  v7 = [(IDSDaemonPriorityQueueController *)self queueForPriority:a4];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000045FC;
  block[3] = &unk_10097E7F0;
  id v10 = v6;
  id v8 = v6;
  dispatch_sync(v7, block);
}

- (id)queueForPriority:(int64_t)a3
{
  switch(a3)
  {
    case 100:
      uint64_t v3 = 8;
      break;
    case 300:
      uint64_t v3 = 24;
      break;
    case 200:
      uint64_t v3 = 16;
      break;
    default:
      abort();
  }
  v4 = *(Class *)((char *)&self->super.isa + v3);

  return v4;
}

- (void)assertRunningOnMain
{
  if (!pthread_main_np())
  {
    v2 = im_primary_base_queue();
    dispatch_assert_queue_V2(v2);
  }
}

- (void)performBlockUrgentPriority:(id)a3
{
  id v4 = a3;
  urgent_queue = self->_urgent_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000C60C;
  block[3] = &unk_10097E7F0;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(urgent_queue, block);
}

- (void)performBlockSyncPriority:(id)a3
{
  id v4 = a3;
  sync_queue = self->_sync_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000C658;
  block[3] = &unk_10097E7F0;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(sync_queue, block);
}

- (void)performBlockDefaultPriority:(id)a3
{
  id v4 = a3;
  default_queue = self->_default_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000C5C0;
  block[3] = &unk_10097E7F0;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(default_queue, block);
}

- (IDSDaemonPriorityQueueController)init
{
  v14.receiver = self;
  v14.super_class = (Class)IDSDaemonPriorityQueueController;
  v2 = [(IDSDaemonPriorityQueueController *)&v14 init];
  if (v2)
  {
    uint64_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v4 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v5 = dispatch_queue_create("IDSDaemonPriorityQueueSync", v4);
    sync_queue = v2->_sync_queue;
    v2->_sync_queue = (OS_dispatch_queue *)v5;

    v7 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_DEFAULT, 0);
    dispatch_queue_t v8 = dispatch_queue_create("IDSDaemonPriorityQueueDefault", v7);
    default_queue = v2->_default_queue;
    v2->_default_queue = (OS_dispatch_queue *)v8;

    id v10 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v11 = dispatch_queue_create("IDSDaemonPriorityQueueUrgent", v10);
    urgent_queue = v2->_urgent_queue;
    v2->_urgent_queue = (OS_dispatch_queue *)v11;
  }
  return v2;
}

- (id)_queueForImplicitPriority:(int64_t)a3
{
  switch(a3)
  {
    case 300:
      urgent_queue = self->_urgent_queue;
      goto LABEL_7;
    case 200:
      urgent_queue = self->_default_queue;
      goto LABEL_7;
    case 100:
      urgent_queue = self->_sync_queue;
LABEL_7:
      id v4 = urgent_queue;
      goto LABEL_9;
  }
  im_primary_queue();
  id v4 = (OS_dispatch_queue *)objc_claimAutoreleasedReturnValue();
LABEL_9:

  return v4;
}

- (void)performBlock:(id)a3 withImplicitPriority:(int64_t)a4
{
  id v6 = a3;
  v7 = [(IDSDaemonPriorityQueueController *)self _queueForImplicitPriority:a4];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1003D1F08;
  block[3] = &unk_10097E7F0;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(v7, block);
}

- (void)performBlockMainQueue:(id)a3
{
  id v3 = a3;
  id v4 = im_primary_queue();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1003D1FF8;
  block[3] = &unk_10097E7F0;
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, block);
}

- (void)performBlockMainQueue:(id)a3 afterTimeMSec:(unsigned int)a4
{
  id v6 = a3;
  if (a4)
  {
    dispatch_time_t v7 = dispatch_time(0, 1000000 * a4);
    id v8 = im_primary_queue();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1003D2124;
    block[3] = &unk_10097E7F0;
    id v10 = v6;
    dispatch_after(v7, v8, block);
  }
  else
  {
    [(IDSDaemonPriorityQueueController *)self performBlockMainQueue:v6];
  }
}

- (void)performBlockWithPriority:(id)a3 priority:(int64_t)a4
{
  id v6 = a3;
  dispatch_time_t v7 = [(IDSDaemonPriorityQueueController *)self queueForPriority:a4];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1003D222C;
  block[3] = &unk_10097E7F0;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(v7, block);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urgent_queue, 0);
  objc_storeStrong((id *)&self->_default_queue, 0);

  objc_storeStrong((id *)&self->_sync_queue, 0);
}

@end