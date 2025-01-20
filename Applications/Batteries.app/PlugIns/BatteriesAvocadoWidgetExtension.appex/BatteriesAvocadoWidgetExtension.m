uint64_t sub_100002A80()
{
  sub_100002B98();
  return sub_100006E70();
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

unint64_t sub_100002B18()
{
  unint64_t result = qword_10000C0A0;
  if (!qword_10000C0A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C0A0);
  }
  return result;
}

ValueMetadata *type metadata accessor for BatteriesAvocadoWidgetBundle()
{
  return &type metadata for BatteriesAvocadoWidgetBundle;
}

uint64_t sub_100002B7C()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_100002B98()
{
  unint64_t result = qword_10000C0A8;
  if (!qword_10000C0A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C0A8);
  }
  return result;
}

uint64_t sub_100002BEC()
{
  return swift_getOpaqueTypeConformance2();
}

__n128 initializeWithTake for BatteriesAvocadoWidget(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_100002C48(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_100002C68(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)__n128 result = (a2 - 1);
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
  if (!qword_10000C0B0)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_10000C0B0);
    }
  }
}

void *initializeBufferWithCopyOfBuffer for BatteriesAvocadoWidget(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for BatteriesAvocadoWidget()
{
  return swift_bridgeObjectRelease();
}

void *assignWithCopy for BatteriesAvocadoWidget(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *assignWithTake for BatteriesAvocadoWidget(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for BatteriesAvocadoWidget(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for BatteriesAvocadoWidget(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for BatteriesAvocadoWidget()
{
  return &type metadata for BatteriesAvocadoWidget;
}

uint64_t sub_100002E2C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100002E48@<X0>(uint64_t a1@<X8>)
{
  sub_100006FD0();
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  v6 = (int *)type metadata accessor for BatteriesAvocadoEntry(0);
  sub_100006FE0();
  char v7 = sub_100006FF0();
  uint64_t v8 = a1 + v6[5];
  uint64_t v9 = sub_100006FC0();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v8, 1, 1, v9);
  uint64_t result = sub_100006DD0();
  v11 = (void *)(a1 + v6[6]);
  void *v11 = v3;
  v11[1] = v5;
  *(unsigned char *)(a1 + v6[8]) = v7 & 1;
  return result;
}

uint64_t sub_100002F10(uint64_t a1, void (*a2)(char *))
{
  uint64_t v3 = (int *)(type metadata accessor for BatteriesAvocadoEntry(0) - 8);
  __chkstk_darwin();
  uint64_t v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100006FD0();
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  sub_100006FE0();
  char v10 = sub_100006FF0();
  v11 = &v5[v3[7]];
  uint64_t v12 = sub_100006FC0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v11, 1, 1, v12);
  sub_100006DD0();
  v13 = &v5[v3[8]];
  *(void *)v13 = v7;
  *((void *)v13 + 1) = v9;
  v5[v3[10]] = v10 & 1;
  a2(v5);
  return sub_100006484((uint64_t)v5);
}

uint64_t sub_100003040(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_1000030F4;
  return TimelineProvider.relevances()(a1, a2, a3);
}

uint64_t sub_1000030F4()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_1000031E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_1000065CC;
  return TimelineProvider.relevance()(a1, a2, a3);
}

uint64_t sub_10000329C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_100006DE0();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);

  return v4(a1, v1, v3);
}

uint64_t sub_100003304@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1000064E0(v2 + *(int *)(a1 + 20), a2);
}

