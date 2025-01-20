uint64_t sub_1000021CC()
{
  uint64_t v0;

  v0 = sub_100005ED0();
  sub_100002254(v0, qword_10000C6A8);
  sub_1000022B8(v0, (uint64_t)qword_10000C6A8);
  return sub_100005EC0();
}

uint64_t *sub_100002254(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_1000022B8(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

unint64_t sub_1000022F4()
{
  unint64_t result = qword_10000C2C0;
  if (!qword_10000C2C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C2C0);
  }
  return result;
}

uint64_t sub_100002348@<X0>(uint64_t a1@<X8>)
{
  v11[1] = a1;
  sub_100006030();
  __chkstk_darwin();
  sub_100005EA0();
  __chkstk_darwin();
  uint64_t v1 = sub_100003048(&qword_10000C3A8);
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin();
  v4 = (char *)v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11[0] = sub_100003048(&qword_10000C3B0);
  uint64_t v5 = *(void *)(v11[0] - 8);
  __chkstk_darwin();
  v7 = (char *)v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100005E90();
  sub_100006070();
  type metadata accessor for AppearanceStyleStateProvider();
  uint64_t v12 = swift_allocObject();
  sub_100006020();
  sub_10000308C();
  sub_100006040();
  sub_100005F50();
  uint64_t v8 = sub_1000030E0(&qword_10000C3C0, &qword_10000C3A8);
  sub_100005F60();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  uint64_t v12 = v1;
  uint64_t v13 = v8;
  swift_getOpaqueTypeConformance2();
  uint64_t v9 = v11[0];
  sub_100005F70();
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v9);
}

uint64_t sub_100002704@<X0>(uint64_t a1@<X8>)
{
  sub_100005F50();
  uint64_t result = sub_100005F90();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = v4 & 1;
  *(void *)(a1 + 24) = v5;
  return result;
}

uint64_t sub_10000277C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100005FD0();
  *a1 = result;
  return result;
}

uint64_t sub_1000027D8()
{
  id v0 = [self systemDarkGrayColor];
  sub_100005FB0();
  return sub_100006050();
}

uint64_t sub_100002854()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t sub_100002864()
{
  id v1 = [objc_allocWithZone((Class)UISCurrentUserInterfaceStyleValue) init];
  id v2 = [v1 userInterfaceStyle];

  uint64_t v3 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return sub_100002F18(v3, v0, v2 == (id)2);
}

uint64_t sub_100002918()
{
  uint64_t v0 = sub_100005EA0();
  sub_100002254(v0, qword_10000C6C0);
  sub_1000022B8(v0, (uint64_t)qword_10000C6C0);
  return sub_100005E90();
}

uint64_t sub_10000297C()
{
  return *v0;
}

uint64_t sub_100002984(uint64_t result)
{
  *id v1 = result;
  return result;
}

uint64_t (*sub_10000298C())()
{
  return nullsub_1;
}

unint64_t sub_1000029BC()
{
  unint64_t result = qword_10000C2C8;
  if (!qword_10000C2C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C2C8);
  }
  return result;
}

unint64_t sub_100002A14()
{
  unint64_t result = qword_10000C2D0;
  if (!qword_10000C2D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C2D0);
  }
  return result;
}

