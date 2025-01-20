@interface SRCarPlayViewController
- (NSArray)preferredFocusEnvironments;
- (_TtC4Siri23SRCarPlayViewController)initWithCoder:(id)a3;
- (_TtC4Siri23SRCarPlayViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)clearSnippet;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)loadView;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation SRCarPlayViewController

- (_TtC4Siri23SRCarPlayViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1000A2820();
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for SRCarPlayViewController();
  v4 = (char *)v8.receiver;
  [(SRCarPlayViewController *)&v8 viewDidAppear:v3];
  v5 = &v4[OBJC_IVAR____TtC4Siri23SRCarPlayViewController_delegate];
  if (swift_unknownObjectWeakLoadStrong())
  {
    uint64_t v6 = *((void *)v5 + 1);
    uint64_t ObjectType = swift_getObjectType();
    (*(void (**)(char *, uint64_t, uint64_t))(v6 + 8))(v4, ObjectType, v6);

    swift_unknownObjectRelease();
  }
  else
  {
  }
}

- (void)loadView
{
  uint64_t v2 = qword_100170448;
  BOOL v3 = self;
  if (v2 != -1) {
    swift_once();
  }
  uint64_t v4 = type metadata accessor for Logger();
  sub_10007DCA0(v4, (uint64_t)qword_100171AB0);
  os_log_type_t v5 = static os_log_type_t.info.getter();
  sub_1000B2FEC(v5, 0x10uLL, 0x7765695664616F6CLL, 0xEA00000000002928, 0, 0);
  uint64_t v6 = objc_allocWithZone((Class)type metadata accessor for SRCarPlayView());
  v7 = v3;
  objc_super v8 = sub_1000A1A30(v7, v6);
  [(SRCarPlayViewController *)v7 setView:v8];
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for SRCarPlayViewController();
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = (char *)v12.receiver;
  [(SRCarPlayViewController *)&v12 didUpdateFocusInContext:v6 withAnimationCoordinator:v7];
  v9 = &v8[OBJC_IVAR____TtC4Siri23SRCarPlayViewController_delegate];
  if (swift_unknownObjectWeakLoadStrong())
  {
    uint64_t v10 = *((void *)v9 + 1);
    uint64_t ObjectType = swift_getObjectType();
    (*(void (**)(char *, uint64_t, uint64_t))(v10 + 24))(v8, ObjectType, v10);

    swift_unknownObjectRelease();
  }
  else
  {
  }
}

- (NSArray)preferredFocusEnvironments
{
  sub_10007D3B4(&qword_100171650);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_1000DCFA0;
  uint64_t v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC4Siri23SRCarPlayViewController_currentSnippetViewController);
  if (v4) {
    os_log_type_t v5 = *(_TtC4Siri23SRCarPlayViewController **)((char *)&self->super.super.super.isa
  }
                                                + OBJC_IVAR____TtC4Siri23SRCarPlayViewController_currentSnippetViewController);
  else {
    os_log_type_t v5 = self;
  }
  *(void *)(v3 + 32) = v5;
  specialized Array._endMutation()();
  id v6 = v4;
  sub_10007D3B4(&qword_100171660);
  v7.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v7.super.isa;
}

- (_TtC4Siri23SRCarPlayViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC4Siri23SRCarPlayViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC4Siri23SRCarPlayViewController_currentSnippetViewController));
  sub_10007E630((uint64_t)self + OBJC_IVAR____TtC4Siri23SRCarPlayViewController_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC4Siri23SRCarPlayViewController_requestOptions));

  swift_bridgeObjectRelease();
}

- (void)clearSnippet
{
  uint64_t v2 = qword_100170448;
  os_log_type_t v5 = self;
  if (v2 != -1) {
    swift_once();
  }
  uint64_t v3 = type metadata accessor for Logger();
  sub_10007DCA0(v3, (uint64_t)qword_100171AB0);
  os_log_type_t v4 = static os_log_type_t.info.getter();
  sub_1000B2FEC(v4, 0x10uLL, 0x696E537261656C63, 0xEE00292874657070, 0xD00000000000004DLL, 0x80000001000FD970);
  sub_1000A002C(0, 0, 1);
}

@end