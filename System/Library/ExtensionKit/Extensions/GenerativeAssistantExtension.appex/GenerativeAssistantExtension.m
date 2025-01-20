uint64_t sub_100004780(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v8[10] = v15;
  v8[11] = v16;
  v8[8] = a7;
  v8[9] = a8;
  v8[6] = a5;
  v8[7] = a6;
  v8[4] = a3;
  v8[5] = a4;
  v8[2] = a1;
  v8[3] = a2;
  sub_10002FDB0();
  v8[12] = swift_task_alloc();
  v9 = sub_1000302C0();
  v8[13] = v9;
  v8[14] = *(void *)(v9 - 8);
  v8[15] = swift_task_alloc();
  v10 = sub_100030090();
  v8[16] = v10;
  v8[17] = *(void *)(v10 - 8);
  v8[18] = swift_task_alloc();
  v11 = sub_100030040();
  v8[19] = v11;
  v8[20] = *(void *)(v11 - 8);
  v8[21] = swift_task_alloc();
  sub_1000058C0(&qword_10003C388);
  v8[22] = swift_task_alloc();
  sub_1000058C0(&qword_10003C390);
  v8[23] = swift_task_alloc();
  v12 = sub_100030070();
  v8[24] = v12;
  v8[25] = *(void *)(v12 - 8);
  v8[26] = swift_task_alloc();
  return ((uint64_t (*)(uint64_t (*)(), void, void))_swift_task_switch)(sub_1000049F8, 0, 0);
}

uint64_t sub_1000049F8()
{
  uint64_t v1 = v0[8];
  int64_t v2 = *(void *)(v1 + 16);
  if (v2)
  {
    uint64_t v3 = v0[17];
    uint64_t v4 = v0[14];
    v27 = &_swiftEmptyArrayStorage;
    sub_100005A30(0, v2, 0);
    v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16);
    uint64_t v5 = v4 + 16;
    uint64_t v7 = v1 + ((*(unsigned __int8 *)(v5 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 64));
    uint64_t v25 = *(void *)(v5 + 56);
    v26 = v6;
    v8 = &_swiftEmptyArrayStorage;
    do
    {
      uint64_t v9 = v0[15];
      uint64_t v10 = v0[13];
      v26(v9, v7, v10);
      sub_1000302A0();
      sub_1000302B0();
      sub_100030080();
      (*(void (**)(uint64_t, uint64_t))(v5 - 8))(v9, v10);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_100005A30(0, v8[2] + 1, 1);
        v8 = v27;
      }
      unint64_t v12 = v8[2];
      unint64_t v11 = v8[3];
      if (v12 >= v11 >> 1)
      {
        sub_100005A30(v11 > 1, v12 + 1, 1);
        v8 = v27;
      }
      uint64_t v13 = v0[18];
      uint64_t v14 = v0[16];
      v8[2] = v12 + 1;
      (*(void (**)(unint64_t, uint64_t, uint64_t))(v3 + 32))((unint64_t)v8+ ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80))+ *(void *)(v3 + 72) * v12, v13, v14);
      v27 = v8;
      v7 += v25;
      --v2;
    }
    while (v2);
  }
  uint64_t v22 = v0[25];
  uint64_t v23 = v0[24];
  uint64_t v15 = v0[22];
  uint64_t v20 = v0[26];
  uint64_t v21 = v0[21];
  uint64_t v16 = v0[20];
  uint64_t v24 = v0[19];
  uint64_t v17 = v0[11];
  sub_100005A50(v0[9], v0[23], &qword_10003C390);
  sub_100005A50(v17, v15, &qword_10003C388);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_100030060();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v22 + 16))(v21, v20, v23);
  (*(void (**)(uint64_t, void, uint64_t))(v16 + 104))(v21, enum case for GenerativeResultModels.GenerativeRichTextResultSnippet(_:), v24);
  sub_100005AB4();
  sub_100030010();
  (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v21, v24);
  sub_100030030();
  sub_10002FDA0();
  sub_10002FEA0();
  (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v20, v23);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  v18 = (uint64_t (*)(void))v0[1];
  return v18();
}

uint64_t SnippetPluginUtils.deinit()
{
  return v0;
}

uint64_t SnippetPluginUtils.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t sub_100004DF0(uint64_t a1)
{
  v2[4] = a1;
  v2[5] = v1;
  uint64_t v3 = sub_100030630();
  v2[6] = v3;
  v2[7] = *(void *)(v3 - 8);
  v2[8] = swift_task_alloc();
  v2[9] = swift_task_alloc();
  uint64_t v4 = sub_100030360();
  v2[10] = v4;
  v2[11] = *(void *)(v4 - 8);
  v2[12] = swift_task_alloc();
  v2[13] = swift_task_alloc();
  v2[14] = swift_task_alloc();
  return ((uint64_t (*)(uint64_t (*)(), void, void))_swift_task_switch)(sub_100004F38, 0, 0);
}

uint64_t sub_100004F38()
{
  v44 = v0;
  uint64_t v1 = v0[14];
  uint64_t v2 = v0[10];
  uint64_t v3 = v0[11];
  uint64_t v4 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
  v4(v1, v0[5], v2);
  int v5 = (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 88))(v1, v2);
  uint64_t v6 = v0[10];
  if (v5 == enum case for GeneratedResponse.RichContentEntity.text(_:))
  {
    uint64_t v7 = (void *)v0[14];
    v8 = (void *)v0[4];
    (*(void (**)(void *, void))(v0[11] + 96))(v7, v0[10]);
    uint64_t v9 = v7[1];
    void *v8 = *v7;
    v8[1] = v9;
    uint64_t v10 = enum case for RichContentResultSegment.string(_:);
    uint64_t v11 = sub_1000300C0();
    (*(void (**)(void *, uint64_t, uint64_t))(*(void *)(v11 - 8) + 104))(v8, v10, v11);
LABEL_11:
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    v37 = (uint64_t (*)(void))v0[1];
    return v37();
  }
  if (v5 != enum case for GeneratedResponse.RichContentEntity.imageData(_:))
  {
    uint64_t v16 = v0[13];
    uint64_t v17 = v0[5];
    sub_1000305E0();
    v4(v16, v17, v6);
    v18 = sub_100030620();
    os_log_type_t v19 = sub_100030800();
    BOOL v20 = os_log_type_enabled(v18, v19);
    uint64_t v21 = v0[13];
    if (v20)
    {
      uint64_t v23 = v0[11];
      uint64_t v22 = v0[12];
      log = v18;
      uint64_t v24 = v0[10];
      uint64_t v39 = v0[7];
      uint64_t v40 = v0[6];
      uint64_t v42 = v0[9];
      uint64_t v25 = (uint8_t *)swift_slowAlloc();
      uint64_t v43 = swift_slowAlloc();
      *(_DWORD *)uint64_t v25 = 136315138;
      v4(v22, v21, v24);
      uint64_t v26 = sub_100030710();
      v0[2] = sub_10002EB08(v26, v27, &v43);
      sub_100030830();
      swift_bridgeObjectRelease();
      uint64_t v28 = *(void (**)(uint64_t, uint64_t))(v23 + 8);
      v28(v21, v24);
      _os_log_impl((void *)&_mh_execute_header, log, v19, "Unexpected segment content: %s", v25, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(uint64_t, uint64_t))(v39 + 8))(v42, v40);
    }
    else
    {
      uint64_t v29 = v0[9];
      uint64_t v31 = v0[6];
      uint64_t v30 = v0[7];
      uint64_t v28 = *(void (**)(uint64_t, uint64_t))(v0[11] + 8);
      v28(v0[13], v0[10]);

      (*(void (**)(uint64_t, uint64_t))(v30 + 8))(v29, v31);
    }
    uint64_t v32 = v0[14];
    uint64_t v33 = v0[10];
    v34 = (void *)v0[4];
    void *v34 = 0;
    v34[1] = 0xE000000000000000;
    uint64_t v35 = enum case for RichContentResultSegment.string(_:);
    uint64_t v36 = sub_1000300C0();
    (*(void (**)(void *, uint64_t, uint64_t))(*(void *)(v36 - 8) + 104))(v34, v35, v36);
    v28(v32, v33);
    goto LABEL_11;
  }
  unint64_t v12 = (int **)v0[14];
  (*(void (**)(int **, void))(v0[11] + 96))(v12, v0[10]);
  uint64_t v13 = *v12;
  v0[15] = v12[1];
  v41 = (uint64_t (*)(void))((char *)v13 + *v13);
  uint64_t v14 = (void *)swift_task_alloc();
  v0[16] = v14;
  *uint64_t v14 = v0;
  v14[1] = sub_1000053EC;
  return v41();
}

uint64_t sub_1000053EC(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *v3;
  *(void *)(*v3 + 136) = v2;
  swift_task_dealloc();
  if (v2)
  {
    uint64_t v7 = sub_10000560C;
  }
  else
  {
    *(void *)(v6 + 144) = a2;
    *(void *)(v6 + 152) = a1;
    uint64_t v7 = sub_100005520;
  }
  return ((uint64_t (*)(uint64_t (*)(), void, void))_swift_task_switch)(v7, 0, 0);
}

uint64_t sub_100005520()
{
  uint64_t v2 = v0[18];
  uint64_t v1 = v0[19];
  uint64_t v3 = (void *)v0[4];
  swift_release();
  *uint64_t v3 = v1;
  v3[1] = v2;
  uint64_t v4 = enum case for RichContentResultSegment.imageData(_:);
  uint64_t v5 = sub_1000300C0();
  (*(void (**)(void *, uint64_t, uint64_t))(*(void *)(v5 - 8) + 104))(v3, v4, v5);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v6 = (uint64_t (*)(void))v0[1];
  return v6();
}

uint64_t sub_10000560C()
{
  sub_1000305E0();
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v1 = sub_100030620();
  os_log_type_t v2 = sub_100030800();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    uint64_t v4 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v3 = 138412290;
    swift_errorRetain();
    uint64_t v5 = _swift_stdlib_bridgeErrorToNSError();
    v0[3] = v5;
    sub_100030830();
    *uint64_t v4 = v5;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "Failed to load image data: %@", v3, 0xCu);
    sub_1000058C0(&qword_10003C3B8);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
  }

  uint64_t v6 = (_OWORD *)v0[4];
  (*(void (**)(void, void))(v0[7] + 8))(v0[8], v0[6]);
  swift_release();
  swift_errorRelease();
  *uint64_t v6 = xmmword_100030D90;
  uint64_t v7 = enum case for RichContentResultSegment.imageData(_:);
  uint64_t v8 = sub_1000300C0();
  (*(void (**)(_OWORD *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 104))(v6, v7, v8);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v9 = (uint64_t (*)(void))v0[1];
  return v9();
}

uint64_t variable initialization expression of ResponseImageEntity.displayRepresentation()
{
  return sub_10002FE40();
}

uint64_t variable initialization expression of ResponseImageEntity._index()
{
  return sub_10000595C(&qword_10003C2D0, 0x7865646E69, 0xE500000000000000, (uint64_t (*)(char *))&EntityProperty<>.init(title:));
}

uint64_t sub_1000058C0(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t variable initialization expression of ResponseImageEntity._data()
{
  return sub_10000595C(&qword_10003C2D8, 1635017060, 0xE400000000000000, (uint64_t (*)(char *))&EntityProperty<>.init(title:));
}

uint64_t variable initialization expression of ResponseTextEntity._text()
{
  return sub_10000595C(&qword_10003C2E0, 1954047348, 0xE400000000000000, (uint64_t (*)(char *))&EntityProperty<>.init(title:));
}

uint64_t sub_10000595C(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(char *))
{
  sub_10002FF70();
  __chkstk_darwin();
  uint64_t v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000058C0(a1);
  sub_10002FF50();
  return a4(v7);
}

uint64_t type metadata accessor for SnippetPluginUtils()
{
  return self;
}

uint64_t sub_100005A30(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_100005B6C(a1, a2, a3, (void *)*v3);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_100005A50(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_1000058C0(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

unint64_t sub_100005AB4()
{
  unint64_t result = qword_10003C398;
  if (!qword_10003C398)
  {
    sub_100030040();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003C398);
  }
  return result;
}

uint64_t sub_100005B0C(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_100005DB0(a1, a2, a3, *v3, &qword_10003C3C0);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_100005B3C(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_100005DB0(a1, a2, a3, *v3, &qword_10003C3A8);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_100005B6C(char a1, int64_t a2, char a3, void *a4)
{
  if (a3)
  {
    unint64_t v6 = a4[3];
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_35:
        __break(1u);
        goto LABEL_36;
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
  if (!v9)
  {
    uint64_t v13 = &_swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  sub_1000058C0(&qword_10003C3A0);
  uint64_t v10 = *(void *)(sub_100030090() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (void *)swift_allocObject();
  size_t v14 = j__malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if (v14 - v12 == 0x8000000000000000 && v11 == -1) {
    goto LABEL_34;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  uint64_t v16 = *(void *)(sub_100030090() - 8);
  unint64_t v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  v18 = (char *)v13 + v17;
  os_log_type_t v19 = (char *)a4 + v17;
  if (a1)
  {
    if (v13 < a4 || v18 >= &v19[*(void *)(v16 + 72) * v8])
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
    goto LABEL_32;
  }
  uint64_t v20 = *(void *)(v16 + 72) * v8;
  uint64_t v21 = &v18[v20];
  unint64_t v22 = (unint64_t)&v19[v20];
  if (v19 >= v21 || (unint64_t)v18 >= v22)
  {
    swift_arrayInitWithCopy();
LABEL_32:
    swift_release();
    return (uint64_t)v13;
  }
LABEL_36:
  uint64_t result = sub_100030880();
  __break(1u);
  return result;
}

uint64_t sub_100005DB0(char a1, int64_t a2, char a3, char *a4, uint64_t *a5)
{
  if (a3)
  {
    unint64_t v7 = *((void *)a4 + 3);
    int64_t v8 = v7 >> 1;
    if ((uint64_t)(v7 >> 1) < a2)
    {
      if (v8 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      int64_t v8 = v7 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v7 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v8 = a2;
      }
    }
  }
  else
  {
    int64_t v8 = a2;
  }
  uint64_t v9 = *((void *)a4 + 2);
  if (v8 <= v9) {
    uint64_t v10 = *((void *)a4 + 2);
  }
  else {
    uint64_t v10 = v8;
  }
  if (v10)
  {
    sub_1000058C0(a5);
    uint64_t v11 = (char *)swift_allocObject();
    size_t v12 = j__malloc_size(v11);
    *((void *)v11 + 2) = v9;
    *((void *)v11 + 3) = 2 * ((uint64_t)(v12 - 32) / 104);
  }
  else
  {
    uint64_t v11 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v13 = v11 + 32;
  size_t v14 = a4 + 32;
  if (a1)
  {
    if (v11 != a4 || v13 >= &v14[104 * v9]) {
      memmove(v13, v14, 104 * v9);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v14 >= &v13[104 * v9] || v13 >= &v14[104 * v9])
  {
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v11;
  }
LABEL_30:
  uint64_t result = sub_100030880();
  __break(1u);
  return result;
}

unint64_t sub_100005F40()
{
  unint64_t result = qword_10003C3C8;
  if (!qword_10003C3C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003C3C8);
  }
  return result;
}

unint64_t sub_100005F98()
{
  unint64_t result = qword_10003C3D0;
  if (!qword_10003C3D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003C3D0);
  }
  return result;
}

uint64_t sub_100005FEC()
{
  uint64_t v0 = sub_10002FF70();
  sub_100010AA0(v0, qword_10003CC48);
  sub_100010A68(v0, (uint64_t)qword_10003CC48);
  return sub_10002FF50();
}

uint64_t sub_100006050()
{
  sub_10002FC20();
  return v1;
}

uint64_t sub_100006084()
{
  return sub_10002FE80();
}

uint64_t sub_10000614C@<X0>(uint64_t a1@<X8>)
{
  sub_1000058C0(&qword_10003C438);
  __chkstk_darwin();
  uint64_t v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_10002FF70();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin();
  sub_10002FF50();
  sub_10002FF50();
  (*(void (**)(char *, void, uint64_t, uint64_t))(v5 + 56))(v3, 0, 1, v4);
  sub_1000058C0(&qword_10003C528);
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_100030DE0;
  sub_10002FF50();
  sub_10002FF50();
  sub_10002FF50();
  sub_10002FF50();
  sub_10002FF50();
  sub_10002FD90();
  uint64_t v6 = sub_10002FD80();
  return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(a1, 0, 1, v6);
}

uint64_t sub_1000063CC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_1000058C0(&qword_10003C420);
  __chkstk_darwin(v2 - 8);
  v47 = (char *)v39 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v62 = sub_10002FEC0();
  uint64_t v64 = *(void *)(v62 - 8);
  __chkstk_darwin(v62);
  v46 = (char *)v39 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_1000058C0(&qword_10003C428);
  __chkstk_darwin(v5 - 8);
  uint64_t v45 = (char *)v39 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1000058C0(&qword_10003C430);
  __chkstk_darwin(v7 - 8);
  v44 = (char *)v39 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_1000058C0(&qword_10003C438);
  __chkstk_darwin(v9 - 8);
  v52 = (char *)v39 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v60 = sub_10002FF60();
  uint64_t v11 = *(void *)(v60 - 8);
  __chkstk_darwin(v60);
  v63 = (char *)v39 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_100030000();
  __chkstk_darwin(v13 - 8);
  uint64_t v15 = (char *)v39 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_1000306E0();
  __chkstk_darwin(v16 - 8);
  v18 = (char *)v39 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_10002FF70();
  uint64_t v56 = v19;
  uint64_t v20 = *(void *)(v19 - 8);
  uint64_t v21 = __chkstk_darwin(v19);
  uint64_t v43 = (char *)v39 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v21);
  uint64_t v24 = (char *)v39 - v23;
  a1[3] = sub_100030140();
  a1[4] = (uint64_t)&protocol witness table for GenerativeAssistantFeatureFlagManager;
  sub_100010080(a1);
  sub_100030130();
  a1[8] = sub_100030160();
  a1[9] = (uint64_t)&protocol witness table for GenerativeAssistantRestrictionManager;
  v49 = a1;
  sub_100010080(a1 + 5);
  sub_100030150();
  v41 = (void (*)(char *, uint64_t, uint64_t, uint64_t))sub_1000058C0(&qword_10003C440);
  sub_1000306D0();
  v48 = v15;
  sub_10002FFF0();
  unsigned int v58 = enum case for LocalizedStringResource.BundleDescription.main(_:);
  uint64_t v25 = *(void (**)(void))(v11 + 104);
  uint64_t v59 = v11 + 104;
  v61 = (void (*)(char *, void, uint64_t))v25;
  v25(v63);
  uint64_t v42 = v24;
  sub_10002FF80();
  uint64_t v26 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v20 + 56);
  uint64_t v55 = v20 + 56;
  v57 = v26;
  unint64_t v27 = v52;
  v26(v52, 1, 1, v19);
  LOBYTE(v65) = 2;
  uint64_t v28 = sub_100030770();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v28 - 8) + 56))(v44, 1, 1, v28);
  uint64_t v51 = sub_10002FB60();
  uint64_t v29 = *(void *)(v51 - 8);
  uint64_t v40 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v29 + 56);
  uint64_t v53 = v29 + 56;
  uint64_t v30 = v45;
  v40(v45, 1, 1, v51);
  unsigned int v54 = enum case for InputConnectionBehavior.default(_:);
  uint64_t v31 = *(void (**)(void))(v64 + 104);
  v64 += 104;
  v50 = (void (*)(char *, void, uint64_t))v31;
  uint64_t v32 = v46;
  uint64_t v33 = v62;
  v31(v46);
  a1[10] = sub_10002FC60();
  v39[1] = sub_1000058C0(&qword_10003C448);
  v39[0] = v18;
  sub_1000306D0();
  sub_10002FFF0();
  v61(v63, v58, v60);
  sub_10002FF80();
  v57(v27, 1, 1, v56);
  uint64_t v34 = sub_1000306C0();
  uint64_t v65 = 0;
  uint64_t v66 = 0;
  uint64_t v35 = *(void *)(v34 - 8);
  v41 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v35 + 56);
  v44 = (char *)(v35 + 56);
  uint64_t v36 = v47;
  v41(v47, 1, 1, v34);
  v37 = v40;
  v40(v30, 1, 1, v51);
  v50(v32, v54, v33);
  v49[11] = sub_10002FC50();
  uint64_t v43 = (char *)sub_1000058C0(&qword_10003C450);
  sub_1000306D0();
  sub_10002FFF0();
  v61(v63, v58, v60);
  sub_10002FF80();
  v57(v52, 1, 1, v56);
  uint64_t v65 = 0;
  uint64_t v66 = 0;
  v41(v36, 1, 1, v34);
  v37(v30, 1, 1, v51);
  v50(v32, v54, v62);
  uint64_t result = sub_10002FC50();
  v49[12] = result;
  return result;
}

uint64_t sub_100006CB0@<X0>(long long *a1@<X0>, long long *a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v59 = a2;
  unsigned int v58 = a1;
  uint64_t v4 = sub_1000058C0(&qword_10003C420);
  __chkstk_darwin(v4 - 8);
  v57 = (char *)v48 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v74 = sub_10002FEC0();
  uint64_t v76 = *(void *)(v74 - 8);
  __chkstk_darwin(v74);
  v73 = (char *)v48 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1000058C0(&qword_10003C428);
  __chkstk_darwin(v7 - 8);
  uint64_t v55 = (char *)v48 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_1000058C0(&qword_10003C430);
  __chkstk_darwin(v9 - 8);
  unsigned int v54 = (char *)v48 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_1000058C0(&qword_10003C438);
  __chkstk_darwin(v11 - 8);
  uint64_t v64 = (char *)v48 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v71 = sub_10002FF60();
  uint64_t v13 = *(void *)(v71 - 8);
  __chkstk_darwin(v71);
  uint64_t v15 = (char *)v48 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_100030000();
  __chkstk_darwin(v16 - 8);
  v18 = (char *)v48 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_1000306E0();
  __chkstk_darwin(v19 - 8);
  uint64_t v21 = (char *)v48 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = sub_10002FF70();
  uint64_t v23 = *(void *)(v22 - 8);
  uint64_t v24 = __chkstk_darwin(v22);
  uint64_t v53 = (char *)v48 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v24);
  unint64_t v27 = (char *)v48 - v26;
  a3[3] = sub_100030140();
  a3[4] = (uint64_t)&protocol witness table for GenerativeAssistantFeatureFlagManager;
  uint64_t v28 = a3;
  sub_100010080(a3);
  sub_100030130();
  a3 += 5;
  uint64_t v56 = a3;
  uint64_t v29 = sub_100030160();
  v75 = v28;
  v28[8] = v29;
  v28[9] = (uint64_t)&protocol witness table for GenerativeAssistantRestrictionManager;
  sub_100010080(a3);
  sub_100030150();
  uint64_t v51 = (void (*)(char *, uint64_t, uint64_t, uint64_t))sub_1000058C0(&qword_10003C440);
  uint64_t v60 = v21;
  sub_1000306D0();
  sub_10002FFF0();
  unsigned int v69 = enum case for LocalizedStringResource.BundleDescription.main(_:);
  uint64_t v30 = *(void (**)(void))(v13 + 104);
  uint64_t v70 = v13 + 104;
  v72 = (void (*)(char *, void, uint64_t))v30;
  v61 = v15;
  v30(v15);
  v52 = v27;
  sub_10002FF80();
  uint64_t v31 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v23 + 56);
  uint64_t v67 = v23 + 56;
  v68 = v31;
  uint64_t v32 = v64;
  uint64_t v33 = v22;
  uint64_t v49 = v22;
  v31(v64, 1, 1, v22);
  LOBYTE(v77) = 2;
  uint64_t v34 = sub_100030770();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v34 - 8) + 56))(v54, 1, 1, v34);
  uint64_t v63 = sub_10002FB60();
  uint64_t v35 = *(void *)(v63 - 8);
  v50 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v35 + 56);
  uint64_t v65 = v35 + 56;
  uint64_t v36 = v55;
  v50(v55, 1, 1, v63);
  unsigned int v66 = enum case for InputConnectionBehavior.default(_:);
  v37 = *(void (**)(void))(v76 + 104);
  v76 += 104;
  uint64_t v62 = (void (*)(char *, void, uint64_t))v37;
  uint64_t v38 = v74;
  v37(v73);
  v75[10] = sub_10002FC60();
  v48[2] = sub_1000058C0(&qword_10003C448);
  sub_1000306D0();
  v48[1] = v18;
  sub_10002FFF0();
  v72(v61, v69, v71);
  sub_10002FF80();
  v68(v32, 1, 1, v33);
  uint64_t v39 = sub_1000306C0();
  uint64_t v77 = 0;
  uint64_t v78 = 0;
  uint64_t v40 = *(void *)(v39 - 8);
  uint64_t v51 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v40 + 56);
  unsigned int v54 = (char *)(v40 + 56);
  v41 = v57;
  v51(v57, 1, 1, v39);
  uint64_t v42 = v50;
  v50(v36, 1, 1, v63);
  uint64_t v43 = v73;
  v62(v73, v66, v38);
  v75[11] = sub_10002FC50();
  uint64_t v53 = (char *)sub_1000058C0(&qword_10003C450);
  sub_1000306D0();
  sub_10002FFF0();
  v72(v61, v69, v71);
  sub_10002FF80();
  v68(v64, 1, 1, v49);
  uint64_t v77 = 0;
  uint64_t v78 = 0;
  v51(v41, 1, 1, v39);
  v42(v36, 1, 1, v63);
  v62(v43, v66, v74);
  uint64_t v44 = sub_10002FC50();
  uint64_t v45 = (uint64_t)v75;
  v75[12] = v44;
  sub_10000F9C4(v45);
  sub_1000100E4(v58, v45);
  uint64_t v46 = (uint64_t)v56;
  sub_10000F9C4((uint64_t)v56);
  return sub_1000100E4(v59, v46);
}

uint64_t sub_1000075EC(uint64_t a1)
{
  v2[95] = v1;
  v2[94] = a1;
  uint64_t v3 = sub_10002FEB0();
  v2[96] = v3;
  v2[97] = *(void *)(v3 - 8);
  v2[98] = swift_task_alloc();
  uint64_t v4 = sub_100030220();
  v2[99] = v4;
  v2[100] = *(void *)(v4 - 8);
  v2[101] = swift_task_alloc();
  uint64_t v5 = sub_100030530();
  v2[102] = v5;
  v2[103] = *(void *)(v5 - 8);
  v2[104] = swift_task_alloc();
  v2[105] = swift_task_alloc();
  v2[106] = swift_task_alloc();
  sub_10002FDB0();
  v2[107] = swift_task_alloc();
  uint64_t v6 = sub_100030040();
  v2[108] = v6;
  v2[109] = *(void *)(v6 - 8);
  v2[110] = swift_task_alloc();
  sub_1000058C0(&qword_10003C390);
  v2[111] = swift_task_alloc();
  uint64_t v7 = sub_100030410();
  v2[112] = v7;
  v2[113] = *(void *)(v7 - 8);
  v2[114] = swift_task_alloc();
  sub_1000058C0(&qword_10003C468);
  v2[115] = swift_task_alloc();
  v2[116] = swift_task_alloc();
  v2[117] = swift_task_alloc();
  v2[118] = swift_task_alloc();
  sub_1000058C0(&qword_10003C388);
  v2[119] = swift_task_alloc();
  uint64_t v8 = sub_1000300C0();
  v2[120] = v8;
  v2[121] = *(void *)(v8 - 8);
  v2[122] = swift_task_alloc();
  v2[123] = swift_task_alloc();
  uint64_t v9 = sub_100030360();
  v2[124] = v9;
  v2[125] = *(void *)(v9 - 8);
  v2[126] = swift_task_alloc();
  uint64_t v10 = sub_100030440();
  v2[127] = v10;
  v2[128] = *(void *)(v10 - 8);
  v2[129] = swift_task_alloc();
  sub_1000058C0(&qword_10003C470);
  v2[130] = swift_task_alloc();
  v2[131] = sub_1000058C0(&qword_10003C478);
  v2[132] = swift_task_alloc();
  v2[133] = swift_task_alloc();
  sub_1000058C0(&qword_10003C480);
  v2[134] = swift_task_alloc();
  uint64_t v11 = sub_10002FB60();
  v2[135] = v11;
  v2[136] = *(void *)(v11 - 8);
  v2[137] = swift_task_alloc();
  v2[138] = swift_task_alloc();
  v2[139] = swift_task_alloc();
  sub_100030320();
  v2[140] = swift_task_alloc();
  sub_1000058C0(&qword_10003C488);
  v2[141] = swift_task_alloc();
  sub_1000304B0();
  v2[142] = swift_task_alloc();
  sub_1000058C0(&qword_10003C490);
  v2[143] = swift_task_alloc();
  uint64_t v12 = sub_1000304A0();
  v2[144] = v12;
  v2[145] = *(void *)(v12 - 8);
  v2[146] = swift_task_alloc();
  uint64_t v13 = sub_1000301A0();
  v2[147] = v13;
  v2[148] = *(void *)(v13 - 8);
  v2[149] = swift_task_alloc();
  v2[150] = swift_task_alloc();
  uint64_t v14 = sub_100030630();
  v2[151] = v14;
  v2[152] = *(void *)(v14 - 8);
  v2[153] = swift_task_alloc();
  v2[154] = swift_task_alloc();
  v2[155] = swift_task_alloc();
  sub_1000058C0(&qword_10003C498);
  v2[156] = swift_task_alloc();
  uint64_t v15 = sub_100030680();
  v2[157] = v15;
  v2[158] = *(void *)(v15 - 8);
  v2[159] = swift_task_alloc();
  v2[160] = swift_task_alloc();
  sub_10002FF70();
  v2[161] = swift_task_alloc();
  uint64_t v16 = type metadata accessor for GenerativeResponseEntity(0);
  v2[162] = v16;
  v2[163] = *(void *)(v16 - 8);
  v2[164] = swift_task_alloc();
  uint64_t v17 = sub_1000304F0();
  v2[165] = v17;
  v2[166] = *(void *)(v17 - 8);
  v2[167] = swift_task_alloc();
  uint64_t v18 = sub_1000300F0();
  v2[168] = v18;
  v2[169] = *(void *)(v18 - 8);
  v2[170] = swift_task_alloc();
  uint64_t v19 = sub_10002FE30();
  v2[171] = v19;
  v2[172] = *(void *)(v19 - 8);
  v2[173] = swift_task_alloc();
  v2[174] = swift_task_alloc();
  v2[175] = swift_task_alloc();
  v2[176] = swift_task_alloc();
  sub_1000058C0(&qword_10003C4A0);
  v2[177] = swift_task_alloc();
  v2[178] = swift_task_alloc();
  v2[179] = swift_task_alloc();
  uint64_t v20 = sub_10002FFB0();
  v2[180] = v20;
  uint64_t v21 = *(void *)(v20 - 8);
  v2[181] = v21;
  v2[182] = *(void *)(v21 + 64);
  v2[183] = swift_task_alloc();
  v2[184] = swift_task_alloc();
  sub_1000307B0();
  v2[185] = sub_1000307A0();
  uint64_t v23 = sub_100030780();
  v2[186] = v23;
  v2[187] = v22;
  return ((uint64_t (*)(uint64_t (*)(), uint64_t, uint64_t))_swift_task_switch)(sub_1000080B0, v23, v22);
}

uint64_t sub_1000080B0()
{
  uint64_t v1 = *(void *)(v0 + 1432);
  uint64_t v2 = *(void *)(v0 + 1408);
  uint64_t v3 = *(void *)(v0 + 1376);
  uint64_t v4 = *(void *)(v0 + 1368);
  *(void *)(v0 + 1504) = sub_100030200();
  sub_1000301F0();
  sub_100030230();
  sub_1000301D0();
  swift_release();
  sub_10002FFA0();
  *(void *)(v0 + 1512) = sub_100030290();
  sub_100030280();
  *(void *)(v0 + 1520) = sub_100005F40();
  sub_10002FAB0();
  sub_10002FE10();
  uint64_t v5 = *(void (**)(uint64_t, uint64_t))(v3 + 8);
  *(void *)(v0 + 1528) = v5;
  *(void *)(v0 + 1536) = (v3 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v5(v2, v4);
  uint64_t v6 = sub_10002FE00();
  *(void *)(v0 + 1544) = v6;
  uint64_t v7 = *(void *)(v6 - 8);
  *(void *)(v0 + 1552) = v7;
  uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
  *(void *)(v0 + 1560) = v8;
  *(void *)(v0 + 1568) = (v7 + 48) & 0xFFFFFFFFFFFFLL | 0x60F0000000000000;
  int v9 = v8(v1, 1, v6);
  uint64_t v10 = *(void *)(v0 + 1432);
  if (v9 == 1)
  {
    sub_100010A0C(*(void *)(v0 + 1432), &qword_10003C4A0);
  }
  else
  {
    sub_10002FDE0();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v10, v6);
  }
  uint64_t v11 = *(void *)(v0 + 1360);
  uint64_t v12 = *(void *)(v0 + 1352);
  uint64_t v13 = *(void *)(v0 + 1344);
  uint64_t v14 = *(void *)(v0 + 1312);
  v187 = *(int **)(v0 + 1296);
  uint64_t v192 = *(void *)(v0 + 760);
  sub_100030270();
  swift_release();
  swift_bridgeObjectRelease();
  sub_1000301F0();
  (*(void (**)(uint64_t, void, uint64_t))(v12 + 104))(v11, enum case for GenerativeUsecases.textGeneration(_:), v13);
  sub_1000300E0();
  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v11, v13);
  sub_1000301B0();
  swift_release();
  sub_1000304D0();
  sub_10002FFD0();
  uint64_t v15 = v187[5];
  sub_1000058C0(&qword_10003C4A8);
  sub_10002FF50();
  sub_1000108F8(&qword_10003C4B0, (void (*)(uint64_t))type metadata accessor for ResponseImageEntity);
  *(void *)(v14 + v15) = sub_10002FBD0();
  uint64_t v16 = v187[6];
  sub_1000058C0(&qword_10003C4B8);
  sub_10002FF50();
  sub_1000108F8(&qword_10003C4C0, (void (*)(uint64_t))type metadata accessor for ResponseTextEntity);
  *(void *)(v14 + v16) = sub_10002FBD0();
  uint64_t v17 = v187[7];
  *(_DWORD *)(v0 + 1800) = v17;
  sub_1000058C0(&qword_10003C2E0);
  sub_10002FF50();
  *(void *)(v14 + v17) = sub_10002FBF0();
  uint64_t v18 = v187[8];
  *(_DWORD *)(v0 + 1804) = v18;
  sub_10002FF50();
  *(void *)(v14 + v18) = sub_10002FBF0();
  sub_100010150((void *)(v192 + 40), *(void *)(v192 + 64));
  if ((sub_100030100() & 1) == 0)
  {
    swift_release();
    sub_100030600();
    v47 = sub_100030620();
    os_log_type_t v48 = sub_1000307F0();
    BOOL v49 = os_log_type_enabled(v47, v48);
    uint64_t v50 = *(void *)(v0 + 1224);
    uint64_t v51 = *(void *)(v0 + 1216);
    uint64_t v52 = *(void *)(v0 + 1208);
    if (v49)
    {
      uint64_t v53 = swift_slowAlloc();
      uint64_t v199 = swift_slowAlloc();
      *(_DWORD *)uint64_t v53 = 136315394;
      *(void *)(v0 + 704) = sub_10002EB08(0xD000000000000019, 0x8000000100030F60, &v199);
      sub_100030830();
      *(_WORD *)(v53 + 12) = 2080;
      *(void *)(v0 + 736) = sub_10002EB08(0x286D726F66726570, 0xE900000000000029, &v199);
      sub_100030830();
      _os_log_impl((void *)&_mh_execute_header, v47, v48, "%s.%s request was restricted by MDM or parental controls.", (uint8_t *)v53, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    (*(void (**)(uint64_t, uint64_t))(v51 + 8))(v50, v52);
    uint64_t v54 = *(void *)(v0 + 1328);
    uint64_t v188 = *(void *)(v0 + 1320);
    uint64_t v193 = *(void *)(v0 + 1336);
    uint64_t v55 = *(void *)(v0 + 1304);
    uint64_t v56 = *(void *)(v0 + 1296);
    uint64_t v57 = *(void *)(v0 + 1104);
    uint64_t v58 = *(void *)(v0 + 1088);
    uint64_t v177 = *(void *)(v0 + 1080);
    uint64_t v183 = *(void *)(v0 + 1312);
    uint64_t v59 = *(void *)(v0 + 1064);
    uint64_t v60 = *(void *)(v0 + 832);
    uint64_t v61 = *(void *)(v0 + 824);
    uint64_t v62 = *(void *)(v0 + 816);
    sub_100010194(v183, v59);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v55 + 56))(v59, 0, 1, v56);
    sub_100030470();
    (*(void (**)(uint64_t, void, uint64_t))(v61 + 104))(v60, enum case for CatId.genericRestrictionResponse(_:), v62);
    sub_100030450();
    (*(void (**)(uint64_t, uint64_t))(v61 + 8))(v60, v62);
    sub_1000101F8();
    sub_10002FB70();
    (*(void (**)(uint64_t, uint64_t))(v58 + 8))(v57, v177);
    sub_100010A0C(v59, &qword_10003C478);
    sub_10001029C(v183);
    (*(void (**)(uint64_t, uint64_t))(v54 + 8))(v193, v188);
    goto LABEL_29;
  }
  sub_100010150((void *)(v192 + 40), *(void *)(v192 + 64));
  if (sub_100030120()) {
    goto LABEL_7;
  }
  uint64_t v19 = *(void *)(v0 + 1280);
  uint64_t v20 = *(void *)(v0 + 1264);
  uint64_t v21 = *(void *)(v0 + 1256);
  uint64_t v22 = *(void *)(v0 + 1248);
  sub_100030660();
  sub_100030650();
  uint64_t v23 = *(void (**)(uint64_t, uint64_t))(v20 + 8);
  *(void *)(v0 + 1576) = v23;
  *(void *)(v0 + 1584) = (v20 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v23(v19, v21);
  uint64_t v24 = sub_100030640();
  LODWORD(v19) = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 48))(v22, 1, v24);
  sub_100010A0C(v22, &qword_10003C498);
  if (v19 == 1)
  {
LABEL_7:
    uint64_t v25 = *(void *)(v0 + 1200);
    uint64_t v26 = *(void *)(v0 + 1184);
    uint64_t v27 = *(void *)(v0 + 1176);
    uint64_t v28 = *(void *)(v0 + 760);
    *(void *)(v0 + 616) = sub_1000302E0();
    *(void *)(v0 + 624) = v29;
    sub_10002FBB0();
    (*(void (**)(uint64_t, void, uint64_t))(v26 + 104))(v25, enum case for GenerativeAssistantUseCase.composition(_:), v27);
    sub_100010150((void *)(v28 + 40), *(void *)(v28 + 64));
    if ((sub_100030110() & 1) == 0)
    {
      swift_release();
      sub_100030600();
      uint64_t v63 = sub_100030620();
      os_log_type_t v64 = sub_1000307F0();
      BOOL v65 = os_log_type_enabled(v63, v64);
      uint64_t v66 = *(void *)(v0 + 1232);
      uint64_t v67 = *(void *)(v0 + 1216);
      uint64_t v68 = *(void *)(v0 + 1208);
      if (v65)
      {
        uint64_t v194 = *(void *)(v0 + 1232);
        uint64_t v69 = swift_slowAlloc();
        uint64_t v199 = swift_slowAlloc();
        *(_DWORD *)uint64_t v69 = 136315394;
        *(void *)(v0 + 728) = sub_10002EB08(0xD000000000000019, 0x8000000100030F60, &v199);
        sub_100030830();
        *(_WORD *)(v69 + 12) = 2080;
        *(void *)(v0 + 720) = sub_10002EB08(0x286D726F66726570, 0xE900000000000029, &v199);
        sub_100030830();
        _os_log_impl((void *)&_mh_execute_header, v63, v64, "%s.%s request is not available", (uint8_t *)v69, 0x16u);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        (*(void (**)(uint64_t, uint64_t))(v67 + 8))(v194, v68);
      }
      else
      {

        (*(void (**)(uint64_t, uint64_t))(v67 + 8))(v66, v68);
      }
      uint64_t v190 = *(void *)(v0 + 1320);
      uint64_t v196 = *(void *)(v0 + 1336);
      uint64_t v88 = *(void *)(v0 + 1304);
      uint64_t v89 = *(void *)(v0 + 1296);
      uint64_t v179 = *(void *)(v0 + 1200);
      uint64_t v185 = *(void *)(v0 + 1328);
      uint64_t v90 = *(void *)(v0 + 1184);
      uint64_t v169 = *(void *)(v0 + 1312);
      uint64_t v173 = *(void *)(v0 + 1176);
      uint64_t v91 = *(void *)(v0 + 1104);
      uint64_t v92 = *(void *)(v0 + 1088);
      uint64_t v93 = *(void *)(v0 + 1064);
      uint64_t v165 = *(void *)(v0 + 1080);
      uint64_t v94 = *(void *)(v0 + 832);
      uint64_t v95 = *(void *)(v0 + 824);
      uint64_t v96 = *(void *)(v0 + 816);
      sub_100010194(v169, v93);
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v88 + 56))(v93, 0, 1, v89);
      sub_100030470();
      (*(void (**)(uint64_t, void, uint64_t))(v95 + 104))(v94, enum case for CatId.disabledResponse(_:), v96);
      sub_100030450();
      (*(void (**)(uint64_t, uint64_t))(v95 + 8))(v94, v96);
      sub_1000101F8();
      sub_10002FB70();
      (*(void (**)(uint64_t, uint64_t))(v92 + 8))(v91, v165);
      sub_100010A0C(v93, &qword_10003C478);
      (*(void (**)(uint64_t, uint64_t))(v90 + 8))(v179, v173);
      uint64_t v97 = v169;
LABEL_28:
      sub_10001029C(v97);
      (*(void (**)(uint64_t, uint64_t))(v185 + 8))(v196, v190);
      goto LABEL_29;
    }
    sub_100010150(*(void **)(v0 + 760), *(void *)(*(void *)(v0 + 760) + 24));
    if ((sub_100030180() & 1) == 0)
    {
      uint64_t v78 = *(void *)(v0 + 1312);
      uint64_t v79 = *(void *)(v0 + 1304);
      uint64_t v80 = *(void *)(v0 + 1296);
      uint64_t v81 = *(void *)(v0 + 1056);
      swift_release();
      sub_100010194(v78, v81);
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v79 + 56))(v81, 0, 1, v80);
      uint64_t v31 = sub_10002FBA0();
      uint64_t v82 = *(void *)(v0 + 544);
      if (v82)
      {
        uint64_t v83 = *(void *)(v0 + 1328);
        uint64_t v189 = *(void *)(v0 + 1320);
        uint64_t v195 = *(void *)(v0 + 1336);
        uint64_t v178 = *(void *)(v0 + 1200);
        uint64_t v184 = *(void *)(v0 + 1312);
        uint64_t v84 = *(void *)(v0 + 1184);
        uint64_t v85 = *(void *)(v0 + 1096);
        uint64_t v86 = *(void *)(v0 + 1088);
        uint64_t v168 = *(void *)(v0 + 1080);
        uint64_t v172 = *(void *)(v0 + 1176);
        uint64_t v87 = *(void *)(v0 + 1056);
        sub_10000F190(*(void *)(v0 + 536), v82, 0, 0, v85);
        swift_bridgeObjectRelease();
        sub_1000101F8();
        sub_10002FB70();
        (*(void (**)(uint64_t, uint64_t))(v86 + 8))(v85, v168);
        sub_100010A0C(v87, &qword_10003C478);
        (*(void (**)(uint64_t, uint64_t))(v84 + 8))(v178, v172);
        sub_10001029C(v184);
        (*(void (**)(uint64_t, uint64_t))(v83 + 8))(v195, v189);
LABEL_29:
        uint64_t v98 = *(void *)(v0 + 1472);
        uint64_t v99 = *(void *)(v0 + 1448);
        uint64_t v159 = *(void *)(v0 + 1440);
        uint64_t v100 = *(void *)(v0 + 1040);
        sub_1000301F0();
        sub_100030230();
        uint64_t v101 = sub_1000305B0();
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v101 - 8) + 56))(v100, 1, 1, v101);
        sub_1000301C0();
        swift_release();
        sub_100010A0C(v100, &qword_10003C470);
        sub_1000301F0();
        sub_1000301E0();
        swift_release();
        sub_100030280();
        sub_100030260();
        swift_release();
        (*(void (**)(uint64_t, uint64_t))(v99 + 8))(v98, v159);
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
        v102 = *(uint64_t (**)(void))(v0 + 8);
        return v102();
      }
LABEL_47:
      __break(1u);
      return GenerateTextController.generateRichContent(userQuery:useCaseID:invocationContext:requestValueCallback:requestConfirmationCallback:progressReportingCallback:responseGenerationKeepAliveCallback:showJITEnablementCallback:)(v31, v32, v33, v34, v35, v36, v37, v38);
    }
    sub_1000102F8();
    uint64_t v30 = (void *)sub_10002FED0();
    uint64_t v31 = sub_100030310();
    float v40 = v39 * 100.0;
    if ((~LODWORD(v40) & 0x7F800000) != 0)
    {
      if (v40 > -9.2234e18)
      {
        if (v40 < 9.2234e18)
        {
          v182 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v0 + 1560);
          uint64_t v176 = *(void *)(v0 + 1544);
          v41 = *(void (**)(uint64_t, uint64_t))(v0 + 1528);
          uint64_t v42 = *(void *)(v0 + 1424);
          uint64_t v43 = *(void *)(v0 + 1400);
          uint64_t v44 = *(void *)(v0 + 1368);
          [v30 setTotalUnitCount:(uint64_t)v40];

          sub_10002FC20();
          sub_10002FAB0();
          sub_10002FE10();
          v41(v43, v44);
          if (v182(v42, 1, v176) == 1)
          {
            uint64_t v45 = *(void *)(v0 + 1144);
            sub_100010A0C(*(void *)(v0 + 1424), &qword_10003C4A0);
            uint64_t v46 = sub_10002FDC0();
            (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v46 - 8) + 56))(v45, 1, 1, v46);
          }
          else
          {
            uint64_t v103 = *(void *)(v0 + 1552);
            uint64_t v104 = *(void *)(v0 + 1544);
            uint64_t v105 = *(void *)(v0 + 1424);
            sub_10002FDD0();
            (*(void (**)(uint64_t, uint64_t))(v103 + 8))(v105, v104);
          }
          v186 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v0 + 1560);
          v106 = *(void (**)(uint64_t, uint64_t))(v0 + 1528);
          uint64_t v174 = *(void *)(v0 + 1416);
          uint64_t v180 = *(void *)(v0 + 1544);
          uint64_t v107 = *(void *)(v0 + 1392);
          uint64_t v108 = *(void *)(v0 + 1384);
          uint64_t v109 = *(void *)(v0 + 1368);
          uint64_t v166 = *(void *)(v0 + 1192);
          uint64_t v170 = *(void *)(v0 + 1200);
          uint64_t v110 = *(void *)(v0 + 1184);
          uint64_t v163 = *(void *)(v0 + 1176);
          uint64_t v111 = *(void *)(v0 + 1144);
          uint64_t v112 = *(void *)(v0 + 1128);
          sub_100030810();
          sub_100010A0C(v111, &qword_10003C490);
          sub_10002FAB0();
          sub_10002FE20();
          v106(v107, v109);
          sub_100030820();
          sub_100010A0C(v112, &qword_10003C488);
          (*(void (**)(uint64_t, uint64_t, uint64_t))(v110 + 16))(v166, v170, v163);
          sub_10002FAB0();
          sub_10002FE10();
          v106(v108, v109);
          if (v186(v174, 1, v180) == 1)
          {
            sub_100010A0C(*(void *)(v0 + 1416), &qword_10003C4A0);
          }
          else
          {
            uint64_t v113 = *(void *)(v0 + 1552);
            uint64_t v114 = *(void *)(v0 + 1544);
            uint64_t v115 = *(void *)(v0 + 1416);
            sub_10002FDF0();
            (*(void (**)(uint64_t, uint64_t))(v113 + 8))(v115, v114);
          }
          uint64_t v116 = *(void *)(v0 + 1072);
          sub_100030480();
          sub_100030560();
          sub_100030550();
          sub_100030540();
          swift_release();
          uint64_t v117 = sub_1000058C0(&qword_10003C4E0);
          if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v117 - 8) + 48))(v116, 1, v117) == 1)
          {
            sub_100010A0C(*(void *)(v0 + 1072), &qword_10003C480);
            char v118 = sub_1000305A0();
            v119 = &unk_10003C520;
            if (v118)
            {
              uint64_t v126 = 0;
            }
            else
            {
              uint64_t v120 = *(void *)(v0 + 1464);
              uint64_t v121 = *(void *)(v0 + 1456);
              uint64_t v122 = *(void *)(v0 + 1448);
              uint64_t v123 = *(void *)(v0 + 1440);
              uint64_t v124 = *(void *)(v0 + 760);
              (*(void (**)(uint64_t, void, uint64_t))(v122 + 16))(v120, *(void *)(v0 + 1472), v123);
              sub_10001034C(v124, v0 + 432);
              unint64_t v125 = (*(unsigned __int8 *)(v122 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v122 + 80);
              uint64_t v126 = swift_allocObject();
              (*(void (**)(unint64_t, uint64_t, uint64_t))(v122 + 32))(v126 + v125, v120, v123);
              unint64_t v127 = v126 + ((v121 + v125 + 7) & 0xFFFFFFFFFFFFFFF8);
              long long v128 = *(_OWORD *)(v0 + 512);
              *(_OWORD *)(v127 + 64) = *(_OWORD *)(v0 + 496);
              *(_OWORD *)(v127 + 80) = v128;
              *(void *)(v127 + 96) = *(void *)(v0 + 528);
              long long v129 = *(_OWORD *)(v0 + 448);
              *(_OWORD *)unint64_t v127 = *(_OWORD *)(v0 + 432);
              *(_OWORD *)(v127 + 16) = v129;
              long long v130 = *(_OWORD *)(v0 + 480);
              *(_OWORD *)(v127 + 32) = *(_OWORD *)(v0 + 464);
              *(_OWORD *)(v127 + 48) = v130;
              v119 = &unk_10003C4F0;
            }
            v197 = v119;
            *(void *)(v0 + 1608) = v126;
            uint64_t v139 = *(void *)(v0 + 760);
            sub_10001034C(v139, v0 + 328);
            uint64_t v140 = swift_allocObject();
            *(void *)(v0 + 1616) = v140;
            long long v141 = *(_OWORD *)(v0 + 408);
            *(_OWORD *)(v140 + 80) = *(_OWORD *)(v0 + 392);
            *(_OWORD *)(v140 + 96) = v141;
            *(void *)(v140 + 112) = *(void *)(v0 + 424);
            long long v142 = *(_OWORD *)(v0 + 344);
            *(_OWORD *)(v140 + 16) = *(_OWORD *)(v0 + 328);
            *(_OWORD *)(v140 + 32) = v142;
            long long v143 = *(_OWORD *)(v0 + 376);
            *(_OWORD *)(v140 + 48) = *(_OWORD *)(v0 + 360);
            *(_OWORD *)(v140 + 64) = v143;
            sub_10002FC20();
            uint64_t v191 = *(void *)(v0 + 600);
            uint64_t v144 = *(void *)(v0 + 608);
            *(void *)(v0 + 1624) = v144;
            sub_10001034C(v139, v0 + 224);
            uint64_t v145 = swift_allocObject();
            *(void *)(v0 + 1632) = v145;
            long long v146 = *(_OWORD *)(v0 + 304);
            *(_OWORD *)(v145 + 80) = *(_OWORD *)(v0 + 288);
            *(_OWORD *)(v145 + 96) = v146;
            *(void *)(v145 + 112) = *(void *)(v0 + 320);
            long long v147 = *(_OWORD *)(v0 + 240);
            *(_OWORD *)(v145 + 16) = *(_OWORD *)(v0 + 224);
            *(_OWORD *)(v145 + 32) = v147;
            long long v148 = *(_OWORD *)(v0 + 272);
            *(_OWORD *)(v145 + 48) = *(_OWORD *)(v0 + 256);
            *(_OWORD *)(v145 + 64) = v148;
            sub_10001034C(v139, v0 + 16);
            uint64_t v149 = swift_allocObject();
            *(void *)(v0 + 1640) = v149;
            long long v150 = *(_OWORD *)(v0 + 96);
            *(_OWORD *)(v149 + 80) = *(_OWORD *)(v0 + 80);
            *(_OWORD *)(v149 + 96) = v150;
            *(void *)(v149 + 112) = *(void *)(v0 + 112);
            long long v151 = *(_OWORD *)(v0 + 32);
            *(_OWORD *)(v149 + 16) = *(_OWORD *)(v0 + 16);
            *(_OWORD *)(v149 + 32) = v151;
            long long v152 = *(_OWORD *)(v0 + 64);
            *(_OWORD *)(v149 + 48) = *(_OWORD *)(v0 + 48);
            *(_OWORD *)(v149 + 64) = v152;
            sub_10001034C(v139, v0 + 120);
            uint64_t v153 = swift_allocObject();
            *(void *)(v0 + 1648) = v153;
            long long v154 = *(_OWORD *)(v0 + 168);
            long long v155 = *(_OWORD *)(v0 + 200);
            *(_OWORD *)(v153 + 80) = *(_OWORD *)(v0 + 184);
            *(_OWORD *)(v153 + 96) = v155;
            *(void *)(v153 + 112) = *(void *)(v0 + 216);
            long long v156 = *(_OWORD *)(v0 + 136);
            *(_OWORD *)(v153 + 16) = *(_OWORD *)(v0 + 120);
            *(_OWORD *)(v153 + 32) = v156;
            *(_OWORD *)(v153 + 48) = *(_OWORD *)(v0 + 152);
            *(_OWORD *)(v153 + 64) = v154;
            swift_retain();
            v157 = (void *)swift_task_alloc();
            *(void *)(v0 + 1656) = v157;
            void *v157 = v0;
            v157[1] = sub_10000AEEC;
            uint64_t v34 = *(void *)(v0 + 1200);
            uint64_t v35 = *(void *)(v0 + 1168);
            uint64_t v31 = *(void *)(v0 + 1032);
            uint64_t v36 = &unk_10003C510;
            uint64_t v32 = v191;
            uint64_t v38 = v197;
            uint64_t v33 = v144;
            uint64_t v37 = v145;
            return GenerateTextController.generateRichContent(userQuery:useCaseID:invocationContext:requestValueCallback:requestConfirmationCallback:progressReportingCallback:responseGenerationKeepAliveCallback:showJITEnablementCallback:)(v31, v32, v33, v34, v35, v36, v37, v38);
          }
          uint64_t v190 = *(void *)(v0 + 1320);
          uint64_t v196 = *(void *)(v0 + 1336);
          uint64_t v160 = *(void *)(v0 + 1312);
          uint64_t v131 = *(void *)(v0 + 1304);
          uint64_t v181 = *(void *)(v0 + 1200);
          uint64_t v185 = *(void *)(v0 + 1328);
          uint64_t v171 = *(void *)(v0 + 1184);
          uint64_t v175 = *(void *)(v0 + 1176);
          uint64_t v162 = *(void *)(v0 + 1160);
          uint64_t v164 = *(void *)(v0 + 1152);
          uint64_t v167 = *(void *)(v0 + 1168);
          uint64_t v132 = *(void *)(v0 + 1112);
          uint64_t v133 = *(void *)(v0 + 1088);
          uint64_t v134 = *(void *)(v0 + 1080);
          v135 = *(char **)(v0 + 1072);
          uint64_t v136 = *(void *)(v0 + 1064);
          uint64_t v161 = *(void *)(v0 + 1296);
          swift_release();
          uint64_t v137 = *(void *)v135;
          uint64_t v138 = *((void *)v135 + 1);
          (*(void (**)(uint64_t, char *, uint64_t))(v133 + 32))(v132, &v135[*(int *)(v117 + 48)], v134);
          *(void *)(v0 + 648) = v137;
          *(void *)(v0 + 656) = v138;
          sub_10002FBB0();
          sub_100010194(v160, v136);
          (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v131 + 56))(v136, 0, 1, v161);
          sub_1000101F8();
          sub_10002FB70();
          sub_100010A0C(v136, &qword_10003C478);
          (*(void (**)(uint64_t, uint64_t))(v133 + 8))(v132, v134);
          (*(void (**)(uint64_t, uint64_t))(v162 + 8))(v167, v164);
          (*(void (**)(uint64_t, uint64_t))(v171 + 8))(v181, v175);
          uint64_t v97 = v160;
          goto LABEL_28;
        }
        goto LABEL_46;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
LABEL_46:
    __break(1u);
    goto LABEL_47;
  }
  sub_100030600();
  uint64_t v70 = sub_100030620();
  os_log_type_t v71 = sub_1000307F0();
  BOOL v72 = os_log_type_enabled(v70, v71);
  uint64_t v73 = *(void *)(v0 + 1240);
  uint64_t v74 = *(void *)(v0 + 1216);
  uint64_t v75 = *(void *)(v0 + 1208);
  if (v72)
  {
    uint64_t v76 = swift_slowAlloc();
    uint64_t v199 = swift_slowAlloc();
    *(_DWORD *)uint64_t v76 = 136315394;
    *(void *)(v0 + 744) = sub_10002EB08(0xD000000000000019, 0x8000000100030F60, &v199);
    sub_100030830();
    *(_WORD *)(v76 + 12) = 2080;
    *(void *)(v0 + 712) = sub_10002EB08(0x286D726F66726570, 0xE900000000000029, &v199);
    sub_100030830();
    _os_log_impl((void *)&_mh_execute_header, v70, v71, "%s.%s External intelligence sign in is restricted -- signing out.", (uint8_t *)v76, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  (*(void (**)(uint64_t, uint64_t))(v74 + 8))(v73, v75);
  sub_100030660();
  uint64_t v77 = (void *)swift_task_alloc();
  *(void *)(v0 + 1592) = v77;
  *uint64_t v77 = v0;
  v77[1] = sub_100009BC4;
  return OpenAIAuthenticator.signOut()();
}

uint64_t sub_100009BC4()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 1600) = v0;
  swift_task_dealloc();
  (*(void (**)(void, void))(v2 + 1576))(*(void *)(v2 + 1272), *(void *)(v2 + 1256));
  uint64_t v3 = *(void *)(v2 + 1496);
  uint64_t v4 = *(void *)(v2 + 1488);
  if (v0) {
    uint64_t v5 = sub_10000D6D4;
  }
  else {
    uint64_t v5 = sub_100009D54;
  }
  return ((uint64_t (*)(uint64_t (*)(), uint64_t, uint64_t))_swift_task_switch)(v5, v4, v3);
}

uint64_t sub_100009D54()
{
  uint64_t v1 = *(void *)(v0 + 1200);
  uint64_t v2 = *(void *)(v0 + 1184);
  uint64_t v3 = *(void *)(v0 + 1176);
  uint64_t v4 = *(void *)(v0 + 760);
  *(void *)(v0 + 616) = sub_1000302E0();
  *(void *)(v0 + 624) = v5;
  sub_10002FBB0();
  (*(void (**)(uint64_t, void, uint64_t))(v2 + 104))(v1, enum case for GenerativeAssistantUseCase.composition(_:), v3);
  sub_100010150((void *)(v4 + 40), *(void *)(v4 + 64));
  if (sub_100030110())
  {
    sub_100010150(*(void **)(v0 + 760), *(void *)(*(void *)(v0 + 760) + 24));
    if ((sub_100030180() & 1) == 0)
    {
      uint64_t v40 = *(void *)(v0 + 1312);
      uint64_t v41 = *(void *)(v0 + 1304);
      uint64_t v42 = *(void *)(v0 + 1296);
      uint64_t v43 = *(void *)(v0 + 1056);
      swift_release();
      sub_100010194(v40, v43);
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v41 + 56))(v43, 0, 1, v42);
      uint64_t v7 = sub_10002FBA0();
      uint64_t v44 = *(void *)(v0 + 544);
      if (v44)
      {
        uint64_t v45 = *(void *)(v0 + 1328);
        uint64_t v138 = *(void *)(v0 + 1320);
        uint64_t v141 = *(void *)(v0 + 1336);
        uint64_t v130 = *(void *)(v0 + 1200);
        uint64_t v135 = *(void *)(v0 + 1312);
        uint64_t v46 = *(void *)(v0 + 1184);
        uint64_t v47 = *(void *)(v0 + 1096);
        uint64_t v48 = *(void *)(v0 + 1088);
        uint64_t v121 = *(void *)(v0 + 1080);
        uint64_t v125 = *(void *)(v0 + 1176);
        uint64_t v49 = *(void *)(v0 + 1056);
        sub_10000F190(*(void *)(v0 + 536), v44, 0, 0, v47);
        swift_bridgeObjectRelease();
        sub_1000101F8();
        sub_10002FB70();
        (*(void (**)(uint64_t, uint64_t))(v48 + 8))(v47, v121);
        sub_100010A0C(v49, &qword_10003C478);
        (*(void (**)(uint64_t, uint64_t))(v46 + 8))(v130, v125);
        sub_10001029C(v135);
        (*(void (**)(uint64_t, uint64_t))(v45 + 8))(v141, v138);
        goto LABEL_14;
      }
LABEL_32:
      __break(1u);
      return GenerateTextController.generateRichContent(userQuery:useCaseID:invocationContext:requestValueCallback:requestConfirmationCallback:progressReportingCallback:responseGenerationKeepAliveCallback:showJITEnablementCallback:)(v7, v8, v9, v10, v11, v12, v13, v14);
    }
    sub_1000102F8();
    uint64_t v6 = (void *)sub_10002FED0();
    uint64_t v7 = sub_100030310();
    float v16 = v15 * 100.0;
    if ((~LODWORD(v16) & 0x7F800000) != 0)
    {
      if (v16 > -9.2234e18)
      {
        if (v16 < 9.2234e18)
        {
          uint64_t v133 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v0 + 1560);
          uint64_t v128 = *(void *)(v0 + 1544);
          uint64_t v17 = *(void (**)(uint64_t, uint64_t))(v0 + 1528);
          uint64_t v18 = *(void *)(v0 + 1424);
          uint64_t v19 = *(void *)(v0 + 1400);
          uint64_t v20 = *(void *)(v0 + 1368);
          [v6 setTotalUnitCount:(uint64_t)v16];

          sub_10002FC20();
          sub_10002FAB0();
          sub_10002FE10();
          v17(v19, v20);
          if (v133(v18, 1, v128) == 1)
          {
            uint64_t v21 = *(void *)(v0 + 1144);
            sub_100010A0C(*(void *)(v0 + 1424), &qword_10003C4A0);
            uint64_t v22 = sub_10002FDC0();
            (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56))(v21, 1, 1, v22);
          }
          else
          {
            uint64_t v56 = *(void *)(v0 + 1552);
            uint64_t v57 = *(void *)(v0 + 1544);
            uint64_t v58 = *(void *)(v0 + 1424);
            sub_10002FDD0();
            (*(void (**)(uint64_t, uint64_t))(v56 + 8))(v58, v57);
          }
          uint64_t v136 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v0 + 1560);
          uint64_t v59 = *(void (**)(uint64_t, uint64_t))(v0 + 1528);
          uint64_t v126 = *(void *)(v0 + 1416);
          uint64_t v131 = *(void *)(v0 + 1544);
          uint64_t v60 = *(void *)(v0 + 1392);
          uint64_t v61 = *(void *)(v0 + 1384);
          uint64_t v62 = *(void *)(v0 + 1368);
          uint64_t v118 = *(void *)(v0 + 1192);
          uint64_t v122 = *(void *)(v0 + 1200);
          uint64_t v63 = *(void *)(v0 + 1184);
          uint64_t v115 = *(void *)(v0 + 1176);
          uint64_t v64 = *(void *)(v0 + 1144);
          uint64_t v65 = *(void *)(v0 + 1128);
          sub_100030810();
          sub_100010A0C(v64, &qword_10003C490);
          sub_10002FAB0();
          sub_10002FE20();
          v59(v60, v62);
          sub_100030820();
          sub_100010A0C(v65, &qword_10003C488);
          (*(void (**)(uint64_t, uint64_t, uint64_t))(v63 + 16))(v118, v122, v115);
          sub_10002FAB0();
          sub_10002FE10();
          v59(v61, v62);
          if (v136(v126, 1, v131) == 1)
          {
            sub_100010A0C(*(void *)(v0 + 1416), &qword_10003C4A0);
          }
          else
          {
            uint64_t v66 = *(void *)(v0 + 1552);
            uint64_t v67 = *(void *)(v0 + 1544);
            uint64_t v68 = *(void *)(v0 + 1416);
            sub_10002FDF0();
            (*(void (**)(uint64_t, uint64_t))(v66 + 8))(v68, v67);
          }
          uint64_t v69 = *(void *)(v0 + 1072);
          sub_100030480();
          sub_100030560();
          sub_100030550();
          sub_100030540();
          swift_release();
          uint64_t v70 = sub_1000058C0(&qword_10003C4E0);
          if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v70 - 8) + 48))(v69, 1, v70) == 1)
          {
            sub_100010A0C(*(void *)(v0 + 1072), &qword_10003C480);
            char v71 = sub_1000305A0();
            BOOL v72 = &unk_10003C520;
            if (v71)
            {
              uint64_t v79 = 0;
            }
            else
            {
              uint64_t v73 = *(void *)(v0 + 1464);
              uint64_t v74 = *(void *)(v0 + 1456);
              uint64_t v75 = *(void *)(v0 + 1448);
              uint64_t v76 = *(void *)(v0 + 1440);
              uint64_t v77 = *(void *)(v0 + 760);
              (*(void (**)(uint64_t, void, uint64_t))(v75 + 16))(v73, *(void *)(v0 + 1472), v76);
              sub_10001034C(v77, v0 + 432);
              unint64_t v78 = (*(unsigned __int8 *)(v75 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v75 + 80);
              uint64_t v79 = swift_allocObject();
              (*(void (**)(unint64_t, uint64_t, uint64_t))(v75 + 32))(v79 + v78, v73, v76);
              unint64_t v80 = v79 + ((v74 + v78 + 7) & 0xFFFFFFFFFFFFFFF8);
              long long v81 = *(_OWORD *)(v0 + 512);
              *(_OWORD *)(v80 + 64) = *(_OWORD *)(v0 + 496);
              *(_OWORD *)(v80 + 80) = v81;
              *(void *)(v80 + 96) = *(void *)(v0 + 528);
              long long v82 = *(_OWORD *)(v0 + 448);
              *(_OWORD *)unint64_t v80 = *(_OWORD *)(v0 + 432);
              *(_OWORD *)(v80 + 16) = v82;
              long long v83 = *(_OWORD *)(v0 + 480);
              *(_OWORD *)(v80 + 32) = *(_OWORD *)(v0 + 464);
              *(_OWORD *)(v80 + 48) = v83;
              BOOL v72 = &unk_10003C4F0;
            }
            long long v142 = v72;
            *(void *)(v0 + 1608) = v79;
            uint64_t v92 = *(void *)(v0 + 760);
            sub_10001034C(v92, v0 + 328);
            uint64_t v93 = swift_allocObject();
            *(void *)(v0 + 1616) = v93;
            long long v94 = *(_OWORD *)(v0 + 408);
            *(_OWORD *)(v93 + 80) = *(_OWORD *)(v0 + 392);
            *(_OWORD *)(v93 + 96) = v94;
            *(void *)(v93 + 112) = *(void *)(v0 + 424);
            long long v95 = *(_OWORD *)(v0 + 344);
            *(_OWORD *)(v93 + 16) = *(_OWORD *)(v0 + 328);
            *(_OWORD *)(v93 + 32) = v95;
            long long v96 = *(_OWORD *)(v0 + 376);
            *(_OWORD *)(v93 + 48) = *(_OWORD *)(v0 + 360);
            *(_OWORD *)(v93 + 64) = v96;
            sub_10002FC20();
            uint64_t v139 = *(void *)(v0 + 600);
            uint64_t v97 = *(void *)(v0 + 608);
            *(void *)(v0 + 1624) = v97;
            sub_10001034C(v92, v0 + 224);
            uint64_t v98 = swift_allocObject();
            *(void *)(v0 + 1632) = v98;
            long long v99 = *(_OWORD *)(v0 + 304);
            *(_OWORD *)(v98 + 80) = *(_OWORD *)(v0 + 288);
            *(_OWORD *)(v98 + 96) = v99;
            *(void *)(v98 + 112) = *(void *)(v0 + 320);
            long long v100 = *(_OWORD *)(v0 + 240);
            *(_OWORD *)(v98 + 16) = *(_OWORD *)(v0 + 224);
            *(_OWORD *)(v98 + 32) = v100;
            long long v101 = *(_OWORD *)(v0 + 272);
            *(_OWORD *)(v98 + 48) = *(_OWORD *)(v0 + 256);
            *(_OWORD *)(v98 + 64) = v101;
            sub_10001034C(v92, v0 + 16);
            uint64_t v102 = swift_allocObject();
            *(void *)(v0 + 1640) = v102;
            long long v103 = *(_OWORD *)(v0 + 96);
            *(_OWORD *)(v102 + 80) = *(_OWORD *)(v0 + 80);
            *(_OWORD *)(v102 + 96) = v103;
            *(void *)(v102 + 112) = *(void *)(v0 + 112);
            long long v104 = *(_OWORD *)(v0 + 32);
            *(_OWORD *)(v102 + 16) = *(_OWORD *)(v0 + 16);
            *(_OWORD *)(v102 + 32) = v104;
            long long v105 = *(_OWORD *)(v0 + 64);
            *(_OWORD *)(v102 + 48) = *(_OWORD *)(v0 + 48);
            *(_OWORD *)(v102 + 64) = v105;
            sub_10001034C(v92, v0 + 120);
            uint64_t v106 = swift_allocObject();
            *(void *)(v0 + 1648) = v106;
            long long v107 = *(_OWORD *)(v0 + 168);
            long long v108 = *(_OWORD *)(v0 + 200);
            *(_OWORD *)(v106 + 80) = *(_OWORD *)(v0 + 184);
            *(_OWORD *)(v106 + 96) = v108;
            *(void *)(v106 + 112) = *(void *)(v0 + 216);
            long long v109 = *(_OWORD *)(v0 + 136);
            *(_OWORD *)(v106 + 16) = *(_OWORD *)(v0 + 120);
            *(_OWORD *)(v106 + 32) = v109;
            *(_OWORD *)(v106 + 48) = *(_OWORD *)(v0 + 152);
            *(_OWORD *)(v106 + 64) = v107;
            swift_retain();
            uint64_t v110 = (void *)swift_task_alloc();
            *(void *)(v0 + 1656) = v110;
            *uint64_t v110 = v0;
            v110[1] = sub_10000AEEC;
            uint64_t v10 = *(void *)(v0 + 1200);
            uint64_t v11 = *(void *)(v0 + 1168);
            uint64_t v7 = *(void *)(v0 + 1032);
            uint64_t v12 = &unk_10003C510;
            uint64_t v8 = v139;
            uint64_t v14 = v142;
            uint64_t v9 = v97;
            uint64_t v13 = v98;
            return GenerateTextController.generateRichContent(userQuery:useCaseID:invocationContext:requestValueCallback:requestConfirmationCallback:progressReportingCallback:responseGenerationKeepAliveCallback:showJITEnablementCallback:)(v7, v8, v9, v10, v11, v12, v13, v14);
          }
          uint64_t v137 = *(void *)(v0 + 1320);
          uint64_t v140 = *(void *)(v0 + 1336);
          uint64_t v112 = *(void *)(v0 + 1312);
          uint64_t v84 = *(void *)(v0 + 1304);
          uint64_t v132 = *(void *)(v0 + 1200);
          uint64_t v134 = *(void *)(v0 + 1328);
          uint64_t v123 = *(void *)(v0 + 1184);
          uint64_t v127 = *(void *)(v0 + 1176);
          uint64_t v114 = *(void *)(v0 + 1160);
          uint64_t v116 = *(void *)(v0 + 1152);
          uint64_t v119 = *(void *)(v0 + 1168);
          uint64_t v85 = *(void *)(v0 + 1112);
          uint64_t v86 = *(void *)(v0 + 1088);
          uint64_t v87 = *(void *)(v0 + 1080);
          uint64_t v88 = *(char **)(v0 + 1072);
          uint64_t v89 = *(void *)(v0 + 1064);
          uint64_t v113 = *(void *)(v0 + 1296);
          swift_release();
          uint64_t v90 = *(void *)v88;
          uint64_t v91 = *((void *)v88 + 1);
          (*(void (**)(uint64_t, char *, uint64_t))(v86 + 32))(v85, &v88[*(int *)(v70 + 48)], v87);
          *(void *)(v0 + 648) = v90;
          *(void *)(v0 + 656) = v91;
          sub_10002FBB0();
          sub_100010194(v112, v89);
          (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v84 + 56))(v89, 0, 1, v113);
          sub_1000101F8();
          sub_10002FB70();
          sub_100010A0C(v89, &qword_10003C478);
          (*(void (**)(uint64_t, uint64_t))(v86 + 8))(v85, v87);
          (*(void (**)(uint64_t, uint64_t))(v114 + 8))(v119, v116);
          (*(void (**)(uint64_t, uint64_t))(v123 + 8))(v132, v127);
          uint64_t v39 = v112;
          goto LABEL_11;
        }
        goto LABEL_31;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
LABEL_31:
    __break(1u);
    goto LABEL_32;
  }
  swift_release();
  sub_100030600();
  uint64_t v23 = sub_100030620();
  os_log_type_t v24 = sub_1000307F0();
  BOOL v25 = os_log_type_enabled(v23, v24);
  uint64_t v26 = *(void *)(v0 + 1232);
  uint64_t v27 = *(void *)(v0 + 1216);
  uint64_t v28 = *(void *)(v0 + 1208);
  if (v25)
  {
    uint64_t v29 = swift_slowAlloc();
    uint64_t v144 = swift_slowAlloc();
    *(_DWORD *)uint64_t v29 = 136315394;
    *(void *)(v0 + 728) = sub_10002EB08(0xD000000000000019, 0x8000000100030F60, &v144);
    sub_100030830();
    *(_WORD *)(v29 + 12) = 2080;
    *(void *)(v0 + 720) = sub_10002EB08(0x286D726F66726570, 0xE900000000000029, &v144);
    sub_100030830();
    _os_log_impl((void *)&_mh_execute_header, v23, v24, "%s.%s request is not available", (uint8_t *)v29, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v26, v28);
  uint64_t v137 = *(void *)(v0 + 1320);
  uint64_t v140 = *(void *)(v0 + 1336);
  uint64_t v30 = *(void *)(v0 + 1304);
  uint64_t v31 = *(void *)(v0 + 1296);
  uint64_t v129 = *(void *)(v0 + 1200);
  uint64_t v134 = *(void *)(v0 + 1328);
  uint64_t v32 = *(void *)(v0 + 1184);
  uint64_t v120 = *(void *)(v0 + 1312);
  uint64_t v124 = *(void *)(v0 + 1176);
  uint64_t v33 = *(void *)(v0 + 1104);
  uint64_t v34 = *(void *)(v0 + 1088);
  uint64_t v35 = *(void *)(v0 + 1064);
  uint64_t v117 = *(void *)(v0 + 1080);
  uint64_t v36 = *(void *)(v0 + 832);
  uint64_t v37 = *(void *)(v0 + 824);
  uint64_t v38 = *(void *)(v0 + 816);
  sub_100010194(v120, v35);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v30 + 56))(v35, 0, 1, v31);
  sub_100030470();
  (*(void (**)(uint64_t, void, uint64_t))(v37 + 104))(v36, enum case for CatId.disabledResponse(_:), v38);
  sub_100030450();
  (*(void (**)(uint64_t, uint64_t))(v37 + 8))(v36, v38);
  sub_1000101F8();
  sub_10002FB70();
  (*(void (**)(uint64_t, uint64_t))(v34 + 8))(v33, v117);
  sub_100010A0C(v35, &qword_10003C478);
  (*(void (**)(uint64_t, uint64_t))(v32 + 8))(v129, v124);
  uint64_t v39 = v120;
LABEL_11:
  sub_10001029C(v39);
  (*(void (**)(uint64_t, uint64_t))(v134 + 8))(v140, v137);
LABEL_14:
  uint64_t v50 = *(void *)(v0 + 1472);
  uint64_t v51 = *(void *)(v0 + 1448);
  uint64_t v111 = *(void *)(v0 + 1440);
  uint64_t v52 = *(void *)(v0 + 1040);
  sub_1000301F0();
  sub_100030230();
  uint64_t v53 = sub_1000305B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v53 - 8) + 56))(v52, 1, 1, v53);
  sub_1000301C0();
  swift_release();
  sub_100010A0C(v52, &qword_10003C470);
  sub_1000301F0();
  sub_1000301E0();
  swift_release();
  sub_100030280();
  sub_100030260();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v51 + 8))(v50, v111);
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
  uint64_t v54 = *(uint64_t (**)(void))(v0 + 8);
  return v54();
}

uint64_t sub_10000AEEC()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 1664) = v0;
  swift_task_dealloc();
  if (v0)
  {
    swift_bridgeObjectRelease();
    swift_release();
    swift_release();
    swift_release();
    uint64_t v3 = *(void *)(v2 + 1496);
    uint64_t v4 = *(void *)(v2 + 1488);
    uint64_t v5 = sub_10000DB44;
  }
  else
  {
    swift_release();
    swift_release();
    swift_bridgeObjectRelease();
    swift_release();
    swift_release();
    uint64_t v3 = *(void *)(v2 + 1496);
    uint64_t v4 = *(void *)(v2 + 1488);
    uint64_t v5 = sub_10000B07C;
  }
  return ((uint64_t (*)(uint64_t (*)(), uint64_t, uint64_t))_swift_task_switch)(v5, v4, v3);
}

uint64_t sub_10000B07C()
{
  uint64_t v1 = *(void *)(v0 + 760);
  uint64_t v2 = sub_100030350();
  uint64_t v3 = swift_task_alloc();
  *(void *)(v3 + 16) = v1;
  sub_1000218DC((void (*)(_OWORD *__return_ptr, void *))sub_100010870, v3, v2, v0 + 696);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  uint64_t v4 = sub_1000303E0();
  *(void *)(v0 + 1672) = v4;
  uint64_t v5 = *(void *)(v4 + 16);
  *(void *)(v0 + 1680) = v5;
  if (v5)
  {
    uint64_t v6 = *(void *)(v0 + 1000);
    uint64_t v7 = *(void (**)(void, unint64_t, void))(v6 + 16);
    v6 += 16;
    int v8 = *(_DWORD *)(v6 + 64);
    *(_DWORD *)(v0 + 1808) = v8;
    *(void *)(v0 + 1688) = *(void *)(v6 + 56);
    *(void *)(v0 + 1696) = v7;
    *(void *)(v0 + 1712) = &_swiftEmptyArrayStorage;
    *(void *)(v0 + 1704) = 0;
    v7(*(void *)(v0 + 1008), v4 + ((v8 + 32) & ~(unint64_t)v8), *(void *)(v0 + 992));
    uint64_t v9 = (void *)swift_task_alloc();
    *(void *)(v0 + 1720) = v9;
    *uint64_t v9 = v0;
    v9[1] = sub_10000B694;
    uint64_t v10 = *(void *)(v0 + 984);
    return sub_100004DF0(v10);
  }
  else
  {
    swift_bridgeObjectRelease();
    *(void *)(v0 + 1728) = &_swiftEmptyArrayStorage;
    if (sub_1000303A0())
    {
      uint64_t v12 = (void *)swift_task_alloc();
      *(void *)(v0 + 1736) = v12;
      *uint64_t v12 = v0;
      v12[1] = sub_10000BE64;
      uint64_t v13 = *(void *)(v0 + 952);
      return static ModelDisclaimer.rateLimitDisclaimer()(v13);
    }
    else
    {
      uint64_t v14 = *(void *)(v0 + 952);
      uint64_t v15 = sub_1000300B0();
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v14, 1, 1, v15);
      uint64_t v16 = *(void *)(v0 + 944);
      uint64_t v17 = *(void *)(v0 + 912);
      uint64_t v18 = *(void *)(v0 + 904);
      uint64_t v19 = *(void *)(v0 + 896);
      uint64_t v20 = *(void *)(v0 + 776);
      uint64_t v21 = *(void *)(v0 + 768);
      uint64_t v22 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v20 + 56);
      *(void *)(v0 + 1744) = v22;
      *(void *)(v0 + 1752) = (v20 + 56) & 0xFFFFFFFFFFFFLL | 0xA0D1000000000000;
      v22(v16, 1, 1, v21);
      sub_100030420();
      int v23 = (*(uint64_t (**)(uint64_t, uint64_t))(v18 + 88))(v17, v19);
      if (v23 == enum case for GeneratedResponse.Outcome.success(_:))
      {
        type metadata accessor for SnippetPluginUtils();
        swift_bridgeObjectRetain();
        uint64_t v24 = sub_100030380();
        uint64_t v26 = v25;
        *(void *)(v0 + 1760) = v25;
        uint64_t v27 = sub_100030370();
        uint64_t v29 = v28;
        *(void *)(v0 + 1768) = v28;
        sub_100030330();
        *(void *)(v0 + 1776) = sub_100030390();
        uint64_t v30 = (void *)swift_task_alloc();
        *(void *)(v0 + 1784) = v30;
        *uint64_t v30 = v0;
        v30[1] = sub_10000C36C;
        uint64_t v31 = *(void *)(v0 + 1728);
        uint64_t v32 = *(void *)(v0 + 936);
        uint64_t v33 = *(void *)(v0 + 888);
        return sub_100004780(v32, v31, v24, v26, v27, v29, (uint64_t)&_swiftEmptyArrayStorage, v33);
      }
      else
      {
        if (v23 == enum case for GeneratedResponse.Outcome.textAssistantHandoff(_:))
        {
          uint64_t v34 = *(void *)(v0 + 928);
          uint64_t v35 = *(void *)(v0 + 880);
          uint64_t v36 = *(void *)(v0 + 872);
          uint64_t v37 = *(void *)(v0 + 864);
          uint64_t v42 = *(void *)(v0 + 944);
          uint64_t v43 = *(void *)(v0 + 768);
          sub_100030050();
          (*(void (**)(uint64_t, void, uint64_t))(v36 + 104))(v35, enum case for GenerativeResultModels.GenerativeTAHandoffSnippet(_:), v37);
          sub_1000108F8((unint64_t *)&qword_10003C398, (void (*)(uint64_t))&type metadata accessor for GenerativeResultModels);
          sub_100030010();
          (*(void (**)(uint64_t, uint64_t))(v36 + 8))(v35, v37);
          sub_100030030();
          sub_10002FDA0();
          sub_10002FEA0();
          sub_100010A0C(v42, &qword_10003C468);
          v22(v34, 0, 1, v43);
          sub_100010940(v34, v42);
        }
        else
        {
          (*(void (**)(void, void))(*(void *)(v0 + 904) + 8))(*(void *)(v0 + 912), *(void *)(v0 + 896));
        }
        *(void *)(v0 + 680) = sub_1000303C0();
        *(void *)(v0 + 688) = v38;
        sub_10002FBB0();
        *(void *)(v0 + 664) = sub_100030430();
        *(void *)(v0 + 672) = v39;
        sub_10002FBB0();
        uint64_t v40 = (void *)swift_task_alloc();
        *(void *)(v0 + 1792) = v40;
        *uint64_t v40 = v0;
        v40[1] = sub_10000C67C;
        uint64_t v41 = *(void *)(v0 + 1728);
        return sub_100010B08(v41);
      }
    }
  }
}

uint64_t sub_10000B694()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  uint64_t v2 = *(void *)(v1 + 1496);
  uint64_t v3 = *(void *)(v1 + 1488);
  return ((uint64_t (*)(uint64_t (*)(), uint64_t, uint64_t))_swift_task_switch)(sub_10000B7B4, v3, v2);
}

uint64_t sub_10000B7B4()
{
  (*(void (**)(void, void, void))(*(void *)(v0 + 968) + 16))(*(void *)(v0 + 976), *(void *)(v0 + 984), *(void *)(v0 + 960));
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  unint64_t v2 = *(void *)(v0 + 1712);
  if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
    unint64_t v2 = sub_10002C958(0, *(void *)(v2 + 16) + 1, 1, *(void *)(v0 + 1712));
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    unint64_t v2 = sub_10002C958(v3 > 1, v4 + 1, 1, v2);
  }
  uint64_t v46 = *(void *)(v0 + 1008);
  uint64_t v48 = *(void *)(v0 + 1680);
  uint64_t v5 = *(void *)(v0 + 1000);
  uint64_t v6 = *(void *)(v0 + 992);
  uint64_t v7 = *(void *)(v0 + 984);
  uint64_t v8 = *(void *)(v0 + 976);
  uint64_t v9 = *(void *)(v0 + 968);
  uint64_t v10 = *(void *)(v0 + 960);
  uint64_t v11 = *(void *)(v0 + 1704) + 1;
  *(void *)(v2 + 16) = v4 + 1;
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v9 + 32))(v2+ ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80))+ *(void *)(v9 + 72) * v4, v8, v10);
  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v7, v10);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v46, v6);
  if (v11 == v48)
  {
    swift_bridgeObjectRelease();
    *(void *)(v0 + 1728) = v2;
    if (sub_1000303A0())
    {
      uint64_t v12 = (void *)swift_task_alloc();
      *(void *)(v0 + 1736) = v12;
      *uint64_t v12 = v0;
      v12[1] = sub_10000BE64;
      uint64_t v13 = *(void *)(v0 + 952);
      return static ModelDisclaimer.rateLimitDisclaimer()(v13);
    }
    else
    {
      uint64_t v17 = *(void *)(v0 + 952);
      uint64_t v18 = sub_1000300B0();
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v17, 1, 1, v18);
      uint64_t v19 = *(void *)(v0 + 944);
      uint64_t v20 = *(void *)(v0 + 912);
      uint64_t v21 = *(void *)(v0 + 904);
      uint64_t v22 = *(void *)(v0 + 896);
      uint64_t v23 = *(void *)(v0 + 776);
      uint64_t v24 = *(void *)(v0 + 768);
      uint64_t v25 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v23 + 56);
      *(void *)(v0 + 1744) = v25;
      *(void *)(v0 + 1752) = (v23 + 56) & 0xFFFFFFFFFFFFLL | 0xA0D1000000000000;
      v25(v19, 1, 1, v24);
      sub_100030420();
      int v26 = (*(uint64_t (**)(uint64_t, uint64_t))(v21 + 88))(v20, v22);
      if (v26 == enum case for GeneratedResponse.Outcome.success(_:))
      {
        type metadata accessor for SnippetPluginUtils();
        swift_bridgeObjectRetain();
        uint64_t v27 = sub_100030380();
        uint64_t v29 = v28;
        *(void *)(v0 + 1760) = v28;
        uint64_t v30 = sub_100030370();
        uint64_t v32 = v31;
        *(void *)(v0 + 1768) = v31;
        sub_100030330();
        *(void *)(v0 + 1776) = sub_100030390();
        uint64_t v33 = (void *)swift_task_alloc();
        *(void *)(v0 + 1784) = v33;
        *uint64_t v33 = v0;
        v33[1] = sub_10000C36C;
        uint64_t v34 = *(void *)(v0 + 1728);
        uint64_t v35 = *(void *)(v0 + 936);
        uint64_t v36 = *(void *)(v0 + 888);
        return sub_100004780(v35, v34, v27, v29, v30, v32, (uint64_t)&_swiftEmptyArrayStorage, v36);
      }
      else
      {
        if (v26 == enum case for GeneratedResponse.Outcome.textAssistantHandoff(_:))
        {
          uint64_t v37 = *(void *)(v0 + 928);
          uint64_t v38 = *(void *)(v0 + 880);
          uint64_t v39 = *(void *)(v0 + 872);
          uint64_t v40 = *(void *)(v0 + 864);
          uint64_t v47 = *(void *)(v0 + 944);
          uint64_t v49 = *(void *)(v0 + 768);
          sub_100030050();
          (*(void (**)(uint64_t, void, uint64_t))(v39 + 104))(v38, enum case for GenerativeResultModels.GenerativeTAHandoffSnippet(_:), v40);
          sub_1000108F8((unint64_t *)&qword_10003C398, (void (*)(uint64_t))&type metadata accessor for GenerativeResultModels);
          sub_100030010();
          (*(void (**)(uint64_t, uint64_t))(v39 + 8))(v38, v40);
          sub_100030030();
          sub_10002FDA0();
          sub_10002FEA0();
          sub_100010A0C(v47, &qword_10003C468);
          v25(v37, 0, 1, v49);
          sub_100010940(v37, v47);
        }
        else
        {
          (*(void (**)(void, void))(*(void *)(v0 + 904) + 8))(*(void *)(v0 + 912), *(void *)(v0 + 896));
        }
        *(void *)(v0 + 680) = sub_1000303C0();
        *(void *)(v0 + 688) = v41;
        sub_10002FBB0();
        *(void *)(v0 + 664) = sub_100030430();
        *(void *)(v0 + 672) = v42;
        sub_10002FBB0();
        uint64_t v43 = (void *)swift_task_alloc();
        *(void *)(v0 + 1792) = v43;
        *uint64_t v43 = v0;
        v43[1] = sub_10000C67C;
        uint64_t v44 = *(void *)(v0 + 1728);
        return sub_100010B08(v44);
      }
    }
  }
  else
  {
    uint64_t v14 = *(void *)(v0 + 1704) + 1;
    *(void *)(v0 + 1712) = v2;
    *(void *)(v0 + 1704) = v14;
    (*(void (**)(void, unint64_t, void))(v0 + 1696))(*(void *)(v0 + 1008), *(void *)(v0 + 1672)+ ((*(unsigned __int8 *)(v0 + 1808) + 32) & ~(unint64_t)*(unsigned __int8 *)(v0 + 1808))+ *(void *)(v0 + 1688) * v14, *(void *)(v0 + 992));
    uint64_t v15 = (void *)swift_task_alloc();
    *(void *)(v0 + 1720) = v15;
    *uint64_t v15 = v0;
    v15[1] = sub_10000B694;
    uint64_t v16 = *(void *)(v0 + 984);
    return sub_100004DF0(v16);
  }
}

uint64_t sub_10000BE64()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  uint64_t v2 = *(void *)(v1 + 1496);
  uint64_t v3 = *(void *)(v1 + 1488);
  return ((uint64_t (*)(uint64_t (*)(), uint64_t, uint64_t))_swift_task_switch)(sub_10000BF84, v3, v2);
}

uint64_t sub_10000BF84()
{
  uint64_t v1 = v0[118];
  uint64_t v2 = v0[114];
  uint64_t v3 = v0[113];
  uint64_t v4 = v0[112];
  uint64_t v5 = v0[97];
  uint64_t v6 = v0[96];
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v5 + 56);
  v0[218] = v7;
  v0[219] = (v5 + 56) & 0xFFFFFFFFFFFFLL | 0xA0D1000000000000;
  v7(v1, 1, 1, v6);
  sub_100030420();
  int v8 = (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 88))(v2, v4);
  if (v8 == enum case for GeneratedResponse.Outcome.success(_:))
  {
    type metadata accessor for SnippetPluginUtils();
    swift_bridgeObjectRetain();
    uint64_t v9 = sub_100030380();
    uint64_t v11 = v10;
    v0[220] = v10;
    uint64_t v12 = sub_100030370();
    uint64_t v14 = v13;
    v0[221] = v13;
    sub_100030330();
    v0[222] = sub_100030390();
    uint64_t v15 = (void *)swift_task_alloc();
    v0[223] = v15;
    *uint64_t v15 = v0;
    v15[1] = sub_10000C36C;
    uint64_t v16 = v0[216];
    uint64_t v17 = v0[117];
    uint64_t v18 = v0[111];
    return sub_100004780(v17, v16, v9, v11, v12, v14, (uint64_t)&_swiftEmptyArrayStorage, v18);
  }
  else
  {
    if (v8 == enum case for GeneratedResponse.Outcome.textAssistantHandoff(_:))
    {
      uint64_t v20 = v0[116];
      uint64_t v21 = v0[110];
      uint64_t v22 = v0[109];
      uint64_t v23 = v0[108];
      uint64_t v28 = v0[118];
      uint64_t v29 = v0[96];
      sub_100030050();
      (*(void (**)(uint64_t, void, uint64_t))(v22 + 104))(v21, enum case for GenerativeResultModels.GenerativeTAHandoffSnippet(_:), v23);
      sub_1000108F8((unint64_t *)&qword_10003C398, (void (*)(uint64_t))&type metadata accessor for GenerativeResultModels);
      sub_100030010();
      (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v21, v23);
      sub_100030030();
      sub_10002FDA0();
      sub_10002FEA0();
      sub_100010A0C(v28, &qword_10003C468);
      v7(v20, 0, 1, v29);
      sub_100010940(v20, v28);
    }
    else
    {
      (*(void (**)(void, void))(v0[113] + 8))(v0[114], v0[112]);
    }
    v0[85] = sub_1000303C0();
    v0[86] = v24;
    sub_10002FBB0();
    v0[83] = sub_100030430();
    v0[84] = v25;
    sub_10002FBB0();
    int v26 = (void *)swift_task_alloc();
    v0[224] = v26;
    *int v26 = v0;
    v26[1] = sub_10000C67C;
    uint64_t v27 = v0[216];
    return sub_100010B08(v27);
  }
}

uint64_t sub_10000C36C()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void *)(*v0 + 888);
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_100010A0C(v2, &qword_10003C390);
  uint64_t v3 = *(void *)(v1 + 1496);
  uint64_t v4 = *(void *)(v1 + 1488);
  return ((uint64_t (*)(uint64_t (*)(), uint64_t, uint64_t))_swift_task_switch)(sub_10000C538, v4, v3);
}

uint64_t sub_10000C538()
{
  uint64_t v1 = (void (*)(uint64_t, void, uint64_t, uint64_t))v0[218];
  uint64_t v2 = v0[118];
  uint64_t v3 = v0[117];
  uint64_t v4 = v0[96];
  sub_100010A0C(v2, &qword_10003C468);
  v1(v3, 0, 1, v4);
  sub_100010940(v3, v2);
  v0[85] = sub_1000303C0();
  v0[86] = v5;
  sub_10002FBB0();
  v0[83] = sub_100030430();
  v0[84] = v6;
  sub_10002FBB0();
  uint64_t v7 = (void *)swift_task_alloc();
  v0[224] = v7;
  *uint64_t v7 = v0;
  v7[1] = sub_10000C67C;
  uint64_t v8 = v0[216];
  return sub_100010B08(v8);
}

uint64_t sub_10000C67C()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  uint64_t v2 = *(void *)(v1 + 1496);
  uint64_t v3 = *(void *)(v1 + 1488);
  return ((uint64_t (*)(uint64_t (*)(), uint64_t, uint64_t))_swift_task_switch)(sub_10000C7C0, v3, v2);
}

uint64_t sub_10000C7C0()
{
  uint64_t v1 = v0[105];
  uint64_t v2 = v0[103];
  uint64_t v3 = v0[102];
  swift_release();
  sub_1000303D0();
  (*(void (**)(uint64_t, void, uint64_t))(v2 + 104))(v1, enum case for CatId.empty(_:), v3);
  sub_1000108F8(&qword_10003C518, (void (*)(uint64_t))&type metadata accessor for CatId);
  sub_100030740();
  sub_100030740();
  uint64_t v4 = v0[106];
  uint64_t v5 = v0[105];
  uint64_t v6 = v0[103];
  uint64_t v7 = v0[102];
  if (v0[79] == v0[69] && v0[80] == v0[70])
  {
    swift_bridgeObjectRelease_n();
    uint64_t v8 = *(void (**)(uint64_t, uint64_t))(v6 + 8);
    v8(v5, v7);
    v8(v4, v7);
  }
  else
  {
    char v9 = sub_1000308B0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v10 = *(void (**)(uint64_t, uint64_t))(v6 + 8);
    v10(v5, v7);
    v10(v4, v7);
    if ((v9 & 1) == 0)
    {
      uint64_t v62 = 0;
      uint64_t v12 = 0xE000000000000000;
      goto LABEL_9;
    }
  }
  uint64_t v11 = (void *)sub_1000303F0();
  if (v11[2] == 1)
  {
    uint64_t v12 = v11[5];
    uint64_t v62 = v11[4];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
LABEL_9:
    uint64_t v33 = v0[115];
    uint64_t v34 = v0[97];
    uint64_t v35 = v0[96];
    sub_100010890(v0[118], v33);
    int v36 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v34 + 48))(v33, 1, v35);
    uint64_t v82 = v0[164];
    uint64_t v37 = v0[163];
    uint64_t v38 = v0[162];
    uint64_t v39 = v0[150];
    uint64_t v40 = v0[138];
    uint64_t v41 = v0[136];
    uint64_t v42 = v0[133];
    uint64_t v67 = v0[167];
    uint64_t v65 = v0[165];
    uint64_t v66 = v0[166];
    uint64_t v79 = v0[147];
    uint64_t v81 = v0[148];
    uint64_t v74 = v0[145];
    uint64_t v76 = v0[146];
    uint64_t v70 = v0[129];
    uint64_t v72 = v0[144];
    uint64_t v68 = v0[119];
    uint64_t v69 = v0[127];
    uint64_t v63 = v0[118];
    uint64_t v64 = v0[128];
    uint64_t v61 = v0[135];
    if (v36 == 1)
    {
      uint64_t v60 = v0[136];
      uint64_t v43 = v0[138];
      sub_100010A0C(v0[115], &qword_10003C468);
      uint64_t v44 = v12;
      sub_100010194(v82, v42);
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v37 + 56))(v42, 0, 1, v38);
      sub_10002FBA0();
      uint64_t v46 = v65;
      uint64_t v45 = v66;
      sub_10000F190(v62, v44, v0[71], v0[72], v40);
      uint64_t v47 = v64;
      swift_bridgeObjectRelease();
      uint64_t v48 = v67;
      swift_bridgeObjectRelease();
      sub_1000101F8();
      sub_10002FB70();
      swift_release();
      (*(void (**)(uint64_t, uint64_t))(v60 + 8))(v43, v61);
      sub_100010A0C(v42, &qword_10003C478);
      uint64_t v49 = v63;
    }
    else
    {
      uint64_t v50 = v0[97];
      uint64_t v59 = v0[96];
      uint64_t v58 = v0[98];
      (*(void (**)(void))(v50 + 32))();
      sub_100010194(v82, v42);
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v37 + 56))(v42, 0, 1, v38);
      sub_10002FBA0();
      sub_10000F190(v62, v12, v0[73], v0[74], v40);
      uint64_t v47 = v64;
      swift_bridgeObjectRelease();
      uint64_t v45 = v66;
      swift_bridgeObjectRelease();
      sub_1000101F8();
      sub_10002FB80();
      swift_release();
      (*(void (**)(uint64_t, uint64_t))(v41 + 8))(v40, v61);
      sub_100010A0C(v42, &qword_10003C478);
      uint64_t v46 = v65;
      (*(void (**)(uint64_t, uint64_t))(v50 + 8))(v58, v59);
      uint64_t v49 = v63;
      uint64_t v48 = v67;
    }
    sub_100010A0C(v49, &qword_10003C468);
    sub_100010A0C(v68, &qword_10003C388);
    (*(void (**)(uint64_t, uint64_t))(v47 + 8))(v70, v69);
    (*(void (**)(uint64_t, uint64_t))(v74 + 8))(v76, v72);
    (*(void (**)(uint64_t, uint64_t))(v81 + 8))(v39, v79);
    sub_10001029C(v82);
    (*(void (**)(uint64_t, uint64_t))(v45 + 8))(v48, v46);
    swift_release();
    uint64_t v51 = v0[184];
    uint64_t v52 = v0[181];
    uint64_t v57 = v0[180];
    uint64_t v53 = v0[130];
    sub_1000301F0();
    sub_100030230();
    uint64_t v54 = sub_1000305B0();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v54 - 8) + 56))(v53, 1, 1, v54);
    sub_1000301C0();
    swift_release();
    sub_100010A0C(v53, &qword_10003C470);
    sub_1000301F0();
    sub_1000301E0();
    swift_release();
    sub_100030280();
    sub_100030260();
    swift_release();
    (*(void (**)(uint64_t, uint64_t))(v52 + 8))(v51, v57);
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
    uint64_t v32 = (uint64_t (*)(void))v0[1];
    goto LABEL_13;
  }
  uint64_t v77 = v0[146];
  uint64_t v13 = v0[145];
  uint64_t v73 = v0[129];
  uint64_t v75 = v0[144];
  uint64_t v14 = v0[128];
  uint64_t v71 = v0[127];
  uint64_t v15 = v0[119];
  uint64_t v16 = v0[118];
  uint64_t v17 = (void *)v0[101];
  uint64_t v18 = v0[100];
  uint64_t v19 = v0[99];
  swift_bridgeObjectRelease();
  *uint64_t v17 = 0xD00000000000002ELL;
  v17[1] = 0x8000000100031F90;
  (*(void (**)(void *, void, uint64_t))(v18 + 104))(v17, enum case for GATError.notImplemented(_:), v19);
  sub_100030210();
  (*(void (**)(void *, uint64_t))(v18 + 8))(v17, v19);
  swift_willThrow();
  swift_release();
  sub_100010A0C(v16, &qword_10003C468);
  sub_100010A0C(v15, &qword_10003C388);
  (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v73, v71);
  (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v77, v75);
  swift_release();
  uint64_t v20 = v0[166];
  uint64_t v78 = v0[165];
  uint64_t v80 = v0[167];
  uint64_t v21 = v0[164];
  uint64_t v22 = v0[150];
  uint64_t v23 = v0[148];
  uint64_t v24 = v0[147];
  id v25 = [objc_allocWithZone((Class)SDRDiagnosticReporter) init];
  type metadata accessor for AutoBugCaptureHelper();
  uint64_t v26 = swift_allocObject();
  *(void *)(v26 + 16) = v25;
  *(void *)(v26 + 24) = 0;
  uint64_t v27 = (void *)sub_10002FF30();
  sub_10002E1A4(1, v27);
  swift_release();

  swift_willThrow();
  (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v22, v24);
  sub_10001029C(v21);
  (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v80, v78);
  uint64_t v28 = v0[184];
  uint64_t v29 = v0[181];
  uint64_t v56 = v0[180];
  uint64_t v30 = v0[130];
  sub_1000301F0();
  sub_100030230();
  uint64_t v31 = sub_1000305B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v31 - 8) + 56))(v30, 1, 1, v31);
  sub_1000301C0();
  swift_release();
  sub_100010A0C(v30, &qword_10003C470);
  sub_1000301F0();
  sub_1000301E0();
  swift_release();
  sub_100030280();
  sub_100030260();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v29 + 8))(v28, v56);
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
  uint64_t v32 = (uint64_t (*)(void))v0[1];
LABEL_13:
  return v32();
}

uint64_t sub_10000D6D4()
{
  uint64_t v1 = v0[167];
  uint64_t v2 = v0[166];
  uint64_t v3 = v0[165];
  uint64_t v4 = v0[164];
  swift_release();
  sub_10001029C(v4);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  uint64_t v5 = v0[184];
  uint64_t v6 = v0[181];
  uint64_t v11 = v0[180];
  uint64_t v7 = v0[130];
  sub_1000301F0();
  sub_100030230();
  uint64_t v8 = sub_1000305B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 1, 1, v8);
  sub_1000301C0();
  swift_release();
  sub_100010A0C(v7, &qword_10003C470);
  sub_1000301F0();
  sub_1000301E0();
  swift_release();
  sub_100030280();
  sub_100030260();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v11);
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
  char v9 = (uint64_t (*)(void))v0[1];
  return v9();
}

uint64_t sub_10000DB44()
{
  uint64_t v1 = v0[146];
  uint64_t v2 = v0[145];
  uint64_t v3 = v0[144];
  swift_release();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_release();
  swift_release();
  uint64_t v4 = v0[166];
  uint64_t v19 = v0[165];
  uint64_t v20 = v0[167];
  uint64_t v5 = v0[164];
  uint64_t v6 = v0[150];
  uint64_t v7 = v0[148];
  uint64_t v8 = v0[147];
  id v9 = [objc_allocWithZone((Class)SDRDiagnosticReporter) init];
  type metadata accessor for AutoBugCaptureHelper();
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v9;
  *(void *)(v10 + 24) = 0;
  uint64_t v11 = (void *)sub_10002FF30();
  sub_10002E1A4(1, v11);

  swift_release();
  swift_willThrow();
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v6, v8);
  sub_10001029C(v5);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v20, v19);
  uint64_t v12 = v0[184];
  uint64_t v13 = v0[181];
  uint64_t v18 = v0[180];
  uint64_t v14 = v0[130];
  sub_1000301F0();
  sub_100030230();
  uint64_t v15 = sub_1000305B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v14, 1, 1, v15);
  sub_1000301C0();
  swift_release();
  sub_100010A0C(v14, &qword_10003C470);
  sub_1000301F0();
  sub_1000301E0();
  swift_release();
  sub_100030280();
  sub_100030260();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v12, v18);
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
  uint64_t v16 = (uint64_t (*)(void))v0[1];
  return v16();
}

uint64_t sub_10000E090()
{
  uint64_t v1 = sub_100030630();
  v0[4] = v1;
  v0[5] = *(void *)(v1 - 8);
  v0[6] = swift_task_alloc();
  sub_1000307B0();
  v0[7] = sub_1000307A0();
  uint64_t v3 = sub_100030780();
  return ((uint64_t (*)(uint64_t (*)(), uint64_t, uint64_t))_swift_task_switch)(sub_10000E180, v3, v2);
}

uint64_t sub_10000E180()
{
  uint64_t v13 = v0;
  swift_release();
  sub_100030600();
  uint64_t v1 = sub_100030620();
  os_log_type_t v2 = sub_1000307F0();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = v0[5];
    uint64_t v10 = v0[4];
    uint64_t v11 = v0[6];
    uint64_t v4 = swift_slowAlloc();
    uint64_t v12 = swift_slowAlloc();
    *(_DWORD *)uint64_t v4 = 136315394;
    v0[2] = sub_10002EB08(0xD000000000000019, 0x8000000100030F60, &v12);
    sub_100030830();
    *(_WORD *)(v4 + 12) = 2080;
    v0[3] = sub_10002EB08(0x286D726F66726570, 0xE900000000000029, &v12);
    sub_100030830();
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "%s.%s Skipping confirmation", (uint8_t *)v4, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v11, v10);
  }
  else
  {
    uint64_t v6 = v0[5];
    uint64_t v5 = v0[6];
    uint64_t v7 = v0[4];

    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);
  }
  swift_task_dealloc();
  uint64_t v8 = (uint64_t (*)(void))v0[1];
  return v8();
}

uint64_t sub_10000E394(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5)
{
  *(void *)(v5 + 32) = a4;
  *(void *)(v5 + 40) = a5;
  *(unsigned char *)(v5 + 88) = a3;
  *(void *)(v5 + 16) = a1;
  *(void *)(v5 + 24) = a2;
  sub_1000307B0();
  *(void *)(v5 + 48) = sub_1000307A0();
  uint64_t v7 = sub_100030780();
  *(void *)(v5 + 56) = v7;
  *(void *)(v5 + 64) = v6;
  return ((uint64_t (*)(uint64_t (*)(), uint64_t, uint64_t))_swift_task_switch)(sub_10000E434, v7, v6);
}

uint64_t sub_10000E434()
{
  uint64_t v1 = *(void **)(v0 + 16);
  id v2 = [objc_allocWithZone((Class)SDRDiagnosticReporter) init];
  type metadata accessor for AutoBugCaptureHelper();
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = v2;
  *(void *)(v3 + 24) = 0;
  sub_10002F31C(1);
  swift_release();
  uint64_t v5 = v1[3];
  uint64_t v4 = v1[4];
  uint64_t v6 = sub_100010150(v1, v5);
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v0 + 72) = v7;
  unint64_t v8 = sub_100005F40();
  *uint64_t v7 = v0;
  v7[1] = sub_10000E56C;
  uint64_t v9 = *(unsigned __int8 *)(v0 + 88);
  uint64_t v10 = *(void *)(v0 + 24);
  return AppIntent.requestConfirmation<A>(result:confirmationActionName:showPrompt:)(v6, v10, v9, &type metadata for GenerateRichContentIntent, v5, v8, v4);
}

uint64_t sub_10000E56C()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 80) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 64);
  uint64_t v4 = *(void *)(v2 + 56);
  if (v0) {
    uint64_t v5 = sub_10000E70C;
  }
  else {
    uint64_t v5 = sub_10000E6A8;
  }
  return ((uint64_t (*)(uint64_t (*)(), uint64_t, uint64_t))_swift_task_switch)(v5, v4, v3);
}

uint64_t sub_10000E6A8()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_10000E70C()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_10000E770(uint64_t a1)
{
  v1[2] = a1;
  sub_1000307B0();
  v1[3] = sub_1000307A0();
  uint64_t v3 = sub_100030780();
  v1[4] = v3;
  v1[5] = v2;
  return ((uint64_t (*)(uint64_t (*)(), uint64_t, uint64_t))_swift_task_switch)(sub_10000E808, v3, v2);
}

uint64_t sub_10000E808()
{
  sub_100030570();
  NSString v1 = sub_1000306F0();
  swift_bridgeObjectRelease();
  sub_10002FC20();
  id v2 = [self montaraEnablementWithBundleIdentifier:v1 source:2 isExplicitRequest:*(unsigned char *)(v0 + 72) & 1];
  *(void *)(v0 + 48) = v2;

  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 56) = v3;
  unint64_t v4 = sub_100005F40();
  *uint64_t v3 = v0;
  v3[1] = sub_10000E928;
  return AppIntent.requestConfirmation(systemStyle:)(v2, &type metadata for GenerateRichContentIntent, v4);
}

uint64_t sub_10000E928()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 64) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void *)(v2 + 32);
    uint64_t v4 = *(void *)(v2 + 40);
    uint64_t v5 = sub_10000EAA8;
  }
  else
  {

    uint64_t v3 = *(void *)(v2 + 32);
    uint64_t v4 = *(void *)(v2 + 40);
    uint64_t v5 = sub_10000EA44;
  }
  return ((uint64_t (*)(uint64_t (*)(), uint64_t, uint64_t))_swift_task_switch)(v5, v3, v4);
}

uint64_t sub_10000EA44()
{
  swift_release();
  NSString v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_10000EAA8()
{
  swift_release();
  NSString v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_10000EB18(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[5] = a2;
  v3[6] = a3;
  v3[4] = a1;
  sub_1000058C0(&qword_10003C428);
  v3[7] = swift_task_alloc();
  sub_1000307B0();
  v3[8] = sub_1000307A0();
  uint64_t v5 = sub_100030780();
  v3[9] = v5;
  v3[10] = v4;
  return ((uint64_t (*)(uint64_t (*)(), uint64_t, uint64_t))_swift_task_switch)(sub_10000EBE4, v5, v4);
}

uint64_t sub_10000EBE4()
{
  uint64_t v1 = v0[7];
  v0[11] = sub_10002FC40();
  swift_bridgeObjectRetain();
  sub_10002FB50();
  uint64_t v2 = sub_10002FB60();
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56))(v1, 0, 1, v2);
  uint64_t v3 = (void *)swift_task_alloc();
  v0[12] = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_10000ED08;
  uint64_t v4 = v0[7];
  return IntentParameter.requestValue(_:)(v0 + 2, v4);
}

uint64_t sub_10000ED08()
{
  uint64_t v2 = *v1;
  uint64_t v3 = *(void *)(*v1 + 56);
  *(void *)(*v1 + 104) = v0;
  swift_task_dealloc();
  sub_100010A0C(v3, &qword_10003C428);
  swift_release();
  uint64_t v4 = *(void *)(v2 + 80);
  uint64_t v5 = *(void *)(v2 + 72);
  if (v0) {
    uint64_t v6 = sub_10000EF0C;
  }
  else {
    uint64_t v6 = sub_10000EE8C;
  }
  return ((uint64_t (*)(uint64_t (*)(), uint64_t, uint64_t))_swift_task_switch)(v6, v5, v4);
}

uint64_t sub_10000EE8C()
{
  swift_release();
  uint64_t v1 = v0[2];
  uint64_t v2 = v0[3];
  swift_task_dealloc();
  uint64_t v3 = (uint64_t (*)(uint64_t, uint64_t))v0[1];
  return v3(v1, v2);
}

uint64_t sub_10000EF0C()
{
  swift_release();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

void sub_10000EF78(float a1)
{
  sub_1000302F0();
  if (vabds_f32(a1, v2) < 0.0001 || (sub_100030300(), vabds_f32(a1, v3) < 0.0001))
  {
    sub_1000102F8();
    uint64_t v4 = (void *)sub_10002FED0();
    NSString v5 = sub_1000306F0();
    [v4 setLocalizedDescription:v5];
  }
  sub_1000102F8();
  uint64_t v6 = (void *)sub_10002FED0();
  float v7 = a1 * 100.0;
  if ((~COERCE_INT(a1 * 100.0) & 0x7F800000) == 0)
  {
    __break(1u);
    goto LABEL_11;
  }
  if (v7 <= -9.2234e18)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  if (v7 >= 9.2234e18)
  {
LABEL_12:
    __break(1u);
    return;
  }
  id v8 = v6;
  [v6 setCompletedUnitCount:(uint64_t)v7];
}

uint64_t sub_10000F0F4@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v6 = *a1;
  uint64_t v5 = a1[1];
  sub_1000109A8(a2, (uint64_t)v9);
  sub_1000109A8(a2 + 40, (uint64_t)v8);
  sub_100006CB0(v9, v8, a3);
  *(void *)&v9[0] = v6;
  *((void *)&v9[0] + 1) = v5;
  swift_bridgeObjectRetain();
  sub_10002FC30();
  LOBYTE(v9[0]) = 1;
  return sub_10002FC30();
}

uint64_t sub_10000F190@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  v23[1] = a3;
  v23[2] = a4;
  v23[4] = a1;
  v23[5] = a2;
  v23[3] = a5;
  uint64_t v5 = sub_100030530();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin();
  id v8 = (char *)v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23[0] = sub_10002FFE0();
  uint64_t v9 = *(void *)(v23[0] - 8);
  __chkstk_darwin();
  uint64_t v11 = (char *)v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_10002FE30();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin();
  uint64_t v15 = (char *)v23 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000058C0(&qword_10003C4A0);
  __chkstk_darwin();
  uint64_t v17 = (char *)v23 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100005F40();
  sub_10002FAB0();
  sub_10002FE10();
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  uint64_t v18 = sub_10002FE00();
  uint64_t v19 = *(void *)(v18 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48))(v17, 1, v18) == 1)
  {
    sub_100010A0C((uint64_t)v17, &qword_10003C4A0);
LABEL_4:
    sub_10002FFD0();
    sub_10002FFC0();
    (*(void (**)(char *, void))(v9 + 8))(v11, v23[0]);
    swift_bridgeObjectRelease();
    goto LABEL_5;
  }
  sub_10002FDE0();
  uint64_t v21 = v20;
  (*(void (**)(char *, uint64_t))(v19 + 8))(v17, v18);
  if (!v21) {
    goto LABEL_4;
  }
LABEL_5:
  sub_100030470();
  (*(void (**)(char *, void, uint64_t))(v6 + 104))(v8, enum case for CatId.generateRichContentResponse(_:), v5);
  sub_100030460();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_10000F524()
{
  return sub_10002FE40();
}

unint64_t sub_10000F568()
{
  unint64_t result = qword_10003C3D8;
  if (!qword_10003C3D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003C3D8);
  }
  return result;
}

unint64_t sub_10000F5C0()
{
  unint64_t result = qword_10003C3E0;
  if (!qword_10003C3E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003C3E0);
  }
  return result;
}

uint64_t sub_10000F614()
{
  return *(void *)(swift_getOpaqueTypeConformance2() + 8);
}

uint64_t sub_10000F648()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10000F664@<X0>(uint64_t a1@<X8>)
{
  if (qword_10003C298 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_10002FF70();
  uint64_t v3 = sub_100010A68(v2, (uint64_t)qword_10003CC48);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

uint64_t sub_10000F70C()
{
  return 0;
}

uint64_t sub_10000F718()
{
  return 1;
}

uint64_t sub_10000F728(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_10000F7C0;
  return sub_1000075EC(a1);
}

uint64_t sub_10000F7C0()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_10000F8B8(uint64_t a1)
{
  unint64_t v2 = sub_1000100FC();

  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

uint64_t sub_10000F904(uint64_t a1)
{
  unint64_t v2 = sub_100005F40();

  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

uint64_t initializeBufferWithCopyOfBuffer for GenerateRichContentIntent(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for GenerateRichContentIntent(uint64_t a1)
{
  sub_10000F9C4(a1);
  sub_10000F9C4(a1 + 40);
  swift_release();
  swift_release();

  return swift_release();
}

uint64_t sub_10000F9C4(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t initializeWithCopy for GenerateRichContentIntent(uint64_t a1, uint64_t a2)
{
  long long v4 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v4;
  (**(void (***)(void))(v4 - 8))();
  long long v5 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 64) = v5;
  (**(void (***)(uint64_t, uint64_t))(v5 - 8))(a1 + 40, a2 + 40);
  uint64_t v6 = *(void *)(a2 + 88);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = v6;
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t *assignWithCopy for GenerateRichContentIntent(uint64_t *a1, uint64_t *a2)
{
  a1[10] = a2[10];
  swift_retain();
  swift_release();
  a1[11] = a2[11];
  swift_retain();
  swift_release();
  a1[12] = a2[12];
  swift_retain();
  swift_release();
  return a1;
}

uint64_t *sub_10000FB74(uint64_t *result, uint64_t *a2)
{
  if (result != a2)
  {
    uint64_t v3 = result;
    uint64_t v4 = result[3];
    uint64_t v5 = a2[3];
    if (v4 == v5)
    {
      uint64_t v10 = *(void *)(v4 - 8);
      if ((*(unsigned char *)(v10 + 82) & 2) != 0)
      {
        uint64_t v12 = *a2;
        swift_retain();
        unint64_t result = (uint64_t *)swift_release();
        *uint64_t v3 = v12;
      }
      else
      {
        uint64_t v11 = *(uint64_t (**)(void))(v10 + 24);
        return (uint64_t *)v11();
      }
    }
    else
    {
      result[3] = v5;
      result[4] = a2[4];
      uint64_t v6 = *(void *)(v4 - 8);
      uint64_t v7 = *(void *)(v5 - 8);
      uint64_t v8 = v7;
      int v9 = *(_DWORD *)(v7 + 80);
      if ((*(unsigned char *)(v6 + 82) & 2) != 0)
      {
        if ((v9 & 0x20000) != 0)
        {
          *unint64_t result = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(result, a2, v5);
        }
        return (uint64_t *)swift_release();
      }
      else
      {
        (*(void (**)(unsigned char *, uint64_t *, uint64_t))(v6 + 32))(v13, result, v4);
        if ((v9 & 0x20000) != 0)
        {
          *uint64_t v3 = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(v3, a2, v5);
        }
        return (uint64_t *)(*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v13, v4);
      }
    }
  }
  return result;
}

__n128 initializeWithTake for GenerateRichContentIntent(uint64_t a1, long long *a2)
{
  long long v2 = *a2;
  long long v3 = a2[2];
  *(_OWORD *)(a1 + 16) = a2[1];
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)a1 = v2;
  __n128 result = (__n128)a2[3];
  long long v5 = a2[4];
  long long v6 = a2[5];
  *(void *)(a1 + 96) = *((void *)a2 + 12);
  *(_OWORD *)(a1 + 64) = v5;
  *(_OWORD *)(a1 + 80) = v6;
  *(__n128 *)(a1 + 48) = result;
  return result;
}

uint64_t assignWithTake for GenerateRichContentIntent(uint64_t a1, uint64_t a2)
{
  sub_10000F9C4(a1);
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  sub_10000F9C4(a1 + 40);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  uint64_t v5 = *(void *)(a2 + 80);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = v5;
  swift_release();
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  swift_release();
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for GenerateRichContentIntent(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 104)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for GenerateRichContentIntent(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 104) = 1;
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
      *(void *)(result + 24) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 104) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for GenerateRichContentIntent()
{
  return &type metadata for GenerateRichContentIntent;
}

uint64_t sub_10000FF04()
{
  return sub_10001003C(&qword_10003C3F0, &qword_10003C3F8);
}

uint64_t sub_10000FF40(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_10000FF88()
{
  return sub_10001003C(&qword_10003C400, &qword_10003C408);
}

uint64_t sub_10000FFC4()
{
  return sub_10001003C(&qword_10003C410, &qword_10003C408);
}

uint64_t sub_100010000()
{
  return sub_10001003C(&qword_10003C418, &qword_10003C408);
}

uint64_t sub_10001003C(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10000FF40(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t *sub_100010080(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t sub_1000100E4(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

unint64_t sub_1000100FC()
{
  unint64_t result = qword_10003C458;
  if (!qword_10003C458)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_10003C458);
  }
  return result;
}

void *sub_100010150(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_100010194(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for GenerativeResponseEntity(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_1000101F8()
{
  unint64_t result = qword_10003C4C8;
  if (!qword_10003C4C8)
  {
    sub_10000FF40(&qword_10003C478);
    sub_1000108F8(&qword_10003C4D0, (void (*)(uint64_t))type metadata accessor for GenerativeResponseEntity);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003C4C8);
  }
  return result;
}

uint64_t sub_10001029C(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for GenerativeResponseEntity(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_1000102F8()
{
  unint64_t result = qword_10003C4D8;
  if (!qword_10003C4D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003C4D8);
  }
  return result;
}

uint64_t sub_10001034C(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_100010384()
{
  uint64_t v1 = sub_10002FFB0();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = (*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v7 = v6 + 104;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  uint64_t v8 = v0 + v6;
  sub_10000F9C4(v8);
  sub_10000F9C4(v8 + 40);
  swift_release();
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, v7, v5);
}

uint64_t sub_10001044C(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v8 = *(void *)(sub_10002FFB0() - 8);
  unint64_t v9 = (*(unsigned __int8 *)(v8 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  uint64_t v10 = v3 + v9;
  uint64_t v11 = v3 + ((*(void *)(v8 + 64) + v9 + 7) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v12 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v12;
  *uint64_t v12 = v4;
  v12[1] = sub_10000F7C0;
  return sub_10000E394(a1, a2, a3, v10, v11);
}

uint64_t sub_100010574()
{
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_100010B04;
  return sub_10000E770(v0 + 16);
}

uint64_t sub_10001060C(uint64_t a1, uint64_t a2)
{
  unint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v6;
  *unint64_t v6 = v3;
  v6[1] = sub_1000106B8;
  return sub_10000EB18(a1, a2, v2 + 16);
}

uint64_t sub_1000106B8(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = *v2;
  swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t))(v7 + 8);
  return v5(a1, a2);
}

void sub_1000107C8(float a1)
{
}

uint64_t sub_1000107F0()
{
  sub_10000F9C4(v0 + 16);
  sub_10000F9C4(v0 + 56);
  swift_release();
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 120, 7);
}

void sub_100010848()
{
  sub_100030300();
  sub_10000EF78(v0);
}

uint64_t sub_100010870@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_10000F0F4(a1, *(void *)(v2 + 16), a2);
}

uint64_t sub_100010890(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000058C0(&qword_10003C468);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000108F8(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100010940(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000058C0(&qword_10003C468);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000109A8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_100010A0C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_1000058C0(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_100010A68(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t *sub_100010AA0(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_100010B08(uint64_t a1)
{
  v2[8] = a1;
  v2[9] = v1;
  uint64_t v3 = sub_100030630();
  v2[10] = v3;
  v2[11] = *(void *)(v3 - 8);
  v2[12] = swift_task_alloc();
  v2[13] = *(void *)(type metadata accessor for ResponseImageEntity(0) - 8);
  v2[14] = swift_task_alloc();
  sub_10002FF70();
  v2[15] = swift_task_alloc();
  uint64_t v4 = type metadata accessor for ResponseTextEntity(0);
  v2[16] = v4;
  v2[17] = *(void *)(v4 - 8);
  v2[18] = swift_task_alloc();
  uint64_t v5 = sub_1000300C0();
  v2[19] = v5;
  v2[20] = *(void *)(v5 - 8);
  v2[21] = swift_task_alloc();
  v2[22] = swift_task_alloc();
  v2[23] = swift_task_alloc();
  v2[24] = swift_task_alloc();
  uint64_t v6 = sub_1000058C0(&qword_10003C888);
  v2[25] = v6;
  v2[26] = *(void *)(v6 - 8);
  v2[27] = swift_task_alloc();
  sub_1000058C0(&qword_10003C890);
  v2[28] = swift_task_alloc();
  v2[29] = swift_task_alloc();
  return ((uint64_t (*)(uint64_t (*)(), void, void))_swift_task_switch)(sub_100010DCC, 0, 0);
}

uint64_t sub_100010DCC()
{
  uint64_t v80 = v0;
  uint64_t v1 = *(void *)(v0 + 208);
  uint64_t v74 = *(void *)(v0 + 200);
  uint64_t v60 = *(void *)(v0 + 184);
  uint64_t v2 = *(void *)(v0 + 160);
  uint64_t v57 = *(void *)(v0 + 128);
  uint64_t v58 = *(void *)(v0 + 136);
  uint64_t v56 = *(void *)(v0 + 104);
  unint64_t v3 = *(void *)(*(void *)(v0 + 64) + 16);
  uint64_t v4 = (void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16);
  uint64_t v73 = (void (**)(uint64_t, char *, uint64_t))(v2 + 32);
  uint64_t v70 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v1 + 48);
  uint64_t v71 = (void (**)(void, void, void, void))(v1 + 56);
  uint64_t v69 = (uint64_t (**)(uint64_t, uint64_t))(v2 + 88);
  int v68 = enum case for RichContentResultSegment.string(_:);
  uint64_t v5 = (uint64_t (**)(uint64_t, uint64_t))(v2 + 8);
  uint64_t v66 = (void (**)(uint64_t, uint64_t))(*(void *)(v0 + 88) + 8);
  uint64_t v63 = v2;
  uint64_t v59 = (void (**)(uint64_t *, void))(v2 + 96);
  int v67 = enum case for RichContentResultSegment.imageData(_:);
  uint64_t result = swift_bridgeObjectRetain();
  unint64_t v7 = 0;
  uint64_t v62 = &_swiftEmptyArrayStorage;
  uint64_t v61 = &_swiftEmptyArrayStorage;
  unint64_t v72 = v3;
  uint64_t v78 = v4;
  BOOL v8 = v3 == 0;
  if (v3) {
    goto LABEL_6;
  }
LABEL_5:
  (*v71)(*(void *)(v0 + 224), 1, 1, *(void *)(v0 + 200));
  unint64_t v13 = v3;
  while (1)
  {
    uint64_t v19 = *(void *)(v0 + 232);
    uint64_t v20 = *(void *)(v0 + 200);
    sub_100014A48(*(void *)(v0 + 224), v19);
    if ((*v70)(v19, 1, v20) == 1) {
      break;
    }
    unint64_t v77 = v13;
    uint64_t v21 = *(uint64_t **)(v0 + 232);
    uint64_t v22 = *(void *)(v0 + 184);
    uint64_t v23 = *(void *)(v0 + 192);
    uint64_t v24 = *(void *)(v0 + 152);
    uint64_t v25 = *v21;
    (*v73)(v23, (char *)v21 + *(int *)(v74 + 48), v24);
    uint64_t v26 = *v78;
    (*v78)(v22, v23, v24);
    int v27 = (*v69)(v22, v24);
    if (v27 == v68)
    {
      uint64_t v40 = *(uint64_t **)(v0 + 184);
      uint64_t v41 = *(void *)(v0 + 144);
      (*v59)(v40, *(void *)(v0 + 152));
      uint64_t v76 = *v40;
      uint64_t v42 = *(void *)(v60 + 8);
      sub_10002FE40();
      uint64_t v43 = *(int *)(v57 + 20);
      sub_1000058C0(&qword_10003C2D0);
      sub_10002FF50();
      *(void *)(v41 + v43) = sub_10002FC00();
      uint64_t v44 = *(int *)(v57 + 24);
      sub_1000058C0(&qword_10003C2E0);
      sub_10002FF50();
      *(void *)(v41 + v44) = sub_10002FBF0();
      *(void *)(v0 + 32) = v25;
      *(unsigned char *)(v0 + 40) = 0;
      sub_10002FBB0();
      *(void *)(v0 + 16) = v76;
      *(void *)(v0 + 24) = v42;
      sub_10002FBB0();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v62 = (void *)sub_10002C6A4(0, v62[2] + 1, 1, (unint64_t)v62);
      }
      unint64_t v7 = v77;
      unint64_t v46 = v62[2];
      unint64_t v45 = v62[3];
      unint64_t v3 = v72;
      if (v46 >= v45 >> 1) {
        uint64_t v62 = (void *)sub_10002C6A4(v45 > 1, v46 + 1, 1, (unint64_t)v62);
      }
      uint64_t v47 = *(void *)(v0 + 144);
      v62[2] = v46 + 1;
      sub_100014B60(v47, (uint64_t)v62+ ((*(unsigned __int8 *)(v58 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v58 + 80))+ *(void *)(v58 + 72) * v46, type metadata accessor for ResponseTextEntity);
LABEL_23:
      uint64_t result = (*v5)(*(void *)(v0 + 192), *(void *)(v0 + 152));
      BOOL v8 = v7 >= v3;
      if (v7 == v3) {
        goto LABEL_5;
      }
      goto LABEL_6;
    }
    if (v27 == v67)
    {
      uint64_t v48 = *(uint64_t **)(v0 + 184);
      uint64_t v49 = *(void *)(v0 + 112);
      (*v59)(v48, *(void *)(v0 + 152));
      uint64_t v50 = *v48;
      unint64_t v51 = *(void *)(v60 + 8);
      sub_100014AB0(v50, v51);
      sub_100011A68(v25, v50, v51, v49);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v61 = (void *)sub_10002C670(0, v61[2] + 1, 1, (unint64_t)v61);
      }
      unint64_t v7 = v77;
      unint64_t v53 = v61[2];
      unint64_t v52 = v61[3];
      if (v53 >= v52 >> 1) {
        uint64_t v61 = (void *)sub_10002C670(v52 > 1, v53 + 1, 1, (unint64_t)v61);
      }
      uint64_t v54 = *(void *)(v0 + 112);
      v61[2] = v53 + 1;
      sub_100014B60(v54, (uint64_t)v61+ ((*(unsigned __int8 *)(v56 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v56 + 80))+ *(void *)(v56 + 72) * v53, type metadata accessor for ResponseImageEntity);
      sub_100014B08(v50, v51);
      goto LABEL_23;
    }
    uint64_t v28 = *(void *)(v0 + 192);
    uint64_t v29 = *(void *)(v0 + 176);
    uint64_t v30 = *(void *)(v0 + 152);
    sub_1000305F0();
    v26(v29, v28, v30);
    uint64_t v31 = sub_100030620();
    os_log_type_t v32 = sub_100030800();
    BOOL v33 = os_log_type_enabled(v31, v32);
    uint64_t v34 = *(void *)(v0 + 176);
    uint64_t v35 = v5;
    uint64_t v75 = *(void *)(v0 + 192);
    if (v33)
    {
      uint64_t v36 = *(void *)(v0 + 168);
      uint64_t v9 = *(void *)(v0 + 152);
      uint64_t v64 = *(void *)(v0 + 80);
      uint64_t v65 = *(void *)(v0 + 96);
      uint64_t v37 = swift_slowAlloc();
      uint64_t v79 = swift_slowAlloc();
      *(_DWORD *)uint64_t v37 = 136315138;
      v26(v36, v34, v9);
      uint64_t v38 = sub_100030710();
      *(void *)(v37 + 4) = sub_10002EB08(v38, v39, &v79);
      swift_bridgeObjectRelease();
      uint64_t v12 = *v35;
      (*v35)(v34, v9);
      _os_log_impl((void *)&_mh_execute_header, v31, v32, "Unknown RichContentResultSegment type: %s", (uint8_t *)v37, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*v66)(v65, v64);
    }
    else
    {
      uint64_t v9 = *(void *)(v0 + 152);
      uint64_t v10 = *(void *)(v0 + 96);
      uint64_t v11 = *(void *)(v0 + 80);

      uint64_t v12 = *v5;
      (*v5)(v34, v9);
      (*v66)(v10, v11);
    }
    v12(v75, v9);
    uint64_t v5 = v35;
    uint64_t result = v12(*(void *)(v0 + 184), *(void *)(v0 + 152));
    unint64_t v3 = v72;
    unint64_t v7 = v77;
    BOOL v8 = v77 >= v72;
    if (v77 == v72) {
      goto LABEL_5;
    }
LABEL_6:
    if (v8)
    {
      __break(1u);
      return result;
    }
    uint64_t v14 = *(char **)(v0 + 224);
    uint64_t v15 = *(void *)(v0 + 200);
    uint64_t v16 = *(void *)(v0 + 152);
    uint64_t v17 = *(void *)(v0 + 216) + *(int *)(v74 + 48);
    (*(void (**)(uint64_t, unint64_t, uint64_t))(v63 + 16))(v17, *(void *)(v0 + 64)+ ((*(unsigned __int8 *)(v63 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v63 + 80))+ *(void *)(v63 + 72) * v7, v16);
    uint64_t v18 = *(int *)(v74 + 48);
    *(void *)uint64_t v14 = v7;
    (*(void (**)(char *, uint64_t, uint64_t))(v63 + 32))(&v14[v18], v17, v16);
    (*v71)(v14, 0, 1, v15);
    unint64_t v13 = v7 + 1;
    unint64_t v3 = v72;
  }
  swift_bridgeObjectRelease();
  type metadata accessor for GenerativeResponseEntity(0);
  *(void *)(v0 + 48) = v62;
  sub_10002FBB0();
  *(void *)(v0 + 56) = v61;
  sub_10002FBB0();
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
  uint64_t v55 = *(uint64_t (**)(void))(v0 + 8);
  return v55();
}

uint64_t sub_10001164C(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return ((uint64_t (*)(uint64_t (*)(), void, void))_swift_task_switch)(sub_10001166C, 0, 0);
}

uint64_t sub_10001166C()
{
  **(void **)(v0 + 16) = &_swiftEmptyArrayStorage;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100011698()
{
  return sub_100014BC8(*(uint64_t (**)(uint64_t))(v0 + 8), v0, (uint64_t)&_swiftEmptyArrayStorage);
}

uint64_t sub_1000116D8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *unint64_t v7 = v3;
  v7[1] = sub_10000F7C0;
  return EntityQuery.suggestedEntities()(a1, a2, a3);
}

uint64_t sub_10001178C(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_100012F34();
  *uint64_t v5 = v2;
  v5[1] = sub_100010B04;
  return EntityQuery.results()(a1, a2, v6);
}

uint64_t sub_100011840(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *unint64_t v7 = v3;
  v7[1] = sub_10000F7C0;
  return DynamicOptionsProvider.defaultResult()(a1, a2, a3);
}

uint64_t sub_1000118FC()
{
  uint64_t v0 = sub_1000058C0(&qword_10003C438);
  __chkstk_darwin(v0 - 8);
  uint64_t v2 = (char *)&v7 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_10002FF70();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v5 = sub_10002FF10();
  sub_100010AA0(v5, qword_10003CC60);
  sub_100010A68(v5, (uint64_t)qword_10003CC60);
  sub_10002FF50();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v4 + 56))(v2, 1, 1, v3);
  return sub_10002FF00();
}

uint64_t sub_100011A68@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v26 = a2;
  unint64_t v27 = a3;
  uint64_t v24 = a1;
  sub_1000058C0(&qword_10003C898);
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v28 = (char *)&v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = sub_10002FFE0();
  uint64_t v6 = *(void *)(v25 - 8);
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v8 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000058C0(&qword_10003C538);
  uint64_t v9 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  unint64_t v13 = (char *)&v23 - v12;
  uint64_t v14 = sub_10002FF70();
  __chkstk_darwin(v14 - 8);
  sub_10002FE40();
  uint64_t v15 = type metadata accessor for ResponseImageEntity(0);
  uint64_t v16 = *(int *)(v15 + 20);
  sub_1000058C0(&qword_10003C2D0);
  sub_10002FF50();
  *(void *)(a4 + v16) = sub_10002FC00();
  uint64_t v17 = *(int *)(v15 + 24);
  sub_1000058C0(&qword_10003C2D8);
  sub_10002FF50();
  *(void *)(a4 + v17) = sub_10002FBE0();
  uint64_t v29 = v24;
  char v30 = 0;
  sub_10002FBB0();
  uint64_t v19 = v26;
  unint64_t v18 = v27;
  sub_100014AB0(v26, v27);
  sub_10002FFD0();
  sub_10002FFC0();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v25);
  uint64_t v20 = sub_1000300D0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v28, 1, 1, v20);
  sub_10002FB10();
  uint64_t v21 = sub_10002FB20();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56))(v13, 0, 1, v21);
  sub_1000120D4((uint64_t)v13, (uint64_t)v11);
  sub_10002FBB0();
  sub_10001213C((uint64_t)v13);
  return sub_100014B08(v19, v18);
}

uint64_t sub_100011DEC@<X0>(uint64_t a1@<X8>)
{
  return sub_100013D38((uint64_t (*)(void))&type metadata accessor for UUID, a1);
}

uint64_t sub_100011E04@<X0>(uint64_t a1@<X8>)
{
  if (qword_10003C2A0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_10002FF10();
  uint64_t v3 = sub_100010A68(v2, (uint64_t)qword_10003CC60);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

uint64_t sub_100011EAC(uint64_t a1)
{
  uint64_t v2 = sub_100013178(qword_10003C560, (void (*)(uint64_t))type metadata accessor for GenerativeResponseEntity);

  return static AppEntity.defaultResolverSpecification.getter(a1, v2);
}

uint64_t sub_100011F28()
{
  return sub_10002FE40();
}

uint64_t sub_100011F44(uint64_t a1)
{
  uint64_t v2 = sub_100013178(&qword_10003C5C8, (void (*)(uint64_t))type metadata accessor for GenerativeResponseEntity);

  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

uint64_t ResponseImageEntity.init()@<X0>(uint64_t a1@<X8>)
{
  return sub_100012698(type metadata accessor for ResponseImageEntity, &qword_10003C2D8, (uint64_t (*)(char *))&EntityProperty<>.init(title:), a1);
}

uint64_t type metadata accessor for ResponseImageEntity(uint64_t a1)
{
  return sub_1000130A0(a1, qword_10003C708);
}

uint64_t ResponseImageEntity.index.setter(uint64_t a1, uint64_t a2)
{
  return sub_1000127FC(a1, a2, (void (*)(void))type metadata accessor for ResponseImageEntity);
}

uint64_t ResponseImageEntity.data.setter(uint64_t a1)
{
  uint64_t v2 = sub_1000058C0(&qword_10003C538);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for ResponseImageEntity(0);
  sub_1000120D4(a1, (uint64_t)v4);
  sub_10002FBB0();
  return sub_10001213C(a1);
}

uint64_t sub_1000120D4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000058C0(&qword_10003C538);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10001213C(uint64_t a1)
{
  uint64_t v2 = sub_1000058C0(&qword_10003C538);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10001219C(uint64_t a1)
{
  return sub_1000128B4(a1, static ResponseImageEntity.typeDisplayRepresentation);
}

uint64_t ResponseImageEntity.typeDisplayRepresentation.unsafeMutableAddressor()
{
  return sub_100012938(&qword_10003C2A8, (uint64_t)static ResponseImageEntity.typeDisplayRepresentation);
}

uint64_t static ResponseImageEntity.typeDisplayRepresentation.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1000129B0(&qword_10003C2A8, (uint64_t)static ResponseImageEntity.typeDisplayRepresentation, a1);
}

uint64_t static ResponseImageEntity.typeDisplayRepresentation.setter(uint64_t a1)
{
  return sub_100012A7C(a1, &qword_10003C2A8, (uint64_t)static ResponseImageEntity.typeDisplayRepresentation);
}

uint64_t (*static ResponseImageEntity.typeDisplayRepresentation.modify())()
{
  if (qword_10003C2A8 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_10002FF10();
  sub_100010A68(v0, (uint64_t)static ResponseImageEntity.typeDisplayRepresentation);
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t (*ResponseImageEntity.displayRepresentation.modify())()
{
  return nullsub_1;
}

uint64_t ResponseImageEntity.index.getter()
{
  return sub_100012CE0((void (*)(void))type metadata accessor for ResponseImageEntity);
}

uint64_t (*ResponseImageEntity.index.modify(void *a1))()
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  type metadata accessor for ResponseImageEntity(0);
  v2[4] = sub_10002FB90();
  return sub_100012354;
}

uint64_t ResponseImageEntity.$index.getter()
{
  return sub_100012DB0((void (*)(void))type metadata accessor for ResponseImageEntity);
}

uint64_t ResponseImageEntity.data.getter()
{
  return sub_10002FBA0();
}

uint64_t (*ResponseImageEntity.data.modify(void *a1))()
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  type metadata accessor for ResponseImageEntity(0);
  v2[4] = sub_10002FB90();
  return sub_100012354;
}

uint64_t ResponseImageEntity.$data.getter()
{
  return sub_100012EF8((void (*)(void))type metadata accessor for ResponseImageEntity);
}

uint64_t sub_100012430(uint64_t a1)
{
  uint64_t v2 = sub_100013178(&qword_10003C8A8, (void (*)(uint64_t))type metadata accessor for ResponseImageEntity);

  return static TransientAppEntity.defaultQuery.getter(a1, v2);
}

uint64_t sub_1000124AC(uint64_t a1)
{
  uint64_t v2 = sub_100013178(&qword_10003C8A8, (void (*)(uint64_t))type metadata accessor for ResponseImageEntity);

  return TransientAppEntity.id.getter(a1, v2);
}

uint64_t sub_100012528@<X0>(uint64_t a1@<X8>)
{
  return sub_100013B8C(&qword_10003C2A8, (uint64_t)static ResponseImageEntity.typeDisplayRepresentation, a1);
}

uint64_t sub_10001254C(uint64_t a1)
{
  uint64_t v2 = sub_100013178(&qword_10003C4B0, (void (*)(uint64_t))type metadata accessor for ResponseImageEntity);

  return static AppEntity.defaultResolverSpecification.getter(a1, v2);
}

uint64_t sub_1000125C8@<X0>(uint64_t a1@<X8>)
{
  return sub_100013D38((uint64_t (*)(void))&type metadata accessor for DisplayRepresentation, a1);
}

uint64_t sub_1000125E0(uint64_t a1)
{
  uint64_t v2 = sub_100013178(&qword_10003C630, (void (*)(uint64_t))type metadata accessor for ResponseImageEntity);

  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

uint64_t ResponseTextEntity.init()@<X0>(uint64_t a1@<X8>)
{
  return sub_100012698(type metadata accessor for ResponseTextEntity, &qword_10003C2E0, (uint64_t (*)(char *))&EntityProperty<>.init(title:), a1);
}

uint64_t sub_100012698@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t *a2@<X1>, uint64_t (*a3)(char *)@<X3>, uint64_t a4@<X8>)
{
  uint64_t v8 = sub_10002FF70();
  __chkstk_darwin(v8 - 8);
  uint64_t v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10002FE40();
  uint64_t v11 = a1(0);
  uint64_t v12 = *(int *)(v11 + 20);
  sub_1000058C0(&qword_10003C2D0);
  sub_10002FF50();
  *(void *)(a4 + v12) = sub_10002FC00();
  uint64_t v13 = *(int *)(v11 + 24);
  sub_1000058C0(a2);
  sub_10002FF50();
  uint64_t result = a3(v10);
  *(void *)(a4 + v13) = result;
  return result;
}

uint64_t type metadata accessor for ResponseTextEntity(uint64_t a1)
{
  return sub_1000130A0(a1, qword_10003C7A0);
}

uint64_t ResponseTextEntity.index.setter(uint64_t a1, uint64_t a2)
{
  return sub_1000127FC(a1, a2, (void (*)(void))type metadata accessor for ResponseTextEntity);
}

uint64_t sub_1000127FC(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  return sub_10002FBB0();
}

uint64_t ResponseTextEntity.text.setter()
{
  return sub_10002FBB0();
}

uint64_t sub_1000128A8(uint64_t a1)
{
  return sub_1000128B4(a1, static ResponseTextEntity.typeDisplayRepresentation);
}

uint64_t sub_1000128B4(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_10002FF10();
  sub_100010AA0(v3, a2);
  sub_100010A68(v3, (uint64_t)a2);
  return sub_10002FEF0();
}

uint64_t ResponseTextEntity.typeDisplayRepresentation.unsafeMutableAddressor()
{
  return sub_100012938(&qword_10003C2B0, (uint64_t)static ResponseTextEntity.typeDisplayRepresentation);
}

uint64_t sub_100012938(void *a1, uint64_t a2)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_10002FF10();

  return sub_100010A68(v3, a2);
}

uint64_t static ResponseTextEntity.typeDisplayRepresentation.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1000129B0(&qword_10003C2B0, (uint64_t)static ResponseTextEntity.typeDisplayRepresentation, a1);
}

uint64_t sub_1000129B0@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_10002FF10();
  uint64_t v6 = sub_100010A68(v5, a2);
  swift_beginAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a3, v6, v5);
}

uint64_t static ResponseTextEntity.typeDisplayRepresentation.setter(uint64_t a1)
{
  return sub_100012A7C(a1, &qword_10003C2B0, (uint64_t)static ResponseTextEntity.typeDisplayRepresentation);
}

uint64_t sub_100012A7C(uint64_t a1, void *a2, uint64_t a3)
{
  if (*a2 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_10002FF10();
  uint64_t v6 = sub_100010A68(v5, a3);
  swift_beginAccess();
  uint64_t v7 = *(void *)(v5 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 24))(v6, a1, v5);
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 8))(a1, v5);
}

uint64_t (*static ResponseTextEntity.typeDisplayRepresentation.modify())()
{
  if (qword_10003C2B0 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_10002FF10();
  sub_100010A68(v0, (uint64_t)static ResponseTextEntity.typeDisplayRepresentation);
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t _s28GenerativeAssistantExtension19ResponseImageEntityV21displayRepresentation10AppIntents07DisplayH0Vvg_0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_10002FE50();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);

  return v4(a1, v1, v3);
}

uint64_t _s28GenerativeAssistantExtension19ResponseImageEntityV21displayRepresentation10AppIntents07DisplayH0Vvs_0(uint64_t a1)
{
  uint64_t v3 = sub_10002FE50();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 40);

  return v4(v1, a1, v3);
}

uint64_t ResponseTextEntity.index.getter()
{
  return sub_100012CE0((void (*)(void))type metadata accessor for ResponseTextEntity);
}

uint64_t sub_100012CE0(void (*a1)(void))
{
  a1(0);
  sub_10002FBA0();
  return v2;
}

uint64_t (*ResponseTextEntity.index.modify(void *a1))()
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  type metadata accessor for ResponseTextEntity(0);
  v2[4] = sub_10002FB90();
  return sub_100012354;
}

uint64_t ResponseTextEntity.$index.getter()
{
  return sub_100012DB0((void (*)(void))type metadata accessor for ResponseTextEntity);
}

uint64_t sub_100012DB0(void (*a1)(void))
{
  return sub_10002FBC0();
}

uint64_t ResponseTextEntity.text.getter()
{
  type metadata accessor for ResponseTextEntity(0);
  sub_10002FBA0();
  return v1;
}

uint64_t (*ResponseTextEntity.text.modify(void *a1))()
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  type metadata accessor for ResponseTextEntity(0);
  v2[4] = sub_10002FB90();
  return sub_100012354;
}

void sub_100012E94(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void, void))(*a1 + 32))(*a1, 0);

  free(v1);
}

uint64_t ResponseTextEntity.$text.getter()
{
  return sub_100012EF8((void (*)(void))type metadata accessor for ResponseTextEntity);
}

uint64_t sub_100012EF8(void (*a1)(void))
{
  return sub_10002FBC0();
}

unint64_t sub_100012F34()
{
  unint64_t result = qword_10003C540;
  if (!qword_10003C540)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003C540);
  }
  return result;
}

unint64_t sub_100012F8C()
{
  unint64_t result = qword_10003C550;
  if (!qword_10003C550)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003C550);
  }
  return result;
}

unint64_t sub_100012FE4()
{
  unint64_t result = qword_10003C558;
  if (!qword_10003C558)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003C558);
  }
  return result;
}

uint64_t sub_100013038()
{
  return sub_100013178(qword_10003C560, (void (*)(uint64_t))type metadata accessor for GenerativeResponseEntity);
}

uint64_t type metadata accessor for GenerativeResponseEntity(uint64_t a1)
{
  return sub_1000130A0(a1, qword_10003C838);
}

uint64_t sub_1000130A0(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

unint64_t sub_1000130DC()
{
  unint64_t result = qword_10003C578;
  if (!qword_10003C578)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003C578);
  }
  return result;
}

uint64_t sub_100013130()
{
  return sub_100013178(&qword_10003C4D0, (void (*)(uint64_t))type metadata accessor for GenerativeResponseEntity);
}

uint64_t sub_100013178(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_1000131C4()
{
  unint64_t result = qword_10003C580;
  if (!qword_10003C580)
  {
    sub_10000FF40(qword_10003C588);
    sub_100013178(&qword_10003C4D0, (void (*)(uint64_t))type metadata accessor for GenerativeResponseEntity);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003C580);
  }
  return result;
}

uint64_t sub_100013268()
{
  return sub_100013178(&qword_10003C5A0, (void (*)(uint64_t))type metadata accessor for GenerativeResponseEntity);
}

uint64_t sub_1000132B0()
{
  return sub_100013178(&qword_10003C5A8, (void (*)(uint64_t))type metadata accessor for GenerativeResponseEntity);
}

uint64_t sub_1000132F8()
{
  return sub_100013178(&qword_10003C5B0, (void (*)(uint64_t))type metadata accessor for GenerativeResponseEntity);
}

void *sub_100013340()
{
  return &protocol witness table for UUID;
}

uint64_t sub_10001334C()
{
  return sub_100013178(&qword_10003C5B8, (void (*)(uint64_t))type metadata accessor for GenerativeResponseEntity);
}

uint64_t sub_100013394()
{
  return sub_100013178(&qword_10003C5C0, (void (*)(uint64_t))type metadata accessor for GenerativeResponseEntity);
}

uint64_t sub_1000133DC()
{
  return sub_100013178(&qword_10003C5C8, (void (*)(uint64_t))type metadata accessor for GenerativeResponseEntity);
}

uint64_t sub_100013424()
{
  return sub_100013178(&qword_10003C5D0, (void (*)(uint64_t))&type metadata accessor for UUID);
}

uint64_t sub_10001346C()
{
  return sub_10001003C(&qword_10003C5D8, &qword_10003C5E0);
}

uint64_t sub_1000134A8()
{
  return sub_100013178(&qword_10003C5E8, (void (*)(uint64_t))type metadata accessor for GenerativeResponseEntity);
}

uint64_t sub_1000134F0()
{
  return sub_100013178(&qword_10003C4B0, (void (*)(uint64_t))type metadata accessor for ResponseImageEntity);
}

uint64_t sub_100013538()
{
  return sub_100013178(&qword_10003C5F0, (void (*)(uint64_t))type metadata accessor for ResponseImageEntity);
}

uint64_t sub_100013580()
{
  return sub_100013178(&qword_10003C5F8, (void (*)(uint64_t))type metadata accessor for ResponseImageEntity);
}

uint64_t sub_1000135C8()
{
  return sub_100013178(&qword_10003C600, (void (*)(uint64_t))type metadata accessor for ResponseImageEntity);
}

uint64_t sub_100013610()
{
  return sub_10001003C(&qword_10003C608, &qword_10003C610);
}

uint64_t sub_10001364C()
{
  return sub_100013178(&qword_10003C618, (void (*)(uint64_t))type metadata accessor for ResponseImageEntity);
}

uint64_t sub_100013694()
{
  return sub_100013178(&qword_10003C620, (void (*)(uint64_t))type metadata accessor for ResponseImageEntity);
}

uint64_t sub_1000136DC()
{
  return sub_100013178(&qword_10003C628, (void (*)(uint64_t))type metadata accessor for ResponseImageEntity);
}

uint64_t sub_100013724()
{
  return sub_100013178(&qword_10003C630, (void (*)(uint64_t))type metadata accessor for ResponseImageEntity);
}

uint64_t sub_10001376C()
{
  return sub_10001003C(&qword_10003C638, &qword_10003C640);
}

uint64_t sub_1000137A8()
{
  return sub_100013178(&qword_10003C648, (void (*)(uint64_t))type metadata accessor for ResponseImageEntity);
}

uint64_t sub_1000137F0()
{
  return sub_100013178(&qword_10003C4C0, (void (*)(uint64_t))type metadata accessor for ResponseTextEntity);
}

uint64_t sub_10001383C()
{
  return sub_100013178(&qword_10003C650, (void (*)(uint64_t))type metadata accessor for ResponseTextEntity);
}

uint64_t sub_100013884()
{
  return sub_100013178(&qword_10003C658, (void (*)(uint64_t))type metadata accessor for ResponseTextEntity);
}

uint64_t sub_1000138CC()
{
  return sub_100013178(&qword_10003C660, (void (*)(uint64_t))type metadata accessor for ResponseTextEntity);
}

uint64_t sub_100013914()
{
  return sub_10001003C(&qword_10003C668, &qword_10003C670);
}

uint64_t sub_100013950(uint64_t a1)
{
  uint64_t v2 = sub_100013178(&qword_10003C8A0, (void (*)(uint64_t))type metadata accessor for ResponseTextEntity);

  return static TransientAppEntity.defaultQuery.getter(a1, v2);
}

uint64_t sub_1000139CC()
{
  return sub_100013178(&qword_10003C678, (void (*)(uint64_t))type metadata accessor for ResponseTextEntity);
}

uint64_t sub_100013A14()
{
  return sub_100013178(&qword_10003C680, (void (*)(uint64_t))type metadata accessor for ResponseTextEntity);
}

uint64_t sub_100013A5C()
{
  return sub_100013178(&qword_10003C688, (void (*)(uint64_t))type metadata accessor for ResponseTextEntity);
}

uint64_t sub_100013AA4()
{
  return sub_100013178(&qword_10003C690, (void (*)(uint64_t))type metadata accessor for ResponseTextEntity);
}

uint64_t sub_100013AEC(uint64_t a1)
{
  uint64_t v2 = sub_100013178(&qword_10003C8A0, (void (*)(uint64_t))type metadata accessor for ResponseTextEntity);

  return TransientAppEntity.id.getter(a1, v2);
}

uint64_t sub_100013B68@<X0>(uint64_t a1@<X8>)
{
  return sub_100013B8C(&qword_10003C2B0, (uint64_t)static ResponseTextEntity.typeDisplayRepresentation, a1);
}

uint64_t sub_100013B8C@<X0>(void *a1@<X2>, uint64_t a2@<X3>, uint64_t a3@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_10002FF10();
  uint64_t v6 = sub_100010A68(v5, a2);
  swift_beginAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a3, v6, v5);
}

uint64_t sub_100013C38()
{
  return sub_10001003C(&qword_10003C698, &qword_10003C6A0);
}

uint64_t sub_100013C74(uint64_t a1)
{
  uint64_t v2 = sub_100013178(&qword_10003C4C0, (void (*)(uint64_t))type metadata accessor for ResponseTextEntity);

  return static AppEntity.defaultResolverSpecification.getter(a1, v2);
}

uint64_t sub_100013CF0()
{
  return sub_100013178(&qword_10003C6A8, (void (*)(uint64_t))type metadata accessor for ResponseTextEntity);
}

uint64_t sub_100013D38@<X0>(uint64_t (*a1)(void)@<X2>, uint64_t a2@<X8>)
{
  uint64_t v4 = a1(0);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);

  return v5(a2, v2, v4);
}

uint64_t sub_100013DA4(uint64_t a1)
{
  uint64_t v2 = sub_100013178(&qword_10003C690, (void (*)(uint64_t))type metadata accessor for ResponseTextEntity);

  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

uint64_t getEnumTagSinglePayload for ResponseImageEntity(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100013E4C);
}

uint64_t sub_100013E4C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1000147F8(a1, a2, a3, (uint64_t (*)(void))&type metadata accessor for DisplayRepresentation);
}

uint64_t storeEnumTagSinglePayload for ResponseImageEntity(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100013E78);
}

uint64_t sub_100013E78(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  return sub_1000148E8(a1, a2, a3, a4, (uint64_t (*)(void))&type metadata accessor for DisplayRepresentation);
}

uint64_t *_s28GenerativeAssistantExtension19ResponseImageEntityVwCP_0(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v9 = *a2;
    *a1 = *a2;
    uint64_t v4 = (uint64_t *)(v9 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    uint64_t v7 = sub_10002FE50();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(v4, a2, v7);
    uint64_t v8 = *(int *)(a3 + 24);
    *(uint64_t *)((char *)v4 + *(int *)(a3 + 20)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 20));
    *(uint64_t *)((char *)v4 + v8) = *(uint64_t *)((char *)a2 + v8);
    swift_retain();
  }
  swift_retain();
  return v4;
}

uint64_t _s28GenerativeAssistantExtension19ResponseImageEntityVwxx_0(uint64_t a1)
{
  uint64_t v2 = sub_10002FE50();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  swift_release();

  return swift_release();
}

uint64_t _s28GenerativeAssistantExtension19ResponseImageEntityVwcp_0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_10002FE50();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 24);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  *(void *)(a1 + v7) = *(void *)(a2 + v7);
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t _s28GenerativeAssistantExtension19ResponseImageEntityVwca_0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_10002FE50();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  swift_retain();
  swift_release();
  *(void *)(a1 + *(int *)(a3 + 24)) = *(void *)(a2 + *(int *)(a3 + 24));
  swift_retain();
  swift_release();
  return a1;
}

uint64_t _s28GenerativeAssistantExtension19ResponseImageEntityVwtk_0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_10002FE50();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 24);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  *(void *)(a1 + v7) = *(void *)(a2 + v7);
  return a1;
}

uint64_t _s28GenerativeAssistantExtension19ResponseImageEntityVwta_0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_10002FE50();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  swift_release();
  *(void *)(a1 + *(int *)(a3 + 24)) = *(void *)(a2 + *(int *)(a3 + 24));
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for ResponseTextEntity(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100014258);
}

uint64_t sub_100014258(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1000147F8(a1, a2, a3, (uint64_t (*)(void))&type metadata accessor for DisplayRepresentation);
}

uint64_t storeEnumTagSinglePayload for ResponseTextEntity(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100014284);
}

uint64_t sub_100014284(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  return sub_1000148E8(a1, a2, a3, a4, (uint64_t (*)(void))&type metadata accessor for DisplayRepresentation);
}

uint64_t sub_10001429C()
{
  uint64_t result = sub_10002FE50();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for GenerativeResponseEntity.Query()
{
  return &type metadata for GenerativeResponseEntity.Query;
}

uint64_t *sub_100014348(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v10 = *a2;
    *a1 = *a2;
    uint64_t v4 = (uint64_t *)(v10 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    uint64_t v7 = sub_10002FFE0();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(v4, a2, v7);
    uint64_t v8 = a3[6];
    *(uint64_t *)((char *)v4 + a3[5]) = *(uint64_t *)((char *)a2 + a3[5]);
    *(uint64_t *)((char *)v4 + v8) = *(uint64_t *)((char *)a2 + v8);
    uint64_t v9 = a3[8];
    *(uint64_t *)((char *)v4 + a3[7]) = *(uint64_t *)((char *)a2 + a3[7]);
    *(uint64_t *)((char *)v4 + v9) = *(uint64_t *)((char *)a2 + v9);
    swift_retain();
    swift_retain();
    swift_retain();
  }
  swift_retain();
  return v4;
}

uint64_t sub_100014448(uint64_t a1)
{
  uint64_t v2 = sub_10002FFE0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  swift_release();
  swift_release();
  swift_release();

  return swift_release();
}

uint64_t sub_1000144E0(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_10002FFE0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  *(void *)(a1 + v7) = *(void *)(a2 + v7);
  uint64_t v8 = a3[8];
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  *(void *)(a1 + v8) = *(void *)(a2 + v8);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t sub_100014594(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_10002FFE0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  swift_retain();
  swift_release();
  *(void *)(a1 + a3[6]) = *(void *)(a2 + a3[6]);
  swift_retain();
  swift_release();
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  swift_retain();
  swift_release();
  *(void *)(a1 + a3[8]) = *(void *)(a2 + a3[8]);
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_100014674(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_10002FFE0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  *(void *)(a1 + v7) = *(void *)(a2 + v7);
  uint64_t v8 = a3[8];
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  *(void *)(a1 + v8) = *(void *)(a2 + v8);
  return a1;
}

uint64_t sub_10001470C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_10002FFE0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  swift_release();
  *(void *)(a1 + a3[6]) = *(void *)(a2 + a3[6]);
  swift_release();
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  swift_release();
  *(void *)(a1 + a3[8]) = *(void *)(a2 + a3[8]);
  swift_release();
  return a1;
}

uint64_t sub_1000147CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000147E0);
}

uint64_t sub_1000147E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1000147F8(a1, a2, a3, (uint64_t (*)(void))&type metadata accessor for UUID);
}

uint64_t sub_1000147F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  uint64_t v7 = a4(0);
  uint64_t v8 = *(void *)(v7 - 8);
  if (*(_DWORD *)(v8 + 84) == a2)
  {
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v8 + 48);
    return v9(a1, a2, v7);
  }
  else
  {
    unint64_t v11 = *(void *)(a1 + *(int *)(a3 + 20));
    if (v11 >= 0xFFFFFFFF) {
      LODWORD(v11) = -1;
    }
    return (v11 + 1);
  }
}

uint64_t sub_1000148BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000148D0);
}

uint64_t sub_1000148D0(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  return sub_1000148E8(a1, a2, a3, a4, (uint64_t (*)(void))&type metadata accessor for UUID);
}

uint64_t sub_1000148E8(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t (*a5)(void))
{
  uint64_t result = a5(0);
  uint64_t v10 = *(void *)(result - 8);
  if (*(_DWORD *)(v10 + 84) == a3)
  {
    unint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v10 + 56);
    return v11(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20)) = (a2 - 1);
  }
  return result;
}

uint64_t sub_1000149A8()
{
  uint64_t result = sub_10002FFE0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_100014A48(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000058C0(&qword_10003C890);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100014AB0(uint64_t a1, unint64_t a2)
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

uint64_t sub_100014B08(uint64_t a1, unint64_t a2)
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

uint64_t sub_100014B60(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_100014BC8(uint64_t (*a1)(uint64_t), uint64_t a2, uint64_t a3)
{
  return a1(a3);
}

uint64_t sub_100014BE0(uint64_t a1)
{
  uint64_t v32 = a1;
  uint64_t v31 = sub_1000058C0(&qword_10003C910);
  uint64_t v1 = *(void *)(v31 - 8);
  __chkstk_darwin(v31);
  uint64_t v3 = (char *)&v24 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_1000058C0(&qword_10003C918);
  uint64_t v5 = __chkstk_darwin(v4);
  char v30 = (char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __chkstk_darwin(v5);
  uint64_t v28 = (char *)&v24 - v8;
  uint64_t v9 = __chkstk_darwin(v7);
  uint64_t v25 = (char *)&v24 - v10;
  uint64_t v11 = __chkstk_darwin(v9);
  uint64_t v26 = (char *)&v24 - v12;
  uint64_t v13 = __chkstk_darwin(v11);
  __chkstk_darwin(v13);
  sub_100005F40();
  sub_10002FD20();
  v36._countAndFlagsBits = 0x78616A41206B7341;
  v36._object = (void *)0xEC000000206F7420;
  sub_10002FD10(v36);
  swift_getKeyPath();
  unint64_t v33 = sub_100017784();
  sub_10002FC70();
  swift_release();
  sub_10002FD00();
  swift_release();
  v37._countAndFlagsBits = 0;
  v37._object = (void *)0xE000000000000000;
  sub_10002FD10(v37);
  sub_10002FD30();
  uint64_t v29 = sub_10002FC90();
  uint64_t v34 = *(void (**)(char *, uint64_t))(v1 + 8);
  uint64_t v35 = v1 + 8;
  uint64_t v14 = v31;
  v34(v3, v31);
  sub_10002FD20();
  v38._countAndFlagsBits = 0x616A41206C6C6554;
  v38._object = (void *)0xED0000206F742078;
  sub_10002FD10(v38);
  swift_getKeyPath();
  sub_10002FC70();
  swift_release();
  sub_10002FD00();
  swift_release();
  v39._countAndFlagsBits = 0;
  v39._object = (void *)0xE000000000000000;
  sub_10002FD10(v39);
  sub_10002FD30();
  uint64_t v27 = sub_10002FC90();
  v34(v3, v14);
  sub_10002FD20();
  v40._countAndFlagsBits = 0x78616A41206B7341;
  v40._object = (void *)0xE900000000000020;
  sub_10002FD10(v40);
  swift_getKeyPath();
  sub_10002FC70();
  swift_release();
  sub_10002FD00();
  swift_release();
  v41._countAndFlagsBits = 0;
  v41._object = (void *)0xE000000000000000;
  sub_10002FD10(v41);
  sub_10002FD30();
  uint64_t v26 = (char *)sub_10002FC90();
  uint64_t v15 = v34;
  v34(v3, v14);
  sub_10002FD20();
  v42._countAndFlagsBits = 0x616A41206C6C6554;
  v42._object = (void *)0xEA00000000002078;
  sub_10002FD10(v42);
  swift_getKeyPath();
  sub_10002FC70();
  swift_release();
  sub_10002FD00();
  swift_release();
  v43._countAndFlagsBits = 0;
  v43._object = (void *)0xE000000000000000;
  sub_10002FD10(v43);
  sub_10002FD30();
  uint64_t v25 = (char *)sub_10002FC90();
  uint64_t v16 = v31;
  v15(v3, v31);
  sub_10002FD20();
  v44._countAndFlagsBits = 0x2078616A41;
  v44._object = (void *)0xE500000000000000;
  sub_10002FD10(v44);
  swift_getKeyPath();
  sub_10002FC70();
  swift_release();
  sub_10002FD00();
  swift_release();
  v45._countAndFlagsBits = 0;
  v45._object = (void *)0xE000000000000000;
  sub_10002FD10(v45);
  sub_10002FD30();
  uint64_t v28 = (char *)sub_10002FC90();
  uint64_t v17 = v34;
  v34(v3, v16);
  sub_10002FD20();
  v46._countAndFlagsBits = 0;
  v46._object = (void *)0xE000000000000000;
  sub_10002FD10(v46);
  swift_getKeyPath();
  sub_10002FC70();
  swift_release();
  sub_10002FD00();
  swift_release();
  v47._countAndFlagsBits = 0;
  v47._object = (void *)0xE000000000000000;
  sub_10002FD10(v47);
  sub_10002FD30();
  uint64_t v18 = sub_10002FC90();
  v17(v3, v31);
  sub_1000058C0(&qword_10003C920);
  uint64_t v19 = swift_allocObject();
  *(_OWORD *)(v19 + 16) = xmmword_1000317A0;
  uint64_t v20 = v27;
  *(void *)(v19 + 32) = v29;
  *(void *)(v19 + 40) = v20;
  uint64_t v21 = v25;
  *(void *)(v19 + 48) = v26;
  *(void *)(v19 + 56) = v21;
  *(void *)(v19 + 64) = v28;
  *(void *)(v19 + 72) = v18;
  uint64_t v22 = sub_10002FC80();
  swift_bridgeObjectRelease();
  return v22;
}

uint64_t sub_10001532C(uint64_t a1)
{
  return sub_1000171B8(a1, (uint64_t)&unk_1000318E0, (void (*)(uint64_t))sub_100005F40);
}

uint64_t sub_100015360()
{
  uint64_t v23 = sub_10002FCB0();
  uint64_t v22 = sub_10002FCB0();
  uint64_t v21 = sub_10002FCB0();
  uint64_t v20 = sub_10002FCB0();
  uint64_t v19 = sub_10002FCB0();
  uint64_t v18 = sub_10002FCB0();
  uint64_t v17 = sub_10002FCB0();
  uint64_t v16 = sub_10002FCB0();
  uint64_t v15 = sub_10002FCB0();
  uint64_t v14 = sub_10002FCB0();
  uint64_t v13 = sub_10002FCB0();
  uint64_t v12 = sub_10002FCB0();
  uint64_t v0 = sub_10002FCB0();
  uint64_t v1 = sub_10002FCB0();
  uint64_t v2 = sub_10002FCB0();
  uint64_t v3 = sub_10002FCB0();
  uint64_t v4 = sub_10002FCB0();
  uint64_t v5 = sub_10002FCB0();
  uint64_t v6 = sub_10002FCB0();
  uint64_t v7 = sub_10002FCB0();
  uint64_t v8 = sub_10002FCB0();
  sub_1000058C0(&qword_10003C8D8);
  uint64_t v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_1000317B0;
  *(void *)(v9 + 32) = v23;
  *(void *)(v9 + 40) = v22;
  *(void *)(v9 + 48) = v21;
  *(void *)(v9 + 56) = v20;
  *(void *)(v9 + 64) = v19;
  *(void *)(v9 + 72) = v18;
  *(void *)(v9 + 80) = v17;
  *(void *)(v9 + 88) = v16;
  *(void *)(v9 + 96) = v15;
  *(void *)(v9 + 104) = v14;
  *(void *)(v9 + 112) = v13;
  *(void *)(v9 + 120) = v12;
  *(void *)(v9 + 128) = v0;
  *(void *)(v9 + 136) = v1;
  *(void *)(v9 + 144) = v2;
  *(void *)(v9 + 152) = v3;
  *(void *)(v9 + 160) = v4;
  *(void *)(v9 + 168) = v5;
  *(void *)(v9 + 176) = v6;
  *(void *)(v9 + 184) = v7;
  *(void *)(v9 + 192) = v8;
  uint64_t v10 = sub_10002FCA0();
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_10001569C(uint64_t a1)
{
  uint64_t v35 = a1;
  uint64_t v33 = sub_1000058C0(&qword_10003C8F8);
  uint64_t v1 = *(void *)(v33 - 8);
  __chkstk_darwin(v33);
  uint64_t v3 = (char *)&v27 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_1000058C0(&qword_10003C900);
  uint64_t v5 = __chkstk_darwin(v4);
  uint64_t v31 = (char *)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __chkstk_darwin(v5);
  uint64_t v29 = (char *)&v27 - v8;
  uint64_t v9 = __chkstk_darwin(v7);
  uint64_t v34 = (char *)&v27 - v10;
  uint64_t v11 = __chkstk_darwin(v9);
  uint64_t v28 = (char *)&v27 - v12;
  uint64_t v13 = __chkstk_darwin(v11);
  __chkstk_darwin(v13);
  sub_1000176D4();
  sub_10002FD20();
  v39._countAndFlagsBits = 0x616A41206C6C6554;
  v39._object = (void *)0xED0000206F742078;
  sub_10002FD10(v39);
  swift_getKeyPath();
  unint64_t v38 = sub_100017784();
  sub_10002FC70();
  swift_release();
  sub_10002FD00();
  swift_release();
  v40._countAndFlagsBits = 0;
  v40._object = (void *)0xE000000000000000;
  sub_10002FD10(v40);
  sub_10002FD30();
  uint64_t v32 = sub_10002FC90();
  Swift::String v36 = *(void (**)(char *, uint64_t))(v1 + 8);
  uint64_t v37 = v1 + 8;
  uint64_t v14 = v33;
  v36(v3, v33);
  sub_10002FD20();
  v41._countAndFlagsBits = 0x78616A41206B7341;
  v41._object = (void *)0xEC000000206F7420;
  sub_10002FD10(v41);
  swift_getKeyPath();
  sub_10002FC70();
  swift_release();
  sub_10002FD00();
  swift_release();
  v42._countAndFlagsBits = 0;
  v42._object = (void *)0xE000000000000000;
  sub_10002FD10(v42);
  sub_10002FD30();
  uint64_t v30 = sub_10002FC90();
  v36(v3, v14);
  sub_10002FD20();
  v43._countAndFlagsBits = 0x78616A41206B7341;
  v43._object = (void *)0xED000020776F6820;
  sub_10002FD10(v43);
  swift_getKeyPath();
  sub_10002FC70();
  swift_release();
  sub_10002FD00();
  swift_release();
  v44._countAndFlagsBits = 0;
  v44._object = (void *)0xE000000000000000;
  sub_10002FD10(v44);
  sub_10002FD30();
  uint64_t v28 = (char *)sub_10002FC90();
  uint64_t v15 = v36;
  v36(v3, v14);
  sub_10002FD20();
  v45._object = (void *)0x8000000100033A00;
  v45._countAndFlagsBits = 0xD000000000000012;
  sub_10002FD10(v45);
  swift_getKeyPath();
  sub_10002FC70();
  swift_release();
  sub_10002FD00();
  swift_release();
  v46._countAndFlagsBits = 0;
  v46._object = (void *)0xE000000000000000;
  sub_10002FD10(v46);
  sub_10002FD30();
  uint64_t v27 = sub_10002FC90();
  uint64_t v16 = v33;
  v15(v3, v33);
  sub_10002FD20();
  v47._countAndFlagsBits = 0x78616A41206B7341;
  v47._object = (void *)0xE900000000000020;
  sub_10002FD10(v47);
  swift_getKeyPath();
  sub_10002FC70();
  swift_release();
  sub_10002FD00();
  swift_release();
  v48._countAndFlagsBits = 0;
  v48._object = (void *)0xE000000000000000;
  sub_10002FD10(v48);
  sub_10002FD30();
  uint64_t v29 = (char *)sub_10002FC90();
  uint64_t v17 = v16;
  uint64_t v18 = v16;
  uint64_t v19 = v36;
  v36(v3, v18);
  sub_10002FD20();
  v49._countAndFlagsBits = 0x2078616A41;
  v49._object = (void *)0xE500000000000000;
  sub_10002FD10(v49);
  swift_getKeyPath();
  sub_10002FC70();
  swift_release();
  sub_10002FD00();
  swift_release();
  v50._countAndFlagsBits = 0;
  v50._object = (void *)0xE000000000000000;
  sub_10002FD10(v50);
  sub_10002FD30();
  uint64_t v31 = (char *)sub_10002FC90();
  v19(v3, v17);
  sub_10002FD20();
  v51._countAndFlagsBits = 0;
  v51._object = (void *)0xE000000000000000;
  sub_10002FD10(v51);
  swift_getKeyPath();
  sub_10002FC70();
  swift_release();
  sub_10002FD00();
  swift_release();
  v52._countAndFlagsBits = 0;
  v52._object = (void *)0xE000000000000000;
  sub_10002FD10(v52);
  sub_10002FD30();
  uint64_t v20 = sub_10002FC90();
  v19(v3, v17);
  sub_1000058C0(&qword_10003C908);
  uint64_t v21 = swift_allocObject();
  *(_OWORD *)(v21 + 16) = xmmword_1000317C0;
  uint64_t v22 = v30;
  *(void *)(v21 + 32) = v32;
  *(void *)(v21 + 40) = v22;
  uint64_t v23 = v27;
  *(void *)(v21 + 48) = v28;
  *(void *)(v21 + 56) = v23;
  uint64_t v24 = v31;
  *(void *)(v21 + 64) = v29;
  *(void *)(v21 + 72) = v24;
  *(void *)(v21 + 80) = v20;
  uint64_t v25 = sub_10002FC80();
  swift_bridgeObjectRelease();
  return v25;
}

uint64_t sub_100015EDC(uint64_t a1)
{
  return sub_1000171B8(a1, (uint64_t)&unk_1000318B8, (void (*)(uint64_t))sub_1000176D4);
}

uint64_t sub_100015F10()
{
  uint64_t v106 = sub_10002FCB0();
  uint64_t v105 = sub_10002FCB0();
  uint64_t v104 = sub_10002FCB0();
  uint64_t v103 = sub_10002FCB0();
  uint64_t v102 = sub_10002FCB0();
  uint64_t v101 = sub_10002FCB0();
  uint64_t v100 = sub_10002FCB0();
  uint64_t v99 = sub_10002FCB0();
  uint64_t v98 = sub_10002FCB0();
  uint64_t v97 = sub_10002FCB0();
  uint64_t v96 = sub_10002FCB0();
  uint64_t v95 = sub_10002FCB0();
  uint64_t v94 = sub_10002FCB0();
  uint64_t v93 = sub_10002FCB0();
  uint64_t v92 = sub_10002FCB0();
  uint64_t v91 = sub_10002FCB0();
  uint64_t v90 = sub_10002FCB0();
  uint64_t v89 = sub_10002FCB0();
  uint64_t v88 = sub_10002FCB0();
  uint64_t v87 = sub_10002FCB0();
  uint64_t v86 = sub_10002FCB0();
  uint64_t v84 = sub_10002FCB0();
  uint64_t v83 = sub_10002FCB0();
  uint64_t v82 = sub_10002FCB0();
  uint64_t v81 = sub_10002FCB0();
  uint64_t v80 = sub_10002FCB0();
  uint64_t v79 = sub_10002FCB0();
  uint64_t v78 = sub_10002FCB0();
  uint64_t v77 = sub_10002FCB0();
  uint64_t v76 = sub_10002FCB0();
  uint64_t v75 = sub_10002FCB0();
  uint64_t v74 = sub_10002FCB0();
  uint64_t v73 = sub_10002FCB0();
  uint64_t v72 = sub_10002FCB0();
  uint64_t v71 = sub_10002FCB0();
  uint64_t v69 = sub_10002FCB0();
  uint64_t v68 = sub_10002FCB0();
  uint64_t v67 = sub_10002FCB0();
  uint64_t v66 = sub_10002FCB0();
  uint64_t v65 = sub_10002FCB0();
  uint64_t v63 = sub_10002FCB0();
  uint64_t v62 = sub_10002FCB0();
  uint64_t v61 = sub_10002FCB0();
  uint64_t v60 = sub_10002FCB0();
  uint64_t v58 = sub_10002FCB0();
  uint64_t v56 = sub_10002FCB0();
  uint64_t v55 = sub_10002FCB0();
  uint64_t v54 = sub_10002FCB0();
  uint64_t v53 = sub_10002FCB0();
  uint64_t v52 = sub_10002FCB0();
  uint64_t v51 = sub_10002FCB0();
  uint64_t v50 = sub_10002FCB0();
  uint64_t v49 = sub_10002FCB0();
  uint64_t v48 = sub_10002FCB0();
  uint64_t v47 = sub_10002FCB0();
  uint64_t v46 = sub_10002FCB0();
  uint64_t v45 = sub_10002FCB0();
  uint64_t v43 = sub_10002FCB0();
  uint64_t v42 = sub_10002FCB0();
  uint64_t v41 = sub_10002FCB0();
  uint64_t v40 = sub_10002FCB0();
  uint64_t v39 = sub_10002FCB0();
  uint64_t v38 = sub_10002FCB0();
  uint64_t v37 = sub_10002FCB0();
  uint64_t v36 = sub_10002FCB0();
  uint64_t v35 = sub_10002FCB0();
  uint64_t v34 = sub_10002FCB0();
  uint64_t v33 = sub_10002FCB0();
  uint64_t v32 = sub_10002FCB0();
  uint64_t v31 = sub_10002FCB0();
  uint64_t v30 = sub_10002FCB0();
  uint64_t v29 = sub_10002FCB0();
  uint64_t v27 = sub_10002FCB0();
  uint64_t v25 = sub_10002FCB0();
  uint64_t v23 = sub_10002FCB0();
  uint64_t v59 = sub_10002FCB0();
  uint64_t v44 = sub_10002FCB0();
  uint64_t v28 = sub_10002FCB0();
  uint64_t v26 = sub_10002FCB0();
  uint64_t v24 = sub_10002FCB0();
  uint64_t v22 = sub_10002FCB0();
  uint64_t v21 = sub_10002FCB0();
  uint64_t v20 = sub_10002FCB0();
  uint64_t v19 = sub_10002FCB0();
  uint64_t v70 = sub_10002FCB0();
  uint64_t v18 = sub_10002FCB0();
  uint64_t v17 = sub_10002FCB0();
  uint64_t v85 = sub_10002FCB0();
  uint64_t v16 = sub_10002FCB0();
  uint64_t v15 = sub_10002FCB0();
  uint64_t v14 = sub_10002FCB0();
  uint64_t v13 = sub_10002FCB0();
  uint64_t v57 = sub_10002FCB0();
  uint64_t v12 = sub_10002FCB0();
  uint64_t v64 = sub_10002FCB0();
  uint64_t v0 = sub_10002FCB0();
  uint64_t v1 = sub_10002FCB0();
  uint64_t v2 = sub_10002FCB0();
  uint64_t v3 = sub_10002FCB0();
  uint64_t v4 = sub_10002FCB0();
  uint64_t v5 = sub_10002FCB0();
  uint64_t v6 = sub_10002FCB0();
  uint64_t v7 = sub_10002FCB0();
  uint64_t v8 = sub_10002FCB0();
  sub_1000058C0(&qword_10003C8D8);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 32) = v106;
  *(void *)(v9 + 40) = v105;
  *(void *)(v9 + 48) = v104;
  *(void *)(v9 + 56) = v103;
  *(void *)(v9 + 64) = v102;
  *(void *)(v9 + 72) = v101;
  *(void *)(v9 + 80) = v100;
  *(void *)(v9 + 88) = v99;
  *(void *)(v9 + 96) = v98;
  *(void *)(v9 + 104) = v97;
  *(void *)(v9 + 112) = v96;
  *(void *)(v9 + 120) = v95;
  *(void *)(v9 + 128) = v94;
  *(void *)(v9 + 136) = v93;
  *(void *)(v9 + 144) = v92;
  *(void *)(v9 + 152) = v91;
  *(void *)(v9 + 160) = v90;
  *(void *)(v9 + 168) = v89;
  *(void *)(v9 + 176) = v88;
  *(void *)(v9 + 184) = v87;
  *(void *)(v9 + 192) = v86;
  *(void *)(v9 + 200) = v84;
  *(void *)(v9 + 208) = v83;
  *(void *)(v9 + 216) = v82;
  *(void *)(v9 + 224) = v81;
  *(void *)(v9 + 232) = v80;
  *(void *)(v9 + 240) = v79;
  *(void *)(v9 + 248) = v78;
  *(void *)(v9 + 256) = v77;
  *(void *)(v9 + 264) = v76;
  *(void *)(v9 + 272) = v75;
  *(void *)(v9 + 280) = v74;
  *(void *)(v9 + 288) = v73;
  *(void *)(v9 + 296) = v72;
  *(void *)(v9 + 304) = v71;
  *(void *)(v9 + 312) = v69;
  *(void *)(v9 + 320) = v68;
  *(void *)(v9 + 328) = v67;
  *(void *)(v9 + 336) = v66;
  *(void *)(v9 + 344) = v65;
  *(void *)(v9 + 352) = v63;
  *(void *)(v9 + 360) = v62;
  *(void *)(v9 + 368) = v61;
  *(void *)(v9 + 376) = v60;
  *(void *)(v9 + 384) = v58;
  *(void *)(v9 + 392) = v56;
  *(void *)(v9 + 400) = v55;
  *(void *)(v9 + 408) = v54;
  *(void *)(v9 + 416) = v53;
  *(void *)(v9 + 424) = v52;
  *(void *)(v9 + 432) = v51;
  *(void *)(v9 + 440) = v50;
  *(void *)(v9 + 448) = v49;
  *(void *)(v9 + 456) = v48;
  *(void *)(v9 + 464) = v47;
  *(void *)(v9 + 472) = v46;
  *(void *)(v9 + 480) = v45;
  *(void *)(v9 + 488) = v43;
  *(void *)(v9 + 496) = v42;
  *(void *)(v9 + 504) = v41;
  *(void *)(v9 + 512) = v40;
  *(void *)(v9 + 520) = v39;
  *(void *)(v9 + 528) = v38;
  *(void *)(v9 + 536) = v37;
  *(void *)(v9 + 544) = v36;
  *(void *)(v9 + 552) = v35;
  *(void *)(v9 + 560) = v34;
  *(void *)(v9 + 568) = v33;
  *(void *)(v9 + 576) = v32;
  *(void *)(v9 + 584) = v31;
  *(void *)(v9 + 592) = v30;
  *(void *)(v9 + 600) = v29;
  *(void *)(v9 + 608) = v27;
  *(void *)(v9 + 616) = v25;
  *(void *)(v9 + 624) = v23;
  *(_OWORD *)(v9 + 16) = xmmword_1000317D0;
  *(void *)(v9 + 632) = v59;
  *(void *)(v9 + 640) = v44;
  *(void *)(v9 + 648) = v28;
  *(void *)(v9 + 656) = v26;
  *(void *)(v9 + 664) = v24;
  *(void *)(v9 + 672) = v22;
  *(void *)(v9 + 680) = v21;
  *(void *)(v9 + 688) = v20;
  *(void *)(v9 + 696) = v19;
  *(void *)(v9 + 704) = v70;
  *(void *)(v9 + 712) = v18;
  *(void *)(v9 + 720) = v17;
  *(void *)(v9 + 728) = v85;
  *(void *)(v9 + 736) = v16;
  *(void *)(v9 + 744) = v15;
  *(void *)(v9 + 752) = v14;
  *(void *)(v9 + 760) = v13;
  *(void *)(v9 + 768) = v57;
  *(void *)(v9 + 776) = v12;
  *(void *)(v9 + 784) = v64;
  *(void *)(v9 + 792) = v0;
  *(void *)(v9 + 800) = v1;
  *(void *)(v9 + 808) = v2;
  *(void *)(v9 + 816) = v3;
  *(void *)(v9 + 824) = v4;
  *(void *)(v9 + 832) = v5;
  *(void *)(v9 + 840) = v6;
  *(void *)(v9 + 848) = v7;
  *(void *)(v9 + 856) = v8;
  uint64_t v10 = sub_10002FCA0();
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_100016E44(uint64_t a1)
{
  uint64_t v13 = a1;
  uint64_t v1 = sub_1000058C0(&qword_10003C8E0);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v15 = v1;
  uint64_t v16 = v2;
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)&v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_1000058C0(&qword_10003C8E8);
  uint64_t v6 = __chkstk_darwin(v5);
  __chkstk_darwin(v6);
  sub_100017728();
  sub_10002FD20();
  v17._countAndFlagsBits = 0x78616A41206B7341;
  v17._object = (void *)0xE900000000000020;
  sub_10002FD10(v17);
  swift_getKeyPath();
  sub_100017784();
  sub_10002FC70();
  swift_release();
  sub_10002FD00();
  swift_release();
  v18._countAndFlagsBits = 0;
  v18._object = (void *)0xE000000000000000;
  sub_10002FD10(v18);
  sub_10002FD30();
  uint64_t v14 = sub_10002FC90();
  uint64_t v7 = v15;
  uint64_t v8 = *(void (**)(char *, uint64_t))(v16 + 8);
  v16 += 8;
  v8(v4, v15);
  sub_10002FD20();
  v19._countAndFlagsBits = 0x2078616A41;
  v19._object = (void *)0xE500000000000000;
  sub_10002FD10(v19);
  swift_getKeyPath();
  sub_10002FC70();
  swift_release();
  sub_10002FD00();
  swift_release();
  v20._countAndFlagsBits = 0;
  v20._object = (void *)0xE000000000000000;
  sub_10002FD10(v20);
  sub_10002FD30();
  uint64_t v9 = sub_10002FC90();
  v8(v4, v7);
  sub_1000058C0(&qword_10003C8F0);
  uint64_t v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_1000317E0;
  *(void *)(v10 + 32) = v14;
  *(void *)(v10 + 40) = v9;
  uint64_t v11 = sub_10002FC80();
  swift_bridgeObjectRelease();
  return v11;
}

uint64_t sub_100017184(uint64_t a1)
{
  return sub_1000171B8(a1, (uint64_t)&unk_100031890, (void (*)(uint64_t))sub_100017728);
}

uint64_t sub_1000171B8(uint64_t a1, uint64_t a2, void (*a3)(uint64_t))
{
  uint64_t v4 = sub_10002FCF0();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  sub_100017784();
  sub_10002FC70();
  uint64_t v8 = swift_release();
  a3(v8);
  sub_10002FCE0();
  uint64_t v9 = sub_10002FCD0();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  sub_1000058C0(&qword_10003C8D0);
  uint64_t v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_1000317F0;
  *(void *)(v10 + 32) = v9;
  uint64_t v11 = sub_10002FCC0();
  swift_bridgeObjectRelease();
  return v11;
}

uint64_t sub_100017328()
{
  uint64_t v0 = sub_10002FCB0();
  uint64_t v1 = sub_10002FCB0();
  uint64_t v2 = sub_10002FCB0();
  sub_1000058C0(&qword_10003C8D8);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_100031800;
  *(void *)(v3 + 32) = v0;
  *(void *)(v3 + 40) = v1;
  *(void *)(v3 + 48) = v2;
  uint64_t v4 = sub_10002FCA0();
  swift_bridgeObjectRelease();
  return v4;
}

void sub_1000173F4()
{
  qword_10003CCA8 = (uint64_t)&_swiftEmptyArrayStorage;
}

uint64_t sub_100017410()
{
  if (qword_10003C2B8 != -1) {
    swift_once();
  }

  return swift_bridgeObjectRetain();
}

ValueMetadata *type metadata accessor for GenerativeAssistantIntents()
{
  return &type metadata for GenerativeAssistantIntents;
}

uint64_t sub_10001747C()
{
  uint64_t v0 = sub_10002FD60();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v12[-1] - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000063CC(v12);
  sub_100005F40();
  sub_10002FD70();
  uint64_t v4 = sub_10002FD50();
  uint64_t v5 = *(void (**)(char *, uint64_t))(v1 + 8);
  v5(v3, v0);
  sub_100021A70(v12);
  sub_1000176D4();
  sub_10002FD70();
  uint64_t v6 = sub_10002FD50();
  v5(v3, v0);
  sub_10001792C(v12);
  sub_100017728();
  sub_10002FD70();
  uint64_t v7 = sub_10002FD50();
  v5(v3, v0);
  sub_1000058C0(&qword_10003C8C0);
  uint64_t v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_100031800;
  *(void *)(v8 + 32) = v4;
  *(void *)(v8 + 40) = v6;
  *(void *)(v8 + 48) = v7;
  uint64_t v9 = sub_10002FD40();
  swift_bridgeObjectRelease();
  return v9;
}

unint64_t sub_1000176D4()
{
  unint64_t result = qword_10003C8B0;
  if (!qword_10003C8B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003C8B0);
  }
  return result;
}

unint64_t sub_100017728()
{
  unint64_t result = qword_10003C8B8;
  if (!qword_10003C8B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003C8B8);
  }
  return result;
}

unint64_t sub_100017784()
{
  unint64_t result = qword_10003C8C8;
  if (!qword_10003C8C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003C8C8);
  }
  return result;
}

uint64_t sub_1000177D8@<X0>(void *a1@<X8>)
{
  uint64_t result = sub_10002FC20();
  *a1 = v3;
  a1[1] = v4;
  return result;
}

uint64_t sub_100017814()
{
  return sub_10002FC30();
}

uint64_t sub_100017854@<X0>(void *a1@<X8>)
{
  uint64_t result = sub_10002FC20();
  *a1 = v3;
  a1[1] = v4;
  return result;
}

uint64_t sub_100017894()
{
  return sub_10002FC30();
}

unint64_t sub_1000178D8()
{
  unint64_t result = qword_10003C928;
  if (!qword_10003C928)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003C928);
  }
  return result;
}

uint64_t sub_10001792C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_1000058C0(&qword_10003C420);
  __chkstk_darwin(v2 - 8);
  uint64_t v47 = (char *)v39 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v62 = sub_10002FEC0();
  uint64_t v64 = *(void *)(v62 - 8);
  __chkstk_darwin(v62);
  uint64_t v46 = (char *)v39 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_1000058C0(&qword_10003C428);
  __chkstk_darwin(v5 - 8);
  uint64_t v45 = (char *)v39 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1000058C0(&qword_10003C430);
  __chkstk_darwin(v7 - 8);
  uint64_t v44 = (char *)v39 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_1000058C0(&qword_10003C438);
  __chkstk_darwin(v9 - 8);
  uint64_t v52 = (char *)v39 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v60 = sub_10002FF60();
  uint64_t v11 = *(void *)(v60 - 8);
  __chkstk_darwin(v60);
  uint64_t v63 = (char *)v39 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_100030000();
  __chkstk_darwin(v13 - 8);
  uint64_t v15 = (char *)v39 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_1000306E0();
  __chkstk_darwin(v16 - 8);
  Swift::String v18 = (char *)v39 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_10002FF70();
  uint64_t v56 = v19;
  uint64_t v20 = *(void *)(v19 - 8);
  uint64_t v21 = __chkstk_darwin(v19);
  uint64_t v43 = (char *)v39 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v21);
  uint64_t v24 = (char *)v39 - v23;
  a1[3] = sub_100030140();
  a1[4] = (uint64_t)&protocol witness table for GenerativeAssistantFeatureFlagManager;
  sub_100010080(a1);
  sub_100030130();
  a1[8] = sub_100030160();
  a1[9] = (uint64_t)&protocol witness table for GenerativeAssistantRestrictionManager;
  uint64_t v49 = a1;
  sub_100010080(a1 + 5);
  sub_100030150();
  uint64_t v41 = (void (*)(char *, uint64_t, uint64_t, uint64_t))sub_1000058C0(&qword_10003C440);
  sub_1000306D0();
  uint64_t v48 = v15;
  sub_10002FFF0();
  unsigned int v58 = enum case for LocalizedStringResource.BundleDescription.main(_:);
  uint64_t v25 = *(void (**)(void))(v11 + 104);
  uint64_t v59 = v11 + 104;
  uint64_t v61 = (void (*)(char *, void, uint64_t))v25;
  v25(v63);
  uint64_t v42 = v24;
  sub_10002FF80();
  uint64_t v26 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v20 + 56);
  uint64_t v55 = v20 + 56;
  uint64_t v57 = v26;
  uint64_t v27 = v52;
  v26(v52, 1, 1, v19);
  LOBYTE(v65) = 2;
  uint64_t v28 = sub_100030770();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v28 - 8) + 56))(v44, 1, 1, v28);
  uint64_t v51 = sub_10002FB60();
  uint64_t v29 = *(void *)(v51 - 8);
  uint64_t v40 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v29 + 56);
  uint64_t v53 = v29 + 56;
  uint64_t v30 = v45;
  v40(v45, 1, 1, v51);
  unsigned int v54 = enum case for InputConnectionBehavior.default(_:);
  uint64_t v31 = *(void (**)(void))(v64 + 104);
  v64 += 104;
  uint64_t v50 = (void (*)(char *, void, uint64_t))v31;
  uint64_t v32 = v46;
  uint64_t v33 = v62;
  v31(v46);
  a1[10] = sub_10002FC60();
  v39[1] = sub_1000058C0(&qword_10003C448);
  v39[0] = v18;
  sub_1000306D0();
  sub_10002FFF0();
  v61(v63, v58, v60);
  sub_10002FF80();
  v57(v27, 1, 1, v56);
  uint64_t v34 = sub_1000306C0();
  uint64_t v65 = 0;
  uint64_t v66 = 0;
  uint64_t v35 = *(void *)(v34 - 8);
  uint64_t v41 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v35 + 56);
  uint64_t v44 = (char *)(v35 + 56);
  uint64_t v36 = v47;
  v41(v47, 1, 1, v34);
  uint64_t v37 = v40;
  v40(v30, 1, 1, v51);
  v50(v32, v54, v33);
  v49[11] = sub_10002FC50();
  uint64_t v43 = (char *)sub_1000058C0(&qword_10003C450);
  sub_1000306D0();
  sub_10002FFF0();
  v61(v63, v58, v60);
  sub_10002FF80();
  v57(v52, 1, 1, v56);
  uint64_t v65 = 0;
  uint64_t v66 = 0;
  v41(v36, 1, 1, v34);
  v37(v30, 1, 1, v51);
  v50(v32, v54, v62);
  uint64_t result = sub_10002FC50();
  v49[12] = result;
  return result;
}

uint64_t sub_100018210()
{
  uint64_t v0 = sub_10002FF70();
  sub_100010AA0(v0, qword_10003CCB0);
  sub_100010A68(v0, (uint64_t)qword_10003CCB0);
  return sub_10002FF50();
}

uint64_t sub_100018274()
{
  uint64_t v0 = sub_1000058C0(&qword_10003C9A0);
  __chkstk_darwin(v0 - 8);
  sub_100017728();
  sub_10002FE90();
  return sub_10002FE80();
}

uint64_t sub_10001833C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_1000058C0(&qword_10003C438);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)&v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_10002FF70();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  sub_10002FF50();
  sub_10002FF50();
  (*(void (**)(char *, void, uint64_t, uint64_t))(v6 + 56))(v4, 0, 1, v5);
  sub_10002FD90();
  uint64_t v7 = sub_10002FD80();
  return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(a1, 0, 1, v7);
}

uint64_t sub_1000184E8(uint64_t a1)
{
  v2[103] = v1;
  v2[102] = a1;
  uint64_t v3 = sub_10002FEB0();
  v2[104] = v3;
  v2[105] = *(void *)(v3 - 8);
  v2[106] = swift_task_alloc();
  uint64_t v4 = sub_100030220();
  v2[107] = v4;
  v2[108] = *(void *)(v4 - 8);
  v2[109] = swift_task_alloc();
  uint64_t v5 = sub_100030530();
  v2[110] = v5;
  v2[111] = *(void *)(v5 - 8);
  v2[112] = swift_task_alloc();
  v2[113] = swift_task_alloc();
  v2[114] = swift_task_alloc();
  sub_1000058C0(&qword_10003C390);
  v2[115] = swift_task_alloc();
  uint64_t v6 = sub_100030410();
  v2[116] = v6;
  v2[117] = *(void *)(v6 - 8);
  v2[118] = swift_task_alloc();
  v2[119] = swift_task_alloc();
  sub_1000058C0(&qword_10003C468);
  v2[120] = swift_task_alloc();
  v2[121] = swift_task_alloc();
  v2[122] = swift_task_alloc();
  sub_1000058C0(&qword_10003C388);
  v2[123] = swift_task_alloc();
  uint64_t v7 = sub_1000300C0();
  v2[124] = v7;
  v2[125] = *(void *)(v7 - 8);
  v2[126] = swift_task_alloc();
  v2[127] = swift_task_alloc();
  uint64_t v8 = sub_100030360();
  v2[128] = v8;
  v2[129] = *(void *)(v8 - 8);
  v2[130] = swift_task_alloc();
  uint64_t v9 = sub_100030440();
  v2[131] = v9;
  v2[132] = *(void *)(v9 - 8);
  v2[133] = swift_task_alloc();
  uint64_t v10 = sub_1000304F0();
  v2[134] = v10;
  v2[135] = *(void *)(v10 - 8);
  v2[136] = swift_task_alloc();
  sub_1000058C0(&qword_10003C470);
  v2[137] = swift_task_alloc();
  v2[138] = sub_1000058C0(&qword_10003C478);
  v2[139] = swift_task_alloc();
  v2[140] = swift_task_alloc();
  sub_1000058C0(&qword_10003C480);
  v2[141] = swift_task_alloc();
  uint64_t v11 = sub_10002FB60();
  v2[142] = v11;
  v2[143] = *(void *)(v11 - 8);
  v2[144] = swift_task_alloc();
  v2[145] = swift_task_alloc();
  v2[146] = swift_task_alloc();
  sub_100030320();
  v2[147] = swift_task_alloc();
  sub_1000058C0(&qword_10003C488);
  v2[148] = swift_task_alloc();
  sub_1000304B0();
  v2[149] = swift_task_alloc();
  sub_1000058C0(&qword_10003C490);
  v2[150] = swift_task_alloc();
  uint64_t v12 = sub_1000304A0();
  v2[151] = v12;
  v2[152] = *(void *)(v12 - 8);
  v2[153] = swift_task_alloc();
  uint64_t v13 = sub_1000301A0();
  v2[154] = v13;
  v2[155] = *(void *)(v13 - 8);
  v2[156] = swift_task_alloc();
  v2[157] = swift_task_alloc();
  v2[158] = swift_task_alloc();
  uint64_t v14 = sub_100030630();
  v2[159] = v14;
  v2[160] = *(void *)(v14 - 8);
  v2[161] = swift_task_alloc();
  v2[162] = swift_task_alloc();
  v2[163] = swift_task_alloc();
  v2[164] = swift_task_alloc();
  v2[165] = swift_task_alloc();
  v2[166] = swift_task_alloc();
  v2[167] = swift_task_alloc();
  sub_1000058C0(&qword_10003C498);
  v2[168] = swift_task_alloc();
  uint64_t v15 = sub_100030680();
  v2[169] = v15;
  v2[170] = *(void *)(v15 - 8);
  v2[171] = swift_task_alloc();
  v2[172] = swift_task_alloc();
  sub_10002FF70();
  v2[173] = swift_task_alloc();
  uint64_t v16 = type metadata accessor for GenerativeResponseEntity(0);
  v2[174] = v16;
  v2[175] = *(void *)(v16 - 8);
  v2[176] = swift_task_alloc();
  v2[177] = swift_task_alloc();
  v2[178] = swift_task_alloc();
  uint64_t v17 = sub_1000300F0();
  v2[179] = v17;
  v2[180] = *(void *)(v17 - 8);
  v2[181] = swift_task_alloc();
  uint64_t v18 = sub_10002FE30();
  v2[182] = v18;
  v2[183] = *(void *)(v18 - 8);
  v2[184] = swift_task_alloc();
  v2[185] = swift_task_alloc();
  v2[186] = swift_task_alloc();
  v2[187] = swift_task_alloc();
  sub_1000058C0(&qword_10003C4A0);
  v2[188] = swift_task_alloc();
  v2[189] = swift_task_alloc();
  v2[190] = swift_task_alloc();
  uint64_t v19 = sub_10002FFB0();
  v2[191] = v19;
  v2[192] = *(void *)(v19 - 8);
  v2[193] = swift_task_alloc();
  sub_1000307B0();
  v2[194] = sub_1000307A0();
  uint64_t v21 = sub_100030780();
  v2[195] = v21;
  v2[196] = v20;
  return ((uint64_t (*)(uint64_t (*)(), uint64_t, uint64_t))_swift_task_switch)(sub_100018F68, v21, v20);
}

uint64_t sub_100018F68()
{
  uint64_t v1 = *(void **)(v0 + 824);
  sub_10002FFA0();
  sub_100010150(v1, v1[3]);
  if ((sub_100030190() & 1) == 0)
  {
    swift_release();
    sub_100030610();
    uint64_t v12 = sub_100030620();
    os_log_type_t v13 = sub_100030800();
    if (os_log_type_enabled(v12, v13))
    {
      uint64_t v14 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, v13, "LowConfidenceKnowledge FF is off", v14, 2u);
      swift_slowDealloc();
    }
    uint64_t v15 = *(void *)(v0 + 1408);
    uint64_t v16 = *(void *)(v0 + 1400);
    uint64_t v17 = *(int **)(v0 + 1392);
    uint64_t v18 = *(void *)(v0 + 1288);
    uint64_t v19 = *(void *)(v0 + 1280);
    uint64_t v20 = *(void *)(v0 + 1272);
    uint64_t v21 = *(void *)(v0 + 1112);

    (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v18, v20);
    sub_10002FFD0();
    uint64_t v22 = v17[5];
    sub_1000058C0(&qword_10003C4A8);
    sub_10002FF50();
    sub_100020CE0(&qword_10003C4B0, (void (*)(uint64_t))type metadata accessor for ResponseImageEntity);
    *(void *)(v15 + v22) = sub_10002FBD0();
    uint64_t v23 = v17[6];
    sub_1000058C0(&qword_10003C4B8);
    sub_10002FF50();
    sub_100020CE0(&qword_10003C4C0, (void (*)(uint64_t))type metadata accessor for ResponseTextEntity);
    *(void *)(v15 + v23) = sub_10002FBD0();
    uint64_t v24 = v17[7];
    sub_1000058C0(&qword_10003C2E0);
    sub_10002FF50();
    *(void *)(v15 + v24) = sub_10002FBF0();
    uint64_t v25 = v17[8];
    sub_10002FF50();
    *(void *)(v15 + v25) = sub_10002FBF0();
    *(void *)(v0 + 680) = sub_1000302E0();
    *(void *)(v0 + 688) = v26;
    sub_10002FBB0();
    sub_100010194(v15, v21);
    (*(void (**)(uint64_t, void, uint64_t, int *))(v16 + 56))(v21, 0, 1, v17);
    uint64_t v27 = sub_10002FBA0();
    uint64_t v35 = *(void *)(v0 + 672);
    if (v35)
    {
      uint64_t v36 = *(void *)(v0 + 664);
      uint64_t v37 = *(void *)(v0 + 1536);
      uint64_t v221 = *(void *)(v0 + 1528);
      uint64_t v227 = *(void *)(v0 + 1544);
      uint64_t v38 = *(void *)(v0 + 1152);
      uint64_t v39 = *(void *)(v0 + 1144);
      uint64_t v215 = *(void *)(v0 + 1136);
      uint64_t v218 = *(void *)(v0 + 1408);
      uint64_t v40 = *(void *)(v0 + 1112);
      sub_10002FBA0();
      sub_10001FB90(v36, v35, *(void *)(v0 + 648), *(void *)(v0 + 656), v38);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_1000101F8();
      sub_10002FB70();
      (*(void (**)(uint64_t, uint64_t))(v39 + 8))(v38, v215);
      sub_100010A0C(v40, &qword_10003C478);
      sub_10001029C(v218);
      (*(void (**)(uint64_t, uint64_t))(v37 + 8))(v227, v221);
LABEL_49:
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
      uint64_t v183 = *(uint64_t (**)(void))(v0 + 8);
      return v183();
    }
LABEL_59:
    __break(1u);
    return GenerateTextController.generateRichContent(userQuery:useCaseID:invocationContext:requestValueCallback:requestConfirmationCallback:progressReportingCallback:responseGenerationKeepAliveCallback:showJITEnablementCallback:)(v27, v28, v29, v30, v31, v32, v33, v34);
  }
  uint64_t v2 = *(void *)(v0 + 1520);
  uint64_t v3 = *(void *)(v0 + 1496);
  uint64_t v4 = *(void *)(v0 + 1464);
  uint64_t v5 = *(void *)(v0 + 1456);
  *(void *)(v0 + 1576) = sub_100030200();
  sub_1000301F0();
  sub_100030250();
  sub_1000301D0();
  swift_release();
  *(void *)(v0 + 1584) = sub_100030290();
  sub_100030280();
  *(void *)(v0 + 1592) = sub_100017728();
  sub_10002FAB0();
  sub_10002FE10();
  uint64_t v6 = *(void (**)(uint64_t, uint64_t))(v4 + 8);
  *(void *)(v0 + 1600) = v6;
  *(void *)(v0 + 1608) = (v4 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v6(v3, v5);
  uint64_t v7 = sub_10002FE00();
  *(void *)(v0 + 1616) = v7;
  uint64_t v8 = *(void *)(v7 - 8);
  *(void *)(v0 + 1624) = v8;
  uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v8 + 48);
  *(void *)(v0 + 1632) = v9;
  *(void *)(v0 + 1640) = (v8 + 48) & 0xFFFFFFFFFFFFLL | 0x60F0000000000000;
  int v10 = v9(v2, 1, v7);
  uint64_t v11 = *(void *)(v0 + 1520);
  if (v10 == 1)
  {
    sub_100010A0C(v11, &qword_10003C4A0);
  }
  else
  {
    sub_10002FDE0();
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v11, v7);
  }
  uint64_t v41 = *(void *)(v0 + 1448);
  uint64_t v42 = *(void *)(v0 + 1440);
  uint64_t v43 = *(void *)(v0 + 1432);
  uint64_t v44 = *(void *)(v0 + 1424);
  uint64_t v222 = *(void *)(v0 + 824);
  v228 = *(int **)(v0 + 1392);
  sub_100030270();
  swift_release();
  swift_bridgeObjectRelease();
  sub_1000301F0();
  (*(void (**)(uint64_t, void, uint64_t))(v42 + 104))(v41, enum case for GenerativeUsecases.knowledge(_:), v43);
  sub_1000300E0();
  (*(void (**)(uint64_t, uint64_t))(v42 + 8))(v41, v43);
  sub_1000301B0();
  swift_release();
  sub_10002FFD0();
  uint64_t v45 = v228[5];
  *(void *)(v0 + 1648) = sub_1000058C0(&qword_10003C4A8);
  sub_10002FF50();
  *(void *)(v0 + 1656) = sub_100020CE0(&qword_10003C4B0, (void (*)(uint64_t))type metadata accessor for ResponseImageEntity);
  *(void *)(v44 + v45) = sub_10002FBD0();
  uint64_t v46 = v228[6];
  *(void *)(v0 + 1664) = sub_1000058C0(&qword_10003C4B8);
  sub_10002FF50();
  *(void *)(v0 + 1672) = sub_100020CE0(&qword_10003C4C0, (void (*)(uint64_t))type metadata accessor for ResponseTextEntity);
  *(void *)(v44 + v46) = sub_10002FBD0();
  uint64_t v47 = v228[7];
  *(_DWORD *)(v0 + 1944) = v47;
  *(void *)(v0 + 1680) = sub_1000058C0(&qword_10003C2E0);
  sub_10002FF50();
  *(void *)(v44 + v47) = sub_10002FBF0();
  uint64_t v48 = v228[8];
  *(_DWORD *)(v0 + 1948) = v48;
  sub_10002FF50();
  *(void *)(v44 + v48) = sub_10002FBF0();
  sub_100010150((void *)(v222 + 40), *(void *)(v222 + 64));
  if ((sub_100030100() & 1) == 0)
  {
    swift_release();
    sub_100030600();
    uint64_t v64 = sub_100030620();
    os_log_type_t v65 = sub_1000307F0();
    BOOL v66 = os_log_type_enabled(v64, v65);
    uint64_t v67 = *(void *)(v0 + 1296);
    uint64_t v68 = *(void *)(v0 + 1280);
    uint64_t v69 = *(void *)(v0 + 1272);
    if (v66)
    {
      uint64_t v70 = swift_slowAlloc();
      uint64_t v234 = swift_slowAlloc();
      *(_DWORD *)uint64_t v70 = 136315394;
      *(void *)(v0 + 760) = sub_10002EB08(0xD00000000000001FLL, 0x8000000100031A70, &v234);
      sub_100030830();
      *(_WORD *)(v70 + 12) = 2080;
      *(void *)(v0 + 752) = sub_10002EB08(0x286D726F66726570, 0xE900000000000029, &v234);
      sub_100030830();
      _os_log_impl((void *)&_mh_execute_header, v64, v65, "%s.%s request was restricted by MDM or parental controls.", (uint8_t *)v70, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    (*(void (**)(uint64_t, uint64_t))(v68 + 8))(v67, v69);
    uint64_t v223 = *(void *)(v0 + 1528);
    uint64_t v229 = *(void *)(v0 + 1544);
    uint64_t v206 = *(void *)(v0 + 1424);
    uint64_t v210 = *(void *)(v0 + 1536);
    uint64_t v71 = *(void *)(v0 + 1400);
    uint64_t v72 = *(void *)(v0 + 1392);
    uint64_t v73 = *(void *)(v0 + 1160);
    uint64_t v74 = *(void *)(v0 + 1144);
    uint64_t v75 = *(void *)(v0 + 1120);
    uint64_t v201 = *(void *)(v0 + 1136);
    uint64_t v76 = *(void *)(v0 + 1096);
    uint64_t v77 = *(void *)(v0 + 896);
    uint64_t v78 = *(void *)(v0 + 888);
    uint64_t v79 = *(void *)(v0 + 880);
    sub_100010194(v206, v75);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v71 + 56))(v75, 0, 1, v72);
    sub_100030470();
    (*(void (**)(uint64_t, void, uint64_t))(v78 + 104))(v77, enum case for CatId.genericRestrictionResponse(_:), v79);
    sub_100030450();
    (*(void (**)(uint64_t, uint64_t))(v78 + 8))(v77, v79);
    sub_1000101F8();
    sub_10002FB70();
    (*(void (**)(uint64_t, uint64_t))(v74 + 8))(v73, v201);
    sub_100010A0C(v75, &qword_10003C478);
    sub_10001029C(v206);
    sub_1000301F0();
    sub_100030250();
    uint64_t v80 = sub_1000305B0();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v80 - 8) + 56))(v76, 1, 1, v80);
    sub_1000301C0();
    swift_release();
    sub_100010A0C(v76, &qword_10003C470);
    sub_1000301F0();
    sub_1000301E0();
    swift_release();
    sub_100030280();
    sub_100030260();
    swift_release();
    (*(void (**)(uint64_t, uint64_t))(v210 + 8))(v229, v223);
    goto LABEL_49;
  }
  sub_100010150((void *)(v222 + 40), *(void *)(v222 + 64));
  if (sub_100030120()) {
    goto LABEL_12;
  }
  uint64_t v49 = *(void *)(v0 + 1376);
  uint64_t v50 = *(void *)(v0 + 1360);
  uint64_t v51 = *(void *)(v0 + 1352);
  uint64_t v52 = *(void *)(v0 + 1344);
  sub_100030660();
  sub_100030650();
  uint64_t v53 = *(void (**)(uint64_t, uint64_t))(v50 + 8);
  *(void *)(v0 + 1688) = v53;
  *(void *)(v0 + 1696) = (v50 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v53(v49, v51);
  uint64_t v54 = sub_100030640();
  LODWORD(v49) = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v54 - 8) + 48))(v52, 1, v54);
  sub_100010A0C(v52, &qword_10003C498);
  if (v49 == 1)
  {
LABEL_12:
    uint64_t v55 = *(void (**)(void, void, void))(*(void *)(v0 + 1240) + 104);
    v55(*(void *)(v0 + 1264), enum case for GenerativeAssistantUseCase.knowledgeFallback(_:), *(void *)(v0 + 1232));
    sub_10002FC20();
    if (*(unsigned char *)(v0 + 1956))
    {
      sub_100030600();
      uint64_t v81 = sub_100030620();
      os_log_type_t v82 = sub_1000307F0();
      BOOL v83 = os_log_type_enabled(v81, v82);
      uint64_t v84 = *(void *)(v0 + 1280);
      uint64_t v197 = *(void *)(v0 + 1272);
      uint64_t v202 = *(void *)(v0 + 1328);
      uint64_t v85 = *(void *)(v0 + 1264);
      uint64_t v86 = *(void *)(v0 + 1240);
      uint64_t v207 = *(void *)(v0 + 1232);
      if (v83)
      {
        uint64_t v87 = swift_slowAlloc();
        uint64_t v234 = swift_slowAlloc();
        *(_DWORD *)uint64_t v87 = 136315394;
        *(void *)(v0 + 800) = sub_10002EB08(0xD00000000000001FLL, 0x8000000100031A70, &v234);
        sub_100030830();
        *(_WORD *)(v87 + 12) = 2080;
        *(void *)(v0 + 808) = sub_10002EB08(0x286D726F66726570, 0xE900000000000029, &v234);
        sub_100030830();
        _os_log_impl((void *)&_mh_execute_header, v81, v82, "%s.%s This is an explicit knowledge request -- using .knowledge use case ", (uint8_t *)v87, 0x16u);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        uint64_t v88 = *(void (**)(uint64_t, uint64_t))(v84 + 8);
        v88(v202, v197);
        (*(void (**)(uint64_t, uint64_t))(v86 + 8))(v85, v207);
      }
      else
      {

        uint64_t v88 = *(void (**)(uint64_t, uint64_t))(v84 + 8);
        v88(v202, v197);
        (*(void (**)(uint64_t, uint64_t))(v86 + 8))(v85, v207);
      }
      v55(*(void *)(v0 + 1264), enum case for GenerativeAssistantUseCase.knowledge(_:), *(void *)(v0 + 1232));
    }
    else
    {
      sub_100030600();
      uint64_t v56 = sub_100030620();
      os_log_type_t v57 = sub_1000307F0();
      BOOL v58 = os_log_type_enabled(v56, v57);
      uint64_t v59 = *(void *)(v0 + 1320);
      uint64_t v60 = *(void *)(v0 + 1280);
      uint64_t v61 = *(void *)(v0 + 1272);
      if (v58)
      {
        uint64_t v62 = swift_slowAlloc();
        uint64_t v234 = swift_slowAlloc();
        *(_DWORD *)uint64_t v62 = 136315394;
        *(void *)(v0 + 784) = sub_10002EB08(0xD00000000000001FLL, 0x8000000100031A70, &v234);
        sub_100030830();
        *(_WORD *)(v62 + 12) = 2080;
        *(void *)(v0 + 792) = sub_10002EB08(0x286D726F66726570, 0xE900000000000029, &v234);
        sub_100030830();
        _os_log_impl((void *)&_mh_execute_header, v56, v57, "%s.%s This is NOT an explicit knowledge request -- hence using .knowledgeFallback use case", (uint8_t *)v62, 0x16u);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        uint64_t v63 = *(void (**)(uint64_t, uint64_t))(v60 + 8);
        v63(v59, v61);
      }
      else
      {

        uint64_t v63 = *(void (**)(uint64_t, uint64_t))(v60 + 8);
        v63(v59, v61);
      }
      uint64_t v88 = v63;
    }
    sub_100010150((void *)(*(void *)(v0 + 824) + 40), *(void *)(*(void *)(v0 + 824) + 64));
    if ((sub_100030110() & 1) == 0)
    {
      swift_release();
      sub_100030600();
      uint64_t v102 = sub_100030620();
      os_log_type_t v103 = sub_1000307F0();
      BOOL v104 = os_log_type_enabled(v102, v103);
      uint64_t v105 = *(void *)(v0 + 1304);
      uint64_t v106 = *(void *)(v0 + 1272);
      if (v104)
      {
        uint64_t v224 = *(void *)(v0 + 1304);
        uint64_t v107 = swift_slowAlloc();
        uint64_t v234 = swift_slowAlloc();
        *(_DWORD *)uint64_t v107 = 136315394;
        *(void *)(v0 + 736) = sub_10002EB08(0xD00000000000001FLL, 0x8000000100031A70, &v234);
        sub_100030830();
        *(_WORD *)(v107 + 12) = 2080;
        *(void *)(v0 + 728) = sub_10002EB08(0x286D726F66726570, 0xE900000000000029, &v234);
        sub_100030830();
        _os_log_impl((void *)&_mh_execute_header, v102, v103, "%s.%s request is not available", (uint8_t *)v107, 0x16u);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        v88(v224, v106);
      }
      else
      {

        v88(v105, v106);
      }
      uint64_t v219 = *(void *)(v0 + 1536);
      uint64_t v225 = *(void *)(v0 + 1528);
      uint64_t v232 = *(void *)(v0 + 1544);
      uint64_t v117 = *(void *)(v0 + 1400);
      uint64_t v118 = *(void *)(v0 + 1392);
      uint64_t v203 = *(void *)(v0 + 1264);
      uint64_t v119 = *(void *)(v0 + 1240);
      uint64_t v195 = *(void *)(v0 + 1424);
      uint64_t v198 = *(void *)(v0 + 1232);
      uint64_t v120 = *(void *)(v0 + 1160);
      uint64_t v121 = *(void *)(v0 + 1144);
      uint64_t v122 = *(void *)(v0 + 1120);
      uint64_t v193 = *(void *)(v0 + 1136);
      uint64_t v212 = *(void *)(v0 + 1096);
      uint64_t v123 = *(void *)(v0 + 896);
      uint64_t v124 = *(void *)(v0 + 888);
      uint64_t v125 = *(void *)(v0 + 880);
      sub_100010194(v195, v122);
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v117 + 56))(v122, 0, 1, v118);
      sub_100030470();
      (*(void (**)(uint64_t, void, uint64_t))(v124 + 104))(v123, enum case for CatId.disabledResponse(_:), v125);
      sub_100030450();
      (*(void (**)(uint64_t, uint64_t))(v124 + 8))(v123, v125);
      sub_1000101F8();
      sub_10002FB70();
      (*(void (**)(uint64_t, uint64_t))(v121 + 8))(v120, v193);
      sub_100010A0C(v122, &qword_10003C478);
      (*(void (**)(uint64_t, uint64_t))(v119 + 8))(v203, v198);
      sub_10001029C(v195);
      sub_1000301F0();
      sub_100030250();
      uint64_t v126 = sub_1000305B0();
      uint64_t v127 = v212;
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v126 - 8) + 56))(v212, 1, 1, v126);
LABEL_48:
      sub_1000301C0();
      swift_release();
      sub_100010A0C(v127, &qword_10003C470);
      sub_1000301F0();
      sub_1000301E0();
      swift_release();
      sub_100030280();
      sub_100030260();
      swift_release();
      (*(void (**)(uint64_t, uint64_t))(v219 + 8))(v232, v225);
      goto LABEL_49;
    }
    sub_100030600();
    uint64_t v96 = sub_100030620();
    os_log_type_t v97 = sub_1000307F0();
    BOOL v98 = os_log_type_enabled(v96, v97);
    uint64_t v99 = *(void *)(v0 + 1312);
    uint64_t v100 = *(void *)(v0 + 1272);
    if (v98)
    {
      v231 = v88;
      uint64_t v101 = swift_slowAlloc();
      uint64_t v234 = swift_slowAlloc();
      *(_DWORD *)uint64_t v101 = 136315394;
      *(void *)(v0 + 768) = sub_10002EB08(0xD00000000000001FLL, 0x8000000100031A70, &v234);
      sub_100030830();
      *(_WORD *)(v101 + 12) = 2080;
      *(void *)(v0 + 720) = sub_10002EB08(0x286D726F66726570, 0xE900000000000029, &v234);
      sub_100030830();
      _os_log_impl((void *)&_mh_execute_header, v96, v97, "%s.%s Use case is available", (uint8_t *)v101, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      v231(v99, v100);
    }
    else
    {

      v88(v99, v100);
    }
    sub_100020A00();
    long long v108 = (void *)sub_10002FED0();
    uint64_t v27 = sub_100030310();
    float v110 = v109 * 100.0;
    if ((~LODWORD(v110) & 0x7F800000) != 0)
    {
      if (v110 > -9.2234e18)
      {
        if (v110 < 9.2234e18)
        {
          v216 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v0 + 1632);
          uint64_t v211 = *(void *)(v0 + 1616);
          uint64_t v111 = *(void (**)(uint64_t, uint64_t))(v0 + 1600);
          uint64_t v112 = *(void *)(v0 + 1512);
          uint64_t v113 = *(void *)(v0 + 1488);
          uint64_t v114 = *(void *)(v0 + 1456);
          [v108 setTotalUnitCount:(uint64_t)v110];

          sub_10002FC20();
          sub_10002FAB0();
          sub_10002FE10();
          v111(v113, v114);
          if (v216(v112, 1, v211) == 1)
          {
            uint64_t v115 = *(void *)(v0 + 1200);
            sub_100010A0C(*(void *)(v0 + 1512), &qword_10003C4A0);
            uint64_t v116 = sub_10002FDC0();
            (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v116 - 8) + 56))(v115, 1, 1, v116);
          }
          else
          {
            uint64_t v128 = *(void *)(v0 + 1624);
            uint64_t v129 = *(void *)(v0 + 1616);
            uint64_t v130 = *(void *)(v0 + 1512);
            sub_10002FDD0();
            (*(void (**)(uint64_t, uint64_t))(v128 + 8))(v130, v129);
          }
          v220 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v0 + 1632);
          uint64_t v131 = *(void (**)(uint64_t, uint64_t))(v0 + 1600);
          uint64_t v213 = *(void *)(v0 + 1504);
          uint64_t v217 = *(void *)(v0 + 1616);
          uint64_t v132 = *(void *)(v0 + 1480);
          uint64_t v133 = *(void *)(v0 + 1472);
          uint64_t v134 = *(void *)(v0 + 1456);
          uint64_t v204 = *(void *)(v0 + 1256);
          uint64_t v208 = *(void *)(v0 + 1264);
          uint64_t v135 = *(void *)(v0 + 1240);
          uint64_t v199 = *(void *)(v0 + 1232);
          uint64_t v136 = *(void *)(v0 + 1200);
          uint64_t v137 = *(void *)(v0 + 1184);
          sub_100030810();
          sub_100010A0C(v136, &qword_10003C490);
          sub_10002FAB0();
          sub_10002FE20();
          v131(v132, v134);
          sub_100030820();
          sub_100010A0C(v137, &qword_10003C488);
          uint64_t v138 = *(void (**)(uint64_t, uint64_t, uint64_t))(v135 + 16);
          v138(v204, v208, v199);
          sub_10002FAB0();
          sub_10002FE10();
          v131(v133, v134);
          if (v220(v213, 1, v217) == 1)
          {
            sub_100010A0C(*(void *)(v0 + 1504), &qword_10003C4A0);
          }
          else
          {
            uint64_t v139 = *(void *)(v0 + 1624);
            uint64_t v140 = *(void *)(v0 + 1616);
            uint64_t v141 = *(void *)(v0 + 1504);
            sub_10002FDF0();
            (*(void (**)(uint64_t, uint64_t))(v139 + 8))(v141, v140);
          }
          uint64_t v142 = *(void *)(v0 + 1128);
          sub_100030480();
          sub_100030560();
          sub_100030550();
          sub_100030540();
          swift_release();
          uint64_t v143 = sub_1000058C0(&qword_10003C4E0);
          if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v143 - 8) + 48))(v142, 1, v143) == 1)
          {
            uint64_t v144 = *(void *)(v0 + 1248);
            uint64_t v214 = *(void *)(v0 + 1264);
            uint64_t v145 = *(void *)(v0 + 1232);
            uint64_t v146 = *(void *)(v0 + 824);
            sub_100010A0C(*(void *)(v0 + 1128), &qword_10003C480);
            sub_1000304D0();
            sub_100020A54(v146, v0 + 432);
            uint64_t v147 = swift_allocObject();
            *(void *)(v0 + 1720) = v147;
            long long v148 = *(_OWORD *)(v0 + 512);
            *(_OWORD *)(v147 + 80) = *(_OWORD *)(v0 + 496);
            *(_OWORD *)(v147 + 96) = v148;
            *(void *)(v147 + 112) = *(void *)(v0 + 528);
            long long v149 = *(_OWORD *)(v0 + 448);
            *(_OWORD *)(v147 + 16) = *(_OWORD *)(v0 + 432);
            *(_OWORD *)(v147 + 32) = v149;
            long long v150 = *(_OWORD *)(v0 + 480);
            *(_OWORD *)(v147 + 48) = *(_OWORD *)(v0 + 464);
            *(_OWORD *)(v147 + 64) = v150;
            sub_100020A54(v146, v0 + 328);
            uint64_t v151 = swift_allocObject();
            *(void *)(v0 + 1728) = v151;
            long long v152 = *(_OWORD *)(v0 + 408);
            *(_OWORD *)(v151 + 80) = *(_OWORD *)(v0 + 392);
            *(_OWORD *)(v151 + 96) = v152;
            *(void *)(v151 + 112) = *(void *)(v0 + 424);
            long long v153 = *(_OWORD *)(v0 + 344);
            *(_OWORD *)(v151 + 16) = *(_OWORD *)(v0 + 328);
            *(_OWORD *)(v151 + 32) = v153;
            long long v154 = *(_OWORD *)(v0 + 376);
            *(_OWORD *)(v151 + 48) = *(_OWORD *)(v0 + 360);
            *(_OWORD *)(v151 + 64) = v154;
            sub_10002FC20();
            uint64_t v226 = *(void *)(v0 + 632);
            uint64_t v155 = *(void *)(v0 + 640);
            *(void *)(v0 + 1736) = v155;
            v138(v144, v214, v145);
            sub_100020A54(v146, v0 + 224);
            uint64_t v156 = swift_allocObject();
            *(void *)(v0 + 1744) = v156;
            long long v157 = *(_OWORD *)(v0 + 304);
            *(_OWORD *)(v156 + 80) = *(_OWORD *)(v0 + 288);
            *(_OWORD *)(v156 + 96) = v157;
            *(void *)(v156 + 112) = *(void *)(v0 + 320);
            long long v158 = *(_OWORD *)(v0 + 240);
            *(_OWORD *)(v156 + 16) = *(_OWORD *)(v0 + 224);
            *(_OWORD *)(v156 + 32) = v158;
            long long v159 = *(_OWORD *)(v0 + 272);
            *(_OWORD *)(v156 + 48) = *(_OWORD *)(v0 + 256);
            *(_OWORD *)(v156 + 64) = v159;
            sub_100020A54(v146, v0 + 120);
            uint64_t v160 = swift_allocObject();
            *(void *)(v0 + 1752) = v160;
            long long v161 = *(_OWORD *)(v0 + 168);
            long long v162 = *(_OWORD *)(v0 + 200);
            *(_OWORD *)(v160 + 80) = *(_OWORD *)(v0 + 184);
            *(_OWORD *)(v160 + 96) = v162;
            *(void *)(v160 + 112) = *(void *)(v0 + 216);
            long long v163 = *(_OWORD *)(v0 + 136);
            *(_OWORD *)(v160 + 16) = *(_OWORD *)(v0 + 120);
            *(_OWORD *)(v160 + 32) = v163;
            *(_OWORD *)(v160 + 48) = *(_OWORD *)(v0 + 152);
            *(_OWORD *)(v160 + 64) = v161;
            sub_100020A54(v146, v0 + 16);
            uint64_t v164 = swift_allocObject();
            *(void *)(v0 + 1760) = v164;
            long long v165 = *(_OWORD *)(v0 + 96);
            *(_OWORD *)(v164 + 80) = *(_OWORD *)(v0 + 80);
            *(_OWORD *)(v164 + 96) = v165;
            *(void *)(v164 + 112) = *(void *)(v0 + 112);
            long long v166 = *(_OWORD *)(v0 + 32);
            *(_OWORD *)(v164 + 16) = *(_OWORD *)(v0 + 16);
            *(_OWORD *)(v164 + 32) = v166;
            long long v167 = *(_OWORD *)(v0 + 64);
            *(_OWORD *)(v164 + 48) = *(_OWORD *)(v0 + 48);
            *(_OWORD *)(v164 + 64) = v167;
            swift_retain();
            uint64_t v168 = (void *)swift_task_alloc();
            *(void *)(v0 + 1768) = v168;
            *uint64_t v168 = v0;
            v168[1] = sub_10001CBCC;
            uint64_t v30 = *(void *)(v0 + 1248);
            uint64_t v31 = *(void *)(v0 + 1224);
            uint64_t v27 = *(void *)(v0 + 1064);
            uint64_t v32 = &unk_10003C998;
            uint64_t v34 = &unk_10003C978;
            uint64_t v28 = v226;
            uint64_t v29 = v155;
            uint64_t v33 = v156;
            return GenerateTextController.generateRichContent(userQuery:useCaseID:invocationContext:requestValueCallback:requestConfirmationCallback:progressReportingCallback:responseGenerationKeepAliveCallback:showJITEnablementCallback:)(v27, v28, v29, v30, v31, v32, v33, v34);
          }
          uint64_t v219 = *(void *)(v0 + 1536);
          uint64_t v225 = *(void *)(v0 + 1528);
          uint64_t v232 = *(void *)(v0 + 1544);
          uint64_t v169 = *(void *)(v0 + 1416);
          uint64_t v189 = *(void *)(v0 + 1400);
          uint64_t v170 = *(int **)(v0 + 1392);
          uint64_t v200 = *(void *)(v0 + 1264);
          uint64_t v205 = *(void *)(v0 + 1424);
          uint64_t v194 = *(void *)(v0 + 1240);
          uint64_t v196 = *(void *)(v0 + 1232);
          uint64_t v190 = *(void *)(v0 + 1216);
          uint64_t v191 = *(void *)(v0 + 1208);
          uint64_t v192 = *(void *)(v0 + 1224);
          uint64_t v171 = *(void *)(v0 + 1168);
          uint64_t v188 = v171;
          uint64_t v172 = *(void *)(v0 + 1144);
          uint64_t v173 = *(void *)(v0 + 1136);
          uint64_t v174 = *(char **)(v0 + 1128);
          uint64_t v175 = *(void *)(v0 + 1120);
          uint64_t v209 = *(void *)(v0 + 1096);
          swift_release();
          uint64_t v186 = *((void *)v174 + 1);
          uint64_t v187 = *(void *)v174;
          uint64_t v176 = v171;
          uint64_t v177 = v173;
          (*(void (**)(uint64_t, char *, uint64_t))(v172 + 32))(v176, &v174[*(int *)(v143 + 48)], v173);
          sub_10002FFD0();
          uint64_t v178 = v170[5];
          sub_10002FF50();
          *(void *)(v169 + v178) = sub_10002FBD0();
          uint64_t v179 = v170[6];
          sub_10002FF50();
          *(void *)(v169 + v179) = sub_10002FBD0();
          uint64_t v180 = v170[7];
          sub_10002FF50();
          *(void *)(v169 + v180) = sub_10002FBF0();
          uint64_t v181 = v170[8];
          sub_10002FF50();
          *(void *)(v169 + v181) = sub_10002FBF0();
          *(void *)(v0 + 616) = v187;
          *(void *)(v0 + 624) = v186;
          sub_10002FBB0();
          sub_100010194(v169, v175);
          (*(void (**)(uint64_t, void, uint64_t, int *))(v189 + 56))(v175, 0, 1, v170);
          sub_1000101F8();
          sub_10002FB70();
          sub_100010A0C(v175, &qword_10003C478);
          sub_10001029C(v169);
          (*(void (**)(uint64_t, uint64_t))(v172 + 8))(v188, v177);
          (*(void (**)(uint64_t, uint64_t))(v190 + 8))(v192, v191);
          (*(void (**)(uint64_t, uint64_t))(v194 + 8))(v200, v196);
          sub_10001029C(v205);
          sub_1000301F0();
          sub_100030250();
          uint64_t v182 = sub_1000305B0();
          uint64_t v127 = v209;
          (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v182 - 8) + 56))(v209, 1, 1, v182);
          goto LABEL_48;
        }
        goto LABEL_58;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
LABEL_58:
    __break(1u);
    goto LABEL_59;
  }
  sub_100030600();
  uint64_t v89 = sub_100030620();
  os_log_type_t v90 = sub_1000307F0();
  BOOL v91 = os_log_type_enabled(v89, v90);
  uint64_t v92 = *(void *)(v0 + 1336);
  uint64_t v93 = *(void *)(v0 + 1280);
  uint64_t v94 = *(void *)(v0 + 1272);
  if (v91)
  {
    uint64_t v230 = *(void *)(v0 + 1272);
    uint64_t v95 = swift_slowAlloc();
    uint64_t v234 = swift_slowAlloc();
    *(_DWORD *)uint64_t v95 = 136315394;
    *(void *)(v0 + 744) = sub_10002EB08(0xD00000000000001FLL, 0x8000000100031A70, &v234);
    sub_100030830();
    *(_WORD *)(v95 + 12) = 2080;
    *(void *)(v0 + 776) = sub_10002EB08(0x286D726F66726570, 0xE900000000000029, &v234);
    sub_100030830();
    _os_log_impl((void *)&_mh_execute_header, v89, v90, "%s.%s External intelligence sign in is restricted -- signing out.", (uint8_t *)v95, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(uint64_t, uint64_t))(v93 + 8))(v92, v230);
  }
  else
  {

    (*(void (**)(uint64_t, uint64_t))(v93 + 8))(v92, v94);
  }
  sub_100030660();
  uint64_t v185 = (void *)swift_task_alloc();
  *(void *)(v0 + 1704) = v185;
  *uint64_t v185 = v0;
  v185[1] = sub_10001B3D4;
  return OpenAIAuthenticator.signOut()();
}

uint64_t sub_10001B3D4()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 1712) = v0;
  swift_task_dealloc();
  (*(void (**)(void, void))(v2 + 1688))(*(void *)(v2 + 1368), *(void *)(v2 + 1352));
  uint64_t v3 = *(void *)(v2 + 1568);
  uint64_t v4 = *(void *)(v2 + 1560);
  if (v0) {
    uint64_t v5 = sub_10001F190;
  }
  else {
    uint64_t v5 = sub_10001B564;
  }
  return ((uint64_t (*)(uint64_t (*)(), uint64_t, uint64_t))_swift_task_switch)(v5, v4, v3);
}

uint64_t sub_10001B564()
{
  uint64_t v1 = *(void (**)(void, void, void))(*(void *)(v0 + 1240) + 104);
  v1(*(void *)(v0 + 1264), enum case for GenerativeAssistantUseCase.knowledgeFallback(_:), *(void *)(v0 + 1232));
  sub_10002FC20();
  if (*(unsigned char *)(v0 + 1956))
  {
    sub_100030600();
    int v10 = sub_100030620();
    os_log_type_t v11 = sub_1000307F0();
    BOOL v12 = os_log_type_enabled(v10, v11);
    uint64_t v13 = *(void *)(v0 + 1280);
    uint64_t v134 = *(void *)(v0 + 1272);
    uint64_t v139 = *(void *)(v0 + 1328);
    uint64_t v14 = *(void *)(v0 + 1264);
    uint64_t v15 = *(void *)(v0 + 1240);
    uint64_t v142 = *(void *)(v0 + 1232);
    if (v12)
    {
      uint64_t v131 = *(void *)(v0 + 1264);
      uint64_t v16 = swift_slowAlloc();
      uint64_t v149 = swift_slowAlloc();
      *(_DWORD *)uint64_t v16 = 136315394;
      *(void *)(v0 + 800) = sub_10002EB08(0xD00000000000001FLL, 0x8000000100031A70, &v149);
      sub_100030830();
      *(_WORD *)(v16 + 12) = 2080;
      *(void *)(v0 + 808) = sub_10002EB08(0x286D726F66726570, 0xE900000000000029, &v149);
      sub_100030830();
      _os_log_impl((void *)&_mh_execute_header, v10, v11, "%s.%s This is an explicit knowledge request -- using .knowledge use case ", (uint8_t *)v16, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      uint64_t v9 = *(void (**)(uint64_t, uint64_t))(v13 + 8);
      v9(v139, v134);
      (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v131, v142);
    }
    else
    {

      uint64_t v9 = *(void (**)(uint64_t, uint64_t))(v13 + 8);
      v9(v139, v134);
      (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v14, v142);
    }
    v1(*(void *)(v0 + 1264), enum case for GenerativeAssistantUseCase.knowledge(_:), *(void *)(v0 + 1232));
  }
  else
  {
    sub_100030600();
    uint64_t v2 = sub_100030620();
    os_log_type_t v3 = sub_1000307F0();
    BOOL v4 = os_log_type_enabled(v2, v3);
    uint64_t v5 = *(void *)(v0 + 1320);
    uint64_t v6 = *(void *)(v0 + 1280);
    uint64_t v7 = *(void *)(v0 + 1272);
    if (v4)
    {
      uint64_t v8 = swift_slowAlloc();
      uint64_t v149 = swift_slowAlloc();
      *(_DWORD *)uint64_t v8 = 136315394;
      *(void *)(v0 + 784) = sub_10002EB08(0xD00000000000001FLL, 0x8000000100031A70, &v149);
      sub_100030830();
      *(_WORD *)(v8 + 12) = 2080;
      *(void *)(v0 + 792) = sub_10002EB08(0x286D726F66726570, 0xE900000000000029, &v149);
      sub_100030830();
      _os_log_impl((void *)&_mh_execute_header, v2, v3, "%s.%s This is NOT an explicit knowledge request -- hence using .knowledgeFallback use case", (uint8_t *)v8, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      uint64_t v9 = *(void (**)(uint64_t, uint64_t))(v6 + 8);
      v9(v5, v7);
    }
    else
    {

      uint64_t v9 = *(void (**)(uint64_t, uint64_t))(v6 + 8);
      v9(v5, v7);
    }
  }
  sub_100010150((void *)(*(void *)(v0 + 824) + 40), *(void *)(*(void *)(v0 + 824) + 64));
  if ((sub_100030110() & 1) == 0)
  {
    swift_release();
    sub_100030600();
    uint64_t v23 = sub_100030620();
    os_log_type_t v24 = sub_1000307F0();
    BOOL v25 = os_log_type_enabled(v23, v24);
    uint64_t v26 = *(void *)(v0 + 1304);
    uint64_t v27 = *(void *)(v0 + 1272);
    if (v25)
    {
      uint64_t v28 = swift_slowAlloc();
      uint64_t v149 = swift_slowAlloc();
      *(_DWORD *)uint64_t v28 = 136315394;
      *(void *)(v0 + 736) = sub_10002EB08(0xD00000000000001FLL, 0x8000000100031A70, &v149);
      sub_100030830();
      *(_WORD *)(v28 + 12) = 2080;
      *(void *)(v0 + 728) = sub_10002EB08(0x286D726F66726570, 0xE900000000000029, &v149);
      sub_100030830();
      _os_log_impl((void *)&_mh_execute_header, v23, v24, "%s.%s request is not available", (uint8_t *)v28, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    v9(v26, v27);
    uint64_t v143 = *(void *)(v0 + 1536);
    uint64_t v145 = *(void *)(v0 + 1528);
    uint64_t v147 = *(void *)(v0 + 1544);
    uint64_t v46 = *(void *)(v0 + 1400);
    uint64_t v47 = *(void *)(v0 + 1392);
    uint64_t v128 = *(void *)(v0 + 1264);
    uint64_t v48 = *(void *)(v0 + 1240);
    uint64_t v123 = *(void *)(v0 + 1424);
    uint64_t v125 = *(void *)(v0 + 1232);
    uint64_t v49 = *(void *)(v0 + 1160);
    uint64_t v50 = *(void *)(v0 + 1144);
    uint64_t v51 = *(void *)(v0 + 1120);
    uint64_t v121 = *(void *)(v0 + 1136);
    uint64_t v136 = *(void *)(v0 + 1096);
    uint64_t v52 = *(void *)(v0 + 896);
    uint64_t v53 = *(void *)(v0 + 888);
    uint64_t v54 = *(void *)(v0 + 880);
    sub_100010194(v123, v51);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v46 + 56))(v51, 0, 1, v47);
    sub_100030470();
    (*(void (**)(uint64_t, void, uint64_t))(v53 + 104))(v52, enum case for CatId.disabledResponse(_:), v54);
    sub_100030450();
    (*(void (**)(uint64_t, uint64_t))(v53 + 8))(v52, v54);
    sub_1000101F8();
    sub_10002FB70();
    (*(void (**)(uint64_t, uint64_t))(v50 + 8))(v49, v121);
    sub_100010A0C(v51, &qword_10003C478);
    (*(void (**)(uint64_t, uint64_t))(v48 + 8))(v128, v125);
    sub_10001029C(v123);
    sub_1000301F0();
    sub_100030250();
    uint64_t v55 = sub_1000305B0();
    uint64_t v56 = v136;
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v55 - 8) + 56))(v136, 1, 1, v55);
    goto LABEL_29;
  }
  sub_100030600();
  uint64_t v17 = sub_100030620();
  os_log_type_t v18 = sub_1000307F0();
  BOOL v19 = os_log_type_enabled(v17, v18);
  uint64_t v20 = *(void *)(v0 + 1312);
  uint64_t v21 = *(void *)(v0 + 1272);
  if (v19)
  {
    uint64_t v22 = swift_slowAlloc();
    uint64_t v149 = swift_slowAlloc();
    *(_DWORD *)uint64_t v22 = 136315394;
    *(void *)(v0 + 768) = sub_10002EB08(0xD00000000000001FLL, 0x8000000100031A70, &v149);
    sub_100030830();
    *(_WORD *)(v22 + 12) = 2080;
    *(void *)(v0 + 720) = sub_10002EB08(0x286D726F66726570, 0xE900000000000029, &v149);
    sub_100030830();
    _os_log_impl((void *)&_mh_execute_header, v17, v18, "%s.%s Use case is available", (uint8_t *)v22, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  v9(v20, v21);
  sub_100020A00();
  uint64_t v29 = (void *)sub_10002FED0();
  uint64_t v30 = sub_100030310();
  float v39 = v38 * 100.0;
  if ((~LODWORD(v39) & 0x7F800000) == 0)
  {
    __break(1u);
    goto LABEL_33;
  }
  if (v39 <= -9.2234e18)
  {
LABEL_33:
    __break(1u);
    goto LABEL_34;
  }
  if (v39 >= 9.2234e18)
  {
LABEL_34:
    __break(1u);
    return GenerateTextController.generateRichContent(userQuery:useCaseID:invocationContext:requestValueCallback:requestConfirmationCallback:progressReportingCallback:responseGenerationKeepAliveCallback:showJITEnablementCallback:)(v30, v31, v32, v33, v34, v35, v36, v37);
  }
  uint64_t v140 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v0 + 1632);
  uint64_t v135 = *(void *)(v0 + 1616);
  uint64_t v40 = *(void (**)(uint64_t, uint64_t))(v0 + 1600);
  uint64_t v41 = *(void *)(v0 + 1512);
  uint64_t v42 = *(void *)(v0 + 1488);
  uint64_t v43 = *(void *)(v0 + 1456);
  [v29 setTotalUnitCount:(uint64_t)v39];

  sub_10002FC20();
  sub_10002FAB0();
  sub_10002FE10();
  v40(v42, v43);
  if (v140(v41, 1, v135) == 1)
  {
    uint64_t v44 = *(void *)(v0 + 1200);
    sub_100010A0C(*(void *)(v0 + 1512), &qword_10003C4A0);
    uint64_t v45 = sub_10002FDC0();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v45 - 8) + 56))(v44, 1, 1, v45);
  }
  else
  {
    uint64_t v57 = *(void *)(v0 + 1624);
    uint64_t v58 = *(void *)(v0 + 1616);
    uint64_t v59 = *(void *)(v0 + 1512);
    sub_10002FDD0();
    (*(void (**)(uint64_t, uint64_t))(v57 + 8))(v59, v58);
  }
  uint64_t v144 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v0 + 1632);
  uint64_t v60 = *(void (**)(uint64_t, uint64_t))(v0 + 1600);
  uint64_t v137 = *(void *)(v0 + 1504);
  uint64_t v141 = *(void *)(v0 + 1616);
  uint64_t v61 = *(void *)(v0 + 1480);
  uint64_t v62 = *(void *)(v0 + 1472);
  uint64_t v63 = *(void *)(v0 + 1456);
  uint64_t v129 = *(void *)(v0 + 1256);
  uint64_t v132 = *(void *)(v0 + 1264);
  uint64_t v64 = *(void *)(v0 + 1240);
  uint64_t v126 = *(void *)(v0 + 1232);
  uint64_t v65 = *(void *)(v0 + 1200);
  uint64_t v66 = *(void *)(v0 + 1184);
  sub_100030810();
  sub_100010A0C(v65, &qword_10003C490);
  sub_10002FAB0();
  sub_10002FE20();
  v60(v61, v63);
  sub_100030820();
  sub_100010A0C(v66, &qword_10003C488);
  uint64_t v67 = *(void (**)(uint64_t, uint64_t, uint64_t))(v64 + 16);
  v67(v129, v132, v126);
  sub_10002FAB0();
  sub_10002FE10();
  v60(v62, v63);
  if (v144(v137, 1, v141) == 1)
  {
    sub_100010A0C(*(void *)(v0 + 1504), &qword_10003C4A0);
  }
  else
  {
    uint64_t v68 = *(void *)(v0 + 1624);
    uint64_t v69 = *(void *)(v0 + 1616);
    uint64_t v70 = *(void *)(v0 + 1504);
    sub_10002FDF0();
    (*(void (**)(uint64_t, uint64_t))(v68 + 8))(v70, v69);
  }
  uint64_t v71 = *(void *)(v0 + 1128);
  sub_100030480();
  sub_100030560();
  sub_100030550();
  sub_100030540();
  swift_release();
  uint64_t v72 = sub_1000058C0(&qword_10003C4E0);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v72 - 8) + 48))(v71, 1, v72) == 1)
  {
    uint64_t v73 = *(void *)(v0 + 1248);
    uint64_t v138 = *(void *)(v0 + 1264);
    uint64_t v74 = *(void *)(v0 + 1232);
    uint64_t v75 = *(void *)(v0 + 824);
    sub_100010A0C(*(void *)(v0 + 1128), &qword_10003C480);
    sub_1000304D0();
    sub_100020A54(v75, v0 + 432);
    uint64_t v76 = swift_allocObject();
    *(void *)(v0 + 1720) = v76;
    long long v77 = *(_OWORD *)(v0 + 512);
    *(_OWORD *)(v76 + 80) = *(_OWORD *)(v0 + 496);
    *(_OWORD *)(v76 + 96) = v77;
    *(void *)(v76 + 112) = *(void *)(v0 + 528);
    long long v78 = *(_OWORD *)(v0 + 448);
    *(_OWORD *)(v76 + 16) = *(_OWORD *)(v0 + 432);
    *(_OWORD *)(v76 + 32) = v78;
    long long v79 = *(_OWORD *)(v0 + 480);
    *(_OWORD *)(v76 + 48) = *(_OWORD *)(v0 + 464);
    *(_OWORD *)(v76 + 64) = v79;
    sub_100020A54(v75, v0 + 328);
    uint64_t v80 = swift_allocObject();
    *(void *)(v0 + 1728) = v80;
    long long v81 = *(_OWORD *)(v0 + 408);
    *(_OWORD *)(v80 + 80) = *(_OWORD *)(v0 + 392);
    *(_OWORD *)(v80 + 96) = v81;
    *(void *)(v80 + 112) = *(void *)(v0 + 424);
    long long v82 = *(_OWORD *)(v0 + 344);
    *(_OWORD *)(v80 + 16) = *(_OWORD *)(v0 + 328);
    *(_OWORD *)(v80 + 32) = v82;
    long long v83 = *(_OWORD *)(v0 + 376);
    *(_OWORD *)(v80 + 48) = *(_OWORD *)(v0 + 360);
    *(_OWORD *)(v80 + 64) = v83;
    sub_10002FC20();
    uint64_t v146 = *(void *)(v0 + 632);
    uint64_t v84 = *(void *)(v0 + 640);
    *(void *)(v0 + 1736) = v84;
    v67(v73, v138, v74);
    sub_100020A54(v75, v0 + 224);
    uint64_t v85 = swift_allocObject();
    *(void *)(v0 + 1744) = v85;
    long long v86 = *(_OWORD *)(v0 + 304);
    *(_OWORD *)(v85 + 80) = *(_OWORD *)(v0 + 288);
    *(_OWORD *)(v85 + 96) = v86;
    *(void *)(v85 + 112) = *(void *)(v0 + 320);
    long long v87 = *(_OWORD *)(v0 + 240);
    *(_OWORD *)(v85 + 16) = *(_OWORD *)(v0 + 224);
    *(_OWORD *)(v85 + 32) = v87;
    long long v88 = *(_OWORD *)(v0 + 272);
    *(_OWORD *)(v85 + 48) = *(_OWORD *)(v0 + 256);
    *(_OWORD *)(v85 + 64) = v88;
    sub_100020A54(v75, v0 + 120);
    uint64_t v89 = swift_allocObject();
    *(void *)(v0 + 1752) = v89;
    long long v90 = *(_OWORD *)(v0 + 168);
    long long v91 = *(_OWORD *)(v0 + 200);
    *(_OWORD *)(v89 + 80) = *(_OWORD *)(v0 + 184);
    *(_OWORD *)(v89 + 96) = v91;
    *(void *)(v89 + 112) = *(void *)(v0 + 216);
    long long v92 = *(_OWORD *)(v0 + 136);
    *(_OWORD *)(v89 + 16) = *(_OWORD *)(v0 + 120);
    *(_OWORD *)(v89 + 32) = v92;
    *(_OWORD *)(v89 + 48) = *(_OWORD *)(v0 + 152);
    *(_OWORD *)(v89 + 64) = v90;
    sub_100020A54(v75, v0 + 16);
    uint64_t v93 = swift_allocObject();
    *(void *)(v0 + 1760) = v93;
    long long v94 = *(_OWORD *)(v0 + 96);
    *(_OWORD *)(v93 + 80) = *(_OWORD *)(v0 + 80);
    *(_OWORD *)(v93 + 96) = v94;
    *(void *)(v93 + 112) = *(void *)(v0 + 112);
    long long v95 = *(_OWORD *)(v0 + 32);
    *(_OWORD *)(v93 + 16) = *(_OWORD *)(v0 + 16);
    *(_OWORD *)(v93 + 32) = v95;
    long long v96 = *(_OWORD *)(v0 + 64);
    *(_OWORD *)(v93 + 48) = *(_OWORD *)(v0 + 48);
    *(_OWORD *)(v93 + 64) = v96;
    swift_retain();
    os_log_type_t v97 = (void *)swift_task_alloc();
    *(void *)(v0 + 1768) = v97;
    *os_log_type_t v97 = v0;
    v97[1] = sub_10001CBCC;
    uint64_t v33 = *(void *)(v0 + 1248);
    uint64_t v34 = *(void *)(v0 + 1224);
    uint64_t v30 = *(void *)(v0 + 1064);
    uint64_t v35 = &unk_10003C998;
    uint64_t v37 = &unk_10003C978;
    uint64_t v31 = v146;
    uint64_t v32 = v84;
    uint64_t v36 = v85;
    return GenerateTextController.generateRichContent(userQuery:useCaseID:invocationContext:requestValueCallback:requestConfirmationCallback:progressReportingCallback:responseGenerationKeepAliveCallback:showJITEnablementCallback:)(v30, v31, v32, v33, v34, v35, v36, v37);
  }
  uint64_t v143 = *(void *)(v0 + 1536);
  uint64_t v145 = *(void *)(v0 + 1528);
  uint64_t v147 = *(void *)(v0 + 1544);
  uint64_t v98 = *(void *)(v0 + 1416);
  uint64_t v117 = *(void *)(v0 + 1400);
  uint64_t v99 = *(int **)(v0 + 1392);
  uint64_t v127 = *(void *)(v0 + 1264);
  uint64_t v130 = *(void *)(v0 + 1424);
  uint64_t v122 = *(void *)(v0 + 1240);
  uint64_t v124 = *(void *)(v0 + 1232);
  uint64_t v118 = *(void *)(v0 + 1216);
  uint64_t v119 = *(void *)(v0 + 1208);
  uint64_t v120 = *(void *)(v0 + 1224);
  uint64_t v100 = *(void *)(v0 + 1168);
  uint64_t v116 = v100;
  uint64_t v101 = *(void *)(v0 + 1144);
  uint64_t v102 = *(void *)(v0 + 1136);
  os_log_type_t v103 = *(char **)(v0 + 1128);
  uint64_t v104 = *(void *)(v0 + 1120);
  uint64_t v133 = *(void *)(v0 + 1096);
  swift_release();
  uint64_t v114 = *((void *)v103 + 1);
  uint64_t v115 = *(void *)v103;
  uint64_t v105 = v100;
  uint64_t v106 = v102;
  (*(void (**)(uint64_t, char *, uint64_t))(v101 + 32))(v105, &v103[*(int *)(v72 + 48)], v102);
  sub_10002FFD0();
  uint64_t v107 = v99[5];
  sub_10002FF50();
  *(void *)(v98 + v107) = sub_10002FBD0();
  uint64_t v108 = v99[6];
  sub_10002FF50();
  *(void *)(v98 + v108) = sub_10002FBD0();
  uint64_t v109 = v99[7];
  sub_10002FF50();
  *(void *)(v98 + v109) = sub_10002FBF0();
  uint64_t v110 = v99[8];
  sub_10002FF50();
  *(void *)(v98 + v110) = sub_10002FBF0();
  *(void *)(v0 + 616) = v115;
  *(void *)(v0 + 624) = v114;
  sub_10002FBB0();
  sub_100010194(v98, v104);
  (*(void (**)(uint64_t, void, uint64_t, int *))(v117 + 56))(v104, 0, 1, v99);
  sub_1000101F8();
  sub_10002FB70();
  sub_100010A0C(v104, &qword_10003C478);
  sub_10001029C(v98);
  (*(void (**)(uint64_t, uint64_t))(v101 + 8))(v116, v106);
  (*(void (**)(uint64_t, uint64_t))(v118 + 8))(v120, v119);
  (*(void (**)(uint64_t, uint64_t))(v122 + 8))(v127, v124);
  sub_10001029C(v130);
  sub_1000301F0();
  sub_100030250();
  uint64_t v111 = sub_1000305B0();
  uint64_t v56 = v133;
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v111 - 8) + 56))(v133, 1, 1, v111);
LABEL_29:
  sub_1000301C0();
  swift_release();
  sub_100010A0C(v56, &qword_10003C470);
  sub_1000301F0();
  sub_1000301E0();
  swift_release();
  sub_100030280();
  sub_100030260();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v143 + 8))(v147, v145);
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
  uint64_t v112 = *(uint64_t (**)(void))(v0 + 8);
  return v112();
}

uint64_t sub_10001CBCC()
{
  uint64_t v2 = *(void **)v1;
  *(void *)(*(void *)v1 + 1776) = v0;
  swift_task_dealloc();
  uint64_t v3 = v2[156];
  if (v0)
  {
    uint64_t v4 = v2[154];
    uint64_t v5 = *(void (**)(uint64_t, uint64_t))(v2[155] + 8);
    v2[242] = v5;
    v5(v3, v4);
    swift_bridgeObjectRelease();
    swift_release();
    swift_release();
    swift_release();
    uint64_t v6 = v2[196];
    uint64_t v7 = v2[195];
    uint64_t v8 = sub_10001F610;
  }
  else
  {
    uint64_t v9 = v2[155];
    uint64_t v10 = v2[154];
    os_log_type_t v11 = *(void (**)(uint64_t, uint64_t))(v9 + 8);
    v2[223] = v11;
    v2[224] = (v9 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
    v11(v3, v10);
    swift_release();
    swift_bridgeObjectRelease();
    swift_release();
    swift_release();
    swift_release();
    uint64_t v6 = v2[196];
    uint64_t v7 = v2[195];
    uint64_t v8 = sub_10001CDB0;
  }
  return ((uint64_t (*)(uint64_t (*)(), uint64_t, uint64_t))_swift_task_switch)(v8, v7, v6);
}

uint64_t sub_10001CDB0()
{
  uint64_t v1 = *(void *)(v0 + 824);
  uint64_t v2 = sub_100030350();
  uint64_t v3 = swift_task_alloc();
  *(void *)(v3 + 16) = v1;
  sub_1000218DC((void (*)(_OWORD *__return_ptr, void *))sub_100010870, v3, v2, v0 + 712);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  if (sub_100030590()) {
    sub_1000304C0();
  }
  else {
    sub_100030340();
  }
  *(void *)(v0 + 1800) = sub_1000303B0();
  swift_bridgeObjectRelease();
  uint64_t v4 = sub_1000303E0();
  *(void *)(v0 + 1808) = v4;
  uint64_t v5 = *(void *)(v4 + 16);
  *(void *)(v0 + 1816) = v5;
  if (v5)
  {
    uint64_t v6 = *(void *)(v0 + 1032);
    uint64_t v7 = *(void (**)(void, unint64_t, void))(v6 + 16);
    v6 += 16;
    int v8 = *(_DWORD *)(v6 + 64);
    *(_DWORD *)(v0 + 1952) = v8;
    *(void *)(v0 + 1824) = *(void *)(v6 + 56);
    *(void *)(v0 + 1832) = v7;
    *(void *)(v0 + 1848) = &_swiftEmptyArrayStorage;
    *(void *)(v0 + 1840) = 0;
    v7(*(void *)(v0 + 1040), v4 + ((v8 + 32) & ~(unint64_t)v8), *(void *)(v0 + 1024));
    uint64_t v9 = (void *)swift_task_alloc();
    *(void *)(v0 + 1856) = v9;
    *uint64_t v9 = v0;
    v9[1] = sub_10001D2C0;
    uint64_t v10 = *(void *)(v0 + 1016);
    return sub_100004DF0(v10);
  }
  else
  {
    swift_bridgeObjectRelease();
    *(void *)(v0 + 1864) = &_swiftEmptyArrayStorage;
    if (sub_1000303A0())
    {
      BOOL v12 = (void *)swift_task_alloc();
      *(void *)(v0 + 1872) = v12;
      *BOOL v12 = v0;
      v12[1] = sub_10001D96C;
      uint64_t v13 = *(void *)(v0 + 984);
      return static ModelDisclaimer.rateLimitDisclaimer()(v13);
    }
    else
    {
      uint64_t v14 = *(void *)(v0 + 984);
      uint64_t v15 = sub_1000300B0();
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v14, 1, 1, v15);
      uint64_t v16 = *(void *)(v0 + 976);
      uint64_t v17 = *(void *)(v0 + 952);
      uint64_t v18 = *(void *)(v0 + 944);
      uint64_t v19 = *(void *)(v0 + 936);
      uint64_t v20 = *(void *)(v0 + 928);
      uint64_t v21 = *(void *)(v0 + 840);
      uint64_t v22 = *(void *)(v0 + 832);
      uint64_t v23 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v21 + 56);
      *(void *)(v0 + 1880) = v23;
      *(void *)(v0 + 1888) = (v21 + 56) & 0xFFFFFFFFFFFFLL | 0xA0D1000000000000;
      v23(v16, 1, 1, v22);
      sub_100030420();
      (*(void (**)(uint64_t, void, uint64_t))(v19 + 104))(v18, enum case for GeneratedResponse.Outcome.success(_:), v20);
      LOBYTE(v14) = sub_100030400();
      os_log_type_t v24 = *(void (**)(uint64_t, uint64_t))(v19 + 8);
      v24(v18, v20);
      v24(v17, v20);
      if (v14)
      {
        type metadata accessor for SnippetPluginUtils();
        swift_bridgeObjectRetain();
        uint64_t v25 = sub_100030380();
        uint64_t v27 = v26;
        *(void *)(v0 + 1896) = v26;
        uint64_t v28 = sub_100030370();
        uint64_t v30 = v29;
        *(void *)(v0 + 1904) = v29;
        sub_100030330();
        *(void *)(v0 + 1912) = sub_100030390();
        uint64_t v31 = (void *)swift_task_alloc();
        *(void *)(v0 + 1920) = v31;
        *uint64_t v31 = v0;
        v31[1] = sub_10001DD44;
        uint64_t v32 = *(void *)(v0 + 1864);
        uint64_t v33 = *(void *)(v0 + 1800);
        uint64_t v34 = *(void *)(v0 + 968);
        uint64_t v35 = *(void *)(v0 + 920);
        return sub_100004780(v34, v32, v25, v27, v28, v30, v33, v35);
      }
      else
      {
        swift_bridgeObjectRelease();
        *(void *)(v0 + 696) = sub_1000303C0();
        *(void *)(v0 + 704) = v36;
        sub_10002FBB0();
        *(void *)(v0 + 584) = sub_100030430();
        *(void *)(v0 + 592) = v37;
        sub_10002FBB0();
        float v38 = (void *)swift_task_alloc();
        *(void *)(v0 + 1928) = v38;
        *float v38 = v0;
        v38[1] = sub_10001E070;
        uint64_t v39 = *(void *)(v0 + 1864);
        return sub_100010B08(v39);
      }
    }
  }
}

uint64_t sub_10001D2C0()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  uint64_t v2 = *(void *)(v1 + 1568);
  uint64_t v3 = *(void *)(v1 + 1560);
  return ((uint64_t (*)(uint64_t (*)(), uint64_t, uint64_t))_swift_task_switch)(sub_10001D3E0, v3, v2);
}

uint64_t sub_10001D3E0()
{
  (*(void (**)(void, void, void))(*(void *)(v0 + 1000) + 16))(*(void *)(v0 + 1008), *(void *)(v0 + 1016), *(void *)(v0 + 992));
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  unint64_t v2 = *(void *)(v0 + 1848);
  if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
    unint64_t v2 = sub_10002C958(0, *(void *)(v2 + 16) + 1, 1, *(void *)(v0 + 1848));
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    unint64_t v2 = sub_10002C958(v3 > 1, v4 + 1, 1, v2);
  }
  uint64_t v44 = *(void *)(v0 + 1040);
  uint64_t v45 = *(void *)(v0 + 1816);
  uint64_t v5 = *(void *)(v0 + 1032);
  uint64_t v6 = *(void *)(v0 + 1024);
  uint64_t v7 = *(void *)(v0 + 1016);
  uint64_t v8 = *(void *)(v0 + 1008);
  uint64_t v9 = *(void *)(v0 + 1000);
  uint64_t v10 = *(void *)(v0 + 992);
  uint64_t v11 = *(void *)(v0 + 1840) + 1;
  *(void *)(v2 + 16) = v4 + 1;
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v9 + 32))(v2+ ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80))+ *(void *)(v9 + 72) * v4, v8, v10);
  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v7, v10);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v44, v6);
  if (v11 == v45)
  {
    swift_bridgeObjectRelease();
    *(void *)(v0 + 1864) = v2;
    if (sub_1000303A0())
    {
      BOOL v12 = (void *)swift_task_alloc();
      *(void *)(v0 + 1872) = v12;
      *BOOL v12 = v0;
      v12[1] = sub_10001D96C;
      uint64_t v13 = *(void *)(v0 + 984);
      return static ModelDisclaimer.rateLimitDisclaimer()(v13);
    }
    else
    {
      uint64_t v17 = *(void *)(v0 + 984);
      uint64_t v18 = sub_1000300B0();
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v17, 1, 1, v18);
      uint64_t v19 = *(void *)(v0 + 976);
      uint64_t v20 = *(void *)(v0 + 952);
      uint64_t v21 = *(void *)(v0 + 944);
      uint64_t v22 = *(void *)(v0 + 936);
      uint64_t v23 = *(void *)(v0 + 928);
      uint64_t v24 = *(void *)(v0 + 840);
      uint64_t v25 = *(void *)(v0 + 832);
      uint64_t v26 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v24 + 56);
      *(void *)(v0 + 1880) = v26;
      *(void *)(v0 + 1888) = (v24 + 56) & 0xFFFFFFFFFFFFLL | 0xA0D1000000000000;
      v26(v19, 1, 1, v25);
      sub_100030420();
      (*(void (**)(uint64_t, void, uint64_t))(v22 + 104))(v21, enum case for GeneratedResponse.Outcome.success(_:), v23);
      LOBYTE(v17) = sub_100030400();
      uint64_t v27 = *(void (**)(uint64_t, uint64_t))(v22 + 8);
      v27(v21, v23);
      v27(v20, v23);
      if (v17)
      {
        type metadata accessor for SnippetPluginUtils();
        swift_bridgeObjectRetain();
        uint64_t v28 = sub_100030380();
        uint64_t v30 = v29;
        *(void *)(v0 + 1896) = v29;
        uint64_t v31 = sub_100030370();
        uint64_t v33 = v32;
        *(void *)(v0 + 1904) = v32;
        sub_100030330();
        *(void *)(v0 + 1912) = sub_100030390();
        uint64_t v34 = (void *)swift_task_alloc();
        *(void *)(v0 + 1920) = v34;
        void *v34 = v0;
        v34[1] = sub_10001DD44;
        uint64_t v35 = *(void *)(v0 + 1864);
        uint64_t v36 = *(void *)(v0 + 1800);
        uint64_t v37 = *(void *)(v0 + 968);
        uint64_t v38 = *(void *)(v0 + 920);
        return sub_100004780(v37, v35, v28, v30, v31, v33, v36, v38);
      }
      else
      {
        swift_bridgeObjectRelease();
        *(void *)(v0 + 696) = sub_1000303C0();
        *(void *)(v0 + 704) = v39;
        sub_10002FBB0();
        *(void *)(v0 + 584) = sub_100030430();
        *(void *)(v0 + 592) = v40;
        sub_10002FBB0();
        uint64_t v41 = (void *)swift_task_alloc();
        *(void *)(v0 + 1928) = v41;
        void *v41 = v0;
        v41[1] = sub_10001E070;
        uint64_t v42 = *(void *)(v0 + 1864);
        return sub_100010B08(v42);
      }
    }
  }
  else
  {
    uint64_t v14 = *(void *)(v0 + 1840) + 1;
    *(void *)(v0 + 1848) = v2;
    *(void *)(v0 + 1840) = v14;
    (*(void (**)(void, unint64_t, void))(v0 + 1832))(*(void *)(v0 + 1040), *(void *)(v0 + 1808)+ ((*(unsigned __int8 *)(v0 + 1952) + 32) & ~(unint64_t)*(unsigned __int8 *)(v0 + 1952))+ *(void *)(v0 + 1824) * v14, *(void *)(v0 + 1024));
    uint64_t v15 = (void *)swift_task_alloc();
    *(void *)(v0 + 1856) = v15;
    *uint64_t v15 = v0;
    v15[1] = sub_10001D2C0;
    uint64_t v16 = *(void *)(v0 + 1016);
    return sub_100004DF0(v16);
  }
}

uint64_t sub_10001D96C()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  uint64_t v2 = *(void *)(v1 + 1568);
  uint64_t v3 = *(void *)(v1 + 1560);
  return ((uint64_t (*)(uint64_t (*)(), uint64_t, uint64_t))_swift_task_switch)(sub_10001DA8C, v3, v2);
}

uint64_t sub_10001DA8C()
{
  uint64_t v1 = v0[122];
  uint64_t v2 = v0[119];
  uint64_t v3 = v0[118];
  uint64_t v4 = v0[117];
  uint64_t v5 = v0[116];
  uint64_t v6 = v0[105];
  uint64_t v7 = v0[104];
  uint64_t v8 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v6 + 56);
  v0[235] = v8;
  v0[236] = (v6 + 56) & 0xFFFFFFFFFFFFLL | 0xA0D1000000000000;
  v8(v1, 1, 1, v7);
  sub_100030420();
  (*(void (**)(uint64_t, void, uint64_t))(v4 + 104))(v3, enum case for GeneratedResponse.Outcome.success(_:), v5);
  char v9 = sub_100030400();
  uint64_t v10 = *(void (**)(uint64_t, uint64_t))(v4 + 8);
  v10(v3, v5);
  v10(v2, v5);
  if (v9)
  {
    type metadata accessor for SnippetPluginUtils();
    swift_bridgeObjectRetain();
    uint64_t v11 = sub_100030380();
    uint64_t v13 = v12;
    v0[237] = v12;
    uint64_t v14 = sub_100030370();
    uint64_t v16 = v15;
    v0[238] = v15;
    sub_100030330();
    v0[239] = sub_100030390();
    uint64_t v17 = (void *)swift_task_alloc();
    v0[240] = v17;
    *uint64_t v17 = v0;
    v17[1] = sub_10001DD44;
    uint64_t v18 = v0[233];
    uint64_t v19 = v0[225];
    uint64_t v20 = v0[121];
    uint64_t v21 = v0[115];
    return sub_100004780(v20, v18, v11, v13, v14, v16, v19, v21);
  }
  else
  {
    swift_bridgeObjectRelease();
    v0[87] = sub_1000303C0();
    v0[88] = v23;
    sub_10002FBB0();
    v0[73] = sub_100030430();
    v0[74] = v24;
    sub_10002FBB0();
    uint64_t v25 = (void *)swift_task_alloc();
    v0[241] = v25;
    *uint64_t v25 = v0;
    v25[1] = sub_10001E070;
    uint64_t v26 = v0[233];
    return sub_100010B08(v26);
  }
}

uint64_t sub_10001DD44()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void *)(*v0 + 920);
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_100010A0C(v2, &qword_10003C390);
  uint64_t v3 = *(void *)(v1 + 1568);
  uint64_t v4 = *(void *)(v1 + 1560);
  return ((uint64_t (*)(uint64_t (*)(), uint64_t, uint64_t))_swift_task_switch)(sub_10001DF2C, v4, v3);
}

uint64_t sub_10001DF2C()
{
  uint64_t v1 = (void (*)(uint64_t, void, uint64_t, uint64_t))v0[235];
  uint64_t v2 = v0[122];
  uint64_t v3 = v0[121];
  uint64_t v4 = v0[104];
  sub_100010A0C(v2, &qword_10003C468);
  v1(v3, 0, 1, v4);
  sub_100010940(v3, v2);
  v0[87] = sub_1000303C0();
  v0[88] = v5;
  sub_10002FBB0();
  v0[73] = sub_100030430();
  v0[74] = v6;
  sub_10002FBB0();
  uint64_t v7 = (void *)swift_task_alloc();
  v0[241] = v7;
  *uint64_t v7 = v0;
  v7[1] = sub_10001E070;
  uint64_t v8 = v0[233];
  return sub_100010B08(v8);
}

uint64_t sub_10001E070()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  uint64_t v2 = *(void *)(v1 + 1568);
  uint64_t v3 = *(void *)(v1 + 1560);
  return ((uint64_t (*)(uint64_t (*)(), uint64_t, uint64_t))_swift_task_switch)(sub_10001E1B4, v3, v2);
}

uint64_t sub_10001E1B4()
{
  uint64_t v1 = v0[113];
  uint64_t v2 = v0[111];
  uint64_t v3 = v0[110];
  swift_release();
  sub_1000303D0();
  (*(void (**)(uint64_t, void, uint64_t))(v2 + 104))(v1, enum case for CatId.empty(_:), v3);
  sub_100020CE0(&qword_10003C518, (void (*)(uint64_t))&type metadata accessor for CatId);
  sub_100030740();
  sub_100030740();
  uint64_t v4 = v0[114];
  uint64_t v5 = v0[113];
  uint64_t v6 = v0[111];
  uint64_t v7 = v0[110];
  if (v0[71] == v0[69] && v0[72] == v0[70])
  {
    swift_bridgeObjectRelease_n();
    uint64_t v8 = *(void (**)(uint64_t, uint64_t))(v6 + 8);
    v8(v5, v7);
    v8(v4, v7);
  }
  else
  {
    char v9 = sub_1000308B0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v10 = *(void (**)(uint64_t, uint64_t))(v6 + 8);
    v10(v5, v7);
    v10(v4, v7);
    if ((v9 & 1) == 0)
    {
      uint64_t v70 = 0;
      unint64_t v12 = 0xE000000000000000;
      goto LABEL_9;
    }
  }
  uint64_t v11 = (void *)sub_1000303F0();
  if (v11[2] == 1)
  {
    unint64_t v12 = v11[5];
    uint64_t v70 = v11[4];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
LABEL_9:
    uint64_t v31 = v0[120];
    uint64_t v32 = v0[105];
    uint64_t v33 = v0[104];
    sub_100010890(v0[122], v31);
    int v34 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v32 + 48))(v31, 1, v33);
    uint64_t v65 = (void (*)(uint64_t, uint64_t))v0[223];
    uint64_t v35 = v0[175];
    uint64_t v36 = v0[145];
    uint64_t v37 = v0[143];
    uint64_t v38 = v0[140];
    uint64_t v67 = v0[142];
    uint64_t v74 = v0[137];
    uint64_t v69 = v0[122];
    uint64_t v39 = v0[120];
    uint64_t v79 = v0[192];
    uint64_t v80 = v0[193];
    uint64_t v77 = v0[191];
    uint64_t v66 = v0[154];
    uint64_t v63 = v0[151];
    uint64_t v64 = v0[158];
    uint64_t v61 = v0[153];
    uint64_t v62 = v0[131];
    uint64_t v60 = v0[132];
    uint64_t v58 = v0[152];
    uint64_t v59 = v0[133];
    uint64_t v56 = v0[136];
    uint64_t v57 = v0[134];
    uint64_t v55 = v0[123];
    uint64_t v40 = v12;
    if (v34 == 1)
    {
      uint64_t v41 = v0[174];
      uint64_t v42 = v0[178];
      uint64_t v43 = v0[135];
      sub_100010A0C(v39, &qword_10003C468);
      sub_100010194(v42, v38);
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v35 + 56))(v38, 0, 1, v41);
      uint64_t v44 = v42;
      sub_10002FBA0();
      uint64_t v45 = v77;
      sub_10001FB90(v70, v40, v0[67], v0[68], v36);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_1000101F8();
      sub_10002FB70();
      swift_release();
      (*(void (**)(uint64_t, uint64_t))(v37 + 8))(v36, v67);
      sub_100010A0C(v38, &qword_10003C478);
      sub_100010A0C(v69, &qword_10003C468);
      sub_100010A0C(v55, &qword_10003C388);
      (*(void (**)(uint64_t, uint64_t))(v60 + 8))(v59, v62);
      (*(void (**)(uint64_t, uint64_t))(v43 + 8))(v56, v57);
    }
    else
    {
      uint64_t v46 = v0[106];
      uint64_t v47 = v0[105];
      uint64_t v53 = v0[104];
      uint64_t v48 = v0[174];
      uint64_t v49 = v0[178];
      uint64_t v54 = v0[135];
      (*(void (**)(uint64_t, uint64_t))(v47 + 32))(v46, v39);
      sub_100010194(v49, v38);
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v35 + 56))(v38, 0, 1, v48);
      uint64_t v44 = v49;
      sub_10002FBA0();
      sub_10001FB90(v70, v40, v0[75], v0[76], v36);
      swift_bridgeObjectRelease();
      uint64_t v45 = v77;
      swift_bridgeObjectRelease();
      sub_1000101F8();
      sub_10002FB80();
      swift_release();
      (*(void (**)(uint64_t, uint64_t))(v37 + 8))(v36, v67);
      sub_100010A0C(v38, &qword_10003C478);
      (*(void (**)(uint64_t, uint64_t))(v47 + 8))(v46, v53);
      sub_100010A0C(v69, &qword_10003C468);
      sub_100010A0C(v55, &qword_10003C388);
      (*(void (**)(uint64_t, uint64_t))(v60 + 8))(v59, v62);
      (*(void (**)(uint64_t, uint64_t))(v54 + 8))(v56, v57);
    }
    (*(void (**)(uint64_t, uint64_t))(v58 + 8))(v61, v63);
    v65(v64, v66);
    sub_10001029C(v44);
    swift_release();
    sub_1000301F0();
    sub_100030250();
    uint64_t v50 = sub_1000305B0();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v50 - 8) + 56))(v74, 1, 1, v50);
    sub_1000301C0();
    swift_release();
    sub_100010A0C(v74, &qword_10003C470);
    sub_1000301F0();
    sub_1000301E0();
    swift_release();
    sub_100030280();
    sub_100030260();
    swift_release();
    (*(void (**)(uint64_t, uint64_t))(v79 + 8))(v80, v45);
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
    uint64_t v30 = (uint64_t (*)(void))v0[1];
    goto LABEL_13;
  }
  uint64_t v78 = v0[153];
  uint64_t v13 = v0[152];
  uint64_t v75 = v0[136];
  uint64_t v76 = v0[151];
  uint64_t v14 = v0[135];
  uint64_t v72 = v0[133];
  uint64_t v73 = v0[134];
  uint64_t v15 = v0[132];
  uint64_t v68 = v0[123];
  uint64_t v71 = v0[131];
  uint64_t v16 = v0[122];
  uint64_t v17 = (void *)v0[109];
  uint64_t v18 = v0[108];
  uint64_t v19 = v0[107];
  swift_bridgeObjectRelease();
  *uint64_t v17 = 0xD00000000000002ELL;
  v17[1] = 0x8000000100031F90;
  (*(void (**)(void *, void, uint64_t))(v18 + 104))(v17, enum case for GATError.notImplemented(_:), v19);
  sub_100030210();
  (*(void (**)(void *, uint64_t))(v18 + 8))(v17, v19);
  swift_willThrow();
  swift_release();
  sub_100010A0C(v16, &qword_10003C468);
  sub_100010A0C(v68, &qword_10003C388);
  (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v72, v71);
  (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v75, v73);
  (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v78, v76);
  swift_release();
  uint64_t v20 = (void (*)(uint64_t, uint64_t))v0[223];
  uint64_t v21 = v0[158];
  uint64_t v22 = v0[154];
  id v23 = [objc_allocWithZone((Class)SDRDiagnosticReporter) init];
  type metadata accessor for AutoBugCaptureHelper();
  uint64_t v24 = swift_allocObject();
  *(void *)(v24 + 16) = v23;
  *(void *)(v24 + 24) = 0;
  uint64_t v25 = (void *)sub_10002FF30();
  sub_10002E1A4(2, v25);
  swift_release();

  swift_willThrow();
  v20(v21, v22);
  uint64_t v26 = v0[193];
  uint64_t v27 = v0[192];
  uint64_t v52 = v0[191];
  uint64_t v28 = v0[137];
  sub_10001029C(v0[178]);
  sub_1000301F0();
  sub_100030250();
  uint64_t v29 = sub_1000305B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v29 - 8) + 56))(v28, 1, 1, v29);
  sub_1000301C0();
  swift_release();
  sub_100010A0C(v28, &qword_10003C470);
  sub_1000301F0();
  sub_1000301E0();
  swift_release();
  sub_100030280();
  sub_100030260();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v26, v52);
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
  uint64_t v30 = (uint64_t (*)(void))v0[1];
LABEL_13:
  return v30();
}

uint64_t sub_10001F190()
{
  swift_release();
  uint64_t v1 = v0[193];
  uint64_t v2 = v0[192];
  uint64_t v7 = v0[191];
  uint64_t v3 = v0[137];
  sub_10001029C(v0[178]);
  sub_1000301F0();
  sub_100030250();
  uint64_t v4 = sub_1000305B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56))(v3, 1, 1, v4);
  sub_1000301C0();
  swift_release();
  sub_100010A0C(v3, &qword_10003C470);
  sub_1000301F0();
  sub_1000301E0();
  swift_release();
  sub_100030280();
  sub_100030260();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v7);
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
  uint64_t v5 = (uint64_t (*)(void))v0[1];
  return v5();
}

uint64_t sub_10001F610()
{
  uint64_t v1 = v0[153];
  uint64_t v2 = v0[152];
  uint64_t v3 = v0[151];
  uint64_t v4 = v0[136];
  uint64_t v5 = v0[135];
  uint64_t v6 = v0[134];
  swift_release();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_release();
  swift_release();
  uint64_t v7 = (void (*)(uint64_t, uint64_t))v0[242];
  uint64_t v8 = v0[158];
  uint64_t v9 = v0[154];
  id v10 = [objc_allocWithZone((Class)SDRDiagnosticReporter) init];
  type metadata accessor for AutoBugCaptureHelper();
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v10;
  *(void *)(v11 + 24) = 0;
  unint64_t v12 = (void *)sub_10002FF30();
  sub_10002E1A4(2, v12);

  swift_release();
  swift_willThrow();
  v7(v8, v9);
  uint64_t v13 = v0[193];
  uint64_t v14 = v0[192];
  uint64_t v19 = v0[191];
  uint64_t v15 = v0[137];
  sub_10001029C(v0[178]);
  sub_1000301F0();
  sub_100030250();
  uint64_t v16 = sub_1000305B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v15, 1, 1, v16);
  sub_1000301C0();
  swift_release();
  sub_100010A0C(v15, &qword_10003C470);
  sub_1000301F0();
  sub_1000301E0();
  swift_release();
  sub_100030280();
  sub_100030260();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v13, v19);
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
  uint64_t v17 = (uint64_t (*)(void))v0[1];
  return v17();
}

uint64_t sub_10001FB90@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  v24[1] = a3;
  v24[2] = a4;
  v24[4] = a1;
  v24[5] = a2;
  v24[3] = a5;
  uint64_t v5 = sub_100030530();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24[0] = sub_10002FFE0();
  uint64_t v9 = *(void *)(v24[0] - 8);
  __chkstk_darwin(v24[0]);
  uint64_t v11 = (char *)v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_10002FE30();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)v24 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_1000058C0(&qword_10003C4A0);
  __chkstk_darwin(v16 - 8);
  uint64_t v18 = (char *)v24 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100017728();
  sub_10002FAB0();
  sub_10002FE10();
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  uint64_t v19 = sub_10002FE00();
  uint64_t v20 = *(void *)(v19 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v20 + 48))(v18, 1, v19) == 1)
  {
    sub_100010A0C((uint64_t)v18, &qword_10003C4A0);
LABEL_4:
    sub_10002FFD0();
    sub_10002FFC0();
    (*(void (**)(char *, void))(v9 + 8))(v11, v24[0]);
    swift_bridgeObjectRelease();
    goto LABEL_5;
  }
  sub_10002FDE0();
  uint64_t v22 = v21;
  (*(void (**)(char *, uint64_t))(v20 + 8))(v18, v19);
  if (!v22) {
    goto LABEL_4;
  }
LABEL_5:
  sub_100030470();
  (*(void (**)(char *, void, uint64_t))(v6 + 104))(v8, enum case for CatId.generateKnowledgeResponse(_:), v5);
  sub_100030460();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_10001FF24(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  *(void *)(v4 + 24) = a2;
  *(void *)(v4 + 32) = a4;
  *(unsigned char *)(v4 + 80) = a3;
  *(void *)(v4 + 16) = a1;
  sub_1000307B0();
  *(void *)(v4 + 40) = sub_1000307A0();
  uint64_t v6 = sub_100030780();
  *(void *)(v4 + 48) = v6;
  *(void *)(v4 + 56) = v5;
  return ((uint64_t (*)(uint64_t (*)(), uint64_t, uint64_t))_swift_task_switch)(sub_10001FFC4, v6, v5);
}

uint64_t sub_10001FFC4()
{
  uint64_t v1 = *(void **)(v0 + 16);
  uint64_t v3 = v1[3];
  uint64_t v2 = v1[4];
  uint64_t v4 = sub_100010150(v1, v3);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v0 + 64) = v5;
  unint64_t v6 = sub_100017728();
  *uint64_t v5 = v0;
  v5[1] = sub_1000200A0;
  uint64_t v7 = *(unsigned __int8 *)(v0 + 80);
  uint64_t v8 = *(void *)(v0 + 24);
  return AppIntent.requestConfirmation<A>(result:confirmationActionName:showPrompt:)(v4, v8, v7, &type metadata for GenerateKnowledgeResponseIntent, v3, v6, v2);
}

uint64_t sub_1000200A0()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 72) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 56);
  uint64_t v4 = *(void *)(v2 + 48);
  if (v0) {
    uint64_t v5 = sub_100020240;
  }
  else {
    uint64_t v5 = sub_1000201DC;
  }
  return ((uint64_t (*)(uint64_t (*)(), uint64_t, uint64_t))_swift_task_switch)(v5, v4, v3);
}

uint64_t sub_1000201DC()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_100020240()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1000202A4(uint64_t a1)
{
  v1[2] = a1;
  sub_1000307B0();
  v1[3] = sub_1000307A0();
  uint64_t v3 = sub_100030780();
  v1[4] = v3;
  v1[5] = v2;
  return ((uint64_t (*)(uint64_t (*)(), uint64_t, uint64_t))_swift_task_switch)(sub_10002033C, v3, v2);
}

uint64_t sub_10002033C()
{
  sub_100030570();
  NSString v1 = sub_1000306F0();
  swift_bridgeObjectRelease();
  sub_10002FC20();
  id v2 = [self montaraEnablementWithBundleIdentifier:v1 source:1 isExplicitRequest:*(unsigned char *)(v0 + 72) & 1];
  *(void *)(v0 + 48) = v2;

  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 56) = v3;
  unint64_t v4 = sub_100017728();
  *uint64_t v3 = v0;
  v3[1] = sub_10000E928;
  return AppIntent.requestConfirmation(systemStyle:)(v2, &type metadata for GenerateKnowledgeResponseIntent, v4);
}

void sub_10002045C(float a1)
{
  sub_1000302F0();
  if (vabds_f32(a1, v2) < 0.0001 || (sub_100030300(), vabds_f32(a1, v3) < 0.0001))
  {
    sub_100020A00();
    unint64_t v4 = (void *)sub_10002FED0();
    NSString v5 = sub_1000306F0();
    [v4 setLocalizedDescription:v5];
  }
  sub_100020A00();
  uint64_t v6 = (void *)sub_10002FED0();
  float v7 = a1 * 100.0;
  if ((~COERCE_INT(a1 * 100.0) & 0x7F800000) == 0)
  {
    __break(1u);
    goto LABEL_11;
  }
  if (v7 <= -9.2234e18)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  if (v7 >= 9.2234e18)
  {
LABEL_12:
    __break(1u);
    return;
  }
  id v8 = v6;
  [v6 setCompletedUnitCount:(uint64_t)v7];
}

unint64_t sub_1000205DC()
{
  unint64_t result = qword_10003C930;
  if (!qword_10003C930)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003C930);
  }
  return result;
}

unint64_t sub_100020634()
{
  unint64_t result = qword_10003C938;
  if (!qword_10003C938)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003C938);
  }
  return result;
}

uint64_t sub_100020688()
{
  return *(void *)(swift_getOpaqueTypeConformance2() + 8);
}

uint64_t sub_1000206BC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1000206D8@<X0>(uint64_t a1@<X8>)
{
  if (qword_10003C2C0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_10002FF70();
  uint64_t v3 = sub_100010A68(v2, (uint64_t)qword_10003CCB0);
  unint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

uint64_t sub_100020788(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_10000F7C0;
  return sub_1000184E8(a1);
}

uint64_t sub_100020824(uint64_t a1)
{
  unint64_t v2 = sub_1000209AC();

  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

uint64_t sub_100020870(uint64_t a1)
{
  unint64_t v2 = sub_100017728();

  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

ValueMetadata *type metadata accessor for GenerateKnowledgeResponseIntent()
{
  return &type metadata for GenerateKnowledgeResponseIntent;
}

uint64_t sub_1000208BC()
{
  return sub_10001003C(&qword_10003C948, &qword_10003C950);
}

uint64_t sub_1000208F8()
{
  return sub_10001003C(&qword_10003C400, &qword_10003C408);
}

uint64_t sub_100020934()
{
  return sub_10001003C(&qword_10003C410, &qword_10003C408);
}

uint64_t sub_100020970()
{
  return sub_10001003C(&qword_10003C418, &qword_10003C408);
}

unint64_t sub_1000209AC()
{
  unint64_t result = qword_10003C958;
  if (!qword_10003C958)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_10003C958);
  }
  return result;
}

unint64_t sub_100020A00()
{
  unint64_t result = qword_10003C968;
  if (!qword_10003C968)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_10003C968);
  }
  return result;
}

uint64_t sub_100020A54(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_100020A90(uint64_t a1, uint64_t a2, char a3)
{
  id v8 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v8;
  void *v8 = v4;
  v8[1] = sub_10000F7C0;
  return sub_10001FF24(a1, a2, a3, v3 + 16);
}

uint64_t sub_100020B48()
{
  unint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  *unint64_t v2 = v1;
  v2[1] = sub_100010B04;
  return sub_1000202A4(v0 + 16);
}

uint64_t sub_100020BE0(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v6;
  *uint64_t v6 = v3;
  v6[1] = sub_1000106B8;
  return sub_10000EB18(a1, a2, v2 + 16);
}

void sub_100020C90(float a1)
{
}

void sub_100020CB8()
{
  sub_100030300();
  sub_10002045C(v0);
}

uint64_t sub_100020CE0(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100020D28(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_100030630();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v30 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __chkstk_darwin(v6);
  uint64_t v11 = (char *)&v30 - v10;
  __chkstk_darwin(v9);
  uint64_t v13 = (char *)&v30 - v12;
  *(void *)(v2 + 16) = 0;
  sub_1000305C0();
  uint64_t v14 = sub_100030620();
  os_log_type_t v15 = sub_1000307F0();
  if (os_log_type_enabled(v14, v15))
  {
    uint64_t v16 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v16 = 0;
    _os_log_impl((void *)&_mh_execute_header, v14, v15, "Acquiring RBS assertion.", v16, 2u);
    swift_slowDealloc();
  }

  uint64_t v17 = *(void (**)(char *, uint64_t))(v5 + 8);
  v17(v13, v4);
  id v35 = 0;
  if ([a1 acquireWithError:&v35])
  {
    id v18 = v35;
  }
  else
  {
    int v34 = v17;
    id v19 = v35;
    sub_10002FF40();

    swift_willThrow();
    sub_1000305C0();
    swift_errorRetain();
    swift_errorRetain();
    uint64_t v20 = sub_100030620();
    os_log_type_t v21 = sub_100030800();
    if (os_log_type_enabled(v20, v21))
    {
      uint64_t v32 = v4;
      uint64_t v22 = swift_slowAlloc();
      uint64_t v33 = a1;
      id v23 = (uint8_t *)v22;
      uint64_t v30 = (void *)swift_slowAlloc();
      *(_DWORD *)id v23 = 138412290;
      uint64_t v31 = v8;
      swift_errorRetain();
      uint64_t v24 = (void *)_swift_stdlib_bridgeErrorToNSError();
      id v35 = v24;
      uint64_t v8 = v31;
      sub_100030830();
      *uint64_t v30 = v24;
      uint64_t v4 = v32;
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v20, v21, "Failed acquiring RBS assertion: %@", v23, 0xCu);
      sub_1000058C0(&qword_10003C3B8);
      swift_arrayDestroy();
      swift_slowDealloc();
      a1 = v33;
      swift_slowDealloc();

      swift_errorRelease();
    }
    else
    {
      swift_errorRelease();
      swift_errorRelease();
      swift_errorRelease();
    }
    uint64_t v17 = v34;
    v34(v8, v4);
  }
  sub_1000305C0();
  uint64_t v25 = sub_100030620();
  os_log_type_t v26 = sub_1000307E0();
  if (os_log_type_enabled(v25, v26))
  {
    uint64_t v27 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v27 = 0;
    _os_log_impl((void *)&_mh_execute_header, v25, v26, "RBS assertion acquired.", v27, 2u);
    swift_slowDealloc();
  }

  v17(v11, v4);
  uint64_t v28 = *(void **)(v2 + 16);
  *(void *)(v2 + 16) = a1;

  return v2;
}

uint64_t sub_100021148()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_100030630();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *(void **)(v1 + 16);
  if (v6)
  {
    id v7 = v6;
    sub_1000305C0();
    uint64_t v8 = sub_100030620();
    os_log_type_t v9 = sub_1000307E0();
    if (os_log_type_enabled(v8, v9))
    {
      uint64_t v10 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, v9, "Invalidating RBS assertion.", v10, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    [v7 invalidate];

    uint64_t v11 = *(void **)(v1 + 16);
    *(void *)(v1 + 16) = 0;

    uint64_t v6 = *(void **)(v1 + 16);
  }

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for RunningBoardAssertion()
{
  return self;
}

void sub_1000212F4()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_100030630();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *(void **)(v1 + 16);
  if (v6)
  {
    id v7 = v6;
    sub_1000305C0();
    uint64_t v8 = sub_100030620();
    os_log_type_t v9 = sub_1000307E0();
    if (os_log_type_enabled(v8, v9))
    {
      uint64_t v10 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, v9, "Invalidating RBS assertion.", v10, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    [v7 invalidate];

    uint64_t v11 = *(void **)(v1 + 16);
    *(void *)(v1 + 16) = 0;
  }
}

uint64_t sub_100021464(void (*a1)(void))
{
  a1();

  return _swift_stdlib_bridgeErrorToNSError();
}

uint64_t sub_10002149C(uint64_t (*a1)(void))
{
  return a1();
}

void sub_1000214C4(uint64_t *a1, void **a2, uint64_t a3, uint64_t (*a4)(void))
{
  uint64_t v6 = (void *)a4();
  uint64_t v7 = *a1 + 8;
  sub_100030830();
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

uint64_t sub_10002157C()
{
  uint64_t v0 = sub_100030630();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)v20 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000305C0();
  uint64_t v4 = sub_100030620();
  os_log_type_t v5 = sub_1000307F0();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "Creating RBS assertion.", v6, 2u);
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  id v7 = [self currentProcess];
  NSString v8 = sub_1000306F0();
  NSString v9 = sub_1000306F0();
  id v10 = [self attributeWithDomain:v8 name:v9];

  sub_1000058C0(&qword_10003CA68);
  uint64_t v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = xmmword_100031AC0;
  *(void *)(v11 + 32) = v10;
  v20[1] = v11;
  sub_100030760();
  id v12 = objc_allocWithZone((Class)RBSAssertion);
  id v13 = v7;
  id v14 = v10;
  NSString v15 = sub_1000306F0();
  sub_100021840();
  Class isa = sub_100030750().super.isa;
  swift_bridgeObjectRelease();
  id v17 = [v12 initWithExplanation:v15 target:v13 attributes:isa];

  type metadata accessor for RunningBoardAssertion();
  uint64_t v18 = swift_allocObject();
  sub_100020D28(v17);

  return v18;
}

unint64_t sub_100021840()
{
  unint64_t result = qword_10003CA70;
  if (!qword_10003CA70)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10003CA70);
  }
  return result;
}

unint64_t sub_100021888()
{
  unint64_t result = qword_10003CA78;
  if (!qword_10003CA78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003CA78);
  }
  return result;
}

unint64_t *sub_1000218DC(void (*a1)(_OWORD *__return_ptr, void *), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_100021908(a1, a2, a3, a4, (void (*)(BOOL, uint64_t, uint64_t))sub_100005B0C);
}

unint64_t *sub_100021908(void (*a1)(_OWORD *__return_ptr, void *), uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(BOOL, uint64_t, uint64_t))
{
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)(a3 + 16);
  NSString v8 = (unint64_t *)&_swiftEmptyArrayStorage;
  if (v7)
  {
    os_log_type_t v26 = (unint64_t *)&_swiftEmptyArrayStorage;
    a5(0, v7, 0);
    NSString v8 = (unint64_t *)&_swiftEmptyArrayStorage;
    uint64_t v11 = (uint64_t *)(a3 + 40);
    while (1)
    {
      uint64_t v12 = *v11;
      v23[0] = *(v11 - 1);
      v23[1] = v12;
      swift_bridgeObjectRetain();
      a1(v24, v23);
      if (v6) {
        break;
      }
      uint64_t v6 = 0;
      swift_bridgeObjectRelease();
      os_log_type_t v26 = v8;
      unint64_t v14 = v8[2];
      unint64_t v13 = v8[3];
      if (v14 >= v13 >> 1)
      {
        a5(v13 > 1, v14 + 1, 1);
        NSString v8 = v26;
      }
      v11 += 2;
      long long v8[2] = v14 + 1;
      NSString v15 = &v8[13 * v14];
      long long v16 = v24[0];
      long long v17 = v24[2];
      *((_OWORD *)v15 + 3) = v24[1];
      *((_OWORD *)v15 + 4) = v17;
      *((_OWORD *)v15 + 2) = v16;
      long long v18 = v24[3];
      long long v19 = v24[4];
      long long v20 = v24[5];
      v15[16] = v25;
      *((_OWORD *)v15 + 6) = v19;
      *((_OWORD *)v15 + 7) = v20;
      *((_OWORD *)v15 + 5) = v18;
      if (!--v7) {
        return v8;
      }
    }
    swift_release();
    swift_bridgeObjectRelease();
  }
  return v8;
}

uint64_t sub_100021A70@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_1000058C0(&qword_10003C420);
  __chkstk_darwin(v2 - 8);
  uint64_t v54 = (char *)v45 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_10002FEC0();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v68 = v4;
  uint64_t v69 = v5;
  __chkstk_darwin(v4);
  uint64_t v52 = (char *)v45 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1000058C0(&qword_10003C428);
  __chkstk_darwin(v7 - 8);
  uint64_t v51 = (char *)v45 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_1000058C0(&qword_10003C430);
  __chkstk_darwin(v9 - 8);
  uint64_t v50 = (char *)v45 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_1000058C0(&qword_10003C438);
  __chkstk_darwin(v11 - 8);
  uint64_t v49 = (char *)v45 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v66 = sub_10002FF60();
  uint64_t v13 = *(void *)(v66 - 8);
  __chkstk_darwin(v66);
  NSString v15 = (char *)v45 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_100030000();
  __chkstk_darwin(v16 - 8);
  long long v18 = (char *)v45 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_1000306E0();
  __chkstk_darwin(v19 - 8);
  os_log_type_t v21 = (char *)v45 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = sub_10002FF70();
  uint64_t v62 = v22;
  uint64_t v23 = *(void *)(v22 - 8);
  uint64_t v24 = __chkstk_darwin(v22);
  uint64_t v53 = (char *)v45 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v24);
  a1[3] = sub_100030140();
  a1[4] = (uint64_t)&protocol witness table for GenerativeAssistantFeatureFlagManager;
  sub_100010080(a1);
  sub_100030130();
  uint64_t v26 = sub_100030160();
  uint64_t v58 = a1;
  a1[8] = v26;
  a1[9] = (uint64_t)&protocol witness table for GenerativeAssistantRestrictionManager;
  sub_100010080(a1 + 5);
  sub_100030150();
  uint64_t v48 = sub_1000058C0(&qword_10003C440);
  sub_1000306D0();
  sub_10002FFF0();
  unsigned int v64 = enum case for LocalizedStringResource.BundleDescription.main(_:);
  uint64_t v27 = *(void (**)(void))(v13 + 104);
  uint64_t v65 = v13 + 104;
  uint64_t v67 = (void (*)(char *, void, uint64_t))v27;
  uint64_t v57 = v15;
  v27(v15);
  sub_10002FF80();
  uint64_t v28 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v23 + 56);
  uint64_t v61 = v23 + 56;
  uint64_t v63 = v28;
  uint64_t v29 = v49;
  v28(v49, 1, 1, v22);
  LOBYTE(v70) = 2;
  uint64_t v30 = sub_100030770();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v30 - 8) + 56))(v50, 1, 1, v30);
  uint64_t v59 = sub_10002FB60();
  uint64_t v31 = *(void *)(v59 - 8);
  uint64_t v47 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v31 + 56);
  uint64_t v60 = v31 + 56;
  uint64_t v32 = v51;
  v47(v51, 1, 1, v59);
  unsigned int v55 = enum case for InputConnectionBehavior.default(_:);
  uint64_t v33 = v68;
  uint64_t v56 = *(void (**)(char *))(v69 + 104);
  v69 += 104;
  int v34 = v52;
  v56(v52);
  id v35 = v32;
  uint64_t v36 = sub_10002FC60();
  uint64_t v37 = v58;
  v58[10] = v36;
  uint64_t v50 = (char *)sub_1000058C0(&qword_10003C450);
  v45[1] = v21;
  sub_1000306D0();
  v45[2] = v18;
  sub_10002FFF0();
  v67(v57, v64, v66);
  sub_10002FF80();
  v63(v29, 1, 1, v62);
  uint64_t v38 = sub_1000306C0();
  uint64_t v70 = 0;
  uint64_t v71 = 0;
  uint64_t v39 = *(void *)(v38 - 8);
  uint64_t v46 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v39 + 56);
  uint64_t v48 = v39 + 56;
  uint64_t v40 = v54;
  v46(v54, 1, 1, v38);
  uint64_t v41 = v35;
  uint64_t v42 = v35;
  uint64_t v43 = v47;
  v47(v42, 1, 1, v59);
  ((void (*)(char *, void, uint64_t))v56)(v34, v55, v33);
  v37[11] = sub_10002FC50();
  uint64_t v50 = (char *)sub_1000058C0(&qword_10003C448);
  sub_1000306D0();
  sub_10002FFF0();
  v67(v57, v64, v66);
  sub_10002FF80();
  v63(v29, 1, 1, v62);
  uint64_t v70 = 0;
  uint64_t v71 = 0;
  v46(v40, 1, 1, v38);
  v43(v41, 1, 1, v59);
  ((void (*)(char *, void, uint64_t))v56)(v34, v55, v68);
  uint64_t result = sub_10002FC50();
  v58[12] = result;
  return result;
}

uint64_t sub_100022328()
{
  sub_10002FC20();
  return v1;
}

uint64_t sub_10002235C()
{
  uint64_t v0 = sub_10002FF70();
  sub_100010AA0(v0, qword_10003CCC8);
  sub_100010A68(v0, (uint64_t)qword_10003CCC8);
  return sub_10002FF50();
}

uint64_t sub_1000223C0()
{
  uint64_t v0 = sub_1000058C0(&qword_10003CB08);
  __chkstk_darwin(v0 - 8);
  sub_1000176D4();
  sub_10002FE90();
  return sub_10002FE80();
}

uint64_t sub_100022488@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_1000058C0(&qword_10003C438);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)&v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_10002FF70();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  sub_10002FF50();
  sub_10002FF50();
  (*(void (**)(char *, void, uint64_t, uint64_t))(v6 + 56))(v4, 0, 1, v5);
  sub_1000058C0(&qword_10003C528);
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_1000317C0;
  sub_10002FF50();
  sub_10002FF50();
  sub_10002FF50();
  sub_10002FF50();
  sub_10002FF50();
  sub_10002FF50();
  sub_10002FF50();
  sub_10002FD90();
  uint64_t v7 = sub_10002FD80();
  return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(a1, 0, 1, v7);
}

uint64_t sub_100022744@<X0>(long long *a1@<X0>, long long *a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v53 = a2;
  uint64_t v52 = a1;
  uint64_t v4 = sub_1000058C0(&qword_10003C420);
  __chkstk_darwin(v4 - 8);
  uint64_t v51 = (char *)v43 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10002FEC0();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v68 = v6;
  uint64_t v69 = v7;
  __chkstk_darwin(v6);
  uint64_t v67 = (char *)v43 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_1000058C0(&qword_10003C428);
  __chkstk_darwin(v9 - 8);
  uint64_t v48 = (char *)v43 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_1000058C0(&qword_10003C430);
  __chkstk_darwin(v11 - 8);
  uint64_t v47 = (char *)v43 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_1000058C0(&qword_10003C438);
  __chkstk_darwin(v13 - 8);
  uint64_t v57 = (char *)v43 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v65 = sub_10002FF60();
  uint64_t v15 = *(void *)(v65 - 8);
  __chkstk_darwin(v65);
  uint64_t v17 = (char *)v43 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_100030000();
  __chkstk_darwin(v18 - 8);
  uint64_t v20 = (char *)v43 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = sub_1000306E0();
  __chkstk_darwin(v21 - 8);
  uint64_t v22 = sub_10002FF70();
  uint64_t v61 = v22;
  uint64_t v23 = *(void *)(v22 - 8);
  uint64_t v24 = __chkstk_darwin(v22);
  uint64_t v49 = (char *)v43 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v24);
  a3[3] = sub_100030140();
  a3[4] = (uint64_t)&protocol witness table for GenerativeAssistantFeatureFlagManager;
  sub_100010080(a3);
  sub_100030130();
  uint64_t v50 = a3 + 5;
  a3[8] = sub_100030160();
  a3[9] = (uint64_t)&protocol witness table for GenerativeAssistantRestrictionManager;
  uint64_t v58 = a3;
  sub_100010080(a3 + 5);
  sub_100030150();
  uint64_t v46 = (void (*)(char *, uint64_t, uint64_t, uint64_t))sub_1000058C0(&qword_10003C440);
  sub_1000306D0();
  sub_10002FFF0();
  unsigned int v63 = enum case for LocalizedStringResource.BundleDescription.main(_:);
  uint64_t v26 = *(void (**)(void))(v15 + 104);
  uint64_t v64 = v15 + 104;
  uint64_t v66 = (void (*)(char *, void, uint64_t))v26;
  unsigned int v55 = v17;
  v26(v17);
  sub_10002FF80();
  uint64_t v27 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v23 + 56);
  uint64_t v60 = v23 + 56;
  uint64_t v62 = v27;
  uint64_t v28 = v57;
  v27(v57, 1, 1, v22);
  LOBYTE(v70) = 2;
  uint64_t v29 = sub_100030770();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v29 - 8) + 56))(v47, 1, 1, v29);
  uint64_t v59 = sub_10002FB60();
  uint64_t v30 = *(void *)(v59 - 8);
  uint64_t v45 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v30 + 56);
  uint64_t v56 = v30 + 56;
  uint64_t v31 = v48;
  v45(v48, 1, 1, v59);
  unsigned int v54 = enum case for InputConnectionBehavior.default(_:);
  uint64_t v44 = *(void (**)(char *))(v69 + 104);
  v69 += 104;
  v44(v67);
  uint64_t v32 = v31;
  a3[10] = sub_10002FC60();
  sub_1000058C0(&qword_10003C450);
  sub_1000306D0();
  v43[2] = v20;
  sub_10002FFF0();
  v66(v55, v63, v65);
  sub_10002FF80();
  v62(v28, 1, 1, v61);
  uint64_t v33 = sub_1000306C0();
  uint64_t v70 = 0;
  uint64_t v71 = 0;
  uint64_t v34 = *(void *)(v33 - 8);
  uint64_t v46 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v34 + 56);
  uint64_t v47 = (char *)(v34 + 56);
  id v35 = v51;
  v46(v51, 1, 1, v33);
  uint64_t v36 = v45;
  v45(v32, 1, 1, v59);
  uint64_t v37 = v67;
  uint64_t v38 = v44;
  ((void (*)(char *, void, uint64_t))v44)(v67, v54, v68);
  v58[11] = sub_10002FC50();
  v43[1] = sub_1000058C0(&qword_10003C448);
  sub_1000306D0();
  sub_10002FFF0();
  v66(v55, v63, v65);
  sub_10002FF80();
  v62(v57, 1, 1, v61);
  uint64_t v70 = 0;
  uint64_t v71 = 0;
  v46(v35, 1, 1, v33);
  v36(v32, 1, 1, v59);
  ((void (*)(char *, void, uint64_t))v38)(v37, v54, v68);
  uint64_t v39 = sub_10002FC50();
  uint64_t v40 = (uint64_t)v58;
  v58[12] = v39;
  sub_10000F9C4(v40);
  sub_1000100E4(v52, v40);
  uint64_t v41 = (uint64_t)v50;
  sub_10000F9C4((uint64_t)v50);
  return sub_1000100E4(v53, v41);
}

uint64_t sub_100023044(uint64_t a1)
{
  v2[144] = v1;
  v2[143] = a1;
  uint64_t v3 = sub_10002FEB0();
  v2[145] = v3;
  v2[146] = *(void *)(v3 - 8);
  v2[147] = swift_task_alloc();
  uint64_t v4 = sub_100030220();
  v2[148] = v4;
  v2[149] = *(void *)(v4 - 8);
  v2[150] = swift_task_alloc();
  uint64_t v5 = sub_100030530();
  v2[151] = v5;
  v2[152] = *(void *)(v5 - 8);
  v2[153] = swift_task_alloc();
  v2[154] = swift_task_alloc();
  v2[155] = swift_task_alloc();
  sub_1000058C0(&qword_10003C390);
  v2[156] = swift_task_alloc();
  uint64_t v6 = sub_100030410();
  v2[157] = v6;
  v2[158] = *(void *)(v6 - 8);
  v2[159] = swift_task_alloc();
  v2[160] = swift_task_alloc();
  sub_1000058C0(&qword_10003C468);
  v2[161] = swift_task_alloc();
  v2[162] = swift_task_alloc();
  sub_1000058C0(&qword_10003C388);
  v2[163] = swift_task_alloc();
  uint64_t v7 = sub_1000300C0();
  v2[164] = v7;
  v2[165] = *(void *)(v7 - 8);
  v2[166] = swift_task_alloc();
  v2[167] = swift_task_alloc();
  uint64_t v8 = sub_100030360();
  v2[168] = v8;
  v2[169] = *(void *)(v8 - 8);
  v2[170] = swift_task_alloc();
  uint64_t v9 = sub_1000304F0();
  v2[171] = v9;
  v2[172] = *(void *)(v9 - 8);
  v2[173] = swift_task_alloc();
  uint64_t v10 = sub_100030520();
  v2[174] = v10;
  v2[175] = *(void *)(v10 - 8);
  v2[176] = swift_task_alloc();
  uint64_t v11 = sub_100030440();
  v2[177] = v11;
  v2[178] = *(void *)(v11 - 8);
  v2[179] = swift_task_alloc();
  v2[180] = swift_task_alloc();
  v2[181] = swift_task_alloc();
  sub_1000058C0(&qword_10003C470);
  v2[182] = swift_task_alloc();
  v2[183] = sub_1000058C0(&qword_10003C478);
  v2[184] = swift_task_alloc();
  v2[185] = swift_task_alloc();
  sub_1000058C0(&qword_10003C480);
  v2[186] = swift_task_alloc();
  uint64_t v12 = sub_10002FB60();
  v2[187] = v12;
  v2[188] = *(void *)(v12 - 8);
  v2[189] = swift_task_alloc();
  v2[190] = swift_task_alloc();
  v2[191] = swift_task_alloc();
  sub_100030320();
  v2[192] = swift_task_alloc();
  sub_1000058C0(&qword_10003C488);
  v2[193] = swift_task_alloc();
  sub_1000304B0();
  v2[194] = swift_task_alloc();
  sub_1000058C0(&qword_10003C490);
  v2[195] = swift_task_alloc();
  uint64_t v13 = sub_1000304A0();
  v2[196] = v13;
  v2[197] = *(void *)(v13 - 8);
  v2[198] = swift_task_alloc();
  uint64_t v14 = sub_1000301A0();
  v2[199] = v14;
  v2[200] = *(void *)(v14 - 8);
  v2[201] = swift_task_alloc();
  v2[202] = swift_task_alloc();
  sub_1000058C0(&qword_10003C498);
  v2[203] = swift_task_alloc();
  uint64_t v15 = sub_100030680();
  v2[204] = v15;
  v2[205] = *(void *)(v15 - 8);
  v2[206] = swift_task_alloc();
  v2[207] = swift_task_alloc();
  sub_10002FF70();
  v2[208] = swift_task_alloc();
  uint64_t v16 = type metadata accessor for GenerativeResponseEntity(0);
  v2[209] = v16;
  v2[210] = *(void *)(v16 - 8);
  v2[211] = swift_task_alloc();
  uint64_t v17 = sub_100030630();
  v2[212] = v17;
  v2[213] = *(void *)(v17 - 8);
  v2[214] = swift_task_alloc();
  v2[215] = swift_task_alloc();
  v2[216] = swift_task_alloc();
  v2[217] = swift_task_alloc();
  v2[218] = swift_task_alloc();
  v2[219] = swift_task_alloc();
  v2[220] = swift_task_alloc();
  uint64_t v18 = sub_10002FE30();
  v2[221] = v18;
  v2[222] = *(void *)(v18 - 8);
  v2[223] = swift_task_alloc();
  v2[224] = swift_task_alloc();
  v2[225] = swift_task_alloc();
  v2[226] = swift_task_alloc();
  sub_1000058C0(&qword_10003C4A0);
  v2[227] = swift_task_alloc();
  v2[228] = swift_task_alloc();
  v2[229] = swift_task_alloc();
  uint64_t v19 = sub_10002FFB0();
  v2[230] = v19;
  uint64_t v20 = *(void *)(v19 - 8);
  v2[231] = v20;
  v2[232] = *(void *)(v20 + 64);
  v2[233] = swift_task_alloc();
  v2[234] = swift_task_alloc();
  sub_1000307B0();
  v2[235] = sub_1000307A0();
  uint64_t v22 = sub_100030780();
  v2[236] = v22;
  v2[237] = v21;
  return ((uint64_t (*)(uint64_t (*)(), uint64_t, uint64_t))_swift_task_switch)(sub_100023AC4, v22, v21);
}

uint64_t sub_100023AC4()
{
  uint64_t v1 = *(void *)(v0 + 1832);
  uint64_t v2 = *(void *)(v0 + 1808);
  uint64_t v3 = *(void *)(v0 + 1776);
  uint64_t v4 = *(void *)(v0 + 1768);
  *(void *)(v0 + 1904) = sub_100030200();
  sub_1000301F0();
  sub_100030240();
  sub_1000301D0();
  swift_release();
  sub_10002FFA0();
  *(void *)(v0 + 1912) = sub_100030290();
  sub_100030280();
  *(void *)(v0 + 1920) = sub_1000176D4();
  sub_10002FAB0();
  sub_10002FE10();
  uint64_t v5 = *(void (**)(uint64_t, uint64_t))(v3 + 8);
  *(void *)(v0 + 1928) = v5;
  *(void *)(v0 + 1936) = (v3 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v5(v2, v4);
  uint64_t v6 = sub_10002FE00();
  *(void *)(v0 + 1944) = v6;
  uint64_t v7 = *(void *)(v6 - 8);
  *(void *)(v0 + 1952) = v7;
  uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
  *(void *)(v0 + 1960) = v8;
  *(void *)(v0 + 1968) = (v7 + 48) & 0xFFFFFFFFFFFFLL | 0x60F0000000000000;
  int v9 = v8(v1, 1, v6);
  uint64_t v10 = *(void *)(v0 + 1832);
  if (v9 == 1)
  {
    sub_100010A0C(v10, &qword_10003C4A0);
  }
  else
  {
    sub_10002FDE0();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v10, v6);
  }
  uint64_t v11 = *(void *)(v0 + 1152);
  sub_100030270();
  swift_release();
  swift_bridgeObjectRelease();
  sub_100030610();
  sub_10002C98C(v11, v0 + 16);
  uint64_t v12 = sub_100030620();
  os_log_type_t v13 = sub_1000307E0();
  BOOL v14 = os_log_type_enabled(v12, v13);
  uint64_t v15 = *(void *)(v0 + 1760);
  uint64_t v16 = *(void *)(v0 + 1704);
  uint64_t v17 = *(void *)(v0 + 1696);
  if (v14)
  {
    uint64_t v18 = swift_slowAlloc();
    uint64_t v228 = swift_slowAlloc();
    *(_DWORD *)uint64_t v18 = 136315650;
    *(void *)(v0 + 1128) = sub_10002EB08(0xD000000000000022, 0x8000000100031C80, &v228);
    sub_100030830();
    *(_WORD *)(v18 + 12) = 2080;
    *(void *)(v0 + 1136) = sub_10002EB08(0x286D726F66726570, 0xE900000000000029, &v228);
    sub_100030830();
    *(_WORD *)(v18 + 22) = 2080;
    sub_100010150((void *)(v0 + 16), *(void *)(v0 + 40));
    uint64_t v19 = sub_100030170();
    *(void *)(v0 + 1048) = sub_10002EB08(v19, v20, &v228);
    sub_100030830();
    swift_bridgeObjectRelease();
    sub_10002C9C4(v0 + 16);
    _os_log_impl((void *)&_mh_execute_header, v12, v13, "%s.%s feature flags: %s", (uint8_t *)v18, 0x20u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    uint64_t v21 = *(void (**)(uint64_t, uint64_t))(v16 + 8);
    v21(v15, v17);
  }
  else
  {
    sub_10002C9C4(v0 + 16);

    uint64_t v21 = *(void (**)(uint64_t, uint64_t))(v16 + 8);
    v21(v15, v17);
  }
  uint64_t v214 = v21;
  *(void *)(v0 + 1976) = v21;
  uint64_t v22 = *(void *)(v0 + 1688);
  uint64_t v23 = *(int **)(v0 + 1672);
  uint64_t v24 = *(void *)(v0 + 1152);
  sub_10002FFD0();
  uint64_t v25 = v23[5];
  sub_1000058C0(&qword_10003C4A8);
  sub_10002FF50();
  sub_100020CE0(&qword_10003C4B0, (void (*)(uint64_t))type metadata accessor for ResponseImageEntity);
  *(void *)(v22 + v25) = sub_10002FBD0();
  uint64_t v26 = v23[6];
  sub_1000058C0(&qword_10003C4B8);
  sub_10002FF50();
  sub_100020CE0(&qword_10003C4C0, (void (*)(uint64_t))type metadata accessor for ResponseTextEntity);
  *(void *)(v22 + v26) = sub_10002FBD0();
  uint64_t v27 = v23[7];
  *(_DWORD *)(v0 + 2240) = v27;
  sub_1000058C0(&qword_10003C2E0);
  sub_10002FF50();
  *(void *)(v22 + v27) = sub_10002FBF0();
  uint64_t v28 = v23[8];
  *(_DWORD *)(v0 + 2244) = v28;
  sub_10002FF50();
  *(void *)(v22 + v28) = sub_10002FBF0();
  *(void *)(v0 + 896) = sub_1000302E0();
  *(void *)(v0 + 904) = v29;
  sub_10002FBB0();
  sub_100010150((void *)(v24 + 40), *(void *)(v24 + 64));
  if ((sub_100030100() & 1) == 0)
  {
    swift_release();
    sub_100030600();
    uint64_t v43 = sub_100030620();
    os_log_type_t v44 = sub_1000307F0();
    BOOL v45 = os_log_type_enabled(v43, v44);
    uint64_t v46 = *(void *)(v0 + 1720);
    uint64_t v47 = *(void *)(v0 + 1696);
    if (v45)
    {
      uint64_t v219 = *(void *)(v0 + 1720);
      uint64_t v48 = swift_slowAlloc();
      uint64_t v228 = swift_slowAlloc();
      *(_DWORD *)uint64_t v48 = 136315394;
      *(void *)(v0 + 1072) = sub_10002EB08(0xD000000000000022, 0x8000000100031C80, &v228);
      sub_100030830();
      *(_WORD *)(v48 + 12) = 2080;
      *(void *)(v0 + 1064) = sub_10002EB08(0x286D726F66726570, 0xE900000000000029, &v228);
      sub_100030830();
      _os_log_impl((void *)&_mh_execute_header, v43, v44, "%s.%s request was restricted by MDM or parental controls.", (uint8_t *)v48, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      uint64_t v49 = v219;
    }
    else
    {

      uint64_t v49 = v46;
    }
    v214(v49, v47);
    uint64_t v50 = *(void *)(v0 + 1688);
    uint64_t v51 = *(void *)(v0 + 1680);
    uint64_t v52 = *(void *)(v0 + 1672);
    uint64_t v53 = *(void *)(v0 + 1520);
    uint64_t v54 = *(void *)(v0 + 1504);
    uint64_t v55 = *(void *)(v0 + 1480);
    uint64_t v220 = *(void *)(v0 + 1496);
    uint64_t v56 = *(void *)(v0 + 1224);
    uint64_t v57 = *(void *)(v0 + 1216);
    uint64_t v58 = *(void *)(v0 + 1208);
    sub_100010194(v50, v55);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v51 + 56))(v55, 0, 1, v52);
    sub_100030470();
    (*(void (**)(uint64_t, void, uint64_t))(v57 + 104))(v56, enum case for CatId.genericRestrictionResponse(_:), v58);
    sub_100030450();
    (*(void (**)(uint64_t, uint64_t))(v57 + 8))(v56, v58);
    sub_1000101F8();
    sub_10002FB70();
    (*(void (**)(uint64_t, uint64_t))(v54 + 8))(v53, v220);
    sub_100010A0C(v55, &qword_10003C478);
LABEL_25:
    sub_10001029C(v50);
    uint64_t v100 = *(void *)(v0 + 1872);
    uint64_t v101 = *(void *)(v0 + 1848);
    uint64_t v196 = *(void *)(v0 + 1840);
    uint64_t v102 = *(void *)(v0 + 1456);
    sub_1000301F0();
    sub_100030240();
    uint64_t v103 = sub_1000305B0();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v103 - 8) + 56))(v102, 1, 1, v103);
    sub_1000301C0();
    swift_release();
    sub_100010A0C(v102, &qword_10003C470);
    sub_1000301F0();
    sub_1000301E0();
    swift_release();
    sub_100030280();
    sub_100030260();
    swift_release();
    (*(void (**)(uint64_t, uint64_t))(v101 + 8))(v100, v196);
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
    uint64_t v104 = *(uint64_t (**)(void))(v0 + 8);
    return v104();
  }
  sub_100010150((void *)(v24 + 40), *(void *)(v24 + 64));
  if (sub_100030120()) {
    goto LABEL_10;
  }
  uint64_t v30 = *(void *)(v0 + 1656);
  uint64_t v31 = *(void *)(v0 + 1640);
  uint64_t v32 = *(void *)(v0 + 1632);
  uint64_t v33 = *(void *)(v0 + 1624);
  sub_100030660();
  sub_100030650();
  uint64_t v34 = *(void (**)(uint64_t, uint64_t))(v31 + 8);
  *(void *)(v0 + 1984) = v34;
  *(void *)(v0 + 1992) = (v31 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v34(v30, v32);
  uint64_t v35 = sub_100030640();
  LODWORD(v30) = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v35 - 8) + 48))(v33, 1, v35);
  sub_100010A0C(v33, &qword_10003C498);
  if (v30 == 1)
  {
LABEL_10:
    uint64_t v36 = *(void *)(v0 + 1152);
    (*(void (**)(void, void, void))(*(void *)(v0 + 1600) + 104))(*(void *)(v0 + 1616), enum case for GenerativeAssistantUseCase.mediaQA(_:), *(void *)(v0 + 1592));
    sub_100010150((void *)(v36 + 40), *(void *)(v36 + 64));
    if (sub_100030110())
    {
      sub_100010150(*(void **)(v0 + 1152), *(void *)(*(void *)(v0 + 1152) + 24));
      if (sub_100030180())
      {
        uint64_t v37 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v0 + 1960);
        uint64_t v38 = *(void *)(v0 + 1944);
        uint64_t v39 = *(void (**)(uint64_t, uint64_t))(v0 + 1928);
        uint64_t v40 = *(void *)(v0 + 1824);
        uint64_t v41 = *(void *)(v0 + 1800);
        uint64_t v42 = *(void *)(v0 + 1768);
        sub_10002FAB0();
        sub_10002FE10();
        v39(v41, v42);
        if (v37(v40, 1, v38) == 1)
        {
          sub_100010A0C(*(void *)(v0 + 1824), &qword_10003C4A0);
        }
        else
        {
          uint64_t v107 = *(void *)(v0 + 1952);
          uint64_t v108 = *(void *)(v0 + 1944);
          uint64_t v109 = *(void *)(v0 + 1824);
          sub_10002FDF0();
          (*(void (**)(uint64_t, uint64_t))(v107 + 8))(v109, v108);
        }
        uint64_t v211 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v0 + 1960);
        uint64_t v110 = *(void *)(v0 + 1944);
        uint64_t v111 = *(void (**)(uint64_t, uint64_t))(v0 + 1928);
        uint64_t v112 = *(void *)(v0 + 1816);
        uint64_t v113 = *(void *)(v0 + 1792);
        uint64_t v114 = *(void *)(v0 + 1768);
        sub_10002FC20();
        sub_10002FAB0();
        sub_10002FE10();
        v111(v113, v114);
        if (v211(v112, 1, v110) == 1)
        {
          uint64_t v115 = *(void *)(v0 + 1560);
          sub_100010A0C(*(void *)(v0 + 1816), &qword_10003C4A0);
          uint64_t v116 = sub_10002FDC0();
          (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v116 - 8) + 56))(v115, 1, 1, v116);
        }
        else
        {
          uint64_t v117 = *(void *)(v0 + 1952);
          uint64_t v118 = *(void *)(v0 + 1944);
          uint64_t v119 = *(void *)(v0 + 1816);
          sub_10002FDD0();
          (*(void (**)(uint64_t, uint64_t))(v117 + 8))(v119, v118);
        }
        uint64_t v199 = *(void (**)(uint64_t, uint64_t))(v0 + 1928);
        uint64_t v120 = *(void *)(v0 + 1784);
        uint64_t v197 = *(void *)(v0 + 1768);
        uint64_t v121 = *(void *)(v0 + 1608);
        uint64_t v122 = *(void *)(v0 + 1600);
        uint64_t v202 = *(void *)(v0 + 1592);
        uint64_t v204 = *(void *)(v0 + 1616);
        uint64_t v123 = *(void *)(v0 + 1560);
        uint64_t v124 = *(void *)(v0 + 1544);
        uint64_t v223 = *(void *)(v0 + 1488);
        sub_100030810();
        sub_100010A0C(v123, &qword_10003C490);
        sub_10002FAB0();
        sub_10002FE20();
        v199(v120, v197);
        sub_100030820();
        sub_100010A0C(v124, &qword_10003C488);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v122 + 16))(v121, v204, v202);
        sub_100030480();
        sub_100030560();
        sub_100030550();
        sub_100030540();
        swift_release();
        uint64_t v125 = sub_1000058C0(&qword_10003C4E0);
        if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v125 - 8) + 48))(v223, 1, v125) == 1)
        {
          uint64_t v126 = *(void *)(v0 + 1872);
          uint64_t v127 = *(void *)(v0 + 1864);
          uint64_t v212 = v127;
          uint64_t v217 = *(void *)(v0 + 1856);
          uint64_t v128 = *(void *)(v0 + 1848);
          uint64_t v129 = *(void *)(v0 + 1840);
          uint64_t v130 = *(void *)(v0 + 1152);
          sub_100010A0C(*(void *)(v0 + 1488), &qword_10003C480);
          sub_10002C98C(v130, v0 + 744);
          uint64_t v131 = swift_allocObject();
          *(void *)(v0 + 2016) = v131;
          long long v132 = *(_OWORD *)(v0 + 824);
          *(_OWORD *)(v131 + 80) = *(_OWORD *)(v0 + 808);
          *(_OWORD *)(v131 + 96) = v132;
          *(void *)(v131 + 112) = *(void *)(v0 + 840);
          long long v133 = *(_OWORD *)(v0 + 760);
          *(_OWORD *)(v131 + 16) = *(_OWORD *)(v0 + 744);
          *(_OWORD *)(v131 + 32) = v133;
          long long v134 = *(_OWORD *)(v0 + 792);
          *(_OWORD *)(v131 + 48) = *(_OWORD *)(v0 + 776);
          *(_OWORD *)(v131 + 64) = v134;
          (*(void (**)(uint64_t, uint64_t, uint64_t))(v128 + 16))(v127, v126, v129);
          sub_10002C98C(v130, v0 + 640);
          unint64_t v135 = (*(unsigned __int8 *)(v128 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v128 + 80);
          uint64_t v136 = swift_allocObject();
          *(void *)(v0 + 2024) = v136;
          (*(void (**)(unint64_t, uint64_t, uint64_t))(v128 + 32))(v136 + v135, v212, v129);
          unint64_t v137 = v136 + ((v217 + v135 + 7) & 0xFFFFFFFFFFFFFFF8);
          long long v138 = *(_OWORD *)(v0 + 720);
          *(_OWORD *)(v137 + 64) = *(_OWORD *)(v0 + 704);
          *(_OWORD *)(v137 + 80) = v138;
          *(void *)(v137 + 96) = *(void *)(v0 + 736);
          long long v139 = *(_OWORD *)(v0 + 656);
          *(_OWORD *)unint64_t v137 = *(_OWORD *)(v0 + 640);
          *(_OWORD *)(v137 + 16) = v139;
          long long v140 = *(_OWORD *)(v0 + 688);
          *(_OWORD *)(v137 + 32) = *(_OWORD *)(v0 + 672);
          *(_OWORD *)(v137 + 48) = v140;
          sub_10002C98C(v130, v0 + 536);
          uint64_t v141 = swift_allocObject();
          *(void *)(v0 + 2032) = v141;
          long long v142 = *(_OWORD *)(v0 + 616);
          *(_OWORD *)(v141 + 80) = *(_OWORD *)(v0 + 600);
          *(_OWORD *)(v141 + 96) = v142;
          *(void *)(v141 + 112) = *(void *)(v0 + 632);
          long long v143 = *(_OWORD *)(v0 + 552);
          *(_OWORD *)(v141 + 16) = *(_OWORD *)(v0 + 536);
          *(_OWORD *)(v141 + 32) = v143;
          long long v144 = *(_OWORD *)(v0 + 584);
          *(_OWORD *)(v141 + 48) = *(_OWORD *)(v0 + 568);
          *(_OWORD *)(v141 + 64) = v144;
          sub_10002C98C(v130, v0 + 432);
          uint64_t v145 = swift_allocObject();
          *(void *)(v0 + 2040) = v145;
          long long v146 = *(_OWORD *)(v0 + 512);
          *(_OWORD *)(v145 + 80) = *(_OWORD *)(v0 + 496);
          *(_OWORD *)(v145 + 96) = v146;
          *(void *)(v145 + 112) = *(void *)(v0 + 528);
          long long v147 = *(_OWORD *)(v0 + 448);
          *(_OWORD *)(v145 + 16) = *(_OWORD *)(v0 + 432);
          *(_OWORD *)(v145 + 32) = v147;
          long long v148 = *(_OWORD *)(v0 + 480);
          *(_OWORD *)(v145 + 48) = *(_OWORD *)(v0 + 464);
          *(_OWORD *)(v145 + 64) = v148;
          if (sub_100030490() & 1) != 0 || (sub_1000302D0())
          {
            sub_100030600();
            uint64_t v149 = sub_100030620();
            os_log_type_t v150 = sub_1000307F0();
            BOOL v151 = os_log_type_enabled(v149, v150);
            long long v152 = *(void (**)(uint64_t, uint64_t))(v0 + 1976);
            uint64_t v153 = *(void *)(v0 + 1744);
            uint64_t v154 = *(void *)(v0 + 1696);
            if (v151)
            {
              uint64_t v224 = *(void (**)(uint64_t, uint64_t))(v0 + 1976);
              uint64_t v155 = swift_slowAlloc();
              uint64_t v228 = swift_slowAlloc();
              *(_DWORD *)uint64_t v155 = 136315394;
              *(void *)(v0 + 1088) = sub_10002EB08(0xD000000000000022, 0x8000000100031C80, &v228);
              sub_100030830();
              *(_WORD *)(v155 + 12) = 2080;
              *(void *)(v0 + 1096) = sub_10002EB08(0x286D726F66726570, 0xE900000000000029, &v228);
              sub_100030830();
              _os_log_impl((void *)&_mh_execute_header, v149, v150, "%s.%s using media controller", (uint8_t *)v155, 0x16u);
              swift_arrayDestroy();
              swift_slowDealloc();
              swift_slowDealloc();

              v224(v153, v154);
            }
            else
            {

              v152(v153, v154);
            }
            uint64_t v166 = *(void *)(v0 + 1152);
            sub_100030510();
            sub_10002FC20();
            uint64_t v167 = *(void *)(v0 + 928);
            uint64_t v168 = *(void *)(v0 + 936);
            *(void *)(v0 + 2048) = v168;
            sub_10002C98C(v166, v0 + 224);
            uint64_t v169 = swift_allocObject();
            *(void *)(v0 + 2056) = v169;
            long long v170 = *(_OWORD *)(v0 + 304);
            *(_OWORD *)(v169 + 80) = *(_OWORD *)(v0 + 288);
            *(_OWORD *)(v169 + 96) = v170;
            *(void *)(v169 + 112) = *(void *)(v0 + 320);
            long long v171 = *(_OWORD *)(v0 + 240);
            *(_OWORD *)(v169 + 16) = *(_OWORD *)(v0 + 224);
            *(_OWORD *)(v169 + 32) = v171;
            long long v172 = *(_OWORD *)(v0 + 272);
            *(_OWORD *)(v169 + 48) = *(_OWORD *)(v0 + 256);
            *(_OWORD *)(v169 + 64) = v172;
            sub_10002C98C(v166, v0 + 120);
            uint64_t v173 = swift_allocObject();
            *(void *)(v0 + 2064) = v173;
            long long v174 = *(_OWORD *)(v0 + 168);
            long long v175 = *(_OWORD *)(v0 + 200);
            *(_OWORD *)(v173 + 80) = *(_OWORD *)(v0 + 184);
            *(_OWORD *)(v173 + 96) = v175;
            *(void *)(v173 + 112) = *(void *)(v0 + 216);
            long long v176 = *(_OWORD *)(v0 + 136);
            *(_OWORD *)(v173 + 16) = *(_OWORD *)(v0 + 120);
            *(_OWORD *)(v173 + 32) = v176;
            *(_OWORD *)(v173 + 48) = *(_OWORD *)(v0 + 152);
            *(_OWORD *)(v173 + 64) = v174;
            uint64_t v177 = (void *)swift_task_alloc();
            *(void *)(v0 + 2072) = v177;
            *uint64_t v177 = v0;
            v177[1] = sub_100027478;
            uint64_t v178 = *(void *)(v0 + 1616);
            uint64_t v179 = *(void *)(v0 + 1584);
            uint64_t v180 = *(void *)(v0 + 1440);
            return GenerateTextFromMediaController.generateRichContent(userQuery:useCaseID:invocationContext:requestValueCallback:requestConfirmationCallback:progressReportingCallback:responseGenerationKeepAliveCallback:progressInitializationCallback:showJITEnablementCallback:)(v180, v167, v168, v178, v179, &unk_10003CAE0, v141, &unk_10003CAD0);
          }
          sub_100030600();
          uint64_t v181 = sub_100030620();
          os_log_type_t v182 = sub_1000307F0();
          BOOL v183 = os_log_type_enabled(v181, v182);
          uint64_t v184 = *(void (**)(uint64_t, uint64_t))(v0 + 1976);
          uint64_t v185 = *(void *)(v0 + 1736);
          uint64_t v186 = *(void *)(v0 + 1696);
          if (v183)
          {
            uint64_t v226 = *(void *)(v0 + 1736);
            uint64_t v187 = swift_slowAlloc();
            uint64_t v228 = swift_slowAlloc();
            *(_DWORD *)uint64_t v187 = 136315394;
            *(void *)(v0 + 1024) = sub_10002EB08(0xD000000000000022, 0x8000000100031C80, &v228);
            sub_100030830();
            *(_WORD *)(v187 + 12) = 2080;
            *(void *)(v0 + 1056) = sub_10002EB08(0x286D726F66726570, 0xE900000000000029, &v228);
            sub_100030830();
            _os_log_impl((void *)&_mh_execute_header, v181, v182, "%s.%s Avoiding media controller", (uint8_t *)v187, 0x16u);
            swift_arrayDestroy();
            swift_slowDealloc();
            swift_slowDealloc();

            v184(v226, v186);
          }
          else
          {

            v184(v185, v186);
          }
          uint64_t v188 = *(void *)(v0 + 1152);
          sub_1000304D0();
          sub_10002FC20();
          uint64_t v189 = *(void *)(v0 + 912);
          uint64_t v190 = *(void *)(v0 + 920);
          *(void *)(v0 + 2088) = v190;
          sub_10002C98C(v188, v0 + 328);
          uint64_t v191 = swift_allocObject();
          *(void *)(v0 + 2096) = v191;
          long long v192 = *(_OWORD *)(v0 + 408);
          *(_OWORD *)(v191 + 80) = *(_OWORD *)(v0 + 392);
          *(_OWORD *)(v191 + 96) = v192;
          *(void *)(v191 + 112) = *(void *)(v0 + 424);
          long long v193 = *(_OWORD *)(v0 + 344);
          *(_OWORD *)(v191 + 16) = *(_OWORD *)(v0 + 328);
          *(_OWORD *)(v191 + 32) = v193;
          long long v194 = *(_OWORD *)(v0 + 376);
          *(_OWORD *)(v191 + 48) = *(_OWORD *)(v0 + 360);
          *(_OWORD *)(v191 + 64) = v194;
          swift_retain();
          uint64_t v195 = (void *)swift_task_alloc();
          *(void *)(v0 + 2104) = v195;
          *uint64_t v195 = v0;
          v195[1] = sub_100027B1C;
          uint64_t v79 = *(void *)(v0 + 1616);
          uint64_t v80 = *(void *)(v0 + 1584);
          uint64_t v76 = *(void *)(v0 + 1432);
          uint64_t v81 = &unk_10003CAE0;
          long long v83 = &unk_10003CAD0;
          uint64_t v77 = v189;
          uint64_t v78 = v190;
          uint64_t v82 = v141;
          return GenerateTextController.generateRichContent(userQuery:useCaseID:invocationContext:requestValueCallback:requestConfirmationCallback:progressReportingCallback:responseGenerationKeepAliveCallback:showJITEnablementCallback:)(v76, v77, v78, v79, v80, v81, v82, v83);
        }
        uint64_t v156 = *(void *)(v0 + 1680);
        uint64_t v218 = *(void *)(v0 + 1616);
        uint64_t v225 = *(void *)(v0 + 1688);
        uint64_t v208 = *(void *)(v0 + 1600);
        uint64_t v213 = *(void *)(v0 + 1592);
        uint64_t v200 = *(void *)(v0 + 1576);
        uint64_t v203 = *(void *)(v0 + 1568);
        uint64_t v205 = *(void *)(v0 + 1584);
        uint64_t v157 = *(void *)(v0 + 1528);
        uint64_t v158 = *(void *)(v0 + 1504);
        uint64_t v159 = *(void *)(v0 + 1496);
        uint64_t v160 = *(uint64_t **)(v0 + 1488);
        uint64_t v161 = *(void *)(v0 + 1480);
        uint64_t v198 = *(void *)(v0 + 1672);
        swift_release();
        uint64_t v162 = *v160;
        uint64_t v163 = v160[1];
        uint64_t v164 = (char *)v160 + *(int *)(v125 + 48);
        uint64_t v165 = v159;
        (*(void (**)(uint64_t, char *, uint64_t))(v158 + 32))(v157, v164, v159);
        uint64_t v50 = v225;
        *(void *)(v0 + 880) = v162;
        *(void *)(v0 + 888) = v163;
        sub_10002FBB0();
        sub_100010194(v225, v161);
        (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v156 + 56))(v161, 0, 1, v198);
        sub_1000101F8();
        sub_10002FB70();
        sub_100010A0C(v161, &qword_10003C478);
        (*(void (**)(uint64_t, uint64_t))(v158 + 8))(v157, v165);
        (*(void (**)(uint64_t, uint64_t))(v200 + 8))(v205, v203);
        (*(void (**)(uint64_t, uint64_t))(v208 + 8))(v218, v213);
      }
      else
      {
        uint64_t v72 = *(void *)(v0 + 1688);
        uint64_t v73 = *(void *)(v0 + 1680);
        uint64_t v74 = *(void *)(v0 + 1672);
        uint64_t v75 = *(void *)(v0 + 1472);
        swift_release();
        sub_100010194(v72, v75);
        (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v73 + 56))(v75, 0, 1, v74);
        uint64_t v76 = sub_10002FBA0();
        uint64_t v84 = *(void *)(v0 + 872);
        if (!v84)
        {
          __break(1u);
          return GenerateTextController.generateRichContent(userQuery:useCaseID:invocationContext:requestValueCallback:requestConfirmationCallback:progressReportingCallback:responseGenerationKeepAliveCallback:showJITEnablementCallback:)(v76, v77, v78, v79, v80, v81, v82, v83);
        }
        uint64_t v85 = *(void *)(v0 + 864);
        uint64_t v215 = *(void *)(v0 + 1616);
        uint64_t v221 = *(void *)(v0 + 1688);
        uint64_t v86 = *(void *)(v0 + 1600);
        uint64_t v87 = *(void *)(v0 + 1512);
        uint64_t v88 = *(void *)(v0 + 1504);
        uint64_t v206 = *(void *)(v0 + 1496);
        uint64_t v209 = *(void *)(v0 + 1592);
        uint64_t v201 = *(void *)(v0 + 1472);
        uint64_t v89 = *(void *)(v0 + 1224);
        uint64_t v90 = *(void *)(v0 + 1216);
        uint64_t v91 = *(void *)(v0 + 1208);
        (*(void (**)(uint64_t, void, uint64_t))(v90 + 104))(v89, enum case for CatId.empty(_:), v91);
        sub_10002BDE8(v85, v84, v89, 0, 0, v87);
        uint64_t v50 = v221;
        swift_bridgeObjectRelease();
        (*(void (**)(uint64_t, uint64_t))(v90 + 8))(v89, v91);
        sub_1000101F8();
        sub_10002FB70();
        (*(void (**)(uint64_t, uint64_t))(v88 + 8))(v87, v206);
        sub_100010A0C(v201, &qword_10003C478);
        (*(void (**)(uint64_t, uint64_t))(v86 + 8))(v215, v209);
      }
    }
    else
    {
      swift_release();
      sub_100030600();
      uint64_t v59 = sub_100030620();
      os_log_type_t v60 = sub_1000307F0();
      BOOL v61 = os_log_type_enabled(v59, v60);
      uint64_t v62 = *(void (**)(uint64_t, uint64_t))(v0 + 1976);
      uint64_t v63 = *(void *)(v0 + 1728);
      uint64_t v64 = *(void *)(v0 + 1696);
      if (v61)
      {
        uint64_t v65 = swift_slowAlloc();
        uint64_t v228 = swift_slowAlloc();
        *(_DWORD *)uint64_t v65 = 136315394;
        *(void *)(v0 + 1080) = sub_10002EB08(0xD000000000000022, 0x8000000100031C80, &v228);
        sub_100030830();
        *(_WORD *)(v65 + 12) = 2080;
        *(void *)(v0 + 1104) = sub_10002EB08(0x286D726F66726570, 0xE900000000000029, &v228);
        sub_100030830();
        _os_log_impl((void *)&_mh_execute_header, v59, v60, "%s.%s request is not available", (uint8_t *)v65, 0x16u);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }

      v62(v63, v64);
      uint64_t v50 = *(void *)(v0 + 1688);
      uint64_t v92 = *(void *)(v0 + 1680);
      uint64_t v93 = *(void *)(v0 + 1672);
      uint64_t v216 = *(void *)(v0 + 1592);
      uint64_t v222 = *(void *)(v0 + 1616);
      uint64_t v94 = *(void *)(v0 + 1520);
      uint64_t v95 = *(void *)(v0 + 1504);
      uint64_t v207 = *(void *)(v0 + 1496);
      uint64_t v210 = *(void *)(v0 + 1600);
      uint64_t v96 = *(void *)(v0 + 1480);
      uint64_t v97 = *(void *)(v0 + 1224);
      uint64_t v98 = *(void *)(v0 + 1216);
      uint64_t v99 = *(void *)(v0 + 1208);
      sub_100010194(v50, v96);
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v92 + 56))(v96, 0, 1, v93);
      sub_100030470();
      (*(void (**)(uint64_t, void, uint64_t))(v98 + 104))(v97, enum case for CatId.disabledResponse(_:), v99);
      sub_100030450();
      (*(void (**)(uint64_t, uint64_t))(v98 + 8))(v97, v99);
      sub_1000101F8();
      sub_10002FB70();
      (*(void (**)(uint64_t, uint64_t))(v95 + 8))(v94, v207);
      sub_100010A0C(v96, &qword_10003C478);
      (*(void (**)(uint64_t, uint64_t))(v210 + 8))(v222, v216);
    }
    goto LABEL_25;
  }
  sub_100030600();
  uint64_t v66 = sub_100030620();
  os_log_type_t v67 = sub_1000307F0();
  BOOL v68 = os_log_type_enabled(v66, v67);
  uint64_t v69 = *(void *)(v0 + 1752);
  uint64_t v70 = *(void *)(v0 + 1696);
  if (v68)
  {
    uint64_t v71 = swift_slowAlloc();
    uint64_t v228 = swift_slowAlloc();
    *(_DWORD *)uint64_t v71 = 136315394;
    *(void *)(v0 + 1112) = sub_10002EB08(0xD000000000000022, 0x8000000100031C80, &v228);
    sub_100030830();
    *(_WORD *)(v71 + 12) = 2080;
    *(void *)(v0 + 1120) = sub_10002EB08(0x286D726F66726570, 0xE900000000000029, &v228);
    sub_100030830();
    _os_log_impl((void *)&_mh_execute_header, v66, v67, "%s.%s External intelligence sign in is restricted -- signing out.", (uint8_t *)v71, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  v214(v69, v70);
  sub_100030660();
  uint64_t v106 = (void *)swift_task_alloc();
  *(void *)(v0 + 2000) = v106;
  *uint64_t v106 = v0;
  v106[1] = sub_100025C58;
  return OpenAIAuthenticator.signOut()();
}

uint64_t sub_100025C58()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 2008) = v0;
  swift_task_dealloc();
  (*(void (**)(void, void))(v2 + 1984))(*(void *)(v2 + 1648), *(void *)(v2 + 1632));
  uint64_t v3 = *(void *)(v2 + 1896);
  uint64_t v4 = *(void *)(v2 + 1888);
  if (v0) {
    uint64_t v5 = sub_10002A35C;
  }
  else {
    uint64_t v5 = sub_100025DE8;
  }
  return ((uint64_t (*)(uint64_t (*)(), uint64_t, uint64_t))_swift_task_switch)(v5, v4, v3);
}

uint64_t sub_100025DE8()
{
  uint64_t v1 = *(void *)(v0 + 1152);
  (*(void (**)(void, void, void))(*(void *)(v0 + 1600) + 104))(*(void *)(v0 + 1616), enum case for GenerativeAssistantUseCase.mediaQA(_:), *(void *)(v0 + 1592));
  sub_100010150((void *)(v1 + 40), *(void *)(v1 + 64));
  if (sub_100030110())
  {
    sub_100010150(*(void **)(v0 + 1152), *(void *)(*(void *)(v0 + 1152) + 24));
    if (sub_100030180())
    {
      uint64_t v2 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v0 + 1960);
      uint64_t v3 = *(void *)(v0 + 1944);
      uint64_t v4 = *(void (**)(uint64_t, uint64_t))(v0 + 1928);
      uint64_t v5 = *(void *)(v0 + 1824);
      uint64_t v6 = *(void *)(v0 + 1800);
      uint64_t v7 = *(void *)(v0 + 1768);
      sub_10002FAB0();
      sub_10002FE10();
      v4(v6, v7);
      if (v2(v5, 1, v3) == 1)
      {
        sub_100010A0C(*(void *)(v0 + 1824), &qword_10003C4A0);
      }
      else
      {
        uint64_t v51 = *(void *)(v0 + 1952);
        uint64_t v52 = *(void *)(v0 + 1944);
        uint64_t v53 = *(void *)(v0 + 1824);
        sub_10002FDF0();
        (*(void (**)(uint64_t, uint64_t))(v51 + 8))(v53, v52);
      }
      long long v152 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v0 + 1960);
      uint64_t v54 = *(void *)(v0 + 1944);
      uint64_t v55 = *(void (**)(uint64_t, uint64_t))(v0 + 1928);
      uint64_t v56 = *(void *)(v0 + 1816);
      uint64_t v57 = *(void *)(v0 + 1792);
      uint64_t v58 = *(void *)(v0 + 1768);
      sub_10002FC20();
      sub_10002FAB0();
      sub_10002FE10();
      v55(v57, v58);
      if (v152(v56, 1, v54) == 1)
      {
        uint64_t v59 = *(void *)(v0 + 1560);
        sub_100010A0C(*(void *)(v0 + 1816), &qword_10003C4A0);
        uint64_t v60 = sub_10002FDC0();
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v60 - 8) + 56))(v59, 1, 1, v60);
      }
      else
      {
        uint64_t v61 = *(void *)(v0 + 1952);
        uint64_t v62 = *(void *)(v0 + 1944);
        uint64_t v63 = *(void *)(v0 + 1816);
        sub_10002FDD0();
        (*(void (**)(uint64_t, uint64_t))(v61 + 8))(v63, v62);
      }
      long long v143 = *(void (**)(uint64_t, uint64_t))(v0 + 1928);
      uint64_t v64 = *(void *)(v0 + 1784);
      uint64_t v141 = *(void *)(v0 + 1768);
      uint64_t v65 = *(void *)(v0 + 1608);
      uint64_t v66 = *(void *)(v0 + 1600);
      uint64_t v146 = *(void *)(v0 + 1592);
      uint64_t v148 = *(void *)(v0 + 1616);
      uint64_t v67 = *(void *)(v0 + 1560);
      uint64_t v68 = *(void *)(v0 + 1544);
      uint64_t v162 = *(void *)(v0 + 1488);
      sub_100030810();
      sub_100010A0C(v67, &qword_10003C490);
      sub_10002FAB0();
      sub_10002FE20();
      v143(v64, v141);
      sub_100030820();
      sub_100010A0C(v68, &qword_10003C488);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v66 + 16))(v65, v148, v146);
      sub_100030480();
      sub_100030560();
      sub_100030550();
      sub_100030540();
      swift_release();
      uint64_t v69 = sub_1000058C0(&qword_10003C4E0);
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v69 - 8) + 48))(v162, 1, v69) == 1)
      {
        uint64_t v70 = *(void *)(v0 + 1872);
        uint64_t v71 = *(void *)(v0 + 1864);
        uint64_t v153 = v71;
        uint64_t v157 = *(void *)(v0 + 1856);
        uint64_t v72 = *(void *)(v0 + 1848);
        uint64_t v73 = *(void *)(v0 + 1840);
        uint64_t v74 = *(void *)(v0 + 1152);
        sub_100010A0C(*(void *)(v0 + 1488), &qword_10003C480);
        sub_10002C98C(v74, v0 + 744);
        uint64_t v75 = swift_allocObject();
        *(void *)(v0 + 2016) = v75;
        long long v76 = *(_OWORD *)(v0 + 824);
        *(_OWORD *)(v75 + 80) = *(_OWORD *)(v0 + 808);
        *(_OWORD *)(v75 + 96) = v76;
        *(void *)(v75 + 112) = *(void *)(v0 + 840);
        long long v77 = *(_OWORD *)(v0 + 760);
        *(_OWORD *)(v75 + 16) = *(_OWORD *)(v0 + 744);
        *(_OWORD *)(v75 + 32) = v77;
        long long v78 = *(_OWORD *)(v0 + 792);
        *(_OWORD *)(v75 + 48) = *(_OWORD *)(v0 + 776);
        *(_OWORD *)(v75 + 64) = v78;
        uint64_t v79 = v70;
        uint64_t v80 = v73;
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v72 + 16))(v71, v79, v73);
        sub_10002C98C(v74, v0 + 640);
        unint64_t v81 = (*(unsigned __int8 *)(v72 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v72 + 80);
        uint64_t v82 = swift_allocObject();
        *(void *)(v0 + 2024) = v82;
        (*(void (**)(unint64_t, uint64_t, uint64_t))(v72 + 32))(v82 + v81, v153, v80);
        unint64_t v83 = v82 + ((v157 + v81 + 7) & 0xFFFFFFFFFFFFFFF8);
        long long v84 = *(_OWORD *)(v0 + 720);
        *(_OWORD *)(v83 + 64) = *(_OWORD *)(v0 + 704);
        *(_OWORD *)(v83 + 80) = v84;
        *(void *)(v83 + 96) = *(void *)(v0 + 736);
        long long v85 = *(_OWORD *)(v0 + 656);
        *(_OWORD *)unint64_t v83 = *(_OWORD *)(v0 + 640);
        *(_OWORD *)(v83 + 16) = v85;
        long long v86 = *(_OWORD *)(v0 + 688);
        *(_OWORD *)(v83 + 32) = *(_OWORD *)(v0 + 672);
        *(_OWORD *)(v83 + 48) = v86;
        sub_10002C98C(v74, v0 + 536);
        uint64_t v87 = swift_allocObject();
        *(void *)(v0 + 2032) = v87;
        long long v88 = *(_OWORD *)(v0 + 616);
        *(_OWORD *)(v87 + 80) = *(_OWORD *)(v0 + 600);
        *(_OWORD *)(v87 + 96) = v88;
        *(void *)(v87 + 112) = *(void *)(v0 + 632);
        long long v89 = *(_OWORD *)(v0 + 552);
        *(_OWORD *)(v87 + 16) = *(_OWORD *)(v0 + 536);
        *(_OWORD *)(v87 + 32) = v89;
        long long v90 = *(_OWORD *)(v0 + 584);
        *(_OWORD *)(v87 + 48) = *(_OWORD *)(v0 + 568);
        *(_OWORD *)(v87 + 64) = v90;
        sub_10002C98C(v74, v0 + 432);
        uint64_t v91 = swift_allocObject();
        *(void *)(v0 + 2040) = v91;
        long long v92 = *(_OWORD *)(v0 + 512);
        *(_OWORD *)(v91 + 80) = *(_OWORD *)(v0 + 496);
        *(_OWORD *)(v91 + 96) = v92;
        *(void *)(v91 + 112) = *(void *)(v0 + 528);
        long long v93 = *(_OWORD *)(v0 + 448);
        *(_OWORD *)(v91 + 16) = *(_OWORD *)(v0 + 432);
        *(_OWORD *)(v91 + 32) = v93;
        long long v94 = *(_OWORD *)(v0 + 480);
        *(_OWORD *)(v91 + 48) = *(_OWORD *)(v0 + 464);
        *(_OWORD *)(v91 + 64) = v94;
        if (sub_100030490() & 1) != 0 || (sub_1000302D0())
        {
          sub_100030600();
          uint64_t v95 = sub_100030620();
          os_log_type_t v96 = sub_1000307F0();
          BOOL v97 = os_log_type_enabled(v95, v96);
          uint64_t v98 = *(void (**)(uint64_t, uint64_t))(v0 + 1976);
          uint64_t v99 = *(void *)(v0 + 1744);
          uint64_t v100 = *(void *)(v0 + 1696);
          if (v97)
          {
            uint64_t v163 = *(void *)(v0 + 1696);
            uint64_t v101 = swift_slowAlloc();
            uint64_t v170 = swift_slowAlloc();
            *(_DWORD *)uint64_t v101 = 136315394;
            *(void *)(v0 + 1088) = sub_10002EB08(0xD000000000000022, 0x8000000100031C80, &v170);
            sub_100030830();
            *(_WORD *)(v101 + 12) = 2080;
            *(void *)(v0 + 1096) = sub_10002EB08(0x286D726F66726570, 0xE900000000000029, &v170);
            sub_100030830();
            _os_log_impl((void *)&_mh_execute_header, v95, v96, "%s.%s using media controller", (uint8_t *)v101, 0x16u);
            swift_arrayDestroy();
            swift_slowDealloc();
            swift_slowDealloc();

            v98(v99, v163);
          }
          else
          {

            v98(v99, v100);
          }
          uint64_t v110 = *(void *)(v0 + 1152);
          sub_100030510();
          sub_10002FC20();
          uint64_t v111 = *(void *)(v0 + 928);
          uint64_t v112 = *(void *)(v0 + 936);
          *(void *)(v0 + 2048) = v112;
          sub_10002C98C(v110, v0 + 224);
          uint64_t v113 = swift_allocObject();
          *(void *)(v0 + 2056) = v113;
          long long v114 = *(_OWORD *)(v0 + 304);
          *(_OWORD *)(v113 + 80) = *(_OWORD *)(v0 + 288);
          *(_OWORD *)(v113 + 96) = v114;
          *(void *)(v113 + 112) = *(void *)(v0 + 320);
          long long v115 = *(_OWORD *)(v0 + 240);
          *(_OWORD *)(v113 + 16) = *(_OWORD *)(v0 + 224);
          *(_OWORD *)(v113 + 32) = v115;
          long long v116 = *(_OWORD *)(v0 + 272);
          *(_OWORD *)(v113 + 48) = *(_OWORD *)(v0 + 256);
          *(_OWORD *)(v113 + 64) = v116;
          sub_10002C98C(v110, v0 + 120);
          uint64_t v117 = swift_allocObject();
          *(void *)(v0 + 2064) = v117;
          long long v118 = *(_OWORD *)(v0 + 168);
          long long v119 = *(_OWORD *)(v0 + 200);
          *(_OWORD *)(v117 + 80) = *(_OWORD *)(v0 + 184);
          *(_OWORD *)(v117 + 96) = v119;
          *(void *)(v117 + 112) = *(void *)(v0 + 216);
          long long v120 = *(_OWORD *)(v0 + 136);
          *(_OWORD *)(v117 + 16) = *(_OWORD *)(v0 + 120);
          *(_OWORD *)(v117 + 32) = v120;
          *(_OWORD *)(v117 + 48) = *(_OWORD *)(v0 + 152);
          *(_OWORD *)(v117 + 64) = v118;
          uint64_t v121 = (void *)swift_task_alloc();
          *(void *)(v0 + 2072) = v121;
          *uint64_t v121 = v0;
          v121[1] = sub_100027478;
          uint64_t v122 = *(void *)(v0 + 1616);
          uint64_t v123 = *(void *)(v0 + 1584);
          uint64_t v124 = *(void *)(v0 + 1440);
          return GenerateTextFromMediaController.generateRichContent(userQuery:useCaseID:invocationContext:requestValueCallback:requestConfirmationCallback:progressReportingCallback:responseGenerationKeepAliveCallback:progressInitializationCallback:showJITEnablementCallback:)(v124, v111, v112, v122, v123, &unk_10003CAE0, v87, &unk_10003CAD0);
        }
        sub_100030600();
        uint64_t v125 = sub_100030620();
        os_log_type_t v126 = sub_1000307F0();
        BOOL v127 = os_log_type_enabled(v125, v126);
        uint64_t v128 = *(void (**)(uint64_t, uint64_t))(v0 + 1976);
        uint64_t v129 = *(void *)(v0 + 1736);
        uint64_t v130 = *(void *)(v0 + 1696);
        if (v127)
        {
          uint64_t v168 = *(void *)(v0 + 1736);
          uint64_t v131 = swift_slowAlloc();
          uint64_t v170 = swift_slowAlloc();
          *(_DWORD *)uint64_t v131 = 136315394;
          *(void *)(v0 + 1024) = sub_10002EB08(0xD000000000000022, 0x8000000100031C80, &v170);
          sub_100030830();
          *(_WORD *)(v131 + 12) = 2080;
          *(void *)(v0 + 1056) = sub_10002EB08(0x286D726F66726570, 0xE900000000000029, &v170);
          sub_100030830();
          _os_log_impl((void *)&_mh_execute_header, v125, v126, "%s.%s Avoiding media controller", (uint8_t *)v131, 0x16u);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();

          v128(v168, v130);
        }
        else
        {

          v128(v129, v130);
        }
        uint64_t v132 = *(void *)(v0 + 1152);
        sub_1000304D0();
        sub_10002FC20();
        uint64_t v133 = *(void *)(v0 + 912);
        uint64_t v134 = *(void *)(v0 + 920);
        *(void *)(v0 + 2088) = v134;
        sub_10002C98C(v132, v0 + 328);
        uint64_t v135 = swift_allocObject();
        *(void *)(v0 + 2096) = v135;
        long long v136 = *(_OWORD *)(v0 + 408);
        *(_OWORD *)(v135 + 80) = *(_OWORD *)(v0 + 392);
        *(_OWORD *)(v135 + 96) = v136;
        *(void *)(v135 + 112) = *(void *)(v0 + 424);
        long long v137 = *(_OWORD *)(v0 + 344);
        *(_OWORD *)(v135 + 16) = *(_OWORD *)(v0 + 328);
        *(_OWORD *)(v135 + 32) = v137;
        long long v138 = *(_OWORD *)(v0 + 376);
        *(_OWORD *)(v135 + 48) = *(_OWORD *)(v0 + 360);
        *(_OWORD *)(v135 + 64) = v138;
        swift_retain();
        long long v139 = (void *)swift_task_alloc();
        *(void *)(v0 + 2104) = v139;
        *long long v139 = v0;
        v139[1] = sub_100027B1C;
        uint64_t v22 = *(void *)(v0 + 1616);
        uint64_t v23 = *(void *)(v0 + 1584);
        uint64_t v19 = *(void *)(v0 + 1432);
        uint64_t v24 = &unk_10003CAE0;
        uint64_t v26 = &unk_10003CAD0;
        uint64_t v20 = v133;
        uint64_t v21 = v134;
        uint64_t v25 = v87;
        return GenerateTextController.generateRichContent(userQuery:useCaseID:invocationContext:requestValueCallback:requestConfirmationCallback:progressReportingCallback:responseGenerationKeepAliveCallback:showJITEnablementCallback:)(v19, v20, v21, v22, v23, v24, v25, v26);
      }
      uint64_t v102 = *(void *)(v0 + 1680);
      uint64_t v164 = *(void *)(v0 + 1616);
      uint64_t v167 = *(void *)(v0 + 1688);
      uint64_t v154 = *(void *)(v0 + 1600);
      uint64_t v158 = *(void *)(v0 + 1592);
      uint64_t v144 = *(void *)(v0 + 1576);
      uint64_t v147 = *(void *)(v0 + 1568);
      uint64_t v149 = *(void *)(v0 + 1584);
      uint64_t v103 = *(void *)(v0 + 1528);
      uint64_t v104 = *(void *)(v0 + 1504);
      uint64_t v105 = *(void *)(v0 + 1496);
      uint64_t v106 = *(char **)(v0 + 1488);
      uint64_t v107 = *(void *)(v0 + 1480);
      uint64_t v142 = *(void *)(v0 + 1672);
      swift_release();
      uint64_t v109 = *(void *)v106;
      uint64_t v108 = *((void *)v106 + 1);
      (*(void (**)(uint64_t, char *, uint64_t))(v104 + 32))(v103, &v106[*(int *)(v69 + 48)], v105);
      *(void *)(v0 + 880) = v109;
      *(void *)(v0 + 888) = v108;
      sub_10002FBB0();
      uint64_t v35 = v167;
      sub_100010194(v167, v107);
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v102 + 56))(v107, 0, 1, v142);
      sub_1000101F8();
      sub_10002FB70();
      sub_100010A0C(v107, &qword_10003C478);
      (*(void (**)(uint64_t, uint64_t))(v104 + 8))(v103, v105);
      (*(void (**)(uint64_t, uint64_t))(v144 + 8))(v149, v147);
      (*(void (**)(uint64_t, uint64_t))(v154 + 8))(v164, v158);
    }
    else
    {
      uint64_t v15 = *(void *)(v0 + 1688);
      uint64_t v16 = *(void *)(v0 + 1680);
      uint64_t v17 = *(void *)(v0 + 1672);
      uint64_t v18 = *(void *)(v0 + 1472);
      swift_release();
      sub_100010194(v15, v18);
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v16 + 56))(v18, 0, 1, v17);
      uint64_t v19 = sub_10002FBA0();
      uint64_t v27 = *(void *)(v0 + 872);
      if (!v27)
      {
        __break(1u);
        return GenerateTextController.generateRichContent(userQuery:useCaseID:invocationContext:requestValueCallback:requestConfirmationCallback:progressReportingCallback:responseGenerationKeepAliveCallback:showJITEnablementCallback:)(v19, v20, v21, v22, v23, v24, v25, v26);
      }
      uint64_t v28 = *(void *)(v0 + 864);
      uint64_t v160 = *(void *)(v0 + 1616);
      uint64_t v165 = *(void *)(v0 + 1688);
      uint64_t v29 = *(void *)(v0 + 1600);
      uint64_t v30 = *(void *)(v0 + 1512);
      uint64_t v31 = *(void *)(v0 + 1504);
      uint64_t v150 = *(void *)(v0 + 1496);
      uint64_t v155 = *(void *)(v0 + 1592);
      uint64_t v145 = *(void *)(v0 + 1472);
      uint64_t v32 = *(void *)(v0 + 1224);
      uint64_t v33 = *(void *)(v0 + 1216);
      uint64_t v34 = *(void *)(v0 + 1208);
      (*(void (**)(uint64_t, void, uint64_t))(v33 + 104))(v32, enum case for CatId.empty(_:), v34);
      sub_10002BDE8(v28, v27, v32, 0, 0, v30);
      uint64_t v35 = v165;
      swift_bridgeObjectRelease();
      (*(void (**)(uint64_t, uint64_t))(v33 + 8))(v32, v34);
      sub_1000101F8();
      sub_10002FB70();
      (*(void (**)(uint64_t, uint64_t))(v31 + 8))(v30, v150);
      sub_100010A0C(v145, &qword_10003C478);
      (*(void (**)(uint64_t, uint64_t))(v29 + 8))(v160, v155);
    }
  }
  else
  {
    swift_release();
    sub_100030600();
    uint64_t v8 = sub_100030620();
    os_log_type_t v9 = sub_1000307F0();
    BOOL v10 = os_log_type_enabled(v8, v9);
    uint64_t v11 = *(void (**)(uint64_t, uint64_t))(v0 + 1976);
    uint64_t v12 = *(void *)(v0 + 1728);
    uint64_t v13 = *(void *)(v0 + 1696);
    if (v10)
    {
      uint64_t v159 = *(void *)(v0 + 1728);
      uint64_t v14 = swift_slowAlloc();
      uint64_t v170 = swift_slowAlloc();
      *(_DWORD *)uint64_t v14 = 136315394;
      *(void *)(v0 + 1080) = sub_10002EB08(0xD000000000000022, 0x8000000100031C80, &v170);
      sub_100030830();
      *(_WORD *)(v14 + 12) = 2080;
      *(void *)(v0 + 1104) = sub_10002EB08(0x286D726F66726570, 0xE900000000000029, &v170);
      sub_100030830();
      _os_log_impl((void *)&_mh_execute_header, v8, v9, "%s.%s request is not available", (uint8_t *)v14, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      v11(v159, v13);
    }
    else
    {

      v11(v12, v13);
    }
    uint64_t v36 = *(void *)(v0 + 1688);
    uint64_t v37 = *(void *)(v0 + 1680);
    uint64_t v38 = *(void *)(v0 + 1672);
    uint64_t v161 = *(void *)(v0 + 1592);
    uint64_t v166 = *(void *)(v0 + 1616);
    uint64_t v39 = *(void *)(v0 + 1520);
    uint64_t v40 = *(void *)(v0 + 1504);
    uint64_t v151 = *(void *)(v0 + 1496);
    uint64_t v156 = *(void *)(v0 + 1600);
    uint64_t v41 = *(void *)(v0 + 1480);
    uint64_t v42 = *(void *)(v0 + 1224);
    uint64_t v43 = *(void *)(v0 + 1216);
    uint64_t v44 = *(void *)(v0 + 1208);
    sub_100010194(v36, v41);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v37 + 56))(v41, 0, 1, v38);
    sub_100030470();
    (*(void (**)(uint64_t, void, uint64_t))(v43 + 104))(v42, enum case for CatId.disabledResponse(_:), v44);
    sub_100030450();
    uint64_t v35 = v36;
    (*(void (**)(uint64_t, uint64_t))(v43 + 8))(v42, v44);
    sub_1000101F8();
    sub_10002FB70();
    (*(void (**)(uint64_t, uint64_t))(v40 + 8))(v39, v151);
    sub_100010A0C(v41, &qword_10003C478);
    (*(void (**)(uint64_t, uint64_t))(v156 + 8))(v166, v161);
  }
  sub_10001029C(v35);
  uint64_t v45 = *(void *)(v0 + 1872);
  uint64_t v46 = *(void *)(v0 + 1848);
  uint64_t v140 = *(void *)(v0 + 1840);
  uint64_t v47 = *(void *)(v0 + 1456);
  sub_1000301F0();
  sub_100030240();
  uint64_t v48 = sub_1000305B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v48 - 8) + 56))(v47, 1, 1, v48);
  sub_1000301C0();
  swift_release();
  sub_100010A0C(v47, &qword_10003C470);
  sub_1000301F0();
  sub_1000301E0();
  swift_release();
  sub_100030280();
  sub_100030260();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v46 + 8))(v45, v140);
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
  uint64_t v49 = *(uint64_t (**)(void))(v0 + 8);
  return v49();
}

uint64_t sub_100027478()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 2080) = v0;
  swift_task_dealloc();
  swift_release();
  if (v0)
  {
    swift_bridgeObjectRelease();
    uint64_t v3 = *(void *)(v2 + 1896);
    uint64_t v4 = *(void *)(v2 + 1888);
    uint64_t v5 = sub_10002A7CC;
  }
  else
  {
    swift_release();
    swift_bridgeObjectRelease();
    uint64_t v3 = *(void *)(v2 + 1896);
    uint64_t v4 = *(void *)(v2 + 1888);
    uint64_t v5 = sub_1000275D0;
  }
  return ((uint64_t (*)(uint64_t (*)(), uint64_t, uint64_t))_swift_task_switch)(v5, v4, v3);
}

uint64_t sub_1000275D0()
{
  (*(void (**)(void, void))(*(void *)(v0 + 1400) + 8))(*(void *)(v0 + 1408), *(void *)(v0 + 1392));
  uint64_t v1 = *(void *)(v0 + 1440);
  *(void *)(v0 + 2120) = *(void *)(v0 + 2080);
  (*(void (**)(void, uint64_t, void))(*(void *)(v0 + 1424) + 32))(*(void *)(v0 + 1448), v1, *(void *)(v0 + 1416));
  sub_100030310();
  sub_10002BB1C(v2);
  uint64_t v3 = sub_1000303E0();
  *(void *)(v0 + 2128) = v3;
  uint64_t v4 = *(void *)(v3 + 16);
  *(void *)(v0 + 2136) = v4;
  if (v4)
  {
    uint64_t v5 = *(void *)(v0 + 1352);
    uint64_t v6 = *(void (**)(void, unint64_t, void))(v5 + 16);
    v5 += 16;
    int v7 = *(_DWORD *)(v5 + 64);
    *(_DWORD *)(v0 + 2248) = v7;
    *(void *)(v0 + 2144) = *(void *)(v5 + 56);
    *(void *)(v0 + 2152) = v6;
    *(void *)(v0 + 2168) = &_swiftEmptyArrayStorage;
    *(void *)(v0 + 2160) = 0;
    v6(*(void *)(v0 + 1360), v3 + ((v7 + 32) & ~(unint64_t)v7), *(void *)(v0 + 1344));
    uint64_t v8 = (void *)swift_task_alloc();
    *(void *)(v0 + 2176) = v8;
    void *v8 = v0;
    v8[1] = sub_1000281C0;
    uint64_t v9 = *(void *)(v0 + 1336);
    return sub_100004DF0(v9);
  }
  else
  {
    swift_bridgeObjectRelease();
    *(void *)(v0 + 2184) = &_swiftEmptyArrayStorage;
    if (sub_1000303A0())
    {
      uint64_t v11 = (void *)swift_task_alloc();
      *(void *)(v0 + 2192) = v11;
      *uint64_t v11 = v0;
      v11[1] = sub_10002893C;
      uint64_t v12 = *(void *)(v0 + 1304);
      return static ModelDisclaimer.rateLimitDisclaimer()(v12);
    }
    else
    {
      uint64_t v13 = *(void *)(v0 + 1304);
      uint64_t v14 = sub_1000300B0();
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v13, 1, 1, v14);
      uint64_t v15 = *(void *)(v0 + 1280);
      uint64_t v16 = *(void *)(v0 + 1272);
      uint64_t v17 = *(void *)(v0 + 1264);
      uint64_t v18 = *(void *)(v0 + 1256);
      sub_100030420();
      (*(void (**)(uint64_t, void, uint64_t))(v17 + 104))(v16, enum case for GeneratedResponse.Outcome.success(_:), v18);
      LOBYTE(v13) = sub_100030400();
      uint64_t v19 = *(void (**)(uint64_t, uint64_t))(v17 + 8);
      v19(v16, v18);
      v19(v15, v18);
      if (v13)
      {
        type metadata accessor for SnippetPluginUtils();
        swift_bridgeObjectRetain();
        uint64_t v20 = sub_100030380();
        uint64_t v22 = v21;
        *(void *)(v0 + 2200) = v21;
        uint64_t v23 = sub_100030370();
        uint64_t v25 = v24;
        *(void *)(v0 + 2208) = v24;
        sub_100030330();
        *(void *)(v0 + 2216) = sub_100030390();
        uint64_t v26 = (void *)swift_task_alloc();
        *(void *)(v0 + 2224) = v26;
        *uint64_t v26 = v0;
        v26[1] = sub_100028D88;
        uint64_t v27 = *(void *)(v0 + 2184);
        uint64_t v28 = *(void *)(v0 + 1296);
        uint64_t v29 = *(void *)(v0 + 1248);
        return sub_100004780(v28, v27, v20, v22, v23, v25, (uint64_t)&_swiftEmptyArrayStorage, v29);
      }
      else
      {
        uint64_t v30 = *(void *)(v0 + 1152);
        (*(void (**)(void, uint64_t, uint64_t, void))(*(void *)(v0 + 1168) + 56))(*(void *)(v0 + 1296), 1, 1, *(void *)(v0 + 1160));
        uint64_t v31 = sub_100030350();
        uint64_t v32 = swift_task_alloc();
        *(void *)(v32 + 16) = v30;
        sub_100021908((void (*)(_OWORD *__return_ptr, void *))sub_10002CD94, v32, v31, v0 + 1032, (void (*)(BOOL, uint64_t, uint64_t))sub_100005B3C);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_task_dealloc();
        *(void *)(v0 + 976) = sub_1000303C0();
        *(void *)(v0 + 984) = v33;
        sub_10002FBB0();
        *(void *)(v0 + 848) = sub_100030430();
        *(void *)(v0 + 856) = v34;
        sub_10002FBB0();
        uint64_t v35 = (void *)swift_task_alloc();
        *(void *)(v0 + 2232) = v35;
        *uint64_t v35 = v0;
        v35[1] = sub_1000290FC;
        uint64_t v36 = *(void *)(v0 + 2184);
        return sub_100010B08(v36);
      }
    }
  }
}

uint64_t sub_100027B1C()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 2112) = v0;
  swift_task_dealloc();
  swift_release();
  if (v0)
  {
    swift_bridgeObjectRelease();
    uint64_t v3 = *(void *)(v2 + 1896);
    uint64_t v4 = *(void *)(v2 + 1888);
    uint64_t v5 = sub_10002AEB4;
  }
  else
  {
    swift_release();
    swift_bridgeObjectRelease();
    uint64_t v3 = *(void *)(v2 + 1896);
    uint64_t v4 = *(void *)(v2 + 1888);
    uint64_t v5 = sub_100027C74;
  }
  return ((uint64_t (*)(uint64_t (*)(), uint64_t, uint64_t))_swift_task_switch)(v5, v4, v3);
}

uint64_t sub_100027C74()
{
  (*(void (**)(void, void))(*(void *)(v0 + 1376) + 8))(*(void *)(v0 + 1384), *(void *)(v0 + 1368));
  uint64_t v1 = *(void *)(v0 + 1432);
  *(void *)(v0 + 2120) = *(void *)(v0 + 2112);
  (*(void (**)(void, uint64_t, void))(*(void *)(v0 + 1424) + 32))(*(void *)(v0 + 1448), v1, *(void *)(v0 + 1416));
  sub_100030310();
  sub_10002BB1C(v2);
  uint64_t v3 = sub_1000303E0();
  *(void *)(v0 + 2128) = v3;
  uint64_t v4 = *(void *)(v3 + 16);
  *(void *)(v0 + 2136) = v4;
  if (v4)
  {
    uint64_t v5 = *(void *)(v0 + 1352);
    uint64_t v6 = *(void (**)(void, unint64_t, void))(v5 + 16);
    v5 += 16;
    int v7 = *(_DWORD *)(v5 + 64);
    *(_DWORD *)(v0 + 2248) = v7;
    *(void *)(v0 + 2144) = *(void *)(v5 + 56);
    *(void *)(v0 + 2152) = v6;
    *(void *)(v0 + 2168) = &_swiftEmptyArrayStorage;
    *(void *)(v0 + 2160) = 0;
    v6(*(void *)(v0 + 1360), v3 + ((v7 + 32) & ~(unint64_t)v7), *(void *)(v0 + 1344));
    uint64_t v8 = (void *)swift_task_alloc();
    *(void *)(v0 + 2176) = v8;
    void *v8 = v0;
    v8[1] = sub_1000281C0;
    uint64_t v9 = *(void *)(v0 + 1336);
    return sub_100004DF0(v9);
  }
  else
  {
    swift_bridgeObjectRelease();
    *(void *)(v0 + 2184) = &_swiftEmptyArrayStorage;
    if (sub_1000303A0())
    {
      uint64_t v11 = (void *)swift_task_alloc();
      *(void *)(v0 + 2192) = v11;
      *uint64_t v11 = v0;
      v11[1] = sub_10002893C;
      uint64_t v12 = *(void *)(v0 + 1304);
      return static ModelDisclaimer.rateLimitDisclaimer()(v12);
    }
    else
    {
      uint64_t v13 = *(void *)(v0 + 1304);
      uint64_t v14 = sub_1000300B0();
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v13, 1, 1, v14);
      uint64_t v15 = *(void *)(v0 + 1280);
      uint64_t v16 = *(void *)(v0 + 1272);
      uint64_t v17 = *(void *)(v0 + 1264);
      uint64_t v18 = *(void *)(v0 + 1256);
      sub_100030420();
      (*(void (**)(uint64_t, void, uint64_t))(v17 + 104))(v16, enum case for GeneratedResponse.Outcome.success(_:), v18);
      LOBYTE(v13) = sub_100030400();
      uint64_t v19 = *(void (**)(uint64_t, uint64_t))(v17 + 8);
      v19(v16, v18);
      v19(v15, v18);
      if (v13)
      {
        type metadata accessor for SnippetPluginUtils();
        swift_bridgeObjectRetain();
        uint64_t v20 = sub_100030380();
        uint64_t v22 = v21;
        *(void *)(v0 + 2200) = v21;
        uint64_t v23 = sub_100030370();
        uint64_t v25 = v24;
        *(void *)(v0 + 2208) = v24;
        sub_100030330();
        *(void *)(v0 + 2216) = sub_100030390();
        uint64_t v26 = (void *)swift_task_alloc();
        *(void *)(v0 + 2224) = v26;
        *uint64_t v26 = v0;
        v26[1] = sub_100028D88;
        uint64_t v27 = *(void *)(v0 + 2184);
        uint64_t v28 = *(void *)(v0 + 1296);
        uint64_t v29 = *(void *)(v0 + 1248);
        return sub_100004780(v28, v27, v20, v22, v23, v25, (uint64_t)&_swiftEmptyArrayStorage, v29);
      }
      else
      {
        uint64_t v30 = *(void *)(v0 + 1152);
        (*(void (**)(void, uint64_t, uint64_t, void))(*(void *)(v0 + 1168) + 56))(*(void *)(v0 + 1296), 1, 1, *(void *)(v0 + 1160));
        uint64_t v31 = sub_100030350();
        uint64_t v32 = swift_task_alloc();
        *(void *)(v32 + 16) = v30;
        sub_100021908((void (*)(_OWORD *__return_ptr, void *))sub_10002CD94, v32, v31, v0 + 1032, (void (*)(BOOL, uint64_t, uint64_t))sub_100005B3C);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_task_dealloc();
        *(void *)(v0 + 976) = sub_1000303C0();
        *(void *)(v0 + 984) = v33;
        sub_10002FBB0();
        *(void *)(v0 + 848) = sub_100030430();
        *(void *)(v0 + 856) = v34;
        sub_10002FBB0();
        uint64_t v35 = (void *)swift_task_alloc();
        *(void *)(v0 + 2232) = v35;
        *uint64_t v35 = v0;
        v35[1] = sub_1000290FC;
        uint64_t v36 = *(void *)(v0 + 2184);
        return sub_100010B08(v36);
      }
    }
  }
}

uint64_t sub_1000281C0()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  uint64_t v2 = *(void *)(v1 + 1896);
  uint64_t v3 = *(void *)(v1 + 1888);
  return ((uint64_t (*)(uint64_t (*)(), uint64_t, uint64_t))_swift_task_switch)(sub_1000282E0, v3, v2);
}

uint64_t sub_1000282E0()
{
  (*(void (**)(void, void, void))(*(void *)(v0 + 1320) + 16))(*(void *)(v0 + 1328), *(void *)(v0 + 1336), *(void *)(v0 + 1312));
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  unint64_t v2 = *(void *)(v0 + 2168);
  if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
    unint64_t v2 = sub_10002C6D8(0, *(void *)(v2 + 16) + 1, 1, *(void *)(v0 + 2168), &qword_10003CB00, (uint64_t (*)(void))&type metadata accessor for RichContentResultSegment, (uint64_t (*)(void))&type metadata accessor for RichContentResultSegment);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  unint64_t v5 = v4 + 1;
  if (v4 >= v3 >> 1)
  {
    uint64_t v43 = sub_10002C6D8(v3 > 1, v4 + 1, 1, v2, &qword_10003CB00, (uint64_t (*)(void))&type metadata accessor for RichContentResultSegment, (uint64_t (*)(void))&type metadata accessor for RichContentResultSegment);
    unint64_t v5 = v4 + 1;
    unint64_t v2 = v43;
  }
  uint64_t v45 = *(void *)(v0 + 2136);
  uint64_t v6 = *(void *)(v0 + 1360);
  uint64_t v7 = *(void *)(v0 + 1352);
  uint64_t v8 = *(void *)(v0 + 1344);
  uint64_t v9 = *(void *)(v0 + 1336);
  uint64_t v10 = *(void *)(v0 + 1328);
  uint64_t v11 = *(void *)(v0 + 1320);
  uint64_t v12 = *(void *)(v0 + 1312);
  uint64_t v13 = *(void *)(v0 + 2160) + 1;
  *(void *)(v2 + 16) = v5;
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v11 + 32))(v2+ ((*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80))+ *(void *)(v11 + 72) * v4, v10, v12);
  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v9, v12);
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v6, v8);
  if (v13 == v45)
  {
    swift_bridgeObjectRelease();
    *(void *)(v0 + 2184) = v2;
    if (sub_1000303A0())
    {
      uint64_t v14 = (void *)swift_task_alloc();
      *(void *)(v0 + 2192) = v14;
      *uint64_t v14 = v0;
      v14[1] = sub_10002893C;
      uint64_t v15 = *(void *)(v0 + 1304);
      return static ModelDisclaimer.rateLimitDisclaimer()(v15);
    }
    else
    {
      uint64_t v19 = *(void *)(v0 + 1304);
      uint64_t v20 = sub_1000300B0();
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v19, 1, 1, v20);
      uint64_t v21 = *(void *)(v0 + 1280);
      uint64_t v22 = *(void *)(v0 + 1272);
      uint64_t v23 = *(void *)(v0 + 1264);
      uint64_t v24 = *(void *)(v0 + 1256);
      sub_100030420();
      (*(void (**)(uint64_t, void, uint64_t))(v23 + 104))(v22, enum case for GeneratedResponse.Outcome.success(_:), v24);
      LOBYTE(v19) = sub_100030400();
      uint64_t v25 = *(void (**)(uint64_t, uint64_t))(v23 + 8);
      v25(v22, v24);
      v25(v21, v24);
      if (v19)
      {
        type metadata accessor for SnippetPluginUtils();
        swift_bridgeObjectRetain();
        uint64_t v26 = sub_100030380();
        uint64_t v28 = v27;
        *(void *)(v0 + 2200) = v27;
        uint64_t v29 = sub_100030370();
        uint64_t v31 = v30;
        *(void *)(v0 + 2208) = v30;
        sub_100030330();
        *(void *)(v0 + 2216) = sub_100030390();
        uint64_t v32 = (void *)swift_task_alloc();
        *(void *)(v0 + 2224) = v32;
        *uint64_t v32 = v0;
        v32[1] = sub_100028D88;
        uint64_t v33 = *(void *)(v0 + 2184);
        uint64_t v34 = *(void *)(v0 + 1296);
        uint64_t v35 = *(void *)(v0 + 1248);
        return sub_100004780(v34, v33, v26, v28, v29, v31, (uint64_t)&_swiftEmptyArrayStorage, v35);
      }
      else
      {
        uint64_t v36 = *(void *)(v0 + 1152);
        (*(void (**)(void, uint64_t, uint64_t, void))(*(void *)(v0 + 1168) + 56))(*(void *)(v0 + 1296), 1, 1, *(void *)(v0 + 1160));
        uint64_t v37 = sub_100030350();
        uint64_t v38 = swift_task_alloc();
        *(void *)(v38 + 16) = v36;
        sub_100021908((void (*)(_OWORD *__return_ptr, void *))sub_10002CD94, v38, v37, v0 + 1032, (void (*)(BOOL, uint64_t, uint64_t))sub_100005B3C);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_task_dealloc();
        *(void *)(v0 + 976) = sub_1000303C0();
        *(void *)(v0 + 984) = v39;
        sub_10002FBB0();
        *(void *)(v0 + 848) = sub_100030430();
        *(void *)(v0 + 856) = v40;
        sub_10002FBB0();
        uint64_t v41 = (void *)swift_task_alloc();
        *(void *)(v0 + 2232) = v41;
        void *v41 = v0;
        v41[1] = sub_1000290FC;
        uint64_t v42 = *(void *)(v0 + 2184);
        return sub_100010B08(v42);
      }
    }
  }
  else
  {
    uint64_t v16 = *(void *)(v0 + 2160) + 1;
    *(void *)(v0 + 2168) = v2;
    *(void *)(v0 + 2160) = v16;
    (*(void (**)(void, unint64_t, void))(v0 + 2152))(*(void *)(v0 + 1360), *(void *)(v0 + 2128)+ ((*(unsigned __int8 *)(v0 + 2248) + 32) & ~(unint64_t)*(unsigned __int8 *)(v0 + 2248))+ *(void *)(v0 + 2144) * v16, *(void *)(v0 + 1344));
    uint64_t v17 = (void *)swift_task_alloc();
    *(void *)(v0 + 2176) = v17;
    *uint64_t v17 = v0;
    v17[1] = sub_1000281C0;
    uint64_t v18 = *(void *)(v0 + 1336);
    return sub_100004DF0(v18);
  }
}

uint64_t sub_10002893C()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  uint64_t v2 = *(void *)(v1 + 1896);
  uint64_t v3 = *(void *)(v1 + 1888);
  return ((uint64_t (*)(uint64_t (*)(), uint64_t, uint64_t))_swift_task_switch)(sub_100028A5C, v3, v2);
}

uint64_t sub_100028A5C()
{
  uint64_t v1 = v0[160];
  uint64_t v2 = v0[159];
  uint64_t v3 = v0[158];
  uint64_t v4 = v0[157];
  sub_100030420();
  (*(void (**)(uint64_t, void, uint64_t))(v3 + 104))(v2, enum case for GeneratedResponse.Outcome.success(_:), v4);
  char v5 = sub_100030400();
  uint64_t v6 = *(void (**)(uint64_t, uint64_t))(v3 + 8);
  v6(v2, v4);
  v6(v1, v4);
  if (v5)
  {
    type metadata accessor for SnippetPluginUtils();
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_100030380();
    uint64_t v9 = v8;
    v0[275] = v8;
    uint64_t v10 = sub_100030370();
    uint64_t v12 = v11;
    v0[276] = v11;
    sub_100030330();
    v0[277] = sub_100030390();
    uint64_t v13 = (void *)swift_task_alloc();
    v0[278] = v13;
    *uint64_t v13 = v0;
    v13[1] = sub_100028D88;
    uint64_t v14 = v0[273];
    uint64_t v15 = v0[162];
    uint64_t v16 = v0[156];
    return sub_100004780(v15, v14, v7, v9, v10, v12, (uint64_t)&_swiftEmptyArrayStorage, v16);
  }
  else
  {
    uint64_t v18 = v0[144];
    (*(void (**)(void, uint64_t, uint64_t, void))(v0[146] + 56))(v0[162], 1, 1, v0[145]);
    uint64_t v19 = sub_100030350();
    uint64_t v20 = swift_task_alloc();
    *(void *)(v20 + 16) = v18;
    sub_100021908((void (*)(_OWORD *__return_ptr, void *))sub_10002CD94, v20, v19, (uint64_t)(v0 + 129), (void (*)(BOOL, uint64_t, uint64_t))sub_100005B3C);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    v0[122] = sub_1000303C0();
    v0[123] = v21;
    sub_10002FBB0();
    v0[106] = sub_100030430();
    v0[107] = v22;
    sub_10002FBB0();
    uint64_t v23 = (void *)swift_task_alloc();
    v0[279] = v23;
    *uint64_t v23 = v0;
    v23[1] = sub_1000290FC;
    uint64_t v24 = v0[273];
    return sub_100010B08(v24);
  }
}

uint64_t sub_100028D88()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void *)(*v0 + 1248);
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_100010A0C(v2, &qword_10003C390);
  uint64_t v3 = *(void *)(v1 + 1896);
  uint64_t v4 = *(void *)(v1 + 1888);
  return ((uint64_t (*)(uint64_t (*)(), uint64_t, uint64_t))_swift_task_switch)(sub_100028F54, v4, v3);
}

uint64_t sub_100028F54()
{
  uint64_t v1 = v0[144];
  (*(void (**)(void, void, uint64_t, void))(v0[146] + 56))(v0[162], 0, 1, v0[145]);
  uint64_t v2 = sub_100030350();
  uint64_t v3 = swift_task_alloc();
  *(void *)(v3 + 16) = v1;
  sub_100021908((void (*)(_OWORD *__return_ptr, void *))sub_10002CD94, v3, v2, (uint64_t)(v0 + 129), (void (*)(BOOL, uint64_t, uint64_t))sub_100005B3C);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  v0[122] = sub_1000303C0();
  v0[123] = v4;
  sub_10002FBB0();
  v0[106] = sub_100030430();
  v0[107] = v5;
  sub_10002FBB0();
  uint64_t v6 = (void *)swift_task_alloc();
  v0[279] = v6;
  *uint64_t v6 = v0;
  v6[1] = sub_1000290FC;
  uint64_t v7 = v0[273];
  return sub_100010B08(v7);
}

uint64_t sub_1000290FC()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  uint64_t v2 = *(void *)(v1 + 1896);
  uint64_t v3 = *(void *)(v1 + 1888);
  return ((uint64_t (*)(uint64_t (*)(), uint64_t, uint64_t))_swift_task_switch)(sub_100029240, v3, v2);
}

uint64_t sub_100029240()
{
  uint64_t v1 = v0[154];
  uint64_t v2 = v0[152];
  swift_release();
  sub_1000303D0();
  unsigned int v83 = enum case for CatId.empty(_:);
  long long v84 = *(void (**)(uint64_t))(v2 + 104);
  v84(v1);
  sub_100020CE0(&qword_10003C518, (void (*)(uint64_t))&type metadata accessor for CatId);
  sub_100030740();
  sub_100030740();
  if (v0[126] == v0[124] && v0[127] == v0[125]) {
    char v3 = 1;
  }
  else {
    char v3 = sub_1000308B0();
  }
  uint64_t v4 = v0[155];
  uint64_t v5 = v0[154];
  uint64_t v6 = v0[152];
  uint64_t v7 = v0[151];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v8 = *(void (**)(uint64_t, uint64_t))(v6 + 8);
  v8(v5, v7);
  v8(v4, v7);
  if (v3)
  {
    uint64_t v9 = (void *)sub_1000303F0();
    if (v9[2] != 1)
    {
      uint64_t v33 = v0[197];
      uint64_t v80 = v0[196];
      uint64_t v82 = v0[198];
      uint64_t v34 = v0[178];
      uint64_t v76 = v0[177];
      uint64_t v78 = v0[181];
      uint64_t v74 = v0[163];
      uint64_t v35 = v0[162];
      uint64_t v36 = (void *)v0[150];
      uint64_t v37 = v0[149];
      uint64_t v38 = v0[148];
      swift_bridgeObjectRelease();
      *uint64_t v36 = 0xD00000000000002ELL;
      v36[1] = 0x8000000100031F90;
      (*(void (**)(void *, void, uint64_t))(v37 + 104))(v36, enum case for GATError.notImplemented(_:), v38);
      sub_100030210();
      (*(void (**)(void *, uint64_t))(v37 + 8))(v36, v38);
      swift_willThrow();
      swift_release();
      swift_release();
      sub_100010A0C(v35, &qword_10003C468);
      sub_100010A0C(v74, &qword_10003C388);
      (*(void (**)(uint64_t, uint64_t))(v34 + 8))(v78, v76);
      (*(void (**)(uint64_t, uint64_t))(v33 + 8))(v82, v80);
      swift_release();
      swift_release();
      sub_100030610();
      swift_errorRetain();
      swift_errorRetain();
      uint64_t v39 = sub_100030620();
      os_log_type_t v40 = sub_100030800();
      if (os_log_type_enabled(v39, v40))
      {
        uint64_t v41 = (uint8_t *)swift_slowAlloc();
        uint64_t v42 = (void *)swift_slowAlloc();
        *(_DWORD *)uint64_t v41 = 138412290;
        swift_errorRetain();
        uint64_t v43 = _swift_stdlib_bridgeErrorToNSError();
        v0[130] = v43;
        sub_100030830();
        *uint64_t v42 = v43;
        swift_errorRelease();
        swift_errorRelease();
        _os_log_impl((void *)&_mh_execute_header, v39, v40, "#GenPhotoReq | OnScreenContentRequest | error = %@", v41, 0xCu);
        sub_1000058C0(&qword_10003C3B8);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {
        swift_errorRelease();
        swift_errorRelease();
      }
      uint64_t v44 = (void (*)(uint64_t, uint64_t))v0[247];
      uint64_t v45 = v0[214];
      uint64_t v46 = v0[212];
      uint64_t v85 = v0[202];
      uint64_t v47 = v0[200];
      uint64_t v48 = v0[199];

      v44(v45, v46);
      id v49 = [objc_allocWithZone((Class)SDRDiagnosticReporter) init];
      type metadata accessor for AutoBugCaptureHelper();
      uint64_t v50 = swift_allocObject();
      *(void *)(v50 + 16) = v49;
      *(void *)(v50 + 24) = 0;
      uint64_t v51 = (void *)sub_10002FF30();
      sub_10002E1A4(0, v51);

      swift_release();
      swift_willThrow();
      (*(void (**)(uint64_t, uint64_t))(v47 + 8))(v85, v48);
      uint64_t v52 = v0[234];
      uint64_t v53 = v0[231];
      uint64_t v58 = v0[230];
      uint64_t v54 = v0[182];
      sub_10001029C(v0[211]);
      sub_1000301F0();
      sub_100030240();
      uint64_t v55 = sub_1000305B0();
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v55 - 8) + 56))(v54, 1, 1, v55);
      sub_1000301C0();
      swift_release();
      sub_100010A0C(v54, &qword_10003C470);
      sub_1000301F0();
      sub_1000301E0();
      swift_release();
      sub_100030280();
      sub_100030260();
      swift_release();
      (*(void (**)(uint64_t, uint64_t))(v53 + 8))(v52, v58);
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
      uint64_t v32 = (uint64_t (*)(void))v0[1];
      goto LABEL_17;
    }
    uint64_t v65 = v8;
    uint64_t v63 = v9[4];
    uint64_t v64 = v9[5];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v65 = v8;
    uint64_t v63 = 0;
    uint64_t v64 = 0xE000000000000000;
  }
  uint64_t v10 = v0[161];
  uint64_t v11 = v0[146];
  uint64_t v12 = v0[145];
  sub_100010890(v0[162], v10);
  int v13 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v11 + 48))(v10, 1, v12);
  uint64_t v86 = v0[211];
  uint64_t v14 = v0[210];
  uint64_t v15 = v0[209];
  uint64_t v16 = v0[200];
  uint64_t v17 = v0[185];
  uint64_t v18 = v0[153];
  uint64_t v19 = v0[151];
  uint64_t v68 = v0[162];
  uint64_t v69 = v0[202];
  uint64_t v79 = v0[198];
  uint64_t v81 = v0[199];
  uint64_t v75 = v0[196];
  uint64_t v77 = v0[197];
  uint64_t v72 = v0[178];
  uint64_t v73 = v0[181];
  uint64_t v70 = v0[163];
  uint64_t v71 = v0[177];
  uint64_t v66 = v0[188];
  uint64_t v67 = v0[187];
  if (v13 == 1)
  {
    uint64_t v20 = v0[190];
    sub_100010A0C(v0[161], &qword_10003C468);
    sub_100010194(v86, v17);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v14 + 56))(v17, 0, 1, v15);
    sub_10002FBA0();
    uint64_t v21 = v0[120];
    uint64_t v22 = v0[121];
    ((void (*)(uint64_t, void, uint64_t))v84)(v18, v83, v19);
    sub_10002BDE8(v63, v64, v18, v21, v22, v20);
    swift_bridgeObjectRelease();
    uint64_t v23 = v69;
    swift_bridgeObjectRelease();
    v65(v18, v19);
    sub_1000101F8();
    sub_10002FB70();
    swift_release();
    swift_release();
    (*(void (**)(uint64_t, uint64_t))(v66 + 8))(v20, v67);
    sub_100010A0C(v17, &qword_10003C478);
    uint64_t v24 = v68;
  }
  else
  {
    uint64_t v61 = v0[146];
    uint64_t v62 = v0[145];
    uint64_t v60 = v0[147];
    uint64_t v59 = v0[190];
    (*(void (**)(void))(v61 + 32))();
    uint64_t v25 = v19;
    sub_100010194(v86, v17);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v14 + 56))(v17, 0, 1, v15);
    sub_10002FBA0();
    uint64_t v26 = v0[118];
    uint64_t v27 = v0[119];
    ((void (*)(uint64_t, void, uint64_t))v84)(v18, v83, v25);
    sub_10002BDE8(v63, v64, v18, v26, v27, v59);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v65(v18, v25);
    sub_1000101F8();
    sub_10002FB80();
    swift_release();
    swift_release();
    (*(void (**)(uint64_t, uint64_t))(v66 + 8))(v59, v67);
    sub_100010A0C(v17, &qword_10003C478);
    (*(void (**)(uint64_t, uint64_t))(v61 + 8))(v60, v62);
    uint64_t v24 = v68;
    uint64_t v23 = v69;
  }
  sub_100010A0C(v24, &qword_10003C468);
  sub_100010A0C(v70, &qword_10003C388);
  (*(void (**)(uint64_t, uint64_t))(v72 + 8))(v73, v71);
  (*(void (**)(uint64_t, uint64_t))(v77 + 8))(v79, v75);
  (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v23, v81);
  sub_10001029C(v86);
  swift_release();
  swift_release();
  uint64_t v28 = v0[234];
  uint64_t v29 = v0[231];
  uint64_t v57 = v0[230];
  uint64_t v30 = v0[182];
  sub_1000301F0();
  sub_100030240();
  uint64_t v31 = sub_1000305B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v31 - 8) + 56))(v30, 1, 1, v31);
  sub_1000301C0();
  swift_release();
  sub_100010A0C(v30, &qword_10003C470);
  sub_1000301F0();
  sub_1000301E0();
  swift_release();
  sub_100030280();
  sub_100030260();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v29 + 8))(v28, v57);
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
  uint64_t v32 = (uint64_t (*)(void))v0[1];
LABEL_17:
  return v32();
}

uint64_t sub_10002A35C()
{
  swift_release();
  uint64_t v1 = v0[234];
  uint64_t v2 = v0[231];
  uint64_t v7 = v0[230];
  uint64_t v3 = v0[182];
  sub_10001029C(v0[211]);
  sub_1000301F0();
  sub_100030240();
  uint64_t v4 = sub_1000305B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56))(v3, 1, 1, v4);
  sub_1000301C0();
  swift_release();
  sub_100010A0C(v3, &qword_10003C470);
  sub_1000301F0();
  sub_1000301E0();
  swift_release();
  sub_100030280();
  sub_100030260();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v7);
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
  uint64_t v5 = (uint64_t (*)(void))v0[1];
  return v5();
}

uint64_t sub_10002A7CC()
{
  uint64_t v1 = v0[198];
  uint64_t v2 = v0[197];
  uint64_t v3 = v0[196];
  uint64_t v4 = v0[176];
  uint64_t v5 = v0[175];
  uint64_t v6 = v0[174];
  swift_release();
  swift_release();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_release();
  swift_release();
  swift_release();
  sub_100030610();
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v7 = sub_100030620();
  os_log_type_t v8 = sub_100030800();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    uint64_t v10 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v9 = 138412290;
    swift_errorRetain();
    uint64_t v11 = _swift_stdlib_bridgeErrorToNSError();
    v0[130] = v11;
    sub_100030830();
    *uint64_t v10 = v11;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "#GenPhotoReq | OnScreenContentRequest | error = %@", v9, 0xCu);
    sub_1000058C0(&qword_10003C3B8);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
  }
  uint64_t v12 = (void (*)(uint64_t, uint64_t))v0[247];
  uint64_t v13 = v0[214];
  uint64_t v14 = v0[212];
  uint64_t v27 = v0[202];
  uint64_t v15 = v0[200];
  uint64_t v16 = v0[199];

  v12(v13, v14);
  id v17 = [objc_allocWithZone((Class)SDRDiagnosticReporter) init];
  type metadata accessor for AutoBugCaptureHelper();
  uint64_t v18 = swift_allocObject();
  *(void *)(v18 + 16) = v17;
  *(void *)(v18 + 24) = 0;
  uint64_t v19 = (void *)sub_10002FF30();
  sub_10002E1A4(0, v19);

  swift_release();
  swift_willThrow();
  (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v27, v16);
  uint64_t v20 = v0[234];
  uint64_t v21 = v0[231];
  uint64_t v26 = v0[230];
  uint64_t v22 = v0[182];
  sub_10001029C(v0[211]);
  sub_1000301F0();
  sub_100030240();
  uint64_t v23 = sub_1000305B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 56))(v22, 1, 1, v23);
  sub_1000301C0();
  swift_release();
  sub_100010A0C(v22, &qword_10003C470);
  sub_1000301F0();
  sub_1000301E0();
  swift_release();
  sub_100030280();
  sub_100030260();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v21 + 8))(v20, v26);
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
  uint64_t v24 = (uint64_t (*)(void))v0[1];
  return v24();
}

uint64_t sub_10002AEB4()
{
  uint64_t v1 = v0[198];
  uint64_t v2 = v0[197];
  uint64_t v3 = v0[196];
  uint64_t v4 = v0[173];
  uint64_t v5 = v0[172];
  uint64_t v6 = v0[171];
  swift_release();
  swift_release();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_release();
  swift_release();
  swift_release();
  sub_100030610();
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v7 = sub_100030620();
  os_log_type_t v8 = sub_100030800();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    uint64_t v10 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v9 = 138412290;
    swift_errorRetain();
    uint64_t v11 = _swift_stdlib_bridgeErrorToNSError();
    v0[130] = v11;
    sub_100030830();
    *uint64_t v10 = v11;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "#GenPhotoReq | OnScreenContentRequest | error = %@", v9, 0xCu);
    sub_1000058C0(&qword_10003C3B8);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
  }
  uint64_t v12 = (void (*)(uint64_t, uint64_t))v0[247];
  uint64_t v13 = v0[214];
  uint64_t v14 = v0[212];
  uint64_t v27 = v0[202];
  uint64_t v15 = v0[200];
  uint64_t v16 = v0[199];

  v12(v13, v14);
  id v17 = [objc_allocWithZone((Class)SDRDiagnosticReporter) init];
  type metadata accessor for AutoBugCaptureHelper();
  uint64_t v18 = swift_allocObject();
  *(void *)(v18 + 16) = v17;
  *(void *)(v18 + 24) = 0;
  uint64_t v19 = (void *)sub_10002FF30();
  sub_10002E1A4(0, v19);

  swift_release();
  swift_willThrow();
  (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v27, v16);
  uint64_t v20 = v0[234];
  uint64_t v21 = v0[231];
  uint64_t v26 = v0[230];
  uint64_t v22 = v0[182];
  sub_10001029C(v0[211]);
  sub_1000301F0();
  sub_100030240();
  uint64_t v23 = sub_1000305B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 56))(v22, 1, 1, v23);
  sub_1000301C0();
  swift_release();
  sub_100010A0C(v22, &qword_10003C470);
  sub_1000301F0();
  sub_1000301E0();
  swift_release();
  sub_100030280();
  sub_100030260();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v21 + 8))(v20, v26);
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
  uint64_t v24 = (uint64_t (*)(void))v0[1];
  return v24();
}

uint64_t sub_10002B59C(uint64_t a1)
{
  v1[2] = a1;
  sub_1000307B0();
  v1[3] = sub_1000307A0();
  uint64_t v3 = sub_100030780();
  v1[4] = v3;
  v1[5] = v2;
  return ((uint64_t (*)(uint64_t (*)(), uint64_t, uint64_t))_swift_task_switch)(sub_10002B634, v3, v2);
}

uint64_t sub_10002B634()
{
  sub_100030570();
  NSString v1 = sub_1000306F0();
  swift_bridgeObjectRelease();
  sub_10002FC20();
  id v2 = [self montaraEnablementWithBundleIdentifier:v1 source:0 isExplicitRequest:*(unsigned char *)(v0 + 72) & 1];
  *(void *)(v0 + 48) = v2;

  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 56) = v3;
  unint64_t v4 = sub_1000176D4();
  *uint64_t v3 = v0;
  v3[1] = sub_10000E928;
  return AppIntent.requestConfirmation(systemStyle:)(v2, &type metadata for GenerateRichContentFromMediaIntent, v4);
}

uint64_t sub_10002B754(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5)
{
  *(void *)(v5 + 32) = a4;
  *(void *)(v5 + 40) = a5;
  *(unsigned char *)(v5 + 88) = a3;
  *(void *)(v5 + 16) = a1;
  *(void *)(v5 + 24) = a2;
  sub_1000307B0();
  *(void *)(v5 + 48) = sub_1000307A0();
  uint64_t v7 = sub_100030780();
  *(void *)(v5 + 56) = v7;
  *(void *)(v5 + 64) = v6;
  return ((uint64_t (*)(uint64_t (*)(), uint64_t, uint64_t))_swift_task_switch)(sub_10002B7F4, v7, v6);
}

uint64_t sub_10002B7F4()
{
  NSString v1 = *(void **)(v0 + 16);
  id v2 = [objc_allocWithZone((Class)SDRDiagnosticReporter) init];
  type metadata accessor for AutoBugCaptureHelper();
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = v2;
  *(void *)(v3 + 24) = 0;
  sub_10002F31C(0);
  swift_release();
  uint64_t v5 = v1[3];
  uint64_t v4 = v1[4];
  uint64_t v6 = sub_100010150(v1, v5);
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v0 + 72) = v7;
  unint64_t v8 = sub_1000176D4();
  *uint64_t v7 = v0;
  v7[1] = sub_10000E56C;
  uint64_t v9 = *(unsigned __int8 *)(v0 + 88);
  uint64_t v10 = *(void *)(v0 + 24);
  return AppIntent.requestConfirmation<A>(result:confirmationActionName:showPrompt:)(v6, v10, v9, &type metadata for GenerateRichContentFromMediaIntent, v5, v8, v4);
}

uint64_t sub_10002B92C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[5] = a2;
  v3[6] = a3;
  v3[4] = a1;
  sub_1000058C0(&qword_10003C428);
  v3[7] = swift_task_alloc();
  sub_1000307B0();
  v3[8] = sub_1000307A0();
  uint64_t v5 = sub_100030780();
  v3[9] = v5;
  v3[10] = v4;
  return ((uint64_t (*)(uint64_t (*)(), uint64_t, uint64_t))_swift_task_switch)(sub_10002B9F8, v5, v4);
}

uint64_t sub_10002B9F8()
{
  uint64_t v1 = v0[7];
  v0[11] = sub_10002FC40();
  swift_bridgeObjectRetain();
  sub_10002FB50();
  uint64_t v2 = sub_10002FB60();
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56))(v1, 0, 1, v2);
  uint64_t v3 = (void *)swift_task_alloc();
  v0[12] = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_10000ED08;
  uint64_t v4 = v0[7];
  return IntentParameter.requestValue(_:)(v0 + 2, v4);
}

void sub_10002BB1C(float a1)
{
  sub_1000302F0();
  if (vabds_f32(a1, v2) < 0.0001 || (sub_100030300(), vabds_f32(a1, v3) < 0.0001))
  {
    sub_10002CDE8();
    uint64_t v4 = (void *)sub_10002FED0();
    NSString v5 = sub_1000306F0();
    [v4 setLocalizedDescription:v5];
  }
  sub_10002CDE8();
  uint64_t v6 = (void *)sub_10002FED0();
  float v7 = a1 * 100.0;
  if ((~COERCE_INT(a1 * 100.0) & 0x7F800000) == 0)
  {
    __break(1u);
    goto LABEL_11;
  }
  if (v7 <= -9.2234e18)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  if (v7 >= 9.2234e18)
  {
LABEL_12:
    __break(1u);
    return;
  }
  id v8 = v6;
  [v6 setCompletedUnitCount:(uint64_t)v7];
}

void sub_10002BC98()
{
  sub_10002CDE8();
  id v2 = (id)sub_10002FED0();
  sub_100030310();
  float v1 = v0 * 100.0;
  if ((~LODWORD(v1) & 0x7F800000) == 0)
  {
    __break(1u);
    goto LABEL_8;
  }
  if (v1 <= -9.2234e18)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  if (v1 >= 9.2234e18)
  {
LABEL_9:
    __break(1u);
    return;
  }
  [v2 setTotalUnitCount:(uint64_t)v1];
}

uint64_t sub_10002BD4C@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v6 = *a1;
  uint64_t v5 = a1[1];
  sub_1000109A8(a2, (uint64_t)v9);
  sub_1000109A8(a2 + 40, (uint64_t)v8);
  sub_100022744(v9, v8, a3);
  *(void *)&v9[0] = v6;
  *((void *)&v9[0] + 1) = v5;
  swift_bridgeObjectRetain();
  sub_10002FC30();
  LOBYTE(v9[0]) = 1;
  return sub_10002FC30();
}

uint64_t sub_10002BDE8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v42 = a5;
  uint64_t v43 = a3;
  uint64_t v39 = a2;
  uint64_t v40 = a4;
  uint64_t v37 = a6;
  uint64_t v38 = a1;
  uint64_t v6 = sub_100030530();
  uint64_t v35 = *(void **)(v6 - 8);
  uint64_t v7 = __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v34 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v36 = (char *)&v34 - v10;
  uint64_t v11 = sub_10002FFE0();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)&v34 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_10002FE30();
  uint64_t v16 = *(void *)(v15 - 8);
  __chkstk_darwin(v15);
  uint64_t v18 = (char *)&v34 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_1000058C0(&qword_10003C4A0);
  __chkstk_darwin(v19 - 8);
  uint64_t v21 = (char *)&v34 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000176D4();
  sub_10002FAB0();
  sub_10002FE10();
  (*(void (**)(char *, uint64_t))(v16 + 8))(v18, v15);
  uint64_t v22 = sub_10002FE00();
  uint64_t v23 = *(void *)(v22 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v23 + 48))(v21, 1, v22) == 1)
  {
    sub_100010A0C((uint64_t)v21, &qword_10003C4A0);
    uint64_t v24 = v35;
LABEL_5:
    sub_10002FFD0();
    uint64_t v41 = sub_10002FFC0();
    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
    swift_bridgeObjectRelease();
    goto LABEL_6;
  }
  uint64_t v25 = sub_10002FDE0();
  uint64_t v27 = v26;
  (*(void (**)(char *, uint64_t))(v23 + 8))(v21, v22);
  uint64_t v24 = v35;
  if (!v27) {
    goto LABEL_5;
  }
  uint64_t v41 = v25;
LABEL_6:
  uint64_t v28 = (void (*)(char *, void, uint64_t))v24[13];
  v28(v9, enum case for CatId.empty(_:), v6);
  sub_100020CE0(&qword_10003C518, (void (*)(uint64_t))&type metadata accessor for CatId);
  sub_100030740();
  sub_100030740();
  if (v46 == v44 && v47 == v45) {
    char v29 = 1;
  }
  else {
    char v29 = sub_1000308B0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v30 = (void (*)(char *, uint64_t))v24[1];
  v30(v9, v6);
  if (v29)
  {
    uint64_t v31 = v36;
    v28(v36, enum case for CatId.generateRichContentFromMediaResponse(_:), v6);
  }
  else
  {
    uint64_t v32 = (void (*)(char *, uint64_t, uint64_t))v24[2];
    uint64_t v31 = v36;
    v32(v36, v43, v6);
  }
  sub_100030470();
  sub_100030460();
  swift_bridgeObjectRelease();
  return ((uint64_t (*)(char *, uint64_t))v30)(v31, v6);
}

uint64_t sub_10002C2BC()
{
  return sub_10002FE40();
}

unint64_t sub_10002C300()
{
  unint64_t result = qword_10003CA80;
  if (!qword_10003CA80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003CA80);
  }
  return result;
}

unint64_t sub_10002C358()
{
  unint64_t result = qword_10003CA88;
  if (!qword_10003CA88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003CA88);
  }
  return result;
}

uint64_t sub_10002C3AC()
{
  return *(void *)(swift_getOpaqueTypeConformance2() + 8);
}

uint64_t sub_10002C3E0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10002C3FC@<X0>(uint64_t a1@<X8>)
{
  if (qword_10003C2C8 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_10002FF70();
  uint64_t v3 = sub_100010A68(v2, (uint64_t)qword_10003CCC8);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

uint64_t sub_10002C4AC(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_10000F7C0;
  return sub_100023044(a1);
}

uint64_t sub_10002C548(uint64_t a1)
{
  unint64_t v2 = sub_10002C61C();

  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

uint64_t sub_10002C594(uint64_t a1)
{
  unint64_t v2 = sub_1000176D4();

  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

ValueMetadata *type metadata accessor for GenerateRichContentFromMediaIntent()
{
  return &type metadata for GenerateRichContentFromMediaIntent;
}

uint64_t sub_10002C5E0()
{
  return sub_10001003C(&qword_10003CA98, &qword_10003CAA0);
}

unint64_t sub_10002C61C()
{
  unint64_t result = qword_10003CAA8;
  if (!qword_10003CAA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_10003CAA8);
  }
  return result;
}

uint64_t sub_10002C670(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_10002C6D8(a1, a2, a3, a4, &qword_10003CAF8, type metadata accessor for ResponseImageEntity, type metadata accessor for ResponseImageEntity);
}

uint64_t sub_10002C6A4(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_10002C6D8(a1, a2, a3, a4, &qword_10003CAF0, type metadata accessor for ResponseTextEntity, type metadata accessor for ResponseTextEntity);
}

uint64_t sub_10002C6D8(char a1, int64_t a2, char a3, unint64_t a4, uint64_t *a5, uint64_t (*a6)(void), uint64_t (*a7)(void))
{
  if (a3)
  {
    unint64_t v11 = *(void *)(a4 + 24);
    uint64_t v12 = v11 >> 1;
    if ((uint64_t)(v11 >> 1) < a2)
    {
      if (v12 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_29;
      }
      uint64_t v12 = v11 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v11 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        uint64_t v12 = a2;
      }
    }
  }
  else
  {
    uint64_t v12 = a2;
  }
  uint64_t v13 = *(void *)(a4 + 16);
  if (v12 <= v13) {
    uint64_t v14 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v14 = v12;
  }
  if (!v14)
  {
    uint64_t v18 = &_swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  sub_1000058C0(a5);
  uint64_t v15 = *(void *)(a6(0) - 8);
  uint64_t v16 = *(void *)(v15 + 72);
  unint64_t v17 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
  uint64_t v18 = (void *)swift_allocObject();
  size_t v19 = j__malloc_size(v18);
  if (!v16 || (v19 - v17 == 0x8000000000000000 ? (BOOL v20 = v16 == -1) : (BOOL v20 = 0), v20))
  {
LABEL_29:
    uint64_t result = sub_100030870();
    __break(1u);
    return result;
  }
  v18[2] = v13;
  v18[3] = 2 * ((uint64_t)(v19 - v17) / v16);
LABEL_19:
  uint64_t v21 = *(void *)(a6(0) - 8);
  unint64_t v22 = (*(unsigned __int8 *)(v21 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v21 + 80);
  unint64_t v23 = (unint64_t)v18 + v22;
  if (a1)
  {
    if ((unint64_t)v18 < a4 || v23 >= a4 + v22 + *(void *)(v21 + 72) * v13)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v18 != (void *)a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_10002CE3C(0, v13, v23, a4, a7);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v18;
}

uint64_t sub_10002C958(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_10002C6D8(a1, a2, a3, a4, &qword_10003CB00, (uint64_t (*)(void))&type metadata accessor for RichContentResultSegment, (uint64_t (*)(void))&type metadata accessor for RichContentResultSegment);
}

uint64_t sub_10002C98C(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_10002C9C4(uint64_t a1)
{
  return a1;
}

uint64_t sub_10002C9F4(uint64_t (*a1)(void))
{
  uint64_t v1 = a1();

  return _typeName(_:qualified:)(v1, 0);
}

uint64_t sub_10002CA34()
{
  unint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  *unint64_t v2 = v1;
  v2[1] = sub_100010B04;
  return sub_10002B59C(v0 + 16);
}

uint64_t sub_10002CAC8()
{
  uint64_t v1 = sub_10002FFB0();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = (*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v7 = v6 + 104;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  uint64_t v8 = v0 + v6;
  sub_10000F9C4(v8);
  sub_10000F9C4(v8 + 40);
  swift_release();
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, v7, v5);
}

uint64_t sub_10002CB90(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v8 = *(void *)(sub_10002FFB0() - 8);
  unint64_t v9 = (*(unsigned __int8 *)(v8 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  uint64_t v10 = v3 + v9;
  uint64_t v11 = v3 + ((*(void *)(v8 + 64) + v9 + 7) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v12 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v12;
  *uint64_t v12 = v4;
  v12[1] = sub_10000F7C0;
  return sub_10002B754(a1, a2, a3, v10, v11);
}

uint64_t sub_10002CCB8(uint64_t a1, uint64_t a2)
{
  unint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v6;
  *unint64_t v6 = v3;
  v6[1] = sub_1000106B8;
  return sub_10002B92C(a1, a2, v2 + 16);
}

void sub_10002CD68()
{
  sub_100030300();
  sub_10002BB1C(v0);
}

uint64_t sub_10002CD94@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_10002BD4C(a1, *(void *)(v2 + 16), a2);
}

void sub_10002CDB8(float a1)
{
}

void sub_10002CDE0()
{
}

unint64_t sub_10002CDE8()
{
  unint64_t result = qword_10003CAE8;
  if (!qword_10003CAE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003CAE8);
  }
  return result;
}

uint64_t sub_10002CE3C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t (*a5)(void))
{
  uint64_t v5 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v5 & 0x8000000000000000) == 0)
  {
    uint64_t v9 = *(void *)(a5(0) - 8);
    uint64_t v10 = a4 + ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80));
    uint64_t v11 = *(void *)(v9 + 72);
    unint64_t v12 = v10 + v11 * a1;
    unint64_t v13 = a3 + v11 * v5;
    if (v12 >= v13 || v12 + v11 * v5 <= a3)
    {
      swift_arrayInitWithCopy();
      return v13;
    }
  }
  uint64_t result = sub_100030880();
  __break(1u);
  return result;
}

uint64_t sub_10002CF9C(uint64_t a1)
{
  unint64_t v2 = sub_10002D0F0();

  return AppIntentsExtension.configuration.getter(a1, v2);
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

unint64_t sub_10002D048()
{
  unint64_t result = qword_10003CB10;
  if (!qword_10003CB10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003CB10);
  }
  return result;
}

uint64_t sub_10002D0A0()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_10002D0F0()
{
  unint64_t result = qword_10003CB18;
  if (!qword_10003CB18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003CB18);
  }
  return result;
}

ValueMetadata *type metadata accessor for GenerativeAssistantExtensionExtension()
{
  return &type metadata for GenerativeAssistantExtensionExtension;
}

uint64_t sub_10002D154()
{
  sub_1000058C0(&qword_10003CB20);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_1000317F0;
  uint64_t v1 = sub_100030580();
  *(void *)(v0 + 56) = v1;
  unint64_t v2 = sub_100010080((uint64_t *)(v0 + 32));
  (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v1 - 8) + 104))(v2, enum case for DummyEnum.dummy(_:), v1);
  sub_1000308C0();

  return swift_bridgeObjectRelease();
}

unint64_t sub_10002D220(char a1)
{
  if (!a1) {
    return 0xD000000000000022;
  }
  if (a1 == 1) {
    return 0xD000000000000019;
  }
  return 0xD00000000000001FLL;
}

uint64_t sub_10002D27C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(unsigned char *)(v8 + 144) = v12;
  *(void *)(v8 + 56) = a7;
  *(void *)(v8 + 64) = a8;
  *(void *)(v8 + 40) = a5;
  *(void *)(v8 + 48) = a6;
  *(void *)(v8 + 32) = a4;
  uint64_t v9 = sub_100030630();
  *(void *)(v8 + 72) = v9;
  *(void *)(v8 + 80) = *(void *)(v9 - 8);
  *(void *)(v8 + 88) = swift_task_alloc();
  *(void *)(v8 + 96) = swift_task_alloc();
  *(void *)(v8 + 104) = swift_task_alloc();
  return ((uint64_t (*)(uint64_t (*)(), void, void))_swift_task_switch)(sub_10002D36C, 0, 0);
}

uint64_t sub_10002D36C()
{
  uint64_t v40 = v0;
  v0[14] = sub_10002157C();
  sub_1000305D0();
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  uint64_t v1 = sub_100030620();
  os_log_type_t v2 = sub_1000307F0();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v36 = v0[9];
    uint64_t v37 = v0[13];
    unint64_t v3 = v0[7];
    uint64_t v34 = v0[6];
    uint64_t v35 = v0[10];
    unint64_t v4 = v0[5];
    uint64_t v5 = v0[4];
    uint64_t v6 = swift_slowAlloc();
    uint64_t v39 = swift_slowAlloc();
    *(_DWORD *)uint64_t v6 = 136315394;
    swift_bridgeObjectRetain();
    v0[2] = sub_10002EB08(v5, v4, &v39);
    sub_100030830();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v6 + 12) = 2080;
    swift_bridgeObjectRetain();
    v0[3] = sub_10002EB08(v34, v3, &v39);
    sub_100030830();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "Taking an AutoBugCapture snapshot, subType '%s', subTypeContext '%s'.", (uint8_t *)v6, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    uint64_t v7 = v37;
    uint64_t v38 = *(void (**)(uint64_t, uint64_t))(v35 + 8);
    v38(v7, v36);
  }
  else
  {
    uint64_t v8 = v0[13];
    uint64_t v9 = v0[9];
    uint64_t v10 = v0[10];
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();

    uint64_t v38 = *(void (**)(uint64_t, uint64_t))(v10 + 8);
    v38(v8, v9);
  }
  uint64_t v11 = *(void **)(v0[8] + 16);
  NSString v12 = sub_1000306F0();
  NSString v13 = sub_1000306F0();
  swift_bridgeObjectRelease();
  NSString v14 = sub_1000306F0();
  NSString v15 = sub_1000306F0();
  NSString v16 = sub_1000306F0();
  id v17 = [v11 signatureWithDomain:v12 type:v13 subType:v14 subtypeContext:v15 detectedProcess:v16 triggerThresholdValues:0];

  if (v17 && (uint64_t v39 = 0, sub_1000306A0(), v17, v18 = v39, v0[15] = v39, v18))
  {
    sub_1000305D0();
    size_t v19 = sub_100030620();
    os_log_type_t v20 = sub_1000307F0();
    if (os_log_type_enabled(v19, v20))
    {
      uint64_t v21 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v21 = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, v20, "AutoBugCapture signature created.", v21, 2u);
      swift_slowDealloc();
    }
    uint64_t v22 = v0[11];
    uint64_t v24 = v0[8];
    uint64_t v23 = v0[9];

    v38(v22, v23);
    uint64_t v25 = swift_task_alloc();
    v0[16] = v25;
    *(void *)(v25 + 16) = v24;
    *(void *)(v25 + 24) = v18;
    uint64_t v26 = (void *)swift_task_alloc();
    v0[17] = v26;
    *uint64_t v26 = v0;
    v26[1] = sub_10002D978;
    return withCheckedContinuation<A>(isolation:function:_:)();
  }
  else
  {
    sub_1000305D0();
    uint64_t v27 = sub_100030620();
    os_log_type_t v28 = sub_100030800();
    if (os_log_type_enabled(v27, v28))
    {
      char v29 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)char v29 = 0;
      _os_log_impl((void *)&_mh_execute_header, v27, v28, "Failed to create an AutoBugCapture signature.", v29, 2u);
      swift_slowDealloc();
    }
    uint64_t v30 = v0[12];
    uint64_t v31 = v0[9];

    v38(v30, v31);
    sub_1000212F4();
    swift_release();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v32 = (uint64_t (*)(void))v0[1];
    return v32();
  }
}

uint64_t sub_10002D978()
{
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  return ((uint64_t (*)(uint64_t (*)(), void, void))_swift_task_switch)(sub_10002DAAC, 0, 0);
}

uint64_t sub_10002DAAC()
{
  sub_1000212F4();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

void sub_10002DB38(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000058C0(&qword_10003CC30);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  __chkstk_darwin(v4);
  uint64_t v7 = *(void **)(a2 + 16);
  Class isa = sub_100030690().super.isa;
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))((char *)aBlock - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v4);
  unint64_t v9 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v10 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v10 + v9, (char *)aBlock - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v4);
  aBlock[4] = sub_10002F8A0;
  aBlock[5] = v10;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10002DF70;
  aBlock[3] = &unk_100039720;
  uint64_t v11 = _Block_copy(aBlock);
  swift_release();
  [v7 snapshotWithSignature:isa duration:0 event:0 payload:v11 reply:0.0];
  _Block_release(v11);
}

uint64_t sub_10002DD24(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100030630();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000305D0();
  swift_bridgeObjectRetain_n();
  uint64_t v8 = sub_100030620();
  os_log_type_t v9 = sub_1000307F0();
  if (os_log_type_enabled(v8, v9))
  {
    v16[1] = a2;
    uint64_t v10 = swift_slowAlloc();
    v16[0] = v4;
    uint64_t v11 = (uint8_t *)v10;
    uint64_t v12 = swift_slowAlloc();
    uint64_t v17 = a1;
    uint64_t v18 = v12;
    *(_DWORD *)uint64_t v11 = 136315138;
    swift_bridgeObjectRetain();
    sub_1000058C0(&qword_10003CC38);
    uint64_t v13 = sub_100030710();
    uint64_t v17 = sub_10002EB08(v13, v14, &v18);
    sub_100030830();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "Done with AutoBugCapture snapshotting. Response: %s", v11, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, void))(v5 + 8))(v7, v16[0]);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  sub_1000058C0(&qword_10003CC30);
  return sub_100030790();
}

uint64_t sub_10002DF70(uint64_t a1, uint64_t a2)
{
  os_log_type_t v2 = *(void (**)(uint64_t))(a1 + 32);
  if (a2) {
    uint64_t v3 = sub_1000306B0();
  }
  else {
    uint64_t v3 = 0;
  }
  swift_retain();
  v2(v3);
  swift_release();

  return swift_bridgeObjectRelease();
}

uint64_t sub_10002E000(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1000307D0();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_1000307C0();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_10002F1CC(a1);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_100030780();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_10002E1A4(int a1, void *a2)
{
  uint64_t v3 = v2;
  int v42 = a1;
  sub_1000058C0(&qword_10003CC00);
  __chkstk_darwin();
  uint64_t v6 = (char *)&v36 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100030630();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin();
  uint64_t v10 = (char *)&v36 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000305D0();
  id v11 = a2;
  uint64_t v12 = sub_100030620();
  int v13 = sub_1000307F0();
  unint64_t v14 = &SnippetPluginUtils;
  if (os_log_type_enabled(v12, (os_log_type_t)v13))
  {
    int v37 = v13;
    uint64_t v39 = v7;
    uint64_t v40 = v6;
    uint64_t v41 = v3;
    uint64_t v15 = swift_slowAlloc();
    uint64_t v36 = swift_slowAlloc();
    uint64_t v44 = v36;
    *(_DWORD *)uint64_t v15 = 136315906;
    uint64_t v38 = v8;
    if ((_BYTE)v42)
    {
      if (v42 == 1) {
        uint64_t v16 = 0xD000000000000019;
      }
      else {
        uint64_t v16 = 0xD00000000000001FLL;
      }
      if (v42 == 1) {
        unint64_t v17 = 0x80000001000345C0;
      }
      else {
        unint64_t v17 = 0x80000001000345A0;
      }
    }
    else
    {
      uint64_t v16 = 0xD000000000000022;
      unint64_t v17 = 0x80000001000345E0;
    }
    id v43 = (id)sub_10002EB08(v16, v17, &v44);
    sub_100030830();
    swift_bridgeObjectRelease();
    *(_WORD *)(v15 + 12) = 2080;
    id v18 = objc_msgSend(v11, "domain", v36);
    uint64_t v19 = sub_100030700();
    unint64_t v21 = v20;

    id v43 = (id)sub_10002EB08(v19, v21, &v44);
    sub_100030830();

    swift_bridgeObjectRelease();
    *(_WORD *)(v15 + 22) = 2048;
    id v22 = [v11 code];

    id v43 = v22;
    sub_100030830();

    *(_WORD *)(v15 + 32) = 2080;
    id v23 = [v11 localizedDescription];
    uint64_t v24 = sub_100030700();
    unint64_t v26 = v25;

    id v43 = (id)sub_10002EB08(v24, v26, &v44);
    sub_100030830();

    unint64_t v14 = &SnippetPluginUtils;
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v12, (os_log_type_t)v37, "Reporting Error to AutoBugCapture. %s throws Domain=%s Code=%ld LocalizedDescription=%s", (uint8_t *)v15, 0x2Au);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v38 + 8))(v10, v39);
    uint64_t v6 = v40;
    uint64_t v3 = v41;
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  }
  id v27 = [v11 domain];
  uint64_t v28 = sub_100030700();
  uint64_t v30 = v29;

  uint64_t v44 = v28;
  uint64_t v45 = v30;
  v46._countAndFlagsBits = 46;
  v46._object = (void *)0xE100000000000000;
  sub_100030720(v46);
  id v43 = objc_msgSend(v11, (SEL)v14[8].weak_ivar_lyt);
  v47._countAndFlagsBits = sub_100030890();
  sub_100030720(v47);
  swift_bridgeObjectRelease();
  uint64_t v32 = v44;
  uint64_t v31 = v45;
  uint64_t v33 = sub_1000307D0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v33 - 8) + 56))(v6, 1, 1, v33);
  uint64_t v34 = swift_allocObject();
  *(void *)(v34 + 16) = 0;
  *(void *)(v34 + 24) = 0;
  *(void *)(v34 + 32) = v32;
  *(void *)(v34 + 40) = v31;
  *(void *)(v34 + 48) = 0;
  *(void *)(v34 + 56) = 0xE000000000000000;
  *(void *)(v34 + 64) = v3;
  *(unsigned char *)(v34 + 72) = v42;
  swift_bridgeObjectRetain();
  swift_retain();
  *(void *)(v3 + 24) = sub_10002E000((uint64_t)v6, (uint64_t)&unk_10003CC10, v34);
  swift_bridgeObjectRelease();
  return swift_release();
}

uint64_t sub_10002E6F0()
{
  swift_release();

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for AutoBugCaptureHelper()
{
  return self;
}

uint64_t sub_10002E754(uint64_t result, unsigned char **a2)
{
  uint64_t v2 = *a2;
  *uint64_t v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_10002E764(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_10002E7A0(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_10002E87C;
  return v6(a1);
}

uint64_t sub_10002E87C()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_10002E974(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_10002E99C(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a4();
  sub_10002EB08(v6, v7, a3);
  uint64_t v8 = *a1 + 8;
  sub_100030830();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_10002EA18(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v8 = v1[6];
  uint64_t v9 = v1[7];
  uint64_t v10 = v1[8];
  id v11 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v11;
  *id v11 = v2;
  v11[1] = sub_100010B04;
  return sub_10002D27C(a1, v4, v5, v6, v7, v8, v9, v10);
}

uint64_t sub_10002EB08(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_10002EBDC(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_10002F170((uint64_t)v12, *a3);
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
      sub_10002F170((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_10000F9C4((uint64_t)v12);
  return v7;
}

uint64_t sub_10002EBDC(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_100030840();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_10002ED98(a5, a6);
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
  uint64_t v8 = sub_100030860();
  if (!v8)
  {
    sub_100030870();
    __break(1u);
LABEL_17:
    uint64_t result = sub_100030880();
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

uint64_t sub_10002ED98(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_10002EE30(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_10002F010(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_10002F010(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_10002EE30(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_10002EFA8(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_100030850();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_100030870();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_100030730();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_100030880();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_100030870();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_10002EFA8(uint64_t a1, uint64_t a2)
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
  sub_1000058C0(&qword_10003CC18);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_10002F010(char a1, int64_t a2, char a3, char *a4)
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
    sub_1000058C0(&qword_10003CC18);
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
  uint64_t result = sub_100030880();
  __break(1u);
  return result;
}

unsigned char **sub_10002F160(unsigned char **result, uint64_t a2, uint64_t a3, char a4)
{
  unint64_t v4 = *result;
  *unint64_t v4 = a4;
  *uint64_t result = v4 + 1;
  return result;
}

uint64_t sub_10002F170(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_10002F1CC(uint64_t a1)
{
  uint64_t v2 = sub_1000058C0(&qword_10003CC00);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10002F22C()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10002F264(uint64_t a1)
{
  unint64_t v4 = *(int **)(v1 + 16);
  size_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *size_t v5 = v2;
  v5[1] = sub_10000F7C0;
  unint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_10003CC20 + dword_10003CC20);
  return v6(a1, v4);
}

uint64_t sub_10002F31C(int a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_1000058C0(&qword_10003CC00);
  __chkstk_darwin(v4 - 8);
  unint64_t v6 = &v27[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v7 = sub_100030630();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = &v27[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v11 = sub_10002FFB0();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  unint64_t v14 = &v27[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_10002FFA0();
  sub_10002FF90();
  double v16 = v15;
  (*(void (**)(unsigned char *, uint64_t))(v12 + 8))(v14, v11);
  if ((_BYTE)a1) {
    double v17 = 0.1;
  }
  else {
    double v17 = 2.0;
  }
  sub_1000305D0();
  id v18 = sub_100030620();
  int v19 = sub_1000307F0();
  if (os_log_type_enabled(v18, (os_log_type_t)v19))
  {
    int v28 = v19;
    uint64_t v31 = v2;
    uint64_t v32 = v8;
    uint64_t v29 = v6;
    uint64_t v20 = swift_slowAlloc();
    uint64_t v34 = swift_slowAlloc();
    *(_DWORD *)uint64_t v20 = 136315906;
    uint64_t v33 = sub_10002EB08(0xD000000000000015, 0x8000000100034840, &v34);
    sub_100030830();
    *(_WORD *)(v20 + 12) = 2080;
    int v30 = a1;
    if ((_BYTE)a1)
    {
      if (a1 == 1) {
        uint64_t v21 = 0xD000000000000019;
      }
      else {
        uint64_t v21 = 0xD00000000000001FLL;
      }
      if (a1 == 1) {
        unint64_t v22 = 0x80000001000345C0;
      }
      else {
        unint64_t v22 = 0x80000001000345A0;
      }
    }
    else
    {
      uint64_t v21 = 0xD000000000000022;
      unint64_t v22 = 0x80000001000345E0;
    }
    uint64_t v24 = v32;
    uint64_t v33 = sub_10002EB08(v21, v22, &v34);
    sub_100030830();
    swift_bridgeObjectRelease();
    *(_WORD *)(v20 + 22) = 2048;
    uint64_t v33 = *(void *)&v16;
    sub_100030830();
    *(_WORD *)(v20 + 32) = 2048;
    uint64_t v33 = *(void *)&v17;
    sub_100030830();
    _os_log_impl((void *)&_mh_execute_header, v18, (os_log_type_t)v28, "Duration for %s in %s was %fs, AutoBugCapture threshold was %fs.", (uint8_t *)v20, 0x2Au);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    uint64_t result = (*(uint64_t (**)(unsigned char *, uint64_t))(v24 + 8))(v10, v7);
    uint64_t v2 = v31;
    LOBYTE(a1) = v30;
    unint64_t v6 = v29;
    if (v17 < v16) {
      goto LABEL_16;
    }
  }
  else
  {

    uint64_t result = (*(uint64_t (**)(unsigned char *, uint64_t))(v8 + 8))(v10, v7);
    if (v17 < v16)
    {
LABEL_16:
      uint64_t v25 = sub_1000307D0();
      (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v25 - 8) + 56))(v6, 1, 1, v25);
      uint64_t v26 = swift_allocObject();
      *(void *)(v26 + 16) = 0;
      *(void *)(v26 + 24) = 0;
      *(void *)(v26 + 32) = 0xD000000000000015;
      *(void *)(v26 + 40) = 0x8000000100034840;
      *(void *)(v26 + 48) = 0x776F6C536F6F54;
      *(void *)(v26 + 56) = 0xE700000000000000;
      *(void *)(v26 + 64) = v2;
      *(unsigned char *)(v26 + 72) = a1;
      swift_retain();
      *(void *)(v2 + 24) = sub_10002E000((uint64_t)v6, (uint64_t)&unk_10003CC40, v26);
      return swift_release();
    }
  }
  return result;
}

void sub_10002F804(uint64_t a1)
{
  sub_10002DB38(a1, *(void *)(v1 + 16));
}

uint64_t sub_10002F80C()
{
  uint64_t v1 = sub_1000058C0(&qword_10003CC30);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v5, v6);
}

uint64_t sub_10002F8A0(uint64_t a1)
{
  uint64_t v3 = *(void *)(sub_1000058C0(&qword_10003CC30) - 8);
  uint64_t v4 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));

  return sub_10002DD24(a1, v4);
}

uint64_t sub_10002F914(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10002F924()
{
  return swift_release();
}

uint64_t sub_10002F930()
{
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 73, 7);
}

uint64_t sub_10002F980(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v8 = v1[6];
  uint64_t v9 = v1[7];
  uint64_t v10 = v1[8];
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v11;
  *uint64_t v11 = v2;
  v11[1] = sub_10000F7C0;
  return sub_10002D27C(a1, v4, v5, v6, v7, v8, v9, v10);
}

uint64_t sub_10002FA70()
{
  return static _AssistantIntentsProvider.uniqueEntities.getter();
}

uint64_t sub_10002FAB0()
{
  return AppIntent.systemContext.getter();
}

uint64_t sub_10002FAE0()
{
  return static AppIntent.authenticationPolicy.getter();
}

uint64_t sub_10002FB10()
{
  return IntentFile.init(data:filename:type:)();
}

uint64_t sub_10002FB20()
{
  return type metadata accessor for IntentFile();
}

uint64_t sub_10002FB50()
{
  return IntentDialog.init(fullAndSupportingString:)();
}

uint64_t sub_10002FB60()
{
  return type metadata accessor for IntentDialog();
}

uint64_t sub_10002FB70()
{
  return static IntentResult.result<A, B>(value:dialog:view:)();
}

uint64_t sub_10002FB80()
{
  return static IntentResult.result<A>(value:pluginContainer:dialog:)();
}

uint64_t sub_10002FB90()
{
  return EntityProperty.wrappedValue.modify();
}

uint64_t sub_10002FBA0()
{
  return EntityProperty.wrappedValue.getter();
}

uint64_t sub_10002FBB0()
{
  return EntityProperty.wrappedValue.setter();
}

uint64_t sub_10002FBC0()
{
  return EntityProperty.projectedValue.getter();
}

uint64_t sub_10002FBD0()
{
  return EntityProperty<>.init(title:)();
}

uint64_t sub_10002FBE0()
{
  return EntityProperty<>.init(title:)();
}

uint64_t sub_10002FBF0()
{
  return EntityProperty<>.init(title:)();
}

uint64_t sub_10002FC00()
{
  return EntityProperty<>.init(title:)();
}

uint64_t sub_10002FC20()
{
  return IntentParameter.wrappedValue.getter();
}

uint64_t sub_10002FC30()
{
  return IntentParameter.wrappedValue.setter();
}

uint64_t sub_10002FC40()
{
  return IntentParameter.projectedValue.getter();
}

uint64_t sub_10002FC50()
{
  return IntentParameter<>.init(title:description:default:inputOptions:requestValueDialog:inputConnectionBehavior:)();
}

uint64_t sub_10002FC60()
{
  return IntentParameter<>.init(title:description:default:displayName:requestValueDialog:inputConnectionBehavior:)();
}

uint64_t sub_10002FC70()
{
  return _AssistantIntent.IntentProjection.subscript.getter();
}

uint64_t sub_10002FC80()
{
  return static _AssistantIntent.PhraseBuilder.buildBlock(_:)();
}

uint64_t sub_10002FC90()
{
  return static _AssistantIntent.PhraseBuilder.buildExpression(_:)();
}

uint64_t sub_10002FCA0()
{
  return static _AssistantIntent.StringValueBuilder.buildBlock(_:)();
}

uint64_t sub_10002FCB0()
{
  return static _AssistantIntent.StringValueBuilder.buildExpression(_:)();
}

uint64_t sub_10002FCC0()
{
  return static _AssistantIntent.ParameterValueBuilder.buildBlock(_:)();
}

uint64_t sub_10002FCD0()
{
  return static _AssistantIntent.ParameterValueBuilder.buildExpression(_:)();
}

uint64_t sub_10002FCE0()
{
  return _AssistantIntent.Value.init<A>(for:builder:)();
}

uint64_t sub_10002FCF0()
{
  return type metadata accessor for _AssistantIntent.Value();
}

uint64_t sub_10002FD00()
{
  return _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)();
}

void sub_10002FD10(Swift::String a1)
{
}

uint64_t sub_10002FD20()
{
  return _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)();
}

uint64_t sub_10002FD30()
{
  return _AssistantIntent.Phrase.init(stringInterpolation:)();
}

uint64_t sub_10002FD40()
{
  return static _AssistantIntent.Builder.buildBlock(_:)();
}

uint64_t sub_10002FD50()
{
  return static _AssistantIntent.Builder.buildExpression(_:)();
}

uint64_t sub_10002FD60()
{
  return type metadata accessor for _AssistantIntent();
}

uint64_t sub_10002FD70()
{
  return _AssistantIntent.init<A>(_:phrases:parameterValues:)();
}

uint64_t sub_10002FD80()
{
  return type metadata accessor for IntentDescription();
}

uint64_t sub_10002FD90()
{
  return IntentDescription.init(_:categoryName:searchKeywords:)();
}

uint64_t sub_10002FDA0()
{
  return IntentViewOptions.init(canReplacePrintableText:)();
}

uint64_t sub_10002FDB0()
{
  return type metadata accessor for IntentViewOptions();
}

uint64_t sub_10002FDC0()
{
  return type metadata accessor for IntentSystemContext.AssistantContext.InteractionMode();
}

uint64_t sub_10002FDD0()
{
  return IntentSystemContext.AssistantContext.interactionMode.getter();
}

uint64_t sub_10002FDE0()
{
  return IntentSystemContext.AssistantContext.requestIdentifier.getter();
}

uint64_t sub_10002FDF0()
{
  return IntentSystemContext.AssistantContext.sessionIdentifier.getter();
}

uint64_t sub_10002FE00()
{
  return type metadata accessor for IntentSystemContext.AssistantContext();
}

uint64_t sub_10002FE10()
{
  return IntentSystemContext.assistantContext.getter();
}

uint64_t sub_10002FE20()
{
  return IntentSystemContext.interfaceIdiom.getter();
}

uint64_t sub_10002FE30()
{
  return type metadata accessor for IntentSystemContext();
}

uint64_t sub_10002FE40()
{
  return DisplayRepresentation.init(stringLiteral:)();
}

uint64_t sub_10002FE50()
{
  return type metadata accessor for DisplayRepresentation();
}

uint64_t sub_10002FE70()
{
  return static DynamicOptionsProvider.useForParameterResolution.getter();
}

uint64_t sub_10002FE80()
{
  return IntentParameterSummary.init(_:table:)();
}

uint64_t sub_10002FE90()
{
  return ParameterSummaryString.init(stringLiteral:)();
}

uint64_t sub_10002FEA0()
{
  return SnippetPluginContainer.init(data:bundleIdentifier:intentViewOptions:)();
}

uint64_t sub_10002FEB0()
{
  return type metadata accessor for SnippetPluginContainer();
}

uint64_t sub_10002FEC0()
{
  return type metadata accessor for InputConnectionBehavior();
}

uint64_t sub_10002FED0()
{
  return ProgressReportingIntent.progress.getter();
}

uint64_t sub_10002FEE0()
{
  return static PersistentlyIdentifiable.persistentIdentifier.getter();
}

uint64_t sub_10002FEF0()
{
  return TypeDisplayRepresentation.init(stringLiteral:)();
}

uint64_t sub_10002FF00()
{
  return TypeDisplayRepresentation.init(name:numericFormat:)();
}

uint64_t sub_10002FF10()
{
  return type metadata accessor for TypeDisplayRepresentation();
}

uint64_t sub_10002FF30()
{
  return _convertErrorToNSError(_:)();
}

uint64_t sub_10002FF40()
{
  return _convertNSErrorToError(_:)();
}

uint64_t sub_10002FF50()
{
  return LocalizedStringResource.init(stringLiteral:)();
}

uint64_t sub_10002FF60()
{
  return type metadata accessor for LocalizedStringResource.BundleDescription();
}

uint64_t sub_10002FF70()
{
  return type metadata accessor for LocalizedStringResource();
}

uint64_t sub_10002FF80()
{
  return LocalizedStringResource.init(_:table:locale:bundle:comment:)();
}

uint64_t sub_10002FF90()
{
  return Date.timeIntervalSince(_:)();
}

uint64_t sub_10002FFA0()
{
  return Date.init()();
}

uint64_t sub_10002FFB0()
{
  return type metadata accessor for Date();
}

uint64_t sub_10002FFC0()
{
  return UUID.uuidString.getter();
}

uint64_t sub_10002FFD0()
{
  return UUID.init()();
}

uint64_t sub_10002FFE0()
{
  return type metadata accessor for UUID();
}

uint64_t sub_10002FFF0()
{
  return static Locale.current.getter();
}

uint64_t sub_100030000()
{
  return type metadata accessor for Locale();
}

uint64_t sub_100030010()
{
  return SnippetPluginModel.data.getter();
}

uint64_t sub_100030020()
{
  return static AppExtension.main()();
}

uint64_t sub_100030030()
{
  return static GenerativeResultModels.bundleName.getter();
}

uint64_t sub_100030040()
{
  return type metadata accessor for GenerativeResultModels();
}

uint64_t sub_100030050()
{
  return GenerativeTAHandoffSnippetModel.init()();
}

uint64_t sub_100030060()
{
  return GenerativeRichTextResultSnippetModel.init(results:contentProviderName:contentDisclaimer:attributions:punchOutURL:criticalDisclaimers:modelDisclaimer:)();
}

uint64_t sub_100030070()
{
  return type metadata accessor for GenerativeRichTextResultSnippetModel();
}

uint64_t sub_100030080()
{
  return Attribution.init(displayUrl:url:)();
}

uint64_t sub_100030090()
{
  return type metadata accessor for Attribution();
}

uint64_t sub_1000300B0()
{
  return type metadata accessor for ModelDisclaimer();
}

uint64_t sub_1000300C0()
{
  return type metadata accessor for RichContentResultSegment();
}

uint64_t sub_1000300D0()
{
  return type metadata accessor for UTType();
}

uint64_t sub_1000300E0()
{
  return GenerativeUsecases.staticString.getter();
}

uint64_t sub_1000300F0()
{
  return type metadata accessor for GenerativeUsecases();
}

uint64_t sub_100030100()
{
  return dispatch thunk of GenerativeAssistantRestrictions.isMontaraAllowed.getter();
}

uint64_t sub_100030110()
{
  return dispatch thunk of GenerativeAssistantRestrictions.isUseCaseAvailable(useCase:)();
}

uint64_t sub_100030120()
{
  return dispatch thunk of GenerativeAssistantRestrictions.isExternalIntelligenceSignInAllowed.getter();
}

uint64_t sub_100030130()
{
  return static GenerativeAssistantFeatureFlagManager.instance.getter();
}

uint64_t sub_100030140()
{
  return type metadata accessor for GenerativeAssistantFeatureFlagManager();
}

uint64_t sub_100030150()
{
  return static GenerativeAssistantRestrictionManager.instance.getter();
}

uint64_t sub_100030160()
{
  return type metadata accessor for GenerativeAssistantRestrictionManager();
}

uint64_t sub_100030170()
{
  return dispatch thunk of GenerativeAssistantFeatureFlagManaging.description.getter();
}

uint64_t sub_100030180()
{
  return dispatch thunk of GenerativeAssistantFeatureFlagManaging.isMontaraEnabled.getter();
}

uint64_t sub_100030190()
{
  return dispatch thunk of GenerativeAssistantFeatureFlagManaging.isLowConfidenceKnowledgeSearchEnabled.getter();
}

uint64_t sub_1000301A0()
{
  return type metadata accessor for GenerativeAssistantUseCase();
}

uint64_t sub_1000301B0()
{
  return dispatch thunk of MetricsUtils.emitSignpostEvent(_:)();
}

uint64_t sub_1000301C0()
{
  return dispatch thunk of MetricsUtils.recordSignpostEnd(for:signPostID:)();
}

uint64_t sub_1000301D0()
{
  return dispatch thunk of MetricsUtils.recordSignpostBegin(for:)();
}

uint64_t sub_1000301E0()
{
  return dispatch thunk of MetricsUtils.emitAllSignpostAndEvent()();
}

uint64_t sub_1000301F0()
{
  return static MetricsUtils.shared.getter();
}

uint64_t sub_100030200()
{
  return type metadata accessor for MetricsUtils();
}

uint64_t sub_100030210()
{
  return GATError.logError()();
}

uint64_t sub_100030220()
{
  return type metadata accessor for GATError();
}

uint64_t sub_100030230()
{
  return static Signpost.generateRichContentIntentPerformDuration.getter();
}

uint64_t sub_100030240()
{
  return static Signpost.generateRichContentFromMediaPerformDuration.getter();
}

uint64_t sub_100030250()
{
  return static Signpost.generateKnowledgeResponseIntentPerformDuration.getter();
}

uint64_t sub_100030260()
{
  return dispatch thunk of SELFUtils.recordRequestEnded()();
}

uint64_t sub_100030270()
{
  return dispatch thunk of SELFUtils.recordRequestStarted(clientTraceId:appIntentName:)();
}

uint64_t sub_100030280()
{
  return static SELFUtils.shared.getter();
}

uint64_t sub_100030290()
{
  return type metadata accessor for SELFUtils();
}

uint64_t sub_1000302A0()
{
  return Attribution.displayUrl.getter();
}

uint64_t sub_1000302B0()
{
  return Attribution.url.getter();
}

uint64_t sub_1000302C0()
{
  return type metadata accessor for Attribution();
}

uint64_t sub_1000302D0()
{
  return static TamaleUtils.isTamaleRequest()();
}

uint64_t sub_1000302E0()
{
  return static FixedResponse.disabledResponse.getter();
}

uint64_t sub_1000302F0()
{
  return static ProgressLevels.intentStart.getter();
}

uint64_t sub_100030300()
{
  return static ProgressLevels.sendingToGMS.getter();
}

uint64_t sub_100030310()
{
  return static ProgressLevels.executionFinished.getter();
}

uint64_t sub_100030320()
{
  return type metadata accessor for GATInterfaceIdiom();
}

uint64_t sub_100030330()
{
  return GeneratedResponse.punchOutURL.getter();
}

uint64_t sub_100030340()
{
  return GeneratedResponse.attributions.getter();
}

uint64_t sub_100030350()
{
  return GeneratedResponse.suggestedQueries.getter();
}

uint64_t sub_100030360()
{
  return type metadata accessor for GeneratedResponse.RichContentEntity();
}

uint64_t sub_100030370()
{
  return GeneratedResponse.contentDisclaimer.getter();
}

uint64_t sub_100030380()
{
  return GeneratedResponse.contentProviderName.getter();
}

uint64_t sub_100030390()
{
  return GeneratedResponse.criticalDisclaimers.getter();
}

uint64_t sub_1000303A0()
{
  return GeneratedResponse.hasExceededRequestBudget.getter();
}

uint64_t sub_1000303B0()
{
  return GeneratedResponse.getBreadCrumbAttributions(_:)();
}

uint64_t sub_1000303C0()
{
  return GeneratedResponse.text.getter();
}

uint64_t sub_1000303D0()
{
  return GeneratedResponse.catId.getter();
}

uint64_t sub_1000303E0()
{
  return GeneratedResponse.value.getter();
}

uint64_t sub_1000303F0()
{
  return GeneratedResponse.dialog.getter();
}

uint64_t sub_100030400()
{
  return static GeneratedResponse.Outcome.== infix(_:_:)();
}

uint64_t sub_100030410()
{
  return type metadata accessor for GeneratedResponse.Outcome();
}

uint64_t sub_100030420()
{
  return GeneratedResponse.outcome.getter();
}

uint64_t sub_100030430()
{
  return GeneratedResponse.summary.getter();
}

uint64_t sub_100030440()
{
  return type metadata accessor for GeneratedResponse();
}

uint64_t sub_100030450()
{
  return static IntentDialogUtils.getDialog(catID:response:includeContentProviderName:appName:)();
}

uint64_t sub_100030460()
{
  return static IntentDialogUtils.getDialogAndInsertToFeatureStore(requestID:catID:response:text:)();
}

uint64_t sub_100030470()
{
  return type metadata accessor for IntentDialogUtils();
}

uint64_t sub_100030480()
{
  return InvocationContext.init(explicitInvocation:interactionMode:interfaceIdiom:useCase:sessionID:)();
}

uint64_t sub_100030490()
{
  return InvocationContext.isFirstRequest.getter();
}

uint64_t sub_1000304A0()
{
  return type metadata accessor for InvocationContext();
}

uint64_t sub_1000304B0()
{
  return type metadata accessor for GATInteractionMode();
}

uint64_t sub_1000304C0()
{
  return static DummyKnowledgeSources.webSources.getter();
}

uint64_t sub_1000304D0()
{
  return GenerateTextController.init(attemptTextAssistantHandoff:)();
}

uint64_t sub_1000304F0()
{
  return type metadata accessor for GenerateTextController();
}

uint64_t sub_100030510()
{
  return GenerateTextFromMediaController.init()();
}

uint64_t sub_100030520()
{
  return type metadata accessor for GenerateTextFromMediaController();
}

uint64_t sub_100030530()
{
  return type metadata accessor for CatId();
}

uint64_t sub_100030540()
{
  return dispatch thunk of CarUtils.errorIntentDialogIfUnsupportedInCar(invocationContext:)();
}

uint64_t sub_100030550()
{
  return static CarUtils.shared.getter();
}

uint64_t sub_100030560()
{
  return type metadata accessor for CarUtils();
}

uint64_t sub_100030570()
{
  return static Constants.appBundleId.getter();
}

uint64_t sub_100030580()
{
  return type metadata accessor for DummyEnum();
}

uint64_t sub_100030590()
{
  return static Overrides.showMockWebSources.getter();
}

uint64_t sub_1000305A0()
{
  return static Overrides.disableTextCompositionConfirmation.getter();
}

uint64_t sub_1000305B0()
{
  return type metadata accessor for OSSignpostID();
}

uint64_t sub_1000305C0()
{
  return static Logger.runningBoard.getter();
}

uint64_t sub_1000305D0()
{
  return static Logger.autoBugCapture.getter();
}

uint64_t sub_1000305E0()
{
  return static Logger.richContentLoader.getter();
}

uint64_t sub_1000305F0()
{
  return static Logger.generativeResponse.getter();
}

uint64_t sub_100030600()
{
  return static Logger.genFromTextController.getter();
}

uint64_t sub_100030610()
{
  return static Logger.intent.getter();
}

uint64_t sub_100030620()
{
  return Logger.logObject.getter();
}

uint64_t sub_100030630()
{
  return type metadata accessor for Logger();
}

uint64_t sub_100030640()
{
  return type metadata accessor for OpenAIAuthenticator.Credentials();
}

uint64_t sub_100030650()
{
  return OpenAIAuthenticator.credentials.getter();
}

uint64_t sub_100030660()
{
  return static OpenAIAuthenticator.shared.getter();
}

uint64_t sub_100030680()
{
  return type metadata accessor for OpenAIAuthenticator();
}

NSDictionary sub_100030690()
{
  return Dictionary._bridgeToObjectiveC()();
}

uint64_t sub_1000306A0()
{
  return static Dictionary._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_1000306B0()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_1000306C0()
{
  return type metadata accessor for String.IntentInputOptions();
}

uint64_t sub_1000306D0()
{
  return String.LocalizationValue.init(stringLiteral:)();
}

uint64_t sub_1000306E0()
{
  return type metadata accessor for String.LocalizationValue();
}

NSString sub_1000306F0()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_100030700()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100030710()
{
  return String.init<A>(describing:)();
}

void sub_100030720(Swift::String a1)
{
}

Swift::Int sub_100030730()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_100030740()
{
  return dispatch thunk of RawRepresentable.rawValue.getter();
}

NSArray sub_100030750()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_100030760()
{
  return specialized Array._endMutation()();
}

uint64_t sub_100030770()
{
  return type metadata accessor for Bool.IntentDisplayName();
}

uint64_t sub_100030780()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_100030790()
{
  return CheckedContinuation.resume(returning:)();
}

uint64_t sub_1000307A0()
{
  return static MainActor.shared.getter();
}

uint64_t sub_1000307B0()
{
  return type metadata accessor for MainActor();
}

uint64_t sub_1000307C0()
{
  return TaskPriority.rawValue.getter();
}

uint64_t sub_1000307D0()
{
  return type metadata accessor for TaskPriority();
}

uint64_t sub_1000307E0()
{
  return static os_log_type_t.info.getter();
}

uint64_t sub_1000307F0()
{
  return static os_log_type_t.debug.getter();
}

uint64_t sub_100030800()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_100030810()
{
  return Optional<A>.asGATInteractionMode.getter();
}

uint64_t sub_100030820()
{
  return Optional<A>.asGATInterfaceIdiom.getter();
}

uint64_t sub_100030830()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_100030840()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_100030850()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_100030860()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_100030870()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_100030880()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t sub_100030890()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t sub_1000308B0()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_1000308C0()
{
  return print(_:separator:terminator:)();
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

uint64_t swift_deallocClassInstance()
{
  return _swift_deallocClassInstance();
}

uint64_t swift_endAccess()
{
  return _swift_endAccess();
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

uint64_t swift_getKeyPath()
{
  return _swift_getKeyPath();
}

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
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

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}