uint64_t sub_100002A68()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100002A84()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100002AD4@<X0>(uint64_t a1@<X8>)
{
  if (qword_10000C2A8 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100005EA0();
  uint64_t v3 = sub_1000022B8(v2, (uint64_t)qword_10000C6C0);
  char v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

uint64_t sub_100002B84()
{
  return 0;
}

uint64_t sub_100002B94(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return _swift_task_switch(sub_100002BB4, 0, 0);
}

uint64_t sub_100002BB4()
{
  sub_100002F2C();
  sub_100005E80();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

void sub_100002C20(unsigned char *a1@<X8>)
{
  *a1 = 0;
}

uint64_t sub_100002C28(uint64_t a1)
{
  unint64_t v2 = sub_1000022F4();

  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

uint64_t type metadata accessor for AppearanceStyleStateProvider()
{
  return self;
}

unsigned char *initializeBufferWithCopyOfBuffer for SetAppearanceStyleIntent(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for SetAppearanceStyleIntent(unsigned __int8 *a1, unsigned int a2)
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
  int v8 = (v6 + 2147483646) & 0x7FFFFFFF;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for SetAppearanceStyleIntent(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x100002E04);
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

ValueMetadata *type metadata accessor for SetAppearanceStyleIntent()
{
  return &type metadata for SetAppearanceStyleIntent;
}

uint64_t sub_100002E3C()
{
  return sub_1000030E0(&qword_10000C388, &qword_10000C390);
}

uint64_t sub_100002E78(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_100002EC4()
{
  unint64_t result = qword_10000C398;
  if (!qword_10000C398)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C398);
  }
  return result;
}

uint64_t sub_100002F18(uint64_t (*a1)(uint64_t), uint64_t a2, uint64_t a3)
{
  return a1(a3);
}

void sub_100002F2C()
{
  id v0 = [objc_allocWithZone((Class)UISCurrentUserInterfaceStyleValue) init];
  if ([v0 userInterfaceStyle] == (id)2) {
    uint64_t v1 = 1;
  }
  else {
    uint64_t v1 = 2;
  }
  id v2 = [objc_allocWithZone((Class)UISUserInterfaceStyleMode) initWithDelegate:0];
  if ([v2 modeValue] == (id)102 || objc_msgSend(v2, "modeValue") == (id)100) {
    objc_msgSend(v2, "setOverride:", v1, 1);
  }
  else {
    [v2 setModeValue:v1];
  }
}

ValueMetadata *type metadata accessor for AppearanceControl()
{
  return &type metadata for AppearanceControl;
}

uint64_t sub_10000302C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100003048(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_10000308C()
{
  unint64_t result = qword_10000C3B8;
  if (!qword_10000C3B8)
  {
    type metadata accessor for AppearanceStyleStateProvider();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C3B8);
  }
  return result;
}

uint64_t sub_1000030E0(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100002E78(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100003124()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_1000031E4()
{
  unint64_t result = qword_10000C3C8;
  if (!qword_10000C3C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C3C8);
  }
  return result;
}

uint64_t sub_100003238()
{
  sub_100006030();
  __chkstk_darwin();
  sub_100005EA0();
  __chkstk_darwin();
  uint64_t v0 = sub_100003048(&qword_10000C498);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin();
  int v3 = (char *)v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100005E90();
  sub_100006070();
  type metadata accessor for FlashlightStateProvider();
  v5[1] = swift_allocObject();
  sub_100006020();
  sub_100003B3C();
  sub_100006040();
  sub_1000030E0(&qword_10000C4A8, &qword_10000C498);
  sub_100005F70();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t sub_1000034E0@<X0>(uint64_t a1@<X8>)
{
  sub_100005F50();
  uint64_t result = sub_100005F90();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = v4 & 1;
  *(void *)(a1 + 24) = v5;
  return result;
}

uint64_t sub_100003558@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100005FC0();
  *a1 = result;
  return result;
}

uint64_t sub_1000035B8()
{
  id v0 = [self systemIndigoColor];
  sub_100005FB0();
  return sub_100006050();
}

uint64_t sub_100003630()
{
  return sub_100002F18(*(uint64_t (**)(uint64_t))(v0 + 8), v0, 0);
}

uint64_t sub_10000366C()
{
  uint64_t v0 = sub_100005EA0();
  sub_100002254(v0, qword_10000C6D8);
  sub_1000022B8(v0, (uint64_t)qword_10000C6D8);
  return sub_100005E90();
}

unint64_t sub_1000036D4()
{
  unint64_t result = qword_10000C3D0;
  if (!qword_10000C3D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C3D0);
  }
  return result;
}

unint64_t sub_10000372C()
{
  unint64_t result = qword_10000C3D8;
  if (!qword_10000C3D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C3D8);
  }
  return result;
}

uint64_t sub_100003780()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10000379C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1000037EC@<X0>(uint64_t a1@<X8>)
{
  if (qword_10000C2B0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100005EA0();
  uint64_t v3 = sub_1000022B8(v2, (uint64_t)qword_10000C6D8);
  char v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

uint64_t sub_100003894(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return _swift_task_switch(sub_1000038B4, 0, 0);
}

uint64_t sub_1000038B4()
{
  sub_100005E80();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_100003918(uint64_t a1)
{
  unint64_t v2 = sub_1000031E4();

  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

uint64_t type metadata accessor for FlashlightStateProvider()
{
  return self;
}

unsigned char *storeEnumTagSinglePayload for SetFlashlightIntent(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x100003A44);
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

ValueMetadata *type metadata accessor for SetFlashlightIntent()
{
  return &type metadata for SetFlashlightIntent;
}

uint64_t sub_100003A7C()
{
  return sub_1000030E0(&qword_10000C388, &qword_10000C390);
}

unint64_t sub_100003ABC()
{
  unint64_t result = qword_10000C488;
  if (!qword_10000C488)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C488);
  }
  return result;
}

ValueMetadata *type metadata accessor for FlashlightControl()
{
  return &type metadata for FlashlightControl;
}

uint64_t sub_100003B20()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_100003B3C()
{
  unint64_t result = qword_10000C4A0;
  if (!qword_10000C4A0)
  {
    type metadata accessor for FlashlightStateProvider();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C4A0);
  }
  return result;
}

uint64_t sub_100003B90()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100003C10()
{
  uint64_t v0 = sub_100003048(&qword_10000C4B8);

  return TupleWidget.init(_:)(v0, v0);
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

unint64_t sub_100003C90()
{
  unint64_t result = qword_10000C4B0;
  if (!qword_10000C4B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C4B0);
  }
  return result;
}

ValueMetadata *type metadata accessor for ControlCenterControlsBundle()
{
  return &type metadata for ControlCenterControlsBundle;
}

uint64_t sub_100003CF4()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_100003D14()
{
  unint64_t result = qword_10000C4C0;
  if (!qword_10000C4C0)
  {
    sub_100002E78(&qword_10000C4C8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C4C0);
  }
  return result;
}

unint64_t sub_100003D74()
{
  unint64_t result = qword_10000C4D0;
  if (!qword_10000C4D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C4D0);
  }
  return result;
}

uint64_t sub_100003DC8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v26 = a1;
  uint64_t v1 = sub_100006030();
  __chkstk_darwin(v1 - 8);
  uint64_t v2 = sub_100005EA0();
  __chkstk_darwin(v2 - 8);
  uint64_t v3 = sub_100003048(&qword_10000C5B0);
  uint64_t v22 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v5 = (char *)v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100003048(&qword_10000C5B8);
  uint64_t v23 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  int v8 = (char *)v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_100003048(&qword_10000C5C0);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v24 = v9;
  uint64_t v25 = v10;
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100005E90();
  uint64_t v13 = sub_100006070();
  v21[1] = v14;
  v21[2] = v13;
  type metadata accessor for SilentModeStateProvider();
  uint64_t v27 = swift_allocObject();
  sub_100006020();
  sub_100003048(&qword_10000C5C8);
  sub_1000030E0(&qword_10000C5D0, &qword_10000C5C8);
  sub_100005B34(&qword_10000C5D8, v15, (void (*)(uint64_t))type metadata accessor for SilentModeStateProvider);
  sub_100006040();
  sub_100005F50();
  uint64_t v16 = sub_1000030E0(&qword_10000C5E0, &qword_10000C5B0);
  sub_100005F60();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v22 + 8))(v5, v3);
  NSString v17 = sub_100006060();
  MGGetBoolAnswer();

  uint64_t v27 = v3;
  uint64_t v28 = v16;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  sub_100005F80();
  (*(void (**)(char *, uint64_t))(v23 + 8))(v8, v6);
  uint64_t v27 = v6;
  uint64_t v28 = OpaqueTypeConformance2;
  swift_getOpaqueTypeConformance2();
  uint64_t v19 = v24;
  sub_100005F70();
  return (*(uint64_t (**)(char *, uint64_t))(v25 + 8))(v12, v19);
}

