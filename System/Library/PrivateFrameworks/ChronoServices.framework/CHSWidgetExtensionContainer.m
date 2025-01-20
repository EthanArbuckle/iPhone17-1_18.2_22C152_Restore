@interface CHSWidgetExtensionContainer
- (BOOL)isEqual:(id)a3;
- (CHSWidgetExtensionContainer)init;
- (CHSWidgetExtensionContainer)initWithExtensions:(id)a3 iconResolver:(id)a4;
- (NSArray)localExtensions;
- (NSDictionary)remoteExtensionsByDeviceIdentifier;
- (NSSet)allExtensions;
- (NSString)containerBundleIdentifier;
- (NSString)description;
- (NSString)iconVersion;
- (NSString)localizedContainerDisplayName;
- (id)extensionForExtensionIdentity:(id)a3;
- (void)getIconWithCompletion:(id)a3;
@end

@implementation CHSWidgetExtensionContainer

- (NSArray)localExtensions
{
  v2 = self;
  CHSWidgetExtensionContainer.localExtensions.getter();

  sub_190C72C5C(0, (unint64_t *)&qword_1E92AA8A0);
  v3 = (void *)sub_190D41BD8();
  swift_bridgeObjectRelease();
  return (NSArray *)v3;
}

- (CHSWidgetExtensionContainer)init
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___CHSWidgetExtensionContainer_storage) = (Class)MEMORY[0x1E4FBC860];
  id v3 = objc_allocWithZone((Class)CHSIconResolver);
  v4 = self;
  v5 = (objc_class *)objc_msgSend(v3, sel_init);
  *(Class *)((char *)&v4->super.isa + OBJC_IVAR___CHSWidgetExtensionContainer_iconResolver) = v5;

  v7.receiver = v4;
  v7.super_class = (Class)CHSWidgetExtensionContainer;
  return [(CHSWidgetExtensionContainer *)&v7 init];
}

- (NSString)containerBundleIdentifier
{
  v2 = self;
  id v3 = (void *)sub_190CDB50C();
  v4 = (char *)objc_msgSend(v3, sel_identity);

  v5 = &v4[OBJC_IVAR___CHSExtensionIdentity_containerBundleIdentifier];
  result = (NSString *)swift_beginAccess();
  if (*((void *)v5 + 1))
  {
    swift_bridgeObjectRetain();

    objc_super v7 = (void *)sub_190D41948();
    swift_bridgeObjectRelease();
    return (NSString *)v7;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (NSString)localizedContainerDisplayName
{
  v2 = self;
  id v3 = (void *)sub_190CDB50C();
  id v4 = objc_msgSend(v3, sel_containerBundleLocalizedDisplayName);

  sub_190D41978();
  v5 = (void *)sub_190D41948();
  swift_bridgeObjectRelease();
  return (NSString *)v5;
}

- (NSSet)allExtensions
{
  unint64_t v2 = swift_bridgeObjectRetain();
  sub_190CE1110(v2, (unint64_t *)&qword_1E92AA8A0, (uint64_t)off_1E56C7DC0, (unint64_t *)&qword_1E92AA8B0, (void (*)(id *, uint64_t))sub_190D12BC8);
  swift_bridgeObjectRelease();
  sub_190C72C5C(0, (unint64_t *)&qword_1E92AA8A0);
  sub_190CE1750((unint64_t *)&qword_1E92AA8B0, (unint64_t *)&qword_1E92AA8A0);
  id v3 = (void *)sub_190D41C98();
  swift_bridgeObjectRelease();
  return (NSSet *)v3;
}

- (NSDictionary)remoteExtensionsByDeviceIdentifier
{
  unint64_t v2 = self;
  CHSWidgetExtensionContainer.remoteExtensionsByDeviceIdentifier.getter();

  __swift_instantiateConcreteTypeFromMangledName(&qword_1E92ABD28);
  id v3 = (void *)sub_190D418A8();
  swift_bridgeObjectRelease();
  return (NSDictionary *)v3;
}

- (NSString)iconVersion
{
  unint64_t v2 = self;
  CHSWidgetExtensionContainer.iconVersion.getter();
  uint64_t v4 = v3;

  if (v4)
  {
    v5 = (void *)sub_190D41948();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }
  return (NSString *)v5;
}

- (void)getIconWithCompletion:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  v6 = self;
  CHSWidgetExtensionContainer.getIcon(completion:)((uint64_t)sub_190CE1678, v5);

  swift_release();
}

- (id)extensionForExtensionIdentity:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  unint64_t v6 = swift_bridgeObjectRetain();
  objc_super v7 = sub_190CE0ED4(v6);

  swift_bridgeObjectRelease();
  return v7;
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    id v4 = self;
    swift_unknownObjectRetain();
    sub_190D41E78();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    uint64_t v5 = self;
  }
  char v6 = CHSWidgetExtensionContainer.isEqual(_:)((uint64_t)v8);

  sub_190CCE544((uint64_t)v8);
  return v6 & 1;
}

- (NSString)description
{
  unint64_t v2 = self;
  result = (NSString *)_sSo27CHSWidgetExtensionContainerC14ChronoServicesE18descriptionBuilder19withMultilinePrefixSo013BSDescriptionG0CSgSSSg_tF_0();
  if (!result)
  {
    __break(1u);
    goto LABEL_7;
  }
  id v4 = result;
  id v5 = [(NSString *)result build];

  if (!v5)
  {
LABEL_7:
    __break(1u);
    return result;
  }
  sub_190D41978();

  char v6 = (void *)sub_190D41948();
  swift_bridgeObjectRelease();
  return (NSString *)v6;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
}

- (CHSWidgetExtensionContainer)initWithExtensions:(id)a3 iconResolver:(id)a4
{
  sub_190C72C5C(0, (unint64_t *)&qword_1E92AA8A0);
  unint64_t v5 = sub_190D41BE8();
  swift_unknownObjectRetain();
  return (CHSWidgetExtensionContainer *)sub_190CDCDDC(v5, (uint64_t)a4);
}

@end