id sub_5A00()
{
  char *v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  objc_class *v6;
  id v7;
  uint64_t v8;
  void (*v9)(char *, void, uint64_t, uint64_t);
  void *v10;
  id v11;
  void *v12;
  id v13;
  objc_super v15;

  sub_AB28(&qword_14778);
  __chkstk_darwin();
  v2 = (char *)&v15 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = OBJC_IVAR___PodcastsUsagePlugin_usageController;
  type metadata accessor for PodcastsUsageController();
  v4 = swift_allocObject();
  v5 = v0;
  *(void *)(v4 + 16) = sub_DD68();
  *(void *)&v0[v3] = v4;

  v6 = (objc_class *)type metadata accessor for PodcastsUsagePlugin();
  v15.receiver = v5;
  v15.super_class = v6;
  v7 = objc_msgSendSuper2(&v15, "init");
  sub_DC78();
  v8 = sub_DC98();
  v9 = *(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56);
  v9(v2, 0, 1, v8);
  v10 = (void *)swift_allocObject();
  v10[2] = 0;
  v10[3] = 0;
  v10[4] = v7;
  v11 = v7;
  sub_69E4((uint64_t)v2, (uint64_t)&unk_14838, (uint64_t)v10);
  swift_release();
  sub_DC78();
  v9(v2, 0, 1, v8);
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = v11;
  v13 = v11;
  sub_69E4((uint64_t)v2, (uint64_t)&unk_14848, (uint64_t)v12);

  swift_release();
  return v13;
}

id sub_5C10(void *a1)
{
  v2 = v1;
  id v3 = a1;
  id v4 = [v1 tips];
  sub_CEBC(0, &qword_14810);
  uint64_t v5 = sub_DBD8();

  sub_DBB8();
  if (*(void *)((char *)&dword_10 + (v5 & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18
                                                                                + (v5 & 0xFFFFFFFFFFFFFF8)) >> 1)
    sub_DBF8();
  sub_DC08();
  sub_DBE8();
  Class isa = sub_DBC8().super.isa;
  swift_bridgeObjectRelease();
  [v2 setTips:isa];

  return [v2 reloadTips];
}

uint64_t sub_5D40(char a1)
{
  if (a1) {
    return 0x6F69746E65746572;
  }
  else {
    return 0xD000000000000012;
  }
}

unint64_t sub_5D88(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    id v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_AB28(&qword_14820);
  uint64_t v2 = sub_DE58();
  id v3 = (void *)v2;
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
    sub_CEF8(v6, (uint64_t)&v15);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_B6F4(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v11 = (uint64_t *)(v3[6] + 16 * result);
    uint64_t *v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_CF60(&v17, (_OWORD *)(v3[7] + 32 * result));
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

uint64_t sub_5F0C(void *a1)
{
  id v2 = [a1 identifier];
  uint64_t v3 = sub_DB78();
  uint64_t v5 = v4;

  if (v3 == 0xD000000000000012 && v5 == 0x800000000000E430)
  {
    swift_bridgeObjectRelease();
LABEL_5:
    return sub_9B5C(a1);
  }
  char v6 = sub_DE78();
  swift_bridgeObjectRelease();
  if (v6) {
    goto LABEL_5;
  }
  id v8 = [a1 identifier];
  uint64_t v9 = sub_DB78();
  uint64_t v11 = v10;

  if (v9 == 0x6F69746E65746572 && v11 == 0xEF7963696C6F506ELL)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    char v13 = sub_DE78();
    uint64_t result = swift_bridgeObjectRelease();
    if ((v13 & 1) == 0) {
      return result;
    }
  }

  return sub_7C44(a1);
}

uint64_t sub_6128(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[5] = a4;
  uint64_t v6 = sub_DAF8();
  v4[6] = v6;
  v4[7] = *(void *)(v6 - 8);
  v4[8] = swift_task_alloc();
  v4[9] = swift_task_alloc();
  v4[10] = swift_task_alloc();
  uint64_t v7 = (void *)swift_task_alloc();
  v4[11] = v7;
  *uint64_t v7 = v4;
  v7[1] = sub_6250;
  v7[5] = a4;
  return _swift_task_switch(sub_6BA8, 0, 0);
}

uint64_t sub_6250(uint64_t a1)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 96) = a1;
  *(void *)(v3 + 104) = v1;
  swift_task_dealloc();
  if (v1) {
    uint64_t v4 = sub_6798;
  }
  else {
    uint64_t v4 = sub_6364;
  }
  return _swift_task_switch(v4, 0, 0);
}

uint64_t sub_6364()
{
  v28 = v0;
  uint64_t v1 = (void *)v0[12];
  if (v1)
  {
    sub_DAD8();
    id v2 = v1;
    uint64_t v3 = sub_DAE8();
    os_log_type_t v4 = sub_DCD8();
    BOOL v5 = os_log_type_enabled(v3, v4);
    uint64_t v6 = v0[9];
    uint64_t v7 = v0[6];
    uint64_t v8 = v0[7];
    if (v5)
    {
      uint64_t v26 = v0[9];
      uint64_t v9 = (uint8_t *)swift_slowAlloc();
      uint64_t v27 = swift_slowAlloc();
      *(_DWORD *)uint64_t v9 = 136315138;
      id v10 = v2;
      id v11 = [v10 description];
      uint64_t v25 = v7;
      uint64_t v12 = sub_DB78();
      unint64_t v14 = v13;

      v0[4] = sub_AD8C(v12, v14, &v27);
      sub_DDD8();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_0, v3, v4, "Displaying retention policy tip: %s", v9, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v26, v25);
    }
    else
    {

      (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v6, v7);
    }
    sub_DC58();
    v0[14] = sub_DC48();
    uint64_t v24 = sub_DC18();
    return _swift_task_switch(sub_66A4, v24, v23);
  }
  else
  {
    sub_DAD8();
    uint64_t v15 = sub_DAE8();
    uint64_t v16 = sub_DCD8();
    if (os_log_type_enabled(v15, (os_log_type_t)v16))
    {
      long long v17 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)long long v17 = 0;
      _os_log_impl(&dword_0, v15, (os_log_type_t)v16, "Not displaying the retention policy tip.", v17, 2u);
      swift_slowDealloc();
    }
    uint64_t v18 = v0[10];
    uint64_t v19 = v0[6];
    uint64_t v20 = v0[7];

    (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v18, v19);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    v21 = (uint64_t (*)(void))v0[1];
    return v21();
  }
}

uint64_t sub_66A4()
{
  uint64_t v1 = *(void **)(v0 + 96);
  swift_release();
  sub_5C10(v1);
  return _swift_task_switch(sub_671C, 0, 0);
}

uint64_t sub_671C()
{
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_6798()
{
  long long v17 = v0;
  sub_DAD8();
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v1 = sub_DAE8();
  os_log_type_t v2 = sub_DCC8();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = v0[13];
    uint64_t v4 = v0[7];
    uint64_t v14 = v0[6];
    uint64_t v15 = v0[8];
    BOOL v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v6 = swift_slowAlloc();
    *(_DWORD *)BOOL v5 = 136315138;
    uint64_t v16 = v6;
    v0[2] = v3;
    swift_errorRetain();
    sub_AB28(&qword_14850);
    uint64_t v7 = sub_DB88();
    v0[3] = sub_AD8C(v7, v8, &v16);
    sub_DDD8();
    swift_bridgeObjectRelease();
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl(&dword_0, v1, v2, "Unable to show retention policy tip: %s", v5, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    swift_errorRelease();
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v15, v14);
  }
  else
  {
    uint64_t v10 = v0[7];
    uint64_t v9 = v0[8];
    uint64_t v11 = v0[6];
    swift_errorRelease();
    swift_errorRelease();
    swift_errorRelease();

    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v9, v11);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v12 = (uint64_t (*)(void))v0[1];
  return v12();
}

uint64_t sub_69E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_DC98();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_DC88();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_B5F0(a1);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_DC18();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_6B88()
{
  *(void *)(v1 + 40) = v0;
  return _swift_task_switch(sub_6BA8, 0, 0);
}

