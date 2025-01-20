@interface BrowseTileViewController
- (_TtC18HealthExperienceUI24BrowseTileViewController)initWithCoder:(id)a3;
- (_TtC18HealthExperienceUI24BrowseTileViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation BrowseTileViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_1AD46B94C();
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for BrowseTileViewController();
  id v2 = v3.receiver;
  [(BrowseTileViewController *)&v3 viewDidLayoutSubviews];
  sub_1AD46BD14();
}

- (_TtC18HealthExperienceUI24BrowseTileViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = _sSo19HKFeatureIdentifiera18HealthExperienceUIE2idSSvg_0();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC18HealthExperienceUI24BrowseTileViewController *)BrowseTileViewController.init(nibName:bundle:)(v5, v7, a4);
}

- (_TtC18HealthExperienceUI24BrowseTileViewController)initWithCoder:(id)a3
{
  return (_TtC18HealthExperienceUI24BrowseTileViewController *)BrowseTileViewController.init(coder:)(a3);
}

- (void).cxx_destruct
{
  sub_1AD46EFA8((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI24BrowseTileViewController_context, (unint64_t *)&qword_1EB73F2E0, (uint64_t)&qword_1EB73F2D0, (uint64_t)&protocol descriptor for FeedItemViewControllerContext);
  sub_1AD1B52E0((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI24BrowseTileViewController_sectionContext);
  sub_1AD46ED6C(*(void **)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC18HealthExperienceUI24BrowseTileViewController_currentStyle), *(void **)((char *)&self->super.super._responderFlags+ OBJC_IVAR____TtC18HealthExperienceUI24BrowseTileViewController_currentStyle), (int)*(FBSSceneIdentityToken **)((char *)&self->super.super.__layeringSceneIdentity+ OBJC_IVAR____TtC18HealthExperienceUI24BrowseTileViewController_currentStyle), *(void **)((char *)&self->super._overrideTransitioningDelegate+ OBJC_IVAR____TtC18HealthExperienceUI24BrowseTileViewController_currentStyle), *(void **)((char *)&self->super._view + OBJC_IVAR____TtC18HealthExperienceUI24BrowseTileViewController_currentStyle), *(void **)((char *)&self->super._tabBarItem+ OBJC_IVAR____TtC18HealthExperienceUI24BrowseTileViewController_currentStyle), *(unint64_t *)((char *)&self->super._tab+ OBJC_IVAR____TtC18HealthExperienceUI24BrowseTileViewController_currentStyle), *(unint64_t *)((char *)&self->super._tabElement+ OBJC_IVAR____TtC18HealthExperienceUI24BrowseTileViewController_currentStyle), *(void **)((char *)&self->super._navigationItem+ OBJC_IVAR____TtC18HealthExperienceUI24BrowseTileViewController_currentStyle), *(uint64_t *)((char *)&self->super._toolbarItems+ OBJC_IVAR____TtC18HealthExperienceUI24BrowseTileViewController_currentStyle),
    *(uint64_t *)((char *)&self->super._title
               + OBJC_IVAR____TtC18HealthExperienceUI24BrowseTileViewController_currentStyle));
  sub_1AD46EFA8((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI24BrowseTileViewController_contentProvider, &qword_1EB73F0C8, (uint64_t)&unk_1EB73F0C0, (uint64_t)&protocol descriptor for BrowseTileContentProvider);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI24BrowseTileViewController_heightConstraint));
  objc_super v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC18HealthExperienceUI24BrowseTileViewController_contentView);
}

@end