@interface SNDetectSoundRequest
+ (BOOL)supportsSecureCoding;
+ (NSArray)allValidDetectorIdentifiers;
+ (NSArray)allValidSoundIdentifiers;
+ (id)eagerlyAllocateModelsForRequest:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (MLModelConfiguration)modelConfiguration;
- (NSString)description;
- (NSString)soundIdentifier;
- (SNDetectSoundRequest)init;
- (SNDetectSoundRequest)initWithCoder:(id)a3;
- (SNDetectSoundRequest)initWithDetectorIdentifier:(id)a3 error:(id *)a4;
- (SNDetectSoundRequest)initWithMLModel:(id)a3 error:(id *)a4;
- (SNDetectSoundRequest)initWithSoundIdentifier:(id)a3;
- (SNDetectSoundRequest)initWithSoundIdentifier:(id)a3 shouldUseTwoPassDetection:(BOOL)a4;
- (SNDetectSoundRequest)initWithVGGishBasedMLModel:(id)a3 soundIdentifier:(id)a4;
- (id)copyWithZone:(void *)a3;
- (int64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setModelConfiguration:(id)a3;
- (void)setSoundIdentifier:(id)a3;
@end

@implementation SNDetectSoundRequest

+ (NSArray)allValidSoundIdentifiers
{
  return (NSArray *)sub_1DC8C73B8((uint64_t)a1, (uint64_t)a2, (void (*)(void))sub_1DC8C72AC, type metadata accessor for SNSoundIdentifier);
}

+ (NSArray)allValidDetectorIdentifiers
{
  return (NSArray *)sub_1DC8C73B8((uint64_t)a1, (uint64_t)a2, (void (*)(void))sub_1DC8C741C, type metadata accessor for SNDetectorIdentifier);
}

- (NSString)soundIdentifier
{
  v2 = self;
  v3 = (void *)sub_1DC8C7690();

  return (NSString *)v3;
}

- (void)setSoundIdentifier:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1DC8C7738(v4);
}

- (MLModelConfiguration)modelConfiguration
{
  v2 = self;
  id v3 = sub_1DC8C77D8();

  return (MLModelConfiguration *)v3;
}

- (void)setModelConfiguration:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1DC8C78F8(v4);
}

- (SNDetectSoundRequest)init
{
}

- (id)copyWithZone:(void *)a3
{
  id v3 = self;
  SNDetectSoundRequest.copy(with:)(v6);

  sub_1DC881A8C(v6, v6[3]);
  id v4 = (void *)sub_1DCB89008();
  sub_1DC8818D0((uint64_t)v6);
  return v4;
}

- (int64_t)hash
{
  v2 = self;
  int64_t v3 = SNDetectSoundRequest.hash.getter();

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    id v4 = self;
    swift_unknownObjectRetain();
    sub_1DCB88808();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  char v6 = SNDetectSoundRequest.isEqual(_:)((uint64_t)v8);

  sub_1DC881978((uint64_t)v8);
  return v6 & 1;
}

- (SNDetectSoundRequest)initWithCoder:(id)a3
{
  return (SNDetectSoundRequest *)SNDetectSoundRequest.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  SNDetectSoundRequest.encode(with:)((NSCoder)v4);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SNDetectSoundRequest)initWithSoundIdentifier:(id)a3 shouldUseTwoPassDetection:(BOOL)a4
{
  return (SNDetectSoundRequest *)sub_1DC8C8194(a3);
}

- (SNDetectSoundRequest)initWithSoundIdentifier:(id)a3
{
  return (SNDetectSoundRequest *)sub_1DC8C8200(a3);
}

- (SNDetectSoundRequest)initWithDetectorIdentifier:(id)a3 error:(id *)a4
{
  return (SNDetectSoundRequest *)sub_1DC8C8A2C((uint64_t)self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(void *))sub_1DC8C84CC);
}

- (SNDetectSoundRequest)initWithVGGishBasedMLModel:(id)a3 soundIdentifier:(id)a4
{
  return (SNDetectSoundRequest *)sub_1DC8C8668((uint64_t)a3, a4);
}

- (SNDetectSoundRequest)initWithMLModel:(id)a3 error:(id *)a4
{
  return (SNDetectSoundRequest *)sub_1DC8C8A2C((uint64_t)self, (uint64_t)a2, a3, (uint64_t)a4, sub_1DC8C8778);
}

- (NSString)description
{
  v2 = self;
  SNDetectSoundRequest.description.getter();

  int64_t v3 = (void *)sub_1DCB87908();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

+ (id)eagerlyAllocateModelsForRequest:(id)a3 error:(id *)a4
{
  id v4 = a3;
  sub_1DC8C8C1C(v7);

  sub_1DC881A8C(v7, v7[3]);
  v5 = (void *)sub_1DCB89008();
  sub_1DC8818D0((uint64_t)v7);

  return v5;
}

- (void).cxx_destruct
{
  sub_1DC882BC4(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___SNDetectSoundRequest_impl), *(void *)&self->impl[OBJC_IVAR___SNDetectSoundRequest_impl], self->impl[OBJC_IVAR___SNDetectSoundRequest_impl + 8]);

  swift_bridgeObjectRelease();
}

@end