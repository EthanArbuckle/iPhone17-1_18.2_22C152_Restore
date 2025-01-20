uint64_t Logger.daemon.unsafeMutableAddressor()
{
  return sub_24F923324(&qword_269A33BE0, (uint64_t)static Logger.daemon);
}

uint64_t gp_isInternalBuild()
{
  if (gp_isInternalBuild_onceToken != -1) {
    dispatch_once(&gp_isInternalBuild_onceToken, &__block_literal_global_1);
  }
  return gp_isInternalBuild_isInternalBuild;
}

uint64_t sub_24F923324(void *a1, uint64_t a2)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_24F93C918();
  return __swift_project_value_buffer(v3, a2);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

id _gpBundle()
{
  if (_gpBundle_onceToken != -1) {
    dispatch_once(&_gpBundle_onceToken, &__block_literal_global);
  }
  v0 = (void *)_bundle;
  return v0;
}

uint64_t ___gpBundle_block_invoke()
{
  _bundle = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  return MEMORY[0x270F9A758]();
}

id _gpConvertStringToLocalizedString(void *a1)
{
  id v1 = a1;
  v2 = _gpBundle();
  uint64_t v3 = [v2 localizedStringForKey:v1 value:&stru_270111AC0 table:@"Localizable"];

  return v3;
}

uint64_t currentSourceVersion()
{
  if (currentSourceVersion_onceToken != -1) {
    dispatch_once(&currentSourceVersion_onceToken, &__block_literal_global_0);
  }
  return currentSourceVersion_versionStruct;
}

int8x8_t __currentSourceVersion_block_invoke()
{
  v0 = (unsigned int *)dyld_image_header_containing_address();
  uint64_t v1 = *v0;
  if (v1 != -17958193)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"GamePolicy Mach-O header has incorrect magic: %x", v1);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)MEMORY[0x263EFF940];
    uint64_t v5 = *MEMORY[0x263EFF498];
LABEL_7:
    id v7 = [v4 exceptionWithName:v5 reason:v6 userInfo:0];
    objc_exception_throw(v7);
  }
  unsigned int v2 = v0[4];
  if (!v2)
  {
LABEL_6:
    v4 = (void *)MEMORY[0x263EFF940];
    uint64_t v5 = *MEMORY[0x263EFF498];
    v6 = @"GamePolicy Mach-O is missing LC_SOURCE_VERSION";
    goto LABEL_7;
  }
  uint64_t v3 = v0 + 8;
  while (*v3 != 42)
  {
    uint64_t v3 = (unsigned int *)((char *)v3 + v3[1]);
    if (!--v2) {
      goto LABEL_6;
    }
  }
  unint64_t v8 = *((void *)v3 + 1);
  int8x8_t result = vand_s8((int8x8_t)vmovn_s64((int64x2_t)vshlq_u64((uint64x2_t)vdupq_n_s64(v8), (uint64x2_t)xmmword_24F93D880)), (int8x8_t)0x3FF007FFFFFLL);
  currentSourceVersion_versionStruct = (uint64_t)result;
  dword_269A34128 = (v8 >> 20) & 0x3FF;
  return result;
}

uint64_t __gp_isInternalBuild_block_invoke()
{
  uint64_t result = os_variant_has_internal_diagnostics();
  gp_isInternalBuild_isInternalBuild = result;
  return result;
}

id getGPLogger()
{
  if (getGPLogger_onceToken != -1) {
    dispatch_once(&getGPLogger_onceToken, &__block_literal_global_3);
  }
  v0 = (void *)gpLogger;
  return v0;
}

uint64_t __getGPLogger_block_invoke()
{
  gpLogger = (uint64_t)os_log_create("com.apple.GamePolicy", "default");
  return MEMORY[0x270F9A758]();
}

unint64_t ConsoleModeEnablementStrategy.init(rawValue:)(unint64_t a1)
{
  return sub_24F924650(a1);
}

BOOL sub_24F9243A0(void *a1, void *a2)
{
  return *a1 == *a2;
}

uint64_t sub_24F9243B4()
{
  return sub_24F93CC38();
}

uint64_t sub_24F9243FC()
{
  return sub_24F93CC28();
}

uint64_t sub_24F924428()
{
  return sub_24F93CC38();
}

unint64_t sub_24F92446C@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result = sub_24F924650(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

void sub_24F9244A0(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t variable initialization expression of DynamicSplitterStatus.Config.enablementDate@<X0>(uint64_t a1@<X8>)
{
  return sub_24F9245DC(MEMORY[0x263F07490], a1);
}

uint64_t variable initialization expression of DynamicSplitterStatus.Config.disablementDate@<X0>(uint64_t a1@<X8>)
{
  return sub_24F9245DC(MEMORY[0x263F07490], a1);
}

uint64_t variable initialization expression of DynamicSplitterStatus.$__lazy_storage_$_config@<X0>(uint64_t a1@<X8>)
{
  return sub_24F9245DC(type metadata accessor for DynamicSplitterStatus.Config, a1);
}

uint64_t variable initialization expression of ModelManagerGameAssertionStatus.Config.policy()
{
  return 2;
}

uint64_t variable initialization expression of ModelManagerGameAssertionStatus.Config.enablementDate@<X0>(uint64_t a1@<X8>)
{
  return sub_24F9245DC(MEMORY[0x263F07490], a1);
}

uint64_t variable initialization expression of ModelManagerGameAssertionStatus.Config.disablementDate@<X0>(uint64_t a1@<X8>)
{
  return sub_24F9245DC(MEMORY[0x263F07490], a1);
}

uint64_t variable initialization expression of ModelManagerGameAssertionStatus.policy()
{
  return 2;
}

uint64_t variable initialization expression of ModelManagerGameAssertionStatus.$__lazy_storage_$_config@<X0>(uint64_t a1@<X8>)
{
  return sub_24F9245DC(type metadata accessor for ModelManagerGameAssertionStatus.Config, a1);
}

uint64_t variable initialization expression of SustainedExecutionStatus.Config.enablementDate@<X0>(uint64_t a1@<X8>)
{
  return sub_24F9245DC(MEMORY[0x263F07490], a1);
}

uint64_t variable initialization expression of SustainedExecutionStatus.Config.disablementDate@<X0>(uint64_t a1@<X8>)
{
  return sub_24F9245DC(MEMORY[0x263F07490], a1);
}

uint64_t variable initialization expression of SustainedExecutionStatus.$__lazy_storage_$_config@<X0>(uint64_t a1@<X8>)
{
  return sub_24F9245DC(type metadata accessor for SustainedExecutionStatus.Config, a1);
}

uint64_t variable initialization expression of GameModeStatus.Config.enablementDate@<X0>(uint64_t a1@<X8>)
{
  return sub_24F9245DC(MEMORY[0x263F07490], a1);
}

uint64_t variable initialization expression of GameModeStatus.Config.disablementDate@<X0>(uint64_t a1@<X8>)
{
  return sub_24F9245DC(MEMORY[0x263F07490], a1);
}

uint64_t variable initialization expression of GameModeStatus.$__lazy_storage_$_config@<X0>(uint64_t a1@<X8>)
{
  return sub_24F9245DC(type metadata accessor for GameModeStatus.Config, a1);
}

uint64_t sub_24F9245DC@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = a1(0);
  char v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 56);
  return v4(a2, 1, 1, v3);
}

unint64_t sub_24F924650(unint64_t result)
{
  if (result > 3) {
    return 0;
  }
  return result;
}

unint64_t sub_24F924664()
{
  unint64_t result = qword_269A33C40;
  if (!qword_269A33C40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A33C40);
  }
  return result;
}

ValueMetadata *type metadata accessor for ConsoleModeEnablementStrategy()
{
  return &type metadata for ConsoleModeEnablementStrategy;
}

uint64_t sub_24F9246C8(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

__n128 __swift_memcpy32_4(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t sub_24F92470C(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 32)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_24F92472C(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)__n128 result = (a2 - 1);
    *(void *)(result + 8) = 0;
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 32) = v3;
  return result;
}

void type metadata accessor for audit_token_t()
{
  if (!qword_269A33C48)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_269A33C48);
    }
  }
}

id static GamePolicyAppXPC.GamePolicyAppServerInterface()()
{
  return sub_24F9247D4(&protocolRef__TtP10GamePolicy19GamePolicyAppServer_);
}

id static GamePolicyAppXPC.GamePolicyAppClientInterface()()
{
  return sub_24F9247D4(&protocolRef__TtP10GamePolicy19GamePolicyAppClient_);
}

id sub_24F9247D4(void *a1)
{
  id v1 = objc_msgSend(self, sel_interfaceWithProtocol_, *a1);
  return v1;
}

id sub_24F924830(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = objc_msgSend(self, sel_interfaceWithProtocol_, *a3);
  return v3;
}

id GamePolicyAppXPC.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

id GamePolicyAppXPC.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for GamePolicyAppXPC();
  return objc_msgSendSuper2(&v2, sel_init);
}

uint64_t type metadata accessor for GamePolicyAppXPC()
{
  return self;
}

id GamePolicyAppXPC.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for GamePolicyAppXPC();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t DynamicSplitterStatus.Config.enabled.getter()
{
  return *v0;
}

uint64_t DynamicSplitterStatus.Config.enabled.setter(uint64_t result)
{
  *id v1 = result;
  return result;
}

uint64_t (*DynamicSplitterStatus.Config.enabled.modify())()
{
  return nullsub_1;
}

uint64_t DynamicSplitterStatus.Config.enablementDate.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for DynamicSplitterStatus.Config(0);
  return sub_24F925458(v1 + *(int *)(v3 + 20), a1, &qword_269A33C50);
}

uint64_t type metadata accessor for DynamicSplitterStatus.Config(uint64_t a1)
{
  return sub_24F925200(a1, qword_269A33D08);
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t DynamicSplitterStatus.Config.enablementDate.setter(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for DynamicSplitterStatus.Config(0);
  return sub_24F9257E4(a1, v1 + *(int *)(v3 + 20), &qword_269A33C50);
}

uint64_t (*DynamicSplitterStatus.Config.enablementDate.modify())()
{
  return nullsub_1;
}

uint64_t DynamicSplitterStatus.Config.disablementDate.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for DynamicSplitterStatus.Config(0);
  return sub_24F925458(v1 + *(int *)(v3 + 24), a1, &qword_269A33C50);
}

uint64_t DynamicSplitterStatus.Config.disablementDate.setter(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for DynamicSplitterStatus.Config(0);
  return sub_24F9257E4(a1, v1 + *(int *)(v3 + 24), &qword_269A33C50);
}

uint64_t (*DynamicSplitterStatus.Config.disablementDate.modify())()
{
  return nullsub_1;
}

uint64_t DynamicSplitterStatus.Config.deviceSupported.getter()
{
  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for DynamicSplitterStatus.Config(0) + 28));
}

uint64_t DynamicSplitterStatus.Config.deviceSupported.setter(char a1)
{
  uint64_t result = type metadata accessor for DynamicSplitterStatus.Config(0);
  *(unsigned char *)(v1 + *(int *)(result + 28)) = a1;
  return result;
}

uint64_t (*DynamicSplitterStatus.Config.deviceSupported.modify())()
{
  return nullsub_1;
}

uint64_t DynamicSplitterStatus.Config.impactedBundleIdentifiers.getter()
{
  type metadata accessor for DynamicSplitterStatus.Config(0);
  return swift_bridgeObjectRetain();
}

uint64_t DynamicSplitterStatus.Config.impactedBundleIdentifiers.setter(uint64_t a1)
{
  uint64_t v3 = *(int *)(type metadata accessor for DynamicSplitterStatus.Config(0) + 32);
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + v3) = a1;
  return result;
}

uint64_t (*DynamicSplitterStatus.Config.impactedBundleIdentifiers.modify())()
{
  return nullsub_1;
}

uint64_t DynamicSplitterStatus.Config.previouslyImpactedBundleIdentifiers.getter()
{
  type metadata accessor for DynamicSplitterStatus.Config(0);
  return swift_bridgeObjectRetain();
}

uint64_t DynamicSplitterStatus.Config.previouslyImpactedBundleIdentifiers.setter(uint64_t a1)
{
  uint64_t v3 = *(int *)(type metadata accessor for DynamicSplitterStatus.Config(0) + 36);
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + v3) = a1;
  return result;
}

uint64_t (*DynamicSplitterStatus.Config.previouslyImpactedBundleIdentifiers.modify())()
{
  return nullsub_1;
}

uint64_t DynamicSplitterStatus.Config.enablementStrategy.getter()
{
  return *(void *)(v0 + *(int *)(type metadata accessor for DynamicSplitterStatus.Config(0) + 40));
}

uint64_t DynamicSplitterStatus.Config.enablementStrategy.setter(uint64_t a1)
{
  uint64_t result = type metadata accessor for DynamicSplitterStatus.Config(0);
  *(void *)(v1 + *(int *)(result + 40)) = a1;
  return result;
}

uint64_t (*DynamicSplitterStatus.Config.enablementStrategy.modify())()
{
  return nullsub_1;
}

uint64_t DynamicSplitterStatus.Config.init(enabled:enablementDate:disablementDate:deviceSupported:impactedBundleIdentifiers:previouslyImpactedBundleIdentifiers:enablementStrategy:)@<X0>(char a1@<W0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char a4@<W3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, unsigned char *a8@<X8>)
{
  v12 = (int *)type metadata accessor for DynamicSplitterStatus.Config(0);
  uint64_t v13 = (uint64_t)&a8[v12[5]];
  uint64_t v14 = sub_24F93C8F8();
  v15 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56);
  v15(v13, 1, 1, v14);
  uint64_t v16 = (uint64_t)&a8[v12[6]];
  v15(v16, 1, 1, v14);
  *a8 = a1;
  sub_24F9257E4(a2, v13, &qword_269A33C50);
  uint64_t result = sub_24F9257E4(a3, v16, &qword_269A33C50);
  a8[v12[7]] = a4;
  *(void *)&a8[v12[8]] = a5;
  *(void *)&a8[v12[9]] = a6;
  *(void *)&a8[v12[10]] = a7;
  return result;
}

uint64_t DynamicSplitterStatus.enabled.getter()
{
  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC10GamePolicy21DynamicSplitterStatus_enabled);
}

uint64_t DynamicSplitterStatus.enablementDate.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_24F925458(v1 + OBJC_IVAR____TtC10GamePolicy21DynamicSplitterStatus_enablementDate, a1, &qword_269A33C50);
}

uint64_t DynamicSplitterStatus.disablementDate.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_24F925458(v1 + OBJC_IVAR____TtC10GamePolicy21DynamicSplitterStatus_disablementDate, a1, &qword_269A33C50);
}

uint64_t DynamicSplitterStatus.deviceSupported.getter()
{
  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC10GamePolicy21DynamicSplitterStatus_deviceSupported);
}

uint64_t DynamicSplitterStatus.impactedBundleIdentifiers.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t DynamicSplitterStatus.previouslyImpactedBundleIdentifiers.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t DynamicSplitterStatus.enablementStrategy.getter()
{
  return *(void *)(v0 + OBJC_IVAR____TtC10GamePolicy21DynamicSplitterStatus_enablementStrategy);
}

id DynamicSplitterStatus.__allocating_init(config:)(unsigned char *a1)
{
  id v3 = objc_allocWithZone(v1);
  return DynamicSplitterStatus.init(config:)(a1);
}

id DynamicSplitterStatus.init(config:)(unsigned char *a1)
{
  id v3 = &v1[OBJC_IVAR____TtC10GamePolicy21DynamicSplitterStatus____lazy_storage___config];
  char v4 = (int *)type metadata accessor for DynamicSplitterStatus.Config(0);
  (*(void (**)(char *, uint64_t, uint64_t, int *))(*((void *)v4 - 1) + 56))(v3, 1, 1, v4);
  v1[OBJC_IVAR____TtC10GamePolicy21DynamicSplitterStatus_enabled] = *a1;
  sub_24F925458((uint64_t)&a1[v4[5]], (uint64_t)&v1[OBJC_IVAR____TtC10GamePolicy21DynamicSplitterStatus_enablementDate], &qword_269A33C50);
  sub_24F925458((uint64_t)&a1[v4[6]], (uint64_t)&v1[OBJC_IVAR____TtC10GamePolicy21DynamicSplitterStatus_disablementDate], &qword_269A33C50);
  v1[OBJC_IVAR____TtC10GamePolicy21DynamicSplitterStatus_deviceSupported] = a1[v4[7]];
  *(void *)&v1[OBJC_IVAR____TtC10GamePolicy21DynamicSplitterStatus_impactedBundleIdentifiers] = *(void *)&a1[v4[8]];
  *(void *)&v1[OBJC_IVAR____TtC10GamePolicy21DynamicSplitterStatus_previouslyImpactedBundleIdentifiers] = *(void *)&a1[v4[9]];
  *(void *)&v1[OBJC_IVAR____TtC10GamePolicy21DynamicSplitterStatus_enablementStrategy] = *(void *)&a1[v4[10]];
  v7.receiver = v1;
  v7.super_class = (Class)type metadata accessor for DynamicSplitterStatus(0);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v5 = objc_msgSendSuper2(&v7, sel_init);
  sub_24F925238((uint64_t)a1);
  return v5;
}

uint64_t type metadata accessor for DynamicSplitterStatus(uint64_t a1)
{
  return sub_24F925200(a1, (uint64_t *)&unk_269A33CE0);
}

uint64_t sub_24F925200(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_24F925238(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for DynamicSplitterStatus.Config(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t DynamicSplitterStatus.config.getter@<X0>(unsigned char *a1@<X8>)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A33C68);
  uint64_t v4 = MEMORY[0x270FA5388](v3 - 8);
  v6 = &v13[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v4);
  unint64_t v8 = &v13[-v7];
  uint64_t v9 = v1 + OBJC_IVAR____TtC10GamePolicy21DynamicSplitterStatus____lazy_storage___config;
  swift_beginAccess();
  sub_24F925458(v9, (uint64_t)v8, &qword_269A33C68);
  uint64_t v10 = type metadata accessor for DynamicSplitterStatus.Config(0);
  uint64_t v11 = *(void *)(v10 - 8);
  if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v11 + 48))(v8, 1, v10) != 1) {
    return sub_24F925848((uint64_t)v8, (uint64_t)a1);
  }
  sub_24F927D88((uint64_t)v8, &qword_269A33C68);
  sub_24F9254BC(v1, a1);
  sub_24F925780((uint64_t)a1, (uint64_t)v6);
  (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v11 + 56))(v6, 0, 1, v10);
  swift_beginAccess();
  sub_24F9257E4((uint64_t)v6, v9, &qword_269A33C68);
  return swift_endAccess();
}

uint64_t sub_24F925458(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_24F9254BC@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v24 = a1;
  uint64_t v3 = (int *)(type metadata accessor for DynamicSplitterStatus.Config(0) - 8);
  ((void (*)(void))MEMORY[0x270FA5388])();
  uint64_t v5 = (char *)&v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A33C50);
  uint64_t v6 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  unint64_t v8 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v23 - v9;
  uint64_t v11 = sub_24F93C8F8();
  v12 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56);
  v12(v10, 1, 1, v11);
  v12(v8, 1, 1, v11);
  uint64_t v13 = (uint64_t)&v5[v3[7]];
  v12((char *)v13, 1, 1, v11);
  uint64_t v14 = (uint64_t)&v5[v3[8]];
  v12((char *)v14, 1, 1, v11);
  *uint64_t v5 = 0;
  sub_24F9257E4((uint64_t)v10, v13, &qword_269A33C50);
  sub_24F9257E4((uint64_t)v8, v14, &qword_269A33C50);
  v5[v3[9]] = 0;
  uint64_t v15 = MEMORY[0x263F8EE78];
  *(void *)&v5[v3[10]] = MEMORY[0x263F8EE78];
  *(void *)&v5[v3[11]] = v15;
  *(void *)&v5[v3[12]] = 0;
  sub_24F925848((uint64_t)v5, (uint64_t)a2);
  uint64_t v16 = v24;
  *a2 = *(unsigned char *)(v24 + OBJC_IVAR____TtC10GamePolicy21DynamicSplitterStatus_enabled);
  uint64_t v17 = v16;
  sub_24F927DE4(v16 + OBJC_IVAR____TtC10GamePolicy21DynamicSplitterStatus_enablementDate, (uint64_t)&a2[v3[7]]);
  sub_24F927DE4(v17 + OBJC_IVAR____TtC10GamePolicy21DynamicSplitterStatus_disablementDate, (uint64_t)&a2[v3[8]]);
  a2[v3[9]] = *(unsigned char *)(v17 + OBJC_IVAR____TtC10GamePolicy21DynamicSplitterStatus_deviceSupported);
  uint64_t v18 = *(void *)(v17 + OBJC_IVAR____TtC10GamePolicy21DynamicSplitterStatus_impactedBundleIdentifiers);
  uint64_t v19 = v3[10];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)&a2[v19] = v18;
  uint64_t v20 = *(void *)(v17 + OBJC_IVAR____TtC10GamePolicy21DynamicSplitterStatus_previouslyImpactedBundleIdentifiers);
  uint64_t v21 = v3[11];
  swift_bridgeObjectRetain();
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)&a2[v21] = v20;
  *(void *)&a2[v3[12]] = *(void *)(v17 + OBJC_IVAR____TtC10GamePolicy21DynamicSplitterStatus_enablementStrategy);
  return result;
}

uint64_t sub_24F925780(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for DynamicSplitterStatus.Config(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24F9257E4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 40))(a2, a1, v5);
  return a2;
}

uint64_t sub_24F925848(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for DynamicSplitterStatus.Config(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t DynamicSplitterStatus.config.setter(uint64_t a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A33C68);
  MEMORY[0x270FA5388]();
  uint64_t v4 = (char *)&v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24F925848(a1, (uint64_t)v4);
  uint64_t v5 = type metadata accessor for DynamicSplitterStatus.Config(0);
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56))(v4, 0, 1, v5);
  uint64_t v6 = v1 + OBJC_IVAR____TtC10GamePolicy21DynamicSplitterStatus____lazy_storage___config;
  swift_beginAccess();
  sub_24F9257E4((uint64_t)v4, v6, &qword_269A33C68);
  return swift_endAccess();
}

void (*DynamicSplitterStatus.config.modify(void *a1))(uint64_t a1, char a2)
{
  uint64_t v3 = malloc(0x60uLL);
  *a1 = v3;
  v3[6] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A33C68);
  v3[7] = malloc(*(void *)(*(void *)(v4 - 8) + 64));
  uint64_t v5 = type metadata accessor for DynamicSplitterStatus.Config(0);
  v3[8] = v5;
  uint64_t v6 = *(void *)(v5 - 8);
  v3[9] = v6;
  size_t v7 = *(void *)(v6 + 64);
  v3[10] = malloc(v7);
  uint64_t v8 = malloc(v7);
  v3[11] = v8;
  DynamicSplitterStatus.config.getter(v8);
  return sub_24F925A9C;
}

void sub_24F925A9C(uint64_t a1, char a2)
{
  uint64_t v2 = *(void **)a1;
  uint64_t v4 = *(void **)(*(void *)a1 + 80);
  uint64_t v3 = *(void **)(*(void *)a1 + 88);
  if (a2)
  {
    uint64_t v5 = v2[8];
    uint64_t v6 = v2[9];
    uint64_t v8 = v2[6];
    size_t v7 = (void *)v2[7];
    sub_24F925780(v2[11], v2[10]);
    sub_24F925848((uint64_t)v4, (uint64_t)v7);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v6 + 56))(v7, 0, 1, v5);
    uint64_t v9 = v8 + OBJC_IVAR____TtC10GamePolicy21DynamicSplitterStatus____lazy_storage___config;
    swift_beginAccess();
    sub_24F9257E4((uint64_t)v7, v9, &qword_269A33C68);
    swift_endAccess();
    sub_24F925238((uint64_t)v3);
  }
  else
  {
    uint64_t v10 = v2[8];
    uint64_t v11 = v2[9];
    uint64_t v12 = v2[6];
    size_t v7 = (void *)v2[7];
    sub_24F925848(v2[11], (uint64_t)v7);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v7, 0, 1, v10);
    uint64_t v13 = v12 + OBJC_IVAR____TtC10GamePolicy21DynamicSplitterStatus____lazy_storage___config;
    swift_beginAccess();
    sub_24F9257E4((uint64_t)v7, v13, &qword_269A33C68);
    swift_endAccess();
  }
  free(v3);
  free(v4);
  free(v7);
  free(v2);
}

uint64_t static DynamicSplitterStatus.supportsSecureCoding.getter()
{
  return 1;
}

Swift::Void __swiftcall DynamicSplitterStatus.encode(with:)(NSCoder with)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A33C50);
  uint64_t v4 = MEMORY[0x270FA5388](v3 - 8);
  uint64_t v6 = (char *)&v34 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v34 - v7;
  uint64_t v9 = sub_24F93C8F8();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  v35 = (char *)&v34 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v34 - v13;
  uint64_t v15 = *(unsigned __int8 *)(v1 + OBJC_IVAR____TtC10GamePolicy21DynamicSplitterStatus_enabled);
  uint64_t v16 = (void *)sub_24F93C958();
  Class isa = with.super.isa;
  [(objc_class *)with.super.isa encodeBool:v15 forKey:v16];

  uint64_t v36 = v1;
  sub_24F925458(v1 + OBJC_IVAR____TtC10GamePolicy21DynamicSplitterStatus_enablementDate, (uint64_t)v8, &qword_269A33C50);
  uint64_t v17 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48);
  if (v17(v8, 1, v9) == 1)
  {
    sub_24F927D88((uint64_t)v8, &qword_269A33C50);
    Class v18 = isa;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v14, v8, v9);
    uint64_t v19 = (void *)sub_24F93C8E8();
    uint64_t v20 = (void *)sub_24F93C958();
    Class v18 = isa;
    [(objc_class *)isa encodeObject:v19 forKey:v20];

    (*(void (**)(char *, uint64_t))(v10 + 8))(v14, v9);
  }
  uint64_t v21 = v36;
  sub_24F925458(v36 + OBJC_IVAR____TtC10GamePolicy21DynamicSplitterStatus_disablementDate, (uint64_t)v6, &qword_269A33C50);
  if (v17(v6, 1, v9) == 1)
  {
    sub_24F927D88((uint64_t)v6, &qword_269A33C50);
    unint64_t v22 = 0x26533D000;
  }
  else
  {
    uint64_t v23 = v35;
    (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v35, v6, v9);
    uint64_t v24 = (void *)sub_24F93C8E8();
    v25 = (void *)sub_24F93C958();
    unint64_t v22 = 0x26533D000uLL;
    [(objc_class *)v18 encodeObject:v24 forKey:v25];

    (*(void (**)(char *, uint64_t))(v10 + 8))(v23, v9);
  }
  uint64_t v26 = *(unsigned __int8 *)(v21 + OBJC_IVAR____TtC10GamePolicy21DynamicSplitterStatus_deviceSupported);
  v27 = (void *)sub_24F93C958();
  [(objc_class *)v18 encodeBool:v26 forKey:v27];

  sub_24F926108(*(void *)(v21 + OBJC_IVAR____TtC10GamePolicy21DynamicSplitterStatus_impactedBundleIdentifiers));
  sub_24F927D4C(0, (unint64_t *)&qword_269A33C70);
  v28 = (void *)sub_24F93CA58();
  swift_bridgeObjectRelease();
  v29 = (void *)sub_24F93C958();
  objc_msgSend(v18, *(SEL *)(v22 + 2992), v28, v29);

  sub_24F926108(*(void *)(v21 + OBJC_IVAR____TtC10GamePolicy21DynamicSplitterStatus_previouslyImpactedBundleIdentifiers));
  v30 = (void *)sub_24F93CA58();
  swift_bridgeObjectRelease();
  v31 = (void *)sub_24F93C958();
  objc_msgSend(v18, *(SEL *)(v22 + 2992), v30, v31);

  uint64_t v32 = *(void *)(v21 + OBJC_IVAR____TtC10GamePolicy21DynamicSplitterStatus_enablementStrategy);
  v33 = (void *)sub_24F93C958();
  [(objc_class *)v18 encodeInteger:v32 forKey:v33];
}

uint64_t sub_24F926108(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t result = MEMORY[0x263F8EE78];
  if (v2)
  {
    uint64_t v5 = MEMORY[0x263F8EE78];
    sub_24F93CB98();
    uint64_t v4 = a1 + 40;
    do
    {
      swift_bridgeObjectRetain();
      sub_24F93C958();
      swift_bridgeObjectRelease();
      sub_24F93CB78();
      sub_24F93CBA8();
      sub_24F93CBB8();
      sub_24F93CB88();
      v4 += 16;
      --v2;
    }
    while (v2);
    return v5;
  }
  return result;
}

id DynamicSplitterStatus.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  id v4 = sub_24F926430(a1);

  return v4;
}

id DynamicSplitterStatus.init(coder:)(void *a1)
{
  id v2 = sub_24F926430(a1);

  return v2;
}

id DynamicSplitterStatus.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void DynamicSplitterStatus.init()()
{
}

id DynamicSplitterStatus.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DynamicSplitterStatus(0);
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id sub_24F926430(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A33C50);
  uint64_t v4 = MEMORY[0x270FA5388](v3 - 8);
  *(void *)&long long v57 = (char *)&v55 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v55 - v6;
  uint64_t v8 = sub_24F93C8F8();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  v56 = (char *)&v55 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v55 - v12;
  uint64_t v14 = &v1[OBJC_IVAR____TtC10GamePolicy21DynamicSplitterStatus____lazy_storage___config];
  uint64_t v15 = type metadata accessor for DynamicSplitterStatus.Config(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v14, 1, 1, v15);
  uint64_t v16 = v1;
  uint64_t v17 = (void *)sub_24F93C958();
  unint64_t v18 = 0x26533D000uLL;
  unsigned __int8 v19 = objc_msgSend(a1, sel_decodeBoolForKey_, v17);

  v16[OBJC_IVAR____TtC10GamePolicy21DynamicSplitterStatus_enabled] = v19;
  uint64_t v20 = (void *)sub_24F93C958();
  unsigned __int8 v21 = objc_msgSend(a1, sel_containsValueForKey_, v20);

  unint64_t v22 = &loc_24F93D000;
  if ((v21 & 1) == 0)
  {
    v25 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56);
LABEL_8:
    unint64_t v26 = 0x26533D000uLL;
    v25(&v16[OBJC_IVAR____TtC10GamePolicy21DynamicSplitterStatus_enablementDate], 1, 1, v8);
    goto LABEL_9;
  }
  v55 = v13;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A340A0);
  uint64_t v23 = swift_allocObject();
  *(_OWORD *)(v23 + 16) = xmmword_24F93DBA0;
  *(void *)(v23 + 32) = sub_24F927D4C(0, (unint64_t *)&unk_269A33D20);
  sub_24F93CAC8();
  swift_bridgeObjectRelease();
  if (!v59)
  {
    sub_24F927D88((uint64_t)v58, (uint64_t *)&unk_269A340C0);
    v25 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v25(v7, 1, 1, v8);
    goto LABEL_7;
  }
  int v24 = swift_dynamicCast();
  v25 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56);
  v25(v7, v24 ^ 1u, 1, v8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1)
  {
    unint64_t v22 = (_OWORD *)&loc_24F93D000;
LABEL_7:
    sub_24F927D88((uint64_t)v7, &qword_269A33C50);
    goto LABEL_8;
  }
  v51 = *(void (**)(char *, char *, uint64_t))(v9 + 32);
  v52 = v55;
  v51(v55, v7, v8);
  v53 = v51;
  v54 = &v16[OBJC_IVAR____TtC10GamePolicy21DynamicSplitterStatus_enablementDate];
  v53(&v16[OBJC_IVAR____TtC10GamePolicy21DynamicSplitterStatus_enablementDate], v52, v8);
  unint64_t v18 = 0x26533D000;
  v25(v54, 0, 1, v8);
  unint64_t v22 = (_OWORD *)&loc_24F93D000;
  unint64_t v26 = 0x26533D000;
LABEL_9:
  v27 = (void *)sub_24F93C958();
  unsigned int v28 = objc_msgSend(a1, *(SEL *)(v26 + 3016), v27);

  if (!v28)
  {
LABEL_15:
    v25(&v16[OBJC_IVAR____TtC10GamePolicy21DynamicSplitterStatus_disablementDate], 1, 1, v8);
    goto LABEL_16;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A340A0);
  uint64_t v29 = swift_allocObject();
  *(_OWORD *)(v29 + 16) = v22[186];
  *(void *)(v29 + 32) = sub_24F927D4C(0, (unint64_t *)&unk_269A33D20);
  sub_24F93CAC8();
  swift_bridgeObjectRelease();
  if (!v59)
  {
    sub_24F927D88((uint64_t)v58, (uint64_t *)&unk_269A340C0);
    v25((char *)v57, 1, 1, v8);
    goto LABEL_14;
  }
  v30 = (char *)v57;
  int v31 = swift_dynamicCast();
  v25(v30, v31 ^ 1u, 1, v8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v30, 1, v8) == 1)
  {
LABEL_14:
    sub_24F927D88(v57, &qword_269A33C50);
    goto LABEL_15;
  }
  uint64_t v32 = *(void (**)(char *, char *, uint64_t))(v9 + 32);
  v33 = v56;
  v32(v56, (char *)v57, v8);
  uint64_t v34 = &v16[OBJC_IVAR____TtC10GamePolicy21DynamicSplitterStatus_disablementDate];
  v32(&v16[OBJC_IVAR____TtC10GamePolicy21DynamicSplitterStatus_disablementDate], v33, v8);
  unint64_t v18 = 0x26533D000;
  unint64_t v22 = (_OWORD *)&loc_24F93D000;
  v25(v34, 0, 1, v8);
LABEL_16:
  v35 = (void *)sub_24F93C958();
  unsigned __int8 v36 = objc_msgSend(a1, *(SEL *)(v18 + 3008), v35);

  v16[OBJC_IVAR____TtC10GamePolicy21DynamicSplitterStatus_deviceSupported] = v36;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A340A0);
  uint64_t v37 = swift_allocObject();
  long long v57 = v22[186];
  *(_OWORD *)(v37 + 16) = v57;
  uint64_t v38 = sub_24F927D4C(0, (unint64_t *)&qword_269A33C70);
  *(void *)(v37 + 32) = v38;
  uint64_t v39 = sub_24F93CAE8();
  swift_bridgeObjectRelease();
  uint64_t v40 = MEMORY[0x263F8EE78];
  if (v39)
  {
    uint64_t v41 = sub_24F92A890(v39);
    swift_bridgeObjectRelease();
    if (v41) {
      uint64_t v40 = v41;
    }
  }
  *(void *)&v16[OBJC_IVAR____TtC10GamePolicy21DynamicSplitterStatus_impactedBundleIdentifiers] = v40;
  uint64_t v42 = swift_allocObject();
  *(_OWORD *)(v42 + 16) = v57;
  *(void *)(v42 + 32) = v38;
  uint64_t v43 = sub_24F93CAE8();
  swift_bridgeObjectRelease();
  uint64_t v44 = MEMORY[0x263F8EE78];
  if (v43)
  {
    uint64_t v45 = sub_24F92A890(v43);
    swift_bridgeObjectRelease();
    if (v45) {
      uint64_t v44 = v45;
    }
  }
  *(void *)&v16[OBJC_IVAR____TtC10GamePolicy21DynamicSplitterStatus_previouslyImpactedBundleIdentifiers] = v44;
  v46 = (void *)sub_24F93C958();
  id v47 = objc_msgSend(a1, sel_decodeIntegerForKey_, v46);

  uint64_t v48 = v47 == (id)1;
  if (v47 == (id)2) {
    uint64_t v48 = 2;
  }
  *(void *)&v16[OBJC_IVAR____TtC10GamePolicy21DynamicSplitterStatus_enablementStrategy] = v48;

  v49 = (objc_class *)type metadata accessor for DynamicSplitterStatus(0);
  v60.receiver = v16;
  v60.super_class = v49;
  return objc_msgSendSuper2(&v60, sel_init);
}

uint64_t sub_24F926C40()
{
  return type metadata accessor for DynamicSplitterStatus(0);
}

void sub_24F926C48()
{
  sub_24F926D74(319, &qword_269A33CF0, MEMORY[0x263F07490]);
  if (v0 <= 0x3F)
  {
    sub_24F926D74(319, (unint64_t *)&unk_269A33CF8, (void (*)(uint64_t))type metadata accessor for DynamicSplitterStatus.Config);
    if (v1 <= 0x3F) {
      swift_updateClassMetadata2();
    }
  }
}

