@interface DateFormatSetting
- (NSString)_dateFormat;
- (NSString)dateFormat;
- (PSSpecifier)dateFormatSpecifier;
- (_TtC21InternationalSettings17DateFormatSetting)init;
- (void)setDateFormat:(id)a3;
- (void)setDateFormatAndUpdateFooterTextWithDateFormat:(id)a3 specifier:(id)a4;
- (void)set_dateFormat:(id)a3;
@end

@implementation DateFormatSetting

- (_TtC21InternationalSettings17DateFormatSetting)init
{
  return (_TtC21InternationalSettings17DateFormatSetting *)sub_16054();
}

- (NSString)_dateFormat
{
  if (*(void *)&self->_dateFormat[OBJC_IVAR____TtC21InternationalSettings17DateFormatSetting__dateFormat])
  {
    swift_bridgeObjectRetain();
    NSString v2 = sub_211F0();
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
    uint64_t v4 = sub_21220();
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v5 = 0;
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR____TtC21InternationalSettings17DateFormatSetting__dateFormat);
  uint64_t *v6 = v4;
  v6[1] = v5;

  swift_bridgeObjectRelease();
}

- (NSString)dateFormat
{
  swift_getKeyPath();
  sub_176A0();
  v3 = self;
  sub_21170();
  swift_release();
  uint64_t v4 = *(void *)&v3->_dateFormat[OBJC_IVAR____TtC21InternationalSettings17DateFormatSetting__dateFormat];
  swift_bridgeObjectRetain();

  if (v4)
  {
    NSString v5 = sub_211F0();
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
    sub_21220();
  }
  swift_getKeyPath();
  __chkstk_darwin();
  sub_176A0();
  uint64_t v4 = self;
  sub_21160();

  swift_release();
  swift_bridgeObjectRelease();
}

- (PSSpecifier)dateFormatSpecifier
{
  NSString v2 = self;
  v3 = (void *)sub_16D50();

  return (PSSpecifier *)v3;
}

- (void)setDateFormatAndUpdateFooterTextWithDateFormat:(id)a3 specifier:(id)a4
{
  uint64_t v6 = sub_21220();
  uint64_t v8 = v7;
  id v9 = a4;
  v10 = self;
  sub_17D3C(v6, v8, v9);

  swift_bridgeObjectRelease();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC21InternationalSettings17DateFormatSetting___observationRegistrar;
  uint64_t v4 = sub_21190();
  NSString v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

@end