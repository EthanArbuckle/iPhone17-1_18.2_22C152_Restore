unint64_t sub_10000314C()
{
  int *v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  unint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(void);
  uint64_t v9;
  void *v10;
  uint64_t v11;
  unint64_t result;

  sub_10000BC6C(&qword_1000144A0);
  v0 = (int *)(sub_10000BC6C(&qword_1000144A8) - 8);
  v1 = *(void *)(*(void *)v0 + 72);
  v2 = (*(unsigned __int8 *)(*(void *)v0 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v0 + 80);
  v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_10000F250;
  v4 = v3 + v2;
  v5 = (void *)(v4 + v0[14]);
  v6 = enum case for MessageDetails.EventSource.screenTime(_:);
  v7 = sub_10000E090();
  v8 = *(void (**)(void))(*(void *)(v7 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v8)(v4, v6, v7);
  *v5 = 0xD000000000000029;
  v5[1] = 0x800000010000EC10;
  v5[2] = 0xD000000000000011;
  v5[3] = 0x800000010000EC40;
  v5[4] = 0xD000000000000022;
  v5[5] = 0x800000010000EC60;
  v5[6] = sub_10000E2B0();
  v5[7] = v9;
  v10 = (void *)(v4 + v1 + v0[14]);
  v8();
  *v10 = 0xD000000000000027;
  v10[1] = 0x800000010000EC90;
  v10[2] = 0x7975426F546B7341;
  v10[3] = 0xE800000000000000;
  v10[4] = 0xD000000000000022;
  v10[5] = 0x800000010000ECC0;
  v10[6] = sub_10000E2B0();
  v10[7] = v11;
  result = sub_100003360(v3);
  qword_1000144F8 = result;
  return result;
}

unint64_t sub_100003360(uint64_t a1)
{
  uint64_t v2 = sub_10000BC6C(&qword_1000144A8);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  v5 = (char *)v27 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(void *)(a1 + 16))
  {
    v7 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_10000BC6C(&qword_1000144B0);
  uint64_t v6 = sub_10000E420();
  v7 = (void *)v6;
  uint64_t v8 = *(void *)(a1 + 16);
  if (!v8)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v7;
  }
  v9 = &v5[*(int *)(v2 + 48)];
  uint64_t v10 = v6 + 64;
  unint64_t v11 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v27[1] = a1;
  uint64_t v12 = a1 + v11;
  uint64_t v13 = *(void *)(v3 + 72);
  swift_retain();
  while (1)
  {
    sub_10000C2C8(v12, (uint64_t)v5, &qword_1000144A8);
    unint64_t result = sub_100005494((uint64_t)v5);
    if (v15) {
      break;
    }
    unint64_t v16 = result;
    *(void *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v17 = v7[6];
    uint64_t v18 = sub_10000E090();
    unint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(void *)(v18 - 8) + 32))(v17 + *(void *)(*(void *)(v18 - 8) + 72) * v16, v5, v18);
    unint64_t v19 = v7[7] + (v16 << 6);
    long long v20 = *((_OWORD *)v9 + 1);
    long long v21 = *((_OWORD *)v9 + 2);
    uint64_t v22 = *((void *)v9 + 6);
    uint64_t v23 = *((void *)v9 + 7);
    *(_OWORD *)unint64_t v19 = *(_OWORD *)v9;
    *(_OWORD *)(v19 + 16) = v20;
    *(_OWORD *)(v19 + 32) = v21;
    *(void *)(v19 + 48) = v22;
    *(void *)(v19 + 56) = v23;
    uint64_t v24 = v7[2];
    BOOL v25 = __OFADD__(v24, 1);
    uint64_t v26 = v24 + 1;
    if (v25) {
      goto LABEL_11;
    }
    v7[2] = v26;
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

uint64_t sub_100003570(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[3] = a1;
  v4[4] = a4;
  uint64_t v5 = sub_10000DF10();
  v4[5] = v5;
  v4[6] = *(void *)(v5 - 8);
  v4[7] = swift_task_alloc();
  uint64_t v6 = sub_10000DF80();
  v4[8] = v6;
  v4[9] = *(void *)(v6 - 8);
  v4[10] = swift_task_alloc();
  return _swift_task_switch(sub_10000368C, 0, 0);
}

uint64_t sub_10000368C()
{
  BOOL v25 = v0;
  uint64_t v2 = v0[6];
  uint64_t v1 = v0[7];
  uint64_t v4 = v0[4];
  uint64_t v3 = v0[5];
  sub_10000E000();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4, v3);
  uint64_t v5 = sub_10000DF70();
  os_log_type_t v6 = sub_10000E3A0();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = v0[7];
    uint64_t v22 = v0[8];
    uint64_t v23 = v0[10];
    uint64_t v8 = v0[6];
    uint64_t v20 = v0[5];
    uint64_t v21 = v0[9];
    v9 = (uint8_t *)swift_slowAlloc();
    uint64_t v24 = swift_slowAlloc();
    *(_DWORD *)v9 = 136315138;
    uint64_t v10 = sub_10000DED0();
    v0[2] = sub_10000C814(v10, v11, &v24);
    sub_10000E3D0();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v7, v20);
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "Fetching %s", v9, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(uint64_t, uint64_t))(v21 + 8))(v23, v22);
  }
  else
  {
    uint64_t v13 = v0[9];
    uint64_t v12 = v0[10];
    uint64_t v14 = v0[8];
    (*(void (**)(void, void))(v0[6] + 8))(v0[7], v0[5]);

    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v12, v14);
  }
  uint64_t v15 = sub_10000DF20();
  unint64_t v16 = (uint64_t *)v0[3];
  *unint64_t v16 = v15;
  v16[1] = v17;
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v18 = (uint64_t (*)(void))v0[1];
  return v18();
}

uint64_t sub_1000038EC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_10000E380();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_10000E370();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_10000C130(a1, &qword_100014458);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_10000E350();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  sub_10000BC6C(&qword_100014470);
  return swift_task_create();
}

uint64_t sub_100003AA0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5[9] = a4;
  v5[10] = v4;
  v5[7] = a2;
  v5[8] = a3;
  v5[6] = a1;
  uint64_t v6 = sub_10000DF80();
  v5[11] = v6;
  v5[12] = *(void *)(v6 - 8);
  v5[13] = swift_task_alloc();
  uint64_t v7 = sub_10000BC6C(&qword_1000144B8);
  v5[14] = v7;
  v5[15] = *(void *)(v7 - 8);
  v5[16] = swift_task_alloc();
  uint64_t v8 = sub_10000E090();
  v5[17] = v8;
  v5[18] = *(void *)(v8 - 8);
  v5[19] = swift_task_alloc();
  v5[20] = swift_task_alloc();
  return _swift_task_switch(sub_100003C34, 0, 0);
}

uint64_t sub_100003C34()
{
  (*(void (**)(void, void, void))(v0[18] + 104))(v0[20], enum case for MessageDetails.EventSource.unknown(_:), v0[17]);
  sub_10000C280(&qword_100014408, (void (*)(uint64_t))&type metadata accessor for MessageDetails.EventSource);
  sub_10000E320();
  sub_10000E320();
  if (v0[2] == v0[4] && v0[3] == v0[5]) {
    char v1 = 1;
  }
  else {
    char v1 = sub_10000E450();
  }
  uint64_t v2 = v0[20];
  uint64_t v3 = v0[17];
  uint64_t v4 = v0[18];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void (**)(uint64_t, uint64_t))(v4 + 8);
  v5(v2, v3);
  if (v1)
  {
    sub_10000DFE0();
    swift_willThrow();
    uint64_t v7 = v0[12];
    uint64_t v6 = v0[13];
    uint64_t v8 = v0[11];
    sub_10000E000();
    swift_errorRetain();
    sub_10000DF60();
    swift_errorRelease();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v6, v8);
    swift_willThrow();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    v9 = (uint64_t (*)(void))v0[1];
    return v9();
  }
  else
  {
    uint64_t v12 = v0[18];
    uint64_t v11 = v0[19];
    uint64_t v13 = v0[17];
    (*(void (**)(uint64_t, void, uint64_t))(v12 + 16))(v11, v0[9], v13);
    if ((*(unsigned int (**)(uint64_t, uint64_t))(v12 + 88))(v11, v13) == enum case for MessageDetails.EventSource.screenTime(_:))
    {
      sub_10000E020();
    }
    else
    {
      uint64_t v14 = v0[19];
      uint64_t v15 = v0[17];
      sub_10000E010();
      v5(v14, v15);
    }
    uint64_t v16 = v0[10];
    sub_10000C32C((void *)(v16 + 16), *(void *)(v16 + 40));
    uint64_t v17 = (void *)swift_task_alloc();
    v0[21] = v17;
    *uint64_t v17 = v0;
    v17[1] = sub_100003FA4;
    uint64_t v18 = v0[16];
    uint64_t v20 = v0[8];
    uint64_t v19 = v0[9];
    uint64_t v21 = v0[6];
    uint64_t v22 = v0[7];
    return dispatch thunk of RequestMessageDetailsBuilderProtocol.fromPersistence(_:eventID:useFamilyCache:resolveAppBundleInfo:maxAge:withContactFetcher:)(v21, v19, v22, v20, 0, 1, v18, v16 + 56);
  }
}

uint64_t sub_100003FA4()
{
  *(void *)(*(void *)v1 + 176) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_10000415C;
  }
  else {
    uint64_t v2 = sub_1000040B8;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_1000040B8()
{
  (*(void (**)(void, void))(v0[15] + 8))(v0[16], v0[14]);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_10000415C()
{
  (*(void (**)(void, void))(v0[15] + 8))(v0[16], v0[14]);
  uint64_t v2 = v0[12];
  uint64_t v1 = v0[13];
  uint64_t v3 = v0[11];
  sub_10000E000();
  swift_errorRetain();
  sub_10000DF60();
  swift_errorRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_willThrow();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_100004274(uint64_t a1)
{
  unint64_t v2 = *(void *)(a1 + 16);
  unint64_t v3 = *v1;
  int64_t v4 = *(void *)(*v1 + 16);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
    goto LABEL_21;
  }
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  if (isUniquelyReferenced_nonNull_native && v5 <= *(void *)(v3 + 24) >> 1)
  {
    unint64_t v8 = *(void *)(a1 + 16);
    if (v8) {
      goto LABEL_5;
    }
LABEL_18:
    if (!v2) {
      goto LABEL_19;
    }
    goto LABEL_21;
  }
  if (v4 <= v5) {
    int64_t v23 = v4 + v2;
  }
  else {
    int64_t v23 = v4;
  }
  unint64_t v3 = sub_10000522C(isUniquelyReferenced_nonNull_native, v23, 1, v3);
  unint64_t v8 = *(void *)(a1 + 16);
  if (!v8) {
    goto LABEL_18;
  }
LABEL_5:
  uint64_t v9 = *(void *)(v3 + 16);
  uint64_t v10 = (*(void *)(v3 + 24) >> 1) - v9;
  uint64_t v11 = *(void *)(sub_10000DE60() - 8);
  uint64_t v12 = *(void *)(v11 + 72);
  if (v10 < (uint64_t)v8)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  unint64_t v13 = (*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  unint64_t v14 = v3 + v13 + v12 * v9;
  unint64_t v15 = a1 + v13;
  uint64_t v16 = v12 * v8;
  unint64_t v17 = v14 + v16;
  unint64_t v18 = v15 + v16;
  if (v15 < v17 && v14 < v18) {
    goto LABEL_24;
  }
  swift_arrayInitWithCopy();
  if (v8 < v2)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  uint64_t v20 = *(void *)(v3 + 16);
  BOOL v21 = __OFADD__(v20, v8);
  uint64_t v22 = v20 + v8;
  if (!v21)
  {
    *(void *)(v3 + 16) = v22;
LABEL_19:
    uint64_t result = swift_bridgeObjectRelease();
    *uint64_t v1 = v3;
    return result;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  uint64_t result = sub_10000E430();
  __break(1u);
  return result;
}

uint64_t sub_100004424(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  *(void *)(v6 + 48) = a4;
  *(void *)(v6 + 56) = v5;
  *(unsigned char *)(v6 + 240) = a5;
  *(void *)(v6 + 32) = a2;
  *(void *)(v6 + 40) = a3;
  *(void *)(v6 + 24) = a1;
  uint64_t v7 = sub_10000DF80();
  *(void *)(v6 + 64) = v7;
  *(void *)(v6 + 72) = *(void *)(v7 - 8);
  *(void *)(v6 + 80) = swift_task_alloc();
  uint64_t v8 = sub_10000E0B0();
  *(void *)(v6 + 88) = v8;
  *(void *)(v6 + 96) = *(void *)(v8 - 8);
  *(void *)(v6 + 104) = swift_task_alloc();
  *(void *)(v6 + 112) = swift_task_alloc();
  uint64_t v9 = sub_10000E170();
  *(void *)(v6 + 120) = v9;
  *(void *)(v6 + 128) = *(void *)(v9 - 8);
  *(void *)(v6 + 136) = swift_task_alloc();
  *(void *)(v6 + 144) = swift_task_alloc();
  return _swift_task_switch(sub_1000045C8, 0, 0);
}

uint64_t sub_1000045C8()
{
  if (qword_100014300 != -1) {
    swift_once();
  }
  uint64_t v1 = qword_1000144F8;
  if (*(void *)(qword_1000144F8 + 16) && (unint64_t v2 = sub_100005494(v0[6]), (v3 & 1) != 0))
  {
    int64_t v4 = (void *)(*(void *)(v1 + 56) + (v2 << 6));
    v0[19] = *v4;
    v0[20] = v4[1];
    v0[21] = v4[3];
    v0[22] = v4[5];
    v0[23] = v4[7];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v5 = (void *)swift_task_alloc();
    v0[24] = v5;
    void *v5 = v0;
    v5[1] = sub_1000047A4;
    uint64_t v6 = v0[18];
    uint64_t v7 = v0[6];
    uint64_t v8 = v0[3];
    uint64_t v9 = v0[4];
    return sub_100003AA0(v6, v8, v9, v7);
  }
  else
  {
    sub_10000DFE0();
    swift_willThrow();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v11 = (uint64_t (*)(void))v0[1];
    return v11();
  }
}

uint64_t sub_1000047A4()
{
  *(void *)(*(void *)v1 + 200) = v0;
  swift_task_dealloc();
  if (v0)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    unint64_t v2 = sub_100004F58;
  }
  else
  {
    unint64_t v2 = sub_1000048E4;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_1000048E4()
{
  uint64_t v37 = v0;
  uint64_t v2 = *(void *)(v0 + 104);
  uint64_t v1 = *(void *)(v0 + 112);
  uint64_t v3 = *(void *)(v0 + 88);
  uint64_t v4 = *(void *)(v0 + 96);
  sub_10000E140();
  (*(void (**)(uint64_t, void, uint64_t))(v4 + 104))(v2, enum case for MessageDetails.EventStatus.pending(_:), v3);
  sub_10000C280(&qword_1000143E0, (void (*)(uint64_t))&type metadata accessor for MessageDetails.EventStatus);
  char v5 = sub_10000E290();
  uint64_t v6 = *(void (**)(uint64_t, uint64_t))(v4 + 8);
  v6(v2, v3);
  v6(v1, v3);
  if ((v5 & 1) == 0)
  {
    uint64_t v7 = *(void *)(v0 + 136);
    uint64_t v8 = *(void *)(v0 + 144);
    uint64_t v9 = *(void *)(v0 + 120);
    uint64_t v10 = *(void *)(v0 + 128);
    sub_10000E000();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 16))(v7, v8, v9);
    uint64_t v11 = sub_10000DF70();
    os_log_type_t v12 = sub_10000E3B0();
    BOOL v13 = os_log_type_enabled(v11, v12);
    uint64_t v14 = *(void *)(v0 + 128);
    uint64_t v15 = *(void *)(v0 + 136);
    if (v13)
    {
      uint64_t v30 = *(void *)(v0 + 120);
      uint64_t v16 = *(void *)(v0 + 112);
      uint64_t v29 = *(void *)(v0 + 88);
      uint64_t v32 = *(void *)(v0 + 72);
      uint64_t v33 = *(void *)(v0 + 64);
      uint64_t v34 = *(void *)(v0 + 80);
      os_log_type_t type = v12;
      unint64_t v17 = (uint8_t *)swift_slowAlloc();
      uint64_t v36 = swift_slowAlloc();
      *(_DWORD *)unint64_t v17 = 136315138;
      sub_10000E140();
      uint64_t v18 = sub_10000E0A0();
      unint64_t v20 = v19;
      v6(v16, v29);
      *(void *)(v0 + 16) = sub_10000C814(v18, v20, &v36);
      sub_10000E3D0();
      swift_bridgeObjectRelease();
      (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v15, v30);
      _os_log_impl((void *)&_mh_execute_header, v11, type, "Event status != pending (%s)", v17, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(uint64_t, uint64_t))(v32 + 8))(v34, v33);
    }
    else
    {
      uint64_t v22 = *(void *)(v0 + 72);
      uint64_t v21 = *(void *)(v0 + 80);
      uint64_t v23 = *(void *)(v0 + 64);
      (*(void (**)(void, void))(v14 + 8))(*(void *)(v0 + 136), *(void *)(v0 + 120));

      (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v21, v23);
    }
  }
  v35 = (uint64_t (*)(uint64_t, char, uint64_t))((char *)&dword_1000143E8 + dword_1000143E8);
  uint64_t v24 = (void *)swift_task_alloc();
  *(void *)(v0 + 208) = v24;
  *uint64_t v24 = v0;
  v24[1] = sub_100004C70;
  uint64_t v25 = *(void *)(v0 + 144);
  char v26 = *(unsigned char *)(v0 + 240);
  uint64_t v27 = *(void *)(v0 + 40);
  return v35(v25, v26, v27);
}

uint64_t sub_100004C70(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *v3;
  *(void *)(*v3 + 216) = v2;
  swift_task_dealloc();
  if (v2)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v7 = sub_100004EA4;
  }
  else
  {
    *(void *)(v6 + 224) = a2;
    *(void *)(v6 + 232) = a1;
    uint64_t v7 = sub_100004DBC;
  }
  return _swift_task_switch(v7, 0, 0);
}

uint64_t sub_100004DBC()
{
  (*(void (**)(void, void))(v0[16] + 8))(v0[18], v0[15]);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))v0[1];
  uint64_t v3 = v0[28];
  uint64_t v2 = v0[29];
  uint64_t v4 = v0[19];
  uint64_t v5 = v0[20];
  return v1(v4, v5, v2, v3);
}

