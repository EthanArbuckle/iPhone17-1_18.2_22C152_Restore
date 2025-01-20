@interface IdentityProofingFeatureEnablementConfig
+ (BOOL)supportsSecureCoding;
- (_TtC13CoreIDVShared39IdentityProofingFeatureEnablementConfig)init;
- (_TtC13CoreIDVShared39IdentityProofingFeatureEnablementConfig)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation IdentityProofingFeatureEnablementConfig

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtC13CoreIDVShared39IdentityProofingFeatureEnablementConfig)initWithCoder:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  id v6 = a3;
  v7 = self;
  v8 = (void *)sub_1D7A9BF98();
  unsigned __int8 v9 = objc_msgSend(v6, sel_decodeBoolForKey_, v8);

  *((unsigned char *)&v7->super.isa
  + OBJC_IVAR____TtC13CoreIDVShared39IdentityProofingFeatureEnablementConfig_isFedStatsOptinEnabled) = v9;

  v12.receiver = v7;
  v12.super_class = ObjectType;
  v10 = [(IdentityProofingFeatureEnablementConfig *)&v12 init];

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v4 = *((unsigned __int8 *)&self->super.isa
       + OBJC_IVAR____TtC13CoreIDVShared39IdentityProofingFeatureEnablementConfig_isFedStatsOptinEnabled);
  id v5 = a3;
  id v6 = self;
  id v7 = (id)sub_1D7A9BF98();
  objc_msgSend(v5, sel_encodeBool_forKey_, v4, v7);
}

- (_TtC13CoreIDVShared39IdentityProofingFeatureEnablementConfig)init
{
  result = (_TtC13CoreIDVShared39IdentityProofingFeatureEnablementConfig *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end