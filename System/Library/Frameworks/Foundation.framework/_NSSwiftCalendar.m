@interface _NSSwiftCalendar
+ (BOOL)supportsSecureCoding;
- (BOOL)date:(id)a3 matchesComponents:(id)a4;
- (BOOL)isDate:(id)a3 equalToDate:(id)a4 toUnitGranularity:(unint64_t)a5;
- (BOOL)isDate:(id)a3 inSameDayAsDate:(id)a4;
- (BOOL)isDateInToday:(id)a3;
- (BOOL)isDateInTomorrow:(id)a3;
- (BOOL)isDateInWeekend:(id)a3;
- (BOOL)isDateInYesterday:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)nextWeekendStartDate:(id *)a3 interval:(double *)a4 options:(unint64_t)a5 afterDate:(id)a6;
- (BOOL)rangeOfUnit:(unint64_t)a3 startDate:(id *)a4 interval:(double *)a5 forDate:(id)a6;
- (BOOL)rangeOfWeekendStartDate:(id *)a3 interval:(double *)a4 containingDate:(id)a5;
- (Class)classForCoder;
- (NSLocale)locale;
- (NSString)calendarIdentifier;
- (NSString)debugDescription;
- (NSTimeZone)timeZone;
- (_NSRange)maximumRangeOfUnit:(unint64_t)a3;
- (_NSRange)minimumRangeOfUnit:(unint64_t)a3;
- (_NSRange)rangeOfUnit:(unint64_t)a3 inUnit:(unint64_t)a4 forDate:(id)a5;
- (_NSSwiftCalendar)initWithCheckedCalendarIdentifier:(id)a3;
- (_NSSwiftCalendar)initWithCoder:(id)a3;
- (id)_components:(unint64_t)a3 fromDate:(id)a4;
- (id)_componentsInTimeZone:(id)a3 fromDate:(id)a4;
- (id)_dateFromComponents:(id)a3;
- (id)components:(unint64_t)a3 fromDate:(id)a4 toDate:(id)a5 options:(unint64_t)a6;
- (id)components:(unint64_t)a3 fromDateComponents:(id)a4 toDateComponents:(id)a5 options:(unint64_t)a6;
- (id)copyWithZone:(void *)a3;
- (id)dateByAddingComponents:(id)a3 toDate:(id)a4 options:(unint64_t)a5;
- (id)dateByAddingUnit:(unint64_t)a3 value:(int64_t)a4 toDate:(id)a5 options:(unint64_t)a6;
- (id)dateBySettingHour:(int64_t)a3 minute:(int64_t)a4 second:(int64_t)a5 ofDate:(id)a6 options:(unint64_t)a7;
- (id)dateBySettingUnit:(unint64_t)a3 value:(int64_t)a4 ofDate:(id)a5 options:(unint64_t)a6;
- (id)dateWithEra:(int64_t)a3 year:(int64_t)a4 month:(int64_t)a5 day:(int64_t)a6 hour:(int64_t)a7 minute:(int64_t)a8 second:(int64_t)a9 nanosecond:(int64_t)a10;
- (id)dateWithEra:(int64_t)a3 yearForWeekOfYear:(int64_t)a4 weekOfYear:(int64_t)a5 weekday:(int64_t)a6 hour:(int64_t)a7 minute:(int64_t)a8 second:(int64_t)a9 nanosecond:(int64_t)a10;
- (id)nextDateAfterDate:(id)a3 matchingComponents:(id)a4 options:(unint64_t)a5;
- (id)nextDateAfterDate:(id)a3 matchingHour:(int64_t)a4 minute:(int64_t)a5 second:(int64_t)a6 options:(unint64_t)a7;
- (id)nextDateAfterDate:(id)a3 matchingUnit:(unint64_t)a4 value:(int64_t)a5 options:(unint64_t)a6;
- (id)startOfDayForDate:(id)a3;
- (int64_t)compareDate:(id)a3 toDate:(id)a4 toUnitGranularity:(unint64_t)a5;
- (int64_t)component:(unint64_t)a3 fromDate:(id)a4;
- (int64_t)firstWeekday;
- (int64_t)minimumDaysInFirstWeek;
- (int64_t)ordinalityOfUnit:(unint64_t)a3 inUnit:(unint64_t)a4 forDate:(id)a5;
- (void)_enumerateDatesStartingAfterDate:(id)a3 matchingComponents:(id)a4 options:(unint64_t)a5 usingBlock:(id)a6;
- (void)encodeWithCoder:(id)a3;
- (void)getEra:(int64_t *)a3 year:(int64_t *)a4 month:(int64_t *)a5 day:(int64_t *)a6 fromDate:(id)a7;
- (void)getEra:(int64_t *)a3 yearForWeekOfYear:(int64_t *)a4 weekOfYear:(int64_t *)a5 weekday:(int64_t *)a6 fromDate:(id)a7;
- (void)getHour:(int64_t *)a3 minute:(int64_t *)a4 second:(int64_t *)a5 nanosecond:(int64_t *)a6 fromDate:(id)a7;
- (void)setFirstWeekday:(int64_t)a3;
- (void)setLocale:(id)a3;
- (void)setMinimumDaysInFirstWeek:(int64_t)a3;
- (void)setTimeZone:(id)a3;
@end

