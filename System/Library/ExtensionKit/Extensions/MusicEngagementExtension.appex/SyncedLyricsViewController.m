@interface SyncedLyricsViewController
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (_TtC11MusicCoreUI26SyncedLyricsViewController)initWithCoder:(id)a3;
- (_TtC11MusicCoreUI26SyncedLyricsViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)bottomTapHandler;
- (void)displayLinkFired:(id)a3;
- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
- (void)shareGestureHandler:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewLayoutMarginsDidChange;
@end

@implementation SyncedLyricsViewController

- (void)viewDidLoad
{
  v2 = self;
  SyncedLyricsViewController.viewDidLoad()();
}

- (void)bottomTapHandler
{
  v3 = (char *)self + OBJC_IVAR____TtC11MusicCoreUI26SyncedLyricsViewController_delegate;
  swift_beginAccess();
  if (swift_unknownObjectWeakLoadStrong())
  {
    uint64_t v4 = *((void *)v3 + 1);
    swift_getObjectType();
    v5 = *(void (**)(void))(v4 + 40);
    v6 = self;
    v5();

    swift_unknownObjectRelease();
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  uint64_t v4 = self;
  SyncedLyricsViewController.viewDidAppear(_:)(a3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for SyncedLyricsViewController();
  uint64_t v4 = (char *)v7.receiver;
  [(SyncedLyricsViewController *)&v7 viewDidDisappear:v3];
  uint64_t v5 = OBJC_IVAR____TtC11MusicCoreUI26SyncedLyricsViewController_displayLink;
  objc_msgSend(*(id *)&v4[OBJC_IVAR____TtC11MusicCoreUI26SyncedLyricsViewController_displayLink], "invalidate", v7.receiver, v7.super_class);
  v6 = *(void **)&v4[v5];
  *(void *)&v4[v5] = 0;
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  SyncedLyricsViewController.viewDidLayoutSubviews()();
}

- (void)viewLayoutMarginsDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SyncedLyricsViewController();
  id v2 = v3.receiver;
  [(SyncedLyricsViewController *)&v3 viewLayoutMarginsDidChange];
  SyncedLyricsViewController.layoutLines()();
}

- (void)displayLinkFired:(id)a3
{
  id v5 = a3;
  uint64_t v4 = self;
  specialized SyncedLyricsViewController.displayLinkFired(_:)();
}

- (void)shareGestureHandler:(id)a3
{
  uint64_t v4 = (_TtC11MusicCoreUI26SyncedLyricsViewController *)a3;
  id v5 = self;
  if ([(SyncedLyricsViewController *)v4 state] == (id)1
    && (v6 = (_TtC11MusicCoreUI26SyncedLyricsViewController *)[(SyncedLyricsViewController *)v4 view]) != 0)
  {
    v8 = v6;
    type metadata accessor for SyncedLyricsLineView();
    objc_super v7 = (char *)swift_dynamicCastClass();
    if (v7) {
      SyncedLyricsViewController.startSharing(from:)(v7);
    }

    uint64_t v4 = v5;
  }
  else
  {
    v8 = v5;
  }
}

- (_TtC11MusicCoreUI26SyncedLyricsViewController)initWithNibName:(id)a3 bundle:(id)a4
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
  return (_TtC11MusicCoreUI26SyncedLyricsViewController *)SyncedLyricsViewController.init(nibName:bundle:)(v5, v7, a4);
}

- (_TtC11MusicCoreUI26SyncedLyricsViewController)initWithCoder:(id)a3
{
  return (_TtC11MusicCoreUI26SyncedLyricsViewController *)SyncedLyricsViewController.init(coder:)(a3);
}

- (void).cxx_destruct
{
  memcpy(v3, (char *)self + OBJC_IVAR____TtC11MusicCoreUI26SyncedLyricsViewController_specs, 0x219uLL);
  outlined release of SyncedLyricsViewController.Specs((uint64_t)v3);
  outlined destroy of CloudLibrary.StatusObserver.InternalObserver((uint64_t)self + OBJC_IVAR____TtC11MusicCoreUI26SyncedLyricsViewController_delegate);
  swift_release();
  outlined destroy of TaskPriority?((uint64_t)self + OBJC_IVAR____TtC11MusicCoreUI26SyncedLyricsViewController_timingProvider, &demangling cache variable for type metadata for SyncedLyricsTimingProvider?);
  outlined consume of (@escaping @callee_guaranteed () -> ())?(*(uint64_t *)((char *)&self->super.super.super.isa
                                                                          + OBJC_IVAR____TtC11MusicCoreUI26SyncedLyricsViewController_shareHandler));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11MusicCoreUI26SyncedLyricsViewController_scrollView));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11MusicCoreUI26SyncedLyricsViewController_displayLink));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11MusicCoreUI26SyncedLyricsViewController_instrumentalBreakVisibleView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11MusicCoreUI26SyncedLyricsViewController_tapFeedbackGenerator));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11MusicCoreUI26SyncedLyricsViewController_allowAnimateToNextLineAfterScrollTimer));
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  unsigned __int8 v9 = specialized SyncedLyricsViewController.gestureRecognizer(_:shouldReceive:)(v7);

  return v9 & 1;
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  SyncedLyricsViewController.removeAllBlurs()();
  SyncedLyricsViewController.cancelAnimations()();
  *((unsigned char *)&v5->super.super.super.isa
  + OBJC_IVAR____TtC11MusicCoreUI26SyncedLyricsViewController_allowAnimateToNextLineAfterScroll) = 0;
  uint64_t v6 = OBJC_IVAR____TtC11MusicCoreUI26SyncedLyricsViewController_allowAnimateToNextLineAfterScrollTimer;
  [*(id *)((char *)&v5->super.super.super.isa+ OBJC_IVAR____TtC11MusicCoreUI26SyncedLyricsViewController_allowAnimateToNextLineAfterScrollTimer) invalidate];
  id v7 = *(Class *)((char *)&v5->super.super.super.isa + v6);
  *(Class *)((char *)&v5->super.super.super.isa + v6) = 0;
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  id v5 = a3;
  uint64_t v6 = self;
  specialized SyncedLyricsViewController.scrollViewDidEndDragging(_:willDecelerate:)();
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double y = a4.y;
  double x = a4.x;
  id v8 = a3;
  unsigned __int8 v9 = self;
  specialized SyncedLyricsViewController.scrollViewWillEndDragging(_:withVelocity:targetContentOffset:)(x, y);
}

@end