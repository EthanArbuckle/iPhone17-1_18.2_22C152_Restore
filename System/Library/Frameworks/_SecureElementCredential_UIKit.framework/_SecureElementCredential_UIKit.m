uint64_t CredentialSession.performTransaction(using:over:options:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;

  v4[7] = a3;
  v4[8] = v3;
  v4[5] = a1;
  v4[6] = a2;
  sub_2466FAB18();
  sub_2466F7F68();
  v6 = sub_2466FAB78();
  v4[9] = v6;
  v4[10] = v5;
  return MEMORY[0x270FA2498](sub_2466F7904, v6, v5);
}

uint64_t sub_2466F7904()
{
  v1 = (void *)v0[6];
  type metadata accessor for SESCAMPrivateUIScene();
  uint64_t v2 = swift_dynamicCastClass();
  v0[11] = v2;
  if (v2)
  {
    v0[12] = OBJC_IVAR____TtC30_SecureElementCredential_UIKit20SESCAMPrivateUIScene_magicString;
    sub_2466FAB98();
    id v3 = v1;
    v0[13] = sub_2466FAB88();
    uint64_t v4 = sub_2466FAB78();
    uint64_t v6 = v5;
    v7 = sub_2466F7A08;
  }
  else
  {
    v0[16] = sub_2466FAB98();
    v0[17] = sub_2466FAB88();
    uint64_t v4 = sub_2466FAB78();
    uint64_t v6 = v8;
    v7 = sub_2466F7B70;
  }
  return MEMORY[0x270FA2498](v7, v4, v6);
}

uint64_t sub_2466F7A08()
{
  uint64_t v1 = v0[12];
  uint64_t v2 = v0[11];
  swift_release();
  id v3 = (void *)(v2 + v1);
  swift_beginAccess();
  v0[14] = *v3;
  v0[15] = v3[1];
  uint64_t v4 = v0[9];
  uint64_t v5 = v0[10];
  swift_bridgeObjectRetain();
  return MEMORY[0x270FA2498](sub_2466F7AB4, v4, v5);
}

uint64_t sub_2466F7AB4()
{
  uint64_t v1 = *(void *)(v0 + 112);
  uint64_t v2 = *(void *)(v0 + 120);
  *(void *)(v0 + 168) = v2;
  id v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 176) = v3;
  *id v3 = v0;
  v3[1] = sub_2466F7DCC;
  uint64_t v4 = *(void *)(v0 + 56);
  uint64_t v5 = *(void *)(v0 + 40);
  return MEMORY[0x270EFD348](v5, v1, v2, v4);
}

uint64_t sub_2466F7B70()
{
  uint64_t v1 = (void *)v0[6];
  swift_release();
  v0[18] = objc_msgSend(v1, sel_session);
  uint64_t v2 = v0[9];
  uint64_t v3 = v0[10];
  return MEMORY[0x270FA2498](sub_2466F7BF4, v2, v3);
}

uint64_t sub_2466F7BF4()
{
  *(void *)(v0 + 152) = sub_2466FAB88();
  uint64_t v2 = sub_2466FAB78();
  return MEMORY[0x270FA2498](sub_2466F7C80, v2, v1);
}

uint64_t sub_2466F7C80()
{
  uint64_t v1 = (void *)v0[18];
  swift_release();
  v0[20] = objc_msgSend(v1, sel_persistentIdentifier);

  uint64_t v2 = v0[9];
  uint64_t v3 = v0[10];
  return MEMORY[0x270FA2498](sub_2466F7D04, v2, v3);
}

uint64_t sub_2466F7D04()
{
  uint64_t v1 = (void *)v0[20];
  uint64_t v2 = sub_2466FAB68();
  uint64_t v4 = v3;

  v0[21] = v4;
  uint64_t v5 = (void *)swift_task_alloc();
  v0[22] = v5;
  *uint64_t v5 = v0;
  v5[1] = sub_2466F7DCC;
  uint64_t v6 = v0[7];
  uint64_t v7 = v0[5];
  return MEMORY[0x270EFD348](v7, v2, v4, v6);
}

