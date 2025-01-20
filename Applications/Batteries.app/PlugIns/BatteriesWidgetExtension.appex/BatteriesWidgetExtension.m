__n128 initializeWithTake for BatteriesWidget(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_100003F84(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_100003FA4(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)result = (a2 - 1);
    *(void *)(result + 8) = 0;
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 16) = v3;
  return result;
}

void type metadata accessor for CGSize()
{
  if (!qword_10000C090)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_10000C090);
    }
  }
}

uint64_t sub_100004024@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_100007280();
  v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);

  return v4(a1, v1, v3);
}

uint64_t sub_10000408C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_100007184(v2 + *(int *)(a1 + 20), a2);
}

uint64_t sub_1000040A0@<X0>(uint64_t a1@<X8>)
{
  sub_1000073C0();
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v6 = type metadata accessor for BasicTimelineEntry(0);
  uint64_t v7 = a1 + *(int *)(v6 + 20);
  uint64_t v8 = sub_1000073B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 1, 1, v8);
  uint64_t result = sub_100007270();
  v10 = (void *)(a1 + *(int *)(v6 + 24));
  void *v10 = v3;
  v10[1] = v5;
  return result;
}

uint64_t sub_100004148(uint64_t a1, uint64_t a2, void (*a3)(char *))
{
  uint64_t v4 = type metadata accessor for BasicTimelineEntry(0) - 8;
  __chkstk_darwin();
  uint64_t v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000073C0();
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  v11 = &v6[*(int *)(v4 + 28)];
  uint64_t v12 = sub_1000073B0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v11, 1, 1, v12);
  sub_100007270();
  v13 = &v6[*(int *)(v4 + 32)];
  *(void *)v13 = v8;
  *((void *)v13 + 1) = v10;
  a3(v6);
  return sub_100007128((uint64_t)v6);
}

uint64_t sub_100004254(uint64_t a1, uint64_t a2, void (*a3)(char *))
{
  return sub_100006DE0(a2, a3);
}

uint64_t sub_100004264(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_100004318;
  return IntentTimelineProvider.relevances()(a1, a2, a3);
}

uint64_t sub_100004318()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_10000440C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_100007238;
  return IntentTimelineProvider.relevance()(a1, a2, a3);
}

uint64_t sub_1000044C0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  v30[1] = a1;
  uint64_t v38 = a2;
  uint64_t v2 = sub_100004D78(&qword_10000C0A0);
  uint64_t v32 = *(void *)(v2 - 8);
  __chkstk_darwin();
  uint64_t v4 = (char *)v30 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100004D78(&qword_10000C0A8);
  uint64_t v33 = *(void *)(v5 - 8);
  __chkstk_darwin();
  uint64_t v7 = (char *)v30 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100004D78(&qword_10000C0B0);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v34 = v8;
  uint64_t v35 = v9;
  __chkstk_darwin();
  v11 = (char *)v30 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100004D78(&qword_10000C0B8);
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v36 = v12;
  uint64_t v37 = v13;
  __chkstk_darwin();
  v31 = (char *)v30 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100004DBC();
  type metadata accessor for BatteriesWidgetEntryView(0);
  sub_100006D7C(&qword_10000C0C8, (void (*)(uint64_t))type metadata accessor for BatteriesWidgetEntryView);
  sub_100004E1C();
  swift_bridgeObjectRetain();
  sub_100007350();
  sub_1000072B0();
  unint64_t v15 = sub_100004E70();
  sub_1000072F0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v32 + 8))(v4, v2);
  sub_1000072B0();
  uint64_t v39 = v2;
  unint64_t v40 = v15;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  sub_1000072C0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v33 + 8))(v7, v5);
  uint64_t v39 = v5;
  unint64_t v40 = OpaqueTypeConformance2;
  uint64_t v17 = swift_getOpaqueTypeConformance2();
  v18 = v31;
  uint64_t v19 = v34;
  sub_1000072E0();
  uint64_t v20 = v19;
  (*(void (**)(char *, uint64_t))(v35 + 8))(v11, v19);
  sub_100004D78(&qword_10000C0E0);
  uint64_t v21 = sub_100007340();
  uint64_t v22 = *(void *)(v21 - 8);
  uint64_t v23 = *(void *)(v22 + 72);
  unint64_t v24 = (*(unsigned __int8 *)(v22 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v22 + 80);
  uint64_t v25 = swift_allocObject();
  *(_OWORD *)(v25 + 16) = xmmword_1000075C0;
  unint64_t v26 = v25 + v24;
  v27 = *(void (**)(unint64_t, void, uint64_t))(v22 + 104);
  v27(v25 + v24, enum case for WidgetFamily.accessoryRectangular(_:), v21);
  v27(v26 + v23, enum case for WidgetFamily.accessoryCircular(_:), v21);
  uint64_t v39 = v20;
  unint64_t v40 = v17;
  swift_getOpaqueTypeConformance2();
  uint64_t v28 = v36;
  sub_1000072D0();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(char *, uint64_t))(v37 + 8))(v18, v28);
}

