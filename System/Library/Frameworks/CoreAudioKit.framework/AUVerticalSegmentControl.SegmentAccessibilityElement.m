@interface AUVerticalSegmentControl.SegmentAccessibilityElement
- (BOOL)accessibilityActivate;
- (BOOL)selectAccessibilitySegmentWithAction:(id)a3;
- (_TtCC12CoreAudioKit24AUVerticalSegmentControl27SegmentAccessibilityElement)init;
- (_TtCC12CoreAudioKit24AUVerticalSegmentControl27SegmentAccessibilityElement)initWithAccessibilityContainer:(id)a3;
@end

@implementation AUVerticalSegmentControl.SegmentAccessibilityElement

- (_TtCC12CoreAudioKit24AUVerticalSegmentControl27SegmentAccessibilityElement)initWithAccessibilityContainer:(id)a3
{
  swift_unknownObjectRetain();
  sub_21E5B68C8();
  swift_unknownObjectRelease();
  return (_TtCC12CoreAudioKit24AUVerticalSegmentControl27SegmentAccessibilityElement *)sub_21E533FF8(v4);
}

- (BOOL)accessibilityActivate
{
  v2 = self;
  sub_21E534AB4();

  return 1;
}

- (BOOL)selectAccessibilitySegmentWithAction:(id)a3
{
  id v4 = a3;
  v5 = self;
  LOBYTE(self) = sub_21E538090();

  return self & 1;
}

- (_TtCC12CoreAudioKit24AUVerticalSegmentControl27SegmentAccessibilityElement)init
{
  result = (_TtCC12CoreAudioKit24AUVerticalSegmentControl27SegmentAccessibilityElement *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC12CoreAudioKit24AUVerticalSegmentControl27SegmentAccessibilityElement_owner));
}

@end