@interface ImprovementDataCollectionOptInViewController
- (_TtC15HealthRecordsUI44ImprovementDataCollectionOptInViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6;
- (_TtC15HealthRecordsUI44ImprovementDataCollectionOptInViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6;
- (void)accessoryButtonTapped;
- (void)hxui_primaryFooterButtonTapped;
- (void)hxui_secondaryFooterButtonTapped;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation ImprovementDataCollectionOptInViewController

- (void)viewDidLoad
{
  v2 = self;
  ImprovementDataCollectionOptInViewController.viewDidLoad()();
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  id v4 = v6.receiver;
  [(OBBaseWelcomeController *)&v6 viewDidAppear:v3];
  if (qword_1EBB6D840 != -1) {
    swift_once();
  }
  id v5 = (id)qword_1EBB6E968;
  sub_1C23CEB5C(1, 2, 0);
}

- (void)hxui_primaryFooterButtonTapped
{
  v2 = self;
  sub_1C221A464(1);
}

- (void)hxui_secondaryFooterButtonTapped
{
  v2 = self;
  sub_1C221A464(0);
}

- (void)accessoryButtonTapped
{
  uint64_t v2 = qword_1EBB6D858;
  BOOL v3 = self;
  if (v2 != -1) {
    swift_once();
  }
  id v4 = objc_msgSend((id)qword_1EBB6ED30, sel_makeImproveHealthRecordsPrivacyPresenter);
  id v5 = [(ImprovementDataCollectionOptInViewController *)v3 navigationController];
  objc_msgSend(v4, sel_presentInNavigationStack_, v5);

  if (qword_1EBB6D840 != -1) {
    swift_once();
  }
  id v6 = (id)qword_1EBB6E968;
  sub_1C23CEB5C(1, 2, 1);
}

- (_TtC15HealthRecordsUI44ImprovementDataCollectionOptInViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  result = (_TtC15HealthRecordsUI44ImprovementDataCollectionOptInViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC15HealthRecordsUI44ImprovementDataCollectionOptInViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6 = a5;
  result = (_TtC15HealthRecordsUI44ImprovementDataCollectionOptInViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end