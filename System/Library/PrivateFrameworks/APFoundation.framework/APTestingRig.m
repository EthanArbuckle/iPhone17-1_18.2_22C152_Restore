@interface APTestingRig
+ (id)sharedInstance;
- (APTestingRig)init;
- (APUnfairLock)theLock;
- (NSMutableDictionary)handlers;
- (void)invokeHandlerForMessage:(id)a3 payload:(id)a4 completionHandler:(id)a5;
- (void)setHandlers:(id)a3;
- (void)setTheLock:(id)a3;
- (void)subscribeForDictMessage:(id)a3 handler:(id)a4;
- (void)subscribeForMessage:(id)a3 handler:(id)a4;
@end

@implementation APTestingRig

+ (id)sharedInstance
{
  if (qword_1EB789B18 != -1) {
    dispatch_once(&qword_1EB789B18, &unk_1F2E9CCF0);
  }
  v2 = (void *)qword_1EB7898F8;
  return v2;
}

- (APTestingRig)init
{
  v8.receiver = self;
  v8.super_class = (Class)APTestingRig;
  v2 = [(APTestingRig *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
    handlers = v2->_handlers;
    v2->_handlers = (NSMutableDictionary *)v3;

    v5 = [[APUnfairLock alloc] initWithOptions:1];
    theLock = v2->_theLock;
    v2->_theLock = v5;
  }
  return v2;
}

- (void)subscribeForDictMessage:(id)a3 handler:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_1D70DACB8;
  v8[3] = &unk_1E6A6BC08;
  id v9 = v6;
  id v7 = v6;
  [(APTestingRig *)self subscribeForMessage:a3 handler:v8];
}

- (void)subscribeForMessage:(id)a3 handler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v10 = [(APTestingRig *)self theLock];
  [v10 lock];
  objc_super v8 = _Block_copy(v6);

  id v9 = [(APTestingRig *)self handlers];
  [v9 setObject:v8 forKeyedSubscript:v7];

  [v10 unlock];
}

- (void)invokeHandlerForMessage:(id)a3 payload:(id)a4 completionHandler:(id)a5
{
  id v13 = a4;
  objc_super v8 = (void (**)(id, __CFString *))a5;
  id v9 = a3;
  id v10 = [(APTestingRig *)self theLock];
  [v10 lock];
  v11 = [(APTestingRig *)self handlers];
  v12 = [v11 objectForKey:v9];

  [v10 unlock];
  if (v12) {
    ((void (**)(void, id, void (**)(id, __CFString *)))v12)[2](v12, v13, v8);
  }
  else {
    v8[2](v8, @"Message was not registered");
  }
}

- (NSMutableDictionary)handlers
{
  return self->_handlers;
}

- (void)setHandlers:(id)a3
{
}

- (APUnfairLock)theLock
{
  return self->_theLock;
}

- (void)setTheLock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_theLock, 0);
  objc_storeStrong((id *)&self->_handlers, 0);
}

@end