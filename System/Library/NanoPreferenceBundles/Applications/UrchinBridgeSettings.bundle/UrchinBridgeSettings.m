void sub_4E50(id a1)
{
  uint64_t vars8;

  qword_11818 = (uint64_t)os_log_create("com.apple.urchin", "settings");

  _objc_release_x1();
}

id sub_4F78(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setSelectedLocation:");
  v2 = *(void **)(a1 + 32);

  return [v2 reloadSpecifiers];
}

void sub_5358(id a1)
{
  qword_11820 = objc_alloc_init(UBSLocalizedString);

  _objc_release_x1();
}

void sub_5470(id a1)
{
  qword_11838 = (uint64_t)os_log_create("com.apple.urchin", "settings");

  _objc_release_x1();
}

id sub_5580(uint64_t a1, uint64_t a2, void *a3)
{
  v5 = *(void **)(a1 + 32);
  id v6 = a3;
  [v5 setLocations:a2];
  [*(id *)(a1 + 32) setSelectedLocation:v6];

  v7 = *(void **)(a1 + 32);

  return [v7 reloadSpecifiers];
}

id sub_5CE4(uint64_t a1, void *a2)
{
  v3 = [a2 id];
  id v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

id sub_5DFC()
{
  id result = [objc_allocWithZone((Class)type metadata accessor for LocationWrapper()) init];
  qword_11970 = (uint64_t)result;
  return result;
}

id sub_5E8C()
{
  v1 = v0;
  sub_9400();
  uint64_t v2 = sub_94C0();
  uint64_t v3 = sub_94B0();
  id v4 = (uint64_t *)&v1[OBJC_IVAR___USLocationWrapper_staticLocationProvider];
  v4[3] = v2;
  v4[4] = (uint64_t)&protocol witness table for SyncedPreferenceManager;
  *id v4 = v3;
  uint64_t v5 = (uint64_t)&v1[OBJC_IVAR___USLocationWrapper_currentLocationProvider];
  *(void *)&v1[OBJC_IVAR___USLocationWrapper_currentLocationProvider + 24] = &type metadata for DummyCurrentLocationProvider;
  *(void *)(v5 + 32) = sub_91C4();
  sub_94A0();
  sub_9218(v5, (uint64_t)v12);
  sub_9218((uint64_t)v4, (uint64_t)v11);
  uint64_t v9 = v2;
  v10 = &protocol witness table for SyncedPreferenceManager;
  uint64_t v8 = sub_94B0();
  *(void *)&v1[OBJC_IVAR___USLocationWrapper_selectedLocationManager] = sub_9490();

  v7.receiver = v1;
  v7.super_class = (Class)type metadata accessor for LocationWrapper();
  return objc_msgSendSuper2(&v7, "init");
}

uint64_t sub_5FF0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[10] = a5;
  v6[11] = a6;
  v6[9] = a4;
  sub_7C48(&qword_11780);
  v6[12] = swift_task_alloc();
  sub_7C48(&qword_117B8);
  v6[13] = swift_task_alloc();
  v6[14] = swift_task_alloc();
  uint64_t v7 = sub_94E0();
  v6[15] = v7;
  v6[16] = *(void *)(v7 - 8);
  v6[17] = swift_task_alloc();
  uint64_t v8 = sub_9460();
  v6[18] = v8;
  v6[19] = *(void *)(v8 - 8);
  v6[20] = swift_task_alloc();
  v6[21] = swift_task_alloc();
  return _swift_task_switch(sub_6190, 0, 0);
}

uint64_t sub_6190()
{
  v1 = (void *)(*(void *)(v0 + 72) + OBJC_IVAR___USLocationWrapper_staticLocationProvider);
  uint64_t v2 = v1[3];
  uint64_t v3 = v1[4];
  sub_89BC(v1, v2);
  id v4 = (void *)swift_task_alloc();
  *(void *)(v0 + 176) = v4;
  *id v4 = v0;
  v4[1] = sub_6250;
  return dispatch thunk of StaticLocationStore.getLocations()(v2, v3);
}

uint64_t sub_6250(uint64_t a1)
{
  *(void *)(*(void *)v1 + 184) = a1;
  swift_task_dealloc();
  return _swift_task_switch(sub_6350, 0, 0);
}

