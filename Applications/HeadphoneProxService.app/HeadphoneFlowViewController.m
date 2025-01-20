@interface HeadphoneFlowViewController
+ (BOOL)_isSecureForRemoteViewService;
- (BOOL)_canShowWhileLocked;
- (BOOL)_shouldRemoveViewFromHierarchyOnDisappear;
- (_TtC20HeadphoneProxService27HeadphoneFlowViewController)initWithCoder:(id)a3;
- (_TtC20HeadphoneProxService27HeadphoneFlowViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (unint64_t)supportedInterfaceOrientations;
- (void)_willAppearInRemoteViewController;
- (void)configureWithContext:(id)a3 completion:(id)a4;
- (void)handleButtonActions:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation HeadphoneFlowViewController

- (_TtC20HeadphoneProxService27HeadphoneFlowViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC20HeadphoneProxService27HeadphoneFlowViewController *)sub_1000780EC(v5, v7, a4);
}

- (_TtC20HeadphoneProxService27HeadphoneFlowViewController)initWithCoder:(id)a3
{
  v4 = &self->SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC20HeadphoneProxService27HeadphoneFlowViewController_interactor];
  *((void *)v4 + 4) = 0;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  uint64_t v5 = &self->SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC20HeadphoneProxService27HeadphoneFlowViewController_presenter];
  *(void *)uint64_t v5 = 0;
  *((void *)v5 + 1) = 0;
  *((void *)v5 + 2) = 0;
  self->SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC20HeadphoneProxService27HeadphoneFlowViewController_homePressed] = 0;
  id v6 = a3;

  result = (_TtC20HeadphoneProxService27HeadphoneFlowViewController *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  id v6 = _Block_copy(a4);
  if (v6)
  {
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = v6;
    id v6 = sub_100079948;
  }
  else
  {
    uint64_t v7 = 0;
  }
  id v8 = a3;
  v9 = self;
  sub_10007830C(v8, (uint64_t)v6, v7);
  sub_10005FEA0((uint64_t)v6);
}

- (void)viewDidAppear:(BOOL)a3
{
  v4 = self;
  sub_100078EC0(a3);
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_100079018(a3);
}

- (unint64_t)supportedInterfaceOrientations
{
  return _PRXSupportedInterfaceOrientations(self, 1);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

- (void)handleButtonActions:(id)a3
{
  if (a3)
  {
    sub_100008EB0(0, &qword_1000D6708);
    sub_1000798A8();
    uint64_t v4 = static Set._unconditionallyBridgeFromObjectiveC(_:)();
  }
  else
  {
    uint64_t v4 = 0;
  }
  uint64_t v5 = self;
  sub_1000791E8(v4);

  swift_bridgeObjectRelease();
}

- (void)_willAppearInRemoteViewController
{
  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  id v2 = v4.receiver;
  [(HeadphoneFlowViewController *)&v4 _willAppearInRemoteViewController];
  v3 = (void *)sub_1000326D8();
  if (v3)
  {
    [v3 setAllowsAlertStacking:1];

    swift_unknownObjectRelease();
  }
  else
  {
  }
}

- (BOOL)_shouldRemoveViewFromHierarchyOnDisappear
{
  return 0;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  sub_10001A2AC((uint64_t)&self->SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC20HeadphoneProxService27HeadphoneFlowViewController_interactor], &qword_1000D4798);

  swift_unknownObjectRelease();
}

@end