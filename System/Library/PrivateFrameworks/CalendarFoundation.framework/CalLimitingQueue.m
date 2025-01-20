@interface CalLimitingQueue
- (CalLimitingQueue)initWithQueue:(id)a3 andBlock:(id)a4;
- (id)queue;
- (void)executeBlock;
@end

@implementation CalLimitingQueue

- (CalLimitingQueue)initWithQueue:(id)a3 andBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CalLimitingQueue;
  id v8 = [(CalLimitingQueue *)&v14 init];
  if (v8)
  {
    if (v6) {
      dispatch_queue_t v9 = (dispatch_queue_t)v6;
    }
    else {
      dispatch_queue_t v9 = dispatch_queue_create("CalLimitingQueue", 0);
    }
    v10 = (void *)*((void *)v8 + 1);
    *((void *)v8 + 1) = v9;

    dispatch_source_t v11 = dispatch_source_create(MEMORY[0x1E4F14440], 0, 0, *((dispatch_queue_t *)v8 + 1));
    v12 = (void *)*((void *)v8 + 2);
    *((void *)v8 + 2) = v11;

    dispatch_source_set_event_handler(*((dispatch_source_t *)v8 + 2), v7);
    dispatch_resume(*((dispatch_object_t *)v8 + 2));
  }

  return (CalLimitingQueue *)v8;
}

- (void)executeBlock
{
}

- (id)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_source, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end