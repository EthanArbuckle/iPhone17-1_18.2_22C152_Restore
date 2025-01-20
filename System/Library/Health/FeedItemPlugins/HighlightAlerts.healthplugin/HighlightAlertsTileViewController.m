@interface HighlightAlertsTileViewController
- (NSString)title;
- (_TtC15HighlightAlerts33HighlightAlertsTileViewController)initWithCoder:(id)a3;
- (_TtC15HighlightAlerts33HighlightAlertsTileViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)dealloc;
- (void)handleTap;
- (void)significantTimeChangeDidOccur;
- (void)updateViewConstraints;
- (void)viewDidLoad;
@end

@implementation HighlightAlertsTileViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_240C7AE58();
}

- (void)dealloc
{
  v3 = (objc_class *)type metadata accessor for HighlightAlertsTileViewController();
  v4 = self;
  sub_240C85FB0();
  v5.receiver = v4;
  v5.super_class = v3;
  [(HighlightAlertsTileViewController *)&v5 dealloc];
}

- (void).cxx_destruct
{
  sub_240C81DE0((uint64_t)self + OBJC_IVAR____TtC15HighlightAlerts33HighlightAlertsTileViewController_context, (uint64_t)&unk_26AFDFE10, (uint64_t)&unk_26AFDFE08, MEMORY[0x263F444A0], (uint64_t (*)(void))sub_240C81D14);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15HighlightAlerts33HighlightAlertsTileViewController____lazy_storage___typeImageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15HighlightAlerts33HighlightAlertsTileViewController____lazy_storage___bodyLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15HighlightAlerts33HighlightAlertsTileViewController____lazy_storage___descriptionLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15HighlightAlerts33HighlightAlertsTileViewController____lazy_storage___diagramImageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15HighlightAlerts33HighlightAlertsTileViewController_moreDetailsFont));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15HighlightAlerts33HighlightAlertsTileViewController_descriptionBottomSpacingConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15HighlightAlerts33HighlightAlertsTileViewController_descriptionToDiagramSpacingConstraint));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15HighlightAlerts33HighlightAlertsTileViewController_bodyLabelToDiagramSpacingConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15HighlightAlerts33HighlightAlertsTileViewController_bodyLabelToBottomSpacingConstraint));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_release();
}

- (void)updateViewConstraints
{
  v2 = self;
  sub_240C7CE18(0);
  v3.receiver = v2;
  v3.super_class = (Class)type metadata accessor for HighlightAlertsTileViewController();
  [(HighlightAlertsTileViewController *)&v3 updateViewConstraints];
}

- (void)significantTimeChangeDidOccur
{
  v2 = self;
  sub_240C7EAB0(0);
}

- (void)handleTap
{
  v2 = self;
  sub_240C7F5B4();
}

- (_TtC15HighlightAlerts33HighlightAlertsTileViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_240C862D0();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC15HighlightAlerts33HighlightAlertsTileViewController *)sub_240C80D08(v5, v7, a4);
}

- (_TtC15HighlightAlerts33HighlightAlertsTileViewController)initWithCoder:(id)a3
{
  return (_TtC15HighlightAlerts33HighlightAlertsTileViewController *)sub_240C80EC4(a3);
}

- (NSString)title
{
  if (*(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC15HighlightAlerts33HighlightAlertsTileViewController_viewModel))
  {
    v2 = self;
    swift_retain();
    sub_240C757EC();

    swift_release();
    objc_super v3 = (void *)sub_240C862A0();
    swift_bridgeObjectRelease();
  }
  else
  {
    objc_super v3 = 0;
  }

  return (NSString *)v3;
}

@end