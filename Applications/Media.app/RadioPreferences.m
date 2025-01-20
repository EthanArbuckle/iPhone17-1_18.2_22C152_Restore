@interface RadioPreferences
- (_TtC5Media16RadioPreferences)init;
@end

@implementation RadioPreferences

- (_TtC5Media16RadioPreferences)init
{
  return (_TtC5Media16RadioPreferences *)sub_1000671D4();
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC5Media16RadioPreferences__favoriteStations;
  uint64_t v4 = sub_10000463C(&qword_1000ADF98);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_weakDestroy();

  swift_bridgeObjectRelease();
}

@end