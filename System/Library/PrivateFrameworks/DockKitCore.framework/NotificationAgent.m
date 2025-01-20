@interface NotificationAgent
- (BOOL)isTracking;
- (BOOL)registerWithCallback:(id)a3;
- (NotificationAgent)init;
- (void)dealloc;
- (void)deregister;
- (void)stateEventWithInfo:(id)a3 connectedState:(int64_t)a4 dockState:(int64_t)a5 trackingButtonState:(int64_t)a6;
@end

@implementation NotificationAgent

- (BOOL)registerWithCallback:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  v6 = self;
  LOBYTE(self) = sub_24CF1DD6C((uint64_t)sub_24CF1F1DC, v5);

  swift_release();
  return self & 1;
}

- (BOOL)isTracking
{
  v2 = self;
  char v3 = sub_24CF1E198();

  return v3 & 1;
}

- (void)deregister
{
  v2 = self;
  sub_24CF1E3B4();
}

- (void)dealloc
{
  v2 = self;
  NotificationAgent.__deallocating_deinit();
}

- (void).cxx_destruct
{
  char v3 = (char *)self + OBJC_IVAR___NotificationAgent_logger;
  uint64_t v4 = sub_24CF3B1C0();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  sub_24CEA53DC(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___NotificationAgent_callback));
  swift_release();
}

- (void)stateEventWithInfo:(id)a3 connectedState:(int64_t)a4 dockState:(int64_t)a5 trackingButtonState:(int64_t)a6
{
  id v10 = a3;
  v11 = self;
  sub_24CF1E5FC(v10, a4, a5, a6);
}

- (NotificationAgent)init
{
  return (NotificationAgent *)NotificationAgent.init()();
}

@end