uint64_t sub_1000042F0@<X0>(uint64_t a1@<X8>)
{
  sub_100005F50();
  uint64_t result = sub_100005F90();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = v4 & 1;
  *(void *)(a1 + 24) = v5;
  return result;
}

uint64_t sub_100004368@<X0>(uint64_t a1@<X8>)
{
  *(void *)a1 = sub_100005F40();
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 16) = 1;
  uint64_t v2 = sub_100003048(&qword_10000C5E8);
  return sub_1000043B8((uint64_t *)(a1 + *(int *)(v2 + 44)));
}

uint64_t sub_1000043B8@<X0>(uint64_t *a1@<X8>)
{
  v44 = a1;
  uint64_t v42 = sub_100003048(&qword_10000C5F0);
  ((void (*)(void))__chkstk_darwin)();
  v43 = (uint64_t *)((char *)&v32 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v39 = sub_100006010();
  uint64_t v37 = *(void *)(v39 - 8);
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v3 = (char *)&v32 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100005FF0();
  uint64_t v35 = *(void *)(v4 - 8);
  uint64_t v36 = v4;
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v6 = (char *)&v32 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v40 = sub_100005F10();
  uint64_t v7 = *(void *)(v40 - 8);
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v9 = (char *)&v32 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v34 = sub_100003048(&qword_10000C5F8);
  uint64_t v10 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v41 = (uint64_t)&v32 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __chkstk_darwin(v10);
  uint64_t v14 = (uint64_t *)((char *)&v32 - v13);
  __chkstk_darwin(v12);
  uint64_t v38 = (uint64_t)&v32 - v15;
  sub_100005F50();
  uint64_t v16 = sub_100005F90();
  uint64_t v18 = v17;
  uint64_t v33 = v19;
  char v21 = v20 & 1;
  uint64_t v22 = sub_100005FC0();
  sub_100005FE0();
  sub_100006000();
  sub_100005B34(&qword_10000C600, 255, (void (*)(uint64_t))&type metadata accessor for ReplaceSymbolEffect);
  uint64_t v23 = v36;
  sub_100005F00();
  (*(void (**)(char *, uint64_t))(v37 + 8))(v3, v39);
  (*(void (**)(char *, uint64_t))(v35 + 8))(v6, v23);
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v25 = v43;
  uint64_t v26 = v40;
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))((char *)v43 + *(int *)(v42 + 28), v9, v40);
  *uint64_t v25 = KeyPath;
  sub_100005C0C((uint64_t)v25, (uint64_t)v14 + *(int *)(v34 + 36), &qword_10000C5F0);
  *uint64_t v14 = v22;
  swift_retain();
  sub_100005C80((uint64_t)v25, &qword_10000C5F0);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v26);
  swift_release();
  uint64_t v27 = v38;
  sub_100005BA4((uint64_t)v14, v38);
  uint64_t v28 = v41;
  sub_100005C0C(v27, v41, &qword_10000C5F8);
  v29 = v44;
  uint64_t *v44 = v16;
  v29[1] = v18;
  *((unsigned char *)v29 + 16) = v21;
  v29[3] = v33;
  uint64_t v30 = sub_100003048(&qword_10000C608);
  sub_100005C0C(v28, (uint64_t)v29 + *(int *)(v30 + 48), &qword_10000C5F8);
  sub_100005C70(v16, v18, v21);
  swift_bridgeObjectRetain();
  sub_100005C80(v27, &qword_10000C5F8);
  sub_100005C80(v28, &qword_10000C5F8);
  sub_100005CDC(v16, v18, v21);
  return swift_bridgeObjectRelease();
}

