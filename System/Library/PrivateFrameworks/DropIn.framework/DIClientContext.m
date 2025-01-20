@interface DIClientContext
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (DIClientContext)init;
- (DIClientContext)initWithCoder:(id)a3;
- (DIClientContext)initWithHomeIdentifier:(id)a3;
- (NSString)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DIClientContext

- (DIClientContext)initWithHomeIdentifier:(id)a3
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B184D80);
  MEMORY[0x270FA5388](v4 - 8);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    sub_24D044238();
    uint64_t v7 = sub_24D044258();
    uint64_t v8 = 0;
  }
  else
  {
    uint64_t v7 = sub_24D044258();
    uint64_t v8 = 1;
  }
  __swift_storeEnumTagSinglePayload((uint64_t)v6, v8, 1, v7);
  return (DIClientContext *)ClientContext.init(homeIdentifier:)((uint64_t)v6);
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    uint64_t v4 = self;
    swift_unknownObjectRetain();
    sub_24D044788();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    uint64_t v5 = self;
  }
  char v6 = ClientContext.isEqual(_:)((uint64_t)v8);

  sub_24D021ED8((uint64_t)v8, &qword_26B184A70);
  return v6 & 1;
}

- (NSString)description
{
  v2 = self;
  ClientContext.description.getter();

  v3 = (void *)sub_24D0443F8();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  ClientContext.encode(with:)((NSCoder)v4);
}

- (DIClientContext)initWithCoder:(id)a3
{
  return (DIClientContext *)ClientContext.init(coder:)(a3);
}

- (DIClientContext)init
{
}

- (void).cxx_destruct
{
}

@end