uint64_t sub_6350()
{
  Class super_class = v0[11].super_class;
  uint64_t v2 = *((void *)super_class + 2);
  if (v2)
  {
    Class v3 = v0[9].super_class;
    sub_9660();
    id v4 = (void (*)(Class, char *, id))*((void *)v3 + 2);
    Class v3 = (Class)((char *)v3 + 16);
    uint64_t v5 = (char *)super_class
       + ((*((unsigned __int8 *)v3 + 64) + 32) & ~(unint64_t)*((unsigned __int8 *)v3 + 64));
    uint64_t v24 = *((void *)v3 + 7);
    v25 = v4;
    uint64_t v6 = (void (**)(id, id))((char *)v3 - 8);
    do
    {
      receiver = (objc_class *)v0[10].receiver;
      Class v8 = v0[10].super_class;
      id v9 = v0[9].receiver;
      v25(v8, v5, v9);
      v25(receiver, (char *)v8, v9);
      uint64_t v10 = (objc_class *)type metadata accessor for SettingLocation();
      v11 = (char *)objc_allocWithZone(v10);
      uint64_t v12 = sub_9450();
      v13 = (uint64_t *)&v11[OBJC_IVAR____TtC20UrchinBridgeSettings15SettingLocation_id];
      uint64_t *v13 = v12;
      v13[1] = v14;
      uint64_t v15 = sub_9440();
      v16 = (uint64_t *)&v11[OBJC_IVAR____TtC20UrchinBridgeSettings15SettingLocation_name];
      uint64_t *v16 = v15;
      v16[1] = v17;

      v0[1].receiver = v11;
      v0[1].Class super_class = v10;
      objc_msgSendSuper2(v0 + 1, "init");
      v18 = *v6;
      (*v6)(receiver, v9);
      v18(v8, v9);
      sub_9640();
      sub_9670();
      sub_9680();
      sub_9650();
      v5 += v24;
      --v2;
    }
    while (v2);
  }
  swift_bridgeObjectRelease();
  v0[12].receiver = &_swiftEmptyArrayStorage;
  v19 = (void *)((char *)v0[4].super_class + OBJC_IVAR___USLocationWrapper_currentLocationProvider);
  uint64_t v20 = v19[3];
  uint64_t v21 = v19[4];
  sub_89BC(v19, v20);
  v22 = (objc_class *)swift_task_alloc();
  v0[12].Class super_class = v22;
  *(void *)v22 = v0;
  *((void *)v22 + 1) = sub_65A0;
  return dispatch thunk of CurrentLocationProvider.currentLocationAuthStatus()(v20, v21);
}

uint64_t sub_65A0(int a1)
{
  *(_DWORD *)(*(void *)v1 + 228) = a1;
  swift_task_dealloc();
  return _swift_task_switch(sub_66A0, 0, 0);
}

