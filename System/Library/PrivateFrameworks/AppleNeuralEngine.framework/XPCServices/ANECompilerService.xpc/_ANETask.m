@interface _ANETask
+ (id)new;
+ (id)taskWithName:(id)a3 period:(unint64_t)a4 handler:(id)a5;
- (NSString)name;
- (OS_dispatch_queue)queue;
- (OS_xpc_object)executionCriteria;
- (_ANETask)init;
- (_ANETask)initWithName:(id)a3 period:(unint64_t)a4 handler:(id)a5;
- (id)handler;
- (unint64_t)periodSeconds;
@end

@implementation _ANETask

+ (id)new
{
  return 0;
}

- (_ANETask)init
{
  return 0;
}

- (_ANETask)initWithName:(id)a3 period:(unint64_t)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = v9;
  v11 = 0;
  if (v8 && v9)
  {
    v25.receiver = self;
    v25.super_class = (Class)_ANETask;
    v12 = [(_ANETask *)&v25 init];
    if (v12)
    {
      v13 = (NSString *)[v8 copy];
      name = v12->_name;
      v12->_name = v13;

      unint64_t v15 = 5;
      if (a4 > 5) {
        unint64_t v15 = a4;
      }
      v12->_periodSeconds = v15;
      id v16 = objc_retainBlock(v10);
      id handler = v12->_handler;
      v12->_id handler = v16;

      v18 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      dispatch_queue_t v19 = dispatch_queue_create("com.apple._ANETasks.defaultQueue", v18);
      queue = v12->_queue;
      v12->_queue = (OS_dispatch_queue *)v19;

      keys[0] = (char *)XPC_ACTIVITY_INTERVAL;
      keys[1] = (char *)XPC_ACTIVITY_REPEATING;
      keys[2] = (char *)XPC_ACTIVITY_PRIORITY;
      keys[3] = (char *)XPC_ACTIVITY_REQUIRE_SCREEN_SLEEP;
      keys[4] = (char *)XPC_ACTIVITY_POWER_NAP;
      keys[5] = (char *)XPC_ACTIVITY_REQUIRES_CLASS_C;
      values[0] = xpc_int64_create(v12->_periodSeconds);
      values[1] = xpc_BOOL_create(1);
      values[2] = xpc_string_create(XPC_ACTIVITY_PRIORITY_MAINTENANCE);
      values[3] = xpc_BOOL_create(1);
      values[4] = xpc_BOOL_create(1);
      values[5] = xpc_BOOL_create(1);
      v21 = (OS_xpc_object *)xpc_dictionary_create((const char *const *)keys, values, 6uLL);
      executionCriteria = v12->_executionCriteria;
      v12->_executionCriteria = v21;

      for (uint64_t i = 5; i != -1; --i)
    }
    self = v12;
    v11 = self;
  }

  return v11;
}

+ (id)taskWithName:(id)a3 period:(unint64_t)a4 handler:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [objc_alloc((Class)a1) initWithName:v9 period:a4 handler:v8];

  return v10;
}

- (unint64_t)periodSeconds
{
  return self->_periodSeconds;
}

- (NSString)name
{
  return self->_name;
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