uint64_t sub_2466F7DCC()
{
  uint64_t v2 = (void *)*v1;
  v2[23] = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = v2[9];
    uint64_t v4 = v2[10];
    return MEMORY[0x270FA2498](sub_2466F7F04, v3, v4);
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v5 = (uint64_t (*)(void))v2[1];
    return v5();
  }
}

uint64_t sub_2466F7F04()
{
  swift_bridgeObjectRelease();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

unint64_t sub_2466F7F68()
{
  unint64_t result = qword_268F9BA18;
  if (!qword_268F9BA18)
  {
    sub_2466FAB18();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F9BA18);
  }
  return result;
}

uint64_t type metadata accessor for SESCAMPrivateUIScene()
{
  return self;
}

uint64_t CredentialSession.endCardEmulation()()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_2466F8074;
  return MEMORY[0x270EFD350]();
}

uint64_t sub_2466F8074()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t CredentialSession.performCardEmulationTransactionWithCurrentCredential(over:options:)(uint64_t a1, uint64_t a2)
{
  v3[6] = a2;
  v3[7] = v2;
  v3[5] = a1;
  sub_2466FAB18();
  sub_2466F7F68();
  uint64_t v5 = sub_2466FAB78();
  v3[8] = v5;
  v3[9] = v4;
  return MEMORY[0x270FA2498](sub_2466F81F4, v5, v4);
}

uint64_t sub_2466F81F4()
{
  uint64_t v1 = (void *)v0[5];
  type metadata accessor for SESCAMPrivateUIScene();
  uint64_t v2 = swift_dynamicCastClass();
  v0[10] = v2;
  if (v2)
  {
    v0[11] = OBJC_IVAR____TtC30_SecureElementCredential_UIKit20SESCAMPrivateUIScene_magicString;
    sub_2466FAB98();
    id v3 = v1;
    v0[12] = sub_2466FAB88();
    uint64_t v4 = sub_2466FAB78();
    uint64_t v6 = v5;
    uint64_t v7 = sub_2466F82F8;
  }
  else
  {
    v0[15] = sub_2466FAB98();
    v0[16] = sub_2466FAB88();
    uint64_t v4 = sub_2466FAB78();
    uint64_t v6 = v8;
    uint64_t v7 = sub_2466F8458;
  }
  return MEMORY[0x270FA2498](v7, v4, v6);
}

uint64_t sub_2466F82F8()
{
  uint64_t v1 = v0[11];
  uint64_t v2 = v0[10];
  swift_release();
  id v3 = (void *)(v2 + v1);
  swift_beginAccess();
  v0[13] = *v3;
  v0[14] = v3[1];
  uint64_t v4 = v0[8];
  uint64_t v5 = v0[9];
  swift_bridgeObjectRetain();
  return MEMORY[0x270FA2498](sub_2466F83A4, v4, v5);
}

uint64_t sub_2466F83A4()
{
  uint64_t v1 = *(void *)(v0 + 104);
  uint64_t v2 = *(void *)(v0 + 112);
  *(void *)(v0 + 160) = v2;
  id v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 168) = v3;
  *id v3 = v0;
  v3[1] = sub_2466F86AC;
  uint64_t v4 = *(void *)(v0 + 48);
  return MEMORY[0x270EFD330](v1, v2, v4);
}

uint64_t sub_2466F8458()
{
  uint64_t v1 = (void *)v0[5];
  swift_release();
  v0[17] = objc_msgSend(v1, sel_session);
  uint64_t v2 = v0[8];
  uint64_t v3 = v0[9];
  return MEMORY[0x270FA2498](sub_2466F84DC, v2, v3);
}

uint64_t sub_2466F84DC()
{
  *(void *)(v0 + 144) = sub_2466FAB88();
  uint64_t v2 = sub_2466FAB78();
  return MEMORY[0x270FA2498](sub_2466F8568, v2, v1);
}

uint64_t sub_2466F8568()
{
  uint64_t v1 = (void *)v0[17];
  swift_release();
  v0[19] = objc_msgSend(v1, sel_persistentIdentifier);

  uint64_t v2 = v0[8];
  uint64_t v3 = v0[9];
  return MEMORY[0x270FA2498](sub_2466F85EC, v2, v3);
}

