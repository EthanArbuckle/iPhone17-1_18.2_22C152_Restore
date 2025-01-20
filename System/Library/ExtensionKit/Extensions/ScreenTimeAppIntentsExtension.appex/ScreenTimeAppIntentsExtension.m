void sub_100004BDC(uint64_t a1, unsigned __int8 *a2, uint64_t *a3)
{
  id v5;
  void *v6;
  id v7;
  unsigned __int8 v8;
  id v9;
  uint64_t v10;
  id v11;

  v11 = 0;
  v5 = [self fetchScreenTimeSettingsInContext:a1 error:&v11];
  if (v5)
  {
    v6 = v5;
    v7 = v11;
    v8 = [v6 screenTimeEnabled];

    *a2 = v8;
  }
  else
  {
    v9 = v11;
    v10 = sub_100013A80();

    swift_willThrow();
    *a3 = v10;
    swift_errorRelease();
  }
}

void sub_100004CC8(uint64_t a1, void *a2)
{
  v2 = *(void (**)(void))(a1 + 32);
  id v3 = a2;
  v2();
}

BOOL sub_100004D14(void *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = *v2 & *a2;
  if (v4 != *a2) {
    *v2 |= v3;
  }
  *a1 = v3;
  return v4 != v3;
}

uint64_t sub_100004D44(void *a1)
{
  unsigned __int8 v15 = 0;
  uint64_t v2 = sub_100013B70();
  v17 = (void *)v2;
  unint64_t v18 = sub_100005038();
  uint64_t v3 = sub_100005090((uint64_t *)aBlock);
  (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v2 - 8) + 104))(v3, enum case for ScreenTimeFeatureFlags.simplifiedAgent(_:), v2);
  LOBYTE(v2) = sub_100013B60();
  sub_1000050F4((uint64_t)aBlock);
  if (v2)
  {
    aBlock[0] = 0;
    id v4 = [a1 isScreenTimeEnabledForLocalUserWithError:aBlock];
    unsigned __int8 isEscapingClosureAtFileLocation = aBlock[0];
    if (v4)
    {
      v6 = v4;
      id v7 = aBlock[0];
      unsigned __int8 isEscapingClosureAtFileLocation = [v6 BOOLValue];

      v8 = 0;
      unsigned __int8 v15 = isEscapingClosureAtFileLocation;
LABEL_9:
      sub_1000051AC((uint64_t)v8);
      return isEscapingClosureAtFileLocation & 1;
    }
    id v13 = aBlock[0];
    sub_100013A80();

    swift_willThrow();
  }
  else
  {
    uint64_t v20 = 0;
    id v9 = [self sharedController];
    uint64_t v10 = swift_allocObject();
    *(void *)(v10 + 16) = &v15;
    *(void *)(v10 + 24) = &v20;
    uint64_t v11 = swift_allocObject();
    *(void *)(v11 + 16) = sub_100005154;
    *(void *)(v11 + 24) = v10;
    unint64_t v18 = (unint64_t)sub_10000516C;
    uint64_t v19 = v11;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = (id)1107296256;
    aBlock[2] = sub_100004CC8;
    v17 = &unk_100018FB8;
    v12 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    [v9 performBackgroundTaskAndWait:v12];

    _Block_release(v12);
    unsigned __int8 isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
    swift_release();
    if (isEscapingClosureAtFileLocation) {
      __break(1u);
    }
    if (!v20)
    {
      v8 = sub_100005154;
      unsigned __int8 isEscapingClosureAtFileLocation = v15;
      goto LABEL_9;
    }
    swift_errorRetain();
    swift_willThrow();
    swift_errorRelease();
    swift_release();
  }
  return isEscapingClosureAtFileLocation & 1;
}

unint64_t sub_100005038()
{
  unint64_t result = qword_10001C0B8;
  if (!qword_10001C0B8)
  {
    sub_100013B70();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C0B8);
  }
  return result;
}

uint64_t *sub_100005090(uint64_t *a1)
{
  v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t sub_1000050F4(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_100005144()
{
  return _swift_deallocObject(v0, 32, 7);
}

void sub_100005154(uint64_t a1)
{
  sub_100004BDC(a1, *(unsigned __int8 **)(v1 + 16), *(uint64_t **)(v1 + 24));
}

uint64_t sub_10000515C()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000516C()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_100005194(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_1000051A4()
{
  return swift_release();
}

uint64_t sub_1000051AC(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

void type metadata accessor for STActivityMode()
{
  if (!qword_10001C0C0)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_10001C0C0);
    }
  }
}

uint64_t sub_100005214()
{
  uint64_t v0 = sub_100013810();
  sub_100005278(v0, qword_10001C760);
  sub_1000052DC(v0, (uint64_t)qword_10001C760);
  return sub_1000137F0();
}

uint64_t *sub_100005278(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_1000052DC(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

ValueMetadata *type metadata accessor for ScreenTimeDisabledView()
{
  return &type metadata for ScreenTimeDisabledView;
}

uint64_t sub_100005324()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100005340@<X0>(uint64_t a1@<X8>)
{
  uint64_t v53 = a1;
  uint64_t v1 = sub_100013CF0();
  uint64_t v51 = *(void *)(v1 - 8);
  uint64_t v52 = v1;
  ((void (*)(void))__chkstk_darwin)();
  v50 = (char *)&v38 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100013D70();
  uint64_t v48 = *(void *)(v3 - 8);
  uint64_t v49 = v3;
  ((void (*)(void))__chkstk_darwin)();
  v47 = (char *)&v38 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000059C8(&qword_10001C0C8);
  ((void (*)(void))__chkstk_darwin)();
  v6 = (char *)&v38 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v42 = sub_1000059C8(&qword_10001C0D0);
  uint64_t v7 = *(void *)(v42 - 8);
  uint64_t v8 = ((uint64_t (*)(void))__chkstk_darwin)();
  v39 = (char *)&v38 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  v38 = (char *)&v38 - v10;
  uint64_t v41 = sub_1000059C8(&qword_10001C0D8);
  __chkstk_darwin(v41);
  v12 = (char *)&v38 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_1000059C8(&qword_10001C0E0);
  uint64_t v45 = *(void *)(v13 - 8);
  uint64_t v46 = v13;
  __chkstk_darwin(v13);
  v44 = (char *)&v38 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v40 = sub_1000059C8(&qword_10001C0E8);
  __chkstk_darwin(v40);
  v16 = (char *)&v38 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v43 = sub_1000059C8(&qword_10001C0F0);
  __chkstk_darwin(v43);
  unint64_t v18 = (char *)&v38 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)v12 = sub_100013D30();
  *((void *)v12 + 1) = 0;
  v12[16] = 1;
  sub_100013D20();
  sub_100013AC0();
  uint64_t v19 = sub_100013AD0();
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v19 - 8) + 48))(v6, 1, v19);
  if (result == 1)
  {
    __break(1u);
  }
  else
  {
    v21 = &v12[*(int *)(sub_1000059C8(&qword_10001C0F8) + 44)];
    v22 = v39;
    sub_100013DA0();
    v23 = *(void (**)(char *, char *, uint64_t))(v7 + 32);
    v24 = v38;
    uint64_t v25 = v42;
    v23(v38, v22, v42);
    v23(v21, v24, v25);
    v26 = v47;
    sub_100013D60();
    sub_100005E60(&qword_10001C100, &qword_10001C0D8);
    sub_100005A54();
    v27 = v44;
    uint64_t v28 = v49;
    sub_100013DF0();
    (*(void (**)(char *, uint64_t))(v48 + 8))(v26, v28);
    sub_100005C04((uint64_t)v12, &qword_10001C0D8);
    v30 = v50;
    uint64_t v29 = v51;
    uint64_t v31 = v52;
    (*(void (**)(char *, void, uint64_t))(v51 + 104))(v50, enum case for ControlSize.large(_:), v52);
    uint64_t KeyPath = swift_getKeyPath();
    v33 = (uint64_t *)&v16[*(int *)(v40 + 36)];
    uint64_t v34 = sub_1000059C8(&qword_10001C110);
    (*(void (**)(char *, char *, uint64_t))(v29 + 16))((char *)v33 + *(int *)(v34 + 28), v30, v31);
    uint64_t *v33 = KeyPath;
    uint64_t v36 = v45;
    uint64_t v35 = v46;
    (*(void (**)(char *, char *, uint64_t))(v45 + 16))(v16, v27, v46);
    (*(void (**)(char *, uint64_t))(v29 + 8))(v30, v31);
    (*(void (**)(char *, uint64_t))(v36 + 8))(v27, v35);
    LOBYTE(v35) = sub_100013D80();
    sub_100005B9C((uint64_t)v16, (uint64_t)v18);
    v37 = &v18[*(int *)(v43 + 36)];
    char *v37 = v35;
    *(_OWORD *)(v37 + 8) = 0u;
    *(_OWORD *)(v37 + 24) = 0u;
    v37[40] = 1;
    sub_100005C04((uint64_t)v16, &qword_10001C0E8);
    return sub_100005C60((uint64_t)v18, v53);
  }
  return result;
}

uint64_t sub_1000059A8()
{
  return sub_100013E00();
}

uint64_t sub_1000059C8(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100005A0C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_100005A54()
{
  unint64_t result = qword_10001C108;
  if (!qword_10001C108)
  {
    sub_100013D70();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C108);
  }
  return result;
}

uint64_t sub_100005AAC()
{
  return sub_100013D00();
}

uint64_t sub_100005AD0(uint64_t a1)
{
  uint64_t v2 = sub_100013CF0();
  __chkstk_darwin(v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return sub_100013D10();
}

uint64_t sub_100005B9C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000059C8(&qword_10001C0E8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100005C04(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_1000059C8(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_100005C60(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000059C8(&qword_10001C0F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_100005CCC()
{
  unint64_t result = qword_10001C118;
  if (!qword_10001C118)
  {
    sub_100005A0C(&qword_10001C0F0);
    sub_100005D48();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C118);
  }
  return result;
}

unint64_t sub_100005D48()
{
  unint64_t result = qword_10001C120;
  if (!qword_10001C120)
  {
    sub_100005A0C(&qword_10001C0E8);
    sub_100005A0C(&qword_10001C0D8);
    sub_100013D70();
    sub_100005E60(&qword_10001C100, &qword_10001C0D8);
    sub_100005A54();
    swift_getOpaqueTypeConformance2();
    sub_100005E60(&qword_10001C128, &qword_10001C110);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C120);
  }
  return result;
}

uint64_t sub_100005E60(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100005A0C(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_100005EA8()
{
  unint64_t result = qword_10001C180;
  if (!qword_10001C180)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C180);
  }
  return result;
}

unint64_t sub_100005F00()
{
  unint64_t result = qword_10001C188;
  if (!qword_10001C188)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C188);
  }
  return result;
}

uint64_t sub_100005F54()
{
  return *(void *)(swift_getOpaqueTypeConformance2() + 8);
}

uint64_t sub_100005F88()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100005FA4()
{
  uint64_t v0 = sub_100013CE0();
  sub_100005278(v0, qword_10001C130);
  sub_1000052DC(v0, (uint64_t)qword_10001C130);
  return sub_100013CD0();
}

uint64_t sub_100006028()
{
  uint64_t v0 = sub_100013B50();
  sub_100005278(v0, qword_10001C148);
  sub_1000052DC(v0, (uint64_t)qword_10001C148);
  return sub_100013B40();
}

uint64_t sub_100006074()
{
  uint64_t v0 = sub_100013AB0();
  sub_100005278(v0, qword_10001C778);
  sub_1000052DC(v0, (uint64_t)qword_10001C778);
  return sub_100013A90();
}

uint64_t sub_1000060D8()
{
  uint64_t v0 = sub_1000059C8(&qword_10001C308);
  __chkstk_darwin(v0 - 8);
  uint64_t v1 = sub_1000059C8(&qword_10001C310);
  __chkstk_darwin(v1);
  sub_10000AD7C();
  sub_1000139B0();
  v3._object = (void *)0x8000000100015C90;
  v3._countAndFlagsBits = 0xD000000000000012;
  sub_1000139A0(v3);
  swift_getKeyPath();
  sub_1000059C8(&qword_10001C318);
  sub_100013990();
  swift_release();
  v4._countAndFlagsBits = 0;
  v4._object = (void *)0xE000000000000000;
  sub_1000139A0(v4);
  sub_1000139C0();
  return sub_100013980();
}

uint64_t sub_100006268()
{
  return sub_1000138C0();
}

uint64_t sub_10000628C(uint64_t a1, uint64_t a2)
{
  v2[8] = a1;
  v2[9] = a2;
  uint64_t v3 = sub_100013810();
  v2[10] = v3;
  v2[11] = *(void *)(v3 - 8);
  v2[12] = swift_task_alloc();
  uint64_t v4 = sub_100013BB0();
  v2[13] = v4;
  v2[14] = *(void *)(v4 - 8);
  v2[15] = swift_task_alloc();
  sub_100013F30();
  v2[16] = sub_100013F20();
  uint64_t v6 = sub_100013F10();
  v2[17] = v6;
  v2[18] = v5;
  return _swift_task_switch(sub_1000063DC, v6, v5);
}

uint64_t sub_1000063DC()
{
  id v1 = [objc_allocWithZone((Class)STPrivateServiceClient) init];
  char v2 = sub_100004D44(v1);

  if (v2)
  {
    uint64_t v3 = (void *)swift_task_alloc();
    v0[19] = v3;
    *uint64_t v3 = v0;
    v3[1] = sub_1000065F8;
    uint64_t v4 = v0[15];
    uint64_t v5 = v0[9];
    return sub_100006B44(v4, v5);
  }
  else
  {
    swift_release();
    v0[2] = sub_10000AB6C();
    v0[3] = v7;
    v0[4] = v8;
    if (qword_10001C068 != -1) {
      swift_once();
    }
    sub_1000052DC(v0[10], (uint64_t)qword_10001C760);
    sub_100009804();
    sub_10000B158();
    sub_100013830();
    swift_release();
    swift_release();
    swift_release();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v9 = (uint64_t (*)(void))v0[1];
    return v9();
  }
}

uint64_t sub_1000065F8()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 160) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 144);
  uint64_t v4 = *(void *)(v2 + 136);
  if (v0) {
    uint64_t v5 = sub_100006ACC;
  }
  else {
    uint64_t v5 = sub_100006734;
  }
  return _swift_task_switch(v5, v4, v3);
}

uint64_t sub_100006734()
{
  swift_release();
  id v1 = self;
  sub_100013BA0();
  id v3 = [objc_allocWithZone((Class)NSNumber) initWithDouble:fabs(v2)];
  id v4 = [v1 localizedStringFromNumber:v3 numberStyle:3];

  sub_100013EC0();
  sub_100013BA0();
  if (v5 < 0.05) {
    sub_100013BA0();
  }
  sub_100007884();
  if (qword_10001C090 != -1) {
    swift_once();
  }
  uint64_t v6 = (void *)qword_10001C178;
  sub_100013B90();
  id v7 = objc_msgSend(v6, "stringFromTimeInterval:");
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = v0[12];
    uint64_t v26 = v0[13];
    uint64_t v27 = v0[15];
    uint64_t v10 = v0[9];
    uint64_t v24 = v0[10];
    uint64_t v25 = v0[14];
    uint64_t v23 = v0[11];
    sub_100013EC0();

    uint64_t v11 = sub_10000AB6C();
    uint64_t v13 = v12;
    uint64_t v15 = v14;
    sub_100007A1C(v11, v12, v14, v9);
    v0[5] = v11;
    v0[6] = v13;
    v0[7] = v15;
    uint64_t v16 = swift_task_alloc();
    *(void *)(v16 + 16) = v27;
    *(void *)(v16 + 24) = v10;
    type metadata accessor for ScreenTimeUsageAppIntent.ScreenTimeUsageView();
    sub_100009804();
    sub_10000BF40(&qword_10001C2A0, (void (*)(uint64_t))type metadata accessor for ScreenTimeUsageAppIntent.ScreenTimeUsageView);
    sub_100013840();
    swift_task_dealloc();
    (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v9, v24);
    (*(void (**)(uint64_t, uint64_t))(v25 + 8))(v27, v26);
    swift_release();
    swift_release();
    swift_release();
  }
  else
  {
    uint64_t v19 = v0[14];
    uint64_t v18 = v0[15];
    uint64_t v20 = v0[13];
    sub_10000B1AC();
    swift_allocError();
    unsigned char *v21 = 0;
    swift_willThrow();
    (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v18, v20);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v17 = (uint64_t (*)(void))v0[1];
  return v17();
}

