@interface DoorUIAccessibilityElement
- (_TtC16MagnifierSupport26DoorUIAccessibilityElement)init;
- (_TtC16MagnifierSupport26DoorUIAccessibilityElement)initWithAccessibilityContainer:(id)a3;
- (id)accessibilityExpandedTextValue;
@end

@implementation DoorUIAccessibilityElement

- (id)accessibilityExpandedTextValue
{
  swift_bridgeObjectRetain();
  v2 = (void *)sub_235949A88();
  swift_bridgeObjectRelease();
  return v2;
}

- (_TtC16MagnifierSupport26DoorUIAccessibilityElement)initWithAccessibilityContainer:(id)a3
{
  swift_unknownObjectRetain();
  sub_23594A6A8();
  swift_unknownObjectRelease();
  v4 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC16MagnifierSupport26DoorUIAccessibilityElement_textValue);
  void *v4 = 0;
  v4[1] = 0xE000000000000000;
  __swift_project_boxed_opaque_existential_1(v9, v9[3]);
  uint64_t v5 = sub_23594AB68();
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for DoorUIAccessibilityElement();
  v6 = [(DoorUIAccessibilityElement *)&v8 initWithAccessibilityContainer:v5];
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v9);
  return v6;
}

- (_TtC16MagnifierSupport26DoorUIAccessibilityElement)init
{
  v2 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC16MagnifierSupport26DoorUIAccessibilityElement_textValue);
  void *v2 = 0;
  v2[1] = 0xE000000000000000;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for DoorUIAccessibilityElement();
  return [(DoorUIAccessibilityElement *)&v4 init];
}

- (void).cxx_destruct
{
}

@end