uint64_t sub_100004EA4()
{
  (*(void (**)(void, void))(v0[16] + 8))(v0[18], v0[15]);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_100004F58()
{
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_100004FF4()
{
  sub_10000C370(v0 + 16);
  sub_10000C370(v0 + 56);

  return _swift_deallocClassInstance(v0, 96, 7);
}

uint64_t type metadata accessor for MessagePackage()
{
  return self;
}

uint64_t sub_100005058(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_100005134;
  return v6(a1);
}

uint64_t sub_100005134()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_10000522C(char a1, int64_t a2, char a3, unint64_t a4)
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
    BOOL v13 = &_swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  sub_10000BC6C(&qword_100014488);
  uint64_t v10 = *(void *)(sub_10000DE60() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  BOOL v13 = (void *)swift_allocObject();
  size_t v14 = j__malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (BOOL v15 = v11 == -1) : (BOOL v15 = 0), v15))
  {
LABEL_29:
    uint64_t result = sub_10000E410();
    __break(1u);
    return result;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  uint64_t v16 = *(void *)(sub_10000DE60() - 8);
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
    sub_100005F94(0, v8, v18, a4);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v13;
}

unint64_t sub_100005494(uint64_t a1)
{
  sub_10000E090();
  sub_10000C280(&qword_100014490, (void (*)(uint64_t))&type metadata accessor for MessageDetails.EventSource);
  uint64_t v2 = sub_10000E280();

  return sub_10000552C(a1, v2);
}

unint64_t sub_10000552C(uint64_t a1, uint64_t a2)
{
  uint64_t v19 = a1;
  uint64_t v4 = sub_10000E090();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin();
  uint64_t v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = v2;
  uint64_t v8 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v9 = a2 & ~v8;
  uint64_t v18 = v2 + 64;
  if ((*(void *)(v2 + 64 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9))
  {
    uint64_t v10 = ~v8;
    BOOL v13 = *(void (**)(char *, unint64_t, uint64_t))(v5 + 16);
    uint64_t v12 = v5 + 16;
    uint64_t v11 = v13;
    uint64_t v14 = *(void *)(v12 + 56);
    do
    {
      v11(v7, *(void *)(v20 + 48) + v14 * v9, v4);
      sub_10000C280(&qword_100014498, (void (*)(uint64_t))&type metadata accessor for MessageDetails.EventSource);
      char v15 = sub_10000E290();
      (*(void (**)(char *, uint64_t))(v12 - 8))(v7, v4);
      if (v15) {
        break;
      }
      unint64_t v9 = (v9 + 1) & v10;
    }
    while (((*(void *)(v18 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9) & 1) != 0);
  }
  return v9;
}

uint64_t sub_1000056EC(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_10000570C(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_10000570C(char a1, int64_t a2, char a3, char *a4)
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
    sub_10000BC6C(&qword_100014410);
    uint64_t v10 = (char *)swift_allocObject();
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
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  BOOL v13 = v10 + 32;
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
  uint64_t result = sub_10000E430();
  __break(1u);
  return result;
}

uint64_t sub_100005878(uint64_t a1)
{
  v1[5] = a1;
  uint64_t v2 = sub_10000DF80();
  v1[6] = v2;
  v1[7] = *(void *)(v2 - 8);
  v1[8] = swift_task_alloc();
  uint64_t v3 = sub_10000DF10();
  v1[9] = v3;
  uint64_t v4 = *(void *)(v3 - 8);
  v1[10] = v4;
  v1[11] = *(void *)(v4 + 64);
  v1[12] = swift_task_alloc();
  v1[13] = swift_task_alloc();
  sub_10000BC6C(&qword_100014458);
  v1[14] = swift_task_alloc();
  return _swift_task_switch(sub_1000059DC, 0, 0);
}

uint64_t sub_1000059DC()
{
  uint64_t v32 = v0;
  if (sub_10000E030())
  {
    uint64_t v2 = v0[13];
    uint64_t v1 = v0[14];
    uint64_t v3 = v0[10];
    uint64_t v4 = v0[9];
    uint64_t v5 = v0[5];
    sub_10000E360();
    uint64_t v6 = sub_10000E380();
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v1, 0, 1, v6);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v2, v5, v4);
    unint64_t v7 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
    uint64_t v8 = swift_allocObject();
    *(void *)(v8 + 16) = 0;
    *(void *)(v8 + 24) = 0;
    (*(void (**)(unint64_t, uint64_t, uint64_t))(v3 + 32))(v8 + v7, v2, v4);
    uint64_t v9 = sub_1000038EC(v1, (uint64_t)&unk_100014468, v8);
    v0[15] = v9;
    uint64_t v10 = (void *)swift_task_alloc();
    v0[16] = v10;
    uint64_t v11 = sub_10000BC6C(&qword_100014470);
    *uint64_t v10 = v0;
    v10[1] = sub_100005DF4;
    return Task<>.value.getter(v0 + 2, v9, v11);
  }
  else
  {
    uint64_t v12 = v0[12];
    uint64_t v13 = v0[9];
    uint64_t v14 = v0[10];
    uint64_t v15 = v0[5];
    sub_10000E000();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v14 + 16))(v12, v15, v13);
    uint64_t v16 = sub_10000DF70();
    os_log_type_t v17 = sub_10000E3B0();
    BOOL v18 = os_log_type_enabled(v16, v17);
    uint64_t v19 = v0[12];
    uint64_t v21 = v0[9];
    uint64_t v20 = v0[10];
    uint64_t v23 = v0[7];
    uint64_t v22 = v0[8];
    uint64_t v24 = v0[6];
    if (v18)
    {
      uint64_t v30 = v0[6];
      uint64_t v25 = (uint8_t *)swift_slowAlloc();
      uint64_t v31 = swift_slowAlloc();
      *(_DWORD *)uint64_t v25 = 136315138;
      sub_10000C280(&qword_100014448, (void (*)(uint64_t))&type metadata accessor for URL);
      uint64_t v26 = sub_10000E440();
      v0[4] = sub_10000C814(v26, v27, &v31);
      sub_10000E3D0();
      swift_bridgeObjectRelease();
      (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v19, v21);
      _os_log_impl((void *)&_mh_execute_header, v16, v17, "%s not in trusted list", v25, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v22, v30);
    }
    else
    {
      (*(void (**)(void, void))(v20 + 8))(v0[12], v0[9]);

      (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v22, v24);
    }
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    v28 = (uint64_t (*)(void, unint64_t))v0[1];
    return v28(0, 0xF000000000000000);
  }
}

uint64_t sub_100005DF4()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_100005EF0, 0, 0);
}

uint64_t sub_100005EF0()
{
  swift_release();
  uint64_t v2 = v0[2];
  uint64_t v1 = v0[3];
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v3 = (uint64_t (*)(uint64_t, uint64_t))v0[1];
  return v3(v2, v1);
}

uint64_t sub_100005F94(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v8 = *(void *)(sub_10000DE60() - 8);
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
  uint64_t result = sub_10000E430();
  __break(1u);
  return result;
}

uint64_t sub_1000060EC(uint64_t a1, char a2, uint64_t a3)
{
  *(unsigned char *)(v3 + 880) = a2;
  *(void *)(v3 + 312) = a1;
  *(void *)(v3 + 320) = a3;
  uint64_t v4 = sub_10000DF80();
  *(void *)(v3 + 328) = v4;
  *(void *)(v3 + 336) = *(void *)(v4 - 8);
  *(void *)(v3 + 344) = swift_task_alloc();
  *(void *)(v3 + 352) = swift_task_alloc();
  *(void *)(v3 + 360) = swift_task_alloc();
  *(void *)(v3 + 368) = swift_task_alloc();
  *(void *)(v3 + 376) = swift_task_alloc();
  *(void *)(v3 + 384) = swift_task_alloc();
  *(void *)(v3 + 392) = swift_task_alloc();
  *(void *)(v3 + 400) = swift_task_alloc();
  uint64_t v5 = sub_10000DE60();
  *(void *)(v3 + 408) = v5;
  *(void *)(v3 + 416) = *(void *)(v5 - 8);
  *(void *)(v3 + 424) = swift_task_alloc();
  *(void *)(v3 + 432) = swift_task_alloc();
  uint64_t v6 = sub_10000E250();
  *(void *)(v3 + 440) = v6;
  *(void *)(v3 + 448) = *(void *)(v6 - 8);
  *(void *)(v3 + 456) = swift_task_alloc();
  sub_10000BC6C(&qword_1000143F0);
  *(void *)(v3 + 464) = swift_task_alloc();
  uint64_t v7 = sub_10000DEC0();
  *(void *)(v3 + 472) = v7;
  *(void *)(v3 + 480) = *(void *)(v7 - 8);
  *(void *)(v3 + 488) = swift_task_alloc();
  *(void *)(v3 + 496) = swift_task_alloc();
  uint64_t v8 = sub_10000E060();
  *(void *)(v3 + 504) = v8;
  *(void *)(v3 + 512) = *(void *)(v8 - 8);
  *(void *)(v3 + 520) = swift_task_alloc();
  *(void *)(v3 + 528) = sub_10000BC6C(&qword_1000143F8);
  *(void *)(v3 + 536) = swift_task_alloc();
  *(void *)(v3 + 544) = swift_task_alloc();
  *(void *)(v3 + 552) = swift_task_alloc();
  *(void *)(v3 + 560) = swift_task_alloc();
  *(void *)(v3 + 568) = swift_task_alloc();
  *(void *)(v3 + 576) = swift_task_alloc();
  *(void *)(v3 + 584) = swift_task_alloc();
  *(void *)(v3 + 592) = swift_task_alloc();
  uint64_t v9 = sub_10000DF10();
  *(void *)(v3 + 600) = v9;
  *(void *)(v3 + 608) = *(void *)(v9 - 8);
  *(void *)(v3 + 616) = swift_task_alloc();
  *(void *)(v3 + 624) = swift_task_alloc();
  *(void *)(v3 + 632) = swift_task_alloc();
  *(void *)(v3 + 640) = swift_task_alloc();
  *(void *)(v3 + 648) = swift_task_alloc();
  sub_10000BC6C(&qword_100014400);
  *(void *)(v3 + 656) = swift_task_alloc();
  uint64_t v10 = sub_10000E090();
  *(void *)(v3 + 664) = v10;
  *(void *)(v3 + 672) = *(void *)(v10 - 8);
  *(void *)(v3 + 680) = swift_task_alloc();
  *(void *)(v3 + 688) = swift_task_alloc();
  *(void *)(v3 + 696) = swift_task_alloc();
  *(void *)(v3 + 704) = swift_task_alloc();
  *(void *)(v3 + 712) = swift_task_alloc();
  uint64_t v11 = sub_10000E170();
  *(void *)(v3 + 720) = v11;
  *(void *)(v3 + 728) = *(void *)(v11 - 8);
  *(void *)(v3 + 736) = swift_task_alloc();
  return _swift_task_switch(sub_10000662C, 0, 0);
}