uint64_t sub_100006ACC()
{
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  id v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_100006B44(uint64_t a1, uint64_t a2)
{
  v2[2] = a1;
  v2[3] = a2;
  v2[4] = sub_1000059C8(&qword_10001C2F0);
  v2[5] = swift_task_alloc();
  sub_1000059C8(&qword_10001C2F8);
  v2[6] = swift_task_alloc();
  uint64_t v3 = sub_100013CA0();
  v2[7] = v3;
  v2[8] = *(void *)(v3 - 8);
  v2[9] = swift_task_alloc();
  v2[10] = swift_task_alloc();
  uint64_t v4 = sub_100013C90();
  v2[11] = v4;
  v2[12] = *(void *)(v4 - 8);
  v2[13] = swift_task_alloc();
  uint64_t v5 = sub_100013AF0();
  v2[14] = v5;
  v2[15] = *(void *)(v5 - 8);
  v2[16] = swift_task_alloc();
  sub_1000059C8(&qword_10001C300);
  v2[17] = swift_task_alloc();
  v2[18] = swift_task_alloc();
  v2[19] = swift_task_alloc();
  v2[20] = swift_task_alloc();
  uint64_t v6 = sub_100013A40();
  v2[21] = v6;
  v2[22] = *(void *)(v6 - 8);
  v2[23] = swift_task_alloc();
  v2[24] = swift_task_alloc();
  v2[25] = swift_task_alloc();
  return _swift_task_switch(sub_100006E00, 0, 0);
}

uint64_t sub_100006E00()
{
  if (qword_10001C078 != -1) {
    swift_once();
  }
  uint64_t v1 = *(void *)(v0 + 168);
  uint64_t v2 = *(void *)(v0 + 176);
  uint64_t v3 = *(void *)(v0 + 160);
  uint64_t v5 = *(void *)(v0 + 120);
  uint64_t v4 = *(void *)(v0 + 128);
  uint64_t v6 = *(void *)(v0 + 112);
  uint64_t v7 = sub_100013B50();
  sub_1000052DC(v7, (uint64_t)qword_10001C148);
  sub_100013AE0();
  sub_100013B20();
  uint64_t v8 = *(void (**)(uint64_t, uint64_t))(v5 + 8);
  v8(v4, v6);
  uint64_t v9 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48);
  if (v9(v3, 1, v1) == 1)
  {
    sub_100005C04(*(void *)(v0 + 160), &qword_10001C300);
    sub_10000B1AC();
    swift_allocError();
    *uint64_t v10 = 1;
    swift_willThrow();
LABEL_11:
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v27 = *(uint64_t (**)(void))(v0 + 8);
    return v27();
  }
  uint64_t v35 = *(void (**)(void, void, void))(*(void *)(v0 + 176) + 32);
  v35(*(void *)(v0 + 200), *(void *)(v0 + 160), *(void *)(v0 + 168));
  sub_1000138B0();
  char v11 = *(unsigned char *)(v0 + 224);
  sub_100013AE0();
  if (v11)
  {
    uint64_t v12 = *(void *)(v0 + 128);
    uint64_t v13 = *(void *)(v0 + 112);
    sub_100013B20();
    v8(v12, v13);
  }
  else
  {
    uint64_t v14 = *(void *)(v0 + 176);
    uint64_t v32 = *(void *)(v0 + 168);
    uint64_t v33 = *(void *)(v0 + 152);
    uint64_t v34 = v9;
    uint64_t v15 = *(void *)(v0 + 144);
    uint64_t v16 = *(void *)(v0 + 128);
    uint64_t v17 = *(void *)(v0 + 112);
    sub_100013B30();
    v8(v16, v17);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v14 + 56))(v15, 0, 1, v32);
    uint64_t v18 = v15;
    uint64_t v9 = v34;
    sub_10000BD8C(v18, v33, &qword_10001C300);
  }
  uint64_t v19 = *(void *)(v0 + 168);
  uint64_t v20 = *(void *)(v0 + 136);
  sub_10000B41C(*(void *)(v0 + 152), v20);
  unsigned int v21 = v9(v20, 1, v19);
  uint64_t v22 = *(void *)(v0 + 200);
  if (v21 == 1)
  {
    uint64_t v24 = *(void *)(v0 + 168);
    uint64_t v23 = *(void *)(v0 + 176);
    uint64_t v25 = *(void *)(v0 + 152);
    sub_100005C04(*(void *)(v0 + 136), &qword_10001C300);
    sub_10000B1AC();
    swift_allocError();
    unsigned char *v26 = 2;
    swift_willThrow();
    sub_100005C04(v25, &qword_10001C300);
    (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v22, v24);
    goto LABEL_11;
  }
  v35(*(void *)(v0 + 192), *(void *)(v0 + 136), *(void *)(v0 + 168));
  sub_100013C80();
  sub_100013C60();
  uint64_t v29 = (void *)swift_task_alloc();
  *(void *)(v0 + 208) = v29;
  *uint64_t v29 = v0;
  v29[1] = sub_1000072EC;
  uint64_t v30 = *(void *)(v0 + 200);
  uint64_t v31 = *(void *)(v0 + 80);
  return ModelProvider.addHourlyData(toDataModel:forDateInterval:userAltDSID:deviceIdentifier:)(v31, v30, 0, 0, 0, 0);
}

uint64_t sub_1000072EC()
{
  *(void *)(*(void *)v1 + 216) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_1000076F8;
  }
  else {
    uint64_t v2 = sub_100007400;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_100007400()
{
  uint64_t v1 = v0[23];
  uint64_t v2 = v0[24];
  uint64_t v3 = v0[21];
  uint64_t v4 = v0[22];
  uint64_t v5 = v0[15];
  uint64_t v6 = v0[5];
  uint64_t v23 = v0[14];
  (*(void (**)(void, void, void))(v0[8] + 16))(v0[9], v0[10], v0[7]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v1, v2, v3);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v5 + 56))(v6, 1, 1, v23);
  sub_100013E40();
  sub_100005C04(v6, &qword_10001C2F0);
  sub_100013B80();
  sub_100013BA0();
  if (v7 == 0.0)
  {
    if (qword_10001C070 != -1) {
      swift_once();
    }
    uint64_t v8 = sub_100013CE0();
    sub_1000052DC(v8, (uint64_t)qword_10001C130);
    uint64_t v9 = sub_100013CC0();
    os_log_type_t v10 = sub_100013F40();
    if (os_log_type_enabled(v9, v10))
    {
      char v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)char v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, v10, "Activity usage delta reported as zero. This could be a calculation failure.", v11, 2u);
      swift_slowDealloc();
    }
  }
  uint64_t v13 = v0[24];
  uint64_t v12 = v0[25];
  uint64_t v14 = v0[22];
  uint64_t v15 = v0[21];
  uint64_t v16 = v0[19];
  uint64_t v18 = v0[12];
  uint64_t v17 = v0[13];
  uint64_t v19 = v0[11];
  (*(void (**)(void, void))(v0[8] + 8))(v0[10], v0[7]);
  (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v17, v19);
  uint64_t v20 = *(void (**)(uint64_t, uint64_t))(v14 + 8);
  v20(v13, v15);
  sub_100005C04(v16, &qword_10001C300);
  v20(v12, v15);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  unsigned int v21 = (uint64_t (*)(void))v0[1];
  return v21();
}

uint64_t sub_1000076F8()
{
  uint64_t v1 = v0[24];
  uint64_t v2 = v0[25];
  uint64_t v3 = v0[21];
  uint64_t v4 = v0[22];
  uint64_t v5 = v0[19];
  uint64_t v7 = v0[12];
  uint64_t v6 = v0[13];
  uint64_t v8 = v0[11];
  (*(void (**)(void, void))(v0[8] + 8))(v0[10], v0[7]);
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v6, v8);
  uint64_t v9 = *(void (**)(uint64_t, uint64_t))(v4 + 8);
  v9(v1, v3);
  sub_100005C04(v5, &qword_10001C300);
  v9(v2, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  os_log_type_t v10 = (uint64_t (*)(void))v0[1];
  return v10();
}

uint64_t sub_100007884()
{
  uint64_t v0 = sub_100013B10();
  __chkstk_darwin(v0 - 8);
  uint64_t v1 = sub_100013EB0();
  __chkstk_darwin(v1 - 8);
  sub_100013E60();
  sub_100013B00();
  return sub_100013ED0();
}

uint64_t sub_100007A1C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v8 = sub_100013810();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  char v11 = (char *)&v16[-1] - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100013B70();
  v16[3] = v12;
  v16[4] = sub_10000BF40((unint64_t *)&qword_10001C0B8, (void (*)(uint64_t))&type metadata accessor for ScreenTimeFeatureFlags);
  uint64_t v13 = sub_100005090(v16);
  (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v12 - 8) + 104))(v13, enum case for ScreenTimeFeatureFlags.nlgDialogResponse(_:), v12);
  LOBYTE(v12) = sub_100013B60();
  sub_1000050F4((uint64_t)v16);
  if (v12) {
    return sub_100007DD8();
  }
  sub_1000138B0();
  if (v16[0]) {
    sub_1000086FC(a1, a2, a3, (uint64_t)v11);
  }
  else {
    sub_10000852C();
  }
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v9 + 32))(a4, v11, v8);
}

uint64_t sub_100007C08@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  v18[0] = a2;
  uint64_t v3 = sub_100013BB0();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = __chkstk_darwin(v3);
  uint64_t v7 = (char *)v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v9 = (char *)v18 - v8;
  uint64_t v10 = type metadata accessor for ScreenTimeUsageAppIntent.ScreenTimeUsageView();
  uint64_t v11 = v10 - 8;
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = *(void (**)(char *, uint64_t, uint64_t))(v4 + 16);
  v14(v9, a1, v3);
  sub_1000138B0();
  uint64_t v15 = v19;
  v14(v7, (uint64_t)v9, v3);
  sub_100013E10();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v9, v3);
  uint64_t v16 = *(int *)(v11 + 28);
  v18[1] = v15;
  type metadata accessor for STActivityMode();
  sub_100013E10();
  *(_OWORD *)&v13[v16] = v19;
  return sub_10000B254((uint64_t)v13, v18[0]);
}

uint64_t sub_100007DD8()
{
  uint64_t v0 = sub_1000059C8(&qword_10001C2A8);
  __chkstk_darwin(v0 - 8);
  uint64_t v2 = &v10[-((v1 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v3 = sub_1000059C8(&qword_10001C2B0);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = &v10[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v6 = sub_1000059C8(&qword_10001C2B8);
  __chkstk_darwin(v6 - 8);
  sub_1000138B0();
  uint64_t v7 = sub_100013A00();
  (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v5, 1, 1, v7);
  uint64_t v8 = sub_100013A20();
  (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v2, 1, 1, v8);
  sub_10000AD7C();
  sub_100009804();
  sub_1000137E0();
  return sub_100013800();
}

uint64_t sub_100008054()
{
  uint64_t v0 = sub_1000059C8(&qword_10001C2C0);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  sub_100009024();
  sub_10000B2E4();
  sub_100013910();
  swift_release();
  sub_100009804();
  sub_100005E60(&qword_10001C2D0, &qword_10001C2C0);
  sub_1000138E0();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t sub_1000081AC()
{
  return sub_100013870();
}

uint64_t sub_1000081D0()
{
  uint64_t v0 = sub_1000059C8(&qword_10001C2D8);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  sub_10000AD7C();
  sub_100013940();
  swift_release();
  sub_100005E60(&qword_10001C2E0, &qword_10001C2D8);
  sub_100013930();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t sub_100008318()
{
  uint64_t v0 = sub_1000059C8(&qword_10001C2C0);
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = __chkstk_darwin(v0);
  uint64_t v4 = (char *)&v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v2);
  uint64_t v6 = (char *)&v9 - v5;
  swift_getKeyPath();
  sub_100009024();
  sub_10000B2E4();
  sub_100013910();
  swift_release();
  swift_getKeyPath();
  sub_100013910();
  swift_release();
  sub_100009804();
  sub_100005E60(&qword_10001C2D0, &qword_10001C2C0);
  sub_100013900();
  uint64_t v7 = *(void (**)(char *, uint64_t))(v1 + 8);
  v7(v4, v0);
  return ((uint64_t (*)(char *, uint64_t))v7)(v6, v0);
}

uint64_t sub_1000084E4()
{
  return sub_100013870();
}

uint64_t sub_100008508()
{
  return sub_100013870();
}

uint64_t sub_10000852C()
{
  uint64_t v0 = sub_100013EA0();
  __chkstk_darwin(v0 - 8);
  uint64_t v1 = sub_100013AB0();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = __chkstk_darwin(v1);
  uint64_t v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  uint64_t v7 = (char *)&v9 - v6;
  sub_100013E90();
  v10._object = (void *)0x80000001000158A0;
  v10._countAndFlagsBits = 0xD00000000000001ALL;
  sub_100013E80(v10);
  sub_100013850();
  sub_100013E70(v9);
  swift_bridgeObjectRelease();
  v11._countAndFlagsBits = 46;
  v11._object = (void *)0xE100000000000000;
  sub_100013E80(v11);
  sub_100013AA0();
  (*(void (**)(char *, char *, uint64_t))(v2 + 16))(v5, v7, v1);
  sub_100013820();
  return (*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v7, v1);
}

uint64_t sub_1000086FC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  v31[2] = a3;
  v31[3] = a1;
  uint64_t v33 = a4;
  uint64_t v5 = sub_100013EA0();
  __chkstk_darwin(v5 - 8);
  uint64_t v6 = sub_100013B10();
  __chkstk_darwin(v6 - 8);
  uint64_t v7 = sub_100013EB0();
  __chkstk_darwin(v7 - 8);
  uint64_t v32 = sub_100013AB0();
  uint64_t v8 = *(void *)(v32 - 8);
  uint64_t v9 = __chkstk_darwin(v32);
  Swift::String v11 = (char *)v31 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v13 = (char *)v31 - v12;
  sub_100013850();
  uint64_t countAndFlagsBits = v35._countAndFlagsBits;
  object = v35._object;
  sub_100013E60();
  sub_100013B00();
  if (sub_100013ED0() == countAndFlagsBits && v16 == object)
  {
    swift_bridgeObjectRelease();
    goto LABEL_10;
  }
  v31[1] = a2;
  char v18 = sub_100013FD0();
  swift_bridgeObjectRelease();
  if (v18)
  {
LABEL_10:
    swift_bridgeObjectRelease();
    sub_100013E90();
    v20._uint64_t countAndFlagsBits = 0xD000000000000017;
    unsigned int v21 = "Your Screen Time is up ";
LABEL_13:
    v20._object = (void *)((unint64_t)(v21 - 32) | 0x8000000000000000);
    sub_100013E80(v20);
    sub_100013850();
    sub_100013E70(v35);
    swift_bridgeObjectRelease();
    v36._object = (void *)0x80000001000159F0;
    v36._uint64_t countAndFlagsBits = 0xD000000000000010;
    sub_100013E80(v36);
    sub_100013AA0();
    goto LABEL_14;
  }
  sub_100013E60();
  sub_100013B00();
  if (sub_100013ED0() == countAndFlagsBits && v19 == object)
  {
    swift_bridgeObjectRelease();
LABEL_12:
    swift_bridgeObjectRelease();
    sub_100013E90();
    v20._uint64_t countAndFlagsBits = 0xD000000000000019;
    unsigned int v21 = "Your Screen Time is down ";
    goto LABEL_13;
  }
  char v22 = sub_100013FD0();
  swift_bridgeObjectRelease();
  if (v22) {
    goto LABEL_12;
  }
  sub_100013E60();
  sub_100013B00();
  if (sub_100013ED0() == countAndFlagsBits && v25 == object)
  {
    swift_bridgeObjectRelease_n();
  }
  else
  {
    char v26 = sub_100013FD0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v26 & 1) == 0)
    {
      if (qword_10001C070 != -1) {
        swift_once();
      }
      uint64_t v27 = sub_100013CE0();
      sub_1000052DC(v27, (uint64_t)qword_10001C130);
      swift_retain_n();
      swift_retain_n();
      swift_retain_n();
      uint64_t v28 = sub_100013CC0();
      os_log_type_t v29 = sub_100013F40();
      if (os_log_type_enabled(v28, v29))
      {
        uint64_t v30 = (uint8_t *)swift_slowAlloc();
        v31[0] = swift_slowAlloc();
        uint64_t v34 = v31[0];
        *(_DWORD *)uint64_t v30 = 136315138;
        sub_100013850();
        v35._uint64_t countAndFlagsBits = sub_10000A514(v35._countAndFlagsBits, (unint64_t)v35._object, &v34);
        sub_100013F50();
        swift_release_n();
        swift_release_n();
        swift_release_n();
        swift_bridgeObjectRelease();
        _os_log_impl((void *)&_mh_execute_header, v28, v29, "Unable to detect usage trend for value [%s].", v30, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {

        swift_release_n();
        swift_release_n();
        swift_release_n();
      }
    }
  }
  sub_100013A90();
LABEL_14:
  uint64_t v23 = v32;
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v11, v13, v32);
  sub_100013820();
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v13, v23);
}

uint64_t sub_100008D6C@<X0>(uint64_t a1@<X8>)
{
  if (qword_10001C080 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100013AB0();
  uint64_t v3 = sub_1000052DC(v2, (uint64_t)qword_10001C778);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

uint64_t sub_100008E28(uint64_t a1)
{
  uint64_t v4 = *v1;
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_100008EC8;
  return sub_10000628C(a1, v4);
}

uint64_t sub_100008EC8()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_100008FBC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10000ADD0();
  *a1 = result;
  return result;
}

uint64_t sub_100008FE4(uint64_t a1)
{
  unint64_t v2 = sub_10000AD7C();

  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

unint64_t sub_100009024()
{
  unint64_t result = qword_10001C198;
  if (!qword_10001C198)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C198);
  }
  return result;
}

uint64_t sub_100009078()
{
  uint64_t v0 = sub_100013B10();
  __chkstk_darwin(v0 - 8);
  uint64_t v1 = sub_100013EB0();
  __chkstk_darwin(v1 - 8);
  sub_100013E60();
  sub_100013B00();
  return sub_100013ED0();
}

BOOL sub_1000091C0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

Swift::Int sub_1000091D4()
{
  Swift::UInt v1 = *v0;
  sub_100014020();
  sub_100014030(v1);
  return sub_100014040();
}

void sub_10000921C()
{
  sub_100014030(*v0);
}

Swift::Int sub_100009248()
{
  Swift::UInt v1 = *v0;
  sub_100014020();
  sub_100014030(v1);
  return sub_100014040();
}

uint64_t sub_10000928C()
{
  return sub_100009078();
}

uint64_t sub_1000092B0()
{
  uint64_t v0 = sub_1000059C8(&qword_10001C238);
  __chkstk_darwin(v0 - 8);
  unint64_t v2 = (char *)&v10 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_1000059C8(&qword_10001C240);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100013AB0();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  sub_100013A90();
  sub_100013A90();
  (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v5, 0, 1, v6);
  uint64_t v8 = sub_100013950();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v2, 1, 1, v8);
  sub_1000059C8(&qword_10001C248);
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_100014580;
  sub_100013A90();
  sub_100013A90();
  sub_100013A90();
  sub_100013A90();
  return sub_100013960();
}

uint64_t sub_100009570@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10000AB6C();
  *a1 = result;
  a1[1] = v3;
  a1[2] = v4;
  return result;
}

