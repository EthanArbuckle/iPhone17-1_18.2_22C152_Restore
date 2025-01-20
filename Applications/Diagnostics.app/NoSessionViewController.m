@interface NoSessionViewController
- (BOOL)showingDeviceInformation;
- (UIButton)infoButton;
- (UIView)deviceInformationView;
- (UIView)substitutableView;
- (_TtC11Diagnostics23NoSessionViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6;
- (_TtC11Diagnostics23NoSessionViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6;
- (uint64_t)viewDidAppear:;
- (void)setDeviceInformationView:(id)a3;
- (void)setInfoButton:(id)a3;
- (void)setShowingDeviceInformation:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation NoSessionViewController

- (BOOL)showingDeviceInformation
{
  return self->OBWelcomeController_opaque[OBJC_IVAR____TtC11Diagnostics23NoSessionViewController__showingDeviceInformation];
}

- (void)setShowingDeviceInformation:(BOOL)a3
{
  self->OBWelcomeController_opaque[OBJC_IVAR____TtC11Diagnostics23NoSessionViewController__showingDeviceInformation] = a3;
}

- (UIView)substitutableView
{
  id v2 = [(NoSessionViewController *)self headerView];

  return (UIView *)v2;
}

- (UIButton)infoButton
{
  return (UIButton *)*(id *)&self->OBWelcomeController_opaque[OBJC_IVAR____TtC11Diagnostics23NoSessionViewController__infoButton];
}

- (void)setInfoButton:(id)a3
{
  id v4 = *(id *)&self->OBWelcomeController_opaque[OBJC_IVAR____TtC11Diagnostics23NoSessionViewController__infoButton];
  *(void *)&self->OBWelcomeController_opaque[OBJC_IVAR____TtC11Diagnostics23NoSessionViewController__infoButton] = a3;
  id v3 = a3;
}

- (UIView)deviceInformationView
{
  return (UIView *)*(id *)&self->OBWelcomeController_opaque[OBJC_IVAR____TtC11Diagnostics23NoSessionViewController__deviceInformationView];
}

- (void)setDeviceInformationView:(id)a3
{
  id v4 = *(id *)&self->OBWelcomeController_opaque[OBJC_IVAR____TtC11Diagnostics23NoSessionViewController__deviceInformationView];
  *(void *)&self->OBWelcomeController_opaque[OBJC_IVAR____TtC11Diagnostics23NoSessionViewController__deviceInformationView] = a3;
  id v3 = a3;
}

- (void)viewDidLoad
{
  id v2 = self;
  sub_100099C80();
}

- (void)viewDidLayoutSubviews
{
  id v2 = self;
  sub_100099F34();
}

- (_TtC11Diagnostics23NoSessionViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  result = (_TtC11Diagnostics23NoSessionViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC11Diagnostics23NoSessionViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6 = a5;
  result = (_TtC11Diagnostics23NoSessionViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  id v3 = *(void **)&self->OBWelcomeController_opaque[OBJC_IVAR____TtC11Diagnostics23NoSessionViewController__deviceInformationView];
}

- (uint64_t)viewDidAppear:
{
  uint64_t v0 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  v25 = (char *)&v21 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = type metadata accessor for DispatchQoS();
  uint64_t v26 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  v24 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for DispatchTime();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = __chkstk_darwin(v5);
  v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  v11 = (char *)&v21 - v10;
  id v12 = [self standardUserDefaults];
  NSString v13 = String._bridgeToObjectiveC()();
  unsigned __int8 v14 = [v12 BOOLForKey:v13];

  if ((v14 & 1) != 0
    || (unsigned int v15 = objc_msgSend(objc_msgSend(self, "currentPlatform"), "isInBoxUpdateModeActive"), result = swift_unknownObjectRelease(), v15))
  {
    sub_10003C374(0, (unint64_t *)&qword_100182E40);
    v17 = (void *)static OS_dispatch_queue.main.getter();
    static DispatchTime.now()();
    + infix(_:_:)();
    uint64_t v21 = v3;
    uint64_t v22 = v5;
    v23 = *(void (**)(char *, uint64_t))(v6 + 8);
    v23(v9, v5);
    aBlock[4] = sub_100099F28;
    aBlock[5] = 0;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1000358AC;
    aBlock[3] = &unk_1001514A8;
    v18 = _Block_copy(aBlock);
    v19 = v24;
    static DispatchQoS.unspecified.getter();
    aBlock[0] = _swiftEmptyArrayStorage;
    sub_10003AF78();
    sub_10003AFD0((uint64_t *)&unk_100182E50);
    sub_10003B014();
    v20 = v25;
    dispatch thunk of SetAlgebra.init<A>(_:)();
    OS_dispatch_queue.asyncAfter(deadline:qos:flags:execute:)();
    _Block_release(v18);

    (*(void (**)(char *, uint64_t))(v1 + 8))(v20, v0);
    (*(void (**)(char *, uint64_t))(v26 + 8))(v19, v21);
    return ((uint64_t (*)(char *, uint64_t))v23)(v11, v22);
  }
  return result;
}

@end