uint64_t sub_10000662C()
{
  uint64_t v1 = v0[84];
  uint64_t v2 = v0[83];
  uint64_t v3 = v0[82];
  (*(void (**)(void, void, void))(v0[91] + 16))(v0[92], v0[39], v0[90]);
  sub_10000E0C0();
  int v4 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v1 + 48))(v3, 1, v2);
  uint64_t v5 = v0[89];
  uint64_t v6 = v0[84];
  uint64_t v7 = v0[83];
  uint64_t v8 = v0[82];
  if (v4 == 1)
  {
    uint64_t v9 = enum case for MessageDetails.EventSource.unknown(_:);
    uint64_t v10 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 104);
    v10(v5, enum case for MessageDetails.EventSource.unknown(_:), v7);
    sub_10000C130(v8, &qword_100014400);
  }
  else
  {
    (*(void (**)(uint64_t, void, uint64_t))(v6 + 32))(v5, v0[82], v7);
    uint64_t v9 = enum case for MessageDetails.EventSource.unknown(_:);
    uint64_t v10 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 104);
  }
  v0[93] = v10;
  uint64_t v11 = v0[88];
  uint64_t v12 = v0[83];
  v0[94] = (v6 + 104) & 0xFFFFFFFFFFFFLL | 0xB2E4000000000000;
  v10(v11, v9, v12);
  v0[95] = sub_10000C280(&qword_100014408, (void (*)(uint64_t))&type metadata accessor for MessageDetails.EventSource);
  sub_10000E320();
  sub_10000E320();
  if (v0[17] == v0[19] && v0[18] == v0[20]) {
    char v13 = 1;
  }
  else {
    char v13 = sub_10000E450();
  }
  uint64_t v14 = v0[88];
  uint64_t v15 = v0[84];
  uint64_t v16 = v0[83];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  os_log_type_t v17 = *(void (**)(uint64_t, uint64_t))(v15 + 8);
  v0[96] = v17;
  v0[97] = (v15 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v17(v14, v16);
  if (v13)
  {
    uint64_t v18 = v0[92];
    uint64_t v19 = v0[91];
    uint64_t v20 = v0[90];
    uint64_t v21 = v0[89];
    uint64_t v22 = v0[83];
LABEL_23:
    sub_10000DFE0();
    swift_willThrow();
    v17(v21, v22);
    (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v18, v20);
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
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    v39 = (uint64_t (*)(void))v0[1];
    return v39();
  }
  if (qword_100014300 != -1) {
    swift_once();
  }
  uint64_t v23 = qword_1000144F8;
  if (!*(void *)(qword_1000144F8 + 16) || (unint64_t v24 = sub_100005494(v0[89]), (v25 & 1) == 0))
  {
    uint64_t v18 = v0[92];
    uint64_t v19 = v0[91];
    uint64_t v20 = v0[90];
    uint64_t v21 = v0[89];
    uint64_t v22 = v0[83];
    goto LABEL_23;
  }
  uint64_t v26 = (void *)(*(void *)(v23 + 56) + (v24 << 6));
  v0[98] = v26[1];
  v0[99] = v26[2];
  v0[100] = v26[3];
  v0[101] = v26[4];
  v0[102] = v26[5];
  v0[103] = v26[6];
  v0[104] = v26[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_10000E0F0();
  if (!v27) {
    goto LABEL_17;
  }
  uint64_t v28 = v0[76];
  uint64_t v29 = v0[75];
  uint64_t v30 = v0[74];
  sub_10000DF00();
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v28 + 48))(v30, 1, v29) == 1)
  {
    sub_10000C130(v0[74], &qword_1000143F8);
LABEL_17:
    uint64_t v31 = v0[65];
    uint64_t v32 = v0[63];
    uint64_t v33 = v0[64];
    uint64_t v34 = sub_10000E150();
    unint64_t v36 = v35;
    v0[107] = v35;
    sub_10000E190();
    if (!v36)
    {
      uint64_t v34 = 0;
      unint64_t v36 = 0xE000000000000000;
    }
    (*(void (**)(uint64_t, void, uint64_t))(v33 + 104))(v31, enum case for FirstPartyApps.none(_:), v32);
    uint64_t v37 = (void *)swift_task_alloc();
    v0[108] = v37;
    *uint64_t v37 = v0;
    v37[1] = sub_100009510;
    uint64_t v38 = v0[65];
    return static AppBundleResolver.resolveThumbnail(_:_:)(v34, v36, v38);
  }
  (*(void (**)(void, void, void))(v0[76] + 32))(v0[81], v0[74], v0[75]);
  uint64_t v40 = dword_100014450;
  v41 = (void *)swift_task_alloc();
  v0[105] = v41;
  void *v41 = v0;
  v41[1] = sub_100006DF4;
  uint64_t v42 = v0[81];
  return ((uint64_t (*)(uint64_t))((char *)&dword_100014450 + v40))(v42);
}

uint64_t sub_100006DF4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (void *)*v2;
  v3[11] = v2;
  v3[12] = a1;
  v3[13] = a2;
  v3[106] = a2;
  swift_task_dealloc();
  return _swift_task_switch(sub_100006F28, 0, 0);
}

uint64_t sub_100006F28()
{
  v298 = v0;
  uint64_t v1 = v0;
  unint64_t v2 = v0[106];
  if (v2 >> 60 == 15)
  {
    (*(void (**)(void, void))(v0[76] + 8))(v0[81], v0[75]);
LABEL_6:
    uint64_t v15 = v1[65];
    uint64_t v17 = v1[63];
    uint64_t v16 = v1[64];
    uint64_t v18 = sub_10000E150();
    unint64_t v20 = v19;
    v1[107] = v19;
    sub_10000E190();
    if (!v20)
    {
      uint64_t v18 = 0;
      unint64_t v20 = 0xE000000000000000;
    }
    (*(void (**)(uint64_t, void, uint64_t))(v16 + 104))(v15, enum case for FirstPartyApps.none(_:), v17);
    uint64_t v21 = (void *)swift_task_alloc();
    v1[108] = v21;
    *uint64_t v21 = v1;
    v21[1] = sub_100009510;
    uint64_t v22 = v1[65];
    return static AppBundleResolver.resolveThumbnail(_:_:)(v18, v20, v22);
  }
  uint64_t v3 = v0[12];
  uint64_t v4 = v0[81];
  uint64_t v5 = v0[76];
  uint64_t v6 = v1[75];
  id v7 = objc_allocWithZone((Class)UIImage);
  Class isa = sub_10000DF30().super.isa;
  uint64_t v9 = (UIImage *)[v7 initWithData:isa];
  sub_10000BCB0(v3, v2);

  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
  if (!v9) {
    goto LABEL_6;
  }
  uint64_t v10 = v1[76];
  uint64_t v11 = v1[75];
  uint64_t v12 = v1[73];
  uint64_t v13 = v1[40];
  sub_10000DEB0();
  v1[29] = &_swiftEmptyArrayStorage;
  sub_10000C2C8(v13, v12, &qword_1000143F8);
  uint64_t v14 = *(unsigned int (**)(void, void, void))(v10 + 48);
  v293 = v1;
  v284 = v9;
  if (v14(v12, 1, v11) == 1)
  {
    sub_10000C130(v1[73], &qword_1000143F8);
  }
  else
  {
    uint64_t v23 = v1[59];
    uint64_t v24 = v1[60];
    uint64_t v25 = v1[58];
    (*(void (**)(void, void, void))(v1[76] + 32))(v1[80], v1[73], v1[75]);
    sub_10000DE90();
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v24 + 48))(v25, 1, v23) == 1)
    {
      uint64_t v26 = v1[58];
      (*(void (**)(void, void))(v1[76] + 8))(v1[80], v1[75]);
      sub_10000C130(v26, &qword_1000143F0);
    }
    else
    {
      (*(void (**)(void, void, void))(v1[60] + 32))(v1[61], v1[58], v1[59]);
      uint64_t v27 = sub_10000DE70();
      if (v27)
      {
        uint64_t v28 = v27;
        v279 = v14;
        uint64_t v29 = v1[80];
        uint64_t v288 = *(void *)(v27 + 16);
        if (v288)
        {
          sub_10000E240();
          sub_10000E270();
          sub_10000C280(&qword_100014438, (void (*)(uint64_t))&type metadata accessor for ATPayload);
          sub_10000C280(&qword_100014440, (void (*)(uint64_t))&type metadata accessor for ATPayload);
          sub_10000E230();
          uint64_t v38 = (void *)v1[36];
          v39 = (void *)sub_10000E260();
          sub_10000DF90();
          uint64_t v41 = v40;

          if (!v41)
          {
            uint64_t v42 = (void *)sub_10000E260();
            sub_10000DFA0();
          }
          uint64_t v43 = v1[52];
          sub_10000E120();

          unint64_t v44 = v28 + ((*(unsigned __int8 *)(v43 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v43 + 80));
          v45 = (void (**)(uint64_t, uint64_t))(v43 + 8);
          uint64_t v285 = v28;
          swift_bridgeObjectRetain();
          uint64_t v46 = 0;
          while (1)
          {
            uint64_t v47 = v46 + 1;
            if (__OFADD__(v46, 1)) {
              __break(1u);
            }
            (*(void (**)(void, unint64_t, void))(v43 + 16))(v293[54], v44 + *(void *)(v43 + 72) * v46, v293[51]);
            uint64_t v48 = sub_10000DE50();
            uint64_t v50 = v293[54];
            uint64_t v51 = v293[51];
            if (v48 == 0x69616E626D756874 && v49 == 0xED0000617461446CLL) {
              break;
            }
            char v53 = sub_10000E450();
            swift_bridgeObjectRelease();
            (*v45)(v50, v51);
            if ((v53 & 1) == 0)
            {
              ++v46;
              if (v47 != v288) {
                continue;
              }
            }
            goto LABEL_30;
          }
          swift_bridgeObjectRelease();
          (*v45)(v50, v51);
          char v53 = 1;
LABEL_30:
          uint64_t v1 = v293;
          uint64_t v289 = v293[80];
          uint64_t v54 = v293[76];
          uint64_t v275 = v293[75];
          uint64_t v56 = v293[60];
          uint64_t v55 = v293[61];
          uint64_t v57 = v293[59];
          uint64_t v59 = v293[56];
          uint64_t v58 = v293[57];
          uint64_t v60 = v293[55];
          swift_bridgeObjectRelease();
          (*(void (**)(uint64_t, uint64_t))(v59 + 8))(v58, v60);
          (*(void (**)(uint64_t, uint64_t))(v56 + 8))(v55, v57);
          (*(void (**)(uint64_t, uint64_t))(v54 + 8))(v289, v275);
          swift_bridgeObjectRelease();
          v293[29] = v285;
          uint64_t v14 = v279;
          uint64_t v9 = v284;
          if (v53)
          {
            sub_10000E000();
            v61 = sub_10000DF70();
            os_log_type_t v62 = sub_10000E3C0();
            if (os_log_type_enabled(v61, v62))
            {
              v63 = (uint8_t *)swift_slowAlloc();
              *(_WORD *)v63 = 0;
              _os_log_impl((void *)&_mh_execute_header, v61, v62, "AskTo supplied the thumbnail data. Removing the existing thumbnailData.", v63, 2u);
              swift_slowDealloc();
            }
            uint64_t v64 = v293[50];
            uint64_t v65 = v293[41];
            uint64_t v66 = v293[42];

            (*(void (**)(uint64_t, uint64_t))(v66 + 8))(v64, v65);
            goto LABEL_37;
          }
        }
        else
        {
          uint64_t v33 = v1[76];
          uint64_t v34 = v1[75];
          uint64_t v36 = v1[60];
          uint64_t v35 = v1[61];
          uint64_t v37 = v1[59];
          swift_bridgeObjectRelease();
          (*(void (**)(uint64_t, uint64_t))(v36 + 8))(v35, v37);
          (*(void (**)(uint64_t, uint64_t))(v33 + 8))(v29, v34);
          uint64_t v14 = v279;
        }
      }
      else
      {
        uint64_t v30 = v1[80];
        uint64_t v31 = v1[76];
        uint64_t v32 = v1[75];
        (*(void (**)(void, void))(v1[60] + 8))(v1[61], v1[59]);
        (*(void (**)(uint64_t, uint64_t))(v31 + 8))(v30, v32);
      }
    }
  }
  uint64_t v67 = sub_10000E0D0();
  unint64_t v69 = v68;
  sub_10000BCB0(v67, v68);
  if (v69 >> 60 != 15) {
    goto LABEL_38;
  }
  v70 = UIImagePNGRepresentation(v9);
  if (v70)
  {
    v71 = v70;
    sub_10000DF40();
  }
LABEL_37:
  sub_10000E0E0();
