@interface BorderedScreenshotView
- (_TtC20ProductPageExtension22BorderedScreenshotView)initWithCoder:(id)a3;
- (_TtC20ProductPageExtension22BorderedScreenshotView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation BorderedScreenshotView

- (_TtC20ProductPageExtension22BorderedScreenshotView)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension22BorderedScreenshotView *)sub_10011D69C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension22BorderedScreenshotView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC20ProductPageExtension22BorderedScreenshotView_platform) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC20ProductPageExtension22BorderedScreenshotView_chromeBorderView) = 0;
  uint64_t v4 = OBJC_IVAR____TtC20ProductPageExtension22BorderedScreenshotView_displayConfiguration;
  uint64_t v5 = qword_100947AA8;
  id v6 = a3;
  if (v5 != -1) {
    swift_once();
  }
  v7 = (char *)self + v4;
  uint64_t v8 = qword_1009A7648;
  char v9 = byte_1009A7650;
  uint64_t v10 = qword_1009A7658;
  char v11 = byte_1009A7660;
  uint64_t v12 = qword_1009A7668;
  v13 = (void *)qword_1009A7670;
  long long v14 = unk_1009A7678;
  long long v15 = unk_1009A7688;
  *(void *)v7 = qword_1009A7640;
  *((void *)v7 + 1) = v8;
  v7[16] = v9;
  *((void *)v7 + 3) = v10;
  v7[32] = v11;
  *((void *)v7 + 5) = v12;
  *((void *)v7 + 6) = v13;
  *(_OWORD *)(v7 + 56) = v14;
  *(_OWORD *)(v7 + 72) = v15;
  id v16 = v13;

  result = (_TtC20ProductPageExtension22BorderedScreenshotView *)sub_10077D120();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_10011D98C();
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension22BorderedScreenshotView_chromeBorderView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension22BorderedScreenshotView_artworkView));
  v3 = *(void **)&self->displayConfiguration[OBJC_IVAR____TtC20ProductPageExtension22BorderedScreenshotView_displayConfiguration
                                           + 16];
}

@end