uint64_t sub_6BA8()
{
  uint64_t v1 = *(void *)(*(void *)(v0 + 40) + OBJC_IVAR___PodcastsUsagePlugin_usageController);
  os_log_type_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 48) = v2;
  uint64_t v3 = sub_AB28(&qword_147F8);
  void *v2 = v0;
  v2[1] = sub_6CA4;
  return withCheckedThrowingContinuation<A>(isolation:function:_:)(v0 + 16, 0, 0, 0xD000000000000021, 0x800000000000E910, sub_CAD0, v1, v3);
}

uint64_t sub_6CA4()
{
  *(void *)(*(void *)v1 + 56) = v0;
  swift_task_dealloc();
  if (v0) {
    os_log_type_t v2 = sub_6E30;
  }
  else {
    os_log_type_t v2 = sub_6DB8;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_6DB8()
{
  if (*(unsigned char *)(v0 + 32)) {
    id v1 = 0;
  }
  else {
    id v1 = sub_7800(*(void *)(v0 + 16), *(void *)(v0 + 24));
  }
  os_log_type_t v2 = *(uint64_t (**)(id))(v0 + 8);
  return v2(v1);
}

uint64_t sub_6E30()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_6E48(uint64_t a1, uint64_t a2)
{
  uint64_t v18 = a2;
  uint64_t v3 = sub_DB08();
  uint64_t v21 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v5 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_DB38();
  uint64_t v19 = *(void *)(v6 - 8);
  uint64_t v20 = v6;
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_AB28(&qword_14800);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(void *)(v10 + 64);
  __chkstk_darwin(v9);
  sub_CEBC(0, &qword_147D8);
  uint64_t v12 = (void *)sub_DD28();
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))((char *)&v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v9);
  unint64_t v13 = (*(unsigned __int8 *)(v10 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = v18;
  (*(void (**)(unint64_t, char *, uint64_t))(v10 + 32))(v14 + v13, (char *)&v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), v9);
  aBlock[4] = sub_CBA8;
  aBlock[5] = v14;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_77FC;
  aBlock[3] = &unk_10918;
  uint64_t v15 = _Block_copy(aBlock);
  swift_retain();
  sub_DB28();
  v22 = &_swiftEmptyArrayStorage;
  sub_CD30(&qword_147E0, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_AB28(&qword_147E8);
  sub_C9B4();
  sub_DDF8();
  sub_DD48();
  _Block_release(v15);

  (*(void (**)(char *, uint64_t))(v21 + 8))(v5, v3);
  (*(void (**)(char *, uint64_t))(v19 + 8))(v8, v20);
  return swift_release();
}

uint64_t sub_71D4(uint64_t a1, uint64_t a2)
{
  uint64_t v37 = a1;
  uint64_t v3 = sub_DAF8();
  uint64_t v36 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v5 = (char *)&v36 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_AB28(&qword_14800);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  uint64_t v9 = __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v36 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v36 - v11;
  unint64_t v13 = *(void (**)(char *, uint64_t, uint64_t))(v7 + 16);
  v13((char *)&v36 - v11, a2, v6);
  v13(v10, (uint64_t)v12, v6);
  unint64_t v14 = (*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v15 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v15 + v14, v12, v6);
  uint64_t v16 = sub_DA58();
  v41 = (void *)v16;
  uint64_t v42 = sub_CD30(&qword_14808, (void (*)(uint64_t))&type metadata accessor for Podcasts);
  uint64_t v17 = sub_CD78((uint64_t *)&aBlock);
  (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v16 - 8) + 104))(v17, enum case for Podcasts.storageThresholdTip(_:), v16);
  LOBYTE(v16) = sub_DA48();
  sub_CDDC((uint64_t)&aBlock);
  if (v16)
  {
    id v18 = [self defaultMediaLibrary];
    uint64_t v19 = self;
    uint64_t v20 = *(void *)(v37 + 16);
    uint64_t v21 = (void *)swift_allocObject();
    v21[2] = v18;
    v21[3] = sub_CCA4;
    v21[4] = v15;
    v21[5] = v20;
    uint64_t v42 = (uint64_t)sub_CEB0;
    v43 = v21;
    aBlock = _NSConcreteStackBlock;
    uint64_t v39 = 1107296256;
    v40 = sub_77FC;
    v41 = &unk_109B8;
    v22 = _Block_copy(&aBlock);
    id v23 = v18;
    swift_retain();
    swift_release();
    aBlock = 0;
    [v19 perform:v22 error:&aBlock];
    _Block_release(v22);
    uint64_t v24 = aBlock;
    if (v24)
    {
      uint64_t v25 = v24;
      swift_willThrow();
      aBlock = v25;
      uint64_t v26 = v25;
      sub_DC28();
      swift_release();
    }
    else
    {
      swift_release();
    }
  }
  else
  {
    sub_DA38();
    uint64_t v27 = (void *)sub_DA28();
    char v28 = sub_DA18();

    if (v28)
    {
      sub_DD68();
      uint64_t v29 = sub_DD78();
      id v30 = [self defaultMediaLibrary];
      sub_DD68();
      v31 = (void *)swift_allocObject();
      v31[2] = v29;
      v31[3] = sub_CCA4;
      v31[4] = v15;
      swift_retain();
      sub_DCF8();
      swift_release();
    }
    else
    {
      sub_DAD8();
      v32 = sub_DAE8();
      os_log_type_t v33 = sub_DCD8();
      if (os_log_type_enabled(v32, v33))
      {
        v34 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v34 = 0;
        _os_log_impl(&dword_0, v32, v33, "No not present storage - defaults say no", v34, 2u);
        swift_slowDealloc();
      }

      (*(void (**)(char *, uint64_t))(v36 + 8))(v5, v3);
      aBlock = 0;
      uint64_t v39 = 0;
      LOBYTE(v40) = 1;
      sub_DC38();
    }
    swift_release();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v10, v6);
}

uint64_t sub_7778(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0 && a1)
  {
    swift_errorRetain();
    sub_AB28(&qword_14800);
    return sub_DC28();
  }
  else
  {
    sub_AB28(&qword_14800);
    return sub_DC38();
  }
}

id sub_7800(uint64_t a1, uint64_t a2)
{
  id v3 = [objc_allocWithZone((Class)STStorageOptionTip) init];
  NSString v4 = sub_DB58();
  [v3 setIdentifier:v4];

  id v5 = v3;
  v23._object = (void *)0x800000000000E870;
  v23._countAndFlagsBits = 0xD000000000000017;
  v28._countAndFlagsBits = 0;
  v28._object = (void *)0xE000000000000000;
  sub_DAA8(v23, v28);
  NSString v6 = sub_DB58();
  swift_bridgeObjectRelease();
  [v5 setTitle:v6];

  id v7 = v5;
  v24._countAndFlagsBits = 0xD000000000000019;
  v24._object = (void *)0x800000000000E890;
  v29._countAndFlagsBits = 0;
  v29._object = (void *)0xE000000000000000;
  sub_DAA8(v24, v29);
  sub_AB28(&qword_147C8);
  uint64_t v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_E330;
  id v9 = [self currentDevice];
  id v10 = [v9 localizedModel];

  uint64_t v11 = sub_DB78();
  uint64_t v13 = v12;

  *(void *)(v8 + 56) = &type metadata for String;
  *(void *)(v8 + 64) = sub_C958();
  *(void *)(v8 + 32) = v11;
  *(void *)(v8 + 40) = v13;
  sub_DB68();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  NSString v14 = sub_DB58();
  swift_bridgeObjectRelease();
  [v7 setInfoText:v14];

  [v7 setRepresentedApp:comApplePodcasts];
  [v7 setMayCauseDataLoss:1];
  v25._countAndFlagsBits = 0xD000000000000026;
  v25._object = (void *)0x800000000000E8B0;
  v30._countAndFlagsBits = 0;
  v30._object = (void *)0xE000000000000000;
  sub_DAA8(v25, v30);
  uint64_t v15 = swift_allocObject();
  *(_OWORD *)(v15 + 16) = xmmword_E330;
  *(void *)(v15 + 56) = &type metadata for Int;
  *(void *)(v15 + 64) = &protocol witness table for Int;
  *(void *)(v15 + 32) = a1;
  sub_DB68();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  NSString v16 = sub_DB58();
  swift_bridgeObjectRelease();
  [v7 setConfirmationText:v16];

  v26._countAndFlagsBits = 0xD000000000000025;
  v26._object = (void *)0x800000000000E8E0;
  v31._countAndFlagsBits = 0;
  v31._object = (void *)0xE000000000000000;
  sub_DAA8(v26, v31);
  uint64_t v17 = swift_allocObject();
  *(_OWORD *)(v17 + 16) = xmmword_E330;
  *(void *)(v17 + 56) = &type metadata for Int;
  *(void *)(v17 + 64) = &protocol witness table for Int;
  *(void *)(v17 + 32) = a1;
  sub_DB68();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  NSString v18 = sub_DB58();
  swift_bridgeObjectRelease();
  [v7 setConfirmationButtonTitle:v18];

  [v7 setDelegate:v21];
  [v7 setImmediateGain:a2];
  v27._countAndFlagsBits = 0x54504F5F45524F4DLL;
  v27._object = (void *)0xEC000000534E4F49;
  v32._countAndFlagsBits = 0;
  v32._object = (void *)0xE000000000000000;
  sub_DAA8(v27, v32);
  NSString v19 = sub_DB58();
  swift_bridgeObjectRelease();
  [v7 setAdditionalButtonTitle:v19];

  return v7;
}