@implementation _NSSwiftCalendar

- (void).cxx_destruct
{
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  _NSSwiftCalendar.encode(with:)((NSCoder)v4);
}

- (Class)classForCoder
{
  v2 = self;
  _NSSwiftCalendar.classForCoder.getter();

  return (Class)swift_getObjCClassFromMetadata();
}

- (_NSSwiftCalendar)initWithCoder:(id)a3
{
  return (_NSSwiftCalendar *)_NSSwiftCalendar.init(coder:)(a3);
}

- (id)dateByAddingUnit:(unint64_t)a3 value:(int64_t)a4 toDate:(id)a5 options:(unint64_t)a6
{
  return @objc _NSSwiftCalendar.date(byAdding:value:to:options:)(self, (int)a2, a3, a4, a5, a6, (void (*)(double *__return_ptr, uint64_t, uint64_t, uint64_t *, uint64_t))_NSSwiftCalendar.date(byAdding:value:to:options:));
}

- (void)getHour:(int64_t *)a3 minute:(int64_t *)a4 second:(int64_t *)a5 nanosecond:(int64_t *)a6 fromDate:(id)a7
{
}

- (id)dateByAddingComponents:(id)a3 toDate:(id)a4 options:(unint64_t)a5
{
  char v5 = a5;
  static DateComponents._unconditionallyBridgeFromObjectiveC(_:)(a3, __src);
  memcpy(__dst, __src, 0x11AuLL);
  objc_msgSend(a4, sel_timeIntervalSinceReferenceDate);
  uint64_t v12 = v8;
  v9 = self;
  _NSSwiftCalendar.date(byAdding:to:options:)(__dst, (double *)&v12, v5);

  outlined release of DateComponents((uint64_t)__src);
  if (v15) {
    id v10 = 0;
  }
  else {
    id v10 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F1C9C8]), sel_initWithTimeIntervalSinceReferenceDate_, v14);
  }

  return v10;
}

- (id)_components:(unint64_t)a3 fromDate:(id)a4
{
  int v4 = a3;
  objc_msgSend(a4, sel_timeIntervalSinceReferenceDate);
  v10[0] = v6;
  v7 = self;
  _NSSwiftCalendar._components(_:from:)(v4, v10, __src);

  memcpy(v10, __src, 0x11AuLL);
  v8.super.isa = DateComponents._bridgeToObjectiveC()().super.isa;
  outlined release of DateComponents((uint64_t)__src);

  return v8.super.isa;
}

