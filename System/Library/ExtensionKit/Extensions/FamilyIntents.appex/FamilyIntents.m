unint64_t sub_100003A98()
{
  unint64_t result;

  result = qword_100018098[0];
  if (!qword_100018098[0])
  {
    result = swift_getWitnessTable();
    atomic_store(result, qword_100018098);
  }
  return result;
}

uint64_t sub_100003AEC(void *a1)
{
  sub_10000616C(&qword_100018190);
  __chkstk_darwin();
  v3 = (char *)&v15 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000616C(&qword_100018188);
  __chkstk_darwin();
  v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10000F7A0();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin();
  sub_10000F820();
  __chkstk_darwin();
  sub_10000F810();
  v16._countAndFlagsBits = 0;
  v16._object = (void *)0xE000000000000000;
  sub_10000F800(v16);
  id v8 = [a1 fullName];
  if (v8)
  {
    v9 = v8;
    uint64_t v10 = sub_10000F830();
    v12 = v11;
  }
  else
  {
    v12 = (void *)0xE100000000000000;
    uint64_t v10 = 45;
  }
  v17._countAndFlagsBits = v10;
  v17._object = v12;
  sub_10000F7F0(v17);
  swift_bridgeObjectRelease();
  v18._countAndFlagsBits = 0;
  v18._object = (void *)0xE000000000000000;
  sub_10000F800(v18);
  sub_10000F790();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v7 + 56))(v5, 1, 1, v6);
  uint64_t v13 = sub_10000F670();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v3, 1, 1, v13);
  return sub_10000F680();
}

void sub_100003D78()
{
  qword_100018628 = (uint64_t)&type metadata for FamilyQuery;
  unk_100018630 = &off_100014CA0;
  qword_100018638 = 0;
}

uint64_t sub_100003D9C()
{
  uint64_t v0 = sub_10000616C(&qword_100018178);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin();
  v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000616C(&qword_100018180);
  __chkstk_darwin();
  sub_100004E40();
  sub_10000F720();
  v6._object = (void *)0x800000010000FC80;
  v6._countAndFlagsBits = 0xD000000000000044;
  sub_10000F710(v6);
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, enum case for _EntityURLRepresentation.StringInterpolation.Token.id<A>(_:), v0);
  sub_10000F700();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  v7._countAndFlagsBits = 0;
  v7._object = (void *)0xE000000000000000;
  sub_10000F710(v7);
  return sub_10000F730();
}

uint64_t sub_100003F58@<X0>(uint64_t a1@<X8>)
{
  if (qword_100018038 != -1) {
    swift_once();
  }

  return sub_1000060FC((uint64_t)&unk_100018610, a1);
}

uint64_t sub_100003FC4()
{
  sub_100005E90();
  uint64_t v2 = sub_10000F6C0();
  v3 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
  return sub_1000061B0(v3, v0, v2, v1);
}

void sub_100004058(uint64_t *a1@<X8>)
{
  id v3 = *v1;
  id v4 = [v3 altDSID];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = sub_10000F830();
    unint64_t v8 = v7;
  }
  else
  {

    unint64_t v8 = 0xE700000000000000;
    uint64_t v6 = 0x6E776F6E6B6E75;
  }
  *a1 = v6;
  a1[1] = v8;
}

uint64_t sub_1000040E8()
{
  sub_10000616C(&qword_100018188);
  __chkstk_darwin();
  uint64_t v1 = (char *)&v5 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = sub_10000F7A0();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  sub_10000F780();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v3 + 56))(v1, 1, 1, v2);
  return sub_10000F750();
}

uint64_t sub_10000422C(uint64_t a1)
{
  unint64_t v2 = sub_100004E40();

  return static AppEntity.defaultResolverSpecification.getter(a1, v2);
}

uint64_t sub_100004278()
{
  return sub_100003AEC(*v0);
}

uint64_t sub_100004280(uint64_t a1)
{
  unint64_t v2 = sub_100005D64();

  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

uint64_t sub_1000042CC()
{
  uint64_t v3 = (uint64_t (__cdecl *)())((char *)&dword_1000181C0 + dword_1000181C0);
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_10000436C;
  return v3();
}

uint64_t sub_10000436C(uint64_t a1)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 24) = a1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v4 = *(uint64_t (**)(void))(v3 + 8);
    return v4();
  }
  else
  {
    return _swift_task_switch(sub_1000044A0, 0, 0);
  }
}

uint64_t sub_1000044A0()
{
  id v1 = [*(id *)(v0 + 24) members];
  sub_1000062D0();
  unint64_t v2 = sub_10000F850();

  if (v2 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_10000F8D0();
    swift_bridgeObjectRelease();
    if (!v3) {
      goto LABEL_11;
    }
  }
  else
  {
    uint64_t v3 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v3) {
      goto LABEL_11;
    }
  }
  uint64_t result = sub_10000F8A0();
  if (v3 < 0)
  {
    __break(1u);
    return result;
  }
  uint64_t v5 = 0;
  do
  {
    if ((v2 & 0xC000000000000001) != 0) {
      sub_10000F870();
    }
    else {
      id v6 = *(id *)(v2 + 8 * v5 + 32);
    }
    ++v5;
    sub_10000F880();
    sub_10000F8B0();
    sub_10000F8C0();
    sub_10000F890();
  }
  while (v3 != v5);
LABEL_11:

  swift_bridgeObjectRelease();
  unint64_t v7 = *(uint64_t (**)(void *))(v0 + 8);
  return v7(&_swiftEmptyArrayStorage);
}

BOOL sub_100004650(Swift::UInt a1, uint64_t a2)
{
  if (!*(void *)(a2 + 16)) {
    return 0;
  }
  sub_10000F900();
  sub_10000F910(a1);
  Swift::Int v4 = sub_10000F920();
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = v4 & ~v5;
  uint64_t v7 = a2 + 56;
  if (((*(void *)(a2 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
    return 0;
  }
  uint64_t v8 = *(void *)(a2 + 48);
  if (*(void *)(v8 + 8 * v6) == a1) {
    return 1;
  }
  uint64_t v10 = ~v5;
  unint64_t v11 = (v6 + 1) & v10;
  if (((*(void *)(v7 + ((v11 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v11) & 1) == 0) {
    return 0;
  }
  do
  {
    uint64_t v12 = *(void *)(v8 + 8 * v11);
    BOOL result = v12 == a1;
    if (v12 == a1) {
      break;
    }
    unint64_t v11 = (v11 + 1) & v10;
  }
  while (((*(void *)(v7 + ((v11 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v11) & 1) != 0);
  return result;
}

void sub_100004740(uint64_t (*a1)(id *), uint64_t a2, uint64_t a3)
{
  v10[2] = &_swiftEmptyArrayStorage;
  uint64_t v5 = *(void *)(a3 + 16);
  if (v5)
  {
    unint64_t v7 = 0;
    while (v7 < *(void *)(a3 + 16))
    {
      v10[0] = *(id *)(a3 + 8 * v7 + 32);
      id v8 = v10[0];
      char v9 = a1(v10);
      if (v3)
      {
        swift_bridgeObjectRelease();

        swift_release();
        return;
      }
      if (v9)
      {
        sub_10000F880();
        sub_10000F8B0();
        sub_10000F8C0();
        sub_10000F890();
      }
      else
      {
      }
      if (v5 == ++v7) {
        goto LABEL_10;
      }
    }
    __break(1u);
  }
  else
  {
LABEL_10:
    swift_bridgeObjectRelease();
  }
}

uint64_t sub_100004868(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  unint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 24) = v2;
  *unint64_t v2 = v1;
  v2[1] = sub_100004950;
  uint64_t v5 = (uint64_t (__cdecl *)())((char *)&dword_1000181C0 + dword_1000181C0);
  uint64_t v3 = (void *)swift_task_alloc();
  v2[2] = v3;
  void *v3 = v2;
  v3[1] = sub_10000436C;
  return v5();
}

uint64_t sub_100004950(uint64_t a1)
{
  uint64_t v4 = *v2;
  uint64_t v5 = *v2;
  swift_task_dealloc();
  if (!v1) {
    **(void **)(v4 + 16) = a1;
  }
  uint64_t v6 = *(uint64_t (**)(void))(v5 + 8);
  return v6();
}

uint64_t sub_100004A64(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[4] = a3;
  v4[5] = v3;
  v4[2] = a1;
  v4[3] = a2;
  uint64_t v5 = (void *)swift_task_alloc();
  v4[6] = v5;
  void *v5 = v4;
  v5[1] = sub_100004B50;
  uint64_t v8 = (uint64_t (__cdecl *)())((char *)&dword_1000181C0 + dword_1000181C0);
  uint64_t v6 = (void *)swift_task_alloc();
  v5[2] = v6;
  *uint64_t v6 = v5;
  v6[1] = sub_10000436C;
  return v8();
}

uint64_t sub_100004B50(uint64_t a1)
{
  uint64_t v4 = *v2;
  uint64_t v5 = *v2;
  *(void *)(*v2 + 56) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v6 = *(uint64_t (**)(void))(v5 + 8);
    return v6();
  }
  else
  {
    *(void *)(v4 + 64) = a1;
    return _swift_task_switch(sub_100004CA0, 0, 0);
  }
}

uint64_t sub_100004CA0()
{
  uint64_t v1 = v0[8];
  uint64_t v2 = v0[5];
  uint64_t v3 = (void *)v0[2];
  uint64_t v4 = swift_task_alloc();
  *(void *)(v4 + 16) = v2;
  sub_100004740((uint64_t (*)(id *))sub_1000061CC, v4, v1);
  uint64_t v6 = v5;
  swift_task_dealloc();
  swift_bridgeObjectRetain();
  unint64_t v7 = sub_100006310(v6);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  void *v3 = v7;
  uint64_t v8 = (uint64_t (*)(void))v0[1];
  return v8();
}

unint64_t sub_100004D90()
{
  unint64_t result = qword_1000180B0;
  if (!qword_1000180B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000180B0);
  }
  return result;
}

unint64_t sub_100004DE8()
{
  unint64_t result = qword_1000180B8;
  if (!qword_1000180B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000180B8);
  }
  return result;
}

unint64_t sub_100004E40()
{
  unint64_t result = qword_1000180C0[0];
  if (!qword_1000180C0[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_1000180C0);
  }
  return result;
}

void sub_100004E94(void *a1@<X8>)
{
  a1[3] = &type metadata for FamilyQuery;
  a1[4] = &off_100014CA0;
  a1[5] = 0;
}

uint64_t sub_100004EB0(uint64_t a1)
{
  v2[2] = a1;
  v2[3] = v1;
  uint64_t v3 = (void *)swift_task_alloc();
  v2[4] = v3;
  void *v3 = v2;
  v3[1] = sub_100004F98;
  uint64_t v6 = (uint64_t (__cdecl *)())((char *)&dword_1000181C0 + dword_1000181C0);
  uint64_t v4 = (void *)swift_task_alloc();
  v3[2] = v4;
  *uint64_t v4 = v3;
  v4[1] = sub_10000436C;
  return v6();
}

uint64_t sub_100004F98(uint64_t a1)
{
  uint64_t v4 = *v2;
  uint64_t v5 = *v2;
  *(void *)(*v2 + 40) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v6 = *(uint64_t (**)(void))(v5 + 8);
    return v6();
  }
  else
  {
    *(void *)(v4 + 48) = a1;
    return _swift_task_switch(sub_1000050E8, 0, 0);
  }
}

uint64_t sub_1000050E8()
{
  uint64_t v1 = v0[6];
  uint64_t v2 = (void *)v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = swift_task_alloc();
  *(void *)(v4 + 16) = v3;
  sub_100004740((uint64_t (*)(id *))sub_1000061CC, v4, v1);
  uint64_t v6 = v5;
  swift_task_dealloc();
  swift_bridgeObjectRetain();
  uint64_t v7 = sub_100006448(v6, v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v8 = (uint64_t (*)(uint64_t))v0[1];
  return v8(v7);
}

uint64_t sub_1000051C4(uint64_t a1)
{
  v2[2] = a1;
  v2[3] = v1;
  uint64_t v3 = (void *)swift_task_alloc();
  v2[4] = v3;
  void *v3 = v2;
  v3[1] = sub_1000052AC;
  uint64_t v6 = (uint64_t (__cdecl *)())((char *)&dword_1000181C0 + dword_1000181C0);
  uint64_t v4 = (void *)swift_task_alloc();
  v3[2] = v4;
  *uint64_t v4 = v3;
  v4[1] = sub_10000436C;
  return v6();
}

uint64_t sub_1000052AC(uint64_t a1)
{
  uint64_t v4 = *v2;
  uint64_t v5 = *v2;
  *(void *)(*v2 + 40) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v6 = *(uint64_t (**)(void))(v5 + 8);
    return v6();
  }
  else
  {
    *(void *)(v4 + 48) = a1;
    return _swift_task_switch(sub_1000053FC, 0, 0);
  }
}

uint64_t sub_1000053FC()
{
  uint64_t v1 = v0[6];
  uint64_t v3 = (void *)v0[2];
  uint64_t v2 = v0[3];
  uint64_t v4 = swift_task_alloc();
  *(void *)(v4 + 16) = v2;
  sub_100004740((uint64_t (*)(id *))sub_1000061CC, v4, v1);
  uint64_t v6 = v5;
  swift_task_dealloc();
  void *v3 = v6;
  uint64_t v7 = (uint64_t (*)(void))v0[1];
  return v7();
}

unint64_t sub_1000054B4()
{
  unint64_t result = qword_1000180D8;
  if (!qword_1000180D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000180D8);
  }
  return result;
}

unint64_t sub_10000550C()
{
  unint64_t result = qword_1000180E0;
  if (!qword_1000180E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000180E0);
  }
  return result;
}

unint64_t sub_100005564()
{
  unint64_t result = qword_1000180E8;
  if (!qword_1000180E8)
  {
    sub_1000055D8(qword_1000180F0);
    sub_10000550C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000180E8);
  }
  return result;
}

uint64_t sub_1000055D8(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100005620(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_100003A98();
  void *v5 = v2;
  v5[1] = sub_1000056D4;
  return EntityQuery.results()(a1, a2, v6);
}

uint64_t sub_1000056D4()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_1000057C8(void *a1)
{
  *a1 = 0;
  return sub_1000061C4(*(uint64_t (**)(void))(v1 + 8));
}

ValueMetadata *type metadata accessor for FamilyMemberDetailsDeepLink()
{
  return &type metadata for FamilyMemberDetailsDeepLink;
}

uint64_t initializeBufferWithCopyOfBuffer for FamilyMemberDetailsDeepLinkQuery(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for FamilyMemberDetailsDeepLinkQuery(uint64_t a1)
{
  _s13FamilyIntents27FamilySettingsDeepLinkQueryVwxx_0(a1);

  return swift_bridgeObjectRelease();
}

uint64_t _s13FamilyIntents27FamilySettingsDeepLinkQueryVwxx_0(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t initializeWithCopy for FamilyMemberDetailsDeepLinkQuery(uint64_t a1, uint64_t a2)
{
  long long v4 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v4;
  (**(void (***)(void))(v4 - 8))();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t *assignWithCopy for FamilyMemberDetailsDeepLinkQuery(uint64_t *a1, uint64_t *a2)
{
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t *sub_100005984(uint64_t *result, uint64_t *a2)
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
        uint64_t result = (uint64_t *)swift_release();
        uint64_t *v3 = v12;
      }
      else
      {
        unint64_t v11 = *(uint64_t (**)(void))(v10 + 24);
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
          *uint64_t result = *a2;
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
          uint64_t *v3 = *a2;
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

__n128 initializeWithTake for FamilyMemberDetailsDeepLinkQuery(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for FamilyMemberDetailsDeepLinkQuery(uint64_t a1, uint64_t a2)
{
  _s13FamilyIntents27FamilySettingsDeepLinkQueryVwxx_0(a1);
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  uint64_t v5 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v5;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for FamilyMemberDetailsDeepLinkQuery(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 48)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for FamilyMemberDetailsDeepLinkQuery(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 48) = 1;
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
    *(unsigned char *)(result + 48) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for FamilyMemberDetailsDeepLinkQuery()
{
  return &type metadata for FamilyMemberDetailsDeepLinkQuery;
}

unint64_t sub_100005CB4()
{
  unint64_t result = qword_100018108;
  if (!qword_100018108)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018108);
  }
  return result;
}

unint64_t sub_100005D0C()
{
  unint64_t result = qword_100018110;
  if (!qword_100018110)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018110);
  }
  return result;
}

unint64_t sub_100005D64()
{
  unint64_t result = qword_100018118;
  if (!qword_100018118)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018118);
  }
  return result;
}

unint64_t sub_100005DBC()
{
  unint64_t result = qword_100018120;
  if (!qword_100018120)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018120);
  }
  return result;
}

