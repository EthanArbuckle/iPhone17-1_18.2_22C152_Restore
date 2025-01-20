@interface CACompressionView.ControlAccessibilityElement
- (_TtCC12CoreAudioKit17CACompressionView27ControlAccessibilityElement)init;
- (_TtCC12CoreAudioKit17CACompressionView27ControlAccessibilityElement)initWithAccessibilityContainer:(id)a3;
- (void)accessibilityDecrement;
- (void)accessibilityIncrement;
@end

@implementation CACompressionView.ControlAccessibilityElement

- (_TtCC12CoreAudioKit17CACompressionView27ControlAccessibilityElement)initWithAccessibilityContainer:(id)a3
{
  swift_unknownObjectRetain();
  sub_21E5B68C8();
  swift_unknownObjectRelease();
  return (_TtCC12CoreAudioKit17CACompressionView27ControlAccessibilityElement *)sub_21E581DF0(v4);
}

- (void)accessibilityIncrement
{
  v2 = self;
  sub_21E58220C();
}

- (void)accessibilityDecrement
{
  v2 = self;
  sub_21E582564();
}

- (_TtCC12CoreAudioKit17CACompressionView27ControlAccessibilityElement)init
{
  result = (_TtCC12CoreAudioKit17CACompressionView27ControlAccessibilityElement *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC12CoreAudioKit17CACompressionView27ControlAccessibilityElement_owner));
}

@end