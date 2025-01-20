@interface CALNXPCActivityScheduler
- (CALNActivitySchedulerDelegate)delegate;
- (CALNXPCActivityScheduler)initWithActivityIdentifier:(id)a3 otherCriteria:(id)a4;
- (void)scheduleWithTimeInterval:(int64_t)a3 gracePeriod:(int64_t)a4;
- (void)setDelegate:(id)a3;
- (void)unschedule;
@end

@implementation CALNXPCActivityScheduler

- (CALNXPCActivityScheduler)initWithActivityIdentifier:(id)a3 otherCriteria:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CALNXPCActivityScheduler;
  v9 = [(CALNXPCActivityScheduler *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_activityIdentifier, a3);
    v11 = (OS_xpc_object *)xpc_copy(v8);
    otherCriteria = v10->_otherCriteria;
    v10->_otherCriteria = v11;
  }
  return v10;
}

- (void)unschedule
{
  v2 = [(NSString *)self->_activityIdentifier UTF8String];
  xpc_activity_unregister(v2);
}

- (void)scheduleWithTimeInterval:(int64_t)a3 gracePeriod:(int64_t)a4
{
  id v7 = self->_activityIdentifier;
  objc_initWeak(&location, self);
  xpc_object_t v8 = xpc_copy(self->_otherCriteria);
  xpc_dictionary_set_int64(v8, (const char *)*MEMORY[0x263EF81A0], a3);
  xpc_dictionary_set_int64(v8, (const char *)*MEMORY[0x263EF81C0], a4);
  v9 = v7;
  v10 = [(NSString *)v9 UTF8String];
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __65__CALNXPCActivityScheduler_scheduleWithTimeInterval_gracePeriod___block_invoke;
  handler[3] = &unk_2645C0D20;
  objc_copyWeak(&v14, &location);
  v11 = v9;
  v13 = v11;
  xpc_activity_register(v10, v8, handler);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __65__CALNXPCActivityScheduler_scheduleWithTimeInterval_gracePeriod___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = [WeakRetained delegate];

  if (v3) {
    [v3 activityRun];
  }
  else {
    xpc_activity_unregister((const char *)[*(id *)(a1 + 32) UTF8String]);
  }
}

- (CALNActivitySchedulerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CALNActivitySchedulerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_otherCriteria, 0);
  objc_storeStrong((id *)&self->_activityIdentifier, 0);
}

@end