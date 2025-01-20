@interface ShockwaveEffectViewController
+ (BOOL)_isSecureForRemoteViewService;
- (BOOL)_canShowWhileLocked;
- (_TtC9AirDropUI29ShockwaveEffectViewController)init;
- (_TtC9AirDropUI29ShockwaveEffectViewController)initWithCoder:(id)a3;
- (_TtC9AirDropUI29ShockwaveEffectViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (int64_t)preferredInterfaceOrientationForPresentation;
- (unint64_t)supportedInterfaceOrientations;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
@end

@implementation ShockwaveEffectViewController

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (int64_t)preferredInterfaceOrientationForPresentation
{
  return 1;
}

- (_TtC9AirDropUI29ShockwaveEffectViewController)init
{
  sub_1000509C4();
  return result;
}

- (_TtC9AirDropUI29ShockwaveEffectViewController)initWithCoder:(id)a3
{
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC9AirDropUI29ShockwaveEffectViewController_hasSetInitialState) = 0;
  v5 = (char *)self + OBJC_IVAR____TtC9AirDropUI29ShockwaveEffectViewController_effectState;
  uint64_t v6 = type metadata accessor for SFShockwaveEffectState();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  v7 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC9AirDropUI29ShockwaveEffectViewController_assetState);
  void *v7 = 0;
  v7[1] = 0;
  id v8 = a3;

  result = (_TtC9AirDropUI29ShockwaveEffectViewController *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)viewDidAppear:(BOOL)a3
{
  if ((*((unsigned char *)&self->super.super.super.isa
        + OBJC_IVAR____TtC9AirDropUI29ShockwaveEffectViewController_hasSetInitialState) & 1) == 0)
  {
    *((unsigned char *)&self->super.super.super.isa
    + OBJC_IVAR____TtC9AirDropUI29ShockwaveEffectViewController_hasSetInitialState) = 1;
    v3 = self;
    sub_10005114C(1);
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  uint64_t v3 = qword_10017F7A8;
  id v8 = self;
  if (v3 != -1) {
    swift_once();
  }
  uint64_t v4 = type metadata accessor for Logger();
  sub_10000B150(v4, (uint64_t)qword_10018D128);
  v5 = Logger.logObject.getter();
  os_log_type_t v6 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "Cleaning up haptics after ShockwaveEffectViewController disappeared", v7, 2u);
    swift_slowDealloc();
  }

  if (qword_10017F7D8 != -1) {
    swift_once();
  }
  sub_10010AAB8();
}

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_TtC9AirDropUI29ShockwaveEffectViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC9AirDropUI29ShockwaveEffectViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9AirDropUI29ShockwaveEffectViewController_effectAssetView));
  sub_10000F394((uint64_t)self + OBJC_IVAR____TtC9AirDropUI29ShockwaveEffectViewController_effectState, &qword_100181760);

  swift_bridgeObjectRelease();
}

@end