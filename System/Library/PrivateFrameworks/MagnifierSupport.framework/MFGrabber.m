@interface MFGrabber
- (BOOL)_accessibilityUseAccessibilityFrameForHittest;
- (BOOL)accessibilityActivate;
- (CGRect)accessibilityFrame;
- (_TtC16MagnifierSupport9MFGrabber)init;
- (_TtC16MagnifierSupport9MFGrabber)initWithCoder:(id)a3;
- (_TtC16MagnifierSupport9MFGrabber)initWithFrame:(CGRect)a3;
@end

@implementation MFGrabber

- (_TtC16MagnifierSupport9MFGrabber)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v4 = OBJC_IVAR____TtC16MagnifierSupport9MFGrabber_backgroundView;
  type metadata accessor for MFChevronView();
  id v5 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v6 = self;
  *(Class *)((char *)&self->super.super.super.isa + v4) = (Class)objc_msgSend(v5, sel_init);

  v9.receiver = v6;
  v9.super_class = ObjectType;
  v7 = -[MFGrabber initWithFrame:](&v9, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  sub_2357050C8();
  sub_235705240();

  return v7;
}

- (_TtC16MagnifierSupport9MFGrabber)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC16MagnifierSupport9MFGrabber_backgroundView;
  type metadata accessor for MFChevronView();
  id v6 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_init);

  result = (_TtC16MagnifierSupport9MFGrabber *)sub_23594A968();
  __break(1u);
  return result;
}

- (CGRect)accessibilityFrame
{
  v2 = self;
  sub_235705670();
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (BOOL)_accessibilityUseAccessibilityFrameForHittest
{
  return 1;
}

- (BOOL)accessibilityActivate
{
  uint64_t v2 = qword_26AF13B78;
  double v3 = self;
  if (v2 != -1) {
    swift_once();
  }
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2359470F8();
  sub_2359484E8();

  return 1;
}

- (_TtC16MagnifierSupport9MFGrabber)initWithFrame:(CGRect)a3
{
  CGRect result = (_TtC16MagnifierSupport9MFGrabber *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end