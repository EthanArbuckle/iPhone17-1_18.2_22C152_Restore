@interface PosTaggingResult
- (_TtC21DocumentUnderstanding16PosTaggingResult)init;
- (_TtC21DocumentUnderstanding16PosTaggingResult)initWithCoder:(id)a3;
- (id)copyWithZone:(void *)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PosTaggingResult

- (id)copyWithZone:(void *)a3
{
  v3 = self;
  PosTaggingResult.copy(with:)(v6);

  sub_2367CBEE8(v6, (uint64_t)v6[3]);
  v4 = (void *)sub_23697B94C();
  sub_2367CBF2C((uint64_t)v6);
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  PosTaggingResult.encode(with:)((NSCoder)v4);
}

- (_TtC21DocumentUnderstanding16PosTaggingResult)initWithCoder:(id)a3
{
  return (_TtC21DocumentUnderstanding16PosTaggingResult *)PosTaggingResult.init(coder:)(a3);
}

- (_TtC21DocumentUnderstanding16PosTaggingResult)init
{
  return (_TtC21DocumentUnderstanding16PosTaggingResult *)PosTaggingResult.init()();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end