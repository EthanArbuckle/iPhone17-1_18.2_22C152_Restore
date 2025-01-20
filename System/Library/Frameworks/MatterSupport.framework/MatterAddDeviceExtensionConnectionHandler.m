@interface MatterAddDeviceExtensionConnectionHandler
- (BOOL)shouldAcceptXPCConnection:(id)a3;
- (_TtC13MatterSupport41MatterAddDeviceExtensionConnectionHandler)init;
- (_TtC13MatterSupport41MatterAddDeviceExtensionConnectionHandler)initWithPrincipalObject:(id)a3;
- (id)principalObject;
- (void)configureDeviceWithName:(NSString *)a3 room:(MTSDeviceSetupRoom *)a4 completionHandler:(id)a5;
- (void)fetchRoomsInHome:(MTSDeviceSetupHome *)a3 completionHandler:(id)a4;
- (void)pairDeviceInHome:(MTSDeviceSetupHome *)a3 onboardingPayload:(NSString *)a4 uuid:(NSUUID *)a5 completionHandler:(id)a6;
- (void)selectThreadNetworkFromScanResults:(NSArray *)a3 completionHandler:(id)a4;
- (void)selectWiFiNetworkFromScanResults:(NSArray *)a3 completionHandler:(id)a4;
- (void)validateDeviceCredential:(MTSDeviceCredential *)a3 completionHandler:(id)a4;
@end

@implementation MatterAddDeviceExtensionConnectionHandler

- (id)principalObject
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                 + OBJC_IVAR____TtC13MatterSupport41MatterAddDeviceExtensionConnectionHandler_extensionRequestHandler));
}

- (_TtC13MatterSupport41MatterAddDeviceExtensionConnectionHandler)initWithPrincipalObject:(id)a3
{
  swift_unknownObjectRetain();
  sub_2451329F8();
  swift_unknownObjectRelease();
  return (_TtC13MatterSupport41MatterAddDeviceExtensionConnectionHandler *)sub_245118E3C((uint64_t)&v4);
}

- (BOOL)shouldAcceptXPCConnection:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_245119038(v4);

  return 1;
}

- (void)selectWiFiNetworkFromScanResults:(NSArray *)a3 completionHandler:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268EC39D8);
  MEMORY[0x270FA5388](v7 - 8);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_245132908();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_268EC4170;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_268EC4178;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_24511DAF8((uint64_t)v9, (uint64_t)&unk_268EC4180, (uint64_t)v14);
  swift_release();
}

- (void)selectThreadNetworkFromScanResults:(NSArray *)a3 completionHandler:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268EC39D8);
  MEMORY[0x270FA5388](v7 - 8);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_245132908();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_268EC4138;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_268EC4140;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_24511DAF8((uint64_t)v9, (uint64_t)&unk_268EC4148, (uint64_t)v14);
  swift_release();
}

- (void)validateDeviceCredential:(MTSDeviceCredential *)a3 completionHandler:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268EC39D8);
  MEMORY[0x270FA5388](v7 - 8);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_245132908();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_268EC4110;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_268EC4118;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_24511DAF8((uint64_t)v9, (uint64_t)&unk_268EC4120, (uint64_t)v14);
  swift_release();
}

- (void)pairDeviceInHome:(MTSDeviceSetupHome *)a3 onboardingPayload:(NSString *)a4 uuid:(NSUUID *)a5 completionHandler:(id)a6
{
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_268EC39D8);
  MEMORY[0x270FA5388](v11 - 8);
  v13 = (char *)&v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = _Block_copy(a6);
  v15 = (void *)swift_allocObject();
  v15[2] = a3;
  v15[3] = a4;
  v15[4] = a5;
  v15[5] = v14;
  v15[6] = self;
  uint64_t v16 = sub_245132908();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v13, 1, 1, v16);
  uint64_t v17 = (void *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_268EC40E0;
  v17[5] = v15;
  v18 = (void *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = &unk_268EC40E8;
  v18[5] = v17;
  v19 = a3;
  v20 = a4;
  v21 = a5;
  v22 = self;
  sub_24511DAF8((uint64_t)v13, (uint64_t)&unk_268EC40F0, (uint64_t)v18);
  swift_release();
}

- (void)fetchRoomsInHome:(MTSDeviceSetupHome *)a3 completionHandler:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268EC39D8);
  MEMORY[0x270FA5388](v7 - 8);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_245132908();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_268EC40B0;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_268EC40B8;
  v14[5] = v13;
  v15 = a3;
  uint64_t v16 = self;
  sub_24511DAF8((uint64_t)v9, (uint64_t)&unk_268EC40C0, (uint64_t)v14);
  swift_release();
}

- (void)configureDeviceWithName:(NSString *)a3 room:(MTSDeviceSetupRoom *)a4 completionHandler:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_268EC39D8);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a5);
  v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = sub_245132908();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_268EC4058;
  v15[5] = v13;
  uint64_t v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_268EC4068;
  v16[5] = v15;
  uint64_t v17 = a3;
  v18 = a4;
  v19 = self;
  sub_24511DAF8((uint64_t)v11, (uint64_t)&unk_268EC4078, (uint64_t)v16);
  swift_release();
}

- (_TtC13MatterSupport41MatterAddDeviceExtensionConnectionHandler)init
{
  result = (_TtC13MatterSupport41MatterAddDeviceExtensionConnectionHandler *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13MatterSupport41MatterAddDeviceExtensionConnectionHandler_extensionRequestHandler));
}

@end