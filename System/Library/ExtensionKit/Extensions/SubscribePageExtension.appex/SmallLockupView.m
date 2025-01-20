@interface SmallLockupView
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC22SubscribePageExtension15SmallLockupView)initWithFrame:(CGRect)a3;
- (_TtC22SubscribePageExtension25SearchAdTransparencyLabel)accessibilityAdLabel;
- (void)layoutSubviews;
- (void)lockupTapGestureRecognized;
@end

@implementation SmallLockupView

- (_TtC22SubscribePageExtension15SmallLockupView)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension15SmallLockupView *)sub_1001DD93C();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  uint64_t v4 = sub_10075BDE0();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4, v6);
  v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = self;
  id v10 = [(SmallLockupView *)v9 traitCollection];
  sub_1001DB9CC((uint64_t)v8);
  [(SmallLockupView *)v9 layoutMargins];
  id v11 = [(SmallLockupView *)v9 traitCollection];
  double v12 = sub_1001DD278((uint64_t)v8);
  double v14 = v13;

  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  double v15 = v12;
  double v16 = v14;
  result.height = v16;
  result.width = v15;
  return result;
}

- (CGSize)intrinsicContentSize
{
  uint64_t v3 = sub_10075BDE0();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3, v5);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = self;
  sub_1001DB9CC((uint64_t)v7);
  [(SmallLockupView *)v8 layoutMargins];
  id v9 = [(SmallLockupView *)v8 traitCollection];
  sub_1001DD278((uint64_t)v7);
  double v11 = v10;

  (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
  double v12 = UIViewNoIntrinsicMetric;
  double v13 = v11;
  result.height = v13;
  result.width = v12;
  return result;
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for SmallLockupView();
  id v2 = v5.receiver;
  [(SmallLockupView *)&v5 layoutSubviews];
  sub_1001DBECC((uint64_t)v4);
  sub_10000FE94(v4, v4[3]);
  sub_10075C580();
  id v3 = [v2 traitCollection];
  sub_100765900();

  _s22SubscribePageExtension38ProductRatingsCompactProductPageLayoutV7MetricsVwxx_0((uint64_t)v4);
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  char v9 = sub_1001DCA20(v6, v7);

  return v9 & 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v7 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC22SubscribePageExtension15SmallLockupView_lockupTapGestureRecognizer);
  if (!v7)
  {
    id v14 = a3;
    id v15 = a4;
    double v16 = self;
    goto LABEL_5;
  }
  sub_10001A860(0, (unint64_t *)&qword_100935EB0);
  id v8 = a3;
  id v9 = a4;
  double v10 = self;
  id v11 = v7;
  char v12 = sub_100768430();

  if ((v12 & 1) == 0)
  {
LABEL_5:
    self;
    BOOL v13 = swift_dynamicCastObjCClass() == 0;
    goto LABEL_6;
  }
  BOOL v13 = 0;
LABEL_6:

  return v13;
}

- (void)lockupTapGestureRecognized
{
  id v2 = *(void (**)(uint64_t))((char *)&self->super.super.super.super.isa
                                      + OBJC_IVAR____TtC22SubscribePageExtension15SmallLockupView_lockupTapBlock);
  if (v2)
  {
    uint64_t v4 = self;
    uint64_t v3 = sub_10001A4E0((uint64_t)v2);
    v2(v3);
    sub_10001A4D0((uint64_t)v2);
  }
}

- (void).cxx_destruct
{
  uint64_t v3 = (char *)self + OBJC_IVAR____TtC22SubscribePageExtension15SmallLockupView_metrics;
  uint64_t v4 = sub_10075BDE0();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension15SmallLockupView_searchAdTertiaryLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension15SmallLockupView_inAppPurchaseIcon));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension15SmallLockupView_lockupTapGestureRecognizer));
  uint64_t v5 = *(uint64_t *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR____TtC22SubscribePageExtension15SmallLockupView_lockupTapBlock);

  sub_10001A4D0(v5);
}

- (_TtC22SubscribePageExtension25SearchAdTransparencyLabel)accessibilityAdLabel
{
  return (_TtC22SubscribePageExtension25SearchAdTransparencyLabel *)*(id *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC22SubscribePageExtension15SmallLockupView_searchAdTertiaryLabel);
}

@end