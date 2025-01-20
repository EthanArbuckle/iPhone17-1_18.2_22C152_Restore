@interface HttpTemplateController
- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5;
- (_TtC22SubscribePageExtension22HttpTemplateController)init;
- (void)dealloc;
- (void)textFieldDidChange:(id)a3;
@end

@implementation HttpTemplateController

- (void)dealloc
{
  v3 = self;
  v4 = self;
  id v5 = [v3 defaultCenter];
  [v5 removeObserver:v4];

  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for HttpTemplateController();
  [(HttpTemplateController *)&v6 dealloc];
}

- (void).cxx_destruct
{
  swift_release();
  sub_10000FED8((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension22HttpTemplateController_actionSender, &qword_1009360F0);
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC22SubscribePageExtension22HttpTemplateController_okAction);
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  sub_1007675F0();
  id v9 = a3;
  v10 = self;
  sub_1005F0F6C(v9, location, length);
  LOBYTE(length) = v11;

  swift_bridgeObjectRelease();
  return length & 1;
}

- (void)textFieldDidChange:(id)a3
{
  uint64_t v4 = sub_100755B70();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4, v6);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100755B40();
  if (*((unsigned char *)&self->super.isa
       + OBJC_IVAR____TtC22SubscribePageExtension22HttpTemplateController_hasRequiredParameters) == 1)
  {
    id v9 = self;
    sub_1005F0C20();
  }
  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
}

- (_TtC22SubscribePageExtension22HttpTemplateController)init
{
  result = (_TtC22SubscribePageExtension22HttpTemplateController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end