unint64_t sub_1000095B8()
{
  unint64_t result = qword_10001C1A0;
  if (!qword_10001C1A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C1A0);
  }
  return result;
}

unint64_t sub_100009610()
{
  unint64_t result = qword_10001C1A8;
  if (!qword_10001C1A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C1A8);
  }
  return result;
}

unint64_t sub_100009668()
{
  unint64_t result = qword_10001C1B0;
  if (!qword_10001C1B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C1B0);
  }
  return result;
}

uint64_t sub_1000096BC()
{
  return sub_100005E60(&qword_10001C1B8, &qword_10001C1C0);
}

void *sub_1000096F8()
{
  return &protocol witness table for UUID;
}

uint64_t sub_100009704(uint64_t a1)
{
  unint64_t v2 = sub_100009EC8();

  return static TransientAppEntity.defaultQuery.getter(a1, v2);
}

unint64_t sub_100009754()
{
  unint64_t result = qword_10001C1C8;
  if (!qword_10001C1C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C1C8);
  }
  return result;
}

unint64_t sub_1000097AC()
{
  unint64_t result = qword_10001C1D0;
  if (!qword_10001C1D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C1D0);
  }
  return result;
}

unint64_t sub_100009804()
{
  unint64_t result = qword_10001C1D8;
  if (!qword_10001C1D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C1D8);
  }
  return result;
}

unint64_t sub_10000985C()
{
  unint64_t result = qword_10001C1E0;
  if (!qword_10001C1E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C1E0);
  }
  return result;
}

uint64_t sub_1000098B0()
{
  return sub_10000BF40(&qword_10001C1E8, (void (*)(uint64_t))&type metadata accessor for UUID);
}

uint64_t sub_1000098F8(uint64_t a1)
{
  unint64_t v2 = sub_100009EC8();

  return TransientAppEntity.id.getter(a1, v2);
}

uint64_t sub_100009948()
{
  uint64_t v0 = sub_1000059C8(&qword_10001C240);
  __chkstk_darwin(v0 - 8);
  unint64_t v2 = (char *)&v6 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100013AB0();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  sub_100013A90();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v4 + 56))(v2, 1, 1, v3);
  return sub_100013A10();
}

uint64_t sub_100009A8C()
{
  return sub_100005E60(&qword_10001C1F0, &qword_10001C1F8);
}

uint64_t sub_100009AC8(uint64_t a1)
{
  unint64_t v2 = sub_100009024();

  return static AppEntity.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_100009B18()
{
  unint64_t result = qword_10001C200;
  if (!qword_10001C200)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C200);
  }
  return result;
}

uint64_t sub_100009B70(uint64_t a1)
{
  unint64_t v2 = sub_10000985C();

  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

uint64_t destroy for ScreenTimeUsageAppIntent.ScreenTimeUsageResult()
{
  swift_release();
  swift_release();

  return swift_release();
}

void *_s29ScreenTimeAppIntentsExtension24ScreenTimeUsageAppIntentV21ScreenTimeUsageResultVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

void *assignWithCopy for ScreenTimeUsageAppIntent.ScreenTimeUsageResult(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  a1[2] = a2[2];
  swift_retain();
  swift_release();
  return a1;
}

__n128 initializeWithTake for ScreenTimeUsageAppIntent.ScreenTimeUsageResult(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for ScreenTimeUsageAppIntent.ScreenTimeUsageResult(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for ScreenTimeUsageAppIntent.ScreenTimeUsageResult(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 24)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ScreenTimeUsageAppIntent.ScreenTimeUsageResult(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 24) = 1;
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
    *(unsigned char *)(result + 24) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ScreenTimeUsageAppIntent.ScreenTimeUsageResult()
{
  return &type metadata for ScreenTimeUsageAppIntent.ScreenTimeUsageResult;
}

ValueMetadata *type metadata accessor for ScreenTimeUsageAppIntent()
{
  return &type metadata for ScreenTimeUsageAppIntent;
}

uint64_t sub_100009DD8()
{
  return sub_100005E60(&qword_10001C208, &qword_10001C210);
}

uint64_t sub_100009E14()
{
  return sub_100005E60(&qword_10001C218, &qword_10001C220);
}

uint64_t sub_100009E50()
{
  return sub_100005E60(&qword_10001C228, &qword_10001C220);
}

uint64_t sub_100009E8C()
{
  return sub_100005E60(&qword_10001C230, &qword_10001C220);
}

unint64_t sub_100009EC8()
{
  unint64_t result = qword_10001C250;
  if (!qword_10001C250)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C250);
  }
  return result;
}

uint64_t sub_100009F1C()
{
  uint64_t v0 = sub_1000059C8(&qword_10001C0C8);
  __chkstk_darwin(v0 - 8);
  uint64_t v2 = (char *)&v7 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100013AD0();
  sub_100005278(v3, qword_10001C160);
  uint64_t v4 = sub_1000052DC(v3, (uint64_t)qword_10001C160);
  sub_100013AC0();
  uint64_t v5 = *(void *)(v3 - 8);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v5 + 48))(v2, 1, v3);
  if (result != 1) {
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v5 + 32))(v4, v2, v3);
  }
  __break(1u);
  return result;
}

uint64_t sub_10000A04C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v33 = a1;
  uint64_t v2 = sub_100013AD0();
  uint64_t v31 = *(void *)(v2 - 8);
  uint64_t v32 = v2;
  __chkstk_darwin(v2);
  uint64_t v30 = (char *)&v30 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_1000059C8(&qword_10001C2F0);
  __chkstk_darwin(v4);
  uint64_t v6 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1000059C8(&qword_10001C2F8);
  __chkstk_darwin(v7 - 8);
  uint64_t v8 = sub_100013BB0();
  __chkstk_darwin(v8 - 8);
  uint64_t v9 = sub_100013BD0();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v30 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_1000059C8(&qword_10001C3C8);
  uint64_t v14 = v13 - 8;
  __chkstk_darwin(v13);
  uint64_t v16 = (char *)&v30 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000059C8(&qword_10001C320);
  sub_100013E20();
  long long v34 = *(_OWORD *)(v1 + *(int *)(type metadata accessor for ScreenTimeUsageAppIntent.ScreenTimeUsageView() + 20));
  sub_1000059C8(&qword_10001C3D0);
  sub_100013E20();
  uint64_t v17 = sub_100013AF0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v6, 1, 1, v17);
  sub_100013E40();
  sub_100005C04((uint64_t)v6, &qword_10001C2F0);
  sub_100013BC0();
  char v18 = sub_100013D80();
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v16, v12, v9);
  long long v19 = &v16[*(int *)(v14 + 44)];
  *long long v19 = v18;
  *(_OWORD *)(v19 + 8) = 0u;
  *(_OWORD *)(v19 + 24) = 0u;
  v19[40] = 1;
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  uint64_t v20 = sub_100013E50();
  uint64_t v22 = v21;
  uint64_t v23 = *(int *)(sub_1000059C8(&qword_10001C3D8) + 36);
  if (qword_10001C088 != -1) {
    swift_once();
  }
  uint64_t v25 = v32;
  uint64_t v24 = v33;
  uint64_t v26 = v33 + v23;
  uint64_t v27 = sub_1000052DC(v32, (uint64_t)qword_10001C160);
  (*(void (**)(char *, uint64_t, uint64_t))(v31 + 16))(v30, v27, v25);
  sub_100013D90();
  uint64_t v28 = (uint64_t *)(v26 + *(int *)(sub_1000059C8(&qword_10001C3E0) + 36));
  *uint64_t v28 = v20;
  v28[1] = v22;
  return sub_10000BD8C((uint64_t)v16, v24, &qword_10001C3C8);
}

id sub_10000A4B0()
{
  id v0 = [objc_allocWithZone((Class)NSDateComponentsFormatter) init];
  [v0 setAllowedUnits:96];
  id result = [v0 setUnitsStyle:1];
  qword_10001C178 = (uint64_t)v0;
  return result;
}

uint64_t sub_10000A514(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_10000A5E8(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_10000B3BC((uint64_t)v12, *a3);
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
      sub_10000B3BC((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_1000050F4((uint64_t)v12);
  return v7;
}

uint64_t sub_10000A5E8(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_100013F60();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_10000A7A4(a5, a6);
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
  uint64_t v8 = sub_100013F80();
  if (!v8)
  {
    sub_100013F90();
    __break(1u);
LABEL_17:
    uint64_t result = sub_100013FB0();
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

uint64_t sub_10000A7A4(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_10000A83C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_10000AA1C(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_10000AA1C(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_10000A83C(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_10000A9B4(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_100013F70();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_100013F90();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_100013EF0();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_100013FB0();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_100013F90();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_10000A9B4(uint64_t a1, uint64_t a2)
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
  sub_1000059C8(&qword_10001C2E8);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_10000AA1C(char a1, int64_t a2, char a3, char *a4)
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
    sub_1000059C8(&qword_10001C2E8);
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
  uint64_t v13 = a4 + 32;
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
  uint64_t result = sub_100013FB0();
  __break(1u);
  return result;
}

uint64_t sub_10000AB6C()
{
  uint64_t v0 = sub_100013AB0();
  __chkstk_darwin(v0 - 8);
  sub_1000059C8(&qword_10001C258);
  sub_100013A90();
  uint64_t v1 = sub_100013890();
  swift_retain();
  sub_100013A90();
  sub_100013890();
  swift_retain();
  sub_100013A90();
  sub_100013890();
  swift_retain();
  swift_retain();
  swift_retain();
  sub_100013860();
  swift_release();
  swift_release();
  swift_retain();
  swift_retain();
  swift_retain();
  sub_100013860();
  swift_release();
  swift_release();
  swift_release();
  swift_retain();
  swift_retain();
  swift_retain();
  sub_100013860();
  swift_release_n();
  swift_release_n();
  swift_release_n();
  return v1;
}

unint64_t sub_10000AD7C()
{
  unint64_t result = qword_10001C260;
  if (!qword_10001C260)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C260);
  }
  return result;
}

uint64_t sub_10000ADD0()
{
  uint64_t v17 = sub_1000139D0();
  uint64_t v0 = *(void *)(v17 - 8);
  __chkstk_darwin(v17);
  uint64_t v2 = (char *)&v17 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_1000059C8(&qword_10001C268);
  uint64_t v4 = __chkstk_darwin(v3 - 8);
  unint64_t v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  int64_t v8 = (char *)&v17 - v7;
  uint64_t v9 = sub_1000059C8(&qword_10001C240);
  __chkstk_darwin(v9 - 8);
  size_t v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100013AB0();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  sub_1000059C8(&qword_10001C270);
  sub_100013A90();
  sub_100013A90();
  (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(v11, 0, 1, v12);
  char v18 = 1;
  sub_1000137F0();
  uint64_t v14 = sub_100013810();
  uint64_t v15 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56);
  v15(v8, 0, 1, v14);
  v15(v6, 1, 1, v14);
  (*(void (**)(char *, void, uint64_t))(v0 + 104))(v2, enum case for InputConnectionBehavior.default(_:), v17);
  sub_10000B104();
  return sub_1000138D0();
}

unint64_t sub_10000B104()
{
  unint64_t result = qword_10001C278;
  if (!qword_10001C278)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_10001C278);
  }
  return result;
}

unint64_t sub_10000B158()
{
  unint64_t result = qword_10001C288;
  if (!qword_10001C288)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_10001C288);
  }
  return result;
}

unint64_t sub_10000B1AC()
{
  unint64_t result = qword_10001C298;
  if (!qword_10001C298)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C298);
  }
  return result;
}

uint64_t sub_10000B200@<X0>(uint64_t a1@<X8>)
{
  return sub_100007C08(*(void *)(v1 + 16), a1);
}

uint64_t type metadata accessor for ScreenTimeUsageAppIntent.ScreenTimeUsageView()
{
  uint64_t result = qword_10001C380;
  if (!qword_10001C380) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_10000B254(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ScreenTimeUsageAppIntent.ScreenTimeUsageView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000B2B8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100013870();
  *a1 = result;
  return result;
}

unint64_t sub_10000B2E4()
{
  unint64_t result = qword_10001C2C8;
  if (!qword_10001C2C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C2C8);
  }
  return result;
}

uint64_t sub_10000B338@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1000138C0();
  *a1 = result;
  return result;
}

