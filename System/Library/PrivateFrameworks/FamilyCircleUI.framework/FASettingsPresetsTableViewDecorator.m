@interface FASettingsPresetsTableViewDecorator
- (_TtC14FamilyCircleUI35FASettingsPresetsTableViewDecorator)initWithTableView:(id)a3;
- (_TtC14FamilyCircleUI35FASettingsPresetsTableViewDecorator)initWithTableView:(id)a3 ruiTableView:(id)a4 parentViewController:(id)a5;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
@end

@implementation FASettingsPresetsTableViewDecorator

- (_TtC14FamilyCircleUI35FASettingsPresetsTableViewDecorator)initWithTableView:(id)a3 ruiTableView:(id)a4 parentViewController:(id)a5
{
  swift_unknownObjectUnownedInit();
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC14FamilyCircleUI35FASettingsPresetsTableViewDecorator____lazy_storage___settingsPresetsVC) = 0;
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC14FamilyCircleUI35FASettingsPresetsTableViewDecorator_ruiTableView) = (Class)a4;
  swift_unknownObjectUnownedAssign();
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for FASettingsPresetsTableViewDecorator();
  id v8 = a4;
  return [(FATableViewDecorator *)&v10 initWithTableView:a3];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6 = a3;
  v7 = self;
  if (sub_218B70494(a4))
  {

    return 1;
  }
  else
  {
    v9 = [(FATableViewDecorator *)v7 dataSource];
    if (v9)
    {
      id v10 = [(UITableViewDataSource *)v9 tableView:v6 numberOfRowsInSection:a4];

      swift_unknownObjectRelease();
      return (int64_t)v10;
    }
    else
    {

      return 0;
    }
  }
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_218CACBA8();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_218CACB88();
  id v10 = a3;
  v11 = self;
  sub_218B708FC((uint64_t)v10);
  v13 = v12;

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v13;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_218CACBA8();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_218CACB88();
  id v10 = a3;
  v11 = self;
  sub_218B70F80((uint64_t)v10);
  double v13 = v12;

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v13;
}

- (_TtC14FamilyCircleUI35FASettingsPresetsTableViewDecorator)initWithTableView:(id)a3
{
  swift_unknownObjectRetain();
  result = (_TtC14FamilyCircleUI35FASettingsPresetsTableViewDecorator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC14FamilyCircleUI35FASettingsPresetsTableViewDecorator_ruiTableView));
  swift_unknownObjectUnownedDestroy();
  v3 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtC14FamilyCircleUI35FASettingsPresetsTableViewDecorator____lazy_storage___settingsPresetsVC);
}

@end