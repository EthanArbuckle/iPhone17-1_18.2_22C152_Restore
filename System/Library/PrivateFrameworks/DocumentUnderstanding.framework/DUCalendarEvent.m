@interface DUCalendarEvent
- (BOOL)isAllDay;
- (NSDateComponents)endDateComponents;
- (NSDateComponents)startDateComponents;
- (NSTimeZone)endTimezone;
- (NSTimeZone)startTimezone;
- (_TtC21DocumentUnderstanding15DUCalendarEvent)init;
- (_TtC21DocumentUnderstanding15DUCalendarEvent)initWithCoder:(id)a3;
- (id)copyWithZone:(void *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setEndDateComponents:(id)a3;
- (void)setEndTimezone:(id)a3;
- (void)setIsAllDay:(BOOL)a3;
- (void)setStartDateComponents:(id)a3;
- (void)setStartTimezone:(id)a3;
@end

@implementation DUCalendarEvent

- (BOOL)isAllDay
{
  return DUCalendarEvent.isAllDay.getter() & 1;
}

- (void)setIsAllDay:(BOOL)a3
{
}

- (NSDateComponents)startDateComponents
{
  return (NSDateComponents *)sub_2368CF5B8((uint64_t)self, (uint64_t)a2, &qword_26AD89410, (void (*)(void))DUCalendarEvent.startDateComponents.getter, MEMORY[0x263F063B0], MEMORY[0x263F06388]);
}

- (void)setStartDateComponents:(id)a3
{
}

- (NSTimeZone)startTimezone
{
  return (NSTimeZone *)sub_2368CF5B8((uint64_t)self, (uint64_t)a2, &qword_26AD89430, (void (*)(void))DUCalendarEvent.startTimezone.getter, MEMORY[0x263F079C8], MEMORY[0x263F079B0]);
}

- (void)setStartTimezone:(id)a3
{
}

- (NSDateComponents)endDateComponents
{
  return (NSDateComponents *)sub_2368CF5B8((uint64_t)self, (uint64_t)a2, &qword_26AD89410, (void (*)(void))DUCalendarEvent.endDateComponents.getter, MEMORY[0x263F063B0], MEMORY[0x263F06388]);
}

- (void)setEndDateComponents:(id)a3
{
}

- (NSTimeZone)endTimezone
{
  return (NSTimeZone *)sub_2368CF5B8((uint64_t)self, (uint64_t)a2, &qword_26AD89430, (void (*)(void))DUCalendarEvent.endTimezone.getter, MEMORY[0x263F079C8], MEMORY[0x263F079B0]);
}

- (void)setEndTimezone:(id)a3
{
}

- (id)copyWithZone:(void *)a3
{
  return (id)sub_2368CEC58(self, (uint64_t)a2, (uint64_t)a3, (void (*)(void *__return_ptr))DUCalendarEvent.copy(with:));
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  DUCalendarEvent.encode(with:)((NSCoder)v4);
}

- (_TtC21DocumentUnderstanding15DUCalendarEvent)initWithCoder:(id)a3
{
  return (_TtC21DocumentUnderstanding15DUCalendarEvent *)DUCalendarEvent.init(coder:)(a3);
}

- (_TtC21DocumentUnderstanding15DUCalendarEvent)init
{
  return (_TtC21DocumentUnderstanding15DUCalendarEvent *)DUCalendarEvent.init()();
}

- (void).cxx_destruct
{
}

@end