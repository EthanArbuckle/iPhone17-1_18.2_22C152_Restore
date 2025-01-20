@interface WordmarkView
- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4;
- (_TtC12GameCenterUIP33_89031E6405F26A5C0C098E2073FB218A12WordmarkView)initWithCoder:(id)a3;
- (_TtC12GameCenterUIP33_89031E6405F26A5C0C098E2073FB218A12WordmarkView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation WordmarkView

- (_TtC12GameCenterUIP33_89031E6405F26A5C0C098E2073FB218A12WordmarkView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1AF73B9D0();
}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  swift_unknownObjectRetain();
  v5 = self;
  double v6 = sub_1AF73BA8C();
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  swift_unknownObjectRelease();

  double v13 = v6;
  double v14 = v8;
  double v15 = v10;
  double v16 = v12;
  result.var3 = v16;
  result.var2 = v15;
  result.var1 = v14;
  result.var0 = v13;
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1AF73BD48();
}

- (_TtC12GameCenterUIP33_89031E6405F26A5C0C098E2073FB218A12WordmarkView)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  id v3 = (char *)self
     + OBJC_IVAR____TtC12GameCenterUIP33_89031E6405F26A5C0C098E2073FB218A12WordmarkView_referenceLineHeight;
  uint64_t v4 = sub_1AF7AA990();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUIP33_89031E6405F26A5C0C098E2073FB218A12WordmarkView_image));
  v5 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC12GameCenterUIP33_89031E6405F26A5C0C098E2073FB218A12WordmarkView_imageView);
}

@end