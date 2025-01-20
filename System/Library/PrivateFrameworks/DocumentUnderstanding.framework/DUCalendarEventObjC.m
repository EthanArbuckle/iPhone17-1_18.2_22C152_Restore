@interface DUCalendarEventObjC
- (BOOL)isAllDay;
- (DUCalendarEventObjC)init;
- (NSDateComponents)endDateComponents;
- (NSDateComponents)startDateComponents;
- (NSTimeZone)endTimezone;
- (NSTimeZone)startTimezone;
- (void)setEndDateComponents:(id)a3;
- (void)setEndTimezone:(id)a3;
- (void)setIsAllDay:(BOOL)a3;
- (void)setStartDateComponents:(id)a3;
- (void)setStartTimezone:(id)a3;
@end

@implementation DUCalendarEventObjC

- (void).cxx_destruct
{
}

- (void)setEndTimezone:(id)a3
{
  id v9 = (id)objc_msgSend_copy(a3, a2, (uint64_t)a3, v3, v4);
  objc_msgSend_setEndTimezone_(self->_underlying, v6, (uint64_t)v9, v7, v8);
}

- (NSTimeZone)endTimezone
{
  return (NSTimeZone *)objc_msgSend_endTimezone(self->_underlying, a2, v2, v3, v4);
}

- (void)setEndDateComponents:(id)a3
{
  id v9 = (id)objc_msgSend_copy(a3, a2, (uint64_t)a3, v3, v4);
  objc_msgSend_setEndDateComponents_(self->_underlying, v6, (uint64_t)v9, v7, v8);
}

- (NSDateComponents)endDateComponents
{
  return (NSDateComponents *)objc_msgSend_endDateComponents(self->_underlying, a2, v2, v3, v4);
}

- (void)setStartTimezone:(id)a3
{
  id v9 = (id)objc_msgSend_copy(a3, a2, (uint64_t)a3, v3, v4);
  objc_msgSend_setStartTimezone_(self->_underlying, v6, (uint64_t)v9, v7, v8);
}

- (NSTimeZone)startTimezone
{
  return (NSTimeZone *)objc_msgSend_startTimezone(self->_underlying, a2, v2, v3, v4);
}

- (void)setStartDateComponents:(id)a3
{
  id v9 = (id)objc_msgSend_copy(a3, a2, (uint64_t)a3, v3, v4);
  objc_msgSend_setStartDateComponents_(self->_underlying, v6, (uint64_t)v9, v7, v8);
}

- (NSDateComponents)startDateComponents
{
  return (NSDateComponents *)objc_msgSend_startDateComponents(self->_underlying, a2, v2, v3, v4);
}

- (void)setIsAllDay:(BOOL)a3
{
  objc_msgSend_setIsAllDay_(self->_underlying, a2, a3, v3, v4);
}

- (BOOL)isAllDay
{
  return objc_msgSend_isAllDay(self->_underlying, a2, v2, v3, v4);
}

- (DUCalendarEventObjC)init
{
  v7.receiver = self;
  v7.super_class = (Class)DUCalendarEventObjC;
  uint64_t v2 = [(DUCalendarEventObjC *)&v7 init];
  if (v2)
  {
    uint64_t v3 = objc_alloc_init(_TtC21DocumentUnderstanding15DUCalendarEvent);
    underlying = v2->_underlying;
    v2->_underlying = v3;

    v5 = v2;
  }

  return v2;
}

@end