void sub_24F926D74(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = sub_24F93CB18();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

void *initializeBufferWithCopyOfBuffer for DynamicSplitterStatus.Config(char *a1, char *a2, int *a3)
{
  unint64_t v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v14 = *(void *)a2;
    void *v4 = *(void *)a2;
    unint64_t v4 = (void *)(v14 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *a1 = *a2;
    uint64_t v7 = a3[5];
    uint64_t v8 = &a1[v7];
    uint64_t v9 = &a2[v7];
    uint64_t v10 = sub_24F93C8F8();
    uint64_t v11 = *(void *)(v10 - 8);
    uint64_t v12 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48);
    if (v12(v9, 1, v10))
    {
      uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A33C50);
      memcpy(v8, v9, *(void *)(*(void *)(v13 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v8, v9, v10);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
    }
    uint64_t v15 = a3[6];
    uint64_t v16 = (char *)v4 + v15;
    uint64_t v17 = &a2[v15];
    if (v12(&a2[v15], 1, v10))
    {
      uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A33C50);
      memcpy(v16, v17, *(void *)(*(void *)(v18 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v16, v17, v10);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v16, 0, 1, v10);
    }
    uint64_t v19 = a3[8];
    *((unsigned char *)v4 + a3[7]) = a2[a3[7]];
    *(void *)((char *)v4 + v19) = *(void *)&a2[v19];
    uint64_t v20 = a3[10];
    *(void *)((char *)v4 + a3[9]) = *(void *)&a2[a3[9]];
    *(void *)((char *)v4 + v20) = *(void *)&a2[v20];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t destroy for DynamicSplitterStatus.Config(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  uint64_t v5 = sub_24F93C8F8();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48);
  if (!v7(v4, 1, v5)) {
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  }
  uint64_t v8 = a1 + *(int *)(a2 + 24);
  if (!v7(v8, 1, v5)) {
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v8, v5);
  }
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

unsigned char *initializeWithCopy for DynamicSplitterStatus.Config(unsigned char *a1, unsigned char *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = &a1[v6];
  uint64_t v8 = &a2[v6];
  uint64_t v9 = sub_24F93C8F8();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v10 + 48);
  if (v11(v8, 1, v9))
  {
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A33C50);
    memcpy(v7, v8, *(void *)(*(void *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v10 + 16))(v7, v8, v9);
    (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  }
  uint64_t v13 = a3[6];
  uint64_t v14 = &a1[v13];
  uint64_t v15 = &a2[v13];
  if (v11(&a2[v13], 1, v9))
  {
    uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A33C50);
    memcpy(v14, v15, *(void *)(*(void *)(v16 - 8) + 64));
  }
  else
  {
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v10 + 16))(v14, v15, v9);
    (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v10 + 56))(v14, 0, 1, v9);
  }
  uint64_t v17 = a3[8];
  a1[a3[7]] = a2[a3[7]];
  *(void *)&a1[v17] = *(void *)&a2[v17];
  uint64_t v18 = a3[10];
  *(void *)&a1[a3[9]] = *(void *)&a2[a3[9]];
  *(void *)&a1[v18] = *(void *)&a2[v18];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

unsigned char *assignWithCopy for DynamicSplitterStatus.Config(unsigned char *a1, unsigned char *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = &a1[v6];
  uint64_t v8 = &a2[v6];
  uint64_t v9 = sub_24F93C8F8();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(uint64_t (**)(unsigned char *, uint64_t, uint64_t))(v10 + 48);
  int v12 = v11(v7, 1, v9);
  int v13 = v11(v8, 1, v9);
  if (v12)
  {
    if (!v13)
    {
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v10 + 16))(v7, v8, v9);
      (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v13)
  {
    (*(void (**)(unsigned char *, uint64_t))(v10 + 8))(v7, v9);
LABEL_6:
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A33C50);
    memcpy(v7, v8, *(void *)(*(void *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v10 + 24))(v7, v8, v9);
LABEL_7:
  uint64_t v15 = a3[6];
  uint64_t v16 = &a1[v15];
  uint64_t v17 = &a2[v15];
  int v18 = v11(&a1[v15], 1, v9);
  int v19 = v11(v17, 1, v9);
  if (!v18)
  {
    if (!v19)
    {
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v10 + 24))(v16, v17, v9);
      goto LABEL_13;
    }
    (*(void (**)(unsigned char *, uint64_t))(v10 + 8))(v16, v9);
    goto LABEL_12;
  }
  if (v19)
  {
LABEL_12:
    uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A33C50);
    memcpy(v16, v17, *(void *)(*(void *)(v20 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v10 + 16))(v16, v17, v9);
  (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v10 + 56))(v16, 0, 1, v9);
LABEL_13:
  a1[a3[7]] = a2[a3[7]];
  *(void *)&a1[a3[8]] = *(void *)&a2[a3[8]];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)&a1[a3[9]] = *(void *)&a2[a3[9]];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)&a1[a3[10]] = *(void *)&a2[a3[10]];
  return a1;
}

unsigned char *initializeWithTake for DynamicSplitterStatus.Config(unsigned char *a1, unsigned char *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = &a1[v6];
  uint64_t v8 = &a2[v6];
  uint64_t v9 = sub_24F93C8F8();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v10 + 48);
  if (v11(v8, 1, v9))
  {
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A33C50);
    memcpy(v7, v8, *(void *)(*(void *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v10 + 32))(v7, v8, v9);
    (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  }
  uint64_t v13 = a3[6];
  uint64_t v14 = &a1[v13];
  uint64_t v15 = &a2[v13];
  if (v11(&a2[v13], 1, v9))
  {
    uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A33C50);
    memcpy(v14, v15, *(void *)(*(void *)(v16 - 8) + 64));
  }
  else
  {
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v10 + 32))(v14, v15, v9);
    (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v10 + 56))(v14, 0, 1, v9);
  }
  uint64_t v17 = a3[8];
  a1[a3[7]] = a2[a3[7]];
  *(void *)&a1[v17] = *(void *)&a2[v17];
  uint64_t v18 = a3[10];
  *(void *)&a1[a3[9]] = *(void *)&a2[a3[9]];
  *(void *)&a1[v18] = *(void *)&a2[v18];
  return a1;
}

unsigned char *assignWithTake for DynamicSplitterStatus.Config(unsigned char *a1, unsigned char *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = &a1[v6];
  uint64_t v8 = &a2[v6];
  uint64_t v9 = sub_24F93C8F8();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(uint64_t (**)(unsigned char *, uint64_t, uint64_t))(v10 + 48);
  int v12 = v11(v7, 1, v9);
  int v13 = v11(v8, 1, v9);
  if (v12)
  {
    if (!v13)
    {
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v10 + 32))(v7, v8, v9);
      (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v13)
  {
    (*(void (**)(unsigned char *, uint64_t))(v10 + 8))(v7, v9);
LABEL_6:
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A33C50);
    memcpy(v7, v8, *(void *)(*(void *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v10 + 40))(v7, v8, v9);
LABEL_7:
  uint64_t v15 = a3[6];
  uint64_t v16 = &a1[v15];
  uint64_t v17 = &a2[v15];
  int v18 = v11(&a1[v15], 1, v9);
  int v19 = v11(v17, 1, v9);
  if (!v18)
  {
    if (!v19)
    {
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v10 + 40))(v16, v17, v9);
      goto LABEL_13;
    }
    (*(void (**)(unsigned char *, uint64_t))(v10 + 8))(v16, v9);
    goto LABEL_12;
  }
  if (v19)
  {
LABEL_12:
    uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A33C50);
    memcpy(v16, v17, *(void *)(*(void *)(v20 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v10 + 32))(v16, v17, v9);
  (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v10 + 56))(v16, 0, 1, v9);
LABEL_13:
  uint64_t v21 = a3[8];
  a1[a3[7]] = a2[a3[7]];
  *(void *)&a1[v21] = *(void *)&a2[v21];
  swift_bridgeObjectRelease();
  *(void *)&a1[a3[9]] = *(void *)&a2[a3[9]];
  swift_bridgeObjectRelease();
  *(void *)&a1[a3[10]] = *(void *)&a2[a3[10]];
  return a1;
}

uint64_t getEnumTagSinglePayload for DynamicSplitterStatus.Config(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24F927AD8);
}

uint64_t sub_24F927AD8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A33C50);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1 + *(int *)(a3 + 20);
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v10(v9, a2, v8);
  }
  else
  {
    unint64_t v12 = *(void *)(a1 + *(int *)(a3 + 32));
    if (v12 >= 0xFFFFFFFF) {
      LODWORD(v12) = -1;
    }
    return (v12 + 1);
  }
}

uint64_t storeEnumTagSinglePayload for DynamicSplitterStatus.Config(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24F927BB4);
}

uint64_t sub_24F927BB4(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = __swift_instantiateConcreteTypeFromMangledName(&qword_269A33C50);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = result;
    uint64_t v11 = a1 + *(int *)(a4 + 20);
    unint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v12(v11, a2, a2, v10);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 32)) = (a2 - 1);
  }
  return result;
}

void sub_24F927C78()
{
  sub_24F926D74(319, &qword_269A33CF0, MEMORY[0x263F07490]);
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

uint64_t sub_24F927D4C(uint64_t a1, unint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2)
  {
    self;
    uint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
}

uint64_t sub_24F927D88(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_24F927DE4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A33C50);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a2, a1, v4);
  return a2;
}

uint64_t static ConsoleModeUserDisabled.supportsSecureCoding.getter()
{
  return 1;
}

id ConsoleModeUserDisabled.__allocating_init(coder:)(void *a1)
{
  v5.receiver = objc_allocWithZone(v1);
  v5.super_class = (Class)type metadata accessor for GamePolicyAssertion.Attribute();
  id v3 = objc_msgSendSuper2(&v5, sel_init);

  return v3;
}

id ConsoleModeUserDisabled.init(coder:)(void *a1)
{
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for GamePolicyAssertion.Attribute();
  id v3 = objc_msgSendSuper2(&v5, sel_init);

  return v3;
}

id ConsoleModeUserDisabled.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

id ConsoleModeUserDisabled.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ConsoleModeUserDisabled();
  return objc_msgSendSuper2(&v2, sel_init);
}

unint64_t ConsoleModeUserDisabled.description.getter()
{
  return 0xD000000000000019;
}

id ConsoleModeUserDisabled.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ConsoleModeUserDisabled();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for ConsoleModeUserDisabled()
{
  return self;
}

unint64_t ModeEnablementStrategy.init(rawValue:)(unint64_t result)
{
  if (result > 2) {
    return 0;
  }
  return result;
}

unint64_t sub_24F9280C8()
{
  unint64_t result = qword_269A33D90;
  if (!qword_269A33D90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A33D90);
  }
  return result;
}

uint64_t *sub_24F92811C@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2 = *result;
  BOOL v3 = (unint64_t)*result > 2;
  if ((unint64_t)*result > 2) {
    uint64_t v2 = 0;
  }
  *(void *)a2 = v2;
  *(unsigned char *)(a2 + 8) = v3;
  return result;
}

ValueMetadata *type metadata accessor for ModeEnablementStrategy()
{
  return &type metadata for ModeEnablementStrategy;
}

BOOL static audit_token_t.== infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a1 != a5) {
    return 0;
  }
  BOOL v8 = HIDWORD(a4) == HIDWORD(a8);
  if (a4 != a8) {
    BOOL v8 = 0;
  }
  BOOL v9 = HIDWORD(a3) == HIDWORD(a7) && v8;
  if (a3 != a7) {
    BOOL v9 = 0;
  }
  BOOL v10 = HIDWORD(a2) == HIDWORD(a6) && v9;
  return a2 == a6 && v10;
}

BOOL sub_24F9281A8(int32x4_t *a1, int32x4_t *a2)
{
  BOOL result = 0;
  if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vceqq_s32(*a1, *a2)), 0xFuLL))) & 1) != 0
    && a1[1].i32[0] == a2[1].i32[0]
    && a1[1].i32[1] == a2[1].i32[1]
    && a1[1].i32[2] == a2[1].i32[2])
  {
    return a1[1].i32[3] == a2[1].i32[3];
  }
  return result;
}

uint64_t static GamePolicyTargetDescription.supportsSecureCoding.getter()
{
  return 1;
}

Swift::Void __swiftcall GamePolicyTargetDescription.encode(with:)(NSCoder with)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithUnsignedInt_, *(unsigned int *)(v1 + OBJC_IVAR____TtC10GamePolicy27GamePolicyTargetDescription_euid));
  uint64_t v4 = (void *)sub_24F93C958();
  [(objc_class *)with.super.isa encodeObject:v3 forKey:v4];

  objc_super v5 = (void *)sub_24F93C958();
  uint64_t v6 = (void *)sub_24F93C958();
  [(objc_class *)with.super.isa encodeObject:v5 forKey:v6];

  long long v7 = *(_OWORD *)(v1 + OBJC_IVAR____TtC10GamePolicy27GamePolicyTargetDescription_auditToken + 16);
  long long v10 = *(_OWORD *)(v1 + OBJC_IVAR____TtC10GamePolicy27GamePolicyTargetDescription_auditToken);
  long long v11 = v7;
  id v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFF8F8]), sel_initWithBytes_length_, &v10, 32);
  BOOL v9 = (void *)sub_24F93C958();
  -[objc_class encodeObject:forKey:](with.super.isa, sel_encodeObject_forKey_, v8, v9, v10, v11);
}

id GamePolicyTargetDescription.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return GamePolicyTargetDescription.init(coder:)(a1);
}

id GamePolicyTargetDescription.init(coder:)(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v20 = *MEMORY[0x263EF8340];
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A340A0);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_24F93DBA0;
  *(void *)(v4 + 32) = sub_24F927D4C(0, &qword_269A33DD0);
  objc_super v5 = v2;
  sub_24F93CAC8();
  swift_bridgeObjectRelease();
  if (!*((void *)&v19 + 1)) {
    goto LABEL_8;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_9:

    goto LABEL_10;
  }
  unsigned int v6 = objc_msgSend(v17, sel_unsignedIntValue);

  *(_DWORD *)&v5[OBJC_IVAR____TtC10GamePolicy27GamePolicyTargetDescription_euid] = v6;
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_24F93DBA0;
  *(void *)(v7 + 32) = sub_24F927D4C(0, (unint64_t *)&qword_269A33C70);
  sub_24F93CAC8();
  swift_bridgeObjectRelease();
  if (!*((void *)&v19 + 1))
  {
LABEL_8:

    sub_24F927D88((uint64_t)&v18, (uint64_t *)&unk_269A340C0);
LABEL_10:
    type metadata accessor for GamePolicyTargetDescription();
    swift_deallocPartialClassInstance();
    return 0;
  }
  if ((swift_dynamicCast() & 1) == 0) {
    goto LABEL_9;
  }
  uint64_t v8 = sub_24F93C978();
  uint64_t v10 = v9;

  long long v11 = (uint64_t *)&v5[OBJC_IVAR____TtC10GamePolicy27GamePolicyTargetDescription_targetDescription];
  *long long v11 = v8;
  v11[1] = v10;
  uint64_t v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = xmmword_24F93DBA0;
  *(void *)(v12 + 32) = sub_24F927D4C(0, &qword_269A33DD8);
  sub_24F93CAC8();
  swift_bridgeObjectRelease();
  if (!*((void *)&v19 + 1))
  {

    sub_24F927D88((uint64_t)&v18, (uint64_t *)&unk_269A340C0);
LABEL_14:

    swift_bridgeObjectRelease();
    goto LABEL_10;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {

    goto LABEL_14;
  }
  long long v18 = 0u;
  long long v19 = 0u;
  objc_msgSend(v17, sel_getBytes_length_, &v18, 32);

  int v13 = &v5[OBJC_IVAR____TtC10GamePolicy27GamePolicyTargetDescription_auditToken];
  *(_OWORD *)int v13 = v18;
  *((_OWORD *)v13 + 1) = v19;

  v16.receiver = v5;
  v16.super_class = (Class)type metadata accessor for GamePolicyTargetDescription();
  id v14 = objc_msgSendSuper2(&v16, sel_init);

  return v14;
}

uint64_t static GamePolicyTargetDescription.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)(a1 + OBJC_IVAR____TtC10GamePolicy27GamePolicyTargetDescription_euid) != *(_DWORD *)(a2 + OBJC_IVAR____TtC10GamePolicy27GamePolicyTargetDescription_euid)
    || (vminv_u8((uint8x8_t)vcltz_s8(vshl_n_s8(vmovn_s16(vuzp1q_s16((int16x8_t)vceqq_s32(*(int32x4_t *)(a1+ OBJC_IVAR____TtC10GamePolicy27GamePolicyTargetDescription_auditToken), *(int32x4_t *)(a2+ OBJC_IVAR____TtC10GamePolicy27GamePolicyTargetDescription_auditToken)), (int16x8_t)vceqq_s32(*(int32x4_t *)(a1+ OBJC_IVAR____TtC10GamePolicy27GamePolicyTargetDescription_auditToken+ 16), *(int32x4_t *)(a2+ OBJC_IVAR____TtC10GamePolicy27GamePolicyTargetDescription_auditToken+ 16)))), 7uLL))) & 1) == 0)
  {
    return 0;
  }
  if (*(void *)(a1 + OBJC_IVAR____TtC10GamePolicy27GamePolicyTargetDescription_targetDescription) == *(void *)(a2 + OBJC_IVAR____TtC10GamePolicy27GamePolicyTargetDescription_targetDescription)
    && *(void *)(a1 + OBJC_IVAR____TtC10GamePolicy27GamePolicyTargetDescription_targetDescription + 8) == *(void *)(a2 + OBJC_IVAR____TtC10GamePolicy27GamePolicyTargetDescription_targetDescription + 8))
  {
    return 1;
  }
  else
  {
    return sub_24F93CC08();
  }
}

uint64_t GamePolicyTargetDescription.hash.getter()
{
  return sub_24F93CA28();
}

uint64_t GamePolicyTargetDescription.euid.getter()
{
  return *(unsigned int *)(v0 + OBJC_IVAR____TtC10GamePolicy27GamePolicyTargetDescription_euid);
}

uint64_t GamePolicyTargetDescription.auditToken.getter()
{
  return *(void *)(v0 + OBJC_IVAR____TtC10GamePolicy27GamePolicyTargetDescription_auditToken);
}

uint64_t GamePolicyTargetDescription.targetDescription.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC10GamePolicy27GamePolicyTargetDescription_targetDescription);
  swift_bridgeObjectRetain();
  return v1;
}

id GamePolicyTargetDescription.__allocating_init(with:)(void *a1)
{
  uint64_t v2 = v1;
  id v4 = objc_allocWithZone(v1);
  uint64_t v5 = a1[3];
  uint64_t v6 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v5);
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(v6 + 16);
  uint64_t v8 = (char *)v4;
  *(_DWORD *)&v8[OBJC_IVAR____TtC10GamePolicy27GamePolicyTargetDescription_euid] = v7(v5, v6);
  uint64_t v9 = a1[3];
  uint64_t v10 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v9);
  uint64_t v11 = (*(uint64_t (**)(uint64_t, uint64_t))(v10 + 24))(v9, v10);
  uint64_t v12 = &v8[OBJC_IVAR____TtC10GamePolicy27GamePolicyTargetDescription_auditToken];
  *(void *)uint64_t v12 = v11;
  *((_DWORD *)v12 + 2) = v13;
  *((_DWORD *)v12 + 3) = v14;
  *((_DWORD *)v12 + 4) = v15;
  *((_DWORD *)v12 + 5) = v16;
  *((_DWORD *)v12 + 6) = v17;
  *((_DWORD *)v12 + 7) = v18;
  uint64_t v19 = a1[3];
  uint64_t v20 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v19);
  uint64_t v21 = (*(uint64_t (**)(uint64_t, uint64_t))(v20 + 32))(v19, v20);
  unint64_t v22 = (uint64_t *)&v8[OBJC_IVAR____TtC10GamePolicy27GamePolicyTargetDescription_targetDescription];
  *unint64_t v22 = v21;
  v22[1] = v23;

  v26.receiver = v8;
  v26.super_class = v2;
  id v24 = objc_msgSendSuper2(&v26, sel_init);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return v24;
}

id GamePolicyTargetDescription.init(with:)(void *a1)
{
  uint64_t v3 = a1[3];
  uint64_t v4 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v3);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t))(v4 + 16);
  uint64_t v6 = v1;
  *(_DWORD *)&v6[OBJC_IVAR____TtC10GamePolicy27GamePolicyTargetDescription_euid] = v5(v3, v4);
  uint64_t v7 = a1[3];
  uint64_t v8 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v7);
  uint64_t v9 = (*(uint64_t (**)(uint64_t, uint64_t))(v8 + 24))(v7, v8);
  uint64_t v10 = &v6[OBJC_IVAR____TtC10GamePolicy27GamePolicyTargetDescription_auditToken];
  *(void *)uint64_t v10 = v9;
  *((_DWORD *)v10 + 2) = v11;
  *((_DWORD *)v10 + 3) = v12;
  *((_DWORD *)v10 + 4) = v13;
  *((_DWORD *)v10 + 5) = v14;
  *((_DWORD *)v10 + 6) = v15;
  *((_DWORD *)v10 + 7) = v16;
  uint64_t v17 = a1[3];
  uint64_t v18 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v17);
  uint64_t v19 = (*(uint64_t (**)(uint64_t, uint64_t))(v18 + 32))(v17, v18);
  uint64_t v20 = (uint64_t *)&v6[OBJC_IVAR____TtC10GamePolicy27GamePolicyTargetDescription_targetDescription];
  *uint64_t v20 = v19;
  v20[1] = v21;

  v24.receiver = v6;
  v24.super_class = (Class)type metadata accessor for GamePolicyTargetDescription();
  id v22 = objc_msgSendSuper2(&v24, sel_init);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return v22;
}

id GamePolicyTargetDescription.__allocating_init(euid:auditToken:targetDescription:)(int a1, unint64_t a2, unint64_t a3, unint64_t a4, unint64_t a5, uint64_t a6, uint64_t a7)
{
  int v8 = a5;
  int v9 = a4;
  int v10 = a3;
  int v11 = a2;
  unint64_t v13 = HIDWORD(a2);
  unint64_t v14 = HIDWORD(a3);
  unint64_t v15 = HIDWORD(a4);
  unint64_t v16 = HIDWORD(a5);
  uint64_t v17 = (char *)objc_allocWithZone(v7);
  *(_DWORD *)&v17[OBJC_IVAR____TtC10GamePolicy27GamePolicyTargetDescription_euid] = a1;
  uint64_t v18 = &v17[OBJC_IVAR____TtC10GamePolicy27GamePolicyTargetDescription_auditToken];
  *(_DWORD *)uint64_t v18 = v11;
  *((_DWORD *)v18 + 1) = v13;
  *((_DWORD *)v18 + 2) = v10;
  *((_DWORD *)v18 + 3) = v14;
  *((_DWORD *)v18 + 4) = v9;
  *((_DWORD *)v18 + 5) = v15;
  *((_DWORD *)v18 + 6) = v8;
  *((_DWORD *)v18 + 7) = v16;
  uint64_t v19 = &v17[OBJC_IVAR____TtC10GamePolicy27GamePolicyTargetDescription_targetDescription];
  *(void *)uint64_t v19 = a6;
  *((void *)v19 + 1) = a7;
  v23.receiver = v17;
  v23.super_class = v7;
  return objc_msgSendSuper2(&v23, sel_init);
}

id GamePolicyTargetDescription.init(euid:auditToken:targetDescription:)(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  *(_DWORD *)&v7[OBJC_IVAR____TtC10GamePolicy27GamePolicyTargetDescription_euid] = a1;
  int v8 = &v7[OBJC_IVAR____TtC10GamePolicy27GamePolicyTargetDescription_auditToken];
  *(void *)int v8 = a2;
  *((void *)v8 + 1) = a3;
  *((void *)v8 + 2) = a4;
  *((void *)v8 + 3) = a5;
  int v9 = &v7[OBJC_IVAR____TtC10GamePolicy27GamePolicyTargetDescription_targetDescription];
  *(void *)int v9 = a6;
  *((void *)v9 + 1) = a7;
  v11.receiver = v7;
  v11.super_class = (Class)type metadata accessor for GamePolicyTargetDescription();
  return objc_msgSendSuper2(&v11, sel_init);
}

unint64_t GamePolicyTargetDescription.description.getter()
{
  return 0xD000000000000015;
}

id GamePolicyTargetDescription.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void GamePolicyTargetDescription.init()()
{
}

id GamePolicyTargetDescription.__deallocating_deinit()
{
  return sub_24F92A78C(type metadata accessor for GamePolicyTargetDescription);
}

uint64_t sub_24F928EB4()
{
  return *(unsigned int *)(*v0 + OBJC_IVAR____TtC10GamePolicy27GamePolicyTargetDescription_euid);
}

uint64_t sub_24F928EC8()
{
  return *(void *)(*v0 + OBJC_IVAR____TtC10GamePolicy27GamePolicyTargetDescription_auditToken);
}

uint64_t sub_24F928EE4()
{
  uint64_t v1 = *(void *)(*v0 + OBJC_IVAR____TtC10GamePolicy27GamePolicyTargetDescription_targetDescription);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t static GamePolicyAssertion.supportsSecureCoding.getter()
{
  return 1;
}

Swift::Void __swiftcall GamePolicyAssertion.encode(with:)(NSCoder with)
{
  uint64_t v2 = v1;
  sub_24F92A2A4(v1 + OBJC_IVAR____TtC10GamePolicy19GamePolicyAssertion_target, (uint64_t)v32);
  uint64_t v4 = (objc_class *)type metadata accessor for GamePolicyTargetDescription();
  id v5 = objc_allocWithZone(v4);
  uint64_t v6 = v33;
  uint64_t v7 = v34;
  __swift_project_boxed_opaque_existential_1(v32, v33);
  int v8 = *(uint64_t (**)(uint64_t, uint64_t))(v7 + 16);
  int v9 = (char *)v5;
  *(_DWORD *)&v9[OBJC_IVAR____TtC10GamePolicy27GamePolicyTargetDescription_euid] = v8(v6, v7);
  uint64_t v10 = v33;
  uint64_t v11 = v34;
  __swift_project_boxed_opaque_existential_1(v32, v33);
  uint64_t v12 = (*(uint64_t (**)(uint64_t, uint64_t))(v11 + 24))(v10, v11);
  unint64_t v13 = &v9[OBJC_IVAR____TtC10GamePolicy27GamePolicyTargetDescription_auditToken];
  *(void *)unint64_t v13 = v12;
  *((_DWORD *)v13 + 2) = v14;
  *((_DWORD *)v13 + 3) = v15;
  *((_DWORD *)v13 + 4) = v16;
  *((_DWORD *)v13 + 5) = v17;
  *((_DWORD *)v13 + 6) = v18;
  *((_DWORD *)v13 + 7) = v19;
  uint64_t v20 = v33;
  uint64_t v21 = v34;
  __swift_project_boxed_opaque_existential_1(v32, v33);
  uint64_t v22 = (*(uint64_t (**)(uint64_t, uint64_t))(v21 + 32))(v20, v21);
  objc_super v23 = (uint64_t *)&v9[OBJC_IVAR____TtC10GamePolicy27GamePolicyTargetDescription_targetDescription];
  *objc_super v23 = v22;
  v23[1] = v24;

  v31.receiver = v9;
  v31.super_class = v4;
  id v25 = objc_msgSendSuper2(&v31, sel_init);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v32);
  objc_super v26 = (void *)sub_24F93C958();
  [(objc_class *)with.super.isa encodeObject:v25 forKey:v26];

  type metadata accessor for GamePolicyAssertion.Attribute();
  v27 = (void *)sub_24F93CA58();
  unsigned int v28 = (void *)sub_24F93C958();
  [(objc_class *)with.super.isa encodeObject:v27 forKey:v28];

  id v29 = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithUnsignedInteger_, *(void *)(v2 + OBJC_IVAR____TtC10GamePolicy19GamePolicyAssertion_identifier));
  v30 = (void *)sub_24F93C958();
  [(objc_class *)with.super.isa encodeObject:v29 forKey:v30];
}

id GamePolicyAssertion.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return GamePolicyAssertion.init(coder:)(a1);
}

id GamePolicyAssertion.init(coder:)(void *a1)
{
  uint64_t v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A340A0);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_24F93DD10;
  uint64_t v5 = type metadata accessor for GamePolicyTargetDescription();
  *(void *)(v4 + 32) = v5;
  uint64_t v6 = sub_24F927D4C(0, &qword_269A33DD0);
  *(void *)(v4 + 40) = v6;
  *(void *)(v4 + 48) = sub_24F927D4C(0, (unint64_t *)&qword_269A33C70);
  *(void *)(v4 + 56) = sub_24F927D4C(0, &qword_269A33DD8);
  uint64_t v7 = v2;
  sub_24F93CAC8();
  swift_bridgeObjectRelease();
  if (!v18)
  {

    sub_24F927D88((uint64_t)v17, (uint64_t *)&unk_269A340C0);
LABEL_10:

    goto LABEL_14;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {

LABEL_14:
    type metadata accessor for GamePolicyAssertion();
    swift_deallocPartialClassInstance();
    return 0;
  }
  id v8 = v16;
  int v9 = &v7[OBJC_IVAR____TtC10GamePolicy19GamePolicyAssertion_target];
  *(void *)&v7[OBJC_IVAR____TtC10GamePolicy19GamePolicyAssertion_target + 24] = v5;
  *((void *)v9 + 4) = sub_24F92A82C(&qword_269A33DF8);
  *(void *)int v9 = v8;
  type metadata accessor for GamePolicyAssertion.Attribute();
  uint64_t v10 = sub_24F93CAD8();
  if (!v10)
  {

    __swift_destroy_boxed_opaque_existential_1((uint64_t)v9);
    goto LABEL_10;
  }
  *(void *)&v7[OBJC_IVAR____TtC10GamePolicy19GamePolicyAssertion_attributes] = v10;
  uint64_t v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = xmmword_24F93DBA0;
  *(void *)(v11 + 32) = v6;
  sub_24F93CAC8();
  swift_bridgeObjectRelease();
  if (!v18)
  {

    sub_24F927D88((uint64_t)v17, (uint64_t *)&unk_269A340C0);
LABEL_13:
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v9);

    swift_bridgeObjectRelease();
    goto LABEL_14;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {

    goto LABEL_13;
  }
  id v12 = objc_msgSend(v16, sel_unsignedIntegerValue);

  *(void *)&v7[OBJC_IVAR____TtC10GamePolicy19GamePolicyAssertion_identifier] = v12;
  v15.receiver = v7;
  v15.super_class = (Class)type metadata accessor for GamePolicyAssertion();
  id v13 = objc_msgSendSuper2(&v15, sel_init);

  return v13;
}

double sub_24F929568()
{
  qword_269A35150 = 0;
  double result = 0.0;
  static GamePolicyAssertion.delegate = 0u;
  unk_269A35140 = 0u;
  return result;
}

long long *GamePolicyAssertion.delegate.unsafeMutableAddressor()
{
  if (qword_269A33BD0 != -1) {
    swift_once();
  }
  return &static GamePolicyAssertion.delegate;
}

uint64_t static GamePolicyAssertion.delegate.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_269A33BD0 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return sub_24F92A1D4((uint64_t)&static GamePolicyAssertion.delegate, a1);
}

uint64_t static GamePolicyAssertion.delegate.setter(uint64_t a1)
{
  if (qword_269A33BD0 != -1) {
    swift_once();
  }
  swift_beginAccess();
  sub_24F92A23C(a1, (uint64_t)&static GamePolicyAssertion.delegate);
  swift_endAccess();
  return sub_24F927D88(a1, &qword_269A33E00);
}

uint64_t (*static GamePolicyAssertion.delegate.modify())()
{
  if (qword_269A33BD0 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j__swift_endAccess;
}

BOOL static GamePolicyAssertion.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return *(void *)(a1 + OBJC_IVAR____TtC10GamePolicy19GamePolicyAssertion_identifier) == *(void *)(a2 + OBJC_IVAR____TtC10GamePolicy19GamePolicyAssertion_identifier);
}

uint64_t GamePolicyAssertion.hash.getter()
{
  uint64_t result = *(void *)(v0 + OBJC_IVAR____TtC10GamePolicy19GamePolicyAssertion_identifier);
  if (result < 0) {
    __break(1u);
  }
  return result;
}

uint64_t GamePolicyAssertion.hasAttribute<A>(type:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24F93CB18();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v18 - v6;
  unint64_t v8 = *(void *)(v2 + OBJC_IVAR____TtC10GamePolicy19GamePolicyAssertion_attributes);
  if (v8 >> 62)
  {
LABEL_16:
    swift_bridgeObjectRetain();
    uint64_t v9 = sub_24F93CBD8();
    if (v9) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v9 = *(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v9)
    {
LABEL_3:
      uint64_t v10 = (void (**)(char *, uint64_t))(v5 + 8);
      for (uint64_t i = 4; ; ++i)
      {
        uint64_t v12 = i - 4;
        if ((v8 & 0xC000000000000001) != 0)
        {
          id v13 = (id)MEMORY[0x253366170](i - 4, v8);
          BOOL v14 = __OFADD__(v12, 1);
          uint64_t v5 = i - 3;
          if (v14) {
            goto LABEL_15;
          }
        }
        else
        {
          id v13 = *(id *)(v8 + 8 * i);
          BOOL v14 = __OFADD__(v12, 1);
          uint64_t v5 = i - 3;
          if (v14)
          {
LABEL_15:
            __break(1u);
            goto LABEL_16;
          }
        }
        v18[1] = v13;
        type metadata accessor for GamePolicyAssertion.Attribute();
        int v15 = swift_dynamicCast();
        id v16 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(a2 - 8) + 56);
        if (v15)
        {
          uint64_t v9 = 1;
          v16(v7, 0, 1, a2);
          (*v10)(v7, v4);
          break;
        }
        v16(v7, 1, 1, a2);
        (*v10)(v7, v4);
        if (v5 == v9)
        {
          swift_bridgeObjectRelease();
          return 0;
        }
      }
    }
  }
  swift_bridgeObjectRelease();
  return v9;
}

id sub_24F9299DC()
{
  id result = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08958]), sel_init);
  qword_269A33DA0 = (uint64_t)result;
  return result;
}

uint64_t GamePolicyAssertion.target.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_24F92A2A4(v1 + OBJC_IVAR____TtC10GamePolicy19GamePolicyAssertion_target, a1);
}

uint64_t GamePolicyAssertion.attributes.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t GamePolicyAssertion.identifier.getter()
{
  return *(void *)(v0 + OBJC_IVAR____TtC10GamePolicy19GamePolicyAssertion_identifier);
}

void GamePolicyAssertion.__allocating_init(target:attributes:)(uint64_t a1, uint64_t a2)
{
  id v5 = objc_allocWithZone(v2);
  GamePolicyAssertion.init(target:attributes:)(a1, a2);
}

void GamePolicyAssertion.init(target:attributes:)(uint64_t a1, uint64_t a2)
{
  sub_24F92A2A4(a1, (uint64_t)&v2[OBJC_IVAR____TtC10GamePolicy19GamePolicyAssertion_target]);
  *(void *)&v2[OBJC_IVAR____TtC10GamePolicy19GamePolicyAssertion_attributes] = a2;
  uint64_t v5 = qword_269A33BD8;
  uint64_t v6 = v2;
  if (v5 != -1) {
    swift_once();
  }
  objc_msgSend((id)qword_269A33DA0, sel_lock);
  *(void *)&v6[OBJC_IVAR____TtC10GamePolicy19GamePolicyAssertion_identifier] = qword_269A33DA8;

  if (qword_269A33DA8 == -1)
  {
    __break(1u);
  }
  else
  {
    ++qword_269A33DA8;
    objc_msgSend((id)qword_269A33DA0, sel_unlock);
    v7.receiver = v6;
    v7.super_class = (Class)type metadata accessor for GamePolicyAssertion();
    objc_msgSendSuper2(&v7, sel_init);
    __swift_destroy_boxed_opaque_existential_1(a1);
  }
}

Swift::Void __swiftcall GamePolicyAssertion.acquire()()
{
  if (qword_269A33BD0 != -1) {
    swift_once();
  }
  swift_beginAccess();
  if (qword_269A35148)
  {
    sub_24F92A2A4((uint64_t)&static GamePolicyAssertion.delegate, (uint64_t)v3);
    uint64_t v1 = v4;
    uint64_t v2 = v5;
    __swift_project_boxed_opaque_existential_1(v3, v4);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 8))(v0, v1, v2);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v3);
  }
}

Swift::Void __swiftcall GamePolicyAssertion.invalidate()()
{
  if (qword_269A33BD0 != -1) {
    swift_once();
  }
  swift_beginAccess();
  if (qword_269A35148)
  {
    sub_24F92A2A4((uint64_t)&static GamePolicyAssertion.delegate, (uint64_t)v3);
    uint64_t v1 = v4;
    uint64_t v2 = v5;
    __swift_project_boxed_opaque_existential_1(v3, v4);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v0, v1, v2);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v3);
  }
}

id sub_24F929D54(void *a1, uint64_t a2, void (*a3)(void))
{
  id v4 = a1;
  a3();

  uint64_t v5 = (void *)sub_24F93C958();
  swift_bridgeObjectRelease();
  return v5;
}

unint64_t GamePolicyAssertion.description.getter()
{
  sub_24F93CB48();
  swift_bridgeObjectRelease();
  sub_24F93CBF8();
  sub_24F93C9C8();
  swift_bridgeObjectRelease();
  sub_24F93C9C8();
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC10GamePolicy19GamePolicyAssertion_target + 24);
  uint64_t v2 = *(void *)(v0 + OBJC_IVAR____TtC10GamePolicy19GamePolicyAssertion_target + 32);
  __swift_project_boxed_opaque_existential_1((void *)(v0 + OBJC_IVAR____TtC10GamePolicy19GamePolicyAssertion_target), v1);
  (*(void (**)(uint64_t, uint64_t))(v2 + 32))(v1, v2);
  sub_24F93C9C8();
  swift_bridgeObjectRelease();
  sub_24F93C9C8();
  uint64_t v3 = type metadata accessor for GamePolicyAssertion.Attribute();
  uint64_t v4 = swift_bridgeObjectRetain();
  MEMORY[0x253366090](v4, v3);
  sub_24F93C9C8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_24F93C9C8();
  return 0xD000000000000011;
}

void GamePolicyAssertion.init()()
{
}

id GamePolicyAssertion.__deallocating_deinit()
{
  return sub_24F92A78C(type metadata accessor for GamePolicyAssertion);
}

void sub_24F92A00C(void *a1@<X8>)
{
  *a1 = *(void *)(*v1 + OBJC_IVAR____TtC10GamePolicy19GamePolicyAssertion_identifier);
}

uint64_t static GamePolicyAssertion.Attribute.supportsSecureCoding.getter()
{
  return 1;
}

id GamePolicyAssertion.Attribute.__allocating_init(coder:)(void *a1)
{
  v5.receiver = objc_allocWithZone(v1);
  v5.super_class = v1;
  id v3 = objc_msgSendSuper2(&v5, sel_init);

  return v3;
}

id GamePolicyAssertion.Attribute.init(coder:)(void *a1)
{
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for GamePolicyAssertion.Attribute();
  id v3 = objc_msgSendSuper2(&v5, sel_init);

  return v3;
}

