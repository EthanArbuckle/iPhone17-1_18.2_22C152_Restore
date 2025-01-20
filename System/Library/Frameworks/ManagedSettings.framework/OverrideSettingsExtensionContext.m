@interface OverrideSettingsExtensionContext
+ (id)_allowedItemPayloadClasses;
+ (id)_extensionAuxiliaryHostProtocol;
+ (id)_extensionAuxiliaryVendorProtocol;
- (_TtC15ManagedSettings32OverrideSettingsExtensionContext)init;
- (_TtC15ManagedSettings32OverrideSettingsExtensionContext)initWithInputItems:(id)a3;
- (_TtC15ManagedSettings32OverrideSettingsExtensionContext)initWithInputItems:(id)a3 contextUUID:(id)a4;
- (_TtC15ManagedSettings32OverrideSettingsExtensionContext)initWithInputItems:(id)a3 listenerEndpoint:(id)a4 contextUUID:(id)a5;
- (void)askToOverrideUnremovabilityOfApplicationWithBundleIdentifier:(id)a3 teamIdentifier:(id)a4 replyHandler:(id)a5;
@end

@implementation OverrideSettingsExtensionContext

+ (id)_extensionAuxiliaryHostProtocol
{
  return sub_1BC9B0168((uint64_t)a1, (uint64_t)a2, &qword_1E9FABD68, (void **)&qword_1E9FAE848);
}

+ (id)_extensionAuxiliaryVendorProtocol
{
  return sub_1BC9B0168((uint64_t)a1, (uint64_t)a2, &qword_1E9FABD70, (void **)&qword_1E9FAE850);
}

+ (id)_allowedItemPayloadClasses
{
  sub_1BC9A3BB8(0, &qword_1E9FACDA0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9FABF60);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_1BCA49730;
  uint64_t v3 = sub_1BC9A3BB8(0, &qword_1E9FAE868);
  *(void *)(v2 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9FAE870);
  *(void *)(v2 + 32) = v3;
  uint64_t v4 = sub_1BC9A3BB8(0, &qword_1E9FAC9B0);
  *(void *)(v2 + 88) = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9FAE878);
  *(void *)(v2 + 64) = v4;
  v5 = (void *)MEMORY[0x1C1876F90](v2);

  return v5;
}

- (void)askToOverrideUnremovabilityOfApplicationWithBundleIdentifier:(id)a3 teamIdentifier:(id)a4 replyHandler:(id)a5
{
  v6 = _Block_copy(a5);
  uint64_t v7 = sub_1BCA487E8();
  uint64_t v9 = v8;
  uint64_t v10 = sub_1BCA487E8();
  uint64_t v12 = v11;
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = v6;
  v14 = self;
  _Block_copy(v6);
  v15 = sub_1BCA3C6F8();
  if (v15)
  {
    v16 = v15;
    uint64_t v17 = swift_allocObject();
    *(void *)(v17 + 16) = sub_1BC9B1434;
    *(void *)(v17 + 24) = v13;
    v19 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, void (*)(unsigned __int8 *), uint64_t))((*MEMORY[0x1E4FBC8C8] & *v16) + 0x58);
    swift_retain();
    v19(v7, v9, v10, v12, sub_1BCA3D1A0, v17);
    swift_release();
  }
  else
  {
    sub_1BCA3D114();
    v16 = (void *)swift_allocError();
    v18 = (void *)sub_1BCA48368();
    (*((void (**)(void *, void, void *))v6 + 2))(v6, 0, v18);
  }
  swift_release();
  _Block_release(v6);

  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (_TtC15ManagedSettings32OverrideSettingsExtensionContext)init
{
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC15ManagedSettings32OverrideSettingsExtensionContext____lazy_storage___overrideSettingsHandler) = (Class)1;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for OverrideSettingsExtensionContext();
  return [(OverrideSettingsExtensionContext *)&v3 init];
}

- (_TtC15ManagedSettings32OverrideSettingsExtensionContext)initWithInputItems:(id)a3
{
  if (a3) {
    uint64_t v3 = sub_1BCA48898();
  }
  else {
    uint64_t v3 = 0;
  }
  return (_TtC15ManagedSettings32OverrideSettingsExtensionContext *)sub_1BCA3C9D8(v3);
}

- (_TtC15ManagedSettings32OverrideSettingsExtensionContext)initWithInputItems:(id)a3 contextUUID:(id)a4
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9FABE30);
  MEMORY[0x1F4188790](v6 - 8, v7);
  uint64_t v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3) {
    a3 = (id)sub_1BCA48898();
  }
  if (a4)
  {
    sub_1BCA484A8();
    uint64_t v10 = sub_1BCA484B8();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v9, 0, 1, v10);
  }
  else
  {
    uint64_t v11 = sub_1BCA484B8();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v9, 1, 1, v11);
  }
  return (_TtC15ManagedSettings32OverrideSettingsExtensionContext *)sub_1BCA3CABC((uint64_t)a3, (uint64_t)v9);
}

- (_TtC15ManagedSettings32OverrideSettingsExtensionContext)initWithInputItems:(id)a3 listenerEndpoint:(id)a4 contextUUID:(id)a5
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9FABE30);
  MEMORY[0x1F4188790](v8 - 8, v9);
  uint64_t v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3) {
    a3 = (id)sub_1BCA48898();
  }
  if (a5)
  {
    sub_1BCA484A8();
    uint64_t v12 = sub_1BCA484B8();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v11, 0, 1, v12);
  }
  else
  {
    uint64_t v13 = sub_1BCA484B8();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v11, 1, 1, v13);
  }
  id v14 = a4;
  return (_TtC15ManagedSettings32OverrideSettingsExtensionContext *)sub_1BCA3CD88((uint64_t)a3, a4, (uint64_t)v11);
}

- (void).cxx_destruct
{
  sub_1BC9B0C24(*(id *)((char *)&self->super.super.isa
                      + OBJC_IVAR____TtC15ManagedSettings32OverrideSettingsExtensionContext____lazy_storage___overrideSettingsHandler));
}

@end