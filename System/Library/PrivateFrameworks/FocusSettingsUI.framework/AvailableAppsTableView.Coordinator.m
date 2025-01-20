@interface AvailableAppsTableView.Coordinator
- (_TtCV15FocusSettingsUI22AvailableAppsTableView11Coordinator)init;
- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (id)sectionIndexTitlesForTableView:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (int64_t)tableView:(id)a3 sectionForSectionIndexTitle:(id)a4 atIndex:(int64_t)a5;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
@end

@implementation AvailableAppsTableView.Coordinator

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  v3 = (char *)self + OBJC_IVAR____TtCV15FocusSettingsUI22AvailableAppsTableView11Coordinator_sections;
  swift_beginAccess();
  return *(void *)(*(void *)v3 + 16);
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  v7 = (char *)self + OBJC_IVAR____TtCV15FocusSettingsUI22AvailableAppsTableView11Coordinator_sections;
  swift_beginAccess();
  if (a4 < 0)
  {
    __break(1u);
    goto LABEL_7;
  }
  if (*(void *)(*(void *)v7 + 16) <= (unint64_t)a4)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  unint64_t v8 = *(void *)(*(void *)v7 + 8 * a4 + 32);
  if (v8 >> 62)
  {
LABEL_8:
    id v11 = a3;
    v12 = self;
    swift_bridgeObjectRetain();
    int64_t v9 = sub_220F32E48();

    swift_bridgeObjectRelease();
    return v9;
  }
  return *(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_220F30778();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  int64_t v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_220F30748();
  id v10 = a3;
  id v11 = self;
  v12 = (void *)sub_220EAF8BC(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v12;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_220F30778();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  int64_t v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_220F30748();
  id v10 = a3;
  id v11 = self;
  sub_220EAFE58(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (id)sectionIndexTitlesForTableView:(id)a3
{
  id v4 = a3;
  v5 = self;
  uint64_t v6 = sub_220EB2944();

  if (v6)
  {
    uint64_t v7 = (void *)sub_220F32848();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v7 = 0;
  }
  return v7;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  uint64_t v6 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtCV15FocusSettingsUI22AvailableAppsTableView11Coordinator_collation);
  id v7 = a3;
  uint64_t v8 = self;
  id v9 = objc_msgSend(v6, sel_sectionTitles);
  uint64_t v10 = sub_220F32858();

  if (a4 < 0)
  {
    __break(1u);
    goto LABEL_7;
  }
  if (*(void *)(v10 + 16) <= (unint64_t)a4)
  {
LABEL_7:
    __break(1u);
    return result;
  }
  swift_bridgeObjectRetain();

  swift_bridgeObjectRelease();
  uint64_t v12 = (void *)sub_220F32728();
  swift_bridgeObjectRelease();
  return v12;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v6 = a3;
  id v7 = self;
  sub_220EB2A20(a4);
  id v9 = v8;

  return v9;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  id v6 = a3;
  id v7 = self;
  id v8 = sub_220EB2F0C(a4);

  return v8;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  id v6 = a3;
  id v7 = self;
  sub_220EB2FF0(a4);
  double v9 = v8;

  return v9;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  return 0.0;
}

- (int64_t)tableView:(id)a3 sectionForSectionIndexTitle:(id)a4 atIndex:(int64_t)a5
{
  return (int64_t)objc_msgSend(*(id *)((char *)&self->super.isa+ OBJC_IVAR____TtCV15FocusSettingsUI22AvailableAppsTableView11Coordinator_collation), sel_sectionForSectionIndexTitleAtIndex_, a5, a4);
}

- (_TtCV15FocusSettingsUI22AvailableAppsTableView11Coordinator)init
{
  id result = (_TtCV15FocusSettingsUI22AvailableAppsTableView11Coordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCV15FocusSettingsUI22AvailableAppsTableView11Coordinator_collation));
  swift_bridgeObjectRelease();
}

@end