uint64_t type metadata accessor for GamePolicyAssertion.Attribute()
{
  return self;
}

uint64_t type metadata accessor for GamePolicyTargetDescription()
{
  return self;
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t __swift_destroy_boxed_opaque_existential_1(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t type metadata accessor for GamePolicyAssertion()
{
  return self;
}

uint64_t sub_24F92A1D4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A33E00);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24F92A23C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A33E00);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a2, a1, v4);
  return a2;
}

uint64_t sub_24F92A2A4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t GamePolicyAssertion.Attribute.description.getter()
{
  return 0x756269727474413CLL;
}

uint64_t static GamePolicyAssertion.Attribute.Privileged.supportsSecureCoding.getter()
{
  return 1;
}

id GamePolicyAssertion.Attribute.Privileged.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for GamePolicyAssertion.Attribute.Privileged();
  return objc_msgSendSuper2(&v2, sel_init);
}

uint64_t type metadata accessor for GamePolicyAssertion.Attribute.Privileged()
{
  return self;
}

uint64_t GamePolicyAssertion.Attribute.Privileged.description.getter()
{
  return 0x656C69766972503CLL;
}

id GamePolicyAssertion.Attribute.Privileged.__deallocating_deinit()
{
  return sub_24F92A78C(type metadata accessor for GamePolicyAssertion.Attribute.Privileged);
}

id GamePolicyAssertion.Attribute.__deallocating_deinit()
{
  return sub_24F92A78C(type metadata accessor for GamePolicyAssertion.Attribute);
}

uint64_t static GamePolicyAssertion.Grant.supportsSecureCoding.getter()
{
  return 1;
}

uint64_t GamePolicyAssertion.Grant.description.getter()
{
  return 0x3E746E6172473CLL;
}

id GamePolicyAssertion.Grant.__deallocating_deinit()
{
  return sub_24F92A78C(type metadata accessor for GamePolicyAssertion.Grant);
}

uint64_t type metadata accessor for GamePolicyAssertion.Grant()
{
  return self;
}

uint64_t static GamePolicyAssertion.Limitation.supportsSecureCoding.getter()
{
  return 1;
}

id _s10GamePolicy0aB9AssertionC9AttributeC10PrivilegedC5coderAGSgSo7NSCoderC_tcfC_0(void *a1)
{
  v5.receiver = objc_allocWithZone(v1);
  v5.super_class = (Class)type metadata accessor for GamePolicyAssertion.Attribute();
  id v3 = objc_msgSendSuper2(&v5, sel_init);

  return v3;
}

id _s10GamePolicy0aB9AssertionC5GrantC5coderAESgSo7NSCoderC_tcfc_0(void *a1)
{
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for GamePolicyAssertion.Attribute();
  id v3 = objc_msgSendSuper2(&v5, sel_init);

  return v3;
}

id sub_24F92A6CC(void *a1, uint64_t a2, uint64_t (*a3)(void))
{
  v4.receiver = a1;
  v4.super_class = (Class)a3();
  return objc_msgSendSuper2(&v4, sel_init);
}

uint64_t GamePolicyAssertion.Limitation.description.getter()
{
  return 0x746174696D694C3CLL;
}

id GamePolicyAssertion.Limitation.__deallocating_deinit()
{
  return sub_24F92A78C(type metadata accessor for GamePolicyAssertion.Limitation);
}

id sub_24F92A78C(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

uint64_t type metadata accessor for GamePolicyAssertion.Limitation()
{
  return self;
}

uint64_t sub_24F92A7E8(uint64_t a1)
{
  uint64_t result = sub_24F92A82C(&qword_269A33E08);
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_24F92A82C(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for GamePolicyTargetDescription();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_24F92A86C()
{
  return MEMORY[0x263F8D9E0];
}

uint64_t sub_24F92A890(uint64_t a1)
{
  int64_t v2 = *(void *)(a1 + 16);
  uint64_t v12 = MEMORY[0x263F8EE78];
  sub_24F92DEC0(0, v2, 0);
  uint64_t v3 = v12;
  if (v2)
  {
    for (uint64_t i = a1 + 32; ; i += 32)
    {
      sub_24F92E370(i, (uint64_t)v11);
      if (!swift_dynamicCast()) {
        break;
      }
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_24F92DEC0(0, *(void *)(v3 + 16) + 1, 1);
        uint64_t v3 = v12;
      }
      unint64_t v6 = *(void *)(v3 + 16);
      unint64_t v5 = *(void *)(v3 + 24);
      if (v6 >= v5 >> 1)
      {
        sub_24F92DEC0((char *)(v5 > 1), v6 + 1, 1);
        uint64_t v3 = v12;
      }
      *(void *)(v3 + 16) = v6 + 1;
      uint64_t v7 = v3 + 16 * v6;
      *(void *)(v7 + 32) = v9;
      *(void *)(v7 + 40) = v10;
      if (!--v2) {
        return v3;
      }
    }
    swift_release();
    swift_bridgeObjectRelease();
    return 0;
  }
  return v3;
}

uint64_t sub_24F92A9D8(uint64_t a1, void (*a2)(uint64_t))
{
  uint64_t v9 = MEMORY[0x263F8EE78];
  uint64_t v4 = *(void *)(a1 + 16);
  sub_24F93CB98();
  if (!v4) {
    return v9;
  }
  for (uint64_t i = a1 + 32; ; i += 32)
  {
    uint64_t v6 = sub_24F92E370(i, (uint64_t)v8);
    a2(v6);
    if (!swift_dynamicCast()) {
      break;
    }
    sub_24F93CB78();
    sub_24F93CBA8();
    sub_24F93CBB8();
    sub_24F93CB88();
    if (!--v4) {
      return v9;
    }
  }
  swift_release();

  return 0;
}

unint64_t GameModeCCUIStatusBundleState.init(rawValue:)(unint64_t a1)
{
  return sub_24F924650(a1);
}

char *GameModeCCUIStatusBundleInfo.supportsSecureCoding.unsafeMutableAddressor()
{
  return &static GameModeCCUIStatusBundleInfo.supportsSecureCoding;
}

uint64_t static GameModeCCUIStatusBundleInfo.supportsSecureCoding.getter()
{
  return static GameModeCCUIStatusBundleInfo.supportsSecureCoding;
}

uint64_t static GameModeCCUIStatusBundleInfo.supportsSecureCoding.setter(char a1)
{
  uint64_t result = swift_beginAccess();
  static GameModeCCUIStatusBundleInfo.supportsSecureCoding = a1;
  return result;
}

uint64_t (*static GameModeCCUIStatusBundleInfo.supportsSecureCoding.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t GameModeCCUIStatusBundleInfo.bundleIdentifier.getter()
{
  return sub_24F92CBA4(&OBJC_IVAR____TtC10GamePolicy28GameModeCCUIStatusBundleInfo_bundleIdentifier);
}

uint64_t GameModeCCUIStatusBundleInfo.bundleIdentifier.setter(uint64_t a1, uint64_t a2)
{
  return sub_24F92CC04(a1, a2, &OBJC_IVAR____TtC10GamePolicy28GameModeCCUIStatusBundleInfo_bundleIdentifier);
}

uint64_t (*GameModeCCUIStatusBundleInfo.bundleIdentifier.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t GameModeCCUIStatusBundleInfo.executableDisplayName.getter()
{
  return sub_24F92CBA4(&OBJC_IVAR____TtC10GamePolicy28GameModeCCUIStatusBundleInfo_executableDisplayName);
}

uint64_t GameModeCCUIStatusBundleInfo.executableDisplayName.setter(uint64_t a1, uint64_t a2)
{
  return sub_24F92CC04(a1, a2, &OBJC_IVAR____TtC10GamePolicy28GameModeCCUIStatusBundleInfo_executableDisplayName);
}

uint64_t (*GameModeCCUIStatusBundleInfo.executableDisplayName.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t GameModeCCUIStatusBundleInfo.isSystemService.getter()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC10GamePolicy28GameModeCCUIStatusBundleInfo_isSystemService);
  swift_beginAccess();
  return *v1;
}

uint64_t GameModeCCUIStatusBundleInfo.isSystemService.setter(char a1)
{
  uint64_t v3 = (unsigned char *)(v1 + OBJC_IVAR____TtC10GamePolicy28GameModeCCUIStatusBundleInfo_isSystemService);
  uint64_t result = swift_beginAccess();
  *uint64_t v3 = a1;
  return result;
}

uint64_t (*GameModeCCUIStatusBundleInfo.isSystemService.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t GameModeCCUIStatusBundleInfo.isAAAGame.getter()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC10GamePolicy28GameModeCCUIStatusBundleInfo_isAAAGame);
  swift_beginAccess();
  return *v1;
}

uint64_t GameModeCCUIStatusBundleInfo.isAAAGame.setter(char a1)
{
  uint64_t v3 = (unsigned char *)(v1 + OBJC_IVAR____TtC10GamePolicy28GameModeCCUIStatusBundleInfo_isAAAGame);
  uint64_t result = swift_beginAccess();
  *uint64_t v3 = a1;
  return result;
}

uint64_t (*GameModeCCUIStatusBundleInfo.isAAAGame.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t GameModeCCUIStatusBundleInfo.usedRecently.getter()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC10GamePolicy28GameModeCCUIStatusBundleInfo_usedRecently);
  swift_beginAccess();
  return *v1;
}

uint64_t GameModeCCUIStatusBundleInfo.usedRecently.setter(char a1)
{
  uint64_t v3 = (unsigned char *)(v1 + OBJC_IVAR____TtC10GamePolicy28GameModeCCUIStatusBundleInfo_usedRecently);
  uint64_t result = swift_beginAccess();
  *uint64_t v3 = a1;
  return result;
}

uint64_t (*GameModeCCUIStatusBundleInfo.usedRecently.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t GameModeCCUIStatusBundleInfo.state.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC10GamePolicy28GameModeCCUIStatusBundleInfo_state;
  swift_beginAccess();
  return *(void *)v1;
}

uint64_t GameModeCCUIStatusBundleInfo.state.setter(uint64_t a1)
{
  uint64_t v3 = (void *)(v1 + OBJC_IVAR____TtC10GamePolicy28GameModeCCUIStatusBundleInfo_state);
  uint64_t result = swift_beginAccess();
  *uint64_t v3 = a1;
  return result;
}

uint64_t (*GameModeCCUIStatusBundleInfo.state.modify())()
{
  return j_j__swift_endAccess;
}

id GameModeCCUIStatusBundleInfo.__allocating_init(executableDisplayName:bundleIdentifier:isSystemService:isAAAGame:usedRecently:state:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, char a6, char a7, uint64_t a8)
{
  int v17 = objc_allocWithZone(v8);
  uint64_t v18 = &v17[OBJC_IVAR____TtC10GamePolicy28GameModeCCUIStatusBundleInfo_executableDisplayName];
  *uint64_t v18 = a1;
  v18[1] = a2;
  int v19 = &v17[OBJC_IVAR____TtC10GamePolicy28GameModeCCUIStatusBundleInfo_bundleIdentifier];
  *int v19 = a3;
  v19[1] = a4;
  v17[OBJC_IVAR____TtC10GamePolicy28GameModeCCUIStatusBundleInfo_isSystemService] = a5;
  v17[OBJC_IVAR____TtC10GamePolicy28GameModeCCUIStatusBundleInfo_isAAAGame] = a6;
  v17[OBJC_IVAR____TtC10GamePolicy28GameModeCCUIStatusBundleInfo_usedRecently] = a7;
  *(void *)&v17[OBJC_IVAR____TtC10GamePolicy28GameModeCCUIStatusBundleInfo_state] = a8;
  v21.receiver = v17;
  v21.super_class = v8;
  return objc_msgSendSuper2(&v21, sel_init);
}

id GameModeCCUIStatusBundleInfo.init(executableDisplayName:bundleIdentifier:isSystemService:isAAAGame:usedRecently:state:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, char a6, char a7, uint64_t a8)
{
  uint64_t v9 = &v8[OBJC_IVAR____TtC10GamePolicy28GameModeCCUIStatusBundleInfo_executableDisplayName];
  *uint64_t v9 = a1;
  v9[1] = a2;
  uint64_t v10 = &v8[OBJC_IVAR____TtC10GamePolicy28GameModeCCUIStatusBundleInfo_bundleIdentifier];
  *uint64_t v10 = a3;
  v10[1] = a4;
  v8[OBJC_IVAR____TtC10GamePolicy28GameModeCCUIStatusBundleInfo_isSystemService] = a5;
  v8[OBJC_IVAR____TtC10GamePolicy28GameModeCCUIStatusBundleInfo_isAAAGame] = a6;
  v8[OBJC_IVAR____TtC10GamePolicy28GameModeCCUIStatusBundleInfo_usedRecently] = a7;
  *(void *)&v8[OBJC_IVAR____TtC10GamePolicy28GameModeCCUIStatusBundleInfo_state] = a8;
  v12.receiver = v8;
  v12.super_class = (Class)type metadata accessor for GameModeCCUIStatusBundleInfo();
  return objc_msgSendSuper2(&v12, sel_init);
}

id GameModeCCUIStatusBundleInfo.revlock.getter()
{
  uint64_t v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC10GamePolicy28GameModeCCUIStatusBundleInfo_executableDisplayName);
  swift_beginAccess();
  uint64_t v3 = *v1;
  uint64_t v2 = v1[1];
  uint64_t v4 = (uint64_t *)(v0 + OBJC_IVAR____TtC10GamePolicy28GameModeCCUIStatusBundleInfo_bundleIdentifier);
  swift_beginAccess();
  uint64_t v6 = *v4;
  uint64_t v5 = v4[1];
  uint64_t v7 = (char *)(v0 + OBJC_IVAR____TtC10GamePolicy28GameModeCCUIStatusBundleInfo_isSystemService);
  swift_beginAccess();
  char v8 = *v7;
  uint64_t v9 = (unsigned char *)(v0 + OBJC_IVAR____TtC10GamePolicy28GameModeCCUIStatusBundleInfo_usedRecently);
  swift_beginAccess();
  LOBYTE(v9) = *v9;
  uint64_t v10 = (uint64_t *)(v0 + OBJC_IVAR____TtC10GamePolicy28GameModeCCUIStatusBundleInfo_state);
  swift_beginAccess();
  uint64_t v11 = *v10;
  objc_super v12 = (objc_class *)type metadata accessor for GameModeCCUIStatusBundle();
  id v13 = objc_allocWithZone(v12);
  BOOL v14 = &v13[OBJC_IVAR____TtC10GamePolicy24GameModeCCUIStatusBundle_executableDisplayName];
  *BOOL v14 = v3;
  v14[1] = v2;
  int v15 = &v13[OBJC_IVAR____TtC10GamePolicy24GameModeCCUIStatusBundle_bundleIdentifier];
  *int v15 = v6;
  v15[1] = v5;
  v13[OBJC_IVAR____TtC10GamePolicy24GameModeCCUIStatusBundle_isSystemService] = v8;
  v13[OBJC_IVAR____TtC10GamePolicy24GameModeCCUIStatusBundle_usedRecently] = (_BYTE)v9;
  *(void *)&v13[OBJC_IVAR____TtC10GamePolicy24GameModeCCUIStatusBundle_state] = v11;
  v17.receiver = v13;
  v17.super_class = v12;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return objc_msgSendSuper2(&v17, sel_init);
}

id GameModeCCUIStatusBundle.__allocating_init(executableDisplayName:bundleIdentifier:isSystemService:usedRecently:state:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, char a6, uint64_t a7)
{
  int v15 = objc_allocWithZone(v7);
  id v16 = &v15[OBJC_IVAR____TtC10GamePolicy24GameModeCCUIStatusBundle_executableDisplayName];
  *id v16 = a1;
  v16[1] = a2;
  objc_super v17 = &v15[OBJC_IVAR____TtC10GamePolicy24GameModeCCUIStatusBundle_bundleIdentifier];
  *objc_super v17 = a3;
  v17[1] = a4;
  v15[OBJC_IVAR____TtC10GamePolicy24GameModeCCUIStatusBundle_isSystemService] = a5;
  v15[OBJC_IVAR____TtC10GamePolicy24GameModeCCUIStatusBundle_usedRecently] = a6;
  *(void *)&v15[OBJC_IVAR____TtC10GamePolicy24GameModeCCUIStatusBundle_state] = a7;
  v19.receiver = v15;
  v19.super_class = v7;
  return objc_msgSendSuper2(&v19, sel_init);
}

Swift::Void __swiftcall GameModeCCUIStatusBundleInfo.encode(with:)(NSCoder with)
{
  swift_beginAccess();
  swift_bridgeObjectRetain();
  uint64_t v3 = (void *)sub_24F93C958();
  swift_bridgeObjectRelease();
  uint64_t v4 = (void *)sub_24F93C958();
  [(objc_class *)with.super.isa encodeObject:v3 forKey:v4];

  swift_beginAccess();
  swift_bridgeObjectRetain();
  uint64_t v5 = (void *)sub_24F93C958();
  swift_bridgeObjectRelease();
  uint64_t v6 = (void *)sub_24F93C958();
  [(objc_class *)with.super.isa encodeObject:v5 forKey:v6];

  uint64_t v7 = (unsigned __int8 *)(v1 + OBJC_IVAR____TtC10GamePolicy28GameModeCCUIStatusBundleInfo_isSystemService);
  swift_beginAccess();
  uint64_t v8 = *v7;
  uint64_t v9 = (void *)sub_24F93C958();
  [(objc_class *)with.super.isa encodeBool:v8 forKey:v9];

  uint64_t v10 = (unsigned __int8 *)(v1 + OBJC_IVAR____TtC10GamePolicy28GameModeCCUIStatusBundleInfo_usedRecently);
  swift_beginAccess();
  uint64_t v11 = *v10;
  objc_super v12 = (void *)sub_24F93C958();
  [(objc_class *)with.super.isa encodeBool:v11 forKey:v12];

  id v13 = (uint64_t *)(v1 + OBJC_IVAR____TtC10GamePolicy28GameModeCCUIStatusBundleInfo_state);
  swift_beginAccess();
  uint64_t v14 = *v13;
  int v15 = (void *)sub_24F93C958();
  [(objc_class *)with.super.isa encodeInteger:v14 forKey:v15];

  id v16 = (unsigned __int8 *)(v1 + OBJC_IVAR____TtC10GamePolicy28GameModeCCUIStatusBundleInfo_isAAAGame);
  swift_beginAccess();
  uint64_t v17 = *v16;
  uint64_t v18 = (void *)sub_24F93C958();
  [(objc_class *)with.super.isa encodeBool:v17 forKey:v18];
}

uint64_t GameModeCCUIStatusBundleInfo.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return GameModeCCUIStatusBundleInfo.init(coder:)(a1);
}

uint64_t GameModeCCUIStatusBundleInfo.init(coder:)(void *a1)
{
  id v3 = v1;
  uint64_t v4 = (void *)sub_24F93C958();
  objc_msgSend(a1, sel_decodeIntegerForKey_, v4);

  sub_24F92E02C();
  uint64_t v5 = sub_24F93CAB8();
  if (v5)
  {
    uint64_t v6 = (void *)v5;
    uint64_t v8 = 0;
    sub_24F93C968();
  }
  type metadata accessor for GameModeCCUIStatusBundleInfo();
  swift_deallocPartialClassInstance();
  return 0;
}

void GameModeCCUIStatusBundleInfo.init()()
{
}

id GameModeCCUIStatusBundleInfo.__deallocating_deinit()
{
  return sub_24F92DE78(type metadata accessor for GameModeCCUIStatusBundleInfo);
}

char *GameModeCCUIStatusInfo.supportsSecureCoding.unsafeMutableAddressor()
{
  return &static GameModeCCUIStatusInfo.supportsSecureCoding;
}

uint64_t static GameModeCCUIStatusInfo.supportsSecureCoding.getter()
{
  return static GameModeCCUIStatusInfo.supportsSecureCoding;
}

uint64_t static GameModeCCUIStatusInfo.supportsSecureCoding.setter(char a1)
{
  uint64_t result = swift_beginAccess();
  static GameModeCCUIStatusInfo.supportsSecureCoding = a1;
  return result;
}

uint64_t (*static GameModeCCUIStatusInfo.supportsSecureCoding.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t GameModeCCUIStatusInfo.state.getter()
{
  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC10GamePolicy22GameModeCCUIStatusInfo_state);
}

uint64_t GameModeCCUIStatusInfo.bundles.getter()
{
  return sub_24F92D808();
}

uint64_t GameModeCCUIStatusInfo.bundles.setter(uint64_t a1)
{
  return sub_24F92D85C(a1, &OBJC_IVAR____TtC10GamePolicy22GameModeCCUIStatusInfo_bundles);
}

uint64_t (*GameModeCCUIStatusInfo.bundles.modify())()
{
  return j_j__swift_endAccess;
}

id GameModeCCUIStatusInfo.__allocating_init(state:bundles:)(char a1, uint64_t a2)
{
  return sub_24F92C154(a1, a2, &OBJC_IVAR____TtC10GamePolicy22GameModeCCUIStatusInfo_state, &OBJC_IVAR____TtC10GamePolicy22GameModeCCUIStatusInfo_bundles);
}

id GameModeCCUIStatusInfo.init(state:bundles:)(char a1, uint64_t a2)
{
  return sub_24F92D930(a1, a2, &OBJC_IVAR____TtC10GamePolicy22GameModeCCUIStatusInfo_state, &OBJC_IVAR____TtC10GamePolicy22GameModeCCUIStatusInfo_bundles, type metadata accessor for GameModeCCUIStatusInfo);
}

id GameModeCCUIStatusInfo.revlock.getter()
{
  char v1 = *(unsigned char *)(v0 + OBJC_IVAR____TtC10GamePolicy22GameModeCCUIStatusInfo_state);
  uint64_t v2 = (unint64_t *)(v0 + OBJC_IVAR____TtC10GamePolicy22GameModeCCUIStatusInfo_bundles);
  swift_beginAccess();
  unint64_t v3 = *v2;
  if (!(v3 >> 62))
  {
    uint64_t v4 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v4) {
      goto LABEL_3;
    }
LABEL_11:
    swift_bridgeObjectRelease();
    uint64_t v25 = MEMORY[0x263F8EE78];
LABEL_12:
    objc_super v26 = (objc_class *)type metadata accessor for GameModeCCUIStatus();
    v27 = objc_allocWithZone(v26);
    v27[OBJC_IVAR____TtC10GamePolicy18GameModeCCUIStatus_state] = v1;
    *(void *)&v27[OBJC_IVAR____TtC10GamePolicy18GameModeCCUIStatus_bundles] = v25;
    v32.receiver = v27;
    v32.super_class = v26;
    return objc_msgSendSuper2(&v32, sel_init);
  }
  swift_bridgeObjectRetain();
  uint64_t v4 = sub_24F93CBD8();
  if (!v4) {
    goto LABEL_11;
  }
LABEL_3:
  uint64_t v34 = MEMORY[0x263F8EE78];
  id result = (id)sub_24F93CB98();
  if ((v4 & 0x8000000000000000) == 0)
  {
    char v28 = v1;
    uint64_t v6 = 0;
    unint64_t v29 = v3 & 0xC000000000000001;
    uint64_t v30 = v4;
    unint64_t v31 = v3;
    do
    {
      if (v29) {
        uint64_t v7 = (char *)MEMORY[0x253366170](v6, v3);
      }
      else {
        uint64_t v7 = (char *)*(id *)(v3 + 8 * v6 + 32);
      }
      uint64_t v8 = v7;
      ++v6;
      uint64_t v9 = &v7[OBJC_IVAR____TtC10GamePolicy28GameModeCCUIStatusBundleInfo_executableDisplayName];
      swift_beginAccess();
      uint64_t v11 = *(void *)v9;
      uint64_t v10 = *((void *)v9 + 1);
      objc_super v12 = &v8[OBJC_IVAR____TtC10GamePolicy28GameModeCCUIStatusBundleInfo_bundleIdentifier];
      swift_beginAccess();
      uint64_t v14 = *(void *)v12;
      uint64_t v13 = *((void *)v12 + 1);
      int v15 = &v8[OBJC_IVAR____TtC10GamePolicy28GameModeCCUIStatusBundleInfo_isSystemService];
      swift_beginAccess();
      char v16 = *v15;
      uint64_t v17 = &v8[OBJC_IVAR____TtC10GamePolicy28GameModeCCUIStatusBundleInfo_usedRecently];
      swift_beginAccess();
      char v18 = *v17;
      objc_super v19 = &v8[OBJC_IVAR____TtC10GamePolicy28GameModeCCUIStatusBundleInfo_state];
      swift_beginAccess();
      uint64_t v20 = *(void *)v19;
      objc_super v21 = (objc_class *)type metadata accessor for GameModeCCUIStatusBundle();
      uint64_t v22 = objc_allocWithZone(v21);
      objc_super v23 = &v22[OBJC_IVAR____TtC10GamePolicy24GameModeCCUIStatusBundle_executableDisplayName];
      *objc_super v23 = v11;
      v23[1] = v10;
      uint64_t v24 = &v22[OBJC_IVAR____TtC10GamePolicy24GameModeCCUIStatusBundle_bundleIdentifier];
      *uint64_t v24 = v14;
      v24[1] = v13;
      v22[OBJC_IVAR____TtC10GamePolicy24GameModeCCUIStatusBundle_isSystemService] = v16;
      v22[OBJC_IVAR____TtC10GamePolicy24GameModeCCUIStatusBundle_usedRecently] = v18;
      *(void *)&v22[OBJC_IVAR____TtC10GamePolicy24GameModeCCUIStatusBundle_state] = v20;
      v33.receiver = v22;
      v33.super_class = v21;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      objc_msgSendSuper2(&v33, sel_init);

      sub_24F93CB78();
      sub_24F93CBA8();
      sub_24F93CBB8();
      sub_24F93CB88();
      unint64_t v3 = v31;
    }
    while (v30 != v6);
    uint64_t v25 = v34;
    swift_bridgeObjectRelease();
    char v1 = v28;
    goto LABEL_12;
  }
  __break(1u);
  return result;
}

id GameModeCCUIStatus.__allocating_init(state:bundles:)(char a1, uint64_t a2)
{
  return sub_24F92C154(a1, a2, &OBJC_IVAR____TtC10GamePolicy18GameModeCCUIStatus_state, &OBJC_IVAR____TtC10GamePolicy18GameModeCCUIStatus_bundles);
}

id sub_24F92C154(char a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v9 = objc_allocWithZone(v4);
  v9[*a3] = a1;
  *(void *)&v9[*a4] = a2;
  v11.receiver = v9;
  v11.super_class = v4;
  return objc_msgSendSuper2(&v11, sel_init);
}

Swift::Void __swiftcall GameModeCCUIStatusInfo.encode(with:)(NSCoder with)
{
}

uint64_t GameModeCCUIStatusState.rawValue.getter(char a1)
{
  uint64_t result = 0x664F646563726F66;
  switch(a1)
  {
    case 1:
      uint64_t result = 0x616C696176616E75;
      break;
    case 2:
      uint64_t result = 0x6C62616C69617661;
      break;
    case 3:
      uint64_t result = 0x64656C62616E65;
      break;
    case 4:
      uint64_t result = 0x6E4F646563726F66;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t GameModeCCUIStatusInfo.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return GameModeCCUIStatusInfo.init(coder:)(a1);
}

uint64_t GameModeCCUIStatusInfo.init(coder:)(void *a1)
{
  uint64_t v2 = v1;
  sub_24F92E02C();
  id v4 = v2;
  uint64_t v5 = sub_24F93CAB8();
  if (v5)
  {
    uint64_t v6 = (void *)v5;
    uint64_t v8 = 0;
    uint64_t v9 = 0;
    sub_24F93C968();
  }
  type metadata accessor for GameModeCCUIStatusInfo();
  swift_deallocPartialClassInstance();
  return 0;
}

void GameModeCCUIStatusInfo.init()()
{
}

id GameModeCCUIStatusInfo.__deallocating_deinit()
{
  return sub_24F92DE78(type metadata accessor for GameModeCCUIStatusInfo);
}

uint64_t sub_24F92C594(unsigned __int8 *a1, char *a2)
{
  return sub_24F92E3E0(*a1, *a2);
}

uint64_t sub_24F92C5A0()
{
  return sub_24F93CC38();
}

uint64_t sub_24F92C6AC()
{
  sub_24F93C9A8();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24F92C7A0()
{
  return sub_24F93CC38();
}

uint64_t sub_24F92C8A8@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = _s10GamePolicy0A19ModeCCUIStatusStateO8rawValueACSgSS_tcfC_0();
  *a1 = result;
  return result;
}

void sub_24F92C8D8(uint64_t *a1@<X8>)
{
  unint64_t v2 = 0xE900000000000066;
  uint64_t v3 = 0x664F646563726F66;
  switch(*v1)
  {
    case 1:
      unint64_t v2 = 0xEB00000000656C62;
      uint64_t v3 = 0x616C696176616E75;
      goto LABEL_3;
    case 2:
      *a1 = 0x6C62616C69617661;
      a1[1] = 0xE900000000000065;
      break;
    case 3:
      *a1 = 0x64656C62616E65;
      a1[1] = 0xE700000000000000;
      break;
    case 4:
      *a1 = 0x6E4F646563726F66;
      a1[1] = 0xE800000000000000;
      break;
    default:
LABEL_3:
      *a1 = v3;
      a1[1] = v2;
      break;
  }
}

char *GameModeCCUIStatusBundle.supportsSecureCoding.unsafeMutableAddressor()
{
  return &static GameModeCCUIStatusBundle.supportsSecureCoding;
}

uint64_t static GameModeCCUIStatusBundle.supportsSecureCoding.getter()
{
  return static GameModeCCUIStatusBundle.supportsSecureCoding;
}

uint64_t static GameModeCCUIStatusBundle.supportsSecureCoding.setter(char a1)
{
  uint64_t result = swift_beginAccess();
  static GameModeCCUIStatusBundle.supportsSecureCoding = a1;
  return result;
}

uint64_t (*static GameModeCCUIStatusBundle.supportsSecureCoding.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t GameModeCCUIStatusBundle.bundleIdentifier.getter()
{
  return sub_24F92CBA4(&OBJC_IVAR____TtC10GamePolicy24GameModeCCUIStatusBundle_bundleIdentifier);
}

uint64_t GameModeCCUIStatusBundle.bundleIdentifier.setter(uint64_t a1, uint64_t a2)
{
  return sub_24F92CC04(a1, a2, &OBJC_IVAR____TtC10GamePolicy24GameModeCCUIStatusBundle_bundleIdentifier);
}

uint64_t (*GameModeCCUIStatusBundle.bundleIdentifier.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t GameModeCCUIStatusBundle.executableDisplayName.getter()
{
  return sub_24F92CBA4(&OBJC_IVAR____TtC10GamePolicy24GameModeCCUIStatusBundle_executableDisplayName);
}

uint64_t sub_24F92CBA4(void *a1)
{
  unint64_t v2 = (uint64_t *)(v1 + *a1);
  swift_beginAccess();
  uint64_t v3 = *v2;
  swift_bridgeObjectRetain();
  return v3;
}

uint64_t GameModeCCUIStatusBundle.executableDisplayName.setter(uint64_t a1, uint64_t a2)
{
  return sub_24F92CC04(a1, a2, &OBJC_IVAR____TtC10GamePolicy24GameModeCCUIStatusBundle_executableDisplayName);
}

uint64_t sub_24F92CC04(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6 = (void *)(v3 + *a3);
  swift_beginAccess();
  void *v6 = a1;
  v6[1] = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*GameModeCCUIStatusBundle.executableDisplayName.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t GameModeCCUIStatusBundle.isSystemService.getter()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC10GamePolicy24GameModeCCUIStatusBundle_isSystemService);
  swift_beginAccess();
  return *v1;
}

uint64_t GameModeCCUIStatusBundle.isSystemService.setter(char a1)
{
  uint64_t v3 = (unsigned char *)(v1 + OBJC_IVAR____TtC10GamePolicy24GameModeCCUIStatusBundle_isSystemService);
  uint64_t result = swift_beginAccess();
  *uint64_t v3 = a1;
  return result;
}

uint64_t (*GameModeCCUIStatusBundle.isSystemService.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t GameModeCCUIStatusBundle.usedRecently.getter()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC10GamePolicy24GameModeCCUIStatusBundle_usedRecently);
  swift_beginAccess();
  return *v1;
}

uint64_t GameModeCCUIStatusBundle.usedRecently.setter(char a1)
{
  uint64_t v3 = (unsigned char *)(v1 + OBJC_IVAR____TtC10GamePolicy24GameModeCCUIStatusBundle_usedRecently);
  uint64_t result = swift_beginAccess();
  *uint64_t v3 = a1;
  return result;
}

uint64_t (*GameModeCCUIStatusBundle.usedRecently.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t GameModeCCUIStatusBundle.state.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC10GamePolicy24GameModeCCUIStatusBundle_state;
  swift_beginAccess();
  return *(void *)v1;
}

uint64_t GameModeCCUIStatusBundle.state.setter(uint64_t a1)
{
  uint64_t v3 = (void *)(v1 + OBJC_IVAR____TtC10GamePolicy24GameModeCCUIStatusBundle_state);
  uint64_t result = swift_beginAccess();
  *uint64_t v3 = a1;
  return result;
}

uint64_t (*GameModeCCUIStatusBundle.state.modify())()
{
  return j_j__swift_endAccess;
}

id GameModeCCUIStatusBundle.init(executableDisplayName:bundleIdentifier:isSystemService:usedRecently:state:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, char a6, uint64_t a7)
{
  uint64_t v8 = &v7[OBJC_IVAR____TtC10GamePolicy24GameModeCCUIStatusBundle_executableDisplayName];
  *uint64_t v8 = a1;
  v8[1] = a2;
  uint64_t v9 = &v7[OBJC_IVAR____TtC10GamePolicy24GameModeCCUIStatusBundle_bundleIdentifier];
  *uint64_t v9 = a3;
  v9[1] = a4;
  v7[OBJC_IVAR____TtC10GamePolicy24GameModeCCUIStatusBundle_isSystemService] = a5;
  v7[OBJC_IVAR____TtC10GamePolicy24GameModeCCUIStatusBundle_usedRecently] = a6;
  *(void *)&v7[OBJC_IVAR____TtC10GamePolicy24GameModeCCUIStatusBundle_state] = a7;
  v11.receiver = v7;
  v11.super_class = (Class)type metadata accessor for GameModeCCUIStatusBundle();
  return objc_msgSendSuper2(&v11, sel_init);
}

Swift::Void __swiftcall GameModeCCUIStatusBundle.encode(with:)(NSCoder with)
{
  swift_beginAccess();
  swift_bridgeObjectRetain();
  uint64_t v3 = (void *)sub_24F93C958();
  swift_bridgeObjectRelease();
  id v4 = (void *)sub_24F93C958();
  [(objc_class *)with.super.isa encodeObject:v3 forKey:v4];

  swift_beginAccess();
  swift_bridgeObjectRetain();
  uint64_t v5 = (void *)sub_24F93C958();
  swift_bridgeObjectRelease();
  uint64_t v6 = (void *)sub_24F93C958();
  [(objc_class *)with.super.isa encodeObject:v5 forKey:v6];

  uint64_t v7 = (unsigned __int8 *)(v1 + OBJC_IVAR____TtC10GamePolicy24GameModeCCUIStatusBundle_isSystemService);
  swift_beginAccess();
  uint64_t v8 = *v7;
  uint64_t v9 = (void *)sub_24F93C958();
  [(objc_class *)with.super.isa encodeBool:v8 forKey:v9];

  uint64_t v10 = (unsigned __int8 *)(v1 + OBJC_IVAR____TtC10GamePolicy24GameModeCCUIStatusBundle_usedRecently);
  swift_beginAccess();
  uint64_t v11 = *v10;
  objc_super v12 = (void *)sub_24F93C958();
  [(objc_class *)with.super.isa encodeBool:v11 forKey:v12];

  uint64_t v13 = (uint64_t *)(v1 + OBJC_IVAR____TtC10GamePolicy24GameModeCCUIStatusBundle_state);
  swift_beginAccess();
  uint64_t v14 = *v13;
  int v15 = (void *)sub_24F93C958();
  [(objc_class *)with.super.isa encodeInteger:v14 forKey:v15];
}

uint64_t GameModeCCUIStatusBundle.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return GameModeCCUIStatusBundle.init(coder:)(a1);
}

uint64_t GameModeCCUIStatusBundle.init(coder:)(void *a1)
{
  id v3 = v1;
  id v4 = (void *)sub_24F93C958();
  objc_msgSend(a1, sel_decodeIntegerForKey_, v4);

  sub_24F92E02C();
  uint64_t v5 = sub_24F93CAB8();
  if (v5)
  {
    uint64_t v6 = (void *)v5;
    uint64_t v8 = 0;
    sub_24F93C968();
  }
  type metadata accessor for GameModeCCUIStatusBundle();
  swift_deallocPartialClassInstance();
  return 0;
}

void GameModeCCUIStatusBundle.init()()
{
}

id GameModeCCUIStatusBundle.__deallocating_deinit()
{
  return sub_24F92DE78(type metadata accessor for GameModeCCUIStatusBundle);
}

uint64_t sub_24F92D620()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

char *GameModeCCUIStatus.supportsSecureCoding.unsafeMutableAddressor()
{
  return &static GameModeCCUIStatus.supportsSecureCoding;
}

uint64_t static GameModeCCUIStatus.supportsSecureCoding.getter()
{
  return static GameModeCCUIStatus.supportsSecureCoding;
}

uint64_t static GameModeCCUIStatus.supportsSecureCoding.setter(char a1)
{
  uint64_t result = swift_beginAccess();
  static GameModeCCUIStatus.supportsSecureCoding = a1;
  return result;
}

uint64_t (*static GameModeCCUIStatus.supportsSecureCoding.modify())()
{
  return j__swift_endAccess;
}

uint64_t GameModeCCUIStatus.state.getter()
{
  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC10GamePolicy18GameModeCCUIStatus_state);
}