uint64_t sub_66A0()
{
  uint64_t v27 = v0;
  char v1 = sub_95B0();
  uint64_t v2 = sub_93F0();
  os_log_type_t v3 = sub_95A0();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = swift_slowAlloc();
    unint64_t v26 = swift_slowAlloc();
    *(_DWORD *)uint64_t v4 = 136315394;
    uint64_t v5 = sub_95C0();
    *(void *)(v0 + 64) = sub_8364(v5, v6, (uint64_t *)&v26);
    sub_95D0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v4 + 12) = 1024;
    *(_DWORD *)(v0 + 224) = v1 & 1;
    sub_95D0();
    _os_log_impl(&dword_0, v2, v3, "Current location status: %s hasCurrentLocation: %{BOOL}d.", (uint8_t *)v4, 0x12u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  unint64_t v7 = *(void *)(v0 + 192);
  if (v1)
  {
    uint64_t v8 = *(void *)(v0 + 128);
    uint64_t v9 = *(void *)(v0 + 136);
    uint64_t v10 = *(void *)(v0 + 120);
    sub_7C48(&qword_117D0);
    uint64_t v11 = swift_allocObject();
    *(_OWORD *)(v11 + 16) = xmmword_A340;
    uint64_t v12 = sub_9430();
    uint64_t v14 = v13;
    sub_94D0();
    uint64_t v15 = sub_9520();
    uint64_t v17 = v16;
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v9, v10);
    v18 = (objc_class *)type metadata accessor for SettingLocation();
    v19 = (char *)objc_allocWithZone(v18);
    uint64_t v20 = (uint64_t *)&v19[OBJC_IVAR____TtC20UrchinBridgeSettings15SettingLocation_id];
    *uint64_t v20 = v12;
    v20[1] = v14;
    uint64_t v21 = (uint64_t *)&v19[OBJC_IVAR____TtC20UrchinBridgeSettings15SettingLocation_name];
    *uint64_t v21 = v15;
    v21[1] = v17;
    *(void *)(v0 + 48) = v19;
    *(void *)(v0 + 56) = v18;
    *(void *)(v11 + 32) = objc_msgSendSuper2((objc_super *)(v0 + 48), "init");
    unint64_t v26 = v11;
    sub_9540();
    sub_8BBC(v7);
    unint64_t v7 = v26;
  }
  *(void *)(v0 + 208) = v7;
  v25 = (objc_super *)((char *)&async function pointer to dispatch thunk of SelectedLocationManager.getSelectedLocation()
                     + async function pointer to dispatch thunk of SelectedLocationManager.getSelectedLocation());
  v22 = (void *)swift_task_alloc();
  *(void *)(v0 + 216) = v22;
  void *v22 = v0;
  v22[1] = sub_69B4;
  uint64_t v23 = *(void *)(v0 + 112);
  return ((uint64_t (*)(uint64_t))v25)(v23);
}

uint64_t sub_69B4()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_6AB0, 0, 0);
}

uint64_t sub_6AB0()
{
  uint64_t v1 = *(void *)(v0 + 144);
  uint64_t v2 = *(void *)(v0 + 152);
  uint64_t v3 = *(void *)(v0 + 104);
  sub_8A00(*(void *)(v0 + 112), v3, &qword_117B8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v3, 1, v1) == 1)
  {
    id v4 = 0;
  }
  else
  {
    uint64_t v6 = *(void *)(v0 + 160);
    uint64_t v5 = *(void *)(v0 + 168);
    uint64_t v7 = *(void *)(v0 + 144);
    uint64_t v8 = *(void *)(v0 + 152);
    (*(void (**)(uint64_t, void, uint64_t))(v8 + 32))(v5, *(void *)(v0 + 104), v7);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))(v6, v5, v7);
    uint64_t v9 = (objc_class *)type metadata accessor for SettingLocation();
    uint64_t v10 = (char *)objc_allocWithZone(v9);
    uint64_t v11 = sub_9450();
    uint64_t v12 = (uint64_t *)&v10[OBJC_IVAR____TtC20UrchinBridgeSettings15SettingLocation_id];
    *uint64_t v12 = v11;
    v12[1] = v13;
    uint64_t v14 = sub_9440();
    uint64_t v15 = (uint64_t *)&v10[OBJC_IVAR____TtC20UrchinBridgeSettings15SettingLocation_name];
    *uint64_t v15 = v14;
    v15[1] = v16;

    *(void *)(v0 + 32) = v10;
    *(void *)(v0 + 40) = v9;
    id v4 = objc_msgSendSuper2((objc_super *)(v0 + 32), "init");
    uint64_t v17 = *(void (**)(uint64_t, uint64_t))(v8 + 8);
    v17(v6, v7);
    v17(v5, v7);
  }
  uint64_t v18 = *(void *)(v0 + 208);
  uint64_t v20 = *(void *)(v0 + 88);
  uint64_t v19 = *(void *)(v0 + 96);
  uint64_t v21 = *(void *)(v0 + 80);
  sub_8A64(*(void *)(v0 + 112), &qword_117B8);
  uint64_t v22 = sub_9590();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56))(v19, 1, 1, v22);
  sub_9570();
  id v23 = v4;
  swift_retain();
  uint64_t v24 = sub_9560();
  v25 = (void *)swift_allocObject();
  v25[2] = v24;
  v25[3] = &protocol witness table for MainActor;
  v25[4] = v21;
  v25[5] = v20;
  v25[6] = v18;
  v25[7] = v4;
  sub_6E70(v19, (uint64_t)&unk_117C8, (uint64_t)v25);

  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  unint64_t v26 = *(uint64_t (**)(void))(v0 + 8);
  return v26();
}

