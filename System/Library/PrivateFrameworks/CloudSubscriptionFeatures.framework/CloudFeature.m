@interface CloudFeature
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CloudFeature)init;
- (CloudFeature)initWithCoder:(id)a3;
- (NSString)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CloudFeature

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  CloudFeature.encode(with:)((NSCoder)v4);
}

- (void).cxx_destruct
{
}

- (NSString)description
{
  v2 = self;
  CloudFeature.description.getter();

  v3 = (void *)sub_1A8D59BC0();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (CloudFeature)initWithCoder:(id)a3
{
  return (CloudFeature *)CloudFeature.init(coder:)(a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CloudFeature)init
{
  v3 = (char *)self + OBJC_IVAR___CloudFeature_limit;
  *(void *)v3 = 0;
  v3[8] = 1;
  id v4 = (Class *)((char *)&self->super.isa + OBJC_IVAR___CloudFeature_accessToken);
  *id v4 = 0;
  v4[1] = 0;
  v5 = (char *)self + OBJC_IVAR___CloudFeature_ttl;
  uint64_t v6 = sub_1A8D596F0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);

  result = (CloudFeature *)sub_1A8D5A1B0();
  __break(1u);
  return result;
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
    v5 = self;
  }
  char v6 = CloudFeature.isEqual(_:)((uint64_t)v8);

  sub_1A8C8DE74((uint64_t)v8, (uint64_t *)&unk_1EB5EA170);
  return v6 & 1;
}

@end