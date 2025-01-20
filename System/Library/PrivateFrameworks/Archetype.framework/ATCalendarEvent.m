@interface ATCalendarEvent
+ (BOOL)supportsSecureCoding;
+ (void)setSupportsSecureCoding:(BOOL)a3;
- (NSString)description;
- (_TtC9Archetype15ATCalendarEvent)init;
- (_TtC9Archetype15ATCalendarEvent)initWithCoder:(id)a3;
- (_TtC9Archetype15ATCalendarEvent)initWithEventTitle:(id)a3;
- (id)copyWithZone:(void *)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ATCalendarEvent

+ (BOOL)supportsSecureCoding
{
  return byte_26931CF90;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  byte_26931CF90 = a3;
}

- (_TtC9Archetype15ATCalendarEvent)initWithEventTitle:(id)a3
{
  uint64_t v4 = sub_24867FD18();
  v5 = (uint64_t *)((char *)self + OBJC_IVAR____TtC9Archetype15ATCalendarEvent_eventTitle);
  uint64_t *v5 = v4;
  v5[1] = v6;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for ATCalendarEvent();
  return [(ATCalendarEvent *)&v8 init];
}

- (id)copyWithZone:(void *)a3
{
  uint64_t v4 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC9Archetype15ATCalendarEvent_eventTitle);
  uint64_t v3 = *(void *)&self->eventTitle[OBJC_IVAR____TtC9Archetype15ATCalendarEvent_eventTitle];
  v5 = (objc_class *)type metadata accessor for ATCalendarEvent();
  uint64_t v6 = (char *)objc_allocWithZone(v5);
  v7 = &v6[OBJC_IVAR____TtC9Archetype15ATCalendarEvent_eventTitle];
  *(void *)v7 = v4;
  *((void *)v7 + 1) = v3;
  v9.receiver = v6;
  v9.super_class = v5;
  swift_bridgeObjectRetain();
  return [(ATCalendarEvent *)&v9 init];
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  uint64_t v6 = (void *)sub_24867FCF8();
  id v7 = (id)sub_24867FCF8();
  objc_msgSend(v4, sel_encodeObject_forKey_, v6, v7);
}

- (_TtC9Archetype15ATCalendarEvent)initWithCoder:(id)a3
{
  return (_TtC9Archetype15ATCalendarEvent *)ATCalendarEvent.init(coder:)(a3);
}

- (NSString)description
{
  return (NSString *)sub_24867C7D0(self, (uint64_t)a2, (void (*)(void))sub_248679E70);
}

- (_TtC9Archetype15ATCalendarEvent)init
{
  result = (_TtC9Archetype15ATCalendarEvent *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end