uint64_t sub_7C44(void *a1)
{
  uint64_t v2 = sub_DAF8();
  uint64_t v35 = *(void *)(v2 - 8);
  uint64_t v36 = v2;
  __chkstk_darwin();
  uint64_t v37 = (char *)&v35 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_DB08();
  uint64_t v41 = *(void *)(v4 - 8);
  __chkstk_darwin();
  NSString v6 = (char *)&v35 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_DB38();
  uint64_t v39 = *(void *)(v7 - 8);
  uint64_t v40 = v7;
  __chkstk_darwin();
  id v9 = (char *)&v35 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_DB18();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin();
  uint64_t v13 = (char *)&v35 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v14 = [a1 identifier];
  uint64_t v15 = sub_DB78();
  uint64_t v17 = v16;

  if (v15 == 0x6F69746E65746572 && v17 == 0xEF7963696C6F506ELL)
  {
    swift_bridgeObjectRelease();
LABEL_5:
    sub_CEBC(0, &qword_147D8);
    (*(void (**)(char *, void, uint64_t))(v11 + 104))(v13, enum case for DispatchQoS.QoSClass.default(_:), v10);
    NSString v19 = (void *)sub_DD58();
    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
    uint64_t v20 = swift_allocObject();
    uint64_t v21 = v38;
    *(void *)(v20 + 16) = v38;
    *(void *)(v20 + 24) = a1;
    aBlock[4] = (uint64_t)sub_C9AC;
    aBlock[5] = v20;
    aBlock[0] = (uint64_t)_NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_77FC;
    aBlock[3] = (uint64_t)&unk_10878;
    v22 = _Block_copy(aBlock);
    id v23 = v21;
    id v24 = a1;
    sub_DB28();
    v43 = &_swiftEmptyArrayStorage;
    sub_CD30(&qword_147E0, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
    sub_AB28(&qword_147E8);
    sub_C9B4();
    sub_DDF8();
    sub_DD48();
    _Block_release(v22);

    (*(void (**)(char *, uint64_t))(v41 + 8))(v6, v4);
    (*(void (**)(char *, uint64_t))(v39 + 8))(v9, v40);
    return swift_release();
  }
  char v18 = sub_DE78();
  swift_bridgeObjectRelease();
  if (v18) {
    goto LABEL_5;
  }
  Swift::String v26 = v37;
  sub_DAD8();
  id v27 = a1;
  Swift::String v28 = sub_DAE8();
  os_log_type_t v29 = sub_DCC8();
  if (os_log_type_enabled(v28, v29))
  {
    uint64_t v30 = swift_slowAlloc();
    aBlock[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v30 = 136315394;
    v43 = (void *)sub_AD8C(0x6F69746E65746572, 0xEF7963696C6F506ELL, aBlock);
    sub_DDD8();
    *(_WORD *)(v30 + 12) = 2080;
    id v31 = [v27 identifier];
    uint64_t v32 = sub_DB78();
    unint64_t v34 = v33;

    v43 = (void *)sub_AD8C(v32, v34, aBlock);
    sub_DDD8();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_0, v28, v29, "Attempting to apply unknown tip as a retention policy change. Expected '%s', but found '%s'", (uint8_t *)v30, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    return (*(uint64_t (**)(char *, uint64_t))(v35 + 8))(v37, v36);
  }
  else
  {

    return (*(uint64_t (**)(char *, uint64_t))(v35 + 8))(v26, v36);
  }
}

uint64_t sub_82A4(void *a1, void *a2)
{
  uint64_t v4 = sub_DB08();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin();
  uint64_t v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = sub_DB38();
  uint64_t v8 = *(void *)(v21 - 8);
  __chkstk_darwin();
  uint64_t v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v11 = [self _applePodcastsFoundationSharedUserDefaults];
  sub_DD68();
  Class isa = sub_DE98().super.super.isa;
  [v11 setObject:isa forKey:kMTPodcastEpisodeLimitDefaultKey];

  id v13 = [self defaultMediaLibrary];
  sub_DD68();
  sub_DD08();

  sub_CEBC(0, &qword_147D8);
  id v14 = (void *)sub_DD38();
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = a1;
  *(void *)(v15 + 24) = a2;
  aBlock[4] = sub_CA58;
  aBlock[5] = v15;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_77FC;
  aBlock[3] = &unk_108C8;
  uint64_t v16 = _Block_copy(aBlock);
  id v17 = a1;
  id v18 = a2;
  swift_release();
  sub_DB28();
  aBlock[0] = &_swiftEmptyArrayStorage;
  sub_CD30(&qword_147E0, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_AB28(&qword_147E8);
  sub_C9B4();
  sub_DDF8();
  sub_DD48();
  _Block_release(v16);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v21);
}

uint64_t sub_85F0(uint64_t a1)
{
  id v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

uint64_t sub_8634(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[5] = a4;
  uint64_t v5 = sub_DAF8();
  v4[6] = v5;
  v4[7] = *(void *)(v5 - 8);
  v4[8] = swift_task_alloc();
  v4[9] = swift_task_alloc();
  v4[10] = swift_task_alloc();
  uint64_t v6 = (void *)swift_task_alloc();
  v4[11] = v6;
  *uint64_t v6 = v4;
  v6[1] = sub_8740;
  return sub_8E58();
}

uint64_t sub_8740(uint64_t a1)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 96) = a1;
  *(void *)(v3 + 104) = v1;
  swift_task_dealloc();
  if (v1) {
    uint64_t v4 = sub_8C0C;
  }
  else {
    uint64_t v4 = sub_8854;
  }
  return _swift_task_switch(v4, 0, 0);
}

uint64_t sub_8854()
{
  Swift::String v28 = v0;
  uint64_t v1 = (void *)v0[12];
  if (v1)
  {
    sub_DAD8();
    id v2 = v1;
    uint64_t v3 = sub_DAE8();
    os_log_type_t v4 = sub_DCD8();
    BOOL v5 = os_log_type_enabled(v3, v4);
    uint64_t v6 = v0[9];
    uint64_t v7 = v0[6];
    uint64_t v8 = v0[7];
    if (v5)
    {
      uint64_t v26 = v0[9];
      uint64_t v9 = (uint8_t *)swift_slowAlloc();
      uint64_t v27 = swift_slowAlloc();
      *(_DWORD *)uint64_t v9 = 136315138;
      id v10 = v2;
      id v11 = [v10 description];
      uint64_t v25 = v7;
      uint64_t v12 = sub_DB78();
      unint64_t v14 = v13;

      v0[4] = sub_AD8C(v12, v14, &v27);
      sub_DDD8();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_0, v3, v4, "Displaying tip for abandoned downloads: %s", v9, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v26, v25);
    }
    else
    {

      (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v6, v7);
    }
    sub_DC58();
    v0[14] = sub_DC48();
    uint64_t v24 = sub_DC18();
    return _swift_task_switch(sub_8B94, v24, v23);
  }
  else
  {
    sub_DAD8();
    uint64_t v15 = sub_DAE8();
    uint64_t v16 = sub_DCD8();
    if (os_log_type_enabled(v15, (os_log_type_t)v16))
    {
      id v17 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v17 = 0;
      _os_log_impl(&dword_0, v15, (os_log_type_t)v16, "Not displaying tip for abandoned downloads.", v17, 2u);
      swift_slowDealloc();
    }
    uint64_t v18 = v0[10];
    uint64_t v19 = v0[6];
    uint64_t v20 = v0[7];

    (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v18, v19);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v21 = (uint64_t (*)(void))v0[1];
    return v21();
  }
}

