@interface GladiatorValidationViewController
- (_TtC18ASMessagesProvider33GladiatorValidationViewController)initWithCoder:(id)a3;
- (_TtC18ASMessagesProvider33GladiatorValidationViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC18ASMessagesProvider33GladiatorValidationViewController)initWithStyle:(int64_t)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
@end

@implementation GladiatorValidationViewController

- (_TtC18ASMessagesProvider33GladiatorValidationViewController)initWithCoder:(id)a3
{
  uint64_t v5 = sub_76FB80();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = OBJC_IVAR____TtC18ASMessagesProvider33GladiatorValidationViewController_gladiator;
  sub_77A4E0();
  id v10 = a3;
  *(Class *)((char *)&self->super.super.super.super.isa + v9) = (Class)sub_77A4D0();
  uint64_t v11 = OBJC_IVAR____TtC18ASMessagesProvider33GladiatorValidationViewController_rules;
  sub_76FB70();
  v12 = (objc_class *)sub_76FB60();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  *(Class *)((char *)&self->super.super.super.super.isa + v11) = v12;

  result = (_TtC18ASMessagesProvider33GladiatorValidationViewController *)sub_77EB20();
  __break(1u);
  return result;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return (*(void **)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider33GladiatorValidationViewController_rules))[2];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_76C1E0();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_76C120();
  id v10 = a3;
  uint64_t v11 = self;
  v12 = (void *)sub_28B4E0(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v12;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_76C1E0();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_76C120();
  id v10 = a3;
  uint64_t v11 = self;
  sub_28B92C();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (_TtC18ASMessagesProvider33GladiatorValidationViewController)initWithStyle:(int64_t)a3
{
  result = (_TtC18ASMessagesProvider33GladiatorValidationViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC18ASMessagesProvider33GladiatorValidationViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC18ASMessagesProvider33GladiatorValidationViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end