uint64_t sub_2466F85EC()
{
  uint64_t v1 = (void *)v0[19];
  uint64_t v2 = sub_2466FAB68();
  uint64_t v4 = v3;

  v0[20] = v4;
  uint64_t v5 = (void *)swift_task_alloc();
  v0[21] = v5;
  *uint64_t v5 = v0;
  v5[1] = sub_2466F86AC;
  uint64_t v6 = v0[6];
  return MEMORY[0x270EFD330](v2, v4, v6);
}

uint64_t sub_2466F86AC()
{
  uint64_t v2 = (void *)*v1;
  v2[22] = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = v2[8];
    uint64_t v4 = v2[9];
    return MEMORY[0x270FA2498](sub_2466F87E4, v3, v4);
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v5 = (uint64_t (*)(void))v2[1];
    return v5();
  }
}

uint64_t sub_2466F87E4()
{
  swift_bridgeObjectRelease();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t CredentialSession.performWiredTransaction(using:over:instanceAID:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5[8] = a4;
  v5[9] = v4;
  v5[6] = a2;
  v5[7] = a3;
  v5[5] = a1;
  sub_2466FAB18();
  sub_2466F7F68();
  uint64_t v7 = sub_2466FAB78();
  v5[10] = v7;
  v5[11] = v6;
  return MEMORY[0x270FA2498](sub_2466F88D8, v7, v6);
}

uint64_t sub_2466F88D8()
{
  uint64_t v1 = (void *)v0[6];
  type metadata accessor for SESCAMPrivateUIScene();
  uint64_t v2 = swift_dynamicCastClass();
  v0[12] = v2;
  if (v2)
  {
    v0[13] = OBJC_IVAR____TtC30_SecureElementCredential_UIKit20SESCAMPrivateUIScene_magicString;
    sub_2466FAB98();
    id v3 = v1;
    v0[14] = sub_2466FAB88();
    uint64_t v4 = sub_2466FAB78();
    uint64_t v6 = v5;
    uint64_t v7 = sub_2466F89DC;
  }
  else
  {
    v0[17] = sub_2466FAB98();
    v0[18] = sub_2466FAB88();
    uint64_t v4 = sub_2466FAB78();
    uint64_t v6 = v8;
    uint64_t v7 = sub_2466F8B48;
  }
  return MEMORY[0x270FA2498](v7, v4, v6);
}

uint64_t sub_2466F89DC()
{
  uint64_t v1 = v0[13];
  uint64_t v2 = v0[12];
  swift_release();
  id v3 = (void *)(v2 + v1);
  swift_beginAccess();
  v0[15] = *v3;
  v0[16] = v3[1];
  uint64_t v4 = v0[10];
  uint64_t v5 = v0[11];
  swift_bridgeObjectRetain();
  return MEMORY[0x270FA2498](sub_2466F8A88, v4, v5);
}

uint64_t sub_2466F8A88()
{
  uint64_t v1 = *(void *)(v0 + 120);
  uint64_t v2 = *(void *)(v0 + 128);
  *(void *)(v0 + 176) = v2;
  id v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 184) = v3;
  *id v3 = v0;
  v3[1] = sub_2466F8DA8;
  uint64_t v4 = *(void *)(v0 + 64);
  uint64_t v5 = *(void *)(v0 + 56);
  uint64_t v6 = *(void *)(v0 + 40);
  return MEMORY[0x270EFD358](v6, v1, v2, v5, v4);
}

uint64_t sub_2466F8B48()
{
  uint64_t v1 = (void *)v0[6];
  swift_release();
  v0[19] = objc_msgSend(v1, sel_session);
  uint64_t v2 = v0[10];
  uint64_t v3 = v0[11];
  return MEMORY[0x270FA2498](sub_2466F8BCC, v2, v3);
}

uint64_t sub_2466F8BCC()
{
  *(void *)(v0 + 160) = sub_2466FAB88();
  uint64_t v2 = sub_2466FAB78();
  return MEMORY[0x270FA2498](sub_2466F8C58, v2, v1);
}

