@interface AMLFeaturesDonationMetadata
+ (BOOL)supportsSecureCoding;
- (AMLFeaturesDonationMetadata)init;
- (AMLFeaturesDonationMetadata)initWithCoder:(id)a3;
- (AMLFeaturesDonationMetadata)initWithSessionId:(id)a3 metadata:(id)a4;
- (NSDictionary)metadata;
- (NSString)description;
- (NSString)sessionId;
- (id)copyWithZone:(void *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setMetadata:(id)a3;
- (void)setSessionId:(id)a3;
@end

@implementation AMLFeaturesDonationMetadata

- (NSString)description
{
  return (NSString *)sub_24777BBDC(self, (uint64_t)a2, (void (*)(void))AMLFeaturesDonationMetadata.description.getter);
}

- (NSString)sessionId
{
  return (NSString *)sub_2477A8DC8((uint64_t)self, (uint64_t)a2, (void (*)(void))sub_2477A8E18);
}

- (void)setSessionId:(id)a3
{
  uint64_t v4 = sub_2477BD6D8();
  uint64_t v6 = v5;
  v7 = self;
  sub_2477A8EB4(v4, v6);
}

- (NSDictionary)metadata
{
  if (sub_2477A8F40())
  {
    v2 = (void *)sub_2477BD688();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }

  return (NSDictionary *)v2;
}

- (void)setMetadata:(id)a3
{
  if (a3) {
    uint64_t v4 = sub_2477BD698();
  }
  else {
    uint64_t v4 = 0;
  }
  uint64_t v5 = self;
  sub_2477A8FD8(v4);
}

- (AMLFeaturesDonationMetadata)initWithSessionId:(id)a3 metadata:(id)a4
{
  uint64_t v5 = sub_2477BD6D8();
  uint64_t v7 = v6;
  if (a4) {
    uint64_t v8 = sub_2477BD698();
  }
  else {
    uint64_t v8 = 0;
  }
  return (AMLFeaturesDonationMetadata *)AMLFeaturesDonationMetadata.init(sessionId:metadata:)(v5, v7, v8);
}

- (id)copyWithZone:(void *)a3
{
  return (id)sub_2477A9218(self, (uint64_t)a2, (uint64_t)a3, (void (*)(void *__return_ptr))sub_2477A9168);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_2477A9288();
}

- (AMLFeaturesDonationMetadata)initWithCoder:(id)a3
{
  return (AMLFeaturesDonationMetadata *)AMLFeaturesDonationMetadata.init(coder:)(a3);
}

- (AMLFeaturesDonationMetadata)init
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end