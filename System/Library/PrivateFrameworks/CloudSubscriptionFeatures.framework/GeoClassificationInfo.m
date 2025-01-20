@interface GeoClassificationInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)expired;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (NSString)featureKey;
- (_TtC25CloudSubscriptionFeatures21GeoClassificationInfo)init;
- (_TtC25CloudSubscriptionFeatures21GeoClassificationInfo)initWithCoder:(id)a3;
- (unint64_t)status;
- (void)encodeWithCoder:(id)a3;
@end

@implementation GeoClassificationInfo

- (NSString)featureKey
{
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1A8D59BC0();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (BOOL)expired
{
  uint64_t v3 = sub_1A8D596F0();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3, v5);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = self;
  sub_1A8D596E0();
  char v9 = sub_1A8D59650();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);

  return v9 & 1;
}

- (unint64_t)status
{
  uint64_t v2 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC25CloudSubscriptionFeatures21GeoClassificationInfo_geoClassification);
  uint64_t v3 = *(void *)&self->geoClassification[OBJC_IVAR____TtC25CloudSubscriptionFeatures21GeoClassificationInfo_geoClassification];
  swift_bridgeObjectRetain();
  return sub_1A8D05A48(v2, v3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtC25CloudSubscriptionFeatures21GeoClassificationInfo)initWithCoder:(id)a3
{
  return (_TtC25CloudSubscriptionFeatures21GeoClassificationInfo *)GeoClassificationInfo.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1A8D04E94(v4);
}

- (NSString)description
{
  uint64_t v2 = self;
  sub_1A8D050EC();

  uint64_t v3 = (void *)sub_1A8D59BC0();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    id v4 = self;
    swift_unknownObjectRetain();
    sub_1A8D5A010();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    uint64_t v5 = self;
  }
  char v6 = sub_1A8D052E8((uint64_t)v8);

  sub_1A8CA2800((uint64_t)v8);
  return v6 & 1;
}

- (_TtC25CloudSubscriptionFeatures21GeoClassificationInfo)init
{
  result = (_TtC25CloudSubscriptionFeatures21GeoClassificationInfo *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  uint64_t v3 = (char *)self + OBJC_IVAR____TtC25CloudSubscriptionFeatures21GeoClassificationInfo_cacheTill;
  uint64_t v4 = sub_1A8D596F0();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
}

@end