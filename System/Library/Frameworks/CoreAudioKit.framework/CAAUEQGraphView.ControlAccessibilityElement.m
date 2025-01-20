@interface CAAUEQGraphView.ControlAccessibilityElement
- (_TtCC12CoreAudioKit15CAAUEQGraphView27ControlAccessibilityElement)init;
- (_TtCC12CoreAudioKit15CAAUEQGraphView27ControlAccessibilityElement)initWithAccessibilityContainer:(id)a3;
- (void)accessibilityDecrement;
- (void)accessibilityIncrement;
@end

@implementation CAAUEQGraphView.ControlAccessibilityElement

- (_TtCC12CoreAudioKit15CAAUEQGraphView27ControlAccessibilityElement)initWithAccessibilityContainer:(id)a3
{
  swift_unknownObjectRetain();
  sub_21E5B68C8();
  swift_unknownObjectRelease();
  return (_TtCC12CoreAudioKit15CAAUEQGraphView27ControlAccessibilityElement *)sub_21E58ABBC(v4);
}

- (void)accessibilityIncrement
{
  v2 = self;
  sub_21E58AFB8();
}

- (void)accessibilityDecrement
{
  v2 = self;
  sub_21E58B39C();
}

- (_TtCC12CoreAudioKit15CAAUEQGraphView27ControlAccessibilityElement)init
{
  result = (_TtCC12CoreAudioKit15CAAUEQGraphView27ControlAccessibilityElement *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC12CoreAudioKit15CAAUEQGraphView27ControlAccessibilityElement_owner));
}

@end