uint64_t sub_6D54(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v7[4] = a6;
  v7[5] = a7;
  v7[2] = a4;
  v7[3] = a5;
  sub_9570();
  v7[6] = sub_9560();
  uint64_t v9 = sub_9550();
  return _swift_task_switch(sub_6DF0, v9, v8);
}

uint64_t sub_6DF0()
{
  uint64_t v1 = v0[5];
  uint64_t v2 = v0[4];
  uint64_t v3 = (void (*)(uint64_t, uint64_t))v0[2];
  swift_release();
  v3(v2, v1);
  id v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_6E70(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_9590();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_9580();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_8A64(a1, &qword_11780);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_9550();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

void sub_717C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  type metadata accessor for SettingLocation();
  isa = sub_9530().super.isa;
  (*(void (**)(uint64_t, objc_class *, uint64_t))(a3 + 16))(a3, isa, a2);
}

uint64_t sub_71F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(void *)(v5 + 16) = a4;
  *(void *)(v5 + 24) = a5;
  return _swift_task_switch(sub_7214, 0, 0);
}

uint64_t sub_7214()
{
  uint64_t v1 = (uint64_t *)(v0[3] + OBJC_IVAR____TtC20UrchinBridgeSettings15SettingLocation_id);
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t))((char *)&async function pointer to dispatch thunk of SelectedLocationManager.set(selectedLocation:)
                                                + async function pointer to dispatch thunk of SelectedLocationManager.set(selectedLocation:));
  uint64_t v2 = *v1;
  uint64_t v3 = v1[1];
  v0[4] = v3;
  swift_bridgeObjectRetain();
  id v4 = (void *)swift_task_alloc();
  v0[5] = v4;
  *id v4 = v0;
  v4[1] = sub_72FC;
  return v6(v2, v3);
}

uint64_t sub_72FC()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

id sub_7534()
{
  return sub_7898(0, type metadata accessor for LocationWrapper);
}

id sub_7614()
{
  swift_bridgeObjectRetain();
  NSString v0 = sub_94F0();
  swift_bridgeObjectRelease();

  return v0;
}

uint64_t sub_767C(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v6 = sub_9500();
  uint64_t v7 = (uint64_t *)(a1 + *a4);
  uint64_t *v7 = v6;
  v7[1] = v8;

  return swift_bridgeObjectRelease();
}

uint64_t sub_76CC(uint64_t a1)
{
  sub_8A00(a1, (uint64_t)v7, &qword_11778);
  if (!v8)
  {
    sub_8A64((uint64_t)v7, &qword_11778);
    goto LABEL_14;
  }
  type metadata accessor for SettingLocation();
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_14:
    char v4 = 0;
    return v4 & 1;
  }
  BOOL v2 = *(void *)&v6[OBJC_IVAR____TtC20UrchinBridgeSettings15SettingLocation_id] == *(void *)(v1
                                                                                               + OBJC_IVAR____TtC20UrchinBridgeSettings15SettingLocation_id)
    && *(void *)&v6[OBJC_IVAR____TtC20UrchinBridgeSettings15SettingLocation_id + 8] == *(void *)(v1 + OBJC_IVAR____TtC20UrchinBridgeSettings15SettingLocation_id + 8);
  if (!v2 && (sub_96C0() & 1) == 0)
  {

    goto LABEL_14;
  }
  if (*(void *)&v6[OBJC_IVAR____TtC20UrchinBridgeSettings15SettingLocation_name] == *(void *)(v1
                                                                                                 + OBJC_IVAR____TtC20UrchinBridgeSettings15SettingLocation_name)
    && *(void *)&v6[OBJC_IVAR____TtC20UrchinBridgeSettings15SettingLocation_name + 8] == *(void *)(v1 + OBJC_IVAR____TtC20UrchinBridgeSettings15SettingLocation_name + 8))
  {

    char v4 = 1;
  }
  else
  {
    char v4 = sub_96C0();
  }
  return v4 & 1;
}

id sub_7880(uint64_t a1)
{
  return sub_7898(a1, type metadata accessor for SettingLocation);
}

