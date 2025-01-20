@interface ScrubberView
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC11AssetViewer12ScrubberView)initWithCoder:(id)a3;
- (_TtC11AssetViewer12ScrubberView)initWithFrame:(CGRect)a3;
- (void)dealloc;
- (void)didScrub:(id)a3;
- (void)handlePlayPauseButton:(id)a3;
- (void)handleSkipBackButton:(id)a3;
- (void)handleSkipForwardButton:(id)a3;
- (void)layoutSubviews;
- (void)startScrubbing:(id)a3;
- (void)stopScrubbing:(id)a3;
- (void)updateTimeLabelFonts;
@end

@implementation ScrubberView

- (_TtC11AssetViewer12ScrubberView)initWithFrame:(CGRect)a3
{
  return (_TtC11AssetViewer12ScrubberView *)sub_1E28B0248(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)dealloc
{
  v2 = self;
  sub_1E28B0718();
}

- (void).cxx_destruct
{
  sub_1E2874254((uint64_t)self + OBJC_IVAR____TtC11AssetViewer12ScrubberView_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11AssetViewer12ScrubberView____lazy_storage___playPauseButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11AssetViewer12ScrubberView____lazy_storage___skipBackButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11AssetViewer12ScrubberView____lazy_storage___skipForwardButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11AssetViewer12ScrubberView____lazy_storage___slider));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11AssetViewer12ScrubberView____lazy_storage___elapsedTimeLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11AssetViewer12ScrubberView____lazy_storage___remainingTimeLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11AssetViewer12ScrubberView____lazy_storage___elapsedTimeFormatter));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11AssetViewer12ScrubberView____lazy_storage___remainingTimeFormatter));
  v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC11AssetViewer12ScrubberView_link);
}

- (_TtC11AssetViewer12ScrubberView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1E28B4D20();
}

- (void)layoutSubviews
{
  v16.receiver = self;
  v16.super_class = (Class)type metadata accessor for ScrubberView();
  v2 = (char *)v16.receiver;
  [(ScrubberView *)&v16 layoutSubviews];
  objc_msgSend(v2, sel_bounds, v16.receiver, v16.super_class);
  id v3 = &v2[OBJC_IVAR____TtC11AssetViewer12ScrubberView_lastLayoutBounds];
  double v4 = *(double *)&v2[OBJC_IVAR____TtC11AssetViewer12ScrubberView_lastLayoutBounds];
  double v5 = *(double *)&v2[OBJC_IVAR____TtC11AssetViewer12ScrubberView_lastLayoutBounds + 8];
  double v6 = *(double *)&v2[OBJC_IVAR____TtC11AssetViewer12ScrubberView_lastLayoutBounds + 16];
  double v7 = *(double *)&v2[OBJC_IVAR____TtC11AssetViewer12ScrubberView_lastLayoutBounds + 24];
  *(void *)id v3 = v8;
  *((void *)v3 + 1) = v9;
  *((void *)v3 + 2) = v10;
  *((void *)v3 + 3) = v11;
  objc_msgSend(v2, sel_bounds);
  sub_1E28B1A58(v12, v13, v14, v15, v4, v5, v6, v7);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  if (a3.width <= 414.0)
  {
    uint64_t v8 = qword_1EADCA478;
    uint64_t v9 = self;
    if (v8 != -1) {
      swift_once();
    }
    double v7 = &qword_1EADD3B20;
  }
  else
  {
    uint64_t v5 = qword_1EADCA480;
    double v6 = self;
    if (v5 != -1) {
      swift_once();
    }
    double v7 = &qword_1EADD3B28;
  }
  double v10 = *(double *)v7;

  double v11 = width;
  double v12 = v10;
  result.height = v12;
  result.CGFloat width = v11;
  return result;
}

- (void)handlePlayPauseButton:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1E28B4E84();
}

- (void)handleSkipBackButton:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1E28B4EFC();
}

- (void)handleSkipForwardButton:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1E28B505C();
}

- (void)updateTimeLabelFonts
{
  v2 = self;
  sub_1E28B2F08();
}

- (void)startScrubbing:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1E28B51B8();
}

- (void)didScrub:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1E28B310C(v4);
}

- (void)stopScrubbing:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1E28B52D0();
}

@end