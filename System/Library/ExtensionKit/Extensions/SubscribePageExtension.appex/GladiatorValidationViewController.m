@interface GladiatorValidationViewController
- (_TtC22SubscribePageExtension33GladiatorValidationViewController)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension33GladiatorValidationViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC22SubscribePageExtension33GladiatorValidationViewController)initWithStyle:(int64_t)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
@end

@implementation GladiatorValidationViewController

- (_TtC22SubscribePageExtension33GladiatorValidationViewController)initWithCoder:(id)a3
{
  uint64_t v5 = sub_100759BC0();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5, v7);
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = OBJC_IVAR____TtC22SubscribePageExtension33GladiatorValidationViewController_gladiator;
  sub_100764470();
  id v11 = a3;
  *(Class *)((char *)&self->super.super.super.super.isa + v10) = (Class)sub_100764460();
  uint64_t v12 = OBJC_IVAR____TtC22SubscribePageExtension33GladiatorValidationViewController_rules;
  sub_100759BB0();
  v13 = (objc_class *)sub_100759BA0();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
  *(Class *)((char *)&self->super.super.super.super.isa + v12) = v13;

  result = (_TtC22SubscribePageExtension33GladiatorValidationViewController *)sub_100768A40();
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
                     + OBJC_IVAR____TtC22SubscribePageExtension33GladiatorValidationViewController_rules))[2];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_100756440();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6, v8);
  uint64_t v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100756380();
  id v11 = a3;
  uint64_t v12 = self;
  v13 = (void *)sub_100276CCC(v11);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);

  return v13;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_100756440();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6, v8);
  uint64_t v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100756380();
  id v11 = a3;
  uint64_t v12 = self;
  sub_100277118();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
}

- (_TtC22SubscribePageExtension33GladiatorValidationViewController)initWithStyle:(int64_t)a3
{
  result = (_TtC22SubscribePageExtension33GladiatorValidationViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC22SubscribePageExtension33GladiatorValidationViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC22SubscribePageExtension33GladiatorValidationViewController *)_swift_stdlib_reportUnimplementedInitializer();
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