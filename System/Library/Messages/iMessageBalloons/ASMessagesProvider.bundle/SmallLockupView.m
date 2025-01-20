@interface SmallLockupView
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC18ASMessagesProvider15SmallLockupView)initWithFrame:(CGRect)a3;
- (_TtC18ASMessagesProvider25SearchAdTransparencyLabel)accessibilityAdLabel;
- (void)layoutSubviews;
- (void)lockupTapGestureRecognized;
@end

@implementation SmallLockupView

- (_TtC18ASMessagesProvider15SmallLockupView)initWithFrame:(CGRect)a3
{
  return (_TtC18ASMessagesProvider15SmallLockupView *)sub_200C88();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  uint64_t v4 = sub_771DE0();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = self;
  id v9 = [(SmallLockupView *)v8 traitCollection];
  sub_1FED18((uint64_t)v7);
  [(SmallLockupView *)v8 layoutMargins];
  id v10 = [(SmallLockupView *)v8 traitCollection];
  double v11 = sub_2005C4((uint64_t)v7);
  double v13 = v12;

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  double v14 = v11;
  double v15 = v13;
  result.height = v15;
  result.width = v14;
  return result;
}

- (CGSize)intrinsicContentSize
{
  uint64_t v3 = sub_771DE0();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = self;
  sub_1FED18((uint64_t)v6);
  [(SmallLockupView *)v7 layoutMargins];
  id v8 = [(SmallLockupView *)v7 traitCollection];
  sub_2005C4((uint64_t)v6);
  double v10 = v9;

  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  double v11 = UIViewNoIntrinsicMetric;
  double v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for SmallLockupView();
  id v2 = v5.receiver;
  [(SmallLockupView *)&v5 layoutSubviews];
  sub_1FF218((uint64_t)v4);
  sub_FB9C(v4, v4[3]);
  sub_772580();
  id v3 = [v2 traitCollection];
  sub_77B970();

  _s18ASMessagesProvider13VideoCardViewC7MetricsVwxx_0((uint64_t)v4);
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  char v9 = sub_1FFD6C(v6, v7);

  return v9 & 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v7 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC18ASMessagesProvider15SmallLockupView_lockupTapGestureRecognizer);
  if (!v7)
  {
    id v14 = a3;
    id v15 = a4;
    uint64_t v16 = self;
    goto LABEL_5;
  }
  sub_FE2C(0, (unint64_t *)&qword_95C680);
  id v8 = a3;
  id v9 = a4;
  double v10 = self;
  id v11 = v7;
  char v12 = sub_77E510();

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
                                      + OBJC_IVAR____TtC18ASMessagesProvider15SmallLockupView_lockupTapBlock);
  if (v2)
  {
    uint64_t v4 = self;
    uint64_t v3 = sub_13318((uint64_t)v2);
    v2(v3);
    sub_13308((uint64_t)v2);
  }
}

- (void).cxx_destruct
{
  uint64_t v3 = (char *)self + OBJC_IVAR____TtC18ASMessagesProvider15SmallLockupView_metrics;
  uint64_t v4 = sub_771DE0();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider15SmallLockupView_searchAdTertiaryLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider15SmallLockupView_inAppPurchaseIcon));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider15SmallLockupView_lockupTapGestureRecognizer));
  uint64_t v5 = *(uint64_t *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR____TtC18ASMessagesProvider15SmallLockupView_lockupTapBlock);

  sub_13308(v5);
}

- (_TtC18ASMessagesProvider25SearchAdTransparencyLabel)accessibilityAdLabel
{
  return (_TtC18ASMessagesProvider25SearchAdTransparencyLabel *)*(id *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC18ASMessagesProvider15SmallLockupView_searchAdTertiaryLabel);
}

@end