LABEL_38:
  sub_10000E070();
  sub_10000E000();
  uint64_t v72 = v1[29];
  swift_bridgeObjectRetain_n();
  v73 = sub_10000DF70();
  os_log_type_t v74 = sub_10000E3C0();
  if (os_log_type_enabled(v73, v74))
  {
    os_log_type_t v263 = v74;
    v267 = v73;
    v280 = v14;
    uint64_t v75 = swift_slowAlloc();
    uint64_t v296 = swift_slowAlloc();
    *(_DWORD *)uint64_t v75 = 134218242;
    v1[34] = *(void *)(v72 + 16);
    sub_10000E3D0();
    swift_bridgeObjectRelease();
    v265 = (uint8_t *)v75;
    *(_WORD *)(v75 + 12) = 2080;
    int64_t v76 = *(void *)(v72 + 16);
    if (v76)
    {
      uint64_t v77 = v1[52];
      v297[0] = (uint64_t)&_swiftEmptyArrayStorage;
      swift_bridgeObjectRetain();
      sub_1000056EC(0, v76, 0);
      v78 = *(void (**)(uint64_t, uint64_t, uint64_t))(v77 + 16);
      v77 += 16;
      v290 = v78;
      uint64_t v79 = v72 + ((*(unsigned __int8 *)(v77 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v77 + 64));
      uint64_t v286 = *(void *)(v77 + 56);
      v80 = (void (**)(uint64_t, uint64_t))(v77 - 8);
      do
      {
        uint64_t v81 = v1[53];
        uint64_t v82 = v1[51];
        v290(v81, v79, v82);
        uint64_t v83 = sub_10000DE50();
        uint64_t v85 = v84;
        (*v80)(v81, v82);
        uint64_t v86 = v297[0];
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_1000056EC(0, *(void *)(v297[0] + 16) + 1, 1);
          uint64_t v86 = v297[0];
        }
        unint64_t v88 = *(void *)(v86 + 16);
        unint64_t v87 = *(void *)(v86 + 24);
        if (v88 >= v87 >> 1)
        {
          sub_1000056EC(v87 > 1, v88 + 1, 1);
          uint64_t v86 = v297[0];
        }
        *(void *)(v86 + 16) = v88 + 1;
        uint64_t v89 = v86 + 16 * v88;
        *(void *)(v89 + 32) = v83;
        *(void *)(v89 + 40) = v85;
        v79 += v286;
        --v76;
        uint64_t v1 = v293;
      }
      while (v76);
      swift_bridgeObjectRelease();
    }
    uint64_t v95 = v1[49];
    uint64_t v96 = v1[41];
    uint64_t v97 = v1[42];
    uint64_t v98 = sub_10000E340();
    unint64_t v100 = v99;
    swift_bridgeObjectRelease();
    v1[35] = sub_10000C814(v98, v100, &v296);
    sub_10000E3D0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v267, v263, "Appending %ld additional components to conversation url: %s", v265, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    v94 = *(void (**)(uint64_t, uint64_t))(v97 + 8);
    v94(v95, v96);
    uint64_t v14 = v280;
    uint64_t v9 = v284;
  }
  else
  {
    v90 = v73;
    uint64_t v91 = v1[49];
    uint64_t v92 = v1[41];
    uint64_t v93 = v1[42];
    swift_bridgeObjectRelease_n();

    v94 = *(void (**)(uint64_t, uint64_t))(v93 + 8);
    v94(v91, v92);
  }
  uint64_t v101 = v1[75];
  uint64_t v102 = v1[72];
  swift_beginAccess();
  sub_100004274(v1[29]);
  sub_10000DE80();
  sub_10000DEA0();
  if (v14(v102, 1, v101) == 1)
  {
    uint64_t v294 = v1[92];
    uint64_t v103 = v1[91];
    uint64_t v291 = v1[90];
    uint64_t v104 = v1[89];
    uint64_t v276 = v1[83];
    v281 = (void (*)(uint64_t, uint64_t))v1[96];
    uint64_t v105 = v1[72];
    uint64_t v106 = v1[62];
    uint64_t v108 = v1[59];
    uint64_t v107 = v1[60];
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_10000C130(v105, &qword_1000143F8);
    sub_10000DFE0();
    swift_willThrow();
    (*(void (**)(uint64_t, uint64_t))(v107 + 8))(v106, v108);
    v281(v104, v276);
    (*(void (**)(uint64_t, uint64_t))(v103 + 8))(v294, v291);
LABEL_106:

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
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    v251 = (uint64_t (*)(void))v1[1];
    return v251();
  }
  v277 = v1 + 31;
  int v109 = *((unsigned __int8 *)v1 + 880);
  (*(void (**)(void, void, void))(v1[76] + 32))(v1[79], v1[72], v1[75]);
  v292 = v94;
  if (v109 != 1)
  {
    id v123 = [objc_allocWithZone((Class)MSMessageTemplateLayout) init];
    [v123 setImage:v9];
    sub_10000E110();
    NSString v124 = sub_10000E2A0();
    swift_bridgeObjectRelease();
    [v123 setCaption:v124];

    id v125 = [objc_allocWithZone((Class)MSMessageLiveLayout) initWithAlternateLayout:v123];
    goto LABEL_88;
  }
  uint64_t v110 = v1[89];
  uint64_t v111 = v1[87];
  uint64_t v112 = v1[84];
  uint64_t v113 = v1[83];
  sub_10000E000();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v112 + 16))(v111, v110, v113);
  v114 = sub_10000DF70();
  os_log_type_t v115 = sub_10000E3A0();
  BOOL v116 = os_log_type_enabled(v114, v115);
  uint64_t v117 = v1[87];
  uint64_t v118 = v1[83];
  uint64_t v119 = v1[48];
  uint64_t v268 = v1[41];
  v282 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v14;
  if (v116)
  {
    v261 = (void (*)(uint64_t, uint64_t))v1[96];
    v120 = (uint8_t *)swift_slowAlloc();
    v297[0] = swift_slowAlloc();
    *(_DWORD *)v120 = 136315138;
    uint64_t v121 = sub_10000E080();
    v1[33] = sub_10000C814(v121, v122, v297);
    uint64_t v1 = v293;
    sub_10000E3D0();
    swift_bridgeObjectRelease();
    v261(v117, v118);
    _os_log_impl((void *)&_mh_execute_header, v114, v115, "Using LP fallback for %s", v120, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    ((void (*)(uint64_t, uint64_t))v1[96])(v117, v118);
  }

  v94(v119, v268);
  uint64_t v126 = enum case for MessageDetails.EventSource.screenTime(_:);
  ((void (*)(void, void, void))v1[93])(v1[86], enum case for MessageDetails.EventSource.screenTime(_:), v1[83]);
  sub_10000E320();
  sub_10000E320();
  v127 = (void (*)(uint64_t, uint64_t))v1[96];
  uint64_t v128 = v1[86];
  uint64_t v129 = v1[83];
  uint64_t v9 = v284;
  if (v1[21] == v1[23] && v1[22] == v1[24])
  {
    swift_bridgeObjectRelease_n();
    v127(v128, v129);
LABEL_60:
    sub_10000E2F0();
    sub_10000BC6C(&qword_100014428);
    uint64_t v131 = swift_allocObject();
    *(_OWORD *)(v131 + 16) = xmmword_10000F250;
    uint64_t v132 = sub_10000E160();
    uint64_t v134 = v133;
    *(void *)(v131 + 56) = &type metadata for String;
    unint64_t v135 = sub_10000BE30();
    *(void *)(v131 + 64) = v135;
    *(void *)(v131 + 32) = v132;
    *(void *)(v131 + 40) = v134;
    uint64_t v136 = sub_10000E130();
    *(void *)(v131 + 96) = &type metadata for String;
    *(void *)(v131 + 104) = v135;
    uint64_t v1 = v293;
    *(void *)(v131 + 72) = v136;
    *(void *)(v131 + 80) = v137;
    sub_10000E2C0();
    swift_bridgeObjectRelease();
    goto LABEL_67;
  }
  char v130 = sub_10000E450();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v127(v128, v129);
  if (v130) {
    goto LABEL_60;
  }
  sub_10000E130();
  uint64_t v138 = sub_10000E2E0();
  uint64_t v140 = v139;
  swift_bridgeObjectRelease();
  if (v138 == sub_10000E100() && v140 == v141)
  {
    swift_bridgeObjectRelease_n();
  }
  else
  {
    char v142 = sub_10000E450();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v142 & 1) == 0)
    {
      sub_10000E130();
      goto LABEL_67;
    }
  }
  sub_10000E110();
LABEL_67:
  v143 = (void (*)(uint64_t, uint64_t, uint64_t))v1[93];
  uint64_t v144 = v1[85];
  uint64_t v145 = v1[83];
  (*(void (**)(void, uint64_t, uint64_t, void))(v1[76] + 56))(v1[71], 1, 1, v1[75]);
  v143(v144, v126, v145);
  sub_10000E320();
  sub_10000E320();
  v146 = (void (*)(uint64_t, uint64_t))v1[96];
  uint64_t v147 = v1[85];
  uint64_t v148 = v1[83];
  if (v1[25] == v1[27] && v1[26] == v1[28])
  {
    swift_bridgeObjectRelease_n();
    v146(v147, v148);
  }
  else
  {
    char v149 = sub_10000E450();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v146(v147, v148);
    if ((v149 & 1) == 0)
    {
      sub_10000E1F0();
      sub_10000E1E0();
      sub_10000E1A0();
      goto LABEL_73;
    }
  }
  sub_10000E1F0();
  sub_10000E1E0();
  sub_10000E1B0();
LABEL_73:
  swift_release();
  sub_10000E300();
  uint64_t v151 = v150;
  swift_bridgeObjectRelease();
  if (v151)
  {
    uint64_t v152 = v1[71];
    uint64_t v153 = v1[70];
    sub_10000DF00();
    swift_bridgeObjectRelease();
    sub_10000BD74(v153, v152);
  }
  uint64_t v154 = v1[75];
  uint64_t v155 = v1[69];
  sub_10000C2C8(v1[71], v155, &qword_1000143F8);
  LODWORD(v154) = v282(v155, 1, v154);
  sub_10000C130(v155, &qword_1000143F8);
  if (v154 == 1)
  {
    uint64_t v156 = v1[71];
    uint64_t v157 = v1[70];
    sub_10000DF00();
    sub_10000BD74(v157, v156);
  }
  sub_10000E000();
  v158 = sub_10000DF70();
  os_log_type_t v159 = sub_10000E3A0();
  if (os_log_type_enabled(v158, v159))
  {
    uint64_t v160 = v1[75];
    v161 = v1;
    uint64_t v162 = v1[71];
    v163 = (uint8_t *)swift_slowAlloc();
    v164 = (void *)swift_slowAlloc();
    *(_DWORD *)v163 = 138412290;
    swift_beginAccess();
    if (v282(v162, 1, v160))
    {
      void *v277 = 0;
      sub_10000E3D0();
      uint64_t v165 = 0;
    }
    else
    {
      uint64_t v166 = v161[78];
      uint64_t v167 = v161[76];
      uint64_t v168 = v161[75];
      (*(void (**)(uint64_t, void, uint64_t))(v167 + 16))(v166, v161[71], v168);
      uint64_t v169 = sub_10000DED0();
      uint64_t v269 = v170;
      (*(void (**)(uint64_t, uint64_t))(v167 + 8))(v166, v168);
      sub_10000BDDC();
      swift_allocError();
      uint64_t *v171 = v169;
      v171[1] = v269;
      uint64_t v165 = _swift_stdlib_bridgeErrorToNSError();
      v161[32] = v165;
      sub_10000E3D0();
    }
    uint64_t v1 = v161;
    void *v164 = v165;
    _os_log_impl((void *)&_mh_execute_header, v158, v159, "alternate url %@", v163, 0xCu);
    sub_10000BC6C(&qword_100014418);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
    uint64_t v9 = v284;
  }
  uint64_t v172 = v1[75];
  uint64_t v173 = v1[71];
  uint64_t v174 = v1[68];
  uint64_t v175 = v1[47];
  uint64_t v176 = v1[41];

  v94 = v292;
  v292(v175, v176);
  swift_beginAccess();
  sub_10000C2C8(v173, v174, &qword_1000143F8);
  v178 = 0;
  if (v282(v174, 1, v172) != 1)
  {
    uint64_t v179 = v1[76];
    uint64_t v180 = v1[75];
    uint64_t v181 = v1[68];
    sub_10000DEE0(v177);
    v178 = v182;
    (*(void (**)(uint64_t, uint64_t))(v179 + 8))(v181, v180);
  }
  NSString v183 = sub_10000E2A0();
  swift_bridgeObjectRelease();
  v184 = UIImagePNGRepresentation(v9);
  if (v184)
  {
    v185 = v184;
    uint64_t v186 = sub_10000DF40();
    unint64_t v188 = v187;

    v189.super.Class isa = sub_10000DF30().super.isa;
    sub_10000BCC4(v186, v188);
  }
  else
  {
    v189.super.Class isa = 0;
  }
  uint64_t v190 = v1[104];
  uint64_t v191 = v1[103];
  uint64_t v192 = v1[71];
  id v193 = [self createRichLinkLayoutWithURL:v178 title:v183 imageData:v189.super.isa];

  id v194 = [objc_allocWithZone((Class)MSMessageLiveLayout) initWithAlternateLayout:v193];
  sub_10000BC6C(&qword_100014410);
  uint64_t v195 = swift_allocObject();
  *(_OWORD *)(v195 + 16) = xmmword_10000F260;
  *(void *)(v195 + 32) = v191;
  *(void *)(v195 + 40) = v190;
  swift_bridgeObjectRetain();
  id v125 = v194;
  Class v196 = sub_10000E330().super.isa;
  swift_bridgeObjectRelease();
  [v125 setPpl_requiredCapabilities:v196];

  sub_10000C130(v192, &qword_1000143F8);
