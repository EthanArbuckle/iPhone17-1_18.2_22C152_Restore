@interface _EXHostConfiguration
- (BOOL)requireInvalidation;
- (NSArray)assertionAttributes;
- (NSArray)preferredLanguages;
- (NSDictionary)additionalEnvironmentVariables;
- (NSString)description;
- (NSString)sandboxProfileName;
- (RBSProcessIdentity)rbsProcessIdentity;
- (_EXExtensionIdentity)extensionIdentity;
- (_EXExtensionInstanceIdentifier)instanceIdentifier;
- (_EXExtensionRepresenting)extension;
- (_EXHostConfiguration)init;
- (_EXHostConfiguration)initWithExtension:(id)a3;
- (_EXHostConfiguration)initWithExtension:(id)a3 instanceIdentifier:(id)a4;
- (_EXHostConfiguration)initWithExtensionIdentity:(id)a3;
- (_EXHostConfiguration)initWithExtensionIdentity:(id)a3 instanceIdentifier:(id)a4;
- (_EXPersona)launchPersona;
- (id)copyWithZone:(void *)a3;
- (id)interruptionHandler;
- (void)setAdditionalEnvironmentVariables:(id)a3;
- (void)setAssertionAttributes:(id)a3;
- (void)setExtension:(id)a3;
- (void)setExtensionIdentity:(id)a3;
- (void)setInstanceIdentifier:(id)a3;
- (void)setInterruptionHandler:(id)a3;
- (void)setLaunchPersona:(id)a3;
- (void)setPreferredLanguages:(id)a3;
- (void)setRequireInvalidation:(BOOL)a3;
- (void)setSandboxProfileName:(id)a3;
@end

@implementation _EXHostConfiguration

- (void)setAssertionAttributes:(id)a3
{
  sub_191F2CAA8();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____EXHostConfiguration_assertionAttributes) = (Class)sub_191FB9ED8();

  swift_bridgeObjectRelease();
}

- (void)setLaunchPersona:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____EXHostConfiguration_launchPersona);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____EXHostConfiguration_launchPersona) = (Class)a3;
  id v3 = a3;
}

- (_EXHostConfiguration)initWithExtensionIdentity:(id)a3 instanceIdentifier:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = (_EXHostConfiguration *)sub_191F45B68(v5, v6);

  return v7;
}

- (_EXHostConfiguration)init
{
  return (_EXHostConfiguration *)sub_191F8A738();
}

- (_EXHostConfiguration)initWithExtensionIdentity:(id)a3
{
  id v4 = objc_allocWithZone((Class)type metadata accessor for _EXHostConfiguration());
  id v5 = a3;
  id v6 = (_EXHostConfiguration *)sub_191F45B68(v5, 0);

  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v6;
}

- (_EXExtensionIdentity)extensionIdentity
{
  return (_EXExtensionIdentity *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                         + OBJC_IVAR____EXHostConfiguration__extensionIdentity));
}

- (void)setExtensionIdentity:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____EXHostConfiguration__extensionIdentity);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____EXHostConfiguration__extensionIdentity) = (Class)a3;
  id v3 = a3;
}

- (id)interruptionHandler
{
  if (*(Class *)((char *)&self->super.isa + OBJC_IVAR____EXHostConfiguration_interruptionHandler))
  {
    uint64_t v2 = *(void *)&self->_extensionIdentity[OBJC_IVAR____EXHostConfiguration_interruptionHandler];
    v5[4] = *(Class *)((char *)&self->super.isa + OBJC_IVAR____EXHostConfiguration_interruptionHandler);
    v5[5] = v2;
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 1107296256;
    v5[2] = sub_191F34288;
    v5[3] = &block_descriptor_3;
    id v3 = _Block_copy(v5);
    swift_retain();
    swift_release();
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

- (void)setInterruptionHandler:(id)a3
{
  uint64_t v4 = (uint64_t)_Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v4 = swift_allocObject();
    *(void *)(v4 + 16) = v5;
    id v6 = sub_191F35668;
  }
  else
  {
    id v6 = 0;
  }
  v7 = (uint64_t (**)())((char *)self + OBJC_IVAR____EXHostConfiguration_interruptionHandler);
  uint64_t v8 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____EXHostConfiguration_interruptionHandler);
  _EXHostConfiguration *v7 = v6;
  v7[1] = (uint64_t (*)())v4;

  sub_191F45B24(v8);
}

