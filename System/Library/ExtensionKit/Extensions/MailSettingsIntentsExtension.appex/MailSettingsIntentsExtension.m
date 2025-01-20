uint64_t sub_100005310()
{
  uint64_t result;
  uint64_t v1;

  result = sub_10002A470("com.apple.Preferences", 0x15uLL, 1);
  qword_100038F68 = result;
  qword_100038F70 = v1;
  return result;
}

uint64_t *sub_100005354()
{
  if (qword_100038030 != -1) {
    swift_once();
  }
  return &qword_100038F68;
}

uint64_t sub_1000053B8()
{
  uint64_t v1 = *sub_100005354();
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_1000053F4()
{
  return nullsub_1();
}

uint64_t sub_100005410()
{
  if (qword_100038038 != -1) {
    swift_once();
  }
  return v1;
}

uint64_t sub_100005470()
{
  return sub_100005410();
}

uint64_t sub_100005488()
{
  if (qword_100038040 != -1) {
    swift_once();
  }
  return v1;
}

uint64_t sub_1000054E8()
{
  return sub_100005488();
}

id sub_100005500()
{
  id result = objc_msgSend(self, "em_userDefaults");
  qword_100038F78 = (uint64_t)result;
  return result;
}

uint64_t *sub_10000553C()
{
  if (qword_100038048 != -1) {
    swift_once();
  }
  return &qword_100038F78;
}

uint64_t sub_1000055A0()
{
  v8 = "Title for entity representing the \"Ask Before Deleting\" setting in Mail";
  unint64_t v1 = (*(void *)(*(void *)(sub_100005894(&qword_100038220) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  ((void (*)(void))__chkstk_darwin)();
  v19 = (char *)&v1 - v1;
  uint64_t v10 = 0;
  unint64_t v2 = (*(void *)(*(void *)(sub_10002A380() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v10);
  uint64_t v12 = (uint64_t)&v1 - v2;
  unint64_t v3 = (*(void *)(*(void *)(sub_10002A3D0() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v10);
  v11 = (char *)&v1 - v3;
  unint64_t v4 = (*(void *)(*(void *)(sub_10002A450() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v10);
  v9 = (char *)&v1 - v4;
  uint64_t v16 = sub_10002A3A0();
  uint64_t v13 = *(void *)(v16 - 8);
  uint64_t v14 = v16 - 8;
  unint64_t v5 = (*(void *)(v13 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v10);
  v18 = (char *)&v1 - v5;
  uint64_t v7 = sub_10002A350();
  v6 = qword_100038F80;
  sub_100005904(v7, qword_100038F80);
  uint64_t v17 = sub_1000059AC(v7, (uint64_t)v6);
  unsigned int v15 = 1;
  sub_10002A470("Ask Before Deleting", 0x13uLL, 1);
  sub_10002A400();
  sub_100005A10();
  sub_100005A28(v12);
  v20 = v8;
  uint64_t v21 = 71;
  __int16 v22 = 2;
  sub_10002A3B0();
  (*(void (**)(char *, void, void, uint64_t))(v13 + 56))(v19, v15, v15, v16);
  return sub_10002A340();
}

uint64_t sub_100005894(uint64_t *a1)
{
  uint64_t v4 = *a1;
  if (*a1 < 0)
  {
    uint64_t TypeByMangledNameInContext2 = swift_getTypeByMangledNameInContext2();
    *a1 = TypeByMangledNameInContext2;
    return TypeByMangledNameInContext2;
  }
  return v4;
}

uint64_t sub_100005904(uint64_t a1, uint64_t *a2)
{
  unint64_t v5 = a2;
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v2 = swift_slowAlloc();
    *a2 = v2;
    return v2;
  }
  return (uint64_t)v5;
}

uint64_t sub_1000059AC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = a2;
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0) {
    return *(void *)a2;
  }
  return v3;
}

uint64_t sub_100005A10()
{
  return sub_10002A3C0();
}

uint64_t sub_100005A28@<X0>(uint64_t a1@<X8>)
{
  unsigned int v3 = enum case for LocalizedStringResource.BundleDescription.main(_:);
  uint64_t v1 = sub_10002A380();
  return (*(uint64_t (**)(uint64_t, void))(*(void *)(v1 - 8) + 104))(a1, v3);
}

uint64_t sub_100005A94()
{
  if (qword_100038050 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_10002A350();
  return sub_1000059AC(v0, (uint64_t)qword_100038F80);
}

uint64_t sub_100005B04@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_100005A94();
  uint64_t v1 = sub_10002A350();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v1 - 8) + 16))(a1, v3);
}

uint64_t sub_100005B68()
{
  uint64_t result = sub_10002A470("ShowMessageDeleteConfirmation", 0x1DuLL, 1);
  qword_100038060 = result;
  qword_100038068 = v1;
  return result;
}

uint64_t *sub_100005BAC()
{
  if (qword_100038058 != -1) {
    swift_once();
  }
  return &qword_100038060;
}

uint64_t sub_100005C10()
{
  swift_retain();
  uint64_t v1 = sub_10002A320();
  swift_release();
  return v1;
}

uint64_t sub_100005C68()
{
  uint64_t v4 = &unk_100038350;
  unint64_t v5 = &unk_100038358;
  uint64_t v7 = &v9;
  uint64_t v9 = 0;
  uint64_t v0 = sub_10002A3A0();
  unint64_t v3 = (*(void *)(*(void *)(v0 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v0);
  v6 = (char *)&v2 - v3;
  sub_100005894(&qword_100038348);
  sub_10002A470("Ask Before Deleting", 0x13uLL, 1);
  sub_10002A370();
  sub_100007600();
  uint64_t v8 = sub_10002A330();
  swift_retain();
  uint64_t v9 = v8;
  sub_10000777C();
  return v8;
}

uint64_t sub_100005D84()
{
  return sub_1000054E8();
}

uint64_t sub_100005D9C()
{
  return sub_1000053B8();
}

uint64_t sub_100005DB4()
{
  return sub_100005470();
}

uint64_t sub_100005DCC@<X0>(uint64_t *a1@<X8>)
{
  sub_100005E0C();
  uint64_t result = sub_10002A050();
  *a1 = result;
  a1[1] = v2;
  return result;
}

unint64_t sub_100005E0C()
{
  uint64_t v2 = qword_100038228;
  if (!qword_100038228)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038228);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_100005E8C()
{
  return sub_10002A310();
}

uint64_t sub_100005EA4@<X0>(uint64_t a1@<X8>)
{
  return sub_100005B04(a1);
}

uint64_t sub_100005EBC()
{
  return sub_100029FB0();
}

unint64_t sub_100005EF4()
{
  uint64_t v2 = qword_100038230;
  if (!qword_100038230)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038230);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_100005F74()
{
  return sub_10002A040();
}

uint64_t sub_100005FAC()
{
  return sub_10002A360();
}

unint64_t sub_100005FE4()
{
  uint64_t v2 = qword_100038238;
  if (!qword_100038238)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038238);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_100006064()
{
  *(void *)(v0 + 16) = v0;
  return _swift_task_switch(sub_10000608C, 0);
}

uint64_t sub_10000608C()
{
  *(void *)(v0 + 16) = v0;
  uint64_t v1 = sub_100005C68();
  uint64_t v2 = *(uint64_t (**)(uint64_t))(*(void *)(v0 + 16) + 8);
  return v2(v1);
}

uint64_t sub_100006118(uint64_t a1)
{
  uint64_t v4 = v1;
  *(void *)(v1 + 24) = a1;
  *(void *)(v1 + 16) = v1;
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v4 + 32) = v2;
  *uint64_t v2 = *(void *)(v4 + 16);
  v2[1] = sub_1000061C8;
  return sub_100006064();
}

uint64_t sub_1000061C8(uint64_t a1)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 16) = *v2;
  uint64_t v7 = v3 + 16;
  uint64_t v8 = v3 + 16;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v4 = *(uint64_t (**)(void))(*(void *)v8 + 8);
  }
  else
  {
    **(void **)(v7 + 8) = a1;
    uint64_t v4 = *(uint64_t (**)(void))(*(void *)v8 + 8);
  }
  return v4();
}

uint64_t sub_100006378(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = v2;
  *(void *)(v2 + 24) = a1;
  *(void *)(v2 + 16) = v2;
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v6 + 32) = v3;
  unint64_t v4 = sub_10000643C();
  *uint64_t v3 = *(void *)(v6 + 16);
  v3[1] = sub_1000061C8;
  return _UniqueEntityQuery.allEntities()(a2, v4);
}

unint64_t sub_10000643C()
{
  uint64_t v2 = qword_100038258[0];
  if (!qword_100038258[0])
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, qword_100038258);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_1000064BC()
{
  return sub_10002A2A0();
}

uint64_t sub_1000064D4(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = v2;
  *(void *)(v2 + 16) = v2;
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v6 + 24) = v3;
  unint64_t v4 = sub_10000643C();
  *uint64_t v3 = *(void *)(v6 + 16);
  v3[1] = sub_10000659C;
  return _UniqueEntityQuery.entities(for:)(a1, a2, v4);
}

uint64_t sub_10000659C(uint64_t a1)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 16) = *v2;
  uint64_t v8 = v3 + 16;
  uint64_t v4 = swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = *(uint64_t (**)(uint64_t))(*(void *)v8 + 8);
  }
  else
  {
    uint64_t v4 = a1;
    uint64_t v5 = *(uint64_t (**)(uint64_t))(*(void *)v8 + 8);
  }
  return v5(v4);
}

uint64_t sub_100006738(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = v2;
  *(void *)(v2 + 24) = a1;
  *(void *)(v2 + 16) = v2;
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v6 + 32) = v3;
  unint64_t v4 = sub_10000643C();
  *uint64_t v3 = *(void *)(v6 + 16);
  v3[1] = sub_1000061C8;
  return _UniqueEntityQuery.suggestedEntities()(a2, v4);
}

uint64_t sub_1000067FC(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = v2;
  *(void *)(v2 + 16) = v2;
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v6 + 24) = v3;
  unint64_t v4 = sub_100006A58();
  *uint64_t v3 = *(void *)(v6 + 16);
  v3[1] = sub_1000068C4;
  return EntityQuery.results()(a1, a2, v4);
}

uint64_t sub_1000068C4()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 16) = *v1;
  uint64_t v5 = v2 + 16;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(uint64_t (**)(void))(*(void *)v5 + 8);
  }
  else
  {
    uint64_t v3 = *(uint64_t (**)(void))(*(void *)v5 + 8);
  }
  return v3();
}

unint64_t sub_100006A58()
{
  uint64_t v2 = qword_100038278;
  if (!qword_100038278)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038278);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_100006AD8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = v3;
  *(void *)(v3 + 16) = v3;
  unint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v6 + 24) = v4;
  *unint64_t v4 = *(void *)(v6 + 16);
  v4[1] = sub_100006B9C;
  return DynamicOptionsProvider.defaultResult()(a1, a2, a3);
}

uint64_t sub_100006B9C()
{
  uint64_t v3 = *v0;
  *(void *)(v3 + 16) = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(*(void *)(v3 + 16) + 8);
  return v1();
}

uint64_t sub_100006CC8()
{
  return sub_10002A2C0() & 1;
}

uint64_t sub_100006CE4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(v3 + 56) = a3;
  *(void *)(v3 + 48) = a1;
  *(void *)(v3 + 16) = v3;
  *(void *)(v3 + 24) = 0;
  *(void *)(v3 + 32) = 0;
  *(unsigned char *)(v3 + 136) = 0;
  uint64_t v4 = sub_100005894(&qword_100038290);
  *(void *)(v3 + 64) = v4;
  *(void *)(v3 + 72) = *(void *)(v4 - 8);
  *(void *)(v3 + 80) = swift_task_alloc();
  *(void *)(v3 + 24) = a2;
  *(void *)(v3 + 32) = a3;
  return _swift_task_switch(sub_100006E00, 0);
}

uint64_t sub_100006E00()
{
  *(void *)(v0 + 16) = v0;
  uint64_t KeyPath = swift_getKeyPath();
  *(void *)(v0 + 88) = KeyPath;
  uint64_t v1 = (void *)swift_task_alloc();
  v4[12] = v1;
  uint64_t v6 = sub_100005894(&qword_100038298);
  v4[13] = sub_100007600();
  *uint64_t v1 = v4[2];
  v1[1] = sub_100006EF0;
  uint64_t v2 = v4[10];
  return _AppEntityUpdate.value<A>(of:)(v2, KeyPath, v6);
}

uint64_t sub_100006EF0()
{
  *(void *)(*(void *)v0 + 16) = *(void *)v0;
  swift_task_dealloc();
  swift_release();
  return _swift_task_switch(sub_100007028, 0);
}

uint64_t sub_100007028()
{
  uint64_t v1 = v0[10];
  uint64_t v2 = v0[9];
  uint64_t v3 = v0[8];
  v0[2] = v0;
  if ((*(unsigned int (**)(uint64_t, uint64_t))(v2 + 88))(v1, v3) == enum case for _IntentValueState.set<A>(_:))
  {
    uint64_t v8 = *(char **)(v11 + 80);
    (*(void (**)(void))(*(void *)(v11 + 72) + 96))();
    char v9 = *v8;
    *(unsigned char *)(v11 + 136) = *v8 & 1;
    *(void *)(v11 + 40) = sub_100005C68();
    *(unsigned char *)(v11 + 137) = v9 & 1;
    uint64_t KeyPath = swift_getKeyPath();
    *(void *)(v11 + 112) = KeyPath;
    uint64_t v6 = (void *)swift_task_alloc();
    *(void *)(v11 + 120) = v6;
    void *v6 = *(void *)(v11 + 16);
    v6[1] = sub_100007294;
    uint64_t v7 = *(void *)(v11 + 104);
    return AppEntity._setValue<A>(_:for:)(v11 + 137, KeyPath, v7);
  }
  else
  {
    (*(void (**)(void, void))(*(void *)(v11 + 72) + 8))(*(void *)(v11 + 80), *(void *)(v11 + 64));
    sub_1000076FC();
    sub_100029F70();
    swift_task_dealloc();
    uint64_t v4 = *(uint64_t (**)(void))(*(void *)(v11 + 16) + 8);
    return v4();
  }
}

uint64_t sub_100007294()
{
  uint64_t v4 = *v1;
  *(void *)(v4 + 16) = *v1;
  *(void *)(v4 + 128) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_1000074FC;
  }
  else
  {
    swift_release();
    sub_10000777C();
    uint64_t v2 = sub_100007424;
  }
  return _swift_task_switch(v2, 0);
}

uint64_t sub_100007424()
{
  *(void *)(v0 + 16) = v0;
  sub_1000076FC();
  sub_100029F70();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(*(void *)(v0 + 16) + 8);
  return v1();
}

uint64_t sub_1000074FC()
{
  *(void *)(v0 + 16) = v0;
  swift_release();
  sub_10000777C();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(*(void *)(v3 + 16) + 8);
  return v1();
}

uint64_t sub_1000075B8@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_100008250(a1, &v4);
  *a2 = sub_100005C10();
  return swift_release();
}

unint64_t sub_100007600()
{
  uint64_t v2 = qword_1000382A0;
  if (!qword_1000382A0)
  {
    sub_100007684(&qword_1000382A8);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_1000382A0);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_100007684(uint64_t *a1)
{
  uint64_t v4 = *a1;
  if (*a1 < 0)
  {
    uint64_t TypeByMangledNameInContextInMetadataState2 = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = TypeByMangledNameInContextInMetadataState2;
    return TypeByMangledNameInContextInMetadataState2;
  }
  return v4;
}

unint64_t sub_1000076FC()
{
  uint64_t v2 = qword_1000382B0;
  if (!qword_1000382B0)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_1000382B0);
    return WitnessTable;
  }
  return v2;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_10000777C()
{
}

uint64_t sub_1000077A8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = v3;
  *(void *)(v3 + 16) = v3;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v6 + 24) = v4;
  *uint64_t v4 = *(void *)(v6 + 16);
  v4[1] = sub_1000068C4;
  return sub_100006CE4(a1, a2, a3);
}

unint64_t sub_10000786C()
{
  return sub_100005EF4();
}

unint64_t sub_100007884()
{
  return sub_10000643C();
}

unint64_t sub_10000789C()
{
  return sub_1000078B4();
}

unint64_t sub_1000078B4()
{
  uint64_t v2 = qword_1000382C0;
  if (!qword_1000382C0)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_1000382C0);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_100007934()
{
  return sub_10000794C();
}

unint64_t sub_10000794C()
{
  uint64_t v2 = qword_1000382C8;
  if (!qword_1000382C8)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_1000382C8);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_1000079CC()
{
  return sub_1000079E4();
}

unint64_t sub_1000079E4()
{
  uint64_t v2 = qword_1000382D0;
  if (!qword_1000382D0)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_1000382D0);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_100007A64()
{
  return sub_100007A7C();
}

unint64_t sub_100007A7C()
{
  uint64_t v2 = qword_1000382D8;
  if (!qword_1000382D8)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_1000382D8);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_100007AFC()
{
  return sub_100006A58();
}

void *sub_100007B14()
{
  return &protocol witness table for String;
}

unint64_t sub_100007B20()
{
  return sub_100007B38();
}

unint64_t sub_100007B38()
{
  uint64_t v2 = qword_1000382E0;
  if (!qword_1000382E0)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_1000382E0);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_100007BB8()
{
  return sub_100007BD0();
}

unint64_t sub_100007BD0()
{
  uint64_t v2 = qword_1000382E8;
  if (!qword_1000382E8)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_1000382E8);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_100007C50()
{
  return sub_100007C68();
}

unint64_t sub_100007C68()
{
  uint64_t v2 = qword_1000382F0;
  if (!qword_1000382F0)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_1000382F0);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_100007CE8()
{
  return sub_100005FE4();
}

void *sub_100007D00()
{
  return &protocol witness table for String;
}

unint64_t sub_100007D0C()
{
  return sub_100007D24();
}

unint64_t sub_100007D24()
{
  uint64_t v2 = qword_1000382F8;
  if (!qword_1000382F8)
  {
    sub_100007684(&qword_100038300);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_1000382F8);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_100007DA8()
{
  return sub_100007DC0();
}

unint64_t sub_100007DC0()
{
  uint64_t v2 = qword_100038308;
  if (!qword_100038308)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038308);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_100007E40()
{
  return sub_100007E58();
}

unint64_t sub_100007E58()
{
  uint64_t v2 = qword_100038310;
  if (!qword_100038310)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038310);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_100007ED8()
{
  return sub_100005E0C();
}

unint64_t sub_100007EF0()
{
  return sub_100007F08();
}

unint64_t sub_100007F08()
{
  uint64_t v2 = qword_100038318;
  if (!qword_100038318)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038318);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_100007F88()
{
  return sub_100007FA0();
}

unint64_t sub_100007FA0()
{
  uint64_t v2 = qword_100038320;
  if (!qword_100038320)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038320);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_100008020()
{
  return sub_100008038();
}

unint64_t sub_100008038()
{
  uint64_t v2 = qword_100038328;
  if (!qword_100038328)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038328);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_1000080B8()
{
  return sub_1000080D0();
}

unint64_t sub_1000080D0()
{
  uint64_t v2 = qword_100038330;
  if (!qword_100038330)
  {
    sub_100007684(&qword_100038338);
    sub_100007C68();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038330);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_100008164()
{
  return sub_10000817C();
}

unint64_t sub_10000817C()
{
  uint64_t v2 = qword_100038340;
  if (!qword_100038340)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038340);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_1000081FC()
{
  return sub_1000076FC();
}

void *type metadata accessor for AskBeforeDeletingPreferenceEntity()
{
  return &unk_100034C48;
}

void *type metadata accessor for AskBeforeDeletingEntityQuery()
{
  return &unk_100034C70;
}

void *type metadata accessor for AskBeforeDeletingEntityUpdateHandler()
{
  return &unk_100034C90;
}

void *sub_100008250(uint64_t *a1, void *a2)
{
  uint64_t v4 = *a1;
  swift_retain();
  uint64_t result = a2;
  *a2 = v4;
  return result;
}

uint64_t sub_100008288(uint64_t a1, void *a2)
{
  v2[4] = a1;
  v2[2] = v2;
  v2[3] = 0;
  v2[3] = *a2;
  return _swift_task_switch(sub_1000082CC, 0);
}

uint64_t sub_1000082CC()
{
  *(void *)(v0 + 16) = v0;
  uint64_t v8 = (void *)*sub_10000553C();
  id v1 = v8;
  if (v8)
  {
    sub_100005BAC();
    swift_bridgeObjectRetain();
    NSString v4 = sub_10002A460();
    swift_bridgeObjectRelease();
    unsigned __int8 v5 = [v8 BOOLForKey:v4];

    char v6 = v5 & 1;
  }
  else
  {
    char v6 = 2;
  }
  if (v6 == 2) {
    **(unsigned char **)(v7 + 32) = 0;
  }
  else {
    **(unsigned char **)(v7 + 32) = v6;
  }
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(v7 + 16) + 8);
  return v2();
}

uint64_t sub_10000846C(void *a1, char *a2)
{
  *(void *)(v2 + 16) = v2;
  *(void *)(v2 + 24) = 0;
  *(unsigned char *)(v2 + 32) = 0;
  *(void *)(v2 + 24) = *a1;
  char v3 = *a2;
  *(unsigned char *)(v2 + 33) = *a2 & 1;
  *(unsigned char *)(v2 + 32) = v3 & 1;
  return _swift_task_switch(sub_1000084CC, 0);
}

uint64_t sub_1000084CC()
{
  *(void *)(v0 + 16) = v0;
  uint64_t v7 = (void *)*sub_10000553C();
  id v1 = v7;
  if (v7)
  {
    char v4 = *(unsigned char *)(v6 + 33);
    sub_100005BAC();
    swift_bridgeObjectRetain();
    NSString v5 = sub_10002A460();
    swift_bridgeObjectRelease();
    [v7 setBool:v4 & 1 forKey:v5];
  }
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(v6 + 16) + 8);
  return v2();
}

uint64_t sub_100008624()
{
  uint64_t result = sub_10002A470("com.apple.Preferences", 0x15uLL, 1);
  qword_100038F98 = result;
  qword_100038FA0 = v1;
  return result;
}

uint64_t *sub_100008668()
{
  if (qword_100038070 != -1) {
    swift_once();
  }
  return &qword_100038F98;
}