LABEL_88:
  v283 = v125;
  id v197 = [objc_allocWithZone((Class)MSSession) init];
  id v198 = [objc_allocWithZone((Class)MSMessage) initWithSession:v197];

  sub_10000DEE0(v199);
  v201 = v200;
  [v198 setURL:v200];

  [v198 setLayout:v125];
  sub_10000E110();
  NSString v202 = sub_10000E2A0();
  swift_bridgeObjectRelease();
  [v198 setSummaryText:v202];

  sub_10000E000();
  id v203 = v198;
  v204 = sub_10000DF70();
  os_log_type_t v205 = sub_10000E3A0();
  v287 = v203;
  if (os_log_type_enabled(v204, v205))
  {
    v206 = (uint8_t *)swift_slowAlloc();
    v297[0] = swift_slowAlloc();
    *(_DWORD *)v206 = 136315138;
    id v207 = [v203 URL];
    if (v207)
    {
      v208 = v207;
      sub_10000DEF0();

      uint64_t v209 = 0;
    }
    else
    {
      uint64_t v209 = 1;
    }
    uint64_t v212 = v1[76];
    uint64_t v213 = v1[75];
    uint64_t v214 = v1[67];
    uint64_t v273 = v1[46];
    uint64_t v215 = v293[41];
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v212 + 56))(v214, v209, 1, v213);
    uint64_t v216 = sub_10000E2D0();
    v293[30] = sub_10000C814(v216, v217, v297);
    sub_10000E3D0();
    swift_bridgeObjectRelease();

    _os_log_impl((void *)&_mh_execute_header, v204, v205, "message url %s", v206, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    id v203 = v287;
    uint64_t v218 = v215;
    uint64_t v1 = v293;
    v292(v273, v218);
    uint64_t v9 = v284;
  }
  else
  {
    uint64_t v210 = v1[46];
    uint64_t v211 = v1[41];

    v94(v210, v211);
  }
  v219 = v9;
  v220 = UIImageJPEGRepresentation(v219, 0.4);
  if (v220)
  {
    uint64_t v221 = sub_10000DF40();
    unint64_t v223 = v222;

    sub_10000BD1C(v221, v223);
    v220 = (NSData *)sub_10000DF30().super.isa;
    uint64_t v274 = v221;
    unint64_t v278 = v223;
    sub_10000BCC4(v221, v223);
  }
  else
  {

    uint64_t v274 = 0;
    unint64_t v278 = 0xF000000000000000;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_10000E2F0();
  swift_bridgeObjectRelease();
  NSString v224 = sub_10000E2A0();
  swift_bridgeObjectRelease();
  id v225 = [v203 ppl_pluginPayloadWithAppIconData:v220 appName:v224 allowDataPayloads:0];

  id v226 = [v225 data];
  v284 = v219;
  if (!v226)
  {
    sub_10000E000();
    v241 = sub_10000DF70();
    uint64_t v242 = sub_10000E3B0();
    if (os_log_type_enabled(v241, (os_log_type_t)v242))
    {
      v243 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v243 = 0;
      _os_log_impl((void *)&_mh_execute_header, v241, (os_log_type_t)v242, "Message _pluginPayload create failed", v243, 2u);
      swift_slowDealloc();
    }
    v271 = (void (*)(uint64_t, uint64_t))v1[96];
    uint64_t v295 = v1[92];
    uint64_t v244 = v1[91];
    uint64_t v272 = v1[90];
    uint64_t v266 = v1[83];
    uint64_t v270 = v1[89];
    uint64_t v245 = v1[79];
    uint64_t v246 = v1[76];
    uint64_t v247 = v1[75];
    uint64_t v248 = v1[60];
    uint64_t v262 = v1[59];
    uint64_t v264 = v1[62];
    uint64_t v249 = v1[44];
    uint64_t v250 = v1[41];

    v292(v249, v250);
    sub_10000DFE0();
    swift_willThrow();

    sub_10000BCB0(v274, v278);
    (*(void (**)(uint64_t, uint64_t))(v246 + 8))(v245, v247);
    (*(void (**)(uint64_t, uint64_t))(v248 + 8))(v264, v262);
    v271(v270, v266);
    (*(void (**)(uint64_t, uint64_t))(v244 + 8))(v295, v272);
    goto LABEL_106;
  }
  uint64_t v227 = sub_10000DF40();
  uint64_t v253 = v228;
  uint64_t v254 = v227;

  sub_10000E000();
  v229 = sub_10000DF70();
  os_log_type_t v230 = sub_10000E3A0();
  if (os_log_type_enabled(v229, v230))
  {
    v231 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v231 = 0;
    _os_log_impl((void *)&_mh_execute_header, v229, v230, "SPI Payload successful!", v231, 2u);
    swift_slowDealloc();
  }
  v258 = (void (*)(uint64_t, uint64_t))v1[96];
  uint64_t v232 = v1[91];
  uint64_t v259 = v1[90];
  uint64_t v260 = v1[92];
  uint64_t v256 = v1[83];
  uint64_t v257 = v1[89];
  uint64_t v255 = v1[79];
  uint64_t v233 = v1[76];
  uint64_t v234 = v1[75];
  uint64_t v235 = v1[62];
  uint64_t v236 = v1[60];
  uint64_t v237 = v293[59];
  uint64_t v238 = v293[45];
  uint64_t v239 = v293[41];

  sub_10000BCB0(v274, v278);
  v292(v238, v239);
  (*(void (**)(uint64_t, uint64_t))(v233 + 8))(v255, v234);
  (*(void (**)(uint64_t, uint64_t))(v236 + 8))(v235, v237);
  v258(v257, v256);
  (*(void (**)(uint64_t, uint64_t))(v232 + 8))(v260, v259);

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
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  v240 = (uint64_t (*)(uint64_t, uint64_t))v293[1];
  return v240(v254, v253);
}

uint64_t sub_100009510(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (void *)*v2;
  uint64_t v4 = (void *)*v2;
  v4[14] = v2;
  v4[15] = a1;
  v4[16] = a2;
  uint64_t v5 = v3[65];
  uint64_t v6 = v3[64];
  uint64_t v7 = v3[63];
  v4[109] = a2;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);
  return _swift_task_switch(sub_1000096D0, 0, 0);
}

uint64_t sub_1000096D0()
{
  v290 = v0;
  uint64_t v1 = v0;
  unint64_t v2 = v0[109];
  if (v2 >> 60 == 15
    || (uint64_t v3 = v0[15],
        id v4 = objc_allocWithZone((Class)UIImage),
        Class isa = sub_10000DF30().super.isa,
        uint64_t v6 = (UIImage *)[v4 initWithData:isa],
        sub_10000BCB0(v3, v2),
        isa,
        !v6))
  {
    NSString v7 = sub_10000E2A0();
    uint64_t v6 = (UIImage *)[self imageNamed:v7];
  }
  os_log_type_t v263 = (void **)(v0 + 36);
  uint64_t v8 = v0[76];
  uint64_t v9 = v0[75];
  uint64_t v10 = v0[73];
  uint64_t v11 = v0[40];
  sub_10000DEB0();
  v0[29] = &_swiftEmptyArrayStorage;
  sub_10000C2C8(v11, v10, &qword_1000143F8);
  uint64_t v12 = *(unsigned int (**)(void, void, void))(v8 + 48);
  uint64_t v285 = v0;
  uint64_t v276 = v6;
  if (v12(v10, 1, v9) == 1)
  {
    sub_10000C130(v0[73], &qword_1000143F8);
  }
  else
  {
    uint64_t v13 = v0[59];
    uint64_t v14 = v0[60];
    uint64_t v15 = v1[58];
    (*(void (**)(void, void, void))(v1[76] + 32))(v1[80], v1[73], v1[75]);
    sub_10000DE90();
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v14 + 48))(v15, 1, v13) == 1)
    {
      uint64_t v16 = v1[58];
      (*(void (**)(void, void))(v1[76] + 8))(v1[80], v1[75]);
      sub_10000C130(v16, &qword_1000143F0);
    }
    else
    {
      (*(void (**)(void, void, void))(v1[60] + 32))(v1[61], v1[58], v1[59]);
      uint64_t v17 = sub_10000DE70();
      if (v17)
      {
        uint64_t v18 = v17;
        v271 = v12;
        uint64_t v19 = v1[80];
        uint64_t v280 = *(void *)(v17 + 16);
        if (v280)
        {
          sub_10000E240();
          sub_10000E270();
          sub_10000C280(&qword_100014438, (void (*)(uint64_t))&type metadata accessor for ATPayload);
          sub_10000C280(&qword_100014440, (void (*)(uint64_t))&type metadata accessor for ATPayload);
          sub_10000E230();
          uint64_t v28 = *v263;
          uint64_t v29 = (void *)sub_10000E260();
          sub_10000DF90();
          uint64_t v31 = v30;

          if (!v31)
          {
            uint64_t v32 = (void *)sub_10000E260();
            sub_10000DFA0();
          }
          uint64_t v33 = v1[52];
          sub_10000E120();

          unint64_t v34 = v18 + ((*(unsigned __int8 *)(v33 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v33 + 80));
          uint64_t v35 = (void (**)(uint64_t, uint64_t))(v33 + 8);
          uint64_t v277 = v18;
          swift_bridgeObjectRetain();
          uint64_t v36 = 0;
          while (1)
          {
            uint64_t v37 = v36 + 1;
            if (__OFADD__(v36, 1)) {
              __break(1u);
            }
            (*(void (**)(void, unint64_t, void))(v33 + 16))(v285[54], v34 + *(void *)(v33 + 72) * v36, v285[51]);
            uint64_t v38 = sub_10000DE50();
            uint64_t v40 = v285[54];
            uint64_t v41 = v285[51];
            if (v38 == 0x69616E626D756874 && v39 == 0xED0000617461446CLL) {
              break;
            }
            char v43 = sub_10000E450();
            swift_bridgeObjectRelease();
            (*v35)(v40, v41);
            if ((v43 & 1) == 0)
            {
              ++v36;
              if (v37 != v280) {
                continue;
              }
            }
            goto LABEL_25;
          }
          swift_bridgeObjectRelease();
          (*v35)(v40, v41);
          char v43 = 1;
LABEL_25:
          uint64_t v1 = v285;
          uint64_t v281 = v285[80];
          uint64_t v44 = v285[76];
          uint64_t v267 = v285[75];
          uint64_t v46 = v285[60];
          uint64_t v45 = v285[61];
          uint64_t v47 = v285[59];
          uint64_t v49 = v285[56];
          uint64_t v48 = v285[57];
          uint64_t v50 = v285[55];
          swift_bridgeObjectRelease();
          (*(void (**)(uint64_t, uint64_t))(v49 + 8))(v48, v50);
          (*(void (**)(uint64_t, uint64_t))(v46 + 8))(v45, v47);
          (*(void (**)(uint64_t, uint64_t))(v44 + 8))(v281, v267);
          swift_bridgeObjectRelease();
          v285[29] = v277;
          uint64_t v12 = v271;
          uint64_t v6 = v276;
          if (v43)
          {
            sub_10000E000();
            uint64_t v51 = sub_10000DF70();
            os_log_type_t v52 = sub_10000E3C0();
            if (os_log_type_enabled(v51, v52))
            {
              char v53 = (uint8_t *)swift_slowAlloc();
              *(_WORD *)char v53 = 0;
              _os_log_impl((void *)&_mh_execute_header, v51, v52, "AskTo supplied the thumbnail data. Removing the existing thumbnailData.", v53, 2u);
              swift_slowDealloc();
            }
            uint64_t v54 = v285[50];
            uint64_t v55 = v285[41];
            uint64_t v56 = v285[42];

            (*(void (**)(uint64_t, uint64_t))(v56 + 8))(v54, v55);
            goto LABEL_33;
          }
        }
        else
        {
          uint64_t v23 = v1[76];
          uint64_t v24 = v1[75];
          uint64_t v26 = v1[60];
          uint64_t v25 = v1[61];
          uint64_t v27 = v1[59];
          swift_bridgeObjectRelease();
          (*(void (**)(uint64_t, uint64_t))(v26 + 8))(v25, v27);
          (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v19, v24);
          uint64_t v12 = v271;
        }
      }
      else
      {
        uint64_t v20 = v1[80];
        uint64_t v21 = v1[76];
        uint64_t v22 = v1[75];
        (*(void (**)(void, void))(v1[60] + 8))(v1[61], v1[59]);
        (*(void (**)(uint64_t, uint64_t))(v21 + 8))(v20, v22);
      }
    }
  }
  uint64_t v57 = sub_10000E0D0();
  unint64_t v59 = v58;
  sub_10000BCB0(v57, v58);
  if (v59 >> 60 != 15) {
    goto LABEL_34;
  }
  if (v6)
  {
    uint64_t v60 = UIImagePNGRepresentation(v6);
    if (v60)
    {
      v61 = v60;
      sub_10000DF40();
    }
  }
LABEL_33:
  sub_10000E0E0();
