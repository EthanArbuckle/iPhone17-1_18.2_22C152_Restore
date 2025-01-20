@interface TentativeEndTimerView
- (_TtC32DepthComplicationBundleCompanion21TentativeEndTimerView)init;
- (_TtC32DepthComplicationBundleCompanion21TentativeEndTimerView)initWithCoder:(id)a3;
- (_TtC32DepthComplicationBundleCompanion21TentativeEndTimerView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation TentativeEndTimerView

- (_TtC32DepthComplicationBundleCompanion21TentativeEndTimerView)init
{
  sub_15DD0();
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_16740();
}

- (_TtC32DepthComplicationBundleCompanion21TentativeEndTimerView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_187A8();
}

- (_TtC32DepthComplicationBundleCompanion21TentativeEndTimerView)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC32DepthComplicationBundleCompanion21TentativeEndTimerView_pauseSymbolAttachment));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC32DepthComplicationBundleCompanion21TentativeEndTimerView_timeValueLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC32DepthComplicationBundleCompanion21TentativeEndTimerView_divePausedLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC32DepthComplicationBundleCompanion21TentativeEndTimerView_diveToContinueLabel));
  id v3 = (char *)self + OBJC_IVAR____TtC32DepthComplicationBundleCompanion21TentativeEndTimerView_underwaterTime;
  uint64_t v4 = sub_36C38();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

@end