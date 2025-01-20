@interface JSClientObject
- (BOOL)anonymousMetrics;
- (BOOL)isBinCompat;
- (BOOL)isCatalyst;
- (NSDictionary)metricsOverlay;
- (NSString)identifier;
- (NSString)mediaIdentifier;
- (NSString)version;
- (_TtC16UtilityExtension14JSClientObject)init;
@end

@implementation JSClientObject

- (BOOL)anonymousMetrics
{
  return sub_100015480() & 1;
}

- (NSString)identifier
{
  return (NSString *)sub_1000155EC(self, (uint64_t)a2, (void (*)(void))sub_1000154A8);
}

- (BOOL)isBinCompat
{
  return 0;
}

- (BOOL)isCatalyst
{
  return 0;
}

- (NSString)mediaIdentifier
{
  sub_100015510();
  NSString v2 = sub_100046110();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (NSDictionary)metricsOverlay
{
  if (sub_1000155C0())
  {
    v2.super.isa = sub_1000460D0().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v2.super.isa = 0;
  }
  return (NSDictionary *)v2.super.isa;
}

- (NSString)version
{
  return (NSString *)sub_1000155EC(self, (uint64_t)a2, (void (*)(void))sub_10001565C);
}

- (_TtC16UtilityExtension14JSClientObject)init
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end