uint64_t sub_100003314@<X0>(uint64_t a1@<X8>)
{
  uint64_t v59 = a1;
  uint64_t v1 = sub_100006F50();
  uint64_t v55 = *(void *)(v1 - 8);
  uint64_t v56 = v1;
  __chkstk_darwin();
  v53 = (char *)&v44 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100003B28(&qword_10000C0B8);
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v46 = v3;
  uint64_t v47 = v4;
  __chkstk_darwin();
  uint64_t v6 = (char *)&v44 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100003B28(&qword_10000C0C0);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v48 = v7;
  uint64_t v49 = v8;
  __chkstk_darwin();
  char v10 = (char *)&v44 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_100003B28(&qword_10000C0C8);
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v50 = v11;
  uint64_t v51 = v12;
  __chkstk_darwin();
  v44 = (char *)&v44 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v52 = sub_100003B28(&qword_10000C0D0);
  uint64_t v54 = *(void *)(v52 - 8);
  __chkstk_darwin();
  v45 = (char *)&v44 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_100003B28(&qword_10000C0D8);
  uint64_t v57 = *(void *)(v15 - 8);
  uint64_t v58 = v15;
  __chkstk_darwin();
  v17 = (char *)&v44 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for BatteriesAvocadoWidgetEntryView(0);
  sub_100005A9C(&qword_10000C0E0, (void (*)(uint64_t))type metadata accessor for BatteriesAvocadoWidgetEntryView);
  sub_100003B8C();
  swift_bridgeObjectRetain();
  sub_100006F90();
  sub_100003B28(&qword_10000C0F0);
  uint64_t v18 = sub_100006F60();
  uint64_t v19 = *(void *)(v18 - 8);
  uint64_t v20 = *(void *)(v19 + 72);
  unint64_t v21 = (*(unsigned __int8 *)(v19 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
  uint64_t v22 = swift_allocObject();
  *(_OWORD *)(v22 + 16) = xmmword_1000072A0;
  unint64_t v23 = v22 + v21;
  v24 = *(void (**)(unint64_t, void, uint64_t))(v19 + 104);
  v24(v23, enum case for WidgetFamily.systemSmall(_:), v18);
  v24(v23 + v20, enum case for WidgetFamily.systemMedium(_:), v18);
  unint64_t v25 = v23 + 2 * v20;
  v26 = v17;
  v24(v25, enum case for WidgetFamily.systemLarge(_:), v18);
  uint64_t v27 = sub_100006584(&qword_10000C0F8, &qword_10000C0B8);
  uint64_t v28 = v46;
  sub_100006E90();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v47 + 8))(v6, v28);
  uint64_t v60 = v28;
  uint64_t v61 = v27;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  v30 = v44;
  uint64_t v31 = v48;
  sub_100006EA0();
  uint64_t v32 = v31;
  (*(void (**)(char *, uint64_t))(v49 + 8))(v10, v31);
  uint64_t v34 = v55;
  uint64_t v33 = v56;
  v35 = v53;
  (*(void (**)(char *, void, uint64_t))(v55 + 104))(v53, enum case for WidgetBackgroundStyle.blur(_:), v56);
  uint64_t v60 = v32;
  uint64_t v61 = OpaqueTypeConformance2;
  uint64_t v36 = swift_getOpaqueTypeConformance2();
  v37 = v45;
  uint64_t v38 = v50;
  sub_100006EC0();
  (*(void (**)(char *, uint64_t))(v34 + 8))(v35, v33);
  (*(void (**)(char *, uint64_t))(v51 + 8))(v30, v38);
  sub_100006E60();
  uint64_t v60 = v38;
  uint64_t v61 = v36;
  uint64_t v39 = swift_getOpaqueTypeConformance2();
  uint64_t v40 = v52;
  sub_100006EB0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v54 + 8))(v37, v40);
  id v41 = [self currentDevice];
  [v41 userInterfaceIdiom];

  sub_100006E60();
  uint64_t v60 = v40;
  uint64_t v61 = v39;
  swift_getOpaqueTypeConformance2();
  uint64_t v42 = v58;
  sub_100006E80();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(char *, uint64_t))(v57 + 8))(v26, v42);
}

uint64_t sub_100003AF8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_100003C28(a1, a2);
}

void sub_100003B00(void *a1@<X8>)
{
  *a1 = 0xD000000000000016;
  a1[1] = 0x80000001000072C0;
}

uint64_t sub_100003B20@<X0>(uint64_t a1@<X8>)
{
  return sub_100003314(a1);
}

uint64_t sub_100003B28(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t type metadata accessor for BatteriesAvocadoWidgetEntryView(uint64_t a1)
{
  return sub_100003CAC(a1, qword_10000C208);
}

unint64_t sub_100003B8C()
{
  unint64_t result = qword_10000C0E8;
  if (!qword_10000C0E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C0E8);
  }
  return result;
}