- (id)copyWithZone:(void *)a3
{
  v3 = self;
  _NSSwiftCalendar.copy(with:)(v6);

  __swift_project_boxed_opaque_existential_1(v6, v6[3]);
  int v4 = (void *)_bridgeAnythingToObjectiveC<A>(_:)();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v6);
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    int v4 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    char v5 = self;
  }
  char v6 = _NSSwiftCalendar.isEqual(_:)((uint64_t)v8);

  outlined destroy of Any?((uint64_t)v8);
  return v6 & 1;
}

- (void)setTimeZone:(id)a3
{
  v3 = self;
  if (a3)
  {
    type metadata accessor for _NSSwiftTimeZone();
    if (swift_dynamicCastClass())
    {
      self = (_NSSwiftCalendar *)swift_unknownObjectRetain();
    }
    else
    {
      type metadata accessor for _TimeZoneBridged();
      *(void *)(swift_allocObject() + 16) = a3;
      _s10Foundation16_TimeZoneBridgedCAcA01_bC8ProtocolAAWlTm_0(&lazy protocol witness table cache variable for type _TimeZoneBridged and conformance _TimeZoneBridged, (void (*)(uint64_t))type metadata accessor for _TimeZoneBridged);
      self = (_NSSwiftCalendar *)a3;
    }
  }
  MEMORY[0x1F4188790](self);
  uint64_t v6 = (uint64_t)&v5[4];
  v7 = v5 + 8;
  NSDateComponents v8 = v3;
  os_unfair_lock_lock(v7);
  partial apply for closure #1 in _NSSwiftCalendar.timeZone.setter(v6);
  os_unfair_lock_unlock(v7);

  swift_unknownObjectRelease();
}

- (NSTimeZone)timeZone
{
  v2 = self;
  _NSSwiftCalendar.timeZone.getter(&v7);

  if ((void)v7)
  {
    uint64_t v3 = *((void *)&v7 + 1);
    uint64_t ObjectType = swift_getObjectType();
    char v5 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v3 + 120))(ObjectType, v3);
    swift_unknownObjectRelease();
  }
  else
  {
    char v5 = 0;
  }

  return (NSTimeZone *)v5;
}

- (void)setFirstWeekday:(int64_t)a3
{
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____NSSwiftCalendar__lock);
  int v4 = (uint64_t *)(v3 + 16);
  char v5 = (os_unfair_lock_s *)(v3 + 32);
  uint64_t v6 = self;
  os_unfair_lock_lock(v5);
  partial apply for closure #1 in _NSSwiftCalendar.firstWeekday.setter(v4);
  os_unfair_lock_unlock(v5);
}

- (NSString)calendarIdentifier
{
  v2 = self;
  id v3 = (id)specialized _NSSwiftCalendar.calendarIdentifier.getter();

  return (NSString *)v3;
}

- (int64_t)firstWeekday
{
  uint64_t v2 = *(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____NSSwiftCalendar__lock);
  id v3 = (_OWORD *)(v2 + 16);
  int v4 = (os_unfair_lock_s *)(v2 + 32);
  char v5 = self;
  os_unfair_lock_lock(v4);
  closure #1 in _NSSwiftCalendar.calendar.getter(v3, &v10);
  os_unfair_lock_unlock(v4);
  uint64_t v6 = *((void *)&v10 + 1);
  uint64_t ObjectType = swift_getObjectType();
  int64_t v8 = (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 56))(ObjectType, v6);

  swift_unknownObjectRelease();
  return v8;
}

- (int64_t)minimumDaysInFirstWeek
{
  uint64_t v2 = *(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____NSSwiftCalendar__lock);
  id v3 = (_OWORD *)(v2 + 16);
  int v4 = (os_unfair_lock_s *)(v2 + 32);
  char v5 = self;
  os_unfair_lock_lock(v4);
  closure #1 in _NSSwiftCalendar.calendar.getter(v3, &v10);
  os_unfair_lock_unlock(v4);
  uint64_t v6 = *((void *)&v10 + 1);
  uint64_t ObjectType = swift_getObjectType();
  int64_t v8 = (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 72))(ObjectType, v6);

  swift_unknownObjectRelease();
  return v8;
}