uint64_t sub_100004A70@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  type metadata accessor for BasicTimelineEntry(0);
  __chkstk_darwin();
  uint64_t v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100004F6C(a1, (uint64_t)v5);
  uint64_t KeyPath = swift_getKeyPath();
  *(void *)(a2 + *(int *)(type metadata accessor for BatteriesWidgetEntryView(0) + 20)) = KeyPath;
  sub_100004D78(&qword_10000C0E8);
  swift_storeEnumTagMultiPayload();
  return sub_100004FF4((uint64_t)v5, a2);
}

void sub_100004B3C(void *a1@<X8>)
{
  *a1 = 0xD000000000000020;
  a1[1] = 0x8000000100007D70;
}

uint64_t sub_100004B5C@<X0>(uint64_t a1@<X8>)
{
  return sub_1000044C0(*v1, a1);
}

uint64_t sub_100004B6C()
{
  return sub_100007320();
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

unint64_t sub_100004BC4()
{
  unint64_t result = qword_10000C098;
  if (!qword_10000C098)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C098);
  }
  return result;
}

void *initializeBufferWithCopyOfBuffer for BatteriesWidget(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for BatteriesWidget()
{
  return swift_bridgeObjectRelease();
}

void *assignWithCopy for BatteriesWidget(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *assignWithTake for BatteriesWidget(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for BatteriesWidget(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for BatteriesWidget(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)unint64_t result = a2 ^ 0x80000000;
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

ValueMetadata *type metadata accessor for BatteriesWidget()
{
  return &type metadata for BatteriesWidget;
}

uint64_t sub_100004D5C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100004D78(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_100004DBC()
{
  unint64_t result = qword_10000C0C0;
  if (!qword_10000C0C0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10000C0C0);
  }
  return result;
}

uint64_t type metadata accessor for BatteriesWidgetEntryView(uint64_t a1)
{
  return sub_100004F34(a1, (uint64_t *)&unk_10000C1F8);
}

unint64_t sub_100004E1C()
{
  unint64_t result = qword_10000C0D0;
  if (!qword_10000C0D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C0D0);
  }
  return result;
}

unint64_t sub_100004E70()
{
  unint64_t result = qword_10000C0D8;
  if (!qword_10000C0D8)
  {
    sub_100004ECC(&qword_10000C0A0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C0D8);
  }
  return result;
}

uint64_t sub_100004ECC(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t type metadata accessor for BasicTimelineEntry(uint64_t a1)
{
  return sub_100004F34(a1, (uint64_t *)&unk_10000C150);
}

uint64_t sub_100004F34(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_100004F6C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for BasicTimelineEntry(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100004FD0()
{
  return sub_1000072A0();
}

uint64_t sub_100004FF4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for BasicTimelineEntry(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t *sub_100005058(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v14 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v14 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_100007280();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_1000073B0();
    uint64_t v12 = *(void *)(v11 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11))
    {
      uint64_t v13 = sub_100004D78(&qword_10000C0F0);
      memcpy(v9, v10, *(void *)(*(void *)(v13 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v9, v10, v11);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
    }
    *(_OWORD *)((char *)a1 + *(int *)(a3 + 24)) = *(_OWORD *)((char *)a2 + *(int *)(a3 + 24));
  }
  return a1;
}

uint64_t sub_10000520C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100007280();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  uint64_t v5 = a1 + *(int *)(a2 + 20);
  uint64_t v6 = sub_1000073B0();
  uint64_t v9 = *(void *)(v6 - 8);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(v5, 1, v6);
  if (!result)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t))(v9 + 8);
    return v8(v5, v6);
  }
  return result;
}

uint64_t sub_10000530C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100007280();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (const void *)(a2 + v7);
  uint64_t v10 = sub_1000073B0();
  uint64_t v11 = *(void *)(v10 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
  {
    uint64_t v12 = sub_100004D78(&qword_10000C0F0);
    memcpy(v8, v9, *(void *)(*(void *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v11 + 16))(v8, v9, v10);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  *(_OWORD *)(a1 + *(int *)(a3 + 24)) = *(_OWORD *)(a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t sub_100005470(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100007280();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  uint64_t v10 = sub_1000073B0();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v11 + 48);
  int v13 = v12(v8, 1, v10);
  int v14 = v12(v9, 1, v10);
  if (!v13)
  {
    if (!v14)
    {
      (*(void (**)(void *, void *, uint64_t))(v11 + 24))(v8, v9, v10);
      goto LABEL_7;
    }
    (*(void (**)(void *, uint64_t))(v11 + 8))(v8, v10);
    goto LABEL_6;
  }
  if (v14)
  {
LABEL_6:
    uint64_t v15 = sub_100004D78(&qword_10000C0F0);
    memcpy(v8, v9, *(void *)(*(void *)(v15 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v11 + 16))(v8, v9, v10);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
LABEL_7:
  uint64_t v16 = *(int *)(a3 + 24);
  uint64_t v17 = (void *)(a1 + v16);
  v18 = (void *)(a2 + v16);
  *uint64_t v17 = *v18;
  v17[1] = v18[1];
  return a1;
}

uint64_t sub_100005648(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100007280();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (const void *)(a2 + v7);
  uint64_t v10 = sub_1000073B0();
  uint64_t v11 = *(void *)(v10 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
  {
    uint64_t v12 = sub_100004D78(&qword_10000C0F0);
    memcpy(v8, v9, *(void *)(*(void *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v11 + 32))(v8, v9, v10);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  *(_OWORD *)(a1 + *(int *)(a3 + 24)) = *(_OWORD *)(a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t sub_1000057AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100007280();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  uint64_t v10 = sub_1000073B0();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v11 + 48);
  int v13 = v12(v8, 1, v10);
  int v14 = v12(v9, 1, v10);
  if (!v13)
  {
    if (!v14)
    {
      (*(void (**)(void *, void *, uint64_t))(v11 + 40))(v8, v9, v10);
      goto LABEL_7;
    }
    (*(void (**)(void *, uint64_t))(v11 + 8))(v8, v10);
    goto LABEL_6;
  }
  if (v14)
  {
LABEL_6:
    uint64_t v15 = sub_100004D78(&qword_10000C0F0);
    memcpy(v8, v9, *(void *)(*(void *)(v15 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v11 + 32))(v8, v9, v10);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
LABEL_7:
  *(_OWORD *)(a1 + *(int *)(a3 + 24)) = *(_OWORD *)(a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t sub_100005974(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100005988);
}

uint64_t sub_100005988(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_10000688C(a1, a2, a3, (uint64_t (*)(void))&type metadata accessor for Date, &qword_10000C0F0);
}

uint64_t sub_1000059A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000059BC);
}

uint64_t sub_1000059BC(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  return sub_1000069C0(a1, a2, a3, a4, (uint64_t (*)(void))&type metadata accessor for Date, &qword_10000C0F0);
}

void sub_1000059DC()
{
  sub_100007280();
  if (v0 <= 0x3F)
  {
    sub_100006BD0(319, (unint64_t *)&unk_10000C160, (uint64_t (*)(uint64_t))&type metadata accessor for TimelineEntryRelevance, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

ValueMetadata *type metadata accessor for Provider()
{
  return &type metadata for Provider;
}

uint64_t *sub_100005AEC(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v15 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v15 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_100007280();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = type metadata accessor for BasicTimelineEntry(0);
    uint64_t v9 = *(int *)(v8 + 20);
    uint64_t v10 = (char *)a1 + v9;
    uint64_t v11 = (char *)a2 + v9;
    uint64_t v12 = sub_1000073B0();
    uint64_t v13 = *(void *)(v12 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12))
    {
      uint64_t v14 = sub_100004D78(&qword_10000C0F0);
      memcpy(v10, v11, *(void *)(*(void *)(v14 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v10, v11, v12);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
    }
    *(_OWORD *)((char *)a1 + *(int *)(v8 + 24)) = *(_OWORD *)((char *)a2 + *(int *)(v8 + 24));
    uint64_t v16 = *(int *)(a3 + 20);
    uint64_t v17 = (uint64_t *)((char *)a1 + v16);
    v18 = (uint64_t *)((char *)a2 + v16);
    sub_100004D78(&qword_10000C0E8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v19 = sub_100007340();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v19 - 8) + 16))(v17, v18, v19);
    }
    else
    {
      *uint64_t v17 = *v18;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_100005D44(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100007280();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  uint64_t v5 = a1 + *(int *)(type metadata accessor for BasicTimelineEntry(0) + 20);
  uint64_t v6 = sub_1000073B0();
  uint64_t v7 = *(void *)(v6 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6)) {
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v5, v6);
  }
  uint64_t v8 = (uint64_t *)(a1 + *(int *)(a2 + 20));
  sub_100004D78(&qword_10000C0E8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v9 = sub_100007340();
    uint64_t v10 = *(uint64_t (**)(uint64_t *, uint64_t))(*(void *)(v9 - 8) + 8);
    return v10(v8, v9);
  }
  else
  {
    uint64_t v12 = *v8;
    return _swift_release(v12);
  }
}

uint64_t sub_100005EC8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100007280();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = type metadata accessor for BasicTimelineEntry(0);
  uint64_t v8 = *(int *)(v7 + 20);
  uint64_t v9 = (void *)(a1 + v8);
  uint64_t v10 = (const void *)(a2 + v8);
  uint64_t v11 = sub_1000073B0();
  uint64_t v12 = *(void *)(v11 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11))
  {
    uint64_t v13 = sub_100004D78(&qword_10000C0F0);
    memcpy(v9, v10, *(void *)(*(void *)(v13 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v12 + 16))(v9, v10, v11);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
  }
  *(_OWORD *)(a1 + *(int *)(v7 + 24)) = *(_OWORD *)(a2 + *(int *)(v7 + 24));
  uint64_t v14 = *(int *)(a3 + 20);
  uint64_t v15 = (void *)(a1 + v14);
  uint64_t v16 = (void *)(a2 + v14);
  sub_100004D78(&qword_10000C0E8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v17 = sub_100007340();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v17 - 8) + 16))(v15, v16, v17);
  }
  else
  {
    *uint64_t v15 = *v16;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t sub_1000060C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_100007280();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 24))(a1, a2, v5);
  uint64_t v6 = type metadata accessor for BasicTimelineEntry(0);
  uint64_t v7 = *(int *)(v6 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  uint64_t v10 = sub_1000073B0();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v11 + 48);
  int v13 = v12(v8, 1, v10);
  int v14 = v12(v9, 1, v10);
  if (v13)
  {
    if (!v14)
    {
      (*(void (**)(void *, void *, uint64_t))(v11 + 16))(v8, v9, v10);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v14)
  {
    (*(void (**)(void *, uint64_t))(v11 + 8))(v8, v10);
LABEL_6:
    uint64_t v15 = sub_100004D78(&qword_10000C0F0);
    memcpy(v8, v9, *(void *)(*(void *)(v15 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v11 + 24))(v8, v9, v10);
LABEL_7:
  uint64_t v16 = *(int *)(v6 + 24);
  uint64_t v17 = (void *)(a1 + v16);
  v18 = (void *)(a2 + v16);
  *uint64_t v17 = *v18;
  v17[1] = v18[1];
  if (a1 != a2)
  {
    uint64_t v19 = *(int *)(a3 + 20);
    uint64_t v20 = (void *)(a1 + v19);
    uint64_t v21 = (void *)(a2 + v19);
    sub_100006358(a1 + v19);
    sub_100004D78(&qword_10000C0E8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v22 = sub_100007340();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v22 - 8) + 16))(v20, v21, v22);
    }
    else
    {
      *uint64_t v20 = *v21;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_100006358(uint64_t a1)
{
  uint64_t v2 = sub_100004D78(&qword_10000C0E8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1000063B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100007280();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = type metadata accessor for BasicTimelineEntry(0);
  uint64_t v8 = *(int *)(v7 + 20);
  uint64_t v9 = (void *)(a1 + v8);
  uint64_t v10 = (const void *)(a2 + v8);
  uint64_t v11 = sub_1000073B0();
  uint64_t v12 = *(void *)(v11 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11))
  {
    uint64_t v13 = sub_100004D78(&qword_10000C0F0);
    memcpy(v9, v10, *(void *)(*(void *)(v13 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v12 + 32))(v9, v10, v11);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
  }
  *(_OWORD *)(a1 + *(int *)(v7 + 24)) = *(_OWORD *)(a2 + *(int *)(v7 + 24));
  uint64_t v14 = *(int *)(a3 + 20);
  uint64_t v15 = (void *)(a1 + v14);
  uint64_t v16 = (const void *)(a2 + v14);
  uint64_t v17 = sub_100004D78(&qword_10000C0E8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v18 = sub_100007340();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v18 - 8) + 32))(v15, v16, v18);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v15, v16, *(void *)(*(void *)(v17 - 8) + 64));
  }
  return a1;
}

uint64_t sub_1000065C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_100007280();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 40))(a1, a2, v5);
  uint64_t v6 = type metadata accessor for BasicTimelineEntry(0);
  uint64_t v7 = *(int *)(v6 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  uint64_t v10 = sub_1000073B0();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v11 + 48);
  int v13 = v12(v8, 1, v10);
  int v14 = v12(v9, 1, v10);
  if (v13)
  {
    if (!v14)
    {
      (*(void (**)(void *, void *, uint64_t))(v11 + 32))(v8, v9, v10);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v14)
  {
    (*(void (**)(void *, uint64_t))(v11 + 8))(v8, v10);
LABEL_6:
    uint64_t v15 = sub_100004D78(&qword_10000C0F0);
    memcpy(v8, v9, *(void *)(*(void *)(v15 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v11 + 40))(v8, v9, v10);
LABEL_7:
  *(_OWORD *)(a1 + *(int *)(v6 + 24)) = *(_OWORD *)(a2 + *(int *)(v6 + 24));
  if (a1 != a2)
  {
    uint64_t v16 = *(int *)(a3 + 20);
    uint64_t v17 = (void *)(a1 + v16);
    uint64_t v18 = (const void *)(a2 + v16);
    sub_100006358(a1 + v16);
    uint64_t v19 = sub_100004D78(&qword_10000C0E8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v20 = sub_100007340();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v20 - 8) + 32))(v17, v18, v20);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v17, v18, *(void *)(*(void *)(v19 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_100006858(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10000686C);
}

uint64_t sub_10000686C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_10000688C(a1, a2, a3, type metadata accessor for BasicTimelineEntry, &qword_10000C198);
}

uint64_t sub_10000688C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void), uint64_t *a5)
{
  uint64_t v9 = a4(0);
  uint64_t v10 = *(void *)(v9 - 8);
  if (*(_DWORD *)(v10 + 84) == a2)
  {
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v10 + 48);
    return v11(a1, a2, v9);
  }
  else
  {
    uint64_t v13 = sub_100004D78(a5);
    int v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 48);
    uint64_t v15 = v13;
    uint64_t v16 = a1 + *(int *)(a3 + 20);
    return v14(v16, a2, v15);
  }
}

uint64_t sub_10000698C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000069A0);
}

uint64_t sub_1000069A0(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  return sub_1000069C0(a1, a2, a3, a4, type metadata accessor for BasicTimelineEntry, &qword_10000C198);
}

uint64_t sub_1000069C0(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t (*a5)(void), uint64_t *a6)
{
  uint64_t v11 = a5(0);
  uint64_t v12 = *(void *)(v11 - 8);
  if (*(_DWORD *)(v12 + 84) == a3)
  {
    uint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v12 + 56);
    return v13(a1, a2, a2, v11);
  }
  else
  {
    uint64_t v15 = sub_100004D78(a6);
    uint64_t v16 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56);
    uint64_t v17 = v15;
    uint64_t v18 = a1 + *(int *)(a4 + 20);
    return v16(v18, a2, a2, v17);
  }
}

