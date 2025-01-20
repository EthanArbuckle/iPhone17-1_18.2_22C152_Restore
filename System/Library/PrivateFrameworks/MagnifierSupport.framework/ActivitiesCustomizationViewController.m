@interface ActivitiesCustomizationViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (_TtC16MagnifierSupport37ActivitiesCustomizationViewController)initWithCoder:(id)a3;
- (_TtC16MagnifierSupport37ActivitiesCustomizationViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 trailingSwipeActionsConfigurationForRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_commitAndDismiss;
- (void)didToggleActivitySwitch:(id)a3;
- (void)presentationControllerDidDismiss:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation ActivitiesCustomizationViewController

- (void)_commitAndDismiss
{
  v2 = self;
  sub_2356E4E88();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_2356E4FB8();
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_2356E53CC(a3);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_TtC16MagnifierSupport37ActivitiesCustomizationViewController)initWithNibName:(id)a3 bundle:(id)a4
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
  return (_TtC16MagnifierSupport37ActivitiesCustomizationViewController *)sub_2356E55AC(v5, v7, a4);
}

- (_TtC16MagnifierSupport37ActivitiesCustomizationViewController)initWithCoder:(id)a3
{
  return (_TtC16MagnifierSupport37ActivitiesCustomizationViewController *)sub_2356E59C8(a3);
}

- (void).cxx_destruct
{
  sub_23566A2B4((uint64_t)self + OBJC_IVAR____TtC16MagnifierSupport37ActivitiesCustomizationViewController_delegate);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport37ActivitiesCustomizationViewController_tableView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport37ActivitiesCustomizationViewController_commitActivityButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport37ActivitiesCustomizationViewController_activityNameOnBoardingController));
  sub_235689B14((uint64_t)self + OBJC_IVAR____TtC16MagnifierSupport37ActivitiesCustomizationViewController_activityToBeDuped, (uint64_t)v3);
  sub_235691A68(v3);
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 2;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if (a4 == 1) {
    return (*(void **)((char *)&self->super.super.super.isa
  }
                       + OBJC_IVAR____TtC16MagnifierSupport37ActivitiesCustomizationViewController_activities))[2];
  else {
    return a4 == 0;
  }
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_235947B38();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6, v8, v9, v10, v11);
  v13 = (char *)&v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_235947AC8();
  id v14 = a3;
  v15 = self;
  id v16 = sub_2356EB6D0();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v13, v6);
  return v16;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  sub_2356EBEDC(a4);
  if (v4)
  {
    uint64_t v5 = (void *)sub_235949A88();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v5 = 0;
  }
  return v5;
}

- (void)didToggleActivitySwitch:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_2356EBFE0((uint64_t)v4);
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

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_235947B38();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6, v8, v9, v10, v11);
  uint64_t v13 = (char *)&v16 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_235947AC8();
  id v14 = a3;
  v15 = self;
  sub_2356E65BC(v14);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v13, v6);
}

- (id)tableView:(id)a3 trailingSwipeActionsConfigurationForRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_235947B38();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6, v8, v9, v10, v11);
  uint64_t v13 = (char *)&v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_235947AC8();
  id v14 = a3;
  v15 = self;
  id v16 = sub_2356EC4B8((uint64_t)v13);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v13, v6);
  return v16;
}

- (void)presentationControllerDidDismiss:(id)a3
{
  if (MEMORY[0x237DEA060]((char *)self + OBJC_IVAR____TtC16MagnifierSupport37ActivitiesCustomizationViewController_delegate, a2))
  {
    id v5 = a3;
    uint64_t v6 = self;
    id v7 = sub_23587EF5C();
    sub_2356FF128();

    sub_23588D444(1);
    swift_unknownObjectRelease();
  }
}

@end