@interface IDSInternalQueueController
+ (IDSInternalQueueController)sharedInstance;
- (BOOL)assertQueueIsCurrent;
- (BOOL)assertQueueIsNotCurrent;
- (BOOL)isQueueCurrent;
- (IDSInternalQueueController)init;
- (IDSInternalQueueController)initWithName:(char *)a3 contextKey:(void *)a4;
- (IDSInternalQueueController)initWithQueue:(id)a3;
- (id)queue;
- (void)performBlock:(id)a3;
- (void)performBlock:(id)a3 waitUntilDone:(BOOL)a4;
@end

@implementation IDSInternalQueueController

- (IDSInternalQueueController)initWithName:(char *)a3 contextKey:(void *)a4
{
  v11.receiver = self;
  v11.super_class = (Class)IDSInternalQueueController;
  id v6 = [(IDSInternalQueueController *)&v11 init];
  if (v6)
  {
    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v8 = dispatch_queue_create(a3, v7);
    v9 = (void *)*((void *)v6 + 1);
    *((void *)v6 + 1) = v8;

    *((void *)v6 + 2) = a4;
    dispatch_queue_set_specific(*((dispatch_queue_t *)v6 + 1), a4, (void *)1, 0);
  }
  return (IDSInternalQueueController *)v6;
}

- (id)queue
{
  return self->_queue;
}

+ (IDSInternalQueueController)sharedInstance
{
  if (qword_1EB2BD870 != -1) {
    dispatch_once(&qword_1EB2BD870, &unk_1EE246988);
  }
  v2 = (void *)qword_1EB2BD830;

  return (IDSInternalQueueController *)v2;
}

- (BOOL)assertQueueIsCurrent
{
  return dispatch_get_specific(self->_contextKey) == 0;
}

- (void)performBlock:(id)a3 waitUntilDone:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = (void (**)(void))a3;
  block = v6;
  if (v4)
  {
    if (dispatch_get_specific(self->_contextKey)) {
      block[2]();
    }
    else {
      dispatch_sync((dispatch_queue_t)self->_queue, block);
    }
  }
  else
  {
    dispatch_async((dispatch_queue_t)self->_queue, v6);
  }
}

- (void)performBlock:(id)a3
{
}

- (BOOL)isQueueCurrent
{
  return dispatch_get_specific(self->_contextKey) != 0;
}

- (IDSInternalQueueController)init
{
  return [(IDSInternalQueueController *)self initWithName:"IDSInternalQueue" contextKey:"IDSInternalQueueControllerContext"];
}

- (BOOL)assertQueueIsNotCurrent
{
  return dispatch_get_specific(self->_contextKey) != 0;
}

- (IDSInternalQueueController)initWithQueue:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IDSInternalQueueController;
  id v6 = [(IDSInternalQueueController *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_queue, a3);
    v7->_contextKey = "IDSInternalQueueControllerContext";
    dispatch_queue_set_specific((dispatch_queue_t)v7->_queue, "IDSInternalQueueControllerContext", (void *)1, 0);
  }

  return v7;
}

- (void).cxx_destruct
{
}

@end