uint64_t sub_8B94()
{
  uint64_t v1 = *(void **)(v0 + 96);
  swift_release();
  sub_5C10(v1);
  return _swift_task_switch(sub_D210, 0, 0);
}

uint64_t sub_8C0C()
{
  id v17 = v0;
  sub_DAD8();
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v1 = sub_DAE8();
  os_log_type_t v2 = sub_DCC8();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = v0[13];
    uint64_t v4 = v0[7];
    uint64_t v14 = v0[6];
    uint64_t v15 = v0[8];
    BOOL v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v6 = swift_slowAlloc();
    *(_DWORD *)BOOL v5 = 136315138;
    uint64_t v16 = v6;
    v0[2] = v3;
    swift_errorRetain();
    sub_AB28(&qword_14850);
    uint64_t v7 = sub_DB88();
    v0[3] = sub_AD8C(v7, v8, &v16);
    sub_DDD8();
    swift_bridgeObjectRelease();
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl(&dword_0, v1, v2, "Unable to show abandoned downloads tip: %s", v5, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    swift_errorRelease();
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v15, v14);
  }
  else
  {
    uint64_t v10 = v0[7];
    uint64_t v9 = v0[8];
    uint64_t v11 = v0[6];
    swift_errorRelease();
    swift_errorRelease();
    swift_errorRelease();

    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v9, v11);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v12 = (uint64_t (*)(void))v0[1];
  return v12();
}

uint64_t sub_8E58()
{
  v1[4] = v0;
  uint64_t v2 = sub_DAF8();
  v1[5] = v2;
  v1[6] = *(void *)(v2 - 8);
  v1[7] = swift_task_alloc();
  uint64_t v3 = sub_DA98();
  v1[8] = v3;
  v1[9] = *(void *)(v3 - 8);
  v1[10] = swift_task_alloc();
  uint64_t v4 = sub_DC98();
  v1[11] = v4;
  v1[12] = *(void *)(v4 - 8);
  v1[13] = swift_task_alloc();
  return _swift_task_switch(sub_8FD0, 0, 0);
}

uint64_t sub_8FD0()
{
  id v1 = [self _applePodcastsFoundationSharedUserDefaults];
  id v2 = [v1 episodeLimitForKey:kMTPodcastEpisodeLimitDefaultKey];

  if (v2 == (id)0x100000000)
  {
    v0[14] = sub_BEA8();
    sub_DCA8();
    unint64_t v8 = (void *)swift_task_alloc();
    v0[15] = v8;
    uint64_t v9 = sub_CEBC(0, &qword_14790);
    *unint64_t v8 = v0;
    v8[1] = sub_92A8;
    uint64_t v10 = v0[13];
    return NSManagedObjectContextProvider.managedObjectContext(for:)(v10, v9);
  }
  else
  {
    sub_DAD8();
    uint64_t v3 = sub_DAE8();
    os_log_type_t v4 = sub_DCB8();
    if (os_log_type_enabled(v3, v4))
    {
      uint64_t v5 = swift_slowAlloc();
      *(_DWORD *)uint64_t v5 = 134218240;
      v0[2] = 0x100000000;
      sub_DDD8();
      *(_WORD *)(v5 + 12) = 2048;
      v0[3] = v2;
      sub_DDD8();
      _os_log_impl(&dword_0, v3, v4, "Not displaying the abandoned downloads tip, users retention policy is not 'off'(%lld: %lld", (uint8_t *)v5, 0x16u);
      swift_slowDealloc();
    }

    (*(void (**)(void, void))(v0[6] + 8))(v0[7], v0[5]);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v6 = (uint64_t (*)(void))v0[1];
    return v6(0);
  }
}

uint64_t sub_92A8(uint64_t a1)
{
  uint64_t v3 = *v1;
  os_log_type_t v4 = *(void **)(*v1 + 112);
  uint64_t v5 = *(void *)(*v1 + 104);
  uint64_t v6 = *(void *)(*v1 + 96);
  uint64_t v7 = *(void *)(*v1 + 88);
  uint64_t v11 = *v1;
  *(void *)(v3 + 128) = a1;
  swift_task_dealloc();

  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);
  uint64_t v10 = (uint64_t (*)(uint64_t))((char *)&dword_14798 + dword_14798);
  unint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v3 + 136) = v8;
  *unint64_t v8 = v11;
  v8[1] = sub_9470;
  return v10(a1);
}

uint64_t sub_9470(uint64_t a1)
{
  os_log_type_t v4 = (void *)*v2;
  uint64_t v5 = (void *)*v2;
  v4[18] = a1;
  v4[19] = v1;
  swift_task_dealloc();
  if (v1)
  {
    return _swift_task_switch(sub_973C, 0, 0);
  }
  else
  {
    sub_DAC8();
    uint64_t v6 = (void *)swift_task_alloc();
    v4[20] = v6;
    *uint64_t v6 = v5;
    v6[1] = sub_9620;
    uint64_t v7 = v4[16];
    uint64_t v8 = v4[10];
    return static MediaSpaceCalculator.spaceOccupied(by:managedObjectContext:mediaLibrary:)(v8, a1, v7, sub_9928, 0);
  }
}

