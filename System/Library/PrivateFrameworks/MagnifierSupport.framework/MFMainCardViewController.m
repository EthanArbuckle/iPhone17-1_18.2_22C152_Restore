@interface MFMainCardViewController
- (BOOL)_canShowWhileLocked;
- (_TtC16MagnifierSupport24MFMainCardViewController)initWithCoder:(id)a3;
- (_TtC16MagnifierSupport24MFMainCardViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)loadView;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4;
@end

@implementation MFMainCardViewController

- (_TtC16MagnifierSupport24MFMainCardViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_235929094();
}

- (void)loadView
{
  v2 = self;
  sub_235926648();
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for MFMainCardViewController();
  id v2 = v3.receiver;
  [(MFMainCardViewController *)&v3 viewDidLoad];
  sub_2359269B4();
  sub_235927224();
  sub_235927B28();
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_2359267F8(a3);
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for MFMainCardViewController();
  id v4 = v5.receiver;
  [(MFMainCardViewController *)&v5 viewDidAppear:v3];
  sub_2358EF6D8();
}

- (_TtC16MagnifierSupport24MFMainCardViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC16MagnifierSupport24MFMainCardViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport24MFMainCardViewController____lazy_storage___regularWidthConstraint));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport24MFMainCardViewController_containedCard));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport24MFMainCardViewController_cardContainer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport24MFMainCardViewController_cardController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport24MFMainCardViewController____lazy_storage___informationLabel));
  sub_23574D854(*(id *)((char *)&self->super.super.super.isa
                      + OBJC_IVAR____TtC16MagnifierSupport24MFMainCardViewController____lazy_storage___landscapeInformationLabel));
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport24MFMainCardViewController_topBoundaryConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport24MFMainCardViewController_leadingBoundaryConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport24MFMainCardViewController_trailingBoundaryConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport24MFMainCardViewController_bottomBoundaryConstraint));
  swift_release();
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  swift_unknownObjectRetain();
  v8 = self;
  sub_2359282F0(a4, width, height);
  swift_unknownObjectRelease();
}

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  id v6 = a3;
  swift_unknownObjectRetain();
  v7 = self;
  sub_235928714(v6, (uint64_t)a4);

  swift_unknownObjectRelease();
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for MFMainCardViewController();
  id v2 = v3.receiver;
  [(MFMainCardViewController *)&v3 viewDidLayoutSubviews];
  sub_235927DF4();
  sub_235928958();
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

@end