unint64_t sub_100005E14()
{
  unint64_t result = qword_100018130;
  if (!qword_100018130)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018130);
  }
  return result;
}

unint64_t sub_100005E68(uint64_t a1)
{
  unint64_t result = sub_100005E90();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_100005E90()
{
  unint64_t result = qword_100018138;
  if (!qword_100018138)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018138);
  }
  return result;
}

unint64_t sub_100005EE8()
{
  unint64_t result = qword_100018140;
  if (!qword_100018140)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018140);
  }
  return result;
}

unint64_t sub_100005F40()
{
  unint64_t result = qword_100018148;
  if (!qword_100018148)
  {
    sub_1000055D8(&qword_100018150);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018148);
  }
  return result;
}

unint64_t sub_100005FA0()
{
  unint64_t result = qword_100018158;
  if (!qword_100018158)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018158);
  }
  return result;
}

unint64_t sub_100005FF8()
{
  unint64_t result = qword_100018160;
  if (!qword_100018160)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018160);
  }
  return result;
}

unint64_t sub_100006050()
{
  unint64_t result = qword_100018168;
  if (!qword_100018168)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018168);
  }
  return result;
}

unint64_t sub_1000060A8()
{
  unint64_t result = qword_100018170;
  if (!qword_100018170)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018170);
  }
  return result;
}

uint64_t sub_1000060FC(uint64_t a1, uint64_t a2)
{
  long long v4 = *(_OWORD *)(a1 + 24);
  *(_OWORD *)(a2 + 24) = v4;
  (**(void (***)(uint64_t, uint64_t))(v4 - 8))(a2, a1);
  *(void *)(a2 + 40) = *(void *)(a1 + 40);
  swift_bridgeObjectRetain();
  return a2;
}

uint64_t sub_10000616C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_1000061B0(uint64_t (*a1)(uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return a1(a3, a4);
}

uint64_t sub_1000061C4(uint64_t (*a1)(void))
{
  return a1();
}

BOOL sub_1000061CC(id *a1)
{
  return sub_10000660C(a1);
}

Swift::Int sub_1000061E8()
{
  Swift::UInt v1 = *v0;
  sub_10000F900();
  sub_10000F910(v1);
  return sub_10000F920();
}

void sub_100006230()
{
  sub_10000F910(*v0);
}

Swift::Int sub_10000625C()
{
  Swift::UInt v1 = *v0;
  sub_10000F900();
  sub_10000F910(v1);
  return sub_10000F920();
}

BOOL sub_1000062A0(void *a1, void *a2)
{
  return *a1 == *a2;
}

void *sub_1000062B4@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void sub_1000062C4(void *a1@<X8>)
{
  *a1 = *v1;
}

unint64_t sub_1000062D0()
{
  unint64_t result = qword_1000181A0;
  if (!qword_1000181A0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1000181A0);
  }
  return result;
}

void *sub_100006310(uint64_t a1)
{
  unint64_t result = &_swiftEmptyArrayStorage;
  uint64_t v3 = *(void *)(a1 + 16);
  if (v3)
  {
    long long v4 = (id *)(a1 + 32);
    do
    {
      id v5 = *v4;
      id v6 = [v5 fullName];
      if (v6
        && (uint64_t v7 = v6,
            sub_10000F830(),
            v7,
            sub_100006660(),
            LOBYTE(v7) = sub_10000F860(),
            swift_bridgeObjectRelease(),
            (v7 & 1) != 0))
      {
        sub_10000F880();
        sub_10000F8B0();
        sub_10000F8C0();
        sub_10000F890();
      }
      else
      {
      }
      ++v4;
      --v3;
    }
    while (v3);
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

uint64_t sub_100006448(uint64_t a1, void *a2)
{
  uint64_t result = (uint64_t)&_swiftEmptyArrayStorage;
  uint64_t v20 = *(void *)(a1 + 16);
  if (!v20) {
    return result;
  }
  uint64_t v5 = 0;
  uint64_t v19 = a1 + 32;
  Swift::String v18 = a2 + 7;
  while (1)
  {
    id v6 = *(id *)(v19 + 8 * v5);
    id v7 = [v6 altDSID];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = sub_10000F830();
      unint64_t v11 = v10;

      uint64_t v12 = a2[2];
      if (!v12) {
        goto LABEL_23;
      }
    }
    else
    {

      unint64_t v11 = 0xE700000000000000;
      uint64_t v9 = 0x6E776F6E6B6E75;
      uint64_t v12 = a2[2];
      if (!v12) {
        goto LABEL_23;
      }
    }
    if (a2[4] != v9 || a2[5] != v11)
    {
      uint64_t result = sub_10000F8F0();
      if ((result & 1) == 0) {
        break;
      }
    }
LABEL_3:
    swift_bridgeObjectRelease();
    sub_10000F880();
    sub_10000F8B0();
    sub_10000F8C0();
    sub_10000F890();
LABEL_4:
    if (++v5 == v20) {
      return (uint64_t)&_swiftEmptyArrayStorage;
    }
  }
  if (v12 == 1)
  {
LABEL_23:

    swift_bridgeObjectRelease();
    goto LABEL_4;
  }
  v14 = v18;
  uint64_t v15 = 1;
  while (1)
  {
    uint64_t v16 = v15 + 1;
    if (__OFADD__(v15, 1)) {
      break;
    }
    if (*(v14 - 1) == v9 && *v14 == v11) {
      goto LABEL_3;
    }
    uint64_t result = sub_10000F8F0();
    if (result) {
      goto LABEL_3;
    }
    v14 += 2;
    ++v15;
    if (v16 == v12) {
      goto LABEL_23;
    }
  }
  __break(1u);
  return result;
}

BOOL sub_10000660C(id *a1)
{
  uint64_t v2 = *(void *)(*(void *)(v1 + 16) + 40);
  return !v2 || sub_100004650((Swift::UInt)[*a1 memberType], v2);
}

unint64_t sub_100006660()
{
  unint64_t result = qword_1000181A8;
  if (!qword_1000181A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000181A8);
  }
  return result;
}

void type metadata accessor for FAMemberType()
{
  if (!qword_1000181B0)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_1000181B0);
    }
  }
}

unint64_t sub_100006710()
{
  unint64_t result = qword_1000181B8;
  if (!qword_1000181B8)
  {
    type metadata accessor for FAMemberType();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000181B8);
  }
  return result;
}

