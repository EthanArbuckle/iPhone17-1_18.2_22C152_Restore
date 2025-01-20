@interface IdentityLivenessConfig
+ (BOOL)supportsSecureCoding;
+ (void)setSupportsSecureCoding:(BOOL)a3;
- (_TtC13CoreIDVShared22IdentityLivenessConfig)init;
- (_TtC13CoreIDVShared22IdentityLivenessConfig)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation IdentityLivenessConfig

+ (BOOL)supportsSecureCoding
{
  return byte_1EA844040;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  byte_1EA844040 = a3;
}

- (_TtC13CoreIDVShared22IdentityLivenessConfig)initWithCoder:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  type metadata accessor for IdentityActiveLivenessConfig();
  id v6 = a3;
  v7 = self;
  *(Class *)((char *)&v7->super.isa + OBJC_IVAR____TtC13CoreIDVShared22IdentityLivenessConfig_active) = (Class)sub_1D7A9C908();
  type metadata accessor for IdentityPassiveLivenessConfig();
  *(Class *)((char *)&v7->super.isa + OBJC_IVAR____TtC13CoreIDVShared22IdentityLivenessConfig_passive) = (Class)sub_1D7A9C908();

  v10.receiver = v7;
  v10.super_class = ObjectType;
  v8 = [(IdentityLivenessConfig *)&v10 init];

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v4 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC13CoreIDVShared22IdentityLivenessConfig_active);
  id v5 = a3;
  id v6 = self;
  v7 = (void *)sub_1D7A9BF98();
  objc_msgSend(v5, sel_encodeObject_forKey_, v4, v7);

  uint64_t v8 = *(uint64_t *)((char *)&v6->super.isa + OBJC_IVAR____TtC13CoreIDVShared22IdentityLivenessConfig_passive);
  id v9 = (id)sub_1D7A9BF98();
  objc_msgSend(v5, sel_encodeObject_forKey_, v8, v9);
}

- (_TtC13CoreIDVShared22IdentityLivenessConfig)init
{
  result = (_TtC13CoreIDVShared22IdentityLivenessConfig *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13CoreIDVShared22IdentityLivenessConfig_passive);
}

@end