uint64_t GameModeCCUIStatus.bundles.getter()
{
  return sub_24F92D808();
}

uint64_t sub_24F92D808()
{
  return swift_bridgeObjectRetain();
}

uint64_t GameModeCCUIStatus.bundles.setter(uint64_t a1)
{
  return sub_24F92D85C(a1, &OBJC_IVAR____TtC10GamePolicy18GameModeCCUIStatus_bundles);
}

uint64_t sub_24F92D85C(uint64_t a1, void *a2)
{
  id v4 = (void *)(v2 + *a2);
  swift_beginAccess();
  void *v4 = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*GameModeCCUIStatus.bundles.modify())()
{
  return j_j__swift_endAccess;
}

id GameModeCCUIStatus.init(state:bundles:)(char a1, uint64_t a2)
{
  return sub_24F92D930(a1, a2, &OBJC_IVAR____TtC10GamePolicy18GameModeCCUIStatus_state, &OBJC_IVAR____TtC10GamePolicy18GameModeCCUIStatus_bundles, type metadata accessor for GameModeCCUIStatus);
}

id sub_24F92D930(char a1, uint64_t a2, void *a3, void *a4, uint64_t (*a5)(void))
{
  v5[*a3] = a1;
  *(void *)&v5[*a4] = a2;
  v7.receiver = v5;
  v7.super_class = (Class)a5();
  return objc_msgSendSuper2(&v7, sel_init);
}

Swift::Void __swiftcall GameModeCCUIStatus.encode(with:)(NSCoder with)
{
}

void sub_24F92D9A0(void *a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t))
{
  uint64_t v6 = (void *)sub_24F93C958();
  swift_bridgeObjectRelease();
  objc_super v7 = (void *)sub_24F93C958();
  objc_msgSend(a1, sel_encodeObject_forKey_, v6, v7);

  uint64_t v8 = swift_beginAccess();
  a4(v8);
  swift_bridgeObjectRetain();
  uint64_t v9 = (void *)sub_24F93CA58();
  swift_bridgeObjectRelease();
  uint64_t v10 = (void *)sub_24F93C958();
  objc_msgSend(a1, sel_encodeObject_forKey_, v9, v10);
}

uint64_t GameModeCCUIStatus.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return GameModeCCUIStatus.init(coder:)(a1);
}

uint64_t GameModeCCUIStatus.init(coder:)(void *a1)
{
  uint64_t v2 = v1;
  sub_24F92E02C();
  id v4 = v2;
  uint64_t v5 = sub_24F93CAB8();
  if (v5)
  {
    uint64_t v6 = (void *)v5;
    uint64_t v8 = 0;
    uint64_t v9 = 0;
    sub_24F93C968();
  }
  type metadata accessor for GameModeCCUIStatus();
  swift_deallocPartialClassInstance();
  return 0;
}

id GameModeCCUIStatus.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void GameModeCCUIStatus.init()()
{
}

id GameModeCCUIStatus.__deallocating_deinit()
{
  return sub_24F92DE78(type metadata accessor for GameModeCCUIStatus);
}

id sub_24F92DE78(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

char *sub_24F92DEC0(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_24F92DEE0(a1, a2, a3, *v3);
  *objc_super v3 = result;
  return result;
}

char *sub_24F92DEE0(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(qword_269A33EB0);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

uint64_t type metadata accessor for GameModeCCUIStatusBundleInfo()
{
  return self;
}

uint64_t type metadata accessor for GameModeCCUIStatusBundle()
{
  return self;
}

unint64_t sub_24F92E02C()
{
  unint64_t result = qword_269A33C70;
  if (!qword_269A33C70)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_269A33C70);
  }
  return result;
}

uint64_t type metadata accessor for GameModeCCUIStatusInfo()
{
  return self;
}

uint64_t type metadata accessor for GameModeCCUIStatus()
{
  return self;
}

uint64_t _s10GamePolicy0A19ModeCCUIStatusStateO8rawValueACSgSS_tcfC_0()
{
  unint64_t v0 = sub_24F93CBE8();
  swift_bridgeObjectRelease();
  if (v0 >= 5) {
    return 5;
  }
  else {
    return v0;
  }
}

unint64_t sub_24F92E104()
{
  unint64_t result = qword_269A33EA0;
  if (!qword_269A33EA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A33EA0);
  }
  return result;
}

unint64_t sub_24F92E15C()
{
  unint64_t result = qword_269A33EA8;
  if (!qword_269A33EA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A33EA8);
  }
  return result;
}

ValueMetadata *type metadata accessor for GameModeCCUIStatusBundleState()
{
  return &type metadata for GameModeCCUIStatusBundleState;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for GameModeCCUIStatusState(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFC) {
    goto LABEL_17;
  }
  if (a2 + 4 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 4) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 4;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 4;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 4;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 5;
  int v8 = v6 - 5;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for GameModeCCUIStatusState(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 4 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 4) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFC) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFB)
  {
    unsigned int v6 = ((a2 - 252) >> 8) + 1;
    *unint64_t result = a2 + 4;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x24F92E328);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *unint64_t result = a2 + 4;
        break;
    }
  }
  return result;
}

uint64_t sub_24F92E350(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_24F92E358(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for GameModeCCUIStatusState()
{
  return &type metadata for GameModeCCUIStatusState;
}

uint64_t sub_24F92E370(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_24F92E3E0(unsigned __int8 a1, char a2)
{
  uint64_t v2 = 0x664F646563726F66;
  unint64_t v3 = 0xE900000000000066;
  uint64_t v4 = a1;
  uint64_t v5 = 0x664F646563726F66;
  switch(v4)
  {
    case 1:
      uint64_t v5 = 0x616C696176616E75;
      unint64_t v3 = 0xEB00000000656C62;
      break;
    case 2:
      uint64_t v5 = 0x6C62616C69617661;
      unint64_t v3 = 0xE900000000000065;
      break;
    case 3:
      unint64_t v3 = 0xE700000000000000;
      uint64_t v5 = 0x64656C62616E65;
      break;
    case 4:
      unint64_t v3 = 0xE800000000000000;
      uint64_t v5 = 0x6E4F646563726F66;
      break;
    default:
      break;
  }
  unint64_t v6 = 0xE900000000000066;
  switch(a2)
  {
    case 1:
      unint64_t v6 = 0xEB00000000656C62;
      if (v5 == 0x616C696176616E75) {
        goto LABEL_13;
      }
      goto LABEL_16;
    case 2:
      unint64_t v6 = 0xE900000000000065;
      if (v5 != 0x6C62616C69617661) {
        goto LABEL_16;
      }
      goto LABEL_13;
    case 3:
      unint64_t v6 = 0xE700000000000000;
      uint64_t v2 = 0x64656C62616E65;
      goto LABEL_12;
    case 4:
      unint64_t v6 = 0xE800000000000000;
      if (v5 != 0x6E4F646563726F66) {
        goto LABEL_16;
      }
      goto LABEL_13;
    default:
LABEL_12:
      if (v5 != v2) {
        goto LABEL_16;
      }
LABEL_13:
      if (v3 == v6) {
        char v7 = 1;
      }
      else {
LABEL_16:
      }
        char v7 = sub_24F93CC08();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v7 & 1;
  }
}

uint64_t sub_24F92E5CC(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    unint64_t v3 = 0x4D656D6147414141;
  }
  else {
    unint64_t v3 = 0xD000000000000010;
  }
  if (v2) {
    unint64_t v4 = 0x800000024F93E810;
  }
  else {
    unint64_t v4 = 0xEB0000000065646FLL;
  }
  if (a2) {
    unint64_t v5 = 0x4D656D6147414141;
  }
  else {
    unint64_t v5 = 0xD000000000000010;
  }
  if (a2) {
    unint64_t v6 = 0xEB0000000065646FLL;
  }
  else {
    unint64_t v6 = 0x800000024F93E810;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = sub_24F93CC08();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t static ModelManagerGameAssertionPolicy.< infix(_:_:)(char a1, unsigned __int8 a2)
{
  return ((a1 & 1) == 0) & a2;
}

GamePolicy::ModelManagerGameAssertionPolicy_optional __swiftcall ModelManagerGameAssertionPolicy.init(rawValue:)(Swift::String rawValue)
{
  uint64_t v1 = sub_24F93CBE8();
  swift_bridgeObjectRelease();
  if (v1 == 1) {
    v2.value = GamePolicy_ModelManagerGameAssertionPolicy_aaaGameMode;
  }
  else {
    v2.value = GamePolicy_ModelManagerGameAssertionPolicy_unknownDefault;
  }
  if (v1) {
    return v2;
  }
  else {
    return 0;
  }
}

uint64_t ModelManagerGameAssertionPolicy.rawValue.getter(char a1)
{
  if (a1) {
    return 0x4D656D6147414141;
  }
  else {
    return 0xD000000000000010;
  }
}

uint64_t sub_24F92E728(char *a1, char *a2)
{
  return sub_24F92E5CC(*a1, *a2);
}

uint64_t sub_24F92E734()
{
  return sub_24F93CC38();
}

uint64_t sub_24F92E7C4()
{
  sub_24F93C9A8();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24F92E840()
{
  return sub_24F93CC38();
}

uint64_t sub_24F92E8CC@<X0>(char *a1@<X8>)
{
  uint64_t v2 = sub_24F93CBE8();
  uint64_t result = swift_bridgeObjectRelease();
  if (v2 == 1) {
    char v4 = 1;
  }
  else {
    char v4 = 2;
  }
  if (!v2) {
    char v4 = 0;
  }
  *a1 = v4;
  return result;
}

void sub_24F92E92C(unint64_t *a1@<X8>)
{
  unint64_t v2 = 0xD000000000000010;
  if (*v1) {
    unint64_t v2 = 0x4D656D6147414141;
  }
  unint64_t v3 = 0x800000024F93E810;
  if (*v1) {
    unint64_t v3 = 0xEB0000000065646FLL;
  }
  *a1 = v2;
  a1[1] = v3;
}

uint64_t sub_24F92E978(unsigned char *a1, unsigned char *a2)
{
  return *a2 & ~*a1 & 1;
}

uint64_t sub_24F92E98C(unsigned char *a1, unsigned char *a2)
{
  return *a2 & 1 | ((*a1 & 1) == 0);
}

uint64_t sub_24F92E9A0(unsigned char *a1, unsigned char *a2)
{
  return *a1 & 1 | ((*a2 & 1) == 0);
}

uint64_t sub_24F92E9B4(unsigned char *a1, unsigned char *a2)
{
  return *a1 & ~*a2 & 1;
}

unint64_t ModelManagerPolicyStrategy.init(rawValue:)(unint64_t a1)
{
  return sub_24F924650(a1);
}

uint64_t ModelManagerGameAssertionStatus.Config.policy.getter()
{
  return *v0;
}

uint64_t ModelManagerGameAssertionStatus.Config.policy.setter(uint64_t result)
{
  *uint64_t v1 = result;
  return result;
}

uint64_t (*ModelManagerGameAssertionStatus.Config.policy.modify())()
{
  return nullsub_1;
}

uint64_t ModelManagerGameAssertionStatus.Config.enablementDate.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for ModelManagerGameAssertionStatus.Config(0);
  return sub_24F925458(v1 + *(int *)(v3 + 20), a1, &qword_269A33C50);
}

uint64_t ModelManagerGameAssertionStatus.Config.enablementDate.setter(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for ModelManagerGameAssertionStatus.Config(0);
  return sub_24F9257E4(a1, v1 + *(int *)(v3 + 20), &qword_269A33C50);
}

uint64_t (*ModelManagerGameAssertionStatus.Config.enablementDate.modify())()
{
  return nullsub_1;
}

uint64_t ModelManagerGameAssertionStatus.Config.disablementDate.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for ModelManagerGameAssertionStatus.Config(0);
  return sub_24F925458(v1 + *(int *)(v3 + 24), a1, &qword_269A33C50);
}

uint64_t ModelManagerGameAssertionStatus.Config.disablementDate.setter(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for ModelManagerGameAssertionStatus.Config(0);
  return sub_24F9257E4(a1, v1 + *(int *)(v3 + 24), &qword_269A33C50);
}

uint64_t (*ModelManagerGameAssertionStatus.Config.disablementDate.modify())()
{
  return nullsub_1;
}

uint64_t ModelManagerGameAssertionStatus.Config.deviceSupported.getter()
{
  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for ModelManagerGameAssertionStatus.Config(0) + 28));
}

uint64_t ModelManagerGameAssertionStatus.Config.deviceSupported.setter(char a1)
{
  uint64_t result = type metadata accessor for ModelManagerGameAssertionStatus.Config(0);
  *(unsigned char *)(v1 + *(int *)(result + 28)) = a1;
  return result;
}

uint64_t (*ModelManagerGameAssertionStatus.Config.deviceSupported.modify())()
{
  return nullsub_1;
}

uint64_t ModelManagerGameAssertionStatus.Config.aaaBundleIdentifiers.getter()
{
  type metadata accessor for ModelManagerGameAssertionStatus.Config(0);
  return swift_bridgeObjectRetain();
}

uint64_t ModelManagerGameAssertionStatus.Config.aaaBundleIdentifiers.setter(uint64_t a1)
{
  uint64_t v3 = *(int *)(type metadata accessor for ModelManagerGameAssertionStatus.Config(0) + 32);
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + v3) = a1;
  return result;
}

uint64_t (*ModelManagerGameAssertionStatus.Config.aaaBundleIdentifiers.modify())()
{
  return nullsub_1;
}

uint64_t ModelManagerGameAssertionStatus.Config.impactedBundleIdentifiers.getter()
{
  type metadata accessor for ModelManagerGameAssertionStatus.Config(0);
  return swift_bridgeObjectRetain();
}

uint64_t ModelManagerGameAssertionStatus.Config.impactedBundleIdentifiers.setter(uint64_t a1)
{
  uint64_t v3 = *(int *)(type metadata accessor for ModelManagerGameAssertionStatus.Config(0) + 36);
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + v3) = a1;
  return result;
}

uint64_t (*ModelManagerGameAssertionStatus.Config.impactedBundleIdentifiers.modify())()
{
  return nullsub_1;
}

uint64_t ModelManagerGameAssertionStatus.Config.previouslyImpactedBundleIdentifiers.getter()
{
  type metadata accessor for ModelManagerGameAssertionStatus.Config(0);
  return swift_bridgeObjectRetain();
}

uint64_t ModelManagerGameAssertionStatus.Config.previouslyImpactedBundleIdentifiers.setter(uint64_t a1)
{
  uint64_t v3 = *(int *)(type metadata accessor for ModelManagerGameAssertionStatus.Config(0) + 40);
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + v3) = a1;
  return result;
}

uint64_t (*ModelManagerGameAssertionStatus.Config.previouslyImpactedBundleIdentifiers.modify())()
{
  return nullsub_1;
}

uint64_t ModelManagerGameAssertionStatus.Config.policyStrategy.getter()
{
  return *(void *)(v0 + *(int *)(type metadata accessor for ModelManagerGameAssertionStatus.Config(0) + 44));
}

uint64_t ModelManagerGameAssertionStatus.Config.policyStrategy.setter(uint64_t a1)
{
  uint64_t result = type metadata accessor for ModelManagerGameAssertionStatus.Config(0);
  *(void *)(v1 + *(int *)(result + 44)) = a1;
  return result;
}

uint64_t (*ModelManagerGameAssertionStatus.Config.policyStrategy.modify())()
{
  return nullsub_1;
}

uint64_t ModelManagerGameAssertionStatus.Config.init(policy:enablementDate:disablementDate:deviceSupported:aaaBundleIdentifiers:impactedBundleIdentifiers:previouslyImpactedBundleIdentifiers:policyStrategy:)@<X0>(char a1@<W0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char a4@<W3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, unsigned char *a9@<X8>)
{
  uint64_t v13 = (int *)type metadata accessor for ModelManagerGameAssertionStatus.Config(0);
  uint64_t v14 = (uint64_t)&a9[v13[5]];
  uint64_t v15 = sub_24F93C8F8();
  char v16 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56);
  v16(v14, 1, 1, v15);
  uint64_t v17 = (uint64_t)&a9[v13[6]];
  v16(v17, 1, 1, v15);
  *a9 = a1;
  sub_24F9257E4(a2, v14, &qword_269A33C50);
  uint64_t result = sub_24F9257E4(a3, v17, &qword_269A33C50);
  a9[v13[7]] = a4;
  *(void *)&a9[v13[8]] = a5;
  *(void *)&a9[v13[9]] = a6;
  *(void *)&a9[v13[10]] = a7;
  *(void *)&a9[v13[11]] = a8;
  return result;
}

uint64_t ModelManagerGameAssertionStatus.policy.getter()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC10GamePolicy31ModelManagerGameAssertionStatus_policy);
  swift_beginAccess();
  return *v1;
}

uint64_t ModelManagerGameAssertionStatus.policy.setter(char a1)
{
  uint64_t v3 = (unsigned char *)(v1 + OBJC_IVAR____TtC10GamePolicy31ModelManagerGameAssertionStatus_policy);
  uint64_t result = swift_beginAccess();
  *uint64_t v3 = a1;
  return result;
}

uint64_t (*ModelManagerGameAssertionStatus.policy.modify())()
{
  return j__swift_endAccess;
}

uint64_t ModelManagerGameAssertionStatus.enablementDate.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_24F925458(v1 + OBJC_IVAR____TtC10GamePolicy31ModelManagerGameAssertionStatus_enablementDate, a1, &qword_269A33C50);
}

uint64_t ModelManagerGameAssertionStatus.disablementDate.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_24F925458(v1 + OBJC_IVAR____TtC10GamePolicy31ModelManagerGameAssertionStatus_disablementDate, a1, &qword_269A33C50);
}

uint64_t ModelManagerGameAssertionStatus.deviceSupported.getter()
{
  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC10GamePolicy31ModelManagerGameAssertionStatus_deviceSupported);
}

uint64_t ModelManagerGameAssertionStatus.aaaBundleIdentifiers.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t ModelManagerGameAssertionStatus.impactedBundleIdentifiers.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t ModelManagerGameAssertionStatus.previouslyImpactedBundleIdentifiers.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t ModelManagerGameAssertionStatus.policyStrategy.getter()
{
  return *(void *)(v0 + OBJC_IVAR____TtC10GamePolicy31ModelManagerGameAssertionStatus_policyStrategy);
}

id ModelManagerGameAssertionStatus.__allocating_init(config:)(unsigned char *a1)
{
  id v3 = objc_allocWithZone(v1);
  return ModelManagerGameAssertionStatus.init(config:)(a1);
}

id ModelManagerGameAssertionStatus.init(config:)(unsigned char *a1)
{
  id v3 = &v1[OBJC_IVAR____TtC10GamePolicy31ModelManagerGameAssertionStatus_policy];
  v1[OBJC_IVAR____TtC10GamePolicy31ModelManagerGameAssertionStatus_policy] = 2;
  char v4 = &v1[OBJC_IVAR____TtC10GamePolicy31ModelManagerGameAssertionStatus____lazy_storage___config];
  unint64_t v5 = (int *)type metadata accessor for ModelManagerGameAssertionStatus.Config(0);
  (*(void (**)(char *, uint64_t, uint64_t, int *))(*((void *)v5 - 1) + 56))(v4, 1, 1, v5);
  LOBYTE(v4) = *a1;
  swift_beginAccess();
  *id v3 = (_BYTE)v4;
  sub_24F925458((uint64_t)&a1[v5[5]], (uint64_t)&v1[OBJC_IVAR____TtC10GamePolicy31ModelManagerGameAssertionStatus_enablementDate], &qword_269A33C50);
  sub_24F925458((uint64_t)&a1[v5[6]], (uint64_t)&v1[OBJC_IVAR____TtC10GamePolicy31ModelManagerGameAssertionStatus_disablementDate], &qword_269A33C50);
  v1[OBJC_IVAR____TtC10GamePolicy31ModelManagerGameAssertionStatus_deviceSupported] = a1[v5[7]];
  *(void *)&v1[OBJC_IVAR____TtC10GamePolicy31ModelManagerGameAssertionStatus_aaaBundleIdentifiers] = *(void *)&a1[v5[8]];
  *(void *)&v1[OBJC_IVAR____TtC10GamePolicy31ModelManagerGameAssertionStatus_impactedBundleIdentifiers] = *(void *)&a1[v5[9]];
  *(void *)&v1[OBJC_IVAR____TtC10GamePolicy31ModelManagerGameAssertionStatus_previouslyImpactedBundleIdentifiers] = *(void *)&a1[v5[10]];
  *(void *)&v1[OBJC_IVAR____TtC10GamePolicy31ModelManagerGameAssertionStatus_policyStrategy] = *(void *)&a1[v5[11]];
  v8.receiver = v1;
  v8.super_class = (Class)type metadata accessor for ModelManagerGameAssertionStatus(0);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v6 = objc_msgSendSuper2(&v8, sel_init);
  sub_24F93047C((uint64_t)a1);
  return v6;
}

uint64_t ModelManagerGameAssertionStatus.config.getter@<X0>(unsigned char *a1@<X8>)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_269A33ED8);
  uint64_t v4 = MEMORY[0x270FA5388](v3 - 8);
  id v6 = &v13[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v4);
  objc_super v8 = &v13[-v7];
  uint64_t v9 = v1 + OBJC_IVAR____TtC10GamePolicy31ModelManagerGameAssertionStatus____lazy_storage___config;
  swift_beginAccess();
  sub_24F925458(v9, (uint64_t)v8, (uint64_t *)&unk_269A33ED8);
  uint64_t v10 = type metadata accessor for ModelManagerGameAssertionStatus.Config(0);
  uint64_t v11 = *(void *)(v10 - 8);
  if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v11 + 48))(v8, 1, v10) != 1) {
    return sub_24F93053C((uint64_t)v8, (uint64_t)a1);
  }
  sub_24F927D88((uint64_t)v8, (uint64_t *)&unk_269A33ED8);
  sub_24F92F594(v1, a1);
  sub_24F9304D8((uint64_t)a1, (uint64_t)v6);
  (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v11 + 56))(v6, 0, 1, v10);
  swift_beginAccess();
  sub_24F9257E4((uint64_t)v6, v9, (uint64_t *)&unk_269A33ED8);
  return swift_endAccess();
}

uint64_t sub_24F92F594@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v28 = a1;
  uint64_t v3 = type metadata accessor for ModelManagerGameAssertionStatus.Config(0);
  uint64_t v4 = (int *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  id v6 = (char *)&v28 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A33C50);
  uint64_t v8 = MEMORY[0x270FA5388](v7 - 8);
  uint64_t v10 = (char *)&v28 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v28 - v11;
  uint64_t v13 = sub_24F93C8F8();
  uint64_t v14 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56);
  v14(v12, 1, 1, v13);
  v14(v10, 1, 1, v13);
  uint64_t v15 = (uint64_t)&v6[v4[7]];
  v14((char *)v15, 1, 1, v13);
  uint64_t v16 = (uint64_t)&v6[v4[8]];
  v14((char *)v16, 1, 1, v13);
  unsigned char *v6 = 2;
  sub_24F9257E4((uint64_t)v12, v15, &qword_269A33C50);
  sub_24F9257E4((uint64_t)v10, v16, &qword_269A33C50);
  v6[v4[9]] = 0;
  uint64_t v17 = MEMORY[0x263F8EE78];
  *(void *)&v6[v4[10]] = MEMORY[0x263F8EE78];
  *(void *)&v6[v4[11]] = v17;
  *(void *)&v6[v4[12]] = v17;
  *(void *)&v6[v4[13]] = 0;
  sub_24F93053C((uint64_t)v6, (uint64_t)a2);
  uint64_t v18 = v28;
  objc_super v19 = (unsigned char *)(v28 + OBJC_IVAR____TtC10GamePolicy31ModelManagerGameAssertionStatus_policy);
  swift_beginAccess();
  *a2 = *v19;
  sub_24F927DE4(v18 + OBJC_IVAR____TtC10GamePolicy31ModelManagerGameAssertionStatus_enablementDate, (uint64_t)&a2[v4[7]]);
  sub_24F927DE4(v18 + OBJC_IVAR____TtC10GamePolicy31ModelManagerGameAssertionStatus_disablementDate, (uint64_t)&a2[v4[8]]);
  a2[v4[9]] = *(unsigned char *)(v18 + OBJC_IVAR____TtC10GamePolicy31ModelManagerGameAssertionStatus_deviceSupported);
  uint64_t v20 = *(void *)(v18 + OBJC_IVAR____TtC10GamePolicy31ModelManagerGameAssertionStatus_aaaBundleIdentifiers);
  uint64_t v21 = v18;
  uint64_t v22 = v4[10];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)&a2[v22] = v20;
  uint64_t v23 = *(void *)(v21 + OBJC_IVAR____TtC10GamePolicy31ModelManagerGameAssertionStatus_impactedBundleIdentifiers);
  uint64_t v24 = v4[11];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)&a2[v24] = v23;
  uint64_t v25 = *(void *)(v21
                  + OBJC_IVAR____TtC10GamePolicy31ModelManagerGameAssertionStatus_previouslyImpactedBundleIdentifiers);
  uint64_t v26 = v4[12];
  swift_bridgeObjectRetain();
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)&a2[v26] = v25;
  *(void *)&a2[v4[13]] = *(void *)(v21 + OBJC_IVAR____TtC10GamePolicy31ModelManagerGameAssertionStatus_policyStrategy);
  return result;
}

uint64_t ModelManagerGameAssertionStatus.config.setter(uint64_t a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_269A33ED8);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24F93053C(a1, (uint64_t)v5);
  uint64_t v6 = type metadata accessor for ModelManagerGameAssertionStatus.Config(0);
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 0, 1, v6);
  uint64_t v7 = v1 + OBJC_IVAR____TtC10GamePolicy31ModelManagerGameAssertionStatus____lazy_storage___config;
  swift_beginAccess();
  sub_24F9257E4((uint64_t)v5, v7, (uint64_t *)&unk_269A33ED8);
  return swift_endAccess();
}

void (*ModelManagerGameAssertionStatus.config.modify(void *a1))(uint64_t a1, char a2)
{
  uint64_t v3 = malloc(0x60uLL);
  *a1 = v3;
  v3[6] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_269A33ED8);
  v3[7] = malloc(*(void *)(*(void *)(v4 - 8) + 64));
  uint64_t v5 = type metadata accessor for ModelManagerGameAssertionStatus.Config(0);
  v3[8] = v5;
  uint64_t v6 = *(void *)(v5 - 8);
  v3[9] = v6;
  size_t v7 = *(void *)(v6 + 64);
  v3[10] = malloc(v7);
  uint64_t v8 = malloc(v7);
  v3[11] = v8;
  ModelManagerGameAssertionStatus.config.getter(v8);
  return sub_24F92FA94;
}

void sub_24F92FA94(uint64_t a1, char a2)
{
  unint64_t v2 = *(void **)a1;
  uint64_t v4 = *(void **)(*(void *)a1 + 80);
  uint64_t v3 = *(void **)(*(void *)a1 + 88);
  if (a2)
  {
    uint64_t v5 = v2[8];
    uint64_t v6 = v2[9];
    uint64_t v8 = v2[6];
    size_t v7 = (void *)v2[7];
    sub_24F9304D8(v2[11], v2[10]);
    sub_24F93053C((uint64_t)v4, (uint64_t)v7);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v6 + 56))(v7, 0, 1, v5);
    uint64_t v9 = v8 + OBJC_IVAR____TtC10GamePolicy31ModelManagerGameAssertionStatus____lazy_storage___config;
    swift_beginAccess();
    sub_24F9257E4((uint64_t)v7, v9, (uint64_t *)&unk_269A33ED8);
    swift_endAccess();
    sub_24F93047C((uint64_t)v3);
  }
  else
  {
    uint64_t v10 = v2[8];
    uint64_t v11 = v2[9];
    uint64_t v12 = v2[6];
    size_t v7 = (void *)v2[7];
    sub_24F93053C(v2[11], (uint64_t)v7);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v7, 0, 1, v10);
    uint64_t v13 = v12 + OBJC_IVAR____TtC10GamePolicy31ModelManagerGameAssertionStatus____lazy_storage___config;
    swift_beginAccess();
    sub_24F9257E4((uint64_t)v7, v13, (uint64_t *)&unk_269A33ED8);
    swift_endAccess();
  }
  free(v3);
  free(v4);
  free(v7);
  free(v2);
}

uint64_t static ModelManagerGameAssertionStatus.supportsSecureCoding.getter()
{
  return 1;
}

Swift::Void __swiftcall ModelManagerGameAssertionStatus.encode(with:)(NSCoder with)
{
  uint64_t v2 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A33C50);
  uint64_t v5 = MEMORY[0x270FA5388](v4 - 8);
  size_t v7 = (char *)&v36 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v36 - v8;
  uint64_t v10 = sub_24F93C8F8();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  unsigned __int8 v36 = (char *)&v36 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)&v36 - v14;
  uint64_t v16 = (unsigned char *)(v2 + OBJC_IVAR____TtC10GamePolicy31ModelManagerGameAssertionStatus_policy);
  swift_beginAccess();
  if (*v16 != 2)
  {
    uint64_t v17 = (void *)sub_24F93C958();
    swift_bridgeObjectRelease();
    uint64_t v18 = (void *)sub_24F93C958();
    [(objc_class *)with.super.isa encodeObject:v17 forKey:v18];
  }
  sub_24F925458(v2 + OBJC_IVAR____TtC10GamePolicy31ModelManagerGameAssertionStatus_enablementDate, (uint64_t)v9, &qword_269A33C50);
  objc_super v19 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48);
  if (v19(v9, 1, v10) == 1)
  {
    sub_24F927D88((uint64_t)v9, &qword_269A33C50);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v15, v9, v10);
    uint64_t v20 = (void *)sub_24F93C8E8();
    uint64_t v21 = (void *)sub_24F93C958();
    [(objc_class *)with.super.isa encodeObject:v20 forKey:v21];

    (*(void (**)(char *, uint64_t))(v11 + 8))(v15, v10);
  }
  sub_24F925458(v2 + OBJC_IVAR____TtC10GamePolicy31ModelManagerGameAssertionStatus_disablementDate, (uint64_t)v7, &qword_269A33C50);
  if (v19(v7, 1, v10) == 1)
  {
    sub_24F927D88((uint64_t)v7, &qword_269A33C50);
    unint64_t v22 = 0x26533D000;
  }
  else
  {
    uint64_t v23 = v36;
    (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v36, v7, v10);
    uint64_t v24 = (void *)sub_24F93C8E8();
    uint64_t v25 = (void *)sub_24F93C958();
    unint64_t v22 = 0x26533D000uLL;
    [(objc_class *)with.super.isa encodeObject:v24 forKey:v25];

    (*(void (**)(char *, uint64_t))(v11 + 8))(v23, v10);
  }
  uint64_t v26 = *(unsigned __int8 *)(v2 + OBJC_IVAR____TtC10GamePolicy31ModelManagerGameAssertionStatus_deviceSupported);
  v27 = (void *)sub_24F93C958();
  [(objc_class *)with.super.isa encodeBool:v26 forKey:v27];

  sub_24F926108(*(void *)(v2 + OBJC_IVAR____TtC10GamePolicy31ModelManagerGameAssertionStatus_aaaBundleIdentifiers));
  sub_24F927D4C(0, (unint64_t *)&qword_269A33C70);
  uint64_t v28 = (void *)sub_24F93CA58();
  swift_bridgeObjectRelease();
  unint64_t v29 = (void *)sub_24F93C958();
  objc_msgSend(with.super.isa, *(SEL *)(v22 + 2992), v28, v29);

  sub_24F926108(*(void *)(v2 + OBJC_IVAR____TtC10GamePolicy31ModelManagerGameAssertionStatus_impactedBundleIdentifiers));
  uint64_t v30 = (void *)sub_24F93CA58();
  swift_bridgeObjectRelease();
  unint64_t v31 = (void *)sub_24F93C958();
  objc_msgSend(with.super.isa, *(SEL *)(v22 + 2992), v30, v31);

  sub_24F926108(*(void *)(v2
                          + OBJC_IVAR____TtC10GamePolicy31ModelManagerGameAssertionStatus_previouslyImpactedBundleIdentifiers));
  objc_super v32 = (void *)sub_24F93CA58();
  swift_bridgeObjectRelease();
  objc_super v33 = (void *)sub_24F93C958();
  objc_msgSend(with.super.isa, *(SEL *)(v22 + 2992), v32, v33);

  uint64_t v34 = *(void *)(v2 + OBJC_IVAR____TtC10GamePolicy31ModelManagerGameAssertionStatus_policyStrategy);
  v35 = (void *)sub_24F93C958();
  [(objc_class *)with.super.isa encodeInteger:v34 forKey:v35];
}

id ModelManagerGameAssertionStatus.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  id v4 = sub_24F9305A0(a1);

  return v4;
}

id ModelManagerGameAssertionStatus.init(coder:)(void *a1)
{
  id v2 = sub_24F9305A0(a1);

  return v2;
}

id ModelManagerGameAssertionStatus.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void ModelManagerGameAssertionStatus.init()()
{
}

id ModelManagerGameAssertionStatus.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ModelManagerGameAssertionStatus(0);
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for ModelManagerGameAssertionStatus.Config(uint64_t a1)
{
  return sub_24F925200(a1, qword_269A33F28);
}

uint64_t type metadata accessor for ModelManagerGameAssertionStatus(uint64_t a1)
{
  return sub_24F925200(a1, qword_269A33F00);
}

uint64_t sub_24F93047C(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for ModelManagerGameAssertionStatus.Config(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_24F9304D8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ModelManagerGameAssertionStatus.Config(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24F93053C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ModelManagerGameAssertionStatus.Config(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

id sub_24F9305A0(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A33C50);
  uint64_t v4 = MEMORY[0x270FA5388](v3 - 8);
  uint64_t v6 = (char *)&v60 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  *(void *)&long long v64 = (char *)&v60 - v7;
  uint64_t v8 = sub_24F93C8F8();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  v63 = (char *)&v60 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v60 - v12;
  uint64_t v14 = &v1[OBJC_IVAR____TtC10GamePolicy31ModelManagerGameAssertionStatus_policy];
  v1[OBJC_IVAR____TtC10GamePolicy31ModelManagerGameAssertionStatus_policy] = 2;
  uint64_t v15 = &v1[OBJC_IVAR____TtC10GamePolicy31ModelManagerGameAssertionStatus____lazy_storage___config];
  uint64_t v16 = type metadata accessor for ModelManagerGameAssertionStatus.Config(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v15, 1, 1, v16);
  uint64_t v17 = sub_24F927D4C(0, (unint64_t *)&qword_269A33C70);
  uint64_t v18 = v1;
  uint64_t v19 = sub_24F93CAB8();
  if (v19 && (uint64_t v20 = (void *)v19, v65 = 0, v66 = 0, sub_24F93C968(), v20, v66))
  {
    uint64_t v21 = sub_24F93CBE8();
    swift_bridgeObjectRelease();
    if (v21 == 1) {
      char v22 = 1;
    }
    else {
      char v22 = 2;
    }
    if (v21) {
      char v23 = v22;
    }
    else {
      char v23 = 0;
    }
  }
  else
  {
    char v23 = 2;
  }
  swift_beginAccess();
  *uint64_t v14 = v23;
  uint64_t v24 = (void *)sub_24F93C958();
  unsigned __int8 v25 = objc_msgSend(a1, sel_containsValueForKey_, v24);

  if ((v25 & 1) == 0)
  {
    uint64_t v30 = v9;
    unint64_t v29 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56);
LABEL_17:
    unint64_t v31 = 0x26533D000uLL;
    v29(&v18[OBJC_IVAR____TtC10GamePolicy31ModelManagerGameAssertionStatus_enablementDate], 1, 1, v8);
    goto LABEL_18;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A340A0);
  uint64_t v26 = swift_allocObject();
  *(_OWORD *)(v26 + 16) = xmmword_24F93DBA0;
  *(void *)(v26 + 32) = sub_24F927D4C(0, (unint64_t *)&unk_269A33D20);
  sub_24F93CAC8();
  swift_bridgeObjectRelease();
  if (!v67)
  {
    sub_24F927D88((uint64_t)&v65, (uint64_t *)&unk_269A340C0);
    uint64_t v30 = v9;
    unint64_t v29 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v27 = v64;
    v29((char *)v64, 1, 1, v8);
    goto LABEL_16;
  }
  uint64_t v27 = v64;
  int v28 = swift_dynamicCast();
  unint64_t v29 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56);
  v29((char *)v27, v28 ^ 1u, 1, v8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(v27, 1, v8) == 1)
  {
    uint64_t v30 = v9;
LABEL_16:
    sub_24F927D88(v27, &qword_269A33C50);
    goto LABEL_17;
  }
  v61 = v6;
  uint64_t v62 = v17;
  v58 = *(void (**)(char *, uint64_t, uint64_t))(v9 + 32);
  v58(v13, v27, v8);
  uint64_t v59 = &v18[OBJC_IVAR____TtC10GamePolicy31ModelManagerGameAssertionStatus_enablementDate];
  v58(&v18[OBJC_IVAR____TtC10GamePolicy31ModelManagerGameAssertionStatus_enablementDate], (uint64_t)v13, v8);
  uint64_t v6 = v61;
  uint64_t v17 = v62;
  v29(v59, 0, 1, v8);
  uint64_t v30 = v9;
  unint64_t v31 = 0x26533D000;
LABEL_18:
  objc_super v32 = (void *)sub_24F93C958();
  unsigned int v33 = objc_msgSend(a1, *(SEL *)(v31 + 3016), v32);

  if (!v33)
  {
LABEL_24:
    v29(&v18[OBJC_IVAR____TtC10GamePolicy31ModelManagerGameAssertionStatus_disablementDate], 1, 1, v8);
    goto LABEL_25;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A340A0);
  uint64_t v34 = swift_allocObject();
  *(_OWORD *)(v34 + 16) = xmmword_24F93DBA0;
  *(void *)(v34 + 32) = sub_24F927D4C(0, (unint64_t *)&unk_269A33D20);
  sub_24F93CAC8();
  swift_bridgeObjectRelease();
  if (!v67)
  {
    sub_24F927D88((uint64_t)&v65, (uint64_t *)&unk_269A340C0);
    v29(v6, 1, 1, v8);
    goto LABEL_23;
  }
  int v35 = swift_dynamicCast();
  v29(v6, v35 ^ 1u, 1, v8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v30 + 48))(v6, 1, v8) == 1)
  {
LABEL_23:
    sub_24F927D88((uint64_t)v6, &qword_269A33C50);
    goto LABEL_24;
  }
  unsigned __int8 v36 = *(void (**)(char *, char *, uint64_t))(v30 + 32);
  uint64_t v37 = v63;
  v36(v63, v6, v8);
  uint64_t v38 = &v18[OBJC_IVAR____TtC10GamePolicy31ModelManagerGameAssertionStatus_disablementDate];
  v36(&v18[OBJC_IVAR____TtC10GamePolicy31ModelManagerGameAssertionStatus_disablementDate], v37, v8);
  v29(v38, 0, 1, v8);
