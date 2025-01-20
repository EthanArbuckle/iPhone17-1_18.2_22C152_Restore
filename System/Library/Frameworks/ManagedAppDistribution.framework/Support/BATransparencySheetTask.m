@interface BATransparencySheetTask
- (_TtC28ManagedAppDistributionDaemon23BATransparencySheetTask)init;
- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4;
- (void)remoteAlertHandleDidActivate:(id)a3;
- (void)remoteAlertHandleDidDeactivate:(id)a3;
@end

@implementation BATransparencySheetTask

- (void)remoteAlertHandleDidActivate:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1003BA298();
}

- (void)remoteAlertHandleDidDeactivate:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1003BA4A4();
}

- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4
{
  id v6 = a3;
  v7 = self;
  id v8 = a4;
  sub_1003BA6E0((uint64_t)a4);
}

- (_TtC28ManagedAppDistributionDaemon23BATransparencySheetTask)init
{
  result = (_TtC28ManagedAppDistributionDaemon23BATransparencySheetTask *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC28ManagedAppDistributionDaemon23BATransparencySheetTask_logKey));
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC28ManagedAppDistributionDaemon23BATransparencySheetTask_remoteHandle);
}

@end