@interface InstallConfirmationTask
- (_TtC26AppDistributionLaunchAngel23InstallConfirmationTask)init;
- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4;
- (void)remoteAlertHandleDidActivate:(id)a3;
- (void)remoteAlertHandleDidDeactivate:(id)a3;
@end

@implementation InstallConfirmationTask

- (_TtC26AppDistributionLaunchAngel23InstallConfirmationTask)init
{
  result = (_TtC26AppDistributionLaunchAngel23InstallConfirmationTask *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC26AppDistributionLaunchAngel23InstallConfirmationTask_context;
  uint64_t v4 = type metadata accessor for InstallSheetContext();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC26AppDistributionLaunchAngel23InstallConfirmationTask_logKey));
  v5 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC26AppDistributionLaunchAngel23InstallConfirmationTask_remoteHandle);
}

- (void)remoteAlertHandleDidActivate:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100026780();
}

- (void)remoteAlertHandleDidDeactivate:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100026954();
}

- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4
{
  id v6 = a3;
  v7 = self;
  id v8 = a4;
  sub_100026B34((uint64_t)a4);
}

@end