id sub_7898(uint64_t a1, uint64_t (*a2)(void))
{
  v4.receiver = v2;
  v4.Class super_class = (Class)a2();
  return objc_msgSendSuper2(&v4, "dealloc");
}

uint64_t USCoreLocationWrapper.currentLocationAuthStatus()()
{
  *(void *)(v1 + 16) = v0;
  return _swift_task_switch(sub_7944, 0, 0);
}

uint64_t sub_7944()
{
  id v1 = [*(id *)(v0 + 16) manager];
  id v2 = [v1 authorizationStatus];

  uint64_t v3 = *(uint64_t (**)(id))(v0 + 8);
  return v3(v2);
}

uint64_t USCoreLocationWrapper.getCurrentLocation()(uint64_t a1)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = v1;
  return _swift_task_switch(sub_79F0, 0, 0);
}

uint64_t sub_79F0()
{
  id v1 = [*(id *)(v0 + 24) manager];
  [v1 authorizationStatus];

  if (sub_95B0())
  {
    sub_9420();
    uint64_t v2 = 0;
  }
  else
  {
    uint64_t v2 = 1;
  }
  uint64_t v3 = *(void *)(v0 + 16);
  uint64_t v4 = sub_9460();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56))(v3, v2, 1, v4);
  uint64_t v5 = *(uint64_t (**)(void))(v0 + 8);
  return v5();
}

uint64_t sub_7ADC()
{
  *(void *)(v1 + 16) = *v0;
  return _swift_task_switch(sub_7944, 0, 0);
}

uint64_t sub_7B00(uint64_t a1)
{
  uint64_t v3 = *v1;
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = v3;
  return _swift_task_switch(sub_79F0, 0, 0);
}

uint64_t sub_7B24()
{
  return type metadata accessor for LocationWrapper();
}