uint64_t sub_1000086CC()
{
  uint64_t v1 = *sub_100008668();
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_100008708()
{
  if (qword_100038078 != -1) {
    swift_once();
  }
  return v1;
}

uint64_t sub_100008768()
{
  return sub_100008708();
}

uint64_t sub_100008780()
{
  if (qword_100038080 != -1) {
    swift_once();
  }
  return v1;
}

uint64_t sub_1000087E0()
{
  return sub_100008780();
}

id sub_1000087F8()
{
  id result = objc_msgSend(self, "em_userDefaults");
  qword_100038FA8 = (uint64_t)result;
  return result;
}

uint64_t *sub_100008834()
{
  if (qword_100038088 != -1) {
    swift_once();
  }
  return &qword_100038FA8;
}

uint64_t sub_100008898()
{
  uint64_t v9 = "Title for entity representing the \"Blocked Sender Enabled\" setting in Mail";
  uint64_t v0 = sub_100005894(&qword_100038220);
  unint64_t v2 = (*(void *)(*(void *)(v0 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v0);
  v20 = (char *)&v2 - v2;
  uint64_t v11 = 0;
  unint64_t v3 = (*(void *)(*(void *)(sub_10002A380() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v11);
  uint64_t v13 = (uint64_t)&v2 - v3;
  unint64_t v4 = (*(void *)(*(void *)(sub_10002A3D0() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v11);
  uint64_t v12 = (char *)&v2 - v4;
  unint64_t v5 = (*(void *)(*(void *)(sub_10002A450() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v11);
  uint64_t v10 = (char *)&v2 - v5;
  uint64_t v17 = sub_10002A3A0();
  uint64_t v14 = *(void *)(v17 - 8);
  uint64_t v15 = v17 - 8;
  unint64_t v6 = (*(void *)(v14 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v11);
  v19 = (char *)&v2 - v6;
  uint64_t v8 = sub_10002A350();
  uint64_t v7 = qword_100038FB0;
  sub_100005904(v8, qword_100038FB0);
  uint64_t v18 = sub_1000059AC(v8, (uint64_t)v7);
  unsigned int v16 = 1;
  sub_10002A470("Blocked Sender Enabled", 0x16uLL, 1);
  sub_10002A400();
  sub_100005A10();
  sub_100005A28(v13);
  uint64_t v21 = v9;
  uint64_t v22 = 74;
  __int16 v23 = 2;
  sub_10002A3B0();
  (*(void (**)(char *, void, void, uint64_t))(v14 + 56))(v20, v16, v16, v17);
  return sub_10002A340();
}

uint64_t sub_100008B8C()
{
  if (qword_100038090 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_10002A350();
  return sub_1000059AC(v0, (uint64_t)qword_100038FB0);
}

uint64_t sub_100008BFC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_100008B8C();
  uint64_t v1 = sub_10002A350();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v1 - 8) + 16))(a1, v3);
}

uint64_t sub_100008C60()
{
  uint64_t result = sub_10002A470("BlockedSenderEnabled", 0x14uLL, 1);
  qword_100038360 = result;
  qword_100038368 = v1;
  return result;
}

uint64_t *sub_100008CA4()
{
  if (qword_100038098 != -1) {
    swift_once();
  }
  return &qword_100038360;
}

uint64_t sub_100008D08()
{
  unint64_t v4 = &unk_100038490;
  unint64_t v5 = &unk_100038498;
  uint64_t v7 = &v9;
  uint64_t v9 = 0;
  uint64_t v0 = sub_10002A3A0();
  unint64_t v3 = (*(void *)(*(void *)(v0 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v0);
  unint64_t v6 = (char *)&v2 - v3;
  sub_100005894(&qword_100038488);
  sub_10002A470("Blocked Sender Enabled", 0x16uLL, 1);
  sub_10002A370();
  sub_100009E98();
  uint64_t v8 = sub_10002A330();
  swift_retain();
  uint64_t v9 = v8;
  sub_10000777C();
  return v8;
}

uint64_t sub_100008E24()
{
  return sub_1000087E0();
}

uint64_t sub_100008E3C()
{
  return sub_1000086CC();
}

uint64_t sub_100008E54()
{
  return sub_100008768();
}

uint64_t sub_100008E6C@<X0>(uint64_t *a1@<X8>)
{
  sub_100008EAC();
  uint64_t result = sub_10002A050();
  *a1 = result;
  a1[1] = v2;
  return result;
}

unint64_t sub_100008EAC()
{
  uint64_t v2 = qword_100038370;
  if (!qword_100038370)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038370);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_100008F2C@<X0>(uint64_t a1@<X8>)
{
  return sub_100008BFC(a1);
}

uint64_t sub_100008F44()
{
  return sub_100029FB0();
}

unint64_t sub_100008F7C()
{
  uint64_t v2 = qword_100038378;
  if (!qword_100038378)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038378);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_100008FFC()
{
  return sub_10002A040();
}

uint64_t sub_100009034()
{
  return sub_10002A360();
}

unint64_t sub_10000906C()
{
  uint64_t v2 = qword_100038380;
  if (!qword_100038380)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038380);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_1000090EC()
{
  *(void *)(v0 + 16) = v0;
  return _swift_task_switch(sub_100009114, 0);
}

uint64_t sub_100009114()
{
  *(void *)(v0 + 16) = v0;
  uint64_t v1 = sub_100008D08();
  uint64_t v2 = *(uint64_t (**)(uint64_t))(*(void *)(v0 + 16) + 8);
  return v2(v1);
}

uint64_t sub_1000091A0(uint64_t a1)
{
  uint64_t v4 = v1;
  *(void *)(v1 + 24) = a1;
  *(void *)(v1 + 16) = v1;
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v4 + 32) = v2;
  *uint64_t v2 = *(void *)(v4 + 16);
  v2[1] = sub_1000061C8;
  return sub_1000090EC();
}

uint64_t sub_100009250(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = v2;
  *(void *)(v2 + 24) = a1;
  *(void *)(v2 + 16) = v2;
  unint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v6 + 32) = v3;
  unint64_t v4 = sub_100009314();
  *unint64_t v3 = *(void *)(v6 + 16);
  v3[1] = sub_1000061C8;
  return _UniqueEntityQuery.allEntities()(a2, v4);
}

unint64_t sub_100009314()
{
  uint64_t v2 = qword_1000383A0[0];
  if (!qword_1000383A0[0])
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, qword_1000383A0);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_100009394(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = v2;
  *(void *)(v2 + 16) = v2;
  unint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v6 + 24) = v3;
  unint64_t v4 = sub_100009314();
  *unint64_t v3 = *(void *)(v6 + 16);
  v3[1] = sub_10000659C;
  return _UniqueEntityQuery.entities(for:)(a1, a2, v4);
}

uint64_t sub_10000945C(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = v2;
  *(void *)(v2 + 24) = a1;
  *(void *)(v2 + 16) = v2;
  unint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v6 + 32) = v3;
  unint64_t v4 = sub_100009314();
  *unint64_t v3 = *(void *)(v6 + 16);
  v3[1] = sub_1000061C8;
  return _UniqueEntityQuery.suggestedEntities()(a2, v4);
}

uint64_t sub_100009520(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = v2;
  *(void *)(v2 + 16) = v2;
  unint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v6 + 24) = v3;
  unint64_t v4 = sub_1000095E8();
  *unint64_t v3 = *(void *)(v6 + 16);
  v3[1] = sub_1000068C4;
  return EntityQuery.results()(a1, a2, v4);
}

unint64_t sub_1000095E8()
{
  uint64_t v2 = qword_1000383C0;
  if (!qword_1000383C0)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_1000383C0);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_100009668(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(v3 + 56) = a3;
  *(void *)(v3 + 48) = a1;
  *(void *)(v3 + 16) = v3;
  *(void *)(v3 + 24) = 0;
  *(void *)(v3 + 32) = 0;
  *(unsigned char *)(v3 + 136) = 0;
  uint64_t v4 = sub_100005894(&qword_100038290);
  *(void *)(v3 + 64) = v4;
  *(void *)(v3 + 72) = *(void *)(v4 - 8);
  *(void *)(v3 + 80) = swift_task_alloc();
  *(void *)(v3 + 24) = a2;
  *(void *)(v3 + 32) = a3;
  return _swift_task_switch(sub_100009784, 0);
}

uint64_t sub_100009784()
{
  *(void *)(v0 + 16) = v0;
  uint64_t KeyPath = swift_getKeyPath();
  *(void *)(v0 + 88) = KeyPath;
  uint64_t v1 = (void *)swift_task_alloc();
  v4[12] = v1;
  uint64_t v6 = sub_100005894(&qword_1000383D8);
  v4[13] = sub_100009E98();
  *uint64_t v1 = v4[2];
  v1[1] = sub_100009874;
  uint64_t v2 = v4[10];
  return _AppEntityUpdate.value<A>(of:)(v2, KeyPath, v6);
}

uint64_t sub_100009874()
{
  *(void *)(*(void *)v0 + 16) = *(void *)v0;
  swift_task_dealloc();
  swift_release();
  return _swift_task_switch(sub_1000099AC, 0);
}

uint64_t sub_1000099AC()
{
  uint64_t v1 = v0[10];
  uint64_t v2 = v0[9];
  uint64_t v3 = v0[8];
  v0[2] = v0;
  if ((*(unsigned int (**)(uint64_t, uint64_t))(v2 + 88))(v1, v3) == enum case for _IntentValueState.set<A>(_:))
  {
    uint64_t v8 = *(char **)(v11 + 80);
    (*(void (**)(void))(*(void *)(v11 + 72) + 96))();
    char v9 = *v8;
    *(unsigned char *)(v11 + 136) = *v8 & 1;
    *(void *)(v11 + 40) = sub_100008D08();
    *(unsigned char *)(v11 + 137) = v9 & 1;
    uint64_t KeyPath = swift_getKeyPath();
    *(void *)(v11 + 112) = KeyPath;
    uint64_t v6 = (void *)swift_task_alloc();
    *(void *)(v11 + 120) = v6;
    void *v6 = *(void *)(v11 + 16);
    v6[1] = sub_100009C18;
    uint64_t v7 = *(void *)(v11 + 104);
    return AppEntity._setValue<A>(_:for:)(v11 + 137, KeyPath, v7);
  }
  else
  {
    (*(void (**)(void, void))(*(void *)(v11 + 72) + 8))(*(void *)(v11 + 80), *(void *)(v11 + 64));
    sub_100009F1C();
    sub_100029F70();
    swift_task_dealloc();
    uint64_t v4 = *(uint64_t (**)(void))(*(void *)(v11 + 16) + 8);
    return v4();
  }
}

uint64_t sub_100009C18()
{
  uint64_t v4 = *v1;
  *(void *)(v4 + 16) = *v1;
  *(void *)(v4 + 128) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_1000074FC;
  }
  else
  {
    swift_release();
    sub_10000777C();
    uint64_t v2 = sub_100009DA8;
  }
  return _swift_task_switch(v2, 0);
}

uint64_t sub_100009DA8()
{
  *(void *)(v0 + 16) = v0;
  sub_100009F1C();
  sub_100029F70();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(*(void *)(v0 + 16) + 8);
  return v1();
}

uint64_t sub_100009E80@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_1000075B8(a1, a2);
}

unint64_t sub_100009E98()
{
  uint64_t v2 = qword_1000383E0;
  if (!qword_1000383E0)
  {
    sub_100007684(&qword_1000383E8);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_1000383E0);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_100009F1C()
{
  uint64_t v2 = qword_1000383F0;
  if (!qword_1000383F0)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_1000383F0);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_100009F9C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = v3;
  *(void *)(v3 + 16) = v3;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v6 + 24) = v4;
  *uint64_t v4 = *(void *)(v6 + 16);
  v4[1] = sub_1000068C4;
  return sub_100009668(a1, a2, a3);
}

unint64_t sub_10000A060()
{
  return sub_100008F7C();
}

unint64_t sub_10000A078()
{
  return sub_100009314();
}

unint64_t sub_10000A090()
{
  return sub_10000A0A8();
}

unint64_t sub_10000A0A8()
{
  uint64_t v2 = qword_100038400;
  if (!qword_100038400)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038400);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_10000A128()
{
  return sub_10000A140();
}

unint64_t sub_10000A140()
{
  uint64_t v2 = qword_100038408;
  if (!qword_100038408)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038408);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_10000A1C0()
{
  return sub_10000A1D8();
}

unint64_t sub_10000A1D8()
{
  uint64_t v2 = qword_100038410;
  if (!qword_100038410)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038410);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_10000A258()
{
  return sub_10000A270();
}

unint64_t sub_10000A270()
{
  uint64_t v2 = qword_100038418;
  if (!qword_100038418)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038418);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_10000A2F0()
{
  return sub_1000095E8();
}

unint64_t sub_10000A308()
{
  return sub_10000A320();
}

unint64_t sub_10000A320()
{
  uint64_t v2 = qword_100038420;
  if (!qword_100038420)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038420);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_10000A3A0()
{
  return sub_10000A3B8();
}

unint64_t sub_10000A3B8()
{
  uint64_t v2 = qword_100038428;
  if (!qword_100038428)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038428);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_10000A438()
{
  return sub_10000A450();
}

unint64_t sub_10000A450()
{
  uint64_t v2 = qword_100038430;
  if (!qword_100038430)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038430);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_10000A4D0()
{
  return sub_10000906C();
}

unint64_t sub_10000A4E8()
{
  return sub_10000A500();
}

unint64_t sub_10000A500()
{
  uint64_t v2 = qword_100038438;
  if (!qword_100038438)
  {
    sub_100007684(&qword_100038440);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038438);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_10000A584()
{
  return sub_10000A59C();
}

unint64_t sub_10000A59C()
{
  uint64_t v2 = qword_100038448;
  if (!qword_100038448)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038448);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_10000A61C()
{
  return sub_10000A634();
}

unint64_t sub_10000A634()
{
  uint64_t v2 = qword_100038450;
  if (!qword_100038450)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038450);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_10000A6B4()
{
  return sub_100008EAC();
}

unint64_t sub_10000A6CC()
{
  return sub_10000A6E4();
}

unint64_t sub_10000A6E4()
{
  uint64_t v2 = qword_100038458;
  if (!qword_100038458)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038458);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_10000A764()
{
  return sub_10000A77C();
}

unint64_t sub_10000A77C()
{
  uint64_t v2 = qword_100038460;
  if (!qword_100038460)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038460);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_10000A7FC()
{
  return sub_10000A814();
}

unint64_t sub_10000A814()
{
  uint64_t v2 = qword_100038468;
  if (!qword_100038468)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038468);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_10000A894()
{
  return sub_10000A8AC();
}

unint64_t sub_10000A8AC()
{
  uint64_t v2 = qword_100038470;
  if (!qword_100038470)
  {
    sub_100007684(&qword_100038478);
    sub_10000A450();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038470);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_10000A940()
{
  return sub_10000A958();
}

unint64_t sub_10000A958()
{
  uint64_t v2 = qword_100038480;
  if (!qword_100038480)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038480);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_10000A9D8()
{
  return sub_100009F1C();
}

void *type metadata accessor for BlockedSenderEnabledPreferenceEntity()
{
  return &unk_100034CB0;
}

void *type metadata accessor for BlockedSenderEnabledEntityQuery()
{
  return &unk_100034CD8;
}

void *type metadata accessor for BlockedSenderEnabledEntityUpdateHandler()
{
  return &unk_100034CF8;
}

uint64_t sub_10000AA2C(uint64_t a1, void *a2)
{
  v2[4] = a1;
  v2[2] = v2;
  v2[3] = 0;
  v2[3] = *a2;
  return _swift_task_switch(sub_10000AA70, 0);
}

uint64_t sub_10000AA70()
{
  *(void *)(v0 + 16) = v0;
  uint64_t v8 = (void *)*sub_100008834();
  id v1 = v8;
  if (v8)
  {
    sub_100008CA4();
    swift_bridgeObjectRetain();
    NSString v4 = sub_10002A460();
    swift_bridgeObjectRelease();
    unsigned __int8 v5 = [v8 BOOLForKey:v4];

    char v6 = v5 & 1;
  }
  else
  {
    char v6 = 2;
  }
  if (v6 == 2) {
    **(unsigned char **)(v7 + 32) = 1;
  }
  else {
    **(unsigned char **)(v7 + 32) = v6;
  }
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(v7 + 16) + 8);
  return v2();
}

uint64_t sub_10000AC14(void *a1, char *a2)
{
  *(void *)(v2 + 16) = v2;
  *(void *)(v2 + 24) = 0;
  *(unsigned char *)(v2 + 32) = 0;
  *(void *)(v2 + 24) = *a1;
  char v3 = *a2;
  *(unsigned char *)(v2 + 33) = *a2 & 1;
  *(unsigned char *)(v2 + 32) = v3 & 1;
  return _swift_task_switch(sub_10000AC74, 0);
}

uint64_t sub_10000AC74()
{
  *(void *)(v0 + 16) = v0;
  uint64_t v7 = (void *)*sub_100008834();
  id v1 = v7;
  if (v7)
  {
    char v4 = *(unsigned char *)(v6 + 33);
    sub_100008CA4();
    swift_bridgeObjectRetain();
    NSString v5 = sub_10002A460();
    swift_bridgeObjectRelease();
    [v7 setBool:v4 & 1 forKey:v5];
  }
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(v6 + 16) + 8);
  return v2();
}

uint64_t sub_10000ADCC()
{
  uint64_t result = sub_10002A470("com.apple.Preferences", 0x15uLL, 1);
  qword_100038FC8 = result;
  qword_100038FD0 = v1;
  return result;
}

uint64_t *sub_10000AE10()
{
  if (qword_1000380A0 != -1) {
    swift_once();
  }
  return &qword_100038FC8;
}

uint64_t sub_10000AE74()
{
  uint64_t v1 = *sub_10000AE10();
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_10000AEB0()
{
  if (qword_1000380A8 != -1) {
    swift_once();
  }
  return v1;
}

uint64_t sub_10000AF10()
{
  return sub_10000AEB0();
}

uint64_t sub_10000AF28()
{
  if (qword_1000380B0 != -1) {
    swift_once();
  }
  return v1;
}

uint64_t sub_10000AF88()
{
  return sub_10000AF28();
}

id sub_10000AFA0()
{
  id result = objc_msgSend(self, "em_userDefaults");
  qword_100038FD8 = (uint64_t)result;
  return result;
}

uint64_t *sub_10000AFDC()
{
  if (qword_1000380B8 != -1) {
    swift_once();
  }
  return &qword_100038FD8;
}

uint64_t sub_10000B040()
{
  uint64_t v9 = "Title for entity representing the \"Blocked Sender Action\" setting in Mail";
  uint64_t v0 = sub_100005894(&qword_100038220);
  unint64_t v2 = (*(void *)(*(void *)(v0 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v0);
  v20 = (char *)&v2 - v2;
  uint64_t v11 = 0;
  unint64_t v3 = (*(void *)(*(void *)(sub_10002A380() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v11);
  uint64_t v13 = (uint64_t)&v2 - v3;
  unint64_t v4 = (*(void *)(*(void *)(sub_10002A3D0() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v11);
  uint64_t v12 = (char *)&v2 - v4;
  unint64_t v5 = (*(void *)(*(void *)(sub_10002A450() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v11);
  uint64_t v10 = (char *)&v2 - v5;
  uint64_t v17 = sub_10002A3A0();
  uint64_t v14 = *(void *)(v17 - 8);
  uint64_t v15 = v17 - 8;
  unint64_t v6 = (*(void *)(v14 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v11);
  v19 = (char *)&v2 - v6;
  uint64_t v8 = sub_10002A350();
  uint64_t v7 = qword_100038FE0;
  sub_100005904(v8, qword_100038FE0);
  uint64_t v18 = sub_1000059AC(v8, (uint64_t)v7);
  unsigned int v16 = 1;
  sub_10002A470("Blocked Sender Action", 0x15uLL, 1);
  sub_10002A400();
  sub_100005A10();
  sub_100005A28(v13);
  uint64_t v21 = v9;
  uint64_t v22 = 73;
  __int16 v23 = 2;
  sub_10002A3B0();
  (*(void (**)(char *, void, void, uint64_t))(v14 + 56))(v20, v16, v16, v17);
  return sub_10002A340();
}

uint64_t sub_10000B334()
{
  if (qword_1000380C0 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_10002A350();
  return sub_1000059AC(v0, (uint64_t)qword_100038FE0);
}

uint64_t sub_10000B3A4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_10000B334();
  uint64_t v1 = sub_10002A350();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v1 - 8) + 16))(a1, v3);
}

uint64_t sub_10000B408()
{
  uint64_t result = sub_10002A470("BlockedSenderAction", 0x13uLL, 1);
  qword_1000384A0 = result;
  qword_1000384A8 = v1;
  return result;
}

uint64_t *sub_10000B44C()
{
  if (qword_1000380C8 != -1) {
    swift_once();
  }
  return &qword_1000384A0;
}

uint64_t sub_10000B4B0()
{
  unint64_t v4 = &unk_100038658;
  unint64_t v5 = &unk_100038660;
  uint64_t v7 = &v9;
  uint64_t v9 = 0;
  uint64_t v0 = sub_10002A3A0();
  unint64_t v3 = (*(void *)(*(void *)(v0 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v0);
  unint64_t v6 = (char *)&v2 - v3;
  sub_100005894(&qword_100038650);
  sub_10002A470("Blocked Sender Action", 0x15uLL, 1);
  sub_10002A370();
  sub_10000C640();
  uint64_t v8 = sub_10002A330();
  swift_retain();
  uint64_t v9 = v8;
  sub_10000777C();
  return v8;
}

uint64_t sub_10000B5CC()
{
  return sub_10000AF88();
}

uint64_t sub_10000B5E4()
{
  return sub_10000AE74();
}

uint64_t sub_10000B5FC()
{
  return sub_10000AF10();
}

uint64_t sub_10000B614@<X0>(uint64_t *a1@<X8>)
{
  sub_10000B654();
  uint64_t result = sub_10002A050();
  *a1 = result;
  a1[1] = v2;
  return result;
}

unint64_t sub_10000B654()
{
  uint64_t v2 = qword_1000384B0;
  if (!qword_1000384B0)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_1000384B0);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_10000B6D4@<X0>(uint64_t a1@<X8>)
{
  return sub_10000B3A4(a1);
}

uint64_t sub_10000B6EC()
{
  return sub_100029FB0();
}

unint64_t sub_10000B724()
{
  uint64_t v2 = qword_1000384B8;
  if (!qword_1000384B8)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_1000384B8);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_10000B7A4()
{
  return sub_10002A040();
}

uint64_t sub_10000B7DC()
{
  return sub_10002A360();
}

unint64_t sub_10000B814()
{
  uint64_t v2 = qword_1000384C0;
  if (!qword_1000384C0)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_1000384C0);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_10000B894()
{
  *(void *)(v0 + 16) = v0;
  return _swift_task_switch(sub_10000B8BC, 0);
}

uint64_t sub_10000B8BC()
{
  *(void *)(v0 + 16) = v0;
  uint64_t v1 = sub_10000B4B0();
  uint64_t v2 = *(uint64_t (**)(uint64_t))(*(void *)(v0 + 16) + 8);
  return v2(v1);
}

uint64_t sub_10000B948(uint64_t a1)
{
  uint64_t v4 = v1;
  *(void *)(v1 + 24) = a1;
  *(void *)(v1 + 16) = v1;
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v4 + 32) = v2;
  *uint64_t v2 = *(void *)(v4 + 16);
  v2[1] = sub_1000061C8;
  return sub_10000B894();
}

uint64_t sub_10000B9F8(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = v2;
  *(void *)(v2 + 24) = a1;
  *(void *)(v2 + 16) = v2;
  unint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v6 + 32) = v3;
  unint64_t v4 = sub_10000BABC();
  *unint64_t v3 = *(void *)(v6 + 16);
  v3[1] = sub_1000061C8;
  return _UniqueEntityQuery.allEntities()(a2, v4);
}

unint64_t sub_10000BABC()
{
  uint64_t v2 = qword_1000384E0[0];
  if (!qword_1000384E0[0])
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, qword_1000384E0);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_10000BB3C(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = v2;
  *(void *)(v2 + 16) = v2;
  unint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v6 + 24) = v3;
  unint64_t v4 = sub_10000BABC();
  *unint64_t v3 = *(void *)(v6 + 16);
  v3[1] = sub_10000659C;
  return _UniqueEntityQuery.entities(for:)(a1, a2, v4);
}

uint64_t sub_10000BC04(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = v2;
  *(void *)(v2 + 24) = a1;
  *(void *)(v2 + 16) = v2;
  unint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v6 + 32) = v3;
  unint64_t v4 = sub_10000BABC();
  *unint64_t v3 = *(void *)(v6 + 16);
  v3[1] = sub_1000061C8;
  return _UniqueEntityQuery.suggestedEntities()(a2, v4);
}

uint64_t sub_10000BCC8(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = v2;
  *(void *)(v2 + 16) = v2;
  unint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v6 + 24) = v3;
  unint64_t v4 = sub_10000BD90();
  *unint64_t v3 = *(void *)(v6 + 16);
  v3[1] = sub_1000068C4;
  return EntityQuery.results()(a1, a2, v4);
}

unint64_t sub_10000BD90()
{
  uint64_t v2 = qword_100038500;
  if (!qword_100038500)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038500);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_10000BE10(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(v3 + 56) = a3;
  *(void *)(v3 + 48) = a1;
  *(void *)(v3 + 16) = v3;
  *(void *)(v3 + 24) = 0;
  *(void *)(v3 + 32) = 0;
  *(unsigned char *)(v3 + 136) = 0;
  uint64_t v4 = sub_100005894(&qword_100038518);
  *(void *)(v3 + 64) = v4;
  *(void *)(v3 + 72) = *(void *)(v4 - 8);
  *(void *)(v3 + 80) = swift_task_alloc();
  *(void *)(v3 + 24) = a2;
  *(void *)(v3 + 32) = a3;
  return _swift_task_switch(sub_10000BF2C, 0);
}

uint64_t sub_10000BF2C()
{
  *(void *)(v0 + 16) = v0;
  uint64_t KeyPath = swift_getKeyPath();
  *(void *)(v0 + 88) = KeyPath;
  uint64_t v1 = (void *)swift_task_alloc();
  v4[12] = v1;
  uint64_t v6 = sub_100005894(&qword_100038520);
  v4[13] = sub_10000C640();
  *uint64_t v1 = v4[2];
  v1[1] = sub_10000C01C;
  uint64_t v2 = v4[10];
  return _AppEntityUpdate.value<A>(of:)(v2, KeyPath, v6);
}

uint64_t sub_10000C01C()
{
  *(void *)(*(void *)v0 + 16) = *(void *)v0;
  swift_task_dealloc();
  swift_release();
  return _swift_task_switch(sub_10000C154, 0);
}

uint64_t sub_10000C154()
{
  uint64_t v1 = v0[10];
  uint64_t v2 = v0[9];
  uint64_t v3 = v0[8];
  v0[2] = v0;
  if ((*(unsigned int (**)(uint64_t, uint64_t))(v2 + 88))(v1, v3) == enum case for _IntentValueState.set<A>(_:))
  {
    uint64_t v8 = *(char **)(v11 + 80);
    (*(void (**)(void))(*(void *)(v11 + 72) + 96))();
    char v9 = *v8;
    *(unsigned char *)(v11 + 136) = *v8 & 1;
    *(void *)(v11 + 40) = sub_10000B4B0();
    *(unsigned char *)(v11 + 137) = v9 & 1;
    uint64_t KeyPath = swift_getKeyPath();
    *(void *)(v11 + 112) = KeyPath;
    uint64_t v6 = (void *)swift_task_alloc();
    *(void *)(v11 + 120) = v6;
    void *v6 = *(void *)(v11 + 16);
    v6[1] = sub_10000C3C0;
    uint64_t v7 = *(void *)(v11 + 104);
    return AppEntity._setValue<A>(_:for:)(v11 + 137, KeyPath, v7);
  }
  else
  {
    (*(void (**)(void, void))(*(void *)(v11 + 72) + 8))(*(void *)(v11 + 80), *(void *)(v11 + 64));
    sub_10000C6C4();
    sub_100029F70();
    swift_task_dealloc();
    uint64_t v4 = *(uint64_t (**)(void))(*(void *)(v11 + 16) + 8);
    return v4();
  }
}

uint64_t sub_10000C3C0()
{
  uint64_t v4 = *v1;
  *(void *)(v4 + 16) = *v1;
  *(void *)(v4 + 128) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_1000074FC;
  }
  else
  {
    swift_release();
    sub_10000777C();
    uint64_t v2 = sub_10000C550;
  }
  return _swift_task_switch(v2, 0);
}

uint64_t sub_10000C550()
{
  *(void *)(v0 + 16) = v0;
  sub_10000C6C4();
  sub_100029F70();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(*(void *)(v0 + 16) + 8);
  return v1();
}

uint64_t sub_10000C628@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_1000075B8(a1, a2);
}

unint64_t sub_10000C640()
{
  uint64_t v2 = qword_100038528;
  if (!qword_100038528)
  {
    sub_100007684(&qword_100038530);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038528);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_10000C6C4()
{
  uint64_t v2 = qword_100038538;
  if (!qword_100038538)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038538);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_10000C744(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = v3;
  *(void *)(v3 + 16) = v3;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v6 + 24) = v4;
  *uint64_t v4 = *(void *)(v6 + 16);
  v4[1] = sub_1000068C4;
  return sub_10000BE10(a1, a2, a3);
}

uint64_t sub_10000C808()
{
  char v9 = "Title of options for blocked senders";
  uint64_t v0 = sub_100005894(&qword_100038220);
  unint64_t v2 = (*(void *)(*(void *)(v0 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v0);
  v20 = (char *)&v2 - v2;
  uint64_t v11 = 0;
  unint64_t v3 = (*(void *)(*(void *)(sub_10002A380() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v11);
  uint64_t v13 = (uint64_t)&v2 - v3;
  unint64_t v4 = (*(void *)(*(void *)(sub_10002A3D0() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v11);
  uint64_t v12 = (char *)&v2 - v4;
  unint64_t v5 = (*(void *)(*(void *)(sub_10002A450() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v11);
  uint64_t v10 = (char *)&v2 - v5;
  uint64_t v17 = sub_10002A3A0();
  uint64_t v14 = *(void *)(v17 - 8);
  uint64_t v15 = v17 - 8;
  unint64_t v6 = (*(void *)(v14 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v11);
  v19 = (char *)&v2 - v6;
  uint64_t v8 = sub_10002A350();
  uint64_t v7 = qword_100038FF8;
  sub_100005904(v8, qword_100038FF8);
  uint64_t v18 = sub_1000059AC(v8, (uint64_t)v7);
  unsigned int v16 = 1;
  sub_10002A470("Block Sender Option", 0x13uLL, 1);
  sub_10002A400();
  sub_100005A10();
  sub_100005A28(v13);
  uint64_t v21 = v9;
  uint64_t v22 = 36;
  __int16 v23 = 2;
  sub_10002A3B0();
  (*(void (**)(char *, void, void, uint64_t))(v14 + 56))(v20, v16, v16, v17);
  return sub_10002A340();
}

uint64_t sub_10000CAFC()
{
  if (qword_1000380D0 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_10002A350();
  return sub_1000059AC(v0, (uint64_t)qword_100038FF8);
}

uint64_t sub_10000CB6C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_10000CAFC();
  uint64_t v1 = sub_10002A350();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v1 - 8) + 16))(a1, v3);
}

uint64_t sub_10000CBD0()
{
  uint64_t v0 = sub_100005894(&qword_100038548);
  unint64_t v8 = (*(void *)(*(void *)(v0 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v0);
  v26 = (char *)&v8 - v8;
  uint64_t v1 = sub_100005894(&qword_100038220);
  unint64_t v9 = (*(void *)(*(void *)(v1 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v1);
  v25 = (char *)&v8 - v9;
  uint64_t v29 = 0;
  uint64_t v15 = sub_10002A3A0();
  uint64_t v11 = *(void *)(v15 - 8);
  uint64_t v12 = v15 - 8;
  unint64_t v10 = (*(void *)(v11 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v15);
  v24 = (char *)&v8 - v10;
  uint64_t v28 = sub_100005894(&qword_100038550);
  uint64_t v27 = sub_10002A510();
  uint64_t v14 = v2;
  uint64_t v13 = *(int *)(v28 + 48);
  *unint64_t v2 = 0;
  unsigned int v18 = 1;
  sub_10002A470("Leave in Inbox", 0xEuLL, 1);
  sub_10002A370();
  uint64_t v17 = *(void (**)(char *, void, void, uint64_t))(v11 + 56);
  uint64_t v16 = v11 + 56;
  v17(v25, v18, v18, v15);
  uint64_t v19 = sub_10002A240();
  uint64_t v3 = *(void *)(v19 - 8);
  uint64_t v21 = *(void (**)(char *, void))(v3 + 56);
  uint64_t v20 = v3 + 56;
  v21(v26, v18);
  sub_10002A260();
  char v4 = v18;
  uint64_t v5 = *(void *)(*(void *)(v28 - 8) + 72);
  uint64_t v23 = *(int *)(v28 + 48);
  uint64_t v22 = &v14[v5];
  *uint64_t v22 = 1;
  sub_10002A470("Move to Trash", 0xDuLL, v4 & 1);
  sub_10002A370();
  v17(v25, v18, v18, v15);
  ((void (*)(char *, void, void, uint64_t))v21)(v26, v18, v18, v19);
  sub_10002A260();
  uint64_t v6 = v27;
  sub_10000CF1C();
  uint64_t v31 = v6;
  uint64_t v30 = sub_10002A270();
  sub_10000CF60();
  uint64_t result = sub_10002A3F0();
  qword_100039010 = result;
  return result;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_10000CF1C()
{
}

unint64_t sub_10000CF60()
{
  uint64_t v2 = qword_100038558;
  if (!qword_100038558)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038558);
    return WitnessTable;
  }
  return v2;
}

uint64_t *sub_10000CFE0()
{
  if (qword_1000380D8 != -1) {
    swift_once();
  }
  return &qword_100039010;
}

uint64_t sub_10000D044()
{
  uint64_t v1 = sub_10000CFE0();
  swift_beginAccess();
  uint64_t v2 = *v1;
  swift_bridgeObjectRetain();
  swift_endAccess();
  return v2;
}

uint64_t sub_10000D09C(uint64_t a1)
{
  if (!a1)
  {
    char v3 = 0;
    return v3 & 1;
  }
  if (a1 == 1)
  {
    char v3 = 1;
    return v3 & 1;
  }
  return 2;
}

uint64_t sub_10000D114()
{
  uint64_t result = sub_10002A510();
  *uint64_t v1 = 0;
  v1[1] = 1;
  sub_10000CF1C();
  return result;
}

BOOL sub_10000D164(char a1)
{
  return (a1 & 1) != 0;
}

uint64_t sub_10000D1A4()
{
  return sub_10002A520() & 1;
}

unint64_t sub_10000D1F0()
{
  uint64_t v2 = qword_100038560;
  if (!qword_100038560)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038560);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_10000D270()
{
  return sub_10002A480();
}

uint64_t sub_10000D2B0()
{
  return sub_10002A4A0();
}

uint64_t sub_10000D2F8()
{
  return sub_10002A490();
}

uint64_t sub_10000D340@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_10000D09C(*a1);
  *a2 = result;
  return result;
}

BOOL sub_10000D370@<W0>(BOOL *a1@<X8>)
{
  BOOL result = sub_10000D164(*v1 & 1);
  *a1 = result;
  return result;
}

uint64_t sub_10000D3A4@<X0>(uint64_t a1@<X8>)
{
  return sub_10000CB6C(a1);
}

uint64_t sub_10000D3BC()
{
  return sub_100029FA0();
}

unint64_t sub_10000D3F4()
{
  uint64_t v2 = qword_100038568;
  if (!qword_100038568)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038568);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_10000D474()
{
  return sub_10000D044();
}

uint64_t sub_10000D48C()
{
  return sub_10002A300();
}

unint64_t sub_10000D4C4()
{
  uint64_t v2 = qword_100038570;
  if (!qword_100038570)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038570);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_10000D544@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10000D114();
  *a1 = result;
  return result;
}

unint64_t sub_10000D570()
{
  return sub_10000B724();
}

unint64_t sub_10000D588()
{
  return sub_10000BABC();
}

unint64_t sub_10000D5A0()
{
  return sub_10000D5B8();
}

unint64_t sub_10000D5B8()
{
  uint64_t v2 = qword_100038578;
  if (!qword_100038578)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038578);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_10000D638()
{
  return sub_10000D650();
}

unint64_t sub_10000D650()
{
  uint64_t v2 = qword_100038580;
  if (!qword_100038580)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038580);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_10000D6D0()
{
  return sub_10000D6E8();
}

unint64_t sub_10000D6E8()
{
  uint64_t v2 = qword_100038588;
  if (!qword_100038588)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038588);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_10000D768()
{
  return sub_10000D780();
}

unint64_t sub_10000D780()
{
  uint64_t v2 = qword_100038590;
  if (!qword_100038590)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038590);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_10000D800()
{
  return sub_10000BD90();
}

unint64_t sub_10000D818()
{
  return sub_10000D830();
}

unint64_t sub_10000D830()
{
  uint64_t v2 = qword_100038598;
  if (!qword_100038598)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038598);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_10000D8B0()
{
  return sub_10000D8C8();
}

unint64_t sub_10000D8C8()
{
  uint64_t v2 = qword_1000385A0;
  if (!qword_1000385A0)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_1000385A0);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_10000D948()
{
  return sub_10000D960();
}

unint64_t sub_10000D960()
{
  uint64_t v2 = qword_1000385A8;
  if (!qword_1000385A8)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_1000385A8);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_10000D9E0()
{
  return sub_10000B814();
}

unint64_t sub_10000D9F8()
{
  return sub_10000DA10();
}

unint64_t sub_10000DA10()
{
  uint64_t v2 = qword_1000385B0;
  if (!qword_1000385B0)
  {
    sub_100007684(&qword_1000385B8);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_1000385B0);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_10000DA94()
{
  return sub_10000DAAC();
}

unint64_t sub_10000DAAC()
{
  uint64_t v2 = qword_1000385C0;
  if (!qword_1000385C0)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_1000385C0);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_10000DB2C()
{
  return sub_10000DB44();
}

unint64_t sub_10000DB44()
{
  uint64_t v2 = qword_1000385C8;
  if (!qword_1000385C8)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_1000385C8);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_10000DBC4()
{
  return sub_10000B654();
}

unint64_t sub_10000DBDC()
{
  return sub_10000DBF4();
}

unint64_t sub_10000DBF4()
{
  uint64_t v2 = qword_1000385D0;
  if (!qword_1000385D0)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_1000385D0);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_10000DC74()
{
  return sub_10000DC8C();
}

unint64_t sub_10000DC8C()
{
  uint64_t v2 = qword_1000385D8;
  if (!qword_1000385D8)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_1000385D8);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_10000DD0C()
{
  return sub_10000DD24();
}

unint64_t sub_10000DD24()
{
  uint64_t v2 = qword_1000385E0;
  if (!qword_1000385E0)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_1000385E0);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_10000DDA4()
{
  return sub_10000DDBC();
}

unint64_t sub_10000DDBC()
{
  uint64_t v2 = qword_1000385E8;
  if (!qword_1000385E8)
  {
    sub_100007684(&qword_1000385F0);
    sub_10000D960();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_1000385E8);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_10000DE50()
{
  return sub_10000DE68();
}

unint64_t sub_10000DE68()
{
  uint64_t v2 = qword_1000385F8;
  if (!qword_1000385F8)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_1000385F8);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_10000DEE8()
{
  return sub_10000C6C4();
}

unint64_t sub_10000DF00()
{
  return sub_10000DF18();
}

unint64_t sub_10000DF18()
{
  uint64_t v2 = qword_100038600;
  if (!qword_100038600)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038600);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_10000DF98()
{
  return sub_10000DFB0();
}

unint64_t sub_10000DFB0()
{
  uint64_t v2 = qword_100038608;
  if (!qword_100038608)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038608);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_10000E030()
{
  return sub_10000E048();
}

unint64_t sub_10000E048()
{
  uint64_t v2 = qword_100038610;
  if (!qword_100038610)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038610);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_10000E0C8()
{
  return sub_10000D1F0();
}

void *sub_10000E0E0()
{
  return &protocol witness table for Int;
}

unint64_t sub_10000E0EC()
{
  return sub_10000E104();
}

unint64_t sub_10000E104()
{
  uint64_t v2 = qword_100038618;
  if (!qword_100038618)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038618);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_10000E184()
{
  return sub_10000E19C();
}

unint64_t sub_10000E19C()
{
  uint64_t v2 = qword_100038620;
  if (!qword_100038620)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038620);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_10000E21C()
{
  return sub_10000E234();
}

unint64_t sub_10000E234()
{
  uint64_t v2 = qword_100038628;
  if (!qword_100038628)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038628);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_10000E2B4()
{
  return sub_10000D4C4();
}

uint64_t sub_10000E2CC()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_10000E328()
{
  return sub_10000E340();
}

unint64_t sub_10000E340()
{
  uint64_t v2 = qword_100038630;
  if (!qword_100038630)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038630);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_10000E3C0()
{
  return sub_10000E3D8();
}

unint64_t sub_10000E3D8()
{
  uint64_t v2 = qword_100038638;
  if (!qword_100038638)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038638);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_10000E458()
{
  return sub_10000CF60();
}

unint64_t sub_10000E470()
{
  return sub_10000E488();
}

unint64_t sub_10000E488()
{
  uint64_t v2 = qword_100038640;
  if (!qword_100038640)
  {
    sub_100007684(&qword_100038648);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038640);
    return WitnessTable;
  }
  return v2;
}

void *type metadata accessor for BlockedSenderPreferenceEntity()
{
  return &unk_100034D18;
}

void *type metadata accessor for BlockSenderActionEntityQuery()
{
  return &unk_100034D40;
}

void *type metadata accessor for BlockSenderActionEntityUpdateHandler()
{
  return &unk_100034D60;
}

unsigned char *initializeBufferWithCopyOfBuffer for AttachmentRepliesOption(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t sub_10000E558(unsigned __int8 *a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 <= 0xFE) {
      goto LABEL_15;
    }
    unsigned int v7 = ((a2 + 1) >> 8) + 1;
    int v8 = 1;
    if (v7 >= 0x100)
    {
      if (v7 >= 0x10000) {
        int v2 = 4;
      }
      else {
        int v2 = 2;
      }
      int v8 = v2;
    }
    if (v8 == 1) {
      int v6 = a1[1];
    }
    else {
      int v6 = v8 == 2 ? *(unsigned __int16 *)(a1 + 1) : *(_DWORD *)(a1 + 1);
    }
    if (v6)
    {
      int v5 = (*a1 | ((v6 - 1) << 8)) + 254;
    }
    else
    {
LABEL_15:
      int v3 = *a1 - 2;
      if (v3 < 0) {
        int v3 = -1;
      }
      int v5 = v3;
    }
  }
  else
  {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *sub_10000E708(unsigned char *result, unsigned int a2, unsigned int a3)
{
  int v7 = 0;
  if (a3 > 0xFE)
  {
    unsigned int v5 = ((a3 + 1) >> 8) + 1;
    int v6 = 1;
    if (v5 >= 0x100)
    {
      if (v5 >= 0x10000) {
        int v3 = 4;
      }
      else {
        int v3 = 2;
      }
      int v6 = v3;
    }
    int v7 = v6;
  }
  if (a2 > 0xFE)
  {
    unsigned int v4 = ((a2 - 255) >> 8) + 1;
    *uint64_t result = a2 + 1;
    if (v7)
    {
      if (v7 == 1)
      {
        result[1] = v4;
      }
      else if (v7 == 2)
      {
        *(_WORD *)(result + 1) = v4;
      }
      else
      {
        *(_DWORD *)(result + 1) = v4;
      }
    }
  }
  else
  {
    if (v7)
    {
      if (v7 == 1)
      {
        result[1] = 0;
      }
      else if (v7 == 2)
      {
        *(_WORD *)(result + 1) = 0;
      }
      else
      {
        *(_DWORD *)(result + 1) = 0;
      }
    }
    if (a2) {
      *uint64_t result = a2 + 1;
    }
  }
  return result;
}

uint64_t sub_10000E94C(unsigned char *a1)
{
  return *a1 & 1;
}

unsigned char *sub_10000E958(unsigned char *result, char a2)
{
  *uint64_t result = a2 & 1;
  return result;
}

void *type metadata accessor for BlockedSenderPreferenceEntity.BlockedSenderOption()
{
  return &unk_100034DF0;
}

uint64_t sub_10000E97C(uint64_t a1, void *a2)
{
  *(void *)(v2 + 144) = a1;
  *(void *)(v2 + 112) = v2;
  *(void *)(v2 + 120) = 0;
  *(void *)(v2 + 128) = 0;
  *(unsigned char *)(v2 + 152) = 0;
  *(void *)(v2 + 120) = *a2;
  return _swift_task_switch(sub_10000E9C0, 0);
}

uint64_t sub_10000E9C0()
{
  *(void *)(v0 + 112) = v0;
  uint64_t v13 = (void *)*sub_10000AFDC();
  id v1 = v13;
  if (v13)
  {
    sub_10000B44C();
    swift_bridgeObjectRetain();
    NSString v10 = sub_10002A460();
    swift_bridgeObjectRelease();
    id v11 = [v13 objectForKey:v10];

    if (v11)
    {
      sub_10002A4E0();
      sub_10000F050(v12 + 80, v12 + 48);
      swift_unknownObjectRelease();
    }
    else
    {
      *(void *)(v12 + 48) = 0;
      *(void *)(v12 + 56) = 0;
      *(void *)(v12 + 64) = 0;
      *(void *)(v12 + 72) = 0;
    }
    sub_10000EFEC((_OWORD *)(v12 + 48), (_OWORD *)(v12 + 16));
  }
  else
  {
    *(void *)(v12 + 16) = 0;
    *(void *)(v12 + 24) = 0;
    *(void *)(v12 + 32) = 0;
    *(void *)(v12 + 40) = 0;
  }
  if (*(void *)(v12 + 40))
  {
    if (swift_dynamicCast())
    {
      uint64_t v6 = *(void *)(v12 + 136);
      char v7 = 0;
    }
    else
    {
      uint64_t v6 = 0;
      char v7 = 1;
    }
    uint64_t v8 = v6;
    char v9 = v7;
  }
  else
  {
    sub_10000EEFC(v12 + 16);
    uint64_t v8 = 0;
    char v9 = 1;
  }
  if ((v9 & 1) != 0 || (*(void *)(v12 + 128) = v8, char v5 = sub_10000D09C(v8), v5 == 2))
  {
    **(unsigned char **)(v12 + 144) = 1;
  }
  else
  {
    uint64_t v2 = *(unsigned char **)(v12 + 144);
    *(unsigned char *)(v12 + 152) = v5 & 1;
    *uint64_t v2 = v5 & 1;
  }
  int v3 = *(uint64_t (**)(void))(*(void *)(v12 + 112) + 8);
  return v3();
}

uint64_t sub_10000ED34(void *a1, char *a2)
{
  *(void *)(v2 + 16) = v2;
  *(void *)(v2 + 24) = 0;
  *(unsigned char *)(v2 + 32) = 0;
  *(void *)(v2 + 24) = *a1;
  char v3 = *a2;
  *(unsigned char *)(v2 + 33) = *a2 & 1;
  *(unsigned char *)(v2 + 32) = v3 & 1;
  return _swift_task_switch(sub_10000ED94, 0);
}

uint64_t sub_10000ED94()
{
  *(void *)(v0 + 16) = v0;
  char v7 = (void *)*sub_10000AFDC();
  id v1 = v7;
  if (v7)
  {
    BOOL v4 = sub_10000D164(*(unsigned char *)(v6 + 33) & 1);
    sub_10000B44C();
    swift_bridgeObjectRetain();
    NSString v5 = sub_10002A460();
    swift_bridgeObjectRelease();
    [v7 setInteger:v4 forKey:v5];
  }
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(v6 + 16) + 8);
  return v2();
}

void sub_10000EEF0()
{
  *uint64_t v0 = *v0;
}

uint64_t sub_10000EEFC(uint64_t a1)
{
  if (*(void *)(a1 + 24)) {
    sub_10000EF40(a1);
  }
  return a1;
}

uint64_t sub_10000EF40(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 24);
  if ((*(_DWORD *)(*(void *)(v2 - 8) + 80) & 0x20000) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(uint64_t))(*(void *)(v2 - 8) + 8))(a1);
  }
}

_OWORD *sub_10000EFEC(_OWORD *a1, _OWORD *a2)
{
  *a2 = *a1;
  a2[1] = a1[1];
  return a2;
}

__n128 sub_10000F050(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a2 = *(_OWORD *)a1;
  __n128 result = *(__n128 *)(a1 + 16);
  *(__n128 *)(a2 + 16) = result;
  return result;
}

uint64_t sub_10000F06C()
{
  uint64_t result = sub_10002A470("com.apple.Preferences", 0x15uLL, 1);
  qword_100039018 = result;
  qword_100039020 = v1;
  return result;
}

uint64_t *sub_10000F0B0()
{
  if (qword_1000380E0 != -1) {
    swift_once();
  }
  return &qword_100039018;
}

uint64_t sub_10000F114()
{
  uint64_t v1 = *sub_10000F0B0();
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_10000F150()
{
  if (qword_1000380E8 != -1) {
    swift_once();
  }
  return v1;
}

uint64_t sub_10000F1B0()
{
  return sub_10000F150();
}

uint64_t sub_10000F1C8()
{
  if (qword_1000380F0 != -1) {
    swift_once();
  }
  return v1;
}

uint64_t sub_10000F228()
{
  return sub_10000F1C8();
}

id sub_10000F240()
{
  id result = objc_msgSend(self, "em_userDefaults");
  qword_100039028 = (uint64_t)result;
  return result;
}

uint64_t *sub_10000F27C()
{
  if (qword_1000380F8 != -1) {
    swift_once();
  }
  return &qword_100039028;
}

uint64_t sub_10000F2E0()
{
  char v9 = "Title for entity representing the \"Collapsed Read Messages\" setting in Mail";
  uint64_t v0 = sub_100005894(&qword_100038220);
  unint64_t v2 = (*(void *)(*(void *)(v0 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v0);
  uint64_t v20 = (char *)&v2 - v2;
  uint64_t v11 = 0;
  unint64_t v3 = (*(void *)(*(void *)(sub_10002A380() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v11);
  uint64_t v13 = (uint64_t)&v2 - v3;
  unint64_t v4 = (*(void *)(*(void *)(sub_10002A3D0() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v11);
  uint64_t v12 = (char *)&v2 - v4;
  unint64_t v5 = (*(void *)(*(void *)(sub_10002A450() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v11);
  NSString v10 = (char *)&v2 - v5;
  uint64_t v17 = sub_10002A3A0();
  uint64_t v14 = *(void *)(v17 - 8);
  uint64_t v15 = v17 - 8;
  unint64_t v6 = (*(void *)(v14 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v11);
  uint64_t v19 = (char *)&v2 - v6;
  uint64_t v8 = sub_10002A350();
  char v7 = qword_100039030;
  sub_100005904(v8, qword_100039030);
  uint64_t v18 = sub_1000059AC(v8, (uint64_t)v7);
  unsigned int v16 = 1;
  sub_10002A470("Collapsed Read Messages", 0x17uLL, 1);
  sub_10002A400();
  sub_100005A10();
  sub_100005A28(v13);
  uint64_t v21 = v9;
  uint64_t v22 = 75;
  __int16 v23 = 2;
  sub_10002A3B0();
  (*(void (**)(char *, void, void, uint64_t))(v14 + 56))(v20, v16, v16, v17);
  return sub_10002A340();
}

uint64_t sub_10000F5D4()
{
  if (qword_100038100 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_10002A350();
  return sub_1000059AC(v0, (uint64_t)qword_100039030);
}

uint64_t sub_10000F644@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_10000F5D4();
  uint64_t v1 = sub_10002A350();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v1 - 8) + 16))(a1, v3);
}

uint64_t sub_10000F6A8()
{
  uint64_t result = sub_10002A470("CollapseReadConversationMessages", 0x20uLL, 1);
  qword_100038668 = result;
  qword_100038670 = v1;
  return result;
}

uint64_t *sub_10000F6EC()
{
  if (qword_100038108 != -1) {
    swift_once();
  }
  return &qword_100038668;
}

uint64_t sub_10000F750()
{
  unint64_t v6 = "Title for entity representing the \"Collapsed Read Messages\" setting in Mail";
  uint64_t v8 = 0;
  uint64_t v11 = &unk_100038798;
  uint64_t v12 = &unk_1000387A0;
  uint64_t v14 = &v19;
  uint64_t v19 = 0;
  unint64_t v2 = (*(void *)(*(void *)(sub_10002A380() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(0);
  uint64_t v10 = (uint64_t)&v2 - v2;
  unint64_t v3 = (*(void *)(*(void *)(sub_10002A3D0() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v8);
  char v9 = (char *)&v2 - v3;
  unint64_t v4 = (*(void *)(*(void *)(sub_10002A450() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v8);
  char v7 = (char *)&v2 - v4;
  uint64_t v0 = sub_10002A3A0();
  unint64_t v5 = (*(void *)(*(void *)(v0 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v0);
  uint64_t v13 = (char *)&v2 - v5;
  sub_100005894(&qword_100038790);
  sub_10002A470("Collapsed Read Messages", 0x17uLL, 1);
  sub_10002A400();
  sub_100005A10();
  sub_100005A28(v10);
  unsigned int v16 = v6;
  uint64_t v17 = 75;
  __int16 v18 = 2;
  sub_10002A3B0();
  sub_100010A58();
  uint64_t v15 = sub_10002A330();
  swift_retain();
  uint64_t v19 = v15;
  sub_10000777C();
  return v15;
}

uint64_t sub_10000F9E4()
{
  return sub_10000F228();
}

uint64_t sub_10000F9FC()
{
  return sub_10000F114();
}

uint64_t sub_10000FA14()
{
  return sub_10000F1B0();
}

uint64_t sub_10000FA2C@<X0>(uint64_t *a1@<X8>)
{
  sub_10000FA6C();
  uint64_t result = sub_10002A050();
  *a1 = result;
  a1[1] = v2;
  return result;
}

unint64_t sub_10000FA6C()
{
  uint64_t v2 = qword_100038678;
  if (!qword_100038678)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038678);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_10000FAEC@<X0>(uint64_t a1@<X8>)
{
  return sub_10000F644(a1);
}

uint64_t sub_10000FB04()
{
  return sub_100029FB0();
}

unint64_t sub_10000FB3C()
{
  uint64_t v2 = qword_100038680;
  if (!qword_100038680)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038680);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_10000FBBC()
{
  return sub_10002A040();
}

uint64_t sub_10000FBF4()
{
  return sub_10002A360();
}

unint64_t sub_10000FC2C()
{
  uint64_t v2 = qword_100038688;
  if (!qword_100038688)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038688);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_10000FCAC()
{
  *(void *)(v0 + 16) = v0;
  return _swift_task_switch(sub_10000FCD4, 0);
}

uint64_t sub_10000FCD4()
{
  *(void *)(v0 + 16) = v0;
  uint64_t v1 = sub_10000F750();
  uint64_t v2 = *(uint64_t (**)(uint64_t))(*(void *)(v0 + 16) + 8);
  return v2(v1);
}

uint64_t sub_10000FD60(uint64_t a1)
{
  uint64_t v4 = v1;
  *(void *)(v1 + 24) = a1;
  *(void *)(v1 + 16) = v1;
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v4 + 32) = v2;
  *uint64_t v2 = *(void *)(v4 + 16);
  v2[1] = sub_1000061C8;
  return sub_10000FCAC();
}

uint64_t sub_10000FE10(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = v2;
  *(void *)(v2 + 24) = a1;
  *(void *)(v2 + 16) = v2;
  unint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v6 + 32) = v3;
  unint64_t v4 = sub_10000FED4();
  *unint64_t v3 = *(void *)(v6 + 16);
  v3[1] = sub_1000061C8;
  return _UniqueEntityQuery.allEntities()(a2, v4);
}

unint64_t sub_10000FED4()
{
  uint64_t v2 = qword_1000386A8[0];
  if (!qword_1000386A8[0])
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, qword_1000386A8);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_10000FF54(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = v2;
  *(void *)(v2 + 16) = v2;
  unint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v6 + 24) = v3;
  unint64_t v4 = sub_10000FED4();
  *unint64_t v3 = *(void *)(v6 + 16);
  v3[1] = sub_10000659C;
  return _UniqueEntityQuery.entities(for:)(a1, a2, v4);
}

uint64_t sub_10001001C(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = v2;
  *(void *)(v2 + 24) = a1;
  *(void *)(v2 + 16) = v2;
  unint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v6 + 32) = v3;
  unint64_t v4 = sub_10000FED4();
  *unint64_t v3 = *(void *)(v6 + 16);
  v3[1] = sub_1000061C8;
  return _UniqueEntityQuery.suggestedEntities()(a2, v4);
}

uint64_t sub_1000100E0(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = v2;
  *(void *)(v2 + 16) = v2;
  unint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v6 + 24) = v3;
  unint64_t v4 = sub_1000101A8();
  *unint64_t v3 = *(void *)(v6 + 16);
  v3[1] = sub_1000068C4;
  return EntityQuery.results()(a1, a2, v4);
}

unint64_t sub_1000101A8()
{
  uint64_t v2 = qword_1000386C8;
  if (!qword_1000386C8)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_1000386C8);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_100010228(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(v3 + 56) = a3;
  *(void *)(v3 + 48) = a1;
  *(void *)(v3 + 16) = v3;
  *(void *)(v3 + 24) = 0;
  *(void *)(v3 + 32) = 0;
  *(unsigned char *)(v3 + 136) = 0;
  uint64_t v4 = sub_100005894(&qword_100038290);
  *(void *)(v3 + 64) = v4;
  *(void *)(v3 + 72) = *(void *)(v4 - 8);
  *(void *)(v3 + 80) = swift_task_alloc();
  *(void *)(v3 + 24) = a2;
  *(void *)(v3 + 32) = a3;
  return _swift_task_switch(sub_100010344, 0);
}

uint64_t sub_100010344()
{
  *(void *)(v0 + 16) = v0;
  uint64_t KeyPath = swift_getKeyPath();
  *(void *)(v0 + 88) = KeyPath;
  uint64_t v1 = (void *)swift_task_alloc();
  v4[12] = v1;
  uint64_t v6 = sub_100005894(&qword_1000386E0);
  v4[13] = sub_100010A58();
  *uint64_t v1 = v4[2];
  v1[1] = sub_100010434;
  uint64_t v2 = v4[10];
  return _AppEntityUpdate.value<A>(of:)(v2, KeyPath, v6);
}

uint64_t sub_100010434()
{
  *(void *)(*(void *)v0 + 16) = *(void *)v0;
  swift_task_dealloc();
  swift_release();
  return _swift_task_switch(sub_10001056C, 0);
}

uint64_t sub_10001056C()
{
  uint64_t v1 = v0[10];
  uint64_t v2 = v0[9];
  uint64_t v3 = v0[8];
  v0[2] = v0;
  if ((*(unsigned int (**)(uint64_t, uint64_t))(v2 + 88))(v1, v3) == enum case for _IntentValueState.set<A>(_:))
  {
    uint64_t v8 = *(char **)(v11 + 80);
    (*(void (**)(void))(*(void *)(v11 + 72) + 96))();
    char v9 = *v8;
    *(unsigned char *)(v11 + 136) = *v8 & 1;
    *(void *)(v11 + 40) = sub_10000F750();
    *(unsigned char *)(v11 + 137) = v9 & 1;
    uint64_t KeyPath = swift_getKeyPath();
    *(void *)(v11 + 112) = KeyPath;
    uint64_t v6 = (void *)swift_task_alloc();
    *(void *)(v11 + 120) = v6;
    void *v6 = *(void *)(v11 + 16);
    v6[1] = sub_1000107D8;
    uint64_t v7 = *(void *)(v11 + 104);
    return AppEntity._setValue<A>(_:for:)(v11 + 137, KeyPath, v7);
  }
  else
  {
    (*(void (**)(void, void))(*(void *)(v11 + 72) + 8))(*(void *)(v11 + 80), *(void *)(v11 + 64));
    sub_100010ADC();
    sub_100029F70();
    swift_task_dealloc();
    uint64_t v4 = *(uint64_t (**)(void))(*(void *)(v11 + 16) + 8);
    return v4();
  }
}

uint64_t sub_1000107D8()
{
  uint64_t v4 = *v1;
  *(void *)(v4 + 16) = *v1;
  *(void *)(v4 + 128) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_1000074FC;
  }
  else
  {
    swift_release();
    sub_10000777C();
    uint64_t v2 = sub_100010968;
  }
  return _swift_task_switch(v2, 0);
}

uint64_t sub_100010968()
{
  *(void *)(v0 + 16) = v0;
  sub_100010ADC();
  sub_100029F70();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(*(void *)(v0 + 16) + 8);
  return v1();
}

uint64_t sub_100010A40@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_1000075B8(a1, a2);
}

unint64_t sub_100010A58()
{
  uint64_t v2 = qword_1000386E8;
  if (!qword_1000386E8)
  {
    sub_100007684(&qword_1000386F0);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_1000386E8);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_100010ADC()
{
  uint64_t v2 = qword_1000386F8;
  if (!qword_1000386F8)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_1000386F8);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_100010B5C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = v3;
  *(void *)(v3 + 16) = v3;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v6 + 24) = v4;
  *uint64_t v4 = *(void *)(v6 + 16);
  v4[1] = sub_1000068C4;
  return sub_100010228(a1, a2, a3);
}

unint64_t sub_100010C20()
{
  return sub_10000FB3C();
}

unint64_t sub_100010C38()
{
  return sub_10000FED4();
}

unint64_t sub_100010C50()
{
  return sub_100010C68();
}

unint64_t sub_100010C68()
{
  uint64_t v2 = qword_100038708;
  if (!qword_100038708)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038708);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_100010CE8()
{
  return sub_100010D00();
}

unint64_t sub_100010D00()
{
  uint64_t v2 = qword_100038710;
  if (!qword_100038710)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038710);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_100010D80()
{
  return sub_100010D98();
}

unint64_t sub_100010D98()
{
  uint64_t v2 = qword_100038718;
  if (!qword_100038718)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038718);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_100010E18()
{
  return sub_100010E30();
}

unint64_t sub_100010E30()
{
  uint64_t v2 = qword_100038720;
  if (!qword_100038720)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038720);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_100010EB0()
{
  return sub_1000101A8();
}

unint64_t sub_100010EC8()
{
  return sub_100010EE0();
}

unint64_t sub_100010EE0()
{
  uint64_t v2 = qword_100038728;
  if (!qword_100038728)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038728);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_100010F60()
{
  return sub_100010F78();
}

unint64_t sub_100010F78()
{
  uint64_t v2 = qword_100038730;
  if (!qword_100038730)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038730);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_100010FF8()
{
  return sub_100011010();
}

unint64_t sub_100011010()
{
  uint64_t v2 = qword_100038738;
  if (!qword_100038738)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038738);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_100011090()
{
  return sub_10000FC2C();
}

unint64_t sub_1000110A8()
{
  return sub_1000110C0();
}

unint64_t sub_1000110C0()
{
  uint64_t v2 = qword_100038740;
  if (!qword_100038740)
  {
    sub_100007684(&qword_100038748);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038740);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_100011144()
{
  return sub_10001115C();
}

unint64_t sub_10001115C()
{
  uint64_t v2 = qword_100038750;
  if (!qword_100038750)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038750);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_1000111DC()
{
  return sub_1000111F4();
}

unint64_t sub_1000111F4()
{
  uint64_t v2 = qword_100038758;
  if (!qword_100038758)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038758);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_100011274()
{
  return sub_10000FA6C();
}

unint64_t sub_10001128C()
{
  return sub_1000112A4();
}

unint64_t sub_1000112A4()
{
  uint64_t v2 = qword_100038760;
  if (!qword_100038760)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038760);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_100011324()
{
  return sub_10001133C();
}

unint64_t sub_10001133C()
{
  uint64_t v2 = qword_100038768;
  if (!qword_100038768)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038768);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_1000113BC()
{
  return sub_1000113D4();
}

unint64_t sub_1000113D4()
{
  uint64_t v2 = qword_100038770;
  if (!qword_100038770)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038770);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_100011454()
{
  return sub_10001146C();
}

unint64_t sub_10001146C()
{
  uint64_t v2 = qword_100038778;
  if (!qword_100038778)
  {
    sub_100007684(&qword_100038780);
    sub_100011010();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038778);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_100011500()
{
  return sub_100011518();
}

unint64_t sub_100011518()
{
  uint64_t v2 = qword_100038788;
  if (!qword_100038788)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038788);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_100011598()
{
  return sub_100010ADC();
}

void *type metadata accessor for CollapsedReadMessagesPreferenceEntity()
{
  return &unk_100034E10;
}

void *type metadata accessor for CollapsedReadMessagesEntityQuery()
{
  return &unk_100034E38;
}

void *type metadata accessor for CollapsedReadMessagesEntityUpdateHandler()
{
  return &unk_100034E58;
}

uint64_t sub_1000115EC(uint64_t a1, void *a2)
{
  v2[4] = a1;
  v2[2] = v2;
  v2[3] = 0;
  v2[3] = *a2;
  return _swift_task_switch(sub_100011630, 0);
}

uint64_t sub_100011630()
{
  *(void *)(v0 + 16) = v0;
  uint64_t v8 = (void *)*sub_10000F27C();
  id v1 = v8;
  if (v8)
  {
    sub_10000F6EC();
    swift_bridgeObjectRetain();
    NSString v4 = sub_10002A460();
    swift_bridgeObjectRelease();
    unsigned __int8 v5 = [v8 BOOLForKey:v4];

    char v6 = v5 & 1;
  }
  else
  {
    char v6 = 2;
  }
  if (v6 == 2) {
    **(unsigned char **)(v7 + 32) = 1;
  }
  else {
    **(unsigned char **)(v7 + 32) = v6;
  }
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(v7 + 16) + 8);
  return v2();
}

uint64_t sub_1000117D4(void *a1, char *a2)
{
  *(void *)(v2 + 16) = v2;
  *(void *)(v2 + 24) = 0;
  *(unsigned char *)(v2 + 32) = 0;
  *(void *)(v2 + 24) = *a1;
  char v3 = *a2;
  *(unsigned char *)(v2 + 33) = *a2 & 1;
  *(unsigned char *)(v2 + 32) = v3 & 1;
  return _swift_task_switch(sub_100011834, 0);
}

uint64_t sub_100011834()
{
  *(void *)(v0 + 16) = v0;
  uint64_t v7 = (void *)*sub_10000F27C();
  id v1 = v7;
  if (v7)
  {
    char v4 = *(unsigned char *)(v6 + 33);
    sub_10000F6EC();
    swift_bridgeObjectRetain();
    NSString v5 = sub_10002A460();
    swift_bridgeObjectRelease();
    [v7 setBool:v4 & 1 forKey:v5];
  }
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(v6 + 16) + 8);
  return v2();
}

uint64_t sub_10001198C()
{
  uint64_t result = sub_10002A470("com.apple.Preferences", 0x15uLL, 1);
  qword_100039048 = result;
  qword_100039050 = v1;
  return result;
}

uint64_t *sub_1000119D0()
{
  if (qword_100038110 != -1) {
    swift_once();
  }
  return &qword_100039048;
}

uint64_t sub_100011A34()
{
  uint64_t v1 = *sub_1000119D0();
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_100011A70()
{
  if (qword_100038118 != -1) {
    swift_once();
  }
  return v1;
}

uint64_t sub_100011AD0()
{
  return sub_100011A70();
}

uint64_t sub_100011AE8()
{
  if (qword_100038120 != -1) {
    swift_once();
  }
  return v1;
}

uint64_t sub_100011B48()
{
  return sub_100011AE8();
}

id sub_100011B60()
{
  id result = objc_msgSend(self, "em_userDefaults");
  qword_100039058 = (uint64_t)result;
  return result;
}

uint64_t *sub_100011B9C()
{
  if (qword_100038128 != -1) {
    swift_once();
  }
  return &qword_100039058;
}

uint64_t sub_100011C00()
{
  uint64_t v9 = "Title for entity representing the \"Include Attachments with Replies\" setting in Mail";
  uint64_t v0 = sub_100005894(&qword_100038220);
  unint64_t v2 = (*(void *)(*(void *)(v0 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v0);
  uint64_t v20 = (char *)&v2 - v2;
  uint64_t v11 = 0;
  unint64_t v3 = (*(void *)(*(void *)(sub_10002A380() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v11);
  uint64_t v13 = (uint64_t)&v2 - v3;
  unint64_t v4 = (*(void *)(*(void *)(sub_10002A3D0() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v11);
  uint64_t v12 = (char *)&v2 - v4;
  unint64_t v5 = (*(void *)(*(void *)(sub_10002A450() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v11);
  uint64_t v10 = (char *)&v2 - v5;
  uint64_t v17 = sub_10002A3A0();
  uint64_t v14 = *(void *)(v17 - 8);
  uint64_t v15 = v17 - 8;
  unint64_t v6 = (*(void *)(v14 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v11);
  uint64_t v19 = (char *)&v2 - v6;
  uint64_t v8 = sub_10002A350();
  uint64_t v7 = qword_100039060;
  sub_100005904(v8, qword_100039060);
  uint64_t v18 = sub_1000059AC(v8, (uint64_t)v7);
  unsigned int v16 = 1;
  sub_10002A470("Include Attachments with Replies", 0x20uLL, 1);
  sub_10002A400();
  sub_100005A10();
  sub_100005A28(v13);
  uint64_t v21 = v9;
  uint64_t v22 = 84;
  __int16 v23 = 2;
  sub_10002A3B0();
  (*(void (**)(char *, void, void, uint64_t))(v14 + 56))(v20, v16, v16, v17);
  return sub_10002A340();
}

uint64_t sub_100011EF4()
{
  if (qword_100038130 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_10002A350();
  return sub_1000059AC(v0, (uint64_t)qword_100039060);
}

uint64_t sub_100011F64@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_100011EF4();
  uint64_t v1 = sub_10002A350();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v1 - 8) + 16))(a1, v3);
}

uint64_t sub_100011FC8()
{
  uint64_t result = sub_10002A470("IncludeAttachmentReplies", 0x18uLL, 1);
  qword_1000387A8 = result;
  qword_1000387B0 = v1;
  return result;
}

uint64_t *sub_10001200C()
{
  if (qword_100038138 != -1) {
    swift_once();
  }
  return &qword_1000387A8;
}

uint64_t sub_100012070()
{
  unint64_t v4 = &unk_100038958;
  unint64_t v5 = &unk_100038960;
  uint64_t v7 = &v9;
  uint64_t v9 = 0;
  uint64_t v0 = sub_10002A3A0();
  unint64_t v3 = (*(void *)(*(void *)(v0 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v0);
  unint64_t v6 = (char *)&v2 - v3;
  sub_100005894(&qword_100038950);
  sub_10002A470("Include Attachments with Replies", 0x20uLL, 1);
  sub_10002A370();
  sub_1000131E8();
  uint64_t v8 = sub_10002A330();
  swift_retain();
  uint64_t v9 = v8;
  sub_10000777C();
  return v8;
}

uint64_t sub_10001218C()
{
  return sub_100011B48();
}

uint64_t sub_1000121A4()
{
  return sub_100011A34();
}

uint64_t sub_1000121BC()
{
  return sub_100011AD0();
}

uint64_t sub_1000121D4@<X0>(uint64_t *a1@<X8>)
{
  sub_100012214();
  uint64_t result = sub_10002A050();
  *a1 = result;
  a1[1] = v2;
  return result;
}

unint64_t sub_100012214()
{
  uint64_t v2 = qword_1000387B8;
  if (!qword_1000387B8)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_1000387B8);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_100012294@<X0>(uint64_t a1@<X8>)
{
  return sub_100011F64(a1);
}

uint64_t sub_1000122AC()
{
  return sub_100029FB0();
}

unint64_t sub_1000122E4()
{
  uint64_t v2 = qword_1000387C0;
  if (!qword_1000387C0)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_1000387C0);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_100012364()
{
  return sub_10002A040();
}

uint64_t sub_10001239C()
{
  return sub_10002A360();
}

unint64_t sub_1000123D4()
{
  uint64_t v2 = qword_1000387C8;
  if (!qword_1000387C8)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_1000387C8);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_100012454()
{
  *(void *)(v0 + 16) = v0;
  return _swift_task_switch(sub_10001247C, 0);
}

uint64_t sub_10001247C()
{
  *(void *)(v0 + 16) = v0;
  uint64_t v1 = sub_100012070();
  uint64_t v2 = *(uint64_t (**)(uint64_t))(*(void *)(v0 + 16) + 8);
  return v2(v1);
}

uint64_t sub_100012508(uint64_t a1)
{
  uint64_t v4 = v1;
  *(void *)(v1 + 24) = a1;
  *(void *)(v1 + 16) = v1;
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v4 + 32) = v2;
  *uint64_t v2 = *(void *)(v4 + 16);
  v2[1] = sub_1000061C8;
  return sub_100012454();
}

uint64_t sub_1000125B8(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = v2;
  *(void *)(v2 + 24) = a1;
  *(void *)(v2 + 16) = v2;
  unint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v6 + 32) = v3;
  unint64_t v4 = sub_10001267C();
  *unint64_t v3 = *(void *)(v6 + 16);
  v3[1] = sub_1000061C8;
  return _UniqueEntityQuery.allEntities()(a2, v4);
}

unint64_t sub_10001267C()
{
  uint64_t v2 = qword_1000387E8[0];
  if (!qword_1000387E8[0])
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, qword_1000387E8);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_1000126FC(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = v2;
  *(void *)(v2 + 16) = v2;
  unint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v6 + 24) = v3;
  unint64_t v4 = sub_10001267C();
  *unint64_t v3 = *(void *)(v6 + 16);
  v3[1] = sub_10000659C;
  return _UniqueEntityQuery.entities(for:)(a1, a2, v4);
}

uint64_t sub_1000127C4(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = v2;
  *(void *)(v2 + 24) = a1;
  *(void *)(v2 + 16) = v2;
  unint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v6 + 32) = v3;
  unint64_t v4 = sub_10001267C();
  *unint64_t v3 = *(void *)(v6 + 16);
  v3[1] = sub_1000061C8;
  return _UniqueEntityQuery.suggestedEntities()(a2, v4);
}

uint64_t sub_100012888(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = v2;
  *(void *)(v2 + 16) = v2;
  unint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v6 + 24) = v3;
  unint64_t v4 = sub_100012950();
  *unint64_t v3 = *(void *)(v6 + 16);
  v3[1] = sub_1000068C4;
  return EntityQuery.results()(a1, a2, v4);
}

unint64_t sub_100012950()
{
  uint64_t v2 = qword_100038808;
  if (!qword_100038808)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038808);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_1000129D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(v3 + 56) = a3;
  *(void *)(v3 + 48) = a1;
  *(void *)(v3 + 16) = v3;
  *(void *)(v3 + 24) = 0;
  *(void *)(v3 + 32) = 0;
  *(unsigned char *)(v3 + 136) = 0;
  uint64_t v4 = sub_100005894(&qword_100038820);
  *(void *)(v3 + 64) = v4;
  *(void *)(v3 + 72) = *(void *)(v4 - 8);
  *(void *)(v3 + 80) = swift_task_alloc();
  *(void *)(v3 + 24) = a2;
  *(void *)(v3 + 32) = a3;
  return _swift_task_switch(sub_100012AEC, 0);
}

uint64_t sub_100012AEC()
{
  *(void *)(v0 + 16) = v0;
  uint64_t KeyPath = swift_getKeyPath();
  *(void *)(v0 + 88) = KeyPath;
  uint64_t v1 = (void *)swift_task_alloc();
  v4[12] = v1;
  uint64_t v6 = sub_100005894(&qword_100038828);
  v4[13] = sub_1000131E8();
  *uint64_t v1 = v4[2];
  v1[1] = sub_100012BDC;
  uint64_t v2 = v4[10];
  return _AppEntityUpdate.value<A>(of:)(v2, KeyPath, v6);
}

uint64_t sub_100012BDC()
{
  *(void *)(*(void *)v0 + 16) = *(void *)v0;
  swift_task_dealloc();
  swift_release();
  return _swift_task_switch(sub_100012D14, 0);
}

uint64_t sub_100012D14()
{
  uint64_t v1 = v0[10];
  uint64_t v2 = v0[9];
  uint64_t v3 = v0[8];
  v0[2] = v0;
  if ((*(unsigned int (**)(uint64_t, uint64_t))(v2 + 88))(v1, v3) == enum case for _IntentValueState.set<A>(_:))
  {
    uint64_t v8 = *(char **)(v11 + 80);
    (*(void (**)(void))(*(void *)(v11 + 72) + 96))();
    char v9 = *v8;
    *(unsigned char *)(v11 + 136) = *v8;
    *(void *)(v11 + 40) = sub_100012070();
    *(unsigned char *)(v11 + 137) = v9;
    uint64_t KeyPath = swift_getKeyPath();
    *(void *)(v11 + 112) = KeyPath;
    uint64_t v6 = (void *)swift_task_alloc();
    *(void *)(v11 + 120) = v6;
    void *v6 = *(void *)(v11 + 16);
    v6[1] = sub_100012F68;
    uint64_t v7 = *(void *)(v11 + 104);
    return AppEntity._setValue<A>(_:for:)(v11 + 137, KeyPath, v7);
  }
  else
  {
    (*(void (**)(void, void))(*(void *)(v11 + 72) + 8))(*(void *)(v11 + 80), *(void *)(v11 + 64));
    sub_10001326C();
    sub_100029F70();
    swift_task_dealloc();
    uint64_t v4 = *(uint64_t (**)(void))(*(void *)(v11 + 16) + 8);
    return v4();
  }
}

uint64_t sub_100012F68()
{
  uint64_t v4 = *v1;
  *(void *)(v4 + 16) = *v1;
  *(void *)(v4 + 128) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_1000074FC;
  }
  else
  {
    swift_release();
    sub_10000777C();
    uint64_t v2 = sub_1000130F8;
  }
  return _swift_task_switch(v2, 0);
}

uint64_t sub_1000130F8()
{
  *(void *)(v0 + 16) = v0;
  sub_10001326C();
  sub_100029F70();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(*(void *)(v0 + 16) + 8);
  return v1();
}

uint64_t sub_1000131D0@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_1000075B8(a1, a2);
}

unint64_t sub_1000131E8()
{
  uint64_t v2 = qword_100038830;
  if (!qword_100038830)
  {
    sub_100007684(&qword_100038838);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038830);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_10001326C()
{
  uint64_t v2 = qword_100038840;
  if (!qword_100038840)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038840);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_1000132EC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = v3;
  *(void *)(v3 + 16) = v3;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v6 + 24) = v4;
  *uint64_t v4 = *(void *)(v6 + 16);
  v4[1] = sub_1000068C4;
  return sub_1000129D0(a1, a2, a3);
}

uint64_t sub_1000133B0()
{
  char v9 = "Title of options for including attachments with replies";
  uint64_t v0 = sub_100005894(&qword_100038220);
  unint64_t v2 = (*(void *)(*(void *)(v0 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v0);
  uint64_t v20 = (char *)&v2 - v2;
  uint64_t v11 = 0;
  unint64_t v3 = (*(void *)(*(void *)(sub_10002A380() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v11);
  uint64_t v13 = (uint64_t)&v2 - v3;
  unint64_t v4 = (*(void *)(*(void *)(sub_10002A3D0() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v11);
  uint64_t v12 = (char *)&v2 - v4;
  unint64_t v5 = (*(void *)(*(void *)(sub_10002A450() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v11);
  uint64_t v10 = (char *)&v2 - v5;
  uint64_t v17 = sub_10002A3A0();
  uint64_t v14 = *(void *)(v17 - 8);
  uint64_t v15 = v17 - 8;
  unint64_t v6 = (*(void *)(v14 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v11);
  uint64_t v19 = (char *)&v2 - v6;
  uint64_t v8 = sub_10002A350();
  uint64_t v7 = static AttachmentRepliesOption.typeDisplayRepresentation;
  sub_100005904(v8, static AttachmentRepliesOption.typeDisplayRepresentation);
  uint64_t v18 = sub_1000059AC(v8, (uint64_t)v7);
  unsigned int v16 = 1;
  sub_10002A470("Include Attachment Option", 0x19uLL, 1);
  sub_10002A400();
  sub_100005A10();
  sub_100005A28(v13);
  uint64_t v21 = v9;
  uint64_t v22 = 55;
  __int16 v23 = 2;
  sub_10002A3B0();
  (*(void (**)(char *, void, void, uint64_t))(v14 + 56))(v20, v16, v16, v17);
  return sub_10002A340();
}

uint64_t AttachmentRepliesOption.typeDisplayRepresentation.unsafeMutableAddressor()
{
  if (qword_100038140 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_10002A350();
  return sub_1000059AC(v0, (uint64_t)static AttachmentRepliesOption.typeDisplayRepresentation);
}

uint64_t static AttachmentRepliesOption.typeDisplayRepresentation.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = AttachmentRepliesOption.typeDisplayRepresentation.unsafeMutableAddressor();
  uint64_t v1 = sub_10002A350();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v1 - 8) + 16))(a1, v3);
}

uint64_t sub_100013778()
{
  uint64_t v0 = sub_100005894(&qword_100038548);
  unint64_t v9 = (*(void *)(*(void *)(v0 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v0);
  v33 = (char *)&v9 - v9;
  uint64_t v1 = sub_100005894(&qword_100038220);
  unint64_t v10 = (*(void *)(*(void *)(v1 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v1);
  v32 = (char *)&v9 - v10;
  uint64_t v36 = 0;
  uint64_t v22 = sub_10002A3A0();
  uint64_t v12 = *(void *)(v22 - 8);
  uint64_t v13 = v22 - 8;
  unint64_t v11 = (*(void *)(v12 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v22);
  uint64_t v31 = (char *)&v9 - v11;
  uint64_t v35 = sub_100005894(&qword_100038850);
  uint64_t v34 = sub_10002A510();
  uint64_t v21 = v2;
  uint64_t v14 = *(int *)(v35 + 48);
  *unint64_t v2 = 0;
  unsigned int v25 = 1;
  sub_10002A470("Never", 5uLL, 1);
  sub_10002A370();
  v24 = *(void (**)(char *, void, void, uint64_t))(v12 + 56);
  uint64_t v23 = v12 + 56;
  v24(v32, v25, v25, v22);
  uint64_t v26 = sub_10002A240();
  uint64_t v3 = *(void *)(v26 - 8);
  uint64_t v28 = *(void (**)(char *, void))(v3 + 56);
  uint64_t v27 = v3 + 56;
  v28(v33, v25);
  sub_10002A260();
  char v4 = v25;
  uint64_t v19 = *(void *)(*(void *)(v35 - 8) + 72);
  uint64_t v16 = *(int *)(v35 + 48);
  uint64_t v15 = &v21[v19];
  *uint64_t v15 = 1;
  sub_10002A470("When Adding Recipients", 0x16uLL, v4 & 1);
  sub_10002A370();
  v24(v32, v25, v25, v22);
  ((void (*)(char *, void, void, uint64_t))v28)(v33, v25, v25, v26);
  sub_10002A260();
  char v5 = v25;
  uint64_t v18 = *(int *)(v35 + 48);
  uint64_t v17 = &v21[2 * v19];
  *uint64_t v17 = 2;
  uint64_t v20 = 3;
  sub_10002A470("Ask", 3uLL, v5 & 1);
  sub_10002A370();
  v24(v32, v25, v25, v22);
  ((void (*)(char *, void, void, uint64_t))v28)(v33, v25, v25, v26);
  sub_10002A260();
  char v6 = v25;
  uint64_t v30 = *(int *)(v35 + 48);
  uint64_t v29 = &v21[v20 * v19];
  *uint64_t v29 = 3;
  sub_10002A470("Always", 6uLL, v6 & 1);
  sub_10002A370();
  v24(v32, v25, v25, v22);
  ((void (*)(char *, void, void, uint64_t))v28)(v33, v25, v25, v26);
  sub_10002A260();
  uint64_t v7 = v34;
  sub_10000CF1C();
  uint64_t v38 = v7;
  uint64_t v37 = sub_10002A270();
  sub_100013C3C();
  uint64_t result = sub_10002A3F0();
  static AttachmentRepliesOption.caseDisplayRepresentations = result;
  return result;
}

unint64_t sub_100013C3C()
{
  uint64_t v2 = qword_100038858;
  if (!qword_100038858)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038858);
    return WitnessTable;
  }
  return v2;
}

uint64_t *AttachmentRepliesOption.caseDisplayRepresentations.unsafeMutableAddressor()
{
  if (qword_100038148 != -1) {
    swift_once();
  }
  return &static AttachmentRepliesOption.caseDisplayRepresentations;
}

uint64_t static AttachmentRepliesOption.caseDisplayRepresentations.getter()
{
  uint64_t v1 = AttachmentRepliesOption.caseDisplayRepresentations.unsafeMutableAddressor();
  swift_beginAccess();
  uint64_t v2 = *v1;
  swift_bridgeObjectRetain();
  swift_endAccess();
  return v2;
}

uint64_t static AttachmentRepliesOption.caseDisplayRepresentations.setter(uint64_t a1)
{
  uint64_t v2 = AttachmentRepliesOption.caseDisplayRepresentations.unsafeMutableAddressor();
  swift_bridgeObjectRetain();
  swift_beginAccess();
  *uint64_t v2 = a1;
  swift_bridgeObjectRelease();
  swift_endAccess();
  return swift_bridgeObjectRelease();
}

uint64_t (*static AttachmentRepliesOption.caseDisplayRepresentations.modify())()
{
  return sub_100013E48;
}

uint64_t sub_100013E48()
{
  return swift_endAccess();
}

MailSettingsIntentsExtension::AttachmentRepliesOption_optional __swiftcall AttachmentRepliesOption.init(rawValue:)(Swift::String rawValue)
{
  v1._rawValue = (void *)sub_10002A510();
  *(void *)uint64_t v2 = "IncludeAttachmentRepliesNever";
  *(void *)(v2 + 8) = 29;
  *(unsigned char *)(v2 + 16) = 2;
  *(void *)(v2 + 24) = "IncludeAttachmentRepliesWhenAdding";
  *(void *)(v2 + 32) = 34;
  *(unsigned char *)(v2 + 40) = 2;
  *(void *)(v2 + 48) = "IncludeAttachmentRepliesAsk";
  *(void *)(v2 + 56) = 27;
  *(unsigned char *)(v2 + 64) = 2;
  *(void *)(v2 + 72) = "IncludeAttachmentRepliesAlways";
  *(void *)(v2 + 80) = 30;
  *(unsigned char *)(v2 + 88) = 2;
  sub_10000CF1C();
  Swift::Int v6 = sub_10002A500(v1, rawValue);
  swift_bridgeObjectRelease();
  switch(v6)
  {
    case 0:
      v7.value = MailSettingsIntentsExtension_AttachmentRepliesOption_never;
LABEL_10:
      swift_bridgeObjectRelease();
      return v7;
    case 1:
      v7.value = MailSettingsIntentsExtension_AttachmentRepliesOption_whenAdding;
      goto LABEL_10;
    case 2:
      v7.value = MailSettingsIntentsExtension_AttachmentRepliesOption_ask;
      goto LABEL_10;
    case 3:
      v7.value = MailSettingsIntentsExtension_AttachmentRepliesOption_always;
      goto LABEL_10;
  }
  swift_bridgeObjectRelease();
  return (MailSettingsIntentsExtension::AttachmentRepliesOption_optional)4;
}

uint64_t static AttachmentRepliesOption.allCases.getter()
{
  uint64_t result = sub_10002A510();
  *Swift::OpaquePointer v1 = 0;
  v1[1] = 1;
  v1[2] = 2;
  v1[3] = 3;
  sub_10000CF1C();
  return result;
}

uint64_t AttachmentRepliesOption.rawValue.getter(char a1)
{
  switch(a1)
  {
    case 1:
      uint64_t v2 = sub_10002A470("IncludeAttachmentRepliesWhenAdding", 0x22uLL, 1);
      break;
    case 2:
      uint64_t v2 = sub_10002A470("IncludeAttachmentRepliesAsk", 0x1BuLL, 1);
      break;
    case 3:
      uint64_t v2 = sub_10002A470("IncludeAttachmentRepliesAlways", 0x1EuLL, 1);
      break;
    default:
      uint64_t v2 = sub_10002A470("IncludeAttachmentRepliesNever", 0x1DuLL, 1);
      break;
  }
  return v2;
}

unint64_t sub_1000141B8()
{
  return sub_1000122E4();
}

unint64_t sub_1000141D0()
{
  return sub_10001267C();
}

unint64_t sub_1000141E8()
{
  return sub_100014200();
}

unint64_t sub_100014200()
{
  uint64_t v2 = qword_100038860;
  if (!qword_100038860)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038860);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_100014280()
{
  return sub_100014298();
}

unint64_t sub_100014298()
{
  uint64_t v2 = qword_100038868;
  if (!qword_100038868)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038868);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_100014318()
{
  return sub_100014330();
}

unint64_t sub_100014330()
{
  uint64_t v2 = qword_100038870;
  if (!qword_100038870)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038870);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_1000143B0()
{
  return sub_1000143C8();
}

unint64_t sub_1000143C8()
{
  uint64_t v2 = qword_100038878;
  if (!qword_100038878)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038878);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_100014448()
{
  return sub_100012950();
}

unint64_t sub_100014460()
{
  return sub_100014478();
}

unint64_t sub_100014478()
{
  uint64_t v2 = qword_100038880;
  if (!qword_100038880)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038880);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_1000144F8()
{
  return sub_100014510();
}

unint64_t sub_100014510()
{
  uint64_t v2 = qword_100038888;
  if (!qword_100038888)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038888);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_100014590()
{
  return sub_1000145A8();
}

unint64_t sub_1000145A8()
{
  uint64_t v2 = qword_100038890;
  if (!qword_100038890)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038890);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_100014628()
{
  return sub_1000123D4();
}

unint64_t sub_100014640()
{
  return sub_100014658();
}

unint64_t sub_100014658()
{
  uint64_t v2 = qword_100038898;
  if (!qword_100038898)
  {
    sub_100007684(&qword_1000388A0);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038898);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_1000146DC()
{
  return sub_1000146F4();
}

unint64_t sub_1000146F4()
{
  uint64_t v2 = qword_1000388A8;
  if (!qword_1000388A8)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_1000388A8);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_100014774()
{
  return sub_10001478C();
}

unint64_t sub_10001478C()
{
  uint64_t v2 = qword_1000388B0;
  if (!qword_1000388B0)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_1000388B0);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_10001480C()
{
  return sub_100012214();
}

unint64_t sub_100014824()
{
  return sub_10001483C();
}

unint64_t sub_10001483C()
{
  uint64_t v2 = qword_1000388B8;
  if (!qword_1000388B8)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_1000388B8);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_1000148BC()
{
  return sub_1000148D4();
}

unint64_t sub_1000148D4()
{
  uint64_t v2 = qword_1000388C0;
  if (!qword_1000388C0)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_1000388C0);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_100014954()
{
  return sub_10001496C();
}

unint64_t sub_10001496C()
{
  uint64_t v2 = qword_1000388C8;
  if (!qword_1000388C8)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_1000388C8);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_1000149EC()
{
  return sub_100014A04();
}

unint64_t sub_100014A04()
{
  uint64_t v2 = qword_1000388D0;
  if (!qword_1000388D0)
  {
    sub_100007684(&qword_1000388D8);
    sub_1000145A8();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_1000388D0);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_100014A98()
{
  return sub_100014AB0();
}

unint64_t sub_100014AB0()
{
  uint64_t v2 = qword_1000388E0;
  if (!qword_1000388E0)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_1000388E0);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_100014B30()
{
  return sub_10001326C();
}

uint64_t sub_100014B48()
{
  return sub_10002A520() & 1;
}

unint64_t sub_100014B94()
{
  return sub_100014BAC();
}

unint64_t sub_100014BAC()
{
  uint64_t v2 = qword_1000388E8;
  if (!qword_1000388E8)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_1000388E8);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_100014C2C()
{
  return sub_10002A480();
}

uint64_t sub_100014C6C()
{
  return sub_10002A4A0();
}

uint64_t sub_100014CB4()
{
  return sub_10002A490();
}

MailSettingsIntentsExtension::AttachmentRepliesOption_optional sub_100014CFC@<W0>(Swift::String *a1@<X0>, MailSettingsIntentsExtension::AttachmentRepliesOption_optional *a2@<X8>)
{
  result.value = AttachmentRepliesOption.init(rawValue:)(*a1).value;
  a2->value = result.value;
  return result;
}

uint64_t sub_100014D34@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = AttachmentRepliesOption.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v3;
  return result;
}

unint64_t sub_100014D68()
{
  return sub_100014D80();
}

unint64_t sub_100014D80()
{
  uint64_t v2 = qword_1000388F0;
  if (!qword_1000388F0)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_1000388F0);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_100014E00()
{
  return sub_100014E18();
}

unint64_t sub_100014E18()
{
  uint64_t v2 = qword_1000388F8;
  if (!qword_1000388F8)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_1000388F8);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_100014E98()
{
  return sub_100014EB0();
}

unint64_t sub_100014EB0()
{
  uint64_t v2 = qword_100038900;
  if (!qword_100038900)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038900);
    return WitnessTable;
  }
  return v2;
}

void *sub_100014F30()
{
  return &protocol witness table for String;
}

unint64_t sub_100014F3C()
{
  return sub_100014F54();
}

unint64_t sub_100014F54()
{
  uint64_t v2 = qword_100038908;
  if (!qword_100038908)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038908);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_100014FD4()
{
  return sub_100014FEC();
}

unint64_t sub_100014FEC()
{
  uint64_t v2 = qword_100038910;
  if (!qword_100038910)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038910);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_10001506C()
{
  return sub_100015084();
}

unint64_t sub_100015084()
{
  uint64_t v2 = qword_100038918;
  if (!qword_100038918)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038918);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_100015104()
{
  return sub_10001511C();
}

unint64_t sub_10001511C()
{
  uint64_t v2 = qword_100038920;
  if (!qword_100038920)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038920);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_10001519C@<X0>(uint64_t a1@<X8>)
{
  return static AttachmentRepliesOption.typeDisplayRepresentation.getter(a1);
}

uint64_t sub_1000151B4()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_100015210()
{
  uint64_t v2 = qword_100038928;
  if (!qword_100038928)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038928);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_100015290()
{
  return sub_100029FA0();
}

unint64_t sub_1000152C8()
{
  return sub_1000152E0();
}

unint64_t sub_1000152E0()
{
  uint64_t v2 = qword_100038930;
  if (!qword_100038930)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038930);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_100015360()
{
  return sub_100015378();
}

unint64_t sub_100015378()
{
  uint64_t v2 = qword_100038938;
  if (!qword_100038938)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038938);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_1000153F8()
{
  return sub_100013C3C();
}

uint64_t sub_100015410()
{
  return static AttachmentRepliesOption.caseDisplayRepresentations.getter();
}

uint64_t sub_100015428()
{
  return sub_10002A300();
}

unint64_t sub_100015460()
{
  return sub_100015478();
}

unint64_t sub_100015478()
{
  uint64_t v2 = qword_100038940;
  if (!qword_100038940)
  {
    sub_100007684(&qword_100038948);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038940);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_1000154FC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = static AttachmentRepliesOption.allCases.getter();
  *a1 = result;
  return result;
}

void *type metadata accessor for IncludeAttachmentRepliesPreferenceEntity()
{
  return &unk_100034E78;
}

void *type metadata accessor for IncludeAttachmentRepliesEntityQuery()
{
  return &unk_100034EA0;
}

void *type metadata accessor for IncludeAttachmentRepliesEntityUpdateHandler()
{
  return &unk_100034EC0;
}

uint64_t getEnumTagSinglePayload for AttachmentRepliesOption(unsigned __int8 *a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 <= 0xFC) {
      goto LABEL_15;
    }
    unsigned int v7 = ((a2 + 3) >> 8) + 1;
    int v8 = 1;
    if (v7 >= 0x100)
    {
      if (v7 >= 0x10000) {
        int v2 = 4;
      }
      else {
        int v2 = 2;
      }
      int v8 = v2;
    }
    if (v8 == 1) {
      int v6 = a1[1];
    }
    else {
      int v6 = v8 == 2 ? *(unsigned __int16 *)(a1 + 1) : *(_DWORD *)(a1 + 1);
    }
    if (v6)
    {
      int v5 = (*a1 | ((v6 - 1) << 8)) + 252;
    }
    else
    {
LABEL_15:
      int v3 = *a1 - 4;
      if (v3 < 0) {
        int v3 = -1;
      }
      int v5 = v3;
    }
  }
  else
  {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for AttachmentRepliesOption(unsigned char *result, unsigned int a2, unsigned int a3)
{
  int v7 = 0;
  if (a3 > 0xFC)
  {
    unsigned int v5 = ((a3 + 3) >> 8) + 1;
    int v6 = 1;
    if (v5 >= 0x100)
    {
      if (v5 >= 0x10000) {
        int v3 = 4;
      }
      else {
        int v3 = 2;
      }
      int v6 = v3;
    }
    int v7 = v6;
  }
  if (a2 > 0xFC)
  {
    unsigned int v4 = ((a2 - 253) >> 8) + 1;
    *uint64_t result = a2 + 3;
    if (v7)
    {
      if (v7 == 1)
      {
        result[1] = v4;
      }
      else if (v7 == 2)
      {
        *(_WORD *)(result + 1) = v4;
      }
      else
      {
        *(_DWORD *)(result + 1) = v4;
      }
    }
  }
  else
  {
    if (v7)
    {
      if (v7 == 1)
      {
        result[1] = 0;
      }
      else if (v7 == 2)
      {
        *(_WORD *)(result + 1) = 0;
      }
      else
      {
        *(_DWORD *)(result + 1) = 0;
      }
    }
    if (a2) {
      *uint64_t result = a2 + 3;
    }
  }
  return result;
}

uint64_t sub_100015958(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_100015960(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for AttachmentRepliesOption()
{
  return &type metadata for AttachmentRepliesOption;
}

uint64_t sub_10001597C(uint64_t a1, void *a2)
{
  *(void *)(v2 + 160) = a1;
  *(void *)(v2 + 144) = v2;
  *(void *)(v2 + 152) = 0;
  *(void *)(v2 + 112) = 0;
  *(void *)(v2 + 120) = 0;
  *(unsigned char *)(v2 + 168) = 0;
  *(void *)(v2 + 152) = *a2;
  return _swift_task_switch(sub_1000159C4, 0);
}

uint64_t sub_1000159C4()
{
  *(void *)(v0 + 144) = v0;
  unint64_t v11 = (void *)*sub_100011B9C();
  id v1 = v11;
  if (v11)
  {
    sub_10001200C();
    swift_bridgeObjectRetain();
    NSString v8 = sub_10002A460();
    swift_bridgeObjectRelease();
    id v9 = [v11 objectForKey:v8];

    if (v9)
    {
      sub_10002A4E0();
      sub_10000F050(v10 + 80, v10 + 48);
      swift_unknownObjectRelease();
    }
    else
    {
      *(void *)(v10 + 48) = 0;
      *(void *)(v10 + 56) = 0;
      *(void *)(v10 + 64) = 0;
      *(void *)(v10 + 72) = 0;
    }
    sub_10000EFEC((_OWORD *)(v10 + 48), (_OWORD *)(v10 + 16));
  }
  else
  {
    *(void *)(v10 + 16) = 0;
    *(void *)(v10 + 24) = 0;
    *(void *)(v10 + 32) = 0;
    *(void *)(v10 + 40) = 0;
  }
  if (*(void *)(v10 + 40))
  {
    if (swift_dynamicCast()) {
      Swift::String v6 = *(Swift::String *)(v10 + 128);
    }
    else {
      Swift::String v6 = (Swift::String)0;
    }
    Swift::String v7 = v6;
  }
  else
  {
    sub_10000EEFC(v10 + 16);
    Swift::String v7 = (Swift::String)0;
  }
  if (v7._object)
  {
    *(Swift::String *)(v10 + 112) = v7;
    swift_bridgeObjectRetain();
    v2.value = AttachmentRepliesOption.init(rawValue:)(v7).value;
    if (v2.value != MailSettingsIntentsExtension_AttachmentRepliesOption_unknownDefault)
    {
      int v3 = *(MailSettingsIntentsExtension::AttachmentRepliesOption_optional **)(v10 + 160);
      *(MailSettingsIntentsExtension::AttachmentRepliesOption_optional *)(v10 + 168) = v2;
      v3->value = v2.value;
      swift_bridgeObjectRelease();
      goto LABEL_19;
    }
    swift_bridgeObjectRelease();
  }
  **(unsigned char **)(v10 + 160) = 1;
LABEL_19:
  unsigned int v4 = *(uint64_t (**)(void))(*(void *)(v10 + 144) + 8);
  return v4();
}

uint64_t sub_100015D68(void *a1, char *a2)
{
  *(void *)(v2 + 16) = v2;
  *(void *)(v2 + 24) = 0;
  *(unsigned char *)(v2 + 32) = 0;
  *(void *)(v2 + 24) = *a1;
  char v3 = *a2;
  *(unsigned char *)(v2 + 33) = *a2;
  *(unsigned char *)(v2 + 32) = v3;
  return _swift_task_switch(sub_100015DBC, 0);
}

uint64_t sub_100015DBC()
{
  *(void *)(v0 + 16) = v0;
  Swift::String v7 = (void *)*sub_100011B9C();
  id v1 = v7;
  if (v7)
  {
    AttachmentRepliesOption.rawValue.getter(*(unsigned char *)(v6 + 33));
    NSString v5 = sub_10002A460();
    swift_bridgeObjectRelease();
    sub_10001200C();
    swift_bridgeObjectRetain();
    NSString v4 = sub_10002A460();
    swift_bridgeObjectRelease();
    [v7 setObject:v5 forKey:v4];

    swift_unknownObjectRelease();
  }
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(v6 + 16) + 8);
  return v2();
}

uint64_t sub_100015F88()
{
  uint64_t v2 = sub_100005894(&qword_100038968);
  sub_100005904(v2, qword_100039098);
  sub_1000059AC(v2, (uint64_t)qword_100039098);
  uint64_t v5 = sub_100005894(&qword_100038970);
  sub_10002A510();
  NSString v4 = v0;
  *uint64_t v0 = 0;
  sub_10002A470("settings-navigation://com.apple.Settings.Apps/com.apple.mobilemail", 0x42uLL, 1);
  sub_1000168B8();
  sub_10002A280();
  uint64_t v3 = *(void *)(*(void *)(v5 - 8) + 72);
  v4[v3] = 1;
  sub_10002A470("settings-navigation://com.apple.Settings.Apps/com.apple.mobilemail/ACCOUNTS", 0x4BuLL, 1);
  sub_10002A280();
  v4[2 * v3] = 2;
  sub_10002A470("settings-navigation://com.apple.Settings.Apps/com.apple.mobilemail/BLOCKED_SENDERS", 0x52uLL, 1);
  sub_10002A280();
  v4[3 * v3] = 3;
  sub_10002A470("settings-navigation://com.apple.Settings.Apps/com.apple.mobilemail/BLOCKED_SENDER_OPTIONS", 0x59uLL, 1);
  sub_10002A280();
  v4[4 * v3] = 4;
  sub_10002A470("settings-navigation://com.apple.Settings.Apps/com.apple.mobilemail/INCLUDE_ATTACHMENTS_WITH_REPLIES", 0x63uLL, 1);
  sub_10002A280();
  v4[5 * v3] = 5;
  sub_10002A470("settings-navigation://com.apple.Settings.Apps/com.apple.mobilemail/LINES_OF_PREVIEW", 0x53uLL, 1);
  sub_10002A280();
  v4[6 * v3] = 6;
  sub_10002A470("settings-navigation://com.apple.Settings.Apps/com.apple.mobilemail/SIGNATURE", 0x4CuLL, 1);
  sub_10002A280();
  v4[7 * v3] = 7;
  sub_10002A470("settings-navigation://com.apple.Settings.Apps/com.apple.mobilemail/UNDO_SEND_DELAY", 0x52uLL, 1);
  sub_10002A280();
  v4[8 * v3] = 8;
  sub_10002A470("settings-navigation://com.apple.Settings.Apps/com.apple.mobilemail/ACCOUNTS/ADD_ACCOUNT", 0x57uLL, 1);
  sub_10002A280();
  v4[9 * v3] = 9;
  sub_10002A470("settings-navigation://com.apple.Settings.Apps/com.apple.mobilemail/ACCOUNTS#FETCH_NEW_DATA", 0x5AuLL, 1);
  sub_10002A280();
  v4[10 * v3] = 10;
  sub_10002A470("settings-navigation://com.apple.Settings.Apps/com.apple.mobilemail#SHOW_TOCC_INDICATOR", 0x56uLL, 1);
  sub_10002A280();
  v4[11 * v3] = 11;
  sub_10002A470("settings-navigation://com.apple.Settings.Apps/com.apple.mobilemail/SWIPE_OPTIONS", 0x50uLL, 1);
  sub_10002A280();
  v4[12 * v3] = 12;
  sub_10002A470("settings-navigation://com.apple.Settings.Apps/com.apple.mobilemail#ASK_BEFORE_DELETING", 0x56uLL, 1);
  sub_10002A280();
  v4[13 * v3] = 13;
  sub_10002A470("settings-navigation://com.apple.Settings.Apps/com.apple.mobilemail#ORGANIZE_BY_THREAD", 0x55uLL, 1);
  sub_10002A280();
  v4[14 * v3] = 14;
  sub_10002A470("settings-navigation://com.apple.Settings.Apps/com.apple.mobilemail#COLLAPSE_READ_MESSAGES", 0x59uLL, 1);
  sub_10002A280();
  v4[15 * v3] = 15;
  sub_10002A470("settings-navigation://com.apple.Settings.Apps/com.apple.mobilemail#MOST_RECENT_MESSAGE_ON_TOP", 0x5DuLL, 1);
  sub_10002A280();
  v4[16 * v3] = 16;
  sub_10002A470("settings-navigation://com.apple.Settings.Apps/com.apple.mobilemail#COMPLETE_THREADS", 0x53uLL, 1);
  sub_10002A280();
  v4[17 * v3] = 17;
  sub_10002A470("settings-navigation://com.apple.Settings.Apps/com.apple.mobilemail/MUTED_THREAD_ACTION", 0x56uLL, 1);
  sub_10002A280();
  v4[18 * v3] = 18;
  sub_10002A470("settings-navigation://com.apple.Settings.Apps/com.apple.mobilemail#ALWAYS_BCC_MYSELF", 0x54uLL, 1);
  sub_10002A280();
  v4[19 * v3] = 19;
  sub_10002A470("settings-navigation://com.apple.Settings.Apps/com.apple.mobilemail/MARK_ADDRESSES", 0x51uLL, 1);
  sub_10002A280();
  v4[20 * v3] = 20;
  sub_10002A470("settings-navigation://com.apple.Settings.Apps/com.apple.mobilemail/INCREASE_QUOTE_LEVEL", 0x57uLL, 1);
  sub_10002A280();
  v4[21 * v3] = 21;
  sub_10002A470("settings-navigation://com.apple.Settings.Apps/com.apple.mobilemail/LOAD_REMOTE_IMAGES", 0x55uLL, 1);
  sub_10002A280();
  sub_10000CF1C();
  sub_100005894(&qword_100038980);
  sub_100016938();
  sub_10002A3F0();
  return sub_10002A290();
}

unint64_t sub_1000168B8()
{
  uint64_t v2 = qword_100038978;
  if (!qword_100038978)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038978);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_100016938()
{
  uint64_t v2 = qword_100038988;
  if (!qword_100038988)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038988);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_1000169B8()
{
  if (qword_100038150 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_100005894(&qword_100038968);
  return sub_1000059AC(v0, (uint64_t)qword_100039098);
}

uint64_t sub_100016A2C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_1000169B8();
  uint64_t v1 = sub_100005894(&qword_100038968);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v1 - 8) + 16))(a1, v3);
}

uint64_t sub_100016A94()
{
  uint64_t v0 = sub_100005894(&qword_100038220);
  unint64_t v2 = (*(void *)(*(void *)(v0 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v0);
  uint64_t v13 = (char *)&v2 - v2;
  uint64_t v3 = 0;
  uint64_t v10 = sub_10002A3A0();
  uint64_t v7 = *(void *)(v10 - 8);
  uint64_t v8 = v10 - 8;
  unint64_t v4 = (*(void *)(v7 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v3);
  uint64_t v12 = (char *)&v2 - v4;
  uint64_t v6 = sub_10002A350();
  uint64_t v5 = qword_1000390B0;
  sub_100005904(v6, qword_1000390B0);
  uint64_t v11 = sub_1000059AC(v6, (uint64_t)v5);
  unsigned int v9 = 1;
  sub_10002A470("Mail", 4uLL, 1);
  sub_10002A370();
  (*(void (**)(char *, void, void, uint64_t))(v7 + 56))(v13, v9, v9, v10);
  return sub_10002A340();
}

uint64_t sub_100016C0C()
{
  if (qword_100038158 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_10002A350();
  return sub_1000059AC(v0, (uint64_t)qword_1000390B0);
}

uint64_t sub_100016C7C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_100016C0C();
  uint64_t v1 = sub_10002A350();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v1 - 8) + 16))(a1, v3);
}

uint64_t sub_100016CE0()
{
  v82 = "Description text for the root Mail Settings pane";
  v98 = "Description text for the Accounts pane in the Mail Settings pane";
  v106 = "Description text for the Blocked pane in the Mail Settings pane";
  v114 = "Description text for the Blocked Sender Options pane in the Mail Settings pane";
  v121 = "Description text for the Include Attachments with Replies setting in the Mail Settings pane";
  v129 = "Description text for the Signature setting in the Mail Settings pane";
  v137 = "Description text for the Preview setting in the Mail Settings pane";
  v146 = "Description text for the Undo Send Delay setting in the Mail Settings pane";
  v169 = "Description text for the Add Account pane in the Mail Accounts pane of Mail Settings";
  v176 = "Description text for the Fetch New Data pane in the Mail Accounts pane of Mail Settings";
  v180 = "Description text for the Show To/Cc Labels control in Mail Settings";
  v185 = "Description text for the Swipe Options pane in Mail Settings";
  v189 = "Description text for the Ask Before Deleting control in Mail Settings";
  v192 = "Description text for the Organize by Thread control in Mail Settings";
  v196 = "Description text for the Collapse Read Messages control in Mail Settings";
  v200 = "Description text for the Most Recent Message on Top control in Mail Settings";
  v203 = "Description text for the Complete Threads control in Mail Settings";
  v206 = "Description text for the Muted Thread Action pane in Mail Settings";
  v211 = "Description text for the Always Bcc Myself control in Mail Settings";
  v222 = "Description text for the Mark Addresses pane in Mail Settings";
  v226 = "Description text for the Increase Quote level control in Mail Settings";
  v243 = "Description text for the Load Remote Images control in Mail Settings";
  uint64_t v259 = 0;
  unint64_t v64 = (*(void *)(*(void *)(sub_10002A380() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(0);
  uint64_t v250 = (uint64_t)&v63 - v64;
  unint64_t v65 = (*(void *)(*(void *)(sub_10002A3D0() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v259);
  v249 = (char *)&v63 - v65;
  uint64_t v0 = sub_10002A450();
  unint64_t v66 = (*(void *)(*(void *)(v0 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v0);
  v248 = (char *)&v63 - v66;
  uint64_t v1 = sub_100005894(&qword_100038548);
  unint64_t v67 = (*(void *)(*(void *)(v1 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v1);
  v254 = (char *)&v63 - v67;
  unint64_t v68 = (*(void *)(*(void *)(sub_100005894(&qword_100038220) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v259);
  v253 = (char *)&v63 - v68;
  uint64_t v234 = sub_10002A3A0();
  v71 = *(void **)(v234 - 8);
  uint64_t v72 = v234 - 8;
  unint64_t v69 = (v71[8] + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v234);
  v255 = (char *)&v63 - v69;
  unint64_t v70 = (v2 + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin((char *)&v63 - v69);
  v256 = (char *)&v63 - v70;
  uint64_t v258 = sub_100005894(&qword_100038990);
  Builtin::Word v195 = 22;
  uint64_t v257 = sub_10002A510();
  v230 = v3;
  uint64_t v83 = *(int *)(v258 + 48);
  *uint64_t v3 = 0;
  Builtin::Word v160 = 4;
  unsigned int v247 = 1;
  sub_10002A470("Mail", 4uLL, 1);
  sub_10002A370();
  sub_10002A470("Apps", v160, v247 & 1);
  sub_10002A370();
  v236 = (void (*)(char *))v71[7];
  v235 = v71 + 7;
  unsigned int v246 = 0;
  v236(v253);
  v237 = "com.apple.mobilemail";
  Builtin::Word v238 = 20;
  sub_10002A470("com.apple.mobilemail", 0x14uLL, v247 & 1);
  sub_10002A230();
  uint64_t v239 = sub_10002A240();
  uint64_t v4 = *(void *)(v239 - 8);
  v241 = *(void (**)(char *, void, void))(v4 + 56);
  uint64_t v240 = v4 + 56;
  v241(v254, v246, v247);
  Builtin::Word v150 = 8;
  uint64_t v81 = sub_10002A510();
  uint64_t v80 = v5;
  Builtin::Word v215 = 19;
  sub_10002A470("Mail configurations", 0x13uLL, v247 & 1);
  sub_10002A370();
  uint64_t v164 = v71[9];
  uint64_t v217 = 1;
  uint64_t v73 = v164;
  Builtin::Word v216 = 14;
  sub_10002A470("Email settings", 0xEuLL, v247 & 1);
  sub_10002A370();
  uint64_t v153 = 2;
  uint64_t v74 = 2 * v164;
  sub_10002A470("Electronic mail settings", 0x18uLL, v247 & 1);
  sub_10002A370();
  Builtin::Word v158 = 3;
  uint64_t v75 = 3 * v164;
  sub_10002A470("Allow Mail To Access", v238, v247 & 1);
  sub_10002A370();
  Builtin::Word v76 = v160 * v164;
  Builtin::Word v188 = 12;
  sub_10002A470("Message List", 0xCuLL, v247 & 1);
  sub_10002A370();
  Builtin::Word v165 = 5;
  uint64_t v77 = 5 * v164;
  Builtin::Word v173 = 9;
  sub_10002A470("Threading", 9uLL, v247 & 1);
  sub_10002A370();
  Builtin::Word v155 = 6;
  uint64_t v78 = 6 * v164;
  sub_10002A470("Composing", v173, v247 & 1);
  sub_10002A370();
  Builtin::Word v162 = 7;
  uint64_t v79 = 7 * v164;
  sub_10002A470("Sending", 7uLL, v247 & 1);
  sub_10002A370();
  uint64_t v6 = v81;
  sub_10000CF1C();
  uint64_t v84 = v6;
  sub_10002A470("This is the main Mail Settings pane where you can manage mail accounts, and settings related to sending, viewing and receiving mail", 0x83uLL, v247 & 1);
  sub_10002A400();
  sub_100005A10();
  sub_100005A28(v250);
  v346 = v82;
  uint64_t v347 = 48;
  int v245 = 2;
  char v348 = 2;
  int v85 = 1;
  char v349 = v246 & 1 & v247;
  sub_10002A3B0();
  sub_10002A250();
  char v7 = v247;
  uint64_t v229 = *(void *)(*(void *)(v258 - 8) + 72);
  uint64_t v100 = *(int *)(v258 + 48);
  v99 = &v230[v217 * v229];
  unsigned char *v99 = v85;
  Builtin::Word v233 = 13;
  sub_10002A470("Mail Accounts", 0xDuLL, v7 & 1);
  sub_10002A370();
  v232 = "Apps → Mail";
  sub_10002A470("Apps → Mail", v233, v246 & 1);
  sub_10002A370();
  ((void (*)(char *, void, void, uint64_t))v236)(v253, v246, v247, v234);
  sub_10002A470(v237, v238, v247 & 1);
  sub_10002A230();
  ((void (*)(char *, void, void, uint64_t))v241)(v254, v246, v247, v239);
  uint64_t v183 = 11;
  uint64_t v97 = sub_10002A510();
  uint64_t v96 = v8;
  sub_10002A470("Email accounts", v216, v247 & 1);
  sub_10002A370();
  uint64_t v86 = v217 * v164;
  sub_10002A470("Mail accounts", v233, v247 & 1);
  sub_10002A370();
  uint64_t v87 = v153 * v164;
  Builtin::Word v199 = 15;
  sub_10002A470("Email addresses", 0xFuLL, v247 & 1);
  sub_10002A370();
  Builtin::Word v88 = v158 * v164;
  sub_10002A470("Accounts", v150, v247 & 1);
  sub_10002A370();
  Builtin::Word v89 = v160 * v164;
  v151 = "Gmail";
  sub_10002A470("Gmail", v165, v247 & 1);
  sub_10002A370();
  Builtin::Word v90 = v165 * v164;
  v154 = "Yahoo!";
  sub_10002A470("Yahoo!", v155, v247 & 1);
  sub_10002A370();
  Builtin::Word v91 = v155 * v164;
  v157 = "AOL";
  sub_10002A470("AOL", v158, v247 & 1);
  sub_10002A370();
  Builtin::Word v92 = v162 * v164;
  v161 = "Outlook";
  sub_10002A470("Outlook", v162, v247 & 1);
  sub_10002A370();
  Builtin::Word v93 = v150 * v164;
  sub_10002A470("LDAP", v160, v247 & 1);
  sub_10002A370();
  Builtin::Word v94 = v173 * v164;
  sub_10002A470("CardDAV", v162, v247 & 1);
  sub_10002A370();
  uint64_t v179 = 10;
  uint64_t v95 = 10 * v164;
  sub_10002A470("CalDAV", v155, v247 & 1);
  sub_10002A370();
  uint64_t v9 = v97;
  sub_10000CF1C();
  uint64_t v101 = v9;
  sub_10002A470("This is the Account pane in the Mail Settings pane where you can add or remove mail accounts", 0x5CuLL, v247 & 1);
  sub_10002A400();
  sub_100005A10();
  sub_100005A28(v250);
  v342 = v98;
  uint64_t v343 = 64;
  char v344 = v245;
  char v345 = v246 & 1 & v247;
  sub_10002A3B0();
  sub_10002A250();
  Builtin::Word v10 = v162;
  char v11 = v247;
  uint64_t v108 = *(int *)(v258 + 48);
  v107 = &v230[v153 * v229];
  unsigned char *v107 = v245;
  sub_10002A470("Blocked", v10, v11 & 1);
  sub_10002A370();
  sub_10002A470(v232, v233, v246 & 1);
  sub_10002A370();
  ((void (*)(char *, void, void, uint64_t))v236)(v253, v246, v247, v234);
  sub_10002A470(v237, v238, v247 & 1);
  sub_10002A230();
  ((void (*)(char *, void, void, uint64_t))v241)(v254, v246, v247, v239);
  uint64_t v105 = sub_10002A510();
  uint64_t v104 = v12;
  Builtin::Word v102 = 23;
  sub_10002A470("Blocked senders in Mail", 0x17uLL, v247 & 1);
  sub_10002A370();
  uint64_t v103 = v217 * v164;
  sub_10002A470("Blocked email addresses", v102, v247 & 1);
  sub_10002A370();
  uint64_t v13 = v105;
  sub_10000CF1C();
  uint64_t v109 = v13;
  Builtin::Word v242 = 111;
  sub_10002A470("This is the Blocked pane in the Mail Settings pane where you prevent certain contacts from sending you messages", 0x6FuLL, v247 & 1);
  sub_10002A400();
  sub_100005A10();
  sub_100005A28(v250);
  v338 = v106;
  uint64_t v339 = 63;
  char v340 = v245;
  char v341 = v246 & 1 & v247;
  sub_10002A3B0();
  sub_10002A250();
  Builtin::Word v14 = v195;
  char v15 = v247;
  uint64_t v116 = *(int *)(v258 + 48);
  v115 = &v230[v158 * v229];
  unsigned char *v115 = 3;
  sub_10002A470("Blocked Sender Options", v14, v15 & 1);
  sub_10002A370();
  sub_10002A470(v232, v233, v246 & 1);
  sub_10002A370();
  ((void (*)(char *, void, void, uint64_t))v236)(v253, v246, v247, v234);
  sub_10002A470(v237, v238, v247 & 1);
  sub_10002A230();
  ((void (*)(char *, void, void, uint64_t))v241)(v254, v246, v247, v239);
  uint64_t v113 = sub_10002A510();
  uint64_t v112 = v16;
  Builtin::Word v218 = 30;
  sub_10002A470("Blocked sender options in Mail", 0x1EuLL, v247 & 1);
  sub_10002A370();
  uint64_t v110 = v217 * v164;
  sub_10002A470("Blocked sender email actions", 0x1CuLL, v247 & 1);
  sub_10002A370();
  uint64_t v111 = v153 * v164;
  sub_10002A470("Ignore Blocked Senders", v195, v247 & 1);
  sub_10002A370();
  uint64_t v17 = v113;
  sub_10000CF1C();
  uint64_t v117 = v17;
  Builtin::Word v184 = 141;
  sub_10002A470("This is the Blocked Sender Options pane in the Mail Settings pane where you can determine what happens to messages sent from a blocked sender", 0x8DuLL, v247 & 1);
  sub_10002A400();
  sub_100005A10();
  sub_100005A28(v250);
  v334 = v114;
  uint64_t v335 = 78;
  char v336 = v245;
  char v337 = v246 & 1 & v247;
  sub_10002A3B0();
  sub_10002A250();
  char v18 = v247;
  uint64_t v123 = *(int *)(v258 + 48);
  v122 = &v230[v160 * v229];
  unsigned char *v122 = 4;
  Builtin::Word v141 = 32;
  sub_10002A470("Include Attachments with Replies", 0x20uLL, v18 & 1);
  sub_10002A370();
  sub_10002A470(v232, v233, v246 & 1);
  sub_10002A370();
  ((void (*)(char *, void, void, uint64_t))v236)(v253, v246, v247, v234);
  sub_10002A470(v237, v238, v247 & 1);
  sub_10002A230();
  ((void (*)(char *, void, void, uint64_t))v241)(v254, v246, v247, v239);
  uint64_t v120 = sub_10002A510();
  uint64_t v119 = v19;
  sub_10002A470("Include attachment for replying email", 0x25uLL, v247 & 1);
  sub_10002A370();
  uint64_t v118 = v217 * v164;
  sub_10002A470("Include attachment options for replies", 0x26uLL, v247 & 1);
  sub_10002A370();
  uint64_t v20 = v120;
  sub_10000CF1C();
  uint64_t v124 = v20;
  sub_10002A470("This is the Include Attachments with Replies setting in the Mail Settings pane that lets you decide what happens to attachments when you reply to a message", 0x9BuLL, v247 & 1);
  sub_10002A400();
  sub_100005A10();
  sub_100005A28(v250);
  v330 = v121;
  uint64_t v331 = 91;
  char v332 = v245;
  char v333 = v246 & 1 & v247;
  sub_10002A3B0();
  sub_10002A250();
  Builtin::Word v21 = v173;
  char v22 = v247;
  uint64_t v131 = *(int *)(v258 + 48);
  v130 = &v230[v165 * v229];
  unsigned char *v130 = 6;
  sub_10002A470("Signature", v21, v22 & 1);
  sub_10002A370();
  sub_10002A470(v232, v233, v246 & 1);
  sub_10002A370();
  ((void (*)(char *, void, void, uint64_t))v236)(v253, v246, v247, v234);
  sub_10002A470(v237, v238, v247 & 1);
  sub_10002A230();
  ((void (*)(char *, void, void, uint64_t))v241)(v254, v246, v247, v239);
  uint64_t v128 = sub_10002A510();
  uint64_t v127 = v23;
  sub_10002A470("Email footer", v188, v247 & 1);
  sub_10002A370();
  uint64_t v125 = v217 * v164;
  sub_10002A470("Email sign-off", v216, v247 & 1);
  sub_10002A370();
  uint64_t v126 = v153 * v164;
  sub_10002A470("Ending of email", v199, v247 & 1);
  sub_10002A370();
  uint64_t v24 = v128;
  sub_10000CF1C();
  uint64_t v132 = v24;
  sub_10002A470("This is the Signature pane in the Mail Settings pane where you create or edit the text that appears at the bottom of your messages", 0x82uLL, v247 & 1);
  sub_10002A400();
  sub_100005A10();
  sub_100005A28(v250);
  v326 = v129;
  uint64_t v244 = 68;
  uint64_t v327 = 68;
  char v328 = v245;
  char v329 = v246 & 1 & v247;
  sub_10002A3B0();
  sub_10002A250();
  Builtin::Word v25 = v162;
  char v26 = v247;
  uint64_t v139 = *(int *)(v258 + 48);
  v138 = &v230[v155 * v229];
  unsigned char *v138 = 5;
  sub_10002A470("Preview", v25, v26 & 1);
  sub_10002A370();
  sub_10002A470(v232, v233, v246 & 1);
  sub_10002A370();
  ((void (*)(char *, void, void, uint64_t))v236)(v253, v246, v247, v234);
  sub_10002A470(v237, v238, v247 & 1);
  sub_10002A230();
  ((void (*)(char *, void, void, uint64_t))v241)(v254, v246, v247, v239);
  uint64_t v136 = sub_10002A510();
  uint64_t v135 = v27;
  sub_10002A470("The number of lines of the message to show in the message list", 0x3EuLL, v247 & 1);
  sub_10002A370();
  uint64_t v133 = v217 * v164;
  Builtin::Word v175 = 31;
  sub_10002A470("Amount of message lines to view", 0x1FuLL, v247 & 1);
  sub_10002A370();
  uint64_t v134 = v153 * v164;
  sub_10002A470("Quantity of preview lines of the message", 0x28uLL, v247 & 1);
  sub_10002A370();
  uint64_t v28 = v136;
  sub_10000CF1C();
  uint64_t v140 = v28;
  sub_10002A470("This is the Preview pane in the Mail Settings pane where you set the number of lines of each email visible in the email list", 0x7CuLL, v247 & 1);
  sub_10002A400();
  sub_100005A10();
  sub_100005A28(v250);
  v322 = v137;
  uint64_t v207 = 66;
  uint64_t v323 = 66;
  char v324 = v245;
  char v325 = v246 & 1 & v247;
  sub_10002A3B0();
  sub_10002A250();
  Builtin::Word v29 = v199;
  char v30 = v247;
  uint64_t v148 = *(int *)(v258 + 48);
  v147 = &v230[v162 * v229];
  unsigned char *v147 = 7;
  sub_10002A470("Undo Send Delay", v29, v30 & 1);
  sub_10002A370();
  sub_10002A470(v232, v233, v246 & 1);
  sub_10002A370();
  ((void (*)(char *, void, void, uint64_t))v236)(v253, v246, v247, v234);
  sub_10002A470(v237, v238, v247 & 1);
  sub_10002A230();
  ((void (*)(char *, void, void, uint64_t))v241)(v254, v246, v247, v239);
  uint64_t v145 = sub_10002A510();
  uint64_t v144 = v31;
  sub_100019CC4(v179, v31);
  sub_100019CC4(v238, v144 + v217 * v164);
  sub_100019CC4(v218, v144 + v153 * v164);
  Builtin::Word v142 = v158 * v164;
  sub_10002A470("Recall email before time elapses", v141, v247 & 1);
  sub_10002A370();
  Builtin::Word v143 = v160 * v164;
  sub_10002A470("Amount of time to unsend email", v218, v247 & 1);
  sub_10002A370();
  uint64_t v32 = v145;
  sub_10000CF1C();
  uint64_t v149 = v32;
  sub_10002A470("This is the Undo Send Delay setting in the Mail Settings pane where you can set the number of seconds until you can no longer cancel sending the email", 0x96uLL, v247 & 1);
  sub_10002A400();
  sub_100005A10();
  sub_100005A28(v250);
  v318 = v146;
  uint64_t v319 = 74;
  char v320 = v245;
  char v321 = v246 & 1 & v247;
  sub_10002A3B0();
  sub_10002A250();
  Builtin::Word v33 = v183;
  char v34 = v247;
  uint64_t v171 = *(int *)(v258 + 48);
  v170 = &v230[v150 * v229];
  unsigned char *v170 = 8;
  sub_10002A470("Add Account", v33, v34 & 1);
  sub_10002A370();
  v174 = "Apps → Mail → Mail Accounts";
  sub_10002A470("Apps → Mail → Mail Accounts", v175, v246 & 1);
  sub_10002A370();
  ((void (*)(char *, void, void, uint64_t))v236)(v253, v246, v247, v234);
  sub_10002A470(v237, v238, v247 & 1);
  sub_10002A230();
  ((void (*)(char *, void, void, uint64_t))v241)(v254, v246, v247, v239);
  uint64_t v168 = sub_10002A510();
  uint64_t v167 = v35;
  sub_10002A470("Exchange ActiveSync", v215, v247 & 1);
  sub_10002A370();
  uint64_t v152 = v217 * v164;
  sub_10002A470(v151, v165, v247 & 1);
  sub_10002A370();
  uint64_t v156 = v153 * v164;
  sub_10002A470(v154, v155, v247 & 1);
  sub_10002A370();
  Builtin::Word v159 = v158 * v164;
  sub_10002A470(v157, v158, v247 & 1);
  sub_10002A370();
  Builtin::Word v163 = v160 * v164;
  sub_10002A470(v161, v162, v247 & 1);
  sub_10002A370();
  Builtin::Word v166 = v165 * v164;
  sub_10002A470("Other", v165, v247 & 1);
  sub_10002A370();
  uint64_t v36 = v168;
  sub_10000CF1C();
  uint64_t v172 = v36;
  sub_10002A470("This is the Add Account pane in the Mail Accounts pane of Mail Settings pane where you can add a new or existing mail account to your list of accounts in the Mail app", 0xA6uLL, v247 & 1);
  sub_10002A400();
  sub_100005A10();
  sub_100005A28(v250);
  v314 = v169;
  uint64_t v315 = 84;
  char v316 = v245;
  char v317 = v246 & 1 & v247;
  sub_10002A3B0();
  sub_10002A250();
  Builtin::Word v37 = v216;
  char v38 = v247;
  uint64_t v178 = *(int *)(v258 + 48);
  v177 = &v230[v173 * v229];
  unsigned char *v177 = 9;
  sub_10002A470("Fetch New Data", v37, v38 & 1);
  sub_10002A370();
  sub_10002A470(v174, v175, v246 & 1);
  sub_10002A370();
  ((void (*)(char *, void, void, uint64_t))v236)(v253, v246, v247, v234);
  sub_10002A470(v237, v238, v247 & 1);
  sub_10002A230();
  ((void (*)(char *, void, void, uint64_t))v241)(v254, v246, v247, v239);
  sub_10002A470("This is the Fetch New Data pane in the Mail Accounts pane of Mail Settings pane where you can determine how account data is refreshed in the Mail app", 0x95uLL, v247 & 1);
  sub_10002A400();
  sub_100005A10();
  sub_100005A28(v250);
  v310 = v176;
  uint64_t v311 = 87;
  char v312 = v245;
  char v313 = v246 & 1 & v247;
  sub_10002A3B0();
  sub_100019F3C();
  sub_10002A250();
  char v39 = v247;
  uint64_t v182 = *(int *)(v258 + 48);
  v181 = &v230[v179 * v229];
  unsigned char *v181 = 10;
  uint64_t v210 = 17;
  sub_10002A470("Show To/Cc Labels", 0x11uLL, v39 & 1);
  sub_10002A370();
  sub_10002A470(v232, v233, v246 & 1);
  sub_10002A370();
  ((void (*)(char *, void, void, uint64_t))v236)(v253, v246, v247, v234);
  sub_10002A470(v237, v238, v247 & 1);
  sub_10002A230();
  ((void (*)(char *, void, void, uint64_t))v241)(v254, v246, v247, v239);
  Builtin::Word v221 = 144;
  sub_10002A470("This is the Show To/Cc Labels control in the Mail Settings pane. When enabled, ‘To’ and ‘CC’ labels will be visible in the message list.", 0x90uLL, v246 & 1);
  sub_10002A400();
  sub_100005A10();
  sub_100005A28(v250);
  v306 = v180;
  uint64_t v212 = 67;
  uint64_t v307 = 67;
  char v308 = v245;
  char v309 = v246 & 1 & v247;
  sub_10002A3B0();
  sub_100019F3C();
  sub_10002A250();
  Builtin::Word v40 = v233;
  char v41 = v247;
  uint64_t v187 = *(int *)(v258 + 48);
  v186 = &v230[v183 * v229];
  unsigned char *v186 = 11;
  sub_10002A470("Swipe Options", v40, v41 & 1);
  sub_10002A370();
  sub_10002A470(v232, v233, v246 & 1);
  sub_10002A370();
  ((void (*)(char *, void, void, uint64_t))v236)(v253, v246, v247, v234);
  sub_10002A470(v237, v238, v247 & 1);
  sub_10002A230();
  ((void (*)(char *, void, void, uint64_t))v241)(v254, v246, v247, v239);
  sub_10002A470("This is the Swipe Options pane in the Mail Settings pane where you can set what action occurs when you swipe left or right on a mail message.", v184, v247 & 1);
  sub_10002A400();
  sub_100005A10();
  sub_100005A28(v250);
  v302 = v185;
  uint64_t v303 = 60;
  char v304 = v245;
  char v305 = v246 & 1 & v247;
  sub_10002A3B0();
  sub_100019F3C();
  sub_10002A250();
  Builtin::Word v42 = v215;
  char v43 = v247;
  uint64_t v191 = *(int *)(v258 + 48);
  v190 = &v230[v188 * v229];
  unsigned char *v190 = 12;
  sub_10002A470("Ask Before Deleting", v42, v43 & 1);
  sub_10002A370();
  sub_10002A470(v232, v233, v246 & 1);
  sub_10002A370();
  ((void (*)(char *, void, void, uint64_t))v236)(v253, v246, v247, v234);
  sub_10002A470(v237, v238, v247 & 1);
  sub_10002A230();
  ((void (*)(char *, void, void, uint64_t))v241)(v254, v246, v247, v239);
  sub_10002A470("This is the Ask Before Deleting control in the Mail Settings pane. When enabled, a confirmation prompt will appear when you try to delete a message.", 0x94uLL, v247 & 1);
  sub_10002A400();
  sub_100005A10();
  sub_100005A28(v250);
  v298 = v189;
  uint64_t v299 = 69;
  char v300 = v245;
  char v301 = v246 & 1 & v247;
  sub_10002A3B0();
  sub_100019F3C();
  sub_10002A250();
  char v44 = v247;
  uint64_t v194 = *(int *)(v258 + 48);
  v193 = &v230[v233 * v229];
  unsigned char *v193 = 13;
  uint64_t v231 = 18;
  sub_10002A470("Organize by Thread", 0x12uLL, v44 & 1);
  sub_10002A370();
  sub_10002A470(v232, v233, v246 & 1);
  sub_10002A370();
  ((void (*)(char *, void, void, uint64_t))v236)(v253, v246, v247, v234);
  sub_10002A470(v237, v238, v247 & 1);
  sub_10002A230();
  ((void (*)(char *, void, void, uint64_t))v241)(v254, v246, v247, v239);
  sub_10002A470("This is the Organize by Thread control in the Mail Settings pane. When enabled, a message and all of its replies will be grouped together in the message list.", 0x9EuLL, v247 & 1);
  sub_10002A400();
  sub_100005A10();
  sub_100005A28(v250);
  v294 = v192;
  uint64_t v295 = v244;
  char v296 = v245;
  char v297 = v246 & 1 & v247;
  sub_10002A3B0();
  sub_100019F3C();
  sub_10002A250();
  Builtin::Word v45 = v195;
  char v46 = v247;
  uint64_t v198 = *(int *)(v258 + 48);
  v197 = &v230[v216 * v229];
  unsigned char *v197 = 14;
  sub_10002A470("Collapse Read Messages", v45, v46 & 1);
  sub_10002A370();
  sub_10002A470(v232, v233, v246 & 1);
  sub_10002A370();
  ((void (*)(char *, void, void, uint64_t))v236)(v253, v246, v247, v234);
  sub_10002A470(v237, v238, v247 & 1);
  sub_10002A230();
  ((void (*)(char *, void, void, uint64_t))v241)(v254, v246, v247, v239);
  sub_10002A470("This is the Collapse Read Messages control in the Mail Settings pane. When enabled, messages that you have already read will be minimized.", 0x8AuLL, v247 & 1);
  sub_10002A400();
  sub_100005A10();
  sub_100005A28(v250);
  v290 = v196;
  uint64_t v291 = 72;
  char v292 = v245;
  char v293 = v246 & 1 & v247;
  sub_10002A3B0();
  sub_100019F3C();
  sub_10002A250();
  char v47 = v247;
  uint64_t v202 = *(int *)(v258 + 48);
  v201 = &v230[v199 * v229];
  unsigned char *v201 = 15;
  sub_10002A470("Most Recent Message on Top", 0x1AuLL, v47 & 1);
  sub_10002A370();
  sub_10002A470(v232, v233, v246 & 1);
  sub_10002A370();
  ((void (*)(char *, void, void, uint64_t))v236)(v253, v246, v247, v234);
  sub_10002A470(v237, v238, v247 & 1);
  sub_10002A230();
  ((void (*)(char *, void, void, uint64_t))v241)(v254, v246, v247, v239);
  sub_10002A470("This is the Most Recent Message on Top control in the Mail Settings pane. When enabled, unread messages will be displayed at the top of the message list.", 0x99uLL, v247 & 1);
  sub_10002A400();
  sub_100005A10();
  sub_100005A28(v250);
  v286 = v200;
  uint64_t v287 = 76;
  char v288 = v245;
  char v289 = v246 & 1 & v247;
  sub_10002A3B0();
  sub_100019F3C();
  sub_10002A250();
  char v48 = v247;
  uint64_t v205 = *(int *)(v258 + 48);
  v204 = &v230[16 * v229];
  unsigned char *v204 = 16;
  sub_10002A470("Complete Threads", 0x10uLL, v48 & 1);
  sub_10002A370();
  sub_10002A470(v232, v233, v246 & 1);
  sub_10002A370();
  ((void (*)(char *, void, void, uint64_t))v236)(v253, v246, v247, v234);
  sub_10002A470(v237, v238, v247 & 1);
  sub_10002A230();
  ((void (*)(char *, void, void, uint64_t))v241)(v254, v246, v247, v239);
  sub_10002A470("This is the Complete Threads control in the Mail Settings pane. When enabled, Mail will show all the messages in a thread, even if some have been moved to other mailboxes.", 0xABuLL, v247 & 1);
  sub_10002A400();
  sub_100005A10();
  sub_100005A28(v250);
  v282 = v203;
  uint64_t v283 = v207;
  char v284 = v245;
  char v285 = v246 & 1 & v247;
  sub_10002A3B0();
  sub_100019F3C();
  sub_10002A250();
  Builtin::Word v49 = v215;
  char v50 = v247;
  uint64_t v209 = *(int *)(v258 + 48);
  v208 = &v230[v210 * v229];
  unsigned char *v208 = 17;
  sub_10002A470("Muted Thread Action", v49, v50 & 1);
  sub_10002A370();
  sub_10002A470(v232, v233, v246 & 1);
  sub_10002A370();
  ((void (*)(char *, void, void, uint64_t))v236)(v253, v246, v247, v234);
  sub_10002A470(v237, v238, v247 & 1);
  sub_10002A230();
  ((void (*)(char *, void, void, uint64_t))v241)(v254, v246, v247, v239);
  sub_10002A470("This is the Muted Thread Action pane in the Mail Settings pane where you can determine what happens to messages when you mute a thread.", 0x87uLL, v247 & 1);
  sub_10002A400();
  sub_100005A10();
  sub_100005A28(v250);
  v278 = v206;
  uint64_t v279 = v207;
  char v280 = v245;
  char v281 = v246 & 1 & v247;
  sub_10002A3B0();
  sub_100019F3C();
  sub_10002A250();
  Builtin::Word v51 = v210;
  char v52 = v247;
  uint64_t v214 = *(int *)(v258 + 48);
  v213 = &v230[v231 * v229];
  unsigned char *v213 = 18;
  sub_10002A470("Always Bcc Myself", v51, v52 & 1);
  sub_10002A370();
  sub_10002A470(v232, v233, v246 & 1);
  sub_10002A370();
  ((void (*)(char *, void, void, uint64_t))v236)(v253, v246, v247, v234);
  sub_10002A470(v237, v238, v247 & 1);
  sub_10002A230();
  ((void (*)(char *, void, void, uint64_t))v241)(v254, v246, v247, v239);
  sub_10002A470("This is the Always Bcc Myself control in the Mail Settings pane. When enabled, any message you send will automatically be set to also send to yourself.", 0x97uLL, v247 & 1);
  sub_10002A400();
  sub_100005A10();
  sub_100005A28(v250);
  v274 = v211;
  uint64_t v275 = v212;
  char v276 = v245;
  char v277 = v246 & 1 & v247;
  sub_10002A3B0();
  sub_100019F3C();
  sub_10002A250();
  Builtin::Word v53 = v216;
  char v54 = v247;
  uint64_t v224 = *(int *)(v258 + 48);
  v223 = &v230[v215 * v229];
  unsigned char *v223 = 19;
  sub_10002A470("Mark Addresses", v53, v54 & 1);
  sub_10002A370();
  sub_10002A470(v232, v233, v246 & 1);
  sub_10002A370();
  ((void (*)(char *, void, void, uint64_t))v236)(v253, v246, v247, v234);
  sub_10002A470(v237, v238, v247 & 1);
  sub_10002A230();
  ((void (*)(char *, void, void, uint64_t))v241)(v254, v246, v247, v239);
  uint64_t v220 = sub_10002A510();
  uint64_t v219 = v55;
  sub_10002A470("Mark Addresses Not Ending With", v218, v247 & 1);
  sub_10002A370();
  uint64_t v56 = v220;
  sub_10000CF1C();
  uint64_t v225 = v56;
  sub_10002A470("This is the Mark Addresses pane in the Mail Settings pane where you can enable highlighting for addresses that do not end with specific domains.", v221, v247 & 1);
  sub_10002A400();
  sub_100005A10();
  sub_100005A28(v250);
  v270 = v222;
  uint64_t v271 = 61;
  char v272 = v245;
  char v273 = v246 & 1 & v247;
  sub_10002A3B0();
  sub_10002A250();
  Builtin::Word v57 = v238;
  char v58 = v247;
  uint64_t v228 = *(int *)(v258 + 48);
  v227 = &v230[v238 * v229];
  unsigned char *v227 = 20;
  sub_10002A470("Increase Quote level", v57, v58 & 1);
  sub_10002A370();
  sub_10002A470(v232, v233, v246 & 1);
  sub_10002A370();
  ((void (*)(char *, void, void, uint64_t))v236)(v253, v246, v247, v234);
  sub_10002A470(v237, v238, v247 & 1);
  sub_10002A230();
  ((void (*)(char *, void, void, uint64_t))v241)(v254, v246, v247, v239);
  sub_10002A470("This is the Increase Quote level control in the Mail Settings pane. When enabled, quoted text will be indented", 0x6EuLL, v247 & 1);
  sub_10002A400();
  sub_100005A10();
  sub_100005A28(v250);
  v266 = v226;
  uint64_t v267 = 70;
  char v268 = v245;
  char v269 = v246 & 1 & v247;
  sub_10002A3B0();
  sub_100019F3C();
  sub_10002A250();
  Builtin::Word v59 = v231;
  char v60 = v247;
  uint64_t v252 = *(int *)(v258 + 48);
  v251 = &v230[21 * v229];
  unsigned char *v251 = 21;
  sub_10002A470("Load Remote Images", v59, v60 & 1);
  sub_10002A370();
  sub_10002A470(v232, v233, v246 & 1);
  sub_10002A370();
  ((void (*)(char *, void, void, uint64_t))v236)(v253, v246, v247, v234);
  sub_10002A470(v237, v238, v247 & 1);
  sub_10002A230();
  ((void (*)(char *, void, void, uint64_t))v241)(v254, v246, v247, v239);
  sub_10002A470("This is the Load Remote Images control in the Mail Settings pane. When enabled, remote images will be displayed", v242, v247 & 1);
  sub_10002A400();
  sub_100005A10();
  sub_100005A28(v250);
  v262 = v243;
  uint64_t v263 = v244;
  char v264 = v245;
  char v265 = v246 & 1 & v247;
  sub_10002A3B0();
  sub_100019F3C();
  sub_10002A250();
  uint64_t v61 = v257;
  sub_10000CF1C();
  uint64_t v261 = v61;
  uint64_t v260 = sub_10002A270();
  sub_100016938();
  return sub_10002A3F0();
}

uint64_t sub_100019CC4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v25 = a2;
  uint64_t v13 = a1;
  uint64_t v28 = 0;
  uint64_t v23 = sub_10002A440();
  uint64_t v21 = *(void *)(v23 - 8);
  uint64_t v22 = v23 - 8;
  unint64_t v9 = (*(void *)(v21 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v2 = __chkstk_darwin(v13);
  char v26 = (char *)&v9 - v9;
  unint64_t v10 = (v3 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v4 = __chkstk_darwin(v2);
  uint64_t v20 = (char *)&v9 - v10;
  unint64_t v11 = (v5 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v6 = __chkstk_darwin(v4);
  uint64_t v24 = (char *)&v9 - v11;
  uint64_t v28 = v6;
  sub_10002A430();
  int v18 = 1;
  v29._countAndFlagsBits = sub_10002A470("Unsend email before ", 0x14uLL, 1);
  object = v29._object;
  sub_10002A420(v29);
  swift_bridgeObjectRelease();
  char v15 = &v27;
  uint64_t v27 = v13;
  Builtin::Word v14 = &type metadata for Int;
  uint64_t v16 = sub_10001ADCC();
  uint64_t v17 = v7;
  sub_10002A410();
  swift_bridgeObjectRelease();
  v30._countAndFlagsBits = sub_10002A470(" seconds", 8uLL, v18 & 1);
  uint64_t v19 = v30._object;
  sub_10002A420(v30);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, char *, uint64_t))(v21 + 16))(v20, v24, v23);
  (*(void (**)(char *, char *, uint64_t))(v21 + 32))(v26, v20, v23);
  (*(void (**)(char *, uint64_t))(v21 + 8))(v24, v23);
  return sub_10002A390();
}

uint64_t sub_100019F3C()
{
  return sub_10001BD28(0);
}

uint64_t sub_100019F58(uint64_t a1, void *a2)
{
  v6._countAndFlagsBits = a1;
  v6._object = a2;
  v2._rawValue = (void *)sub_10002A510();
  *(void *)uint64_t v3 = "root";
  *(void *)(v3 + 8) = 4;
  *(unsigned char *)(v3 + 16) = 2;
  *(void *)(v3 + 24) = "accounts";
  *(void *)(v3 + 32) = 8;
  *(unsigned char *)(v3 + 40) = 2;
  *(void *)(v3 + 48) = "blocked";
  *(void *)(v3 + 56) = 7;
  *(unsigned char *)(v3 + 64) = 2;
  *(void *)(v3 + 72) = "blockedSenderOptions";
  *(void *)(v3 + 80) = 20;
  *(unsigned char *)(v3 + 88) = 2;
  *(void *)(v3 + 96) = "includeAttachmentsWithReplies";
  *(void *)(v3 + 104) = 29;
  *(unsigned char *)(v3 + 112) = 2;
  *(void *)(v3 + 120) = "preview";
  *(void *)(v3 + 128) = 7;
  *(unsigned char *)(v3 + 136) = 2;
  *(void *)(v3 + 144) = "signature";
  *(void *)(v3 + 152) = 9;
  *(unsigned char *)(v3 + 160) = 2;
  *(void *)(v3 + 168) = "undoSendDelay";
  *(void *)(v3 + 176) = 13;
  *(unsigned char *)(v3 + 184) = 2;
  *(void *)(v3 + 192) = "addAccount";
  *(void *)(v3 + 200) = 10;
  *(unsigned char *)(v3 + 208) = 2;
  *(void *)(v3 + 216) = "fetchNewData";
  *(void *)(v3 + 224) = 12;
  *(unsigned char *)(v3 + 232) = 2;
  *(void *)(v3 + 240) = "showToCCLabels";
  *(void *)(v3 + 248) = 14;
  *(unsigned char *)(v3 + 256) = 2;
  *(void *)(v3 + 264) = "swipeOptions";
  *(void *)(v3 + 272) = 12;
  *(unsigned char *)(v3 + 280) = 2;
  *(void *)(v3 + 288) = "askBeforeDeleting";
  *(void *)(v3 + 296) = 17;
  *(unsigned char *)(v3 + 304) = 2;
  *(void *)(v3 + 312) = "organizeByThread";
  *(void *)(v3 + 320) = 16;
  *(unsigned char *)(v3 + 328) = 2;
  *(void *)(v3 + 336) = "collapseReadMessages";
  *(void *)(v3 + 344) = 20;
  *(unsigned char *)(v3 + 352) = 2;
  *(void *)(v3 + 360) = "mostRecentMessageOnTop";
  *(void *)(v3 + 368) = 22;
  *(unsigned char *)(v3 + 376) = 2;
  *(void *)(v3 + 384) = "completeThreads";
  *(void *)(v3 + 392) = 15;
  *(unsigned char *)(v3 + 400) = 2;
  *(void *)(v3 + 408) = "mutedThreadAction";
  *(void *)(v3 + 416) = 17;
  *(unsigned char *)(v3 + 424) = 2;
  *(void *)(v3 + 432) = "alwaysBccMyself";
  *(void *)(v3 + 440) = 15;
  *(unsigned char *)(v3 + 448) = 2;
  *(void *)(v3 + 456) = "markAddresses";
  *(void *)(v3 + 464) = 13;
  *(unsigned char *)(v3 + 472) = 2;
  *(void *)(v3 + 480) = "increaseQuoteLevel";
  *(void *)(v3 + 488) = 18;
  *(unsigned char *)(v3 + 496) = 2;
  *(void *)(v3 + 504) = "loadRemoteImages";
  *(void *)(v3 + 512) = 16;
  *(unsigned char *)(v3 + 520) = 2;
  sub_10000CF1C();
  Swift::Int v7 = sub_10002A500(v2, v6);
  swift_bridgeObjectRelease();
  switch(v7)
  {
    case 0:
      unsigned __int8 v8 = 0;
LABEL_46:
      swift_bridgeObjectRelease();
      return v8;
    case 1:
      unsigned __int8 v8 = 1;
      goto LABEL_46;
    case 2:
      unsigned __int8 v8 = 2;
      goto LABEL_46;
    case 3:
      unsigned __int8 v8 = 3;
      goto LABEL_46;
    case 4:
      unsigned __int8 v8 = 4;
      goto LABEL_46;
    case 5:
      unsigned __int8 v8 = 5;
      goto LABEL_46;
    case 6:
      unsigned __int8 v8 = 6;
      goto LABEL_46;
    case 7:
      unsigned __int8 v8 = 7;
      goto LABEL_46;
    case 8:
      unsigned __int8 v8 = 8;
      goto LABEL_46;
    case 9:
      unsigned __int8 v8 = 9;
      goto LABEL_46;
    case 10:
      unsigned __int8 v8 = 10;
      goto LABEL_46;
    case 11:
      unsigned __int8 v8 = 11;
      goto LABEL_46;
    case 12:
      unsigned __int8 v8 = 12;
      goto LABEL_46;
    case 13:
      unsigned __int8 v8 = 13;
      goto LABEL_46;
    case 14:
      unsigned __int8 v8 = 14;
      goto LABEL_46;
    case 15:
      unsigned __int8 v8 = 15;
      goto LABEL_46;
    case 16:
      unsigned __int8 v8 = 16;
      goto LABEL_46;
    case 17:
      unsigned __int8 v8 = 17;
      goto LABEL_46;
    case 18:
      unsigned __int8 v8 = 18;
      goto LABEL_46;
    case 19:
      unsigned __int8 v8 = 19;
      goto LABEL_46;
    case 20:
      unsigned __int8 v8 = 20;
      goto LABEL_46;
    case 21:
      unsigned __int8 v8 = 21;
      goto LABEL_46;
  }
  swift_bridgeObjectRelease();
  return 22;
}

uint64_t sub_10001A5B4()
{
  uint64_t result = sub_10002A510();
  *uint64_t v1 = 0;
  v1[1] = 1;
  v1[2] = 2;
  v1[3] = 3;
  v1[4] = 4;
  v1[5] = 5;
  v1[6] = 6;
  v1[7] = 7;
  v1[8] = 8;
  v1[9] = 9;
  v1[10] = 10;
  v1[11] = 11;
  v1[12] = 12;
  v1[13] = 13;
  v1[14] = 14;
  v1[15] = 15;
  v1[16] = 16;
  v1[17] = 17;
  v1[18] = 18;
  v1[19] = 19;
  v1[20] = 20;
  v1[21] = 21;
  sub_10000CF1C();
  return result;
}

uint64_t sub_10001A6A4(char a1)
{
  switch(a1)
  {
    case 1:
      uint64_t v2 = sub_10002A470("accounts", 8uLL, 1);
      break;
    case 2:
      uint64_t v2 = sub_10002A470("blocked", 7uLL, 1);
      break;
    case 3:
      uint64_t v2 = sub_10002A470("blockedSenderOptions", 0x14uLL, 1);
      break;
    case 4:
      uint64_t v2 = sub_10002A470("includeAttachmentsWithReplies", 0x1DuLL, 1);
      break;
    case 5:
      uint64_t v2 = sub_10002A470("preview", 7uLL, 1);
      break;
    case 6:
      uint64_t v2 = sub_10002A470("signature", 9uLL, 1);
      break;
    case 7:
      uint64_t v2 = sub_10002A470("undoSendDelay", 0xDuLL, 1);
      break;
    case 8:
      uint64_t v2 = sub_10002A470("addAccount", 0xAuLL, 1);
      break;
    case 9:
      uint64_t v2 = sub_10002A470("fetchNewData", 0xCuLL, 1);
      break;
    case 10:
      uint64_t v2 = sub_10002A470("showToCCLabels", 0xEuLL, 1);
      break;
    case 11:
      uint64_t v2 = sub_10002A470("swipeOptions", 0xCuLL, 1);
      break;
    case 12:
      uint64_t v2 = sub_10002A470("askBeforeDeleting", 0x11uLL, 1);
      break;
    case 13:
      uint64_t v2 = sub_10002A470("organizeByThread", 0x10uLL, 1);
      break;
    case 14:
      uint64_t v2 = sub_10002A470("collapseReadMessages", 0x14uLL, 1);
      break;
    case 15:
      uint64_t v2 = sub_10002A470("mostRecentMessageOnTop", 0x16uLL, 1);
      break;
    case 16:
      uint64_t v2 = sub_10002A470("completeThreads", 0xFuLL, 1);
      break;
    case 17:
      uint64_t v2 = sub_10002A470("mutedThreadAction", 0x11uLL, 1);
      break;
    case 18:
      uint64_t v2 = sub_10002A470("alwaysBccMyself", 0xFuLL, 1);
      break;
    case 19:
      uint64_t v2 = sub_10002A470("markAddresses", 0xDuLL, 1);
      break;
    case 20:
      uint64_t v2 = sub_10002A470("increaseQuoteLevel", 0x12uLL, 1);
      break;
    case 21:
      uint64_t v2 = sub_10002A470("loadRemoteImages", 0x10uLL, 1);
      break;
    default:
      uint64_t v2 = sub_10002A470("root", 4uLL, 1);
      break;
  }
  return v2;
}

uint64_t sub_10001AACC()
{
  return sub_10002A520() & 1;
}

uint64_t sub_10001AB18()
{
  return sub_10002A480();
}

uint64_t sub_10001AB58()
{
  return sub_10002A4A0();
}

uint64_t sub_10001ABA0()
{
  return sub_10002A490();
}

uint64_t sub_10001ABE8@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_100019F58(*(void *)a1, *(void **)(a1 + 8));
  *a2 = result;
  return result;
}

uint64_t sub_10001AC20@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10001A6A4(*v1);
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_10001AC54@<X0>(uint64_t a1@<X8>)
{
  return sub_100016A2C(a1);
}

uint64_t sub_10001AC6C()
{
  sub_10001B15C();
  uint64_t v0 = sub_10002A220();
  uint64_t v1 = *(uint64_t (**)(uint64_t))(v3 + 8);
  return v1(v0);
}

uint64_t sub_10001AD00@<X0>(uint64_t a1@<X8>)
{
  return sub_100016C7C(a1);
}

uint64_t sub_10001AD18()
{
  return sub_100029FA0();
}

uint64_t sub_10001AD50()
{
  return sub_100016CE0();
}

uint64_t sub_10001AD68()
{
  return sub_10002A300();
}

uint64_t sub_10001ADA0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10001A5B4();
  *a1 = result;
  return result;
}

uint64_t sub_10001ADCC()
{
  if (swift_dynamicCastMetatype() || swift_dynamicCastMetatype()) {
    return sub_10002A470("%lld", 4uLL, 1);
  }
  if (swift_dynamicCastMetatype() || swift_dynamicCastMetatype() || swift_dynamicCastMetatype()) {
    return sub_10002A470("%d", 2uLL, 1);
  }
  if (swift_dynamicCastMetatype() || swift_dynamicCastMetatype()) {
    return sub_10002A470("%llu", 4uLL, 1);
  }
  if (swift_dynamicCastMetatype() || swift_dynamicCastMetatype() || swift_dynamicCastMetatype()) {
    return sub_10002A470("%u", 2uLL, 1);
  }
  if (swift_dynamicCastMetatype()) {
    return sub_10002A470("%f", 2uLL, 1);
  }
  if (swift_dynamicCastMetatype() || swift_dynamicCastMetatype()) {
    return sub_10002A470("%lf", 3uLL, 1);
  }
  return sub_10002A470("%@", 2uLL, 1);
}

unint64_t sub_10001B0DC()
{
  uint64_t v2 = qword_100038998;
  if (!qword_100038998)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038998);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_10001B15C()
{
  uint64_t v2 = qword_1000389A8;
  if (!qword_1000389A8)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_1000389A8);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_10001B1DC()
{
  uint64_t v2 = qword_1000389B0;
  if (!qword_1000389B0)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_1000389B0);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_10001B25C()
{
  return sub_10001B274();
}

unint64_t sub_10001B274()
{
  uint64_t v2 = qword_1000389B8;
  if (!qword_1000389B8)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_1000389B8);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_10001B2F4()
{
  return sub_1000168B8();
}

unint64_t sub_10001B30C()
{
  return sub_10001B324();
}

unint64_t sub_10001B324()
{
  uint64_t v2 = qword_1000389C0;
  if (!qword_1000389C0)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_1000389C0);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_10001B3A4()
{
  return sub_10001B3BC();
}

unint64_t sub_10001B3BC()
{
  uint64_t v2 = qword_1000389C8;
  if (!qword_1000389C8)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_1000389C8);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_10001B43C()
{
  return sub_10001B454();
}

unint64_t sub_10001B454()
{
  uint64_t v2 = qword_1000389D0;
  if (!qword_1000389D0)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_1000389D0);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_10001B4D4()
{
  return sub_10001B0DC();
}

unint64_t sub_10001B4EC()
{
  return sub_10001B504();
}

unint64_t sub_10001B504()
{
  uint64_t v2 = qword_1000389D8;
  if (!qword_1000389D8)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_1000389D8);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_10001B584()
{
  return sub_10001B59C();
}

unint64_t sub_10001B59C()
{
  uint64_t v2 = qword_1000389E0;
  if (!qword_1000389E0)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_1000389E0);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_10001B61C()
{
  return sub_10001B634();
}

unint64_t sub_10001B634()
{
  uint64_t v2 = qword_1000389E8;
  if (!qword_1000389E8)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_1000389E8);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_10001B6B4()
{
  return sub_10001B1DC();
}

uint64_t sub_10001B6CC()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_10001B728()
{
  return sub_10001B740();
}

unint64_t sub_10001B740()
{
  uint64_t v2 = qword_1000389F0;
  if (!qword_1000389F0)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_1000389F0);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_10001B7C0()
{
  return sub_10001B7D8();
}

unint64_t sub_10001B7D8()
{
  uint64_t v2 = qword_1000389F8;
  if (!qword_1000389F8)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_1000389F8);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_10001B858()
{
  return sub_100016938();
}

unint64_t sub_10001B870()
{
  return sub_10001B888();
}

unint64_t sub_10001B888()
{
  uint64_t v2 = qword_100038A00;
  if (!qword_100038A00)
  {
    sub_100007684(&qword_100038A08);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038A00);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_10001B90C(unsigned __int8 *a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 <= 0xEA) {
      goto LABEL_15;
    }
    unsigned int v7 = ((a2 + 21) >> 8) + 1;
    int v8 = 1;
    if (v7 >= 0x100)
    {
      if (v7 >= 0x10000) {
        int v2 = 4;
      }
      else {
        int v2 = 2;
      }
      int v8 = v2;
    }
    if (v8 == 1) {
      int v6 = a1[1];
    }
    else {
      int v6 = v8 == 2 ? *(unsigned __int16 *)(a1 + 1) : *(_DWORD *)(a1 + 1);
    }
    if (v6)
    {
      int v5 = (*a1 | ((v6 - 1) << 8)) + 234;
    }
    else
    {
LABEL_15:
      int v3 = *a1 - 22;
      if (v3 < 0) {
        int v3 = -1;
      }
      int v5 = v3;
    }
  }
  else
  {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *sub_10001BABC(unsigned char *result, unsigned int a2, unsigned int a3)
{
  int v7 = 0;
  if (a3 > 0xEA)
  {
    unsigned int v5 = ((a3 + 21) >> 8) + 1;
    int v6 = 1;
    if (v5 >= 0x100)
    {
      if (v5 >= 0x10000) {
        int v3 = 4;
      }
      else {
        int v3 = 2;
      }
      int v6 = v3;
    }
    int v7 = v6;
  }
  if (a2 > 0xEA)
  {
    unsigned int v4 = ((a2 - 235) >> 8) + 1;
    *uint64_t result = a2 + 21;
    if (v7)
    {
      if (v7 == 1)
      {
        result[1] = v4;
      }
      else if (v7 == 2)
      {
        *(_WORD *)(result + 1) = v4;
      }
      else
      {
        *(_DWORD *)(result + 1) = v4;
      }
    }
  }
  else
  {
    if (v7)
    {
      if (v7 == 1)
      {
        result[1] = 0;
      }
      else if (v7 == 2)
      {
        *(_WORD *)(result + 1) = 0;
      }
      else
      {
        *(_DWORD *)(result + 1) = 0;
      }
    }
    if (a2) {
      *uint64_t result = a2 + 21;
    }
  }
  return result;
}

void *type metadata accessor for MailSettingsDeepLink()
{
  return &unk_100034FE0;
}

void *type metadata accessor for MailSettingsDeepLink.LocalizedConstants()
{
  return &unk_100035000;
}

uint64_t sub_10001BD28(uint64_t result)
{
  uint64_t v3 = result;
  if (result < 0)
  {
    __break(1u);
  }
  else
  {
    if (result > 0)
    {
      sub_10002A3A0();
      uint64_t v1 = sub_10002A4B0();
      *(void *)(v1 + 16) = v3;
      int v2 = (void *)v1;
    }
    else
    {
      swift_retain();
      int v2 = &_swiftEmptyArrayStorage;
    }
    sub_10002A3A0();
    return (uint64_t)v2;
  }
  return result;
}

uint64_t sub_10001BE08()
{
  int v6 = sub_10001BF9C;
  int v7 = sub_10001C3F4;
  uint64_t v16 = &v19;
  uint64_t v19 = 0;
  uint64_t v11 = sub_10002A1D0();
  uint64_t v9 = *(void *)(v11 - 8);
  uint64_t v10 = v11 - 8;
  unint64_t v5 = (*(void *)(v9 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v11);
  uint64_t v12 = (char *)&v4 - v5;
  uint64_t v0 = sub_100021DFC();
  int v8 = &v18;
  uint64_t v18 = v0;
  sub_10001C59C();
  sub_10002A1E0();
  uint64_t v13 = sub_10002A1C0();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v11);
  swift_bridgeObjectRetain();
  uint64_t v19 = v13;
  uint64_t v14 = sub_100005894(&qword_100038A18);
  uint64_t v1 = sub_10002A510();
  *int v2 = v13;
  sub_10000CF1C();
  uint64_t v15 = v1;
  uint64_t v17 = sub_10002A1B0();
  swift_bridgeObjectRelease();
  sub_10001C618();
  return v17;
}

uint64_t sub_10001BF9C(uint64_t a1)
{
  uint64_t v14 = a1;
  uint64_t v39 = 0;
  uint64_t v36 = &v38;
  uint64_t v38 = 0;
  uint64_t v28 = sub_100005894(&qword_100038A38);
  uint64_t v26 = *(void *)(v28 - 8);
  uint64_t v27 = v28 - 8;
  unint64_t v9 = (*(void *)(v26 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v28);
  Swift::String v29 = (char *)&v9 - v9;
  uint64_t v23 = sub_100005894(&qword_100038A40);
  uint64_t v21 = *(void *)(v23 - 8);
  uint64_t v22 = v23 - 8;
  unint64_t v10 = (*(void *)(v21 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v1 = __chkstk_darwin(v14);
  uint64_t v25 = (char *)&v9 - v10;
  unint64_t v11 = (v2 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v3 = __chkstk_darwin(v1);
  uint64_t v20 = (char *)&v9 - v11;
  unint64_t v12 = (v4 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v5 = __chkstk_darwin(v3);
  uint64_t v24 = (char *)&v9 - v12;
  uint64_t v39 = v5;
  unint64_t v34 = sub_10001C59C();
  Builtin::Word v13 = 5;
  uint64_t v30 = 1;
  Builtin::Word v33 = &unk_100035158;
  sub_10002A190();
  int v18 = 1;
  v40._countAndFlagsBits = sub_10002A470("Open ", v13, 1);
  object = v40._object;
  sub_10002A180(v40);
  swift_bridgeObjectRelease();
  uint64_t KeyPath = swift_getKeyPath();
  sub_10001B634();
  uint64_t v16 = sub_10002A0E0();
  sub_10002A170();
  swift_release();
  swift_release();
  v41._countAndFlagsBits = sub_10002A470("", 0, v18 & 1);
  uint64_t v19 = v41._object;
  sub_10002A180(v41);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, char *, uint64_t))(v21 + 16))(v20, v24, v23);
  (*(void (**)(char *, char *, uint64_t))(v21 + 32))(v25, v20, v23);
  (*(void (**)(char *, uint64_t))(v21 + 8))(v24, v23);
  sub_10002A1A0();
  uint64_t v31 = sub_10002A100();
  (*(void (**)(char *, uint64_t))(v26 + 8))(v29, v28);
  swift_bridgeObjectRetain();
  uint64_t v38 = v31;
  uint64_t v32 = sub_100005894(&qword_100038A48);
  uint64_t v6 = sub_10002A510();
  *int v7 = v31;
  sub_10000CF1C();
  uint64_t v35 = v6;
  uint64_t v37 = sub_10002A0F0();
  swift_bridgeObjectRelease();
  sub_10001C618();
  return v37;
}

uint64_t sub_10001C360@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  sub_100008250(a1, &v4);
  *a2 = sub_100022138();
  return swift_release();
}

uint64_t sub_10001C3A8(uint64_t a1, uint64_t *a2)
{
  sub_100008250(a2, &v3);
  sub_100022194();
  return swift_release();
}

uint64_t sub_10001C3F4(uint64_t a1)
{
  int v7 = sub_10001C644;
  uint64_t v20 = 0;
  uint64_t v17 = &v19;
  uint64_t v19 = 0;
  uint64_t v12 = sub_10002A160();
  uint64_t v10 = *(void *)(v12 - 8);
  uint64_t v11 = v12 - 8;
  unint64_t v6 = (*(void *)(v10 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v12);
  Builtin::Word v13 = (char *)&v5 - v6;
  uint64_t v20 = a1;
  uint64_t KeyPath = swift_getKeyPath();
  sub_10001B634();
  uint64_t v8 = sub_10002A0E0();
  sub_10001C59C();
  sub_10002A150();
  swift_release();
  uint64_t v14 = sub_10002A140();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v13, v12);
  swift_bridgeObjectRetain();
  uint64_t v19 = v14;
  uint64_t v15 = sub_100005894(&qword_100038A30);
  uint64_t v2 = sub_10002A510();
  *uint64_t v3 = v14;
  sub_10000CF1C();
  uint64_t v16 = v2;
  uint64_t v18 = sub_10002A130();
  swift_bridgeObjectRelease();
  sub_10001C618();
  return v18;
}

unint64_t sub_10001C59C()
{
  uint64_t v2 = qword_100038A10;
  if (!qword_100038A10)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038A10);
    return WitnessTable;
  }
  return v2;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_10001C618()
{
}

uint64_t sub_10001C644()
{
  sub_10002A470("Mail Settings", 0xDuLL, 1);
  uint64_t v2 = sub_10002A120();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_10002A470("Mail Accounts Settings", 0x16uLL, 1);
  uint64_t v3 = sub_10002A120();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_10002A470("Mail Signature", 0xEuLL, 1);
  uint64_t v4 = sub_10002A120();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_10002A470("Mail Preview Settings", 0x15uLL, 1);
  uint64_t v5 = sub_10002A120();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_10002A470("Mail To Label Settings", 0x16uLL, 1);
  uint64_t v6 = sub_10002A120();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_10002A470("Mail CC Label Settings", 0x16uLL, 1);
  uint64_t v7 = sub_10002A120();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_10002A470("Mail Deletion Settings", 0x16uLL, 1);
  uint64_t v8 = sub_10002A120();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_10002A470("Mail Privacy Protection Settings", 0x20uLL, 1);
  uint64_t v9 = sub_10002A120();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_10002A470("Mail Thread Settings", 0x14uLL, 1);
  uint64_t v10 = sub_10002A120();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_10002A470("Mail Blocked Sender Settings", 0x1CuLL, 1);
  uint64_t v11 = sub_10002A120();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_10002A470("Compose Mail Settings", 0x15uLL, 1);
  uint64_t v12 = sub_10002A120();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_10002A470("Mail Undo Send Delay Settings", 0x1DuLL, 1);
  uint64_t v13 = sub_10002A120();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_10002A470("Mail Include Attachments Settings", 0x21uLL, 1);
  uint64_t v14 = sub_10002A120();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_100005894(&qword_100038A28);
  sub_10002A510();
  *uint64_t v0 = v2;
  v0[1] = v3;
  v0[2] = v4;
  v0[3] = v5;
  v0[4] = v6;
  v0[5] = v7;
  v0[6] = v8;
  v0[7] = v9;
  v0[8] = v10;
  v0[9] = v11;
  v0[10] = v12;
  v0[11] = v13;
  v0[12] = v14;
  sub_10000CF1C();
  uint64_t v15 = sub_10002A110();
  swift_bridgeObjectRelease();
  sub_10001C618();
  sub_10001C618();
  sub_10001C618();
  sub_10001C618();
  sub_10001C618();
  sub_10001C618();
  sub_10001C618();
  sub_10001C618();
  sub_10001C618();
  sub_10001C618();
  sub_10001C618();
  sub_10001C618();
  sub_10001C618();
  return v15;
}

uint64_t sub_10001CB8C()
{
  v3[1] = sub_10001CCF4;
  uint64_t v11 = &v13;
  uint64_t v13 = 0;
  uint64_t v6 = sub_10002A0D0();
  uint64_t v4 = *(void *)(v6 - 8);
  uint64_t v5 = v6 - 8;
  v3[0] = (*(void *)(v4 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v6);
  uint64_t v7 = (char *)v3 - v3[0];
  sub_10001C59C();
  sub_10002A0C0();
  uint64_t v8 = sub_10002A0B0();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v6);
  swift_bridgeObjectRetain();
  uint64_t v13 = v8;
  uint64_t v9 = sub_100005894(&qword_100038A20);
  uint64_t v0 = sub_10002A510();
  *uint64_t v1 = v8;
  sub_10000CF1C();
  uint64_t v10 = v0;
  uint64_t v12 = sub_10002A0A0();
  swift_bridgeObjectRelease();
  sub_10001C618();
  return v12;
}

uint64_t sub_10001CCF4()
{
  sub_10002A470("Read my mail", 0xCuLL, 1);
  uint64_t v2 = sub_10002A120();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_10002A470("Send an email", 0xDuLL, 1);
  uint64_t v3 = sub_10002A120();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_10002A470("Reply to this email", 0x13uLL, 1);
  uint64_t v4 = sub_10002A120();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_10002A470("Forward this message", 0x14uLL, 1);
  uint64_t v5 = sub_10002A120();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_10002A470("Compose an email", 0x10uLL, 1);
  uint64_t v6 = sub_10002A120();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_100005894(&qword_100038A28);
  sub_10002A510();
  *uint64_t v0 = v2;
  v0[1] = v3;
  v0[2] = v4;
  v0[3] = v5;
  v0[4] = v6;
  sub_10000CF1C();
  uint64_t v7 = sub_10002A110();
  swift_bridgeObjectRelease();
  sub_10001C618();
  sub_10001C618();
  sub_10001C618();
  sub_10001C618();
  sub_10001C618();
  return v7;
}

uint64_t sub_10001CF3C()
{
  return sub_10001BE08();
}

uint64_t sub_10001CF54()
{
  return sub_100029F50();
}

uint64_t sub_10001CF6C()
{
  return sub_10001CB8C();
}

void *type metadata accessor for MailSettingsAssistantIntent()
{
  return &unk_100035020;
}

uint64_t sub_10001CF98@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  return sub_10001C360(a1, a2);
}

uint64_t sub_10001CFB0(uint64_t a1, uint64_t *a2)
{
  return sub_10001C3A8(a1, a2);
}

uint64_t sub_10001CFC8()
{
  return sub_10002A3E0();
}

uint64_t sub_10001D040()
{
  return sub_10002A010();
}

unint64_t sub_10001D078()
{
  uint64_t v2 = qword_100038A50;
  if (!qword_100038A50)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038A50);
    return WitnessTable;
  }
  return v2;
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

unint64_t sub_10001D150()
{
  return sub_10001D168();
}

unint64_t sub_10001D168()
{
  uint64_t v2 = qword_100038A58;
  if (!qword_100038A58)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038A58);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_10001D1E8()
{
  return swift_getOpaqueTypeConformance2();
}

void *type metadata accessor for MailSettingsIntentsExtension()
{
  return &unk_100035040;
}

uint64_t sub_10001D258()
{
  uint64_t result = sub_10002A470("com.apple.Preferences", 0x15uLL, 1);
  qword_1000390C8 = result;
  qword_1000390D0 = v1;
  return result;
}

uint64_t *sub_10001D29C()
{
  if (qword_100038160 != -1) {
    swift_once();
  }
  return &qword_1000390C8;
}

uint64_t sub_10001D300()
{
  uint64_t v1 = *sub_10001D29C();
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_10001D33C()
{
  if (qword_100038168 != -1) {
    swift_once();
  }
  return v1;
}

uint64_t sub_10001D39C()
{
  return sub_10001D33C();
}

uint64_t sub_10001D3B4()
{
  if (qword_100038170 != -1) {
    swift_once();
  }
  return v1;
}

uint64_t sub_10001D414()
{
  return sub_10001D3B4();
}

id sub_10001D42C()
{
  id result = objc_msgSend(self, "em_userDefaults");
  qword_1000390D8 = (uint64_t)result;
  return result;
}

uint64_t *sub_10001D468()
{
  if (qword_100038178 != -1) {
    swift_once();
  }
  return &qword_1000390D8;
}

uint64_t sub_10001D4CC()
{
  uint64_t v9 = "Title for entity representing the \"Lines of Preview\" setting in Mail";
  uint64_t v0 = sub_100005894(&qword_100038220);
  unint64_t v2 = (*(void *)(*(void *)(v0 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v0);
  uint64_t v20 = (char *)&v2 - v2;
  uint64_t v11 = 0;
  unint64_t v3 = (*(void *)(*(void *)(sub_10002A380() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v11);
  uint64_t v13 = (uint64_t)&v2 - v3;
  unint64_t v4 = (*(void *)(*(void *)(sub_10002A3D0() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v11);
  uint64_t v12 = (char *)&v2 - v4;
  unint64_t v5 = (*(void *)(*(void *)(sub_10002A450() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v11);
  uint64_t v10 = (char *)&v2 - v5;
  uint64_t v17 = sub_10002A3A0();
  uint64_t v14 = *(void *)(v17 - 8);
  uint64_t v15 = v17 - 8;
  unint64_t v6 = (*(void *)(v14 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v11);
  uint64_t v19 = (char *)&v2 - v6;
  uint64_t v8 = sub_10002A350();
  uint64_t v7 = qword_1000390E0;
  sub_100005904(v8, qword_1000390E0);
  uint64_t v18 = sub_1000059AC(v8, (uint64_t)v7);
  unsigned int v16 = 1;
  sub_10002A470("Preview", 7uLL, 1);
  sub_10002A400();
  sub_100005A10();
  sub_100005A28(v13);
  uint64_t v21 = v9;
  uint64_t v22 = 68;
  __int16 v23 = 2;
  sub_10002A3B0();
  (*(void (**)(char *, void, void, uint64_t))(v14 + 56))(v20, v16, v16, v17);
  return sub_10002A340();
}

uint64_t sub_10001D7C0()
{
  if (qword_100038180 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_10002A350();
  return sub_1000059AC(v0, (uint64_t)qword_1000390E0);
}

uint64_t sub_10001D830@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_10001D7C0();
  uint64_t v1 = sub_10002A350();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v1 - 8) + 16))(a1, v3);
}

uint64_t sub_10001D894()
{
  uint64_t result = sub_10002A470("LinesOfPreview", 0xEuLL, 1);
  qword_100038A60 = result;
  qword_100038A68 = v1;
  return result;
}

uint64_t *sub_10001D8D8()
{
  if (qword_100038188 != -1) {
    swift_once();
  }
  return &qword_100038A60;
}

uint64_t sub_10001D93C()
{
  unint64_t v4 = &unk_100038C10;
  unint64_t v5 = &unk_100038C18;
  uint64_t v7 = &v9;
  uint64_t v9 = 0;
  uint64_t v0 = sub_10002A3A0();
  unint64_t v3 = (*(void *)(*(void *)(v0 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v0);
  unint64_t v6 = (char *)&v2 - v3;
  sub_100005894(&qword_100038C08);
  sub_10002A470("Preview", 7uLL, 1);
  sub_10002A370();
  sub_10001EAB4();
  uint64_t v8 = sub_10002A330();
  swift_retain();
  uint64_t v9 = v8;
  sub_10000777C();
  return v8;
}

uint64_t sub_10001DA58()
{
  return sub_10001D414();
}

uint64_t sub_10001DA70()
{
  return sub_10001D300();
}

uint64_t sub_10001DA88()
{
  return sub_10001D39C();
}

uint64_t sub_10001DAA0@<X0>(uint64_t *a1@<X8>)
{
  sub_10001DAE0();
  uint64_t result = sub_10002A050();
  *a1 = result;
  a1[1] = v2;
  return result;
}

unint64_t sub_10001DAE0()
{
  uint64_t v2 = qword_100038A70;
  if (!qword_100038A70)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038A70);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_10001DB60@<X0>(uint64_t a1@<X8>)
{
  return sub_10001D830(a1);
}

uint64_t sub_10001DB78()
{
  return sub_100029FB0();
}

unint64_t sub_10001DBB0()
{
  uint64_t v2 = qword_100038A78;
  if (!qword_100038A78)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038A78);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_10001DC30()
{
  return sub_10002A040();
}

uint64_t sub_10001DC68()
{
  return sub_10002A360();
}

unint64_t sub_10001DCA0()
{
  uint64_t v2 = qword_100038A80;
  if (!qword_100038A80)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038A80);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_10001DD20()
{
  *(void *)(v0 + 16) = v0;
  return _swift_task_switch(sub_10001DD48, 0);
}

uint64_t sub_10001DD48()
{
  *(void *)(v0 + 16) = v0;
  uint64_t v1 = sub_10001D93C();
  uint64_t v2 = *(uint64_t (**)(uint64_t))(*(void *)(v0 + 16) + 8);
  return v2(v1);
}

uint64_t sub_10001DDD4(uint64_t a1)
{
  uint64_t v4 = v1;
  *(void *)(v1 + 24) = a1;
  *(void *)(v1 + 16) = v1;
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v4 + 32) = v2;
  *uint64_t v2 = *(void *)(v4 + 16);
  v2[1] = sub_1000061C8;
  return sub_10001DD20();
}

uint64_t sub_10001DE84(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = v2;
  *(void *)(v2 + 24) = a1;
  *(void *)(v2 + 16) = v2;
  unint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v6 + 32) = v3;
  unint64_t v4 = sub_10001DF48();
  *unint64_t v3 = *(void *)(v6 + 16);
  v3[1] = sub_1000061C8;
  return _UniqueEntityQuery.allEntities()(a2, v4);
}

unint64_t sub_10001DF48()
{
  uint64_t v2 = qword_100038AA0[0];
  if (!qword_100038AA0[0])
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, qword_100038AA0);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_10001DFC8(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = v2;
  *(void *)(v2 + 16) = v2;
  unint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v6 + 24) = v3;
  unint64_t v4 = sub_10001DF48();
  *unint64_t v3 = *(void *)(v6 + 16);
  v3[1] = sub_10000659C;
  return _UniqueEntityQuery.entities(for:)(a1, a2, v4);
}

uint64_t sub_10001E090(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = v2;
  *(void *)(v2 + 24) = a1;
  *(void *)(v2 + 16) = v2;
  unint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v6 + 32) = v3;
  unint64_t v4 = sub_10001DF48();
  *unint64_t v3 = *(void *)(v6 + 16);
  v3[1] = sub_1000061C8;
  return _UniqueEntityQuery.suggestedEntities()(a2, v4);
}

uint64_t sub_10001E154(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = v2;
  *(void *)(v2 + 16) = v2;
  unint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v6 + 24) = v3;
  unint64_t v4 = sub_10001E21C();
  *unint64_t v3 = *(void *)(v6 + 16);
  v3[1] = sub_1000068C4;
  return EntityQuery.results()(a1, a2, v4);
}

unint64_t sub_10001E21C()
{
  uint64_t v2 = qword_100038AC0;
  if (!qword_100038AC0)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038AC0);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_10001E29C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(v3 + 56) = a3;
  *(void *)(v3 + 48) = a1;
  *(void *)(v3 + 16) = v3;
  *(void *)(v3 + 24) = 0;
  *(void *)(v3 + 32) = 0;
  *(unsigned char *)(v3 + 136) = 0;
  uint64_t v4 = sub_100005894(&qword_100038AD8);
  *(void *)(v3 + 64) = v4;
  *(void *)(v3 + 72) = *(void *)(v4 - 8);
  *(void *)(v3 + 80) = swift_task_alloc();
  *(void *)(v3 + 24) = a2;
  *(void *)(v3 + 32) = a3;
  return _swift_task_switch(sub_10001E3B8, 0);
}

uint64_t sub_10001E3B8()
{
  *(void *)(v0 + 16) = v0;
  uint64_t KeyPath = swift_getKeyPath();
  *(void *)(v0 + 88) = KeyPath;
  uint64_t v1 = (void *)swift_task_alloc();
  v4[12] = v1;
  uint64_t v6 = sub_100005894(&qword_100038AE0);
  v4[13] = sub_10001EAB4();
  *uint64_t v1 = v4[2];
  v1[1] = sub_10001E4A8;
  uint64_t v2 = v4[10];
  return _AppEntityUpdate.value<A>(of:)(v2, KeyPath, v6);
}

uint64_t sub_10001E4A8()
{
  *(void *)(*(void *)v0 + 16) = *(void *)v0;
  swift_task_dealloc();
  swift_release();
  return _swift_task_switch(sub_10001E5E0, 0);
}

uint64_t sub_10001E5E0()
{
  uint64_t v1 = v0[10];
  uint64_t v2 = v0[9];
  uint64_t v3 = v0[8];
  v0[2] = v0;
  if ((*(unsigned int (**)(uint64_t, uint64_t))(v2 + 88))(v1, v3) == enum case for _IntentValueState.set<A>(_:))
  {
    uint64_t v8 = *(char **)(v11 + 80);
    (*(void (**)(void))(*(void *)(v11 + 72) + 96))();
    char v9 = *v8;
    *(unsigned char *)(v11 + 136) = *v8;
    *(void *)(v11 + 40) = sub_10001D93C();
    *(unsigned char *)(v11 + 137) = v9;
    uint64_t KeyPath = swift_getKeyPath();
    *(void *)(v11 + 112) = KeyPath;
    uint64_t v6 = (void *)swift_task_alloc();
    *(void *)(v11 + 120) = v6;
    void *v6 = *(void *)(v11 + 16);
    v6[1] = sub_10001E834;
    uint64_t v7 = *(void *)(v11 + 104);
    return AppEntity._setValue<A>(_:for:)(v11 + 137, KeyPath, v7);
  }
  else
  {
    (*(void (**)(void, void))(*(void *)(v11 + 72) + 8))(*(void *)(v11 + 80), *(void *)(v11 + 64));
    sub_10001EB38();
    sub_100029F70();
    swift_task_dealloc();
    uint64_t v4 = *(uint64_t (**)(void))(*(void *)(v11 + 16) + 8);
    return v4();
  }
}

uint64_t sub_10001E834()
{
  uint64_t v4 = *v1;
  *(void *)(v4 + 16) = *v1;
  *(void *)(v4 + 128) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_1000074FC;
  }
  else
  {
    swift_release();
    sub_10000777C();
    uint64_t v2 = sub_10001E9C4;
  }
  return _swift_task_switch(v2, 0);
}

uint64_t sub_10001E9C4()
{
  *(void *)(v0 + 16) = v0;
  sub_10001EB38();
  sub_100029F70();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(*(void *)(v0 + 16) + 8);
  return v1();
}

uint64_t sub_10001EA9C@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_1000075B8(a1, a2);
}

unint64_t sub_10001EAB4()
{
  uint64_t v2 = qword_100038AE8;
  if (!qword_100038AE8)
  {
    sub_100007684(&qword_100038AF0);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038AE8);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_10001EB38()
{
  uint64_t v2 = qword_100038AF8;
  if (!qword_100038AF8)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038AF8);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_10001EBB8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = v3;
  *(void *)(v3 + 16) = v3;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v6 + 24) = v4;
  *uint64_t v4 = *(void *)(v6 + 16);
  v4[1] = sub_1000068C4;
  return sub_10001E29C(a1, a2, a3);
}

uint64_t sub_10001EC7C()
{
  char v9 = "Title of options for message list preview";
  uint64_t v0 = sub_100005894(&qword_100038220);
  unint64_t v2 = (*(void *)(*(void *)(v0 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v0);
  uint64_t v20 = (char *)&v2 - v2;
  uint64_t v11 = 0;
  unint64_t v3 = (*(void *)(*(void *)(sub_10002A380() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v11);
  uint64_t v13 = (uint64_t)&v2 - v3;
  unint64_t v4 = (*(void *)(*(void *)(sub_10002A3D0() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v11);
  uint64_t v12 = (char *)&v2 - v4;
  unint64_t v5 = (*(void *)(*(void *)(sub_10002A450() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v11);
  uint64_t v10 = (char *)&v2 - v5;
  uint64_t v17 = sub_10002A3A0();
  uint64_t v14 = *(void *)(v17 - 8);
  uint64_t v15 = v17 - 8;
  unint64_t v6 = (*(void *)(v14 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v11);
  uint64_t v19 = (char *)&v2 - v6;
  uint64_t v8 = sub_10002A350();
  uint64_t v7 = static PreviewLineOption.typeDisplayRepresentation;
  sub_100005904(v8, static PreviewLineOption.typeDisplayRepresentation);
  uint64_t v18 = sub_1000059AC(v8, (uint64_t)v7);
  unsigned int v16 = 1;
  sub_10002A470("Message List Preview Lines Option", 0x21uLL, 1);
  sub_10002A400();
  sub_100005A10();
  sub_100005A28(v13);
  uint64_t v21 = v9;
  uint64_t v22 = 41;
  __int16 v23 = 2;
  sub_10002A3B0();
  (*(void (**)(char *, void, void, uint64_t))(v14 + 56))(v20, v16, v16, v17);
  return sub_10002A340();
}

uint64_t PreviewLineOption.typeDisplayRepresentation.unsafeMutableAddressor()
{
  if (qword_100038190 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_10002A350();
  return sub_1000059AC(v0, (uint64_t)static PreviewLineOption.typeDisplayRepresentation);
}

uint64_t static PreviewLineOption.typeDisplayRepresentation.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = PreviewLineOption.typeDisplayRepresentation.unsafeMutableAddressor();
  uint64_t v1 = sub_10002A350();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v1 - 8) + 16))(a1, v3);
}

uint64_t sub_10001F044()
{
  uint64_t v22 = "Title of option for 0 lines of preview";
  uint64_t v28 = "Title of option for one line of preview";
  uint64_t v31 = "Title of option for two lines of preview";
  unint64_t v34 = "Title of option for three lines of preview";
  uint64_t v38 = "Title of option for four lines of preview";
  char v44 = "Title of option for five lines of preview";
  uint64_t v0 = sub_100005894(&qword_100038548);
  unint64_t v16 = (*(void *)(*(void *)(v0 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v0);
  v62 = (char *)&v15 - v16;
  uint64_t v1 = sub_100005894(&qword_100038220);
  unint64_t v17 = (*(void *)(*(void *)(v1 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v1);
  uint64_t v61 = (char *)&v15 - v17;
  uint64_t v65 = 0;
  unint64_t v18 = (*(void *)(*(void *)(sub_10002A380() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v65);
  uint64_t v50 = (uint64_t)&v15 - v18;
  unint64_t v19 = (*(void *)(*(void *)(sub_10002A3D0() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v65);
  Builtin::Word v49 = (char *)&v15 - v19;
  unint64_t v20 = (*(void *)(*(void *)(sub_10002A450() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v65);
  char v48 = (char *)&v15 - v20;
  uint64_t v51 = sub_10002A3A0();
  uint64_t v23 = *(void *)(v51 - 8);
  uint64_t v24 = v51 - 8;
  unint64_t v21 = (*(void *)(v23 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v51);
  char v60 = (char *)&v15 - v21;
  uint64_t v64 = sub_100005894(&qword_100038B08);
  uint64_t v27 = 6;
  uint64_t v63 = sub_10002A510();
  Builtin::Word v42 = v2;
  uint64_t v25 = *(int *)(v64 + 48);
  *unint64_t v2 = 0;
  uint64_t v37 = 4;
  unsigned int v54 = 1;
  sub_10002A470("None", 4uLL, 1);
  sub_10002A400();
  sub_100005A10();
  sub_100005A28(v50);
  Builtin::Word v88 = v22;
  uint64_t v89 = 38;
  int v46 = 2;
  __int16 v90 = 2;
  int v26 = 1;
  int v47 = 0;
  sub_10002A3B0();
  Builtin::Word v53 = *(void (**)(char *, void, void, uint64_t))(v23 + 56);
  uint64_t v52 = v23 + 56;
  v53(v61, v54, v54, v51);
  uint64_t v55 = sub_10002A240();
  uint64_t v3 = *(void *)(v55 - 8);
  Builtin::Word v57 = *(void (**)(char *, void))(v3 + 56);
  uint64_t v56 = v3 + 56;
  v57(v62, v54);
  sub_10002A260();
  Builtin::Word v4 = v27;
  char v5 = v54;
  uint64_t v41 = *(void *)(*(void *)(v64 - 8) + 72);
  uint64_t v30 = *(int *)(v64 + 48);
  Swift::String v29 = &v42[v41];
  *Swift::String v29 = v26;
  sub_10002A470("1 Line", v4, v5 & 1);
  sub_10002A400();
  sub_100005A10();
  sub_100005A28(v50);
  uint64_t v84 = v28;
  uint64_t v85 = 39;
  char v86 = v46;
  char v87 = v47 & 1 & v54;
  sub_10002A3B0();
  v53(v61, v54, v54, v51);
  ((void (*)(char *, void, void, uint64_t))v57)(v62, v54, v54, v55);
  sub_10002A260();
  char v6 = v54;
  uint64_t v33 = *(int *)(v64 + 48);
  uint64_t v32 = &v42[2 * v41];
  unsigned char *v32 = v46;
  uint64_t v43 = 7;
  sub_10002A470("2 Lines", 7uLL, v6 & 1);
  sub_10002A400();
  sub_100005A10();
  sub_100005A28(v50);
  uint64_t v80 = v31;
  uint64_t v81 = 40;
  char v82 = v46;
  char v83 = v47 & 1 & v54;
  sub_10002A3B0();
  v53(v61, v54, v54, v51);
  ((void (*)(char *, void, void, uint64_t))v57)(v62, v54, v54, v55);
  sub_10002A260();
  Builtin::Word v7 = v43;
  char v8 = v54;
  uint64_t v36 = *(int *)(v64 + 48);
  uint64_t v35 = &v42[3 * v41];
  *uint64_t v35 = 3;
  sub_10002A470("3 Lines", v7, v8 & 1);
  sub_10002A400();
  sub_100005A10();
  sub_100005A28(v50);
  Builtin::Word v76 = v34;
  uint64_t v77 = 42;
  char v78 = v46;
  char v79 = v47 & 1 & v54;
  sub_10002A3B0();
  v53(v61, v54, v54, v51);
  ((void (*)(char *, void, void, uint64_t))v57)(v62, v54, v54, v55);
  sub_10002A260();
  Builtin::Word v9 = v43;
  char v10 = v54;
  uint64_t v40 = *(int *)(v64 + 48);
  uint64_t v39 = &v42[v37 * v41];
  *uint64_t v39 = 4;
  sub_10002A470("4 Lines", v9, v10 & 1);
  sub_10002A400();
  sub_100005A10();
  sub_100005A28(v50);
  uint64_t v72 = v38;
  uint64_t v45 = 41;
  uint64_t v73 = 41;
  char v74 = v46;
  char v75 = v47 & 1 & v54;
  sub_10002A3B0();
  v53(v61, v54, v54, v51);
  ((void (*)(char *, void, void, uint64_t))v57)(v62, v54, v54, v55);
  sub_10002A260();
  Builtin::Word v11 = v43;
  char v12 = v54;
  uint64_t v59 = *(int *)(v64 + 48);
  char v58 = &v42[5 * v41];
  *char v58 = 5;
  sub_10002A470("5 Lines", v11, v12 & 1);
  sub_10002A400();
  sub_100005A10();
  sub_100005A28(v50);
  unint64_t v68 = v44;
  uint64_t v69 = v45;
  char v70 = v46;
  char v71 = v47 & 1 & v54;
  sub_10002A3B0();
  v53(v61, v54, v54, v51);
  ((void (*)(char *, void, void, uint64_t))v57)(v62, v54, v54, v55);
  sub_10002A260();
  uint64_t v13 = v63;
  sub_10000CF1C();
  uint64_t v67 = v13;
  uint64_t v66 = sub_10002A270();
  sub_10001FCE8();
  uint64_t result = sub_10002A3F0();
  static PreviewLineOption.caseDisplayRepresentations = result;
  return result;
}

unint64_t sub_10001FCE8()
{
  uint64_t v2 = qword_100038B10;
  if (!qword_100038B10)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038B10);
    return WitnessTable;
  }
  return v2;
}

uint64_t *PreviewLineOption.caseDisplayRepresentations.unsafeMutableAddressor()
{
  if (qword_100038198 != -1) {
    swift_once();
  }
  return &static PreviewLineOption.caseDisplayRepresentations;
}

uint64_t static PreviewLineOption.caseDisplayRepresentations.getter()
{
  uint64_t v1 = PreviewLineOption.caseDisplayRepresentations.unsafeMutableAddressor();
  swift_beginAccess();
  uint64_t v2 = *v1;
  swift_bridgeObjectRetain();
  swift_endAccess();
  return v2;
}

uint64_t static PreviewLineOption.caseDisplayRepresentations.setter(uint64_t a1)
{
  uint64_t v2 = PreviewLineOption.caseDisplayRepresentations.unsafeMutableAddressor();
  swift_bridgeObjectRetain();
  swift_beginAccess();
  *uint64_t v2 = a1;
  swift_bridgeObjectRelease();
  swift_endAccess();
  return swift_bridgeObjectRelease();
}

uint64_t (*static PreviewLineOption.caseDisplayRepresentations.modify())()
{
  return sub_100013E48;
}

MailSettingsIntentsExtension::PreviewLineOption_optional __swiftcall PreviewLineOption.init(rawValue:)(Swift::Int rawValue)
{
  switch(rawValue)
  {
    case 0:
      return 0;
    case 1:
      return (MailSettingsIntentsExtension::PreviewLineOption_optional)1;
    case 2:
      return (MailSettingsIntentsExtension::PreviewLineOption_optional)2;
    case 3:
      return (MailSettingsIntentsExtension::PreviewLineOption_optional)3;
    case 4:
      return (MailSettingsIntentsExtension::PreviewLineOption_optional)4;
    case 5:
      return (MailSettingsIntentsExtension::PreviewLineOption_optional)5;
  }
  return (MailSettingsIntentsExtension::PreviewLineOption_optional)6;
}

uint64_t static PreviewLineOption.allCases.getter()
{
  uint64_t result = sub_10002A510();
  *uint64_t v1 = 0;
  v1[1] = 1;
  v1[2] = 2;
  v1[3] = 3;
  v1[4] = 4;
  v1[5] = 5;
  sub_10000CF1C();
  return result;
}

uint64_t PreviewLineOption.rawValue.getter(char a1)
{
  switch(a1)
  {
    case 1:
      uint64_t v2 = 1;
      break;
    case 2:
      uint64_t v2 = 2;
      break;
    case 3:
      uint64_t v2 = 3;
      break;
    case 4:
      uint64_t v2 = 4;
      break;
    case 5:
      uint64_t v2 = 5;
      break;
    default:
      uint64_t v2 = 0;
      break;
  }
  return v2;
}

unint64_t sub_100020114()
{
  return sub_10001DBB0();
}

unint64_t sub_10002012C()
{
  return sub_10001DF48();
}

unint64_t sub_100020144()
{
  return sub_10002015C();
}

unint64_t sub_10002015C()
{
  uint64_t v2 = qword_100038B18;
  if (!qword_100038B18)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038B18);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_1000201DC()
{
  return sub_1000201F4();
}

unint64_t sub_1000201F4()
{
  uint64_t v2 = qword_100038B20;
  if (!qword_100038B20)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038B20);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_100020274()
{
  return sub_10002028C();
}

unint64_t sub_10002028C()
{
  uint64_t v2 = qword_100038B28;
  if (!qword_100038B28)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038B28);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_10002030C()
{
  return sub_100020324();
}

unint64_t sub_100020324()
{
  uint64_t v2 = qword_100038B30;
  if (!qword_100038B30)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038B30);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_1000203A4()
{
  return sub_10001E21C();
}

unint64_t sub_1000203BC()
{
  return sub_1000203D4();
}

unint64_t sub_1000203D4()
{
  uint64_t v2 = qword_100038B38;
  if (!qword_100038B38)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038B38);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_100020454()
{
  return sub_10002046C();
}

unint64_t sub_10002046C()
{
  uint64_t v2 = qword_100038B40;
  if (!qword_100038B40)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038B40);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_1000204EC()
{
  return sub_100020504();
}

unint64_t sub_100020504()
{
  uint64_t v2 = qword_100038B48;
  if (!qword_100038B48)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038B48);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_100020584()
{
  return sub_10001DCA0();
}

unint64_t sub_10002059C()
{
  return sub_1000205B4();
}

unint64_t sub_1000205B4()
{
  uint64_t v2 = qword_100038B50;
  if (!qword_100038B50)
  {
    sub_100007684(&qword_100038B58);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038B50);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_100020638()
{
  return sub_100020650();
}

unint64_t sub_100020650()
{
  uint64_t v2 = qword_100038B60;
  if (!qword_100038B60)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038B60);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_1000206D0()
{
  return sub_1000206E8();
}

unint64_t sub_1000206E8()
{
  uint64_t v2 = qword_100038B68;
  if (!qword_100038B68)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038B68);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_100020768()
{
  return sub_10001DAE0();
}

unint64_t sub_100020780()
{
  return sub_100020798();
}

unint64_t sub_100020798()
{
  uint64_t v2 = qword_100038B70;
  if (!qword_100038B70)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038B70);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_100020818()
{
  return sub_100020830();
}

unint64_t sub_100020830()
{
  uint64_t v2 = qword_100038B78;
  if (!qword_100038B78)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038B78);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_1000208B0()
{
  return sub_1000208C8();
}

unint64_t sub_1000208C8()
{
  uint64_t v2 = qword_100038B80;
  if (!qword_100038B80)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038B80);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_100020948()
{
  return sub_100020960();
}

unint64_t sub_100020960()
{
  uint64_t v2 = qword_100038B88;
  if (!qword_100038B88)
  {
    sub_100007684(&qword_100038B90);
    sub_100020504();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038B88);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_1000209F4()
{
  return sub_100020A0C();
}

unint64_t sub_100020A0C()
{
  uint64_t v2 = qword_100038B98;
  if (!qword_100038B98)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038B98);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_100020A8C()
{
  return sub_10001EB38();
}

uint64_t sub_100020AA4()
{
  return sub_10002A520() & 1;
}

unint64_t sub_100020AF0()
{
  return sub_100020B08();
}

unint64_t sub_100020B08()
{
  uint64_t v2 = qword_100038BA0;
  if (!qword_100038BA0)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038BA0);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_100020B88()
{
  return sub_10002A480();
}

uint64_t sub_100020BC8()
{
  return sub_10002A4A0();
}

uint64_t sub_100020C10()
{
  return sub_10002A490();
}

MailSettingsIntentsExtension::PreviewLineOption_optional sub_100020C58@<W0>(Swift::Int *a1@<X0>, MailSettingsIntentsExtension::PreviewLineOption_optional *a2@<X8>)
{
  result.value = PreviewLineOption.init(rawValue:)(*a1).value;
  a2->value = result.value;
  return result;
}

uint64_t sub_100020C88@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = PreviewLineOption.rawValue.getter(*v1);
  *a1 = result;
  return result;
}

unint64_t sub_100020CB8()
{
  return sub_100020CD0();
}

unint64_t sub_100020CD0()
{
  uint64_t v2 = qword_100038BA8;
  if (!qword_100038BA8)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038BA8);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_100020D50()
{
  return sub_100020D68();
}

unint64_t sub_100020D68()
{
  uint64_t v2 = qword_100038BB0;
  if (!qword_100038BB0)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038BB0);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_100020DE8()
{
  return sub_100020E00();
}

unint64_t sub_100020E00()
{
  uint64_t v2 = qword_100038BB8;
  if (!qword_100038BB8)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038BB8);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_100020E80()
{
  return sub_100020E98();
}

unint64_t sub_100020E98()
{
  uint64_t v2 = qword_100038BC0;
  if (!qword_100038BC0)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038BC0);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_100020F18()
{
  return sub_100020F30();
}

unint64_t sub_100020F30()
{
  uint64_t v2 = qword_100038BC8;
  if (!qword_100038BC8)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038BC8);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_100020FB0()
{
  return sub_100020FC8();
}

unint64_t sub_100020FC8()
{
  uint64_t v2 = qword_100038BD0;
  if (!qword_100038BD0)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038BD0);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_100021048()
{
  return sub_100021060();
}

unint64_t sub_100021060()
{
  uint64_t v2 = qword_100038BD8;
  if (!qword_100038BD8)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038BD8);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_1000210E0@<X0>(uint64_t a1@<X8>)
{
  return static PreviewLineOption.typeDisplayRepresentation.getter(a1);
}

uint64_t sub_1000210F8()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_100021154()
{
  uint64_t v2 = qword_100038BE0;
  if (!qword_100038BE0)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038BE0);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_1000211D4()
{
  return sub_100029FA0();
}

unint64_t sub_10002120C()
{
  return sub_100021224();
}

unint64_t sub_100021224()
{
  uint64_t v2 = qword_100038BE8;
  if (!qword_100038BE8)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038BE8);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_1000212A4()
{
  return sub_1000212BC();
}

unint64_t sub_1000212BC()
{
  uint64_t v2 = qword_100038BF0;
  if (!qword_100038BF0)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038BF0);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_10002133C()
{
  return sub_10001FCE8();
}

uint64_t sub_100021354()
{
  return static PreviewLineOption.caseDisplayRepresentations.getter();
}

uint64_t sub_10002136C()
{
  return sub_10002A300();
}

unint64_t sub_1000213A4()
{
  return sub_1000213BC();
}

unint64_t sub_1000213BC()
{
  uint64_t v2 = qword_100038BF8;
  if (!qword_100038BF8)
  {
    sub_100007684(&qword_100038C00);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038BF8);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_100021440@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = static PreviewLineOption.allCases.getter();
  *a1 = result;
  return result;
}

void *type metadata accessor for MessageListPreviewLinesPreferenceEntity()
{
  return &unk_100035060;
}

void *type metadata accessor for MessageListPreviewLinesEntityQuery()
{
  return &unk_100035088;
}

void *type metadata accessor for MessageListPreviewLinesEntityUpdateHandler()
{
  return &unk_1000350A8;
}

uint64_t getEnumTagSinglePayload for PreviewLineOption(unsigned __int8 *a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 <= 0xFA) {
      goto LABEL_15;
    }
    unsigned int v7 = ((a2 + 5) >> 8) + 1;
    int v8 = 1;
    if (v7 >= 0x100)
    {
      if (v7 >= 0x10000) {
        int v2 = 4;
      }
      else {
        int v2 = 2;
      }
      int v8 = v2;
    }
    if (v8 == 1) {
      int v6 = a1[1];
    }
    else {
      int v6 = v8 == 2 ? *(unsigned __int16 *)(a1 + 1) : *(_DWORD *)(a1 + 1);
    }
    if (v6)
    {
      int v5 = (*a1 | ((v6 - 1) << 8)) + 250;
    }
    else
    {
LABEL_15:
      int v3 = *a1 - 6;
      if (v3 < 0) {
        int v3 = -1;
      }
      int v5 = v3;
    }
  }
  else
  {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for PreviewLineOption(unsigned char *result, unsigned int a2, unsigned int a3)
{
  int v7 = 0;
  if (a3 > 0xFA)
  {
    unsigned int v5 = ((a3 + 5) >> 8) + 1;
    int v6 = 1;
    if (v5 >= 0x100)
    {
      if (v5 >= 0x10000) {
        int v3 = 4;
      }
      else {
        int v3 = 2;
      }
      int v6 = v3;
    }
    int v7 = v6;
  }
  if (a2 > 0xFA)
  {
    unsigned int v4 = ((a2 - 251) >> 8) + 1;
    *uint64_t result = a2 + 5;
    if (v7)
    {
      if (v7 == 1)
      {
        result[1] = v4;
      }
      else if (v7 == 2)
      {
        *(_WORD *)(result + 1) = v4;
      }
      else
      {
        *(_DWORD *)(result + 1) = v4;
      }
    }
  }
  else
  {
    if (v7)
    {
      if (v7 == 1)
      {
        result[1] = 0;
      }
      else if (v7 == 2)
      {
        *(_WORD *)(result + 1) = 0;
      }
      else
      {
        *(_DWORD *)(result + 1) = 0;
      }
    }
    if (a2) {
      *uint64_t result = a2 + 5;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PreviewLineOption()
{
  return &type metadata for PreviewLineOption;
}

uint64_t sub_1000218B0(uint64_t a1, void *a2)
{
  *(void *)(v2 + 144) = a1;
  *(void *)(v2 + 112) = v2;
  *(void *)(v2 + 120) = 0;
  *(void *)(v2 + 128) = 0;
  *(unsigned char *)(v2 + 152) = 0;
  *(void *)(v2 + 120) = *a2;
  return _swift_task_switch(sub_1000218F4, 0);
}

uint64_t sub_1000218F4()
{
  *(void *)(v0 + 112) = v0;
  uint64_t v13 = (void *)*sub_10001D468();
  id v1 = v13;
  if (v13)
  {
    sub_10001D8D8();
    swift_bridgeObjectRetain();
    NSString v10 = sub_10002A460();
    swift_bridgeObjectRelease();
    id v11 = [v13 objectForKey:v10];

    if (v11)
    {
      sub_10002A4E0();
      sub_10000F050(v12 + 80, v12 + 48);
      swift_unknownObjectRelease();
    }
    else
    {
      *(void *)(v12 + 48) = 0;
      *(void *)(v12 + 56) = 0;
      *(void *)(v12 + 64) = 0;
      *(void *)(v12 + 72) = 0;
    }
    sub_10000EFEC((_OWORD *)(v12 + 48), (_OWORD *)(v12 + 16));
  }
  else
  {
    *(void *)(v12 + 16) = 0;
    *(void *)(v12 + 24) = 0;
    *(void *)(v12 + 32) = 0;
    *(void *)(v12 + 40) = 0;
  }
  if (*(void *)(v12 + 40))
  {
    if (swift_dynamicCast())
    {
      Swift::Int v6 = *(void *)(v12 + 136);
      char v7 = 0;
    }
    else
    {
      Swift::Int v6 = 0;
      char v7 = 1;
    }
    Swift::Int v8 = v6;
    char v9 = v7;
  }
  else
  {
    sub_10000EEFC(v12 + 16);
    Swift::Int v8 = 0;
    char v9 = 1;
  }
  if ((v9 & 1) != 0
    || (*(void *)(v12 + 128) = v8,
        v2.value = PreviewLineOption.init(rawValue:)(v8).value,
        v2.value == MailSettingsIntentsExtension_PreviewLineOption_unknownDefault))
  {
    **(unsigned char **)(v12 + 144) = 2;
  }
  else
  {
    int v3 = *(MailSettingsIntentsExtension::PreviewLineOption_optional **)(v12 + 144);
    *(MailSettingsIntentsExtension::PreviewLineOption_optional *)(v12 + 152) = v2;
    v3->value = v2.value;
  }
  unsigned int v4 = *(uint64_t (**)(void))(*(void *)(v12 + 112) + 8);
  return v4();
}

uint64_t sub_100021C58(void *a1, char *a2)
{
  *(void *)(v2 + 16) = v2;
  *(void *)(v2 + 24) = 0;
  *(unsigned char *)(v2 + 32) = 0;
  *(void *)(v2 + 24) = *a1;
  char v3 = *a2;
  *(unsigned char *)(v2 + 33) = *a2;
  *(unsigned char *)(v2 + 32) = v3;
  return _swift_task_switch(sub_100021CA4, 0);
}

uint64_t sub_100021CA4()
{
  *(void *)(v0 + 16) = v0;
  char v7 = (void *)*sub_10001D468();
  id v1 = v7;
  if (v7)
  {
    uint64_t v4 = PreviewLineOption.rawValue.getter(*(unsigned char *)(v6 + 33));
    sub_10001D8D8();
    swift_bridgeObjectRetain();
    NSString v5 = sub_10002A460();
    swift_bridgeObjectRelease();
    [v7 setInteger:v4 forKey:v5];
  }
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(v6 + 16) + 8);
  return v2();
}

uint64_t sub_100021DFC()
{
  uint64_t v27 = &v30;
  uint64_t v30 = 0;
  uint64_t v13 = 0;
  uint64_t v0 = sub_10002A2F0();
  unint64_t v5 = (*(void *)(*(void *)(v0 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v0);
  uint64_t v24 = (uint64_t)&v5 - v5;
  uint64_t v1 = sub_100005894(&qword_100038C58);
  unint64_t v6 = (*(void *)(*(void *)(v1 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v1);
  uint64_t v23 = (char *)&v5 - v6;
  unint64_t v7 = (v2 + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin((char *)&v5 - v6);
  uint64_t v22 = (char *)&v5 - v7;
  unint64_t v8 = (*(void *)(*(void *)(sub_100005894(&qword_100038220) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v13);
  unint64_t v20 = (char *)&v5 - v8;
  uint64_t v12 = sub_10002A3A0();
  uint64_t v10 = *(void *)(v12 - 8);
  uint64_t v11 = v12 - 8;
  unint64_t v9 = (*(void *)(v10 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v12);
  int v26 = (char *)&v5 - v9;
  sub_100005894(&qword_100038C60);
  unsigned int v14 = 1;
  sub_10002A470("Mail Settings", 0xDuLL, 1);
  sub_10002A370();
  (*(void (**)(char *, void, void, uint64_t))(v10 + 56))(v20, v14, v14, v12);
  unint64_t v21 = &v29;
  char v29 = 22;
  uint64_t v15 = sub_10002A030();
  uint64_t v3 = *(void *)(v15 - 8);
  unint64_t v17 = *(void (**)(char *, void))(v3 + 56);
  uint64_t v16 = v3 + 56;
  v17(v22, v14);
  ((void (*)(char *, void, void, uint64_t))v17)(v23, v14, v14, v15);
  unint64_t v19 = sub_10001B634();
  unint64_t v25 = sub_1000168B8();
  unint64_t v18 = &unk_100034FE0;
  sub_100022E5C(v24);
  sub_100022ECC((uint64_t)v18, v19, v25);
  uint64_t v28 = sub_10002A090();
  swift_retain();
  uint64_t v30 = v28;
  sub_10000777C();
  return v28;
}

uint64_t sub_100022138()
{
  swift_retain();
  sub_10002A070();
  swift_release();
  return v1;
}

uint64_t sub_100022194()
{
  return swift_release();
}

uint64_t sub_1000221F8()
{
  uint64_t v1 = sub_10002A3A0();
  sub_100005904(v1, qword_100039118);
  sub_1000059AC(v1, (uint64_t)qword_100039118);
  sub_10002A470("Open Mail Settings", 0x12uLL, 1);
  return sub_10002A370();
}

uint64_t sub_100022264()
{
  if (qword_1000381A0 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_10002A3A0();
  return sub_1000059AC(v0, (uint64_t)qword_100039118);
}

uint64_t sub_1000222D4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_100022264();
  uint64_t v1 = sub_10002A3A0();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v1 - 8) + 16))(a1, v3);
}

void *sub_100022338()
{
  return &unk_100031260;
}

uint64_t sub_100022344()
{
  return 0;
}

void *sub_100022350()
{
  return &unk_100031261;
}

uint64_t sub_10002235C()
{
  return 1;
}

uint64_t sub_100022368()
{
  uint64_t result = sub_10002A470("com.apple.Preferences", 0x15uLL, 1);
  qword_100039130 = result;
  qword_100039138 = v1;
  return result;
}

uint64_t *sub_1000223AC()
{
  if (qword_1000381A8 != -1) {
    swift_once();
  }
  return &qword_100039130;
}

uint64_t sub_100022410()
{
  uint64_t v1 = *sub_1000223AC();
  swift_bridgeObjectRetain();
  return v1;
}

void (*sub_10002244C(void *a1, uint64_t a2))(void **a1)
{
  uint64_t v4 = malloc(0x30uLL);
  *a1 = v4;
  v4[4] = a2;
  swift_retain();
  v4[5] = sub_10002A060();
  return sub_1000224E0;
}

void sub_1000224E0(void **a1)
{
  uint64_t v1 = (void (**)(void *, void))*a1;
  v1[5](v1, 0);
  swift_release();
  free(v1);
}

uint64_t sub_10002257C@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_100022138();
  *a1 = result;
  return result;
}

uint64_t sub_1000225AC()
{
  return sub_100022194();
}

void (*sub_1000225CC(void *a1))(void **a1, char a2)
{
  uint64_t v3 = malloc(0x28uLL);
  *a1 = v3;
  v3[4] = sub_10002244C(v3, *v1);
  return sub_100022638;
}

void sub_100022638(void **a1, char a2)
{
  uint64_t v2 = (void (**)(void *, uint64_t))*a1;
  if (a2) {
    v2[4](v2, 1);
  }
  else {
    v2[4](v2, 0);
  }
  free(v2);
}

uint64_t sub_1000226B4()
{
  return sub_10002A2D0();
}

unint64_t sub_100022700()
{
  uint64_t v2 = qword_100038C20;
  if (!qword_100038C20)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038C20);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_100022780()
{
  return sub_100029F90();
}

uint64_t sub_100022798()
{
  return sub_100022410();
}

uint64_t sub_1000227B0()
{
  return sub_100029F80();
}

uint64_t sub_1000227C8@<X0>(uint64_t a1@<X8>)
{
  return sub_1000222D4(a1);
}

uint64_t sub_1000227E0()
{
  return sub_100022344() & 1;
}

uint64_t sub_1000227FC()
{
  return sub_100029FF0();
}

uint64_t sub_100022814()
{
  return sub_10002235C() & 1;
}

uint64_t sub_100022830()
{
  return sub_100029FE0();
}

uint64_t sub_100022848()
{
  return sub_100029FD0();
}

uint64_t sub_100022860(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = v2;
  *(void *)(v2 + 16) = v2;
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v6 + 24) = v3;
  unint64_t v7 = sub_100022700();
  unint64_t v8 = sub_100022A84();
  unint64_t v4 = sub_10001B15C();
  *uint64_t v3 = *(void *)(v6 + 16);
  v3[1] = sub_100022938;
  return URLRepresentableIntent<>.perform()(a2, v7, v8, v4);
}

uint64_t sub_100022938()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 16) = *v1;
  uint64_t v5 = v2 + 16;
  uint64_t result = swift_task_dealloc();
  if (v0)
  {
    unint64_t v4 = *(uint64_t (**)(void))(*(void *)v5 + 8);
    return v4();
  }
  return result;
}

unint64_t sub_100022A84()
{
  uint64_t v2 = qword_100038C30;
  if (!qword_100038C30)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038C30);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_100022B04@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100021DFC();
  *a1 = result;
  return result;
}

uint64_t sub_100022B30()
{
  return sub_10002A000();
}

unint64_t sub_100022B60()
{
  return sub_100022B78();
}

unint64_t sub_100022B78()
{
  uint64_t v2 = qword_100038C38;
  if (!qword_100038C38)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038C38);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_100022BF8()
{
  return sub_10001B3BC();
}

unint64_t sub_100022C10()
{
  return sub_10001C59C();
}

unint64_t sub_100022C28()
{
  return sub_100022C40();
}

unint64_t sub_100022C40()
{
  uint64_t v2 = qword_100038C40;
  if (!qword_100038C40)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038C40);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_100022CC0()
{
  return sub_100022CD8();
}

unint64_t sub_100022CD8()
{
  uint64_t v2 = qword_100038C48;
  if (!qword_100038C48)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038C48);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_100022D58()
{
  return sub_100022D70();
}

unint64_t sub_100022D70()
{
  uint64_t v2 = qword_100038C50;
  if (!qword_100038C50)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038C50);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_100022DEC()
{
  return swift_getOpaqueTypeConformance2();
}

void *type metadata accessor for OpenMailSettingsDeepLink()
{
  return &unk_100035158;
}

uint64_t sub_100022E5C@<X0>(uint64_t a1@<X8>)
{
  unsigned int v3 = enum case for InputConnectionBehavior.default(_:);
  uint64_t v1 = sub_10002A2F0();
  return (*(uint64_t (**)(uint64_t, void))(*(void *)(v1 - 8) + 104))(a1, v3);
}

uint64_t sub_100022ECC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[0] = a1;
  uint64_t v11 = a1;
  uint64_t v6 = *(void *)(*(void *)(*(void *)(a3 + 16) + 8) + 16);
  v4[1] = swift_getAssociatedTypeWitness();
  v4[2] = 0;
  unint64_t v7 = &protocol requirements base descriptor for CaseIterable;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  unint64_t v5 = (*(void *)(*(void *)(AssociatedTypeWitness - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(0);
  uint64_t v10 = (char *)v4 - v5;
  uint64_t v8 = swift_checkMetadataState();
  sub_10002A4F0();
  swift_getAssociatedConformanceWitness();
  return sub_10002A4D0();
}

uint64_t sub_100023004()
{
  uint64_t result = sub_10002A470("com.apple.Preferences", 0x15uLL, 1);
  qword_100039140 = result;
  qword_100039148 = v1;
  return result;
}

uint64_t *sub_100023048()
{
  if (qword_1000381B0 != -1) {
    swift_once();
  }
  return &qword_100039140;
}

uint64_t sub_1000230AC()
{
  uint64_t v1 = *sub_100023048();
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_1000230E8()
{
  if (qword_1000381B8 != -1) {
    swift_once();
  }
  return v1;
}

uint64_t sub_100023148()
{
  return sub_1000230E8();
}

uint64_t sub_100023160()
{
  if (qword_1000381C0 != -1) {
    swift_once();
  }
  return v1;
}

uint64_t sub_1000231C0()
{
  return sub_100023160();
}

id sub_1000231D8()
{
  id result = objc_msgSend(self, "em_userDefaults");
  qword_100039150 = (uint64_t)result;
  return result;
}

uint64_t *sub_100023214()
{
  if (qword_1000381C8 != -1) {
    swift_once();
  }
  return &qword_100039150;
}

uint64_t sub_100023278()
{
  unint64_t v9 = "Title for entity representing the \"Show Contact Photos\" setting in Mail";
  uint64_t v0 = sub_100005894(&qword_100038220);
  unint64_t v2 = (*(void *)(*(void *)(v0 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v0);
  unint64_t v20 = (char *)&v2 - v2;
  uint64_t v11 = 0;
  unint64_t v3 = (*(void *)(*(void *)(sub_10002A380() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v11);
  uint64_t v13 = (uint64_t)&v2 - v3;
  unint64_t v4 = (*(void *)(*(void *)(sub_10002A3D0() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v11);
  uint64_t v12 = (char *)&v2 - v4;
  unint64_t v5 = (*(void *)(*(void *)(sub_10002A450() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v11);
  uint64_t v10 = (char *)&v2 - v5;
  uint64_t v17 = sub_10002A3A0();
  uint64_t v14 = *(void *)(v17 - 8);
  uint64_t v15 = v17 - 8;
  unint64_t v6 = (*(void *)(v14 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v11);
  unint64_t v19 = (char *)&v2 - v6;
  uint64_t v8 = sub_10002A350();
  unint64_t v7 = qword_100039158;
  sub_100005904(v8, qword_100039158);
  uint64_t v18 = sub_1000059AC(v8, (uint64_t)v7);
  unsigned int v16 = 1;
  sub_10002A470("Show Contact Photos", 0x13uLL, 1);
  sub_10002A400();
  sub_100005A10();
  sub_100005A28(v13);
  unint64_t v21 = v9;
  uint64_t v22 = 71;
  __int16 v23 = 2;
  sub_10002A3B0();
  (*(void (**)(char *, void, void, uint64_t))(v14 + 56))(v20, v16, v16, v17);
  return sub_10002A340();
}

uint64_t sub_10002356C()
{
  if (qword_1000381D0 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_10002A350();
  return sub_1000059AC(v0, (uint64_t)qword_100039158);
}

uint64_t sub_1000235DC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_10002356C();
  uint64_t v1 = sub_10002A350();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v1 - 8) + 16))(a1, v3);
}

uint64_t sub_100023640()
{
  uint64_t result = sub_10002A470("EnableContactPhotos", 0x13uLL, 1);
  qword_100038C68 = result;
  qword_100038C70 = v1;
  return result;
}

uint64_t *sub_100023684()
{
  if (qword_1000381D8 != -1) {
    swift_once();
  }
  return &qword_100038C68;
}

uint64_t sub_1000236E8()
{
  unint64_t v6 = "Title for entity representing the \"Show Contact Photos\" setting in Mail";
  uint64_t v8 = 0;
  uint64_t v11 = &unk_100038D98;
  uint64_t v12 = &unk_100038DA0;
  uint64_t v14 = &v19;
  uint64_t v19 = 0;
  unint64_t v2 = (*(void *)(*(void *)(sub_10002A380() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(0);
  uint64_t v10 = (uint64_t)&v2 - v2;
  unint64_t v3 = (*(void *)(*(void *)(sub_10002A3D0() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v8);
  unint64_t v9 = (char *)&v2 - v3;
  unint64_t v4 = (*(void *)(*(void *)(sub_10002A450() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v8);
  unint64_t v7 = (char *)&v2 - v4;
  uint64_t v0 = sub_10002A3A0();
  unint64_t v5 = (*(void *)(*(void *)(v0 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v0);
  uint64_t v13 = (char *)&v2 - v5;
  sub_100005894(&qword_100038D90);
  sub_10002A470("Show Contact Photos", 0x13uLL, 1);
  sub_10002A400();
  sub_100005A10();
  sub_100005A28(v10);
  unsigned int v16 = v6;
  uint64_t v17 = 71;
  __int16 v18 = 2;
  sub_10002A3B0();
  sub_1000249F0();
  uint64_t v15 = sub_10002A330();
  swift_retain();
  uint64_t v19 = v15;
  sub_10000777C();
  return v15;
}

uint64_t sub_10002397C()
{
  return sub_1000231C0();
}

uint64_t sub_100023994()
{
  return sub_1000230AC();
}

uint64_t sub_1000239AC()
{
  return sub_100023148();
}

uint64_t sub_1000239C4@<X0>(uint64_t *a1@<X8>)
{
  sub_100023A04();
  uint64_t result = sub_10002A050();
  *a1 = result;
  a1[1] = v2;
  return result;
}

unint64_t sub_100023A04()
{
  uint64_t v2 = qword_100038C78;
  if (!qword_100038C78)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038C78);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_100023A84@<X0>(uint64_t a1@<X8>)
{
  return sub_1000235DC(a1);
}

uint64_t sub_100023A9C()
{
  return sub_100029FB0();
}

unint64_t sub_100023AD4()
{
  uint64_t v2 = qword_100038C80;
  if (!qword_100038C80)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038C80);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_100023B54()
{
  return sub_10002A040();
}

uint64_t sub_100023B8C()
{
  return sub_10002A360();
}

unint64_t sub_100023BC4()
{
  uint64_t v2 = qword_100038C88;
  if (!qword_100038C88)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038C88);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_100023C44()
{
  *(void *)(v0 + 16) = v0;
  return _swift_task_switch(sub_100023C6C, 0);
}

uint64_t sub_100023C6C()
{
  *(void *)(v0 + 16) = v0;
  uint64_t v1 = sub_1000236E8();
  uint64_t v2 = *(uint64_t (**)(uint64_t))(*(void *)(v0 + 16) + 8);
  return v2(v1);
}

uint64_t sub_100023CF8(uint64_t a1)
{
  uint64_t v4 = v1;
  *(void *)(v1 + 24) = a1;
  *(void *)(v1 + 16) = v1;
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v4 + 32) = v2;
  *uint64_t v2 = *(void *)(v4 + 16);
  v2[1] = sub_1000061C8;
  return sub_100023C44();
}

uint64_t sub_100023DA8(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = v2;
  *(void *)(v2 + 24) = a1;
  *(void *)(v2 + 16) = v2;
  unint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v6 + 32) = v3;
  unint64_t v4 = sub_100023E6C();
  *unint64_t v3 = *(void *)(v6 + 16);
  v3[1] = sub_1000061C8;
  return _UniqueEntityQuery.allEntities()(a2, v4);
}

unint64_t sub_100023E6C()
{
  uint64_t v2 = qword_100038CA8[0];
  if (!qword_100038CA8[0])
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, qword_100038CA8);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_100023EEC(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = v2;
  *(void *)(v2 + 16) = v2;
  unint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v6 + 24) = v3;
  unint64_t v4 = sub_100023E6C();
  *unint64_t v3 = *(void *)(v6 + 16);
  v3[1] = sub_10000659C;
  return _UniqueEntityQuery.entities(for:)(a1, a2, v4);
}

uint64_t sub_100023FB4(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = v2;
  *(void *)(v2 + 24) = a1;
  *(void *)(v2 + 16) = v2;
  unint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v6 + 32) = v3;
  unint64_t v4 = sub_100023E6C();
  *unint64_t v3 = *(void *)(v6 + 16);
  v3[1] = sub_1000061C8;
  return _UniqueEntityQuery.suggestedEntities()(a2, v4);
}

uint64_t sub_100024078(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = v2;
  *(void *)(v2 + 16) = v2;
  unint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v6 + 24) = v3;
  unint64_t v4 = sub_100024140();
  *unint64_t v3 = *(void *)(v6 + 16);
  v3[1] = sub_1000068C4;
  return EntityQuery.results()(a1, a2, v4);
}

unint64_t sub_100024140()
{
  uint64_t v2 = qword_100038CC8;
  if (!qword_100038CC8)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038CC8);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_1000241C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(v3 + 56) = a3;
  *(void *)(v3 + 48) = a1;
  *(void *)(v3 + 16) = v3;
  *(void *)(v3 + 24) = 0;
  *(void *)(v3 + 32) = 0;
  *(unsigned char *)(v3 + 136) = 0;
  uint64_t v4 = sub_100005894(&qword_100038290);
  *(void *)(v3 + 64) = v4;
  *(void *)(v3 + 72) = *(void *)(v4 - 8);
  *(void *)(v3 + 80) = swift_task_alloc();
  *(void *)(v3 + 24) = a2;
  *(void *)(v3 + 32) = a3;
  return _swift_task_switch(sub_1000242DC, 0);
}

uint64_t sub_1000242DC()
{
  *(void *)(v0 + 16) = v0;
  uint64_t KeyPath = swift_getKeyPath();
  *(void *)(v0 + 88) = KeyPath;
  uint64_t v1 = (void *)swift_task_alloc();
  v4[12] = v1;
  uint64_t v6 = sub_100005894(&qword_100038CE0);
  v4[13] = sub_1000249F0();
  *uint64_t v1 = v4[2];
  v1[1] = sub_1000243CC;
  uint64_t v2 = v4[10];
  return _AppEntityUpdate.value<A>(of:)(v2, KeyPath, v6);
}

uint64_t sub_1000243CC()
{
  *(void *)(*(void *)v0 + 16) = *(void *)v0;
  swift_task_dealloc();
  swift_release();
  return _swift_task_switch(sub_100024504, 0);
}

uint64_t sub_100024504()
{
  uint64_t v1 = v0[10];
  uint64_t v2 = v0[9];
  uint64_t v3 = v0[8];
  v0[2] = v0;
  if ((*(unsigned int (**)(uint64_t, uint64_t))(v2 + 88))(v1, v3) == enum case for _IntentValueState.set<A>(_:))
  {
    uint64_t v8 = *(char **)(v11 + 80);
    (*(void (**)(void))(*(void *)(v11 + 72) + 96))();
    char v9 = *v8;
    *(unsigned char *)(v11 + 136) = *v8 & 1;
    *(void *)(v11 + 40) = sub_1000236E8();
    *(unsigned char *)(v11 + 137) = v9 & 1;
    uint64_t KeyPath = swift_getKeyPath();
    *(void *)(v11 + 112) = KeyPath;
    uint64_t v6 = (void *)swift_task_alloc();
    *(void *)(v11 + 120) = v6;
    void *v6 = *(void *)(v11 + 16);
    v6[1] = sub_100024770;
    uint64_t v7 = *(void *)(v11 + 104);
    return AppEntity._setValue<A>(_:for:)(v11 + 137, KeyPath, v7);
  }
  else
  {
    (*(void (**)(void, void))(*(void *)(v11 + 72) + 8))(*(void *)(v11 + 80), *(void *)(v11 + 64));
    sub_100024A74();
    sub_100029F70();
    swift_task_dealloc();
    uint64_t v4 = *(uint64_t (**)(void))(*(void *)(v11 + 16) + 8);
    return v4();
  }
}

uint64_t sub_100024770()
{
  uint64_t v4 = *v1;
  *(void *)(v4 + 16) = *v1;
  *(void *)(v4 + 128) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_1000074FC;
  }
  else
  {
    swift_release();
    sub_10000777C();
    uint64_t v2 = sub_100024900;
  }
  return _swift_task_switch(v2, 0);
}

uint64_t sub_100024900()
{
  *(void *)(v0 + 16) = v0;
  sub_100024A74();
  sub_100029F70();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(*(void *)(v0 + 16) + 8);
  return v1();
}

uint64_t sub_1000249D8@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_1000075B8(a1, a2);
}

unint64_t sub_1000249F0()
{
  uint64_t v2 = qword_100038CE8;
  if (!qword_100038CE8)
  {
    sub_100007684(&qword_100038CF0);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038CE8);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_100024A74()
{
  uint64_t v2 = qword_100038CF8;
  if (!qword_100038CF8)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038CF8);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_100024AF4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = v3;
  *(void *)(v3 + 16) = v3;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v6 + 24) = v4;
  *uint64_t v4 = *(void *)(v6 + 16);
  v4[1] = sub_1000068C4;
  return sub_1000241C0(a1, a2, a3);
}

unint64_t sub_100024BB8()
{
  return sub_100023AD4();
}

unint64_t sub_100024BD0()
{
  return sub_100023E6C();
}

unint64_t sub_100024BE8()
{
  return sub_100024C00();
}

unint64_t sub_100024C00()
{
  uint64_t v2 = qword_100038D08;
  if (!qword_100038D08)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038D08);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_100024C80()
{
  return sub_100024C98();
}

unint64_t sub_100024C98()
{
  uint64_t v2 = qword_100038D10;
  if (!qword_100038D10)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038D10);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_100024D18()
{
  return sub_100024D30();
}

unint64_t sub_100024D30()
{
  uint64_t v2 = qword_100038D18;
  if (!qword_100038D18)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038D18);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_100024DB0()
{
  return sub_100024DC8();
}

unint64_t sub_100024DC8()
{
  uint64_t v2 = qword_100038D20;
  if (!qword_100038D20)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038D20);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_100024E48()
{
  return sub_100024140();
}

unint64_t sub_100024E60()
{
  return sub_100024E78();
}

unint64_t sub_100024E78()
{
  uint64_t v2 = qword_100038D28;
  if (!qword_100038D28)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038D28);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_100024EF8()
{
  return sub_100024F10();
}

unint64_t sub_100024F10()
{
  uint64_t v2 = qword_100038D30;
  if (!qword_100038D30)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038D30);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_100024F90()
{
  return sub_100024FA8();
}

unint64_t sub_100024FA8()
{
  uint64_t v2 = qword_100038D38;
  if (!qword_100038D38)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038D38);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_100025028()
{
  return sub_100023BC4();
}

unint64_t sub_100025040()
{
  return sub_100025058();
}

unint64_t sub_100025058()
{
  uint64_t v2 = qword_100038D40;
  if (!qword_100038D40)
  {
    sub_100007684(&qword_100038D48);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038D40);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_1000250DC()
{
  return sub_1000250F4();
}

unint64_t sub_1000250F4()
{
  uint64_t v2 = qword_100038D50;
  if (!qword_100038D50)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038D50);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_100025174()
{
  return sub_10002518C();
}

unint64_t sub_10002518C()
{
  uint64_t v2 = qword_100038D58;
  if (!qword_100038D58)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038D58);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_10002520C()
{
  return sub_100023A04();
}

unint64_t sub_100025224()
{
  return sub_10002523C();
}

unint64_t sub_10002523C()
{
  uint64_t v2 = qword_100038D60;
  if (!qword_100038D60)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038D60);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_1000252BC()
{
  return sub_1000252D4();
}

unint64_t sub_1000252D4()
{
  uint64_t v2 = qword_100038D68;
  if (!qword_100038D68)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038D68);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_100025354()
{
  return sub_10002536C();
}

unint64_t sub_10002536C()
{
  uint64_t v2 = qword_100038D70;
  if (!qword_100038D70)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038D70);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_1000253EC()
{
  return sub_100025404();
}

unint64_t sub_100025404()
{
  uint64_t v2 = qword_100038D78;
  if (!qword_100038D78)
  {
    sub_100007684(&qword_100038D80);
    sub_100024FA8();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038D78);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_100025498()
{
  return sub_1000254B0();
}

unint64_t sub_1000254B0()
{
  uint64_t v2 = qword_100038D88;
  if (!qword_100038D88)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038D88);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_100025530()
{
  return sub_100024A74();
}

void *type metadata accessor for ShowContactPhotosPreferenceEntity()
{
  return &unk_100035180;
}

void *type metadata accessor for ShowContactPhotosEntityQuery()
{
  return &unk_1000351A8;
}

void *type metadata accessor for ShowContactPhotosEntityUpdateHandler()
{
  return &unk_1000351C8;
}

uint64_t sub_100025584(uint64_t a1, void *a2)
{
  v2[16] = a1;
  v2[14] = v2;
  v2[15] = 0;
  v2[15] = *a2;
  return _swift_task_switch(sub_1000255C8, 0);
}

uint64_t sub_1000255C8()
{
  *(void *)(v0 + 112) = v0;
  char v9 = (void *)*sub_100023214();
  id v1 = v9;
  if (v9)
  {
    sub_100023684();
    swift_bridgeObjectRetain();
    NSString v6 = sub_10002A460();
    swift_bridgeObjectRelease();
    id v7 = [v9 objectForKey:v6];

    if (v7)
    {
      sub_10002A4E0();
      sub_10000F050(v8 + 80, v8 + 48);
      swift_unknownObjectRelease();
    }
    else
    {
      *(void *)(v8 + 48) = 0;
      *(void *)(v8 + 56) = 0;
      *(void *)(v8 + 64) = 0;
      *(void *)(v8 + 72) = 0;
    }
    sub_10000EFEC((_OWORD *)(v8 + 48), (_OWORD *)(v8 + 16));
  }
  else
  {
    *(void *)(v8 + 16) = 0;
    *(void *)(v8 + 24) = 0;
    *(void *)(v8 + 32) = 0;
    *(void *)(v8 + 40) = 0;
  }
  if (*(void *)(v8 + 40))
  {
    if (swift_dynamicCast()) {
      char v4 = *(unsigned char *)(v8 + 136) & 1;
    }
    else {
      char v4 = 2;
    }
    char v5 = v4;
  }
  else
  {
    sub_10000EEFC(v8 + 16);
    char v5 = 2;
  }
  if (v5 == 2) {
    **(unsigned char **)(v8 + 128) = 0;
  }
  else {
    **(unsigned char **)(v8 + 128) = v5;
  }
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(v8 + 112) + 8);
  return v2();
}

uint64_t sub_1000258A4(void *a1, char *a2)
{
  *(void *)(v2 + 16) = v2;
  *(void *)(v2 + 24) = 0;
  *(unsigned char *)(v2 + 32) = 0;
  *(void *)(v2 + 24) = *a1;
  char v3 = *a2;
  *(unsigned char *)(v2 + 33) = *a2 & 1;
  *(unsigned char *)(v2 + 32) = v3 & 1;
  return _swift_task_switch(sub_100025904, 0);
}

uint64_t sub_100025904()
{
  *(void *)(v0 + 16) = v0;
  id v7 = (void *)*sub_100023214();
  id v1 = v7;
  if (v7)
  {
    char v4 = *(unsigned char *)(v6 + 33);
    sub_100023684();
    swift_bridgeObjectRetain();
    NSString v5 = sub_10002A460();
    swift_bridgeObjectRelease();
    [v7 setBool:v4 & 1 forKey:v5];
  }
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(v6 + 16) + 8);
  return v2();
}

uint64_t sub_100025A5C()
{
  uint64_t result = sub_10002A470("com.apple.Preferences", 0x15uLL, 1);
  qword_100039170 = result;
  qword_100039178 = v1;
  return result;
}

uint64_t *sub_100025AA0()
{
  if (qword_1000381E0 != -1) {
    swift_once();
  }
  return &qword_100039170;
}

uint64_t sub_100025B04()
{
  uint64_t v1 = *sub_100025AA0();
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_100025B40()
{
  if (qword_1000381E8 != -1) {
    swift_once();
  }
  return v1;
}

uint64_t sub_100025BA0()
{
  return sub_100025B40();
}

uint64_t sub_100025BB8()
{
  if (qword_1000381F0 != -1) {
    swift_once();
  }
  return v1;
}

uint64_t sub_100025C18()
{
  return sub_100025BB8();
}

id sub_100025C30()
{
  id result = objc_msgSend(self, "em_userDefaults");
  qword_100039180 = (uint64_t)result;
  return result;
}

uint64_t *sub_100025C6C()
{
  if (qword_1000381F8 != -1) {
    swift_once();
  }
  return &qword_100039180;
}

uint64_t sub_100025CD0()
{
  char v9 = "Title for entity representing the \"Undo Send Delay\" setting in Mail";
  uint64_t v0 = sub_100005894(&qword_100038220);
  unint64_t v2 = (*(void *)(*(void *)(v0 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v0);
  unint64_t v20 = (char *)&v2 - v2;
  uint64_t v11 = 0;
  unint64_t v3 = (*(void *)(*(void *)(sub_10002A380() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v11);
  uint64_t v13 = (uint64_t)&v2 - v3;
  unint64_t v4 = (*(void *)(*(void *)(sub_10002A3D0() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v11);
  uint64_t v12 = (char *)&v2 - v4;
  unint64_t v5 = (*(void *)(*(void *)(sub_10002A450() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v11);
  uint64_t v10 = (char *)&v2 - v5;
  uint64_t v17 = sub_10002A3A0();
  uint64_t v14 = *(void *)(v17 - 8);
  uint64_t v15 = v17 - 8;
  unint64_t v6 = (*(void *)(v14 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v11);
  uint64_t v19 = (char *)&v2 - v6;
  uint64_t v8 = sub_10002A350();
  id v7 = qword_100039188;
  sub_100005904(v8, qword_100039188);
  uint64_t v18 = sub_1000059AC(v8, (uint64_t)v7);
  unsigned int v16 = 1;
  sub_10002A470("Undo Send Delay", 0xFuLL, 1);
  sub_10002A400();
  sub_100005A10();
  sub_100005A28(v13);
  unint64_t v21 = v9;
  uint64_t v22 = 67;
  __int16 v23 = 2;
  sub_10002A3B0();
  (*(void (**)(char *, void, void, uint64_t))(v14 + 56))(v20, v16, v16, v17);
  return sub_10002A340();
}

uint64_t sub_100025FC4()
{
  if (qword_100038200 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_10002A350();
  return sub_1000059AC(v0, (uint64_t)qword_100039188);
}

uint64_t sub_100026034@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_100025FC4();
  uint64_t v1 = sub_10002A350();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v1 - 8) + 16))(a1, v3);
}

uint64_t sub_100026098()
{
  uint64_t result = sub_10002A470("UndoSendDelayTime", 0x11uLL, 1);
  qword_100038DA8 = result;
  qword_100038DB0 = v1;
  return result;
}

uint64_t *sub_1000260DC()
{
  if (qword_100038208 != -1) {
    swift_once();
  }
  return &qword_100038DA8;
}

uint64_t sub_100026140()
{
  unint64_t v6 = "Title for entity representing the \"Undo Send Delay\" setting in Mail";
  uint64_t v8 = 0;
  uint64_t v11 = &unk_100038F58;
  uint64_t v12 = &unk_100038F60;
  uint64_t v14 = &v19;
  uint64_t v19 = 0;
  unint64_t v2 = (*(void *)(*(void *)(sub_10002A380() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(0);
  uint64_t v10 = (uint64_t)&v2 - v2;
  unint64_t v3 = (*(void *)(*(void *)(sub_10002A3D0() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v8);
  char v9 = (char *)&v2 - v3;
  unint64_t v4 = (*(void *)(*(void *)(sub_10002A450() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v8);
  id v7 = (char *)&v2 - v4;
  uint64_t v0 = sub_10002A3A0();
  unint64_t v5 = (*(void *)(*(void *)(v0 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v0);
  uint64_t v13 = (char *)&v2 - v5;
  sub_100005894(&qword_100038F50);
  sub_10002A470("Undo Send Delay", 0xFuLL, 1);
  sub_10002A400();
  sub_100005A10();
  sub_100005A28(v10);
  unsigned int v16 = v6;
  uint64_t v17 = 67;
  __int16 v18 = 2;
  sub_10002A3B0();
  sub_100027430();
  uint64_t v15 = sub_10002A330();
  swift_retain();
  uint64_t v19 = v15;
  sub_10000777C();
  return v15;
}

uint64_t sub_1000263D4()
{
  return sub_100025C18();
}

uint64_t sub_1000263EC()
{
  return sub_100025B04();
}

uint64_t sub_100026404()
{
  return sub_100025BA0();
}

uint64_t sub_10002641C@<X0>(uint64_t *a1@<X8>)
{
  sub_10002645C();
  uint64_t result = sub_10002A050();
  *a1 = result;
  a1[1] = v2;
  return result;
}

unint64_t sub_10002645C()
{
  uint64_t v2 = qword_100038DB8;
  if (!qword_100038DB8)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038DB8);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_1000264DC@<X0>(uint64_t a1@<X8>)
{
  return sub_100026034(a1);
}

uint64_t sub_1000264F4()
{
  return sub_100029FB0();
}

unint64_t sub_10002652C()
{
  uint64_t v2 = qword_100038DC0;
  if (!qword_100038DC0)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038DC0);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_1000265AC()
{
  return sub_10002A040();
}

uint64_t sub_1000265E4()
{
  return sub_10002A360();
}

unint64_t sub_10002661C()
{
  uint64_t v2 = qword_100038DC8;
  if (!qword_100038DC8)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038DC8);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_10002669C()
{
  *(void *)(v0 + 16) = v0;
  return _swift_task_switch(sub_1000266C4, 0);
}

uint64_t sub_1000266C4()
{
  *(void *)(v0 + 16) = v0;
  uint64_t v1 = sub_100026140();
  uint64_t v2 = *(uint64_t (**)(uint64_t))(*(void *)(v0 + 16) + 8);
  return v2(v1);
}

uint64_t sub_100026750(uint64_t a1)
{
  uint64_t v4 = v1;
  *(void *)(v1 + 24) = a1;
  *(void *)(v1 + 16) = v1;
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v4 + 32) = v2;
  *uint64_t v2 = *(void *)(v4 + 16);
  v2[1] = sub_1000061C8;
  return sub_10002669C();
}

uint64_t sub_100026800(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = v2;
  *(void *)(v2 + 24) = a1;
  *(void *)(v2 + 16) = v2;
  unint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v6 + 32) = v3;
  unint64_t v4 = sub_1000268C4();
  *unint64_t v3 = *(void *)(v6 + 16);
  v3[1] = sub_1000061C8;
  return _UniqueEntityQuery.allEntities()(a2, v4);
}

unint64_t sub_1000268C4()
{
  uint64_t v2 = qword_100038DE8[0];
  if (!qword_100038DE8[0])
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, qword_100038DE8);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_100026944(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = v2;
  *(void *)(v2 + 16) = v2;
  unint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v6 + 24) = v3;
  unint64_t v4 = sub_1000268C4();
  *unint64_t v3 = *(void *)(v6 + 16);
  v3[1] = sub_10000659C;
  return _UniqueEntityQuery.entities(for:)(a1, a2, v4);
}

uint64_t sub_100026A0C(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = v2;
  *(void *)(v2 + 24) = a1;
  *(void *)(v2 + 16) = v2;
  unint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v6 + 32) = v3;
  unint64_t v4 = sub_1000268C4();
  *unint64_t v3 = *(void *)(v6 + 16);
  v3[1] = sub_1000061C8;
  return _UniqueEntityQuery.suggestedEntities()(a2, v4);
}

uint64_t sub_100026AD0(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = v2;
  *(void *)(v2 + 16) = v2;
  unint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v6 + 24) = v3;
  unint64_t v4 = sub_100026B98();
  *unint64_t v3 = *(void *)(v6 + 16);
  v3[1] = sub_1000068C4;
  return EntityQuery.results()(a1, a2, v4);
}

unint64_t sub_100026B98()
{
  uint64_t v2 = qword_100038E08;
  if (!qword_100038E08)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038E08);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_100026C18(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(v3 + 56) = a3;
  *(void *)(v3 + 48) = a1;
  *(void *)(v3 + 16) = v3;
  *(void *)(v3 + 24) = 0;
  *(void *)(v3 + 32) = 0;
  *(unsigned char *)(v3 + 136) = 0;
  uint64_t v4 = sub_100005894(&qword_100038E20);
  *(void *)(v3 + 64) = v4;
  *(void *)(v3 + 72) = *(void *)(v4 - 8);
  *(void *)(v3 + 80) = swift_task_alloc();
  *(void *)(v3 + 24) = a2;
  *(void *)(v3 + 32) = a3;
  return _swift_task_switch(sub_100026D34, 0);
}

uint64_t sub_100026D34()
{
  *(void *)(v0 + 16) = v0;
  uint64_t KeyPath = swift_getKeyPath();
  *(void *)(v0 + 88) = KeyPath;
  uint64_t v1 = (void *)swift_task_alloc();
  v4[12] = v1;
  uint64_t v6 = sub_100005894(&qword_100038E28);
  v4[13] = sub_100027430();
  *uint64_t v1 = v4[2];
  v1[1] = sub_100026E24;
  uint64_t v2 = v4[10];
  return _AppEntityUpdate.value<A>(of:)(v2, KeyPath, v6);
}

uint64_t sub_100026E24()
{
  *(void *)(*(void *)v0 + 16) = *(void *)v0;
  swift_task_dealloc();
  swift_release();
  return _swift_task_switch(sub_100026F5C, 0);
}

uint64_t sub_100026F5C()
{
  uint64_t v1 = v0[10];
  uint64_t v2 = v0[9];
  uint64_t v3 = v0[8];
  v0[2] = v0;
  if ((*(unsigned int (**)(uint64_t, uint64_t))(v2 + 88))(v1, v3) == enum case for _IntentValueState.set<A>(_:))
  {
    uint64_t v8 = *(char **)(v11 + 80);
    (*(void (**)(void))(*(void *)(v11 + 72) + 96))();
    char v9 = *v8;
    *(unsigned char *)(v11 + 136) = *v8;
    *(void *)(v11 + 40) = sub_100026140();
    *(unsigned char *)(v11 + 137) = v9;
    uint64_t KeyPath = swift_getKeyPath();
    *(void *)(v11 + 112) = KeyPath;
    uint64_t v6 = (void *)swift_task_alloc();
    *(void *)(v11 + 120) = v6;
    void *v6 = *(void *)(v11 + 16);
    v6[1] = sub_1000271B0;
    uint64_t v7 = *(void *)(v11 + 104);
    return AppEntity._setValue<A>(_:for:)(v11 + 137, KeyPath, v7);
  }
  else
  {
    (*(void (**)(void, void))(*(void *)(v11 + 72) + 8))(*(void *)(v11 + 80), *(void *)(v11 + 64));
    sub_1000274B4();
    sub_100029F70();
    swift_task_dealloc();
    uint64_t v4 = *(uint64_t (**)(void))(*(void *)(v11 + 16) + 8);
    return v4();
  }
}

uint64_t sub_1000271B0()
{
  uint64_t v4 = *v1;
  *(void *)(v4 + 16) = *v1;
  *(void *)(v4 + 128) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_1000074FC;
  }
  else
  {
    swift_release();
    sub_10000777C();
    uint64_t v2 = sub_100027340;
  }
  return _swift_task_switch(v2, 0);
}

uint64_t sub_100027340()
{
  *(void *)(v0 + 16) = v0;
  sub_1000274B4();
  sub_100029F70();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(*(void *)(v0 + 16) + 8);
  return v1();
}

uint64_t sub_100027418@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_1000075B8(a1, a2);
}

unint64_t sub_100027430()
{
  uint64_t v2 = qword_100038E30;
  if (!qword_100038E30)
  {
    sub_100007684(&qword_100038E38);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038E30);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_1000274B4()
{
  uint64_t v2 = qword_100038E40;
  if (!qword_100038E40)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038E40);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_100027534(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = v3;
  *(void *)(v3 + 16) = v3;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v6 + 24) = v4;
  *uint64_t v4 = *(void *)(v6 + 16);
  v4[1] = sub_1000068C4;
  return sub_100026C18(a1, a2, a3);
}

uint64_t sub_1000275F8()
{
  char v9 = "Title of options for undo send delay";
  uint64_t v0 = sub_100005894(&qword_100038220);
  unint64_t v2 = (*(void *)(*(void *)(v0 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v0);
  unint64_t v20 = (char *)&v2 - v2;
  uint64_t v11 = 0;
  unint64_t v3 = (*(void *)(*(void *)(sub_10002A380() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v11);
  uint64_t v13 = (uint64_t)&v2 - v3;
  unint64_t v4 = (*(void *)(*(void *)(sub_10002A3D0() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v11);
  uint64_t v12 = (char *)&v2 - v4;
  unint64_t v5 = (*(void *)(*(void *)(sub_10002A450() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v11);
  uint64_t v10 = (char *)&v2 - v5;
  uint64_t v17 = sub_10002A3A0();
  uint64_t v14 = *(void *)(v17 - 8);
  uint64_t v15 = v17 - 8;
  unint64_t v6 = (*(void *)(v14 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v11);
  uint64_t v19 = (char *)&v2 - v6;
  uint64_t v8 = sub_10002A350();
  uint64_t v7 = static UndoSendDelayOption.typeDisplayRepresentation;
  sub_100005904(v8, static UndoSendDelayOption.typeDisplayRepresentation);
  uint64_t v18 = sub_1000059AC(v8, (uint64_t)v7);
  unsigned int v16 = 1;
  sub_10002A470("Undo Send Delay Option", 0x16uLL, 1);
  sub_10002A400();
  sub_100005A10();
  sub_100005A28(v13);
  unint64_t v21 = v9;
  uint64_t v22 = 36;
  __int16 v23 = 2;
  sub_10002A3B0();
  (*(void (**)(char *, void, void, uint64_t))(v14 + 56))(v20, v16, v16, v17);
  return sub_10002A340();
}

uint64_t UndoSendDelayOption.typeDisplayRepresentation.unsafeMutableAddressor()
{
  if (qword_100038210 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_10002A350();
  return sub_1000059AC(v0, (uint64_t)static UndoSendDelayOption.typeDisplayRepresentation);
}

uint64_t static UndoSendDelayOption.typeDisplayRepresentation.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = UndoSendDelayOption.typeDisplayRepresentation.unsafeMutableAddressor();
  uint64_t v1 = sub_10002A350();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v1 - 8) + 16))(a1, v3);
}

uint64_t sub_1000279C0()
{
  uint64_t v17 = "Title of option to have undo send delay off";
  uint64_t v22 = "Title of option to undo send delay for 10 seconds";
  unint64_t v25 = "Title of option to undo send delay for 20 seconds";
  uint64_t v32 = "Title of option to undo send delay for 30 seconds";
  uint64_t v0 = sub_100005894(&qword_100038548);
  unint64_t v11 = (*(void *)(*(void *)(v0 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v0);
  uint64_t v50 = (char *)&v11 - v11;
  uint64_t v1 = sub_100005894(&qword_100038220);
  unint64_t v12 = (*(void *)(*(void *)(v1 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v1);
  Builtin::Word v49 = (char *)&v11 - v12;
  uint64_t v53 = 0;
  unint64_t v13 = (*(void *)(*(void *)(sub_10002A380() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v53);
  uint64_t v38 = (uint64_t)&v11 - v13;
  unint64_t v14 = (*(void *)(*(void *)(sub_10002A3D0() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v53);
  uint64_t v37 = (char *)&v11 - v14;
  unint64_t v15 = (*(void *)(*(void *)(sub_10002A450() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v53);
  uint64_t v36 = (char *)&v11 - v15;
  uint64_t v39 = sub_10002A3A0();
  uint64_t v18 = *(void *)(v39 - 8);
  uint64_t v19 = v39 - 8;
  unint64_t v16 = (*(void *)(v18 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v39);
  char v48 = (char *)&v11 - v16;
  uint64_t v52 = sub_100005894(&qword_100038E50);
  uint64_t v51 = sub_10002A510();
  uint64_t v30 = v2;
  uint64_t v20 = *(int *)(v52 + 48);
  *unint64_t v2 = 0;
  uint64_t v29 = 3;
  unsigned int v42 = 1;
  sub_10002A470("Off", 3uLL, 1);
  sub_10002A400();
  sub_100005A10();
  sub_100005A28(v38);
  unint64_t v68 = v17;
  uint64_t v69 = 43;
  int v34 = 2;
  __int16 v70 = 2;
  int v21 = 1;
  int v35 = 0;
  sub_10002A3B0();
  uint64_t v41 = *(void (**)(char *, void, void, uint64_t))(v18 + 56);
  uint64_t v40 = v18 + 56;
  v41(v49, v42, v42, v39);
  uint64_t v43 = sub_10002A240();
  uint64_t v3 = *(void *)(v43 - 8);
  uint64_t v45 = *(void (**)(char *, void))(v3 + 56);
  uint64_t v44 = v3 + 56;
  v45(v50, v42);
  sub_10002A260();
  char v4 = v42;
  uint64_t v28 = *(void *)(*(void *)(v52 - 8) + 72);
  uint64_t v24 = *(int *)(v52 + 48);
  __int16 v23 = &v30[v28];
  *__int16 v23 = v21;
  uint64_t v31 = 10;
  sub_10002A470("10 Seconds", 0xAuLL, v4 & 1);
  sub_10002A400();
  sub_100005A10();
  sub_100005A28(v38);
  uint64_t v64 = v22;
  uint64_t v33 = 49;
  uint64_t v65 = 49;
  char v66 = v34;
  char v67 = v35 & 1 & v42;
  sub_10002A3B0();
  v41(v49, v42, v42, v39);
  ((void (*)(char *, void, void, uint64_t))v45)(v50, v42, v42, v43);
  sub_10002A260();
  Builtin::Word v5 = v31;
  char v6 = v42;
  uint64_t v27 = *(int *)(v52 + 48);
  int v26 = &v30[2 * v28];
  unsigned char *v26 = v34;
  sub_10002A470("20 Seconds", v5, v6 & 1);
  sub_10002A400();
  sub_100005A10();
  sub_100005A28(v38);
  char v60 = v25;
  uint64_t v61 = v33;
  char v62 = v34;
  char v63 = v35 & 1 & v42;
  sub_10002A3B0();
  v41(v49, v42, v42, v39);
  ((void (*)(char *, void, void, uint64_t))v45)(v50, v42, v42, v43);
  sub_10002A260();
  Builtin::Word v7 = v31;
  char v8 = v42;
  uint64_t v47 = *(int *)(v52 + 48);
  int v46 = &v30[v29 * v28];
  *int v46 = 3;
  sub_10002A470("30 Seconds", v7, v8 & 1);
  sub_10002A400();
  sub_100005A10();
  sub_100005A28(v38);
  uint64_t v56 = v32;
  uint64_t v57 = v33;
  char v58 = v34;
  char v59 = v35 & 1 & v42;
  sub_10002A3B0();
  v41(v49, v42, v42, v39);
  ((void (*)(char *, void, void, uint64_t))v45)(v50, v42, v42, v43);
  sub_10002A260();
  uint64_t v9 = v51;
  sub_10000CF1C();
  uint64_t v55 = v9;
  uint64_t v54 = sub_10002A270();
  sub_1000282A8();
  uint64_t result = sub_10002A3F0();
  static UndoSendDelayOption.caseDisplayRepresentations = result;
  return result;
}

unint64_t sub_1000282A8()
{
  uint64_t v2 = qword_100038E58;
  if (!qword_100038E58)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038E58);
    return WitnessTable;
  }
  return v2;
}

uint64_t *UndoSendDelayOption.caseDisplayRepresentations.unsafeMutableAddressor()
{
  if (qword_100038218 != -1) {
    swift_once();
  }
  return &static UndoSendDelayOption.caseDisplayRepresentations;
}

uint64_t static UndoSendDelayOption.caseDisplayRepresentations.getter()
{
  uint64_t v1 = UndoSendDelayOption.caseDisplayRepresentations.unsafeMutableAddressor();
  swift_beginAccess();
  uint64_t v2 = *v1;
  swift_bridgeObjectRetain();
  swift_endAccess();
  return v2;
}

uint64_t static UndoSendDelayOption.caseDisplayRepresentations.setter(uint64_t a1)
{
  uint64_t v2 = UndoSendDelayOption.caseDisplayRepresentations.unsafeMutableAddressor();
  swift_bridgeObjectRetain();
  swift_beginAccess();
  *uint64_t v2 = a1;
  swift_bridgeObjectRelease();
  swift_endAccess();
  return swift_bridgeObjectRelease();
}

uint64_t (*static UndoSendDelayOption.caseDisplayRepresentations.modify())()
{
  return sub_100013E48;
}

MailSettingsIntentsExtension::UndoSendDelayOption_optional __swiftcall UndoSendDelayOption.init(rawValue:)(Swift::Int rawValue)
{
  switch(rawValue)
  {
    case 0:
      return 0;
    case 10:
      return (MailSettingsIntentsExtension::UndoSendDelayOption_optional)1;
    case 20:
      return (MailSettingsIntentsExtension::UndoSendDelayOption_optional)2;
    case 30:
      return (MailSettingsIntentsExtension::UndoSendDelayOption_optional)3;
  }
  return (MailSettingsIntentsExtension::UndoSendDelayOption_optional)4;
}

uint64_t static UndoSendDelayOption.allCases.getter()
{
  uint64_t result = sub_10002A510();
  *uint64_t v1 = 0;
  v1[1] = 1;
  v1[2] = 2;
  v1[3] = 3;
  sub_10000CF1C();
  return result;
}

uint64_t UndoSendDelayOption.rawValue.getter(char a1)
{
  switch(a1)
  {
    case 1:
      uint64_t v2 = 10;
      break;
    case 2:
      uint64_t v2 = 20;
      break;
    case 3:
      uint64_t v2 = 30;
      break;
    default:
      uint64_t v2 = 0;
      break;
  }
  return v2;
}

unint64_t sub_10002865C()
{
  return sub_10002652C();
}

unint64_t sub_100028674()
{
  return sub_1000268C4();
}

unint64_t sub_10002868C()
{
  return sub_1000286A4();
}

unint64_t sub_1000286A4()
{
  uint64_t v2 = qword_100038E60;
  if (!qword_100038E60)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038E60);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_100028724()
{
  return sub_10002873C();
}

unint64_t sub_10002873C()
{
  uint64_t v2 = qword_100038E68;
  if (!qword_100038E68)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038E68);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_1000287BC()
{
  return sub_1000287D4();
}

unint64_t sub_1000287D4()
{
  uint64_t v2 = qword_100038E70;
  if (!qword_100038E70)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038E70);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_100028854()
{
  return sub_10002886C();
}

unint64_t sub_10002886C()
{
  uint64_t v2 = qword_100038E78;
  if (!qword_100038E78)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038E78);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_1000288EC()
{
  return sub_100026B98();
}

unint64_t sub_100028904()
{
  return sub_10002891C();
}

unint64_t sub_10002891C()
{
  uint64_t v2 = qword_100038E80;
  if (!qword_100038E80)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038E80);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_10002899C()
{
  return sub_1000289B4();
}

unint64_t sub_1000289B4()
{
  uint64_t v2 = qword_100038E88;
  if (!qword_100038E88)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038E88);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_100028A34()
{
  return sub_100028A4C();
}

unint64_t sub_100028A4C()
{
  uint64_t v2 = qword_100038E90;
  if (!qword_100038E90)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038E90);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_100028ACC()
{
  return sub_10002661C();
}

unint64_t sub_100028AE4()
{
  return sub_100028AFC();
}

unint64_t sub_100028AFC()
{
  uint64_t v2 = qword_100038E98;
  if (!qword_100038E98)
  {
    sub_100007684(&qword_100038EA0);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038E98);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_100028B80()
{
  return sub_100028B98();
}

unint64_t sub_100028B98()
{
  uint64_t v2 = qword_100038EA8;
  if (!qword_100038EA8)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038EA8);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_100028C18()
{
  return sub_100028C30();
}

unint64_t sub_100028C30()
{
  uint64_t v2 = qword_100038EB0;
  if (!qword_100038EB0)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038EB0);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_100028CB0()
{
  return sub_10002645C();
}

unint64_t sub_100028CC8()
{
  return sub_100028CE0();
}

unint64_t sub_100028CE0()
{
  uint64_t v2 = qword_100038EB8;
  if (!qword_100038EB8)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038EB8);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_100028D60()
{
  return sub_100028D78();
}

unint64_t sub_100028D78()
{
  uint64_t v2 = qword_100038EC0;
  if (!qword_100038EC0)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038EC0);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_100028DF8()
{
  return sub_100028E10();
}

unint64_t sub_100028E10()
{
  uint64_t v2 = qword_100038EC8;
  if (!qword_100038EC8)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038EC8);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_100028E90()
{
  return sub_100028EA8();
}

unint64_t sub_100028EA8()
{
  uint64_t v2 = qword_100038ED0;
  if (!qword_100038ED0)
  {
    sub_100007684(&qword_100038ED8);
    sub_100028A4C();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038ED0);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_100028F3C()
{
  return sub_100028F54();
}

unint64_t sub_100028F54()
{
  uint64_t v2 = qword_100038EE0;
  if (!qword_100038EE0)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038EE0);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_100028FD4()
{
  return sub_1000274B4();
}

uint64_t sub_100028FEC()
{
  return sub_10002A520() & 1;
}

MailSettingsIntentsExtension::UndoSendDelayOption_optional sub_100029038@<W0>(Swift::Int *a1@<X0>, MailSettingsIntentsExtension::UndoSendDelayOption_optional *a2@<X8>)
{
  result.value = UndoSendDelayOption.init(rawValue:)(*a1).value;
  a2->value = result.value;
  return result;
}

uint64_t sub_100029068@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = UndoSendDelayOption.rawValue.getter(*v1);
  *a1 = result;
  return result;
}

unint64_t sub_100029098()
{
  return sub_1000290B0();
}

unint64_t sub_1000290B0()
{
  uint64_t v2 = qword_100038EE8;
  if (!qword_100038EE8)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038EE8);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_100029130()
{
  return sub_10002A480();
}

uint64_t sub_100029170()
{
  return sub_10002A4A0();
}

uint64_t sub_1000291B8()
{
  return sub_10002A490();
}

unint64_t sub_100029200()
{
  return sub_100029218();
}

unint64_t sub_100029218()
{
  uint64_t v2 = qword_100038EF0;
  if (!qword_100038EF0)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038EF0);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_100029298()
{
  return sub_1000292B0();
}

unint64_t sub_1000292B0()
{
  uint64_t v2 = qword_100038EF8;
  if (!qword_100038EF8)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038EF8);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_100029330()
{
  return sub_100029348();
}

unint64_t sub_100029348()
{
  uint64_t v2 = qword_100038F00;
  if (!qword_100038F00)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038F00);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_1000293C8()
{
  return sub_1000293E0();
}

unint64_t sub_1000293E0()
{
  uint64_t v2 = qword_100038F08;
  if (!qword_100038F08)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038F08);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_100029460()
{
  return sub_100029478();
}

unint64_t sub_100029478()
{
  uint64_t v2 = qword_100038F10;
  if (!qword_100038F10)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038F10);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_1000294F8()
{
  return sub_100029510();
}

unint64_t sub_100029510()
{
  uint64_t v2 = qword_100038F18;
  if (!qword_100038F18)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038F18);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_100029590()
{
  return sub_1000295A8();
}

unint64_t sub_1000295A8()
{
  uint64_t v2 = qword_100038F20;
  if (!qword_100038F20)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038F20);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_100029628@<X0>(uint64_t a1@<X8>)
{
  return static UndoSendDelayOption.typeDisplayRepresentation.getter(a1);
}

uint64_t sub_100029640()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_10002969C()
{
  uint64_t v2 = qword_100038F28;
  if (!qword_100038F28)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038F28);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_10002971C()
{
  return sub_100029FA0();
}

unint64_t sub_100029754()
{
  return sub_10002976C();
}

unint64_t sub_10002976C()
{
  uint64_t v2 = qword_100038F30;
  if (!qword_100038F30)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038F30);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_1000297EC()
{
  return sub_100029804();
}

unint64_t sub_100029804()
{
  uint64_t v2 = qword_100038F38;
  if (!qword_100038F38)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038F38);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_100029884()
{
  return sub_1000282A8();
}

uint64_t sub_10002989C()
{
  return static UndoSendDelayOption.caseDisplayRepresentations.getter();
}

uint64_t sub_1000298B4()
{
  return sub_10002A300();
}

unint64_t sub_1000298EC()
{
  return sub_100029904();
}

unint64_t sub_100029904()
{
  uint64_t v2 = qword_100038F40;
  if (!qword_100038F40)
  {
    sub_100007684(&qword_100038F48);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100038F40);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_100029988@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = static UndoSendDelayOption.allCases.getter();
  *a1 = result;
  return result;
}

void *type metadata accessor for UndoSendDelayPreferenceEntity()
{
  return &unk_1000351E8;
}

void *type metadata accessor for UndoSendDelayEntityQuery()
{
  return &unk_100035210;
}

void *type metadata accessor for UndoSendDelayEntityUpdateHandler()
{
  return &unk_100035230;
}

ValueMetadata *type metadata accessor for UndoSendDelayOption()
{
  return &type metadata for UndoSendDelayOption;
}

uint64_t sub_100029A04(uint64_t a1, void *a2)
{
  *(void *)(v2 + 144) = a1;
  *(void *)(v2 + 112) = v2;
  *(void *)(v2 + 120) = 0;
  *(void *)(v2 + 128) = 0;
  *(unsigned char *)(v2 + 152) = 0;
  *(void *)(v2 + 120) = *a2;
  return _swift_task_switch(sub_100029A48, 0);
}

uint64_t sub_100029A48()
{
  *(void *)(v0 + 112) = v0;
  unint64_t v13 = (void *)*sub_100025C6C();
  id v1 = v13;
  if (v13)
  {
    sub_1000260DC();
    swift_bridgeObjectRetain();
    NSString v10 = sub_10002A460();
    swift_bridgeObjectRelease();
    id v11 = [v13 objectForKey:v10];

    if (v11)
    {
      sub_10002A4E0();
      sub_10000F050(v12 + 80, v12 + 48);
      swift_unknownObjectRelease();
    }
    else
    {
      *(void *)(v12 + 48) = 0;
      *(void *)(v12 + 56) = 0;
      *(void *)(v12 + 64) = 0;
      *(void *)(v12 + 72) = 0;
    }
    sub_10000EFEC((_OWORD *)(v12 + 48), (_OWORD *)(v12 + 16));
  }
  else
  {
    *(void *)(v12 + 16) = 0;
    *(void *)(v12 + 24) = 0;
    *(void *)(v12 + 32) = 0;
    *(void *)(v12 + 40) = 0;
  }
  if (*(void *)(v12 + 40))
  {
    if (swift_dynamicCast())
    {
      Swift::Int v6 = *(void *)(v12 + 136);
      char v7 = 0;
    }
    else
    {
      Swift::Int v6 = 0;
      char v7 = 1;
    }
    Swift::Int v8 = v6;
    char v9 = v7;
  }
  else
  {
    sub_10000EEFC(v12 + 16);
    Swift::Int v8 = 0;
    char v9 = 1;
  }
  if ((v9 & 1) != 0
    || (*(void *)(v12 + 128) = v8,
        v2.value = UndoSendDelayOption.init(rawValue:)(v8).value,
        v2.value == MailSettingsIntentsExtension_UndoSendDelayOption_unknownDefault))
  {
    **(unsigned char **)(v12 + 144) = 1;
  }
  else
  {
    uint64_t v3 = *(MailSettingsIntentsExtension::UndoSendDelayOption_optional **)(v12 + 144);
    *(MailSettingsIntentsExtension::UndoSendDelayOption_optional *)(v12 + 152) = v2;
    v3->value = v2.value;
  }
  char v4 = *(uint64_t (**)(void))(*(void *)(v12 + 112) + 8);
  return v4();
}

uint64_t sub_100029DAC(void *a1, char *a2)
{
  *(void *)(v2 + 16) = v2;
  *(void *)(v2 + 24) = 0;
  *(unsigned char *)(v2 + 32) = 0;
  *(void *)(v2 + 24) = *a1;
  char v3 = *a2;
  *(unsigned char *)(v2 + 33) = *a2;
  *(unsigned char *)(v2 + 32) = v3;
  return _swift_task_switch(sub_100029DF8, 0);
}

uint64_t sub_100029DF8()
{
  *(void *)(v0 + 16) = v0;
  char v7 = (void *)*sub_100025C6C();
  id v1 = v7;
  if (v7)
  {
    uint64_t v4 = UndoSendDelayOption.rawValue.getter(*(unsigned char *)(v6 + 33));
    sub_1000260DC();
    swift_bridgeObjectRetain();
    NSString v5 = sub_10002A460();
    swift_bridgeObjectRelease();
    [v7 setInteger:v4 forKey:v5];
  }
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(v6 + 16) + 8);
  return v2();
}

uint64_t sub_100029F50()
{
  return static _AssistantIntentsProvider.uniqueEntities.getter();
}

uint64_t sub_100029F70()
{
  return static _AppEntityUpdateResult.success.getter();
}

uint64_t sub_100029F80()
{
  return static AppIntentInternal.sideEffect.getter();
}

uint64_t sub_100029F90()
{
  return static AppIntentInternal.shortcutsMetadata.getter();
}

uint64_t sub_100029FA0()
{
  return static AppEnum.defaultResolverSpecification.getter();
}

uint64_t sub_100029FB0()
{
  return static AppEntity.defaultResolverSpecification.getter();
}

uint64_t sub_100029FD0()
{
  return static AppIntent.description.getter();
}

uint64_t sub_100029FE0()
{
  return static AppIntent.parameterSummary.getter();
}

uint64_t sub_100029FF0()
{
  return static AppIntent.authenticationPolicy.getter();
}

uint64_t sub_10002A000()
{
  return static AppIntent.persistentIdentifier.getter();
}

uint64_t sub_10002A010()
{
  return AppIntentsExtension.configuration.getter();
}

uint64_t sub_10002A030()
{
  return type metadata accessor for IntentDialog();
}

uint64_t sub_10002A040()
{
  return _UniqueEntity.displayRepresentation.getter();
}

uint64_t sub_10002A050()
{
  return _UniqueEntity.id.getter();
}

uint64_t sub_10002A060()
{
  return IntentParameter.wrappedValue.modify();
}

uint64_t sub_10002A070()
{
  return IntentParameter.wrappedValue.getter();
}

uint64_t sub_10002A080()
{
  return IntentParameter.wrappedValue.setter();
}

uint64_t sub_10002A090()
{
  return IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:supportedValues:)();
}

uint64_t sub_10002A0A0()
{
  return static _AssistantIntent.NegativeAssistantIntentPhrasesBuilder.buildBlock(_:)();
}

uint64_t sub_10002A0B0()
{
  return static _AssistantIntent.NegativeAssistantIntentPhrasesBuilder.buildExpression(_:)();
}

uint64_t sub_10002A0C0()
{
  return _AssistantIntent.NegativeAssistantIntentPhrases.init<A>(for:phrases:)();
}

uint64_t sub_10002A0D0()
{
  return type metadata accessor for _AssistantIntent.NegativeAssistantIntentPhrases();
}

uint64_t sub_10002A0E0()
{
  return _AssistantIntent.IntentProjection.subscript.getter();
}

uint64_t sub_10002A0F0()
{
  return static _AssistantIntent.PhraseBuilder.buildBlock(_:)();
}

uint64_t sub_10002A100()
{
  return static _AssistantIntent.PhraseBuilder.buildExpression(_:)();
}

uint64_t sub_10002A110()
{
  return static _AssistantIntent.StringValueBuilder.buildBlock(_:)();
}

uint64_t sub_10002A120()
{
  return static _AssistantIntent.StringValueBuilder.buildExpression(_:)();
}

uint64_t sub_10002A130()
{
  return static _AssistantIntent.ParameterValueBuilder.buildBlock(_:)();
}

uint64_t sub_10002A140()
{
  return static _AssistantIntent.ParameterValueBuilder.buildExpression(_:)();
}

uint64_t sub_10002A150()
{
  return _AssistantIntent.Value.init<A>(for:builder:)();
}

uint64_t sub_10002A160()
{
  return type metadata accessor for _AssistantIntent.Value();
}

uint64_t sub_10002A170()
{
  return _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)();
}

void sub_10002A180(Swift::String a1)
{
}

uint64_t sub_10002A190()
{
  return _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)();
}

uint64_t sub_10002A1A0()
{
  return _AssistantIntent.Phrase.init(stringInterpolation:)();
}

uint64_t sub_10002A1B0()
{
  return static _AssistantIntent.Builder.buildBlock(_:)();
}

uint64_t sub_10002A1C0()
{
  return static _AssistantIntent.Builder.buildExpression(_:)();
}

uint64_t sub_10002A1D0()
{
  return type metadata accessor for _AssistantIntent();
}

uint64_t sub_10002A1E0()
{
  return _AssistantIntent.init<A>(_:phrases:parameterValues:)();
}

uint64_t sub_10002A220()
{
  return URLRepresentableEnum.urlRepresentationParameter.getter();
}

uint64_t sub_10002A230()
{
  return DisplayRepresentation.Image.init(appBundleIdentifier:)();
}

uint64_t sub_10002A240()
{
  return type metadata accessor for DisplayRepresentation.Image();
}

uint64_t sub_10002A250()
{
  return DisplayRepresentation.init(title:subtitle:image:synonyms:descriptionText:)();
}

uint64_t sub_10002A260()
{
  return DisplayRepresentation.init(title:subtitle:image:)();
}

uint64_t sub_10002A270()
{
  return type metadata accessor for DisplayRepresentation();
}

uint64_t sub_10002A280()
{
  return EnumURLRepresentation.EnumSingleURLRepresentation.init(stringLiteral:)();
}

uint64_t sub_10002A290()
{
  return EnumURLRepresentation.init(_:)();
}

uint64_t sub_10002A2A0()
{
  return static EnumerableEntityQuery.findIntentDescription.getter();
}

uint64_t sub_10002A2C0()
{
  return static DynamicOptionsProvider.useForParameterResolution.getter();
}

uint64_t sub_10002A2D0()
{
  return static URLRepresentableIntent<>.urlRepresentation.getter();
}

uint64_t sub_10002A2F0()
{
  return type metadata accessor for InputConnectionBehavior();
}

uint64_t sub_10002A300()
{
  return CaseDisplayRepresentable.localizedStringResource.getter();
}

uint64_t sub_10002A310()
{
  return static PersistentlyIdentifiable.persistentIdentifier.getter();
}

uint64_t sub_10002A320()
{
  return _UpdatableEntityProperty.projectedValue.getter();
}

uint64_t sub_10002A330()
{
  return _UpdatableEntityProperty<>.init(title:_get:_set:)();
}

uint64_t sub_10002A340()
{
  return TypeDisplayRepresentation.init(name:numericFormat:)();
}

uint64_t sub_10002A350()
{
  return type metadata accessor for TypeDisplayRepresentation();
}

uint64_t sub_10002A360()
{
  return InstanceDisplayRepresentable.localizedStringResource.getter();
}

uint64_t sub_10002A370()
{
  return LocalizedStringResource.init(stringLiteral:)();
}

uint64_t sub_10002A380()
{
  return type metadata accessor for LocalizedStringResource.BundleDescription();
}

uint64_t sub_10002A390()
{
  return LocalizedStringResource.init(stringInterpolation:)();
}

uint64_t sub_10002A3A0()
{
  return type metadata accessor for LocalizedStringResource();
}

uint64_t sub_10002A3B0()
{
  return LocalizedStringResource.init(_:table:locale:bundle:comment:)();
}

uint64_t sub_10002A3C0()
{
  return static Locale.current.getter();
}

uint64_t sub_10002A3D0()
{
  return type metadata accessor for Locale();
}

uint64_t sub_10002A3E0()
{
  return static AppExtension.main()();
}

uint64_t sub_10002A3F0()
{
  return Dictionary.init(dictionaryLiteral:)();
}

uint64_t sub_10002A400()
{
  return String.LocalizationValue.init(stringLiteral:)();
}

uint64_t sub_10002A410()
{
  return String.LocalizationValue.StringInterpolation.appendInterpolation<A>(_:specifier:)();
}

void sub_10002A420(Swift::String a1)
{
}

uint64_t sub_10002A430()
{
  return String.LocalizationValue.StringInterpolation.init(literalCapacity:interpolationCount:)();
}

uint64_t sub_10002A440()
{
  return type metadata accessor for String.LocalizationValue.StringInterpolation();
}

uint64_t sub_10002A450()
{
  return type metadata accessor for String.LocalizationValue();
}

NSString sub_10002A460()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_10002A470(Builtin::RawPointer _builtinStringLiteral, Builtin::Word utf8CodeUnitCount, Builtin::Int1 isASCII)
{
  return String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)(_builtinStringLiteral, utf8CodeUnitCount, isASCII)._countAndFlagsBits;
}

uint64_t sub_10002A480()
{
  return RawRepresentable<>.hashValue.getter();
}

uint64_t sub_10002A490()
{
  return RawRepresentable<>._rawHashValue(seed:)();
}

uint64_t sub_10002A4A0()
{
  return RawRepresentable<>.hash(into:)();
}

uint64_t sub_10002A4B0()
{
  return static Array._allocateBufferUninitialized(minimumCapacity:)();
}

uint64_t sub_10002A4C0()
{
  return type metadata accessor for Array();
}

uint64_t sub_10002A4D0()
{
  return Array.init<A>(_:)();
}

uint64_t sub_10002A4E0()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t sub_10002A4F0()
{
  return dispatch thunk of static CaseIterable.allCases.getter();
}

Swift::Int sub_10002A500(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases, string);
}

uint64_t sub_10002A510()
{
  return _allocateUninitializedArray<A>(_:)();
}

uint64_t sub_10002A520()
{
  return == infix<A>(_:_:)();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

void free(void *a1)
{
}

void *__cdecl malloc(size_t __size)
{
  return _malloc(__size);
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

uint64_t swift_checkMetadataState()
{
  return _swift_checkMetadataState();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_dynamicCastMetatype()
{
  return _swift_dynamicCastMetatype();
}

uint64_t swift_endAccess()
{
  return _swift_endAccess();
}

uint64_t swift_errorInMain()
{
  return _swift_errorInMain();
}

uint64_t swift_getAssociatedConformanceWitness()
{
  return _swift_getAssociatedConformanceWitness();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return _swift_getAssociatedTypeWitness();
}

uint64_t swift_getKeyPath()
{
  return _swift_getKeyPath();
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

uint64_t swift_task_alloc()
{
  return _swift_task_alloc();
}

uint64_t swift_task_dealloc()
{
  return _swift_task_dealloc();
}

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}