uint64_t sub_9620()
{
  *(void *)(*(void *)v1 + 168) = v0;
  swift_task_dealloc();
  if (v0)
  {
    swift_bridgeObjectRelease();
    id v2 = sub_989C;
  }
  else
  {
    id v2 = sub_97C8;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_973C()
{
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_97C8()
{
  uint64_t v1 = (void *)v0[16];
  uint64_t v3 = v0[9];
  uint64_t v2 = v0[10];
  uint64_t v4 = v0[8];
  uint64_t v5 = sub_C688();
  swift_bridgeObjectRelease();

  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v6 = (uint64_t (*)(uint64_t))v0[1];
  return v6(v5);
}

uint64_t sub_989C()
{
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

id sub_9928()
{
  id v0 = [self defaultMediaLibrary];

  return v0;
}

unint64_t sub_9968@<X0>(void *a1@<X8>)
{
  sub_CEBC(0, &qword_147B0);
  unint64_t result = sub_DD98();
  if (!v1)
  {
    uint64_t v4 = sub_9A00(result);
    unint64_t result = swift_bridgeObjectRelease();
    *a1 = v4;
  }
  return result;
}

void *sub_9A00(unint64_t a1)
{
  if (a1 >> 62) {
    goto LABEL_15;
  }
  uint64_t v2 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8));
  while (1)
  {
    if (!v2) {
      return _swiftEmptyArrayStorage;
    }
    unint64_t result = (void *)sub_B8C8(0, v2 & ~(v2 >> 63), 0);
    if (v2 < 0) {
      break;
    }
    uint64_t v4 = 0;
    while (v2 != v4)
    {
      if ((a1 & 0xC000000000000001) != 0) {
        id v5 = (id)sub_DE18();
      }
      else {
        id v5 = *(id *)(a1 + 8 * v4 + 32);
      }
      id v6 = v5;
      unint64_t v8 = _swiftEmptyArrayStorage[2];
      unint64_t v7 = _swiftEmptyArrayStorage[3];
      if (v8 >= v7 >> 1) {
        sub_B8C8(v7 > 1, v8 + 1, 1);
      }
      ++v4;
      _swiftEmptyArrayStorage[2] = v8 + 1;
      uint64_t v9 = (char *)&_swiftEmptyArrayStorage[3 * v8];
      *((void *)v9 + 4) = v6;
      *((void *)v9 + 5) = 0;
      v9[48] = 1;
      if (v2 == v4) {
        return _swiftEmptyArrayStorage;
      }
    }
    __break(1u);
LABEL_15:
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_DE48();
    swift_bridgeObjectRelease();
  }
  __break(1u);
  return result;
}

uint64_t sub_9B5C(void *a1)
{
  uint64_t v3 = sub_DAF8();
  uint64_t v31 = *(void *)(v3 - 8);
  __chkstk_darwin();
  id v5 = &v28[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_AB28(&qword_14778);
  __chkstk_darwin();
  unint64_t v7 = &v28[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  id v8 = [a1 identifier];
  uint64_t v9 = sub_DB78();
  uint64_t v11 = v10;

  if (v9 == 0xD000000000000012 && v11 == 0x800000000000E430)
  {
    swift_bridgeObjectRelease();
LABEL_5:
    sub_DC68();
    uint64_t v13 = sub_DC98();
    (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v7, 0, 1, v13);
    uint64_t v14 = (void *)swift_allocObject();
    v14[2] = 0;
    v14[3] = 0;
    v14[4] = v1;
    v14[5] = a1;
    id v15 = v1;
    id v16 = a1;
    sub_A8CC((uint64_t)v7, (uint64_t)&unk_14788, (uint64_t)v14);
    return swift_release();
  }
  char v12 = sub_DE78();
  swift_bridgeObjectRelease();
  if (v12) {
    goto LABEL_5;
  }
  sub_DAD8();
  id v18 = a1;
  uint64_t v19 = sub_DAE8();
  os_log_type_t v20 = sub_DCC8();
  int v21 = v20;
  if (os_log_type_enabled(v19, v20))
  {
    uint64_t v22 = swift_slowAlloc();
    int v29 = v21;
    uint64_t v23 = v22;
    uint64_t v30 = swift_slowAlloc();
    uint64_t v33 = v30;
    *(_DWORD *)uint64_t v23 = 136315394;
    uint64_t v32 = sub_AD8C(0xD000000000000012, 0x800000000000E430, &v33);
    sub_DDD8();
    *(_WORD *)(v23 + 12) = 2080;
    id v24 = [v18 identifier];
    uint64_t v25 = sub_DB78();
    unint64_t v27 = v26;

    uint64_t v32 = sub_AD8C(v25, v27, &v33);
    sub_DDD8();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_0, v19, (os_log_type_t)v29, "Attempting to apply unknown tip as a retention policy change. Expected '%s', but found '%s'", (uint8_t *)v23, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v31 + 8))(v5, v3);
}

uint64_t sub_9F28(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[2] = a5;
  uint64_t v6 = sub_DC98();
  v5[3] = v6;
  v5[4] = *(void *)(v6 - 8);
  v5[5] = swift_task_alloc();
  return _swift_task_switch(sub_9FE8, 0, 0);
}

uint64_t sub_9FE8()
{
  v0[6] = sub_BEA8();
  sub_DCA8();
  uint64_t v1 = (void *)swift_task_alloc();
  v0[7] = v1;
  uint64_t v2 = sub_CEBC(0, &qword_14790);
  void *v1 = v0;
  v1[1] = sub_A100;
  uint64_t v3 = v0[5];
  return NSManagedObjectContextProvider.managedObjectContext(for:)(v3, v2);
}

uint64_t sub_A100(uint64_t a1)
{
  uint64_t v3 = *v1;
  uint64_t v4 = *(void **)(*v1 + 48);
  uint64_t v5 = *(void *)(*v1 + 40);
  uint64_t v6 = *(void *)(*v1 + 32);
  uint64_t v7 = *(void *)(*v1 + 24);
  uint64_t v11 = *v1;
  *(void *)(v3 + 64) = a1;
  swift_task_dealloc();

  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);
  uint64_t v10 = (uint64_t (*)(uint64_t))((char *)&dword_14798 + dword_14798);
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v3 + 72) = v8;
  *uint64_t v8 = v11;
  v8[1] = sub_A2C8;
  return v10(a1);
}

uint64_t sub_A2C8(uint64_t a1)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 80) = a1;
  *(void *)(v3 + 88) = v1;
  swift_task_dealloc();
  if (v1) {
    uint64_t v4 = sub_A5DC;
  }
  else {
    uint64_t v4 = sub_A3DC;
  }
  return _swift_task_switch(v4, 0, 0);
}

uint64_t sub_A3DC()
{
  v0[12] = [self defaultMediaLibrary];
  uint64_t v1 = (void *)swift_task_alloc();
  v0[13] = v1;
  void *v1 = v0;
  v1[1] = sub_A4A0;
  uint64_t v2 = v0[10];
  uint64_t v3 = v0[8];
  return MPMediaLibrary.remove(episodeIDs:in:)(v2, v3);
}

uint64_t sub_A4A0(char a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 112) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = sub_A850;
  }
  else
  {
    uint64_t v6 = *(void **)(v4 + 96);
    swift_bridgeObjectRelease();

    *(unsigned char *)(v4 + 128) = a1 & 1;
    uint64_t v5 = sub_A648;
  }
  return _swift_task_switch(v5, 0, 0);
}

uint64_t sub_A5DC()
{
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_A648()
{
  if (*(unsigned char *)(v0 + 128) == 1)
  {
    sub_DC58();
    *(void *)(v0 + 120) = sub_DC48();
    uint64_t v2 = sub_DC18();
    return _swift_task_switch(sub_A72C, v2, v1);
  }
  else
  {

    swift_task_dealloc();
    uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
    return v3();
  }
}

uint64_t sub_A72C()
{
  uint64_t v1 = *(void **)(v0 + 16);
  swift_release();
  LODWORD(v2) = -1.0;
  [v1 setActivationPercent:v2];
  LODWORD(v3) = 1.0;
  [v1 setActivationPercent:v3];
  [v1 setImmediateGain:0];
  [v1 setSize:0];
  return _swift_task_switch(sub_A7E4, 0, 0);
}

uint64_t sub_A7E4()
{
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_A850()
{
  uint64_t v1 = *(void **)(v0 + 64);
  swift_bridgeObjectRelease();

  swift_task_dealloc();
  double v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_A8CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_DC98();
  uint64_t v6 = *(void *)(v5 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(a1, 1, v5) != 1)
  {
    sub_DC88();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
    if (!*(void *)(a3 + 16)) {
      return swift_task_create();
    }
    goto LABEL_3;
  }
  sub_B5F0(a1);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_DC18();
    swift_unknownObjectRelease();
  }
  return swift_task_create();
}

id sub_AA4C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PodcastsUsagePlugin();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for PodcastsUsagePlugin()
{
  return self;
}

void type metadata accessor for MTPodcastEpisodeLimit()
{
  if (!qword_14770)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_14770);
    }
  }
}

