@interface UserAlertController
- (_TtC12PreviewShell19UserAlertController)init;
- (void)alertService:(id)a3 wantsDismissalForAlert:(id)a4;
- (void)alertService:(id)a3 wantsPresentationForAlert:(id)a4 preferredPresentationStyle:(int64_t)a5;
@end

@implementation UserAlertController

- (_TtC12PreviewShell19UserAlertController)init
{
  return (_TtC12PreviewShell19UserAlertController *)sub_100021B68();
}

- (void)alertService:(id)a3 wantsPresentationForAlert:(id)a4 preferredPresentationStyle:(int64_t)a5
{
  uint64_t v8 = sub_10000758C(&qword_10006FB38);
  __chkstk_darwin(v8 - 8);
  v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v10, 1, 1, v11);
  type metadata accessor for MainActor();
  id v12 = a4;
  v13 = self;
  id v14 = v12;
  v15 = v13;
  id v16 = a3;
  uint64_t v17 = static MainActor.shared.getter();
  v18 = (void *)swift_allocObject();
  v18[2] = v17;
  v18[3] = &protocol witness table for MainActor;
  v18[4] = v14;
  v18[5] = v15;
  sub_10002FFFC((uint64_t)v10, (uint64_t)&unk_10006FCF8, (uint64_t)v18);

  swift_release();
}

- (void)alertService:(id)a3 wantsDismissalForAlert:(id)a4
{
  uint64_t v7 = sub_10000758C(&qword_10006FB38);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v9, 1, 1, v10);
  type metadata accessor for MainActor();
  id v11 = a4;
  id v12 = self;
  id v13 = v11;
  id v14 = v12;
  id v15 = a3;
  uint64_t v16 = static MainActor.shared.getter();
  uint64_t v17 = (void *)swift_allocObject();
  v17[2] = v16;
  v17[3] = &protocol witness table for MainActor;
  v17[4] = v13;
  v17[5] = v14;
  sub_10002FFFC((uint64_t)v9, (uint64_t)&unk_10006FCE8, (uint64_t)v17);

  swift_release();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12PreviewShell19UserAlertController_locationSim);
}

@end