- (id)components:(unint64_t)a3 fromDateComponents:(id)a4 toDateComponents:(id)a5 options:(unint64_t)a6
{
  int v7 = a3;
  static DateComponents._unconditionallyBridgeFromObjectiveC(_:)(a4, __src);
  memcpy(__dst, __src, 0x11AuLL);
  static DateComponents._unconditionallyBridgeFromObjectiveC(_:)(a5, v15);
  memcpy(v12, v15, 0x11AuLL);
  v9 = self;
  _NSSwiftCalendar.components(_:from:to:options:)(v7, __dst, v12, v13);

  outlined release of DateComponents((uint64_t)v15);
  outlined release of DateComponents((uint64_t)__src);
  memcpy(__dst, v13, 0x11AuLL);
  memcpy(v12, v13, 0x11AuLL);
  v10.super.isa = DateComponents._bridgeToObjectiveC()().super.isa;
  outlined release of DateComponents((uint64_t)__dst);

  return v10.super.isa;
}

- (_NSRange)rangeOfUnit:(unint64_t)a3 inUnit:(unint64_t)a4 forDate:(id)a5
{
  objc_msgSend(a5, sel_timeIntervalSinceReferenceDate);
  int64_t v8 = self;
  __C::_NSRange v10 = _NSSwiftCalendar.range(of:in:for:)(a3, a4, v9);

  Swift::Int location = v10.location;
  Swift::Int length = v10.length;
  result.Swift::Int length = length;
  result.Swift::Int location = location;
  return result;
}

- (_NSRange)maximumRangeOfUnit:(unint64_t)a3
{
  int v4 = self;
  __C::_NSRange v5 = _NSSwiftCalendar.maximumRange(of:)(a3);

  Swift::Int location = v5.location;
  Swift::Int length = v5.length;
  result.Swift::Int length = length;
  result.Swift::Int location = location;
  return result;
}

- (id)nextDateAfterDate:(id)a3 matchingUnit:(unint64_t)a4 value:(int64_t)a5 options:(unint64_t)a6
{
  objc_msgSend(a3, sel_timeIntervalSinceReferenceDate);
  v14[0] = v9;
  __C::_NSRange v10 = self;
  _NSSwiftCalendar.nextDate(after:matching:value:options:)(v11, (NSCalendarUnit)v14, a4, a5);

  if (v15) {
    id v12 = 0;
  }
  else {
    id v12 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F1C9C8]), sel_initWithTimeIntervalSinceReferenceDate_, *(double *)&v14[1]);
  }

  return v12;
}

- (int64_t)compareDate:(id)a3 toDate:(id)a4 toUnitGranularity:(unint64_t)a5
{
  objc_msgSend(a3, sel_timeIntervalSinceReferenceDate);
  uint64_t v13 = v7;
  objc_msgSend(a4, sel_timeIntervalSinceReferenceDate);
  int64_t v8 = self;
  NSComparisonResult v11 = _NSSwiftCalendar.compare(_:to:toUnitGranularity:)(v9, v10, (NSCalendarUnit)&v13);

  return v11;
}

- (int64_t)component:(unint64_t)a3 fromDate:(id)a4
{
  objc_msgSend(a4, sel_timeIntervalSinceReferenceDate);
  uint64_t v6 = self;
  Swift::Int v8 = _NSSwiftCalendar.component(_:from:)(a3, v7);

  return v8;
}

- (id)components:(unint64_t)a3 fromDate:(id)a4 toDate:(id)a5 options:(unint64_t)a6
{
  int v7 = a3;
  objc_msgSend(a4, sel_timeIntervalSinceReferenceDate);
  __dst[0] = v9;
  objc_msgSend(a5, sel_timeIntervalSinceReferenceDate);
  uint64_t v15 = v10;
  NSComparisonResult v11 = self;
  _NSSwiftCalendar.components(_:from:to:options:)(v7, __dst, &v15, __src);

  memcpy(__dst, __src, 0x11AuLL);
  v12.super.isa = DateComponents._bridgeToObjectiveC()().super.isa;
  outlined release of DateComponents((uint64_t)__src);

  return v12.super.isa;
}