uint64_t sub_2466F8C58()
{
  uint64_t v1 = (void *)v0[19];
  swift_release();
  v0[21] = objc_msgSend(v1, sel_persistentIdentifier);

  uint64_t v2 = v0[10];
  uint64_t v3 = v0[11];
  return MEMORY[0x270FA2498](sub_2466F8CDC, v2, v3);
}

uint64_t sub_2466F8CDC()
{
  uint64_t v1 = (void *)v0[21];
  uint64_t v2 = sub_2466FAB68();
  uint64_t v4 = v3;

  v0[22] = v4;
  uint64_t v5 = (void *)swift_task_alloc();
  v0[23] = v5;
  *uint64_t v5 = v0;
  v5[1] = sub_2466F8DA8;
  uint64_t v6 = v0[8];
  uint64_t v7 = v0[7];
  uint64_t v8 = v0[5];
  return MEMORY[0x270EFD358](v8, v2, v4, v7, v6);
}

uint64_t sub_2466F8DA8()
{
  uint64_t v2 = (void *)*v1;
  v2[24] = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = v2[10];
    uint64_t v4 = v2[11];
    return MEMORY[0x270FA2498](sub_2466F8EE0, v3, v4);
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v5 = (uint64_t (*)(void))v2[1];
    return v5();
  }
}

uint64_t sub_2466F8EE0()
{
  swift_bridgeObjectRelease();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t SESCAMPrivateUIScene.magicString.getter()
{
  uint64_t v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC30_SecureElementCredential_UIKit20SESCAMPrivateUIScene_magicString);
  swift_beginAccess();
  uint64_t v2 = *v1;
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t SESCAMPrivateUIScene.magicString.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)(v2 + OBJC_IVAR____TtC30_SecureElementCredential_UIKit20SESCAMPrivateUIScene_magicString);
  swift_beginAccess();
  *uint64_t v5 = a1;
  v5[1] = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*SESCAMPrivateUIScene.magicString.modify())()
{
  return j__swift_endAccess;
}

id SESCAMPrivateUIScene.__allocating_init(session:connectionOptions:)(void *a1, void *a2)
{
  id v5 = objc_msgSend(objc_allocWithZone(v2), sel_initWithSession_connectionOptions_, a1, a2);

  return v5;
}

id SESCAMPrivateUIScene.init(session:connectionOptions:)(void *a1, void *a2)
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v6 = &v2[OBJC_IVAR____TtC30_SecureElementCredential_UIKit20SESCAMPrivateUIScene_magicString];
  *(void *)uint64_t v6 = 0;
  *((void *)v6 + 1) = 0xE000000000000000;
  v9.receiver = v2;
  v9.super_class = ObjectType;
  id v7 = objc_msgSendSuper2(&v9, sel_initWithSession_connectionOptions_, a1, a2);

  return v7;
}

id SESCAMPrivateUIScene.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t CredentialSessionWindowSceneEvent.description.getter()
{
  if (*v0) {
    return 0xD000000000000016;
  }
  else {
    return 0xD000000000000013;
  }
}

BOOL static CredentialSessionWindowSceneEvent.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t CredentialSessionWindowSceneEvent.hash(into:)()
{
  return sub_2466FAC38();
}

