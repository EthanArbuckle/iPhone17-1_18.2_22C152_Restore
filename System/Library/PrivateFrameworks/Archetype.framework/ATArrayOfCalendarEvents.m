@interface ATArrayOfCalendarEvents
+ (BOOL)supportsSecureCoding;
+ (void)setSupportsSecureCoding:(BOOL)a3;
- (NSString)description;
- (_TtC9Archetype23ATArrayOfCalendarEvents)init;
- (_TtC9Archetype23ATArrayOfCalendarEvents)initWithCalendarEvents:(id)a3;
- (_TtC9Archetype23ATArrayOfCalendarEvents)initWithCoder:(id)a3;
- (id)copyWithZone:(void *)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ATArrayOfCalendarEvents

+ (BOOL)supportsSecureCoding
{
  return byte_26931CF91;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  byte_26931CF91 = a3;
}

- (_TtC9Archetype23ATArrayOfCalendarEvents)initWithCalendarEvents:(id)a3
{
  return (_TtC9Archetype23ATArrayOfCalendarEvents *)sub_24867C14C((char *)self, (uint64_t)a2, (uint64_t)a3, (void (*)(void))type metadata accessor for ATCalendarEvent, &OBJC_IVAR____TtC9Archetype23ATArrayOfCalendarEvents_calendarEvents, type metadata accessor for ATArrayOfCalendarEvents);
}

- (id)copyWithZone:(void *)a3
{
  return sub_24867C27C((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC9Archetype23ATArrayOfCalendarEvents_calendarEvents, type metadata accessor for ATArrayOfCalendarEvents);
}

- (void)encodeWithCoder:(id)a3
{
}

- (_TtC9Archetype23ATArrayOfCalendarEvents)initWithCoder:(id)a3
{
  return (_TtC9Archetype23ATArrayOfCalendarEvents *)sub_24867C6EC(self, (uint64_t)a2, a3, (void (*)(void))type metadata accessor for ATCalendarEvent, 0x7261646E656C6163, 0xEE0073746E657645, (SEL *)&selRef_initWithCalendarEvents_);
}

- (NSString)description
{
  return (NSString *)sub_24867C7D0(self, (uint64_t)a2, (void (*)(void))sub_24867A348);
}

- (_TtC9Archetype23ATArrayOfCalendarEvents)init
{
  result = (_TtC9Archetype23ATArrayOfCalendarEvents *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end