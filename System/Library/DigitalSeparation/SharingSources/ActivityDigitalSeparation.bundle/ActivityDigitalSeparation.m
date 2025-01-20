uint64_t sub_22B4(unint64_t a1)
{
  uint64_t v3;

  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    sub_28E8((uint64_t *)&unk_116F0);
    v3 = sub_9A68();
    swift_bridgeObjectRelease();
    return v3;
  }
  else
  {
    swift_bridgeObjectRetain();
    sub_9AC8();
    return a1;
  }
}

id sub_2338()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ActivityDigitalSeparationSharedResource();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for ActivityDigitalSeparationSharedResource()
{
  return self;
}

void type metadata accessor for DSSourceName()
{
  if (!qword_11660)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_11660);
    }
  }
}

uint64_t sub_23F8(uint64_t a1, uint64_t a2)
{
  return sub_26D8(a1, a2, (uint64_t (*)(uint64_t))&String._bridgeToObjectiveC());
}

uint64_t sub_2410(uint64_t a1, id *a2)
{
  uint64_t result = sub_9888();
  *a2 = 0;
  return result;
}

uint64_t sub_2488(uint64_t a1, id *a2)
{
  char v3 = sub_9898();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_2508@<X0>(void *a1@<X8>)
{
  sub_98A8();
  NSString v2 = sub_9878();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_254C@<X0>(void *a1@<X8>)
{
  NSString v2 = sub_9878();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_2594@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_98A8();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_25C0(uint64_t a1)
{
  uint64_t v2 = sub_28A4(&qword_11680);
  uint64_t v3 = sub_28A4(&qword_11688);

  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_2658()
{
  return sub_28A4(&qword_11668);
}

uint64_t sub_268C()
{
  return sub_28A4(&qword_11670);
}

uint64_t sub_26C0(uint64_t a1, uint64_t a2)
{
  return sub_26D8(a1, a2, (uint64_t (*)(uint64_t))&String.hashValue.getter);
}

uint64_t sub_26D8(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = sub_98A8();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_271C()
{
  sub_98A8();
  sub_98B8();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_2770()
{
  sub_98A8();
  sub_9B18();
  sub_98B8();
  Swift::Int v0 = sub_9B38();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_27E4()
{
  uint64_t v0 = sub_98A8();
  uint64_t v2 = v1;
  if (v0 == sub_98A8() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_9AB8();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_2870()
{
  return sub_28A4(&qword_11678);
}

uint64_t sub_28A4(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for DSSourceName();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_28E8(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

id sub_293C()
{
  sub_28E8(&qword_11828);
  __chkstk_darwin();
  uint64_t v2 = (char *)&v14 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = (void *)DSSourceNameActivity;
  *(void *)&v0[OBJC_IVAR____TtC25ActivityDigitalSeparation31ActivityDigitalSeparationSource_name] = DSSourceNameActivity;
  id v4 = objc_allocWithZone((Class)HKHealthStore);
  char v5 = v0;
  id v6 = v3;
  id v7 = [v4 init];
  *(void *)&v5[OBJC_IVAR____TtC25ActivityDigitalSeparation31ActivityDigitalSeparationSource_healthStore] = v7;
  sub_9868();
  *(void *)&v5[OBJC_IVAR____TtC25ActivityDigitalSeparation31ActivityDigitalSeparationSource_client] = sub_9858();

  ASLoggingInitialize();
  v8 = (objc_class *)type metadata accessor for ActivityDigitalSeparationSource();
  v14.receiver = v5;
  v14.super_class = v8;
  id v9 = objc_msgSendSuper2(&v14, "init");
  uint64_t v10 = sub_9918();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v2, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = v9;
  id v12 = v9;
  sub_2C98((uint64_t)v2, (uint64_t)&unk_118C0, (uint64_t)v11);
  swift_release();
  return v12;
}

uint64_t sub_2AD4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 16) = a4;
  return _swift_task_switch(sub_2AF4, 0, 0);
}

uint64_t sub_2AF4()
{
  uint64_t v3 = (uint64_t (*)(void))((char *)&async function pointer to dispatch thunk of ActivitySharingClient.activate()
                         + async function pointer to dispatch thunk of ActivitySharingClient.activate());
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 24) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_2BA4;
  return v3();
}

uint64_t sub_2BA4()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_2C98(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_9918();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_9908();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_8A08(a1, &qword_11828);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_98F8();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_2E68(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[5] = a5;
  v6[6] = a6;
  uint64_t v8 = (void *)swift_task_alloc();
  v6[7] = v8;
  void *v8 = v6;
  v8[1] = sub_2F14;
  v8[2] = a4;
  return _swift_task_switch(sub_6504, 0, 0);
}

uint64_t sub_2F14(uint64_t a1)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 64) = a1;
  *(void *)(v3 + 72) = v1;
  swift_task_dealloc();
  if (v1) {
    uint64_t v4 = sub_3274;
  }
  else {
    uint64_t v4 = sub_3028;
  }
  return _swift_task_switch(v4, 0, 0);
}

void sub_3028()
{
  unint64_t receiver = (unint64_t)v0[4].receiver;
  v16 = _swiftEmptyArrayStorage;
  if (receiver >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_9A78();
    swift_bridgeObjectRelease();
    if (v2) {
      goto LABEL_3;
    }
LABEL_15:
    swift_bridgeObjectRelease();
    uint64_t v7 = _swiftEmptyArrayStorage;
    goto LABEL_16;
  }
  uint64_t v2 = *(void *)((char *)&dword_10 + (receiver & 0xFFFFFFFFFFFFFF8));
  if (!v2) {
    goto LABEL_15;
  }
LABEL_3:
  if (v2 < 1)
  {
    __break(1u);
    return;
  }
  uint64_t v3 = 0;
  uint64_t v4 = (uint64_t)v0[4].receiver + 32;
  do
  {
    if ((receiver & 0xC000000000000001) != 0) {
      id v5 = (id)sub_99E8();
    }
    else {
      id v5 = *(id *)(v4 + 8 * v3);
    }
    uint64_t v6 = v5;
    if ((objc_msgSend(v5, "isFriendshipCurrentlyActive", v16) & 1) != 0
      || [v6 hasInviteRequestFromMe])
    {
      sub_9A08();
      sub_9A38();
      sub_9A48();
      sub_9A18();
    }
    else
    {
    }
    ++v3;
  }
  while (v2 != v3);
  swift_bridgeObjectRelease();
  uint64_t v7 = v16;
LABEL_16:
  super_class = (void (*)(void, void))v0[2].super_class;
  id v9 = sub_80AC((unint64_t)v7);
  swift_release();
  uint64_t v10 = (objc_class *)type metadata accessor for ActivityDigitalSeparationSharedResource();
  v11 = (char *)objc_allocWithZone(v10);
  *(void *)&v11[OBJC_IVAR____TtC25ActivityDigitalSeparation39ActivityDigitalSeparationSharedResource_digitalSeparationFriends] = v9;
  v0[1].unint64_t receiver = v11;
  v0[1].super_class = v10;
  id v12 = objc_msgSendSuper2(v0 + 1, "init");
  sub_28E8(&qword_11818);
  uint64_t v13 = swift_allocObject();
  *(_OWORD *)(v13 + 16) = xmmword_ACD0;
  *(void *)(v13 + 32) = v12;
  uint64_t v17 = v13;
  sub_98E8();
  id v14 = v12;
  super_class(v17, 0);
  swift_bridgeObjectRelease();

  v15 = (void (*)(void))v0->super_class;
  v15();
}

uint64_t sub_3274()
{
  uint64_t result = sub_9948();
  uint64_t v2 = (void *)ASLogDefault;
  if (ASLogDefault)
  {
    os_log_type_t v3 = result;
    if (os_log_type_enabled(ASLogDefault, (os_log_type_t)result))
    {
      uint64_t v4 = v2;
      id v5 = (uint8_t *)swift_slowAlloc();
      uint64_t v6 = (void *)swift_slowAlloc();
      *(_DWORD *)id v5 = 138412290;
      sub_7F24();
      swift_allocError();
      *uint64_t v7 = 1;
      uint64_t v8 = _swift_stdlib_bridgeErrorToNSError();
      v0[4] = v8;
      sub_9978();
      *uint64_t v6 = v8;
      _os_log_impl(&dword_0, v4, v3, "Fetching friend list failed with error: %@", v5, 0xCu);
      sub_28E8(&qword_11878);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    id v9 = (void (*)(void *, uint64_t))v0[5];
    sub_7F24();
    uint64_t v10 = swift_allocError();
    unsigned char *v11 = 1;
    v9(_swiftEmptyArrayStorage, v10);
    swift_errorRelease();
    swift_errorRelease();
    id v12 = (uint64_t (*)(void))v0[1];
    return v12();
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_34C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_28E8(&qword_11898);
  v5.super.isa = sub_98D8().super.isa;
  if (a2) {
    uint64_t v6 = sub_9808();
  }
  else {
    uint64_t v6 = 0;
  }
  id v7 = (id)v6;
  (*(void (**)(uint64_t, Class))(a3 + 16))(a3, v5.super.isa);
}

void sub_355C(void **a1@<X0>, void *a2@<X8>)
{
  sub_28E8(&qword_118B0);
  uint64_t v5 = ((uint64_t (*)(void))__chkstk_darwin)();
  id v7 = (char *)&v51 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  id v9 = (char *)&v51 - v8;
  uint64_t v10 = *a1;
  v11 = (objc_class *)type metadata accessor for ActivityDigitalSeparationFriend();
  id v12 = (char *)objc_allocWithZone(v11);
  *(void *)&v12[OBJC_IVAR____TtC25ActivityDigitalSeparation31ActivityDigitalSeparationFriend_sharingFriend] = v10;
  v61.unint64_t receiver = v12;
  v61.super_class = v11;
  id v13 = v10;
  id v14 = objc_msgSendSuper2(&v61, "init");
  int v15 = sub_9948();
  v16 = ASLogDefault;
  if (!ASLogDefault)
  {
    __break(1u);
    goto LABEL_26;
  }
  int v17 = v15;
  id v18 = v14;
  if (!os_log_type_enabled(v16, (os_log_type_t)v17))
  {

LABEL_24:
    *a2 = v18;
    return;
  }
  int v54 = v17;
  id v55 = v18;
  v56 = a2;
  v19 = (char *)v18;
  v53 = v16;
  uint64_t v20 = swift_slowAlloc();
  uint64_t v52 = swift_slowAlloc();
  uint64_t v62 = v52;
  *(_DWORD *)uint64_t v20 = 136315650;
  uint64_t v60 = sub_6B04(0xD00000000000001FLL, 0x800000000000A470, &v62);
  sub_9978();
  *(_WORD *)(v20 + 12) = 2080;
  uint64_t v21 = OBJC_IVAR____TtC25ActivityDigitalSeparation31ActivityDigitalSeparationFriend_sharingFriend;
  v59 = v19;
  id v22 = [*(id *)&v19[OBJC_IVAR____TtC25ActivityDigitalSeparation31ActivityDigitalSeparationFriend_sharingFriend] displayName];
  uint64_t v57 = v21;
  uint64_t v58 = v2;
  if (v22)
  {
    v23 = v22;
    sub_98A8();
  }
  uint64_t v24 = sub_97F8();
  uint64_t v25 = *(void *)(v24 - 8);
  v26 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v25 + 56);
  v26(v7, 1, 1, v24);
  sub_97D8();
  v26(v9, 0, 1, v24);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v25 + 48))(v9, 1, v24) == 1)
  {
    sub_8A08((uint64_t)v9, &qword_118B0);
    v27 = v59;
    uint64_t v28 = v57;
  }
  else
  {
    uint64_t v29 = sub_97C8();
    unint64_t v31 = v30;
    (*(void (**)(char *, uint64_t))(v25 + 8))(v9, v24);
    v27 = v59;
    uint64_t v28 = v57;
    if (v31) {
      goto LABEL_10;
    }
  }
  swift_bridgeObjectRelease();
  uint64_t v29 = 0;
  unint64_t v31 = 0xE000000000000000;
LABEL_10:
  uint64_t v60 = sub_6B04(v29, v31, &v62);
  sub_9978();

  swift_bridgeObjectRelease();
  *(_WORD *)(v20 + 22) = 2080;
  id v32 = [*(id *)&v27[v28] contact];
  if (!v32) {
    goto LABEL_21;
  }
  v33 = v32;
  id v34 = [v32 primaryRelationship];

  if (!v34) {
    goto LABEL_21;
  }
  id v35 = [v34 cloudKitAddress];
  if (v35)
  {
    v36 = v35;
    uint64_t v37 = sub_98A8();
    unint64_t v39 = v38;

    NSString v40 = sub_9878();
    char IsEmail = ASDestinationIsEmail();

    if (IsEmail)
    {
LABEL_17:

      v46 = v53;
      v27 = v59;
LABEL_23:
      uint64_t v60 = sub_6B04(v37, v39, &v62);
      sub_9978();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_0, v46, (os_log_type_t)v54, "Created %s with name: %s and email: %s", (uint8_t *)v20, 0x20u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      id v18 = v55;
      a2 = v56;
      goto LABEL_24;
    }
    swift_bridgeObjectRelease();
  }
  id v42 = [v34 preferredReachableAddress];
  if (v42)
  {
    v43 = v42;
    uint64_t v37 = sub_98A8();
    unint64_t v39 = v44;

    NSString v45 = sub_9878();
    LOBYTE(v43) = ASDestinationIsEmail();

    if (v43) {
      goto LABEL_17;
    }
    swift_bridgeObjectRelease();
  }
  id v47 = [v34 addresses];
  if (v47)
  {
    v48 = v47;
    uint64_t v49 = sub_9928();

    uint64_t v37 = sub_9534(v49);
    unint64_t v39 = v50;
    swift_bridgeObjectRelease();

    v27 = v59;
    if (v39)
    {
LABEL_22:
      v46 = v53;
      goto LABEL_23;
    }
LABEL_21:
    uint64_t v37 = 0;
    unint64_t v39 = 0xE000000000000000;
    goto LABEL_22;
  }
LABEL_26:

  __break(1u);
}

void sub_3B58(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uint64_t v3 = sub_9808();
  }
  else {
    uint64_t v3 = 0;
  }
  id v4 = (id)v3;
  (*(void (**)(uint64_t))(a2 + 16))(a2);
}

uint64_t sub_3BD4(void *a1, int a2, uint64_t a3, void *aBlock, void (*a5)(uint64_t, id, void *))
{
  uint64_t v8 = _Block_copy(aBlock);
  _Block_copy(v8);
  swift_unknownObjectRetain();
  id v9 = a1;
  a5(a3, v9, v8);
  _Block_release(v8);
  _Block_release(v8);

  return swift_unknownObjectRelease();
}

uint64_t sub_3C60(uint64_t a1, uint64_t a2)
{
  sub_28E8(&qword_11828);
  __chkstk_darwin();
  uint64_t v6 = (char *)v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_9918();
  uint64_t v8 = *(void *)(v7 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v8 + 56))(v6, 1, 1, v7);
  id v9 = (void *)swift_allocObject();
  v9[2] = 0;
  v9[3] = 0;
  v9[4] = v2;
  v9[5] = a1;
  v9[6] = a2;
  LODWORD(a1) = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7);
  id v10 = v2;
  swift_retain();
  if (a1 == 1)
  {
    sub_8A08((uint64_t)v6, &qword_11828);
  }
  else
  {
    sub_9908();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v6, v7);
    if (v9[2])
    {
      swift_getObjectType();
      swift_unknownObjectRetain();
      uint64_t v11 = sub_98F8();
      uint64_t v13 = v12;
      swift_unknownObjectRelease();
      if (v13 | v11)
      {
        v15[0] = 0;
        v15[1] = 0;
        v15[2] = v11;
        v15[3] = v13;
      }
    }
  }
  swift_task_create();
  return swift_release();
}

uint64_t sub_3E98(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[3] = a5;
  v6[4] = a6;
  v6[2] = a4;
  sub_28E8(&qword_11828);
  v6[5] = swift_task_alloc();
  uint64_t v8 = (void *)swift_task_alloc();
  v6[6] = v8;
  void *v8 = v6;
  v8[1] = sub_3F78;
  v8[2] = a4;
  return _swift_task_switch(sub_6504, 0, 0);
}

uint64_t sub_3F78(uint64_t a1)
{
  uint64_t v4 = *v2;
  uint64_t v5 = *v2;
  swift_task_dealloc();
  if (v1)
  {
    swift_task_dealloc();
    uint64_t v6 = *(uint64_t (**)(void))(v5 + 8);
    return v6();
  }
  else
  {
    *(void *)(v4 + 56) = a1;
    return _swift_task_switch(sub_40CC, 0, 0);
  }
}

uint64_t sub_40CC()
{
  uint64_t v1 = *(void *)(v0 + 56);
  uint64_t v3 = *(void *)(v0 + 32);
  uint64_t v2 = *(void *)(v0 + 40);
  uint64_t v4 = sub_9918();
  long long v9 = *(_OWORD *)(v0 + 16);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56))(v2, 1, 1, v4);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = 0;
  *(void *)(v5 + 24) = 0;
  *(void *)(v5 + 32) = v1;
  *(_OWORD *)(v5 + 40) = v9;
  *(void *)(v5 + 56) = v3;
  swift_bridgeObjectRetain();
  id v6 = (id)v9;
  swift_retain();
  sub_2C98(v2, (uint64_t)&unk_11848, v5);
  swift_bridgeObjectRelease();
  swift_release();
  swift_task_dealloc();
  uint64_t v7 = *(uint64_t (**)(void))(v0 + 8);
  return v7();
}