BOOL sub_2466F9354(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_2466F9370()
{
  return sub_2466FAC38();
}

uint64_t sub_2466F93A0()
{
  if (*v0) {
    return 0x61746E6573657270;
  }
  else {
    return 0x6544726564616572;
  }
}

uint64_t sub_2466F93F0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_2466FA7D0(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_2466F9418()
{
  return 0;
}

void sub_2466F9424(unsigned char *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_2466F9430(uint64_t a1)
{
  unint64_t v2 = sub_2466F990C();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2466F946C(uint64_t a1)
{
  unint64_t v2 = sub_2466F990C();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_2466F94A8()
{
  return 0;
}

uint64_t sub_2466F94B4@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = 1;
  return result;
}

void sub_2466F94E4(unsigned char *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_2466F94F0(uint64_t a1)
{
  unint64_t v2 = sub_2466F9960();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2466F952C(uint64_t a1)
{
  unint64_t v2 = sub_2466F9960();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_2466F9568(uint64_t a1)
{
  unint64_t v2 = sub_2466F99B4();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2466F95A4(uint64_t a1)
{
  unint64_t v2 = sub_2466F99B4();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t CredentialSessionWindowSceneEvent.encode(to:)(void *a1)
{
  uint64_t v3 = sub_2466F9884(&qword_268F9BA40);
  uint64_t v19 = *(void *)(v3 - 8);
  uint64_t v20 = v3;
  MEMORY[0x270FA5388]();
  v18 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_2466F9884(&qword_268F9BA48);
  uint64_t v16 = *(void *)(v5 - 8);
  uint64_t v17 = v5;
  MEMORY[0x270FA5388]();
  id v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_2466F9884(&qword_268F9BA50);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388]();
  v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v12 = *v1;
  sub_2466F98C8(a1, a1[3]);
  sub_2466F990C();
  sub_2466FAC68();
  v13 = (uint64_t (**)(char *, uint64_t))(v9 + 8);
  if (v12)
  {
    char v22 = 1;
    sub_2466F9960();
    v14 = v18;
    sub_2466FAC08();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v14, v20);
  }
  else
  {
    char v21 = 0;
    sub_2466F99B4();
    sub_2466FAC08();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v7, v17);
  }
  return (*v13)(v11, v8);
}

uint64_t sub_2466F9884(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

void *sub_2466F98C8(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_2466F990C()
{
  unint64_t result = qword_268F9BA58;
  if (!qword_268F9BA58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F9BA58);
  }
  return result;
}

unint64_t sub_2466F9960()
{
  unint64_t result = qword_268F9BA60;
  if (!qword_268F9BA60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F9BA60);
  }
  return result;
}

unint64_t sub_2466F99B4()
{
  unint64_t result = qword_268F9BA68;
  if (!qword_268F9BA68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F9BA68);
  }
  return result;
}

uint64_t CredentialSessionWindowSceneEvent.hashValue.getter()
{
  return sub_2466FAC48();
}

uint64_t CredentialSessionWindowSceneEvent.init(from:)@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  v31 = a2;
  uint64_t v27 = sub_2466F9884(&qword_268F9BA70);
  uint64_t v30 = *(void *)(v27 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v4 = (char *)v26 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_2466F9884(&qword_268F9BA78);
  uint64_t v28 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388]();
  id v7 = (char *)v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_2466F9884(&qword_268F9BA80);
  uint64_t v29 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v10 = (char *)v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2466F98C8(a1, a1[3]);
  sub_2466F990C();
  v11 = v32;
  sub_2466FAC58();
  if (v11) {
    goto LABEL_6;
  }
  v32 = a1;
  uint64_t v13 = v30;
  char v12 = v31;
  v14 = v10;
  uint64_t v15 = sub_2466FABF8();
  if (*(void *)(v15 + 16) != 1)
  {
    uint64_t v20 = sub_2466FABC8();
    swift_allocError();
    char v22 = v21;
    sub_2466F9884(&qword_268F9BA88);
    *char v22 = &type metadata for CredentialSessionWindowSceneEvent;
    sub_2466FABE8();
    sub_2466FABB8();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v20 - 8) + 104))(v22, *MEMORY[0x263F8DCB0], v20);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v29 + 8))(v10, v8);
    a1 = v32;
LABEL_6:
    uint64_t v23 = (uint64_t)a1;
    return sub_2466F9F34(v23);
  }
  v26[1] = v15;
  char v16 = *(unsigned char *)(v15 + 32);
  if (v16)
  {
    char v17 = *(unsigned char *)(v15 + 32);
    char v34 = 1;
    sub_2466F9960();
    v18 = v14;
    sub_2466FABD8();
    uint64_t v19 = v29;
    (*(void (**)(char *, uint64_t))(v13 + 8))(v4, v27);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v18, v8);
    char v16 = v17;
  }
  else
  {
    char v33 = 0;
    sub_2466F99B4();
    sub_2466FABD8();
    uint64_t v25 = v29;
    (*(void (**)(char *, uint64_t))(v28 + 8))(v7, v5);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v25 + 8))(v14, v8);
  }
  *char v12 = v16;
  uint64_t v23 = (uint64_t)v32;
  return sub_2466F9F34(v23);
}