uint64_t sub_1000048E4()
{
  return sub_100006050();
}

id sub_100004974()
{
  id result = [self sharedInstance];
  if (result)
  {
    uint64_t v2 = result;
    id v3 = [result getSilentMode];

    uint64_t v4 = *(uint64_t (**)(uint64_t))(v0 + 8);
    return (id)sub_100002F18(v4, v0, (uint64_t)v3);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_100004A34()
{
  uint64_t v0 = sub_100005EA0();
  sub_100002254(v0, qword_10000C6F0);
  sub_1000022B8(v0, (uint64_t)qword_10000C6F0);
  return sub_100005E90();
}

uint64_t sub_100004A98(uint64_t a1, char a2)
{
  *(unsigned char *)(v2 + 56) = a2;
  *(void *)(v2 + 24) = a1;
  uint64_t v3 = sub_100005ED0();
  *(void *)(v2 + 32) = v3;
  *(void *)(v2 + 40) = *(void *)(v3 - 8);
  *(void *)(v2 + 48) = swift_task_alloc();
  return _swift_task_switch(sub_100004B5C, 0, 0);
}

id sub_100004B5C()
{
  uint64_t v24 = v0;
  id result = [self sharedInstance];
  if (result)
  {
    uint64_t v2 = result;
    char v3 = *(unsigned char *)(v0 + 56);
    NSString v4 = sub_100006060();
    unsigned __int8 v5 = [v2 setSilentMode:(v3 & 1) == 0 untilTime:0 reason:v4 clientType:9];

    if ((v5 & 1) == 0)
    {
      if (qword_10000C2A0 != -1) {
        swift_once();
      }
      uint64_t v7 = *(void *)(v0 + 40);
      uint64_t v6 = *(void *)(v0 + 48);
      uint64_t v8 = *(void *)(v0 + 32);
      uint64_t v9 = sub_1000022B8(v8, (uint64_t)qword_10000C6A8);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(v6, v9, v8);
      uint64_t v10 = sub_100005EB0();
      os_log_type_t v11 = sub_100006090();
      BOOL v12 = os_log_type_enabled(v10, v11);
      uint64_t v13 = *(void *)(v0 + 40);
      uint64_t v14 = *(void *)(v0 + 48);
      uint64_t v15 = *(void *)(v0 + 32);
      if (v12)
      {
        int v16 = *(unsigned __int8 *)(v0 + 56);
        uint64_t v22 = *(void *)(v0 + 48);
        uint64_t v17 = (uint8_t *)swift_slowAlloc();
        uint64_t v18 = swift_slowAlloc();
        *(_DWORD *)uint64_t v17 = 136315138;
        uint64_t v23 = v18;
        if (v16) {
          uint64_t v19 = 1735289170;
        }
        else {
          uint64_t v19 = 0x746E656C6953;
        }
        if (v16) {
          unint64_t v20 = 0xE400000000000000;
        }
        else {
          unint64_t v20 = 0xE600000000000000;
        }
        *(void *)(v0 + 16) = sub_100005400(v19, v20, &v23);
        sub_1000060A0();
        swift_bridgeObjectRelease();
        _os_log_impl((void *)&_mh_execute_header, v10, v11, "Failed to set silent mode to %s", v17, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v22, v15);
      }
      else
      {

        (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v14, v15);
      }
    }
    sub_100005E80();
    swift_task_dealloc();
    char v21 = *(uint64_t (**)(void))(v0 + 8);
    return (id)v21();
  }
  else
  {
    __break(1u);
  }
  return result;
}

unint64_t sub_100004E28()
{
  unint64_t result = qword_10000C4D8;
  if (!qword_10000C4D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C4D8);
  }
  return result;
}

unint64_t sub_100004E80()
{
  unint64_t result = qword_10000C4E0;
  if (!qword_10000C4E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C4E0);
  }
  return result;
}