- (id)startOfDayForDate:(id)a3
{
  objc_msgSend(a3, sel_timeIntervalSinceReferenceDate);
  uint64_t v9 = v4;
  __C::_NSRange v5 = self;
  _NSSwiftCalendar.startOfDay(for:)(v6);

  id v7 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F1C9C8]), sel_initWithTimeIntervalSinceReferenceDate_, v10, v9);

  return v7;
}

- (NSLocale)locale
{
  uint64_t v2 = *(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____NSSwiftCalendar__lock);
  id v3 = (_OWORD *)(v2 + 16);
  uint64_t v4 = (os_unfair_lock_s *)(v2 + 32);
  __C::_NSRange v5 = self;
  os_unfair_lock_lock(v4);
  closure #1 in _NSSwiftCalendar.calendar.getter(v3, &v10);
  os_unfair_lock_unlock(v4);
  Calendar.locale.getter(v11);

  swift_unknownObjectRelease();
  if (v11[0])
  {
    uint64_t v6 = v11[1];
    uint64_t ObjectType = swift_getObjectType();
    Swift::Int v8 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v6 + 488))(ObjectType, v6);
    swift_unknownObjectRelease();
  }
  else
  {
    Swift::Int v8 = 0;
  }

  return (NSLocale *)v8;
}

- (id)_dateFromComponents:(id)a3
{
  static DateComponents._unconditionallyBridgeFromObjectiveC(_:)(a3, __src);
  memcpy(v7, __src, 0x11AuLL);
  uint64_t v4 = self;
  _NSSwiftCalendar._date(from:)(v7);

  outlined release of DateComponents((uint64_t)__src);
  if (v9) {
    id v5 = 0;
  }
  else {
    id v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F1C9C8]), sel_initWithTimeIntervalSinceReferenceDate_, v8);
  }

  return v5;
}

- (_NSSwiftCalendar)initWithCheckedCalendarIdentifier:(id)a3
{
  return (_NSSwiftCalendar *)_NSSwiftCalendar.init(checkedCalendarIdentifier:)(a3);
}

- (BOOL)isDate:(id)a3 inSameDayAsDate:(id)a4
{
  objc_msgSend(a3, sel_timeIntervalSinceReferenceDate);
  objc_msgSend(a4, sel_timeIntervalSinceReferenceDate);
  uint64_t v6 = self;
  LOBYTE(a4) = _NSSwiftCalendar.isDate(_:inSameDayAs:)(v7, v8);

  return a4 & 1;
}

- (BOOL)isDateInYesterday:(id)a3
{
  return @objc _NSSwiftCalendar.isDateInYesterday(_:)(self, (int)a2, a3, (uint64_t (*)(uint64_t *))Calendar.isDateInYesterday(_:));
}

- (BOOL)isDateInToday:(id)a3
{
  return @objc _NSSwiftCalendar.isDateInYesterday(_:)(self, (int)a2, a3, (uint64_t (*)(uint64_t *))Calendar.isDateInToday(_:));
}

- (void)setMinimumDaysInFirstWeek:(int64_t)a3
{
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____NSSwiftCalendar__lock);
  uint64_t v4 = (uint64_t *)(v3 + 16);
  id v5 = (os_unfair_lock_s *)(v3 + 32);
  uint64_t v6 = self;
  os_unfair_lock_lock(v5);
  partial apply for closure #1 in _NSSwiftCalendar.minimumDaysInFirstWeek.setter(v4);
  os_unfair_lock_unlock(v5);
}

- (BOOL)isDateInWeekend:(id)a3
{
  objc_msgSend(a3, sel_timeIntervalSinceReferenceDate);
  uint64_t v4 = self;
  LOBYTE(self) = _NSSwiftCalendar.isDateInWeekend(_:)(v5);

  return self & 1;
}

