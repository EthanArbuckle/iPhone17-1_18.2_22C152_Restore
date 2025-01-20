@interface ProjectionHighlightTileViewController
- (NSString)title;
- (_TtC24MenstrualCyclesAppPlugin37ProjectionHighlightTileViewController)initWithCoder:(id)a3;
- (_TtC24MenstrualCyclesAppPlugin37ProjectionHighlightTileViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)dealloc;
- (void)todayDidChange;
- (void)viewDidLoad;
@end

@implementation ProjectionHighlightTileViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_2412B7A28();
}

- (void)dealloc
{
  v3 = self;
  v4 = self;
  id v5 = objc_msgSend(v3, sel_defaultCenter);
  objc_msgSend(v5, sel_removeObserver_, v4);

  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for ProjectionHighlightTileViewController();
  [(ProjectionHighlightTileViewController *)&v6 dealloc];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin37ProjectionHighlightTileViewController_containerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin37ProjectionHighlightTileViewController_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin37ProjectionHighlightTileViewController_separatorView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin37ProjectionHighlightTileViewController_footer));
  sub_2412BBA24((uint64_t)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin37ProjectionHighlightTileViewController_context, (uint64_t)&qword_26B011D10, (uint64_t)&qword_26B011D08, MEMORY[0x263F444A0], (uint64_t (*)(void))sub_2411BF934);
}

- (void)todayDidChange
{
  v2 = self;
  sub_2412B9CC8();
}

- (_TtC24MenstrualCyclesAppPlugin37ProjectionHighlightTileViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = _sSo25HKMCDisplayTypeIdentifiera24MenstrualCyclesAppPluginE2idSSvg_0();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC24MenstrualCyclesAppPlugin37ProjectionHighlightTileViewController *)sub_2412BA4C4(v5, v7, a4);
}

- (_TtC24MenstrualCyclesAppPlugin37ProjectionHighlightTileViewController)initWithCoder:(id)a3
{
  return (_TtC24MenstrualCyclesAppPlugin37ProjectionHighlightTileViewController *)sub_2412BA648(a3);
}

- (NSString)title
{
  v2 = (char *)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin37ProjectionHighlightTileViewController_viewModel;
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin37ProjectionHighlightTileViewController_viewModel);
  if (v3)
  {
    uint64_t v6 = *((void *)v2 + 1);
    uint64_t v5 = (void *)*((void *)v2 + 2);
    sub_2412BBABC(*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC24MenstrualCyclesAppPlugin37ProjectionHighlightTileViewController_viewModel), v6, v5);
    sub_2412BBABC(v3, v6, v5);
    uint64_t v7 = self;

    sub_2412EC900(v3, v6 & 1);
    v3 = (void *)sub_241631CC8();
    swift_bridgeObjectRelease();
  }

  return (NSString *)v3;
}

@end