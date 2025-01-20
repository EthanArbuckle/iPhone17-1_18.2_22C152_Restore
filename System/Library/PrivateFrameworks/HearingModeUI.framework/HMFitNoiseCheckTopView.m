@interface HMFitNoiseCheckTopView
+ (int64_t)budStatusWithLeftBudGood:(BOOL)a3 rightBudGood:(BOOL)a4;
- (_TtC13HearingModeUI22HMFitNoiseCheckTopView)initWithCoder:(id)a3;
- (_TtC13HearingModeUI22HMFitNoiseCheckTopView)initWithFrame:(CGRect)a3;
- (_TtC13HearingModeUI22HMFitNoiseCheckTopView)initWithService:(id)a3;
- (void)testRun;
- (void)transitionToCheckReady;
- (void)transitionToFitCheck;
- (void)transitionToFitCheckResultWithBudState:(int64_t)a3 actionStringBlock:(id)a4;
- (void)transitionToFitNudging;
- (void)transitionToNoiseNudging;
- (void)transitionToNoiseNudgingPassed;
@end

@implementation HMFitNoiseCheckTopView

+ (int64_t)budStatusWithLeftBudGood:(BOOL)a3 rightBudGood:(BOOL)a4
{
  int64_t v4 = 4;
  if (!a4) {
    int64_t v4 = 1;
  }
  int64_t v5 = 5;
  if (a4) {
    int64_t v5 = 2;
  }
  if (a3) {
    return v4;
  }
  else {
    return v5;
  }
}

- (_TtC13HearingModeUI22HMFitNoiseCheckTopView)initWithService:(id)a3
{
  return (_TtC13HearingModeUI22HMFitNoiseCheckTopView *)HMFitNoiseCheckTopView.init(service:)(a3);
}

- (_TtC13HearingModeUI22HMFitNoiseCheckTopView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_2512C2C68();
}

- (void)transitionToCheckReady
{
  v2 = self;
  sub_2512C0B20();
}

- (void)transitionToFitCheck
{
  v2 = self;
  sub_2512C0C7C();
}

- (void)transitionToFitCheckResultWithBudState:(int64_t)a3 actionStringBlock:(id)a4
{
  v6 = (void (**)(void *, void *))_Block_copy(a4);
  v8 = self;
  sub_2512C4008();
  sub_2512BFB18(a3, 1, 0);
  sub_2512BDE04(a3);
  v7 = (void *)sub_2512C47C8();
  v6[2](v6, v7);
  swift_bridgeObjectRelease();

  _Block_release(v6);
}

- (void)transitionToFitNudging
{
  v2 = self;
  sub_2512C1054();
}

- (void)transitionToNoiseNudging
{
  v2 = self;
  sub_2512C11D4();
}

- (void)transitionToNoiseNudgingPassed
{
  int64_t v5 = self;
  sub_2512C4008();
  v2 = (void *)MEMORY[0x263F8EED0];
  id v3 = (void *)(*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & (uint64_t)v5->super.super.super.isa) + 0x90))();
  objc_msgSend(v3, sel_setHidden_, 0);

  int64_t v4 = (void *)(*(uint64_t (**)(void))((*v2 & (uint64_t)v5->super.super.super.isa) + 0x78))();
  objc_msgSend(v4, sel_setHidden_, 1);

  objc_msgSend(*(id *)((char *)&v5->super.super.super.isa + OBJC_IVAR____TtC13HearingModeUI22HMFitNoiseCheckTopView_topFitCheckView), sel_setHidden_, 1);
}

- (void)testRun
{
  v2 = self;
  sub_2512C1530();
}

- (_TtC13HearingModeUI22HMFitNoiseCheckTopView)initWithFrame:(CGRect)a3
{
  result = (_TtC13HearingModeUI22HMFitNoiseCheckTopView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13HearingModeUI22HMFitNoiseCheckTopView_topFitCheckView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13HearingModeUI22HMFitNoiseCheckTopView____lazy_storage___topFitNudgingView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13HearingModeUI22HMFitNoiseCheckTopView____lazy_storage___topNoiseNudgingView));
  swift_release();
  swift_release();
}

@end