uint64_t sub_100003BE0(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100003C28(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for BatteriesAvocadoEntry(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t type metadata accessor for BatteriesAvocadoEntry(uint64_t a1)
{
  return sub_100003CAC(a1, (uint64_t *)&unk_10000C160);
}

uint64_t sub_100003CAC(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void *sub_100003CE4(void *a1, void *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v14 = *a2;
    *a1 = *a2;
    a1 = (void *)(v14 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_100006DE0();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = a3[5];
    uint64_t v9 = (char *)a1 + v8;
    char v10 = (char *)a2 + v8;
    uint64_t v11 = sub_100006FC0();
    uint64_t v12 = *(void *)(v11 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11))
    {
      uint64_t v13 = sub_100003B28(&qword_10000C100);
      memcpy(v9, v10, *(void *)(*(void *)(v13 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v9, v10, v11);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
    }
    uint64_t v15 = a3[7];
    *(_OWORD *)((char *)a1 + a3[6]) = *(_OWORD *)((char *)a2 + a3[6]);
    uint64_t v16 = (char *)a1 + v15;
    v17 = (char *)a2 + v15;
    uint64_t v18 = sub_100006F60();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v18 - 8) + 16))(v16, v17, v18);
    *((unsigned char *)a1 + a3[8]) = *((unsigned char *)a2 + a3[8]);
  }
  return a1;
}

uint64_t sub_100003EE8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100006DE0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  uint64_t v5 = a1 + *(int *)(a2 + 20);
  uint64_t v6 = sub_100006FC0();
  uint64_t v7 = *(void *)(v6 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6)) {
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v5, v6);
  }
  uint64_t v8 = a1 + *(int *)(a2 + 28);
  uint64_t v9 = sub_100006F60();
  char v10 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8);

  return v10(v8, v9);
}

uint64_t sub_10000401C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_100006DE0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (const void *)(a2 + v7);
  uint64_t v10 = sub_100006FC0();
  uint64_t v11 = *(void *)(v10 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
  {
    uint64_t v12 = sub_100003B28(&qword_10000C100);
    memcpy(v8, v9, *(void *)(*(void *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v11 + 16))(v8, v9, v10);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  uint64_t v13 = a3[7];
  *(_OWORD *)(a1 + a3[6]) = *(_OWORD *)(a2 + a3[6]);
  uint64_t v14 = a1 + v13;
  uint64_t v15 = a2 + v13;
  uint64_t v16 = sub_100006F60();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 16))(v14, v15, v16);
  *(unsigned char *)(a1 + a3[8]) = *(unsigned char *)(a2 + a3[8]);
  return a1;
}

uint64_t sub_1000041D0(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_100006DE0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  uint64_t v10 = sub_100006FC0();
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
    uint64_t v15 = sub_100003B28(&qword_10000C100);
    memcpy(v8, v9, *(void *)(*(void *)(v15 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v11 + 16))(v8, v9, v10);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
LABEL_7:
  uint64_t v16 = a3[6];
  v17 = (void *)(a1 + v16);
  uint64_t v18 = (void *)(a2 + v16);
  void *v17 = *v18;
  v17[1] = v18[1];
  uint64_t v19 = a3[7];
  uint64_t v20 = a1 + v19;
  uint64_t v21 = a2 + v19;
  uint64_t v22 = sub_100006F60();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 24))(v20, v21, v22);
  *(unsigned char *)(a1 + a3[8]) = *(unsigned char *)(a2 + a3[8]);
  return a1;
}

uint64_t sub_1000043FC(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_100006DE0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (const void *)(a2 + v7);
  uint64_t v10 = sub_100006FC0();
  uint64_t v11 = *(void *)(v10 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
  {
    uint64_t v12 = sub_100003B28(&qword_10000C100);
    memcpy(v8, v9, *(void *)(*(void *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v11 + 32))(v8, v9, v10);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  uint64_t v13 = a3[7];
  *(_OWORD *)(a1 + a3[6]) = *(_OWORD *)(a2 + a3[6]);
  uint64_t v14 = a1 + v13;
  uint64_t v15 = a2 + v13;
  uint64_t v16 = sub_100006F60();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 32))(v14, v15, v16);
  *(unsigned char *)(a1 + a3[8]) = *(unsigned char *)(a2 + a3[8]);
  return a1;
}

uint64_t sub_1000045B0(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_100006DE0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  uint64_t v10 = sub_100006FC0();
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
    uint64_t v15 = sub_100003B28(&qword_10000C100);
    memcpy(v8, v9, *(void *)(*(void *)(v15 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v11 + 32))(v8, v9, v10);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
LABEL_7:
  uint64_t v16 = a3[7];
  *(_OWORD *)(a1 + a3[6]) = *(_OWORD *)(a2 + a3[6]);
  uint64_t v17 = a1 + v16;
  uint64_t v18 = a2 + v16;
  uint64_t v19 = sub_100006F60();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 40))(v17, v18, v19);
  *(unsigned char *)(a1 + a3[8]) = *(unsigned char *)(a2 + a3[8]);
  return a1;
}

