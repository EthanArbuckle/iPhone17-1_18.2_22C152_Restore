@interface _DPPeriodicTask
+ (id)taskWithName:(id)a3 period:(unint64_t)a4 handler:(id)a5;
+ (id)taskWithName:(id)a3 period:(unint64_t)a4 handler:(id)a5 networkingRequired:(BOOL)a6;
- (BOOL)networkingRequired;
- (NSString)name;
- (OS_dispatch_queue)queue;
- (OS_xpc_object)executionCriteria;
- (_DPPeriodicTask)init;
- (_DPPeriodicTask)initWithName:(id)a3 period:(unint64_t)a4 handler:(id)a5;
- (_DPPeriodicTask)initWithName:(id)a3 period:(unint64_t)a4 handler:(id)a5 networkingRequired:(BOOL)a6;
- (id)handler;
- (unint64_t)periodSeconds;
@end

@implementation _DPPeriodicTask

- (_DPPeriodicTask)init
{
  return 0;
}

- (_DPPeriodicTask)initWithName:(id)a3 period:(unint64_t)a4 handler:(id)a5
{
  return [(_DPPeriodicTask *)self initWithName:a3 period:a4 handler:a5 networkingRequired:0];
}

- (_DPPeriodicTask)initWithName:(id)a3 period:(unint64_t)a4 handler:(id)a5 networkingRequired:(BOOL)a6
{
  keys[6] = *(char **)MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  v12 = v11;
  v13 = 0;
  if (v10 && v11)
  {
    v33.receiver = self;
    v33.super_class = (Class)_DPPeriodicTask;
    v14 = [(_DPPeriodicTask *)&v33 init];
    if (v14)
    {
      uint64_t v15 = [v10 copy];
      name = v14->_name;
      v14->_name = (NSString *)v15;

      v14->_networkingRequired = a6;
      unint64_t v17 = 5;
      if (a4 > 5) {
        unint64_t v17 = a4;
      }
      v14->_periodSeconds = v17;
      uint64_t v18 = MEMORY[0x1E019FA60](v12);
      id handler = v14->_handler;
      v14->_id handler = (id)v18;

      v20 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      dispatch_queue_t v21 = dispatch_queue_create("com.apple._DPPeriodicTasks.defaultQueue", v20);
      queue = v14->_queue;
      v14->_queue = (OS_dispatch_queue *)v21;

      v23 = (char *)*MEMORY[0x1E4F142F8];
      keys[0] = *(char **)MEMORY[0x1E4F141C8];
      keys[1] = v23;
      v24 = (char *)*MEMORY[0x1E4F14340];
      keys[2] = *(char **)MEMORY[0x1E4F142C8];
      keys[3] = v24;
      v25 = (char *)*MEMORY[0x1E4F14320];
      keys[4] = *(char **)MEMORY[0x1E4F142B0];
      keys[5] = v25;
      values[0] = xpc_int64_create(v14->_periodSeconds);
      values[1] = xpc_BOOL_create(1);
      values[2] = xpc_string_create((const char *)*MEMORY[0x1E4F142D0]);
      values[3] = xpc_BOOL_create(1);
      values[4] = xpc_BOOL_create(1);
      values[5] = xpc_BOOL_create(1);
      v26 = (OS_xpc_object *)xpc_dictionary_create((const char *const *)keys, values, 6uLL);
      executionCriteria = v14->_executionCriteria;
      v14->_executionCriteria = v26;

      if (v14->_networkingRequired)
      {
        v28 = v14->_executionCriteria;
        v29 = (const char *)*MEMORY[0x1E4F14330];
        xpc_object_t v30 = xpc_BOOL_create(1);
        xpc_dictionary_set_BOOL(v28, v29, v30 != 0);
      }
      for (uint64_t i = 5; i != -1; --i)
    }
    self = v14;
    v13 = self;
  }

  return v13;
}

+ (id)taskWithName:(id)a3 period:(unint64_t)a4 handler:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  v9 = [(id)objc_opt_class() taskWithName:v8 period:a4 handler:v7 networkingRequired:0];

  return v9;
}

+ (id)taskWithName:(id)a3 period:(unint64_t)a4 handler:(id)a5 networkingRequired:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a5;
  id v11 = a3;
  v12 = (void *)[objc_alloc((Class)a1) initWithName:v11 period:a4 handler:v10 networkingRequired:v6];

  return v12;
}

- (unint64_t)periodSeconds
{
  return self->_periodSeconds;
}

- (NSString)name
{
  return self->_name;
}

- (BOOL)networkingRequired
{
  return self->_networkingRequired;
}

- (id)handler
{
  return self->_handler;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (OS_xpc_object)executionCriteria
{
  return self->_executionCriteria;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_executionCriteria, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end