uint64_t sub_10000B364@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100013870();
  *a1 = result;
  return result;
}

uint64_t sub_10000B390@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100013870();
  *a1 = result;
  return result;
}

uint64_t sub_10000B3BC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_10000B41C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000059C8(&qword_10001C300);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t *sub_10000B484(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v13 = *a2;
    *a1 = *a2;
    uint64_t v4 = (uint64_t *)(v13 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    uint64_t v7 = sub_100013BB0();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(v4, a2, v7);
    uint64_t v8 = sub_1000059C8(&qword_10001C320);
    *(uint64_t *)((char *)v4 + *(int *)(v8 + 28)) = *(uint64_t *)((char *)a2 + *(int *)(v8 + 28));
    uint64_t v9 = *(int *)(a3 + 20);
    uint64_t v10 = (uint64_t *)((char *)v4 + v9);
    size_t v11 = (uint64_t *)((char *)a2 + v9);
    uint64_t v12 = v11[1];
    *uint64_t v10 = *v11;
    v10[1] = v12;
    swift_retain();
  }
  swift_retain();
  return v4;
}

uint64_t sub_10000B578(uint64_t a1)
{
  uint64_t v2 = sub_100013BB0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  sub_1000059C8(&qword_10001C320);
  swift_release();

  return swift_release();
}

uint64_t sub_10000B608(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100013BB0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = sub_1000059C8(&qword_10001C320);
  *(void *)(a1 + *(int *)(v7 + 28)) = *(void *)(a2 + *(int *)(v7 + 28));
  uint64_t v8 = *(int *)(a3 + 20);
  uint64_t v9 = (void *)(a1 + v8);
  uint64_t v10 = (void *)(a2 + v8);
  uint64_t v11 = v10[1];
  *uint64_t v9 = *v10;
  v9[1] = v11;
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t sub_10000B6B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100013BB0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = sub_1000059C8(&qword_10001C320);
  *(void *)(a1 + *(int *)(v7 + 28)) = *(void *)(a2 + *(int *)(v7 + 28));
  swift_retain();
  swift_release();
  uint64_t v8 = *(int *)(a3 + 20);
  uint64_t v9 = (void *)(a1 + v8);
  uint64_t v10 = (void *)(a2 + v8);
  *uint64_t v9 = *v10;
  v9[1] = v10[1];
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_10000B774(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100013BB0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = sub_1000059C8(&qword_10001C320);
  *(void *)(a1 + *(int *)(v7 + 28)) = *(void *)(a2 + *(int *)(v7 + 28));
  *(_OWORD *)(a1 + *(int *)(a3 + 20)) = *(_OWORD *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t sub_10000B808(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100013BB0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = sub_1000059C8(&qword_10001C320);
  *(void *)(a1 + *(int *)(v7 + 28)) = *(void *)(a2 + *(int *)(v7 + 28));
  swift_release();
  uint64_t v8 = *(int *)(a3 + 20);
  uint64_t v9 = (void *)(a1 + v8);
  uint64_t v10 = (uint64_t *)(a2 + v8);
  uint64_t v12 = *v10;
  uint64_t v11 = v10[1];
  *uint64_t v9 = v12;
  v9[1] = v11;
  swift_release();
  return a1;
}

uint64_t sub_10000B8B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10000B8C8);
}

uint64_t sub_10000B8C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1000059C8(&qword_10001C320);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20) + 8);
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    int v11 = v10 - 1;
    if (v11 < 0) {
      int v11 = -1;
    }
    return (v11 + 1);
  }
}

uint64_t sub_10000B99C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10000B9B0);
}

uint64_t sub_10000B9B0(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_1000059C8(&qword_10001C320);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20) + 8) = a2;
  }
  return result;
}

void sub_10000BA74()
{
  sub_10000BB08();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_10000BB08()
{
  if (!qword_10001C390)
  {
    sub_100013BB0();
    unint64_t v0 = sub_100013E30();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_10001C390);
    }
  }
}

unsigned char *initializeBufferWithCopyOfBuffer for QueryRange(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for ScreenTimeUsageAppIntent.Error(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFE) {
    goto LABEL_17;
  }
  if (a2 + 2 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 2) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 2;
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
      return (*a1 | (v4 << 8)) - 2;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 2;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 3;
  int v8 = v6 - 3;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for ScreenTimeUsageAppIntent.Error(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 2 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 2) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFE) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFD)
  {
    unsigned int v6 = ((a2 - 254) >> 8) + 1;
    *uint64_t result = a2 + 2;
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
        JUMPOUT(0x10000BCCCLL);
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
          *uint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

uint64_t sub_10000BCF4(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_10000BCFC(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for ScreenTimeUsageAppIntent.Error()
{
  return &type metadata for ScreenTimeUsageAppIntent.Error;
}

unint64_t sub_10000BD1C()
{
  unint64_t result = qword_10001C3C0;
  if (!qword_10001C3C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C3C0);
  }
  return result;
}

uint64_t sub_10000BD70()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10000BD8C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_1000059C8(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

unint64_t sub_10000BDF4()
{
  unint64_t result = qword_10001C3E8;
  if (!qword_10001C3E8)
  {
    sub_100005A0C(&qword_10001C3D8);
    sub_10000BE94();
    sub_100005E60(&qword_10001C400, &qword_10001C3E0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C3E8);
  }
  return result;
}

unint64_t sub_10000BE94()
{
  unint64_t result = qword_10001C3F0;
  if (!qword_10001C3F0)
  {
    sub_100005A0C(&qword_10001C3C8);
    sub_10000BF40(&qword_10001C3F8, (void (*)(uint64_t))&type metadata accessor for ScreenTimeUsageAppIntentView);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C3F0);
  }
  return result;
}

uint64_t sub_10000BF40(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10000BF88(uint64_t a1)
{
  unint64_t v2 = sub_10000C0D8();

  return AppIntentsExtension.configuration.getter(a1, v2);
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

unint64_t sub_10000C030()
{
  unint64_t result = qword_10001C408;
  if (!qword_10001C408)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C408);
  }
  return result;
}

uint64_t sub_10000C088()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_10000C0D8()
{
  unint64_t result = qword_10001C410;
  if (!qword_10001C410)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C410);
  }
  return result;
}

ValueMetadata *type metadata accessor for ScreenTimeAppIntentsExtension()
{
  return &type metadata for ScreenTimeAppIntentsExtension;
}

uint64_t sub_10000C13C()
{
  uint64_t v0 = sub_1000059C8(&qword_10001C240);
  __chkstk_darwin(v0 - 8);
  unint64_t v2 = (char *)&v6 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100013AB0();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  sub_100013A90();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v4 + 56))(v2, 1, 1, v3);
  return sub_100013A10();
}

unint64_t sub_10000C284()
{
  uint64_t v0 = sub_1000059C8(&qword_10001C238);
  uint64_t v1 = __chkstk_darwin(v0 - 8);
  uint64_t v33 = (char *)v24 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)v24 - v3;
  v24[1] = (char *)v24 - v3;
  uint64_t v5 = sub_1000059C8(&qword_10001C240);
  uint64_t v6 = __chkstk_darwin(v5 - 8);
  Swift::String v35 = (char *)v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)v24 - v8;
  uint64_t v10 = sub_100013AB0();
  uint64_t v29 = v10;
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = __chkstk_darwin(v10);
  uint64_t v31 = (char *)v24 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  uint64_t v27 = (char *)v24 - v14;
  sub_1000059C8(&qword_10001C480);
  uint64_t v15 = *(void *)(sub_1000059C8(&qword_10001C488) - 8);
  uint64_t v30 = *(void *)(v15 + 72);
  unint64_t v16 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
  uint64_t v17 = swift_allocObject();
  long long v34 = xmmword_100014BA0;
  uint64_t v32 = v17;
  *(_OWORD *)(v17 + 16) = xmmword_100014BA0;
  unint64_t v18 = v17 + v16;
  *(unsigned char *)(v17 + v16) = 0;
  sub_100013A90();
  v24[2] = v9;
  sub_100013A90();
  uint64_t v28 = *(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56);
  v28(v9, 0, 1, v10);
  uint64_t v19 = sub_100013950();
  uint64_t v20 = *(void *)(v19 - 8);
  uint64_t v25 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v20 + 56);
  uint64_t v26 = v20 + 56;
  v25(v4, 1, 1, v19);
  uint64_t v21 = sub_1000059C8(&qword_10001C248);
  v24[3] = ((*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80))
         + 2 * *(void *)(v11 + 72);
  v24[4] = v21;
  *(_OWORD *)(swift_allocObject() + 16) = v34;
  sub_100013A90();
  sub_100013A90();
  sub_100013960();
  *(unsigned char *)(v18 + v30) = 1;
  sub_100013A90();
  uint64_t v22 = v35;
  sub_100013A90();
  v28(v22, 0, 1, v29);
  v25(v33, 1, 1, v19);
  *(_OWORD *)(swift_allocObject() + 16) = v34;
  sub_100013A90();
  sub_100013A90();
  sub_100013960();
  unint64_t result = sub_10000C72C(v32);
  qword_10001C790 = result;
  return result;
}

unint64_t sub_10000C72C(uint64_t a1)
{
  uint64_t v2 = sub_1000059C8(&qword_10001C488);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(void *)(a1 + 16))
  {
    uint64_t v7 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_1000059C8(&qword_10001C490);
  uint64_t v6 = sub_100013FA0();
  uint64_t v7 = (void *)v6;
  uint64_t v8 = *(void *)(a1 + 16);
  if (!v8)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v7;
  }
  uint64_t v9 = &v5[*(int *)(v2 + 48)];
  uint64_t v10 = v6 + 64;
  unint64_t v11 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v23[1] = a1;
  uint64_t v12 = a1 + v11;
  uint64_t v13 = *(void *)(v3 + 72);
  swift_retain();
  while (1)
  {
    sub_10000D38C(v12, (uint64_t)v5);
    char v14 = *v5;
    unint64_t result = sub_10000D2F4(*v5);
    if (v16) {
      break;
    }
    unint64_t v17 = result;
    *(void *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(unsigned char *)(v7[6] + result) = v14;
    uint64_t v18 = v7[7];
    uint64_t v19 = sub_100013970();
    unint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(void *)(v19 - 8) + 32))(v18 + *(void *)(*(void *)(v19 - 8) + 72) * v17, v9, v19);
    uint64_t v20 = v7[2];
    BOOL v21 = __OFADD__(v20, 1);
    uint64_t v22 = v20 + 1;
    if (v21) {
      goto LABEL_11;
    }
    v7[2] = v22;
    v12 += v13;
    if (!--v8)
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

uint64_t sub_10000C91C(char a1)
{
  if (a1) {
    return 1801807223;
  }
  else {
    return 7954788;
  }
}

uint64_t sub_10000C944(char *a1, char *a2)
{
  return sub_10000C9A8(*a1, *a2);
}

unint64_t sub_10000C954()
{
  unint64_t result = qword_10001C418;
  if (!qword_10001C418)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C418);
  }
  return result;
}

uint64_t sub_10000C9A8(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    uint64_t v3 = 1801807223;
  }
  else {
    uint64_t v3 = 7954788;
  }
  if (v2) {
    unint64_t v4 = 0xE300000000000000;
  }
  else {
    unint64_t v4 = 0xE400000000000000;
  }
  if (a2) {
    uint64_t v5 = 1801807223;
  }
  else {
    uint64_t v5 = 7954788;
  }
  if (a2) {
    unint64_t v6 = 0xE400000000000000;
  }
  else {
    unint64_t v6 = 0xE300000000000000;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = sub_100013FD0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

Swift::Int sub_10000CA3C()
{
  return sub_10000CA44();
}

Swift::Int sub_10000CA44()
{
  return sub_100014040();
}

uint64_t sub_10000CAB8()
{
  return sub_10000CAC0();
}

uint64_t sub_10000CAC0()
{
  sub_100013EE0();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_10000CB1C()
{
  return sub_10000CB24();
}

Swift::Int sub_10000CB24()
{
  return sub_100014040();
}

uint64_t sub_10000CB94@<X0>(uint64_t *a1@<X0>, char *a2@<X8>)
{
  v8._uint64_t countAndFlagsBits = *a1;
  uint64_t v3 = (void *)a1[1];
  v4._rawValue = &off_100018EC8;
  v8._object = v3;
  Swift::Int v5 = sub_100013FC0(v4, v8);
  uint64_t result = swift_bridgeObjectRelease();
  if (v5 == 1) {
    char v7 = 1;
  }
  else {
    char v7 = 2;
  }
  if (!v5) {
    char v7 = 0;
  }
  *a2 = v7;
  return result;
}

uint64_t sub_10000CBF4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10000C91C(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

unint64_t sub_10000CC24()
{
  unint64_t result = qword_10001C420;
  if (!qword_10001C420)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C420);
  }
  return result;
}

unint64_t sub_10000CC7C()
{
  unint64_t result = qword_10001C428;
  if (!qword_10001C428)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C428);
  }
  return result;
}

unint64_t sub_10000CCD4()
{
  unint64_t result = qword_10001C430;
  if (!qword_10001C430)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C430);
  }
  return result;
}

void *sub_10000CD28()
{
  return &protocol witness table for String;
}

unint64_t sub_10000CD38()
{
  unint64_t result = qword_10001C438;
  if (!qword_10001C438)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C438);
  }
  return result;
}

unint64_t sub_10000CD90()
{
  unint64_t result = qword_10001C440;
  if (!qword_10001C440)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C440);
  }
  return result;
}

unint64_t sub_10000CDE8()
{
  unint64_t result = qword_10001C448;
  if (!qword_10001C448)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C448);
  }
  return result;
}

unint64_t sub_10000CE40()
{
  unint64_t result = qword_10001C450;
  if (!qword_10001C450)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C450);
  }
  return result;
}

uint64_t sub_10000CE98()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10000CEE8(uint64_t a1)
{
  unint64_t v2 = sub_10000B104();

  return static AppEnum.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_10000CF38()
{
  unint64_t result = qword_10001C458;
  if (!qword_10001C458)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C458);
  }
  return result;
}

unint64_t sub_10000CF90()
{
  unint64_t result = qword_10001C460;
  if (!qword_10001C460)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C460);
  }
  return result;
}

unint64_t sub_10000CFE8()
{
  unint64_t result = qword_10001C468;
  if (!qword_10001C468)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C468);
  }
  return result;
}

uint64_t sub_10000D03C()
{
  if (qword_10001C098 != -1) {
    swift_once();
  }

  return swift_bridgeObjectRetain();
}

uint64_t sub_10000D098(uint64_t a1)
{
  unint64_t v2 = sub_10000CE40();

  return CaseDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

unint64_t sub_10000D0E8()
{
  unint64_t result = qword_10001C470;
  if (!qword_10001C470)
  {
    sub_100005A0C(&qword_10001C478);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C470);
  }
  return result;
}

void sub_10000D144(void *a1@<X8>)
{
  *a1 = &off_100018F18;
}