uint64_t sub_1000047C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000047DC);
}

uint64_t sub_1000047DC(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_100006DE0();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v10 = a1;
  }
  else
  {
    uint64_t v11 = sub_100003B28(&qword_10000C100);
    if (*(_DWORD *)(*(void *)(v11 - 8) + 84) == a2)
    {
      uint64_t v8 = v11;
      uint64_t v12 = *(void *)(v11 - 8);
      uint64_t v13 = a3[5];
    }
    else
    {
      uint64_t v14 = sub_100006F60();
      if (*(_DWORD *)(*(void *)(v14 - 8) + 84) != a2)
      {
        unsigned int v16 = *(unsigned __int8 *)(a1 + a3[8]);
        if (v16 >= 2) {
          return ((v16 + 2147483646) & 0x7FFFFFFF) + 1;
        }
        else {
          return 0;
        }
      }
      uint64_t v8 = v14;
      uint64_t v12 = *(void *)(v14 - 8);
      uint64_t v13 = a3[7];
    }
    uint64_t v10 = a1 + v13;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
  }

  return v9(v10, a2, v8);
}

uint64_t sub_100004950(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100004964);
}

uint64_t sub_100004964(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t v8 = sub_100006DE0();
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v12 = a1;
  }
  else
  {
    uint64_t v13 = sub_100003B28(&qword_10000C100);
    if (*(_DWORD *)(*(void *)(v13 - 8) + 84) == a3)
    {
      uint64_t v10 = v13;
      uint64_t v14 = *(void *)(v13 - 8);
      uint64_t v15 = a4[5];
    }
    else
    {
      uint64_t result = sub_100006F60();
      if (*(_DWORD *)(*(void *)(result - 8) + 84) != a3)
      {
        *(unsigned char *)(a1 + a4[8]) = a2 + 1;
        return result;
      }
      uint64_t v10 = result;
      uint64_t v14 = *(void *)(result - 8);
      uint64_t v15 = a4[7];
    }
    uint64_t v12 = a1 + v15;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
  }

  return v11(v12, a2, a2, v10);
}

void sub_100004AC4()
{
  sub_100006DE0();
  if (v0 <= 0x3F)
  {
    sub_100004BD8();
    if (v1 <= 0x3F)
    {
      sub_100006F60();
      if (v2 <= 0x3F) {
        swift_initStructMetadata();
      }
    }
  }
}

void sub_100004BD8()
{
  if (!qword_10000C170)
  {
    sub_100006FC0();
    unint64_t v0 = sub_100007010();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_10000C170);
    }
  }
}

ValueMetadata *type metadata accessor for Provider()
{
  return &type metadata for Provider;
}

void *sub_100004C40(void *a1, void *a2)
{
  uint64_t v4 = type metadata accessor for BatteriesAvocadoEntry(0);
  int v5 = *(_DWORD *)(*(void *)(v4 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v14 = *a2;
    *a1 = *a2;
    a1 = (void *)(v14 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v6 = (int *)v4;
    uint64_t v7 = sub_100006DE0();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = v6[5];
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_100006FC0();
    uint64_t v12 = *(void *)(v11 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11))
    {
      uint64_t v13 = sub_100003B28(&qword_10000C100);
      memcpy(v9, v10, *(void *)(*(void *)(v13 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v9, v10, v11);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
    }
    *(_OWORD *)((char *)a1 + v6[6]) = *(_OWORD *)((char *)a2 + v6[6]);
    uint64_t v15 = v6[7];
    unsigned int v16 = (char *)a1 + v15;
    uint64_t v17 = (char *)a2 + v15;
    uint64_t v18 = sub_100006F60();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v18 - 8) + 16))(v16, v17, v18);
    *((unsigned char *)a1 + v6[8]) = *((unsigned char *)a2 + v6[8]);
  }
  return a1;
}