- (id)nextDateAfterDate:(id)a3 matchingComponents:(id)a4 options:(unint64_t)a5
{
  __int16 v5 = a5;
  objc_msgSend(a3, sel_timeIntervalSinceReferenceDate);
  uint64_t v13 = v8;
  static DateComponents._unconditionallyBridgeFromObjectiveC(_:)(a4, __src);
  memcpy(__dst, __src, 0x11AuLL);
  char v9 = self;
  _NSSwiftCalendar.nextDate(after:matching:options:)(&v13, __dst, v5, (uint64_t)&v14);

  outlined release of DateComponents((uint64_t)__src);
  if (v15) {
    id v10 = 0;
  }
  else {
    id v10 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F1C9C8]), sel_initWithTimeIntervalSinceReferenceDate_, v14);
  }

  return v10;
}

- (void)setLocale:(id)a3
{
  uint64_t v3 = self;
  if (a3)
  {
    type metadata accessor for _NSSwiftLocale();
    if (swift_dynamicCastClass())
    {
      self = (_NSSwiftCalendar *)swift_unknownObjectRetain();
    }
    else
    {
      type metadata accessor for _LocaleBridged();
      *(void *)(swift_allocObject() + 16) = a3;
      _s10Foundation16_TimeZoneBridgedCAcA01_bC8ProtocolAAWlTm_0((unint64_t *)&lazy protocol witness table cache variable for type _LocaleBridged and conformance _LocaleBridged, (void (*)(uint64_t))type metadata accessor for _LocaleBridged);
      self = (_NSSwiftCalendar *)a3;
    }
  }
  MEMORY[0x1F4188790](self);
  uint64_t v6 = v5 + 8;
  Foundation::Date v7 = v3;
  os_unfair_lock_lock(v6);
  partial apply for closure #1 in _NSSwiftCalendar.locale.setter();
  os_unfair_lock_unlock(v6);

  swift_unknownObjectRelease();
}

- (int64_t)ordinalityOfUnit:(unint64_t)a3 inUnit:(unint64_t)a4 forDate:(id)a5
{
  objc_msgSend(a5, sel_timeIntervalSinceReferenceDate);
  uint64_t v8 = self;
  Swift::Int v10 = _NSSwiftCalendar.ordinality(of:in:for:)(a3, a4, v9);

  return v10;
}

