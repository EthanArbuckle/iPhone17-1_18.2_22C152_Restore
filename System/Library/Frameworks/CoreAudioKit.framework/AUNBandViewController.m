@interface AUNBandViewController
- (_TtC12CoreAudioKit21AUNBandViewController)init;
- (_TtC12CoreAudioKit21AUNBandViewController)initWithCoder:(id)a3;
- (void)bandEnabledChangedWithNotification:(id)a3;
- (void)bandSelectionChangedWithNotification:(id)a3;
- (void)globalGainChangedWithNotification:(id)a3;
- (void)globalGainKnobReleasedWithNotification:(id)a3;
- (void)globalGainKnobTouchedWithNotification:(id)a3;
- (void)hintDismissedWithRecognizer:(id)a3;
- (void)typeControlChangedWithSender:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation AUNBandViewController

- (void)viewWillAppear:(BOOL)a3
{
  v3 = self;
  sub_21E551D48();
}

- (void)hintDismissedWithRecognizer:(id)a3
{
  id v4 = a3;
  v7 = self;
  id v5 = [(AUNBandViewController *)v7 view];
  if (v5)
  {
    v6 = v5;
    objc_msgSend(v5, sel_removeGestureRecognizer_, v4);

    objc_msgSend(*(id *)((char *)&v7->super.super.super.super.super.isa+ OBJC_IVAR____TtC12CoreAudioKit21AUNBandViewController_hintView), sel_removeFromSuperview);
  }
  else
  {
    __break(1u);
  }
}

- (void)globalGainChangedWithNotification:(id)a3
{
}

- (void)globalGainKnobTouchedWithNotification:(id)a3
{
}

- (void)globalGainKnobReleasedWithNotification:(id)a3
{
}

- (void)bandSelectionChangedWithNotification:(id)a3
{
}

- (void)bandEnabledChangedWithNotification:(id)a3
{
}

- (void)typeControlChangedWithSender:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_21E550CBC((int64_t)objc_msgSend(v4, sel_tag), 1);
}

- (_TtC12CoreAudioKit21AUNBandViewController)init
{
  return (_TtC12CoreAudioKit21AUNBandViewController *)sub_21E5516A8();
}

- (_TtC12CoreAudioKit21AUNBandViewController)initWithCoder:(id)a3
{
  return (_TtC12CoreAudioKit21AUNBandViewController *)sub_21E5517A0(a3);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC12CoreAudioKit21AUNBandViewController_hintView);
}

@end