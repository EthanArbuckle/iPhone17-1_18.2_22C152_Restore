@interface MFHapticButton
- (_TtC16MagnifierSupport14MFHapticButton)init;
- (_TtC16MagnifierSupport14MFHapticButton)initWithCoder:(id)a3;
- (_TtC16MagnifierSupport14MFHapticButton)initWithFrame:(CGRect)a3;
- (void)shutterButtonDown:(id)a3;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
@end

@implementation MFHapticButton

- (_TtC16MagnifierSupport14MFHapticButton)init
{
  return (_TtC16MagnifierSupport14MFHapticButton *)sub_23577EFFC();
}

- (_TtC16MagnifierSupport14MFHapticButton)initWithCoder:(id)a3
{
  result = (_TtC16MagnifierSupport14MFHapticButton *)sub_23594A968();
  __break(1u);
  return result;
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  ObjectType = (objc_class *)swift_getObjectType();
  sub_2356594B0(0, &qword_2688118F0);
  sub_23577F76C();
  sub_235949FE8();
  id v7 = a4;
  v8 = self;
  v9 = (void *)sub_235949FD8();
  v10.receiver = v8;
  v10.super_class = ObjectType;
  [(MFHapticButton *)&v10 touchesCancelled:v9 withEvent:v7];

  objc_msgSend(*(id *)((char *)&v8->super.super.super.super.super.isa+ OBJC_IVAR____TtC16MagnifierSupport14MFHapticButton_buttonFeedbackGenerator), sel_userInteractionCancelled);
  swift_bridgeObjectRelease();
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  sub_2356594B0(0, &qword_2688118F0);
  sub_23577F76C();
  uint64_t v6 = sub_235949FE8();
  id v7 = a4;
  v8 = self;
  sub_23577F4F8(v6, (uint64_t)a4);

  swift_bridgeObjectRelease();
}

- (void)shutterButtonDown:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_23594A6A8();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v6 = 0u;
    long long v7 = 0u;
    v5 = self;
  }
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC16MagnifierSupport14MFHapticButton_buttonFeedbackGenerator), sel_userInteractionStarted, v6, v7);

  sub_2356BDF2C((uint64_t)&v6);
}

- (_TtC16MagnifierSupport14MFHapticButton)initWithFrame:(CGRect)a3
{
  result = (_TtC16MagnifierSupport14MFHapticButton *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport14MFHapticButton_buttonFeedbackGenerator));
}

@end