LABEL_34:
  sub_10000E070();
  sub_10000E000();
  uint64_t v62 = v1[29];
  swift_bridgeObjectRetain_n();
  v63 = sub_10000DF70();
  os_log_type_t v64 = sub_10000E3C0();
  if (os_log_type_enabled(v63, v64))
  {
    v258 = v63;
    uint64_t v272 = v12;
    uint64_t v65 = swift_slowAlloc();
    uint64_t v288 = swift_slowAlloc();
    *(_DWORD *)uint64_t v65 = 134218242;
    v1[34] = *(void *)(v62 + 16);
    sub_10000E3D0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v65 + 12) = 2080;
    int64_t v66 = *(void *)(v62 + 16);
    uint64_t v256 = (uint8_t *)v65;
    os_log_type_t v254 = v64;
    if (v66)
    {
      uint64_t v67 = v1[52];
      v289[0] = (uint64_t)&_swiftEmptyArrayStorage;
      swift_bridgeObjectRetain();
      sub_1000056EC(0, v66, 0);
      unint64_t v68 = *(void (**)(uint64_t, uint64_t, uint64_t))(v67 + 16);
      v67 += 16;
      v282 = v68;
      uint64_t v69 = v62 + ((*(unsigned __int8 *)(v67 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v67 + 64));
      uint64_t v278 = *(void *)(v67 + 56);
      v70 = (void (**)(uint64_t, uint64_t))(v67 - 8);
      do
      {
        uint64_t v71 = v1[53];
        uint64_t v72 = v1[51];
        v282(v71, v69, v72);
        uint64_t v73 = sub_10000DE50();
        uint64_t v75 = v74;
        (*v70)(v71, v72);
        uint64_t v76 = v289[0];
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_1000056EC(0, *(void *)(v289[0] + 16) + 1, 1);
          uint64_t v76 = v289[0];
        }
        unint64_t v78 = *(void *)(v76 + 16);
        unint64_t v77 = *(void *)(v76 + 24);
        if (v78 >= v77 >> 1)
        {
          sub_1000056EC(v77 > 1, v78 + 1, 1);
          uint64_t v76 = v289[0];
        }
        *(void *)(v76 + 16) = v78 + 1;
        uint64_t v79 = v76 + 16 * v78;
        *(void *)(v79 + 32) = v73;
        *(void *)(v79 + 40) = v75;
        v69 += v278;
        --v66;
        uint64_t v1 = v285;
      }
      while (v66);
      swift_bridgeObjectRelease();
    }
    uint64_t v84 = v1[49];
    uint64_t v85 = v1[41];
    uint64_t v86 = v1[42];
    uint64_t v87 = sub_10000E340();
    unint64_t v89 = v88;
    swift_bridgeObjectRelease();
    v1[35] = sub_10000C814(v87, v89, &v288);
    sub_10000E3D0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v258, v254, "Appending %ld additional components to conversation url: %s", v256, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    uint64_t v83 = *(void (**)(uint64_t, uint64_t))(v86 + 8);
    v83(v84, v85);
    uint64_t v12 = v272;
    uint64_t v6 = v276;
  }
  else
  {
    uint64_t v80 = v1[49];
    uint64_t v81 = v1[41];
    uint64_t v82 = v1[42];
    swift_bridgeObjectRelease_n();

    uint64_t v83 = *(void (**)(uint64_t, uint64_t))(v82 + 8);
    v83(v80, v81);
  }
  uint64_t v90 = v1[75];
  uint64_t v91 = v1[72];
  swift_beginAccess();
  sub_100004274(v1[29]);
  sub_10000DE80();
  sub_10000DEA0();
  if (v12(v91, 1, v90) == 1)
  {
    uint64_t v286 = v1[92];
    uint64_t v92 = v1[91];
    uint64_t v283 = v1[90];
    uint64_t v93 = v1[89];
    uint64_t v268 = v1[83];
    uint64_t v273 = (void (*)(uint64_t, uint64_t))v1[96];
    uint64_t v94 = v1[72];
    uint64_t v95 = v1[62];
    uint64_t v97 = v1[59];
    uint64_t v96 = v1[60];
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_10000C130(v94, &qword_1000143F8);
    sub_10000DFE0();
    swift_willThrow();
    (*(void (**)(uint64_t, uint64_t))(v96 + 8))(v95, v97);
    v273(v93, v268);
    (*(void (**)(uint64_t, uint64_t))(v92 + 8))(v286, v283);
LABEL_105:

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
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    v243 = (uint64_t (*)(void))v1[1];
    return v243();
  }
  uint64_t v269 = v1 + 31;
  int v98 = *((unsigned __int8 *)v1 + 880);
  (*(void (**)(void, void, void))(v1[76] + 32))(v1[79], v1[72], v1[75]);
  v279 = v83;
  if (v98 != 1)
  {
    id v112 = [objc_allocWithZone((Class)MSMessageTemplateLayout) init];
    [v112 setImage:v6];
    sub_10000E110();
    NSString v113 = sub_10000E2A0();
    swift_bridgeObjectRelease();
    [v112 setCaption:v113];

    id v114 = [objc_allocWithZone((Class)MSMessageLiveLayout) initWithAlternateLayout:v112];
    goto LABEL_85;
  }
  uint64_t v99 = v1[89];
  uint64_t v100 = v1[87];
  uint64_t v101 = v1[84];
  uint64_t v102 = v1[83];
  sub_10000E000();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v101 + 16))(v100, v99, v102);
  uint64_t v103 = sub_10000DF70();
  os_log_type_t v104 = sub_10000E3A0();
  BOOL v105 = os_log_type_enabled(v103, v104);
  uint64_t v106 = v1[87];
  uint64_t v107 = v1[83];
  uint64_t v108 = v1[48];
  uint64_t v259 = v1[41];
  uint64_t v274 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v12;
  if (v105)
  {
    v252 = (void (*)(uint64_t, uint64_t))v1[96];
    int v109 = (uint8_t *)swift_slowAlloc();
    v289[0] = swift_slowAlloc();
    *(_DWORD *)int v109 = 136315138;
    uint64_t v110 = sub_10000E080();
    v1[33] = sub_10000C814(v110, v111, v289);
    uint64_t v1 = v285;
    sub_10000E3D0();
    swift_bridgeObjectRelease();
    v252(v106, v107);
    _os_log_impl((void *)&_mh_execute_header, v103, v104, "Using LP fallback for %s", v109, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    ((void (*)(uint64_t, uint64_t))v1[96])(v106, v107);
  }

  v83(v108, v259);
  uint64_t v115 = enum case for MessageDetails.EventSource.screenTime(_:);
  ((void (*)(void, void, void))v1[93])(v1[86], enum case for MessageDetails.EventSource.screenTime(_:), v1[83]);
  sub_10000E320();
  sub_10000E320();
  BOOL v116 = (void (*)(uint64_t, uint64_t))v1[96];
  uint64_t v117 = v1[86];
  uint64_t v118 = v1[83];
  uint64_t v6 = v276;
  if (v1[21] == v1[23] && v1[22] == v1[24])
  {
    swift_bridgeObjectRelease_n();
    v116(v117, v118);
LABEL_56:
    sub_10000E2F0();
    sub_10000BC6C(&qword_100014428);
    uint64_t v120 = swift_allocObject();
    *(_OWORD *)(v120 + 16) = xmmword_10000F250;
    uint64_t v121 = sub_10000E160();
    uint64_t v123 = v122;
    *(void *)(v120 + 56) = &type metadata for String;
    unint64_t v124 = sub_10000BE30();
    *(void *)(v120 + 64) = v124;
    *(void *)(v120 + 32) = v121;
    *(void *)(v120 + 40) = v123;
    uint64_t v125 = sub_10000E130();
    *(void *)(v120 + 96) = &type metadata for String;
    *(void *)(v120 + 104) = v124;
    uint64_t v1 = v285;
    *(void *)(v120 + 72) = v125;
    *(void *)(v120 + 80) = v126;
    sub_10000E2C0();
    swift_bridgeObjectRelease();
    goto LABEL_63;
  }
  char v119 = sub_10000E450();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v116(v117, v118);
  if (v119) {
    goto LABEL_56;
  }
  sub_10000E130();
  uint64_t v127 = sub_10000E2E0();
  uint64_t v129 = v128;
  swift_bridgeObjectRelease();
  if (v127 == sub_10000E100() && v129 == v130)
  {
    swift_bridgeObjectRelease_n();
  }
  else
  {
    char v131 = sub_10000E450();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v131 & 1) == 0)
    {
      sub_10000E130();
      goto LABEL_63;
    }
  }
  sub_10000E110();
LABEL_63:
  uint64_t v132 = (void (*)(uint64_t, uint64_t, uint64_t))v1[93];
  uint64_t v133 = v1[85];
  uint64_t v134 = v1[83];
  (*(void (**)(void, uint64_t, uint64_t, void))(v1[76] + 56))(v1[71], 1, 1, v1[75]);
  v132(v133, v115, v134);
  sub_10000E320();
  sub_10000E320();
  unint64_t v135 = (void (*)(uint64_t, uint64_t))v1[96];
  uint64_t v136 = v1[85];
  uint64_t v137 = v1[83];
  if (v1[25] == v1[27] && v1[26] == v1[28])
  {
    swift_bridgeObjectRelease_n();
    v135(v136, v137);
  }
  else
  {
    char v138 = sub_10000E450();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v135(v136, v137);
    if ((v138 & 1) == 0)
    {
      sub_10000E1F0();
      sub_10000E1E0();
      sub_10000E1A0();
      goto LABEL_69;
    }
  }
  sub_10000E1F0();
  sub_10000E1E0();
  sub_10000E1B0();
LABEL_69:
  swift_release();
  sub_10000E300();
  uint64_t v140 = v139;
  swift_bridgeObjectRelease();
  if (v140)
  {
    uint64_t v141 = v1[71];
    uint64_t v142 = v1[70];
    sub_10000DF00();
    swift_bridgeObjectRelease();
    sub_10000BD74(v142, v141);
  }
  uint64_t v143 = v1[75];
  uint64_t v144 = v1[69];
  sub_10000C2C8(v1[71], v144, &qword_1000143F8);
  LODWORD(v143) = v274(v144, 1, v143);
  sub_10000C130(v144, &qword_1000143F8);
  if (v143 == 1)
  {
    uint64_t v145 = v1[71];
    uint64_t v146 = v1[70];
    sub_10000DF00();
    sub_10000BD74(v146, v145);
  }
  sub_10000E000();
  uint64_t v147 = sub_10000DF70();
  os_log_type_t v148 = sub_10000E3A0();
  if (os_log_type_enabled(v147, v148))
  {
    uint64_t v149 = v1[75];
    uint64_t v150 = v1;
    uint64_t v151 = v1[71];
    uint64_t v152 = (uint8_t *)swift_slowAlloc();
    uint64_t v153 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v152 = 138412290;
    swift_beginAccess();
    if (v274(v151, 1, v149))
    {
      *uint64_t v269 = 0;
      sub_10000E3D0();
      uint64_t v154 = 0;
    }
    else
    {
      uint64_t v155 = v150[78];
      uint64_t v156 = v150[76];
      uint64_t v157 = v150[75];
      (*(void (**)(uint64_t, void, uint64_t))(v156 + 16))(v155, v150[71], v157);
      uint64_t v158 = sub_10000DED0();
      uint64_t v260 = v159;
      (*(void (**)(uint64_t, uint64_t))(v156 + 8))(v155, v157);
      sub_10000BDDC();
      swift_allocError();
      *uint64_t v160 = v158;
      v160[1] = v260;
      uint64_t v154 = _swift_stdlib_bridgeErrorToNSError();
      v150[32] = v154;
      sub_10000E3D0();
    }
    uint64_t v1 = v150;
    *uint64_t v153 = v154;
    _os_log_impl((void *)&_mh_execute_header, v147, v148, "alternate url %@", v152, 0xCu);
    sub_10000BC6C(&qword_100014418);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
    uint64_t v6 = v276;
  }
  uint64_t v161 = v1[75];
  uint64_t v162 = v1[71];
  uint64_t v163 = v1[68];
  uint64_t v164 = v1[47];
  uint64_t v165 = v1[41];

  uint64_t v83 = v279;
  v279(v164, v165);
  swift_beginAccess();
  sub_10000C2C8(v162, v163, &qword_1000143F8);
  uint64_t v167 = 0;
  if (v274(v163, 1, v161) != 1)
  {
    uint64_t v168 = v1[76];
    uint64_t v169 = v1[75];
    uint64_t v170 = v1[68];
    sub_10000DEE0(v166);
    uint64_t v167 = v171;
    (*(void (**)(uint64_t, uint64_t))(v168 + 8))(v170, v169);
  }
  NSString v172 = sub_10000E2A0();
  swift_bridgeObjectRelease();
  if (v6 && (uint64_t v173 = UIImagePNGRepresentation(v6)) != 0)
  {
    uint64_t v174 = v173;
    uint64_t v175 = sub_10000DF40();
    unint64_t v177 = v176;

    v178.super.Class isa = sub_10000DF30().super.isa;
    sub_10000BCC4(v175, v177);
  }
  else
  {
    v178.super.Class isa = 0;
  }
  uint64_t v179 = v1[104];
  uint64_t v180 = v1[103];
  uint64_t v181 = v1[71];
  id v182 = [self createRichLinkLayoutWithURL:v167 title:v172 imageData:v178.super.isa];

  id v183 = [objc_allocWithZone((Class)MSMessageLiveLayout) initWithAlternateLayout:v182];
  sub_10000BC6C(&qword_100014410);
  uint64_t v184 = swift_allocObject();
  *(_OWORD *)(v184 + 16) = xmmword_10000F260;
  *(void *)(v184 + 32) = v180;
  *(void *)(v184 + 40) = v179;
  swift_bridgeObjectRetain();
  id v114 = v183;
  Class v185 = sub_10000E330().super.isa;
  swift_bridgeObjectRelease();
  [v114 setPpl_requiredCapabilities:v185];

  sub_10000C130(v181, &qword_1000143F8);
LABEL_85:
  id v186 = [objc_allocWithZone((Class)MSSession) init];
  id v187 = [objc_allocWithZone((Class)MSMessage) initWithSession:v186];

  sub_10000DEE0(v188);
  uint64_t v190 = v189;
  [v187 setURL:v189];

  [v187 setLayout:v114];
  sub_10000E110();
  NSString v191 = sub_10000E2A0();
  swift_bridgeObjectRelease();
  [v187 setSummaryText:v191];

  sub_10000E000();
  id v192 = v187;
  id v193 = sub_10000DF70();
  os_log_type_t v194 = sub_10000E3A0();
  v284 = v192;
  uint64_t v275 = v114;
  if (os_log_type_enabled(v193, v194))
  {
    uint64_t v195 = (uint8_t *)swift_slowAlloc();
    v289[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v195 = 136315138;
    id v196 = [v192 URL];
    if (v196)
    {
      id v197 = v196;
      sub_10000DEF0();

      uint64_t v198 = 0;
    }
    else
    {
      uint64_t v198 = 1;
    }
    uint64_t v201 = v1[76];
    uint64_t v202 = v1[75];
    uint64_t v203 = v1[67];
    uint64_t v265 = v1[46];
    uint64_t v204 = v285[41];
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v201 + 56))(v203, v198, 1, v202);
    uint64_t v205 = sub_10000E2D0();
    v285[30] = sub_10000C814(v205, v206, v289);
    sub_10000E3D0();
    swift_bridgeObjectRelease();

    _os_log_impl((void *)&_mh_execute_header, v193, v194, "message url %s", v195, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    uint64_t v207 = v204;
    uint64_t v1 = v285;
    v279(v265, v207);
    uint64_t v6 = v276;
    if (!v276) {
      goto LABEL_95;
    }
  }
  else
  {
    uint64_t v199 = v1[46];
    uint64_t v200 = v1[41];

    v83(v199, v200);
    if (!v6) {
      goto LABEL_95;
    }
  }
  v208 = v6;
  uint64_t v209 = UIImageJPEGRepresentation(v208, 0.4);
  if (v209)
  {
    uint64_t v210 = v209;
    uint64_t v211 = sub_10000DF40();
    unint64_t v213 = v212;

    sub_10000BD1C(v211, v213);
    v214.super.Class isa = sub_10000DF30().super.isa;
    uint64_t v266 = v211;
    unint64_t v270 = v213;
    sub_10000BCC4(v211, v213);
    goto LABEL_96;
  }