- (_EXExtensionInstanceIdentifier)instanceIdentifier
{
  return (_EXExtensionInstanceIdentifier *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                   + OBJC_IVAR____EXHostConfiguration_instanceIdentifier));
}

- (void)setInstanceIdentifier:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____EXHostConfiguration_instanceIdentifier);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____EXHostConfiguration_instanceIdentifier) = (Class)a3;
  id v3 = a3;
}

- (NSArray)preferredLanguages
{
  if (*(Class *)((char *)&self->super.isa + OBJC_IVAR____EXHostConfiguration_preferredLanguages))
  {
    swift_bridgeObjectRetain();
    uint64_t v2 = (void *)sub_191FB9EC8();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v2 = 0;
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
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____EXHostConfiguration_preferredLanguages) = v4;

  swift_bridgeObjectRelease();
}

- (NSDictionary)additionalEnvironmentVariables
{
  swift_bridgeObjectRetain();
  uint64_t v2 = (void *)sub_191FB9D48();
  swift_bridgeObjectRelease();

  return (NSDictionary *)v2;
}

- (void)setAdditionalEnvironmentVariables:(id)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____EXHostConfiguration_additionalEnvironmentVariables) = (Class)sub_191FB9D58();

  swift_bridgeObjectRelease();
}

- (NSString)sandboxProfileName
{
  if (*(void *)&self->_extensionIdentity[OBJC_IVAR____EXHostConfiguration_sandboxProfileName])
  {
    swift_bridgeObjectRetain();
    uint64_t v2 = (void *)sub_191FB9DA8();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v2 = 0;
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
  id v6 = (uint64_t *)((char *)self + OBJC_IVAR____EXHostConfiguration_sandboxProfileName);
  *id v6 = v4;
  v6[1] = v5;

  swift_bridgeObjectRelease();
}

- (_EXPersona)launchPersona
{
  return (_EXPersona *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                               + OBJC_IVAR____EXHostConfiguration_launchPersona));
}

- (NSArray)assertionAttributes
{
  sub_191F2CAA8();
  swift_bridgeObjectRetain();
  uint64_t v2 = (void *)sub_191FB9EC8();
  swift_bridgeObjectRelease();

  return (NSArray *)v2;
}

- (BOOL)requireInvalidation
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____EXHostConfiguration_requireInvalidation);
}

- (void)setRequireInvalidation:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____EXHostConfiguration_requireInvalidation) = a3;
}

- (id)copyWithZone:(void *)a3
{
  id v3 = self;
  sub_191F8B340(v6);

  __swift_project_boxed_opaque_existential_2Tm(v6, v6[3]);
  uint64_t v4 = (void *)sub_191FBA588();
  __swift_destroy_boxed_opaque_existential_2Tm((uint64_t)v6);
  return v4;
}

- (NSString)description
{
  uint64_t v2 = self;
  sub_191F8B614();

  id v3 = (void *)sub_191FB9DA8();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (void).cxx_destruct
{
  sub_191F45B24(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____EXHostConfiguration_interruptionHandler));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  sub_191F4CB7C((uint64_t)self + OBJC_IVAR____EXHostConfiguration_networkApplicationID, &qword_1EB27BE10);
}

- (RBSProcessIdentity)rbsProcessIdentity
{
  uint64_t v2 = self;
  id v3 = (void *)sub_191F8B8D8();

  return (RBSProcessIdentity *)v3;
}

- (_EXHostConfiguration)initWithExtension:(id)a3
{
  return (_EXHostConfiguration *)sub_191F8BBEC();
}

- (_EXHostConfiguration)initWithExtension:(id)a3 instanceIdentifier:(id)a4
{
  swift_unknownObjectRetain();
  id v6 = (_EXHostConfiguration *)sub_191F8C00C((uint64_t)a3, a4);
  swift_unknownObjectRelease();
  return v6;
}

- (_EXExtensionRepresenting)extension
{
  result = *(Class *)((char *)&self->super.isa + OBJC_IVAR____EXHostConfiguration__extensionIdentity);
  if (result) {
    return result;
  }
  __break(1u);
  return result;
}

- (void)setExtension:(id)a3
{
  swift_unknownObjectRetain();
  uint64_t v4 = self;
  sub_191F8BE6C();
}

@end