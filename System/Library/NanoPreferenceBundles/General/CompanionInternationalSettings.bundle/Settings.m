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
- (_TtC30CompanionInternationalSettings8Settings)init;
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

- (IPNumberFormat)numberFormat
{
  id v2 = [self currentFormat];

  return (IPNumberFormat *)v2;
}

- (void)setNumberFormat:(id)a3
{
  type metadata accessor for Settings();
  sub_16B40();
  id v5 = a3;
  v6 = self;
  sub_1F430();
  sub_1F440();
  swift_release();
  [self setFormat:v5];
  _CFLocaleResetCurrent();
  v7 = CFNotificationCenterGetDarwinNotifyCenter();
  v8 = (__CFString *)sub_1F480();
  CFNotificationCenterPostNotification(v7, v8, 0, 0, 1u);
}

- (NSString)numberFormatAsString
{
  id v2 = self;
  v3 = [(Settings *)v2 numberFormat];
  id v4 = [(IPNumberFormat *)v3 formattedNumber];

  sub_1F4B0();
  NSString v5 = sub_1F480();
  swift_bridgeObjectRelease();

  return (NSString *)v5;
}

- (void)setNumberFormatAsString:(id)a3
{
  uint64_t v4 = sub_15108(&qword_34488);
  __chkstk_darwin(v4 - 8, v5);
  v7 = &v18[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v8 = sub_15108(&qword_34470);
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8, v10);
  v12 = &v18[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v13 = sub_1F4B0();
  uint64_t v15 = v14;
  v16 = self;
  v17 = sub_16790();
  swift_bridgeObjectRetain();
  sub_15F28((uint64_t)v17, v13, v15, (uint64_t)v7);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1)
  {
    __break(1u);
  }
  else
  {
    sub_16AD8((uint64_t)v7, (uint64_t)v12);
    [(Settings *)v16 setNumberFormat:*((void *)v12 + 2)];
    sub_16A78((uint64_t)v12);
  }
}

- (PSSpecifier)numberFormatSpecifier
{
  id v2 = self;
  v3 = (void *)sub_16168();

  return (PSSpecifier *)v3;
}

- (NSString)measurementSystem
{
  sub_174F4();
  NSString v2 = sub_1F480();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (void)setMeasurementSystem:(id)a3
{
  uint64_t v4 = sub_1F4B0();
  uint64_t v6 = v5;
  v7 = self;
  sub_16C50(v4, v6);
}

- (PSSpecifier)measurementSystemSpecifier
{
  NSString v2 = self;
  v3 = (void *)sub_16ED8();

  return (PSSpecifier *)v3;
}

- (NSString)temperatureUnit
{
  sub_1826C();
  NSString v2 = sub_1F480();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (void)setTemperatureUnit:(id)a3
{
  uint64_t v4 = sub_1F4B0();
  uint64_t v6 = v5;
  v7 = self;
  sub_17A90(v4, v6);
}

- (PSSpecifier)temperatureUnitSpecifier
{
  NSString v2 = self;
  v3 = (void *)sub_17CF4();

  return (PSSpecifier *)v3;
}

- (_TtC30CompanionInternationalSettings8Settings)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for Settings();
  return [(Settings *)&v3 init];
}

- (NSString)numberingSystem
{
  sub_1ADF4();
  NSString v2 = sub_1F480();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (void)setNumberingSystem:(id)a3
{
  uint64_t v4 = sub_1F4B0();
  uint64_t v6 = v5;
  v7 = self;
  sub_1A5F8(v4, v6);
}

- (void)setFirstWeekday:(int64_t)a3
{
  uint64_t v4 = self;
  sub_1B520(a3);
}

- (NSNumber)firstWeekdayAsNSNumber
{
  sub_1575C(0, &qword_345B0);
  objc_super v3 = self;
  v4.super.super.isa = sub_1F500([(Settings *)v3 firstWeekday]).super.super.isa;

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
  NSString v2 = self;
  objc_super v3 = (void *)sub_1BAF4();

  return (PSSpecifier *)v3;
}

- (uint64_t)firstWeekday
{
  uint64_t v0 = sub_1F3E0();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0, v2);
  NSNumber v4 = (char *)&v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_15108(&qword_344A8);
  __chkstk_darwin(v5 - 8, v6);
  uint64_t v8 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_1F3A0();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v12 = __chkstk_darwin(v9, v11);
  uint64_t v14 = (char *)&v23 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12, v15);
  v17 = (char *)&v23 - v16;
  id v18 = [self preferredLocale];
  if (v18)
  {
    v19 = v18;
    sub_1F280();

    v20 = *(void (**)(char *, char *, uint64_t))(v10 + 32);
    v20(v8, v14, v9);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v8, 0, 1, v9);
    uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9);
    if (result != 1)
    {
      v20(v17, v8, v9);
      sub_1F390();
      uint64_t v22 = sub_1F3B0();
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

- (NSString)calendar
{
  sub_1EBE0();
  NSString v2 = sub_1F480();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (void)setCalendar:(id)a3
{
  uint64_t v4 = sub_1F4B0();
  uint64_t v6 = v5;
  uint64_t v7 = self;
  sub_1D888(v4, v6);
}

@end