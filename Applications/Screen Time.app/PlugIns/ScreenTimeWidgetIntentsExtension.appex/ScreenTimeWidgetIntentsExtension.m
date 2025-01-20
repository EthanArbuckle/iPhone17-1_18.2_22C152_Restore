uint64_t variable initialization expression of STSelectUserIntentResponse.code()
{
  return 0;
}

BOOL sub_100003150(unsigned __int16 *a1, unsigned __int16 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_100003164@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100009090();
  *a1 = result;
  a1[1] = v3;
  return result;
}

void sub_100003190(_WORD *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_10000319C()
{
  uint64_t v0 = sub_100009050();
  sub_100004164(v0, qword_100011710);
  sub_100003F6C(v0, (uint64_t)qword_100011710);
  return sub_100009040();
}

id sub_100003310()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for IntentHandler();
  [super dealloc];
}

uint64_t type metadata accessor for IntentHandler()
{
  return self;
}

uint64_t sub_100003368(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

uint64_t sub_100003390(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for XPCPersistentStoreManager();
  v13[3] = v2;
  v13[4] = &off_10000C7B8;
  v13[0] = a1;
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = &_swiftEmptyArrayStorage;
  uint64_t v4 = *sub_100003FE8(v13, v2);
  swift_retain_n();
  swift_retain();
  sub_100004540();
  if (*(unsigned char *)(v4 + 24) != 1) {
    goto LABEL_4;
  }
  id v5 = [*(id *)(v4 + 16) newBackgroundContext];
  [v5 setAutomaticallyMergesChangesFromParent:1];
  [v5 setMergePolicy:NSMergeByPropertyObjectTrumpMergePolicy];
  v6 = (void *)swift_allocObject();
  v6[2] = sub_100004200;
  v6[3] = v3;
  v6[4] = v5;
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = sub_100004268;
  *(void *)(v7 + 24) = v6;
  aBlock[4] = sub_10000425C;
  aBlock[5] = v7;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100003368;
  aBlock[3] = &unk_10000C790;
  v8 = _Block_copy(aBlock);
  swift_retain();
  id v9 = v5;
  swift_retain();
  swift_release();
  [v9 performBlockAndWait:v8];

  _Block_release(v8);
  LOBYTE(v9) = swift_isEscapingClosureAtFileLocation();
  swift_release_n();
  swift_release();
  swift_release();
  if (v9)
  {
    __break(1u);
LABEL_4:
    sub_1000062E8(v3);
    swift_release_n();
  }
  swift_beginAccess();
  uint64_t v10 = *(void *)(v3 + 16);
  swift_bridgeObjectRetain();
  swift_release();
  sub_1000040B4((uint64_t)v13);
  return v10;
}

void *sub_10000361C(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for XPCPersistentStoreManager();
  v21[3] = v2;
  v21[4] = &off_10000C7B8;
  v21[0] = a1;
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = 0;
  *(void *)(v3 + 24) = 0;
  *(void *)(v3 + 32) = 0;
  *(_WORD *)(v3 + 40) = 0;
  uint64_t v4 = *sub_100003FE8(v21, v2);
  swift_retain_n();
  swift_retain();
  sub_100004540();
  if (*(unsigned char *)(v4 + 24) != 1) {
    goto LABEL_4;
  }
  id v5 = [*(id *)(v4 + 16) newBackgroundContext];
  [v5 setAutomaticallyMergesChangesFromParent:1];
  [v5 setMergePolicy:NSMergeByPropertyObjectTrumpMergePolicy];
  v6 = (void *)swift_allocObject();
  v6[2] = sub_10000402C;
  v6[3] = v3;
  v6[4] = v5;
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = sub_100004108;
  *(void *)(v7 + 24) = v6;
  v20[4] = sub_100004124;
  v20[5] = v7;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 1107296256;
  v20[2] = sub_100003368;
  v20[3] = &unk_10000C6F0;
  v8 = _Block_copy(v20);
  swift_retain();
  id v9 = v5;
  swift_retain();
  swift_release();
  [v9 performBlockAndWait:v8];

  _Block_release(v8);
  LOBYTE(v9) = swift_isEscapingClosureAtFileLocation();
  swift_release_n();
  swift_release();
  swift_release();
  if (v9)
  {
    __break(1u);
LABEL_4:
    id v10 = sub_100005AC8();
    uint64_t v12 = v11;
    uint64_t v14 = v13;
    __int16 v16 = v15;
    swift_beginAccess();
    v17 = *(void **)(v3 + 16);
    *(void *)(v3 + 16) = v10;
    *(void *)(v3 + 24) = v12;
    *(void *)(v3 + 32) = v14;
    *(_WORD *)(v3 + 40) = v16;
    sub_100004034(v17);
    swift_release_n();
  }
  swift_beginAccess();
  v18 = *(void **)(v3 + 16);
  sub_100004074(v18);
  swift_release();
  sub_1000040B4((uint64_t)v21);
  return v18;
}

id sub_100003904(void *a1, uint64_t a2, uint64_t a3, char a4)
{
  BOOL v6 = a2 == 1701736270 && a3 == 0xE400000000000000;
  if (v6 || (sub_100009240() & 1) != 0)
  {
    uint64_t v7 = (objc_class *)[self mainBundle];
    v16._countAndFlagsBits = 0xE000000000000000;
    v17._object = (void *)0x800000010000A7E0;
    v17._countAndFlagsBits = 0xD000000000000016;
    v18.value._countAndFlagsBits = 0;
    v18.value._object = 0;
    v8.super.isa = v7;
    v19._countAndFlagsBits = 0;
    v19._object = (void *)0xE000000000000000;
    sub_100008FA0(v17, v18, v8, v19, v16);
  }
  else
  {
    swift_bridgeObjectRetain();
  }
  type metadata accessor for STUser();
  id v9 = [a1 stringValue];
  sub_100009090();

  id v10 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  NSString v11 = sub_100009080();
  swift_bridgeObjectRelease();
  NSString v12 = sub_100009080();
  swift_bridgeObjectRelease();
  id v13 = [v10 initWithIdentifier:v11 displayString:v12];

  id v14 = [objc_allocWithZone((Class)NSNumber) initWithBool:a4 & 1];
  [v13 setIsRemote:v14];

  return v13;
}

void *sub_100003AD8(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t result = &_swiftEmptyArrayStorage;
  if (v2)
  {
    sub_1000091C0();
    uint64_t v4 = (char *)(a1 + 57);
    do
    {
      id v5 = *(void **)(v4 - 25);
      uint64_t v6 = *(void *)(v4 - 17);
      uint64_t v7 = *(void *)(v4 - 9);
      char v8 = *v4;
      v4 += 32;
      id v9 = v5;
      swift_bridgeObjectRetain();
      sub_100003904(v9, v6, v7, v8);
      swift_bridgeObjectRelease();

      sub_1000091A0();
      sub_1000091D0();
      sub_1000091E0();
      sub_1000091B0();
      --v2;
    }
    while (v2);
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void sub_100003BC0(void *a1, uint64_t a2)
{
  if (qword_1000116F0 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_100009050();
  sub_100003F6C(v4, (uint64_t)qword_100011710);
  id v5 = sub_100009030();
  os_log_type_t v6 = sub_100009120();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "provide user options collection", v7, 2u);
    swift_slowDealloc();
  }

  if (qword_100011700 != -1) {
    swift_once();
  }
  uint64_t v8 = swift_retain();
  uint64_t v9 = sub_100003390(v8);
  swift_release();
  id v10 = a1;
  sub_100003AD8(v9);
  swift_bridgeObjectRelease();

  id v11 = objc_allocWithZone((Class)INObjectCollection);
  type metadata accessor for STUser();
  Class isa = sub_1000090B0().super.isa;
  swift_bridgeObjectRelease();
  id v13 = [v11 initWithItems:isa];

  (*(void (**)(uint64_t, id, void))(a2 + 16))(a2, v13, 0);
}

id sub_100003D90()
{
  if (qword_1000116F0 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_100009050();
  sub_100003F6C(v0, (uint64_t)qword_100011710);
  v1 = sub_100009030();
  os_log_type_t v2 = sub_100009120();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "get default user for widget. getting local user", v3, 2u);
    swift_slowDealloc();
  }

  if (qword_100011700 != -1) {
    swift_once();
  }
  uint64_t v4 = swift_retain();
  id v5 = sub_10000361C(v4);
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  char v11 = v10;
  swift_release();
  if (v5)
  {
    id v12 = sub_100003904(v5, v7, v9, v11 & 1);
    swift_bridgeObjectRelease();
  }
  else
  {
    id v13 = sub_100009030();
    os_log_type_t v14 = sub_100009110();
    if (os_log_type_enabled(v13, v14))
    {
      __int16 v15 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)__int16 v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, v14, "couldn't fetch local user to use as default user", v15, 2u);
      swift_slowDealloc();
    }

    return 0;
  }
  return v12;
}

