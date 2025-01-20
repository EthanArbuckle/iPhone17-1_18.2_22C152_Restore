@interface InstallCoordinationInstallObserver
- (_TtC28ManagedAppDistributionDaemon34InstallCoordinationInstallObserver)init;
@end

@implementation InstallCoordinationInstallObserver

- (_TtC28ManagedAppDistributionDaemon34InstallCoordinationInstallObserver)init
{
  sub_10033F7D8();
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC28ManagedAppDistributionDaemon34InstallCoordinationInstallObserver_delegate));
  swift_release();
  v3 = (char *)self + OBJC_IVAR____TtC28ManagedAppDistributionDaemon34InstallCoordinationInstallObserver_stream;
  uint64_t v4 = sub_1000172F8(&qword_100660E58);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC28ManagedAppDistributionDaemon34InstallCoordinationInstallObserver_continuation;
  uint64_t v6 = sub_1000172F8(&qword_100660E68);
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  v7 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC28ManagedAppDistributionDaemon34InstallCoordinationInstallObserver_installObserver);
}

@end