@interface JSClientObject
- (BOOL)anonymousMetrics;
- (BOOL)isBinCompat;
- (BOOL)isCatalyst;
- (NSDictionary)metricsOverlay;
- (NSString)identifier;
- (NSString)mediaIdentifier;
- (NSString)version;
- (_TtC34AppleMediaServicesUIDynamicService14JSClientObject)init;
@end

@implementation JSClientObject

- (BOOL)anonymousMetrics
{
  return sub_100014718() & 1;
}

- (NSString)identifier
{
  return (NSString *)sub_100014884(self, (uint64_t)a2, (void (*)(void))sub_100014740);
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
  sub_1000147A8();
  NSString v2 = sub_100045C00();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (NSDictionary)metricsOverlay
{
  if (sub_100014858())
  {
    v2.super.isa = sub_100045BC0().super.isa;
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
  return (NSString *)sub_100014884(self, (uint64_t)a2, (void (*)(void))sub_1000148F4);
}

- (_TtC34AppleMediaServicesUIDynamicService14JSClientObject)init
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService14JSClientObject_clientInfo));
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end