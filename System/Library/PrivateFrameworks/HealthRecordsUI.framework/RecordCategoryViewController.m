@interface RecordCategoryViewController
- (NSString)sidebarSelectionIdentifier;
- (_TtC15HealthRecordsUI28RecordCategoryViewController)initWithCoder:(id)a3;
- (_TtC15HealthRecordsUI28RecordCategoryViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)didDismissSearchController:(id)a3;
- (void)modePickerDidChange:(id)a3;
- (void)presentPDFViewController;
- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)showPinnedLabsPopoverIfNeeded;
- (void)tapToRadar:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateSearchResultsForSearchController:(id)a3;
- (void)viewDidLoad;
- (void)viewIsAppearing:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)willDismissSearchController:(id)a3;
- (void)willPresentSearchController:(id)a3;
@end

@implementation RecordCategoryViewController

- (NSString)sidebarSelectionIdentifier
{
  v2 = self;
  sub_1C2359C68();
  uint64_t v4 = v3;

  if (v4)
  {
    v5 = (void *)sub_1C254F430();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }
  return (NSString *)v5;
}

- (_TtC15HealthRecordsUI28RecordCategoryViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1C235F25C();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1C2359DB0();
}

- (void)viewIsAppearing:(BOOL)a3
{
  uint64_t v4 = self;
  sub_1C235A3F4(a3);
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  sub_1C235A544();
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for RecordCategoryViewController();
  id v4 = v7.receiver;
  [(RecordCategoryViewController *)&v7 viewWillAppear:v3];
  if (*((unsigned char *)v4 + OBJC_IVAR____TtC15HealthRecordsUI28RecordCategoryViewController_category) == 2)
  {
    id v5 = objc_msgSend(v4, sel_traitCollection, v7.receiver, v7.super_class);
    id v6 = objc_msgSend(v5, sel_userInterfaceIdiom);

    if (v6 == (id)1) {
      sub_1C235ADEC();
    }
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for RecordCategoryViewController();
  id v4 = v5.receiver;
  [(RecordCategoryViewController *)&v5 viewWillDisappear:v3];
  sub_1C235B5A0(1, 0, 0);
}

- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  v8 = _Block_copy(a5);
  if (v8)
  {
    uint64_t v9 = swift_allocObject();
    *(void *)(v9 + 16) = v8;
    v8 = sub_1C235FF18;
  }
  else
  {
    uint64_t v9 = 0;
  }
  id v10 = a3;
  v11 = self;
  sub_1C235A7C4(v10, a4, (uint64_t)v8, v9);
  sub_1C221794C((uint64_t)v8);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  id v6 = self;
  sub_1C235AB7C(a3);
}

- (void)showPinnedLabsPopoverIfNeeded
{
  v2 = self;
  sub_1C235B228();
}

- (void)modePickerDidChange:(id)a3
{
  if (a3)
  {
    id v4 = self;
    swift_unknownObjectRetain();
    sub_1C25501E0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
    id v5 = self;
  }
  sub_1C235B72C();

  sub_1C235FF70((uint64_t)v6, (uint64_t (*)(void))sub_1C224E400);
}

- (void)tapToRadar:(id)a3
{
  if (a3)
  {
    id v4 = self;
    swift_unknownObjectRetain();
    sub_1C25501E0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
    id v5 = self;
  }
  type metadata accessor for TapToRadarManager();
  static TapToRadarManager.presentTapToRadarDialogue(from:)(self);

  sub_1C235FF70((uint64_t)v6, (uint64_t (*)(void))sub_1C224E400);
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  id v6 = self;
  sub_1C235B954(a3, a4);
}

- (void)presentPDFViewController
{
  v2 = self;
  sub_1C235BA4C();
}

- (_TtC15HealthRecordsUI28RecordCategoryViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC15HealthRecordsUI28RecordCategoryViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI28RecordCategoryViewController_profile));
  BOOL v3 = *(void **)((char *)&self->super.super._responderFlags
                + OBJC_IVAR____TtC15HealthRecordsUI28RecordCategoryViewController_category);
  objc_release(*(id *)((char *)&self->super._navigationItem
                     + OBJC_IVAR____TtC15HealthRecordsUI28RecordCategoryViewController_category));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI28RecordCategoryViewController_currentViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI28RecordCategoryViewController_gradientView));
  swift_release();
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)self + OBJC_IVAR____TtC15HealthRecordsUI28RecordCategoryViewController_gradientColorProvider);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI28RecordCategoryViewController_labsTipTimer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI28RecordCategoryViewController_currentPalette));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI28RecordCategoryViewController____lazy_storage___scrollView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI28RecordCategoryViewController____lazy_storage___modePicker));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI28RecordCategoryViewController____lazy_storage___resultViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI28RecordCategoryViewController____lazy_storage___searchController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI28RecordCategoryViewController____lazy_storage___changeProvider));
  swift_release();
  swift_release();
  sub_1C22CB0FC(*(id *)((char *)&self->super.super.super.isa
                      + OBJC_IVAR____TtC15HealthRecordsUI28RecordCategoryViewController____lazy_storage___udcListViewController));
  sub_1C22CB0FC(*(id *)((char *)&self->super.super.super.isa
                      + OBJC_IVAR____TtC15HealthRecordsUI28RecordCategoryViewController____lazy_storage___latestViewContoller));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI28RecordCategoryViewController____lazy_storage___lastUpdatedViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI28RecordCategoryViewController____lazy_storage___alphabeticalViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI28RecordCategoryViewController_labsOnboardingViewController));
  swift_release();
}

- (void)updateSearchResultsForSearchController:(id)a3
{
  id v4 = a3;
  id v5 = self;
  _s15HealthRecordsUI28RecordCategoryViewControllerC19updateSearchResults3forySo08UISearchG0C_tF_0();
}

- (void)willPresentSearchController:(id)a3
{
}

- (void)willDismissSearchController:(id)a3
{
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC15HealthRecordsUI28RecordCategoryViewController_isSearching) = 0;
}

- (void)didDismissSearchController:(id)a3
{
  id v4 = a3;
  id v5 = self;
  _s15HealthRecordsUI28RecordCategoryViewControllerC016didDismissSearchG0yySo08UISearchG0CF_0();
}

@end