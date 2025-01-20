@interface AccountSelectionViewController
- (_TtC15HealthRecordsUI30AccountSelectionViewController)initWithCoder:(id)a3;
- (_TtC15HealthRecordsUI30AccountSelectionViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC15HealthRecordsUI30AccountSelectionViewController)initWithStyle:(int64_t)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation AccountSelectionViewController

- (_TtC15HealthRecordsUI30AccountSelectionViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1C222CF00();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1C222AAFC();
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  unint64_t v4 = *(unint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC15HealthRecordsUI30AccountSelectionViewController_allAccounts);
  if (!(v4 >> 62)) {
    return *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  id v7 = a3;
  v8 = self;
  swift_bridgeObjectRetain();
  int64_t v9 = sub_1C2550620();

  swift_bridgeObjectRelease();
  return v9;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_1C254CD90();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  int64_t v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C254CD40();
  id v10 = a3;
  v11 = self;
  v12 = sub_1C222BB38(v10, v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v12;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v5 = a3;
  uint64_t v6 = self;
  uint64_t v7 = (void *)sub_1C222CFF0(v5);

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_1C254CD90();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  int64_t v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C254CD40();
  id v10 = a3;
  v11 = self;
  sub_1C222C534(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (_TtC15HealthRecordsUI30AccountSelectionViewController)initWithStyle:(int64_t)a3
{
  result = (_TtC15HealthRecordsUI30AccountSelectionViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC15HealthRecordsUI30AccountSelectionViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC15HealthRecordsUI30AccountSelectionViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  id v3 = (char *)self + OBJC_IVAR____TtC15HealthRecordsUI30AccountSelectionViewController_delegate;
  sub_1C2201FD8((uint64_t)v3);
}

@end