void *sub_AB0C@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void sub_AB1C(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_AB28(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_AB6C(uint64_t result, unsigned char **a2)
{
  objc_super v2 = *a2;
  unsigned char *v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_AB7C(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_ABB8(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_AC94;
  return v6(a1);
}

uint64_t sub_AC94()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_AD8C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_AE60(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_C62C((uint64_t)v12, *a3);
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
      sub_C62C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_CDDC((uint64_t)v12);
  return v7;
}

uint64_t sub_AE60(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_DDE8();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_B01C(a5, a6);
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
  uint64_t v8 = sub_DE28();
  if (!v8)
  {
    sub_DE38();
    __break(1u);
LABEL_17:
    uint64_t result = sub_DE68();
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

uint64_t sub_B01C(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_B0B4(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_B294(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_B294(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_B0B4(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_B22C(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_DE08();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_DE38();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_DBA8();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_DE68();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_DE38();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_B22C(uint64_t a1, uint64_t a2)
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
  sub_AB28(&qword_147C0);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_B294(char a1, int64_t a2, char a3, char *a4)
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
    sub_AB28(&qword_147C0);
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
  uint64_t result = sub_DE68();
  __break(1u);
  return result;
}

unsigned char **sub_B3E4(unsigned char **result, uint64_t a2, uint64_t a3, char a4)
{
  unint64_t v4 = *result;
  *unint64_t v4 = a4;
  *uint64_t result = v4 + 1;
  return result;
}

uint64_t sub_B3F4()
{
  swift_unknownObjectRelease();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_B43C(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v6 = v1[5];
  int64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  *int64_t v8 = v2;
  v8[1] = sub_B4FC;
  return sub_9F28(a1, v4, v5, v7, v6);
}

uint64_t sub_B4FC()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_B5F0(uint64_t a1)
{
  uint64_t v2 = sub_AB28(&qword_14778);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void *sub_B650(void *__src, uint64_t a2, void *__dst, uint64_t a4)
{
  if (__src) {
    uint64_t v5 = a2 - (void)__src;
  }
  else {
    uint64_t v5 = 0;
  }
  if (!__dst)
  {
    if (v5 <= 0) {
      return __src;
    }
LABEL_12:
    __src = (void *)sub_DE68();
    __break(1u);
    return __src;
  }
  if (a4 - (uint64_t)__dst < v5) {
    goto LABEL_12;
  }
  if (__src)
  {
    return memmove(__dst, __src, a2 - (void)__src);
  }
  return __src;
}

unint64_t sub_B6F4(uint64_t a1, uint64_t a2)
{
  sub_DEA8();
  sub_DB98();
  Swift::Int v4 = sub_DEB8();

  return sub_B76C(a1, a2, v4);
}

unint64_t sub_B76C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_DE78() & 1) == 0)
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
      while (!v14 && (sub_DE78() & 1) == 0);
    }
  }
  return v6;
}

void sub_B850(uint64_t a1)
{
  id v2 = [self sharedInstance];
  swift_beginAccess();
  uint64_t v3 = *(void **)(a1 + 16);
  *(void *)(a1 + 16) = v2;
}

uint64_t sub_B8C8(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_B8E8(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_B8E8(char a1, int64_t a2, char a3, char *a4)
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
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    sub_AB28(&qword_147B8);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 24);
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  size_t v14 = 24 * v8;
  if (a1)
  {
    if (v10 != a4 || v12 >= &v13[v14]) {
      memmove(v12, v13, v14);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v14] || v12 >= &v13[v14])
  {
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_DE68();
  __break(1u);
  return result;
}

void sub_BA64(void *a1)
{
  uint64_t v2 = sub_DAF8();
  uint64_t v31 = *(void *)(v2 - 8);
  __chkstk_darwin();
  uint64_t v4 = (char *)v29 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_AB28(&qword_14818);
  __chkstk_darwin();
  unint64_t v6 = (char *)v29 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v7 = [a1 identifier];
  uint64_t v8 = sub_DB78();
  uint64_t v10 = v9;

  if (v8 == 0x6F69746E65746572 && v10 == 0xEF7963696C6F506ELL)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    char v12 = sub_DE78();
    swift_bridgeObjectRelease();
    if ((v12 & 1) == 0)
    {
      sub_DAD8();
      id v13 = a1;
      size_t v14 = sub_DAE8();
      os_log_type_t v15 = sub_DCC8();
      if (os_log_type_enabled(v14, v15))
      {
        id v16 = (uint8_t *)swift_slowAlloc();
        uint64_t v30 = swift_slowAlloc();
        uint64_t v33 = v30;
        *(_DWORD *)id v16 = 136315138;
        v29[1] = v16 + 4;
        id v17 = [v13 identifier];
        uint64_t v18 = sub_DB78();
        unint64_t v20 = v19;

        uint64_t v32 = sub_AD8C(v18, v20, &v33);
        sub_DDD8();

        swift_bridgeObjectRelease();
        _os_log_impl(&dword_0, v14, v15, "Unable to satisfy 'more' action of downloads tip for %s. Nothing will happen.", v16, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {
      }
      (*(void (**)(char *, uint64_t))(v31 + 8))(v4, v2);
      return;
    }
  }
  id v21 = [self defaultWorkspace];
  if (v21)
  {
    uint64_t v22 = v21;
    sub_D9E8();
    uint64_t v23 = sub_DA08();
    uint64_t v24 = *(void *)(v23 - 8);
    unint64_t v26 = 0;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v24 + 48))(v6, 1, v23) != 1)
    {
      sub_D9F8(v25);
      unint64_t v26 = v27;
      (*(void (**)(char *, uint64_t))(v24 + 8))(v6, v23);
    }
    sub_5D88((uint64_t)&_swiftEmptyArrayStorage);
    Class isa = sub_DB48().super.isa;
    swift_bridgeObjectRelease();
    [v22 openSensitiveURL:v26 withOptions:isa];
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_BEA8()
{
  uint64_t v0 = (id *)swift_allocObject();
  v0[2] = 0;
  uint64_t v1 = v0 + 2;
  uint64_t v2 = self;
  aBlock[4] = sub_C60C;
  aBlock[5] = v0;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = (id)1107296256;
  aBlock[2] = sub_77FC;
  aBlock[3] = &unk_10828;
  uint64_t v3 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  aBlock[0] = 0;
  [v2 perform:v3 error:aBlock];
  _Block_release(v3);
  if (aBlock[0])
  {
    swift_willThrow();
    return swift_release();
  }
  else
  {
    uint64_t result = swift_beginAccess();
    if (*v1)
    {
      id v5 = *v1;
      swift_release();
      return (uint64_t)v5;
    }
    else
    {
      __break(1u);
    }
  }
  return result;
}

uint64_t sub_C050(uint64_t a1)
{
  v1[3] = a1;
  uint64_t v2 = sub_DD88();
  v1[4] = v2;
  v1[5] = *(void *)(v2 - 8);
  v1[6] = swift_task_alloc();
  return _swift_task_switch(sub_C110, 0, 0);
}

uint64_t sub_C110()
{
  uint64_t v2 = v0[5];
  uint64_t v1 = v0[6];
  uint64_t v4 = (void *)v0[3];
  uint64_t v3 = v0[4];
  sub_DB78();
  id v5 = objc_allocWithZone((Class)NSFetchRequest);
  NSString v6 = sub_DB58();
  swift_bridgeObjectRelease();
  id v7 = [v5 initWithEntityName:v6];
  v0[7] = v7;

  sub_CEBC(0, &qword_147A0);
  uint64_t v8 = (void *)sub_DDC8();
  [v7 setPredicate:v8];

  [v7 setResultType:1];
  uint64_t v9 = swift_allocObject();
  v0[8] = v9;
  *(void *)(v9 + 16) = v4;
  *(void *)(v9 + 24) = v7;
  (*(void (**)(uint64_t, void, uint64_t))(v2 + 104))(v1, enum case for NSManagedObjectContext.ScheduledTaskType.immediate(_:), v3);
  id v10 = v4;
  id v11 = v7;
  char v12 = (void *)swift_task_alloc();
  v0[9] = v12;
  uint64_t v13 = sub_AB28(&qword_147A8);
  *char v12 = v0;
  v12[1] = sub_C300;
  uint64_t v14 = v0[6];
  return NSManagedObjectContext.perform<A>(schedule:_:)(v0 + 2, v14, sub_C5B4, v9, v13);
}

uint64_t sub_C300()
{
  uint64_t v2 = *(void *)(*(void *)v1 + 48);
  uint64_t v3 = *(void *)(*(void *)v1 + 40);
  uint64_t v4 = *(void *)(*(void *)v1 + 32);
  *(void *)(*(void *)v1 + 80) = v0;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  swift_release();
  if (v0) {
    id v5 = sub_C508;
  }
  else {
    id v5 = sub_C494;
  }
  return _swift_task_switch(v5, 0, 0);
}

uint64_t sub_C494()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v2(v1);
}

uint64_t sub_C508()
{
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_C574()
{
  return _swift_deallocObject(v0, 32, 7);
}

unint64_t sub_C5B4@<X0>(void *a1@<X8>)
{
  return sub_9968(a1);
}

uint64_t sub_C5D4()
{
  return _swift_deallocObject(v0, 24, 7);
}

void sub_C60C()
{
  sub_B850(v0);
}

uint64_t sub_C614(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_C624()
{
  return swift_release();
}

uint64_t sub_C62C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_C688()
{
  id v1 = [objc_allocWithZone((Class)STStorageOptionTip) init];
  NSString v2 = sub_DB58();
  [v1 setIdentifier:v2];

  id v3 = v1;
  v15._countAndFlagsBits = 0xD00000000000001ALL;
  v15._object = (void *)0x800000000000E6C0;
  v18._countAndFlagsBits = 0;
  v18._object = (void *)0xE000000000000000;
  sub_DAA8(v15, v18);
  NSString v4 = sub_DB58();
  swift_bridgeObjectRelease();
  [v3 setTitle:v4];

  uint64_t v5 = sub_DA78();
  uint64_t result = (uint64_t)[self stringWithBytesize:v5];
  if (result)
  {
    uint64_t v7 = (void *)result;
    uint64_t v8 = sub_DB78();
    uint64_t v10 = v9;

    v16._countAndFlagsBits = 0xD00000000000002CLL;
    v19._countAndFlagsBits = 0xD0000000000000D5;
    v16._object = (void *)0x800000000000E6E0;
    v19._object = (void *)0x800000000000E710;
    sub_DAA8(v16, v19);
    sub_AB28(&qword_147C8);
    uint64_t v11 = swift_allocObject();
    *(_OWORD *)(v11 + 16) = xmmword_E330;
    *(void *)(v11 + 56) = &type metadata for String;
    *(void *)(v11 + 64) = sub_C958();
    *(void *)(v11 + 32) = v8;
    *(void *)(v11 + 40) = v10;
    id v12 = v3;
    sub_DB68();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    NSString v13 = sub_DB58();
    swift_bridgeObjectRelease();
    [v12 setInfoText:v13];

    [v12 setRepresentedApp:comApplePodcasts];
    [v12 setMayCauseDataLoss:1];
    v17._countAndFlagsBits = 0xD00000000000001ALL;
    v17._object = (void *)0x800000000000E6C0;
    v20._countAndFlagsBits = 0;
    v20._object = (void *)0xE000000000000000;
    sub_DAA8(v17, v20);
    NSString v14 = sub_DB58();
    swift_bridgeObjectRelease();
    [v12 setConfirmationButtonTitle:v14];

    [v12 setDelegate:v0];
    uint64_t result = sub_DA78();
    if ((result & 0x8000000000000000) == 0)
    {
      [v12 setImmediateGain:result];
      return (uint64_t)v12;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

unint64_t sub_C958()
{
  unint64_t result = qword_147D0;
  if (!qword_147D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_147D0);
  }
  return result;
}

uint64_t sub_C9AC()
{
  return sub_82A4(*(void **)(v0 + 16), *(void **)(v0 + 24));
}

unint64_t sub_C9B4()
{
  unint64_t result = qword_147F0;
  if (!qword_147F0)
  {
    sub_CA10(&qword_147E8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_147F0);
  }
  return result;
}

uint64_t sub_CA10(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

id sub_CA58(double a1)
{
  NSString v2 = *(void **)(v1 + 24);
  LODWORD(a1) = -1.0;
  [v2 setActivationPercent:a1];
  LODWORD(v3) = 1.0;
  [v2 setActivationPercent:v3];
  [v2 setImmediateGain:0];

  return [v2 setSize:0];
}

uint64_t sub_CAD0(uint64_t a1)
{
  return sub_6E48(a1, v1);
}

uint64_t sub_CAD8()
{
  uint64_t v1 = sub_AB28(&qword_14800);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 24) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v5, v6);
}

uint64_t sub_CBA8()
{
  uint64_t v1 = *(void *)(sub_AB28(&qword_14800) - 8);
  uint64_t v2 = *(void *)(v0 + 16);
  uint64_t v3 = v0 + ((*(unsigned __int8 *)(v1 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80));

  return sub_71D4(v2, v3);
}

uint64_t sub_CC10()
{
  uint64_t v1 = sub_AB28(&qword_14800);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v5, v6);
}

uint64_t sub_CCA4(uint64_t a1, uint64_t a2, char a3)
{
  char v5 = a3 & 1;
  sub_AB28(&qword_14800);

  return sub_7778(a1, a2, v5);
}

uint64_t sub_CD30(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t *sub_CD78(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t sub_CDDC(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_CE2C()
{
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_CE64(uint64_t a1)
{
  return sub_D240(a1, *(void *)(v1 + 16), *(uint64_t (**)(void, void, void))(v1 + 24), *(void *)(v1 + 32));
}

uint64_t sub_CE70()
{
  swift_release();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_CEB0()
{
  return sub_D404(*(void *)(v0 + 16), *(void (**)(void, void, uint64_t))(v0 + 24), *(void *)(v0 + 32));
}

uint64_t sub_CEBC(uint64_t a1, unint64_t *a2)
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

uint64_t sub_CEF8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_AB28(&qword_14828);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

_OWORD *sub_CF60(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_CF74(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_B4FC;
  return sub_6128(a1, v4, v5, v6);
}

uint64_t sub_D02C()
{
  swift_unknownObjectRelease();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_D06C(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_D214;
  return sub_8634(a1, v4, v5, v6);
}

uint64_t sub_D120()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_D158(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_D214;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_14858 + dword_14858);
  return v6(a1, v4);
}

uint64_t sub_D240(uint64_t a1, uint64_t a2, uint64_t (*a3)(void, void, void), uint64_t a4)
{
  uint64_t v8 = sub_DAF8();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin();
  uint64_t v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_DAD8();
  id v12 = sub_DAE8();
  os_log_type_t v13 = sub_DCD8();
  if (os_log_type_enabled(v12, v13))
  {
    NSString v14 = (_DWORD *)swift_slowAlloc();
    uint64_t v18 = a4;
    uint64_t v19 = a2;
    Swift::String v15 = a3;
    Swift::String v16 = v14;
    *NSString v14 = 134218240;
    sub_DDD8();
    *((_WORD *)v16 + 6) = 2048;
    uint64_t v19 = a1;
    sub_DDD8();
    _os_log_impl(&dword_0, v12, v13, "present storage - defaults say yes, with number of episodes to delete: %ld, size: %ld", (uint8_t *)v16, 0x16u);
    a3 = v15;
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  return a3(a2, a1, 0);
}

uint64_t sub_D404(uint64_t a1, void (*a2)(void, void, uint64_t), uint64_t a3)
{
  uint64_t v19 = a2;
  uint64_t v4 = sub_DAF8();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_DA98();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (sub_DCE8() < 0)
  {
    uint64_t result = sub_DE38();
    __break(1u);
  }
  else
  {
    sub_DA68();
    if (sub_DA88())
    {
      uint64_t v12 = sub_DD78();
      os_log_type_t v13 = (void *)swift_allocObject();
      v13[2] = v19;
      v13[3] = a3;
      v13[4] = v12;
      swift_retain();
      sub_DCF8();
      swift_release();
    }
    else
    {
      sub_DAD8();
      NSString v14 = sub_DAE8();
      os_log_type_t v15 = sub_DCD8();
      if (os_log_type_enabled(v14, v15))
      {
        Swift::String v16 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)Swift::String v16 = 0;
        _os_log_impl(&dword_0, v14, v15, "Will not present storage tip, less than 1GB of storage used.", v16, 2u);
        swift_slowDealloc();
      }

      (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
      v19(0, 0, 1);
    }
    return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }
  return result;
}

uint64_t sub_D6E4(uint64_t a1, uint64_t (*a2)(void, void, void), uint64_t a3, uint64_t a4)
{
  uint64_t v8 = sub_DAF8();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v12 = (char *)&v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  NSString v14 = (char *)&v27 - v13;
  if (a1 < 1)
  {
    sub_DAD8();
    uint64_t v23 = sub_DAE8();
    os_log_type_t v24 = sub_DCD8();
    if (os_log_type_enabled(v23, v24))
    {
      uint64_t v25 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v25 = 0;
      _os_log_impl(&dword_0, v23, v24, "Will not present storage tip, no space will be reclaimed by the default policy", v25, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);
    uint64_t v20 = 0;
    uint64_t v21 = 0;
    uint64_t v22 = 1;
  }
  else
  {
    sub_DAD8();
    os_log_type_t v15 = sub_DAE8();
    os_log_type_t v16 = sub_DCD8();
    if (os_log_type_enabled(v15, v16))
    {
      Swift::String v17 = (_DWORD *)swift_slowAlloc();
      uint64_t v27 = a3;
      uint64_t v28 = a4;
      uint64_t v18 = a2;
      uint64_t v19 = v17;
      *Swift::String v17 = 134218240;
      sub_DDD8();
      *((_WORD *)v19 + 6) = 2048;
      uint64_t v28 = a1;
      sub_DDD8();
      _os_log_impl(&dword_0, v15, v16, "present storage - threshold say yes, with number of episodes to delete: %ld, size: %ld", (uint8_t *)v19, 0x16u);
      a2 = v18;
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v9 + 8))(v14, v8);
    uint64_t v20 = a4;
    uint64_t v21 = a1;
    uint64_t v22 = 0;
  }
  return a2(v20, v21, v22);
}

uint64_t sub_D970()
{
  return _swift_deallocClassInstance(v0, 24, 7);
}

uint64_t type metadata accessor for PodcastsUsageController()
{
  return self;
}

uint64_t sub_D9A4()
{
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_D9DC(uint64_t a1)
{
  return sub_D6E4(a1, *(uint64_t (**)(void, void, void))(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32));
}

uint64_t sub_D9E8()
{
  return static URL.iOSAutomaticallyDownloadPreferences.getter();
}

void sub_D9F8(NSURL *retstr@<X8>)
{
}

uint64_t sub_DA08()
{
  return type metadata accessor for URL();
}

uint64_t sub_DA18()
{
  return MediaLibraryStorageController.shouldDisplayStorageCleanupTip.getter();
}

uint64_t sub_DA28()
{
  return static MediaLibraryStorageController.shared.getter();
}

uint64_t sub_DA38()
{
  return type metadata accessor for MediaLibraryStorageController();
}

uint64_t sub_DA48()
{
  return isFeatureEnabled(_:)();
}

uint64_t sub_DA58()
{
  return type metadata accessor for Podcasts();
}

uint64_t sub_DA68()
{
  return StorageSpace.init(bytes:)();
}

uint64_t sub_DA78()
{
  return StorageSpace.bytes.getter();
}

uint64_t sub_DA88()
{
  return StorageSpace.gigabytes.getter();
}

uint64_t sub_DA98()
{
  return type metadata accessor for StorageSpace();
}

uint64_t sub_DAA8(Swift::String _, Swift::String comment)
{
  return PFLocalizedString(_:comment:)(_, comment)._countAndFlagsBits;
}

uint64_t sub_DAC8()
{
  return type metadata accessor for MediaSpaceCalculator();
}

uint64_t sub_DAD8()
{
  return static Logger.downloads.getter();
}

uint64_t sub_DAE8()
{
  return Logger.logObject.getter();
}

uint64_t sub_DAF8()
{
  return type metadata accessor for Logger();
}

uint64_t sub_DB08()
{
  return type metadata accessor for DispatchWorkItemFlags();
}

uint64_t sub_DB18()
{
  return type metadata accessor for DispatchQoS.QoSClass();
}

uint64_t sub_DB28()
{
  return static DispatchQoS.unspecified.getter();
}

uint64_t sub_DB38()
{
  return type metadata accessor for DispatchQoS();
}

NSDictionary sub_DB48()
{
  return Dictionary._bridgeToObjectiveC()();
}

NSString sub_DB58()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_DB68()
{
  return static String.localizedStringWithFormat(_:_:)();
}

uint64_t sub_DB78()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_DB88()
{
  return String.init<A>(describing:)();
}

uint64_t sub_DB98()
{
  return String.hash(into:)();
}

Swift::Int sub_DBA8()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_DBB8()
{
  return specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
}

NSArray sub_DBC8()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_DBD8()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_DBE8()
{
  return specialized Array._endMutation()();
}

uint64_t sub_DBF8()
{
  return specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_DC08()
{
  return specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_DC18()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_DC28()
{
  return CheckedContinuation.resume(throwing:)();
}

uint64_t sub_DC38()
{
  return CheckedContinuation.resume(returning:)();
}

uint64_t sub_DC48()
{
  return static MainActor.shared.getter();
}

uint64_t sub_DC58()
{
  return type metadata accessor for MainActor();
}

uint64_t sub_DC68()
{
  return static TaskPriority.userInitiated.getter();
}

uint64_t sub_DC78()
{
  return static TaskPriority.utility.getter();
}

uint64_t sub_DC88()
{
  return TaskPriority.rawValue.getter();
}

uint64_t sub_DC98()
{
  return type metadata accessor for TaskPriority();
}

uint64_t sub_DCA8()
{
  return static Task<>.currentPriority.getter();
}

uint64_t sub_DCB8()
{
  return static os_log_type_t.info.getter();
}

uint64_t sub_DCC8()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_DCD8()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_DCE8()
{
  return MPMediaLibrary.totalPodcastsAssetsFileSize.getter();
}

uint64_t sub_DCF8()
{
  return MPMediaLibrary.checkSizeOfEpisodesToBeDeleted(for:completion:)();
}

uint64_t sub_DD08()
{
  return MPMediaLibrary.removeEpisodesExcludedByGlobalDefault(for:)();
}

uint64_t sub_DD28()
{
  return static OS_dispatch_queue.localAssetSupportWorkQueue.getter();
}

uint64_t sub_DD38()
{
  return static OS_dispatch_queue.main.getter();
}

uint64_t sub_DD48()
{
  return OS_dispatch_queue.async(group:qos:flags:execute:)();
}

uint64_t sub_DD58()
{
  return static OS_dispatch_queue.global(qos:)();
}

uint64_t sub_DD68()
{
  return static MTPodcastEpisodeLimit.defaultOption.getter();
}

uint64_t sub_DD78()
{
  return MTPodcastEpisodeLimit.numberOfExcludedAutomaticallyDownloadedEpisodes.getter();
}

uint64_t sub_DD88()
{
  return type metadata accessor for NSManagedObjectContext.ScheduledTaskType();
}

uint64_t sub_DD98()
{
  return NSManagedObjectContext.fetch<A>(_:)();
}

uint64_t sub_DDC8()
{
  return static MTEpisode.predicateForAutomaticallyDownloadedEpisodes()();
}

uint64_t sub_DDD8()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_DDE8()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_DDF8()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

uint64_t sub_DE08()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_DE18()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_DE28()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_DE38()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_DE48()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_DE58()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_DE68()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t sub_DE78()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

NSNumber sub_DE98()
{
  return Int64._bridgeToObjectiveC()();
}

uint64_t sub_DEA8()
{
  return Hasher.init(_seed:)();
}

Swift::Int sub_DEB8()
{
  return Hasher._finalize()();
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

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
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

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}