uint64_t sub_100006768(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    sub_10000616C(&qword_1000181C8);
    uint64_t v5 = swift_allocError();
    *id v6 = a3;
    id v7 = a3;
    return _swift_continuation_throwingResumeWithError(v3, v5);
  }
  else
  {
    if (a2)
    {
      **(void **)(*(void *)(v3 + 64) + 40) = a2;
      id v8 = a2;
      a1 = v3;
    }
    else
    {
      __break(1u);
    }
    return _swift_continuation_throwingResume(a1);
  }
}

uint64_t sub_100006828()
{
  return _swift_task_switch(sub_100006844, 0, 0);
}

uint64_t sub_100006844()
{
  id v1 = [objc_allocWithZone((Class)FAFetchFamilyCircleRequest) init];
  v0[16] = v1;
  v0[2] = v0;
  v0[7] = v0 + 15;
  v0[3] = sub_100006960;
  uint64_t v2 = swift_continuation_init();
  v0[10] = _NSConcreteStackBlock;
  v0[11] = 0x40000000;
  v0[12] = sub_100006768;
  v0[13] = &unk_100014C68;
  v0[14] = v2;
  [v1 startRequestWithCompletionHandler:v0 + 10];
  return _swift_continuation_await(v0 + 2);
}

uint64_t sub_100006960()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 136) = v1;
  if (v1) {
    uint64_t v2 = sub_100006AD8;
  }
  else {
    uint64_t v2 = sub_100006A70;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_100006A70()
{
  uint64_t v1 = *(void *)(v0 + 120);
  uint64_t v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v2(v1);
}

uint64_t sub_100006AD8()
{
  uint64_t v1 = *(void **)(v0 + 128);
  swift_willThrow();

  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

ValueMetadata *type metadata accessor for FamilyQuery()
{
  return &type metadata for FamilyQuery;
}

unint64_t sub_100006B5C()
{
  unint64_t result = qword_1000181D0;
  if (!qword_1000181D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000181D0);
  }
  return result;
}

unint64_t sub_100006BB4()
{
  unint64_t result = qword_1000181D8;
  if (!qword_1000181D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000181D8);
  }
  return result;
}

uint64_t sub_100006C08()
{
  uint64_t v0 = sub_10000F7A0();
  sub_100007934(v0, qword_100018640);
  sub_100007894(v0, (uint64_t)qword_100018640);
  return sub_10000F780();
}

uint64_t sub_100006C6C()
{
  uint64_t v0 = sub_10000616C(&qword_100018240);
  sub_100007934(v0, qword_100018658);
  uint64_t v1 = sub_100007894(v0, (uint64_t)qword_100018658);
  sub_10000F650();
  uint64_t v2 = sub_10000F660();
  uint64_t v3 = *(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56);

  return v3(v1, 0, 1, v2);
}

uint64_t sub_100006D24()
{
  return sub_10000F610();
}

uint64_t sub_100006D48()
{
  return sub_10000F620();
}

void (*sub_100006D6C(void *a1))(void *a1)
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_10000F600();
  return sub_100006DC8;
}

void sub_100006DC8(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void, void))(*a1 + 32))(*a1, 0);

  free(v1);
}

unint64_t sub_100006E18()
{
  unint64_t result = qword_1000181E0;
  if (!qword_1000181E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000181E0);
  }
  return result;
}

unint64_t sub_100006E70()
{
  unint64_t result = qword_1000181E8;
  if (!qword_1000181E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000181E8);
  }
  return result;
}

uint64_t sub_100006EC4(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_100007798();
  unint64_t v5 = sub_100007840();

  return static _URLRepresentableIntent<>.urlRepresentation.getter(a1, v4, a2, v5);
}

unint64_t sub_100006F2C(uint64_t a1)
{
  unint64_t result = sub_100006F54();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_100006F54()
{
  unint64_t result = qword_1000181F0;
  if (!qword_1000181F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000181F0);
  }
  return result;
}

unint64_t sub_100006FAC()
{
  unint64_t result = qword_1000181F8;
  if (!qword_1000181F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000181F8);
  }
  return result;
}

unint64_t sub_100007004()
{
  unint64_t result = qword_100018200;
  if (!qword_100018200)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018200);
  }
  return result;
}

uint64_t sub_100007058()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1000070A8@<X0>(uint64_t a1@<X8>)
{
  if (qword_100018040 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_10000F7A0();
  uint64_t v3 = sub_100007894(v2, (uint64_t)qword_100018640);
  unint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

uint64_t sub_100007150()
{
  return 0;
}

uint64_t sub_10000715C()
{
  return 1;
}

uint64_t sub_100007168@<X0>(uint64_t a1@<X8>)
{
  if (qword_100018048 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_10000616C(&qword_100018240);
  uint64_t v3 = sub_100007894(v2, (uint64_t)qword_100018658);

  return sub_1000078CC(v3, a1);
}

uint64_t sub_1000071E4(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_100007798();
  unint64_t v7 = sub_1000077EC();
  unint64_t v8 = sub_100007840();
  void *v5 = v2;
  v5[1] = sub_1000072B8;
  return _URLRepresentableIntent<>.perform()(a1, a2, v6, v7, v8);
}

uint64_t sub_1000072B8()
{
  uint64_t v2 = *v1;
  uint64_t result = swift_task_dealloc();
  if (v0)
  {
    unint64_t v4 = *(uint64_t (**)(void))(v2 + 8);
    return v4();
  }
  return result;
}

uint64_t sub_1000073C0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100007458();
  *a1 = result;
  return result;
}

unint64_t sub_1000073EC()
{
  return 0xD000000000000015;
}

uint64_t sub_10000740C(uint64_t a1)
{
  unint64_t v2 = sub_100006E18();

  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

ValueMetadata *type metadata accessor for OpenFamilySetup()
{
  return &type metadata for OpenFamilySetup;
}

uint64_t sub_100007458()
{
  uint64_t v16 = sub_10000F6B0();
  uint64_t v0 = *(void *)(v16 - 8);
  ((void (*)(void))__chkstk_darwin)();
  unint64_t v2 = (char *)&v16 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000616C(&qword_100018210);
  uint64_t v3 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  unint64_t v7 = (char *)&v16 - v6;
  uint64_t v8 = sub_10000616C(&qword_100018188);
  __chkstk_darwin(v8 - 8);
  uint64_t v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_10000F7A0();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  sub_10000616C(&qword_100018218);
  sub_10000F780();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v12 + 56))(v10, 1, 1, v11);
  char v17 = 1;
  uint64_t v13 = sub_10000F5F0();
  v14 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56);
  v14(v7, 1, 1, v13);
  v14(v5, 1, 1, v13);
  (*(void (**)(char *, void, uint64_t))(v0 + 104))(v2, enum case for InputConnectionBehavior.default(_:), v16);
  sub_100007744();
  return sub_10000F640();
}

unint64_t sub_100007744()
{
  unint64_t result = qword_100018220;
  if (!qword_100018220)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018220);
  }
  return result;
}

unint64_t sub_100007798()
{
  unint64_t result = qword_100018228;
  if (!qword_100018228)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018228);
  }
  return result;
}

unint64_t sub_1000077EC()
{
  unint64_t result = qword_100018230;
  if (!qword_100018230)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018230);
  }
  return result;
}

unint64_t sub_100007840()
{
  unint64_t result = qword_100018238;
  if (!qword_100018238)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018238);
  }
  return result;
}

uint64_t sub_100007894(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_1000078CC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000616C(&qword_100018240);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t *sub_100007934(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_100007998(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_10000DB40(*a1, *a2);
}

unint64_t sub_1000079A8()
{
  unint64_t result = qword_100018248;
  if (!qword_100018248)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018248);
  }
  return result;
}

Swift::Int sub_1000079FC()
{
  return sub_100007A04();
}

Swift::Int sub_100007A04()
{
  return sub_10000F920();
}

uint64_t sub_100007AB4()
{
  sub_10000F840();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_100007B50()
{
  return sub_100007B58();
}

Swift::Int sub_100007B58()
{
  return sub_10000F920();
}

uint64_t sub_100007C04@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_100008298(*(void *)a1, *(void **)(a1 + 8));
  *a2 = result;
  return result;
}

void sub_100007C34(uint64_t *a1@<X8>)
{
  int v2 = *v1;
  unint64_t v3 = 0xEB00000000707574;
  unint64_t v4 = 0x800000010000FC40;
  unint64_t v5 = 0xD000000000000011;
  if (v2 != 1)
  {
    unint64_t v5 = 0xD000000000000013;
    unint64_t v4 = 0x800000010000FC60;
  }
  BOOL v6 = v2 == 0;
  if (*v1) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = 0x6553796C696D6166;
  }
  if (!v6) {
    unint64_t v3 = v4;
  }
  *a1 = v7;
  a1[1] = v3;
}

unint64_t sub_100007CA4()
{
  unint64_t result = qword_100018250;
  if (!qword_100018250)
  {
    sub_1000055D8(&qword_100018258);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018250);
  }
  return result;
}

void sub_100007D00(void *a1@<X8>)
{
  *a1 = &off_100014A78;
}

uint64_t sub_100007D10()
{
  unint64_t v1 = 0xD000000000000011;
  if (*v0 != 1) {
    unint64_t v1 = 0xD000000000000013;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 0x6553796C696D6166;
  }
}

uint64_t sub_100007D78@<X0>(uint64_t a1@<X0>, void *a2@<X1>, unsigned char *a3@<X8>)
{
  swift_bridgeObjectRetain();
  uint64_t result = sub_100008298(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_100007DC0()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_100007DF0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  *a3 = a1;
  a3[1] = a2;
  return swift_bridgeObjectRetain();
}

unint64_t sub_100007E00()
{
  unint64_t result = qword_100018260;
  if (!qword_100018260)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018260);
  }
  return result;
}

Swift::Int sub_100007E54()
{
  return sub_10000F920();
}

uint64_t sub_100007EB0()
{
  swift_bridgeObjectRetain();
  sub_10000F840();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_100007F08()
{
  return sub_10000F920();
}

uint64_t sub_100007F60(void *a1, void *a2)
{
  if (*a1 == *a2 && a1[1] == a2[1]) {
    return 1;
  }
  else {
    return sub_10000F8F0();
  }
}

void *initializeBufferWithCopyOfBuffer for FamilyMemberEntityID(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for FamilyMemberEntityID()
{
  return swift_bridgeObjectRelease();
}

void *assignWithCopy for FamilyMemberEntityID(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 initializeWithTake for FamilyMemberEntityID(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

void *assignWithTake for FamilyMemberEntityID(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for FamilyMemberEntityID(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for FamilyMemberEntityID(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for FamilyMemberEntityID()
{
  return &type metadata for FamilyMemberEntityID;
}

unsigned char *initializeBufferWithCopyOfBuffer for LinkDestinationID(unsigned char *result, unsigned char *a2)
{
  *__n128 result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for LinkDestinationID(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFE) {
    goto LABEL_17;
  }
  if (a2 + 2 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 2) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 2;
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
      return (*a1 | (v4 << 8)) - 2;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 2;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 3;
  int v8 = v6 - 3;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for LinkDestinationID(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 2 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 2) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFE) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFD)
  {
    unsigned int v6 = ((a2 - 254) >> 8) + 1;
    *__n128 result = a2 + 2;
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
        JUMPOUT(0x10000824CLL);
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
          *__n128 result = a2 + 2;
        break;
    }
  }
  return result;
}

uint64_t sub_100008274(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_100008280(unsigned char *result, char a2)
{
  *__n128 result = a2;
  return result;
}

ValueMetadata *type metadata accessor for LinkDestinationID()
{
  return &type metadata for LinkDestinationID;
}

uint64_t sub_100008298(uint64_t a1, void *a2)
{
  v6._countAndFlagsBits = a1;
  v3._rawValue = &off_100014A10;
  v6._object = a2;
  unint64_t v4 = sub_10000F8E0(v3, v6);
  swift_bridgeObjectRelease();
  if (v4 >= 3) {
    return 3;
  }
  else {
    return v4;
  }
}

unint64_t sub_1000082F0()
{
  unint64_t result = qword_100018268;
  if (!qword_100018268)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018268);
  }
  return result;
}

uint64_t sub_100008344()
{
  uint64_t v0 = sub_10000F7A0();
  sub_100007934(v0, qword_100018670);
  sub_100007894(v0, (uint64_t)qword_100018670);
  return sub_10000F780();
}

uint64_t sub_1000083A8()
{
  uint64_t v0 = sub_10000616C(&qword_100018240);
  sub_100007934(v0, qword_100018688);
  uint64_t v1 = sub_100007894(v0, (uint64_t)qword_100018688);
  sub_10000F650();
  uint64_t v2 = sub_10000F660();
  Swift::OpaquePointer v3 = *(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56);

  return v3(v1, 0, 1, v2);
}

uint64_t sub_100008460@<X0>(void *a1@<X8>)
{
  uint64_t result = sub_10000F610();
  *a1 = v3;
  return result;
}

void sub_10000849C(id *a1)
{
  id v1 = *a1;
  sub_10000F620();
}

unint64_t sub_1000084E4()
{
  unint64_t result = qword_100018270;
  if (!qword_100018270)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018270);
  }
  return result;
}

uint64_t sub_100008538(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_100008DA4();
  unint64_t v5 = sub_100005E90();

  return static _URLRepresentableIntent<>.urlRepresentation.getter(a1, v4, a2, v5);
}

unint64_t sub_1000085A0(uint64_t a1)
{
  unint64_t result = sub_1000085C8();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_1000085C8()
{
  unint64_t result = qword_100018278;
  if (!qword_100018278)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018278);
  }
  return result;
}

