@interface AlertClient
- (_TtC11ActivityKit11AlertClient)init;
- (void)dismissAlertWithActivityIdentifier:(id)a3;
- (void)presentAlertWithActivityIdentifier:(id)a3 payload:(id)a4 options:(id)a5 completion:(id)a6;
@end

@implementation AlertClient

- (_TtC11ActivityKit11AlertClient)init
{
  return (_TtC11ActivityKit11AlertClient *)AlertClient.init()();
}

- (void).cxx_destruct
{
  sub_242F3D0EC((uint64_t)self + OBJC_IVAR____TtC11ActivityKit11AlertClient_delegate);
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11ActivityKit11AlertClient_queue);
}

- (void)presentAlertWithActivityIdentifier:(id)a3 payload:(id)a4 options:(id)a5 completion:(id)a6
{
  v9 = _Block_copy(a6);
  uint64_t v10 = sub_242FDC0D0();
  uint64_t v12 = v11;
  id v13 = a4;
  id v14 = a5;
  v15 = self;
  uint64_t v16 = sub_242FDBBF0();
  unint64_t v18 = v17;

  uint64_t v19 = sub_242FDBBF0();
  unint64_t v21 = v20;

  uint64_t v22 = swift_allocObject();
  *(void *)(v22 + 16) = v9;
  AlertClient.presentAlert(withActivityIdentifier:payload:options:completion:)(v10, v12, v16, v18, v19, v21, (uint64_t)sub_242F33DE0, v22);
  swift_release();
  sub_242F26068(v19, v21);
  sub_242F26068(v16, v18);

  swift_bridgeObjectRelease();
}

- (void)dismissAlertWithActivityIdentifier:(id)a3
{
  uint64_t v4 = sub_242FDC0D0();
  uint64_t v6 = v5;
  v7 = (char *)self + OBJC_IVAR____TtC11ActivityKit11AlertClient_delegate;
  swift_beginAccess();
  if (MEMORY[0x245671DD0](v7))
  {
    uint64_t v8 = *((void *)v7 + 1);
    uint64_t ObjectType = swift_getObjectType();
    uint64_t v10 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v8 + 16);
    uint64_t v11 = self;
    v10(v4, v6, ObjectType, v8);

    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
  }
}

@end