uint64_t sub_100004E50(uint64_t a1)
{
  uint64_t v2 = sub_100006DE0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  uint64_t v3 = type metadata accessor for BatteriesAvocadoEntry(0);
  uint64_t v4 = a1 + *(int *)(v3 + 20);
  uint64_t v5 = sub_100006FC0();
  uint64_t v6 = *(void *)(v5 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5)) {
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  }
  uint64_t v7 = a1 + *(int *)(v3 + 28);
  uint64_t v8 = sub_100006F60();
  uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8);

  return v9(v7, v8);
}

uint64_t sub_100004F8C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100006DE0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
  uint64_t v5 = (int *)type metadata accessor for BatteriesAvocadoEntry(0);
  uint64_t v6 = v5[5];
  uint64_t v7 = (void *)(a1 + v6);
  uint64_t v8 = (const void *)(a2 + v6);
  uint64_t v9 = sub_100006FC0();
  uint64_t v10 = *(void *)(v9 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9))
  {
    uint64_t v11 = sub_100003B28(&qword_10000C100);
    memcpy(v7, v8, *(void *)(*(void *)(v11 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v10 + 16))(v7, v8, v9);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  }
  *(_OWORD *)(a1 + v5[6]) = *(_OWORD *)(a2 + v5[6]);
  uint64_t v12 = v5[7];
  uint64_t v13 = a1 + v12;
  uint64_t v14 = a2 + v12;
  uint64_t v15 = sub_100006F60();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 16))(v13, v14, v15);
  *(unsigned char *)(a1 + v5[8]) = *(unsigned char *)(a2 + v5[8]);
  return a1;
}

uint64_t sub_10000514C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100006DE0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a1, a2, v4);
  uint64_t v5 = (int *)type metadata accessor for BatteriesAvocadoEntry(0);
  uint64_t v6 = v5[5];
  uint64_t v7 = (void *)(a1 + v6);
  uint64_t v8 = (void *)(a2 + v6);
  uint64_t v9 = sub_100006FC0();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v10 + 48);
  int v12 = v11(v7, 1, v9);
  int v13 = v11(v8, 1, v9);
  if (!v12)
  {
    if (!v13)
    {
      (*(void (**)(void *, void *, uint64_t))(v10 + 24))(v7, v8, v9);
      goto LABEL_7;
    }
    (*(void (**)(void *, uint64_t))(v10 + 8))(v7, v9);
    goto LABEL_6;
  }
  if (v13)
  {
LABEL_6:
    uint64_t v14 = sub_100003B28(&qword_10000C100);
    memcpy(v7, v8, *(void *)(*(void *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v10 + 16))(v7, v8, v9);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
LABEL_7:
  uint64_t v15 = v5[6];
  unsigned int v16 = (void *)(a1 + v15);
  uint64_t v17 = (void *)(a2 + v15);
  *unsigned int v16 = *v17;
  v16[1] = v17[1];
  uint64_t v18 = v5[7];
  uint64_t v19 = a1 + v18;
  uint64_t v20 = a2 + v18;
  uint64_t v21 = sub_100006F60();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 24))(v19, v20, v21);
  *(unsigned char *)(a1 + v5[8]) = *(unsigned char *)(a2 + v5[8]);
  return a1;
}

uint64_t sub_100005380(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100006DE0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
  uint64_t v5 = (int *)type metadata accessor for BatteriesAvocadoEntry(0);
  uint64_t v6 = v5[5];
  uint64_t v7 = (void *)(a1 + v6);
  uint64_t v8 = (const void *)(a2 + v6);
  uint64_t v9 = sub_100006FC0();
  uint64_t v10 = *(void *)(v9 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9))
  {
    uint64_t v11 = sub_100003B28(&qword_10000C100);
    memcpy(v7, v8, *(void *)(*(void *)(v11 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v10 + 32))(v7, v8, v9);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  }
  *(_OWORD *)(a1 + v5[6]) = *(_OWORD *)(a2 + v5[6]);
  uint64_t v12 = v5[7];
  uint64_t v13 = a1 + v12;
  uint64_t v14 = a2 + v12;
  uint64_t v15 = sub_100006F60();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 32))(v13, v14, v15);
  *(unsigned char *)(a1 + v5[8]) = *(unsigned char *)(a2 + v5[8]);
  return a1;
}

