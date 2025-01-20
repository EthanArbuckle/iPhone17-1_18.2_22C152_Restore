@interface Settings
- (IPNumberFormat)numberFormat;
- (NSNumber)firstWeekdayAsNSNumber;
- (NSString)calendar;
- (NSString)measurementSystem;
- (NSString)numberFormatAsString;
- (NSString)numberingSystem;
- (NSString)temperatureUnit;
- (PSSpecifier)firstWeekdaySpecifier;
- (PSSpecifier)measurementSystemSpecifier;
- (PSSpecifier)numberFormatSpecifier;
- (PSSpecifier)temperatureUnitSpecifier;
- (_TtC21InternationalSettings8Settings)init;
- (uint64_t)firstWeekday;
- (void)setCalendar:(id)a3;
- (void)setFirstWeekday:(int64_t)a3;
- (void)setFirstWeekdayAsNSNumber:(id)a3;
- (void)setMeasurementSystem:(id)a3;
- (void)setNumberFormat:(id)a3;
- (void)setNumberFormatAsString:(id)a3;
- (void)setNumberingSystem:(id)a3;
- (void)setTemperatureUnit:(id)a3;
@end

@implementation Settings

- (_TtC21InternationalSettings8Settings)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for Settings();
  return [(Settings *)&v3 init];
}

- (void)setFirstWeekday:(int64_t)a3
{
  v4 = self;
  sub_17F64(a3);
}

- (NSNumber)firstWeekdayAsNSNumber
{
  sub_17C54(0, &qword_390C8);
  objc_super v3 = self;
  v4.super.super.isa = sub_21270([(Settings *)v3 firstWeekday]).super.super.isa;

  return (NSNumber *)v4.super.super.isa;
}

- (void)setFirstWeekdayAsNSNumber:(id)a3
{
  id v5 = a3;
  NSNumber v4 = self;
  -[Settings setFirstWeekday:](v4, "setFirstWeekday:", [v5 integerValue]);
}

- (PSSpecifier)firstWeekdaySpecifier
{
  v2 = self;
  objc_super v3 = (void *)sub_18538();

  return (PSSpecifier *)v3;
}

- (uint64_t)firstWeekday
{
  uint64_t v0 = sub_21150();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0, v2);
  NSNumber v4 = (char *)&v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_17654(&qword_390B8);
  __chkstk_darwin(v5 - 8, v6);
  v8 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_21110();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v12 = __chkstk_darwin(v9, v11);
  v14 = (char *)&v23 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12, v15);
  v17 = (char *)&v23 - v16;
  id v18 = [self preferredLocale];
  if (v18)
  {
    v19 = v18;
    sub_20FD0();

    v20 = *(void (**)(char *, char *, uint64_t))(v10 + 32);
    v20(v8, v14, v9);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v8, 0, 1, v9);
    uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9);
    if (result != 1)
    {
      v20(v17, v8, v9);
      sub_21100();
      uint64_t v22 = sub_21120();
      (*(void (**)(char *, uint64_t))(v1 + 8))(v4, v0);
      (*(void (**)(char *, uint64_t))(v10 + 8))(v17, v9);
      return v22;
    }
  }
  else
  {
    uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56))(v8, 1, 1, v9);
  }
  __break(1u);
  return result;
}

- (NSString)temperatureUnit
{
  sub_1A000();
  NSString v2 = sub_211F0();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (void)setTemperatureUnit:(id)a3
{
  uint64_t v4 = sub_21220();
  uint64_t v6 = v5;
  uint64_t v7 = self;
  sub_1977C(v4, v6);
}

- (PSSpecifier)temperatureUnitSpecifier
{
  NSString v2 = self;
  uint64_t v3 = (void *)sub_199E0();

  return (PSSpecifier *)v3;
}

- (IPNumberFormat)numberFormat
{
  id v2 = [self currentFormat];

  return (IPNumberFormat *)v2;
}

- (void)setNumberFormat:(id)a3
{
  type metadata accessor for Settings();
  sub_19F98();
  id v5 = a3;
  uint64_t v6 = self;
  sub_211A0();
  sub_211B0();
  swift_release();
  [self setFormat:v5];
  _CFLocaleResetCurrent();
  uint64_t v7 = CFNotificationCenterGetDarwinNotifyCenter();
  v8 = (__CFString *)sub_211F0();
  CFNotificationCenterPostNotification(v7, v8, 0, 0, 1u);
}

- (NSString)numberFormatAsString
{
  id v2 = self;
  uint64_t v3 = [(Settings *)v2 numberFormat];
  id v4 = [(IPNumberFormat *)v3 formattedNumber];

  sub_21220();
  NSString v5 = sub_211F0();
  swift_bridgeObjectRelease();

  return (NSString *)v5;
}

- (void)setNumberFormatAsString:(id)a3
{
  uint64_t v4 = sub_17654(&qword_39100);
  __chkstk_darwin(v4 - 8, v5);
  uint64_t v7 = &v18[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v8 = sub_17654(&qword_390F0);
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8, v10);
  uint64_t v12 = &v18[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v13 = sub_21220();
  uint64_t v15 = v14;
  uint64_t v16 = self;
  v17 = sub_1ACCC();
  swift_bridgeObjectRetain();
  sub_1A464((uint64_t)v17, v13, v15, (uint64_t)v7);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1)
  {
    __break(1u);
  }
  else
  {
    sub_1B014((uint64_t)v7, (uint64_t)v12);
    [(Settings *)v16 setNumberFormat:*((void *)v12 + 2)];
    sub_1AFB4((uint64_t)v12);
  }
}

- (PSSpecifier)numberFormatSpecifier
{
  id v2 = self;
  uint64_t v3 = (void *)sub_1A6A4();

  return (PSSpecifier *)v3;
}

- (NSString)calendar
{
  sub_1C034();
  NSString v2 = sub_211F0();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (void)setCalendar:(id)a3
{
  uint64_t v4 = sub_21220();
  uint64_t v6 = v5;
  uint64_t v7 = self;
  sub_1BB98(v4, v6);
}

- (NSString)numberingSystem
{
  sub_1DD94();
  NSString v2 = sub_211F0();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (void)setNumberingSystem:(id)a3
{
  uint64_t v4 = sub_21220();
  uint64_t v6 = v5;
  uint64_t v7 = self;
  sub_1C6DC(v4, v6);
}

- (NSString)measurementSystem
{
  sub_1F190();
  NSString v2 = sub_211F0();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (void)setMeasurementSystem:(id)a3
{
  uint64_t v4 = sub_21220();
  uint64_t v6 = v5;
  uint64_t v7 = self;
  sub_1E520(v4, v6);
}

- (PSSpecifier)measurementSystemSpecifier
{
  NSString v2 = self;
  uint64_t v3 = (void *)sub_1E7A8();

  return (PSSpecifier *)v3;
}

@end