@interface InternalStateViewController
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (_TtC15HealthRecordsUI27InternalStateViewController)initWithCoder:(id)a3;
- (_TtC15HealthRecordsUI27InternalStateViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC15HealthRecordsUI27InternalStateViewController)initWithStyle:(int64_t)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)dealloc;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation InternalStateViewController

- (_TtC15HealthRecordsUI27InternalStateViewController)initWithCoder:(id)a3
{
  return (_TtC15HealthRecordsUI27InternalStateViewController *)sub_1C2258A14(a3);
}

- (void)dealloc
{
  v2 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC15HealthRecordsUI27InternalStateViewController_dataProvider);
  v3 = self;
  id v4 = v2;
  sub_1C237E200(0, 0);

  v5.receiver = v3;
  v5.super_class = (Class)type metadata accessor for InternalStateViewController();
  [(InternalStateViewController *)&v5 dealloc];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI27InternalStateViewController_dataProvider));
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC15HealthRecordsUI27InternalStateViewController_profile);
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1C2258DA8();
}

- (void)viewWillAppear:(BOOL)a3
{
  id v4 = self;
  sub_1C2258EF4(a3);
}

- (_TtC15HealthRecordsUI27InternalStateViewController)initWithStyle:(int64_t)a3
{
  result = (_TtC15HealthRecordsUI27InternalStateViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC15HealthRecordsUI27InternalStateViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC15HealthRecordsUI27InternalStateViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  unint64_t v3 = *(unint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC15HealthRecordsUI27InternalStateViewController_sections);
  if (!(v3 >> 62)) {
    return *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  id v6 = a3;
  v7 = self;
  swift_bridgeObjectRetain();
  int64_t v8 = sub_1C2550620();

  swift_bridgeObjectRelease();
  return v8;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  uint64_t v7 = *(uint64_t *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR____TtC15HealthRecordsUI27InternalStateViewController_sections);
  if ((v7 & 0xC000000000000001) == 0)
  {
    if (a4 < 0)
    {
      __break(1u);
    }
    else if (*(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10) > (unint64_t)a4)
    {
      uint64_t v8 = *(void *)(v7 + 8 * a4 + 32);
      id v9 = a3;
      v10 = self;
      swift_retain();
      goto LABEL_5;
    }
    __break(1u);
    goto LABEL_11;
  }
  id v14 = a3;
  v15 = self;
  swift_bridgeObjectRetain();
  uint64_t v8 = MEMORY[0x1C87588E0](a4, v7);
  swift_bridgeObjectRelease();
LABEL_5:
  unint64_t v11 = *(void *)(v8 + 32);
  if (v11 >> 62)
  {
LABEL_11:
    swift_bridgeObjectRetain();
    int64_t v12 = sub_1C2550620();

    swift_release();
    swift_bridgeObjectRelease();
    goto LABEL_7;
  }
  int64_t v12 = *(void *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x10);

  swift_release();
LABEL_7:

  return v12;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_1C254CD90();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  id v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C254CD40();
  id v10 = a3;
  unint64_t v11 = self;
  sub_1C2259D98(v10);
  v13 = v12;

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v13;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  uint64_t v4 = sub_1C254CD90();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C254CD40();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return 0;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  id v6 = self;
  uint64_t v7 = *(void *)((char *)self + OBJC_IVAR____TtC15HealthRecordsUI27InternalStateViewController_sections);
  if ((v7 & 0xC000000000000001) != 0)
  {
    id v11 = a3;
    id v12 = v6;
    swift_bridgeObjectRetain();
    MEMORY[0x1C87588E0](a4, v7);
    swift_bridgeObjectRelease();
    goto LABEL_5;
  }
  if (a4 < 0)
  {
    __break(1u);
    goto LABEL_10;
  }
  if (*(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10) <= (unint64_t)a4)
  {
LABEL_10:
    __break(1u);
    return self;
  }
  id v8 = a3;
  id v9 = v6;
  swift_retain();
LABEL_5:
  swift_bridgeObjectRetain();

  swift_release();
  id v10 = (void *)sub_1C254F430();
  swift_bridgeObjectRelease();
  return v10;
}

@end