uint64_t sub_100004ED4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100004EF0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100004F40@<X0>(uint64_t a1@<X8>)
{
  if (qword_10000C2B8 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100005EA0();
  uint64_t v3 = sub_1000022B8(v2, (uint64_t)qword_10000C6F0);
  NSString v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

uint64_t sub_100004FE8(uint64_t a1)
{
  char v4 = *v1;
  unsigned __int8 v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *unsigned __int8 v5 = v2;
  v5[1] = sub_100005088;
  return sub_100004A98(a1, v4);
}

uint64_t sub_100005088()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_10000517C(uint64_t a1)
{
  unint64_t v2 = sub_100003D74();

  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

uint64_t type metadata accessor for SilentModeStateProvider()
{
  return self;
}

unsigned char *storeEnumTagSinglePayload for SetSilentModeIntent(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1000052A8);
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

ValueMetadata *type metadata accessor for SetSilentModeIntent()
{
  return &type metadata for SetSilentModeIntent;
}

unint64_t sub_1000052E4()
{
  unint64_t result = qword_10000C590;
  if (!qword_10000C590)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C590);
  }
  return result;
}

uint64_t sub_100005338(uint64_t a1)
{
  uint64_t v2 = sub_100005F10();
  __chkstk_darwin(v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return sub_100005F30();
}

uint64_t sub_100005400(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_1000054D4(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_100005AA8((uint64_t)v12, *a3);
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
      sub_100005AA8((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_100005A58((uint64_t)v12);
  return v7;
}

uint64_t sub_1000054D4(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_1000060B0();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_100005690(a5, a6);
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
  uint64_t v8 = sub_1000060D0();
  if (!v8)
  {
    sub_1000060E0();
    __break(1u);
LABEL_17:
    uint64_t result = sub_1000060F0();
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

uint64_t sub_100005690(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_100005728(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_100005908(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_100005908(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_100005728(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_1000058A0(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_1000060C0();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_1000060E0();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_100006080();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_1000060F0();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_1000060E0();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_1000058A0(uint64_t a1, uint64_t a2)
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
  sub_100003048(&qword_10000C5A8);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_100005908(char a1, int64_t a2, char a3, char *a4)
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
    sub_100003048(&qword_10000C5A8);
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
  uint64_t result = sub_1000060F0();
  __break(1u);
  return result;
}

uint64_t sub_100005A58(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_100005AA8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

ValueMetadata *type metadata accessor for SilentModeControl()
{
  return &type metadata for SilentModeControl;
}

uint64_t sub_100005B18()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100005B34(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a3(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100005B7C()
{
  return sub_100005F20();
}

uint64_t sub_100005BA4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100003048(&qword_10000C5F8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100005C0C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100003048(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_100005C70(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_retain();
  }
  else {
    return swift_bridgeObjectRetain();
  }
}

uint64_t sub_100005C80(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100003048(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_100005CDC(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_100005CEC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t sub_100005E00()
{
  return static AppIntentInternal.sideEffect.getter();
}

uint64_t sub_100005E10()
{
  return static AppIntentInternal.shortcutsMetadata.getter();
}

uint64_t sub_100005E20()
{
  return static AppIntentInternal.attributionBundleIdentifier.getter();
}

uint64_t sub_100005E30()
{
  return static AppIntent.openAppWhenRun.getter();
}

uint64_t sub_100005E40()
{
  return static AppIntent.description.getter();
}

uint64_t sub_100005E50()
{
  return static AppIntent.parameterSummary.getter();
}

uint64_t sub_100005E60()
{
  return static AppIntent.authenticationPolicy.getter();
}

uint64_t sub_100005E80()
{
  return static IntentResult.result<>()();
}

uint64_t sub_100005E90()
{
  return LocalizedStringResource.init(stringLiteral:)();
}

uint64_t sub_100005EA0()
{
  return type metadata accessor for LocalizedStringResource();
}

uint64_t sub_100005EB0()
{
  return Logger.logObject.getter();
}

uint64_t sub_100005EC0()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_100005ED0()
{
  return type metadata accessor for Logger();
}

uint64_t sub_100005EF0()
{
  return static WidgetBundle.main()();
}

uint64_t sub_100005F00()
{
  return static ContentTransition.symbolEffect<A>(_:options:)();
}

uint64_t sub_100005F10()
{
  return type metadata accessor for ContentTransition();
}

uint64_t sub_100005F20()
{
  return EnvironmentValues.contentTransition.getter();
}

uint64_t sub_100005F30()
{
  return EnvironmentValues.contentTransition.setter();
}

uint64_t sub_100005F40()
{
  return static VerticalAlignment.center.getter();
}

uint64_t sub_100005F50()
{
  return LocalizedStringKey.init(stringLiteral:)();
}

uint64_t sub_100005F60()
{
  return WidgetConfiguration.description(_:)();
}

uint64_t sub_100005F70()
{
  return WidgetConfiguration.showsInSystemSpaces()();
}

uint64_t sub_100005F80()
{
  return WidgetConfiguration.enabled(_:)();
}

uint64_t sub_100005F90()
{
  return Text.init(_:tableName:bundle:comment:)();
}

uint64_t sub_100005FA0()
{
  return Color.init(uiColor:)();
}

uint64_t sub_100005FB0()
{
  return Color.init(_:)();
}

uint64_t sub_100005FC0()
{
  return Image.init(systemName:)();
}

uint64_t sub_100005FD0()
{
  return Image.init(_internalSystemName:)();
}

uint64_t sub_100005FE0()
{
  return ReplaceSymbolEffect.init()();
}

uint64_t sub_100005FF0()
{
  return type metadata accessor for ReplaceSymbolEffect();
}

uint64_t sub_100006000()
{
  return static SymbolEffectOptions.default.getter();
}

uint64_t sub_100006010()
{
  return type metadata accessor for SymbolEffectOptions();
}

uint64_t sub_100006020()
{
  return static ControlSize._1x1.getter();
}

uint64_t sub_100006030()
{
  return type metadata accessor for ControlSize();
}

uint64_t sub_100006040()
{
  return ControlToggle.init<A, B, C>(kind:intent:displayName:preferredSize:stateProvider:title:value:affordances:)();
}

uint64_t sub_100006050()
{
  return ControlAffordances.init(tint:status:actionHint:)();
}

NSString sub_100006060()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_100006070()
{
  return String.init(localized:)();
}

Swift::Int sub_100006080()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_100006090()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_1000060A0()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_1000060B0()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_1000060C0()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_1000060D0()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_1000060E0()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_1000060F0()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t MGGetBoolAnswer()
{
  return _MGGetBoolAnswer();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
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

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_arrayDestroy()
{
  return _swift_arrayDestroy();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
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

uint64_t swift_retain()
{
  return _swift_retain();
}

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}

uint64_t swift_slowDealloc()
{
  return _swift_slowDealloc();
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