uint64_t shouldUseLegacyPlugin(void *a1)
{
  void *v1;
  uint64_t v2;

  v1 = [a1 objectForKeyedSubscript:@"useNewPlugin"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v2 = [v1 BOOLValue] ^ 1;
  }
  else {
    v2 = 0;
  }

  return v2;
}

id sub_5400(uint64_t a1, Class a2)
{
  id v2 = [[a2 alloc] initWithDictionary:*(void *)(a1 + 32)];

  return v2;
}

id sub_5484(id a1, Class a2)
{
  id v2 = objc_alloc_init(a2);

  return v2;
}

uint64_t sub_57C4(uint64_t a1)
{
  return sub_57F8(a1, qword_11000);
}

uint64_t sub_57E0(uint64_t a1)
{
  return sub_57F8(a1, qword_11018);
}

uint64_t sub_57F8(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_9D50();
  sub_5858(v3, a2);
  sub_58BC(v3, (uint64_t)a2);
  return sub_9D30();
}

uint64_t *sub_5858(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_58BC(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_58F4()
{
  uint64_t v0 = sub_9D50();
  sub_5858(v0, qword_10D30);
  uint64_t v1 = sub_58BC(v0, (uint64_t)qword_10D30);
  if (qword_10D10 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_58BC(v0, (uint64_t)qword_11000);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);

  return v3(v1, v2, v0);
}

void sub_59BC(void (*a1)(id), uint64_t a2)
{
  id v3 = v2;
  if (qword_10D20 != -1) {
    goto LABEL_29;
  }
  while (1)
  {
    uint64_t v6 = sub_9D50();
    sub_58BC(v6, (uint64_t)qword_10D30);
    id v7 = v3;
    v8 = sub_9D40();
    os_log_type_t v9 = sub_9E80();
    if (os_log_type_enabled(v8, v9))
    {
      v10 = (uint8_t *)swift_slowAlloc();
      v11 = (void *)swift_slowAlloc();
      *(_DWORD *)v10 = 138412290;
      id v12 = [v7 dictionary];
      sub_9F10();
      void *v11 = v12;

      _os_log_impl(&dword_0, v8, v9, "Performing DevicePlaySound: %@", v10, 0xCu);
      sub_68FC(&qword_10D78);
      swift_arrayDestroy();
      sub_69D8();
      sub_69D8();
    }
    else
    {
    }
    unint64_t v13 = sub_673C(v7);
    if (v13)
    {
      uint64_t v14 = v13 >> 62 ? sub_9F90() : *(void *)((char *)&dword_10 + (v13 & 0xFFFFFFFFFFFFFF8));
      swift_bridgeObjectRelease();
      if (v14) {
        break;
      }
    }
    v31 = sub_9D40();
    os_log_type_t v32 = sub_9E90();
    if (os_log_type_enabled(v31, v32))
    {
      *(_WORD *)swift_slowAlloc() = 0;
      sub_6A04(&dword_0, v33, v34, "SADPDevicePlaySound: Empty devices list");
      sub_69D8();
    }

    if (!a1) {
      return;
    }
    sub_6940(0, &qword_10D70);
    uint64_t v35 = sub_69F0();
    v39 = sub_6A24(v35, v36, v37, v38);
    id v3 = [v39 dictionary];

    if (v3) {
      goto LABEL_38;
    }
    __break(1u);
LABEL_29:
    swift_once();
  }
  unint64_t v15 = sub_673C(v7);
  if (!v15)
  {
    __break(1u);
LABEL_43:
    __break(1u);
LABEL_44:
    __break(1u);
    return;
  }
  if (v15 >> 62) {
    uint64_t v16 = sub_9F90();
  }
  else {
    uint64_t v16 = *(void *)((char *)&dword_10 + (v15 & 0xFFFFFFFFFFFFFF8));
  }
  swift_bridgeObjectRelease();
  if (v16 >= 2)
  {
    v17 = sub_9D40();
    os_log_type_t v18 = sub_9E90();
    if (os_log_type_enabled(v17, v18))
    {
      v19 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v19 = 0;
      _os_log_impl(&dword_0, v17, v18, "SADPDevicePlaySound only supports one device at a time. Ignoring all but the first", v19, 2u);
      sub_69D8();
    }
  }
  unint64_t v20 = sub_673C(v7);
  if (!v20) {
    goto LABEL_43;
  }
  unint64_t v21 = v20;
  uint64_t v22 = v20 & 0xFFFFFFFFFFFFFF8;
  if (!(v20 >> 62))
  {
    if (*(void *)((char *)&dword_10 + (v20 & 0xFFFFFFFFFFFFFF8))) {
      goto LABEL_19;
    }
LABEL_33:
    swift_bridgeObjectRelease();
    goto LABEL_34;
  }
  if (!sub_9F90()) {
    goto LABEL_33;
  }
LABEL_19:
  if ((v21 & 0xC000000000000001) != 0)
  {
    id v23 = (id)sub_9F60();
  }
  else
  {
    if (!*(void *)(v22 + 16)) {
      __break(1u);
    }
    id v23 = *(id *)(v21 + 32);
  }
  v24 = v23;
  swift_bridgeObjectRelease();
  uint64_t v25 = sub_67AC(v24);
  if (v26)
  {
    uint64_t v27 = v25;
    uint64_t v28 = v26;
    sub_9CE0();
    v29 = (void *)swift_allocObject();
    v29[2] = v27;
    v29[3] = v28;
    v29[4] = v7;
    v29[5] = a1;
    v29[6] = a2;
    id v30 = v7;
    swift_retain();
    swift_bridgeObjectRetain();
    sub_68EC((uint64_t)a1);
    sub_9CF0();
    swift_bridgeObjectRelease();
    swift_release();
    swift_release();
    return;
  }
LABEL_34:
  v40 = sub_9D40();
  os_log_type_t v41 = sub_9E90();
  if (os_log_type_enabled(v40, v41))
  {
    *(_WORD *)swift_slowAlloc() = 0;
    sub_6A04(&dword_0, v42, v43, "Device id is required for SADPDevicePlaySound");
    sub_69D8();
  }

  if (a1)
  {
    sub_6940(0, &qword_10D70);
    uint64_t v44 = sub_69F0();
    v47 = sub_6A24(v44, v45, 0xD00000000000002CLL, v46);
    id v3 = [v47 dictionary];

    if (v3)
    {
LABEL_38:
      a1(v3);

      return;
    }
    goto LABEL_44;
  }
}

void sub_5F1C(__int16 a1, uint64_t a2, unint64_t a3, id a4, void (*a5)(id))
{
  if ((a1 & 0x100) != 0)
  {
    unsigned __int8 v13 = a1;
    if (qword_10D20 != -1) {
      swift_once();
    }
    uint64_t v14 = sub_9D50();
    sub_58BC(v14, (uint64_t)qword_10D30);
    unint64_t v15 = sub_9D40();
    os_log_type_t v16 = sub_9E90();
    if (os_log_type_enabled(v15, v16))
    {
      v17 = (uint8_t *)swift_slowAlloc();
      uint64_t v24 = swift_slowAlloc();
      *(_DWORD *)v17 = 136315138;
      uint64_t v18 = sub_9E10();
      sub_8EA0(v18, v19, &v24);
      sub_9F10();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_0, v15, v16, "Play sound failed: %s", v17, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    v10 = sub_6940(0, &qword_10D70);
    unint64_t v20 = sub_6AB8(v13);
    id v21 = v20;
    if (!a5) {
      goto LABEL_20;
    }
    a4 = [v20 dictionary];
    if (a4) {
      goto LABEL_19;
    }
    __break(1u);
  }
  else
  {
    if (qword_10D20 != -1) {
      swift_once();
    }
    uint64_t v9 = sub_9D50();
    sub_58BC(v9, (uint64_t)qword_10D30);
    swift_bridgeObjectRetain_n();
    v10 = sub_9D40();
    os_log_type_t v11 = sub_9EA0();
    if (os_log_type_enabled(v10, v11))
    {
      id v12 = (uint8_t *)swift_slowAlloc();
      uint64_t v24 = swift_slowAlloc();
      *(_DWORD *)id v12 = 136315138;
      swift_bridgeObjectRetain();
      sub_8EA0(a2, a3, &v24);
      sub_9F10();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_0, v10, v11, "Play sound succeeded on device %s", v12, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      goto LABEL_14;
    }
  }

  swift_bridgeObjectRelease_n();
LABEL_14:
  id v21 = [objc_allocWithZone((Class)SACommandSucceeded) init];
  sub_681C(a4);
  if (v22)
  {
    NSString v23 = sub_9DF0();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v23 = 0;
  }
  [v21 setRefId:v23];

  if (!a5) {
    goto LABEL_20;
  }
  a4 = [v21 dictionary];
  if (a4)
  {
LABEL_19:
    a5(a4);

LABEL_20:
    return;
  }
  __break(1u);
}

id sub_63F4()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SFMDevicePlaySoundHandler();
  return objc_msgSendSuper2(&v2, "init");
}

id sub_644C(uint64_t a1)
{
  if (a1)
  {
    v2.super.isa = sub_9DD0().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v2.super.isa = 0;
  }
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for SFMDevicePlaySoundHandler();
  id v3 = objc_msgSendSuper2(&v5, "initWithDictionary:", v2.super.isa);

  if (v3) {
  return v3;
  }
}

id sub_6544(uint64_t a1, uint64_t a2)
{
  if (a1)
  {
    v4.super.isa = sub_9DD0().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v4.super.isa = 0;
  }
  v8.receiver = v2;
  v8.super_class = (Class)type metadata accessor for SFMDevicePlaySoundHandler();
  id v5 = objc_msgSendSuper2(&v8, "initWithDictionary:context:", v4.super.isa, a2);
  swift_unknownObjectRelease();
  id v6 = v5;

  if (v6) {
  return v6;
  }
}

id sub_666C(void *a1)
{
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for SFMDevicePlaySoundHandler();
  id v3 = objc_msgSendSuper2(&v5, "initWithCoder:", a1);

  return v3;
}

id sub_66E4()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SFMDevicePlaySoundHandler();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for SFMDevicePlaySoundHandler()
{
  return self;
}

uint64_t sub_673C(void *a1)
{
  id v1 = [a1 devices];
  if (!v1) {
    return 0;
  }
  objc_super v2 = v1;
  sub_6940(0, (unint64_t *)&unk_10D80);
  uint64_t v3 = sub_9E50();

  return v3;
}

uint64_t sub_67AC(void *a1)
{
  id v2 = [a1 deviceId];

  if (!v2) {
    return 0;
  }
  uint64_t v3 = sub_9E00();

  return v3;
}

uint64_t sub_681C(void *a1)
{
  id v1 = [a1 refId];
  if (!v1) {
    return 0;
  }
  id v2 = v1;
  uint64_t v3 = sub_9E00();

  return v3;
}

uint64_t sub_6880()
{
  swift_bridgeObjectRelease();

  if (*(void *)(v0 + 40)) {
    swift_release();
  }

  return _swift_deallocObject(v0, 56, 7);
}

void sub_68D0(__int16 a1)
{
  sub_5F1C(a1 & 0x1FF, *(void *)(v1 + 16), *(void *)(v1 + 24), *(id *)(v1 + 32), *(void (**)(id))(v1 + 40));
}

uint64_t sub_68EC(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_68FC(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_6940(uint64_t a1, unint64_t *a2)
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

uint64_t sub_697C(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_698C()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_69C4()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

uint64_t sub_69D8()
{
  return swift_slowDealloc();
}

uint64_t sub_69F0()
{
  return 0;
}

void sub_6A04(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v5, a4, v6, 2u);
}

void *sub_6A24(uint64_t a1, char a2, uint64_t a3, uint64_t a4)
{
  id v8 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) init];
  uint64_t v9 = v8;
  if ((a2 & 1) == 0) {
    [v8 setErrorCode:a1];
  }
  if (a4) {
    sub_6B10(a3, a4, v9);
  }

  return v9;
}

void *sub_6AB8(unsigned __int8 a1)
{
  uint64_t v1 = a1 + 73601;
  uint64_t v2 = sub_9E10();
  return sub_6A24(v1, 0, v2, v3);
}

void sub_6B10(uint64_t a1, uint64_t a2, void *a3)
{
  NSString v4 = sub_9DF0();
  swift_bridgeObjectRelease();
  [a3 setReason:v4];
}

uint64_t sub_6B74()
{
  uint64_t v0 = sub_9D50();
  sub_5858(v0, qword_10D90);
  uint64_t v1 = sub_58BC(v0, (uint64_t)qword_10D90);
  if (qword_10D18 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_58BC(v0, (uint64_t)qword_11018);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);

  return v3(v1, v2, v0);
}

uint64_t sub_6C3C(uint64_t a1)
{
  *(void *)(v1 + OBJC_IVAR___SFMDeviceSyncHandler_syncGroupIterator) = a1;
  return swift_release();
}

void sub_6C54(void *a1)
{
  uint64_t v2 = v1;
  if (qword_10D28 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_9D50();
  sub_58BC(v4, (uint64_t)qword_10D90);
  os_log_type_t v5 = sub_9D40();
  os_log_type_t v6 = sub_9EA0();
  if (os_log_type_enabled(v5, v6))
  {
    *(_WORD *)sub_9C20() = 0;
    sub_9C70(&dword_0, v7, v8, "SFMDeviceSync beginning sync");
    sub_69D8();
  }

  if (sub_7A34(a1))
  {
    uint64_t v9 = sub_9D40();
    os_log_type_t v10 = sub_9EA0();
    if (os_log_type_enabled(v9, v10))
    {
      *(_WORD *)sub_9C20() = 0;
      sub_9C70(&dword_0, v11, v12, "SFMDeviceSync Sync info indicates cache should be evicted.");
      sub_69D8();
    }

    (*(void (**)(void))(**(void **)(v2 + OBJC_IVAR___SFMDeviceSyncHandler_syncDeviceProvider) + 136))();
  }
  uint64_t v13 = sub_6FD4();
  if (v13)
  {
    uint64_t v14 = v13;
    if (*(void *)(v13 + 16))
    {
      type metadata accessor for SyncGroupIterator();
      swift_allocObject();
      swift_unknownObjectRetain();
      uint64_t v15 = sub_8208(v14, a1);
      sub_6C3C(v15);
      uint64_t v16 = *(void *)(v2 + OBJC_IVAR___SFMDeviceSyncHandler_syncGroupIterator);
      if (v16 && *(unsigned char *)(v16 + 64) == 1)
      {
        v17 = (void *)sub_9D40();
        os_log_type_t v18 = sub_9EA0();
        if (sub_9C54(v18))
        {
          *(_WORD *)sub_9C20() = 0;
          sub_9C90(&dword_0, v19, v20, "SFMDeviceSync requesting reset sync");
          sub_69D8();
        }

        oslog = sub_9DF0();
        [a1 resetWithValidity:oslog];
      }
      else
      {
        oslog = sub_9D40();
        os_log_type_t v21 = sub_9EA0();
        if (os_log_type_enabled(oslog, v21))
        {
          uint64_t v22 = (uint8_t *)sub_9C20();
          *(_WORD *)uint64_t v22 = 0;
          _os_log_impl(&dword_0, oslog, v21, "SFMDeviceSync anchor and validity match, no sync needed", v22, 2u);
          sub_69D8();
        }
      }
    }
    else
    {
      swift_bridgeObjectRelease();
    }
  }
}

uint64_t sub_6FD4()
{
  uint64_t v50 = sub_9D60();
  sub_9BF4();
  uint64_t v47 = v2;
  ((void (*)(void))__chkstk_darwin)();
  sub_9C10();
  uint64_t v46 = (void *)(v4 - v3);
  sub_9DB0();
  sub_9BF4();
  uint64_t v48 = v6;
  uint64_t v49 = v5;
  uint64_t v7 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v44 = (char *)v41 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  char v45 = (char *)v41 - v9;
  uint64_t v10 = sub_9D70();
  sub_9BF4();
  uint64_t v43 = v11;
  __chkstk_darwin(v12);
  sub_9C10();
  uint64_t v15 = v14 - v13;
  uint64_t v42 = sub_9D90();
  sub_9BF4();
  uint64_t v17 = v16;
  __chkstk_darwin(v18);
  intptr_t v19 = sub_9C38();
  dispatch_semaphore_t v20 = dispatch_semaphore_create(v19);
  uint64_t v21 = swift_allocObject();
  *(void *)(v21 + 16) = 0;
  v41[0] = v21 + 16;
  v41[1] = *(void *)&v0[OBJC_IVAR___SFMDeviceSyncHandler_queue];
  uint64_t v22 = (void *)swift_allocObject();
  v22[2] = v0;
  v22[3] = v21;
  v22[4] = v20;
  aBlock[4] = sub_8C48;
  aBlock[5] = v22;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_79F0;
  aBlock[3] = &unk_C710;
  NSString v23 = _Block_copy(aBlock);
  uint64_t v24 = v0;
  swift_retain();
  uint64_t v25 = v20;
  sub_9D80();
  v51 = &_swiftEmptyArrayStorage;
  sub_9B5C(&qword_10F20, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_68FC(&qword_10F28);
  sub_9BA4(&qword_10F30, &qword_10F28);
  uint64_t v26 = v25;
  sub_9F30();
  sub_9ED0();
  _Block_release(v23);
  (*(void (**)(uint64_t, uint64_t))(v43 + 8))(v15, v10);
  (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v1, v42);
  swift_release();
  uint64_t v27 = v44;
  sub_9DA0();
  v29 = v46;
  uint64_t v28 = v47;
  *uint64_t v46 = 9;
  uint64_t v30 = v50;
  (*(void (**)(void *, void, uint64_t))(v28 + 104))(v29, enum case for DispatchTimeInterval.seconds(_:), v50);
  v31 = v45;
  sub_9DC0();
  (*(void (**)(void *, uint64_t))(v28 + 8))(v29, v30);
  os_log_type_t v32 = *(void (**)(char *, uint64_t))(v48 + 8);
  uint64_t v33 = v27;
  uint64_t v34 = v49;
  v32(v33, v49);
  LOBYTE(v30) = sub_9EF0();
  v32(v31, v34);
  if (v30)
  {
    if (qword_10D28 != -1) {
      swift_once();
    }
    uint64_t v36 = sub_9D50();
    sub_58BC(v36, (uint64_t)qword_10D90);
    uint64_t v37 = sub_9D40();
    os_log_type_t v38 = sub_9E90();
    if (sub_9C54(v38))
    {
      v39 = (uint8_t *)sub_9C20();
      *(_WORD *)v39 = 0;
      _os_log_impl(&dword_0, v37, (os_log_type_t)v32, "SFMDeviceSync Timed out waiting for loading devices", v39, 2u);
      sub_69D8();
      swift_release();
    }
    else
    {
      swift_release();
    }
    return 0;
  }
  else
  {

    swift_beginAccess();
    uint64_t v35 = *(void *)(v21 + 16);
    swift_bridgeObjectRetain();
    swift_release();
  }
  return v35;
}

uint64_t sub_74D0(uint64_t a1, uint64_t a2, void *a3)
{
  if (qword_10D28 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_9D50();
  sub_58BC(v6, (uint64_t)qword_10D90);
  uint64_t v7 = sub_9D40();
  os_log_type_t v8 = sub_9EA0();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl(&dword_0, v7, v8, "SFMDeviceSync loading devices", v9, 2u);
    swift_slowDealloc();
  }

  uint64_t v10 = *(void *)(a1 + OBJC_IVAR___SFMDeviceSyncHandler_syncDeviceProvider);
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = a2;
  *(void *)(v11 + 24) = a3;
  uint64_t v12 = *(void (**)(Swift::Int (*)(uint64_t, uint64_t, uint64_t, char), uint64_t))(*(void *)v10 + 128);
  swift_retain();
  id v13 = a3;
  v12(sub_8CF4, v11);

  return swift_release();
}

Swift::Int sub_7640(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5)
{
  uint64_t v7 = (uint64_t *)(a5 + 16);
  if (a4)
  {
    swift_errorRetain();
    if (qword_10D28 != -1) {
      swift_once();
    }
    uint64_t v13 = sub_9D50();
    sub_58BC(v13, (uint64_t)qword_10D90);
    swift_errorRetain();
    swift_errorRetain();
    uint64_t v14 = sub_9D40();
    os_log_type_t v15 = sub_9E90();
    if (os_log_type_enabled(v14, v15))
    {
      uint64_t v16 = (uint8_t *)swift_slowAlloc();
      v20[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v16 = 136315138;
      swift_errorRetain();
      sub_68FC(&qword_10F38);
      uint64_t v17 = sub_9E10();
      sub_8EA0(v17, v18, v20);
      sub_9F10();
      swift_bridgeObjectRelease();
      sub_9658(a1, a2, a3, 1);
      sub_9658(a1, a2, a3, 1);
      _os_log_impl(&dword_0, v14, v15, "The sync device provider errored with %s", v16, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      sub_9658(a1, a2, a3, 1);
    }
    else
    {
      sub_9658(a1, a2, a3, 1);
      sub_9658(a1, a2, a3, 1);
      swift_errorRelease();
    }
    swift_beginAccess();
    *uint64_t v7 = 0;
  }
  else
  {
    if (qword_10D28 != -1) {
      swift_once();
    }
    uint64_t v8 = sub_9D50();
    sub_58BC(v8, (uint64_t)qword_10D90);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v9 = sub_9D40();
    os_log_type_t v10 = sub_9EA0();
    if (os_log_type_enabled(v9, v10))
    {
      uint64_t v11 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v11 = 134217984;
      v20[0] = *(void *)(a3 + 16);
      sub_9F10();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_0, v9, v10, "The sync device provider provided %ld SyncDevices", v11, 0xCu);
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    swift_beginAccess();
    *uint64_t v7 = a3;
    swift_bridgeObjectRetain();
  }
  swift_bridgeObjectRelease();
  return sub_9F00();
}

uint64_t sub_79F0(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

id sub_7A34(void *a1)
{
  id result = [a1 reasons];
  if (result)
  {
    uint64_t v2 = result;
    uint64_t v3 = sub_9E70();

    LOBYTE(v2) = sub_7AB8(0xD000000000000027, 0x800000000000AAC0, v3);
    swift_bridgeObjectRelease();
    return (id)(v2 & 1);
  }
  return result;
}

uint64_t sub_7AB8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a3 + 16))
  {
    sub_9FD0();
    sub_9E20();
    Swift::Int v6 = sub_9FE0();
    uint64_t v7 = -1 << *(unsigned char *)(a3 + 32);
    unint64_t v8 = v6 & ~v7;
    uint64_t v9 = a3 + 56;
    if ((*(void *)(a3 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8))
    {
      uint64_t v10 = *(void *)(a3 + 48);
      uint64_t v11 = (void *)(v10 + 16 * v8);
      BOOL v12 = *v11 == a1 && v11[1] == a2;
      if (v12 || (sub_9FC0() & 1) != 0) {
        return 1;
      }
      uint64_t v14 = ~v7;
      unint64_t v15 = (v8 + 1) & v14;
      if ((*(void *)(v9 + ((v15 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v15))
      {
        while (1)
        {
          uint64_t v16 = (void *)(v10 + 16 * v15);
          BOOL v17 = *v16 == a1 && v16[1] == a2;
          if (v17 || (sub_9FC0() & 1) != 0) {
            break;
          }
          uint64_t result = 0;
          unint64_t v15 = (v15 + 1) & v14;
          if (((*(void *)(v9 + ((v15 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v15) & 1) == 0) {
            return result;
          }
        }
        return 1;
      }
    }
  }
  return 0;
}

id sub_7BF0(int a1, uint64_t a2, id a3)
{
  if (*(void *)(v3 + OBJC_IVAR___SFMDeviceSyncHandler_syncGroupIterator))
  {
    Swift::Int v6 = sub_8AC8();
    if (v6)
    {
      uint64_t v7 = v6;
      swift_retain();
      [a3 setIsDelete:0];
      [a3 setObject:v7];
      NSString v8 = sub_9DF0();
      swift_bridgeObjectRelease();
      [a3 setPostAnchor:v8];
    }
    else
    {
      swift_retain();
      if (a2) {
        NSString v10 = sub_9DF0();
      }
      else {
        NSString v10 = 0;
      }
      [a3 setPostAnchor:v10];
    }
    return (id)swift_release();
  }
  else
  {
    return [a3 setPostAnchor:0];
  }
}

uint64_t sub_7DD4()
{
  if (qword_10D28 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_9D50();
  sub_58BC(v0, (uint64_t)qword_10D90);
  uint64_t v1 = (void *)sub_9D40();
  os_log_type_t v2 = sub_9EA0();
  if (sub_9C54(v2))
  {
    *(_WORD *)sub_9C20() = 0;
    sub_9C90(&dword_0, v3, v4, "SFMDeviceSync syncDidEnd");
    sub_69D8();
  }

  return sub_6C3C(0);
}

id sub_7EE0()
{
  uint64_t v11 = sub_9EC0();
  sub_9BF4();
  uint64_t v3 = v2;
  __chkstk_darwin(v4);
  sub_9C38();
  uint64_t v5 = sub_9EB0();
  __chkstk_darwin(v5);
  sub_9C10();
  uint64_t v6 = sub_9D90();
  __chkstk_darwin(v6 - 8);
  sub_9C10();
  *(void *)&v0[OBJC_IVAR___SFMDeviceSyncHandler_syncGroupIterator] = 0;
  uint64_t v10 = OBJC_IVAR___SFMDeviceSyncHandler_queue;
  sub_9B1C();
  uint64_t v7 = v0;
  sub_9D80();
  uint64_t v13 = &_swiftEmptyArrayStorage;
  sub_9B5C(&qword_10F88, (void (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes);
  sub_68FC(&qword_10F90);
  sub_9BA4(&qword_10F98, &qword_10F90);
  sub_9F30();
  (*(void (**)(uint64_t, void, uint64_t))(v3 + 104))(v1, enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:), v11);
  *(void *)&v0[v10] = sub_9EE0();
  uint64_t v8 = OBJC_IVAR___SFMDeviceSyncHandler_syncDeviceProvider;
  sub_9D20();
  *(void *)&v7[v8] = sub_9D10();

  v12.receiver = v7;
  v12.super_class = (Class)type metadata accessor for SFMDeviceSyncHandler();
  return objc_msgSendSuper2(&v12, "init");
}

id sub_8154()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SFMDeviceSyncHandler();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for SFMDeviceSyncHandler()
{
  return self;
}

uint64_t sub_8208(uint64_t a1, void *a2)
{
  uint64_t v3 = v2;
  sub_9758();
  sub_9E60();
  uint64_t v6 = sub_9FB0();
  *(void *)(v2 + 32) = v6;
  *(void *)(v2 + 40) = v7;
  uint64_t v23 = v6;
  uint64_t v24 = v7;
  swift_bridgeObjectRetain();
  v25._countAndFlagsBits = 124;
  v25._object = (void *)0xE100000000000000;
  sub_9E30(v25);
  v26._countAndFlagsBits = sub_9FB0();
  sub_9E30(v26);
  swift_bridgeObjectRelease();
  *(void *)(v2 + 48) = v23;
  *(void *)(v2 + 56) = v24;
  swift_bridgeObjectRetain();
  id v8 = [a2 anchor];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = sub_9E00();
    uint64_t v12 = v11;

    if (v23 == v10 && v24 == v12)
    {
      swift_bridgeObjectRelease_n();
    }
    else
    {
      char v14 = sub_9FC0();
      swift_bridgeObjectRelease();
      id v15 = (id)swift_bridgeObjectRelease();
      if ((v14 & 1) == 0) {
        goto LABEL_14;
      }
    }
    id v15 = [a2 validity];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = sub_9E00();
      uint64_t v19 = v18;

      if (v17 == 0xD000000000000016 && v19 == 0x800000000000AE00)
      {
        swift_bridgeObjectRelease();
        *(unsigned char *)(v3 + 64) = 0;
      }
      else
      {
        char v21 = sub_9FC0();
        id v15 = (id)swift_bridgeObjectRelease();
        *(unsigned char *)(v3 + 64) = (v21 & 1) == 0;
        if ((v21 & 1) == 0) {
          goto LABEL_15;
        }
      }
      swift_unknownObjectRelease();
      swift_bridgeObjectRelease();
      dispatch_semaphore_t v20 = (unint64_t *)&_swiftEmptyArrayStorage;
      goto LABEL_18;
    }
  }
  else
  {
    id v15 = (id)swift_bridgeObjectRelease();
  }
LABEL_14:
  *(unsigned char *)(v2 + 64) = 1;
LABEL_15:
  __chkstk_darwin(v15);
  swift_bridgeObjectRetain();
  dispatch_semaphore_t v20 = sub_8948(a1, (uint64_t (*)(uint64_t, void *))sub_97A4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
LABEL_18:
  *(void *)(v3 + 16) = v20;
  *(void *)(v3 + 24) = 0;
  return v3;
}

void sub_84B4(uint64_t a1)
{
  sub_8560();
  swift_bridgeObjectRetain();
  v2._countAndFlagsBits = 124;
  v2._object = (void *)0xE100000000000000;
  sub_9E30(v2);
  if (__OFADD__(a1, 1))
  {
    __break(1u);
  }
  else
  {
    v3._countAndFlagsBits = sub_9FB0();
    sub_9E30(v3);
    swift_bridgeObjectRelease();
  }
}

uint64_t sub_8560()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_68FC(&qword_10F60);
  uint64_t v3 = __chkstk_darwin(v2 - 8);
  uint64_t v5 = (char *)&v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  uint64_t v7 = (char *)&v25 - v6;
  id v8 = [objc_allocWithZone((Class)SAPerson) init];
  sub_98B8((uint64_t)(v1 + 2), (uint64_t)v30);
  sub_98B8((uint64_t)v30, (uint64_t)&v31);
  if (v32) {
    sub_9AC4(v31, v32, v8);
  }
  sub_98B8((uint64_t)(v1 + 4), (uint64_t)v29);
  sub_98B8((uint64_t)v29, (uint64_t)&v33);
  if (v34) {
    sub_9A6C(v33, v34, v8);
  }
  sub_68FC(&qword_10F70);
  uint64_t v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_A7E0;
  *(void *)(v9 + 32) = sub_9920(v8, (SEL *)&selRef_firstName);
  *(void *)(v9 + 40) = v10;
  *(void *)(v9 + 48) = sub_9920(v8, (SEL *)&selRef_lastName);
  *(void *)(v9 + 56) = v11;
  Swift::Int v25 = 0;
  unint64_t v26 = 0xE000000000000000;
  id v12 = v8;
  sub_9F40(32);
  swift_bridgeObjectRelease();
  Swift::Int v25 = 0xD00000000000001ELL;
  unint64_t v26 = 0x800000000000AE20;
  sub_68FC(&qword_10F68);
  sub_9980();
  uint64_t v13 = sub_9E60();
  swift_bridgeObjectRelease();
  unint64_t v27 = v13;
  v35._countAndFlagsBits = sub_9FB0();
  sub_9E30(v35);
  swift_bridgeObjectRelease();
  sub_9CC0();
  swift_bridgeObjectRelease();
  uint64_t v14 = sub_9CD0();
  uint64_t result = sub_99EC((uint64_t)v7, 1, v14);
  if (result == 1)
  {
    __break(1u);
  }
  else
  {
    sub_9CB0(v16);
    uint64_t v18 = v17;
    uint64_t v19 = *(void (**)(char *, uint64_t))(*(void *)(v14 - 8) + 8);
    v19(v7, v14);
    [v12 setIdentifier:v18];

    id v20 = [objc_allocWithZone((Class)SADPDeviceDetail) init];
    sub_9A14(*v1, v1[1], v20);
    [v20 setOwner:v12];
    Swift::Int v25 = 0;
    unint64_t v26 = 0xE000000000000000;
    id v21 = v20;
    sub_9F40(33);
    swift_bridgeObjectRelease();
    unint64_t v27 = 0xD00000000000001FLL;
    unint64_t v28 = 0x800000000000AE40;
    sub_9FD0();
    sub_9D00();
    Swift::Int v25 = sub_9FE0();
    v36._countAndFlagsBits = sub_9FB0();
    sub_9E30(v36);
    swift_bridgeObjectRelease();
    sub_9CC0();
    swift_bridgeObjectRelease();
    uint64_t result = sub_99EC((uint64_t)v5, 1, v14);
    if (result != 1)
    {
      sub_9CB0(v22);
      uint64_t v24 = v23;
      v19(v5, v14);
      [v21 setIdentifier:v24];

      return (uint64_t)v21;
    }
  }
  __break(1u);
  return result;
}

unint64_t *sub_8948(uint64_t a1, uint64_t (*a2)(uint64_t, void *))
{
  uint64_t v23 = (unint64_t *)&_swiftEmptyArrayStorage;
  sub_97AC(0, 0, 0);
  uint64_t v3 = (unint64_t *)&_swiftEmptyArrayStorage;
  uint64_t v4 = *(void *)(a1 + 16);
  swift_bridgeObjectRetain();
  if (v4)
  {
    uint64_t v5 = 0;
    uint64_t v6 = (uint64_t *)(a1 + 40);
    do
    {
      uint64_t v7 = *v6;
      uint64_t v8 = v6[1];
      uint64_t v9 = v6[4];
      v20[0] = *(v6 - 1);
      v20[1] = v7;
      v20[2] = v8;
      long long v21 = *((_OWORD *)v6 + 1);
      uint64_t v22 = v9;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      uint64_t v10 = a2(v5, v20);
      unint64_t v12 = v11;
      unint64_t v14 = v13;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v23 = v3;
      unint64_t v16 = v3[2];
      unint64_t v15 = v3[3];
      if (v16 >= v15 >> 1)
      {
        sub_97AC((char *)(v15 > 1), v16 + 1, 1);
        uint64_t v3 = v23;
      }
      ++v5;
      v6 += 6;
      v3[2] = v16 + 1;
      uint64_t v17 = &v3[3 * v16];
      v17[4] = v10;
      v17[5] = v12;
      v17[6] = v14;
    }
    while (v4 != v5);
  }
  swift_bridgeObjectRelease();
  return v3;
}

void *sub_8AC8()
{
  uint64_t v2 = *(void *)(v0 + 16);
  unint64_t v1 = *(void *)(v0 + 24);
  unint64_t v3 = *(void *)(v2 + 16);
  if (v1 == v3) {
    return 0;
  }
  if (v1 < v3)
  {
    uint64_t v4 = *(void **)(v2 + 24 * v1 + 32);
    *(void *)(v0 + 24) = v1 + 1;
    id v5 = v4;
    swift_bridgeObjectRetain();
    return v4;
  }
  __break(1u);
  return result;
}

uint64_t sub_8B44()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_8B74()
{
  uint64_t v0 = sub_8B44();

  return _swift_deallocClassInstance(v0, 65, 7);
}

uint64_t type metadata accessor for SyncGroupIterator()
{
  return self;
}

uint64_t sub_8BC8()
{
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_8C00()
{
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_8C48()
{
  return sub_74D0(*(void *)(v0 + 16), *(void *)(v0 + 24), *(void **)(v0 + 32));
}

uint64_t sub_8C54(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_8C64()
{
  return swift_release();
}

uint64_t sub_8C6C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_8CB4()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

Swift::Int sub_8CF4(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  return sub_7640(a1, a2, a3, a4 & 1, *(void *)(v4 + 16));
}

char *sub_8D00(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)sub_9FA0();
    __break(1u);
  }
  else if (__dst != __src || &__src[24 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 24 * a2);
  }
  return __src;
}

uint64_t sub_8D9C(unint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a2 < 0 || (a3 + 24 * a2 > a1 ? (BOOL v6 = a1 + 24 * a2 > a3) : (BOOL v6 = 0), v6))
  {
    uint64_t v8 = sub_9FA0();
    __break(1u);
  }
  else
  {
    uint64_t v7 = sub_68FC(&qword_10F58);
    uint64_t v8 = a3;
    unint64_t v9 = a1;
    uint64_t v10 = a2;
  }
  return _swift_arrayInitWithCopy(v8, v9, v10, v7);
}

uint64_t sub_8EA0(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_8F74(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_96F8((uint64_t)v12, *a3);
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
      sub_96F8((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_96A8((uint64_t)v12);
  return v7;
}

uint64_t sub_8F74(void *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      sub_90CC((char *)__src, HIBYTE(a6) & 0xF, __dst);
      sub_9F20();
      uint64_t result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    uint64_t result = (uint64_t)sub_91A4(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    uint64_t v8 = sub_9F70();
    if (!v8)
    {
      uint64_t result = sub_9F80();
      __break(1u);
      return result;
    }
  }
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

void *sub_90CC(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_9FA0();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

void *sub_91A4(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_923C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_9418(0, v2[2] + 1, 1, (uint64_t)v2);
  }
  unint64_t v4 = v2[2];
  unint64_t v3 = v2[3];
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_9418((char *)(v3 > 1), v4 + 1, 1, (uint64_t)v2);
  }
  v2[2] = v4 + 1;
  *((unsigned char *)v2 + v4 + 32) = 0;
  return v2;
}

void *sub_923C(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0)
  {
    Swift::Int v2 = sub_9E40();
    if (v2) {
      goto LABEL_6;
    }
    return &_swiftEmptyArrayStorage;
  }
  if ((a2 & 0x2000000000000000) != 0) {
    Swift::Int v2 = HIBYTE(a2) & 0xF;
  }
  else {
    Swift::Int v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (!v2) {
    return &_swiftEmptyArrayStorage;
  }
LABEL_6:
  unint64_t v3 = sub_93B0(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    unint64_t v4 = v3;
    uint64_t v5 = sub_9F50();
    if ((v6 & 1) != 0 || v5 != v2) {
      goto LABEL_14;
    }
    return v4;
  }
  sub_9FA0();
  __break(1u);
LABEL_14:
  uint64_t result = (void *)sub_9F80();
  __break(1u);
  return result;
}

void *sub_93B0(uint64_t a1, uint64_t a2)
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
  sub_68FC(&qword_10F40);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_9418(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *(void *)(a4 + 24);
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
  int64_t v8 = *(void *)(a4 + 16);
  if (v7 <= v8) {
    int64_t v9 = *(void *)(a4 + 16);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    sub_68FC(&qword_10F40);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  unint64_t v12 = v10 + 32;
  unint64_t v13 = (char *)(a4 + 32);
  if (v5)
  {
    sub_95C8(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_94F0(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_94F0(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_9FA0();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

char *sub_95C8(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    __src = (char *)sub_9FA0();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

uint64_t sub_9658(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  if (a4)
  {
    return swift_errorRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_96A8(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_96F8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_9758()
{
  unint64_t result = qword_10F48;
  if (!qword_10F48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10F48);
  }
  return result;
}

void sub_97A4(uint64_t a1)
{
}

char *sub_97AC(char *a1, int64_t a2, char a3)
{
  unint64_t result = sub_97CC(a1, a2, a3, *v3);
  *uint64_t v3 = (uint64_t)result;
  return result;
}

char *sub_97CC(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *(void *)(a4 + 24);
    uint64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
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
  if (v9)
  {
    sub_68FC(&qword_10F50);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 24);
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  unint64_t v12 = v10 + 32;
  unint64_t v13 = (char *)(a4 + 32);
  if (v5)
  {
    sub_8D00(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_8D9C((unint64_t)v13, v8, (unint64_t)v12);
  }
  swift_release();
  return v10;
}

uint64_t sub_98B8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_68FC(&qword_10F68);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_9920(void *a1, SEL *a2)
{
  id v2 = [a1 *a2];
  if (!v2) {
    return 0;
  }
  uint64_t v3 = v2;
  uint64_t v4 = sub_9E00();

  return v4;
}

unint64_t sub_9980()
{
  unint64_t result = qword_10F78;
  if (!qword_10F78)
  {
    sub_8C6C(&qword_10F68);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10F78);
  }
  return result;
}

uint64_t sub_99EC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

void sub_9A14(uint64_t a1, uint64_t a2, void *a3)
{
  NSString v4 = sub_9DF0();
  [a3 setDeviceName:v4];
}

void sub_9A6C(uint64_t a1, uint64_t a2, void *a3)
{
  NSString v4 = sub_9DF0();
  [a3 setLastName:v4];
}

void sub_9AC4(uint64_t a1, uint64_t a2, void *a3)
{
  NSString v4 = sub_9DF0();
  [a3 setFirstName:v4];
}

unint64_t sub_9B1C()
{
  unint64_t result = qword_10F80;
  if (!qword_10F80)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10F80);
  }
  return result;
}

uint64_t sub_9B5C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_9BA4(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_8C6C(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_9C20()
{
  return swift_slowAlloc();
}

uint64_t sub_9C38()
{
  return 0;
}

BOOL sub_9C54(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

void sub_9C70(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v5, a4, v6, 2u);
}

void sub_9C90(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v5, a4, v6, 2u);
}

void sub_9CB0(NSURL *retstr@<X8>)
{
}

uint64_t sub_9CC0()
{
  return URL.init(string:)();
}

uint64_t sub_9CD0()
{
  return type metadata accessor for URL();
}

uint64_t sub_9CE0()
{
  return FindDeviceSessionManager.shared.unsafeMutableAddressor();
}

uint64_t sub_9CF0()
{
  return FindDeviceSessionManager.playSound(deviceId:completion:)();
}

uint64_t sub_9D00()
{
  return SyncDevice.hash(into:)();
}

uint64_t sub_9D10()
{
  return CachingSyncDeviceProvider.__allocating_init()();
}

uint64_t sub_9D20()
{
  return type metadata accessor for CachingSyncDeviceProvider();
}

uint64_t sub_9D30()
{
  return static SFMLog.logger(category:)();
}

uint64_t sub_9D40()
{
  return Logger.logObject.getter();
}

uint64_t sub_9D50()
{
  return type metadata accessor for Logger();
}

uint64_t sub_9D60()
{
  return type metadata accessor for DispatchTimeInterval();
}

uint64_t sub_9D70()
{
  return type metadata accessor for DispatchWorkItemFlags();
}

uint64_t sub_9D80()
{
  return static DispatchQoS.unspecified.getter();
}

uint64_t sub_9D90()
{
  return type metadata accessor for DispatchQoS();
}

uint64_t sub_9DA0()
{
  return static DispatchTime.now()();
}

uint64_t sub_9DB0()
{
  return type metadata accessor for DispatchTime();
}

uint64_t sub_9DC0()
{
  return + infix(_:_:)();
}

NSDictionary sub_9DD0()
{
  return Dictionary._bridgeToObjectiveC()();
}

uint64_t sub_9DE0()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

NSString sub_9DF0()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_9E00()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_9E10()
{
  return String.init<A>(describing:)();
}

uint64_t sub_9E20()
{
  return String.hash(into:)();
}

void sub_9E30(Swift::String a1)
{
}

Swift::Int sub_9E40()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_9E50()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_9E60()
{
  return Array<A>.hashValue.getter();
}

uint64_t sub_9E70()
{
  return static Set._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_9E80()
{
  return static os_log_type_t.debug.getter();
}

uint64_t sub_9E90()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_9EA0()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_9EB0()
{
  return type metadata accessor for OS_dispatch_queue.Attributes();
}

uint64_t sub_9EC0()
{
  return type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
}

uint64_t sub_9ED0()
{
  return OS_dispatch_queue.async(group:qos:flags:execute:)();
}

uint64_t sub_9EE0()
{
  return OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
}

uint64_t sub_9EF0()
{
  return OS_dispatch_semaphore.wait(timeout:)();
}

Swift::Int sub_9F00()
{
  return OS_dispatch_semaphore.signal()();
}

uint64_t sub_9F10()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_9F20()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_9F30()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

void sub_9F40(Swift::Int a1)
{
}

uint64_t sub_9F50()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_9F60()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_9F70()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_9F80()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_9F90()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_9FA0()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t sub_9FB0()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t sub_9FC0()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_9FD0()
{
  return Hasher.init(_seed:)();
}

Swift::Int sub_9FE0()
{
  return Hasher._finalize()();
}

Class NSClassFromString(NSString *aClassName)
{
  return _NSClassFromString(aClassName);
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

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return _dispatch_semaphore_create(value);
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

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
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

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _[a1 BOOLValue];
}

id objc_msgSend_bundleWithPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleWithPath:");
}

id objc_msgSend_chooseTargetWithDictionary_initBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "chooseTargetWithDictionary:initBlock:");
}

id objc_msgSend_commandName(void *a1, const char *a2, ...)
{
  return _[a1 commandName];
}

id objc_msgSend_handlerClass(void *a1, const char *a2, ...)
{
  return _[a1 handlerClass];
}

id objc_msgSend_handlerClassName(void *a1, const char *a2, ...)
{
  return _[a1 handlerClassName];
}

id objc_msgSend_initWithDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDictionary:");
}

id objc_msgSend_isLoaded(void *a1, const char *a2, ...)
{
  return _[a1 isLoaded];
}

id objc_msgSend_legacyHandlerClass(void *a1, const char *a2, ...)
{
  return _[a1 legacyHandlerClass];
}

id objc_msgSend_legacyHandlerClassName(void *a1, const char *a2, ...)
{
  return _[a1 legacyHandlerClassName];
}

id objc_msgSend_load(void *a1, const char *a2, ...)
{
  return _[a1 load];
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKeyedSubscript:");
}