LABEL_95:
  v214.super.Class isa = 0;
  uint64_t v266 = 0;
  unint64_t v270 = 0xF000000000000000;
LABEL_96:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_10000E2F0();
  swift_bridgeObjectRelease();
  NSString v215 = sub_10000E2A0();
  swift_bridgeObjectRelease();
  id v216 = [v192 ppl_pluginPayloadWithAppIconData:v214.super.isa appName:v215 allowDataPayloads:0];

  id v217 = [v216 data];
  if (!v217)
  {
    sub_10000E000();
    uint64_t v233 = sub_10000DF70();
    uint64_t v234 = sub_10000E3B0();
    if (os_log_type_enabled(v233, (os_log_type_t)v234))
    {
      uint64_t v235 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v235 = 0;
      _os_log_impl((void *)&_mh_execute_header, v233, (os_log_type_t)v234, "Message _pluginPayload create failed", v235, 2u);
      swift_slowDealloc();
    }
    uint64_t v262 = (void (*)(uint64_t, uint64_t))v1[96];
    uint64_t v287 = v1[92];
    uint64_t v236 = v1[91];
    uint64_t v264 = v1[90];
    uint64_t v257 = v1[83];
    uint64_t v261 = v1[89];
    uint64_t v237 = v1[79];
    uint64_t v238 = v1[76];
    uint64_t v239 = v1[75];
    uint64_t v240 = v1[60];
    uint64_t v253 = v1[59];
    uint64_t v255 = v1[62];
    uint64_t v241 = v1[44];
    uint64_t v242 = v1[41];

    v279(v241, v242);
    sub_10000DFE0();
    swift_willThrow();

    sub_10000BCB0(v266, v270);
    (*(void (**)(uint64_t, uint64_t))(v238 + 8))(v237, v239);
    (*(void (**)(uint64_t, uint64_t))(v240 + 8))(v255, v253);
    v262(v261, v257);
    (*(void (**)(uint64_t, uint64_t))(v236 + 8))(v287, v264);
    goto LABEL_105;
  }
  uint64_t v218 = sub_10000DF40();
  uint64_t v244 = v219;
  uint64_t v245 = v218;

  sub_10000E000();
  v220 = sub_10000DF70();
  os_log_type_t v221 = sub_10000E3A0();
  if (os_log_type_enabled(v220, v221))
  {
    unint64_t v222 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unint64_t v222 = 0;
    _os_log_impl((void *)&_mh_execute_header, v220, v221, "SPI Payload successful!", v222, 2u);
    swift_slowDealloc();
  }
  uint64_t v249 = (void (*)(uint64_t, uint64_t))v1[96];
  uint64_t v251 = v285[92];
  uint64_t v223 = v285[91];
  uint64_t v250 = v285[90];
  uint64_t v248 = v285[89];
  uint64_t v247 = v285[83];
  uint64_t v246 = v285[79];
  uint64_t v224 = v285[76];
  uint64_t v225 = v285[75];
  uint64_t v226 = v285[62];
  uint64_t v227 = v285[60];
  uint64_t v228 = v285[59];
  uint64_t v229 = v285[45];
  uint64_t v230 = v285[41];

  sub_10000BCB0(v266, v270);
  v279(v229, v230);
  (*(void (**)(uint64_t, uint64_t))(v224 + 8))(v246, v225);
  (*(void (**)(uint64_t, uint64_t))(v227 + 8))(v226, v228);
  v249(v248, v247);
  (*(void (**)(uint64_t, uint64_t))(v223 + 8))(v251, v250);

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
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  v231 = (uint64_t (*)(uint64_t, uint64_t))v285[1];
  return v231(v245, v244);
}

uint64_t sub_10000BC6C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_10000BCB0(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_10000BCC4(a1, a2);
  }
  return a1;
}

uint64_t sub_10000BCC4(uint64_t a1, unint64_t a2)
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

uint64_t sub_10000BD1C(uint64_t a1, unint64_t a2)
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

uint64_t sub_10000BD74(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000BC6C(&qword_1000143F8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

unint64_t sub_10000BDDC()
{
  unint64_t result = qword_100014420;
  if (!qword_100014420)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100014420);
  }
  return result;
}

unint64_t sub_10000BE30()
{
  unint64_t result = qword_100014430;
  if (!qword_100014430)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100014430);
  }
  return result;
}

uint64_t sub_10000BE84()
{
  uint64_t v1 = sub_10000DF10();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_unknownObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v5, v6);
}

uint64_t sub_10000BF50(uint64_t a1)
{
  uint64_t v4 = *(void *)(sub_10000DF10() - 8);
  uint64_t v5 = *(void *)(v1 + 16);
  uint64_t v6 = *(void *)(v1 + 24);
  uint64_t v7 = v1 + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  *uint64_t v8 = v2;
  v8[1] = sub_10000C03C;
  return sub_100003570(a1, v5, v6, v7);
}

uint64_t sub_10000C03C()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_10000C130(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_10000BC6C(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_10000C18C()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000C1C4(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_10000C03C;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_100014478 + dword_100014478);
  return v6(a1, v4);
}

uint64_t sub_10000C280(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_10000C2C8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_10000BC6C(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

void *sub_10000C32C(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_10000C370(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_10000C3C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))((char *)&dword_1000144F0 + dword_1000144F0);
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v9;
  void *v9 = v4;
  v9[1] = sub_10000DE4C;
  return v11(a1, a2, a3, a4);
}

uint64_t sub_10000C48C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))((char *)&dword_1000144E0 + dword_1000144E0);
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v9;
  void *v9 = v4;
  v9[1] = sub_10000C558;
  return v11(a1, a2, a3, a4);
}

uint64_t sub_10000C558(uint64_t a1)
{
  uint64_t v7 = *v2;
  uint64_t v4 = swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(uint64_t))(v7 + 8);
  if (!v1) {
    uint64_t v4 = a1;
  }
  return v5(v4);
}

uint64_t sub_10000C658(uint64_t a1)
{
  unint64_t v2 = sub_10000C7C0();

  return PeopleLegacyExtension.configuration.getter(a1, v2);
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

unint64_t sub_10000C704()
{
  unint64_t result = qword_1000144C0[0];
  if (!qword_1000144C0[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_1000144C0);
  }
  return result;
}

ValueMetadata *type metadata accessor for Appex()
{
  return &type metadata for Appex;
}

uint64_t sub_10000C76C()
{
  return *(void *)(swift_getOpaqueTypeConformance2() + 8);
}

unint64_t sub_10000C7C0()
{
  unint64_t result = qword_1000144D8;
  if (!qword_1000144D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000144D8);
  }
  return result;
}