uint64_t sub_100003F6C(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_100003FA4()
{
  v1 = *(void **)(v0 + 16);
  if (v1)
  {

    swift_bridgeObjectRelease();
  }

  return _swift_deallocObject(v0, 42, 7);
}

void *sub_100003FE8(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

void *sub_10000402C(uint64_t a1)
{
  return sub_1000052E0(a1, v1);
}

void *sub_100004034(void *result)
{
  if (result)
  {

    return (void *)swift_bridgeObjectRelease();
  }
  return result;
}

void *sub_100004074(void *result)
{
  if (result)
  {
    id v1 = result;
    return (void *)swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_1000040B4(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_100004108()
{
  return sub_100004ABC(*(uint64_t (**)(uint64_t))(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32));
}

uint64_t sub_100004114()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100004124()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_10000414C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10000415C()
{
  return swift_release();
}

uint64_t *sub_100004164(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_1000041C8()
{
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 24, 7);
}

void sub_100004200(uint64_t a1)
{
  sub_1000052D8(a1, v1);
}

uint64_t sub_10000420C()
{
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_10000424C()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000426C()
{
  uint64_t v0 = sub_100009050();
  sub_100004164(v0, qword_100011750);
  sub_100003F6C(v0, (uint64_t)qword_100011750);
  return sub_100009040();
}

uint64_t sub_1000042F0()
{
  type metadata accessor for XPCPersistentStoreManager();
  uint64_t v0 = swift_allocObject();
  uint64_t result = sub_10000432C();
  qword_100011E70 = v0;
  return result;
}

uint64_t sub_10000432C()
{
  uint64_t v1 = v0;
  uint64_t v2 = self;
  id v3 = [v2 managedObjectModel];
  id v4 = objc_allocWithZone((Class)NSPersistentContainer);
  NSString v5 = sub_100009080();
  id v6 = [v4 initWithName:v5 managedObjectModel:v3];

  *(void *)(v1 + 16) = v6;
  *(unsigned char *)(v1 + 24) = 0;
  *(void *)(v1 + 32) = [objc_allocWithZone((Class)type metadata accessor for STWidgetXPCStoreServerEndpointFactory()) init];
  id v7 = [v2 localPersistentXPCStoreDescription];
  uint64_t v8 = sub_100009020();
  v16[3] = v8;
  v16[4] = sub_1000050C8();
  uint64_t v9 = sub_100005120(v16);
  (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v8 - 8) + 104))(v9, enum case for ScreenTimeFeatureFlags.simplifiedAgent(_:), v8);
  LOBYTE(v8) = sub_100009010();
  sub_1000040B4((uint64_t)v16);
  if (v8) {
    [v7 setOption:*(void *)(v1 + 32) forKey:NSXPCStoreServerEndpointFactoryKey];
  }
  char v10 = *(void **)(v1 + 16);
  sub_100005024((uint64_t *)&unk_100011900);
  uint64_t v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = xmmword_100009920;
  *(void *)(v11 + 32) = v7;
  v16[0] = v11;
  sub_1000090D0();
  sub_100005068();
  id v12 = v10;
  id v13 = v7;
  Class isa = sub_1000090B0().super.isa;
  swift_bridgeObjectRelease();
  [v12 setPersistentStoreDescriptions:isa];

  return v1;
}

void sub_100004540()
{
  if ((*(unsigned char *)(v0 + 24) & 1) == 0)
  {
    uint64_t v1 = *(void **)(v0 + 16);
    id v2 = [v1 persistentStoreDescriptions];
    sub_100005068();
    unint64_t v3 = sub_1000090C0();

    if (v3 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v4 = sub_100009220();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v4 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    swift_bridgeObjectRelease();
    if (v4)
    {
      aBlock[4] = sub_1000050A8;
      aBlock[5] = v0;
      aBlock[0] = _NSConcreteStackBlock;
      aBlock[1] = 1107296256;
      aBlock[2] = sub_100004A30;
      aBlock[3] = &unk_10000C7D8;
      NSString v5 = _Block_copy(aBlock);
      swift_retain();
      swift_release();
      [v1 loadPersistentStoresWithCompletionHandler:v5];
      _Block_release(v5);
      if (*(unsigned char *)(v0 + 24) == 1)
      {
        if (qword_1000116F8 != -1) {
          swift_once();
        }
        uint64_t v6 = sub_100009050();
        sub_100003F6C(v6, (uint64_t)qword_100011750);
        id v7 = sub_100009030();
        os_log_type_t v8 = sub_100009120();
        if (os_log_type_enabled(v7, v8))
        {
          uint64_t v9 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v9 = 0;
          _os_log_impl((void *)&_mh_execute_header, v7, v8, "Successfully loaded persistent stores", v9, 2u);
          swift_slowDealloc();
        }
      }
    }
    else
    {
      *(unsigned char *)(v0 + 24) = 0;
      if (qword_1000116F8 != -1) {
        swift_once();
      }
      uint64_t v10 = sub_100009050();
      sub_100003F6C(v10, (uint64_t)qword_100011750);
      oslog = sub_100009030();
      os_log_type_t v11 = sub_100009110();
      if (os_log_type_enabled(oslog, v11))
      {
        id v12 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)id v12 = 0;
        _os_log_impl((void *)&_mh_execute_header, oslog, v11, "No persistent stores available to load", v12, 2u);
        swift_slowDealloc();
      }
    }
  }
}

void sub_100004828(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2)
  {
    *(unsigned char *)(a3 + 24) = 0;
    swift_errorRetain();
    if (qword_1000116F8 != -1) {
      swift_once();
    }
    uint64_t v3 = sub_100009050();
    sub_100003F6C(v3, (uint64_t)qword_100011750);
    swift_errorRetain();
    swift_errorRetain();
    oslog = sub_100009030();
    os_log_type_t v4 = sub_100009110();
    if (os_log_type_enabled(oslog, v4))
    {
      NSString v5 = (uint8_t *)swift_slowAlloc();
      uint64_t v6 = (void *)swift_slowAlloc();
      *(_DWORD *)NSString v5 = 138412290;
      swift_errorRetain();
      uint64_t v8 = _swift_stdlib_bridgeErrorToNSError();
      sub_100009130();
      void *v6 = v8;
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, oslog, v4, "Failed to load persistent store: %@", v5, 0xCu);
      sub_100005024(&qword_1000118E8);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      swift_errorRelease();
    }
    else
    {
      swift_errorRelease();
      swift_errorRelease();
      swift_errorRelease();
    }
  }
  else
  {
    *(unsigned char *)(a3 + 24) = 1;
  }
}

void sub_100004A30(uint64_t a1, void *a2, void *a3)
{
  NSString v5 = *(void (**)(id, void *))(a1 + 32);
  swift_retain();
  id v7 = a2;
  id v6 = a3;
  v5(v7, a3);
  swift_release();
}

uint64_t sub_100004ABC(uint64_t (*a1)(uint64_t), uint64_t a2, uint64_t a3)
{
  return a1(a3);
}

uint64_t sub_100004AEC()
{
  return _swift_deallocClassInstance(v0, 40, 7);
}

uint64_t type metadata accessor for XPCPersistentStoreManager()
{
  return self;
}

id sub_100004B94()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for STWidgetXPCStoreServerEndpointFactory();
  return [super dealloc];
}

uint64_t type metadata accessor for STWidgetXPCStoreServerEndpointFactory()
{
  return self;
}

uint64_t sub_100004BEC(uint64_t result, unsigned char **a2)
{
  objc_super v2 = *a2;
  *objc_super v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_100004BFC(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

unsigned char **sub_100004C38(unsigned char **result, uint64_t a2, uint64_t a3, char a4)
{
  os_log_type_t v4 = *result;
  *os_log_type_t v4 = a4;
  *uint64_t result = v4 + 1;
  return result;
}

void sub_100004C48(uint64_t *a1, void **a2, uint64_t a3, uint64_t (*a4)(void))
{
  id v6 = (void *)a4();
  uint64_t v7 = *a1 + 8;
  sub_100009130();
  *a1 = v7;
  uint64_t v8 = *a2;
  if (*a2)
  {
    void *v8 = v6;
    *a2 = v8 + 1;
  }
  else
  {
  }
}

uint64_t sub_100005024(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_100005068()
{
  unint64_t result = qword_1000118F0;
  if (!qword_1000118F0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1000118F0);
  }
  return result;
}

void sub_1000050A8(uint64_t a1, uint64_t a2)
{
  sub_100004828(a1, a2, v2);
}

uint64_t sub_1000050B0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_1000050C0()
{
  return swift_release();
}

unint64_t sub_1000050C8()
{
  unint64_t result = qword_1000118F8;
  if (!qword_1000118F8)
  {
    sub_100009020();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000118F8);
  }
  return result;
}

uint64_t *sub_100005120(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t sub_100005184()
{
  swift_release();
  swift_release();

  return _swift_deallocClassInstance(v0, 32, 7);
}

uint64_t type metadata accessor for UsageProvider()
{
  return self;
}

uint64_t sub_1000051E8()
{
  sub_1000040B4(v0 + 16);
  sub_1000040B4(v0 + 56);
  sub_1000040B4(v0 + 96);

  return _swift_deallocClassInstance(v0, 136, 7);
}

uint64_t type metadata accessor for CoreDataUsageProvider()
{
  return self;
}

uint64_t sub_100005254()
{
  uint64_t v0 = sub_100009050();
  sub_100004164(v0, qword_100011B90);
  sub_100003F6C(v0, (uint64_t)qword_100011B90);
  return sub_100009040();
}

void sub_1000052D8(uint64_t a1, uint64_t a2)
{
}

void *sub_1000052E0(uint64_t a1, uint64_t a2)
{
  id v3 = sub_100005AC8();
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  __int16 v9 = v8;
  swift_beginAccess();
  uint64_t v10 = *(void **)(a2 + 16);
  *(void *)(a2 + 16) = v3;
  *(void *)(a2 + 24) = v5;
  *(void *)(a2 + 32) = v7;
  *(_WORD *)(a2 + 40) = v9;
  return sub_100004034(v10);
}

char *sub_100005360(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = *((void *)a4 + 3);
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
    uint64_t v8 = *((void *)a4 + 2);
    if (v7 <= v8) {
      uint64_t v9 = *((void *)a4 + 2);
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      sub_100005024(&qword_100011C00);
      uint64_t v10 = (char *)swift_allocObject();
      int64_t v11 = j__malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 1;
      }
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * (v12 >> 5);
      id v13 = v10 + 32;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
      id v13 = (char *)&_swiftEmptyArrayStorage + 32;
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[32 * v8 + 32]) {
          memmove(v13, a4 + 32, 32 * v8);
        }
        *((void *)a4 + 2) = 0;
        goto LABEL_24;
      }
    }
    sub_1000061F4(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_100005470(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_100005544(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_1000072F0((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = &type metadata for _StringGuts;
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_1000072F0((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_1000040B4((uint64_t)v12);
  return v7;
}

uint64_t sub_100005544(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_100009140();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_100005700(a5, a6);
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
  uint64_t v8 = sub_100009190();
  if (!v8)
  {
    sub_1000091F0();
    __break(1u);
LABEL_17:
    uint64_t result = sub_100009230();
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

uint64_t sub_100005700(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_100005798(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_100005978(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_100005978(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_100005798(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_100005910(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_100009170();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_1000091F0();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_1000090A0();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_100009230();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_1000091F0();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_100005910(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return &_swiftEmptyArrayStorage;
  }
  sub_100005024(&qword_100011BF8);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_100005978(char a1, int64_t a2, char a3, char *a4)
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
    sub_100005024(&qword_100011BF8);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v12 = v10 + 32;
  id v13 = a4 + 32;
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
  uint64_t result = sub_100009230();
  __break(1u);
  return result;
}

id sub_100005AC8()
{
  uint64_t v0 = sub_100008FF0();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin();
  unint64_t v3 = (char *)v41 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v4 = [self fetchRequestMatchingLocalUser];
  id v42 = 0;
  id v5 = [v4 execute:&v42];

  id v6 = v42;
  if (!v5)
  {
    id v23 = v42;
    v24 = (void *)sub_100009000();

    swift_willThrow();
    id v42 = v24;
    sub_100005024(&qword_100011BA8);
    sub_100007268(0, &qword_100011BB0);
    swift_dynamicCast();
    v25 = (void *)v41[2];
    if (qword_100011708 != -1) {
      swift_once();
    }
    uint64_t v26 = sub_100009050();
    sub_100003F6C(v26, (uint64_t)qword_100011B90);
    v27 = v25;
    v28 = sub_100009030();
    os_log_type_t v29 = sub_100009110();
    if (os_log_type_enabled(v28, v29))
    {
      v30 = (uint8_t *)swift_slowAlloc();
      v31 = (void *)swift_slowAlloc();
      *(_DWORD *)v30 = 138412290;
      v41[1] = v27;
      v32 = v27;
      sub_100009130();
      void *v31 = v27;

      _os_log_impl((void *)&_mh_execute_header, v28, v29, "Failed to fetch local user: %@", v30, 0xCu);
      sub_100005024(&qword_1000118E8);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      v28 = v27;
    }

    swift_errorRelease();
    return 0;
  }
  sub_100007268(0, &qword_100011BB8);
  unint64_t v7 = sub_1000090C0();
  id v8 = v6;

  if (!(v7 >> 62))
  {
    int64_t v9 = *(void **)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v9) {
      goto LABEL_4;
    }
    goto LABEL_25;
  }
  swift_bridgeObjectRetain();
  int64_t v9 = (void *)sub_100009220();
  swift_bridgeObjectRelease();
  if (!v9)
  {
LABEL_25:
    swift_bridgeObjectRelease();
    if (qword_100011708 != -1) {
      swift_once();
    }
    uint64_t v35 = sub_100009050();
    sub_100003F6C(v35, (uint64_t)qword_100011B90);
    v36 = sub_100009030();
    os_log_type_t v37 = sub_100009110();
    if (os_log_type_enabled(v36, v37))
    {
      v38 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v38 = 0;
      _os_log_impl((void *)&_mh_execute_header, v36, v37, "Fetching local user returned empty results.", v38, 2u);
      swift_slowDealloc();
    }

    return 0;
  }
LABEL_4:
  if ((v7 & 0xC000000000000001) != 0)
  {
    id v10 = (id)sub_100009180();
  }
  else
  {
    if (!*(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      goto LABEL_34;
    }
    id v10 = *(id *)(v7 + 32);
  }
  int64_t v9 = v10;
  swift_bridgeObjectRelease();
  if (qword_100011708 != -1) {
LABEL_34:
  }
    swift_once();
  uint64_t v11 = sub_100009050();
  sub_100003F6C(v11, (uint64_t)qword_100011B90);
  uint64_t v12 = sub_100009030();
  os_log_type_t v13 = sub_100009120();
  if (os_log_type_enabled(v12, v13))
  {
    os_log_type_t v14 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)os_log_type_t v14 = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, v13, "Successfully fetched local user.", v14, 2u);
    swift_slowDealloc();
  }

  sub_100008FE0();
  id v15 = [v9 givenName];
  if (v15)
  {
    Swift::String v16 = v15;
    sub_100009090();

    sub_100008FB0();
    id v17 = [v9 familyName];
    if (v17)
    {
      Swift::String_optional v18 = v17;
      sub_100009090();

      sub_100008FC0();
    }
    Swift::String v19 = sub_100009030();
    os_log_type_t v20 = sub_100009120();
    if (os_log_type_enabled(v19, v20))
    {
      v21 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v21 = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, v20, "Successfully fetched given name of local user.", v21, 2u);
      swift_slowDealloc();
    }

    sub_100008FD0();
    id v22 = [v9 dsid];
  }
  else
  {
    id v22 = [v9 dsid];
    v33 = (objc_class *)[self mainBundle];
    v40._countAndFlagsBits = 0xE000000000000000;
    v43._object = (void *)0x800000010000A7E0;
    v43._countAndFlagsBits = 0xD000000000000016;
    v44.value._countAndFlagsBits = 0;
    v44.value._object = 0;
    v34.super.Class isa = v33;
    v45._countAndFlagsBits = 0;
    v45._object = (void *)0xE000000000000000;
    sub_100008FA0(v43, v44, v34, v45, v40);
  }
  [v9 isParent];

  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return v22;
}

uint64_t sub_1000061F4(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  uint64_t result = sub_100009230();
  __break(1u);
  return result;
}

void sub_1000062E8(uint64_t a1)
{
  uint64_t v2 = sub_100008FF0();
  unint64_t v3 = *(NSObject **)(v2 - 8);
  __chkstk_darwin();
  unint64_t v5 = (char *)v106 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v6 = sub_100005AC8();
  uint64_t v121 = v9;
  if (!v6)
  {
    if (qword_100011708 != -1) {
      goto LABEL_79;
    }
    goto LABEL_61;
  }
  uint64_t v111 = v7;
  v113 = v6;
  id v10 = (char **)(a1 + 16);
  v112 = (char **)(a1 + 16);
  if ((v8 & 1) == 0) {
    goto LABEL_82;
  }
  os_log_t v128 = v3;
  v117 = v5;
  uint64_t v118 = v2;
  int v107 = v8;
  id v110 = [self fetchRequest];
  sub_100007268(0, &qword_100011BC0);
  sub_100005024(&qword_100011BC8);
  uint64_t v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = xmmword_100009B00;
  *(void *)(v11 + 56) = &type metadata for String;
  unint64_t v12 = sub_100007214();
  *(void *)(v11 + 32) = 0xD000000000000018;
  *(void *)(v11 + 40) = 0x800000010000AC40;
  *(void *)(v11 + 96) = &type metadata for String;
  *(void *)(v11 + 104) = v12;
  *(void *)(v11 + 64) = v12;
  *(void *)(v11 + 72) = 0xD000000000000010;
  *(void *)(v11 + 80) = 0x800000010000AC60;
  sub_100009090();
  NSString v13 = sub_100009080();
  swift_bridgeObjectRelease();
  uint64_t v14 = sub_100007268(0, &qword_100011BD8);
  *(void *)(v11 + 136) = v14;
  uint64_t v15 = sub_1000072A4(&qword_100011BE0, &qword_100011BD8);
  *(void *)(v11 + 112) = v13;
  *(void *)(v11 + 176) = &type metadata for String;
  *(void *)(v11 + 184) = v12;
  *(void *)(v11 + 144) = v15;
  *(void *)(v11 + 152) = 0xD000000000000010;
  *(void *)(v11 + 160) = 0x800000010000AC60;
  sub_100009090();
  NSString v16 = sub_100009080();
  swift_bridgeObjectRelease();
  *(void *)(v11 + 216) = v14;
  *(void *)(v11 + 224) = v15;
  *(void *)(v11 + 192) = v16;
  id v17 = (void *)sub_100009100();
  id v18 = v110;
  [v110 setPredicate:v17];

  v131[0] = 0;
  id v19 = [v18 execute:v131];
  id v20 = v131[0];
  if (!v19)
  {
    id v79 = v131[0];
    v80 = (void *)sub_100009000();

    swift_willThrow();
    v131[0] = v80;
    sub_100005024(&qword_100011BA8);
    sub_100007268(0, &qword_100011BB0);
    swift_dynamicCast();
    v81 = v130;
    if (qword_100011708 != -1) {
      swift_once();
    }
    uint64_t v82 = sub_100009050();
    sub_100003F6C(v82, (uint64_t)qword_100011B90);
    id v83 = v81;
    v84 = sub_100009030();
    os_log_type_t v85 = sub_100009110();
    if (os_log_type_enabled(v84, v85))
    {
      v86 = (uint8_t *)swift_slowAlloc();
      v87 = (void *)swift_slowAlloc();
      *(_DWORD *)v86 = 138412290;
      uint64_t v129 = (uint64_t)v83;
      id v88 = v83;
      sub_100009130();
      void *v87 = v83;

      _os_log_impl((void *)&_mh_execute_header, v84, v85, "Failed to fetch managed users: %@", v86, 0xCu);
      sub_100005024(&qword_1000118E8);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
      swift_bridgeObjectRelease();
    }
    else
    {

      swift_bridgeObjectRelease();
      v84 = v113;
    }

    swift_errorRelease();
    return;
  }
  v21 = v19;
  sub_100007268(0, &qword_100011BB8);
  unint64_t v22 = sub_1000090C0();
  id v23 = v20;

  if (qword_100011708 != -1) {
    swift_once();
  }
  uint64_t v24 = sub_100009050();
  v106[1] = sub_100003F6C(v24, (uint64_t)qword_100011B90);
  v25 = sub_100009030();
  os_log_type_t v26 = sub_100009120();
  BOOL v27 = os_log_type_enabled(v25, v26);
  uint64_t v28 = v118;
  os_log_type_t v29 = v117;
  if (v27)
  {
    v30 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v30 = 0;
    _os_log_impl((void *)&_mh_execute_header, v25, v26, "Successfully fetched managed users.", v30, 2u);
    swift_slowDealloc();
  }

  if (v22 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v31 = sub_100009220();
    swift_bridgeObjectRelease();
    if (v31) {
      goto LABEL_10;
    }
    goto LABEL_81;
  }
  uint64_t v31 = *(void *)((v22 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v31)
  {
LABEL_81:

    swift_bridgeObjectRelease();
    LOWORD(v8) = v107;
    id v10 = v112;
LABEL_82:
    char v97 = BYTE1(v8);
    char v98 = v8 & 1;
    swift_beginAccess();
    v99 = *v10;
    v100 = v113;
    swift_bridgeObjectRetain();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *id v10 = v99;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      v99 = sub_100005360(0, *((void *)v99 + 2) + 1, 1, v99);
      *v112 = v99;
    }
    unint64_t v103 = *((void *)v99 + 2);
    unint64_t v102 = *((void *)v99 + 3);
    if (v103 >= v102 >> 1)
    {
      v99 = sub_100005360((char *)(v102 > 1), v103 + 1, 1, v99);
      *v112 = v99;
    }
    *((void *)v99 + 2) = v103 + 1;
    v104 = &v99[32 * v103];
    uint64_t v105 = v111;
    *((void *)v104 + 4) = v100;
    *((void *)v104 + 5) = v105;
    *((void *)v104 + 6) = v121;
    v104[56] = v98;
    v104[57] = v97 & 1;
    swift_endAccess();
    swift_bridgeObjectRelease();

    return;
  }
LABEL_10:
  unint64_t v32 = 0;
  unint64_t v120 = v22 & 0xC000000000000001;
  uint64_t v109 = v22 & 0xFFFFFFFFFFFFFF8;
  unint64_t v108 = v22 + 32;
  os_log_t v119 = v128 + 1;
  v126 = (char *)&type metadata for Swift.AnyObject + 8;
  unint64_t v115 = v22;
  uint64_t v114 = v31;
  while (1)
  {
    if (v120)
    {
      id v33 = (id)sub_100009180();
    }
    else
    {
      if (v32 >= *(void *)(v109 + 16)) {
        goto LABEL_78;
      }
      id v33 = *(id *)(v108 + 8 * v32);
    }
    NSBundle v34 = v33;
    BOOL v35 = __OFADD__(v32, 1);
    unint64_t v36 = v32 + 1;
    if (v35) {
      goto LABEL_77;
    }
    unint64_t v125 = v36;
    id v37 = [v33 givenName];
    if (!v37)
    {
      swift_bridgeObjectRelease();
      id v89 = [v34 dsid];
      id v90 = [v89 stringValue];

      uint64_t v91 = sub_100009090();
      unint64_t v93 = v92;

      swift_bridgeObjectRetain();
      v94 = sub_100009030();
      os_log_type_t v95 = sub_100009110();
      if (os_log_type_enabled(v94, v95))
      {
        v96 = (uint8_t *)swift_slowAlloc();
        v130 = (void *)swift_slowAlloc();
        *(_DWORD *)v96 = 136380675;
        swift_bridgeObjectRetain();
        uint64_t v129 = sub_100005470(v91, v93, (uint64_t *)&v130);
        sub_100009130();
        swift_bridgeObjectRelease_n();
        _os_log_impl((void *)&_mh_execute_header, v94, v95, "Failed to fetch given name for remote user with dsid: %{private}s", v96, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
        swift_bridgeObjectRelease();
      }
      else
      {

        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease_n();
      }

      return;
    }
    v38 = v37;
    sub_100009090();

    sub_100008FE0();
    sub_100008FB0();
    id v39 = [v34 familyName];
    if (v39)
    {
      Swift::String v40 = v39;
      sub_100009090();

      sub_100008FC0();
    }
    uint64_t v41 = sub_100008FD0();
    uint64_t v43 = v42;
    id v44 = [v34 userDeviceStates];
    if (v44) {
      break;
    }
    swift_bridgeObjectRelease();

LABEL_12:
    ((void (*)(char *, uint64_t))v119->isa)(v29, v28);
    unint64_t v32 = v125;
    if (v125 == v31) {
      goto LABEL_81;
    }
  }
  Swift::String v45 = v44;
  uint64_t v116 = v41;
  uint64_t v123 = v43;
  id v124 = v34;
  uint64_t v46 = sub_100007268(0, &qword_100011BE8);
  sub_1000072A4(&qword_100011BF0, &qword_100011BE8);
  uint64_t v47 = sub_1000090E0();

  uint64_t v127 = v46;
  if ((v47 & 0xC000000000000001) != 0)
  {
    sub_100009150();
    sub_1000090F0();
    uint64_t v47 = (uint64_t)v131[0];
    os_log_t v128 = (os_log_t)v131[1];
    uint64_t v48 = (uint64_t)v131[2];
    id v49 = v131[3];
    unint64_t v50 = (unint64_t)v131[4];
  }
  else
  {
    id v49 = 0;
    uint64_t v51 = -1 << *(unsigned char *)(v47 + 32);
    uint64_t v52 = *(void *)(v47 + 56);
    os_log_t v128 = (os_log_t)(v47 + 56);
    uint64_t v48 = ~v51;
    uint64_t v53 = -v51;
    if (v53 < 64) {
      uint64_t v54 = ~(-1 << v53);
    }
    else {
      uint64_t v54 = -1;
    }
    unint64_t v50 = v54 & v52;
  }
  uint64_t v122 = v48;
  int64_t v55 = (unint64_t)(v48 + 64) >> 6;
  if (v47 < 0) {
    goto LABEL_31;
  }
LABEL_29:
  if (v50)
  {
    uint64_t v56 = (v50 - 1) & v50;
    unint64_t v57 = __clz(__rbit64(v50)) | ((void)v49 << 6);
    v58 = (char *)v49;
    goto LABEL_48;
  }
  int64_t v61 = (int64_t)v49 + 1;
  if (!__OFADD__(v49, 1))
  {
    if (v61 >= v55) {
      goto LABEL_58;
    }
    unint64_t isa = (unint64_t)v128[v61].isa;
    v58 = (char *)v49 + 1;
    if (!isa)
    {
      v58 = (char *)v49 + 2;
      if ((uint64_t)v49 + 2 >= v55) {
        goto LABEL_58;
      }
      unint64_t isa = (unint64_t)v128[(void)v58].isa;
      if (!isa)
      {
        v58 = (char *)v49 + 3;
        if ((uint64_t)v49 + 3 >= v55) {
          goto LABEL_58;
        }
        unint64_t isa = (unint64_t)v128[(void)v58].isa;
        if (!isa)
        {
          v58 = (char *)v49 + 4;
          if ((uint64_t)v49 + 4 >= v55) {
            goto LABEL_58;
          }
          unint64_t isa = (unint64_t)v128[(void)v58].isa;
          if (!isa)
          {
            v63 = (char *)v49 + 5;
            while ((char *)v55 != v63)
            {
              unint64_t isa = (unint64_t)v128[(void)v63++].isa;
              if (isa)
              {
                v58 = v63 - 1;
                goto LABEL_47;
              }
            }
            goto LABEL_58;
          }
        }
      }
    }
LABEL_47:
    uint64_t v56 = (isa - 1) & isa;
    unint64_t v57 = __clz(__rbit64(isa)) + ((void)v58 << 6);
LABEL_48:
    id v60 = *(id *)(*(void *)(v47 + 48) + 8 * v57);
    if (v60)
    {
      while (1)
      {
        id v64 = [v60 device];
        if (!v64) {
          __break(1u);
        }
        v65 = v64;
        unsigned int v66 = [v64 platform];

        if (v66 != 4) {
          break;
        }

        id v49 = v58;
        unint64_t v50 = v56;
        if ((v47 & 0x8000000000000000) == 0) {
          goto LABEL_29;
        }
LABEL_31:
        uint64_t v59 = sub_100009160();
        if (v59)
        {
          uint64_t v129 = v59;
          swift_unknownObjectRetain();
          swift_dynamicCast();
          id v60 = v130;
          swift_unknownObjectRelease();
          v58 = (char *)v49;
          uint64_t v56 = v50;
          if (v60) {
            continue;
          }
        }
        goto LABEL_58;
      }
      id v67 = [v124 dsid];
      v68 = v112;
      swift_beginAccess();
      v69 = *v68;
      char v70 = swift_isUniquelyReferenced_nonNull_native();
      *v68 = v69;
      if ((v70 & 1) == 0)
      {
        v69 = sub_100005360(0, *((void *)v69 + 2) + 1, 1, v69);
        *v68 = v69;
      }
      unint64_t v72 = *((void *)v69 + 2);
      unint64_t v71 = *((void *)v69 + 3);
      if (v72 >= v71 >> 1)
      {
        v69 = sub_100005360((char *)(v71 > 1), v72 + 1, 1, v69);
        *v112 = v69;
      }
      *((void *)v69 + 2) = v72 + 1;
      v73 = &v69[32 * v72];
      uint64_t v74 = v116;
      *((void *)v73 + 4) = v67;
      *((void *)v73 + 5) = v74;
      *((void *)v73 + 6) = v123;
      *((_WORD *)v73 + 28) = 256;
      swift_endAccess();

LABEL_59:
      sub_1000072E8();
      uint64_t v28 = v118;
      os_log_type_t v29 = v117;
      uint64_t v31 = v114;
      goto LABEL_12;
    }
LABEL_58:
    swift_bridgeObjectRelease();
    goto LABEL_59;
  }
  __break(1u);
LABEL_77:
  __break(1u);
LABEL_78:
  __break(1u);
LABEL_79:
  swift_once();
LABEL_61:
  uint64_t v75 = sub_100009050();
  sub_100003F6C(v75, (uint64_t)qword_100011B90);
  os_log_t v128 = (os_log_t)sub_100009030();
  os_log_type_t v76 = sub_100009110();
  if (os_log_type_enabled(v128, v76))
  {
    v77 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v77 = 0;
    _os_log_impl((void *)&_mh_execute_header, v128, v76, "couldn't fetch local user", v77, 2u);
    swift_slowDealloc();
  }
  os_log_t v78 = v128;
}

unint64_t sub_100007214()
{
  unint64_t result = qword_100011BD0;
  if (!qword_100011BD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100011BD0);
  }
  return result;
}

uint64_t sub_100007268(uint64_t a1, unint64_t *a2)
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

uint64_t sub_1000072A4(unint64_t *a1, unint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100007268(255, a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1000072E8()
{
  return swift_release();
}

uint64_t sub_1000072F0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t initializeBufferWithCopyOfBuffer for UserDetail(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for UserDetail(id *a1)
{
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for UserDetail(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(_WORD *)(a1 + 24) = *(_WORD *)(a2 + 24);
  id v5 = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for UserDetail(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a2;
  id v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(unsigned char *)(a1 + 25) = *(unsigned char *)(a2 + 25);
  return a1;
}

__n128 initializeWithTake for UserDetail(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  *(_OWORD *)(a1 + 10) = *(_OWORD *)(a2 + 10);
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for UserDetail(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a1;
  *(void *)a1 = *(void *)a2;

  uint64_t v5 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v5;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(unsigned char *)(a1 + 25) = *(unsigned char *)(a2 + 25);
  return a1;
}

uint64_t getEnumTagSinglePayload for UserDetail(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 26)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for UserDetail(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(_WORD *)(result + 24) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 26) = 1;
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
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 26) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for UserDetail()
{
  return &type metadata for UserDetail;
}

uint64_t sub_100007584()
{
  sub_1000040B4(v0 + 16);
  sub_1000040B4(v0 + 72);
  sub_1000040B4(v0 + 112);

  return _swift_deallocClassInstance(v0, 152, 7);
}

uint64_t type metadata accessor for DeviceActivityUsageProvider()
{
  return self;
}

id STSelectUserIntent.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return [v1 init];
}

id STSelectUserIntent.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for STSelectUserIntent();
  return [super init];
}

uint64_t type metadata accessor for STSelectUserIntent()
{
  return self;
}

id STUser.__allocating_init(coder:)(void *a1)
{
  id v3 = [objc_allocWithZone(v1) initWithCoder:a1];

  return v3;
}

id STSelectUserIntent.init(coder:)(void *a1)
{
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for STSelectUserIntent();
  id v3 = [super initWithCoder:a1];

  return v3;
}

id STSelectUserIntent.__allocating_init(identifier:backingStore:)(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = v3;
  if (a2)
  {
    NSString v6 = sub_100009080();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v6 = 0;
  }
  id v7 = [objc_allocWithZone(v4) initWithIdentifier:v6 backingStore:a3];

  return v7;
}

id STSelectUserIntent.init(identifier:backingStore:)(uint64_t a1, uint64_t a2, void *a3)
{
  if (a2)
  {
    NSString v5 = sub_100009080();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v5 = 0;
  }
  v8.receiver = v3;
  v8.super_class = (Class)type metadata accessor for STSelectUserIntent();
  [super initWithIdentifier:v5 backingStore:a3];

  return v6;
}

id STSelectUserIntent.__allocating_init(domain:verb:parametersByName:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  NSString v7 = sub_100009080();
  swift_bridgeObjectRelease();
  NSString v8 = sub_100009080();
  swift_bridgeObjectRelease();
  if (a5)
  {
    v9.super.unint64_t isa = sub_100009060().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v9.super.unint64_t isa = 0;
  }
  id v10 = [objc_allocWithZone(v5) initWithDomain:v7 verb:v8 parametersByName:v9.super.isa];

  return v10;
}

id STSelectUserIntent.init(domain:verb:parametersByName:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  NSString v7 = sub_100009080();
  swift_bridgeObjectRelease();
  NSString v8 = sub_100009080();
  swift_bridgeObjectRelease();
  if (a5)
  {
    v9.super.unint64_t isa = sub_100009060().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v9.super.unint64_t isa = 0;
  }
  v12.receiver = v5;
  v12.super_class = (Class)type metadata accessor for STSelectUserIntent();
  id v10 = [v12 initWithDomain:v7 verb:v8 parametersByName:v9.super.isa];

  return v10;
}

id STSelectUserIntent.__deallocating_deinit()
{
  return sub_100008390(type metadata accessor for STSelectUserIntent);
}

unint64_t STSelectUserIntentResponseCode.init(rawValue:)(unint64_t a1)
{
  return sub_1000083C8(a1);
}

BOOL sub_100007C4C(void *a1, void *a2)
{
  return *a1 == *a2;
}

Swift::Int sub_100007C60()
{
  Swift::UInt v1 = *v0;
  sub_100009260();
  sub_100009270(v1);
  return sub_100009280();
}

void sub_100007CA8()
{
  sub_100009270(*v0);
}

Swift::Int sub_100007CD4()
{
  Swift::UInt v1 = *v0;
  sub_100009260();
  sub_100009270(v1);
  return sub_100009280();
}

unint64_t sub_100007D18@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result = sub_1000083C8(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

void sub_100007D4C(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t STSelectUserIntentResponse.code.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR___STSelectUserIntentResponse_code;
  swift_beginAccess();
  return *(void *)v1;
}

char *STSelectUserIntentResponse.__allocating_init(code:userActivity:)(uint64_t a1, void *a2)
{
  NSString v5 = (char *)[objc_allocWithZone(v2) init];
  id v6 = &v5[OBJC_IVAR___STSelectUserIntentResponse_code];
  swift_beginAccess();
  *(void *)id v6 = a1;
  NSString v7 = v5;
  [v7 setUserActivity:a2];

  return v7;
}

char *STSelectUserIntentResponse.init(code:userActivity:)(uint64_t a1, void *a2)
{
  NSString v5 = (char *)[v2 init];
  id v6 = &v5[OBJC_IVAR___STSelectUserIntentResponse_code];
  swift_beginAccess();
  *(void *)id v6 = a1;
  NSString v7 = v5;
  [v7 setUserActivity:a2];

  return v7;
}

id STSelectUserIntentResponse.init()()
{
  *(void *)&v0[OBJC_IVAR___STSelectUserIntentResponse_code] = 0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for STSelectUserIntentResponse();
  return [super init];
}

id STSelectUserIntentResponse.init(coder:)(void *a1)
{
  *(void *)&v1[OBJC_IVAR___STSelectUserIntentResponse_code] = 0;
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for STSelectUserIntentResponse();
  [super initWithCoder:a1];

  return v3;
}

id STSelectUserIntentResponse.__allocating_init(backingStore:)(void *a1)
{
  id v3 = [objc_allocWithZone(v1) initWithBackingStore:a1];

  return v3;
}

id STSelectUserIntentResponse.init(backingStore:)(void *a1)
{
  *(void *)&v1[OBJC_IVAR___STSelectUserIntentResponse_code] = 0;
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for STSelectUserIntentResponse();
  [super initWithBackingStore:a1];

  return v3;
}

id sub_100008198(char *a1, uint64_t a2, uint64_t a3, SEL *a4)
{
  *(void *)&a1[OBJC_IVAR___STSelectUserIntentResponse_code] = 0;
  v7.receiver = a1;
  v7.super_class = (Class)type metadata accessor for STSelectUserIntentResponse();
  return [super a3];
}

id STSelectUserIntentResponse.__allocating_init(propertiesByName:)(uint64_t a1)
{
  if (a1)
  {
    v2.super.unint64_t isa = sub_100009060().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v2.super.unint64_t isa = 0;
  }
  id v3 = [objc_allocWithZone(v1) initWithPropertiesByName:v2.super.isa];

  return v3;
}

id STSelectUserIntentResponse.init(propertiesByName:)(uint64_t a1)
{
  *(void *)&v1[OBJC_IVAR___STSelectUserIntentResponse_code] = 0;
  if (a1)
  {
    v2.super.unint64_t isa = sub_100009060().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v2.super.unint64_t isa = 0;
  }
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for STSelectUserIntentResponse();
  id v3 = [super initWithPropertiesByName:v2.super.isa];

  if (v3) {
  return v3;
  }
}

id STSelectUserIntentResponse.__deallocating_deinit()
{
  return sub_100008390(type metadata accessor for STSelectUserIntentResponse);
}

id sub_100008390(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  [super dealloc];
}

unint64_t sub_1000083C8(unint64_t result)
{
  if (result > 6) {
    return 0;
  }
  return result;
}

uint64_t type metadata accessor for STSelectUserIntentResponse()
{
  return self;
}

unint64_t sub_100008400()
{
  unint64_t result = qword_100011DC0;
  if (!qword_100011DC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100011DC0);
  }
  return result;
}

uint64_t sub_100008454@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  objc_super v3 = (void *)(*a1 + OBJC_IVAR___STSelectUserIntentResponse_code);
  uint64_t result = swift_beginAccess();
  *a2 = *v3;
  return result;
}

uint64_t sub_1000084A8(uint64_t *a1, void *a2)
{
  uint64_t v2 = *a1;
  objc_super v3 = (void *)(*a2 + OBJC_IVAR___STSelectUserIntentResponse_code);
  uint64_t result = swift_beginAccess();
  *objc_super v3 = v2;
  return result;
}

ValueMetadata *type metadata accessor for STSelectUserIntentResponseCode()
{
  return &type metadata for STSelectUserIntentResponseCode;
}

uint64_t static STUser.supportsSecureCoding.getter()
{
  return 1;
}

id STUser.__allocating_init(identifier:display:pronunciationHint:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (a2)
  {
    NSString v8 = sub_100009080();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v8 = 0;
  }
  NSString v9 = sub_100009080();
  swift_bridgeObjectRelease();
  if (a6)
  {
    NSString v10 = sub_100009080();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v10 = 0;
  }
  id v11 = [objc_allocWithZone(v6) initWithIdentifier:v8 displayString:v9 pronunciationHint:v10];

  return v11;
}

id STUser.init(identifier:display:pronunciationHint:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (a2)
  {
    NSString v8 = sub_100009080();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v8 = 0;
  }
  NSString v9 = sub_100009080();
  swift_bridgeObjectRelease();
  if (a6)
  {
    NSString v10 = sub_100009080();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v10 = 0;
  }
  v13.receiver = v6;
  v13.super_class = (Class)type metadata accessor for STUser();
  [super initWithIdentifier:v8 displayString:v9 pronunciationHint:v10];

  return v11;
}

uint64_t type metadata accessor for STUser()
{
  return self;
}

id STUser.init(coder:)(void *a1)
{
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for STUser();
  [super initWithCoder:a1];

  return v3;
}

id STUser.__deallocating_deinit()
{
  return sub_100008F68(type metadata accessor for STUser);
}

id static STUserResolutionResult.success(with:)(uint64_t a1)
{
  v4.receiver = (id)swift_getObjCClassFromMetadata();
  v4.super_class = (Class)&OBJC_METACLASS___STUserResolutionResult;
  [super successWithResolvedObject:a1];

  return v2;
}

id static STUserResolutionResult.disambiguation(with:)(unint64_t a1)
{
  if (a1 >> 62)
  {
    sub_1000089F0();
    swift_bridgeObjectRetain();
    sub_100009210();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRetain();
    sub_100009250();
    sub_1000089F0();
  }
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  sub_1000089F0();
  Class isa = sub_1000090B0().super.isa;
  swift_bridgeObjectRelease();
  v5.receiver = ObjCClassFromMetadata;
  v5.super_class = (Class)&OBJC_METACLASS___STUserResolutionResult;
  id v3 = [super disambiguationWithObjectsToDisambiguate:isa];

  return v3;
}

unint64_t sub_1000089F0()
{
  unint64_t result = qword_100011E40;
  if (!qword_100011E40)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100011E40);
  }
  return result;
}

id static STUserResolutionResult.confirmationRequired(with:)(uint64_t a1)
{
  v4.receiver = (id)swift_getObjCClassFromMetadata();
  v4.super_class = (Class)&OBJC_METACLASS___STUserResolutionResult;
  [super confirmationRequiredWithObjectToConfirm:a1];

  return v2;
}

void static STUserResolutionResult.success(with:)()
{
}

void static STUserResolutionResult.disambiguation(with:)()
{
}

void static STUserResolutionResult.confirmationRequired(with:)()
{
}

id STUserResolutionResult.__allocating_init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  id v4 = objc_allocWithZone(v2);
  Class isa = sub_100009060().super.isa;
  swift_bridgeObjectRelease();
  id v6 = [v4 initWithJSONDictionary:isa forIntent:a2];

  return v6;
}

id STUserResolutionResult.init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  Class isa = sub_100009060().super.isa;
  swift_bridgeObjectRelease();
  v8.receiver = v2;
  v8.super_class = (Class)type metadata accessor for STUserResolutionResult();
  [super initWithJSONDictionary:isa, a2];

  id v6 = v5;
  if (v6) {

  }
  return v6;
}

uint64_t type metadata accessor for STUserResolutionResult()
{
  return self;
}

id STUserResolutionResult.__deallocating_deinit()
{
  return sub_100008F68(type metadata accessor for STUserResolutionResult);
}

id sub_100008F68(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return [super dealloc];
}

uint64_t sub_100008FA0(Swift::String _, Swift::String_optional tableName, NSBundle bundle, Swift::String value, Swift::String comment)
{
  return NSLocalizedString(_:tableName:bundle:value:comment:)(_, tableName, bundle, value, comment)._countAndFlagsBits;
}

uint64_t sub_100008FB0()
{
  return PersonNameComponents.givenName.setter();
}

uint64_t sub_100008FC0()
{
  return PersonNameComponents.familyName.setter();
}

uint64_t sub_100008FD0()
{
  return PersonNameComponents.formatted()()._countAndFlagsBits;
}

uint64_t sub_100008FE0()
{
  return PersonNameComponents.init()();
}

uint64_t sub_100008FF0()
{
  return type metadata accessor for PersonNameComponents();
}

uint64_t sub_100009000()
{
  return _convertNSErrorToError(_:)();
}

uint64_t sub_100009010()
{
  return isFeatureEnabled(_:)();
}

uint64_t sub_100009020()
{
  return type metadata accessor for ScreenTimeFeatureFlags();
}

uint64_t sub_100009030()
{
  return Logger.logObject.getter();
}

uint64_t sub_100009040()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_100009050()
{
  return type metadata accessor for Logger();
}

NSDictionary sub_100009060()
{
  return Dictionary._bridgeToObjectiveC()();
}

uint64_t sub_100009070()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

NSString sub_100009080()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_100009090()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

Swift::Int sub_1000090A0()
{
  return String.UTF8View._foreignCount()();
}

NSArray sub_1000090B0()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_1000090C0()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_1000090D0()
{
  return specialized Array._endMutation()();
}

uint64_t sub_1000090E0()
{
  return static Set._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_1000090F0()
{
  return Set.Iterator.init(_cocoa:)();
}

uint64_t sub_100009100()
{
  return NSPredicate.init(format:_:)();
}

uint64_t sub_100009110()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_100009120()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_100009130()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_100009140()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_100009150()
{
  return __CocoaSet.makeIterator()();
}

uint64_t sub_100009160()
{
  return __CocoaSet.Iterator.next()();
}

uint64_t sub_100009170()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_100009180()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_100009190()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_1000091A0()
{
  return specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
}

uint64_t sub_1000091B0()
{
  return specialized ContiguousArray._endMutation()();
}

uint64_t sub_1000091C0()
{
  return specialized ContiguousArray.reserveCapacity(_:)();
}

uint64_t sub_1000091D0()
{
  return specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
}

uint64_t sub_1000091E0()
{
  return specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_1000091F0()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_100009200()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_100009210()
{
  return _bridgeCocoaArray<A>(_:)();
}

uint64_t sub_100009220()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_100009230()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t sub_100009240()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_100009250()
{
  return dispatch thunk of __ContiguousArrayStorageBase.staticElementType.getter();
}

uint64_t sub_100009260()
{
  return Hasher.init(_seed:)();
}

void sub_100009270(Swift::UInt a1)
{
}

Swift::Int sub_100009280()
{
  return Hasher._finalize()();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_release(const void *aBlock)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return __swift_stdlib_bridgeErrorToNSError();
}

size_t malloc_size(const void *ptr)
{
  return _malloc_size(ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return [super a2];
}

uint64_t self
{
  return _self;
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t swift_allocBox()
{
  return _swift_allocBox();
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_arrayDestroy()
{
  return _swift_arrayDestroy();
}

uint64_t swift_arrayInitWithCopy()
{
  return _swift_arrayInitWithCopy();
}

uint64_t swift_beginAccess()
{
  return _swift_beginAccess();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return _swift_bridgeObjectRelease_n();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_endAccess()
{
  return _swift_endAccess();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_errorRetain()
{
  return _swift_errorRetain();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return _swift_getObjCClassFromMetadata();
}

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return _swift_isEscapingClosureAtFileLocation();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
}

uint64_t swift_once()
{
  return _swift_once();
}

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_release_n()
{
  return _swift_release_n();
}

uint64_t swift_retain()
{
  return _swift_retain();
}

uint64_t swift_retain_n()
{
  return _swift_retain_n();
}

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}

uint64_t swift_slowDealloc()
{
  return _swift_slowDealloc();
}

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}