@interface SelfServiceSuitePickerViewController
- (_TtC11Diagnostics36SelfServiceSuitePickerViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6;
- (_TtC11Diagnostics36SelfServiceSuitePickerViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation SelfServiceSuitePickerViewController

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for SelfServiceSuitePickerViewController();
  v2 = (char *)v4.receiver;
  [(SelfServiceBaseNavigationController *)&v4 viewDidLoad];
  sub_10008F054();
  id v3 = [v2 contentView];
  [v3 addSubview:*(void *)&v2[OBJC_IVAR____TtC11Diagnostics36SelfServiceSuitePickerViewController_tableView]];

  sub_10008F214();
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for SelfServiceSuitePickerViewController();
  objc_super v4 = (char *)v5.receiver;
  [(SelfServiceSuitePickerViewController *)&v5 viewDidAppear:v3];
  *(void *)(*(void *)&v4[OBJC_IVAR____TtC11Diagnostics36SelfServiceSuitePickerViewController_suiteManager]
            + OBJC_IVAR____TtC11Diagnostics12SuiteManager_delegate
            + 8) = &off_100150F80;
  swift_unknownObjectWeakAssign();
  [v4[OBJC_IVAR____TtC11Diagnostics36SelfServiceSuitePickerViewController_tableView] invalidateIntrinsicContentSize];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for SelfServiceSuitePickerViewController();
  objc_super v4 = (char *)v5.receiver;
  [(SelfServiceSuitePickerViewController *)&v5 viewWillDisappear:v3];
  *(void *)(*(void *)&v4[OBJC_IVAR____TtC11Diagnostics36SelfServiceSuitePickerViewController_suiteManager]
            + OBJC_IVAR____TtC11Diagnostics12SuiteManager_delegate
            + 8) = 0;
  swift_unknownObjectWeakAssign();
}

- (_TtC11Diagnostics36SelfServiceSuitePickerViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  result = (_TtC11Diagnostics36SelfServiceSuitePickerViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC11Diagnostics36SelfServiceSuitePickerViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6 = a5;
  result = (_TtC11Diagnostics36SelfServiceSuitePickerViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super
                     + OBJC_IVAR____TtC11Diagnostics36SelfServiceSuitePickerViewController_suiteManager));
  BOOL v3 = *(void **)((char *)&self->super + OBJC_IVAR____TtC11Diagnostics36SelfServiceSuitePickerViewController_tableView);
}

@end