unint64_t sub_100008620()
{
  unint64_t result = qword_100018280;
  if (!qword_100018280)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018280);
  }
  return result;
}

unint64_t sub_100008678()
{
  unint64_t result = qword_100018288;
  if (!qword_100018288)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018288);
  }
  return result;
}

uint64_t sub_1000086CC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10000871C@<X0>(uint64_t a1@<X8>)
{
  if (qword_100018050 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_10000F7A0();
  uint64_t v3 = sub_100007894(v2, (uint64_t)qword_100018670);
  unint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

uint64_t sub_1000087C4@<X0>(uint64_t a1@<X8>)
{
  if (qword_100018058 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_10000616C(&qword_100018240);
  uint64_t v3 = sub_100007894(v2, (uint64_t)qword_100018688);

  return sub_1000078CC(v3, a1);
}

uint64_t sub_100008840(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_100008DA4();
  unint64_t v7 = sub_100008DF8();
  unint64_t v8 = sub_100005E90();
  void *v5 = v2;
  v5[1] = sub_1000072B8;
  return _URLRepresentableIntent<>.perform()(a1, a2, v6, v7, v8);
}

uint64_t sub_100008914@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10000898C(0);
  *a1 = result;
  return result;
}

uint64_t sub_100008940(uint64_t a1)
{
  unint64_t v2 = sub_1000084E4();

  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

ValueMetadata *type metadata accessor for OpenFamilyMemberSettings()
{
  return &type metadata for OpenFamilyMemberSettings;
}

uint64_t sub_10000898C(uint64_t a1)
{
  uint64_t v28 = a1;
  uint64_t v30 = sub_10000F6B0();
  uint64_t v1 = *(void *)(v30 - 8);
  __chkstk_darwin(v30);
  v29 = (char *)&v20 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_10000616C(&qword_100018210);
  uint64_t v4 = __chkstk_darwin(v3 - 8);
  unint64_t v6 = (char *)&v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  unint64_t v8 = (char *)&v20 - v7;
  uint64_t v9 = sub_10000616C(&qword_100018188);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_10000F7A0();
  uint64_t v26 = v12;
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  v23 = (char *)&v20 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = sub_10000616C(&qword_100018298);
  sub_10000F780();
  v25 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56);
  v25(v11, 1, 1, v12);
  uint64_t v31 = 0;
  uint64_t v15 = sub_10000F5F0();
  uint64_t v16 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56);
  v16(v8, 1, 1, v15);
  v16(v6, 1, 1, v15);
  unsigned int v22 = enum case for InputConnectionBehavior.default(_:);
  char v17 = *(void (**)(void))(v1 + 104);
  uint64_t v20 = v1 + 104;
  v21 = (void (*)(char *, void, uint64_t))v17;
  v17(v29);
  sub_100004E40();
  uint64_t v24 = sub_10000F640();
  sub_10000F780();
  v25(v11, 1, 1, v26);
  uint64_t v35 = 0;
  v16(v8, 1, 1, v15);
  v16(v6, 1, 1, v15);
  v32 = &type metadata for FamilyQuery;
  v33 = &off_100014CA0;
  uint64_t v34 = v28;
  v21(v29, v22, v30);
  sub_100003A98();
  uint64_t v18 = sub_10000F630();
  swift_release();
  return v18;
}

unint64_t sub_100008DA4()
{
  unint64_t result = qword_1000182A0;
  if (!qword_1000182A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000182A0);
  }
  return result;
}

unint64_t sub_100008DF8()
{
  unint64_t result = qword_1000182A8;
  if (!qword_1000182A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000182A8);
  }
  return result;
}

uint64_t sub_100008E4C(uint64_t a1)
{
  unint64_t v2 = sub_100008F9C();

  return AppIntentsExtension.configuration.getter(a1, v2);
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

unint64_t sub_100008EF4()
{
  unint64_t result = qword_1000182B0;
  if (!qword_1000182B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000182B0);
  }
  return result;
}

uint64_t sub_100008F4C()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_100008F9C()
{
  unint64_t result = qword_1000182B8;
  if (!qword_1000182B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000182B8);
  }
  return result;
}

ValueMetadata *type metadata accessor for FamilyIntentsExtension()
{
  return &type metadata for FamilyIntentsExtension;
}

unint64_t sub_100009004()
{
  unint64_t result = qword_1000182C0;
  if (!qword_1000182C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000182C0);
  }
  return result;
}

unint64_t sub_10000905C()
{
  unint64_t result = qword_1000182C8;
  if (!qword_1000182C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000182C8);
  }
  return result;
}

uint64_t sub_1000090B0()
{
  uint64_t v0 = sub_10000F7A0();
  sub_100007934(v0, qword_1000186A0);
  sub_100007894(v0, (uint64_t)qword_1000186A0);
  return sub_10000F780();
}

uint64_t sub_100009114()
{
  uint64_t v0 = sub_10000616C(&qword_100018240);
  sub_100007934(v0, qword_1000186B8);
  uint64_t v1 = sub_100007894(v0, (uint64_t)qword_1000186B8);
  sub_10000F650();
  uint64_t v2 = sub_10000F660();
  uint64_t v3 = *(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56);

  return v3(v1, 0, 1, v2);
}

unint64_t sub_1000091D0()
{
  unint64_t result = qword_1000182D0;
  if (!qword_1000182D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000182D0);
  }
  return result;
}

uint64_t sub_100009224(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_1000099B4();
  unint64_t v5 = sub_100009A5C();

  return static _URLRepresentableIntent<>.urlRepresentation.getter(a1, v4, a2, v5);
}

unint64_t sub_10000928C(uint64_t a1)
{
  unint64_t result = sub_1000092B4();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_1000092B4()
{
  unint64_t result = qword_1000182D8;
  if (!qword_1000182D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000182D8);
  }
  return result;
}

unint64_t sub_10000930C()
{
  unint64_t result = qword_1000182E0;
  if (!qword_1000182E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000182E0);
  }
  return result;
}

unint64_t sub_100009364()
{
  unint64_t result = qword_1000182E8;
  if (!qword_1000182E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000182E8);
  }
  return result;
}

uint64_t sub_1000093B8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100009408@<X0>(uint64_t a1@<X8>)
{
  if (qword_100018060 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_10000F7A0();
  uint64_t v3 = sub_100007894(v2, (uint64_t)qword_1000186A0);
  unint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

uint64_t sub_1000094B0@<X0>(uint64_t a1@<X8>)
{
  if (qword_100018068 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_10000616C(&qword_100018240);
  uint64_t v3 = sub_100007894(v2, (uint64_t)qword_1000186B8);

  return sub_1000078CC(v3, a1);
}

uint64_t sub_10000952C(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_1000099B4();
  unint64_t v7 = sub_100009A08();
  unint64_t v8 = sub_100009A5C();
  void *v5 = v2;
  v5[1] = sub_1000072B8;
  return _URLRepresentableIntent<>.perform()(a1, a2, v6, v7, v8);
}

uint64_t sub_100009600@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100009674();
  *a1 = result;
  return result;
}

uint64_t sub_100009628(uint64_t a1)
{
  unint64_t v2 = sub_1000091D0();

  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

ValueMetadata *type metadata accessor for OpenFamilySettings()
{
  return &type metadata for OpenFamilySettings;
}

uint64_t sub_100009674()
{
  uint64_t v17 = sub_10000F6B0();
  uint64_t v0 = *(void *)(v17 - 8);
  __chkstk_darwin(v17);
  unint64_t v2 = (char *)&v17 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_10000616C(&qword_100018210);
  uint64_t v4 = __chkstk_darwin(v3 - 8);
  unint64_t v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  unint64_t v8 = (char *)&v17 - v7;
  uint64_t v9 = sub_10000616C(&qword_100018188);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_10000F7A0();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  sub_10000616C(&qword_1000182F8);
  sub_10000F780();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56))(v11, 1, 1, v12);
  char v18 = 1;
  uint64_t v14 = sub_10000F5F0();
  uint64_t v15 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56);
  v15(v8, 1, 1, v14);
  v15(v6, 1, 1, v14);
  (*(void (**)(char *, void, uint64_t))(v0 + 104))(v2, enum case for InputConnectionBehavior.default(_:), v17);
  sub_100009960();
  return sub_10000F640();
}

unint64_t sub_100009960()
{
  unint64_t result = qword_100018300;
  if (!qword_100018300)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018300);
  }
  return result;
}

unint64_t sub_1000099B4()
{
  unint64_t result = qword_100018308;
  if (!qword_100018308)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018308);
  }
  return result;
}

unint64_t sub_100009A08()
{
  unint64_t result = qword_100018310;
  if (!qword_100018310)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018310);
  }
  return result;
}

unint64_t sub_100009A5C()
{
  unint64_t result = qword_100018318;
  if (!qword_100018318)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018318);
  }
  return result;
}

unint64_t sub_100009AB4()
{
  unint64_t result = qword_100018320;
  if (!qword_100018320)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018320);
  }
  return result;
}

uint64_t sub_100009B08()
{
  uint64_t v0 = sub_10000F7D0();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = &v14[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v4 = sub_10000616C(&qword_1000183E0);
  __chkstk_darwin(v4 - 8);
  unint64_t v6 = &v14[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v7 = self;
  id v15 = 0;
  id v8 = [v7 urlDestinationTo:1 error:&v15];
  id v9 = v15;
  if (!v8)
  {
    id v12 = v15;
    sub_10000F770();

    swift_willThrow();
    swift_errorRelease();
    (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(v1 + 56))(v6, 1, 1, v0);
    goto LABEL_5;
  }
  uint64_t v10 = v8;
  sub_10000F7C0();
  id v11 = v9;

  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v1 + 32))(v6, v3, v0);
  (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v1 + 56))(v6, 0, 1, v0);
  if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v1 + 48))(v6, 1, v0) == 1)
  {
LABEL_5:
    sub_10000B86C((uint64_t)v6);
    goto LABEL_6;
  }
  sub_10000F7B0();
  (*(void (**)(unsigned char *, uint64_t))(v1 + 8))(v6, v0);
