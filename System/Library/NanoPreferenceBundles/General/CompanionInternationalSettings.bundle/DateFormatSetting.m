@interface DateFormatSetting
- (NSString)_dateFormat;
- (NSString)dateFormat;
- (PSSpecifier)dateFormatSpecifier;
- (_TtC30CompanionInternationalSettings17DateFormatSetting)init;
- (void)setDateFormat:(id)a3;
- (void)setDateFormatAndUpdateFooterTextWithDateFormat:(id)a3 specifier:(id)a4;
- (void)set_dateFormat:(id)a3;
@end

@implementation DateFormatSetting

- (_TtC30CompanionInternationalSettings17DateFormatSetting)init
{
  return (_TtC30CompanionInternationalSettings17DateFormatSetting *)sub_135B0();
}

- (NSString)_dateFormat
{
  if (*(void *)&self->_dateFormat[OBJC_IVAR____TtC30CompanionInternationalSettings17DateFormatSetting__dateFormat])
  {
    swift_bridgeObjectRetain();
    NSString v2 = sub_1F480();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v2 = 0;
  }

  return (NSString *)v2;
}

- (void)set_dateFormat:(id)a3
{
  if (a3)
  {
    uint64_t v4 = sub_1F4B0();
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v5 = 0;
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR____TtC30CompanionInternationalSettings17DateFormatSetting__dateFormat);
  uint64_t *v6 = v4;
  v6[1] = v5;

  swift_bridgeObjectRelease();
}

- (NSString)dateFormat
{
  swift_getKeyPath();
  sub_15B44(&qword_34420, (void (*)(uint64_t))type metadata accessor for DateFormatSetting);
  v3 = self;
  sub_1F400();
  swift_release();
  uint64_t v4 = *(void *)&v3->_dateFormat[OBJC_IVAR____TtC30CompanionInternationalSettings17DateFormatSetting__dateFormat];
  swift_bridgeObjectRetain();

  if (v4)
  {
    NSString v5 = sub_1F480();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v5 = 0;
  }

  return (NSString *)v5;
}

- (void)setDateFormat:(id)a3
{
  if (a3) {
    sub_1F4B0();
  }
  swift_getKeyPath();
  __chkstk_darwin();
  sub_15B44(&qword_34420, (void (*)(uint64_t))type metadata accessor for DateFormatSetting);
  uint64_t v4 = self;
  sub_1F3F0();

  swift_release();
  swift_bridgeObjectRelease();
}

- (PSSpecifier)dateFormatSpecifier
{
  NSString v2 = self;
  v3 = (void *)sub_1445C();

  return (PSSpecifier *)v3;
}

- (void)setDateFormatAndUpdateFooterTextWithDateFormat:(id)a3 specifier:(id)a4
{
  uint64_t v6 = sub_1F4B0();
  uint64_t v8 = v7;
  id v9 = a4;
  v10 = self;
  sub_15844(v6, v8, v9);

  swift_bridgeObjectRelease();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC30CompanionInternationalSettings17DateFormatSetting___observationRegistrar;
  uint64_t v4 = sub_1F420();
  NSString v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

@end