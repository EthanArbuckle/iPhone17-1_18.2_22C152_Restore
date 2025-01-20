@interface SummarySharingOnboardingContactPickerViewController
- (_TtC18HealthExperienceUI51SummarySharingOnboardingContactPickerViewController)initWithCoder:(id)a3;
- (_TtC18HealthExperienceUI51SummarySharingOnboardingContactPickerViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)autocompleteResultsController:(id)a3 preferredRecipientForRecipient:(id)a4;
- (void)autocompleteResultsController:(id)a3 didSelectRecipient:(id)a4 atIndex:(int64_t)a5;
- (void)autocompleteResultsController:(id)a3 tintColorForRecipient:(id)a4 completion:(id)a5;
- (void)cancelButtonTapped:(id)a3;
- (void)consumeAutocompleteSearchResults:(id)a3 taskID:(id)a4;
- (void)finishedSearchingForAutocompleteResults;
- (void)summarySharingEntryStore:(id)a3 didUpdateReachabilityStatus:(id)a4 error:(id)a5;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation SummarySharingOnboardingContactPickerViewController

- (_TtC18HealthExperienceUI51SummarySharingOnboardingContactPickerViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1AD4A9200();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1AD4A1814();
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_1AD4A25AC(a3);
}

- (void)viewDidAppear:(BOOL)a3
{
  v4 = self;
  sub_1AD4A27F8(a3);
}

- (void)cancelButtonTapped:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  sub_1AD7404B0();
  swift_unknownObjectRelease();
  sub_1AD4A2BC8();

  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v5);
}

- (_TtC18HealthExperienceUI51SummarySharingOnboardingContactPickerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC18HealthExperienceUI51SummarySharingOnboardingContactPickerViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self+ OBJC_IVAR____TtC18HealthExperienceUI51SummarySharingOnboardingContactPickerViewController_healthExperienceStore);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI51SummarySharingOnboardingContactPickerViewController_healthStore));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI51SummarySharingOnboardingContactPickerViewController_sharingEntryStore));
  swift_release();
  id v3 = (char *)self
     + OBJC_IVAR____TtC18HealthExperienceUI51SummarySharingOnboardingContactPickerViewController__reachabilityQueryState;
  sub_1AD4AB34C(0, &qword_1E9A2F8A0, (uint64_t)&type metadata for QueryState, MEMORY[0x1E4F1AC70]);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI51SummarySharingOnboardingContactPickerViewController____lazy_storage___searchController));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI51SummarySharingOnboardingContactPickerViewController_resultsTableViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI51SummarySharingOnboardingContactPickerViewController____lazy_storage___splashView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI51SummarySharingOnboardingContactPickerViewController____lazy_storage___splashContainerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI51SummarySharingOnboardingContactPickerViewController_resultsTableView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI51SummarySharingOnboardingContactPickerViewController_searchManager));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI51SummarySharingOnboardingContactPickerViewController_currentSearchTaskID));
  swift_bridgeObjectRelease();
}

- (void)summarySharingEntryStore:(id)a3 didUpdateReachabilityStatus:(id)a4 error:(id)a5
{
  sub_1AD2147D4(0, (unint64_t *)&qword_1EB741450);
  uint64_t v8 = sub_1AD73F030();
  id v9 = a3;
  v10 = self;
  id v11 = a5;
  sub_1AD4A9450(v8);

  swift_bridgeObjectRelease();
}

- (void)consumeAutocompleteSearchResults:(id)a3 taskID:(id)a4
{
  if (!a3)
  {
    *((unsigned char *)&self->super.super.super.isa
    + OBJC_IVAR____TtC18HealthExperienceUI51SummarySharingOnboardingContactPickerViewController_foundSearchResults) = 1;
    goto LABEL_6;
  }
  uint64_t v6 = sub_1AD73F4B0();
  *((unsigned char *)&self->super.super.super.isa
  + OBJC_IVAR____TtC18HealthExperienceUI51SummarySharingOnboardingContactPickerViewController_foundSearchResults) = 1;
  if (!v6)
  {
LABEL_6:
    v12 = self;
    id v13 = a4;
    goto LABEL_7;
  }
  uint64_t v7 = v6;
  uint64_t v8 = self;
  id v9 = a4;
  uint64_t v10 = sub_1AD4A142C(v7);
  if (v10)
  {
    unint64_t v11 = v10;
    goto LABEL_8;
  }
LABEL_7:
  swift_bridgeObjectRelease();
  unint64_t v11 = MEMORY[0x1E4FBC860];
LABEL_8:
  sub_1AD4A47AC(v11);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)finishedSearchingForAutocompleteResults
{
  v2 = self;
  sub_1AD4A5AE4();
}

- (void)autocompleteResultsController:(id)a3 tintColorForRecipient:(id)a4 completion:(id)a5
{
  uint64_t v8 = _Block_copy(a5);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  id v10 = a3;
  id v11 = a4;
  v12 = self;
  sub_1AD4A9754(v11, (void (*)(void))sub_1AD4AAE40, v9);

  swift_release();
}

- (id)autocompleteResultsController:(id)a3 preferredRecipientForRecipient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  id v9 = sub_1AD4A9CF8(v7);

  return v9;
}

- (void)autocompleteResultsController:(id)a3 didSelectRecipient:(id)a4 atIndex:(int64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = self;
  sub_1AD4AA3B4(v8);
}

@end