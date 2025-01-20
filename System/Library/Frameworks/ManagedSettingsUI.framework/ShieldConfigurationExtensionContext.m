@interface ShieldConfigurationExtensionContext
+ (id)_extensionAuxiliaryHostProtocol;
+ (id)_extensionAuxiliaryVendorProtocol;
- (_TtC17ManagedSettingsUI35ShieldConfigurationExtensionContext)init;
- (_TtC17ManagedSettingsUI35ShieldConfigurationExtensionContext)initWithInputItems:(id)a3;
- (_TtC17ManagedSettingsUI35ShieldConfigurationExtensionContext)initWithInputItems:(id)a3 contextUUID:(id)a4;
- (_TtC17ManagedSettingsUI35ShieldConfigurationExtensionContext)initWithInputItems:(id)a3 listenerEndpoint:(id)a4 contextUUID:(id)a5;
- (void)fetchConfigurationDataForApplication:(id)a3 localizedApplicationDisplayName:(id)a4 categoryTokenData:(id)a5 localizedCategoryDisplayName:(id)a6 replyHandler:(id)a7;
- (void)fetchConfigurationDataForApplication:(id)a3 tokenData:(id)a4 localizedDisplayName:(id)a5 replyHandler:(id)a6;
- (void)fetchConfigurationDataForWebDomain:(id)a3 categoryTokenData:(id)a4 localizedDisplayName:(id)a5 replyHandler:(id)a6;
- (void)fetchConfigurationDataForWebDomain:(id)a3 tokenData:(id)a4 replyHandler:(id)a5;
@end

@implementation ShieldConfigurationExtensionContext

+ (id)_extensionAuxiliaryHostProtocol
{
  return sub_226BBAE08((uint64_t)a1, (uint64_t)a2, &qword_268155F08, (void **)&qword_268155F48);
}

+ (id)_extensionAuxiliaryVendorProtocol
{
  return sub_226BBAE08((uint64_t)a1, (uint64_t)a2, &qword_268155F10, (void **)&qword_268155F50);
}

- (void)fetchConfigurationDataForApplication:(id)a3 tokenData:(id)a4 localizedDisplayName:(id)a5 replyHandler:(id)a6
{
}

- (void)fetchConfigurationDataForApplication:(id)a3 localizedApplicationDisplayName:(id)a4 categoryTokenData:(id)a5 localizedCategoryDisplayName:(id)a6 replyHandler:(id)a7
{
  v11 = _Block_copy(a7);
  uint64_t v25 = sub_226BBE5C0();
  uint64_t v13 = v12;
  if (a4)
  {
    uint64_t v14 = sub_226BBE5C0();
    a4 = v15;
  }
  else
  {
    uint64_t v14 = 0;
  }
  id v16 = a5;
  id v17 = a6;
  v18 = self;
  uint64_t v19 = sub_226BBE490();
  unint64_t v21 = v20;

  uint64_t v22 = sub_226BBE5C0();
  uint64_t v24 = v23;

  _Block_copy(v11);
  sub_226BBD2CC(v25, v13, v14, (uint64_t)a4, v19, v21, v22, v24, (uint64_t)v18, v11);
  _Block_release(v11);
  _Block_release(v11);
  swift_bridgeObjectRelease();
  sub_226BBDEC4(v19, v21);

  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)fetchConfigurationDataForWebDomain:(id)a3 tokenData:(id)a4 replyHandler:(id)a5
{
  v7 = _Block_copy(a5);
  uint64_t v8 = sub_226BBE5C0();
  uint64_t v10 = v9;
  id v11 = a4;
  uint64_t v12 = self;
  uint64_t v13 = sub_226BBE490();
  unint64_t v15 = v14;

  _Block_copy(v7);
  sub_226BBD784(v8, v10, v13, v15, (uint64_t)v12, v7);
  _Block_release(v7);
  _Block_release(v7);
  sub_226BBDEC4(v13, v15);

  swift_bridgeObjectRelease();
}

- (void)fetchConfigurationDataForWebDomain:(id)a3 categoryTokenData:(id)a4 localizedDisplayName:(id)a5 replyHandler:(id)a6
{
}

- (_TtC17ManagedSettingsUI35ShieldConfigurationExtensionContext)init
{
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC17ManagedSettingsUI35ShieldConfigurationExtensionContext____lazy_storage___shieldConfigurationDataSource) = (Class)1;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ShieldConfigurationExtensionContext();
  return [(ShieldConfigurationExtensionContext *)&v3 init];
}

- (_TtC17ManagedSettingsUI35ShieldConfigurationExtensionContext)initWithInputItems:(id)a3
{
  if (a3) {
    uint64_t v3 = sub_226BBE600();
  }
  else {
    uint64_t v3 = 0;
  }
  return (_TtC17ManagedSettingsUI35ShieldConfigurationExtensionContext *)sub_226BBB91C(v3);
}

- (_TtC17ManagedSettingsUI35ShieldConfigurationExtensionContext)initWithInputItems:(id)a3 contextUUID:(id)a4
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268155F60);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3) {
    a3 = (id)sub_226BBE600();
  }
  if (a4)
  {
    sub_226BBE4B0();
    uint64_t v9 = sub_226BBE4C0();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v8, 0, 1, v9);
  }
  else
  {
    uint64_t v10 = sub_226BBE4C0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v8, 1, 1, v10);
  }
  return (_TtC17ManagedSettingsUI35ShieldConfigurationExtensionContext *)sub_226BBBA00((uint64_t)a3, (uint64_t)v8);
}

- (_TtC17ManagedSettingsUI35ShieldConfigurationExtensionContext)initWithInputItems:(id)a3 listenerEndpoint:(id)a4 contextUUID:(id)a5
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_268155F60);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3) {
    a3 = (id)sub_226BBE600();
  }
  if (a5)
  {
    sub_226BBE4B0();
    uint64_t v11 = sub_226BBE4C0();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v10, 0, 1, v11);
  }
  else
  {
    uint64_t v12 = sub_226BBE4C0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v10, 1, 1, v12);
  }
  id v13 = a4;
  return (_TtC17ManagedSettingsUI35ShieldConfigurationExtensionContext *)sub_226BBBCDC((uint64_t)a3, a4, (uint64_t)v10);
}

- (void).cxx_destruct
{
  sub_226BBC040(*(id *)((char *)&self->super.super.isa
                      + OBJC_IVAR____TtC17ManagedSettingsUI35ShieldConfigurationExtensionContext____lazy_storage___shieldConfigurationDataSource));
}

@end