@interface IntegrationServer
- (_TtC26CalendarIntegrationSupport17IntegrationServer)init;
- (void)requestCatchupSync;
- (void)requestRegularSync;
- (void)startServer;
@end

@implementation IntegrationServer

- (_TtC26CalendarIntegrationSupport17IntegrationServer)init
{
  return (_TtC26CalendarIntegrationSupport17IntegrationServer *)IntegrationServer.init()();
}

- (void)startServer
{
  v2 = self;
  sub_2496BC960();
}

- (void)requestRegularSync
{
  uint64_t v2 = (*(void **)((char *)&self->super.isa
                   + OBJC_IVAR____TtC26CalendarIntegrationSupport17IntegrationServer_syncManager))[4];
  v3 = (unsigned char *)(v2 + 16);
  v4 = (os_unfair_lock_s *)(v2 + 20);
  v5 = self;
  os_unfair_lock_lock(v4);
  sub_2496BCB58(v3);
  os_unfair_lock_unlock(v4);
}

- (void)requestCatchupSync
{
  uint64_t v2 = (*(void **)((char *)&self->super.isa
                   + OBJC_IVAR____TtC26CalendarIntegrationSupport17IntegrationServer_syncManager))[4];
  v3 = (unsigned char *)(v2 + 16);
  v4 = (os_unfair_lock_s *)(v2 + 20);
  v5 = self;
  os_unfair_lock_lock(v4);
  sub_2496BCB74(v3);
  os_unfair_lock_unlock(v4);
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC26CalendarIntegrationSupport17IntegrationServer_deviceLockObserver));
  swift_release();
}

@end