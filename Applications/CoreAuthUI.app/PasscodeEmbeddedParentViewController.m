@interface PasscodeEmbeddedParentViewController
- (_TtC10CoreAuthUI36PasscodeEmbeddedParentViewController)initWithCoder:(id)a3;
- (_TtC10CoreAuthUI36PasscodeEmbeddedParentViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)loadView;
- (void)verifyPasscode:(id)a3 reply:(id)a4;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation PasscodeEmbeddedParentViewController

- (_TtC10CoreAuthUI36PasscodeEmbeddedParentViewController)initWithCoder:(id)a3
{
  v5 = (char *)self + OBJC_IVAR____TtC10CoreAuthUI36PasscodeEmbeddedParentViewController_passcodeEmbeddedView;
  uint64_t v6 = type metadata accessor for PasscodeEmbeddedView(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  v7 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC10CoreAuthUI36PasscodeEmbeddedParentViewController_verifyPasscode);
  void *v7 = 0;
  v7[1] = 0;
  id v8 = a3;

  result = (_TtC10CoreAuthUI36PasscodeEmbeddedParentViewController *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)loadView
{
  v2 = self;
  sub_100040BF4();
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v6 = sub_100028560(&qword_10009E080);
  __chkstk_darwin(v6 - 8);
  id v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14.receiver = self;
  v14.super_class = ObjectType;
  v9 = self;
  [(PasscodeEmbeddedParentViewController *)&v14 viewWillAppear:v3];
  uint64_t v10 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v8, 1, 1, v10);
  type metadata accessor for MainActor();
  v11 = v9;
  uint64_t v12 = static MainActor.shared.getter();
  v13 = (void *)swift_allocObject();
  v13[2] = v12;
  v13[3] = &protocol witness table for MainActor;
  v13[4] = v11;
  sub_1000415B4((uint64_t)v8, (uint64_t)&unk_10009D7C8, (uint64_t)v13);
  swift_release();
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v6 = sub_100028560(&qword_10009E080);
  __chkstk_darwin(v6 - 8);
  id v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14.receiver = self;
  v14.super_class = ObjectType;
  v9 = self;
  [(PasscodeEmbeddedParentViewController *)&v14 viewWillDisappear:v3];
  if (*((unsigned char *)&v9->super.super.super.isa
       + OBJC_IVAR____TtC10CoreAuthUI36PasscodeEmbeddedParentViewController_dismissKeyboardOnDissappear) == 1)
  {
    uint64_t v10 = type metadata accessor for TaskPriority();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v8, 1, 1, v10);
    type metadata accessor for MainActor();
    v11 = v9;
    uint64_t v12 = static MainActor.shared.getter();
    v13 = (void *)swift_allocObject();
    v13[2] = v12;
    v13[3] = &protocol witness table for MainActor;
    v13[4] = v11;
    sub_1000415B4((uint64_t)v8, (uint64_t)&unk_10009D7C0, (uint64_t)v13);
    swift_release();
  }
}

- (void)verifyPasscode:(id)a3 reply:(id)a4
{
  v4 = _Block_copy(a4);
  uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v7 = v6;
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v4;
  v9 = *(void (**)(uint64_t, uint64_t, uint64_t (*)(char), uint64_t))((char *)&self->super.super.super.isa
                                                                                      + OBJC_IVAR____TtC10CoreAuthUI36PasscodeEmbeddedParentViewController_verifyPasscode);
  uint64_t v10 = self;
  if (v9)
  {
    sub_100029A94((uint64_t)v9);
    v9(v5, v7, sub_10002F2D8, v8);
    sub_10002A998((uint64_t)v9);
  }
  swift_bridgeObjectRelease();
  swift_release();
}

- (_TtC10CoreAuthUI36PasscodeEmbeddedParentViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC10CoreAuthUI36PasscodeEmbeddedParentViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10CoreAuthUI36PasscodeEmbeddedParentViewController_passcodeViewController));
  sub_10002F024((uint64_t)self + OBJC_IVAR____TtC10CoreAuthUI36PasscodeEmbeddedParentViewController_passcodeEmbeddedView, &qword_10009D6C8);
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC10CoreAuthUI36PasscodeEmbeddedParentViewController_verifyPasscode);

  sub_10002A998(v3);
}

@end