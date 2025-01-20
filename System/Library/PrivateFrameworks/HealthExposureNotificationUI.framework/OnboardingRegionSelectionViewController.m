@interface OnboardingRegionSelectionViewController
- (_TtC28HealthExposureNotificationUI39OnboardingRegionSelectionViewController)initWithCoder:(id)a3;
- (_TtC28HealthExposureNotificationUI39OnboardingRegionSelectionViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)didTapCancel;
- (void)didTapDone;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation OnboardingRegionSelectionViewController

- (_TtC28HealthExposureNotificationUI39OnboardingRegionSelectionViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_2293C6F08();
}

- (void)viewDidLoad
{
  v2 = self;
  OnboardingRegionSelectionViewController.viewDidLoad()();
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)swift_getObjectType();
  v4 = (char *)v9.receiver;
  [(OnboardingRegionSelectionViewController *)&v9 viewWillAppear:v3];
  id v5 = objc_msgSend(v4, sel_navigationController, v9.receiver, v9.super_class);
  if (v5)
  {
    v6 = v5;
    objc_msgSend(v5, sel_setNavigationBarHidden_animated_, 0, v3);
  }
  uint64_t v7 = *(void *)&v4[OBJC_IVAR____TtC28HealthExposureNotificationUI39OnboardingRegionSelectionViewController_flow + 8];
  uint64_t ObjectType = swift_getObjectType();
  (*(void (**)(void, uint64_t, uint64_t))(v7 + 16))(0, ObjectType, v7);
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  v4 = (char *)v7.receiver;
  [(OnboardingRegionSelectionViewController *)&v7 viewWillDisappear:v3];
  if (objc_msgSend(v4, sel_isMovingFromParentViewController, v7.receiver, v7.super_class))
  {
    uint64_t v5 = *(void *)&v4[OBJC_IVAR____TtC28HealthExposureNotificationUI39OnboardingRegionSelectionViewController_flow + 8];
    uint64_t ObjectType = swift_getObjectType();
    (*(void (**)(void, uint64_t, uint64_t))(v5 + 64))(MEMORY[0x263F8EE78], ObjectType, v5);
  }
}

- (void)didTapDone
{
}

- (void)didTapCancel
{
  uint64_t v3 = *(void *)((char *)&self->super.super._responderFlags
                 + OBJC_IVAR____TtC28HealthExposureNotificationUI39OnboardingRegionSelectionViewController_flow);
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v5 = *(void (**)(void, uint64_t, uint64_t))(v3 + 64);
  v6 = self;
  v5(MEMORY[0x263F8EE78], ObjectType, v3);
  (*(void (**)(_TtC28HealthExposureNotificationUI39OnboardingRegionSelectionViewController *, _UNKNOWN **, uint64_t, uint64_t))(v3 + 128))(v6, &protocol witness table for OnboardingRegionSelectionViewController, ObjectType, v3);
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v5 = a3;
  v6 = self;
  int64_t v7 = *(void *)(sub_2293C3F38() + 16);

  swift_bridgeObjectRelease();
  return v7;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_229418F28();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  objc_super v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_229418F08();
  id v10 = a3;
  v11 = self;
  v12 = (void *)OnboardingRegionSelectionViewController.tableView(_:cellForRowAt:)(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v12;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_229418F28();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  objc_super v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_229418F08();
  id v10 = a3;
  v11 = self;
  OnboardingRegionSelectionViewController.tableView(_:didSelectRowAt:)(v10, (uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  uint64_t v6 = self;
  v9.is_nil = (char)v6;
  uint64_t v7 = v6;
  v9.value.super.isa = (Class)a3;
  OnboardingRegionSelectionViewController.traitCollectionDidChange(_:)(v9);
}

- (_TtC28HealthExposureNotificationUI39OnboardingRegionSelectionViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC28HealthExposureNotificationUI39OnboardingRegionSelectionViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC28HealthExposureNotificationUI39OnboardingRegionSelectionViewController_statusView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC28HealthExposureNotificationUI39OnboardingRegionSelectionViewController_regionTableView));

  swift_release();
}

@end