uint64_t getEnumTagSinglePayload for QueryRange(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for QueryRange(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x10000D2B0);
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

unsigned char *sub_10000D2D8(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for QueryRange()
{
  return &type metadata for QueryRange;
}

unint64_t sub_10000D2F4(char a1)
{
  sub_100014020();
  sub_100013EE0();
  swift_bridgeObjectRelease();
  Swift::Int v2 = sub_100014040();

  return sub_10000D3F4(a1 & 1, v2);
}

uint64_t sub_10000D38C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000059C8(&qword_10001C488);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_10000D3F4(char a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    if (a1) {
      uint64_t v6 = 1801807223;
    }
    else {
      uint64_t v6 = 7954788;
    }
    if (a1) {
      unint64_t v7 = 0xE400000000000000;
    }
    else {
      unint64_t v7 = 0xE300000000000000;
    }
    while (1)
    {
      uint64_t v8 = *(unsigned char *)(*(void *)(v2 + 48) + v4) ? 1801807223 : 7954788;
      unint64_t v9 = *(unsigned char *)(*(void *)(v2 + 48) + v4) ? 0xE400000000000000 : 0xE300000000000000;
      if (v8 == v6 && v9 == v7) {
        break;
      }
      char v11 = sub_100013FD0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v11 & 1) == 0)
      {
        unint64_t v4 = (v4 + 1) & v5;
        if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4)) {
          continue;
        }
      }
      return v4;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return v4;
}

unint64_t sub_10000D524()
{
  unint64_t result = qword_10001C4C8;
  if (!qword_10001C4C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C4C8);
  }
  return result;
}

unint64_t sub_10000D57C()
{
  unint64_t result = qword_10001C4D0;
  if (!qword_10001C4D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C4D0);
  }
  return result;
}

uint64_t sub_10000D5D0()
{
  return *(void *)(swift_getOpaqueTypeConformance2() + 8);
}

uint64_t sub_10000D604()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10000D620()
{
  uint64_t v0 = sub_100013B50();
  sub_100005278(v0, qword_10001C498);
  sub_1000052DC(v0, (uint64_t)qword_10001C498);
  return sub_100013B40();
}

uint64_t sub_10000D66C()
{
  uint64_t v0 = sub_100013AB0();
  sub_100005278(v0, qword_10001C798);
  sub_1000052DC(v0, (uint64_t)qword_10001C798);
  return sub_100013A90();
}

uint64_t sub_10000D6D0()
{
  uint64_t v0 = sub_1000059C8(&qword_10001C660);
  __chkstk_darwin(v0 - 8);
  uint64_t v1 = sub_1000059C8(&qword_10001C668);
  __chkstk_darwin(v1);
  sub_100012048();
  sub_1000139B0();
  v3._object = (void *)0x80000001000160C0;
  v3._uint64_t countAndFlagsBits = 0xD00000000000001BLL;
  sub_1000139A0(v3);
  swift_getKeyPath();
  sub_1000059C8(&qword_10001C670);
  sub_100013990();
  swift_release();
  v4._uint64_t countAndFlagsBits = 0;
  v4._object = (void *)0xE000000000000000;
  sub_1000139A0(v4);
  sub_1000139C0();
  return sub_100013980();
}

uint64_t sub_10000D860(uint64_t a1, uint64_t a2)
{
  v2[8] = a1;
  v2[9] = a2;
  uint64_t v3 = sub_100013810();
  v2[10] = v3;
  v2[11] = *(void *)(v3 - 8);
  v2[12] = swift_task_alloc();
  uint64_t v4 = sub_100013C30();
  v2[13] = v4;
  v2[14] = *(void *)(v4 - 8);
  v2[15] = swift_task_alloc();
  sub_100013F30();
  v2[16] = sub_100013F20();
  uint64_t v6 = sub_100013F10();
  v2[17] = v6;
  v2[18] = v5;
  return _swift_task_switch(sub_10000D9B0, v6, v5);
}

uint64_t sub_10000D9B0()
{
  id v1 = [objc_allocWithZone((Class)STPrivateServiceClient) init];
  char v2 = sub_100004D44(v1);

  if (v2)
  {
    uint64_t v3 = (void *)swift_task_alloc();
    v0[19] = v3;
    *uint64_t v3 = v0;
    v3[1] = sub_10000DBCC;
    uint64_t v4 = v0[15];
    uint64_t v5 = v0[9];
    return sub_10000DEE0(v4, v5);
  }
  else
  {
    swift_release();
    v0[2] = sub_100011D60(0, 0, 0, 0, 0);
    v0[3] = v7;
    v0[4] = v8;
    if (qword_10001C068 != -1) {
      swift_once();
    }
    sub_1000052DC(v0[10], (uint64_t)qword_10001C760);
    sub_1000101BC();
    sub_10000B158();
    sub_100013830();
    swift_release();
    swift_release();
    swift_release();
    swift_task_dealloc();
    swift_task_dealloc();
    unint64_t v9 = (uint64_t (*)(void))v0[1];
    return v9();
  }
}

uint64_t sub_10000DBCC()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 160) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 144);
  uint64_t v4 = *(void *)(v2 + 136);
  if (v0) {
    uint64_t v5 = sub_100006ACC;
  }
  else {
    uint64_t v5 = sub_10000DD08;
  }
  return _swift_task_switch(v5, v4, v3);
}

uint64_t sub_10000DD08()
{
  uint64_t v1 = v0[15];
  uint64_t v2 = v0[14];
  uint64_t v4 = v0[11];
  uint64_t v3 = v0[12];
  uint64_t v5 = v0[9];
  uint64_t v16 = v0[10];
  uint64_t v17 = v0[13];
  swift_release();
  uint64_t v6 = sub_100013BF0();
  uint64_t v15 = sub_10001209C(v6);
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  uint64_t v11 = sub_100013BF0();
  sub_10000EA94(v11, v3);
  swift_bridgeObjectRelease();
  v0[5] = v15;
  v0[6] = v8;
  v0[7] = v10;
  uint64_t v12 = swift_task_alloc();
  *(void *)(v12 + 16) = v1;
  *(void *)(v12 + 24) = v5;
  type metadata accessor for ScreenTimeNotificationsAppIntent.ScreenTimeNotificationsView();
  sub_1000101BC();
  sub_10001351C(&qword_10001C618, (void (*)(uint64_t))type metadata accessor for ScreenTimeNotificationsAppIntent.ScreenTimeNotificationsView);
  sub_100013840();
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v16);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v17);
  swift_release();
  swift_release();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v13 = (uint64_t (*)(void))v0[1];
  return v13();
}

uint64_t sub_10000DEE0(uint64_t a1, uint64_t a2)
{
  v2[2] = a1;
  v2[3] = a2;
  uint64_t v3 = sub_100013CA0();
  v2[4] = v3;
  v2[5] = *(void *)(v3 - 8);
  v2[6] = swift_task_alloc();
  v2[7] = swift_task_alloc();
  uint64_t v4 = sub_100013C90();
  v2[8] = v4;
  v2[9] = *(void *)(v4 - 8);
  v2[10] = swift_task_alloc();
  uint64_t v5 = sub_100013AF0();
  v2[11] = v5;
  v2[12] = *(void *)(v5 - 8);
  v2[13] = swift_task_alloc();
  sub_1000059C8(&qword_10001C300);
  v2[14] = swift_task_alloc();
  v2[15] = swift_task_alloc();
  v2[16] = swift_task_alloc();
  v2[17] = swift_task_alloc();
  uint64_t v6 = sub_100013A40();
  v2[18] = v6;
  v2[19] = *(void *)(v6 - 8);
  v2[20] = swift_task_alloc();
  v2[21] = swift_task_alloc();
  v2[22] = swift_task_alloc();
  return _swift_task_switch(sub_10000E138, 0, 0);
}

uint64_t sub_10000E138()
{
  if (qword_10001C0A0 != -1) {
    swift_once();
  }
  uint64_t v1 = *(void *)(v0 + 144);
  uint64_t v2 = *(void *)(v0 + 152);
  uint64_t v3 = *(void *)(v0 + 136);
  uint64_t v5 = *(void *)(v0 + 96);
  uint64_t v4 = *(void *)(v0 + 104);
  uint64_t v6 = *(void *)(v0 + 88);
  uint64_t v7 = sub_100013B50();
  sub_1000052DC(v7, (uint64_t)qword_10001C498);
  sub_100013AE0();
  sub_100013B20();
  uint64_t v8 = *(void (**)(uint64_t, uint64_t))(v5 + 8);
  v8(v4, v6);
  uint64_t v9 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48);
  if (v9(v3, 1, v1) == 1)
  {
    sub_100005C04(*(void *)(v0 + 136), &qword_10001C300);
    sub_100012C0C();
    swift_allocError();
    *uint64_t v10 = 0;
    swift_willThrow();
LABEL_11:
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v27 = *(uint64_t (**)(void))(v0 + 8);
    return v27();
  }
  Swift::String v35 = *(void (**)(void, void, void))(*(void *)(v0 + 152) + 32);
  v35(*(void *)(v0 + 176), *(void *)(v0 + 136), *(void *)(v0 + 144));
  sub_1000138B0();
  char v11 = *(unsigned char *)(v0 + 200);
  sub_100013AE0();
  if (v11)
  {
    uint64_t v12 = *(void *)(v0 + 104);
    uint64_t v13 = *(void *)(v0 + 88);
    sub_100013B20();
    v8(v12, v13);
  }
  else
  {
    uint64_t v14 = *(void *)(v0 + 152);
    uint64_t v32 = *(void *)(v0 + 144);
    uint64_t v33 = *(void *)(v0 + 128);
    long long v34 = v9;
    uint64_t v15 = *(void *)(v0 + 120);
    uint64_t v16 = *(void *)(v0 + 104);
    uint64_t v17 = *(void *)(v0 + 88);
    sub_100013B30();
    uint64_t v18 = v16;
    uint64_t v9 = v34;
    v8(v18, v17);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v14 + 56))(v15, 0, 1, v32);
    sub_10000BD8C(v15, v33, &qword_10001C300);
  }
  uint64_t v19 = *(void *)(v0 + 144);
  uint64_t v20 = *(void *)(v0 + 112);
  sub_1000134B8(*(void *)(v0 + 128), v20, &qword_10001C300);
  unsigned int v21 = v9(v20, 1, v19);
  uint64_t v22 = *(void *)(v0 + 176);
  if (v21 == 1)
  {
    uint64_t v24 = *(void *)(v0 + 144);
    uint64_t v23 = *(void *)(v0 + 152);
    uint64_t v25 = *(void *)(v0 + 128);
    sub_100005C04(*(void *)(v0 + 112), &qword_10001C300);
    sub_100012C0C();
    swift_allocError();
    unsigned char *v26 = 1;
    swift_willThrow();
    sub_100005C04(v25, &qword_10001C300);
    (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v22, v24);
    goto LABEL_11;
  }
  v35(*(void *)(v0 + 168), *(void *)(v0 + 112), *(void *)(v0 + 144));
  sub_100013C80();
  sub_100013C60();
  uint64_t v29 = (void *)swift_task_alloc();
  *(void *)(v0 + 184) = v29;
  *uint64_t v29 = v0;
  v29[1] = sub_10000E60C;
  uint64_t v30 = *(void *)(v0 + 176);
  uint64_t v31 = *(void *)(v0 + 56);
  return ModelProvider.addHourlyData(toDataModel:forDateInterval:userAltDSID:deviceIdentifier:)(v31, v30, 0, 0, 0, 0);
}

uint64_t sub_10000E60C()
{
  *(void *)(*(void *)v1 + 192) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_10000E924;
  }
  else {
    uint64_t v2 = sub_10000E720;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_10000E720()
{
  uint64_t v1 = v0[21];
  uint64_t v2 = v0[19];
  uint64_t v3 = v0[20];
  uint64_t v4 = v0[18];
  uint64_t v14 = v0[16];
  uint64_t v15 = v0[22];
  uint64_t v5 = v0[9];
  uint64_t v6 = v0[7];
  uint64_t v12 = v0[8];
  uint64_t v13 = v0[10];
  uint64_t v7 = v0[5];
  uint64_t v11 = v0[4];
  (*(void (**)(void, uint64_t))(v7 + 16))(v0[6], v6);
  sub_1000138B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v3, v1, v4);
  sub_100013BE0();
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v6, v11);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v13, v12);
  uint64_t v8 = *(void (**)(uint64_t, uint64_t))(v2 + 8);
  v8(v1, v4);
  sub_100005C04(v14, &qword_10001C300);
  v8(v15, v4);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v9 = (uint64_t (*)(void))v0[1];
  return v9();
}

uint64_t sub_10000E924()
{
  uint64_t v1 = v0[21];
  uint64_t v2 = v0[22];
  uint64_t v3 = v0[18];
  uint64_t v4 = v0[19];
  uint64_t v5 = v0[16];
  uint64_t v7 = v0[9];
  uint64_t v6 = v0[10];
  uint64_t v8 = v0[8];
  (*(void (**)(void, void))(v0[5] + 8))(v0[7], v0[4]);
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v6, v8);
  uint64_t v9 = *(void (**)(uint64_t, uint64_t))(v4 + 8);
  v9(v1, v3);
  sub_100005C04(v5, &qword_10001C300);
  v9(v2, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v10 = (uint64_t (*)(void))v0[1];
  return v10();
}

uint64_t sub_10000EA94@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_100013810();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v21[-1] - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1000059C8(&qword_10001C2A8);
  __chkstk_darwin(v8 - 8);
  uint64_t v10 = (char *)&v21[-1] - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_1000059C8(&qword_10001C2B0);
  __chkstk_darwin(v11 - 8);
  uint64_t v13 = (char *)&v21[-1] - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_1000059C8(&qword_10001C620);
  __chkstk_darwin(v14 - 8);
  uint64_t v15 = sub_100013B70();
  v21[3] = v15;
  v21[4] = sub_10001351C((unint64_t *)&qword_10001C0B8, (void (*)(uint64_t))&type metadata accessor for ScreenTimeFeatureFlags);
  uint64_t v16 = sub_100005090(v21);
  (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v15 - 8) + 104))(v16, enum case for ScreenTimeFeatureFlags.nlgDialogResponse(_:), v15);
  LOBYTE(v15) = sub_100013B60();
  sub_1000050F4((uint64_t)v21);
  if (v15)
  {
    uint64_t v17 = sub_100013A00();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v13, 1, 1, v17);
    uint64_t v18 = sub_100013A20();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v10, 1, 1, v18);
    sub_100012048();
    sub_1000101BC();
    sub_1000137E0();
    return sub_100013800();
  }
  else
  {
    sub_1000138B0();
    if (v21[0]) {
      sub_10000F684(a1);
    }
    else {
      sub_10000F374(a1);
    }
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v5 + 32))(a2, v7, v4);
  }
}

uint64_t sub_10000EE38@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  v18[0] = a2;
  uint64_t v3 = sub_100013C30();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = __chkstk_darwin(v3);
  uint64_t v7 = (char *)v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v9 = (char *)v18 - v8;
  uint64_t v10 = type metadata accessor for ScreenTimeNotificationsAppIntent.ScreenTimeNotificationsView();
  uint64_t v11 = v10 - 8;
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = *(void (**)(char *, uint64_t, uint64_t))(v4 + 16);
  v14(v9, a1, v3);
  sub_1000138B0();
  uint64_t v15 = v19;
  v14(v7, (uint64_t)v9, v3);
  sub_100013E10();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v9, v3);
  uint64_t v16 = *(int *)(v11 + 28);
  v18[1] = v15;
  type metadata accessor for STActivityMode();
  sub_100013E10();
  *(_OWORD *)&v13[v16] = v19;
  return sub_100012AF8((uint64_t)v13, v18[0]);
}

