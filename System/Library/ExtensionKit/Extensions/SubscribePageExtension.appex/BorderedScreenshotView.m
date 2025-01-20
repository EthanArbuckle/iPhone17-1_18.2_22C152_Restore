@interface BorderedScreenshotView
- (_TtC22SubscribePageExtension22BorderedScreenshotView)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension22BorderedScreenshotView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation BorderedScreenshotView

- (_TtC22SubscribePageExtension22BorderedScreenshotView)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension22BorderedScreenshotView *)sub_10029E1DC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension22BorderedScreenshotView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC22SubscribePageExtension22BorderedScreenshotView_platform) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC22SubscribePageExtension22BorderedScreenshotView_chromeBorderView) = 0;
  uint64_t v4 = OBJC_IVAR____TtC22SubscribePageExtension22BorderedScreenshotView_displayConfiguration;
  uint64_t v5 = qword_100930BC8;
  id v6 = a3;
  if (v5 != -1) {
    swift_once();
  }
  v7 = (char *)self + v4;
  uint64_t v8 = qword_100991850;
  char v9 = byte_100991858;
  uint64_t v10 = qword_100991860;
  char v11 = byte_100991868;
  uint64_t v12 = qword_100991870;
  v13 = (void *)qword_100991878;
  long long v14 = unk_100991880;
  long long v15 = unk_100991890;
  *(void *)v7 = qword_100991848;
  *((void *)v7 + 1) = v8;
  v7[16] = v9;
  *((void *)v7 + 3) = v10;
  v7[32] = v11;
  *((void *)v7 + 5) = v12;
  *((void *)v7 + 6) = v13;
  *(_OWORD *)(v7 + 56) = v14;
  *(_OWORD *)(v7 + 72) = v15;
  id v16 = v13;

  result = (_TtC22SubscribePageExtension22BorderedScreenshotView *)sub_100768A40();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_10029E4CC();
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension22BorderedScreenshotView_chromeBorderView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension22BorderedScreenshotView_artworkView));
  v3 = *(void **)&self->displayConfiguration[OBJC_IVAR____TtC22SubscribePageExtension22BorderedScreenshotView_displayConfiguration
                                           + 16];
}

@end