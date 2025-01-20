@interface TipsManager
+ (_TtC17TVRemoteUIService11TipsManager)shared;
- (BOOL)isPresentingTip;
- (TVRUITipSourceViewProvider)presentingViewController;
- (UIViewController)tipsViewController;
- (_TtC17TVRemoteUIService11TipsManager)init;
- (void)dealloc;
- (void)hideTipWithAnimated:(BOOL)a3 completion:(id)a4;
- (void)invalidate;
- (void)presentTip;
- (void)setPresentingViewController:(id)a3;
- (void)setTipsViewController:(id)a3;
- (void)showTip;
- (void)updatePresentingViewController:(id)a3;
@end

@implementation TipsManager

- (TVRUITipSourceViewProvider)presentingViewController
{
  return (TVRUITipSourceViewProvider *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                               + OBJC_IVAR____TtC17TVRemoteUIService11TipsManager_presentingViewController));
}

- (void)setPresentingViewController:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC17TVRemoteUIService11TipsManager_presentingViewController);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC17TVRemoteUIService11TipsManager_presentingViewController) = (Class)a3;
  id v3 = a3;
}

- (UIViewController)tipsViewController
{
  return (UIViewController *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                     + OBJC_IVAR____TtC17TVRemoteUIService11TipsManager_tipsViewController));
}

- (void)setTipsViewController:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC17TVRemoteUIService11TipsManager_tipsViewController);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC17TVRemoteUIService11TipsManager_tipsViewController) = (Class)a3;
  id v3 = a3;
}

- (BOOL)isPresentingTip
{
  return *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC17TVRemoteUIService11TipsManager_tipsViewController) != 0;
}

+ (_TtC17TVRemoteUIService11TipsManager)shared
{
  if (one-time initialization token for shared != -1) {
    swift_once();
  }
  v2 = (void *)static TipsManager.shared;

  return (_TtC17TVRemoteUIService11TipsManager *)v2;
}

- (void)invalidate
{
  v2 = self;
  TipsManager.invalidate()();
}

- (void)presentTip
{
  uint64_t v2 = one-time initialization token for log;
  v7 = self;
  if (v2 != -1) {
    swift_once();
  }
  uint64_t v3 = type metadata accessor for Logger();
  __swift_project_value_buffer(v3, (uint64_t)log);
  id v4 = Logger.logObject.getter();
  os_log_type_t v5 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "Present find my tip", v6, 2u);
    swift_slowDealloc();
  }

  TipsManager.setupTipsObserver()();
}

- (void)showTip
{
  uint64_t v2 = self;
  TipsManager.showTip()();
}

- (void)hideTipWithAnimated:(BOOL)a3 completion:(id)a4
{
  v6 = (void (*)(void))_Block_copy(a4);
  if (v6)
  {
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = v6;
    v6 = (void (*)(void))partial apply for thunk for @escaping @callee_unowned @convention(block) () -> ();
  }
  else
  {
    uint64_t v7 = 0;
  }
  v8 = self;
  TipsManager.hideTip(animated:completion:)(a3, v6, v7);
  outlined consume of (@escaping @callee_guaranteed () -> ())?((uint64_t)v6);
}

- (void)updatePresentingViewController:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC17TVRemoteUIService11TipsManager_presentingViewController);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC17TVRemoteUIService11TipsManager_presentingViewController) = (Class)a3;
  id v3 = a3;
}

- (void)dealloc
{
  uint64_t v3 = OBJC_IVAR____TtC17TVRemoteUIService11TipsManager_tipObservation;
  if (*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC17TVRemoteUIService11TipsManager_tipObservation))
  {
    id v4 = self;
    swift_retain();
    Task.cancel()();
    swift_release();
  }
  else
  {
    os_log_type_t v5 = self;
  }
  *(Class *)((char *)&self->super.isa + v3) = 0;
  swift_release();
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for TipsManager();
  [(TipsManager *)&v6 dealloc];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC17TVRemoteUIService11TipsManager_presentingViewController));

  swift_release();
  uint64_t v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC17TVRemoteUIService11TipsManager____lazy_storage___popoverPresentationConductor);
}

- (_TtC17TVRemoteUIService11TipsManager)init
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC17TVRemoteUIService11TipsManager_presentingViewController) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC17TVRemoteUIService11TipsManager_tipsViewController) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC17TVRemoteUIService11TipsManager_tipObservation) = 0;
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC17TVRemoteUIService11TipsManager_tip) = 0;
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC17TVRemoteUIService11TipsManager____lazy_storage___popoverPresentationConductor) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for TipsManager();
  return [(TipsManager *)&v3 init];
}

@end