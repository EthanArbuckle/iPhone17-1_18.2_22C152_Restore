@interface EmergencyActionButtonsWaitingView
- (_TtC13InCallService33EmergencyActionButtonsWaitingView)initWithCoder:(id)a3;
- (_TtC13InCallService33EmergencyActionButtonsWaitingView)initWithFrame:(CGRect)a3;
- (_TtC13InCallService33EmergencyActionButtonsWaitingView)initWithType:(int64_t)a3;
- (void)cancelButtonTapped;
- (void)continueButtonTapped;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation EmergencyActionButtonsWaitingView

- (_TtC13InCallService33EmergencyActionButtonsWaitingView)initWithType:(int64_t)a3
{
  return (_TtC13InCallService33EmergencyActionButtonsWaitingView *)sub_1001A5D08(a3);
}

- (_TtC13InCallService33EmergencyActionButtonsWaitingView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1001A5DF8();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1001A6630((uint64_t)a3);
}

- (void)continueButtonTapped
{
  v2 = self;
  sub_1001A67E0();
}

- (void)cancelButtonTapped
{
  v2 = self;
  sub_1001A6C60();
}

- (_TtC13InCallService33EmergencyActionButtonsWaitingView)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13InCallService33EmergencyActionButtonsWaitingView____lazy_storage___continueButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13InCallService33EmergencyActionButtonsWaitingView____lazy_storage___spinnerButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13InCallService33EmergencyActionButtonsWaitingView____lazy_storage___cancelButton));
  sub_1001443AC((uint64_t)self + OBJC_IVAR____TtC13InCallService33EmergencyActionButtonsWaitingView_delegate);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end