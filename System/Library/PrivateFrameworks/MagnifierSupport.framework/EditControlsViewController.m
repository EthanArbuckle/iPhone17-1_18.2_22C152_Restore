@interface EditControlsViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (BOOL)tableView:(id)a3 shouldIndentWhileEditingRowAtIndexPath:(id)a4;
- (_TtC16MagnifierSupport26EditControlsViewController)initWithCoder:(id)a3;
- (_TtC16MagnifierSupport26EditControlsViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)tableView:(id)a3 targetIndexPathForMoveFromRowAtIndexPath:(id)a4 toProposedIndexPath:(id)a5;
- (id)tableView:(id)a3 titleForDeleteConfirmationButtonForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4;
- (void)handleDoneButtonTap:(id)a3;
- (void)handleInfoButtonTap:(id)a3;
- (void)presentationControllerDidDismiss:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation EditControlsViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_235794450();
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_235794684(a3);
}

- (void)handleDoneButtonTap:(id)a3
{
}

- (void)handleInfoButtonTap:(id)a3
{
}

- (_TtC16MagnifierSupport26EditControlsViewController)initWithNibName:(id)a3 bundle:(id)a4
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
  return (_TtC16MagnifierSupport26EditControlsViewController *)sub_235795648(v5, v7, a4);
}

- (_TtC16MagnifierSupport26EditControlsViewController)initWithCoder:(id)a3
{
  return (_TtC16MagnifierSupport26EditControlsViewController *)sub_235795858(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport26EditControlsViewController____lazy_storage___activitiesCustomizationViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport26EditControlsViewController____lazy_storage___captureSettingsViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport26EditControlsViewController____lazy_storage___detectionModeSettingsViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport26EditControlsViewController____lazy_storage___filterCustomizationViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport26EditControlsViewController____lazy_storage___internalDetectionOptionsViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport26EditControlsViewController_tableView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport26EditControlsViewController____lazy_storage___dataSource));
  v3 = (char *)self + OBJC_IVAR____TtC16MagnifierSupport26EditControlsViewController_delegate;
  sub_23566A2B4((uint64_t)v3);
}

- (void)presentationControllerDidDismiss:(id)a3
{
  if (MEMORY[0x237DEA060]((char *)self + OBJC_IVAR____TtC16MagnifierSupport26EditControlsViewController_delegate, a2))
  {
    id v5 = a3;
    uint64_t v6 = self;
    sub_2358A2880();

    swift_unknownObjectRelease();
  }
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  uint64_t v4 = sub_235947B38();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4, v6, v7, v8, v9);
  v11 = (char *)&v13 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
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
  int64_t v16 = sub_235798028(v14);

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
  sub_235795EFC((uint64_t)v21, (uint64_t)v14, (uint64_t)v28);

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
  sub_2357964C4(v14);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v13, v6);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

@end