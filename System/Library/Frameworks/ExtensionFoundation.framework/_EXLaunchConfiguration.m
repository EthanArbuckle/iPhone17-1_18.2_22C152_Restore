@interface _EXLaunchConfiguration
+ (BOOL)configureLaunchContext:(id)a3 error:(id *)a4;
+ (BOOL)configureRBInfoOnLaunchContext:(id)a3 error:(id *)a4;
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isLaunchConfigurationEqual:(id)a3;
- (NSArray)assertionAttributes;
- (NSArray)preferredLanguages;
- (NSDictionary)additionalEnvironmentVariables;
- (NSString)description;
- (NSString)sandboxProfileName;
- (_EXExtensionIdentity)extensionIdentity;
- (_EXExtensionInstanceIdentifier)instanceIdentifier;
- (_EXLaunchConfiguration)init;
- (_EXLaunchConfiguration)initWithCoder:(id)a3;
- (_EXLaunchConfiguration)initWithExtensionIdentity:(id)a3;
- (_EXPersona)launchPersona;
- (id)rbsProcessIdentityWithHost:(id)a3;
- (int64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAdditionalEnvironmentVariables:(id)a3;
- (void)setAssertionAttributes:(id)a3;
- (void)setInstanceIdentifier:(id)a3;
- (void)setLaunchPersona:(id)a3;
- (void)setPreferredLanguages:(id)a3;
- (void)setSandboxProfileName:(id)a3;
@end

@implementation _EXLaunchConfiguration

- (NSString)description
{
  v2 = self;
  sub_191F2B3C4();

  v3 = (void *)sub_191FB9DA8();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (int64_t)hash
{
  if (*(Class *)((char *)&self->super.isa + OBJC_IVAR____EXLaunchConfiguration_instanceIdentifier)) {
    return (int64_t)objc_msgSend(*(id *)((char *)&self->super.isa + OBJC_IVAR____EXLaunchConfiguration_instanceIdentifier), sel_hash);
  }
  else {
    return (int64_t)objc_msgSend(*(id *)((char *)&self->super.isa + OBJC_IVAR____EXLaunchConfiguration__extensionIdentity), sel_hash);
  }
}

+ (BOOL)configureRBInfoOnLaunchContext:(id)a3 error:(id *)a4
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  sub_191F4CB7C((uint64_t)self + OBJC_IVAR____EXLaunchConfiguration_networkApplicationID, &qword_1EB27BE10);
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_191FBA1E8();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  char v6 = sub_191F45E1C((uint64_t)v8);

  sub_191F4CB7C((uint64_t)v8, &qword_1EB27BDE0);
  return v6 & 1;
}

- (_EXLaunchConfiguration)initWithCoder:(id)a3
{
  id v3 = a3;
  v4 = (_EXLaunchConfiguration *)sub_191F434C4((uint64_t)v3);

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_191F33214(v4);
}

- (id)rbsProcessIdentityWithHost:(id)a3
{
  id v4 = a3;
  v5 = self;
  id v6 = sub_191F4EE80((uint64_t)v4);

  return v6;
}

+ (BOOL)configureLaunchContext:(id)a3 error:(id *)a4
{
}

- (_EXExtensionIdentity)extensionIdentity
{
  return (_EXExtensionIdentity *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                         + OBJC_IVAR____EXLaunchConfiguration__extensionIdentity));
}

- (_EXExtensionInstanceIdentifier)instanceIdentifier
{
  return (_EXExtensionInstanceIdentifier *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                   + OBJC_IVAR____EXLaunchConfiguration_instanceIdentifier));
}

- (void)setInstanceIdentifier:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____EXLaunchConfiguration_instanceIdentifier);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____EXLaunchConfiguration_instanceIdentifier) = (Class)a3;
  id v3 = a3;
}

- (NSArray)preferredLanguages
{
  if (*(Class *)((char *)&self->super.isa + OBJC_IVAR____EXLaunchConfiguration_preferredLanguages))
  {
    swift_bridgeObjectRetain();
    v2 = (void *)sub_191FB9EC8();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }

  return (NSArray *)v2;
}

- (void)setPreferredLanguages:(id)a3
{
  if (a3) {
    id v4 = (objc_class *)sub_191FB9ED8();
  }
  else {
    id v4 = 0;
  }
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____EXLaunchConfiguration_preferredLanguages) = v4;

  swift_bridgeObjectRelease();
}

- (NSString)sandboxProfileName
{
  if (*(void *)&self->_extensionIdentity[OBJC_IVAR____EXLaunchConfiguration_sandboxProfileName])
  {
    swift_bridgeObjectRetain();
    v2 = (void *)sub_191FB9DA8();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }

  return (NSString *)v2;
}

- (void)setSandboxProfileName:(id)a3
{
  if (a3)
  {
    uint64_t v4 = sub_191FB9DC8();
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v5 = 0;
  }
  id v6 = (uint64_t *)((char *)self + OBJC_IVAR____EXLaunchConfiguration_sandboxProfileName);
  *id v6 = v4;
  v6[1] = v5;

  swift_bridgeObjectRelease();
}

- (NSDictionary)additionalEnvironmentVariables
{
  swift_bridgeObjectRetain();
  v2 = (void *)sub_191FB9D48();
  swift_bridgeObjectRelease();

  return (NSDictionary *)v2;
}

- (void)setAdditionalEnvironmentVariables:(id)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____EXLaunchConfiguration_additionalEnvironmentVariables) = (Class)sub_191FB9D58();

  swift_bridgeObjectRelease();
}

- (_EXPersona)launchPersona
{
  return (_EXPersona *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                               + OBJC_IVAR____EXLaunchConfiguration_launchPersona));
}

- (void)setLaunchPersona:(id)a3
{
  id v5 = a3;
  id v6 = self;
  sub_191F932B0(a3);
}

- (NSArray)assertionAttributes
{
  sub_191F442A4(0, (unint64_t *)&qword_1E92FC498);
  swift_bridgeObjectRetain();
  v2 = (void *)sub_191FB9EC8();
  swift_bridgeObjectRelease();

  return (NSArray *)v2;
}

- (void)setAssertionAttributes:(id)a3
{
  sub_191F442A4(0, (unint64_t *)&qword_1E92FC498);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____EXLaunchConfiguration_assertionAttributes) = (Class)sub_191FB9ED8();

  swift_bridgeObjectRelease();
}

- (_EXLaunchConfiguration)initWithExtensionIdentity:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (_EXLaunchConfiguration *)sub_191F457F8(v3);

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isLaunchConfigurationEqual:(id)a3
{
  id v4 = a3;
  id v5 = self;
  LOBYTE(self) = sub_191F45F48((uint64_t)v4);

  return self & 1;
}

- (_EXLaunchConfiguration)init
{
  result = (_EXLaunchConfiguration *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end