uint64_t sub_2466F9EA8()
{
  return sub_2466FAC48();
}

uint64_t sub_2466F9EF0()
{
  return sub_2466FAC48();
}

uint64_t sub_2466F9F34(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_2466F9F84@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  return CredentialSessionWindowSceneEvent.init(from:)(a1, a2);
}

uint64_t sub_2466F9F9C(void *a1)
{
  return CredentialSessionWindowSceneEvent.encode(to:)(a1);
}

unint64_t sub_2466F9FB4()
{
  if (*v0) {
    return 0xD000000000000016;
  }
  else {
    return 0xD000000000000013;
  }
}

uint64_t UISceneConnectionOptions.credentialSessionEvent.getter()
{
  unint64_t v0 = sub_2466FA044();

  return MEMORY[0x270F82700](&type metadata for CredentialSessionEventSceneConnectionOptionDefinition, &type metadata for CredentialSessionEventSceneConnectionOptionDefinition, &type metadata for CredentialSessionWindowSceneEvent, v0);
}

unint64_t sub_2466FA044()
{
  unint64_t result = qword_268F9BA90;
  if (!qword_268F9BA90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F9BA90);
  }
  return result;
}

uint64_t (*sub_2466FA098())@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  return sub_2466FA0B4;
}

uint64_t sub_2466FA0B4@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  sub_2466FA970(a1, (uint64_t)v5);
  uint64_t v3 = swift_allocObject();
  sub_2466FAA0C(v5, v3 + 16);
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = sub_2466FAA24;
  *(void *)(result + 24) = v3;
  *a2 = sub_2466FAA9C;
  a2[1] = result;
  return result;
}

uint64_t sub_2466FA144(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v1 = a1[1];
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = v2;
  *(void *)(v3 + 24) = v1;
  swift_retain();
  sub_2466FAB48();

  return swift_release();
}

uint64_t CredentialSessionWindowSceneEvent.asBSAction()()
{
  return sub_2466FAB28();
}

unint64_t sub_2466FA24C()
{
  unint64_t result = qword_268F9BA98;
  if (!qword_268F9BA98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F9BA98);
  }
  return result;
}

unsigned char *initializeBufferWithCopyOfBuffer for CredentialSessionWindowSceneEvent(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

ValueMetadata *type metadata accessor for CredentialSessionWindowSceneEvent()
{
  return &type metadata for CredentialSessionWindowSceneEvent;
}

uint64_t dispatch thunk of CredentialSessionWindowSceneDelegate.windowScene(_:didReceiveCredentialSessionWindowSceneEvent:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 8))();
}

ValueMetadata *type metadata accessor for CredentialSessionEventSceneConnectionOptionDefinition()
{
  return &type metadata for CredentialSessionEventSceneConnectionOptionDefinition;
}

uint64_t _s30_SecureElementCredential_UIKit33CredentialSessionWindowSceneEventOwet_0(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *_s30_SecureElementCredential_UIKit33CredentialSessionWindowSceneEventOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x2466FA44CLL);
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

uint64_t sub_2466FA474(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_2466FA47C(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for CredentialSessionWindowSceneEvent.CodingKeys()
{
  return &type metadata for CredentialSessionWindowSceneEvent.CodingKeys;
}

ValueMetadata *type metadata accessor for CredentialSessionWindowSceneEvent.ReaderDetectedCodingKeys()
{
  return &type metadata for CredentialSessionWindowSceneEvent.ReaderDetectedCodingKeys;
}

ValueMetadata *type metadata accessor for CredentialSessionWindowSceneEvent.PresentationCodingKeys()
{
  return &type metadata for CredentialSessionWindowSceneEvent.PresentationCodingKeys;
}

unint64_t sub_2466FA4BC()
{
  unint64_t result = qword_268F9BAA0;
  if (!qword_268F9BAA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F9BAA0);
  }
  return result;
}

unint64_t sub_2466FA514()
{
  unint64_t result = qword_268F9BAA8;
  if (!qword_268F9BAA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F9BAA8);
  }
  return result;
}