uint64_t sub_10000C814(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_10000C8E8(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_10000DDEC((uint64_t)v12, *a3);
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
      sub_10000DDEC((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_10000C370((uint64_t)v12);
  return v7;
}

uint64_t sub_10000C8E8(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_10000E3E0();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_10000CAA4(a5, a6);
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
  uint64_t v8 = sub_10000E400();
  if (!v8)
  {
    sub_10000E410();
    __break(1u);
LABEL_17:
    uint64_t result = sub_10000E430();
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

uint64_t sub_10000CAA4(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_10000CB3C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_10000CD1C(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_10000CD1C(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_10000CB3C(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_10000CCB4(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_10000E3F0();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_10000E410();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_10000E310();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_10000E430();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_10000E410();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_10000CCB4(uint64_t a1, uint64_t a2)
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
  sub_10000BC6C(&qword_1000144E8);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_10000CD1C(char a1, int64_t a2, char a3, char *a4)
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
    sub_10000BC6C(&qword_1000144E8);
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
  uint64_t result = sub_10000E430();
  __break(1u);
  return result;
}

uint64_t sub_10000CE6C(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  *(unsigned char *)(v4 + 348) = a4;
  *(void *)(v4 + 208) = a2;
  *(void *)(v4 + 216) = a3;
  *(void *)(v4 + 200) = a1;
  uint64_t v5 = sub_10000E090();
  *(void *)(v4 + 224) = v5;
  *(void *)(v4 + 232) = *(void *)(v5 - 8);
  *(void *)(v4 + 240) = swift_task_alloc();
  uint64_t v6 = sub_10000DF80();
  *(void *)(v4 + 248) = v6;
  *(void *)(v4 + 256) = *(void *)(v6 - 8);
  *(void *)(v4 + 264) = swift_task_alloc();
  *(void *)(v4 + 272) = swift_task_alloc();
  return _swift_task_switch(sub_10000CFA0, 0, 0);
}

uint64_t sub_10000CFA0()
{
  uint64_t v27 = v0;
  int v1 = *(unsigned __int8 *)(v0 + 348);
  if (v1 == 2)
  {
    sub_10000E1F0();
    sub_10000E1E0();
    char v2 = sub_10000E1D0();
    swift_release();
  }
  else
  {
    char v2 = v1 & 1;
  }
  sub_10000DFF0();
  unint64_t v3 = sub_10000DF70();
  os_log_type_t v4 = sub_10000E3A0();
  BOOL v5 = os_log_type_enabled(v3, v4);
  uint64_t v6 = *(void *)(v0 + 272);
  uint64_t v7 = *(void *)(v0 + 248);
  uint64_t v8 = *(void *)(v0 + 256);
  if (v5)
  {
    uint64_t v9 = swift_slowAlloc();
    uint64_t v10 = swift_slowAlloc();
    *(_DWORD *)uint64_t v9 = 136315394;
    uint64_t v26 = v10;
    *(void *)(v0 + 192) = sub_10000C814(0xD000000000000036, 0x800000010000EFC0, &v26);
    sub_10000E3D0();
    *(_WORD *)(v9 + 12) = 1024;
    *(_DWORD *)(v0 + 344) = v2 & 1;
    sub_10000E3D0();
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "%s fallbackToLp %{BOOL}d ", (uint8_t *)v9, 0x12u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    size_t v11 = *(void (**)(uint64_t, uint64_t))(v8 + 8);
    v11(v6, v7);
  }
  else
  {

    size_t v11 = *(void (**)(uint64_t, uint64_t))(v8 + 8);
    v11(v6, v7);
  }
  *(void *)(v0 + 280) = v11;
  uint64_t v13 = *(void *)(v0 + 232);
  uint64_t v12 = *(void *)(v0 + 240);
  uint64_t v14 = *(void *)(v0 + 224);
  uint64_t v15 = sub_10000E210();
  swift_allocObject();
  uint64_t v16 = sub_10000E200();
  *(void *)(v0 + 136) = v15;
  *(void *)(v0 + 144) = &protocol witness table for RequestMessageDetailsBuilder;
  *(void *)(v0 + 112) = v16;
  uint64_t v17 = sub_10000E050();
  uint64_t v18 = sub_10000E040();
  *(void *)(v0 + 176) = v17;
  *(void *)(v0 + 184) = &protocol witness table for ContactFetcher;
  *(void *)(v0 + 152) = v18;
  type metadata accessor for MessagePackage();
  uint64_t inited = swift_initStackObject();
  *(void *)(v0 + 288) = inited;
  sub_10000DDC0((long long *)(v0 + 112), inited + 16);
  sub_10000DDC0((long long *)(v0 + 152), inited + 56);
  (*(void (**)(uint64_t, void, uint64_t))(v13 + 104))(v12, enum case for MessageDetails.EventSource.screenTime(_:), v14);
  uint64_t v20 = (void *)swift_task_alloc();
  *(void *)(v0 + 296) = v20;
  *uint64_t v20 = v0;
  v20[1] = sub_10000D2B8;
  uint64_t v21 = *(void *)(v0 + 240);
  uint64_t v22 = *(void *)(v0 + 208);
  uint64_t v23 = *(void *)(v0 + 216);
  uint64_t v24 = *(void *)(v0 + 200);
  return sub_100004424(v24, v22, v23, v21, v2 & 1);
}

uint64_t sub_10000D2B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v10 = (void *)*v5;
  v10[38] = v4;
  swift_task_dealloc();
  uint64_t v11 = v10[30];
  uint64_t v12 = v10[29];
  uint64_t v13 = v10[28];
  if (v4)
  {
    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v11, v13);
    uint64_t v14 = sub_10000D458;
  }
  else
  {
    v10[39] = a4;
    v10[40] = a3;
    v10[41] = a2;
    v10[42] = a1;
    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v11, v13);
    uint64_t v14 = sub_10000DE48;
  }
  return _swift_task_switch(v14, 0, 0);
}

uint64_t sub_10000D458()
{
  char v2 = (void (*)(uint64_t, uint64_t))v0[35];
  uint64_t v1 = v0[36];
  uint64_t v3 = v0[33];
  uint64_t v4 = v0[31];
  uint64_t v5 = v1 + 56;
  uint64_t v6 = v1 + 16;
  swift_setDeallocating();
  sub_10000C370(v6);
  sub_10000C370(v5);
  sub_10000DFF0();
  swift_errorRetain();
  sub_10000DF60();
  swift_errorRelease();
  v2(v3, v4);
  swift_willThrow();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v7 = (uint64_t (*)(void))v0[1];
  return v7();
}

uint64_t sub_10000D570(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  *(unsigned char *)(v4 + 348) = a4;
  *(void *)(v4 + 208) = a2;
  *(void *)(v4 + 216) = a3;
  *(void *)(v4 + 200) = a1;
  uint64_t v5 = sub_10000E090();
  *(void *)(v4 + 224) = v5;
  *(void *)(v4 + 232) = *(void *)(v5 - 8);
  *(void *)(v4 + 240) = swift_task_alloc();
  uint64_t v6 = sub_10000DF80();
  *(void *)(v4 + 248) = v6;
  *(void *)(v4 + 256) = *(void *)(v6 - 8);
  *(void *)(v4 + 264) = swift_task_alloc();
  *(void *)(v4 + 272) = swift_task_alloc();
  return _swift_task_switch(sub_10000D6A4, 0, 0);
}

uint64_t sub_10000D6A4()
{
  uint64_t v27 = v0;
  int v1 = *(unsigned __int8 *)(v0 + 348);
  if (v1 == 2)
  {
    sub_10000E1F0();
    sub_10000E1E0();
    char v2 = sub_10000E1C0();
    swift_release();
  }
  else
  {
    char v2 = v1 & 1;
  }
  sub_10000DFF0();
  uint64_t v3 = sub_10000DF70();
  os_log_type_t v4 = sub_10000E3A0();
  BOOL v5 = os_log_type_enabled(v3, v4);
  uint64_t v6 = *(void *)(v0 + 272);
  uint64_t v7 = *(void *)(v0 + 248);
  uint64_t v8 = *(void *)(v0 + 256);
  if (v5)
  {
    uint64_t v9 = swift_slowAlloc();
    uint64_t v10 = swift_slowAlloc();
    *(_DWORD *)uint64_t v9 = 136315394;
    uint64_t v26 = v10;
    *(void *)(v0 + 192) = sub_10000C814(0xD000000000000034, 0x800000010000ED60, &v26);
    sub_10000E3D0();
    *(_WORD *)(v9 + 12) = 1024;
    *(_DWORD *)(v0 + 344) = v2 & 1;
    sub_10000E3D0();
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "%s fallbackToLp %{BOOL}d ", (uint8_t *)v9, 0x12u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    uint64_t v11 = *(void (**)(uint64_t, uint64_t))(v8 + 8);
    v11(v6, v7);
  }
  else
  {

    uint64_t v11 = *(void (**)(uint64_t, uint64_t))(v8 + 8);
    v11(v6, v7);
  }
  *(void *)(v0 + 280) = v11;
  uint64_t v13 = *(void *)(v0 + 232);
  uint64_t v12 = *(void *)(v0 + 240);
  uint64_t v14 = *(void *)(v0 + 224);
  uint64_t v15 = sub_10000E210();
  swift_allocObject();
  uint64_t v16 = sub_10000E200();
  *(void *)(v0 + 136) = v15;
  *(void *)(v0 + 144) = &protocol witness table for RequestMessageDetailsBuilder;
  *(void *)(v0 + 112) = v16;
  uint64_t v17 = sub_10000E050();
  uint64_t v18 = sub_10000E040();
  *(void *)(v0 + 176) = v17;
  *(void *)(v0 + 184) = &protocol witness table for ContactFetcher;
  *(void *)(v0 + 152) = v18;
  type metadata accessor for MessagePackage();
  uint64_t inited = swift_initStackObject();
  *(void *)(v0 + 288) = inited;
  sub_10000DDC0((long long *)(v0 + 112), inited + 16);
  sub_10000DDC0((long long *)(v0 + 152), inited + 56);
  (*(void (**)(uint64_t, void, uint64_t))(v13 + 104))(v12, enum case for MessageDetails.EventSource.askToBuy(_:), v14);
  uint64_t v20 = (void *)swift_task_alloc();
  *(void *)(v0 + 296) = v20;
  *uint64_t v20 = v0;
  v20[1] = sub_10000D9BC;
  uint64_t v21 = *(void *)(v0 + 240);
  uint64_t v22 = *(void *)(v0 + 208);
  uint64_t v23 = *(void *)(v0 + 216);
  uint64_t v24 = *(void *)(v0 + 200);
  return sub_100004424(v24, v22, v23, v21, v2 & 1);
}

uint64_t sub_10000D9BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v10 = (void *)*v5;
  v10[38] = v4;
  swift_task_dealloc();
  uint64_t v11 = v10[30];
  uint64_t v12 = v10[29];
  uint64_t v13 = v10[28];
  if (v4)
  {
    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v11, v13);
    uint64_t v14 = sub_10000DCA8;
  }
  else
  {
    v10[39] = a4;
    v10[40] = a3;
    v10[41] = a2;
    v10[42] = a1;
    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v11, v13);
    uint64_t v14 = sub_10000DB5C;
  }
  return _swift_task_switch(v14, 0, 0);
}

uint64_t sub_10000DB5C()
{
  unint64_t v2 = v0[39];
  uint64_t v1 = v0[40];
  uint64_t v3 = v0[36];
  swift_bridgeObjectRetain();
  sub_10000DDD8(v1, v2);
  sub_10000BCB0(v1, v2);
  swift_bridgeObjectRetain();
  sub_10000DDD8(v1, v2);
  swift_bridgeObjectRelease();
  id v4 = objc_allocWithZone((Class)sub_10000DFC0());
  uint64_t v5 = sub_10000DFB0();
  swift_bridgeObjectRelease();
  sub_10000BCB0(v1, v2);
  swift_setDeallocating();
  sub_10000C370(v3 + 16);
  sub_10000C370(v3 + 56);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v6 = (uint64_t (*)(uint64_t))v0[1];
  return v6(v5);
}

uint64_t sub_10000DCA8()
{
  unint64_t v2 = (void (*)(uint64_t, uint64_t))v0[35];
  uint64_t v1 = v0[36];
  uint64_t v3 = v0[33];
  uint64_t v4 = v0[31];
  uint64_t v5 = v1 + 56;
  uint64_t v6 = v1 + 16;
  swift_setDeallocating();
  sub_10000C370(v6);
  sub_10000C370(v5);
  sub_10000DFF0();
  swift_errorRetain();
  sub_10000DF60();
  swift_errorRelease();
  v2(v3, v4);
  swift_willThrow();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v7 = (uint64_t (*)(void))v0[1];
  return v7();
}

uint64_t sub_10000DDC0(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_10000DDD8(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_10000BD1C(a1, a2);
  }
  return a1;
}

uint64_t sub_10000DDEC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_10000DE50()
{
  return URLQueryItem.name.getter();
}

uint64_t sub_10000DE60()
{
  return type metadata accessor for URLQueryItem();
}

uint64_t sub_10000DE70()
{
  return URLComponents.queryItems.getter();
}

uint64_t sub_10000DE80()
{
  return URLComponents.queryItems.setter();
}

uint64_t sub_10000DE90()
{
  return URLComponents.init(url:resolvingAgainstBaseURL:)();
}

uint64_t sub_10000DEA0()
{
  return URLComponents.url.getter();
}

uint64_t sub_10000DEB0()
{
  return URLComponents.init()();
}

uint64_t sub_10000DEC0()
{
  return type metadata accessor for URLComponents();
}

uint64_t sub_10000DED0()
{
  return URL.absoluteString.getter();
}

void sub_10000DEE0(NSURL *retstr@<X8>)
{
}

uint64_t sub_10000DEF0()
{
  return static URL._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10000DF00()
{
  return URL.init(string:)();
}

uint64_t sub_10000DF10()
{
  return type metadata accessor for URL();
}

uint64_t sub_10000DF20()
{
  return Data.init(contentsOf:options:)();
}

NSData sub_10000DF30()
{
  return Data._bridgeToObjectiveC()();
}

uint64_t sub_10000DF40()
{
  return static Data._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10000DF50()
{
  return static AppExtension.main()();
}

uint64_t sub_10000DF60()
{
  return Logger.ifError(_:message:)();
}

uint64_t sub_10000DF70()
{
  return Logger.logObject.getter();
}

uint64_t sub_10000DF80()
{
  return type metadata accessor for Logger();
}

uint64_t sub_10000DF90()
{
  return ATQuestion.notificationText.getter();
}

uint64_t sub_10000DFA0()
{
  return ATQuestion.summary.getter();
}

uint64_t sub_10000DFB0()
{
  return PeopleLegacyResult.init(bundleID:data:)();
}

uint64_t sub_10000DFC0()
{
  return type metadata accessor for PeopleLegacyResult();
}

uint64_t sub_10000DFE0()
{
  return static PeopleErrors.createError(_:code:)();
}

uint64_t sub_10000DFF0()
{
  return static PeopleLogger.legacy.getter();
}

uint64_t sub_10000E000()
{
  return static PeopleLogger.messages.getter();
}

uint64_t sub_10000E010()
{
  return static PeopleConstants.askToBuyEventTTL.getter();
}

uint64_t sub_10000E020()
{
  return static PeopleConstants.screenTimeRequestEventTTL.getter();
}

uint64_t sub_10000E030()
{
  return static AMSBagHelper.isTrustedDomain(for:)();
}

uint64_t sub_10000E040()
{
  return ContactFetcher.__allocating_init()();
}

uint64_t sub_10000E050()
{
  return type metadata accessor for ContactFetcher();
}

uint64_t sub_10000E060()
{
  return type metadata accessor for FirstPartyApps();
}

uint64_t sub_10000E070()
{
  return MessageDetails.queryItems.getter();
}

uint64_t sub_10000E080()
{
  return MessageDetails.EventSource.rawValue.getter();
}

uint64_t sub_10000E090()
{
  return type metadata accessor for MessageDetails.EventSource();
}

uint64_t sub_10000E0A0()
{
  return MessageDetails.EventStatus.rawValue.getter();
}

uint64_t sub_10000E0B0()
{
  return type metadata accessor for MessageDetails.EventStatus();
}

uint64_t sub_10000E0C0()
{
  return MessageDetails.eventSource.getter();
}

uint64_t sub_10000E0D0()
{
  return MessageDetails.thumbnailData.getter();
}

uint64_t sub_10000E0E0()
{
  return MessageDetails.thumbnailData.setter();
}

uint64_t sub_10000E0F0()
{
  return MessageDetails.thumbnailPath.getter();
}

uint64_t sub_10000E100()
{
  return static MessageDetails.titleFallbackKey.getter();
}

uint64_t sub_10000E110()
{
  return MessageDetails.notificationCaption.getter();
}

uint64_t sub_10000E120()
{
  return MessageDetails.notificationCaption.setter();
}

uint64_t sub_10000E130()
{
  return MessageDetails.title.getter();
}

uint64_t sub_10000E140()
{
  return MessageDetails.status.getter();
}

uint64_t sub_10000E150()
{
  return MessageDetails.bundleId.getter();
}

uint64_t sub_10000E160()
{
  return MessageDetails.childName.getter();
}

uint64_t sub_10000E170()
{
  return type metadata accessor for MessageDetails();
}

uint64_t sub_10000E190()
{
  return type metadata accessor for AppBundleResolver();
}

uint64_t sub_10000E1A0()
{
  return ServerFeatureFlag.lpForAskToBuyFallback.getter();
}

uint64_t sub_10000E1B0()
{
  return ServerFeatureFlag.lpForScreenTimeFallback.getter();
}

uint64_t sub_10000E1C0()
{
  return ServerFeatureFlag.preventAskToBuyDeviceValidation.getter();
}

uint64_t sub_10000E1D0()
{
  return ServerFeatureFlag.preventScreenTimeMessageDeviceValidation.getter();
}

uint64_t sub_10000E1E0()
{
  return static ServerFeatureFlag.shared.getter();
}

uint64_t sub_10000E1F0()
{
  return type metadata accessor for ServerFeatureFlag();
}

uint64_t sub_10000E200()
{
  return RequestMessageDetailsBuilder.init()();
}

uint64_t sub_10000E210()
{
  return type metadata accessor for RequestMessageDetailsBuilder();
}

uint64_t sub_10000E230()
{
  return ATURL.Parser.parse<A>(_:from:)();
}

uint64_t sub_10000E240()
{
  return ATURL.Parser.init()();
}

uint64_t sub_10000E250()
{
  return type metadata accessor for ATURL.Parser();
}

uint64_t sub_10000E260()
{
  return ATPayload.question.getter();
}

uint64_t sub_10000E270()
{
  return type metadata accessor for ATPayload();
}

uint64_t sub_10000E280()
{
  return dispatch thunk of Hashable._rawHashValue(seed:)();
}

uint64_t sub_10000E290()
{
  return dispatch thunk of static Equatable.== infix(_:_:)();
}

NSString sub_10000E2A0()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_10000E2B0()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10000E2C0()
{
  return String.init(format:_:)();
}

uint64_t sub_10000E2D0()
{
  return String.init<A>(describing:)();
}

uint64_t sub_10000E2E0()
{
  return String.trim()()._countAndFlagsBits;
}

uint64_t sub_10000E2F0()
{
  return String.localized.getter();
}

uint64_t sub_10000E300()
{
  return String.trimToNil()().value._countAndFlagsBits;
}

Swift::Int sub_10000E310()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_10000E320()
{
  return dispatch thunk of RawRepresentable.rawValue.getter();
}

NSArray sub_10000E330()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_10000E340()
{
  return Array.description.getter();
}

uint64_t sub_10000E350()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_10000E360()
{
  return static TaskPriority.userInitiated.getter();
}

uint64_t sub_10000E370()
{
  return TaskPriority.rawValue.getter();
}

uint64_t sub_10000E380()
{
  return type metadata accessor for TaskPriority();
}

uint64_t sub_10000E3A0()
{
  return static os_log_type_t.debug.getter();
}

uint64_t sub_10000E3B0()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_10000E3C0()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_10000E3D0()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_10000E3E0()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_10000E3F0()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_10000E400()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_10000E410()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_10000E420()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_10000E430()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t sub_10000E440()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t sub_10000E450()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

NSData *__cdecl UIImageJPEGRepresentation(UIImage *image, CGFloat compressionQuality)
{
  return _UIImageJPEGRepresentation(image, compressionQuality);
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return _UIImagePNGRepresentation(image);
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

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

uint64_t self
{
  return _self;
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

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return _swift_arrayInitWithTakeBackToFront();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return _swift_arrayInitWithTakeFrontToBack();
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

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}

uint64_t swift_initStackObject()
{
  return _swift_initStackObject();
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

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}

id objc_msgSend_initWithData_MIMEType_(void *a1, const char *a2, ...)
{
  return [a1 initWithData:MIMEType:];
}

id objc_msgSend_initWithLinkMetadata_(void *a1, const char *a2, ...)
{
  return [a1 initWithLinkMetadata:];
}

id objc_msgSend_setImage_(void *a1, const char *a2, ...)
{
  return [a1 setImage:];
}

id objc_msgSend_setTitle_(void *a1, const char *a2, ...)
{
  return [a1 setTitle:];
}

id objc_msgSend_setURL_(void *a1, const char *a2, ...)
{
  return [a1 setURL:];
}