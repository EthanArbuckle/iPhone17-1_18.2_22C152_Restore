uint64_t type metadata accessor for HealthAppOrchestrationClient()
{
  return self;
}

unint64_t sub_1E011A200(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    v3 = (void *)MEMORY[0x1E4FBC868];
    goto LABEL_9;
  }
  sub_1E011B078();
  uint64_t v2 = sub_1E0138480();
  v3 = (void *)v2;
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  uint64_t v5 = v2 + 64;
  uint64_t v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_1E011B0E4(v6, (uint64_t)v15);
    unint64_t result = sub_1E011AF6C((uint64_t)v15);
    if (v8) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v9 = v3[6] + 40 * result;
    long long v10 = v15[0];
    long long v11 = v15[1];
    *(void *)(v9 + 32) = v16;
    *(_OWORD *)uint64_t v9 = v10;
    *(_OWORD *)(v9 + 16) = v11;
    unint64_t result = (unint64_t)sub_1E011AF04(&v17, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v3[2] = v14;
    v6 += 72;
    if (!--v4)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

id sub_1E011A32C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = a1;
  *(void *)(v4 + 24) = a2;
  swift_retain();
  uint64_t v5 = (void *)sub_1E011A448((uint64_t)sub_1E0122BAC, v4);
  swift_release();
  v9[4] = a1;
  v9[5] = a2;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 1107296256;
  v9[2] = sub_1E0121C18;
  v9[3] = &block_descriptor_63;
  uint64_t v6 = _Block_copy(v9);
  swift_retain();
  swift_release();
  id v7 = objc_msgSend(v5, sel_remote_runForegroundGenerationWithCompletion_, v6);
  _Block_release(v6);
  swift_unknownObjectRelease();
  return v7;
}

uint64_t sub_1E011A448(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *(void **)&v2[OBJC_IVAR____TtC17HealthAppServices28HealthAppOrchestrationClient_connection];
  uint64_t v6 = (void *)swift_allocObject();
  v6[2] = v2;
  v6[3] = a1;
  v6[4] = a2;
  aBlock[4] = sub_1E0122A68;
  aBlock[5] = v6;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1E0122558;
  aBlock[3] = &block_descriptor_113;
  id v7 = _Block_copy(aBlock);
  char v8 = v2;
  swift_retain();
  swift_release();
  id v9 = objc_msgSend(v5, sel_remoteObjectProxyWithErrorHandler_, v7);
  _Block_release(v7);
  sub_1E01383A0();
  swift_unknownObjectRelease();
  sub_1E011AEA8((uint64_t)aBlock, (uint64_t)v13);
  sub_1E011B1C8();
  if (swift_dynamicCast())
  {
    __swift_destroy_boxed_opaque_existential_0((uint64_t)aBlock);
    return v12;
  }
  else
  {
    sub_1E011AEA8((uint64_t)aBlock, (uint64_t)v13);
    sub_1E0138400();
    id v11 = objc_msgSend(v8, sel_description);
    sub_1E0138190();

    sub_1E01381F0();
    swift_bridgeObjectRelease();
    sub_1E01381F0();
    sub_1E0138430();
    sub_1E01381F0();
    uint64_t result = sub_1E0138450();
    __break(1u);
  }
  return result;
}

void _s17HealthAppServices14HAUserActivityV06createE05title15restorationType17profileIdentifier17eligibleForSearch0lM7Handoff0lM10PredictionSo06NSUserE0CSS_AA08DeepLinkeI0OSo09HKProfileK0CSgS2bSgSbtFZ_0(uint64_t a1, uint64_t a2, unsigned __int8 *a3, void *a4, char a5, char a6, char a7)
{
  int v11 = *a3;
  DeepLinkActivityType.userActivityType.getter();
  id v12 = objc_allocWithZone(MEMORY[0x1E4F22488]);
  BOOL v13 = (void *)sub_1E0138170();
  swift_bridgeObjectRelease();
  id v14 = objc_msgSend(v12, sel_initWithActivityType_, v13);

  id v15 = v14;
  uint64_t v16 = (void *)sub_1E0138170();
  objc_msgSend(v15, sel_setTitle_, v16);

  objc_msgSend(v15, sel_setEligibleForSearch_, a5 & 1);
  objc_msgSend(v15, sel_setEligibleForHandoff_, a6 & 1);
  id v17 = objc_msgSend(self, sel_sharedBehavior);
  if (!v17)
  {
    __break(1u);
    goto LABEL_12;
  }
  v18 = v17;
  id v19 = objc_msgSend(v17, sel_features);

  if (!v19)
  {
LABEL_12:
    __break(1u);
    return;
  }
  unsigned int v20 = objc_msgSend(v19, sel_stanley);

  if (v20)
  {
    if (a6 == 2) {
      BOOL v21 = v11 != 5;
    }
    else {
      BOOL v21 = a6;
    }
    objc_msgSend(v15, sel_setEligibleForHandoff_, v21);
  }
  objc_msgSend(v15, sel_setEligibleForPrediction_, a7 & 1);
  v22 = v15;
  if (a4)
  {
    id v23 = a4;
    v22 = sub_1E0132368(v15, (uint64_t)v23);
  }
  sub_1E011AF14();
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1E01391C0;
  sub_1E01383E0();
  *(void *)(inited + 96) = MEMORY[0x1E4FBB550];
  *(void *)(inited + 72) = 1;
  sub_1E011A200(inited);
  v25 = (void *)sub_1E0138150();
  swift_bridgeObjectRelease();
  objc_msgSend(v22, sel_addUserInfoEntriesFromDictionary_, v25);
}

id HealthAppOrchestrationClient.init()()
{
  v1 = v0;
  uint64_t ObjectType = swift_getObjectType();
  type metadata accessor for HealthAppOrchestrationClient.WeakClientProxy();
  uint64_t v3 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v4 = OBJC_IVAR____TtC17HealthAppServices28HealthAppOrchestrationClient_clientProxy;
  *(void *)&v1[OBJC_IVAR____TtC17HealthAppServices28HealthAppOrchestrationClient_clientProxy] = v3;
  id v5 = objc_allocWithZone(MEMORY[0x1E4F29268]);
  uint64_t v6 = v1;
  id v7 = (void *)sub_1E0138170();
  id v8 = objc_msgSend(v5, sel_initWithMachServiceName_options_, v7, 0);

  uint64_t v9 = OBJC_IVAR____TtC17HealthAppServices28HealthAppOrchestrationClient_connection;
  *(void *)&v6[OBJC_IVAR____TtC17HealthAppServices28HealthAppOrchestrationClient_connection] = v8;
  long long v10 = self;
  id v11 = v8;
  id v12 = objc_msgSend(v10, sel_interfaceWithProtocol_, &unk_1F3B5B9B0);
  objc_msgSend(v11, sel_setRemoteObjectInterface_, v12);

  id v13 = *(id *)&v6[v9];
  id v14 = objc_msgSend(v10, sel_interfaceWithProtocol_, &unk_1F3B59A18);
  objc_msgSend(v13, sel_setExportedInterface_, v14);

  id v15 = *(void **)&v6[v9];
  objc_msgSend(v15, sel_setExportedObject_, *(void *)&v1[v4]);
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = ObjectType;
  v30 = sub_1E0122608;
  uint64_t v31 = v16;
  uint64_t aBlock = MEMORY[0x1E4F143A8];
  uint64_t v27 = 1107296256;
  v28 = sub_1E0121424;
  v29 = &block_descriptor;
  id v17 = _Block_copy(&aBlock);
  id v18 = v15;
  swift_release();
  objc_msgSend(v18, sel_setInterruptionHandler_, v17);
  _Block_release(v17);

  id v19 = *(id *)&v6[v9];
  id v20 = objc_msgSend(v19, sel_interruptionHandler);
  if (v20)
  {
    uint64_t v21 = swift_allocObject();
    *(void *)(v21 + 16) = v20;
    v30 = sub_1E0122650;
    uint64_t v31 = v21;
    uint64_t aBlock = MEMORY[0x1E4F143A8];
    uint64_t v27 = 1107296256;
    v28 = sub_1E0121424;
    v29 = &block_descriptor_6;
    id v20 = _Block_copy(&aBlock);
    swift_release();
  }
  objc_msgSend(v19, sel_setInvalidationHandler_, v20);
  _Block_release(v20);

  id v22 = *(id *)&v6[v9];
  objc_msgSend(v22, sel_resume);

  v25.receiver = v6;
  v25.super_class = (Class)type metadata accessor for HealthAppOrchestrationClient();
  id v23 = objc_msgSendSuper2(&v25, sel_init);
  swift_unknownObjectWeakAssign();
  return v23;
}

unsigned char *sub_1E011ACD4(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

unint64_t DeepLinkActivityType.userActivityType.getter()
{
  unint64_t result = 0xD000000000000019;
  switch(*v0)
  {
    case 1:
      unint64_t result = 0xD00000000000001DLL;
      break;
    case 2:
    case 3:
    case 0x11:
      unint64_t result = 0xD00000000000001CLL;
      break;
    case 4:
      unint64_t result = 0xD00000000000001ELL;
      break;
    case 5:
      return result;
    case 6:
      unint64_t result = 0xD00000000000001ELL;
      break;
    case 7:
      unint64_t result = 0xD00000000000001ALL;
      break;
    case 8:
      unint64_t result = 0xD000000000000020;
      break;
    case 9:
      unint64_t result = 0xD000000000000018;
      break;
    case 0xA:
      unint64_t result = 0xD000000000000022;
      break;
    case 0xB:
      unint64_t result = 0xD00000000000002CLL;
      break;
    case 0xC:
      unint64_t result = 0xD000000000000017;
      break;
    case 0xD:
      unint64_t result = 0xD000000000000020;
      break;
    case 0xE:
      unint64_t result = 0xD000000000000028;
      break;
    case 0xF:
      unint64_t result = 0xD00000000000001DLL;
      break;
    case 0x10:
      unint64_t result = 0xD000000000000025;
      break;
    default:
      unint64_t result = 0xD000000000000022;
      break;
  }
  return result;
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t __swift_destroy_boxed_opaque_existential_0(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_1E011AEA8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

_OWORD *sub_1E011AF04(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

void sub_1E011AF14()
{
  if (!qword_1EC05B4F0)
  {
    sub_1E011B148();
    unint64_t v0 = sub_1E01384E0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EC05B4F0);
    }
  }
}

unint64_t sub_1E011AF6C(uint64_t a1)
{
  uint64_t v2 = sub_1E01383C0();
  return sub_1E011AFB0(a1, v2);
}

unint64_t sub_1E011AFB0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v6 = ~v3;
    do
    {
      sub_1E012DE50(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      char v7 = MEMORY[0x1E01F10B0](v9, a1);
      sub_1E0120314((uint64_t)v9);
      if (v7) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v6;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

void sub_1E011B078()
{
  if (!qword_1EC05B4E8)
  {
    unint64_t v0 = sub_1E0138490();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EC05B4E8);
    }
  }
}

uint64_t sub_1E011B0E4(uint64_t a1, uint64_t a2)
{
  sub_1E011B148();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void sub_1E011B148()
{
  if (!qword_1EC05B4A8)
  {
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1) {
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_1EC05B4A8);
    }
  }
}

ValueMetadata *type metadata accessor for DeepLinkActivityType()
{
  return &type metadata for DeepLinkActivityType;
}

unint64_t sub_1E011B1C8()
{
  unint64_t result = qword_1EC05B668;
  if (!qword_1EC05B668)
  {
    unint64_t result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_1EC05B668);
  }
  return result;
}

uint64_t dispatch thunk of HealthAppOrchestrationClient.runForegroundGeneration(completion:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x88))();
}

uint64_t type metadata accessor for HealthAppOrchestrationClient.WeakClientProxy()
{
  return self;
}

__CFString *HAStringForDataRequestType(uint64_t a1)
{
  uint64_t v1 = @"unknown";
  if (a1 == 1) {
    uint64_t v1 = @"write";
  }
  if (a1) {
    return v1;
  }
  else {
    return @"read";
  }
}

id AllHealthAppAnalyticsAgreements()
{
  v2[2] = *MEMORY[0x1E4F143B8];
  v2[0] = @"ImproveHealthAndAnalytics";
  v2[1] = @"ImproveHealthRecords";
  unint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:2];
  return v0;
}

uint64_t ContactDeepLinkingParameter.value.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ContactDeepLinkingParameter.value.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*ContactDeepLinkingParameter.value.modify())()
{
  return nullsub_1;
}

uint64_t static ContactDeepLinkingParameter.keyName.getter()
{
  return sub_1E011E58C(&qword_1EACE17D0);
}

uint64_t static ContactDeepLinkingParameter.keyName.setter(uint64_t a1, uint64_t a2)
{
  return sub_1E011E5F0(a1, a2, &qword_1EACE17D0, &off_1EACE17D8);
}

uint64_t (*static ContactDeepLinkingParameter.keyName.modify())()
{
  return j_j__swift_endAccess;
}

HealthAppServices::ContactDeepLinkingParameter __swiftcall ContactDeepLinkingParameter.init(value:)(HealthAppServices::ContactDeepLinkingParameter value)
{
  HealthAppServices::ContactDeepLinkingParameter *v1 = value;
  return value;
}

void *sub_1E011E4F4@<X0>(void *result@<X0>, void *a2@<X8>)
{
  uint64_t v2 = result[1];
  *a2 = *result;
  a2[1] = v2;
  return result;
}

uint64_t sub_1E011E500(uint64_t a1, uint64_t a2)
{
  return sub_1E011FE88(a1, a2, &qword_1EACE17D0);
}

uint64_t sub_1E011E510@<X0>(void *a1@<X8>)
{
  uint64_t v2 = v1[1];
  *a1 = *v1;
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

uint64_t sub_1E011E51C(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  uint64_t result = swift_bridgeObjectRelease();
  void *v1 = v2;
  v1[1] = v3;
  return result;
}

uint64_t (*sub_1E011E550())()
{
  return nullsub_1;
}

uint64_t SharingInviteFlowURLData.contactData.getter@<X0>(void *a1@<X8>)
{
  uint64_t v2 = v1[1];
  *a1 = *v1;
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

uint64_t static SharingInviteFlowURLData.urlPath.getter()
{
  return sub_1E011E58C(&qword_1EACE17E0);
}

uint64_t sub_1E011E58C(uint64_t *a1)
{
  swift_beginAccess();
  uint64_t v2 = *a1;
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t static SharingInviteFlowURLData.urlPath.setter(uint64_t a1, uint64_t a2)
{
  return sub_1E011E5F0(a1, a2, &qword_1EACE17E0, &off_1EACE17E8);
}

uint64_t sub_1E011E5F0(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  *a3 = a1;
  *a4 = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*static SharingInviteFlowURLData.urlPath.modify())()
{
  return j__swift_endAccess;
}

HealthAppServices::SharingInviteFlowURLData __swiftcall SharingInviteFlowURLData.init(contactData:)(HealthAppServices::SharingInviteFlowURLData contactData)
{
  _OWORD *v1 = *(_OWORD *)contactData.contactData.value.value._countAndFlagsBits;
  return contactData;
}

uint64_t static SharingInviteFlowURLData.isSharingInviteFlow(_:)(void *a1)
{
  id v1 = objc_msgSend(a1, sel_activityType);
  uint64_t v2 = sub_1E0138190();
  uint64_t v4 = v3;

  uint64_t v5 = 0;
  while (2)
  {
    uint64_t v6 = *((unsigned __int8 *)&unk_1F3B54C98 + v5++ + 32);
    unint64_t v7 = 0x80000001E013A720;
    unint64_t v8 = 0xD000000000000019;
    switch(v6)
    {
      case 1:
        unint64_t v8 = 0xD00000000000001DLL;
        uint64_t v9 = "com.apple.health.view.sharing";
        goto LABEL_21;
      case 2:
        long long v10 = ".view.notifications.settings";
        goto LABEL_28;
      case 3:
        long long v10 = ".profile.sources";
        goto LABEL_28;
      case 4:
        unint64_t v8 = 0xD00000000000001ELL;
        uint64_t v9 = "com.apple.health.view.data";
        goto LABEL_21;
      case 5:
        goto LABEL_22;
      case 6:
        unint64_t v8 = 0xD00000000000001ELL;
        uint64_t v9 = "com.apple.health.view.category";
        goto LABEL_21;
      case 7:
        id v12 = "com.apple.health.view.foryou";
        unint64_t v11 = 0xD00000000000001ALL;
        goto LABEL_12;
      case 8:
        unint64_t v8 = 0xD000000000000020;
        uint64_t v9 = ".profile.medicalID";
        goto LABEL_21;
      case 9:
        id v12 = "com.apple.health.view.search";
        unint64_t v11 = 0xD000000000000018;
LABEL_12:
        unint64_t v7 = (unint64_t)v12 | 0x8000000000000000;
        if (v11 != v2) {
          goto LABEL_24;
        }
        goto LABEL_23;
      case 10:
        unint64_t v8 = 0xD000000000000022;
        uint64_t v9 = "com.apple.health.plugin";
        goto LABEL_21;
      case 11:
        unint64_t v8 = 0xD00000000000002CLL;
        uint64_t v9 = "stomSchemeURL";
        goto LABEL_21;
      case 12:
        unint64_t v8 = 0xD000000000000017;
        uint64_t v9 = "com.apple.health.profile";
        goto LABEL_21;
      case 13:
        unint64_t v8 = 0xD000000000000020;
        uint64_t v9 = "com.apple.health.view.summary";
        goto LABEL_21;
      case 14:
        unint64_t v8 = 0xD000000000000028;
        uint64_t v9 = ".view.sharing.profile";
        goto LABEL_21;
      case 15:
        unint64_t v8 = 0xD00000000000001DLL;
        uint64_t v9 = ".view.sharing.inviteFlow";
        goto LABEL_21;
      case 16:
        unint64_t v8 = 0xD000000000000025;
        uint64_t v9 = "com.apple.health.view.trends";
        goto LABEL_21;
      case 17:
        long long v10 = ".view.highlights";
LABEL_28:
        unint64_t v7 = (unint64_t)v10 | 0x8000000000000000;
        if (v2 != 0xD00000000000001CLL) {
          goto LABEL_24;
        }
        goto LABEL_23;
      default:
        unint64_t v8 = 0xD000000000000022;
        uint64_t v9 = "com.apple.health.view.data.all";
LABEL_21:
        unint64_t v7 = (unint64_t)v9 | 0x8000000000000000;
LABEL_22:
        if (v8 != v2) {
          goto LABEL_24;
        }
LABEL_23:
        if (v7 != v4)
        {
LABEL_24:
          char v13 = sub_1E01384F0();
          swift_bridgeObjectRelease();
          if (v13) {
            goto LABEL_31;
          }
          if (v5 == 18)
          {
            swift_bridgeObjectRelease();
            char v22 = 0;
            return v22 & 1;
          }
          continue;
        }
        swift_bridgeObjectRelease();
LABEL_31:
        swift_bridgeObjectRelease();
        uint64_t v14 = DeepLinkActivityType.rawValue.getter();
        uint64_t v16 = v15;
        id v17 = objc_msgSend(self, sel_healthAppSharingInviteFlowPath);
        uint64_t v18 = sub_1E0138190();
        uint64_t v20 = v19;

        if (v14 == v18 && v16 == v20) {
          char v22 = 1;
        }
        else {
          char v22 = sub_1E01384F0();
        }
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        return v22 & 1;
    }
  }
}

uint64_t sub_1E011EA8C(uint64_t a1, uint64_t a2)
{
  return sub_1E011EABC(a1, a2, DeepLinkActivityType.rawValue.getter);
}

uint64_t sub_1E011EAA4(uint64_t a1, uint64_t a2)
{
  return sub_1E011EABC(a1, a2, QueryParameterName.rawValue.getter);
}

uint64_t sub_1E011EABC(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v4 = a3();
  uint64_t v6 = v5;
  if (v4 == a3() && v6 == v7) {
    char v9 = 1;
  }
  else {
    char v9 = sub_1E01384F0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v9 & 1;
}

uint64_t sub_1E011EB60(unsigned __int8 a1, char a2)
{
  unint64_t v2 = 0xD000000000000011;
  unint64_t v3 = 0x80000001E013A3E0;
  uint64_t v4 = a1;
  unint64_t v5 = 0xD000000000000011;
  switch(v4)
  {
    case 1:
      unint64_t v5 = 0x7461447472617473;
      goto LABEL_10;
    case 2:
      unint64_t v3 = 0xE700000000000000;
      unint64_t v5 = 0x65746144646E65;
      break;
    case 3:
      unint64_t v3 = 0xE500000000000000;
      unint64_t v5 = 0x7972657571;
      break;
    case 4:
      unint64_t v5 = 0x6570795461746164;
      unint64_t v3 = 0xEC00000065646F43;
      break;
    case 5:
      break;
    case 6:
      unint64_t v5 = 0x6E6F437472616863;
      unint64_t v3 = 0xEC00000074786574;
      break;
    case 7:
      unint64_t v5 = 0x6D6954646E657274;
      unint64_t v3 = 0xEE0065706F637365;
      break;
    case 8:
      unint64_t v5 = 0x6372756F536C7275;
LABEL_10:
      unint64_t v3 = 0xE900000000000065;
      break;
    case 9:
      unint64_t v5 = 0xD00000000000001DLL;
      unint64_t v3 = 0x80000001E013A450;
      break;
    default:
      unint64_t v3 = 0xE400000000000000;
      unint64_t v5 = 1702125924;
      break;
  }
  unint64_t v6 = 0x80000001E013A3E0;
  switch(a2)
  {
    case 1:
      unint64_t v6 = 0xE900000000000065;
      if (v5 == 0x7461447472617473) {
        goto LABEL_29;
      }
      goto LABEL_32;
    case 2:
      unint64_t v6 = 0xE700000000000000;
      if (v5 != 0x65746144646E65) {
        goto LABEL_32;
      }
      goto LABEL_29;
    case 3:
      unint64_t v6 = 0xE500000000000000;
      if (v5 != 0x7972657571) {
        goto LABEL_32;
      }
      goto LABEL_29;
    case 4:
      uint64_t v7 = 0x6570795461746164;
      uint64_t v8 = 1701080899;
      goto LABEL_23;
    case 5:
      goto LABEL_28;
    case 6:
      uint64_t v7 = 0x6E6F437472616863;
      uint64_t v8 = 1954047348;
LABEL_23:
      unint64_t v6 = v8 & 0xFFFFFFFFFFFFLL | 0xEC00000000000000;
      if (v5 != v7) {
        goto LABEL_32;
      }
      goto LABEL_29;
    case 7:
      unint64_t v6 = 0xEE0065706F637365;
      if (v5 != 0x6D6954646E657274) {
        goto LABEL_32;
      }
      goto LABEL_29;
    case 8:
      unint64_t v2 = 0x6372756F536C7275;
      unint64_t v6 = 0xE900000000000065;
LABEL_28:
      if (v5 == v2) {
        goto LABEL_29;
      }
      goto LABEL_32;
    case 9:
      unint64_t v6 = 0x80000001E013A450;
      if (v5 != 0xD00000000000001DLL) {
        goto LABEL_32;
      }
      goto LABEL_29;
    default:
      unint64_t v6 = 0xE400000000000000;
      if (v5 != 1702125924) {
        goto LABEL_32;
      }
LABEL_29:
      if (v3 == v6) {
        char v9 = 1;
      }
      else {
LABEL_32:
      }
        char v9 = sub_1E01384F0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v9 & 1;
  }
}

uint64_t SharingInviteFlowURLData.url()@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_1E0137ED0();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  unint64_t v6 = (char *)&v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1E01201F8(0, (unint64_t *)&qword_1EACE1840, MEMORY[0x1E4F276F0], MEMORY[0x1E4FBB718]);
  MEMORY[0x1F4188790](v7 - 8);
  char v9 = (char *)&v23 - v8;
  uint64_t v10 = sub_1E01380B0();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x1F4188790](v10);
  char v13 = (char *)&v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = *v1;
  uint64_t v14 = v1[1];
  sub_1E011F1CC();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10) == 1)
  {
    sub_1E01202A4((uint64_t)v9, (unint64_t *)&qword_1EACE1840, MEMORY[0x1E4F276F0]);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v11 + 56))(a1, 1, 1, v10);
  }
  else
  {
    uint64_t v24 = v4;
    objc_super v25 = (char *)a1;
    id v17 = *(void (**)(char *, char *, uint64_t))(v11 + 32);
    v17(v13, v9, v10);
    if (v14)
    {
      uint64_t v26 = v15;
      uint64_t v27 = v14;
      swift_bridgeObjectRetain();
      sub_1E0137EC0();
      sub_1E011FF24();
      uint64_t v18 = sub_1E0138360();
      uint64_t v20 = v19;
      (*(void (**)(char *, uint64_t))(v24 + 8))(v6, v3);
      swift_bridgeObjectRelease();
      swift_beginAccess();
      uint64_t v21 = off_1EACE17D8;
      swift_bridgeObjectRetain();
      sub_1E012EC90((uint64_t)v21, v18, v20, (uint64_t)v25);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v13, v10);
    }
    else
    {
      uint64_t v22 = (uint64_t)v25;
      v17(v25, v13, v10);
      return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v11 + 56))(v22, 0, 1, v10);
    }
  }
}

uint64_t sub_1E011F1CC()
{
  unint64_t v0 = self;
  id v1 = objc_msgSend(v0, sel_externalHealthAppURLScheme);
  sub_1E0138190();

  id v2 = objc_msgSend(v0, sel_externalHealthAppURLHost);
  sub_1E0138190();

  sub_1E01381F0();
  sub_1E01381F0();
  swift_bridgeObjectRelease();
  sub_1E01381F0();
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_1E01381F0();
  swift_bridgeObjectRelease();
  sub_1E01380A0();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1E011F300()
{
  unint64_t v0 = self;
  id v1 = objc_msgSend(v0, sel_externalHealthAppURLScheme);
  sub_1E0138190();

  id v2 = objc_msgSend(v0, sel_externalHealthAppURLHost);
  sub_1E0138190();

  sub_1E01381F0();
  sub_1E01381F0();
  swift_bridgeObjectRelease();
  sub_1E01381F0();
  if (qword_1EACE1800 != -1) {
    swift_once();
  }
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_1E01381F0();
  swift_bridgeObjectRelease();
  sub_1E01380A0();
  return swift_bridgeObjectRelease();
}

uint64_t static SharingInviteFlowURLData.fromURL(_:)@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4 = sub_1E0137F10();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x1F4188790](v4);
  uint64_t v8 = (char *)&v33 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v6);
  uint64_t v10 = (char *)&v33 - v9;
  uint64_t v11 = type metadata accessor for HAURL();
  MEMORY[0x1F4188790](v11 - 8);
  char v13 = (char *)&v33 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_1E01380B0();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v14 - 8) + 16))(v13, a1, v14);
  uint64_t v15 = HAURL.queryItems.getter();
  if (v15)
  {
    uint64_t v16 = *(void *)(v15 + 16);
    if (!v16) {
      goto LABEL_15;
    }
    v33 = v10;
    v36 = v13;
    v37 = a2;
    unint64_t v17 = v15 + ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));
    uint64_t v35 = v15;
    swift_bridgeObjectRetain();
    swift_beginAccess();
    uint64_t v34 = v5;
    uint64_t v18 = v5 + 16;
    uint64_t v19 = *(void (**)(char *, unint64_t, uint64_t))(v5 + 16);
    uint64_t v20 = *(void *)(v18 + 56);
    while (1)
    {
      v19(v8, v17, v4);
      if (sub_1E0137EF0() == qword_1EACE17D0 && v21 == off_1EACE17D8) {
        break;
      }
      char v23 = sub_1E01384F0();
      swift_bridgeObjectRelease();
      if (v23) {
        goto LABEL_12;
      }
      (*(void (**)(char *, uint64_t))(v18 - 8))(v8, v4);
      v17 += v20;
      if (!--v16)
      {
        swift_bridgeObjectRelease();
        char v13 = v36;
        a2 = v37;
        goto LABEL_15;
      }
    }
    swift_bridgeObjectRelease();
LABEL_12:
    swift_bridgeObjectRelease();
    uint64_t v24 = v33;
    uint64_t v25 = v34 + 32;
    (*(void (**)(char *, char *, uint64_t))(v34 + 32))(v33, v8, v4);
    uint64_t v26 = sub_1E0137F00();
    uint64_t v28 = v27;
    (*(void (**)(char *, uint64_t))(v25 - 24))(v24, v4);
    char v13 = v36;
    a2 = v37;
    if (v28)
    {
      uint64_t v38 = v26;
      uint64_t v39 = v28;
      sub_1E011FF24();
      uint64_t v29 = sub_1E0138380();
      uint64_t v31 = v30;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v31)
      {
        uint64_t result = sub_1E011FF78((uint64_t)v13);
        *a2 = v29;
        a2[1] = v31;
        return result;
      }
    }
    else
    {
LABEL_15:
      swift_bridgeObjectRelease();
    }
  }
  uint64_t result = sub_1E011FF78((uint64_t)v13);
  *a2 = 0;
  a2[1] = 0;
  return result;
}

NSUserActivity __swiftcall SharingInviteFlowURLData.userActivity()()
{
  uint64_t v2 = *v0;
  id v1 = (void *)v0[1];
  sub_1E0138400();
  swift_bridgeObjectRelease();
  unint64_t v11 = 0xD000000000000012;
  uint64_t v12 = 0x80000001E013A740;
  if (v1) {
    uint64_t v3 = v2;
  }
  else {
    uint64_t v3 = 0;
  }
  uint64_t v13 = v3;
  uint64_t v14 = v1;
  uint64_t v4 = MEMORY[0x1E4FBB1A0];
  sub_1E012025C(0, &qword_1EACE1848);
  swift_bridgeObjectRetain();
  sub_1E01381B0();
  sub_1E01381F0();
  swift_bridgeObjectRelease();
  uint64_t v5 = v11;
  LOBYTE(v11) = 14;
  _s17HealthAppServices14HAUserActivityV06createE05title15restorationType17profileIdentifier17eligibleForSearch0lM7Handoff0lM10PredictionSo06NSUserE0CSS_AA08DeepLinkeI0OSo09HKProfileK0CSgS2bSgSbtFZ_0(v5, v12, (unsigned __int8 *)&v11, 0, 0, 2, 0);
  uint64_t v7 = v6;
  swift_bridgeObjectRelease();
  if (v1)
  {
    sub_1E01201F8(0, (unint64_t *)&qword_1EC05B4F0, (uint64_t (*)(uint64_t))sub_1E011B148, MEMORY[0x1E4FBBE00]);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_1E01391C0;
    swift_beginAccess();
    uint64_t v13 = qword_1EACE17D0;
    uint64_t v14 = off_1EACE17D8;
    swift_bridgeObjectRetain();
    sub_1E01383E0();
    *(void *)(inited + 96) = v4;
    *(void *)(inited + 72) = v2;
    *(void *)(inited + 80) = v1;
    swift_bridgeObjectRetain();
    sub_1E011A200(inited);
    uint64_t v9 = (void *)sub_1E0138150();
    swift_bridgeObjectRelease();
    objc_msgSend(v7, sel_addUserInfoEntriesFromDictionary_, v9);
  }
  return (NSUserActivity)v7;
}

double static SharingInviteFlowURLData.fromUserActivity(_:)@<D0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  sub_1E011F9C0(a1, &v4);
  double result = *(double *)&v4;
  *a2 = v4;
  return result;
}

uint64_t sub_1E011F9C0@<X0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  id v3 = objc_msgSend(a1, sel_userInfo);
  if (v3)
  {
    long long v4 = v3;
    uint64_t v5 = sub_1E0138160();

    swift_beginAccess();
    swift_bridgeObjectRetain();
    sub_1E01383E0();
    if (*(void *)(v5 + 16) && (unint64_t v6 = sub_1E011AF6C((uint64_t)v10), (v7 & 1) != 0))
    {
      sub_1E011AEA8(*(void *)(v5 + 56) + 32 * v6, (uint64_t)&v11);
    }
    else
    {
      long long v11 = 0u;
      long long v12 = 0u;
    }
    sub_1E0120314((uint64_t)v10);
    swift_bridgeObjectRelease();
  }
  else
  {
    long long v11 = 0u;
    long long v12 = 0u;
  }
  sub_1E012025C(0, (unint64_t *)&qword_1EACE1858);
  uint64_t result = swift_dynamicCast();
  if (result) {
    long long v9 = v10[0];
  }
  else {
    long long v9 = 0uLL;
  }
  *a2 = v9;
  return result;
}

uint64_t sub_1E011FB08@<X0>(void *a1@<X0>, char *a2@<X8>)
{
  sub_1E01201F8(0, &qword_1EACE1850, MEMORY[0x1E4F27990], MEMORY[0x1E4FBB718]);
  MEMORY[0x1F4188790](v4 - 8);
  unint64_t v6 = (char *)v22 - v5;
  uint64_t v7 = sub_1E0138110();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7);
  uint64_t v10 = (char *)v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v11 = objc_msgSend(a1, sel_userInfo);
  if (v11)
  {
    long long v12 = v11;
    uint64_t v13 = sub_1E0138160();

    if (qword_1EACE17F8 != -1) {
      swift_once();
    }
    swift_beginAccess();
    v22[0] = qword_1EACE18A0;
    v22[1] = *(void *)algn_1EACE18A8;
    swift_bridgeObjectRetain();
    sub_1E01383E0();
    if (*(void *)(v13 + 16) && (unint64_t v14 = sub_1E011AF6C((uint64_t)v23), (v15 & 1) != 0))
    {
      sub_1E011AEA8(*(void *)(v13 + 56) + 32 * v14, (uint64_t)&v24);
    }
    else
    {
      long long v24 = 0u;
      long long v25 = 0u;
    }
    sub_1E0120314((uint64_t)v23);
    swift_bridgeObjectRelease();
  }
  else
  {
    long long v24 = 0u;
    long long v25 = 0u;
  }
  sub_1E012025C(0, (unint64_t *)&qword_1EACE1858);
  int v16 = swift_dynamicCast();
  unint64_t v17 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v8 + 56);
  if (v16)
  {
    v17(v6, 0, 1, v7);
    uint64_t v18 = *(void (**)(char *, char *, uint64_t))(v8 + 32);
    v18(v10, v6, v7);
    v18(a2, v10, v7);
    uint64_t v19 = type metadata accessor for SharingUUIDDeepLinkingParameter(0);
    return (*(uint64_t (**)(char *, void, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(a2, 0, 1, v19);
  }
  else
  {
    v17(v6, 1, 1, v7);
    sub_1E01202A4((uint64_t)v6, &qword_1EACE1850, MEMORY[0x1E4F27990]);
    uint64_t v21 = type metadata accessor for SharingUUIDDeepLinkingParameter(0);
    return (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56))(a2, 1, 1, v21);
  }
}

uint64_t sub_1E011FE78(uint64_t a1, uint64_t a2)
{
  return sub_1E011FE88(a1, a2, &qword_1EACE17E0);
}

uint64_t sub_1E011FE88(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  swift_beginAccess();
  uint64_t v4 = *a3;
  swift_bridgeObjectRetain();
  return v4;
}

double sub_1E011FEEC@<D0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  sub_1E011F9C0(a1, &v4);
  double result = *(double *)&v4;
  *a2 = v4;
  return result;
}

unint64_t sub_1E011FF24()
{
  unint64_t result = qword_1EC05B658;
  if (!qword_1EC05B658)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EC05B658);
  }
  return result;
}

uint64_t sub_1E011FF78(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for HAURL();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1E011FFD4()
{
  return 1;
}

char **sub_1E011FFDC()
{
  return &protocol witness table for String;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for ContactDeepLinkingParameter(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 16)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ContactDeepLinkingParameter(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ContactDeepLinkingParameter()
{
  return &type metadata for ContactDeepLinkingParameter;
}

void *initializeBufferWithCopyOfBuffer for SharingInviteFlowURLData(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for SharingInviteFlowURLData()
{
  return swift_bridgeObjectRelease();
}

void *assignWithCopy for PluginURLType(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *assignWithTake for SharingInviteFlowURLData(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for SharingInviteFlowURLData(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  unint64_t v3 = *(void *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for SharingInviteFlowURLData(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    *(void *)(result + 8) = 0;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 16) = 0;
    }
    if (a2) {
      *(void *)(result + 8) = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SharingInviteFlowURLData()
{
  return &type metadata for SharingInviteFlowURLData;
}

void sub_1E01201F8(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v7 = a3(255);
    unint64_t v8 = a4(a1, v7);
    if (!v9) {
      atomic_store(v8, a2);
    }
  }
}

void sub_1E012025C(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t v3 = sub_1E0138330();
    if (!v4) {
      atomic_store(v3, a2);
    }
  }
}

uint64_t sub_1E01202A4(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t))
{
  sub_1E01201F8(0, a2, a3, MEMORY[0x1E4FBB718]);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  return a1;
}

uint64_t sub_1E0120314(uint64_t a1)
{
  return a1;
}

uint64_t static ProfileInformationSupport.localizedFullName(firstName:lastName:)()
{
  uint64_t v0 = sub_1E0137FD0();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1F4188790](v0);
  unint64_t v3 = (char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1E0137FC0();
  swift_bridgeObjectRetain();
  sub_1E0137F90();
  swift_bridgeObjectRetain();
  sub_1E0137FA0();
  uint64_t v4 = self;
  uint64_t v5 = (void *)sub_1E0137FB0();
  id v6 = objc_msgSend(v4, sel_localizedStringFromPersonNameComponents_style_options_, v5, 2, 0);

  uint64_t v7 = sub_1E0138190();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return v7;
}

uint64_t static ProfileInformationSupport.localizedShortName(firstName:lastName:)()
{
  uint64_t v0 = sub_1E0137FD0();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1F4188790](v0);
  unint64_t v3 = (char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1E0137FC0();
  swift_bridgeObjectRetain();
  sub_1E0137F90();
  swift_bridgeObjectRetain();
  sub_1E0137FA0();
  uint64_t v4 = self;
  uint64_t v5 = (void *)sub_1E0137FB0();
  id v6 = objc_msgSend(v4, sel_localizedStringFromPersonNameComponents_style_options_, v5, 1, 0);

  uint64_t v7 = sub_1E0138190();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return v7;
}

uint64_t static ProfileInformationSupport.localizedFullNameOrAccountIdentifier(firstName:lastName:isContact:accountIdentifier:shouldDisplaySuggestedName:newlineBetweenNames:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, uint64_t a6, uint64_t a7, int a8)
{
  HIDWORD(v23) = a8;
  uint64_t v11 = sub_1E0137FD0();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x1F4188790](v11);
  unint64_t v14 = (char *)&v23 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1E0137FC0();
  swift_bridgeObjectRetain();
  sub_1E0137F90();
  swift_bridgeObjectRetain();
  sub_1E0137FA0();
  char v15 = self;
  int v16 = (void *)sub_1E0137FB0();
  id v17 = objc_msgSend(v15, sel_localizedStringFromPersonNameComponents_style_options_, v16, 2, 0);

  uint64_t v18 = sub_1E0138190();
  unint64_t v20 = v19;

  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  if (a5)
  {
    uint64_t v21 = HIBYTE(v20) & 0xF;
    if ((v20 & 0x2000000000000000) == 0) {
      uint64_t v21 = v18 & 0xFFFFFFFFFFFFLL;
    }
    if (v21)
    {
      return v18;
    }
    else
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
    }
  }
  else
  {
    a6 = sub_1E0120840(v18, v20, a6, a7, BYTE4(v23) & 1);
    swift_bridgeObjectRelease();
  }
  return a6;
}

uint64_t sub_1E0120840(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v11 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_1E0137F80();

  if ((a5 & 1) == 0) {
    goto LABEL_6;
  }
  uint64_t v12 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x2000000000000000) == 0) {
    uint64_t v12 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v12)
  {
    sub_1E0120F70();
    uint64_t v13 = swift_allocObject();
    *(_OWORD *)(v13 + 16) = xmmword_1E01391C0;
    *(void *)(v13 + 56) = MEMORY[0x1E4FBB1A0];
    unint64_t v14 = sub_1E0121020();
    *(void *)(v13 + 64) = v14;
    *(void *)(v13 + 32) = a1;
    *(void *)(v13 + 40) = a2;
    swift_bridgeObjectRetain();
    uint64_t v15 = sub_1E0138180();
    uint64_t v17 = v16;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v18 = swift_allocObject();
    *(_OWORD *)(v18 + 16) = xmmword_1E0139260;
    uint64_t v19 = MEMORY[0x1E4FBB1A0];
    *(void *)(v18 + 56) = MEMORY[0x1E4FBB1A0];
    *(void *)(v18 + 64) = v14;
    *(void *)(v18 + 32) = a3;
    *(void *)(v18 + 40) = a4;
    *(void *)(v18 + 96) = v19;
    *(void *)(v18 + 104) = v14;
    *(void *)(v18 + 72) = v15;
    *(void *)(v18 + 80) = v17;
    swift_bridgeObjectRetain();
    a3 = sub_1E01381A0();
    swift_bridgeObjectRelease();
  }
  else
  {
LABEL_6:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
  }
  return a3;
}

uint64_t static ProfileInformationSupport.localizedShortNameOrAccountIdentifier(firstName:lastName:isContact:accountIdentifier:shouldDisplaySuggestedName:newlineBetweenNames:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, uint64_t a7, int a8, unsigned __int8 a9)
{
  int v31 = a8;
  uint64_t v33 = a6;
  uint64_t v34 = a7;
  int v32 = a5;
  uint64_t v11 = sub_1E0137FD0();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x1F4188790](v11);
  unint64_t v14 = (char *)v30 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1E0137FC0();
  swift_bridgeObjectRetain();
  v30[1] = a1;
  sub_1E0137F90();
  swift_bridgeObjectRetain();
  v30[2] = a3;
  sub_1E0137FA0();
  uint64_t v15 = self;
  uint64_t v16 = (void *)sub_1E0137FB0();
  id v17 = objc_msgSend(v15, sel_localizedStringFromPersonNameComponents_style_options_, v16, 1, 0);

  uint64_t v18 = sub_1E0138190();
  unint64_t v20 = v19;

  uint64_t v21 = *(void (**)(char *, uint64_t))(v12 + 8);
  v21(v14, v11);
  if (v32)
  {
    uint64_t v22 = v33;
    uint64_t v23 = HIBYTE(v20) & 0xF;
    if ((v20 & 0x2000000000000000) == 0) {
      uint64_t v23 = v18 & 0xFFFFFFFFFFFFLL;
    }
    if (!v23)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      return v22;
    }
  }
  else
  {
    int v32 = a9;
    swift_bridgeObjectRelease();
    sub_1E0137FC0();
    swift_bridgeObjectRetain();
    sub_1E0137F90();
    swift_bridgeObjectRetain();
    sub_1E0137FA0();
    long long v24 = (void *)sub_1E0137FB0();
    id v25 = objc_msgSend(v15, sel_localizedStringFromPersonNameComponents_style_options_, v24, 2, 0);

    uint64_t v26 = sub_1E0138190();
    unint64_t v28 = v27;

    v21(v14, v11);
    uint64_t v18 = sub_1E0120840(v26, v28, v33, v34, v31 & 1);
    swift_bridgeObjectRelease();
  }
  return v18;
}

id sub_1E0120D3C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned int a7, char a8, void (*a9)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void, char))
{
  uint64_t v11 = a4;
  if (a3)
  {
    uint64_t v12 = sub_1E0138190();
    uint64_t v14 = v13;
    if (v11)
    {
LABEL_3:
      uint64_t v15 = sub_1E0138190();
      uint64_t v11 = v16;
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v12 = 0;
    uint64_t v14 = 0;
    if (a4) {
      goto LABEL_3;
    }
  }
  uint64_t v15 = 0;
LABEL_6:
  uint64_t v17 = sub_1E0138190();
  uint64_t v19 = v18;
  swift_getObjCClassMetadata();
  a9(v12, v14, v15, v11, a5, v17, v19, a7, a8);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  unint64_t v20 = (void *)sub_1E0138170();
  swift_bridgeObjectRelease();
  return v20;
}

id ProfileInformationSupport.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

id ProfileInformationSupport.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ProfileInformationSupport();
  return objc_msgSendSuper2(&v2, sel_init);
}

id ProfileInformationSupport.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ProfileInformationSupport();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for ProfileInformationSupport()
{
  return self;
}

void sub_1E0120F70()
{
  if (!qword_1EACE1860)
  {
    sub_1E0120FC8();
    unint64_t v0 = sub_1E01384E0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EACE1860);
    }
  }
}

unint64_t sub_1E0120FC8()
{
  unint64_t result = qword_1EACE1868;
  if (!qword_1EACE1868)
  {
    unint64_t result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_1EACE1868);
  }
  return result;
}

unint64_t sub_1E0121020()
{
  unint64_t result = qword_1EACE1870;
  if (!qword_1EACE1870)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EACE1870);
  }
  return result;
}

id sub_1E0121074()
{
  id result = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for HealthAppOrchestrationClient()), sel_init);
  qword_1EACE1878 = (uint64_t)result;
  return result;
}

id HealthAppOrchestrationClient.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

id static HealthAppOrchestrationClient.sharedConnection.getter()
{
  if (qword_1EACE17F0 != -1) {
    swift_once();
  }
  swift_beginAccess();
  unint64_t v0 = (void *)qword_1EACE1878;
  return v0;
}

void static HealthAppOrchestrationClient.sharedConnection.setter(uint64_t a1)
{
  if (qword_1EACE17F0 != -1) {
    swift_once();
  }
  swift_beginAccess();
  objc_super v2 = (void *)qword_1EACE1878;
  qword_1EACE1878 = a1;
}

uint64_t (*static HealthAppOrchestrationClient.sharedConnection.modify())()
{
  if (qword_1EACE17F0 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j__swift_endAccess;
}

unint64_t static HealthAppOrchestrationClient.serviceName.getter()
{
  return 0xD000000000000022;
}

void sub_1E0121280()
{
  if (qword_1EC05B670 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_1E0138140();
  __swift_project_value_buffer(v0, (uint64_t)qword_1EC05B758);
  oslog = sub_1E0138120();
  os_log_type_t v1 = sub_1E0138310();
  if (os_log_type_enabled(oslog, v1))
  {
    objc_super v2 = (uint8_t *)swift_slowAlloc();
    uint64_t v3 = swift_slowAlloc();
    uint64_t v5 = v3;
    *(_DWORD *)objc_super v2 = 136315138;
    sub_1E012BBD0(0xD000000000000022, 0x80000001E013A990, &v5);
    sub_1E0138340();
    _os_log_impl(&dword_1E0118000, oslog, v1, "%s: connection interrupted", v2, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1E01F1830](v3, -1, -1);
    MEMORY[0x1E01F1830](v2, -1, -1);
  }
  else
  {
  }
}

uint64_t sub_1E0121424(uint64_t a1)
{
  os_log_type_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);
  return swift_release();
}

void sub_1E0121468(char a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = a2;
  *(void *)(v6 + 24) = a3;
  swift_retain();
  uint64_t v7 = (void *)sub_1E011A448((uint64_t)sub_1E0122BAC, v6);
  swift_release();
  if (a1)
  {
    uint64_t v8 = swift_allocObject();
    *(void *)(v8 + 16) = a2;
    *(void *)(v8 + 24) = a3;
    uint64_t v16 = sub_1E0122BB0;
    uint64_t v17 = v8;
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 1107296256;
    uint64_t v14 = sub_1E0121424;
    uint64_t v15 = &block_descriptor_21;
    uint64_t v9 = _Block_copy(&v12);
    swift_retain();
    swift_release();
    objc_msgSend(v7, sel_remote_fireOnceWithCompletion_, v9);
    swift_unknownObjectRelease();
    _Block_release(v9);
  }
  else
  {
    uint64_t v10 = swift_allocObject();
    *(void *)(v10 + 16) = a2;
    *(void *)(v10 + 24) = a3;
    uint64_t v16 = sub_1E0122BB0;
    uint64_t v17 = v10;
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 1107296256;
    uint64_t v14 = sub_1E0121424;
    uint64_t v15 = &block_descriptor_15;
    uint64_t v11 = _Block_copy(&v12);
    swift_retain();
    swift_release();
    objc_msgSend(v7, sel_remote_resetAndFireWithCompletion_, v11);
    _Block_release(v11);
    swift_unknownObjectRelease();
  }
}

uint64_t sub_1E0121664(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = a1;
  *(void *)(v4 + 24) = a2;
  swift_retain();
  uint64_t v5 = (void *)sub_1E011A448((uint64_t)sub_1E0122698, v4);
  swift_release();
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = a1;
  *(void *)(v6 + 24) = a2;
  v9[4] = sub_1E01226C8;
  v9[5] = v6;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 1107296256;
  v9[2] = sub_1E0121798;
  v9[3] = &block_descriptor_30;
  uint64_t v7 = _Block_copy(v9);
  swift_retain();
  swift_release();
  objc_msgSend(v5, sel_remote_fetchOrchestrationStatusWithCompletion_, v7);
  _Block_release(v7);
  return swift_unknownObjectRelease();
}

uint64_t sub_1E0121798(uint64_t a1)
{
  os_log_type_t v1 = *(void (**)(uint64_t, uint64_t))(a1 + 32);
  uint64_t v2 = sub_1E0138190();
  uint64_t v4 = v3;
  swift_retain();
  v1(v2, v4);
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1E0121804(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = a1;
  *(void *)(v4 + 24) = a2;
  swift_retain();
  uint64_t v5 = (void *)sub_1E011A448((uint64_t)sub_1E01226F4, v4);
  swift_release();
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = a1;
  *(void *)(v6 + 24) = a2;
  v9[4] = sub_1E0122720;
  v9[5] = v6;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 1107296256;
  v9[2] = sub_1E0121938;
  v9[3] = &block_descriptor_39;
  uint64_t v7 = _Block_copy(v9);
  swift_retain();
  swift_release();
  objc_msgSend(v5, sel_remote_fetchOrchestrationGraphWithCompletion_, v7);
  _Block_release(v7);
  return swift_unknownObjectRelease();
}

uint64_t sub_1E0121938(uint64_t a1)
{
  os_log_type_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = sub_1E01382C0();
  swift_retain();
  v1(v2);
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1E01219A8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = a1;
  *(void *)(v4 + 24) = a2;
  swift_retain();
  uint64_t v5 = (void *)sub_1E011A448((uint64_t)sub_1E012274C, v4);
  swift_release();
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = a1;
  *(void *)(v6 + 24) = a2;
  v9[4] = sub_1E0122798;
  v9[5] = v6;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 1107296256;
  v9[2] = sub_1E0121ADC;
  v9[3] = &block_descriptor_48;
  uint64_t v7 = _Block_copy(v9);
  swift_retain();
  swift_release();
  objc_msgSend(v5, sel_remote_deleteCacheAndTerminateWithCompletion_, v7);
  _Block_release(v7);
  return swift_unknownObjectRelease();
}

void sub_1E0121ADC(uint64_t a1, void *a2)
{
}

uint64_t sub_1E0121AE4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = a1;
  *(void *)(v4 + 24) = a2;
  swift_retain();
  uint64_t v5 = (void *)sub_1E011A448((uint64_t)sub_1E01227C0, v4);
  swift_release();
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = a1;
  *(void *)(v6 + 24) = a2;
  v9[4] = sub_1E01227E8;
  v9[5] = v6;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 1107296256;
  v9[2] = sub_1E0121424;
  v9[3] = &block_descriptor_57;
  uint64_t v7 = _Block_copy(v9);
  swift_retain();
  swift_release();
  objc_msgSend(v5, sel_remote_cancelAllGenerationWithCompletion_, v7);
  _Block_release(v7);
  return swift_unknownObjectRelease();
}

void sub_1E0121C18(uint64_t a1, void *a2)
{
}

void sub_1E0121C20(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3(a2);
  swift_release();
}

void sub_1E0121C90(void *a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = a4;
  *(void *)(v10 + 24) = a5;
  swift_retain();
  uint64_t v11 = (void *)sub_1E011A448((uint64_t)sub_1E0122BAC, v10);
  swift_release();
  if (a1) {
    a1 = (void *)sub_1E01382B0();
  }
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = a4;
  *(void *)(v12 + 24) = a5;
  v14[4] = sub_1E01227C0;
  v14[5] = v12;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 1107296256;
  v14[2] = sub_1E0121C18;
  v14[3] = &block_descriptor_72;
  uint64_t v13 = _Block_copy(v14);
  swift_retain();
  swift_release();
  objc_msgSend(v11, sel_remote_runBackgroundGenerationWithPlugins_commitAsUrgent_generationType_completion_, a1, a2 & 1, a3, v13);
  _Block_release(v13);
  swift_unknownObjectRelease();
}

uint64_t sub_1E0121E08(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = a1;
  *(void *)(v4 + 24) = a2;
  swift_retain();
  uint64_t v5 = (void *)sub_1E011A448((uint64_t)sub_1E0122BAC, v4);
  swift_release();
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = a1;
  *(void *)(v6 + 24) = a2;
  v9[4] = sub_1E0122BB0;
  v9[5] = v6;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 1107296256;
  v9[2] = sub_1E0121424;
  v9[3] = &block_descriptor_81;
  uint64_t v7 = _Block_copy(v9);
  swift_retain();
  swift_release();
  objc_msgSend(v5, sel_remote_requestBackgroundGenerationForFeedItemsAfterUnlockWithCompletion_, v7);
  _Block_release(v7);
  return swift_unknownObjectRelease();
}

uint64_t sub_1E0121F3C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = a1;
  *(void *)(v4 + 24) = a2;
  swift_retain();
  uint64_t v5 = (void *)sub_1E011A448((uint64_t)sub_1E0122BAC, v4);
  swift_release();
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = a1;
  *(void *)(v6 + 24) = a2;
  v9[4] = sub_1E0122BB0;
  v9[5] = v6;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 1107296256;
  v9[2] = sub_1E0121424;
  v9[3] = &block_descriptor_90;
  uint64_t v7 = _Block_copy(v9);
  swift_retain();
  swift_release();
  objc_msgSend(v5, sel_remote_requestBackgroundGenerationForAllModelsAfterUnlockWithCompletion_, v7);
  _Block_release(v7);
  return swift_unknownObjectRelease();
}

uint64_t sub_1E0122070(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = a1;
  *(void *)(v4 + 24) = a2;
  swift_retain();
  uint64_t v5 = (void *)sub_1E011A448((uint64_t)sub_1E0122BAC, v4);
  swift_release();
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = a1;
  *(void *)(v6 + 24) = a2;
  v9[4] = sub_1E0122BB0;
  v9[5] = v6;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 1107296256;
  v9[2] = sub_1E0121424;
  v9[3] = &block_descriptor_99;
  uint64_t v7 = _Block_copy(v9);
  swift_retain();
  swift_release();
  objc_msgSend(v5, sel_remote_runOrRequestBackgroundGenerationWithCompletion_, v7);
  _Block_release(v7);
  return swift_unknownObjectRelease();
}

id HealthAppOrchestrationClient.__deallocating_deinit()
{
  swift_unknownObjectWeakAssign();
  objc_msgSend(*(id *)&v0[OBJC_IVAR____TtC17HealthAppServices28HealthAppOrchestrationClient_connection], sel_invalidate);
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for HealthAppOrchestrationClient();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1E01222D0(void *a1, void *a2, uint64_t (*a3)(void))
{
  if (qword_1EC05B670 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_1E0138140();
  __swift_project_value_buffer(v6, (uint64_t)qword_1EC05B758);
  id v7 = a2;
  id v8 = a1;
  id v9 = v7;
  id v10 = a1;
  uint64_t v11 = sub_1E0138120();
  os_log_type_t v12 = sub_1E0138300();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = swift_slowAlloc();
    uint64_t v14 = swift_slowAlloc();
    uint64_t v25 = v14;
    *(_DWORD *)uint64_t v13 = 136315394;
    id v15 = v9;
    id v16 = objc_msgSend(v15, sel_description);
    long long v24 = a3;
    uint64_t v17 = sub_1E0138190();
    unint64_t v19 = v18;

    sub_1E012BBD0(v17, v19, &v25);
    sub_1E0138340();

    swift_bridgeObjectRelease();
    *(_WORD *)(v13 + 12) = 2080;
    id v20 = a1;
    sub_1E0122AAC();
    uint64_t v21 = sub_1E01381B0();
    sub_1E012BBD0(v21, v22, &v25);
    a3 = v24;
    sub_1E0138340();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_1E0118000, v11, v12, "%s: remoteObjectProxyWithErrorHandler error: %s", (uint8_t *)v13, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x1E01F1830](v14, -1, -1);
    MEMORY[0x1E01F1830](v13, -1, -1);
  }
  else
  {
  }
  return a3(a1);
}

void sub_1E0122558(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

uint64_t sub_1E01225C0()
{
  sub_1E0122A00(v0 + 16);
  return swift_deallocClassInstance();
}

uint64_t sub_1E01225F8()
{
  return MEMORY[0x1F4186498](v0, 24, 7);
}

void sub_1E0122608()
{
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

uint64_t sub_1E0122618()
{
  _Block_release(*(const void **)(v0 + 16));
  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_1E0122650()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

uint64_t sub_1E0122660()
{
  swift_release();
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1E0122698(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t, void, uint64_t))(v1 + 16))(a1, 0, 1);
}

uint64_t sub_1E01226C8(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, void))(v2 + 16))(a1, a2, 0);
}

uint64_t sub_1E01226F4(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 16))(a1, 1);
}

uint64_t sub_1E0122720(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t, void))(v1 + 16))(a1, 0);
}

void sub_1E012274C()
{
  uint64_t v1 = *(void (**)(void))(v0 + 16);
  id v2 = (id)sub_1E0137FE0();
  v1();
}

uint64_t sub_1E0122798()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_1E01227C0()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_1E01227E8()
{
  return (*(uint64_t (**)(void))(v0 + 16))(0);
}

uint64_t method lookup function for HealthAppOrchestrationClient(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for HealthAppOrchestrationClient);
}

uint64_t dispatch thunk of HealthAppOrchestrationClient.fireOnce(resetErrors:completion:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x60))();
}

uint64_t dispatch thunk of HealthAppOrchestrationClient.fetchOrchestrationStatus(completion:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x68))();
}

uint64_t dispatch thunk of HealthAppOrchestrationClient.fetchOrchestrationGraph(completion:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x70))();
}

uint64_t dispatch thunk of HealthAppOrchestrationClient.deleteCacheAndTerminate(completion:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x78))();
}

uint64_t dispatch thunk of HealthAppOrchestrationClient.cancelAllGeneration(completion:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x80))();
}

uint64_t dispatch thunk of HealthAppOrchestrationClient.runBackgroundGeneration(plugins:commitAsUrgent:generationType:completion:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x90))();
}

uint64_t dispatch thunk of HealthAppOrchestrationClient.requestBackgroundGenerationForFeedItemsAfterUnlock(completion:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x98))();
}

uint64_t dispatch thunk of HealthAppOrchestrationClient.requestBackgroundGenerationForAllModelsAfterUnlock(completion:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xA0))();
}

uint64_t dispatch thunk of HealthAppOrchestrationClient.runOrRequestBackgroundGeneration(completion:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xA8))();
}

uint64_t sub_1E0122A00(uint64_t a1)
{
  return a1;
}

uint64_t sub_1E0122A28()
{
  swift_release();
  return MEMORY[0x1F4186498](v0, 40, 7);
}

uint64_t sub_1E0122A68(void *a1)
{
  return sub_1E01222D0(a1, *(void **)(v1 + 16), *(uint64_t (**)(void))(v1 + 24));
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

unint64_t sub_1E0122AAC()
{
  unint64_t result = qword_1EACE1890;
  if (!qword_1EACE1890)
  {
    unint64_t result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_1EACE1890);
  }
  return result;
}

uint64_t DeepLinkingDataConformable.healthAppBaseURL()(uint64_t a1, uint64_t a2)
{
  id v4 = self;
  id v5 = objc_msgSend(v4, sel_externalHealthAppURLScheme);
  sub_1E0138190();

  id v6 = objc_msgSend(v4, sel_externalHealthAppURLHost);
  sub_1E0138190();

  sub_1E01381F0();
  sub_1E01381F0();
  swift_bridgeObjectRelease();
  sub_1E01381F0();
  (*(void (**)(uint64_t, uint64_t))(a2 + 8))(a1, a2);
  sub_1E01381F0();
  swift_bridgeObjectRelease();
  sub_1E01380A0();
  return swift_bridgeObjectRelease();
}

uint64_t dispatch thunk of static DeepLinkingDataConformable.urlPath.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of DeepLinkingDataConformable.url()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of static DeepLinkingDataConformable.fromURL(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t dispatch thunk of DeepLinkingDataConformable.userActivity()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of static DeepLinkingDataConformable.fromUserActivity(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 40))();
}

HealthAppServices::HAUserActivity::UserActivityVersion __swiftcall NSUserActivityProtocol.versionInfo()()
{
  id v2 = v1;
  uint64_t v3 = (*(uint64_t (**)(void))(v0 + 32))();
  if (!v3)
  {
    long long v10 = 0u;
    long long v11 = 0u;
LABEL_11:
    HealthAppServices::HAUserActivity::UserActivityVersion result = sub_1E0122E7C((uint64_t)&v10);
LABEL_12:
    BOOL v8 = 0;
    goto LABEL_13;
  }
  uint64_t v4 = v3;
  sub_1E01383E0();
  if (*(void *)(v4 + 16) && (unint64_t v5 = sub_1E011AF6C((uint64_t)v9), (v6 & 1) != 0))
  {
    sub_1E011AEA8(*(void *)(v4 + 56) + 32 * v5, (uint64_t)&v10);
  }
  else
  {
    long long v10 = 0u;
    long long v11 = 0u;
  }
  swift_bridgeObjectRelease();
  sub_1E0120314((uint64_t)v9);
  if (!*((void *)&v11 + 1)) {
    goto LABEL_11;
  }
  HealthAppServices::HAUserActivity::UserActivityVersion result = swift_dynamicCast();
  if ((result & 1) == 0 || !v9[0]) {
    goto LABEL_12;
  }
  BOOL v8 = v9[0] == 1;
LABEL_13:
  *id v2 = v8;
  return result;
}

uint64_t sub_1E0122E7C(uint64_t a1)
{
  sub_1E0122ED8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_1E0122ED8()
{
  if (!qword_1EACE1858)
  {
    unint64_t v0 = sub_1E0138330();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EACE1858);
    }
  }
}

Swift::String_optional __swiftcall NSUserActivityProtocol.fetchUpToDatePluginIdForActivity(since:)(HealthAppServices::HAUserActivity::UserActivityVersion since)
{
  int v2 = *(unsigned __int8 *)since;
  uint64_t v3 = (*(uint64_t (**)())(v1 + 32))();
  if (!v3)
  {
    long long v13 = 0u;
    long long v14 = 0u;
LABEL_18:
    sub_1E0122E7C((uint64_t)&v13);
    goto LABEL_19;
  }
  uint64_t v4 = v3;
  sub_1E01383E0();
  if (*(void *)(v4 + 16) && (unint64_t v5 = sub_1E011AF6C((uint64_t)v12), (v6 & 1) != 0))
  {
    sub_1E011AEA8(*(void *)(v4 + 56) + 32 * v5, (uint64_t)&v13);
  }
  else
  {
    long long v13 = 0u;
    long long v14 = 0u;
  }
  swift_bridgeObjectRelease();
  sub_1E0120314((uint64_t)v12);
  if (!*((void *)&v14 + 1)) {
    goto LABEL_18;
  }
  sub_1E0123110();
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_19:
    uint64_t v9 = 0;
    long long v10 = 0;
    goto LABEL_20;
  }
  id v7 = v12[0];
  if (objc_msgSend(v12[0], sel_integerValue) == (id)63) {
    int v8 = v2;
  }
  else {
    int v8 = 1;
  }

  if (v8) {
    uint64_t v9 = 0;
  }
  else {
    uint64_t v9 = 0xD000000000000015;
  }
  if (v8) {
    long long v10 = 0;
  }
  else {
    long long v10 = (void *)0x80000001E013ABD0;
  }
LABEL_20:
  result.value._object = v10;
  result.value._countAndFlagsBits = v9;
  return result;
}

id NSUserActivityProtocol<>.ensureLatestVersionAndUpgradeIfNeeded()()
{
  NSUserActivityProtocol.versionInfo()();
  if (v3[16])
  {
    unint64_t v0 = v2;
  }
  else
  {
    v3[0] = 0;
    unint64_t v0 = sub_1E0123150(v3);
  }
  return v0;
}

unint64_t sub_1E0123110()
{
  unint64_t result = qword_1EACE1898;
  if (!qword_1EACE1898)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EACE1898);
  }
  return result;
}

void *sub_1E0123150(char *a1)
{
  int v2 = v1;
  char v3 = *a1;
  sub_1E011AF14();
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1E01391C0;
  unint64_t v13 = 0xEA00000000007965;
  uint64_t v5 = MEMORY[0x1E4FBB1A0];
  sub_1E01383E0();
  *(void *)(inited + 96) = MEMORY[0x1E4FBB550];
  *(void *)(inited + 72) = 1;
  sub_1E011A200(inited);
  char v6 = (void *)sub_1E0138150();
  swift_bridgeObjectRelease();
  objc_msgSend(v2, sel_addUserInfoEntriesFromDictionary_, v6);

  uint64_t v12 = (uint64_t)v2;
  char v11 = v3;
  Swift::String_optional v7 = NSUserActivityProtocol.fetchUpToDatePluginIdForActivity(since:)((HealthAppServices::HAUserActivity::UserActivityVersion)&v11);
  if (v7.value._object)
  {
    uint64_t v8 = swift_initStackObject();
    *(_OWORD *)(v8 + 16) = xmmword_1E01391C0;
    uint64_t v12 = 0x614E656C646E7562;
    unint64_t v13 = 0xEA0000000000656DLL;
    sub_1E01383E0();
    *(void *)(v8 + 96) = v5;
    *(Swift::String_optional *)(v8 + 72) = v7;
    sub_1E011A200(v8);
    uint64_t v9 = (void *)sub_1E0138150();
    swift_bridgeObjectRelease();
    objc_msgSend(v2, sel_addUserInfoEntriesFromDictionary_, v9);
  }
  return v2;
}

uint64_t SharingUUIDDeepLinkingParameter.value.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_1E0138110();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);
  return v4(a1, v1, v3);
}

uint64_t SharingUUIDDeepLinkingParameter.value.setter(uint64_t a1)
{
  uint64_t v3 = sub_1E0138110();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 40);
  return v4(v1, a1, v3);
}

uint64_t (*SharingUUIDDeepLinkingParameter.value.modify())()
{
  return nullsub_1;
}

void sub_1E0123424()
{
  qword_1EACE18A0 = 0x55676E6972616873;
  *(void *)algn_1EACE18A8 = 0xEB00000000444955;
}

uint64_t static SharingUUIDDeepLinkingParameter.keyName.getter()
{
  return sub_1E01237E0(&qword_1EACE17F8, &qword_1EACE18A0);
}

uint64_t static SharingUUIDDeepLinkingParameter.keyName.setter(uint64_t a1, uint64_t a2)
{
  return sub_1E0123878(a1, a2, &qword_1EACE17F8, &qword_1EACE18A0, algn_1EACE18A8);
}

uint64_t (*static SharingUUIDDeepLinkingParameter.keyName.modify())()
{
  if (qword_1EACE17F8 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t SharingUUIDDeepLinkingParameter.init(value:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_1E0138110();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32);
  return v5(a2, a1, v4);
}

uint64_t sub_1E0123594@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_1E0138110();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32);
  return v5(a2, a1, v4);
}

uint64_t sub_1E0123600(uint64_t a1, uint64_t a2)
{
  return sub_1E0124B44(a1, a2, &qword_1EACE17F8, &qword_1EACE18A0);
}

uint64_t sub_1E0123628@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_1E0138110();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);
  return v4(a1, v1, v3);
}

uint64_t sub_1E0123690(uint64_t a1)
{
  uint64_t v3 = sub_1E0138110();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 40);
  return v4(v1, a1, v3);
}

uint64_t SharingManagementURLData.sharingUUIDParameter.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1E0123704(v1, a1);
}

uint64_t sub_1E0123704(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SharingUUIDDeepLinkingParameter(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t type metadata accessor for SharingUUIDDeepLinkingParameter(uint64_t a1)
{
  return sub_1E0124E20(a1, (uint64_t *)&unk_1EACE18D0);
}

void sub_1E0123788()
{
  algn_1EACE18B8[7] = -18;
}

uint64_t static SharingManagementURLData.urlPath.getter()
{
  return sub_1E01237E0(&qword_1EACE1800, &qword_1EACE18B0);
}

uint64_t sub_1E01237E0(void *a1, uint64_t *a2)
{
  if (*a1 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v3 = *a2;
  swift_bridgeObjectRetain();
  return v3;
}

uint64_t static SharingManagementURLData.urlPath.setter(uint64_t a1, uint64_t a2)
{
  return sub_1E0123878(a1, a2, &qword_1EACE1800, &qword_1EACE18B0, algn_1EACE18B8);
}

uint64_t sub_1E0123878(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  if (*a3 != -1) {
    swift_once();
  }
  swift_beginAccess();
  *a4 = a1;
  *a5 = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*static SharingManagementURLData.urlPath.modify())()
{
  if (qword_1EACE1800 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t SharingManagementURLData.init(sharingUUIDParameter:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1E0123984(a1, a2);
}

uint64_t sub_1E0123984(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SharingUUIDDeepLinkingParameter(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t static SharingManagementURLData.isSharingProfile(_:)(void *a1)
{
  id v1 = objc_msgSend(a1, sel_activityType);
  uint64_t v2 = sub_1E0138190();
  uint64_t v4 = v3;

  uint64_t v5 = qword_1F3B54CA8;
  if (qword_1F3B54CA8)
  {
    char v6 = &byte_1F3B54CB8;
    while (1)
    {
      ++v6;
      if (DeepLinkActivityType.userActivityType.getter() == v2 && v7 == v4) {
        break;
      }
      char v9 = sub_1E01384F0();
      swift_bridgeObjectRelease();
      if (v9) {
        goto LABEL_11;
      }
      if (!--v5) {
        goto LABEL_9;
      }
    }
    swift_bridgeObjectRelease();
LABEL_11:
    swift_bridgeObjectRelease();
    uint64_t v11 = DeepLinkActivityType.rawValue.getter();
    uint64_t v13 = v12;
    id v14 = objc_msgSend(self, sel_healthAppSharingProfilePath);
    uint64_t v15 = sub_1E0138190();
    uint64_t v17 = v16;

    if (v11 == v15 && v13 == v17) {
      char v10 = 1;
    }
    else {
      char v10 = sub_1E01384F0();
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
LABEL_9:
    swift_bridgeObjectRelease();
    char v10 = 0;
  }
  return v10 & 1;
}

uint64_t SharingManagementURLData.url()@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_1E0137ED0();
  uint64_t v26 = *(void *)(v3 - 8);
  uint64_t v27 = v3;
  MEMORY[0x1F4188790](v3);
  uint64_t v5 = (char *)&v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1E0138110();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  char v9 = (char *)&v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1E0124D9C(0, (unint64_t *)&qword_1EACE1840, MEMORY[0x1E4F276F0], MEMORY[0x1E4FBB718]);
  MEMORY[0x1F4188790](v10 - 8);
  uint64_t v12 = (char *)&v25 - v11;
  uint64_t v13 = sub_1E01380B0();
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x1F4188790](v13);
  uint64_t v16 = (char *)&v25 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1E011F300();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13) == 1)
  {
    sub_1E0124E58((uint64_t)v12, (unint64_t *)&qword_1EACE1840, MEMORY[0x1E4F276F0]);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56))(a1, 1, 1, v13);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v16, v12, v13);
    (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v1, v6);
    uint64_t v18 = _s10Foundation4UUIDV17HealthAppServicesE11toURLStringSSyF_0();
    uint64_t v20 = v19;
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    uint64_t v28 = v18;
    uint64_t v29 = v20;
    sub_1E0137EC0();
    sub_1E011FF24();
    uint64_t v21 = sub_1E0138360();
    uint64_t v23 = v22;
    (*(void (**)(char *, uint64_t))(v26 + 8))(v5, v27);
    swift_bridgeObjectRelease();
    if (qword_1EACE17F8 != -1) {
      swift_once();
    }
    swift_beginAccess();
    uint64_t v24 = *(void *)algn_1EACE18A8;
    swift_bridgeObjectRetain();
    sub_1E012EC90(v24, v21, v23, a1);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return (*(uint64_t (**)(char *, uint64_t))(v14 + 8))(v16, v13);
  }
}

uint64_t static SharingManagementURLData.fromURL(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v66 = a2;
  uint64_t v3 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E4FBB718];
  sub_1E0124D9C(0, &qword_1EACE1850, MEMORY[0x1E4F27990], MEMORY[0x1E4FBB718]);
  MEMORY[0x1F4188790](v4 - 8);
  uint64_t v6 = (char *)&v54 - v5;
  uint64_t v7 = sub_1E0138110();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7);
  v61 = (char *)&v54 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_1E0137F10();
  uint64_t v65 = *(void *)(v10 - 8);
  uint64_t v11 = MEMORY[0x1F4188790](v10);
  uint64_t v13 = (char *)&v54 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v11);
  v63 = (char *)&v54 - v14;
  sub_1E0124D9C(0, &qword_1EACE18C0, type metadata accessor for SharingUUIDDeepLinkingParameter, v3);
  MEMORY[0x1F4188790](v15 - 8);
  uint64_t v17 = (char *)&v54 - v16;
  uint64_t v18 = type metadata accessor for SharingUUIDDeepLinkingParameter(0);
  uint64_t v64 = *(void *)(v18 - 8);
  MEMORY[0x1F4188790](v18);
  uint64_t v20 = (char *)&v54 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = type metadata accessor for HAURL();
  MEMORY[0x1F4188790](v21 - 8);
  uint64_t v23 = (char *)&v54 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = sub_1E01380B0();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v24 - 8) + 16))(v23, a1, v24);
  uint64_t v25 = HAURL.queryItems.getter();
  if (!v25)
  {
    sub_1E011FF78((uint64_t)v23);
    uint64_t v46 = v66;
LABEL_27:
    uint64_t v51 = type metadata accessor for SharingManagementURLData(0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v51 - 8) + 56))(v46, 1, 1, v51);
  }
  v62 = v23;
  uint64_t v59 = v8;
  uint64_t v26 = *(void *)(v25 + 16);
  if (!v26)
  {
    uint64_t v45 = 1;
    uint64_t v47 = v64;
    uint64_t v48 = (uint64_t)v62;
    uint64_t v46 = v66;
    goto LABEL_25;
  }
  uint64_t v56 = v18;
  v57 = v20;
  uint64_t v54 = v7;
  v55 = v6;
  v58 = v17;
  v67 = *(void (**)(char *, unint64_t, uint64_t))(v65 + 16);
  unint64_t v27 = v25 + ((*(unsigned __int8 *)(v65 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v65 + 80));
  uint64_t v28 = (void (**)(char *, uint64_t))(v65 + 8);
  uint64_t v29 = *(void *)(v65 + 72);
  uint64_t v60 = v25;
  swift_bridgeObjectRetain();
  while (1)
  {
    v67(v13, v27, v10);
    uint64_t v30 = sub_1E0137EF0();
    uint64_t v32 = v31;
    if (qword_1EACE17F8 != -1) {
      swift_once();
    }
    swift_beginAccess();
    if (v30 == qword_1EACE18A0 && v32 == *(void *)algn_1EACE18A8) {
      break;
    }
    char v34 = sub_1E01384F0();
    swift_bridgeObjectRelease();
    if (v34) {
      goto LABEL_16;
    }
    (*v28)(v13, v10);
    v27 += v29;
    if (!--v26)
    {
      swift_bridgeObjectRelease();
      uint64_t v45 = 1;
      uint64_t v46 = v66;
      uint64_t v20 = v57;
      uint64_t v17 = v58;
      uint64_t v18 = v56;
      uint64_t v47 = v64;
      uint64_t v48 = (uint64_t)v62;
      goto LABEL_25;
    }
  }
  swift_bridgeObjectRelease();
LABEL_16:
  swift_bridgeObjectRelease();
  uint64_t v35 = v65 + 32;
  v36 = v63;
  (*(void (**)(char *, char *, uint64_t))(v65 + 32))(v63, v13, v10);
  uint64_t v37 = sub_1E0137F00();
  uint64_t v39 = v38;
  (*(void (**)(char *, uint64_t))(v35 - 24))(v36, v10);
  uint64_t v41 = v54;
  uint64_t v40 = (uint64_t)v55;
  uint64_t v18 = v56;
  uint64_t v20 = v57;
  uint64_t v42 = v59;
  if (v39)
  {
    uint64_t v68 = v37;
    uint64_t v69 = v39;
    sub_1E011FF24();
    sub_1E0138380();
    uint64_t v44 = v43;
    swift_bridgeObjectRelease();
    uint64_t v17 = v58;
    if (v44)
    {
      _s10Foundation4UUIDV17HealthAppServicesE13fromURLStringyACSgSSFZ_0();
      swift_bridgeObjectRelease();
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v42 + 48))(v40, 1, v41) != 1)
      {
        v49 = *(void (**)(char *, uint64_t, uint64_t))(v42 + 32);
        v50 = v61;
        v49(v61, v40, v41);
        v49(v17, (uint64_t)v50, v41);
        uint64_t v45 = 0;
        goto LABEL_23;
      }
      sub_1E0124E58(v40, &qword_1EACE1850, MEMORY[0x1E4F27990]);
    }
    uint64_t v45 = 1;
LABEL_23:
    uint64_t v46 = v66;
    goto LABEL_24;
  }
  uint64_t v45 = 1;
  uint64_t v46 = v66;
  uint64_t v17 = v58;
LABEL_24:
  uint64_t v47 = v64;
  uint64_t v48 = (uint64_t)v62;
LABEL_25:
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v47 + 56))(v17, v45, 1, v18);
  swift_bridgeObjectRelease();
  sub_1E011FF78(v48);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v47 + 48))(v17, 1, v18) == 1)
  {
    sub_1E0124E58((uint64_t)v17, &qword_1EACE18C0, type metadata accessor for SharingUUIDDeepLinkingParameter);
    goto LABEL_27;
  }
  sub_1E0123984((uint64_t)v17, (uint64_t)v20);
  sub_1E0123984((uint64_t)v20, v46);
  uint64_t v53 = type metadata accessor for SharingManagementURLData(0);
  return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v53 - 8) + 56))(v46, 0, 1, v53);
}

NSUserActivity __swiftcall SharingManagementURLData.userActivity()()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for SharingUUIDDeepLinkingParameter(0);
  MEMORY[0x1F4188790](v2 - 8);
  uint64_t v4 = (char *)v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = 0;
  uint64_t v16 = 0xE000000000000000;
  sub_1E0138400();
  swift_bridgeObjectRelease();
  uint64_t v15 = 0x50676E6972616853;
  uint64_t v16 = 0xEF2E656C69666F72;
  sub_1E0123704(v0, (uint64_t)v4);
  uint64_t v5 = sub_1E0138110();
  sub_1E0124EC8();
  sub_1E01384D0();
  sub_1E01381F0();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(v5 - 8);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v4, v5);
  uint64_t v7 = v15;
  LOBYTE(v15) = 16;
  _s17HealthAppServices14HAUserActivityV06createE05title15restorationType17profileIdentifier17eligibleForSearch0lM7Handoff0lM10PredictionSo06NSUserE0CSS_AA08DeepLinkeI0OSo09HKProfileK0CSgS2bSgSbtFZ_0(v7, v16, (unsigned __int8 *)&v15, 0, 0, 2, 0);
  uint64_t v9 = v8;
  swift_bridgeObjectRelease();
  sub_1E0124D9C(0, (unint64_t *)&qword_1EC05B4F0, (uint64_t (*)(uint64_t))sub_1E011B148, MEMORY[0x1E4FBBE00]);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1E01391C0;
  if (qword_1EACE17F8 != -1) {
    swift_once();
  }
  swift_beginAccess();
  v14[0] = qword_1EACE18A0;
  v14[1] = *(void *)algn_1EACE18A8;
  swift_bridgeObjectRetain();
  sub_1E01383E0();
  *(void *)(inited + 96) = v5;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0((uint64_t *)(inited + 72));
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(v6 + 16))(boxed_opaque_existential_0, v1, v5);
  sub_1E011A200(inited);
  uint64_t v12 = (void *)sub_1E0138150();
  swift_bridgeObjectRelease();
  objc_msgSend(v9, sel_addUserInfoEntriesFromDictionary_, v12);

  return (NSUserActivity)v9;
}

uint64_t static SharingManagementURLData.fromUserActivity(_:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  sub_1E0124D9C(0, &qword_1EACE18C0, type metadata accessor for SharingUUIDDeepLinkingParameter, MEMORY[0x1E4FBB718]);
  MEMORY[0x1F4188790](v4 - 8);
  uint64_t v6 = (char *)&v14 - v5;
  uint64_t v7 = type metadata accessor for SharingUUIDDeepLinkingParameter(0);
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7);
  uint64_t v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1E011FB08(a1, v6);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
  {
    sub_1E0124E58((uint64_t)v6, &qword_1EACE18C0, type metadata accessor for SharingUUIDDeepLinkingParameter);
    uint64_t v11 = type metadata accessor for SharingManagementURLData(0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(a2, 1, 1, v11);
  }
  else
  {
    sub_1E0123984((uint64_t)v6, (uint64_t)v10);
    sub_1E0123984((uint64_t)v10, a2);
    uint64_t v13 = type metadata accessor for SharingManagementURLData(0);
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(a2, 0, 1, v13);
  }
}

uint64_t sub_1E0124B1C(uint64_t a1, uint64_t a2)
{
  return sub_1E0124B44(a1, a2, &qword_1EACE1800, &qword_1EACE18B0);
}

uint64_t sub_1E0124B44(uint64_t a1, uint64_t a2, void *a3, uint64_t *a4)
{
  if (*a3 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v5 = *a4;
  swift_bridgeObjectRetain();
  return v5;
}

uint64_t sub_1E0124BC4@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  sub_1E0124D9C(0, &qword_1EACE18C0, type metadata accessor for SharingUUIDDeepLinkingParameter, MEMORY[0x1E4FBB718]);
  MEMORY[0x1F4188790](v6 - 8);
  uint64_t v8 = (char *)&v15 - v7;
  uint64_t v9 = type metadata accessor for SharingUUIDDeepLinkingParameter(0);
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x1F4188790](v9);
  uint64_t v12 = (char *)&v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1E011FB08(a1, v8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) == 1)
  {
    sub_1E0124E58((uint64_t)v8, &qword_1EACE18C0, type metadata accessor for SharingUUIDDeepLinkingParameter);
    uint64_t v13 = 1;
  }
  else
  {
    sub_1E0123984((uint64_t)v8, (uint64_t)v12);
    sub_1E0123984((uint64_t)v12, a3);
    uint64_t v13 = 0;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a2 - 8) + 56))(a3, v13, 1, a2);
}

void sub_1E0124D9C(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v7 = a3(255);
    unint64_t v8 = a4(a1, v7);
    if (!v9) {
      atomic_store(v8, a2);
    }
  }
}

uint64_t type metadata accessor for SharingManagementURLData(uint64_t a1)
{
  return sub_1E0124E20(a1, (uint64_t *)&unk_1EC05B648);
}

uint64_t sub_1E0124E20(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1E0124E58(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t))
{
  sub_1E0124D9C(0, a2, a3, MEMORY[0x1E4FBB718]);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  return a1;
}

unint64_t sub_1E0124EC8()
{
  unint64_t result = qword_1EACE18C8;
  if (!qword_1EACE18C8)
  {
    sub_1E0138110();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EACE18C8);
  }
  return result;
}

uint64_t *__swift_allocate_boxed_opaque_existential_0(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

_UNKNOWN **sub_1E0124F84()
{
  return &protocol witness table for UUID;
}

uint64_t getEnumTagSinglePayload for SharingUUIDDeepLinkingParameter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1E0124FBC);
}

uint64_t sub_1E0124FBC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return __swift_get_extra_inhabitant_indexTm(a1, a2, a3, MEMORY[0x1E4F27990]);
}

uint64_t storeEnumTagSinglePayload for SharingUUIDDeepLinkingParameter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1E0124FE8);
}

uint64_t sub_1E0124FE8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_store_extra_inhabitant_indexTm(a1, a2, a3, a4, MEMORY[0x1E4F27990]);
}

uint64_t _s17HealthAppServices31SharingUUIDDeepLinkingParameterVwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1E0138110();
  uint64_t v5 = **(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8);
  return v5(a1, a2, v4);
}

uint64_t _s17HealthAppServices31SharingUUIDDeepLinkingParameterVwxx_0(uint64_t a1)
{
  uint64_t v2 = sub_1E0138110();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);
  return v3(a1, v2);
}

uint64_t _s17HealthAppServices31SharingUUIDDeepLinkingParameterVwcp_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1E0138110();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t _s17HealthAppServices31SharingUUIDDeepLinkingParameterVwca_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1E0138110();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t _s17HealthAppServices31SharingUUIDDeepLinkingParameterVwtk_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1E0138110();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t _s17HealthAppServices31SharingUUIDDeepLinkingParameterVwta_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1E0138110();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for SharingManagementURLData(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1E0125278);
}

uint64_t sub_1E0125278(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return __swift_get_extra_inhabitant_indexTm(a1, a2, a3, type metadata accessor for SharingUUIDDeepLinkingParameter);
}

uint64_t __swift_get_extra_inhabitant_indexTm(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a4(0);
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 48);
  return v7(a1, a2, v6);
}

uint64_t storeEnumTagSinglePayload for SharingManagementURLData(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1E0125314);
}

uint64_t sub_1E0125314(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_store_extra_inhabitant_indexTm(a1, a2, a3, a4, type metadata accessor for SharingUUIDDeepLinkingParameter);
}

uint64_t __swift_store_extra_inhabitant_indexTm(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(void))
{
  uint64_t v7 = a5(0);
  unint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
  return v8(a1, a2, a2, v7);
}

uint64_t sub_1E01253A0()
{
  uint64_t result = sub_1E0138110();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t URLParameterConvertible<>.toURLString()()
{
  return sub_1E01384D0();
}

uint64_t static String.fromURLString(_:)(uint64_t a1)
{
  return a1;
}

uint64_t sub_1E0125468()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_1E0125498@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  *a3 = a1;
  a3[1] = a2;
  return swift_bridgeObjectRetain();
}

uint64_t dispatch thunk of URLParameterConvertible.toURLString()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of static URLParameterConvertible.fromURLString(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 16))();
}

uint64_t HAURL.init(url:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_1E01380B0();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32);
  return v5(a2, a1, v4);
}

uint64_t HAURL.queryItems.getter()
{
  uint64_t v1 = type metadata accessor for HAURL();
  uint64_t v2 = MEMORY[0x1F4188790](v1);
  uint64_t v4 = (char *)&v26 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v2);
  uint64_t v6 = (char *)&v26 - v5;
  uint64_t v7 = sub_1E0138140();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7);
  uint64_t v10 = (char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v11 = objc_allocWithZone(MEMORY[0x1E4F29088]);
  uint64_t v12 = (void *)sub_1E0138040();
  id v13 = objc_msgSend(v11, sel_initWithURL_resolvingAgainstBaseURL_, v12, 0);

  if (v13)
  {
    id v14 = objc_msgSend(v13, sel_queryItems);
    if (v14)
    {
      uint64_t v15 = v14;
      sub_1E0137F10();
      uint64_t v16 = sub_1E01382C0();

      return v16;
    }
  }
  if (qword_1EC05B670 != -1) {
    swift_once();
  }
  uint64_t v17 = __swift_project_value_buffer(v7, (uint64_t)qword_1EC05B758);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, v17, v7);
  sub_1E012BB6C(v0, (uint64_t)v6);
  uint64_t v18 = sub_1E0138120();
  os_log_type_t v19 = sub_1E0138300();
  if (os_log_type_enabled(v18, v19))
  {
    uint64_t v20 = swift_slowAlloc();
    uint64_t v26 = swift_slowAlloc();
    uint64_t v29 = v26;
    *(_DWORD *)uint64_t v20 = 136315394;
    uint64_t v21 = sub_1E012BBD0(0x4C52554148, 0xE500000000000000, &v29);
    uint64_t v27 = v8;
    uint64_t v28 = v21;
    sub_1E0138340();
    *(_WORD *)(v20 + 12) = 2080;
    sub_1E012BB6C((uint64_t)v6, (uint64_t)v4);
    uint64_t v22 = sub_1E01381B0();
    uint64_t v28 = sub_1E012BBD0(v22, v23, &v29);
    sub_1E0138340();
    swift_bridgeObjectRelease();
    sub_1E012C2E4((uint64_t)v6, (uint64_t (*)(void))type metadata accessor for HAURL);
    _os_log_impl(&dword_1E0118000, v18, v19, "[%s] Could not resolve query items for URL: %s", (uint8_t *)v20, 0x16u);
    uint64_t v24 = v26;
    swift_arrayDestroy();
    MEMORY[0x1E01F1830](v24, -1, -1);
    MEMORY[0x1E01F1830](v20, -1, -1);

    (*(void (**)(char *, uint64_t))(v27 + 8))(v10, v7);
  }
  else
  {
    sub_1E012C2E4((uint64_t)v6, (uint64_t (*)(void))type metadata accessor for HAURL);

    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  }
  return 0;
}

uint64_t HAURL.url.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_1E01380B0();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);
  return v4(a1, v1, v3);
}

id HAURL.objectType.getter()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for HAURL();
  MEMORY[0x1F4188790](v2 - 8);
  uint64_t v4 = (char *)v36 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for HAURLValidator();
  MEMORY[0x1F4188790](v5 - 8);
  uint64_t v7 = (char *)v36 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1E01380B0();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 16))(v7, v0, v8);
  uint64_t v9 = sub_1E0138090();
  if (!v10)
  {
    sub_1E012BB6C(v0, (uint64_t)v4);
    goto LABEL_8;
  }
  v36[2] = v9;
  v36[3] = v10;
  id v11 = objc_msgSend(self, sel_internalHealthAppURLScheme);
  uint64_t v12 = sub_1E0138190();
  uint64_t v14 = v13;

  v36[0] = v12;
  v36[1] = v14;
  sub_1E011FF24();
  uint64_t v15 = sub_1E0138370();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1E012BB6C(v1, (uint64_t)v4);
  if (v15)
  {
LABEL_8:
    sub_1E012C2E4((uint64_t)v4, (uint64_t (*)(void))type metadata accessor for HAURL);
    goto LABEL_9;
  }
  uint64_t v16 = sub_1E0138070();
  uint64_t v18 = v17;
  id v19 = objc_msgSend(self, sel_sampleTypeHostName);
  uint64_t v20 = sub_1E0138190();
  uint64_t v22 = v21;

  if (v18)
  {
    if (v16 == v20 && v18 == v22)
    {
      swift_bridgeObjectRelease();
      sub_1E012C2E4((uint64_t)v4, (uint64_t (*)(void))type metadata accessor for HAURL);
      swift_bridgeObjectRelease();
LABEL_16:
      id v28 = sub_1E0125D3C();
      goto LABEL_17;
    }
    char v34 = sub_1E01384F0();
    swift_bridgeObjectRelease();
    sub_1E012C2E4((uint64_t)v4, (uint64_t (*)(void))type metadata accessor for HAURL);
    swift_bridgeObjectRelease();
    if (v34) {
      goto LABEL_16;
    }
  }
  else
  {
    sub_1E012C2E4((uint64_t)v4, (uint64_t (*)(void))type metadata accessor for HAURL);
    swift_bridgeObjectRelease();
  }
LABEL_9:
  unint64_t v23 = self;
  id v24 = objc_msgSend(v23, sel_sampleTypeHostName);
  uint64_t v25 = sub_1E0138190();
  uint64_t v27 = v26;

  LOBYTE(v24) = sub_1E0135590(v1, v25, v27);
  swift_bridgeObjectRelease();
  if (v24)
  {
    id v28 = sub_1E0126188();
LABEL_17:
    id v33 = v28;
    goto LABEL_18;
  }
  id v29 = objc_msgSend(v23, sel_dataTypeDetailHostName);
  uint64_t v30 = sub_1E0138190();
  uint64_t v32 = v31;

  LOBYTE(v29) = sub_1E0135590(v1, v30, v32);
  swift_bridgeObjectRelease();
  if (v29)
  {
    id v28 = sub_1E0126660();
    goto LABEL_17;
  }
  id v33 = 0;
LABEL_18:
  sub_1E012C2E4((uint64_t)v7, (uint64_t (*)(void))type metadata accessor for HAURLValidator);
  return v33;
}

id sub_1E0125D3C()
{
  uint64_t v1 = type metadata accessor for HAURL();
  MEMORY[0x1F4188790](v1 - 8);
  uint64_t v3 = &v24[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v4 = sub_1E0138140();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = &v24[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v8 = (void *)sub_1E0138020();
  uint64_t v9 = v8;
  if (v8[2] != 2) {
    goto LABEL_10;
  }
  uint64_t v11 = v8[4];
  unint64_t v10 = v8[5];
  swift_bridgeObjectRetain();
  if (!v10) {
    goto LABEL_10;
  }
  if (v11 == 47 && v10 == 0xE100000000000000)
  {
    swift_bridgeObjectRelease();
    goto LABEL_7;
  }
  uint64_t v11 = sub_1E01384F0();
  swift_bridgeObjectRelease();
  if ((v11 & 1) == 0)
  {
LABEL_10:
    swift_bridgeObjectRelease();
    return 0;
  }
LABEL_7:
  if (v9[2] < 2uLL)
  {
    __break(1u);
    goto LABEL_19;
  }
  uint64_t v11 = v9[6];
  unint64_t v10 = v9[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v12 = self;
  uint64_t v13 = (void *)sub_1E0138170();
  id v14 = objc_msgSend(v12, sel__typeWithIdentifier_, v13);

  if (!v14)
  {
    if (qword_1EC05B670 == -1)
    {
LABEL_14:
      uint64_t v16 = __swift_project_value_buffer(v4, (uint64_t)qword_1EC05B758);
      (*(void (**)(unsigned char *, uint64_t, uint64_t))(v5 + 16))(v7, v16, v4);
      sub_1E012BB6C(v0, (uint64_t)v3);
      swift_bridgeObjectRetain();
      uint64_t v17 = sub_1E0138120();
      os_log_type_t v18 = sub_1E0138300();
      int v19 = v18;
      if (os_log_type_enabled(v17, v18))
      {
        uint64_t v20 = swift_slowAlloc();
        uint64_t v26 = swift_slowAlloc();
        uint64_t v28 = v26;
        *(_DWORD *)uint64_t v20 = 136315651;
        int v25 = v19;
        uint64_t v27 = sub_1E012BBD0(0x4C52554148, 0xE500000000000000, &v28);
        sub_1E0138340();
        *(_WORD *)(v20 + 12) = 2082;
        swift_bridgeObjectRetain();
        uint64_t v27 = sub_1E012BBD0(v11, v10, &v28);
        sub_1E0138340();
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v20 + 22) = 2081;
        uint64_t v21 = sub_1E0138010();
        uint64_t v27 = sub_1E012BBD0(v21, v22, &v28);
        sub_1E0138340();
        swift_bridgeObjectRelease();
        sub_1E012C2E4((uint64_t)v3, (uint64_t (*)(void))type metadata accessor for HAURL);
        _os_log_impl(&dword_1E0118000, v17, (os_log_type_t)v25, "%s Invalid type identifier %{public}s provided in URL %{private}s", (uint8_t *)v20, 0x20u);
        uint64_t v23 = v26;
        swift_arrayDestroy();
        MEMORY[0x1E01F1830](v23, -1, -1);
        MEMORY[0x1E01F1830](v20, -1, -1);
      }
      else
      {
        swift_bridgeObjectRelease_n();
        sub_1E012C2E4((uint64_t)v3, (uint64_t (*)(void))type metadata accessor for HAURL);
      }

      (*(void (**)(unsigned char *, uint64_t))(v5 + 8))(v7, v4);
      return 0;
    }
LABEL_19:
    swift_once();
    goto LABEL_14;
  }
  swift_bridgeObjectRelease();
  return v14;
}

id sub_1E0126188()
{
  uint64_t v1 = type metadata accessor for HAURL();
  MEMORY[0x1F4188790](v1 - 8);
  uint64_t v3 = (char *)&v30 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_1E0138140();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)&v30 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = (void *)sub_1E0138020();
  uint64_t v9 = v8;
  if (v8[2] != 3) {
    goto LABEL_14;
  }
  BOOL v10 = v8[4] == 47 && v8[5] == 0xE100000000000000;
  if (!v10 && (sub_1E01384F0() & 1) == 0) {
    goto LABEL_14;
  }
  uint64_t v31 = v5;
  uint64_t v12 = v9[6];
  unint64_t v11 = v9[7];
  uint64_t v13 = self;
  swift_bridgeObjectRetain();
  id v14 = objc_msgSend(v13, sel_sampleTypeHostName);
  uint64_t v15 = sub_1E0138190();
  uint64_t v17 = v16;

  if (v12 == v15 && v11 == v17)
  {
    swift_bridgeObjectRelease_n();
    goto LABEL_11;
  }
  uint64_t v12 = sub_1E01384F0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v12 & 1) == 0)
  {
LABEL_14:
    swift_bridgeObjectRelease();
    return 0;
  }
LABEL_11:
  if (v9[2] < 3uLL)
  {
    __break(1u);
LABEL_22:
    swift_once();
LABEL_18:
    uint64_t v22 = __swift_project_value_buffer(v4, (uint64_t)qword_1EC05B758);
    uint64_t v23 = v31;
    (*(void (**)(char *, uint64_t, uint64_t))(v31 + 16))(v7, v22, v4);
    sub_1E012BB6C(v0, (uint64_t)v3);
    swift_bridgeObjectRetain();
    id v24 = sub_1E0138120();
    os_log_type_t v25 = sub_1E0138300();
    if (os_log_type_enabled(v24, v25))
    {
      uint64_t v26 = swift_slowAlloc();
      uint64_t v30 = swift_slowAlloc();
      uint64_t v33 = v30;
      *(_DWORD *)uint64_t v26 = 136315651;
      uint64_t v32 = sub_1E012BBD0(0x4C52554148, 0xE500000000000000, &v33);
      sub_1E0138340();
      *(_WORD *)(v26 + 12) = 2082;
      swift_bridgeObjectRetain();
      uint64_t v32 = sub_1E012BBD0(v12, v11, &v33);
      sub_1E0138340();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v26 + 22) = 2081;
      uint64_t v27 = sub_1E0138010();
      uint64_t v32 = sub_1E012BBD0(v27, v28, &v33);
      sub_1E0138340();
      swift_bridgeObjectRelease();
      sub_1E012C2E4((uint64_t)v3, (uint64_t (*)(void))type metadata accessor for HAURL);
      _os_log_impl(&dword_1E0118000, v24, v25, "%s Invalid type identifier %{public}s provided in URL %{private}s", (uint8_t *)v26, 0x20u);
      uint64_t v29 = v30;
      swift_arrayDestroy();
      MEMORY[0x1E01F1830](v29, -1, -1);
      MEMORY[0x1E01F1830](v26, -1, -1);

      (*(void (**)(char *, uint64_t))(v31 + 8))(v7, v4);
    }
    else
    {
      swift_bridgeObjectRelease_n();
      sub_1E012C2E4((uint64_t)v3, (uint64_t (*)(void))type metadata accessor for HAURL);

      (*(void (**)(char *, uint64_t))(v23 + 8))(v7, v4);
    }
    return 0;
  }
  uint64_t v12 = v9[8];
  unint64_t v11 = v9[9];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  os_log_type_t v18 = self;
  int v19 = (void *)sub_1E0138170();
  id v20 = objc_msgSend(v18, sel__typeWithIdentifier_, v19);

  if (!v20)
  {
    if (qword_1EC05B670 == -1) {
      goto LABEL_18;
    }
    goto LABEL_22;
  }
  swift_bridgeObjectRelease();
  return v20;
}

id sub_1E0126660()
{
  uint64_t v0 = sub_1E0137F10();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1F4188790](v0);
  uint64_t v3 = (char *)&v59 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = (uint64_t (*)(uint64_t))MEMORY[0x1E4F26ED8];
  uint64_t v5 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E4FBB718];
  sub_1E012C344(0, &qword_1EACE18E0, MEMORY[0x1E4F26ED8], MEMORY[0x1E4FBB718]);
  uint64_t v7 = MEMORY[0x1F4188790](v6 - 8);
  uint64_t v9 = (char *)&v59 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v7);
  unint64_t v11 = (char *)&v59 - v10;
  sub_1E012C344(0, &qword_1EACE18E8, MEMORY[0x1E4F26EA0], v5);
  MEMORY[0x1F4188790](v12 - 8);
  id v14 = (char *)&v59 - v13;
  sub_1E0137F30();
  sub_1E012D5D8((uint64_t)v11, (uint64_t)v9, &qword_1EACE18E0, v4);
  uint64_t v15 = sub_1E0137F70();
  uint64_t v16 = *(void *)(v15 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v9, 1, v15) == 1)
  {
    sub_1E012C3A8((uint64_t)v11, &qword_1EACE18E0, MEMORY[0x1E4F26ED8]);
LABEL_14:
    sub_1E012C3A8((uint64_t)v9, &qword_1EACE18E0, MEMORY[0x1E4F26ED8]);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v1 + 56))(v14, 1, 1, v0);
    goto LABEL_20;
  }
  uint64_t v17 = sub_1E0137F20();
  (*(void (**)(char *, uint64_t))(v16 + 8))(v9, v15);
  if (!v17)
  {
    uint64_t v9 = v11;
    goto LABEL_14;
  }
  uint64_t v18 = *(void *)(v17 + 16);
  if (v18)
  {
    uint64_t v60 = v11;
    v62 = v14;
    int v19 = self;
    uint64_t v61 = v1;
    uint64_t v20 = v1 + 16;
    uint64_t v21 = *(void (**)(char *, unint64_t, uint64_t))(v1 + 16);
    unint64_t v22 = v17 + ((*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80));
    uint64_t v23 = (void (**)(char *, uint64_t))(v1 + 8);
    uint64_t v65 = v20;
    id v66 = v19;
    uint64_t v63 = *(void *)(v20 + 56);
    uint64_t v64 = v21;
    uint64_t v59 = v17;
    swift_bridgeObjectRetain();
    while (1)
    {
      uint64_t v24 = v0;
      v64(v3, v22, v0);
      uint64_t v25 = sub_1E0137EF0();
      uint64_t v27 = v26;
      id v28 = objc_msgSend(v66, sel_queryParameterNameDataTypeCode);
      uint64_t v29 = sub_1E0138190();
      uint64_t v31 = v30;

      if (v25 == v29 && v27 == v31)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease_n();
        goto LABEL_18;
      }
      char v33 = sub_1E01384F0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v33) {
        break;
      }
      uint64_t v0 = v24;
      (*v23)(v3, v24);
      v22 += v63;
      if (!--v18)
      {
        swift_bridgeObjectRelease();
        uint64_t v34 = 1;
        uint64_t v1 = v61;
        id v14 = v62;
        unint64_t v11 = v60;
        goto LABEL_19;
      }
    }
    swift_bridgeObjectRelease();
LABEL_18:
    uint64_t v0 = v24;
    unint64_t v11 = v60;
    uint64_t v1 = v61;
    id v14 = v62;
    (*(void (**)(char *, char *, uint64_t))(v61 + 32))(v62, v3, v24);
    uint64_t v34 = 0;
  }
  else
  {
    uint64_t v34 = 1;
  }
LABEL_19:
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v1 + 56))(v14, v34, 1, v0);
  swift_bridgeObjectRelease();
  sub_1E012C3A8((uint64_t)v11, &qword_1EACE18E0, MEMORY[0x1E4F26ED8]);
LABEL_20:
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v1 + 48))(v14, 1, v0) == 1)
  {
    sub_1E012C3A8((uint64_t)v14, &qword_1EACE18E8, MEMORY[0x1E4F26EA0]);
    return 0;
  }
  uint64_t v35 = sub_1E0137F00();
  unint64_t v37 = v36;
  id result = (id)(*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v14, v0);
  if (!v37) {
    return 0;
  }
  uint64_t v39 = HIBYTE(v37) & 0xF;
  uint64_t v40 = v35 & 0xFFFFFFFFFFFFLL;
  if ((v37 & 0x2000000000000000) != 0) {
    uint64_t v41 = HIBYTE(v37) & 0xF;
  }
  else {
    uint64_t v41 = v35 & 0xFFFFFFFFFFFFLL;
  }
  if (!v41)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  if ((v37 & 0x1000000000000000) != 0)
  {
    uint64_t v43 = (uint64_t)sub_1E012C418(v35, v37, 10);
    char v45 = v58;
    goto LABEL_66;
  }
  if ((v37 & 0x2000000000000000) == 0)
  {
    if ((v35 & 0x1000000000000000) != 0) {
      uint64_t v42 = (unsigned __int8 *)((v37 & 0xFFFFFFFFFFFFFFFLL) + 32);
    }
    else {
      uint64_t v42 = (unsigned __int8 *)sub_1E0138420();
    }
    uint64_t v43 = (uint64_t)sub_1E012C500(v42, v40, 10);
    char v45 = v44 & 1;
LABEL_66:
    swift_bridgeObjectRelease();
    if ((v45 & 1) == 0) {
      return objc_msgSend(self, sel_dataTypeWithCode_, v43);
    }
    return 0;
  }
  v67[0] = v35;
  v67[1] = v37 & 0xFFFFFFFFFFFFFFLL;
  if (v35 == 43)
  {
    if (!v39) {
      goto LABEL_79;
    }
    if (v39 == 1 || (BYTE1(v35) - 48) > 9u) {
      goto LABEL_53;
    }
    uint64_t v43 = (BYTE1(v35) - 48);
    if (v39 != 2)
    {
      if ((BYTE2(v35) - 48) > 9u) {
        goto LABEL_53;
      }
      uint64_t v43 = 10 * (BYTE1(v35) - 48) + (BYTE2(v35) - 48);
      uint64_t v46 = v39 - 3;
      if (v46)
      {
        uint64_t v47 = (unsigned __int8 *)v67 + 3;
        while (1)
        {
          unsigned int v48 = *v47 - 48;
          if (v48 > 9) {
            goto LABEL_53;
          }
          uint64_t v49 = 10 * v43;
          if ((unsigned __int128)(v43 * (__int128)10) >> 64 != (10 * v43) >> 63) {
            goto LABEL_53;
          }
          uint64_t v43 = v49 + v48;
          if (__OFADD__(v49, v48)) {
            goto LABEL_53;
          }
          char v45 = 0;
          ++v47;
          if (!--v46) {
            goto LABEL_66;
          }
        }
      }
    }
LABEL_65:
    char v45 = 0;
    goto LABEL_66;
  }
  if (v35 != 45)
  {
    if (!v39 || (v35 - 48) > 9u) {
      goto LABEL_53;
    }
    uint64_t v43 = (v35 - 48);
    if (v39 != 1)
    {
      if ((BYTE1(v35) - 48) > 9u) {
        goto LABEL_53;
      }
      uint64_t v43 = 10 * (v35 - 48) + (BYTE1(v35) - 48);
      uint64_t v50 = v39 - 2;
      if (v50)
      {
        uint64_t v51 = (unsigned __int8 *)v67 + 2;
        while (1)
        {
          unsigned int v52 = *v51 - 48;
          if (v52 > 9) {
            goto LABEL_53;
          }
          uint64_t v53 = 10 * v43;
          if ((unsigned __int128)(v43 * (__int128)10) >> 64 != (10 * v43) >> 63) {
            goto LABEL_53;
          }
          uint64_t v43 = v53 + v52;
          if (__OFADD__(v53, v52)) {
            goto LABEL_53;
          }
          char v45 = 0;
          ++v51;
          if (!--v50) {
            goto LABEL_66;
          }
        }
      }
    }
    goto LABEL_65;
  }
  if (v39)
  {
    if (v39 != 1 && (BYTE1(v35) - 48) <= 9u)
    {
      if (v39 == 2)
      {
        char v45 = 0;
        uint64_t v43 = -(uint64_t)(BYTE1(v35) - 48);
        goto LABEL_66;
      }
      if ((BYTE2(v35) - 48) <= 9u)
      {
        uint64_t v43 = -10 * (BYTE1(v35) - 48) - (BYTE2(v35) - 48);
        uint64_t v54 = v39 - 3;
        if (!v54) {
          goto LABEL_65;
        }
        v55 = (unsigned __int8 *)v67 + 3;
        while (1)
        {
          unsigned int v56 = *v55 - 48;
          if (v56 > 9) {
            break;
          }
          uint64_t v57 = 10 * v43;
          if ((unsigned __int128)(v43 * (__int128)10) >> 64 != (10 * v43) >> 63) {
            break;
          }
          uint64_t v43 = v57 - v56;
          if (__OFSUB__(v57, v56)) {
            break;
          }
          char v45 = 0;
          ++v55;
          if (!--v54) {
            goto LABEL_66;
          }
        }
      }
    }
LABEL_53:
    uint64_t v43 = 0;
    char v45 = 1;
    goto LABEL_66;
  }
  __break(1u);
LABEL_79:
  __break(1u);
  return result;
}

uint64_t sub_1E0126E5C@<X0>(unsigned __int8 *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v40 = a2;
  uint64_t v3 = sub_1E0137F10();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  uint64_t v6 = (char *)&v37 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = (uint64_t (*)(uint64_t))MEMORY[0x1E4F26ED8];
  sub_1E012C344(0, &qword_1EACE18E0, MEMORY[0x1E4F26ED8], MEMORY[0x1E4FBB718]);
  uint64_t v9 = MEMORY[0x1F4188790](v8 - 8);
  unint64_t v11 = (char *)&v37 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v9);
  uint64_t v13 = (char *)&v37 - v12;
  uint64_t v44 = *a1;
  sub_1E0137F30();
  sub_1E012D5D8((uint64_t)v13, (uint64_t)v11, &qword_1EACE18E0, v7);
  uint64_t v14 = sub_1E0137F70();
  uint64_t v15 = *(void *)(v14 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v11, 1, v14) == 1)
  {
    sub_1E012C3A8((uint64_t)v13, &qword_1EACE18E0, MEMORY[0x1E4F26ED8]);
LABEL_26:
    uint64_t v35 = v40;
    sub_1E012C3A8((uint64_t)v11, &qword_1EACE18E0, MEMORY[0x1E4F26ED8]);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v4 + 56))(v35, 1, 1, v3);
  }
  uint64_t v39 = v13;
  uint64_t v16 = sub_1E0137F20();
  (*(void (**)(char *, uint64_t))(v15 + 8))(v11, v14);
  if (!v16)
  {
    unint64_t v11 = v39;
    goto LABEL_26;
  }
  uint64_t v38 = v4;
  uint64_t v17 = *(void *)(v16 + 16);
  if (!v17)
  {
    uint64_t v31 = 1;
    uint64_t v34 = v38;
    uint64_t v32 = (uint64_t)v39;
    uint64_t v33 = v40;
    goto LABEL_31;
  }
  uint64_t v42 = *(void (**)(char *, unint64_t, uint64_t))(v38 + 16);
  uint64_t v43 = v38 + 16;
  unint64_t v18 = v16 + ((*(unsigned __int8 *)(v38 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v38 + 80));
  int v19 = (void (**)(char *, uint64_t))(v38 + 8);
  uint64_t v41 = *(void *)(v38 + 72);
  uint64_t v37 = v16;
  swift_bridgeObjectRetain();
  while (2)
  {
    v42(v6, v18, v3);
    uint64_t v20 = sub_1E0137EF0();
    unint64_t v21 = 0xE200000000000000;
    uint64_t v22 = 26992;
    uint64_t v23 = v20;
    uint64_t v25 = v24;
    switch(v44)
    {
      case 1:
        id v26 = objc_msgSend(self, sel_queryParameterNameStartDate);
        goto LABEL_20;
      case 2:
        id v26 = objc_msgSend(self, sel_queryParameterNameEndDate);
        goto LABEL_20;
      case 3:
        unint64_t v21 = 0xE600000000000000;
        if (v20 != 0x686372616573) {
          goto LABEL_22;
        }
        goto LABEL_21;
      case 4:
        id v26 = objc_msgSend(self, sel_queryParameterNameDataTypeCode);
        goto LABEL_20;
      case 5:
        unint64_t v21 = 0xE800000000000000;
        if (v20 != 0x79726F6765746163) {
          goto LABEL_22;
        }
        goto LABEL_21;
      case 6:
        unint64_t v21 = 0xE600000000000000;
        uint64_t v22 = 0x656C646E7562;
        goto LABEL_16;
      case 7:
LABEL_16:
        if (v20 != v22) {
          goto LABEL_22;
        }
        goto LABEL_21;
      case 8:
        id v26 = objc_msgSend(self, sel_queryParameterNameTrendOverlay);
        goto LABEL_20;
      case 9:
        id v26 = objc_msgSend(self, sel_queryParameterNameSource);
        goto LABEL_20;
      default:
        id v26 = objc_msgSend(self, sel_queryParameterNameDate);
LABEL_20:
        id v27 = v26;
        uint64_t v28 = sub_1E0138190();
        unint64_t v21 = v29;

        if (v23 != v28) {
          goto LABEL_22;
        }
LABEL_21:
        if (v25 == v21)
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease_n();
          goto LABEL_30;
        }
LABEL_22:
        char v30 = sub_1E01384F0();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v30 & 1) == 0)
        {
          (*v19)(v6, v3);
          v18 += v41;
          if (!--v17)
          {
            swift_bridgeObjectRelease();
            uint64_t v31 = 1;
            uint64_t v32 = (uint64_t)v39;
            uint64_t v33 = v40;
            uint64_t v34 = v38;
            goto LABEL_31;
          }
          continue;
        }
        swift_bridgeObjectRelease();
LABEL_30:
        uint64_t v34 = v38;
        uint64_t v33 = v40;
        (*(void (**)(uint64_t, char *, uint64_t))(v38 + 32))(v40, v6, v3);
        uint64_t v31 = 0;
        uint64_t v32 = (uint64_t)v39;
LABEL_31:
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v34 + 56))(v33, v31, 1, v3);
        swift_bridgeObjectRelease();
        return sub_1E012C3A8(v32, &qword_1EACE18E0, MEMORY[0x1E4F26ED8]);
    }
  }
}

uint64_t sub_1E012740C(uint64_t result, unint64_t a2)
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
        uint64_t v6 = (unsigned __int8 *)sub_1E0138420();
      }
      uint64_t v7 = (uint64_t)sub_1E012C500(v6, v4, 10);
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
        uint64_t v15 = (unsigned __int8 *)v23 + 2;
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
              unint64_t v11 = (unsigned __int8 *)v23 + 2;
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
        int v19 = (unsigned __int8 *)v23 + 1;
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
  uint64_t v7 = (uint64_t)sub_1E012C418(result, a2, 10);
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

id HAURL.profileIdentifier.getter()
{
  uint64_t v0 = (void *)sub_1E0138040();
  id v1 = objc_msgSend(v0, sel__hk_extractEncodedHKProfileIdentifier);

  return v1;
}

uint64_t HAURL.date.getter@<X0>(uint64_t a1@<X8>)
{
  char v2 = 0;
  return sub_1E01276C8(&v2, a1);
}

uint64_t sub_1E01276C8@<X0>(unsigned char *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = (uint64_t (*)(uint64_t))MEMORY[0x1E4F26EA0];
  sub_1E012C344(0, &qword_1EACE18E8, MEMORY[0x1E4F26EA0], MEMORY[0x1E4FBB718]);
  uint64_t v6 = MEMORY[0x1F4188790](v5 - 8);
  char v8 = (char *)&v29[-1] - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v6);
  uint64_t v10 = (char *)&v29[-1] - v9;
  LOBYTE(v29[0]) = *a1;
  sub_1E0126E5C((unsigned __int8 *)v29, (uint64_t)&v29[-1] - v9);
  sub_1E012D5D8((uint64_t)v10, (uint64_t)v8, &qword_1EACE18E8, v4);
  uint64_t v11 = sub_1E0137F10();
  uint64_t v12 = *(void *)(v11 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v8, 1, v11) == 1)
  {
    sub_1E012C3A8((uint64_t)v8, &qword_1EACE18E8, MEMORY[0x1E4F26EA0]);
  }
  else
  {
    uint64_t v13 = sub_1E0137F00();
    uint64_t v15 = v14;
    uint64_t v16 = (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v8, v11);
    if (v15)
    {
      uint64_t v31 = 0;
      uint64_t v17 = MEMORY[0x1F4188790](v16);
      *(&v28 - 2) = (uint64_t)&v31;
      if ((v15 & 0x1000000000000000) != 0 || !(v15 & 0x2000000000000000 | v13 & 0x1000000000000000))
      {
        sub_1E01383F0();
        swift_bridgeObjectRelease();
        if ((v30 & 1) == 0) {
          goto LABEL_16;
        }
      }
      else
      {
        MEMORY[0x1F4188790](v17);
        *(&v28 - 2) = (uint64_t)sub_1E012D658;
        *(&v28 - 1) = v18;
        if ((v15 & 0x2000000000000000) != 0)
        {
          v29[0] = v13;
          v29[1] = v15 & 0xFFFFFFFFFFFFFFLL;
          BOOL v24 = v13 > 0x20u || ((1 << v13) & 0x100003E01) == 0;
          if (!v24 || (id v26 = (unsigned __int8 *)_swift_stdlib_strtod_clocale()) == 0)
          {
            swift_bridgeObjectRelease();
            goto LABEL_16;
          }
          int v27 = *v26;
          swift_bridgeObjectRelease();
          if (v27) {
            goto LABEL_16;
          }
        }
        else
        {
          if ((v13 & 0x1000000000000000) != 0)
          {
            uint64_t v19 = (v15 & 0xFFFFFFFFFFFFFFFLL) + 32;
            uint64_t v20 = v13 & 0xFFFFFFFFFFFFLL;
          }
          else
          {
            uint64_t v19 = sub_1E0138420();
          }
          char v21 = sub_1E012D25C(v19, v20, (void (*)(uint64_t *__return_ptr))sub_1E012DE38);
          swift_bridgeObjectRelease();
          if ((v21 & 1) == 0) {
            goto LABEL_16;
          }
        }
      }
      sub_1E01380D0();
      sub_1E012C3A8((uint64_t)v10, &qword_1EACE18E8, MEMORY[0x1E4F26EA0]);
      uint64_t v22 = sub_1E01380E0();
      return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56))(a2, 0, 1, v22);
    }
  }
LABEL_16:
  sub_1E012C3A8((uint64_t)v10, &qword_1EACE18E8, MEMORY[0x1E4F26EA0]);
  uint64_t v25 = sub_1E01380E0();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v25 - 8) + 56))(a2, 1, 1, v25);
}

uint64_t HAURL.startDate.getter@<X0>(uint64_t a1@<X8>)
{
  char v2 = 1;
  return sub_1E01276C8(&v2, a1);
}

uint64_t HAURL.endDate.getter@<X0>(uint64_t a1@<X8>)
{
  char v2 = 2;
  return sub_1E01276C8(&v2, a1);
}

uint64_t HAURL.source.getter()
{
  uint64_t v0 = sub_1E0137F10();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1F4188790](v0);
  uint64_t v3 = (char *)&v38 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = (uint64_t (*)(uint64_t))MEMORY[0x1E4F26ED8];
  uint64_t v5 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E4FBB718];
  sub_1E012C344(0, &qword_1EACE18E0, MEMORY[0x1E4F26ED8], MEMORY[0x1E4FBB718]);
  uint64_t v7 = MEMORY[0x1F4188790](v6 - 8);
  uint64_t v9 = (char *)&v38 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v7);
  uint64_t v11 = (char *)&v38 - v10;
  sub_1E012C344(0, &qword_1EACE18E8, MEMORY[0x1E4F26EA0], v5);
  MEMORY[0x1F4188790](v12 - 8);
  uint64_t v14 = (char *)&v38 - v13;
  sub_1E0137F30();
  sub_1E012D5D8((uint64_t)v11, (uint64_t)v9, &qword_1EACE18E0, v4);
  uint64_t v15 = sub_1E0137F70();
  uint64_t v16 = *(void *)(v15 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v9, 1, v15) == 1)
  {
    sub_1E012C3A8((uint64_t)v11, &qword_1EACE18E0, MEMORY[0x1E4F26ED8]);
LABEL_14:
    sub_1E012C3A8((uint64_t)v9, &qword_1EACE18E0, MEMORY[0x1E4F26ED8]);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v1 + 56))(v14, 1, 1, v0);
    goto LABEL_21;
  }
  uint64_t v17 = sub_1E0137F20();
  (*(void (**)(char *, uint64_t))(v16 + 8))(v9, v15);
  if (!v17)
  {
    uint64_t v9 = v11;
    goto LABEL_14;
  }
  uint64_t v41 = v11;
  uint64_t v18 = *(void *)(v17 + 16);
  if (v18)
  {
    uint64_t v39 = v14;
    uint64_t v19 = self;
    uint64_t v40 = v1;
    char v21 = *(void (**)(char *, unint64_t, uint64_t))(v1 + 16);
    uint64_t v20 = v1 + 16;
    unint64_t v22 = v17 + ((*(unsigned __int8 *)(v20 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v20 + 64));
    uint64_t v23 = (void (**)(char *, uint64_t))(v20 - 8);
    uint64_t v44 = v20;
    id v45 = v19;
    uint64_t v42 = *(void *)(v20 + 56);
    uint64_t v43 = v21;
    uint64_t v38 = v17;
    swift_bridgeObjectRetain();
    while (1)
    {
      uint64_t v24 = v0;
      v43(v3, v22, v0);
      uint64_t v25 = sub_1E0137EF0();
      uint64_t v27 = v26;
      id v28 = objc_msgSend(v45, sel_queryParameterNameSource);
      uint64_t v29 = sub_1E0138190();
      uint64_t v31 = v30;

      if (v25 == v29 && v27 == v31)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease_n();
        goto LABEL_19;
      }
      char v33 = sub_1E01384F0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v33) {
        break;
      }
      uint64_t v0 = v24;
      (*v23)(v3, v24);
      v22 += v42;
      if (!--v18)
      {
        swift_bridgeObjectRelease();
        uint64_t v34 = 1;
        uint64_t v14 = v39;
        uint64_t v1 = v40;
        goto LABEL_16;
      }
    }
    swift_bridgeObjectRelease();
LABEL_19:
    uint64_t v1 = v40;
    uint64_t v35 = (uint64_t)v41;
    uint64_t v14 = v39;
    uint64_t v0 = v24;
    (*(void (**)(char *, char *, uint64_t))(v40 + 32))(v39, v3, v24);
    uint64_t v34 = 0;
  }
  else
  {
    uint64_t v34 = 1;
LABEL_16:
    uint64_t v35 = (uint64_t)v41;
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v1 + 56))(v14, v34, 1, v0);
  swift_bridgeObjectRelease();
  sub_1E012C3A8(v35, &qword_1EACE18E0, MEMORY[0x1E4F26ED8]);
LABEL_21:
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v1 + 48))(v14, 1, v0) == 1)
  {
    sub_1E012C3A8((uint64_t)v14, &qword_1EACE18E8, MEMORY[0x1E4F26EA0]);
    return 0;
  }
  else
  {
    uint64_t v36 = sub_1E0137F00();
    (*(void (**)(char *, uint64_t))(v1 + 8))(v14, v0);
  }
  return v36;
}

uint64_t HAURL.pluginBundleName.getter()
{
  uint64_t v1 = type metadata accessor for HAURLValidator();
  MEMORY[0x1F4188790](v1 - 8);
  uint64_t v3 = (char *)v23 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_1E01380B0();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(v3, v0, v4);
  uint64_t v5 = sub_1E0138090();
  if (!v6) {
    goto LABEL_3;
  }
  uint64_t v24 = v5;
  unint64_t v25 = v6;
  id v7 = objc_msgSend(self, sel_internalHealthAppURLScheme);
  uint64_t v8 = sub_1E0138190();
  uint64_t v10 = v9;

  v23[2] = v8;
  void v23[3] = v10;
  sub_1E011FF24();
  uint64_t v11 = sub_1E0138370();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v11) {
    goto LABEL_3;
  }
  uint64_t v14 = sub_1E0138070();
  if (v15)
  {
    uint64_t v12 = v14;
    unint64_t v16 = v15;
    uint64_t v24 = 46;
    unint64_t v25 = 0xE100000000000000;
    MEMORY[0x1F4188790](v14);
    v23[-2] = &v24;
    swift_bridgeObjectRetain_n();
    uint64_t v17 = (void *)sub_1E012B068(0x7FFFFFFFFFFFFFFFLL, 1, sub_1E012D2BC, (uint64_t)&v23[-4], v12, v16);
    swift_bridgeObjectRelease();
    if (v17[2] == 2)
    {
      unint64_t v18 = v17[8];
      unint64_t v19 = v17[9];
      uint64_t v20 = v17[10];
      uint64_t v21 = v17[11];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      char v22 = sub_1E012D560(v18, v19, v20, v21, 0x6C7068746C616568, 0xEC0000006E696775);
      swift_bridgeObjectRelease();
      sub_1E012C2E4((uint64_t)v3, (uint64_t (*)(void))type metadata accessor for HAURLValidator);
      if (v22) {
        return v12;
      }
    }
    else
    {
      sub_1E012C2E4((uint64_t)v3, (uint64_t (*)(void))type metadata accessor for HAURLValidator);
      swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRelease();
  }
  else
  {
LABEL_3:
    sub_1E012C2E4((uint64_t)v3, (uint64_t (*)(void))type metadata accessor for HAURLValidator);
  }
  return 0;
}

uint64_t HAURL.trendTimescope.getter()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_1E0138140();
  uint64_t v119 = *(void *)(v2 - 8);
  uint64_t v120 = v2;
  MEMORY[0x1F4188790](v2);
  v125 = (char *)&v116 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v124 = sub_1E0137F10();
  uint64_t v122 = *(void *)(v124 - 8);
  MEMORY[0x1F4188790](v124);
  v123 = (char *)&v116 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E4FBB718];
  sub_1E012C344(0, &qword_1EACE18E8, MEMORY[0x1E4F26EA0], MEMORY[0x1E4FBB718]);
  uint64_t v7 = MEMORY[0x1F4188790](v6 - 8);
  v121 = (char *)&v116 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v7);
  uint64_t v10 = (char *)&v116 - v9;
  sub_1E012C344(0, &qword_1EACE18E0, MEMORY[0x1E4F26ED8], v5);
  uint64_t v12 = MEMORY[0x1F4188790](v11 - 8);
  uint64_t v14 = (char *)&v116 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v12);
  unint64_t v16 = (char *)&v116 - v15;
  uint64_t v17 = type metadata accessor for HAURL();
  uint64_t v18 = MEMORY[0x1F4188790](v17 - 8);
  uint64_t v20 = (char *)&v116 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = MEMORY[0x1F4188790](v18);
  uint64_t v23 = (char *)&v116 - v22;
  MEMORY[0x1F4188790](v21);
  unint64_t v25 = (char *)&v116 - v24;
  uint64_t v26 = type metadata accessor for HAURLValidator();
  MEMORY[0x1F4188790](v26 - 8);
  id v28 = (char *)&v116 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = sub_1E01380B0();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v29 - 8) + 16))(v28, v0, v29);
  uint64_t v30 = sub_1E0138090();
  if (!v31)
  {
    sub_1E012BB6C(v0, (uint64_t)v25);
    goto LABEL_8;
  }
  v117 = v16;
  v118 = v10;
  uint64_t v129 = v30;
  uint64_t v130 = v31;
  id v32 = objc_msgSend(self, sel_internalHealthAppURLScheme);
  uint64_t v33 = sub_1E0138190();
  uint64_t v126 = (uint64_t)v28;
  uint64_t v34 = v33;
  uint64_t v36 = v35;

  uint64_t v127 = v34;
  uint64_t v128 = v36;
  id v28 = (char *)v126;
  sub_1E011FF24();
  uint64_t v37 = sub_1E0138370();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1E012BB6C(v1, (uint64_t)v25);
  if (v37)
  {
LABEL_8:
    uint64_t v46 = (uint64_t)v25;
LABEL_9:
    sub_1E012C2E4(v46, (uint64_t (*)(void))type metadata accessor for HAURL);
    goto LABEL_10;
  }
  uint64_t v38 = sub_1E0138070();
  uint64_t v40 = v39;
  id v116 = self;
  id v41 = objc_msgSend(v116, sel_sampleTypeHostName);
  uint64_t v42 = sub_1E0138190();
  uint64_t v44 = v43;

  if (!v40)
  {
    sub_1E012C2E4((uint64_t)v25, (uint64_t (*)(void))type metadata accessor for HAURL);
    swift_bridgeObjectRelease();
    id v28 = (char *)v126;
    goto LABEL_10;
  }
  if (v38 == v42 && v40 == v44)
  {
    swift_bridgeObjectRelease();
    sub_1E012C2E4((uint64_t)v25, (uint64_t (*)(void))type metadata accessor for HAURL);
    swift_bridgeObjectRelease();
    id v28 = (char *)v126;
    uint64_t v45 = (uint64_t)v118;
  }
  else
  {
    char v49 = sub_1E01384F0();
    swift_bridgeObjectRelease();
    sub_1E012C2E4((uint64_t)v25, (uint64_t (*)(void))type metadata accessor for HAURL);
    swift_bridgeObjectRelease();
    id v28 = (char *)v126;
    uint64_t v45 = (uint64_t)v118;
    if ((v49 & 1) == 0) {
      goto LABEL_10;
    }
  }
  uint64_t v50 = *(void *)(sub_1E0138020() + 16);
  swift_bridgeObjectRelease();
  sub_1E012BB6C(v1, (uint64_t)v23);
  if (v50 != 2) {
    goto LABEL_21;
  }
  uint64_t v51 = (void *)sub_1E0138020();
  if (!v51[2])
  {
    swift_bridgeObjectRelease();
    goto LABEL_21;
  }
  uint64_t v53 = v51[4];
  uint64_t v52 = v51[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  if (!v52)
  {
LABEL_21:
    uint64_t v46 = (uint64_t)v23;
    goto LABEL_9;
  }
  if (v53 == 47 && v52 == 0xE100000000000000)
  {
    sub_1E012C2E4((uint64_t)v23, (uint64_t (*)(void))type metadata accessor for HAURL);
    swift_bridgeObjectRelease();
    uint64_t v54 = v125;
    goto LABEL_23;
  }
  char v55 = sub_1E01384F0();
  sub_1E012C2E4((uint64_t)v23, (uint64_t (*)(void))type metadata accessor for HAURL);
  swift_bridgeObjectRelease();
  uint64_t v54 = v125;
  if ((v55 & 1) == 0)
  {
LABEL_10:
    sub_1E012C2E4((uint64_t)v28, (uint64_t (*)(void))type metadata accessor for HAURLValidator);
    return 0;
  }
LABEL_23:
  uint64_t v56 = sub_1E0138020();
  uint64_t v57 = *(void *)(v56 + 16);
  if (!v57)
  {
    swift_bridgeObjectRelease();
    goto LABEL_10;
  }
  uint64_t v58 = v56 + 16 * v57;
  uint64_t v60 = *(void *)(v58 + 16);
  unint64_t v59 = *(void *)(v58 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v61 = self;
  v62 = (void *)sub_1E0138170();
  id v63 = objc_msgSend(v61, sel__typeWithIdentifier_, v62);

  if (!v63)
  {
    if (qword_1EC05B670 != -1) {
      swift_once();
    }
    uint64_t v70 = v120;
    uint64_t v71 = __swift_project_value_buffer(v120, (uint64_t)qword_1EC05B758);
    uint64_t v72 = v119;
    (*(void (**)(char *, uint64_t, uint64_t))(v119 + 16))(v54, v71, v70);
    sub_1E012BB6C(v1, (uint64_t)v20);
    swift_bridgeObjectRetain();
    v73 = sub_1E0138120();
    os_log_type_t v74 = sub_1E0138300();
    if (os_log_type_enabled(v73, v74))
    {
      uint64_t v75 = swift_slowAlloc();
      uint64_t v126 = swift_slowAlloc();
      uint64_t v129 = v126;
      *(_DWORD *)uint64_t v75 = 136315651;
      uint64_t v127 = sub_1E012BBD0(0x4C52554148, 0xE500000000000000, &v129);
      sub_1E0138340();
      *(_WORD *)(v75 + 12) = 2082;
      swift_bridgeObjectRetain();
      uint64_t v127 = sub_1E012BBD0(v60, v59, &v129);
      sub_1E0138340();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v75 + 22) = 2081;
      uint64_t v76 = sub_1E0138010();
      uint64_t v127 = sub_1E012BBD0(v76, v77, &v129);
      sub_1E0138340();
      swift_bridgeObjectRelease();
      sub_1E012C2E4((uint64_t)v20, (uint64_t (*)(void))type metadata accessor for HAURL);
      _os_log_impl(&dword_1E0118000, v73, v74, "%s Invalid type identifier %{public}s provided in URL %{private}s with trend", (uint8_t *)v75, 0x20u);
      uint64_t v78 = v126;
      swift_arrayDestroy();
      MEMORY[0x1E01F1830](v78, -1, -1);
      MEMORY[0x1E01F1830](v75, -1, -1);

      (*(void (**)(char *, uint64_t))(v119 + 8))(v125, v120);
    }
    else
    {

      sub_1E012C2E4((uint64_t)v20, (uint64_t (*)(void))type metadata accessor for HAURL);
      swift_bridgeObjectRelease_n();
      (*(void (**)(char *, uint64_t))(v72 + 8))(v54, v70);
    }
    goto LABEL_10;
  }
  swift_bridgeObjectRelease();
  uint64_t v64 = (uint64_t)v117;
  sub_1E0137F30();
  sub_1E012D5D8(v64, (uint64_t)v14, &qword_1EACE18E0, MEMORY[0x1E4F26ED8]);
  uint64_t v65 = sub_1E0137F70();
  uint64_t v66 = *(void *)(v65 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v66 + 48))(v14, 1, v65) == 1)
  {
    sub_1E012C3A8((uint64_t)v14, &qword_1EACE18E0, MEMORY[0x1E4F26ED8]);
    uint64_t v67 = v124;
    uint64_t v68 = (uint64_t)v121;
    uint64_t v69 = v122;
LABEL_43:
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v69 + 56))(v45, 1, 1, v67);
    goto LABEL_49;
  }
  uint64_t v79 = sub_1E0137F20();
  (*(void (**)(char *, uint64_t))(v66 + 8))(v14, v65);
  uint64_t v67 = v124;
  uint64_t v68 = (uint64_t)v121;
  uint64_t v69 = v122;
  if (!v79) {
    goto LABEL_43;
  }
  uint64_t v80 = *(void *)(v79 + 16);
  if (v80)
  {
    v125 = *(char **)(v122 + 16);
    unint64_t v81 = v79 + ((*(unsigned __int8 *)(v122 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v122 + 80));
    v82 = (void (**)(char *, uint64_t))(v122 + 8);
    uint64_t v83 = *(void *)(v122 + 72);
    uint64_t v120 = v79;
    swift_bridgeObjectRetain();
    v84 = v123;
    while (1)
    {
      ((void (*)(char *, unint64_t, uint64_t))v125)(v84, v81, v67);
      uint64_t v85 = sub_1E0137EF0();
      uint64_t v87 = v86;
      id v88 = objc_msgSend(v116, sel_queryParameterNameTrendOverlay);
      uint64_t v89 = sub_1E0138190();
      uint64_t v91 = v90;

      if (v85 == v89 && v87 == v91)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease_n();
        goto LABEL_47;
      }
      char v93 = sub_1E01384F0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v93) {
        break;
      }
      v84 = v123;
      uint64_t v67 = v124;
      (*v82)(v123, v124);
      v81 += v83;
      if (!--v80)
      {
        swift_bridgeObjectRelease();
        uint64_t v45 = (uint64_t)v118;
        uint64_t v68 = (uint64_t)v121;
        uint64_t v69 = v122;
        goto LABEL_42;
      }
    }
    swift_bridgeObjectRelease();
LABEL_47:
    uint64_t v67 = v124;
    uint64_t v68 = (uint64_t)v121;
    uint64_t v69 = v122;
    uint64_t v45 = (uint64_t)v118;
    (*(void (**)(char *, char *, uint64_t))(v122 + 32))(v118, v123, v124);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v69 + 56))(v45, 0, 1, v67);
  }
  else
  {
LABEL_42:
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v69 + 56))(v45, 1, 1, v67);
  }
  swift_bridgeObjectRelease();
  id v28 = (char *)v126;
LABEL_49:
  sub_1E012D5D8(v45, v68, &qword_1EACE18E8, MEMORY[0x1E4F26EA0]);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v69 + 48))(v68, 1, v67) == 1)
  {
    sub_1E012C3A8(v68, &qword_1EACE18E8, MEMORY[0x1E4F26EA0]);
LABEL_107:
    sub_1E012C3A8(v45, &qword_1EACE18E8, MEMORY[0x1E4F26EA0]);
    sub_1E012C3A8((uint64_t)v117, &qword_1EACE18E0, MEMORY[0x1E4F26ED8]);
    goto LABEL_10;
  }
  uint64_t v94 = sub_1E0137F00();
  unint64_t v96 = v95;
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(v69 + 8))(v68, v67);
  if (!v96) {
    goto LABEL_107;
  }
  uint64_t v97 = HIBYTE(v96) & 0xF;
  uint64_t v98 = v94 & 0xFFFFFFFFFFFFLL;
  if ((v96 & 0x2000000000000000) != 0) {
    uint64_t v99 = HIBYTE(v96) & 0xF;
  }
  else {
    uint64_t v99 = v94 & 0xFFFFFFFFFFFFLL;
  }
  if (!v99)
  {
    swift_bridgeObjectRelease();
    goto LABEL_107;
  }
  if ((v96 & 0x1000000000000000) != 0)
  {
    uint64_t v47 = (uint64_t)sub_1E012C418(v94, v96, 10);
    char v102 = v115;
    goto LABEL_104;
  }
  if ((v96 & 0x2000000000000000) == 0)
  {
    if ((v94 & 0x1000000000000000) != 0) {
      v100 = (unsigned __int8 *)((v96 & 0xFFFFFFFFFFFFFFFLL) + 32);
    }
    else {
      v100 = (unsigned __int8 *)sub_1E0138420();
    }
    uint64_t v47 = (uint64_t)sub_1E012C500(v100, v98, 10);
    char v102 = v101 & 1;
LABEL_104:
    swift_bridgeObjectRelease();
    if ((v102 & 1) == 0)
    {
      sub_1E012C3A8(v45, &qword_1EACE18E8, MEMORY[0x1E4F26EA0]);
      sub_1E012C3A8((uint64_t)v117, &qword_1EACE18E0, MEMORY[0x1E4F26ED8]);
      sub_1E012C2E4((uint64_t)v28, (uint64_t (*)(void))type metadata accessor for HAURLValidator);
      return v47;
    }
    goto LABEL_107;
  }
  uint64_t v129 = v94;
  uint64_t v130 = v96 & 0xFFFFFFFFFFFFFFLL;
  if (v94 == 43)
  {
    if (!v97) {
      goto LABEL_111;
    }
    if (v97 == 1 || (BYTE1(v94) - 48) > 9u) {
      goto LABEL_82;
    }
    uint64_t v47 = (BYTE1(v94) - 48);
    if (v97 == 2)
    {
LABEL_84:
      char v102 = 0;
      goto LABEL_104;
    }
    if ((BYTE2(v94) - 48) > 9u) {
      goto LABEL_82;
    }
    uint64_t v47 = 10 * (BYTE1(v94) - 48) + (BYTE2(v94) - 48);
    uint64_t v103 = v97 - 3;
    if (v103)
    {
      v104 = (unsigned __int8 *)&v129 + 3;
      while (1)
      {
        unsigned int v105 = *v104 - 48;
        if (v105 > 9) {
          goto LABEL_102;
        }
        uint64_t v106 = 10 * v47;
        if ((unsigned __int128)(v47 * (__int128)10) >> 64 != (10 * v47) >> 63) {
          goto LABEL_102;
        }
        uint64_t v47 = v106 + v105;
        if (__OFADD__(v106, v105)) {
          goto LABEL_102;
        }
        char v102 = 0;
        ++v104;
        if (!--v103) {
          goto LABEL_103;
        }
      }
    }
LABEL_95:
    char v102 = 0;
LABEL_103:
    id v28 = (char *)v126;
    uint64_t v45 = (uint64_t)v118;
    goto LABEL_104;
  }
  if (v94 != 45)
  {
    if (!v97 || (v94 - 48) > 9u) {
      goto LABEL_82;
    }
    uint64_t v47 = (v94 - 48);
    if (v97 == 1) {
      goto LABEL_84;
    }
    if ((BYTE1(v94) - 48) > 9u) {
      goto LABEL_82;
    }
    uint64_t v47 = 10 * (v94 - 48) + (BYTE1(v94) - 48);
    uint64_t v107 = v97 - 2;
    if (v107)
    {
      v108 = (unsigned __int8 *)&v129 + 2;
      while (1)
      {
        unsigned int v109 = *v108 - 48;
        if (v109 > 9) {
          goto LABEL_102;
        }
        uint64_t v110 = 10 * v47;
        if ((unsigned __int128)(v47 * (__int128)10) >> 64 != (10 * v47) >> 63) {
          goto LABEL_102;
        }
        uint64_t v47 = v110 + v109;
        if (__OFADD__(v110, v109)) {
          goto LABEL_102;
        }
        char v102 = 0;
        ++v108;
        if (!--v107) {
          goto LABEL_103;
        }
      }
    }
    goto LABEL_95;
  }
  if (v97)
  {
    if (v97 != 1 && (BYTE1(v94) - 48) <= 9u)
    {
      if (v97 == 2)
      {
        char v102 = 0;
        uint64_t v47 = -(uint64_t)(BYTE1(v94) - 48);
        goto LABEL_104;
      }
      if ((BYTE2(v94) - 48) <= 9u)
      {
        uint64_t v47 = -10 * (BYTE1(v94) - 48) - (BYTE2(v94) - 48);
        uint64_t v111 = v97 - 3;
        if (!v111) {
          goto LABEL_95;
        }
        v112 = (unsigned __int8 *)&v129 + 3;
        while (1)
        {
          unsigned int v113 = *v112 - 48;
          if (v113 > 9) {
            break;
          }
          uint64_t v114 = 10 * v47;
          if ((unsigned __int128)(v47 * (__int128)10) >> 64 != (10 * v47) >> 63) {
            break;
          }
          uint64_t v47 = v114 - v113;
          if (__OFSUB__(v114, v113)) {
            break;
          }
          char v102 = 0;
          ++v112;
          if (!--v111) {
            goto LABEL_103;
          }
        }
LABEL_102:
        uint64_t v47 = 0;
        char v102 = 1;
        goto LABEL_103;
      }
    }
LABEL_82:
    uint64_t v47 = 0;
    char v102 = 1;
    goto LABEL_104;
  }
  __break(1u);
LABEL_111:
  __break(1u);
  return result;
}

uint64_t static HAURL.createURLComponents(pluginBundleName:)(uint64_t a1, uint64_t a2)
{
  sub_1E0137F60();
  id v4 = objc_msgSend(self, sel_internalHealthAppURLScheme);
  sub_1E0138190();

  sub_1E0137F50();
  swift_bridgeObjectRetain();
  return MEMORY[0x1E01F0C20](a1, a2);
}

uint64_t static HAURL.appendProfileIdentifier(to:profileIdentifier:)@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  id v4 = self;
  uint64_t v5 = (void *)sub_1E0138040();
  id v6 = objc_msgSend(v4, sel__hk_appendQueryParameterToURL_forHKProfileIdentifier_, v5, a1);

  if (v6)
  {
    sub_1E0138050();

    uint64_t v7 = sub_1E01380B0();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = a2;
    uint64_t v11 = 0;
  }
  else
  {
    uint64_t v12 = sub_1E01380B0();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56);
    uint64_t v9 = v12;
    uint64_t v10 = a2;
    uint64_t v11 = 1;
  }
  return v8(v10, v11, 1, v9);
}

Swift::OpaquePointer_optional __swiftcall HAURL.createUserActivityDictionary()()
{
  v184[11] = *(id *)MEMORY[0x1E4F143B8];
  uint64_t v1 = sub_1E0138140();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x1F4188790](v1);
  id v4 = (char *)v153 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for HAURLValidator();
  MEMORY[0x1F4188790](v5 - 8);
  uint64_t v162 = (uint64_t)v153 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for HAURL();
  MEMORY[0x1F4188790](v7 - 8);
  uint64_t v178 = (uint64_t)v153 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_1E0137F10();
  uint64_t v177 = *(void *)(v9 - 8);
  MEMORY[0x1F4188790](v9);
  uint64_t v11 = (char *)v153 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v12 = objc_allocWithZone(MEMORY[0x1E4F29088]);
  uint64_t v168 = v0;
  uint64_t v13 = (void *)sub_1E0138040();
  id v14 = objc_msgSend(v12, sel_initWithURL_resolvingAgainstBaseURL_, v13, 0);

  if (v14)
  {
    id v155 = v14;
    id v16 = objc_msgSend(v14, sel_queryItems);
    uint64_t v164 = v1;
    v163 = v4;
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = sub_1E01382C0();
    }
    else
    {
      uint64_t v18 = MEMORY[0x1E4FBC860];
    }
    unint64_t v19 = sub_1E011A200(MEMORY[0x1E4FBC860]);
    uint64_t v176 = *(void *)(v18 + 16);
    if (v176)
    {
      unint64_t v20 = 0;
      uint64_t v166 = 0;
      unint64_t v174 = v18 + ((*(unsigned __int8 *)(v177 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v177 + 80));
      uint64_t v173 = v177 + 16;
      v170 = (void (**)(char *, uint64_t))(v177 + 8);
      v158 = (void (**)(char *, uint64_t, uint64_t))(v2 + 16);
      v156 = (void (**)(char *, uint64_t))(v2 + 8);
      v153[2] = (char *)&v182 + 8;
      long long v172 = xmmword_1E01393F0;
      long long v157 = xmmword_1E0139400;
      v153[1] = MEMORY[0x1E4FBC840] + 8;
      unint64_t v167 = (unint64_t)"query";
      v153[0] = "displayCategoryID";
      uint64_t v175 = v9;
      uint64_t v171 = v18;
      while (1)
      {
        if (v20 >= *(void *)(v18 + 16)) {
          __break(1u);
        }
        unint64_t v179 = v20 + 1;
        (*(void (**)(char *, unint64_t, uint64_t))(v177 + 16))(v11, v174 + *(void *)(v177 + 72) * v20, v9);
        uint64_t v21 = sub_1E0137EF0();
        uint64_t v23 = v22;
        sub_1E012DEF8(0, &qword_1EACE18F0, (uint64_t)&type metadata for QueryParameterName, MEMORY[0x1E4FBBE00]);
        uint64_t inited = swift_initStackObject();
        *(_OWORD *)(inited + 16) = v172;
        *(void *)(inited + 32) = 0x706050403020100;
        *(_WORD *)(inited + 40) = 2312;
        uint64_t v25 = 32;
        while (2)
        {
          unsigned int v26 = *(unsigned __int8 *)(inited + v25);
          unint64_t v27 = 0xE200000000000000;
          uint64_t v28 = 26992;
          switch(*(unsigned char *)(inited + v25))
          {
            case 1:
              id v29 = objc_msgSend(self, sel_queryParameterNameStartDate);
              goto LABEL_26;
            case 2:
              id v29 = objc_msgSend(self, sel_queryParameterNameEndDate);
              goto LABEL_26;
            case 3:
              unint64_t v27 = 0xE600000000000000;
              if (v21 != 0x686372616573) {
                goto LABEL_28;
              }
              goto LABEL_27;
            case 4:
              id v29 = objc_msgSend(self, sel_queryParameterNameDataTypeCode);
              goto LABEL_26;
            case 5:
              unint64_t v27 = 0xE800000000000000;
              if (v21 != 0x79726F6765746163) {
                goto LABEL_28;
              }
              goto LABEL_27;
            case 6:
              unint64_t v27 = 0xE600000000000000;
              uint64_t v28 = 0x656C646E7562;
              goto LABEL_22;
            case 7:
LABEL_22:
              if (v21 != v28) {
                goto LABEL_28;
              }
              goto LABEL_27;
            case 8:
              id v29 = objc_msgSend(self, sel_queryParameterNameTrendOverlay);
              goto LABEL_26;
            case 9:
              id v29 = objc_msgSend(self, sel_queryParameterNameSource);
              goto LABEL_26;
            default:
              id v29 = objc_msgSend(self, sel_queryParameterNameDate);
LABEL_26:
              id v30 = v29;
              uint64_t v31 = sub_1E0138190();
              unint64_t v27 = v32;

              if (v21 != v31) {
                goto LABEL_28;
              }
LABEL_27:
              if (v23 != v27)
              {
LABEL_28:
                char v33 = sub_1E01384F0();
                swift_bridgeObjectRelease();
                if (v33) {
                  goto LABEL_32;
                }
                if (++v25 == 42)
                {
                  swift_setDeallocating();
                  swift_deallocClassInstance();
                  swift_bridgeObjectRelease();
                  goto LABEL_36;
                }
                continue;
              }
              swift_bridgeObjectRelease();
LABEL_32:
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              uint64_t v34 = sub_1E0137F00();
              if (!v35)
              {
LABEL_36:
                uint64_t v9 = v175;
                unint64_t v20 = v179;
                uint64_t v40 = sub_1E0137F00();
                if (v41)
                {
                  uint64_t v42 = v40;
                  uint64_t v43 = v41;
                  *(void *)&long long v182 = sub_1E0137EF0();
                  *((void *)&v182 + 1) = v44;
                  uint64_t v45 = MEMORY[0x1E4FBB1A0];
                  sub_1E01383E0();
                  uint64_t v183 = v45;
                  *(void *)&long long v182 = v42;
                  *((void *)&v182 + 1) = v43;
                  sub_1E011AF04(&v182, &v181);
                  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
                  unint64_t v180 = v19;
                  sub_1E012CF7C(&v181, (uint64_t)v184, isUniquelyReferenced_nonNull_native);
                  unint64_t v19 = v180;
                  swift_bridgeObjectRelease();
                  sub_1E0120314((uint64_t)v184);
                }
                (*v170)(v11, v9);
                uint64_t v18 = v171;
                goto LABEL_9;
              }
              uint64_t v36 = v34;
              unint64_t v37 = v35;
              uint64_t v38 = sub_1E01380B0();
              (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v38 - 8) + 16))(v178, v168, v38);
              LOBYTE(v184[0]) = v26;
              if (QueryParameterName.rawValue.getter() == 26992 && v39 == 0xE200000000000000)
              {
                swift_bridgeObjectRelease();
                goto LABEL_39;
              }
              char v47 = sub_1E01384F0();
              swift_bridgeObjectRelease();
              if (v47)
              {
LABEL_39:
                unsigned int v48 = (void *)sub_1E0138040();
                id v49 = objc_msgSend(v48, sel__hk_extractEncodedHKProfileIdentifier);

                if (v49)
                {
                  swift_bridgeObjectRelease();
                  uint64_t v50 = self;
                  v184[0] = 0;
                  id v51 = objc_msgSend(v50, sel_archivedDataWithRootObject_requiringSecureCoding_error_, v49, 1, v184);
                  id v52 = v184[0];
                  if (v51)
                  {
                    uint64_t v53 = sub_1E01380C0();
                    unint64_t v55 = v54;

                    unint64_t v56 = v167 | 0x8000000000000000;
                    unint64_t v57 = 0xD000000000000011;
                    uint64_t v58 = v26;
                    uint64_t v18 = v171;
                    switch(v58)
                    {
                      case 1:
                        unint64_t v57 = 0x7461447472617473;
                        goto LABEL_80;
                      case 2:
                        unint64_t v56 = 0xE700000000000000;
                        unint64_t v57 = 0x65746144646E65;
                        break;
                      case 3:
                        unint64_t v56 = 0xE500000000000000;
                        unint64_t v57 = 0x7972657571;
                        break;
                      case 4:
                        unint64_t v57 = 0x6570795461746164;
                        unint64_t v56 = 0xEC00000065646F43;
                        break;
                      case 5:
                        break;
                      case 6:
                        unint64_t v57 = 0x614E656C646E7562;
                        unint64_t v56 = 0xEA0000000000656DLL;
                        break;
                      case 7:
                        unint64_t v56 = v153[0] | 0x8000000000000000;
                        unint64_t v57 = 0xD000000000000011;
                        break;
                      case 8:
                        unint64_t v57 = 0x6D6954646E657274;
                        unint64_t v56 = 0xEE0065706F637365;
                        break;
                      case 9:
                        unint64_t v57 = 0x6372756F536C7275;
LABEL_80:
                        unint64_t v56 = 0xE900000000000065;
                        break;
                      default:
                        unint64_t v56 = 0xE400000000000000;
                        unint64_t v57 = 1702125924;
                        break;
                    }
                    *(void *)&long long v182 = v57;
                    *((void *)&v182 + 1) = v56;
                    sub_1E01383E0();
                    uint64_t v183 = MEMORY[0x1E4F277C0];
                    *(void *)&long long v182 = v53;
                    *((void *)&v182 + 1) = v55;
                    sub_1E011AF04(&v182, &v181);
                    sub_1E012D998(v53, v55);
                    char v131 = swift_isUniquelyReferenced_nonNull_native();
                    unint64_t v180 = v19;
                    sub_1E012CF7C(&v181, (uint64_t)v184, v131);
                    unint64_t v19 = v180;
                    swift_bridgeObjectRelease();
                    sub_1E0120314((uint64_t)v184);
                    sub_1E012D9F0(v53, v55);

                    sub_1E012C2E4(v178, (uint64_t (*)(void))type metadata accessor for HAURL);
                    uint64_t v9 = v175;
                    (*v170)(v11, v175);
                  }
                  else
                  {
                    uint64_t v70 = v52;
                    unint64_t v169 = v19;
                    uint64_t v71 = (void *)sub_1E0137FF0();

                    swift_willThrow();
                    if (qword_1EC05B670 != -1) {
                      swift_once();
                    }
                    uint64_t v166 = 0;
                    uint64_t v72 = v164;
                    uint64_t v73 = __swift_project_value_buffer(v164, (uint64_t)qword_1EC05B758);
                    (*v158)(v163, v73, v72);
                    uint64_t v74 = swift_allocObject();
                    *(void *)(v74 + 16) = v71;
                    id v75 = v71;
                    id v76 = v71;
                    os_log_t v165 = (os_log_t)sub_1E0138120();
                    LODWORD(v161) = sub_1E0138300();
                    uint64_t v77 = swift_allocObject();
                    *(unsigned char *)(v77 + 16) = 32;
                    uint64_t v78 = swift_allocObject();
                    id v159 = v71;
                    uint64_t v79 = v78;
                    *(unsigned char *)(v78 + 16) = 8;
                    uint64_t v80 = swift_allocObject();
                    *(unsigned char *)(v80 + 16) = 32;
                    uint64_t v81 = swift_allocObject();
                    *(unsigned char *)(v81 + 16) = 8;
                    uint64_t v82 = swift_allocObject();
                    *(void *)(v82 + 16) = sub_1E012D6A8;
                    *(void *)(v82 + 24) = v74;
                    uint64_t v83 = swift_allocObject();
                    *(void *)(v83 + 16) = sub_1E012D73C;
                    *(void *)(v83 + 24) = v82;
                    sub_1E012C344(0, &qword_1EACE18F8, (uint64_t (*)(uint64_t))sub_1E012D76C, MEMORY[0x1E4FBBE00]);
                    uint64_t v84 = swift_allocObject();
                    *(_OWORD *)(v84 + 16) = v157;
                    *(void *)(v84 + 32) = sub_1E012D6C0;
                    *(void *)(v84 + 40) = v77;
                    *(void *)(v84 + 48) = sub_1E012DFFC;
                    *(void *)(v84 + 56) = v79;
                    *(void *)(v84 + 64) = sub_1E012BA2C;
                    *(void *)(v84 + 72) = 0;
                    *(void *)(v84 + 80) = sub_1E012DFFC;
                    *(void *)(v84 + 88) = v80;
                    *(void *)(v84 + 96) = sub_1E012DFFC;
                    *(void *)(v84 + 104) = v81;
                    *(void *)(v84 + 112) = sub_1E012D764;
                    *(void *)(v84 + 120) = v83;
                    uint64_t v160 = v74;
                    swift_retain();
                    swift_retain();
                    swift_retain();
                    swift_retain();
                    swift_retain();
                    swift_retain();
                    swift_retain();
                    swift_bridgeObjectRelease();
                    int v85 = v161;
                    if (os_log_type_enabled(v165, (os_log_type_t)v161))
                    {
                      uint64_t v86 = (uint8_t *)swift_slowAlloc();
                      v161 = (void *)swift_slowAlloc();
                      v184[0] = v161;
                      *(_WORD *)uint64_t v86 = 514;
                      int v154 = v85;
                      v86[2] = 32;
                      swift_release();
                      v86[3] = 8;
                      swift_release();
                      *(void *)&long long v182 = sub_1E012BBD0(0x4C52554148, 0xE500000000000000, (uint64_t *)v184);
                      sub_1E0138340();
                      v86[12] = 32;
                      swift_release();
                      v86[13] = 8;
                      swift_release();
                      id v87 = v159;
                      *(void *)&long long v182 = v159;
                      id v88 = v159;
                      sub_1E0122AAC();
                      uint64_t v89 = sub_1E01381B0();
                      *(void *)&long long v182 = sub_1E012BBD0(v89, v90, (uint64_t *)v184);
                      sub_1E0138340();
                      swift_release();
                      swift_release();
                      swift_release();
                      swift_bridgeObjectRelease();

                      os_log_t v91 = v165;
                      _os_log_impl(&dword_1E0118000, v165, (os_log_type_t)v154, "%s Failed to encode data with error %s", v86, 0x16u);
                      v92 = v161;
                      swift_arrayDestroy();
                      MEMORY[0x1E01F1830](v92, -1, -1);
                      MEMORY[0x1E01F1830](v86, -1, -1);

                      char v93 = v87;
                    }
                    else
                    {
                      swift_release();
                      swift_release();
                      swift_release();

                      id v94 = v159;
                      swift_release();
                      swift_release();
                      swift_release();
                      swift_release();
                      char v93 = v94;
                    }

                    (*v156)(v163, v164);
                    sub_1E012C2E4(v178, (uint64_t (*)(void))type metadata accessor for HAURL);
                    uint64_t v9 = v175;
                    (*v170)(v11, v175);
                    unint64_t v19 = v169;
                    uint64_t v18 = v171;
                  }
                  goto LABEL_92;
                }
              }
              unint64_t v169 = v19;
              LOBYTE(v184[0]) = v26;
              uint64_t Parameter = QueryParameterName.rawValue.getter();
              uint64_t v61 = v60;
              v62 = self;
              id v63 = objc_msgSend(v62, sel_queryParameterNameDataTypeCode);
              uint64_t v64 = sub_1E0138190();
              uint64_t v66 = v65;

              if (Parameter == v64 && v61 == v66)
              {
                swift_bridgeObjectRelease_n();
                unint64_t v67 = v169;
                goto LABEL_57;
              }
              char v68 = sub_1E01384F0();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              unint64_t v67 = v169;
              if ((v68 & 1) == 0)
              {
                LOBYTE(v184[0]) = v26;
                if (QueryParameterName.rawValue.getter() == 0x79726F6765746163 && v69 == 0xE800000000000000)
                {
                  swift_bridgeObjectRelease();
                  goto LABEL_57;
                }
                char v95 = sub_1E01384F0();
                swift_bridgeObjectRelease();
                if ((v95 & 1) == 0)
                {
LABEL_60:
                  LOBYTE(v184[0]) = v26;
                  uint64_t v100 = QueryParameterName.rawValue.getter();
                  uint64_t v102 = v101;
                  id v103 = objc_msgSend(v62, sel_queryParameterNameDate);
                  uint64_t v104 = sub_1E0138190();
                  uint64_t v106 = v105;

                  if (v100 != v104 || v102 != v106)
                  {
                    char v107 = sub_1E01384F0();
                    swift_bridgeObjectRelease();
                    uint64_t v108 = swift_bridgeObjectRelease();
                    if (v107) {
                      goto LABEL_69;
                    }
                    LOBYTE(v184[0]) = v26;
                    uint64_t v109 = QueryParameterName.rawValue.getter();
                    uint64_t v111 = v110;
                    id v112 = objc_msgSend(v62, sel_queryParameterNameStartDate);
                    uint64_t v113 = sub_1E0138190();
                    uint64_t v115 = v114;

                    if (v109 != v113 || v111 != v115)
                    {
                      char v116 = sub_1E01384F0();
                      swift_bridgeObjectRelease();
                      uint64_t v108 = swift_bridgeObjectRelease();
                      if ((v116 & 1) == 0)
                      {
                        LOBYTE(v184[0]) = v26;
                        uint64_t v117 = QueryParameterName.rawValue.getter();
                        uint64_t v119 = v118;
                        id v120 = objc_msgSend(v62, sel_queryParameterNameEndDate);
                        uint64_t v121 = sub_1E0138190();
                        uint64_t v123 = v122;

                        if (v117 == v121 && v119 == v123) {
                          goto LABEL_68;
                        }
                        char v134 = sub_1E01384F0();
                        swift_bridgeObjectRelease();
                        uint64_t v108 = swift_bridgeObjectRelease();
                        if ((v134 & 1) == 0)
                        {
LABEL_104:
                          unint64_t v130 = v169;
                          uint64_t v9 = v175;
                          unint64_t v20 = v179;
                          unint64_t v135 = v167 | 0x8000000000000000;
                          unint64_t v136 = 0xD000000000000011;
                          uint64_t v137 = v26;
                          uint64_t v18 = v171;
                          switch(v137)
                          {
                            case 1:
                              unint64_t v136 = 0x7461447472617473;
                              goto LABEL_114;
                            case 2:
                              unint64_t v135 = 0xE700000000000000;
                              unint64_t v136 = 0x65746144646E65;
                              break;
                            case 3:
                              unint64_t v135 = 0xE500000000000000;
                              unint64_t v136 = 0x7972657571;
                              break;
                            case 4:
                              unint64_t v136 = 0x6570795461746164;
                              unint64_t v135 = 0xEC00000065646F43;
                              break;
                            case 5:
                              break;
                            case 6:
                              unint64_t v136 = 0x614E656C646E7562;
                              unint64_t v135 = 0xEA0000000000656DLL;
                              break;
                            case 7:
                              unint64_t v135 = v153[0] | 0x8000000000000000;
                              unint64_t v136 = 0xD000000000000011;
                              break;
                            case 8:
                              unint64_t v136 = 0x6D6954646E657274;
                              unint64_t v135 = 0xEE0065706F637365;
                              break;
                            case 9:
                              unint64_t v136 = 0x6372756F536C7275;
LABEL_114:
                              unint64_t v135 = 0xE900000000000065;
                              break;
                            default:
                              unint64_t v135 = 0xE400000000000000;
                              unint64_t v136 = 1702125924;
                              break;
                          }
                          *(void *)&long long v182 = v136;
                          *((void *)&v182 + 1) = v135;
                          uint64_t v138 = MEMORY[0x1E4FBB1A0];
                          sub_1E01383E0();
                          uint64_t v183 = v138;
                          *(void *)&long long v182 = v36;
                          *((void *)&v182 + 1) = v37;
                          goto LABEL_116;
                        }
                      }
LABEL_69:
                      v184[0] = 0;
                      MEMORY[0x1F4188790](v108);
                      v153[-2] = v184;
                      swift_bridgeObjectRetain();
                      uint64_t v124 = v166;
                      char v125 = sub_1E012D144((uint64_t)sub_1E012D658, (uint64_t)&v153[-4], v36, v37);
                      uint64_t v166 = v124;
                      swift_bridgeObjectRelease();
                      if ((v125 & 1) == 0) {
                        goto LABEL_104;
                      }
                      swift_bridgeObjectRelease();
                      id v126 = v184[0];
                      unint64_t v127 = v167 | 0x8000000000000000;
                      unint64_t v128 = 0xD000000000000011;
                      uint64_t v129 = v26;
                      unint64_t v130 = v169;
                      uint64_t v9 = v175;
                      unint64_t v20 = v179;
                      uint64_t v18 = v171;
                      switch(v129)
                      {
                        case 1:
                          unint64_t v128 = 0x7461447472617473;
                          goto LABEL_101;
                        case 2:
                          unint64_t v127 = 0xE700000000000000;
                          unint64_t v128 = 0x65746144646E65;
                          break;
                        case 3:
                          unint64_t v127 = 0xE500000000000000;
                          unint64_t v128 = 0x7972657571;
                          break;
                        case 4:
                          unint64_t v128 = 0x6570795461746164;
                          unint64_t v127 = 0xEC00000065646F43;
                          break;
                        case 5:
                          break;
                        case 6:
                          unint64_t v128 = 0x614E656C646E7562;
                          unint64_t v127 = 0xEA0000000000656DLL;
                          break;
                        case 7:
                          unint64_t v127 = v153[0] | 0x8000000000000000;
                          unint64_t v128 = 0xD000000000000011;
                          break;
                        case 8:
                          unint64_t v128 = 0x6D6954646E657274;
                          unint64_t v127 = 0xEE0065706F637365;
                          break;
                        case 9:
                          unint64_t v128 = 0x6372756F536C7275;
LABEL_101:
                          unint64_t v127 = 0xE900000000000065;
                          break;
                        default:
                          unint64_t v127 = 0xE400000000000000;
                          unint64_t v128 = 1702125924;
                          break;
                      }
                      *(void *)&long long v182 = v128;
                      *((void *)&v182 + 1) = v127;
                      sub_1E01383E0();
                      uint64_t v183 = MEMORY[0x1E4FBB3D0];
                      *(void *)&long long v182 = v126;
LABEL_116:
                      sub_1E011AF04(&v182, &v181);
                      char v139 = swift_isUniquelyReferenced_nonNull_native();
                      unint64_t v180 = v130;
                      sub_1E012CF7C(&v181, (uint64_t)v184, v139);
                      unint64_t v19 = v180;
                      swift_bridgeObjectRelease();
                      sub_1E0120314((uint64_t)v184);
                      sub_1E012C2E4(v178, (uint64_t (*)(void))type metadata accessor for HAURL);
                      (*v170)(v11, v9);
                      goto LABEL_9;
                    }
                  }
LABEL_68:
                  uint64_t v108 = swift_bridgeObjectRelease_n();
                  goto LABEL_69;
                }
              }
LABEL_57:
              swift_bridgeObjectRetain();
              sub_1E012740C(v36, v37);
              if (v96) {
                goto LABEL_60;
              }
              swift_bridgeObjectRelease();
              unint64_t v97 = v167 | 0x8000000000000000;
              unint64_t v98 = 0xD000000000000011;
              uint64_t v99 = v26;
              uint64_t v9 = v175;
              uint64_t v18 = v171;
              switch(v99)
              {
                case 1:
                  unint64_t v98 = 0x7461447472617473;
                  goto LABEL_90;
                case 2:
                  unint64_t v97 = 0xE700000000000000;
                  unint64_t v98 = 0x65746144646E65;
                  break;
                case 3:
                  unint64_t v97 = 0xE500000000000000;
                  unint64_t v98 = 0x7972657571;
                  break;
                case 4:
                  unint64_t v98 = 0x6570795461746164;
                  unint64_t v97 = 0xEC00000065646F43;
                  break;
                case 5:
                  break;
                case 6:
                  unint64_t v98 = 0x614E656C646E7562;
                  unint64_t v97 = 0xEA0000000000656DLL;
                  break;
                case 7:
                  unint64_t v97 = v153[0] | 0x8000000000000000;
                  unint64_t v98 = 0xD000000000000011;
                  break;
                case 8:
                  unint64_t v98 = 0x6D6954646E657274;
                  unint64_t v97 = 0xEE0065706F637365;
                  break;
                case 9:
                  unint64_t v98 = 0x6372756F536C7275;
LABEL_90:
                  unint64_t v97 = 0xE900000000000065;
                  break;
                default:
                  unint64_t v97 = 0xE400000000000000;
                  unint64_t v98 = 1702125924;
                  break;
              }
              *(void *)&long long v182 = v98;
              *((void *)&v182 + 1) = v97;
              sub_1E01383E0();
              uint64_t v132 = sub_1E01382E0();
              uint64_t v183 = sub_1E012D8DC(0, (unint64_t *)&qword_1EACE1898);
              *(void *)&long long v182 = v132;
              sub_1E011AF04(&v182, &v181);
              char v133 = swift_isUniquelyReferenced_nonNull_native();
              unint64_t v180 = v67;
              sub_1E012CF7C(&v181, (uint64_t)v184, v133);
              unint64_t v19 = v180;
              swift_bridgeObjectRelease();
              sub_1E0120314((uint64_t)v184);
              sub_1E012C2E4(v178, (uint64_t (*)(void))type metadata accessor for HAURL);
              (*v170)(v11, v9);
LABEL_92:
              unint64_t v20 = v179;
LABEL_9:
              if (v20 == v176) {
                goto LABEL_117;
              }
              break;
          }
          break;
        }
      }
    }
LABEL_117:
    swift_bridgeObjectRelease();
    uint64_t v140 = sub_1E01380B0();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v140 - 8) + 16))(v162, v168, v140);
    v141 = (void *)sub_1E0138090();
    if (!v142) {
      goto LABEL_119;
    }
    v184[0] = v141;
    v184[1] = v142;
    id v143 = objc_msgSend(self, sel_internalHealthAppURLScheme);
    uint64_t v144 = sub_1E0138190();
    uint64_t v146 = v145;

    *(void *)&long long v182 = v144;
    *((void *)&v182 + 1) = v146;
    sub_1E011FF24();
    uint64_t v147 = MEMORY[0x1E4FBB1A0];
    uint64_t v148 = sub_1E0138370();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (!v148)
    {
      *(void *)&long long v182 = 0x63536D6F74737563;
      *((void *)&v182 + 1) = 0xEF4C5255656D6568;
      sub_1E01383E0();
      uint64_t v149 = sub_1E0138010();
      uint64_t v183 = v147;
      *(void *)&long long v182 = v149;
      *((void *)&v182 + 1) = v150;
      sub_1E011AF04(&v182, &v181);
      char v151 = swift_isUniquelyReferenced_nonNull_native();
      unint64_t v180 = v19;
      sub_1E012CF7C(&v181, (uint64_t)v184, v151);
      unint64_t v19 = v180;
      swift_bridgeObjectRelease();
      sub_1E0120314((uint64_t)v184);

      sub_1E012C2E4(v162, (uint64_t (*)(void))type metadata accessor for HAURLValidator);
    }
    else
    {
LABEL_119:
      sub_1E012C2E4(v162, (uint64_t (*)(void))type metadata accessor for HAURLValidator);
    }
  }
  else
  {
    unint64_t v19 = 0;
  }
  v152 = (void *)v19;
  result.value._rawValue = v152;
  result.is_nil = v15;
  return result;
}

uint64_t sub_1E012B030(void *a1)
{
  id v1 = a1;
  sub_1E0122AAC();
  return sub_1E01381B0();
}

uint64_t sub_1E012B068(uint64_t a1, char a2, uint64_t (*a3)(void *), uint64_t a4, uint64_t a5, unint64_t a6)
{
  v50[3] = a4;
  if (a1 < 0) {
    goto LABEL_42;
  }
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = MEMORY[0x1E4FBC860];
  uint64_t v47 = swift_allocObject();
  *(void *)(v47 + 16) = 15;
  uint64_t v11 = HIBYTE(a6) & 0xF;
  if (!a1 || ((a6 & 0x2000000000000000) != 0 ? (uint64_t v12 = HIBYTE(a6) & 0xF) : (uint64_t v12 = a5 & 0xFFFFFFFFFFFFLL), !v12))
  {
    if ((a6 & 0x2000000000000000) == 0) {
      uint64_t v11 = a5 & 0xFFFFFFFFFFFFLL;
    }
    uint64_t v30 = 7;
    if (((a6 >> 60) & ((a5 & 0x800000000000000) == 0)) != 0) {
      uint64_t v30 = 11;
    }
    sub_1E012B50C(v30 | (v11 << 16), v47, a2 & 1, v10);
    swift_bridgeObjectRelease();
    uint64_t v13 = *(void **)(v10 + 16);
    swift_bridgeObjectRetain();
    swift_release();
LABEL_39:
    swift_release();
    return (uint64_t)v13;
  }
  uint64_t v42 = a1;
  uint64_t v43 = v10;
  unint64_t v48 = 4 * v12;
  uint64_t v13 = (void *)MEMORY[0x1E4FBC860];
  unint64_t v14 = 15;
  unint64_t v15 = 15;
  unint64_t v16 = 15;
  while (1)
  {
    v50[0] = sub_1E0138280();
    v50[1] = v17;
    char v18 = a3(v50);
    if (v6)
    {
      swift_release();
      swift_release();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return (uint64_t)v13;
    }
    char v19 = v18;
    swift_bridgeObjectRelease();
    if (v19) {
      break;
    }
    unint64_t v14 = sub_1E01381E0();
LABEL_9:
    if (v48 == v14 >> 14) {
      goto LABEL_29;
    }
  }
  if (v15 >> 14 == v14 >> 14 && (a2 & 1) != 0)
  {
    unint64_t v14 = sub_1E01381E0();
    *(void *)(v47 + 16) = v14;
    unint64_t v15 = v14;
    unint64_t v16 = v14;
    goto LABEL_9;
  }
  if (v14 >> 14 < v15 >> 14) {
    goto LABEL_41;
  }
  uint64_t v20 = sub_1E01382A0();
  uint64_t v44 = v21;
  uint64_t v45 = v20;
  uint64_t v23 = v22;
  uint64_t v25 = v24;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v13 = sub_1E012B8FC(0, v13[2] + 1, 1, v13);
  }
  unint64_t v27 = v13[2];
  unint64_t v26 = v13[3];
  if (v27 >= v26 >> 1) {
    uint64_t v13 = sub_1E012B8FC((void *)(v26 > 1), v27 + 1, 1, v13);
  }
  v13[2] = v27 + 1;
  uint64_t v28 = &v13[4 * v27];
  v28[4] = v45;
  v28[5] = v23;
  v28[6] = v25;
  v28[7] = v44;
  *(void *)(v43 + 16) = v13;
  uint64_t v29 = sub_1E01381E0();
  unint64_t v14 = v29;
  *(void *)(v47 + 16) = v29;
  if (v13[2] != v42)
  {
    unint64_t v15 = v29;
    unint64_t v16 = v29;
    goto LABEL_9;
  }
  unint64_t v16 = v29;
  unint64_t v15 = v29;
LABEL_29:
  if (v48 == v15 >> 14 && (a2 & 1) != 0)
  {
    swift_bridgeObjectRelease();
LABEL_38:
    swift_bridgeObjectRetain();
    swift_release();
    goto LABEL_39;
  }
  if (v48 >= v16 >> 14)
  {
    uint64_t v31 = sub_1E01382A0();
    uint64_t v33 = v32;
    uint64_t v35 = v34;
    uint64_t v37 = v36;
    swift_bridgeObjectRelease();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v13 = sub_1E012B8FC(0, v13[2] + 1, 1, v13);
    }
    unint64_t v39 = v13[2];
    unint64_t v38 = v13[3];
    if (v39 >= v38 >> 1) {
      uint64_t v13 = sub_1E012B8FC((void *)(v38 > 1), v39 + 1, 1, v13);
    }
    v13[2] = v39 + 1;
    uint64_t v40 = &v13[4 * v39];
    v40[4] = v31;
    v40[5] = v33;
    v40[6] = v35;
    v40[7] = v37;
    *(void *)(v43 + 16) = v13;
    goto LABEL_38;
  }
LABEL_41:
  sub_1E0138440();
  __break(1u);
LABEL_42:
  uint64_t result = sub_1E0138440();
  __break(1u);
  return result;
}

uint64_t sub_1E012B50C(unint64_t a1, uint64_t a2, unsigned __int8 a3, uint64_t a4)
{
  unint64_t v4 = *(void *)(a2 + 16) >> 14;
  int v5 = (v4 == a1 >> 14) & a3;
  if (v5 == 1) {
    return v5 ^ 1u;
  }
  if (a1 >> 14 >= v4)
  {
    uint64_t v7 = sub_1E01382A0();
    uint64_t v9 = v8;
    uint64_t v11 = v10;
    uint64_t v13 = v12;
    unint64_t v14 = *(void **)(a4 + 16);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *(void *)(a4 + 16) = v14;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      unint64_t v14 = sub_1E012B8FC(0, v14[2] + 1, 1, v14);
      *(void *)(a4 + 16) = v14;
    }
    unint64_t v17 = v14[2];
    unint64_t v16 = v14[3];
    if (v17 >= v16 >> 1)
    {
      unint64_t v14 = sub_1E012B8FC((void *)(v16 > 1), v17 + 1, 1, v14);
      *(void *)(a4 + 16) = v14;
    }
    void v14[2] = v17 + 1;
    char v18 = &v14[4 * v17];
    v18[4] = v7;
    v18[5] = v9;
    v18[6] = v11;
    v18[7] = v13;
    return v5 ^ 1u;
  }
  uint64_t result = sub_1E0138440();
  __break(1u);
  return result;
}

uint64_t sub_1E012B668(char a1, int64_t a2, char a3, unint64_t a4)
{
  if (a3)
  {
    unint64_t v6 = *(void *)(a4 + 24);
    uint64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_29;
      }
      uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        uint64_t v7 = a2;
      }
    }
  }
  else
  {
    uint64_t v7 = a2;
  }
  uint64_t v8 = *(void *)(a4 + 16);
  if (v7 <= v8) {
    uint64_t v9 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v9 = v7;
  }
  if (!v9)
  {
    uint64_t v13 = (void *)MEMORY[0x1E4FBC860];
    goto LABEL_19;
  }
  sub_1E012C344(0, &qword_1EACE1940, MEMORY[0x1E4F26EA0], MEMORY[0x1E4FBBE00]);
  uint64_t v10 = *(void *)(sub_1E0137F10() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (void *)swift_allocObject();
  size_t v14 = _swift_stdlib_malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (BOOL v15 = v11 == -1) : (BOOL v15 = 0), v15))
  {
LABEL_29:
    uint64_t result = sub_1E0138440();
    __break(1u);
    return result;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  uint64_t v16 = *(void *)(sub_1E0137F10() - 8);
  unint64_t v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  unint64_t v18 = (unint64_t)v13 + v17;
  if (a1)
  {
    if ((unint64_t)v13 < a4 || v18 >= a4 + v17 + *(void *)(v16 + 72) * v8)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != (void *)a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_1E012D314(0, v8, v18, a4);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v13;
}

void *sub_1E012B8FC(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = a4[3];
  uint64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v7 = a2;
    }
LABEL_8:
    uint64_t v8 = a4[2];
    if (v7 <= v8) {
      uint64_t v9 = a4[2];
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      sub_1E012DEF8(0, &qword_1EC05B660, MEMORY[0x1E4FBB7A8], MEMORY[0x1E4FBBE00]);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 1;
      }
      _OWORD v10[2] = v8;
      v10[3] = 2 * (v12 >> 5);
      uint64_t v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x1E4FBC860];
      uint64_t v13 = (void *)(MEMORY[0x1E4FBC860] + 32);
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[4 * v8 + 4]) {
          memmove(v13, a4 + 4, 32 * v8);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_1E012D46C(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_1E012BA2C(uint64_t *a1, uint64_t a2, uint64_t *a3)
{
  type metadata accessor for HAURL();
  uint64_t v5 = sub_1E0138550();
  sub_1E012BBD0(v5, v6, a3);
  uint64_t v7 = *a1 + 8;
  sub_1E0138340();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v7;
  return result;
}

uint64_t sub_1E012BAA8(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a4();
  sub_1E012BBD0(v6, v7, a3);
  uint64_t v8 = *a1 + 8;
  sub_1E0138340();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t type metadata accessor for HAURL()
{
  uint64_t result = qword_1EC05B4F8;
  if (!qword_1EC05B4F8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1E012BB6C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for HAURL();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1E012BBD0(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_1E012BCA4(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_1E011AEA8((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    uint64_t ObjectType = MEMORY[0x1E4FBB9B0];
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_1E011AEA8((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_1E012BCA4(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        uint64_t v11 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v11)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (void *)&__dst[v11] || (char *)__src + v11 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            sub_1E0138350();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_1E012BE60(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0) {
    goto LABEL_13;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  uint64_t v8 = sub_1E0138420();
  if (!v8)
  {
    sub_1E0138440();
    __break(1u);
LABEL_17:
    uint64_t result = sub_1E01384A0();
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

uint64_t sub_1E012BE60(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_1E012BEF8(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_1E012C174(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_1E012C174(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_1E012BEF8(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0) {
    goto LABEL_10;
  }
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v2 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v2)
  {
    while (1)
    {
      unint64_t v3 = sub_1E012C070(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_1E0138410();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_1E0138440();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_1E0138200();
      if (!v2) {
        return MEMORY[0x1E4FBC860];
      }
    }
    sub_1E01384A0();
    __break(1u);
LABEL_14:
    uint64_t result = sub_1E0138440();
    __break(1u);
  }
  else
  {
    return MEMORY[0x1E4FBC860];
  }
  return result;
}

void *sub_1E012C070(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return (void *)MEMORY[0x1E4FBC860];
  }
  sub_1E012DEF8(0, &qword_1EACE1938, MEMORY[0x1E4FBC358], MEMORY[0x1E4FBBE00]);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_1E012C0F8(unint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3 = a1;
  uint64_t v4 = (unsigned __int16)a1 >> 14;
  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    uint64_t v10 = sub_1E0138250();
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
    uint64_t v5 = MEMORY[0x1E01F0F00](15, a1 >> 16);
    uint64_t v6 = v5 + (v4 << 16);
    unint64_t v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    unint64_t v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4) {
      unint64_t v8 = v7;
    }
    return v8 | 8;
  }
}

uint64_t sub_1E012C174(char a1, int64_t a2, char a3, char *a4)
{
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
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
  int64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    int64_t v9 = *((void *)a4 + 2);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    sub_1E012DEF8(0, &qword_1EACE1938, MEMORY[0x1E4FBC358], MEMORY[0x1E4FBBE00]);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x1E4FBC860];
  }
  unint64_t v12 = v10 + 32;
  unint64_t v13 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v12 >= &v13[v8]) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_1E01384A0();
  __break(1u);
  return result;
}

uint64_t sub_1E012C2E4(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

void sub_1E012C344(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v7 = a3(255);
    unint64_t v8 = a4(a1, v7);
    if (!v9) {
      atomic_store(v8, a2);
    }
  }
}

uint64_t sub_1E012C3A8(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t))
{
  sub_1E012C344(0, a2, a3, MEMORY[0x1E4FBB718]);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  return a1;
}

unsigned __int8 *sub_1E012C418(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v13 = a1;
  uint64_t v14 = a2;
  swift_bridgeObjectRetain();
  uint64_t v5 = sub_1E0138290();
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
  uint64_t v5 = sub_1E012C77C();
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
    uint64_t v7 = (unsigned __int8 *)sub_1E0138420();
  }
LABEL_7:
  size_t v11 = sub_1E012C500(v7, v8, a3);
  swift_bridgeObjectRelease();
  return v11;
}

unsigned __int8 *sub_1E012C500(unsigned __int8 *result, uint64_t a2, uint64_t a3)
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
            for (i = result + 1; ; ++i)
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
  unint64_t v18 = result + 1;
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

uint64_t sub_1E012C77C()
{
  unint64_t v0 = sub_1E01382A0();
  uint64_t v4 = sub_1E012C7FC(v0, v1, v2, v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_1E012C7FC(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  if ((a4 & 0x1000000000000000) != 0)
  {
    uint64_t v9 = sub_1E012C954(a1, a2, a3, a4);
    if (v9)
    {
      uint64_t v10 = v9;
      unsigned int v11 = sub_1E012C070(v9, 0);
      unint64_t v12 = sub_1E012CA54((unint64_t)v14, (uint64_t)(v11 + 4), v10, a1, a2, a3, a4);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      if (v12 != v10)
      {
        __break(1u);
LABEL_11:
        sub_1E0138420();
LABEL_4:
        JUMPOUT(0x1E01F0EA0);
      }
    }
    else
    {
      unsigned int v11 = (void *)MEMORY[0x1E4FBC860];
    }
    uint64_t v13 = MEMORY[0x1E01F0EA0](v11 + 4, v11[2]);
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
    return MEMORY[0x1E01F0EA0]((char *)v14 + (a1 >> 16), (a2 >> 16) - (a1 >> 16));
  }
}

uint64_t sub_1E012C954(unint64_t a1, unint64_t a2, unint64_t a3, uint64_t a4)
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
    a1 = sub_1E012C0F8(a1, a3, a4);
    unint64_t v7 = a1;
  }
  if ((v6 & 0xC) == v9)
  {
    a1 = sub_1E012C0F8(v6, v5, v4);
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
    return MEMORY[0x1F4183AA8](a1, a2, a3, a4);
  }
  __break(1u);
  return MEMORY[0x1F4183AA8](a1, a2, a3, a4);
}

unint64_t sub_1E012CA54(unint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, unint64_t a7)
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
    uint64_t result = v12;
    if (v17 == v15) {
      uint64_t result = sub_1E012C0F8(v12, a6, a7);
    }
    if (result >> 14 < v27 || result >> 14 >= v10) {
      break;
    }
    if ((a7 & 0x1000000000000000) != 0)
    {
      uint64_t result = sub_1E0138240();
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
        uint64_t result = v21;
        if ((a6 & 0x1000000000000000) == 0) {
          uint64_t result = sub_1E0138420();
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
    uint64_t result = sub_1E012C0F8(v12, a6, a7);
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
    unint64_t v12 = sub_1E0138210();
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

uint64_t sub_1E012CC68(uint64_t a1, char a2)
{
  unint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_1E011B078();
  uint64_t v6 = sub_1E0138470();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_41;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v36 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  int64_t v11 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v12 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v14 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v20 = v19 | (v14 << 6);
      goto LABEL_22;
    }
    int64_t v21 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v21 >= v11) {
      break;
    }
    uint64_t v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v36 + 8 * v21);
    ++v14;
    if (!v23)
    {
      int64_t v14 = v21 + 1;
      if (v21 + 1 >= v11) {
        goto LABEL_34;
      }
      unint64_t v23 = *(void *)(v36 + 8 * v14);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v11)
        {
LABEL_34:
          swift_release();
          if ((a2 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v23 = *(void *)(v36 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v14 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_43;
            }
            if (v14 >= v11) {
              goto LABEL_34;
            }
            unint64_t v23 = *(void *)(v36 + 8 * v14);
            ++v24;
            if (v23) {
              goto LABEL_21;
            }
          }
        }
        int64_t v14 = v24;
      }
    }
LABEL_21:
    unint64_t v10 = (v23 - 1) & v23;
    unint64_t v20 = __clz(__rbit64(v23)) + (v14 << 6);
LABEL_22:
    uint64_t v25 = *(void *)(v5 + 48) + 40 * v20;
    if (a2)
    {
      long long v26 = *(_OWORD *)v25;
      long long v27 = *(_OWORD *)(v25 + 16);
      uint64_t v40 = *(void *)(v25 + 32);
      long long v38 = v26;
      long long v39 = v27;
      sub_1E011AF04((_OWORD *)(*(void *)(v5 + 56) + 32 * v20), v37);
    }
    else
    {
      sub_1E012DE50(v25, (uint64_t)&v38);
      sub_1E011AEA8(*(void *)(v5 + 56) + 32 * v20, (uint64_t)v37);
    }
    uint64_t result = sub_1E01383C0();
    uint64_t v28 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v29 = result & ~v28;
    unint64_t v30 = v29 >> 6;
    if (((-1 << v29) & ~*(void *)(v12 + 8 * (v29 >> 6))) != 0)
    {
      unint64_t v15 = __clz(__rbit64((-1 << v29) & ~*(void *)(v12 + 8 * (v29 >> 6)))) | v29 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v31 = 0;
      unint64_t v32 = (unint64_t)(63 - v28) >> 6;
      do
      {
        if (++v30 == v32 && (v31 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        BOOL v33 = v30 == v32;
        if (v30 == v32) {
          unint64_t v30 = 0;
        }
        v31 |= v33;
        uint64_t v34 = *(void *)(v12 + 8 * v30);
      }
      while (v34 == -1);
      unint64_t v15 = __clz(__rbit64(~v34)) + (v30 << 6);
    }
    *(void *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
    uint64_t v16 = *(void *)(v7 + 48) + 40 * v15;
    long long v17 = v38;
    long long v18 = v39;
    *(void *)(v16 + 32) = v40;
    *(_OWORD *)uint64_t v16 = v17;
    *(_OWORD *)(v16 + 16) = v18;
    uint64_t result = (uint64_t)sub_1E011AF04(v37, (_OWORD *)(*(void *)(v7 + 56) + 32 * v15));
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v22 = (void *)(v5 + 64);
  if ((a2 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v35 = 1 << *(unsigned char *)(v5 + 32);
  if (v35 >= 64) {
    bzero(v22, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    void *v22 = -1 << v35;
  }
  *(void *)(v5 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  uint64_t *v3 = v7;
  return result;
}

_OWORD *sub_1E012CF7C(_OWORD *a1, uint64_t a2, char a3)
{
  unint64_t v4 = (void **)v3;
  uint64_t v8 = (void *)*v3;
  unint64_t v10 = sub_1E011AF6C(a2);
  uint64_t v11 = v8[2];
  BOOL v12 = (v9 & 1) == 0;
  uint64_t v13 = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
    goto LABEL_15;
  }
  char v14 = v9;
  uint64_t v15 = v8[3];
  if (v15 < v13 || (a3 & 1) == 0)
  {
    if (v15 >= v13 && (a3 & 1) == 0)
    {
      sub_1E0130998();
      goto LABEL_7;
    }
    sub_1E012CC68(v13, a3 & 1);
    unint64_t v19 = sub_1E011AF6C(a2);
    if ((v14 & 1) == (v20 & 1))
    {
      unint64_t v10 = v19;
      uint64_t v16 = *v4;
      if (v14) {
        goto LABEL_8;
      }
LABEL_13:
      sub_1E012DE50(a2, (uint64_t)v21);
      return sub_1E012D0C8(v10, (uint64_t)v21, a1, v16);
    }
LABEL_15:
    uint64_t result = (_OWORD *)sub_1E0138510();
    __break(1u);
    return result;
  }
LABEL_7:
  uint64_t v16 = *v4;
  if ((v14 & 1) == 0) {
    goto LABEL_13;
  }
LABEL_8:
  long long v17 = (_OWORD *)(v16[7] + 32 * v10);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v17);
  return sub_1E011AF04(a1, v17);
}

_OWORD *sub_1E012D0C8(unint64_t a1, uint64_t a2, _OWORD *a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v5 = a4[6] + 40 * a1;
  long long v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)uint64_t v5 = *(_OWORD *)a2;
  *(_OWORD *)(v5 + 16) = v6;
  *(void *)(v5 + 32) = *(void *)(a2 + 32);
  uint64_t result = sub_1E011AF04(a3, (_OWORD *)(a4[7] + 32 * a1));
  uint64_t v8 = a4[2];
  BOOL v9 = __OFADD__(v8, 1);
  uint64_t v10 = v8 + 1;
  if (v9) {
    __break(1u);
  }
  else {
    a4[2] = v10;
  }
  return result;
}

uint64_t sub_1E012D144(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *(*v7)(uint64_t *__return_ptr, void *);
  uint64_t v8;
  uint64_t v9;
  unsigned __int8 v10;
  void v12[2];
  uint64_t v13;

  if ((a4 & 0x1000000000000000) != 0 || !(a4 & 0x2000000000000000 | a3 & 0x1000000000000000))
  {
    uint64_t v10 = sub_1E01383F0();
    if (!v4) {
      uint64_t v10 = BYTE1(v13);
    }
  }
  else
  {
    MEMORY[0x1F4188790](a1);
    if ((v6 & 0x2000000000000000) != 0)
    {
      v12[0] = v5;
      v12[1] = v6 & 0xFFFFFFFFFFFFFFLL;
      uint64_t v10 = v7(&v13, v12);
      if (!v4) {
        uint64_t v10 = v13;
      }
    }
    else
    {
      if ((v5 & 0x1000000000000000) != 0)
      {
        uint64_t v8 = (v6 & 0xFFFFFFFFFFFFFFFLL) + 32;
        BOOL v9 = v5 & 0xFFFFFFFFFFFFLL;
      }
      else
      {
        uint64_t v8 = sub_1E0138420();
      }
      uint64_t v10 = sub_1E012D25C(v8, v9, (void (*)(uint64_t *__return_ptr))sub_1E012DE38);
    }
  }
  return v10 & 1;
}

uint64_t sub_1E012D25C(uint64_t a1, uint64_t a2, void (*a3)(uint64_t *__return_ptr))
{
  if (a1)
  {
    a3(&var2);
    if (!v3) {
      char v4 = var2;
    }
  }
  else
  {
    ((void (*)(uint64_t *__return_ptr, void, void))a3)((uint64_t *)((char *)&var2 + 1), 0, 0);
    if (!v3) {
      char v4 = BYTE1(var2);
    }
  }
  return v4 & 1;
}

uint64_t sub_1E012D2BC(void *a1)
{
  unint64_t v2 = *(void **)(v1 + 16);
  if (*a1 == *v2 && a1[1] == v2[1]) {
    return 1;
  }
  else {
    return sub_1E01384F0() & 1;
  }
}

uint64_t sub_1E012D314(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v8 = *(void *)(sub_1E0137F10() - 8);
    uint64_t v9 = a4 + ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));
    uint64_t v10 = *(void *)(v8 + 72);
    unint64_t v11 = v9 + v10 * a1;
    unint64_t v12 = a3 + v10 * v4;
    if (v11 >= v12 || v11 + v10 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v12;
    }
  }
  uint64_t result = sub_1E01384A0();
  __break(1u);
  return result;
}

uint64_t sub_1E012D46C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 32 * a1 + 32;
    unint64_t v6 = a3 + 32 * v4;
    if (v5 >= v6 || v5 + 32 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_1E01384A0();
  __break(1u);
  return result;
}

uint64_t sub_1E012D560(unint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0) {
    uint64_t v6 = HIBYTE(a6) & 0xF;
  }
  else {
    uint64_t v6 = a5 & 0xFFFFFFFFFFFFLL;
  }
  if (a3 == a5 && a4 == a6 && !(a1 >> 16) && a2 >> 16 == v6) {
    return 1;
  }
  else {
    return sub_1E01384C0() & 1;
  }
}

uint64_t sub_1E012D5D8(uint64_t a1, uint64_t a2, unint64_t *a3, uint64_t (*a4)(uint64_t))
{
  sub_1E012C344(0, a3, a4, MEMORY[0x1E4FBB718]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a2, a1, v6);
  return a2;
}

unsigned char *sub_1E012D658@<X0>(unsigned char *a1@<X0>, BOOL *a2@<X8>)
{
  return sub_1E012DF44(a1, a2);
}

uint64_t sub_1E012D670()
{
  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_1E012D6A8()
{
  return sub_1E012B030(*(void **)(v0 + 16));
}

uint64_t sub_1E012D6B0()
{
  return MEMORY[0x1F4186498](v0, 17, 7);
}

unsigned char **sub_1E012D6C0(unsigned char **result)
{
  unint64_t v2 = *result;
  *unint64_t v2 = *(unsigned char *)(v1 + 16);
  *uint64_t result = v2 + 1;
  return result;
}

uint64_t sub_1E012D6D4()
{
  return MEMORY[0x1F4186498](v0, 17, 7);
}

uint64_t sub_1E012D6E4()
{
  return MEMORY[0x1F4186498](v0, 17, 7);
}

uint64_t sub_1E012D6F4()
{
  return MEMORY[0x1F4186498](v0, 17, 7);
}

uint64_t sub_1E012D704()
{
  swift_release();
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1E012D73C()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_1E012D764(uint64_t *a1, uint64_t a2, uint64_t *a3)
{
  return sub_1E012BAA8(a1, a2, a3, *(uint64_t (**)(void))(v3 + 16));
}

unint64_t sub_1E012D76C()
{
  unint64_t result = qword_1EACE1900;
  if (!qword_1EACE1900)
  {
    sub_1E012DEF8(255, &qword_1EC05B4D8, MEMORY[0x1E4FBC358], MEMORY[0x1E4FBB700]);
    sub_1E012C344(255, &qword_1EACE1908, (uint64_t (*)(uint64_t))sub_1E012D840, MEMORY[0x1E4FBB718]);
    sub_1E012D918();
    unint64_t result = swift_getFunctionTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_1EACE1900);
  }
  return result;
}

void sub_1E012D840(uint64_t a1)
{
}

void sub_1E012D874()
{
  if (!qword_1EACE1918)
  {
    sub_1E012D8DC(255, &qword_1EACE1920);
    unint64_t v0 = sub_1E0138330();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EACE1918);
    }
  }
}

uint64_t sub_1E012D8DC(uint64_t a1, unint64_t *a2)
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

void sub_1E012D918()
{
  if (!qword_1EACE1928)
  {
    sub_1E012DEF8(255, &qword_1EACE1930, MEMORY[0x1E4FBC840] + 8, MEMORY[0x1E4FBB700]);
    unint64_t v0 = sub_1E0138330();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EACE1928);
    }
  }
}

uint64_t sub_1E012D998(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_retain();
  }
  return swift_retain();
}

uint64_t sub_1E012D9F0(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_release();
  }
  return swift_release();
}

uint64_t initializeBufferWithCopyOfBuffer for HAURL(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1E01380B0();
  unint64_t v5 = **(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8);
  return v5(a1, a2, v4);
}

uint64_t destroy for HAURL(uint64_t a1)
{
  uint64_t v2 = sub_1E01380B0();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);
  return v3(a1, v2);
}

uint64_t initializeWithCopy for HAURL(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1E01380B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t assignWithCopy for HAURL(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1E01380B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t initializeWithTake for HAURL(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1E01380B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t assignWithTake for HAURL(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1E01380B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for HAURL(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1E012DCBC);
}

uint64_t sub_1E012DCBC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1E01380B0();
  unint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);
  return v5(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for HAURL(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1E012DD3C);
}

uint64_t sub_1E012DD3C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1E01380B0();
  unint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);
  return v5(a1, a2, a2, v4);
}

uint64_t sub_1E012DDAC()
{
  uint64_t result = sub_1E01380B0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

void *sub_1E012DE38@<X0>(unsigned char *a1@<X8>)
{
  return sub_1E012DFB4(a1);
}

uint64_t sub_1E012DE50(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_1E012DEB0()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_1E012DEE8()
{
  return MEMORY[0x1F4186498](v0, 24, 7);
}

void sub_1E012DEF8(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t (*a4)(void, uint64_t))
{
  if (!*a2)
  {
    unint64_t v5 = a4(0, a3);
    if (!v6) {
      atomic_store(v5, a2);
    }
  }
}

unsigned char *sub_1E012DF44@<X0>(unsigned char *result@<X0>, BOOL *a2@<X8>)
{
  unsigned int v3 = *result;
  BOOL v4 = v3 > 0x20;
  uint64_t v5 = (1 << v3) & 0x100003E01;
  BOOL v6 = v4 || v5 == 0;
  v7 = v6 && (uint64_t result = (unsigned char *)_swift_stdlib_strtod_clocale()) != 0 && *result == 0;
  *a2 = v7;
  return result;
}

void *sub_1E012DFB4@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = (*(void *(**)(uint64_t *__return_ptr))(v1 + 16))(&v5);
  if (!v2) {
    *a1 = v5;
  }
  return result;
}

uint64_t DeepLinkingDataParameter.addToURL(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  v23[0] = a4;
  v23[1] = a1;
  uint64_t v6 = sub_1E0137ED0();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  uint64_t v9 = (char *)v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v11 = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x1F4188790](AssociatedTypeWitness);
  uint64_t v13 = (char *)v23 - v12;
  (*(void (**)(uint64_t, uint64_t))(a3 + 40))(a2, a3);
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  uint64_t v15 = (*(uint64_t (**)(uint64_t, uint64_t))(AssociatedConformanceWitness + 8))(AssociatedTypeWitness, AssociatedConformanceWitness);
  uint64_t v17 = v16;
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, AssociatedTypeWitness);
  v23[2] = v15;
  void v23[3] = v17;
  sub_1E0137EC0();
  sub_1E011FF24();
  uint64_t v18 = sub_1E0138360();
  uint64_t v20 = v19;
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(a3 + 32))(a2, a3);
  sub_1E012EC90(v21, v18, v20, v23[0]);
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t static DeepLinkingDataParameter.fromURLQueryItems(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v10 = sub_1E0138330();
  uint64_t v53 = *(void *)(v10 - 8);
  uint64_t v11 = MEMORY[0x1F4188790](v10);
  unint64_t v54 = (char *)&v46 - v12;
  uint64_t v13 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v14 = MEMORY[0x1F4188790](v11);
  id v51 = (char *)&v46 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v14);
  id v52 = (char *)&v46 - v16;
  uint64_t v17 = sub_1E0137F10();
  uint64_t v18 = MEMORY[0x1F4188790](a1);
  uint64_t v20 = (char *)&v46 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = MEMORY[0x1F4188790](v18);
  uint64_t v24 = *(void *)(a1 + 16);
  if (v24)
  {
    uint64_t v48 = AssociatedTypeWitness;
    id v49 = (char *)&v46 - v22;
    uint64_t v46 = v10;
    uint64_t v47 = v13;
    uint64_t v56 = a4;
    uint64_t v57 = a3;
    uint64_t v58 = a2;
    uint64_t v50 = v23;
    uint64_t v25 = *(void (**)(char *, unint64_t, uint64_t))(v23 + 16);
    unint64_t v26 = v21 + ((*(unsigned __int8 *)(v23 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v23 + 80));
    long long v27 = (void (**)(char *, uint64_t))(v23 + 8);
    uint64_t v28 = *(void *)(v23 + 72);
    uint64_t v55 = v21;
    swift_bridgeObjectRetain();
    while (1)
    {
      v25(v20, v26, v17);
      if (sub_1E012F0B0((uint64_t)v20, v4, v58, v57)) {
        break;
      }
      (*v27)(v20, v17);
      v26 += v28;
      if (!--v24)
      {
        swift_bridgeObjectRelease();
        goto LABEL_12;
      }
    }
    swift_bridgeObjectRelease();
    unint64_t v30 = v49;
    uint64_t v31 = v50 + 32;
    (*(void (**)(char *, char *, uint64_t))(v50 + 32))(v49, v20, v17);
    uint64_t v32 = sub_1E0137F00();
    uint64_t v34 = v33;
    (*(void (**)(char *, uint64_t))(v31 - 24))(v30, v17);
    if (!v34)
    {
LABEL_12:
      uint64_t v29 = 1;
      a2 = v58;
      goto LABEL_13;
    }
    uint64_t v59 = v32;
    uint64_t v60 = v34;
    sub_1E011FF24();
    uint64_t v35 = sub_1E0138380();
    uint64_t v37 = v36;
    swift_bridgeObjectRelease();
    a2 = v58;
    if (!v37)
    {
LABEL_11:
      uint64_t v29 = 1;
LABEL_13:
      a4 = v56;
      return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a2 - 8) + 56))(a4, v29, 1, a2);
    }
    uint64_t v38 = v57;
    uint64_t v39 = v48;
    uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
    uint64_t v41 = v54;
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(AssociatedConformanceWitness + 16))(v35, v37, v39, AssociatedConformanceWitness);
    swift_bridgeObjectRelease();
    uint64_t v42 = v47;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v47 + 48))(v41, 1, v39) == 1)
    {
      (*(void (**)(char *, uint64_t))(v53 + 8))(v41, v46);
      goto LABEL_11;
    }
    uint64_t v44 = v52;
    (*(void (**)(char *, char *, uint64_t))(v42 + 32))(v52, v41, v39);
    uint64_t v45 = v51;
    (*(void (**)(char *, char *, uint64_t))(v42 + 16))(v51, v44, v39);
    a4 = v56;
    (*(void (**)(char *, uint64_t, uint64_t))(v38 + 24))(v45, a2, v38);
    (*(void (**)(char *, uint64_t))(v42 + 8))(v44, v39);
    uint64_t v29 = 0;
  }
  else
  {
    uint64_t v29 = 1;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a2 - 8) + 56))(a4, v29, 1, a2);
}

NSUserActivity __swiftcall DeepLinkingDataParameter.addToUserActivity(_:)(NSUserActivity a1)
{
  uint64_t v3 = v2;
  uint64_t v4 = v1;
  sub_1E012F1D8(0, (unint64_t *)&qword_1EC05B4F0, (uint64_t (*)(uint64_t))sub_1E011B148, MEMORY[0x1E4FBBE00]);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1E01391C0;
  (*(void (**)(uint64_t, uint64_t))(v3 + 32))(v4, v3);
  sub_1E01383E0();
  uint64_t v6 = *(void (**)(uint64_t, uint64_t))(v3 + 40);
  *(void *)(inited + 96) = swift_getAssociatedTypeWitness();
  __swift_allocate_boxed_opaque_existential_0((uint64_t *)(inited + 72));
  v6(v4, v3);
  sub_1E011A200(inited);
  uint64_t v7 = (void *)sub_1E0138150();
  swift_bridgeObjectRelease();
  [(objc_class *)a1.super.isa addUserInfoEntriesFromDictionary:v7];

  return (NSUserActivity)a1.super.isa;
}

uint64_t static DeepLinkingDataParameter.fromUserActivity(_:)@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v31 = a4;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v8 = sub_1E0138330();
  uint64_t v29 = *(void *)(v8 - 8);
  uint64_t v30 = v8;
  uint64_t v9 = MEMORY[0x1F4188790](v8);
  uint64_t v11 = (char *)&v29 - v10;
  uint64_t v12 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v13 = MEMORY[0x1F4188790](v9);
  uint64_t v15 = (char *)&v29 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v13);
  uint64_t v17 = (char *)&v29 - v16;
  id v18 = objc_msgSend(a1, sel_userInfo);
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = sub_1E0138160();

    uint64_t v32 = (*(uint64_t (**)(uint64_t, uint64_t))(a3 + 32))(a2, a3);
    uint64_t v33 = v21;
    sub_1E01383E0();
    if (*(void *)(v20 + 16))
    {
      unint64_t v22 = sub_1E011AF6C((uint64_t)v34);
      uint64_t v23 = v31;
      if (v24)
      {
        sub_1E011AEA8(*(void *)(v20 + 56) + 32 * v22, (uint64_t)&v35);
      }
      else
      {
        long long v35 = 0u;
        long long v36 = 0u;
      }
    }
    else
    {
      long long v35 = 0u;
      long long v36 = 0u;
      uint64_t v23 = v31;
    }
    sub_1E0120314((uint64_t)v34);
    swift_bridgeObjectRelease();
  }
  else
  {
    long long v35 = 0u;
    long long v36 = 0u;
    uint64_t v23 = v31;
  }
  sub_1E0122ED8();
  int v25 = swift_dynamicCast();
  unint64_t v26 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v12 + 56);
  if (v25)
  {
    v26(v11, 0, 1, AssociatedTypeWitness);
    (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v17, v11, AssociatedTypeWitness);
    (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v15, v17, AssociatedTypeWitness);
    (*(void (**)(char *, uint64_t, uint64_t))(a3 + 24))(v15, a2, a3);
    (*(void (**)(char *, uint64_t))(v12 + 8))(v17, AssociatedTypeWitness);
    uint64_t v27 = 0;
  }
  else
  {
    uint64_t v27 = 1;
    v26(v11, 1, 1, AssociatedTypeWitness);
    (*(void (**)(char *, uint64_t))(v29 + 8))(v11, v30);
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a2 - 8) + 56))(v23, v27, 1, a2);
}

uint64_t sub_1E012EC90@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  v30[2] = a2;
  void v30[3] = a3;
  v30[1] = a1;
  sub_1E012F1D8(0, (unint64_t *)&qword_1EACE1840, MEMORY[0x1E4F276F0], MEMORY[0x1E4FBB718]);
  ((void (*)(void))MEMORY[0x1F4188790])();
  uint64_t v6 = (char *)v30 - v5;
  uint64_t v7 = sub_1E0137F10();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = ((uint64_t (*)(void))MEMORY[0x1F4188790])();
  uint64_t v11 = (char *)v30 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v9);
  uint64_t v13 = (char *)v30 - v12;
  id v14 = objc_allocWithZone(MEMORY[0x1E4F29088]);
  uint64_t v15 = (void *)sub_1E0138040();
  id v16 = objc_msgSend(v14, sel_initWithURL_resolvingAgainstBaseURL_, v15, 0);

  if (v16)
  {
    v30[0] = a4;
    id v17 = objc_msgSend(v16, sel_queryItems);
    if (v17)
    {
      id v18 = v17;
      unint64_t v19 = sub_1E01382C0();
    }
    else
    {
      unint64_t v19 = MEMORY[0x1E4FBC860];
    }
    sub_1E0137EE0();
    (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v11, v13, v7);
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      unint64_t v19 = sub_1E012B668(0, *(void *)(v19 + 16) + 1, 1, v19);
    }
    unint64_t v24 = *(void *)(v19 + 16);
    unint64_t v23 = *(void *)(v19 + 24);
    if (v24 >= v23 >> 1) {
      unint64_t v19 = sub_1E012B668(v23 > 1, v24 + 1, 1, v19);
    }
    *(void *)(v19 + 16) = v24 + 1;
    (*(void (**)(unint64_t, char *, uint64_t))(v8 + 32))(v19+ ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80))+ *(void *)(v8 + 72) * v24, v11, v7);
    int v25 = (void *)sub_1E01382B0();
    swift_bridgeObjectRelease();
    objc_msgSend(v16, sel_setQueryItems_, v25);

    id v26 = objc_msgSend(v16, sel_URL);
    if (v26)
    {
      uint64_t v27 = v26;
      sub_1E0138050();

      (*(void (**)(char *, uint64_t))(v8 + 8))(v13, v7);
      uint64_t v28 = sub_1E01380B0();
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v28 - 8) + 56))(v6, 0, 1, v28);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v8 + 8))(v13, v7);
      uint64_t v29 = sub_1E01380B0();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v29 - 8) + 56))(v6, 1, 1, v29);
    }
    return sub_1E012F23C((uint64_t)v6, v30[0]);
  }
  else
  {
    uint64_t v20 = sub_1E01380B0();
    uint64_t v21 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56);
    return v21(a4, 1, 1, v20);
  }
}

uint64_t sub_1E012F0B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = sub_1E0137EF0();
  uint64_t v8 = v7;
  if (v6 == (*(uint64_t (**)(uint64_t, uint64_t))(a4 + 32))(a3, a4) && v8 == v9) {
    char v11 = 1;
  }
  else {
    char v11 = sub_1E01384F0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v11 & 1;
}

uint64_t dispatch thunk of DeepLinkingDataParameter.init(value:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t dispatch thunk of static DeepLinkingDataParameter.keyName.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of DeepLinkingDataParameter.value.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of DeepLinkingDataParameter.value.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 48))();
}

uint64_t dispatch thunk of DeepLinkingDataParameter.value.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 56))();
}

void sub_1E012F1D8(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v7 = a3(255);
    unint64_t v8 = a4(a1, v7);
    if (!v9) {
      atomic_store(v8, a2);
    }
  }
}

uint64_t sub_1E012F23C(uint64_t a1, uint64_t a2)
{
  sub_1E012F1D8(0, (unint64_t *)&qword_1EACE1840, MEMORY[0x1E4F276F0], MEMORY[0x1E4FBB718]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t NSUserActivityProtocol.init(activityType:userInfo:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a5 + 40))(a3, a4, a5);
}

void sub_1E012F350(void *a1@<X8>)
{
  id v2 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  uint64_t v3 = (void *)sub_1E0138170();
  swift_bridgeObjectRelease();
  id v4 = objc_msgSend(v2, sel_initWithActivityType_, v3);

  *a1 = v4;
}

uint64_t sub_1E012F3C8()
{
  id v1 = objc_msgSend(*v0, sel_activityType);
  uint64_t v2 = sub_1E0138190();

  return v2;
}

uint64_t sub_1E012F420()
{
  id v1 = objc_msgSend(*v0, sel_userInfo);
  if (!v1) {
    return 0;
  }
  uint64_t v2 = v1;
  uint64_t v3 = sub_1E0138160();

  return v3;
}

void sub_1E012F490(uint64_t a1)
{
  uint64_t v2 = *v1;
  if (a1)
  {
    id v3 = (id)sub_1E0138150();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v3 = 0;
  }
  objc_msgSend(v2, sel_setUserInfo_, v3);
}

void (*sub_1E012F524(uint64_t **a1))(void *a1)
{
  uint64_t v2 = (uint64_t *)malloc(0x28uLL);
  *a1 = v2;
  v2[4] = (uint64_t)sub_1E012F640(v2);
  return sub_1E012F580;
}

void sub_1E012F580(void *a1)
{
  id v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);
  free(v1);
}

uint64_t dispatch thunk of NSUserActivityProtocol.init(activityType:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 8))();
}

uint64_t dispatch thunk of NSUserActivityProtocol.init(activityType:userInfo:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 16))();
}

uint64_t dispatch thunk of NSUserActivityProtocol.activityType.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of NSUserActivityProtocol.userInfo.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of NSUserActivityProtocol.userInfo.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 40))();
}

uint64_t dispatch thunk of NSUserActivityProtocol.userInfo.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 48))();
}

void (*sub_1E012F640(uint64_t *a1))(uint64_t *a1, char a2)
{
  a1[1] = (uint64_t)v1;
  id v3 = objc_msgSend(v1, sel_userInfo);
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = sub_1E0138160();
  }
  else
  {
    uint64_t v5 = 0;
  }
  *a1 = v5;
  return sub_1E012F6DC;
}

void sub_1E012F6DC(uint64_t *a1, char a2)
{
  uint64_t v3 = *a1;
  if (a2)
  {
    if (v3)
    {
      swift_bridgeObjectRetain();
      id v4 = (id)sub_1E0138150();
      swift_bridgeObjectRelease();
    }
    else
    {
      id v4 = 0;
    }
    objc_msgSend((id)a1[1], sel_setUserInfo_, v4);
    swift_bridgeObjectRelease();
  }
  else if (v3)
  {
    id v4 = (id)sub_1E0138150();
    swift_bridgeObjectRelease();
    objc_msgSend((id)a1[1], sel_setUserInfo_, v4);
  }
  else
  {
    id v4 = 0;
    objc_msgSend((id)a1[1], sel_setUserInfo_, 0);
  }
}

uint64_t sub_1E012F7D0()
{
  uint64_t v0 = sub_1E0138140();
  __swift_allocate_value_buffer(v0, qword_1EC05B758);
  __swift_project_value_buffer(v0, (uint64_t)qword_1EC05B758);
  return sub_1E0138130();
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

HealthAppServices::DeepLinkActivityType_optional __swiftcall DeepLinkActivityType.init(_:)(Swift::String a1)
{
  object = a1._object;
  uint64_t v3 = qword_1F3B54CA8;
  id v16 = v1;
  if (qword_1F3B54CA8)
  {
    uint64_t countAndFlagsBits = a1._countAndFlagsBits;
    uint64_t v5 = &byte_1F3B54CB8;
    while (1)
    {
      int v7 = *v5++;
      char v6 = v7;
      unint64_t v8 = 0x80000001E013A720;
      unint64_t v9 = 0xD000000000000019;
      switch(v7)
      {
        case 1:
          unint64_t v9 = 0xD00000000000001DLL;
          uint64_t v10 = "com.apple.health.view.sharing";
          goto LABEL_22;
        case 2:
          char v11 = ".view.notifications.settings";
          goto LABEL_29;
        case 3:
          char v11 = ".profile.sources";
          goto LABEL_29;
        case 4:
          unint64_t v9 = 0xD00000000000001ELL;
          uint64_t v10 = "com.apple.health.view.data";
          goto LABEL_22;
        case 5:
          goto LABEL_23;
        case 6:
          unint64_t v9 = 0xD00000000000001ELL;
          uint64_t v10 = "com.apple.health.view.category";
          goto LABEL_22;
        case 7:
          uint64_t v13 = "com.apple.health.view.foryou";
          unint64_t v12 = 0xD00000000000001ALL;
          goto LABEL_13;
        case 8:
          unint64_t v9 = 0xD000000000000020;
          uint64_t v10 = ".profile.medicalID";
          goto LABEL_22;
        case 9:
          uint64_t v13 = "com.apple.health.view.search";
          unint64_t v12 = 0xD000000000000018;
LABEL_13:
          unint64_t v8 = (unint64_t)v13 | 0x8000000000000000;
          if (v12 != countAndFlagsBits) {
            goto LABEL_25;
          }
          goto LABEL_24;
        case 10:
          unint64_t v9 = 0xD000000000000022;
          uint64_t v10 = "com.apple.health.plugin";
          goto LABEL_22;
        case 11:
          unint64_t v9 = 0xD00000000000002CLL;
          uint64_t v10 = "stomSchemeURL";
          goto LABEL_22;
        case 12:
          unint64_t v9 = 0xD000000000000017;
          uint64_t v10 = "com.apple.health.profile";
          goto LABEL_22;
        case 13:
          unint64_t v9 = 0xD000000000000020;
          uint64_t v10 = "com.apple.health.view.summary";
          goto LABEL_22;
        case 14:
          unint64_t v9 = 0xD000000000000028;
          uint64_t v10 = ".view.sharing.profile";
          goto LABEL_22;
        case 15:
          unint64_t v9 = 0xD00000000000001DLL;
          uint64_t v10 = ".view.sharing.inviteFlow";
          goto LABEL_22;
        case 16:
          unint64_t v9 = 0xD000000000000025;
          uint64_t v10 = "com.apple.health.view.trends";
          goto LABEL_22;
        case 17:
          char v11 = ".view.highlights";
LABEL_29:
          unint64_t v8 = (unint64_t)v11 | 0x8000000000000000;
          if (countAndFlagsBits != 0xD00000000000001CLL) {
            goto LABEL_25;
          }
          goto LABEL_24;
        default:
          unint64_t v9 = 0xD000000000000022;
          uint64_t v10 = "com.apple.health.view.data.all";
LABEL_22:
          unint64_t v8 = (unint64_t)v10 | 0x8000000000000000;
LABEL_23:
          if (v9 != countAndFlagsBits) {
            goto LABEL_25;
          }
LABEL_24:
          if ((void *)v8 == object)
          {
            swift_bridgeObjectRelease();
            goto LABEL_33;
          }
LABEL_25:
          char v14 = sub_1E01384F0();
          swift_bridgeObjectRelease();
          if (v14) {
            goto LABEL_33;
          }
          if (!--v3) {
            goto LABEL_31;
          }
          break;
      }
    }
  }
LABEL_31:
  char v6 = 18;
LABEL_33:
  result.value = swift_bridgeObjectRelease();
  *id v16 = v6;
  return result;
}

void *static DeepLinkActivityType.allCases.getter()
{
  return &unk_1F3B54C98;
}

uint64_t DeepLinkActivityType.rawValue.getter()
{
  uint64_t v1 = *v0;
  uint64_t v2 = 0xD000000000000012;
  switch(v1)
  {
    case 1:
      return 0x746C6165486C6C61;
    case 2:
      id v3 = objc_msgSend(self, sel_healthTrendsHostName);
      goto LABEL_18;
    case 3:
      id v3 = objc_msgSend(self, sel_healthAppBrowseHostName);
      goto LABEL_18;
    case 4:
      return 0x79726F6765746163;
    case 5:
    case 6:
      return 0x6570795461746164;
    case 7:
      id v3 = objc_msgSend(self, sel_dataTypeDetailHostName);
      goto LABEL_18;
    case 8:
      return v2;
    case 9:
      return 0x725068746C616568;
    case 10:
      id v3 = objc_msgSend(self, sel_healthAppMedicalIDPath);
      goto LABEL_18;
    case 11:
      id v3 = objc_msgSend(self, sel_healthAppNotificationSettingsPath);
      goto LABEL_18;
    case 12:
      return 0x6E6967756C70;
    case 13:
      return 0xD000000000000011;
    case 14:
      id v3 = objc_msgSend(self, sel_healthAppSharingInviteFlowPath);
      goto LABEL_18;
    case 15:
      id v3 = objc_msgSend(self, sel_sharingOverviewHostName);
      goto LABEL_18;
    case 16:
      id v3 = objc_msgSend(self, sel_healthAppSharingProfilePath);
      goto LABEL_18;
    case 17:
      id v3 = objc_msgSend(self, sel_healthAppSummaryHostName);
LABEL_18:
      id v4 = v3;
      uint64_t v2 = sub_1E0138190();

      break;
    default:
      uint64_t v2 = 0x67657461436C6C61;
      break;
  }
  return v2;
}

BOOL DeepLinkActivityType.eligibleForHandoff.getter()
{
  return *v0 != 5;
}

HealthAppServices::DeepLinkActivityType_optional __swiftcall DeepLinkActivityType.init(rawValue:)(Swift::String rawValue)
{
  uint64_t v2 = v1;
  unint64_t v3 = sub_1E0138500();
  result.value = swift_bridgeObjectRelease();
  char v5 = 18;
  if (v3 < 0x12) {
    char v5 = v3;
  }
  *uint64_t v2 = v5;
  return result;
}

uint64_t sub_1E012FF68(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_1E011EA8C(*a1, *a2);
}

unint64_t sub_1E012FF78()
{
  unint64_t result = qword_1EACE1948;
  if (!qword_1EACE1948)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EACE1948);
  }
  return result;
}

uint64_t sub_1E012FFCC()
{
  return sub_1E0138540();
}

uint64_t sub_1E0130034()
{
  DeepLinkActivityType.rawValue.getter();
  sub_1E01381D0();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1E0130098()
{
  return sub_1E0138540();
}

unint64_t sub_1E0130100()
{
  unint64_t result = qword_1EACE1950;
  if (!qword_1EACE1950)
  {
    sub_1E0130158();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EACE1950);
  }
  return result;
}

void sub_1E0130158()
{
  if (!qword_1EACE1958)
  {
    unint64_t v0 = sub_1E01382D0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EACE1958);
    }
  }
}

void sub_1E01301B0(void *a1@<X8>)
{
  *a1 = &unk_1F3B54C98;
}

HealthAppServices::DeepLinkActivityType_optional sub_1E01301C0(Swift::String *a1)
{
  return DeepLinkActivityType.init(rawValue:)(*a1);
}

uint64_t sub_1E01301CC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = DeepLinkActivityType.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for DeepLinkActivityType(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xEF) {
    goto LABEL_17;
  }
  if (a2 + 17 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 17) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 17;
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
      return (*a1 | (v4 << 8)) - 17;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 17;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0x12;
  int v8 = v6 - 18;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for DeepLinkActivityType(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 17 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 17) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xEF) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xEE)
  {
    unsigned int v6 = ((a2 - 239) >> 8) + 1;
    *uint64_t result = a2 + 17;
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
        JUMPOUT(0x1E013035CLL);
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
          *uint64_t result = a2 + 17;
        break;
    }
  }
  return result;
}

uint64_t sub_1E0130384(unsigned __int8 *a1)
{
  return *a1;
}

id sub_1E013038C()
{
  id result = objc_msgSend(self, sel_soundWithAlertType_, 17);
  qword_1EACE1960 = (uint64_t)result;
  return result;
}

id static NotificationSupport.defaultHealthAppNotificationSound.getter()
{
  if (qword_1EACE1808 != -1) {
    swift_once();
  }
  unint64_t v0 = (void *)qword_1EACE1960;
  return v0;
}

id NotificationSupport.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

id NotificationSupport.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for NotificationSupport();
  return objc_msgSendSuper2(&v2, sel_init);
}

id NotificationSupport.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for NotificationSupport();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

double sub_1E01306D0@<D0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  int v3 = v2;
  swift_bridgeObjectRetain();
  unint64_t v6 = sub_1E011AF6C(a1);
  LOBYTE(a1) = v7;
  swift_bridgeObjectRelease();
  if (a1)
  {
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v9 = *v3;
    uint64_t v11 = *v3;
    uint64_t *v3 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_1E0130998();
      uint64_t v9 = v11;
    }
    sub_1E0120314(*(void *)(v9 + 48) + 40 * v6);
    sub_1E011AF04((_OWORD *)(*(void *)(v9 + 56) + 32 * v6), a2);
    sub_1E01307CC(v6, v9);
    uint64_t *v3 = v9;
    swift_bridgeObjectRelease();
  }
  else
  {
    double result = 0.0;
    *a2 = 0u;
    a2[1] = 0u;
  }
  return result;
}

unint64_t sub_1E01307CC(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    double result = sub_1E01383B0();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        sub_1E012DE50(*(void *)(a2 + 48) + 40 * v6, (uint64_t)v28);
        uint64_t v10 = sub_1E01383C0();
        double result = sub_1E0120314((uint64_t)v28);
        unint64_t v11 = v10 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v11 >= v8 && v3 >= (uint64_t)v11)
          {
LABEL_16:
            uint64_t v14 = *(void *)(a2 + 48);
            unint64_t v15 = v14 + 40 * v3;
            id v16 = (long long *)(v14 + 40 * v6);
            if (v3 != v6 || v15 >= (unint64_t)v16 + 40)
            {
              long long v17 = *v16;
              long long v18 = v16[1];
              *(void *)(v15 + 32) = *((void *)v16 + 4);
              *(_OWORD *)unint64_t v15 = v17;
              *(_OWORD *)(v15 + 16) = v18;
            }
            uint64_t v19 = *(void *)(a2 + 56);
            uint64_t v20 = (_OWORD *)(v19 + 32 * v3);
            uint64_t v21 = (_OWORD *)(v19 + 32 * v6);
            if (v3 != v6 || (int64_t v3 = v6, v20 >= v21 + 2))
            {
              long long v9 = v21[1];
              *uint64_t v20 = *v21;
              v20[1] = v9;
              int64_t v3 = v6;
            }
          }
        }
        else if (v11 >= v8 || v3 >= (uint64_t)v11)
        {
          goto LABEL_16;
        }
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    unint64_t v22 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v23 = *v22;
    uint64_t v24 = (-1 << v3) - 1;
  }
  else
  {
    unint64_t v22 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v24 = *v22;
    uint64_t v23 = (-1 << result) - 1;
  }
  uint64_t *v22 = v24 & v23;
  uint64_t v25 = *(void *)(a2 + 16);
  BOOL v26 = __OFSUB__(v25, 1);
  uint64_t v27 = v25 - 1;
  if (v26)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v27;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

void *sub_1E0130998()
{
  id v1 = v0;
  sub_1E011B078();
  uint64_t v2 = *v0;
  uint64_t v3 = sub_1E0138460();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    double result = (void *)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  double result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    double result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v21 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v21 >= v13) {
      goto LABEL_26;
    }
    unint64_t v22 = *(void *)(v6 + 8 * v21);
    ++v9;
    if (!v22)
    {
      int64_t v9 = v21 + 1;
      if (v21 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v22 = *(void *)(v6 + 8 * v9);
      if (!v22) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v22 - 1) & v22;
    unint64_t v15 = __clz(__rbit64(v22)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 40 * v15;
    sub_1E012DE50(*(void *)(v2 + 48) + 40 * v15, (uint64_t)v25);
    uint64_t v17 = 32 * v15;
    sub_1E011AEA8(*(void *)(v2 + 56) + v17, (uint64_t)v24);
    uint64_t v18 = *(void *)(v4 + 48) + v16;
    long long v19 = v25[0];
    long long v20 = v25[1];
    *(void *)(v18 + 32) = v26;
    *(_OWORD *)uint64_t v18 = v19;
    *(_OWORD *)(v18 + 16) = v20;
    double result = sub_1E011AF04(v24, (_OWORD *)(*(void *)(v4 + 56) + v17));
  }
  int64_t v23 = v21 + 2;
  if (v23 >= v13) {
    goto LABEL_26;
  }
  unint64_t v22 = *(void *)(v6 + 8 * v23);
  if (v22)
  {
    int64_t v9 = v23;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v23 + 1;
    if (__OFADD__(v23, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v22 = *(void *)(v6 + 8 * v9);
    ++v23;
    if (v22) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

unint64_t _s17HealthAppServices19NotificationSupportC06createD8UserInfo3for4withSDys11AnyHashableVypGSo20HKNotificationDomainV_10Foundation3URLVSgtFZ_0(uint64_t a1, uint64_t a2)
{
  sub_1E0130E38();
  MEMORY[0x1F4188790](v4 - 8);
  uint64_t v6 = (char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v7 = sub_1E011A200(MEMORY[0x1E4FBC860]);
  *(void *)&long long v24 = sub_1E0138190();
  *((void *)&v24 + 1) = v8;
  unint64_t v9 = MEMORY[0x1E4FBB1A0];
  sub_1E01383E0();
  id v10 = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithInteger_, a1);
  unint64_t v25 = sub_1E0123110();
  *(void *)&long long v24 = v10;
  sub_1E011AF04(&v24, v23);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  unint64_t v22 = v7;
  sub_1E012CF7C(v23, (uint64_t)v26, isUniquelyReferenced_nonNull_native);
  unint64_t v27 = v22;
  swift_bridgeObjectRelease();
  sub_1E0120314((uint64_t)v26);
  *(void *)&long long v24 = sub_1E0138190();
  *((void *)&v24 + 1) = v12;
  sub_1E01383E0();
  sub_1E0130E90(a2, (uint64_t)v6);
  uint64_t v13 = sub_1E01380B0();
  uint64_t v14 = *(void *)(v13 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v6, 1, v13) == 1)
  {
    sub_1E0130EF4((uint64_t)v6, (uint64_t (*)(void))sub_1E0130E38);
    sub_1E01306D0((uint64_t)v26, &v24);
    sub_1E0120314((uint64_t)v26);
    sub_1E0130EF4((uint64_t)&v24, (uint64_t (*)(void))sub_1E0122ED8);
    return v27;
  }
  else
  {
    uint64_t v16 = sub_1E0138010();
    unint64_t v25 = v9;
    *(void *)&long long v24 = v16;
    *((void *)&v24 + 1) = v17;
    (*(void (**)(char *, uint64_t))(v14 + 8))(v6, v13);
    sub_1E011AF04(&v24, v23);
    unint64_t v18 = v27;
    char v19 = swift_isUniquelyReferenced_nonNull_native();
    unint64_t v22 = v18;
    sub_1E012CF7C(v23, (uint64_t)v26, v19);
    unint64_t v15 = v22;
    swift_bridgeObjectRelease();
    sub_1E0120314((uint64_t)v26);
  }
  return v15;
}

uint64_t type metadata accessor for NotificationSupport()
{
  return self;
}

void sub_1E0130E38()
{
  if (!qword_1EACE1840)
  {
    sub_1E01380B0();
    unint64_t v0 = sub_1E0138330();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EACE1840);
    }
  }
}

uint64_t sub_1E0130E90(uint64_t a1, uint64_t a2)
{
  sub_1E0130E38();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1E0130EF4(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t QueryParameterName.rawValue.getter()
{
  uint64_t v1 = *v0;
  uint64_t v2 = 26992;
  switch(v1)
  {
    case 1:
      id v3 = objc_msgSend(self, sel_queryParameterNameStartDate);
      goto LABEL_11;
    case 2:
      id v3 = objc_msgSend(self, sel_queryParameterNameEndDate);
      goto LABEL_11;
    case 3:
      return 0x686372616573;
    case 4:
      id v3 = objc_msgSend(self, sel_queryParameterNameDataTypeCode);
      goto LABEL_11;
    case 5:
      return 0x79726F6765746163;
    case 6:
      return 0x656C646E7562;
    case 7:
      return v2;
    case 8:
      id v3 = objc_msgSend(self, sel_queryParameterNameTrendOverlay);
      goto LABEL_11;
    case 9:
      id v3 = objc_msgSend(self, sel_queryParameterNameSource);
      goto LABEL_11;
    default:
      id v3 = objc_msgSend(self, sel_queryParameterNameDate);
LABEL_11:
      id v4 = v3;
      uint64_t v2 = sub_1E0138190();

      return v2;
  }
}

HealthAppServices::QueryParameterName_optional __swiftcall QueryParameterName.init(paramName:)(Swift::String paramName)
{
  object = paramName._object;
  id v3 = v1;
  uint64_t v4 = qword_1F3B54CE0;
  if (qword_1F3B54CE0)
  {
    uint64_t countAndFlagsBits = paramName._countAndFlagsBits;
    uint64_t v6 = &byte_1F3B54CF0;
    while (1)
    {
      char v8 = *v6++;
      char v7 = v8;
      if (QueryParameterName.rawValue.getter() == countAndFlagsBits && v9 == object) {
        break;
      }
      char v11 = sub_1E01384F0();
      swift_bridgeObjectRelease();
      if (v11) {
        goto LABEL_11;
      }
      if (!--v4) {
        goto LABEL_9;
      }
    }
    swift_bridgeObjectRelease();
  }
  else
  {
LABEL_9:
    char v7 = 10;
  }
LABEL_11:
  result.value = swift_bridgeObjectRelease();
  char *v3 = v7;
  return result;
}

unint64_t QueryParameterName.restorationType.getter()
{
  unint64_t result = 0xD000000000000011;
  switch(*v0)
  {
    case 1:
      unint64_t result = 0x7461447472617473;
      break;
    case 2:
      unint64_t result = 0x65746144646E65;
      break;
    case 3:
      unint64_t result = 0x7972657571;
      break;
    case 4:
      unint64_t result = 0x6570795461746164;
      break;
    case 5:
    case 7:
      return result;
    case 6:
      unint64_t result = 0x614E656C646E7562;
      break;
    case 8:
      unint64_t result = 0x6D6954646E657274;
      break;
    case 9:
      unint64_t result = 0x6372756F536C7275;
      break;
    default:
      unint64_t result = 1702125924;
      break;
  }
  return result;
}

void *static QueryParameterName.allCases.getter()
{
  return &unk_1F3B54CD0;
}

HealthAppServices::QueryParameterName_optional __swiftcall QueryParameterName.init(rawValue:)(Swift::String rawValue)
{
  uint64_t v2 = v1;
  unint64_t v3 = sub_1E01384B0();
  result.value = swift_bridgeObjectRelease();
  char v5 = 10;
  if (v3 < 0xA) {
    char v5 = v3;
  }
  *uint64_t v2 = v5;
  return result;
}

uint64_t sub_1E013135C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_1E011EAA4(*a1, *a2);
}

unint64_t sub_1E013136C()
{
  unint64_t result = qword_1EACE1968;
  if (!qword_1EACE1968)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EACE1968);
  }
  return result;
}

uint64_t sub_1E01313C0()
{
  return sub_1E0138540();
}

uint64_t sub_1E0131428()
{
  QueryParameterName.rawValue.getter();
  sub_1E01381D0();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1E013148C()
{
  return sub_1E0138540();
}

HealthAppServices::QueryParameterName_optional sub_1E01314F0(Swift::String *a1)
{
  return QueryParameterName.init(rawValue:)(*a1);
}

uint64_t sub_1E01314FC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = QueryParameterName.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

unint64_t sub_1E0131528()
{
  unint64_t result = qword_1EACE1970;
  if (!qword_1EACE1970)
  {
    sub_1E0131580();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EACE1970);
  }
  return result;
}

void sub_1E0131580()
{
  if (!qword_1EACE1978)
  {
    unint64_t v0 = sub_1E01382D0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EACE1978);
    }
  }
}

void sub_1E01315D8(void *a1@<X8>)
{
  *a1 = &unk_1F3B54CD0;
}

uint64_t getEnumTagSinglePayload for QueryParameterName(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF7) {
    goto LABEL_17;
  }
  if (a2 + 9 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 9) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 9;
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
      return (*a1 | (v4 << 8)) - 9;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 9;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0xA;
  int v8 = v6 - 10;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for QueryParameterName(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 9 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 9) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF7) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF6)
  {
    unsigned int v6 = ((a2 - 247) >> 8) + 1;
    *unint64_t result = a2 + 9;
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
        JUMPOUT(0x1E0131744);
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
          *unint64_t result = a2 + 9;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for QueryParameterName()
{
  return &type metadata for QueryParameterName;
}

uint64_t HAUserActivity.VersioningKey.rawValue.getter()
{
  return 0x4B6E6F6973726576;
}

HealthAppServices::HAUserActivity::UserActivityVersion_optional __swiftcall HAUserActivity.UserActivityVersion.init(rawValue:)(Swift::Int rawValue)
{
  if (rawValue == 1) {
    char v2 = 1;
  }
  else {
    char v2 = 2;
  }
  if (!rawValue) {
    char v2 = 0;
  }
  char *v1 = v2;
  return (HealthAppServices::HAUserActivity::UserActivityVersion_optional)rawValue;
}

unint64_t HAUserActivity.RestorationInfoKey.rawValue.getter()
{
  unint64_t result = 0xD000000000000011;
  switch(*v0)
  {
    case 1:
      unint64_t result = 0x7461447472617473;
      break;
    case 2:
      unint64_t result = 0x65746144646E65;
      break;
    case 3:
      unint64_t result = 0x7972657571;
      break;
    case 4:
      unint64_t result = 0x6570795461746164;
      break;
    case 5:
      return result;
    case 6:
      unint64_t result = 0x6E6F437472616863;
      break;
    case 7:
      unint64_t result = 0x6D6954646E657274;
      break;
    case 8:
      unint64_t result = 0x6372756F536C7275;
      break;
    case 9:
      unint64_t result = 0xD00000000000001DLL;
      break;
    default:
      unint64_t result = 1702125924;
      break;
  }
  return result;
}

void static HAUserActivity.UserActivityVersion.current.getter(unsigned char *a1@<X8>)
{
  *a1 = 1;
}

uint64_t HAUserActivity.UserActivityVersion.rawValue.getter()
{
  return *v0;
}

uint64_t HAUserActivity.PluginUserInfoKey.rawValue.getter()
{
  return 0x614E656C646E7562;
}

uint64_t HAUserActivity.URLConversionKey.rawValue.getter()
{
  return 0x63536D6F74737563;
}

uint64_t sub_1E0131954()
{
  sub_1E01381D0();
  return swift_bridgeObjectRelease();
}

unint64_t HAUserActivity.ProfilesRestorationKey.rawValue.getter()
{
  return 0xD000000000000011;
}

unint64_t static HAUserActivity.dateSavedRestorationKey.getter()
{
  return 0xD000000000000011;
}

uint64_t HAUserActivity.PluginUserInfoKey.init(rawValue:)@<X0>(BOOL *a1@<X8>)
{
  return sub_1E0132048(a1);
}

uint64_t sub_1E0131B20()
{
  return sub_1E0132E48();
}

uint64_t sub_1E0131B54()
{
  return sub_1E0132F10();
}

uint64_t sub_1E0131B84@<X0>(BOOL *a1@<X8>)
{
  return sub_1E0132128(a1);
}

uint64_t sub_1E0131B90@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = HAUserActivity.PluginUserInfoKey.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t HAUserActivity.ProfilesRestorationKey.init(rawValue:)@<X0>(BOOL *a1@<X8>)
{
  return sub_1E0132048(a1);
}

uint64_t sub_1E0131BC4()
{
  return sub_1E0138540();
}

uint64_t sub_1E0131C1C()
{
  return sub_1E01381D0();
}

uint64_t sub_1E0131C38()
{
  return sub_1E0138540();
}

uint64_t sub_1E0131C8C@<X0>(BOOL *a1@<X8>)
{
  return sub_1E0132128(a1);
}

void sub_1E0131C98(void *a1@<X8>)
{
  *a1 = 0xD000000000000011;
  a1[1] = 0x80000001E013A400;
}

HealthAppServices::HAUserActivity::RestorationInfoKey_optional __swiftcall HAUserActivity.RestorationInfoKey.init(rawValue:)(Swift::String rawValue)
{
  char v2 = v1;
  unint64_t v3 = sub_1E01384B0();
  result.value = swift_bridgeObjectRelease();
  char v5 = 10;
  if (v3 < 0xA) {
    char v5 = v3;
  }
  *char v2 = v5;
  return result;
}

uint64_t sub_1E0131D14(unsigned __int8 *a1, char *a2)
{
  return sub_1E011EB60(*a1, *a2);
}

uint64_t sub_1E0131D20()
{
  return sub_1E0138540();
}

uint64_t sub_1E0131D68()
{
  return sub_1E0131954();
}

uint64_t sub_1E0131D70()
{
  return sub_1E0138540();
}

HealthAppServices::HAUserActivity::RestorationInfoKey_optional sub_1E0131DB4(Swift::String *a1)
{
  return HAUserActivity.RestorationInfoKey.init(rawValue:)(*a1);
}

unint64_t sub_1E0131DC0@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = HAUserActivity.RestorationInfoKey.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t HAUserActivity.URLConversionKey.init(rawValue:)@<X0>(BOOL *a1@<X8>)
{
  return sub_1E0132048(a1);
}

uint64_t sub_1E0131DF4()
{
  return sub_1E0132E48();
}

uint64_t sub_1E0131E30()
{
  return sub_1E0132F10();
}

uint64_t sub_1E0131E68@<X0>(BOOL *a1@<X8>)
{
  return sub_1E0132128(a1);
}

uint64_t sub_1E0131E74@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = HAUserActivity.URLConversionKey.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

BOOL sub_1E0131E9C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_1E0131EB4()
{
  return sub_1E0138540();
}

uint64_t sub_1E0131EFC()
{
  return sub_1E0138530();
}

uint64_t sub_1E0131F28()
{
  return sub_1E0138540();
}

void *sub_1E0131F6C@<X0>(void *result@<X0>, char *a2@<X8>)
{
  if (*result == 1) {
    char v2 = 1;
  }
  else {
    char v2 = 2;
  }
  if (*result) {
    char v3 = v2;
  }
  else {
    char v3 = 0;
  }
  *a2 = v3;
  return result;
}

void sub_1E0131F8C(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t HAUserActivity.VersioningKey.init(rawValue:)@<X0>(BOOL *a1@<X8>)
{
  return sub_1E0132048(a1);
}

uint64_t sub_1E0131FA4()
{
  return sub_1E0132E48();
}

uint64_t sub_1E0131FD8()
{
  return sub_1E0132F10();
}

uint64_t sub_1E0132008@<X0>(BOOL *a1@<X8>)
{
  return sub_1E0132128(a1);
}

uint64_t sub_1E0132014@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = HAUserActivity.VersioningKey.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t HAUserActivity.ViewNavigationKeys.init(rawValue:)@<X0>(BOOL *a1@<X8>)
{
  return sub_1E0132048(a1);
}

uint64_t sub_1E0132048@<X0>(BOOL *a1@<X8>)
{
  uint64_t v2 = sub_1E01384B0();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2 != 0;
  return result;
}

uint64_t HAUserActivity.ViewNavigationKeys.rawValue.getter()
{
  return 0x646E6572546C6C61;
}

uint64_t sub_1E01320B8()
{
  return sub_1E0132E48();
}

uint64_t sub_1E01320EC()
{
  return sub_1E0132F10();
}

uint64_t sub_1E013211C@<X0>(BOOL *a1@<X8>)
{
  return sub_1E0132128(a1);
}

uint64_t sub_1E0132128@<X0>(BOOL *a1@<X8>)
{
  uint64_t v2 = sub_1E01384B0();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2 != 0;
  return result;
}

uint64_t sub_1E0132178@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = HAUserActivity.ViewNavigationKeys.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

id static HAUserActivity.addProfileIdentifier(to:profileIdentifier:)(void *a1, uint64_t a2)
{
  uint64_t v2 = sub_1E0132368(a1, a2);
  return v2;
}

id static HAUserActivity.createActivity(bundleName:)(uint64_t a1, uint64_t a2)
{
  id v4 = objc_allocWithZone(MEMORY[0x1E4F22488]);
  char v5 = (void *)sub_1E0138170();
  id v6 = objc_msgSend(v4, sel_initWithActivityType_, v5);

  sub_1E011AF14();
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1E0139260;
  uint64_t v8 = MEMORY[0x1E4FBB1A0];
  sub_1E01383E0();
  *(void *)(inited + 96) = v8;
  *(void *)(inited + 72) = a1;
  *(void *)(inited + 80) = a2;
  swift_bridgeObjectRetain();
  sub_1E01383E0();
  *(void *)(inited + 168) = MEMORY[0x1E4FBB550];
  *(void *)(inited + 144) = 1;
  sub_1E011A200(inited);
  unint64_t v9 = (void *)sub_1E0138150();
  swift_bridgeObjectRelease();
  objc_msgSend(v6, sel_addUserInfoEntriesFromDictionary_, v9, 0x4B6E6F6973726576, 0xEA00000000007965);

  return v6;
}

void *sub_1E0132368(void *a1, uint64_t a2)
{
  v31[15] = *(id *)MEMORY[0x1E4F143B8];
  uint64_t v4 = sub_1E0138140();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  BOOL v7 = (char *)&v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = self;
  v31[0] = 0;
  id v9 = objc_msgSend(v8, sel_archivedDataWithRootObject_requiringSecureCoding_error_, a2, 1, v31);
  id v10 = v31[0];
  if (v9)
  {
    uint64_t v11 = sub_1E01380C0();
    unint64_t v13 = v12;

    sub_1E011AF14();
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_1E01391C0;
    v31[0] = (id)0xD000000000000011;
    v31[1] = (id)0x80000001E013A400;
    sub_1E01383E0();
    *(void *)(inited + 96) = MEMORY[0x1E4F277C0];
    *(void *)(inited + 72) = v11;
    *(void *)(inited + 80) = v13;
    sub_1E012D998(v11, v13);
    sub_1E011A200(inited);
    unint64_t v15 = (void *)sub_1E0138150();
    swift_bridgeObjectRelease();
    objc_msgSend(a1, sel_addUserInfoEntriesFromDictionary_, v15);

    sub_1E012D9F0(v11, v13);
  }
  else
  {
    uint64_t v16 = v10;
    uint64_t v17 = (void *)sub_1E0137FF0();

    swift_willThrow();
    if (qword_1EC05B670 != -1) {
      swift_once();
    }
    uint64_t v18 = __swift_project_value_buffer(v4, (uint64_t)qword_1EC05B758);
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v18, v4);
    id v19 = v17;
    id v20 = v17;
    uint64_t v21 = sub_1E0138120();
    os_log_type_t v22 = sub_1E0138300();
    if (os_log_type_enabled(v21, v22))
    {
      uint64_t v23 = swift_slowAlloc();
      uint64_t v29 = (void *)swift_slowAlloc();
      v31[0] = v29;
      *(_DWORD *)uint64_t v23 = 136315394;
      uint64_t v30 = sub_1E012BBD0(0x6341726573554148, 0xEE00797469766974, (uint64_t *)v31);
      sub_1E0138340();
      *(_WORD *)(v23 + 12) = 2080;
      uint64_t v30 = (uint64_t)v17;
      id v24 = v17;
      sub_1E0122AAC();
      uint64_t v25 = sub_1E01381B0();
      uint64_t v30 = sub_1E012BBD0(v25, v26, (uint64_t *)v31);
      sub_1E0138340();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_1E0118000, v21, v22, "%s Failed to encode profile identifier. Error: %s", (uint8_t *)v23, 0x16u);
      unint64_t v27 = v29;
      swift_arrayDestroy();
      MEMORY[0x1E01F1830](v27, -1, -1);
      MEMORY[0x1E01F1830](v23, -1, -1);
    }
    else
    {
    }
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  return a1;
}

unint64_t sub_1E01327B8()
{
  unint64_t result = qword_1EACE1980;
  if (!qword_1EACE1980)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EACE1980);
  }
  return result;
}

unint64_t sub_1E0132810()
{
  unint64_t result = qword_1EACE1988;
  if (!qword_1EACE1988)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EACE1988);
  }
  return result;
}

unint64_t sub_1E0132868()
{
  unint64_t result = qword_1EC05B4E0;
  if (!qword_1EC05B4E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EC05B4E0);
  }
  return result;
}

unint64_t sub_1E01328C0()
{
  unint64_t result = qword_1EACE1990;
  if (!qword_1EACE1990)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EACE1990);
  }
  return result;
}

unint64_t sub_1E0132918()
{
  unint64_t result = qword_1EACE1998;
  if (!qword_1EACE1998)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EACE1998);
  }
  return result;
}

unint64_t sub_1E0132970()
{
  unint64_t result = qword_1EACE19A0;
  if (!qword_1EACE19A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EACE19A0);
  }
  return result;
}

unint64_t sub_1E01329C8()
{
  unint64_t result = qword_1EACE19A8;
  if (!qword_1EACE19A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EACE19A8);
  }
  return result;
}

ValueMetadata *type metadata accessor for HAUserActivity()
{
  return &type metadata for HAUserActivity;
}

uint64_t sub_1E0132A38()
{
  return 0;
}

ValueMetadata *type metadata accessor for HAUserActivity.PluginUserInfoKey()
{
  return &type metadata for HAUserActivity.PluginUserInfoKey;
}

ValueMetadata *type metadata accessor for HAUserActivity.ProfilesRestorationKey()
{
  return &type metadata for HAUserActivity.ProfilesRestorationKey;
}

unsigned char *storeEnumTagSinglePayload for HAUserActivity.RestorationInfoKey(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 9 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 9) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF7) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF6)
  {
    unsigned int v6 = ((a2 - 247) >> 8) + 1;
    *unint64_t result = a2 + 9;
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
        JUMPOUT(0x1E0132B2CLL);
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
          *unint64_t result = a2 + 9;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for HAUserActivity.RestorationInfoKey()
{
  return &type metadata for HAUserActivity.RestorationInfoKey;
}

ValueMetadata *type metadata accessor for HAUserActivity.URLConversionKey()
{
  return &type metadata for HAUserActivity.URLConversionKey;
}

uint64_t getEnumTagSinglePayload for HAUserActivity.UserActivityVersion(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for HAUserActivity.UserActivityVersion(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1E0132CD0);
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

unsigned char *sub_1E0132CF8(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for HAUserActivity.UserActivityVersion()
{
  return &type metadata for HAUserActivity.UserActivityVersion;
}

ValueMetadata *type metadata accessor for HAUserActivity.VersioningKey()
{
  return &type metadata for HAUserActivity.VersioningKey;
}

uint64_t _s17HealthAppServices14HAUserActivityV17PluginUserInfoKeyOwet_0(unsigned int *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if ((a2 + 1) >= 0x10000) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) < 0x100) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4) {
    return *a1;
  }
  if (v3 == 2) {
    return *(unsigned __int16 *)a1;
  }
  return *(unsigned __int8 *)a1;
}

unsigned char *_s17HealthAppServices14HAUserActivityV17PluginUserInfoKeyOwst_0(unsigned char *result, int a2, int a3)
{
  if ((a3 + 1) >= 0x10000) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) < 0x100) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2)
  {
    switch(v5)
    {
      case 1:
        *unint64_t result = a2;
        return result;
      case 2:
        *(_WORD *)unint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)unint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *unint64_t result = 0;
      break;
    case 2:
      *(_WORD *)unint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x1E0132E10);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for HAUserActivity.ViewNavigationKeys()
{
  return &type metadata for HAUserActivity.ViewNavigationKeys;
}

uint64_t sub_1E0132E48()
{
  return sub_1E0138540();
}

uint64_t sub_1E0132E98()
{
  return sub_1E01381D0();
}

uint64_t sub_1E0132EB4()
{
  return sub_1E01381D0();
}

uint64_t sub_1E0132ED0()
{
  return sub_1E01381D0();
}

uint64_t sub_1E0132EF4()
{
  return sub_1E01381D0();
}

uint64_t sub_1E0132F10()
{
  return sub_1E0138540();
}

void sub_1E0132F64()
{
  *(_WORD *)&algn_1EACE29D8[6] = -4864;
}

HealthAppServices::PluginURLType __swiftcall PluginURLType.init(stringLiteral:)(HealthAppServices::PluginURLType stringLiteral)
{
  HealthAppServices::PluginURLType *v1 = stringLiteral;
  return stringLiteral;
}

void sub_1E0132F9C()
{
  qword_1EACE29E0 = 0x7472616548;
  *(void *)algn_1EACE29E8 = 0xE500000000000000;
}

void sub_1E0132FBC()
{
  qword_1EACE29F0 = 0x73656C69666F7250;
  *(void *)algn_1EACE29F8 = 0xE800000000000000;
}

void sub_1E0132FE0()
{
  qword_1EACE2A00 = 0x797465666153;
  *(void *)algn_1EACE2A08 = 0xE600000000000000;
}

HealthAppServices::PluginURLType __swiftcall PluginURLType.init(rawValue:)(HealthAppServices::PluginURLType rawValue)
{
  HealthAppServices::PluginURLType *v1 = rawValue;
  return rawValue;
}

uint64_t PluginURLType.bundleName.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_1E0133038(void *a1, void *a2)
{
  if (*a1 == *a2 && a1[1] == a2[1]) {
    return 1;
  }
  else {
    return sub_1E01384F0();
  }
}

BOOL static AppURLRouting.useCurrentContext(url:)()
{
  sub_1E0138030();
  sub_1E011FF24();
  uint64_t v0 = sub_1E0138370();
  swift_bridgeObjectRelease();
  return v0 == 0;
}

id static AppURLRouting.determineURLType(url:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v168 = sub_1E0137F10();
  uint64_t v161 = *(void *)(v168 - 8);
  MEMORY[0x1F4188790](v168);
  unint64_t v167 = (char *)v156 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1E0135088(0, &qword_1EACE18E8, MEMORY[0x1E4F26EA0]);
  MEMORY[0x1F4188790](v5 - 8);
  uint64_t v160 = (char *)v156 - v6;
  sub_1E0135088(0, &qword_1EACE18E0, MEMORY[0x1E4F26ED8]);
  MEMORY[0x1F4188790](v7 - 8);
  v163 = (char *)v156 - v8;
  uint64_t v9 = sub_1E0137F70();
  uint64_t v164 = *(void *)(v9 - 8);
  uint64_t v165 = v9;
  MEMORY[0x1F4188790](v9);
  uint64_t v162 = (char *)v156 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_1E01380B0();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = MEMORY[0x1F4188790](v11);
  v158 = (char *)v156 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v13);
  uint64_t v16 = (char *)v156 - v15;
  uint64_t v17 = type metadata accessor for HAURLValidator();
  uint64_t v18 = MEMORY[0x1F4188790](v17 - 8);
  uint64_t v169 = (uint64_t)v156 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v18);
  uint64_t v21 = (char *)v156 - v20;
  uint64_t v22 = type metadata accessor for HAURL();
  uint64_t v23 = MEMORY[0x1F4188790](v22 - 8);
  id v159 = (char *)v156 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = MEMORY[0x1F4188790](v23);
  unint64_t v27 = (char *)v156 - v26;
  uint64_t v28 = MEMORY[0x1F4188790](v25);
  uint64_t v30 = (char *)v156 - v29;
  MEMORY[0x1F4188790](v28);
  uint64_t v31 = *(void (**)(void))(v12 + 16);
  uint64_t v172 = (uint64_t)v156 - v32;
  v31();
  uint64_t v170 = v11;
  uint64_t v171 = (void (*)(char *, uint64_t, uint64_t))v31;
  ((void (*)(char *, uint64_t, uint64_t))v31)(v21, a1, v11);
  uint64_t v173 = v21;
  if (!HAURLValidator.isCHRURL()())
  {
    uint64_t v166 = (uint64_t *)a2;
    long long v36 = (void *)sub_1E0138040();
    unsigned int v37 = objc_msgSend(v36, sel_hk_isRewrittenEUDigitalCOVIDCertificateQRCodeURL);

    if (v37)
    {
      if (qword_1EACE1810 != -1) {
        swift_once();
      }
      uint64_t v38 = &qword_1EACE29D0;
LABEL_9:
      uint64_t v40 = *v38;
      uint64_t v39 = v38[1];
      swift_bridgeObjectRetain();
      uint64_t v41 = (uint64_t)v173;
LABEL_16:
      sub_1E012C2E4(v41, (uint64_t (*)(void))type metadata accessor for HAURLValidator);
      id result = (id)sub_1E012C2E4(v172, (uint64_t (*)(void))type metadata accessor for HAURL);
      uint64_t v48 = v166;
      *uint64_t v166 = v40;
      v48[1] = v39;
LABEL_17:
      char v49 = 1;
      goto LABEL_18;
    }
    Swift::Bool v42 = HAURLValidator.isSmartHealthCardFile()();
    uint64_t v43 = v170;
    v171(v16, a1, v170);
    if (v42)
    {
      (*(void (**)(char *, uint64_t))(v12 + 8))(v16, v43);
LABEL_13:
      uint64_t v47 = (uint64_t)v173;
      if (qword_1EACE1810 != -1) {
        swift_once();
      }
      uint64_t v40 = qword_1EACE29D0;
      uint64_t v39 = *(void *)algn_1EACE29D8;
      swift_bridgeObjectRetain();
      uint64_t v41 = v47;
      goto LABEL_16;
    }
    uint64_t v157 = a1;
    uint64_t v44 = (void *)sub_1E0138040();
    unsigned int v45 = objc_msgSend(v44, sel_hk_isRewrittenHealthCardQRCodeURL);

    uint64_t v46 = *(void (**)(char *, uint64_t))(v12 + 8);
    v46(v16, v43);
    if (v45) {
      goto LABEL_13;
    }
    v156[1] = v12 + 8;
    uint64_t v50 = self;
    id v51 = objc_msgSend(v50, sel_electrocardiogramType);
    uint64_t v52 = (uint64_t)v173;
    v171(v30, (uint64_t)v173, v43);
    id v53 = HAURL.objectType.getter();
    if (v53)
    {
      unint64_t v54 = v53;
      sub_1E01351D8();
      id v55 = v51;
      char v56 = sub_1E0138320();
      sub_1E012C2E4((uint64_t)v30, (uint64_t (*)(void))type metadata accessor for HAURL);

      uint64_t v57 = v52;
      uint64_t v58 = v52;
      uint64_t v59 = v169;
      sub_1E01350DC(v57, v169);
      if (v56)
      {
        sub_1E012C2E4(v59, (uint64_t (*)(void))type metadata accessor for HAURLValidator);
LABEL_26:
        if (qword_1EACE1818 != -1) {
          swift_once();
        }
        uint64_t v40 = qword_1EACE29E0;
        uint64_t v39 = *(void *)algn_1EACE29E8;
        swift_bridgeObjectRetain();
        uint64_t v41 = v58;
        goto LABEL_16;
      }
    }
    else
    {
      sub_1E012C2E4((uint64_t)v30, (uint64_t (*)(void))type metadata accessor for HAURL);

      uint64_t v60 = v52;
      uint64_t v59 = v169;
      sub_1E01350DC(v60, v169);
    }
    id v61 = objc_msgSend(v50, sel_atrialFibrillationEventType);
    v171(v27, v59, v43);
    id v62 = HAURL.objectType.getter();
    if (v62)
    {
      id v63 = v62;
      if (v61)
      {
        sub_1E01351D8();
        id v64 = v61;
        char v65 = sub_1E0138320();
        sub_1E012C2E4((uint64_t)v27, (uint64_t (*)(void))type metadata accessor for HAURL);

        sub_1E012C2E4(v59, (uint64_t (*)(void))type metadata accessor for HAURLValidator);
        uint64_t v58 = (uint64_t)v173;
        if (v65) {
          goto LABEL_26;
        }
LABEL_32:
        uint64_t v66 = self;
        id v67 = objc_msgSend(v66, sel_healthAppSummaryHostName);
        uint64_t v68 = sub_1E0138190();
        uint64_t v70 = v69;

        LOBYTE(v67) = sub_1E0137B5C(v58, v68, v70);
        swift_bridgeObjectRelease();
        if (v67)
        {
          sub_1E012C2E4(v58, (uint64_t (*)(void))type metadata accessor for HAURLValidator);
          id result = (id)sub_1E012C2E4(v172, (uint64_t (*)(void))type metadata accessor for HAURL);
          uint64_t v48 = v166;
          *uint64_t v166 = 0;
          v48[1] = 0;
          char v49 = 4;
          goto LABEL_18;
        }
        id v71 = objc_msgSend(v66, sel_healthAppBrowseHostName);
        uint64_t v72 = sub_1E0138190();
        uint64_t v74 = v73;

        LOBYTE(v71) = sub_1E0137B5C(v58, v72, v74);
        swift_bridgeObjectRelease();
        if (v71)
        {
          uint64_t v75 = (uint64_t)v163;
          sub_1E0137F30();
          uint64_t v77 = v164;
          uint64_t v76 = v165;
          if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v164 + 48))(v75, 1, v165) == 1)
          {
            sub_1E012C2E4(v58, (uint64_t (*)(void))type metadata accessor for HAURLValidator);
            sub_1E012C2E4(v172, (uint64_t (*)(void))type metadata accessor for HAURL);
            id result = (id)sub_1E013517C(v75, &qword_1EACE18E0, MEMORY[0x1E4F26ED8]);
            uint64_t v78 = v166;
          }
          else
          {
            uint64_t v83 = v162;
            (*(void (**)(char *, uint64_t, uint64_t))(v77 + 32))(v162, v75, v76);
            uint64_t v84 = sub_1E0137F20();
            uint64_t v78 = v166;
            if (v84)
            {
              uint64_t v85 = *(void *)(v84 + 16);
              if (v85)
              {
                uint64_t v86 = *(void (**)(char *, unint64_t, uint64_t))(v161 + 16);
                unint64_t v87 = v84
                    + ((*(unsigned __int8 *)(v161 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v161 + 80));
                id v88 = (void (**)(char *, uint64_t))(v161 + 8);
                uint64_t v89 = *(void *)(v161 + 72);
                uint64_t v171 = (void (*)(char *, uint64_t, uint64_t))v84;
                swift_bridgeObjectRetain();
                os_log_t v91 = v167;
                uint64_t v90 = v168;
                while (1)
                {
                  v86(v91, v87, v90);
                  if (sub_1E0137EF0() == 0x7972657571 && v92 == 0xE500000000000000)
                  {
                    swift_bridgeObjectRelease();
                    goto LABEL_58;
                  }
                  char v93 = sub_1E01384F0();
                  swift_bridgeObjectRelease();
                  if (v93) {
                    break;
                  }
                  os_log_t v91 = v167;
                  uint64_t v90 = v168;
                  (*v88)(v167, v168);
                  v87 += v89;
                  --v85;
                  uint64_t v78 = v166;
                  if (!v85)
                  {
                    swift_bridgeObjectRelease();
                    uint64_t v94 = 1;
                    uint64_t v58 = (uint64_t)v173;
                    uint64_t v96 = (uint64_t)v160;
                    uint64_t v95 = v161;
                    goto LABEL_59;
                  }
                }
                uint64_t v78 = v166;
LABEL_58:
                swift_bridgeObjectRelease();
                uint64_t v96 = (uint64_t)v160;
                uint64_t v95 = v161;
                uint64_t v90 = v168;
                (*(void (**)(char *, char *, uint64_t))(v161 + 32))(v160, v167, v168);
                uint64_t v94 = 0;
                uint64_t v58 = (uint64_t)v173;
LABEL_59:
                uint64_t v77 = v164;
                uint64_t v76 = v165;
              }
              else
              {
                uint64_t v94 = 1;
                uint64_t v90 = v168;
                uint64_t v96 = (uint64_t)v160;
                uint64_t v95 = v161;
              }
              (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v95 + 56))(v96, v94, 1, v90);
              swift_bridgeObjectRelease();
              if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v95 + 48))(v96, 1, v90) == 1)
              {
                (*(void (**)(char *, uint64_t))(v77 + 8))(v162, v76);
                sub_1E012C2E4(v58, (uint64_t (*)(void))type metadata accessor for HAURLValidator);
                sub_1E012C2E4(v172, (uint64_t (*)(void))type metadata accessor for HAURL);
                id result = (id)sub_1E013517C(v96, &qword_1EACE18E8, MEMORY[0x1E4F26EA0]);
              }
              else
              {
                uint64_t v103 = v90;
                uint64_t v104 = sub_1E0137F00();
                uint64_t v106 = v105;
                (*(void (**)(char *, uint64_t))(v77 + 8))(v162, v76);
                sub_1E012C2E4(v58, (uint64_t (*)(void))type metadata accessor for HAURLValidator);
                sub_1E012C2E4(v172, (uint64_t (*)(void))type metadata accessor for HAURL);
                id result = (id)(*(uint64_t (**)(uint64_t, uint64_t))(v95 + 8))(v96, v103);
                if (v106)
                {
                  *uint64_t v78 = v104;
                  v78[1] = v106;
                  *((unsigned char *)v78 + 16) = 0;
                  return result;
                }
              }
            }
            else
            {
              (*(void (**)(char *, uint64_t))(v77 + 8))(v83, v76);
              sub_1E012C2E4(v58, (uint64_t (*)(void))type metadata accessor for HAURLValidator);
              id result = (id)sub_1E012C2E4(v172, (uint64_t (*)(void))type metadata accessor for HAURL);
            }
          }
          long long v107 = xmmword_1E0139D40;
          goto LABEL_65;
        }
        id v79 = objc_msgSend(v66, sel_healthAppSharingInviteFlowPath);
        uint64_t v80 = sub_1E0138190();
        uint64_t v82 = v81;

        if (sub_1E0135590(v58, v80, v82))
        {
          swift_bridgeObjectRelease();
        }
        else
        {
          BOOL v97 = sub_1E0137B5C(v58, v80, v82);
          swift_bridgeObjectRelease();
          if (!v97)
          {
            if (HAURLValidator.isSharingProfileURL()())
            {
              sub_1E012C2E4(v58, (uint64_t (*)(void))type metadata accessor for HAURLValidator);
              id result = (id)sub_1E012C2E4(v172, (uint64_t (*)(void))type metadata accessor for HAURL);
              long long v98 = xmmword_1E0139D20;
              goto LABEL_49;
            }
            id v99 = objc_msgSend(v66, sel_healthTrendsHostName);
            uint64_t v100 = sub_1E0138190();
            uint64_t v102 = v101;

            LOBYTE(v99) = sub_1E0137B5C(v58, v100, v102);
            swift_bridgeObjectRelease();
            if (v99)
            {
              sub_1E012C2E4(v58, (uint64_t (*)(void))type metadata accessor for HAURLValidator);
              id result = (id)sub_1E012C2E4(v172, (uint64_t (*)(void))type metadata accessor for HAURL);
              long long v98 = xmmword_1E0139D10;
              goto LABEL_49;
            }
            char v108 = sub_1E0136500();
            uint64_t v78 = v166;
            if (v108)
            {
              sub_1E012C2E4(v58, (uint64_t (*)(void))type metadata accessor for HAURLValidator);
              id result = (id)sub_1E012C2E4(v172, (uint64_t (*)(void))type metadata accessor for HAURL);
              long long v107 = xmmword_1E0139D00;
            }
            else
            {
              uint64_t v109 = (uint64_t)v159;
              v171(v159, v58, v43);
              id v110 = HAURL.objectType.getter();
              sub_1E012C2E4(v109, (uint64_t (*)(void))type metadata accessor for HAURL);
              if (!v110)
              {
                uint64_t v111 = v46;
                id v112 = objc_msgSend(v66, sel_categoryTypeHostName);
                uint64_t v113 = sub_1E0138190();
                uint64_t v115 = v114;

                LOBYTE(v112) = sub_1E0137B5C(v58, v113, v115);
                swift_bridgeObjectRelease();
                if ((v112 & 1) == 0)
                {
                  if (!HAURLValidator.isEmergencyOnboardingURL()())
                  {
                    if (HAURLValidator.isMedicalIDURL()())
                    {
                      sub_1E012C2E4((uint64_t)v173, (uint64_t (*)(void))type metadata accessor for HAURLValidator);
                      id result = (id)sub_1E012C2E4(v172, (uint64_t (*)(void))type metadata accessor for HAURL);
                      long long v98 = xmmword_1E0139CE0;
                      goto LABEL_49;
                    }
                    id v116 = objc_msgSend(v66, sel_healthProfileResourceSpecifier);
                    uint64_t v117 = sub_1E0138190();
                    uint64_t v119 = v118;

                    LOBYTE(v116) = sub_1E0137B5C((uint64_t)v173, v117, v119);
                    swift_bridgeObjectRelease();
                    if (v116)
                    {
                      sub_1E012C2E4((uint64_t)v173, (uint64_t (*)(void))type metadata accessor for HAURLValidator);
                      id result = (id)sub_1E012C2E4(v172, (uint64_t (*)(void))type metadata accessor for HAURL);
                      long long v98 = xmmword_1E0139CD0;
                      goto LABEL_49;
                    }
                    if (!HAURLValidator.isHealthChecklistURL()())
                    {
                      if (sub_1E01370E0())
                      {
                        if (qword_1EACE1820 != -1) {
                          swift_once();
                        }
                        uint64_t v38 = &qword_1EACE29F0;
                        goto LABEL_9;
                      }
                      if (HAURLValidator.isResearchStudiesURL()())
                      {
                        uint64_t v120 = sub_1E0138020();
                        uint64_t v121 = *(void *)(v120 + 16);
                        if (v121)
                        {
                          uint64_t v122 = v120 + 16 * v121;
                          uint64_t v124 = *(void *)(v122 + 16);
                          uint64_t v123 = *(void *)(v122 + 24);
                          swift_bridgeObjectRetain();
                          swift_bridgeObjectRelease();
                          sub_1E012C2E4((uint64_t)v173, (uint64_t (*)(void))type metadata accessor for HAURLValidator);
                          id result = (id)sub_1E012C2E4(v172, (uint64_t (*)(void))type metadata accessor for HAURL);
                          uint64_t v48 = v166;
                          *uint64_t v166 = v124;
                          v48[1] = v123;
                        }
                        else
                        {
                          swift_bridgeObjectRelease();
                          sub_1E012C2E4((uint64_t)v173, (uint64_t (*)(void))type metadata accessor for HAURLValidator);
                          id result = (id)sub_1E012C2E4(v172, (uint64_t (*)(void))type metadata accessor for HAURL);
                          uint64_t v48 = v166;
                          *uint64_t v166 = 0;
                          v48[1] = 0;
                        }
                        char v49 = 2;
                        goto LABEL_18;
                      }
                      if (sub_1E01373F4())
                      {
                        uint64_t v125 = sub_1E0138020();
                        uint64_t v126 = *(void *)(v125 + 16);
                        if (v126)
                        {
                          uint64_t v127 = v125 + 16 * v126;
                          uint64_t v129 = *(void *)(v127 + 16);
                          uint64_t v128 = *(void *)(v127 + 24);
                          swift_bridgeObjectRetain();
                        }
                        else
                        {
                          uint64_t v129 = 0;
                          uint64_t v128 = 0;
                        }
                        swift_bridgeObjectRelease();
                        swift_bridgeObjectRetain();
                        id v138 = objc_msgSend(v66, sel_authorizationManagementHostName);
                        uint64_t v139 = sub_1E0138190();
                        uint64_t v141 = v140;

                        if (v128)
                        {
                          if (v129 == v139 && v128 == v141)
                          {
                            swift_bridgeObjectRelease();
                            sub_1E012C2E4((uint64_t)v173, (uint64_t (*)(void))type metadata accessor for HAURLValidator);
                            sub_1E012C2E4(v172, (uint64_t (*)(void))type metadata accessor for HAURL);
                            swift_bridgeObjectRelease();
                          }
                          else
                          {
                            char v142 = sub_1E01384F0();
                            swift_bridgeObjectRelease();
                            sub_1E012C2E4((uint64_t)v173, (uint64_t (*)(void))type metadata accessor for HAURLValidator);
                            sub_1E012C2E4(v172, (uint64_t (*)(void))type metadata accessor for HAURL);
                            id result = (id)swift_bridgeObjectRelease();
                            if ((v142 & 1) == 0)
                            {
                              uint64_t v48 = v166;
                              *uint64_t v166 = v129;
                              v48[1] = v128;
                              char v49 = 3;
                              goto LABEL_18;
                            }
                          }
                          id result = (id)swift_bridgeObjectRelease();
                          uint64_t v48 = v166;
                          *uint64_t v166 = 0;
                          v48[1] = 0;
                          char v49 = 3;
                        }
                        else
                        {
                          sub_1E012C2E4((uint64_t)v173, (uint64_t (*)(void))type metadata accessor for HAURLValidator);
                          sub_1E012C2E4(v172, (uint64_t (*)(void))type metadata accessor for HAURL);
                          id result = (id)swift_bridgeObjectRelease();
                          uint64_t v48 = v166;
                          *uint64_t v166 = v129;
                          v48[1] = 0;
                          char v49 = 3;
                        }
                      }
                      else
                      {
                        id v130 = objc_msgSend(v66, sel_sharingOverviewHostName);
                        uint64_t v131 = sub_1E0138190();
                        uint64_t v133 = v132;

                        LOBYTE(v130) = sub_1E0137B5C((uint64_t)v173, v131, v133);
                        swift_bridgeObjectRelease();
                        if (v130)
                        {
                          sub_1E012C2E4((uint64_t)v173, (uint64_t (*)(void))type metadata accessor for HAURLValidator);
                          id result = (id)sub_1E012C2E4(v172, (uint64_t (*)(void))type metadata accessor for HAURL);
                          long long v98 = xmmword_1E0139CC0;
                          goto LABEL_49;
                        }
                        uint64_t v134 = HAURL.pluginBundleName.getter();
                        if (v135)
                        {
                          uint64_t v136 = v134;
                          uint64_t v137 = v135;
                          sub_1E012C2E4((uint64_t)v173, (uint64_t (*)(void))type metadata accessor for HAURLValidator);
                          id result = (id)sub_1E012C2E4(v172, (uint64_t (*)(void))type metadata accessor for HAURL);
                          uint64_t v48 = v166;
                          *uint64_t v166 = v136;
                          v48[1] = v137;
                          goto LABEL_17;
                        }
                        id result = objc_msgSend(self, sel_sharedBehavior);
                        if (!result)
                        {
                          __break(1u);
                          return result;
                        }
                        id v143 = result;
                        unsigned int v144 = objc_msgSend(result, sel_isAppleInternalInstall);

                        if (v144 && sub_1E0137B5C((uint64_t)v173, 0xD000000000000010, 0x80000001E013B070))
                        {
                          sub_1E012C2E4((uint64_t)v173, (uint64_t (*)(void))type metadata accessor for HAURLValidator);
                          id result = (id)sub_1E012C2E4(v172, (uint64_t (*)(void))type metadata accessor for HAURL);
                          long long v98 = xmmword_1E0139CB0;
                          goto LABEL_49;
                        }
                        if (sub_1E0137810())
                        {
                          sub_1E012C2E4((uint64_t)v173, (uint64_t (*)(void))type metadata accessor for HAURLValidator);
                          id result = (id)sub_1E012C2E4(v172, (uint64_t (*)(void))type metadata accessor for HAURL);
                          uint64_t v145 = v166;
                          *uint64_t v166 = 0xD000000000000015;
                          v145[1] = 0x80000001E013B050;
                          *((unsigned char *)v145 + 16) = 1;
                          return result;
                        }
                        if (qword_1EC05B670 != -1) {
                          swift_once();
                        }
                        uint64_t v146 = sub_1E0138140();
                        __swift_project_value_buffer(v146, (uint64_t)qword_1EC05B758);
                        v171(v158, v157, v170);
                        uint64_t v147 = sub_1E0138120();
                        os_log_type_t v148 = sub_1E0138300();
                        if (os_log_type_enabled(v147, v148))
                        {
                          uint64_t v149 = swift_slowAlloc();
                          uint64_t v150 = swift_slowAlloc();
                          *(_DWORD *)uint64_t v149 = 136446466;
                          unint64_t v174 = &type metadata for AppURLRouting;
                          v175[0] = v150;
                          sub_1E0135140();
                          uint64_t v151 = sub_1E01381B0();
                          unint64_t v174 = (ValueMetadata *)sub_1E012BBD0(v151, v152, v175);
                          sub_1E0138340();
                          swift_bridgeObjectRelease();
                          *(_WORD *)(v149 + 12) = 2082;
                          v153 = v158;
                          uint64_t v154 = sub_1E0138010();
                          unint64_t v174 = (ValueMetadata *)sub_1E012BBD0(v154, v155, v175);
                          sub_1E0138340();
                          swift_bridgeObjectRelease();
                          v111(v153, v170);
                          _os_log_impl(&dword_1E0118000, v147, v148, "[%{public}s]: could not determine URL type for: %{public}s\n", (uint8_t *)v149, 0x16u);
                          swift_arrayDestroy();
                          MEMORY[0x1E01F1830](v150, -1, -1);
                          MEMORY[0x1E01F1830](v149, -1, -1);
                        }
                        else
                        {

                          v46(v158, v170);
                        }
                        sub_1E012C2E4((uint64_t)v173, (uint64_t (*)(void))type metadata accessor for HAURLValidator);
                        id result = (id)sub_1E012C2E4(v172, (uint64_t (*)(void))type metadata accessor for HAURL);
                        uint64_t v48 = v166;
                        *uint64_t v166 = 0;
                        v48[1] = 0;
                        char v49 = -1;
                      }
LABEL_18:
                      *((unsigned char *)v48 + 16) = v49;
                      return result;
                    }
                  }
                  if (qword_1EACE1828 != -1) {
                    swift_once();
                  }
                  uint64_t v38 = &qword_1EACE2A00;
                  goto LABEL_9;
                }
                sub_1E012C2E4(v58, (uint64_t (*)(void))type metadata accessor for HAURLValidator);
                id result = (id)sub_1E012C2E4(v172, (uint64_t (*)(void))type metadata accessor for HAURL);
                long long v98 = xmmword_1E0139CF0;
LABEL_49:
                uint64_t v48 = v166;
                *(_OWORD *)uint64_t v166 = v98;
                char v49 = 4;
                goto LABEL_18;
              }

              sub_1E012C2E4(v58, (uint64_t (*)(void))type metadata accessor for HAURLValidator);
              id result = (id)sub_1E012C2E4(v172, (uint64_t (*)(void))type metadata accessor for HAURL);
              long long v107 = xmmword_1E0139CA0;
            }
LABEL_65:
            *(_OWORD *)uint64_t v78 = v107;
            *((unsigned char *)v78 + 16) = 4;
            return result;
          }
        }
        sub_1E012C2E4(v58, (uint64_t (*)(void))type metadata accessor for HAURLValidator);
        id result = (id)sub_1E012C2E4(v172, (uint64_t (*)(void))type metadata accessor for HAURL);
        long long v98 = xmmword_1E0139D30;
        goto LABEL_49;
      }
      sub_1E012C2E4((uint64_t)v27, (uint64_t (*)(void))type metadata accessor for HAURL);
      id v61 = v63;
    }
    else
    {
      sub_1E012C2E4((uint64_t)v27, (uint64_t (*)(void))type metadata accessor for HAURL);
    }

    sub_1E012C2E4(v59, (uint64_t (*)(void))type metadata accessor for HAURLValidator);
    uint64_t v58 = (uint64_t)v173;
    goto LABEL_32;
  }
  if (qword_1EACE1810 != -1) {
    swift_once();
  }
  uint64_t v34 = qword_1EACE29D0;
  uint64_t v33 = *(void *)algn_1EACE29D8;
  swift_bridgeObjectRetain();
  sub_1E012C2E4((uint64_t)v173, (uint64_t (*)(void))type metadata accessor for HAURLValidator);
  id result = (id)sub_1E012C2E4(v172, (uint64_t (*)(void))type metadata accessor for HAURL);
  *(void *)a2 = v34;
  *(void *)(a2 + 8) = v33;
  *(unsigned char *)(a2 + 16) = 1;
  return result;
}

uint64_t _s17HealthAppServices7URLTypeO2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)a1;
  uint64_t v3 = *(void *)(a1 + 8);
  unsigned __int8 v4 = *(unsigned char *)(a1 + 16);
  uint64_t v5 = *(void *)a2;
  uint64_t v6 = *(void *)(a2 + 8);
  int v7 = *(unsigned __int8 *)(a2 + 16);
  switch(v4)
  {
    case 1u:
      if (v7 != 1) {
        goto LABEL_150;
      }
      if (v2 == v5 && v3 == v6) {
        char v9 = 1;
      }
      else {
        char v9 = sub_1E01384F0();
      }
      sub_1E01352F0(v5, v6, 1u);
      sub_1E01352F0(v2, v3, 1u);
      sub_1E0135318(v2, v3, 1u);
      sub_1E0135318(v5, v6, 1u);
      return v9 & 1;
    case 2u:
      if (v7 != 2) {
        goto LABEL_150;
      }
      if (!v3)
      {
        swift_bridgeObjectRetain();
        sub_1E01352F0(v5, v6, 2u);
        sub_1E01352F0(v2, 0, 2u);
        sub_1E0135318(v2, 0, 2u);
        sub_1E0135318(v5, v6, 2u);
        if (!v6) {
          goto LABEL_46;
        }
        goto LABEL_48;
      }
      if (!v6)
      {
        sub_1E01352F0(*(void *)a2, 0, 2u);
        sub_1E01352F0(v2, v3, 2u);
LABEL_48:
        sub_1E0135318(v2, v3, 2u);
        uint64_t v19 = v5;
        uint64_t v20 = v6;
        unsigned __int8 v21 = 2;
        goto LABEL_151;
      }
      uint64_t v10 = *(void *)a1;
      if (v2 == v5 && v3 == v6)
      {
        sub_1E01352F0(v10, v3, 2u);
        sub_1E01352F0(v2, v3, 2u);
        sub_1E0135318(v2, v3, 2u);
        uint64_t v14 = v2;
        uint64_t v22 = v3;
        unsigned __int8 v23 = 2;
LABEL_156:
        sub_1E0135318(v14, v22, v23);
        char v9 = 1;
        return v9 & 1;
      }
      char v12 = sub_1E01384F0();
      sub_1E01352F0(v5, v6, 2u);
      sub_1E01352F0(v2, v3, 2u);
      sub_1E0135318(v2, v3, 2u);
      sub_1E0135318(v5, v6, 2u);
      if (v12) {
        goto LABEL_46;
      }
LABEL_152:
      char v9 = 0;
      return v9 & 1;
    case 3u:
      if (v7 != 3) {
        goto LABEL_150;
      }
      if (v3)
      {
        if (v6)
        {
          uint64_t v16 = *(void *)a1;
          if (v2 == v5 && v3 == v6)
          {
            sub_1E01352F0(v16, v3, 3u);
            sub_1E01352F0(v2, v3, 3u);
            sub_1E0135318(v2, v3, 3u);
            uint64_t v14 = v2;
            uint64_t v22 = v3;
            unsigned __int8 v23 = 3;
            goto LABEL_156;
          }
          char v18 = sub_1E01384F0();
          sub_1E01352F0(v5, v6, 3u);
          sub_1E01352F0(v2, v3, 3u);
          sub_1E0135318(v2, v3, 3u);
          sub_1E0135318(v5, v6, 3u);
          if ((v18 & 1) == 0) {
            goto LABEL_152;
          }
LABEL_46:
          char v9 = 1;
          return v9 & 1;
        }
        sub_1E01352F0(*(void *)a2, 0, 3u);
        sub_1E01352F0(v2, v3, 3u);
      }
      else
      {
        swift_bridgeObjectRetain();
        sub_1E01352F0(v5, v6, 3u);
        sub_1E01352F0(v2, 0, 3u);
        sub_1E0135318(v2, 0, 3u);
        sub_1E0135318(v5, v6, 3u);
        if (!v6) {
          goto LABEL_46;
        }
      }
      sub_1E0135318(v2, v3, 3u);
      uint64_t v19 = v5;
      uint64_t v20 = v6;
      unsigned __int8 v21 = 3;
LABEL_151:
      sub_1E0135318(v19, v20, v21);
      goto LABEL_152;
    case 4u:
      switch(v2)
      {
        case 1:
          if (v7 != 4 || v5 != 1 || v6 != 0) {
            goto LABEL_150;
          }
          sub_1E0135318(*(void *)a1, v3, 4u);
          char v9 = 1;
          sub_1E0135318(1, 0, 4u);
          return v9 & 1;
        case 2:
          if (v7 != 4 || v5 != 2 || v6 != 0) {
            goto LABEL_150;
          }
          sub_1E0135318(*(void *)a1, v3, 4u);
          uint64_t v14 = 2;
          goto LABEL_155;
        case 3:
          if (v7 != 4 || v5 != 3 || v6 != 0) {
            goto LABEL_150;
          }
          sub_1E0135318(*(void *)a1, v3, 4u);
          uint64_t v14 = 3;
          goto LABEL_155;
        case 4:
          if (v7 != 4 || v5 != 4 || v6 != 0) {
            goto LABEL_150;
          }
          sub_1E0135318(*(void *)a1, v3, 4u);
          uint64_t v14 = 4;
          goto LABEL_155;
        case 5:
          if (v7 != 4 || v5 != 5 || v6 != 0) {
            goto LABEL_150;
          }
          sub_1E0135318(*(void *)a1, v3, 4u);
          uint64_t v14 = 5;
          goto LABEL_155;
        case 6:
          if (v7 != 4 || v5 != 6 || v6 != 0) {
            goto LABEL_150;
          }
          sub_1E0135318(*(void *)a1, v3, 4u);
          uint64_t v14 = 6;
          goto LABEL_155;
        case 7:
          if (v7 != 4 || v5 != 7 || v6 != 0) {
            goto LABEL_150;
          }
          sub_1E0135318(*(void *)a1, v3, 4u);
          uint64_t v14 = 7;
          goto LABEL_155;
        case 8:
          if (v7 != 4 || v5 != 8 || v6 != 0) {
            goto LABEL_150;
          }
          sub_1E0135318(*(void *)a1, v3, 4u);
          uint64_t v14 = 8;
          goto LABEL_155;
        case 9:
          if (v7 != 4 || v5 != 9 || v6 != 0) {
            goto LABEL_150;
          }
          sub_1E0135318(*(void *)a1, v3, 4u);
          uint64_t v14 = 9;
          goto LABEL_155;
        case 10:
          if (v7 != 4 || v5 != 10 || v6 != 0) {
            goto LABEL_150;
          }
          sub_1E0135318(*(void *)a1, v3, 4u);
          uint64_t v14 = 10;
          goto LABEL_155;
        case 11:
          if (v7 != 4 || v5 != 11 || v6 != 0) {
            goto LABEL_150;
          }
          sub_1E0135318(*(void *)a1, v3, 4u);
          uint64_t v14 = 11;
          goto LABEL_155;
        default:
          if (v7 != 4 || (v6 | v5) != 0) {
            goto LABEL_150;
          }
          sub_1E0135318(*(void *)a1, v3, 4u);
          uint64_t v14 = 0;
LABEL_155:
          uint64_t v22 = 0;
          unsigned __int8 v23 = 4;
          break;
      }
      goto LABEL_156;
    default:
      if (*(unsigned char *)(a2 + 16))
      {
LABEL_150:
        sub_1E01352F0(*(void *)a2, *(void *)(a2 + 8), v7);
        sub_1E01352F0(v2, v3, v4);
        sub_1E0135318(v2, v3, v4);
        uint64_t v19 = v5;
        uint64_t v20 = v6;
        unsigned __int8 v21 = v7;
        goto LABEL_151;
      }
      if (v2 == v5 && v3 == v6) {
        char v9 = 1;
      }
      else {
        char v9 = sub_1E01384F0();
      }
      sub_1E01352F0(v5, v6, 0);
      sub_1E01352F0(v2, v3, 0);
      sub_1E0135318(v2, v3, 0);
      sub_1E0135318(v5, v6, 0);
      return v9 & 1;
  }
}

void sub_1E0135088(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = sub_1E0138330();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t sub_1E01350DC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for HAURLValidator();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_1E0135140()
{
  unint64_t result = qword_1EACE19B0;
  if (!qword_1EACE19B0)
  {
    unint64_t result = swift_getMetatypeMetadata();
    atomic_store(result, (unint64_t *)&qword_1EACE19B0);
  }
  return result;
}

uint64_t sub_1E013517C(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  sub_1E0135088(0, a2, a3);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  return a1;
}

unint64_t sub_1E01351D8()
{
  unint64_t result = qword_1EACE19B8;
  if (!qword_1EACE19B8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EACE19B8);
  }
  return result;
}

unint64_t sub_1E013521C()
{
  unint64_t result = qword_1EACE19C0;
  if (!qword_1EACE19C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EACE19C0);
  }
  return result;
}

uint64_t sub_1E0135270()
{
  return MEMORY[0x1E4FBB220];
}

unint64_t sub_1E0135280()
{
  unint64_t result = qword_1EACE19C8;
  if (!qword_1EACE19C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EACE19C8);
  }
  return result;
}

uint64_t sub_1E01352D4()
{
  return MEMORY[0x1E4FBB230];
}

uint64_t sub_1E01352E0()
{
  return MEMORY[0x1E4FBB228];
}

uint64_t sub_1E01352F0(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  if (a3 <= 3u) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t destroy for URLType(uint64_t a1)
{
  return sub_1E0135318(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16));
}

uint64_t sub_1E0135318(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  if (a3 <= 3u) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t _s17HealthAppServices7URLTypeOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  unsigned __int8 v5 = *(unsigned char *)(a2 + 16);
  sub_1E01352F0(*(void *)a2, v4, v5);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for URLType(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  unsigned __int8 v5 = *(unsigned char *)(a2 + 16);
  sub_1E01352F0(*(void *)a2, v4, v5);
  uint64_t v6 = *(void *)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  unsigned __int8 v8 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v5;
  sub_1E0135318(v6, v7, v8);
  return a1;
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for URLType(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void *)a1;
  uint64_t v5 = *(void *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  unsigned __int8 v6 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v3;
  sub_1E0135318(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for URLType(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFC && *(unsigned char *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 252);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 4) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for URLType(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFB)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 252;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFC) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFC) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 16) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_1E01354BC(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 16) <= 3u) {
    return *(unsigned __int8 *)(a1 + 16);
  }
  else {
    return (*(_DWORD *)a1 + 4);
  }
}

uint64_t sub_1E01354D4(uint64_t result, unsigned int a2)
{
  if (a2 >= 4)
  {
    *(void *)__n128 result = a2 - 4;
    *(void *)(result + 8) = 0;
    LOBYTE(a2) = 4;
  }
  *(unsigned char *)(result + 16) = a2;
  return result;
}

ValueMetadata *type metadata accessor for URLType()
{
  return &type metadata for URLType;
}

ValueMetadata *type metadata accessor for PluginURLType()
{
  return &type metadata for PluginURLType;
}

ValueMetadata *type metadata accessor for AppURLRouting()
{
  return &type metadata for AppURLRouting;
}

uint64_t HAURLValidator.init(url:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_1E01380B0();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32);
  return v5(a2, a1, v4);
}

uint64_t sub_1E0135590(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1E01380B0();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x1F4188790](v6);
  uint64_t v10 = (char *)&v33 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v8);
  char v12 = (char *)&v33 - v11;
  uint64_t v13 = sub_1E0138090();
  uint64_t v35 = a2;
  uint64_t v36 = a3;
  if (v14)
  {
    uint64_t v39 = v13;
    uint64_t v40 = v14;
    id v15 = objc_msgSend(self, sel_externalHealthAppURLScheme);
    uint64_t v16 = a1;
    uint64_t v17 = sub_1E0138190();
    uint64_t v19 = v18;

    uint64_t v37 = v17;
    uint64_t v38 = v19;
    a1 = v16;
    sub_1E011FF24();
    uint64_t v20 = sub_1E0138370();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    int v21 = v20 == 0;
  }
  else
  {
    int v21 = 0;
  }
  uint64_t v22 = *(void (**)(char *, uint64_t, uint64_t))(v7 + 16);
  v22(v12, a1, v6);
  if (v21)
  {
    uint64_t v34 = a1;
    id v23 = objc_msgSend(self, sel_externalHealthAppURLHost);
    uint64_t v24 = sub_1E0138190();
    uint64_t v26 = v25;

    uint64_t v27 = sub_1E0138070();
    if (v28)
    {
      uint64_t v39 = v27;
      uint64_t v40 = v28;
      uint64_t v37 = v24;
      uint64_t v38 = v26;
      sub_1E011FF24();
      uint64_t v29 = sub_1E0138370();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      int v21 = v29 == 0;
    }
    else
    {
      swift_bridgeObjectRelease();
      int v21 = 0;
    }
    a1 = v34;
  }
  uint64_t v30 = *(void (**)(char *, uint64_t))(v7 + 8);
  v30(v12, v6);
  v22(v10, a1, v6);
  if (v21)
  {
    uint64_t v39 = sub_1E0138080();
    uint64_t v40 = v31;
    uint64_t v37 = v35;
    uint64_t v38 = v36;
    sub_1E011FF24();
    LOBYTE(v21) = sub_1E0138390();
    swift_bridgeObjectRelease();
  }
  v30(v10, v6);
  return v21 & 1;
}

Swift::Bool __swiftcall HAURLValidator.isCHRURL()()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for HAURLValidator();
  uint64_t v3 = MEMORY[0x1F4188790](v2 - 8);
  uint64_t v5 = (char *)v35 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = MEMORY[0x1F4188790](v3);
  uint64_t v8 = (char *)v35 - v7;
  uint64_t v9 = MEMORY[0x1F4188790](v6);
  uint64_t v11 = (char *)v35 - v10;
  MEMORY[0x1F4188790](v9);
  uint64_t v13 = (char *)v35 - v12;
  uint64_t v14 = sub_1E0138090();
  if (!v15)
  {
    sub_1E01350DC(v0, (uint64_t)v13);
LABEL_7:
    sub_1E0137D5C((uint64_t)v13, (uint64_t (*)(void))type metadata accessor for HAURLValidator);
    goto LABEL_8;
  }
  uint64_t v36 = v14;
  uint64_t v37 = v15;
  strcpy((char *)v35, "x-argonaut-app");
  HIBYTE(v35[1]) = -18;
  sub_1E011FF24();
  uint64_t v16 = sub_1E0138370();
  swift_bridgeObjectRelease();
  sub_1E01350DC(v1, (uint64_t)v13);
  if (v16) {
    goto LABEL_7;
  }
  uint64_t v17 = sub_1E0138070();
  if (!v18) {
    goto LABEL_7;
  }
  uint64_t v36 = v17;
  uint64_t v37 = v18;
  v35[0] = 0xD000000000000013;
  v35[1] = 0x80000001E013B090;
  uint64_t v19 = sub_1E0138370();
  swift_bridgeObjectRelease();
  sub_1E0137D5C((uint64_t)v13, (uint64_t (*)(void))type metadata accessor for HAURLValidator);
  if (!v19) {
    return 1;
  }
LABEL_8:
  uint64_t v20 = sub_1E0138090();
  if (!v21)
  {
    sub_1E01350DC(v1, (uint64_t)v11);
LABEL_15:
    sub_1E0137D5C((uint64_t)v11, (uint64_t (*)(void))type metadata accessor for HAURLValidator);
    sub_1E01350DC(v1, (uint64_t)v8);
    goto LABEL_16;
  }
  uint64_t v36 = v20;
  uint64_t v37 = v21;
  v35[0] = 0x7370747468;
  v35[1] = 0xE500000000000000;
  sub_1E011FF24();
  uint64_t v22 = sub_1E0138370();
  swift_bridgeObjectRelease();
  sub_1E01350DC(v1, (uint64_t)v11);
  if (v22) {
    goto LABEL_15;
  }
  uint64_t v23 = sub_1E0138070();
  if (!v24) {
    goto LABEL_15;
  }
  uint64_t v36 = v23;
  uint64_t v37 = v24;
  v35[0] = 0xD000000000000019;
  v35[1] = 0x80000001E013B0B0;
  uint64_t v25 = sub_1E0138370();
  swift_bridgeObjectRelease();
  sub_1E0137D5C((uint64_t)v11, (uint64_t (*)(void))type metadata accessor for HAURLValidator);
  sub_1E01350DC(v1, (uint64_t)v8);
  if (v25)
  {
LABEL_16:
    sub_1E0137D5C((uint64_t)v8, (uint64_t (*)(void))type metadata accessor for HAURLValidator);
    goto LABEL_17;
  }
  uint64_t v36 = sub_1E0138080();
  uint64_t v37 = v26;
  v35[0] = 0xD000000000000013;
  v35[1] = 0x80000001E013B090;
  uint64_t v27 = sub_1E0138390();
  swift_bridgeObjectRelease();
  sub_1E0137D5C((uint64_t)v8, (uint64_t (*)(void))type metadata accessor for HAURLValidator);
  if (v27) {
    return 1;
  }
LABEL_17:
  if (sub_1E0137B5C(v1, 0xD000000000000010, 0x80000001E013B0D0)
    || sub_1E0137B5C(v1, 0xD000000000000011, 0x80000001E013B0F0)
    || sub_1E0137B5C(v1, 0xD00000000000001DLL, 0x80000001E013B110))
  {
    return 1;
  }
  uint64_t v29 = sub_1E0138090();
  if (!v30)
  {
    sub_1E01350DC(v1, (uint64_t)v5);
LABEL_27:
    sub_1E0137D5C((uint64_t)v5, (uint64_t (*)(void))type metadata accessor for HAURLValidator);
    return 0;
  }
  uint64_t v36 = v29;
  uint64_t v37 = v30;
  v35[0] = 0x7370747468;
  v35[1] = 0xE500000000000000;
  sub_1E011FF24();
  uint64_t v31 = sub_1E0138370();
  swift_bridgeObjectRelease();
  sub_1E01350DC(v1, (uint64_t)v5);
  if (v31) {
    goto LABEL_27;
  }
  uint64_t v32 = sub_1E0138070();
  if (!v33) {
    goto LABEL_27;
  }
  uint64_t v36 = v32;
  uint64_t v37 = v33;
  v35[0] = 0xD000000000000023;
  v35[1] = 0x80000001E013B130;
  uint64_t v34 = sub_1E0138370();
  swift_bridgeObjectRelease();
  sub_1E0137D5C((uint64_t)v5, (uint64_t (*)(void))type metadata accessor for HAURLValidator);
  return !v34;
}

uint64_t type metadata accessor for HAURLValidator()
{
  uint64_t result = qword_1EC05B638;
  if (!qword_1EC05B638) {
    return swift_getSingletonMetadata();
  }
  return result;
}

Swift::Bool __swiftcall HAURLValidator.isSmartHealthCardFile()()
{
  uint64_t v1 = type metadata accessor for HAURLValidator();
  MEMORY[0x1F4188790](v1 - 8);
  uint64_t v3 = (char *)&v16 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v4 = sub_1E0138000();
  sub_1E01350DC(v0, (uint64_t)v3);
  if (v4)
  {
    sub_1E0138030();
    char v5 = sub_1E0138270();
    swift_bridgeObjectRelease();
    sub_1E0137D5C((uint64_t)v3, (uint64_t (*)(void))type metadata accessor for HAURLValidator);
    if (v5)
    {
      if (qword_1EC05B670 != -1) {
        swift_once();
      }
      uint64_t v6 = sub_1E0138140();
      __swift_project_value_buffer(v6, (uint64_t)qword_1EC05B758);
      uint64_t v7 = sub_1E0138120();
      os_log_type_t v8 = sub_1E0138310();
      if (os_log_type_enabled(v7, v8))
      {
        uint64_t v9 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v9 = 0;
        _os_log_impl(&dword_1E0118000, v7, v8, "[URL+ValidateURLs]: looks like this is a SMART Health Card", v9, 2u);
        MEMORY[0x1E01F1830](v9, -1, -1);
      }

      return 1;
    }
  }
  else
  {
    sub_1E0137D5C((uint64_t)v3, (uint64_t (*)(void))type metadata accessor for HAURLValidator);
  }
  if (qword_1EC05B670 != -1) {
    swift_once();
  }
  uint64_t v11 = sub_1E0138140();
  __swift_project_value_buffer(v11, (uint64_t)qword_1EC05B758);
  uint64_t v12 = sub_1E0138120();
  os_log_type_t v13 = sub_1E01382F0();
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v14 = (uint8_t *)swift_slowAlloc();
    uint64_t v15 = swift_slowAlloc();
    uint64_t v17 = v15;
    *(_DWORD *)uint64_t v14 = 136315138;
    uint64_t v16 = sub_1E012BBD0(0xD000000000000012, 0x80000001E013B160, &v17);
    sub_1E0138340();
    _os_log_impl(&dword_1E0118000, v12, v13, "[URL+ValidateURLs]: not a file URL and/or doesn't end with %s: not a SMART Health Card", v14, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1E01F1830](v15, -1, -1);
    MEMORY[0x1E01F1830](v14, -1, -1);
  }

  return 0;
}

Swift::Bool __swiftcall HAURLValidator.hasObjectType(_:)(HKObjectType_optional a1)
{
  Class isa = a1.value.super.isa;
  uint64_t v3 = type metadata accessor for HAURL();
  MEMORY[0x1F4188790](v3 - 8);
  char v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1E01380B0();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(v5, v1, v6);
  id v7 = HAURL.objectType.getter();
  if (!v7)
  {
    sub_1E0137D5C((uint64_t)v5, (uint64_t (*)(void))type metadata accessor for HAURL);
LABEL_6:
    char v10 = 0;
    return v10 & 1;
  }
  os_log_type_t v8 = v7;
  if (!isa)
  {
    sub_1E0137D5C((uint64_t)v5, (uint64_t (*)(void))type metadata accessor for HAURL);

    goto LABEL_6;
  }
  sub_1E01351D8();
  uint64_t v9 = isa;
  char v10 = sub_1E0138320();
  sub_1E0137D5C((uint64_t)v5, (uint64_t (*)(void))type metadata accessor for HAURL);

  return v10 & 1;
}

Swift::Bool __swiftcall HAURLValidator.isSummaryURL()()
{
  return sub_1E01376F0((SEL *)&selRef_healthAppSummaryHostName);
}

Swift::Bool __swiftcall HAURLValidator.isBrowseURL()()
{
  return sub_1E01376F0((SEL *)&selRef_healthAppBrowseHostName);
}

Swift::Bool __swiftcall HAURLValidator.isSharingInviteFlowURL()()
{
  id v1 = objc_msgSend(self, sel_healthAppSharingInviteFlowPath);
  uint64_t v2 = sub_1E0138190();
  uint64_t v4 = v3;

  BOOL v5 = (sub_1E0135590(v0, v2, v4) & 1) != 0 || sub_1E0137B5C(v0, v2, v4);
  swift_bridgeObjectRelease();
  return v5;
}

Swift::Bool __swiftcall HAURLValidator.isSharingProfileURL()()
{
  id v1 = self;
  id v2 = objc_msgSend(v1, sel_healthAppSharingProfilePath);
  uint64_t v3 = sub_1E0138190();
  uint64_t v5 = v4;

  if (sub_1E0135590(v0, v3, v5))
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  id v7 = (void *)sub_1E0138040();
  id v8 = objc_msgSend(v7, sel_resourceSpecifier);

  if (v8)
  {
    sub_1E0138190();
    uint64_t v10 = v9;

    sub_1E0138090();
    if (!v11) {
      goto LABEL_8;
    }
  }
  else
  {
    uint64_t v10 = 0;
    sub_1E0138090();
    if (!v12)
    {
LABEL_8:
      swift_bridgeObjectRelease();
LABEL_9:
      swift_bridgeObjectRelease();
      return 0;
    }
  }
  id v13 = objc_msgSend(v1, sel_internalHealthAppURLScheme);
  sub_1E0138190();

  sub_1E011FF24();
  uint64_t v14 = sub_1E0138370();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v14) {
    goto LABEL_8;
  }
  if (!v10) {
    goto LABEL_9;
  }
  sub_1E01381F0();
  swift_bridgeObjectRelease();
  char v15 = sub_1E0138260();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return (v15 & 1) != 0;
}

Swift::Bool __swiftcall HAURLValidator.isAllTrendsURL()()
{
  return sub_1E01376F0((SEL *)&selRef_healthTrendsHostName);
}

uint64_t sub_1E0136500()
{
  uint64_t v0 = sub_1E0138090();
  if (!v1) {
    return 0;
  }
  uint64_t v21 = v0;
  uint64_t v22 = v1;
  id v2 = self;
  id v3 = objc_msgSend(v2, sel_internalHealthAppURLScheme);
  uint64_t v4 = sub_1E0138190();
  uint64_t v6 = v5;

  uint64_t v19 = v4;
  uint64_t v20 = v6;
  sub_1E011FF24();
  uint64_t v7 = sub_1E0138370();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v7) {
    return 0;
  }
  id v8 = (void *)sub_1E0138020();
  uint64_t v9 = v8;
  if (v8[2] == 2)
  {
    uint64_t v11 = v8[4];
    uint64_t v10 = v8[5];
    swift_bridgeObjectRetain();
    if (v10)
    {
      if (v11 == 47 && v10 == 0xE100000000000000)
      {
        uint64_t result = swift_bridgeObjectRelease();
LABEL_9:
        if (v9[2] < 2uLL)
        {
          __break(1u);
          return result;
        }
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        id v14 = objc_msgSend(v2, sel_healthAppNotificationSettingsPath, v19, v20, v21, v22);
        sub_1E0138190();

        id v15 = objc_msgSend(v2, sel_healthProfileResourceSpecifier);
        sub_1E0138190();

        sub_1E0138070();
        if (v16)
        {
          uint64_t v17 = sub_1E0138370();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if (!v17)
          {
            uint64_t v18 = sub_1E0138370();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            return v18 == 0;
          }
          swift_bridgeObjectRelease();
        }
        else
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
        }
        goto LABEL_13;
      }
      char v13 = sub_1E01384F0();
      uint64_t result = swift_bridgeObjectRelease();
      if (v13) {
        goto LABEL_9;
      }
    }
  }
LABEL_13:
  swift_bridgeObjectRelease();
  return 0;
}

Swift::Bool __swiftcall HAURLValidator.hasObjectType()()
{
  uint64_t v1 = type metadata accessor for HAURL();
  MEMORY[0x1F4188790](v1 - 8);
  id v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_1E01380B0();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(v3, v0, v4);
  id v5 = HAURL.objectType.getter();
  sub_1E0137D5C((uint64_t)v3, (uint64_t (*)(void))type metadata accessor for HAURL);
  if (v5) {

  }
  return v5 != 0;
}

Swift::Bool __swiftcall HAURLValidator.isCategoryURL()()
{
  return sub_1E01376F0((SEL *)&selRef_categoryTypeHostName);
}

Swift::Bool __swiftcall HAURLValidator.isEmergencyOnboardingURL()()
{
  uint64_t v0 = sub_1E0138090();
  if (!v1) {
    return 0;
  }
  uint64_t v20 = v0;
  uint64_t v21 = v1;
  uint64_t v2 = self;
  id v3 = objc_msgSend(v2, sel_internalHealthAppURLScheme);
  uint64_t v4 = sub_1E0138190();
  uint64_t v6 = v5;

  uint64_t v18 = v4;
  uint64_t v19 = v6;
  sub_1E011FF24();
  uint64_t v7 = sub_1E0138370();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v7) {
    return 0;
  }
  id v8 = (void *)sub_1E0138020();
  uint64_t v9 = v8;
  if (v8[2] == 2)
  {
    uint64_t v11 = v8[4];
    uint64_t v10 = v8[5];
    swift_bridgeObjectRetain();
    if (v10)
    {
      if (v11 == 47 && v10 == 0xE100000000000000)
      {
        Swift::Bool result = swift_bridgeObjectRelease();
LABEL_9:
        if (v9[2] < 2uLL)
        {
          __break(1u);
          return result;
        }
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        id v14 = objc_msgSend(v2, sel_healthAppMedicalIDPath, v18, v19, v20, v21);
        sub_1E0138190();

        sub_1E0138070();
        if (v15)
        {
          uint64_t v16 = sub_1E0138370();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if (!v16)
          {
            uint64_t v17 = sub_1E0138370();
            swift_bridgeObjectRelease();
            return v17 == 0;
          }
        }
        else
        {
          swift_bridgeObjectRelease();
        }
        goto LABEL_12;
      }
      char v13 = sub_1E01384F0();
      Swift::Bool result = swift_bridgeObjectRelease();
      if (v13) {
        goto LABEL_9;
      }
    }
  }
LABEL_12:
  swift_bridgeObjectRelease();
  return 0;
}

Swift::Bool __swiftcall HAURLValidator.isMedicalIDURL()()
{
  uint64_t v0 = (void *)sub_1E0138040();
  id v1 = objc_msgSend(v0, sel_resourceSpecifier);

  if (v1)
  {
    sub_1E0138190();
    uint64_t v3 = v2;
  }
  else
  {
    uint64_t v3 = 0;
  }
  uint64_t v4 = self;
  id v5 = objc_msgSend(v4, sel_healthAppMedicalIDPath);
  sub_1E0138190();

  sub_1E0138090();
  if (!v6
    || (id v7 = objc_msgSend(v4, sel_internalHealthAppURLScheme),
        sub_1E0138190(),
        v7,
        sub_1E011FF24(),
        uint64_t v8 = sub_1E0138370(),
        swift_bridgeObjectRelease(),
        swift_bridgeObjectRelease(),
        v8))
  {
    swift_bridgeObjectRelease();
LABEL_7:
    swift_bridgeObjectRelease();
    return 0;
  }
  if (!v3) {
    goto LABEL_7;
  }
  uint64_t v10 = sub_1E0138370();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return !v10;
}

Swift::Bool __swiftcall HAURLValidator.isHealthChecklistURL()()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for HAURLValidator();
  uint64_t v3 = MEMORY[0x1F4188790](v2 - 8);
  id v5 = (char *)&v37 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v3);
  id v7 = (char *)&v37 - v6;
  uint64_t v8 = sub_1E0138090();
  if (!v9) {
    goto LABEL_23;
  }
  uint64_t v39 = v8;
  uint64_t v40 = v9;
  uint64_t v10 = self;
  id v11 = objc_msgSend(v10, sel_internalHealthAppURLScheme);
  uint64_t v12 = sub_1E0138190();
  unint64_t v14 = v13;

  uint64_t v37 = v12;
  unint64_t v38 = v14;
  sub_1E011FF24();
  uint64_t v15 = sub_1E0138370();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v15) {
    goto LABEL_23;
  }
  uint64_t v16 = sub_1E0138070();
  if (v17)
  {
    if (v16 == 0x684368746C616548 && v17 == 0xEF7473696C6B6365)
    {
      swift_bridgeObjectRelease();
      LOBYTE(v18) = 1;
      return (char)v18;
    }
    char v19 = sub_1E01384F0();
    swift_bridgeObjectRelease();
    if (v19)
    {
      LOBYTE(v18) = 1;
      return (char)v18;
    }
  }
  uint64_t v20 = sub_1E0138070();
  uint64_t v22 = v21;
  id v23 = objc_msgSend(v10, sel_healthProfileResourceSpecifier);
  uint64_t v24 = sub_1E0138190();
  uint64_t v26 = v25;

  if (!v22)
  {
    swift_bridgeObjectRelease();
    sub_1E01350DC(v1, (uint64_t)v7);
    goto LABEL_21;
  }
  if (v20 != v24 || v22 != v26)
  {
    char v27 = sub_1E01384F0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_1E01350DC(v1, (uint64_t)v7);
    if (v27) {
      goto LABEL_15;
    }
LABEL_21:
    sub_1E0137D5C((uint64_t)v7, (uint64_t (*)(void))type metadata accessor for HAURLValidator);
    sub_1E01350DC(v1, (uint64_t)v5);
    goto LABEL_22;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1E01350DC(v1, (uint64_t)v7);
LABEL_15:
  unint64_t v28 = *(void *)(sub_1E0138020() + 16);
  swift_bridgeObjectRelease();
  sub_1E0137D5C((uint64_t)v7, (uint64_t (*)(void))type metadata accessor for HAURLValidator);
  sub_1E01350DC(v1, (uint64_t)v5);
  if (v28 < 2) {
    goto LABEL_22;
  }
  uint64_t v29 = (void *)sub_1E0138020();
  if (!v29[2])
  {
    swift_bridgeObjectRelease();
    goto LABEL_22;
  }
  uint64_t v31 = v29[4];
  uint64_t v30 = v29[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  if (!v30)
  {
LABEL_22:
    sub_1E0137D5C((uint64_t)v5, (uint64_t (*)(void))type metadata accessor for HAURLValidator);
LABEL_23:
    LOBYTE(v18) = 0;
    return (char)v18;
  }
  if (v31 == 47 && v30 == 0xE100000000000000)
  {
    sub_1E0137D5C((uint64_t)v5, (uint64_t (*)(void))type metadata accessor for HAURLValidator);
    swift_bridgeObjectRelease();
  }
  else
  {
    char v32 = sub_1E01384F0();
    sub_1E0137D5C((uint64_t)v5, (uint64_t (*)(void))type metadata accessor for HAURLValidator);
    swift_bridgeObjectRelease();
    LOBYTE(v18) = 0;
    if ((v32 & 1) == 0) {
      return (char)v18;
    }
  }
  uint64_t v18 = (void *)sub_1E0138020();
  if (v18[2] < 2uLL)
  {
    __break(1u);
  }
  else
  {
    uint64_t v33 = v18[6];
    uint64_t v34 = v18[7];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    uint64_t v39 = v33;
    uint64_t v40 = v34;
    uint64_t v37 = 0x684368746C616548;
    unint64_t v38 = 0xEF7473696C6B6365;
    uint64_t v35 = sub_1E0138370();
    swift_bridgeObjectRelease();
    LOBYTE(v18) = v35 == 0;
  }
  return (char)v18;
}

uint64_t sub_1E01370E0()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for HAURLValidator();
  MEMORY[0x1F4188790](v2 - 8);
  uint64_t v4 = (char *)v17 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_1E0138090();
  if (!v6)
  {
    sub_1E01350DC(v0, (uint64_t)v4);
LABEL_10:
    sub_1E0137D5C((uint64_t)v4, (uint64_t (*)(void))type metadata accessor for HAURLValidator);
    char v15 = 0;
    return v15 & 1;
  }
  v17[2] = v5;
  v17[3] = v6;
  id v7 = objc_msgSend(self, sel_internalHealthAppURLScheme);
  uint64_t v8 = sub_1E0138190();
  uint64_t v10 = v9;

  v17[0] = v8;
  v17[1] = v10;
  sub_1E011FF24();
  uint64_t v11 = sub_1E0138370();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1E01350DC(v1, (uint64_t)v4);
  if (v11) {
    goto LABEL_10;
  }
  uint64_t v12 = sub_1E0138070();
  if (!v13) {
    goto LABEL_10;
  }
  if (v12 == 0x656C69666F7270 && v13 == 0xE700000000000000) {
    char v15 = 1;
  }
  else {
    char v15 = sub_1E01384F0();
  }
  sub_1E0137D5C((uint64_t)v4, (uint64_t (*)(void))type metadata accessor for HAURLValidator);
  swift_bridgeObjectRelease();
  return v15 & 1;
}

Swift::Bool __swiftcall HAURLValidator.isResearchStudiesURL()()
{
  uint64_t v0 = (void *)sub_1E0138040();
  id v1 = objc_msgSend(v0, sel_resourceSpecifier);

  if (v1)
  {
    sub_1E0138190();
    uint64_t v3 = v2;

    sub_1E0138090();
    if (!v4) {
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v3 = 0;
    sub_1E0138090();
    if (!v5)
    {
LABEL_6:
      swift_bridgeObjectRelease();
      return 0;
    }
  }
  id v6 = objc_msgSend(self, sel_internalHealthAppURLScheme);
  sub_1E0138190();

  sub_1E011FF24();
  uint64_t v7 = sub_1E0138370();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v7) {
    goto LABEL_6;
  }
  if (!v3) {
    return 0;
  }
  char v9 = sub_1E0138260();
  swift_bridgeObjectRelease();
  return (v9 & 1) != 0;
}

void *sub_1E01373F4()
{
  uint64_t v0 = self;
  id v1 = objc_msgSend(v0, sel_authorizationManagementHostName);
  uint64_t v2 = sub_1E0138190();
  uint64_t v4 = v3;

  sub_1E0138090();
  if (!v5) {
    goto LABEL_3;
  }
  id v6 = objc_msgSend(v0, sel_internalHealthAppURLScheme);
  uint64_t v7 = sub_1E0138190();
  uint64_t v9 = v8;

  sub_1E011FF24();
  uint64_t v10 = sub_1E0138370();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v10) {
    goto LABEL_3;
  }
  uint64_t v13 = sub_1E0138060();
  if (!v14) {
    goto LABEL_3;
  }
  uint64_t v15 = v13;
  uint64_t v16 = v14;
  if (v13 == v2 && v14 == v4 || (sub_1E01384F0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    char v11 = 1;
    return (void *)(v11 & 1);
  }
  id v17 = objc_msgSend(v0, sel_sharingOverviewHostName, v7, v9, v15, v16);
  sub_1E0138190();

  LOBYTE(v17) = sub_1E0138390();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v17 & 1) == 0) {
    goto LABEL_3;
  }
  unint64_t v18 = *(void *)(sub_1E0138020() + 16);
  swift_bridgeObjectRelease();
  if (v18 < 2) {
    goto LABEL_3;
  }
  char v19 = (void *)sub_1E0138020();
  if (!v19[2])
  {
    swift_bridgeObjectRelease();
    goto LABEL_3;
  }
  uint64_t v21 = v19[4];
  uint64_t v20 = v19[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  if (!v20) {
    goto LABEL_3;
  }
  if (v21 == 47 && v20 == 0xE100000000000000)
  {
    swift_bridgeObjectRelease();
    goto LABEL_19;
  }
  char v22 = sub_1E01384F0();
  swift_bridgeObjectRelease();
  if ((v22 & 1) == 0)
  {
LABEL_3:
    swift_bridgeObjectRelease();
    char v11 = 0;
    return (void *)(v11 & 1);
  }
LABEL_19:
  Swift::Bool result = (void *)sub_1E0138020();
  if (result[2] >= 2uLL)
  {
    uint64_t v23 = result[6];
    uint64_t v24 = result[7];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    if (v23 == v2 && v24 == v4)
    {
      swift_bridgeObjectRelease_n();
      char v11 = 1;
    }
    else
    {
      char v11 = sub_1E01384F0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    return (void *)(v11 & 1);
  }
  __break(1u);
  return result;
}

Swift::Bool __swiftcall HAURLValidator.isSharingOverviewURL()()
{
  return sub_1E01376F0((SEL *)&selRef_sharingOverviewHostName);
}

uint64_t sub_1E01376F0(SEL *a1)
{
  id v2 = [self *a1];
  uint64_t v3 = sub_1E0138190();
  uint64_t v5 = v4;

  LOBYTE(v2) = sub_1E0137B5C(v1, v3, v5);
  swift_bridgeObjectRelease();
  return v2 & 1;
}

Swift::Bool __swiftcall HAURLValidator.isInternalSettingsURL()()
{
  id v1 = objc_msgSend(self, sel_sharedBehavior);
  if (v1)
  {
    id v2 = v1;
    unsigned int v3 = objc_msgSend(v1, sel_isAppleInternalInstall);

    if (v3)
    {
      LOBYTE(v1) = sub_1E0137B5C(v0, 0xD000000000000010, 0x80000001E013B070);
    }
    else
    {
      LOBYTE(v1) = 0;
    }
  }
  else
  {
    __break(1u);
  }
  return (char)v1;
}

uint64_t sub_1E0137810()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for HAURLValidator();
  uint64_t v3 = MEMORY[0x1F4188790](v2 - 8);
  uint64_t v5 = (char *)&v29 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v3);
  uint64_t v7 = (char *)&v29 - v6;
  uint64_t v8 = sub_1E0138090();
  if (!v9)
  {
    sub_1E01350DC(v0, (uint64_t)v7);
    goto LABEL_7;
  }
  uint64_t v31 = v8;
  uint64_t v32 = v9;
  id v10 = objc_msgSend(self, sel_externalHealthAppURLScheme);
  uint64_t v11 = sub_1E0138190();
  uint64_t v13 = v12;

  uint64_t v29 = v11;
  uint64_t v30 = v13;
  sub_1E011FF24();
  uint64_t v14 = sub_1E0138370();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1E01350DC(v1, (uint64_t)v7);
  if (v14)
  {
LABEL_7:
    sub_1E0137D5C((uint64_t)v7, (uint64_t (*)(void))type metadata accessor for HAURLValidator);
    sub_1E01350DC(v1, (uint64_t)v5);
    goto LABEL_8;
  }
  id v15 = objc_msgSend(self, sel_externalHealthAppURLHost);
  uint64_t v16 = sub_1E0138190();
  uint64_t v18 = v17;

  uint64_t v19 = sub_1E0138070();
  if (!v20)
  {
    swift_bridgeObjectRelease();
    goto LABEL_7;
  }
  uint64_t v31 = v19;
  uint64_t v32 = v20;
  uint64_t v29 = v16;
  uint64_t v30 = v18;
  uint64_t v21 = sub_1E0138370();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1E0137D5C((uint64_t)v7, (uint64_t (*)(void))type metadata accessor for HAURLValidator);
  sub_1E01350DC(v1, (uint64_t)v5);
  if (v21)
  {
LABEL_8:
    sub_1E0137D5C((uint64_t)v5, (uint64_t (*)(void))type metadata accessor for HAURLValidator);
    char v27 = 0;
    return v27 & 1;
  }
  uint64_t v31 = sub_1E0138080();
  uint64_t v32 = v22;
  id v23 = objc_msgSend(self, sel_healthAppVisionRXIngestionURLPath);
  uint64_t v24 = sub_1E0138190();
  uint64_t v26 = v25;

  uint64_t v29 = v24;
  uint64_t v30 = v26;
  char v27 = sub_1E0138390();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1E0137D5C((uint64_t)v5, (uint64_t (*)(void))type metadata accessor for HAURLValidator);
  return v27 & 1;
}

uint64_t HAURLValidator.url.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_1E01380B0();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);
  return v4(a1, v1, v3);
}

BOOL sub_1E0137B5C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1E01380B0();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  uint64_t v9 = (char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_1E0138090();
  if (!v11)
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a1, v6);
LABEL_6:
    BOOL v20 = 0;
    goto LABEL_7;
  }
  uint64_t v24 = v10;
  uint64_t v25 = v11;
  id v12 = objc_msgSend(self, sel_internalHealthAppURLScheme);
  uint64_t v13 = sub_1E0138190();
  uint64_t v15 = v14;

  uint64_t v22 = v13;
  uint64_t v23 = v15;
  sub_1E011FF24();
  uint64_t v16 = sub_1E0138370();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a1, v6);
  if (v16) {
    goto LABEL_6;
  }
  uint64_t v17 = sub_1E0138070();
  if (!v18) {
    goto LABEL_6;
  }
  uint64_t v24 = v17;
  uint64_t v25 = v18;
  uint64_t v22 = a2;
  uint64_t v23 = a3;
  uint64_t v19 = sub_1E0138370();
  swift_bridgeObjectRelease();
  BOOL v20 = v19 == 0;
LABEL_7:
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v20;
}

uint64_t sub_1E0137D5C(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t getEnumTagSinglePayload for HAURLValidator(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1E0137DD0);
}

uint64_t sub_1E0137DD0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1E01380B0();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);
  return v5(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for HAURLValidator(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1E0137E50);
}

uint64_t sub_1E0137E50(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1E01380B0();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);
  return v5(a1, a2, a2, v4);
}

uint64_t sub_1E0137EC0()
{
  return MEMORY[0x1F40E3308]();
}

uint64_t sub_1E0137ED0()
{
  return MEMORY[0x1F40E3420]();
}

uint64_t sub_1E0137EE0()
{
  return MEMORY[0x1F40E35B0]();
}

uint64_t sub_1E0137EF0()
{
  return MEMORY[0x1F40E35C0]();
}

uint64_t sub_1E0137F00()
{
  return MEMORY[0x1F40E35C8]();
}

uint64_t sub_1E0137F10()
{
  return MEMORY[0x1F40E35D8]();
}

uint64_t sub_1E0137F20()
{
  return MEMORY[0x1F40E3668]();
}

uint64_t sub_1E0137F30()
{
  return MEMORY[0x1F40E36C8]();
}

uint64_t sub_1E0137F40()
{
  return MEMORY[0x1F40E36F8]();
}

uint64_t sub_1E0137F50()
{
  return MEMORY[0x1F40E3760]();
}

uint64_t sub_1E0137F60()
{
  return MEMORY[0x1F40E37A8]();
}

uint64_t sub_1E0137F70()
{
  return MEMORY[0x1F40E37B8]();
}

uint64_t sub_1E0137F80()
{
  return MEMORY[0x1F40E3F58]();
}

uint64_t sub_1E0137F90()
{
  return MEMORY[0x1F40E42C8]();
}

uint64_t sub_1E0137FA0()
{
  return MEMORY[0x1F40E42F0]();
}

uint64_t sub_1E0137FB0()
{
  return MEMORY[0x1F40E4368]();
}

uint64_t sub_1E0137FC0()
{
  return MEMORY[0x1F40E43C0]();
}

uint64_t sub_1E0137FD0()
{
  return MEMORY[0x1F40E43D0]();
}

uint64_t sub_1E0137FE0()
{
  return MEMORY[0x1F40E4540]();
}

uint64_t sub_1E0137FF0()
{
  return MEMORY[0x1F40E4550]();
}

uint64_t sub_1E0138000()
{
  return MEMORY[0x1F40E4898]();
}

uint64_t sub_1E0138010()
{
  return MEMORY[0x1F40E48F8]();
}

uint64_t sub_1E0138020()
{
  return MEMORY[0x1F40E4908]();
}

uint64_t sub_1E0138030()
{
  return MEMORY[0x1F40E4970]();
}

uint64_t sub_1E0138040()
{
  return MEMORY[0x1F40E49A0]();
}

uint64_t sub_1E0138050()
{
  return MEMORY[0x1F40E4A70]();
}

uint64_t sub_1E0138060()
{
  return MEMORY[0x1F40E4A90]();
}

uint64_t sub_1E0138070()
{
  return MEMORY[0x1F40E4AA0]();
}

uint64_t sub_1E0138080()
{
  return MEMORY[0x1F40E4AC0]();
}

uint64_t sub_1E0138090()
{
  return MEMORY[0x1F40E4B00]();
}

uint64_t sub_1E01380A0()
{
  return MEMORY[0x1F40E4B20]();
}

uint64_t sub_1E01380B0()
{
  return MEMORY[0x1F40E4B80]();
}

uint64_t sub_1E01380C0()
{
  return MEMORY[0x1F40E4DA8]();
}

uint64_t sub_1E01380D0()
{
  return MEMORY[0x1F40E4ED0]();
}

uint64_t sub_1E01380E0()
{
  return MEMORY[0x1F40E5388]();
}

uint64_t _s10Foundation4UUIDV17HealthAppServicesE13fromURLStringyACSgSSFZ_0()
{
  return MEMORY[0x1F40E53A0]();
}

uint64_t _s10Foundation4UUIDV17HealthAppServicesE11toURLStringSSyF_0()
{
  return MEMORY[0x1F40E53B0]();
}

uint64_t sub_1E0138110()
{
  return MEMORY[0x1F40E5448]();
}

uint64_t sub_1E0138120()
{
  return MEMORY[0x1F4188670]();
}

uint64_t sub_1E0138130()
{
  return MEMORY[0x1F4188680]();
}

uint64_t sub_1E0138140()
{
  return MEMORY[0x1F41886A0]();
}

uint64_t sub_1E0138150()
{
  return MEMORY[0x1F40E6000]();
}

uint64_t sub_1E0138160()
{
  return MEMORY[0x1F40E6030]();
}

uint64_t sub_1E0138170()
{
  return MEMORY[0x1F40E6190]();
}

uint64_t sub_1E0138180()
{
  return MEMORY[0x1F40E61A0]();
}

uint64_t sub_1E0138190()
{
  return MEMORY[0x1F40E61D8]();
}

uint64_t sub_1E01381A0()
{
  return MEMORY[0x1F40E6238]();
}

uint64_t sub_1E01381B0()
{
  return MEMORY[0x1F4183880]();
}

uint64_t sub_1E01381C0()
{
  return MEMORY[0x1F4183958]();
}

uint64_t sub_1E01381D0()
{
  return MEMORY[0x1F41839B0]();
}

uint64_t sub_1E01381E0()
{
  return MEMORY[0x1F41839F8]();
}

uint64_t sub_1E01381F0()
{
  return MEMORY[0x1F4183A38]();
}

uint64_t sub_1E0138200()
{
  return MEMORY[0x1F4183A80]();
}

uint64_t sub_1E0138210()
{
  return MEMORY[0x1F4183A88]();
}

uint64_t sub_1E0138220()
{
  return MEMORY[0x1F4183AA0]();
}

uint64_t sub_1E0138240()
{
  return MEMORY[0x1F4183AB0]();
}

uint64_t sub_1E0138250()
{
  return MEMORY[0x1F4183B10]();
}

uint64_t sub_1E0138260()
{
  return MEMORY[0x1F4183B30]();
}

uint64_t sub_1E0138270()
{
  return MEMORY[0x1F4183B38]();
}

uint64_t sub_1E0138280()
{
  return MEMORY[0x1F4183B58]();
}

uint64_t sub_1E0138290()
{
  return MEMORY[0x1F4183B90]();
}

uint64_t sub_1E01382A0()
{
  return MEMORY[0x1F4183BA0]();
}

uint64_t sub_1E01382B0()
{
  return MEMORY[0x1F40E6338]();
}

uint64_t sub_1E01382C0()
{
  return MEMORY[0x1F40E6370]();
}

uint64_t sub_1E01382D0()
{
  return MEMORY[0x1F4183FA8]();
}

uint64_t sub_1E01382E0()
{
  return MEMORY[0x1F40E6478]();
}

uint64_t sub_1E01382F0()
{
  return MEMORY[0x1F41886D0]();
}

uint64_t sub_1E0138300()
{
  return MEMORY[0x1F41886E0]();
}

uint64_t sub_1E0138310()
{
  return MEMORY[0x1F4188700]();
}

uint64_t sub_1E0138320()
{
  return MEMORY[0x1F41874C0]();
}

uint64_t sub_1E0138330()
{
  return MEMORY[0x1F4184640]();
}

uint64_t sub_1E0138340()
{
  return MEMORY[0x1F41847C0]();
}

uint64_t sub_1E0138350()
{
  return MEMORY[0x1F4184820]();
}

uint64_t sub_1E0138360()
{
  return MEMORY[0x1F40E6C98]();
}

uint64_t sub_1E0138370()
{
  return MEMORY[0x1F40E6CA0]();
}

uint64_t sub_1E0138380()
{
  return MEMORY[0x1F40E6CB8]();
}

uint64_t sub_1E0138390()
{
  return MEMORY[0x1F40E6CF0]();
}

uint64_t sub_1E01383A0()
{
  return MEMORY[0x1F4184978]();
}

uint64_t sub_1E01383B0()
{
  return MEMORY[0x1F4184B20]();
}

uint64_t sub_1E01383C0()
{
  return MEMORY[0x1F4184C18]();
}

uint64_t sub_1E01383D0()
{
  return MEMORY[0x1F4184C20]();
}

uint64_t sub_1E01383E0()
{
  return MEMORY[0x1F4184C38]();
}

uint64_t sub_1E01383F0()
{
  return MEMORY[0x1F4184CC0]();
}

uint64_t sub_1E0138400()
{
  return MEMORY[0x1F4184CE8]();
}

uint64_t sub_1E0138410()
{
  return MEMORY[0x1F4184CF0]();
}

uint64_t sub_1E0138420()
{
  return MEMORY[0x1F4184E68]();
}

uint64_t sub_1E0138430()
{
  return MEMORY[0x1F4185050]();
}

uint64_t sub_1E0138440()
{
  return MEMORY[0x1F4185298]();
}

uint64_t sub_1E0138450()
{
  return MEMORY[0x1F41852A0]();
}

uint64_t sub_1E0138460()
{
  return MEMORY[0x1F4185368]();
}

uint64_t sub_1E0138470()
{
  return MEMORY[0x1F4185370]();
}

uint64_t sub_1E0138480()
{
  return MEMORY[0x1F4185380]();
}

uint64_t sub_1E0138490()
{
  return MEMORY[0x1F4185388]();
}

uint64_t sub_1E01384A0()
{
  return MEMORY[0x1F4185398]();
}

uint64_t sub_1E01384B0()
{
  return MEMORY[0x1F41854C8]();
}

uint64_t sub_1E01384C0()
{
  return MEMORY[0x1F4185748]();
}

uint64_t sub_1E01384D0()
{
  return MEMORY[0x1F4185758]();
}

uint64_t sub_1E01384E0()
{
  return MEMORY[0x1F4185768]();
}

uint64_t sub_1E01384F0()
{
  return MEMORY[0x1F4185A40]();
}

uint64_t sub_1E0138500()
{
  return MEMORY[0x1F4185D10]();
}

uint64_t sub_1E0138510()
{
  return MEMORY[0x1F4185DE0]();
}

uint64_t sub_1E0138520()
{
  return MEMORY[0x1F4185EB0]();
}

uint64_t sub_1E0138530()
{
  return MEMORY[0x1F4185EC8]();
}

uint64_t sub_1E0138540()
{
  return MEMORY[0x1F4185EF8]();
}

uint64_t sub_1E0138550()
{
  return MEMORY[0x1F4186318]();
}

uint64_t AnalyticsSendEvent()
{
  return MEMORY[0x1F41138A0]();
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1F40E72B0](aSelector);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1F40C9A70](aBlock);
}

void _Block_release(const void *aBlock)
{
}

uint64_t _HKInitializeLogging()
{
  return MEMORY[0x1F40E81B8]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_strtod_clocale()
{
  return MEMORY[0x1F4186398]();
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void free(void *a1)
{
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1F40CCB10](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1F40CCB80](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD10](__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1F4181640](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F4181798](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1F41817B0]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1F41817B8]();
}

uint64_t self
{
  return MEMORY[0x1F41817D0]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C8](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x1F41863D0]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1F41863E8]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x1F4186410]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x1F4186418]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x1F4186420]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x1F4186428]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x1F4186430]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1F4186440]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x1F4186448]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1F4186450]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x1F4186458]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x1F4186488]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1F41864B8]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x1F4186518]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x1F4186528]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x1F4186530]();
}

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x1F4186538]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x1F4186540]();
}

uint64_t swift_getExistentialTypeMetadata()
{
  return MEMORY[0x1F4186590]();
}

uint64_t swift_getFunctionTypeMetadata()
{
  return MEMORY[0x1F41865B8]();
}

uint64_t swift_getMetatypeMetadata()
{
  return MEMORY[0x1F41865F0]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x1F41865F8]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1F4186608]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1F4186610]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x1F4186628]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x1F4186650]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1F4186680]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x1F41866A8]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x1F41866B8]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1F4186700]();
}

uint64_t swift_once()
{
  return MEMORY[0x1F4186728]();
}

uint64_t swift_release()
{
  return MEMORY[0x1F4186758]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1F4186770]();
}

uint64_t swift_setDeallocating()
{
  return MEMORY[0x1F4186790]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1F4186798]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x1F41867A0]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1F41867E0]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1F41867F0]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x1F4186840]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x1F4186858]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x1F4186860]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x1F41868E0]();
}