LABEL_25:
  uint64_t v39 = (void *)sub_24F93C958();
  unsigned __int8 v40 = objc_msgSend(a1, sel_decodeBoolForKey_, v39);

  v18[OBJC_IVAR____TtC10GamePolicy31ModelManagerGameAssertionStatus_deviceSupported] = v40;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A340A0);
  uint64_t v41 = swift_allocObject();
  long long v64 = xmmword_24F93DBA0;
  *(_OWORD *)(v41 + 16) = xmmword_24F93DBA0;
  *(void *)(v41 + 32) = v17;
  uint64_t v42 = sub_24F93CAE8();
  swift_bridgeObjectRelease();
  uint64_t v43 = MEMORY[0x263F8EE78];
  if (v42)
  {
    uint64_t v44 = sub_24F92A890(v42);
    swift_bridgeObjectRelease();
    if (v44) {
      uint64_t v43 = v44;
    }
  }
  *(void *)&v18[OBJC_IVAR____TtC10GamePolicy31ModelManagerGameAssertionStatus_aaaBundleIdentifiers] = v43;
  uint64_t v45 = swift_allocObject();
  *(_OWORD *)(v45 + 16) = v64;
  *(void *)(v45 + 32) = v17;
  uint64_t v46 = sub_24F93CAE8();
  swift_bridgeObjectRelease();
  uint64_t v47 = MEMORY[0x263F8EE78];
  if (v46)
  {
    uint64_t v48 = sub_24F92A890(v46);
    swift_bridgeObjectRelease();
    if (v48) {
      uint64_t v47 = v48;
    }
  }
  *(void *)&v18[OBJC_IVAR____TtC10GamePolicy31ModelManagerGameAssertionStatus_impactedBundleIdentifiers] = v47;
  uint64_t v49 = swift_allocObject();
  *(_OWORD *)(v49 + 16) = v64;
  *(void *)(v49 + 32) = v17;
  uint64_t v50 = sub_24F93CAE8();
  swift_bridgeObjectRelease();
  uint64_t v51 = MEMORY[0x263F8EE78];
  if (v50)
  {
    uint64_t v52 = sub_24F92A890(v50);
    swift_bridgeObjectRelease();
    if (v52) {
      uint64_t v51 = v52;
    }
  }
  *(void *)&v18[OBJC_IVAR____TtC10GamePolicy31ModelManagerGameAssertionStatus_previouslyImpactedBundleIdentifiers] = v51;
  v53 = (void *)sub_24F93C958();
  id v54 = objc_msgSend(a1, sel_decodeIntegerForKey_, v53);

  if ((unint64_t)v54 >= 4) {
    id v55 = 0;
  }
  else {
    id v55 = v54;
  }
  *(void *)&v18[OBJC_IVAR____TtC10GamePolicy31ModelManagerGameAssertionStatus_policyStrategy] = v55;

  v56 = (objc_class *)type metadata accessor for ModelManagerGameAssertionStatus(0);
  v68.receiver = v18;
  v68.super_class = v56;
  return objc_msgSendSuper2(&v68, sel_init);
}

unint64_t sub_24F930EAC()
{
  unint64_t result = qword_269A33EE8;
  if (!qword_269A33EE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A33EE8);
  }
  return result;
}

unint64_t sub_24F930F04()
{
  unint64_t result = qword_269A33EF0;
  if (!qword_269A33EF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A33EF0);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for ModelManagerGameAssertionPolicy(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFF) {
    goto LABEL_17;
  }
  if (a2 + 1 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 1;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 1;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 1;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 2;
  int v8 = v6 - 2;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for ModelManagerGameAssertionPolicy(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFE)
  {
    unsigned int v6 = ((a2 - 255) >> 8) + 1;
    *unint64_t result = a2 + 1;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x24F9310B4);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *unint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

unsigned char *sub_24F9310DC(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for ModelManagerGameAssertionPolicy()
{
  return &type metadata for ModelManagerGameAssertionPolicy;
}

ValueMetadata *type metadata accessor for ModelManagerPolicyStrategy()
{
  return &type metadata for ModelManagerPolicyStrategy;
}

uint64_t sub_24F931108()
{
  return type metadata accessor for ModelManagerGameAssertionStatus(0);
}

void sub_24F931110()
{
  sub_24F931248(319, &qword_269A33CF0, MEMORY[0x263F07490]);
  if (v0 <= 0x3F)
  {
    sub_24F931248(319, (unint64_t *)&unk_269A33F18, (void (*)(uint64_t))type metadata accessor for ModelManagerGameAssertionStatus.Config);
    if (v1 <= 0x3F) {
      swift_updateClassMetadata2();
    }
  }
}

void sub_24F931248(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = sub_24F93CB18();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

void *initializeBufferWithCopyOfBuffer for ModelManagerGameAssertionStatus.Config(char *a1, char *a2, int *a3)
{
  unint64_t v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v14 = *(void *)a2;
    void *v4 = *(void *)a2;
    unint64_t v4 = (void *)(v14 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *a1 = *a2;
    uint64_t v7 = a3[5];
    int v8 = &a1[v7];
    uint64_t v9 = &a2[v7];
    uint64_t v10 = sub_24F93C8F8();
    uint64_t v11 = *(void *)(v10 - 8);
    uint64_t v12 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48);
    if (v12(v9, 1, v10))
    {
      uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A33C50);
      memcpy(v8, v9, *(void *)(*(void *)(v13 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v8, v9, v10);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
    }
    uint64_t v15 = a3[6];
    uint64_t v16 = (char *)v4 + v15;
    uint64_t v17 = &a2[v15];
    if (v12(&a2[v15], 1, v10))
    {
      uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A33C50);
      memcpy(v16, v17, *(void *)(*(void *)(v18 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v16, v17, v10);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v16, 0, 1, v10);
    }
    uint64_t v19 = a3[8];
    *((unsigned char *)v4 + a3[7]) = a2[a3[7]];
    *(void *)((char *)v4 + v19) = *(void *)&a2[v19];
    uint64_t v20 = a3[10];
    *(void *)((char *)v4 + a3[9]) = *(void *)&a2[a3[9]];
    *(void *)((char *)v4 + v20) = *(void *)&a2[v20];
    *(void *)((char *)v4 + a3[11]) = *(void *)&a2[a3[11]];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t destroy for ModelManagerGameAssertionStatus.Config(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  uint64_t v5 = sub_24F93C8F8();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48);
  if (!v7(v4, 1, v5)) {
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  }
  uint64_t v8 = a1 + *(int *)(a2 + 24);
  if (!v7(v8, 1, v5)) {
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v8, v5);
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

unsigned char *initializeWithCopy for ModelManagerGameAssertionStatus.Config(unsigned char *a1, unsigned char *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = &a1[v6];
  uint64_t v8 = &a2[v6];
  uint64_t v9 = sub_24F93C8F8();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v10 + 48);
  if (v11(v8, 1, v9))
  {
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A33C50);
    memcpy(v7, v8, *(void *)(*(void *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v10 + 16))(v7, v8, v9);
    (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  }
  uint64_t v13 = a3[6];
  uint64_t v14 = &a1[v13];
  uint64_t v15 = &a2[v13];
  if (v11(&a2[v13], 1, v9))
  {
    uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A33C50);
    memcpy(v14, v15, *(void *)(*(void *)(v16 - 8) + 64));
  }
  else
  {
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v10 + 16))(v14, v15, v9);
    (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v10 + 56))(v14, 0, 1, v9);
  }
  uint64_t v17 = a3[8];
  a1[a3[7]] = a2[a3[7]];
  *(void *)&a1[v17] = *(void *)&a2[v17];
  uint64_t v18 = a3[10];
  *(void *)&a1[a3[9]] = *(void *)&a2[a3[9]];
  *(void *)&a1[v18] = *(void *)&a2[v18];
  *(void *)&a1[a3[11]] = *(void *)&a2[a3[11]];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

unsigned char *assignWithCopy for ModelManagerGameAssertionStatus.Config(unsigned char *a1, unsigned char *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = &a1[v6];
  uint64_t v8 = &a2[v6];
  uint64_t v9 = sub_24F93C8F8();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(uint64_t (**)(unsigned char *, uint64_t, uint64_t))(v10 + 48);
  int v12 = v11(v7, 1, v9);
  int v13 = v11(v8, 1, v9);
  if (v12)
  {
    if (!v13)
    {
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v10 + 16))(v7, v8, v9);
      (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v13)
  {
    (*(void (**)(unsigned char *, uint64_t))(v10 + 8))(v7, v9);
LABEL_6:
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A33C50);
    memcpy(v7, v8, *(void *)(*(void *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v10 + 24))(v7, v8, v9);
LABEL_7:
  uint64_t v15 = a3[6];
  uint64_t v16 = &a1[v15];
  uint64_t v17 = &a2[v15];
  int v18 = v11(&a1[v15], 1, v9);
  int v19 = v11(v17, 1, v9);
  if (!v18)
  {
    if (!v19)
    {
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v10 + 24))(v16, v17, v9);
      goto LABEL_13;
    }
    (*(void (**)(unsigned char *, uint64_t))(v10 + 8))(v16, v9);
    goto LABEL_12;
  }
  if (v19)
  {
LABEL_12:
    uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A33C50);
    memcpy(v16, v17, *(void *)(*(void *)(v20 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v10 + 16))(v16, v17, v9);
  (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v10 + 56))(v16, 0, 1, v9);
LABEL_13:
  a1[a3[7]] = a2[a3[7]];
  *(void *)&a1[a3[8]] = *(void *)&a2[a3[8]];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)&a1[a3[9]] = *(void *)&a2[a3[9]];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)&a1[a3[10]] = *(void *)&a2[a3[10]];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)&a1[a3[11]] = *(void *)&a2[a3[11]];
  return a1;
}

unsigned char *initializeWithTake for ModelManagerGameAssertionStatus.Config(unsigned char *a1, unsigned char *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = &a1[v6];
  uint64_t v8 = &a2[v6];
  uint64_t v9 = sub_24F93C8F8();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v10 + 48);
  if (v11(v8, 1, v9))
  {
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A33C50);
    memcpy(v7, v8, *(void *)(*(void *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v10 + 32))(v7, v8, v9);
    (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  }
  uint64_t v13 = a3[6];
  uint64_t v14 = &a1[v13];
  uint64_t v15 = &a2[v13];
  if (v11(&a2[v13], 1, v9))
  {
    uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A33C50);
    memcpy(v14, v15, *(void *)(*(void *)(v16 - 8) + 64));
  }
  else
  {
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v10 + 32))(v14, v15, v9);
    (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v10 + 56))(v14, 0, 1, v9);
  }
  uint64_t v17 = a3[8];
  a1[a3[7]] = a2[a3[7]];
  *(void *)&a1[v17] = *(void *)&a2[v17];
  uint64_t v18 = a3[10];
  *(void *)&a1[a3[9]] = *(void *)&a2[a3[9]];
  *(void *)&a1[v18] = *(void *)&a2[v18];
  *(void *)&a1[a3[11]] = *(void *)&a2[a3[11]];
  return a1;
}

unsigned char *assignWithTake for ModelManagerGameAssertionStatus.Config(unsigned char *a1, unsigned char *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = &a1[v6];
  uint64_t v8 = &a2[v6];
  uint64_t v9 = sub_24F93C8F8();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(uint64_t (**)(unsigned char *, uint64_t, uint64_t))(v10 + 48);
  int v12 = v11(v7, 1, v9);
  int v13 = v11(v8, 1, v9);
  if (v12)
  {
    if (!v13)
    {
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v10 + 32))(v7, v8, v9);
      (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v13)
  {
    (*(void (**)(unsigned char *, uint64_t))(v10 + 8))(v7, v9);
LABEL_6:
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A33C50);
    memcpy(v7, v8, *(void *)(*(void *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v10 + 40))(v7, v8, v9);
LABEL_7:
  uint64_t v15 = a3[6];
  uint64_t v16 = &a1[v15];
  uint64_t v17 = &a2[v15];
  int v18 = v11(&a1[v15], 1, v9);
  int v19 = v11(v17, 1, v9);
  if (!v18)
  {
    if (!v19)
    {
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v10 + 40))(v16, v17, v9);
      goto LABEL_13;
    }
    (*(void (**)(unsigned char *, uint64_t))(v10 + 8))(v16, v9);
    goto LABEL_12;
  }
  if (v19)
  {
LABEL_12:
    uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A33C50);
    memcpy(v16, v17, *(void *)(*(void *)(v20 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v10 + 32))(v16, v17, v9);
  (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v10 + 56))(v16, 0, 1, v9);
LABEL_13:
  uint64_t v21 = a3[8];
  a1[a3[7]] = a2[a3[7]];
  *(void *)&a1[v21] = *(void *)&a2[v21];
  swift_bridgeObjectRelease();
  *(void *)&a1[a3[9]] = *(void *)&a2[a3[9]];
  swift_bridgeObjectRelease();
  *(void *)&a1[a3[10]] = *(void *)&a2[a3[10]];
  swift_bridgeObjectRelease();
  *(void *)&a1[a3[11]] = *(void *)&a2[a3[11]];
  return a1;
}

uint64_t getEnumTagSinglePayload for ModelManagerGameAssertionStatus.Config(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24F93201C);
}

uint64_t sub_24F93201C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A33C50);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1 + *(int *)(a3 + 20);
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v10(v9, a2, v8);
  }
  else
  {
    unint64_t v12 = *(void *)(a1 + *(int *)(a3 + 32));
    if (v12 >= 0xFFFFFFFF) {
      LODWORD(v12) = -1;
    }
    return (v12 + 1);
  }
}

uint64_t storeEnumTagSinglePayload for ModelManagerGameAssertionStatus.Config(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24F9320F8);
}

uint64_t sub_24F9320F8(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = __swift_instantiateConcreteTypeFromMangledName(&qword_269A33C50);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = result;
    uint64_t v11 = a1 + *(int *)(a4 + 20);
    unint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v12(v11, a2, a2, v10);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 32)) = (a2 - 1);
  }
  return result;
}

void sub_24F9321BC()
{
  sub_24F931248(319, &qword_269A33CF0, MEMORY[0x263F07490]);
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

Swift::String *kGamePolicyDaemonEntitlement.unsafeMutableAddressor()
{
  return &kGamePolicyDaemonEntitlement;
}

Swift::String *kGamePolicyMenuExtraBundleID.unsafeMutableAddressor()
{
  return &kGamePolicyMenuExtraBundleID;
}

Swift::String *kGamePolicyMenuExtraInstallPath.unsafeMutableAddressor()
{
  return &kGamePolicyMenuExtraInstallPath;
}

unint64_t ConsoleModeEnablementReason.init(rawValue:)(unint64_t a1)
{
  return sub_24F933AF4(a1);
}

unint64_t sub_24F9322E0@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result = sub_24F933AF4(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

uint64_t GamePolicyAgentUpdate.userIdentifiedGames.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t GamePolicyAgentUpdate.consoleModeSignalingGames.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t GamePolicyAgentUpdate.consoleModeUserDisabledGames.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t GamePolicyAgentUpdate.consoleModeEnabled.getter()
{
  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC10GamePolicy21GamePolicyAgentUpdate_consoleModeEnabled);
}

uint64_t GamePolicyAgentUpdate.consoleModePausedByUser.getter()
{
  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC10GamePolicy21GamePolicyAgentUpdate_consoleModePausedByUser);
}

id GamePolicyAgentUpdate.__allocating_init(userIdentifiedGames:consoleModeSignalingGames:consoleModeUserDisabledGames:consoleModeEnabled:consoleModePausedByUser:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4, char a5)
{
  uint64_t v11 = objc_allocWithZone(v5);
  *(void *)&v11[OBJC_IVAR____TtC10GamePolicy21GamePolicyAgentUpdate_userIdentifiedGames] = a1;
  *(void *)&v11[OBJC_IVAR____TtC10GamePolicy21GamePolicyAgentUpdate_consoleModeSignalingGames] = a2;
  *(void *)&v11[OBJC_IVAR____TtC10GamePolicy21GamePolicyAgentUpdate_consoleModeUserDisabledGames] = a3;
  v11[OBJC_IVAR____TtC10GamePolicy21GamePolicyAgentUpdate_consoleModeEnabled] = a4;
  v11[OBJC_IVAR____TtC10GamePolicy21GamePolicyAgentUpdate_consoleModePausedByUser] = a5;
  v13.receiver = v11;
  v13.super_class = v5;
  return objc_msgSendSuper2(&v13, sel_init);
}

id GamePolicyAgentUpdate.init(userIdentifiedGames:consoleModeSignalingGames:consoleModeUserDisabledGames:consoleModeEnabled:consoleModePausedByUser:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4, char a5)
{
  *(void *)&v5[OBJC_IVAR____TtC10GamePolicy21GamePolicyAgentUpdate_userIdentifiedGames] = a1;
  *(void *)&v5[OBJC_IVAR____TtC10GamePolicy21GamePolicyAgentUpdate_consoleModeSignalingGames] = a2;
  *(void *)&v5[OBJC_IVAR____TtC10GamePolicy21GamePolicyAgentUpdate_consoleModeUserDisabledGames] = a3;
  v5[OBJC_IVAR____TtC10GamePolicy21GamePolicyAgentUpdate_consoleModeEnabled] = a4;
  v5[OBJC_IVAR____TtC10GamePolicy21GamePolicyAgentUpdate_consoleModePausedByUser] = a5;
  v7.receiver = v5;
  v7.super_class = (Class)type metadata accessor for GamePolicyAgentUpdate();
  return objc_msgSendSuper2(&v7, sel_init);
}

id static GamePolicyAgentUpdate.emptyUpdate.getter()
{
  uint64_t v0 = (objc_class *)type metadata accessor for GamePolicyAgentUpdate();
  unint64_t v1 = objc_allocWithZone(v0);
  uint64_t v2 = MEMORY[0x263F8EE78];
  *(void *)&v1[OBJC_IVAR____TtC10GamePolicy21GamePolicyAgentUpdate_userIdentifiedGames] = MEMORY[0x263F8EE78];
  *(void *)&v1[OBJC_IVAR____TtC10GamePolicy21GamePolicyAgentUpdate_consoleModeSignalingGames] = v2;
  *(void *)&v1[OBJC_IVAR____TtC10GamePolicy21GamePolicyAgentUpdate_consoleModeUserDisabledGames] = v2;
  v1[OBJC_IVAR____TtC10GamePolicy21GamePolicyAgentUpdate_consoleModeEnabled] = 0;
  v1[OBJC_IVAR____TtC10GamePolicy21GamePolicyAgentUpdate_consoleModePausedByUser] = 0;
  v4.receiver = v1;
  v4.super_class = v0;
  return objc_msgSendSuper2(&v4, sel_init);
}

uint64_t GamePolicyAgentUpdate.description.getter()
{
  sub_24F93CB48();
  sub_24F93C9C8();
  uint64_t v0 = type metadata accessor for GamePolicyAgentUpdate.GameEvent();
  uint64_t v1 = swift_bridgeObjectRetain();
  MEMORY[0x253366090](v1, v0);
  sub_24F93C9C8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_24F93C9C8();
  uint64_t v2 = swift_bridgeObjectRetain();
  MEMORY[0x253366090](v2, v0);
  sub_24F93C9C8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_24F93C9C8();
  sub_24F93C9C8();
  swift_bridgeObjectRelease();
  sub_24F93C9C8();
  sub_24F93C9C8();
  swift_bridgeObjectRelease();
  sub_24F93C9C8();
  return 0;
}

char *GamePolicyAgentUpdate.supportsSecureCoding.unsafeMutableAddressor()
{
  return &static GamePolicyAgentUpdate.supportsSecureCoding;
}

uint64_t static GamePolicyAgentUpdate.supportsSecureCoding.getter()
{
  return static GamePolicyAgentUpdate.supportsSecureCoding;
}

uint64_t static GamePolicyAgentUpdate.supportsSecureCoding.setter(char a1)
{
  uint64_t result = swift_beginAccess();
  static GamePolicyAgentUpdate.supportsSecureCoding = a1;
  return result;
}

uint64_t (*static GamePolicyAgentUpdate.supportsSecureCoding.modify())()
{
  return j_j__swift_endAccess;
}

Swift::Void __swiftcall GamePolicyAgentUpdate.encode(with:)(NSCoder with)
{
  type metadata accessor for GamePolicyAgentUpdate.GameEvent();
  uint64_t v2 = (void *)sub_24F93CA58();
  int v3 = (void *)sub_24F93C958();
  [(objc_class *)with.super.isa encodeObject:v2 forKey:v3];

  objc_super v4 = (void *)sub_24F93CA58();
  uint64_t v5 = (void *)sub_24F93C958();
  [(objc_class *)with.super.isa encodeObject:v4 forKey:v5];

  uint64_t v6 = (void *)sub_24F93CA58();
  objc_super v7 = (void *)sub_24F93C958();
  [(objc_class *)with.super.isa encodeObject:v6 forKey:v7];

  sub_24F927D4C(0, &qword_269A33DD0);
  uint64_t v8 = (void *)sub_24F93CAF8();
  uint64_t v9 = (void *)sub_24F93C958();
  [(objc_class *)with.super.isa encodeObject:v8 forKey:v9];

  uint64_t v10 = (void *)sub_24F93CAF8();
  id v11 = (id)sub_24F93C958();
  [(objc_class *)with.super.isa encodeObject:v10 forKey:v11];
}

uint64_t GamePolicyAgentUpdate.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return GamePolicyAgentUpdate.init(coder:)(a1);
}

uint64_t GamePolicyAgentUpdate.init(coder:)(void *a1)
{
  uint64_t v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A340A0);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_24F93E270;
  *(void *)(v4 + 32) = type metadata accessor for GamePolicyAgentUpdate.GameEvent();
  *(void *)(v4 + 40) = sub_24F927D4C(0, (unint64_t *)&unk_269A33F70);
  id v5 = v2;
  sub_24F93CAC8();
  swift_bridgeObjectRelease();
  if (v8[3])
  {
    if (swift_dynamicCast())
    {
      v8[0] = 0;
      sub_24F93CA68();
    }
  }
  else
  {

    sub_24F933B4C((uint64_t)v8);
  }
  type metadata accessor for GamePolicyAgentUpdate();
  swift_deallocPartialClassInstance();
  return 0;
}

BOOL static GamePolicyAgentUpdate.GameEvent.< infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + OBJC_IVAR_____GamePolicyAgentUpdateGameEvent_date), sel_compare_, *(void *)(a2 + OBJC_IVAR_____GamePolicyAgentUpdateGameEvent_date)) == (id)-1;
}

id GamePolicyAgentUpdate.GameEvent.auditTokenNSValue.getter()
{
  return *(id *)(v0 + OBJC_IVAR_____GamePolicyAgentUpdateGameEvent_auditTokenNSValue);
}

id GamePolicyAgentUpdate.GameEvent.date.getter()
{
  return *(id *)(v0 + OBJC_IVAR_____GamePolicyAgentUpdateGameEvent_date);
}

id GamePolicyAgentUpdate.GameEvent.__allocating_init(auditTokenNSValue:date:)(uint64_t a1, uint64_t a2)
{
  id v5 = (char *)objc_allocWithZone(v2);
  *(void *)&v5[OBJC_IVAR_____GamePolicyAgentUpdateGameEvent_auditTokenNSValue] = a1;
  *(void *)&v5[OBJC_IVAR_____GamePolicyAgentUpdateGameEvent_date] = a2;
  v7.receiver = v5;
  v7.super_class = v2;
  return objc_msgSendSuper2(&v7, sel_init);
}

id GamePolicyAgentUpdate.GameEvent.init(auditTokenNSValue:date:)(uint64_t a1, uint64_t a2)
{
  *(void *)&v2[OBJC_IVAR_____GamePolicyAgentUpdateGameEvent_auditTokenNSValue] = a1;
  *(void *)&v2[OBJC_IVAR_____GamePolicyAgentUpdateGameEvent_date] = a2;
  v4.receiver = v2;
  v4.super_class = (Class)type metadata accessor for GamePolicyAgentUpdate.GameEvent();
  return objc_msgSendSuper2(&v4, sel_init);
}

id sub_24F93312C(void *a1, uint64_t a2, void (*a3)(void))
{
  id v4 = a1;
  a3();

  id v5 = (void *)sub_24F93C958();
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t GamePolicyAgentUpdate.GameEvent.description.getter()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  *(void *)&v4[0] = 0;
  *((void *)&v4[0] + 1) = 0xE000000000000000;
  sub_24F93CB48();
  long long v5 = v4[0];
  sub_24F93C9C8();
  memset(v4, 0, sizeof(v4));
  objc_msgSend(*(id *)(v0 + OBJC_IVAR_____GamePolicyAgentUpdateGameEvent_auditTokenNSValue), sel_getValue_size_, v4, 32);
  type metadata accessor for audit_token_t();
  sub_24F93CBC8();
  sub_24F93C9C8();
  id v1 = *(id *)(v0 + OBJC_IVAR_____GamePolicyAgentUpdateGameEvent_date);
  id v2 = objc_msgSend(v1, sel_description);
  sub_24F93C978();

  sub_24F93C9C8();
  swift_bridgeObjectRelease();
  sub_24F93C9C8();
  return v5;
}

uint64_t GamePolicyAgentUpdate.GameEvent.auditToken.getter()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  memset(v2, 0, sizeof(v2));
  objc_msgSend(*(id *)(v0 + OBJC_IVAR_____GamePolicyAgentUpdateGameEvent_auditTokenNSValue), sel_getValue_size_, v2, 32);
  return *(void *)&v2[0];
}

char *GamePolicyAgentUpdate.GameEvent.supportsSecureCoding.unsafeMutableAddressor()
{
  return &static GamePolicyAgentUpdate.GameEvent.supportsSecureCoding;
}

uint64_t static GamePolicyAgentUpdate.GameEvent.supportsSecureCoding.getter()
{
  return static GamePolicyAgentUpdate.GameEvent.supportsSecureCoding;
}

uint64_t static GamePolicyAgentUpdate.GameEvent.supportsSecureCoding.setter(char a1)
{
  uint64_t result = swift_beginAccess();
  static GamePolicyAgentUpdate.GameEvent.supportsSecureCoding = a1;
  return result;
}

uint64_t (*static GamePolicyAgentUpdate.GameEvent.supportsSecureCoding.modify())()
{
  return j__swift_endAccess;
}

Swift::Void __swiftcall GamePolicyAgentUpdate.GameEvent.encode(with:)(NSCoder with)
{
  uint64_t v3 = *(void *)(v1 + OBJC_IVAR_____GamePolicyAgentUpdateGameEvent_date);
  id v4 = (void *)sub_24F93C958();
  [(objc_class *)with.super.isa encodeObject:v3 forKey:v4];

  uint64_t v5 = *(void *)(v1 + OBJC_IVAR_____GamePolicyAgentUpdateGameEvent_auditTokenNSValue);
  id v6 = (id)sub_24F93C958();
  [(objc_class *)with.super.isa encodeObject:v5 forKey:v6];
}

id GamePolicyAgentUpdate.GameEvent.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return GamePolicyAgentUpdate.GameEvent.init(coder:)(a1);
}

id GamePolicyAgentUpdate.GameEvent.init(coder:)(void *a1)
{
  id v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A340A0);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_24F93DBA0;
  *(void *)(v4 + 32) = sub_24F927D4C(0, (unint64_t *)&unk_269A33D20);
  uint64_t v5 = v2;
  sub_24F93CAC8();
  swift_bridgeObjectRelease();
  if (!v14)
  {

    sub_24F933B4C((uint64_t)v13);
LABEL_11:
    type metadata accessor for GamePolicyAgentUpdate.GameEvent();
    swift_deallocPartialClassInstance();
    return 0;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {

    goto LABEL_11;
  }
  uint64_t v6 = OBJC_IVAR_____GamePolicyAgentUpdateGameEvent_date;
  *(void *)&v5[OBJC_IVAR_____GamePolicyAgentUpdateGameEvent_date] = v12;
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_24F93DBA0;
  *(void *)(v7 + 32) = sub_24F927D4C(0, &qword_269A33F98);
  sub_24F93CAC8();
  swift_bridgeObjectRelease();
  if (!v14)
  {

    sub_24F933B4C((uint64_t)v13);
LABEL_10:
    uint64_t v9 = *(void **)&v5[v6];

    goto LABEL_11;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {

    goto LABEL_10;
  }
  *(void *)&v5[OBJC_IVAR_____GamePolicyAgentUpdateGameEvent_auditTokenNSValue] = v12;

  v11.receiver = v5;
  v11.super_class = (Class)type metadata accessor for GamePolicyAgentUpdate.GameEvent();
  id v8 = objc_msgSendSuper2(&v11, sel_init);

  return v8;
}

id GamePolicyAgentUpdate.GameEvent.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void GamePolicyAgentUpdate.GameEvent.init()()
{
}

id GamePolicyAgentUpdate.GameEvent.__deallocating_deinit()
{
  return sub_24F933A60(type metadata accessor for GamePolicyAgentUpdate.GameEvent);
}

BOOL sub_24F93399C(void *a1, void *a2)
{
  return objc_msgSend(*(id *)(*a1 + OBJC_IVAR_____GamePolicyAgentUpdateGameEvent_date), sel_compare_, *(void *)(*a2 + OBJC_IVAR_____GamePolicyAgentUpdateGameEvent_date)) == (id)-1;
}

void GamePolicyAgentUpdate.init()()
{
}

id GamePolicyAgentUpdate.__deallocating_deinit()
{
  return sub_24F933A60(type metadata accessor for GamePolicyAgentUpdate);
}

id sub_24F933A60(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

unint64_t sub_24F933AF4(unint64_t result)
{
  if (result > 4) {
    return 0;
  }
  return result;
}

uint64_t type metadata accessor for GamePolicyAgentUpdate()
{
  return self;
}

uint64_t type metadata accessor for GamePolicyAgentUpdate.GameEvent()
{
  return self;
}

uint64_t sub_24F933B4C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_269A340C0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_24F933BB0()
{
  unint64_t result = qword_269A33FA0;
  if (!qword_269A33FA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A33FA0);
  }
  return result;
}

unint64_t sub_24F933C08()
{
  unint64_t result = qword_269A33FA8;
  if (!qword_269A33FA8)
  {
    type metadata accessor for GamePolicyAgentUpdate.GameEvent();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A33FA8);
  }
  return result;
}

ValueMetadata *type metadata accessor for ConsoleModeEnablementReason()
{
  return &type metadata for ConsoleModeEnablementReason;
}

uint64_t static ConsoleModeLimitation.supportsSecureCoding.getter()
{
  return 1;
}

id ConsoleModeLimitation.__allocating_init(coder:)(void *a1)
{
  v5.receiver = objc_allocWithZone(v1);
  v5.super_class = (Class)type metadata accessor for GamePolicyAssertion.Attribute();
  id v3 = objc_msgSendSuper2(&v5, sel_init);

  return v3;
}

id ConsoleModeLimitation.init(coder:)(void *a1)
{
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for GamePolicyAssertion.Attribute();
  id v3 = objc_msgSendSuper2(&v5, sel_init);

  return v3;
}

id ConsoleModeLimitation.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

id ConsoleModeLimitation.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ConsoleModeLimitation();
  return objc_msgSendSuper2(&v2, sel_init);
}

uint64_t type metadata accessor for ConsoleModeLimitation()
{
  return self;
}

unint64_t ConsoleModeLimitation.description.getter()
{
  return 0xD000000000000017;
}

id ConsoleModeLimitation.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ConsoleModeLimitation();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_24F933ED4()
{
  uint64_t v0 = sub_24F93C918();
  __swift_allocate_value_buffer(v0, static Logger.daemon);
  __swift_project_value_buffer(v0, (uint64_t)static Logger.daemon);
  return sub_24F93C908();
}

uint64_t static Logger.daemon.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_24F934540(&qword_269A33BE0, (uint64_t)static Logger.daemon, a1);
}

uint64_t sub_24F933F6C()
{
  uint64_t v0 = sub_24F93C918();
  __swift_allocate_value_buffer(v0, static Logger.policyCoordinator);
  __swift_project_value_buffer(v0, (uint64_t)static Logger.policyCoordinator);
  return sub_24F93C908();
}

uint64_t Logger.policyCoordinator.unsafeMutableAddressor()
{
  return sub_24F923324(&qword_269A33BE8, (uint64_t)static Logger.policyCoordinator);
}

uint64_t static Logger.policyCoordinator.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_24F934540(&qword_269A33BE8, (uint64_t)static Logger.policyCoordinator, a1);
}

uint64_t sub_24F934028()
{
  uint64_t v0 = sub_24F93C918();
  __swift_allocate_value_buffer(v0, static Logger.agentCoordinator);
  __swift_project_value_buffer(v0, (uint64_t)static Logger.agentCoordinator);
  return sub_24F93C908();
}

uint64_t Logger.agentCoordinator.unsafeMutableAddressor()
{
  return sub_24F923324(&qword_269A33BF0, (uint64_t)static Logger.agentCoordinator);
}

uint64_t static Logger.agentCoordinator.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_24F934540(&qword_269A33BF0, (uint64_t)static Logger.agentCoordinator, a1);
}

uint64_t sub_24F9340E4()
{
  uint64_t v0 = sub_24F93C918();
  __swift_allocate_value_buffer(v0, static Logger.appCoordinator);
  __swift_project_value_buffer(v0, (uint64_t)static Logger.appCoordinator);
  return sub_24F93C908();
}

uint64_t Logger.appCoordinator.unsafeMutableAddressor()
{
  return sub_24F923324(&qword_269A33BF8, (uint64_t)static Logger.appCoordinator);
}

uint64_t static Logger.appCoordinator.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_24F934540(&qword_269A33BF8, (uint64_t)static Logger.appCoordinator, a1);
}

uint64_t sub_24F93419C()
{
  uint64_t v0 = sub_24F93C918();
  __swift_allocate_value_buffer(v0, static Logger.toolCoordinator);
  __swift_project_value_buffer(v0, (uint64_t)static Logger.toolCoordinator);
  return sub_24F93C908();
}

uint64_t Logger.toolCoordinator.unsafeMutableAddressor()
{
  return sub_24F923324(&qword_269A33C00, (uint64_t)static Logger.toolCoordinator);
}

uint64_t static Logger.toolCoordinator.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_24F934540(&qword_269A33C00, (uint64_t)static Logger.toolCoordinator, a1);
}

uint64_t sub_24F934254()
{
  uint64_t v0 = sub_24F93C918();
  __swift_allocate_value_buffer(v0, static Logger.agent);
  __swift_project_value_buffer(v0, (uint64_t)static Logger.agent);
  return sub_24F93C908();
}

uint64_t Logger.agent.unsafeMutableAddressor()
{
  return sub_24F923324(&qword_269A33C08, (uint64_t)static Logger.agent);
}

uint64_t static Logger.agent.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_24F934540(&qword_269A33C08, (uint64_t)static Logger.agent, a1);
}

uint64_t sub_24F934310()
{
  uint64_t v0 = sub_24F93C918();
  __swift_allocate_value_buffer(v0, static Logger.tool);
  __swift_project_value_buffer(v0, (uint64_t)static Logger.tool);
  return sub_24F93C908();
}

uint64_t Logger.tool.unsafeMutableAddressor()
{
  return sub_24F923324(&qword_269A33C10, (uint64_t)static Logger.tool);
}

uint64_t static Logger.tool.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_24F934540(&qword_269A33C10, (uint64_t)static Logger.tool, a1);
}

uint64_t sub_24F9343C8()
{
  uint64_t v0 = sub_24F93C918();
  __swift_allocate_value_buffer(v0, static Logger.common);
  __swift_project_value_buffer(v0, (uint64_t)static Logger.common);
  return sub_24F93C908();
}

uint64_t Logger.common.unsafeMutableAddressor()
{
  return sub_24F923324(&qword_269A33C18, (uint64_t)static Logger.common);
}

uint64_t static Logger.common.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_24F934540(&qword_269A33C18, (uint64_t)static Logger.common, a1);
}

uint64_t sub_24F934484()
{
  uint64_t v0 = sub_24F93C918();
  __swift_allocate_value_buffer(v0, static Logger.assets);
  __swift_project_value_buffer(v0, (uint64_t)static Logger.assets);
  return sub_24F93C908();
}

uint64_t Logger.assets.unsafeMutableAddressor()
{
  return sub_24F923324(&qword_269A33C20, (uint64_t)static Logger.assets);
}

uint64_t static Logger.assets.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_24F934540(&qword_269A33C20, (uint64_t)static Logger.assets, a1);
}

uint64_t sub_24F934540@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_24F93C918();
  uint64_t v6 = __swift_project_value_buffer(v5, a2);
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);
  return v7(a3, v6, v5);
}

uint64_t sub_24F9345D8()
{
  sub_24F9346EC();
  uint64_t result = sub_24F93CB08();
  static Logger.stateTracking = result;
  return result;
}

