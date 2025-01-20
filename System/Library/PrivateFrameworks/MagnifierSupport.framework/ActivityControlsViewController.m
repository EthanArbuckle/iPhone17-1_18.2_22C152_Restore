@interface ActivityControlsViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (BOOL)tableView:(id)a3 shouldIndentWhileEditingRowAtIndexPath:(id)a4;
- (BOOL)textFieldShouldEndEditing:(id)a3;
- (BOOL)textFieldShouldReturn:(id)a3;
- (_TtC16MagnifierSupport30ActivityControlsViewController)init;
- (_TtC16MagnifierSupport30ActivityControlsViewController)initWithCoder:(id)a3;
- (_TtC16MagnifierSupport30ActivityControlsViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)tableView:(id)a3 targetIndexPathForMoveFromRowAtIndexPath:(id)a4 toProposedIndexPath:(id)a5;
- (id)tableView:(id)a3 titleForDeleteConfirmationButtonForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4;
- (void)handleDoneButtonTap:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation ActivityControlsViewController

- (_TtC16MagnifierSupport30ActivityControlsViewController)init
{
  return [(ActivityControlsViewController *)self initWithNibName:0 bundle:0];
}

- (_TtC16MagnifierSupport30ActivityControlsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_235949AC8();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC16MagnifierSupport30ActivityControlsViewController *)sub_23575E2F8(v5, v7, a4);
}

- (_TtC16MagnifierSupport30ActivityControlsViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_23576E474();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_235761DB4();
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268811630);
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6, v8, v9, v10, v11);
  v13 = (char *)&v16 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16.receiver = self;
  v16.super_class = ObjectType;
  v14 = self;
  [(ActivityControlsViewController *)&v16 viewWillAppear:v3];
  objc_msgSend(*(id *)((char *)&v14->super.super.super.isa+ OBJC_IVAR____TtC16MagnifierSupport30ActivityControlsViewController_tableView), sel_setEditing_, 1);
  sub_2357626D4();
  sub_23576206C();
  v15 = sub_23575E770();
  sub_235948368();

  sub_235760F5C();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v13, v6);
}

- (void)handleDoneButtonTap:(id)a3
{
  BOOL v3 = self;
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_23594A6A8();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v9 = 0u;
    long long v10 = 0u;
    uint64_t v5 = self;
  }
  uint64_t v6 = (_TtC16MagnifierSupport30ActivityControlsViewController *)[(ActivityControlsViewController *)v3 navigationController];
  if (v6)
  {
    uint64_t v7 = v6;
    id v8 = [(ActivityControlsViewController *)v6 popViewControllerAnimated:1];

    BOOL v3 = v7;
  }

  sub_23566A3AC((uint64_t)&v9, &qword_26AF15750);
}

- (BOOL)textFieldShouldEndEditing:(id)a3
{
  return 1;
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  return 0;
}

- (void).cxx_destruct
{
  sub_23566A2B4((uint64_t)self + OBJC_IVAR____TtC16MagnifierSupport30ActivityControlsViewController_activityCreatedDelegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport30ActivityControlsViewController____lazy_storage___filtersCollectionCustomizationViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport30ActivityControlsViewController____lazy_storage___peopleDetectionSettingsViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport30ActivityControlsViewController____lazy_storage___doorDetectionSettingsViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport30ActivityControlsViewController____lazy_storage___objectUnderstandingSettingsViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport30ActivityControlsViewController____lazy_storage___imageCaptionsSettingsViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport30ActivityControlsViewController_languageTranslator));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport30ActivityControlsViewController____lazy_storage___pointSpeakSettingsViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport30ActivityControlsViewController____lazy_storage___textDetectionSettingsViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport30ActivityControlsViewController____lazy_storage___detectionModeUniversalSettingsViewController));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport30ActivityControlsViewController_tableView));
  BOOL v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC16MagnifierSupport30ActivityControlsViewController____lazy_storage___dataSource);
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  uint64_t v4 = sub_235947B38();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4, v6, v7, v8, v9);
  uint64_t v11 = (char *)&v13 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_235947AC8();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v11, v4);
  return 1;
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_235947B38();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6, v8, v9, v10, v11);
  uint64_t v13 = (char *)&v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_235947AC8();
  id v14 = a3;
  v15 = self;
  int64_t v16 = sub_23576E74C(v14);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v13, v6);
  return v16;
}

- (id)tableView:(id)a3 titleForDeleteConfirmationButtonForRowAtIndexPath:(id)a4
{
  uint64_t v4 = sub_235947B38();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4, v6, v7, v8, v9);
  uint64_t v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_235947AC8();
  sub_23576E7E0();
  uint64_t v13 = v12;
  (*(void (**)(char *, uint64_t))(v5 + 8))(v11, v4);
  if (v13)
  {
    id v14 = (void *)sub_235949A88();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v14 = 0;
  }
  return v14;
}

- (BOOL)tableView:(id)a3 shouldIndentWhileEditingRowAtIndexPath:(id)a4
{
  uint64_t v4 = sub_235947B38();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4, v6, v7, v8, v9);
  uint64_t v11 = (char *)&v13 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_235947AC8();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v11, v4);
  return 0;
}

- (id)tableView:(id)a3 targetIndexPathForMoveFromRowAtIndexPath:(id)a4 toProposedIndexPath:(id)a5
{
  uint64_t v7 = sub_235947B38();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7, v9, v10, v11, v12);
  id v14 = (char *)&v34 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15, v16, v17, v18, v19);
  v21 = (char *)&v34 - v20;
  MEMORY[0x270FA5388](v22, v23, v24, v25, v26);
  v28 = (char *)&v34 - v27;
  sub_235947AC8();
  sub_235947AC8();
  id v29 = a3;
  v30 = self;
  sub_235763C88((uint64_t)v21, (uint64_t)v14, (uint64_t)v28);

  v31 = *(void (**)(char *, uint64_t))(v8 + 8);
  v31(v14, v7);
  v31(v21, v7);
  v32 = (void *)sub_235947AB8();
  v31(v28, v7);
  return v32;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_235947B38();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6, v8, v9, v10, v11);
  uint64_t v13 = (char *)&v16 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_235947AC8();
  id v14 = a3;
  uint64_t v15 = self;
  sub_23576420C(v14);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v13, v6);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

@end