uint64_t sub_100005540(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100006DE0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a1, a2, v4);
  uint64_t v5 = (int *)type metadata accessor for BatteriesAvocadoEntry(0);
  uint64_t v6 = v5[5];
  uint64_t v7 = (void *)(a1 + v6);
  uint64_t v8 = (void *)(a2 + v6);
  uint64_t v9 = sub_100006FC0();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v10 + 48);
  int v12 = v11(v7, 1, v9);
  int v13 = v11(v8, 1, v9);
  if (!v12)
  {
    if (!v13)
    {
      (*(void (**)(void *, void *, uint64_t))(v10 + 40))(v7, v8, v9);
      goto LABEL_7;
    }
    (*(void (**)(void *, uint64_t))(v10 + 8))(v7, v9);
    goto LABEL_6;
  }
  if (v13)
  {
LABEL_6:
    uint64_t v14 = sub_100003B28(&qword_10000C100);
    memcpy(v7, v8, *(void *)(*(void *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v10 + 32))(v7, v8, v9);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
LABEL_7:
  *(_OWORD *)(a1 + v5[6]) = *(_OWORD *)(a2 + v5[6]);
  uint64_t v15 = v5[7];
  uint64_t v16 = a1 + v15;
  uint64_t v17 = a2 + v15;
  uint64_t v18 = sub_100006F60();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 40))(v16, v17, v18);
  *(unsigned char *)(a1 + v5[8]) = *(unsigned char *)(a2 + v5[8]);
  return a1;
}

uint64_t sub_100005764(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100005778);
}

uint64_t sub_100005778(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for BatteriesAvocadoEntry(0);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);

  return v5(a1, a2, v4);
}

uint64_t sub_1000057E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000057F8);
}

uint64_t sub_1000057F8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for BatteriesAvocadoEntry(0);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);

  return v5(a1, a2, a2, v4);
}

uint64_t sub_100005868()
{
  uint64_t result = type metadata accessor for BatteriesAvocadoEntry(319);
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_1000058F4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100005A54()
{
  return sub_100005A9C(qword_10000C240, (void (*)(uint64_t))type metadata accessor for BatteriesAvocadoEntry);
}

uint64_t sub_100005A9C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100005AE4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100005B00@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v23 = a2;
  uint64_t v3 = sub_100006EE0();
  uint64_t v21 = *(void *)(v3 - 8);
  uint64_t v22 = v3;
  __chkstk_darwin();
  uint64_t v5 = (char *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100003B28(&qword_10000C260);
  __chkstk_darwin();
  uint64_t v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = sub_100006E00();
  uint64_t v8 = *(void *)(v20 - 8);
  __chkstk_darwin();
  uint64_t v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_100003B28(&qword_10000C268);
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin();
  uint64_t v14 = (char *)&v20 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = a1 + *(int *)(type metadata accessor for BatteriesAvocadoEntry(0) + 28);
  uint64_t v16 = sub_100006F60();
  uint64_t v17 = *(void *)(v16 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v17 + 16))(v7, v15, v16);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v17 + 56))(v7, 0, 1, v16);
  sub_100006DF0();
  sub_100006ED0();
  sub_100006F40();
  type metadata accessor for Utilities.Background();
  sub_100005A9C(&qword_10000C270, (void (*)(uint64_t))&type metadata accessor for BatteryAvocadoArchivableView);
  sub_100005A9C(&qword_10000C278, (void (*)(uint64_t))type metadata accessor for Utilities.Background);
  uint64_t v18 = v20;
  sub_100006F20();
  (*(void (**)(char *, uint64_t))(v21 + 8))(v5, v22);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v18);
  (*(void (**)(uint64_t, char *, uint64_t))(v12 + 16))(v23, v14, v11);
  return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v11);
}