uint64_t sub_42AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v7[6] = a6;
  v7[7] = a7;
  v7[4] = a4;
  v7[5] = a5;
  uint64_t v8 = sub_9848();
  v7[8] = v8;
  v7[9] = *(void *)(v8 - 8);
  v7[10] = swift_task_alloc();
  v7[11] = swift_task_alloc();
  v7[12] = swift_task_alloc();
  sub_28E8(&qword_11860);
  v7[13] = swift_task_alloc();
  v7[14] = swift_task_alloc();
  v7[15] = swift_task_alloc();
  v7[16] = swift_task_alloc();
  return _swift_task_switch(sub_43E4, 0, 0);
}

uint64_t sub_43E4()
{
  unint64_t v1 = v0[4];
  if (v1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_9A78();
    v0[17] = v2;
    if (v2)
    {
LABEL_3:
      if (v2 < 1)
      {
        __break(1u);
        goto LABEL_49;
      }
      uint64_t v3 = 0;
      uint64_t v4 = v0[4] + 32;
      do
      {
        if ((v1 & 0xC000000000000001) != 0) {
          id v5 = (id)sub_99E8();
        }
        else {
          id v5 = *(id *)(v4 + 8 * v3);
        }
        id v6 = v5;
        if ([v5 isFriendshipCurrentlyActive])
        {
          sub_9A08();
          sub_9A38();
          sub_9A48();
          sub_9A18();
        }
        else
        {
        }
        ++v3;
      }
      while (v2 != v3);
      swift_bridgeObjectRelease();
      v0[18] = _swiftEmptyArrayStorage;
      if (((unint64_t)_swiftEmptyArrayStorage & 0x8000000000000000) != 0) {
        goto LABEL_24;
      }
      goto LABEL_16;
    }
  }
  else
  {
    uint64_t v2 = *(void *)((char *)&dword_10 + (v1 & 0xFFFFFFFFFFFFFF8));
    swift_bridgeObjectRetain();
    v0[17] = v2;
    if (v2) {
      goto LABEL_3;
    }
  }
  swift_bridgeObjectRelease();
  v0[18] = _swiftEmptyArrayStorage;
  if (((unint64_t)_swiftEmptyArrayStorage & 0x8000000000000000) != 0) {
    goto LABEL_24;
  }
LABEL_16:
  if (((unint64_t)_swiftEmptyArrayStorage & 0x4000000000000000) == 0)
  {
    uint64_t v7 = _swiftEmptyArrayStorage[2];
    v0[19] = v7;
    if (!v7) {
      goto LABEL_25;
    }
LABEL_18:
    v0[20] = *(void *)(v0[5] + OBJC_IVAR____TtC25ActivityDigitalSeparation31ActivityDigitalSeparationSource_client);
    v0[21] = 0;
    uint64_t v8 = v0[18];
    if ((v8 & 0xC000000000000001) != 0) {
      id v9 = (id)sub_99E8();
    }
    else {
      id v9 = *(id *)(v8 + 32);
    }
    v0[22] = v9;
    v0[23] = 1;
    id v10 = [v9 UUID];
    uint64_t v11 = v0[16];
    if (v10)
    {
      uint64_t v12 = v10;
      uint64_t v13 = v0[12];
      uint64_t v14 = v0[8];
      int v15 = (void *)v0[9];
      sub_9838();

      v16 = (void (*)(uint64_t, uint64_t, uint64_t))v15[4];
      v0[24] = v16;
      v0[25] = (unint64_t)(v15 + 4) & 0xFFFFFFFFFFFFLL | 0x48D8000000000000;
      v16(v11, v13, v14);
      int v17 = (void (*)(uint64_t, void, uint64_t, uint64_t))v15[7];
      v0[26] = v17;
      v0[27] = (unint64_t)(v15 + 7) & 0xFFFFFFFFFFFFLL | 0xA0D1000000000000;
      v17(v11, 0, 1, v14);
      id v18 = (unsigned int (*)(uint64_t, uint64_t, uint64_t))v15[6];
      v0[28] = v18;
      v0[29] = (unint64_t)(v15 + 6) & 0xFFFFFFFFFFFFLL | 0x60F0000000000000;
      if (v18(v11, 1, v14) != 1)
      {
        uint64_t v19 = v0[16];
        uint64_t v20 = v0[8];
        uint64_t v21 = v0[9];
        uint64_t v22 = sub_9828();
        uint64_t v24 = v23;
        v0[33] = v23;
        uint64_t v25 = *(void (**)(uint64_t, uint64_t))(v21 + 8);
        v0[34] = v25;
        v0[35] = (v21 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
        v25(v19, v20);
        id v55 = (uint64_t (*)(uint64_t, uint64_t))((char *)&async function pointer to dispatch thunk of ActivitySharingClient.removeFriend(withUUID:)
                                                       + async function pointer to dispatch thunk of ActivitySharingClient.removeFriend(withUUID:));
        v26 = (void *)swift_task_alloc();
        v0[36] = v26;
        void *v26 = v0;
        v26[1] = sub_4AC4;
LABEL_45:
        return v55(v22, v24);
      }
      goto LABEL_55;
    }
LABEL_54:
    (*(void (**)(uint64_t, uint64_t, uint64_t, void))(v0[9] + 56))(v11, 1, 1, v0[8]);
LABEL_55:
    swift_errorRelease();
    __break(1u);
    goto LABEL_56;
  }
LABEL_24:
  swift_bridgeObjectRetain();
  uint64_t v27 = sub_9A78();
  swift_release();
  v0[19] = v27;
  if (v27) {
    goto LABEL_18;
  }
LABEL_25:
  uint64_t v11 = v0[17];
  swift_release();
  if (!v11) {
    goto LABEL_36;
  }
  if ((uint64_t)v0[17] < 1)
  {
    __break(1u);
    goto LABEL_54;
  }
  uint64_t v28 = v0[4];
  unint64_t v29 = v28 & 0xC000000000000001;
  uint64_t v30 = v28 + 32;
  swift_bridgeObjectRetain();
  uint64_t v31 = 0;
  do
  {
    if (v29) {
      id v32 = (id)sub_99E8();
    }
    else {
      id v32 = *(id *)(v30 + 8 * v31);
    }
    v33 = v32;
    if ([v32 hasInviteRequestFromMe])
    {
      sub_9A08();
      sub_9A38();
      sub_9A48();
      sub_9A18();
    }
    else
    {
    }
    ++v31;
  }
  while (v31 != v0[17]);
  swift_bridgeObjectRelease();
LABEL_36:
  v0[30] = _swiftEmptyArrayStorage;
  if (((unint64_t)_swiftEmptyArrayStorage & 0x8000000000000000) == 0
    && ((unint64_t)_swiftEmptyArrayStorage & 0x4000000000000000) == 0)
  {
    uint64_t v34 = _swiftEmptyArrayStorage[2];
    v0[31] = v34;
    if (v34) {
      goto LABEL_39;
    }
    goto LABEL_50;
  }
LABEL_49:
  swift_bridgeObjectRetain();
  uint64_t v52 = sub_9A78();
  swift_release();
  v0[31] = v52;
  if (v52)
  {
LABEL_39:
    v0[32] = *(void *)(v0[5] + OBJC_IVAR____TtC25ActivityDigitalSeparation31ActivityDigitalSeparationSource_client);
    v0[38] = 0;
    uint64_t v35 = v0[30];
    if ((v35 & 0xC000000000000001) != 0) {
      id v36 = (id)sub_99E8();
    }
    else {
      id v36 = *(id *)(v35 + 32);
    }
    v0[39] = v36;
    v0[40] = 1;
    id v37 = [v36 UUID];
    uint64_t v11 = v0[15];
    if (v37)
    {
      unint64_t v38 = v37;
      uint64_t v39 = v0[12];
      uint64_t v40 = v0[8];
      v41 = (void *)v0[9];
      sub_9838();

      id v42 = (void (*)(uint64_t, uint64_t, uint64_t))v41[4];
      v0[41] = v42;
      v0[42] = (unint64_t)(v41 + 4) & 0xFFFFFFFFFFFFLL | 0x48D8000000000000;
      v42(v11, v39, v40);
      v43 = (void (*)(uint64_t, void, uint64_t, uint64_t))v41[7];
      v0[43] = v43;
      v0[44] = (unint64_t)(v41 + 7) & 0xFFFFFFFFFFFFLL | 0xA0D1000000000000;
      v43(v11, 0, 1, v40);
      unint64_t v44 = (unsigned int (*)(uint64_t, uint64_t, uint64_t))v41[6];
      v0[45] = v44;
      v0[46] = (unint64_t)(v41 + 6) & 0xFFFFFFFFFFFFLL | 0x60F0000000000000;
      if (v44(v11, 1, v40) != 1)
      {
        uint64_t v45 = v0[15];
        uint64_t v46 = v0[8];
        uint64_t v47 = v0[9];
        uint64_t v22 = sub_9828();
        uint64_t v24 = v48;
        v0[47] = v48;
        uint64_t v49 = *(void (**)(uint64_t, uint64_t))(v47 + 8);
        v0[48] = v49;
        v0[49] = (v47 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
        v49(v45, v46);
        id v55 = (uint64_t (*)(uint64_t, uint64_t))((char *)&async function pointer to dispatch thunk of ActivitySharingClient.withdrawFriendInvite(to:)
                                                       + async function pointer to dispatch thunk of ActivitySharingClient.withdrawFriendInvite(to:));
        unint64_t v50 = (void *)swift_task_alloc();
        v0[50] = v50;
        *unint64_t v50 = v0;
        v50[1] = sub_51A4;
        goto LABEL_45;
      }
LABEL_57:
      uint64_t result = swift_errorRelease();
      __break(1u);
      return result;
    }
LABEL_56:
    (*(void (**)(uint64_t, uint64_t, uint64_t, void))(v0[9] + 56))(v11, 1, 1, v0[8]);
    goto LABEL_57;
  }
LABEL_50:
  v53 = (void (*)(void))v0[6];
  swift_release();
  v53(0);
  swift_errorRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  int v54 = (uint64_t (*)(void))v0[1];
  return v54();
}

uint64_t sub_4AC4()
{
  *(void *)(*(void *)v1 + 296) = v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  if (v0) {
    uint64_t v2 = sub_55C0;
  }
  else {
    uint64_t v2 = sub_4BF4;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_4BF4()
{
  uint64_t v1 = *(void *)(v0 + 168);
  uint64_t v2 = *(void *)(v0 + 184);
  uint64_t v3 = *(void *)(v0 + 144);
  if (v2 != *(void *)(v0 + 152))
  {
    if ((v3 & 0xC000000000000001) != 0) {
      id v12 = (id)sub_99E8();
    }
    else {
      id v12 = *(id *)(v3 + 8 * v2 + 32);
    }
    *(void *)(v0 + 176) = v12;
    *(void *)(v0 + 184) = v2 + 1;
    if (__OFADD__(v2, 1))
    {
      __break(1u);
      goto LABEL_33;
    }
    id v16 = [v12 UUID];
    id v5 = *(void **)(v0 + 128);
    if (v16)
    {
      int v17 = v16;
      uint64_t v18 = *(void *)(v0 + 96);
      uint64_t v19 = *(void *)(v0 + 64);
      uint64_t v20 = *(void **)(v0 + 72);
      sub_9838();

      uint64_t v21 = (void (*)(void *, uint64_t, uint64_t))v20[4];
      *(void *)(v0 + 192) = v21;
      *(void *)(v0 + 200) = (unint64_t)(v20 + 4) & 0xFFFFFFFFFFFFLL | 0x48D8000000000000;
      v21(v5, v18, v19);
      uint64_t v22 = (void (*)(void *, void, uint64_t, uint64_t))v20[7];
      *(void *)(v0 + 208) = v22;
      *(void *)(v0 + 216) = (unint64_t)(v20 + 7) & 0xFFFFFFFFFFFFLL | 0xA0D1000000000000;
      v22(v5, 0, 1, v19);
      uint64_t v23 = (unsigned int (*)(void *, uint64_t, uint64_t))v20[6];
      *(void *)(v0 + 224) = v23;
      *(void *)(v0 + 232) = (unint64_t)(v20 + 6) & 0xFFFFFFFFFFFFLL | 0x60F0000000000000;
      if (v23(v5, 1, v19) != 1)
      {
        uint64_t v24 = *(void *)(v0 + 128);
        uint64_t v25 = *(void *)(v0 + 64);
        uint64_t v26 = *(void *)(v0 + 72);
        uint64_t v27 = sub_9828();
        uint64_t v29 = v28;
        *(void *)(v0 + 264) = v28;
        uint64_t v30 = *(void (**)(uint64_t, uint64_t))(v26 + 8);
        *(void *)(v0 + 272) = v30;
        *(void *)(v0 + 280) = (v26 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
        v30(v24, v25);
        unint64_t v50 = (uint64_t (*)(uint64_t, uint64_t))((char *)&async function pointer to dispatch thunk of ActivitySharingClient.removeFriend(withUUID:)
                                                       + async function pointer to dispatch thunk of ActivitySharingClient.removeFriend(withUUID:));
        uint64_t v31 = (void *)swift_task_alloc();
        *(void *)(v0 + 288) = v31;
        *uint64_t v31 = v0;
        v31[1] = sub_4AC4;
LABEL_29:
        return v50(v27, v29);
      }
      goto LABEL_39;
    }
LABEL_38:
    (*(void (**)(void *, uint64_t, uint64_t, void))(*(void *)(v0 + 72) + 56))(v5, 1, 1, *(void *)(v0 + 64));
LABEL_39:
    swift_errorRelease();
    __break(1u);
    goto LABEL_40;
  }
  uint64_t v4 = *(void *)(v0 + 136);
  swift_release();
  id v5 = _swiftEmptyArrayStorage;
  if (!v4) {
    goto LABEL_15;
  }
  if (*(uint64_t *)(v0 + 136) < 1)
  {
    __break(1u);
    goto LABEL_38;
  }
  uint64_t v6 = *(void *)(v0 + 32);
  unint64_t v7 = v6 & 0xC000000000000001;
  uint64_t v8 = v6 + 32;
  swift_bridgeObjectRetain();
  uint64_t v9 = 0;
  do
  {
    if (v7) {
      id v10 = (id)sub_99E8();
    }
    else {
      id v10 = *(id *)(v8 + 8 * v9);
    }
    uint64_t v11 = v10;
    if ([v10 hasInviteRequestFromMe])
    {
      sub_9A08();
      sub_9A38();
      sub_9A48();
      sub_9A18();
    }
    else
    {
    }
    ++v9;
  }
  while (v9 != *(void *)(v0 + 136));
  swift_bridgeObjectRelease();
LABEL_15:
  *(void *)(v0 + 240) = _swiftEmptyArrayStorage;
  if (((unint64_t)_swiftEmptyArrayStorage & 0x8000000000000000) == 0
    && ((unint64_t)_swiftEmptyArrayStorage & 0x4000000000000000) == 0)
  {
    uint64_t v13 = _swiftEmptyArrayStorage[2];
    *(void *)(v0 + 248) = v13;
    if (v13) {
      goto LABEL_18;
    }
    goto LABEL_34;
  }
LABEL_33:
  swift_bridgeObjectRetain();
  uint64_t v47 = sub_9A78();
  swift_release();
  *(void *)(v0 + 248) = v47;
  if (v47)
  {
LABEL_18:
    *(void *)(v0 + 256) = *(void *)(*(void *)(v0 + 40)
                                      + OBJC_IVAR____TtC25ActivityDigitalSeparation31ActivityDigitalSeparationSource_client);
    *(void *)(v0 + 304) = v1;
    uint64_t v14 = *(void *)(v0 + 240);
    if ((v14 & 0xC000000000000001) != 0) {
      id v15 = (id)sub_99E8();
    }
    else {
      id v15 = *(id *)(v14 + 32);
    }
    *(void *)(v0 + 312) = v15;
    *(void *)(v0 + 320) = 1;
    id v32 = [v15 UUID];
    id v5 = *(void **)(v0 + 120);
    if (v32)
    {
      v33 = v32;
      uint64_t v34 = *(void *)(v0 + 96);
      uint64_t v35 = *(void *)(v0 + 64);
      id v36 = *(void **)(v0 + 72);
      sub_9838();

      id v37 = (void (*)(void *, uint64_t, uint64_t))v36[4];
      *(void *)(v0 + 328) = v37;
      *(void *)(v0 + 336) = (unint64_t)(v36 + 4) & 0xFFFFFFFFFFFFLL | 0x48D8000000000000;
      v37(v5, v34, v35);
      unint64_t v38 = (void (*)(void *, void, uint64_t, uint64_t))v36[7];
      *(void *)(v0 + 344) = v38;
      *(void *)(v0 + 352) = (unint64_t)(v36 + 7) & 0xFFFFFFFFFFFFLL | 0xA0D1000000000000;
      v38(v5, 0, 1, v35);
      uint64_t v39 = (unsigned int (*)(void *, uint64_t, uint64_t))v36[6];
      *(void *)(v0 + 360) = v39;
      *(void *)(v0 + 368) = (unint64_t)(v36 + 6) & 0xFFFFFFFFFFFFLL | 0x60F0000000000000;
      if (v39(v5, 1, v35) != 1)
      {
        uint64_t v40 = *(void *)(v0 + 120);
        uint64_t v41 = *(void *)(v0 + 64);
        uint64_t v42 = *(void *)(v0 + 72);
        uint64_t v27 = sub_9828();
        uint64_t v29 = v43;
        *(void *)(v0 + 376) = v43;
        unint64_t v44 = *(void (**)(uint64_t, uint64_t))(v42 + 8);
        *(void *)(v0 + 384) = v44;
        *(void *)(v0 + 392) = (v42 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
        v44(v40, v41);
        unint64_t v50 = (uint64_t (*)(uint64_t, uint64_t))((char *)&async function pointer to dispatch thunk of ActivitySharingClient.withdrawFriendInvite(to:)
                                                       + async function pointer to dispatch thunk of ActivitySharingClient.withdrawFriendInvite(to:));
        uint64_t v45 = (void *)swift_task_alloc();
        *(void *)(v0 + 400) = v45;
        *uint64_t v45 = v0;
        v45[1] = sub_51A4;
        goto LABEL_29;
      }
LABEL_41:
      uint64_t result = swift_errorRelease();
      __break(1u);
      return result;
    }
LABEL_40:
    (*(void (**)(void *, uint64_t, uint64_t, void))(*(void *)(v0 + 72) + 56))(v5, 1, 1, *(void *)(v0 + 64));
    goto LABEL_41;
  }
LABEL_34:
  uint64_t v48 = *(void (**)(uint64_t))(v0 + 48);
  swift_release();
  v48(v1);
  swift_errorRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v49 = *(uint64_t (**)(void))(v0 + 8);
  return v49();
}

uint64_t sub_51A4()
{
  *(void *)(*(void *)v1 + 408) = v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  if (v0) {
    uint64_t v2 = sub_5EB4;
  }
  else {
    uint64_t v2 = sub_52D4;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_52D4()
{
  uint64_t v1 = *(void *)(v0 + 304);
  uint64_t v2 = *(void *)(v0 + 320);
  uint64_t v3 = *(void *)(v0 + 240);
  if (v2 == *(void *)(v0 + 248))
  {
    uint64_t v4 = *(void (**)(uint64_t))(v0 + 48);
    swift_release();
    v4(v1);
    swift_errorRelease();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    id v5 = *(uint64_t (**)(void))(v0 + 8);
    return v5();
  }
  if ((v3 & 0xC000000000000001) != 0) {
    id v7 = (id)sub_99E8();
  }
  else {
    id v7 = *(id *)(v3 + 8 * v2 + 32);
  }
  *(void *)(v0 + 312) = v7;
  *(void *)(v0 + 320) = v2 + 1;
  if (__OFADD__(v2, 1))
  {
    __break(1u);
    goto LABEL_15;
  }
  id v8 = [v7 UUID];
  uint64_t v2 = *(void *)(v0 + 120);
  if (!v8)
  {
LABEL_15:
    (*(void (**)(uint64_t, uint64_t, uint64_t, void))(*(void *)(v0 + 72) + 56))(v2, 1, 1, *(void *)(v0 + 64));
    goto LABEL_16;
  }
  uint64_t v9 = v8;
  uint64_t v10 = *(void *)(v0 + 96);
  uint64_t v11 = *(void *)(v0 + 64);
  id v12 = *(void **)(v0 + 72);
  sub_9838();

  uint64_t v13 = (void (*)(uint64_t, uint64_t, uint64_t))v12[4];
  *(void *)(v0 + 328) = v13;
  *(void *)(v0 + 336) = (unint64_t)(v12 + 4) & 0xFFFFFFFFFFFFLL | 0x48D8000000000000;
  v13(v2, v10, v11);
  uint64_t v14 = (void (*)(uint64_t, void, uint64_t, uint64_t))v12[7];
  *(void *)(v0 + 344) = v14;
  *(void *)(v0 + 352) = (unint64_t)(v12 + 7) & 0xFFFFFFFFFFFFLL | 0xA0D1000000000000;
  v14(v2, 0, 1, v11);
  id v15 = (unsigned int (*)(uint64_t, uint64_t, uint64_t))v12[6];
  *(void *)(v0 + 360) = v15;
  *(void *)(v0 + 368) = (unint64_t)(v12 + 6) & 0xFFFFFFFFFFFFLL | 0x60F0000000000000;
  if (v15(v2, 1, v11) == 1)
  {
LABEL_16:
    uint64_t result = swift_errorRelease();
    __break(1u);
    return result;
  }
  uint64_t v16 = *(void *)(v0 + 120);
  uint64_t v17 = *(void *)(v0 + 64);
  uint64_t v18 = *(void *)(v0 + 72);
  uint64_t v19 = sub_9828();
  uint64_t v21 = v20;
  *(void *)(v0 + 376) = v20;
  uint64_t v22 = *(void (**)(uint64_t, uint64_t))(v18 + 8);
  *(void *)(v0 + 384) = v22;
  *(void *)(v0 + 392) = (v18 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v22(v16, v17);
  uint64_t v24 = (uint64_t (*)(uint64_t, uint64_t))((char *)&async function pointer to dispatch thunk of ActivitySharingClient.withdrawFriendInvite(to:)
                                                 + async function pointer to dispatch thunk of ActivitySharingClient.withdrawFriendInvite(to:));
  uint64_t v23 = (void *)swift_task_alloc();
  *(void *)(v0 + 400) = v23;
  void *v23 = v0;
  v23[1] = sub_51A4;
  return v24(v19, v21);
}

uint64_t sub_55C0()
{
  sub_7F24();
  uint64_t v1 = swift_allocError();
  *uint64_t v2 = 2;
  swift_errorRelease();
  os_log_type_t v3 = sub_9948();
  uint64_t v4 = (void *)ASLogDefault;
  if (!ASLogDefault) {
    goto LABEL_44;
  }
  os_log_type_t v5 = v3;
  BOOL v6 = os_log_type_enabled(ASLogDefault, v3);
  id v7 = (void *)v0[22];
  if (v6)
  {
    os_log_type_t v81 = v5;
    uint64_t v83 = v1;
    id v8 = v7;
    swift_errorRetain();
    id v9 = v8;
    swift_errorRetain();
    log = v4;
    uint64_t v10 = (_DWORD *)swift_slowAlloc();
    v79 = (void *)swift_slowAlloc();
    v0[3] = swift_slowAlloc();
    v80 = v10;
    *uint64_t v10 = 136315394;
    id v11 = [v9 UUID];
    if (!v11)
    {
LABEL_45:
      v75 = (void (*)(uint64_t, uint64_t, uint64_t, void *))v0[26];
      v76 = (void *)v0[22];
      uint64_t v77 = v0[14];
      uint64_t v0 = (void *)v0[8];
      swift_errorRelease();

      v75(v77, 1, 1, v0);
      __break(1u);
      goto LABEL_46;
    }
    id v12 = v11;
    uint64_t v13 = (unsigned int (*)(uint64_t, uint64_t, uint64_t))v0[28];
    uint64_t v78 = v0[29];
    uint64_t v14 = (void (*)(uint64_t, void, uint64_t, uint64_t))v0[26];
    id v15 = (void (*)(uint64_t, uint64_t, uint64_t))v0[24];
    uint64_t v16 = v0[14];
    uint64_t v17 = v0[12];
    uint64_t v18 = v0[8];
    sub_9838();

    v15(v16, v17, v18);
    v14(v16, 0, 1, v18);
    if (v13(v16, 1, v18) == 1)
    {
LABEL_46:
      uint64_t v41 = (void *)v0[22];
      swift_errorRelease();

      __break(1u);
      goto LABEL_47;
    }
    uint64_t v19 = (void (*)(uint64_t, uint64_t))v0[34];
    uint64_t v20 = (void *)v0[22];
    uint64_t v21 = v0[11];
    uint64_t v22 = v0[8];
    ((void (*)(uint64_t, void, uint64_t))v0[24])(v21, v0[14], v22);
    sub_7F78(&qword_11870, (void (*)(uint64_t))&type metadata accessor for UUID);
    uint64_t v23 = sub_9AA8();
    unint64_t v25 = v24;
    v19(v21, v22);
    *(void *)(v80 + 1) = sub_6B04(v23, v25, v0 + 3);
    swift_bridgeObjectRelease();

    *((_WORD *)v80 + 6) = 2112;
    swift_errorRetain();
    uint64_t v26 = _swift_stdlib_bridgeErrorToNSError();
    *(void *)((char *)v80 + 14) = v26;
    void *v79 = v26;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl(&dword_0, log, v81, "Removing friend %s failed with error: %@", (uint8_t *)v80, 0x16u);
    sub_28E8(&qword_11878);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    swift_errorRelease();
    uint64_t v1 = v83;
  }
  else
  {

    swift_errorRelease();
  }
  uint64_t v27 = v0[23];
  if (v27 != v0[19])
  {
    v0[21] = v1;
    uint64_t v35 = v0[18];
    if ((v35 & 0xC000000000000001) != 0) {
      id v36 = (id)sub_99E8();
    }
    else {
      id v36 = *(id *)(v35 + 8 * v27 + 32);
    }
    v0[22] = v36;
    v0[23] = v27 + 1;
    if (__OFADD__(v27, 1))
    {
      __break(1u);
      goto LABEL_39;
    }
    id v40 = [v36 UUID];
    uint64_t v41 = (void *)v0[16];
    if (v40)
    {
      uint64_t v42 = v40;
      uint64_t v43 = v0[12];
      uint64_t v45 = v0[8];
      unint64_t v44 = (void *)v0[9];
      sub_9838();

      uint64_t v46 = (void (*)(void *, uint64_t, uint64_t))v44[4];
      v0[24] = v46;
      v0[25] = (unint64_t)(v44 + 4) & 0xFFFFFFFFFFFFLL | 0x48D8000000000000;
      v46(v41, v43, v45);
      uint64_t v47 = (void (*)(void *, void, uint64_t, uint64_t))v44[7];
      v0[26] = v47;
      v0[27] = (unint64_t)(v44 + 7) & 0xFFFFFFFFFFFFLL | 0xA0D1000000000000;
      v47(v41, 0, 1, v45);
      uint64_t v48 = (unsigned int (*)(void *, uint64_t, uint64_t))v44[6];
      v0[28] = v48;
      v0[29] = (unint64_t)(v44 + 6) & 0xFFFFFFFFFFFFLL | 0x60F0000000000000;
      if (v48(v41, 1, v45) != 1)
      {
        uint64_t v49 = v0[16];
        uint64_t v50 = v0[8];
        uint64_t v51 = v0[9];
        uint64_t v52 = sub_9828();
        uint64_t v54 = v53;
        v0[33] = v53;
        id v55 = *(void (**)(uint64_t, uint64_t))(v51 + 8);
        v0[34] = v55;
        v0[35] = (v51 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
        v55(v49, v50);
        v84 = (uint64_t (*)(uint64_t, uint64_t))((char *)&async function pointer to dispatch thunk of ActivitySharingClient.removeFriend(withUUID:)
                                                       + async function pointer to dispatch thunk of ActivitySharingClient.removeFriend(withUUID:));
        uint64_t v56 = (void *)swift_task_alloc();
        v0[36] = v56;
        void *v56 = v0;
        v56[1] = sub_4AC4;
LABEL_35:
        return v84(v52, v54);
      }
      goto LABEL_48;
    }
LABEL_47:
    (*(void (**)(void *, uint64_t, uint64_t, void))(v0[9] + 56))(v41, 1, 1, v0[8]);
LABEL_48:
    swift_errorRelease();
    __break(1u);
    goto LABEL_49;
  }
  uint64_t v28 = v0[17];
  swift_release();
  if (!v28) {
    goto LABEL_21;
  }
  if ((uint64_t)v0[17] < 1)
  {
    __break(1u);
LABEL_44:
    swift_errorRelease();
    __break(1u);
    goto LABEL_45;
  }
  uint64_t v29 = v0[4];
  unint64_t v30 = v29 & 0xC000000000000001;
  uint64_t v31 = v29 + 32;
  swift_bridgeObjectRetain();
  uint64_t v32 = 0;
  do
  {
    if (v30) {
      id v33 = (id)sub_99E8();
    }
    else {
      id v33 = *(id *)(v31 + 8 * v32);
    }
    uint64_t v34 = v33;
    if (objc_msgSend(v33, "hasInviteRequestFromMe", v78))
    {
      sub_9A08();
      sub_9A38();
      sub_9A48();
      sub_9A18();
    }
    else
    {
    }
    ++v32;
  }
  while (v32 != v0[17]);
  swift_bridgeObjectRelease();
LABEL_21:
  v0[30] = _swiftEmptyArrayStorage;
  if (((unint64_t)_swiftEmptyArrayStorage & 0x8000000000000000) == 0
    && ((unint64_t)_swiftEmptyArrayStorage & 0x4000000000000000) == 0)
  {
    uint64_t v37 = _swiftEmptyArrayStorage[2];
    v0[31] = v37;
    if (v37) {
      goto LABEL_24;
    }
    goto LABEL_40;
  }
LABEL_39:
  swift_bridgeObjectRetain();
  uint64_t v72 = sub_9A78();
  swift_release();
  v0[31] = v72;
  if (v72)
  {
LABEL_24:
    v0[32] = *(void *)(v0[5] + OBJC_IVAR____TtC25ActivityDigitalSeparation31ActivityDigitalSeparationSource_client);
    v0[38] = v1;
    uint64_t v38 = v0[30];
    if ((v38 & 0xC000000000000001) != 0) {
      id v39 = (id)sub_99E8();
    }
    else {
      id v39 = *(id *)(v38 + 32);
    }
    v0[39] = v39;
    v0[40] = 1;
    id v57 = objc_msgSend(v39, "UUID", v78);
    uint64_t v41 = (void *)v0[15];
    if (v57)
    {
      uint64_t v58 = v57;
      uint64_t v59 = v0[12];
      uint64_t v61 = v0[8];
      uint64_t v60 = (void *)v0[9];
      sub_9838();

      uint64_t v62 = (void (*)(void *, uint64_t, uint64_t))v60[4];
      v0[41] = v62;
      v0[42] = (unint64_t)(v60 + 4) & 0xFFFFFFFFFFFFLL | 0x48D8000000000000;
      v62(v41, v59, v61);
      v63 = (void (*)(void *, void, uint64_t, uint64_t))v60[7];
      v0[43] = v63;
      v0[44] = (unint64_t)(v60 + 7) & 0xFFFFFFFFFFFFLL | 0xA0D1000000000000;
      v63(v41, 0, 1, v61);
      v64 = (unsigned int (*)(void *, uint64_t, uint64_t))v60[6];
      v0[45] = v64;
      v0[46] = (unint64_t)(v60 + 6) & 0xFFFFFFFFFFFFLL | 0x60F0000000000000;
      if (v64(v41, 1, v61) != 1)
      {
        uint64_t v65 = v0[15];
        uint64_t v66 = v0[8];
        uint64_t v67 = v0[9];
        uint64_t v52 = sub_9828();
        uint64_t v54 = v68;
        v0[47] = v68;
        v69 = *(void (**)(uint64_t, uint64_t))(v67 + 8);
        v0[48] = v69;
        v0[49] = (v67 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
        v69(v65, v66);
        v84 = (uint64_t (*)(uint64_t, uint64_t))((char *)&async function pointer to dispatch thunk of ActivitySharingClient.withdrawFriendInvite(to:)
                                                       + async function pointer to dispatch thunk of ActivitySharingClient.withdrawFriendInvite(to:));
        v70 = (void *)swift_task_alloc();
        v0[50] = v70;
        void *v70 = v0;
        v70[1] = sub_51A4;
        goto LABEL_35;
      }
LABEL_50:
      uint64_t result = swift_errorRelease();
      __break(1u);
      return result;
    }
LABEL_49:
    (*(void (**)(void *, uint64_t, uint64_t, void))(v0[9] + 56))(v41, 1, 1, v0[8]);
    goto LABEL_50;
  }
LABEL_40:
  v73 = (void (*)(uint64_t))v0[6];
  swift_release();
  v73(v1);
  swift_errorRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  v74 = (uint64_t (*)(void))v0[1];
  return v74();
}

uint64_t sub_5EB4()
{
  sub_7F24();
  uint64_t v1 = swift_allocError();
  *uint64_t v2 = 2;
  swift_errorRelease();
  os_log_type_t v3 = sub_9948();
  uint64_t v4 = (void *)ASLogDefault;
  if (!ASLogDefault) {
    goto LABEL_21;
  }
  os_log_type_t v5 = v3;
  BOOL v6 = os_log_type_enabled(ASLogDefault, v3);
  id v7 = (void *)v0[39];
  if (v6)
  {
    os_log_type_t v55 = v5;
    uint64_t v57 = v1;
    id v8 = v7;
    swift_errorRetain();
    id v9 = v8;
    swift_errorRetain();
    log = v4;
    uint64_t v10 = (_DWORD *)swift_slowAlloc();
    uint64_t v53 = (void *)swift_slowAlloc();
    v0[2] = swift_slowAlloc();
    uint64_t v54 = v10;
    *uint64_t v10 = 136315394;
    id v11 = [v9 UUID];
    if (!v11)
    {
LABEL_22:
      uint64_t v50 = (void (*)(uint64_t, uint64_t, uint64_t, void *))v0[43];
      uint64_t v51 = (void *)v0[39];
      uint64_t v52 = v0[13];
      uint64_t v0 = (void *)v0[8];
      swift_errorRelease();

      v50(v52, 1, 1, v0);
      __break(1u);
      goto LABEL_23;
    }
    id v12 = v11;
    uint64_t v13 = (unsigned int (*)(uint64_t, uint64_t, uint64_t))v0[45];
    uint64_t v14 = (void (*)(uint64_t, void, uint64_t, uint64_t))v0[43];
    id v15 = (void (*)(uint64_t, uint64_t, uint64_t))v0[41];
    uint64_t v16 = v0[12];
    uint64_t v17 = v0[13];
    uint64_t v18 = v0[8];
    sub_9838();

    v15(v17, v16, v18);
    v14(v17, 0, 1, v18);
    if (v13(v17, 1, v18) == 1)
    {
LABEL_23:
      uint64_t v34 = (void *)v0[39];
      swift_errorRelease();

      __break(1u);
      goto LABEL_24;
    }
    uint64_t v19 = (void (*)(uint64_t, uint64_t))v0[48];
    uint64_t v20 = (void *)v0[39];
    uint64_t v21 = v0[10];
    uint64_t v22 = v0[8];
    ((void (*)(uint64_t, void, uint64_t))v0[41])(v21, v0[13], v22);
    sub_7F78(&qword_11870, (void (*)(uint64_t))&type metadata accessor for UUID);
    uint64_t v23 = sub_9AA8();
    unint64_t v25 = v24;
    v19(v21, v22);
    *(void *)(v54 + 1) = sub_6B04(v23, v25, v0 + 2);
    swift_bridgeObjectRelease();

    *((_WORD *)v54 + 6) = 2112;
    swift_errorRetain();
    uint64_t v26 = _swift_stdlib_bridgeErrorToNSError();
    *(void *)((char *)v54 + 14) = v26;
    void *v53 = v26;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl(&dword_0, log, v55, "Withdrawing invite to friend %s failed with error: %@", (uint8_t *)v54, 0x16u);
    sub_28E8(&qword_11878);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    swift_errorRelease();
    uint64_t v1 = v57;
  }
  else
  {

    swift_errorRelease();
  }
  uint64_t v27 = v0[40];
  if (v27 == v0[31])
  {
    uint64_t v28 = (void (*)(uint64_t))v0[6];
    swift_release();
    v28(v1);
    swift_errorRelease();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v29 = (uint64_t (*)(void))v0[1];
    return v29();
  }
  v0[38] = v1;
  uint64_t v31 = v0[30];
  if ((v31 & 0xC000000000000001) != 0) {
    id v32 = (id)sub_99E8();
  }
  else {
    id v32 = *(id *)(v31 + 8 * v27 + 32);
  }
  v0[39] = v32;
  v0[40] = v27 + 1;
  if (__OFADD__(v27, 1))
  {
    __break(1u);
LABEL_21:
    swift_errorRelease();
    __break(1u);
    goto LABEL_22;
  }
  id v33 = [v32 UUID];
  uint64_t v34 = (void *)v0[15];
  if (!v33)
  {
LABEL_24:
    (*(void (**)(void *, uint64_t, uint64_t, void))(v0[9] + 56))(v34, 1, 1, v0[8]);
    goto LABEL_25;
  }
  uint64_t v35 = v33;
  uint64_t v36 = v0[12];
  uint64_t v38 = v0[8];
  uint64_t v37 = (void *)v0[9];
  sub_9838();

  id v39 = (void (*)(void *, uint64_t, uint64_t))v37[4];
  v0[41] = v39;
  v0[42] = (unint64_t)(v37 + 4) & 0xFFFFFFFFFFFFLL | 0x48D8000000000000;
  v39(v34, v36, v38);
  id v40 = (void (*)(void *, void, uint64_t, uint64_t))v37[7];
  v0[43] = v40;
  v0[44] = (unint64_t)(v37 + 7) & 0xFFFFFFFFFFFFLL | 0xA0D1000000000000;
  v40(v34, 0, 1, v38);
  uint64_t v41 = (unsigned int (*)(void *, uint64_t, uint64_t))v37[6];
  v0[45] = v41;
  v0[46] = (unint64_t)(v37 + 6) & 0xFFFFFFFFFFFFLL | 0x60F0000000000000;
  if (v41(v34, 1, v38) == 1)
  {
LABEL_25:
    uint64_t result = swift_errorRelease();
    __break(1u);
    return result;
  }
  uint64_t v42 = v0[15];
  uint64_t v43 = v0[8];
  uint64_t v44 = v0[9];
  uint64_t v45 = sub_9828();
  uint64_t v47 = v46;
  v0[47] = v46;
  uint64_t v48 = *(void (**)(uint64_t, uint64_t))(v44 + 8);
  v0[48] = v48;
  v0[49] = (v44 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v48(v42, v43);
  uint64_t v58 = (uint64_t (*)(uint64_t, uint64_t))((char *)&async function pointer to dispatch thunk of ActivitySharingClient.withdrawFriendInvite(to:)
                                                 + async function pointer to dispatch thunk of ActivitySharingClient.withdrawFriendInvite(to:));
  uint64_t v49 = (void *)swift_task_alloc();
  v0[50] = v49;
  *uint64_t v49 = v0;
  v49[1] = sub_51A4;
  return v58(v45, v47);
}

uint64_t sub_64E4()
{
  *(void *)(v1 + 16) = v0;
  return _swift_task_switch(sub_6504, 0, 0);
}

uint64_t sub_6504()
{
  os_log_type_t v3 = (uint64_t (*)(void))((char *)&async function pointer to dispatch thunk of ActivitySharingClient.allFriends()
                         + async function pointer to dispatch thunk of ActivitySharingClient.allFriends());
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 24) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_65B4;
  return v3();
}

uint64_t sub_65B4(uint64_t a1)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 32) = a1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v4 = *(uint64_t (**)(void))(v3 + 8);
    return v4();
  }
  else
  {
    return _swift_task_switch(sub_66E8, 0, 0);
  }
}

uint64_t sub_66E8()
{
  uint64_t v1 = *(void **)(v0 + 32);
  if (!v1)
  {
    if (((unint64_t)&_swiftEmptyArrayStorage & 0xC000000000000000) != 0 && sub_9A78())
    {
      sub_77F8((unint64_t)&_swiftEmptyArrayStorage);
      uint64_t v1 = v5;
    }
    else
    {
      uint64_t v1 = &_swiftEmptySetSingleton;
    }
  }
  uint64_t v2 = sub_715C((uint64_t)v1);
  swift_bridgeObjectRelease();
  uint64_t v3 = *(uint64_t (**)(void *))(v0 + 8);
  return v3(v2);
}

id sub_67A0()
{
  v2.unint64_t receiver = v0;
  v2.super_class = (Class)type metadata accessor for ActivityDigitalSeparationSource();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for ActivityDigitalSeparationSource()
{
  return self;
}

id sub_6854(uint64_t a1, uint64_t a2, char a3)
{
  NSString v5 = sub_9878();
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
    sub_9818();

    swift_willThrow();
  }
  return v6;
}

uint64_t sub_6930(uint64_t a1, int *a2)
{
  id v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_6A0C;
  return v6(a1);
}

uint64_t sub_6A0C()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_6B04(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_6BD8(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_8010((uint64_t)v12, *a3);
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
      sub_8010((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_7FC0((uint64_t)v12);
  return v7;
}

uint64_t sub_6BD8(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_9988();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_6D94(a5, a6);
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
  uint64_t v8 = sub_99F8();
  if (!v8)
  {
    sub_9A58();
    __break(1u);
LABEL_17:
    uint64_t result = sub_9A88();
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

uint64_t sub_6D94(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_6E2C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_700C(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_700C(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_6E2C(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_6FA4(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_99D8();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_9A58();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_98C8();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_9A88();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_9A58();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_6FA4(uint64_t a1, uint64_t a2)
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
  sub_28E8(&qword_11880);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_700C(char a1, int64_t a2, char a3, char *a4)
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
    sub_28E8(&qword_11880);
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
  uint64_t result = sub_9A88();
  __break(1u);
  return result;
}

void *sub_715C(uint64_t a1)
{
  if ((a1 & 0xC000000000000001) != 0)
  {
    uint64_t v2 = sub_99A8();
    if (v2) {
      goto LABEL_3;
    }
    return &_swiftEmptyArrayStorage;
  }
  uint64_t v2 = *(void *)(a1 + 16);
  if (!v2) {
    return &_swiftEmptyArrayStorage;
  }
LABEL_3:
  if (v2 <= 0)
  {
    unint64_t v3 = &_swiftEmptyArrayStorage;
  }
  else
  {
    sub_28E8(&qword_11818);
    unint64_t v3 = (void *)swift_allocObject();
    int64_t v4 = j__malloc_size(v3);
    uint64_t v5 = v4 - 32;
    if (v4 < 32) {
      uint64_t v5 = v4 - 25;
    }
    v3[2] = v2;
    v3[3] = (2 * (v5 >> 3)) | 1;
  }
  swift_bridgeObjectRetain();
  unint64_t v6 = sub_7258(&v8, v3 + 4, v2, a1);
  uint64_t result = (void *)sub_7B90();
  if (v6 == (void *)v2) {
    return v3;
  }
  __break(1u);
  return result;
}

void *sub_7258(void *result, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a4;
  unint64_t v6 = a2;
  int64_t v7 = result;
  if ((a4 & 0xC000000000000001) != 0)
  {
    sub_9998();
    sub_7B50();
    sub_7F78(&qword_11820, (void (*)(uint64_t))sub_7B50);
    uint64_t result = (void *)sub_9938();
    uint64_t v4 = v27;
    uint64_t v8 = v28;
    uint64_t v9 = v29;
    int64_t v10 = v30;
    unint64_t v11 = v31;
    unint64_t v24 = v7;
    if (v6) {
      goto LABEL_3;
    }
LABEL_36:
    uint64_t v12 = 0;
LABEL_46:
    *unint64_t v24 = v4;
    v24[1] = v8;
    v24[2] = v9;
    v24[3] = v10;
    v24[4] = v11;
    return (void *)v12;
  }
  int64_t v10 = 0;
  uint64_t v20 = -1 << *(unsigned char *)(a4 + 32);
  uint64_t v8 = a4 + 56;
  uint64_t v9 = ~v20;
  uint64_t v21 = -v20;
  if (v21 < 64) {
    uint64_t v22 = ~(-1 << v21);
  }
  else {
    uint64_t v22 = -1;
  }
  unint64_t v11 = v22 & *(void *)(a4 + 56);
  unint64_t v24 = result;
  if (!a2) {
    goto LABEL_36;
  }
LABEL_3:
  if (!a3)
  {
    uint64_t v12 = 0;
    goto LABEL_46;
  }
  if (a3 < 0) {
    goto LABEL_48;
  }
  uint64_t v12 = 0;
  int64_t v25 = (unint64_t)(v9 + 64) >> 6;
  uint64_t v23 = v9;
  while (1)
  {
    if (v4 < 0)
    {
      if (!sub_99B8()) {
        goto LABEL_45;
      }
      sub_7B50();
      swift_unknownObjectRetain();
      swift_dynamicCast();
      id v15 = v26;
      uint64_t result = (void *)swift_unknownObjectRelease();
      if (!v26) {
        goto LABEL_45;
      }
      goto LABEL_8;
    }
    if (v11)
    {
      unint64_t v13 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      unint64_t v14 = v13 | (v10 << 6);
      goto LABEL_7;
    }
    int64_t v16 = v10 + 1;
    if (__OFADD__(v10, 1)) {
      break;
    }
    if (v16 >= v25)
    {
      unint64_t v11 = 0;
      goto LABEL_45;
    }
    unint64_t v17 = *(void *)(v8 + 8 * v16);
    if (v17) {
      goto LABEL_23;
    }
    int64_t v18 = v10 + 2;
    if (v10 + 2 >= v25)
    {
      unint64_t v11 = 0;
      ++v10;
      goto LABEL_45;
    }
    unint64_t v17 = *(void *)(v8 + 8 * v18);
    if (!v17)
    {
      if (v10 + 3 >= v25) {
        goto LABEL_42;
      }
      unint64_t v17 = *(void *)(v8 + 8 * (v10 + 3));
      if (v17)
      {
        int64_t v16 = v10 + 3;
        goto LABEL_23;
      }
      int64_t v18 = v10 + 4;
      if (v10 + 4 >= v25)
      {
        unint64_t v11 = 0;
        v10 += 3;
        goto LABEL_45;
      }
      unint64_t v17 = *(void *)(v8 + 8 * v18);
      if (!v17)
      {
        int64_t v16 = v10 + 5;
        if (v10 + 5 >= v25)
        {
LABEL_42:
          unint64_t v11 = 0;
          int64_t v10 = v18;
          goto LABEL_45;
        }
        unint64_t v17 = *(void *)(v8 + 8 * v16);
        if (!v17)
        {
          int64_t v19 = v10 + 6;
          while (v25 != v19)
          {
            unint64_t v17 = *(void *)(v8 + 8 * v19++);
            if (v17)
            {
              int64_t v16 = v19 - 1;
              goto LABEL_23;
            }
          }
          unint64_t v11 = 0;
          int64_t v10 = v25 - 1;
          goto LABEL_45;
        }
        goto LABEL_23;
      }
    }
    int64_t v16 = v18;
LABEL_23:
    unint64_t v11 = (v17 - 1) & v17;
    unint64_t v14 = __clz(__rbit64(v17)) + (v16 << 6);
    int64_t v10 = v16;
LABEL_7:
    uint64_t result = *(id *)(*(void *)(v4 + 48) + 8 * v14);
    id v15 = result;
    if (!result) {
      goto LABEL_45;
    }
LABEL_8:
    ++v12;
    *v6++ = v15;
    if (v12 == a3)
    {
      uint64_t v12 = a3;
LABEL_45:
      uint64_t v9 = v23;
      goto LABEL_46;
    }
  }
  __break(1u);
LABEL_48:
  __break(1u);
  return result;
}

uint64_t sub_7574(void *a1, void (**a2)(void, void, void))
{
  sub_28E8(&qword_11828);
  __chkstk_darwin();
  uint64_t v5 = (char *)&v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = a2;
  id v7 = objc_allocWithZone((Class)LSApplicationRecord);
  _Block_copy(a2);
  id v8 = sub_6854(0xD000000000000011, 0x800000000000A450, 0);
  unint64_t v13 = v8;
  if (v8
    && (id v14 = [v8 applicationState],
        unsigned __int8 v15 = [v14 isInstalled],
        v13,
        v14,
        (v15 & 1) != 0))
  {
    uint64_t v16 = sub_9918();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v5, 1, 1, v16);
    unint64_t v17 = (void *)swift_allocObject();
    v17[2] = 0;
    v17[3] = 0;
    v17[4] = a1;
    v17[5] = sub_88EC;
    v17[6] = v6;
    id v18 = a1;
    swift_retain();
    sub_2C98((uint64_t)v5, (uint64_t)&unk_118A8, (uint64_t)v17);
    swift_release();
    return swift_release();
  }
  else
  {
    sub_7F24();
    swift_allocError();
    *uint64_t v9 = 0;
    sub_28E8(&qword_11898);
    Class isa = sub_98D8().super.isa;
    unint64_t v11 = (void *)sub_9808();
    ((void (**)(void, Class, void *))a2)[2](a2, isa, v11);

    swift_errorRelease();
    return swift_release();
  }
}

void sub_77F8(unint64_t a1)
{
  unint64_t v2 = a1 >> 62;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v6 = sub_9A78();
    swift_bridgeObjectRelease();
    if (v6)
    {
LABEL_3:
      sub_28E8(&qword_11808);
      unint64_t v3 = (void *)sub_99C8();
      uint64_t v4 = a1 & 0xFFFFFFFFFFFFFF8;
      if (!v2) {
        goto LABEL_4;
      }
LABEL_8:
      swift_bridgeObjectRetain();
      uint64_t v5 = sub_9A78();
      swift_bridgeObjectRelease();
      if (!v5) {
        return;
      }
      goto LABEL_9;
    }
  }
  else if (*(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8)))
  {
    goto LABEL_3;
  }
  unint64_t v3 = &_swiftEmptySetSingleton;
  uint64_t v4 = a1 & 0xFFFFFFFFFFFFFF8;
  if (v2) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v5 = *(void *)(v4 + 16);
  if (!v5) {
    return;
  }
LABEL_9:
  id v7 = (char *)(v3 + 7);
  uint64_t v42 = v5;
  if ((a1 & 0xC000000000000001) != 0)
  {
    uint64_t v8 = 0;
    while (1)
    {
      uint64_t v9 = sub_99E8();
      BOOL v10 = __OFADD__(v8++, 1);
      if (v10)
      {
        __break(1u);
        goto LABEL_36;
      }
      uint64_t v11 = v9;
      Swift::Int v12 = sub_9958(v3[5]);
      uint64_t v13 = -1 << *((unsigned char *)v3 + 32);
      unint64_t v14 = v12 & ~v13;
      unint64_t v15 = v14 >> 6;
      uint64_t v16 = *(void *)&v7[8 * (v14 >> 6)];
      uint64_t v17 = 1 << v14;
      if (((1 << v14) & v16) != 0)
      {
        sub_7B50();
        id v18 = *(id *)(v3[6] + 8 * v14);
        char v19 = sub_9968();

        if (v19)
        {
LABEL_11:
          swift_unknownObjectRelease();
          goto LABEL_12;
        }
        uint64_t v20 = ~v13;
        while (1)
        {
          unint64_t v14 = (v14 + 1) & v20;
          unint64_t v15 = v14 >> 6;
          uint64_t v16 = *(void *)&v7[8 * (v14 >> 6)];
          uint64_t v17 = 1 << v14;
          if ((v16 & (1 << v14)) == 0) {
            break;
          }
          id v21 = *(id *)(v3[6] + 8 * v14);
          char v22 = sub_9968();

          if (v22) {
            goto LABEL_11;
          }
        }
      }
      *(void *)&v7[8 * v15] = v17 | v16;
      *(void *)(v3[6] + 8 * v14) = v11;
      uint64_t v23 = v3[2];
      BOOL v10 = __OFADD__(v23, 1);
      uint64_t v24 = v23 + 1;
      if (v10) {
        goto LABEL_37;
      }
      v3[2] = v24;
LABEL_12:
      if (v8 == v42) {
        return;
      }
    }
  }
  uint64_t v25 = 0;
  uint64_t v41 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8));
  while (v25 != v41)
  {
    Swift::Int v26 = v3[5];
    id v27 = *(id *)(a1 + 32 + 8 * v25);
    Swift::Int v28 = sub_9958(v26);
    uint64_t v29 = -1 << *((unsigned char *)v3 + 32);
    unint64_t v30 = v28 & ~v29;
    unint64_t v31 = v30 >> 6;
    uint64_t v32 = *(void *)&v7[8 * (v30 >> 6)];
    uint64_t v33 = 1 << v30;
    if (((1 << v30) & v32) != 0)
    {
      sub_7B50();
      id v34 = *(id *)(v3[6] + 8 * v30);
      char v35 = sub_9968();

      if (v35) {
        goto LABEL_23;
      }
      uint64_t v36 = ~v29;
      unint64_t v30 = (v30 + 1) & v36;
      unint64_t v31 = v30 >> 6;
      uint64_t v32 = *(void *)&v7[8 * (v30 >> 6)];
      uint64_t v33 = 1 << v30;
      if ((v32 & (1 << v30)) != 0)
      {
        while (1)
        {
          id v37 = *(id *)(v3[6] + 8 * v30);
          char v38 = sub_9968();

          if (v38) {
            break;
          }
          unint64_t v30 = (v30 + 1) & v36;
          unint64_t v31 = v30 >> 6;
          uint64_t v32 = *(void *)&v7[8 * (v30 >> 6)];
          uint64_t v33 = 1 << v30;
          if ((v32 & (1 << v30)) == 0) {
            goto LABEL_31;
          }
        }
LABEL_23:

        uint64_t v5 = v42;
        goto LABEL_24;
      }
LABEL_31:
      uint64_t v5 = v42;
    }
    *(void *)&v7[8 * v31] = v33 | v32;
    *(void *)(v3[6] + 8 * v30) = v27;
    uint64_t v39 = v3[2];
    BOOL v10 = __OFADD__(v39, 1);
    uint64_t v40 = v39 + 1;
    if (v10) {
      goto LABEL_38;
    }
    v3[2] = v40;
LABEL_24:
    if (++v25 == v5) {
      return;
    }
  }
LABEL_36:
  __break(1u);
LABEL_37:
  __break(1u);
LABEL_38:
  __break(1u);
}

unint64_t sub_7B50()
{
  unint64_t result = qword_11810;
  if (!qword_11810)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_11810);
  }
  return result;
}

uint64_t sub_7B90()
{
  return swift_release();
}

uint64_t sub_7BA0(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v8 = v1[6];
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v9;
  *uint64_t v9 = v2;
  v9[1] = sub_7C68;
  return sub_3E98(a1, v4, v5, v6, v7, v8);
}

uint64_t sub_7C68()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_7D60(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v9 = v1[6];
  uint64_t v8 = v1[7];
  BOOL v10 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v10;
  *BOOL v10 = v2;
  v10[1] = sub_8B50;
  return sub_42AC(a1, v4, v5, v6, v7, v9, v8);
}

uint64_t sub_7E34()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_7E6C(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_8B50;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_11850 + dword_11850);
  return v6(a1, v4);
}

unint64_t sub_7F24()
{
  unint64_t result = qword_11868;
  if (!qword_11868)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_11868);
  }
  return result;
}

uint64_t sub_7F78(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_7FC0(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_8010(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_806C()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 24, 7);
}

void sub_80A4(uint64_t a1)
{
  sub_3B58(a1, *(void *)(v1 + 16));
}

void *sub_80AC(unint64_t a1)
{
  if (a1 >> 62) {
    goto LABEL_14;
  }
  uint64_t v2 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8));
  while (1)
  {
    uint64_t result = _swiftEmptyArrayStorage;
    if (!v2) {
      break;
    }
    uint64_t v9 = _swiftEmptyArrayStorage;
    sub_9A28();
    if (v2 < 0)
    {
      __break(1u);
      uint64_t result = (void *)swift_release();
      __break(1u);
      return result;
    }
    uint64_t v4 = 0;
    while (v2 != v4)
    {
      if ((a1 & 0xC000000000000001) != 0) {
        id v5 = (id)sub_99E8();
      }
      else {
        id v5 = *(id *)(a1 + 8 * v4 + 32);
      }
      uint64_t v6 = v5;
      uint64_t v7 = v5;
      sub_355C(&v7, &v8);

      ++v4;
      sub_9A08();
      sub_9A38();
      sub_9A48();
      sub_9A18();
      if (v2 == v4) {
        return v9;
      }
    }
    __break(1u);
LABEL_14:
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_9A78();
    swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_81F4(uint64_t a1, void *a2, void (**a3)(void, void))
{
  sub_28E8(&qword_11828);
  __chkstk_darwin();
  uint64_t v7 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a3;
  type metadata accessor for ActivityDigitalSeparationSharedResource();
  uint64_t v9 = swift_dynamicCastClass();
  if (!v9)
  {
    sub_7F24();
    swift_allocError();
    *id v18 = 3;
    _Block_copy(a3);
    char v19 = (void *)sub_9808();
    ((void (**)(void, void *))a3)[2](a3, v19);

    swift_errorRelease();
    return swift_release();
  }
  unint64_t v10 = *(void *)(v9
                  + OBJC_IVAR____TtC25ActivityDigitalSeparation39ActivityDigitalSeparationSharedResource_digitalSeparationFriends);
  if (v10 >> 62)
  {
    _Block_copy(a3);
    swift_unknownObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v11 = sub_9A78();
    if (v11) {
      goto LABEL_4;
    }
LABEL_15:
    swift_bridgeObjectRelease();
    uint64_t v17 = &_swiftEmptyArrayStorage;
LABEL_16:
    uint64_t v20 = sub_9918();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v7, 1, 1, v20);
    id v21 = (void *)swift_allocObject();
    v21[2] = 0;
    v21[3] = 0;
    v21[4] = v17;
    v21[5] = a2;
    v21[6] = sub_8B4C;
    v21[7] = v8;
    swift_bridgeObjectRetain();
    id v22 = a2;
    swift_retain();
    sub_2C98((uint64_t)v7, (uint64_t)&unk_11890, (uint64_t)v21);
    swift_release();
    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();
    return swift_release();
  }
  uint64_t v11 = *(void *)((char *)&dword_10 + (v10 & 0xFFFFFFFFFFFFFF8));
  _Block_copy(a3);
  swift_unknownObjectRetain();
  swift_bridgeObjectRetain();
  if (!v11) {
    goto LABEL_15;
  }
LABEL_4:
  Swift::Int v26 = &_swiftEmptyArrayStorage;
  uint64_t result = sub_9A28();
  if ((v11 & 0x8000000000000000) == 0)
  {
    uint64_t v24 = a2;
    uint64_t v25 = a1;
    uint64_t v13 = 0;
    do
    {
      if ((v10 & 0xC000000000000001) != 0) {
        unint64_t v14 = (char *)sub_99E8();
      }
      else {
        unint64_t v14 = (char *)*(id *)(v10 + 8 * v13 + 32);
      }
      unint64_t v15 = v14;
      ++v13;
      id v16 = *(id *)&v14[OBJC_IVAR____TtC25ActivityDigitalSeparation31ActivityDigitalSeparationFriend_sharingFriend];

      sub_9A08();
      sub_9A38();
      sub_9A48();
      sub_9A18();
    }
    while (v11 != v13);
    uint64_t v17 = v26;
    swift_bridgeObjectRelease();
    a2 = v24;
    goto LABEL_16;
  }
  __break(1u);
  return result;
}

uint64_t sub_854C(uint64_t a1, void *a2, void (**a3)(void, void))
{
  sub_28E8(&qword_11828);
  __chkstk_darwin();
  uint64_t v6 = (char *)&v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = a3;
  type metadata accessor for ActivityDigitalSeparationFriend();
  uint64_t v8 = swift_dynamicCastClass();
  if (v8)
  {
    uint64_t v9 = v8;
    sub_28E8(&qword_11818);
    uint64_t v10 = swift_allocObject();
    *(_OWORD *)(v10 + 16) = xmmword_ACD0;
    uint64_t v11 = *(void **)(v9 + OBJC_IVAR____TtC25ActivityDigitalSeparation31ActivityDigitalSeparationFriend_sharingFriend);
    *(void *)(v10 + 32) = v11;
    uint64_t v21 = v10;
    _Block_copy(a3);
    sub_98E8();
    uint64_t v12 = v21;
    uint64_t v13 = sub_9918();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v6, 1, 1, v13);
    unint64_t v14 = (void *)swift_allocObject();
    v14[2] = 0;
    v14[3] = 0;
    v14[4] = v12;
    v14[5] = a2;
    v14[6] = sub_8B4C;
    v14[7] = v7;
    swift_unknownObjectRetain();
    id v15 = v11;
    swift_bridgeObjectRetain();
    id v16 = a2;
    swift_retain();
    sub_2C98((uint64_t)v6, (uint64_t)&unk_11888, (uint64_t)v14);
    swift_release();
    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();
    return swift_release();
  }
  else
  {
    sub_7F24();
    swift_allocError();
    *id v18 = 2;
    _Block_copy(a3);
    char v19 = (void *)sub_9808();
    ((void (**)(void, void *))a3)[2](a3, v19);

    swift_errorRelease();
    return swift_release();
  }
}

uint64_t sub_87C4(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v9 = v1[6];
  uint64_t v8 = v1[7];
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v10;
  *uint64_t v10 = v2;
  v10[1] = sub_7C68;
  return sub_42AC(a1, v4, v5, v6, v7, v9, v8);
}

uint64_t sub_889C()
{
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();

  swift_release();

  return _swift_deallocObject(v0, 64, 7);
}

void sub_88EC(uint64_t a1, uint64_t a2)
{
  sub_34C0(a1, a2, *(void *)(v2 + 16));
}

uint64_t sub_88F8()
{
  swift_unknownObjectRelease();

  swift_release();

  return _swift_deallocObject(v0, 56, 7);
}

uint64_t sub_8940(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v8 = v1[6];
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v9;
  *uint64_t v9 = v2;
  v9[1] = sub_8B50;
  return sub_2E68(a1, v4, v5, v6, v7, v8);
}

uint64_t sub_8A08(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_28E8(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_8A64()
{
  swift_unknownObjectRelease();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_8AA4()
{
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_8B50;
  v3[2] = v2;
  return _swift_task_switch(sub_2AF4, 0, 0);
}

unsigned char *initializeBufferWithCopyOfBuffer for ActivityDigitalSeparationError(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for ActivityDigitalSeparationError(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFD) {
    goto LABEL_17;
  }
  if (a2 + 3 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 3) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 3;
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
      return (*a1 | (v4 << 8)) - 3;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 3;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 4;
  int v8 = v6 - 4;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for ActivityDigitalSeparationError(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 3 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 3) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFD) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFC)
  {
    unsigned int v6 = ((a2 - 253) >> 8) + 1;
    *uint64_t result = a2 + 3;
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
        JUMPOUT(0x8CCCLL);
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
          *uint64_t result = a2 + 3;
        break;
    }
  }
  return result;
}

uint64_t sub_8CF4(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_8D00(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for ActivityDigitalSeparationError()
{
  return &type metadata for ActivityDigitalSeparationError;
}

unint64_t sub_8D1C()
{
  unint64_t result = qword_118D0;
  if (!qword_118D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_118D0);
  }
  return result;
}

BOOL sub_8D70(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

Swift::Int sub_8D84()
{
  Swift::UInt v1 = *v0;
  sub_9B18();
  sub_9B28(v1);
  return sub_9B38();
}

void sub_8DCC()
{
  sub_9B28(*v0);
}

Swift::Int sub_8DF8()
{
  Swift::UInt v1 = *v0;
  sub_9B18();
  sub_9B28(v1);
  return sub_9B38();
}

uint64_t sub_8E78()
{
  uint64_t v1 = sub_9848();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  unsigned int v4 = (char *)&v12 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_28E8(&qword_11860);
  __chkstk_darwin(v5 - 8);
  BOOL v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v8 = [*(id *)(v0 + OBJC_IVAR____TtC25ActivityDigitalSeparation31ActivityDigitalSeparationFriend_sharingFriend) UUID];
  if (v8)
  {
    uint64_t v9 = v8;
    sub_9838();

    (*(void (**)(char *, char *, uint64_t))(v2 + 32))(v7, v4, v1);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v2 + 56))(v7, 0, 1, v1);
    uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v2 + 48))(v7, 1, v1);
    if (result != 1)
    {
      uint64_t v11 = sub_9828();
      (*(void (**)(char *, uint64_t))(v2 + 8))(v7, v1);
      return v11;
    }
  }
  else
  {
    uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v2 + 56))(v7, 1, 1, v1);
  }
  __break(1u);
  return result;
}

id sub_929C()
{
  return sub_936C((uint64_t (*)(void))&_ASDestinationIsEmail, (uint64_t (*)(void))&_ASDestinationIsEmail);
}

id sub_92D0(void *a1, uint64_t a2, void (*a3)(void))
{
  id v4 = a1;
  a3();
  uint64_t v6 = v5;

  if (v6)
  {
    NSString v7 = sub_9878();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v7 = 0;
  }

  return v7;
}

id sub_9350()
{
  return sub_936C((uint64_t (*)(void))&ASDestinationIsPhoneNumber, (uint64_t (*)(void))&ASDestinationIsPhoneNumber);
}

id sub_936C(uint64_t (*a1)(void), uint64_t (*a2)(void))
{
  id v5 = [*(id *)(v2 + OBJC_IVAR____TtC25ActivityDigitalSeparation31ActivityDigitalSeparationFriend_sharingFriend) contact];
  uint64_t v6 = v5;
  if (!v5) {
    return 0;
  }
  id v7 = [v5 primaryRelationship];

  if (!v7) {
    return 0;
  }
  id v8 = [v7 cloudKitAddress];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = sub_98A8();

    NSString v11 = sub_9878();
    int v12 = a1();

    if (v12) {
      goto LABEL_11;
    }
    swift_bridgeObjectRelease();
  }
  id v13 = [v7 preferredReachableAddress];
  if (!v13) {
    goto LABEL_9;
  }
  unint64_t v14 = v13;
  uint64_t v10 = sub_98A8();

  NSString v15 = sub_9878();
  int v16 = a1();

  if (v16)
  {
LABEL_11:

    return (id)v10;
  }
  swift_bridgeObjectRelease();
LABEL_9:
  id result = [v7 addresses];
  if (result)
  {
    id v18 = result;
    uint64_t v19 = sub_9928();

    uint64_t v10 = sub_9560(v19, a2);
    swift_bridgeObjectRelease();
    goto LABEL_11;
  }
  __break(1u);
  return result;
}

uint64_t sub_9534(uint64_t a1)
{
  return sub_9560(a1, (uint64_t (*)(void))&_ASDestinationIsEmail);
}

uint64_t sub_9560(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v4 = a1 + 56;
  uint64_t v5 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v6 = -1;
  if (v5 < 64) {
    uint64_t v6 = ~(-1 << v5);
  }
  unint64_t v7 = v6 & *(void *)(a1 + 56);
  int64_t v18 = (unint64_t)(v5 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t j = 0;
  if (!v7) {
    goto LABEL_5;
  }
LABEL_4:
  unint64_t v10 = __clz(__rbit64(v7));
  v7 &= v7 - 1;
  for (unint64_t i = v10 | (j << 6); ; unint64_t i = __clz(__rbit64(v13)) + (j << 6))
  {
    uint64_t v15 = *(void *)(*(void *)(a1 + 48) + 16 * i);
    swift_bridgeObjectRetain();
    NSString v16 = sub_9878();
    int v17 = a2();

    if (v17)
    {
      swift_release();
      return v15;
    }
    uint64_t result = swift_bridgeObjectRelease();
    if (v7) {
      goto LABEL_4;
    }
LABEL_5:
    int64_t v12 = j + 1;
    if (__OFADD__(j, 1)) {
      break;
    }
    if (v12 >= v18) {
      goto LABEL_24;
    }
    unint64_t v13 = *(void *)(v4 + 8 * v12);
    ++j;
    if (v13) {
      goto LABEL_19;
    }
    int64_t j = v12 + 1;
    if (v12 + 1 >= v18) {
      goto LABEL_24;
    }
    unint64_t v13 = *(void *)(v4 + 8 * j);
    if (v13) {
      goto LABEL_19;
    }
    int64_t j = v12 + 2;
    if (v12 + 2 >= v18) {
      goto LABEL_24;
    }
    unint64_t v13 = *(void *)(v4 + 8 * j);
    if (v13) {
      goto LABEL_19;
    }
    int64_t j = v12 + 3;
    if (v12 + 3 >= v18) {
      goto LABEL_24;
    }
    unint64_t v13 = *(void *)(v4 + 8 * j);
    if (v13) {
      goto LABEL_19;
    }
    int64_t v14 = v12 + 4;
    if (v14 >= v18)
    {
LABEL_24:
      swift_release();
      return 0;
    }
    unint64_t v13 = *(void *)(v4 + 8 * v14);
    for (int64_t j = v14; !v13; ++v14)
    {
      int64_t j = v14 + 1;
      if (__OFADD__(v14, 1)) {
        goto LABEL_27;
      }
      if (j >= v18) {
        goto LABEL_24;
      }
      unint64_t v13 = *(void *)(v4 + 8 * j);
    }
LABEL_19:
    unint64_t v7 = (v13 - 1) & v13;
  }
  __break(1u);
LABEL_27:
  __break(1u);
  return result;
}

id sub_9760()
{
  v2.unint64_t receiver = v0;
  v2.super_class = (Class)type metadata accessor for ActivityDigitalSeparationFriend();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for ActivityDigitalSeparationFriend()
{
  return self;
}

uint64_t sub_97C8()
{
  return PersonNameComponents.givenName.getter();
}

uint64_t sub_97D8()
{
  return PersonNameComponents.init(namePrefix:givenName:middleName:familyName:nameSuffix:nickname:phoneticRepresentation:)();
}

Class sub_97E8()
{
  return PersonNameComponents._bridgeToObjectiveC()().super.isa;
}

uint64_t sub_97F8()
{
  return type metadata accessor for PersonNameComponents();
}

uint64_t sub_9808()
{
  return _convertErrorToNSError(_:)();
}

uint64_t sub_9818()
{
  return _convertNSErrorToError(_:)();
}

uint64_t sub_9828()
{
  return UUID.uuidString.getter();
}

uint64_t sub_9838()
{
  return static UUID._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_9848()
{
  return type metadata accessor for UUID();
}

uint64_t sub_9858()
{
  return ActivitySharingClient.__allocating_init()();
}

uint64_t sub_9868()
{
  return type metadata accessor for ActivitySharingClient();
}

NSString sub_9878()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_9888()
{
  return static String._forceBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_9898()
{
  return static String._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_98A8()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_98B8()
{
  return String.hash(into:)();
}

Swift::Int sub_98C8()
{
  return String.UTF8View._foreignCount()();
}

NSArray sub_98D8()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_98E8()
{
  return specialized Array._endMutation()();
}

uint64_t sub_98F8()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_9908()
{
  return TaskPriority.rawValue.getter();
}

uint64_t sub_9918()
{
  return type metadata accessor for TaskPriority();
}

uint64_t sub_9928()
{
  return static Set._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_9938()
{
  return Set.Iterator.init(_cocoa:)();
}

uint64_t sub_9948()
{
  return static os_log_type_t.default.getter();
}

Swift::Int sub_9958(Swift::Int seed)
{
  return NSObject._rawHashValue(seed:)(seed);
}

uint64_t sub_9968()
{
  return static NSObject.== infix(_:_:)();
}

uint64_t sub_9978()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_9988()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_9998()
{
  return __CocoaSet.makeIterator()();
}

uint64_t sub_99A8()
{
  return __CocoaSet.count.getter();
}

uint64_t sub_99B8()
{
  return __CocoaSet.Iterator.next()();
}

uint64_t sub_99C8()
{
  return static _SetStorage.allocate(capacity:)();
}

uint64_t sub_99D8()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_99E8()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_99F8()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_9A08()
{
  return specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
}

uint64_t sub_9A18()
{
  return specialized ContiguousArray._endMutation()();
}

uint64_t sub_9A28()
{
  return specialized ContiguousArray.reserveCapacity(_:)();
}

uint64_t sub_9A38()
{
  return specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
}

uint64_t sub_9A48()
{
  return specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_9A58()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_9A68()
{
  return _bridgeCocoaArray<A>(_:)();
}

uint64_t sub_9A78()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_9A88()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t sub_9AA8()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t sub_9AB8()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_9AC8()
{
  return dispatch thunk of __ContiguousArrayStorageBase.staticElementType.getter();
}

uint64_t sub_9AD8()
{
  return Error._getEmbeddedNSError()();
}

uint64_t sub_9AE8()
{
  return Error._code.getter();
}

uint64_t sub_9AF8()
{
  return Error._domain.getter();
}

uint64_t sub_9B08()
{
  return Error._userInfo.getter();
}

uint64_t sub_9B18()
{
  return Hasher.init(_seed:)();
}

void sub_9B28(Swift::UInt a1)
{
}

Swift::Int sub_9B38()
{
  return Hasher._finalize()();
}

uint64_t ASDestinationIsEmail()
{
  return _ASDestinationIsEmail();
}

uint64_t ASLoggingInitialize()
{
  return _ASLoggingInitialize();
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

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return __swift_stdlib_reportUnimplementedInitializer();
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

uint64_t swift_dynamicCastClass()
{
  return _swift_dynamicCastClass();
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