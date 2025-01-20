@interface _NMSDispatchQueue
- (BOOL)isSuspended;
- (_NMSDispatchQueue)init;
- (_NMSDispatchQueue)initWithName:(id)a3 attributes:(id)a4 target:(id)a5;
- (void)async:(id)a3;
- (void)dealloc;
- (void)resume;
- (void)suspend;
- (void)sync:(id)a3;
@end

@implementation _NMSDispatchQueue

- (_NMSDispatchQueue)init
{
  v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v4 = [(_NMSDispatchQueue *)self initWithName:@"_NMSDispatchQueue" attributes:v3 target:0];

  return v4;
}

- (_NMSDispatchQueue)initWithName:(id)a3 attributes:(id)a4 target:(id)a5
{
  id v8 = a3;
  v9 = a4;
  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)_NMSDispatchQueue;
  v11 = [(_NMSDispatchQueue *)&v16 init];
  if (v11)
  {
    dispatch_queue_t v12 = dispatch_queue_create_with_target_V2((const char *)[v8 UTF8String], v9, v10);
    q = v11->_q;
    v11->_q = (OS_dispatch_queue *)v12;

    +[SYQueueDumper registerQueue:v11->_q];
    atomic_store(1u, (unsigned __int8 *)&v11->_r);
    v14 = v11;
  }

  return v11;
}

- (void)dealloc
{
  [(_NMSDispatchQueue *)self resume];
  v3.receiver = self;
  v3.super_class = (Class)_NMSDispatchQueue;
  [(_NMSDispatchQueue *)&v3 dealloc];
}

- (BOOL)isSuspended
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_r);
  return (v2 & 1) == 0;
}

- (void)suspend
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  int v2 = 1;
  atomic_compare_exchange_strong((atomic_uchar *volatile)&self->_r, (unsigned __int8 *)&v2, 0);
  if (v2 == 1)
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    v4 = qword_26AB04790;
    if (os_log_type_enabled((os_log_t)qword_26AB04790, OS_LOG_TYPE_DEFAULT))
    {
      label = dispatch_queue_get_label((dispatch_queue_t)self->_q);
      int v6 = 136446210;
      v7 = label;
      _os_log_impl(&dword_21C7C9000, v4, OS_LOG_TYPE_DEFAULT, "Suspending %{public}s", (uint8_t *)&v6, 0xCu);
    }
    dispatch_suspend((dispatch_object_t)self->_q);
  }
}

- (void)resume
{
  char v2 = 0;
  uint64_t v8 = *MEMORY[0x263EF8340];
  atomic_compare_exchange_strong((atomic_uchar *volatile)&self->_r, (unsigned __int8 *)&v2, 1u);
  if (!v2)
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    v4 = qword_26AB04790;
    if (os_log_type_enabled((os_log_t)qword_26AB04790, OS_LOG_TYPE_DEFAULT))
    {
      label = dispatch_queue_get_label((dispatch_queue_t)self->_q);
      int v6 = 136446210;
      v7 = label;
      _os_log_impl(&dword_21C7C9000, v4, OS_LOG_TYPE_DEFAULT, "Resuming %{public}s", (uint8_t *)&v6, 0xCu);
    }
    dispatch_resume((dispatch_object_t)self->_q);
  }
}

- (void)sync:(id)a3
{
}

- (void)async:(id)a3
{
}

- (void).cxx_destruct
{
}

@end