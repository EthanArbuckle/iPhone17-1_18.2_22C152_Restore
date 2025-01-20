@interface DTTimerClient
+ (unint64_t)statusFlags;
- (DTTimerClient)init;
- (DTTimerClient)initWithDispatchQueue:(id)a3;
- (DTTimerClient)initWithDispatchQueue:(id)a3 homeKitAccessoryID:(id)a4;
- (NSArray)mtAlarms;
- (NSArray)mtTimers;
- (NSArray)timers;
- (NSError)error;
- (id)eventHandler;
- (void)activate;
- (void)addTimer:(id)a3 completionHandler:(id)a4;
- (void)dealloc;
- (void)dismissTimer:(id)a3 completionHandler:(id)a4;
- (void)fetchTimersWithCompletionHandler:(id)a3;
- (void)invalidate;
- (void)removeTimer:(id)a3 completionHandler:(id)a4;
- (void)setEventHandler:(id)a3;
- (void)snoozeTimer:(id)a3 completionHandler:(id)a4;
- (void)updateTimer:(id)a3 completionHandler:(id)a4;
@end

@implementation DTTimerClient

- (NSError)error
{
  v2 = (os_unfair_lock_s *)(*(char **)((char *)&self->super.isa + OBJC_IVAR___DTTimerClient__lock) + 16);
  v3 = self;
  os_unfair_lock_lock(v2);
  sub_24CD5A964(&v7);
  os_unfair_lock_unlock(v2);
  v4 = v7;

  if (v4)
  {
    v5 = (void *)sub_24CD752C8();
  }
  else
  {
    v5 = 0;
  }

  return (NSError *)v5;
}

- (id)eventHandler
{
  v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR___DTTimerClient_eventHandler);
  swift_beginAccess();
  if (*v2)
  {
    uint64_t v3 = v2[1];
    aBlock[4] = *v2;
    aBlock[5] = v3;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_24CD540B4;
    aBlock[3] = &block_descriptor_75;
    v4 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setEventHandler:(id)a3
{
  v4 = _Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v4;
    v4 = sub_24CD5B7C4;
  }
  else
  {
    uint64_t v5 = 0;
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR___DTTimerClient_eventHandler);
  swift_beginAccess();
  uint64_t v7 = *v6;
  uint64_t *v6 = (uint64_t)v4;
  v6[1] = v5;
  sub_24CD5A258(v7);
}

- (DTTimerClient)init
{
  return (DTTimerClient *)sub_24CD542CC();
}

- (DTTimerClient)initWithDispatchQueue:(id)a3
{
  id v3 = a3;
  v4 = (DTTimerClient *)sub_24CD5A550();

  return v4;
}

- (DTTimerClient)initWithDispatchQueue:(id)a3 homeKitAccessoryID:(id)a4
{
  unint64_t v5 = sub_24CD75568();
  unint64_t v7 = v6;
  id v8 = a3;
  v9 = (DTTimerClient *)sub_24CD5A6B0((uint64_t)v8, v5, v7);

  return v9;
}

- (void)dealloc
{
  uint64_t v3 = OBJC_IVAR___DTTimerClient__monitorMode;
  int v4 = *((unsigned __int8 *)&self->super.isa + OBJC_IVAR___DTTimerClient__monitorMode);
  unint64_t v5 = self;
  if (v4 == 1)
  {
    sub_24CD544F8();
    *((unsigned char *)&self->super.isa + v3) = 0;
  }
  v6.receiver = v5;
  v6.super_class = (Class)DTTimerClient;
  [(DTTimerClient *)&v6 dealloc];
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  sub_24CD5A258(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___DTTimerClient_eventHandler));
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_release();
}

- (void)activate
{
  v2 = self;
  sub_24CD54D44((uint64_t)&unk_26FF36890, (uint64_t)sub_24CD5A858, (uint64_t)&block_descriptor);
}

- (void)invalidate
{
  v2 = self;
  sub_24CD54D44((uint64_t)&unk_26FF36908, (uint64_t)sub_24CD5A9BC, (uint64_t)&block_descriptor_9);
}

- (NSArray)timers
{
  v2 = (os_unfair_lock_s *)(*(char **)((char *)&self->super.isa + OBJC_IVAR___DTTimerClient__lock) + 16);
  uint64_t v3 = self;
  os_unfair_lock_lock(v2);
  sub_24CD5A964(&v6);
  os_unfair_lock_unlock(v2);

  type metadata accessor for DTTimer(0);
  int v4 = (void *)sub_24CD75638();
  swift_bridgeObjectRelease();

  return (NSArray *)v4;
}

- (NSArray)mtAlarms
{
  v2 = (os_unfair_lock_s *)(*(char **)((char *)&self->super.isa + OBJC_IVAR___DTTimerClient__lock) + 16);
  uint64_t v3 = self;
  os_unfair_lock_lock(v2);
  sub_24CD5A964(&v6);
  os_unfair_lock_unlock(v2);

  sub_24CD53A2C(0, &qword_26982D348);
  int v4 = (void *)sub_24CD75638();
  swift_bridgeObjectRelease();

  return (NSArray *)v4;
}

- (NSArray)mtTimers
{
  v2 = (os_unfair_lock_s *)(*(char **)((char *)&self->super.isa + OBJC_IVAR___DTTimerClient__lock) + 16);
  uint64_t v3 = self;
  os_unfair_lock_lock(v2);
  sub_24CD5A964(&v6);
  os_unfair_lock_unlock(v2);

  sub_24CD53A2C(0, &qword_26982D340);
  int v4 = (void *)sub_24CD75638();
  swift_bridgeObjectRelease();

  return (NSArray *)v4;
}

- (void)fetchTimersWithCompletionHandler:(id)a3
{
  int v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  uint64_t v6 = self;
  sub_24CD562B0((uint64_t)sub_24CD5B6DC, v5);

  swift_release();
}

- (void)addTimer:(id)a3 completionHandler:(id)a4
{
}

- (void)updateTimer:(id)a3 completionHandler:(id)a4
{
}

- (void)removeTimer:(id)a3 completionHandler:(id)a4
{
}

- (void)snoozeTimer:(id)a3 completionHandler:(id)a4
{
}

- (void)dismissTimer:(id)a3 completionHandler:(id)a4
{
}

+ (unint64_t)statusFlags
{
  type metadata accessor for DTXPCClient();
  __n128 v6 = 0uLL;
  uint64_t v7 = 0;
  LOBYTE(v8) = 10;
  __n128 v16 = 0uLL;
  DTRequestContext.init(endpoint:)(&v16, &v14);
  __n128 v12 = v14;
  uint64_t v13 = v15;
  DTXPCRequest.init(request:context:)(&v6, (uint64_t)&v12, (uint64_t)&v16);
  v0 = v18;
  uint64_t v1 = v19;
  uint64_t v2 = v20;
  char v3 = v21;
  __n128 v6 = v16;
  uint64_t v7 = v17;
  id v8 = v18;
  uint64_t v9 = v19;
  uint64_t v10 = v20;
  char v11 = v21;
  unint64_t v4 = sub_24CD5B928();
  static DTXPCClient.sendSync<A>(request:)((long long *)&v6, (uint64_t)&type metadata for DTFetchStatusResponse, v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_24CD48E64(v0, v1, v2, v3);
  return v14.n128_u64[0];
}

@end