uint64_t sub_10000F008()
{
  uint64_t v0 = sub_1000059C8(&qword_10001C638);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  sub_100012048();
  sub_100013940();
  swift_release();
  sub_100005E60(&qword_10001C640, &qword_10001C638);
  sub_100013930();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t sub_10000F150()
{
  uint64_t v0 = sub_1000059C8(&qword_10001C628);
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = __chkstk_darwin(v0);
  uint64_t v4 = (char *)&v12 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __chkstk_darwin(v2);
  uint64_t v7 = (char *)&v12 - v6;
  __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v12 - v8;
  swift_getKeyPath();
  sub_10000FB48();
  sub_100013920();
  swift_release();
  swift_getKeyPath();
  sub_100013920();
  swift_release();
  swift_getKeyPath();
  sub_100013920();
  swift_release();
  sub_1000101BC();
  sub_100005E60(&qword_10001C630, &qword_10001C628);
  sub_1000138F0();
  uint64_t v10 = *(void (**)(char *, uint64_t))(v1 + 8);
  v10(v4, v0);
  v10(v7, v0);
  return ((uint64_t (*)(char *, uint64_t))v10)(v9, v0);
}

uint64_t sub_10000F374(uint64_t a1)
{
  uint64_t v2 = sub_100013EA0();
  __chkstk_darwin(v2 - 8);
  uint64_t v3 = sub_100013AB0();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = __chkstk_darwin(v3);
  uint64_t v7 = &v19[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v5);
  uint64_t v9 = &v19[-v8];
  uint64_t v10 = *(void *)(a1 + 16);
  if (v10 == 1)
  {
    sub_100013C20();
    sub_100013E90();
    v20._uint64_t countAndFlagsBits = 0;
    v20._object = (void *)0xE000000000000000;
    sub_100013E80(v20);
    v21._uint64_t countAndFlagsBits = sub_100013C00();
    sub_100013E70(v21);
    swift_bridgeObjectRelease();
    v11._object = (void *)0x8000000100015FC0;
    v11._uint64_t countAndFlagsBits = 0xD000000000000027;
LABEL_6:
    sub_100013E80(v11);
    sub_100013AA0();
    goto LABEL_7;
  }
  if (v10)
  {
    sub_100013E90();
    v22._uint64_t countAndFlagsBits = 0;
    v22._object = (void *)0xE000000000000000;
    sub_100013E80(v22);
    uint64_t v12 = self;
    sub_1000118D0(a1);
    Class isa = sub_100013F00().super.isa;
    swift_bridgeObjectRelease();
    id v14 = [v12 localizedStringByJoiningStrings:isa];

    uint64_t v15 = sub_100013EC0();
    uint64_t v17 = v16;

    v23._uint64_t countAndFlagsBits = v15;
    v23._object = v17;
    sub_100013E70(v23);
    swift_bridgeObjectRelease();
    v11._uint64_t countAndFlagsBits = 0xD000000000000028;
    v11._object = (void *)0x8000000100015F90;
    goto LABEL_6;
  }
  sub_100013A90();
LABEL_7:
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v4 + 16))(v7, v9, v3);
  sub_100013820();
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v4 + 8))(v9, v3);
}

uint64_t sub_10000F684(uint64_t a1)
{
  uint64_t v2 = sub_100013EA0();
  __chkstk_darwin(v2 - 8);
  uint64_t v3 = sub_100013AB0();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = __chkstk_darwin(v3);
  uint64_t v7 = &v19[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v5);
  uint64_t v9 = &v19[-v8];
  uint64_t v10 = *(void *)(a1 + 16);
  if (v10 == 1)
  {
    sub_100013C20();
    sub_100013E90();
    v20._uint64_t countAndFlagsBits = 0;
    v20._object = (void *)0xE000000000000000;
    sub_100013E80(v20);
    v21._uint64_t countAndFlagsBits = sub_100013C00();
    sub_100013E70(v21);
    swift_bridgeObjectRelease();
    v11._object = (void *)0x8000000100016050;
    v11._uint64_t countAndFlagsBits = 0xD00000000000002BLL;
LABEL_6:
    sub_100013E80(v11);
    sub_100013AA0();
    goto LABEL_7;
  }
  if (v10)
  {
    sub_100013E90();
    v22._uint64_t countAndFlagsBits = 0;
    v22._object = (void *)0xE000000000000000;
    sub_100013E80(v22);
    uint64_t v12 = self;
    sub_1000118D0(a1);
    Class isa = sub_100013F00().super.isa;
    swift_bridgeObjectRelease();
    id v14 = [v12 localizedStringByJoiningStrings:isa];

    uint64_t v15 = sub_100013EC0();
    uint64_t v17 = v16;

    v23._uint64_t countAndFlagsBits = v15;
    v23._object = v17;
    sub_100013E70(v23);
    swift_bridgeObjectRelease();
    v11._uint64_t countAndFlagsBits = 0xD00000000000002CLL;
    v11._object = (void *)0x8000000100016020;
    goto LABEL_6;
  }
  sub_100013A90();
LABEL_7:
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v4 + 16))(v7, v9, v3);
  sub_100013820();
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v4 + 8))(v9, v3);
}

uint64_t sub_10000F994@<X0>(uint64_t a1@<X8>)
{
  if (qword_10001C0A8 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100013AB0();
  uint64_t v3 = sub_1000052DC(v2, (uint64_t)qword_10001C798);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

uint64_t sub_10000FA40(uint64_t a1)
{
  uint64_t v4 = *v1;
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_100008EC8;
  return sub_10000D860(a1, v4);
}

uint64_t sub_10000FAE0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100012770();
  *a1 = result;
  return result;
}

uint64_t sub_10000FB08(uint64_t a1)
{
  unint64_t v2 = sub_100012048();

  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

unint64_t sub_10000FB48()
{
  unint64_t result = qword_10001C4E0;
  if (!qword_10001C4E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C4E0);
  }
  return result;
}

uint64_t sub_10000FB9C()
{
  uint64_t v0 = sub_100013B10();
  __chkstk_darwin(v0 - 8);
  uint64_t v1 = sub_100013EB0();
  __chkstk_darwin(v1 - 8);
  sub_100013E60();
  sub_100013B00();
  return sub_100013ED0();
}

BOOL sub_10000FCB4(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_10000FCCC()
{
  return sub_10000FB9C();
}

uint64_t sub_10000FCD4()
{
  uint64_t v0 = sub_1000059C8(&qword_10001C238);
  __chkstk_darwin(v0 - 8);
  unint64_t v2 = (char *)&v10 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_1000059C8(&qword_10001C240);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100013AB0();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  sub_100013A90();
  sub_100013A90();
  (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v5, 0, 1, v6);
  uint64_t v8 = sub_100013950();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v2, 1, 1, v8);
  sub_1000059C8(&qword_10001C248);
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_100014E70;
  sub_100013A90();
  return sub_100013960();
}

uint64_t sub_10000FF34@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100011D60(0, 0, 0, 0, 0);
  *a1 = result;
  a1[1] = v3;
  a1[2] = v4;
  return result;
}

unint64_t sub_10000FF7C()
{
  unint64_t result = qword_10001C4E8;
  if (!qword_10001C4E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C4E8);
  }
  return result;
}

unint64_t sub_10000FFD4()
{
  unint64_t result = qword_10001C4F0;
  if (!qword_10001C4F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C4F0);
  }
  return result;
}

unint64_t sub_10001002C()
{
  unint64_t result = qword_10001C4F8;
  if (!qword_10001C4F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C4F8);
  }
  return result;
}

uint64_t sub_100010080()
{
  return sub_100005E60(&qword_10001C500, &qword_10001C508);
}

uint64_t sub_1000100BC(uint64_t a1)
{
  unint64_t v2 = sub_100011D0C();

  return static TransientAppEntity.defaultQuery.getter(a1, v2);
}

unint64_t sub_10001010C()
{
  unint64_t result = qword_10001C510;
  if (!qword_10001C510)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C510);
  }
  return result;
}

unint64_t sub_100010164()
{
  unint64_t result = qword_10001C518;
  if (!qword_10001C518)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C518);
  }
  return result;
}

unint64_t sub_1000101BC()
{
  unint64_t result = qword_10001C520;
  if (!qword_10001C520)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C520);
  }
  return result;
}

unint64_t sub_100010214()
{
  unint64_t result = qword_10001C528;
  if (!qword_10001C528)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C528);
  }
  return result;
}

uint64_t sub_10001026C()
{
  return sub_10001351C(&qword_10001C1E8, (void (*)(uint64_t))&type metadata accessor for UUID);
}

uint64_t sub_1000102B4(uint64_t a1)
{
  unint64_t v2 = sub_100011D0C();

  return TransientAppEntity.id.getter(a1, v2);
}

uint64_t sub_100010300()
{
  uint64_t v0 = sub_1000059C8(&qword_10001C240);
  __chkstk_darwin(v0 - 8);
  unint64_t v2 = (char *)&v6 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100013AB0();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  sub_100013A90();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v4 + 56))(v2, 1, 1, v3);
  return sub_100013A10();
}

uint64_t sub_100010444()
{
  return sub_100005E60(&qword_10001C530, &qword_10001C538);
}

uint64_t sub_100010484(uint64_t a1)
{
  unint64_t v2 = sub_10000FB48();

  return static AppEntity.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_1000104D4()
{
  unint64_t result = qword_10001C540;
  if (!qword_10001C540)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C540);
  }
  return result;
}

uint64_t sub_10001052C(uint64_t a1)
{
  unint64_t v2 = sub_100010214();

  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

unint64_t sub_10001057C()
{
  unint64_t result = qword_10001C548;
  if (!qword_10001C548)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C548);
  }
  return result;
}

uint64_t sub_1000105D0()
{
  uint64_t v0 = sub_1000059C8(&qword_10001C240);
  __chkstk_darwin(v0 - 8);
  unint64_t v2 = (char *)&v6 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100013AB0();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  sub_100013A90();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v4 + 56))(v2, 1, 1, v3);
  return sub_100013A10();
}

uint64_t sub_100010708()
{
  uint64_t v0 = sub_1000059C8(&qword_10001C238);
  __chkstk_darwin(v0 - 8);
  unint64_t v2 = (char *)&v10 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_1000059C8(&qword_10001C240);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100013AB0();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  sub_100013A90();
  sub_100013A90();
  (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v5, 0, 1, v6);
  uint64_t v8 = sub_100013950();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v2, 1, 1, v8);
  sub_1000059C8(&qword_10001C248);
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_100014BA0;
  sub_100013A90();
  sub_100013A90();
  return sub_100013960();
}

uint64_t sub_100010974@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100011B94();
  *a1 = result;
  a1[1] = v3;
  return result;
}

unint64_t sub_1000109AC()
{
  unint64_t result = qword_10001C550;
  if (!qword_10001C550)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C550);
  }
  return result;
}

unint64_t sub_100010A04()
{
  unint64_t result = qword_10001C558;
  if (!qword_10001C558)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C558);
  }
  return result;
}

unint64_t sub_100010A5C()
{
  unint64_t result = qword_10001C560;
  if (!qword_10001C560)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C560);
  }
  return result;
}

uint64_t sub_100010AB0()
{
  return sub_100005E60(&qword_10001C568, &qword_10001C570);
}

uint64_t sub_100010AEC(uint64_t a1)
{
  unint64_t v2 = sub_1000110E0();

  return static TransientAppEntity.defaultQuery.getter(a1, v2);
}

unint64_t sub_100010B3C()
{
  unint64_t result = qword_10001C578;
  if (!qword_10001C578)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C578);
  }
  return result;
}

unint64_t sub_100010B94()
{
  unint64_t result = qword_10001C580;
  if (!qword_10001C580)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C580);
  }
  return result;
}

unint64_t sub_100010BEC()
{
  unint64_t result = qword_10001C588;
  if (!qword_10001C588)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C588);
  }
  return result;
}

unint64_t sub_100010C44()
{
  unint64_t result = qword_10001C590;
  if (!qword_10001C590)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C590);
  }
  return result;
}

uint64_t sub_100010C98(uint64_t a1)
{
  unint64_t v2 = sub_1000110E0();

  return TransientAppEntity.id.getter(a1, v2);
}

uint64_t sub_100010CE8()
{
  return sub_100005E60(&qword_10001C598, &qword_10001C5A0);
}

uint64_t sub_100010D24(uint64_t a1)
{
  unint64_t v2 = sub_10001057C();

  return static AppEntity.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_100010D74()
{
  unint64_t result = qword_10001C5A8;
  if (!qword_10001C5A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C5A8);
  }
  return result;
}

uint64_t sub_100010DCC(uint64_t a1)
{
  unint64_t v2 = sub_100010C44();

  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

uint64_t destroy for ScreenTimeNotificationsAppIntent.AppEmittingNotifications()
{
  swift_release();

  return swift_release();
}

void *_s29ScreenTimeAppIntentsExtension32ScreenTimeNotificationsAppIntentV24AppEmittingNotificationsVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  swift_retain();
  return a1;
}

void *assignWithCopy for ScreenTimeNotificationsAppIntent.AppEmittingNotifications(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  return a1;
}

__n128 initializeWithTake for ScreenTimeNotificationsAppIntent.AppEmittingNotifications(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

_OWORD *assignWithTake for ScreenTimeNotificationsAppIntent.AppEmittingNotifications(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for ScreenTimeNotificationsAppIntent.AppEmittingNotifications(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 16)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ScreenTimeNotificationsAppIntent.AppEmittingNotifications(uint64_t result, int a2, int a3)
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
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ScreenTimeNotificationsAppIntent.AppEmittingNotifications()
{
  return &type metadata for ScreenTimeNotificationsAppIntent.AppEmittingNotifications;
}

ValueMetadata *type metadata accessor for ScreenTimeNotificationsAppIntent.NotificationEmittingResult()
{
  return &type metadata for ScreenTimeNotificationsAppIntent.NotificationEmittingResult;
}

ValueMetadata *type metadata accessor for ScreenTimeNotificationsAppIntent()
{
  return &type metadata for ScreenTimeNotificationsAppIntent;
}

uint64_t sub_100010FF0()
{
  return sub_100005E60(&qword_10001C5B0, &qword_10001C5B8);
}

uint64_t sub_10001102C()
{
  return sub_100005E60(&qword_10001C5C0, &qword_10001C5C8);
}

uint64_t sub_100011068()
{
  return sub_100005E60(&qword_10001C5D0, &qword_10001C5C8);
}

uint64_t sub_1000110A4()
{
  return sub_100005E60(&qword_10001C5D8, &qword_10001C5C8);
}

unint64_t sub_1000110E0()
{
  unint64_t result = qword_10001C5E0;
  if (!qword_10001C5E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C5E0);
  }
  return result;
}

uint64_t sub_100011134()
{
  uint64_t v0 = sub_1000059C8(&qword_10001C0C8);
  __chkstk_darwin(v0 - 8);
  uint64_t v2 = (char *)&v7 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100013AD0();
  sub_100005278(v3, qword_10001C4B0);
  uint64_t v4 = sub_1000052DC(v3, (uint64_t)qword_10001C4B0);
  sub_100013AC0();
  uint64_t v5 = *(void *)(v3 - 8);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v5 + 48))(v2, 1, v3);
  if (result != 1) {
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v5 + 32))(v4, v2, v3);
  }
  __break(1u);
  return result;
}

