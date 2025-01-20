void AXMEnableControlCenterModule()
{
  void *v0;
  unsigned __int8 v1;
  void *v2;
  unsigned __int8 v3;
  void *v4;
  objc_class *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void **v11;
  uint64_t v12;
  Class (*v13)(uint64_t);
  void *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;

  v0 = +[NSUserDefaults standardUserDefaults];
  v1 = [v0 BOOLForKey:@"AXHapticMusicNewCCModuleEnabled"];

  if ((v1 & 1) == 0)
  {
    v2 = +[NSUserDefaults standardUserDefaults];
    v3 = [v2 BOOLForKey:@"AXHapticMusicNewCCModuleEnabled"];

    if ((v3 & 1) == 0)
    {
      v16 = 0;
      v17 = &v16;
      v18 = 0x2050000000;
      v4 = (void *)qword_39B80;
      v19 = qword_39B80;
      if (!qword_39B80)
      {
        v11 = _NSConcreteStackBlock;
        v12 = 3221225472;
        v13 = sub_43AC;
        v14 = &unk_34C08;
        v15 = &v16;
        sub_43AC((uint64_t)&v11);
        v4 = (void *)v17[3];
      }
      v5 = v4;
      _Block_object_dispose(&v16, 8);
      v6 = [[v5 alloc] initWithIntent:0 controlKind:@"com.apple.accessibility.musichaptics" controlType:1 extensionBundleIdentifier:@"com.apple.AccessibilityUIServer.AccessibilityControlsExtension" containerBundleIdentifier:@"com.apple.AccessibilityUIServer" size:2];
      v16 = 0;
      v17 = &v16;
      v18 = 0x2050000000;
      v7 = (void *)qword_39B90;
      v19 = qword_39B90;
      if (!qword_39B90)
      {
        v11 = _NSConcreteStackBlock;
        v12 = 3221225472;
        v13 = sub_4574;
        v14 = &unk_34C08;
        v15 = &v16;
        sub_4574((uint64_t)&v11);
        v7 = (void *)v17[3];
      }
      v8 = v7;
      _Block_object_dispose(&v16, 8);
      v9 = [v8 sharedInstance];
      [v9 handleIconElementRequest:v6 completionHandler:&stru_34BE0];

      v10 = +[NSUserDefaults standardUserDefaults];
      [v10 setBool:1 forKey:@"AXHapticMusicNewCCModuleEnabled"];
    }
  }
}

void sub_42CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_42E8(id a1, BOOL a2, NSError *a3)
{
  BOOL v3 = a2;
  v4 = a3;
  v5 = AXLogHapticMusic();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412546;
    v7 = v4;
    __int16 v8 = 1024;
    BOOL v9 = v3;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Added Haptic Music: %@ success: %d", (uint8_t *)&v6, 0x12u);
  }
}

Class sub_43AC(uint64_t a1)
{
  sub_4404();
  Class result = objc_getClass("CCSIconElementRequest");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    sub_2D7B0();
  }
  qword_39B80 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_4404()
{
  v1[0] = 0;
  if (!qword_39B88)
  {
    v1[1] = _NSConcreteStackBlock;
    v1[2] = 3221225472;
    v1[3] = sub_4500;
    v1[4] = &unk_34C40;
    v1[5] = v1;
    long long v2 = off_34C28;
    uint64_t v3 = 0;
    qword_39B88 = _sl_dlopen();
  }
  v0 = (void *)v1[0];
  if (!qword_39B88)
  {
    v0 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v1[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t sub_4500()
{
  uint64_t result = _sl_dlopen();
  qword_39B88 = result;
  return result;
}

Class sub_4574(uint64_t a1)
{
  sub_4404();
  Class result = objc_getClass("CCSControlCenterService");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    sub_2D7D8();
  }
  qword_39B90 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_45CC()
{
  uint64_t v0 = sub_2D8F0();
  sub_2D23C(v0, HMLog);
  sub_46B4(v0, (uint64_t)HMLog);
  return sub_2D8E0();
}

uint64_t HMLog.unsafeMutableAddressor()
{
  if (qword_39BA0 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_2D8F0();

  return sub_46B4(v0, (uint64_t)HMLog);
}

uint64_t sub_46B4(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

unint64_t sub_46EC()
{
  sub_2DD10(36);
  swift_bridgeObjectRelease();
  v4._countAndFlagsBits = sub_2DE00();
  sub_2DA70(v4);
  swift_bridgeObjectRelease();
  v5._countAndFlagsBits = 0x3A63727369202CLL;
  v5._object = (void *)0xE700000000000000;
  sub_2DA70(v5);
  uint64_t v2 = *(void *)(v0 + 8);
  v1 = *(void **)(v0 + 16);
  swift_bridgeObjectRetain();
  v6._countAndFlagsBits = v2;
  v6._object = v1;
  sub_2DA70(v6);
  swift_bridgeObjectRelease();
  return 0xD000000000000019;
}

uint64_t sub_47D0(uint64_t a1, uint64_t a2)
{
  long long v2 = *(_OWORD *)(a1 + 16);
  v5[0] = *(_OWORD *)a1;
  v5[1] = v2;
  v5[2] = *(_OWORD *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 48);
  long long v3 = *(_OWORD *)(a2 + 16);
  v7[0] = *(_OWORD *)a2;
  v7[1] = v3;
  v7[2] = *(_OWORD *)(a2 + 32);
  uint64_t v8 = *(void *)(a2 + 48);
  return sub_26D88(v5, v7) & 1;
}

Swift::Int sub_482C()
{
  Swift::UInt64 v1 = *v0;
  sub_2DE90();
  sub_2DEA0(v1);
  swift_bridgeObjectRetain();
  sub_2DA50();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_2DA50();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_2DA50();
  swift_bridgeObjectRelease();
  return sub_2DEB0();
}

uint64_t sub_48F8()
{
  sub_2DEA0(*v0);
  swift_bridgeObjectRetain();
  sub_2DA50();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_2DA50();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_2DA50();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_49B4()
{
  Swift::UInt64 v1 = *v0;
  sub_2DE90();
  sub_2DEA0(v1);
  swift_bridgeObjectRetain();
  sub_2DA50();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_2DA50();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_2DA50();
  swift_bridgeObjectRelease();
  return sub_2DEB0();
}

void sub_4A7C()
{
  byte_39BB0 = 1;
  qword_39BB8 = 0xEF636973754D2E65;
}

id sub_4AA4()
{
  id result = [objc_allocWithZone((Class)type metadata accessor for AXHapticMusicServer()) init];
  qword_39BC8 = (uint64_t)result;
  return result;
}

uint64_t variable initialization expression of AXHapticMusicServer.isEnabled()
{
  return 0;
}

id variable initialization expression of AXHapticMusicServer.isActive()
{
  id v0 = [self sharedInstance];
  id v1 = [v0 hapticMusicActive];

  return v1;
}

uint64_t AXHapticMusicServer.serviceTypeForClient(withIdentifier:)()
{
  return 1;
}

uint64_t variable initialization expression of AXHapticMusicServer.engine()
{
  return 0;
}

double variable initialization expression of AXHapticMusicServer.HapticEngineTimeout()
{
  return 20.0;
}

void *variable initialization expression of AXHapticMusicServer.players()
{
  return &_swiftEmptyArrayStorage;
}

double variable initialization expression of AXHapticMusicServer.elapsedHapticPlayingTimeForTrack()
{
  return 0.0;
}

uint64_t variable initialization expression of AXHapticMusicServer.nowPlayingBundleIdentifier()
{
  return 0;
}

void variable initialization expression of AXHapticMusicServer.trackIdentifier(void *a1@<X8>)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0xE000000000000000;
  a1[3] = 0;
  a1[4] = 0xE000000000000000;
  a1[5] = 0;
  a1[6] = 0xE000000000000000;
}

uint64_t variable initialization expression of AXHapticMusicServer.queue()
{
  return sub_4C64(0xD00000000000002BLL, 0x800000000002F1A0);
}

uint64_t sub_4BA0(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_4BE4(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t variable initialization expression of AXHapticMusicServer.ahapAvailableQueue()
{
  return sub_4C64(0xD000000000000039, 0x800000000002F1D0);
}

uint64_t variable initialization expression of AXHapticMusicServer.ahapAvailableCacheQueue()
{
  return sub_4C64(0xD00000000000003ELL, 0x800000000002F210);
}

uint64_t sub_4C64(uint64_t a1, uint64_t a2)
{
  v7[1] = a1;
  v7[2] = a2;
  uint64_t v2 = sub_2DBD0();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  Swift::String v5 = (char *)v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2DBA0();
  __chkstk_darwin();
  sub_2D960();
  __chkstk_darwin();
  sub_2CAD4(0, &qword_39430);
  sub_2D950();
  _OWORD v7[3] = &_swiftEmptyArrayStorage;
  sub_27694(&qword_39438, (void (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes);
  sub_4BA0(&qword_39440);
  sub_281F8(&qword_39448, &qword_39440);
  sub_2DCB0();
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:), v2);
  return sub_2DC00();
}

unint64_t variable initialization expression of AXHapticMusicServer.ahapAvailableCache()
{
  return sub_4EBC((uint64_t)&_swiftEmptyArrayStorage);
}

unint64_t sub_4EBC(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_4BA0(&qword_39920);
  uint64_t v2 = (void *)sub_2DDD0();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (void **)(a1 + 88);
  while (1)
  {
    uint64_t v5 = (uint64_t)*(v4 - 5);
    uint64_t v6 = (uint64_t)*(v4 - 4);
    uint64_t v8 = (uint64_t)*(v4 - 3);
    uint64_t v7 = (uint64_t)*(v4 - 2);
    uint64_t v9 = (uint64_t)*(v4 - 1);
    v10 = *v4;
    long long v19 = *(_OWORD *)(v4 - 7);
    *(void *)&long long v20 = v5;
    *((void *)&v20 + 1) = v6;
    *(void *)&long long v21 = v8;
    *((void *)&v21 + 1) = v7;
    uint64_t v22 = v9;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    id v11 = v10;
    unint64_t result = sub_231E0((Swift::UInt64 *)&v19);
    if (v13) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v14 = v2[6] + 56 * result;
    long long v15 = v20;
    *(_OWORD *)uint64_t v14 = v19;
    *(_OWORD *)(v14 + 16) = v15;
    *(_OWORD *)(v14 + 32) = v21;
    *(void *)(v14 + 48) = v22;
    *(void *)(v2[7] + 8 * result) = v11;
    uint64_t v16 = v2[2];
    BOOL v17 = __OFADD__(v16, 1);
    uint64_t v18 = v16 + 1;
    if (v17) {
      goto LABEL_11;
    }
    v4 += 8;
    v2[2] = v18;
    if (!--v3)
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

unint64_t sub_5018(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_4BA0(&qword_399E8);
  uint64_t v2 = (void *)sub_2DDD0();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (id *)(a1 + 64);
  while (1)
  {
    uint64_t v5 = (uint64_t)*(v4 - 4);
    uint64_t v6 = (uint64_t)*(v4 - 3);
    uint64_t v8 = (uint64_t)*(v4 - 2);
    uint64_t v7 = (uint64_t)*(v4 - 1);
    id v9 = *v4;
    id v10 = *v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t result = sub_232B8(v5, v6);
    if (v12) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    char v13 = (uint64_t *)(v2[6] + 16 * result);
    *char v13 = v5;
    v13[1] = v6;
    uint64_t v14 = (void *)(v2[7] + 24 * result);
    *uint64_t v14 = v8;
    v14[1] = v7;
    v14[2] = v9;
    uint64_t v15 = v2[2];
    BOOL v16 = __OFADD__(v15, 1);
    uint64_t v17 = v15 + 1;
    if (v16) {
      goto LABEL_11;
    }
    v4 += 5;
    v2[2] = v17;
    if (!--v3)
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

unint64_t sub_5158(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_4BA0(&qword_398B8);
  uint64_t v2 = (void *)sub_2DDD0();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (void *)(a1 + 96);
  while (1)
  {
    uint64_t v5 = *(v4 - 6);
    uint64_t v6 = *(v4 - 5);
    uint64_t v8 = *(v4 - 4);
    uint64_t v7 = *(v4 - 3);
    uint64_t v10 = *(v4 - 2);
    uint64_t v9 = *(v4 - 1);
    uint64_t v11 = *v4;
    long long v20 = *((_OWORD *)v4 - 4);
    *(void *)&long long v21 = v5;
    *((void *)&v21 + 1) = v6;
    *(void *)&long long v22 = v8;
    *((void *)&v22 + 1) = v7;
    uint64_t v23 = v10;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t result = sub_231E0((Swift::UInt64 *)&v20);
    if (v13) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v14 = v2[6] + 56 * result;
    long long v15 = v21;
    *(_OWORD *)uint64_t v14 = v20;
    *(_OWORD *)(v14 + 16) = v15;
    *(_OWORD *)(v14 + 32) = v22;
    *(void *)(v14 + 48) = v23;
    BOOL v16 = (void *)(v2[7] + 16 * result);
    *BOOL v16 = v9;
    v16[1] = v11;
    uint64_t v17 = v2[2];
    BOOL v18 = __OFADD__(v17, 1);
    uint64_t v19 = v17 + 1;
    if (v18) {
      goto LABEL_11;
    }
    v2[2] = v19;
    v4 += 9;
    if (!--v3)
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

unint64_t sub_52C8(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_4BA0(&qword_39940);
  uint64_t v2 = sub_2DDD0();
  uint64_t v3 = (void *)v2;
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
    sub_2D1D8(v6, (uint64_t)v15, &qword_39A08);
    unint64_t result = sub_23330((uint64_t)v15);
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
    unint64_t result = (unint64_t)sub_2C65C(&v17, (_OWORD *)(v3[7] + 32 * result));
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

unint64_t sub_540C(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_4BA0(&qword_39948);
  uint64_t v2 = sub_2DDD0();
  uint64_t v3 = (void *)v2;
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
    sub_2D1D8(v6, (uint64_t)&v15, &qword_39950);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_232B8(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    long long v11 = (uint64_t *)(v3[6] + 16 * result);
    *long long v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_2C65C(&v17, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v3[2] = v14;
    v6 += 48;
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

unint64_t sub_5544(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_4BA0(&qword_39988);
  uint64_t v2 = sub_2DDD0();
  uint64_t v3 = (void *)v2;
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
    sub_2D1D8(v6, (uint64_t)&v13, &qword_39998);
    uint64_t v7 = v13;
    unint64_t result = sub_23374(v13, (uint64_t (*)(uint64_t, Swift::Int))sub_236E8);
    if (v9) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(void *)(v3[6] + 8 * result) = v7;
    unint64_t result = (unint64_t)sub_2C65C(&v14, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v10 = v3[2];
    BOOL v11 = __OFADD__(v10, 1);
    uint64_t v12 = v10 + 1;
    if (v11) {
      goto LABEL_11;
    }
    v3[2] = v12;
    v6 += 40;
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

unint64_t sub_5688(uint64_t a1, uint64_t *a2)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_4BA0(a2);
  uint64_t v3 = (void *)sub_2DDD0();
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  swift_retain();
  uint64_t v5 = (void **)(a1 + 48);
  while (1)
  {
    uint64_t v6 = (uint64_t)*(v5 - 2);
    uint64_t v7 = (uint64_t)*(v5 - 1);
    uint64_t v8 = *v5;
    swift_bridgeObjectRetain();
    id v9 = v8;
    unint64_t result = sub_232B8(v6, v7);
    if (v11) {
      break;
    }
    *(void *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v12 = (uint64_t *)(v3[6] + 16 * result);
    *uint64_t v12 = v6;
    v12[1] = v7;
    *(void *)(v3[7] + 8 * result) = v9;
    uint64_t v13 = v3[2];
    BOOL v14 = __OFADD__(v13, 1);
    uint64_t v15 = v13 + 1;
    if (v14) {
      goto LABEL_11;
    }
    v3[2] = v15;
    v5 += 3;
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

void *variable initialization expression of AXHapticMusicServer.hapticSubscriptions()
{
  return &_swiftEmptySetSingleton;
}

unint64_t variable initialization expression of AXHapticMusicServer.supportedClients()
{
  return sub_5688((uint64_t)&_swiftEmptyArrayStorage, &qword_398A8);
}

uint64_t sub_57D4()
{
  swift_bridgeObjectRelease();
  swift_defaultActor_destroy();

  return _swift_defaultActor_deallocate(v0);
}

uint64_t sub_580C()
{
  return v0;
}

uint64_t variable initialization expression of AXHapticMusicServer.statusObservers()
{
  type metadata accessor for AXHapticMusicServer.StatusObservers();
  uint64_t v0 = swift_allocObject();
  swift_defaultActor_initialize();
  *(void *)(v0 + 112) = sub_5018((uint64_t)&_swiftEmptyArrayStorage);
  return v0;
}

uint64_t type metadata accessor for AXHapticMusicServer.StatusObservers()
{
  return self;
}

id static AXHapticMusicServer.sharedInstance()()
{
  if (qword_39BC0 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)swift_dynamicCastClassUnconditional();

  return v0;
}

id sub_5930()
{
  uint64_t v1 = sub_2D8F0();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)&v15 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  id result = [self sharedAVSystemController];
  if (!result)
  {
    __break(1u);
    return result;
  }
  uint64_t v6 = result;
  id v7 = [result attributeForKey:AVSystemController_CarPlayIsConnectedAttribute];

  if (v7)
  {
    sub_2DCA0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v17, 0, sizeof(v17));
  }
  sub_28420((uint64_t)v17, (uint64_t)v18, &qword_39458);
  if (!v19)
  {
    sub_2D07C((uint64_t)v18, &qword_39458);
    goto LABEL_9;
  }
  sub_2CAD4(0, &qword_39460);
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_9:
    v0[OBJC_IVAR___AXHapticMusicServer_isSessionValid] = 1;
    goto LABEL_10;
  }
  id v8 = v16;
  unsigned __int8 v9 = [v16 BOOLValue];

  v0[OBJC_IVAR___AXHapticMusicServer_isSessionValid] = v9 ^ 1;
LABEL_10:
  if (qword_39BA0 != -1) {
    swift_once();
  }
  uint64_t v10 = sub_46B4(v1, (uint64_t)HMLog);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v4, v10, v1);
  char v11 = v0;
  uint64_t v12 = sub_2D8D0();
  os_log_type_t v13 = sub_2DB50();
  if (os_log_type_enabled(v12, v13))
  {
    BOOL v14 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)BOOL v14 = 67109120;
    LODWORD(v17[0]) = *((unsigned __int8 *)&v11->isa + OBJC_IVAR___AXHapticMusicServer_isSessionValid);
    sub_2DC80();

    _os_log_impl(&dword_0, v12, v13, "Handling media session valid status: %{BOOL}d", v14, 8u);
    swift_slowDealloc();
  }
  else
  {

    uint64_t v12 = v11;
  }

  return (id)(*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v4, v1);
}

uint64_t sub_5C4C()
{
  uint64_t v1 = sub_2D930();
  uint64_t v32 = *(void *)(v1 - 8);
  uint64_t v33 = v1;
  __chkstk_darwin(v1);
  v29 = (char *)&v27 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_2D960();
  uint64_t v30 = *(void *)(v3 - 8);
  uint64_t v31 = v3;
  __chkstk_darwin(v3);
  v28 = (char *)&v27 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_2D980();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = __chkstk_darwin(v5);
  unsigned __int8 v9 = (char *)&v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  char v11 = (char *)&v27 - v10;
  id v12 = [objc_allocWithZone((Class)STMediaStatusDomain) init];
  uint64_t v13 = OBJC_IVAR___AXHapticMusicServer_mediaDomain;
  BOOL v14 = *(void **)&v0[OBJC_IVAR___AXHapticMusicServer_mediaDomain];
  *(void *)&v0[OBJC_IVAR___AXHapticMusicServer_mediaDomain] = v12;

  uint64_t v15 = *(void **)&v0[v13];
  if (v15)
  {
    uint64_t v16 = swift_allocObject();
    swift_unknownObjectWeakInit();
    v39 = sub_282B4;
    uint64_t v40 = v16;
    aBlock = _NSConcreteStackBlock;
    uint64_t v36 = 1107296256;
    v37 = sub_68FC;
    v38 = &unk_35240;
    long long v17 = _Block_copy(&aBlock);
    id v18 = v15;
    swift_release();
    [v18 observeData:v17];
    _Block_release(v17);
  }
  id v19 = *(id *)&v0[OBJC_IVAR___AXHapticMusicServer_queue];
  sub_2D970();
  sub_2D990();
  v27 = *(void (**)(char *, uint64_t))(v6 + 8);
  v27(v9, v5);
  uint64_t v20 = swift_allocObject();
  *(void *)(v20 + 16) = v0;
  v39 = sub_282BC;
  uint64_t v40 = v20;
  aBlock = _NSConcreteStackBlock;
  uint64_t v36 = 1107296256;
  v37 = (void (*)(uint64_t, void *, uint64_t))sub_68F8;
  v38 = &unk_35290;
  long long v21 = _Block_copy(&aBlock);
  long long v22 = v0;
  uint64_t v23 = v28;
  sub_2D940();
  v34 = &_swiftEmptyArrayStorage;
  sub_27694(&qword_394A8, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_4BA0(&qword_394B0);
  sub_281F8(&qword_394B8, &qword_394B0);
  v24 = v29;
  uint64_t v25 = v33;
  sub_2DCB0();
  sub_2DBB0();
  _Block_release(v21);

  (*(void (**)(char *, uint64_t))(v32 + 8))(v24, v25);
  (*(void (**)(char *, uint64_t))(v30 + 8))(v23, v31);
  v27(v11, v5);
  return swift_release();
}

uint64_t sub_60FC()
{
  uint64_t v0 = sub_2D930();
  uint64_t v30 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v2 = (char *)&v23 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_2D960();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_2D980();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = __chkstk_darwin(v7);
  char v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v13 = (char *)&v23 - v12;
  swift_beginAccess();
  uint64_t result = swift_unknownObjectWeakLoadStrong();
  if (result)
  {
    uint64_t v15 = (void *)result;
    id v28 = *(id *)(result + OBJC_IVAR___AXHapticMusicServer_queue);
    sub_2D970();
    v27 = v13;
    sub_2D990();
    v29 = *(void (**)(char *, uint64_t))(v8 + 8);
    v29(v11, v7);
    uint64_t v16 = swift_allocObject();
    *(void *)(v16 + 16) = v15;
    aBlock[4] = sub_282BC;
    aBlock[5] = v16;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_68F8;
    aBlock[3] = &unk_352E0;
    long long v17 = _Block_copy(aBlock);
    uint64_t v26 = v7;
    id v18 = v17;
    id v25 = v15;
    id v19 = v6;
    sub_2D940();
    uint64_t v31 = &_swiftEmptyArrayStorage;
    sub_27694(&qword_394A8, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
    uint64_t v20 = v30;
    sub_4BA0(&qword_394B0);
    uint64_t v24 = v3;
    sub_281F8(&qword_394B8, &qword_394B0);
    sub_2DCB0();
    long long v22 = v27;
    long long v21 = v28;
    sub_2DBB0();
    _Block_release(v18);

    (*(void (**)(char *, uint64_t))(v20 + 8))(v2, v0);
    (*(void (**)(char *, uint64_t))(v4 + 8))(v19, v24);
    v29(v22, v26);
    return swift_release();
  }
  return result;
}

void sub_64FC(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_2D8F0();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)v28 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    uint64_t v8 = OBJC_IVAR___AXHapticMusicServer_isCameraActive;
    int v33 = v2[OBJC_IVAR___AXHapticMusicServer_isCameraActive];
    id v9 = a1;
    id v10 = [v9 cameraAttributions];
    sub_2CAD4(0, &qword_39870);
    unint64_t v11 = sub_2DAB0();

    if (v11 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v12 = sub_2DDA0();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v12 = *(void *)((char *)&dword_10 + (v11 & 0xFFFFFFFFFFFFFF8));
    }
    swift_bridgeObjectRelease();
    v2[v8] = v12 > 0;
    if (qword_39BA0 != -1) {
      swift_once();
    }
    uint64_t v13 = sub_46B4(v4, (uint64_t)HMLog);
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v13, v4);
    id v14 = v9;
    uint64_t v15 = v2;
    uint64_t v32 = v7;
    uint64_t v16 = sub_2D8D0();
    os_log_type_t v17 = sub_2DB50();
    int v18 = v17;
    if (os_log_type_enabled(v16, v17))
    {
      uint64_t v19 = swift_slowAlloc();
      uint64_t v31 = v5;
      uint64_t v20 = v19;
      uint64_t v30 = swift_slowAlloc();
      uint64_t v35 = v30;
      int v21 = v2[v8];
      *(_DWORD *)uint64_t v20 = 67109378;
      LODWORD(v34) = v21;
      sub_2DC80();

      *(_WORD *)(v20 + 8) = 2080;
      v28[1] = v20 + 10;
      id v22 = [v14 cameraAttributions];
      sub_2DAB0();
      int v29 = v18;

      uint64_t v23 = sub_2DAC0();
      uint64_t v24 = v4;
      uint64_t v25 = v8;
      unint64_t v27 = v26;
      swift_bridgeObjectRelease();
      uint64_t v34 = sub_22B88(v23, v27, &v35);
      sub_2DC80();
      uint64_t v8 = v25;
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_0, v16, (os_log_type_t)v29, "Camera active: %{BOOL}d for: %s", (uint8_t *)v20, 0x12u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(char *, uint64_t))(v31 + 8))(v32, v24);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v5 + 8))(v32, v4);
    }
    if (v33 != v2[v8]) {
      sub_6984();
    }
  }
  else
  {
    v2[OBJC_IVAR___AXHapticMusicServer_isCameraActive] = 0;
  }
}

void sub_68FC(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = *(void (**)(void *, uint64_t))(a1 + 32);
  swift_retain();
  id v6 = a2;
  swift_unknownObjectRetain();
  v5(a2, a3);
  swift_release();
  swift_unknownObjectRelease();
}

void sub_6984()
{
  uint64_t v67 = sub_2D8F0();
  uint64_t v1 = *(void *)(v67 - 8);
  uint64_t v2 = __chkstk_darwin(v67);
  v62 = &v57[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v4 = __chkstk_darwin(v2);
  v64 = &v57[-v5];
  uint64_t v6 = __chkstk_darwin(v4);
  v65 = &v57[-v7];
  uint64_t v8 = __chkstk_darwin(v6);
  id v10 = &v57[-v9];
  __chkstk_darwin(v8);
  uint64_t v12 = &v57[-v11];
  id v13 = [self processInfo];
  id v14 = (char *)[v13 thermalState];

  if (qword_39BA0 != -1) {
    swift_once();
  }
  v66 = v10;
  uint64_t v15 = v67;
  uint64_t v16 = sub_46B4(v67, (uint64_t)HMLog);
  swift_beginAccess();
  os_log_type_t v17 = *(void (**)(unsigned char *, uint64_t, uint64_t))(v1 + 16);
  v17(v12, v16, v15);
  v68 = v0;
  int v18 = sub_2D8D0();
  os_log_type_t v19 = sub_2DB80();
  if (os_log_type_enabled(v18, v19))
  {
    BOOL v58 = v14 != (unsigned char *)&dword_0 + 3;
    uint64_t v20 = (_DWORD *)swift_slowAlloc();
    v59 = v14;
    int v21 = v20;
    *uint64_t v20 = 67110400;
    LODWORD(aBlock) = _AXSHapticMusicEnabled() != 0;
    uint64_t v61 = v16;
    sub_2DC80();
    v60 = v17;
    id v22 = v68;
    uint64_t v63 = v1;
    *((_WORD *)v21 + 4) = 1024;
    LODWORD(aBlock) = *((unsigned __int8 *)&v22->isa + OBJC_IVAR___AXHapticMusicServer_isActive);
    sub_2DC80();
    *((_WORD *)v21 + 7) = 1024;
    LODWORD(aBlock) = *((unsigned __int8 *)&v22->isa + OBJC_IVAR___AXHapticMusicServer_isSessionValid);
    sub_2DC80();
    *((_WORD *)v21 + 10) = 1024;
    LODWORD(aBlock) = v58;
    sub_2DC80();
    *((_WORD *)v21 + 13) = 1024;
    LODWORD(aBlock) = *((unsigned __int8 *)&v22->isa + OBJC_IVAR___AXHapticMusicServer_siriActive);
    sub_2DC80();
    *((_WORD *)v21 + 16) = 1024;
    uint64_t v1 = v63;
    LODWORD(aBlock) = *((unsigned __int8 *)&v22->isa + OBJC_IVAR___AXHapticMusicServer_isCameraActive);
    uint64_t v16 = v61;
    sub_2DC80();

    os_log_type_t v17 = v60;
    os_log_type_t v23 = v19;
    uint64_t v24 = v59;
    _os_log_impl(&dword_0, v18, v23, "Checking status of server: Enabled: %{BOOL}d, active: %{BOOL}d, session valid: %{BOOL}d, thermal state: %{BOOL}d, siri active: %{BOOL}d, camera active: %{BOOL}d", (uint8_t *)v21, 0x26u);
    swift_slowDealloc();
  }
  else
  {

    int v18 = v68;
    uint64_t v24 = v14;
  }

  uint64_t v25 = *(void (**)(unsigned char *, uint64_t))(v1 + 8);
  v25(v12, v67);
  if (v24 == (unsigned char *)&dword_0 + 3
    || (*((unsigned char *)&v68->isa + OBJC_IVAR___AXHapticMusicServer_siriActive) & 1) != 0
    || *((unsigned char *)&v68->isa + OBJC_IVAR___AXHapticMusicServer_isCameraActive) == 1)
  {
    unint64_t v26 = v66;
    uint64_t v27 = v16;
    id v28 = v17;
    v17(v66, v16, v67);
    int v29 = sub_2D8D0();
    os_log_type_t v30 = sub_2DB80();
    if (os_log_type_enabled(v29, v30))
    {
      uint64_t v31 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v31 = 0;
      _os_log_impl(&dword_0, v29, v30, "System in state where haptics can't play", v31, 2u);
      swift_slowDealloc();
    }

    uint64_t v32 = v25;
    v25(v26, v67);
    uint64_t v33 = OBJC_IVAR___AXHapticMusicServer_isEnabled;
    if (*((unsigned char *)&v68->isa + OBJC_IVAR___AXHapticMusicServer_isEnabled) == 1)
    {
      uint64_t v34 = v65;
      v28(v65, v27, v67);
      uint64_t v35 = sub_2D8D0();
      os_log_type_t v36 = sub_2DB50();
      if (os_log_type_enabled(v35, v36))
      {
        v37 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v37 = 0;
        _os_log_impl(&dword_0, v35, v36, "Stopping haptic music", v37, 2u);
        swift_slowDealloc();
      }

      v32(v34, v67);
      v38 = v68;
      *((unsigned char *)&v68->isa + v33) = 0;
      v39 = (char *)v38 + OBJC_IVAR___AXHapticMusicServer_trackIdentifier;
      *(void *)v39 = 0;
      *((void *)v39 + 1) = 0;
      *((void *)v39 + 2) = 0xE000000000000000;
      *((void *)v39 + 3) = 0;
      *((void *)v39 + 4) = 0xE000000000000000;
      *((void *)v39 + 5) = 0;
      *((void *)v39 + 6) = 0xE000000000000000;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v40 = v38;
      sub_2A010(v40, (uint64_t)v40, (uint64_t)&unk_35728, sub_29F94, &unk_35740);
    }
    v41 = *(Class *)((char *)&v68->isa + OBJC_IVAR___AXHapticMusicServer_engine);
    if (v41)
    {
      uint64_t v42 = swift_allocObject();
      swift_unknownObjectWeakInit();
      v73 = sub_2837C;
      uint64_t v74 = v42;
      aBlock = _NSConcreteStackBlock;
      uint64_t v70 = 1107296256;
      v43 = &unk_354E8;
LABEL_17:
      v71 = sub_15258;
      v72 = v43;
      v44 = _Block_copy(&aBlock);
      id v45 = v41;
      swift_release();
      [v45 stopWithCompletionHandler:v44];
      _Block_release(v44);
    }
  }
  else
  {
    v46 = v25;
    if (_AXSHapticMusicEnabled()
      && *((unsigned char *)&v68->isa + OBJC_IVAR___AXHapticMusicServer_isActive) == 1
      && *((unsigned char *)&v68->isa + OBJC_IVAR___AXHapticMusicServer_isSessionValid) == 1)
    {
      AXMEnableControlCenterModule();
      sub_7444();
      if (*((unsigned char *)&v68->isa + OBJC_IVAR___AXHapticMusicServer_isEnabled) == 1)
      {
        sub_7AF0();
      }
      else
      {
        sub_7F50(1);
        AXHapticMusicServer.startHapticMusic()();
      }
    }
    else
    {
      v47 = v68;
      sub_7F50(0);
      uint64_t v48 = OBJC_IVAR___AXHapticMusicServer_isEnabled;
      if (*((unsigned char *)&v47->isa + OBJC_IVAR___AXHapticMusicServer_isEnabled) == 1)
      {
        v49 = v64;
        v17(v64, v16, v67);
        v50 = sub_2D8D0();
        os_log_type_t v51 = sub_2DB50();
        if (os_log_type_enabled(v50, v51))
        {
          v52 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v52 = 0;
          _os_log_impl(&dword_0, v50, v51, "Stopping haptic music", v52, 2u);
          swift_slowDealloc();
        }

        v46(v49, v67);
        v53 = v68;
        *((unsigned char *)&v68->isa + v48) = 0;
        v54 = (char *)v53 + OBJC_IVAR___AXHapticMusicServer_trackIdentifier;
        *(void *)v54 = 0;
        *((void *)v54 + 1) = 0;
        *((void *)v54 + 2) = 0xE000000000000000;
        *((void *)v54 + 3) = 0;
        *((void *)v54 + 4) = 0xE000000000000000;
        *((void *)v54 + 5) = 0;
        *((void *)v54 + 6) = 0xE000000000000000;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v55 = v53;
        sub_2A010(v55, (uint64_t)v55, (uint64_t)&unk_35728, sub_29F94, &unk_35740);
      }
      v41 = *(Class *)((char *)&v68->isa + OBJC_IVAR___AXHapticMusicServer_engine);
      if (v41)
      {
        uint64_t v56 = swift_allocObject();
        swift_unknownObjectWeakInit();
        v73 = sub_2837C;
        uint64_t v74 = v56;
        aBlock = _NSConcreteStackBlock;
        uint64_t v70 = 1107296256;
        v43 = &unk_354C0;
        goto LABEL_17;
      }
    }
  }
}

void sub_7444()
{
  uint64_t v2 = v0;
  uint64_t v3 = sub_2D8F0();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v44 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = OBJC_IVAR___AXHapticMusicServer_engine;
  if (!*(void *)&v2[OBJC_IVAR___AXHapticMusicServer_engine])
  {
    id v8 = [self auxiliarySession];
    uint64_t v9 = OBJC_IVAR___AXHapticMusicServer_audioSession;
    id v10 = *(void **)&v2[OBJC_IVAR___AXHapticMusicServer_audioSession];
    *(void *)&v2[OBJC_IVAR___AXHapticMusicServer_audioSession] = v8;

    uint64_t v11 = *(void **)&v2[v9];
    if (v11)
    {
      aBlock = 0;
      if (![v11 setCategory:AVAudioSessionCategoryAmbient withOptions:1 error:&aBlock])
      {
        uint64_t v27 = aBlock;
        sub_2D810();

        swift_willThrow();
        return;
      }
      uint64_t v12 = aBlock;
    }
    id v13 = [self defaultCenter];
    [v13 addObserver:v2 selector:"handleAudioSessionInterruptionNotificationWithNotification:" name:AVAudioSessionInterruptionNotification object:*(void *)&v2[v9]];

    id v14 = *(void **)&v2[v9];
    id v15 = objc_allocWithZone((Class)CHHapticEngine);
    aBlock = 0;
    id v16 = v14;
    id v17 = [v15 initWithAudioSession:v16 error:&aBlock];
    int v18 = aBlock;
    if (v17)
    {
      uint64_t v49 = v1;

      os_log_type_t v19 = *(void **)&v2[v7];
      *(void *)&v2[v7] = v17;

      if (qword_39BA0 != -1) {
        swift_once();
      }
      uint64_t v20 = sub_46B4(v3, (uint64_t)HMLog);
      swift_beginAccess();
      (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v20, v3);
      int v21 = v2;
      id v22 = sub_2D8D0();
      os_log_type_t v23 = sub_2DB80();
      if (os_log_type_enabled(v22, v23))
      {
        v47 = v21;
        uint64_t v24 = (uint8_t *)swift_slowAlloc();
        v46 = (void *)swift_slowAlloc();
        uint64_t v48 = v24;
        *(_DWORD *)uint64_t v24 = 138412290;
        uint64_t v25 = *(void ***)&v2[v7];
        os_log_t v45 = v22;
        if (v25)
        {
          aBlock = v25;
          v44 = &v51;
          unint64_t v26 = v25;
        }
        else
        {
          aBlock = 0;
        }
        sub_2DC80();
        void *v46 = v25;
        int v21 = v47;

        os_log_type_t v29 = v23;
        os_log_t v30 = v45;
        _os_log_impl(&dword_0, v45, v29, "Make engine: %@", v48, 0xCu);
        sub_4BA0(&qword_39500);
        swift_arrayDestroy();
        id v22 = v30;
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {
      }
      (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
      uint64_t v31 = *(void **)&v2[v7];
      if (v31)
      {
        id v32 = v31;
        [v32 setPlaysHapticsOnly:1];
        [v32 setAutoShutdownEnabled:0];
        uint64_t v33 = swift_allocObject();
        *(void *)(v33 + 16) = v21;
        uint64_t v34 = (void *)swift_allocObject();
        v34[2] = v21;
        v34[3] = sub_28524;
        v34[4] = v33;
        v54 = sub_2856C;
        v55 = v34;
        aBlock = _NSConcreteStackBlock;
        uint64_t v51 = 1107296256;
        v52 = (uint64_t (*)())sub_BD88;
        v53 = &unk_35560;
        uint64_t v35 = _Block_copy(&aBlock);
        os_log_type_t v36 = v21;
        v37 = v35;
        v38 = v36;
        swift_retain();
        swift_release();
        [v32 setStoppedHandler:v37];
        _Block_release(v37);
        uint64_t v39 = swift_allocObject();
        *(void *)(v39 + 16) = sub_28524;
        *(void *)(v39 + 24) = v33;
        v54 = sub_285B0;
        v55 = (void *)v39;
        aBlock = _NSConcreteStackBlock;
        uint64_t v51 = 1107296256;
        v52 = sub_68F8;
        v53 = &unk_355B0;
        uint64_t v40 = _Block_copy(&aBlock);
        swift_retain();
        swift_release();
        [v32 setResetHandler:v40];
        _Block_release(v40);
        uint64_t v41 = swift_allocObject();
        *(void *)(v41 + 16) = v38;
        v54 = sub_285B8;
        v55 = (void *)v41;
        aBlock = _NSConcreteStackBlock;
        uint64_t v51 = 1107296256;
        v52 = (uint64_t (*)())sub_C374;
        v53 = &unk_35600;
        uint64_t v42 = _Block_copy(&aBlock);
        v43 = v38;
        swift_release();
        [v32 notifyWhenPlayersFinished:v42];
        _Block_release(v42);
        swift_release();
      }
    }
    else
    {
      id v28 = v18;
      sub_2D810();

      swift_willThrow();
    }
  }
}

void sub_7AF0()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_2D8F0();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  uint64_t v6 = (char *)&aBlock[-1] - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  id v8 = (char *)&aBlock[-1] - v7;
  uint64_t v9 = OBJC_IVAR___AXHapticMusicServer_isEnabled;
  if (v1[OBJC_IVAR___AXHapticMusicServer_isEnabled] == 1
    && v1[OBJC_IVAR___AXHapticMusicServer_isActive] == 1
    && _AXSHapticMusicEnabled())
  {
    if (qword_39BA0 != -1) {
      swift_once();
    }
    uint64_t v10 = sub_46B4(v2, (uint64_t)HMLog);
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v6, v10, v2);
    uint64_t v11 = sub_2D8D0();
    os_log_type_t v12 = sub_2DB80();
    if (os_log_type_enabled(v11, v12))
    {
      id v13 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v13 = 0;
      _os_log_impl(&dword_0, v11, v12, "Music state changed, Requesting now playing client", v13, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
    MRMediaRemoteGetLocalOrigin();
    id v14 = *(void **)&v1[OBJC_IVAR___AXHapticMusicServer_queue];
    uint64_t v15 = swift_allocObject();
    *(void *)(v15 + 16) = v1;
    aBlock[4] = sub_29F9C;
    aBlock[5] = v15;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_148E0;
    aBlock[3] = &unk_357B8;
    id v16 = _Block_copy(aBlock);
    id v17 = v1;
    id v18 = v14;
    swift_release();
    MRMediaRemoteGetNowPlayingClientForOrigin();
    _Block_release(v16);
  }
  else
  {
    if (qword_39BA0 != -1) {
      swift_once();
    }
    uint64_t v19 = sub_46B4(v2, (uint64_t)HMLog);
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v8, v19, v2);
    uint64_t v20 = v1;
    int v21 = sub_2D8D0();
    os_log_type_t v22 = sub_2DB80();
    if (os_log_type_enabled(v21, v22))
    {
      uint64_t v23 = swift_slowAlloc();
      int v24 = v1[v9];
      *(_DWORD *)uint64_t v23 = 67109632;
      int v27 = v24;
      sub_2DC80();
      *(_WORD *)(v23 + 8) = 1024;
      int v27 = v20[OBJC_IVAR___AXHapticMusicServer_isActive];
      sub_2DC80();

      *(_WORD *)(v23 + 14) = 1024;
      int v27 = _AXSHapticMusicEnabled() != 0;
      sub_2DC80();
      _os_log_impl(&dword_0, v21, v22, "Music state changed, but not processing because its off %{BOOL}d %{BOOL}d %{BOOL}d", (uint8_t *)v23, 0x14u);
      swift_slowDealloc();
    }
    else
    {
    }
    (*(void (**)(char *, uint64_t))(v3 + 8))(v8, v2);
  }
}

void sub_7F50(char a1)
{
  MRMediaRemoteSetWantsNowPlayingNotifications();
  sub_4BA0(&qword_39898);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_2E930;
  uint64_t v4 = (void *)kMRMediaRemoteNowPlayingInfoDidChangeNotification;
  if (!kMRMediaRemoteNowPlayingInfoDidChangeNotification)
  {
    __break(1u);
    goto LABEL_13;
  }
  *(void *)(v3 + 32) = kMRMediaRemoteNowPlayingInfoDidChangeNotification;
  uint64_t v5 = (void *)kMRMediaRemoteNowPlayingApplicationIsPlayingDidChangeNotification;
  if (!kMRMediaRemoteNowPlayingApplicationIsPlayingDidChangeNotification)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  *(void *)(v3 + 40) = kMRMediaRemoteNowPlayingApplicationIsPlayingDidChangeNotification;
  uint64_t v6 = (void *)kMRMediaRemoteNowPlayingApplicationPlaybackStateDidChangeNotification;
  if (!kMRMediaRemoteNowPlayingApplicationPlaybackStateDidChangeNotification)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  *(void *)(v3 + 48) = kMRMediaRemoteNowPlayingApplicationPlaybackStateDidChangeNotification;
  uint64_t v7 = (void *)kMRMediaRemoteNowPlayingPlayerDidChange;
  if (!kMRMediaRemoteNowPlayingPlayerDidChange)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  *(void *)(v3 + 56) = kMRMediaRemoteNowPlayingPlayerDidChange;
  unint64_t v14 = v3;
  sub_2DAD0();
  id v8 = v4;
  id v9 = v5;
  id v10 = v6;
  id v11 = v7;
  sub_94F0(a1 & 1, v14);
  swift_bridgeObjectRelease();
  os_log_type_t v12 = CFNotificationCenterGetLocalCenter();
  id v13 = v12;
  if ((a1 & 1) == 0)
  {
    if (kMRMediaRemoteNowPlayingApplicationDidChangeNotification)
    {
      CFNotificationCenterRemoveObserver(v12, v1, kMRMediaRemoteNowPlayingApplicationDidChangeNotification, 0);
      goto LABEL_9;
    }
LABEL_16:
    __break(1u);
    return;
  }
  CFNotificationCenterAddObserver(v12, v1, (CFNotificationCallback)sub_12B6C, kMRMediaRemoteNowPlayingApplicationDidChangeNotification, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
LABEL_9:
}

void sub_80C8(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_2D8F0();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    if (qword_39BA0 != -1) {
      swift_once();
    }
    uint64_t v8 = sub_46B4(v4, (uint64_t)HMLog);
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v8, v4);
    id v9 = sub_2D8D0();
    os_log_type_t v10 = sub_2DB80();
    if (os_log_type_enabled(v9, v10))
    {
      id v11 = (uint8_t *)swift_slowAlloc();
      v15[1] = v2;
      os_log_type_t v12 = v11;
      *(_DWORD *)id v11 = 134217984;
      id v13 = [self processInfo];
      id v14 = [v13 thermalState];

      _OWORD v15[2] = v14;
      sub_2DC80();
      _os_log_impl(&dword_0, v9, v10, "Updating thermal state to %ld", v12, 0xCu);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    sub_6984();
  }
}

void sub_835C(char a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_2D8F0();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin(v4);
  uint64_t v8 = (char *)&aBlock[-1] - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __chkstk_darwin(v6);
  id v11 = (char *)&aBlock[-1] - v10;
  __chkstk_darwin(v9);
  id v13 = (char *)&aBlock[-1] - v12;
  if (a1)
  {
    os_log_type_t v36 = v2;
    if (qword_39BA0 != -1) {
      swift_once();
    }
    uint64_t v14 = sub_46B4(v4, (uint64_t)HMLog);
    swift_beginAccess();
    uint64_t v15 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
    v15(v13, v14, v4);
    id v16 = sub_2D8D0();
    os_log_type_t v17 = sub_2DB80();
    if (os_log_type_enabled(v16, v17))
    {
      id v18 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v18 = 0;
      _os_log_impl(&dword_0, v16, v17, "Interrupt started", v18, 2u);
      swift_slowDealloc();
    }

    uint64_t v19 = *(void (**)(char *, uint64_t))(v5 + 8);
    v19(v13, v4);
    uint64_t v20 = OBJC_IVAR___AXHapticMusicServer_isEnabled;
    int v21 = v36;
    if (v36[OBJC_IVAR___AXHapticMusicServer_isEnabled] == 1)
    {
      v15(v11, v14, v4);
      os_log_type_t v22 = sub_2D8D0();
      os_log_type_t v23 = sub_2DB50();
      if (os_log_type_enabled(v22, v23))
      {
        int v24 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)int v24 = 0;
        _os_log_impl(&dword_0, v22, v23, "Stopping haptic music", v24, 2u);
        swift_slowDealloc();
      }

      v19(v11, v4);
      int v21 = v36;
      v36[v20] = 0;
      uint64_t v25 = &v21[OBJC_IVAR___AXHapticMusicServer_trackIdentifier];
      *(void *)uint64_t v25 = 0;
      *((void *)v25 + 1) = 0;
      *((void *)v25 + 2) = 0xE000000000000000;
      *((void *)v25 + 3) = 0;
      *((void *)v25 + 4) = 0xE000000000000000;
      *((void *)v25 + 5) = 0;
      *((void *)v25 + 6) = 0xE000000000000000;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      unint64_t v26 = v21;
      sub_2A010(v26, (uint64_t)v26, (uint64_t)&unk_35728, sub_29F94, &unk_35740);
    }
    int v27 = *(void **)&v21[OBJC_IVAR___AXHapticMusicServer_engine];
    if (v27)
    {
      uint64_t v28 = swift_allocObject();
      swift_unknownObjectWeakInit();
      aBlock[4] = sub_2837C;
      aBlock[5] = v28;
      aBlock[0] = _NSConcreteStackBlock;
      aBlock[1] = 1107296256;
      aBlock[2] = sub_15258;
      aBlock[3] = &unk_353A8;
      os_log_type_t v29 = _Block_copy(aBlock);
      id v30 = v27;
      swift_release();
      [v30 stopWithCompletionHandler:v29];
      _Block_release(v29);
    }
  }
  else
  {
    if (qword_39BA0 != -1) {
      swift_once();
    }
    uint64_t v31 = sub_46B4(v4, (uint64_t)HMLog);
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v8, v31, v4);
    id v32 = sub_2D8D0();
    os_log_type_t v33 = sub_2DB80();
    if (os_log_type_enabled(v32, v33))
    {
      uint64_t v34 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v34 = 0;
      _os_log_impl(&dword_0, v32, v33, "Interrupt ended", v34, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
    AXHapticMusicServer.startHapticMusic()();
    sub_6984(v35);
  }
}

uint64_t sub_8868(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_2D930();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_2D960();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  id v11 = (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = (uint64_t)[a1 userInfo];
  if (result)
  {
    id v13 = (void *)result;
    uint64_t v26 = v5;
    uint64_t v14 = sub_2D9E0();

    uint64_t v28 = sub_2DA30();
    uint64_t v29 = v15;
    sub_2DCF0();
    if (*(void *)(v14 + 16) && (unint64_t v16 = sub_23330((uint64_t)aBlock), (v17 & 1) != 0))
    {
      sub_27554(*(void *)(v14 + 56) + 32 * v16, (uint64_t)&v30);
    }
    else
    {
      long long v30 = 0u;
      long long v31 = 0u;
    }
    swift_bridgeObjectRelease();
    sub_27204((uint64_t)aBlock);
    if (*((void *)&v31 + 1))
    {
      uint64_t result = swift_dynamicCast();
      if (result)
      {
        uint64_t v18 = v28;
        uint64_t v19 = *(void **)&v2[OBJC_IVAR___AXHapticMusicServer_queue];
        uint64_t v20 = (void *)swift_allocObject();
        v20[2] = a1;
        v20[3] = v2;
        v20[4] = v18;
        aBlock[4] = sub_28370;
        aBlock[5] = v20;
        aBlock[0] = _NSConcreteStackBlock;
        aBlock[1] = 1107296256;
        aBlock[2] = sub_68F8;
        aBlock[3] = &unk_35380;
        int v21 = _Block_copy(aBlock);
        id v22 = v19;
        id v23 = a1;
        int v24 = v2;
        sub_2D940();
        *(void *)&long long v30 = &_swiftEmptyArrayStorage;
        sub_27694(&qword_394A8, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
        sub_4BA0(&qword_394B0);
        sub_281F8(&qword_394B8, &qword_394B0);
        sub_2DCB0();
        sub_2DBF0();
        _Block_release(v21);

        (*(void (**)(char *, uint64_t))(v26 + 8))(v7, v4);
        (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
        return swift_release();
      }
    }
    else
    {
      return sub_2D07C((uint64_t)&v30, &qword_39458);
    }
  }
  return result;
}

void sub_8C40(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2D8F0();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_39BA0 != -1) {
    swift_once();
  }
  uint64_t v10 = sub_46B4(v6, (uint64_t)HMLog);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v10, v6);
  id v11 = a1;
  uint64_t v12 = sub_2D8D0();
  os_log_type_t v13 = sub_2DB80();
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v21 = a2;
    uint64_t v14 = (uint8_t *)swift_slowAlloc();
    uint64_t v18 = (void *)swift_slowAlloc();
    uint64_t v19 = v9;
    *(_DWORD *)uint64_t v14 = 138412290;
    id v22 = v11;
    uint64_t v15 = v11;
    uint64_t v20 = v7;
    uint64_t v16 = v6;
    char v17 = v15;
    uint64_t v9 = v19;
    sub_2DC80();
    *uint64_t v18 = v11;

    uint64_t v6 = v16;
    uint64_t v7 = v20;
    _os_log_impl(&dword_0, v12, v13, "Handling interrupt %@", v14, 0xCu);
    sub_4BA0(&qword_39500);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    uint64_t v12 = v11;
  }

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  sub_835C(a3 == 1);
}

uint64_t sub_8F38(void *a1)
{
  uint64_t v3 = sub_2D930();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17[0] = sub_2D960();
  uint64_t v7 = *(void *)(v17[0] - 8);
  __chkstk_darwin(v17[0]);
  uint64_t v9 = (char *)v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *(void **)&v1[OBJC_IVAR___AXHapticMusicServer_queue];
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v1;
  *(void *)(v11 + 24) = a1;
  aBlock[4] = sub_28328;
  aBlock[5] = v11;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_68F8;
  aBlock[3] = &unk_35330;
  uint64_t v12 = _Block_copy(aBlock);
  id v13 = v10;
  uint64_t v14 = v1;
  id v15 = a1;
  sub_2D940();
  v17[1] = &_swiftEmptyArrayStorage;
  sub_27694(&qword_394A8, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_4BA0(&qword_394B0);
  sub_281F8(&qword_394B8, &qword_394B0);
  sub_2DCB0();
  sub_2DBF0();
  _Block_release(v12);

  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  (*(void (**)(char *, void))(v7 + 8))(v9, v17[0]);
  return swift_release();
}

void sub_9208(uint64_t a1, void *a2)
{
  uint64_t v4 = sub_2D8F0();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_5930();
  if (qword_39BA0 != -1) {
    swift_once();
  }
  uint64_t v8 = sub_46B4(v4, (uint64_t)HMLog);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v8, v4);
  uint64_t v9 = a2;
  uint64_t v10 = sub_2D8D0();
  os_log_type_t v11 = sub_2DB50();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v21 = a1;
    uint64_t v12 = (uint8_t *)swift_slowAlloc();
    uint64_t v13 = swift_slowAlloc();
    uint64_t v19 = v7;
    uint64_t v14 = (void *)v13;
    *(_DWORD *)uint64_t v12 = 138412290;
    id v22 = v9;
    id v15 = v9;
    uint64_t v20 = v5;
    uint64_t v16 = v4;
    char v17 = v15;
    sub_2DC80();
    *uint64_t v14 = v9;

    uint64_t v4 = v16;
    uint64_t v5 = v20;
    _os_log_impl(&dword_0, v10, v11, "Active route changed %@", v12, 0xCu);
    sub_4BA0(&qword_39500);
    swift_arrayDestroy();
    uint64_t v7 = v19;
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    uint64_t v10 = v9;
  }

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  sub_6984();
}

uint64_t sub_94F0(char a1, unint64_t a2)
{
  uint64_t v3 = v2;
  int v6 = a1 & 1;
  uint64_t v7 = sub_2D8F0();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t result = __chkstk_darwin(v7);
  os_log_type_t v11 = (char *)v31 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = OBJC_IVAR___AXHapticMusicServer_observersEnabled;
  if (v3[OBJC_IVAR___AXHapticMusicServer_observersEnabled] != v6)
  {
    if (qword_39BA0 != -1) {
      swift_once();
    }
    uint64_t v13 = sub_46B4(v7, (uint64_t)HMLog);
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v11, v13, v7);
    swift_bridgeObjectRetain_n();
    uint64_t v14 = sub_2D8D0();
    os_log_type_t v15 = sub_2DB50();
    int v16 = v15;
    if (os_log_type_enabled(v14, v15))
    {
      uint64_t v17 = swift_slowAlloc();
      uint64_t v34 = v12;
      uint64_t v18 = v17;
      uint64_t v33 = swift_slowAlloc();
      uint64_t v36 = v33;
      *(_DWORD *)uint64_t v18 = 67109378;
      LODWORD(v35) = a1 & 1;
      sub_2DC80();
      *(_WORD *)(v18 + 8) = 2080;
      v31[1] = v18 + 10;
      type metadata accessor for CFString(0);
      swift_bridgeObjectRetain();
      uint64_t v19 = sub_2DAC0();
      int v32 = v16;
      unint64_t v21 = v20;
      swift_bridgeObjectRelease();
      uint64_t v35 = sub_22B88(v19, v21, &v36);
      sub_2DC80();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_0, v14, (os_log_type_t)v32, "Updating observers %{BOOL}d %s: ", (uint8_t *)v18, 0x12u);
      swift_arrayDestroy();
      swift_slowDealloc();
      uint64_t v12 = v34;
      swift_slowDealloc();
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }

    (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
    v3[v12] = a1 & 1;
    if (a2 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t result = sub_2DDA0();
      uint64_t v22 = result;
      if (result) {
        goto LABEL_9;
      }
    }
    else
    {
      uint64_t v22 = *(void *)((char *)&dword_10 + (a2 & 0xFFFFFFFFFFFFFF8));
      uint64_t result = swift_bridgeObjectRetain();
      if (v22)
      {
LABEL_9:
        if (v22 < 1)
        {
          __break(1u);
          return result;
        }
        if ((a2 & 0xC000000000000001) != 0)
        {
          for (uint64_t i = 0; i != v22; ++i)
          {
            CFStringRef v24 = (const __CFString *)sub_2DD30();
            uint64_t v25 = CFNotificationCenterGetLocalCenter();
            uint64_t v26 = v25;
            if (a1) {
              CFNotificationCenterAddObserver(v25, v3, (CFNotificationCallback)sub_12918, v24, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
            }
            else {
              CFNotificationCenterRemoveObserver(v25, v3, v24, 0);
            }
            swift_unknownObjectRelease();
          }
        }
        else
        {
          for (uint64_t j = 0; j != v22; ++j)
          {
            uint64_t v28 = (__CFString *)*(id *)(a2 + 8 * j + 32);
            uint64_t v29 = CFNotificationCenterGetLocalCenter();
            long long v30 = v29;
            if (a1) {
              CFNotificationCenterAddObserver(v29, v3, (CFNotificationCallback)sub_12918, v28, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
            }
            else {
              CFNotificationCenterRemoveObserver(v29, v3, v28, 0);
            }
          }
        }
      }
    }
    return swift_bridgeObjectRelease();
  }
  return result;
}

id sub_993C()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_2D8F0();
  uint64_t v43 = *(void *)(v2 - 8);
  uint64_t v44 = v2;
  __chkstk_darwin(v2);
  uint64_t v4 = (char *)&v42 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v5 = [self sharedAVSystemController];
  if (!v5) {
    __break(1u);
  }
  int v6 = v5;
  sub_4BA0(&qword_39868);
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_2E940;
  uint64_t v8 = (void *)AVSystemController_CarPlayIsConnectedDidChangeNotification;
  uint64_t v9 = (void *)AVSystemController_ActiveAudioRouteDidChangeNotification;
  *(void *)(v7 + 32) = AVSystemController_CarPlayIsConnectedDidChangeNotification;
  *(void *)(v7 + 40) = v9;
  uint64_t v10 = (void *)AVSystemController_CarPlayAuxStreamSupportDidChangeNotification;
  *(void *)(v7 + 48) = AVSystemController_CarPlayAuxStreamSupportDidChangeNotification;
  type metadata accessor for Name(0);
  id v11 = v8;
  id v12 = v9;
  id v13 = v10;
  Class isa = sub_2DAA0().super.isa;
  swift_bridgeObjectRelease();
  aBlock[0] = 0;
  unsigned int v15 = [v6 setAttribute:isa forKey:AVSystemController_SubscribeToNotificationsAttribute error:aBlock];

  if (v15)
  {
    id v16 = aBlock[0];
  }
  else
  {
    id v17 = aBlock[0];
    sub_2D810();

    swift_willThrow();
    if (qword_39BA0 != -1) {
      swift_once();
    }
    uint64_t v18 = v44;
    uint64_t v19 = sub_46B4(v44, (uint64_t)HMLog);
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v43 + 16))(v4, v19, v18);
    swift_errorRetain();
    swift_errorRetain();
    unint64_t v20 = sub_2D8D0();
    os_log_type_t v21 = sub_2DB70();
    if (os_log_type_enabled(v20, v21))
    {
      uint64_t v22 = (uint8_t *)swift_slowAlloc();
      id v23 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v22 = 138412290;
      swift_errorRetain();
      CFStringRef v24 = (void *)_swift_stdlib_bridgeErrorToNSError();
      aBlock[0] = v24;
      sub_2DC80();
      *id v23 = v24;
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl(&dword_0, v20, v21, "Could not register carplay connected %@", v22, 0xCu);
      sub_4BA0(&qword_39500);
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
    (*(void (**)(char *, uint64_t))(v43 + 8))(v4, v44);
  }
  uint64_t v25 = self;
  id v26 = [v25 defaultCenter];
  [v26 addObserver:v1 selector:"activeRouteChangeWithNotification:" name:AVSystemController_ActiveAudioRouteDidChangeNotification object:0];

  id v27 = [v25 defaultCenter];
  [v27 addObserver:v1 selector:"activeRouteChangeWithNotification:" name:AVSystemController_CarPlayIsConnectedDidChangeNotification object:0];

  id v28 = [v25 defaultCenter];
  [v28 addObserver:v1 selector:"activeRouteChangeWithNotification:" name:AVSystemController_CarPlayAuxStreamSupportDidChangeNotification object:0];

  sub_5C4C();
  sub_5930();
  id v29 = [v25 defaultCenter];
  [v29 addObserver:v1 selector:"thermalStatusChangedWithNotification:" name:NSProcessInfoThermalStateDidChangeNotification object:0];

  id v30 = [self sharedInstance];
  long long v31 = (void *)swift_allocObject();
  swift_unknownObjectWeakInit();
  aBlock[4] = sub_28288;
  aBlock[5] = v31;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = (id)1107296256;
  aBlock[2] = sub_68F8;
  aBlock[3] = &unk_351C8;
  int v32 = _Block_copy(aBlock);
  swift_release();
  [v30 registerUpdateBlock:v32 forRetrieveSelector:sub_2D8C0() withListener:v1];
  _Block_release(v32);

  sub_2CAD4(0, &qword_39430);
  uint64_t v33 = (void *)sub_2DBE0();
  id v34 = [objc_allocWithZone((Class)AXDispatchTimer) initWithTargetSerialQueue:v33];

  uint64_t v35 = OBJC_IVAR___AXHapticMusicServer_notificationTimer;
  uint64_t v36 = *(void **)(v1 + OBJC_IVAR___AXHapticMusicServer_notificationTimer);
  *(void *)(v1 + OBJC_IVAR___AXHapticMusicServer_notificationTimer) = v34;

  v37 = *(void **)(v1 + v35);
  if (v37) {
    [v37 setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:1];
  }
  id v38 = [objc_allocWithZone((Class)AXDispatchTimer) initWithTargetSerialQueue:*(void *)(v1 + OBJC_IVAR___AXHapticMusicServer_queue)];
  uint64_t v39 = OBJC_IVAR___AXHapticMusicServer_shutdownTimer;
  uint64_t v40 = *(void **)(v1 + OBJC_IVAR___AXHapticMusicServer_shutdownTimer);
  *(void *)(v1 + OBJC_IVAR___AXHapticMusicServer_shutdownTimer) = v38;

  id result = *(id *)(v1 + v39);
  if (result) {
    return [result setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:1];
  }
  return result;
}

void sub_9FD0()
{
  uint64_t v0 = sub_2D930();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v26 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_2D960();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_2D8F0();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  id v11 = (char *)&v26 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    id v13 = (unsigned char *)Strong;
    uint64_t v29 = v5;
    uint64_t v30 = v4;
    id v14 = [self sharedInstance];
    unsigned int v15 = [v14 hapticMusicActive];

    if (v15 != v13[OBJC_IVAR___AXHapticMusicServer_isActive])
    {
      uint64_t v27 = v1;
      v13[OBJC_IVAR___AXHapticMusicServer_isActive] = v15;
      if (qword_39BA0 != -1) {
        swift_once();
      }
      uint64_t v28 = v0;
      uint64_t v16 = sub_46B4(v8, (uint64_t)HMLog);
      swift_beginAccess();
      (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, v16, v8);
      id v17 = sub_2D8D0();
      os_log_type_t v18 = sub_2DB80();
      if (os_log_type_enabled(v17, v18))
      {
        uint64_t v19 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)uint64_t v19 = 67109120;
        LODWORD(aBlock[0]) = v15;
        sub_2DC80();
        _os_log_impl(&dword_0, v17, v18, "Haptic Music active state changed to: %{BOOL}d", v19, 8u);
        swift_slowDealloc();
      }

      (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
      unint64_t v20 = *(void **)&v13[OBJC_IVAR___AXHapticMusicServer_queue];
      uint64_t v21 = swift_allocObject();
      *(void *)(v21 + 16) = v13;
      aBlock[4] = sub_28290;
      aBlock[5] = v21;
      aBlock[0] = _NSConcreteStackBlock;
      aBlock[1] = 1107296256;
      aBlock[2] = sub_68F8;
      aBlock[3] = &unk_35218;
      uint64_t v22 = _Block_copy(aBlock);
      id v23 = v20;
      CFStringRef v24 = v13;
      sub_2D940();
      long long v31 = &_swiftEmptyArrayStorage;
      sub_27694(&qword_394A8, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
      sub_4BA0(&qword_394B0);
      sub_281F8(&qword_394B8, &qword_394B0);
      uint64_t v25 = v28;
      sub_2DCB0();
      sub_2DBF0();
      _Block_release(v22);

      (*(void (**)(char *, uint64_t))(v27 + 8))(v3, v25);
      (*(void (**)(char *, uint64_t))(v29 + 8))(v7, v30);
      swift_release();
      sub_2D9C0();
      sub_2D9B0();
      sub_2D9A0();
      swift_release();
    }
  }
}

uint64_t sub_A4FC(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

char *sub_A540()
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v1 = sub_4BA0(&qword_39840);
  __chkstk_darwin(v1 - 8);
  v53 = (char *)&v46 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v57 = sub_4BA0(&qword_39848);
  uint64_t v55 = *(void *)(v57 - 8);
  __chkstk_darwin(v57);
  v54 = (char *)&v46 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v59 = sub_2DC30();
  uint64_t v58 = *(void *)(v59 - 8);
  __chkstk_darwin(v59);
  uint64_t v56 = (char *)&v46 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v52 = sub_2D930();
  uint64_t v51 = *(void *)(v52 - 8);
  __chkstk_darwin(v52);
  v50 = (char *)&v46 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v69 = sub_2DBD0();
  uint64_t v6 = *(void *)(v69 - 8);
  __chkstk_darwin(v69);
  uint64_t v67 = (char *)&v46 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_2DBA0();
  __chkstk_darwin(v8);
  uint64_t v49 = sub_2D960();
  uint64_t v48 = *(void *)(v49 - 8);
  __chkstk_darwin(v49);
  uint64_t v10 = (char *)&v46 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v0[OBJC_IVAR___AXHapticMusicServer_isEnabled] = 0;
  uint64_t v11 = OBJC_IVAR___AXHapticMusicServer_isActive;
  id v12 = self;
  id v13 = v0;
  id v14 = [v12 sharedInstance];
  unsigned __int8 v15 = [v14 hapticMusicActive];

  v0[v11] = v15;
  v13[OBJC_IVAR___AXHapticMusicServer_isSessionValid] = 1;
  v13[OBJC_IVAR___AXHapticMusicServer_isHapticTrackPlaying] = 0;
  v13[OBJC_IVAR___AXHapticMusicServer_currentHapticPlayerStarted] = 0;
  v13[OBJC_IVAR___AXHapticMusicServer_engineIsRunning] = 0;
  v13[OBJC_IVAR___AXHapticMusicServer_fetchingHapticTracks] = 0;
  v13[OBJC_IVAR___AXHapticMusicServer_pauseShouldCancelEngineStartup] = 0;
  *(void *)&v13[OBJC_IVAR___AXHapticMusicServer_siriActivationSource] = 0;
  *(void *)&v13[OBJC_IVAR___AXHapticMusicServer_HapticEngineTimeout] = 0x4034000000000000;
  *(void *)&v13[OBJC_IVAR___AXHapticMusicServer_engine] = 0;
  *(void *)&v13[OBJC_IVAR___AXHapticMusicServer_players] = &_swiftEmptyArrayStorage;
  *(void *)&v13[OBJC_IVAR___AXHapticMusicServer_currentPatternDuration] = 0;
  *(void *)&v13[OBJC_IVAR___AXHapticMusicServer_currentMetadata] = 0;
  *(void *)&v13[OBJC_IVAR___AXHapticMusicServer_currentSpatialOffsets] = 0;
  *(void *)&v13[OBJC_IVAR___AXHapticMusicServer_audioSession] = 0;
  uint64_t v16 = &v13[OBJC_IVAR___AXHapticMusicServer_nowPlayingBundleIdentifier];
  *uint64_t v16 = 0;
  v16[1] = 0xE000000000000000;
  id v17 = &v13[OBJC_IVAR___AXHapticMusicServer_trackIdentifier];
  *id v17 = 0;
  v17[1] = 0;
  void v17[2] = 0xE000000000000000;
  v17[3] = 0;
  v17[4] = 0xE000000000000000;
  v17[5] = 0;
  v17[6] = 0xE000000000000000;
  uint64_t v70 = OBJC_IVAR___AXHapticMusicServer_queue;
  uint64_t v71 = sub_2CAD4(0, &qword_39430);
  sub_2D950();
  aBlock[0] = &_swiftEmptyArrayStorage;
  uint64_t v64 = sub_27694(&qword_39438, (void (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes);
  uint64_t v68 = sub_4BA0(&qword_39440);
  uint64_t v66 = sub_281F8(&qword_39448, &qword_39440);
  uint64_t v63 = v8;
  sub_2DCB0();
  uint64_t v18 = enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:);
  uint64_t v61 = *(void (**)(char *, void, uint64_t))(v6 + 104);
  uint64_t v62 = v6 + 104;
  uint64_t v19 = v67;
  unsigned int v65 = enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:);
  uint64_t v20 = v69;
  v61(v67, enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:), v69);
  *(void *)&v13[v70] = sub_2DC00();
  uint64_t v60 = OBJC_IVAR___AXHapticMusicServer_ahapAvailableQueue;
  sub_2D950();
  aBlock[0] = &_swiftEmptyArrayStorage;
  sub_2DCB0();
  uint64_t v21 = v18;
  uint64_t v22 = v61;
  v61(v19, v21, v20);
  *(void *)&v13[v60] = sub_2DC00();
  *(void *)&v13[OBJC_IVAR___AXHapticMusicServer_notificationTimer] = 0;
  *(void *)&v13[OBJC_IVAR___AXHapticMusicServer_shutdownTimer] = 0;
  uint64_t v23 = OBJC_IVAR___AXHapticMusicServer_ahapAvailableCacheQueue;
  sub_2D950();
  aBlock[0] = &_swiftEmptyArrayStorage;
  sub_2DCB0();
  v22(v19, v65, v69);
  *(void *)&v13[v23] = sub_2DC00();
  uint64_t v24 = OBJC_IVAR___AXHapticMusicServer_ahapAvailableCache;
  *(void *)&v13[v24] = sub_4EBC((uint64_t)&_swiftEmptyArrayStorage);
  *(void *)&v13[OBJC_IVAR___AXHapticMusicServer_hapticSubscriptions] = &_swiftEmptySetSingleton;
  uint64_t v25 = OBJC_IVAR___AXHapticMusicServer_supportedClients;
  *(void *)&v13[v25] = sub_5688((uint64_t)&_swiftEmptyArrayStorage, &qword_398A8);
  v13[OBJC_IVAR___AXHapticMusicServer_siriActive] = 0;
  uint64_t v26 = OBJC_IVAR___AXHapticMusicServer_statusObservers;
  type metadata accessor for AXHapticMusicServer.StatusObservers();
  uint64_t v27 = swift_allocObject();
  swift_defaultActor_initialize();
  *(void *)(v27 + 112) = sub_5018((uint64_t)&_swiftEmptyArrayStorage);
  *(void *)&v13[v26] = v27;
  *(void *)&v13[OBJC_IVAR___AXHapticMusicServer_totalActivePlayingTime] = 0;
  *(void *)&v13[OBJC_IVAR___AXHapticMusicServer_elapsedHapticPlayingTimeForTrack] = 0;
  v13[OBJC_IVAR___AXHapticMusicServer_isCameraActive] = 0;
  *(void *)&v13[OBJC_IVAR___AXHapticMusicServer_mediaDomain] = 0;
  *(void *)&v13[OBJC_IVAR___AXHapticMusicServer____lazy_storage___displayManager] = 0;
  v13[OBJC_IVAR___AXHapticMusicServer_observersEnabled] = 0;
  uint64_t v28 = OBJC_IVAR___AXHapticMusicServer_hapticCache;
  *(void *)&v13[v28] = sub_5158((uint64_t)&_swiftEmptyArrayStorage);
  id result = (char *)[objc_allocWithZone((Class)AXDispatchTimer) initWithTargetSerialQueue:*(void *)&v13[v70]];
  if (result)
  {
    *(void *)&v13[OBJC_IVAR___AXHapticMusicServer_playbackStatisticsTimer] = result;

    v74.receiver = v13;
    v74.super_class = ObjectType;
    uint64_t v30 = (char *)objc_msgSendSuper2(&v74, "init");
    long long v31 = *(void **)&v30[OBJC_IVAR___AXHapticMusicServer_queue];
    int v32 = (void *)swift_allocObject();
    v32[2] = v30;
    aBlock[4] = sub_2813C;
    aBlock[5] = v32;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = (id)1107296256;
    aBlock[2] = sub_68F8;
    aBlock[3] = &unk_35178;
    uint64_t v33 = _Block_copy(aBlock);
    id v34 = v30;
    id v35 = v31;
    sub_2D940();
    v72 = &_swiftEmptyArrayStorage;
    sub_27694(&qword_394A8, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
    sub_4BA0(&qword_394B0);
    sub_281F8(&qword_394B8, &qword_394B0);
    uint64_t v36 = v50;
    uint64_t v37 = v52;
    sub_2DCB0();
    sub_2DBF0();
    _Block_release(v33);

    (*(void (**)(char *, uint64_t))(v51 + 8))(v36, v37);
    (*(void (**)(char *, uint64_t))(v48 + 8))(v10, v49);
    swift_release();
    id v38 = [self defaultCenter];
    uint64_t v39 = (void *)sub_2DB90();
    uint64_t v40 = v56;
    sub_2DC40();

    aBlock[0] = (id)sub_2DBE0();
    uint64_t v41 = sub_2DBC0();
    uint64_t v42 = (uint64_t)v53;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v41 - 8) + 56))(v53, 1, 1, v41);
    sub_27694(&qword_39850, (void (*)(uint64_t))&type metadata accessor for NSNotificationCenter.Publisher);
    sub_28190();
    uint64_t v43 = v54;
    uint64_t v44 = v59;
    sub_2D910();
    sub_2D07C(v42, &qword_39840);

    sub_281F8(&qword_39860, &qword_39848);
    uint64_t v45 = v57;
    sub_2D920();
    (*(void (**)(char *, uint64_t))(v55 + 8))(v43, v45);
    swift_beginAccess();
    sub_2D900();
    swift_endAccess();

    swift_release();
    (*(void (**)(char *, uint64_t))(v58 + 8))(v40, v44);
    return v34;
  }
  else
  {
    __break(1u);
  }
  return result;
}

unint64_t variable initialization expression of AXHapticMusicServer.hapticCache()
{
  return sub_5158((uint64_t)&_swiftEmptyArrayStorage);
}

id HapticMusicSiriActionSource.__allocating_init(delegate:)(uint64_t a1)
{
  id v2 = [objc_allocWithZone(v1) initWithDelegate:a1];
  swift_unknownObjectRelease();
  return v2;
}

uint64_t sub_B1EC()
{
  sub_2D9C0();
  sub_2D9B0();
  sub_2D9A0();

  return swift_release();
}

uint64_t sub_B270(char *a1)
{
  uint64_t v2 = sub_2D930();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15[0] = sub_2D960();
  uint64_t v6 = *(void *)(v15[0] - 8);
  __chkstk_darwin(v15[0]);
  uint64_t v8 = (char *)v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *(void **)&a1[OBJC_IVAR___AXHapticMusicServer_queue];
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = a1;
  aBlock[4] = sub_285D8;
  aBlock[5] = v10;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_68F8;
  aBlock[3] = &unk_35650;
  uint64_t v11 = _Block_copy(aBlock);
  id v12 = v9;
  id v13 = a1;
  sub_2D940();
  v15[1] = &_swiftEmptyArrayStorage;
  sub_27694(&qword_394A8, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_4BA0(&qword_394B0);
  sub_281F8(&qword_394B8, &qword_394B0);
  sub_2DCB0();
  sub_2DBF0();
  _Block_release(v11);

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  (*(void (**)(char *, void))(v6 + 8))(v8, v15[0]);
  return swift_release();
}

uint64_t sub_B53C(uint64_t a1)
{
  uint64_t v2 = sub_2D8F0();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v6 = (char *)&v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v23 - v7;
  if (qword_39BA0 != -1) {
    swift_once();
  }
  uint64_t v9 = sub_46B4(v2, (uint64_t)HMLog);
  swift_beginAccess();
  uint64_t v10 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
  v10(v8, v9, v2);
  uint64_t v11 = sub_2D8D0();
  os_log_type_t v12 = sub_2DB80();
  if (os_log_type_enabled(v11, v12))
  {
    id v13 = (uint8_t *)swift_slowAlloc();
    uint64_t v23 = v3;
    *(_WORD *)id v13 = 0;
    _os_log_impl(&dword_0, v11, v12, "Engine stopped handler called. Resetting", v13, 2u);
    uint64_t v3 = v23;
    swift_slowDealloc();
  }

  id v14 = *(void (**)(char *, uint64_t))(v3 + 8);
  v14(v8, v2);
  unsigned __int8 v15 = *(void **)(a1 + OBJC_IVAR___AXHapticMusicServer_audioSession);
  *(void *)(a1 + OBJC_IVAR___AXHapticMusicServer_audioSession) = 0;

  uint64_t v16 = (void *)(a1 + OBJC_IVAR___AXHapticMusicServer_trackIdentifier);
  *uint64_t v16 = 0;
  v16[1] = 0;
  v16[2] = 0xE000000000000000;
  v16[3] = 0;
  v16[4] = 0xE000000000000000;
  v16[5] = 0;
  v16[6] = 0xE000000000000000;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_B840();
  id v17 = *(void **)(a1 + OBJC_IVAR___AXHapticMusicServer_engine);
  *(void *)(a1 + OBJC_IVAR___AXHapticMusicServer_engine) = 0;

  v10(v6, v9, v2);
  uint64_t v18 = sub_2D8D0();
  os_log_type_t v19 = sub_2DB50();
  if (os_log_type_enabled(v18, v19))
  {
    uint64_t v20 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v20 = 0;
    _os_log_impl(&dword_0, v18, v19, "Engine stop: Music State Change", v20, 2u);
    swift_slowDealloc();
  }

  uint64_t v21 = ((uint64_t (*)(char *, uint64_t))v14)(v6, v2);
  return sub_6984(v21);
}

uint64_t sub_B840()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_2D8F0();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  uint64_t v5 = (char *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_39BA0 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_46B4(v2, (uint64_t)HMLog);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
  uint64_t v7 = sub_2D8D0();
  os_log_type_t v8 = sub_2DB50();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl(&dword_0, v7, v8, "Clearing all the haptic players", v9, 2u);
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  uint64_t v10 = (uint64_t *)(v1 + OBJC_IVAR___AXHapticMusicServer_players);
  swift_beginAccess();
  uint64_t v11 = *v10;
  unint64_t v12 = (unint64_t)*v10 >> 62;
  uint64_t v20 = v1;
  if (v12)
  {
    swift_bridgeObjectRetain();
    uint64_t v13 = sub_2DDA0();
    if (!v13) {
      goto LABEL_17;
    }
  }
  else
  {
    uint64_t v13 = *(void *)((char *)&dword_10 + (v11 & 0xFFFFFFFFFFFFFF8));
    swift_bridgeObjectRetain();
    if (!v13) {
      goto LABEL_17;
    }
  }
  if (v13 < 1) {
    __break(1u);
  }
  for (uint64_t i = 0; i != v13; ++i)
  {
    if ((v11 & 0xC000000000000001) != 0)
    {
      uint64_t v16 = (void *)sub_2DD30();
    }
    else
    {
      uint64_t v16 = *(void **)(v11 + 8 * i + 32);
      swift_unknownObjectRetain();
    }
    id v21 = 0;
    if (objc_msgSend(v16, "stopAtTime:error:", &v21, 0.0, v20))
    {
      id v15 = v21;
    }
    else
    {
      id v17 = v21;
      sub_2D810();

      swift_willThrow();
      swift_errorRelease();
    }
    swift_unknownObjectRelease();
  }
LABEL_17:
  swift_bridgeObjectRelease();
  uint64_t *v10 = (uint64_t)&_swiftEmptyArrayStorage;
  uint64_t result = swift_bridgeObjectRelease();
  uint64_t v19 = v20;
  *(unsigned char *)(v20 + OBJC_IVAR___AXHapticMusicServer_isHapticTrackPlaying) = 0;
  *(unsigned char *)(v19 + OBJC_IVAR___AXHapticMusicServer_currentHapticPlayerStarted) = 0;
  *(void *)(v19 + OBJC_IVAR___AXHapticMusicServer_currentPatternDuration) = 0;
  return result;
}

void sub_BB78(uint64_t a1, uint64_t a2, void (*a3)(uint64_t))
{
  uint64_t v5 = sub_2D8F0();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  os_log_type_t v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_39BA0 != -1) {
    swift_once();
  }
  uint64_t v9 = sub_46B4(v5, (uint64_t)HMLog);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, v9, v5);
  uint64_t v10 = sub_2D8D0();
  os_log_type_t v11 = sub_2DB80();
  if (os_log_type_enabled(v10, v11))
  {
    unint64_t v12 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)unint64_t v12 = 134217984;
    uint64_t v14 = a1;
    sub_2DC80();
    _os_log_impl(&dword_0, v10, v11, "Stop Handler: The engine stopped for reason: %ld", v12, 0xCu);
    swift_slowDealloc();
  }

  uint64_t v13 = (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  if (a1 == 1) {
    sub_835C(1);
  }
  else {
    a3(v13);
  }
}

uint64_t sub_BD88(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);

  return swift_release();
}

uint64_t sub_BDDC(uint64_t (*a1)(uint64_t))
{
  uint64_t v2 = sub_2D8F0();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_39BA0 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_46B4(v2, (uint64_t)HMLog);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
  uint64_t v7 = sub_2D8D0();
  os_log_type_t v8 = sub_2DB80();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl(&dword_0, v7, v8, "Reset Handler:", v9, 2u);
    swift_slowDealloc();
  }

  uint64_t v10 = (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return a1(v10);
}

uint64_t sub_BF9C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2D8F0();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin(v4);
  os_log_type_t v8 = (char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v24 - v9;
  os_log_type_t v11 = &selRef_auxiliarySession;
  if (a1)
  {
    swift_errorRetain();
    if (qword_39BA0 != -1) {
      swift_once();
    }
    uint64_t v12 = sub_46B4(v4, (uint64_t)HMLog);
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v10, v12, v4);
    swift_errorRetain();
    swift_errorRetain();
    uint64_t v13 = sub_2D8D0();
    os_log_type_t v14 = sub_2DB80();
    if (os_log_type_enabled(v13, v14))
    {
      uint64_t v15 = swift_slowAlloc();
      uint64_t v27 = a2;
      uint64_t v16 = (uint8_t *)v15;
      uint64_t v25 = (void *)swift_slowAlloc();
      uint64_t v26 = v16;
      *(_DWORD *)uint64_t v16 = 138412290;
      swift_errorRetain();
      id v17 = v8;
      uint64_t v18 = _swift_stdlib_bridgeErrorToNSError();
      uint64_t v28 = v18;
      os_log_type_t v11 = &selRef_auxiliarySession;
      sub_2DC80();
      *uint64_t v25 = v18;
      os_log_type_t v8 = v17;
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl(&dword_0, v13, v14, "Player finished error: %@", v26, 0xCu);
      sub_4BA0(&qword_39500);
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
    (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);
  }
  if (v11[372] != (char *)-1) {
    swift_once();
  }
  uint64_t v19 = sub_46B4(v4, (uint64_t)HMLog);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v8, v19, v4);
  uint64_t v20 = sub_2D8D0();
  os_log_type_t v21 = sub_2DB50();
  if (os_log_type_enabled(v20, v21))
  {
    uint64_t v22 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v22 = 0;
    _os_log_impl(&dword_0, v20, v21, "Players finished", v22, 2u);
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  return sub_B840();
}

uint64_t sub_C374(uint64_t a1, void *a2)
{
  uint64_t v3 = *(uint64_t (**)(void *))(a1 + 32);
  swift_retain();
  id v4 = a2;
  uint64_t v5 = v3(a2);
  swift_release();

  return v5;
}

BOOL static AXHapticMusicServer.isSafeToProcessMessageFromUnentitledProcess(withIdentifier:)(uint64_t a1)
{
  return (a1 & 0xFFFFFFFFFFFFFFFELL) == 2;
}

uint64_t sub_C464()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_2D8F0();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)v57 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v6 = sub_52C8((uint64_t)&_swiftEmptyArrayStorage);
  *(void *)&long long v62 = 0x44496D616461;
  *((void *)&v62 + 1) = 0xE600000000000000;
  sub_2DCF0();
  uint64_t v7 = (void *)(v1 + OBJC_IVAR___AXHapticMusicServer_trackIdentifier);
  uint64_t v8 = *(void *)(v1 + OBJC_IVAR___AXHapticMusicServer_trackIdentifier);
  uint64_t v63 = &type metadata for Int64;
  *(void *)&long long v62 = v8;
  sub_2C65C(&v62, &v64);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(void *)&v61[0] = v6;
  sub_25A38(&v64, (uint64_t)v66, isUniquelyReferenced_nonNull_native);
  uint64_t v10 = *(void *)&v61[0];
  swift_bridgeObjectRelease();
  sub_27204((uint64_t)v66);
  *(void *)&long long v62 = 1668445033;
  *((void *)&v62 + 1) = 0xE400000000000000;
  sub_2DCF0();
  uint64_t v11 = v7[1];
  uint64_t v12 = v7[2];
  uint64_t v63 = &type metadata for String;
  *(void *)&long long v62 = v11;
  *((void *)&v62 + 1) = v12;
  sub_2C65C(&v62, &v64);
  swift_bridgeObjectRetain();
  char v13 = swift_isUniquelyReferenced_nonNull_native();
  *(void *)&v61[0] = v10;
  sub_25A38(&v64, (uint64_t)v66, v13);
  uint64_t v14 = *(void *)&v61[0];
  swift_bridgeObjectRelease();
  sub_27204((uint64_t)v66);
  *(void *)&long long v62 = 0x656C746974;
  *((void *)&v62 + 1) = 0xE500000000000000;
  sub_2DCF0();
  uint64_t v15 = v7[3];
  uint64_t v16 = v7[4];
  uint64_t v63 = &type metadata for String;
  *(void *)&long long v62 = v15;
  *((void *)&v62 + 1) = v16;
  sub_2C65C(&v62, &v64);
  swift_bridgeObjectRetain();
  char v17 = swift_isUniquelyReferenced_nonNull_native();
  *(void *)&v61[0] = v14;
  sub_25A38(&v64, (uint64_t)v66, v17);
  uint64_t v18 = *(void *)&v61[0];
  swift_bridgeObjectRelease();
  sub_27204((uint64_t)v66);
  *(void *)&long long v62 = 0x747369747261;
  *((void *)&v62 + 1) = 0xE600000000000000;
  sub_2DCF0();
  uint64_t v19 = v7[5];
  uint64_t v20 = v7[6];
  uint64_t v63 = &type metadata for String;
  *(void *)&long long v62 = v19;
  *((void *)&v62 + 1) = v20;
  sub_2C65C(&v62, &v64);
  swift_bridgeObjectRetain();
  char v21 = swift_isUniquelyReferenced_nonNull_native();
  *(void *)&v61[0] = v18;
  sub_25A38(&v64, (uint64_t)v66, v21);
  uint64_t v22 = *(void *)&v61[0];
  uint64_t v67 = *(void *)&v61[0];
  swift_bridgeObjectRelease();
  sub_27204((uint64_t)v66);
  uint64_t v23 = *(void *)(v1 + OBJC_IVAR___AXHapticMusicServer_currentMetadata);
  if (v23)
  {
    *(void *)&long long v62 = 0x6E6F6973726576;
    *((void *)&v62 + 1) = 0xE700000000000000;
    swift_bridgeObjectRetain();
    sub_2DCF0();
    *(void *)&long long v64 = 0x5F73636974706168;
    *((void *)&v64 + 1) = 0xEF6E6F6973726576;
    sub_2DCF0();
    if (*(void *)(v23 + 16) && (unint64_t v24 = sub_23330((uint64_t)&v62), (v25 & 1) != 0))
    {
      sub_27554(*(void *)(v23 + 56) + 32 * v24, (uint64_t)&v64);
    }
    else
    {
      long long v64 = 0u;
      long long v65 = 0u;
    }
    sub_27204((uint64_t)&v62);
    if (*((void *)&v65 + 1))
    {
      sub_2C65C(&v64, v61);
      char v26 = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v60 = v22;
      sub_25A38(v61, (uint64_t)v66, v26);
      uint64_t v67 = v60;
      swift_bridgeObjectRelease();
      sub_27204((uint64_t)v66);
    }
    else
    {
      sub_2D07C((uint64_t)&v64, &qword_39458);
      sub_23954((uint64_t)v66, v61);
      sub_27204((uint64_t)v66);
      sub_2D07C((uint64_t)v61, &qword_39458);
    }
    *(void *)&long long v62 = 0x4464657461657263;
    *((void *)&v62 + 1) = 0xEB00000000657461;
    sub_2DCF0();
    *(void *)&long long v64 = 0x5F64657461657263;
    *((void *)&v64 + 1) = 0xEA00000000006E6FLL;
    sub_2DCF0();
    if (*(void *)(v23 + 16) && (unint64_t v27 = sub_23330((uint64_t)&v62), (v28 & 1) != 0))
    {
      sub_27554(*(void *)(v23 + 56) + 32 * v27, (uint64_t)&v64);
    }
    else
    {
      long long v64 = 0u;
      long long v65 = 0u;
    }
    sub_27204((uint64_t)&v62);
    if (*((void *)&v65 + 1))
    {
      sub_2C65C(&v64, v61);
      uint64_t v29 = v67;
      char v30 = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v60 = v29;
      sub_25A38(v61, (uint64_t)v66, v30);
      uint64_t v67 = v60;
      swift_bridgeObjectRelease();
      sub_27204((uint64_t)v66);
    }
    else
    {
      sub_2D07C((uint64_t)&v64, &qword_39458);
      sub_23954((uint64_t)v66, v61);
      sub_27204((uint64_t)v66);
      sub_2D07C((uint64_t)v61, &qword_39458);
    }
    *(void *)&long long v62 = 0xD000000000000013;
    *((void *)&v62 + 1) = 0x800000000002F960;
    sub_2DCF0();
    *(void *)&v61[0] = 0x7363697274656DLL;
    *((void *)&v61[0] + 1) = 0xE700000000000000;
    sub_2DCF0();
    if (*(void *)(v23 + 16) && (unint64_t v31 = sub_23330((uint64_t)&v62), (v32 & 1) != 0))
    {
      sub_27554(*(void *)(v23 + 56) + 32 * v31, (uint64_t)&v64);
    }
    else
    {
      long long v64 = 0u;
      long long v65 = 0u;
    }
    sub_27204((uint64_t)&v62);
    if (*((void *)&v65 + 1))
    {
      sub_4BA0(&qword_39900);
      if (swift_dynamicCast())
      {
        uint64_t v33 = *(void *)&v61[0];
        *(void *)&long long v64 = 0xD000000000000020;
        *((void *)&v64 + 1) = 0x800000000002F9D0;
        sub_2DCF0();
        if (*(void *)(v33 + 16) && (unint64_t v34 = sub_23330((uint64_t)&v62), (v35 & 1) != 0))
        {
          sub_27554(*(void *)(v33 + 56) + 32 * v34, (uint64_t)&v64);
        }
        else
        {
          long long v64 = 0u;
          long long v65 = 0u;
        }
        swift_bridgeObjectRelease();
        sub_27204((uint64_t)&v62);
        if (*((void *)&v65 + 1))
        {
          sub_2C65C(&v64, &v62);
          uint64_t v53 = v67;
          char v54 = swift_isUniquelyReferenced_nonNull_native();
          *(void *)&v61[0] = v53;
          sub_25A38(&v62, (uint64_t)v66, v54);
          uint64_t v67 = *(void *)&v61[0];
          swift_bridgeObjectRelease();
          sub_27204((uint64_t)v66);
          goto LABEL_28;
        }
LABEL_27:
        sub_2D07C((uint64_t)&v64, &qword_39458);
        sub_23954((uint64_t)v66, &v62);
        sub_27204((uint64_t)v66);
        sub_2D07C((uint64_t)&v62, &qword_39458);
LABEL_28:
        *(void *)&long long v62 = 0xD000000000000014;
        *((void *)&v62 + 1) = 0x800000000002F980;
        sub_2DCF0();
        *(void *)&v61[0] = 0x7363697274656DLL;
        *((void *)&v61[0] + 1) = 0xE700000000000000;
        sub_2DCF0();
        if (*(void *)(v23 + 16) && (unint64_t v36 = sub_23330((uint64_t)&v62), (v37 & 1) != 0))
        {
          sub_27554(*(void *)(v23 + 56) + 32 * v36, (uint64_t)&v64);
        }
        else
        {
          long long v64 = 0u;
          long long v65 = 0u;
        }
        sub_27204((uint64_t)&v62);
        if (*((void *)&v65 + 1))
        {
          sub_4BA0(&qword_39900);
          if (swift_dynamicCast())
          {
            uint64_t v38 = *(void *)&v61[0];
            *(void *)&long long v64 = 0xD000000000000021;
            *((void *)&v64 + 1) = 0x800000000002F9A0;
            sub_2DCF0();
            if (*(void *)(v38 + 16) && (unint64_t v39 = sub_23330((uint64_t)&v62), (v40 & 1) != 0))
            {
              sub_27554(*(void *)(v38 + 56) + 32 * v39, (uint64_t)&v64);
            }
            else
            {
              long long v64 = 0u;
              long long v65 = 0u;
            }
            swift_bridgeObjectRelease();
            sub_27204((uint64_t)&v62);
            if (*((void *)&v65 + 1))
            {
              sub_2C65C(&v64, &v62);
              uint64_t v55 = v67;
              char v56 = swift_isUniquelyReferenced_nonNull_native();
              *(void *)&v61[0] = v55;
              sub_25A38(&v62, (uint64_t)v66, v56);
              uint64_t v67 = *(void *)&v61[0];
              swift_bridgeObjectRelease();
              sub_27204((uint64_t)v66);
LABEL_40:
              *(void *)&long long v62 = 0x746E6169726176;
              *((void *)&v62 + 1) = 0xE700000000000000;
              sub_2DCF0();
              *(void *)&long long v64 = 0x746E6169726176;
              *((void *)&v64 + 1) = 0xE700000000000000;
              sub_2DCF0();
              if (*(void *)(v23 + 16) && (unint64_t v41 = sub_23330((uint64_t)&v62), (v42 & 1) != 0))
              {
                sub_27554(*(void *)(v23 + 56) + 32 * v41, (uint64_t)&v64);
              }
              else
              {
                long long v64 = 0u;
                long long v65 = 0u;
              }
              swift_bridgeObjectRelease();
              sub_27204((uint64_t)&v62);
              if (*((void *)&v65 + 1))
              {
                sub_2C65C(&v64, v61);
                uint64_t v43 = v67;
                char v44 = swift_isUniquelyReferenced_nonNull_native();
                uint64_t v60 = v43;
                sub_25A38(v61, (uint64_t)v66, v44);
                uint64_t v67 = v60;
                swift_bridgeObjectRelease();
                sub_27204((uint64_t)v66);
              }
              else
              {
                sub_2D07C((uint64_t)&v64, &qword_39458);
                sub_23954((uint64_t)v66, v61);
                sub_27204((uint64_t)v66);
                sub_2D07C((uint64_t)v61, &qword_39458);
              }
              goto LABEL_47;
            }
LABEL_39:
            sub_2D07C((uint64_t)&v64, &qword_39458);
            sub_23954((uint64_t)v66, &v62);
            sub_27204((uint64_t)v66);
            sub_2D07C((uint64_t)&v62, &qword_39458);
            goto LABEL_40;
          }
        }
        else
        {
          sub_2D07C((uint64_t)&v64, &qword_39458);
        }
        long long v64 = 0u;
        long long v65 = 0u;
        goto LABEL_39;
      }
    }
    else
    {
      sub_2D07C((uint64_t)&v64, &qword_39458);
    }
    long long v64 = 0u;
    long long v65 = 0u;
    goto LABEL_27;
  }
LABEL_47:
  if (qword_39BA0 != -1) {
    swift_once();
  }
  uint64_t v45 = sub_46B4(v2, (uint64_t)HMLog);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v45, v2);
  uint64_t v46 = sub_2D8D0();
  os_log_type_t v47 = sub_2DB50();
  if (os_log_type_enabled(v46, v47))
  {
    uint64_t v48 = (uint8_t *)swift_slowAlloc();
    *(void *)&long long v62 = swift_slowAlloc();
    *(_DWORD *)uint64_t v48 = 136315138;
    uint64_t v59 = v2;
    v57[1] = v48 + 4;
    swift_beginAccess();
    swift_bridgeObjectRetain();
    uint64_t v58 = v5;
    uint64_t v49 = sub_2D9F0();
    unint64_t v51 = v50;
    swift_bridgeObjectRelease();
    *(void *)&v61[0] = sub_22B88(v49, v51, (uint64_t *)&v62);
    sub_2DC80();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_0, v46, v47, "Returning now playing info %s", v48, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v3 + 8))(v58, v59);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  swift_beginAccess();
  return v67;
}

uint64_t AXHapticMusicServer.processMessage(_:withIdentifier:fromClientWithIdentifier:)(unint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v137 = a3;
  uint64_t v138 = a2;
  uint64_t v6 = sub_4BA0(&qword_39450);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)&v120 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v134 = sub_2D930();
  uint64_t v132 = *(void *)(v134 - 8);
  __chkstk_darwin(v134);
  v130 = (char *)&v120 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v133 = sub_2D960();
  uint64_t v131 = *(void *)(v133 - 8);
  __chkstk_darwin(v133);
  v129 = (char *)&v120 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_2D8F0();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = __chkstk_darwin(v11);
  v128 = (char *)&v120 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  uint64_t v16 = (char *)&v120 - v15;
  v123 = v8;
  if (a1) {
    unint64_t v17 = a1;
  }
  else {
    unint64_t v17 = sub_52C8((uint64_t)&_swiftEmptyArrayStorage);
  }
  swift_bridgeObjectRetain();
  uint64_t v136 = sub_2D9F0();
  unint64_t v19 = v18;
  if (qword_39BA0 != -1) {
    swift_once();
  }
  uint64_t v20 = sub_46B4(v11, (uint64_t)HMLog);
  swift_beginAccess();
  char v21 = *(void (**)(char *, uint64_t, uint64_t))(v12 + 16);
  uint64_t v127 = v20;
  uint64_t v126 = v12 + 16;
  v125 = v21;
  v21(v16, v20, v11);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  uint64_t v22 = sub_2D8D0();
  uint64_t v23 = v11;
  uint64_t v148 = v12;
  unint64_t v24 = v22;
  os_log_type_t v25 = sub_2DB50();
  if (os_log_type_enabled(v24, v25))
  {
    uint64_t v26 = swift_slowAlloc();
    unint64_t v122 = v17;
    uint64_t v27 = v26;
    v121 = (void **)swift_slowAlloc();
    aBlock = v121;
    *(_DWORD *)uint64_t v27 = 134218498;
    uint64_t v124 = v23;
    uint64_t v28 = v138;
    *(void *)&long long v146 = v138;
    sub_2DC80();
    *(_WORD *)(v27 + 12) = 2080;
    swift_bridgeObjectRetain();
    *(void *)&long long v146 = sub_22B88(v137, a4, (uint64_t *)&aBlock);
    sub_2DC80();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v27 + 22) = 2080;
    swift_bridgeObjectRetain();
    *(void *)&long long v146 = sub_22B88(v136, v19, (uint64_t *)&aBlock);
    unint64_t v29 = a4;
    sub_2DC80();
    unint64_t v30 = v19;
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_0, v24, v25, "Service got a message: %ld from client: %s. Payload: %s", (uint8_t *)v27, 0x20u);
    swift_arrayDestroy();
    swift_slowDealloc();
    unint64_t v17 = v122;
    swift_slowDealloc();

    unint64_t v31 = *(void (**)(char *, uint64_t))(v148 + 8);
    uint64_t v32 = v124;
    v31(v16, v124);
  }
  else
  {
    unint64_t v29 = a4;
    swift_bridgeObjectRelease_n();
    unint64_t v30 = v19;
    swift_bridgeObjectRelease_n();

    unint64_t v31 = *(void (**)(char *, uint64_t))(v148 + 8);
    v31(v16, v23);
    uint64_t v32 = v23;
    uint64_t v28 = v138;
  }
  switch(v28)
  {
    case 1:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v33 = v135;
      unint64_t v34 = *(void **)((char *)v135 + OBJC_IVAR___AXHapticMusicServer_queue);
      uint64_t v35 = swift_allocObject();
      *(void *)(v35 + 16) = v33;
      v143 = sub_2D6E4;
      v144 = (void *)v35;
      aBlock = _NSConcreteStackBlock;
      uint64_t v140 = 1107296256;
      v141 = sub_68F8;
      v142 = &unk_34ED0;
      unint64_t v36 = _Block_copy(&aBlock);
      id v37 = v34;
      uint64_t v38 = v33;
      unint64_t v39 = v129;
      sub_2D940();
      *(void *)&long long v146 = &_swiftEmptyArrayStorage;
      sub_27694(&qword_394A8, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
      sub_4BA0(&qword_394B0);
      sub_281F8(&qword_394B8, &qword_394B0);
      char v40 = v130;
      uint64_t v41 = v134;
      sub_2DCB0();
      sub_2DBF0();
      _Block_release(v36);

      goto LABEL_24;
    case 2:
      swift_bridgeObjectRelease();
      strcpy((char *)v145, "treatAsAdamID");
      HIWORD(v145[1]) = -4864;
      sub_2DCF0();
      if (*(void *)(v17 + 16) && (unint64_t v48 = sub_23330((uint64_t)&aBlock), (v49 & 1) != 0))
      {
        sub_27554(*(void *)(v17 + 56) + 32 * v48, (uint64_t)&v146);
      }
      else
      {
        long long v146 = 0u;
        long long v147 = 0u;
      }
      sub_27204((uint64_t)&aBlock);
      if (!*((void *)&v147 + 1)) {
        goto LABEL_44;
      }
      sub_2CAD4(0, &qword_39460);
      if ((swift_dynamicCast() & 1) == 0) {
        goto LABEL_72;
      }
      id v61 = v145[0];
      v145[0] = (id)1701080931;
      v145[1] = (id)0xE400000000000000;
      sub_2DCF0();
      if (*(void *)(v17 + 16) && (unint64_t v62 = sub_23330((uint64_t)&aBlock), (v63 & 1) != 0))
      {
        unint64_t v64 = v17;
        sub_27554(*(void *)(v17 + 56) + 32 * v62, (uint64_t)&v146);
      }
      else
      {
        unint64_t v64 = v17;
        long long v146 = 0u;
        long long v147 = 0u;
      }
      sub_27204((uint64_t)&aBlock);
      if (!*((void *)&v147 + 1)) {
        goto LABEL_83;
      }
      if ((swift_dynamicCast() & 1) == 0) {
        goto LABEL_85;
      }
      unint64_t v73 = v29;
      id v75 = v145[0];
      id v74 = v145[1];
      v145[0] = (id)1684632949;
      v145[1] = (id)0xE400000000000000;
      sub_2DCF0();
      if (*(void *)(v64 + 16) && (unint64_t v76 = sub_23330((uint64_t)&aBlock), (v77 & 1) != 0))
      {
        sub_27554(*(void *)(v64 + 56) + 32 * v76, (uint64_t)&v146);
      }
      else
      {
        long long v146 = 0u;
        long long v147 = 0u;
      }
      swift_bridgeObjectRelease();
      sub_27204((uint64_t)&aBlock);
      if (!*((void *)&v147 + 1))
      {
LABEL_83:
        swift_bridgeObjectRelease();

        goto LABEL_45;
      }
      if (swift_dynamicCast())
      {
        id v90 = v145[0];
        id v91 = v145[1];
        v92 = v135;
        v93 = *(void **)((char *)v135 + OBJC_IVAR___AXHapticMusicServer_ahapAvailableQueue);
        v94 = (void *)swift_allocObject();
        v94[2] = v92;
        v94[3] = v75;
        v94[4] = v74;
        v94[5] = v61;
        v94[6] = v90;
        v94[7] = v91;
        v94[8] = v137;
        v94[9] = v73;
        v143 = sub_27608;
        v144 = v94;
        aBlock = _NSConcreteStackBlock;
        uint64_t v140 = 1107296256;
        v141 = sub_68F8;
        v142 = &unk_34E08;
        v95 = _Block_copy(&aBlock);
        swift_bridgeObjectRetain();
        v96 = v92;
        id v97 = v93;
        id v98 = v61;
        v99 = v129;
        sub_2D940();
        *(void *)&long long v146 = &_swiftEmptyArrayStorage;
        sub_27694(&qword_394A8, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
        sub_4BA0(&qword_394B0);
        sub_281F8(&qword_394B8, &qword_394B0);
        v100 = v130;
        uint64_t v101 = v134;
        sub_2DCB0();
        sub_2DBF0();
        _Block_release(v95);

        (*(void (**)(char *, uint64_t))(v132 + 8))(v100, v101);
        (*(void (**)(char *, uint64_t))(v131 + 8))(v99, v133);
LABEL_25:
        swift_release();
      }
      else
      {
LABEL_85:
        swift_bridgeObjectRelease();
      }
      return sub_52C8((uint64_t)&_swiftEmptyArrayStorage);
    case 3:
      swift_bridgeObjectRelease();
      v145[0] = (id)1684632949;
      v145[1] = (id)0xE400000000000000;
      sub_2DCF0();
      if (*(void *)(v17 + 16) && (unint64_t v50 = sub_23330((uint64_t)&aBlock), (v51 & 1) != 0))
      {
        sub_27554(*(void *)(v17 + 56) + 32 * v50, (uint64_t)&v146);
      }
      else
      {
        long long v146 = 0u;
        long long v147 = 0u;
      }
      sub_27204((uint64_t)&aBlock);
      if (!*((void *)&v147 + 1)) {
        goto LABEL_44;
      }
      if ((swift_dynamicCast() & 1) == 0) {
        goto LABEL_72;
      }
      id v66 = v145[0];
      id v65 = v145[1];
      strcpy((char *)v145, "treatAsAdamID");
      HIWORD(v145[1]) = -4864;
      sub_2DCF0();
      if (*(void *)(v17 + 16) && (unint64_t v67 = sub_23330((uint64_t)&aBlock), (v68 & 1) != 0))
      {
        sub_27554(*(void *)(v17 + 56) + 32 * v67, (uint64_t)&v146);
      }
      else
      {
        long long v146 = 0u;
        long long v147 = 0u;
      }
      sub_27204((uint64_t)&aBlock);
      if (!*((void *)&v147 + 1))
      {
        swift_bridgeObjectRelease();
LABEL_44:
        swift_bridgeObjectRelease();
        goto LABEL_45;
      }
      unint64_t v78 = v29;
      sub_2CAD4(0, &qword_39460);
      if (swift_dynamicCast())
      {
        id v79 = v145[0];
        strcpy((char *)v145, "register");
        BYTE1(v145[1]) = 0;
        WORD1(v145[1]) = 0;
        HIDWORD(v145[1]) = -402653184;
        sub_2DCF0();
        if (*(void *)(v17 + 16) && (unint64_t v80 = sub_23330((uint64_t)&aBlock), (v81 & 1) != 0))
        {
          sub_27554(*(void *)(v17 + 56) + 32 * v80, (uint64_t)&v146);
        }
        else
        {
          long long v146 = 0u;
          long long v147 = 0u;
        }
        swift_bridgeObjectRelease();
        sub_27204((uint64_t)&aBlock);
        if (*((void *)&v147 + 1))
        {
          if (swift_dynamicCast())
          {
            id v102 = v145[0];
            if ([v145[0] BOOLValue])
            {
              int v103 = *((unsigned __int8 *)v135 + OBJC_IVAR___AXHapticMusicServer_isHapticTrackPlaying);
              uint64_t v104 = sub_2DB30();
              uint64_t v105 = (uint64_t)v123;
              (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v104 - 8) + 56))(v123, 1, 1, v104);
              if (v103 == 1)
              {
                v106 = (void *)swift_allocObject();
                v106[2] = 0;
                v106[3] = 0;
                v107 = v135;
                uint64_t v108 = v137;
                v106[4] = v135;
                v106[5] = v108;
                v106[6] = v78;
                v106[7] = v66;
                v106[8] = v65;
                v106[9] = v79;
                swift_bridgeObjectRetain();
                v109 = v107;
                v110 = &unk_39498;
              }
              else
              {
                v106 = (void *)swift_allocObject();
                v106[2] = 0;
                v106[3] = 0;
                v117 = v135;
                uint64_t v118 = v137;
                v106[4] = v135;
                v106[5] = v118;
                v106[6] = v78;
                v106[7] = v66;
                v106[8] = v65;
                v106[9] = v79;
                swift_bridgeObjectRetain();
                v119 = v117;
                v110 = &unk_39488;
              }
              sub_E74C(v105, (uint64_t)v110, (uint64_t)v106);
            }
            else
            {
              swift_bridgeObjectRelease();
              uint64_t v111 = sub_2DB30();
              uint64_t v112 = (uint64_t)v123;
              (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v111 - 8) + 56))(v123, 1, 1, v111);
              v113 = (void *)swift_allocObject();
              v113[2] = 0;
              v113[3] = 0;
              v114 = v135;
              uint64_t v115 = v137;
              v113[4] = v135;
              v113[5] = v115;
              v113[6] = v78;
              swift_bridgeObjectRetain();
              v116 = v114;
              sub_E74C(v112, (uint64_t)&unk_39470, (uint64_t)v113);
            }
            swift_release();
          }
          else
          {
            swift_bridgeObjectRelease();
          }
          return sub_52C8((uint64_t)&_swiftEmptyArrayStorage);
        }
        swift_bridgeObjectRelease();

LABEL_45:
        sub_2D07C((uint64_t)&v146, &qword_39458);
        return sub_52C8((uint64_t)&_swiftEmptyArrayStorage);
      }
      swift_bridgeObjectRelease();
LABEL_72:
      swift_bridgeObjectRelease();
      return sub_52C8((uint64_t)&_swiftEmptyArrayStorage);
    case 4:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return sub_C464();
    case 5:
      swift_bridgeObjectRelease();
      v145[0] = (id)1684632949;
      v145[1] = (id)0xE400000000000000;
      sub_2DCF0();
      if (*(void *)(v17 + 16) && (unint64_t v53 = sub_23330((uint64_t)&aBlock), (v54 & 1) != 0))
      {
        sub_27554(*(void *)(v17 + 56) + 32 * v53, (uint64_t)&v146);
      }
      else
      {
        long long v146 = 0u;
        long long v147 = 0u;
      }
      sub_27204((uint64_t)&aBlock);
      if (!*((void *)&v147 + 1)) {
        goto LABEL_44;
      }
      if ((swift_dynamicCast() & 1) == 0) {
        goto LABEL_72;
      }
      id v70 = v145[0];
      id v69 = v145[1];
      v145[0] = (id)0xD000000000000010;
      v145[1] = (id)0x800000000002F270;
      sub_2DCF0();
      if (*(void *)(v17 + 16) && (unint64_t v71 = sub_23330((uint64_t)&aBlock), (v72 & 1) != 0))
      {
        sub_27554(*(void *)(v17 + 56) + 32 * v71, (uint64_t)&v146);
      }
      else
      {
        long long v146 = 0u;
        long long v147 = 0u;
      }
      swift_bridgeObjectRelease();
      sub_27204((uint64_t)&aBlock);
      if (!*((void *)&v147 + 1)) {
        goto LABEL_44;
      }
      if ((swift_dynamicCast() & 1) == 0) {
        goto LABEL_72;
      }
      id v82 = v145[0];
      id v83 = v145[1];
      uint64_t v84 = sub_2DB30();
      uint64_t v85 = (uint64_t)v123;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v84 - 8) + 56))(v123, 1, 1, v84);
      v86 = (void *)swift_allocObject();
      v86[2] = 0;
      v86[3] = 0;
      v87 = v135;
      v86[4] = v135;
      v86[5] = v70;
      v86[6] = v69;
      v86[7] = v82;
      uint64_t v88 = v137;
      v86[8] = v83;
      v86[9] = v88;
      v86[10] = v29;
      swift_bridgeObjectRetain();
      v89 = v87;
      sub_E74C(v85, (uint64_t)&unk_394D0, (uint64_t)v86);
      swift_release();
      return sub_52C8((uint64_t)&_swiftEmptyArrayStorage);
    case 6:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v55 = v135;
      char v56 = *(void **)((char *)v135 + OBJC_IVAR___AXHapticMusicServer_queue);
      uint64_t v57 = swift_allocObject();
      *(void *)(v57 + 16) = v55;
      v143 = sub_276DC;
      v144 = (void *)v57;
      aBlock = _NSConcreteStackBlock;
      uint64_t v140 = 1107296256;
      v141 = sub_68F8;
      v142 = &unk_34E58;
      uint64_t v58 = _Block_copy(&aBlock);
      uint64_t v59 = v55;
      id v60 = v56;
      unint64_t v39 = v129;
      sub_2D940();
      *(void *)&long long v146 = &_swiftEmptyArrayStorage;
      sub_27694(&qword_394A8, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
      sub_4BA0(&qword_394B0);
      sub_281F8(&qword_394B8, &qword_394B0);
      char v40 = v130;
      uint64_t v41 = v134;
      sub_2DCB0();
      sub_2DBF0();
      _Block_release(v58);

LABEL_24:
      (*(void (**)(char *, uint64_t))(v132 + 8))(v40, v41);
      (*(void (**)(char *, uint64_t))(v131 + 8))(v39, v133);
      goto LABEL_25;
    default:
      swift_bridgeObjectRelease();
      char v42 = v128;
      v125(v128, v127, v32);
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain();
      uint64_t v43 = sub_2D8D0();
      os_log_type_t v44 = sub_2DB70();
      if (os_log_type_enabled(v43, v44))
      {
        uint64_t v45 = swift_slowAlloc();
        v135 = (void **)swift_slowAlloc();
        aBlock = v135;
        *(_DWORD *)uint64_t v45 = 134218498;
        *(void *)&long long v146 = v138;
        uint64_t v124 = v32;
        sub_2DC80();
        *(_WORD *)(v45 + 12) = 2080;
        swift_bridgeObjectRetain();
        *(void *)&long long v146 = sub_22B88(v137, v29, (uint64_t *)&aBlock);
        sub_2DC80();
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v45 + 22) = 2080;
        swift_bridgeObjectRetain();
        *(void *)&long long v146 = sub_22B88(v136, v30, (uint64_t *)&aBlock);
        sub_2DC80();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_0, v43, v44, "Unhandled service message: %ld from client: %s. Payload: %s", (uint8_t *)v45, 0x20u);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        uint64_t v46 = v128;
        uint64_t v47 = v124;
      }
      else
      {
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease_n();

        uint64_t v46 = v42;
        uint64_t v47 = v32;
      }
      v31(v46, v47);
      return sub_52C8((uint64_t)&_swiftEmptyArrayStorage);
  }
}

uint64_t sub_E680(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v13 = (void *)swift_task_alloc();
  *(void *)(v8 + 16) = v13;
  *uint64_t v13 = v8;
  v13[1] = sub_2D7AC;
  return sub_285E0(a5, a6, a7, a8, v16, v17);
}

uint64_t sub_E74C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2DB30();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_2DB20();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_2D07C(a1, &qword_39450);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_2DB10();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

void sub_E8F8()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_2D8F0();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&aBlock[-1] - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = OBJC_IVAR___AXHapticMusicServer_elapsedHapticPlayingTimeForTrack;
  if (*(double *)&v1[OBJC_IVAR___AXHapticMusicServer_elapsedHapticPlayingTimeForTrack] > 0.0)
  {
    double v7 = CFAbsoluteTimeGetCurrent() - *(double *)&v1[v6];
    uint64_t v8 = OBJC_IVAR___AXHapticMusicServer_totalActivePlayingTime;
    *(double *)&v1[OBJC_IVAR___AXHapticMusicServer_totalActivePlayingTime] = v7
                                                                           + *(double *)&v1[OBJC_IVAR___AXHapticMusicServer_totalActivePlayingTime];
    if (qword_39BA0 != -1) {
      swift_once();
    }
    uint64_t v9 = sub_46B4(v2, (uint64_t)HMLog);
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v9, v2);
    uint64_t v10 = v1;
    uint64_t v11 = sub_2D8D0();
    os_log_type_t v12 = sub_2DB60();
    if (os_log_type_enabled(v11, v12))
    {
      uint64_t v13 = (_DWORD *)swift_slowAlloc();
      uint64_t v19 = v8;
      uint64_t v14 = v13;
      *uint64_t v13 = 134218240;
      *(double *)aBlock = v7;
      sub_2DC80();
      *((_WORD *)v14 + 6) = 2048;
      aBlock[0] = *(void *)&v1[v19];
      sub_2DC80();

      _os_log_impl(&dword_0, v11, v12, "Play duration logging %f -> %f playback time", (uint8_t *)v14, 0x16u);
      swift_slowDealloc();
    }
    else
    {
    }
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    *(void *)&v1[v6] = 0;
    uint64_t v15 = *(void **)&v10[OBJC_IVAR___AXHapticMusicServer_playbackStatisticsTimer];
    if (([v15 isPending] & 1) == 0)
    {
      uint64_t v16 = swift_allocObject();
      *(void *)(v16 + 16) = v10;
      aBlock[4] = sub_28418;
      aBlock[5] = v16;
      aBlock[0] = _NSConcreteStackBlock;
      aBlock[1] = 1107296256;
      aBlock[2] = sub_68F8;
      aBlock[3] = &unk_35448;
      uint64_t v17 = _Block_copy(aBlock);
      unint64_t v18 = v10;
      swift_release();
      [v15 afterDelay:v17 processBlock:60.0];
      _Block_release(v17);
    }
  }
}

void sub_EC28(uint64_t a1, unint64_t a2, int a3, uint64_t a4, void (*a5)(char *, uint64_t), uint64_t a6, unint64_t a7)
{
  uint64_t v62 = a6;
  id v61 = a5;
  uint64_t v59 = a4;
  int v57 = a3;
  uint64_t v60 = a1;
  uint64_t v67 = sub_2D8F0();
  uint64_t v66 = *(void *)(v67 - 8);
  uint64_t v9 = __chkstk_darwin(v67);
  uint64_t v11 = (char *)&v54 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __chkstk_darwin(v9);
  uint64_t v14 = (char *)&v54 - v13;
  __chkstk_darwin(v12);
  uint64_t v16 = (char *)&v54 - v15;
  if (qword_39BA0 != -1) {
    swift_once();
  }
  uint64_t v17 = v67;
  uint64_t v18 = sub_46B4(v67, (uint64_t)HMLog);
  swift_beginAccess();
  uint64_t v19 = *(void (**)(char *, void *, uint64_t))(v66 + 16);
  id v65 = (void *)v18;
  uint64_t v64 = v66 + 16;
  char v63 = v19;
  v19(v16, (void *)v18, v17);
  swift_bridgeObjectRetain_n();
  uint64_t v20 = sub_2D8D0();
  os_log_type_t v21 = sub_2DB50();
  BOOL v22 = os_log_type_enabled(v20, v21);
  char v56 = v11;
  if (v22)
  {
    uint64_t v23 = swift_slowAlloc();
    unint64_t v55 = a7;
    unint64_t v24 = (uint8_t *)v23;
    uint64_t v69 = swift_slowAlloc();
    *(_DWORD *)unint64_t v24 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v25 = v60;
    uint64_t v68 = sub_22B88(v60, a2, &v69);
    sub_2DC80();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_0, v20, v21, "About to check available:%s", v24, 0xCu);
    swift_arrayDestroy();
    uint64_t v26 = v66;
    swift_slowDealloc();
    a7 = v55;
    swift_slowDealloc();

    uint64_t v27 = *(void (**)(char *, uint64_t))(v26 + 8);
    v27(v16, v67);
    uint64_t v28 = v62;
  }
  else
  {
    swift_bridgeObjectRelease_n();

    uint64_t v27 = *(void (**)(char *, uint64_t))(v66 + 8);
    v27(v16, v67);
    uint64_t v28 = v62;
    uint64_t v25 = v60;
  }
  char v29 = sub_10D5C(v25, a2, v57 & 1);
  sub_4BA0(&qword_39938);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2E940;
  *(void *)(inited + 32) = 0x6C62616C69617661;
  *(void *)(inited + 40) = 0xE900000000000065;
  *(unsigned char *)(inited + 48) = v29 & 1;
  *(void *)(inited + 72) = &type metadata for Bool;
  *(void *)(inited + 80) = 1684632949;
  uint64_t v31 = v59;
  *(void *)(inited + 88) = 0xE400000000000000;
  *(void *)(inited + 96) = v31;
  *(void *)(inited + 104) = v61;
  *(void *)(inited + 120) = &type metadata for String;
  *(void *)(inited + 128) = 1701080931;
  *(void *)(inited + 168) = &type metadata for String;
  *(void *)(inited + 136) = 0xE400000000000000;
  *(void *)(inited + 144) = v25;
  *(void *)(inited + 152) = a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  unint64_t v32 = sub_540C(inited);
  v63(v14, v65, v67);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  uint64_t v33 = sub_2D8D0();
  os_log_type_t v34 = sub_2DB50();
  int v35 = v34;
  if (os_log_type_enabled(v33, v34))
  {
    uint64_t v36 = swift_slowAlloc();
    LODWORD(v60) = v35;
    uint64_t v37 = v36;
    uint64_t v59 = swift_slowAlloc();
    uint64_t v69 = v59;
    *(_DWORD *)uint64_t v37 = 136315394;
    id v61 = v27;
    swift_bridgeObjectRetain();
    uint64_t v68 = sub_22B88(v28, a7, &v69);
    sub_2DC80();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v37 + 12) = 2080;
    swift_bridgeObjectRetain();
    uint64_t v38 = sub_2D9F0();
    uint64_t v58 = v14;
    unint64_t v40 = v39;
    swift_bridgeObjectRelease();
    uint64_t v68 = sub_22B88(v38, v40, &v69);
    uint64_t v27 = v61;
    sub_2DC80();
    uint64_t v41 = v67;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_0, v33, (os_log_type_t)v60, "Haptic track availability: %s %s", (uint8_t *)v37, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    char v42 = v58;
    uint64_t v43 = v41;
  }
  else
  {
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();

    char v42 = v14;
    uint64_t v43 = v67;
  }
  v27(v42, v43);
  swift_bridgeObjectRetain();
  NSString v44 = sub_2DA00();
  swift_bridgeObjectRelease();
  id v45 = [self clientMessengerWithIdentifier:v44];

  if (v45)
  {
    uint64_t v46 = v56;
    v63(v56, v65, v67);
    id v47 = v45;
    unint64_t v48 = sub_2D8D0();
    os_log_type_t v49 = sub_2DB50();
    if (os_log_type_enabled(v48, v49))
    {
      unint64_t v50 = (uint8_t *)swift_slowAlloc();
      id v65 = (void *)swift_slowAlloc();
      id v61 = v27;
      *(_DWORD *)unint64_t v50 = 138412290;
      uint64_t v69 = (uint64_t)v47;
      id v51 = v47;
      uint64_t v27 = v61;
      sub_2DC80();
      void *v65 = v45;

      _os_log_impl(&dword_0, v48, v49, "Send availability info to: %@", v50, 0xCu);
      sub_4BA0(&qword_39500);
      swift_arrayDestroy();
      uint64_t v46 = v56;
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
    }
    v27(v46, v67);
    sub_104D0(v32);
    swift_bridgeObjectRelease();
    Class isa = sub_2D9D0().super.isa;
    swift_bridgeObjectRelease();
    id v53 = [self mainAccessQueue];
    [v47 sendAsynchronousMessage:isa withIdentifier:2 targetAccessQueue:v53 completion:0];
  }
  else
  {
    swift_bridgeObjectRelease();
  }
}

uint64_t sub_F57C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[16] = a8;
  v8[17] = v10;
  v8[14] = a6;
  v8[15] = a7;
  v8[12] = a4;
  v8[13] = a5;
  return ((uint64_t (*)(uint64_t (*)(), void, void))_swift_task_switch)(sub_F5AC, 0, 0);
}

uint64_t sub_F5AC()
{
  uint64_t v1 = (void *)v0[17];
  uint64_t v2 = *(void *)(v0[12] + OBJC_IVAR___AXHapticMusicServer_statusObservers);
  v0[18] = v2;
  id v3 = v1;
  swift_bridgeObjectRetain();
  return ((uint64_t (*)(uint64_t (*)(), uint64_t, void))_swift_task_switch)(sub_F63C, v2, 0);
}

uint64_t sub_F63C()
{
  uint64_t v1 = (void *)v0[17];
  uint64_t v2 = v0[18];
  uint64_t v4 = v0[15];
  uint64_t v3 = v0[16];
  uint64_t v6 = v0[13];
  uint64_t v5 = v0[14];
  swift_beginAccess();
  id v7 = v1;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v10 = *(void *)(v2 + 112);
  *(void *)(v2 + 112) = 0x8000000000000000;
  sub_2589C(v4, v3, (uint64_t)v1, v6, v5, isUniquelyReferenced_nonNull_native);
  *(void *)(v2 + 112) = v10;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_endAccess();

  swift_bridgeObjectRelease();
  return ((uint64_t (*)(uint64_t (*)(), void, void))_swift_task_switch)(sub_F760, 0, 0);
}

uint64_t sub_F760()
{
  uint64_t v1 = *(void *)(v0 + 96) + OBJC_IVAR___AXHapticMusicServer_trackIdentifier;
  long long v3 = *(_OWORD *)(v1 + 16);
  long long v2 = *(_OWORD *)(v1 + 32);
  long long v4 = *(_OWORD *)v1;
  *(void *)(v0 + 64) = *(void *)(v1 + 48);
  *(_OWORD *)(v0 + 32) = v3;
  *(_OWORD *)(v0 + 48) = v2;
  *(_OWORD *)(v0 + 16) = v4;
  sub_2BBDC(v0 + 16);
  uint64_t v5 = swift_task_alloc();
  *(void *)(v0 + 152) = v5;
  *(void *)uint64_t v5 = v0;
  *(void *)(v5 + 8) = sub_F848;
  uint64_t v6 = *(void *)(v0 + 96);
  *(unsigned char *)(v5 + 176) = 1;
  *(void *)(v5 + 96) = v0 + 16;
  *(void *)(v5 + 104) = v6;
  return ((uint64_t (*)(uint64_t (*)(), void, void))_swift_task_switch)(sub_F96C, 0, 0);
}

uint64_t sub_F848()
{
  uint64_t v1 = *v0 + 16;
  uint64_t v4 = *v0;
  swift_task_dealloc();
  sub_2BC28(v1);
  long long v2 = *(uint64_t (**)(void))(v4 + 8);
  return v2();
}

uint64_t sub_F948(uint64_t a1, char a2)
{
  *(unsigned char *)(v3 + 176) = a2;
  *(void *)(v3 + 96) = a1;
  *(void *)(v3 + 104) = v2;
  return ((uint64_t (*)(uint64_t (*)(), void, void))_swift_task_switch)(sub_F96C, 0, 0);
}

uint64_t sub_F96C()
{
  uint64_t v1 = CFNotificationCenterGetDarwinNotifyCenter();
  if (_kAXSMusicHapticsActiveStatusDidChangeNotification)
  {
    uint64_t v2 = v1;
    uint64_t v3 = *(void *)(v0 + 104);
    uint64_t v4 = (__CFString *)_kAXSMusicHapticsActiveStatusDidChangeNotification;
    CFNotificationCenterPostNotification(v2, v4, 0, 0, 1u);

    *(void *)(v0 + 112) = *(void *)(v3 + OBJC_IVAR___AXHapticMusicServer_statusObservers);
    uint64_t v1 = (__CFNotificationCenter *)sub_FA30;
  }
  else
  {
    __break(1u);
  }
  return ((uint64_t (*)(__CFNotificationCenter *))_swift_task_switch)(v1);
}

uint64_t sub_FA30()
{
  uint64_t v1 = *(void *)(v0 + 112);
  swift_beginAccess();
  *(void *)(v0 + 120) = *(void *)(v1 + 112);
  swift_bridgeObjectRetain();
  return ((uint64_t (*)(uint64_t (*)(), void, void))_swift_task_switch)(sub_FAB8, 0, 0);
}

uint64_t sub_FAB8()
{
  uint64_t v1 = *(void *)(v0 + 120);
  char v2 = *(unsigned char *)(v1 + 32);
  *(unsigned char *)(v0 + 177) = v2;
  uint64_t v3 = -1;
  uint64_t v4 = -1 << v2;
  if (-v4 < 64) {
    uint64_t v3 = ~(-1 << -(char)v4);
  }
  unint64_t v5 = v3 & *(void *)(v1 + 64);
  if (v5)
  {
    uint64_t v6 = 0;
    unint64_t v7 = __clz(__rbit64(v5));
    uint64_t v8 = (v5 - 1) & v5;
LABEL_5:
    *(void *)(v0 + 128) = v6;
    *(void *)(v0 + 136) = v8;
    uint64_t v9 = (uint64_t *)(*(void *)(v1 + 48) + 16 * v7);
    uint64_t v10 = *v9;
    uint64_t v11 = v9[1];
    *(void *)(v0 + 144) = v11;
    uint64_t v12 = (uint64_t *)(*(void *)(v1 + 56) + 24 * v7);
    uint64_t v13 = *v12;
    uint64_t v14 = v12[1];
    *(void *)(v0 + 152) = v14;
    uint64_t v15 = (void *)v12[2];
    *(void *)(v0 + 160) = v15;
    *(void *)(v0 + 80) = v13;
    *(void *)(v0 + 88) = v14;
    id v16 = v15;
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain();
    sub_4BA0(&qword_398B0);
    sub_2CC08();
    sub_2DCF0();
    uint64_t v17 = (void *)swift_task_alloc();
    *(void *)(v0 + 168) = v17;
    *uint64_t v17 = v0;
    v17[1] = sub_FD1C;
    char v18 = *(unsigned char *)(v0 + 176);
    uint64_t v19 = *(void *)(v0 + 96);
    return sub_290E0(v10, v11, v0 + 16, v19, v18);
  }
  unint64_t v21 = 63 - v4;
  if (v21 > 0x7F)
  {
    unint64_t v22 = *(void *)(v1 + 72);
    if (v22)
    {
      uint64_t v6 = 1;
LABEL_11:
      uint64_t v8 = (v22 - 1) & v22;
      unint64_t v7 = __clz(__rbit64(v22)) + (v6 << 6);
      goto LABEL_5;
    }
    if (v21 >= 0xC0)
    {
      unint64_t v22 = *(void *)(v1 + 80);
      if (v22)
      {
        uint64_t v6 = 2;
        goto LABEL_11;
      }
      if (v21 >= 0x100)
      {
        unint64_t v22 = *(void *)(v1 + 88);
        if (v22)
        {
          uint64_t v6 = 3;
          goto LABEL_11;
        }
        if (v21 >= 0x140)
        {
          unint64_t v22 = *(void *)(v1 + 96);
          if (v22)
          {
            uint64_t v6 = 4;
            goto LABEL_11;
          }
          uint64_t v23 = 0;
          uint64_t v24 = v21 >> 6;
          if (v24 <= 5) {
            uint64_t v24 = 5;
          }
          uint64_t v25 = v24 - 5;
          while (v25 != v23)
          {
            unint64_t v22 = *(void *)(v1 + 104 + 8 * v23++);
            if (v22)
            {
              uint64_t v6 = v23 + 4;
              goto LABEL_11;
            }
          }
        }
      }
    }
  }
  swift_release();
  uint64_t v26 = *(uint64_t (**)(void))(v0 + 8);
  return v26();
}

uint64_t sub_FD1C()
{
  uint64_t v1 = *v0 + 16;
  swift_task_dealloc();
  sub_27204(v1);
  return ((uint64_t (*)(uint64_t (*)(), void, void))_swift_task_switch)(sub_FE24, 0, 0);
}

uint64_t sub_FE24()
{
  uint64_t v1 = *(void **)(v0 + 160);
  swift_bridgeObjectRelease();

  uint64_t result = swift_bridgeObjectRelease();
  int64_t v3 = *(void *)(v0 + 128);
  unint64_t v4 = *(void *)(v0 + 136);
  if (v4)
  {
    uint64_t v5 = (v4 - 1) & v4;
    unint64_t v6 = __clz(__rbit64(v4)) | (v3 << 6);
    uint64_t result = *(void *)(v0 + 120);
LABEL_3:
    *(void *)(v0 + 128) = v3;
    *(void *)(v0 + 136) = v5;
    unint64_t v7 = (uint64_t *)(*(void *)(result + 48) + 16 * v6);
    uint64_t v8 = *v7;
    uint64_t v9 = v7[1];
    *(void *)(v0 + 144) = v9;
    uint64_t v10 = (uint64_t *)(*(void *)(result + 56) + 24 * v6);
    uint64_t v11 = *v10;
    uint64_t v12 = v10[1];
    *(void *)(v0 + 152) = v12;
    uint64_t v13 = (void *)v10[2];
    *(void *)(v0 + 160) = v13;
    *(void *)(v0 + 80) = v11;
    *(void *)(v0 + 88) = v12;
    id v14 = v13;
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain();
    sub_4BA0(&qword_398B0);
    sub_2CC08();
    sub_2DCF0();
    uint64_t v15 = (void *)swift_task_alloc();
    *(void *)(v0 + 168) = v15;
    *uint64_t v15 = v0;
    v15[1] = sub_FD1C;
    char v16 = *(unsigned char *)(v0 + 176);
    uint64_t v17 = *(void *)(v0 + 96);
    return sub_290E0(v8, v9, v0 + 16, v17, v16);
  }
  int64_t v18 = v3 + 1;
  if (__OFADD__(v3, 1))
  {
    __break(1u);
    goto LABEL_24;
  }
  int64_t v19 = (unint64_t)((1 << *(unsigned char *)(v0 + 177)) + 63) >> 6;
  uint64_t result = *(void *)(v0 + 120);
  if (v18 < v19)
  {
    uint64_t v20 = result + 64;
    unint64_t v21 = *(void *)(result + 64 + 8 * v18);
    ++v3;
    if (v21)
    {
LABEL_9:
      uint64_t v5 = (v21 - 1) & v21;
      unint64_t v6 = __clz(__rbit64(v21)) + (v3 << 6);
      goto LABEL_3;
    }
    int64_t v3 = v18 + 1;
    if (v18 + 1 < v19)
    {
      unint64_t v21 = *(void *)(v20 + 8 * v3);
      if (v21) {
        goto LABEL_9;
      }
      int64_t v3 = v18 + 2;
      if (v18 + 2 < v19)
      {
        unint64_t v21 = *(void *)(v20 + 8 * v3);
        if (v21) {
          goto LABEL_9;
        }
        int64_t v22 = v18 + 3;
        if (v22 < v19)
        {
          unint64_t v21 = *(void *)(v20 + 8 * v22);
          if (v21)
          {
            int64_t v3 = v22;
            goto LABEL_9;
          }
          while (1)
          {
            int64_t v3 = v22 + 1;
            if (__OFADD__(v22, 1)) {
              break;
            }
            if (v3 >= v19) {
              goto LABEL_20;
            }
            unint64_t v21 = *(void *)(v20 + 8 * v3);
            ++v22;
            if (v21) {
              goto LABEL_9;
            }
          }
LABEL_24:
          __break(1u);
          return result;
        }
      }
    }
  }
LABEL_20:
  swift_release();
  uint64_t v23 = *(uint64_t (**)(void))(v0 + 8);
  return v23();
}

uint64_t sub_10080(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[9] = a8;
  v8[10] = v10;
  v8[7] = a6;
  v8[8] = a7;
  v8[5] = a4;
  v8[6] = a5;
  return ((uint64_t (*)(uint64_t (*)(), void, void))_swift_task_switch)(sub_100B0, 0, 0);
}

uint64_t sub_100B0()
{
  uint64_t v1 = (void *)v0[10];
  uint64_t v2 = *(void *)(v0[5] + OBJC_IVAR___AXHapticMusicServer_statusObservers);
  v0[11] = v2;
  id v3 = v1;
  swift_bridgeObjectRetain();
  return ((uint64_t (*)(uint64_t (*)(), uint64_t, void))_swift_task_switch)(sub_10140, v2, 0);
}

uint64_t sub_10140()
{
  uint64_t v1 = (void *)v0[10];
  uint64_t v2 = v0[11];
  uint64_t v4 = v0[8];
  uint64_t v3 = v0[9];
  uint64_t v6 = v0[6];
  uint64_t v5 = v0[7];
  swift_beginAccess();
  id v7 = v1;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v11 = *(void *)(v2 + 112);
  *(void *)(v2 + 112) = 0x8000000000000000;
  sub_2589C(v4, v3, (uint64_t)v1, v6, v5, isUniquelyReferenced_nonNull_native);
  *(void *)(v2 + 112) = v11;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_endAccess();

  swift_bridgeObjectRelease();
  uint64_t v9 = (uint64_t (*)(void))v0[1];
  return v9();
}

uint64_t sub_1025C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[6] = a5;
  v6[7] = a6;
  v6[5] = a4;
  return ((uint64_t (*)(uint64_t (*)(), void, void))_swift_task_switch)(sub_10280, 0, 0);
}

uint64_t sub_10280()
{
  *(void *)(v0 + 64) = *(void *)(*(void *)(v0 + 40) + OBJC_IVAR___AXHapticMusicServer_statusObservers);
  return ((uint64_t (*)(uint64_t (*)()))_swift_task_switch)(sub_102AC);
}

uint64_t sub_102AC()
{
  uint64_t v1 = v0[7];
  uint64_t v2 = v0[6];
  swift_beginAccess();
  swift_bridgeObjectRetain();
  uint64_t v3 = sub_23860(v2, v1);
  uint64_t v5 = v4;
  id v7 = v6;
  swift_endAccess();
  swift_bridgeObjectRelease();
  sub_2D190(v3, v5, v7);
  uint64_t v8 = (uint64_t (*)(void))v0[1];
  return v8();
}

uint64_t sub_104D0(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    sub_4BA0(&qword_39940);
    uint64_t v2 = (void *)sub_2DDD0();
  }
  else
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
  }
  uint64_t v28 = a1 + 64;
  uint64_t v3 = -1 << *(unsigned char *)(a1 + 32);
  if (-v3 < 64) {
    uint64_t v4 = ~(-1 << -(char)v3);
  }
  else {
    uint64_t v4 = -1;
  }
  unint64_t v5 = v4 & *(void *)(a1 + 64);
  int64_t v27 = (unint64_t)(63 - v3) >> 6;
  uint64_t v6 = (char *)(v2 + 8);
  swift_bridgeObjectRetain();
  uint64_t result = swift_retain();
  int64_t v8 = 0;
  while (1)
  {
    if (v5)
    {
      unint64_t v11 = __clz(__rbit64(v5));
      v5 &= v5 - 1;
      unint64_t v12 = v11 | (v8 << 6);
      goto LABEL_28;
    }
    int64_t v13 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    if (v13 >= v27) {
      goto LABEL_37;
    }
    unint64_t v14 = *(void *)(v28 + 8 * v13);
    int64_t v15 = v8 + 1;
    if (!v14)
    {
      int64_t v15 = v8 + 2;
      if (v8 + 2 >= v27) {
        goto LABEL_37;
      }
      unint64_t v14 = *(void *)(v28 + 8 * v15);
      if (!v14)
      {
        int64_t v15 = v8 + 3;
        if (v8 + 3 >= v27) {
          goto LABEL_37;
        }
        unint64_t v14 = *(void *)(v28 + 8 * v15);
        if (!v14)
        {
          int64_t v15 = v8 + 4;
          if (v8 + 4 >= v27) {
            goto LABEL_37;
          }
          unint64_t v14 = *(void *)(v28 + 8 * v15);
          if (!v14) {
            break;
          }
        }
      }
    }
LABEL_27:
    unint64_t v5 = (v14 - 1) & v14;
    unint64_t v12 = __clz(__rbit64(v14)) + (v15 << 6);
    int64_t v8 = v15;
LABEL_28:
    uint64_t v17 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v12);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    sub_27554(*(void *)(a1 + 56) + 32 * v12, (uint64_t)v40);
    *(void *)&long long v39 = v19;
    *((void *)&v39 + 1) = v18;
    v37[2] = v39;
    v38[0] = v40[0];
    v38[1] = v40[1];
    *(void *)&v37[0] = v19;
    *((void *)&v37[0] + 1) = v18;
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    sub_2C65C(v38, v32);
    long long v33 = v29;
    long long v34 = v30;
    uint64_t v35 = v31;
    sub_2C65C(v32, v36);
    long long v29 = v33;
    long long v30 = v34;
    uint64_t v31 = v35;
    sub_2C65C(v36, v37);
    sub_2C65C(v37, &v33);
    uint64_t result = sub_2DCD0(v2[5]);
    uint64_t v20 = -1 << *((unsigned char *)v2 + 32);
    unint64_t v21 = result & ~v20;
    unint64_t v22 = v21 >> 6;
    if (((-1 << v21) & ~*(void *)&v6[8 * (v21 >> 6)]) != 0)
    {
      unint64_t v9 = __clz(__rbit64((-1 << v21) & ~*(void *)&v6[8 * (v21 >> 6)])) | v21 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v23 = 0;
      unint64_t v24 = (unint64_t)(63 - v20) >> 6;
      do
      {
        if (++v22 == v24 && (v23 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        BOOL v25 = v22 == v24;
        if (v22 == v24) {
          unint64_t v22 = 0;
        }
        v23 |= v25;
        uint64_t v26 = *(void *)&v6[8 * v22];
      }
      while (v26 == -1);
      unint64_t v9 = __clz(__rbit64(~v26)) + (v22 << 6);
    }
    *(void *)&v6[(v9 >> 3) & 0x1FFFFFFFFFFFFFF8] |= 1 << v9;
    uint64_t v10 = v2[6] + 40 * v9;
    *(_OWORD *)uint64_t v10 = v29;
    *(_OWORD *)(v10 + 16) = v30;
    *(void *)(v10 + 32) = v31;
    uint64_t result = (uint64_t)sub_2C65C(&v33, (_OWORD *)(v2[7] + 32 * v9));
    ++v2[2];
  }
  int64_t v16 = v8 + 5;
  if (v8 + 5 >= v27)
  {
LABEL_37:
    swift_release();
    sub_2C654();
    return (uint64_t)v2;
  }
  unint64_t v14 = *(void *)(v28 + 8 * v16);
  if (v14)
  {
    int64_t v15 = v8 + 5;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v15 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v15 >= v27) {
      goto LABEL_37;
    }
    unint64_t v14 = *(void *)(v28 + 8 * v15);
    ++v16;
    if (v14) {
      goto LABEL_27;
    }
  }
LABEL_39:
  __break(1u);
  return result;
}

uint64_t sub_10898(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    sub_4BA0(&qword_39940);
    uint64_t v2 = (void *)sub_2DDD0();
  }
  else
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
  }
  uint64_t v28 = a1 + 64;
  uint64_t v3 = -1 << *(unsigned char *)(a1 + 32);
  if (-v3 < 64) {
    uint64_t v4 = ~(-1 << -(char)v3);
  }
  else {
    uint64_t v4 = -1;
  }
  unint64_t v5 = v4 & *(void *)(a1 + 64);
  int64_t v27 = (unint64_t)(63 - v3) >> 6;
  uint64_t v6 = (char *)(v2 + 8);
  swift_bridgeObjectRetain();
  uint64_t result = swift_retain();
  int64_t v8 = 0;
  while (1)
  {
    if (v5)
    {
      unint64_t v11 = __clz(__rbit64(v5));
      v5 &= v5 - 1;
      unint64_t v12 = v11 | (v8 << 6);
      goto LABEL_28;
    }
    int64_t v13 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    if (v13 >= v27) {
      goto LABEL_37;
    }
    unint64_t v14 = *(void *)(v28 + 8 * v13);
    int64_t v15 = v8 + 1;
    if (!v14)
    {
      int64_t v15 = v8 + 2;
      if (v8 + 2 >= v27) {
        goto LABEL_37;
      }
      unint64_t v14 = *(void *)(v28 + 8 * v15);
      if (!v14)
      {
        int64_t v15 = v8 + 3;
        if (v8 + 3 >= v27) {
          goto LABEL_37;
        }
        unint64_t v14 = *(void *)(v28 + 8 * v15);
        if (!v14)
        {
          int64_t v15 = v8 + 4;
          if (v8 + 4 >= v27) {
            goto LABEL_37;
          }
          unint64_t v14 = *(void *)(v28 + 8 * v15);
          if (!v14) {
            break;
          }
        }
      }
    }
LABEL_27:
    unint64_t v5 = (v14 - 1) & v14;
    unint64_t v12 = __clz(__rbit64(v14)) + (v15 << 6);
    int64_t v8 = v15;
LABEL_28:
    uint64_t v17 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v12);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    sub_2C5F8(*(void *)(a1 + 56) + 40 * v12, (uint64_t)v46);
    uint64_t v44 = v19;
    uint64_t v45 = v18;
    long long v41 = v46[0];
    long long v42 = v46[1];
    uint64_t v43 = v47;
    uint64_t v31 = v19;
    uint64_t v32 = v18;
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    v29[0] = v41;
    v29[1] = v42;
    uint64_t v30 = v43;
    swift_dynamicCast();
    long long v37 = v33;
    long long v38 = v34;
    uint64_t v39 = v35;
    sub_2C65C(&v36, v40);
    long long v33 = v37;
    long long v34 = v38;
    uint64_t v35 = v39;
    sub_2C65C(v40, v29);
    sub_2C65C(v29, &v37);
    uint64_t result = sub_2DCD0(v2[5]);
    uint64_t v20 = -1 << *((unsigned char *)v2 + 32);
    unint64_t v21 = result & ~v20;
    unint64_t v22 = v21 >> 6;
    if (((-1 << v21) & ~*(void *)&v6[8 * (v21 >> 6)]) != 0)
    {
      unint64_t v9 = __clz(__rbit64((-1 << v21) & ~*(void *)&v6[8 * (v21 >> 6)])) | v21 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v23 = 0;
      unint64_t v24 = (unint64_t)(63 - v20) >> 6;
      do
      {
        if (++v22 == v24 && (v23 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        BOOL v25 = v22 == v24;
        if (v22 == v24) {
          unint64_t v22 = 0;
        }
        v23 |= v25;
        uint64_t v26 = *(void *)&v6[8 * v22];
      }
      while (v26 == -1);
      unint64_t v9 = __clz(__rbit64(~v26)) + (v22 << 6);
    }
    *(void *)&v6[(v9 >> 3) & 0x1FFFFFFFFFFFFFF8] |= 1 << v9;
    uint64_t v10 = v2[6] + 40 * v9;
    *(_OWORD *)uint64_t v10 = v33;
    *(_OWORD *)(v10 + 16) = v34;
    *(void *)(v10 + 32) = v35;
    uint64_t result = (uint64_t)sub_2C65C(&v37, (_OWORD *)(v2[7] + 32 * v9));
    ++v2[2];
  }
  int64_t v16 = v8 + 5;
  if (v8 + 5 >= v27)
  {
LABEL_37:
    swift_release();
    sub_2C654();
    return (uint64_t)v2;
  }
  unint64_t v14 = *(void *)(v28 + 8 * v16);
  if (v14)
  {
    int64_t v15 = v8 + 5;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v15 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v15 >= v27) {
      goto LABEL_37;
    }
    unint64_t v14 = *(void *)(v28 + 8 * v15);
    ++v16;
    if (v14) {
      goto LABEL_27;
    }
  }
LABEL_39:
  __break(1u);
  return result;
}

uint64_t sub_10C80(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    sub_4BA0(&qword_399C8);
    uint64_t v5 = swift_allocError();
    *uint64_t v6 = a3;
    id v7 = a3;
    return _swift_continuation_throwingResumeWithError(v3, v5);
  }
  else
  {
    **(void **)(*(void *)(v3 + 64) + 40) = sub_2D9E0();
    return _swift_continuation_throwingResume(v3);
  }
}

uint64_t sub_10D5C(uint64_t a1, uint64_t a2, int a3)
{
  LODWORD(v157) = a3;
  uint64_t v156 = a2;
  uint64_t v158 = a1;
  uint64_t v4 = sub_2D930();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  id v7 = (char *)&v131 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_2D960();
  uint64_t v151 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  v150 = (char *)&v131 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_2D980();
  uint64_t v148 = *(void *)(v10 - 8);
  uint64_t v149 = v10;
  uint64_t v11 = __chkstk_darwin(v10);
  long long v146 = (char *)&v131 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  long long v147 = (char *)&v131 - v13;
  uint64_t v14 = sub_2D8F0();
  unint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = __chkstk_darwin(v14);
  uint64_t v17 = __chkstk_darwin(v16);
  uint64_t v18 = __chkstk_darwin(v17);
  __chkstk_darwin(v18);
  uint64_t v20 = __chkstk_darwin((char *)&v131 - v19);
  v152 = (char *)&v131 - v21;
  uint64_t v22 = __chkstk_darwin(v20);
  int64_t v27 = (char *)&v131 - v26;
  v154 = v3;
  uint64_t v28 = &v3[OBJC_IVAR___AXHapticMusicServer_trackIdentifier];
  id v29 = *(id *)&v3[OBJC_IVAR___AXHapticMusicServer_trackIdentifier];
  if (v29 == (id)99999999)
  {
    if (qword_39BA0 != -1) {
      swift_once();
    }
    uint64_t v30 = sub_46B4(v14, (uint64_t)HMLog);
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))(v27, v30, v14);
    uint64_t v31 = sub_2D8D0();
    os_log_type_t v32 = sub_2DB60();
    if (os_log_type_enabled(v31, v32))
    {
      long long v33 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)long long v33 = 0;
      _os_log_impl(&dword_0, v31, v32, "Matched sample track - must be active", v33, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v15 + 8))(v27, v14);
    return 1;
  }
  uint64_t v144 = v24;
  v145 = (void (*)(void, void))v22;
  uint64_t v139 = v4;
  uint64_t v140 = v25;
  uint64_t v135 = v23;
  uint64_t v136 = v7;
  uint64_t v137 = v8;
  uint64_t v138 = v5;
  unint64_t v155 = v15;
  v153 = (void *)v14;
  uint64_t v34 = *((void *)v28 + 1);
  uint64_t v35 = *((void *)v28 + 2);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v157)
  {
    unint64_t v36 = v156;
    NSString v37 = sub_2DA00();
    id v38 = [v37 longLongValue];

    uint64_t v39 = 0;
    unint64_t v40 = 0xE000000000000000;
    if (v29 && v38 && v29 == v38) {
      goto LABEL_11;
    }
  }
  else
  {
    unint64_t v36 = v156;
    swift_bridgeObjectRetain();
    uint64_t v39 = v158;
    unint64_t v40 = v36;
  }
  if (!v34 && v35 == 0xE000000000000000
    || (sub_2DE10() & 1) != 0
    || !v39 && v40 == 0xE000000000000000
    || (sub_2DE10() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    if (v34 == v39 && v35 == v40)
    {
      swift_bridgeObjectRelease();
LABEL_11:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      goto LABEL_12;
    }
    char v130 = sub_2DE10();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v130)
    {
LABEL_12:
      long long v41 = v153;
      unint64_t v42 = v155;
      if (qword_39BA0 == -1)
      {
LABEL_13:
        uint64_t v43 = sub_46B4((uint64_t)v41, (uint64_t)HMLog);
        swift_beginAccess();
        (*(void (**)(char *, uint64_t, void *))(v42 + 16))(v152, v43, v41);
        uint64_t v44 = sub_2D8D0();
        os_log_type_t v45 = sub_2DB60();
        if (os_log_type_enabled(v44, v45))
        {
          uint64_t v46 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v46 = 0;
          _os_log_impl(&dword_0, v44, v45, "Matched current track - must be active", v46, 2u);
          swift_slowDealloc();
        }

        (*(void (**)(char *, void *))(v42 + 8))(v152, v41);
        return 1;
      }
LABEL_59:
      swift_once();
      goto LABEL_13;
    }
  }
  uint64_t v48 = (uint64_t)v153;
  unint64_t v49 = v155;
  if (v157)
  {
    NSString v50 = sub_2DA00();
    id v51 = [v50 longLongValue];

    uint64_t v52 = 0;
    unint64_t v42 = 0xE000000000000000;
  }
  else
  {
    swift_bridgeObjectRetain();
    id v51 = 0;
    uint64_t v52 = v158;
    unint64_t v42 = v36;
  }
  *(void *)&long long v168 = v51;
  *((void *)&v168 + 1) = v52;
  long long v169 = v42;
  long long v170 = 0xE000000000000000;
  unint64_t v171 = 0xE000000000000000;
  if (qword_39BA0 != -1) {
    swift_once();
  }
  uint64_t v53 = sub_46B4(v48, (uint64_t)HMLog);
  swift_beginAccess();
  uint64_t v54 = *(void (**)(uint64_t, uint64_t, uint64_t))(v49 + 16);
  unint64_t v55 = v145;
  unint64_t v142 = v49 + 16;
  uint64_t v143 = v53;
  v141 = v54;
  v54((uint64_t)v145, v53, v48);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  char v56 = sub_2D8D0();
  os_log_type_t v57 = sub_2DB60();
  BOOL v58 = os_log_type_enabled(v56, v57);
  id v134 = v51;
  if (v58)
  {
    uint64_t v59 = (uint8_t *)swift_slowAlloc();
    uint64_t aBlock = swift_slowAlloc();
    *(_DWORD *)uint64_t v59 = 136315138;
    v152 = (char *)(v59 + 4);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain_n();
    unint64_t v60 = sub_46EC();
    unint64_t v62 = v61;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    uint64_t v159 = sub_22B88(v60, v62, &aBlock);
    sub_2DC80();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_0, v56, v57, "Requesting track identifier %s", v59, 0xCu);
    swift_arrayDestroy();
    uint64_t v63 = (uint64_t)v153;
    swift_slowDealloc();
    swift_slowDealloc();

    uint64_t v64 = *(void (**)(void, uint64_t))(v155 + 8);
    id v65 = v55;
    uint64_t v66 = v63;
    v64(v65, v63);
  }
  else
  {
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();

    uint64_t v64 = *(void (**)(void, uint64_t))(v49 + 8);
    uint64_t v67 = v55;
    uint64_t v66 = v48;
    v64(v67, v48);
  }
  id v167 = 0;
  long long v41 = v154;
  uint64_t v133 = OBJC_IVAR___AXHapticMusicServer_ahapAvailableCacheQueue;
  uint64_t v68 = *(void **)&v154[OBJC_IVAR___AXHapticMusicServer_ahapAvailableCacheQueue];
  uint64_t v69 = swift_allocObject();
  *(void *)(v69 + 16) = &v167;
  *(void *)(v69 + 24) = v41;
  long long v70 = v169;
  *(_OWORD *)(v69 + 32) = v168;
  *(_OWORD *)(v69 + 48) = v70;
  *(_OWORD *)(v69 + 64) = v170;
  *(void *)(v69 + 80) = v171;
  uint64_t v71 = swift_allocObject();
  *(void *)(v71 + 16) = sub_2CD24;
  *(void *)(v71 + 24) = v69;
  v165 = sub_2D5A0;
  uint64_t v166 = v71;
  uint64_t aBlock = (uint64_t)_NSConcreteStackBlock;
  uint64_t v162 = 1107296256;
  v163 = (uint64_t (*)())sub_16804;
  v164 = &unk_35F90;
  char v72 = _Block_copy(&aBlock);
  v152 = (char *)v42;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain_n();
  unint64_t v73 = v68;
  id v132 = v41;
  swift_retain();
  swift_release();
  dispatch_sync(v73, v72);

  _Block_release(v72);
  LOBYTE(v72) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  if (v72)
  {
    __break(1u);
    goto LABEL_59;
  }
  if (v167)
  {
    id v157 = (id)v69;
    v145 = v64;
    id v74 = v167;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    uint64_t v75 = v144;
    v141(v144, v143, v66);
    uint64_t v76 = v66;
    unint64_t v77 = v156;
    swift_bridgeObjectRetain_n();
    id v78 = v74;
    id v79 = sub_2D8D0();
    os_log_type_t v80 = sub_2DB60();
    char v81 = &AXHapticMusicServer__prots;
    if (os_log_type_enabled(v79, v80))
    {
      uint64_t v82 = swift_slowAlloc();
      uint64_t aBlock = swift_slowAlloc();
      *(_DWORD *)uint64_t v82 = 136315394;
      swift_bridgeObjectRetain();
      uint64_t v159 = sub_22B88(v158, v77, &aBlock);
      sub_2DC80();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v82 + 12) = 1024;
      unsigned int v83 = [v78 BOOLValue];

      LODWORD(v159) = v83;
      char v81 = &AXHapticMusicServer__prots;
      sub_2DC80();

      _os_log_impl(&dword_0, v79, v80, "Returning cached result for %s = %{BOOL}d", (uint8_t *)v82, 0x12u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      uint64_t v84 = v75;
      uint64_t v85 = (uint64_t)v153;
    }
    else
    {

      swift_bridgeObjectRelease_n();
      uint64_t v84 = v75;
      uint64_t v85 = v76;
    }
    v145(v84, v85);
    id v47 = [v78 (SEL)v81[479].count];

    id v90 = v167;
LABEL_54:
    swift_release();

    return (uint64_t)v47;
  }
  if (v134 != (id)99999999)
  {
    sub_2CAD4(0, &qword_398C0);
    sub_4BA0(&qword_398C8);
    v145 = v64;
    if (v157)
    {
      uint64_t inited = swift_initStackObject();
      v92 = (void *)inited;
      *(_OWORD *)(inited + 16) = xmmword_2E950;
      v93 = &SHMediaItemAppleMusicID;
    }
    else
    {
      uint64_t inited = swift_initStackObject();
      v92 = (void *)inited;
      *(_OWORD *)(inited + 16) = xmmword_2E950;
      v93 = &SHMediaItemISRC;
    }
    SHMediaItemProperty v94 = *v93;
    *(SHMediaItemProperty *)(inited + 32) = *v93;
    v92[8] = &type metadata for String;
    uint64_t v95 = v156;
    v92[5] = v158;
    v92[6] = v95;
    swift_bridgeObjectRetain();
    v96 = v94;
    id v97 = (void *)sub_5544((uint64_t)v92);
    id v98 = (void *)sub_1682C(v97);
    uint64_t v99 = swift_allocObject();
    *(unsigned char *)(v99 + 16) = 0;
    uint64_t v158 = v99 + 16;
    id v100 = v98;
    dispatch_semaphore_t v101 = dispatch_semaphore_create(0);
    id v102 = self;
    uint64_t v103 = swift_allocObject();
    *(void *)(v103 + 16) = v99;
    *(void *)(v103 + 24) = v101;
    v165 = sub_2CE24;
    uint64_t v166 = v103;
    uint64_t aBlock = (uint64_t)_NSConcreteStackBlock;
    uint64_t v162 = 1107296256;
    v163 = (uint64_t (*)())sub_17508;
    v164 = &unk_35FE0;
    uint64_t v104 = _Block_copy(&aBlock);
    swift_retain();
    uint64_t v105 = v101;
    swift_release();
    [v102 isHapticTrackAvailableForMediaItem:v100 completionHandler:v104];
    _Block_release(v104);
    v106 = v146;
    sub_2D970();
    v107 = v147;
    sub_2D990();
    uint64_t v108 = *(void (**)(char *, uint64_t))(v148 + 8);
    v109 = v106;
    uint64_t v110 = v149;
    v108(v109, v149);
    sub_2DC50();
    id v157 = v100;

    v108(v107, v110);
    uint64_t v111 = v135;
    v141(v135, v143, v66);
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    swift_retain_n();
    uint64_t v112 = sub_2D8D0();
    os_log_type_t v113 = sub_2DB60();
    int v114 = v113;
    if (os_log_type_enabled(v112, v113))
    {
      uint64_t v115 = swift_slowAlloc();
      uint64_t v156 = swift_slowAlloc();
      uint64_t aBlock = v156;
      *(_DWORD *)uint64_t v115 = 136315394;
      uint64_t v148 = v115 + 4;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain_n();
      LODWORD(v149) = v114;
      unint64_t v116 = sub_46EC();
      unint64_t v118 = v117;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
      uint64_t v159 = sub_22B88(v116, v118, &aBlock);
      sub_2DC80();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v115 + 12) = 1024;
      swift_beginAccess();
      LODWORD(v116) = *(unsigned __int8 *)(v99 + 16);
      swift_release();
      LODWORD(v160) = v116;
      sub_2DC80();
      swift_release();
      _os_log_impl(&dword_0, v112, (os_log_type_t)v149, "Storing cached result %s %{BOOL}d", (uint8_t *)v115, 0x12u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      swift_release_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
    }

    v145(v111, v66);
    v119 = *(void **)&v154[v133];
    uint64_t v120 = swift_allocObject();
    long long v121 = v169;
    *(_OWORD *)(v120 + 24) = v168;
    unint64_t v122 = v132;
    *(void *)(v120 + 16) = v132;
    *(_OWORD *)(v120 + 40) = v121;
    *(_OWORD *)(v120 + 56) = v170;
    *(void *)(v120 + 72) = v171;
    *(void *)(v120 + 80) = v99;
    v165 = sub_2CE88;
    uint64_t v166 = v120;
    uint64_t aBlock = (uint64_t)_NSConcreteStackBlock;
    uint64_t v162 = 1107296256;
    v163 = sub_68F8;
    v164 = &unk_36030;
    v123 = _Block_copy(&aBlock);
    id v124 = v122;
    swift_retain();
    id v125 = v119;
    uint64_t v126 = v150;
    sub_2D940();
    v160 = &_swiftEmptyArrayStorage;
    sub_27694(&qword_394A8, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
    sub_4BA0(&qword_394B0);
    sub_281F8(&qword_394B8, &qword_394B0);
    uint64_t v127 = v136;
    uint64_t v128 = v139;
    sub_2DCB0();
    sub_2DBF0();
    _Block_release(v123);

    (*(void (**)(char *, uint64_t))(v138 + 8))(v127, v128);
    (*(void (**)(char *, uint64_t))(v151 + 8))(v126, v137);
    swift_release();
    swift_beginAccess();
    id v47 = (id)*(unsigned __int8 *)(v99 + 16);
    swift_release();
    id v90 = v167;
    goto LABEL_54;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease_n();
  v141(v140, v143, v66);
  v86 = sub_2D8D0();
  os_log_type_t v87 = sub_2DB60();
  if (os_log_type_enabled(v86, v87))
  {
    uint64_t v88 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v88 = 0;
    _os_log_impl(&dword_0, v86, v87, "Matched sample track, we have haptics", v88, 2u);
    swift_slowDealloc();
  }

  v64(v140, v66);
  id v89 = v167;
  swift_release();

  return 1;
}

Swift::Void __swiftcall AXHapticMusicServer.startHapticMusic()()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_2D8F0();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  uint64_t v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v17 - v7;
  if (*(unsigned char *)(v1 + OBJC_IVAR___AXHapticMusicServer_isEnabled))
  {
    if (qword_39BA0 != -1) {
      swift_once();
    }
    uint64_t v9 = sub_46B4(v2, (uint64_t)HMLog);
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v6, v9, v2);
    uint64_t v10 = sub_2D8D0();
    os_log_type_t v11 = sub_2DB50();
    if (os_log_type_enabled(v10, v11))
    {
      uint64_t v12 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v12 = 0;
      _os_log_impl(&dword_0, v10, v11, "Already running Haptic Music, no need to start", v12, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  }
  else
  {
    *(unsigned char *)(v1 + OBJC_IVAR___AXHapticMusicServer_isEnabled) = 1;
    if (qword_39BA0 != -1) {
      swift_once();
    }
    uint64_t v13 = sub_46B4(v2, (uint64_t)HMLog);
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v8, v13, v2);
    uint64_t v14 = sub_2D8D0();
    os_log_type_t v15 = sub_2DB80();
    if (os_log_type_enabled(v14, v15))
    {
      uint64_t v16 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v16 = 0;
      _os_log_impl(&dword_0, v14, v15, "Starting Haptic Music", v16, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v3 + 8))(v8, v2);
    sub_7AF0();
  }
}

Swift::Void __swiftcall AXHapticMusicServer.stopHapticMusic()()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_2D8F0();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = OBJC_IVAR___AXHapticMusicServer_isEnabled;
  if (v1[OBJC_IVAR___AXHapticMusicServer_isEnabled] == 1)
  {
    if (qword_39BA0 != -1) {
      swift_once();
    }
    uint64_t v7 = sub_46B4(v2, (uint64_t)HMLog);
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v7, v2);
    uint64_t v8 = sub_2D8D0();
    os_log_type_t v9 = sub_2DB50();
    if (os_log_type_enabled(v8, v9))
    {
      uint64_t v10 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v10 = 0;
      _os_log_impl(&dword_0, v8, v9, "Stopping haptic music", v10, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    v1[v6] = 0;
    os_log_type_t v11 = &v1[OBJC_IVAR___AXHapticMusicServer_trackIdentifier];
    *os_log_type_t v11 = 0;
    v11[1] = 0;
    v11[2] = 0xE000000000000000;
    v11[3] = 0;
    v11[4] = 0xE000000000000000;
    v11[5] = 0;
    v11[6] = 0xE000000000000000;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v12 = v1;
    sub_2A010(v12, (uint64_t)v12, (uint64_t)&unk_35728, sub_29F94, &unk_35740);
  }
}

uint64_t sub_12694(void *a1, uint64_t a2)
{
  uint64_t v4 = sub_2D8F0();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_39BA0 != -1) {
    swift_once();
  }
  uint64_t v8 = sub_46B4(v4, (uint64_t)HMLog);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v8, v4);
  os_log_type_t v9 = a1;
  uint64_t v10 = sub_2D8D0();
  os_log_type_t v11 = sub_2DB50();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v19 = v4;
    uint64_t v20 = a2;
    uint64_t v12 = (uint8_t *)swift_slowAlloc();
    uint64_t v18 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v12 = 138412290;
    NSString v13 = v9;
    if (!a1) {
      NSString v13 = sub_2DA00();
    }
    NSString v21 = v13;
    uint64_t v14 = v9;
    sub_2DC80();
    *uint64_t v18 = v13;

    _os_log_impl(&dword_0, v10, v11, "Notification: %@", v12, 0xCu);
    sub_4BA0(&qword_39500);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
    uint64_t v4 = v19;
  }
  else
  {

    uint64_t v10 = v9;
  }

  uint64_t v15 = (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return sub_6984(v15);
}

void sub_12918(void *a1, char *a2, void *a3, uint64_t a4, void *a5)
{
  id v10 = a1;
  id v8 = a3;
  id v9 = a5;
  sub_29950(a2, a3);
}

uint64_t sub_12990(uint64_t a1)
{
  uint64_t v2 = sub_2D8F0();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_39BA0 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_46B4(v2, (uint64_t)HMLog);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
  uint64_t v7 = sub_2D8D0();
  os_log_type_t v8 = sub_2DB50();
  if (os_log_type_enabled(v7, v8))
  {
    id v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v9 = 0;
    _os_log_impl(&dword_0, v7, v8, "Now playing app changed", v9, 2u);
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  *(unsigned char *)(a1 + OBJC_IVAR___AXHapticMusicServer_isHapticTrackPlaying) = 0;
  *(unsigned char *)(a1 + OBJC_IVAR___AXHapticMusicServer_engineIsRunning) = 0;
  *(unsigned char *)(a1 + OBJC_IVAR___AXHapticMusicServer_isEnabled) = 0;
  return sub_B840();
}

uint64_t sub_12B6C(uint64_t a1, char *a2)
{
  return sub_29C44(a2);
}

void sub_12B74(uint8_t *a1, void *a2, char *a3)
{
  uint64_t v103 = a1;
  uint64_t v5 = sub_2D8F0();
  uint64_t v6 = *(void **)(v5 - 8);
  uint64_t v7 = __chkstk_darwin(v5);
  id v9 = ((char *)&v90 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v10 = __chkstk_darwin(v7);
  uint64_t v12 = (char *)&v90 - v11;
  uint64_t v13 = __chkstk_darwin(v10);
  uint64_t v15 = (char *)&v90 - v14;
  uint64_t v16 = __chkstk_darwin(v13);
  uint64_t v18 = (char *)&v90 - v17;
  __chkstk_darwin(v16);
  uint64_t v20 = (char *)&v90 - v19;
  if (!a2)
  {
    id v32 = (id)MRNowPlayingClientGetBundleIdentifier();
    uint64_t v95 = v15;
    if (v32 && (long long v33 = v32, aBlock = 0, v106 = 0, sub_2DA20(), v33, (v34 = v106) != 0))
    {
      uint64_t v35 = (uint64_t)aBlock;
    }
    else
    {
      swift_bridgeObjectRelease();
      uint64_t v35 = 0;
      unint64_t v34 = 0xE000000000000000;
    }
    unint64_t v36 = (uint64_t *)&a3[OBJC_IVAR___AXHapticMusicServer_nowPlayingBundleIdentifier];
    *unint64_t v36 = v35;
    v36[1] = v34;
    swift_bridgeObjectRelease();
    id v37 = (id)MRNowPlayingClientGetParentAppBundleIdentifier();
    if (v37 && (v38 = v37, aBlock = 0, v106 = 0, sub_2DA20(), v38, (unint64_t v39 = v106) != 0))
    {
      id v102 = aBlock;
    }
    else
    {
      swift_bridgeObjectRelease();
      id v102 = 0;
      unint64_t v39 = 0xE000000000000000;
    }
    v96 = v9;
    SHMediaItemProperty v94 = v12;
    if (qword_39BA0 != -1) {
      swift_once();
    }
    uint64_t v40 = sub_46B4(v5, (uint64_t)HMLog);
    swift_beginAccess();
    long long v41 = (void (*)(char *, uint64_t, uint64_t))v6[2];
    id v98 = v6 + 2;
    uint64_t v99 = v40;
    id v97 = v41;
    v41(v18, v40, v5);
    unint64_t v42 = a3;
    swift_bridgeObjectRetain_n();
    uint64_t v43 = v42;
    uint64_t v44 = sub_2D8D0();
    os_log_type_t v45 = sub_2DB50();
    if (os_log_type_enabled(v44, v45))
    {
      uint64_t v46 = swift_slowAlloc();
      id v100 = v43;
      uint64_t v47 = v46;
      v93 = (void (*)(void, void))swift_slowAlloc();
      uint64_t aBlock = v93;
      *(_DWORD *)uint64_t v47 = 136315650;
      dispatch_semaphore_t v101 = v6;
      uint64_t v48 = v5;
      uint64_t v49 = *v36;
      unint64_t v50 = v36[1];
      swift_bridgeObjectRetain();
      uint64_t v104 = sub_22B88(v49, v50, (uint64_t *)&aBlock);
      sub_2DC80();
      uint64_t v5 = v48;
      swift_bridgeObjectRelease();

      *(_WORD *)(v47 + 12) = 2080;
      swift_bridgeObjectRetain();
      uint64_t v51 = (uint64_t)v102;
      uint64_t v104 = sub_22B88((uint64_t)v102, v39, (uint64_t *)&aBlock);
      uint64_t v52 = v101;
      sub_2DC80();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v47 + 22) = 1024;
      LODWORD(v104) = MRNowPlayingClientGetProcessIdentifier();
      sub_2DC80();
      _os_log_impl(&dword_0, v44, v45, "Now playing client %s parent %s %d", (uint8_t *)v47, 0x1Cu);
      swift_arrayDestroy();
      swift_slowDealloc();
      uint64_t v43 = v100;
      swift_slowDealloc();

      uint64_t v53 = (void (*)(char *, uint64_t))v52[1];
      v53(v18, v5);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      uint64_t v53 = (void (*)(char *, uint64_t))v6[1];
      v53(v18, v5);
      uint64_t v51 = (uint64_t)v102;
    }
    if (sub_2DA60() <= 0)
    {
      swift_bridgeObjectRelease();
      uint64_t v51 = *v36;
      unint64_t v39 = v36[1];
      swift_bridgeObjectRetain();
    }
    uint64_t v54 = (uint64_t *)&v43[OBJC_IVAR___AXHapticMusicServer_supportedClients];
    swift_beginAccess();
    uint64_t v55 = *(void *)(*v54 + 16);
    id v102 = (void (*)(void, void))v51;
    if (v55)
    {
      swift_bridgeObjectRetain();
      sub_232B8(v51, v39);
      if (v56)
      {
        swift_endAccess();
        swift_bridgeObjectRelease();
        goto LABEL_30;
      }
      swift_bridgeObjectRelease();
    }
    swift_endAccess();
    id v57 = objc_allocWithZone((Class)LSApplicationRecord);
    swift_bridgeObjectRetain();
    id v58 = sub_21650(v51, v39, 0);
    if (v58)
    {
      v93 = (void (*)(void, void))v53;
      dispatch_semaphore_t v101 = v58;
      id v59 = [objc_allocWithZone((Class)NSNumber) initWithBool:AXApplicationSupportsHapticMusic()];
      swift_beginAccess();
      swift_bridgeObjectRetain();
      id v60 = v59;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v104 = *v54;
      uint64_t *v54 = 0x8000000000000000;
      uint64_t v62 = (uint64_t)v102;
      sub_25D14((uint64_t)v60, (uint64_t)v102, v39, isUniquelyReferenced_nonNull_native);
      uint64_t *v54 = v104;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_endAccess();
      v97(v95, v99, v5);
      swift_bridgeObjectRetain_n();
      id v63 = v60;
      uint64_t v64 = sub_2D8D0();
      uint64_t v65 = v5;
      os_log_type_t v66 = sub_2DB50();
      v96 = v64;
      if (os_log_type_enabled(v64, v66))
      {
        uint64_t v67 = swift_slowAlloc();
        id v100 = v43;
        uint64_t v68 = v67;
        id v91 = (void *)swift_slowAlloc();
        uint64_t v92 = swift_slowAlloc();
        uint64_t aBlock = (void (*)(void, void))v92;
        *(_DWORD *)uint64_t v68 = 136315394;
        swift_bridgeObjectRetain();
        uint64_t v69 = sub_22B88(v62, v39, (uint64_t *)&aBlock);
        uint64_t v103 = (uint8_t *)v65;
        uint64_t v104 = v69;
        sub_2DC80();
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v68 + 12) = 2112;
        uint64_t v104 = (uint64_t)v63;
        id v70 = v63;
        sub_2DC80();
        *id v91 = v63;

        uint64_t v71 = v96;
        _os_log_impl(&dword_0, v96, v66, "Marking client as supporting MH %s = %@", (uint8_t *)v68, 0x16u);
        sub_4BA0(&qword_39500);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_arrayDestroy();
        swift_slowDealloc();
        uint64_t v43 = v100;
        swift_slowDealloc();

        id v72 = v101;
        uint64_t v5 = (uint64_t)v103;
        uint64_t v53 = (void (*)(char *, uint64_t))v93;
        v93(v95, v103);
      }
      else
      {
        id v89 = v101;

        swift_bridgeObjectRelease_n();
        uint64_t v53 = (void (*)(char *, uint64_t))v93;
        v93(v95, v65);
        uint64_t v5 = v65;
      }
    }
LABEL_30:
    swift_beginAccess();
    uint64_t v73 = *v54;
    if (*(void *)(*v54 + 16))
    {
      swift_bridgeObjectRetain();
      uint64_t v74 = (uint64_t)v102;
      unint64_t v75 = sub_232B8((uint64_t)v102, v39);
      if (v76)
      {
        v93 = (void (*)(void, void))v53;
        unint64_t v77 = *(void **)(*(void *)(v73 + 56) + 8 * v75);
        swift_endAccess();
        id v78 = v77;
        swift_bridgeObjectRelease();
        if (([v78 BOOLValue] & 1) == 0)
        {
          uint64_t v84 = v94;
          v97(v94, v99, v5);
          swift_bridgeObjectRetain();
          uint64_t v85 = sub_2D8D0();
          os_log_type_t v86 = sub_2DB50();
          if (os_log_type_enabled(v85, v86))
          {
            os_log_type_t v87 = (uint8_t *)swift_slowAlloc();
            uint64_t aBlock = (void (*)(void, void))swift_slowAlloc();
            *(_DWORD *)os_log_type_t v87 = 136315138;
            uint64_t v103 = v87 + 4;
            swift_bridgeObjectRetain();
            uint64_t v104 = sub_22B88(v74, v39, (uint64_t *)&aBlock);
            sub_2DC80();
            swift_bridgeObjectRelease_n();
            _os_log_impl(&dword_0, v85, v86, "Client doesn't support MH %s", v87, 0xCu);
            swift_arrayDestroy();
            swift_slowDealloc();
            swift_slowDealloc();

            uint64_t v88 = v94;
          }
          else
          {
            swift_bridgeObjectRelease_n();

            uint64_t v88 = v84;
          }
          v93(v88, v5);
          return;
        }

LABEL_36:
        swift_bridgeObjectRelease();
        id v79 = *(void **)&v43[OBJC_IVAR___AXHapticMusicServer_queue];
        uint64_t v80 = swift_allocObject();
        *(void *)(v80 + 16) = v43;
        v109 = sub_29FA4;
        uint64_t v110 = v80;
        uint64_t aBlock = (void (*)(void, void))_NSConcreteStackBlock;
        uint64_t v106 = 1107296256;
        v107 = sub_1488C;
        uint64_t v108 = &unk_35808;
        char v81 = _Block_copy(&aBlock);
        uint64_t v82 = v43;
        id v83 = v79;
        swift_release();
        MRMediaRemoteGetNowPlayingApplicationPlaybackState();
        _Block_release(v81);

        return;
      }
      swift_bridgeObjectRelease();
    }
    swift_endAccess();
    goto LABEL_36;
  }
  uint64_t v21 = qword_39BA0;
  id v22 = a2;
  if (v21 != -1) {
    swift_once();
  }
  uint64_t v23 = sub_46B4(v5, (uint64_t)HMLog);
  swift_beginAccess();
  ((void (*)(char *, uint64_t, uint64_t))v6[2])(v20, v23, v5);
  uint64_t v24 = v22;
  uint64_t v25 = sub_2D8D0();
  os_log_type_t v26 = sub_2DB70();
  if (os_log_type_enabled(v25, v26))
  {
    int64_t v27 = (uint8_t *)swift_slowAlloc();
    uint64_t v28 = (void *)swift_slowAlloc();
    dispatch_semaphore_t v101 = v6;
    *(_DWORD *)int64_t v27 = 138412290;
    uint64_t v103 = (uint8_t *)v5;
    type metadata accessor for CFError(0);
    sub_27694(&qword_398A0, type metadata accessor for CFError);
    swift_allocError();
    __CFNotificationCenter *v29 = v24;
    uint64_t v30 = v24;
    uint64_t v31 = _swift_stdlib_bridgeErrorToNSError();
    uint64_t v111 = v31;
    uint64_t v5 = (uint64_t)v103;
    uint64_t v6 = v101;
    sub_2DC80();
    void *v28 = v31;

    _os_log_impl(&dword_0, v25, v26, "Error getting info %@", v27, 0xCu);
    sub_4BA0(&qword_39500);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
    uint64_t v24 = v25;
    uint64_t v25 = v30;
  }
  else
  {
  }
  ((void (*)(char *, uint64_t))v6[1])(v20, v5);
}

void sub_13A60(int a1, unsigned char *a2)
{
  uint64_t v4 = sub_2D8F0();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_39BA0 != -1) {
    swift_once();
  }
  uint64_t v8 = sub_46B4(v4, (uint64_t)HMLog);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v8, v4);
  id v9 = sub_2D8D0();
  os_log_type_t v10 = sub_2DB50();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v11 = 67109120;
    v12[1] = a1;
    sub_2DC80();
    _os_log_impl(&dword_0, v9, v10, "Got now playing state State %u", v11, 8u);
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  if (a1 == 1)
  {
    sub_13C84();
  }
  else if (a2[OBJC_IVAR___AXHapticMusicServer_isHapticTrackPlaying] == 1)
  {
    a2[OBJC_IVAR___AXHapticMusicServer_pauseShouldCancelEngineStartup] = 1;
    sub_14154(a2);
  }
}

void sub_13C84()
{
  uint64_t v1 = sub_2D8F0();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = __chkstk_darwin(v1);
  __chkstk_darwin(v3);
  uint64_t v5 = (char *)&v18 - v4;
  if (qword_39BA0 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_46B4(v1, (uint64_t)HMLog);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v5, v6, v1);
  uint64_t v7 = v0;
  uint64_t v8 = sub_2D8D0();
  os_log_type_t v9 = sub_2DB50();
  if (os_log_type_enabled(v8, v9))
  {
    os_log_type_t v10 = (uint8_t *)swift_slowAlloc();
    uint64_t v19 = v1;
    uint64_t v11 = v10;
    *(_DWORD *)os_log_type_t v10 = 67109120;
    LODWORD(aBlock[0]) = *((unsigned __int8 *)&v7->isa + OBJC_IVAR___AXHapticMusicServer_isHapticTrackPlaying);
    sub_2DC80();

    _os_log_impl(&dword_0, v8, v9, "Handling play state. Haptic state: %{BOOL}d", v11, 8u);
    uint64_t v1 = v19;
    swift_slowDealloc();
  }
  else
  {

    uint64_t v8 = v7;
  }

  (*(void (**)(char *, uint64_t))(v2 + 8))(v5, v1);
  id v12 = *(Class *)((char *)&v7->isa + OBJC_IVAR___AXHapticMusicServer_shutdownTimer);
  if (v12) {
    id v12 = [v12 cancel];
  }
  *((unsigned char *)&v7->isa + OBJC_IVAR___AXHapticMusicServer_pauseShouldCancelEngineStartup) = 0;
  if (!*(Class *)((char *)&v7->isa + OBJC_IVAR___AXHapticMusicServer_audioSession)) {
    sub_7444(v12);
  }
  MRPlaybackQueueRequestCreateDefault();
  uint64_t v13 = *(Class *)((char *)&v7->isa + OBJC_IVAR___AXHapticMusicServer_queue);
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = v7;
  aBlock[4] = sub_29FC0;
  aBlock[5] = v14;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_148E0;
  aBlock[3] = &unk_35858;
  uint64_t v15 = _Block_copy(aBlock);
  uint64_t v16 = v7;
  id v17 = v13;
  swift_release();
  MRMediaRemoteRequestNowPlayingPlaybackQueueSync();
  _Block_release(v15);
}

void sub_14154(void *a1)
{
  uint64_t v2 = sub_2D8F0();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  uint64_t v6 = (char *)v42 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __chkstk_darwin(v4);
  uint64_t v54 = (char *)v42 - v8;
  __chkstk_darwin(v7);
  os_log_type_t v10 = (char *)v42 - v9;
  if (qword_39BA0 != -1) {
    swift_once();
  }
  uint64_t v11 = sub_46B4(v2, (uint64_t)HMLog);
  swift_beginAccess();
  id v12 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
  uint64_t v52 = v3 + 16;
  uint64_t v53 = v11;
  uint64_t v51 = v12;
  v12(v10, v11, v2);
  uint64_t v13 = a1;
  uint64_t v14 = sub_2D8D0();
  os_log_type_t v15 = sub_2DB50();
  BOOL v16 = os_log_type_enabled(v14, v15);
  uint64_t v48 = v13;
  if (v16)
  {
    id v17 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)id v17 = 67109120;
    uint64_t v13 = v48;
    LODWORD(aBlock[0]) = *((unsigned __int8 *)&v48->isa + OBJC_IVAR___AXHapticMusicServer_isHapticTrackPlaying);
    sub_2DC80();

    _os_log_impl(&dword_0, v14, v15, "Handling pause state. Haptic track is playing: %{BOOL}d", v17, 8u);
    swift_slowDealloc();
  }
  else
  {

    uint64_t v14 = v13;
  }

  uint64_t v18 = *(void (**)(char *, uint64_t))(v3 + 8);
  v18(v10, v2);
  uint64_t v19 = (uint64_t *)((char *)v13 + OBJC_IVAR___AXHapticMusicServer_players);
  swift_beginAccess();
  uint64_t v20 = *v19;
  if ((unint64_t)*v19 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v21 = sub_2DDA0();
    if (!v21) {
      goto LABEL_24;
    }
  }
  else
  {
    uint64_t v21 = *(void *)((char *)&dword_10 + (v20 & 0xFFFFFFFFFFFFFF8));
    swift_bridgeObjectRetain();
    if (!v21) {
      goto LABEL_24;
    }
  }
  if (v21 < 1) {
    __break(1u);
  }
  uint64_t v23 = 0;
  uint64_t v45 = OBJC_IVAR___AXHapticMusicServer_isHapticTrackPlaying;
  unint64_t v49 = v20 & 0xC000000000000001;
  *(void *)&long long v22 = 136315138;
  long long v43 = v22;
  v42[1] = (char *)&type metadata for Any + 8;
  uint64_t v47 = v18;
  uint64_t v50 = v21;
  uint64_t v44 = v2;
  uint64_t v46 = v20;
  do
  {
    if (v49)
    {
      uint64_t v24 = (void *)sub_2DD30();
    }
    else
    {
      uint64_t v24 = *(void **)(v20 + 8 * v23 + 32);
      swift_unknownObjectRetain();
    }
    aBlock[0] = 0;
    unsigned int v25 = [v24 pauseAtTime:aBlock error:0.0];
    id v26 = aBlock[0];
    if (v25)
    {
      *((unsigned char *)&v13->isa + v45) = 0;
      v51(v54, v53, v2);
      id v27 = v26;
      uint64_t v28 = sub_2D8D0();
      os_log_type_t v29 = sub_2DB50();
      if (os_log_type_enabled(v28, v29))
      {
        uint64_t v30 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v30 = 0;
        _os_log_impl(&dword_0, v28, v29, "Haptics Paused", v30, 2u);
        uint64_t v18 = v47;
        swift_slowDealloc();

        swift_unknownObjectRelease();
      }
      else
      {
        swift_unknownObjectRelease();
      }
      v18(v54, v2);
    }
    else
    {
      id v31 = aBlock[0];
      sub_2D810();

      swift_willThrow();
      v51(v6, v53, v2);
      swift_errorRetain();
      swift_errorRetain();
      id v32 = sub_2D8D0();
      os_log_type_t v33 = sub_2DB70();
      if (os_log_type_enabled(v32, v33))
      {
        uint64_t v34 = swift_slowAlloc();
        aBlock[0] = (id)swift_slowAlloc();
        *(_DWORD *)uint64_t v34 = v43;
        swift_getErrorValue();
        uint64_t v35 = sub_2DE40();
        *(void *)(v34 + 4) = sub_22B88(v35, v36, (uint64_t *)aBlock);
        swift_bridgeObjectRelease();
        swift_errorRelease();
        swift_errorRelease();
        _os_log_impl(&dword_0, v32, v33, "Failed to pause haptics. %s", (uint8_t *)v34, 0xCu);
        swift_arrayDestroy();
        uint64_t v2 = v44;
        swift_slowDealloc();
        uint64_t v18 = v47;
        swift_slowDealloc();

        swift_unknownObjectRelease();
        swift_errorRelease();
      }
      else
      {
        swift_unknownObjectRelease();
        swift_errorRelease();
        swift_errorRelease();
        swift_errorRelease();
      }
      v18(v6, v2);
      uint64_t v13 = v48;
      uint64_t v20 = v46;
    }
    ++v23;
  }
  while (v50 != v23);
LABEL_24:
  swift_bridgeObjectRelease();
  id v37 = *(Class *)((char *)&v13->isa + OBJC_IVAR___AXHapticMusicServer_shutdownTimer);
  if (v37)
  {
    id v38 = (void *)swift_allocObject();
    _OWORD v38[2] = v13;
    aBlock[4] = sub_2D748;
    aBlock[5] = v38;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = (id)1107296256;
    aBlock[2] = sub_68F8;
    aBlock[3] = &unk_35F00;
    unint64_t v39 = _Block_copy(aBlock);
    uint64_t v40 = v13;
    id v41 = v37;
    swift_release();
    [v41 afterDelay:v39 processBlock:20.0];
    _Block_release(v39);
  }
}

uint64_t sub_1488C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);

  return swift_release();
}

void sub_148E0(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  swift_retain();
  id v6 = a3;
  v5(a2, a3);
  swift_release();
}

void sub_14958(void *a1)
{
  uint64_t v2 = sub_2D8F0();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&aBlock[-1] - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_39BA0 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_46B4(v2, (uint64_t)HMLog);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
  uint64_t v7 = a1;
  uint64_t v8 = sub_2D8D0();
  os_log_type_t v9 = sub_2DB50();
  if (os_log_type_enabled(v8, v9))
  {
    os_log_type_t v10 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)os_log_type_t v10 = 67109120;
    LODWORD(aBlock[0]) = *((unsigned __int8 *)&v7->isa + OBJC_IVAR___AXHapticMusicServer_engineIsRunning);
    sub_2DC80();

    _os_log_impl(&dword_0, v8, v9, "Check shutdown engine: running %{BOOL}d", v10, 8u);
    swift_slowDealloc();
  }
  else
  {

    uint64_t v8 = v7;
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  if (*((unsigned char *)&v7->isa + OBJC_IVAR___AXHapticMusicServer_engineIsRunning) == 1)
  {
    uint64_t v11 = *(Class *)((char *)&v7->isa + OBJC_IVAR___AXHapticMusicServer_engine);
    if (v11)
    {
      uint64_t v12 = swift_allocObject();
      swift_unknownObjectWeakInit();
      aBlock[4] = sub_2837C;
      aBlock[5] = v12;
      aBlock[0] = _NSConcreteStackBlock;
      aBlock[1] = 1107296256;
      aBlock[2] = sub_15258;
      aBlock[3] = &unk_35768;
      uint64_t v13 = _Block_copy(aBlock);
      id v14 = v11;
      swift_release();
      [v14 stopWithCompletionHandler:v13];
      _Block_release(v13);
    }
  }
}

uint64_t sub_14C38(uint64_t a1)
{
  uint64_t v40 = a1;
  uint64_t v1 = sub_2D8F0();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)&v34 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_2D930();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v34 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_2D960();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v34 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t result = swift_unknownObjectWeakLoadStrong();
  if (result)
  {
    id v14 = (char *)result;
    id v37 = v4;
    uint64_t v38 = v2;
    uint64_t v39 = v1;
    *(unsigned char *)(result + OBJC_IVAR___AXHapticMusicServer_engineIsRunning) = 0;
    id v15 = [self defaultCenter];
    uint64_t v16 = OBJC_IVAR___AXHapticMusicServer_audioSession;
    [v15 removeObserver:v14 name:AVAudioSessionInterruptionNotification object:*(void *)&v14[OBJC_IVAR___AXHapticMusicServer_audioSession]];

    id v17 = *(void **)&v14[v16];
    *(void *)&v14[v16] = 0;

    uint64_t v18 = *(void **)&v14[OBJC_IVAR___AXHapticMusicServer_engine];
    *(void *)&v14[OBJC_IVAR___AXHapticMusicServer_engine] = 0;

    sub_B840();
    sub_E8F8();
    uint64_t v19 = *(void **)&v14[OBJC_IVAR___AXHapticMusicServer_ahapAvailableCacheQueue];
    uint64_t v20 = swift_allocObject();
    *(void *)(v20 + 16) = v14;
    aBlock[4] = sub_283BC;
    aBlock[5] = v20;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_68F8;
    aBlock[3] = &unk_353F8;
    uint64_t v21 = _Block_copy(aBlock);
    id v22 = v19;
    uint64_t v35 = v9;
    id v23 = v22;
    unint64_t v36 = v14;
    sub_2D940();
    id v41 = &_swiftEmptyArrayStorage;
    sub_27694(&qword_394A8, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
    sub_4BA0(&qword_394B0);
    sub_281F8(&qword_394B8, &qword_394B0);
    sub_2DCB0();
    sub_2DBF0();
    _Block_release(v21);

    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v35);
    swift_release();
    if (qword_39BA0 != -1) {
      swift_once();
    }
    uint64_t v24 = v39;
    uint64_t v25 = sub_46B4(v39, (uint64_t)HMLog);
    swift_beginAccess();
    id v27 = v37;
    uint64_t v26 = v38;
    (*(void (**)(char *, uint64_t, uint64_t))(v38 + 16))(v37, v25, v24);
    uint64_t v28 = v40;
    swift_errorRetain();
    swift_errorRetain();
    os_log_type_t v29 = sub_2D8D0();
    os_log_type_t v30 = sub_2DB50();
    if (os_log_type_enabled(v29, v30))
    {
      id v31 = (uint8_t *)swift_slowAlloc();
      id v32 = (void *)swift_slowAlloc();
      *(_DWORD *)id v31 = 138412290;
      if (v28)
      {
        swift_errorRetain();
        uint64_t v33 = _swift_stdlib_bridgeErrorToNSError();
        id v41 = (void *)v33;
        sub_2DC80();
      }
      else
      {
        id v41 = 0;
        sub_2DC80();
        uint64_t v33 = 0;
      }
      *id v32 = v33;
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl(&dword_0, v29, v30, "Stopping and clearing out haptic engine: %@", v31, 0xCu);
      sub_4BA0(&qword_39500);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_errorRelease();
      swift_errorRelease();
    }

    return (*(uint64_t (**)(char *, uint64_t))(v26 + 8))(v27, v24);
  }
  return result;
}

void sub_15258(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3(a2);
  swift_release();
}

void sub_152C4(uint64_t a1, void *a2)
{
  uint64_t v4 = sub_2D8F0();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a1 || a2)
  {
    if (qword_39BA0 != -1) {
      swift_once();
    }
    uint64_t v8 = sub_46B4(v4, (uint64_t)HMLog);
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v8, v4);
    id v9 = a2;
    uint64_t v10 = sub_2D8D0();
    os_log_type_t v11 = sub_2DB70();
    if (os_log_type_enabled(v10, v11))
    {
      uint64_t v12 = (uint8_t *)swift_slowAlloc();
      uint64_t v18 = swift_slowAlloc();
      *(_DWORD *)uint64_t v12 = 136315138;
      if (a2)
      {
        v17[0] = v9;
        type metadata accessor for CFError(0);
        sub_27694(&qword_398A0, type metadata accessor for CFError);
        uint64_t v13 = sub_2DE40();
      }
      else
      {
        uint64_t v13 = 0;
        uint64_t v14 = 0;
      }
      v17[0] = v13;
      v17[1] = v14;
      sub_4BA0(&qword_398B0);
      uint64_t v15 = sub_2DA40();
      v17[0] = sub_22B88(v15, v16, &v18);
      sub_2DC80();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_0, v10, v11, "NowPlayingProvider#item Unexpected nil playbackQueue or error: %s", v12, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
    }
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  else
  {
    sub_155B4();
  }
}

void sub_155B4()
{
  uint64_t v1 = v0;
  uint64_t v107 = sub_2D8F0();
  uint64_t v2 = *(void *)(v107 - 8);
  uint64_t v3 = __chkstk_darwin(v107);
  uint64_t v95 = (char *)&v93 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __chkstk_darwin(v3);
  SHMediaItemProperty v94 = (char *)&v93 - v6;
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v93 - v7;
  uint64_t ContentItemAtOffset = MRPlaybackQueueGetContentItemAtOffset();
  uint64_t ContentItemsCount = MRPlaybackQueueGetContentItemsCount();
  uint64_t v106 = (void *)ContentItemAtOffset;
  p_long long aBlock = (long long *)MRContentItemCopyNowPlayingInfo();
  uint64_t v104 = v1;
  uint64_t v103 = v8;
  if (!p_aBlock)
  {
    long long v114 = 0u;
    long long v115 = 0u;
    sub_2D07C((uint64_t)&v114, &qword_39458);
    long long v114 = 0u;
    long long v115 = 0u;
    sub_2D07C((uint64_t)&v114, &qword_39458);
    uint64_t v100 = 0;
    uint64_t v101 = 0;
    long long v114 = 0u;
    long long v115 = 0u;
    unint64_t v14 = 0xE000000000000000;
    unint64_t v15 = 0xE000000000000000;
LABEL_28:
    sub_2D07C((uint64_t)&v114, &qword_39458);
    goto LABEL_29;
  }
  if (!kMRMediaRemoteNowPlayingInfoTitle) {
    goto LABEL_107;
  }
  *(void *)&long long aBlock = sub_2DA30();
  *((void *)&aBlock + 1) = v11;
  swift_bridgeObjectRetain();
  uint64_t v12 = p_aBlock;
  id v13 = objc_msgSend(v12, "__swift_objectForKeyedSubscript:", sub_2DE20());

  swift_unknownObjectRelease();
  if (v13)
  {
    sub_2DCA0();
    swift_unknownObjectRelease();
  }
  else
  {
    long long aBlock = 0u;
    long long v111 = 0u;
  }
  sub_28420((uint64_t)&aBlock, (uint64_t)&v114, &qword_39458);
  swift_bridgeObjectRelease();
  if (*((void *)&v115 + 1))
  {
    if (swift_dynamicCast())
    {
      unint64_t v16 = *((void *)&aBlock + 1);
      uint64_t v101 = aBlock;
      goto LABEL_12;
    }
  }
  else
  {
    sub_2D07C((uint64_t)&v114, &qword_39458);
  }
  uint64_t v101 = 0;
  unint64_t v16 = 0xE000000000000000;
LABEL_12:
  if (!kMRMediaRemoteNowPlayingInfoArtist) {
    goto LABEL_108;
  }
  *(void *)&long long aBlock = sub_2DA30();
  *((void *)&aBlock + 1) = v17;
  uint64_t v18 = v12;
  swift_bridgeObjectRetain();
  id v19 = objc_msgSend(v18, "__swift_objectForKeyedSubscript:", sub_2DE20());

  swift_unknownObjectRelease();
  if (v19)
  {
    sub_2DCA0();
    swift_unknownObjectRelease();
  }
  else
  {
    long long aBlock = 0u;
    long long v111 = 0u;
  }
  sub_28420((uint64_t)&aBlock, (uint64_t)&v114, &qword_39458);
  swift_bridgeObjectRelease();
  if (*((void *)&v115 + 1))
  {
    uint64_t v20 = v2;
    if (swift_dynamicCast())
    {
      unint64_t v21 = *((void *)&aBlock + 1);
      uint64_t v100 = aBlock;
      goto LABEL_21;
    }
  }
  else
  {
    uint64_t v20 = v2;
    sub_2D07C((uint64_t)&v114, &qword_39458);
  }
  uint64_t v100 = 0;
  unint64_t v21 = 0xE000000000000000;
LABEL_21:
  if (!kMRMediaRemoteNowPlayingInfoDuration) {
    goto LABEL_109;
  }
  *(void *)&long long aBlock = sub_2DA30();
  *((void *)&aBlock + 1) = v22;
  id v23 = v18;
  swift_bridgeObjectRetain();
  id v24 = objc_msgSend(v23, "__swift_objectForKeyedSubscript:", sub_2DE20());

  swift_unknownObjectRelease();
  if (v24)
  {
    sub_2DCA0();
    swift_unknownObjectRelease();
  }
  else
  {
    long long aBlock = 0u;
    long long v111 = 0u;
  }
  uint64_t v1 = v104;
  unint64_t v15 = v16;
  uint64_t v8 = v103;
  unint64_t v14 = v21;
  sub_28420((uint64_t)&aBlock, (uint64_t)&v114, &qword_39458);
  swift_bridgeObjectRelease();
  uint64_t v2 = v20;
  if (!*((void *)&v115 + 1)) {
    goto LABEL_28;
  }
  if (swift_dynamicCast())
  {
    double Current = *(double *)&aBlock;
    goto LABEL_30;
  }
LABEL_29:
  double Current = 0.0;
LABEL_30:
  uint64_t v106 = (void *)sub_17580();
  unint64_t v27 = v26;
  uint64_t v105 = v28;
  if (qword_39BA0 != -1) {
    goto LABEL_102;
  }
LABEL_31:
  id v102 = p_aBlock;
  uint64_t v29 = v107;
  uint64_t v30 = sub_46B4(v107, (uint64_t)HMLog);
  swift_beginAccess();
  id v31 = *(void (**)(void, void, void))(v2 + 16);
  uint64_t v99 = v30;
  uint64_t v98 = v2 + 16;
  id v97 = (void (*)(char *, uint64_t, uint64_t))v31;
  v31(v8, v30, v29);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  id v32 = sub_2D8D0();
  os_log_type_t v33 = sub_2DB50();
  if (os_log_type_enabled(v32, v33))
  {
    uint64_t v34 = swift_slowAlloc();
    uint64_t v93 = swift_slowAlloc();
    *(void *)&long long v114 = v93;
    *(_DWORD *)uint64_t v34 = 136316162;
    swift_bridgeObjectRetain();
    *(void *)&long long aBlock = sub_22B88(v101, v15, (uint64_t *)&v114);
    sub_2DC80();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v34 + 12) = 2080;
    swift_bridgeObjectRetain();
    *(void *)&long long aBlock = sub_22B88(v100, v14, (uint64_t *)&v114);
    sub_2DC80();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v34 + 22) = 2048;
    uint64_t v35 = v105;
    *(void *)&long long aBlock = v105;
    sub_2DC80();
    *(_WORD *)(v34 + 32) = 2080;
    swift_bridgeObjectRetain();
    *(void *)&long long aBlock = sub_22B88((uint64_t)v106, v27, (uint64_t *)&v114);
    sub_2DC80();
    unint64_t v36 = v27;
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v34 + 42) = 2048;
    *(void *)&long long aBlock = ContentItemsCount;
    sub_2DC80();
    _os_log_impl(&dword_0, v32, v33, "Now playing state: %s %s Song ID: %lld ISRC CODE: %s queueCount %ld", (uint8_t *)v34, 0x34u);
    swift_arrayDestroy();
    uint64_t v1 = v104;
    swift_slowDealloc();
    swift_slowDealloc();

    id v37 = v103;
    uint64_t v103 = *(char **)(v2 + 8);
    ((void (*)(char *, uint64_t))v103)(v37, v107);
    p_long long aBlock = &aBlock;
    uint64_t v8 = v35;
    if (v35) {
      goto LABEL_41;
    }
  }
  else
  {
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    unint64_t v36 = v27;
    swift_bridgeObjectRelease_n();

    uint64_t v103 = *(char **)(v2 + 8);
    ((void (*)(char *, uint64_t))v103)(v8, v107);
    p_long long aBlock = &aBlock;
    uint64_t v8 = v105;
    if (v105) {
      goto LABEL_41;
    }
  }
  if (!v106 && v36 == 0xE000000000000000 || (sub_2DE10() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v38 = v94;
    v97(v94, v99, v107);
    uint64_t v39 = sub_2D8D0();
    os_log_type_t v40 = sub_2DB70();
    if (os_log_type_enabled(v39, v40))
    {
      id v41 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v41 = 0;
      _os_log_impl(&dword_0, v39, v40, "No song id, stopping playback", v41, 2u);
      swift_slowDealloc();
    }

    ((void (*)(char *, uint64_t))v103)(v38, v107);
    unint64_t v42 = v1;
    sub_2A010(v42, (uint64_t)v42, (uint64_t)&unk_358E0, sub_2D748, &unk_358F8);

LABEL_90:
    os_log_type_t v87 = v102;
    goto LABEL_91;
  }
LABEL_41:
  uint64_t ContentItemsCount = v2;
  long long v43 = &v1[OBJC_IVAR___AXHapticMusicServer_trackIdentifier];
  uint64_t v44 = *(void **)&v1[OBJC_IVAR___AXHapticMusicServer_trackIdentifier + 8];
  uint64_t v45 = *(void *)&v1[OBJC_IVAR___AXHapticMusicServer_trackIdentifier + 16];
  if (v8 && *(void *)v43 && *(char **)v43 == v8
    || (v44 || v45 != 0xE000000000000000)
    && (sub_2DE10() & 1) == 0
    && (v106 || v36 != 0xE000000000000000)
    && (sub_2DE10() & 1) == 0
    && (v44 == v106 && v45 == v36 || (sub_2DE10() & 1) != 0))
  {
    uint64_t v46 = &v1[OBJC_IVAR___AXHapticMusicServer_players];
    swift_beginAccess();
    unint64_t v47 = *(void *)v46;
    if (v47 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v92 = sub_2DDA0();
      swift_bridgeObjectRelease();
      if (v92 > 0) {
        goto LABEL_47;
      }
    }
    else if (*(uint64_t *)((char *)&dword_10 + (v47 & 0xFFFFFFFFFFFFFF8)) > 0)
    {
      goto LABEL_47;
    }
    if (v1[OBJC_IVAR___AXHapticMusicServer_fetchingHapticTracks] != 1) {
      goto LABEL_55;
    }
LABEL_47:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v48 = v95;
    v97(v95, v99, v107);
    unint64_t v49 = v1;
    uint64_t v50 = sub_2D8D0();
    os_log_type_t v51 = sub_2DB50();
    if (os_log_type_enabled(v50, v51))
    {
      uint64_t v52 = v48;
      uint64_t v53 = swift_slowAlloc();
      *(void *)&long long aBlock = swift_slowAlloc();
      *(_DWORD *)uint64_t v53 = 136315394;
      long long v54 = *((_OWORD *)v43 + 1);
      long long v114 = *(_OWORD *)v43;
      long long v115 = v54;
      long long v116 = *((_OWORD *)v43 + 2);
      uint64_t v117 = *((void *)v43 + 6);
      sub_2BBDC((uint64_t)&v114);
      unint64_t v55 = sub_46EC();
      unint64_t v57 = v56;
      sub_2BC28((uint64_t)&v114);
      uint64_t v109 = sub_22B88(v55, v57, (uint64_t *)&aBlock);
      sub_2DC80();
      swift_bridgeObjectRelease();

      *(_WORD *)(v53 + 12) = 2048;
      uint64_t v109 = (uint64_t)v105;
      sub_2DC80();
      _os_log_impl(&dword_0, v50, v51, "Song ID matches haptic track id %s -> %lld", (uint8_t *)v53, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      id v58 = v52;
    }
    else
    {

      id v58 = v48;
    }
    ((void (*)(char *, uint64_t))v103)(v58, v107);
    os_log_type_t v87 = v102;
    if ((v49[OBJC_IVAR___AXHapticMusicServer_fetchingHapticTracks] & 1) == 0)
    {
      uint64_t v88 = *(void **)&v49[OBJC_IVAR___AXHapticMusicServer_notificationTimer];
      if (v88)
      {
        uint64_t v89 = swift_allocObject();
        swift_unknownObjectWeakInit();
        *(void *)&long long v112 = sub_2BC74;
        *((void *)&v112 + 1) = v89;
        *(void *)&long long aBlock = _NSConcreteStackBlock;
        *((void *)&aBlock + 1) = 1107296256;
        *(void *)&long long v111 = sub_68F8;
        *((void *)&v111 + 1) = &unk_358A8;
        uint64_t v90 = _Block_copy(&aBlock);
        id v91 = v88;
        swift_release();
        [v91 afterDelay:v90 processBlock:0.1];

        _Block_release(v90);
        os_log_type_t v87 = (long long *)v91;
      }
    }
LABEL_91:

    return;
  }
LABEL_55:
  id v59 = (void *)swift_allocObject();
  uint64_t v60 = (uint64_t)v106;
  v59[2] = v8;
  v59[3] = v60;
  uint64_t v61 = v101;
  v59[4] = v36;
  v59[5] = v61;
  uint64_t v62 = v100;
  v59[6] = v15;
  v59[7] = v62;
  v59[8] = v14;
  v1[OBJC_IVAR___AXHapticMusicServer_fetchingHapticTracks] = 1;
  v1[OBJC_IVAR___AXHapticMusicServer_isHapticTrackPlaying] = 0;
  id v63 = v1;
  sub_2A79C(v63, (uint64_t)v63);

  long long v64 = *((_OWORD *)v59 + 2);
  long long v114 = *((_OWORD *)v59 + 1);
  long long v115 = v64;
  long long v116 = *((_OWORD *)v59 + 3);
  uint64_t v117 = v59[8];
  uint64_t v65 = swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_retain();
  sub_2BBDC((uint64_t)&v114);
  sub_2AF20((uint64_t)&v114, v63, v65, v59, Current);
  uint64_t v106 = v59;
  swift_release();
  swift_release();
  sub_2BC28((uint64_t)&v114);
  unint64_t v14 = (unint64_t)&v63[OBJC_IVAR___AXHapticMusicServer_hapticCache];
  swift_beginAccess();
  unint64_t v27 = *(void *)v14;
  uint64_t v1 = (char *)(*(void *)v14 + 64);
  uint64_t v66 = 1 << *(unsigned char *)(*(void *)v14 + 32);
  uint64_t v67 = -1;
  if (v66 < 64) {
    uint64_t v67 = ~(-1 << v66);
  }
  unint64_t v68 = v67 & *(void *)(*(void *)v14 + 64);
  uint64_t v107 = (unint64_t)(v66 + 63) >> 6;
  swift_bridgeObjectRetain();
  uint64_t v69 = 0;
  uint64_t v2 = 56;
LABEL_60:
  unint64_t v15 = 0x4082C00000000000;
  if (v68)
  {
LABEL_61:
    unint64_t v70 = __clz(__rbit64(v68));
    v68 &= v68 - 1;
    unint64_t v71 = v70 | (v69 << 6);
    goto LABEL_80;
  }
  while (1)
  {
    uint64_t v72 = v69 + 1;
    if (__OFADD__(v69, 1)) {
      goto LABEL_101;
    }
    if (v72 >= v107) {
      goto LABEL_89;
    }
    unint64_t v73 = *(void *)&v1[8 * v72];
    ++v69;
    if (!v73)
    {
      uint64_t v69 = v72 + 1;
      if (v72 + 1 >= v107) {
        goto LABEL_89;
      }
      unint64_t v73 = *(void *)&v1[8 * v69];
      if (!v73)
      {
        uint64_t v69 = v72 + 2;
        if (v72 + 2 >= v107) {
          goto LABEL_89;
        }
        unint64_t v73 = *(void *)&v1[8 * v69];
        if (!v73)
        {
          uint64_t v69 = v72 + 3;
          if (v72 + 3 >= v107) {
            goto LABEL_89;
          }
          unint64_t v73 = *(void *)&v1[8 * v69];
          if (!v73)
          {
            uint64_t v69 = v72 + 4;
            if (v72 + 4 >= v107) {
              goto LABEL_89;
            }
            unint64_t v73 = *(void *)&v1[8 * v69];
            if (!v73) {
              break;
            }
          }
        }
      }
    }
LABEL_79:
    unint64_t v68 = (v73 - 1) & v73;
    unint64_t v71 = __clz(__rbit64(v73)) + (v69 << 6);
LABEL_80:
    uint64_t v75 = *(void *)(v27 + 48) + 56 * v71;
    uint64_t v76 = *(void *)(v75 + 48);
    long long v77 = *(_OWORD *)(v75 + 16);
    long long v78 = *(_OWORD *)v75;
    long long v112 = *(_OWORD *)(v75 + 32);
    long long aBlock = v78;
    long long v111 = v77;
    uint64_t v113 = v76;
    sub_2BBDC((uint64_t)&aBlock);
    double Current = CFAbsoluteTimeGetCurrent();
    swift_beginAccess();
    unint64_t v79 = *(void *)v14;
    if (!*(void *)(*(void *)v14 + 16))
    {
      __break(1u);
LABEL_101:
      __break(1u);
LABEL_102:
      swift_once();
      goto LABEL_31;
    }
    sub_2BBDC((uint64_t)&aBlock);
    unint64_t v80 = sub_231E0((Swift::UInt64 *)&aBlock);
    if ((v81 & 1) == 0) {
      goto LABEL_106;
    }
    double v82 = *(double *)(*(void *)(v79 + 56) + 16 * v80 + 8);
    swift_endAccess();
    sub_2BC28((uint64_t)&aBlock);
    if (Current - v82 > 600.0)
    {
      swift_beginAccess();
      swift_bridgeObjectRetain();
      unint64_t v83 = sub_231E0((Swift::UInt64 *)&aBlock);
      uint64_t v8 = v84;
      swift_bridgeObjectRelease();
      if (v8)
      {
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        uint64_t v86 = *(void *)v14;
        uint64_t v108 = *(void *)v14;
        *(void *)unint64_t v14 = 0x8000000000000000;
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        {
          sub_269A4();
          uint64_t v86 = v108;
        }
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v8 = *(char **)(*(void *)(v86 + 56) + 16 * v83);
        sub_2533C(v83, v86);
        *(void *)unint64_t v14 = v86;
        swift_bridgeObjectRelease();
        sub_2BC28((uint64_t)&aBlock);
        swift_bridgeObjectRelease();
        p_long long aBlock = &aBlock;
      }
      else
      {
        sub_2BC28((uint64_t)&aBlock);
      }
      swift_endAccess();
      goto LABEL_60;
    }
    sub_2BC28((uint64_t)&aBlock);
    if (v68) {
      goto LABEL_61;
    }
  }
  uint64_t v74 = v72 + 5;
  if (v74 >= v107)
  {
LABEL_89:
    swift_release();
    swift_release();
    goto LABEL_90;
  }
  unint64_t v73 = *(void *)&v1[8 * v74];
  if (v73)
  {
    uint64_t v69 = v74;
    goto LABEL_79;
  }
  while (1)
  {
    uint64_t v69 = v74 + 1;
    if (__OFADD__(v74, 1)) {
      break;
    }
    if (v69 >= v107) {
      goto LABEL_89;
    }
    unint64_t v73 = *(void *)&v1[8 * v69];
    ++v74;
    if (v73) {
      goto LABEL_79;
    }
  }
  __break(1u);
LABEL_106:
  sub_2BC28((uint64_t)&aBlock);
  __break(1u);
LABEL_107:
  __break(1u);
LABEL_108:
  __break(1u);
LABEL_109:
  __break(1u);
}

uint64_t sub_16804(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

uint64_t sub_1682C(void *a1)
{
  sub_4BA0(&qword_39958);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2E960;
  *(void *)(inited + 32) = sub_2DC10();
  *(void *)(inited + 40) = SHMediaItemTimeRanges;
  uint64_t v3 = SHMediaItemTimeRanges;
  *(void *)(inited + 48) = sub_2DC20();
  *(void *)(inited + 56) = SHMediaItemFrequencySkewRanges;
  uint64_t v4 = SHMediaItemFrequencySkewRanges;
  unint64_t v5 = sub_22008(inited);
  unint64_t v6 = v5;
  int64_t v7 = 0;
  unint64_t v8 = v5 + 64;
  uint64_t v9 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v10 = -1;
  if (v9 < 64) {
    uint64_t v10 = ~(-1 << v9);
  }
  unint64_t v11 = v10 & *(void *)(v5 + 64);
  int64_t v91 = (unint64_t)(v9 + 63) >> 6;
  if (v11) {
    goto LABEL_7;
  }
LABEL_8:
  int64_t v16 = v7 + 1;
  if (!__OFADD__(v7, 1))
  {
    if (v16 < v91)
    {
      unint64_t v17 = *(void *)(v8 + 8 * v16);
      ++v7;
      if (v17) {
        goto LABEL_22;
      }
      int64_t v7 = v16 + 1;
      if (v16 + 1 >= v91) {
        goto LABEL_83;
      }
      unint64_t v17 = *(void *)(v8 + 8 * v7);
      if (v17) {
        goto LABEL_22;
      }
      int64_t v7 = v16 + 2;
      if (v16 + 2 >= v91) {
        goto LABEL_83;
      }
      unint64_t v17 = *(void *)(v8 + 8 * v7);
      if (v17) {
        goto LABEL_22;
      }
      int64_t v7 = v16 + 3;
      if (v16 + 3 >= v91) {
        goto LABEL_83;
      }
      unint64_t v17 = *(void *)(v8 + 8 * v7);
      if (v17)
      {
LABEL_22:
        unint64_t v11 = (v17 - 1) & v17;
        for (unint64_t i = __clz(__rbit64(v17)) + (v7 << 6); ; unint64_t i = v14 | (v7 << 6))
        {
          uint64_t v19 = 8 * i;
          uint64_t v20 = *(void **)(*(void *)(v6 + 48) + v19);
          unint64_t v21 = *(void **)(*(void *)(v6 + 56) + v19);
          if (!a1[2])
          {
            long long v94 = 0u;
            long long v95 = 0u;
            id v12 = v20;
            id v13 = v21;
LABEL_6:

            sub_2D07C((uint64_t)&v94, &qword_39458);
            if (!v11) {
              goto LABEL_8;
            }
            goto LABEL_7;
          }
          id v22 = v20;
          id v92 = v21;
          uint64_t v23 = sub_23374((uint64_t)v22, (uint64_t (*)(uint64_t, Swift::Int))sub_22844);
          if (v24)
          {
            sub_27554(a1[7] + 32 * v23, (uint64_t)&v94);
          }
          else
          {
            long long v94 = 0u;
            long long v95 = 0u;
          }

          if (!*((void *)&v95 + 1)) {
            goto LABEL_6;
          }
          sub_2C65C(&v94, v96);
          sub_27554((uint64_t)v96, (uint64_t)&v94);
          sub_4BA0(&qword_39960);
          if (swift_dynamicCast())
          {
            unint64_t v89 = v6;
            uint64_t v25 = *(void *)&v93[0];
            int64_t v26 = *(void *)(*(void *)&v93[0] + 16);
            if (v26)
            {
              unint64_t v86 = v8;
              *(void *)&long long v94 = &_swiftEmptyArrayStorage;
              sub_22A34(0, v26, 0);
              unint64_t v27 = (void *)v94;
              uint64_t v28 = (double *)(v25 + 40);
              do
              {
                id v29 = [objc_allocWithZone((Class)SHRange) initWithLowerBound:*(v28 - 1) upperBound:*v28];
                *(void *)&long long v94 = v27;
                unint64_t v31 = v27[2];
                unint64_t v30 = v27[3];
                if (v31 >= v30 >> 1)
                {
                  sub_22A34((void *)(v30 > 1), v31 + 1, 1);
                  unint64_t v27 = (void *)v94;
                }
                v27[2] = v31 + 1;
                v27[v31 + 4] = v29;
                v28 += 2;
                --v26;
              }
              while (v26);
              swift_bridgeObjectRelease();
              unint64_t v8 = v86;
            }
            else
            {
              swift_bridgeObjectRelease();
              unint64_t v27 = &_swiftEmptyArrayStorage;
            }
            *((void *)&v95 + 1) = sub_4BA0(&qword_39970);
            *(void *)&long long v94 = v27;
            sub_2C65C(&v94, v93);
            id v51 = v92;
            char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
            unint64_t v42 = v51;
            unint64_t v54 = sub_23374((uint64_t)v51, (uint64_t (*)(uint64_t, Swift::Int))sub_22844);
            uint64_t v55 = a1[2];
            BOOL v56 = (v53 & 1) == 0;
            uint64_t v57 = v55 + v56;
            if (__OFADD__(v55, v56)) {
              goto LABEL_86;
            }
            char v58 = v53;
            if (a1[3] >= v57)
            {
              if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
                sub_22128();
              }
            }
            else
            {
              sub_22300(v57, isUniquelyReferenced_nonNull_native);
              uint64_t v59 = sub_23374((uint64_t)v42, (uint64_t (*)(uint64_t, Swift::Int))sub_22844);
              if ((v58 & 1) != (v60 & 1)) {
                goto LABEL_92;
              }
              unint64_t v54 = v59;
            }
            unint64_t v6 = v89;
            if (v58) {
              goto LABEL_72;
            }
            a1[(v54 >> 6) + 8] |= 1 << v54;
            *(void *)(a1[6] + 8 * v54) = v42;
            sub_2C65C(v93, (_OWORD *)(a1[7] + 32 * v54));
            uint64_t v61 = a1[2];
            BOOL v62 = __OFADD__(v61, 1);
            uint64_t v63 = v61 + 1;
            if (v62) {
              goto LABEL_89;
            }
          }
          else
          {
            sub_27554((uint64_t)v96, (uint64_t)&v94);
            sub_4BA0(&qword_39968);
            if (swift_dynamicCast())
            {
              unint64_t v90 = v6;
              uint64_t v32 = *(void *)&v93[0];
              int64_t v33 = *(void *)(*(void *)&v93[0] + 16);
              if (v33)
              {
                unint64_t v87 = v8;
                *(void *)&long long v94 = &_swiftEmptyArrayStorage;
                sub_22A34(0, v33, 0);
                uint64_t v34 = (void *)v94;
                uint64_t v35 = (float *)(v32 + 36);
                do
                {
                  id v36 = [objc_allocWithZone((Class)SHRange) initWithLowerBound:*(v35 - 1) upperBound:*v35];
                  *(void *)&long long v94 = v34;
                  unint64_t v38 = v34[2];
                  unint64_t v37 = v34[3];
                  if (v38 >= v37 >> 1)
                  {
                    sub_22A34((void *)(v37 > 1), v38 + 1, 1);
                    uint64_t v34 = (void *)v94;
                  }
                  v34[2] = v38 + 1;
                  v34[v38 + 4] = v36;
                  v35 += 2;
                  --v33;
                }
                while (v33);
                swift_bridgeObjectRelease();
                unint64_t v8 = v87;
              }
              else
              {
                swift_bridgeObjectRelease();
                uint64_t v34 = &_swiftEmptyArrayStorage;
              }
              *((void *)&v95 + 1) = sub_4BA0(&qword_39970);
              *(void *)&long long v94 = v34;
              sub_2C65C(&v94, v93);
              id v67 = v92;
              char v68 = swift_isUniquelyReferenced_nonNull_native();
              unint64_t v42 = v67;
              unint64_t v54 = sub_23374((uint64_t)v67, (uint64_t (*)(uint64_t, Swift::Int))sub_22844);
              uint64_t v70 = a1[2];
              BOOL v71 = (v69 & 1) == 0;
              uint64_t v72 = v70 + v71;
              if (__OFADD__(v70, v71)) {
                goto LABEL_88;
              }
              char v73 = v69;
              if (a1[3] >= v72)
              {
                if ((v68 & 1) == 0) {
                  sub_22128();
                }
              }
              else
              {
                sub_22300(v72, v68);
                uint64_t v74 = sub_23374((uint64_t)v42, (uint64_t (*)(uint64_t, Swift::Int))sub_22844);
                if ((v73 & 1) != (v75 & 1)) {
                  goto LABEL_92;
                }
                unint64_t v54 = v74;
              }
              unint64_t v6 = v90;
              if (v73)
              {
LABEL_72:
                long long v64 = (_OWORD *)(a1[7] + 32 * v54);
                sub_2CA70((uint64_t)v64);
                uint64_t v65 = v93;
                goto LABEL_73;
              }
              a1[(v54 >> 6) + 8] |= 1 << v54;
              *(void *)(a1[6] + 8 * v54) = v42;
              sub_2C65C(v93, (_OWORD *)(a1[7] + 32 * v54));
              uint64_t v76 = a1[2];
              BOOL v62 = __OFADD__(v76, 1);
              uint64_t v63 = v76 + 1;
              if (v62) {
                goto LABEL_91;
              }
            }
            else
            {
              unint64_t v88 = v8;
              unint64_t v39 = v6;
              sub_27554((uint64_t)v96, (uint64_t)&v94);
              id v40 = v92;
              char v41 = swift_isUniquelyReferenced_nonNull_native();
              *(void *)&v93[0] = a1;
              unint64_t v42 = v40;
              unint64_t v44 = sub_23374((uint64_t)v40, (uint64_t (*)(uint64_t, Swift::Int))sub_22844);
              uint64_t v45 = a1[2];
              BOOL v46 = (v43 & 1) == 0;
              uint64_t v47 = v45 + v46;
              if (__OFADD__(v45, v46)) {
                goto LABEL_87;
              }
              char v48 = v43;
              if (a1[3] >= v47)
              {
                if ((v41 & 1) == 0) {
                  sub_22128();
                }
              }
              else
              {
                sub_22300(v47, v41);
                uint64_t v49 = sub_23374((uint64_t)v42, (uint64_t (*)(uint64_t, Swift::Int))sub_22844);
                if ((v48 & 1) != (v50 & 1)) {
                  goto LABEL_92;
                }
                unint64_t v44 = v49;
              }
              unint64_t v6 = v39;
              a1 = *(void **)&v93[0];
              unint64_t v8 = v88;
              if (v48)
              {
                long long v64 = (_OWORD *)(*(void *)(*(void *)&v93[0] + 56) + 32 * v44);
                sub_2CA70((uint64_t)v64);
                uint64_t v65 = &v94;
LABEL_73:
                sub_2C65C(v65, v64);
                goto LABEL_76;
              }
              *(void *)(*(void *)&v93[0] + 8 * (v44 >> 6) + 64) |= 1 << v44;
              *(void *)(a1[6] + 8 * v44) = v42;
              sub_2C65C(&v94, (_OWORD *)(a1[7] + 32 * v44));
              uint64_t v66 = a1[2];
              BOOL v62 = __OFADD__(v66, 1);
              uint64_t v63 = v66 + 1;
              if (v62) {
                goto LABEL_90;
              }
            }
          }
          a1[2] = v63;
          id v77 = v42;
LABEL_76:

          swift_bridgeObjectRelease();
          swift_bridgeObjectRetain();
          unint64_t v78 = sub_23374((uint64_t)v22, (uint64_t (*)(uint64_t, Swift::Int))sub_22844);
          char v80 = v79;
          swift_bridgeObjectRelease();
          if (v80)
          {
            char v81 = swift_isUniquelyReferenced_nonNull_native();
            *(void *)&v93[0] = a1;
            if ((v81 & 1) == 0)
            {
              sub_22128();
              a1 = *(void **)&v93[0];
            }

            sub_2C65C((_OWORD *)(a1[7] + 32 * v78), &v94);
            sub_22650(v78, (uint64_t)a1);
            swift_bridgeObjectRelease();
          }
          else
          {
            long long v94 = 0u;
            long long v95 = 0u;
          }

          sub_2D07C((uint64_t)&v94, &qword_39458);
          sub_2CA70((uint64_t)v96);

          if (!v11) {
            goto LABEL_8;
          }
LABEL_7:
          unint64_t v14 = __clz(__rbit64(v11));
          v11 &= v11 - 1;
        }
      }
      int64_t v7 = v16 + 4;
      if (v16 + 4 < v91)
      {
        unint64_t v17 = *(void *)(v8 + 8 * v7);
        int64_t v18 = v16 + 4;
        if (!v17)
        {
          while (1)
          {
            int64_t v7 = v18 + 1;
            if (__OFADD__(v18, 1)) {
              goto LABEL_85;
            }
            if (v7 >= v91) {
              goto LABEL_83;
            }
            unint64_t v17 = *(void *)(v8 + 8 * v7);
            ++v18;
            if (v17) {
              goto LABEL_22;
            }
          }
        }
        goto LABEL_22;
      }
    }
LABEL_83:
    swift_release();
    ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
    type metadata accessor for SHMediaItemProperty(0);
    sub_27694(&qword_39978, type metadata accessor for SHMediaItemProperty);
    swift_bridgeObjectRetain();
    Class isa = sub_2D9D0().super.isa;
    swift_bridgeObjectRelease();
    id v84 = [ObjCClassFromMetadata mediaItemWithProperties:isa];
    swift_bridgeObjectRelease();

    return (uint64_t)v84;
  }
  __break(1u);
LABEL_85:
  __break(1u);
LABEL_86:
  __break(1u);
LABEL_87:
  __break(1u);
LABEL_88:
  __break(1u);
LABEL_89:
  __break(1u);
LABEL_90:
  __break(1u);
LABEL_91:
  __break(1u);
LABEL_92:
  type metadata accessor for SHMediaItemProperty(0);
  uint64_t result = sub_2DE30();
  __break(1u);
  return result;
}

Swift::Int sub_17244(int a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = sub_2D8F0();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  unint64_t v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    if (qword_39BA0 != -1) {
      swift_once();
    }
    uint64_t v12 = sub_46B4(v8, (uint64_t)HMLog);
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, v12, v8);
    swift_errorRetain();
    swift_errorRetain();
    id v13 = sub_2D8D0();
    os_log_type_t v14 = sub_2DB70();
    if (os_log_type_enabled(v13, v14))
    {
      uint64_t v21 = a3;
      uint64_t v15 = swift_slowAlloc();
      uint64_t v22 = a4;
      int64_t v16 = (uint8_t *)v15;
      uint64_t v19 = (void *)swift_slowAlloc();
      *(_DWORD *)int64_t v16 = 138412290;
      int v20 = a1;
      swift_errorRetain();
      uint64_t v17 = _swift_stdlib_bridgeErrorToNSError();
      uint64_t v23 = v17;
      LOBYTE(a1) = v20;
      sub_2DC80();
      *uint64_t v19 = v17;
      a3 = v21;
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl(&dword_0, v13, v14, "Error checking availability: %@", v16, 0xCu);
      sub_4BA0(&qword_39500);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      swift_errorRelease();
      swift_errorRelease();
    }

    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }
  swift_beginAccess();
  *(unsigned char *)(a3 + 16) = a1 & 1;
  return sub_2DC60();
}

void sub_17508(uint64_t a1, uint64_t a2, void *a3)
{
  unint64_t v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  swift_retain();
  id v6 = a3;
  v5(a2, a3);
  swift_release();
}

uint64_t sub_17580()
{
  uint64_t v1 = sub_2D8F0();
  uint64_t v2 = *(char **)(v1 - 8);
  uint64_t v3 = __chkstk_darwin(v1);
  uint64_t v45 = (char *)&v41 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  id v6 = (char *)&v41 - v5;
  int64_t v7 = (void *)MRContentItemCopyNowPlayingInfo();
  char v43 = v6;
  if (!v7)
  {
    uint64_t ITunesStoreIdentifier = MRContentItemGetITunesStoreIdentifier();
    id v44 = 0;
    uint64_t v48 = ITunesStoreIdentifier;
    long long v50 = 0u;
    long long v51 = 0u;
    goto LABEL_11;
  }
  uint64_t ITunesStoreIdentifier = MRContentItemGetITunesStoreIdentifier();
  uint64_t v48 = ITunesStoreIdentifier;
  uint64_t result = kMRMediaRemoteNowPlayingInfoInternationalStandardRecordingCode;
  if (kMRMediaRemoteNowPlayingInfoInternationalStandardRecordingCode)
  {
    *(void *)&v49[0] = sub_2DA30();
    *((void *)&v49[0] + 1) = v10;
    swift_bridgeObjectRetain();
    id v11 = v7;
    id v12 = objc_msgSend(v11, "__swift_objectForKeyedSubscript:", sub_2DE20());
    swift_unknownObjectRelease();

    if (v12)
    {
      sub_2DCA0();
      swift_unknownObjectRelease();
    }
    else
    {
      memset(v49, 0, sizeof(v49));
    }
    sub_28420((uint64_t)v49, (uint64_t)&v50, &qword_39458);
    swift_bridgeObjectRelease();
    if (*((void *)&v51 + 1))
    {
      if (swift_dynamicCast())
      {
        id v13 = v2;
        unint64_t v14 = *((void *)&v49[0] + 1);
        uint64_t v46 = *(void *)&v49[0];
        id v44 = v7;
        goto LABEL_14;
      }
      id v44 = v7;
LABEL_13:
      id v13 = v2;
      uint64_t v46 = 0;
      unint64_t v14 = 0xE000000000000000;
LABEL_14:
      sub_4BA0(&qword_399D8);
      uint64_t inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_2E960;
      *(void *)(inited + 32) = 0xD000000000000019;
      *(void *)(inited + 40) = 0x800000000002F940;
      if (qword_39BA8 != -1) {
        swift_once();
      }
      uint64_t v16 = 0x6C7070612E6D6F63;
      uint64_t v17 = qword_39BB8;
      if (!byte_39BB0) {
        uint64_t v16 = 0;
      }
      *(void *)(inited + 48) = v16;
      *(void *)(inited + 56) = v17;
      if (ITunesStoreIdentifier) {
        goto LABEL_19;
      }
      uint64_t v31 = HIBYTE(v14) & 0xF;
      if ((v14 & 0x2000000000000000) == 0) {
        uint64_t v31 = v46 & 0xFFFFFFFFFFFFLL;
      }
      if (!v31)
      {
LABEL_19:
        swift_setDeallocating();
        swift_bridgeObjectRetain();
        swift_arrayDestroy();
      }
      else
      {
        char v32 = sub_17DF4(*(void *)(v0 + OBJC_IVAR___AXHapticMusicServer_nowPlayingBundleIdentifier), *(void *)(v0 + OBJC_IVAR___AXHapticMusicServer_nowPlayingBundleIdentifier + 8), (void *)inited);
        swift_setDeallocating();
        swift_bridgeObjectRetain();
        swift_arrayDestroy();
        if (v32)
        {
          uint64_t v20 = v46;
          NSString v33 = sub_2DA00();
          id v34 = [v33 longLongValue];

          uint64_t v48 = (uint64_t)v34;
          if (qword_39BA0 != -1) {
            swift_once();
          }
          uint64_t v35 = sub_46B4(v1, (uint64_t)HMLog);
          swift_beginAccess();
          id v36 = v43;
          (*((void (**)(char *, uint64_t, uint64_t))v13 + 2))(v43, v35, v1);
          swift_bridgeObjectRetain_n();
          unint64_t v37 = sub_2D8D0();
          os_log_type_t v38 = sub_2DB50();
          if (os_log_type_enabled(v37, v38))
          {
            uint64_t v39 = swift_slowAlloc();
            uint64_t v42 = v1;
            uint64_t v40 = v39;
            *(void *)&long long v50 = swift_slowAlloc();
            *(_DWORD *)uint64_t v40 = 136315394;
            swift_bridgeObjectRetain();
            uint64_t v47 = sub_22B88(v46, v14, (uint64_t *)&v50);
            sub_2DC80();
            swift_bridgeObjectRelease_n();
            *(_WORD *)(v40 + 12) = 2048;
            uint64_t v47 = (uint64_t)v34;
            sub_2DC80();
            _os_log_impl(&dword_0, v37, v38, "Transfering isrc %s to adam ID: %lld", (uint8_t *)v40, 0x16u);
            swift_arrayDestroy();
            uint64_t v20 = v46;
            swift_slowDealloc();
            swift_slowDealloc();

            (*((void (**)(char *, uint64_t))v13 + 1))(v36, v42);
          }
          else
          {

            swift_bridgeObjectRelease_n();
            (*((void (**)(char *, uint64_t))v13 + 1))(v36, v1);
          }
          goto LABEL_42;
        }
      }
      uint64_t v18 = sub_2DA30();
      uint64_t v20 = v46;
      id v21 = v44;
      if (v46 == v18 && v14 == v19)
      {
        swift_bridgeObjectRelease();
      }
      else
      {
        char v22 = sub_2DE10();
        swift_bridgeObjectRelease();
        if ((v22 & 1) == 0)
        {

LABEL_42:
          swift_beginAccess();
          return v20;
        }
      }
      if (qword_39BA0 != -1) {
        swift_once();
      }
      uint64_t v23 = sub_46B4(v1, (uint64_t)HMLog);
      swift_beginAccess();
      (*((void (**)(char *, uint64_t, uint64_t))v13 + 2))(v45, v23, v1);
      char v24 = v21;
      uint64_t v25 = sub_2D8D0();
      os_log_type_t v26 = sub_2DB50();
      if (os_log_type_enabled(v25, v26))
      {
        char v43 = v13;
        uint64_t v42 = v1;
        unint64_t v27 = (uint8_t *)swift_slowAlloc();
        uint64_t v28 = (void *)swift_slowAlloc();
        *(_DWORD *)unint64_t v27 = 138412290;
        if (v7)
        {
          *(void *)&long long v50 = v24;
          id v29 = v24;
          sub_2DC80();
          id v30 = v44;
        }
        else
        {
          *(void *)&long long v50 = 0;
          sub_2DC80();
          id v30 = 0;
        }
        void *v28 = v30;

        _os_log_impl(&dword_0, v25, v26, "Sample track: %@", v27, 0xCu);
        sub_4BA0(&qword_39500);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
        uint64_t v1 = v42;
        id v13 = v43;
        uint64_t v20 = v46;
      }
      else
      {

        uint64_t v25 = v24;
      }

      (*((void (**)(char *, uint64_t))v13 + 1))(v45, v1);
      uint64_t v48 = 99999999;
      goto LABEL_42;
    }
    id v44 = v7;
LABEL_11:
    sub_2D07C((uint64_t)&v50, &qword_39458);
    goto LABEL_13;
  }
  __break(1u);
  return result;
}

uint64_t sub_17DF4(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = a3[2];
  if (!v3) {
    return 0;
  }
  if (a3[4] == a1 && a3[5] == a2) {
    return 1;
  }
  uint64_t result = sub_2DE10();
  if (result) {
    return 1;
  }
  if (v3 == 1) {
    return 0;
  }
  uint64_t v9 = a3 + 7;
  for (uint64_t i = 1; ; ++i)
  {
    uint64_t v11 = i + 1;
    if (__OFADD__(i, 1)) {
      break;
    }
    BOOL v12 = *(v9 - 1) == a1 && *v9 == a2;
    if (v12 || (sub_2DE10() & 1) != 0) {
      return 1;
    }
    uint64_t result = 0;
    v9 += 2;
    if (v11 == v3) {
      return result;
    }
  }
  __break(1u);
  return result;
}

void sub_17EBC(char a1, uint64_t a2, void *a3)
{
  uint64_t v5 = sub_4BA0(&qword_39450);
  __chkstk_darwin(v5 - 8);
  int64_t v7 = (char *)v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_2D8F0();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)v29 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    id v13 = (unsigned char *)Strong;
    v29[1] = a3 + 2;
    if (qword_39BA0 != -1) {
      swift_once();
    }
    uint64_t v14 = sub_46B4(v8, (uint64_t)HMLog);
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, v14, v8);
    swift_retain();
    uint64_t v15 = sub_2D8D0();
    os_log_type_t v16 = sub_2DB50();
    if (os_log_type_enabled(v15, v16))
    {
      uint64_t v17 = (_DWORD *)swift_slowAlloc();
      v29[0] = v7;
      uint64_t v18 = v17;
      *uint64_t v17 = 134218240;
      swift_beginAccess();
      uint64_t v30 = a3[2];
      sub_2DC80();
      swift_release();
      *((_WORD *)v18 + 6) = 1024;
      LODWORD(v30) = a1 & 1;
      sub_2DC80();
      _os_log_impl(&dword_0, v15, v16, "Fetched haptic tracks for %lld: %{BOOL}d", (uint8_t *)v18, 0x12u);
      int64_t v7 = (char *)v29[0];
      swift_slowDealloc();
    }
    else
    {
      swift_release();
    }

    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    if (a1)
    {
      swift_beginAccess();
      uint64_t v19 = a3[4];
      uint64_t v20 = a3[5];
      uint64_t v22 = a3[6];
      uint64_t v21 = a3[7];
      uint64_t v23 = a3[8];
      char v24 = &v13[OBJC_IVAR___AXHapticMusicServer_trackIdentifier];
      *(_OWORD *)char v24 = *((_OWORD *)a3 + 1);
      *((void *)v24 + 2) = v19;
      *((void *)v24 + 3) = v20;
      *((void *)v24 + 4) = v22;
      *((void *)v24 + 5) = v21;
      *((void *)v24 + 6) = v23;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    else
    {
      uint64_t v25 = &v13[OBJC_IVAR___AXHapticMusicServer_trackIdentifier];
      *uint64_t v25 = 0;
      v25[1] = 0;
      v25[2] = 0xE000000000000000;
      v25[3] = 0;
      v25[4] = 0xE000000000000000;
      v25[5] = 0;
      v25[6] = 0xE000000000000000;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v13[OBJC_IVAR___AXHapticMusicServer_fetchingHapticTracks] = 0;
    uint64_t v26 = sub_2DB30();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v26 - 8) + 56))(v7, 1, 1, v26);
    uint64_t v27 = swift_allocObject();
    *(void *)(v27 + 16) = 0;
    *(void *)(v27 + 24) = 0;
    *(void *)(v27 + 32) = v13;
    *(unsigned char *)(v27 + 40) = a1 & 1;
    uint64_t v28 = v13;
    sub_E74C((uint64_t)v7, (uint64_t)&unk_399A8, v27);
    swift_release();
  }
}

uint64_t sub_182D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  *(unsigned char *)(v5 + 88) = a5;
  *(void *)(v5 + 72) = a4;
  return ((uint64_t (*)(uint64_t (*)(), void, void))_swift_task_switch)(sub_182F4, 0, 0);
}

uint64_t sub_182F4()
{
  uint64_t v1 = *(void *)(v0 + 72) + OBJC_IVAR___AXHapticMusicServer_trackIdentifier;
  long long v3 = *(_OWORD *)(v1 + 16);
  long long v2 = *(_OWORD *)(v1 + 32);
  long long v4 = *(_OWORD *)v1;
  *(void *)(v0 + 64) = *(void *)(v1 + 48);
  *(_OWORD *)(v0 + 32) = v3;
  *(_OWORD *)(v0 + 48) = v2;
  *(_OWORD *)(v0 + 16) = v4;
  sub_2BBDC(v0 + 16);
  uint64_t v5 = swift_task_alloc();
  *(void *)(v0 + 80) = v5;
  *(void *)uint64_t v5 = v0;
  *(void *)(v5 + 8) = sub_183DC;
  uint64_t v6 = *(void *)(v0 + 72);
  *(unsigned char *)(v5 + 176) = *(unsigned char *)(v0 + 88);
  *(void *)(v5 + 96) = v0 + 16;
  *(void *)(v5 + 104) = v6;
  return ((uint64_t (*)(uint64_t (*)(), void, void))_swift_task_switch)(sub_F96C, 0, 0);
}

uint64_t sub_183DC()
{
  uint64_t v1 = *v0 + 16;
  uint64_t v4 = *v0;
  swift_task_dealloc();
  sub_2BC28(v1);
  long long v2 = *(uint64_t (**)(void))(v4 + 8);
  return v2();
}

void sub_184DC(void *a1, void *a2)
{
  uint64_t v4 = sub_2D8F0();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v33 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v33 - v9;
  if (a1 && (*((unsigned char *)a2 + OBJC_IVAR___AXHapticMusicServer_pauseShouldCancelEngineStartup) & 1) == 0)
  {
    uint64_t v16 = swift_allocObject();
    *(void *)(v16 + 16) = a2;
    uint64_t v17 = qword_39BA0;
    id v18 = a1;
    uint64_t v19 = a2;
    if (v17 != -1) {
      swift_once();
    }
    uint64_t v20 = sub_46B4(v4, (uint64_t)HMLog);
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v10, v20, v4);
    id v21 = v18;
    uint64_t v22 = sub_2D8D0();
    os_log_type_t v23 = sub_2DB60();
    if (os_log_type_enabled(v22, v23))
    {
      char v24 = (uint8_t *)swift_slowAlloc();
      id v34 = (void *)swift_slowAlloc();
      uint64_t v37 = v16;
      aBlock[0] = v21;
      uint64_t v35 = v24;
      *(_DWORD *)char v24 = 138412290;
      NSString v33 = v24 + 4;
      id v25 = v21;
      id v36 = v19;
      id v26 = v25;
      uint64_t v16 = v37;
      sub_2DC80();
      void *v34 = a1;

      uint64_t v19 = v36;
      _os_log_impl(&dword_0, v22, v23, "metadata: %@", v35, 0xCu);
      sub_4BA0(&qword_39500);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
    }
    (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);
    if ((v19[OBJC_IVAR___AXHapticMusicServer_isHapticTrackPlaying] & 1) == 0)
    {
      if (v19[OBJC_IVAR___AXHapticMusicServer_engineIsRunning] != 1)
      {
        uint64_t v27 = *(void **)&v19[OBJC_IVAR___AXHapticMusicServer_engine];
        if (v27)
        {
          uint64_t v28 = (void *)swift_allocObject();
          void v28[2] = v19;
          v28[3] = sub_2BDD0;
          v28[4] = v16;
          v28[5] = v21;
          aBlock[4] = sub_2BDDC;
          aBlock[5] = v28;
          aBlock[0] = _NSConcreteStackBlock;
          aBlock[1] = 1107296256;
          aBlock[2] = sub_15258;
          aBlock[3] = &unk_359C0;
          id v29 = _Block_copy(aBlock);
          id v30 = v21;
          uint64_t v31 = v19;
          id v32 = v27;
          swift_retain();
          swift_release();
          [v32 startWithCompletionHandler:v29];

          swift_release();
          _Block_release(v29);

          return;
        }
LABEL_18:

        swift_release();
        return;
      }
      v19[OBJC_IVAR___AXHapticMusicServer_isHapticTrackPlaying] = 1;
    }
    sub_18A58(v21, v19[OBJC_IVAR___AXHapticMusicServer_currentHapticPlayerStarted] != 1, v19);
    goto LABEL_18;
  }
  if (qword_39BA0 != -1) {
    swift_once();
  }
  uint64_t v11 = sub_46B4(v4, (uint64_t)HMLog);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v8, v11, v4);
  BOOL v12 = a2;
  id v13 = sub_2D8D0();
  os_log_type_t v14 = sub_2DB50();
  if (os_log_type_enabled(v13, v14))
  {
    uint64_t v15 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v15 = 67109120;
    int v39 = *((unsigned __int8 *)&v12->isa + OBJC_IVAR___AXHapticMusicServer_pauseShouldCancelEngineStartup);
    sub_2DC80();

    _os_log_impl(&dword_0, v13, v14, "Not process start requesting: %{BOOL}d", v15, 8u);
    swift_slowDealloc();
  }
  else
  {

    id v13 = v12;
  }

  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
}

uint64_t sub_18A58(void *a1, char a2, char *a3)
{
  uint64_t v30 = sub_2D930();
  uint64_t v33 = *(void *)(v30 - 8);
  __chkstk_darwin(v30);
  uint64_t v7 = (char *)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_2D960();
  uint64_t v31 = *(void *)(v8 - 8);
  uint64_t v32 = v8;
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)&v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_2D980();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = __chkstk_darwin(v11);
  uint64_t v15 = (char *)&v27 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  uint64_t v17 = (char *)&v27 - v16;
  double v18 = sub_2BE40(a1);
  double v19 = v18;
  if (a2) {
    sub_18EF0(v18);
  }
  else {
    sub_195B4(v18);
  }
  id v20 = *(id *)&a3[OBJC_IVAR___AXHapticMusicServer_queue];
  sub_2D970();
  uint64_t v29 = v11;
  sub_2D990();
  uint64_t v28 = *(void (**)(char *, uint64_t))(v12 + 8);
  v28(v15, v11);
  uint64_t v21 = swift_allocObject();
  *(double *)(v21 + 16) = v19;
  *(void *)(v21 + 24) = a3;
  if (v19 >= 1.0)
  {
    int v39 = sub_2C1F8;
    uint64_t v40 = v21;
    long long aBlock = _NSConcreteStackBlock;
    uint64_t v36 = 1107296256;
    uint64_t v22 = &unk_35A60;
  }
  else
  {
    int v39 = sub_2D59C;
    uint64_t v40 = v21;
    long long aBlock = _NSConcreteStackBlock;
    uint64_t v36 = 1107296256;
    uint64_t v22 = &unk_35AB0;
  }
  uint64_t v37 = sub_68F8;
  os_log_type_t v38 = v22;
  os_log_type_t v23 = _Block_copy(&aBlock);
  char v24 = a3;
  sub_2D940();
  id v34 = &_swiftEmptyArrayStorage;
  sub_27694(&qword_394A8, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_4BA0(&qword_394B0);
  sub_281F8(&qword_394B8, &qword_394B0);
  uint64_t v25 = v30;
  sub_2DCB0();
  sub_2DBB0();
  _Block_release(v23);

  (*(void (**)(char *, uint64_t))(v33 + 8))(v7, v25);
  (*(void (**)(char *, uint64_t))(v31 + 8))(v10, v32);
  v28(v17, v29);
  return swift_release();
}

uint64_t sub_18EF0(double a1)
{
  uint64_t v3 = sub_2D8F0();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = __chkstk_darwin(v3);
  uint64_t v7 = (char *)&v51 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __chkstk_darwin(v5);
  uint64_t v10 = (char *)&v51 - v9;
  __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v51 - v11;
  if (qword_39BA0 != -1) {
    swift_once();
  }
  uint64_t v13 = sub_46B4(v3, (uint64_t)HMLog);
  swift_beginAccess();
  uint64_t v54 = v3;
  uint64_t v55 = v4;
  uint64_t v14 = *(void (**)(char *, uint64_t, uint64_t))(v4 + 16);
  uint64_t v58 = v4 + 16;
  uint64_t v59 = v13;
  uint64_t v57 = v14;
  v14(v12, v13, v3);
  id v15 = v1;
  uint64_t v16 = sub_2D8D0();
  os_log_type_t v17 = sub_2DB80();
  double v18 = &selRef_auxiliarySession;
  double v19 = &selRef_auxiliarySession;
  if (os_log_type_enabled(v16, v17))
  {
    id v20 = (unsigned __int8 *)v15;
    uint64_t v21 = swift_slowAlloc();
    *(_DWORD *)uint64_t v21 = 134218496;
    double v62 = a1;
    sub_2DC80();
    *(_WORD *)(v21 + 12) = 1024;
    LODWORD(v62) = v20[OBJC_IVAR___AXHapticMusicServer_isHapticTrackPlaying];
    sub_2DC80();
    *(_WORD *)(v21 + 18) = 2048;
    uint64_t v22 = v20;
    os_log_type_t v23 = &v20[OBJC_IVAR___AXHapticMusicServer_players];
    swift_beginAccess();
    unint64_t v24 = *(void *)v23;
    if (v24 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v25 = sub_2DDA0();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v25 = *(void *)((char *)&dword_10 + (v24 & 0xFFFFFFFFFFFFFF8));
    }
    double v62 = *(double *)&v25;
    sub_2DC80();

    _os_log_impl(&dword_0, v16, v17, "Starting at position for playing tracks: %f %{BOOL}d, players: %ld", (uint8_t *)v21, 0x1Cu);
    id v15 = v22;
    swift_slowDealloc();
    double v19 = &selRef_auxiliarySession;
    double v18 = &selRef_auxiliarySession;
  }
  else
  {

    uint64_t v16 = v15;
  }

  uint64_t v26 = v54;
  uint64_t v27 = *(void (**)(char *, uint64_t))(v55 + 8);
  v55 += 8;
  BOOL v56 = v27;
  v27(v12, v54);
  if (v18[143][(void)v15])
  {
    uint64_t v28 = v19[169];
    uint64_t v52 = v15;
    uint64_t v29 = &v28[(void)v15];
    swift_beginAccess();
    uint64_t v30 = *(void *)v29;
    if (*(void *)v29 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v31 = sub_2DDA0();
      uint64_t v33 = v54;
      if (v31) {
        goto LABEL_11;
      }
    }
    else
    {
      uint64_t v31 = *(void *)((char *)&dword_10 + (v30 & 0xFFFFFFFFFFFFFF8));
      swift_bridgeObjectRetain();
      uint64_t v33 = v54;
      if (v31)
      {
LABEL_11:
        if (v31 < 1) {
          __break(1u);
        }
        uint64_t v34 = 0;
        unint64_t v60 = v30 & 0xC000000000000001;
        *(void *)&long long v32 = 138412290;
        long long v53 = v32;
        do
        {
          if (v60)
          {
            uint64_t v35 = (void *)sub_2DD30();
          }
          else
          {
            uint64_t v35 = *(void **)(v30 + 8 * v34 + 32);
            swift_unknownObjectRetain();
          }
          id v61 = 0;
          unsigned int v36 = [v35 startAtTime:&v61 error:0.0];
          id v37 = v61;
          if (v36
            && (id v61 = 0,
                id v38 = v37,
                unsigned int v39 = [v35 seekToOffset:&v61 error:a1],
                id v37 = v61,
                v39))
          {
            id v40 = v61;
            swift_unknownObjectRelease();
          }
          else
          {
            id v41 = v37;
            sub_2D810();

            swift_willThrow();
            v57(v7, v59, v33);
            swift_errorRetain();
            swift_errorRetain();
            uint64_t v42 = sub_2D8D0();
            os_log_type_t v43 = sub_2DB70();
            if (os_log_type_enabled(v42, v43))
            {
              uint64_t v44 = swift_slowAlloc();
              uint64_t v45 = (void *)swift_slowAlloc();
              *(_DWORD *)uint64_t v44 = v53;
              swift_errorRetain();
              uint64_t v46 = _swift_stdlib_bridgeErrorToNSError();
              *(void *)(v44 + 4) = v46;
              *uint64_t v45 = v46;
              swift_errorRelease();
              swift_errorRelease();
              _os_log_impl(&dword_0, v42, v43, "Error seeking offset: %@", (uint8_t *)v44, 0xCu);
              sub_4BA0(&qword_39500);
              swift_arrayDestroy();
              uint64_t v33 = v54;
              swift_slowDealloc();
              swift_slowDealloc();
              swift_unknownObjectRelease();

              swift_errorRelease();
            }
            else
            {
              swift_unknownObjectRelease();
              swift_errorRelease();
              swift_errorRelease();
              swift_errorRelease();
            }
            v56(v7, v33);
          }
          ++v34;
        }
        while (v31 != v34);
      }
    }
    uint64_t result = swift_bridgeObjectRelease();
    v52[OBJC_IVAR___AXHapticMusicServer_currentHapticPlayerStarted] = 1;
    return result;
  }
  v57(v10, v59, v26);
  uint64_t v47 = sub_2D8D0();
  os_log_type_t v48 = sub_2DB50();
  if (os_log_type_enabled(v47, v48))
  {
    uint64_t v49 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v49 = 0;
    _os_log_impl(&dword_0, v47, v48, " -- Haptic not playing - not starting", v49, 2u);
    swift_slowDealloc();
  }

  return ((uint64_t (*)(char *, uint64_t))v56)(v10, v26);
}

uint64_t sub_195B4(double a1)
{
  uint64_t v3 = sub_2D8F0();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = __chkstk_darwin(v3);
  char v73 = (char *)&v63 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __chkstk_darwin(v5);
  char v68 = (char *)&v63 - v8;
  uint64_t v9 = __chkstk_darwin(v7);
  uint64_t v11 = (char *)&v63 - v10;
  __chkstk_darwin(v9);
  uint64_t v13 = (char *)&v63 - v12;
  if (qword_39BA0 != -1) {
    swift_once();
  }
  uint64_t v14 = sub_46B4(v3, (uint64_t)HMLog);
  swift_beginAccess();
  id v15 = *(void (**)(char *, uint64_t, uint64_t))(v4 + 16);
  uint64_t v71 = v4 + 16;
  uint64_t v72 = v14;
  uint64_t v70 = v15;
  v15(v13, v14, v3);
  uint64_t v16 = v1;
  os_log_type_t v17 = sub_2D8D0();
  os_log_type_t v18 = sub_2DB50();
  if (os_log_type_enabled(v17, v18))
  {
    char v69 = v11;
    uint64_t v19 = swift_slowAlloc();
    *(_DWORD *)uint64_t v19 = 134218496;
    double v75 = a1;
    sub_2DC80();
    *(_WORD *)(v19 + 12) = 1024;
    LODWORD(v75) = *((unsigned __int8 *)&v16->isa + OBJC_IVAR___AXHapticMusicServer_isHapticTrackPlaying);
    sub_2DC80();
    *(_WORD *)(v19 + 18) = 2048;
    id v20 = v16;
    uint64_t v21 = (unint64_t *)((char *)v16 + OBJC_IVAR___AXHapticMusicServer_players);
    swift_beginAccess();
    unint64_t v22 = *v21;
    if (v22 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v23 = sub_2DDA0();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v23 = *(void *)((char *)&dword_10 + (v22 & 0xFFFFFFFFFFFFFF8));
    }
    double v75 = *(double *)&v23;
    sub_2DC80();

    _os_log_impl(&dword_0, v17, v18, "Seeking position for playing tracks: %f %{BOOL}d, players: %ld", (uint8_t *)v19, 0x1Cu);
    swift_slowDealloc();
    uint64_t v11 = v69;
  }
  else
  {

    os_log_type_t v17 = v16;
    id v20 = v16;
  }

  char v69 = *(char **)(v4 + 8);
  ((void (*)(char *, uint64_t))v69)(v13, v3);
  char v24 = *((unsigned char *)&v20->isa + OBJC_IVAR___AXHapticMusicServer_isHapticTrackPlaying);
  uint64_t v67 = v4 + 8;
  if (v24)
  {
    if (*(double *)((char *)&v20->isa + OBJC_IVAR___AXHapticMusicServer_currentPatternDuration) < a1) {
      *((unsigned char *)&v20->isa + OBJC_IVAR___AXHapticMusicServer_currentHapticPlayerStarted) = 0;
    }
    unint64_t v25 = *(unint64_t *)((char *)&v20->isa + OBJC_IVAR___AXHapticMusicServer_currentSpatialOffsets);
    uint64_t v66 = v3;
    if (v25)
    {
      if (v25 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v26 = sub_2DDA0();
      }
      else
      {
        uint64_t v26 = *(void *)((char *)&dword_10 + (v25 & 0xFFFFFFFFFFFFFF8));
        swift_bridgeObjectRetain();
      }
      long long v64 = v20;
      if (v26)
      {
        if (v26 < 1) {
          goto LABEL_53;
        }
        uint64_t v28 = 0;
        uint64_t v29 = &selRef_auxiliarySession;
        *(void *)&long long v27 = 134217984;
        long long v65 = v27;
        do
        {
          if ((v25 & 0xC000000000000001) != 0) {
            id v30 = (id)sub_2DD30();
          }
          else {
            id v30 = *(id *)(v25 + 8 * v28 + 32);
          }
          uint64_t v31 = v30;
          [v30 timestamp];
          if (v32 >= a1)
          {
          }
          else
          {
            [v31 v29[19]];
            double v34 = v33;
            v70(v68, v72, v3);
            uint64_t v35 = v31;
            unsigned int v36 = sub_2D8D0();
            id v37 = v29;
            os_log_type_t v38 = sub_2DB50();
            if (os_log_type_enabled(v36, v38))
            {
              uint64_t v39 = swift_slowAlloc();
              *(_DWORD *)uint64_t v39 = v65;
              [v35 v37[19]];
              *(void *)(v39 + 4) = v40;

              _os_log_impl(&dword_0, v36, v38, "Applying spatial offset %f", (uint8_t *)v39, 0xCu);
              uint64_t v3 = v66;
              swift_slowDealloc();
            }
            else
            {

              unsigned int v36 = v35;
            }
            a1 = a1 + v34;

            ((void (*)(char *, uint64_t))v69)(v68, v3);
            uint64_t v29 = &selRef_auxiliarySession;
          }
          ++v28;
        }
        while (v26 != v28);
      }
      swift_bridgeObjectRelease();
      id v20 = v64;
    }
    uint64_t v45 = (char *)v20 + OBJC_IVAR___AXHapticMusicServer_players;
    swift_beginAccess();
    unint64_t v46 = *(void *)v45;
    if (*(void *)v45 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v47 = sub_2DDA0();
      if (v47) {
        goto LABEL_33;
      }
    }
    else
    {
      uint64_t v47 = *(void *)((char *)&dword_10 + (v46 & 0xFFFFFFFFFFFFFF8));
      swift_bridgeObjectRetain();
      if (v47)
      {
LABEL_33:
        if (v47 >= 1)
        {
          uint64_t v49 = 0;
          unint64_t v50 = v46 & 0xC000000000000001;
          *(void *)&long long v48 = 138412290;
          long long v65 = v48;
          char v68 = (char *)v46;
          do
          {
            if (v50)
            {
              uint64_t v52 = (void *)sub_2DD30();
            }
            else
            {
              uint64_t v52 = *(void **)(v46 + 8 * v49 + 32);
              swift_unknownObjectRetain();
            }
            id v74 = 0;
            unsigned int v53 = [v52 seekToOffset:&v74 error:a1];
            id v54 = v74;
            if (v53)
            {
              id v74 = 0;
              id v55 = v54;
              if ([v52 resumeAtTime:&v74 error:0.0])
              {
                id v51 = v74;
              }
              else
              {
                id v56 = v74;
                sub_2D810();

                swift_willThrow();
                swift_errorRelease();
              }
              swift_unknownObjectRelease();
            }
            else
            {
              id v57 = v74;
              sub_2D810();

              swift_willThrow();
              v70(v73, v72, v3);
              swift_errorRetain();
              swift_errorRetain();
              uint64_t v58 = sub_2D8D0();
              os_log_type_t v59 = sub_2DB70();
              if (os_log_type_enabled(v58, v59))
              {
                uint64_t v60 = swift_slowAlloc();
                id v61 = (void *)swift_slowAlloc();
                *(_DWORD *)uint64_t v60 = v65;
                swift_errorRetain();
                uint64_t v62 = _swift_stdlib_bridgeErrorToNSError();
                *(void *)(v60 + 4) = v62;
                *id v61 = v62;
                swift_errorRelease();
                swift_errorRelease();
                _os_log_impl(&dword_0, v58, v59, "Error seeking offset: %@", (uint8_t *)v60, 0xCu);
                sub_4BA0(&qword_39500);
                swift_arrayDestroy();
                swift_slowDealloc();
                uint64_t v3 = v66;
                swift_slowDealloc();
                swift_unknownObjectRelease();

                swift_errorRelease();
              }
              else
              {
                swift_unknownObjectRelease();
                swift_errorRelease();
                swift_errorRelease();
                swift_errorRelease();
              }
              ((void (*)(char *, uint64_t))v69)(v73, v3);
              unint64_t v46 = (unint64_t)v68;
            }
            ++v49;
          }
          while (v47 != v49);
          return swift_bridgeObjectRelease();
        }
        __break(1u);
LABEL_53:
        __break(1u);
      }
    }
    return swift_bridgeObjectRelease();
  }
  v70(v11, v72, v3);
  id v41 = sub_2D8D0();
  os_log_type_t v42 = sub_2DB50();
  if (os_log_type_enabled(v41, v42))
  {
    os_log_type_t v43 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)os_log_type_t v43 = 0;
    _os_log_impl(&dword_0, v41, v42, " -- Haptic not playing - not starting", v43, 2u);
    swift_slowDealloc();
  }

  return ((uint64_t (*)(char *, uint64_t))v69)(v11, v3);
}

uint64_t sub_19EB8(double a1)
{
  uint64_t v2 = sub_2D8F0();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_39BA0 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_46B4(v2, (uint64_t)HMLog);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
  uint64_t v7 = sub_2D8D0();
  os_log_type_t v8 = sub_2DB60();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v9 = 134217984;
    double v12 = a1;
    sub_2DC80();
    _os_log_impl(&dword_0, v7, v8, "Re-requesting position: %f", v9, 0xCu);
    swift_slowDealloc();
  }

  uint64_t v10 = (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return sub_7AF0(v10);
}

uint64_t sub_1A0A4(uint64_t a1, char *a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v32 = a4;
  double v33 = a5;
  uint64_t v8 = sub_2D930();
  uint64_t v35 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)&v31 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_2D960();
  uint64_t v34 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v13 = (char *)&v31 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_2D8F0();
  uint64_t v15 = *(void *)(v14 - 8);
  __chkstk_darwin(v14);
  os_log_type_t v17 = (char *)&v31 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    if (qword_39BA0 != -1) {
      swift_once();
    }
    uint64_t v18 = sub_46B4(v14, (uint64_t)HMLog);
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))(v17, v18, v14);
    swift_errorRetain();
    swift_errorRetain();
    uint64_t v19 = sub_2D8D0();
    os_log_type_t v20 = sub_2DB70();
    if (os_log_type_enabled(v19, v20))
    {
      uint64_t v21 = (uint8_t *)swift_slowAlloc();
      uint64_t v35 = swift_slowAlloc();
      *(_DWORD *)uint64_t v21 = 138412290;
      swift_errorRetain();
      uint64_t v22 = _swift_stdlib_bridgeErrorToNSError();
      unsigned int v36 = (void *)v22;
      sub_2DC80();
      *(void *)uint64_t v35 = v22;
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl(&dword_0, v19, v20, "Could not start engine: %@", v21, 0xCu);
      sub_4BA0(&qword_39500);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      swift_errorRelease();
      swift_errorRelease();
    }

    return (*(uint64_t (**)(char *, uint64_t))(v15 + 8))(v17, v14);
  }
  else
  {
    uint64_t v23 = *(void **)&a2[OBJC_IVAR___AXHapticMusicServer_queue];
    char v24 = (void *)swift_allocObject();
    v24[2] = a2;
    v24[3] = a3;
    unint64_t v25 = v33;
    v24[4] = v32;
    v24[5] = v25;
    aBlock[4] = sub_2BE34;
    aBlock[5] = v24;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_68F8;
    aBlock[3] = &unk_35A10;
    uint64_t v26 = _Block_copy(aBlock);
    id v27 = v23;
    uint64_t v28 = a2;
    swift_retain();
    id v29 = v25;
    sub_2D940();
    unsigned int v36 = &_swiftEmptyArrayStorage;
    sub_27694(&qword_394A8, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
    sub_4BA0(&qword_394B0);
    sub_281F8(&qword_394B8, &qword_394B0);
    sub_2DCB0();
    sub_2DBF0();
    _Block_release(v26);

    (*(void (**)(char *, uint64_t))(v35 + 8))(v10, v8);
    (*(void (**)(char *, uint64_t))(v34 + 8))(v13, v11);
    return swift_release();
  }
}

void sub_1A5D0(uint64_t a1, void (*a2)(uint64_t, uint64_t), uint64_t a3, uint64_t a4)
{
  uint64_t v7 = sub_2D8F0();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(unsigned char *)(a1 + OBJC_IVAR___AXHapticMusicServer_engineIsRunning) = 1;
  if (qword_39BA0 != -1) {
    swift_once();
  }
  uint64_t v11 = sub_46B4(v7, (uint64_t)HMLog);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, v11, v7);
  uint64_t v12 = sub_2D8D0();
  os_log_type_t v13 = sub_2DB50();
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v14 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v14 = 0;
    _os_log_impl(&dword_0, v12, v13, "Started engine", v14, 2u);
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  *(unsigned char *)(a1 + OBJC_IVAR___AXHapticMusicServer_isHapticTrackPlaying) = 1;
  a2(a4, 1);
  sub_E8F8();
  *(CFAbsoluteTime *)(a1 + OBJC_IVAR___AXHapticMusicServer_elapsedHapticPlayingTimeForTrack) = CFAbsoluteTimeGetCurrent();
}

void sub_1A7E0(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void (**)(void *, void *))(a1 + 32);
  swift_retain();
  id v7 = a2;
  id v6 = a3;
  v5(a2, a3);
  swift_release();
}

void sub_1A86C(uint64_t a1)
{
  uint64_t v2 = sub_2D8B0();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  long long v65 = ((char *)&v59 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  __chkstk_darwin(v4);
  long long v64 = ((char *)&v59 - v6);
  uint64_t v7 = sub_2D8F0();
  uint64_t v66 = *(void *)(v7 - 8);
  uint64_t v67 = v7;
  uint64_t v8 = __chkstk_darwin(v7);
  uint64_t v62 = (char *)&v59 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v59 - v10;
  uint64_t v12 = sub_4BA0(&qword_39878);
  uint64_t v13 = __chkstk_darwin(v12 - 8);
  uint64_t v15 = (char *)&v59 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  os_log_type_t v17 = (char *)&v59 - v16;
  uint64_t v18 = self;
  id v19 = [v18 sharedInstance];
  uint64_t v20 = OBJC_IVAR___AXHapticMusicServer_totalActivePlayingTime;
  double v21 = *(double *)(a1 + OBJC_IVAR___AXHapticMusicServer_totalActivePlayingTime);
  [v19 hapticMusicUsagePerDay];
  [v19 setHapticMusicUsagePerDay:v21 + v22];

  *(void *)(a1 + v20) = 0;
  id v23 = [objc_allocWithZone((Class)NSDate) init];
  id v63 = v18;
  id v24 = [v18 sharedInstance];
  id v25 = [v24 hapticMusicUsageStartDate];

  if (v25)
  {
    sub_2D890();

    (*(void (**)(char *, void, uint64_t, uint64_t))(v3 + 56))(v15, 0, 1, v2);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v3 + 56))(v15, 1, 1, v2);
  }
  sub_28420((uint64_t)v15, (uint64_t)v17, &qword_39878);
  uint64_t v26 = &AXHapticMusicServer__prots;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v3 + 48))(v17, 1, v2) == 1)
  {
    sub_2D07C((uint64_t)v17, &qword_39878);
    id v27 = [v23 dateByAddingTimeInterval:-86401.0];

    uint64_t v28 = v64;
  }
  else
  {

    Class isa = sub_2D870().super.isa;
    (*(void (**)(char *, uint64_t))(v3 + 8))(v17, v2);
    uint64_t v30 = qword_39BA0;
    uint64_t v31 = isa;
    if (v30 != -1) {
      swift_once();
    }
    uint64_t v32 = v67;
    uint64_t v33 = sub_46B4(v67, (uint64_t)HMLog);
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v66 + 16))(v11, v33, v32);
    id v27 = v31;
    uint64_t v34 = sub_2D8D0();
    os_log_type_t v35 = sub_2DB60();
    if (os_log_type_enabled(v34, v35))
    {
      uint64_t v36 = swift_slowAlloc();
      uint64_t v61 = v3;
      id v37 = (uint8_t *)v36;
      uint64_t v60 = (void *)swift_slowAlloc();
      *(_DWORD *)id v37 = 138412290;
      aBlock[0] = v27;
      os_log_type_t v38 = v27;
      uint64_t v26 = &AXHapticMusicServer__prots;
      sub_2DC80();
      *uint64_t v60 = v27;

      _os_log_impl(&dword_0, v34, v35, "Last time we stored data %@", v37, 0xCu);
      sub_4BA0(&qword_39500);
      swift_arrayDestroy();
      swift_slowDealloc();
      uint64_t v3 = v61;
      swift_slowDealloc();
    }
    else
    {

      uint64_t v34 = v27;
    }
    uint64_t v28 = v64;

    (*(void (**)(char *, uint64_t))(v66 + 8))(v11, v67);
  }
  id v39 = objc_msgSend(v27, (SEL)v26[505].count, 86400.0);
  sub_2D890();

  uint64_t v40 = v65;
  sub_2D8A0();
  LOBYTE(v39) = sub_2D880();
  id v41 = *(void (**)(NSObject *, uint64_t))(v3 + 8);
  v41(v40, v2);
  if (v39)
  {
    id v42 = [v63 sharedInstance];
    [v42 hapticMusicUsagePerDay];
    double v44 = v43;

    if (v44 <= 0.0)
    {
      uint64_t v45 = 0;
    }
    else if (v44 >= 30.0)
    {
      if (v44 >= 60.0)
      {
        if (v44 >= 120.0)
        {
          if (v44 >= 180.0)
          {
            if (v44 >= 360.0)
            {
              if (v44 >= 600.0)
              {
                if (v44 >= 1200.0)
                {
                  if (v44 >= 1800.0)
                  {
                    if (v44 >= 3600.0)
                    {
                      if (v44 >= 7200.0)
                      {
                        if (v44 >= 10800.0)
                        {
                          if (v44 >= 14400.0)
                          {
                            if (v44 >= 18000.0)
                            {
                              if (v44 >= 21600.0)
                              {
                                if (v44 >= 43200.0)
                                {
                                  if (v44 >= 64800.0)
                                  {
                                    if (v44 >= 86400.0) {
                                      uint64_t v45 = 0;
                                    }
                                    else {
                                      uint64_t v45 = 86400;
                                    }
                                  }
                                  else
                                  {
                                    uint64_t v45 = 64800;
                                  }
                                }
                                else
                                {
                                  uint64_t v45 = 43200;
                                }
                              }
                              else
                              {
                                uint64_t v45 = 21600;
                              }
                            }
                            else
                            {
                              uint64_t v45 = 18000;
                            }
                            uint64_t v28 = v64;
                            uint64_t v40 = v65;
                          }
                          else
                          {
                            uint64_t v45 = 14400;
                          }
                        }
                        else
                        {
                          uint64_t v45 = 10800;
                        }
                      }
                      else
                      {
                        uint64_t v45 = 7200;
                      }
                    }
                    else
                    {
                      uint64_t v45 = 3600;
                    }
                  }
                  else
                  {
                    uint64_t v45 = 1800;
                  }
                }
                else
                {
                  uint64_t v45 = 1200;
                }
              }
              else
              {
                uint64_t v45 = 600;
              }
            }
            else
            {
              uint64_t v45 = 360;
            }
          }
          else
          {
            uint64_t v45 = 180;
          }
        }
        else
        {
          uint64_t v45 = 120;
        }
      }
      else
      {
        uint64_t v45 = 60;
      }
    }
    else
    {
      uint64_t v45 = 30;
    }
    if (qword_39BA0 != -1) {
      swift_once();
    }
    uint64_t v46 = v67;
    uint64_t v47 = sub_46B4(v67, (uint64_t)HMLog);
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v66 + 16))(v62, v47, v46);
    long long v48 = sub_2D8D0();
    os_log_type_t v49 = sub_2DB60();
    if (os_log_type_enabled(v48, v49))
    {
      uint64_t v50 = swift_slowAlloc();
      *(_DWORD *)uint64_t v50 = 134218240;
      *(double *)long long aBlock = v44;
      long long v65 = v27;
      sub_2DC80();
      *(_WORD *)(v50 + 12) = 2048;
      aBlock[0] = v45;
      id v27 = v65;
      sub_2DC80();
      _os_log_impl(&dword_0, v48, v49, "Bucketing value %f -> %ld", (uint8_t *)v50, 0x16u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v66 + 8))(v62, v67);
    NSString v51 = sub_2DA00();
    uint64_t v52 = swift_allocObject();
    *(void *)(v52 + 16) = v45;
    aBlock[4] = sub_28494;
    aBlock[5] = v52;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1B370;
    aBlock[3] = &unk_35498;
    unsigned int v53 = _Block_copy(aBlock);
    swift_release();
    AnalyticsSendEventLazy();
    _Block_release(v53);

    id v54 = v63;
    id v55 = [v63 sharedInstance];
    id v56 = [self now];
    sub_2D890();

    Class v57 = sub_2D870().super.isa;
    v41(v40, v2);
    [v55 setHapticMusicUsageStartDate:v57];

    id v58 = [v54 sharedInstance];
    [v58 setHapticMusicUsagePerDay:0.0];

    v41(v28, v2);
  }
  else
  {
    v41(v28, v2);
  }
}

Class sub_1B370(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  uint64_t v3 = v1(v2);
  swift_release();
  if (v3)
  {
    sub_2CAD4(0, &qword_39880);
    v4.super.Class isa = sub_2D9D0().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v4.super.Class isa = 0;
  }

  return v4.super.isa;
}

void sub_1B40C()
{
  uint64_t v2 = v0;
  uint64_t v3 = sub_2D8F0();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)v34 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v7 = objc_allocWithZone((Class)NSData);
  sub_2D820(v8);
  uint64_t v10 = v9;
  id v11 = [v7 initWithContentsOfURL:v9];

  if (v11)
  {
    long long v39 = xmmword_2E970;
    sub_2D860();

    unint64_t v12 = *((void *)&v39 + 1);
    if (*((void *)&v39 + 1) >> 60 != 15)
    {
      uint64_t v13 = v39;
      uint64_t v14 = self;
      Class isa = sub_2D850().super.isa;
      *(void *)&long long v39 = 0;
      id v16 = [v14 JSONObjectWithData:isa options:0 error:&v39];

      if (v16)
      {
        id v17 = (id)v39;
        sub_2DCA0();
        swift_unknownObjectRelease();
        sub_4BA0(&qword_398D8);
        if (swift_dynamicCast())
        {
          id v18 = objc_allocWithZone((Class)CHHapticPattern);
          id v19 = sub_2172C();
          if (!v1)
          {
            uint64_t v20 = v19;
            if (qword_39BA0 != -1) {
              swift_once();
            }
            uint64_t v21 = sub_46B4(v3, (uint64_t)HMLog);
            swift_beginAccess();
            (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v21, v3);
            id v37 = v20;
            double v22 = sub_2D8D0();
            os_log_type_t v23 = sub_2DB50();
            int v36 = v23;
            if (os_log_type_enabled(v22, v23))
            {
              id v24 = (uint8_t *)swift_slowAlloc();
              *(_DWORD *)id v24 = 134217984;
              v34[1] = v24 + 4;
              os_log_type_t v35 = v24;
              [v37 duration];
              v38[0] = v25;
              sub_2DC80();

              _os_log_impl(&dword_0, v22, (os_log_type_t)v36, "Pattern duration: %f", v35, 0xCu);
              swift_slowDealloc();
            }
            else
            {

              double v22 = v37;
            }

            (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
            [v37 duration];
            *(void *)(v2 + OBJC_IVAR___AXHapticMusicServer_currentPatternDuration) = v27;
            uint64_t v28 = *(void **)(v2 + OBJC_IVAR___AXHapticMusicServer_engine);
            if (v28)
            {
              v38[0] = 0;
              id v29 = [v28 createAdvancedPlayerWithPattern:v37 error:v38];
              id v30 = v38[0];
              if (v29)
              {
                uint64_t v31 = (void *)(v2 + OBJC_IVAR___AXHapticMusicServer_players);
                swift_beginAccess();
                id v32 = v30;
                swift_unknownObjectRetain();
                sub_2DA90();
                if (*(void *)((char *)&dword_10 + (*v31 & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18
                                                                                                + (*v31 & 0xFFFFFFFFFFFFFF8)) >> 1)
                  sub_2DAE0();
                sub_2DAF0();
                sub_2DAD0();
                swift_endAccess();
                sub_2C4CC(v13, v12);
                swift_unknownObjectRelease();
                goto LABEL_21;
              }
              id v33 = v38[0];
              sub_2D810();

              swift_willThrow();
            }
            sub_2C4CC(v13, v12);
LABEL_21:

            return;
          }
        }
      }
      else
      {
        id v26 = (id)v39;
        sub_2D810();

        swift_willThrow();
      }
      sub_2C4CC(v13, v12);
    }
  }
}

void sub_1B8E0(unint64_t a1, void *a2, void (*a3)(BOOL), uint64_t a4)
{
  p_Class isa = v4;
  uint64_t v185 = a4;
  v186 = a3;
  v177 = a2;
  uint64_t v182 = sub_2D840();
  uint64_t v181 = *(void *)(v182 - 8);
  uint64_t v7 = __chkstk_darwin(v182);
  v179 = (char *)&v171 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  v176 = (char *)&v171 - v9;
  uint64_t v10 = sub_2D8F0();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = __chkstk_darwin(v10);
  uint64_t v14 = (uint64_t)&v171 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __chkstk_darwin(v12);
  v172 = (id *)((char *)&v171 - v16);
  uint64_t v17 = __chkstk_darwin(v15);
  id v19 = (char *)&v171 - v18;
  uint64_t v20 = __chkstk_darwin(v17);
  v174 = (id *)((char *)&v171 - v21);
  uint64_t v22 = __chkstk_darwin(v20);
  v178 = (id *)((char *)&v171 - v23);
  uint64_t v24 = __chkstk_darwin(v22);
  v173 = (id *)((char *)&v171 - v25);
  uint64_t v26 = __chkstk_darwin(v24);
  v175 = (id *)((char *)&v171 - v27);
  __chkstk_darwin(v26);
  id v29 = (id *)((char *)&v171 - v28);
  if (qword_39BA0 != -1) {
    goto LABEL_74;
  }
LABEL_2:
  uint64_t v30 = sub_46B4(v10, (uint64_t)HMLog);
  swift_beginAccess();
  uint64_t v31 = *(void (**)(id *, uint8_t *, uint64_t))(v11 + 16);
  v190 = (uint8_t *)v30;
  v189 = (v11 + 16);
  v188 = v31;
  v31(v29, (uint8_t *)v30, v10);
  swift_bridgeObjectRetain_n();
  uint64_t v32 = sub_2D8D0();
  os_log_type_t v33 = sub_2DB50();
  BOOL v34 = os_log_type_enabled((os_log_t)v32, v33);
  v180 = p_isa;
  os_log_t v192 = (os_log_t)v11;
  v183 = v19;
  os_log_t v194 = (os_log_t)a1;
  uint64_t v191 = v10;
  uint64_t v171 = v14;
  if (v34)
  {
    os_log_type_t v35 = (uint8_t *)swift_slowAlloc();
    *(void *)&long long aBlock = swift_slowAlloc();
    *(_DWORD *)os_log_type_t v35 = 136315138;
    id v19 = (char *)(v35 + 4);
    sub_2CAD4(0, &qword_398E8);
    swift_bridgeObjectRetain();
    uint64_t v36 = sub_2DAC0();
    unint64_t v38 = v37;
    swift_bridgeObjectRelease();
    uint64_t v39 = v36;
    a1 = (unint64_t)v194;
    *(void *)&long long v197 = sub_22B88(v39, v38, (uint64_t *)&aBlock);
    sub_2DC80();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_0, (os_log_t)v32, v33, "Queued Haptic Tracks: %s", v35, 0xCu);
    swift_arrayDestroy();
    uint64_t v10 = v191;
    swift_slowDealloc();
    swift_slowDealloc();

    Class isa = v192[1].isa;
  }
  else
  {
    swift_bridgeObjectRelease_n();

    Class isa = *(Class *)(v11 + 8);
  }
  ((void (*)(id *, uint64_t))isa)(v29, v10);
  p_Class isa = (id *)(a1 >> 62);
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v80 = sub_2DDA0();
    swift_bridgeObjectRelease();
    if (v80 < 1)
    {
LABEL_76:
      v186(0);
      return;
    }
  }
  else if (*(uint64_t *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8)) < 1)
  {
    goto LABEL_76;
  }
  v204 = 0;
  uint64_t v14 = (uint64_t)[self sharedInstance];
  id v40 = [(id)v14 hapticMusicAlgorithmSelection];

  if (v40)
  {
    long long aBlock = 0uLL;
    sub_2DA20();

    os_log_t v42 = (os_log_t)*((void *)&aBlock + 1);
    uint64_t v41 = aBlock;
  }
  else
  {
    uint64_t v41 = 0;
    os_log_t v42 = 0;
  }
  uint64_t v193 = v41;
  if (p_isa)
  {
    swift_bridgeObjectRetain();
    double v43 = (id *)sub_2DDA0();
  }
  else
  {
    double v43 = *(id **)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8));
    swift_bridgeObjectRetain();
  }
  v195 = v43;
  if (!v43)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_49;
  }
  uint64_t v10 = a1 & 0xC000000000000001;
  v184 = (char *)SHHapticPatternAlgorithmDefault;
  uint64_t v11 = 4;
  uint64_t v32 = 233472;
  while (1)
  {
    if (v10) {
      double v44 = (char *)sub_2DD30();
    }
    else {
      double v44 = (char *)*(id *)(a1 + 8 * v11);
    }
    id v29 = (id *)v44;
    p_Class isa = (id *)(v11 - 3);
    if (__OFADD__(v11 - 4, 1))
    {
      __break(1u);
LABEL_74:
      swift_once();
      goto LABEL_2;
    }
    id v19 = (char *)[v44 *(SEL *)(v32 + 272)];
    uint64_t v45 = sub_2DA30();
    uint64_t v47 = v46;

    if (!v42)
    {
      swift_bridgeObjectRelease();
      id v49 = [v29 *(SEL *)(v32 + 272)];
      uint64_t v50 = sub_2DA30();
      id v19 = v51;
      if (v50 == sub_2DA30() && v19 == v52)
      {
        swift_bridgeObjectRelease_n();

        a1 = (unint64_t)v194;
LABEL_31:
        swift_bridgeObjectRelease();
        v204 = v29;
        unsigned int v53 = v29;
        uint64_t v32 = (uint64_t)v173;
        uint64_t v10 = v191;
        v188(v173, v190, v191);
        id v54 = sub_2D8D0();
        os_log_type_t v55 = sub_2DB50();
        if (os_log_type_enabled(v54, v55))
        {
          id v56 = (uint8_t *)swift_slowAlloc();
          Class v57 = (void *)swift_slowAlloc();
          *(_DWORD *)id v56 = 138412290;
          os_log_t v42 = (os_log_t)(v56 + 4);
          swift_beginAccess();
          id v58 = v204;
          if (v204)
          {
            *(void *)&long long aBlock = v204;
            id v59 = v204;
            a1 = (unint64_t)v194;
          }
          else
          {
            *(void *)&long long aBlock = 0;
          }
          sub_2DC80();
          *Class v57 = v58;
          _os_log_impl(&dword_0, v54, v55, "Selected default algorithm track %@", v56, 0xCu);
          sub_4BA0(&qword_39500);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();
          p_Class isa = (id *)v53;
          uint64_t v32 = (uint64_t)v173;
        }
        else
        {
          p_Class isa = (id *)&v54->isa;
          id v54 = v53;
        }

        ((void (*)(uint64_t, uint64_t))isa)(v32, v10);
        goto LABEL_48;
      }
      uint64_t v14 = sub_2DE10();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();

      a1 = (unint64_t)v194;
      if (v14) {
        goto LABEL_31;
      }
      goto LABEL_16;
    }
    if (v45 == v193 && v42 == v47) {
      break;
    }
    uint64_t v14 = sub_2DE10();
    swift_bridgeObjectRelease();
    if (v14) {
      goto LABEL_37;
    }
LABEL_16:

    ++v11;
    double v43 = v195;
    uint64_t v32 = (uint64_t)&selRef_auxiliarySession;
    if (p_isa == v195)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v10 = v191;
      goto LABEL_49;
    }
  }
  swift_bridgeObjectRelease();
LABEL_37:
  swift_bridgeObjectRelease();
  v204 = v29;
  uint64_t v60 = v29;
  p_Class isa = v175;
  uint64_t v10 = v191;
  v188(v175, v190, v191);
  swift_bridgeObjectRetain();
  uint64_t v61 = sub_2D8D0();
  os_log_type_t v62 = sub_2DB50();
  if (os_log_type_enabled(v61, v62))
  {
    v184 = v60;
    uint64_t v63 = swift_slowAlloc();
    long long v64 = (void *)swift_slowAlloc();
    v173 = (id *)swift_slowAlloc();
    *(void *)&long long aBlock = v173;
    *(_DWORD *)uint64_t v63 = 136315394;
    swift_bridgeObjectRetain();
    *(void *)&long long v197 = sub_22B88(v193, (unint64_t)v42, (uint64_t *)&aBlock);
    uint64_t v32 = (uint64_t)&v197 + 8;
    sub_2DC80();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v63 + 12) = 2112;
    swift_beginAccess();
    id v65 = v204;
    if (v204)
    {
      *(void *)&long long v197 = v204;
      id v66 = v204;
    }
    else
    {
      *(void *)&long long v197 = 0;
    }
    sub_2DC80();
    void *v64 = v65;
    _os_log_impl(&dword_0, v61, v62, "Selected track for %s %@", (uint8_t *)v63, 0x16u);
    sub_4BA0(&qword_39500);
    swift_arrayDestroy();
    swift_slowDealloc();
    p_Class isa = v173;
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    uint64_t v67 = v175;
  }
  else
  {

    swift_bridgeObjectRelease_n();
    uint64_t v67 = p_isa;
  }
  ((void (*)(id *, uint64_t))isa)(v67, v10);
  a1 = (unint64_t)v194;
LABEL_48:
  double v43 = v195;
LABEL_49:
  swift_beginAccess();
  if (v204)
  {
LABEL_97:
    long long v95 = v183;
    v188((id *)v183, v190, v10);
    id v96 = v204;
    id v97 = v204;
    uint64_t v98 = sub_2D8D0();
    os_log_type_t v99 = sub_2DB80();
    if (os_log_type_enabled(v98, v99))
    {
      uint64_t v100 = (uint8_t *)swift_slowAlloc();
      *(void *)&long long aBlock = swift_slowAlloc();
      *(_DWORD *)uint64_t v100 = 136315138;
      if (!v96) {
        goto LABEL_153;
      }
      id v101 = [v97 fileURL];
      id v102 = v176;
      sub_2D830();

      sub_27694(&qword_39908, (void (*)(uint64_t))&type metadata accessor for URL);
      uint64_t v103 = v182;
      uint64_t v104 = sub_2DE00();
      unint64_t v106 = v105;
      (*(void (**)(char *, uint64_t))(v181 + 8))(v102, v103);
      *(void *)&long long v197 = sub_22B88(v104, v106, (uint64_t *)&aBlock);
      sub_2DC80();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_0, v98, v99, "Found haptic track at: %s", v100, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      uint64_t v107 = v183;
      uint64_t v10 = v191;
    }
    else
    {

      uint64_t v107 = v95;
    }
    ((void (*)(char *, uint64_t))isa)(v107, v10);
    if (v204)
    {
      id v108 = [v204 fileURL];
      uint64_t v109 = v179;
      sub_2D830();

      id v110 = objc_allocWithZone((Class)NSData);
      sub_2D820(v111);
      uint64_t v113 = v112;
      id v114 = [v110 initWithContentsOfURL:v112];

      (*(void (**)(char *, uint64_t))(v181 + 8))(v109, v182);
      unint64_t v86 = &selRef_auxiliarySession;
      a1 = (unint64_t)v180;
      if (!v114) {
        goto LABEL_115;
      }
      long long aBlock = xmmword_2E970;
      sub_2D860();

      p_Class isa = (id *)*((void *)&aBlock + 1);
      if (*((void *)&aBlock + 1) >> 60 == 15) {
        goto LABEL_115;
      }
      uint64_t v32 = aBlock;
      long long v115 = self;
      Class v116 = sub_2D850().super.isa;
      *(void *)&long long aBlock = 0;
      id v117 = [v115 JSONObjectWithData:v116 options:0 error:&aBlock];

      if (v117)
      {
        id v118 = (id)aBlock;
        sub_2DCA0();
        swift_unknownObjectRelease();
        sub_4BA0(&qword_39900);
        if ((swift_dynamicCast() & 1) == 0)
        {
          sub_2C4CC(v32, (unint64_t)p_isa);
          goto LABEL_115;
        }
        uint64_t v119 = v10;
        uint64_t v120 = v197;
        if (!sub_1D710(v197)
          || (v121 = objc_allocWithZone((Class)CHHapticPattern), id v122 = sub_2172C(), (v124 = v122) == 0))
        {
          sub_2C4CC(v32, (unint64_t)p_isa);
          swift_bridgeObjectRelease();
          goto LABEL_115;
        }
        v188(v172, v190, v119);
        id v125 = v124;
        uint64_t v126 = sub_2D8D0();
        os_log_type_t v127 = sub_2DB50();
        if (os_log_type_enabled(v126, v127))
        {
          uint64_t v128 = (uint8_t *)swift_slowAlloc();
          v195 = v125;
          v129 = v128;
          *(_DWORD *)uint64_t v128 = 134217984;
          os_log_t v194 = (os_log_t)(v128 + 4);
          [v195 duration];
          *(void *)&long long aBlock = v130;
          a1 = (unint64_t)v180;
          sub_2DC80();

          _os_log_impl(&dword_0, v126, v127, "Pattern duration: %f", v129, 0xCu);
          id v125 = v195;
          swift_slowDealloc();
        }
        else
        {
        }
        os_log_t v143 = v192 + 1;
        ((void (*)(id *, uint64_t))isa)(v172, v119);
        [v125 duration];
        *(void *)(a1 + OBJC_IVAR___AXHapticMusicServer_currentPatternDuration) = v144;
        *(void *)&long long v197 = 0x617461646174654DLL;
        *((void *)&v197 + 1) = 0xE800000000000000;
        sub_2DCF0();
        if (*(void *)(v120 + 16) && (unint64_t v145 = sub_23330((uint64_t)&aBlock), (v146 & 1) != 0))
        {
          sub_27554(*(void *)(v120 + 56) + 32 * v145, (uint64_t)&v197);
        }
        else
        {
          long long v197 = 0u;
          long long v198 = 0u;
        }
        swift_bridgeObjectRelease();
        sub_27204((uint64_t)&aBlock);
        if (*((void *)&v198 + 1))
        {
          int v147 = swift_dynamicCast();
          uint64_t v148 = v196;
          if (!v147) {
            uint64_t v148 = 0;
          }
        }
        else
        {
          sub_2D07C((uint64_t)&v197, &qword_39458);
          uint64_t v148 = 0;
        }
        uint64_t v10 = v119;
        *(void *)(a1 + OBJC_IVAR___AXHapticMusicServer_currentMetadata) = v148;
        swift_bridgeObjectRelease();
        uint64_t v149 = *(void **)(a1 + OBJC_IVAR___AXHapticMusicServer_engine);
        if (!v149)
        {
          sub_2C4CC(v32, (unint64_t)p_isa);

          goto LABEL_115;
        }
        os_log_t v194 = v143;
        *(void *)&long long aBlock = 0;
        v150 = [v149 createAdvancedPlayerWithPattern:v125 error:&aBlock];
        uint64_t v151 = (void *)aBlock;
        if (v150)
        {
          char v79 = v150;
          v195 = v125;
          uint64_t v152 = swift_allocObject();
          swift_unknownObjectWeakInit();
          v202 = sub_2C5F0;
          uint64_t v203 = v152;
          *(void *)&long long aBlock = _NSConcreteStackBlock;
          *((void *)&aBlock + 1) = 1107296256;
          v200 = sub_15258;
          v201 = &unk_35D58;
          v153 = _Block_copy(&aBlock);
          id v154 = v151;
          swift_release();
          [v79 setCompletionHandler:v153];
          _Block_release(v153);
          unint64_t v155 = (void *)(a1 + OBJC_IVAR___AXHapticMusicServer_players);
          swift_beginAccess();
          swift_unknownObjectRetain();
          sub_2DA90();
          if (*(void *)((char *)&dword_10 + (*v155 & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18
                                                                                           + (*v155 & 0xFFFFFFFFFFFFFF8)) >> 1)
            goto LABEL_151;
          goto LABEL_138;
        }
        id v170 = (id)aBlock;
        sub_2D810();

        swift_willThrow();
        sub_2C4CC(v32, (unint64_t)p_isa);
      }
      else
      {
        id v123 = (id)aBlock;
        sub_2D810();

        swift_willThrow();
        sub_2C4CC(v32, (unint64_t)p_isa);
      }
      swift_errorRelease();
      goto LABEL_115;
    }
    __break(1u);
LABEL_153:
    __break(1u);
    return;
  }
  unint64_t v68 = (unint64_t)&_swiftEmptyArrayStorage;
  *(void *)&long long aBlock = &_swiftEmptyArrayStorage;
  if (!v43)
  {
LABEL_66:
    os_log_t v42 = v192;
    if ((v68 & 0x8000000000000000) != 0 || (v68 & 0x4000000000000000) != 0)
    {
      swift_bridgeObjectRetain();
      uint64_t v81 = sub_2DDA0();
      swift_release();
      if (v81) {
        goto LABEL_69;
      }
    }
    else if (*(void *)(v68 + 16))
    {
LABEL_69:
      if ((v68 & 0xC000000000000001) != 0) {
        goto LABEL_147;
      }
      if (*(void *)(v68 + 16))
      {
        unint64_t v78 = *(id *)(v68 + 32);
        goto LABEL_72;
      }
      __break(1u);
      goto LABEL_149;
    }
    swift_release();
    char v79 = 0;
    goto LABEL_79;
  }
  if ((uint64_t)v43 >= 1)
  {
    p_Class isa = (id *)(a1 & 0xC000000000000001);
    swift_bridgeObjectRetain();
    uint64_t v32 = 0;
    while (1)
    {
      if (p_isa) {
        id v69 = (id)sub_2DD30();
      }
      else {
        id v69 = *(id *)(a1 + 8 * v32 + 32);
      }
      uint64_t v70 = v69;
      id v71 = objc_msgSend(v69, "algorithm", v171);
      uint64_t v72 = sub_2DA30();
      uint64_t v74 = v73;
      if (v72 == sub_2DA30() && v74 == v75)
      {
        swift_bridgeObjectRelease_n();
      }
      else
      {
        char v77 = sub_2DE10();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();

        if ((v77 & 1) == 0)
        {

          goto LABEL_55;
        }
      }
      sub_2DD50();
      sub_2DD70();
      sub_2DD80();
      sub_2DD60();
LABEL_55:
      ++v32;
      double v43 = v195;
      a1 = (unint64_t)v194;
      if (v195 == (id *)v32)
      {
        swift_bridgeObjectRelease();
        unint64_t v68 = aBlock;
        goto LABEL_66;
      }
    }
  }
  __break(1u);
LABEL_147:
  unint64_t v78 = (_DWORD *)sub_2DD30();
LABEL_72:
  char v79 = v78;
  swift_release();
LABEL_79:
  id v82 = v204;
  v204 = v79;

  v188(v178, v190, v10);
  unint64_t v83 = sub_2D8D0();
  os_log_type_t v84 = sub_2DB50();
  if (os_log_type_enabled(v83, v84))
  {
    char v79 = (_DWORD *)swift_slowAlloc();
    uint64_t v32 = swift_slowAlloc();
    *char v79 = 138412290;
    p_Class isa = (id *)v204;
    if (v204)
    {
      *(void *)&long long aBlock = v204;
      id v85 = v204;
      a1 = (unint64_t)v194;
    }
    else
    {
      *(void *)&long long aBlock = 0;
    }
    sub_2DC80();
    *(void *)uint64_t v32 = p_isa;
    _os_log_impl(&dword_0, v83, v84, "Fallback to default item %@", (uint8_t *)v79, 0xCu);
    sub_4BA0(&qword_39500);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
    double v43 = v195;
  }

  unint64_t v86 = (char **)&v42[1];
  ((void (*)(id *, uint64_t))isa)(v178, v10);
  if (v204) {
    goto LABEL_97;
  }
  if (!v43)
  {
    id v88 = 0;
    id v87 = 0;
LABEL_90:
    v204 = v87;

    v188(v174, v190, v10);
    unint64_t v89 = v87;
    unint64_t v90 = sub_2D8D0();
    os_log_type_t v91 = sub_2DB50();
    if (os_log_type_enabled(v90, v91))
    {
      id v92 = (uint8_t *)swift_slowAlloc();
      uint64_t v93 = (void *)swift_slowAlloc();
      *(_DWORD *)id v92 = 138412290;
      if (v87)
      {
        *(void *)&long long aBlock = v89;
        long long v94 = v89;
      }
      else
      {
        *(void *)&long long aBlock = 0;
      }
      sub_2DC80();
      void *v93 = v87;

      _os_log_impl(&dword_0, v90, v91, "Fallback to first item %@", v92, 0xCu);
      sub_4BA0(&qword_39500);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
      uint64_t v10 = v191;
    }
    else
    {

      unint64_t v90 = v89;
    }

    ((void (*)(id *, uint64_t))isa)(v174, v10);
    goto LABEL_97;
  }
  if ((a1 & 0xC000000000000001) != 0)
  {
LABEL_149:
    swift_bridgeObjectRetain();
    id v87 = (id)sub_2DD30();
    swift_bridgeObjectRelease();
    id v88 = v204;
    goto LABEL_90;
  }
  if (*(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8)))
  {
    id v87 = *(id *)(a1 + 32);
    id v88 = 0;
    goto LABEL_90;
  }
  __break(1u);
LABEL_151:
  sub_2DAE0();
LABEL_138:
  sub_2DAF0();
  sub_2DAD0();
  swift_endAccess();
  uint64_t v156 = v171;
  v188((id *)v171, v190, v10);
  swift_unknownObjectRetain_n();
  id v157 = sub_2D8D0();
  uint64_t v158 = v10;
  os_log_type_t v159 = sub_2DB50();
  if (os_log_type_enabled(v157, v159))
  {
    uint64_t v160 = swift_slowAlloc();
    os_log_t v192 = v157;
    v161 = (uint8_t *)v160;
    uint64_t v193 = swift_slowAlloc();
    *(void *)&long long aBlock = v193;
    *(_DWORD *)v161 = 136315138;
    v190 = v161 + 4;
    id v162 = [v79 description];
    uint64_t v163 = sub_2DA30();
    unint64_t v165 = v164;

    uint64_t v166 = v163;
    a1 = (unint64_t)v180;
    *(void *)&long long v197 = sub_22B88(v166, v165, (uint64_t *)&aBlock);
    sub_2DC80();
    swift_bridgeObjectRelease();
    swift_unknownObjectRelease_n();
    os_log_t v167 = v192;
    _os_log_impl(&dword_0, v192, v159, "Made player: %s", v161, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
    sub_2C4CC(v32, (unint64_t)p_isa);

    swift_unknownObjectRelease();
    uint64_t v168 = v171;
    uint64_t v169 = v191;
  }
  else
  {
    sub_2C4CC(v32, (unint64_t)p_isa);

    swift_unknownObjectRelease_n();
    uint64_t v168 = v156;
    uint64_t v169 = v158;
  }
  ((void (*)(uint64_t, uint64_t))isa)(v168, v169);
LABEL_115:
  uint64_t v131 = &v86[169][a1];
  swift_beginAccess();
  if (*(void *)v131 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v132 = sub_2DDA0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v132 = *(void *)((char *)&dword_10 + (*(void *)v131 & 0xFFFFFFFFFFFFFF8));
  }
  v186(v132 > 0);
  unint64_t v133 = *(void *)v131;
  if (v133 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v134 = sub_2DDA0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v134 = *(void *)((char *)&dword_10 + (v133 & 0xFFFFFFFFFFFFFF8));
  }
  if (v134 < 1)
  {
    *(void *)(a1 + OBJC_IVAR___AXHapticMusicServer_currentSpatialOffsets) = 0;
    swift_bridgeObjectRelease();
  }
  else
  {
    *(void *)(a1 + OBJC_IVAR___AXHapticMusicServer_currentSpatialOffsets) = v177;
    swift_bridgeObjectRelease();
    if (*(unsigned char *)(a1 + OBJC_IVAR___AXHapticMusicServer_fetchingHapticTracks))
    {
      id v135 = v204;
      swift_bridgeObjectRetain();

      return;
    }
    id v136 = objc_allocWithZone((Class)MRNowPlayingRequest);
    swift_bridgeObjectRetain();
    id v137 = [v136 init];
    uint64_t v138 = *(void **)(a1 + OBJC_IVAR___AXHapticMusicServer_queue);
    uint64_t v139 = swift_allocObject();
    *(void *)(v139 + 16) = a1;
    v202 = (void (*)(uint64_t))sub_2D598;
    uint64_t v203 = v139;
    *(void *)&long long aBlock = _NSConcreteStackBlock;
    *((void *)&aBlock + 1) = 1107296256;
    v200 = sub_1A7E0;
    v201 = &unk_35D30;
    uint64_t v140 = _Block_copy(&aBlock);
    id v141 = v138;
    unint64_t v142 = (id *)(id)a1;
    swift_release();
    [v137 requestNowPlayingItemMetadataOnQueue:v141 completion:v140];
    _Block_release(v140);
  }
}

uint64_t sub_1D710(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    sub_4BA0(&qword_39910);
    uint64_t v1 = (unsigned char *)sub_2DDD0();
  }
  else
  {
    uint64_t v1 = &_swiftEmptyDictionarySingleton;
  }
  uint64_t v27 = a1 + 64;
  uint64_t v2 = -1 << *(unsigned char *)(a1 + 32);
  if (-v2 < 64) {
    uint64_t v3 = ~(-1 << -(char)v2);
  }
  else {
    uint64_t v3 = -1;
  }
  unint64_t v4 = v3 & *(void *)(a1 + 64);
  int64_t v26 = (unint64_t)(63 - v2) >> 6;
  uint64_t v5 = v1 + 64;
  swift_bridgeObjectRetain();
  uint64_t result = swift_retain();
  int64_t v7 = 0;
  while (1)
  {
    if (v4)
    {
      uint64_t v9 = (v4 - 1) & v4;
      unint64_t v10 = __clz(__rbit64(v4)) | (v7 << 6);
      int64_t v11 = v7;
      goto LABEL_28;
    }
    int64_t v12 = v7 + 1;
    if (__OFADD__(v7, 1))
    {
LABEL_41:
      __break(1u);
      goto LABEL_42;
    }
    if (v12 >= v26) {
      goto LABEL_39;
    }
    unint64_t v13 = *(void *)(v27 + 8 * v12);
    int64_t v11 = v7 + 1;
    if (!v13)
    {
      int64_t v11 = v7 + 2;
      if (v7 + 2 >= v26) {
        goto LABEL_39;
      }
      unint64_t v13 = *(void *)(v27 + 8 * v11);
      if (!v13)
      {
        int64_t v11 = v7 + 3;
        if (v7 + 3 >= v26) {
          goto LABEL_39;
        }
        unint64_t v13 = *(void *)(v27 + 8 * v11);
        if (!v13)
        {
          int64_t v11 = v7 + 4;
          if (v7 + 4 >= v26) {
            goto LABEL_39;
          }
          unint64_t v13 = *(void *)(v27 + 8 * v11);
          if (!v13) {
            break;
          }
        }
      }
    }
LABEL_27:
    uint64_t v9 = (v13 - 1) & v13;
    unint64_t v10 = __clz(__rbit64(v13)) + (v11 << 6);
LABEL_28:
    sub_2C5F8(*(void *)(a1 + 48) + 40 * v10, (uint64_t)v37);
    sub_27554(*(void *)(a1 + 56) + 32 * v10, (uint64_t)v38 + 8);
    v35[0] = v38[0];
    v35[1] = v38[1];
    uint64_t v36 = v39;
    v34[0] = v37[0];
    v34[1] = v37[1];
    sub_2C5F8((uint64_t)v34, (uint64_t)v31);
    type metadata accessor for Key(0);
    if (!swift_dynamicCast())
    {
      uint64_t v30 = 0;
      sub_2D07C((uint64_t)v34, &qword_39918);
      uint64_t v25 = v30;
      swift_release();

      sub_2C654();
      swift_release();
      return 0;
    }
    uint64_t v15 = v30;
    sub_27554((uint64_t)v35 + 8, (uint64_t)v31);
    sub_2D07C((uint64_t)v34, &qword_39918);
    sub_2C65C(v31, (_OWORD *)((char *)v32 + 8));
    sub_2C65C((_OWORD *)((char *)v32 + 8), v29);
    uint64_t v16 = v15;
    sub_2C65C(v29, v33);
    sub_2C65C(v33, v32);
    sub_2DA30();
    sub_2DE90();
    sub_2DA50();
    Swift::Int v17 = sub_2DEB0();
    uint64_t result = swift_bridgeObjectRelease();
    uint64_t v18 = -1 << v1[32];
    unint64_t v19 = v17 & ~v18;
    unint64_t v20 = v19 >> 6;
    if (((-1 << v19) & ~*(void *)&v5[8 * (v19 >> 6)]) != 0)
    {
      unint64_t v8 = __clz(__rbit64((-1 << v19) & ~*(void *)&v5[8 * (v19 >> 6)])) | v19 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v21 = 0;
      unint64_t v22 = (unint64_t)(63 - v18) >> 6;
      do
      {
        if (++v20 == v22 && (v21 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v23 = v20 == v22;
        if (v20 == v22) {
          unint64_t v20 = 0;
        }
        v21 |= v23;
        uint64_t v24 = *(void *)&v5[8 * v20];
      }
      while (v24 == -1);
      unint64_t v8 = __clz(__rbit64(~v24)) + (v20 << 6);
    }
    *(void *)&v5[(v8 >> 3) & 0x1FFFFFFFFFFFFFF8] |= 1 << v8;
    *(void *)(*((void *)v1 + 6) + 8 * v8) = v16;
    uint64_t result = (uint64_t)sub_2C65C(v32, (_OWORD *)(*((void *)v1 + 7) + 32 * v8));
    ++*((void *)v1 + 2);
    int64_t v7 = v11;
    unint64_t v4 = v9;
  }
  int64_t v14 = v7 + 5;
  if (v7 + 5 >= v26)
  {
LABEL_39:
    swift_release();
    sub_2C654();
    return (uint64_t)v1;
  }
  unint64_t v13 = *(void *)(v27 + 8 * v14);
  if (v13)
  {
    int64_t v11 = v7 + 5;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v11 = v14 + 1;
    if (__OFADD__(v14, 1)) {
      break;
    }
    if (v11 >= v26) {
      goto LABEL_39;
    }
    unint64_t v13 = *(void *)(v27 + 8 * v11);
    ++v14;
    if (v13) {
      goto LABEL_27;
    }
  }
LABEL_42:
  __break(1u);
  return result;
}

void sub_1DB64(uint64_t a1)
{
  uint64_t v2 = sub_2D8F0();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    swift_errorRetain();
    if (qword_39BA0 != -1) {
      swift_once();
    }
    uint64_t v6 = sub_46B4(v2, (uint64_t)HMLog);
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
    swift_errorRetain();
    swift_errorRetain();
    int64_t v7 = sub_2D8D0();
    os_log_type_t v8 = sub_2DB70();
    if (os_log_type_enabled(v7, v8))
    {
      uint64_t v9 = (uint8_t *)swift_slowAlloc();
      unint64_t v13 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v9 = 138412290;
      swift_errorRetain();
      uint64_t v10 = _swift_stdlib_bridgeErrorToNSError();
      uint64_t v14 = v10;
      sub_2DC80();
      *unint64_t v13 = v10;
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl(&dword_0, v7, v8, "Could not run player completion handler %@", v9, 0xCu);
      sub_4BA0(&qword_39500);
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
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  else
  {
    swift_beginAccess();
    uint64_t Strong = (unsigned char *)swift_unknownObjectWeakLoadStrong();
    if (Strong)
    {
      Strong[OBJC_IVAR___AXHapticMusicServer_currentHapticPlayerStarted] = 0;
    }
  }
}

void sub_1DE38()
{
  uint64_t v1 = v0;
  swift_getObjectType();
  uint64_t v2 = sub_2D8F0();
  v24[1] = *(void *)(v2 - 8);
  v24[2] = v2;
  __chkstk_darwin(v2);
  uint64_t v3 = sub_2D840();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_4BA0(&qword_398D0);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v11 = [self bundleForClass:ObjCClassFromMetadata];
  NSString v12 = sub_2DA00();
  NSString v13 = sub_2DA00();
  id v14 = [v11 URLForResource:v12 withExtension:v13];

  if (!v14)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v4 + 56))(v9, 1, 1, v3);
    goto LABEL_11;
  }
  sub_2D830();

  (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v9, v6, v3);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v4 + 56))(v9, 0, 1, v3);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48))(v9, 1, v3) == 1)
  {
LABEL_11:
    __break(1u);
    return;
  }
  sub_1B40C();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v9, v3);
  uint64_t v15 = &v1[OBJC_IVAR___AXHapticMusicServer_players];
  swift_beginAccess();
  unint64_t v16 = *(void *)v15;
  if (v16 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v23 = sub_2DDA0();
    swift_bridgeObjectRelease();
    if (v23 < 1) {
      return;
    }
  }
  else if (*(uint64_t *)((char *)&dword_10 + (v16 & 0xFFFFFFFFFFFFFF8)) < 1)
  {
    return;
  }
  if ((v1[OBJC_IVAR___AXHapticMusicServer_fetchingHapticTracks] & 1) == 0)
  {
    id v17 = [objc_allocWithZone((Class)MRNowPlayingRequest) init];
    uint64_t v18 = *(void **)&v1[OBJC_IVAR___AXHapticMusicServer_queue];
    uint64_t v19 = swift_allocObject();
    *(void *)(v19 + 16) = v1;
    aBlock[4] = sub_2D598;
    aBlock[5] = v19;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1A7E0;
    aBlock[3] = &unk_35BF0;
    unint64_t v20 = _Block_copy(aBlock);
    id v21 = v18;
    unint64_t v22 = v1;
    swift_release();
    [v17 requestNowPlayingItemMetadataOnQueue:v21 completion:v20];
    _Block_release(v20);
  }
}

uint64_t sub_1E478(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = sub_2D930();
  uint64_t v24 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  id v11 = (char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_2D960();
  uint64_t v22 = *(void *)(v12 - 8);
  uint64_t v23 = v12;
  __chkstk_darwin(v12);
  id v14 = (char *)&v22 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = *(void **)&v4[OBJC_IVAR___AXHapticMusicServer_queue];
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = a2;
  *(void *)(v16 + 24) = a3;
  *(void *)(v16 + 32) = a4;
  *(void *)(v16 + 40) = v4;
  long long v17 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v16 + 48) = *(_OWORD *)a1;
  *(_OWORD *)(v16 + 64) = v17;
  *(_OWORD *)(v16 + 80) = *(_OWORD *)(a1 + 32);
  *(void *)(v16 + 96) = *(void *)(a1 + 48);
  aBlock[4] = sub_2C5AC;
  aBlock[5] = v16;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_68F8;
  aBlock[3] = &unk_35C40;
  uint64_t v18 = _Block_copy(aBlock);
  id v19 = v15;
  swift_bridgeObjectRetain();
  swift_retain();
  unint64_t v20 = v4;
  sub_2BBDC(a1);
  sub_2D940();
  uint64_t v25 = &_swiftEmptyArrayStorage;
  sub_27694(&qword_394A8, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_4BA0(&qword_394B0);
  sub_281F8(&qword_394B8, &qword_394B0);
  sub_2DCB0();
  sub_2DBF0();
  _Block_release(v18);

  (*(void (**)(char *, uint64_t))(v24 + 8))(v11, v9);
  (*(void (**)(char *, uint64_t))(v22 + 8))(v14, v23);
  return swift_release();
}

uint64_t sub_1E784(uint64_t a1, uint64_t a2, void *a3, void (*a4)(void), uint64_t a5, uint64_t a6, Swift::UInt64 *a7)
{
  uint64_t v40 = a5;
  uint64_t v13 = sub_2D8F0();
  uint64_t v14 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  uint64_t v16 = (char *)&v35 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    swift_errorRetain();
    if (qword_39BA0 != -1) {
      swift_once();
    }
    uint64_t v17 = sub_46B4(v13, (uint64_t)HMLog);
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v16, v17, v13);
    swift_errorRetain();
    id v18 = a3;
    swift_errorRetain();
    id v19 = v18;
    uint64_t v39 = v16;
    unint64_t v20 = sub_2D8D0();
    os_log_type_t v21 = sub_2DB70();
    int v22 = v21;
    if (os_log_type_enabled(v20, v21))
    {
      uint64_t v23 = swift_slowAlloc();
      uint64_t v24 = (void *)swift_slowAlloc();
      unint64_t v37 = v24;
      *(_DWORD *)uint64_t v23 = 138412546;
      uint64_t v36 = v23 + 4;
      swift_errorRetain();
      uint64_t v25 = _swift_stdlib_bridgeErrorToNSError();
      unint64_t v38 = a4;
      uint64_t v26 = v25;
      uint64_t v41 = v25;
      sub_2DC80();
      void *v24 = v26;
      swift_errorRelease();
      swift_errorRelease();
      *(_WORD *)(v23 + 12) = 2112;
      uint64_t v41 = v19;
      uint64_t v27 = v19;
      LODWORD(v36) = v22;
      uint64_t v28 = v13;
      uint64_t v29 = v14;
      uint64_t v30 = v27;
      a4 = v38;
      sub_2DC80();
      v37[1] = v19;

      uint64_t v14 = v29;
      uint64_t v13 = v28;
      _os_log_impl(&dword_0, v20, (os_log_type_t)v36, "Error fetching track %@ %@", (uint8_t *)v23, 0x16u);
      sub_4BA0(&qword_39500);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      swift_errorRelease();
      swift_errorRelease();

      unint64_t v20 = v19;
    }

    (*(void (**)(char *, uint64_t))(v14 + 8))(v39, v13);
    a4(0);
    return swift_errorRelease();
  }
  else
  {
    sub_2BBDC((uint64_t)a7);
    swift_bridgeObjectRetain();
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v32 = (NSObject **)(a6 + OBJC_IVAR___AXHapticMusicServer_hapticCache);
    swift_beginAccess();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v41 = *v32;
    *uint64_t v32 = 0x8000000000000000;
    sub_25E84(a1, a7, isUniquelyReferenced_nonNull_native, Current);
    *uint64_t v32 = v41;
    swift_bridgeObjectRelease();
    sub_2BC28((uint64_t)a7);
    swift_endAccess();
    return sub_1E478((uint64_t)a7, a1, (uint64_t)a4, v40);
  }
}

void sub_1EB5C(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = *(void (**)(uint64_t, void *))(a1 + 32);
  sub_2CAD4(0, &qword_398F8);
  uint64_t v5 = sub_2DAB0();
  swift_retain();
  id v6 = a3;
  v4(v5, a3);
  swift_release();
  swift_bridgeObjectRelease();
}

uint64_t sub_1EC0C(unint64_t a1, void (*a2)(BOOL), id a3, char *a4, uint64_t a5)
{
  uint64_t isEscapingClosureAtFileLocation = sub_2D8F0();
  id v11 = *(NSObject **)(isEscapingClosureAtFileLocation - 8);
  uint64_t v12 = __chkstk_darwin(isEscapingClosureAtFileLocation);
  uint64_t v63 = (char *)&v55 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)&v55 - v14;
  if (qword_39BA0 != -1) {
    goto LABEL_21;
  }
  while (1)
  {
    uint64_t v16 = sub_46B4(isEscapingClosureAtFileLocation, (uint64_t)HMLog);
    swift_beginAccess();
    Class isa = (void (*)(char *, char *, uint64_t))v11[2].isa;
    id v59 = v11 + 2;
    uint64_t v60 = (char *)v16;
    id v58 = isa;
    isa(v15, (char *)v16, isEscapingClosureAtFileLocation);
    swift_bridgeObjectRetain_n();
    id v18 = sub_2D8D0();
    os_log_type_t v19 = sub_2DB50();
    uint64_t v20 = v19;
    BOOL v21 = os_log_type_enabled(v18, v19);
    long long v64 = v11;
    uint64_t v65 = isEscapingClosureAtFileLocation;
    if (v21)
    {
      int v22 = (uint8_t *)swift_slowAlloc();
      id v61 = (id)swift_slowAlloc();
      aBlock[0] = v61;
      Class v57 = a2;
      *(_DWORD *)int v22 = 136315138;
      id v56 = v22 + 4;
      sub_2CAD4(0, &qword_398F8);
      swift_bridgeObjectRetain();
      uint64_t v23 = sub_2DAC0();
      id v62 = a3;
      uint64_t v24 = a4;
      uint64_t v25 = a5;
      unint64_t v27 = v26;
      swift_bridgeObjectRelease();
      uint64_t v66 = sub_22B88(v23, v27, (uint64_t *)aBlock);
      a2 = v57;
      sub_2DC80();
      a5 = v25;
      a4 = v24;
      a3 = v62;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_0, v18, (os_log_type_t)v20, "Fetched items: %s", v22, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      uint64_t v28 = (void (*)(char *, uint64_t))v64[1].isa;
      v28(v15, v65);
    }
    else
    {
      swift_bridgeObjectRelease_n();

      uint64_t v28 = (void (*)(char *, uint64_t))v11[1].isa;
      v28(v15, isEscapingClosureAtFileLocation);
    }
    if (a1 >> 62) {
      break;
    }
    if (!*(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8))) {
      return ((uint64_t (*)(void))a2)(0);
    }
    swift_bridgeObjectRetain();
LABEL_8:
    if ((a1 & 0xC000000000000001) != 0)
    {
      id v29 = (id)sub_2DD30();
    }
    else
    {
      if (!*(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8)))
      {
        __break(1u);
        goto LABEL_29;
      }
      id v29 = *(id *)(a1 + 32);
    }
    uint64_t v30 = v29;
    swift_bridgeObjectRelease();
    uint64_t v20 = swift_allocObject();
    *(unsigned char *)(v20 + 16) = 0;
    aBlock[0] = 0;
    id v31 = [v30 tracksWithError:aBlock];
    id v32 = aBlock[0];
    id v61 = v30;
    if (v31)
    {
      os_log_type_t v33 = v31;
      sub_2CAD4(0, &qword_398E8);
      unint64_t v34 = sub_2DAB0();
      id v35 = v32;

      id v36 = [v30 spatialOffsets];
      sub_2CAD4(0, &qword_398F0);
      unint64_t v37 = (void *)sub_2DAB0();

      sub_1B8E0(v34, v37, a2, (uint64_t)a3);
      swift_bridgeObjectRelease();
      if (!(v34 >> 62))
      {
        uint64_t v38 = *(void *)((char *)&dword_10 + (v34 & 0xFFFFFFFFFFFFFF8));
LABEL_14:
        swift_bridgeObjectRelease();
        *(unsigned char *)(v20 + 16) = v38 > 0;
        goto LABEL_19;
      }
LABEL_29:
      swift_bridgeObjectRetain();
      uint64_t v38 = sub_2DDA0();
      swift_bridgeObjectRelease();
      goto LABEL_14;
    }
    id v62 = a3;
    uint64_t v39 = v30;
    id v40 = aBlock[0];
    sub_2D810();

    swift_willThrow();
    v58(v63, v60, v65);
    id v41 = v39;
    swift_errorRetain();
    a3 = v41;
    swift_errorRetain();
    os_log_t v42 = sub_2D8D0();
    os_log_type_t v43 = sub_2DB80();
    int v44 = v43;
    if (os_log_type_enabled(v42, v43))
    {
      uint64_t v45 = swift_slowAlloc();
      id v56 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v45 = 138412546;
      id v59 = v42;
      uint64_t v60 = a4;
      LODWORD(v58) = v44;
      aBlock[0] = a3;
      id v46 = a3;
      Class v57 = a2;
      id v47 = v46;
      sub_2DC80();
      long long v48 = v56;
      *id v56 = a3;

      *(_WORD *)(v45 + 12) = 2112;
      swift_errorRetain();
      id v49 = (void *)_swift_stdlib_bridgeErrorToNSError();
      aBlock[0] = v49;
      os_log_t v42 = v59;
      a4 = v60;
      sub_2DC80();
      v48[1] = v49;
      a2 = v57;
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl(&dword_0, v42, (os_log_type_t)v58, "Couldn't load tracks: %@ %@", (uint8_t *)v45, 0x16u);
      sub_4BA0(&qword_39500);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_errorRelease();
      swift_errorRelease();
    }

    v28(v63, v65);
    a2(0);
    swift_errorRelease();
LABEL_19:
    a2 = *(void (**)(BOOL))&a4[OBJC_IVAR___AXHapticMusicServer_ahapAvailableCacheQueue];
    uint64_t v15 = (char *)swift_allocObject();
    *((void *)v15 + 2) = a4;
    long long v50 = *(_OWORD *)(a5 + 16);
    *(_OWORD *)(v15 + 24) = *(_OWORD *)a5;
    *(_OWORD *)(v15 + 40) = v50;
    *(_OWORD *)(v15 + 56) = *(_OWORD *)(a5 + 32);
    *((void *)v15 + 9) = *(void *)(a5 + 48);
    *((void *)v15 + 10) = v20;
    a1 = swift_allocObject();
    *(void *)(a1 + 16) = sub_2C5D0;
    *(void *)(a1 + 24) = v15;
    aBlock[4] = sub_2D5A0;
    aBlock[5] = (id)a1;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = (id)1107296256;
    aBlock[2] = sub_16804;
    aBlock[3] = &unk_35CE0;
    NSString v51 = _Block_copy(aBlock);
    id v11 = a2;
    uint64_t v52 = a4;
    sub_2BBDC(a5);
    swift_retain();
    swift_retain();
    swift_release();
    dispatch_sync(v11, v51);

    _Block_release(v51);
    uint64_t isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
    swift_release();
    swift_release();
    uint64_t result = swift_release();
    if ((isEscapingClosureAtFileLocation & 1) == 0) {
      return result;
    }
    __break(1u);
LABEL_21:
    swift_once();
  }
  swift_bridgeObjectRetain();
  uint64_t v54 = sub_2DDA0();
  swift_bridgeObjectRelease();
  if (v54)
  {
    swift_bridgeObjectRetain();
    if (!sub_2DDA0()) {
      return swift_bridgeObjectRelease();
    }
    goto LABEL_8;
  }
  return ((uint64_t (*)(void))a2)(0);
}

void sub_1F4C4(char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2D930();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v51 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_2D960();
  uint64_t v57 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  id v56 = (char *)&v51 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_2D8F0();
  uint64_t v60 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  uint64_t v14 = (char *)&v51 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v52 = a3;
  uint64_t v15 = (unsigned __int8 *)(a3 + 16);
  uint64_t v55 = a1;
  uint64_t v16 = &a1[OBJC_IVAR___AXHapticMusicServer_ahapAvailableCache];
  swift_beginAccess();
  uint64_t v17 = *(void *)v16;
  uint64_t v18 = *(void *)(*(void *)v16 + 16);
  uint64_t v59 = v6;
  uint64_t v58 = v7;
  uint64_t v54 = v10;
  unsigned int v53 = v9;
  if (v18)
  {
    sub_2BBDC(a2);
    unint64_t v19 = sub_231E0((Swift::UInt64 *)a2);
    if (v20)
    {
      BOOL v21 = *(void **)(*(void *)(v17 + 56) + 8 * v19);
      id v22 = v21;
    }
    else
    {
      BOOL v21 = 0;
    }
    sub_2BC28(a2);
  }
  else
  {
    BOOL v21 = 0;
  }
  swift_endAccess();
  swift_beginAccess();
  id v23 = [objc_allocWithZone((Class)NSNumber) initWithBool:*v15];
  uint64_t v24 = v23;
  if (v21)
  {
    if (v23)
    {
      sub_2CAD4(0, &qword_39460);
      id v25 = v21;
      char v26 = sub_2DC70();

      if (v26) {
        return;
      }
      goto LABEL_15;
    }
    uint64_t v24 = v21;
  }
  else if (!v23)
  {
    return;
  }

LABEL_15:
  swift_beginAccess();
  uint64_t v27 = *v15;
  id v28 = objc_allocWithZone((Class)NSNumber);
  sub_2BBDC(a2);
  id v29 = [v28 initWithBool:v27];
  swift_beginAccess();
  if (v29)
  {
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v63 = *(void *)v16;
    *(void *)uint64_t v16 = 0x8000000000000000;
    sub_25FCC((uint64_t)v29, a2, isUniquelyReferenced_nonNull_native);
    *(void *)uint64_t v16 = v63;
    swift_bridgeObjectRelease();
    sub_2BC28(a2);
  }
  else
  {
    id v31 = (void *)sub_23A50((Swift::UInt64 *)a2);
    sub_2BC28(a2);
  }
  uint64_t v32 = v54;
  os_log_type_t v33 = v53;
  uint64_t v34 = v52;
  swift_endAccess();
  if (qword_39BA0 != -1) {
    swift_once();
  }
  uint64_t v35 = sub_46B4(v12, (uint64_t)HMLog);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v60 + 16))(v14, v35, v12);
  sub_2BBDC(a2);
  swift_retain();
  id v36 = sub_2D8D0();
  os_log_type_t v37 = sub_2DB50();
  if (os_log_type_enabled(v36, v37))
  {
    uint64_t v38 = swift_slowAlloc();
    *(_DWORD *)uint64_t v38 = 67109376;
    swift_beginAccess();
    LODWORD(aBlock[0]) = *(unsigned __int8 *)(v34 + 16);
    sub_2DC80();
    swift_release();
    *(_WORD *)(v38 + 8) = 2048;
    aBlock[0] = *(void *)a2;
    sub_2DC80();
    sub_2BC28(a2);
    _os_log_impl(&dword_0, v36, v37, "Storing cache value %{BOOL}d, for %lld  ", (uint8_t *)v38, 0x12u);
    swift_slowDealloc();
  }
  else
  {
    swift_release();
    sub_2BC28(a2);
  }

  (*(void (**)(char *, uint64_t))(v60 + 8))(v14, v12);
  uint64_t v39 = v55;
  id v40 = *(void **)&v55[OBJC_IVAR___AXHapticMusicServer_ahapAvailableQueue];
  uint64_t v41 = swift_allocObject();
  long long v42 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(v41 + 24) = *(_OWORD *)a2;
  *(void *)(v41 + 16) = v39;
  *(_OWORD *)(v41 + 40) = v42;
  *(_OWORD *)(v41 + 56) = *(_OWORD *)(a2 + 32);
  *(void *)(v41 + 72) = *(void *)(a2 + 48);
  aBlock[4] = sub_2C6BC;
  aBlock[5] = v41;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_68F8;
  aBlock[3] = &unk_35DA8;
  os_log_type_t v43 = _Block_copy(aBlock);
  sub_2BBDC(a2);
  id v44 = v40;
  id v45 = v39;
  id v46 = v56;
  sub_2D940();
  id v61 = &_swiftEmptyArrayStorage;
  sub_27694(&qword_394A8, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_4BA0(&qword_394B0);
  sub_281F8(&qword_394B8, &qword_394B0);
  uint64_t v47 = v59;
  sub_2DCB0();
  sub_2DBF0();
  _Block_release(v43);

  (*(void (**)(char *, uint64_t))(v58 + 8))(v33, v47);
  (*(void (**)(char *, uint64_t))(v57 + 8))(v46, v32);
  swift_release();
  swift_beginAccess();
  LODWORD(v47) = *v15;
  long long v48 = self;
  id v49 = [v48 sharedInstance];
  LODWORD(v44) = [v49 hapticMusicTrackAvailable];

  if (v47 != v44)
  {
    id v50 = [v48 sharedInstance];
    swift_beginAccess();
    [v50 setHapticMusicTrackAvailable:*v15];

    sub_2D9C0();
    sub_2D9B0();
    sub_2D9A0();
    swift_release();
  }
}

uint64_t sub_1FCF4(void *a1, uint64_t a2)
{
  uint64_t v4 = sub_4BA0(&qword_39450);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_2DB30();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v6, 1, 1, v7);
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = 0;
  *(void *)(v8 + 24) = 0;
  *(void *)(v8 + 32) = a1;
  long long v9 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(v8 + 40) = *(_OWORD *)a2;
  *(_OWORD *)(v8 + 56) = v9;
  *(_OWORD *)(v8 + 72) = *(_OWORD *)(a2 + 32);
  *(void *)(v8 + 88) = *(void *)(a2 + 48);
  id v10 = a1;
  sub_2BBDC(a2);
  sub_E74C((uint64_t)v6, (uint64_t)&unk_39930, v8);
  return swift_release();
}

uint64_t sub_1FE18(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[17] = a4;
  v5[18] = a5;
  uint64_t v6 = sub_2D930();
  v5[19] = v6;
  v5[20] = *(void *)(v6 - 8);
  v5[21] = swift_task_alloc();
  uint64_t v7 = sub_2D960();
  v5[22] = v7;
  v5[23] = *(void *)(v7 - 8);
  v5[24] = swift_task_alloc();
  uint64_t v8 = sub_2D8F0();
  v5[25] = v8;
  v5[26] = *(void *)(v8 - 8);
  v5[27] = swift_task_alloc();
  return ((uint64_t (*)(uint64_t (*)(), void, void))_swift_task_switch)(sub_1FF90, 0, 0);
}

uint64_t sub_1FF90()
{
  *(void *)(v0 + 224) = *(void *)(*(void *)(v0 + 136) + OBJC_IVAR___AXHapticMusicServer_statusObservers);
  return ((uint64_t (*)(uint64_t (*)()))_swift_task_switch)(sub_1FFBC);
}

uint64_t sub_1FFBC()
{
  uint64_t v1 = *(void *)(v0 + 224);
  swift_beginAccess();
  *(void *)(v0 + 232) = *(void *)(v1 + 112);
  swift_bridgeObjectRetain();
  return ((uint64_t (*)(uint64_t (*)(), void, void))_swift_task_switch)(sub_20044, 0, 0);
}

uint64_t sub_20044()
{
  unint64_t v68 = v0;
  if (qword_39BA0 != -1) {
LABEL_30:
  }
    swift_once();
  long long aBlock = v0 + 2;
  uint64_t v2 = v0[26];
  uint64_t v1 = v0[27];
  uint64_t v3 = v0[25];
  uint64_t v4 = v0[18];
  uint64_t v5 = sub_46B4(v3, (uint64_t)HMLog);
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v5, v3);
  swift_bridgeObjectRetain();
  sub_2BBDC(v4);
  swift_bridgeObjectRetain();
  sub_2BBDC(v4);
  uint64_t v6 = sub_2D8D0();
  os_log_type_t v7 = sub_2DB80();
  BOOL v8 = os_log_type_enabled(v6, v7);
  uint64_t v10 = v0[26];
  uint64_t v9 = v0[27];
  uint64_t v11 = v0[25];
  uint64_t v12 = v0[18];
  uint64_t v66 = v0;
  if (v8)
  {
    uint64_t v13 = swift_slowAlloc();
    uint64_t v67 = swift_slowAlloc();
    *(_DWORD *)uint64_t v13 = 136315394;
    uint64_t v64 = v11;
    swift_bridgeObjectRetain();
    uint64_t v14 = sub_2D9F0();
    uint64_t v62 = v9;
    unint64_t v16 = v15;
    swift_bridgeObjectRelease();
    v0[15] = sub_22B88(v14, v16, &v67);
    sub_2DC80();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v13 + 12) = 2080;
    sub_2BBDC(v12);
    unint64_t v17 = sub_46EC();
    unint64_t v19 = v18;
    sub_2BC28(v12);
    v0[16] = sub_22B88(v17, v19, &v67);
    sub_2DC80();
    swift_bridgeObjectRelease();
    sub_2BC28(v12);
    sub_2BC28(v12);
    _os_log_impl(&dword_0, v6, v7, "Notifying clients of haptic availability change: %s %s", (uint8_t *)v13, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v62, v64);
  }
  else
  {
    swift_bridgeObjectRelease_n();
    sub_2BC28(v12);
    sub_2BC28(v12);

    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v9, v11);
  }
  int64_t v20 = 0;
  uint64_t v21 = v0[29];
  uint64_t v22 = *(void *)(v21 + 64);
  uint64_t v52 = v21 + 64;
  uint64_t v23 = -1;
  uint64_t v58 = v0[29];
  uint64_t v24 = -1 << *(unsigned char *)(v58 + 32);
  if (-v24 < 64) {
    uint64_t v23 = ~(-1 << -(char)v24);
  }
  unint64_t v25 = v23 & v22;
  uint64_t v57 = v0[17];
  uint64_t v56 = OBJC_IVAR___AXHapticMusicServer_ahapAvailableQueue;
  uint64_t v55 = (void (**)(uint64_t, uint64_t))(v0[20] + 8);
  int64_t v53 = (unint64_t)(63 - v24) >> 6;
  uint64_t v54 = (void (**)(uint64_t, uint64_t))(v0[23] + 8);
  while (1)
  {
    if (v25)
    {
      uint64_t v63 = (v25 - 1) & v25;
      int64_t v65 = v20;
      unint64_t v26 = __clz(__rbit64(v25)) | (v20 << 6);
      goto LABEL_9;
    }
    int64_t v46 = v20 + 1;
    if (__OFADD__(v20, 1))
    {
      __break(1u);
LABEL_29:
      __break(1u);
      goto LABEL_30;
    }
    if (v46 >= v53) {
      goto LABEL_25;
    }
    unint64_t v47 = *(void *)(v52 + 8 * v46);
    int64_t v48 = v20 + 1;
    if (!v47)
    {
      int64_t v48 = v20 + 2;
      if (v20 + 2 >= v53) {
        goto LABEL_25;
      }
      unint64_t v47 = *(void *)(v52 + 8 * v48);
      if (!v47)
      {
        int64_t v48 = v20 + 3;
        if (v20 + 3 >= v53) {
          goto LABEL_25;
        }
        unint64_t v47 = *(void *)(v52 + 8 * v48);
        if (!v47) {
          break;
        }
      }
    }
LABEL_24:
    uint64_t v63 = (v47 - 1) & v47;
    int64_t v65 = v48;
    unint64_t v26 = __clz(__rbit64(v47)) + (v48 << 6);
LABEL_9:
    uint64_t v27 = v0[24];
    uint64_t v60 = v0[21];
    uint64_t v61 = v0[22];
    uint64_t v28 = v0[18];
    uint64_t v29 = v0[19];
    uint64_t v30 = (uint64_t *)(*(void *)(v58 + 48) + 16 * v26);
    uint64_t v31 = *v30;
    uint64_t v32 = v30[1];
    os_log_type_t v33 = (uint64_t *)(*(void *)(v58 + 56) + 24 * v26);
    uint64_t v35 = *v33;
    uint64_t v34 = v33[1];
    id v36 = (void *)v33[2];
    os_log_type_t v37 = *(void **)(v57 + v56);
    uint64_t v38 = swift_allocObject();
    long long v39 = *(_OWORD *)(v28 + 32);
    uint64_t v40 = *(void *)(v28 + 48);
    long long v41 = *(_OWORD *)v28;
    *(_OWORD *)(v38 + 32) = *(_OWORD *)(v28 + 16);
    *(_OWORD *)(v38 + 48) = v39;
    *(_OWORD *)(v38 + 16) = v41;
    *(void *)(v38 + 64) = v40;
    *(void *)(v38 + 72) = v31;
    *(void *)(v38 + 80) = v32;
    *(void *)(v38 + 88) = v35;
    *(void *)(v38 + 96) = v34;
    *(void *)(v38 + 104) = v36;
    v66[6] = sub_2C81C;
    v66[7] = v38;
    v66[2] = _NSConcreteStackBlock;
    v66[3] = 1107296256;
    v66[4] = sub_68F8;
    v66[5] = &unk_35E20;
    long long v42 = _Block_copy(aBlock);
    id v43 = v36;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_2BBDC(v28);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    id v44 = v43;
    id v45 = v37;
    sub_2D940();
    v66[14] = &_swiftEmptyArrayStorage;
    sub_27694(&qword_394A8, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
    sub_4BA0(&qword_394B0);
    sub_281F8(&qword_394B8, &qword_394B0);
    sub_2DCB0();
    sub_2DBF0();
    _Block_release(v42);

    uint64_t v0 = v66;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    (*v55)(v60, v29);
    (*v54)(v27, v61);
    swift_release();
    unint64_t v25 = v63;
    int64_t v20 = v65;
  }
  uint64_t v49 = v20 + 4;
  if (v20 + 4 < v53)
  {
    unint64_t v47 = *(void *)(v52 + 8 * v49);
    if (!v47)
    {
      while (1)
      {
        int64_t v48 = v49 + 1;
        if (__OFADD__(v49, 1)) {
          goto LABEL_29;
        }
        if (v48 >= v53) {
          goto LABEL_25;
        }
        unint64_t v47 = *(void *)(v52 + 8 * v48);
        ++v49;
        if (v47) {
          goto LABEL_24;
        }
      }
    }
    int64_t v48 = v20 + 4;
    goto LABEL_24;
  }
LABEL_25:
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  id v50 = (uint64_t (*)(void))v0[1];
  return v50();
}

Swift::Void __swiftcall AXHapticMusicServer.updateSiriStatus()()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_2D8F0();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = OBJC_IVAR___AXHapticMusicServer_siriActivationSource;
  os_log_type_t v7 = *(void **)&v1[OBJC_IVAR___AXHapticMusicServer_siriActivationSource];
  if (!v7)
  {
    __break(1u);
    goto LABEL_12;
  }
  unsigned int v8 = [v7 isEnabled];
  if (v8)
  {
    uint64_t v9 = *(void **)&v1[v6];
    if (v9)
    {
      LOBYTE(v8) = [v9 isActive];
      goto LABEL_5;
    }
LABEL_12:
    __break(1u);
    return;
  }
LABEL_5:
  uint64_t v10 = OBJC_IVAR___AXHapticMusicServer_siriActive;
  v1[OBJC_IVAR___AXHapticMusicServer_siriActive] = v8;
  if (qword_39BA0 != -1) {
    swift_once();
  }
  uint64_t v11 = sub_46B4(v2, (uint64_t)HMLog);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v11, v2);
  uint64_t v12 = v1;
  uint64_t v13 = sub_2D8D0();
  os_log_type_t v14 = sub_2DB50();
  if (os_log_type_enabled(v13, v14))
  {
    unint64_t v15 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)unint64_t v15 = 67109120;
    v16[1] = v1[v10];
    sub_2DC80();

    _os_log_impl(&dword_0, v13, v14, "Update siri status to: %{BOOL}d", v15, 8u);
    swift_slowDealloc();
  }
  else
  {
  }
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  sub_6984();
}

Swift::Void __swiftcall AXHapticMusicServer.canActivateChanged(to:)(Swift::Bool to)
{
  uint64_t v3 = sub_2D930();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15[0] = sub_2D960();
  uint64_t v7 = *(void *)(v15[0] - 8);
  __chkstk_darwin(v15[0]);
  uint64_t v9 = (char *)v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *(void **)&v1[OBJC_IVAR___AXHapticMusicServer_queue];
  uint64_t v11 = swift_allocObject();
  *(unsigned char *)(v11 + 16) = to;
  *(void *)(v11 + 24) = v1;
  aBlock[4] = sub_27958;
  aBlock[5] = v11;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_68F8;
  aBlock[3] = &unk_34F20;
  uint64_t v12 = _Block_copy(aBlock);
  id v13 = v10;
  os_log_type_t v14 = v1;
  sub_2D940();
  v15[1] = &_swiftEmptyArrayStorage;
  sub_27694(&qword_394A8, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_4BA0(&qword_394B0);
  sub_281F8(&qword_394B8, &qword_394B0);
  sub_2DCB0();
  sub_2DBF0();
  _Block_release(v12);

  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  (*(void (**)(char *, void))(v7 + 8))(v9, v15[0]);
  swift_release();
}

void sub_20C84(char a1)
{
  uint64_t v2 = sub_2D8F0();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_39BA0 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_46B4(v2, (uint64_t)HMLog);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
  uint64_t v7 = sub_2D8D0();
  os_log_type_t v8 = sub_2DB50();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v9 = 67109120;
    v10[1] = a1 & 1;
    sub_2DC80();
    _os_log_impl(&dword_0, v7, v8, "Siri can activate change to: %{BOOL}d", v9, 8u);
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  AXHapticMusicServer.updateSiriStatus()();
}

id AXHapticMusicServer.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t AXHapticMusicError.message.getter(uint64_t a1)
{
  return a1;
}

unint64_t AXHapticMusicError.description.getter(uint64_t a1, void *a2)
{
  sub_2DD10(22);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  v5._countAndFlagsBits = a1;
  v5._object = a2;
  sub_2DA70(v5);
  swift_bridgeObjectRelease();
  return 0xD000000000000014;
}

unint64_t sub_2117C()
{
  return AXHapticMusicError.description.getter(*(void *)v0, *(void **)(v0 + 8));
}

id HapticMusicSiriActionSource.init(delegate:)(uint64_t a1)
{
  *(void *)&v1[OBJC_IVAR____TtC19AXHapticMusicServer27HapticMusicSiriActionSource_hmDelegate] = a1;
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for HapticMusicSiriActionSource();
  swift_unknownObjectRetain();
  id v3 = objc_msgSendSuper2(&v5, "initWithDelegate:", a1);
  swift_unknownObjectRelease();
  return v3;
}

Swift::Void __swiftcall HapticMusicSiriActionSource.activeChangedTo(value:)(NSNumber value)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_2D8F0();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_39BA0 != -1) {
    swift_once();
  }
  uint64_t v8 = sub_46B4(v4, (uint64_t)HMLog);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v8, v4);
  uint64_t v9 = value.super.super.isa;
  uint64_t v10 = sub_2D8D0();
  os_log_type_t v11 = sub_2DB80();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v20 = v1;
    uint64_t v12 = (uint8_t *)swift_slowAlloc();
    uint64_t v13 = swift_slowAlloc();
    uint64_t v19 = v5;
    os_log_type_t v14 = (void *)v13;
    unint64_t v18 = v7;
    *(_DWORD *)uint64_t v12 = 138412290;
    uint64_t v21 = v9;
    uint64_t v15 = v4;
    unint64_t v16 = v9;
    uint64_t v2 = v20;
    uint64_t v7 = v18;
    sub_2DC80();
    *os_log_type_t v14 = v9;

    uint64_t v4 = v15;
    _os_log_impl(&dword_0, v10, v11, "Siri active changed to: %@", v12, 0xCu);
    sub_4BA0(&qword_39500);
    swift_arrayDestroy();
    uint64_t v5 = v19;
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    uint64_t v10 = v9;
  }

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  if (*(void *)(v2 + OBJC_IVAR____TtC19AXHapticMusicServer27HapticMusicSiriActionSource_hmDelegate))
  {
    type metadata accessor for AXHapticMusicServer();
    if (swift_dynamicCastClass())
    {
      swift_unknownObjectRetain();
      AXHapticMusicServer.updateSiriStatus()();
      swift_unknownObjectRelease();
    }
  }
}

id HapticMusicSiriActionSource.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return [v1 init];
}

void HapticMusicSiriActionSource.init()()
{
}

id HapticMusicSiriActionSource.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for HapticMusicSiriActionSource();
  return objc_msgSendSuper2(&v2, "dealloc");
}

id sub_21650(uint64_t a1, uint64_t a2, char a3)
{
  NSString v5 = sub_2DA00();
  swift_bridgeObjectRelease();
  id v10 = 0;
  id v6 = [v3 initWithBundleIdentifier:v5 allowPlaceholder:a3 & 1 error:&v10];

  if (v6)
  {
    id v7 = v10;
  }
  else
  {
    id v8 = v10;
    sub_2D810();

    swift_willThrow();
  }
  return v6;
}

id sub_2172C()
{
  type metadata accessor for Key(0);
  sub_27694(&qword_398E0, type metadata accessor for Key);
  Class isa = sub_2D9D0().super.isa;
  swift_bridgeObjectRelease();
  id v6 = 0;
  id v2 = [v0 initWithDictionary:isa error:&v6];

  if (v2)
  {
    id v3 = v6;
  }
  else
  {
    id v4 = v6;
    sub_2D810();

    swift_willThrow();
  }
  return v2;
}

void *sub_21850@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void sub_21860(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_2186C(uint64_t a1, uint64_t a2)
{
  return sub_21C9C(a1, a2, (uint64_t (*)(uint64_t))&String._bridgeToObjectiveC());
}

uint64_t sub_21898(uint64_t a1, uint64_t a2)
{
  return sub_21C9C(a1, a2, (uint64_t (*)(uint64_t))&String.hashValue.getter);
}

uint64_t sub_218B0(uint64_t a1, id *a2)
{
  uint64_t result = sub_2DA10();
  *a2 = 0;
  return result;
}

uint64_t sub_21928(uint64_t a1, id *a2)
{
  char v3 = sub_2DA20();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_219A8@<X0>(void *a1@<X8>)
{
  sub_2DA30();
  NSString v2 = sub_2DA00();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_219F4(uint64_t a1)
{
  uint64_t v2 = sub_27694(&qword_39AB0, type metadata accessor for Name);
  uint64_t v3 = sub_27694(&qword_39AB8, type metadata accessor for Name);

  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_21AB0(uint64_t a1)
{
  uint64_t v2 = sub_27694(&qword_39978, type metadata accessor for SHMediaItemProperty);
  uint64_t v3 = sub_27694(&qword_39AA8, type metadata accessor for SHMediaItemProperty);

  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_21B6C@<X0>(void *a1@<X8>)
{
  NSString v2 = sub_2DA00();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_21BB4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_2DA30();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_21BE0(uint64_t a1)
{
  uint64_t v2 = sub_27694(&qword_398E0, type metadata accessor for Key);
  uint64_t v3 = sub_27694(&qword_39AA0, type metadata accessor for Key);

  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_21C9C(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = sub_2DA30();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_21CE0()
{
  sub_2DA30();
  sub_2DA50();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_21D34()
{
  sub_2DA30();
  sub_2DE90();
  sub_2DA50();
  Swift::Int v0 = sub_2DEB0();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_21DA8()
{
  uint64_t v0 = sub_2DA30();
  uint64_t v2 = v1;
  if (v0 == sub_2DA30() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_2DE10();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_21E34(uint64_t a1, int *a2)
{
  id v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
  v4[1] = sub_21F10;
  return v6(a1);
}

uint64_t sub_21F10()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

unint64_t sub_22008(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_4BA0(&qword_39990);
  uint64_t v2 = (void *)sub_2DDD0();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (void **)(a1 + 40);
  while (1)
  {
    char v5 = *v4;
    id v6 = *(v4 - 1);
    id v7 = v5;
    unint64_t result = sub_23374((uint64_t)v6, (uint64_t (*)(uint64_t, Swift::Int))sub_22844);
    if (v9) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v10 = 8 * result;
    *(void *)(v2[6] + v10) = v6;
    *(void *)(v2[7] + v10) = v7;
    uint64_t v11 = v2[2];
    BOOL v12 = __OFADD__(v11, 1);
    uint64_t v13 = v11 + 1;
    if (v12) {
      goto LABEL_11;
    }
    v2[2] = v13;
    v4 += 2;
    if (!--v3)
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

id sub_22128()
{
  uint64_t v1 = v0;
  sub_4BA0(&qword_39988);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_2DDB0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_27:
    id result = (id)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  id result = (id)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 64), 8 * v7);
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
    int64_t v19 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_29;
    }
    if (v19 >= v13) {
      goto LABEL_27;
    }
    unint64_t v20 = *(void *)(v6 + 8 * v19);
    ++v9;
    if (!v20)
    {
      int64_t v9 = v19 + 1;
      if (v19 + 1 >= v13) {
        goto LABEL_27;
      }
      unint64_t v20 = *(void *)(v6 + 8 * v9);
      if (!v20)
      {
        int64_t v9 = v19 + 2;
        if (v19 + 2 >= v13) {
          goto LABEL_27;
        }
        unint64_t v20 = *(void *)(v6 + 8 * v9);
        if (!v20)
        {
          int64_t v9 = v19 + 3;
          if (v19 + 3 >= v13) {
            goto LABEL_27;
          }
          unint64_t v20 = *(void *)(v6 + 8 * v9);
          int64_t v21 = v19 + 3;
          if (!v20) {
            break;
          }
        }
      }
    }
LABEL_26:
    unint64_t v12 = (v20 - 1) & v20;
    unint64_t v15 = __clz(__rbit64(v20)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    uint64_t v17 = *(void **)(*(void *)(v2 + 48) + 8 * v15);
    uint64_t v18 = 32 * v15;
    sub_27554(*(void *)(v2 + 56) + 32 * v15, (uint64_t)v22);
    *(void *)(*(void *)(v4 + 48) + v16) = v17;
    sub_2C65C(v22, (_OWORD *)(*(void *)(v4 + 56) + v18));
    id result = v17;
  }
  while (1)
  {
    int64_t v9 = v21 + 1;
    if (__OFADD__(v21, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_27;
    }
    unint64_t v20 = *(void *)(v6 + 8 * v9);
    ++v21;
    if (v20) {
      goto LABEL_26;
    }
  }
LABEL_29:
  __break(1u);
  return result;
}

uint64_t sub_22300(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_4BA0(&qword_39988);
  char v34 = a2;
  uint64_t v6 = sub_2DDC0();
  uint64_t v7 = v6;
  if (*(void *)(v5 + 16))
  {
    uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
    uint64_t v32 = (void *)(v5 + 64);
    if (v8 < 64) {
      uint64_t v9 = ~(-1 << v8);
    }
    else {
      uint64_t v9 = -1;
    }
    unint64_t v10 = v9 & *(void *)(v5 + 64);
    int64_t v33 = (unint64_t)(v8 + 63) >> 6;
    uint64_t v11 = v6 + 64;
    uint64_t result = swift_retain();
    int64_t v13 = 0;
    while (1)
    {
      if (v10)
      {
        unint64_t v15 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        unint64_t v16 = v15 | (v13 << 6);
      }
      else
      {
        int64_t v17 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
          return result;
        }
        if (v17 >= v33) {
          goto LABEL_35;
        }
        unint64_t v18 = v32[v17];
        ++v13;
        if (!v18)
        {
          int64_t v13 = v17 + 1;
          if (v17 + 1 >= v33) {
            goto LABEL_35;
          }
          unint64_t v18 = v32[v13];
          if (!v18)
          {
            int64_t v13 = v17 + 2;
            if (v17 + 2 >= v33) {
              goto LABEL_35;
            }
            unint64_t v18 = v32[v13];
            if (!v18)
            {
              int64_t v13 = v17 + 3;
              if (v17 + 3 >= v33)
              {
LABEL_35:
                swift_release();
                if (v34)
                {
                  uint64_t v31 = 1 << *(unsigned char *)(v5 + 32);
                  if (v31 >= 64) {
                    bzero(v32, ((unint64_t)(v31 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                  }
                  else {
                    *uint64_t v32 = -1 << v31;
                  }
                  *(void *)(v5 + 16) = 0;
                }
                break;
              }
              unint64_t v18 = v32[v13];
              for (int64_t i = v17 + 3; !v18; ++i)
              {
                int64_t v13 = i + 1;
                if (__OFADD__(i, 1)) {
                  goto LABEL_42;
                }
                if (v13 >= v33) {
                  goto LABEL_35;
                }
                unint64_t v18 = v32[v13];
              }
            }
          }
        }
        unint64_t v10 = (v18 - 1) & v18;
        unint64_t v16 = __clz(__rbit64(v18)) + (v13 << 6);
      }
      unint64_t v20 = *(void **)(*(void *)(v5 + 48) + 8 * v16);
      int64_t v21 = (_OWORD *)(*(void *)(v5 + 56) + 32 * v16);
      if (v34)
      {
        sub_2C65C(v21, v35);
      }
      else
      {
        sub_27554((uint64_t)v21, (uint64_t)v35);
        id v22 = v20;
      }
      sub_2DA30();
      sub_2DE90();
      sub_2DA50();
      Swift::Int v23 = sub_2DEB0();
      uint64_t result = swift_bridgeObjectRelease();
      uint64_t v24 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v25 = v23 & ~v24;
      unint64_t v26 = v25 >> 6;
      if (((-1 << v25) & ~*(void *)(v11 + 8 * (v25 >> 6))) != 0)
      {
        unint64_t v14 = __clz(__rbit64((-1 << v25) & ~*(void *)(v11 + 8 * (v25 >> 6)))) | v25 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v27 = 0;
        unint64_t v28 = (unint64_t)(63 - v24) >> 6;
        do
        {
          if (++v26 == v28 && (v27 & 1) != 0)
          {
            __break(1u);
            goto LABEL_41;
          }
          BOOL v29 = v26 == v28;
          if (v26 == v28) {
            unint64_t v26 = 0;
          }
          v27 |= v29;
          uint64_t v30 = *(void *)(v11 + 8 * v26);
        }
        while (v30 == -1);
        unint64_t v14 = __clz(__rbit64(~v30)) + (v26 << 6);
      }
      *(void *)(v11 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
      *(void *)(*(void *)(v7 + 48) + 8 * v14) = v20;
      uint64_t result = (uint64_t)sub_2C65C(v35, (_OWORD *)(*(void *)(v7 + 56) + 32 * v14));
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

unint64_t sub_22650(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_2DCC0();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        unint64_t v10 = *(void **)(*(void *)(a2 + 48) + 8 * v6);
        sub_2DA30();
        sub_2DE90();
        id v11 = v10;
        sub_2DA50();
        Swift::Int v12 = sub_2DEB0();

        uint64_t result = swift_bridgeObjectRelease();
        unint64_t v13 = v12 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v13 < v8) {
            goto LABEL_5;
          }
        }
        else if (v13 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v13)
        {
LABEL_11:
          uint64_t v14 = *(void *)(a2 + 48);
          unint64_t v15 = (void *)(v14 + 8 * v3);
          unint64_t v16 = (void *)(v14 + 8 * v6);
          if (v3 != v6 || v15 >= v16 + 1) {
            *unint64_t v15 = *v16;
          }
          uint64_t v17 = *(void *)(a2 + 56);
          unint64_t v18 = (_OWORD *)(v17 + 32 * v3);
          int64_t v19 = (_OWORD *)(v17 + 32 * v6);
          if (v3 != v6 || (int64_t v3 = v6, v18 >= v19 + 2))
          {
            long long v9 = v19[1];
            *unint64_t v18 = *v19;
            v18[1] = v9;
            int64_t v3 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    unint64_t v20 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v21 = *v20;
    uint64_t v22 = (-1 << v3) - 1;
  }
  else
  {
    unint64_t v20 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v22 = *v20;
    uint64_t v21 = (-1 << result) - 1;
  }
  *unint64_t v20 = v22 & v21;
  uint64_t v23 = *(void *)(a2 + 16);
  BOOL v24 = __OFSUB__(v23, 1);
  uint64_t v25 = v23 - 1;
  if (v24)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v25;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_22844(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v5 = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
  {
    uint64_t v6 = sub_2DA30();
    uint64_t v8 = v7;
    if (v6 == sub_2DA30() && v8 == v9) {
      goto LABEL_22;
    }
    char v11 = sub_2DE10();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v11) {
      return v5;
    }
    uint64_t v12 = ~v4;
    unint64_t v5 = (v5 + 1) & v12;
    if (((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5) & 1) == 0) {
      return v5;
    }
    uint64_t v13 = sub_2DA30();
    uint64_t v15 = v14;
    if (v13 == sub_2DA30() && v15 == v16)
    {
LABEL_22:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    char v18 = sub_2DE10();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v18 & 1) == 0)
    {
      unint64_t v5 = (v5 + 1) & v12;
      if ((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
      {
        while (1)
        {
          uint64_t v19 = sub_2DA30();
          uint64_t v21 = v20;
          if (v19 == sub_2DA30() && v21 == v22) {
            break;
          }
          char v24 = sub_2DE10();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v24 & 1) == 0)
          {
            unint64_t v5 = (v5 + 1) & v12;
            if ((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5)) {
              continue;
            }
          }
          return v5;
        }
        goto LABEL_22;
      }
    }
  }
  return v5;
}

void *sub_22A34(void *a1, int64_t a2, char a3)
{
  uint64_t result = sub_22A54(a1, a2, a3, *v3);
  *uint64_t v3 = result;
  return result;
}

void *sub_22A54(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = a4[3];
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
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    sub_4BA0(&qword_39898);
    unint64_t v10 = (void *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 25;
    }
    _DWORD v10[2] = v8;
    v10[3] = (2 * (v12 >> 3)) | 1;
  }
  else
  {
    unint64_t v10 = &_swiftEmptyArrayStorage;
  }
  if (v5)
  {
    if (v10 != a4 || v10 + 4 >= &a4[v8 + 4]) {
      memmove(v10 + 4, a4 + 4, 8 * v8);
    }
    a4[2] = 0;
  }
  else
  {
    sub_2CAD4(0, &qword_39980);
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

uint64_t sub_22B88(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_22C5C(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_27554((uint64_t)v12, *a3);
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
      sub_27554((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_2CA70((uint64_t)v12);
  return v7;
}

uint64_t sub_22C5C(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_2DC90();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_22E18(a5, a6);
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
  uint64_t v8 = sub_2DD40();
  if (!v8)
  {
    sub_2DD90();
    __break(1u);
LABEL_17:
    uint64_t result = sub_2DDE0();
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

uint64_t sub_22E18(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_22EB0(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_23090(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_23090(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_22EB0(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_23028(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_2DD20();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_2DD90();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_2DA80();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_2DDE0();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_2DD90();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_23028(uint64_t a1, uint64_t a2)
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
  sub_4BA0(&qword_39A00);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_23090(char a1, int64_t a2, char a3, char *a4)
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
    sub_4BA0(&qword_39A00);
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
  uint64_t result = sub_2DDE0();
  __break(1u);
  return result;
}

unint64_t sub_231E0(Swift::UInt64 *a1)
{
  sub_2DE90();
  sub_2DEA0(*a1);
  swift_bridgeObjectRetain();
  sub_2DA50();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_2DA50();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_2DA50();
  swift_bridgeObjectRelease();
  Swift::Int v2 = sub_2DEB0();

  return sub_23414((uint64_t *)a1, v2);
}

unint64_t sub_232B8(uint64_t a1, uint64_t a2)
{
  sub_2DE90();
  sub_2DA50();
  Swift::Int v4 = sub_2DEB0();

  return sub_2353C(a1, a2, v4);
}

unint64_t sub_23330(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = sub_2DCD0(*(void *)(v2 + 40));

  return sub_23620(a1, v4);
}

uint64_t sub_23374(uint64_t a1, uint64_t (*a2)(uint64_t, Swift::Int))
{
  sub_2DA30();
  sub_2DE90();
  sub_2DA50();
  Swift::Int v3 = sub_2DEB0();
  swift_bridgeObjectRelease();

  return a2(a1, v3);
}

unint64_t sub_23414(uint64_t *a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v5 = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
  {
    uint64_t v7 = ~v4;
    uint64_t v8 = *(void *)(v2 + 48);
    uint64_t v9 = *a1;
    do
    {
      uint64_t v10 = (void *)(v8 + 56 * v5);
      if (*v10 == v9)
      {
        uint64_t v11 = v10[3];
        uint64_t v12 = v10[4];
        uint64_t v13 = v10[5];
        uint64_t v14 = v10[6];
        BOOL v15 = v10[1] == a1[1] && v10[2] == a1[2];
        if (v15 || (sub_2DE10() & 1) != 0)
        {
          BOOL v16 = v11 == a1[3] && v12 == a1[4];
          if (v16 || (sub_2DE10() & 1) != 0)
          {
            BOOL v17 = v13 == a1[5] && v14 == a1[6];
            if (v17 || (sub_2DE10() & 1) != 0) {
              break;
            }
          }
        }
      }
      unint64_t v5 = (v5 + 1) & v7;
    }
    while (((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5) & 1) != 0);
  }
  return v5;
}

unint64_t sub_2353C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_2DE10() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        uint64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_2DE10() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_23620(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    do
    {
      sub_2C5F8(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v8);
      char v6 = sub_2DCE0();
      sub_27204((uint64_t)v8);
      if (v6) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v5;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

unint64_t sub_236E8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v5 = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
  {
    uint64_t v6 = sub_2DA30();
    uint64_t v8 = v7;
    if (v6 == sub_2DA30() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    char v11 = sub_2DE10();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v11 & 1) == 0)
    {
      uint64_t v12 = ~v4;
      unint64_t v5 = (v5 + 1) & v12;
      if ((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
      {
        while (1)
        {
          uint64_t v13 = sub_2DA30();
          uint64_t v15 = v14;
          if (v13 == sub_2DA30() && v15 == v16) {
            break;
          }
          char v18 = sub_2DE10();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v18 & 1) == 0)
          {
            unint64_t v5 = (v5 + 1) & v12;
            if ((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5)) {
              continue;
            }
          }
          return v5;
        }
        goto LABEL_16;
      }
    }
  }
  return v5;
}

uint64_t sub_23860(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  swift_bridgeObjectRetain();
  unint64_t v6 = sub_232B8(a1, a2);
  LOBYTE(a2) = v7;
  swift_bridgeObjectRelease();
  if ((a2 & 1) == 0) {
    return 0;
  }
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v9 = *v3;
  uint64_t v12 = *v3;
  *uint64_t v3 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_2622C();
    uint64_t v9 = v12;
  }
  swift_bridgeObjectRelease();
  uint64_t v10 = *(void *)(*(void *)(v9 + 56) + 24 * v6);
  sub_24F84(v6, v9);
  *uint64_t v3 = v9;
  swift_bridgeObjectRelease();
  return v10;
}

double sub_23954@<D0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v3 = v2;
  swift_bridgeObjectRetain();
  unint64_t v6 = sub_23330(a1);
  LOBYTE(a1) = v7;
  swift_bridgeObjectRelease();
  if (a1)
  {
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v9 = *v3;
    uint64_t v11 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_26410();
      uint64_t v9 = v11;
    }
    sub_27204(*(void *)(v9 + 48) + 40 * v6);
    sub_2C65C((_OWORD *)(*(void *)(v9 + 56) + 32 * v6), a2);
    sub_25170(v6, v9);
    *uint64_t v3 = v9;
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

uint64_t sub_23A50(Swift::UInt64 *a1)
{
  uint64_t v2 = v1;
  swift_bridgeObjectRetain();
  unint64_t v4 = sub_231E0(a1);
  LOBYTE(a1) = v5;
  swift_bridgeObjectRelease();
  if ((a1 & 1) == 0) {
    return 0;
  }
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v7 = *v2;
  uint64_t v10 = *v2;
  *uint64_t v2 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_26BA0();
    uint64_t v7 = v10;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v8 = *(void *)(*(void *)(v7 + 56) + 8 * v4);
  sub_255EC(v4, v7);
  *uint64_t v2 = v7;
  swift_bridgeObjectRelease();
  return v8;
}

uint64_t sub_23B3C(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_4BA0(&qword_399E8);
  char v40 = a2;
  uint64_t v6 = sub_2DDC0();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v39 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  os_log_type_t v37 = v2;
  int64_t v38 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v20 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v21 = v20 | (v13 << 6);
      goto LABEL_31;
    }
    int64_t v22 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v22 >= v38) {
      break;
    }
    uint64_t v23 = (void *)(v5 + 64);
    unint64_t v24 = *(void *)(v39 + 8 * v22);
    ++v13;
    if (!v24)
    {
      int64_t v13 = v22 + 1;
      if (v22 + 1 >= v38) {
        goto LABEL_33;
      }
      unint64_t v24 = *(void *)(v39 + 8 * v13);
      if (!v24)
      {
        int64_t v25 = v22 + 2;
        if (v25 >= v38)
        {
LABEL_33:
          swift_release();
          uint64_t v3 = v37;
          if ((v40 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v24 = *(void *)(v39 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            int64_t v13 = v25 + 1;
            if (__OFADD__(v25, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v38) {
              goto LABEL_33;
            }
            unint64_t v24 = *(void *)(v39 + 8 * v13);
            ++v25;
            if (v24) {
              goto LABEL_30;
            }
          }
        }
        int64_t v13 = v25;
      }
    }
LABEL_30:
    unint64_t v10 = (v24 - 1) & v24;
    unint64_t v21 = __clz(__rbit64(v24)) + (v13 << 6);
LABEL_31:
    uint64_t v30 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v21);
    uint64_t v32 = *v30;
    uint64_t v31 = v30[1];
    uint64_t v33 = *(void *)(v5 + 56) + 24 * v21;
    uint64_t v34 = *(void *)v33;
    long long v41 = *(_OWORD *)(v33 + 8);
    if ((v40 & 1) == 0)
    {
      id v35 = *((id *)&v41 + 1);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    sub_2DE90();
    sub_2DA50();
    uint64_t result = sub_2DEB0();
    uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v15 = result & ~v14;
    unint64_t v16 = v15 >> 6;
    if (((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v26 = 0;
      unint64_t v27 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v28 = v16 == v27;
        if (v16 == v27) {
          unint64_t v16 = 0;
        }
        v26 |= v28;
        uint64_t v29 = *(void *)(v11 + 8 * v16);
      }
      while (v29 == -1);
      unint64_t v17 = __clz(__rbit64(~v29)) + (v16 << 6);
    }
    *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    char v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
    *char v18 = v32;
    v18[1] = v31;
    uint64_t v19 = *(void *)(v7 + 56) + 24 * v17;
    *(void *)uint64_t v19 = v34;
    *(_OWORD *)(v19 + 8) = v41;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v37;
  uint64_t v23 = (void *)(v5 + 64);
  if ((v40 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v36 = 1 << *(unsigned char *)(v5 + 32);
  if (v36 >= 64) {
    bzero(v23, ((unint64_t)(v36 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v23 = -1 << v36;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_23E80(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_4BA0(&qword_39940);
  uint64_t v6 = sub_2DDC0();
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
    int64_t v22 = (void *)(v5 + 64);
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
      sub_2C65C((_OWORD *)(*(void *)(v5 + 56) + 32 * v20), v37);
    }
    else
    {
      sub_2C5F8(v25, (uint64_t)&v38);
      sub_27554(*(void *)(v5 + 56) + 32 * v20, (uint64_t)v37);
    }
    uint64_t result = sub_2DCD0(*(void *)(v7 + 40));
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
    uint64_t result = (uint64_t)sub_2C65C(v37, (_OWORD *)(*(void *)(v7 + 56) + 32 * v15));
    ++*(void *)(v7 + 16);
  }
  swift_release();
  int64_t v22 = (void *)(v5 + 64);
  if ((a2 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v35 = 1 << *(unsigned char *)(v5 + 32);
  if (v35 >= 64) {
    bzero(v22, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *int64_t v22 = -1 << v35;
  }
  *(void *)(v5 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_24198(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_4BA0(&qword_399D0);
  char v42 = a2;
  uint64_t v6 = sub_2DDC0();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_41;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v41 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  long long v39 = v2;
  int64_t v40 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v20 = v19 | (v13 << 6);
      goto LABEL_22;
    }
    int64_t v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v21 >= v40) {
      break;
    }
    int64_t v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v41 + 8 * v21);
    ++v13;
    if (!v23)
    {
      int64_t v13 = v21 + 1;
      if (v21 + 1 >= v40) {
        goto LABEL_34;
      }
      unint64_t v23 = *(void *)(v41 + 8 * v13);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v40)
        {
LABEL_34:
          swift_release();
          uint64_t v3 = v39;
          if ((v42 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v23 = *(void *)(v41 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v13 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_43;
            }
            if (v13 >= v40) {
              goto LABEL_34;
            }
            unint64_t v23 = *(void *)(v41 + 8 * v13);
            ++v24;
            if (v23) {
              goto LABEL_21;
            }
          }
        }
        int64_t v13 = v24;
      }
    }
LABEL_21:
    unint64_t v10 = (v23 - 1) & v23;
    unint64_t v20 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_22:
    uint64_t v25 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v20);
    uint64_t v27 = *v25;
    uint64_t v26 = v25[1];
    uint64_t v28 = *(void *)(v5 + 56) + 40 * v20;
    if (v42)
    {
      long long v29 = *(_OWORD *)v28;
      long long v30 = *(_OWORD *)(v28 + 16);
      uint64_t v45 = *(void *)(v28 + 32);
      long long v43 = v29;
      long long v44 = v30;
    }
    else
    {
      sub_2C5F8(v28, (uint64_t)&v43);
      swift_bridgeObjectRetain();
    }
    sub_2DE90();
    sub_2DA50();
    uint64_t result = sub_2DEB0();
    uint64_t v31 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v32 = result & ~v31;
    unint64_t v33 = v32 >> 6;
    if (((-1 << v32) & ~*(void *)(v11 + 8 * (v32 >> 6))) != 0)
    {
      unint64_t v14 = __clz(__rbit64((-1 << v32) & ~*(void *)(v11 + 8 * (v32 >> 6)))) | v32 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v34 = 0;
      unint64_t v35 = (unint64_t)(63 - v31) >> 6;
      do
      {
        if (++v33 == v35 && (v34 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        BOOL v36 = v33 == v35;
        if (v33 == v35) {
          unint64_t v33 = 0;
        }
        v34 |= v36;
        uint64_t v37 = *(void *)(v11 + 8 * v33);
      }
      while (v37 == -1);
      unint64_t v14 = __clz(__rbit64(~v37)) + (v33 << 6);
    }
    *(void *)(v11 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
    unint64_t v15 = (void *)(*(void *)(v7 + 48) + 16 * v14);
    *unint64_t v15 = v27;
    v15[1] = v26;
    uint64_t v16 = *(void *)(v7 + 56) + 40 * v14;
    long long v17 = v43;
    long long v18 = v44;
    *(void *)(v16 + 32) = v45;
    *(_OWORD *)uint64_t v16 = v17;
    *(_OWORD *)(v16 + 16) = v18;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v39;
  int64_t v22 = (void *)(v5 + 64);
  if ((v42 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v38 = 1 << *(unsigned char *)(v5 + 32);
  if (v38 >= 64) {
    bzero(v22, ((unint64_t)(v38 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *int64_t v22 = -1 << v38;
  }
  *(void *)(v5 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_244D0(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_4BA0(&qword_398A8);
  char v38 = a2;
  uint64_t v6 = sub_2DDC0();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v37 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  unint64_t v35 = v2;
  int64_t v36 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v20 = v19 | (v13 << 6);
      goto LABEL_31;
    }
    int64_t v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v36) {
      break;
    }
    int64_t v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v37 + 8 * v21);
    ++v13;
    if (!v23)
    {
      int64_t v13 = v21 + 1;
      if (v21 + 1 >= v36) {
        goto LABEL_33;
      }
      unint64_t v23 = *(void *)(v37 + 8 * v13);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v36)
        {
LABEL_33:
          swift_release();
          uint64_t v3 = v35;
          if ((v38 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v23 = *(void *)(v37 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v13 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v36) {
              goto LABEL_33;
            }
            unint64_t v23 = *(void *)(v37 + 8 * v13);
            ++v24;
            if (v23) {
              goto LABEL_30;
            }
          }
        }
        int64_t v13 = v24;
      }
    }
LABEL_30:
    unint64_t v10 = (v23 - 1) & v23;
    unint64_t v20 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_31:
    long long v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v20);
    uint64_t v31 = *v29;
    uint64_t v30 = v29[1];
    unint64_t v32 = *(void **)(*(void *)(v5 + 56) + 8 * v20);
    if ((v38 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      id v33 = v32;
    }
    sub_2DE90();
    sub_2DA50();
    uint64_t result = sub_2DEB0();
    uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v15 = result & ~v14;
    unint64_t v16 = v15 >> 6;
    if (((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v27 = v16 == v26;
        if (v16 == v26) {
          unint64_t v16 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v11 + 8 * v16);
      }
      while (v28 == -1);
      unint64_t v17 = __clz(__rbit64(~v28)) + (v16 << 6);
    }
    *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    long long v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
    *long long v18 = v31;
    v18[1] = v30;
    *(void *)(*(void *)(v7 + 56) + 8 * v17) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v35;
  int64_t v22 = (void *)(v5 + 64);
  if ((v38 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v34 = 1 << *(unsigned char *)(v5 + 32);
  if (v34 >= 64) {
    bzero(v22, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *int64_t v22 = -1 << v34;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_247E0(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_4BA0(&qword_398B8);
  char v48 = a2;
  uint64_t v6 = sub_2DDC0();
  uint64_t v7 = v6;
  if (*(void *)(v5 + 16))
  {
    uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
    int64_t v46 = (void *)(v5 + 64);
    if (v8 < 64) {
      uint64_t v9 = ~(-1 << v8);
    }
    else {
      uint64_t v9 = -1;
    }
    unint64_t v10 = v9 & *(void *)(v5 + 64);
    long long v44 = v3;
    int64_t v45 = (unint64_t)(v8 + 63) >> 6;
    uint64_t v11 = v6 + 64;
    uint64_t result = swift_retain();
    int64_t v13 = 0;
    uint64_t v47 = v5;
    while (1)
    {
      if (v10)
      {
        uint64_t v49 = (v10 - 1) & v10;
        int64_t v50 = v13;
        unint64_t v22 = __clz(__rbit64(v10)) | (v13 << 6);
      }
      else
      {
        int64_t v23 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
LABEL_39:
          __break(1u);
LABEL_40:
          __break(1u);
          return result;
        }
        if (v23 >= v45) {
          goto LABEL_33;
        }
        unint64_t v24 = v46[v23];
        int64_t v25 = v13 + 1;
        if (!v24)
        {
          int64_t v25 = v13 + 2;
          if (v13 + 2 >= v45) {
            goto LABEL_33;
          }
          unint64_t v24 = v46[v25];
          if (!v24)
          {
            uint64_t v26 = v13 + 3;
            if (v13 + 3 >= v45)
            {
LABEL_33:
              swift_release();
              uint64_t v3 = v44;
              if (v48)
              {
                uint64_t v43 = 1 << *(unsigned char *)(v5 + 32);
                if (v43 >= 64) {
                  bzero(v46, ((unint64_t)(v43 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  void *v46 = -1 << v43;
                }
                *(void *)(v5 + 16) = 0;
              }
              break;
            }
            unint64_t v24 = v46[v26];
            if (!v24)
            {
              while (1)
              {
                int64_t v25 = v26 + 1;
                if (__OFADD__(v26, 1)) {
                  goto LABEL_40;
                }
                if (v25 >= v45) {
                  goto LABEL_33;
                }
                unint64_t v24 = v46[v25];
                ++v26;
                if (v24) {
                  goto LABEL_30;
                }
              }
            }
            int64_t v25 = v13 + 3;
          }
        }
LABEL_30:
        uint64_t v49 = (v24 - 1) & v24;
        int64_t v50 = v25;
        unint64_t v22 = __clz(__rbit64(v24)) + (v25 << 6);
      }
      uint64_t v31 = *(void *)(v5 + 56);
      unint64_t v32 = (Swift::UInt64 *)(*(void *)(v5 + 48) + 56 * v22);
      Swift::UInt64 v34 = *v32;
      Swift::UInt64 v33 = v32[1];
      Swift::UInt64 v36 = v32[2];
      Swift::UInt64 v35 = v32[3];
      Swift::UInt64 v38 = v32[4];
      Swift::UInt64 v37 = v32[5];
      Swift::UInt64 v39 = v32[6];
      int64_t v40 = (uint64_t *)(v31 + 16 * v22);
      uint64_t v41 = *v40;
      uint64_t v42 = v40[1];
      if ((v48 & 1) == 0)
      {
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
      }
      sub_2DE90();
      sub_2DEA0(v34);
      swift_bridgeObjectRetain();
      sub_2DA50();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      sub_2DA50();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      sub_2DA50();
      swift_bridgeObjectRelease();
      uint64_t result = sub_2DEB0();
      uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v15 = result & ~v14;
      unint64_t v16 = v15 >> 6;
      if (((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
      {
        unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
        Swift::UInt64 v18 = v34;
        uint64_t v19 = v41;
      }
      else
      {
        char v27 = 0;
        unint64_t v28 = (unint64_t)(63 - v14) >> 6;
        Swift::UInt64 v18 = v34;
        uint64_t v19 = v41;
        do
        {
          if (++v16 == v28 && (v27 & 1) != 0)
          {
            __break(1u);
            goto LABEL_39;
          }
          BOOL v29 = v16 == v28;
          if (v16 == v28) {
            unint64_t v16 = 0;
          }
          v27 |= v29;
          uint64_t v30 = *(void *)(v11 + 8 * v16);
        }
        while (v30 == -1);
        unint64_t v17 = __clz(__rbit64(~v30)) + (v16 << 6);
      }
      *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
      unint64_t v20 = (Swift::UInt64 *)(*(void *)(v7 + 48) + 56 * v17);
      *unint64_t v20 = v18;
      v20[1] = v33;
      v20[2] = v36;
      v20[3] = v35;
      v20[4] = v38;
      v20[5] = v37;
      v20[6] = v39;
      int64_t v21 = (void *)(*(void *)(v7 + 56) + 16 * v17);
      *int64_t v21 = v19;
      v21[1] = v42;
      ++*(void *)(v7 + 16);
      uint64_t v5 = v47;
      unint64_t v10 = v49;
      int64_t v13 = v50;
    }
  }
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_24BC0(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_4BA0(&qword_39920);
  char v45 = a2;
  uint64_t v6 = sub_2DDC0();
  uint64_t v7 = v6;
  if (*(void *)(v5 + 16))
  {
    uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
    uint64_t v43 = (void *)(v5 + 64);
    if (v8 < 64) {
      uint64_t v9 = ~(-1 << v8);
    }
    else {
      uint64_t v9 = -1;
    }
    unint64_t v10 = v9 & *(void *)(v5 + 64);
    uint64_t v41 = v3;
    int64_t v42 = (unint64_t)(v8 + 63) >> 6;
    uint64_t v11 = v6 + 64;
    uint64_t result = swift_retain();
    int64_t v13 = 0;
    uint64_t v44 = v5;
    while (1)
    {
      if (v10)
      {
        uint64_t v46 = (v10 - 1) & v10;
        int64_t v47 = v13;
        unint64_t v20 = __clz(__rbit64(v10)) | (v13 << 6);
      }
      else
      {
        int64_t v21 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
LABEL_39:
          __break(1u);
LABEL_40:
          __break(1u);
          return result;
        }
        if (v21 >= v42) {
          goto LABEL_33;
        }
        unint64_t v22 = v43[v21];
        int64_t v23 = v13 + 1;
        if (!v22)
        {
          int64_t v23 = v13 + 2;
          if (v13 + 2 >= v42) {
            goto LABEL_33;
          }
          unint64_t v22 = v43[v23];
          if (!v22)
          {
            uint64_t v24 = v13 + 3;
            if (v13 + 3 >= v42)
            {
LABEL_33:
              swift_release();
              uint64_t v3 = v41;
              if (v45)
              {
                uint64_t v40 = 1 << *(unsigned char *)(v5 + 32);
                if (v40 >= 64) {
                  bzero(v43, ((unint64_t)(v40 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  void *v43 = -1 << v40;
                }
                *(void *)(v5 + 16) = 0;
              }
              break;
            }
            unint64_t v22 = v43[v24];
            if (!v22)
            {
              while (1)
              {
                int64_t v23 = v24 + 1;
                if (__OFADD__(v24, 1)) {
                  goto LABEL_40;
                }
                if (v23 >= v42) {
                  goto LABEL_33;
                }
                unint64_t v22 = v43[v23];
                ++v24;
                if (v22) {
                  goto LABEL_30;
                }
              }
            }
            int64_t v23 = v13 + 3;
          }
        }
LABEL_30:
        uint64_t v46 = (v22 - 1) & v22;
        int64_t v47 = v23;
        unint64_t v20 = __clz(__rbit64(v22)) + (v23 << 6);
      }
      uint64_t v29 = *(void *)(v5 + 56);
      uint64_t v30 = (Swift::UInt64 *)(*(void *)(v5 + 48) + 56 * v20);
      Swift::UInt64 v31 = *v30;
      Swift::UInt64 v32 = v30[1];
      Swift::UInt64 v33 = v30[2];
      Swift::UInt64 v34 = v30[3];
      Swift::UInt64 v35 = v30[4];
      Swift::UInt64 v36 = v30[5];
      Swift::UInt64 v37 = v30[6];
      Swift::UInt64 v38 = *(void **)(v29 + 8 * v20);
      if ((v45 & 1) == 0)
      {
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        id v39 = v38;
      }
      sub_2DE90();
      sub_2DEA0(v31);
      swift_bridgeObjectRetain();
      sub_2DA50();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      sub_2DA50();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      sub_2DA50();
      swift_bridgeObjectRelease();
      uint64_t result = sub_2DEB0();
      uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v15 = result & ~v14;
      unint64_t v16 = v15 >> 6;
      if (((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
      {
        unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
        Swift::UInt64 v18 = v31;
      }
      else
      {
        char v25 = 0;
        unint64_t v26 = (unint64_t)(63 - v14) >> 6;
        Swift::UInt64 v18 = v31;
        do
        {
          if (++v16 == v26 && (v25 & 1) != 0)
          {
            __break(1u);
            goto LABEL_39;
          }
          BOOL v27 = v16 == v26;
          if (v16 == v26) {
            unint64_t v16 = 0;
          }
          v25 |= v27;
          uint64_t v28 = *(void *)(v11 + 8 * v16);
        }
        while (v28 == -1);
        unint64_t v17 = __clz(__rbit64(~v28)) + (v16 << 6);
      }
      *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
      uint64_t v19 = (Swift::UInt64 *)(*(void *)(v7 + 48) + 56 * v17);
      *uint64_t v19 = v18;
      v19[1] = v32;
      v19[2] = v33;
      v19[3] = v34;
      v19[4] = v35;
      v19[5] = v36;
      v19[6] = v37;
      *(void *)(*(void *)(v7 + 56) + 8 * v17) = v38;
      ++*(void *)(v7 + 16);
      uint64_t v5 = v44;
      unint64_t v10 = v46;
      int64_t v13 = v47;
    }
  }
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

unint64_t sub_24F84(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_2DCC0();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        sub_2DE90();
        swift_bridgeObjectRetain();
        sub_2DA50();
        Swift::Int v10 = sub_2DEB0();
        uint64_t result = swift_bridgeObjectRelease();
        unint64_t v11 = v10 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v11 < v8) {
            goto LABEL_5;
          }
        }
        else if (v11 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v11)
        {
LABEL_11:
          uint64_t v12 = *(void *)(a2 + 48);
          int64_t v13 = (_OWORD *)(v12 + 16 * v3);
          uint64_t v14 = (_OWORD *)(v12 + 16 * v6);
          if (v3 != v6 || v13 >= v14 + 1) {
            *int64_t v13 = *v14;
          }
          uint64_t v15 = *(void *)(a2 + 56);
          unint64_t v16 = v15 + 24 * v3;
          unint64_t v17 = (long long *)(v15 + 24 * v6);
          if (v3 != v6 || (int64_t v3 = v6, v16 >= (unint64_t)v17 + 24))
          {
            long long v9 = *v17;
            *(void *)(v16 + 16) = *((void *)v17 + 2);
            *(_OWORD *)unint64_t v16 = v9;
            int64_t v3 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    Swift::UInt64 v18 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v19 = *v18;
    uint64_t v20 = (-1 << v3) - 1;
  }
  else
  {
    Swift::UInt64 v18 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v20 = *v18;
    uint64_t v19 = (-1 << result) - 1;
  }
  *Swift::UInt64 v18 = v20 & v19;
  uint64_t v21 = *(void *)(a2 + 16);
  BOOL v22 = __OFSUB__(v21, 1);
  uint64_t v23 = v21 - 1;
  if (v22)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v23;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_25170(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_2DCC0();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        sub_2C5F8(*(void *)(a2 + 48) + 40 * v6, (uint64_t)v28);
        Swift::Int v10 = sub_2DCD0(*(void *)(a2 + 40));
        uint64_t result = sub_27204((uint64_t)v28);
        Swift::Int v11 = v10 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v11 >= v8 && v3 >= v11)
          {
LABEL_16:
            uint64_t v14 = *(void *)(a2 + 48);
            unint64_t v15 = v14 + 40 * v3;
            unint64_t v16 = (long long *)(v14 + 40 * v6);
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
        else if (v11 >= v8 || v3 >= v11)
        {
          goto LABEL_16;
        }
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    BOOL v22 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v23 = *v22;
    uint64_t v24 = (-1 << v3) - 1;
  }
  else
  {
    BOOL v22 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v24 = *v22;
    uint64_t v23 = (-1 << result) - 1;
  }
  *BOOL v22 = v24 & v23;
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

unint64_t sub_2533C(unint64_t result, uint64_t a2)
{
  uint64_t v2 = a2;
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_2DCC0();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      uint64_t v26 = v4;
      uint64_t v27 = v2;
      unint64_t v28 = (result + 1) & v7;
      do
      {
        Swift::UInt64 v8 = *(void *)(*(void *)(v2 + 48) + 56 * v6);
        sub_2DE90();
        sub_2DEA0(v8);
        swift_bridgeObjectRetain_n();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        sub_2DA50();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRetain();
        sub_2DA50();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRetain();
        sub_2DA50();
        swift_bridgeObjectRelease();
        Swift::Int v9 = sub_2DEB0();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t result = swift_bridgeObjectRelease();
        Swift::Int v10 = v9 & v7;
        if (v3 >= (uint64_t)v28)
        {
          if (v10 < v28)
          {
            uint64_t v4 = v26;
            uint64_t v2 = v27;
          }
          else
          {
            uint64_t v4 = v26;
            uint64_t v2 = v27;
            if (v3 >= v10) {
              goto LABEL_12;
            }
          }
        }
        else
        {
          uint64_t v4 = v26;
          uint64_t v2 = v27;
          if (v10 >= v28 || v3 >= v10)
          {
LABEL_12:
            uint64_t v11 = *(void *)(v2 + 48);
            unint64_t v12 = v11 + 56 * v3;
            int64_t v13 = (long long *)(v11 + 56 * v6);
            if (v3 != v6 || v12 >= (unint64_t)v13 + 56)
            {
              long long v14 = *v13;
              long long v15 = v13[1];
              long long v16 = v13[2];
              *(void *)(v12 + 48) = *((void *)v13 + 6);
              *(_OWORD *)(v12 + 16) = v15;
              *(_OWORD *)(v12 + 32) = v16;
              *(_OWORD *)unint64_t v12 = v14;
            }
            uint64_t v17 = *(void *)(v2 + 56);
            long long v18 = (_OWORD *)(v17 + 16 * v3);
            uint64_t v19 = (_OWORD *)(v17 + 16 * v6);
            if (v3 != v6 || (int64_t v3 = v6, v18 >= v19 + 1))
            {
              *long long v18 = *v19;
              int64_t v3 = v6;
            }
          }
        }
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    uint64_t v20 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v21 = *v20;
    uint64_t v22 = (-1 << v3) - 1;
  }
  else
  {
    uint64_t v20 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v22 = *v20;
    uint64_t v21 = (-1 << result) - 1;
  }
  *uint64_t v20 = v22 & v21;
  uint64_t v23 = *(void *)(v2 + 16);
  BOOL v24 = __OFSUB__(v23, 1);
  uint64_t v25 = v23 - 1;
  if (v24)
  {
    __break(1u);
  }
  else
  {
    *(void *)(v2 + 16) = v25;
    ++*(_DWORD *)(v2 + 36);
  }
  return result;
}

unint64_t sub_255EC(unint64_t result, uint64_t a2)
{
  uint64_t v2 = a2;
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_2DCC0();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      uint64_t v26 = v4;
      uint64_t v27 = v2;
      unint64_t v28 = (result + 1) & v7;
      do
      {
        Swift::UInt64 v8 = *(void *)(*(void *)(v2 + 48) + 56 * v6);
        sub_2DE90();
        sub_2DEA0(v8);
        swift_bridgeObjectRetain_n();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        sub_2DA50();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRetain();
        sub_2DA50();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRetain();
        sub_2DA50();
        swift_bridgeObjectRelease();
        Swift::Int v9 = sub_2DEB0();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t result = swift_bridgeObjectRelease();
        Swift::Int v10 = v9 & v7;
        if (v3 >= (uint64_t)v28)
        {
          if (v10 < v28)
          {
            uint64_t v4 = v26;
            uint64_t v2 = v27;
          }
          else
          {
            uint64_t v4 = v26;
            uint64_t v2 = v27;
            if (v3 >= v10) {
              goto LABEL_12;
            }
          }
        }
        else
        {
          uint64_t v4 = v26;
          uint64_t v2 = v27;
          if (v10 >= v28 || v3 >= v10)
          {
LABEL_12:
            uint64_t v11 = *(void *)(v2 + 48);
            unint64_t v12 = v11 + 56 * v3;
            int64_t v13 = (long long *)(v11 + 56 * v6);
            if (v3 != v6 || v12 >= (unint64_t)v13 + 56)
            {
              long long v14 = *v13;
              long long v15 = v13[1];
              long long v16 = v13[2];
              *(void *)(v12 + 48) = *((void *)v13 + 6);
              *(_OWORD *)(v12 + 16) = v15;
              *(_OWORD *)(v12 + 32) = v16;
              *(_OWORD *)unint64_t v12 = v14;
            }
            uint64_t v17 = *(void *)(v2 + 56);
            long long v18 = (void *)(v17 + 8 * v3);
            uint64_t v19 = (void *)(v17 + 8 * v6);
            if (v3 != v6 || (int64_t v3 = v6, v18 >= v19 + 1))
            {
              *long long v18 = *v19;
              int64_t v3 = v6;
            }
          }
        }
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    uint64_t v20 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v21 = *v20;
    uint64_t v22 = (-1 << v3) - 1;
  }
  else
  {
    uint64_t v20 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v22 = *v20;
    uint64_t v21 = (-1 << result) - 1;
  }
  *uint64_t v20 = v22 & v21;
  uint64_t v23 = *(void *)(v2 + 16);
  BOOL v24 = __OFSUB__(v23, 1);
  uint64_t v25 = v23 - 1;
  if (v24)
  {
    __break(1u);
  }
  else
  {
    *(void *)(v2 + 16) = v25;
    ++*(_DWORD *)(v2 + 36);
  }
  return result;
}

void sub_2589C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  uint64_t v7 = v6;
  uint64_t v14 = *v6;
  unint64_t v16 = sub_232B8(a4, a5);
  uint64_t v17 = *(void *)(v14 + 16);
  BOOL v18 = (v15 & 1) == 0;
  uint64_t v19 = v17 + v18;
  if (__OFADD__(v17, v18))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v20 = v15;
  uint64_t v21 = *(void *)(v14 + 24);
  if (v21 >= v19 && (a6 & 1) != 0) {
    goto LABEL_7;
  }
  if (v21 >= v19 && (a6 & 1) == 0)
  {
    sub_2622C();
LABEL_7:
    uint64_t v22 = (void *)*v7;
    if (v20)
    {
LABEL_8:
      uint64_t v23 = (void *)(v22[7] + 24 * v16);
      BOOL v24 = (void *)v23[2];
      swift_bridgeObjectRelease();

      *uint64_t v23 = a1;
      v23[1] = a2;
      v23[2] = a3;
      return;
    }
    goto LABEL_11;
  }
  sub_23B3C(v19, a6 & 1);
  unint64_t v25 = sub_232B8(a4, a5);
  if ((v20 & 1) != (v26 & 1))
  {
LABEL_17:
    sub_2DE30();
    __break(1u);
    return;
  }
  unint64_t v16 = v25;
  uint64_t v22 = (void *)*v7;
  if (v20) {
    goto LABEL_8;
  }
LABEL_11:
  v22[(v16 >> 6) + 8] |= 1 << v16;
  uint64_t v27 = (uint64_t *)(v22[6] + 16 * v16);
  uint64_t *v27 = a4;
  v27[1] = a5;
  unint64_t v28 = (void *)(v22[7] + 24 * v16);
  void *v28 = a1;
  v28[1] = a2;
  void v28[2] = a3;
  uint64_t v29 = v22[2];
  BOOL v30 = __OFADD__(v29, 1);
  uint64_t v31 = v29 + 1;
  if (v30)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  _OWORD v22[2] = v31;

  swift_bridgeObjectRetain();
}

_OWORD *sub_25A38(_OWORD *a1, uint64_t a2, char a3)
{
  uint64_t v4 = (void **)v3;
  Swift::UInt64 v8 = (void *)*v3;
  unint64_t v10 = sub_23330(a2);
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
      sub_26410();
      goto LABEL_7;
    }
    sub_23E80(v13, a3 & 1);
    unint64_t v19 = sub_23330(a2);
    if ((v14 & 1) == (v20 & 1))
    {
      unint64_t v10 = v19;
      unint64_t v16 = *v4;
      if (v14) {
        goto LABEL_8;
      }
LABEL_13:
      sub_2C5F8(a2, (uint64_t)v21);
      return sub_26148(v10, (uint64_t)v21, a1, v16);
    }
LABEL_15:
    uint64_t result = (_OWORD *)sub_2DE30();
    __break(1u);
    return result;
  }
LABEL_7:
  unint64_t v16 = *v4;
  if ((v14 & 1) == 0) {
    goto LABEL_13;
  }
LABEL_8:
  uint64_t v17 = (_OWORD *)(v16[7] + 32 * v10);
  sub_2CA70((uint64_t)v17);

  return sub_2C65C(a1, v17);
}

uint64_t sub_25B84(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = *v4;
  unint64_t v12 = sub_232B8(a2, a3);
  uint64_t v13 = *(void *)(v10 + 16);
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_18;
  }
  char v16 = v11;
  uint64_t v17 = *(void *)(v10 + 24);
  if (v17 >= v15 && (a4 & 1) != 0) {
    goto LABEL_7;
  }
  if (v17 >= v15 && (a4 & 1) == 0)
  {
    sub_265F8();
LABEL_7:
    BOOL v18 = (void *)*v5;
    if (v16)
    {
LABEL_8:
      uint64_t v19 = v18[7] + 40 * v12;
      return sub_2CC74(a1, v19);
    }
    goto LABEL_13;
  }
  sub_24198(v15, a4 & 1);
  unint64_t v21 = sub_232B8(a2, a3);
  if ((v16 & 1) != (v22 & 1))
  {
LABEL_19:
    uint64_t result = sub_2DE30();
    __break(1u);
    return result;
  }
  unint64_t v12 = v21;
  BOOL v18 = (void *)*v5;
  if (v16) {
    goto LABEL_8;
  }
LABEL_13:
  v18[(v12 >> 6) + 8] |= 1 << v12;
  uint64_t v23 = (uint64_t *)(v18[6] + 16 * v12);
  *uint64_t v23 = a2;
  v23[1] = a3;
  uint64_t v24 = v18[7] + 40 * v12;
  long long v25 = *(_OWORD *)a1;
  long long v26 = *(_OWORD *)(a1 + 16);
  *(void *)(v24 + 32) = *(void *)(a1 + 32);
  *(_OWORD *)uint64_t v24 = v25;
  *(_OWORD *)(v24 + 16) = v26;
  uint64_t v27 = v18[2];
  BOOL v28 = __OFADD__(v27, 1);
  uint64_t v29 = v27 + 1;
  if (v28)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  v18[2] = v29;

  return swift_bridgeObjectRetain();
}

void sub_25D14(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = *v4;
  unint64_t v12 = sub_232B8(a2, a3);
  uint64_t v13 = *(void *)(v10 + 16);
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v16 = v11;
  uint64_t v17 = *(void *)(v10 + 24);
  if (v17 >= v15 && (a4 & 1) != 0) {
    goto LABEL_7;
  }
  if (v17 >= v15 && (a4 & 1) == 0)
  {
    sub_267F0();
LABEL_7:
    BOOL v18 = (void *)*v5;
    if (v16)
    {
LABEL_8:
      uint64_t v19 = v18[7];

      *(void *)(v19 + 8 * v12) = a1;
      return;
    }
    goto LABEL_11;
  }
  sub_244D0(v15, a4 & 1);
  unint64_t v20 = sub_232B8(a2, a3);
  if ((v16 & 1) != (v21 & 1))
  {
LABEL_17:
    sub_2DE30();
    __break(1u);
    return;
  }
  unint64_t v12 = v20;
  BOOL v18 = (void *)*v5;
  if (v16) {
    goto LABEL_8;
  }
LABEL_11:
  v18[(v12 >> 6) + 8] |= 1 << v12;
  char v22 = (uint64_t *)(v18[6] + 16 * v12);
  *char v22 = a2;
  v22[1] = a3;
  *(void *)(v18[7] + 8 * v12) = a1;
  uint64_t v23 = v18[2];
  BOOL v24 = __OFADD__(v23, 1);
  uint64_t v25 = v23 + 1;
  if (v24)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v18[2] = v25;

  swift_bridgeObjectRetain();
}

uint64_t sub_25E84(uint64_t a1, Swift::UInt64 *a2, char a3, double a4)
{
  uint64_t v5 = (void **)v4;
  uint64_t v10 = (void *)*v4;
  unint64_t v12 = sub_231E0(a2);
  uint64_t v13 = v10[2];
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_15;
  }
  char v16 = v11;
  uint64_t v17 = v10[3];
  if (v17 >= v15 && (a3 & 1) != 0)
  {
LABEL_7:
    BOOL v18 = *v5;
    if (v16)
    {
LABEL_8:
      uint64_t v19 = v18[7] + 16 * v12;
      uint64_t result = swift_bridgeObjectRelease();
      *(void *)uint64_t v19 = a1;
      *(double *)(v19 + 8) = a4;
      return result;
    }
    goto LABEL_11;
  }
  if (v17 >= v15 && (a3 & 1) == 0)
  {
    sub_269A4();
    goto LABEL_7;
  }
  sub_247E0(v15, a3 & 1);
  unint64_t v21 = sub_231E0(a2);
  if ((v16 & 1) != (v22 & 1))
  {
LABEL_15:
    uint64_t result = sub_2DE30();
    __break(1u);
    return result;
  }
  unint64_t v12 = v21;
  BOOL v18 = *v5;
  if (v16) {
    goto LABEL_8;
  }
LABEL_11:
  sub_261C4(v12, (uint64_t)a2, a1, v18, a4);

  return sub_2BBDC((uint64_t)a2);
}

void sub_25FCC(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = *v3;
  unint64_t v10 = sub_231E0((Swift::UInt64 *)a2);
  uint64_t v11 = *(void *)(v8 + 16);
  BOOL v12 = (v9 & 1) == 0;
  uint64_t v13 = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v14 = v9;
  uint64_t v15 = *(void *)(v8 + 24);
  if (v15 >= v13 && (a3 & 1) != 0) {
    goto LABEL_7;
  }
  if (v15 >= v13 && (a3 & 1) == 0)
  {
    sub_26BA0();
LABEL_7:
    char v16 = (void *)*v4;
    if (v14)
    {
LABEL_8:
      uint64_t v17 = v16[7];

      *(void *)(v17 + 8 * v10) = a1;
      return;
    }
    goto LABEL_11;
  }
  sub_24BC0(v13, a3 & 1);
  unint64_t v18 = sub_231E0((Swift::UInt64 *)a2);
  if ((v14 & 1) != (v19 & 1))
  {
LABEL_17:
    sub_2DE30();
    __break(1u);
    return;
  }
  unint64_t v10 = v18;
  char v16 = (void *)*v4;
  if (v14) {
    goto LABEL_8;
  }
LABEL_11:
  v16[(v10 >> 6) + 8] |= 1 << v10;
  uint64_t v20 = v16[6] + 56 * v10;
  long long v21 = *(_OWORD *)a2;
  long long v22 = *(_OWORD *)(a2 + 16);
  long long v23 = *(_OWORD *)(a2 + 32);
  *(void *)(v20 + 48) = *(void *)(a2 + 48);
  *(_OWORD *)(v20 + 16) = v22;
  *(_OWORD *)(v20 + 32) = v23;
  *(_OWORD *)uint64_t v20 = v21;
  *(void *)(v16[7] + 8 * v10) = a1;
  uint64_t v24 = v16[2];
  BOOL v25 = __OFADD__(v24, 1);
  uint64_t v26 = v24 + 1;
  if (v25)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  _DWORD v16[2] = v26;

  sub_2BBDC(a2);
}

_OWORD *sub_26148(unint64_t a1, uint64_t a2, _OWORD *a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v5 = a4[6] + 40 * a1;
  long long v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)uint64_t v5 = *(_OWORD *)a2;
  *(_OWORD *)(v5 + 16) = v6;
  *(void *)(v5 + 32) = *(void *)(a2 + 32);
  uint64_t result = sub_2C65C(a3, (_OWORD *)(a4[7] + 32 * a1));
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

unint64_t sub_261C4(unint64_t result, uint64_t a2, uint64_t a3, void *a4, double a5)
{
  a4[(result >> 6) + 8] |= 1 << result;
  uint64_t v5 = a4[6] + 56 * result;
  long long v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)uint64_t v5 = *(_OWORD *)a2;
  *(_OWORD *)(v5 + 16) = v6;
  *(_OWORD *)(v5 + 32) = *(_OWORD *)(a2 + 32);
  *(void *)(v5 + 48) = *(void *)(a2 + 48);
  uint64_t v7 = a4[7] + 16 * result;
  *(void *)uint64_t v7 = a3;
  *(double *)(v7 + 8) = a5;
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

void *sub_2622C()
{
  uint64_t v1 = v0;
  sub_4BA0(&qword_399E8);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_2DDB0();
  uint64_t v4 = v3;
  uint64_t v5 = *(void *)(v2 + 16);
  if (!v5)
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 64);
  uint64_t v7 = v2 + 64;
  unint64_t v8 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v8)
  {
    uint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v8);
    uint64_t v5 = *(void *)(v2 + 16);
  }
  int64_t v10 = 0;
  *(void *)(v4 + 16) = v5;
  uint64_t v11 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & *(void *)(v2 + 64);
  int64_t v14 = (unint64_t)(v11 + 63) >> 6;
  while (1)
  {
    if (v13)
    {
      unint64_t v15 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v16 = v15 | (v10 << 6);
      goto LABEL_12;
    }
    int64_t v28 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v28 >= v14) {
      goto LABEL_26;
    }
    unint64_t v29 = *(void *)(v7 + 8 * v28);
    ++v10;
    if (!v29)
    {
      int64_t v10 = v28 + 1;
      if (v28 + 1 >= v14) {
        goto LABEL_26;
      }
      unint64_t v29 = *(void *)(v7 + 8 * v10);
      if (!v29) {
        break;
      }
    }
LABEL_25:
    unint64_t v13 = (v29 - 1) & v29;
    unint64_t v16 = __clz(__rbit64(v29)) + (v10 << 6);
LABEL_12:
    uint64_t v17 = 16 * v16;
    unint64_t v18 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v16);
    uint64_t v19 = *v18;
    uint64_t v20 = v18[1];
    uint64_t v21 = 24 * v16;
    uint64_t v22 = *(void *)(v2 + 56) + v21;
    uint64_t v23 = *(void *)v22;
    uint64_t v24 = (void *)(*(void *)(v4 + 48) + v17);
    long long v25 = *(_OWORD *)(v22 + 8);
    void *v24 = v19;
    v24[1] = v20;
    uint64_t v26 = *(void *)(v4 + 56) + v21;
    *(void *)uint64_t v26 = v23;
    *(_OWORD *)(v26 + 8) = v25;
    id v27 = *((id *)&v25 + 1);
    swift_bridgeObjectRetain();
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v30 = v28 + 2;
  if (v30 >= v14) {
    goto LABEL_26;
  }
  unint64_t v29 = *(void *)(v7 + 8 * v30);
  if (v29)
  {
    int64_t v10 = v30;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v10 = v30 + 1;
    if (__OFADD__(v30, 1)) {
      break;
    }
    if (v10 >= v14) {
      goto LABEL_26;
    }
    unint64_t v29 = *(void *)(v7 + 8 * v10);
    ++v30;
    if (v29) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_26410()
{
  uint64_t v1 = v0;
  sub_4BA0(&qword_39940);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_2DDB0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
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
    sub_2C5F8(*(void *)(v2 + 48) + 40 * v15, (uint64_t)v25);
    uint64_t v17 = 32 * v15;
    sub_27554(*(void *)(v2 + 56) + v17, (uint64_t)v24);
    uint64_t v18 = *(void *)(v4 + 48) + v16;
    long long v19 = v25[0];
    long long v20 = v25[1];
    *(void *)(v18 + 32) = v26;
    *(_OWORD *)uint64_t v18 = v19;
    *(_OWORD *)(v18 + 16) = v20;
    uint64_t result = sub_2C65C(v24, (_OWORD *)(*(void *)(v4 + 56) + v17));
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

void *sub_265F8()
{
  uint64_t v1 = v0;
  sub_4BA0(&qword_399D0);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_2DDB0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = (void *)swift_release();
LABEL_28:
    uint64_t *v1 = v4;
    return result;
  }
  int64_t v28 = v1;
  uint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
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
    int64_t v25 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v25 >= v13) {
      goto LABEL_26;
    }
    unint64_t v26 = *(void *)(v6 + 8 * v25);
    ++v9;
    if (!v26)
    {
      int64_t v9 = v25 + 1;
      if (v25 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v26 = *(void *)(v6 + 8 * v9);
      if (!v26) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v26 - 1) & v26;
    unint64_t v15 = __clz(__rbit64(v26)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    uint64_t v20 = 40 * v15;
    sub_2C5F8(*(void *)(v2 + 56) + 40 * v15, (uint64_t)v29);
    int64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *int64_t v21 = v19;
    v21[1] = v18;
    uint64_t v22 = *(void *)(v4 + 56) + v20;
    uint64_t v23 = v30;
    long long v24 = v29[1];
    *(_OWORD *)uint64_t v22 = v29[0];
    *(_OWORD *)(v22 + 16) = v24;
    *(void *)(v22 + 32) = v23;
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v27 = v25 + 2;
  if (v27 >= v13)
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    uint64_t v1 = v28;
    goto LABEL_28;
  }
  unint64_t v26 = *(void *)(v6 + 8 * v27);
  if (v26)
  {
    int64_t v9 = v27;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v27 + 1;
    if (__OFADD__(v27, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v26 = *(void *)(v6 + 8 * v9);
    ++v27;
    if (v26) {
      goto LABEL_25;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

id sub_267F0()
{
  uint64_t v1 = v0;
  sub_4BA0(&qword_398A8);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_2DDB0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (id)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  id result = (id)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 64), 8 * v7);
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
    int64_t v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v22 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      int64_t v9 = v22 + 1;
      if (v22 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v23 = *(void *)(v6 + 8 * v9);
      if (!v23) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v23 - 1) & v23;
    unint64_t v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (void *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v18 = v17[1];
    uint64_t v19 = 8 * v15;
    uint64_t v20 = *(void **)(*(void *)(v2 + 56) + v19);
    int64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *int64_t v21 = *v17;
    v21[1] = v18;
    *(void *)(*(void *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    id result = v20;
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v13) {
    goto LABEL_26;
  }
  unint64_t v23 = *(void *)(v6 + 8 * v24);
  if (v23)
  {
    int64_t v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v9);
    ++v24;
    if (v23) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_269A4()
{
  uint64_t v1 = v0;
  sub_4BA0(&qword_398B8);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_2DDB0();
  uint64_t v4 = v3;
  uint64_t v5 = *(void *)(v2 + 16);
  if (!v5)
  {
LABEL_26:
    id result = (void *)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  id result = (void *)(v3 + 64);
  uint64_t v7 = v2 + 64;
  unint64_t v8 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v8)
  {
    id result = memmove(result, (const void *)(v2 + 64), 8 * v8);
    uint64_t v5 = *(void *)(v2 + 16);
  }
  int64_t v10 = 0;
  *(void *)(v4 + 16) = v5;
  uint64_t v11 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & *(void *)(v2 + 64);
  int64_t v14 = (unint64_t)(v11 + 63) >> 6;
  while (1)
  {
    if (v13)
    {
      unint64_t v15 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v16 = v15 | (v10 << 6);
      goto LABEL_12;
    }
    int64_t v30 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v30 >= v14) {
      goto LABEL_26;
    }
    unint64_t v31 = *(void *)(v7 + 8 * v30);
    ++v10;
    if (!v31)
    {
      int64_t v10 = v30 + 1;
      if (v30 + 1 >= v14) {
        goto LABEL_26;
      }
      unint64_t v31 = *(void *)(v7 + 8 * v10);
      if (!v31) {
        break;
      }
    }
LABEL_25:
    unint64_t v13 = (v31 - 1) & v31;
    unint64_t v16 = __clz(__rbit64(v31)) + (v10 << 6);
LABEL_12:
    uint64_t v17 = 56 * v16;
    uint64_t v18 = *(void *)(v2 + 48) + 56 * v16;
    uint64_t v19 = *(void *)(v18 + 16);
    uint64_t v20 = *(void *)(v18 + 24);
    uint64_t v22 = *(void *)(v18 + 32);
    uint64_t v21 = *(void *)(v18 + 40);
    uint64_t v23 = *(void *)(v18 + 48);
    uint64_t v24 = 16 * v16;
    int64_t v25 = (uint64_t *)(*(void *)(v2 + 56) + v24);
    uint64_t v26 = *v25;
    uint64_t v27 = v25[1];
    uint64_t v28 = *(void *)(v4 + 48) + v17;
    *(_OWORD *)uint64_t v28 = *(_OWORD *)v18;
    *(void *)(v28 + 16) = v19;
    *(void *)(v28 + 24) = v20;
    *(void *)(v28 + 32) = v22;
    *(void *)(v28 + 40) = v21;
    *(void *)(v28 + 48) = v23;
    unint64_t v29 = (void *)(*(void *)(v4 + 56) + v24);
    void *v29 = v26;
    v29[1] = v27;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    id result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v32 = v30 + 2;
  if (v32 >= v14) {
    goto LABEL_26;
  }
  unint64_t v31 = *(void *)(v7 + 8 * v32);
  if (v31)
  {
    int64_t v10 = v32;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v10 = v32 + 1;
    if (__OFADD__(v32, 1)) {
      break;
    }
    if (v10 >= v14) {
      goto LABEL_26;
    }
    unint64_t v31 = *(void *)(v7 + 8 * v10);
    ++v32;
    if (v31) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

id sub_26BA0()
{
  uint64_t v1 = v0;
  sub_4BA0(&qword_39920);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_2DDB0();
  uint64_t v4 = v3;
  uint64_t v5 = *(void *)(v2 + 16);
  if (!v5)
  {
LABEL_26:
    id result = (id)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  id result = (id)(v3 + 64);
  uint64_t v7 = v2 + 64;
  unint64_t v8 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v8)
  {
    id result = memmove(result, (const void *)(v2 + 64), 8 * v8);
    uint64_t v5 = *(void *)(v2 + 16);
  }
  int64_t v10 = 0;
  *(void *)(v4 + 16) = v5;
  uint64_t v11 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & *(void *)(v2 + 64);
  int64_t v14 = (unint64_t)(v11 + 63) >> 6;
  while (1)
  {
    if (v13)
    {
      unint64_t v15 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v16 = v15 | (v10 << 6);
      goto LABEL_12;
    }
    int64_t v28 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v28 >= v14) {
      goto LABEL_26;
    }
    unint64_t v29 = *(void *)(v7 + 8 * v28);
    ++v10;
    if (!v29)
    {
      int64_t v10 = v28 + 1;
      if (v28 + 1 >= v14) {
        goto LABEL_26;
      }
      unint64_t v29 = *(void *)(v7 + 8 * v10);
      if (!v29) {
        break;
      }
    }
LABEL_25:
    unint64_t v13 = (v29 - 1) & v29;
    unint64_t v16 = __clz(__rbit64(v29)) + (v10 << 6);
LABEL_12:
    unint64_t v17 = v16 << 6;
    uint64_t v18 = 8 * v16;
    unint64_t v19 = v17 - v18;
    unint64_t v20 = *(void *)(v2 + 48) + v19;
    uint64_t v21 = *(void *)(v20 + 16);
    uint64_t v22 = *(void *)(v20 + 24);
    uint64_t v24 = *(void *)(v20 + 32);
    uint64_t v23 = *(void *)(v20 + 40);
    uint64_t v25 = *(void *)(v20 + 48);
    uint64_t v26 = *(void **)(*(void *)(v2 + 56) + v18);
    unint64_t v27 = *(void *)(v4 + 48) + v19;
    *(_OWORD *)unint64_t v27 = *(_OWORD *)v20;
    *(void *)(v27 + 16) = v21;
    *(void *)(v27 + 24) = v22;
    *(void *)(v27 + 32) = v24;
    *(void *)(v27 + 40) = v23;
    *(void *)(v27 + 48) = v25;
    *(void *)(*(void *)(v4 + 56) + v18) = v26;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    id result = v26;
  }
  int64_t v30 = v28 + 2;
  if (v30 >= v14) {
    goto LABEL_26;
  }
  unint64_t v29 = *(void *)(v7 + 8 * v30);
  if (v29)
  {
    int64_t v10 = v30;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v10 = v30 + 1;
    if (__OFADD__(v30, 1)) {
      break;
    }
    if (v10 >= v14) {
      goto LABEL_26;
    }
    unint64_t v29 = *(void *)(v7 + 8 * v10);
    ++v30;
    if (v29) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_26D88(void *a1, void *a2)
{
  if (*a1 != *a2) {
    return 0;
  }
  BOOL v4 = a1[1] == a2[1] && a1[2] == a2[2];
  if (v4 || (v5 = sub_2DE10(), uint64_t result = 0, (v5 & 1) != 0))
  {
    BOOL v7 = a1[3] == a2[3] && a1[4] == a2[4];
    if (v7 || (char v8 = sub_2DE10(), result = 0, (v8 & 1) != 0))
    {
      if (a1[5] == a2[5] && a1[6] == a2[6])
      {
        return 1;
      }
      else
      {
        return sub_2DE10();
      }
    }
  }
  return result;
}

Swift::Int sub_26E54(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    sub_4BA0(&qword_39A18);
    uint64_t v3 = sub_2DD00();
    uint64_t v4 = 0;
    uint64_t v5 = v3 + 56;
    uint64_t v6 = a1 + 32;
    while (1)
    {
      sub_2C5F8(v6 + 40 * v4, (uint64_t)v21);
      Swift::Int result = sub_2DCD0(*(void *)(v3 + 40));
      uint64_t v8 = ~(-1 << *(unsigned char *)(v3 + 32));
      unint64_t v9 = result & v8;
      unint64_t v10 = (result & (unint64_t)v8) >> 6;
      uint64_t v11 = *(void *)(v5 + 8 * v10);
      uint64_t v12 = 1 << (result & v8);
      if ((v12 & v11) != 0)
      {
        while (1)
        {
          sub_2C5F8(*(void *)(v3 + 48) + 40 * v9, (uint64_t)v20);
          char v13 = sub_2DCE0();
          Swift::Int result = sub_27204((uint64_t)v20);
          if (v13) {
            break;
          }
          unint64_t v9 = (v9 + 1) & v8;
          unint64_t v10 = v9 >> 6;
          uint64_t v11 = *(void *)(v5 + 8 * (v9 >> 6));
          uint64_t v12 = 1 << v9;
          if ((v11 & (1 << v9)) == 0) {
            goto LABEL_8;
          }
        }
        sub_27204((uint64_t)v21);
      }
      else
      {
LABEL_8:
        *(void *)(v5 + 8 * v10) = v12 | v11;
        uint64_t v14 = *(void *)(v3 + 48) + 40 * v9;
        long long v15 = v21[0];
        long long v16 = v21[1];
        *(void *)(v14 + 32) = v22;
        *(_OWORD *)uint64_t v14 = v15;
        *(_OWORD *)(v14 + 16) = v16;
        uint64_t v17 = *(void *)(v3 + 16);
        BOOL v18 = __OFADD__(v17, 1);
        uint64_t v19 = v17 + 1;
        if (v18)
        {
          __break(1u);
          return result;
        }
        *(void *)(v3 + 16) = v19;
      }
      if (++v4 == v1) {
        return v3;
      }
    }
  }
  return (Swift::Int)&_swiftEmptySetSingleton;
}

Swift::Int _s19AXHapticMusicServerAAC48possibleRequiredEntitlementsForProcessingMessage14withIdentifierShys11AnyHashableVGSgSi_tFZ_0(uint64_t a1)
{
  Swift::Int v1 = 0;
  switch(a1)
  {
    case 1:
    case 6:
      sub_4BA0(&qword_39A10);
      uint64_t inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_2E950;
      sub_2DCF0();
      Swift::Int v1 = sub_26E54(inited);
      swift_setDeallocating();
      goto LABEL_4;
    case 4:
    case 5:
      sub_4BA0(&qword_39A10);
      uint64_t v2 = swift_initStackObject();
      *(_OWORD *)(v2 + 16) = xmmword_2E960;
      sub_2DCF0();
      sub_2DCF0();
      Swift::Int v1 = sub_26E54(v2);
      swift_setDeallocating();
LABEL_4:
      swift_arrayDestroy();
      break;
    default:
      return v1;
  }
  return v1;
}

uint64_t sub_27204(uint64_t a1)
{
  return a1;
}

uint64_t sub_27258()
{
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 56, 7);
}

uint64_t sub_272A0()
{
  long long v5 = *(_OWORD *)(v0 + 32);
  uint64_t v2 = *(void *)(v0 + 48);
  uint64_t v3 = swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *(void *)uint64_t v3 = v1;
  *(void *)(v3 + 8) = sub_2D7AC;
  *(void *)(v3 + 56) = v2;
  *(_OWORD *)(v3 + 40) = v5;
  return ((uint64_t (*)(uint64_t (*)(), void, void))_swift_task_switch)(sub_10280, 0, 0);
}

uint64_t sub_27360()
{
  long long v7 = *(_OWORD *)(v0 + 32);
  uint64_t v2 = *(void *)(v0 + 48);
  uint64_t v3 = *(void *)(v0 + 56);
  uint64_t v4 = swift_task_alloc();
  long long v5 = *(_OWORD *)(v0 + 64);
  *(void *)(v1 + 16) = v4;
  *(void *)uint64_t v4 = v1;
  *(void *)(v4 + 8) = sub_2D7AC;
  *(_OWORD *)(v4 + 72) = v5;
  *(void *)(v4 + 56) = v2;
  *(void *)(v4 + 64) = v3;
  *(_OWORD *)(v4 + 40) = v7;
  return ((uint64_t (*)(uint64_t (*)(), void, void))_swift_task_switch)(sub_100B0, 0, 0);
}

uint64_t sub_27430()
{
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 80, 7);
}

uint64_t sub_27488()
{
  long long v7 = *(_OWORD *)(v0 + 32);
  uint64_t v2 = *(void *)(v0 + 48);
  uint64_t v3 = *(void *)(v0 + 56);
  uint64_t v4 = swift_task_alloc();
  long long v5 = *(_OWORD *)(v0 + 64);
  *(void *)(v1 + 16) = v4;
  *(void *)uint64_t v4 = v1;
  *(void *)(v4 + 8) = sub_2D7AC;
  *(_OWORD *)(v4 + 128) = v5;
  *(void *)(v4 + 112) = v2;
  *(void *)(v4 + 120) = v3;
  *(_OWORD *)(v4 + 96) = v7;
  return ((uint64_t (*)(uint64_t (*)(), void, void))_swift_task_switch)(sub_F5AC, 0, 0);
}

uint64_t sub_27554(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_275B0()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 80, 7);
}

void sub_27608()
{
  sub_EC28(*(void *)(v0 + 24), *(void *)(v0 + 32), (int)[*(id *)(v0 + 40) BOOLValue], *(void *)(v0 + 48), *(void (**)(char *, uint64_t))(v0 + 56), *(void *)(v0 + 64), *(void *)(v0 + 72));
}

uint64_t sub_2767C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_2768C()
{
  return swift_release();
}

uint64_t sub_27694(unint64_t *a1, void (*a2)(uint64_t))
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

void sub_276DC()
{
}

uint64_t sub_27700()
{
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 88, 7);
}

uint64_t sub_27758()
{
  uint64_t v2 = v0[5];
  uint64_t v3 = v0[6];
  uint64_t v4 = v0[7];
  uint64_t v5 = v0[8];
  uint64_t v7 = v0[9];
  uint64_t v6 = v0[10];
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v8;
  *uint64_t v8 = v1;
  v8[1] = sub_27864;
  unint64_t v9 = (void *)swift_task_alloc();
  v8[2] = v9;
  *unint64_t v9 = v8;
  v9[1] = sub_2D7AC;
  return sub_285E0(v2, v3, v4, v5, v7, v6);
}

uint64_t sub_27864()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

void sub_27958()
{
  sub_20C84(*(unsigned char *)(v0 + 16));
}

uint64_t type metadata accessor for HapticMusicSiriActionSource()
{
  return self;
}

uint64_t type metadata accessor for AXHapticMusicServer()
{
  return self;
}

void *initializeBufferWithCopyOfBuffer for AXHapticMusicError(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for AXHapticMusicError()
{
  return swift_bridgeObjectRelease();
}

void *assignWithCopy for AXHapticMusicError(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 initializeWithTake for AXHapticMusicServer.HapticCacheItem(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

void *assignWithTake for AXHapticMusicError(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for AXHapticMusicError(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for AXHapticMusicError(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for AXHapticMusicError()
{
  return &type metadata for AXHapticMusicError;
}

void destroy for AXHapticMusicServer.StatusObservers.StatusData(uint64_t a1)
{
  swift_bridgeObjectRelease();
  unint64_t v2 = *(void **)(a1 + 16);
}

void *_s19AXHapticMusicServer19AXHapticMusicServerC15StatusObserversC10StatusDataVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = (void *)a2[2];
  a1[2] = v4;
  swift_bridgeObjectRetain();
  id v5 = v4;
  return a1;
}

void *assignWithCopy for AXHapticMusicServer.StatusObservers.StatusData(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = (void *)a1[2];
  id v5 = (void *)a2[2];
  a1[2] = v5;
  id v6 = v5;

  return a1;
}

__n128 initializeWithTake for AXHapticMusicServer.StatusObservers.StatusData(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for AXHapticMusicServer.StatusObservers.StatusData(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void **)(a1 + 16);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);

  return a1;
}

uint64_t getEnumTagSinglePayload for AXHapticMusicServer.StatusObservers.StatusData(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 24)) {
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

uint64_t storeEnumTagSinglePayload for AXHapticMusicServer.StatusObservers.StatusData(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 24) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 24) = 0;
    }
    if (a2) {
      *(void *)(result + 8) = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AXHapticMusicServer.StatusObservers.StatusData()
{
  return &type metadata for AXHapticMusicServer.StatusObservers.StatusData;
}

void *initializeBufferWithCopyOfBuffer for AXHapticMusicServer.HapticCacheItem(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for AXHapticMusicServer.HapticCacheItem()
{
  return swift_bridgeObjectRelease();
}

void *assignWithCopy for AXHapticMusicServer.HapticCacheItem(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  return a1;
}

void *assignWithTake for AXHapticMusicServer.HapticCacheItem(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  return a1;
}

uint64_t getEnumTagSinglePayload for AXHapticMusicServer.HapticCacheItem(uint64_t *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for AXHapticMusicServer.HapticCacheItem(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for AXHapticMusicServer.HapticCacheItem()
{
  return &type metadata for AXHapticMusicServer.HapticCacheItem;
}

uint64_t initializeBufferWithCopyOfBuffer for AXHapticMusicServer.AXTrackIdentifier(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for AXHapticMusicServer.AXTrackIdentifier()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for AXHapticMusicServer.AXTrackIdentifier(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  uint64_t v3 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v3;
  uint64_t v4 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v4;
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for AXHapticMusicServer.AXTrackIdentifier(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[3] = a2[3];
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[5] = a2[5];
  a1[6] = a2[6];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 initializeWithTake for AXHapticMusicServer.AXTrackIdentifier(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 32);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for AXHapticMusicServer.AXTrackIdentifier(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v5;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for AXHapticMusicServer.AXTrackIdentifier(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 56)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AXHapticMusicServer.AXTrackIdentifier(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 56) = 1;
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
      *(void *)(result + 16) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 56) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AXHapticMusicServer.AXTrackIdentifier()
{
  return &type metadata for AXHapticMusicServer.AXTrackIdentifier;
}

unint64_t sub_280E8()
{
  unint64_t result = qword_39838;
  if (!qword_39838)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_39838);
  }
  return result;
}

void sub_2813C()
{
  uint64_t v1 = *(void *)(v0 + 16);
  id v2 = [objc_allocWithZone((Class)type metadata accessor for HapticMusicSiriActionSource()) initWithDelegate:v1];
  long long v3 = *(void **)(v1 + OBJC_IVAR___AXHapticMusicServer_siriActivationSource);
  *(void *)(v1 + OBJC_IVAR___AXHapticMusicServer_siriActivationSource) = v2;

  sub_993C();
  sub_6984();
}

unint64_t sub_28190()
{
  unint64_t result = qword_39858;
  if (!qword_39858)
  {
    sub_2CAD4(255, &qword_39430);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_39858);
  }
  return result;
}

uint64_t sub_281F8(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_4BE4(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

void type metadata accessor for Name(uint64_t a1)
{
}

uint64_t sub_28250()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

void sub_28288()
{
}

void sub_28290()
{
}

uint64_t sub_282B4()
{
  return sub_60FC();
}

void sub_282C0()
{
  id v1 = *(id *)(*(void *)(v0 + 16) + OBJC_IVAR___AXHapticMusicServer_mediaDomain);
  if (v1) {
    id v1 = [v1 data];
  }
  id v2 = v1;
  sub_64FC(v1);
}

void sub_28328()
{
  sub_9208(*(void *)(v0 + 16), *(void **)(v0 + 24));
}

uint64_t sub_28330()
{
  return _swift_deallocObject(v0, 40, 7);
}

void sub_28370()
{
  sub_8C40(*(void **)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32));
}

uint64_t sub_2837C(uint64_t a1)
{
  return sub_14C38(a1);
}

uint64_t sub_28384()
{
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_283BC()
{
  id v1 = (void *)(*(void *)(v0 + 16) + OBJC_IVAR___AXHapticMusicServer_ahapAvailableCache);
  swift_beginAccess();
  void *v1 = &_swiftEmptyDictionarySingleton;
  return swift_bridgeObjectRelease();
}

void sub_28418()
{
  sub_1A86C(*(void *)(v0 + 16));
}

uint64_t sub_28420(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_4BA0(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_28484()
{
  return _swift_deallocObject(v0, 24, 7);
}

unint64_t sub_28494()
{
  uint64_t v1 = *(void *)(v0 + 16);
  sub_4BA0(&qword_39888);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2E950;
  *(void *)(inited + 32) = 0x6567617355;
  *(void *)(inited + 40) = 0xE500000000000000;
  *(void *)(inited + 48) = [objc_allocWithZone((Class)NSNumber) initWithInteger:v1];
  return sub_5688(inited, &qword_39890);
}

uint64_t sub_28524()
{
  return sub_B270(*(char **)(v0 + 16));
}

uint64_t sub_2852C()
{
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

void sub_2856C(uint64_t a1)
{
  sub_BB78(a1, *(void *)(v1 + 16), *(void (**)(uint64_t))(v1 + 24));
}

uint64_t sub_28578()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_285B0()
{
  return sub_BDDC(*(uint64_t (**)(uint64_t))(v0 + 16));
}

uint64_t sub_285B8(uint64_t a1)
{
  sub_BF9C(a1, *(void *)(v1 + 16));
  return 2;
}

uint64_t sub_285D8()
{
  return sub_B53C(*(void *)(v0 + 16));
}

uint64_t sub_285E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[52] = a5;
  v6[53] = a6;
  v6[50] = a3;
  v6[51] = a4;
  v6[48] = a1;
  v6[49] = a2;
  uint64_t v7 = sub_2D8F0();
  v6[54] = v7;
  v6[55] = *(void *)(v7 - 8);
  v6[56] = swift_task_alloc();
  v6[57] = swift_task_alloc();
  return ((uint64_t (*)(uint64_t (*)(), void, void))_swift_task_switch)(sub_286B8, 0, 0);
}

uint64_t sub_286B8()
{
  uint64_t v41 = v0;
  uint64_t v1 = v0[50];
  uint64_t v2 = v0[51];
  id v3 = objc_allocWithZone((Class)LSApplicationRecord);
  swift_bridgeObjectRetain();
  id v4 = sub_21650(v1, v2, 0);
  v0[58] = v4;
  uint64_t v6 = v0[50];
  uint64_t v5 = v0[51];
  uint64_t v8 = v0[48];
  uint64_t v7 = v0[49];
  char v9 = AXApplicationSupportsHapticMusic();
  sub_4BA0(&qword_39938);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2E940;
  *(void *)(inited + 32) = 0x6574726F70707573;
  *(void *)(inited + 40) = 0xE900000000000064;
  *(unsigned char *)(inited + 48) = v9;
  *(void *)(inited + 72) = &type metadata for Bool;
  *(void *)(inited + 80) = 1684632949;
  *(void *)(inited + 88) = 0xE400000000000000;
  *(void *)(inited + 96) = v8;
  *(void *)(inited + 104) = v7;
  *(void *)(inited + 120) = &type metadata for String;
  *(void *)(inited + 128) = 0xD000000000000010;
  *(void *)(inited + 168) = &type metadata for String;
  *(void *)(inited + 136) = 0x800000000002F270;
  *(void *)(inited + 144) = v6;
  *(void *)(inited + 152) = v5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  unint64_t v11 = sub_540C(inited);
  if (qword_39BA0 != -1) {
    swift_once();
  }
  uint64_t v12 = v0[57];
  uint64_t v13 = v0[54];
  uint64_t v14 = v0[55];
  uint64_t v15 = sub_46B4(v13, (uint64_t)HMLog);
  v0[59] = v15;
  swift_beginAccess();
  long long v16 = *(void (**)(uint64_t, uint64_t, uint64_t))(v14 + 16);
  v0[60] = v16;
  v0[61] = (v14 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  v16(v12, v15, v13);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  uint64_t v17 = sub_2D8D0();
  os_log_type_t v18 = sub_2DB50();
  BOOL v19 = os_log_type_enabled(v17, v18);
  uint64_t v20 = v0[57];
  uint64_t v21 = v0[54];
  uint64_t v22 = v0[55];
  unint64_t v23 = v0[53];
  if (v19)
  {
    uint64_t v38 = v0[54];
    uint64_t v24 = v0[52];
    uint64_t v25 = swift_slowAlloc();
    uint64_t v37 = swift_slowAlloc();
    *(_DWORD *)uint64_t v25 = 136315394;
    id v39 = v4;
    v40[0] = v37;
    swift_bridgeObjectRetain();
    v0[46] = sub_22B88(v24, v23, v40);
    sub_2DC80();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v25 + 12) = 2080;
    swift_bridgeObjectRetain();
    uint64_t v26 = sub_2D9F0();
    unint64_t v28 = v27;
    swift_bridgeObjectRelease();
    v0[47] = sub_22B88(v26, v28, v40);
    sub_2DC80();
    id v4 = v39;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_0, v17, v18, "App supported: %s %s", (uint8_t *)v25, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    unint64_t v29 = *(void (**)(uint64_t, uint64_t))(v22 + 8);
    v29(v20, v38);
  }
  else
  {
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();

    unint64_t v29 = *(void (**)(uint64_t, uint64_t))(v22 + 8);
    v29(v20, v21);
  }
  v0[62] = v29;
  swift_bridgeObjectRetain();
  NSString v30 = sub_2DA00();
  swift_bridgeObjectRelease();
  id v31 = [self clientMessengerWithIdentifier:v30];
  v0[63] = v31;

  if (v31)
  {
    sub_104D0(v11);
    swift_bridgeObjectRelease();
    Class isa = sub_2D9D0().super.isa;
    v0[64] = isa;
    swift_bridgeObjectRelease();
    id v33 = [self mainAccessQueue];
    v0[65] = v33;
    v0[2] = v0;
    v0[7] = v0 + 44;
    v0[3] = sub_28C9C;
    uint64_t v34 = swift_continuation_init();
    v0[32] = _NSConcreteStackBlock;
    v0[33] = 0x40000000;
    v0[34] = sub_10C80;
    v0[35] = &unk_35F28;
    v0[36] = v34;
    [v31 sendAsynchronousMessage:isa withIdentifier:5 targetAccessQueue:v33 completionRequiresWritingBlock:0 completion:v0 + 32];
    return _swift_continuation_await(v0 + 2);
  }
  else
  {

    swift_bridgeObjectRelease();
    swift_task_dealloc();
    swift_task_dealloc();
    Swift::UInt64 v35 = (uint64_t (*)(void))v0[1];
    return v35();
  }
}

uint64_t sub_28C9C()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 528) = v1;
  if (v1) {
    uint64_t v2 = sub_28E40;
  }
  else {
    uint64_t v2 = sub_28DAC;
  }
  return ((uint64_t (*)(uint64_t (*)(), void, void))_swift_task_switch)(v2, 0, 0);
}

uint64_t sub_28DAC()
{
  uint64_t v1 = *(void **)(v0 + 520);
  uint64_t v2 = *(void **)(v0 + 512);
  id v3 = *(void **)(v0 + 464);

  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

uint64_t sub_28E40()
{
  uint64_t v23 = v0;
  uint64_t v1 = *(void **)(v0 + 520);
  id v3 = *(void **)(v0 + 504);
  uint64_t v2 = *(void **)(v0 + 512);
  uint64_t v4 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 480);
  uint64_t v5 = *(void *)(v0 + 472);
  uint64_t v6 = *(void *)(v0 + 448);
  uint64_t v7 = *(void *)(v0 + 432);
  swift_willThrow();

  v4(v6, v5, v7);
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v8 = sub_2D8D0();
  os_log_type_t v9 = sub_2DB70();
  if (os_log_type_enabled(v8, v9))
  {
    os_log_type_t v18 = *(void **)(v0 + 464);
    uint64_t v20 = *(void *)(v0 + 448);
    uint64_t v21 = *(void (**)(uint64_t, uint64_t))(v0 + 496);
    uint64_t v19 = *(void *)(v0 + 432);
    unint64_t v10 = (uint8_t *)swift_slowAlloc();
    uint64_t v22 = swift_slowAlloc();
    *(_DWORD *)unint64_t v10 = 136315138;
    swift_getErrorValue();
    uint64_t v11 = sub_2DE40();
    *(void *)(v0 + 360) = sub_22B88(v11, v12, &v22);
    sub_2DC80();
    swift_bridgeObjectRelease();
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl(&dword_0, v8, v9, "Error sending message: %s", v10, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    swift_errorRelease();
    v21(v20, v19);
  }
  else
  {
    uint64_t v13 = *(void (**)(uint64_t, uint64_t))(v0 + 496);
    uint64_t v14 = *(void *)(v0 + 448);
    uint64_t v15 = *(void *)(v0 + 432);

    swift_errorRelease();
    swift_errorRelease();
    swift_errorRelease();

    v13(v14, v15);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  long long v16 = *(uint64_t (**)(void))(v0 + 8);
  return v16();
}

uint64_t sub_290E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  *(unsigned char *)(v5 + 345) = a5;
  *(void *)(v5 + 272) = a3;
  *(void *)(v5 + 280) = a4;
  *(void *)(v5 + 256) = a1;
  *(void *)(v5 + 264) = a2;
  uint64_t v6 = sub_2D8F0();
  *(void *)(v5 + 288) = v6;
  *(void *)(v5 + 296) = *(void *)(v6 - 8);
  *(void *)(v5 + 304) = swift_task_alloc();
  return ((uint64_t (*)(uint64_t (*)(), void, void))_swift_task_switch)(sub_291A8, 0, 0);
}

uint64_t sub_291A8()
{
  uint64_t v20 = v0;
  uint64_t v1 = *(void **)(v0 + 280);
  sub_2C5F8(*(void *)(v0 + 272), v0 + 120);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v18[0] = &_swiftEmptyDictionarySingleton;
  sub_25B84(v0 + 120, 1684632949, 0xE400000000000000, isUniquelyReferenced_nonNull_native);
  swift_bridgeObjectRelease();
  if ((uint64_t)*v1 < 1)
  {
    uint64_t v3 = *(void *)(*(void *)(v0 + 280) + 8);
    uint64_t v5 = swift_bridgeObjectRetain();
  }
  else
  {
    *(void *)(v0 + 224) = *v1;
    uint64_t v3 = sub_2DE00();
    uint64_t v5 = v4;
  }
  char v6 = *(unsigned char *)(v0 + 345);
  *(void *)(v0 + 208) = v3;
  *(void *)(v0 + 216) = v5;
  sub_2DCF0();
  char v7 = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v19 = &_swiftEmptyDictionarySingleton;
  sub_25B84((uint64_t)v18, 1701080931, 0xE400000000000000, v7);
  uint64_t v8 = v19;
  swift_bridgeObjectRelease();
  *(unsigned char *)(v0 + 344) = v6;
  sub_2DCF0();
  char v9 = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v19 = v8;
  sub_25B84((uint64_t)v18, 0x657669746361, 0xE600000000000000, v9);
  uint64_t v10 = (uint64_t)v19;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  NSString v11 = sub_2DA00();
  swift_bridgeObjectRelease();
  id v12 = [self clientMessengerWithIdentifier:v11];
  *(void *)(v0 + 336) = v12;

  if (v12)
  {
    sub_10898(v10);
    swift_bridgeObjectRelease();
    Class isa = sub_2D9D0().super.isa;
    *(void *)(v0 + 312) = isa;
    swift_bridgeObjectRelease();
    id v14 = [self mainAccessQueue];
    *(void *)(v0 + 320) = v14;
    *(void *)(v0 + 16) = v0;
    *(void *)(v0 + 56) = v0 + 240;
    *(void *)(v0 + 24) = sub_29518;
    uint64_t v15 = swift_continuation_init();
    *(void *)(v0 + 80) = _NSConcreteStackBlock;
    *(void *)(v0 + 88) = 0x40000000;
    *(void *)(v0 + 96) = sub_10C80;
    *(void *)(v0 + 104) = &unk_35E70;
    *(void *)(v0 + 112) = v15;
    [v12 sendAsynchronousMessage:isa withIdentifier:3 targetAccessQueue:v14 completionRequiresWritingBlock:0 completion:v0 + 80];
    return _swift_continuation_await(v0 + 16);
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    long long v16 = *(uint64_t (**)(void))(v0 + 8);
    return v16();
  }
}

uint64_t sub_29518()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 328) = v1;
  if (v1) {
    uint64_t v2 = sub_296A4;
  }
  else {
    uint64_t v2 = sub_29628;
  }
  return ((uint64_t (*)(uint64_t (*)(), void, void))_swift_task_switch)(v2, 0, 0);
}

uint64_t sub_29628()
{
  uint64_t v1 = *(void **)(v0 + 312);
  uint64_t v2 = *(void **)(v0 + 320);

  swift_bridgeObjectRelease();
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

uint64_t sub_296A4()
{
  uint64_t v22 = v0;
  uint64_t v1 = (void *)v0[42];
  uint64_t v3 = (void *)v0[39];
  uint64_t v2 = (void *)v0[40];
  swift_willThrow();

  if (qword_39BA0 != -1) {
    swift_once();
  }
  uint64_t v5 = v0[37];
  uint64_t v4 = v0[38];
  uint64_t v6 = v0[36];
  uint64_t v7 = sub_46B4(v6, (uint64_t)HMLog);
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v4, v7, v6);
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v8 = sub_2D8D0();
  os_log_type_t v9 = sub_2DB70();
  BOOL v10 = os_log_type_enabled(v8, v9);
  uint64_t v12 = v0[37];
  uint64_t v11 = v0[38];
  uint64_t v13 = v0[36];
  if (v10)
  {
    uint64_t v20 = v0[38];
    uint64_t v19 = v0[36];
    id v14 = (uint8_t *)swift_slowAlloc();
    uint64_t v21 = swift_slowAlloc();
    *(_DWORD *)id v14 = 136315138;
    swift_getErrorValue();
    uint64_t v15 = sub_2DE40();
    v0[31] = sub_22B88(v15, v16, &v21);
    sub_2DC80();
    swift_bridgeObjectRelease();
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl(&dword_0, v8, v9, "Error sending message: %s", v14, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    swift_errorRelease();
    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v20, v19);
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
    swift_errorRelease();

    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v11, v13);
  }
  swift_task_dealloc();
  uint64_t v17 = (uint64_t (*)(void))v0[1];
  return v17();
}

uint64_t sub_29950(char *a1, void *a2)
{
  uint64_t v4 = sub_2D930();
  uint64_t v20 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v6 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_2D960();
  uint64_t v7 = *(void *)(v19 - 8);
  uint64_t result = __chkstk_darwin(v19);
  BOOL v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    uint64_t v11 = *(void **)&a1[OBJC_IVAR___AXHapticMusicServer_queue];
    uint64_t v12 = swift_allocObject();
    *(void *)(v12 + 16) = a2;
    *(void *)(v12 + 24) = a1;
    uint64_t v13 = a1;
    aBlock[4] = sub_29F8C;
    aBlock[5] = v12;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_68F8;
    aBlock[3] = &unk_356F0;
    id v14 = _Block_copy(aBlock);
    id v15 = a2;
    unint64_t v16 = v13;
    id v17 = v11;
    sub_2D940();
    uint64_t v21 = &_swiftEmptyArrayStorage;
    sub_27694(&qword_394A8, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
    sub_4BA0(&qword_394B0);
    sub_281F8(&qword_394B8, &qword_394B0);
    sub_2DCB0();
    sub_2DBF0();
    _Block_release(v14);

    (*(void (**)(char *, uint64_t))(v20 + 8))(v6, v4);
    (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v19);
    return swift_release();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_29C44(char *a1)
{
  uint64_t v2 = sub_2D930();
  uint64_t v17 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v4 = (char *)&v15 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_2D960();
  uint64_t v5 = *(void *)(v16 - 8);
  uint64_t result = __chkstk_darwin(v16);
  uint64_t v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    uint64_t v9 = *(void **)&a1[OBJC_IVAR___AXHapticMusicServer_queue];
    uint64_t v10 = swift_allocObject();
    *(void *)(v10 + 16) = a1;
    uint64_t v11 = a1;
    aBlock[4] = sub_29F30;
    aBlock[5] = v10;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_68F8;
    aBlock[3] = &unk_356A0;
    uint64_t v12 = _Block_copy(aBlock);
    id v13 = v9;
    id v14 = v11;
    sub_2D940();
    uint64_t v18 = &_swiftEmptyArrayStorage;
    sub_27694(&qword_394A8, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
    sub_4BA0(&qword_394B0);
    sub_281F8(&qword_394B8, &qword_394B0);
    sub_2DCB0();
    sub_2DBF0();
    _Block_release(v12);

    (*(void (**)(char *, uint64_t))(v17 + 8))(v4, v2);
    (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v16);
    return swift_release();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_29F30()
{
  return sub_12990(*(void *)(v0 + 16));
}

void type metadata accessor for CFString(uint64_t a1)
{
}

uint64_t sub_29F4C()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_29F8C()
{
  return sub_12694(*(void **)(v0 + 16), *(void *)(v0 + 24));
}

void sub_29F94()
{
  sub_14958(*(void **)(v0 + 16));
}

void sub_29F9C(uint8_t *a1, void *a2)
{
  sub_12B74(a1, a2, *(char **)(v2 + 16));
}

void sub_29FA4(int a1)
{
  sub_13A60(a1, *(unsigned char **)(v1 + 16));
}

void type metadata accessor for CFError(uint64_t a1)
{
}

void sub_29FC0(uint64_t a1, void *a2)
{
}

uint64_t sub_29FC8()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 72, 7);
}

void sub_2A010(void *a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  uint64_t v54 = a5;
  int64_t v53 = a4;
  v52[1] = a3;
  uint64_t v55 = a2;
  uint64_t v6 = sub_2D8F0();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v10 = (char *)v52 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __chkstk_darwin(v8);
  unint64_t v68 = (char *)v52 - v12;
  __chkstk_darwin(v11);
  id v14 = (char *)v52 - v13;
  if (qword_39BA0 != -1) {
    swift_once();
  }
  uint64_t v15 = sub_46B4(v6, (uint64_t)HMLog);
  swift_beginAccess();
  uint64_t v16 = *(void (**)(char *, uint64_t, uint64_t))(v7 + 16);
  uint64_t v66 = v7 + 16;
  uint64_t v67 = v15;
  int64_t v65 = v16;
  v16(v14, v15, v6);
  uint64_t v17 = a1;
  uint64_t v18 = sub_2D8D0();
  os_log_type_t v19 = sub_2DB50();
  BOOL v20 = os_log_type_enabled(v18, v19);
  uint64_t v60 = v17;
  if (v20)
  {
    uint64_t v21 = v6;
    uint64_t v22 = v10;
    uint64_t v23 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v23 = 67109120;
    LODWORD(aBlock[0]) = *((unsigned __int8 *)&v60->isa + OBJC_IVAR___AXHapticMusicServer_isHapticTrackPlaying);
    sub_2DC80();

    _os_log_impl(&dword_0, v18, v19, "Handling pause state. Haptic track is playing: %{BOOL}d", v23, 8u);
    uint64_t v10 = v22;
    uint64_t v6 = v21;
    uint64_t v17 = v60;
    swift_slowDealloc();
  }
  else
  {

    uint64_t v18 = v17;
  }

  uint64_t v25 = *(void (**)(char *, uint64_t))(v7 + 8);
  uint64_t v24 = v7 + 8;
  uint64_t v64 = v25;
  v25(v14, v6);
  uint64_t v26 = (uint64_t *)((char *)v17 + OBJC_IVAR___AXHapticMusicServer_players);
  swift_beginAccess();
  uint64_t v27 = *v26;
  if ((unint64_t)*v26 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v28 = sub_2DDA0();
    if (!v28) {
      goto LABEL_24;
    }
  }
  else
  {
    uint64_t v28 = *(void *)((char *)&dword_10 + (v27 & 0xFFFFFFFFFFFFFF8));
    swift_bridgeObjectRetain();
    if (!v28) {
      goto LABEL_24;
    }
  }
  if (v28 < 1) {
    __break(1u);
  }
  uint64_t v30 = 0;
  uint64_t v31 = OBJC_IVAR___AXHapticMusicServer_isHapticTrackPlaying;
  unint64_t v62 = v27 & 0xC000000000000001;
  *(void *)&long long v29 = 136315138;
  long long v57 = v29;
  uint64_t v56 = (char *)&type metadata for Any + 8;
  uint64_t v61 = v27;
  uint64_t v63 = v28;
  uint64_t v59 = v6;
  uint64_t v58 = v10;
  do
  {
    if (v62)
    {
      int64_t v32 = (void *)sub_2DD30();
    }
    else
    {
      int64_t v32 = *(void **)(v27 + 8 * v30 + 32);
      swift_unknownObjectRetain();
    }
    aBlock[0] = 0;
    unsigned int v33 = [v32 pauseAtTime:aBlock error:0.0];
    id v34 = aBlock[0];
    if (v33)
    {
      *((unsigned char *)&v17->isa + v31) = 0;
      v65(v68, v67, v6);
      id v35 = v34;
      Swift::UInt64 v36 = sub_2D8D0();
      os_log_type_t v37 = sub_2DB50();
      if (os_log_type_enabled(v36, v37))
      {
        uint64_t v38 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v38 = 0;
        _os_log_impl(&dword_0, v36, v37, "Haptics Paused", v38, 2u);
        uint64_t v27 = v61;
        swift_slowDealloc();

        swift_unknownObjectRelease();
      }
      else
      {
        swift_unknownObjectRelease();
      }
      v64(v68, v6);
    }
    else
    {
      id v39 = aBlock[0];
      sub_2D810();

      swift_willThrow();
      v65(v10, v67, v6);
      swift_errorRetain();
      swift_errorRetain();
      uint64_t v40 = sub_2D8D0();
      os_log_type_t v41 = sub_2DB70();
      if (os_log_type_enabled(v40, v41))
      {
        uint64_t v42 = v24;
        uint64_t v43 = swift_slowAlloc();
        aBlock[0] = (id)swift_slowAlloc();
        *(_DWORD *)uint64_t v43 = v57;
        swift_getErrorValue();
        uint64_t v44 = sub_2DE40();
        *(void *)(v43 + 4) = sub_22B88(v44, v45, (uint64_t *)aBlock);
        swift_bridgeObjectRelease();
        swift_errorRelease();
        swift_errorRelease();
        _os_log_impl(&dword_0, v40, v41, "Failed to pause haptics. %s", (uint8_t *)v43, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        uint64_t v24 = v42;
        uint64_t v10 = v58;
        uint64_t v6 = v59;
        swift_slowDealloc();

        swift_unknownObjectRelease();
        swift_errorRelease();
      }
      else
      {
        swift_unknownObjectRelease();
        swift_errorRelease();
        swift_errorRelease();
        swift_errorRelease();
      }
      v64(v10, v6);
      uint64_t v17 = v60;
      uint64_t v27 = v61;
    }
    ++v30;
  }
  while (v63 != v30);
LABEL_24:
  swift_bridgeObjectRelease();
  uint64_t v46 = v55;
  sub_B840();
  *(unsigned char *)(v46 + OBJC_IVAR___AXHapticMusicServer_pauseShouldCancelEngineStartup) = 0;
  int64_t v47 = *(Class *)((char *)&v17->isa + OBJC_IVAR___AXHapticMusicServer_shutdownTimer);
  if (v47)
  {
    char v48 = (void *)swift_allocObject();
    v48[2] = v17;
    aBlock[4] = v53;
    aBlock[5] = v48;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = (id)1107296256;
    aBlock[2] = sub_68F8;
    aBlock[3] = v54;
    uint64_t v49 = _Block_copy(aBlock);
    int64_t v50 = v17;
    id v51 = v47;
    swift_release();
    [v51 afterDelay:v49 processBlock:20.0];
    _Block_release(v49);
  }
}

void sub_2A79C(void *a1, uint64_t a2)
{
  uint64_t v44 = a2;
  uint64_t v3 = sub_2D8F0();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = __chkstk_darwin(v3);
  uint64_t v7 = (char *)&v44 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __chkstk_darwin(v5);
  uint64_t v10 = (char *)&v44 - v9;
  __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v44 - v11;
  if (qword_39BA0 != -1) {
    swift_once();
  }
  uint64_t v13 = sub_46B4(v3, (uint64_t)HMLog);
  swift_beginAccess();
  id v14 = *(void (**)(char *, uint64_t, uint64_t))(v4 + 16);
  uint64_t v56 = v4 + 16;
  uint64_t v57 = v13;
  uint64_t v55 = v14;
  v14(v12, v13, v3);
  uint64_t v15 = a1;
  uint64_t v16 = sub_2D8D0();
  os_log_type_t v17 = sub_2DB50();
  BOOL v18 = os_log_type_enabled(v16, v17);
  id v51 = v15;
  if (v18)
  {
    os_log_type_t v19 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)os_log_type_t v19 = 67109120;
    LODWORD(aBlock[0]) = *((unsigned __int8 *)&v51->isa + OBJC_IVAR___AXHapticMusicServer_isHapticTrackPlaying);
    sub_2DC80();

    _os_log_impl(&dword_0, v16, v17, "Handling pause state. Haptic track is playing: %{BOOL}d", v19, 8u);
    uint64_t v15 = v51;
    swift_slowDealloc();
  }
  else
  {

    uint64_t v16 = v15;
  }

  uint64_t v54 = *(void (**)(char *, uint64_t))(v4 + 8);
  uint64_t v53 = v4 + 8;
  v54(v12, v3);
  BOOL v20 = (uint64_t *)((char *)v15 + OBJC_IVAR___AXHapticMusicServer_players);
  swift_beginAccess();
  uint64_t v21 = *v20;
  if ((unint64_t)*v20 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v22 = sub_2DDA0();
    if (!v22) {
      goto LABEL_24;
    }
  }
  else
  {
    uint64_t v22 = *(void *)((char *)&dword_10 + (v21 & 0xFFFFFFFFFFFFFF8));
    swift_bridgeObjectRetain();
    if (!v22) {
      goto LABEL_24;
    }
  }
  if (v22 < 1) {
    __break(1u);
  }
  uint64_t v24 = 0;
  uint64_t v49 = OBJC_IVAR___AXHapticMusicServer_isHapticTrackPlaying;
  unint64_t v25 = v21 & 0xC000000000000001;
  *(void *)&long long v23 = 136315138;
  long long v46 = v23;
  unint64_t v45 = (char *)&type metadata for Any + 8;
  uint64_t v52 = v21;
  uint64_t v47 = v3;
  int64_t v50 = v10;
  unint64_t v48 = v21 & 0xC000000000000001;
  do
  {
    if (v25)
    {
      uint64_t v26 = (void *)sub_2DD30();
    }
    else
    {
      uint64_t v26 = *(void **)(v21 + 8 * v24 + 32);
      swift_unknownObjectRetain();
    }
    aBlock[0] = 0;
    unsigned int v27 = objc_msgSend(v26, "pauseAtTime:error:", aBlock, 0.0, v44, v45);
    id v28 = aBlock[0];
    if (v27)
    {
      *((unsigned char *)&v15->isa + v49) = 0;
      v55(v10, v57, v3);
      id v29 = v28;
      uint64_t v30 = sub_2D8D0();
      os_log_type_t v31 = sub_2DB50();
      if (os_log_type_enabled(v30, v31))
      {
        int64_t v32 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)int64_t v32 = 0;
        _os_log_impl(&dword_0, v30, v31, "Haptics Paused", v32, 2u);
        uint64_t v15 = v51;
        swift_slowDealloc();

        swift_unknownObjectRelease();
      }
      else
      {
        swift_unknownObjectRelease();
      }
      v54(v10, v3);
      uint64_t v21 = v52;
    }
    else
    {
      id v33 = aBlock[0];
      sub_2D810();

      swift_willThrow();
      v55(v7, v57, v3);
      swift_errorRetain();
      swift_errorRetain();
      id v34 = sub_2D8D0();
      os_log_type_t v35 = sub_2DB70();
      if (os_log_type_enabled(v34, v35))
      {
        uint64_t v36 = swift_slowAlloc();
        aBlock[0] = (id)swift_slowAlloc();
        *(_DWORD *)uint64_t v36 = v46;
        swift_getErrorValue();
        uint64_t v37 = sub_2DE40();
        *(void *)(v36 + 4) = sub_22B88(v37, v38, (uint64_t *)aBlock);
        swift_bridgeObjectRelease();
        swift_errorRelease();
        swift_errorRelease();
        _os_log_impl(&dword_0, v34, v35, "Failed to pause haptics. %s", (uint8_t *)v36, 0xCu);
        swift_arrayDestroy();
        uint64_t v3 = v47;
        swift_slowDealloc();
        uint64_t v15 = v51;
        swift_slowDealloc();

        swift_unknownObjectRelease();
        swift_errorRelease();
      }
      else
      {
        swift_unknownObjectRelease();
        swift_errorRelease();
        swift_errorRelease();
        swift_errorRelease();
      }
      v54(v7, v3);
      uint64_t v10 = v50;
      uint64_t v21 = v52;
      unint64_t v25 = v48;
    }
    ++v24;
  }
  while (v22 != v24);
LABEL_24:
  swift_bridgeObjectRelease();
  sub_B840();
  id v39 = *(Class *)((char *)&v15->isa + OBJC_IVAR___AXHapticMusicServer_shutdownTimer);
  if (v39)
  {
    uint64_t v40 = (void *)swift_allocObject();
    uint64_t v40[2] = v15;
    aBlock[4] = sub_2D748;
    aBlock[5] = v40;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = (id)1107296256;
    aBlock[2] = sub_68F8;
    aBlock[3] = &unk_35EB0;
    os_log_type_t v41 = _Block_copy(aBlock);
    uint64_t v42 = v15;
    id v43 = v39;
    swift_release();
    [v43 afterDelay:v41 processBlock:20.0];
    _Block_release(v41);
  }
}

void sub_2AF20(uint64_t a1, char *a2, uint64_t a3, void *a4, double a5)
{
  unint64_t v105 = a2;
  uint64_t v106 = a1;
  uint64_t v8 = sub_2D8F0();
  uint64_t v9 = *(char **)(v8 - 8);
  uint64_t v10 = __chkstk_darwin(v8);
  id v97 = (char *)&v93 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __chkstk_darwin(v10);
  id v14 = (char *)&v93 - v13;
  uint64_t v15 = __chkstk_darwin(v12);
  id v96 = (char *)&v93 - v16;
  __chkstk_darwin(v15);
  BOOL v18 = (char *)&v93 - v17;
  uint64_t v19 = swift_allocObject();
  *(void *)(v19 + 16) = a3;
  *(void *)(v19 + 24) = a4;
  uint64_t v104 = v19;
  uint64_t v20 = qword_39BA0;
  uint64_t v98 = a3;
  swift_retain();
  os_log_type_t v99 = a4;
  swift_retain();
  if (v20 != -1) {
    swift_once();
  }
  long long v95 = v14;
  uint64_t v21 = sub_46B4(v8, (uint64_t)HMLog);
  swift_beginAccess();
  uint64_t v22 = (uint8_t *)*((void *)v9 + 2);
  id v101 = (void **)(v9 + 16);
  uint64_t v102 = v21;
  uint64_t v100 = v22;
  ((void (*)(char *, uint64_t, uint64_t))v22)(v18, v21, v8);
  uint64_t v23 = v106;
  sub_2BBDC(v106);
  sub_2BBDC(v23);
  uint64_t v24 = sub_2D8D0();
  os_log_type_t v25 = sub_2DB50();
  BOOL v26 = os_log_type_enabled(v24, v25);
  uint64_t v103 = v8;
  if (v26)
  {
    uint64_t v27 = swift_slowAlloc();
    long long v94 = (void **)swift_slowAlloc();
    long long aBlock = v94;
    *(_DWORD *)uint64_t v27 = 136315394;
    uint64_t v28 = v106;
    sub_2BBDC(v106);
    unint64_t v29 = sub_46EC();
    uint64_t v30 = v9;
    unint64_t v32 = v31;
    sub_2BC28(v28);
    *(void *)&long long v114 = sub_22B88(v29, v32, (uint64_t *)&aBlock);
    uint64_t v8 = v103;
    sub_2DC80();
    uint64_t v9 = v30;
    swift_bridgeObjectRelease();
    sub_2BC28(v28);
    sub_2BC28(v28);
    *(_WORD *)(v27 + 12) = 2048;
    *(double *)&long long v114 = a5;
    sub_2DC80();
    _os_log_impl(&dword_0, v24, v25, "Fetching haptic track for: %s, duration: %f", (uint8_t *)v27, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    id v33 = v30;
  }
  else
  {
    uint64_t v34 = v106;
    sub_2BC28(v106);
    sub_2BC28(v34);

    id v33 = v9;
  }
  os_log_type_t v35 = (void (*)(char *, uint64_t))*((void *)v33 + 1);
  v35(v18, v8);
  uint64_t v36 = *(void ***)v106;
  if (*(void *)v106 != 99999999)
  {
    id v97 = v9;
    id v113 = 0;
    id v41 = v105;
    uint64_t v42 = *(void **)&v105[OBJC_IVAR___AXHapticMusicServer_ahapAvailableCacheQueue];
    uint64_t v43 = swift_allocObject();
    *(void *)(v43 + 16) = &v113;
    *(void *)(v43 + 24) = v41;
    uint64_t v44 = v106;
    long long v45 = *(_OWORD *)(v106 + 16);
    *(_OWORD *)(v43 + 32) = *(_OWORD *)v106;
    *(_OWORD *)(v43 + 48) = v45;
    *(_OWORD *)(v43 + 64) = *(_OWORD *)(v44 + 32);
    *(void *)(v43 + 80) = *(void *)(v44 + 48);
    uint64_t v46 = swift_allocObject();
    *(void *)(v46 + 16) = sub_2C264;
    *(void *)(v46 + 24) = v43;
    long long v111 = sub_2C408;
    uint64_t v112 = v46;
    long long aBlock = _NSConcreteStackBlock;
    uint64_t v108 = 1107296256;
    uint64_t v109 = sub_16804;
    id v110 = &unk_35B50;
    uint64_t v47 = _Block_copy(&aBlock);
    sub_2BBDC(v44);
    unint64_t v48 = v42;
    uint64_t v49 = (char *)v41;
    swift_retain();
    swift_release();
    dispatch_sync(v48, v47);

    _Block_release(v47);
    LOBYTE(v47) = swift_isEscapingClosureAtFileLocation();
    swift_release();
    if (v47)
    {
      __break(1u);
      return;
    }
    if (v113)
    {
      id v50 = v113;
      if (![v50 BOOLValue])
      {
        uint64_t v69 = v96;
        ((void (*)(char *, uint64_t, uint64_t))v100)(v96, v102, v103);
        sub_2BBDC(v106);
        uint64_t v70 = sub_2D8D0();
        os_log_type_t v71 = sub_2DB50();
        if (os_log_type_enabled(v70, v71))
        {
          uint64_t v72 = (uint8_t *)swift_slowAlloc();
          *(_DWORD *)uint64_t v72 = 134217984;
          long long aBlock = v36;
          sub_2DC80();
          sub_2BC28(v106);
          _os_log_impl(&dword_0, v70, v71, "Not requesting %lld again, it's already cached as not available", v72, 0xCu);
          swift_slowDealloc();
        }
        else
        {
          sub_2BC28(v106);
        }

        v35(v69, v103);
        sub_17EBC(0, v98, v99);

        goto LABEL_29;
      }
    }
    id v51 = &v49[OBJC_IVAR___AXHapticMusicServer_hapticCache];
    swift_beginAccess();
    uint64_t v52 = *(void *)v51;
    if (*(void *)(v52 + 16))
    {
      uint64_t v53 = (Swift::UInt64 *)v106;
      sub_2BBDC(v106);
      unint64_t v54 = sub_231E0(v53);
      if (v55)
      {
        uint64_t v56 = *(void *)(*(void *)(v52 + 56) + 16 * v54);
        swift_endAccess();
        swift_bridgeObjectRetain();
        uint64_t v57 = v106;
        sub_2BC28(v106);
        uint64_t v58 = v95;
        uint64_t v59 = v103;
        ((void (*)(char *, uint64_t, uint64_t))v100)(v95, v102, v103);
        sub_2BBDC(v57);
        sub_2BBDC(v57);
        uint64_t v60 = sub_2D8D0();
        os_log_type_t v61 = sub_2DB50();
        if (os_log_type_enabled(v60, v61))
        {
          uint64_t v62 = swift_slowAlloc();
          id v101 = (void **)swift_slowAlloc();
          long long aBlock = v101;
          uint64_t v102 = v56;
          *(_DWORD *)uint64_t v62 = 136315138;
          os_log_type_t v99 = (void *)(v62 + 4);
          uint64_t v100 = (uint8_t *)v62;
          unint64_t v105 = v49;
          uint64_t v63 = v106;
          sub_2BBDC(v106);
          unint64_t v64 = sub_46EC();
          unint64_t v66 = v65;
          sub_2BC28(v63);
          *(void *)&long long v114 = sub_22B88(v64, v66, (uint64_t *)&aBlock);
          uint64_t v56 = v102;
          sub_2DC80();
          swift_bridgeObjectRelease();
          sub_2BC28(v63);
          sub_2BC28(v63);
          _os_log_impl(&dword_0, v60, v61, "Processing track from cache %s", v100, 0xCu);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();

          uint64_t v67 = v58;
          uint64_t v68 = v103;
        }
        else
        {
          uint64_t v91 = v106;
          sub_2BC28(v106);
          sub_2BC28(v91);

          uint64_t v67 = v58;
          uint64_t v68 = v59;
        }
        v35(v67, v68);
        sub_1E478(v106, v56, (uint64_t)sub_2C258, v104);
        swift_bridgeObjectRelease();
        id v90 = v113;
        swift_release();
        goto LABEL_32;
      }
      sub_2BC28(v106);
    }
    swift_endAccess();
    if (v36)
    {
      sub_2CAD4(0, &qword_398C0);
      sub_4BA0(&qword_398C8);
      uint64_t inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_2E960;
      *(void *)(inited + 32) = SHMediaItemAppleMusicID;
      long long aBlock = v36;
      uint64_t v74 = SHMediaItemAppleMusicID;
      *(void *)(inited + 40) = sub_2DE00();
      *(void *)(inited + 48) = v75;
      uint64_t v76 = (void *)SHMediaItemDuration;
      *(void *)(inited + 64) = &type metadata for String;
      *(void *)(inited + 72) = v76;
      *(void *)(inited + 104) = &type metadata for Double;
      *(double *)(inited + 80) = a5;
LABEL_23:
      id v77 = v76;
      unint64_t v78 = (void *)sub_5544(inited);
      char v79 = (void *)sub_1682C(v78);
      unint64_t v105 = (char *)self;
      sub_4BA0(&qword_39898);
      uint64_t v80 = (void **)swift_allocObject();
      *((_OWORD *)v80 + 1) = xmmword_2E980;
      v80[4] = v79;
      long long aBlock = v80;
      sub_2DAD0();
      sub_2CAD4(0, &qword_398C0);
      id v81 = v79;
      Class isa = sub_2DAA0().super.isa;
      swift_bridgeObjectRelease();
      uint64_t v83 = swift_allocObject();
      *(void *)(v83 + 16) = v81;
      *(void *)(v83 + 24) = sub_2C258;
      *(void *)(v83 + 32) = v104;
      *(void *)(v83 + 40) = v49;
      os_log_type_t v84 = v49;
      uint64_t v85 = v106;
      long long v86 = *(_OWORD *)(v106 + 16);
      *(_OWORD *)(v83 + 48) = *(_OWORD *)v106;
      *(_OWORD *)(v83 + 64) = v86;
      *(_OWORD *)(v83 + 80) = *(_OWORD *)(v85 + 32);
      *(void *)(v83 + 96) = *(void *)(v85 + 48);
      long long v111 = sub_2C490;
      uint64_t v112 = v83;
      long long aBlock = _NSConcreteStackBlock;
      uint64_t v108 = 1107296256;
      uint64_t v109 = sub_1EB5C;
      id v110 = &unk_35BA0;
      id v87 = _Block_copy(&aBlock);
      sub_2BBDC(v85);
      id v88 = v84;
      id v89 = v81;
      swift_retain();
      swift_release();
      [v105 fetchHapticsWithMediaItems:isa completionHandler:v87];

      _Block_release(v87);
      id v90 = v113;
      swift_release();
LABEL_32:
      swift_release();

      return;
    }
    long long v114 = *(_OWORD *)(v106 + 8);
    if (v114 != __PAIR128__(0xE000000000000000, 0) && (sub_2DE10() & 1) == 0)
    {
      sub_2CAD4(0, &qword_398C0);
      sub_4BA0(&qword_398C8);
      uint64_t inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_2E960;
      *(void *)(inited + 32) = SHMediaItemISRC;
      *(_OWORD *)(inited + 40) = v114;
      uint64_t v76 = (void *)SHMediaItemDuration;
      *(void *)(inited + 64) = &type metadata for String;
      *(void *)(inited + 72) = v76;
      *(void *)(inited + 104) = &type metadata for Double;
      *(double *)(inited + 80) = a5;
      id v92 = SHMediaItemISRC;
      sub_2C4A0((uint64_t)&v114);
      goto LABEL_23;
    }
    sub_17EBC(0, v98, v99);
LABEL_29:
    id v90 = v113;
    swift_release();
    goto LABEL_32;
  }
  v105[OBJC_IVAR___AXHapticMusicServer_fetchingHapticTracks] = 0;
  sub_1DE38();
  uint64_t v37 = v97;
  ((void (*)(char *, uint64_t, uint64_t))v100)(v97, v102, v8);
  unint64_t v38 = sub_2D8D0();
  os_log_type_t v39 = sub_2DB50();
  if (os_log_type_enabled(v38, v39))
  {
    uint64_t v40 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v40 = 0;
    _os_log_impl(&dword_0, v38, v39, "Sample track always matches", v40, 2u);
    swift_slowDealloc();
  }

  v35(v37, v8);
  sub_17EBC(1, v98, v99);
  swift_release();
}

uint64_t sub_2BBDC(uint64_t a1)
{
  return a1;
}

uint64_t sub_2BC28(uint64_t a1)
{
  return a1;
}

void sub_2BC74()
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v1 = (char *)Strong;
    if ((*(unsigned char *)(Strong + OBJC_IVAR___AXHapticMusicServer_fetchingHapticTracks) & 1) == 0)
    {
      id v2 = [objc_allocWithZone((Class)MRNowPlayingRequest) init];
      uint64_t v3 = *(void **)&v1[OBJC_IVAR___AXHapticMusicServer_queue];
      uint64_t v4 = swift_allocObject();
      *(void *)(v4 + 16) = v1;
      aBlock[4] = sub_2BDC8;
      aBlock[5] = v4;
      aBlock[0] = _NSConcreteStackBlock;
      aBlock[1] = 1107296256;
      aBlock[2] = sub_1A7E0;
      aBlock[3] = &unk_35948;
      uint64_t v5 = _Block_copy(aBlock);
      id v6 = v3;
      uint64_t v7 = v1;
      swift_release();
      [v2 requestNowPlayingItemMetadataOnQueue:v6 completion:v5];
      _Block_release(v5);
    }
  }
}

void sub_2BDC8(void *a1)
{
  sub_184DC(a1, *(void **)(v1 + 16));
}

uint64_t sub_2BDD0(void *a1, char a2)
{
  return sub_18A58(a1, a2, *(char **)(v2 + 16));
}

uint64_t sub_2BDDC(uint64_t a1)
{
  return sub_1A0A4(a1, *(char **)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32), *(void **)(v1 + 40));
}

uint64_t sub_2BDEC()
{
  swift_release();

  return _swift_deallocObject(v0, 48, 7);
}

void sub_2BE34()
{
  sub_1A5D0(*(void *)(v0 + 16), *(void (**)(uint64_t, uint64_t))(v0 + 24), *(void *)(v0 + 32), *(void *)(v0 + 40));
}

double sub_2BE40(void *a1)
{
  uint64_t v2 = sub_2D8F0();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  id v6 = (char *)&v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v25 - v7;
  id v26 = a1;
  [a1 calculatedPlaybackPosition];
  double v10 = v9;
  if (qword_39BA0 != -1) {
    swift_once();
  }
  uint64_t v11 = sub_46B4(v2, (uint64_t)HMLog);
  swift_beginAccess();
  uint64_t v12 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
  v12(v8, v11, v2);
  uint64_t v13 = sub_2D8D0();
  os_log_type_t v14 = sub_2DB60();
  if (os_log_type_enabled(v13, v14))
  {
    uint64_t v15 = (_DWORD *)swift_slowAlloc();
    os_log_type_t v25 = v6;
    uint64_t v16 = v15;
    *uint64_t v15 = 134218240;
    double v27 = v10;
    sub_2DC80();
    *((_WORD *)v16 + 6) = 2048;
    double v27 = 0.0;
    sub_2DC80();
    _os_log_impl(&dword_0, v13, v14, "Calculated position %f, device latency: %f", (uint8_t *)v16, 0x16u);
    id v6 = v25;
    swift_slowDealloc();
  }

  uint64_t v17 = *(void (**)(char *, uint64_t))(v3 + 8);
  v17(v8, v2);
  v12(v6, v11, v2);
  BOOL v18 = v26;
  uint64_t v19 = sub_2D8D0();
  os_log_type_t v20 = sub_2DB50();
  if (os_log_type_enabled(v19, v20))
  {
    uint64_t v21 = swift_slowAlloc();
    *(_DWORD *)uint64_t v21 = 134218240;
    [v18 elapsedTimeTimestamp];
    double v27 = v22;
    sub_2DC80();
    *(_WORD *)(v21 + 12) = 2048;
    [v18 inferredTimestamp];
    double v27 = v23;
    sub_2DC80();

    _os_log_impl(&dword_0, v19, v20, "playback pos: elapse %f infer %f", (uint8_t *)v21, 0x16u);
    swift_slowDealloc();
  }
  else
  {

    uint64_t v19 = v18;
  }

  v17(v6, v2);
  return v10 + 0.0;
}

uint64_t sub_2C1C0()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_2C1F8()
{
  return sub_19EB8(*(double *)(v0 + 16));
}

uint64_t sub_2C218()
{
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

void sub_2C258(char a1)
{
  sub_17EBC(a1, *(void *)(v1 + 16), *(void **)(v1 + 24));
}

void sub_2C264()
{
  uint64_t v1 = (id *)v0[2];
  uint64_t v2 = v0[3] + OBJC_IVAR___AXHapticMusicServer_ahapAvailableCache;
  swift_beginAccess();
  uint64_t v3 = *(void *)v2;
  if (*(void *)(*(void *)v2 + 16))
  {
    uint64_t v4 = (uint64_t)(v0 + 4);
    sub_2BBDC((uint64_t)(v0 + 4));
    unint64_t v5 = sub_231E0(v0 + 4);
    if (v6)
    {
      uint64_t v7 = *(void **)(*(void *)(v3 + 56) + 8 * v5);
      id v8 = v7;
    }
    else
    {
      uint64_t v7 = 0;
    }
    sub_2BC28(v4);
  }
  else
  {
    uint64_t v7 = 0;
  }
  swift_endAccess();
  id v9 = *v1;
  id *v1 = v7;

  if (*v1)
  {
    id v10 = *v1;
    sub_2DB00();
  }
}

uint64_t sub_2C3F8()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_2C408()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_2C430()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 104, 7);
}

uint64_t sub_2C490(uint64_t a1, uint64_t a2)
{
  return sub_1E784(a1, a2, *(void **)(v2 + 16), *(void (**)(void))(v2 + 24), *(void *)(v2 + 32), *(void *)(v2 + 40), (Swift::UInt64 *)(v2 + 48));
}

uint64_t sub_2C4A0(uint64_t a1)
{
  return a1;
}

uint64_t sub_2C4CC(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_2C4E0(a1, a2);
  }
  return a1;
}

uint64_t sub_2C4E0(uint64_t a1, unint64_t a2)
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

void type metadata accessor for Key(uint64_t a1)
{
}

uint64_t sub_2C54C()
{
  swift_bridgeObjectRelease();
  swift_release();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 104, 7);
}

uint64_t sub_2C5AC()
{
  return sub_1EC0C(*(void *)(v0 + 16), *(void (**)(BOOL))(v0 + 24), *(id *)(v0 + 32), *(char **)(v0 + 40), v0 + 48);
}

uint64_t sub_2C5BC()
{
  return _swift_deallocObject(v0, 17, 7);
}

void sub_2C5D0()
{
  sub_1F4C4(*(char **)(v0 + 16), v0 + 24, *(void *)(v0 + 80));
}

uint64_t sub_2C5E0()
{
  return _swift_deallocObject(v0, 32, 7);
}

void sub_2C5F0(uint64_t a1)
{
}

uint64_t sub_2C5F8(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_2C654()
{
  return swift_release();
}

_OWORD *sub_2C65C(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_2C66C()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 80, 7);
}

uint64_t sub_2C6BC()
{
  return sub_1FCF4(*(void **)(v0 + 16), v0 + 24);
}

uint64_t sub_2C6C8()
{
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 96, 7);
}

uint64_t sub_2C720()
{
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_2D7AC;
  return sub_1FE18((uint64_t)v3, v4, v5, v2, v0 + 40);
}

uint64_t sub_2C7BC()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 112, 7);
}

void sub_2C81C()
{
  uint64_t v2 = v0[11];
  unint64_t v1 = v0[12];
  if (v0[2])
  {
    uint64_t v3 = sub_2DE00();
    unint64_t v5 = v4;
  }
  else
  {
    uint64_t v3 = v0[3];
    unint64_t v5 = v0[4];
    if (v3) {
      BOOL v6 = 0;
    }
    else {
      BOOL v6 = v5 == 0xE000000000000000;
    }
    if (v6 || (sub_2DE10() & 1) != 0)
    {
      uint64_t v3 = 0;
      unint64_t v5 = 0xE000000000000000;
    }
    else
    {
      swift_bridgeObjectRetain();
    }
  }
  sub_4BA0(&qword_39938);
  uint64_t inited = swift_initStackObject();
  uint64_t v8 = inited;
  *(_OWORD *)(inited + 16) = xmmword_2E940;
  *(void *)(inited + 32) = 0x6C62616C69617661;
  *(void *)(inited + 40) = 0xE900000000000065;
  *(unsigned char *)(inited + 48) = 1;
  *(void *)(inited + 72) = &type metadata for Bool;
  *(void *)(inited + 80) = 1684632949;
  if (v1) {
    uint64_t v9 = v2;
  }
  else {
    uint64_t v9 = 0;
  }
  unint64_t v10 = 0xE000000000000000;
  if (v1) {
    unint64_t v10 = v1;
  }
  *(void *)(inited + 88) = 0xE400000000000000;
  *(void *)(inited + 96) = v9;
  *(void *)(inited + 104) = v10;
  *(void *)(inited + 120) = &type metadata for String;
  *(void *)(inited + 128) = 1701080931;
  *(void *)(inited + 168) = &type metadata for String;
  *(void *)(inited + 136) = 0xE400000000000000;
  *(void *)(inited + 144) = v3;
  *(void *)(inited + 152) = v5;
  swift_bridgeObjectRetain();
  unint64_t v11 = sub_540C(v8);
  swift_bridgeObjectRetain();
  NSString v12 = sub_2DA00();
  swift_bridgeObjectRelease();
  id v13 = [self clientMessengerWithIdentifier:v12];

  if (v13)
  {
    sub_104D0(v11);
    swift_bridgeObjectRelease();
    Class isa = sub_2D9D0().super.isa;
    swift_bridgeObjectRelease();
    id v15 = [self mainAccessQueue];
    [v13 sendAsynchronousMessage:isa withIdentifier:2 targetAccessQueue:v15 completion:0];
  }
  else
  {
    swift_bridgeObjectRelease();
  }
}

uint64_t sub_2CA70(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

void type metadata accessor for SHMediaItemProperty(uint64_t a1)
{
}

uint64_t sub_2CAD4(uint64_t a1, unint64_t *a2)
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

uint64_t sub_2CB14()
{
  swift_unknownObjectRelease();

  return _swift_deallocObject(v0, 41, 7);
}

uint64_t sub_2CB54()
{
  uint64_t v2 = *(void *)(v0 + 32);
  char v3 = *(unsigned char *)(v0 + 40);
  uint64_t v4 = swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  *(void *)uint64_t v4 = v1;
  *(void *)(v4 + 8) = sub_2D7AC;
  *(unsigned char *)(v4 + 88) = v3;
  *(void *)(v4 + 72) = v2;
  return ((uint64_t (*)(uint64_t (*)(), void, void))_swift_task_switch)(sub_182F4, 0, 0);
}

unint64_t sub_2CC08()
{
  unint64_t result = qword_399B8;
  if (!qword_399B8)
  {
    sub_4BE4(&qword_398B0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_399B8);
  }
  return result;
}

uint64_t sub_2CC74(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_2CCD4()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 88, 7);
}

void sub_2CD24()
{
  uint64_t v1 = (void **)v0[2];
  uint64_t v2 = v0[3] + OBJC_IVAR___AXHapticMusicServer_ahapAvailableCache;
  swift_beginAccess();
  uint64_t v3 = *(void *)v2;
  if (*(void *)(*(void *)v2 + 16))
  {
    uint64_t v4 = (uint64_t)(v0 + 4);
    sub_2BBDC((uint64_t)(v0 + 4));
    unint64_t v5 = sub_231E0(v0 + 4);
    if (v6)
    {
      uint64_t v7 = *(void **)(*(void *)(v3 + 56) + 8 * v5);
      id v8 = v7;
    }
    else
    {
      uint64_t v7 = 0;
    }
    sub_2BC28(v4);
  }
  else
  {
    uint64_t v7 = 0;
  }
  swift_endAccess();
  uint64_t v9 = *v1;
  id *v1 = v7;
}

uint64_t sub_2CDD4()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_2CDE4()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

Swift::Int sub_2CE24(int a1, uint64_t a2)
{
  return sub_17244(a1, a2, *(void *)(v2 + 16), *(void *)(v2 + 24));
}

uint64_t sub_2CE30()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 88, 7);
}

uint64_t sub_2CE88()
{
  uint64_t v1 = v0[2];
  uint64_t v2 = v0 + 3;
  uint64_t v3 = (unsigned __int8 *)(v0[10] + 16);
  swift_beginAccess();
  uint64_t v4 = *v3;
  id v5 = objc_allocWithZone((Class)NSNumber);
  sub_2BBDC((uint64_t)v2);
  id v6 = [v5 initWithBool:v4];
  uint64_t v7 = (uint64_t *)(v1 + OBJC_IVAR___AXHapticMusicServer_ahapAvailableCache);
  swift_beginAccess();
  if (v6)
  {
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v15 = *v7;
    uint64_t *v7 = 0x8000000000000000;
    sub_25FCC((uint64_t)v6, (uint64_t)v2, isUniquelyReferenced_nonNull_native);
    uint64_t *v7 = v15;
    swift_bridgeObjectRelease();
    sub_2BC28((uint64_t)v2);
  }
  else
  {
    uint64_t v9 = (void *)sub_23A50(v2);
    sub_2BC28((uint64_t)v2);
  }
  swift_endAccess();
  unint64_t v10 = self;
  id v11 = [v10 sharedInstance];
  unsigned int v12 = [v11 hapticMusicTrackAvailable];

  uint64_t result = swift_beginAccess();
  if (v12 != *v3)
  {
    id v14 = [v10 sharedInstance];
    swift_beginAccess();
    [v14 setHapticMusicTrackAvailable:*v3];

    sub_2D9C0();
    sub_2D9B0();
    sub_2D9A0();
    return swift_release();
  }
  return result;
}

uint64_t sub_2D07C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_4BA0(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_2D0D8(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  id v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_27864;
  id v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_399F0 + dword_399F0);
  return v6(a1, v4);
}

void sub_2D190(uint64_t a1, uint64_t a2, void *a3)
{
  if (a2 != 1)
  {
    swift_bridgeObjectRelease();
  }
}

uint64_t sub_2D1D8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_4BA0(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t *sub_2D23C(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

void type metadata accessor for CFNotificationName(uint64_t a1)
{
}

void type metadata accessor for InterruptionType(uint64_t a1)
{
}

void sub_2D2C8(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_2D310()
{
  return sub_27694(&qword_39A58, type metadata accessor for Name);
}

uint64_t sub_2D358()
{
  return sub_27694(&qword_39A60, type metadata accessor for Name);
}

uint64_t sub_2D3A0()
{
  return sub_27694(&qword_39A68, type metadata accessor for Name);
}

uint64_t sub_2D3E8()
{
  return sub_27694(&qword_39A70, type metadata accessor for SHMediaItemProperty);
}

uint64_t sub_2D430()
{
  return sub_27694(&qword_39A78, type metadata accessor for SHMediaItemProperty);
}

uint64_t sub_2D478()
{
  return sub_27694(&qword_39A80, type metadata accessor for Key);
}

uint64_t sub_2D4C0()
{
  return sub_27694(&qword_39A88, type metadata accessor for Key);
}

uint64_t sub_2D508()
{
  return sub_27694(&qword_39A90, type metadata accessor for SHMediaItemProperty);
}

uint64_t sub_2D550()
{
  return sub_27694(&qword_39A98, type metadata accessor for Key);
}

void sub_2D7B0()
{
  uint64_t v0 = abort_report_np();
  sub_2D7D8(v0);
}

void sub_2D7D8()
{
}

uint64_t sub_2D800()
{
  return _convertErrorToNSError(_:)();
}

uint64_t sub_2D810()
{
  return _convertNSErrorToError(_:)();
}

void sub_2D820(NSURL *retstr@<X8>)
{
}

uint64_t sub_2D830()
{
  return static URL._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_2D840()
{
  return type metadata accessor for URL();
}

NSData sub_2D850()
{
  return Data._bridgeToObjectiveC()();
}

uint64_t sub_2D860()
{
  return static Data._conditionallyBridgeFromObjectiveC(_:result:)();
}

NSDate sub_2D870()
{
  return Date._bridgeToObjectiveC()();
}

uint64_t sub_2D880()
{
  return static Date.< infix(_:_:)();
}

uint64_t sub_2D890()
{
  return static Date._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_2D8A0()
{
  return static Date.now.getter();
}

uint64_t sub_2D8B0()
{
  return type metadata accessor for Date();
}

uint64_t sub_2D8C0()
{
  return Selector.init(_:)();
}

uint64_t sub_2D8D0()
{
  return Logger.logObject.getter();
}

uint64_t sub_2D8E0()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_2D8F0()
{
  return type metadata accessor for Logger();
}

uint64_t sub_2D900()
{
  return AnyCancellable.store(in:)();
}

uint64_t sub_2D910()
{
  return Publisher.receive<A>(on:options:)();
}

uint64_t sub_2D920()
{
  return Publisher<>.sink(receiveValue:)();
}

uint64_t sub_2D930()
{
  return type metadata accessor for DispatchWorkItemFlags();
}

uint64_t sub_2D940()
{
  return static DispatchQoS.unspecified.getter();
}

uint64_t sub_2D950()
{
  return static DispatchQoS.userInitiated.getter();
}

uint64_t sub_2D960()
{
  return type metadata accessor for DispatchQoS();
}

uint64_t sub_2D970()
{
  return static DispatchTime.now()();
}

uint64_t sub_2D980()
{
  return type metadata accessor for DispatchTime();
}

uint64_t sub_2D990()
{
  return + infix(_:_:)();
}

uint64_t sub_2D9A0()
{
  return dispatch thunk of ControlCenter.reloadControls(ofKind:)();
}

uint64_t sub_2D9B0()
{
  return static ControlCenter.shared.getter();
}

uint64_t sub_2D9C0()
{
  return type metadata accessor for ControlCenter();
}

NSDictionary sub_2D9D0()
{
  return Dictionary._bridgeToObjectiveC()();
}

uint64_t sub_2D9E0()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_2D9F0()
{
  return Dictionary.description.getter();
}

NSString sub_2DA00()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_2DA10()
{
  return static String._forceBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_2DA20()
{
  return static String._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_2DA30()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_2DA40()
{
  return String.init<A>(describing:)();
}

uint64_t sub_2DA50()
{
  return String.hash(into:)();
}

uint64_t sub_2DA60()
{
  return String.count.getter();
}

void sub_2DA70(Swift::String a1)
{
}

Swift::Int sub_2DA80()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_2DA90()
{
  return specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
}

NSArray sub_2DAA0()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_2DAB0()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_2DAC0()
{
  return Array.description.getter();
}

uint64_t sub_2DAD0()
{
  return specialized Array._endMutation()();
}

uint64_t sub_2DAE0()
{
  return specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_2DAF0()
{
  return specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_2DB00()
{
  return static Bool._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_2DB10()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_2DB20()
{
  return TaskPriority.rawValue.getter();
}

uint64_t sub_2DB30()
{
  return type metadata accessor for TaskPriority();
}

NSSet sub_2DB40()
{
  return Set._bridgeToObjectiveC()();
}

uint64_t sub_2DB50()
{
  return static os_log_type_t.info.getter();
}

uint64_t sub_2DB60()
{
  return static os_log_type_t.debug.getter();
}

uint64_t sub_2DB70()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_2DB80()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_2DB90()
{
  return static MAMusicHaptics.enabledStatusDidChangeNotification.getter();
}

uint64_t sub_2DBA0()
{
  return type metadata accessor for OS_dispatch_queue.Attributes();
}

uint64_t sub_2DBB0()
{
  return OS_dispatch_queue.asyncAfter(deadline:qos:flags:execute:)();
}

uint64_t sub_2DBC0()
{
  return type metadata accessor for OS_dispatch_queue.SchedulerOptions();
}

uint64_t sub_2DBD0()
{
  return type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
}

uint64_t sub_2DBE0()
{
  return static OS_dispatch_queue.main.getter();
}

uint64_t sub_2DBF0()
{
  return OS_dispatch_queue.async(group:qos:flags:execute:)();
}

uint64_t sub_2DC00()
{
  return OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
}

uint64_t sub_2DC10()
{
  return static SHMediaItemProperty.timeRanges.getter();
}

uint64_t sub_2DC20()
{
  return static SHMediaItemProperty.frequencySkewRanges.getter();
}

uint64_t sub_2DC30()
{
  return type metadata accessor for NSNotificationCenter.Publisher();
}

uint64_t sub_2DC40()
{
  return NSNotificationCenter.publisher(for:object:)();
}

uint64_t sub_2DC50()
{
  return OS_dispatch_semaphore.wait(timeout:)();
}

Swift::Int sub_2DC60()
{
  return OS_dispatch_semaphore.signal()();
}

uint64_t sub_2DC70()
{
  return static NSObject.== infix(_:_:)();
}

uint64_t sub_2DC80()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_2DC90()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_2DCA0()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t sub_2DCB0()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

uint64_t sub_2DCC0()
{
  return _HashTable.previousHole(before:)();
}

Swift::Int sub_2DCD0(Swift::Int seed)
{
  return AnyHashable._rawHashValue(seed:)(seed);
}

uint64_t sub_2DCE0()
{
  return static AnyHashable.== infix(_:_:)();
}

uint64_t sub_2DCF0()
{
  return AnyHashable.init<A>(_:)();
}

uint64_t sub_2DD00()
{
  return static _SetStorage.allocate(capacity:)();
}

void sub_2DD10(Swift::Int a1)
{
}

uint64_t sub_2DD20()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_2DD30()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_2DD40()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_2DD50()
{
  return specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
}

uint64_t sub_2DD60()
{
  return specialized ContiguousArray._endMutation()();
}

uint64_t sub_2DD70()
{
  return specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
}

uint64_t sub_2DD80()
{
  return specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_2DD90()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_2DDA0()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_2DDB0()
{
  return static _DictionaryStorage.copy(original:)();
}

uint64_t sub_2DDC0()
{
  return static _DictionaryStorage.resize(original:capacity:move:)();
}

uint64_t sub_2DDD0()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_2DDE0()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t sub_2DE00()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t sub_2DE10()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_2DE20()
{
  return _bridgeAnythingNonVerbatimToObjectiveC<A>(_:)();
}

uint64_t sub_2DE30()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_2DE40()
{
  return Error.localizedDescription.getter();
}

uint64_t sub_2DE50()
{
  return Error._getEmbeddedNSError()();
}

uint64_t sub_2DE60()
{
  return Error._code.getter();
}

uint64_t sub_2DE70()
{
  return Error._domain.getter();
}

uint64_t sub_2DE80()
{
  return Error._userInfo.getter();
}

uint64_t sub_2DE90()
{
  return Hasher.init(_seed:)();
}

void sub_2DEA0(Swift::UInt64 a1)
{
}

Swift::Int sub_2DEB0()
{
  return Hasher._finalize()();
}

uint64_t AXApplicationSupportsHapticMusic()
{
  return _AXApplicationSupportsHapticMusic();
}

uint64_t AXLogHapticMusic()
{
  return _AXLogHapticMusic();
}

uint64_t AnalyticsSendEventLazy()
{
  return _AnalyticsSendEventLazy();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  return _CFAbsoluteTimeGetCurrent();
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return _CFNotificationCenterGetDarwinNotifyCenter();
}

CFNotificationCenterRef CFNotificationCenterGetLocalCenter(void)
{
  return _CFNotificationCenterGetLocalCenter();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
}

uint64_t MRContentItemCopyNowPlayingInfo()
{
  return _MRContentItemCopyNowPlayingInfo();
}

uint64_t MRContentItemGetITunesStoreIdentifier()
{
  return _MRContentItemGetITunesStoreIdentifier();
}

uint64_t MRMediaRemoteGetLocalOrigin()
{
  return _MRMediaRemoteGetLocalOrigin();
}

uint64_t MRMediaRemoteGetNowPlayingApplicationPlaybackState()
{
  return _MRMediaRemoteGetNowPlayingApplicationPlaybackState();
}

uint64_t MRMediaRemoteGetNowPlayingClientForOrigin()
{
  return _MRMediaRemoteGetNowPlayingClientForOrigin();
}

uint64_t MRMediaRemoteRequestNowPlayingPlaybackQueueSync()
{
  return _MRMediaRemoteRequestNowPlayingPlaybackQueueSync();
}

uint64_t MRMediaRemoteSetWantsNowPlayingNotifications()
{
  return _MRMediaRemoteSetWantsNowPlayingNotifications();
}

uint64_t MRNowPlayingClientGetBundleIdentifier()
{
  return _MRNowPlayingClientGetBundleIdentifier();
}

uint64_t MRNowPlayingClientGetParentAppBundleIdentifier()
{
  return _MRNowPlayingClientGetParentAppBundleIdentifier();
}

uint64_t MRNowPlayingClientGetProcessIdentifier()
{
  return _MRNowPlayingClientGetProcessIdentifier();
}

uint64_t MRPlaybackQueueGetContentItemAtOffset()
{
  return _MRPlaybackQueueGetContentItemAtOffset();
}

uint64_t MRPlaybackQueueGetContentItemsCount()
{
  return _MRPlaybackQueueGetContentItemsCount();
}

uint64_t MRPlaybackQueueRequestCreateDefault()
{
  return _MRPlaybackQueueRequestCreateDefault();
}

uint64_t _AXSHapticMusicEnabled()
{
  return __AXSHapticMusicEnabled();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return __sl_dlopen();
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return __swift_stdlib_bridgeErrorToNSError();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return __swift_stdlib_reportUnimplementedInitializer();
}

uint64_t abort_report_np()
{
  return _abort_report_np();
}

void bzero(void *a1, size_t a2)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return _dispatch_semaphore_create(value);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

void free(void *a1)
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

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

Class objc_getClass(const char *name)
{
  return _objc_getClass(name);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
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

id objc_retainAutorelease(id a1)
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

uint64_t swift_bridgeObjectRetain_n()
{
  return _swift_bridgeObjectRetain_n();
}

uint64_t swift_continuation_init()
{
  return _swift_continuation_init();
}

uint64_t swift_defaultActor_destroy()
{
  return _swift_defaultActor_destroy();
}

uint64_t swift_defaultActor_initialize()
{
  return _swift_defaultActor_initialize();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_dynamicCastClass()
{
  return _swift_dynamicCastClass();
}

uint64_t swift_dynamicCastClassUnconditional()
{
  return _swift_dynamicCastClassUnconditional();
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

uint64_t swift_getErrorValue()
{
  return _swift_getErrorValue();
}

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
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

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return _swift_getTypeByMangledNameInContextInMetadataState2();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}

uint64_t swift_initStackObject()
{
  return _swift_initStackObject();
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

uint64_t swift_setDeallocating()
{
  return _swift_setDeallocating();
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

uint64_t swift_task_create()
{
  return _swift_task_create();
}

uint64_t swift_task_dealloc()
{
  return _swift_task_dealloc();
}

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_unknownObjectRelease_n()
{
  return _swift_unknownObjectRelease_n();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_unknownObjectRetain_n()
{
  return _swift_unknownObjectRetain_n();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return _swift_unknownObjectWeakDestroy();
}

uint64_t swift_unknownObjectWeakInit()
{
  return _swift_unknownObjectWeakInit();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return _swift_unknownObjectWeakLoadStrong();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}

id objc_msgSend_BOOLForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "BOOLForKey:");
}

id objc_msgSend_handleIconElementRequest_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleIconElementRequest:completionHandler:");
}

id objc_msgSend_initWithIntent_controlKind_controlType_extensionBundleIdentifier_containerBundleIdentifier_size_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithIntent:controlKind:controlType:extensionBundleIdentifier:containerBundleIdentifier:size:");
}

id objc_msgSend_setBool_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBool:forKey:");
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return _[a1 sharedInstance];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return _[a1 standardUserDefaults];
}