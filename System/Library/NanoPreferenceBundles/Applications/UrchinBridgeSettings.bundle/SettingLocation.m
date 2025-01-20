@interface SettingLocation
- (BOOL)isEqual:(id)a3;
- (NSString)id;
- (NSString)name;
- (_TtC20UrchinBridgeSettings15SettingLocation)init;
- (void)setId:(id)a3;
- (void)setName:(id)a3;
@end

@implementation SettingLocation

- (NSString)id
{
  return (NSString *)sub_7614();
}

- (void)setId:(id)a3
{
}

- (NSString)name
{
  return (NSString *)sub_7614();
}

- (void)setName:(id)a3
{
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_95F0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  char v6 = sub_76CC((uint64_t)v8);

  sub_8A64((uint64_t)v8, &qword_11778);
  return v6 & 1;
}

- (_TtC20UrchinBridgeSettings15SettingLocation)init
{
  result = (_TtC20UrchinBridgeSettings15SettingLocation *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end