uint64_t sub_100005EE0@<X0>(uint64_t *a1@<X8>)
{
  *a1 = swift_getKeyPath();
  sub_100003B28(&qword_10000C280);

  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_100005F40()
{
  return sub_100006F10();
}

uint64_t sub_100005F5C@<X0>(uint64_t *a1@<X8>)
{
  *a1 = sub_100006F40();
  a1[1] = v3;
  uint64_t v4 = sub_100003B28(&qword_10000C258);
  return sub_100005B00(v1, (uint64_t)a1 + *(int *)(v4 + 44));
}

uint64_t sub_100005FA0()
{
  return sub_100006E40();
}

uint64_t sub_100005FC4(uint64_t a1)
{
  sub_100006E10();
  __chkstk_darwin();
  (*(void (**)(char *, uint64_t))(v3 + 16))((char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return sub_100006E50();
}

uint64_t sub_100006090(uint64_t a1, void (*a2)(char *), uint64_t a3)
{
  uint64_t v25 = a3;
  v26 = a2;
  sub_100006FB0();
  __chkstk_darwin();
  sub_100003B28(&qword_10000C100);
  __chkstk_darwin();
  uint64_t v4 = (char *)&v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = sub_100006F60();
  uint64_t v5 = *(void *)(v23 - 8);
  __chkstk_darwin();
  uint64_t v7 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = sub_100003B28(&qword_10000C288);
  uint64_t v8 = *(void *)(v24 - 8);
  __chkstk_darwin();
  uint64_t v10 = (char *)&v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100003B28(&qword_10000C290);
  uint64_t v11 = (int *)type metadata accessor for BatteriesAvocadoEntry(0);
  unint64_t v12 = (*(unsigned __int8 *)(*((void *)v11 - 1) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*((void *)v11 - 1) + 80);
  uint64_t v13 = swift_allocObject();
  *(_OWORD *)(v13 + 16) = xmmword_1000072B0;
  unint64_t v14 = v13 + v12;
  sub_100006FD0();
  uint64_t v16 = v15;
  uint64_t v18 = v17;
  sub_100006FE0();
  char v19 = sub_100006FF0();
  uint64_t v20 = sub_100006FC0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v4, 1, 1, v20);
  sub_100006DD0();
  sub_10000641C((uint64_t)v4, v14 + v11[5]);
  uint64_t v21 = (void *)(v14 + v11[6]);
  *uint64_t v21 = v16;
  v21[1] = v18;
  (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v14 + v11[7], v7, v23);
  *(unsigned char *)(v14 + v11[8]) = v19 & 1;
  sub_100006FA0();
  sub_100005A9C(qword_10000C240, (void (*)(uint64_t))type metadata accessor for BatteriesAvocadoEntry);
  sub_100007000();
  v26(v10);
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v24);
}

uint64_t sub_10000641C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100003B28(&qword_10000C100);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100006484(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for BatteriesAvocadoEntry(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1000064E0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100003B28(&qword_10000C100);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100006548()
{
  return sub_100006584(&qword_10000C298, &qword_10000C2A0);
}

uint64_t sub_100006584(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100003BE0(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

ValueMetadata *type metadata accessor for Utilities()
{
  return &type metadata for Utilities;
}

uint64_t *sub_1000065E0(uint64_t *a1, uint64_t *a2)
{
  int v4 = *(_DWORD *)(*(void *)(sub_100003B28(&qword_10000C280) - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v6 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v6 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v5 = sub_100006E10();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v5 - 8) + 16))(a1, a2, v5);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_1000066EC(uint64_t *a1)
{
  sub_100003B28(&qword_10000C280);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v2 = sub_100006E10();
    uint64_t v3 = *(uint64_t (**)(uint64_t *, uint64_t))(*(void *)(v2 - 8) + 8);
    return v3(a1, v2);
  }
  else
  {
    uint64_t v5 = *a1;
    return _swift_release(v5);
  }
}

void *sub_100006790(void *a1, void *a2)
{
  sub_100003B28(&qword_10000C280);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v4 = sub_100006E10();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
  }
  else
  {
    *a1 = *a2;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

void *sub_10000684C(void *a1, void *a2)
{
  if (a1 != a2)
  {
    sub_100006918((uint64_t)a1);
    sub_100003B28(&qword_10000C280);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v4 = sub_100006E10();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_100006918(uint64_t a1)
{
  uint64_t v2 = sub_100003B28(&qword_10000C280);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void *sub_100006978(void *a1, const void *a2)
{
  uint64_t v4 = sub_100003B28(&qword_10000C280);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v5 = sub_100006E10();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v5 - 8) + 32))(a1, a2, v5);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(v4 - 8) + 64));
  }
  return a1;
}

void *sub_100006A3C(void *a1, const void *a2)
{
  if (a1 != a2)
  {
    sub_100006918((uint64_t)a1);
    uint64_t v4 = sub_100003B28(&qword_10000C280);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v5 = sub_100006E10();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v5 - 8) + 32))(a1, a2, v5);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(v4 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_100006B10(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100006B24);
}

uint64_t sub_100006B24(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100003B28(&qword_10000C2A8);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);

  return v5(a1, a2, v4);
}

uint64_t sub_100006B94(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100006BA8);
}

