@interface MedicationsListEditViewController
- (_TtC26MedicationsHealthAppPlugin33MedicationsListEditViewController)initWithCoder:(id)a3;
- (_TtC26MedicationsHealthAppPlugin33MedicationsListEditViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC26MedicationsHealthAppPlugin33MedicationsListEditViewController)initWithStyle:(int64_t)a3;
- (id)tableView:(id)a3 targetIndexPathForMoveFromRowAtIndexPath:(id)a4 toProposedIndexPath:(id)a5;
- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4;
- (void)didTapDone;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
@end

@implementation MedicationsListEditViewController

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_24115CE00();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24115CDA0();
  id v10 = a3;
  v11 = self;
  if (sub_24115CDF0())
  {
  }
  else
  {
    sub_24115F370();
    swift_allocObject();
    sub_24115F360();
    uint64_t v12 = sub_24115EDD0();
    v13 = (void *)sub_24115CD90();
    objc_msgSend(v10, sel_deselectRowAtIndexPath_animated_, v13, 1);

    sub_241160E50();
    swift_release();
    v11 = (_TtC26MedicationsHealthAppPlugin33MedicationsListEditViewController *)v12;
  }

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (id)tableView:(id)a3 targetIndexPathForMoveFromRowAtIndexPath:(id)a4 toProposedIndexPath:(id)a5
{
  uint64_t v7 = sub_24115CE00();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  id v10 = (char *)&v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  v13 = (char *)&v24 - v12;
  MEMORY[0x270FA5388](v14);
  v16 = (char *)&v24 - v15;
  sub_24115CDA0();
  sub_24115CDA0();
  id v17 = a3;
  v18 = self;
  uint64_t v19 = sub_24115CDF0();
  if (v19 == sub_24115CDF0()) {
    v20 = v10;
  }
  else {
    v20 = v13;
  }
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v16, v20, v7);

  v21 = *(void (**)(char *, uint64_t))(v8 + 8);
  v21(v10, v7);
  v21(v13, v7);
  v22 = (void *)sub_24115CD90();
  v21(v16, v7);

  return v22;
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  uint64_t v4 = sub_24115CE00();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24115CDA0();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return 0;
}

- (void)didTapDone
{
  uint64_t v3 = sub_24115F6B0();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = (char *)self + OBJC_IVAR____TtC26MedicationsHealthAppPlugin33MedicationsListEditViewController_listManagerState;
  swift_beginAccess();
  (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v6, v7, v3);
  uint64_t v8 = self;
  sub_24115F620();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  [(MedicationsListEditViewController *)v8 dismissViewControllerAnimated:1 completion:0];
}

- (_TtC26MedicationsHealthAppPlugin33MedicationsListEditViewController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC26MedicationsHealthAppPlugin33MedicationsListEditViewController_diffableDataSource) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC26MedicationsHealthAppPlugin33MedicationsListEditViewController_listRefreshSubscription) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC26MedicationsHealthAppPlugin33MedicationsListEditViewController_currentIdentifiers) = (Class)MEMORY[0x263F8EE88];
  id v4 = a3;
  sub_24115F650();

  result = (_TtC26MedicationsHealthAppPlugin33MedicationsListEditViewController *)sub_2411616B0();
  __break(1u);
  return result;
}

- (_TtC26MedicationsHealthAppPlugin33MedicationsListEditViewController)initWithStyle:(int64_t)a3
{
  result = (_TtC26MedicationsHealthAppPlugin33MedicationsListEditViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC26MedicationsHealthAppPlugin33MedicationsListEditViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC26MedicationsHealthAppPlugin33MedicationsListEditViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC26MedicationsHealthAppPlugin33MedicationsListEditViewController_healthStore));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC26MedicationsHealthAppPlugin33MedicationsListEditViewController_diffableDataSource));
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v3 = (char *)self + OBJC_IVAR____TtC26MedicationsHealthAppPlugin33MedicationsListEditViewController_listManagerState;
  uint64_t v4 = sub_24115F6B0();
  uint64_t v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

@end