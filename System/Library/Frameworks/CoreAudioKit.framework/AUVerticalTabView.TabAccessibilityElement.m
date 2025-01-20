@interface AUVerticalTabView.TabAccessibilityElement
- (BOOL)accessibilityActivate;
- (_TtCC12CoreAudioKit17AUVerticalTabView23TabAccessibilityElement)init;
- (_TtCC12CoreAudioKit17AUVerticalTabView23TabAccessibilityElement)initWithAccessibilityContainer:(id)a3;
@end

@implementation AUVerticalTabView.TabAccessibilityElement

- (_TtCC12CoreAudioKit17AUVerticalTabView23TabAccessibilityElement)initWithAccessibilityContainer:(id)a3
{
  swift_unknownObjectRetain();
  sub_21E5B68C8();
  swift_unknownObjectRelease();
  return (_TtCC12CoreAudioKit17AUVerticalTabView23TabAccessibilityElement *)sub_21E5454E0(v4);
}

- (BOOL)accessibilityActivate
{
  v2 = self;
  sub_21E545610();

  return 1;
}

- (_TtCC12CoreAudioKit17AUVerticalTabView23TabAccessibilityElement)init
{
  result = (_TtCC12CoreAudioKit17AUVerticalTabView23TabAccessibilityElement *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC12CoreAudioKit17AUVerticalTabView23TabAccessibilityElement_owner));
}

@end