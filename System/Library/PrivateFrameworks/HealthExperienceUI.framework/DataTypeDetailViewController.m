@interface DataTypeDetailViewController
- (BOOL)canBecomeFirstResponder;
- (NSString)description;
- (_TtC18HealthExperienceUI28DataTypeDetailViewController)initWithCoder:(id)a3;
- (_TtC18HealthExperienceUI28DataTypeDetailViewController)initWithCollectionViewLayout:(id)a3;
- (void)addDataKeyCommandFired;
- (void)addDataTapped:(id)a3;
- (void)onInternalSettingsGesture;
- (void)restoreUserActivityState:(id)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)shareButtonTapped:(id)a3;
- (void)ttrButtonTapped;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation DataTypeDetailViewController

- (void)addDataTapped:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  sub_1AD7404B0();
  swift_unknownObjectRelease();
  sub_1AD1F63A8((uint64_t)v8, (uint64_t)v7);
  sub_1AD32429C();
  if (swift_dynamicCast()) {
    uint64_t v5 = v6;
  }
  else {
    uint64_t v5 = 0;
  }
  (*(void (**)(uint64_t, uint64_t))((*MEMORY[0x1E4FBC8C8] & (uint64_t)v4->super.super.super.super.super.isa)
                                           + 0x2C0))(1, v5);

  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v8);
}

- (void)addDataKeyCommandFired
{
  v2 = self;
  id v3 = sub_1AD5B6868();
  (*(void (**)(uint64_t, id))((*MEMORY[0x1E4FBC8C8] & (uint64_t)v2->super.super.super.super.super.isa) + 0x2C0))(1, v3);
}

- (void)shareButtonTapped:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  sub_1AD7404B0();
  swift_unknownObjectRelease();
  sub_1AD323800();

  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v5);
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (_TtC18HealthExperienceUI28DataTypeDetailViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  _s18HealthExperienceUI28DataTypeDetailViewControllerC5coderACSgSo7NSCoderC_tcfc_0();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1AD5B7804();
}

- (void)viewWillAppear:(BOOL)a3
{
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for DataTypeDetailViewController();
  id v4 = v5.receiver;
  [(CompoundDataSourceCollectionViewController *)&v5 viewDidAppear:v3];
  objc_msgSend(v4, sel_becomeFirstResponder, v5.receiver, v5.super_class);
}

- (void)viewDidDisappear:(BOOL)a3
{
}

- (void)scrollViewDidScroll:(id)a3
{
  id v5 = a3;
  id v4 = self;
  sub_1AD5BA334();
}

- (void)restoreUserActivityState:(id)a3
{
  id v5 = a3;
  id v4 = self;
  sub_1AD5B7F04(v5);
}

- (_TtC18HealthExperienceUI28DataTypeDetailViewController)initWithCollectionViewLayout:(id)a3
{
  id v3 = a3;
  result = (_TtC18HealthExperienceUI28DataTypeDetailViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1AD3B88FC((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI28DataTypeDetailViewController_context);
  sub_1AD1CC2DC((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI28DataTypeDetailViewController_chartImageProvider, (uint64_t)&qword_1EB732130, (uint64_t)&qword_1EB731E70, (uint64_t)&protocol descriptor for ChartImageProviding, (uint64_t (*)(void))sub_1AD1DE498);
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI28DataTypeDetailViewController_restorationUserActivity));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI28DataTypeDetailViewController_hkType));
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC18HealthExperienceUI28DataTypeDetailViewController____lazy_storage___addDataButton);
}

- (void)onInternalSettingsGesture
{
  v2 = self;
  DataTypeDetailViewController.onInternalSettingsGesture()();
}

- (NSString)description
{
  v2 = self;
  DataTypeDetailViewController.description.getter();

  id v3 = (void *)sub_1AD73F180();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void)ttrButtonTapped
{
  v2 = self;
  sub_1AD5B66E0();
  sub_1AD513018();

  swift_release();
}

@end