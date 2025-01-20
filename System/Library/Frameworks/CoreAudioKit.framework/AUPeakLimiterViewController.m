@interface AUPeakLimiterViewController
- (_TtC12CoreAudioKit27AUPeakLimiterViewController)init;
- (_TtC12CoreAudioKit27AUPeakLimiterViewController)initWithCoder:(id)a3;
- (void)knobReleasedWithNotification:(id)a3;
- (void)knobTouchedWithNotification:(id)a3;
- (void)knobValueChangedWithNotification:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation AUPeakLimiterViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_21E57D6D8();
}

- (void)viewWillAppear:(BOOL)a3
{
  v3 = self;
  sub_21E580E3C();
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = self;
  v6 = self;
  id v7 = objc_msgSend(v5, sel_defaultCenter);
  objc_msgSend(v7, sel_removeObserver_, v6);

  v8.receiver = v6;
  v8.super_class = (Class)type metadata accessor for AUPeakLimiterViewController();
  [(AUAppleViewControllerBase *)&v8 viewWillDisappear:v3];
}

- (void)knobValueChangedWithNotification:(id)a3
{
}

- (void)knobTouchedWithNotification:(id)a3
{
}

- (void)knobReleasedWithNotification:(id)a3
{
  uint64_t v4 = sub_21E5B6398();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4, v6);
  objc_super v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21E5B6378();
  v9 = self;
  sub_21E57FE00();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  sub_21E580238();
}

- (_TtC12CoreAudioKit27AUPeakLimiterViewController)init
{
  return (_TtC12CoreAudioKit27AUPeakLimiterViewController *)sub_21E580768();
}

- (_TtC12CoreAudioKit27AUPeakLimiterViewController)initWithCoder:(id)a3
{
  return (_TtC12CoreAudioKit27AUPeakLimiterViewController *)sub_21E5808F4(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit27AUPeakLimiterViewController____lazy_storage___headerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit27AUPeakLimiterViewController____lazy_storage___graphView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit27AUPeakLimiterViewController____lazy_storage___controlsView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit27AUPeakLimiterViewController_viewContainer));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit27AUPeakLimiterViewController____lazy_storage___attackKnob));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit27AUPeakLimiterViewController____lazy_storage___releaseKnob));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit27AUPeakLimiterViewController____lazy_storage___gainKnob));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit27AUPeakLimiterViewController____lazy_storage___wholeNumberFormatter));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit27AUPeakLimiterViewController_v3AU));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit27AUPeakLimiterViewController_compressionAmountParam));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit27AUPeakLimiterViewController_attackSpacer));
  BOOL v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC12CoreAudioKit27AUPeakLimiterViewController_gainSpacer);
}

@end