uint64_t *Logger.stateTracking.unsafeMutableAddressor()
{
  if (qword_269A33C28 != -1) {
    swift_once();
  }
  return &static Logger.stateTracking;
}

id static Logger.stateTracking.getter()
{
  if (qword_269A33C28 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)static Logger.stateTracking;
  return v0;
}

unint64_t sub_24F9346EC()
{
  unint64_t result = qword_269A33FB0;
  if (!qword_269A33FB0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_269A33FB0);
  }
  return result;
}

uint64_t *__swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

Swift::String *kGamePolicyToolEntitlement.unsafeMutableAddressor()
{
  return &kGamePolicyToolEntitlement;
}

Swift::String *kGamePolicyPrivilegedToolEntitlement.unsafeMutableAddressor()
{
  return &kGamePolicyPrivilegedToolEntitlement;
}

NSXPCInterface __swiftcall GamePolicyToolServerInterface()()
{
  return (NSXPCInterface)sub_24F9247D4(&protocolRef__TtP10GamePolicy20GamePolicyToolServer_);
}

NSXPCInterface __swiftcall GamePolicyToolClientInterface()()
{
  return (NSXPCInterface)sub_24F9247D4(&protocolRef__TtP10GamePolicy20GamePolicyToolClient_);
}

NSXPCInterface __swiftcall GamePolicyPrivilegedToolServerInterface()()
{
  objc_msgSend(self, sel_interfaceWithProtocol_, &unk_2701157E0);
  sub_24F927D4C(0, &qword_269A33FB8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A33FC0);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_24F93E3E0;
  uint64_t v1 = type metadata accessor for DynamicSplitterStatus(0);
  *(void *)(v0 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_269A33FC8);
  *(void *)(v0 + 32) = v1;
  uint64_t v2 = sub_24F927D4C(0, (unint64_t *)&unk_269A33F70);
  *(void *)(v0 + 88) = __swift_instantiateConcreteTypeFromMangledName(&qword_269A33FD0);
  *(void *)(v0 + 64) = v2;
  uint64_t v3 = sub_24F927D4C(0, &qword_269A33DD0);
  *(void *)(v0 + 120) = __swift_instantiateConcreteTypeFromMangledName(&qword_269A33FD8);
  *(void *)(v0 + 96) = v3;
  uint64_t v4 = sub_24F927D4C(0, (unint64_t *)&qword_269A33C70);
  *(void *)(v0 + 152) = __swift_instantiateConcreteTypeFromMangledName(&qword_269A33FE0);
  *(void *)(v0 + 128) = v4;
  uint64_t v5 = sub_24F927D4C(0, (unint64_t *)&unk_269A33D20);
  *(void *)(v0 + 184) = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_269A33FE8);
  *(void *)(v0 + 160) = v5;
  MEMORY[0x2533660C0](v0);
  result.super.Class isa = (Class)sub_24F93CA98();
  __break(1u);
  return result;
}

NSXPCInterface __swiftcall GamePolicyPrivilegedToolClientInterface()()
{
  return (NSXPCInterface)sub_24F9247D4(&protocolRef__TtP10GamePolicy30GamePolicyPrivilegedToolClient_);
}

uint64_t SustainedExecutionStatus.Config.enabled.getter()
{
  return *v0;
}

uint64_t SustainedExecutionStatus.Config.enabled.setter(uint64_t result)
{
  *uint64_t v1 = result;
  return result;
}

uint64_t (*SustainedExecutionStatus.Config.enabled.modify())()
{
  return nullsub_1;
}

uint64_t SustainedExecutionStatus.Config.enablementDate.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for SustainedExecutionStatus.Config(0);
  return sub_24F925458(v1 + *(int *)(v3 + 20), a1, &qword_269A33C50);
}

uint64_t type metadata accessor for SustainedExecutionStatus.Config(uint64_t a1)
{
  return sub_24F925200(a1, (uint64_t *)&unk_269A34038);
}

uint64_t SustainedExecutionStatus.Config.enablementDate.setter(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for SustainedExecutionStatus.Config(0);
  return sub_24F9257E4(a1, v1 + *(int *)(v3 + 20), &qword_269A33C50);
}

uint64_t (*SustainedExecutionStatus.Config.enablementDate.modify())()
{
  return nullsub_1;
}

uint64_t SustainedExecutionStatus.Config.disablementDate.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for SustainedExecutionStatus.Config(0);
  return sub_24F925458(v1 + *(int *)(v3 + 24), a1, &qword_269A33C50);
}

uint64_t SustainedExecutionStatus.Config.disablementDate.setter(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for SustainedExecutionStatus.Config(0);
  return sub_24F9257E4(a1, v1 + *(int *)(v3 + 24), &qword_269A33C50);
}

uint64_t (*SustainedExecutionStatus.Config.disablementDate.modify())()
{
  return nullsub_1;
}

uint64_t SustainedExecutionStatus.Config.deviceSupported.getter()
{
  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for SustainedExecutionStatus.Config(0) + 28));
}

uint64_t SustainedExecutionStatus.Config.deviceSupported.setter(char a1)
{
  uint64_t result = type metadata accessor for SustainedExecutionStatus.Config(0);
  *(unsigned char *)(v1 + *(int *)(result + 28)) = a1;
  return result;
}

uint64_t (*SustainedExecutionStatus.Config.deviceSupported.modify())()
{
  return nullsub_1;
}

uint64_t SustainedExecutionStatus.Config.impactedBundleIdentifiers.getter()
{
  type metadata accessor for SustainedExecutionStatus.Config(0);
  return swift_bridgeObjectRetain();
}

uint64_t SustainedExecutionStatus.Config.impactedBundleIdentifiers.setter(uint64_t a1)
{
  uint64_t v3 = *(int *)(type metadata accessor for SustainedExecutionStatus.Config(0) + 32);
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + v3) = a1;
  return result;
}

uint64_t (*SustainedExecutionStatus.Config.impactedBundleIdentifiers.modify())()
{
  return nullsub_1;
}

uint64_t SustainedExecutionStatus.Config.previouslyImpactedBundleIdentifiers.getter()
{
  type metadata accessor for SustainedExecutionStatus.Config(0);
  return swift_bridgeObjectRetain();
}

uint64_t SustainedExecutionStatus.Config.previouslyImpactedBundleIdentifiers.setter(uint64_t a1)
{
  uint64_t v3 = *(int *)(type metadata accessor for SustainedExecutionStatus.Config(0) + 36);
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + v3) = a1;
  return result;
}

uint64_t (*SustainedExecutionStatus.Config.previouslyImpactedBundleIdentifiers.modify())()
{
  return nullsub_1;
}

uint64_t SustainedExecutionStatus.Config.enablementStrategy.getter()
{
  return *(void *)(v0 + *(int *)(type metadata accessor for SustainedExecutionStatus.Config(0) + 40));
}

uint64_t SustainedExecutionStatus.Config.enablementStrategy.setter(uint64_t a1)
{
  uint64_t result = type metadata accessor for SustainedExecutionStatus.Config(0);
  *(void *)(v1 + *(int *)(result + 40)) = a1;
  return result;
}

uint64_t (*SustainedExecutionStatus.Config.enablementStrategy.modify())()
{
  return nullsub_1;
}

uint64_t SustainedExecutionStatus.Config.init(enabled:enablementDate:disablementDate:deviceSupported:impactedBundleIdentifiers:previouslyImpactedBundleIdentifiers:enablementStrategy:)@<X0>(char a1@<W0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char a4@<W3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, unsigned char *a8@<X8>)
{
  uint64_t v12 = (int *)type metadata accessor for SustainedExecutionStatus.Config(0);
  uint64_t v13 = (uint64_t)&a8[v12[5]];
  uint64_t v14 = sub_24F93C8F8();
  uint64_t v15 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56);
  v15(v13, 1, 1, v14);
  uint64_t v16 = (uint64_t)&a8[v12[6]];
  v15(v16, 1, 1, v14);
  *a8 = a1;
  sub_24F9257E4(a2, v13, &qword_269A33C50);
  uint64_t result = sub_24F9257E4(a3, v16, &qword_269A33C50);
  a8[v12[7]] = a4;
  *(void *)&a8[v12[8]] = a5;
  *(void *)&a8[v12[9]] = a6;
  *(void *)&a8[v12[10]] = a7;
  return result;
}

uint64_t SustainedExecutionStatus.enabled.getter()
{
  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC10GamePolicy24SustainedExecutionStatus_enabled);
}

uint64_t SustainedExecutionStatus.enablementDate.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_24F925458(v1 + OBJC_IVAR____TtC10GamePolicy24SustainedExecutionStatus_enablementDate, a1, &qword_269A33C50);
}

uint64_t SustainedExecutionStatus.disablementDate.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_24F925458(v1 + OBJC_IVAR____TtC10GamePolicy24SustainedExecutionStatus_disablementDate, a1, &qword_269A33C50);
}

uint64_t SustainedExecutionStatus.deviceSupported.getter()
{
  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC10GamePolicy24SustainedExecutionStatus_deviceSupported);
}

uint64_t SustainedExecutionStatus.impactedBundleIdentifiers.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t SustainedExecutionStatus.previouslyImpactedBundleIdentifiers.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t SustainedExecutionStatus.enablementStrategy.getter()
{
  return *(void *)(v0 + OBJC_IVAR____TtC10GamePolicy24SustainedExecutionStatus_enablementStrategy);
}

id SustainedExecutionStatus.__allocating_init(config:)(unsigned char *a1)
{
  id v3 = objc_allocWithZone(v1);
  return SustainedExecutionStatus.init(config:)(a1);
}

id SustainedExecutionStatus.init(config:)(unsigned char *a1)
{
  id v3 = &v1[OBJC_IVAR____TtC10GamePolicy24SustainedExecutionStatus____lazy_storage___config];
  uint64_t v4 = (int *)type metadata accessor for SustainedExecutionStatus.Config(0);
  (*(void (**)(char *, uint64_t, uint64_t, int *))(*((void *)v4 - 1) + 56))(v3, 1, 1, v4);
  v1[OBJC_IVAR____TtC10GamePolicy24SustainedExecutionStatus_enabled] = *a1;
  sub_24F925458((uint64_t)&a1[v4[5]], (uint64_t)&v1[OBJC_IVAR____TtC10GamePolicy24SustainedExecutionStatus_enablementDate], &qword_269A33C50);
  sub_24F925458((uint64_t)&a1[v4[6]], (uint64_t)&v1[OBJC_IVAR____TtC10GamePolicy24SustainedExecutionStatus_disablementDate], &qword_269A33C50);
  v1[OBJC_IVAR____TtC10GamePolicy24SustainedExecutionStatus_deviceSupported] = a1[v4[7]];
  *(void *)&v1[OBJC_IVAR____TtC10GamePolicy24SustainedExecutionStatus_impactedBundleIdentifiers] = *(void *)&a1[v4[8]];
  *(void *)&v1[OBJC_IVAR____TtC10GamePolicy24SustainedExecutionStatus_previouslyImpactedBundleIdentifiers] = *(void *)&a1[v4[9]];
  *(void *)&v1[OBJC_IVAR____TtC10GamePolicy24SustainedExecutionStatus_enablementStrategy] = *(void *)&a1[v4[10]];
  v7.receiver = v1;
  v7.super_class = (Class)type metadata accessor for SustainedExecutionStatus(0);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v5 = objc_msgSendSuper2(&v7, sel_init);
  sub_24F935208((uint64_t)a1);
  return v5;
}

uint64_t type metadata accessor for SustainedExecutionStatus(uint64_t a1)
{
  return sub_24F925200(a1, qword_269A34010);
}

uint64_t sub_24F935208(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for SustainedExecutionStatus.Config(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t SustainedExecutionStatus.config.getter@<X0>(unsigned char *a1@<X8>)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A34008);
  uint64_t v4 = MEMORY[0x270FA5388](v3 - 8);
  uint64_t v6 = &v13[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v4);
  id v8 = &v13[-v7];
  uint64_t v9 = v1 + OBJC_IVAR____TtC10GamePolicy24SustainedExecutionStatus____lazy_storage___config;
  swift_beginAccess();
  sub_24F925458(v9, (uint64_t)v8, &qword_269A34008);
  uint64_t v10 = type metadata accessor for SustainedExecutionStatus.Config(0);
  uint64_t v11 = *(void *)(v10 - 8);
  if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v11 + 48))(v8, 1, v10) != 1) {
    return sub_24F935750((uint64_t)v8, (uint64_t)a1);
  }
  sub_24F927D88((uint64_t)v8, &qword_269A34008);
  sub_24F935428(v1, a1);
  sub_24F9356EC((uint64_t)a1, (uint64_t)v6);
  (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v11 + 56))(v6, 0, 1, v10);
  swift_beginAccess();
  sub_24F9257E4((uint64_t)v6, v9, &qword_269A34008);
  return swift_endAccess();
}

uint64_t sub_24F935428@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v26 = a1;
  uint64_t v3 = type metadata accessor for SustainedExecutionStatus.Config(0);
  uint64_t v4 = (int *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A33C50);
  uint64_t v8 = MEMORY[0x270FA5388](v7 - 8);
  uint64_t v10 = (char *)&v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v25 - v11;
  uint64_t v13 = sub_24F93C8F8();
  uint64_t v14 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56);
  v14(v12, 1, 1, v13);
  v14(v10, 1, 1, v13);
  uint64_t v15 = (uint64_t)&v6[v4[7]];
  v14((char *)v15, 1, 1, v13);
  uint64_t v16 = (uint64_t)&v6[v4[8]];
  v14((char *)v16, 1, 1, v13);
  unsigned char *v6 = 0;
  sub_24F9257E4((uint64_t)v12, v15, &qword_269A33C50);
  sub_24F9257E4((uint64_t)v10, v16, &qword_269A33C50);
  v6[v4[9]] = 0;
  uint64_t v17 = MEMORY[0x263F8EE78];
  *(void *)&v6[v4[10]] = MEMORY[0x263F8EE78];
  *(void *)&v6[v4[11]] = v17;
  *(void *)&v6[v4[12]] = 0;
  sub_24F935750((uint64_t)v6, (uint64_t)a2);
  uint64_t v18 = v26;
  *a2 = *(unsigned char *)(v26 + OBJC_IVAR____TtC10GamePolicy24SustainedExecutionStatus_enabled);
  uint64_t v19 = v18;
  sub_24F927DE4(v18 + OBJC_IVAR____TtC10GamePolicy24SustainedExecutionStatus_enablementDate, (uint64_t)&a2[v4[7]]);
  sub_24F927DE4(v19 + OBJC_IVAR____TtC10GamePolicy24SustainedExecutionStatus_disablementDate, (uint64_t)&a2[v4[8]]);
  a2[v4[9]] = *(unsigned char *)(v19 + OBJC_IVAR____TtC10GamePolicy24SustainedExecutionStatus_deviceSupported);
  uint64_t v20 = *(void *)(v19 + OBJC_IVAR____TtC10GamePolicy24SustainedExecutionStatus_impactedBundleIdentifiers);
  uint64_t v21 = v4[10];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)&a2[v21] = v20;
  uint64_t v22 = *(void *)(v19 + OBJC_IVAR____TtC10GamePolicy24SustainedExecutionStatus_previouslyImpactedBundleIdentifiers);
  uint64_t v23 = v4[11];
  swift_bridgeObjectRetain();
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)&a2[v23] = v22;
  *(void *)&a2[v4[12]] = *(void *)(v19 + OBJC_IVAR____TtC10GamePolicy24SustainedExecutionStatus_enablementStrategy);
  return result;
}

uint64_t sub_24F9356EC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SustainedExecutionStatus.Config(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24F935750(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SustainedExecutionStatus.Config(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t SustainedExecutionStatus.config.setter(uint64_t a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A34008);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24F935750(a1, (uint64_t)v5);
  uint64_t v6 = type metadata accessor for SustainedExecutionStatus.Config(0);
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 0, 1, v6);
  uint64_t v7 = v1 + OBJC_IVAR____TtC10GamePolicy24SustainedExecutionStatus____lazy_storage___config;
  swift_beginAccess();
  sub_24F9257E4((uint64_t)v5, v7, &qword_269A34008);
  return swift_endAccess();
}

void (*SustainedExecutionStatus.config.modify(void *a1))(uint64_t a1, char a2)
{
  uint64_t v3 = malloc(0x60uLL);
  *a1 = v3;
  v3[6] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A34008);
  v3[7] = malloc(*(void *)(*(void *)(v4 - 8) + 64));
  uint64_t v5 = type metadata accessor for SustainedExecutionStatus.Config(0);
  v3[8] = v5;
  uint64_t v6 = *(void *)(v5 - 8);
  v3[9] = v6;
  size_t v7 = *(void *)(v6 + 64);
  v3[10] = malloc(v7);
  uint64_t v8 = malloc(v7);
  v3[11] = v8;
  SustainedExecutionStatus.config.getter(v8);
  return sub_24F9359A4;
}

void sub_24F9359A4(uint64_t a1, char a2)
{
  uint64_t v2 = *(void **)a1;
  uint64_t v4 = *(void **)(*(void *)a1 + 80);
  uint64_t v3 = *(void **)(*(void *)a1 + 88);
  if (a2)
  {
    uint64_t v5 = v2[8];
    uint64_t v6 = v2[9];
    uint64_t v8 = v2[6];
    size_t v7 = (void *)v2[7];
    sub_24F9356EC(v2[11], v2[10]);
    sub_24F935750((uint64_t)v4, (uint64_t)v7);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v6 + 56))(v7, 0, 1, v5);
    uint64_t v9 = v8 + OBJC_IVAR____TtC10GamePolicy24SustainedExecutionStatus____lazy_storage___config;
    swift_beginAccess();
    sub_24F9257E4((uint64_t)v7, v9, &qword_269A34008);
    swift_endAccess();
    sub_24F935208((uint64_t)v3);
  }
  else
  {
    uint64_t v10 = v2[8];
    uint64_t v11 = v2[9];
    uint64_t v12 = v2[6];
    size_t v7 = (void *)v2[7];
    sub_24F935750(v2[11], (uint64_t)v7);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v7, 0, 1, v10);
    uint64_t v13 = v12 + OBJC_IVAR____TtC10GamePolicy24SustainedExecutionStatus____lazy_storage___config;
    swift_beginAccess();
    sub_24F9257E4((uint64_t)v7, v13, &qword_269A34008);
    swift_endAccess();
  }
  free(v3);
  free(v4);
  free(v7);
  free(v2);
}

uint64_t static SustainedExecutionStatus.supportsSecureCoding.getter()
{
  return 1;
}

Swift::Void __swiftcall SustainedExecutionStatus.encode(with:)(NSCoder with)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A33C50);
  uint64_t v4 = MEMORY[0x270FA5388](v3 - 8);
  uint64_t v6 = (char *)&v34 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v34 - v7;
  uint64_t v9 = sub_24F93C8F8();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  int v35 = (char *)&v34 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v34 - v13;
  uint64_t v15 = *(unsigned __int8 *)(v1 + OBJC_IVAR____TtC10GamePolicy24SustainedExecutionStatus_enabled);
  uint64_t v16 = (void *)sub_24F93C958();
  Class isa = with.super.isa;
  [(objc_class *)with.super.isa encodeBool:v15 forKey:v16];

  uint64_t v36 = v1;
  sub_24F925458(v1 + OBJC_IVAR____TtC10GamePolicy24SustainedExecutionStatus_enablementDate, (uint64_t)v8, &qword_269A33C50);
  uint64_t v17 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48);
  if (v17(v8, 1, v9) == 1)
  {
    sub_24F927D88((uint64_t)v8, &qword_269A33C50);
    Class v18 = isa;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v14, v8, v9);
    uint64_t v19 = (void *)sub_24F93C8E8();
    uint64_t v20 = (void *)sub_24F93C958();
    Class v18 = isa;
    [(objc_class *)isa encodeObject:v19 forKey:v20];

    (*(void (**)(char *, uint64_t))(v10 + 8))(v14, v9);
  }
  uint64_t v21 = v36;
  sub_24F925458(v36 + OBJC_IVAR____TtC10GamePolicy24SustainedExecutionStatus_disablementDate, (uint64_t)v6, &qword_269A33C50);
  if (v17(v6, 1, v9) == 1)
  {
    sub_24F927D88((uint64_t)v6, &qword_269A33C50);
    unint64_t v22 = 0x26533D000;
  }
  else
  {
    uint64_t v23 = v35;
    (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v35, v6, v9);
    uint64_t v24 = (void *)sub_24F93C8E8();
    uint64_t v25 = (void *)sub_24F93C958();
    unint64_t v22 = 0x26533D000uLL;
    [(objc_class *)v18 encodeObject:v24 forKey:v25];

    (*(void (**)(char *, uint64_t))(v10 + 8))(v23, v9);
  }
  uint64_t v26 = *(unsigned __int8 *)(v21 + OBJC_IVAR____TtC10GamePolicy24SustainedExecutionStatus_deviceSupported);
  uint64_t v27 = (void *)sub_24F93C958();
  [(objc_class *)v18 encodeBool:v26 forKey:v27];

  sub_24F926108(*(void *)(v21 + OBJC_IVAR____TtC10GamePolicy24SustainedExecutionStatus_impactedBundleIdentifiers));
  sub_24F927D4C(0, (unint64_t *)&qword_269A33C70);
  int v28 = (void *)sub_24F93CA58();
  swift_bridgeObjectRelease();
  unint64_t v29 = (void *)sub_24F93C958();
  objc_msgSend(v18, *(SEL *)(v22 + 2992), v28, v29);

  sub_24F926108(*(void *)(v21
                          + OBJC_IVAR____TtC10GamePolicy24SustainedExecutionStatus_previouslyImpactedBundleIdentifiers));
  uint64_t v30 = (void *)sub_24F93CA58();
  swift_bridgeObjectRelease();
  unint64_t v31 = (void *)sub_24F93C958();
  objc_msgSend(v18, *(SEL *)(v22 + 2992), v30, v31);

  uint64_t v32 = *(void *)(v21 + OBJC_IVAR____TtC10GamePolicy24SustainedExecutionStatus_enablementStrategy);
  unsigned int v33 = (void *)sub_24F93C958();
  [(objc_class *)v18 encodeInteger:v32 forKey:v33];
}

id SustainedExecutionStatus.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  id v4 = sub_24F936274(a1);

  return v4;
}

id SustainedExecutionStatus.init(coder:)(void *a1)
{
  id v2 = sub_24F936274(a1);

  return v2;
}

id SustainedExecutionStatus.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void SustainedExecutionStatus.init()()
{
}

id SustainedExecutionStatus.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SustainedExecutionStatus(0);
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id sub_24F936274(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A33C50);
  uint64_t v4 = MEMORY[0x270FA5388](v3 - 8);
  *(void *)&long long v57 = (char *)&v55 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v55 - v6;
  uint64_t v8 = sub_24F93C8F8();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  v56 = (char *)&v55 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v55 - v12;
  uint64_t v14 = &v1[OBJC_IVAR____TtC10GamePolicy24SustainedExecutionStatus____lazy_storage___config];
  uint64_t v15 = type metadata accessor for SustainedExecutionStatus.Config(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v14, 1, 1, v15);
  uint64_t v16 = v1;
  uint64_t v17 = (void *)sub_24F93C958();
  unint64_t v18 = 0x26533D000uLL;
  unsigned __int8 v19 = objc_msgSend(a1, sel_decodeBoolForKey_, v17);

  v16[OBJC_IVAR____TtC10GamePolicy24SustainedExecutionStatus_enabled] = v19;
  uint64_t v20 = (void *)sub_24F93C958();
  unsigned __int8 v21 = objc_msgSend(a1, sel_containsValueForKey_, v20);

  unint64_t v22 = &loc_24F93D000;
  if ((v21 & 1) == 0)
  {
    uint64_t v25 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56);
LABEL_8:
    unint64_t v26 = 0x26533D000uLL;
    v25(&v16[OBJC_IVAR____TtC10GamePolicy24SustainedExecutionStatus_enablementDate], 1, 1, v8);
    goto LABEL_9;
  }
  id v55 = v13;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A340A0);
  uint64_t v23 = swift_allocObject();
  *(_OWORD *)(v23 + 16) = xmmword_24F93DBA0;
  *(void *)(v23 + 32) = sub_24F927D4C(0, (unint64_t *)&unk_269A33D20);
  sub_24F93CAC8();
  swift_bridgeObjectRelease();
  if (!v59)
  {
    sub_24F927D88((uint64_t)v58, (uint64_t *)&unk_269A340C0);
    uint64_t v25 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v25(v7, 1, 1, v8);
    goto LABEL_7;
  }
  int v24 = swift_dynamicCast();
  uint64_t v25 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56);
  v25(v7, v24 ^ 1u, 1, v8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1)
  {
    unint64_t v22 = (_OWORD *)&loc_24F93D000;
LABEL_7:
    sub_24F927D88((uint64_t)v7, &qword_269A33C50);
    goto LABEL_8;
  }
  uint64_t v51 = *(void (**)(char *, char *, uint64_t))(v9 + 32);
  uint64_t v52 = v55;
  v51(v55, v7, v8);
  v53 = v51;
  id v54 = &v16[OBJC_IVAR____TtC10GamePolicy24SustainedExecutionStatus_enablementDate];
  v53(&v16[OBJC_IVAR____TtC10GamePolicy24SustainedExecutionStatus_enablementDate], v52, v8);
  unint64_t v18 = 0x26533D000;
  v25(v54, 0, 1, v8);
  unint64_t v22 = (_OWORD *)&loc_24F93D000;
  unint64_t v26 = 0x26533D000;
LABEL_9:
  uint64_t v27 = (void *)sub_24F93C958();
  unsigned int v28 = objc_msgSend(a1, *(SEL *)(v26 + 3016), v27);

  if (!v28)
  {
LABEL_15:
    v25(&v16[OBJC_IVAR____TtC10GamePolicy24SustainedExecutionStatus_disablementDate], 1, 1, v8);
    goto LABEL_16;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A340A0);
  uint64_t v29 = swift_allocObject();
  *(_OWORD *)(v29 + 16) = v22[186];
  *(void *)(v29 + 32) = sub_24F927D4C(0, (unint64_t *)&unk_269A33D20);
  sub_24F93CAC8();
  swift_bridgeObjectRelease();
  if (!v59)
  {
    sub_24F927D88((uint64_t)v58, (uint64_t *)&unk_269A340C0);
    v25((char *)v57, 1, 1, v8);
    goto LABEL_14;
  }
  uint64_t v30 = (char *)v57;
  int v31 = swift_dynamicCast();
  v25(v30, v31 ^ 1u, 1, v8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v30, 1, v8) == 1)
  {
LABEL_14:
    sub_24F927D88(v57, &qword_269A33C50);
    goto LABEL_15;
  }
  uint64_t v32 = *(void (**)(char *, char *, uint64_t))(v9 + 32);
  unsigned int v33 = v56;
  v32(v56, (char *)v57, v8);
  uint64_t v34 = &v16[OBJC_IVAR____TtC10GamePolicy24SustainedExecutionStatus_disablementDate];
  v32(&v16[OBJC_IVAR____TtC10GamePolicy24SustainedExecutionStatus_disablementDate], v33, v8);
  unint64_t v18 = 0x26533D000;
  unint64_t v22 = (_OWORD *)&loc_24F93D000;
  v25(v34, 0, 1, v8);
LABEL_16:
  int v35 = (void *)sub_24F93C958();
  unsigned __int8 v36 = objc_msgSend(a1, *(SEL *)(v18 + 3008), v35);

  v16[OBJC_IVAR____TtC10GamePolicy24SustainedExecutionStatus_deviceSupported] = v36;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A340A0);
  uint64_t v37 = swift_allocObject();
  long long v57 = v22[186];
  *(_OWORD *)(v37 + 16) = v57;
  uint64_t v38 = sub_24F927D4C(0, (unint64_t *)&qword_269A33C70);
  *(void *)(v37 + 32) = v38;
  uint64_t v39 = sub_24F93CAE8();
  swift_bridgeObjectRelease();
  uint64_t v40 = MEMORY[0x263F8EE78];
  if (v39)
  {
    uint64_t v41 = sub_24F92A890(v39);
    swift_bridgeObjectRelease();
    if (v41) {
      uint64_t v40 = v41;
    }
  }
  *(void *)&v16[OBJC_IVAR____TtC10GamePolicy24SustainedExecutionStatus_impactedBundleIdentifiers] = v40;
  uint64_t v42 = swift_allocObject();
  *(_OWORD *)(v42 + 16) = v57;
  *(void *)(v42 + 32) = v38;
  uint64_t v43 = sub_24F93CAE8();
  swift_bridgeObjectRelease();
  uint64_t v44 = MEMORY[0x263F8EE78];
  if (v43)
  {
    uint64_t v45 = sub_24F92A890(v43);
    swift_bridgeObjectRelease();
    if (v45) {
      uint64_t v44 = v45;
    }
  }
  *(void *)&v16[OBJC_IVAR____TtC10GamePolicy24SustainedExecutionStatus_previouslyImpactedBundleIdentifiers] = v44;
  uint64_t v46 = (void *)sub_24F93C958();
  id v47 = objc_msgSend(a1, sel_decodeIntegerForKey_, v46);

  uint64_t v48 = v47 == (id)1;
  if (v47 == (id)2) {
    uint64_t v48 = 2;
  }
  *(void *)&v16[OBJC_IVAR____TtC10GamePolicy24SustainedExecutionStatus_enablementStrategy] = v48;

  uint64_t v49 = (objc_class *)type metadata accessor for SustainedExecutionStatus(0);
  v60.receiver = v16;
  v60.super_class = v49;
  return objc_msgSendSuper2(&v60, sel_init);
}

uint64_t sub_24F936A84()
{
  return type metadata accessor for SustainedExecutionStatus(0);
}

void sub_24F936A8C()
{
  sub_24F936BB8(319, &qword_269A33CF0, MEMORY[0x263F07490]);
  if (v0 <= 0x3F)
  {
    sub_24F936BB8(319, (unint64_t *)&unk_269A34028, (void (*)(uint64_t))type metadata accessor for SustainedExecutionStatus.Config);
    if (v1 <= 0x3F) {
      swift_updateClassMetadata2();
    }
  }
}

void sub_24F936BB8(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = sub_24F93CB18();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t getEnumTagSinglePayload for SustainedExecutionStatus.Config(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24F936C20);
}

uint64_t sub_24F936C20(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A33C50);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1 + *(int *)(a3 + 20);
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v10(v9, a2, v8);
  }
  else
  {
    unint64_t v12 = *(void *)(a1 + *(int *)(a3 + 32));
    if (v12 >= 0xFFFFFFFF) {
      LODWORD(v12) = -1;
    }
    return (v12 + 1);
  }
}

uint64_t storeEnumTagSinglePayload for SustainedExecutionStatus.Config(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24F936CFC);
}

uint64_t sub_24F936CFC(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = __swift_instantiateConcreteTypeFromMangledName(&qword_269A33C50);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = result;
    uint64_t v11 = a1 + *(int *)(a4 + 20);
    unint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v12(v11, a2, a2, v10);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 32)) = (a2 - 1);
  }
  return result;
}

void sub_24F936DC0()
{
  sub_24F936BB8(319, &qword_269A33CF0, MEMORY[0x263F07490]);
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

uint64_t static ConsoleModeGrant.supportsSecureCoding.getter()
{
  return 1;
}

id ConsoleModeGrant.__allocating_init(coder:)(void *a1)
{
  v5.receiver = objc_allocWithZone(v1);
  v5.super_class = (Class)type metadata accessor for GamePolicyAssertion.Attribute();
  id v3 = objc_msgSendSuper2(&v5, sel_init);

  return v3;
}

id ConsoleModeGrant.init(coder:)(void *a1)
{
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for GamePolicyAssertion.Attribute();
  id v3 = objc_msgSendSuper2(&v5, sel_init);

  return v3;
}

id ConsoleModeGrant.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

id ConsoleModeGrant.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ConsoleModeGrant();
  return objc_msgSendSuper2(&v2, sel_init);
}

uint64_t type metadata accessor for ConsoleModeGrant()
{
  return self;
}

unint64_t ConsoleModeGrant.description.getter()
{
  return 0xD000000000000012;
}

id ConsoleModeGrant.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ConsoleModeGrant();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t static IdentifiedGameGrant.supportsSecureCoding.getter()
{
  return 1;
}

id IdentifiedGameGrant.__allocating_init(coder:)(void *a1)
{
  v5.receiver = objc_allocWithZone(v1);
  v5.super_class = (Class)type metadata accessor for GamePolicyAssertion.Attribute();
  id v3 = objc_msgSendSuper2(&v5, sel_init);

  return v3;
}

id IdentifiedGameGrant.init(coder:)(void *a1)
{
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for GamePolicyAssertion.Attribute();
  id v3 = objc_msgSendSuper2(&v5, sel_init);

  return v3;
}

id IdentifiedGameGrant.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

id IdentifiedGameGrant.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for IdentifiedGameGrant();
  return objc_msgSendSuper2(&v2, sel_init);
}

uint64_t type metadata accessor for IdentifiedGameGrant()
{
  return self;
}

unint64_t IdentifiedGameGrant.description.getter()
{
  return 0xD000000000000015;
}

id IdentifiedGameGrant.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for IdentifiedGameGrant();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t GameModeStatus.Config.enabled.getter()
{
  return *v0;
}

uint64_t GameModeStatus.Config.enabled.setter(uint64_t result)
{
  *id v1 = result;
  return result;
}

uint64_t (*GameModeStatus.Config.enabled.modify())()
{
  return nullsub_1;
}

uint64_t GameModeStatus.Config.enablementDate.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for GameModeStatus.Config(0);
  return sub_24F925458(v1 + *(int *)(v3 + 20), a1, &qword_269A33C50);
}

uint64_t type metadata accessor for GameModeStatus.Config(uint64_t a1)
{
  return sub_24F925200(a1, qword_269A34088);
}

uint64_t GameModeStatus.Config.enablementDate.setter(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for GameModeStatus.Config(0);
  return sub_24F9257E4(a1, v1 + *(int *)(v3 + 20), &qword_269A33C50);
}

uint64_t (*GameModeStatus.Config.enablementDate.modify())()
{
  return nullsub_1;
}

uint64_t GameModeStatus.Config.disablementDate.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for GameModeStatus.Config(0);
  return sub_24F925458(v1 + *(int *)(v3 + 24), a1, &qword_269A33C50);
}

uint64_t GameModeStatus.Config.disablementDate.setter(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for GameModeStatus.Config(0);
  return sub_24F9257E4(a1, v1 + *(int *)(v3 + 24), &qword_269A33C50);
}

uint64_t (*GameModeStatus.Config.disablementDate.modify())()
{
  return nullsub_1;
}

uint64_t GameModeStatus.Config.deviceSupported.getter()
{
  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for GameModeStatus.Config(0) + 28));
}

uint64_t GameModeStatus.Config.deviceSupported.setter(char a1)
{
  uint64_t result = type metadata accessor for GameModeStatus.Config(0);
  *(unsigned char *)(v1 + *(int *)(result + 28)) = a1;
  return result;
}

uint64_t (*GameModeStatus.Config.deviceSupported.modify())()
{
  return nullsub_1;
}

uint64_t GameModeStatus.Config.jettisonCameraS2R.getter()
{
  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for GameModeStatus.Config(0) + 32));
}

uint64_t GameModeStatus.Config.jettisonCameraS2R.setter(char a1)
{
  uint64_t result = type metadata accessor for GameModeStatus.Config(0);
  *(unsigned char *)(v1 + *(int *)(result + 32)) = a1;
  return result;
}

uint64_t (*GameModeStatus.Config.jettisonCameraS2R.modify())()
{
  return nullsub_1;
}

uint64_t GameModeStatus.Config.gameBundleIdentifiers.getter()
{
  type metadata accessor for GameModeStatus.Config(0);
  return swift_bridgeObjectRetain();
}

uint64_t GameModeStatus.Config.gameBundleIdentifiers.setter(uint64_t a1)
{
  uint64_t v3 = *(int *)(type metadata accessor for GameModeStatus.Config(0) + 36);
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + v3) = a1;
  return result;
}

uint64_t (*GameModeStatus.Config.gameBundleIdentifiers.modify())()
{
  return nullsub_1;
}

uint64_t GameModeStatus.Config.previousGameBundleIdentifiers.getter()
{
  type metadata accessor for GameModeStatus.Config(0);
  return swift_bridgeObjectRetain();
}

uint64_t GameModeStatus.Config.previousGameBundleIdentifiers.setter(uint64_t a1)
{
  uint64_t v3 = *(int *)(type metadata accessor for GameModeStatus.Config(0) + 40);
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + v3) = a1;
  return result;
}

uint64_t (*GameModeStatus.Config.previousGameBundleIdentifiers.modify())()
{
  return nullsub_1;
}

uint64_t GameModeStatus.Config.impactedBundleIdentifiers.getter()
{
  type metadata accessor for GameModeStatus.Config(0);
  return swift_bridgeObjectRetain();
}

uint64_t GameModeStatus.Config.impactedBundleIdentifiers.setter(uint64_t a1)
{
  uint64_t v3 = *(int *)(type metadata accessor for GameModeStatus.Config(0) + 44);
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + v3) = a1;
  return result;
}

uint64_t (*GameModeStatus.Config.impactedBundleIdentifiers.modify())()
{
  return nullsub_1;
}

uint64_t GameModeStatus.Config.previouslyImpactedBundleIdentifiers.getter()
{
  type metadata accessor for GameModeStatus.Config(0);
  return swift_bridgeObjectRetain();
}

uint64_t GameModeStatus.Config.previouslyImpactedBundleIdentifiers.setter(uint64_t a1)
{
  uint64_t v3 = *(int *)(type metadata accessor for GameModeStatus.Config(0) + 48);
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + v3) = a1;
  return result;
}

uint64_t (*GameModeStatus.Config.previouslyImpactedBundleIdentifiers.modify())()
{
  return nullsub_1;
}

uint64_t GameModeStatus.Config.enablementStrategy.getter()
{
  return *(void *)(v0 + *(int *)(type metadata accessor for GameModeStatus.Config(0) + 52));
}

