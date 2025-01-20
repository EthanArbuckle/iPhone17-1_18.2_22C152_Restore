@interface SummarySharingSystemContactsPickerViewController
- (_TtC18HealthExperienceUI48SummarySharingSystemContactsPickerViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6;
- (_TtC18HealthExperienceUI48SummarySharingSystemContactsPickerViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6;
- (void)contactPicker:(id)a3 didSelectContact:(id)a4;
- (void)contactPickerDidCancel:(id)a3;
- (void)summarySharingEntryStore:(id)a3 didUpdateReachabilityStatus:(id)a4 error:(id)a5;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation SummarySharingSystemContactsPickerViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_1AD4970F4();
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for SummarySharingSystemContactsPickerViewController();
  id v4 = v5.receiver;
  [(OBBaseWelcomeController *)&v5 viewDidAppear:v3];
  sub_1AD4974C0();
}

- (void)contactPickerDidCancel:(id)a3
{
  id v4 = a3;
  objc_super v5 = self;
  sub_1AD498BB8(v4);
}

- (void)contactPicker:(id)a3 didSelectContact:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_1AD499D28(v7);
}

- (void)summarySharingEntryStore:(id)a3 didUpdateReachabilityStatus:(id)a4 error:(id)a5
{
  sub_1AD2147D4(0, (unint64_t *)&qword_1EB741450);
  uint64_t v8 = sub_1AD73F030();
  id v9 = a3;
  v10 = self;
  id v11 = a5;
  sub_1AD499E88(v8);

  swift_bridgeObjectRelease();
}

- (_TtC18HealthExperienceUI48SummarySharingSystemContactsPickerViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  result = (_TtC18HealthExperienceUI48SummarySharingSystemContactsPickerViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC18HealthExperienceUI48SummarySharingSystemContactsPickerViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6 = a5;
  result = (_TtC18HealthExperienceUI48SummarySharingSystemContactsPickerViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self+ OBJC_IVAR____TtC18HealthExperienceUI48SummarySharingSystemContactsPickerViewController_healthExperienceStore);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI48SummarySharingSystemContactsPickerViewController_healthStore));
  sub_1AD4997CC(*(id *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC18HealthExperienceUI48SummarySharingSystemContactsPickerViewController_state), *((unsigned char *)&self->super.super.super.super._responderFlags+ OBJC_IVAR____TtC18HealthExperienceUI48SummarySharingSystemContactsPickerViewController_state));
  BOOL v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC18HealthExperienceUI48SummarySharingSystemContactsPickerViewController_sharingStore);
}

@end