unint64_t sub_2466FA56C()
{
  unint64_t result = qword_268F9BAB0;
  if (!qword_268F9BAB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F9BAB0);
  }
  return result;
}

unint64_t sub_2466FA5C4()
{
  unint64_t result = qword_268F9BAB8;
  if (!qword_268F9BAB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F9BAB8);
  }
  return result;
}

unint64_t sub_2466FA61C()
{
  unint64_t result = qword_268F9BAC0;
  if (!qword_268F9BAC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F9BAC0);
  }
  return result;
}

unint64_t sub_2466FA674()
{
  unint64_t result = qword_268F9BAC8;
  if (!qword_268F9BAC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F9BAC8);
  }
  return result;
}

unint64_t sub_2466FA6CC()
{
  unint64_t result = qword_268F9BAD0;
  if (!qword_268F9BAD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F9BAD0);
  }
  return result;
}

unint64_t sub_2466FA724()
{
  unint64_t result = qword_268F9BAD8;
  if (!qword_268F9BAD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F9BAD8);
  }
  return result;
}

unint64_t sub_2466FA77C()
{
  unint64_t result = qword_268F9BAE0;
  if (!qword_268F9BAE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F9BAE0);
  }
  return result;
}

uint64_t sub_2466FA7D0(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x6544726564616572 && a2 == 0xEE00646574636574;
  if (v2 || (sub_2466FAC18() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x61746E6573657270 && a2 == 0xEC0000006E6F6974)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_2466FAC18();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_2466FA900()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_2466FA938(uint64_t a1)
{
  BOOL v2 = *(uint64_t (**)(uint64_t *))(v1 + 16);
  uint64_t v4 = a1;
  return v2(&v4);
}

uint64_t sub_2466FA970(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_2466FA9D4()
{
  sub_2466F9F34(v0 + 16);

  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_2466FAA0C(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_2466FAA24(uint64_t a1, char *a2)
{
  char v4 = *a2;
  uint64_t v5 = v2[5];
  uint64_t v6 = v2[6];
  sub_2466F98C8(v2 + 2, v5);
  char v8 = v4;
  return (*(uint64_t (**)(uint64_t, char *, uint64_t, uint64_t))(v6 + 8))(a1, &v8, v5, v6);
}

uint64_t sub_2466FAA9C(void *a1)
{
  return (*(uint64_t (**)(void))(v1 + 16))(*a1);
}

uint64_t sub_2466FAB18()
{
  return MEMORY[0x270EFD370]();
}

uint64_t sub_2466FAB28()
{
  return MEMORY[0x270F82250]();
}

uint64_t sub_2466FAB38()
{
  return MEMORY[0x270F82258]();
}

uint64_t sub_2466FAB48()
{
  return MEMORY[0x270F82260]();
}

uint64_t sub_2466FAB58()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_2466FAB68()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_2466FAB78()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_2466FAB88()
{
  return MEMORY[0x270FA1EA0]();
}

uint64_t sub_2466FAB98()
{
  return MEMORY[0x270FA1EA8]();
}

uint64_t sub_2466FABB8()
{
  return MEMORY[0x270F9EA78]();
}

uint64_t sub_2466FABC8()
{
  return MEMORY[0x270F9EA98]();
}

uint64_t sub_2466FABD8()
{
  return MEMORY[0x270F9F250]();
}

uint64_t sub_2466FABE8()
{
  return MEMORY[0x270F9F258]();
}

uint64_t sub_2466FABF8()
{
  return MEMORY[0x270F9F360]();
}

uint64_t sub_2466FAC08()
{
  return MEMORY[0x270F9F390]();
}

uint64_t sub_2466FAC18()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_2466FAC28()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_2466FAC38()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_2466FAC48()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_2466FAC58()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_2466FAC68()
{
  return MEMORY[0x270F9FD98]();
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t self
{
  return MEMORY[0x270F9A730]();
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

uint64_t swift_allocError()
{
  return MEMORY[0x270FA0190]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
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

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x270FA0268]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x270FA02C0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x270FA03E8]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x270FA0440]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x270FA2450]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x270FA2460]();
}