@interface CHSControlConfiguration
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CHSControlConfiguration)init;
- (CHSControlConfiguration)initWithCoder:(id)a3;
- (CHSControlConfiguration)initWithControlItems:(id)a3;
- (NSArray)controlItems;
- (NSString)description;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setControlItems:(id)a3;
@end

@implementation CHSControlConfiguration

- (NSArray)controlItems
{
  swift_beginAccess();
  type metadata accessor for CHSControlConfigurationItem(0);
  swift_bridgeObjectRetain();
  v2 = (void *)sub_190D41BD8();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (void)setControlItems:(id)a3
{
  type metadata accessor for CHSControlConfigurationItem(0);
  uint64_t v4 = sub_190D41BE8();
  v5 = (uint64_t *)((char *)self + OBJC_IVAR___CHSControlConfiguration_controlItems);
  swift_beginAccess();
  uint64_t *v5 = v4;
  swift_bridgeObjectRelease();
}

- (CHSControlConfiguration)initWithControlItems:(id)a3
{
  type metadata accessor for CHSControlConfigurationItem(0);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___CHSControlConfiguration_controlItems) = (Class)sub_190D41BE8();
  v5.receiver = self;
  v5.super_class = (Class)CHSControlConfiguration;
  return [(CHSControlConfiguration *)&v5 init];
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    uint64_t v4 = self;
    swift_unknownObjectRetain();
    sub_190D41E78();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    objc_super v5 = self;
  }
  char v6 = CHSControlConfiguration.isEqual(_:)((uint64_t)v8);

  sub_190CCE544((uint64_t)v8);
  return v6 & 1;
}

- (int64_t)hash
{
  sub_190D423F8();
  v3 = self;
  uint64_t v4 = [(CHSControlConfiguration *)v3 controlItems];
  type metadata accessor for CHSControlConfigurationItem(0);
  unint64_t v5 = sub_190D41BE8();

  sub_190CD04CC((uint64_t)v8, v5);
  swift_bridgeObjectRelease();
  long long v12 = v8[2];
  long long v13 = v8[3];
  uint64_t v14 = v9;
  long long v10 = v8[0];
  long long v11 = v8[1];
  int64_t v6 = sub_190D423D8();

  return v6;
}

- (NSString)description
{
  v2 = self;
  CHSControlConfiguration.description.getter();

  v3 = (void *)sub_190D41948();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (CHSControlConfiguration)init
{
  result = (CHSControlConfiguration *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v5 = self;
  int64_t v6 = [(CHSControlConfiguration *)v5 controlItems];
  if (!v6)
  {
    type metadata accessor for CHSControlConfigurationItem(0);
    sub_190D41BE8();
    int64_t v6 = (NSArray *)sub_190D41BD8();
    swift_bridgeObjectRelease();
  }
  id v7 = (id)sub_190D41948();
  objc_msgSend(v4, sel_encodeObject_forKey_, v6, v7);
}

- (CHSControlConfiguration)initWithCoder:(id)a3
{
  return (CHSControlConfiguration *)CHSControlConfiguration.init(coder:)(a3);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  if (a3)
  {
    uint64_t v4 = sub_190D41978();
    int64_t v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    int64_t v6 = 0;
  }
  id v7 = self;
  v8.value._countAndFlagsBits = v4;
  v8.value._object = v6;
  object = CHSControlConfiguration.description(withMultilinePrefix:)(v8).value._object;

  swift_bridgeObjectRelease();
  if (object)
  {
    long long v10 = (void *)sub_190D41948();
    swift_bridgeObjectRelease();
  }
  else
  {
    long long v10 = 0;
  }
  return v10;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  if (a3) {
    sub_190D41978();
  }
  uint64_t v4 = self;
  id v5 = _sSo23CHSControlConfigurationC14ChronoServicesE18descriptionBuilder19withMultilinePrefixSo013BSDescriptionF0CSgSSSg_tF_0();

  swift_bridgeObjectRelease();
  return v5;
}

- (id)succinctDescription
{
  v2 = self;
  id result = [(CHSControlConfiguration *)v2 succinctDescriptionBuilder];
  if (result)
  {
    id v4 = result;
    id v5 = objc_msgSend(result, sel_build);

    if (v5)
    {
      sub_190D41978();

      int64_t v6 = (void *)sub_190D41948();
      swift_bridgeObjectRelease();
    }
    else
    {

      int64_t v6 = 0;
    }
    return v6;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (id)succinctDescriptionBuilder
{
  v2 = self;
  id v3 = CHSControlConfiguration.succinctDescriptionBuilder()();

  return v3;
}

@end