LABEL_6:
  sub_100009960();
  return sub_10000F740();
}

void sub_100009D88()
{
  qword_1000186E8 = (uint64_t)&type metadata for FamilyQuery;
  unk_1000186F0 = &off_100014CA0;
}

uint64_t sub_100009DAC@<X0>(uint64_t a1@<X8>)
{
  if (qword_100018070 != -1) {
    swift_once();
  }

  return sub_10000B80C((uint64_t)&unk_1000186D0, a1);
}

uint64_t sub_100009E18()
{
  sub_100009A5C();
  uint64_t v2 = sub_10000F6C0();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
  return sub_1000061B0(v3, v0, v2, v1);
}

void sub_100009EAC(unsigned char *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_100009EB8()
{
  uint64_t v0 = sub_10000616C(&qword_100018188);
  __chkstk_darwin(v0 - 8);
  uint64_t v2 = (char *)&v6 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_10000F7A0();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  sub_10000F780();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v4 + 56))(v2, 1, 1, v3);
  return sub_10000F750();
}

uint64_t sub_100009FFC(uint64_t a1)
{
  unint64_t v2 = sub_100009960();

  return static AppEntity.defaultResolverSpecification.getter(a1, v2);
}

uint64_t sub_10000A048()
{
  uint64_t v0 = sub_10000616C(&qword_100018190);
  __chkstk_darwin(v0 - 8);
  unint64_t v2 = (char *)&v10 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_10000616C(&qword_100018188);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10000F7A0();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  sub_10000F780();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v7 + 56))(v5, 1, 1, v6);
  uint64_t v8 = sub_10000F670();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v2, 1, 1, v8);
  return sub_10000F680();
}

uint64_t sub_10000A218(uint64_t a1)
{
  unint64_t v2 = sub_10000B518();

  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

uint64_t sub_10000A264()
{
  uint64_t v3 = (uint64_t (__cdecl *)())((char *)&dword_1000181C0 + dword_1000181C0);
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_10000A304;
  return v3();
}

uint64_t sub_10000A304(uint64_t a1)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 24) = a1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v4 = *(uint64_t (**)(void))(v3 + 8);
    return v4();
  }
  else
  {
    return _swift_task_switch(sub_10000A438, 0, 0);
  }
}

uint64_t sub_10000A438()
{
  id v1 = [*(id *)(v0 + 24) members];
  sub_1000062D0();
  unint64_t v2 = sub_10000F850();

  if (v2 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_10000F8D0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }

  swift_bridgeObjectRelease();
  if (v3) {
    uint64_t v4 = &off_100014AA0;
  }
  else {
    uint64_t v4 = (_UNKNOWN **)&_swiftEmptyArrayStorage;
  }
  uint64_t v5 = *(uint64_t (**)(_UNKNOWN **))(v0 + 8);
  return v5(v4);
}

uint64_t sub_10000A530(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  unint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 24) = v2;
  *unint64_t v2 = v1;
  v2[1] = sub_10000A5C0;
  return sub_10000A928();
}

uint64_t sub_10000A5C0(char a1)
{
  *(unsigned char *)(*(void *)v1 + 32) = a1;
  swift_task_dealloc();
  return _swift_task_switch(sub_10000A6C0, 0, 0);
}

uint64_t sub_10000A6C0()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = *(void *)(v1 + 16);
  if (!v2)
  {
    uint64_t v9 = *((void *)&_swiftEmptyArrayStorage + 2);
    if (v9) {
      goto LABEL_14;
    }
    goto LABEL_24;
  }
  uint64_t v3 = (unsigned __int8 *)(v1 + 32);
  swift_bridgeObjectRetain();
  do
  {
    int v7 = *v3++;
    int v6 = v7;
    if (v7 && v6 == 1)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      char v8 = sub_10000F8F0();
      swift_bridgeObjectRelease();
      if ((v8 & 1) == 0) {
        goto LABEL_6;
      }
    }
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      sub_10000F360(0, *((void *)&_swiftEmptyArrayStorage + 2) + 1, 1);
    }
    unint64_t v5 = *((void *)&_swiftEmptyArrayStorage + 2);
    unint64_t v4 = *((void *)&_swiftEmptyArrayStorage + 3);
    if (v5 >= v4 >> 1) {
      sub_10000F360((char *)(v4 > 1), v5 + 1, 1);
    }
    *((void *)&_swiftEmptyArrayStorage + 2) = v5 + 1;
    *((unsigned char *)&_swiftEmptyArrayStorage + v5 + 32) = v6;
LABEL_6:
    --v2;
  }
  while (v2);
  swift_bridgeObjectRelease();
  uint64_t v9 = *((void *)&_swiftEmptyArrayStorage + 2);
  if (!v9)
  {
LABEL_24:
    swift_release();
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
    goto LABEL_25;
  }
LABEL_14:
  swift_retain();
  uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  do
  {
    if ((*(unsigned char *)(v0 + 32) & 1) == 0)
    {
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v10 = sub_10000F46C(0, *((void *)v10 + 2) + 1, 1, v10);
      }
      unint64_t v12 = *((void *)v10 + 2);
      unint64_t v11 = *((void *)v10 + 3);
      unint64_t v13 = v12 + 1;
      if (v12 >= v11 >> 1) {
        uint64_t v10 = sub_10000F46C((char *)(v11 > 1), v12 + 1, 1, v10);
      }
      *((void *)v10 + 2) = v13;
    }
    --v9;
  }
  while (v9);
  swift_release_n();
LABEL_25:
  uint64_t v14 = *(uint64_t (**)(char *))(v0 + 8);
  return v14(v10);
}

uint64_t sub_10000A928()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_10000AA0C;
  unint64_t v4 = (uint64_t (__cdecl *)())((char *)&dword_1000181C0 + dword_1000181C0);
  uint64_t v2 = (void *)swift_task_alloc();
  v1[2] = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_10000A304;
  return v4();
}

uint64_t sub_10000AA0C(uint64_t a1)
{
  uint64_t v4 = *v2;
  uint64_t v5 = *v2;
  swift_task_dealloc();
  if (v1)
  {
    swift_errorRelease();
    int v6 = *(uint64_t (**)(uint64_t))(v5 + 8);
    return v6(1);
  }
  else
  {
    *(void *)(v4 + 24) = a1;
    return _swift_task_switch(sub_10000AB64, 0, 0);
  }
}

uint64_t sub_10000AB64()
{
  uint64_t v1 = *(void *)(*(void *)(v0 + 24) + 16);
  swift_bridgeObjectRelease();
  uint64_t v2 = *(uint64_t (**)(BOOL))(v0 + 8);
  return v2(v1 == 0);
}

uint64_t sub_10000ABD0(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return _swift_task_switch(sub_10000ABF0, 0, 0);
}

uint64_t sub_10000ABF0()
{
  **(void **)(v0 + 16) = &off_100014AC8;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

unint64_t sub_10000AC1C()
{
  unint64_t result = qword_100018330;
  if (!qword_100018330)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018330);
  }
  return result;
}

unint64_t sub_10000AC74()
{
  unint64_t result = qword_100018338[0];
  if (!qword_100018338[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_100018338);
  }
  return result;
}

void sub_10000ACCC(uint64_t a1@<X8>)
{
  *(void *)(a1 + 24) = &type metadata for FamilyQuery;
  *(void *)(a1 + 32) = &off_100014CA0;
}

uint64_t sub_10000ACE4(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  void *v3 = v1;
  v3[1] = sub_10000AD78;
  return sub_10000A530(a1);
}

uint64_t sub_10000AD78(uint64_t a1)
{
  uint64_t v7 = *v2;
  uint64_t v4 = swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(uint64_t))(v7 + 8);
  if (!v1) {
    uint64_t v4 = a1;
  }
  return v5(v4);
}

uint64_t sub_10000AE78(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 24) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_100004950;
  uint64_t v5 = (uint64_t (__cdecl *)())((char *)&dword_1000181C0 + dword_1000181C0);
  uint64_t v3 = (void *)swift_task_alloc();
  v2[2] = v3;
  void *v3 = v2;
  v3[1] = sub_10000A304;
  return v5();
}

unint64_t sub_10000AF64()
{
  unint64_t result = qword_100018350;
  if (!qword_100018350)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018350);
  }
  return result;
}

unint64_t sub_10000AFBC()
{
  unint64_t result = qword_100018358;
  if (!qword_100018358)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018358);
  }
  return result;
}

unint64_t sub_10000B014()
{
  unint64_t result = qword_100018360;
  if (!qword_100018360)
  {
    sub_1000055D8(qword_100018368);
    sub_10000AFBC();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018360);
  }
  return result;
}

uint64_t sub_10000B088(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_100009AB4();
  void *v5 = v2;
  v5[1] = sub_1000056D4;
  return EntityQuery.results()(a1, a2, v6);
}

uint64_t sub_10000B13C(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 24) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_10000B1CC;
  return sub_10000A928();
}

uint64_t sub_10000B1CC(char a1)
{
  uint64_t v3 = *(unsigned char **)(*v1 + 16);
  uint64_t v6 = *v1;
  swift_task_dealloc();
  unsigned char *v3 = a1 & 1;
  uint64_t v4 = *(uint64_t (**)(void))(v6 + 8);
  return v4();
}

uint64_t initializeWithCopy for FamilySettingsDeepLinkQuery(uint64_t a1, uint64_t a2)
{
  long long v3 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v3;
  (**(void (***)(void))(v3 - 8))();
  return a1;
}

uint64_t *assignWithCopy for FamilySettingsDeepLinkQuery(uint64_t *a1, uint64_t *a2)
{
  return a1;
}

__n128 initializeWithTake for FamilySettingsDeepLinkQuery(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for FamilySettingsDeepLinkQuery(uint64_t a1, uint64_t a2)
{
  _s13FamilyIntents27FamilySettingsDeepLinkQueryVwxx_0(a1);
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  return a1;
}

uint64_t getEnumTagSinglePayload for FamilySettingsDeepLinkQuery(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 40)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for FamilySettingsDeepLinkQuery(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 40) = 1;
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
    *(unsigned char *)(result + 40) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for FamilySettingsDeepLinkQuery()
{
  return &type metadata for FamilySettingsDeepLinkQuery;
}

ValueMetadata *type metadata accessor for FamilySettingsDeepLink()
{
  return &type metadata for FamilySettingsDeepLink;
}

unint64_t sub_10000B468()
{
  unint64_t result = qword_100018380;
  if (!qword_100018380)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018380);
  }
  return result;
}

unint64_t sub_10000B4C0()
{
  unint64_t result = qword_100018388;
  if (!qword_100018388)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018388);
  }
  return result;
}

unint64_t sub_10000B518()
{
  unint64_t result = qword_100018390;
  if (!qword_100018390)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018390);
  }
  return result;
}

unint64_t sub_10000B570()
{
  unint64_t result = qword_100018398;
  if (!qword_100018398)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018398);
  }
  return result;
}

unint64_t sub_10000B5C8()
{
  unint64_t result = qword_1000183A8;
  if (!qword_1000183A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000183A8);
  }
  return result;
}

unint64_t sub_10000B61C(uint64_t a1)
{
  unint64_t result = sub_100009A5C();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_10000B648()
{
  unint64_t result = qword_1000183B0;
  if (!qword_1000183B0)
  {
    sub_1000055D8(&qword_1000183B8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000183B0);
  }
  return result;
}

unint64_t sub_10000B6AC()
{
  unint64_t result = qword_1000183C0;
  if (!qword_1000183C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000183C0);
  }
  return result;
}

