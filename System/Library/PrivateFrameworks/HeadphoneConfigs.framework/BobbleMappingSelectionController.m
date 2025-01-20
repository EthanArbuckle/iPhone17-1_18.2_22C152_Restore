@interface BobbleMappingSelectionController
- (_TtC16HeadphoneConfigs32BobbleMappingSelectionController)initWithCoder:(id)a3;
- (_TtC16HeadphoneConfigs32BobbleMappingSelectionController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)specifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (void)listItemSelected:(id)a3;
@end

@implementation BobbleMappingSelectionController

- (_TtC16HeadphoneConfigs32BobbleMappingSelectionController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_1E4CBF1F0();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC16HeadphoneConfigs32BobbleMappingSelectionController *)BobbleMappingSelectionController.init(nibName:bundle:)(v5, v7, a4);
}

- (_TtC16HeadphoneConfigs32BobbleMappingSelectionController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC16HeadphoneConfigs32BobbleMappingSelectionController_viewModel) = 0;
  *((unsigned char *)&self->super.super.super.super.super.super.isa
  + OBJC_IVAR____TtC16HeadphoneConfigs32BobbleMappingSelectionController_mapingUseCase) = 2;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC16HeadphoneConfigs32BobbleMappingSelectionController____lazy_storage___headGestureMappingSection) = 0;
  id v4 = a3;

  result = (_TtC16HeadphoneConfigs32BobbleMappingSelectionController *)sub_1E4CBF640();
  __break(1u);
  return result;
}

- (id)specifiers
{
  v2 = self;
  unint64_t v3 = (unint64_t)BobbleMappingSelectionController.specifiers()();

  if (v3)
  {
    id v4 = (void *)sub_1E4CBF290();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_1E4CBE9D0();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1E4CBE9A0();
  id v10 = a3;
  v11 = self;
  v12 = (void *)BobbleMappingSelectionController.tableView(_:cellForRowAt:)((uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v12;
}

- (void)listItemSelected:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE8DFE0);
  MEMORY[0x1F4188790](v5 - 8);
  uint64_t v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    sub_1E4CBE9A0();
    uint64_t v8 = sub_1E4CBE9D0();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 0, 1, v8);
  }
  else
  {
    uint64_t v9 = sub_1E4CBE9D0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v7, 1, 1, v9);
  }
  id v10 = self;
  BobbleMappingSelectionController.listItemSelected(_:)((uint64_t)v7);

  sub_1E4C8370C((uint64_t)v7, &qword_1EAE8DFE0);
}

- (void).cxx_destruct
{
  swift_release();

  swift_bridgeObjectRelease();
}

@end