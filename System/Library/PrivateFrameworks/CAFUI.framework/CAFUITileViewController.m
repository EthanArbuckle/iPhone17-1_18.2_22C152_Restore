@interface CAFUITileViewController
- (BOOL)collectionView:(id)a3 shouldUpdateFocusInContext:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (_TtC5CAFUI23CAFUITileViewController)initWithCoder:(id)a3;
- (_TtC5CAFUI23CAFUITileViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)_wheelChangedWithEvent:(id)a3;
- (void)automakerSettingService:(id)a3 didUpdateDisabled:(BOOL)a4;
- (void)automakerSettingService:(id)a3 didUpdateHidden:(BOOL)a4;
- (void)automakerSettingService:(id)a3 didUpdateSectionIdentifier:(id)a4;
- (void)automakerSettingService:(id)a3 didUpdateSortOrder:(unsigned __int8)a4;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)dismissIfModal;
- (void)nudgeGestureRecognized:(id)a3;
- (void)punchThroughController:(id)a3 didDismissPunchThroughWithIdentifier:(id)a4;
- (void)updateForLimitUIChanged;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation CAFUITileViewController

- (_TtC5CAFUI23CAFUITileViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  specialized CAFUITileViewController.init(coder:)();
}

- (void)viewDidLoad
{
  v2 = self;
  CAFUITileViewController.viewDidLoad()();
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  CAFUITileViewController.viewWillAppear(_:)(a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for CAFUITileViewController();
  v4 = (char *)v5.receiver;
  [(CAFUITileViewController *)&v5 viewWillDisappear:v3];
  objc_msgSend(*(id *)&v4[OBJC_IVAR____TtC5CAFUI23CAFUITileViewController_volumeNotificationAssertion], sel_cancelSuspension, v5.receiver, v5.super_class);
}

- (BOOL)collectionView:(id)a3 shouldUpdateFocusInContext:(id)a4
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for IndexPath?);
  MEMORY[0x270FA5388](v5 - 8);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = (char *)self + OBJC_IVAR____TtC5CAFUI23CAFUITileViewController_focusLockIndexPath;
  swift_beginAccess();
  outlined init with copy of UIListContentConfiguration?((uint64_t)v8, (uint64_t)v7, &demangling cache variable for type metadata for IndexPath?);
  uint64_t v9 = type metadata accessor for IndexPath();
  LOBYTE(v8) = (*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v9 - 8) + 48))(v7, 1, v9) == 1;
  outlined destroy of UIContentConfiguration?((uint64_t)v7, &demangling cache variable for type metadata for IndexPath?);
  return (char)v8;
}

- (void)_wheelChangedWithEvent:(id)a3
{
  id v5 = a3;
  uint64_t v6 = self;
  v9.is_nil = (char)v6;
  v7 = v6;
  v9.value.super.isa = (Class)a3;
  CAFUITileViewController._wheelChanged(with:)(v9);
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  id v5 = self;
  LOBYTE(self) = CAFUITileViewController.gestureRecognizerShouldBegin(_:)((UIGestureRecognizer)v4);

  return self & 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  Swift::Bool v9 = CAFUITileViewController.gestureRecognizer(_:shouldBeRequiredToFailBy:)((UIGestureRecognizer)v6, (UIGestureRecognizer)v7);

  return v9;
}

- (void)nudgeGestureRecognized:(id)a3
{
  id v4 = a3;
  id v6 = self;
  os_log_type_t v5 = static os_log_type_t.info.getter();
  specialized static CAFUILogger.log(_:message:function:file:line:)(v5, 0xD000000000000015, 0x8000000249536190, 0xD00000000000001ALL, 0x80000002495361B0);
}

- (_TtC5CAFUI23CAFUITileViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC5CAFUI23CAFUITileViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();

  swift_bridgeObjectRelease();
  outlined destroy of UIContentConfiguration?((uint64_t)self + OBJC_IVAR____TtC5CAFUI23CAFUITileViewController_focusLockIndexPath, &demangling cache variable for type metadata for IndexPath?);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5CAFUI23CAFUITileViewController_nudgeGestureRecognizer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5CAFUI23CAFUITileViewController_nudgeLongGestureRecognizer));

  swift_release();
  swift_bridgeObjectRelease();
  BOOL v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC5CAFUI23CAFUITileViewController_volumeNotificationAssertion);
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  Swift::Bool v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  v10 = (char *)a3;
  uint64_t v11 = self;
  CAFUITileViewController.collectionView(_:didSelectItemAt:)(v10, (unint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)dismissIfModal
{
  os_log_type_t v5 = self;
  v2 = (_TtC5CAFUI23CAFUITileViewController *)[(CAFUITileViewController *)v5 presentingViewController];
  if (v2)
  {
    BOOL v3 = v2;
    [(CAFUITileViewController *)v2 dismissViewControllerAnimated:1 completion:0];

    id v4 = v3;
  }
  else
  {
    id v4 = v5;
  }
}

- (void)punchThroughController:(id)a3 didDismissPunchThroughWithIdentifier:(id)a4
{
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v8 = v7;
  id v9 = a3;
  v10 = self;
  specialized CAFUITileViewController.punchThroughController(_:didDismissPunchThroughWithIdentifier:)(v6, v8);

  swift_bridgeObjectRelease();
}

- (void)updateForLimitUIChanged
{
  v2 = self;
  CAFUITileViewController.updateForLimitUIChanged()();
}

- (void)automakerSettingService:(id)a3 didUpdateSortOrder:(unsigned __int8)a4
{
  id v5 = a3;
  uint64_t v6 = self;
  CAFUITileViewController.resetAndReload()();
}

- (void)automakerSettingService:(id)a3 didUpdateSectionIdentifier:(id)a4
{
  if (a4) {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  id v6 = a3;
  uint64_t v7 = self;
  CAFUITileViewController.resetAndReload()();

  swift_bridgeObjectRelease();
}

- (void)automakerSettingService:(id)a3 didUpdateHidden:(BOOL)a4
{
  id v6 = a3;
  uint64_t v7 = self;
  CAFUITileViewController.automakerSettingService(_:didUpdateHidden:)(v6, a4);
}

- (void)automakerSettingService:(id)a3 didUpdateDisabled:(BOOL)a4
{
  if (a4)
  {
    id v5 = a3;
    id v6 = self;
    CAFUITileViewController.handleSettingHiddenDisabled(_:)(v5);
  }
}

@end