unint64_t sub_10000B704()
{
  unint64_t result = qword_1000183C8;
  if (!qword_1000183C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000183C8);
  }
  return result;
}

unint64_t sub_10000B760()
{
  unint64_t result = qword_1000183D0;
  if (!qword_1000183D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000183D0);
  }
  return result;
}

unint64_t sub_10000B7B8()
{
  unint64_t result = qword_1000183D8;
  if (!qword_1000183D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000183D8);
  }
  return result;
}

uint64_t sub_10000B80C(uint64_t a1, uint64_t a2)
{
  long long v3 = *(_OWORD *)(a1 + 24);
  *(_OWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_10000B86C(uint64_t a1)
{
  uint64_t v2 = sub_10000616C(&qword_1000183E0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_10000B8D0()
{
  unint64_t result = qword_100018400;
  if (!qword_100018400)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018400);
  }
  return result;
}

uint64_t sub_10000B924()
{
  uint64_t v0 = sub_10000616C(&qword_100018190);
  __chkstk_darwin(v0 - 8);
  uint64_t v2 = (char *)&v10 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_10000616C(&qword_100018188);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10000F7A0();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  sub_10000F780();
  sub_10000F780();
  (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v5, 0, 1, v6);
  uint64_t v8 = sub_10000F670();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v2, 1, 1, v8);
  return sub_10000F680();
}

uint64_t sub_10000BB20()
{
  uint64_t v0 = sub_10000F7D0();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = &v14[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v4 = sub_10000616C(&qword_1000183E0);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = &v14[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v7 = self;
  id v15 = 0;
  id v8 = [v7 urlDestinationTo:5 error:&v15];
  id v9 = v15;
  if (!v8)
  {
    id v12 = v15;
    sub_10000F770();

    swift_willThrow();
    swift_errorRelease();
    (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(v1 + 56))(v6, 1, 1, v0);
    goto LABEL_5;
  }
  uint64_t v10 = v8;
  sub_10000F7C0();
  id v11 = v9;

  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v1 + 32))(v6, v3, v0);
  (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v1 + 56))(v6, 0, 1, v0);
  if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v1 + 48))(v6, 1, v0) == 1)
  {
LABEL_5:
    sub_10000B86C((uint64_t)v6);
    goto LABEL_6;
  }
  sub_10000F7B0();
  (*(void (**)(unsigned char *, uint64_t))(v1 + 8))(v6, v0);
LABEL_6:
  sub_100007744();
  return sub_10000F740();
}

void sub_10000BDA0()
{
  qword_100018710 = (uint64_t)&type metadata for FamilyQuery;
  *(void *)algn_100018718 = &off_100014CA0;
}

uint64_t sub_10000BDC4@<X0>(uint64_t a1@<X8>)
{
  if (qword_100018078 != -1) {
    swift_once();
  }

  return sub_10000B80C((uint64_t)&unk_1000186F8, a1);
}

uint64_t sub_10000BE30()
{
  sub_100007840();
  uint64_t v2 = sub_10000F6C0();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
  return sub_1000061B0(v3, v0, v2, v1);
}

void sub_10000BEC4(unsigned char *a1@<X8>)
{
  *a1 = 0;
}

uint64_t sub_10000BECC()
{
  uint64_t v0 = sub_10000616C(&qword_100018188);
  __chkstk_darwin(v0 - 8);
  uint64_t v2 = (char *)&v6 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_10000F7A0();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  sub_10000F780();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v4 + 56))(v2, 1, 1, v3);
  return sub_10000F750();
}

uint64_t sub_10000C010(uint64_t a1)
{
  unint64_t v2 = sub_100007744();

  return static AppEntity.defaultResolverSpecification.getter(a1, v2);
}

uint64_t sub_10000C060(uint64_t a1)
{
  unint64_t v2 = sub_10000CDB0();

  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

uint64_t sub_10000C0AC()
{
  uint64_t v3 = (uint64_t (__cdecl *)())((char *)&dword_1000181C0 + dword_1000181C0);
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_10000C14C;
  return v3();
}

uint64_t sub_10000C14C(uint64_t a1)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 24) = a1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v4 = *(uint64_t (**)(void))(v3 + 8);
    return v4();
  }
  else
  {
    return _swift_task_switch(sub_10000C280, 0, 0);
  }
}

uint64_t sub_10000C280()
{
  id v1 = [*(id *)(v0 + 24) members];
  sub_1000062D0();
  unint64_t v2 = sub_10000F850();

  if (v2 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_10000F8D0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }

  swift_bridgeObjectRelease();
  if (v3) {
    uint64_t v4 = (_UNKNOWN **)&_swiftEmptyArrayStorage;
  }
  else {
    uint64_t v4 = &off_100014AF0;
  }
  uint64_t v5 = *(uint64_t (**)(_UNKNOWN **))(v0 + 8);
  return v5(v4);
}

uint64_t sub_10000C378(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  unint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 24) = v2;
  *unint64_t v2 = v1;
  v2[1] = sub_10000C408;
  return sub_10000C76C();
}

uint64_t sub_10000C408(char a1)
{
  *(unsigned char *)(*(void *)v1 + 32) = a1;
  swift_task_dealloc();
  return _swift_task_switch(sub_10000C508, 0, 0);
}

uint64_t sub_10000C508()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = *(void *)(v1 + 16);
  if (!v2)
  {
    uint64_t v9 = *((void *)&_swiftEmptyArrayStorage + 2);
    if (v9) {
      goto LABEL_14;
    }
    goto LABEL_24;
  }
  uint64_t v3 = (unsigned __int8 *)(v1 + 32);
  swift_bridgeObjectRetain();
  do
  {
    int v7 = *v3++;
    char v6 = v7;
    if (v7)
    {
      char v8 = sub_10000F8F0();
      swift_bridgeObjectRelease();
      if ((v8 & 1) == 0) {
        goto LABEL_6;
      }
    }
    else
    {
      swift_bridgeObjectRelease();
    }
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      sub_10000F360(0, *((void *)&_swiftEmptyArrayStorage + 2) + 1, 1);
    }
    unint64_t v5 = *((void *)&_swiftEmptyArrayStorage + 2);
    unint64_t v4 = *((void *)&_swiftEmptyArrayStorage + 3);
    if (v5 >= v4 >> 1) {
      sub_10000F360((char *)(v4 > 1), v5 + 1, 1);
    }
    *((void *)&_swiftEmptyArrayStorage + 2) = v5 + 1;
    *((unsigned char *)&_swiftEmptyArrayStorage + v5 + 32) = v6;
LABEL_6:
    --v2;
  }
  while (v2);
  swift_bridgeObjectRelease();
  uint64_t v9 = *((void *)&_swiftEmptyArrayStorage + 2);
  if (!v9)
  {
LABEL_24:
    swift_release();
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
    goto LABEL_25;
  }
LABEL_14:
  swift_retain();
  uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  do
  {
    if ((*(unsigned char *)(v0 + 32) & 1) == 0)
    {
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v10 = sub_10000F478(0, *((void *)v10 + 2) + 1, 1, v10);
      }
      unint64_t v12 = *((void *)v10 + 2);
      unint64_t v11 = *((void *)v10 + 3);
      unint64_t v13 = v12 + 1;
      if (v12 >= v11 >> 1) {
        uint64_t v10 = sub_10000F478((char *)(v11 > 1), v12 + 1, 1, v10);
      }
      *((void *)v10 + 2) = v13;
    }
    --v9;
  }
  while (v9);
  swift_release_n();
LABEL_25:
  uint64_t v14 = *(uint64_t (**)(char *))(v0 + 8);
  return v14(v10);
}

uint64_t sub_10000C76C()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_10000AA0C;
  unint64_t v4 = (uint64_t (__cdecl *)())((char *)&dword_1000181C0 + dword_1000181C0);
  uint64_t v2 = (void *)swift_task_alloc();
  v1[2] = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_10000C14C;
  return v4();
}

uint64_t sub_10000C850(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return _swift_task_switch(sub_10000C870, 0, 0);
}

uint64_t sub_10000C870()
{
  **(void **)(v0 + 16) = &off_100014B18;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

unint64_t sub_10000C89C()
{
  unint64_t result = qword_100018410;
  if (!qword_100018410)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018410);
  }
  return result;
}

unint64_t sub_10000C8F4()
{
  unint64_t result = qword_100018418[0];
  if (!qword_100018418[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_100018418);
  }
  return result;
}

uint64_t sub_10000C94C(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  void *v3 = v1;
  v3[1] = sub_10000AD78;
  return sub_10000C378(a1);
}

uint64_t sub_10000C9E0(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 24) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_100004950;
  uint64_t v5 = (uint64_t (__cdecl *)())((char *)&dword_1000181C0 + dword_1000181C0);
  uint64_t v3 = (void *)swift_task_alloc();
  v2[2] = v3;
  void *v3 = v2;
  v3[1] = sub_10000C14C;
  return v5();
}

unint64_t sub_10000CACC()
{
  unint64_t result = qword_100018430;
  if (!qword_100018430)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018430);
  }
  return result;
}

unint64_t sub_10000CB24()
{
  unint64_t result = qword_100018438;
  if (!qword_100018438)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018438);
  }
  return result;
}

unint64_t sub_10000CB7C()
{
  unint64_t result = qword_100018440;
  if (!qword_100018440)
  {
    sub_1000055D8(qword_100018448);
    sub_10000CB24();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018440);
  }
  return result;
}

uint64_t sub_10000CBF0(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_10000B8D0();
  void *v5 = v2;
  v5[1] = sub_1000056D4;
  return EntityQuery.results()(a1, a2, v6);
}

uint64_t sub_10000CCA4(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 24) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_10000B1CC;
  return sub_10000C76C();
}

ValueMetadata *type metadata accessor for SetupFamilyDeepLinkQuery()
{
  return &type metadata for SetupFamilyDeepLinkQuery;
}

ValueMetadata *type metadata accessor for SetupFamilyDeepLink()
{
  return &type metadata for SetupFamilyDeepLink;
}

unint64_t sub_10000CD58()
{
  unint64_t result = qword_100018460;
  if (!qword_100018460)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018460);
  }
  return result;
}

unint64_t sub_10000CDB0()
{
  unint64_t result = qword_100018468;
  if (!qword_100018468)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018468);
  }
  return result;
}

unint64_t sub_10000CE08()
{
  unint64_t result = qword_100018470;
  if (!qword_100018470)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018470);
  }
  return result;
}

unint64_t sub_10000CE60()
{
  unint64_t result = qword_100018480;
  if (!qword_100018480)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018480);
  }
  return result;
}

unint64_t sub_10000CEB4(uint64_t a1)
{
  unint64_t result = sub_100007840();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_10000CEE0()
{
  unint64_t result = qword_100018488;
  if (!qword_100018488)
  {
    sub_1000055D8(&qword_100018490);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018488);
  }
  return result;
}

unint64_t sub_10000CF40()
{
  unint64_t result = qword_100018498;
  if (!qword_100018498)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018498);
  }
  return result;
}

unint64_t sub_10000CF98()
{
  unint64_t result = qword_1000184A0;
  if (!qword_1000184A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000184A0);
  }
  return result;
}

unint64_t sub_10000CFF0()
{
  unint64_t result = qword_1000184A8;
  if (!qword_1000184A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_1000184A8);
  }
  return result;
}

unint64_t sub_10000D048()
{
  unint64_t result = qword_1000184C8;
  if (!qword_1000184C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000184C8);
  }
  return result;
}

unint64_t sub_10000D0A0()
{
  unint64_t result = qword_1000184D0;
  if (!qword_1000184D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000184D0);
  }
  return result;
}