uint64_t GameModeStatus.Config.enablementStrategy.setter(uint64_t a1)
{
  uint64_t result = type metadata accessor for GameModeStatus.Config(0);
  *(void *)(v1 + *(int *)(result + 52)) = a1;
  return result;
}

uint64_t (*GameModeStatus.Config.enablementStrategy.modify())()
{
  return nullsub_1;
}

uint64_t GameModeStatus.Config.init(enabled:enablementDate:disablementDate:deviceSupported:jettisonCameraS2R:gameBundleIdentifiers:previousGameBundleIdentifiers:impactedBundleIdentifiers:previouslyImpactedBundleIdentifiers:enablementStrategy:)@<X0>(char a1@<W0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char a4@<W3>, char a5@<W4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, unsigned char *a9@<X8>, uint64_t a10, uint64_t a11)
{
  uint64_t v15 = (int *)type metadata accessor for GameModeStatus.Config(0);
  uint64_t v16 = (uint64_t)&a9[v15[5]];
  uint64_t v17 = sub_24F93C8F8();
  unint64_t v18 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56);
  v18(v16, 1, 1, v17);
  uint64_t v19 = (uint64_t)&a9[v15[6]];
  v18(v19, 1, 1, v17);
  *a9 = a1;
  sub_24F9257E4(a2, v16, &qword_269A33C50);
  uint64_t result = sub_24F9257E4(a3, v19, &qword_269A33C50);
  a9[v15[7]] = a4;
  a9[v15[8]] = a5;
  *(void *)&a9[v15[9]] = a6;
  *(void *)&a9[v15[10]] = a7;
  *(void *)&a9[v15[11]] = a8;
  *(void *)&a9[v15[12]] = a10;
  *(void *)&a9[v15[13]] = a11;
  return result;
}

uint64_t GameModeStatus.enabled.getter()
{
  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC10GamePolicy14GameModeStatus_enabled);
}

uint64_t GameModeStatus.enablementDate.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_24F925458(v1 + OBJC_IVAR____TtC10GamePolicy14GameModeStatus_enablementDate, a1, &qword_269A33C50);
}

uint64_t GameModeStatus.disablementDate.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_24F925458(v1 + OBJC_IVAR____TtC10GamePolicy14GameModeStatus_disablementDate, a1, &qword_269A33C50);
}

uint64_t GameModeStatus.deviceSupported.getter()
{
  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC10GamePolicy14GameModeStatus_deviceSupported);
}

uint64_t GameModeStatus.jettisonCameraS2R.getter()
{
  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC10GamePolicy14GameModeStatus_jettisonCameraS2R);
}

uint64_t GameModeStatus.gameBundleIdentifiers.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t GameModeStatus.previousGameBundleIdentifiers.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t GameModeStatus.impactedBundleIdentifiers.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t GameModeStatus.previouslyImpactedBundleIdentifiers.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t GameModeStatus.enablementStrategy.getter()
{
  return *(void *)(v0 + OBJC_IVAR____TtC10GamePolicy14GameModeStatus_enablementStrategy);
}

id GameModeStatus.__allocating_init(config:)(unsigned char *a1)
{
  id v3 = objc_allocWithZone(v1);
  return GameModeStatus.init(config:)(a1);
}

id GameModeStatus.init(config:)(unsigned char *a1)
{
  id v3 = &v1[OBJC_IVAR____TtC10GamePolicy14GameModeStatus____lazy_storage___config];
  unint64_t v4 = (int *)type metadata accessor for GameModeStatus.Config(0);
  (*(void (**)(char *, uint64_t, uint64_t, int *))(*((void *)v4 - 1) + 56))(v3, 1, 1, v4);
  v1[OBJC_IVAR____TtC10GamePolicy14GameModeStatus_enabled] = *a1;
  sub_24F925458((uint64_t)&a1[v4[5]], (uint64_t)&v1[OBJC_IVAR____TtC10GamePolicy14GameModeStatus_enablementDate], &qword_269A33C50);
  sub_24F925458((uint64_t)&a1[v4[6]], (uint64_t)&v1[OBJC_IVAR____TtC10GamePolicy14GameModeStatus_disablementDate], &qword_269A33C50);
  v1[OBJC_IVAR____TtC10GamePolicy14GameModeStatus_deviceSupported] = a1[v4[7]];
  v1[OBJC_IVAR____TtC10GamePolicy14GameModeStatus_jettisonCameraS2R] = a1[v4[8]];
  *(void *)&v1[OBJC_IVAR____TtC10GamePolicy14GameModeStatus_gameBundleIdentifiers] = *(void *)&a1[v4[9]];
  *(void *)&v1[OBJC_IVAR____TtC10GamePolicy14GameModeStatus_previousGameBundleIdentifiers] = *(void *)&a1[v4[10]];
  *(void *)&v1[OBJC_IVAR____TtC10GamePolicy14GameModeStatus_impactedBundleIdentifiers] = *(void *)&a1[v4[11]];
  *(void *)&v1[OBJC_IVAR____TtC10GamePolicy14GameModeStatus_previouslyImpactedBundleIdentifiers] = *(void *)&a1[v4[12]];
  *(void *)&v1[OBJC_IVAR____TtC10GamePolicy14GameModeStatus_enablementStrategy] = *(void *)&a1[v4[13]];
  v7.receiver = v1;
  v7.super_class = (Class)type metadata accessor for GameModeStatus(0);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v5 = objc_msgSendSuper2(&v7, sel_init);
  sub_24F937E5C((uint64_t)a1);
  return v5;
}

uint64_t type metadata accessor for GameModeStatus(uint64_t a1)
{
  return sub_24F925200(a1, qword_269A34060);
}

uint64_t sub_24F937E5C(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for GameModeStatus.Config(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t GameModeStatus.config.getter@<X0>(unsigned char *a1@<X8>)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A34058);
  uint64_t v4 = MEMORY[0x270FA5388](v3 - 8);
  uint64_t v6 = &v13[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v4);
  uint64_t v8 = &v13[-v7];
  uint64_t v9 = v1 + OBJC_IVAR____TtC10GamePolicy14GameModeStatus____lazy_storage___config;
  swift_beginAccess();
  sub_24F925458(v9, (uint64_t)v8, &qword_269A34058);
  uint64_t v10 = type metadata accessor for GameModeStatus.Config(0);
  uint64_t v11 = *(void *)(v10 - 8);
  if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v11 + 48))(v8, 1, v10) != 1) {
    return sub_24F938420((uint64_t)v8, (uint64_t)a1);
  }
  sub_24F927D88((uint64_t)v8, &qword_269A34058);
  sub_24F93807C(v1, a1);
  sub_24F9383BC((uint64_t)a1, (uint64_t)v6);
  (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v11 + 56))(v6, 0, 1, v10);
  swift_beginAccess();
  sub_24F9257E4((uint64_t)v6, v9, &qword_269A34058);
  return swift_endAccess();
}

uint64_t sub_24F93807C@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v30 = a1;
  uint64_t v3 = type metadata accessor for GameModeStatus.Config(0);
  uint64_t v4 = (int *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v29 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A33C50);
  uint64_t v8 = MEMORY[0x270FA5388](v7 - 8);
  uint64_t v10 = (char *)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  unint64_t v12 = (char *)&v29 - v11;
  uint64_t v13 = sub_24F93C8F8();
  uint64_t v14 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56);
  v14(v12, 1, 1, v13);
  v14(v10, 1, 1, v13);
  uint64_t v15 = (uint64_t)&v6[v4[7]];
  v14((char *)v15, 1, 1, v13);
  uint64_t v16 = (uint64_t)&v6[v4[8]];
  v14((char *)v16, 1, 1, v13);
  unsigned char *v6 = 0;
  sub_24F9257E4((uint64_t)v12, v15, &qword_269A33C50);
  sub_24F9257E4((uint64_t)v10, v16, &qword_269A33C50);
  v6[v4[9]] = 0;
  v6[v4[10]] = 0;
  uint64_t v17 = MEMORY[0x263F8EE78];
  *(void *)&v6[v4[11]] = MEMORY[0x263F8EE78];
  *(void *)&v6[v4[12]] = v17;
  *(void *)&v6[v4[13]] = v17;
  *(void *)&v6[v4[14]] = v17;
  *(void *)&v6[v4[15]] = 0;
  sub_24F938420((uint64_t)v6, (uint64_t)a2);
  uint64_t v18 = v30;
  *a2 = *(unsigned char *)(v30 + OBJC_IVAR____TtC10GamePolicy14GameModeStatus_enabled);
  sub_24F927DE4(v18 + OBJC_IVAR____TtC10GamePolicy14GameModeStatus_enablementDate, (uint64_t)&a2[v4[7]]);
  sub_24F927DE4(v18 + OBJC_IVAR____TtC10GamePolicy14GameModeStatus_disablementDate, (uint64_t)&a2[v4[8]]);
  a2[v4[9]] = *(unsigned char *)(v18 + OBJC_IVAR____TtC10GamePolicy14GameModeStatus_deviceSupported);
  a2[v4[10]] = *(unsigned char *)(v18 + OBJC_IVAR____TtC10GamePolicy14GameModeStatus_jettisonCameraS2R);
  uint64_t v19 = *(void *)(v18 + OBJC_IVAR____TtC10GamePolicy14GameModeStatus_gameBundleIdentifiers);
  uint64_t v20 = v18;
  uint64_t v21 = v4[11];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)&a2[v21] = v19;
  uint64_t v22 = *(void *)(v20 + OBJC_IVAR____TtC10GamePolicy14GameModeStatus_previousGameBundleIdentifiers);
  uint64_t v23 = v4[12];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)&a2[v23] = v22;
  uint64_t v24 = *(void *)(v20 + OBJC_IVAR____TtC10GamePolicy14GameModeStatus_impactedBundleIdentifiers);
  uint64_t v25 = v4[13];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)&a2[v25] = v24;
  uint64_t v26 = *(void *)(v20 + OBJC_IVAR____TtC10GamePolicy14GameModeStatus_previouslyImpactedBundleIdentifiers);
  uint64_t v27 = v4[14];
  swift_bridgeObjectRetain();
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)&a2[v27] = v26;
  *(void *)&a2[v4[15]] = *(void *)(v20 + OBJC_IVAR____TtC10GamePolicy14GameModeStatus_enablementStrategy);
  return result;
}

uint64_t sub_24F9383BC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for GameModeStatus.Config(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24F938420(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for GameModeStatus.Config(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t GameModeStatus.config.setter(uint64_t a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A34058);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24F938420(a1, (uint64_t)v5);
  uint64_t v6 = type metadata accessor for GameModeStatus.Config(0);
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 0, 1, v6);
  uint64_t v7 = v1 + OBJC_IVAR____TtC10GamePolicy14GameModeStatus____lazy_storage___config;
  swift_beginAccess();
  sub_24F9257E4((uint64_t)v5, v7, &qword_269A34058);
  return swift_endAccess();
}

void (*GameModeStatus.config.modify(void *a1))(uint64_t a1, char a2)
{
  uint64_t v3 = malloc(0x60uLL);
  *a1 = v3;
  v3[6] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A34058);
  v3[7] = malloc(*(void *)(*(void *)(v4 - 8) + 64));
  uint64_t v5 = type metadata accessor for GameModeStatus.Config(0);
  v3[8] = v5;
  uint64_t v6 = *(void *)(v5 - 8);
  v3[9] = v6;
  size_t v7 = *(void *)(v6 + 64);
  v3[10] = malloc(v7);
  uint64_t v8 = malloc(v7);
  v3[11] = v8;
  GameModeStatus.config.getter(v8);
  return sub_24F938674;
}

void sub_24F938674(uint64_t a1, char a2)
{
  uint64_t v2 = *(void **)a1;
  uint64_t v4 = *(void **)(*(void *)a1 + 80);
  uint64_t v3 = *(void **)(*(void *)a1 + 88);
  if (a2)
  {
    uint64_t v5 = v2[8];
    uint64_t v6 = v2[9];
    uint64_t v8 = v2[6];
    size_t v7 = (void *)v2[7];
    sub_24F9383BC(v2[11], v2[10]);
    sub_24F938420((uint64_t)v4, (uint64_t)v7);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v6 + 56))(v7, 0, 1, v5);
    uint64_t v9 = v8 + OBJC_IVAR____TtC10GamePolicy14GameModeStatus____lazy_storage___config;
    swift_beginAccess();
    sub_24F9257E4((uint64_t)v7, v9, &qword_269A34058);
    swift_endAccess();
    sub_24F937E5C((uint64_t)v3);
  }
  else
  {
    uint64_t v10 = v2[8];
    uint64_t v11 = v2[9];
    uint64_t v12 = v2[6];
    size_t v7 = (void *)v2[7];
    sub_24F938420(v2[11], (uint64_t)v7);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v7, 0, 1, v10);
    uint64_t v13 = v12 + OBJC_IVAR____TtC10GamePolicy14GameModeStatus____lazy_storage___config;
    swift_beginAccess();
    sub_24F9257E4((uint64_t)v7, v13, &qword_269A34058);
    swift_endAccess();
  }
  free(v3);
  free(v4);
  free(v7);
  free(v2);
}

uint64_t static GameModeStatus.supportsSecureCoding.getter()
{
  return 1;
}

Swift::Void __swiftcall GameModeStatus.encode(with:)(NSCoder with)
{
  uint64_t v2 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A33C50);
  uint64_t v5 = MEMORY[0x270FA5388](v4 - 8);
  size_t v7 = (char *)&v40 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v40 - v8;
  uint64_t v10 = sub_24F93C8F8();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v40 = (char *)&v40 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)&v40 - v14;
  uint64_t v16 = *(unsigned __int8 *)(v2 + OBJC_IVAR____TtC10GamePolicy14GameModeStatus_enabled);
  uint64_t v17 = (void *)sub_24F93C958();
  Class isa = with.super.isa;
  [(objc_class *)with.super.isa encodeBool:v16 forKey:v17];

  sub_24F925458(v2 + OBJC_IVAR____TtC10GamePolicy14GameModeStatus_enablementDate, (uint64_t)v9, &qword_269A33C50);
  uint64_t v18 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48);
  if (v18(v9, 1, v10) == 1)
  {
    sub_24F927D88((uint64_t)v9, &qword_269A33C50);
    Class v19 = isa;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v15, v9, v10);
    uint64_t v20 = (void *)sub_24F93C8E8();
    uint64_t v21 = (void *)sub_24F93C958();
    Class v19 = isa;
    [(objc_class *)isa encodeObject:v20 forKey:v21];

    (*(void (**)(char *, uint64_t))(v11 + 8))(v15, v10);
  }
  sub_24F925458(v2 + OBJC_IVAR____TtC10GamePolicy14GameModeStatus_disablementDate, (uint64_t)v7, &qword_269A33C50);
  if (v18(v7, 1, v10) == 1)
  {
    sub_24F927D88((uint64_t)v7, &qword_269A33C50);
    unint64_t v22 = 0x26533D000;
  }
  else
  {
    uint64_t v23 = v40;
    (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v40, v7, v10);
    uint64_t v24 = (void *)sub_24F93C8E8();
    uint64_t v25 = (void *)sub_24F93C958();
    unint64_t v22 = 0x26533D000uLL;
    [(objc_class *)v19 encodeObject:v24 forKey:v25];

    (*(void (**)(char *, uint64_t))(v11 + 8))(v23, v10);
  }
  uint64_t v26 = *(unsigned __int8 *)(v2 + OBJC_IVAR____TtC10GamePolicy14GameModeStatus_deviceSupported);
  uint64_t v27 = (void *)sub_24F93C958();
  [(objc_class *)v19 encodeBool:v26 forKey:v27];

  uint64_t v28 = *(unsigned __int8 *)(v2 + OBJC_IVAR____TtC10GamePolicy14GameModeStatus_jettisonCameraS2R);
  uint64_t v29 = (void *)sub_24F93C958();
  [(objc_class *)v19 encodeBool:v28 forKey:v29];

  sub_24F926108(*(void *)(v2 + OBJC_IVAR____TtC10GamePolicy14GameModeStatus_gameBundleIdentifiers));
  sub_24F927D4C(0, (unint64_t *)&qword_269A33C70);
  uint64_t v30 = (void *)sub_24F93CA58();
  swift_bridgeObjectRelease();
  int v31 = (void *)sub_24F93C958();
  objc_msgSend(v19, *(SEL *)(v22 + 2992), v30, v31);

  sub_24F926108(*(void *)(v2 + OBJC_IVAR____TtC10GamePolicy14GameModeStatus_previousGameBundleIdentifiers));
  uint64_t v32 = (void *)sub_24F93CA58();
  swift_bridgeObjectRelease();
  unsigned int v33 = (void *)sub_24F93C958();
  objc_msgSend(v19, *(SEL *)(v22 + 2992), v32, v33);

  sub_24F926108(*(void *)(v2 + OBJC_IVAR____TtC10GamePolicy14GameModeStatus_impactedBundleIdentifiers));
  uint64_t v34 = (void *)sub_24F93CA58();
  swift_bridgeObjectRelease();
  int v35 = (void *)sub_24F93C958();
  objc_msgSend(v19, *(SEL *)(v22 + 2992), v34, v35);

  sub_24F926108(*(void *)(v2 + OBJC_IVAR____TtC10GamePolicy14GameModeStatus_previouslyImpactedBundleIdentifiers));
  unsigned __int8 v36 = (void *)sub_24F93CA58();
  swift_bridgeObjectRelease();
  uint64_t v37 = (void *)sub_24F93C958();
  objc_msgSend(v19, *(SEL *)(v22 + 2992), v36, v37);

  uint64_t v38 = *(void *)(v2 + OBJC_IVAR____TtC10GamePolicy14GameModeStatus_enablementStrategy);
  uint64_t v39 = (void *)sub_24F93C958();
  [(objc_class *)v19 encodeInteger:v38 forKey:v39];
}

id GameModeStatus.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  id v4 = sub_24F93905C(a1);

  return v4;
}

id GameModeStatus.init(coder:)(void *a1)
{
  id v2 = sub_24F93905C(a1);

  return v2;
}

id GameModeStatus.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void GameModeStatus.init()()
{
}

id GameModeStatus.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for GameModeStatus(0);
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id sub_24F93905C(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A33C50);
  uint64_t v4 = MEMORY[0x270FA5388](v3 - 8);
  uint64_t v6 = (char *)&v62 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v62 - v7;
  uint64_t v9 = sub_24F93C8F8();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  *(void *)&long long v64 = (char *)&v62 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v62 - v13;
  uint64_t v15 = &v1[OBJC_IVAR____TtC10GamePolicy14GameModeStatus____lazy_storage___config];
  uint64_t v16 = type metadata accessor for GameModeStatus.Config(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v15, 1, 1, v16);
  uint64_t v17 = v1;
  uint64_t v18 = (void *)sub_24F93C958();
  unint64_t v19 = 0x26533D000uLL;
  unsigned __int8 v20 = objc_msgSend(a1, sel_decodeBoolForKey_, v18);

  v17[OBJC_IVAR____TtC10GamePolicy14GameModeStatus_enabled] = v20;
  uint64_t v21 = (void *)sub_24F93C958();
  unsigned __int8 v22 = objc_msgSend(a1, sel_containsValueForKey_, v21);

  if ((v22 & 1) == 0)
  {
    uint64_t v25 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56);
    v25(&v17[OBJC_IVAR____TtC10GamePolicy14GameModeStatus_enablementDate], 1, 1, v9);
    goto LABEL_8;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A340A0);
  uint64_t v23 = swift_allocObject();
  *(_OWORD *)(v23 + 16) = xmmword_24F93DBA0;
  *(void *)(v23 + 32) = sub_24F927D4C(0, (unint64_t *)&unk_269A33D20);
  sub_24F93CAC8();
  swift_bridgeObjectRelease();
  if (!v66)
  {
    sub_24F927D88((uint64_t)v65, (uint64_t *)&unk_269A340C0);
    uint64_t v25 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56);
    v25(v8, 1, 1, v9);
    goto LABEL_7;
  }
  v63 = v6;
  int v24 = swift_dynamicCast();
  uint64_t v25 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56);
  v25(v8, v24 ^ 1u, 1, v9);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) == 1)
  {
    uint64_t v6 = v63;
LABEL_7:
    sub_24F927D88((uint64_t)v8, &qword_269A33C50);
    v25(&v17[OBJC_IVAR____TtC10GamePolicy14GameModeStatus_enablementDate], 1, 1, v9);
    goto LABEL_8;
  }
  uint64_t v59 = *(void (**)(char *, char *, uint64_t))(v10 + 32);
  v59(v14, v8, v9);
  objc_super v60 = v59;
  v61 = &v17[OBJC_IVAR____TtC10GamePolicy14GameModeStatus_enablementDate];
  v60(&v17[OBJC_IVAR____TtC10GamePolicy14GameModeStatus_enablementDate], v14, v9);
  unint64_t v19 = 0x26533D000;
  v25(v61, 0, 1, v9);
  uint64_t v6 = v63;
LABEL_8:
  uint64_t v26 = (void *)sub_24F93C958();
  unsigned int v27 = objc_msgSend(a1, sel_containsValueForKey_, v26);

  if (v27)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_269A340A0);
    uint64_t v28 = swift_allocObject();
    *(_OWORD *)(v28 + 16) = xmmword_24F93DBA0;
    *(void *)(v28 + 32) = sub_24F927D4C(0, (unint64_t *)&unk_269A33D20);
    sub_24F93CAC8();
    swift_bridgeObjectRelease();
    if (v66)
    {
      int v29 = swift_dynamicCast();
      v25(v6, v29 ^ 1u, 1, v9);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v6, 1, v9) != 1)
      {
        uint64_t v30 = *(void (**)(char *, char *, uint64_t))(v10 + 32);
        int v31 = (char *)v64;
        v30((char *)v64, v6, v9);
        uint64_t v32 = &v17[OBJC_IVAR____TtC10GamePolicy14GameModeStatus_disablementDate];
        v30(&v17[OBJC_IVAR____TtC10GamePolicy14GameModeStatus_disablementDate], v31, v9);
        v25(v32, 0, 1, v9);
        goto LABEL_15;
      }
    }
    else
    {
      sub_24F927D88((uint64_t)v65, (uint64_t *)&unk_269A340C0);
      v25(v6, 1, 1, v9);
    }
    sub_24F927D88((uint64_t)v6, &qword_269A33C50);
  }
  v25(&v17[OBJC_IVAR____TtC10GamePolicy14GameModeStatus_disablementDate], 1, 1, v9);
LABEL_15:
  unsigned int v33 = (void *)sub_24F93C958();
  unsigned __int8 v34 = objc_msgSend(a1, *(SEL *)(v19 + 3008), v33);

  v17[OBJC_IVAR____TtC10GamePolicy14GameModeStatus_deviceSupported] = v34;
  int v35 = (void *)sub_24F93C958();
  unsigned int v36 = objc_msgSend(a1, sel_containsValueForKey_, v35);

  if (v36)
  {
    uint64_t v37 = (void *)sub_24F93C958();
    unsigned __int8 v38 = objc_msgSend(a1, *(SEL *)(v19 + 3008), v37);

    v17[OBJC_IVAR____TtC10GamePolicy14GameModeStatus_jettisonCameraS2R] = v38;
  }
  else
  {
    v17[OBJC_IVAR____TtC10GamePolicy14GameModeStatus_jettisonCameraS2R] = 0;
  }
  uint64_t v39 = sub_24F927D4C(0, (unint64_t *)&qword_269A33C70);
  uint64_t v40 = sub_24F93CAD8();
  if (v40
    && (v65[0] = v40,
        __swift_instantiateConcreteTypeFromMangledName(&qword_269A340A8),
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_269A340B0),
        swift_dynamicCast()))
  {
    uint64_t v41 = v67;
  }
  else
  {
    uint64_t v41 = MEMORY[0x263F8EE78];
  }
  *(void *)&v17[OBJC_IVAR____TtC10GamePolicy14GameModeStatus_gameBundleIdentifiers] = v41;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A340A0);
  uint64_t v42 = swift_allocObject();
  long long v64 = xmmword_24F93DBA0;
  *(_OWORD *)(v42 + 16) = xmmword_24F93DBA0;
  *(void *)(v42 + 32) = v39;
  uint64_t v43 = sub_24F93CAE8();
  swift_bridgeObjectRelease();
  uint64_t v44 = MEMORY[0x263F8EE78];
  if (v43)
  {
    uint64_t v45 = sub_24F92A890(v43);
    swift_bridgeObjectRelease();
    if (v45) {
      uint64_t v44 = v45;
    }
  }
  *(void *)&v17[OBJC_IVAR____TtC10GamePolicy14GameModeStatus_previousGameBundleIdentifiers] = v44;
  uint64_t v46 = swift_allocObject();
  *(_OWORD *)(v46 + 16) = v64;
  *(void *)(v46 + 32) = v39;
  uint64_t v47 = sub_24F93CAE8();
  swift_bridgeObjectRelease();
  uint64_t v48 = MEMORY[0x263F8EE78];
  if (v47)
  {
    uint64_t v49 = sub_24F92A890(v47);
    swift_bridgeObjectRelease();
    if (v49) {
      uint64_t v48 = v49;
    }
  }
  *(void *)&v17[OBJC_IVAR____TtC10GamePolicy14GameModeStatus_impactedBundleIdentifiers] = v48;
  uint64_t v50 = swift_allocObject();
  *(_OWORD *)(v50 + 16) = v64;
  *(void *)(v50 + 32) = v39;
  uint64_t v51 = sub_24F93CAE8();
  swift_bridgeObjectRelease();
  uint64_t v52 = MEMORY[0x263F8EE78];
  if (v51)
  {
    uint64_t v53 = sub_24F92A890(v51);
    swift_bridgeObjectRelease();
    if (v53) {
      uint64_t v52 = v53;
    }
  }
  *(void *)&v17[OBJC_IVAR____TtC10GamePolicy14GameModeStatus_previouslyImpactedBundleIdentifiers] = v52;
  id v54 = (void *)sub_24F93C958();
  id v55 = objc_msgSend(a1, sel_decodeIntegerForKey_, v54);

  uint64_t v56 = v55 == (id)1;
  if (v55 == (id)2) {
    uint64_t v56 = 2;
  }
  *(void *)&v17[OBJC_IVAR____TtC10GamePolicy14GameModeStatus_enablementStrategy] = v56;

  long long v57 = (objc_class *)type metadata accessor for GameModeStatus(0);
  v68.receiver = v17;
  v68.super_class = v57;
  return objc_msgSendSuper2(&v68, sel_init);
}

uint64_t sub_24F9399E4()
{
  return type metadata accessor for GameModeStatus(0);
}

void sub_24F9399EC()
{
  sub_24F939B20(319, &qword_269A33CF0, MEMORY[0x263F07490]);
  if (v0 <= 0x3F)
  {
    sub_24F939B20(319, (unint64_t *)&unk_269A34078, (void (*)(uint64_t))type metadata accessor for GameModeStatus.Config);
    if (v1 <= 0x3F) {
      swift_updateClassMetadata2();
    }
  }
}

void sub_24F939B20(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = sub_24F93CB18();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

void *initializeBufferWithCopyOfBuffer for GameModeStatus.Config(char *a1, char *a2, int *a3)
{
  unint64_t v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v14 = *(void *)a2;
    void *v4 = *(void *)a2;
    unint64_t v4 = (void *)(v14 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *a1 = *a2;
    uint64_t v7 = a3[5];
    uint64_t v8 = &a1[v7];
    uint64_t v9 = &a2[v7];
    uint64_t v10 = sub_24F93C8F8();
    uint64_t v11 = *(void *)(v10 - 8);
    uint64_t v12 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48);
    if (v12(v9, 1, v10))
    {
      uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A33C50);
      memcpy(v8, v9, *(void *)(*(void *)(v13 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v8, v9, v10);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
    }
    uint64_t v15 = a3[6];
    uint64_t v16 = (char *)v4 + v15;
    uint64_t v17 = &a2[v15];
    if (v12(&a2[v15], 1, v10))
    {
      uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A33C50);
      memcpy(v16, v17, *(void *)(*(void *)(v18 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v16, v17, v10);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v16, 0, 1, v10);
    }
    uint64_t v19 = a3[8];
    *((unsigned char *)v4 + a3[7]) = a2[a3[7]];
    *((unsigned char *)v4 + v19) = a2[v19];
    uint64_t v20 = a3[10];
    *(void *)((char *)v4 + a3[9]) = *(void *)&a2[a3[9]];
    *(void *)((char *)v4 + v20) = *(void *)&a2[v20];
    uint64_t v21 = a3[12];
    *(void *)((char *)v4 + a3[11]) = *(void *)&a2[a3[11]];
    *(void *)((char *)v4 + v21) = *(void *)&a2[v21];
    *(void *)((char *)v4 + a3[13]) = *(void *)&a2[a3[13]];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t destroy for GameModeStatus.Config(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  uint64_t v5 = sub_24F93C8F8();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48);
  if (!v7(v4, 1, v5)) {
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  }
  uint64_t v8 = a1 + *(int *)(a2 + 24);
  if (!v7(v8, 1, v5)) {
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v8, v5);
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

unsigned char *initializeWithCopy for GameModeStatus.Config(unsigned char *a1, unsigned char *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = &a1[v6];
  uint64_t v8 = &a2[v6];
  uint64_t v9 = sub_24F93C8F8();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v10 + 48);
  if (v11(v8, 1, v9))
  {
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A33C50);
    memcpy(v7, v8, *(void *)(*(void *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v10 + 16))(v7, v8, v9);
    (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  }
  uint64_t v13 = a3[6];
  uint64_t v14 = &a1[v13];
  uint64_t v15 = &a2[v13];
  if (v11(&a2[v13], 1, v9))
  {
    uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A33C50);
    memcpy(v14, v15, *(void *)(*(void *)(v16 - 8) + 64));
  }
  else
  {
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v10 + 16))(v14, v15, v9);
    (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v10 + 56))(v14, 0, 1, v9);
  }
  uint64_t v17 = a3[8];
  a1[a3[7]] = a2[a3[7]];
  a1[v17] = a2[v17];
  uint64_t v18 = a3[10];
  *(void *)&a1[a3[9]] = *(void *)&a2[a3[9]];
  *(void *)&a1[v18] = *(void *)&a2[v18];
  uint64_t v19 = a3[12];
  *(void *)&a1[a3[11]] = *(void *)&a2[a3[11]];
  *(void *)&a1[v19] = *(void *)&a2[v19];
  *(void *)&a1[a3[13]] = *(void *)&a2[a3[13]];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

unsigned char *assignWithCopy for GameModeStatus.Config(unsigned char *a1, unsigned char *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = &a1[v6];
  uint64_t v8 = &a2[v6];
  uint64_t v9 = sub_24F93C8F8();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(uint64_t (**)(unsigned char *, uint64_t, uint64_t))(v10 + 48);
  int v12 = v11(v7, 1, v9);
  int v13 = v11(v8, 1, v9);
  if (v12)
  {
    if (!v13)
    {
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v10 + 16))(v7, v8, v9);
      (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v13)
  {
    (*(void (**)(unsigned char *, uint64_t))(v10 + 8))(v7, v9);
LABEL_6:
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A33C50);
    memcpy(v7, v8, *(void *)(*(void *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v10 + 24))(v7, v8, v9);
LABEL_7:
  uint64_t v15 = a3[6];
  uint64_t v16 = &a1[v15];
  uint64_t v17 = &a2[v15];
  int v18 = v11(&a1[v15], 1, v9);
  int v19 = v11(v17, 1, v9);
  if (!v18)
  {
    if (!v19)
    {
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v10 + 24))(v16, v17, v9);
      goto LABEL_13;
    }
    (*(void (**)(unsigned char *, uint64_t))(v10 + 8))(v16, v9);
    goto LABEL_12;
  }
  if (v19)
  {
LABEL_12:
    uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A33C50);
    memcpy(v16, v17, *(void *)(*(void *)(v20 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v10 + 16))(v16, v17, v9);
  (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v10 + 56))(v16, 0, 1, v9);
LABEL_13:
  a1[a3[7]] = a2[a3[7]];
  a1[a3[8]] = a2[a3[8]];
  *(void *)&a1[a3[9]] = *(void *)&a2[a3[9]];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)&a1[a3[10]] = *(void *)&a2[a3[10]];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)&a1[a3[11]] = *(void *)&a2[a3[11]];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)&a1[a3[12]] = *(void *)&a2[a3[12]];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)&a1[a3[13]] = *(void *)&a2[a3[13]];
  return a1;
}

unsigned char *initializeWithTake for GameModeStatus.Config(unsigned char *a1, unsigned char *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = &a1[v6];
  uint64_t v8 = &a2[v6];
  uint64_t v9 = sub_24F93C8F8();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v10 + 48);
  if (v11(v8, 1, v9))
  {
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A33C50);
    memcpy(v7, v8, *(void *)(*(void *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v10 + 32))(v7, v8, v9);
    (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  }
  uint64_t v13 = a3[6];
  uint64_t v14 = &a1[v13];
  uint64_t v15 = &a2[v13];
  if (v11(&a2[v13], 1, v9))
  {
    uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A33C50);
    memcpy(v14, v15, *(void *)(*(void *)(v16 - 8) + 64));
  }
  else
  {
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v10 + 32))(v14, v15, v9);
    (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v10 + 56))(v14, 0, 1, v9);
  }
  uint64_t v17 = a3[8];
  a1[a3[7]] = a2[a3[7]];
  a1[v17] = a2[v17];
  uint64_t v18 = a3[10];
  *(void *)&a1[a3[9]] = *(void *)&a2[a3[9]];
  *(void *)&a1[v18] = *(void *)&a2[v18];
  uint64_t v19 = a3[12];
  *(void *)&a1[a3[11]] = *(void *)&a2[a3[11]];
  *(void *)&a1[v19] = *(void *)&a2[v19];
  *(void *)&a1[a3[13]] = *(void *)&a2[a3[13]];
  return a1;
}

unsigned char *assignWithTake for GameModeStatus.Config(unsigned char *a1, unsigned char *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = &a1[v6];
  uint64_t v8 = &a2[v6];
  uint64_t v9 = sub_24F93C8F8();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(uint64_t (**)(unsigned char *, uint64_t, uint64_t))(v10 + 48);
  int v12 = v11(v7, 1, v9);
  int v13 = v11(v8, 1, v9);
  if (v12)
  {
    if (!v13)
    {
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v10 + 32))(v7, v8, v9);
      (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v13)
  {
    (*(void (**)(unsigned char *, uint64_t))(v10 + 8))(v7, v9);
LABEL_6:
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A33C50);
    memcpy(v7, v8, *(void *)(*(void *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v10 + 40))(v7, v8, v9);
LABEL_7:
  uint64_t v15 = a3[6];
  uint64_t v16 = &a1[v15];
  uint64_t v17 = &a2[v15];
  int v18 = v11(&a1[v15], 1, v9);
  int v19 = v11(v17, 1, v9);
  if (!v18)
  {
    if (!v19)
    {
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v10 + 40))(v16, v17, v9);
      goto LABEL_13;
    }
    (*(void (**)(unsigned char *, uint64_t))(v10 + 8))(v16, v9);
    goto LABEL_12;
  }
  if (v19)
  {
LABEL_12:
    uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A33C50);
    memcpy(v16, v17, *(void *)(*(void *)(v20 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v10 + 32))(v16, v17, v9);
  (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v10 + 56))(v16, 0, 1, v9);
LABEL_13:
  uint64_t v21 = a3[8];
  a1[a3[7]] = a2[a3[7]];
  a1[v21] = a2[v21];
  *(void *)&a1[a3[9]] = *(void *)&a2[a3[9]];
  swift_bridgeObjectRelease();
  *(void *)&a1[a3[10]] = *(void *)&a2[a3[10]];
  swift_bridgeObjectRelease();
  *(void *)&a1[a3[11]] = *(void *)&a2[a3[11]];
  swift_bridgeObjectRelease();
  *(void *)&a1[a3[12]] = *(void *)&a2[a3[12]];
  swift_bridgeObjectRelease();
  *(void *)&a1[a3[13]] = *(void *)&a2[a3[13]];
  return a1;
}

uint64_t getEnumTagSinglePayload for GameModeStatus.Config(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24F93A994);
}

uint64_t sub_24F93A994(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A33C50);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1 + *(int *)(a3 + 20);
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v10(v9, a2, v8);
  }
  else
  {
    unint64_t v12 = *(void *)(a1 + *(int *)(a3 + 36));
    if (v12 >= 0xFFFFFFFF) {
      LODWORD(v12) = -1;
    }
    return (v12 + 1);
  }
}

uint64_t storeEnumTagSinglePayload for GameModeStatus.Config(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24F93AA70);
}

uint64_t sub_24F93AA70(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = __swift_instantiateConcreteTypeFromMangledName(&qword_269A33C50);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = result;
    uint64_t v11 = a1 + *(int *)(a4 + 20);
    unint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v12(v11, a2, a2, v10);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 36)) = (a2 - 1);
  }
  return result;
}