uint64_t sub_100011264@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v30 = a1;
  uint64_t v3 = sub_100013C50();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v28 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = sub_1000059C8(&qword_10001C738);
  __chkstk_darwin(v29);
  uint64_t v8 = (char *)&v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_100013C30();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v28 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000059C8(&qword_10001C678);
  sub_100013E20();
  uint64_t v13 = sub_100013BF0();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  uint64_t v14 = *(void *)(v13 + 16);
  swift_bridgeObjectRelease();
  if (v14)
  {
    sub_100013E20();
    long long v31 = *(_OWORD *)(v2
                    + *(int *)(type metadata accessor for ScreenTimeNotificationsAppIntent.ScreenTimeNotificationsView()
                             + 20));
    sub_1000059C8(&qword_10001C3D0);
    sub_100013E20();
    sub_100013C40();
    (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v8, v6, v3);
    swift_storeEnumTagMultiPayload();
    sub_10001351C(&qword_10001C740, (void (*)(uint64_t))&type metadata accessor for ScreenTimeNotificationsAppIntentView);
    sub_100013D40();
    return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }
  else
  {
    sub_100013D20();
    uint64_t v16 = sub_100013DC0();
    uint64_t v18 = v17;
    char v20 = v19 & 1;
    LODWORD(v31) = sub_100013D50();
    uint64_t v21 = sub_100013DB0();
    uint64_t v23 = v22;
    char v25 = v24;
    uint64_t v27 = v26;
    sub_100013564(v16, v18, v20);
    swift_bridgeObjectRelease();
    *(void *)uint64_t v8 = v21;
    *((void *)v8 + 1) = v23;
    v8[16] = v25 & 1;
    *((void *)v8 + 3) = v27;
    swift_storeEnumTagMultiPayload();
    sub_10001351C(&qword_10001C740, (void (*)(uint64_t))&type metadata accessor for ScreenTimeNotificationsAppIntentView);
    return sub_100013D40();
  }
}

uint64_t sub_100011654@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_100013AD0();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1000059C8(&qword_10001C720);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_1000059C8(&qword_10001C728);
  uint64_t v10 = v9 - 8;
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100011264((uint64_t)v8);
  char v13 = sub_100013D80();
  sub_1000134B8((uint64_t)v8, (uint64_t)v12, &qword_10001C720);
  uint64_t v14 = &v12[*(int *)(v10 + 44)];
  *uint64_t v14 = v13;
  *(_OWORD *)(v14 + 8) = 0u;
  *(_OWORD *)(v14 + 24) = 0u;
  v14[40] = 1;
  sub_100005C04((uint64_t)v8, &qword_10001C720);
  uint64_t v15 = sub_100013E50();
  uint64_t v17 = v16;
  uint64_t v18 = *(int *)(sub_1000059C8(&qword_10001C730) + 36);
  if (qword_10001C0B0 != -1) {
    swift_once();
  }
  uint64_t v19 = sub_1000052DC(v2, (uint64_t)qword_10001C4B0);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v19, v2);
  sub_100013D90();
  char v20 = (uint64_t *)(a1 + v18 + *(int *)(sub_1000059C8(&qword_10001C3E0) + 36));
  *char v20 = v15;
  v20[1] = v17;
  return sub_10000BD8C((uint64_t)v12, a1, &qword_10001C728);
}

void *sub_1000118D0(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    sub_100011A08(0, v1, 0);
    uint64_t v3 = *(void *)(sub_100013C20() - 8);
    uint64_t v4 = a1 + ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
    uint64_t v5 = *(void *)(v3 + 72);
    do
    {
      uint64_t v6 = sub_100013C00();
      uint64_t v8 = v7;
      unint64_t v10 = _swiftEmptyArrayStorage[2];
      unint64_t v9 = _swiftEmptyArrayStorage[3];
      if (v10 >= v9 >> 1) {
        sub_100011A08(v9 > 1, v10 + 1, 1);
      }
      _swiftEmptyArrayStorage[2] = v10 + 1;
      uint64_t v11 = (char *)&_swiftEmptyArrayStorage[2 * v10];
      *((void *)v11 + 4) = v6;
      *((void *)v11 + 5) = v8;
      v4 += v5;
      --v1;
    }
    while (v1);
  }
  return _swiftEmptyArrayStorage;
}

uint64_t sub_100011A08(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_100011A28(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_100011A28(char a1, int64_t a2, char a3, char *a4)
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
        goto LABEL_32;
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
    sub_1000059C8(&qword_10001C648);
    unint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    unint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  char v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[16 * v8] || v13 >= &v14[16 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_100013FB0();
  __break(1u);
  return result;
}

uint64_t sub_100011B94()
{
  uint64_t v0 = sub_100013AB0();
  __chkstk_darwin(v0 - 8);
  sub_1000059C8(&qword_10001C258);
  sub_100013A90();
  uint64_t v1 = sub_100013890();
  sub_1000059C8(&qword_10001C5E8);
  swift_retain();
  sub_100013A90();
  sub_1000138A0();
  swift_retain();
  swift_retain();
  sub_100013860();
  swift_release();
  swift_retain();
  swift_retain();
  sub_100013860();
  swift_release_n();
  swift_release_n();
  return v1;
}

unint64_t sub_100011D0C()
{
  unint64_t result = qword_10001C5F0;
  if (!qword_10001C5F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C5F0);
  }
  return result;
}

uint64_t sub_100011D60(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v7 = sub_100013AB0();
  __chkstk_darwin(v7 - 8);
  sub_1000059C8(&qword_10001C5F8);
  sub_100013A90();
  sub_10001057C();
  uint64_t v8 = sub_100013880();
  swift_retain();
  sub_100013A90();
  sub_100013880();
  swift_retain();
  sub_100013A90();
  sub_100013880();
  swift_retain();
  swift_retain();
  swift_retain();
  sub_100011FC8(a1);
  sub_100013860();
  swift_release();
  swift_release();
  swift_retain();
  swift_retain();
  swift_retain();
  sub_100011FC8(a3);
  sub_100013860();
  swift_release();
  swift_release();
  swift_release();
  swift_retain();
  swift_retain();
  swift_retain();
  sub_100011FC8(a5);
  sub_100013860();
  sub_100012008(a5);
  sub_100012008(a3);
  sub_100012008(a1);
  swift_release_n();
  swift_release_n();
  swift_release_n();
  return v8;
}

uint64_t sub_100011FC8(uint64_t result)
{
  if (result)
  {
    swift_retain();
    return swift_retain();
  }
  return result;
}

uint64_t sub_100012008(uint64_t result)
{
  if (result)
  {
    swift_release();
    return swift_release();
  }
  return result;
}

unint64_t sub_100012048()
{
  unint64_t result = qword_10001C600;
  if (!qword_10001C600)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_10001C600);
  }
  return result;
}

uint64_t sub_10001209C(uint64_t a1)
{
  uint64_t v2 = sub_100013C20();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  v56 = (char *)&v56 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __chkstk_darwin(v4);
  v57 = (char *)&v56 - v7;
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v56 - v8;
  uint64_t v10 = sub_1000059C8(&qword_10001C650);
  uint64_t v11 = __chkstk_darwin(v10 - 8);
  uint64_t v12 = __chkstk_darwin(v11);
  v62 = (char *)&v56 - v13;
  uint64_t v14 = __chkstk_darwin(v12);
  v63 = (char *)&v56 - v15;
  uint64_t v16 = __chkstk_darwin(v14);
  uint64_t v18 = (char *)&v56 - v17;
  uint64_t v19 = __chkstk_darwin(v16);
  uint64_t v21 = (char *)&v56 - v20;
  uint64_t v22 = __chkstk_darwin(v19);
  uint64_t v61 = (uint64_t)&v56 - v23;
  uint64_t v24 = __chkstk_darwin(v22);
  uint64_t v26 = (char *)&v56 - v25;
  uint64_t v27 = __chkstk_darwin(v24);
  uint64_t v29 = (char *)&v56 - v28;
  __chkstk_darwin(v27);
  long long v31 = (char *)&v56 - v30;
  unint64_t v67 = *(void *)(a1 + 16);
  uint64_t v64 = a1;
  uint64_t v60 = v32;
  if (v67)
  {
    (*(void (**)(char *, unint64_t, uint64_t))(v3 + 16))(v29, a1 + ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80)), v2);
    uint64_t v33 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v3 + 56);
    long long v34 = v29;
    uint64_t v35 = 0;
  }
  else
  {
    uint64_t v33 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v3 + 56);
    long long v34 = v29;
    uint64_t v35 = 1;
  }
  v66 = v33;
  v33(v34, v35, 1, v2);
  sub_10000BD8C((uint64_t)v29, (uint64_t)v31, &qword_10001C650);
  sub_1000134B8((uint64_t)v31, (uint64_t)v26, &qword_10001C650);
  v65 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v3 + 48);
  if (v65(v26, 1, v2) == 1)
  {
    sub_100005C04((uint64_t)v31, &qword_10001C650);
    uint64_t result = sub_100005C04((uint64_t)v26, &qword_10001C650);
    uint64_t v37 = 0;
    uint64_t v59 = 0;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v9, v26, v2);
    sub_100013C00();
    sub_100013C10();
    uint64_t v37 = sub_100011B94();
    uint64_t v59 = v38;
    sub_100005C04((uint64_t)v31, &qword_10001C650);
    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v9, v2);
  }
  uint64_t v40 = (uint64_t)v63;
  uint64_t v39 = v64;
  uint64_t v58 = v37;
  if (v67 <= 1)
  {
    uint64_t v41 = 1;
  }
  else
  {
    if (*(void *)(v64 + 16) < 2uLL)
    {
      __break(1u);
      goto LABEL_23;
    }
    (*(void (**)(char *, unint64_t, uint64_t))(v3 + 16))(v21, v64+ *(void *)(v3 + 72)+ ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80)), v2);
    uint64_t v41 = 0;
  }
  v66(v21, v41, 1, v2);
  uint64_t v42 = (uint64_t)v21;
  uint64_t v43 = v61;
  sub_10000BD8C(v42, v61, &qword_10001C650);
  sub_1000134B8(v43, (uint64_t)v18, &qword_10001C650);
  if (v65(v18, 1, v2) == 1)
  {
    sub_100005C04(v43, &qword_10001C650);
    uint64_t result = sub_100005C04((uint64_t)v18, &qword_10001C650);
    uint64_t v44 = 0;
    uint64_t v45 = 0;
  }
  else
  {
    uint64_t v46 = v57;
    (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v57, v18, v2);
    sub_100013C00();
    uint64_t v47 = v43;
    sub_100013C10();
    uint64_t v48 = sub_100011B94();
    uint64_t v45 = v49;
    uint64_t v50 = v47;
    uint64_t v44 = v48;
    sub_100005C04(v50, &qword_10001C650);
    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v46, v2);
  }
  uint64_t v51 = (uint64_t)v62;
  if (v67 <= 2)
  {
    uint64_t v52 = 1;
    goto LABEL_18;
  }
  if (*(void *)(v39 + 16) < 3uLL)
  {
LABEL_23:
    __break(1u);
    return result;
  }
  (*(void (**)(char *, unint64_t, uint64_t))(v3 + 16))(v62, v39+ ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80))+ 2 * *(void *)(v3 + 72), v2);
  uint64_t v52 = 0;
LABEL_18:
  v66((char *)v51, v52, 1, v2);
  sub_10000BD8C(v51, v40, &qword_10001C650);
  swift_bridgeObjectRelease();
  uint64_t v53 = v60;
  sub_1000134B8(v40, v60, &qword_10001C650);
  if (v65((char *)v53, 1, v2) == 1)
  {
    sub_100005C04(v40, &qword_10001C650);
    sub_100005C04(v53, &qword_10001C650);
    uint64_t v54 = 0;
  }
  else
  {
    v55 = v56;
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 32))(v56, v53, v2);
    sub_100013C00();
    sub_100013C10();
    uint64_t v54 = sub_100011B94();
    sub_100005C04(v40, &qword_10001C650);
    (*(void (**)(char *, uint64_t))(v3 + 8))(v55, v2);
  }
  return sub_100011D60(v58, v59, v44, v45, v54);
}

uint64_t sub_100012770()
{
  uint64_t v17 = sub_1000139D0();
  uint64_t v0 = *(void *)(v17 - 8);
  __chkstk_darwin(v17);
  uint64_t v2 = (char *)&v17 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_1000059C8(&qword_10001C268);
  uint64_t v4 = __chkstk_darwin(v3 - 8);
  uint64_t v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v17 - v7;
  uint64_t v9 = sub_1000059C8(&qword_10001C240);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100013AB0();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  sub_1000059C8(&qword_10001C270);
  sub_100013A90();
  sub_100013A90();
  (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(v11, 0, 1, v12);
  char v18 = 1;
  sub_1000137F0();
  uint64_t v14 = sub_100013810();
  uint64_t v15 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56);
  v15(v8, 0, 1, v14);
  v15(v6, 1, 1, v14);
  (*(void (**)(char *, void, uint64_t))(v0 + 104))(v2, enum case for InputConnectionBehavior.default(_:), v17);
  sub_10000B104();
  return sub_1000138D0();
}

uint64_t sub_100012AA4@<X0>(uint64_t a1@<X8>)
{
  return sub_10000EE38(*(void *)(v1 + 16), a1);
}

uint64_t type metadata accessor for ScreenTimeNotificationsAppIntent.ScreenTimeNotificationsView()
{
  uint64_t result = qword_10001C6D8;
  if (!qword_10001C6D8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_100012AF8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ScreenTimeNotificationsAppIntent.ScreenTimeNotificationsView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100012B5C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100013870();
  *a1 = result;
  return result;
}

uint64_t sub_100012B88@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100013870();
  *a1 = result;
  return result;
}

uint64_t sub_100012BB4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100013870();
  *a1 = result;
  return result;
}

uint64_t sub_100012BE0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1000138C0();
  *a1 = result;
  return result;
}

unint64_t sub_100012C0C()
{
  unint64_t result = qword_10001C658;
  if (!qword_10001C658)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C658);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for ScreenTimeNotificationsAppIntent.Error(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x100012D2CLL);
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

ValueMetadata *type metadata accessor for ScreenTimeNotificationsAppIntent.Error()
{
  return &type metadata for ScreenTimeNotificationsAppIntent.Error;
}

uint64_t *sub_100012D64(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  unsigned int v4 = a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v13 = *a2;
    *a1 = *a2;
    unsigned int v4 = (uint64_t *)(v13 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    uint64_t v7 = sub_100013C30();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(v4, a2, v7);
    uint64_t v8 = sub_1000059C8(&qword_10001C678);
    *(uint64_t *)((char *)v4 + *(int *)(v8 + 28)) = *(uint64_t *)((char *)a2 + *(int *)(v8 + 28));
    uint64_t v9 = *(int *)(a3 + 20);
    uint64_t v10 = (uint64_t *)((char *)v4 + v9);
    uint64_t v11 = (uint64_t *)((char *)a2 + v9);
    uint64_t v12 = v11[1];
    *uint64_t v10 = *v11;
    v10[1] = v12;
    swift_retain();
  }
  swift_retain();
  return v4;
}

uint64_t sub_100012E58(uint64_t a1)
{
  uint64_t v2 = sub_100013C30();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  sub_1000059C8(&qword_10001C678);
  swift_release();

  return swift_release();
}

