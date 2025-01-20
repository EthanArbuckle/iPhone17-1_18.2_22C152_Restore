@interface AUKnobControl
- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (BOOL)continueTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (_TtC12CoreAudioKit13AUKnobControl)initWithCoder:(id)a3;
- (_TtC12CoreAudioKit13AUKnobControl)initWithFrame:(CGRect)a3;
- (unint64_t)accessibilityTraits;
- (void)accessibilityDecrement;
- (void)accessibilityIncrement;
- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (void)tintColorDidChange;
@end

@implementation AUKnobControl

- (_TtC12CoreAudioKit13AUKnobControl)initWithFrame:(CGRect)a3
{
  return (_TtC12CoreAudioKit13AUKnobControl *)sub_21E564AF8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC12CoreAudioKit13AUKnobControl)initWithCoder:(id)a3
{
  return (_TtC12CoreAudioKit13AUKnobControl *)sub_21E564CC4(a3);
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F83248];
}

- (void)accessibilityIncrement
{
  v2 = self;
  sub_21E564E68();
}

- (void)accessibilityDecrement
{
  v2 = self;
  sub_21E564EFC();
}

- (void)tintColorDidChange
{
  v2 = *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC12CoreAudioKit13AUKnobControl_valueLayer);
  v3 = self;
  id v4 = [(AUKnobControl *)v3 tintColor];
  if (v4)
  {
    v5 = v4;
    id v6 = objc_msgSend(v4, sel_CGColor);

    objc_msgSend(v2, sel_setStrokeColor_, v6);
  }
  else
  {
    __break(1u);
  }
}

- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  char v9 = sub_21E5661B4(v6);

  return v9 & 1;
}

- (BOOL)continueTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  char v9 = sub_21E56636C(v6);

  return v9 & 1;
}

- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_21E5665C4();
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  return swift_dynamicCastObjCClass() != 0;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit13AUKnobControl_formatter));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit13AUKnobControl_valueLayer));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit13AUKnobControl_lineLayer));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit13AUKnobControl_titleLayer));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit13AUKnobControl_valueLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit13AUKnobControl_minValueLayer));
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC12CoreAudioKit13AUKnobControl_maxValueLayer);
}

@end