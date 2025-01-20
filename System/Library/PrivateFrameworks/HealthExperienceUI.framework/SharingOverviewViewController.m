@interface SharingOverviewViewController
- (NSString)sidebarSelectionIdentifier;
- (_TtC18HealthExperienceUI29SharingOverviewViewController)initWithCoder:(id)a3;
- (_TtC18HealthExperienceUI29SharingOverviewViewController)initWithCollectionViewLayout:(id)a3;
- (void)restoreUserActivityState:(id)a3;
- (void)ttrButtonTapped;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation SharingOverviewViewController

- (NSString)sidebarSelectionIdentifier
{
  if (*(void *)((char *)&self->super.super.super.super._responderFlags
                 + OBJC_IVAR____TtC18HealthExperienceUI29SharingOverviewViewController_sidebarSelectionIdentifier))
  {
    swift_bridgeObjectRetain();
    v2 = (void *)sub_1AD73F180();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  return (NSString *)v2;
}

- (_TtC18HealthExperienceUI29SharingOverviewViewController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI29SharingOverviewViewController____lazy_storage___store) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI29SharingOverviewViewController_syncObserver) = 0;
  v4 = (Class *)((char *)&self->super.super.super.super.super.isa
               + OBJC_IVAR____TtC18HealthExperienceUI29SharingOverviewViewController_sidebarSelectionIdentifier);
  void *v4 = 0xD000000000000019;
  v4[1] = 0x80000001AD773680;
  id v5 = a3;

  result = (_TtC18HealthExperienceUI29SharingOverviewViewController *)sub_1AD7408B0();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1AD28280C();
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for SharingOverviewViewController();
  id v4 = v7.receiver;
  [(CompoundDataSourceCollectionViewController *)&v7 viewDidAppear:v3];
  id v5 = objc_msgSend(v4, sel_userActivity, v7.receiver, v7.super_class);
  if (v5)
  {
    id v6 = v5;
    objc_msgSend(v4, sel_submitUserActivityForRestoration_, v5);

    id v4 = v6;
  }
}

- (void)restoreUserActivityState:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1AD282F08((uint64_t)v4);
}

- (_TtC18HealthExperienceUI29SharingOverviewViewController)initWithCollectionViewLayout:(id)a3
{
  id v3 = a3;
  result = (_TtC18HealthExperienceUI29SharingOverviewViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI29SharingOverviewViewController_healthExperienceStore);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI29SharingOverviewViewController_healthStore));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI29SharingOverviewViewController_pinnedContentManager);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI29SharingOverviewViewController____lazy_storage___store));
  swift_release();
  swift_bridgeObjectRelease();
}

- (void)ttrButtonTapped
{
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = self;
  id v4 = self;
  sub_1AD5DC1AC(0x532068746C616548, 0xEE00676E69726168, (uint64_t)sub_1AD5DDF10, v3);

  swift_release();
}

@end