uint64_t sub_100006BA8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100003B28(&qword_10000C2A8);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);

  return v5(a1, a2, a2, v4);
}

uint64_t type metadata accessor for Utilities.Background()
{
  uint64_t result = qword_10000C308;
  if (!qword_10000C308) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_100006C68()
{
  sub_100006CF4();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_100006CF4()
{
  if (!qword_10000C318)
  {
    sub_100006E10();
    unint64_t v0 = sub_100006E20();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_10000C318);
    }
  }
}

uint64_t sub_100006D4C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100006D68@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100006F30();
  *a1 = result;
  return result;
}

void *sub_100006D90()
{
  return &protocol witness table for Color;
}

uint64_t sub_100006D9C()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t sub_100006DD0()
{
  return Date.init()();
}

uint64_t sub_100006DE0()
{
  return type metadata accessor for Date();
}

uint64_t sub_100006DF0()
{
  return BatteryAvocadoArchivableView.init(withSize:andFamily:)();
}

uint64_t sub_100006E00()
{
  return type metadata accessor for BatteryAvocadoArchivableView();
}

uint64_t sub_100006E10()
{
  return type metadata accessor for ColorScheme();
}

uint64_t sub_100006E20()
{
  return type metadata accessor for Environment.Content();
}

uint64_t sub_100006E30()
{
  return static WidgetBundle.main()();
}

uint64_t sub_100006E40()
{
  return EnvironmentValues.colorScheme.getter();
}

uint64_t sub_100006E50()
{
  return EnvironmentValues.colorScheme.setter();
}

uint64_t sub_100006E60()
{
  return LocalizedStringKey.init(stringLiteral:)();
}

uint64_t sub_100006E70()
{
  return static WidgetBundleBuilder.buildBlock<A>(_:)();
}

uint64_t sub_100006E80()
{
  return WidgetConfiguration.description(_:)();
}

uint64_t sub_100006E90()
{
  return WidgetConfiguration.supportedFamilies(_:)();
}

uint64_t sub_100006EA0()
{
  return WidgetConfiguration.supportsInteraction(_:)();
}

uint64_t sub_100006EB0()
{
  return WidgetConfiguration.configurationDisplayName(_:)();
}

uint64_t sub_100006EC0()
{
  return WidgetConfiguration.preferredBackgroundStyle(_:)();
}

uint64_t sub_100006ED0()
{
  return static ContainerBackgroundPlacement.widget.getter();
}

uint64_t sub_100006EE0()
{
  return type metadata accessor for ContainerBackgroundPlacement();
}

uint64_t sub_100006EF0()
{
  return static View._makeView(view:inputs:)();
}

uint64_t sub_100006F00()
{
  return static View._makeViewList(view:inputs:)();
}

uint64_t sub_100006F10()
{
  return static View._viewListCount(inputs:)();
}

uint64_t sub_100006F20()
{
  return View.containerBackground<A>(for:alignment:content:)();
}

uint64_t sub_100006F30()
{
  return static Color.clear.getter();
}

uint64_t sub_100006F40()
{
  return static Alignment.center.getter();
}

uint64_t sub_100006F50()
{
  return type metadata accessor for WidgetBackgroundStyle();
}

uint64_t sub_100006F60()
{
  return type metadata accessor for WidgetFamily();
}

uint64_t sub_100006F90()
{
  return StaticConfiguration.init<A>(kind:provider:content:)();
}

uint64_t sub_100006FA0()
{
  return static TimelineReloadPolicy.atEnd.getter();
}

uint64_t sub_100006FB0()
{
  return type metadata accessor for TimelineReloadPolicy();
}

uint64_t sub_100006FC0()
{
  return type metadata accessor for TimelineEntryRelevance();
}

uint64_t sub_100006FD0()
{
  return TimelineProviderContext.displaySize.getter();
}

uint64_t sub_100006FE0()
{
  return TimelineProviderContext.family.getter();
}

uint64_t sub_100006FF0()
{
  return TimelineProviderContext.isPreview.getter();
}

uint64_t sub_100007000()
{
  return Timeline.init(entries:policy:)();
}

uint64_t sub_100007010()
{
  return type metadata accessor for Optional();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

uint64_t self
{
  return _self;
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
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