@interface OsloAuthenticationTask
- (_TtC26AppDistributionLaunchAngel22OsloAuthenticationTask)init;
- (void)paymentAuthorizationController:(PKPaymentAuthorizationController *)a3 didAuthorizePayment:(PKPayment *)a4 handler:(id)a5;
- (void)paymentAuthorizationControllerDidFinish:(id)a3;
@end

@implementation OsloAuthenticationTask

- (void)paymentAuthorizationControllerDidFinish:(id)a3
{
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v5 = a3;
  v6 = self;
  sub_10002A6AC();
  swift_release();
}

- (void)paymentAuthorizationController:(PKPaymentAuthorizationController *)a3 didAuthorizePayment:(PKPayment *)a4 handler:(id)a5
{
  uint64_t v9 = sub_100007978(&qword_100074EA0);
  __chkstk_darwin(v9 - 8);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_100075A58;
  v15[5] = v13;
  v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_100075A68;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  v19 = self;
  sub_100029CE8((uint64_t)v11, (uint64_t)&unk_100075A78, (uint64_t)v16);
  swift_release();
}

- (_TtC26AppDistributionLaunchAngel22OsloAuthenticationTask)init
{
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  result = (_TtC26AppDistributionLaunchAngel22OsloAuthenticationTask *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end