- (id)_componentsInTimeZone:(id)a3 fromDate:(id)a4
{
  type metadata accessor for _NSSwiftTimeZone();
  uint64_t v7 = swift_dynamicCastClass();
  if (v7)
  {
    uint64_t v8 = *(void *)(v7 + OBJC_IVAR____NSSwiftTimeZone_timeZone);
    uint64_t v9 = *(void *)(v7 + OBJC_IVAR____NSSwiftTimeZone_timeZone + 8);
    swift_unknownObjectRetain();
  }
  else
  {
    type metadata accessor for _TimeZoneBridged();
    uint64_t v8 = swift_allocObject();
    *(void *)(v8 + 16) = a3;
    uint64_t v9 = _s10Foundation16_TimeZoneBridgedCAcA01_bC8ProtocolAAWlTm_0(&lazy protocol witness table cache variable for type _TimeZoneBridged and conformance _TimeZoneBridged, (void (*)(uint64_t))type metadata accessor for _TimeZoneBridged);
    id v10 = a3;
  }
  *(void *)&__dst[0] = v8;
  *((void *)&__dst[0] + 1) = v9;
  objc_msgSend(a4, sel_timeIntervalSinceReferenceDate);
  uint64_t v16 = v11;
  NSDateComponents v12 = self;
  _NSSwiftCalendar._components(in:from:)(__dst, &v16, __src);
  swift_unknownObjectRelease();

  memcpy(__dst, __src, 0x11AuLL);
  v13.super.isa = DateComponents._bridgeToObjectiveC()().super.isa;
  outlined release of DateComponents((uint64_t)__src);

  return v13.super.isa;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)debugDescription
{
  uint64_t v2 = self;
  _NSSwiftCalendar.debugDescription.getter();

  uint64_t v3 = (void *)String._bridgeToObjectiveCImpl()();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (_NSRange)minimumRangeOfUnit:(unint64_t)a3
{
  uint64_t v4 = self;
  __C::_NSRange v5 = _NSSwiftCalendar.minimumRange(of:)(a3);

  Swift::Int location = v5.location;
  Swift::Int length = v5.length;
  result.Swift::Int length = length;
  result.Swift::Int location = location;
  return result;
}

- (BOOL)rangeOfUnit:(unint64_t)a3 startDate:(id *)a4 interval:(double *)a5 forDate:(id)a6
{
  objc_msgSend(a6, sel_timeIntervalSinceReferenceDate);
  uint64_t v13 = v10;
  uint64_t v11 = self;
  LOBYTE(a5) = _NSSwiftCalendar.range(of:start:interval:for:)(a3, a4, a5, (double *)&v13);

  return a5 & 1;
}

- (BOOL)nextWeekendStartDate:(id *)a3 interval:(double *)a4 options:(unint64_t)a5 afterDate:(id)a6
{
  objc_msgSend(a6, sel_timeIntervalSinceReferenceDate);
  uint64_t v13 = v10;
  uint64_t v11 = self;
  LOBYTE(a5) = _NSSwiftCalendar.nextWeekendStart(_:interval:options:after:)(a3, a4, a5, &v13);

  return a5 & 1;
}

- (void)_enumerateDatesStartingAfterDate:(id)a3 matchingComponents:(id)a4 options:(unint64_t)a5 usingBlock:(id)a6
{
  __int16 v6 = a5;
  uint64_t v10 = _Block_copy(a6);
  objc_msgSend(a3, sel_timeIntervalSinceReferenceDate);
  uint64_t v14 = v11;
  static DateComponents._unconditionallyBridgeFromObjectiveC(_:)(a4, __src);
  memcpy(__dst, __src, 0x11AuLL);
  _Block_copy(v10);
  NSDateComponents v12 = self;
  specialized _NSSwiftCalendar._enumerateDatesStarting(after:matching:options:using:)((double *)&v14, __dst, v6, (uint64_t)v12, v10);
  _Block_release(v10);

  outlined release of DateComponents((uint64_t)__src);
  _Block_release(v10);
}

- (BOOL)date:(id)a3 matchesComponents:(id)a4
{
  objc_msgSend(a3, sel_timeIntervalSinceReferenceDate);
  uint64_t v10 = v6;
  static DateComponents._unconditionallyBridgeFromObjectiveC(_:)(a4, __src);
  memcpy(__dst, __src, 0x11AuLL);
  uint64_t v7 = self;
  LOBYTE(a4) = _NSSwiftCalendar.date(_:matchesComponents:)((double *)&v10, __dst);

  outlined release of DateComponents((uint64_t)__src);
  return a4 & 1;
}

- (void)getEra:(int64_t *)a3 year:(int64_t *)a4 month:(int64_t *)a5 day:(int64_t *)a6 fromDate:(id)a7
{
}

- (void)getEra:(int64_t *)a3 yearForWeekOfYear:(int64_t *)a4 weekOfYear:(int64_t *)a5 weekday:(int64_t *)a6 fromDate:(id)a7
{
}

- (BOOL)rangeOfWeekendStartDate:(id *)a3 interval:(double *)a4 containingDate:(id)a5
{
  objc_msgSend(a5, sel_timeIntervalSinceReferenceDate);
  uint64_t v11 = v8;
  uint64_t v9 = self;
  LOBYTE(a4) = _NSSwiftCalendar.range(ofWeekendStart:interval:containing:)(a3, (uint64_t *)a4, (double *)&v11);

  return a4 & 1;
}

- (id)nextDateAfterDate:(id)a3 matchingHour:(int64_t)a4 minute:(int64_t)a5 second:(int64_t)a6 options:(unint64_t)a7
{
  objc_msgSend(a3, sel_timeIntervalSinceReferenceDate);
  v16[0] = v11;
  NSDateComponents v12 = self;
  _NSSwiftCalendar.nextDate(after:matchingHour:minute:second:options:)(v13, (Swift::Int)v16, a4, a5, a6);

  if (v17) {
    id v14 = 0;
  }
  else {
    id v14 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F1C9C8]), sel_initWithTimeIntervalSinceReferenceDate_, *(double *)&v16[1]);
  }

  return v14;
}