uint64_t sub_100012EE8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100013C30();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = sub_1000059C8(&qword_10001C678);
  *(void *)(a1 + *(int *)(v7 + 28)) = *(void *)(a2 + *(int *)(v7 + 28));
  uint64_t v8 = *(int *)(a3 + 20);
  uint64_t v9 = (void *)(a1 + v8);
  uint64_t v10 = (void *)(a2 + v8);
  uint64_t v11 = v10[1];
  *uint64_t v9 = *v10;
  v9[1] = v11;
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t sub_100012F90(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100013C30();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = sub_1000059C8(&qword_10001C678);
  *(void *)(a1 + *(int *)(v7 + 28)) = *(void *)(a2 + *(int *)(v7 + 28));
  swift_retain();
  swift_release();
  uint64_t v8 = *(int *)(a3 + 20);
  uint64_t v9 = (void *)(a1 + v8);
  uint64_t v10 = (void *)(a2 + v8);
  *uint64_t v9 = *v10;
  v9[1] = v10[1];
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_100013054(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100013C30();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = sub_1000059C8(&qword_10001C678);
  *(void *)(a1 + *(int *)(v7 + 28)) = *(void *)(a2 + *(int *)(v7 + 28));
  *(_OWORD *)(a1 + *(int *)(a3 + 20)) = *(_OWORD *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t sub_1000130E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100013C30();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = sub_1000059C8(&qword_10001C678);
  *(void *)(a1 + *(int *)(v7 + 28)) = *(void *)(a2 + *(int *)(v7 + 28));
  swift_release();
  uint64_t v8 = *(int *)(a3 + 20);
  uint64_t v9 = (void *)(a1 + v8);
  uint64_t v10 = (uint64_t *)(a2 + v8);
  uint64_t v12 = *v10;
  uint64_t v11 = v10[1];
  *uint64_t v9 = v12;
  v9[1] = v11;
  swift_release();
  return a1;
}

uint64_t sub_100013194(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000131A8);
}

uint64_t sub_1000131A8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1000059C8(&qword_10001C678);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20) + 8);
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    int v11 = v10 - 1;
    if (v11 < 0) {
      int v11 = -1;
    }
    return (v11 + 1);
  }
}

uint64_t sub_10001327C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100013290);
}

uint64_t sub_100013290(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_1000059C8(&qword_10001C678);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20) + 8) = a2;
  }
  return result;
}

void sub_100013354()
{
  sub_1000133E8();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_1000133E8()
{
  if (!qword_10001C6E8)
  {
    sub_100013C30();
    unint64_t v0 = sub_100013E30();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_10001C6E8);
    }
  }
}

unint64_t sub_100013448()
{
  unint64_t result = qword_10001C718;
  if (!qword_10001C718)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C718);
  }
  return result;
}

uint64_t sub_10001349C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1000134B8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_1000059C8(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_10001351C(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100013564(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

unint64_t sub_100013578()
{
  unint64_t result = qword_10001C748;
  if (!qword_10001C748)
  {
    sub_100005A0C(&qword_10001C730);
    sub_100013618();
    sub_100005E60(&qword_10001C400, &qword_10001C3E0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C748);
  }
  return result;
}

unint64_t sub_100013618()
{
  unint64_t result = qword_10001C750;
  if (!qword_10001C750)
  {
    sub_100005A0C(&qword_10001C728);
    sub_100013694();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C750);
  }
  return result;
}

unint64_t sub_100013694()
{
  unint64_t result = qword_10001C758;
  if (!qword_10001C758)
  {
    sub_100005A0C(&qword_10001C720);
    sub_10001351C(&qword_10001C740, (void (*)(uint64_t))&type metadata accessor for ScreenTimeNotificationsAppIntentView);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C758);
  }
  return result;
}

uint64_t sub_100013780()
{
  return static AppIntent.openAppWhenRun.getter();
}

uint64_t sub_100013790()
{
  return static AppIntent.description.getter();
}

uint64_t sub_1000137A0()
{
  return static AppIntent.isDiscoverable.getter();
}

uint64_t sub_1000137B0()
{
  return static AppIntent.authenticationPolicy.getter();
}

uint64_t sub_1000137E0()
{
  return IntentDialog._GeneratedDialogContent.init(_:fromResult:options:fallbackDialog:)();
}

uint64_t sub_1000137F0()
{
  return IntentDialog.init(stringLiteral:)();
}

uint64_t sub_100013800()
{
  return IntentDialog.init<A, B>(from:)();
}

uint64_t sub_100013810()
{
  return type metadata accessor for IntentDialog();
}

uint64_t sub_100013820()
{
  return IntentDialog.init(_:)();
}

uint64_t sub_100013830()
{
  return static IntentResult.result<A, B>(value:dialog:view:)();
}

uint64_t sub_100013840()
{
  return static IntentResult.result<A, B>(value:dialog:content:)();
}

uint64_t sub_100013850()
{
  return EntityProperty.wrappedValue.getter();
}

uint64_t sub_100013860()
{
  return EntityProperty.wrappedValue.setter();
}

uint64_t sub_100013870()
{
  return EntityProperty.projectedValue.getter();
}

uint64_t sub_100013880()
{
  return EntityProperty<>.init(title:)();
}

uint64_t sub_100013890()
{
  return EntityProperty<>.init(title:)();
}

uint64_t sub_1000138A0()
{
  return EntityProperty<>.init(title:)();
}

uint64_t sub_1000138B0()
{
  return IntentParameter.wrappedValue.getter();
}

uint64_t sub_1000138C0()
{
  return IntentParameter.projectedValue.getter();
}

uint64_t sub_1000138D0()
{
  return IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:supportedValues:)();
}

uint64_t sub_1000138E0()
{
  return static _DialogBuilderEntity.buildBlock<A>(_:)();
}

uint64_t sub_1000138F0()
{
  return static _DialogBuilderEntity.buildBlock<A, B, C>(_:_:_:)();
}

uint64_t sub_100013900()
{
  return static _DialogBuilderEntity.buildBlock<A, B>(_:_:)();
}

uint64_t sub_100013910()
{
  return static _DialogBuilderEntity.buildExpression<A>(_:)();
}

uint64_t sub_100013920()
{
  return static _DialogBuilderEntity.buildExpression<A>(_:)();
}

uint64_t sub_100013930()
{
  return static _DialogBuilderIntent.buildBlock<A>(_:)();
}

uint64_t sub_100013940()
{
  return static _DialogBuilderIntent.buildExpression<A>(_:)();
}

uint64_t sub_100013950()
{
  return type metadata accessor for DisplayRepresentation.Image();
}

uint64_t sub_100013960()
{
  return DisplayRepresentation.init(title:subtitle:image:synonyms:)();
}

uint64_t sub_100013970()
{
  return type metadata accessor for DisplayRepresentation();
}

uint64_t sub_100013980()
{
  return IntentParameterSummary.init(_:table:)();
}

uint64_t sub_100013990()
{
  return ParameterSummaryString.StringInterpolation.appendInterpolation<A, B>(_:)();
}

void sub_1000139A0(Swift::String a1)
{
}

uint64_t sub_1000139B0()
{
  return ParameterSummaryString.StringInterpolation.init(literalCapacity:interpolationCount:)();
}

uint64_t sub_1000139C0()
{
  return ParameterSummaryString.init(stringInterpolation:)();
}

uint64_t sub_1000139D0()
{
  return type metadata accessor for InputConnectionBehavior();
}

uint64_t sub_1000139F0()
{
  return static PersistentlyIdentifiable.persistentIdentifier.getter();
}

uint64_t sub_100013A00()
{
  return type metadata accessor for _GeneratedContentOptions();
}

uint64_t sub_100013A10()
{
  return TypeDisplayRepresentation.init(name:numericFormat:)();
}

uint64_t sub_100013A20()
{
  return type metadata accessor for _GeneratedContentFallback();
}

uint64_t sub_100013A40()
{
  return type metadata accessor for DateInterval();
}

uint64_t sub_100013A50()
{
  return LocalizedError.helpAnchor.getter();
}

uint64_t sub_100013A60()
{
  return LocalizedError.failureReason.getter();
}

uint64_t sub_100013A70()
{
  return LocalizedError.recoverySuggestion.getter();
}

uint64_t sub_100013A80()
{
  return _convertNSErrorToError(_:)();
}

uint64_t sub_100013A90()
{
  return LocalizedStringResource.init(stringLiteral:)();
}

uint64_t sub_100013AA0()
{
  return LocalizedStringResource.init(stringInterpolation:)();
}

uint64_t sub_100013AB0()
{
  return type metadata accessor for LocalizedStringResource();
}

uint64_t sub_100013AC0()
{
  return URL.init(string:)();
}

uint64_t sub_100013AD0()
{
  return type metadata accessor for URL();
}

uint64_t sub_100013AE0()
{
  return static Date.now.getter();
}

uint64_t sub_100013AF0()
{
  return type metadata accessor for Date();
}

uint64_t sub_100013B00()
{
  return static Locale.current.getter();
}

uint64_t sub_100013B10()
{
  return type metadata accessor for Locale();
}

uint64_t sub_100013B20()
{
  return Calendar.weeksPreceding(date:weekCount:)();
}

uint64_t sub_100013B30()
{
  return Calendar.fullDay(for:)();
}

uint64_t sub_100013B40()
{
  return static Calendar.current.getter();
}

uint64_t sub_100013B50()
{
  return type metadata accessor for Calendar();
}

uint64_t sub_100013B60()
{
  return isFeatureEnabled(_:)();
}

uint64_t sub_100013B70()
{
  return type metadata accessor for ScreenTimeFeatureFlags();
}

uint64_t sub_100013B80()
{
  return ScreenTimeUsageAppIntentView.Model.init(allActivityModel:interval:selectedDay:)();
}

uint64_t sub_100013B90()
{
  return ScreenTimeUsageAppIntentView.Model.totalUsage.getter();
}

uint64_t sub_100013BA0()
{
  return ScreenTimeUsageAppIntentView.Model.weeklyChange.getter();
}

uint64_t sub_100013BB0()
{
  return type metadata accessor for ScreenTimeUsageAppIntentView.Model();
}

uint64_t sub_100013BC0()
{
  return ScreenTimeUsageAppIntentView.init(model:mode:selectedDay:)();
}

uint64_t sub_100013BD0()
{
  return type metadata accessor for ScreenTimeUsageAppIntentView();
}

uint64_t sub_100013BE0()
{
  return ScreenTimeNotificationsAppIntentView.Model.init(allActivityModel:mode:interval:)();
}

uint64_t sub_100013BF0()
{
  return ScreenTimeNotificationsAppIntentView.Model.appsEmittingMostNotifications.getter();
}

uint64_t sub_100013C00()
{
  return ScreenTimeNotificationsAppIntentView.Model.App.localizedName.getter();
}

uint64_t sub_100013C10()
{
  return ScreenTimeNotificationsAppIntentView.Model.App.notificationCount.getter();
}

uint64_t sub_100013C20()
{
  return type metadata accessor for ScreenTimeNotificationsAppIntentView.Model.App();
}

uint64_t sub_100013C30()
{
  return type metadata accessor for ScreenTimeNotificationsAppIntentView.Model();
}

uint64_t sub_100013C40()
{
  return ScreenTimeNotificationsAppIntentView.init(model:mode:)();
}

uint64_t sub_100013C50()
{
  return type metadata accessor for ScreenTimeNotificationsAppIntentView();
}

uint64_t sub_100013C60()
{
  return ModelProvider.allActivityModel(forInterval:userAltDSID:deviceIdentifier:)();
}

uint64_t sub_100013C80()
{
  return ModelProvider.init()();
}

uint64_t sub_100013C90()
{
  return type metadata accessor for ModelProvider();
}

uint64_t sub_100013CA0()
{
  return type metadata accessor for AllActivityView.Model();
}

uint64_t sub_100013CB0()
{
  return static AppExtension.main()();
}

uint64_t sub_100013CC0()
{
  return Logger.logObject.getter();
}

uint64_t sub_100013CD0()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_100013CE0()
{
  return type metadata accessor for Logger();
}

uint64_t sub_100013CF0()
{
  return type metadata accessor for ControlSize();
}

uint64_t sub_100013D00()
{
  return EnvironmentValues.controlSize.getter();
}

uint64_t sub_100013D10()
{
  return EnvironmentValues.controlSize.setter();
}

uint64_t sub_100013D20()
{
  return LocalizedStringKey.init(stringLiteral:)();
}

uint64_t sub_100013D30()
{
  return static HorizontalAlignment.center.getter();
}

uint64_t sub_100013D40()
{
  return _ConditionalContent<>.init(storage:)();
}

uint64_t sub_100013D50()
{
  return static HierarchicalShapeStyle.secondary.getter();
}

uint64_t sub_100013D60()
{
  return BorderedProminentButtonStyle.init()();
}

uint64_t sub_100013D70()
{
  return type metadata accessor for BorderedProminentButtonStyle();
}

uint64_t sub_100013D80()
{
  return static Edge.Set.all.getter();
}

uint64_t sub_100013D90()
{
  return Link.init(sensitiveUrl:label:)();
}

uint64_t sub_100013DA0()
{
  return Link<>.init(_:sensitiveUrl:)();
}

uint64_t sub_100013DB0()
{
  return Text.foregroundStyle<A>(_:)();
}

uint64_t sub_100013DC0()
{
  return Text.init(_:tableName:bundle:comment:)();
}

uint64_t sub_100013DD0()
{
  return static View._makeView(view:inputs:)();
}

uint64_t sub_100013DE0()
{
  return static View._makeViewList(view:inputs:)();
}

uint64_t sub_100013DF0()
{
  return View.buttonStyle<A>(_:)();
}

uint64_t sub_100013E00()
{
  return static View._viewListCount(inputs:)();
}

uint64_t sub_100013E10()
{
  return State.init(wrappedValue:)();
}

uint64_t sub_100013E20()
{
  return State.wrappedValue.getter();
}

uint64_t sub_100013E30()
{
  return type metadata accessor for State();
}

uint64_t sub_100013E40()
{
  return static Binding.constant(_:)();
}

uint64_t sub_100013E50()
{
  return static Alignment.center.getter();
}

uint64_t sub_100013E60()
{
  return String.LocalizationValue.init(stringLiteral:)();
}

void sub_100013E70(Swift::String a1)
{
}

void sub_100013E80(Swift::String a1)
{
}

uint64_t sub_100013E90()
{
  return String.LocalizationValue.StringInterpolation.init(literalCapacity:interpolationCount:)();
}

uint64_t sub_100013EA0()
{
  return type metadata accessor for String.LocalizationValue.StringInterpolation();
}

uint64_t sub_100013EB0()
{
  return type metadata accessor for String.LocalizationValue();
}

uint64_t sub_100013EC0()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100013ED0()
{
  return String.init(localized:table:bundle:locale:comment:)();
}

uint64_t sub_100013EE0()
{
  return String.hash(into:)();
}

Swift::Int sub_100013EF0()
{
  return String.UTF8View._foreignCount()();
}

NSArray sub_100013F00()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_100013F10()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_100013F20()
{
  return static MainActor.shared.getter();
}

uint64_t sub_100013F30()
{
  return type metadata accessor for MainActor();
}

uint64_t sub_100013F40()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_100013F50()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_100013F60()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_100013F70()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_100013F80()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_100013F90()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_100013FA0()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_100013FB0()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

Swift::Int sub_100013FC0(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases, string);
}

uint64_t sub_100013FD0()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_100013FE0()
{
  return Error._getEmbeddedNSError()();
}

uint64_t sub_100013FF0()
{
  return Error._code.getter();
}

uint64_t sub_100014000()
{
  return Error._domain.getter();
}

uint64_t sub_100014010()
{
  return Error._userInfo.getter();
}

uint64_t sub_100014020()
{
  return Hasher.init(_seed:)();
}

void sub_100014030(Swift::UInt a1)
{
}

Swift::Int sub_100014040()
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

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

uint64_t self
{
  return _self;
}

void objc_release(id a1)
{
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

uint64_t swift_allocError()
{
  return _swift_allocError();
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

uint64_t swift_errorInMain()
{
  return _swift_errorInMain();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_errorRetain()
{
  return _swift_errorRetain();
}

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
}

uint64_t swift_getKeyPath()
{
  return _swift_getKeyPath();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return _swift_getOpaqueTypeConformance2();
}

uint64_t swift_getSingletonMetadata()
{
  return _swift_getSingletonMetadata();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return _swift_getTypeByMangledNameInContextInMetadataState2();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}

uint64_t swift_initStructMetadata()
{
  return _swift_initStructMetadata();
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

uint64_t swift_storeEnumTagMultiPayload()
{
  return _swift_storeEnumTagMultiPayload();
}

uint64_t swift_task_alloc()
{
  return _swift_task_alloc();
}

uint64_t swift_task_dealloc()
{
  return _swift_task_dealloc();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}