uint64_t sub_10000D0F4()
{
  uint64_t v0 = sub_10000F7A0();
  sub_100007934(v0, qword_100018720);
  sub_100007894(v0, (uint64_t)qword_100018720);
  return sub_10000F780();
}

uint64_t sub_10000D158()
{
  uint64_t v0 = sub_10000616C(&qword_100018240);
  sub_100007934(v0, qword_100018738);
  uint64_t v1 = sub_100007894(v0, (uint64_t)qword_100018738);
  sub_10000F650();
  uint64_t v2 = sub_10000F660();
  uint64_t v3 = *(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56);

  return v3(v1, 0, 1, v2);
}

unint64_t sub_10000D214()
{
  unint64_t result = qword_1000184D8;
  if (!qword_1000184D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000184D8);
  }
  return result;
}

uint64_t sub_10000D268(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_10000D9EC();
  unint64_t v5 = sub_10000DA94();

  return static _URLRepresentableIntent<>.urlRepresentation.getter(a1, v4, a2, v5);
}

unint64_t sub_10000D2D0(uint64_t a1)
{
  unint64_t result = sub_10000D2F8();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_10000D2F8()
{
  unint64_t result = qword_1000184E0;
  if (!qword_1000184E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000184E0);
  }
  return result;
}

unint64_t sub_10000D350()
{
  unint64_t result = qword_1000184E8;
  if (!qword_1000184E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000184E8);
  }
  return result;
}

unint64_t sub_10000D3A8()
{
  unint64_t result = qword_1000184F0;
  if (!qword_1000184F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000184F0);
  }
  return result;
}

uint64_t sub_10000D3FC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10000D44C@<X0>(uint64_t a1@<X8>)
{
  if (qword_100018080 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_10000F7A0();
  uint64_t v3 = sub_100007894(v2, (uint64_t)qword_100018720);
  unint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

uint64_t sub_10000D4F4@<X0>(uint64_t a1@<X8>)
{
  if (qword_100018088 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_10000616C(&qword_100018240);
  uint64_t v3 = sub_100007894(v2, (uint64_t)qword_100018738);

  return sub_1000078CC(v3, a1);
}

uint64_t sub_10000D570(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_10000D9EC();
  unint64_t v7 = sub_10000DA40();
  unint64_t v8 = sub_10000DA94();
  void *v5 = v2;
  v5[1] = sub_1000072B8;
  return _URLRepresentableIntent<>.perform()(a1, a2, v6, v7, v8);
}

uint64_t sub_10000D644@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10000D6B8();
  *a1 = result;
  return result;
}

uint64_t sub_10000D66C(uint64_t a1)
{
  unint64_t v2 = sub_10000D214();

  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

ValueMetadata *type metadata accessor for OpenFamilySubscriptions()
{
  return &type metadata for OpenFamilySubscriptions;
}

uint64_t sub_10000D6B8()
{
  uint64_t v17 = sub_10000F6B0();
  uint64_t v0 = *(void *)(v17 - 8);
  __chkstk_darwin(v17);
  unint64_t v2 = (char *)&v17 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_10000616C(&qword_100018210);
  uint64_t v4 = __chkstk_darwin(v3 - 8);
  unint64_t v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  unint64_t v8 = (char *)&v17 - v7;
  uint64_t v9 = sub_10000616C(&qword_100018188);
  __chkstk_darwin(v9 - 8);
  unint64_t v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_10000F7A0();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  sub_10000616C(&qword_100018500);
  sub_10000F780();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56))(v11, 1, 1, v12);
  char v18 = 1;
  uint64_t v14 = sub_10000F5F0();
  id v15 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56);
  v15(v8, 1, 1, v14);
  v15(v6, 1, 1, v14);
  (*(void (**)(char *, void, uint64_t))(v0 + 104))(v2, enum case for InputConnectionBehavior.default(_:), v17);
  sub_10000D998();
  return sub_10000F640();
}

unint64_t sub_10000D998()
{
  unint64_t result = qword_100018508;
  if (!qword_100018508)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018508);
  }
  return result;
}

unint64_t sub_10000D9EC()
{
  unint64_t result = qword_100018510;
  if (!qword_100018510)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018510);
  }
  return result;
}

unint64_t sub_10000DA40()
{
  unint64_t result = qword_100018518;
  if (!qword_100018518)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018518);
  }
  return result;
}

unint64_t sub_10000DA94()
{
  unint64_t result = qword_100018520;
  if (!qword_100018520)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018520);
  }
  return result;
}

unint64_t sub_10000DAEC()
{
  unint64_t result = qword_100018528;
  if (!qword_100018528)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018528);
  }
  return result;
}

uint64_t sub_10000DB40(unsigned __int8 a1, unsigned __int8 a2)
{
  unint64_t v2 = 0xEB00000000707574;
  unint64_t v3 = 0x6553796C696D6166;
  int v4 = a1;
  if (a1)
  {
    if (a1 == 1) {
      unint64_t v5 = 0xD000000000000011;
    }
    else {
      unint64_t v5 = 0xD000000000000013;
    }
    if (v4 == 1) {
      unint64_t v6 = 0x800000010000FC40;
    }
    else {
      unint64_t v6 = 0x800000010000FC60;
    }
    int v7 = a2;
    if (!a2) {
      goto LABEL_15;
    }
    goto LABEL_9;
  }
  unint64_t v5 = 0x6553796C696D6166;
  unint64_t v6 = 0xEB00000000707574;
  int v7 = a2;
  if (a2)
  {
LABEL_9:
    if (v7 == 1) {
      unint64_t v3 = 0xD000000000000011;
    }
    else {
      unint64_t v3 = 0xD000000000000013;
    }
    if (v7 == 1) {
      unint64_t v2 = 0x800000010000FC40;
    }
    else {
      unint64_t v2 = 0x800000010000FC60;
    }
  }
LABEL_15:
  if (v5 == v3 && v6 == v2) {
    char v8 = 1;
  }
  else {
    char v8 = sub_10000F8F0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_10000DC54()
{
  uint64_t v0 = sub_10000F7D0();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  unint64_t v3 = &v14[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v4 = sub_10000616C(&qword_1000183E0);
  __chkstk_darwin(v4 - 8);
  unint64_t v6 = &v14[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  int v7 = self;
  id v15 = 0;
  id v8 = [v7 urlDestinationTo:2 error:&v15];
  id v9 = v15;
  if (!v8)
  {
    id v12 = v15;
    sub_10000F770();

    swift_willThrow();
    swift_errorRelease();
    (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(v1 + 56))(v6, 1, 1, v0);
    goto LABEL_5;
  }
  uint64_t v10 = v8;
  sub_10000F7C0();
  id v11 = v9;

  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v1 + 32))(v6, v3, v0);
  (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v1 + 56))(v6, 0, 1, v0);
  if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v1 + 48))(v6, 1, v0) == 1)
  {
LABEL_5:
    sub_10000B86C((uint64_t)v6);
    goto LABEL_6;
  }
  sub_10000F7B0();
  (*(void (**)(unsigned char *, uint64_t))(v1 + 8))(v6, v0);
LABEL_6:
  sub_10000D998();
  return sub_10000F740();
}

void sub_10000DED4()
{
  qword_100018768 = (uint64_t)&type metadata for FamilyQuery;
  *(void *)algn_100018770 = &off_100014CA0;
}

uint64_t sub_10000DEF8@<X0>(uint64_t a1@<X8>)
{
  if (qword_100018090 != -1) {
    swift_once();
  }

  return sub_10000B80C((uint64_t)&unk_100018750, a1);
}

uint64_t sub_10000DF64()
{
  sub_10000DA94();
  uint64_t v2 = sub_10000F6C0();
  unint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
  return sub_1000061B0(v3, v0, v2, v1);
}

void sub_10000DFF8(unsigned char *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_10000E004()
{
  uint64_t v0 = sub_10000616C(&qword_100018188);
  __chkstk_darwin(v0 - 8);
  uint64_t v2 = (char *)&v6 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_10000F7A0();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  sub_10000F780();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v4 + 56))(v2, 1, 1, v3);
  return sub_10000F750();
}

uint64_t sub_10000E148(uint64_t a1)
{
  unint64_t v2 = sub_10000D998();

  return static AppEntity.defaultResolverSpecification.getter(a1, v2);
}

uint64_t sub_10000E194()
{
  uint64_t v0 = sub_10000616C(&qword_100018190);
  __chkstk_darwin(v0 - 8);
  unint64_t v2 = (char *)&v10 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_10000616C(&qword_100018188);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10000F7A0();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  sub_10000F780();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v7 + 56))(v5, 1, 1, v6);
  uint64_t v8 = sub_10000F670();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v2, 1, 1, v8);
  return sub_10000F680();
}

uint64_t sub_10000E364(uint64_t a1)
{
  unint64_t v2 = sub_10000F0C8();

  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

uint64_t sub_10000E3B0()
{
  uint64_t v3 = (uint64_t (__cdecl *)())((char *)&dword_1000181C0 + dword_1000181C0);
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_10000E450;
  return v3();
}

uint64_t sub_10000E450(uint64_t a1)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 24) = a1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v4 = *(uint64_t (**)(void))(v3 + 8);
    return v4();
  }
  else
  {
    return _swift_task_switch(sub_10000E584, 0, 0);
  }
}

uint64_t sub_10000E584()
{
  id v1 = [*(id *)(v0 + 24) members];
  sub_1000062D0();
  unint64_t v2 = sub_10000F850();

  if (v2 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_10000F8D0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }

  swift_bridgeObjectRelease();
  if (v3) {
    uint64_t v4 = &off_100014B40;
  }
  else {
    uint64_t v4 = (_UNKNOWN **)&_swiftEmptyArrayStorage;
  }
  uint64_t v5 = *(uint64_t (**)(_UNKNOWN **))(v0 + 8);
  return v5(v4);
}

uint64_t sub_10000E67C(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  unint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 24) = v2;
  *unint64_t v2 = v1;
  v2[1] = sub_10000E70C;
  return sub_10000EA84();
}

uint64_t sub_10000E70C(char a1)
{
  *(unsigned char *)(*(void *)v1 + 32) = a1;
  swift_task_dealloc();
  return _swift_task_switch(sub_10000E80C, 0, 0);
}

uint64_t sub_10000E80C()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = *(void *)(v1 + 16);
  if (!v2)
  {
    uint64_t v9 = *((void *)&_swiftEmptyArrayStorage + 2);
    if (v9) {
      goto LABEL_15;
    }
    goto LABEL_25;
  }
  uint64_t v3 = (unsigned __int8 *)(v1 + 32);
  swift_bridgeObjectRetain();
  do
  {
    int v7 = *v3++;
    int v6 = v7;
    if (v7 && v6 != 1)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      char v8 = sub_10000F8F0();
      swift_bridgeObjectRelease();
      if ((v8 & 1) == 0) {
        goto LABEL_6;
      }
    }
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      sub_10000F360(0, *((void *)&_swiftEmptyArrayStorage + 2) + 1, 1);
    }
    unint64_t v5 = *((void *)&_swiftEmptyArrayStorage + 2);
    unint64_t v4 = *((void *)&_swiftEmptyArrayStorage + 3);
    if (v5 >= v4 >> 1) {
      sub_10000F360((char *)(v4 > 1), v5 + 1, 1);
    }
    *((void *)&_swiftEmptyArrayStorage + 2) = v5 + 1;
    *((unsigned char *)&_swiftEmptyArrayStorage + v5 + 32) = v6;