void sub_100006AD8()
{
  type metadata accessor for BasicTimelineEntry(319);
  if (v0 <= 0x3F)
  {
    sub_100006BD0(319, (unint64_t *)&unk_10000C208, (uint64_t (*)(uint64_t))&type metadata accessor for WidgetFamily, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Environment.Content);
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void sub_100006BD0(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v7 = a3(255);
    unint64_t v8 = a4(a1, v7);
    if (!v9) {
      atomic_store(v8, a2);
    }
  }
}

uint64_t sub_100006C34()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100006D34()
{
  return sub_100006D7C(qword_10000C238, (void (*)(uint64_t))type metadata accessor for BasicTimelineEntry);
}

uint64_t sub_100006D7C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100006DC4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100006DE0(uint64_t a1, void (*a2)(char *))
{
  uint64_t v20 = a2;
  sub_100007370();
  __chkstk_darwin();
  sub_100004D78(&qword_10000C0F0);
  __chkstk_darwin();
  uint64_t v3 = (char *)&v19 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100004D78(&qword_10000C250);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin();
  uint64_t v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100004D78(&qword_10000C258);
  uint64_t v8 = type metadata accessor for BasicTimelineEntry(0);
  unint64_t v9 = (*(unsigned __int8 *)(*(void *)(v8 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v8 - 8) + 80);
  uint64_t v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_1000075D0;
  unint64_t v11 = v10 + v9;
  sub_1000073C0();
  uint64_t v13 = v12;
  uint64_t v15 = v14;
  uint64_t v16 = sub_1000073B0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v3, 1, 1, v16);
  sub_100007270();
  sub_1000070C0((uint64_t)v3, v11 + *(int *)(v8 + 20));
  uint64_t v17 = (void *)(v11 + *(int *)(v8 + 24));
  *uint64_t v17 = v13;
  v17[1] = v15;
  sub_100007360();
  sub_100006D7C(qword_10000C238, (void (*)(uint64_t))type metadata accessor for BasicTimelineEntry);
  sub_1000073D0();
  v20(v7);
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t sub_1000070C0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100004D78(&qword_10000C0F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100007128(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for BasicTimelineEntry(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100007184(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100004D78(&qword_10000C0F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000071EC()
{
  return sub_100006D7C(&qword_10000C260, (void (*)(uint64_t))&type metadata accessor for BatteryArchivableView);
}

uint64_t sub_10000723C()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t sub_100007270()
{
  return Date.init()();
}

uint64_t sub_100007280()
{
  return type metadata accessor for Date();
}

uint64_t sub_100007290()
{
  return BatteryArchivableView.init()();
}

uint64_t sub_1000072A0()
{
  return EnvironmentValues.widgetFamily.getter();
}

uint64_t sub_1000072B0()
{
  return LocalizedStringKey.init(stringLiteral:)();
}

uint64_t sub_1000072C0()
{
  return WidgetConfiguration.description(_:)();
}

uint64_t sub_1000072D0()
{
  return WidgetConfiguration.supportedFamilies(_:)();
}

uint64_t sub_1000072E0()
{
  return WidgetConfiguration.supportsInteraction(_:)();
}

uint64_t sub_1000072F0()
{
  return WidgetConfiguration.configurationDisplayName(_:)();
}

uint64_t sub_100007300()
{
  return static View._makeView(view:inputs:)();
}

uint64_t sub_100007310()
{
  return static View._makeViewList(view:inputs:)();
}

uint64_t sub_100007320()
{
  return static View._viewListCount(inputs:)();
}

uint64_t sub_100007330()
{
  return static Widget.main()();
}

uint64_t sub_100007340()
{
  return type metadata accessor for WidgetFamily();
}

uint64_t sub_100007350()
{
  return IntentConfiguration.init<A>(kind:intent:provider:content:)();
}

uint64_t sub_100007360()
{
  return static TimelineReloadPolicy.never.getter();
}

uint64_t sub_100007370()
{
  return type metadata accessor for TimelineReloadPolicy();
}

uint64_t sub_100007390()
{
  return IntentTimelineProvider.recommendations()();
}

uint64_t sub_1000073B0()
{
  return type metadata accessor for TimelineEntryRelevance();
}

uint64_t sub_1000073C0()
{
  return TimelineProviderContext.displaySize.getter();
}

uint64_t sub_1000073D0()
{
  return Timeline.init(entries:policy:)();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

uint64_t self
{
  return _self;
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return _swift_getEnumCaseMultiPayload();
}

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
}

uint64_t swift_getKeyPath()
{
  return _swift_getKeyPath();
}

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
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

uint64_t swift_retain()
{
  return _swift_retain();
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