- (id)dateBySettingHour:(int64_t)a3 minute:(int64_t)a4 second:(int64_t)a5 ofDate:(id)a6 options:(unint64_t)a7
{
  objc_msgSend(a6, sel_timeIntervalSinceReferenceDate);
  v16[0] = v11;
  NSDateComponents v12 = self;
  _NSSwiftCalendar.date(bySettingHour:minute:second:of:options:)(a3, a4, a5, v13, (NSCalendarOptions)v16);

  if (v17) {
    id v14 = 0;
  }
  else {
    id v14 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F1C9C8]), sel_initWithTimeIntervalSinceReferenceDate_, *(double *)&v16[1]);
  }

  return v14;
}

- (id)dateBySettingUnit:(unint64_t)a3 value:(int64_t)a4 ofDate:(id)a5 options:(unint64_t)a6
{
  return @objc _NSSwiftCalendar.date(byAdding:value:to:options:)(self, (int)a2, a3, a4, a5, a6, (void (*)(double *__return_ptr, uint64_t, uint64_t, uint64_t *, uint64_t))_NSSwiftCalendar.date(bySettingUnit:value:of:options:));
}

- (id)dateWithEra:(int64_t)a3 year:(int64_t)a4 month:(int64_t)a5 day:(int64_t)a6 hour:(int64_t)a7 minute:(int64_t)a8 second:(int64_t)a9 nanosecond:(int64_t)a10
{
  return @objc _NSSwiftCalendar.date(era:year:month:day:hour:minute:second:nanosecond:)(self, (uint64_t)a2, a3, a4, a5, a6, a7, a8, a9, a10, (void (*)(double *__return_ptr, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_NSSwiftCalendar.date(era:year:month:day:hour:minute:second:nanosecond:));
}

- (id)dateWithEra:(int64_t)a3 yearForWeekOfYear:(int64_t)a4 weekOfYear:(int64_t)a5 weekday:(int64_t)a6 hour:(int64_t)a7 minute:(int64_t)a8 second:(int64_t)a9 nanosecond:(int64_t)a10
{
  return @objc _NSSwiftCalendar.date(era:year:month:day:hour:minute:second:nanosecond:)(self, (uint64_t)a2, a3, a4, a5, a6, a7, a8, a9, a10, (void (*)(double *__return_ptr, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_NSSwiftCalendar.date(era:yearForWeekOfYear:weekOfYear:weekday:hour:minute:second:nanosecond:));
}

- (BOOL)isDate:(id)a3 equalToDate:(id)a4 toUnitGranularity:(unint64_t)a5
{
  objc_msgSend(a3, sel_timeIntervalSinceReferenceDate);
  uint64_t v13 = v7;
  objc_msgSend(a4, sel_timeIntervalSinceReferenceDate);
  uint64_t v8 = self;
  Swift::Bool v11 = _NSSwiftCalendar.isDate(_:equalTo:toUnitGranularity:)(v9, v10, (NSCalendarUnit)&v13);

  return v11;
}

- (BOOL)isDateInTomorrow:(id)a3
{
  return @objc _NSSwiftCalendar.isDateInYesterday(_:)(self, (int)a2, a3, (uint64_t (*)(uint64_t *))Calendar.isDateInTomorrow(_:));
}

@end