LABEL_6:
    --v2;
  }
  while (v2);
  swift_bridgeObjectRelease();
  uint64_t v9 = *((void *)&_swiftEmptyArrayStorage + 2);
  if (!v9)
  {
LABEL_25:
    swift_release();
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
    goto LABEL_26;
  }
LABEL_15:
  swift_retain();
  uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  do
  {
    if ((*(unsigned char *)(v0 + 32) & 1) == 0)
    {
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v10 = sub_10000F484(0, *((void *)v10 + 2) + 1, 1, v10, &qword_1000185F8);
      }
      unint64_t v12 = *((void *)v10 + 2);
      unint64_t v11 = *((void *)v10 + 3);
      unint64_t v13 = v12 + 1;
      if (v12 >= v11 >> 1) {
        uint64_t v10 = sub_10000F484((char *)(v11 > 1), v12 + 1, 1, v10, &qword_1000185F8);
      }
      *((void *)v10 + 2) = v13;
    }
    --v9;
  }
  while (v9);
  swift_release_n();
LABEL_26:
  uint64_t v14 = *(uint64_t (**)(char *))(v0 + 8);
  return v14(v10);
}

uint64_t sub_10000EA84()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_10000AA0C;
  unint64_t v4 = (uint64_t (__cdecl *)())((char *)&dword_1000181C0 + dword_1000181C0);
  uint64_t v2 = (void *)swift_task_alloc();
  v1[2] = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_10000E450;
  return v4();
}

uint64_t sub_10000EB68(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return _swift_task_switch(sub_10000EB88, 0, 0);
}

uint64_t sub_10000EB88()
{
  **(void **)(v0 + 16) = &off_100014B68;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

unint64_t sub_10000EBB4()
{
  unint64_t result = qword_100018538;
  if (!qword_100018538)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018538);
  }
  return result;
}

unint64_t sub_10000EC0C()
{
  unint64_t result = qword_100018540[0];
  if (!qword_100018540[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_100018540);
  }
  return result;
}

uint64_t sub_10000EC64(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  void *v3 = v1;
  v3[1] = sub_10000AD78;
  return sub_10000E67C(a1);
}

uint64_t sub_10000ECF8(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 24) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_100004950;
  uint64_t v5 = (uint64_t (__cdecl *)())((char *)&dword_1000181C0 + dword_1000181C0);
  uint64_t v3 = (void *)swift_task_alloc();
  v2[2] = v3;
  void *v3 = v2;
  v3[1] = sub_10000E450;
  return v5();
}

unint64_t sub_10000EDE4()
{
  unint64_t result = qword_100018558;
  if (!qword_100018558)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018558);
  }
  return result;
}

unint64_t sub_10000EE3C()
{
  unint64_t result = qword_100018560;
  if (!qword_100018560)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018560);
  }
  return result;
}

unint64_t sub_10000EE94()
{
  unint64_t result = qword_100018568;
  if (!qword_100018568)
  {
    sub_1000055D8(qword_100018570);
    sub_10000EE3C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018568);
  }
  return result;
}

uint64_t sub_10000EF08(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_10000DAEC();
  void *v5 = v2;
  v5[1] = sub_1000056D4;
  return EntityQuery.results()(a1, a2, v6);
}

uint64_t sub_10000EFBC(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 24) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_10000B1CC;
  return sub_10000EA84();
}

ValueMetadata *type metadata accessor for FamilySubscriptionsDeepLinkQuery()
{
  return &type metadata for FamilySubscriptionsDeepLinkQuery;
}

ValueMetadata *type metadata accessor for FamilySubscriptionsDeepLink()
{
  return &type metadata for FamilySubscriptionsDeepLink;
}

unint64_t sub_10000F070()
{
  unint64_t result = qword_100018588;
  if (!qword_100018588)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018588);
  }
  return result;
}

unint64_t sub_10000F0C8()
{
  unint64_t result = qword_100018590;
  if (!qword_100018590)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018590);
  }
  return result;
}

unint64_t sub_10000F120()
{
  unint64_t result = qword_100018598;
  if (!qword_100018598)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018598);
  }
  return result;
}

unint64_t sub_10000F178()
{
  unint64_t result = qword_1000185A8;
  if (!qword_1000185A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000185A8);
  }
  return result;
}

unint64_t sub_10000F1CC(uint64_t a1)
{
  unint64_t result = sub_10000DA94();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_10000F1F8()
{
  unint64_t result = qword_1000185B0;
  if (!qword_1000185B0)
  {
    sub_1000055D8(&qword_1000185B8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000185B0);
  }
  return result;
}

unint64_t sub_10000F258()
{
  unint64_t result = qword_1000185C0;
  if (!qword_1000185C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000185C0);
  }
  return result;
}

unint64_t sub_10000F2B0()
{
  unint64_t result = qword_1000185C8;
  if (!qword_1000185C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000185C8);
  }
  return result;
}

unint64_t sub_10000F30C()
{
  unint64_t result = qword_1000185D0;
  if (!qword_1000185D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_1000185D0);
  }
  return result;
}

char *sub_10000F360(char *a1, int64_t a2, char a3)
{
  unint64_t result = sub_10000F380(a1, a2, a3, *v3);
  void *v3 = result;
  return result;
}

char *sub_10000F380(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
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
  int64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    int64_t v9 = *((void *)a4 + 2);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    sub_10000616C(&qword_1000185F0);
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
  unint64_t v13 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v12 >= &v13[v8]) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v12, v13, v8);
  }
  swift_release();
  return v10;
}

char *sub_10000F46C(char *a1, int64_t a2, char a3, char *a4)
{
  return sub_10000F484(a1, a2, a3, a4, &qword_100018608);
}

char *sub_10000F478(char *a1, int64_t a2, char a3, char *a4)
{
  return sub_10000F484(a1, a2, a3, a4, &qword_100018600);
}

char *sub_10000F484(char *result, int64_t a2, char a3, char *a4, uint64_t *a5)
{
  char v6 = (char)result;
  if (a3)
  {
    unint64_t v7 = *((void *)a4 + 3);
    int64_t v8 = v7 >> 1;
    if ((uint64_t)(v7 >> 1) < a2)
    {
      if (v8 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
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
  int64_t v9 = *((void *)a4 + 2);
  if (v8 <= v9) {
    int64_t v10 = *((void *)a4 + 2);
  }
  else {
    int64_t v10 = v8;
  }
  if (v10)
  {
    sub_10000616C(a5);
    size_t v11 = (char *)swift_allocObject();
    size_t v12 = j__malloc_size(v11);
    *((void *)v11 + 2) = v9;
    *((void *)v11 + 3) = 2 * v12 - 64;
  }
  else
  {
    size_t v11 = (char *)&_swiftEmptyArrayStorage;
  }
  unint64_t v13 = v11 + 32;
  uint64_t v14 = a4 + 32;
  if (v6)
  {
    if (v11 != a4 || v13 >= &v14[v9]) {
      memmove(v13, v14, v9);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, v9);
  }
  swift_bridgeObjectRelease();
  return v11;
}

uint64_t sub_10000F570()
{
  return static AppIntentInternal.sideEffect.getter();
}

uint64_t sub_10000F580()
{
  return static AppIntentInternal.shortcutsMetadata.getter();
}

uint64_t sub_10000F5A0()
{
  return static AppIntent.parameterSummary.getter();
}

uint64_t sub_10000F5B0()
{
  return static AppIntent.authenticationPolicy.getter();
}

uint64_t sub_10000F5F0()
{
  return type metadata accessor for IntentDialog();
}

uint64_t sub_10000F600()
{
  return IntentParameter.wrappedValue.modify();
}

uint64_t sub_10000F610()
{
  return IntentParameter.wrappedValue.getter();
}

uint64_t sub_10000F620()
{
  return IntentParameter.wrappedValue.setter();
}

uint64_t sub_10000F630()
{
  return IntentParameter<>.init<A>(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:query:)();
}

uint64_t sub_10000F640()
{
  return IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:)();
}

uint64_t sub_10000F650()
{
  return IntentDescription.init(stringLiteral:)();
}

uint64_t sub_10000F660()
{
  return type metadata accessor for IntentDescription();
}

uint64_t sub_10000F670()
{
  return type metadata accessor for DisplayRepresentation.Image();
}

uint64_t sub_10000F680()
{
  return DisplayRepresentation.init(title:subtitle:image:)();
}

uint64_t sub_10000F690()
{
  return static EnumerableEntityQuery.findIntentDescription.getter();
}

uint64_t sub_10000F6A0()
{
  return static DynamicOptionsProvider.useForParameterResolution.getter();
}

uint64_t sub_10000F6B0()
{
  return type metadata accessor for InputConnectionBehavior();
}

uint64_t sub_10000F6C0()
{
  return _URLRepresentableEntity.urlRepresentationParameter.getter();
}

uint64_t sub_10000F6F0()
{
  return static PersistentlyIdentifiable.persistentIdentifier.getter();
}

uint64_t sub_10000F700()
{
  return _EntityURLRepresentation.StringInterpolation.appendInterpolation(_:)();
}

void sub_10000F710(Swift::String a1)
{
}

uint64_t sub_10000F720()
{
  return _EntityURLRepresentation.StringInterpolation.init(literalCapacity:interpolationCount:)();
}

uint64_t sub_10000F730()
{
  return _EntityURLRepresentation.init(stringInterpolation:)();
}

uint64_t sub_10000F740()
{
  return _EntityURLRepresentation.init(_:)();
}

uint64_t sub_10000F750()
{
  return TypeDisplayRepresentation.init(name:numericFormat:)();
}

uint64_t sub_10000F770()
{
  return _convertNSErrorToError(_:)();
}

uint64_t sub_10000F780()
{
  return LocalizedStringResource.init(stringLiteral:)();
}

uint64_t sub_10000F790()
{
  return LocalizedStringResource.init(stringInterpolation:)();
}

uint64_t sub_10000F7A0()
{
  return type metadata accessor for LocalizedStringResource();
}

uint64_t sub_10000F7B0()
{
  return URL.absoluteString.getter();
}

uint64_t sub_10000F7C0()
{
  return static URL._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10000F7D0()
{
  return type metadata accessor for URL();
}

uint64_t sub_10000F7E0()
{
  return static AppExtension.main()();
}

void sub_10000F7F0(Swift::String a1)
{
}

void sub_10000F800(Swift::String a1)
{
}

uint64_t sub_10000F810()
{
  return String.LocalizationValue.StringInterpolation.init(literalCapacity:interpolationCount:)();
}

uint64_t sub_10000F820()
{
  return type metadata accessor for String.LocalizationValue.StringInterpolation();
}

uint64_t sub_10000F830()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10000F840()
{
  return String.hash(into:)();
}

uint64_t sub_10000F850()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10000F860()
{
  return StringProtocol.localizedCaseInsensitiveContains<A>(_:)();
}

uint64_t sub_10000F870()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_10000F880()
{
  return specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
}

uint64_t sub_10000F890()
{
  return specialized ContiguousArray._endMutation()();
}

uint64_t sub_10000F8A0()
{
  return specialized ContiguousArray.reserveCapacity(_:)();
}

uint64_t sub_10000F8B0()
{
  return specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
}

uint64_t sub_10000F8C0()
{
  return specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_10000F8D0()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

Swift::Int sub_10000F8E0(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases, string);
}

uint64_t sub_10000F8F0()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_10000F900()
{
  return Hasher.init(_seed:)();
}

void sub_10000F910(Swift::UInt a1)
{
}

Swift::Int sub_10000F920()
{
  return Hasher._finalize()();
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

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

uint64_t swift_allocError()
{
  return _swift_allocError();
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

uint64_t swift_continuation_init()
{
  return _swift_continuation_init();
}

uint64_t swift_errorInMain()
{
  return _swift_errorInMain();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
}

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
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

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}