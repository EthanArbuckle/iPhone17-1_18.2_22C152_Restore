@interface _ANESharedWaitEvent
+ (id)new;
+ (id)waitEventWithValue:(unint64_t)a3 sharedEvent:(id)a4;
+ (id)waitEventWithValue:(unint64_t)a3 sharedEvent:(id)a4 eventType:(unint64_t)a5;
- (IOSurfaceSharedEvent)sharedEvent;
- (_ANESharedWaitEvent)init;
- (_ANESharedWaitEvent)initWithValue:(unint64_t)a3 sharedEvent:(id)a4 eventType:(unint64_t)a5;
- (id)description;
- (unint64_t)eventType;
- (unint64_t)value;
- (void)setValue:(unint64_t)a3;
@end

@implementation _ANESharedWaitEvent

+ (id)new
{
  return 0;
}

- (_ANESharedWaitEvent)init
{
  return 0;
}

- (_ANESharedWaitEvent)initWithValue:(unint64_t)a3 sharedEvent:(id)a4 eventType:(unint64_t)a5
{
  id v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)_ANESharedWaitEvent;
  v10 = [(_ANESharedWaitEvent *)&v13 init];
  v11 = v10;
  if (v10)
  {
    v10->_value = a3;
    objc_storeStrong((id *)&v10->_sharedEvent, a4);
    v11->_eventType = a5;
  }

  return v11;
}

+ (id)waitEventWithValue:(unint64_t)a3 sharedEvent:(id)a4
{
  id v6 = a4;
  v7 = (void *)[objc_alloc((Class)a1) initWithValue:a3 sharedEvent:v6 eventType:0];

  return v7;
}

+ (id)waitEventWithValue:(unint64_t)a3 sharedEvent:(id)a4 eventType:(unint64_t)a5
{
  id v8 = a4;
  id v9 = (void *)[objc_alloc((Class)a1) initWithValue:a3 sharedEvent:v8 eventType:a5];

  return v9;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  unint64_t v6 = [(_ANESharedWaitEvent *)self value];
  v7 = [(_ANESharedWaitEvent *)self sharedEvent];
  id v8 = [v3 stringWithFormat:@"%@: { value=%llu : sharedEvent=%@ } ", v5, v6, v7];

  return v8;
}

- (unint64_t)value
{
  return self->_value;
}

- (void)setValue:(unint64_t)a3
{
  self->_value = a3;
}

- (unint64_t)eventType
{
  return self->_eventType;
}

- (IOSurfaceSharedEvent)sharedEvent
{
  return self->_sharedEvent;
}

- (void).cxx_destruct
{
}

@end