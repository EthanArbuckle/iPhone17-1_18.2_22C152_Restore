@interface ArcadeDownloadPackViewController
- (BOOL)includePaddingAboveContentView;
- (UIView)contentView;
- (_TtC18ASMessagesProvider32ArcadeDownloadPackViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6;
- (_TtC18ASMessagesProvider32ArcadeDownloadPackViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6;
- (double)_headerTopOffset;
- (void)appEnteredWhileAppeared;
- (void)appExitedWhileAppeared;
- (void)scrollViewDidScroll:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation ArcadeDownloadPackViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_734E0();
}

- (void)viewWillAppear:(BOOL)a3
{
}

- (void)viewDidAppear:(BOOL)a3
{
  v4 = self;
  sub_736B8(a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4 = self;
  sub_73934(a3);
}

- (void)viewDidDisappear:(BOOL)a3
{
}

- (void)appEnteredWhileAppeared
{
}

- (void)appExitedWhileAppeared
{
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  sub_73F48();
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  sub_74078();
}

- (UIView)contentView
{
  return (UIView *)*(id *)&self->OBWelcomeController_opaque[OBJC_IVAR____TtC18ASMessagesProvider32ArcadeDownloadPackViewController_pageView];
}

- (double)_headerTopOffset
{
  return 0.0;
}

- (BOOL)includePaddingAboveContentView
{
  return 0;
}

- (void)scrollViewDidScroll:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for ArcadeDownloadPackViewController();
  id v4 = a3;
  v5 = (char *)v11.receiver;
  [(ArcadeDownloadPackViewController *)&v11 scrollViewDidScroll:v4];
  uint64_t v6 = *(void *)&v5[OBJC_IVAR____TtC18ASMessagesProvider32ArcadeDownloadPackViewController_pageView + 8];
  uint64_t v7 = sub_76F1D0();
  id v8 = objc_msgSend(v5, "view", v11.receiver, v11.super_class);
  if (v8)
  {
    v9 = v8;
    uint64_t ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t, void *, uint64_t, uint64_t))(v6 + 8))(v7, v9, ObjectType, v6);

    swift_release();
  }
  else
  {
    __break(1u);
  }
}

- (_TtC18ASMessagesProvider32ArcadeDownloadPackViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  result = (_TtC18ASMessagesProvider32ArcadeDownloadPackViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC18ASMessagesProvider32ArcadeDownloadPackViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6 = a5;
  result = (_TtC18ASMessagesProvider32ArcadeDownloadPackViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  _s18ASMessagesProvider13VideoCardViewC7MetricsVwxx_0((uint64_t)&self->OBWelcomeController_opaque[OBJC_IVAR____TtC18ASMessagesProvider32ArcadeDownloadPackViewController_lifecycleObserver]);

  v3 = *(void **)&self->OBWelcomeController_opaque[OBJC_IVAR____TtC18ASMessagesProvider32ArcadeDownloadPackViewController_overlayViewController];
}

@end