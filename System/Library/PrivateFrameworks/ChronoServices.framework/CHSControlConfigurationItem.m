@interface CHSControlConfigurationItem
+ (BOOL)supportsSecureCoding;
- (BOOL)canAppearInSecureEnvironment;
- (BOOL)isEqual:(id)a3;
- (BOOL)supportsLowLuminance;
- (CHSControlConfigurationItem)init;
- (CHSControlConfigurationItem)initWithCoder:(id)a3;
- (CHSControlConfigurationItem)initWithUniqueIdentifier:(id)a3 controlIdentity:(id)a4;
- (CHSControlConfigurationItem)initWithUniqueIdentifier:(id)a3 controlIdentity:(id)a4 location:(int64_t)a5;
- (CHSControlIdentity)controlIdentity;
- (NSString)description;
- (NSString)uniqueIdentifier;
- (int64_t)hash;
- (int64_t)location;
- (unint64_t)pushPolicy;
- (unint64_t)supportedColorSchemes;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CHSControlConfigurationItem

- (NSString)uniqueIdentifier
{
  swift_bridgeObjectRetain();
  v2 = (void *)sub_190D41948();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (CHSControlIdentity)controlIdentity
{
  return (CHSControlIdentity *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                       + OBJC_IVAR___CHSControlConfigurationItem__controlIdentity));
}

- (int64_t)location
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR___CHSControlConfigurationItem_location);
}

- (unint64_t)pushPolicy
{
  return *(unint64_t *)((char *)&self->super.isa + OBJC_IVAR___CHSControlConfigurationItem__pushPolicy);
}

- (CHSControlConfigurationItem)initWithUniqueIdentifier:(id)a3 controlIdentity:(id)a4 location:(int64_t)a5
{
  uint64_t v7 = sub_190D41978();
  uint64_t v9 = v8;
  id v10 = a4;
  v11 = (CHSControlConfigurationItem *)sub_190CD4178(v7, v9, v10, a5);

  return v11;
}

- (BOOL)canAppearInSecureEnvironment
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___CHSControlConfigurationItem__canAppearInSecureEnvironment);
}

- (BOOL)supportsLowLuminance
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___CHSControlConfigurationItem__supportsLowLuminance);
}

- (unint64_t)supportedColorSchemes
{
  return *(unint64_t *)((char *)&self->super.isa + OBJC_IVAR___CHSControlConfigurationItem__supportedColorSchemes);
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_190D41E78();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  BOOL v6 = CHSControlConfigurationItem.isEqual(_:)((uint64_t)v8);

  sub_190CCE544((uint64_t)v8);
  return v6;
}

- (int64_t)hash
{
  v2 = self;
  int64_t v3 = CHSControlConfigurationItem.hash.getter();

  return v3;
}

- (NSString)description
{
  v2 = self;
  CHSControlConfigurationItem.description.getter();

  int64_t v3 = (void *)sub_190D41948();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (CHSControlConfigurationItem)initWithUniqueIdentifier:(id)a3 controlIdentity:(id)a4
{
  sub_190D41978();
  id v6 = a4;
  uint64_t v7 = (void *)sub_190D41948();
  swift_bridgeObjectRelease();
  uint64_t v8 = [(CHSControlConfigurationItem *)self initWithUniqueIdentifier:v7 controlIdentity:v6 location:0];

  return v8;
}

- (CHSControlConfigurationItem)init
{
  result = (CHSControlConfigurationItem *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  int64_t v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___CHSControlConfigurationItem__controlIdentity);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  CHSControlConfigurationItem.encode(with:)((NSCoder)v4);
}

- (CHSControlConfigurationItem)initWithCoder:(id)a3
{
  return (CHSControlConfigurationItem *)CHSControlConfigurationItem.init(coder:)(a3);
}

@end