@interface ActivityDoorAttributeCustomizationViewController
- (BOOL)_canShowWhileLocked;
- (_TtC16MagnifierSupport48ActivityDoorAttributeCustomizationViewController)initWithCoder:(id)a3;
- (_TtC16MagnifierSupport48ActivityDoorAttributeCustomizationViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation ActivityDoorAttributeCustomizationViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_2358E0F94();
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_2356834BC(a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)swift_getObjectType();
  v4 = (char *)v9.receiver;
  [(ActivityDoorAttributeCustomizationViewController *)&v9 viewWillDisappear:v3];
  v5 = &v4[OBJC_IVAR____TtC16MagnifierSupport48ActivityDoorAttributeCustomizationViewController_delegate];
  swift_beginAccess();
  uint64_t v6 = *((void *)v5 + 3);
  if (v6)
  {
    v7 = *(void **)(*__swift_project_boxed_opaque_existential_1(v5, v6)
                  + OBJC_IVAR____TtC16MagnifierSupport48ActivityDoorDetectionCustomizationViewController_tableView);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26880EB10);
    sub_235947B38();
    *(_OWORD *)(swift_allocObject() + 16) = xmmword_23594FD70;
    MEMORY[0x237DE5A90](0, 6);
    uint64_t v8 = sub_235949D58();
    swift_bridgeObjectRelease();
    objc_msgSend(v7, sel_reloadRowsAtIndexPaths_withRowAnimation_, v8, 5);

    v4 = (char *)v8;
  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_TtC16MagnifierSupport48ActivityDoorAttributeCustomizationViewController)initWithNibName:(id)a3 bundle:(id)a4
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
  return (_TtC16MagnifierSupport48ActivityDoorAttributeCustomizationViewController *)sub_2358E22B0(v5, v7, a4);
}

- (_TtC16MagnifierSupport48ActivityDoorAttributeCustomizationViewController)initWithCoder:(id)a3
{
  return (_TtC16MagnifierSupport48ActivityDoorAttributeCustomizationViewController *)sub_2358E24C8(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport48ActivityDoorAttributeCustomizationViewController_tableView));
  swift_bridgeObjectRelease();
  sub_23566A348((uint64_t)self + OBJC_IVAR____TtC16MagnifierSupport48ActivityDoorAttributeCustomizationViewController_activity, (uint64_t)v3, (uint64_t *)&unk_2688108E0);
  sub_235691A68(v3);
  sub_23566A3AC((uint64_t)self + OBJC_IVAR____TtC16MagnifierSupport48ActivityDoorAttributeCustomizationViewController_delegate, &qword_268813558);
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if (a4) {
    return 0;
  }
  uint64_t v5 = (char *)self
     + OBJC_IVAR____TtC16MagnifierSupport48ActivityDoorAttributeCustomizationViewController_doorAttributes;
  swift_beginAccess();
  return *(void *)(*(void *)v5 + 16);
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
  v16 = (void *)sub_2358E2774(v14);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v13, v6);
  return v16;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  return 0;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  if (a4 || (sub_235685840(), !v5))
  {
    v4 = 0;
  }
  else
  {
    v4 = (void *)sub_235949A88();
    swift_bridgeObjectRelease();
  }
  return v4;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_235947B38();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6, v8, v9, v10, v11);
  v13 = (char *)&v16 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_235947AC8();
  id v14 = a3;
  v15 = self;
  sub_2358E2BF4(v14);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v13, v6);
}

@end