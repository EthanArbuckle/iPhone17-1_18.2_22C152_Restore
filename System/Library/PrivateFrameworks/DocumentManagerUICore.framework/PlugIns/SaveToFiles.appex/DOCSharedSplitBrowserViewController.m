@interface DOCSharedSplitBrowserViewController
- (DOCTabbedBrowserViewController)tabbedBrowser;
- (NSArray)preferredFocusEnvironments;
- (NSString)description;
- (_TtC11SaveToFiles35DOCSharedSplitBrowserViewController)init;
- (void)_workaround_122589472_fixupDescendantSafeAreas;
- (void)_workaround_122589743_fixupDescendantSearchMargins;
- (void)setTabbedBrowser:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation DOCSharedSplitBrowserViewController

- (DOCTabbedBrowserViewController)tabbedBrowser
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();
  return (DOCTabbedBrowserViewController *)Strong;
}

- (void)setTabbedBrowser:(id)a3
{
}

- (NSArray)preferredFocusEnvironments
{
  v2 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC11SaveToFiles35DOCSharedSplitBrowserViewController_sharedSplitBrowser);
  v3 = self;
  id v4 = [v2 preferredFocusEnvironments];
  sub_100026870(&qword_10062F1D0);
  sub_1004D1510();

  v5.super.isa = sub_1004D14F0().super.isa;
  swift_bridgeObjectRelease();
  return (NSArray *)v5.super.isa;
}

- (void)viewWillAppear:(BOOL)a3
{
  id v4 = self;
  sub_10047002C(a3);
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for DOCSharedSplitBrowserViewController();
  swift_unknownObjectRetain();
  id v7 = v12.receiver;
  -[DOCSharedSplitBrowserViewController viewWillTransitionToSize:withTransitionCoordinator:](&v12, "viewWillTransitionToSize:withTransitionCoordinator:", a4, width, height);
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v7;
  v11[4] = sub_100470B3C;
  v11[5] = v8;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 1107296256;
  v11[2] = sub_1002923F0;
  v11[3] = &unk_1005DC9A0;
  v9 = _Block_copy(v11);
  id v10 = v7;
  swift_release();
  [a4 animateAlongsideTransition:v9 completion:0];
  _Block_release(v9);
  swift_unknownObjectRelease();
}

- (void)_workaround_122589472_fixupDescendantSafeAreas
{
  uint64_t v2 = qword_10062ACD0;
  v3 = self;
  if (v2 != -1)
  {
    NSArray v5 = v3;
    swift_once();
    v3 = v5;
  }
  if ((byte_10063F480 & 1) == 0)
  {
    id v4 = v3;
    [(DOCSharedSplitBrowserViewController *)v3 _doc_ipi_updateContentOverlayInsetsForSelfAndChildren];
    v3 = v4;
  }
}

- (void)_workaround_122589743_fixupDescendantSearchMargins
{
  uint64_t v2 = self;
  sub_1004704AC();
}

- (NSString)description
{
  uint64_t v2 = self;
  sub_1004706AC();

  NSString v3 = sub_1004D1200();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (_TtC11SaveToFiles35DOCSharedSplitBrowserViewController)init
{
  result = (_TtC11SaveToFiles35DOCSharedSplitBrowserViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11SaveToFiles35DOCSharedSplitBrowserViewController_tabItem));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11SaveToFiles35DOCSharedSplitBrowserViewController_sharedSplitBrowser));
  swift_bridgeObjectRelease();
  sub_10044E8BC((uint64_t)self + OBJC_IVAR____TtC11SaveToFiles35DOCSharedSplitBrowserViewController_lastEnsureAppearedRequestID);
  swift_unknownObjectWeakDestroy();
}

@end