@interface InstallCoordinationInstallObserver.Delegate
- (_TtCC28ManagedAppDistributionDaemon34InstallCoordinationInstallObserverP33_B8C0BD49E46B9356C2E4FA5F73F7501B8Delegate)init;
- (void)coordinator:(id)a3 canceledWithReason:(id)a4 client:(unint64_t)a5;
- (void)coordinatorDidCompleteSuccessfully:(id)a3 forApplicationRecord:(id)a4;
- (void)coordinatorShouldPause:(id)a3;
- (void)coordinatorShouldPrioritize:(id)a3;
- (void)coordinatorShouldResume:(id)a3;
- (void)shouldPrioritizeAppWithIdentity:(id)a3;
@end

@implementation InstallCoordinationInstallObserver.Delegate

- (void)coordinatorDidCompleteSuccessfully:(id)a3 forApplicationRecord:(id)a4
{
  uint64_t v7 = sub_1000172F8(&qword_100660E60);
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v11 = a3;
  id v12 = a4;
  v13 = self;
  id v14 = [v11 identity];
  v16[0] = a3;
  v16[1] = v14;
  memset(&v16[2], 0, 24);
  char v17 = 3;
  id v15 = v11;
  sub_1000172F8(&qword_100660E68);
  AsyncStream.Continuation.yield(_:)();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (void)coordinator:(id)a3 canceledWithReason:(id)a4 client:(unint64_t)a5
{
  id v7 = a3;
  id v9 = a4;
  uint64_t v8 = self;
  sub_1003415D8(v7, (uint64_t)v9);
}

- (void)coordinatorShouldPause:(id)a3
{
}

- (void)coordinatorShouldResume:(id)a3
{
}

- (void)coordinatorShouldPrioritize:(id)a3
{
}

- (void)shouldPrioritizeAppWithIdentity:(id)a3
{
  uint64_t v5 = sub_1000172F8(&qword_100660E60);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11[0] = 0;
  v11[1] = a3;
  v11[3] = 0;
  v11[4] = 0;
  v11[2] = 4;
  char v12 = 3;
  id v9 = a3;
  v10 = self;
  sub_1000172F8(&qword_100660E68);
  AsyncStream.Continuation.yield(_:)();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (_TtCC28ManagedAppDistributionDaemon34InstallCoordinationInstallObserverP33_B8C0BD49E46B9356C2E4FA5F73F7501B8Delegate)init
{
  result = (_TtCC28ManagedAppDistributionDaemon34InstallCoordinationInstallObserverP33_B8C0BD49E46B9356C2E4FA5F73F7501B8Delegate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v2 = (char *)self
     + OBJC_IVAR____TtCC28ManagedAppDistributionDaemon34InstallCoordinationInstallObserverP33_B8C0BD49E46B9356C2E4FA5F73F7501B8Delegate_continuation;
  uint64_t v3 = sub_1000172F8(&qword_100660E68);
  v4 = *(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8);

  v4(v2, v3);
}

@end