void sub_24F93AB34()
{
  sub_24F939B20(319, &qword_269A33CF0, MEMORY[0x263F07490]);
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

uint64_t sub_24F93AC10(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6)
{
  BOOL v7 = a2 != a5 || a6 >= a3;
  if (a5 < a2) {
    BOOL v7 = 0;
  }
  unsigned int v8 = a1 != a4 || v7;
  if (a4 >= a1) {
    return v8;
  }
  else {
    return 0;
  }
}

uint64_t sub_24F93AC3C(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6)
{
  BOOL v7 = a5 != a2 || a3 >= a6;
  if (a2 < a5) {
    BOOL v7 = 0;
  }
  unsigned int v8 = a4 != a1 || v7;
  if (a1 >= a4) {
    return v8;
  }
  else {
    return 0;
  }
}

uint64_t sub_24F93AC68(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6)
{
  BOOL v7 = a2 == a5 && a6 < a3;
  unsigned int v8 = a5 < a2 || v7;
  if (a1 != a4) {
    unsigned int v8 = 0;
  }
  if (a4 >= a1) {
    return v8;
  }
  else {
    return 1;
  }
}

Swift::Bool __swiftcall Version.isLessThanSourceVersion(sourceVersion:)(GamePolicy::Version sourceVersion)
{
  BOOL v5 = sourceVersion.minor == v2 && v3 < sourceVersion.patch;
  Swift::Bool v6 = v2 < sourceVersion.minor || v5;
  if (sourceVersion.major != v1) {
    Swift::Bool v6 = 0;
  }
  return v1 < sourceVersion.major || v6;
}

uint64_t Version.minor.getter(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t Version.patch.getter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a3;
}

uint64_t sub_24F93ACE0()
{
  uint64_t v0 = sub_24F93C8D8();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = MEMORY[0x270FA5388](v0);
  uint64_t v4 = (char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_allocate_value_buffer(v2, qword_269A340D0);
  __swift_project_value_buffer(v0, (uint64_t)qword_269A340D0);
  sub_24F93C8B8();
  sub_24F93C8C8();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v4, v0);
}

unint64_t sub_24F93ADE4()
{
  unint64_t result = currentSourceVersion();
  static Version.currentSourceVersion = result;
  unk_269A352F0 = HIDWORD(result);
  qword_269A352F8 = v1;
  return result;
}

uint64_t *Version.currentSourceVersion.unsafeMutableAddressor()
{
  if (qword_269A33C38 != -1) {
    swift_once();
  }
  return &static Version.currentSourceVersion;
}

uint64_t static Version.currentSourceVersion.getter()
{
  if (qword_269A33C38 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return static Version.currentSourceVersion;
}

uint64_t static Version.currentSourceVersion.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (qword_269A33C38 != -1) {
    swift_once();
  }
  uint64_t result = swift_beginAccess();
  static Version.currentSourceVersion = a1;
  unk_269A352F0 = a2;
  qword_269A352F8 = a3;
  return result;
}

uint64_t (*static Version.currentSourceVersion.modify())()
{
  if (qword_269A33C38 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j__swift_endAccess;
}

GamePolicy::Version_optional __swiftcall Version.init(versionString:)(Swift::String versionString)
{
  object = versionString._object;
  uint64_t countAndFlagsBits = versionString._countAndFlagsBits;
  uint64_t v3 = sub_24F93C8D8();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)v49 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_269A33C30 != -1) {
    swift_once();
  }
  uint64_t v7 = __swift_project_value_buffer(v3, (uint64_t)qword_269A340D0);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v7, v3);
  uint64_t v50 = countAndFlagsBits;
  uint64_t v51 = (uint64_t)object;
  sub_24F93C79C();
  uint64_t v8 = sub_24F93CB38();
  uint64_t v10 = v9;
  swift_bridgeObjectRelease();
  uint64_t v50 = v8;
  uint64_t v51 = v10;
  v49[2] = 46;
  v49[3] = 0xE100000000000000;
  uint64_t v11 = (void *)sub_24F93CB28();
  swift_bridgeObjectRelease();
  unint64_t v12 = v11[2];
  if (v12 - 4 <= 0xFFFFFFFFFFFFFFFCLL)
  {
    swift_bridgeObjectRelease();
LABEL_5:
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
LABEL_75:
    uint64_t v23 = 0;
    Swift::UInt v30 = 0;
    Swift::UInt v29 = 0;
    Swift::Bool v16 = 1;
    goto LABEL_76;
  }
  swift_bridgeObjectRetain();
  uint64_t v13 = sub_24F93C9B8();
  Swift::UInt v14 = swift_bridgeObjectRelease();
  if (v13 <= 0) {
    goto LABEL_74;
  }
  uint64_t v17 = v11[4];
  unint64_t v18 = v11[5];
  uint64_t v19 = HIBYTE(v18) & 0xF;
  uint64_t v20 = v17 & 0xFFFFFFFFFFFFLL;
  if (!((v18 & 0x2000000000000000) != 0 ? HIBYTE(v18) & 0xF : v17 & 0xFFFFFFFFFFFFLL)) {
    goto LABEL_74;
  }
  if ((v18 & 0x1000000000000000) == 0)
  {
    if ((v18 & 0x2000000000000000) == 0)
    {
      if ((v17 & 0x1000000000000000) != 0) {
        unsigned __int8 v22 = (unsigned __int8 *)((v18 & 0xFFFFFFFFFFFFFFFLL) + 32);
      }
      else {
        unsigned __int8 v22 = (unsigned __int8 *)sub_24F93CB68();
      }
      Swift::UInt v14 = (Swift::UInt)sub_24F93BF20(v22, v20, 10);
      if (v20) {
        goto LABEL_74;
      }
      uint64_t v23 = v14;
      goto LABEL_42;
    }
    uint64_t v50 = v11[4];
    uint64_t v51 = v18 & 0xFFFFFFFFFFFFFFLL;
    if (v17 == 43)
    {
      if (!v19) {
        goto LABEL_79;
      }
      if (v19 != 1 && (BYTE1(v17) - 48) <= 9u)
      {
        uint64_t v23 = (BYTE1(v17) - 48);
        if (v19 == 2) {
          goto LABEL_40;
        }
        if ((BYTE2(v17) - 48) <= 9u)
        {
          uint64_t v23 = 10 * (BYTE1(v17) - 48) + (BYTE2(v17) - 48);
          uint64_t v25 = v19 - 3;
          if (v25)
          {
            uint64_t v26 = (unsigned __int8 *)&v50 + 3;
            while (1)
            {
              unsigned int v27 = *v26 - 48;
              if (v27 > 9) {
                goto LABEL_38;
              }
              uint64_t v28 = 10 * v23;
              if ((unsigned __int128)(v23 * (__int128)10) >> 64 != (10 * v23) >> 63) {
                goto LABEL_38;
              }
              uint64_t v23 = v28 + v27;
              if (__OFADD__(v28, v27)) {
                goto LABEL_38;
              }
              char v24 = 0;
              ++v26;
              if (!--v25) {
                goto LABEL_41;
              }
            }
          }
          goto LABEL_40;
        }
      }
    }
    else
    {
      if (v17 == 45)
      {
        if (v19)
        {
          if (v19 == 1 || (BYTE1(v17) - 48) > 9u) {
            goto LABEL_38;
          }
          if (v19 == 2)
          {
            char v24 = 0;
            uint64_t v23 = -(uint64_t)(BYTE1(v17) - 48);
            goto LABEL_41;
          }
          if ((BYTE2(v17) - 48) > 9u) {
            goto LABEL_38;
          }
          uint64_t v23 = -10 * (BYTE1(v17) - 48) - (BYTE2(v17) - 48);
          uint64_t v38 = v19 - 3;
          if (v38)
          {
            uint64_t v39 = (unsigned __int8 *)&v50 + 3;
            while (1)
            {
              unsigned int v40 = *v39 - 48;
              if (v40 > 9) {
                goto LABEL_38;
              }
              uint64_t v41 = 10 * v23;
              if ((unsigned __int128)(v23 * (__int128)10) >> 64 != (10 * v23) >> 63) {
                goto LABEL_38;
              }
              uint64_t v23 = v41 - v40;
              if (__OFSUB__(v41, v40)) {
                goto LABEL_38;
              }
              char v24 = 0;
              ++v39;
              if (!--v38) {
                goto LABEL_41;
              }
            }
          }
LABEL_40:
          char v24 = 0;
LABEL_41:
          if ((v24 & 1) == 0) {
            goto LABEL_42;
          }
LABEL_74:
          (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
          swift_bridgeObjectRelease();
          goto LABEL_75;
        }
        __break(1u);
LABEL_79:
        __break(1u);
LABEL_80:
        __break(1u);
        goto LABEL_81;
      }
      if (v19 && (v17 - 48) <= 9u)
      {
        uint64_t v23 = (v17 - 48);
        if (v19 == 1) {
          goto LABEL_40;
        }
        if ((BYTE1(v17) - 48) <= 9u)
        {
          uint64_t v23 = 10 * (v17 - 48) + (BYTE1(v17) - 48);
          uint64_t v34 = v19 - 2;
          if (v34)
          {
            int v35 = (unsigned __int8 *)&v50 + 2;
            while (1)
            {
              unsigned int v36 = *v35 - 48;
              if (v36 > 9) {
                goto LABEL_38;
              }
              uint64_t v37 = 10 * v23;
              if ((unsigned __int128)(v23 * (__int128)10) >> 64 != (10 * v23) >> 63) {
                goto LABEL_38;
              }
              uint64_t v23 = v37 + v36;
              if (__OFADD__(v37, v36)) {
                goto LABEL_38;
              }
              char v24 = 0;
              ++v35;
              if (!--v34) {
                goto LABEL_41;
              }
            }
          }
          goto LABEL_40;
        }
      }
    }
LABEL_38:
    uint64_t v23 = 0;
    char v24 = 1;
    goto LABEL_41;
  }
  swift_bridgeObjectRetain();
  uint64_t v23 = (uint64_t)sub_24F93BE38(v17, v18, 10);
  char v48 = v47;
  Swift::UInt v14 = swift_bridgeObjectRelease();
  if (v48) {
    goto LABEL_74;
  }
LABEL_42:
  if (v23 <= 0) {
    goto LABEL_74;
  }
  if (v12 < 2)
  {
    swift_bridgeObjectRelease();
    Swift::UInt v29 = 0;
    Swift::UInt v30 = 0;
    goto LABEL_45;
  }
  if (v11[2] < 2uLL) {
    goto LABEL_80;
  }
  swift_bridgeObjectRetain();
  uint64_t v31 = sub_24F93C9B8();
  swift_bridgeObjectRelease();
  if (v31 <= 0) {
    goto LABEL_74;
  }
  uint64_t v32 = v11[6];
  unint64_t v33 = v11[7];
  swift_bridgeObjectRetain();
  Swift::UInt v14 = sub_24F93B5DC(v32, v33);
  if (v20) {
    goto LABEL_74;
  }
  Swift::UInt v30 = v14;
  if ((v14 & 0x8000000000000000) != 0) {
    goto LABEL_74;
  }
  if (v12 <= 2)
  {
    swift_bridgeObjectRelease();
    Swift::UInt v29 = 0;
    goto LABEL_45;
  }
  if (v11[2] < 3uLL)
  {
LABEL_81:
    __break(1u);
    goto LABEL_82;
  }
  swift_bridgeObjectRetain();
  uint64_t v42 = sub_24F93C9B8();
  swift_bridgeObjectRelease();
  if (v42 <= 0) {
    goto LABEL_74;
  }
  uint64_t v43 = v11[8];
  unint64_t v44 = v11[9];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v45 = sub_24F93B5DC(v43, v44);
  if (v46) {
    goto LABEL_5;
  }
  Swift::UInt v29 = v45;
  if (v45 < 0) {
    goto LABEL_5;
  }
LABEL_45:
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  Swift::Bool v16 = 0;
LABEL_76:
  Swift::UInt v14 = v23;
  uint64_t v20 = v30;
  Swift::UInt v15 = v29;
LABEL_82:
  result.value.patch = v15;
  result.value.minor = v20;
  result.value.major = v14;
  result.is_nil = v16;
  return result;
}

uint64_t sub_24F93B5DC(uint64_t result, unint64_t a2)
{
  uint64_t v3 = HIBYTE(a2) & 0xF;
  uint64_t v4 = result & 0xFFFFFFFFFFFFLL;
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v5 = v3;
  }
  else {
    uint64_t v5 = result & 0xFFFFFFFFFFFFLL;
  }
  if (!v5)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  if ((a2 & 0x1000000000000000) == 0)
  {
    if ((a2 & 0x2000000000000000) == 0)
    {
      if ((result & 0x1000000000000000) != 0) {
        uint64_t v6 = (unsigned __int8 *)((a2 & 0xFFFFFFFFFFFFFFFLL) + 32);
      }
      else {
        uint64_t v6 = (unsigned __int8 *)sub_24F93CB68();
      }
      uint64_t v7 = (uint64_t)sub_24F93BF20(v6, v4, 10);
      char v9 = v8 & 1;
      goto LABEL_37;
    }
    v23[0] = result;
    v23[1] = a2 & 0xFFFFFFFFFFFFFFLL;
    if (result == 43)
    {
      if (!v3) {
        goto LABEL_50;
      }
      if (v3 == 1 || (BYTE1(result) - 48) > 9u) {
        goto LABEL_34;
      }
      uint64_t v7 = (BYTE1(result) - 48);
      uint64_t v14 = v3 - 2;
      if (v14)
      {
        Swift::UInt v15 = (unsigned __int8 *)v23 + 2;
        while (1)
        {
          unsigned int v16 = *v15 - 48;
          if (v16 > 9) {
            goto LABEL_34;
          }
          uint64_t v17 = 10 * v7;
          if ((unsigned __int128)(v7 * (__int128)10) >> 64 != (10 * v7) >> 63) {
            goto LABEL_34;
          }
          uint64_t v7 = v17 + v16;
          if (__OFADD__(v17, v16)) {
            goto LABEL_34;
          }
          char v9 = 0;
          ++v15;
          if (!--v14) {
            goto LABEL_37;
          }
        }
      }
    }
    else
    {
      if (result == 45)
      {
        if (v3)
        {
          if (v3 != 1 && (BYTE1(result) - 48) <= 9u)
          {
            uint64_t v7 = -(uint64_t)(BYTE1(result) - 48);
            uint64_t v10 = v3 - 2;
            if (v10)
            {
              uint64_t v11 = (unsigned __int8 *)v23 + 2;
              while (1)
              {
                unsigned int v12 = *v11 - 48;
                if (v12 > 9) {
                  goto LABEL_34;
                }
                uint64_t v13 = 10 * v7;
                if ((unsigned __int128)(v7 * (__int128)10) >> 64 != (10 * v7) >> 63) {
                  goto LABEL_34;
                }
                uint64_t v7 = v13 - v12;
                if (__OFSUB__(v13, v12)) {
                  goto LABEL_34;
                }
                char v9 = 0;
                ++v11;
                if (!--v10) {
                  goto LABEL_37;
                }
              }
            }
            goto LABEL_36;
          }
LABEL_34:
          uint64_t v7 = 0;
          char v9 = 1;
          goto LABEL_37;
        }
        __break(1u);
LABEL_50:
        __break(1u);
        return result;
      }
      if (!v3 || (result - 48) > 9u) {
        goto LABEL_34;
      }
      uint64_t v7 = (result - 48);
      uint64_t v18 = v3 - 1;
      if (v18)
      {
        uint64_t v19 = (unsigned __int8 *)v23 + 1;
        while (1)
        {
          unsigned int v20 = *v19 - 48;
          if (v20 > 9) {
            goto LABEL_34;
          }
          uint64_t v21 = 10 * v7;
          if ((unsigned __int128)(v7 * (__int128)10) >> 64 != (10 * v7) >> 63) {
            goto LABEL_34;
          }
          uint64_t v7 = v21 + v20;
          if (__OFADD__(v21, v20)) {
            goto LABEL_34;
          }
          char v9 = 0;
          ++v19;
          if (!--v18) {
            goto LABEL_37;
          }
        }
      }
    }
LABEL_36:
    char v9 = 0;
    goto LABEL_37;
  }
  uint64_t v7 = (uint64_t)sub_24F93BE38(result, a2, 10);
  char v9 = v22;
LABEL_37:
  swift_bridgeObjectRelease();
  if (v9) {
    return 0;
  }
  else {
    return v7;
  }
}

Swift::Bool __swiftcall Version.isEqualToSourceVersion(sourceVersion:)(GamePolicy::Version sourceVersion)
{
  return v1 == sourceVersion.major && v2 == sourceVersion.minor && v3 == sourceVersion.patch;
}

BOOL static Version.__derived_struct_equals(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return a1 == a4 && a2 == a5 && a3 == a6;
}

Swift::Bool __swiftcall Version.isGreaterThanSourceVersion(sourceVersion:)(GamePolicy::Version sourceVersion)
{
  BOOL v5 = v2 == sourceVersion.minor && sourceVersion.patch < v3;
  Swift::Bool v6 = sourceVersion.minor < v2 || v5;
  if (v1 != sourceVersion.major) {
    Swift::Bool v6 = 0;
  }
  return sourceVersion.major < v1 || v6;
}

Swift::Bool __swiftcall Version.isGreaterThanOrEqualToSourceVersion(sourceVersion:)(GamePolicy::Version sourceVersion)
{
  BOOL v5 = v2 == sourceVersion.minor && v3 >= sourceVersion.patch;
  Swift::Bool v6 = sourceVersion.minor < v2 || v5;
  if (v1 != sourceVersion.major) {
    Swift::Bool v6 = 0;
  }
  return sourceVersion.major < v1 || v6;
}

Swift::Bool __swiftcall Version.isLessThanOrEqualToSourceVersion(sourceVersion:)(GamePolicy::Version sourceVersion)
{
  BOOL v5 = sourceVersion.minor == v2 && sourceVersion.patch >= v3;
  Swift::Bool v6 = v2 < sourceVersion.minor || v5;
  if (sourceVersion.major != v1) {
    Swift::Bool v6 = 0;
  }
  return v1 < sourceVersion.major || v6;
}

NSComparisonResult __swiftcall Version.compare(sourceVersion:)(GamePolicy::Version sourceVersion)
{
  if (v1 < sourceVersion.major)
  {
    sourceVersion.major = -1;
    return sourceVersion.major;
  }
  if (sourceVersion.major != v1)
  {
    if (sourceVersion.major < v1)
    {
      sourceVersion.major = 1;
      return sourceVersion.major;
    }
    goto LABEL_15;
  }
  if (v2 < sourceVersion.minor)
  {
    sourceVersion.major = -1;
    return sourceVersion.major;
  }
  if (sourceVersion.minor == v2 && v3 < sourceVersion.patch)
  {
    sourceVersion.major = -1;
    return sourceVersion.major;
  }
  BOOL v4 = sourceVersion.minor == v2;
  if (sourceVersion.patch >= v3) {
    BOOL v4 = 0;
  }
  sourceVersion.major = 1;
  if (sourceVersion.minor >= v2 && !v4) {
LABEL_15:
  }
    sourceVersion.major = 0;
  return sourceVersion.major;
}

uint64_t Version.description.getter()
{
  uint64_t v1 = sub_24F93CBF8();
  sub_24F93C9C8();
  sub_24F93CBF8();
  sub_24F93C9C8();
  swift_bridgeObjectRelease();
  sub_24F93C9C8();
  sub_24F93CBF8();
  sub_24F93C9C8();
  swift_bridgeObjectRelease();
  return v1;
}

uint64_t Version.debugDescription.getter()
{
  return 60;
}

uint64_t Version.hash(into:)()
{
  return sub_24F93CC28();
}

uint64_t Version.hashValue.getter()
{
  return sub_24F93CC38();
}

uint64_t sub_24F93BBA8()
{
  return sub_24F93CC38();
}

uint64_t sub_24F93BC14()
{
  return sub_24F93CC28();
}

uint64_t sub_24F93BC5C()
{
  return sub_24F93CC38();
}

uint64_t sub_24F93BCC4(void *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return sub_24F93BD24(a1, a2, a3, a4, _s10GamePolicy7VersionV1loiySbAC_ACtFZ_0);
}

uint64_t sub_24F93BCDC(void *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return sub_24F93BD24(a1, a2, a3, a4, sub_24F93AC10);
}

uint64_t sub_24F93BCF4(void *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return sub_24F93BD24(a1, a2, a3, a4, sub_24F93AC3C);
}

uint64_t sub_24F93BD0C(void *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return sub_24F93BD24(a1, a2, a3, a4, sub_24F93AC68);
}

uint64_t sub_24F93BD24(void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(void, void, void, void, void, void))
{
  return a5(*a1, a1[1], a1[2], *a2, a2[1], a2[2]);
}

uint64_t sub_24F93BD48()
{
  return Version.description.getter();
}

uint64_t sub_24F93BD54()
{
  return 60;
}

BOOL sub_24F93BE08(void *a1, void *a2)
{
  return *a1 == *a2 && a1[1] == a2[1] && a1[2] == a2[2];
}

unsigned __int8 *sub_24F93BE38(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v13 = a1;
  uint64_t v14 = a2;
  swift_bridgeObjectRetain();
  uint64_t v5 = sub_24F93CA38();
  unint64_t v6 = v4;
  if ((v4 & 0x1000000000000000) == 0)
  {
    if ((v4 & 0x2000000000000000) == 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v8 = HIBYTE(v6) & 0xF;
    uint64_t v13 = v5;
    uint64_t v14 = v6 & 0xFFFFFFFFFFFFFFLL;
    uint64_t v7 = (unsigned __int8 *)&v13;
    goto LABEL_7;
  }
  uint64_t v5 = sub_24F93C19C();
  unint64_t v10 = v9;
  swift_bridgeObjectRelease();
  unint64_t v6 = v10;
  if ((v10 & 0x2000000000000000) != 0) {
    goto LABEL_6;
  }
LABEL_3:
  if ((v5 & 0x1000000000000000) != 0)
  {
    uint64_t v7 = (unsigned __int8 *)((v6 & 0xFFFFFFFFFFFFFFFLL) + 32);
    uint64_t v8 = v5 & 0xFFFFFFFFFFFFLL;
  }
  else
  {
    uint64_t v7 = (unsigned __int8 *)sub_24F93CB68();
  }
LABEL_7:
  uint64_t v11 = sub_24F93BF20(v7, v8, a3);
  swift_bridgeObjectRelease();
  return v11;
}

unsigned __int8 *sub_24F93BF20(unsigned __int8 *result, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = a2;
  int v4 = *result;
  if (v4 != 43)
  {
    if (v4 == 45)
    {
      if (a2 >= 1)
      {
        uint64_t v5 = a2 - 1;
        if (a2 != 1)
        {
          unsigned __int8 v6 = a3 + 48;
          unsigned __int8 v7 = a3 + 55;
          unsigned __int8 v8 = a3 + 87;
          if (a3 > 10)
          {
            unsigned __int8 v6 = 58;
          }
          else
          {
            unsigned __int8 v8 = 97;
            unsigned __int8 v7 = 65;
          }
          if (result)
          {
            uint64_t v9 = 0;
            for (uint64_t i = result + 1; ; ++i)
            {
              unsigned int v11 = *i;
              if (v11 < 0x30 || v11 >= v6)
              {
                if (v11 < 0x41 || v11 >= v7)
                {
                  if (v11 < 0x61 || v11 >= v8) {
                    return 0;
                  }
                  char v12 = -87;
                }
                else
                {
                  char v12 = -55;
                }
              }
              else
              {
                char v12 = -48;
              }
              uint64_t v13 = v9 * a3;
              if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63) {
                return 0;
              }
              uint64_t v9 = v13 - (v11 + v12);
              if (__OFSUB__(v13, (v11 + v12))) {
                return 0;
              }
              if (!--v5) {
                return (unsigned __int8 *)v9;
              }
            }
          }
          return 0;
        }
        return 0;
      }
      __break(1u);
      goto LABEL_65;
    }
    if (a2)
    {
      unsigned __int8 v22 = a3 + 48;
      unsigned __int8 v23 = a3 + 55;
      unsigned __int8 v24 = a3 + 87;
      if (a3 > 10)
      {
        unsigned __int8 v22 = 58;
      }
      else
      {
        unsigned __int8 v24 = 97;
        unsigned __int8 v23 = 65;
      }
      if (result)
      {
        uint64_t v25 = 0;
        do
        {
          unsigned int v26 = *result;
          if (v26 < 0x30 || v26 >= v22)
          {
            if (v26 < 0x41 || v26 >= v23)
            {
              if (v26 < 0x61 || v26 >= v24) {
                return 0;
              }
              char v27 = -87;
            }
            else
            {
              char v27 = -55;
            }
          }
          else
          {
            char v27 = -48;
          }
          uint64_t v28 = v25 * a3;
          if ((unsigned __int128)(v25 * (__int128)a3) >> 64 != (v25 * a3) >> 63) {
            return 0;
          }
          uint64_t v25 = v28 + (v26 + v27);
          if (__OFADD__(v28, (v26 + v27))) {
            return 0;
          }
          ++result;
          --v3;
        }
        while (v3);
        return (unsigned __int8 *)(v28 + (v26 + v27));
      }
      return 0;
    }
    return 0;
  }
  if (a2 < 1)
  {
LABEL_65:
    __break(1u);
    return result;
  }
  uint64_t v14 = a2 - 1;
  if (a2 == 1) {
    return 0;
  }
  unsigned __int8 v15 = a3 + 48;
  unsigned __int8 v16 = a3 + 55;
  unsigned __int8 v17 = a3 + 87;
  if (a3 > 10)
  {
    unsigned __int8 v15 = 58;
  }
  else
  {
    unsigned __int8 v17 = 97;
    unsigned __int8 v16 = 65;
  }
  if (!result) {
    return 0;
  }
  uint64_t v9 = 0;
  uint64_t v18 = result + 1;
  do
  {
    unsigned int v19 = *v18;
    if (v19 < 0x30 || v19 >= v15)
    {
      if (v19 < 0x41 || v19 >= v16)
      {
        if (v19 < 0x61 || v19 >= v17) {
          return 0;
        }
        char v20 = -87;
      }
      else
      {
        char v20 = -55;
      }
    }
    else
    {
      char v20 = -48;
    }
    uint64_t v21 = v9 * a3;
    if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63) {
      return 0;
    }
    uint64_t v9 = v21 + (v19 + v20);
    if (__OFADD__(v21, (v19 + v20))) {
      return 0;
    }
    ++v18;
    --v14;
  }
  while (v14);
  return (unsigned __int8 *)v9;
}

uint64_t sub_24F93C19C()
{
  unint64_t v0 = sub_24F93CA48();
  uint64_t v4 = sub_24F93C21C(v0, v1, v2, v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_24F93C21C(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  if ((a4 & 0x1000000000000000) != 0)
  {
    uint64_t v9 = sub_24F93C374(a1, a2, a3, a4);
    if (v9)
    {
      uint64_t v10 = v9;
      unsigned int v11 = sub_24F93C474(v9, 0);
      unint64_t v12 = sub_24F93C4DC((unint64_t)v14, (uint64_t)(v11 + 4), v10, a1, a2, a3, a4);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      if (v12 != v10)
      {
        __break(1u);
LABEL_11:
        sub_24F93CB68();
LABEL_4:
        JUMPOUT(0x253365FB0);
      }
    }
    else
    {
      unsigned int v11 = (void *)MEMORY[0x263F8EE78];
    }
    uint64_t v13 = MEMORY[0x253365FB0](v11 + 4, v11[2]);
    swift_release();
    return v13;
  }
  else
  {
    if ((a4 & 0x2000000000000000) == 0)
    {
      if ((a3 & 0x1000000000000000) != 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
    v14[0] = a3;
    v14[1] = a4 & 0xFFFFFFFFFFFFFFLL;
    return MEMORY[0x253365FB0]((char *)v14 + (a1 >> 16), (a2 >> 16) - (a1 >> 16));
  }
}

uint64_t sub_24F93C374(unint64_t a1, unint64_t a2, unint64_t a3, uint64_t a4)
{
  unint64_t v4 = a4;
  uint64_t v5 = a3;
  unint64_t v6 = a2;
  unint64_t v7 = a1;
  uint64_t v8 = (a3 >> 59) & 1;
  if ((a4 & 0x1000000000000000) == 0) {
    LOBYTE(v8) = 1;
  }
  uint64_t v9 = 4 << v8;
  if ((a1 & 0xC) == 4 << v8)
  {
    a1 = sub_24F93C6F0(a1, a3, a4);
    unint64_t v7 = a1;
  }
  if ((v6 & 0xC) == v9)
  {
    a1 = sub_24F93C6F0(v6, v5, v4);
    unint64_t v6 = a1;
    if ((v4 & 0x1000000000000000) == 0) {
      return (v6 >> 16) - (v7 >> 16);
    }
  }
  else if ((v4 & 0x1000000000000000) == 0)
  {
    return (v6 >> 16) - (v7 >> 16);
  }
  unint64_t v11 = HIBYTE(v4) & 0xF;
  if ((v4 & 0x2000000000000000) == 0) {
    unint64_t v11 = v5 & 0xFFFFFFFFFFFFLL;
  }
  if (v11 < v7 >> 16)
  {
    __break(1u);
  }
  else if (v11 >= v6 >> 16)
  {
    a1 = v7;
    a2 = v6;
    a3 = v5;
    a4 = v4;
    return MEMORY[0x270F9D808](a1, a2, a3, a4);
  }
  __break(1u);
  return MEMORY[0x270F9D808](a1, a2, a3, a4);
}

void *sub_24F93C474(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return (void *)MEMORY[0x263F8EE78];
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_269A34100);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  _OWORD v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

unint64_t sub_24F93C4DC(unint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, unint64_t a7)
{
  uint64_t v9 = (void *)result;
  if (!a2) {
    goto LABEL_5;
  }
  if (!a3)
  {
    unint64_t v12 = a4;
    uint64_t v11 = 0;
    goto LABEL_33;
  }
  if (a3 < 0) {
    goto LABEL_36;
  }
  unint64_t v10 = a5 >> 14;
  unint64_t v27 = a4 >> 14;
  if (a4 >> 14 == a5 >> 14)
  {
LABEL_5:
    uint64_t v11 = 0;
    unint64_t v12 = a4;
LABEL_33:
    *uint64_t v9 = a4;
    v9[1] = a5;
    v9[2] = a6;
    v9[3] = a7;
    v9[4] = v12;
    return v11;
  }
  uint64_t v11 = 0;
  uint64_t v14 = (a6 >> 59) & 1;
  if ((a7 & 0x1000000000000000) == 0) {
    LOBYTE(v14) = 1;
  }
  uint64_t v15 = 4 << v14;
  uint64_t v21 = (a7 & 0xFFFFFFFFFFFFFFFLL) + 32;
  uint64_t v22 = a7 & 0xFFFFFFFFFFFFFFLL;
  uint64_t v16 = HIBYTE(a7) & 0xF;
  if ((a7 & 0x2000000000000000) == 0) {
    uint64_t v16 = a6 & 0xFFFFFFFFFFFFLL;
  }
  unint64_t v23 = v16;
  uint64_t v26 = a3 - 1;
  unint64_t v12 = a4;
  while (1)
  {
    unint64_t v17 = v12 & 0xC;
    GamePolicy::Version_optional result = v12;
    if (v17 == v15) {
      GamePolicy::Version_optional result = sub_24F93C6F0(v12, a6, a7);
    }
    if (result >> 14 < v27 || result >> 14 >= v10) {
      break;
    }
    if ((a7 & 0x1000000000000000) != 0)
    {
      GamePolicy::Version_optional result = sub_24F93CA08();
      char v19 = result;
      if (v17 != v15) {
        goto LABEL_23;
      }
    }
    else
    {
      unint64_t v18 = result >> 16;
      if ((a7 & 0x2000000000000000) != 0)
      {
        v28[0] = a6;
        v28[1] = v22;
        char v19 = *((unsigned char *)v28 + v18);
        if (v17 != v15) {
          goto LABEL_23;
        }
      }
      else
      {
        GamePolicy::Version_optional result = v21;
        if ((a6 & 0x1000000000000000) == 0) {
          GamePolicy::Version_optional result = sub_24F93CB68();
        }
        char v19 = *(unsigned char *)(result + v18);
        if (v17 != v15)
        {
LABEL_23:
          if ((a7 & 0x1000000000000000) == 0) {
            goto LABEL_24;
          }
          goto LABEL_27;
        }
      }
    }
    GamePolicy::Version_optional result = sub_24F93C6F0(v12, a6, a7);
    unint64_t v12 = result;
    if ((a7 & 0x1000000000000000) == 0)
    {
LABEL_24:
      unint64_t v12 = (v12 & 0xFFFFFFFFFFFF0000) + 65540;
      goto LABEL_29;
    }
LABEL_27:
    if (v23 <= v12 >> 16) {
      goto LABEL_35;
    }
    unint64_t v12 = sub_24F93C9D8();
LABEL_29:
    *(unsigned char *)(a2 + v11) = v19;
    if (v26 == v11)
    {
      uint64_t v11 = a3;
      goto LABEL_33;
    }
    ++v11;
    if (v10 == v12 >> 14) {
      goto LABEL_33;
    }
  }
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
  return result;
}

uint64_t sub_24F93C6F0(unint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3 = a1;
  uint64_t v4 = (unsigned __int16)a1 >> 14;
  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    uint64_t v10 = sub_24F93CA18();
    uint64_t v11 = v10 + (v4 << 16);
    unint64_t v12 = v10 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    unint64_t v13 = v11 & 0xFFFFFFFFFFFF0000;
    if (!v4) {
      unint64_t v13 = v12;
    }
    return v13 | 4;
  }
  else
  {
    uint64_t v5 = MEMORY[0x253366000](15, a1 >> 16);
    uint64_t v6 = v5 + (v4 << 16);
    unint64_t v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    unint64_t v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4) {
      unint64_t v8 = v7;
    }
    return v8 | 8;
  }
}

uint64_t _s10GamePolicy7VersionV1loiySbAC_ACtFZ_0(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6)
{
  BOOL v7 = a5 == a2 && a3 < a6;
  unsigned int v8 = a2 < a5 || v7;
  if (a4 != a1) {
    unsigned int v8 = 0;
  }
  if (a1 >= a4) {
    return v8;
  }
  else {
    return 1;
  }
}

unint64_t sub_24F93C79C()
{
  unint64_t result = qword_269A340E8;
  if (!qword_269A340E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A340E8);
  }
  return result;
}

unint64_t sub_24F93C7F4()
{
  unint64_t result = qword_269A340F8;
  if (!qword_269A340F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A340F8);
  }
  return result;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for Version(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 24)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for Version(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)__n128 result = (a2 - 1);
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 24) = v3;
  return result;
}

ValueMetadata *type metadata accessor for Version()
{
  return &type metadata for Version;
}

uint64_t sub_24F93C8B8()
{
  return MEMORY[0x270EEE0C0]();
}

uint64_t sub_24F93C8C8()
{
  return MEMORY[0x270EEE208]();
}

uint64_t sub_24F93C8D8()
{
  return MEMORY[0x270EEE258]();
}

uint64_t sub_24F93C8E8()
{
  return MEMORY[0x270EF0998]();
}

uint64_t sub_24F93C8F8()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_24F93C908()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_24F93C918()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_24F93C928()
{
  return MEMORY[0x270F9D4A0]();
}

uint64_t sub_24F93C938()
{
  return MEMORY[0x270F9D4A8]();
}

uint64_t sub_24F93C948()
{
  return MEMORY[0x270F9D4B0]();
}

uint64_t sub_24F93C958()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_24F93C968()
{
  return MEMORY[0x270EF19E0]();
}

uint64_t sub_24F93C978()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_24F93C988()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_24F93C998()
{
  return MEMORY[0x270F9D6B8]();
}

uint64_t sub_24F93C9A8()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_24F93C9B8()
{
  return MEMORY[0x270F9D740]();
}

uint64_t sub_24F93C9C8()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_24F93C9D8()
{
  return MEMORY[0x270F9D7E8]();
}

uint64_t sub_24F93C9E8()
{
  return MEMORY[0x270F9D800]();
}

uint64_t sub_24F93CA08()
{
  return MEMORY[0x270F9D810]();
}

uint64_t sub_24F93CA18()
{
  return MEMORY[0x270F9D860]();
}

uint64_t sub_24F93CA28()
{
  return MEMORY[0x270F9D888]();
}

uint64_t sub_24F93CA38()
{
  return MEMORY[0x270F9D8E0]();
}

uint64_t sub_24F93CA48()
{
  return MEMORY[0x270F9D8F0]();
}

uint64_t sub_24F93CA58()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_24F93CA68()
{
  return MEMORY[0x270EF1BA8]();
}

uint64_t sub_24F93CA78()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t sub_24F93CA88()
{
  return MEMORY[0x270EF1C98]();
}

uint64_t sub_24F93CA98()
{
  return MEMORY[0x270EF1CA8]();
}

uint64_t sub_24F93CAA8()
{
  return MEMORY[0x270EF2068]();
}

uint64_t sub_24F93CAB8()
{
  return MEMORY[0x270EF20F8]();
}

uint64_t sub_24F93CAC8()
{
  return MEMORY[0x270EF2100]();
}

uint64_t sub_24F93CAD8()
{
  return MEMORY[0x270EF2128]();
}

uint64_t sub_24F93CAE8()
{
  return MEMORY[0x270EF2130]();
}

uint64_t sub_24F93CAF8()
{
  return MEMORY[0x270EF2180]();
}

uint64_t sub_24F93CB08()
{
  return MEMORY[0x270FA2F00]();
}

uint64_t sub_24F93CB18()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_24F93CB28()
{
  return MEMORY[0x270EF23E8]();
}

uint64_t sub_24F93CB38()
{
  return MEMORY[0x270EF2478]();
}

uint64_t sub_24F93CB48()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_24F93CB58()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_24F93CB68()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_24F93CB78()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t sub_24F93CB88()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_24F93CB98()
{
  return MEMORY[0x270F9EBE0]();
}

uint64_t sub_24F93CBA8()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t sub_24F93CBB8()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t sub_24F93CBC8()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_24F93CBD8()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_24F93CBE8()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_24F93CBF8()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_24F93CC08()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_24F93CC18()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_24F93CC28()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_24F93CC38()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t MGIsDeviceOneOfType()
{
  return MEMORY[0x270F96010]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x270ED8070]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

uint64_t dyld_image_header_containing_address()
{
  return MEMORY[0x270ED96D0]();
}

void free(void *a1)
{
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x270EDA328](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x270EDA378](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x270EDA760](name);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_throw(id exception)
{
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

uint64_t self
{
  return MEMORY[0x270F9A730]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x270EDAB40]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x270FA01C8]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x270FA01E0]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x270FA0240]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x270FA02C0]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x270FA0400]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x270FA0440]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
}

uint64_t swift_once()
{
  return MEMORY[0x270FA04F0]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x270FA0558]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
}