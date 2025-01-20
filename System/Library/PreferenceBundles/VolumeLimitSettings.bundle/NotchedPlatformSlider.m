@interface NotchedPlatformSlider
- (CGRect)thumbRectForBounds:(CGRect)a3 trackRect:(CGRect)a4 value:(float)a5;
- (CGRect)trackRectForBounds:(CGRect)a3;
- (_TtC19VolumeLimitSettings21NotchedPlatformSlider)initWithCoder:(id)a3;
- (_TtC19VolumeLimitSettings21NotchedPlatformSlider)initWithFrame:(CGRect)a3;
- (void)drawRect:(CGRect)a3;
- (void)handleSliderTap:(id)a3;
- (void)layoutSubviews;
- (void)setValue:(float)a3 animated:(BOOL)a4;
@end

@implementation NotchedPlatformSlider

- (_TtC19VolumeLimitSettings21NotchedPlatformSlider)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_53DC();
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  id v2 = v3.receiver;
  [(NotchedPlatformSlider *)&v3 layoutSubviews];
  objc_msgSend(v2, "setNeedsDisplay", v3.receiver, v3.super_class);
}

- (void)drawRect:(CGRect)a3
{
  objc_super v3 = self;
  sub_5760();
}

- (CGRect)trackRectForBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v11.receiver = self;
  v11.super_class = (Class)swift_getObjectType();
  -[NotchedPlatformSlider trackRectForBounds:](&v11, "trackRectForBounds:", x, y, width, height);
  double v10 = 4.0;
  result.size.double height = v10;
  result.size.double width = v9;
  result.origin.double y = v8;
  result.origin.double x = v7;
  return result;
}

- (void)setValue:(float)a3 animated:(BOOL)a4
{
  v6 = self;
  sub_45B4(a4, a3);
}

- (void)handleSliderTap:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_47F8(v4);
}

- (CGRect)thumbRectForBounds:(CGRect)a3 trackRect:(CGRect)a4 value:(float)a5
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  double v8 = a3.size.height;
  double v9 = a3.size.width;
  double v10 = a3.origin.y;
  double v11 = a3.origin.x;
  v12 = self;
  double v13 = sub_49D8(v11, v10, v9, v8, x, y, width, height, a5);
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;

  double v20 = v13;
  double v21 = v15;
  double v22 = v17;
  double v23 = v19;
  result.size.double height = v23;
  result.size.double width = v22;
  result.origin.double y = v21;
  result.origin.double x = v20;
  return result;
}

- (_TtC19VolumeLimitSettings21NotchedPlatformSlider)initWithFrame:(CGRect)a3
{
  CGRect result = (_TtC19VolumeLimitSettings21NotchedPlatformSlider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19VolumeLimitSettings21NotchedPlatformSlider_generator));
  objc_super v3 = (char *)self + OBJC_IVAR____TtC19VolumeLimitSettings21NotchedPlatformSlider__snappingBehavior;
  uint64_t v4 = sub_3024(&qword_14990);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC19VolumeLimitSettings21NotchedPlatformSlider__segmentCount;
  uint64_t v6 = sub_3024(&qword_14988);
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  double v7 = (char *)self + OBJC_IVAR____TtC19VolumeLimitSettings21NotchedPlatformSlider__unfilledTickColor;
  uint64_t v8 = sub_3024(&qword_149A0);
  double v9 = *(void (**)(char *, uint64_t))(*(void *)(v8 - 8) + 8);

  v9(v7, v8);
}

@end