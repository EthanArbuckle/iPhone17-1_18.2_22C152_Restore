@interface _ANESharedEvents
+ (_ANESharedEvents)new;
+ (_ANESharedEvents)sharedEventsWithSignalEvents:(id)a3 waitEvents:(id)a4;
- (NSArray)signalEvents;
- (NSArray)waitEvents;
- (_ANESharedEvents)init;
- (_ANESharedEvents)initWithSignalEvents:(id)a3 waitEvents:(id)a4;
- (id)description;
- (void)setSignalEvents:(id)a3;
- (void)setWaitEvents:(id)a3;
@end

@implementation _ANESharedEvents

+ (_ANESharedEvents)new
{
  return 0;
}

- (_ANESharedEvents)init
{
  return 0;
}

- (_ANESharedEvents)initWithSignalEvents:(id)a3 waitEvents:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (([v7 count] || objc_msgSend(v8, "count"))
    && (unint64_t)[v7 count] <= 0x40
    && (unint64_t)[v8 count] <= 0x40)
  {
    v13.receiver = self;
    v13.super_class = (Class)_ANESharedEvents;
    v10 = [(_ANESharedEvents *)&v13 init];
    p_isa = (id *)&v10->super.isa;
    if (v10)
    {
      objc_storeStrong((id *)&v10->_signalEvents, a3);
      objc_storeStrong(p_isa + 2, a4);
    }
    self = p_isa;
    v9 = self;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (_ANESharedEvents)sharedEventsWithSignalEvents:(id)a3 waitEvents:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)[objc_alloc((Class)a1) initWithSignalEvents:v7 waitEvents:v6];

  return (_ANESharedEvents *)v8;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  id v6 = [(_ANESharedEvents *)self signalEvents];
  id v7 = [(_ANESharedEvents *)self waitEvents];
  id v8 = [v3 stringWithFormat:@"%@: { signalEvents=%@ : waitEvents=%@ } ", v5, v6, v7];

  return v8;
}

- (NSArray)signalEvents
{
  return self->_signalEvents;
}

- (void)setSignalEvents:(id)a3
{
}

- (NSArray)waitEvents
{
  return self->_waitEvents;
}

- (void)setWaitEvents:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_waitEvents, 0);
  objc_storeStrong((id *)&self->_signalEvents, 0);
}

@end