uint64_t type metadata accessor for LocationWrapper()
{
  uint64_t result = qword_118D8;
  if (!qword_118D8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_7B78()
{
  uint64_t result = sub_9410();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t type metadata accessor for SettingLocation()
{
  return self;
}

uint64_t sub_7C48(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_7C8C()
{
  swift_unknownObjectRelease();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_7CD4()
{
  uint64_t v2 = swift_task_alloc();
  long long v3 = *(_OWORD *)(v0 + 32);
  *(void *)(v1 + 16) = v2;
  *(void *)uint64_t v2 = v1;
  *(void *)(v2 + 8) = sub_92EC;
  *(_OWORD *)(v2 + 16) = v3;
  return _swift_task_switch(sub_7214, 0, 0);
}

uint64_t sub_7D80()
{
  return sub_92DC(*(uint64_t (**)(uint64_t))(v0 + 8), v0, 3);
}

uint64_t sub_7DB8(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return _swift_task_switch(sub_7DD8, 0, 0);
}

uint64_t sub_7DD8()
{
  uint64_t v1 = *(void *)(v0 + 16);
  sub_9420();
  uint64_t v2 = sub_9460();
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56))(v1, 0, 1, v2);
  long long v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

uint64_t sub_7E7C(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_7F58;
  return v6(a1);
}

uint64_t sub_7F58()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_8050()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_8088(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_8140;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_11798 + dword_11798);
  return v6(a1, v4);
}

uint64_t sub_8140()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_8234()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 24, 7);
}

void sub_826C(uint64_t a1, uint64_t a2)
{
  sub_717C(a1, a2, *(void *)(v2 + 16));
}

uint64_t sub_8274()
{
  swift_unknownObjectRelease();

  swift_release();

  return _swift_deallocObject(v0, 56, 7);
}

uint64_t sub_82BC()
{
  uint64_t v2 = v0[4];
  uint64_t v3 = v0[5];
  uint64_t v4 = v0[6];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  void *v5 = v1;
  v5[1] = sub_8140;
  return sub_5FF0((uint64_t)v5, v6, v7, v2, v3, v4);
}

uint64_t sub_8364(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_8438(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_8D88((uint64_t)v12, *a3);
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
      sub_8D88((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_927C((uint64_t)v12);
  return v7;
}

uint64_t sub_8438(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_95E0();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_85F4(a5, a6);
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
  uint64_t v8 = sub_9630();
  if (!v8)
  {
    sub_9690();
    __break(1u);
LABEL_17:
    uint64_t result = sub_96B0();
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

uint64_t sub_85F4(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_868C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_886C(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_886C(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_868C(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_8804(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_9600();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_9690();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_9510();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_96B0();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_9690();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_8804(uint64_t a1, uint64_t a2)
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
  sub_7C48(&qword_117D8);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_886C(char a1, int64_t a2, char a3, char *a4)
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
    sub_7C48(&qword_117D8);
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
  uint64_t result = sub_96B0();
  __break(1u);
  return result;
}

void *sub_89BC(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_8A00(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_7C48(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_8A64(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_7C48(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_8AC0()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 64, 7);
}

uint64_t sub_8B10()
{
  uint64_t v2 = v0[4];
  uint64_t v3 = v0[5];
  uint64_t v5 = v0[6];
  uint64_t v4 = v0[7];
  unint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v6;
  *unint64_t v6 = v1;
  v6[1] = sub_92EC;
  return sub_6D54((uint64_t)v6, v7, v8, v2, v3, v5, v4);
}

uint64_t sub_8BBC(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_96A0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8));
  }
  if (!((unint64_t)*v1 >> 62))
  {
    uint64_t v4 = *(void *)((char *)&dword_10 + (*v1 & 0xFFFFFFFFFFFFFF8));
    uint64_t v5 = v4 + v3;
    if (!__OFADD__(v4, v3)) {
      goto LABEL_5;
    }
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  swift_bridgeObjectRetain();
  uint64_t v15 = sub_96A0();
  swift_bridgeObjectRelease();
  uint64_t v5 = v15 + v3;
  if (__OFADD__(v15, v3)) {
    goto LABEL_21;
  }
LABEL_5:
  unint64_t v6 = *v1;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  uint64_t *v1 = v6;
  if (isUniquelyReferenced_nonNull_bridgeObject)
  {
    if ((v6 & 0x8000000000000000) == 0 && (v6 & 0x4000000000000000) == 0)
    {
      uint64_t v8 = v6 & 0xFFFFFFFFFFFFFF8;
      if (v5 <= *(void *)((char *)&dword_18 + (v6 & 0xFFFFFFFFFFFFFF8)) >> 1) {
        goto LABEL_11;
      }
    }
  }
  if (v6 >> 62) {
    goto LABEL_23;
  }
  while (1)
  {
    swift_bridgeObjectRetain();
    uint64_t v9 = sub_9620();
    swift_bridgeObjectRelease();
    uint64_t *v1 = v9;
    uint64_t v8 = v9 & 0xFFFFFFFFFFFFFF8;
LABEL_11:
    uint64_t result = sub_8DE8(v8 + 8 * *(void *)(v8 + 16) + 32, (*(void *)(v8 + 24) >> 1) - *(void *)(v8 + 16), a1);
    if (v11 >= v3) {
      break;
    }
LABEL_22:
    __break(1u);
LABEL_23:
    swift_bridgeObjectRetain();
    sub_96A0();
    swift_bridgeObjectRelease();
  }
  if (v11 >= 1)
  {
    uint64_t v12 = *(void *)((char *)&dword_10 + (*v1 & 0xFFFFFFFFFFFFFF8));
    BOOL v13 = __OFADD__(v12, v11);
    uint64_t v14 = v12 + v11;
    if (v13)
    {
      __break(1u);
      return result;
    }
    *(void *)((char *)&dword_10 + (*v1 & 0xFFFFFFFFFFFFFF8)) = v14;
  }
  swift_bridgeObjectRelease();

  return sub_9540();
}

uint64_t sub_8D88(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_8DE8(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_96A0();
    swift_bridgeObjectRelease();
    if (!v7) {
      return a3;
    }
  }
  else
  {
    uint64_t v7 = *(void *)((char *)&dword_10 + (a3 & 0xFFFFFFFFFFFFFF8));
    if (!v7) {
      return a3;
    }
  }
  if (!a1) {
    goto LABEL_19;
  }
  uint64_t v8 = a3 & 0xFFFFFFFFFFFFFF8;
  if (v6)
  {
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_96A0();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_9098();
        swift_bridgeObjectRetain();
        for (unint64_t i = 0; i != v7; ++i)
        {
          sub_7C48(&qword_117E0);
          uint64_t v12 = sub_8FE8(v16, i, a3);
          id v14 = *v13;
          ((void (*)(void (**)(id *), void))v12)(v16, 0);
          *(void *)(a1 + 8 * i) = v14;
        }
        swift_bridgeObjectRelease();
        return a3;
      }
      goto LABEL_18;
    }
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  uint64_t v9 = *(void *)((char *)&dword_10 + (a3 & 0xFFFFFFFFFFFFFF8));
  if (v9 > a2)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v8 + 32 >= a1 + 8 * v9 || v8 + 32 + 8 * v9 <= a1)
  {
    type metadata accessor for SettingLocation();
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  uint64_t result = sub_96B0();
  __break(1u);
  return result;
}

void (*sub_8FE8(void (**a1)(id *a1), unint64_t a2, uint64_t a3))(void *a1)
{
  unint64_t v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((void *)v6 + 4) = sub_913C(v6, a2, a3);
  return sub_9050;
}

void sub_9050(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);

  free(v1);
}

unint64_t sub_9098()
{
  unint64_t result = qword_117E8;
  if (!qword_117E8)
  {
    sub_90F4(&qword_117E0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_117E8);
  }
  return result;
}

uint64_t sub_90F4(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

void (*sub_913C(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
{
  uint64_t v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    id v4 = (id)sub_9610();
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(void *)((char *)&dword_10 + (a3 & 0xFFFFFFFFFFFFFF8)) > a2)
  {
    id v4 = *(id *)(a3 + 8 * a2 + 32);
LABEL_5:
    *(void *)uint64_t v3 = v4;
    return sub_91BC;
  }
  __break(1u);
  return result;
}

void sub_91BC(id *a1)
{
}

unint64_t sub_91C4()
{
  unint64_t result = qword_117F0[0];
  if (!qword_117F0[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_117F0);
  }
  return result;
}

uint64_t sub_9218(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_927C(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

ValueMetadata *type metadata accessor for DummyCurrentLocationProvider()
{
  return &type metadata for DummyCurrentLocationProvider;
}

uint64_t sub_92DC(uint64_t (*a1)(uint64_t), uint64_t a2, uint64_t a3)
{
  return a1(a3);
}

void sub_92F0(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "No locations found in list to display", v1, 2u);
}

void sub_9334(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "[Location List] Invalid nil identifier given.", v1, 2u);
}

void sub_9378(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "[Location List] Unable to find option for %{public}@.", (uint8_t *)&v2, 0xCu);
}

uint64_t sub_93F0()
{
  return Logger.logObject.getter();
}

uint64_t sub_9400()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_9410()
{
  return type metadata accessor for Logger();
}

uint64_t sub_9420()
{
  return static CoastalLocation.dummyCurrentLocation()();
}

uint64_t sub_9430()
{
  return static CoastalLocation.currentLocationID.getter();
}

uint64_t sub_9440()
{
  return CoastalLocation.displayName.getter();
}

uint64_t sub_9450()
{
  return CoastalLocation.id.getter();
}

uint64_t sub_9460()
{
  return type metadata accessor for CoastalLocation();
}

uint64_t sub_9490()
{
  return SelectedLocationManager.__allocating_init(currentLocationProvider:staticLocationProvider:selectedLocationProvider:)();
}

uint64_t sub_94A0()
{
  return type metadata accessor for SelectedLocationManager();
}

uint64_t sub_94B0()
{
  return static SyncedPreferenceManager.shared.getter();
}

uint64_t sub_94C0()
{
  return type metadata accessor for SyncedPreferenceManager();
}

uint64_t sub_94D0()
{
  return String.LocalizationValue.init(stringLiteral:)();
}

uint64_t sub_94E0()
{
  return type metadata accessor for String.LocalizationValue();
}

NSString sub_94F0()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_9500()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

Swift::Int sub_9510()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_9520()
{
  return static String.urchinKit(localized:comment:)();
}

NSArray sub_9530()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_9540()
{
  return specialized Array._endMutation()();
}

uint64_t sub_9550()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_9560()
{
  return static MainActor.shared.getter();
}

uint64_t sub_9570()
{
  return type metadata accessor for MainActor();
}

uint64_t sub_9580()
{
  return TaskPriority.rawValue.getter();
}

uint64_t sub_9590()
{
  return type metadata accessor for TaskPriority();
}

uint64_t sub_95A0()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_95B0()
{
  return CLAuthorizationStatus.isAuthorized.getter();
}

uint64_t sub_95C0()
{
  return CLAuthorizationStatus.string.getter();
}

uint64_t sub_95D0()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_95E0()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_95F0()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t sub_9600()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_9610()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_9620()
{
  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_9630()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_9640()
{
  return specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
}

uint64_t sub_9650()
{
  return specialized ContiguousArray._endMutation()();
}

uint64_t sub_9660()
{
  return specialized ContiguousArray.reserveCapacity(_:)();
}

uint64_t sub_9670()
{
  return specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
}

uint64_t sub_9680()
{
  return specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_9690()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_96A0()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_96B0()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t sub_96C0()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_release(const void *aBlock)
{
}

uint64_t _os_feature_enabled_impl()
{
  return __os_feature_enabled_impl();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return __swift_stdlib_reportUnimplementedInitializer();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void free(void *a1)
{
}

void *__cdecl malloc(size_t __size)
{
  return _malloc(__size);
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

void objc_enumerationMutation(id obj)
{
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

uint64_t objc_opt_new()
{
  return _objc_opt_new();
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

void objc_storeStrong(id *location, id obj)
{
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

uint64_t swift_arrayInitWithCopy()
{
  return _swift_arrayInitWithCopy();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
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

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return _swift_isUniquelyReferenced_nonNull_bridgeObject();
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

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_updateClassMetadata2()
{
  return _swift_updateClassMetadata2();
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObjectsFromArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObjectsFromArray:");
}

id objc_msgSend_arrayWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithCapacity:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _[a1 BOOLValue];
}

id objc_msgSend_bundleForClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleForClass:");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return _[a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _[a1 count];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_emptyGroupSpecifier(void *a1, const char *a2, ...)
{
  return _[a1 emptyGroupSpecifier];
}

id objc_msgSend_groupSpecifierWithName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "groupSpecifierWithName:");
}

id objc_msgSend_id(void *a1, const char *a2, ...)
{
  return _[a1 id];
}

id objc_msgSend_indexOfGroup_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexOfGroup:");
}

id objc_msgSend_indexOfObjectPassingTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexOfObjectPassingTest:");
}

id objc_msgSend_initWithEffectiveBundleIdentifier_delegate_onQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithEffectiveBundleIdentifier:delegate:onQueue:");
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_loadLocationsWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadLocationsWithCompletion:");
}

id objc_msgSend_locations(void *a1, const char *a2, ...)
{
  return _[a1 locations];
}

id objc_msgSend_model(void *a1, const char *a2, ...)
{
  return _[a1 model];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return _[a1 name];
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_preferenceSpecifierNamed_target_set_get_detail_cell_edit_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:");
}

id objc_msgSend_propertyForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "propertyForKey:");
}

id objc_msgSend_reloadSpecifiers(void *a1, const char *a2, ...)
{
  return _[a1 reloadSpecifiers];
}

id objc_msgSend_section(void *a1, const char *a2, ...)
{
  return _[a1 section];
}

id objc_msgSend_selectedLocation(void *a1, const char *a2, ...)
{
  return _[a1 selectedLocation];
}

id objc_msgSend_setBundle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBundle:");
}

id objc_msgSend_setCellType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCellType:");
}

id objc_msgSend_setLocations_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLocations:");
}

id objc_msgSend_setManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setManager:");
}

id objc_msgSend_setModel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setModel:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setPreferenceValue_specifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPreferenceValue:specifier:");
}

id objc_msgSend_setProperty_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setProperty:forKey:");
}

id objc_msgSend_setSelectedLocation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSelectedLocation:");
}

id objc_msgSend_setWithSelectedLocation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithSelectedLocation:");
}

id objc_msgSend_shared(void *a1, const char *a2, ...)
{
  return _[a1 shared];
}

id objc_msgSend_specifierAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "specifierAtIndex:");
}

id objc_msgSend_stringForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringForKey:");
}