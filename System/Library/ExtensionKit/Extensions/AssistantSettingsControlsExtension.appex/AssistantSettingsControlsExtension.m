unint64_t sub_100002B64()
{
  unint64_t result;

  result = qword_1000806A8;
  if (!qword_1000806A8)
  {
    result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000806A8);
  }
  return result;
}

uint64_t sub_100002BB8()
{
  return sub_100005348(&qword_1000806B0);
}

uint64_t type metadata accessor for AssistantLockScreenAccessEntity()
{
  uint64_t result = qword_100080810;
  if (!qword_100080810) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_100002C38()
{
  uint64_t v0 = sub_10005E800();
  sub_1000052E4(v0, qword_1000833C0);
  sub_1000052AC(v0, (uint64_t)qword_1000833C0);
  return sub_10005E7E0();
}

uint64_t sub_100002C9C()
{
  return sub_10005E3F0();
}

uint64_t sub_100002CC0()
{
  return sub_10005E3F0();
}

uint64_t sub_100002CE4(uint64_t a1)
{
  type metadata accessor for AssistantLockScreenAccessEntity();
  __chkstk_darwin();
  sub_100005400(a1, (uint64_t)&v4 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_10005E400();
  return sub_10000550C(a1);
}

void (*sub_100002D74(void *a1))(void *a1)
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_10005E3E0();
  return sub_100002DD0;
}

void sub_100002DD0(void *a1)
{
  v1 = (void *)*a1;
  (*(void (**)(void, void))(*a1 + 32))(*a1, 0);

  free(v1);
}

unint64_t sub_100002E20()
{
  unint64_t result = qword_1000806B8;
  if (!qword_1000806B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000806B8);
  }
  return result;
}

uint64_t sub_100002E74(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_100005464();
  uint64_t v5 = sub_100005348(&qword_100080868);

  return static URLRepresentableIntent<>.urlRepresentation.getter(a1, v4, a2, v5);
}

unint64_t sub_100002EFC()
{
  unint64_t result = qword_1000806C0;
  if (!qword_1000806C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000806C0);
  }
  return result;
}

unint64_t sub_100002F54()
{
  unint64_t result = qword_1000806C8;
  if (!qword_1000806C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000806C8);
  }
  return result;
}

unint64_t sub_100002FAC()
{
  unint64_t result = qword_1000806D0;
  if (!qword_1000806D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000806D0);
  }
  return result;
}

uint64_t sub_100003000()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100003050@<X0>(uint64_t a1@<X8>)
{
  return sub_100004864(&qword_100080238, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_1000833C0, a1);
}

uint64_t sub_100003088()
{
  return 0;
}

uint64_t sub_10000309C(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  unint64_t v5 = sub_100005464();
  unint64_t v6 = sub_1000054B8();
  uint64_t v7 = sub_100005348(&qword_100080868);
  *unint64_t v4 = v2;
  v4[1] = sub_100003184;
  return URLRepresentableIntent<>.perform()(a2, v5, v6, v7);
}

uint64_t sub_100003184()
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

uint64_t sub_10000328C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100004EE4();
  *a1 = result;
  return result;
}

uint64_t sub_1000032B4(uint64_t a1)
{
  unint64_t v2 = sub_100002E20();

  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

unint64_t sub_1000032F4()
{
  unint64_t result = qword_1000806E0;
  if (!qword_1000806E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000806E0);
  }
  return result;
}

uint64_t sub_100003348()
{
  return sub_100005348((unint64_t *)&unk_1000806E8);
}

uint64_t sub_10000337C()
{
  uint64_t v0 = sub_100005268(&qword_100080858);
  __chkstk_darwin(v0 - 8);
  unint64_t v2 = (char *)v12 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12[0] = sub_10005E7F0();
  uint64_t v3 = *(void *)(v12[0] - 8);
  __chkstk_darwin(v12[0]);
  uint64_t v5 = (char *)v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10005E830();
  __chkstk_darwin(v6 - 8);
  uint64_t v7 = sub_10005E990();
  __chkstk_darwin(v7 - 8);
  uint64_t v8 = sub_10005E800();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v10 = sub_10005E780();
  sub_1000052E4(v10, qword_1000833D8);
  sub_1000052AC(v10, (uint64_t)qword_1000833D8);
  sub_10005E980();
  sub_10005E820();
  (*(void (**)(char *, void, void))(v3 + 104))(v5, enum case for LocalizedStringResource.BundleDescription.main(_:), v12[0]);
  sub_10005E810();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(v2, 1, 1, v8);
  return sub_10005E770();
}

uint64_t sub_100003668()
{
  uint64_t v0 = type metadata accessor for AssistantLockScreenAccessEntity();
  sub_1000052E4(v0, qword_1000833F0);
  sub_1000052AC(v0, (uint64_t)qword_1000833F0);
  return sub_1000036B4();
}

uint64_t sub_1000036B4()
{
  uint64_t v0 = sub_100005268(&qword_100080878);
  __chkstk_darwin(v0 - 8);
  unint64_t v2 = (char *)v15 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100005268(&qword_100080858);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10005E800();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  sub_10005E890();
  uint64_t v8 = (void *)sub_10005E880();
  sub_10005E860();

  uint64_t v9 = (void *)sub_10005E880();
  char v10 = sub_10005E870();

  if (v10) {
    unint64_t v11 = 0x100000000000001ELL;
  }
  else {
    unint64_t v11 = 0x9286E22069726953;
  }
  if (v10) {
    unint64_t v12 = 0x800000010005F260;
  }
  else {
    unint64_t v12 = 0xA900000000000020;
  }
  sub_10005E7E0();
  v15[0] = v11;
  v15[1] = v12;
  swift_bridgeObjectRetain();
  v16._countAndFlagsBits = 0xD000000000000016;
  v16._object = (void *)0x800000010005F240;
  sub_10005E9D0(v16);
  swift_bridgeObjectRelease();
  sub_10005E7E0();
  (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v5, 0, 1, v6);
  uint64_t v13 = sub_10005E5F0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v2, 1, 1, v13);
  return sub_10005E610();
}

id sub_100003948()
{
  id result = [self sharedController];
  qword_100083408 = (uint64_t)result;
  return result;
}

uint64_t sub_100003984(uint64_t a1)
{
  if ([*v1 assistantIsEnabled])
  {
    if (qword_100080248 != -1) {
      swift_once();
    }
    uint64_t v4 = type metadata accessor for AssistantLockScreenAccessEntity();
    uint64_t v5 = sub_1000052AC(v4, (uint64_t)qword_1000833F0);
    sub_100005400(v5, a1);
    uint64_t v6 = *(uint64_t (**)(void))(v2 + 8);
  }
  else
  {
    sub_1000053A0();
    swift_allocError();
    *uint64_t v7 = 0xD00000000000002ELL;
    v7[1] = 0x800000010005F210;
    swift_willThrow();
    uint64_t v6 = *(uint64_t (**)(void))(v2 + 8);
  }
  return sub_1000053F4(v6);
}

unint64_t sub_100003AEC()
{
  unint64_t result = qword_1000806F8;
  if (!qword_1000806F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000806F8);
  }
  return result;
}

uint64_t sub_100003B40(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v4;
  unint64_t v5 = sub_100004460();
  *uint64_t v4 = v2;
  v4[1] = sub_100003BF0;
  return _UniqueEntityQuery.allEntities()(a2, v5);
}

uint64_t sub_100003BF0(uint64_t a1)
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

unint64_t sub_100003D08()
{
  unint64_t result = qword_100080708;
  if (!qword_100080708)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100080708);
  }
  return result;
}

unint64_t sub_100003D60()
{
  unint64_t result = qword_100080710;
  if (!qword_100080710)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100080710);
  }
  return result;
}

uint64_t sub_100003DB4()
{
  return sub_100005348(qword_100080718);
}

id sub_100003DE8@<X0>(void *a1@<X8>)
{
  id result = [self sharedController];
  *a1 = result;
  return result;
}

uint64_t sub_100003E2C(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_100004460();
  *uint64_t v5 = v2;
  v5[1] = sub_100003EE0;
  return _UniqueEntityQuery.entities(for:)(a1, a2, v6);
}

uint64_t sub_100003EE0(uint64_t a1)
{
  uint64_t v7 = *v2;
  uint64_t v4 = swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(uint64_t))(v7 + 8);
  if (!v1) {
    uint64_t v4 = a1;
  }
  return v5(v4);
}

uint64_t sub_100003FE0(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v4;
  unint64_t v5 = sub_100004460();
  *uint64_t v4 = v2;
  v4[1] = sub_100005568;
  return _UniqueEntityQuery.suggestedEntities()(a2, v5);
}

unint64_t sub_100004094()
{
  unint64_t result = qword_100080730;
  if (!qword_100080730)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100080730);
  }
  return result;
}

uint64_t sub_1000040E8()
{
  return sub_100005348(&qword_100080738);
}

unint64_t sub_100004120()
{
  unint64_t result = qword_100080740;
  if (!qword_100080740)
  {
    sub_1000041B0(qword_100080748);
    sub_100005348(&qword_100080738);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100080740);
  }
  return result;
}

uint64_t sub_1000041B0(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_1000041F8(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_100003AEC();
  *unint64_t v5 = v2;
  v5[1] = sub_1000042AC;
  return EntityQuery.results()(a1, a2, v6);
}

uint64_t sub_1000042AC()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_1000043A0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_1000042AC;
  return DynamicOptionsProvider.defaultResult()(a1, a2, a3);
}

unint64_t sub_100004460()
{
  unint64_t result = qword_100080760;
  if (!qword_100080760)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100080760);
  }
  return result;
}

uint64_t sub_1000044B4()
{
  return sub_100005348(&qword_100080768);
}

uint64_t sub_1000044E8(uint64_t a1)
{
  uint64_t v2 = sub_100005348(qword_100080718);

  return EntityURLRepresentation.init(_:)(0xD00000000000004ALL, 0x800000010005F1C0, a1, v2);
}

uint64_t sub_100004560()
{
  uint64_t v0 = qword_100080250;
  swift_bridgeObjectRetain();
  return v0;
}

uint64_t sub_100004598()
{
  return sub_100005348(&qword_100080770);
}

uint64_t sub_1000045CC()
{
  return sub_100005348((unint64_t *)&unk_100080778);
}

void *sub_100004600()
{
  return &protocol witness table for String;
}

id sub_10000460C@<X0>(void *a1@<X8>)
{
  if (qword_100080260 != -1) {
    swift_once();
  }
  uint64_t v2 = (void *)qword_100083408;
  *a1 = qword_100083408;

  return v2;
}

uint64_t sub_100004678()
{
  sub_100005348(&qword_100080868);
  uint64_t v2 = sub_10005E6A0();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
  return sub_10000538C(v3, v0, v2, v1);
}

uint64_t sub_100004728()
{
  return sub_100005348(&qword_100080788);
}

uint64_t sub_10000475C()
{
  return sub_100005348(&qword_100080790);
}

uint64_t sub_100004790()
{
  return sub_100005348(&qword_100080798);
}

void *sub_1000047C4()
{
  return &protocol witness table for String;
}

uint64_t sub_1000047D0@<X0>(uint64_t *a1@<X8>)
{
  sub_100005348((unint64_t *)&unk_1000806E8);
  uint64_t result = sub_10005E3D0();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_10000482C@<X0>(uint64_t a1@<X8>)
{
  return sub_100004864(&qword_100080240, (uint64_t (*)(void))&type metadata accessor for TypeDisplayRepresentation, (uint64_t)qword_1000833D8, a1);
}

uint64_t sub_100004864@<X0>(void *a1@<X2>, uint64_t (*a2)(void)@<X3>, uint64_t a3@<X4>, uint64_t a4@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v7 = a2(0);
  uint64_t v8 = sub_1000052AC(v7, a3);
  uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 16);

  return v9(a4, v8, v7);
}

unint64_t sub_10000490C()
{
  unint64_t result = qword_1000807A0;
  if (!qword_1000807A0)
  {
    sub_1000041B0(&qword_1000807A8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000807A0);
  }
  return result;
}

uint64_t sub_100004968(uint64_t a1)
{
  uint64_t v2 = sub_100005348(qword_100080718);

  return static AppEntity.defaultResolverSpecification.getter(a1, v2);
}

uint64_t sub_1000049D0()
{
  return sub_100005348(&qword_1000807B0);
}

uint64_t sub_100004A04@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_10005E620();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);

  return v4(a1, v1, v3);
}

uint64_t sub_100004A6C(uint64_t a1)
{
  uint64_t v2 = sub_100005348(&qword_100080798);

  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

ValueMetadata *type metadata accessor for AssistantLockScreenAccessEntity.AssistantLockScreenAccessEntityQuery()
{
  return &type metadata for AssistantLockScreenAccessEntity.AssistantLockScreenAccessEntityQuery;
}

uint64_t sub_100004AE4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10005E620();
  uint64_t v5 = **(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8);

  return v5(a1, a2, v4);
}

uint64_t sub_100004B50(uint64_t a1)
{
  uint64_t v2 = sub_10005E620();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);

  return v3(a1, v2);
}

uint64_t sub_100004BB4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10005E620();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t sub_100004C18(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10005E620();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t sub_100004C7C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10005E620();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t sub_100004CE0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10005E620();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t sub_100004D44(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100004D58);
}

uint64_t sub_100004D58(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10005E620();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);

  return v5(a1, a2, v4);
}

uint64_t sub_100004DC4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100004DD8);
}

uint64_t sub_100004DD8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10005E620();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);

  return v5(a1, a2, a2, v4);
}

uint64_t sub_100004E48()
{
  uint64_t result = sub_10005E620();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for OpenAssistantLockScreenAccessEntity()
{
  return &type metadata for OpenAssistantLockScreenAccessEntity;
}

uint64_t sub_100004EE4()
{
  uint64_t v21 = sub_10005E720();
  uint64_t v0 = *(void *)(v21 - 8);
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v2 = (char *)&v20 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100005268(&qword_100080848);
  uint64_t v3 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v5 = (char *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  uint64_t v7 = (char *)&v20 - v6;
  uint64_t v8 = sub_100005268(&qword_100080850);
  __chkstk_darwin(v8 - 8);
  char v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_100005268(&qword_100080858);
  __chkstk_darwin(v11 - 8);
  uint64_t v13 = (char *)&v20 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_10005E800();
  uint64_t v15 = *(void *)(v14 - 8);
  __chkstk_darwin(v14);
  uint64_t v20 = sub_100005268(&qword_100080860);
  sub_10005E7E0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v15 + 56))(v13, 1, 1, v14);
  uint64_t v16 = type metadata accessor for AssistantLockScreenAccessEntity();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v10, 1, 1, v16);
  uint64_t v17 = sub_10005E390();
  v18 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56);
  v18(v7, 1, 1, v17);
  v18(v5, 1, 1, v17);
  (*(void (**)(char *, void, uint64_t))(v0 + 104))(v2, enum case for InputConnectionBehavior.default(_:), v21);
  sub_100005348(qword_100080718);
  return sub_10005E420();
}

uint64_t sub_100005268(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_1000052AC(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t *sub_1000052E4(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_100005348(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for AssistantLockScreenAccessEntity();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10000538C(uint64_t (*a1)(uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return a1(a3, a4);
}

unint64_t sub_1000053A0()
{
  unint64_t result = qword_100080870;
  if (!qword_100080870)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100080870);
  }
  return result;
}

uint64_t sub_1000053F4(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_100005400(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for AssistantLockScreenAccessEntity();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_100005464()
{
  unint64_t result = qword_100080880;
  if (!qword_100080880)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100080880);
  }
  return result;
}

unint64_t sub_1000054B8()
{
  unint64_t result = qword_100080888;
  if (!qword_100080888)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100080888);
  }
  return result;
}

uint64_t sub_10000550C(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for AssistantLockScreenAccessEntity();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_100005570()
{
  unint64_t result = qword_1000808A0;
  if (!qword_1000808A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000808A0);
  }
  return result;
}

uint64_t sub_1000055C4()
{
  return sub_100009D58(&qword_1000808A8, (void (*)(uint64_t))type metadata accessor for SiriSuggestionsShowInAppEntity);
}

uint64_t type metadata accessor for SiriSuggestionsShowInAppEntity()
{
  uint64_t result = qword_100080A10;
  if (!qword_100080A10) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_100005658(uint64_t a1)
{
  return sub_100005E9C(a1, qword_100083410);
}

uint64_t sub_10000567C(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for SiriSuggestionsShowInAppEntity();
  __chkstk_darwin(v2 - 8);
  sub_100009BF4(a1, (uint64_t)&v5 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_10005E400();
  return sub_100009C58(a1);
}

void (*sub_10000570C(void *a1))(void *)
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_10005E3E0();
  return sub_100005768;
}

unint64_t sub_100005770()
{
  unint64_t result = qword_1000808B0;
  if (!qword_1000808B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000808B0);
  }
  return result;
}

uint64_t sub_1000057C4(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_100009EA0();
  uint64_t v5 = sub_100009D58(&qword_100080A88, (void (*)(uint64_t))type metadata accessor for SiriSuggestionsShowInAppEntity);

  return static URLRepresentableIntent<>.urlRepresentation.getter(a1, v4, a2, v5);
}

unint64_t sub_100005860()
{
  unint64_t result = qword_1000808B8;
  if (!qword_1000808B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000808B8);
  }
  return result;
}

unint64_t sub_1000058B8()
{
  unint64_t result = qword_1000808C0;
  if (!qword_1000808C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000808C0);
  }
  return result;
}

uint64_t sub_10000590C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100006E60(a1, a2, a3, (void (*)(void))sub_100005770);
}

uint64_t sub_100005924@<X0>(uint64_t a1@<X8>)
{
  return sub_1000085D4(&qword_100080268, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_100083410, a1);
}

uint64_t sub_10000595C(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  unint64_t v5 = sub_100009EA0();
  unint64_t v6 = sub_100009EF4();
  uint64_t v7 = sub_100009D58(&qword_100080A88, (void (*)(uint64_t))type metadata accessor for SiriSuggestionsShowInAppEntity);
  *unint64_t v4 = v2;
  v4[1] = sub_100003184;
  return URLRepresentableIntent<>.perform()(a2, v5, v6, v7);
}

uint64_t sub_100005A58@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100009070();
  *a1 = result;
  return result;
}

uint64_t sub_100005A80(uint64_t a1)
{
  unint64_t v2 = sub_100005770();

  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

unint64_t sub_100005AC0()
{
  unint64_t result = qword_1000808D0;
  if (!qword_1000808D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000808D0);
  }
  return result;
}

uint64_t sub_100005B14()
{
  return sub_100009DAC(&qword_1000808D8, &qword_1000808E0);
}

id sub_100005B50()
{
  id result = [self sharedController];
  qword_100083428 = (uint64_t)result;
  return result;
}

uint64_t sub_100005B8C()
{
  uint64_t v0 = sub_100005268(&qword_100080858);
  __chkstk_darwin(v0 - 8);
  unint64_t v2 = (char *)v12 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12[0] = sub_10005E7F0();
  uint64_t v3 = *(void *)(v12[0] - 8);
  __chkstk_darwin(v12[0]);
  unint64_t v5 = (char *)v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10005E830();
  __chkstk_darwin(v6 - 8);
  uint64_t v7 = sub_10005E990();
  __chkstk_darwin(v7 - 8);
  uint64_t v8 = sub_10005E800();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v10 = sub_10005E780();
  sub_1000052E4(v10, qword_100083430);
  sub_1000052AC(v10, (uint64_t)qword_100083430);
  sub_10005E980();
  sub_10005E820();
  (*(void (**)(char *, void, void))(v3 + 104))(v5, enum case for LocalizedStringResource.BundleDescription.main(_:), v12[0]);
  sub_10005E810();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(v2, 1, 1, v8);
  return sub_10005E770();
}

uint64_t sub_100005E78(uint64_t a1)
{
  return sub_100005E9C(a1, qword_100083448);
}

uint64_t sub_100005E9C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_10005E800();
  sub_1000052E4(v3, a2);
  sub_1000052AC(v3, (uint64_t)a2);
  return sub_10005E7E0();
}

uint64_t sub_100005EFC()
{
  uint64_t v0 = sub_100005268(&qword_100080B20);
  sub_1000052E4(v0, qword_100083460);
  uint64_t v1 = sub_1000052AC(v0, (uint64_t)qword_100083460);
  sub_10005E570();
  uint64_t v2 = sub_10005E580();
  uint64_t v3 = *(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56);

  return v3(v1, 0, 1, v2);
}

uint64_t sub_100005FB4()
{
  uint64_t result = swift_getKeyPath();
  qword_100083478 = result;
  return result;
}

uint64_t sub_100005FDC()
{
  type metadata accessor for SiriSuggestionsShowInAppEntity();

  return swift_retain();
}

uint64_t sub_100006010()
{
  sub_10005E3F0();
  return v1;
}

uint64_t sub_100006044(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  sub_100005268(&qword_100080AF0);
  v3[5] = swift_task_alloc();
  sub_100005268(&qword_100080AF8);
  v3[6] = swift_task_alloc();
  sub_100005268(&qword_100080B00);
  v3[7] = swift_task_alloc();
  uint64_t v4 = sub_10005E390();
  v3[8] = v4;
  v3[9] = *(void *)(v4 - 8);
  v3[10] = swift_task_alloc();
  v3[11] = type metadata accessor for SiriSuggestionsShowInAppEntity();
  v3[12] = swift_task_alloc();
  v3[13] = swift_task_alloc();
  uint64_t v5 = sub_100005268(&qword_100080B08);
  v3[14] = v5;
  v3[15] = *(void *)(v5 - 8);
  v3[16] = swift_task_alloc();
  v3[17] = swift_task_alloc();
  return _swift_task_switch(sub_100006248, 0, 0);
}

uint64_t sub_100006248()
{
  sub_10005E3F0();
  unsigned __int8 v1 = (void *)swift_task_alloc();
  v0[18] = v1;
  uint64_t v2 = sub_100009D58(qword_100080920, (void (*)(uint64_t))type metadata accessor for SiriSuggestionsShowInAppEntity);
  void *v1 = v0;
  v1[1] = sub_100006344;
  uint64_t v3 = v0[17];
  uint64_t v4 = v0[13];
  uint64_t v5 = v0[11];
  return IntentDialog._CapturedContent.init<>(entity:_:)(v3, v4, sub_100006A70, 0, v5, v2);
}

uint64_t sub_100006344()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_100006440, 0, 0);
}

uint64_t sub_100006440()
{
  sub_10005E3F0();
  sub_10005E3F0();
  *(unsigned char *)(v0 + 177) = *(unsigned char *)(v0 + 176);
  if (qword_100080290 != -1) {
    swift_once();
  }
  uint64_t v1 = qword_100083478;
  *(void *)(v0 + 152) = qword_100083478;
  swift_retain();
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 160) = v2;
  uint64_t v3 = sub_100009DAC(&qword_100080AD0, &qword_100080AD8);
  *uint64_t v2 = v0;
  v2[1] = sub_10000658C;
  return AppEntity._setValue<A, B, C>(_:for:)(v0 + 177, v1, &type metadata for Bool, v3);
}

uint64_t sub_10000658C()
{
  uint64_t v2 = *(void *)(*(void *)v1 + 96);
  *(void *)(*(void *)v1 + 168) = v0;
  swift_task_dealloc();
  sub_100009C58(v2);
  swift_release();
  if (v0) {
    uint64_t v3 = sub_100006990;
  }
  else {
    uint64_t v3 = sub_1000066E0;
  }
  return _swift_task_switch(v3, 0, 0);
}

uint64_t sub_1000066E0()
{
  uint64_t v1 = v0[16];
  uint64_t v2 = v0[15];
  uint64_t v11 = v0[13];
  uint64_t v12 = v0[17];
  uint64_t v9 = v0[10];
  uint64_t v10 = v0[14];
  uint64_t v13 = v0[9];
  uint64_t v14 = v0[8];
  uint64_t v3 = v0[5];
  uint64_t v4 = v0[6];
  sub_10005E3F0();
  uint64_t v5 = sub_10005E750();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56))(v4, 1, 1, v5);
  uint64_t v6 = sub_10005E790();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v3, 1, 1, v6);
  sub_100005AC0();
  sub_100009D58(&qword_100080940, (void (*)(uint64_t))type metadata accessor for SiriSuggestionsShowInAppEntity);
  sub_10005E350();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v12, v10);
  sub_10005E370();
  sub_10005E3A0();
  (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v9, v14);
  sub_100009C58(v11);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v12, v10);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v7 = (uint64_t (*)(void))v0[1];
  return v7();
}

uint64_t sub_100006990()
{
  (*(void (**)(void, void))(v0[15] + 8))(v0[17], v0[14]);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_100006A74()
{
  uint64_t v0 = sub_100005268(&qword_100080B10);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100080290 != -1) {
    swift_once();
  }
  swift_retain();
  sub_10005E5D0();
  swift_release();
  type metadata accessor for SiriSuggestionsShowInAppEntity();
  sub_100009D58(&qword_100080940, (void (*)(uint64_t))type metadata accessor for SiriSuggestionsShowInAppEntity);
  sub_100009DAC(&qword_100080B18, &qword_100080B10);
  sub_10005E5C0();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t sub_100006C14@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_10005E3F0();
  *a1 = v3;
  return result;
}

uint64_t sub_100006C50()
{
  return sub_10005E400();
}

void (*sub_100006C88(void *a1))(void *)
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_10005E3E0();
  return sub_100005768;
}

uint64_t sub_100006CE4()
{
  if (qword_100080290 != -1) {
    swift_once();
  }

  return swift_retain();
}

unint64_t sub_100006D44()
{
  return 0xD000000000000015;
}

unint64_t sub_100006D68()
{
  unint64_t result = qword_1000808E8;
  if (!qword_1000808E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000808E8);
  }
  return result;
}

unint64_t sub_100006DC0()
{
  unint64_t result = qword_1000808F0;
  if (!qword_1000808F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000808F0);
  }
  return result;
}

uint64_t sub_100006E14()
{
  return *(void *)(swift_getOpaqueTypeConformance2() + 8);
}

uint64_t sub_100006E48(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100006E60(a1, a2, a3, (void (*)(void))sub_100005AC0);
}

uint64_t sub_100006E60(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100006EB4@<X0>(uint64_t a1@<X8>)
{
  return sub_1000085D4(&qword_100080280, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_100083448, a1);
}

uint64_t sub_100006EF4@<X0>(uint64_t a1@<X8>)
{
  if (qword_100080288 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100005268(&qword_100080B20);
  uint64_t v3 = sub_1000052AC(v2, (uint64_t)qword_100083460);

  return sub_100009E38(v3, a1);
}

uint64_t sub_100006F70(uint64_t a1)
{
  uint64_t v5 = *v1;
  uint64_t v4 = v1[1];
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v6;
  *uint64_t v6 = v2;
  v6[1] = sub_100009F48;
  return sub_100006044(a1, v5, v4);
}

uint64_t sub_10000701C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100009408();
  *a1 = result;
  a1[1] = v3;
  return result;
}

unint64_t sub_100007044()
{
  return 0xD00000000000002FLL;
}

unint64_t sub_100007064()
{
  unint64_t result = qword_100080900;
  if (!qword_100080900)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100080900);
  }
  return result;
}

uint64_t sub_1000070B8(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return _swift_task_switch(sub_1000070D8, 0, 0);
}

uint64_t sub_1000070D8()
{
  if (qword_100080270 != -1) {
    swift_once();
  }
  uint64_t v1 = *(unsigned __int8 **)(v0 + 16);
  uint64_t v2 = (void *)qword_100083428;
  type metadata accessor for SiriSuggestionsShowInAppEntity();
  id v3 = v2;
  NSString v4 = sub_10005E9A0();
  unsigned __int8 v5 = [v3 isShowSuggestionsEnabledInApp:v4];

  unsigned __int8 *v1 = v5;
  uint64_t v6 = *(uint64_t (**)(void))(v0 + 8);
  return v6();
}

uint64_t sub_1000071C8(uint64_t a1, unsigned char *a2)
{
  *(void *)(v2 + 16) = a1;
  *(unsigned char *)(v2 + 24) = *a2;
  return _swift_task_switch(sub_1000071F0, 0, 0);
}

uint64_t sub_1000071F0()
{
  if (qword_100080270 != -1) {
    swift_once();
  }
  uint64_t v1 = *(unsigned __int8 *)(v0 + 24);
  uint64_t v2 = (void *)qword_100083428;
  type metadata accessor for SiriSuggestionsShowInAppEntity();
  id v3 = v2;
  NSString v4 = sub_10005E9A0();
  [v3 setShowSuggestionsInApp:v4 enabled:v1];

  unsigned __int8 v5 = *(uint64_t (**)(void))(v0 + 8);
  return v5();
}

id sub_1000072E0()
{
  id result = [self sharedController];
  qword_100083480 = (uint64_t)result;
  return result;
}

uint64_t sub_10000731C(uint64_t a1)
{
  v1[6] = a1;
  sub_100005268(&qword_100080878);
  v1[7] = swift_task_alloc();
  sub_100005268(&qword_100080858);
  v1[8] = swift_task_alloc();
  uint64_t v2 = sub_10005E800();
  v1[9] = v2;
  v1[10] = *(void *)(v2 - 8);
  v1[11] = swift_task_alloc();
  uint64_t v3 = type metadata accessor for SiriSuggestionsShowInAppEntity();
  v1[12] = v3;
  v1[13] = *(void *)(v3 - 8);
  v1[14] = swift_task_alloc();
  return _swift_task_switch(sub_100007498, 0, 0);
}

uint64_t sub_100007498()
{
  id v1 = [*(id *)(v0 + 48) siriSuggestionClients];
  sub_100009D18();
  sub_100009D58(&qword_100080AB8, (void (*)(uint64_t))sub_100009D18);
  uint64_t v2 = sub_10005EA00();

  unint64_t v36 = v2 & 0xC000000000000001;
  if ((v2 & 0xC000000000000001) == 0)
  {
    uint64_t v3 = *(void *)(v2 + 16);
    if (v3) {
      goto LABEL_3;
    }
LABEL_6:
    swift_bridgeObjectRelease();
LABEL_23:
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    v29 = *(uint64_t (**)(void *))(v0 + 8);
    return v29(_swiftEmptyArrayStorage);
  }
  uint64_t v3 = sub_10005EAB0();
  if (!v3) {
    goto LABEL_6;
  }
LABEL_3:
  sub_10005CD80(0, v3 & ~(v3 >> 63), 0);
  if (v36)
  {
    uint64_t result = sub_10005EA70();
    char v6 = 1;
  }
  else
  {
    uint64_t result = sub_10005D3B8(v2);
    char v6 = v7 & 1;
  }
  uint64_t v41 = result;
  uint64_t v42 = v5;
  char v43 = v6;
  if ((v3 & 0x8000000000000000) == 0)
  {
    uint64_t v30 = v0 + 16;
    uint64_t v32 = *(void *)(v0 + 96);
    uint64_t v33 = *(void *)(v0 + 104);
    uint64_t v8 = *(void *)(v0 + 80);
    uint64_t result = sub_100005268(&qword_1000808E0);
    v31 = (void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v8 + 56);
    uint64_t v34 = v2;
    uint64_t v35 = v0;
    while (v3)
    {
      uint64_t v14 = *(void *)(v0 + 112);
      uint64_t v37 = v3;
      uint64_t v38 = *(void *)(v0 + 64);
      uint64_t v39 = *(void *)(v0 + 72);
      uint64_t v40 = *(void *)(v0 + 56);
      sub_10005D160(v41, v42, v43, v2);
      uint64_t v16 = v15;
      id v17 = [v15 bundleId];
      uint64_t v18 = sub_10005E9B0();
      uint64_t v20 = v19;

      id v21 = [v16 localizedName];
      sub_10005E9B0();

      uint64_t v22 = *(int *)(v32 + 24);
      sub_10005E7E0();
      sub_100009DAC(&qword_100080AD0, &qword_100080AD8);
      *(void *)(v14 + v22) = sub_10005E7C0();
      v23 = (uint64_t *)(v14 + *(int *)(v32 + 20));
      uint64_t *v23 = v18;
      v23[1] = v20;
      sub_10005E7E0();
      (*v31)(v38, 1, 1, v39);
      uint64_t v24 = sub_10005E5F0();
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 56))(v40, 1, 1, v24);
      sub_10005E610();

      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        sub_10005CD80(0, _swiftEmptyArrayStorage[2] + 1, 1);
      }
      unint64_t v26 = _swiftEmptyArrayStorage[2];
      unint64_t v25 = _swiftEmptyArrayStorage[3];
      uint64_t v2 = v34;
      uint64_t v0 = v35;
      if (v26 >= v25 >> 1) {
        sub_10005CD80(v25 > 1, v26 + 1, 1);
      }
      uint64_t v27 = *(void *)(v35 + 112);
      _swiftEmptyArrayStorage[2] = v26 + 1;
      uint64_t result = sub_100009CB4(v27, (uint64_t)_swiftEmptyArrayStorage+ ((*(unsigned __int8 *)(v33 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v33 + 80))+ *(void *)(v33 + 72) * v26);
      if (v36)
      {
        if ((v43 & 1) == 0) {
          goto LABEL_28;
        }
        if (sub_10005EA80()) {
          swift_isUniquelyReferenced_nonNull_native();
        }
        sub_100005268(&qword_100080AE0);
        v28 = (uint64_t (*)(uint64_t, void))sub_10005EA10();
        sub_10005EAD0();
        uint64_t result = v28(v30, 0);
      }
      else
      {
        int64_t v9 = sub_10005D07C(v41, v42, v43, v34);
        uint64_t v11 = v10;
        char v13 = v12;
        uint64_t result = sub_100009DA0(v41, v42, v43);
        uint64_t v41 = v9;
        uint64_t v42 = v11;
        char v43 = v13 & 1;
      }
      uint64_t v3 = v37 - 1;
      if (v37 == 1)
      {
        sub_100009DA0(v41, v42, v43);
        swift_bridgeObjectRelease();
        goto LABEL_23;
      }
    }
    __break(1u);
  }
  __break(1u);
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_1000079C4(uint64_t a1)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v3 = *v1;
  NSString v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v4;
  *NSString v4 = v2;
  v4[1] = sub_100003BF0;
  return sub_10000731C(v3);
}

unint64_t sub_100007A60()
{
  unint64_t result = qword_100080910;
  if (!qword_100080910)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100080910);
  }
  return result;
}

unint64_t sub_100007AB8()
{
  unint64_t result = qword_100080918;
  if (!qword_100080918)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100080918);
  }
  return result;
}

uint64_t sub_100007B0C()
{
  return sub_100009D58(qword_100080920, (void (*)(uint64_t))type metadata accessor for SiriSuggestionsShowInAppEntity);
}

uint64_t sub_100007B54(uint64_t a1)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v3 = *v1;
  NSString v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v4;
  *NSString v4 = v2;
  v4[1] = sub_100007BEC;
  return sub_10000731C(v3);
}

uint64_t sub_100007BEC(uint64_t a1)
{
  uint64_t v4 = *v2;
  uint64_t v5 = *v2;
  *(void *)(*v2 + 32) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v6 = *(uint64_t (**)(void))(v5 + 8);
    return v6();
  }
  else
  {
    *(void *)(v4 + 40) = a1;
    return _swift_task_switch(sub_100007D3C, 0, 0);
  }
}

uint64_t sub_100007D3C()
{
  uint64_t v1 = v0[5];
  uint64_t v2 = (void *)v0[2];
  swift_bridgeObjectRetain();
  uint64_t v3 = sub_10000995C(v1, v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = (uint64_t (*)(uint64_t))v0[1];
  return v4(v3);
}

uint64_t sub_100007DD4(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_100009908();
  *uint64_t v5 = v2;
  v5[1] = sub_1000042AC;
  return EnumerableEntityQuery.suggestedEntities()(a1, a2, v6);
}

unint64_t sub_100007E8C()
{
  unint64_t result = qword_100080938;
  if (!qword_100080938)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100080938);
  }
  return result;
}

uint64_t sub_100007EE0()
{
  return sub_100009D58(&qword_100080940, (void (*)(uint64_t))type metadata accessor for SiriSuggestionsShowInAppEntity);
}

unint64_t sub_100007F2C()
{
  unint64_t result = qword_100080948;
  if (!qword_100080948)
  {
    sub_1000041B0(qword_100080950);
    sub_100009D58(&qword_100080940, (void (*)(uint64_t))type metadata accessor for SiriSuggestionsShowInAppEntity);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100080948);
  }
  return result;
}

uint64_t sub_100007FD0(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_100007064();
  *uint64_t v5 = v2;
  v5[1] = sub_100009F48;
  return EntityQuery.results()(a1, a2, v6);
}

uint64_t sub_100008084()
{
  return sub_100009D58(&qword_100080968, (void (*)(uint64_t))type metadata accessor for SiriSuggestionsShowInAppEntity);
}

uint64_t sub_1000080CC()
{
  return sub_100009D58(&qword_100080970, (void (*)(uint64_t))type metadata accessor for SiriSuggestionsShowInAppEntity);
}

id sub_100008114@<X0>(void *a1@<X8>)
{
  if (qword_100080298 != -1) {
    swift_once();
  }
  uint64_t v2 = (void *)qword_100083480;
  *a1 = qword_100083480;

  return v2;
}

uint64_t sub_100008180()
{
  uint64_t v0 = qword_100080890;
  swift_bridgeObjectRetain();
  return v0;
}

uint64_t sub_1000081B8()
{
  return sub_100009D58(&qword_100080978, (void (*)(uint64_t))type metadata accessor for SiriSuggestionsShowInAppEntity);
}

uint64_t sub_100008200()
{
  uint64_t v0 = sub_100005268(&qword_100080A90);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100005268(&qword_100080A98);
  __chkstk_darwin(v4);
  sub_100009D58(qword_100080920, (void (*)(uint64_t))type metadata accessor for SiriSuggestionsShowInAppEntity);
  sub_10005E6F0();
  v7._object = (void *)0x800000010005F350;
  v7._countAndFlagsBits = 0xD000000000000049;
  sub_10005E6E0(v7);
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, enum case for EntityURLRepresentation.StringInterpolation.Token.id<A>(_:), v0);
  sub_10005E6D0();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  v8._countAndFlagsBits = 0;
  v8._object = (void *)0xE000000000000000;
  sub_10005E6E0(v8);
  return sub_10005E700();
}

uint64_t sub_1000083EC()
{
  return sub_100009D58(&qword_100080980, (void (*)(uint64_t))type metadata accessor for SiriSuggestionsShowInAppEntity);
}

uint64_t sub_100008434()
{
  return sub_100009D58(&qword_100080988, (void (*)(uint64_t))type metadata accessor for SiriSuggestionsShowInAppEntity);
}

uint64_t sub_10000847C()
{
  return sub_100009D58((unint64_t *)&unk_100080990, (void (*)(uint64_t))type metadata accessor for SiriSuggestionsShowInAppEntity);
}

uint64_t sub_1000084C4@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = (void *)(v2 + *(int *)(a1 + 20));
  uint64_t v4 = v3[1];
  *a2 = *v3;
  a2[1] = v4;
  return swift_bridgeObjectRetain();
}

uint64_t sub_1000084D8()
{
  sub_100009D58(&qword_100080A88, (void (*)(uint64_t))type metadata accessor for SiriSuggestionsShowInAppEntity);
  uint64_t v2 = sub_10005E6A0();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
  return sub_10000538C(v3, v0, v2, v1);
}

uint64_t sub_10000859C@<X0>(uint64_t a1@<X8>)
{
  return sub_1000085D4(&qword_100080278, (uint64_t (*)(void))&type metadata accessor for TypeDisplayRepresentation, (uint64_t)qword_100083430, a1);
}

uint64_t sub_1000085D4@<X0>(void *a1@<X2>, uint64_t (*a2)(void)@<X3>, uint64_t a3@<X4>, uint64_t a4@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v7 = a2(0);
  uint64_t v8 = sub_1000052AC(v7, a3);
  int64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 16);

  return v9(a4, v8, v7);
}

uint64_t sub_100008678()
{
  return sub_100009DAC(&qword_1000809A0, &qword_1000809A8);
}

uint64_t sub_1000086B4(uint64_t a1)
{
  uint64_t v2 = sub_100009D58(qword_100080920, (void (*)(uint64_t))type metadata accessor for SiriSuggestionsShowInAppEntity);

  return static AppEntity.defaultResolverSpecification.getter(a1, v2);
}

uint64_t sub_100008730()
{
  return sub_100009D58(&qword_1000809B0, (void (*)(uint64_t))type metadata accessor for SiriSuggestionsShowInAppEntity);
}

uint64_t sub_100008778(uint64_t a1)
{
  uint64_t v2 = sub_100009D58((unint64_t *)&unk_100080990, (void (*)(uint64_t))type metadata accessor for SiriSuggestionsShowInAppEntity);

  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

ValueMetadata *type metadata accessor for SiriSuggestionsShowInAppEntity.SiriSuggestionsShowInAppEntityQuery()
{
  return &type metadata for SiriSuggestionsShowInAppEntity.SiriSuggestionsShowInAppEntityQuery;
}

uint64_t destroy for SiriSuggestionsShowInAppEntity.UpdateIntent_value()
{
  swift_release();

  return swift_release();
}

void *_s34AssistantSettingsControlsExtension30SiriSuggestionsShowInAppEntityV18UpdateIntent_valueVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  swift_retain();
  return a1;
}

void *assignWithCopy for SiriSuggestionsShowInAppEntity.UpdateIntent_value(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  return a1;
}

__n128 initializeWithTake for SiriSuggestionsShowInAppEntity.UpdateIntent_value(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

_OWORD *assignWithTake for SiriSuggestionsShowInAppEntity.UpdateIntent_value(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for SiriSuggestionsShowInAppEntity.UpdateIntent_value(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 16)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SiriSuggestionsShowInAppEntity.UpdateIntent_value(uint64_t result, int a2, int a3)
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
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SiriSuggestionsShowInAppEntity.UpdateIntent_value()
{
  return &type metadata for SiriSuggestionsShowInAppEntity.UpdateIntent_value;
}

uint64_t *sub_1000089BC(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v13 = *a2;
    *a1 = *a2;
    uint64_t v4 = (uint64_t *)(v13 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    uint64_t v7 = sub_10005E620();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(v4, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = *(int *)(a3 + 24);
    uint64_t v10 = (uint64_t *)((char *)v4 + v8);
    uint64_t v11 = (uint64_t *)((char *)a2 + v8);
    uint64_t v12 = v11[1];
    *uint64_t v10 = *v11;
    v10[1] = v12;
    *(uint64_t *)((char *)v4 + v9) = *(uint64_t *)((char *)a2 + v9);
    swift_bridgeObjectRetain();
  }
  swift_retain();
  return v4;
}

uint64_t sub_100008AA0(uint64_t a1)
{
  uint64_t v2 = sub_10005E620();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  swift_bridgeObjectRelease();

  return swift_release();
}

uint64_t sub_100008B24(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_10005E620();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = *(int *)(a3 + 24);
  uint64_t v9 = (void *)(a1 + v7);
  uint64_t v10 = (void *)(a2 + v7);
  uint64_t v11 = v10[1];
  *uint64_t v9 = *v10;
  v9[1] = v11;
  *(void *)(a1 + v8) = *(void *)(a2 + v8);
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

uint64_t sub_100008BBC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_10005E620();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  *uint64_t v8 = *v9;
  v8[1] = v9[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + *(int *)(a3 + 24)) = *(void *)(a2 + *(int *)(a3 + 24));
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_100008C74(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_10005E620();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 24);
  *(_OWORD *)(a1 + *(int *)(a3 + 20)) = *(_OWORD *)(a2 + *(int *)(a3 + 20));
  *(void *)(a1 + v7) = *(void *)(a2 + v7);
  return a1;
}

uint64_t sub_100008CF8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_10005E620();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (uint64_t *)(a2 + v7);
  uint64_t v11 = *v9;
  uint64_t v10 = v9[1];
  *uint64_t v8 = v11;
  v8[1] = v10;
  swift_bridgeObjectRelease();
  *(void *)(a1 + *(int *)(a3 + 24)) = *(void *)(a2 + *(int *)(a3 + 24));
  swift_release();
  return a1;
}

uint64_t sub_100008D98(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100008DAC);
}

uint64_t sub_100008DAC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_10005E620();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20) + 8);
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
}

uint64_t sub_100008E70(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100008E84);
}

uint64_t sub_100008E84(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_10005E620();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20) + 8) = (a2 - 1);
  }
  return result;
}

uint64_t sub_100008F44()
{
  uint64_t result = sub_10005E620();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for OpenSiriSuggestionsShowInAppEntity()
{
  return &type metadata for OpenSiriSuggestionsShowInAppEntity;
}

uint64_t sub_100008FF8()
{
  return sub_100009DAC(&qword_100080A50, &qword_100080A58);
}

uint64_t sub_100009034()
{
  return sub_100009DAC(&qword_100080A60, &qword_100080A58);
}

uint64_t sub_100009070()
{
  uint64_t v22 = sub_10005E720();
  uint64_t v0 = *(void *)(v22 - 8);
  __chkstk_darwin(v22);
  uint64_t v2 = (char *)&v21 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100005268(&qword_100080848);
  uint64_t v4 = __chkstk_darwin(v3 - 8);
  uint64_t v6 = (char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v21 - v7;
  uint64_t v9 = sub_100005268(&qword_100080A70);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100005268(&qword_100080858);
  __chkstk_darwin(v12 - 8);
  uint64_t v14 = (char *)&v21 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_10005E800();
  uint64_t v16 = *(void *)(v15 - 8);
  __chkstk_darwin(v15);
  uint64_t v21 = sub_100005268(&qword_100080A78);
  sub_10005E7E0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v16 + 56))(v14, 1, 1, v15);
  uint64_t v17 = type metadata accessor for SiriSuggestionsShowInAppEntity();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v11, 1, 1, v17);
  uint64_t v18 = sub_10005E390();
  uint64_t v19 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56);
  v19(v8, 1, 1, v18);
  v19(v6, 1, 1, v18);
  (*(void (**)(char *, void, uint64_t))(v0 + 104))(v2, enum case for InputConnectionBehavior.default(_:), v22);
  sub_100009D58(qword_100080920, (void (*)(uint64_t))type metadata accessor for SiriSuggestionsShowInAppEntity);
  return sub_10005E420();
}

uint64_t sub_100009408()
{
  uint64_t v0 = sub_100005268(&qword_100080A68);
  __chkstk_darwin(v0 - 8);
  unint64_t v36 = (char *)v28 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v37 = sub_10005E720();
  uint64_t v2 = *(void *)(v37 - 8);
  __chkstk_darwin(v37);
  uint64_t v4 = (char *)v28 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100005268(&qword_100080848);
  uint64_t v6 = __chkstk_darwin(v5 - 8);
  uint64_t v8 = (char *)v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)v28 - v9;
  uint64_t v11 = sub_100005268(&qword_100080A70);
  __chkstk_darwin(v11 - 8);
  uint64_t v13 = (char *)v28 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28[1] = v13;
  uint64_t v14 = sub_100005268(&qword_100080858);
  __chkstk_darwin(v14 - 8);
  uint64_t v16 = (char *)v28 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v29 = v16;
  uint64_t v17 = sub_10005E800();
  uint64_t v35 = v17;
  uint64_t v18 = *(void *)(v17 - 8);
  __chkstk_darwin(v17);
  uint64_t v33 = sub_100005268(&qword_100080A78);
  sub_10005E7E0();
  uint64_t v34 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v18 + 56);
  v34(v16, 1, 1, v17);
  uint64_t v19 = type metadata accessor for SiriSuggestionsShowInAppEntity();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v13, 1, 1, v19);
  uint64_t v20 = sub_10005E390();
  uint64_t v21 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56);
  v21(v10, 1, 1, v20);
  v21(v8, 1, 1, v20);
  unsigned int v32 = enum case for InputConnectionBehavior.default(_:);
  uint64_t v22 = *(void (**)(void))(v2 + 104);
  uint64_t v30 = v2 + 104;
  v31 = (void (*)(char *, void, uint64_t))v22;
  v22(v4);
  sub_100009D58(qword_100080920, (void (*)(uint64_t))type metadata accessor for SiriSuggestionsShowInAppEntity);
  v23 = v29;
  uint64_t v24 = v10;
  uint64_t v25 = sub_10005E420();
  sub_100005268(&qword_100080A80);
  sub_10005E7E0();
  v34(v23, 1, 1, v35);
  char v38 = 2;
  uint64_t v26 = sub_10005E9F0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v26 - 8) + 56))(v36, 1, 1, v26);
  v21(v24, 1, 1, v20);
  v31(v4, v32, v37);
  sub_10005E430();
  return v25;
}

unint64_t sub_100009908()
{
  unint64_t result = qword_100080AA0;
  if (!qword_100080AA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_100080AA0);
  }
  return result;
}

uint64_t sub_10000995C(uint64_t a1, void *a2)
{
  uint64_t v28 = type metadata accessor for SiriSuggestionsShowInAppEntity();
  uint64_t v5 = __chkstk_darwin(v28);
  uint64_t v31 = (uint64_t)v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v33 = (uint64_t)v25 - v8;
  uint64_t result = (uint64_t)_swiftEmptyArrayStorage;
  uint64_t v34 = _swiftEmptyArrayStorage;
  uint64_t v30 = *(void *)(a1 + 16);
  if (!v30) {
    return result;
  }
  v25[1] = v2;
  uint64_t v10 = 0;
  unint64_t v11 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v32 = *(void *)(v7 + 72);
  uint64_t v29 = a1 + v11;
  uint64_t v26 = a2 + 7;
  unint64_t v27 = v11;
  uint64_t v12 = _swiftEmptyArrayStorage;
  while (1)
  {
    sub_100009BF4(v29 + v32 * v10, v33);
    uint64_t v13 = a2[2];
    if (v13)
    {
      uint64_t v14 = (uint64_t *)(v33 + *(int *)(v28 + 20));
      uint64_t v15 = *v14;
      uint64_t v16 = v14[1];
      uint64_t v17 = a2;
      BOOL v18 = a2[4] == *v14 && a2[5] == v16;
      if (v18 || (uint64_t result = sub_10005EB40(), (result & 1) != 0))
      {
LABEL_11:
        sub_100009CB4(v33, v31);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          sub_10005CD80(0, v12[2] + 1, 1);
        }
        uint64_t v12 = v34;
        unint64_t v20 = v34[2];
        unint64_t v19 = v34[3];
        if (v20 >= v19 >> 1)
        {
          sub_10005CD80(v19 > 1, v20 + 1, 1);
          uint64_t v12 = v34;
        }
        void v12[2] = v20 + 1;
        sub_100009CB4(v31, (uint64_t)v12 + v27 + v20 * v32);
        a2 = v17;
        goto LABEL_4;
      }
      if (v13 != 1) {
        break;
      }
    }
LABEL_3:
    sub_100009C58(v33);
LABEL_4:
    if (++v10 == v30) {
      return (uint64_t)v34;
    }
  }
  uint64_t v21 = v26;
  uint64_t v22 = 1;
  while (1)
  {
    uint64_t v23 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (*(v21 - 1) == v15 && *v21 == v16) {
      goto LABEL_11;
    }
    uint64_t result = sub_10005EB40();
    if (result) {
      goto LABEL_11;
    }
    v21 += 2;
    ++v22;
    BOOL v18 = v23 == v13;
    a2 = v17;
    if (v18) {
      goto LABEL_3;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_100009BF4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SiriSuggestionsShowInAppEntity();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100009C58(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for SiriSuggestionsShowInAppEntity();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100009CB4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SiriSuggestionsShowInAppEntity();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_100009D18()
{
  unint64_t result = qword_100080AB0;
  if (!qword_100080AB0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100080AB0);
  }
  return result;
}

uint64_t sub_100009D58(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100009DA0(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_100009DAC(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_1000041B0(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100009DF0@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  *a2 = *(void *)(a1 + *(int *)(type metadata accessor for SiriSuggestionsShowInAppEntity() + 24));

  return swift_retain();
}

uint64_t sub_100009E38(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100005268(&qword_100080B20);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_100009EA0()
{
  unint64_t result = qword_100080B28;
  if (!qword_100080B28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100080B28);
  }
  return result;
}

unint64_t sub_100009EF4()
{
  unint64_t result = qword_100080B30;
  if (!qword_100080B30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100080B30);
  }
  return result;
}

unint64_t sub_100009F50()
{
  unint64_t result = qword_100080B38;
  if (!qword_100080B38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100080B38);
  }
  return result;
}

uint64_t sub_100009FA4()
{
  return sub_10000BDBC(&qword_100080B40);
}

uint64_t type metadata accessor for AlwaysPrintSiriResponseEntity()
{
  uint64_t result = qword_100080C80;
  if (!qword_100080C80) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_10000A024(uint64_t a1)
{
  return sub_100005E9C(a1, qword_100083488);
}

uint64_t sub_10000A048(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for AlwaysPrintSiriResponseEntity();
  __chkstk_darwin(v2 - 8);
  sub_10000CD98(a1, (uint64_t)&v5 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_10005E400();
  return sub_10000CCF4(a1);
}

unint64_t sub_10000A0DC()
{
  unint64_t result = qword_100080B48;
  if (!qword_100080B48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100080B48);
  }
  return result;
}

uint64_t sub_10000A130(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_10000CDFC();
  uint64_t v5 = sub_10000BDBC(&qword_100080BA0);

  return static URLRepresentableIntent<>.urlRepresentation.getter(a1, v4, a2, v5);
}

unint64_t sub_10000A1B8()
{
  unint64_t result = qword_100080B50;
  if (!qword_100080B50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100080B50);
  }
  return result;
}

unint64_t sub_10000A210()
{
  unint64_t result = qword_100080B58;
  if (!qword_100080B58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100080B58);
  }
  return result;
}

uint64_t sub_10000A264(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_10000B550(a1, a2, a3, (void (*)(void))sub_10000A0DC);
}

uint64_t sub_10000A27C@<X0>(uint64_t a1@<X8>)
{
  return sub_1000085D4(&qword_1000802A0, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_100083488, a1);
}

uint64_t sub_10000A2B4(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  unint64_t v5 = sub_10000CDFC();
  unint64_t v6 = sub_10000CE50();
  uint64_t v7 = sub_10000BDBC(&qword_100080BA0);
  *unint64_t v4 = v2;
  v4[1] = sub_100003184;
  return URLRepresentableIntent<>.perform()(a2, v5, v6, v7);
}

uint64_t sub_10000A39C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10000C488();
  *a1 = result;
  return result;
}

uint64_t sub_10000A3C4(uint64_t a1)
{
  unint64_t v2 = sub_10000A0DC();

  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

unint64_t sub_10000A404()
{
  unint64_t result = qword_100080B68;
  if (!qword_100080B68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100080B68);
  }
  return result;
}

uint64_t sub_10000A458()
{
  return sub_100009DAC(&qword_100080B70, &qword_100080B78);
}

id sub_10000A494()
{
  id result = [self sharedController];
  qword_1000834A0 = (uint64_t)result;
  return result;
}

uint64_t sub_10000A4D0()
{
  uint64_t v0 = sub_100005268(&qword_100080858);
  __chkstk_darwin(v0 - 8);
  unint64_t v2 = (char *)v12 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12[0] = sub_10005E7F0();
  uint64_t v3 = *(void *)(v12[0] - 8);
  __chkstk_darwin(v12[0]);
  unint64_t v5 = (char *)v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10005E830();
  __chkstk_darwin(v6 - 8);
  uint64_t v7 = sub_10005E990();
  __chkstk_darwin(v7 - 8);
  uint64_t v8 = sub_10005E800();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v10 = sub_10005E780();
  sub_1000052E4(v10, qword_1000834A8);
  sub_1000052AC(v10, (uint64_t)qword_1000834A8);
  sub_10005E980();
  sub_10005E820();
  (*(void (**)(char *, void, void))(v3 + 104))(v5, enum case for LocalizedStringResource.BundleDescription.main(_:), v12[0]);
  sub_10005E810();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(v2, 1, 1, v8);
  return sub_10005E770();
}

uint64_t sub_10000A7BC(uint64_t a1)
{
  return sub_100005E9C(a1, qword_1000834C0);
}

uint64_t sub_10000A7E0()
{
  uint64_t v0 = sub_100005268(&qword_100080B20);
  sub_1000052E4(v0, qword_1000834D8);
  uint64_t v1 = sub_1000052AC(v0, (uint64_t)qword_1000834D8);
  sub_10005E570();
  uint64_t v2 = sub_10005E580();
  uint64_t v3 = *(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56);

  return v3(v1, 0, 1, v2);
}

uint64_t sub_10000A898()
{
  uint64_t result = swift_getKeyPath();
  qword_1000834F0 = result;
  return result;
}

uint64_t sub_10000A8C0()
{
  type metadata accessor for AlwaysPrintSiriResponseEntity();

  return swift_retain();
}

uint64_t sub_10000A8F4@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  *a2 = *(void *)(a1 + *(int *)(type metadata accessor for AlwaysPrintSiriResponseEntity() + 20));

  return swift_retain();
}

uint64_t sub_10000A93C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  sub_100005268(&qword_100080AF0);
  v3[5] = swift_task_alloc();
  sub_100005268(&qword_100080AF8);
  v3[6] = swift_task_alloc();
  sub_100005268(&qword_100080CF0);
  v3[7] = swift_task_alloc();
  uint64_t v4 = sub_10005E390();
  v3[8] = v4;
  v3[9] = *(void *)(v4 - 8);
  v3[10] = swift_task_alloc();
  v3[11] = type metadata accessor for AlwaysPrintSiriResponseEntity();
  v3[12] = swift_task_alloc();
  v3[13] = swift_task_alloc();
  uint64_t v5 = sub_100005268(&qword_100080CF8);
  v3[14] = v5;
  v3[15] = *(void *)(v5 - 8);
  v3[16] = swift_task_alloc();
  v3[17] = swift_task_alloc();
  return _swift_task_switch(sub_10000AB40, 0, 0);
}

uint64_t sub_10000AB40()
{
  sub_10005E3F0();
  uint64_t v1 = (void *)swift_task_alloc();
  v0[18] = v1;
  uint64_t v2 = sub_10000BDBC(&qword_100080BB0);
  void *v1 = v0;
  v1[1] = sub_10000AC28;
  uint64_t v3 = v0[17];
  uint64_t v4 = v0[13];
  uint64_t v5 = v0[11];
  return IntentDialog._CapturedContent.init<>(entity:_:)(v3, v4, sub_10000B24C, 0, v5, v2);
}

uint64_t sub_10000AC28()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_10000AD24, 0, 0);
}

uint64_t sub_10000AD24()
{
  sub_10005E3F0();
  sub_10005E3F0();
  *(unsigned char *)(v0 + 177) = *(unsigned char *)(v0 + 176);
  if (qword_1000802C8 != -1) {
    swift_once();
  }
  uint64_t v1 = qword_1000834F0;
  *(void *)(v0 + 152) = qword_1000834F0;
  swift_retain();
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 160) = v2;
  uint64_t v3 = sub_100009DAC(&qword_100080D00, &qword_100080D08);
  *uint64_t v2 = v0;
  v2[1] = sub_10000AE70;
  return AppEntity._setValue<A, B, C>(_:for:)(v0 + 177, v1, &type metadata for Bool, v3);
}

uint64_t sub_10000AE70()
{
  uint64_t v2 = *(void *)(*(void *)v1 + 96);
  *(void *)(*(void *)v1 + 168) = v0;
  swift_task_dealloc();
  sub_10000CCF4(v2);
  swift_release();
  if (v0) {
    uint64_t v3 = sub_100006990;
  }
  else {
    uint64_t v3 = sub_10000AFC4;
  }
  return _swift_task_switch(v3, 0, 0);
}

uint64_t sub_10000AFC4()
{
  uint64_t v1 = v0[15];
  uint64_t v10 = v0[16];
  uint64_t v2 = v0[14];
  uint64_t v11 = v0[13];
  uint64_t v12 = v0[17];
  uint64_t v3 = v0[10];
  uint64_t v14 = v0[8];
  uint64_t v4 = v0[5];
  uint64_t v5 = v0[6];
  uint64_t v13 = v0[9];
  sub_10005E3F0();
  uint64_t v6 = sub_10005E750();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  uint64_t v7 = sub_10005E790();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v4, 1, 1, v7);
  sub_10000A404();
  sub_10000BDBC(&qword_100080C00);
  sub_10005E350();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v1 + 16))(v10, v12, v2);
  sub_10005E370();
  sub_10005E3A0();
  (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v3, v14);
  sub_10000CCF4(v11);
  (*(void (**)(uint64_t, uint64_t))(v1 + 8))(v12, v2);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v8 = (uint64_t (*)(void))v0[1];
  return v8();
}

uint64_t sub_10000B250()
{
  uint64_t v0 = sub_100005268(&qword_100080D10);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1000802C8 != -1) {
    swift_once();
  }
  swift_retain();
  sub_10005E5D0();
  swift_release();
  type metadata accessor for AlwaysPrintSiriResponseEntity();
  sub_10000BDBC(&qword_100080C00);
  sub_100009DAC(&qword_100080D18, &qword_100080D10);
  sub_10005E5C0();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t sub_10000B3DC()
{
  if (qword_1000802C8 != -1) {
    swift_once();
  }

  return swift_retain();
}

unint64_t sub_10000B438()
{
  return 0xD00000000000001BLL;
}

unint64_t sub_10000B458()
{
  unint64_t result = qword_100080B80;
  if (!qword_100080B80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100080B80);
  }
  return result;
}

unint64_t sub_10000B4B0()
{
  unint64_t result = qword_100080B88;
  if (!qword_100080B88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100080B88);
  }
  return result;
}

uint64_t sub_10000B504()
{
  return *(void *)(swift_getOpaqueTypeConformance2() + 8);
}

uint64_t sub_10000B538(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_10000B550(a1, a2, a3, (void (*)(void))sub_10000A404);
}

uint64_t sub_10000B550(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10000B5A4@<X0>(uint64_t a1@<X8>)
{
  return sub_1000085D4(&qword_1000802B8, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_1000834C0, a1);
}

uint64_t sub_10000B5DC@<X0>(uint64_t a1@<X8>)
{
  if (qword_1000802C0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100005268(&qword_100080B20);
  uint64_t v3 = sub_1000052AC(v2, (uint64_t)qword_1000834D8);

  return sub_100009E38(v3, a1);
}

uint64_t sub_10000B658(uint64_t a1)
{
  uint64_t v5 = *v1;
  uint64_t v4 = v1[1];
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v6;
  *uint64_t v6 = v2;
  v6[1] = sub_1000042AC;
  return sub_10000A93C(a1, v5, v4);
}

uint64_t sub_10000B704@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10000C80C();
  *a1 = result;
  a1[1] = v3;
  return result;
}

unint64_t sub_10000B72C()
{
  return 0xD00000000000002ELL;
}

uint64_t sub_10000B748(void *a1)
{
  a1[1] = sub_10000BDBC(&qword_100080B98);
  a1[2] = sub_10000BDBC(&qword_100080BA0);
  uint64_t result = sub_10000BDBC(&qword_100080BA8);
  a1[3] = result;
  return result;
}

uint64_t sub_10000B7D4()
{
  return sub_10000BDBC(&qword_100080BB0);
}

uint64_t sub_10000B808()
{
  return sub_10000BDBC(&qword_100080BB8);
}

uint64_t sub_10000B83C(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return _swift_task_switch(sub_10000B85C, 0, 0);
}

uint64_t sub_10000B85C()
{
  uint64_t v1 = *(unsigned __int8 **)(v0 + 16);
  id v2 = [self sharedController];
  unsigned __int8 v3 = [v2 siriResponseShouldAlwaysPrint];

  unsigned __int8 *v1 = v3;
  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

uint64_t sub_10000B900(uint64_t a1)
{
  uint64_t v2 = sub_10000BDBC(&qword_100080BB0);

  return EntityURLRepresentation.init(_:)(0xD00000000000004CLL, 0x800000010005F590, a1, v2);
}

uint64_t sub_10000B978()
{
  return sub_10000BDBC(&qword_100080BC0);
}

uint64_t sub_10000B9AC()
{
  return sub_10000BDBC(&qword_100080BC8);
}

uint64_t sub_10000B9E0()
{
  return sub_100009DAC(&qword_100080BD0, &qword_100080BD8);
}

uint64_t sub_10000BA1C(uint64_t a1)
{
  uint64_t v2 = sub_10000BDBC(&qword_100080BA8);

  return _UniqueEntityProvider.init(_:)(&unk_1000830B0, 0, a1, v2);
}

uint64_t sub_10000BA94()
{
  return sub_100009DAC((unint64_t *)&unk_100080BE0, &qword_100080BD8);
}

uint64_t sub_10000BAD0()
{
  sub_10000BDBC(&qword_100080BA0);
  uint64_t v2 = sub_10005E6A0();
  unsigned __int8 v3 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
  return sub_10000538C(v3, v0, v2, v1);
}

uint64_t sub_10000BB80()
{
  return sub_10000BDBC(&qword_100080BF0);
}

uint64_t sub_10000BBB4()
{
  return sub_10000BDBC(&qword_100080BF8);
}

uint64_t sub_10000BBE8()
{
  return sub_10000BDBC(&qword_100080C00);
}

uint64_t sub_10000BC1C()
{
  return sub_10000BDBC(&qword_100080C08);
}

uint64_t sub_10000BC50@<X0>(uint64_t *a1@<X8>)
{
  sub_10000BDBC(&qword_100080BA8);
  uint64_t result = sub_10005E3D0();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_10000BCAC@<X0>(uint64_t a1@<X8>)
{
  return sub_1000085D4(&qword_1000802B0, (uint64_t (*)(void))&type metadata accessor for TypeDisplayRepresentation, (uint64_t)qword_1000834A8, a1);
}

uint64_t sub_10000BCE4()
{
  return sub_100009DAC(&qword_100080C10, &qword_100080C18);
}

uint64_t sub_10000BD20(uint64_t a1)
{
  uint64_t v2 = sub_10000BDBC(&qword_100080BB0);

  return static AppEntity.defaultResolverSpecification.getter(a1, v2);
}

uint64_t sub_10000BD88()
{
  return sub_10000BDBC(&qword_100080C20);
}

uint64_t sub_10000BDBC(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for AlwaysPrintSiriResponseEntity();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10000BE00(uint64_t a1)
{
  uint64_t v2 = sub_10000BDBC(&qword_100080C08);

  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

ValueMetadata *type metadata accessor for AlwaysPrintSiriResponseEntity.UpdateIntent_value()
{
  return &type metadata for AlwaysPrintSiriResponseEntity.UpdateIntent_value;
}

uint64_t *sub_10000BE78(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    uint64_t v7 = sub_10005E620();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    *(uint64_t *)((char *)a1 + *(int *)(a3 + 20)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 20));
  }
  swift_retain();
  return a1;
}

uint64_t sub_10000BF44(uint64_t a1)
{
  uint64_t v2 = sub_10005E620();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);

  return swift_release();
}

uint64_t sub_10000BFB8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_10005E620();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  swift_retain();
  return a1;
}

uint64_t sub_10000C038(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_10005E620();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_10000C0C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_10005E620();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t sub_10000C140(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_10005E620();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  swift_release();
  return a1;
}

uint64_t sub_10000C1C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10000C1D8);
}

uint64_t sub_10000C1D8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_10005E620();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20));
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
}

uint64_t sub_10000C298(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10000C2AC);
}

uint64_t sub_10000C2AC(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_10005E620();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20)) = (a2 - 1);
  }
  return result;
}

uint64_t sub_10000C368()
{
  uint64_t result = sub_10005E620();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for OpenAlwaysPrintSiriResponseEntity()
{
  return &type metadata for OpenAlwaysPrintSiriResponseEntity;
}

uint64_t sub_10000C410()
{
  return sub_100009DAC(&qword_100080CB8, &qword_100080CC0);
}

uint64_t sub_10000C44C()
{
  return sub_100009DAC(&qword_100080CC8, &qword_100080CC0);
}

uint64_t sub_10000C488()
{
  uint64_t v22 = sub_10005E720();
  uint64_t v0 = *(void *)(v22 - 8);
  __chkstk_darwin(v22);
  uint64_t v2 = (char *)&v21 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100005268(&qword_100080848);
  uint64_t v4 = __chkstk_darwin(v3 - 8);
  uint64_t v6 = (char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v21 - v7;
  uint64_t v9 = sub_100005268(&qword_100080CD0);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100005268(&qword_100080858);
  __chkstk_darwin(v12 - 8);
  uint64_t v14 = (char *)&v21 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_10005E800();
  uint64_t v16 = *(void *)(v15 - 8);
  __chkstk_darwin(v15);
  uint64_t v21 = sub_100005268(&qword_100080CD8);
  sub_10005E7E0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v16 + 56))(v14, 1, 1, v15);
  uint64_t v17 = type metadata accessor for AlwaysPrintSiriResponseEntity();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v11, 1, 1, v17);
  uint64_t v18 = sub_10005E390();
  unint64_t v19 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56);
  v19(v8, 1, 1, v18);
  v19(v6, 1, 1, v18);
  (*(void (**)(char *, void, uint64_t))(v0 + 104))(v2, enum case for InputConnectionBehavior.default(_:), v22);
  sub_10000BDBC(&qword_100080BB0);
  return sub_10005E420();
}

uint64_t sub_10000C80C()
{
  uint64_t v0 = sub_100005268(&qword_100080A68);
  __chkstk_darwin(v0 - 8);
  uint64_t v34 = (char *)v26 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v35 = sub_10005E720();
  uint64_t v2 = *(void *)(v35 - 8);
  __chkstk_darwin(v35);
  uint64_t v4 = (char *)v26 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100005268(&qword_100080848);
  uint64_t v6 = __chkstk_darwin(v5 - 8);
  uint64_t v8 = (char *)v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)v26 - v9;
  uint64_t v11 = sub_100005268(&qword_100080CD0);
  __chkstk_darwin(v11 - 8);
  uint64_t v13 = (char *)v26 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26[1] = v13;
  uint64_t v14 = sub_100005268(&qword_100080858);
  __chkstk_darwin(v14 - 8);
  uint64_t v16 = (char *)v26 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v27 = v16;
  uint64_t v17 = sub_10005E800();
  uint64_t v33 = v17;
  uint64_t v18 = *(void *)(v17 - 8);
  __chkstk_darwin(v17);
  uint64_t v31 = sub_100005268(&qword_100080CD8);
  sub_10005E7E0();
  uint64_t v32 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v18 + 56);
  v32(v16, 1, 1, v17);
  uint64_t v19 = type metadata accessor for AlwaysPrintSiriResponseEntity();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v13, 1, 1, v19);
  uint64_t v20 = sub_10005E390();
  uint64_t v21 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56);
  v21(v10, 1, 1, v20);
  v21(v8, 1, 1, v20);
  unsigned int v30 = enum case for InputConnectionBehavior.default(_:);
  uint64_t v22 = *(void (**)(void))(v2 + 104);
  uint64_t v28 = v2 + 104;
  uint64_t v29 = (void (*)(char *, void, uint64_t))v22;
  v22(v4);
  sub_10000BDBC(&qword_100080BB0);
  uint64_t v23 = v27;
  uint64_t v31 = sub_10005E420();
  sub_100005268(&qword_100080A80);
  sub_10005E7E0();
  v32(v23, 1, 1, v33);
  char v36 = 2;
  uint64_t v24 = sub_10005E9F0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 56))(v34, 1, 1, v24);
  v21(v10, 1, 1, v20);
  v29(v4, v30, v35);
  sub_10005E430();
  return v31;
}

uint64_t sub_10000CCF4(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for AlwaysPrintSiriResponseEntity();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10000CD50@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  *a2 = *(void *)(a1 + *(int *)(type metadata accessor for AlwaysPrintSiriResponseEntity() + 20));

  return swift_retain();
}

uint64_t sub_10000CD98(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for AlwaysPrintSiriResponseEntity();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_10000CDFC()
{
  unint64_t result = qword_100080D20;
  if (!qword_100080D20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100080D20);
  }
  return result;
}

unint64_t sub_10000CE50()
{
  unint64_t result = qword_100080D28;
  if (!qword_100080D28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100080D28);
  }
  return result;
}

unint64_t sub_10000CEA8()
{
  unint64_t result = qword_100080D30;
  if (!qword_100080D30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100080D30);
  }
  return result;
}

unint64_t sub_10000CF00()
{
  unint64_t result = qword_100080D38;
  if (!qword_100080D38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100080D38);
  }
  return result;
}

uint64_t sub_10000CF54()
{
  uint64_t v0 = sub_10005E800();
  sub_1000052E4(v0, qword_1000834F8);
  sub_1000052AC(v0, (uint64_t)qword_1000834F8);
  return sub_10005E7E0();
}

uint64_t sub_10000CFB8()
{
  return sub_10005E400();
}

unint64_t sub_10000CFE0()
{
  unint64_t result = qword_100080D40;
  if (!qword_100080D40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100080D40);
  }
  return result;
}

uint64_t sub_10000D034(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_10000E688();
  unint64_t v5 = sub_10000E634();

  return static URLRepresentableIntent<>.urlRepresentation.getter(a1, v4, a2, v5);
}

unint64_t sub_10000D0A0()
{
  unint64_t result = qword_100080D48;
  if (!qword_100080D48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100080D48);
  }
  return result;
}

unint64_t sub_10000D0F8()
{
  unint64_t result = qword_100080D50;
  if (!qword_100080D50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100080D50);
  }
  return result;
}

uint64_t sub_10000D14C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10000D19C@<X0>(uint64_t a1@<X8>)
{
  return sub_100004864(&qword_1000802D0, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_1000834F8, a1);
}

uint64_t sub_10000D1D4(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  unint64_t v5 = sub_10000E688();
  unint64_t v6 = sub_10000E6DC();
  unint64_t v7 = sub_10000E634();
  *unint64_t v4 = v2;
  v4[1] = sub_100003184;
  return URLRepresentableIntent<>.perform()(a2, v5, v6, v7);
}

uint64_t sub_10000D2A0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10000E34C();
  *a1 = result;
  return result;
}

uint64_t sub_10000D2C8(uint64_t a1)
{
  unint64_t v2 = sub_10000CFE0();

  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

unint64_t sub_10000D308()
{
  unint64_t result = qword_100080D60;
  if (!qword_100080D60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100080D60);
  }
  return result;
}

unint64_t sub_10000D360()
{
  unint64_t result = qword_100080D68;
  if (!qword_100080D68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100080D68);
  }
  return result;
}

uint64_t sub_10000D3B4()
{
  uint64_t v0 = sub_100005268(&qword_100080858);
  __chkstk_darwin(v0 - 8);
  unint64_t v2 = (char *)v12 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12[0] = sub_10005E7F0();
  uint64_t v3 = *(void *)(v12[0] - 8);
  __chkstk_darwin(v12[0]);
  unint64_t v5 = (char *)v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10005E830();
  __chkstk_darwin(v6 - 8);
  uint64_t v7 = sub_10005E990();
  __chkstk_darwin(v7 - 8);
  uint64_t v8 = sub_10005E800();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v10 = sub_10005E780();
  sub_1000052E4(v10, qword_100083510);
  sub_1000052AC(v10, (uint64_t)qword_100083510);
  sub_10005E980();
  sub_10005E820();
  (*(void (**)(char *, void, void))(v3 + 104))(v5, enum case for LocalizedStringResource.BundleDescription.main(_:), v12[0]);
  sub_10005E810();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(v2, 1, 1, v8);
  return sub_10005E770();
}

uint64_t sub_10000D6A0()
{
  return _swift_task_switch(sub_10000D6BC, 0, 0);
}

uint64_t sub_10000D6BC()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

unint64_t sub_10000D6D8()
{
  unint64_t result = qword_100080D78;
  if (!qword_100080D78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100080D78);
  }
  return result;
}

uint64_t sub_10000D72C(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v4;
  unint64_t v5 = sub_10000DC2C();
  *uint64_t v4 = v2;
  v4[1] = sub_100003BF0;
  return UniqueAppEntityQuery.allEntities()(a2, v5);
}

unint64_t sub_10000D7E0()
{
  unint64_t result = qword_100080D88;
  if (!qword_100080D88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100080D88);
  }
  return result;
}

unint64_t sub_10000D838()
{
  unint64_t result = qword_100080D90;
  if (!qword_100080D90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100080D90);
  }
  return result;
}

unint64_t sub_10000D890()
{
  unint64_t result = qword_100080D98[0];
  if (!qword_100080D98[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_100080D98);
  }
  return result;
}

uint64_t sub_10000D8E8(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_10000DC2C();
  *unint64_t v5 = v2;
  v5[1] = sub_100003EE0;
  return UniqueAppEntityQuery.entities(for:)(a1, a2, v6);
}

uint64_t sub_10000D99C(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v4;
  unint64_t v5 = sub_10000DC2C();
  *uint64_t v4 = v2;
  v4[1] = sub_100005568;
  return UniqueAppEntityQuery.suggestedEntities()(a2, v5);
}

unint64_t sub_10000DA50()
{
  unint64_t result = qword_100080DB0;
  if (!qword_100080DB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100080DB0);
  }
  return result;
}

unint64_t sub_10000DAA8()
{
  unint64_t result = qword_100080DB8;
  if (!qword_100080DB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100080DB8);
  }
  return result;
}

unint64_t sub_10000DB00()
{
  unint64_t result = qword_100080DC0;
  if (!qword_100080DC0)
  {
    sub_1000041B0(qword_100080DC8);
    sub_10000DAA8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100080DC0);
  }
  return result;
}

uint64_t sub_10000DB74(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_10000D6D8();
  *unint64_t v5 = v2;
  v5[1] = sub_1000042AC;
  return EntityQuery.results()(a1, a2, v6);
}

unint64_t sub_10000DC2C()
{
  unint64_t result = qword_100080DE0;
  if (!qword_100080DE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100080DE0);
  }
  return result;
}

unint64_t sub_10000DC84()
{
  unint64_t result = qword_100080DE8;
  if (!qword_100080DE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100080DE8);
  }
  return result;
}

uint64_t sub_10000DCD8(uint64_t a1)
{
  unint64_t v2 = sub_10000D890();

  return EntityURLRepresentation.init(_:)(0xD000000000000048, 0x800000010005F750, a1, v2);
}

unint64_t sub_10000DD3C()
{
  unint64_t result = qword_100080DF0;
  if (!qword_100080DF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100080DF0);
  }
  return result;
}

unint64_t sub_10000DD94()
{
  unint64_t result = qword_100080DF8;
  if (!qword_100080DF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100080DF8);
  }
  return result;
}

uint64_t sub_10000DDE8()
{
  sub_10000E634();
  uint64_t v2 = sub_10005E6A0();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
  return sub_10000538C(v3, v0, v2, v1);
}

unint64_t sub_10000DE80()
{
  unint64_t result = qword_100080E08;
  if (!qword_100080E08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100080E08);
  }
  return result;
}

unint64_t sub_10000DED8()
{
  unint64_t result = qword_100080E10;
  if (!qword_100080E10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100080E10);
  }
  return result;
}

unint64_t sub_10000DF30()
{
  unint64_t result = qword_100080E18;
  if (!qword_100080E18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100080E18);
  }
  return result;
}

uint64_t sub_10000DF84@<X0>(uint64_t *a1@<X8>)
{
  sub_10000D360();
  uint64_t result = sub_10005E240();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_10000DFC4@<X0>(uint64_t a1@<X8>)
{
  return sub_100004864(&qword_1000802D8, (uint64_t (*)(void))&type metadata accessor for TypeDisplayRepresentation, (uint64_t)qword_100083510, a1);
}

unint64_t sub_10000E000()
{
  unint64_t result = qword_100080E20;
  if (!qword_100080E20)
  {
    sub_1000041B0(&qword_100080E28);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100080E20);
  }
  return result;
}

uint64_t sub_10000E05C(uint64_t a1)
{
  unint64_t v2 = sub_10000D890();

  return static AppEntity.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_10000E0AC()
{
  unint64_t result = qword_100080E30;
  if (!qword_100080E30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100080E30);
  }
  return result;
}

uint64_t sub_10000E100()
{
  uint64_t v0 = sub_100005268(&qword_100080878);
  __chkstk_darwin(v0 - 8);
  unint64_t v2 = (char *)&v10 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100005268(&qword_100080858);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10005E800();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  sub_10005E7E0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v7 + 56))(v5, 1, 1, v6);
  uint64_t v8 = sub_10005E5F0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v2, 1, 1, v8);
  return sub_10005E610();
}

uint64_t sub_10000E2D0(uint64_t a1)
{
  unint64_t v2 = sub_10000DF30();

  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

ValueMetadata *type metadata accessor for SiriAppAccessEntity.SiriAppAccessEntityQuery()
{
  return &type metadata for SiriAppAccessEntity.SiriAppAccessEntityQuery;
}

ValueMetadata *type metadata accessor for SiriAppAccessEntity()
{
  return &type metadata for SiriAppAccessEntity;
}

ValueMetadata *type metadata accessor for OpenSiriAppAccessEntity()
{
  return &type metadata for OpenSiriAppAccessEntity;
}

uint64_t sub_10000E34C()
{
  uint64_t v17 = sub_10005E720();
  uint64_t v0 = *(void *)(v17 - 8);
  __chkstk_darwin(v17);
  unint64_t v2 = (char *)&v17 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100005268(&qword_100080848);
  uint64_t v4 = __chkstk_darwin(v3 - 8);
  uint64_t v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v17 - v7;
  uint64_t v9 = sub_100005268(&qword_100080858);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_10005E800();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  sub_100005268(&qword_100080E38);
  sub_10005E7E0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56))(v11, 1, 1, v12);
  char v18 = 1;
  uint64_t v14 = sub_10005E390();
  uint64_t v15 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56);
  v15(v8, 1, 1, v14);
  v15(v6, 1, 1, v14);
  (*(void (**)(char *, void, uint64_t))(v0 + 104))(v2, enum case for InputConnectionBehavior.default(_:), v17);
  sub_10000D890();
  return sub_10005E420();
}

unint64_t sub_10000E634()
{
  unint64_t result = qword_100080E40;
  if (!qword_100080E40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100080E40);
  }
  return result;
}

unint64_t sub_10000E688()
{
  unint64_t result = qword_100080E48;
  if (!qword_100080E48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100080E48);
  }
  return result;
}

unint64_t sub_10000E6DC()
{
  unint64_t result = qword_100080E50;
  if (!qword_100080E50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100080E50);
  }
  return result;
}

unint64_t sub_10000E734()
{
  unint64_t result = qword_100080E68;
  if (!qword_100080E68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100080E68);
  }
  return result;
}

uint64_t sub_10000E788()
{
  return sub_100010364(&qword_100080E70);
}

uint64_t type metadata accessor for SiriLanguageEntity()
{
  uint64_t result = qword_100080FC8;
  if (!qword_100080FC8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_10000E808()
{
  uint64_t v0 = sub_10005E800();
  sub_1000052E4(v0, qword_100083528);
  sub_1000052AC(v0, (uint64_t)qword_100083528);
  return sub_10005E7E0();
}

uint64_t sub_10000E86C(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for SiriLanguageEntity();
  __chkstk_darwin(v2 - 8);
  sub_1000103A8(a1, (uint64_t)&v5 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_10005E400();
  return sub_1000104B4(a1);
}

unint64_t sub_10000E900()
{
  unint64_t result = qword_100080E78;
  if (!qword_100080E78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100080E78);
  }
  return result;
}

uint64_t sub_10000E954(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_10001040C();
  uint64_t v5 = sub_100010364(&qword_100081010);

  return static URLRepresentableIntent<>.urlRepresentation.getter(a1, v4, a2, v5);
}

unint64_t sub_10000E9DC()
{
  unint64_t result = qword_100080E80;
  if (!qword_100080E80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100080E80);
  }
  return result;
}

unint64_t sub_10000EA34()
{
  unint64_t result = qword_100080E88;
  if (!qword_100080E88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100080E88);
  }
  return result;
}

uint64_t sub_10000EA88()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10000EAD8@<X0>(uint64_t a1@<X8>)
{
  return sub_100004864(&qword_1000802E0, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_100083528, a1);
}

uint64_t sub_10000EB10(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  unint64_t v5 = sub_10001040C();
  unint64_t v6 = sub_100010460();
  uint64_t v7 = sub_100010364(&qword_100081010);
  *unint64_t v4 = v2;
  v4[1] = sub_100003184;
  return URLRepresentableIntent<>.perform()(a2, v5, v6, v7);
}

uint64_t sub_10000EBF8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10000FFE0();
  *a1 = result;
  return result;
}

uint64_t sub_10000EC20(uint64_t a1)
{
  unint64_t v2 = sub_10000E900();

  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

unint64_t sub_10000EC60()
{
  unint64_t result = qword_100080E98;
  if (!qword_100080E98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100080E98);
  }
  return result;
}

uint64_t sub_10000ECB4()
{
  return sub_100010364((unint64_t *)&unk_100080EA0);
}

uint64_t sub_10000ECE8()
{
  uint64_t v0 = sub_100005268(&qword_100080858);
  __chkstk_darwin(v0 - 8);
  unint64_t v2 = (char *)v12 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12[0] = sub_10005E7F0();
  uint64_t v3 = *(void *)(v12[0] - 8);
  __chkstk_darwin(v12[0]);
  unint64_t v5 = (char *)v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10005E830();
  __chkstk_darwin(v6 - 8);
  uint64_t v7 = sub_10005E990();
  __chkstk_darwin(v7 - 8);
  uint64_t v8 = sub_10005E800();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v10 = sub_10005E780();
  sub_1000052E4(v10, qword_100083540);
  sub_1000052AC(v10, (uint64_t)qword_100083540);
  sub_10005E980();
  sub_10005E820();
  (*(void (**)(char *, void, void))(v3 + 104))(v5, enum case for LocalizedStringResource.BundleDescription.main(_:), v12[0]);
  sub_10005E810();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(v2, 1, 1, v8);
  return sub_10005E770();
}

uint64_t sub_10000EFCC()
{
  uint64_t v0 = type metadata accessor for SiriLanguageEntity();
  sub_1000052E4(v0, qword_100083558);
  sub_1000052AC(v0, (uint64_t)qword_100083558);
  return sub_10000F018();
}

uint64_t sub_10000F018()
{
  uint64_t v0 = sub_100005268(&qword_100080878);
  __chkstk_darwin(v0 - 8);
  unint64_t v2 = (char *)v15 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100005268(&qword_100080858);
  __chkstk_darwin(v3 - 8);
  unint64_t v5 = (char *)v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10005E800();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  sub_10005E890();
  uint64_t v8 = (void *)sub_10005E880();
  sub_10005E860();

  uint64_t v9 = (void *)sub_10005E880();
  char v10 = sub_10005E870();

  if (v10) {
    unint64_t v11 = 0x100000000000001ELL;
  }
  else {
    unint64_t v11 = 0x9286E22069726953;
  }
  if (v10) {
    unint64_t v12 = 0x800000010005F260;
  }
  else {
    unint64_t v12 = 0xA900000000000020;
  }
  sub_10005E7E0();
  v15[0] = v11;
  v15[1] = v12;
  swift_bridgeObjectRetain();
  v16._countAndFlagsBits = 0x65676175676E614CLL;
  v16._object = (void *)0xE800000000000000;
  sub_10005E9D0(v16);
  swift_bridgeObjectRelease();
  sub_10005E7E0();
  (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v5, 0, 1, v6);
  uint64_t v13 = sub_10005E5F0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v2, 1, 1, v13);
  return sub_10005E610();
}

id sub_10000F2A4()
{
  id result = [self sharedController];
  qword_100083570 = (uint64_t)result;
  return result;
}

uint64_t sub_10000F2E0(uint64_t a1)
{
  if ([*v1 assistantIsEnabled])
  {
    if (qword_1000802F0 != -1) {
      swift_once();
    }
    uint64_t v4 = type metadata accessor for SiriLanguageEntity();
    uint64_t v5 = sub_1000052AC(v4, (uint64_t)qword_100083558);
    sub_1000103A8(v5, a1);
    uint64_t v6 = *(uint64_t (**)(void))(v2 + 8);
  }
  else
  {
    sub_1000053A0();
    swift_allocError();
    *uint64_t v7 = 0xD00000000000002ELL;
    v7[1] = 0x800000010005F210;
    swift_willThrow();
    uint64_t v6 = *(uint64_t (**)(void))(v2 + 8);
  }
  return sub_1000053F4(v6);
}

unint64_t sub_10000F448()
{
  unint64_t result = qword_100080EB0;
  if (!qword_100080EB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100080EB0);
  }
  return result;
}

uint64_t sub_10000F49C(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v4;
  unint64_t v5 = sub_10000F96C();
  *uint64_t v4 = v2;
  v4[1] = sub_100003BF0;
  return _UniqueEntityQuery.allEntities()(a2, v5);
}

unint64_t sub_10000F550()
{
  unint64_t result = qword_100080EC0;
  if (!qword_100080EC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100080EC0);
  }
  return result;
}

unint64_t sub_10000F5A8()
{
  unint64_t result = qword_100080EC8;
  if (!qword_100080EC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100080EC8);
  }
  return result;
}

uint64_t sub_10000F5FC()
{
  return sub_100010364(qword_100080ED0);
}

uint64_t sub_10000F630(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_10000F96C();
  *unint64_t v5 = v2;
  v5[1] = sub_100003EE0;
  return _UniqueEntityQuery.entities(for:)(a1, a2, v6);
}

uint64_t sub_10000F6E4(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v4;
  unint64_t v5 = sub_10000F96C();
  *uint64_t v4 = v2;
  v4[1] = sub_100005568;
  return _UniqueEntityQuery.suggestedEntities()(a2, v5);
}

unint64_t sub_10000F798()
{
  unint64_t result = qword_100080EE8;
  if (!qword_100080EE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100080EE8);
  }
  return result;
}

uint64_t sub_10000F7EC()
{
  return sub_100010364(&qword_100080EF0);
}

unint64_t sub_10000F824()
{
  unint64_t result = qword_100080EF8;
  if (!qword_100080EF8)
  {
    sub_1000041B0(qword_100080F00);
    sub_100010364(&qword_100080EF0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100080EF8);
  }
  return result;
}

uint64_t sub_10000F8B4(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_10000F448();
  *unint64_t v5 = v2;
  v5[1] = sub_1000042AC;
  return EntityQuery.results()(a1, a2, v6);
}

unint64_t sub_10000F96C()
{
  unint64_t result = qword_100080F18;
  if (!qword_100080F18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100080F18);
  }
  return result;
}

uint64_t sub_10000F9C0()
{
  return sub_100010364(&qword_100080F20);
}

uint64_t sub_10000F9F4(uint64_t a1)
{
  uint64_t v2 = sub_100010364(qword_100080ED0);

  return EntityURLRepresentation.init(_:)(0xD000000000000039, 0x800000010005F810, a1, v2);
}

uint64_t sub_10000FA6C()
{
  uint64_t v0 = qword_100080E58;
  swift_bridgeObjectRetain();
  return v0;
}

uint64_t sub_10000FAA4()
{
  return sub_100010364(&qword_100080F28);
}

uint64_t sub_10000FAD8()
{
  return sub_100010364((unint64_t *)&unk_100080F30);
}

id sub_10000FB0C@<X0>(void *a1@<X8>)
{
  if (qword_1000802F8 != -1) {
    swift_once();
  }
  uint64_t v2 = (void *)qword_100083570;
  *a1 = qword_100083570;

  return v2;
}

uint64_t sub_10000FB78()
{
  sub_100010364(&qword_100081010);
  uint64_t v2 = sub_10005E6A0();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
  return sub_10000538C(v3, v0, v2, v1);
}

uint64_t sub_10000FC28()
{
  return sub_100010364(&qword_100080F40);
}

uint64_t sub_10000FC5C()
{
  return sub_100010364(&qword_100080F48);
}

uint64_t sub_10000FC90()
{
  return sub_100010364(&qword_100080F50);
}

uint64_t sub_10000FCC4@<X0>(uint64_t *a1@<X8>)
{
  sub_100010364((unint64_t *)&unk_100080EA0);
  uint64_t result = sub_10005E3D0();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_10000FD20@<X0>(uint64_t a1@<X8>)
{
  return sub_100004864(&qword_1000802E8, (uint64_t (*)(void))&type metadata accessor for TypeDisplayRepresentation, (uint64_t)qword_100083540, a1);
}

unint64_t sub_10000FD5C()
{
  unint64_t result = qword_100080F58;
  if (!qword_100080F58)
  {
    sub_1000041B0(&qword_100080F60);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100080F58);
  }
  return result;
}

uint64_t sub_10000FDB8(uint64_t a1)
{
  uint64_t v2 = sub_100010364(qword_100080ED0);

  return static AppEntity.defaultResolverSpecification.getter(a1, v2);
}

uint64_t sub_10000FE20()
{
  return sub_100010364(&qword_100080F68);
}

uint64_t sub_10000FE54(uint64_t a1)
{
  uint64_t v2 = sub_100010364(&qword_100080F50);

  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

ValueMetadata *type metadata accessor for SiriLanguageEntity.SiriLanguageEntityQuery()
{
  return &type metadata for SiriLanguageEntity.SiriLanguageEntityQuery;
}

uint64_t sub_10000FECC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10000FEE0);
}

uint64_t sub_10000FEE0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10005E620();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);

  return v5(a1, a2, v4);
}

uint64_t sub_10000FF4C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10000FF60);
}

uint64_t sub_10000FF60(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10005E620();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);

  return v5(a1, a2, a2, v4);
}

ValueMetadata *type metadata accessor for OpenSiriLanguageEntity()
{
  return &type metadata for OpenSiriLanguageEntity;
}

uint64_t sub_10000FFE0()
{
  uint64_t v22 = sub_10005E720();
  uint64_t v0 = *(void *)(v22 - 8);
  __chkstk_darwin(v22);
  uint64_t v2 = (char *)&v21 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100005268(&qword_100080848);
  uint64_t v4 = __chkstk_darwin(v3 - 8);
  unint64_t v6 = (char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v21 - v7;
  uint64_t v9 = sub_100005268(&qword_100081000);
  __chkstk_darwin(v9 - 8);
  unint64_t v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100005268(&qword_100080858);
  __chkstk_darwin(v12 - 8);
  uint64_t v14 = (char *)&v21 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_10005E800();
  uint64_t v16 = *(void *)(v15 - 8);
  __chkstk_darwin(v15);
  uint64_t v21 = sub_100005268(&qword_100081008);
  sub_10005E7E0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v16 + 56))(v14, 1, 1, v15);
  uint64_t v17 = type metadata accessor for SiriLanguageEntity();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v11, 1, 1, v17);
  uint64_t v18 = sub_10005E390();
  uint64_t v19 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56);
  v19(v8, 1, 1, v18);
  v19(v6, 1, 1, v18);
  (*(void (**)(char *, void, uint64_t))(v0 + 104))(v2, enum case for InputConnectionBehavior.default(_:), v22);
  sub_100010364(qword_100080ED0);
  return sub_10005E420();
}

uint64_t sub_100010364(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for SiriLanguageEntity();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1000103A8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SiriLanguageEntity();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_10001040C()
{
  unint64_t result = qword_100081018;
  if (!qword_100081018)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100081018);
  }
  return result;
}

unint64_t sub_100010460()
{
  unint64_t result = qword_100081020;
  if (!qword_100081020)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100081020);
  }
  return result;
}

uint64_t sub_1000104B4(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for SiriLanguageEntity();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_100010514()
{
  unint64_t result = qword_100081038;
  if (!qword_100081038)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100081038);
  }
  return result;
}

uint64_t sub_100010568()
{
  return sub_100012188(&qword_100081040);
}

uint64_t type metadata accessor for SiriAndDictationHistoryEntity()
{
  uint64_t result = qword_100081198;
  if (!qword_100081198) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1000105E8()
{
  uint64_t v0 = sub_10005E800();
  sub_1000052E4(v0, qword_100083578);
  sub_1000052AC(v0, (uint64_t)qword_100083578);
  return sub_10005E7E0();
}

uint64_t sub_10001064C(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for SiriAndDictationHistoryEntity();
  __chkstk_darwin(v2 - 8);
  sub_1000121CC(a1, (uint64_t)&v5 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_10005E400();
  return sub_1000122D8(a1);
}

unint64_t sub_1000106E0()
{
  unint64_t result = qword_100081048;
  if (!qword_100081048)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100081048);
  }
  return result;
}

uint64_t sub_100010734(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_100012230();
  uint64_t v5 = sub_100012188(&qword_1000811E0);

  return static URLRepresentableIntent<>.urlRepresentation.getter(a1, v4, a2, v5);
}

unint64_t sub_1000107BC()
{
  unint64_t result = qword_100081050;
  if (!qword_100081050)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100081050);
  }
  return result;
}

unint64_t sub_100010814()
{
  unint64_t result = qword_100081058;
  if (!qword_100081058)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100081058);
  }
  return result;
}

uint64_t sub_100010868()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1000108B8@<X0>(uint64_t a1@<X8>)
{
  return sub_100004864(&qword_100080300, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_100083578, a1);
}

uint64_t sub_1000108F0(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  unint64_t v5 = sub_100012230();
  unint64_t v6 = sub_100012284();
  uint64_t v7 = sub_100012188(&qword_1000811E0);
  *unint64_t v4 = v2;
  v4[1] = sub_100003184;
  return URLRepresentableIntent<>.perform()(a2, v5, v6, v7);
}

uint64_t sub_1000109D8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100011E04();
  *a1 = result;
  return result;
}

uint64_t sub_100010A00(uint64_t a1)
{
  unint64_t v2 = sub_1000106E0();

  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

unint64_t sub_100010A40()
{
  unint64_t result = qword_100081068;
  if (!qword_100081068)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100081068);
  }
  return result;
}

uint64_t sub_100010A94()
{
  return sub_100012188((unint64_t *)&unk_100081070);
}

uint64_t sub_100010AC8()
{
  uint64_t v0 = sub_100005268(&qword_100080858);
  __chkstk_darwin(v0 - 8);
  unint64_t v2 = (char *)v12 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12[0] = sub_10005E7F0();
  uint64_t v3 = *(void *)(v12[0] - 8);
  __chkstk_darwin(v12[0]);
  unint64_t v5 = (char *)v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10005E830();
  __chkstk_darwin(v6 - 8);
  uint64_t v7 = sub_10005E990();
  __chkstk_darwin(v7 - 8);
  uint64_t v8 = sub_10005E800();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v10 = sub_10005E780();
  sub_1000052E4(v10, qword_100083590);
  sub_1000052AC(v10, (uint64_t)qword_100083590);
  sub_10005E980();
  sub_10005E820();
  (*(void (**)(char *, void, void))(v3 + 104))(v5, enum case for LocalizedStringResource.BundleDescription.main(_:), v12[0]);
  sub_10005E810();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(v2, 1, 1, v8);
  return sub_10005E770();
}

uint64_t sub_100010DB4()
{
  uint64_t v0 = type metadata accessor for SiriAndDictationHistoryEntity();
  sub_1000052E4(v0, qword_1000835A8);
  sub_1000052AC(v0, (uint64_t)qword_1000835A8);
  return sub_100010E00();
}

uint64_t sub_100010E00()
{
  uint64_t v0 = sub_100005268(&qword_100080878);
  __chkstk_darwin(v0 - 8);
  unint64_t v2 = (char *)v15 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100005268(&qword_100080858);
  __chkstk_darwin(v3 - 8);
  unint64_t v5 = (char *)v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10005E800();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  sub_10005E890();
  uint64_t v8 = (void *)sub_10005E880();
  sub_10005E860();

  uint64_t v9 = (void *)sub_10005E880();
  char v10 = sub_10005E870();

  if (v10) {
    unint64_t v11 = 0x100000000000001ELL;
  }
  else {
    unint64_t v11 = 0x9286E22069726953;
  }
  if (v10) {
    unint64_t v12 = 0x800000010005F260;
  }
  else {
    unint64_t v12 = 0xA900000000000020;
  }
  sub_10005E7E0();
  v15[0] = v11;
  v15[1] = v12;
  swift_bridgeObjectRetain();
  v16._countAndFlagsBits = 0xD000000000000018;
  v16._object = (void *)0x800000010005F940;
  sub_10005E9D0(v16);
  swift_bridgeObjectRelease();
  sub_10005E7E0();
  (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v5, 0, 1, v6);
  uint64_t v13 = sub_10005E5F0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v2, 1, 1, v13);
  return sub_10005E610();
}

id sub_100011094()
{
  id result = [self sharedController];
  qword_1000835C0 = (uint64_t)result;
  return result;
}

uint64_t sub_1000110D0(uint64_t a1)
{
  if ([*v1 assistantIsEnabled])
  {
    if (qword_100080310 != -1) {
      swift_once();
    }
    uint64_t v4 = type metadata accessor for SiriAndDictationHistoryEntity();
    uint64_t v5 = sub_1000052AC(v4, (uint64_t)qword_1000835A8);
    sub_1000121CC(v5, a1);
    uint64_t v6 = *(uint64_t (**)(void))(v2 + 8);
  }
  else
  {
    sub_1000053A0();
    swift_allocError();
    *uint64_t v7 = 0xD00000000000002ELL;
    v7[1] = 0x800000010005F210;
    swift_willThrow();
    uint64_t v6 = *(uint64_t (**)(void))(v2 + 8);
  }
  return sub_1000053F4(v6);
}

unint64_t sub_100011238()
{
  unint64_t result = qword_100081080;
  if (!qword_100081080)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100081080);
  }
  return result;
}

uint64_t sub_10001128C(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v4;
  unint64_t v5 = sub_10001175C();
  *uint64_t v4 = v2;
  v4[1] = sub_100003BF0;
  return _UniqueEntityQuery.allEntities()(a2, v5);
}

unint64_t sub_100011340()
{
  unint64_t result = qword_100081090;
  if (!qword_100081090)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100081090);
  }
  return result;
}

unint64_t sub_100011398()
{
  unint64_t result = qword_100081098;
  if (!qword_100081098)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100081098);
  }
  return result;
}

uint64_t sub_1000113EC()
{
  return sub_100012188(qword_1000810A0);
}

uint64_t sub_100011420(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_10001175C();
  *unint64_t v5 = v2;
  v5[1] = sub_100003EE0;
  return _UniqueEntityQuery.entities(for:)(a1, a2, v6);
}

uint64_t sub_1000114D4(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v4;
  unint64_t v5 = sub_10001175C();
  *uint64_t v4 = v2;
  v4[1] = sub_100005568;
  return _UniqueEntityQuery.suggestedEntities()(a2, v5);
}

unint64_t sub_100011588()
{
  unint64_t result = qword_1000810B8;
  if (!qword_1000810B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000810B8);
  }
  return result;
}

uint64_t sub_1000115DC()
{
  return sub_100012188(&qword_1000810C0);
}

unint64_t sub_100011614()
{
  unint64_t result = qword_1000810C8;
  if (!qword_1000810C8)
  {
    sub_1000041B0(qword_1000810D0);
    sub_100012188(&qword_1000810C0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000810C8);
  }
  return result;
}

uint64_t sub_1000116A4(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_100011238();
  *unint64_t v5 = v2;
  v5[1] = sub_1000042AC;
  return EntityQuery.results()(a1, a2, v6);
}

unint64_t sub_10001175C()
{
  unint64_t result = qword_1000810E8;
  if (!qword_1000810E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000810E8);
  }
  return result;
}

uint64_t sub_1000117B0()
{
  return sub_100012188(&qword_1000810F0);
}

uint64_t sub_1000117E4(uint64_t a1)
{
  uint64_t v2 = sub_100012188(qword_1000810A0);

  return EntityURLRepresentation.init(_:)(0xD000000000000035, 0x800000010005F900, a1, v2);
}

uint64_t sub_10001185C()
{
  uint64_t v0 = qword_100081028;
  swift_bridgeObjectRetain();
  return v0;
}

uint64_t sub_100011894()
{
  return sub_100012188(&qword_100081040);
}

uint64_t sub_1000118C8()
{
  return sub_100012188(&qword_1000810F8);
}

uint64_t sub_1000118FC()
{
  return sub_100012188((unint64_t *)&unk_100081100);
}

id sub_100011930@<X0>(void *a1@<X8>)
{
  if (qword_100080318 != -1) {
    swift_once();
  }
  uint64_t v2 = (void *)qword_1000835C0;
  *a1 = qword_1000835C0;

  return v2;
}

uint64_t sub_10001199C()
{
  sub_100012188(&qword_1000811E0);
  uint64_t v2 = sub_10005E6A0();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
  return sub_10000538C(v3, v0, v2, v1);
}

uint64_t sub_100011A4C()
{
  return sub_100012188(&qword_100081110);
}

uint64_t sub_100011A80()
{
  return sub_100012188(&qword_100081118);
}

uint64_t sub_100011AB4()
{
  return sub_100012188(&qword_100081120);
}

uint64_t sub_100011AE8@<X0>(uint64_t *a1@<X8>)
{
  sub_100012188((unint64_t *)&unk_100081070);
  uint64_t result = sub_10005E3D0();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_100011B44@<X0>(uint64_t a1@<X8>)
{
  return sub_100004864(&qword_100080308, (uint64_t (*)(void))&type metadata accessor for TypeDisplayRepresentation, (uint64_t)qword_100083590, a1);
}

unint64_t sub_100011B80()
{
  unint64_t result = qword_100081128;
  if (!qword_100081128)
  {
    sub_1000041B0(&qword_100081130);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100081128);
  }
  return result;
}

uint64_t sub_100011BDC(uint64_t a1)
{
  uint64_t v2 = sub_100012188(qword_1000810A0);

  return static AppEntity.defaultResolverSpecification.getter(a1, v2);
}

uint64_t sub_100011C44()
{
  return sub_100012188(&qword_100081138);
}

uint64_t sub_100011C78(uint64_t a1)
{
  uint64_t v2 = sub_100012188(&qword_100081120);

  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

ValueMetadata *type metadata accessor for SiriAndDictationHistoryEntity.SiriAndDictationHistoryEntityQuery()
{
  return &type metadata for SiriAndDictationHistoryEntity.SiriAndDictationHistoryEntityQuery;
}

uint64_t sub_100011CF0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100011D04);
}

uint64_t sub_100011D04(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10005E620();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);

  return v5(a1, a2, v4);
}

uint64_t sub_100011D70(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100011D84);
}

uint64_t sub_100011D84(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10005E620();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);

  return v5(a1, a2, a2, v4);
}

ValueMetadata *type metadata accessor for OpenSiriAndDictationHistoryEntity()
{
  return &type metadata for OpenSiriAndDictationHistoryEntity;
}

uint64_t sub_100011E04()
{
  uint64_t v22 = sub_10005E720();
  uint64_t v0 = *(void *)(v22 - 8);
  __chkstk_darwin(v22);
  uint64_t v2 = (char *)&v21 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100005268(&qword_100080848);
  uint64_t v4 = __chkstk_darwin(v3 - 8);
  unint64_t v6 = (char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v21 - v7;
  uint64_t v9 = sub_100005268(&qword_1000811D0);
  __chkstk_darwin(v9 - 8);
  unint64_t v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100005268(&qword_100080858);
  __chkstk_darwin(v12 - 8);
  uint64_t v14 = (char *)&v21 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_10005E800();
  uint64_t v16 = *(void *)(v15 - 8);
  __chkstk_darwin(v15);
  uint64_t v21 = sub_100005268(&qword_1000811D8);
  sub_10005E7E0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v16 + 56))(v14, 1, 1, v15);
  uint64_t v17 = type metadata accessor for SiriAndDictationHistoryEntity();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v11, 1, 1, v17);
  uint64_t v18 = sub_10005E390();
  uint64_t v19 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56);
  v19(v8, 1, 1, v18);
  v19(v6, 1, 1, v18);
  (*(void (**)(char *, void, uint64_t))(v0 + 104))(v2, enum case for InputConnectionBehavior.default(_:), v22);
  sub_100012188(qword_1000810A0);
  return sub_10005E420();
}

uint64_t sub_100012188(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for SiriAndDictationHistoryEntity();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1000121CC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SiriAndDictationHistoryEntity();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_100012230()
{
  unint64_t result = qword_1000811E8;
  if (!qword_1000811E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000811E8);
  }
  return result;
}

unint64_t sub_100012284()
{
  unint64_t result = qword_1000811F0;
  if (!qword_1000811F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000811F0);
  }
  return result;
}

uint64_t sub_1000122D8(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for SiriAndDictationHistoryEntity();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_100012338()
{
  unint64_t result = qword_1000811F8;
  if (!qword_1000811F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000811F8);
  }
  return result;
}

uint64_t sub_10001238C()
{
  return sub_100014590(&qword_100081200);
}

uint64_t type metadata accessor for AlwaysShowSpeechEntity()
{
  uint64_t result = qword_100081340;
  if (!qword_100081340) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_10001240C(uint64_t a1)
{
  return sub_100005E9C(a1, qword_1000835C8);
}

uint64_t sub_100012430(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for AlwaysShowSpeechEntity();
  __chkstk_darwin(v2 - 8);
  sub_100015188(a1, (uint64_t)&v5 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_10005E400();
  return sub_1000150E4(a1);
}

unint64_t sub_1000124C4()
{
  unint64_t result = qword_100081208;
  if (!qword_100081208)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100081208);
  }
  return result;
}

uint64_t sub_100012518(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_1000151EC();
  uint64_t v5 = sub_100014590(&qword_100081260);

  return static URLRepresentableIntent<>.urlRepresentation.getter(a1, v4, a2, v5);
}

unint64_t sub_1000125A0()
{
  unint64_t result = qword_100081210;
  if (!qword_100081210)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100081210);
  }
  return result;
}

unint64_t sub_1000125F8()
{
  unint64_t result = qword_100081218;
  if (!qword_100081218)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100081218);
  }
  return result;
}

uint64_t sub_10001264C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100013920(a1, a2, a3, (void (*)(void))sub_1000124C4);
}

uint64_t sub_100012664@<X0>(uint64_t a1@<X8>)
{
  return sub_1000085D4(&qword_100080320, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_1000835C8, a1);
}

uint64_t sub_10001269C(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  unint64_t v5 = sub_1000151EC();
  unint64_t v6 = sub_100015240();
  uint64_t v7 = sub_100014590(&qword_100081260);
  *unint64_t v4 = v2;
  v4[1] = sub_100003184;
  return URLRepresentableIntent<>.perform()(a2, v5, v6, v7);
}

uint64_t sub_100012784@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100014878();
  *a1 = result;
  return result;
}

uint64_t sub_1000127AC(uint64_t a1)
{
  unint64_t v2 = sub_1000124C4();

  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

unint64_t sub_1000127EC()
{
  unint64_t result = qword_100081228;
  if (!qword_100081228)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100081228);
  }
  return result;
}

uint64_t sub_100012840()
{
  return sub_100009DAC(&qword_100081230, &qword_100081238);
}

id sub_10001287C()
{
  id result = [self sharedController];
  qword_1000835E0 = (uint64_t)result;
  return result;
}

uint64_t sub_1000128B8()
{
  uint64_t v0 = sub_100005268(&qword_100080858);
  __chkstk_darwin(v0 - 8);
  unint64_t v2 = (char *)v12 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12[0] = sub_10005E7F0();
  uint64_t v3 = *(void *)(v12[0] - 8);
  __chkstk_darwin(v12[0]);
  unint64_t v5 = (char *)v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10005E830();
  __chkstk_darwin(v6 - 8);
  uint64_t v7 = sub_10005E990();
  __chkstk_darwin(v7 - 8);
  uint64_t v8 = sub_10005E800();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v10 = sub_10005E780();
  sub_1000052E4(v10, qword_1000835E8);
  sub_1000052AC(v10, (uint64_t)qword_1000835E8);
  sub_10005E980();
  sub_10005E820();
  (*(void (**)(char *, void, void))(v3 + 104))(v5, enum case for LocalizedStringResource.BundleDescription.main(_:), v12[0]);
  sub_10005E810();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(v2, 1, 1, v8);
  return sub_10005E770();
}

uint64_t sub_100012BA8(uint64_t a1)
{
  return sub_100005E9C(a1, qword_100083600);
}

uint64_t sub_100012BCC()
{
  uint64_t v0 = sub_100005268(&qword_100080B20);
  sub_1000052E4(v0, qword_100083618);
  uint64_t v1 = sub_1000052AC(v0, (uint64_t)qword_100083618);
  sub_10005E570();
  uint64_t v2 = sub_10005E580();
  uint64_t v3 = *(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56);

  return v3(v1, 0, 1, v2);
}

uint64_t sub_100012C84()
{
  uint64_t result = swift_getKeyPath();
  qword_100083630 = result;
  return result;
}

uint64_t sub_100012CAC()
{
  type metadata accessor for AlwaysShowSpeechEntity();

  return swift_retain();
}

uint64_t sub_100012CE0@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  *a2 = *(void *)(a1 + *(int *)(type metadata accessor for AlwaysShowSpeechEntity() + 20));

  return swift_retain();
}

uint64_t sub_100012D28(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  sub_100005268(&qword_100080AF0);
  v3[5] = swift_task_alloc();
  sub_100005268(&qword_100080AF8);
  v3[6] = swift_task_alloc();
  sub_100005268(&qword_1000813C8);
  v3[7] = swift_task_alloc();
  uint64_t v4 = sub_10005E390();
  v3[8] = v4;
  v3[9] = *(void *)(v4 - 8);
  v3[10] = swift_task_alloc();
  v3[11] = type metadata accessor for AlwaysShowSpeechEntity();
  v3[12] = swift_task_alloc();
  v3[13] = swift_task_alloc();
  uint64_t v5 = sub_100005268(&qword_1000813D0);
  v3[14] = v5;
  v3[15] = *(void *)(v5 - 8);
  v3[16] = swift_task_alloc();
  v3[17] = swift_task_alloc();
  return _swift_task_switch(sub_100012F2C, 0, 0);
}

uint64_t sub_100012F2C()
{
  sub_10005E3F0();
  uint64_t v1 = (void *)swift_task_alloc();
  v0[18] = v1;
  uint64_t v2 = sub_100014590(&qword_100081270);
  void *v1 = v0;
  v1[1] = sub_100013014;
  uint64_t v3 = v0[17];
  uint64_t v4 = v0[13];
  uint64_t v5 = v0[11];
  return IntentDialog._CapturedContent.init<>(entity:_:)(v3, v4, sub_100013638, 0, v5, v2);
}

uint64_t sub_100013014()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_100013110, 0, 0);
}

uint64_t sub_100013110()
{
  sub_10005E3F0();
  sub_10005E3F0();
  *(unsigned char *)(v0 + 177) = *(unsigned char *)(v0 + 176);
  if (qword_100080348 != -1) {
    swift_once();
  }
  uint64_t v1 = qword_100083630;
  *(void *)(v0 + 152) = qword_100083630;
  swift_retain();
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 160) = v2;
  uint64_t v3 = sub_100009DAC(&qword_1000813B0, &qword_1000813B8);
  *uint64_t v2 = v0;
  v2[1] = sub_10001325C;
  return AppEntity._setValue<A, B, C>(_:for:)(v0 + 177, v1, &type metadata for Bool, v3);
}

uint64_t sub_10001325C()
{
  uint64_t v2 = *(void *)(*(void *)v1 + 96);
  *(void *)(*(void *)v1 + 168) = v0;
  swift_task_dealloc();
  sub_1000150E4(v2);
  swift_release();
  if (v0) {
    uint64_t v3 = sub_100006990;
  }
  else {
    uint64_t v3 = sub_1000133B0;
  }
  return _swift_task_switch(v3, 0, 0);
}

uint64_t sub_1000133B0()
{
  uint64_t v1 = v0[15];
  uint64_t v10 = v0[16];
  uint64_t v2 = v0[14];
  uint64_t v11 = v0[13];
  uint64_t v12 = v0[17];
  uint64_t v3 = v0[10];
  uint64_t v14 = v0[8];
  uint64_t v4 = v0[5];
  uint64_t v5 = v0[6];
  uint64_t v13 = v0[9];
  sub_10005E3F0();
  uint64_t v6 = sub_10005E750();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  uint64_t v7 = sub_10005E790();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v4, 1, 1, v7);
  sub_1000127EC();
  sub_100014590(&qword_1000812C0);
  sub_10005E350();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v1 + 16))(v10, v12, v2);
  sub_10005E370();
  sub_10005E3A0();
  (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v3, v14);
  sub_1000150E4(v11);
  (*(void (**)(uint64_t, uint64_t))(v1 + 8))(v12, v2);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v8 = (uint64_t (*)(void))v0[1];
  return v8();
}

uint64_t sub_10001363C()
{
  uint64_t v0 = sub_100005268(&qword_1000813D8);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100080348 != -1) {
    swift_once();
  }
  swift_retain();
  sub_10005E5D0();
  swift_release();
  type metadata accessor for AlwaysShowSpeechEntity();
  sub_100014590(&qword_1000812C0);
  sub_100009DAC(&qword_1000813E0, &qword_1000813D8);
  sub_10005E5C0();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t sub_1000137C8()
{
  if (qword_100080348 != -1) {
    swift_once();
  }

  return swift_retain();
}

unint64_t sub_100013828()
{
  unint64_t result = qword_100081240;
  if (!qword_100081240)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100081240);
  }
  return result;
}

unint64_t sub_100013880()
{
  unint64_t result = qword_100081248;
  if (!qword_100081248)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100081248);
  }
  return result;
}

uint64_t sub_1000138D4()
{
  return *(void *)(swift_getOpaqueTypeConformance2() + 8);
}

uint64_t sub_100013908(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100013920(a1, a2, a3, (void (*)(void))sub_1000127EC);
}

uint64_t sub_100013920(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100013974@<X0>(uint64_t a1@<X8>)
{
  return sub_1000085D4(&qword_100080338, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_100083600, a1);
}

uint64_t sub_1000139AC@<X0>(uint64_t a1@<X8>)
{
  if (qword_100080340 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100005268(&qword_100080B20);
  uint64_t v3 = sub_1000052AC(v2, (uint64_t)qword_100083618);

  return sub_100009E38(v3, a1);
}

uint64_t sub_100013A28(uint64_t a1)
{
  uint64_t v5 = *v1;
  uint64_t v4 = v1[1];
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v6;
  *uint64_t v6 = v2;
  v6[1] = sub_1000042AC;
  return sub_100012D28(a1, v5, v4);
}

uint64_t sub_100013AD4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100014BFC();
  *a1 = result;
  a1[1] = v3;
  return result;
}

unint64_t sub_100013AFC()
{
  return 0xD000000000000027;
}

uint64_t sub_100013B18(void *a1)
{
  a1[1] = sub_100014590(&qword_100081258);
  a1[2] = sub_100014590(&qword_100081260);
  uint64_t result = sub_100014590(&qword_100081268);
  a1[3] = result;
  return result;
}

uint64_t sub_100013BA4()
{
  return sub_100014590(&qword_100081270);
}

uint64_t sub_100013BD8()
{
  return sub_100014590(&qword_100081278);
}

uint64_t sub_100013C0C(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return _swift_task_switch(sub_100013C2C, 0, 0);
}

uint64_t sub_100013C2C()
{
  uint64_t v1 = *(unsigned __int8 **)(v0 + 16);
  id v2 = [self sharedController];
  unsigned __int8 v3 = [v2 alwaysShowRecognizedSpeech];

  unsigned __int8 *v1 = v3;
  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

uint64_t sub_100013CD0(uint64_t a1, unsigned char *a2)
{
  *(unsigned char *)(v2 + 16) = *a2;
  return _swift_task_switch(sub_100013CF4, 0, 0);
}

uint64_t sub_100013CF4()
{
  uint64_t v1 = *(unsigned __int8 *)(v0 + 16);
  id v2 = [self sharedController];
  [v2 setAlwaysShowRecognizedSpeech:v1];

  unsigned __int8 v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

uint64_t sub_100013D8C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_100005268(&qword_100080878);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)v18 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100005268(&qword_100080858);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_10005E800();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  sub_10005E890();
  uint64_t v10 = (void *)sub_10005E880();
  sub_10005E860();

  uint64_t v11 = (void *)sub_10005E880();
  char v12 = sub_10005E870();

  if (v12) {
    unint64_t v13 = 0x100000000000001ELL;
  }
  else {
    unint64_t v13 = 0x9286E22069726953;
  }
  if (v12) {
    unint64_t v14 = 0x800000010005F260;
  }
  else {
    unint64_t v14 = 0xA900000000000020;
  }
  sub_10005E7E0();
  v18[0] = v13;
  v18[1] = v14;
  swift_bridgeObjectRetain();
  v19._countAndFlagsBits = 0xD000000000000012;
  v19._object = (void *)0x800000010005FA80;
  sub_10005E9D0(v19);
  swift_bridgeObjectRelease();
  sub_10005E7E0();
  (*(void (**)(char *, void, uint64_t, uint64_t))(v9 + 56))(v7, 0, 1, v8);
  uint64_t v15 = sub_10005E5F0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v4, 1, 1, v15);
  sub_10005E610();
  uint64_t v16 = *(int *)(type metadata accessor for AlwaysShowSpeechEntity() + 20);
  sub_100005268(&qword_100081238);
  sub_10005E7E0();
  sub_100009DAC(&qword_1000813B0, &qword_1000813B8);
  uint64_t result = sub_10005E7C0();
  *(void *)(a1 + v16) = result;
  return result;
}

uint64_t sub_1000140D4(uint64_t a1)
{
  uint64_t v2 = sub_100014590(&qword_100081270);

  return EntityURLRepresentation.init(_:)(0xD000000000000054, 0x800000010005FAC0, a1, v2);
}

uint64_t sub_10001414C()
{
  return sub_100014590(&qword_100081280);
}

uint64_t sub_100014180()
{
  return sub_100014590(&qword_100081288);
}

uint64_t sub_1000141B4()
{
  return sub_100009DAC(&qword_100081290, &qword_100081298);
}

uint64_t sub_1000141F0(uint64_t a1)
{
  uint64_t v2 = sub_100014590(&qword_100081268);

  return _UniqueEntityProvider.init(_:)(&unk_1000830A8, 0, a1, v2);
}

uint64_t sub_100014268()
{
  return sub_100009DAC((unint64_t *)&unk_1000812A0, &qword_100081298);
}

uint64_t sub_1000142A4()
{
  sub_100014590(&qword_100081260);
  uint64_t v2 = sub_10005E6A0();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
  return sub_10000538C(v3, v0, v2, v1);
}

uint64_t sub_100014354()
{
  return sub_100014590(&qword_1000812B0);
}

uint64_t sub_100014388()
{
  return sub_100014590(&qword_1000812B8);
}

uint64_t sub_1000143BC()
{
  return sub_100014590(&qword_1000812C0);
}

uint64_t sub_1000143F0()
{
  return sub_100014590(&qword_1000812C8);
}

uint64_t sub_100014424@<X0>(uint64_t *a1@<X8>)
{
  sub_100014590(&qword_100081268);
  uint64_t result = sub_10005E3D0();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_100014480@<X0>(uint64_t a1@<X8>)
{
  return sub_1000085D4(&qword_100080330, (uint64_t (*)(void))&type metadata accessor for TypeDisplayRepresentation, (uint64_t)qword_1000835E8, a1);
}

uint64_t sub_1000144B8()
{
  return sub_100009DAC(&qword_1000812D0, &qword_1000812D8);
}

uint64_t sub_1000144F4(uint64_t a1)
{
  uint64_t v2 = sub_100014590(&qword_100081270);

  return static AppEntity.defaultResolverSpecification.getter(a1, v2);
}

uint64_t sub_10001455C()
{
  return sub_100014590(&qword_1000812E0);
}

uint64_t sub_100014590(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for AlwaysShowSpeechEntity();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1000145D4(uint64_t a1)
{
  uint64_t v2 = sub_100014590(&qword_1000812C8);

  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

ValueMetadata *type metadata accessor for AlwaysShowSpeechEntity.UpdateIntent_value()
{
  return &type metadata for AlwaysShowSpeechEntity.UpdateIntent_value;
}

uint64_t sub_10001464C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100014660);
}

uint64_t sub_100014660(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_10005E620();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20));
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
}

uint64_t sub_100014720(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100014734);
}

uint64_t sub_100014734(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_10005E620();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20)) = (a2 - 1);
  }
  return result;
}

ValueMetadata *type metadata accessor for OpenAlwaysShowSpeechEntity()
{
  return &type metadata for OpenAlwaysShowSpeechEntity;
}

uint64_t sub_100014800()
{
  return sub_100009DAC(&qword_100081378, &qword_100081380);
}

uint64_t sub_10001483C()
{
  return sub_100009DAC(&qword_100081388, &qword_100081380);
}

uint64_t sub_100014878()
{
  uint64_t v22 = sub_10005E720();
  uint64_t v0 = *(void *)(v22 - 8);
  __chkstk_darwin(v22);
  uint64_t v2 = (char *)&v21 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100005268(&qword_100080848);
  uint64_t v4 = __chkstk_darwin(v3 - 8);
  uint64_t v6 = (char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v21 - v7;
  uint64_t v9 = sub_100005268(&qword_100081390);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100005268(&qword_100080858);
  __chkstk_darwin(v12 - 8);
  unint64_t v14 = (char *)&v21 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_10005E800();
  uint64_t v16 = *(void *)(v15 - 8);
  __chkstk_darwin(v15);
  uint64_t v21 = sub_100005268(&qword_100081398);
  sub_10005E7E0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v16 + 56))(v14, 1, 1, v15);
  uint64_t v17 = type metadata accessor for AlwaysShowSpeechEntity();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v11, 1, 1, v17);
  uint64_t v18 = sub_10005E390();
  Swift::String v19 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56);
  v19(v8, 1, 1, v18);
  v19(v6, 1, 1, v18);
  (*(void (**)(char *, void, uint64_t))(v0 + 104))(v2, enum case for InputConnectionBehavior.default(_:), v22);
  sub_100014590(&qword_100081270);
  return sub_10005E420();
}

uint64_t sub_100014BFC()
{
  uint64_t v0 = sub_100005268(&qword_100080A68);
  __chkstk_darwin(v0 - 8);
  uint64_t v34 = (char *)v26 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v35 = sub_10005E720();
  uint64_t v2 = *(void *)(v35 - 8);
  __chkstk_darwin(v35);
  uint64_t v4 = (char *)v26 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100005268(&qword_100080848);
  uint64_t v6 = __chkstk_darwin(v5 - 8);
  uint64_t v8 = (char *)v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)v26 - v9;
  uint64_t v11 = sub_100005268(&qword_100081390);
  __chkstk_darwin(v11 - 8);
  uint64_t v13 = (char *)v26 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26[1] = v13;
  uint64_t v14 = sub_100005268(&qword_100080858);
  __chkstk_darwin(v14 - 8);
  uint64_t v16 = (char *)v26 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v27 = v16;
  uint64_t v17 = sub_10005E800();
  uint64_t v33 = v17;
  uint64_t v18 = *(void *)(v17 - 8);
  __chkstk_darwin(v17);
  uint64_t v31 = sub_100005268(&qword_100081398);
  sub_10005E7E0();
  uint64_t v32 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v18 + 56);
  v32(v16, 1, 1, v17);
  uint64_t v19 = type metadata accessor for AlwaysShowSpeechEntity();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v13, 1, 1, v19);
  uint64_t v20 = sub_10005E390();
  uint64_t v21 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56);
  v21(v10, 1, 1, v20);
  v21(v8, 1, 1, v20);
  unsigned int v30 = enum case for InputConnectionBehavior.default(_:);
  uint64_t v22 = *(void (**)(void))(v2 + 104);
  uint64_t v28 = v2 + 104;
  uint64_t v29 = (void (*)(char *, void, uint64_t))v22;
  v22(v4);
  sub_100014590(&qword_100081270);
  uint64_t v23 = v27;
  uint64_t v31 = sub_10005E420();
  sub_100005268(&qword_100080A80);
  sub_10005E7E0();
  v32(v23, 1, 1, v33);
  char v36 = 2;
  uint64_t v24 = sub_10005E9F0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 56))(v34, 1, 1, v24);
  v21(v10, 1, 1, v20);
  v29(v4, v30, v35);
  sub_10005E430();
  return v31;
}

uint64_t sub_1000150E4(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for AlwaysShowSpeechEntity();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100015140@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  *a2 = *(void *)(a1 + *(int *)(type metadata accessor for AlwaysShowSpeechEntity() + 20));

  return swift_retain();
}

uint64_t sub_100015188(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for AlwaysShowSpeechEntity();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_1000151EC()
{
  unint64_t result = qword_1000813E8;
  if (!qword_1000813E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000813E8);
  }
  return result;
}

unint64_t sub_100015240()
{
  unint64_t result = qword_1000813F0;
  if (!qword_1000813F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000813F0);
  }
  return result;
}

uint64_t sub_100015294()
{
  uint64_t v0 = sub_10005E8C0();
  sub_1000052E4(v0, qword_100083638);
  sub_1000052AC(v0, (uint64_t)qword_100083638);
  return sub_10005E8B0();
}

void sub_100015304(os_log_type_t a1, uint64_t a2, unint64_t a3, uint64_t a4, unint64_t a5)
{
  unint64_t v5 = a3;
  uint64_t v6 = a2;
  uint64_t v14 = a2;
  unint64_t v15 = a3;
  if (!a5) {
    goto LABEL_6;
  }
  uint64_t v10 = HIBYTE(a5) & 0xF;
  if ((a5 & 0x2000000000000000) == 0) {
    uint64_t v10 = a4 & 0xFFFFFFFFFFFFLL;
  }
  if (v10)
  {
    v13[1] = 0xE100000000000000;
    swift_bridgeObjectRetain();
    v17._countAndFlagsBits = a4;
    v17._object = (void *)a5;
    sub_10005E9D0(v17);
    v18._countAndFlagsBits = 32;
    v18._object = (void *)0xE100000000000000;
    sub_10005E9D0(v18);
    swift_bridgeObjectRelease();
    uint64_t v6 = v14;
    unint64_t v5 = v15;
  }
  else
  {
LABEL_6:
    swift_bridgeObjectRetain();
  }
  swift_bridgeObjectRetain();
  log = sub_10005E8A0();
  if (os_log_type_enabled(log, a1))
  {
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    v13[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v11 = 136315138;
    swift_bridgeObjectRetain();
    v13[2] = sub_100015500(v6, v5, v13);
    sub_10005EA50();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, log, a1, "%s", v11, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }
}

uint64_t sub_100015500(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_1000155D4(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_100015BA8((uint64_t)v12, *a3);
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
      sub_100015BA8((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_100015B58((uint64_t)v12);
  return v7;
}

uint64_t sub_1000155D4(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_10005EA60();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_100015790(a5, a6);
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
  uint64_t v8 = sub_10005EAF0();
  if (!v8)
  {
    sub_10005EB00();
    __break(1u);
LABEL_17:
    uint64_t result = sub_10005EB20();
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

uint64_t sub_100015790(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_100015828(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_100015A08(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_100015A08(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_100015828(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_1000159A0(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_10005EAE0();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_10005EB00();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_10005E9E0();
      if (!v2) {
        return _swiftEmptyArrayStorage;
      }
    }
    sub_10005EB20();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_10005EB00();
    __break(1u);
  }
  else
  {
    return _swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_1000159A0(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return _swiftEmptyArrayStorage;
  }
  sub_100005268(&qword_1000813F8);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_100015A08(char a1, int64_t a2, char a3, char *a4)
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
    sub_100005268(&qword_1000813F8);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)_swiftEmptyArrayStorage;
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
  uint64_t result = sub_10005EB20();
  __break(1u);
  return result;
}

uint64_t sub_100015B58(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_100015BA8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_100015C0C()
{
  unint64_t result = qword_100081410;
  if (!qword_100081410)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100081410);
  }
  return result;
}

uint64_t sub_100015C60()
{
  return sub_10001A154(&qword_100081418, (void (*)(uint64_t))type metadata accessor for SpokenResponsesEntity);
}

uint64_t type metadata accessor for SpokenResponsesEntity()
{
  uint64_t result = qword_1000815C8;
  if (!qword_1000815C8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_100015CF4(uint64_t a1)
{
  return sub_100005E9C(a1, qword_100083650);
}

uint64_t sub_100015D18(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for SpokenResponsesEntity();
  __chkstk_darwin(v2 - 8);
  sub_10001A240(a1, (uint64_t)&v5 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_10005E400();
  return sub_10001A19C(a1);
}

unint64_t sub_100015DAC()
{
  unint64_t result = qword_100081420;
  if (!qword_100081420)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100081420);
  }
  return result;
}

uint64_t sub_100015E00(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_10001A2A4();
  uint64_t v5 = sub_10001A154(&qword_100081478, (void (*)(uint64_t))type metadata accessor for SpokenResponsesEntity);

  return static URLRepresentableIntent<>.urlRepresentation.getter(a1, v4, a2, v5);
}

unint64_t sub_100015E9C()
{
  unint64_t result = qword_100081428;
  if (!qword_100081428)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100081428);
  }
  return result;
}

unint64_t sub_100015EF4()
{
  unint64_t result = qword_100081430;
  if (!qword_100081430)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100081430);
  }
  return result;
}

uint64_t sub_100015F48(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_10001913C(a1, a2, a3, (void (*)(void))sub_100015DAC);
}

uint64_t sub_100015F74@<X0>(uint64_t a1@<X8>)
{
  return sub_10001906C(&qword_100080358, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_100083650, a1);
}

uint64_t sub_100015FAC(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  unint64_t v5 = sub_10001A2A4();
  unint64_t v6 = sub_10001A2F8();
  uint64_t v7 = sub_10001A154(&qword_100081478, (void (*)(uint64_t))type metadata accessor for SpokenResponsesEntity);
  *unint64_t v4 = v2;
  v4[1] = sub_100003184;
  return URLRepresentableIntent<>.perform()(a2, v5, v6, v7);
}

uint64_t sub_1000160A8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100019880();
  *a1 = result;
  return result;
}

uint64_t sub_1000160D0(uint64_t a1)
{
  unint64_t v2 = sub_100015DAC();

  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

unint64_t sub_100016110()
{
  unint64_t result = qword_100081440;
  if (!qword_100081440)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100081440);
  }
  return result;
}

uint64_t sub_100016164()
{
  return sub_100009DAC(&qword_100081448, &qword_100081450);
}

id sub_1000161A0()
{
  id result = [self sharedController];
  qword_100083668 = (uint64_t)result;
  return result;
}

uint64_t sub_1000161DC()
{
  uint64_t v0 = sub_100005268(&qword_100080858);
  __chkstk_darwin(v0 - 8);
  unint64_t v2 = (char *)v12 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12[0] = sub_10005E7F0();
  uint64_t v3 = *(void *)(v12[0] - 8);
  __chkstk_darwin(v12[0]);
  unint64_t v5 = (char *)v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10005E830();
  __chkstk_darwin(v6 - 8);
  uint64_t v7 = sub_10005E990();
  __chkstk_darwin(v7 - 8);
  uint64_t v8 = sub_10005E800();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v10 = sub_10005E780();
  sub_1000052E4(v10, qword_100083670);
  sub_1000052AC(v10, (uint64_t)qword_100083670);
  sub_10005E980();
  sub_10005E820();
  (*(void (**)(char *, void, void))(v3 + 104))(v5, enum case for LocalizedStringResource.BundleDescription.main(_:), v12[0]);
  sub_10005E810();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(v2, 1, 1, v8);
  return sub_10005E770();
}

uint64_t sub_1000164C8(uint64_t a1)
{
  return sub_100005E9C(a1, qword_100083688);
}

uint64_t sub_1000164EC()
{
  uint64_t v0 = sub_100005268(&qword_100080B20);
  sub_1000052E4(v0, qword_1000836A0);
  uint64_t v1 = sub_1000052AC(v0, (uint64_t)qword_1000836A0);
  sub_10005E570();
  uint64_t v2 = sub_10005E580();
  uint64_t v3 = *(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56);

  return v3(v1, 0, 1, v2);
}

uint64_t sub_1000165A4()
{
  uint64_t result = swift_getKeyPath();
  qword_1000836B8 = result;
  return result;
}

uint64_t sub_1000165CC()
{
  type metadata accessor for SpokenResponsesEntity();

  return swift_retain();
}

uint64_t sub_100016600(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  sub_100005268(&qword_100080AF0);
  v3[5] = swift_task_alloc();
  sub_100005268(&qword_100080AF8);
  v3[6] = swift_task_alloc();
  sub_100005268(&qword_100081678);
  v3[7] = swift_task_alloc();
  uint64_t v4 = sub_10005E390();
  v3[8] = v4;
  v3[9] = *(void *)(v4 - 8);
  v3[10] = swift_task_alloc();
  v3[11] = type metadata accessor for SpokenResponsesEntity();
  v3[12] = swift_task_alloc();
  v3[13] = swift_task_alloc();
  uint64_t v5 = sub_100005268(&qword_100081680);
  v3[14] = v5;
  v3[15] = *(void *)(v5 - 8);
  v3[16] = swift_task_alloc();
  v3[17] = swift_task_alloc();
  return _swift_task_switch(sub_100016804, 0, 0);
}

uint64_t sub_100016804()
{
  sub_10005E3F0();
  uint64_t v1 = (void *)swift_task_alloc();
  v0[18] = v1;
  uint64_t v2 = sub_10001A154(&qword_100081488, (void (*)(uint64_t))type metadata accessor for SpokenResponsesEntity);
  void *v1 = v0;
  v1[1] = sub_100016900;
  uint64_t v3 = v0[17];
  uint64_t v4 = v0[13];
  uint64_t v5 = v0[11];
  return IntentDialog._CapturedContent.init<>(entity:_:)(v3, v4, sub_100016F40, 0, v5, v2);
}

uint64_t sub_100016900()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_1000169FC, 0, 0);
}

uint64_t sub_1000169FC()
{
  sub_10005E3F0();
  sub_10005E3F0();
  if (qword_100080380 != -1) {
    swift_once();
  }
  uint64_t v1 = qword_1000836B8;
  *(void *)(v0 + 152) = qword_1000836B8;
  swift_retain();
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 160) = v2;
  uint64_t v3 = sub_100009DAC(&qword_100081650, &qword_100081658);
  *uint64_t v2 = v0;
  v2[1] = sub_100016B3C;
  return AppEntity._setValue<A, B, C>(_:for:)(v0 + 176, v1, &type metadata for SpokenResponsesMode, v3);
}

uint64_t sub_100016B3C()
{
  uint64_t v2 = *(void *)(*(void *)v1 + 96);
  *(void *)(*(void *)v1 + 168) = v0;
  swift_task_dealloc();
  sub_10001A19C(v2);
  swift_release();
  if (v0) {
    uint64_t v3 = sub_100006990;
  }
  else {
    uint64_t v3 = sub_100016C90;
  }
  return _swift_task_switch(v3, 0, 0);
}

uint64_t sub_100016C90()
{
  uint64_t v1 = v0[16];
  uint64_t v2 = v0[15];
  uint64_t v11 = v0[13];
  uint64_t v12 = v0[17];
  uint64_t v9 = v0[10];
  uint64_t v10 = v0[14];
  uint64_t v13 = v0[9];
  uint64_t v14 = v0[8];
  uint64_t v3 = v0[5];
  uint64_t v4 = v0[6];
  sub_10005E3F0();
  uint64_t v5 = sub_10005E750();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56))(v4, 1, 1, v5);
  uint64_t v6 = sub_10005E790();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v3, 1, 1, v6);
  sub_100016110();
  sub_10001A154(&qword_1000814D8, (void (*)(uint64_t))type metadata accessor for SpokenResponsesEntity);
  sub_10005E350();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v12, v10);
  sub_10005E370();
  sub_10005E3A0();
  (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v9, v14);
  sub_10001A19C(v11);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v12, v10);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v7 = (uint64_t (*)(void))v0[1];
  return v7();
}

uint64_t sub_100016F44()
{
  uint64_t v0 = sub_100005268(&qword_100081688);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100080380 != -1) {
    swift_once();
  }
  swift_retain();
  sub_10005E5D0();
  swift_release();
  type metadata accessor for SpokenResponsesEntity();
  sub_10001A154(&qword_1000814D8, (void (*)(uint64_t))type metadata accessor for SpokenResponsesEntity);
  sub_100009DAC(&qword_100081690, &qword_100081688);
  sub_10005E5C0();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t sub_1000170E4()
{
  if (qword_100080380 != -1) {
    swift_once();
  }

  return swift_retain();
}

unint64_t sub_100017144()
{
  unint64_t result = qword_100081458;
  if (!qword_100081458)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100081458);
  }
  return result;
}

unint64_t sub_10001719C()
{
  unint64_t result = qword_100081460;
  if (!qword_100081460)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100081460);
  }
  return result;
}

uint64_t sub_1000171F0()
{
  return *(void *)(swift_getOpaqueTypeConformance2() + 8);
}

uint64_t sub_100017224(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_10001913C(a1, a2, a3, (void (*)(void))sub_100016110);
}

uint64_t sub_100017250@<X0>(uint64_t a1@<X8>)
{
  return sub_10001906C(&qword_100080370, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_100083688, a1);
}

uint64_t sub_100017288@<X0>(uint64_t a1@<X8>)
{
  if (qword_100080378 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100005268(&qword_100080B20);
  uint64_t v3 = sub_1000052AC(v2, (uint64_t)qword_1000836A0);

  return sub_100009E38(v3, a1);
}

uint64_t sub_100017304(uint64_t a1)
{
  uint64_t v5 = *v1;
  uint64_t v4 = v1[1];
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v6;
  *uint64_t v6 = v2;
  v6[1] = sub_1000042AC;
  return sub_100016600(a1, v5, v4);
}

uint64_t sub_1000173B0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100019C18();
  *a1 = result;
  a1[1] = v3;
  return result;
}

unint64_t sub_1000173D8()
{
  return 0xD000000000000026;
}

uint64_t sub_1000173F4(void *a1)
{
  a1[1] = sub_10001A154(&qword_100081470, (void (*)(uint64_t))type metadata accessor for SpokenResponsesEntity);
  a1[2] = sub_10001A154(&qword_100081478, (void (*)(uint64_t))type metadata accessor for SpokenResponsesEntity);
  uint64_t result = sub_10001A154(&qword_100081480, (void (*)(uint64_t))type metadata accessor for SpokenResponsesEntity);
  a1[3] = result;
  return result;
}

uint64_t sub_1000174A0()
{
  return sub_10001A154(&qword_100081488, (void (*)(uint64_t))type metadata accessor for SpokenResponsesEntity);
}

uint64_t sub_1000174E8()
{
  return sub_10001A154(&qword_100081490, (void (*)(uint64_t))type metadata accessor for SpokenResponsesEntity);
}

uint64_t sub_100017530(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 24) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_1000175D8;
  return _swift_task_switch(sub_1000177D0, 0, 0);
}

uint64_t sub_1000175D8(char a1)
{
  uint64_t v4 = *v2;
  uint64_t v5 = *v2;
  swift_task_dealloc();
  if (!v1) {
    **(unsigned char **)(v4 + 16) = a1;
  }
  uint64_t v6 = *(uint64_t (**)(void))(v5 + 8);
  return v6();
}

uint64_t sub_1000176E8(uint64_t a1, unsigned char *a2)
{
  *(unsigned char *)(v2 + 16) = *a2;
  return _swift_task_switch(sub_10001770C, 0, 0);
}

uint64_t sub_10001770C()
{
  if (qword_100080360 != -1) {
    swift_once();
  }
  [(id)qword_100083668 setUseDeviceSpeakerForTTS:*(unsigned __int8 *)(v0 + 16) + 1];
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1000177B4()
{
  return _swift_task_switch(sub_1000177D0, 0, 0);
}

uint64_t sub_1000177D0()
{
  if (qword_100080360 != -1) {
    swift_once();
  }
  if ((char *)[(id)qword_100083668 useDeviceSpeakerForTTS] - 1 >= (char *)3)
  {
    sub_10005E260();
    sub_10001A154(&qword_100081668, (void (*)(uint64_t))&type metadata accessor for AppIntentError);
    swift_allocError();
    sub_10005E250();
    swift_willThrow();
    uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
    return v3();
  }
  else
  {
    uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
    return v1();
  }
}

uint64_t sub_100017920@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_100005268(&qword_100080878);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)v18 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100005268(&qword_100080858);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_10005E800();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  sub_10005E890();
  uint64_t v10 = (void *)sub_10005E880();
  sub_10005E860();

  uint64_t v11 = (void *)sub_10005E880();
  char v12 = sub_10005E870();

  if (v12) {
    unint64_t v13 = 0x100000000000001ELL;
  }
  else {
    unint64_t v13 = 0x9286E22069726953;
  }
  if (v12) {
    unint64_t v14 = 0x800000010005F260;
  }
  else {
    unint64_t v14 = 0xA900000000000020;
  }
  sub_10005E7E0();
  v18[0] = v13;
  v18[1] = v14;
  swift_bridgeObjectRetain();
  v19._countAndFlagsBits = 0x7365522069726953;
  v19._object = (void *)0xEE007365736E6F70;
  sub_10005E9D0(v19);
  swift_bridgeObjectRelease();
  sub_10005E7E0();
  (*(void (**)(char *, void, uint64_t, uint64_t))(v9 + 56))(v7, 0, 1, v8);
  uint64_t v15 = sub_10005E5F0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v4, 1, 1, v15);
  sub_10005E610();
  uint64_t v16 = *(int *)(type metadata accessor for SpokenResponsesEntity() + 20);
  sub_100005268(&qword_100081450);
  sub_10005E7E0();
  sub_100009DAC(&qword_100081650, &qword_100081658);
  sub_100019184();
  uint64_t result = sub_10005E7B0();
  *(void *)(a1 + v16) = result;
  return result;
}

uint64_t sub_100017C84(uint64_t a1)
{
  uint64_t v2 = qword_100081400;
  uint64_t v3 = off_100081408;
  uint64_t v4 = sub_10001A154(&qword_100081488, (void (*)(uint64_t))type metadata accessor for SpokenResponsesEntity);
  swift_bridgeObjectRetain();

  return EntityURLRepresentation.init(_:)(v2, v3, a1, v4);
}

uint64_t sub_100017D28()
{
  return sub_10001A154(&qword_100081498, (void (*)(uint64_t))type metadata accessor for SpokenResponsesEntity);
}

uint64_t sub_100017D70()
{
  return sub_10001A154(&qword_1000814A0, (void (*)(uint64_t))type metadata accessor for SpokenResponsesEntity);
}

uint64_t sub_100017DB8()
{
  return sub_100009DAC(&qword_1000814A8, &qword_1000814B0);
}

uint64_t sub_100017DF4(uint64_t a1)
{
  uint64_t v2 = sub_10001A154(&qword_100081480, (void (*)(uint64_t))type metadata accessor for SpokenResponsesEntity);

  return _UniqueEntityProvider.init(_:)(&unk_1000830A0, 0, a1, v2);
}

uint64_t sub_100017E80()
{
  return sub_100009DAC((unint64_t *)&unk_1000814B8, &qword_1000814B0);
}

uint64_t sub_100017EBC()
{
  sub_10001A154(&qword_100081478, (void (*)(uint64_t))type metadata accessor for SpokenResponsesEntity);
  uint64_t v2 = sub_10005E6A0();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
  return sub_10000538C(v3, v0, v2, v1);
}

uint64_t sub_100017F80()
{
  return sub_10001A154(&qword_1000814C8, (void (*)(uint64_t))type metadata accessor for SpokenResponsesEntity);
}

uint64_t sub_100017FC8()
{
  return sub_10001A154(&qword_1000814D0, (void (*)(uint64_t))type metadata accessor for SpokenResponsesEntity);
}

uint64_t sub_100018010()
{
  return sub_10001A154(&qword_1000814D8, (void (*)(uint64_t))type metadata accessor for SpokenResponsesEntity);
}

uint64_t sub_100018058()
{
  return sub_10001A154(&qword_1000814E0, (void (*)(uint64_t))type metadata accessor for SpokenResponsesEntity);
}

uint64_t sub_1000180A0@<X0>(uint64_t *a1@<X8>)
{
  sub_10001A154(&qword_100081480, (void (*)(uint64_t))type metadata accessor for SpokenResponsesEntity);
  uint64_t result = sub_10005E3D0();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_100018110@<X0>(uint64_t a1@<X8>)
{
  return sub_10001906C(&qword_100080368, (uint64_t (*)(void))&type metadata accessor for TypeDisplayRepresentation, (uint64_t)qword_100083670, a1);
}

uint64_t sub_100018148()
{
  return sub_100009DAC(&qword_1000814E8, &qword_1000814F0);
}

uint64_t sub_100018184(uint64_t a1)
{
  uint64_t v2 = sub_10001A154(&qword_100081488, (void (*)(uint64_t))type metadata accessor for SpokenResponsesEntity);

  return static AppEntity.defaultResolverSpecification.getter(a1, v2);
}

uint64_t sub_100018200()
{
  return sub_10001A154(&qword_1000814F8, (void (*)(uint64_t))type metadata accessor for SpokenResponsesEntity);
}

uint64_t sub_100018248(uint64_t a1)
{
  uint64_t v2 = sub_10001A154(&qword_1000814E0, (void (*)(uint64_t))type metadata accessor for SpokenResponsesEntity);

  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

uint64_t sub_1000182C4(unsigned __int8 a1)
{
  int v1 = a1;
  if (a1)
  {
    if (a1 == 1) {
      v2._countAndFlagsBits = 0x737961776C61;
    }
    else {
      v2._countAndFlagsBits = 0x726576656ELL;
    }
    if (v1 == 1) {
      uint64_t v3 = (void *)0xE600000000000000;
    }
    else {
      uint64_t v3 = (void *)0xE500000000000000;
    }
  }
  else
  {
    uint64_t v3 = (void *)0x800000010005EF60;
    v2._countAndFlagsBits = 0xD000000000000011;
  }
  v2._object = v3;
  sub_10005E9D0(v2);
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t sub_100018358(char a1)
{
  if (!a1) {
    return 0xD000000000000011;
  }
  if (a1 == 1) {
    return 0x737961776C61;
  }
  return 0x726576656ELL;
}

uint64_t sub_1000183AC()
{
  uint64_t v0 = sub_100005268(&qword_100080858);
  __chkstk_darwin(v0 - 8);
  Swift::String v2 = (char *)v12 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12[0] = sub_10005E7F0();
  uint64_t v3 = *(void *)(v12[0] - 8);
  __chkstk_darwin(v12[0]);
  uint64_t v5 = (char *)v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10005E830();
  __chkstk_darwin(v6 - 8);
  uint64_t v7 = sub_10005E990();
  __chkstk_darwin(v7 - 8);
  uint64_t v8 = sub_10005E800();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v10 = sub_10005E780();
  sub_1000052E4(v10, qword_1000836C0);
  sub_1000052AC(v10, (uint64_t)qword_1000836C0);
  sub_10005E980();
  sub_10005E820();
  (*(void (**)(char *, void, void))(v3 + 104))(v5, enum case for LocalizedStringResource.BundleDescription.main(_:), v12[0]);
  sub_10005E810();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(v2, 1, 1, v8);
  return sub_10005E770();
}

unint64_t sub_100018694()
{
  uint64_t v0 = sub_100005268(&qword_100080878);
  __chkstk_darwin(v0 - 8);
  uint64_t v37 = (char *)&v22 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = sub_100005268(&qword_100080858);
  __chkstk_darwin(v2 - 8);
  unint64_t v27 = (char *)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v38 = sub_10005E7F0();
  uint64_t v4 = *(void *)(v38 - 8);
  __chkstk_darwin(v38);
  uint64_t v6 = (char *)&v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_10005E830();
  __chkstk_darwin(v7 - 8);
  uint64_t v8 = sub_10005E990();
  __chkstk_darwin(v8 - 8);
  uint64_t v9 = sub_10005E800();
  uint64_t v34 = v9;
  uint64_t v39 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  sub_100005268(&qword_100081630);
  uint64_t v10 = (int *)(sub_100005268(&qword_100081638) - 8);
  uint64_t v11 = *(void *)(*(void *)v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(*(void *)v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v10 + 80);
  uint64_t v26 = 2 * v11;
  uint64_t v13 = swift_allocObject();
  uint64_t v28 = v13;
  *(_OWORD *)(v13 + 16) = xmmword_10006C7B0;
  unint64_t v31 = v13 + v12;
  unint64_t v25 = v13 + v12 + v10[14];
  *(unsigned char *)(v13 + v12) = 0;
  sub_10005E980();
  sub_10005E820();
  unsigned int v23 = enum case for LocalizedStringResource.BundleDescription.main(_:);
  unint64_t v14 = *(void (**)(char *, uint64_t, uint64_t))(v4 + 104);
  uint64_t v24 = v4 + 104;
  uint64_t v32 = v14;
  ((void (*)(char *))v14)(v6);
  unint64_t v36 = 0x800000010005F160;
  sub_10005E810();
  uint64_t v15 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v39 + 56);
  v39 += 56;
  uint64_t v35 = v15;
  uint64_t v16 = v27;
  v15(v27, 1, 1, v9);
  uint64_t v30 = sub_10005E5F0();
  uint64_t v17 = *(void *)(v30 - 8);
  uint64_t v29 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v17 + 56);
  uint64_t v33 = v17 + 56;
  v29(v37, 1, 1, v30);
  sub_10005E610();
  unint64_t v22 = v31 + v11 + v10[14];
  *(unsigned char *)(v31 + v11) = 1;
  unint64_t v25 = 0xD00000000000002CLL;
  sub_10005E980();
  sub_10005E820();
  uint64_t v18 = v23;
  uint64_t v19 = v38;
  v32(v6, v23, v38);
  sub_10005E810();
  v35(v16, 1, 1, v34);
  uint64_t v20 = v37;
  v29(v37, 1, 1, v30);
  sub_10005E610();
  *(unsigned char *)(v31 + v26) = 2;
  sub_10005E980();
  sub_10005E820();
  v32(v6, v18, v19);
  sub_10005E810();
  v35(v16, 1, 1, v34);
  v29(v20, 1, 1, v30);
  sub_10005E610();
  unint64_t result = sub_10004B268(v28);
  qword_1000836D8 = result;
  return result;
}

uint64_t sub_100018CBC(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_10004B48C(*a1, *a2);
}

unint64_t sub_100018CCC()
{
  unint64_t result = qword_100081500;
  if (!qword_100081500)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100081500);
  }
  return result;
}

Swift::Int sub_100018D20()
{
  return sub_10004B610();
}

uint64_t sub_100018D28()
{
  return sub_10004B71C();
}

Swift::Int sub_100018D30()
{
  return sub_10004B860();
}

uint64_t sub_100018D38@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_10001A108(*(void *)a1, *(void **)(a1 + 8));
  *a2 = result;
  return result;
}

uint64_t sub_100018D68@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100018358(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

unint64_t sub_100018D98()
{
  unint64_t result = qword_100081508;
  if (!qword_100081508)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100081508);
  }
  return result;
}

unint64_t sub_100018DF0()
{
  unint64_t result = qword_100081510;
  if (!qword_100081510)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100081510);
  }
  return result;
}

unint64_t sub_100018E48()
{
  unint64_t result = qword_100081518;
  if (!qword_100081518)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100081518);
  }
  return result;
}

void *sub_100018E9C()
{
  return &protocol witness table for String;
}

uint64_t sub_100018EA8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1000182C4(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

unint64_t sub_100018ED8()
{
  unint64_t result = qword_100081520;
  if (!qword_100081520)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100081520);
  }
  return result;
}

unint64_t sub_100018F30()
{
  unint64_t result = qword_100081528;
  if (!qword_100081528)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100081528);
  }
  return result;
}

unint64_t sub_100018F88()
{
  unint64_t result = qword_100081530;
  if (!qword_100081530)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100081530);
  }
  return result;
}

unint64_t sub_100018FE0()
{
  unint64_t result = qword_100081538;
  if (!qword_100081538)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100081538);
  }
  return result;
}

uint64_t sub_100019034@<X0>(uint64_t a1@<X8>)
{
  return sub_10001906C(&qword_100080388, (uint64_t (*)(void))&type metadata accessor for TypeDisplayRepresentation, (uint64_t)qword_1000836C0, a1);
}

uint64_t sub_10001906C@<X0>(void *a1@<X2>, uint64_t (*a2)(void)@<X3>, uint64_t a3@<X4>, uint64_t a4@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v7 = a2(0);
  uint64_t v8 = sub_1000052AC(v7, a3);
  uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 16);

  return v9(a4, v8, v7);
}

uint64_t sub_100019110(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_10001913C(a1, a2, a3, (void (*)(void))sub_100019184);
}

uint64_t sub_10001913C(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_100019184()
{
  unint64_t result = qword_100081540;
  if (!qword_100081540)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100081540);
  }
  return result;
}

uint64_t sub_1000191D8(uint64_t a1)
{
  unint64_t v2 = sub_100019184();

  return static AppEnum.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_100019228()
{
  unint64_t result = qword_100081548;
  if (!qword_100081548)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100081548);
  }
  return result;
}

unint64_t sub_100019280()
{
  unint64_t result = qword_100081550;
  if (!qword_100081550)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100081550);
  }
  return result;
}

unint64_t sub_1000192D8()
{
  unint64_t result = qword_100081558;
  if (!qword_100081558)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100081558);
  }
  return result;
}

void sub_10001932C()
{
  qword_1000836E0 = (uint64_t)&off_10007D508;
}

uint64_t sub_100019340()
{
  if (qword_100080390 != -1) {
    swift_once();
  }

  return swift_bridgeObjectRetain();
}

uint64_t sub_10001939C(uint64_t a1)
{
  unint64_t v2 = sub_100018FE0();

  return CaseDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

uint64_t sub_1000193E8()
{
  return sub_100009DAC(&qword_100081560, &qword_100081568);
}

uint64_t sub_100019424@<X0>(void *a1@<X8>)
{
  if (qword_100080398 != -1) {
    swift_once();
  }
  *a1 = qword_1000836E0;

  return swift_bridgeObjectRetain();
}

unsigned char *initializeBufferWithCopyOfBuffer for SpokenResponsesMode(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for SpokenResponsesMode(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for SpokenResponsesMode(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 2;
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
        JUMPOUT(0x1000195FCLL);
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
          *unint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

uint64_t sub_100019624(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_10001962C(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for SpokenResponsesMode()
{
  return &type metadata for SpokenResponsesMode;
}

ValueMetadata *type metadata accessor for SpokenResponsesEntity.UpdateIntent_value()
{
  return &type metadata for SpokenResponsesEntity.UpdateIntent_value;
}

uint64_t sub_100019654(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100019668);
}

uint64_t sub_100019668(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_10005E620();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    int v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20));
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
}

uint64_t sub_100019728(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10001973C);
}

uint64_t sub_10001973C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_10005E620();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20)) = (a2 - 1);
  }
  return result;
}

ValueMetadata *type metadata accessor for OpenSpokenResponsesEntity()
{
  return &type metadata for OpenSpokenResponsesEntity;
}

uint64_t sub_100019808()
{
  return sub_100009DAC(&qword_100081600, &qword_100081608);
}

uint64_t sub_100019844()
{
  return sub_100009DAC(&qword_100081610, &qword_100081608);
}

uint64_t sub_100019880()
{
  uint64_t v22 = sub_10005E720();
  uint64_t v0 = *(void *)(v22 - 8);
  __chkstk_darwin(v22);
  int v2 = (char *)&v21 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100005268(&qword_100080848);
  uint64_t v4 = __chkstk_darwin(v3 - 8);
  uint64_t v6 = (char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  int v8 = (char *)&v21 - v7;
  uint64_t v9 = sub_100005268(&qword_100081618);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100005268(&qword_100080858);
  __chkstk_darwin(v12 - 8);
  unint64_t v14 = (char *)&v21 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_10005E800();
  uint64_t v16 = *(void *)(v15 - 8);
  __chkstk_darwin(v15);
  uint64_t v21 = sub_100005268(&qword_100081620);
  sub_10005E7E0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v16 + 56))(v14, 1, 1, v15);
  uint64_t v17 = type metadata accessor for SpokenResponsesEntity();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v11, 1, 1, v17);
  uint64_t v18 = sub_10005E390();
  uint64_t v19 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56);
  v19(v8, 1, 1, v18);
  v19(v6, 1, 1, v18);
  (*(void (**)(char *, void, uint64_t))(v0 + 104))(v2, enum case for InputConnectionBehavior.default(_:), v22);
  sub_10001A154(&qword_100081488, (void (*)(uint64_t))type metadata accessor for SpokenResponsesEntity);
  return sub_10005E420();
}

uint64_t sub_100019C18()
{
  uint64_t v33 = sub_10005E720();
  uint64_t v0 = *(void *)(v33 - 8);
  __chkstk_darwin(v33);
  int v2 = (char *)&v25 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100005268(&qword_100080848);
  uint64_t v4 = __chkstk_darwin(v3 - 8);
  uint64_t v6 = (char *)&v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  int v8 = (char *)&v25 - v7;
  uint64_t v9 = sub_100005268(&qword_100081618);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100005268(&qword_100080858);
  __chkstk_darwin(v12 - 8);
  unint64_t v14 = (char *)&v25 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_10005E800();
  uint64_t v30 = v15;
  uint64_t v16 = *(void *)(v15 - 8);
  __chkstk_darwin(v15);
  uint64_t v18 = (char *)&v25 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v32 = sub_100005268(&qword_100081620);
  sub_10005E7E0();
  uint64_t v19 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v16 + 56);
  uint64_t v29 = v16 + 56;
  unint64_t v31 = v19;
  v19(v14, 1, 1, v15);
  uint64_t v20 = type metadata accessor for SpokenResponsesEntity();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v11, 1, 1, v20);
  uint64_t v21 = sub_10005E390();
  uint64_t v22 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56);
  v22(v8, 1, 1, v21);
  v22(v6, 1, 1, v21);
  unsigned int v27 = enum case for InputConnectionBehavior.default(_:);
  unsigned int v23 = *(void (**)(void))(v0 + 104);
  uint64_t v25 = v0 + 104;
  uint64_t v26 = (void (*)(char *, void, uint64_t))v23;
  v23(v2);
  sub_10001A154(&qword_100081488, (void (*)(uint64_t))type metadata accessor for SpokenResponsesEntity);
  uint64_t v28 = sub_10005E420();
  sub_100005268(&qword_100081628);
  uint64_t v32 = (uint64_t)v18;
  sub_10005E7E0();
  v31(v14, 1, 1, v30);
  char v34 = 3;
  v22(v8, 1, 1, v21);
  v22(v6, 1, 1, v21);
  v26(v2, v27, v33);
  if (qword_100080398 != -1) {
    swift_once();
  }
  sub_100019184();
  swift_bridgeObjectRetain();
  sub_10005E410();
  return v28;
}

uint64_t sub_10001A108(uint64_t a1, void *a2)
{
  v6._countAndFlagsBits = a1;
  v3._rawValue = &off_10007D530;
  v6._object = a2;
  unint64_t v4 = sub_10005EB30(v3, v6);
  swift_bridgeObjectRelease();
  if (v4 >= 3) {
    return 3;
  }
  else {
    return v4;
  }
}

uint64_t sub_10001A154(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_10001A19C(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for SpokenResponsesEntity();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10001A1F8@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  *a2 = *(void *)(a1 + *(int *)(type metadata accessor for SpokenResponsesEntity() + 20));

  return swift_retain();
}

uint64_t sub_10001A240(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SpokenResponsesEntity();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_10001A2A4()
{
  unint64_t result = qword_100081698;
  if (!qword_100081698)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100081698);
  }
  return result;
}

unint64_t sub_10001A2F8()
{
  unint64_t result = qword_1000816A0;
  if (!qword_1000816A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000816A0);
  }
  return result;
}

ValueMetadata *type metadata accessor for ReplyWithoutConfirmationToggleControl()
{
  return &type metadata for ReplyWithoutConfirmationToggleControl;
}

ValueMetadata *type metadata accessor for AnnounceNotificationBuiltinSpeakerToggleControl()
{
  return &type metadata for AnnounceNotificationBuiltinSpeakerToggleControl;
}

ValueMetadata *type metadata accessor for AnnounceNotificationHearingAidsToggleControl()
{
  return &type metadata for AnnounceNotificationHearingAidsToggleControl;
}

ValueMetadata *type metadata accessor for AnnounceNotificationCarPlayToggleControl()
{
  return &type metadata for AnnounceNotificationCarPlayToggleControl;
}

ValueMetadata *type metadata accessor for AnnounceNotificationHeadphonesToggleControl()
{
  return &type metadata for AnnounceNotificationHeadphonesToggleControl;
}

ValueMetadata *type metadata accessor for AnnounceNotificationToggleControl()
{
  return &type metadata for AnnounceNotificationToggleControl;
}

uint64_t sub_10001A3AC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10001A3C8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v30 = a1;
  uint64_t v1 = sub_100005268(&qword_1000816A8);
  uint64_t v23 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  Swift::OpaquePointer v3 = (char *)&v23 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100005268(&qword_1000816B0);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v24 = v4;
  uint64_t v25 = v5;
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100005268(&qword_1000816B8);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v26 = v8;
  uint64_t v27 = v9;
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100005268(&qword_1000816C0);
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v28 = v12;
  uint64_t v29 = v13;
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)&v23 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  sub_100005268(&qword_1000816C8);
  sub_10001C514();
  sub_100009DAC(&qword_1000816D8, &qword_1000816C8);
  sub_10005E960();
  sub_10005E8F0();
  uint64_t v16 = sub_100009DAC(&qword_1000816E0, &qword_1000816A8);
  sub_10005E920();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v23 + 8))(v3, v1);
  sub_10005E8F0();
  uint64_t v31 = v1;
  uint64_t v32 = v16;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v18 = v24;
  sub_10005E900();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v25 + 8))(v7, v18);
  uint64_t v31 = v18;
  uint64_t v32 = OpaqueTypeConformance2;
  uint64_t v19 = swift_getOpaqueTypeConformance2();
  uint64_t v20 = v26;
  sub_10005E930();
  (*(void (**)(char *, uint64_t))(v27 + 8))(v11, v20);
  uint64_t v31 = v20;
  uint64_t v32 = v19;
  swift_getOpaqueTypeConformance2();
  uint64_t v21 = v28;
  sub_10005E910();
  return (*(uint64_t (**)(char *, uint64_t))(v29 + 8))(v15, v21);
}

uint64_t sub_10001A8E0()
{
  return sub_10001C3B4();
}

uint64_t sub_10001A908()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10001A924@<X0>(uint64_t a1@<X8>)
{
  uint64_t v30 = a1;
  uint64_t v1 = sub_100005268(&qword_1000816A8);
  uint64_t v23 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  Swift::OpaquePointer v3 = (char *)&v23 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100005268(&qword_1000816B0);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v24 = v4;
  uint64_t v25 = v5;
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100005268(&qword_1000816B8);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v26 = v8;
  uint64_t v27 = v9;
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100005268(&qword_1000816C0);
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v28 = v12;
  uint64_t v29 = v13;
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)&v23 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  sub_100005268(&qword_1000816C8);
  sub_10001C514();
  sub_100009DAC(&qword_1000816D8, &qword_1000816C8);
  sub_10005E960();
  sub_10005E8F0();
  uint64_t v16 = sub_100009DAC(&qword_1000816E0, &qword_1000816A8);
  sub_10005E920();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v23 + 8))(v3, v1);
  sub_10005E8F0();
  uint64_t v31 = v1;
  uint64_t v32 = v16;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v18 = v24;
  sub_10005E900();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v25 + 8))(v7, v18);
  uint64_t v31 = v18;
  uint64_t v32 = OpaqueTypeConformance2;
  uint64_t v19 = swift_getOpaqueTypeConformance2();
  uint64_t v20 = v26;
  sub_10005E930();
  (*(void (**)(char *, uint64_t))(v27 + 8))(v11, v20);
  uint64_t v31 = v20;
  uint64_t v32 = v19;
  swift_getOpaqueTypeConformance2();
  uint64_t v21 = v28;
  sub_10005E910();
  return (*(uint64_t (**)(char *, uint64_t))(v29 + 8))(v15, v21);
}

uint64_t sub_10001AE40()
{
  return sub_10001C3B4();
}

uint64_t sub_10001AE60()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10001AE7C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v30 = a1;
  uint64_t v1 = sub_100005268(&qword_1000816A8);
  uint64_t v23 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  Swift::OpaquePointer v3 = (char *)&v23 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100005268(&qword_1000816B0);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v24 = v4;
  uint64_t v25 = v5;
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100005268(&qword_1000816B8);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v26 = v8;
  uint64_t v27 = v9;
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100005268(&qword_1000816C0);
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v28 = v12;
  uint64_t v29 = v13;
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)&v23 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  sub_100005268(&qword_1000816C8);
  sub_10001C514();
  sub_100009DAC(&qword_1000816D8, &qword_1000816C8);
  sub_10005E960();
  sub_10005E8F0();
  uint64_t v16 = sub_100009DAC(&qword_1000816E0, &qword_1000816A8);
  sub_10005E920();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v23 + 8))(v3, v1);
  sub_10005E8F0();
  uint64_t v31 = v1;
  uint64_t v32 = v16;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v18 = v24;
  sub_10005E900();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v25 + 8))(v7, v18);
  uint64_t v31 = v18;
  uint64_t v32 = OpaqueTypeConformance2;
  uint64_t v19 = swift_getOpaqueTypeConformance2();
  uint64_t v20 = v26;
  sub_10005E930();
  (*(void (**)(char *, uint64_t))(v27 + 8))(v11, v20);
  uint64_t v31 = v20;
  uint64_t v32 = v19;
  swift_getOpaqueTypeConformance2();
  uint64_t v21 = v28;
  sub_10005E910();
  return (*(uint64_t (**)(char *, uint64_t))(v29 + 8))(v15, v21);
}

uint64_t sub_10001B394()
{
  return sub_10001C3B4();
}

uint64_t sub_10001B3BC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v30 = a1;
  uint64_t v1 = sub_100005268(&qword_1000816A8);
  uint64_t v23 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  Swift::OpaquePointer v3 = (char *)&v23 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100005268(&qword_1000816B0);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v24 = v4;
  uint64_t v25 = v5;
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100005268(&qword_1000816B8);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v26 = v8;
  uint64_t v27 = v9;
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100005268(&qword_1000816C0);
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v28 = v12;
  uint64_t v29 = v13;
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)&v23 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  sub_100005268(&qword_1000816C8);
  sub_10001C514();
  sub_100009DAC(&qword_1000816D8, &qword_1000816C8);
  sub_10005E960();
  sub_10005E8F0();
  uint64_t v16 = sub_100009DAC(&qword_1000816E0, &qword_1000816A8);
  sub_10005E920();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v23 + 8))(v3, v1);
  sub_10005E8F0();
  uint64_t v31 = v1;
  uint64_t v32 = v16;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v18 = v24;
  sub_10005E900();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v25 + 8))(v7, v18);
  uint64_t v31 = v18;
  uint64_t v32 = OpaqueTypeConformance2;
  uint64_t v19 = swift_getOpaqueTypeConformance2();
  uint64_t v20 = v26;
  sub_10005E930();
  (*(void (**)(char *, uint64_t))(v27 + 8))(v11, v20);
  uint64_t v31 = v20;
  uint64_t v32 = v19;
  swift_getOpaqueTypeConformance2();
  uint64_t v21 = v28;
  sub_10005E910();
  return (*(uint64_t (**)(char *, uint64_t))(v29 + 8))(v15, v21);
}

uint64_t sub_10001B8D4()
{
  return sub_10001C3B4();
}

uint64_t sub_10001B8F0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10001B90C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v30 = a1;
  uint64_t v1 = sub_100005268(&qword_1000816A8);
  uint64_t v23 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  Swift::OpaquePointer v3 = (char *)&v23 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100005268(&qword_1000816B0);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v24 = v4;
  uint64_t v25 = v5;
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100005268(&qword_1000816B8);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v26 = v8;
  uint64_t v27 = v9;
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100005268(&qword_1000816C0);
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v28 = v12;
  uint64_t v29 = v13;
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)&v23 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  sub_100005268(&qword_1000816C8);
  sub_10001C514();
  sub_100009DAC(&qword_1000816D8, &qword_1000816C8);
  sub_10005E960();
  sub_10005E8F0();
  uint64_t v16 = sub_100009DAC(&qword_1000816E0, &qword_1000816A8);
  sub_10005E920();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v23 + 8))(v3, v1);
  sub_10005E8F0();
  uint64_t v31 = v1;
  uint64_t v32 = v16;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v18 = v24;
  sub_10005E900();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v25 + 8))(v7, v18);
  uint64_t v31 = v18;
  uint64_t v32 = OpaqueTypeConformance2;
  uint64_t v19 = swift_getOpaqueTypeConformance2();
  uint64_t v20 = v26;
  sub_10005E930();
  (*(void (**)(char *, uint64_t))(v27 + 8))(v11, v20);
  uint64_t v31 = v20;
  uint64_t v32 = v19;
  swift_getOpaqueTypeConformance2();
  uint64_t v21 = v28;
  sub_10005E910();
  return (*(uint64_t (**)(char *, uint64_t))(v29 + 8))(v15, v21);
}

uint64_t sub_10001BE24()
{
  return sub_10001C3B4();
}

uint64_t sub_10001BE48()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10001BE64()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10001BE80@<X0>(uint64_t a1@<X8>)
{
  uint64_t v30 = a1;
  uint64_t v1 = sub_100005268(&qword_1000816A8);
  uint64_t v23 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  Swift::OpaquePointer v3 = (char *)&v23 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100005268(&qword_1000816B0);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v24 = v4;
  uint64_t v25 = v5;
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100005268(&qword_1000816B8);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v26 = v8;
  uint64_t v27 = v9;
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100005268(&qword_1000816C0);
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v28 = v12;
  uint64_t v29 = v13;
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)&v23 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  sub_100005268(&qword_1000816C8);
  sub_10001C514();
  sub_100009DAC(&qword_1000816D8, &qword_1000816C8);
  sub_10005E960();
  sub_10005E8F0();
  uint64_t v16 = sub_100009DAC(&qword_1000816E0, &qword_1000816A8);
  sub_10005E920();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v23 + 8))(v3, v1);
  sub_10005E8F0();
  uint64_t v31 = v1;
  uint64_t v32 = v16;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v18 = v24;
  sub_10005E900();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v25 + 8))(v7, v18);
  uint64_t v31 = v18;
  uint64_t v32 = OpaqueTypeConformance2;
  uint64_t v19 = swift_getOpaqueTypeConformance2();
  uint64_t v20 = v26;
  sub_10005E930();
  (*(void (**)(char *, uint64_t))(v27 + 8))(v11, v20);
  uint64_t v31 = v20;
  uint64_t v32 = v19;
  swift_getOpaqueTypeConformance2();
  uint64_t v21 = v28;
  sub_10005E910();
  return (*(uint64_t (**)(char *, uint64_t))(v29 + 8))(v15, v21);
}

uint64_t sub_10001C398()
{
  return sub_10001C3B4();
}

uint64_t sub_10001C3B4()
{
  sub_10005E8F0();

  return sub_10005E950();
}

uint64_t sub_10001C404@<X0>(uint64_t a1@<X8>)
{
  sub_10005E8F0();
  uint64_t result = sub_10005E940();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = v4 & 1;
  *(void *)(a1 + 24) = v5;
  return result;
}

uint64_t sub_10001C47C@<X0>(uint64_t a1@<X8>)
{
  sub_10005E8F0();
  uint64_t result = sub_10005E940();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = v4 & 1;
  *(void *)(a1 + 24) = v5;
  return result;
}

unint64_t sub_10001C514()
{
  unint64_t result = qword_1000816D0;
  if (!qword_1000816D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000816D0);
  }
  return result;
}

uint64_t sub_10001C57C()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_10001C6AC()
{
  unint64_t result = qword_1000816F8;
  if (!qword_1000816F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000816F8);
  }
  return result;
}

unint64_t sub_10001C704()
{
  unint64_t result = qword_100081700;
  if (!qword_100081700)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100081700);
  }
  return result;
}

uint64_t sub_10001C758(uint64_t a1)
{
  return sub_100005E9C(a1, qword_1000836E8);
}

uint64_t sub_10001C77C()
{
  sub_10005E3F0();
  return v1;
}

uint64_t sub_10001C7B0@<X0>(void *a1@<X8>)
{
  uint64_t result = sub_10005E3F0();
  *a1 = v3;
  return result;
}

uint64_t sub_10001C7EC()
{
  return swift_release();
}

unint64_t sub_10001C838()
{
  unint64_t result = qword_100081708;
  if (!qword_100081708)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100081708);
  }
  return result;
}

uint64_t sub_10001C88C(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_10001EA50();
  unint64_t v5 = sub_10001E9F0();

  return static URLRepresentableIntent<>.urlRepresentation.getter(a1, v4, a2, v5);
}

unint64_t sub_10001C8F8()
{
  unint64_t result = qword_100081710;
  if (!qword_100081710)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100081710);
  }
  return result;
}

unint64_t sub_10001C950()
{
  unint64_t result = qword_100081718;
  if (!qword_100081718)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100081718);
  }
  return result;
}

uint64_t sub_10001C9A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_10001D37C(a1, a2, a3, (void (*)(void))sub_10001C838);
}

uint64_t sub_10001C9BC@<X0>(uint64_t a1@<X8>)
{
  return sub_1000085D4(&qword_1000803A0, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_1000836E8, a1);
}

uint64_t sub_10001C9F4(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  unint64_t v5 = sub_10001EA50();
  unint64_t v6 = sub_10001EAA4();
  unint64_t v7 = sub_10001E9F0();
  *unint64_t v4 = v2;
  v4[1] = sub_100003184;
  return URLRepresentableIntent<>.perform()(a2, v5, v6, v7);
}

uint64_t sub_10001CAC0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10001E2CC();
  *a1 = result;
  return result;
}

uint64_t sub_10001CAE8(uint64_t a1)
{
  unint64_t v2 = sub_10001C838();

  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

unint64_t sub_10001CB28()
{
  unint64_t result = qword_100081728;
  if (!qword_100081728)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100081728);
  }
  return result;
}

uint64_t sub_10001CB7C()
{
  return sub_100009DAC(&qword_100081730, &qword_100081738);
}

uint64_t sub_10001CBB8()
{
  uint64_t v0 = sub_10005E7F0();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_10005E830();
  __chkstk_darwin(v4 - 8);
  uint64_t v5 = sub_10005E990();
  __chkstk_darwin(v5 - 8);
  uint64_t v6 = sub_10005E800();
  __chkstk_darwin(v6 - 8);
  sub_100005268(&qword_100081738);
  sub_10005E980();
  sub_10005E820();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, enum case for LocalizedStringResource.BundleDescription.main(_:), v0);
  sub_10005E810();
  sub_100009DAC(&qword_100081848, &qword_100081850);
  uint64_t result = sub_10005E7D0();
  qword_100083700 = result;
  return result;
}

uint64_t sub_10001CE30()
{
  uint64_t v0 = sub_100005268(&qword_100080858);
  __chkstk_darwin(v0 - 8);
  uint64_t v2 = (char *)v12 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12[0] = sub_10005E7F0();
  uint64_t v3 = *(void *)(v12[0] - 8);
  __chkstk_darwin(v12[0]);
  uint64_t v5 = (char *)v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10005E830();
  __chkstk_darwin(v6 - 8);
  uint64_t v7 = sub_10005E990();
  __chkstk_darwin(v7 - 8);
  uint64_t v8 = sub_10005E800();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v10 = sub_10005E780();
  sub_1000052E4(v10, qword_100083708);
  sub_1000052AC(v10, (uint64_t)qword_100083708);
  sub_10005E980();
  sub_10005E820();
  (*(void (**)(char *, void, void))(v3 + 104))(v5, enum case for LocalizedStringResource.BundleDescription.main(_:), v12[0]);
  sub_10005E810();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(v2, 1, 1, v8);
  return sub_10005E770();
}

uint64_t sub_10001D11C(uint64_t a1)
{
  return sub_100005E9C(a1, qword_100083720);
}

uint64_t sub_10001D140()
{
  uint64_t v0 = sub_100005268(&qword_100080B20);
  sub_1000052E4(v0, qword_100083738);
  uint64_t v1 = sub_1000052AC(v0, (uint64_t)qword_100083738);
  sub_10005E570();
  uint64_t v2 = sub_10005E580();
  uint64_t v3 = *(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56);

  return v3(v1, 0, 1, v2);
}

uint64_t sub_10001D1F8()
{
  uint64_t result = swift_getKeyPath();
  qword_100083750 = result;
  return result;
}

uint64_t sub_10001D224()
{
  if (qword_1000803C8 != -1) {
    swift_once();
  }

  return swift_retain();
}

unint64_t sub_10001D284()
{
  unint64_t result = qword_100081740;
  if (!qword_100081740)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100081740);
  }
  return result;
}

unint64_t sub_10001D2DC()
{
  unint64_t result = qword_100081748;
  if (!qword_100081748)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100081748);
  }
  return result;
}

uint64_t sub_10001D330()
{
  return *(void *)(swift_getOpaqueTypeConformance2() + 8);
}

uint64_t sub_10001D364(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_10001D37C(a1, a2, a3, (void (*)(void))sub_10001CB28);
}

uint64_t sub_10001D37C(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10001D3D0@<X0>(uint64_t a1@<X8>)
{
  return sub_1000085D4(&qword_1000803B8, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_100083720, a1);
}

uint64_t sub_10001D408@<X0>(uint64_t a1@<X8>)
{
  if (qword_1000803C0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100005268(&qword_100080B20);
  uint64_t v3 = sub_1000052AC(v2, (uint64_t)qword_100083738);

  return sub_100009E38(v3, a1);
}

uint64_t sub_10001D484(uint64_t a1)
{
  uint64_t v5 = *v1;
  uint64_t v4 = v1[1];
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v6;
  *uint64_t v6 = v2;
  v6[1] = sub_100009F48;
  return sub_100042460(a1, v5, v4);
}

uint64_t sub_10001D530@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10001E5B0();
  *a1 = result;
  a1[1] = v3;
  return result;
}

unint64_t sub_10001D558()
{
  return 0xD000000000000021;
}

unint64_t sub_10001D578()
{
  unint64_t result = qword_100081758;
  if (!qword_100081758)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100081758);
  }
  return result;
}

unint64_t sub_10001D5D0()
{
  unint64_t result = qword_100081760;
  if (!qword_100081760)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100081760);
  }
  return result;
}

uint64_t sub_10001D624(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return _swift_task_switch(sub_10001D644, 0, 0);
}

uint64_t sub_10001D644()
{
  uint64_t v1 = *(unsigned __int8 **)(v0 + 16);
  id v2 = [self sharedController];
  unsigned __int8 v3 = [v2 hardwareButtonAssistantIsEnabled];

  unsigned __int8 *v1 = v3;
  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

uint64_t sub_10001D6E8(void *a1)
{
  if (qword_1000803A8 != -1) {
    swift_once();
  }
  *a1 = qword_100083700;
  unsigned __int8 v3 = *(uint64_t (**)(void))(v1 + 8);
  swift_retain();
  return sub_1000053F4(v3);
}

unint64_t sub_10001D7B0()
{
  unint64_t result = qword_100081770;
  if (!qword_100081770)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100081770);
  }
  return result;
}

uint64_t sub_10001D804(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v4;
  unint64_t v5 = sub_10001DDB4();
  *uint64_t v4 = v2;
  v4[1] = sub_100003BF0;
  return _UniqueEntityQuery.allEntities()(a2, v5);
}

unint64_t sub_10001D8B8()
{
  unint64_t result = qword_100081780;
  if (!qword_100081780)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100081780);
  }
  return result;
}

unint64_t sub_10001D910()
{
  unint64_t result = qword_100081788;
  if (!qword_100081788)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100081788);
  }
  return result;
}

unint64_t sub_10001D968()
{
  unint64_t result = qword_100081790[0];
  if (!qword_100081790[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_100081790);
  }
  return result;
}

uint64_t sub_10001D9BC(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_10001DDB4();
  *unint64_t v5 = v2;
  v5[1] = sub_100003EE0;
  return _UniqueEntityQuery.entities(for:)(a1, a2, v6);
}

uint64_t sub_10001DA70(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v4;
  unint64_t v5 = sub_10001DDB4();
  *uint64_t v4 = v2;
  v4[1] = sub_100005568;
  return _UniqueEntityQuery.suggestedEntities()(a2, v5);
}

unint64_t sub_10001DB24()
{
  unint64_t result = qword_1000817A8;
  if (!qword_1000817A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000817A8);
  }
  return result;
}

unint64_t sub_10001DB7C()
{
  unint64_t result = qword_1000817B0;
  if (!qword_1000817B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000817B0);
  }
  return result;
}

unint64_t sub_10001DBD4()
{
  unint64_t result = qword_1000817B8;
  if (!qword_1000817B8)
  {
    sub_1000041B0(qword_1000817C0);
    sub_10001DB7C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000817B8);
  }
  return result;
}

uint64_t sub_10001DC48(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_10001D7B0();
  *unint64_t v5 = v2;
  v5[1] = sub_1000042AC;
  return EntityQuery.results()(a1, a2, v6);
}

unint64_t sub_10001DD04()
{
  unint64_t result = qword_1000817D8;
  if (!qword_1000817D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000817D8);
  }
  return result;
}

unint64_t sub_10001DD5C()
{
  unint64_t result = qword_1000817E0;
  if (!qword_1000817E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000817E0);
  }
  return result;
}

unint64_t sub_10001DDB4()
{
  unint64_t result = qword_1000817E8;
  if (!qword_1000817E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000817E8);
  }
  return result;
}

uint64_t sub_10001DE08()
{
  uint64_t v0 = qword_1000816E8;
  swift_bridgeObjectRetain();
  return v0;
}

unint64_t sub_10001DE44()
{
  unint64_t result = qword_1000817F0;
  if (!qword_1000817F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000817F0);
  }
  return result;
}

uint64_t sub_10001DE98(uint64_t a1)
{
  unint64_t v2 = sub_10001D968();

  return EntityURLRepresentation.init(_:)(0xD000000000000043, 0x80000001000606F0, a1, v2);
}

unint64_t sub_10001DEF8()
{
  unint64_t result = qword_1000817F8;
  if (!qword_1000817F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000817F8);
  }
  return result;
}

unint64_t sub_10001DF50()
{
  unint64_t result = qword_100081800;
  if (!qword_100081800)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100081800);
  }
  return result;
}

unint64_t sub_10001DFA8()
{
  unint64_t result = qword_100081808;
  if (!qword_100081808)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100081808);
  }
  return result;
}

uint64_t sub_10001DFFC@<X0>(uint64_t *a1@<X8>)
{
  sub_10001D5D0();
  uint64_t result = sub_10005E3D0();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_10001E03C()
{
  sub_10001E9F0();
  uint64_t v2 = sub_10005E6A0();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
  return sub_10000538C(v3, v0, v2, v1);
}

uint64_t sub_10001E0D0@<X0>(uint64_t a1@<X8>)
{
  return sub_1000085D4(&qword_1000803B0, (uint64_t (*)(void))&type metadata accessor for TypeDisplayRepresentation, (uint64_t)qword_100083708, a1);
}

uint64_t sub_10001E108()
{
  return sub_100009DAC(&qword_100081818, &qword_100081820);
}

uint64_t sub_10001E144(uint64_t a1)
{
  unint64_t v2 = sub_10001D968();

  return static AppEntity.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_10001E194()
{
  unint64_t result = qword_100081828;
  if (!qword_100081828)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100081828);
  }
  return result;
}

uint64_t sub_10001E1E8@<X0>(uint64_t a1@<X8>)
{
  sub_10005E890();
  unint64_t v2 = (void *)sub_10005E880();
  sub_10005E860();

  return sub_1000269F0(5, a1);
}

uint64_t sub_10001E240(uint64_t a1)
{
  unint64_t v2 = sub_10001DFA8();

  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

ValueMetadata *type metadata accessor for TalkToSiriEntity.TalkToSiriEntityQuery()
{
  return &type metadata for TalkToSiriEntity.TalkToSiriEntityQuery;
}

ValueMetadata *type metadata accessor for TalkToSiriEntity.UpdateIntent_value()
{
  return &type metadata for TalkToSiriEntity.UpdateIntent_value;
}

ValueMetadata *type metadata accessor for TalkToSiriEntity()
{
  return &type metadata for TalkToSiriEntity;
}

ValueMetadata *type metadata accessor for OpenTalkToSiriEntity()
{
  return &type metadata for OpenTalkToSiriEntity;
}

uint64_t sub_10001E2CC()
{
  v17[0] = sub_10005E720();
  uint64_t v0 = *(void *)(v17[0] - 8);
  __chkstk_darwin(v17[0]);
  unint64_t v2 = (char *)v17 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100005268(&qword_100080848);
  uint64_t v4 = __chkstk_darwin(v3 - 8);
  unint64_t v6 = (char *)v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)v17 - v7;
  uint64_t v9 = sub_100005268(&qword_100080858);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_10005E800();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  sub_100005268(&qword_100081830);
  sub_10005E7E0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56))(v11, 1, 1, v12);
  v17[1] = 0;
  uint64_t v14 = sub_10005E390();
  uint64_t v15 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56);
  v15(v8, 1, 1, v14);
  v15(v6, 1, 1, v14);
  (*(void (**)(char *, void, void))(v0 + 104))(v2, enum case for InputConnectionBehavior.default(_:), v17[0]);
  sub_10001D968();
  return sub_10005E420();
}

uint64_t sub_10001E5B0()
{
  uint64_t v0 = sub_100005268(&qword_100080A68);
  __chkstk_darwin(v0 - 8);
  uint64_t v30 = (char *)&v22 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v31 = sub_10005E720();
  uint64_t v2 = *(void *)(v31 - 8);
  __chkstk_darwin(v31);
  uint64_t v4 = (char *)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100005268(&qword_100080848);
  uint64_t v6 = __chkstk_darwin(v5 - 8);
  uint64_t v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v22 - v9;
  uint64_t v11 = sub_100005268(&qword_100080858);
  __chkstk_darwin(v11 - 8);
  uint64_t v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = v13;
  uint64_t v14 = sub_10005E800();
  uint64_t v29 = v14;
  uint64_t v15 = *(void *)(v14 - 8);
  __chkstk_darwin(v14);
  uint64_t v24 = sub_100005268(&qword_100081830);
  sub_10005E7E0();
  uint64_t v28 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v15 + 56);
  v28(v13, 1, 1, v14);
  uint64_t v33 = 0;
  uint64_t v16 = sub_10005E390();
  uint64_t v17 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56);
  v17(v10, 1, 1, v16);
  v17(v8, 1, 1, v16);
  unsigned int v27 = enum case for InputConnectionBehavior.default(_:);
  uint64_t v18 = *(void (**)(void))(v2 + 104);
  uint64_t v25 = v2 + 104;
  uint64_t v26 = (void (*)(char *, void, uint64_t))v18;
  v18(v4);
  sub_10001D968();
  uint64_t v19 = v23;
  uint64_t v24 = sub_10005E420();
  sub_100005268(&qword_100080A80);
  sub_10005E7E0();
  v28(v19, 1, 1, v29);
  char v32 = 2;
  uint64_t v20 = sub_10005E9F0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v30, 1, 1, v20);
  v17(v10, 1, 1, v16);
  v26(v4, v27, v31);
  sub_10005E430();
  return v24;
}

unint64_t sub_10001E9F0()
{
  unint64_t result = qword_100081838;
  if (!qword_100081838)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100081838);
  }
  return result;
}

uint64_t sub_10001EA44@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  *a2 = *a1;
  return swift_retain();
}

unint64_t sub_10001EA50()
{
  unint64_t result = qword_100081858;
  if (!qword_100081858)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100081858);
  }
  return result;
}

unint64_t sub_10001EAA4()
{
  unint64_t result = qword_100081860;
  if (!qword_100081860)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100081860);
  }
  return result;
}

unint64_t sub_10001EAFC()
{
  unint64_t result = qword_100081878;
  if (!qword_100081878)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100081878);
  }
  return result;
}

unint64_t sub_10001EB54()
{
  unint64_t result = qword_100081880;
  if (!qword_100081880)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100081880);
  }
  return result;
}

uint64_t sub_10001EBA8()
{
  return swift_retain();
}

uint64_t sub_10001EBB0@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  *a2 = *a1;
  return swift_retain();
}

uint64_t sub_10001EBBC()
{
  return swift_retain();
}

uint64_t sub_10001EBC4@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  *a2 = *(void *)(a1 + 8);
  return swift_retain();
}

uint64_t sub_10001EBD0()
{
  return swift_retain();
}

uint64_t sub_10001EBD8@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  *a2 = *(void *)(a1 + 32);
  return swift_retain();
}

uint64_t sub_10001EBE4()
{
  return swift_retain();
}

uint64_t sub_10001EBEC@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  *a2 = *(void *)(a1 + 16);
  return swift_retain();
}

uint64_t sub_10001EBF8()
{
  return swift_retain();
}

uint64_t sub_10001EC00@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  *a2 = *(void *)(a1 + 24);
  return swift_retain();
}

uint64_t sub_10001EC0C()
{
  return swift_retain();
}

uint64_t sub_10001EC14@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  *a2 = *(void *)(a1 + 40);
  return swift_retain();
}

uint64_t sub_10001EC20(uint64_t a1)
{
  return sub_100005E9C(a1, qword_100083758);
}

double sub_10001EC44@<D0>(_OWORD *a1@<X8>)
{
  sub_10005E3F0();
  double result = *(double *)&v3;
  *a1 = v3;
  a1[1] = v4;
  a1[2] = v5;
  return result;
}

double sub_10001EC88@<D0>(_OWORD *a1@<X8>)
{
  sub_10005E3F0();
  double result = *(double *)&v3;
  *a1 = v3;
  a1[1] = v4;
  a1[2] = v5;
  return result;
}

uint64_t sub_10001ECCC()
{
  return swift_release();
}

unint64_t sub_10001ED90()
{
  unint64_t result = qword_100081888;
  if (!qword_100081888)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100081888);
  }
  return result;
}

uint64_t sub_10001EDE4(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_10002693C();
  unint64_t v5 = sub_100024F8C();

  return static URLRepresentableIntent<>.urlRepresentation.getter(a1, v4, a2, v5);
}

unint64_t sub_10001EE50()
{
  unint64_t result = qword_100081890;
  if (!qword_100081890)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100081890);
  }
  return result;
}

unint64_t sub_10001EEA8()
{
  unint64_t result = qword_100081898;
  if (!qword_100081898)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100081898);
  }
  return result;
}

uint64_t sub_10001EEFC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100024CE0(a1, a2, a3, (void (*)(void))sub_10001ED90);
}

uint64_t sub_10001EF14@<X0>(uint64_t a1@<X8>)
{
  return sub_100025678(&qword_1000803D0, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_100083758, a1);
}

uint64_t sub_10001EF4C(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  unint64_t v5 = sub_10002693C();
  unint64_t v6 = sub_100026990();
  unint64_t v7 = sub_100024F8C();
  *unint64_t v4 = v2;
  v4[1] = sub_100003184;
  return URLRepresentableIntent<>.perform()(a2, v5, v6, v7);
}

uint64_t sub_10001F018@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100025E34();
  *a1 = result;
  return result;
}

uint64_t sub_10001F040(uint64_t a1)
{
  unint64_t v2 = sub_10001ED90();

  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

unint64_t sub_10001F080()
{
  unint64_t result = qword_1000818A8;
  if (!qword_1000818A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000818A8);
  }
  return result;
}

uint64_t sub_10001F0D4()
{
  return sub_100009DAC(&qword_1000818B0, &qword_1000818B8);
}

id sub_10001F110()
{
  id result = [self sharedController];
  qword_100083770 = (uint64_t)result;
  return result;
}

uint64_t sub_10001F14C()
{
  uint64_t v0 = sub_100005268(&qword_100080858);
  __chkstk_darwin(v0 - 8);
  unint64_t v2 = (char *)v12 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12[0] = sub_10005E7F0();
  uint64_t v3 = *(void *)(v12[0] - 8);
  __chkstk_darwin(v12[0]);
  unint64_t v5 = (char *)v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10005E830();
  __chkstk_darwin(v6 - 8);
  uint64_t v7 = sub_10005E990();
  __chkstk_darwin(v7 - 8);
  uint64_t v8 = sub_10005E800();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v10 = sub_10005E780();
  sub_1000052E4(v10, qword_100083778);
  sub_1000052AC(v10, (uint64_t)qword_100083778);
  sub_10005E980();
  sub_10005E820();
  (*(void (**)(char *, void, void))(v3 + 104))(v5, enum case for LocalizedStringResource.BundleDescription.main(_:), v12[0]);
  sub_10005E810();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(v2, 1, 1, v8);
  return sub_10005E770();
}

uint64_t sub_10001F438(uint64_t a1)
{
  return sub_100005E9C(a1, qword_100083790);
}

uint64_t sub_10001F45C(uint64_t a1)
{
  return sub_1000240D0(a1, qword_1000837A8);
}

uint64_t sub_10001F480()
{
  uint64_t result = swift_getKeyPath();
  qword_1000837C0 = result;
  return result;
}

uint64_t sub_10001F4A8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[39] = a2;
  v3[40] = a3;
  v3[38] = a1;
  sub_100005268(&qword_100080AF0);
  v3[41] = swift_task_alloc();
  sub_100005268(&qword_100080AF8);
  v3[42] = swift_task_alloc();
  sub_100005268(&qword_100081B58);
  v3[43] = swift_task_alloc();
  uint64_t v4 = sub_10005E390();
  v3[44] = v4;
  v3[45] = *(void *)(v4 - 8);
  v3[46] = swift_task_alloc();
  uint64_t v5 = sub_100005268(&qword_100081AF8);
  v3[47] = v5;
  v3[48] = *(void *)(v5 - 8);
  v3[49] = swift_task_alloc();
  v3[50] = swift_task_alloc();
  return _swift_task_switch(sub_10001F66C, 0, 0);
}

uint64_t sub_10001F66C()
{
  sub_10005E3F0();
  long long v1 = *(_OWORD *)(v0 + 32);
  *(_OWORD *)(v0 + 64) = *(_OWORD *)(v0 + 16);
  long long v2 = *(_OWORD *)(v0 + 48);
  *(_OWORD *)(v0 + 80) = v1;
  *(_OWORD *)(v0 + 96) = v2;
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 408) = v3;
  unint64_t v4 = sub_100024FE4();
  *uint64_t v3 = v0;
  v3[1] = sub_10001F750;
  uint64_t v5 = *(void *)(v0 + 400);
  return IntentDialog._CapturedContent.init<>(entity:_:)(v5, v0 + 64, sub_10001FF0C, 0, &type metadata for AnnounceNotificationEntity, v4);
}

uint64_t sub_10001F750()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_10001F84C, 0, 0);
}

uint64_t sub_10001F84C()
{
  sub_10005E3F0();
  uint64_t v1 = *(void *)(v0 + 112);
  *(void *)(v0 + 160) = v1;
  uint64_t v2 = *(void *)(v0 + 120);
  uint64_t v3 = *(void *)(v0 + 128);
  *(void *)(v0 + 416) = v1;
  *(void *)(v0 + 424) = v2;
  uint64_t v4 = *(void *)(v0 + 136);
  uint64_t v5 = *(void *)(v0 + 144);
  *(void *)(v0 + 432) = v3;
  *(void *)(v0 + 440) = v4;
  uint64_t v6 = *(void *)(v0 + 152);
  *(void *)(v0 + 448) = v5;
  *(void *)(v0 + 456) = v6;
  *(void *)(v0 + 168) = v2;
  *(void *)(v0 + 176) = v3;
  *(void *)(v0 + 184) = v4;
  *(void *)(v0 + 192) = v5;
  *(void *)(v0 + 200) = v6;
  sub_10005E3F0();
  *(unsigned char *)(v0 + 488) = *(unsigned char *)(v0 + 489);
  if (qword_1000803F8 != -1) {
    swift_once();
  }
  uint64_t v7 = qword_1000837C0;
  *(void *)(v0 + 464) = qword_1000837C0;
  swift_retain();
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v0 + 472) = v8;
  uint64_t v9 = sub_100009DAC(&qword_100081A88, &qword_100081A90);
  *uint64_t v8 = v0;
  v8[1] = sub_10001F9C4;
  return AppEntity._setValue<A, B, C>(_:for:)(v0 + 488, v7, &type metadata for Bool, v9);
}

uint64_t sub_10001F9C4()
{
  *(void *)(*(void *)v1 + 480) = v0;
  swift_task_dealloc();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  if (v0) {
    uint64_t v2 = sub_10001FE48;
  }
  else {
    uint64_t v2 = sub_10001FBB4;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_10001FBB4()
{
  uint64_t v1 = *(void *)(v0 + 400);
  uint64_t v2 = *(void *)(v0 + 376);
  uint64_t v3 = *(void *)(v0 + 384);
  uint64_t v12 = *(void *)(v0 + 392);
  uint64_t v14 = *(void *)(v0 + 360);
  uint64_t v15 = *(void *)(v0 + 352);
  uint64_t v4 = *(void *)(v0 + 328);
  uint64_t v5 = *(void *)(v0 + 336);
  uint64_t v13 = *(void *)(v0 + 368);
  sub_10005E3F0();
  long long v6 = *(_OWORD *)(v0 + 272);
  long long v7 = *(_OWORD *)(v0 + 288);
  *(_OWORD *)(v0 + 208) = *(_OWORD *)(v0 + 256);
  *(_OWORD *)(v0 + 224) = v6;
  *(_OWORD *)(v0 + 240) = v7;
  uint64_t v8 = sub_10005E750();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v5, 1, 1, v8);
  uint64_t v9 = sub_10005E790();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v4, 1, 1, v9);
  sub_10001F080();
  sub_100025554();
  sub_10005E350();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v12, v1, v2);
  sub_10005E370();
  sub_10005E3A0();
  (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v13, v15);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v10 = *(uint64_t (**)(void))(v0 + 8);
  return v10();
}

uint64_t sub_10001FE48()
{
  (*(void (**)(void, void))(v0[48] + 8))(v0[50], v0[47]);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_10001FF0C()
{
  return sub_10001FF30(&qword_1000803F8);
}

uint64_t sub_10001FF30(void *a1)
{
  uint64_t v2 = sub_100005268(&qword_100081B00);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*a1 != -1) {
    swift_once();
  }
  swift_retain();
  sub_10005E5D0();
  swift_release();
  sub_100025554();
  sub_100009DAC(&qword_100081B08, &qword_100081B00);
  sub_10005E5C0();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_1000200A0(uint64_t a1, uint64_t a2)
{
  return sub_100024B94(a1, a2, &qword_1000803F8);
}

unint64_t sub_1000200C8()
{
  unint64_t result = qword_1000818C0;
  if (!qword_1000818C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000818C0);
  }
  return result;
}

unint64_t sub_100020120()
{
  unint64_t result = qword_1000818C8;
  if (!qword_1000818C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000818C8);
  }
  return result;
}

uint64_t sub_100020174()
{
  return *(void *)(swift_getOpaqueTypeConformance2() + 8);
}

uint64_t sub_1000201A8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100024CE0(a1, a2, a3, (void (*)(void))sub_10001F080);
}

uint64_t sub_1000201C0@<X0>(uint64_t a1@<X8>)
{
  return sub_100025678(&qword_1000803E8, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_100083790, a1);
}

uint64_t sub_1000201F8@<X0>(uint64_t a1@<X8>)
{
  return sub_100024D90(&qword_1000803F0, (uint64_t)qword_1000837A8, a1);
}

uint64_t sub_10002021C(uint64_t a1)
{
  uint64_t v5 = *v1;
  uint64_t v4 = v1[1];
  long long v6 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v6;
  *long long v6 = v2;
  v6[1] = sub_1000042AC;
  return sub_10001F4A8(a1, v5, v4);
}

uint64_t sub_1000202C8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10002613C(0xD000000000000038, 0x8000000100060870);
  *a1 = result;
  a1[1] = v3;
  return result;
}

unint64_t sub_100020308()
{
  return 0xD00000000000002BLL;
}

unint64_t sub_100020328()
{
  unint64_t result = qword_1000818D8;
  if (!qword_1000818D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000818D8);
  }
  return result;
}

uint64_t sub_10002037C()
{
  return sub_100009DAC(&qword_1000818E0, &qword_1000818E8);
}

uint64_t sub_1000203B8(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return _swift_task_switch(sub_1000203D8, 0, 0);
}

uint64_t sub_1000203D8()
{
  uint64_t v1 = *(unsigned __int8 **)(v0 + 16);
  id v2 = [self sharedController];
  unsigned __int8 v3 = [v2 isAnnounceNotificationEnabled];

  unsigned __int8 *v1 = v3;
  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

uint64_t sub_10002047C(uint64_t a1, unsigned char *a2)
{
  *(unsigned char *)(v2 + 16) = *a2;
  return _swift_task_switch(sub_1000204A0, 0, 0);
}

uint64_t sub_1000204A0()
{
  uint64_t v1 = *(unsigned __int8 *)(v0 + 16);
  id v2 = [self sharedController];
  [v2 setAnnounceNotificationEnabled:v1];

  unsigned __int8 v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

uint64_t sub_100020538(uint64_t a1)
{
  return sub_100005E9C(a1, qword_1000837C8);
}

uint64_t sub_10002055C(uint64_t a1)
{
  return sub_1000240D0(a1, qword_1000837E0);
}

uint64_t sub_100020580()
{
  uint64_t result = swift_getKeyPath();
  qword_1000837F8 = result;
  return result;
}

uint64_t sub_1000205A8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[39] = a2;
  v3[40] = a3;
  v3[38] = a1;
  sub_100005268(&qword_100080AF0);
  v3[41] = swift_task_alloc();
  sub_100005268(&qword_100080AF8);
  v3[42] = swift_task_alloc();
  sub_100005268(&qword_100081B48);
  v3[43] = swift_task_alloc();
  uint64_t v4 = sub_10005E390();
  v3[44] = v4;
  v3[45] = *(void *)(v4 - 8);
  v3[46] = swift_task_alloc();
  uint64_t v5 = sub_100005268(&qword_100081AF8);
  v3[47] = v5;
  v3[48] = *(void *)(v5 - 8);
  v3[49] = swift_task_alloc();
  v3[50] = swift_task_alloc();
  return _swift_task_switch(sub_10002076C, 0, 0);
}

uint64_t sub_10002076C()
{
  sub_10005E3F0();
  long long v1 = *(_OWORD *)(v0 + 32);
  *(_OWORD *)(v0 + 64) = *(_OWORD *)(v0 + 16);
  long long v2 = *(_OWORD *)(v0 + 48);
  *(_OWORD *)(v0 + 80) = v1;
  *(_OWORD *)(v0 + 96) = v2;
  unsigned __int8 v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 408) = v3;
  unint64_t v4 = sub_100024FE4();
  *unsigned __int8 v3 = v0;
  v3[1] = sub_100020850;
  uint64_t v5 = *(void *)(v0 + 400);
  return IntentDialog._CapturedContent.init<>(entity:_:)(v5, v0 + 64, sub_100020F48, 0, &type metadata for AnnounceNotificationEntity, v4);
}

uint64_t sub_100020850()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_10002094C, 0, 0);
}

uint64_t sub_10002094C()
{
  sub_10005E3F0();
  uint64_t v1 = *(void *)(v0 + 112);
  *(void *)(v0 + 160) = v1;
  uint64_t v2 = *(void *)(v0 + 120);
  uint64_t v3 = *(void *)(v0 + 128);
  *(void *)(v0 + 416) = v1;
  *(void *)(v0 + 424) = v2;
  uint64_t v4 = *(void *)(v0 + 136);
  uint64_t v5 = *(void *)(v0 + 144);
  *(void *)(v0 + 432) = v3;
  *(void *)(v0 + 440) = v4;
  uint64_t v6 = *(void *)(v0 + 152);
  *(void *)(v0 + 448) = v5;
  *(void *)(v0 + 456) = v6;
  *(void *)(v0 + 168) = v2;
  *(void *)(v0 + 176) = v3;
  *(void *)(v0 + 184) = v4;
  *(void *)(v0 + 192) = v5;
  *(void *)(v0 + 200) = v6;
  sub_10005E3F0();
  *(unsigned char *)(v0 + 488) = *(unsigned char *)(v0 + 489);
  if (qword_100080410 != -1) {
    swift_once();
  }
  uint64_t v7 = qword_1000837F8;
  *(void *)(v0 + 464) = qword_1000837F8;
  swift_retain();
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v0 + 472) = v8;
  uint64_t v9 = sub_100009DAC(&qword_100081A88, &qword_100081A90);
  *uint64_t v8 = v0;
  v8[1] = sub_100020AC4;
  return AppEntity._setValue<A, B, C>(_:for:)(v0 + 488, v7, &type metadata for Bool, v9);
}

uint64_t sub_100020AC4()
{
  *(void *)(*(void *)v1 + 480) = v0;
  swift_task_dealloc();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  if (v0) {
    uint64_t v2 = sub_1000269EC;
  }
  else {
    uint64_t v2 = sub_100020CB4;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_100020CB4()
{
  uint64_t v1 = *(void *)(v0 + 400);
  uint64_t v2 = *(void *)(v0 + 376);
  uint64_t v3 = *(void *)(v0 + 384);
  uint64_t v12 = *(void *)(v0 + 392);
  uint64_t v14 = *(void *)(v0 + 360);
  uint64_t v15 = *(void *)(v0 + 352);
  uint64_t v4 = *(void *)(v0 + 328);
  uint64_t v5 = *(void *)(v0 + 336);
  uint64_t v13 = *(void *)(v0 + 368);
  sub_10005E3F0();
  long long v6 = *(_OWORD *)(v0 + 272);
  long long v7 = *(_OWORD *)(v0 + 288);
  *(_OWORD *)(v0 + 208) = *(_OWORD *)(v0 + 256);
  *(_OWORD *)(v0 + 224) = v6;
  *(_OWORD *)(v0 + 240) = v7;
  uint64_t v8 = sub_10005E750();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v5, 1, 1, v8);
  uint64_t v9 = sub_10005E790();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v4, 1, 1, v9);
  sub_100020328();
  sub_100025554();
  sub_10005E350();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v12, v1, v2);
  sub_10005E370();
  sub_10005E3A0();
  (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v13, v15);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v10 = *(uint64_t (**)(void))(v0 + 8);
  return v10();
}

uint64_t sub_100020F48()
{
  return sub_10001FF30(&qword_100080410);
}

uint64_t sub_100020F6C(uint64_t a1, uint64_t a2)
{
  return sub_100024B94(a1, a2, &qword_100080410);
}

unint64_t sub_100020F94()
{
  unint64_t result = qword_1000818F0;
  if (!qword_1000818F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000818F0);
  }
  return result;
}

unint64_t sub_100020FEC()
{
  unint64_t result = qword_1000818F8;
  if (!qword_1000818F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000818F8);
  }
  return result;
}

uint64_t sub_100021040()
{
  return *(void *)(swift_getOpaqueTypeConformance2() + 8);
}

uint64_t sub_100021074(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100024CE0(a1, a2, a3, (void (*)(void))sub_100020328);
}

uint64_t sub_10002108C@<X0>(uint64_t a1@<X8>)
{
  return sub_100025678(&qword_100080400, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_1000837C8, a1);
}

uint64_t sub_1000210C4@<X0>(uint64_t a1@<X8>)
{
  return sub_100024D90(&qword_100080408, (uint64_t)qword_1000837E0, a1);
}

uint64_t sub_1000210E8(uint64_t a1)
{
  uint64_t v5 = *v1;
  uint64_t v4 = v1[1];
  long long v6 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v6;
  *long long v6 = v2;
  v6[1] = sub_100009F48;
  return sub_1000205A8(a1, v5, v4);
}

uint64_t sub_100021194@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10002613C(0xD000000000000043, 0x8000000100060EE0);
  *a1 = result;
  a1[1] = v3;
  return result;
}

unint64_t sub_1000211D4()
{
  return 0xD00000000000003BLL;
}

unint64_t sub_1000211F4()
{
  unint64_t result = qword_100081908;
  if (!qword_100081908)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100081908);
  }
  return result;
}

uint64_t sub_100021248()
{
  return sub_100009DAC(&qword_100081910, &qword_100081918);
}

uint64_t sub_100021284(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return _swift_task_switch(sub_1000212A4, 0, 0);
}

uint64_t sub_1000212A4()
{
  uint64_t v1 = *(unsigned __int8 **)(v0 + 16);
  id v2 = [self sharedController];
  unsigned __int8 v3 = [v2 isAnnounceNotificationEnabledForPlatform:1];

  unsigned __int8 *v1 = v3;
  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

uint64_t sub_10002134C(uint64_t a1, unsigned char *a2)
{
  *(unsigned char *)(v2 + 16) = *a2;
  return _swift_task_switch(sub_100021370, 0, 0);
}

uint64_t sub_100021370()
{
  uint64_t v1 = *(unsigned __int8 *)(v0 + 16);
  id v2 = [self sharedController];
  [v2 setAnnounceNotificationEnabledForPlatform:1 annouceNotificationEnabled:v1];

  unsigned __int8 v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

uint64_t sub_10002140C(uint64_t a1)
{
  return sub_100005E9C(a1, qword_100083800);
}

uint64_t sub_100021430(uint64_t a1)
{
  return sub_1000240D0(a1, qword_100083818);
}

uint64_t sub_100021454()
{
  uint64_t result = swift_getKeyPath();
  qword_100083830 = result;
  return result;
}

uint64_t sub_10002147C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[39] = a2;
  v3[40] = a3;
  v3[38] = a1;
  sub_100005268(&qword_100080AF0);
  v3[41] = swift_task_alloc();
  sub_100005268(&qword_100080AF8);
  v3[42] = swift_task_alloc();
  sub_100005268(&qword_100081B38);
  v3[43] = swift_task_alloc();
  uint64_t v4 = sub_10005E390();
  v3[44] = v4;
  v3[45] = *(void *)(v4 - 8);
  v3[46] = swift_task_alloc();
  uint64_t v5 = sub_100005268(&qword_100081AF8);
  v3[47] = v5;
  v3[48] = *(void *)(v5 - 8);
  v3[49] = swift_task_alloc();
  v3[50] = swift_task_alloc();
  return _swift_task_switch(sub_100021640, 0, 0);
}

uint64_t sub_100021640()
{
  sub_10005E3F0();
  long long v1 = *(_OWORD *)(v0 + 32);
  *(_OWORD *)(v0 + 64) = *(_OWORD *)(v0 + 16);
  long long v2 = *(_OWORD *)(v0 + 48);
  *(_OWORD *)(v0 + 80) = v1;
  *(_OWORD *)(v0 + 96) = v2;
  unsigned __int8 v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 408) = v3;
  unint64_t v4 = sub_100024FE4();
  *unsigned __int8 v3 = v0;
  v3[1] = sub_100021724;
  uint64_t v5 = *(void *)(v0 + 400);
  return IntentDialog._CapturedContent.init<>(entity:_:)(v5, v0 + 64, sub_100021E1C, 0, &type metadata for AnnounceNotificationEntity, v4);
}

uint64_t sub_100021724()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_100021820, 0, 0);
}

uint64_t sub_100021820()
{
  sub_10005E3F0();
  uint64_t v1 = *(void *)(v0 + 112);
  *(void *)(v0 + 160) = v1;
  uint64_t v2 = *(void *)(v0 + 120);
  uint64_t v3 = *(void *)(v0 + 128);
  *(void *)(v0 + 416) = v1;
  *(void *)(v0 + 424) = v2;
  uint64_t v4 = *(void *)(v0 + 136);
  uint64_t v5 = *(void *)(v0 + 144);
  *(void *)(v0 + 432) = v3;
  *(void *)(v0 + 440) = v4;
  uint64_t v6 = *(void *)(v0 + 152);
  *(void *)(v0 + 448) = v5;
  *(void *)(v0 + 456) = v6;
  *(void *)(v0 + 168) = v2;
  *(void *)(v0 + 176) = v3;
  *(void *)(v0 + 184) = v4;
  *(void *)(v0 + 192) = v5;
  *(void *)(v0 + 200) = v6;
  sub_10005E3F0();
  *(unsigned char *)(v0 + 488) = *(unsigned char *)(v0 + 489);
  if (qword_100080428 != -1) {
    swift_once();
  }
  uint64_t v7 = qword_100083830;
  *(void *)(v0 + 464) = qword_100083830;
  swift_retain();
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v0 + 472) = v8;
  uint64_t v9 = sub_100009DAC(&qword_100081A88, &qword_100081A90);
  *uint64_t v8 = v0;
  v8[1] = sub_100021998;
  return AppEntity._setValue<A, B, C>(_:for:)(v0 + 488, v7, &type metadata for Bool, v9);
}

uint64_t sub_100021998()
{
  *(void *)(*(void *)v1 + 480) = v0;
  swift_task_dealloc();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  if (v0) {
    uint64_t v2 = sub_1000269EC;
  }
  else {
    uint64_t v2 = sub_100021B88;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_100021B88()
{
  uint64_t v1 = *(void *)(v0 + 400);
  uint64_t v2 = *(void *)(v0 + 376);
  uint64_t v3 = *(void *)(v0 + 384);
  uint64_t v12 = *(void *)(v0 + 392);
  uint64_t v14 = *(void *)(v0 + 360);
  uint64_t v15 = *(void *)(v0 + 352);
  uint64_t v4 = *(void *)(v0 + 328);
  uint64_t v5 = *(void *)(v0 + 336);
  uint64_t v13 = *(void *)(v0 + 368);
  sub_10005E3F0();
  long long v6 = *(_OWORD *)(v0 + 272);
  long long v7 = *(_OWORD *)(v0 + 288);
  *(_OWORD *)(v0 + 208) = *(_OWORD *)(v0 + 256);
  *(_OWORD *)(v0 + 224) = v6;
  *(_OWORD *)(v0 + 240) = v7;
  uint64_t v8 = sub_10005E750();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v5, 1, 1, v8);
  uint64_t v9 = sub_10005E790();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v4, 1, 1, v9);
  sub_1000211F4();
  sub_100025554();
  sub_10005E350();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v12, v1, v2);
  sub_10005E370();
  sub_10005E3A0();
  (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v13, v15);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v10 = *(uint64_t (**)(void))(v0 + 8);
  return v10();
}

uint64_t sub_100021E1C()
{
  return sub_10001FF30(&qword_100080428);
}

uint64_t sub_100021E40(uint64_t a1, uint64_t a2)
{
  return sub_100024B94(a1, a2, &qword_100080428);
}

unint64_t sub_100021E68()
{
  unint64_t result = qword_100081920;
  if (!qword_100081920)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100081920);
  }
  return result;
}

unint64_t sub_100021EC0()
{
  unint64_t result = qword_100081928;
  if (!qword_100081928)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100081928);
  }
  return result;
}

uint64_t sub_100021F14()
{
  return *(void *)(swift_getOpaqueTypeConformance2() + 8);
}

uint64_t sub_100021F48(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100024CE0(a1, a2, a3, (void (*)(void))sub_1000211F4);
}

uint64_t sub_100021F60@<X0>(uint64_t a1@<X8>)
{
  return sub_100025678(&qword_100080418, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_100083800, a1);
}

uint64_t sub_100021F98@<X0>(uint64_t a1@<X8>)
{
  return sub_100024D90(&qword_100080420, (uint64_t)qword_100083818, a1);
}

uint64_t sub_100021FBC(uint64_t a1)
{
  uint64_t v5 = *v1;
  uint64_t v4 = v1[1];
  long long v6 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v6;
  *long long v6 = v2;
  v6[1] = sub_100009F48;
  return sub_10002147C(a1, v5, v4);
}

uint64_t sub_100022068@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10002613C(0xD000000000000040, 0x8000000100060DC0);
  *a1 = result;
  a1[1] = v3;
  return result;
}

unint64_t sub_1000220A8()
{
  return 0xD000000000000038;
}

unint64_t sub_1000220C8()
{
  unint64_t result = qword_100081938;
  if (!qword_100081938)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100081938);
  }
  return result;
}

uint64_t sub_10002211C()
{
  return sub_100009DAC(&qword_100081940, &qword_100081948);
}

uint64_t sub_100022158(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return _swift_task_switch(sub_100022178, 0, 0);
}

uint64_t sub_100022178()
{
  uint64_t v1 = *(unsigned __int8 **)(v0 + 16);
  id v2 = [self sharedController];
  unsigned __int8 v3 = [v2 isAnnounceNotificationEnabledForPlatform:2];

  unsigned __int8 *v1 = v3;
  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

uint64_t sub_100022220(uint64_t a1, unsigned char *a2)
{
  *(unsigned char *)(v2 + 16) = *a2;
  return _swift_task_switch(sub_100022244, 0, 0);
}

uint64_t sub_100022244()
{
  uint64_t v1 = *(unsigned __int8 *)(v0 + 16);
  id v2 = [self sharedController];
  [v2 setAnnounceNotificationEnabledForPlatform:2 annouceNotificationEnabled:v1];

  unsigned __int8 v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

uint64_t sub_1000222E0(uint64_t a1)
{
  return sub_100005E9C(a1, qword_100083838);
}

uint64_t sub_100022304(uint64_t a1)
{
  return sub_1000240D0(a1, qword_100083850);
}

uint64_t sub_100022328()
{
  uint64_t result = swift_getKeyPath();
  qword_100083868 = result;
  return result;
}

uint64_t sub_100022350(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[39] = a2;
  v3[40] = a3;
  v3[38] = a1;
  sub_100005268(&qword_100080AF0);
  v3[41] = swift_task_alloc();
  sub_100005268(&qword_100080AF8);
  v3[42] = swift_task_alloc();
  sub_100005268(&qword_100081B28);
  v3[43] = swift_task_alloc();
  uint64_t v4 = sub_10005E390();
  v3[44] = v4;
  v3[45] = *(void *)(v4 - 8);
  v3[46] = swift_task_alloc();
  uint64_t v5 = sub_100005268(&qword_100081AF8);
  v3[47] = v5;
  v3[48] = *(void *)(v5 - 8);
  v3[49] = swift_task_alloc();
  v3[50] = swift_task_alloc();
  return _swift_task_switch(sub_100022514, 0, 0);
}

uint64_t sub_100022514()
{
  sub_10005E3F0();
  long long v1 = *(_OWORD *)(v0 + 32);
  *(_OWORD *)(v0 + 64) = *(_OWORD *)(v0 + 16);
  long long v2 = *(_OWORD *)(v0 + 48);
  *(_OWORD *)(v0 + 80) = v1;
  *(_OWORD *)(v0 + 96) = v2;
  unsigned __int8 v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 408) = v3;
  unint64_t v4 = sub_100024FE4();
  *unsigned __int8 v3 = v0;
  v3[1] = sub_1000225F8;
  uint64_t v5 = *(void *)(v0 + 400);
  return IntentDialog._CapturedContent.init<>(entity:_:)(v5, v0 + 64, sub_100022CF0, 0, &type metadata for AnnounceNotificationEntity, v4);
}

uint64_t sub_1000225F8()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_1000226F4, 0, 0);
}

uint64_t sub_1000226F4()
{
  sub_10005E3F0();
  uint64_t v1 = *(void *)(v0 + 112);
  *(void *)(v0 + 160) = v1;
  uint64_t v2 = *(void *)(v0 + 120);
  uint64_t v3 = *(void *)(v0 + 128);
  *(void *)(v0 + 416) = v1;
  *(void *)(v0 + 424) = v2;
  uint64_t v4 = *(void *)(v0 + 136);
  uint64_t v5 = *(void *)(v0 + 144);
  *(void *)(v0 + 432) = v3;
  *(void *)(v0 + 440) = v4;
  uint64_t v6 = *(void *)(v0 + 152);
  *(void *)(v0 + 448) = v5;
  *(void *)(v0 + 456) = v6;
  *(void *)(v0 + 168) = v2;
  *(void *)(v0 + 176) = v3;
  *(void *)(v0 + 184) = v4;
  *(void *)(v0 + 192) = v5;
  *(void *)(v0 + 200) = v6;
  sub_10005E3F0();
  *(unsigned char *)(v0 + 488) = *(unsigned char *)(v0 + 489);
  if (qword_100080440 != -1) {
    swift_once();
  }
  uint64_t v7 = qword_100083868;
  *(void *)(v0 + 464) = qword_100083868;
  swift_retain();
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v0 + 472) = v8;
  uint64_t v9 = sub_100009DAC(&qword_100081A88, &qword_100081A90);
  *uint64_t v8 = v0;
  v8[1] = sub_10002286C;
  return AppEntity._setValue<A, B, C>(_:for:)(v0 + 488, v7, &type metadata for Bool, v9);
}

uint64_t sub_10002286C()
{
  *(void *)(*(void *)v1 + 480) = v0;
  swift_task_dealloc();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  if (v0) {
    uint64_t v2 = sub_1000269EC;
  }
  else {
    uint64_t v2 = sub_100022A5C;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_100022A5C()
{
  uint64_t v1 = *(void *)(v0 + 400);
  uint64_t v2 = *(void *)(v0 + 376);
  uint64_t v3 = *(void *)(v0 + 384);
  uint64_t v12 = *(void *)(v0 + 392);
  uint64_t v14 = *(void *)(v0 + 360);
  uint64_t v15 = *(void *)(v0 + 352);
  uint64_t v4 = *(void *)(v0 + 328);
  uint64_t v5 = *(void *)(v0 + 336);
  uint64_t v13 = *(void *)(v0 + 368);
  sub_10005E3F0();
  long long v6 = *(_OWORD *)(v0 + 272);
  long long v7 = *(_OWORD *)(v0 + 288);
  *(_OWORD *)(v0 + 208) = *(_OWORD *)(v0 + 256);
  *(_OWORD *)(v0 + 224) = v6;
  *(_OWORD *)(v0 + 240) = v7;
  uint64_t v8 = sub_10005E750();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v5, 1, 1, v8);
  uint64_t v9 = sub_10005E790();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v4, 1, 1, v9);
  sub_1000220C8();
  sub_100025554();
  sub_10005E350();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v12, v1, v2);
  sub_10005E370();
  sub_10005E3A0();
  (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v13, v15);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v10 = *(uint64_t (**)(void))(v0 + 8);
  return v10();
}

uint64_t sub_100022CF0()
{
  return sub_10001FF30(&qword_100080440);
}

uint64_t sub_100022D14(uint64_t a1, uint64_t a2)
{
  return sub_100024B94(a1, a2, &qword_100080440);
}

unint64_t sub_100022D3C()
{
  unint64_t result = qword_100081950;
  if (!qword_100081950)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100081950);
  }
  return result;
}

unint64_t sub_100022D94()
{
  unint64_t result = qword_100081958;
  if (!qword_100081958)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100081958);
  }
  return result;
}

uint64_t sub_100022DE8()
{
  return *(void *)(swift_getOpaqueTypeConformance2() + 8);
}

uint64_t sub_100022E1C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100024CE0(a1, a2, a3, (void (*)(void))sub_1000220C8);
}

uint64_t sub_100022E34@<X0>(uint64_t a1@<X8>)
{
  return sub_100025678(&qword_100080430, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_100083838, a1);
}

uint64_t sub_100022E6C@<X0>(uint64_t a1@<X8>)
{
  return sub_100024D90(&qword_100080438, (uint64_t)qword_100083850, a1);
}

uint64_t sub_100022E90(uint64_t a1)
{
  uint64_t v5 = *v1;
  uint64_t v4 = v1[1];
  long long v6 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v6;
  *long long v6 = v2;
  v6[1] = sub_100009F48;
  return sub_100022350(a1, v5, v4);
}

uint64_t sub_100022F3C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10002613C(0xD000000000000044, 0x8000000100060C90);
  *a1 = result;
  a1[1] = v3;
  return result;
}

unint64_t sub_100022F7C()
{
  return 0xD00000000000003CLL;
}

unint64_t sub_100022F9C()
{
  unint64_t result = qword_100081968;
  if (!qword_100081968)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100081968);
  }
  return result;
}

uint64_t sub_100022FF0()
{
  return sub_100009DAC(&qword_100081970, &qword_100081978);
}

uint64_t sub_10002302C(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return _swift_task_switch(sub_10002304C, 0, 0);
}

uint64_t sub_10002304C()
{
  uint64_t v1 = *(unsigned __int8 **)(v0 + 16);
  id v2 = [self sharedController];
  unsigned __int8 v3 = [v2 isAnnounceNotificationEnabledForPlatform:3];

  unsigned __int8 *v1 = v3;
  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

uint64_t sub_1000230F4(uint64_t a1, unsigned char *a2)
{
  *(unsigned char *)(v2 + 16) = *a2;
  return _swift_task_switch(sub_100023118, 0, 0);
}

uint64_t sub_100023118()
{
  uint64_t v1 = *(unsigned __int8 *)(v0 + 16);
  id v2 = [self sharedController];
  [v2 setAnnounceNotificationEnabledForPlatform:3 annouceNotificationEnabled:v1];

  unsigned __int8 v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

uint64_t sub_1000231B4(uint64_t a1)
{
  return sub_100005E9C(a1, qword_100083870);
}

uint64_t sub_1000231D8(uint64_t a1)
{
  return sub_1000240D0(a1, qword_100083888);
}

uint64_t sub_1000231FC()
{
  uint64_t result = swift_getKeyPath();
  qword_1000838A0 = result;
  return result;
}

uint64_t sub_100023224(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[39] = a2;
  v3[40] = a3;
  v3[38] = a1;
  sub_100005268(&qword_100080AF0);
  v3[41] = swift_task_alloc();
  sub_100005268(&qword_100080AF8);
  v3[42] = swift_task_alloc();
  sub_100005268(&qword_100081B18);
  v3[43] = swift_task_alloc();
  uint64_t v4 = sub_10005E390();
  v3[44] = v4;
  v3[45] = *(void *)(v4 - 8);
  v3[46] = swift_task_alloc();
  uint64_t v5 = sub_100005268(&qword_100081AF8);
  v3[47] = v5;
  v3[48] = *(void *)(v5 - 8);
  v3[49] = swift_task_alloc();
  v3[50] = swift_task_alloc();
  return _swift_task_switch(sub_1000233E8, 0, 0);
}

uint64_t sub_1000233E8()
{
  sub_10005E3F0();
  long long v1 = *(_OWORD *)(v0 + 32);
  *(_OWORD *)(v0 + 64) = *(_OWORD *)(v0 + 16);
  long long v2 = *(_OWORD *)(v0 + 48);
  *(_OWORD *)(v0 + 80) = v1;
  *(_OWORD *)(v0 + 96) = v2;
  unsigned __int8 v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 408) = v3;
  unint64_t v4 = sub_100024FE4();
  *unsigned __int8 v3 = v0;
  v3[1] = sub_1000234CC;
  uint64_t v5 = *(void *)(v0 + 400);
  return IntentDialog._CapturedContent.init<>(entity:_:)(v5, v0 + 64, sub_100023BC4, 0, &type metadata for AnnounceNotificationEntity, v4);
}

uint64_t sub_1000234CC()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_1000235C8, 0, 0);
}

uint64_t sub_1000235C8()
{
  sub_10005E3F0();
  uint64_t v1 = *(void *)(v0 + 112);
  *(void *)(v0 + 160) = v1;
  uint64_t v2 = *(void *)(v0 + 120);
  uint64_t v3 = *(void *)(v0 + 128);
  *(void *)(v0 + 416) = v1;
  *(void *)(v0 + 424) = v2;
  uint64_t v4 = *(void *)(v0 + 136);
  uint64_t v5 = *(void *)(v0 + 144);
  *(void *)(v0 + 432) = v3;
  *(void *)(v0 + 440) = v4;
  uint64_t v6 = *(void *)(v0 + 152);
  *(void *)(v0 + 448) = v5;
  *(void *)(v0 + 456) = v6;
  *(void *)(v0 + 168) = v2;
  *(void *)(v0 + 176) = v3;
  *(void *)(v0 + 184) = v4;
  *(void *)(v0 + 192) = v5;
  *(void *)(v0 + 200) = v6;
  sub_10005E3F0();
  *(unsigned char *)(v0 + 488) = *(unsigned char *)(v0 + 489);
  if (qword_100080458 != -1) {
    swift_once();
  }
  uint64_t v7 = qword_1000838A0;
  *(void *)(v0 + 464) = qword_1000838A0;
  swift_retain();
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v0 + 472) = v8;
  uint64_t v9 = sub_100009DAC(&qword_100081A88, &qword_100081A90);
  *uint64_t v8 = v0;
  v8[1] = sub_100023740;
  return AppEntity._setValue<A, B, C>(_:for:)(v0 + 488, v7, &type metadata for Bool, v9);
}

uint64_t sub_100023740()
{
  *(void *)(*(void *)v1 + 480) = v0;
  swift_task_dealloc();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  if (v0) {
    uint64_t v2 = sub_1000269EC;
  }
  else {
    uint64_t v2 = sub_100023930;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_100023930()
{
  uint64_t v1 = *(void *)(v0 + 400);
  uint64_t v2 = *(void *)(v0 + 376);
  uint64_t v3 = *(void *)(v0 + 384);
  uint64_t v12 = *(void *)(v0 + 392);
  uint64_t v14 = *(void *)(v0 + 360);
  uint64_t v15 = *(void *)(v0 + 352);
  uint64_t v4 = *(void *)(v0 + 328);
  uint64_t v5 = *(void *)(v0 + 336);
  uint64_t v13 = *(void *)(v0 + 368);
  sub_10005E3F0();
  long long v6 = *(_OWORD *)(v0 + 272);
  long long v7 = *(_OWORD *)(v0 + 288);
  *(_OWORD *)(v0 + 208) = *(_OWORD *)(v0 + 256);
  *(_OWORD *)(v0 + 224) = v6;
  *(_OWORD *)(v0 + 240) = v7;
  uint64_t v8 = sub_10005E750();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v5, 1, 1, v8);
  uint64_t v9 = sub_10005E790();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v4, 1, 1, v9);
  sub_100022F9C();
  sub_100025554();
  sub_10005E350();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v12, v1, v2);
  sub_10005E370();
  sub_10005E3A0();
  (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v13, v15);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v10 = *(uint64_t (**)(void))(v0 + 8);
  return v10();
}

uint64_t sub_100023BC4()
{
  return sub_10001FF30(&qword_100080458);
}

uint64_t sub_100023BE8(uint64_t a1, uint64_t a2)
{
  return sub_100024B94(a1, a2, &qword_100080458);
}

unint64_t sub_100023C10()
{
  unint64_t result = qword_100081980;
  if (!qword_100081980)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100081980);
  }
  return result;
}

unint64_t sub_100023C68()
{
  unint64_t result = qword_100081988;
  if (!qword_100081988)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100081988);
  }
  return result;
}

uint64_t sub_100023CBC()
{
  return *(void *)(swift_getOpaqueTypeConformance2() + 8);
}

uint64_t sub_100023CF0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100024CE0(a1, a2, a3, (void (*)(void))sub_100022F9C);
}

uint64_t sub_100023D08@<X0>(uint64_t a1@<X8>)
{
  return sub_100025678(&qword_100080448, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_100083870, a1);
}

uint64_t sub_100023D40@<X0>(uint64_t a1@<X8>)
{
  return sub_100024D90(&qword_100080450, (uint64_t)qword_100083888, a1);
}

uint64_t sub_100023D64(uint64_t a1)
{
  uint64_t v5 = *v1;
  uint64_t v4 = v1[1];
  long long v6 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v6;
  *long long v6 = v2;
  v6[1] = sub_100009F48;
  return sub_100023224(a1, v5, v4);
}

uint64_t sub_100023E10@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10002613C(0xD000000000000047, 0x8000000100060B60);
  *a1 = result;
  a1[1] = v3;
  return result;
}

unint64_t sub_100023E50()
{
  return 0xD00000000000003FLL;
}

unint64_t sub_100023E70()
{
  unint64_t result = qword_100081998;
  if (!qword_100081998)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100081998);
  }
  return result;
}

uint64_t sub_100023EC4()
{
  return sub_100009DAC(&qword_1000819A0, &qword_1000819A8);
}

uint64_t sub_100023F00(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return _swift_task_switch(sub_100023F20, 0, 0);
}

uint64_t sub_100023F20()
{
  uint64_t v1 = *(unsigned __int8 **)(v0 + 16);
  id v2 = [self sharedController];
  unsigned __int8 v3 = [v2 isAnnounceNotificationEnabledForPlatform:4];

  unsigned __int8 *v1 = v3;
  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

uint64_t sub_100023FC8(uint64_t a1, unsigned char *a2)
{
  *(unsigned char *)(v2 + 16) = *a2;
  return _swift_task_switch(sub_100023FEC, 0, 0);
}

uint64_t sub_100023FEC()
{
  uint64_t v1 = *(unsigned __int8 *)(v0 + 16);
  id v2 = [self sharedController];
  [v2 setAnnounceNotificationEnabledForPlatform:4 annouceNotificationEnabled:v1];

  unsigned __int8 v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

uint64_t sub_100024088(uint64_t a1)
{
  return sub_100005E9C(a1, qword_1000838A8);
}

uint64_t sub_1000240AC(uint64_t a1)
{
  return sub_1000240D0(a1, qword_1000838C0);
}

uint64_t sub_1000240D0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100005268(&qword_100080B20);
  sub_1000052E4(v3, a2);
  uint64_t v4 = sub_1000052AC(v3, (uint64_t)a2);
  sub_10005E570();
  uint64_t v5 = sub_10005E580();
  uint64_t v6 = *(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56);

  return v6(v4, 0, 1, v5);
}

uint64_t sub_100024184()
{
  uint64_t result = swift_getKeyPath();
  qword_1000838D8 = result;
  return result;
}

uint64_t sub_1000241AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[39] = a2;
  v3[40] = a3;
  v3[38] = a1;
  sub_100005268(&qword_100080AF0);
  v3[41] = swift_task_alloc();
  sub_100005268(&qword_100080AF8);
  v3[42] = swift_task_alloc();
  sub_100005268(&qword_100081AF0);
  v3[43] = swift_task_alloc();
  uint64_t v4 = sub_10005E390();
  v3[44] = v4;
  v3[45] = *(void *)(v4 - 8);
  v3[46] = swift_task_alloc();
  uint64_t v5 = sub_100005268(&qword_100081AF8);
  v3[47] = v5;
  v3[48] = *(void *)(v5 - 8);
  v3[49] = swift_task_alloc();
  v3[50] = swift_task_alloc();
  return _swift_task_switch(sub_100024370, 0, 0);
}

uint64_t sub_100024370()
{
  sub_10005E3F0();
  long long v1 = *(_OWORD *)(v0 + 32);
  *(_OWORD *)(v0 + 64) = *(_OWORD *)(v0 + 16);
  long long v2 = *(_OWORD *)(v0 + 48);
  *(_OWORD *)(v0 + 80) = v1;
  *(_OWORD *)(v0 + 96) = v2;
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 408) = v3;
  unint64_t v4 = sub_100024FE4();
  *uint64_t v3 = v0;
  v3[1] = sub_100024454;
  uint64_t v5 = *(void *)(v0 + 400);
  return IntentDialog._CapturedContent.init<>(entity:_:)(v5, v0 + 64, sub_100024B4C, 0, &type metadata for AnnounceNotificationEntity, v4);
}

uint64_t sub_100024454()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_100024550, 0, 0);
}

uint64_t sub_100024550()
{
  sub_10005E3F0();
  uint64_t v1 = *(void *)(v0 + 112);
  *(void *)(v0 + 160) = v1;
  uint64_t v2 = *(void *)(v0 + 120);
  uint64_t v3 = *(void *)(v0 + 128);
  *(void *)(v0 + 416) = v1;
  *(void *)(v0 + 424) = v2;
  uint64_t v4 = *(void *)(v0 + 136);
  uint64_t v5 = *(void *)(v0 + 144);
  *(void *)(v0 + 432) = v3;
  *(void *)(v0 + 440) = v4;
  uint64_t v6 = *(void *)(v0 + 152);
  *(void *)(v0 + 448) = v5;
  *(void *)(v0 + 456) = v6;
  *(void *)(v0 + 168) = v2;
  *(void *)(v0 + 176) = v3;
  *(void *)(v0 + 184) = v4;
  *(void *)(v0 + 192) = v5;
  *(void *)(v0 + 200) = v6;
  sub_10005E3F0();
  *(unsigned char *)(v0 + 488) = *(unsigned char *)(v0 + 489);
  if (qword_100080470 != -1) {
    swift_once();
  }
  uint64_t v7 = qword_1000838D8;
  *(void *)(v0 + 464) = qword_1000838D8;
  swift_retain();
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v0 + 472) = v8;
  uint64_t v9 = sub_100009DAC(&qword_100081A88, &qword_100081A90);
  *uint64_t v8 = v0;
  v8[1] = sub_1000246C8;
  return AppEntity._setValue<A, B, C>(_:for:)(v0 + 488, v7, &type metadata for Bool, v9);
}

uint64_t sub_1000246C8()
{
  *(void *)(*(void *)v1 + 480) = v0;
  swift_task_dealloc();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  if (v0) {
    uint64_t v2 = sub_1000269EC;
  }
  else {
    uint64_t v2 = sub_1000248B8;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_1000248B8()
{
  uint64_t v1 = *(void *)(v0 + 400);
  uint64_t v2 = *(void *)(v0 + 376);
  uint64_t v3 = *(void *)(v0 + 384);
  uint64_t v12 = *(void *)(v0 + 392);
  uint64_t v14 = *(void *)(v0 + 360);
  uint64_t v15 = *(void *)(v0 + 352);
  uint64_t v4 = *(void *)(v0 + 328);
  uint64_t v5 = *(void *)(v0 + 336);
  uint64_t v13 = *(void *)(v0 + 368);
  sub_10005E3F0();
  long long v6 = *(_OWORD *)(v0 + 272);
  long long v7 = *(_OWORD *)(v0 + 288);
  *(_OWORD *)(v0 + 208) = *(_OWORD *)(v0 + 256);
  *(_OWORD *)(v0 + 224) = v6;
  *(_OWORD *)(v0 + 240) = v7;
  uint64_t v8 = sub_10005E750();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v5, 1, 1, v8);
  uint64_t v9 = sub_10005E790();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v4, 1, 1, v9);
  sub_100023E70();
  sub_100025554();
  sub_10005E350();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v12, v1, v2);
  sub_10005E370();
  sub_10005E3A0();
  (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v13, v15);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v10 = *(uint64_t (**)(void))(v0 + 8);
  return v10();
}

uint64_t sub_100024B4C()
{
  return sub_10001FF30(&qword_100080470);
}

uint64_t sub_100024B70(uint64_t a1, uint64_t a2)
{
  return sub_100024B94(a1, a2, &qword_100080470);
}

uint64_t sub_100024B94(uint64_t a1, uint64_t a2, void *a3)
{
  if (*a3 != -1) {
    swift_once();
  }

  return swift_retain();
}

unint64_t sub_100024BE8()
{
  unint64_t result = qword_1000819B0;
  if (!qword_1000819B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000819B0);
  }
  return result;
}

unint64_t sub_100024C40()
{
  unint64_t result = qword_1000819B8;
  if (!qword_1000819B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000819B8);
  }
  return result;
}

uint64_t sub_100024C94()
{
  return *(void *)(swift_getOpaqueTypeConformance2() + 8);
}

uint64_t sub_100024CC8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100024CE0(a1, a2, a3, (void (*)(void))sub_100023E70);
}

uint64_t sub_100024CE0(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100024D34@<X0>(uint64_t a1@<X8>)
{
  return sub_100025678(&qword_100080460, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_1000838A8, a1);
}

uint64_t sub_100024D6C@<X0>(uint64_t a1@<X8>)
{
  return sub_100024D90(&qword_100080468, (uint64_t)qword_1000838C0, a1);
}

uint64_t sub_100024D90@<X0>(void *a1@<X2>, uint64_t a2@<X3>, uint64_t a3@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_100005268(&qword_100080B20);
  uint64_t v6 = sub_1000052AC(v5, a2);

  return sub_100009E38(v6, a3);
}

uint64_t sub_100024DF8(uint64_t a1)
{
  uint64_t v5 = *v1;
  uint64_t v4 = v1[1];
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v6;
  *uint64_t v6 = v2;
  v6[1] = sub_100009F48;
  return sub_1000241AC(a1, v5, v4);
}

uint64_t sub_100024EA4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10002613C(0xD00000000000003DLL, 0x8000000100060A50);
  *a1 = result;
  a1[1] = v3;
  return result;
}

unint64_t sub_100024EE4()
{
  return 0xD000000000000048;
}

unint64_t sub_100024F00(void *a1)
{
  a1[1] = sub_100024F38();
  a1[2] = sub_100024F8C();
  unint64_t result = sub_10001C514();
  a1[3] = result;
  return result;
}

unint64_t sub_100024F38()
{
  unint64_t result = qword_1000819C8;
  if (!qword_1000819C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000819C8);
  }
  return result;
}

unint64_t sub_100024F8C()
{
  unint64_t result = qword_1000819D0;
  if (!qword_1000819D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000819D0);
  }
  return result;
}

unint64_t sub_100024FE4()
{
  unint64_t result = qword_1000819D8;
  if (!qword_1000819D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000819D8);
  }
  return result;
}

unint64_t sub_10002503C()
{
  unint64_t result = qword_1000819E0;
  if (!qword_1000819E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000819E0);
  }
  return result;
}

uint64_t sub_100025090(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return _swift_task_switch(sub_1000250B0, 0, 0);
}

uint64_t sub_1000250B0()
{
  uint64_t v1 = *(unsigned __int8 **)(v0 + 16);
  id v2 = [self sharedController];
  unsigned __int8 v3 = [v2 isSpokenNotificationSkipTriggerlessReplyConfirmationEnabled];

  unsigned __int8 *v1 = v3;
  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

uint64_t sub_100025154(uint64_t a1, unsigned char *a2)
{
  *(unsigned char *)(v2 + 16) = *a2;
  return _swift_task_switch(sub_100025178, 0, 0);
}

uint64_t sub_100025178()
{
  uint64_t v1 = *(unsigned __int8 *)(v0 + 16);
  id v2 = [self sharedController];
  [v2 setSpokenNotificationSkipTriggerlessReplyConfirmationEnabled:v1];

  unsigned __int8 v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

uint64_t sub_100025210(uint64_t a1)
{
  uint64_t v2 = qword_100081868;
  unsigned __int8 v3 = off_100081870;
  unint64_t v4 = sub_100024FE4();
  swift_bridgeObjectRetain();

  return EntityURLRepresentation.init(_:)(v2, v3, a1, v4);
}

unint64_t sub_100025288()
{
  unint64_t result = qword_1000819E8;
  if (!qword_1000819E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000819E8);
  }
  return result;
}

unint64_t sub_1000252E0()
{
  unint64_t result = qword_1000819F0;
  if (!qword_1000819F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000819F0);
  }
  return result;
}

uint64_t sub_100025334()
{
  return sub_100009DAC(&qword_1000819F8, &qword_100081A00);
}

uint64_t sub_100025370(uint64_t a1)
{
  unint64_t v2 = sub_10001C514();

  return _UniqueEntityProvider.init(_:)(&unk_100081A70, 0, a1, v2);
}

uint64_t sub_1000253D0()
{
  return sub_100009DAC((unint64_t *)&unk_100081A08, &qword_100081A00);
}

uint64_t sub_10002540C()
{
  sub_100024F8C();
  uint64_t v2 = sub_10005E6A0();
  unsigned __int8 v3 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
  return sub_10000538C(v3, v0, v2, v1);
}

unint64_t sub_1000254A4()
{
  unint64_t result = qword_100081A18;
  if (!qword_100081A18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100081A18);
  }
  return result;
}

unint64_t sub_1000254FC()
{
  unint64_t result = qword_100081A20;
  if (!qword_100081A20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100081A20);
  }
  return result;
}

unint64_t sub_100025554()
{
  unint64_t result = qword_100081A28;
  if (!qword_100081A28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100081A28);
  }
  return result;
}

unint64_t sub_1000255AC()
{
  unint64_t result = qword_100081A30;
  if (!qword_100081A30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100081A30);
  }
  return result;
}

uint64_t sub_100025600@<X0>(uint64_t *a1@<X8>)
{
  sub_10001C514();
  uint64_t result = sub_10005E3D0();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_100025640@<X0>(uint64_t a1@<X8>)
{
  return sub_100025678(&qword_1000803E0, (uint64_t (*)(void))&type metadata accessor for TypeDisplayRepresentation, (uint64_t)qword_100083778, a1);
}

uint64_t sub_100025678@<X0>(void *a1@<X2>, uint64_t (*a2)(void)@<X3>, uint64_t a3@<X4>, uint64_t a4@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v7 = a2(0);
  uint64_t v8 = sub_1000052AC(v7, a3);
  uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 16);

  return v9(a4, v8, v7);
}

uint64_t sub_10002571C()
{
  return sub_100009DAC(&qword_100081A38, &qword_100081A40);
}

uint64_t sub_100025758(uint64_t a1)
{
  unint64_t v2 = sub_100024FE4();

  return static AppEntity.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_1000257A8()
{
  unint64_t result = qword_100081A48;
  if (!qword_100081A48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100081A48);
  }
  return result;
}

uint64_t sub_1000257FC@<X0>(uint64_t a1@<X8>)
{
  sub_10005E890();
  unint64_t v2 = (void *)sub_10005E880();
  sub_10005E860();

  return sub_1000269F0(6, a1);
}

uint64_t sub_100025854(uint64_t a1)
{
  unint64_t v2 = sub_1000255AC();

  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

ValueMetadata *type metadata accessor for AnnounceNotificationEntity.UpdateIntent_isReplayWithoutConfirmationEnabled()
{
  return &type metadata for AnnounceNotificationEntity.UpdateIntent_isReplayWithoutConfirmationEnabled;
}

ValueMetadata *type metadata accessor for AnnounceNotificationEntity.UpdateIntent_isEnabledOnBuiltInSpeaker()
{
  return &type metadata for AnnounceNotificationEntity.UpdateIntent_isEnabledOnBuiltInSpeaker;
}

ValueMetadata *type metadata accessor for AnnounceNotificationEntity.UpdateIntent_isEnabledOnHearingAids()
{
  return &type metadata for AnnounceNotificationEntity.UpdateIntent_isEnabledOnHearingAids;
}

ValueMetadata *type metadata accessor for AnnounceNotificationEntity.UpdateIntent_isEnabledOnCarplay()
{
  return &type metadata for AnnounceNotificationEntity.UpdateIntent_isEnabledOnCarplay;
}

ValueMetadata *type metadata accessor for AnnounceNotificationEntity.UpdateIntent_isEnabledOnHeadphones()
{
  return &type metadata for AnnounceNotificationEntity.UpdateIntent_isEnabledOnHeadphones;
}

ValueMetadata *type metadata accessor for AnnounceNotificationEntity.UpdateIntent_value()
{
  return &type metadata for AnnounceNotificationEntity.UpdateIntent_value;
}

uint64_t initializeBufferWithCopyOfBuffer for AnnounceNotificationEntity(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for AnnounceNotificationEntity()
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  return swift_release();
}

void *initializeWithCopy for AnnounceNotificationEntity(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  uint64_t v5 = a2[5];
  a1[4] = a2[4];
  a1[5] = v5;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

void *assignWithCopy for AnnounceNotificationEntity(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  a1[2] = a2[2];
  swift_retain();
  swift_release();
  a1[3] = a2[3];
  swift_retain();
  swift_release();
  a1[4] = a2[4];
  swift_retain();
  swift_release();
  a1[5] = a2[5];
  swift_retain();
  swift_release();
  return a1;
}

__n128 initializeWithTake for AnnounceNotificationEntity(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

_OWORD *assignWithTake for AnnounceNotificationEntity(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  swift_release();
  a1[1] = a2[1];
  swift_release();
  swift_release();
  a1[2] = a2[2];
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for AnnounceNotificationEntity(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 48)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AnnounceNotificationEntity(uint64_t result, int a2, int a3)
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
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 48) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AnnounceNotificationEntity()
{
  return &type metadata for AnnounceNotificationEntity;
}

ValueMetadata *type metadata accessor for OpenAnnounceNotificationEntity()
{
  return &type metadata for OpenAnnounceNotificationEntity;
}

uint64_t sub_100025C10()
{
  return sub_100009DAC(&qword_100081A50, &qword_100081A58);
}

uint64_t sub_100025C4C()
{
  return sub_100009DAC(&qword_100081A60, &qword_100081A58);
}

uint64_t sub_100025C88(uint64_t a1)
{
  *(void *)(v1 + 64) = a1;
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 72) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_100025D24;
  return sub_1000549C0(v1 + 16);
}

uint64_t sub_100025D24()
{
  uint64_t v2 = *v1;
  uint64_t v3 = *v1;
  swift_task_dealloc();
  if (!v0)
  {
    uint64_t v4 = *(_OWORD **)(v2 + 64);
    long long v5 = *(_OWORD *)(v2 + 16);
    long long v6 = *(_OWORD *)(v2 + 48);
    v4[1] = *(_OWORD *)(v2 + 32);
    v4[2] = v6;
    *uint64_t v4 = v5;
  }
  uint64_t v7 = *(uint64_t (**)(void))(v3 + 8);
  return v7();
}

uint64_t sub_100025E34()
{
  uint64_t v18 = sub_10005E720();
  uint64_t v0 = *(void *)(v18 - 8);
  __chkstk_darwin(v18);
  uint64_t v2 = (char *)&v17 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100005268(&qword_100080848);
  uint64_t v4 = __chkstk_darwin(v3 - 8);
  long long v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v17 - v7;
  uint64_t v9 = sub_100005268(&qword_100080858);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_10005E800();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  sub_100005268(&qword_100081A68);
  sub_10005E7E0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56))(v11, 1, 1, v12);
  uint64_t v14 = sub_10005E390();
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v15 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56);
  v15(v8, 1, 1, v14);
  v15(v6, 1, 1, v14);
  (*(void (**)(char *, void, uint64_t))(v0 + 104))(v2, enum case for InputConnectionBehavior.default(_:), v18);
  sub_100024FE4();
  return sub_10005E420();
}

uint64_t sub_100026120()
{
  return sub_10002613C(0xD000000000000038, 0x8000000100060870);
}

uint64_t sub_10002613C(uint64_t a1, uint64_t a2)
{
  uint64_t v32 = a1;
  uint64_t v33 = a2;
  uint64_t v2 = sub_100005268(&qword_100080A68);
  __chkstk_darwin(v2 - 8);
  char v34 = (char *)&v24 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v35 = sub_10005E720();
  uint64_t v4 = *(void *)(v35 - 8);
  __chkstk_darwin(v35);
  long long v6 = (char *)&v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100005268(&qword_100080848);
  uint64_t v8 = __chkstk_darwin(v7 - 8);
  uint64_t v10 = (char *)&v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v24 - v11;
  uint64_t v13 = sub_100005268(&qword_100080858);
  __chkstk_darwin(v13 - 8);
  uint64_t v15 = (char *)&v24 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = v15;
  uint64_t v16 = sub_10005E800();
  uint64_t v31 = v16;
  uint64_t v17 = *(void *)(v16 - 8);
  __chkstk_darwin(v16);
  uint64_t v29 = sub_100005268(&qword_100081A68);
  sub_10005E7E0();
  uint64_t v30 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v17 + 56);
  v30(v15, 1, 1, v16);
  uint64_t v18 = sub_10005E390();
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v19 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56);
  v19(v12, 1, 1, v18);
  v19(v10, 1, 1, v18);
  unsigned int v28 = enum case for InputConnectionBehavior.default(_:);
  long long v20 = *(void (**)(void))(v4 + 104);
  uint64_t v26 = v4 + 104;
  unsigned int v27 = (void (*)(char *, void, uint64_t))v20;
  v20(v6);
  sub_100024FE4();
  long long v21 = v25;
  uint64_t v29 = sub_10005E420();
  sub_100005268(&qword_100080A80);
  sub_10005E7E0();
  v30(v21, 1, 1, v31);
  LOBYTE(v36) = 2;
  uint64_t v22 = sub_10005E9F0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56))(v34, 1, 1, v22);
  v19(v12, 1, 1, v18);
  v27(v6, v28, v35);
  sub_10005E430();
  return v29;
}

uint64_t sub_100026574@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_10005E800();
  __chkstk_darwin(v2 - 8);
  sub_100005268(&qword_1000818B8);
  sub_10005E7E0();
  sub_100009DAC(&qword_100081A88, &qword_100081A90);
  uint64_t v3 = sub_10005E7C0();
  sub_100005268(&qword_1000818E8);
  sub_10005E7E0();
  uint64_t v4 = sub_10005E7C0();
  sub_100005268(&qword_100081918);
  sub_10005E7E0();
  uint64_t v5 = sub_10005E7C0();
  sub_100005268(&qword_100081948);
  sub_10005E7E0();
  uint64_t v6 = sub_10005E7C0();
  sub_100005268(&qword_100081978);
  sub_10005E7E0();
  uint64_t v7 = sub_10005E7C0();
  sub_100005268(&qword_1000819A8);
  sub_10005E7E0();
  uint64_t result = sub_10005E7C0();
  *a1 = v3;
  a1[1] = v4;
  a1[2] = v5;
  a1[3] = v6;
  a1[4] = v7;
  a1[5] = result;
  return result;
}

uint64_t sub_1000268F4@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  *a2 = *(void *)(a1 + 40);
  return swift_retain();
}

uint64_t sub_100026900@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  *a2 = *(void *)(a1 + 32);
  return swift_retain();
}

uint64_t sub_10002690C@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  *a2 = *(void *)(a1 + 24);
  return swift_retain();
}

uint64_t sub_100026918@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  *a2 = *(void *)(a1 + 16);
  return swift_retain();
}

uint64_t sub_100026924@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  *a2 = *(void *)(a1 + 8);
  return swift_retain();
}

uint64_t sub_100026930@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  *a2 = *a1;
  return swift_retain();
}

unint64_t sub_10002693C()
{
  unint64_t result = qword_100081B60;
  if (!qword_100081B60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100081B60);
  }
  return result;
}

unint64_t sub_100026990()
{
  unint64_t result = qword_100081B68;
  if (!qword_100081B68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100081B68);
  }
  return result;
}

uint64_t sub_1000269F0@<X0>(char a1@<W0>, uint64_t a2@<X8>)
{
  uint64_t v47 = a2;
  uint64_t v3 = sub_100005268(&qword_100080878);
  __chkstk_darwin(v3 - 8);
  v48 = (char *)&v42 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100005268(&qword_100080858);
  __chkstk_darwin(v5 - 8);
  v46 = (char *)&v42 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_10005E7F0();
  uint64_t v42 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v42 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_10005E830();
  __chkstk_darwin(v10 - 8);
  uint64_t v11 = sub_10005E990();
  __chkstk_darwin(v11 - 8);
  uint64_t v12 = sub_10005E800();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v43 = v12;
  uint64_t v44 = v13;
  uint64_t v14 = __chkstk_darwin(v12);
  uint64_t v15 = __chkstk_darwin(v14);
  v45 = (char *)&v42 - v16;
  __chkstk_darwin(v15);
  sub_10005E890();
  uint64_t v17 = (void *)sub_10005E880();
  char v18 = sub_10005E870();

  if (v18) {
    unint64_t v19 = 0x100000000000001ELL;
  }
  else {
    unint64_t v19 = 0x9286E22069726953;
  }
  if (v18) {
    unint64_t v20 = 0x800000010005F260;
  }
  else {
    unint64_t v20 = 0xA900000000000020;
  }
  switch(a1)
  {
    case 1:
      sub_10005E7E0();
      unint64_t v49 = v19;
      unint64_t v50 = v20;
      swift_bridgeObjectRetain();
      v23._countAndFlagsBits = 0x65676175676E614CLL;
      v23._object = (void *)0xE800000000000000;
      goto LABEL_29;
    case 2:
      sub_10005E7E0();
      unint64_t v49 = v19;
      unint64_t v50 = v20;
      swift_bridgeObjectRetain();
      v51._countAndFlagsBits = 0xD000000000000019;
      v51._object = (void *)0x80000001000610E0;
      sub_10005E9D0(v51);
      swift_bridgeObjectRelease();
      uint64_t v24 = v46;
      sub_10005E7E0();
      (*(void (**)(char *, void, uint64_t, uint64_t))(v44 + 56))(v24, 0, 1, v43);
      uint64_t v25 = sub_10005E5F0();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v25 - 8) + 56))(v48, 1, 1, v25);
      goto LABEL_21;
    case 3:
      sub_10005E7E0();
      unint64_t v49 = v19;
      unint64_t v50 = v20;
      swift_bridgeObjectRetain();
      v23._countAndFlagsBits = 0x7365522069726953;
      v23._object = (void *)0x7365736E6F70;
      goto LABEL_28;
    case 4:
      sub_10005E7E0();
      unint64_t v49 = v19;
      unint64_t v50 = v20;
      swift_bridgeObjectRetain();
      v23._countAndFlagsBits = 0xD000000000000012;
      v23._object = (void *)0x800000010005FA80;
      goto LABEL_29;
    case 5:
      unint64_t v26 = v19;
      unsigned int v27 = (void *)sub_10005E880();
      sub_10005E850();

      uint64_t v28 = sub_10005E840();
      uint64_t v29 = sub_10005E840();
      BOOL v30 = v28 == v29;
      if (v28 == v29) {
        uint64_t v31 = 0xD000000000000013;
      }
      else {
        uint64_t v31 = 0x206F74206B6C6154;
      }
      if (v30) {
        uint64_t v32 = (void *)0x80000001000611A0;
      }
      else {
        uint64_t v32 = (void *)0xEC00000069726953;
      }
      swift_bridgeObjectRetain();
      sub_10005E7E0();
      unint64_t v49 = v26;
      unint64_t v50 = v20;
      swift_bridgeObjectRetain();
      v52._countAndFlagsBits = v31;
      v52._object = v32;
      sub_10005E9D0(v52);
      swift_bridgeObjectRelease();
      goto LABEL_32;
    case 6:
      sub_10005E7E0();
      unint64_t v49 = v19;
      unint64_t v50 = v20;
      swift_bridgeObjectRetain();
      v53._countAndFlagsBits = 0xD000000000000015;
      v53._object = (void *)0x8000000100060930;
      sub_10005E9D0(v53);
      swift_bridgeObjectRelease();
      uint64_t v33 = v46;
      sub_10005E7E0();
      (*(void (**)(char *, void, uint64_t, uint64_t))(v44 + 56))(v33, 0, 1, v43);
      uint64_t v34 = sub_10005E5F0();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v34 - 8) + 56))(v48, 1, 1, v34);
LABEL_21:
      sub_10005E7E0();
      return sub_10005E600();
    case 7:
      sub_10005E7E0();
      unint64_t v49 = v19;
      unint64_t v50 = v20;
      swift_bridgeObjectRetain();
      v23._countAndFlagsBits = 0x65636E756F6E6E41;
      v23._object = (void *)0x736C6C614320;
      goto LABEL_28;
    case 8:
      uint64_t v35 = 0xD000000000000013;
      long long v36 = "Messaging with Siri";
      goto LABEL_31;
    case 9:
      uint64_t v35 = 0xD000000000000011;
      long long v36 = "Siri Call Hang Up";
      goto LABEL_31;
    case 10:
      sub_10005E7E0();
      unint64_t v49 = v19;
      unint64_t v50 = v20;
      swift_bridgeObjectRetain();
      v23._countAndFlagsBits = 0x696F562069726953;
      v23._object = (void *)0xEA00000000006563;
      goto LABEL_29;
    case 11:
      uint64_t v35 = 0xD000000000000018;
      long long v36 = "Siri & Dictation History";
      goto LABEL_31;
    case 12:
      sub_10005E7E0();
      unint64_t v49 = v19;
      unint64_t v50 = v20;
      swift_bridgeObjectRetain();
      v23._countAndFlagsBits = 0x726F666E4920794DLL;
      v23._object = (void *)0x6E6F6974616DLL;
LABEL_28:
      v23._object = (void *)((uint64_t)v23._object & 0xFFFFFFFFFFFFLL | 0xEE00000000000000);
LABEL_29:
      sub_10005E9D0(v23);
      swift_bridgeObjectRelease();
      long long v37 = v46;
      sub_10005E7E0();
      (*(void (**)(char *, void, uint64_t, uint64_t))(v44 + 56))(v37, 0, 1, v43);
      uint64_t v38 = sub_10005E5F0();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v38 - 8) + 56))(v48, 1, 1, v38);
      goto LABEL_33;
    case 13:
      uint64_t v35 = 0xD000000000000016;
      long long v36 = "Allow Siri When Locked";
LABEL_31:
      uint64_t v39 = (void *)((unint64_t)(v36 - 32) | 0x8000000000000000);
      sub_10005E7E0();
      unint64_t v49 = v19;
      unint64_t v50 = v20;
      swift_bridgeObjectRetain();
      v54._countAndFlagsBits = v35;
      v54._object = v39;
      sub_10005E9D0(v54);
LABEL_32:
      swift_bridgeObjectRelease();
      uint64_t v40 = v46;
      sub_10005E7E0();
      (*(void (**)(char *, void, uint64_t, uint64_t))(v44 + 56))(v40, 0, 1, v43);
      uint64_t v41 = sub_10005E5F0();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v41 - 8) + 56))(v48, 1, 1, v41);
LABEL_33:
      uint64_t result = sub_10005E610();
      break;
    default:
      swift_bridgeObjectRelease();
      sub_10005E980();
      sub_10005E820();
      (*(void (**)(char *, void, uint64_t))(v42 + 104))(v9, enum case for LocalizedStringResource.BundleDescription.main(_:), v7);
      sub_10005E810();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v44 + 56))(v46, 1, 1, v43);
      uint64_t v21 = sub_10005E5F0();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56))(v48, 1, 1, v21);
      sub_100005268(&qword_100081B88);
      *(_OWORD *)(swift_allocObject() + 16) = xmmword_10006EC10;
      sub_10005E7E0();
      sub_10005E7E0();
      uint64_t result = sub_10005E600();
      break;
  }
  return result;
}

unint64_t sub_10002751C(char a1)
{
  unint64_t result = 0xD00000000000002DLL;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x474155474E414C2FLL;
      break;
    case 2:
      unint64_t result = 0xD00000000000001FLL;
      break;
    case 3:
    case 6:
      unint64_t result = 0xD000000000000012;
      break;
    case 4:
      unint64_t result = 0xD000000000000027;
      break;
    case 5:
      unint64_t result = 0xD000000000000016;
      break;
    case 7:
      unint64_t result = 0x434E554F4E4E412FLL;
      break;
    case 8:
      unint64_t result = 0xD00000000000001DLL;
      break;
    case 9:
      unint64_t result = 0xD000000000000010;
      break;
    case 10:
      unint64_t result = 0x495F4543494F562FLL;
      break;
    case 11:
      unint64_t result = 0x59524F545349482FLL;
      break;
    case 12:
      unint64_t result = 0x4F464E495F594D2FLL;
      break;
    case 13:
      unint64_t result = 0xD00000000000001DLL;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t sub_1000276B8(char a1)
{
  unint64_t result = 0xD00000000000002DLL;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x474155474E414C2FLL;
      break;
    case 2:
      unint64_t result = 0xD00000000000001FLL;
      break;
    case 3:
    case 6:
      unint64_t result = 0xD000000000000012;
      break;
    case 4:
      unint64_t result = 0xD000000000000027;
      break;
    case 5:
      unint64_t result = 0xD000000000000016;
      break;
    case 7:
      unint64_t result = 0x434E554F4E4E412FLL;
      break;
    case 8:
      unint64_t result = 0xD00000000000001DLL;
      break;
    case 9:
      unint64_t result = 0xD000000000000010;
      break;
    case 10:
      unint64_t result = 0x495F4543494F562FLL;
      break;
    case 11:
      unint64_t result = 0x59524F545349482FLL;
      break;
    case 12:
      unint64_t result = 0x4F464E495F594D2FLL;
      break;
    case 13:
      unint64_t result = 0xD00000000000001DLL;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_100027854(char *a1, char *a2)
{
  char v2 = *a2;
  unint64_t v3 = sub_1000276B8(*a1);
  uint64_t v5 = v4;
  if (v3 == sub_1000276B8(v2) && v5 == v6) {
    char v8 = 1;
  }
  else {
    char v8 = sub_10005EB40();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

unint64_t sub_1000278E4()
{
  unint64_t result = qword_100081B70;
  if (!qword_100081B70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100081B70);
  }
  return result;
}

Swift::Int sub_100027938()
{
  char v1 = *v0;
  sub_10005EB90();
  sub_1000276B8(v1);
  sub_10005E9C0();
  swift_bridgeObjectRelease();
  return sub_10005EBA0();
}

uint64_t sub_10002799C()
{
  sub_1000276B8(*v0);
  sub_10005E9C0();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_1000279F0()
{
  char v1 = *v0;
  sub_10005EB90();
  sub_1000276B8(v1);
  sub_10005E9C0();
  swift_bridgeObjectRelease();
  return sub_10005EBA0();
}

uint64_t sub_100027A50@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_100027D00(*(void *)a1, *(void **)(a1 + 8));
  *a2 = result;
  return result;
}

unint64_t sub_100027A80@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_1000276B8(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

unint64_t sub_100027AB0()
{
  unint64_t result = qword_100081B78;
  if (!qword_100081B78)
  {
    sub_1000041B0(&qword_100081B80);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100081B78);
  }
  return result;
}

void sub_100027B0C(void *a1@<X8>)
{
  *a1 = &off_10007D708;
}

unint64_t sub_100027B1C()
{
  return sub_10002751C(*v0);
}

uint64_t sub_100027B24@<X0>(uint64_t a1@<X0>, void *a2@<X1>, unsigned char *a3@<X8>)
{
  swift_bridgeObjectRetain();
  uint64_t result = sub_100027D00(a1, a2);
  *a3 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for SiriSettingDeepLink(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF3) {
    goto LABEL_17;
  }
  if (a2 + 13 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 13) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 13;
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
      return (*a1 | (v4 << 8)) - 13;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 13;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0xE;
  int v8 = v6 - 14;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for SiriSettingDeepLink(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 13 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 13) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF3) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF2)
  {
    unsigned int v6 = ((a2 - 243) >> 8) + 1;
    *uint64_t result = a2 + 13;
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
        JUMPOUT(0x100027CC8);
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
          *uint64_t result = a2 + 13;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SiriSettingDeepLink()
{
  return &type metadata for SiriSettingDeepLink;
}

uint64_t sub_100027D00(uint64_t a1, void *a2)
{
  v6._countAndFlagsBits = a1;
  v3._rawValue = &off_10007D598;
  v6._object = a2;
  unint64_t v4 = sub_10005EB30(v3, v6);
  swift_bridgeObjectRelease();
  if (v4 >= 0xE) {
    return 14;
  }
  else {
    return v4;
  }
}

ValueMetadata *type metadata accessor for CallHangUpToggleControl()
{
  return &type metadata for CallHangUpToggleControl;
}

uint64_t sub_100027D5C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100027D78@<X0>(uint64_t a1@<X8>)
{
  uint64_t v30 = a1;
  uint64_t v1 = sub_100005268(&qword_1000816A8);
  uint64_t v23 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  Swift::OpaquePointer v3 = (char *)&v23 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100005268(&qword_1000816B0);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v24 = v4;
  uint64_t v25 = v5;
  __chkstk_darwin(v4);
  BOOL v7 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100005268(&qword_1000816B8);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v26 = v8;
  uint64_t v27 = v9;
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100005268(&qword_1000816C0);
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v28 = v12;
  uint64_t v29 = v13;
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)&v23 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  sub_100005268(&qword_1000816C8);
  sub_1000282FC();
  sub_100009DAC(&qword_1000816D8, &qword_1000816C8);
  sub_10005E960();
  sub_10005E8F0();
  uint64_t v16 = sub_100009DAC(&qword_1000816E0, &qword_1000816A8);
  sub_10005E920();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v23 + 8))(v3, v1);
  sub_10005E8F0();
  uint64_t v31 = v1;
  uint64_t v32 = v16;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v18 = v24;
  sub_10005E900();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v25 + 8))(v7, v18);
  uint64_t v31 = v18;
  uint64_t v32 = OpaqueTypeConformance2;
  uint64_t v19 = swift_getOpaqueTypeConformance2();
  uint64_t v20 = v26;
  sub_10005E930();
  (*(void (**)(char *, uint64_t))(v27 + 8))(v11, v20);
  uint64_t v31 = v20;
  uint64_t v32 = v19;
  swift_getOpaqueTypeConformance2();
  uint64_t v21 = v28;
  sub_10005E910();
  return (*(uint64_t (**)(char *, uint64_t))(v29 + 8))(v15, v21);
}

uint64_t sub_100028290()
{
  sub_10005E8F0();

  return sub_10005E950();
}

unint64_t sub_1000282FC()
{
  unint64_t result = qword_100081B90;
  if (!qword_100081B90)
  {
    type metadata accessor for CallHangUpEntity();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100081B90);
  }
  return result;
}

uint64_t sub_100028354()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_100028484()
{
  unint64_t result = qword_100081BA8;
  if (!qword_100081BA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100081BA8);
  }
  return result;
}

uint64_t sub_1000284D8()
{
  return sub_10002ADDC(&qword_100081BB0);
}

uint64_t type metadata accessor for CallHangUpEntity()
{
  uint64_t result = qword_100081D40;
  if (!qword_100081D40) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_100028558()
{
  type metadata accessor for CallHangUpEntity();

  return swift_retain();
}

uint64_t sub_10002858C@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  *a2 = *(void *)(a1 + *(int *)(type metadata accessor for CallHangUpEntity() + 20));

  return swift_retain();
}

uint64_t sub_1000285D4(uint64_t a1)
{
  return sub_100005E9C(a1, qword_1000838E0);
}

uint64_t sub_1000285F8(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for CallHangUpEntity();
  __chkstk_darwin(v2 - 8);
  sub_10002B9E4(a1, (uint64_t)&v5 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_10005E400();
  return sub_10002B940(a1);
}

unint64_t sub_10002868C()
{
  unint64_t result = qword_100081BB8;
  if (!qword_100081BB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100081BB8);
  }
  return result;
}

uint64_t sub_1000286E0(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_10002BA48();
  uint64_t v5 = sub_10002ADDC(&qword_100081C88);

  return static URLRepresentableIntent<>.urlRepresentation.getter(a1, v4, a2, v5);
}

unint64_t sub_100028768()
{
  unint64_t result = qword_100081BC0;
  if (!qword_100081BC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100081BC0);
  }
  return result;
}

unint64_t sub_1000287C0()
{
  unint64_t result = qword_100081BC8;
  if (!qword_100081BC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100081BC8);
  }
  return result;
}

uint64_t sub_100028814(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100029A2C(a1, a2, a3, (void (*)(void))sub_10002868C);
}

uint64_t sub_10002882C@<X0>(uint64_t a1@<X8>)
{
  return sub_1000085D4(&qword_100080478, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_1000838E0, a1);
}

uint64_t sub_100028864(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  unint64_t v5 = sub_10002BA48();
  unint64_t v6 = sub_10002BA9C();
  uint64_t v7 = sub_10002ADDC(&qword_100081C88);
  *unint64_t v4 = v2;
  v4[1] = sub_100003184;
  return URLRepresentableIntent<>.perform()(a2, v5, v6, v7);
}

uint64_t sub_10002894C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10002B0D4();
  *a1 = result;
  return result;
}

uint64_t sub_100028974(uint64_t a1)
{
  unint64_t v2 = sub_10002868C();

  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

unint64_t sub_1000289B4()
{
  unint64_t result = qword_100081BD8;
  if (!qword_100081BD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100081BD8);
  }
  return result;
}

uint64_t sub_100028A08()
{
  return sub_100009DAC(&qword_100081BE0, &qword_100081BE8);
}

uint64_t sub_100028A44()
{
  uint64_t v0 = sub_100005268(&qword_100080858);
  __chkstk_darwin(v0 - 8);
  unint64_t v2 = (char *)v12 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12[0] = sub_10005E7F0();
  uint64_t v3 = *(void *)(v12[0] - 8);
  __chkstk_darwin(v12[0]);
  unint64_t v5 = (char *)v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10005E830();
  __chkstk_darwin(v6 - 8);
  uint64_t v7 = sub_10005E990();
  __chkstk_darwin(v7 - 8);
  uint64_t v8 = sub_10005E800();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v10 = sub_10005E780();
  sub_1000052E4(v10, qword_1000838F8);
  sub_1000052AC(v10, (uint64_t)qword_1000838F8);
  sub_10005E980();
  sub_10005E820();
  (*(void (**)(char *, void, void))(v3 + 104))(v5, enum case for LocalizedStringResource.BundleDescription.main(_:), v12[0]);
  sub_10005E810();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(v2, 1, 1, v8);
  return sub_10005E770();
}

uint64_t sub_100028D30(uint64_t a1)
{
  return sub_100005E9C(a1, qword_100083910);
}

uint64_t sub_100028D54()
{
  uint64_t v0 = sub_100005268(&qword_100080B20);
  sub_1000052E4(v0, qword_100083928);
  uint64_t v1 = sub_1000052AC(v0, (uint64_t)qword_100083928);
  sub_10005E570();
  uint64_t v2 = sub_10005E580();
  uint64_t v3 = *(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56);

  return v3(v1, 0, 1, v2);
}

uint64_t sub_100028E0C()
{
  uint64_t result = swift_getKeyPath();
  qword_100083940 = result;
  return result;
}

uint64_t sub_100028E34(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  sub_100005268(&qword_100080AF0);
  v3[5] = swift_task_alloc();
  sub_100005268(&qword_100080AF8);
  v3[6] = swift_task_alloc();
  sub_100005268(&qword_100081DD0);
  v3[7] = swift_task_alloc();
  uint64_t v4 = sub_10005E390();
  v3[8] = v4;
  v3[9] = *(void *)(v4 - 8);
  v3[10] = swift_task_alloc();
  v3[11] = type metadata accessor for CallHangUpEntity();
  v3[12] = swift_task_alloc();
  v3[13] = swift_task_alloc();
  uint64_t v5 = sub_100005268(&qword_100081DD8);
  v3[14] = v5;
  v3[15] = *(void *)(v5 - 8);
  v3[16] = swift_task_alloc();
  v3[17] = swift_task_alloc();
  return _swift_task_switch(sub_100029038, 0, 0);
}

uint64_t sub_100029038()
{
  sub_10005E3F0();
  uint64_t v1 = (void *)swift_task_alloc();
  v0[18] = v1;
  uint64_t v2 = sub_10002ADDC(qword_100081C38);
  void *v1 = v0;
  v1[1] = sub_100029120;
  uint64_t v3 = v0[17];
  uint64_t v4 = v0[13];
  uint64_t v5 = v0[11];
  return IntentDialog._CapturedContent.init<>(entity:_:)(v3, v4, sub_100029744, 0, v5, v2);
}

uint64_t sub_100029120()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_10002921C, 0, 0);
}

uint64_t sub_10002921C()
{
  sub_10005E3F0();
  sub_10005E3F0();
  *(unsigned char *)(v0 + 177) = *(unsigned char *)(v0 + 176);
  if (qword_100080498 != -1) {
    swift_once();
  }
  uint64_t v1 = qword_100083940;
  *(void *)(v0 + 152) = qword_100083940;
  swift_retain();
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 160) = v2;
  uint64_t v3 = sub_100009DAC(&qword_100081DB8, &qword_100081DC0);
  *uint64_t v2 = v0;
  v2[1] = sub_100029368;
  return AppEntity._setValue<A, B, C>(_:for:)(v0 + 177, v1, &type metadata for Bool, v3);
}

uint64_t sub_100029368()
{
  uint64_t v2 = *(void *)(*(void *)v1 + 96);
  *(void *)(*(void *)v1 + 168) = v0;
  swift_task_dealloc();
  sub_10002B940(v2);
  swift_release();
  if (v0) {
    uint64_t v3 = sub_100006990;
  }
  else {
    uint64_t v3 = sub_1000294BC;
  }
  return _swift_task_switch(v3, 0, 0);
}

uint64_t sub_1000294BC()
{
  uint64_t v1 = v0[15];
  uint64_t v10 = v0[16];
  uint64_t v2 = v0[14];
  uint64_t v11 = v0[13];
  uint64_t v12 = v0[17];
  uint64_t v3 = v0[10];
  uint64_t v14 = v0[8];
  uint64_t v4 = v0[5];
  uint64_t v5 = v0[6];
  uint64_t v13 = v0[9];
  sub_10005E3F0();
  uint64_t v6 = sub_10005E750();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  uint64_t v7 = sub_10005E790();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v4, 1, 1, v7);
  sub_1000289B4();
  sub_10002ADDC(&qword_100081C58);
  sub_10005E350();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v1 + 16))(v10, v12, v2);
  sub_10005E370();
  sub_10005E3A0();
  (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v3, v14);
  sub_10002B940(v11);
  (*(void (**)(uint64_t, uint64_t))(v1 + 8))(v12, v2);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v8 = (uint64_t (*)(void))v0[1];
  return v8();
}

uint64_t sub_100029748()
{
  uint64_t v0 = sub_100005268(&qword_100081DE0);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100080498 != -1) {
    swift_once();
  }
  swift_retain();
  sub_10005E5D0();
  swift_release();
  type metadata accessor for CallHangUpEntity();
  sub_10002ADDC(&qword_100081C58);
  sub_100009DAC(&qword_100081DE8, &qword_100081DE0);
  sub_10005E5C0();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t sub_1000298D4()
{
  if (qword_100080498 != -1) {
    swift_once();
  }

  return swift_retain();
}

unint64_t sub_100029934()
{
  unint64_t result = qword_100081BF0;
  if (!qword_100081BF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100081BF0);
  }
  return result;
}

unint64_t sub_10002998C()
{
  unint64_t result = qword_100081BF8;
  if (!qword_100081BF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100081BF8);
  }
  return result;
}

uint64_t sub_1000299E0()
{
  return *(void *)(swift_getOpaqueTypeConformance2() + 8);
}

uint64_t sub_100029A14(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100029A2C(a1, a2, a3, (void (*)(void))sub_1000289B4);
}

uint64_t sub_100029A2C(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100029A80@<X0>(uint64_t a1@<X8>)
{
  return sub_1000085D4(&qword_100080488, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_100083910, a1);
}

uint64_t sub_100029AB8@<X0>(uint64_t a1@<X8>)
{
  if (qword_100080490 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100005268(&qword_100080B20);
  uint64_t v3 = sub_1000052AC(v2, (uint64_t)qword_100083928);

  return sub_100009E38(v3, a1);
}

uint64_t sub_100029B34(uint64_t a1)
{
  uint64_t v5 = *v1;
  uint64_t v4 = v1[1];
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v6;
  *uint64_t v6 = v2;
  v6[1] = sub_100009F48;
  return sub_100028E34(a1, v5, v4);
}

uint64_t sub_100029BE0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10002B458();
  *a1 = result;
  a1[1] = v3;
  return result;
}

unint64_t sub_100029C08()
{
  return 0xD000000000000021;
}

unint64_t sub_100029C28()
{
  unint64_t result = qword_100081C08;
  if (!qword_100081C08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100081C08);
  }
  return result;
}

uint64_t sub_100029C7C()
{
  return sub_10002ADDC((unint64_t *)&qword_100081B90);
}

uint64_t sub_100029CB0(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return _swift_task_switch(sub_100029CD0, 0, 0);
}

uint64_t sub_100029CD0()
{
  uint64_t v1 = *(unsigned __int8 **)(v0 + 16);
  id v2 = [self sharedController];
  unsigned __int8 v3 = [v2 isCallHangUpEnabled];

  unsigned __int8 *v1 = v3;
  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

uint64_t sub_100029D74(uint64_t a1, unsigned char *a2)
{
  *(unsigned char *)(v2 + 16) = *a2;
  return _swift_task_switch(sub_100029D98, 0, 0);
}

uint64_t sub_100029D98()
{
  uint64_t v1 = *(unsigned __int8 *)(v0 + 16);
  id v2 = [self sharedController];
  [v2 setCallHangUpEnabled:v1];

  unsigned __int8 v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

id sub_100029E30()
{
  id result = [self sharedController];
  qword_100083948 = (uint64_t)result;
  return result;
}

uint64_t sub_100029E6C(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return _swift_task_switch(sub_100029E8C, 0, 0);
}

uint64_t sub_100029E8C()
{
  if ([*(id *)(v0 + 24) assistantIsEnabled]
    && [*(id *)(v0 + 24) isVoiceTriggerEnabled])
  {
    sub_10002A604(*(void *)(v0 + 16));
    uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  }
  else
  {
    sub_1000053A0();
    swift_allocError();
    *uint64_t v2 = 0xD000000000000055;
    v2[1] = 0x80000001000613E0;
    swift_willThrow();
    uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  }
  return v1();
}

uint64_t sub_100029F70(uint64_t a1)
{
  uint64_t v4 = *v1;
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[2] = a1;
  v5[3] = v4;
  v5[1] = sub_1000042AC;
  return _swift_task_switch(sub_100029E8C, 0, 0);
}

unint64_t sub_10002A024()
{
  unint64_t result = qword_100081C18;
  if (!qword_100081C18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100081C18);
  }
  return result;
}

uint64_t sub_10002A078(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v4;
  unint64_t v5 = sub_10002AAD0();
  *uint64_t v4 = v2;
  v4[1] = sub_100003BF0;
  return _UniqueEntityQuery.allEntities()(a2, v5);
}

unint64_t sub_10002A12C()
{
  unint64_t result = qword_100081C28;
  if (!qword_100081C28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100081C28);
  }
  return result;
}

unint64_t sub_10002A184()
{
  unint64_t result = qword_100081C30;
  if (!qword_100081C30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100081C30);
  }
  return result;
}

uint64_t sub_10002A1D8()
{
  return sub_10002ADDC(qword_100081C38);
}

uint64_t sub_10002A20C(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_10002AAD0();
  *unint64_t v5 = v2;
  v5[1] = sub_100003EE0;
  return _UniqueEntityQuery.entities(for:)(a1, a2, v6);
}

uint64_t sub_10002A2C0(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v4;
  unint64_t v5 = sub_10002AAD0();
  *uint64_t v4 = v2;
  v4[1] = sub_100005568;
  return _UniqueEntityQuery.suggestedEntities()(a2, v5);
}

unint64_t sub_10002A374()
{
  unint64_t result = qword_100081C50;
  if (!qword_100081C50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100081C50);
  }
  return result;
}

uint64_t sub_10002A3C8()
{
  return sub_10002ADDC(&qword_100081C58);
}

unint64_t sub_10002A400()
{
  unint64_t result = qword_100081C60;
  if (!qword_100081C60)
  {
    sub_1000041B0(qword_100081C68);
    sub_10002ADDC(&qword_100081C58);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100081C60);
  }
  return result;
}

uint64_t sub_10002A490(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_10002A024();
  *unint64_t v5 = v2;
  v5[1] = sub_100009F48;
  return EntityQuery.results()(a1, a2, v6);
}

uint64_t sub_10002A544(void *a1)
{
  a1[1] = sub_10002ADDC(&qword_100081C80);
  a1[2] = sub_10002ADDC(&qword_100081C88);
  uint64_t result = sub_10002ADDC((unint64_t *)&qword_100081B90);
  a1[3] = result;
  return result;
}

uint64_t sub_10002A5D0()
{
  return sub_10002ADDC(&qword_100081C90);
}

uint64_t sub_10002A604@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_100005268(&qword_100080878);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)v18 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100005268(&qword_100080858);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_10005E800();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  sub_10005E890();
  uint64_t v10 = (void *)sub_10005E880();
  sub_10005E860();

  uint64_t v11 = (void *)sub_10005E880();
  char v12 = sub_10005E870();

  if (v12) {
    unint64_t v13 = 0x100000000000001ELL;
  }
  else {
    unint64_t v13 = 0x9286E22069726953;
  }
  if (v12) {
    unint64_t v14 = 0x800000010005F260;
  }
  else {
    unint64_t v14 = 0xA900000000000020;
  }
  sub_10005E7E0();
  v18[0] = v13;
  v18[1] = v14;
  swift_bridgeObjectRetain();
  v19._countAndFlagsBits = 0xD000000000000011;
  v19._object = (void *)0x80000001000610A0;
  sub_10005E9D0(v19);
  swift_bridgeObjectRelease();
  sub_10005E7E0();
  (*(void (**)(char *, void, uint64_t, uint64_t))(v9 + 56))(v7, 0, 1, v8);
  uint64_t v15 = sub_10005E5F0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v4, 1, 1, v15);
  sub_10005E610();
  uint64_t v16 = *(int *)(type metadata accessor for CallHangUpEntity() + 20);
  sub_100005268(&qword_100081BE8);
  sub_10005E7E0();
  sub_100009DAC(&qword_100081DB8, &qword_100081DC0);
  uint64_t result = sub_10005E7C0();
  *(void *)(a1 + v16) = result;
  return result;
}

uint64_t sub_10002A948(uint64_t a1)
{
  uint64_t v2 = sub_10002ADDC(qword_100081C38);

  return EntityURLRepresentation.init(_:)(0xD00000000000003DLL, 0x80000001000613A0, a1, v2);
}

uint64_t sub_10002A9C0()
{
  uint64_t v0 = qword_100081B98;
  swift_bridgeObjectRetain();
  return v0;
}

uint64_t sub_10002A9F8()
{
  return sub_10002ADDC(&qword_100081C98);
}

uint64_t sub_10002AA2C()
{
  return sub_10002ADDC(&qword_100081CA0);
}

id sub_10002AA60@<X0>(void *a1@<X8>)
{
  if (qword_1000804A0 != -1) {
    swift_once();
  }
  uint64_t v2 = (void *)qword_100083948;
  *a1 = qword_100083948;

  return v2;
}

unint64_t sub_10002AAD0()
{
  unint64_t result = qword_100081CA8;
  if (!qword_100081CA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100081CA8);
  }
  return result;
}

uint64_t sub_10002AB24()
{
  sub_10002ADDC(&qword_100081C88);
  uint64_t v2 = sub_10005E6A0();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
  return sub_10000538C(v3, v0, v2, v1);
}

uint64_t sub_10002ABD4()
{
  return sub_10002ADDC(&qword_100081CB8);
}

uint64_t sub_10002AC08()
{
  return sub_10002ADDC(&qword_100081CC0);
}

uint64_t sub_10002AC3C()
{
  return sub_10002ADDC(&qword_100081CC8);
}

uint64_t sub_10002AC70@<X0>(uint64_t *a1@<X8>)
{
  sub_10002ADDC((unint64_t *)&qword_100081B90);
  uint64_t result = sub_10005E3D0();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_10002ACCC@<X0>(uint64_t a1@<X8>)
{
  return sub_1000085D4(&qword_100080480, (uint64_t (*)(void))&type metadata accessor for TypeDisplayRepresentation, (uint64_t)qword_1000838F8, a1);
}

uint64_t sub_10002AD04()
{
  return sub_100009DAC(&qword_100081CD0, &qword_100081CD8);
}

uint64_t sub_10002AD40(uint64_t a1)
{
  uint64_t v2 = sub_10002ADDC(qword_100081C38);

  return static AppEntity.defaultResolverSpecification.getter(a1, v2);
}

uint64_t sub_10002ADA8()
{
  return sub_10002ADDC(&qword_100081CE0);
}

uint64_t sub_10002ADDC(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for CallHangUpEntity();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10002AE20(uint64_t a1)
{
  uint64_t v2 = sub_10002ADDC(&qword_100081CC8);

  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

ValueMetadata *type metadata accessor for CallHangUpEntity.CallHangUpEntityQuery()
{
  return &type metadata for CallHangUpEntity.CallHangUpEntityQuery;
}

ValueMetadata *type metadata accessor for CallHangUpEntity.UpdateIntent_value()
{
  return &type metadata for CallHangUpEntity.UpdateIntent_value;
}

uint64_t sub_10002AEA8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10002AEBC);
}

uint64_t sub_10002AEBC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_10005E620();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20));
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
}

uint64_t sub_10002AF7C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10002AF90);
}

uint64_t sub_10002AF90(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_10005E620();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20)) = (a2 - 1);
  }
  return result;
}

ValueMetadata *type metadata accessor for OpenCallHangUpEntity()
{
  return &type metadata for OpenCallHangUpEntity;
}

uint64_t sub_10002B05C()
{
  return sub_100009DAC(&qword_100081D78, &qword_100081D80);
}

uint64_t sub_10002B098()
{
  return sub_100009DAC(&qword_100081D88, &qword_100081D80);
}

uint64_t sub_10002B0D4()
{
  uint64_t v22 = sub_10005E720();
  uint64_t v0 = *(void *)(v22 - 8);
  __chkstk_darwin(v22);
  uint64_t v2 = (char *)&v21 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100005268(&qword_100080848);
  uint64_t v4 = __chkstk_darwin(v3 - 8);
  uint64_t v6 = (char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v21 - v7;
  uint64_t v9 = sub_100005268(&qword_100081D90);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100005268(&qword_100080858);
  __chkstk_darwin(v12 - 8);
  unint64_t v14 = (char *)&v21 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_10005E800();
  uint64_t v16 = *(void *)(v15 - 8);
  __chkstk_darwin(v15);
  uint64_t v21 = sub_100005268(&qword_100081D98);
  sub_10005E7E0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v16 + 56))(v14, 1, 1, v15);
  uint64_t v17 = type metadata accessor for CallHangUpEntity();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v11, 1, 1, v17);
  uint64_t v18 = sub_10005E390();
  Swift::String v19 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56);
  v19(v8, 1, 1, v18);
  v19(v6, 1, 1, v18);
  (*(void (**)(char *, void, uint64_t))(v0 + 104))(v2, enum case for InputConnectionBehavior.default(_:), v22);
  sub_10002ADDC(qword_100081C38);
  return sub_10005E420();
}

uint64_t sub_10002B458()
{
  uint64_t v0 = sub_100005268(&qword_100080A68);
  __chkstk_darwin(v0 - 8);
  uint64_t v34 = (char *)v26 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v35 = sub_10005E720();
  uint64_t v2 = *(void *)(v35 - 8);
  __chkstk_darwin(v35);
  uint64_t v4 = (char *)v26 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100005268(&qword_100080848);
  uint64_t v6 = __chkstk_darwin(v5 - 8);
  uint64_t v8 = (char *)v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)v26 - v9;
  uint64_t v11 = sub_100005268(&qword_100081D90);
  __chkstk_darwin(v11 - 8);
  uint64_t v13 = (char *)v26 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26[1] = v13;
  uint64_t v14 = sub_100005268(&qword_100080858);
  __chkstk_darwin(v14 - 8);
  uint64_t v16 = (char *)v26 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = v16;
  uint64_t v17 = sub_10005E800();
  uint64_t v33 = v17;
  uint64_t v18 = *(void *)(v17 - 8);
  __chkstk_darwin(v17);
  uint64_t v31 = sub_100005268(&qword_100081D98);
  sub_10005E7E0();
  uint64_t v32 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v18 + 56);
  v32(v16, 1, 1, v17);
  uint64_t v19 = type metadata accessor for CallHangUpEntity();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v13, 1, 1, v19);
  uint64_t v20 = sub_10005E390();
  uint64_t v21 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56);
  v21(v10, 1, 1, v20);
  v21(v8, 1, 1, v20);
  unsigned int v30 = enum case for InputConnectionBehavior.default(_:);
  uint64_t v22 = *(void (**)(void))(v2 + 104);
  uint64_t v28 = v2 + 104;
  uint64_t v29 = (void (*)(char *, void, uint64_t))v22;
  v22(v4);
  sub_10002ADDC(qword_100081C38);
  uint64_t v23 = v27;
  uint64_t v31 = sub_10005E420();
  sub_100005268(&qword_100080A80);
  sub_10005E7E0();
  v32(v23, 1, 1, v33);
  char v36 = 2;
  uint64_t v24 = sub_10005E9F0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 56))(v34, 1, 1, v24);
  v21(v10, 1, 1, v20);
  v29(v4, v30, v35);
  sub_10005E430();
  return v31;
}

uint64_t sub_10002B940(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for CallHangUpEntity();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10002B99C@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  *a2 = *(void *)(a1 + *(int *)(type metadata accessor for CallHangUpEntity() + 20));

  return swift_retain();
}

uint64_t sub_10002B9E4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for CallHangUpEntity();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_10002BA48()
{
  unint64_t result = qword_100081DF0;
  if (!qword_100081DF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100081DF0);
  }
  return result;
}

unint64_t sub_10002BA9C()
{
  unint64_t result = qword_100081DF8;
  if (!qword_100081DF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100081DF8);
  }
  return result;
}

ValueMetadata *type metadata accessor for AlwaysShowSpeechEntityToggleControl()
{
  return &type metadata for AlwaysShowSpeechEntityToggleControl;
}

ValueMetadata *type metadata accessor for AlwaysPrintSiriResponseToggleControl()
{
  return &type metadata for AlwaysPrintSiriResponseToggleControl;
}

uint64_t sub_10002BB10()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10002BB2C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v30 = a1;
  uint64_t v1 = sub_100005268(&qword_1000816A8);
  uint64_t v23 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v3 = (char *)&v23 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100005268(&qword_1000816B0);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v24 = v4;
  uint64_t v25 = v5;
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100005268(&qword_1000816B8);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v26 = v8;
  uint64_t v27 = v9;
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100005268(&qword_1000816C0);
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v28 = v12;
  uint64_t v29 = v13;
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)&v23 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  sub_100005268(&qword_1000816C8);
  sub_10002C620(&qword_100080BA8, (void (*)(uint64_t))type metadata accessor for AlwaysPrintSiriResponseEntity);
  sub_100009DAC(&qword_1000816D8, &qword_1000816C8);
  sub_10005E960();
  sub_10005E8F0();
  uint64_t v16 = sub_100009DAC(&qword_1000816E0, &qword_1000816A8);
  sub_10005E920();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v23 + 8))(v3, v1);
  sub_10005E8F0();
  uint64_t v31 = v1;
  uint64_t v32 = v16;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v18 = v24;
  sub_10005E900();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v25 + 8))(v7, v18);
  uint64_t v31 = v18;
  uint64_t v32 = OpaqueTypeConformance2;
  uint64_t v19 = swift_getOpaqueTypeConformance2();
  uint64_t v20 = v26;
  sub_10005E930();
  (*(void (**)(char *, uint64_t))(v27 + 8))(v11, v20);
  uint64_t v31 = v20;
  uint64_t v32 = v19;
  swift_getOpaqueTypeConformance2();
  uint64_t v21 = v28;
  sub_10005E910();
  return (*(uint64_t (**)(char *, uint64_t))(v29 + 8))(v15, v21);
}

uint64_t sub_10002C074()
{
  return sub_10001C3B4();
}

uint64_t sub_10002C094()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10002C0B0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v30 = a1;
  uint64_t v1 = sub_100005268(&qword_1000816A8);
  uint64_t v23 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v3 = (char *)&v23 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100005268(&qword_1000816B0);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v24 = v4;
  uint64_t v25 = v5;
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100005268(&qword_1000816B8);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v26 = v8;
  uint64_t v27 = v9;
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100005268(&qword_1000816C0);
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v28 = v12;
  uint64_t v29 = v13;
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)&v23 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  sub_100005268(&qword_1000816C8);
  sub_10002C620(&qword_100081268, (void (*)(uint64_t))type metadata accessor for AlwaysShowSpeechEntity);
  sub_100009DAC(&qword_1000816D8, &qword_1000816C8);
  sub_10005E960();
  sub_10005E8F0();
  uint64_t v16 = sub_100009DAC(&qword_1000816E0, &qword_1000816A8);
  sub_10005E920();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v23 + 8))(v3, v1);
  sub_10005E8F0();
  uint64_t v31 = v1;
  uint64_t v32 = v16;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v18 = v24;
  sub_10005E900();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v25 + 8))(v7, v18);
  uint64_t v31 = v18;
  uint64_t v32 = OpaqueTypeConformance2;
  uint64_t v19 = swift_getOpaqueTypeConformance2();
  uint64_t v20 = v26;
  sub_10005E930();
  (*(void (**)(char *, uint64_t))(v27 + 8))(v11, v20);
  uint64_t v31 = v20;
  uint64_t v32 = v19;
  swift_getOpaqueTypeConformance2();
  uint64_t v21 = v28;
  sub_10005E910();
  return (*(uint64_t (**)(char *, uint64_t))(v29 + 8))(v15, v21);
}

uint64_t sub_10002C5F8()
{
  return sub_10001C3B4();
}

uint64_t sub_10002C620(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_10002C668()
{
  return swift_getOpaqueTypeConformance2();
}

void sub_10002C794()
{
  qword_100083950 = (uint64_t)&_swiftEmptyArrayStorage;
}

uint64_t sub_10002C7A8(uint64_t a1)
{
  uint64_t v13 = a1;
  uint64_t v1 = sub_100005268(&qword_100082220);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v15 = v1;
  uint64_t v16 = v2;
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)&v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100005268(&qword_100082228);
  uint64_t v6 = __chkstk_darwin(v5);
  __chkstk_darwin(v6);
  sub_10001C838();
  sub_10005E510();
  v17._countAndFlagsBits = 0x206E65704FLL;
  v17._object = (void *)0xE500000000000000;
  sub_10005E500(v17);
  swift_getKeyPath();
  sub_10001DB7C();
  sub_10005E440();
  swift_release();
  sub_10005E4F0();
  swift_release();
  v18._countAndFlagsBits = 0;
  v18._object = (void *)0xE000000000000000;
  sub_10005E500(v18);
  sub_10005E520();
  uint64_t v14 = sub_10005E470();
  uint64_t v7 = v15;
  uint64_t v8 = *(void (**)(char *, uint64_t))(v16 + 8);
  v16 += 8;
  v8(v4, v15);
  sub_10005E510();
  v19._countAndFlagsBits = 0x206E65704FLL;
  v19._object = (void *)0xE500000000000000;
  sub_10005E500(v19);
  swift_getKeyPath();
  sub_10005E440();
  swift_release();
  sub_10005E4F0();
  swift_release();
  v20._countAndFlagsBits = 0x676E697474655320;
  v20._object = (void *)0xE900000000000073;
  sub_10005E500(v20);
  sub_10005E520();
  uint64_t v9 = sub_10005E470();
  v8(v4, v7);
  sub_100005268(&qword_100082230);
  uint64_t v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_10006F6F0;
  *(void *)(v10 + 32) = v14;
  *(void *)(v10 + 40) = v9;
  uint64_t v11 = sub_10005E460();
  swift_bridgeObjectRelease();
  return v11;
}

uint64_t sub_10002CAF0(uint64_t a1)
{
  return sub_10002E064(a1, (uint64_t)&unk_10006FCE8, (void (*)(void))sub_10001DB7C, (void (*)(uint64_t))sub_10001C838);
}

uint64_t sub_10002CB38()
{
  return sub_100032444();
}

uint64_t sub_10002CB58(uint64_t a1)
{
  uint64_t v13 = a1;
  uint64_t v1 = sub_100005268(&qword_100082208);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v15 = v1;
  uint64_t v16 = v2;
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)&v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100005268(&qword_100082210);
  uint64_t v6 = __chkstk_darwin(v5);
  __chkstk_darwin(v6);
  sub_100015DAC();
  sub_10005E510();
  v17._countAndFlagsBits = 0x206E65704FLL;
  v17._object = (void *)0xE500000000000000;
  sub_10005E500(v17);
  swift_getKeyPath();
  sub_10003D288(&qword_1000814D8, (void (*)(uint64_t))type metadata accessor for SpokenResponsesEntity);
  sub_10005E440();
  swift_release();
  sub_10005E4F0();
  swift_release();
  v18._countAndFlagsBits = 0;
  v18._object = (void *)0xE000000000000000;
  sub_10005E500(v18);
  sub_10005E520();
  uint64_t v14 = sub_10005E470();
  uint64_t v7 = v15;
  uint64_t v8 = *(void (**)(char *, uint64_t))(v16 + 8);
  v16 += 8;
  v8(v4, v15);
  sub_10005E510();
  v19._countAndFlagsBits = 0x206E65704FLL;
  v19._object = (void *)0xE500000000000000;
  sub_10005E500(v19);
  swift_getKeyPath();
  sub_10005E440();
  swift_release();
  sub_10005E4F0();
  swift_release();
  v20._countAndFlagsBits = 0x676E697474655320;
  v20._object = (void *)0xE900000000000073;
  sub_10005E500(v20);
  sub_10005E520();
  uint64_t v9 = sub_10005E470();
  v8(v4, v7);
  sub_100005268(&qword_100082218);
  uint64_t v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_10006F6F0;
  *(void *)(v10 + 32) = v14;
  *(void *)(v10 + 40) = v9;
  uint64_t v11 = sub_10005E460();
  swift_bridgeObjectRelease();
  return v11;
}

uint64_t sub_10002CED0()
{
  uint64_t v0 = sub_10005E4D0();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  sub_10003D288(&qword_1000814D8, (void (*)(uint64_t))type metadata accessor for SpokenResponsesEntity);
  sub_10005E440();
  swift_release();
  sub_100015DAC();
  sub_10005E4C0();
  uint64_t v4 = sub_10005E4B0();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  sub_100005268(&qword_100081EA0);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_10006EC10;
  *(void *)(v5 + 32) = v4;
  uint64_t v6 = sub_10005E4A0();
  swift_bridgeObjectRelease();
  return v6;
}

uint64_t sub_10002D068()
{
  return sub_100032444();
}

uint64_t sub_10002D08C(uint64_t a1)
{
  uint64_t v13 = a1;
  uint64_t v1 = sub_100005268(&qword_1000821F0);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v15 = v1;
  uint64_t v16 = v2;
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)&v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100005268(&qword_1000821F8);
  uint64_t v6 = __chkstk_darwin(v5);
  __chkstk_darwin(v6);
  sub_10003C664();
  sub_10005E510();
  v17._countAndFlagsBits = 0x206E65704FLL;
  v17._object = (void *)0xE500000000000000;
  sub_10005E500(v17);
  swift_getKeyPath();
  sub_10003D288(&qword_1000821E8, (void (*)(uint64_t))type metadata accessor for AnnounceCallsEntity);
  sub_10005E440();
  swift_release();
  sub_10005E4F0();
  swift_release();
  v18._countAndFlagsBits = 0;
  v18._object = (void *)0xE000000000000000;
  sub_10005E500(v18);
  sub_10005E520();
  uint64_t v14 = sub_10005E470();
  uint64_t v7 = v15;
  uint64_t v8 = *(void (**)(char *, uint64_t))(v16 + 8);
  v16 += 8;
  v8(v4, v15);
  sub_10005E510();
  v19._countAndFlagsBits = 0x206E65704FLL;
  v19._object = (void *)0xE500000000000000;
  sub_10005E500(v19);
  swift_getKeyPath();
  sub_10005E440();
  swift_release();
  sub_10005E4F0();
  swift_release();
  v20._countAndFlagsBits = 0x676E697474655320;
  v20._object = (void *)0xE900000000000073;
  sub_10005E500(v20);
  sub_10005E520();
  uint64_t v9 = sub_10005E470();
  v8(v4, v7);
  sub_100005268(&qword_100082200);
  uint64_t v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_10006F6F0;
  *(void *)(v10 + 32) = v14;
  *(void *)(v10 + 40) = v9;
  uint64_t v11 = sub_10005E460();
  swift_bridgeObjectRelease();
  return v11;
}

uint64_t sub_10002D404(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(void), uint64_t (*a6)(void))
{
  uint64_t v8 = a5(0);
  uint64_t v9 = __chkstk_darwin(v8 - 8);
  uint64_t v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v13 = (char *)&v15 - v12;
  sub_10003D2D0(a1, (uint64_t)&v15 - v12, a6);
  sub_10003D2D0((uint64_t)v13, (uint64_t)v11, a6);
  sub_10005E400();
  return sub_10003D338((uint64_t)v13, a6);
}

uint64_t sub_10002D4E0()
{
  uint64_t v0 = sub_10005E4D0();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  sub_10003D288(&qword_1000821E8, (void (*)(uint64_t))type metadata accessor for AnnounceCallsEntity);
  sub_10005E440();
  swift_release();
  sub_10003C664();
  sub_10005E4C0();
  uint64_t v4 = sub_10005E4B0();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  sub_100005268(&qword_100081EA0);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_10006EC10;
  *(void *)(v5 + 32) = v4;
  uint64_t v6 = sub_10005E4A0();
  swift_bridgeObjectRelease();
  return v6;
}

uint64_t sub_10002D678()
{
  return sub_10003B308();
}

uint64_t sub_10002D6B4(uint64_t a1)
{
  uint64_t v13 = a1;
  uint64_t v1 = sub_100005268(&qword_1000821D0);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v15 = v1;
  uint64_t v16 = v2;
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)&v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100005268(&qword_1000821D8);
  uint64_t v6 = __chkstk_darwin(v5);
  __chkstk_darwin(v6);
  sub_10003C6B8();
  sub_10005E510();
  v17._countAndFlagsBits = 0x206E65704FLL;
  v17._object = (void *)0xE500000000000000;
  sub_10005E500(v17);
  swift_getKeyPath();
  sub_10003D288(&qword_1000821C8, (void (*)(uint64_t))type metadata accessor for AutoSendMessagesEntity);
  sub_10005E440();
  swift_release();
  sub_10005E4F0();
  swift_release();
  v18._countAndFlagsBits = 0;
  v18._object = (void *)0xE000000000000000;
  sub_10005E500(v18);
  sub_10005E520();
  uint64_t v14 = sub_10005E470();
  uint64_t v7 = v15;
  uint64_t v8 = *(void (**)(char *, uint64_t))(v16 + 8);
  v16 += 8;
  v8(v4, v15);
  sub_10005E510();
  v19._countAndFlagsBits = 0x206E65704FLL;
  v19._object = (void *)0xE500000000000000;
  sub_10005E500(v19);
  swift_getKeyPath();
  sub_10005E440();
  swift_release();
  sub_10005E4F0();
  swift_release();
  v20._countAndFlagsBits = 0x676E697474655320;
  v20._object = (void *)0xE900000000000073;
  sub_10005E500(v20);
  sub_10005E520();
  uint64_t v9 = sub_10005E470();
  v8(v4, v7);
  sub_100005268(&qword_1000821E0);
  uint64_t v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_10006F6F0;
  *(void *)(v10 + 32) = v14;
  *(void *)(v10 + 40) = v9;
  uint64_t v11 = sub_10005E460();
  swift_bridgeObjectRelease();
  return v11;
}

uint64_t sub_10002DA2C()
{
  uint64_t v0 = sub_10005E4D0();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  sub_10003D288(&qword_1000821C8, (void (*)(uint64_t))type metadata accessor for AutoSendMessagesEntity);
  sub_10005E440();
  swift_release();
  sub_10003C6B8();
  sub_10005E4C0();
  uint64_t v4 = sub_10005E4B0();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  sub_100005268(&qword_100081EA0);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_10006EC10;
  *(void *)(v5 + 32) = v4;
  uint64_t v6 = sub_10005E4A0();
  swift_bridgeObjectRelease();
  return v6;
}

uint64_t sub_10002DBC4()
{
  return sub_10003B308();
}

uint64_t sub_10002DBFC(uint64_t a1)
{
  uint64_t v13 = a1;
  uint64_t v1 = sub_100005268(&qword_1000821B0);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v15 = v1;
  uint64_t v16 = v2;
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)&v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100005268(&qword_1000821B8);
  uint64_t v6 = __chkstk_darwin(v5);
  __chkstk_darwin(v6);
  sub_10001ED90();
  sub_10005E510();
  v17._countAndFlagsBits = 0x206E65704FLL;
  v17._object = (void *)0xE500000000000000;
  sub_10005E500(v17);
  swift_getKeyPath();
  sub_100025554();
  sub_10005E440();
  swift_release();
  sub_10005E4F0();
  swift_release();
  v18._countAndFlagsBits = 0;
  v18._object = (void *)0xE000000000000000;
  sub_10005E500(v18);
  sub_10005E520();
  uint64_t v14 = sub_10005E470();
  uint64_t v7 = v15;
  uint64_t v8 = *(void (**)(char *, uint64_t))(v16 + 8);
  v16 += 8;
  v8(v4, v15);
  sub_10005E510();
  v19._countAndFlagsBits = 0x206E65704FLL;
  v19._object = (void *)0xE500000000000000;
  sub_10005E500(v19);
  swift_getKeyPath();
  sub_10005E440();
  swift_release();
  sub_10005E4F0();
  swift_release();
  v20._countAndFlagsBits = 0x676E697474655320;
  v20._object = (void *)0xE900000000000073;
  sub_10005E500(v20);
  sub_10005E520();
  uint64_t v9 = sub_10005E470();
  v8(v4, v7);
  sub_100005268(&qword_1000821C0);
  uint64_t v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_10006F6F0;
  *(void *)(v10 + 32) = v14;
  *(void *)(v10 + 40) = v9;
  uint64_t v11 = sub_10005E460();
  swift_bridgeObjectRelease();
  return v11;
}

uint64_t sub_10002DF44()
{
  return swift_release();
}

uint64_t sub_10002E01C(uint64_t a1)
{
  return sub_10002E064(a1, (uint64_t)&unk_10006FC48, (void (*)(void))sub_100025554, (void (*)(uint64_t))sub_10001ED90);
}

uint64_t sub_10002E064(uint64_t a1, uint64_t a2, void (*a3)(void), void (*a4)(uint64_t))
{
  uint64_t v6 = sub_10005E4D0();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  a3();
  sub_10005E440();
  uint64_t v10 = swift_release();
  a4(v10);
  sub_10005E4C0();
  uint64_t v11 = sub_10005E4B0();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  sub_100005268(&qword_100081EA0);
  uint64_t v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = xmmword_10006EC10;
  *(void *)(v12 + 32) = v11;
  uint64_t v13 = sub_10005E4A0();
  swift_bridgeObjectRelease();
  return v13;
}

uint64_t sub_10002E1DC()
{
  return sub_10003B308();
}

uint64_t sub_10002E214(uint64_t a1)
{
  uint64_t v13 = a1;
  uint64_t v1 = sub_100005268(&qword_100082198);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v15 = v1;
  uint64_t v16 = v2;
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)&v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100005268(&qword_1000821A0);
  uint64_t v6 = __chkstk_darwin(v5);
  __chkstk_darwin(v6);
  sub_10002868C();
  sub_10005E510();
  v17._countAndFlagsBits = 0x206E65704FLL;
  v17._object = (void *)0xE500000000000000;
  sub_10005E500(v17);
  swift_getKeyPath();
  sub_10003D288(&qword_100081C58, (void (*)(uint64_t))type metadata accessor for CallHangUpEntity);
  sub_10005E440();
  swift_release();
  sub_10005E4F0();
  swift_release();
  v18._countAndFlagsBits = 0;
  v18._object = (void *)0xE000000000000000;
  sub_10005E500(v18);
  sub_10005E520();
  uint64_t v14 = sub_10005E470();
  uint64_t v7 = v15;
  uint64_t v8 = *(void (**)(char *, uint64_t))(v16 + 8);
  v16 += 8;
  v8(v4, v15);
  sub_10005E510();
  v19._countAndFlagsBits = 0x206E65704FLL;
  v19._object = (void *)0xE500000000000000;
  sub_10005E500(v19);
  swift_getKeyPath();
  sub_10005E440();
  swift_release();
  sub_10005E4F0();
  swift_release();
  v20._countAndFlagsBits = 0x676E697474655320;
  v20._object = (void *)0xE900000000000073;
  sub_10005E500(v20);
  sub_10005E520();
  uint64_t v9 = sub_10005E470();
  v8(v4, v7);
  sub_100005268(&qword_1000821A8);
  uint64_t v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_10006F6F0;
  *(void *)(v10 + 32) = v14;
  *(void *)(v10 + 40) = v9;
  uint64_t v11 = sub_10005E460();
  swift_bridgeObjectRelease();
  return v11;
}

uint64_t sub_10002E58C()
{
  uint64_t v0 = sub_10005E4D0();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  sub_10003D288(&qword_100081C58, (void (*)(uint64_t))type metadata accessor for CallHangUpEntity);
  sub_10005E440();
  swift_release();
  sub_10002868C();
  sub_10005E4C0();
  uint64_t v4 = sub_10005E4B0();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  sub_100005268(&qword_100081EA0);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_10006EC10;
  *(void *)(v5 + 32) = v4;
  uint64_t v6 = sub_10005E4A0();
  swift_bridgeObjectRelease();
  return v6;
}

uint64_t sub_10002E724()
{
  return sub_10003B308();
}

uint64_t sub_10002E75C(uint64_t a1)
{
  uint64_t v13 = a1;
  uint64_t v1 = sub_100005268(&qword_100082180);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v15 = v1;
  uint64_t v16 = v2;
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)&v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100005268(&qword_100082188);
  uint64_t v6 = __chkstk_darwin(v5);
  __chkstk_darwin(v6);
  sub_100002E20();
  sub_10005E510();
  v17._countAndFlagsBits = 0x206E65704FLL;
  v17._object = (void *)0xE500000000000000;
  sub_10005E500(v17);
  swift_getKeyPath();
  sub_10003D288(&qword_100080738, (void (*)(uint64_t))type metadata accessor for AssistantLockScreenAccessEntity);
  sub_10005E440();
  swift_release();
  sub_10005E4F0();
  swift_release();
  v18._countAndFlagsBits = 0;
  v18._object = (void *)0xE000000000000000;
  sub_10005E500(v18);
  sub_10005E520();
  uint64_t v14 = sub_10005E470();
  uint64_t v7 = v15;
  uint64_t v8 = *(void (**)(char *, uint64_t))(v16 + 8);
  v16 += 8;
  v8(v4, v15);
  sub_10005E510();
  v19._countAndFlagsBits = 0x206E65704FLL;
  v19._object = (void *)0xE500000000000000;
  sub_10005E500(v19);
  swift_getKeyPath();
  sub_10005E440();
  swift_release();
  sub_10005E4F0();
  swift_release();
  v20._countAndFlagsBits = 0x676E697474655320;
  v20._object = (void *)0xE900000000000073;
  sub_10005E500(v20);
  sub_10005E520();
  uint64_t v9 = sub_10005E470();
  v8(v4, v7);
  sub_100005268(&qword_100082190);
  uint64_t v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_10006F6F0;
  *(void *)(v10 + 32) = v14;
  *(void *)(v10 + 40) = v9;
  uint64_t v11 = sub_10005E460();
  swift_bridgeObjectRelease();
  return v11;
}

uint64_t sub_10002EAD4()
{
  uint64_t v0 = sub_10005E4D0();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  sub_10003D288(&qword_100080738, (void (*)(uint64_t))type metadata accessor for AssistantLockScreenAccessEntity);
  sub_10005E440();
  swift_release();
  sub_100002E20();
  sub_10005E4C0();
  uint64_t v4 = sub_10005E4B0();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  sub_100005268(&qword_100081EA0);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_10006EC10;
  *(void *)(v5 + 32) = v4;
  uint64_t v6 = sub_10005E4A0();
  swift_bridgeObjectRelease();
  return v6;
}

uint64_t sub_10002EC6C()
{
  return sub_100032444();
}

uint64_t sub_10002EC88(uint64_t a1)
{
  uint64_t v13 = a1;
  uint64_t v1 = sub_100005268(&qword_100082168);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v15 = v1;
  uint64_t v16 = v2;
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)&v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100005268(&qword_100082170);
  uint64_t v6 = __chkstk_darwin(v5);
  __chkstk_darwin(v6);
  sub_10003C70C();
  sub_10005E510();
  v17._countAndFlagsBits = 0x206E65704FLL;
  v17._object = (void *)0xE500000000000000;
  sub_10005E500(v17);
  swift_getKeyPath();
  sub_10003D288(&qword_100082160, (void (*)(uint64_t))type metadata accessor for MyInformationEntity);
  sub_10005E440();
  swift_release();
  sub_10005E4F0();
  swift_release();
  v18._countAndFlagsBits = 0;
  v18._object = (void *)0xE000000000000000;
  sub_10005E500(v18);
  sub_10005E520();
  uint64_t v14 = sub_10005E470();
  uint64_t v7 = v15;
  uint64_t v8 = *(void (**)(char *, uint64_t))(v16 + 8);
  v16 += 8;
  v8(v4, v15);
  sub_10005E510();
  v19._countAndFlagsBits = 0x206E65704FLL;
  v19._object = (void *)0xE500000000000000;
  sub_10005E500(v19);
  swift_getKeyPath();
  sub_10005E440();
  swift_release();
  sub_10005E4F0();
  swift_release();
  v20._countAndFlagsBits = 0x676E697474655320;
  v20._object = (void *)0xE900000000000073;
  sub_10005E500(v20);
  sub_10005E520();
  uint64_t v9 = sub_10005E470();
  v8(v4, v7);
  sub_100005268(&qword_100082178);
  uint64_t v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_10006F6F0;
  *(void *)(v10 + 32) = v14;
  *(void *)(v10 + 40) = v9;
  uint64_t v11 = sub_10005E460();
  swift_bridgeObjectRelease();
  return v11;
}

uint64_t sub_10002F000()
{
  uint64_t v0 = sub_10005E4D0();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  sub_10003D288(&qword_100082160, (void (*)(uint64_t))type metadata accessor for MyInformationEntity);
  sub_10005E440();
  swift_release();
  sub_10003C70C();
  sub_10005E4C0();
  uint64_t v4 = sub_10005E4B0();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  sub_100005268(&qword_100081EA0);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_10006EC10;
  *(void *)(v5 + 32) = v4;
  uint64_t v6 = sub_10005E4A0();
  swift_bridgeObjectRelease();
  return v6;
}

uint64_t sub_10002F198()
{
  return sub_100032444();
}

uint64_t sub_10002F1BC(uint64_t a1)
{
  uint64_t v45 = a1;
  uint64_t v40 = sub_100005268(&qword_100082148);
  uint64_t v46 = *(void *)(v40 - 8);
  __chkstk_darwin(v40);
  uint64_t v43 = (char *)v30 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v41 = sub_10005E450();
  uint64_t v2 = *(void *)(v41 - 8);
  __chkstk_darwin(v41);
  uint64_t v4 = (char *)v30 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100005268(&qword_100082150);
  uint64_t v6 = __chkstk_darwin(v5);
  uint64_t v35 = (char *)v30 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v33 = (char *)v30 - v9;
  uint64_t v10 = __chkstk_darwin(v8);
  __chkstk_darwin(v10);
  unint64_t v11 = sub_10003C760();
  sub_10005E510();
  v47._countAndFlagsBits = 0x206E65704FLL;
  v47._object = (void *)0xE500000000000000;
  sub_10005E500(v47);
  swift_getKeyPath();
  uint64_t v44 = sub_10003D288(&qword_100082140, (void (*)(uint64_t))type metadata accessor for AnnounceNotificationForAppEntity);
  sub_10005E440();
  swift_release();
  sub_10005E4F0();
  swift_release();
  v48._countAndFlagsBits = 0x20726F4620;
  v48._object = (void *)0xE500000000000000;
  sub_10005E500(v48);
  uint64_t v12 = enum case for _AssistantIntent.PhraseToken.applicationName(_:);
  uint64_t v13 = *(void (**)(char *, uint64_t, uint64_t))(v2 + 104);
  uint64_t v36 = v2 + 104;
  long long v37 = v13;
  uint64_t v14 = v41;
  v13(v4, enum case for _AssistantIntent.PhraseToken.applicationName(_:), v41);
  sub_10005E4E0();
  uint64_t v42 = *(void (**)(char *, uint64_t))(v2 + 8);
  v42(v4, v14);
  uint64_t v38 = v2 + 8;
  v49._countAndFlagsBits = 0;
  v49._object = (void *)0xE000000000000000;
  sub_10005E500(v49);
  uint64_t v15 = v43;
  sub_10005E520();
  uint64_t v34 = sub_10005E470();
  uint64_t v16 = *(void (**)(char *, uint64_t))(v46 + 8);
  v46 += 8;
  uint64_t v39 = v16;
  v16(v15, v40);
  sub_10005E510();
  v50._countAndFlagsBits = 0x206E65704FLL;
  v50._object = (void *)0xE500000000000000;
  sub_10005E500(v50);
  swift_getKeyPath();
  sub_10005E440();
  swift_release();
  sub_10005E4F0();
  swift_release();
  v51._countAndFlagsBits = 0x20726F4620;
  v51._object = (void *)0xE500000000000000;
  sub_10005E500(v51);
  unsigned int v31 = v12;
  Swift::String v17 = v37;
  v37(v4, v12, v14);
  sub_10005E4E0();
  v42(v4, v14);
  v52._countAndFlagsBits = 0x676E697474655320;
  v52._object = (void *)0xE900000000000073;
  sub_10005E500(v52);
  Swift::String v18 = v43;
  sub_10005E520();
  v30[1] = v11;
  uint64_t v32 = sub_10005E470();
  Swift::String v19 = v18;
  uint64_t v20 = v40;
  v39(v19, v40);
  sub_10005E510();
  v53._countAndFlagsBits = 0x206E65704FLL;
  v53._object = (void *)0xE500000000000000;
  sub_10005E500(v53);
  uint64_t v21 = v41;
  v17(v4, v12, v41);
  sub_10005E4E0();
  v42(v4, v21);
  v54._countAndFlagsBits = 32;
  v54._object = (void *)0xE100000000000000;
  sub_10005E500(v54);
  swift_getKeyPath();
  sub_10005E440();
  swift_release();
  sub_10005E4F0();
  swift_release();
  v55._countAndFlagsBits = 0;
  v55._object = (void *)0xE000000000000000;
  sub_10005E500(v55);
  uint64_t v22 = v43;
  sub_10005E520();
  uint64_t v33 = (char *)sub_10005E470();
  uint64_t v23 = v39;
  v39(v22, v20);
  sub_10005E510();
  v56._countAndFlagsBits = 0x206E65704FLL;
  v56._object = (void *)0xE500000000000000;
  sub_10005E500(v56);
  uint64_t v24 = v41;
  v37(v4, v31, v41);
  sub_10005E4E0();
  v42(v4, v24);
  v57._countAndFlagsBits = 32;
  v57._object = (void *)0xE100000000000000;
  sub_10005E500(v57);
  swift_getKeyPath();
  sub_10005E440();
  swift_release();
  sub_10005E4F0();
  swift_release();
  v58._countAndFlagsBits = 0x676E697474655320;
  v58._object = (void *)0xE900000000000073;
  sub_10005E500(v58);
  sub_10005E520();
  uint64_t v25 = sub_10005E470();
  v23(v22, v20);
  sub_100005268(&qword_100082158);
  uint64_t v26 = swift_allocObject();
  *(_OWORD *)(v26 + 16) = xmmword_10006F700;
  uint64_t v27 = v32;
  *(void *)(v26 + 32) = v34;
  *(void *)(v26 + 40) = v27;
  *(void *)(v26 + 48) = v33;
  *(void *)(v26 + 56) = v25;
  uint64_t v28 = sub_10005E460();
  swift_bridgeObjectRelease();
  return v28;
}

uint64_t sub_10002F950()
{
  uint64_t v0 = sub_10005E4D0();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  sub_10003D288(&qword_100082140, (void (*)(uint64_t))type metadata accessor for AnnounceNotificationForAppEntity);
  sub_10005E440();
  swift_release();
  sub_10003C760();
  sub_10005E4C0();
  uint64_t v4 = sub_10005E4B0();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  sub_100005268(&qword_100081EA0);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_10006EC10;
  *(void *)(v5 + 32) = v4;
  uint64_t v6 = sub_10005E4A0();
  swift_bridgeObjectRelease();
  return v6;
}

uint64_t sub_10002FAE8()
{
  return sub_10003B308();
}

uint64_t sub_10002FB20(uint64_t a1)
{
  uint64_t v13 = a1;
  uint64_t v1 = sub_100005268(&qword_100082128);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v15 = v1;
  uint64_t v16 = v2;
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)&v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100005268(&qword_100082130);
  uint64_t v6 = __chkstk_darwin(v5);
  __chkstk_darwin(v6);
  sub_10000CFE0();
  sub_10005E510();
  v17._countAndFlagsBits = 0x206E65704FLL;
  v17._object = (void *)0xE500000000000000;
  sub_10005E500(v17);
  swift_getKeyPath();
  sub_10000DAA8();
  sub_10005E440();
  swift_release();
  sub_10005E4F0();
  swift_release();
  v18._countAndFlagsBits = 0;
  v18._object = (void *)0xE000000000000000;
  sub_10005E500(v18);
  sub_10005E520();
  uint64_t v14 = sub_10005E470();
  uint64_t v7 = v15;
  uint64_t v8 = *(void (**)(char *, uint64_t))(v16 + 8);
  v16 += 8;
  v8(v4, v15);
  sub_10005E510();
  v19._countAndFlagsBits = 0x206E65704FLL;
  v19._object = (void *)0xE500000000000000;
  sub_10005E500(v19);
  swift_getKeyPath();
  sub_10005E440();
  swift_release();
  sub_10005E4F0();
  swift_release();
  v20._countAndFlagsBits = 0x676E697474655320;
  v20._object = (void *)0xE900000000000073;
  sub_10005E500(v20);
  sub_10005E520();
  uint64_t v9 = sub_10005E470();
  v8(v4, v7);
  sub_100005268(&qword_100082138);
  uint64_t v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_10006F6F0;
  *(void *)(v10 + 32) = v14;
  *(void *)(v10 + 40) = v9;
  uint64_t v11 = sub_10005E460();
  swift_bridgeObjectRelease();
  return v11;
}

uint64_t sub_10002FE68(uint64_t a1)
{
  return sub_10002E064(a1, (uint64_t)&unk_10006FB80, (void (*)(void))sub_10000DAA8, (void (*)(uint64_t))sub_10000CFE0);
}

uint64_t sub_10002FEB4(uint64_t a1)
{
  uint64_t v24 = a1;
  uint64_t v26 = sub_100005268(&qword_100082110);
  uint64_t v28 = *(void *)(v26 - 8);
  __chkstk_darwin(v26);
  uint64_t v2 = (char *)&v17 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = sub_10005E450();
  uint64_t v3 = *(void *)(v27 - 8);
  __chkstk_darwin(v27);
  uint64_t v5 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100005268(&qword_100082118);
  uint64_t v7 = __chkstk_darwin(v6);
  __chkstk_darwin(v7);
  sub_10003C7B4();
  sub_10005E510();
  v29._countAndFlagsBits = 0x206E65704FLL;
  v29._object = (void *)0xE500000000000000;
  sub_10005E500(v29);
  swift_getKeyPath();
  uint64_t v23 = sub_10003D288(&qword_100082108, (void (*)(uint64_t))type metadata accessor for SiriAppAccessForAppEntity);
  sub_10005E440();
  swift_release();
  sub_10005E4F0();
  swift_release();
  v30._countAndFlagsBits = 0x20726F6620;
  v30._object = (void *)0xE500000000000000;
  sub_10005E500(v30);
  unsigned int v22 = enum case for _AssistantIntent.PhraseToken.applicationName(_:);
  uint64_t v21 = *(void (**)(char *))(v3 + 104);
  uint64_t v8 = v27;
  v21(v5);
  sub_10005E4E0();
  uint64_t v9 = *(void (**)(char *, uint64_t))(v3 + 8);
  uint64_t v19 = v3 + 8;
  Swift::String v20 = v9;
  v9(v5, v8);
  v31._countAndFlagsBits = 0;
  v31._object = (void *)0xE000000000000000;
  sub_10005E500(v31);
  sub_10005E520();
  uint64_t v25 = sub_10005E470();
  uint64_t v10 = *(void (**)(char *, uint64_t))(v28 + 8);
  v28 += 8;
  Swift::String v18 = v10;
  uint64_t v11 = v26;
  v10(v2, v26);
  sub_10005E510();
  v32._countAndFlagsBits = 0x206E65704FLL;
  v32._object = (void *)0xE500000000000000;
  sub_10005E500(v32);
  swift_getKeyPath();
  sub_10005E440();
  swift_release();
  sub_10005E4F0();
  swift_release();
  v33._countAndFlagsBits = 0x20726F6620;
  v33._object = (void *)0xE500000000000000;
  sub_10005E500(v33);
  uint64_t v12 = v27;
  ((void (*)(char *, void, uint64_t))v21)(v5, v22, v27);
  sub_10005E4E0();
  v20(v5, v12);
  v34._countAndFlagsBits = 0x676E697474655320;
  v34._object = (void *)0xE900000000000073;
  sub_10005E500(v34);
  sub_10005E520();
  uint64_t v13 = sub_10005E470();
  v18(v2, v11);
  sub_100005268(&qword_100082120);
  uint64_t v14 = swift_allocObject();
  *(_OWORD *)(v14 + 16) = xmmword_10006F6F0;
  *(void *)(v14 + 32) = v25;
  *(void *)(v14 + 40) = v13;
  uint64_t v15 = sub_10005E460();
  swift_bridgeObjectRelease();
  return v15;
}

uint64_t sub_100030384()
{
  uint64_t v0 = sub_10005E4D0();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  sub_10003D288(&qword_100082108, (void (*)(uint64_t))type metadata accessor for SiriAppAccessForAppEntity);
  sub_10005E440();
  swift_release();
  sub_10003C7B4();
  sub_10005E4C0();
  uint64_t v4 = sub_10005E4B0();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  sub_100005268(&qword_100081EA0);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_10006EC10;
  *(void *)(v5 + 32) = v4;
  uint64_t v6 = sub_10005E4A0();
  swift_bridgeObjectRelease();
  return v6;
}

uint64_t sub_10003051C()
{
  uint64_t v0 = sub_10005E490();
  uint64_t v1 = sub_10005E490();
  uint64_t v2 = sub_10005E490();
  sub_100005268(&qword_100081EA8);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_10006C7B0;
  *(void *)(v3 + 32) = v0;
  *(void *)(v3 + 40) = v1;
  *(void *)(v3 + 48) = v2;
  uint64_t v4 = sub_10005E480();
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_1000305F4(uint64_t a1)
{
  uint64_t v13 = a1;
  uint64_t v1 = sub_100005268(&qword_1000820F0);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v15 = v1;
  uint64_t v16 = v2;
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)&v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100005268(&qword_1000820F8);
  uint64_t v6 = __chkstk_darwin(v5);
  __chkstk_darwin(v6);
  sub_10003C808();
  sub_10005E510();
  v17._countAndFlagsBits = 0x206E65704FLL;
  v17._object = (void *)0xE500000000000000;
  sub_10005E500(v17);
  swift_getKeyPath();
  sub_10003CF80();
  sub_10005E440();
  swift_release();
  sub_10005E4F0();
  swift_release();
  v18._countAndFlagsBits = 0;
  v18._object = (void *)0xE000000000000000;
  sub_10005E500(v18);
  sub_10005E520();
  uint64_t v14 = sub_10005E470();
  uint64_t v7 = v15;
  uint64_t v8 = *(void (**)(char *, uint64_t))(v16 + 8);
  v16 += 8;
  v8(v4, v15);
  sub_10005E510();
  v19._countAndFlagsBits = 0x206E65704FLL;
  v19._object = (void *)0xE500000000000000;
  sub_10005E500(v19);
  swift_getKeyPath();
  sub_10005E440();
  swift_release();
  sub_10005E4F0();
  swift_release();
  v20._countAndFlagsBits = 0x676E697474655320;
  v20._object = (void *)0xE900000000000073;
  sub_10005E500(v20);
  sub_10005E520();
  uint64_t v9 = sub_10005E470();
  v8(v4, v7);
  sub_100005268(&qword_100082100);
  uint64_t v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_10006F6F0;
  *(void *)(v10 + 32) = v14;
  *(void *)(v10 + 40) = v9;
  uint64_t v11 = sub_10005E460();
  swift_bridgeObjectRelease();
  return v11;
}

uint64_t sub_10003093C()
{
  return swift_release();
}

uint64_t sub_1000309C0(uint64_t a1)
{
  return sub_10002E064(a1, (uint64_t)&unk_10006FB30, (void (*)(void))sub_10003CF80, (void (*)(uint64_t))sub_10003C808);
}

uint64_t sub_100030A08()
{
  return sub_10003B308();
}

uint64_t sub_100030A44(uint64_t a1)
{
  uint64_t v13 = a1;
  uint64_t v1 = sub_100005268(&qword_1000820D0);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v15 = v1;
  uint64_t v16 = v2;
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)&v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100005268(&qword_1000820D8);
  uint64_t v6 = __chkstk_darwin(v5);
  __chkstk_darwin(v6);
  sub_10000A0DC();
  sub_10005E510();
  v17._countAndFlagsBits = 0x206E65704FLL;
  v17._object = (void *)0xE500000000000000;
  sub_10005E500(v17);
  swift_getKeyPath();
  sub_10003D288(&qword_100080C00, (void (*)(uint64_t))type metadata accessor for AlwaysPrintSiriResponseEntity);
  sub_10005E440();
  swift_release();
  sub_10005E4F0();
  swift_release();
  v18._countAndFlagsBits = 0;
  v18._object = (void *)0xE000000000000000;
  sub_10005E500(v18);
  sub_10005E520();
  uint64_t v14 = sub_10005E470();
  uint64_t v7 = v15;
  uint64_t v8 = *(void (**)(char *, uint64_t))(v16 + 8);
  v16 += 8;
  v8(v4, v15);
  sub_10005E510();
  v19._countAndFlagsBits = 0x206E65704FLL;
  v19._object = (void *)0xE500000000000000;
  sub_10005E500(v19);
  swift_getKeyPath();
  sub_10005E440();
  swift_release();
  sub_10005E4F0();
  swift_release();
  v20._countAndFlagsBits = 0x676E697474655320;
  v20._object = (void *)0xE900000000000073;
  sub_10005E500(v20);
  sub_10005E520();
  uint64_t v9 = sub_10005E470();
  v8(v4, v7);
  sub_100005268(&qword_1000820E0);
  uint64_t v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_10006F6F0;
  *(void *)(v10 + 32) = v14;
  *(void *)(v10 + 40) = v9;
  uint64_t v11 = sub_10005E460();
  swift_bridgeObjectRelease();
  return v11;
}

uint64_t sub_100030DBC()
{
  uint64_t v0 = sub_10005E4D0();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  sub_10003D288(&qword_100080C00, (void (*)(uint64_t))type metadata accessor for AlwaysPrintSiriResponseEntity);
  sub_10005E440();
  swift_release();
  sub_10000A0DC();
  sub_10005E4C0();
  uint64_t v4 = sub_10005E4B0();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  sub_100005268(&qword_100081EA0);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_10006EC10;
  *(void *)(v5 + 32) = v4;
  uint64_t v6 = sub_10005E4A0();
  swift_bridgeObjectRelease();
  return v6;
}

uint64_t sub_100030F54()
{
  return sub_10003B308();
}

uint64_t sub_100030F8C(uint64_t a1)
{
  uint64_t v13 = a1;
  uint64_t v1 = sub_100005268(&qword_1000820B8);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v15 = v1;
  uint64_t v16 = v2;
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)&v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100005268(&qword_1000820C0);
  uint64_t v6 = __chkstk_darwin(v5);
  __chkstk_darwin(v6);
  sub_10003C85C();
  sub_10005E510();
  v17._countAndFlagsBits = 0x206E65704FLL;
  v17._object = (void *)0xE500000000000000;
  sub_10005E500(v17);
  swift_getKeyPath();
  sub_10003D288(&qword_1000820B0, (void (*)(uint64_t))type metadata accessor for SiriVoiceEntity);
  sub_10005E440();
  swift_release();
  sub_10005E4F0();
  swift_release();
  v18._countAndFlagsBits = 0;
  v18._object = (void *)0xE000000000000000;
  sub_10005E500(v18);
  sub_10005E520();
  uint64_t v14 = sub_10005E470();
  uint64_t v7 = v15;
  uint64_t v8 = *(void (**)(char *, uint64_t))(v16 + 8);
  v16 += 8;
  v8(v4, v15);
  sub_10005E510();
  v19._countAndFlagsBits = 0x206E65704FLL;
  v19._object = (void *)0xE500000000000000;
  sub_10005E500(v19);
  swift_getKeyPath();
  sub_10005E440();
  swift_release();
  sub_10005E4F0();
  swift_release();
  v20._countAndFlagsBits = 0x676E697474655320;
  v20._object = (void *)0xE900000000000073;
  sub_10005E500(v20);
  sub_10005E520();
  uint64_t v9 = sub_10005E470();
  v8(v4, v7);
  sub_100005268(&qword_1000820C8);
  uint64_t v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_10006F6F0;
  *(void *)(v10 + 32) = v14;
  *(void *)(v10 + 40) = v9;
  uint64_t v11 = sub_10005E460();
  swift_bridgeObjectRelease();
  return v11;
}

uint64_t sub_100031304()
{
  uint64_t v0 = sub_10005E4D0();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  sub_10003D288(&qword_1000820B0, (void (*)(uint64_t))type metadata accessor for SiriVoiceEntity);
  sub_10005E440();
  swift_release();
  sub_10003C85C();
  sub_10005E4C0();
  uint64_t v4 = sub_10005E4B0();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  sub_100005268(&qword_100081EA0);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_10006EC10;
  *(void *)(v5 + 32) = v4;
  uint64_t v6 = sub_10005E4A0();
  swift_bridgeObjectRelease();
  return v6;
}

uint64_t sub_10003149C()
{
  return sub_100032444();
}

uint64_t sub_1000314B8(uint64_t a1)
{
  uint64_t v13 = a1;
  uint64_t v1 = sub_100005268(&qword_100082098);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v15 = v1;
  uint64_t v16 = v2;
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)&v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100005268(&qword_1000820A0);
  uint64_t v6 = __chkstk_darwin(v5);
  __chkstk_darwin(v6);
  sub_10000E900();
  sub_10005E510();
  v17._countAndFlagsBits = 0x206E65704FLL;
  v17._object = (void *)0xE500000000000000;
  sub_10005E500(v17);
  swift_getKeyPath();
  sub_10003D288(&qword_100080EF0, (void (*)(uint64_t))type metadata accessor for SiriLanguageEntity);
  sub_10005E440();
  swift_release();
  sub_10005E4F0();
  swift_release();
  v18._countAndFlagsBits = 0;
  v18._object = (void *)0xE000000000000000;
  sub_10005E500(v18);
  sub_10005E520();
  uint64_t v14 = sub_10005E470();
  uint64_t v7 = v15;
  uint64_t v8 = *(void (**)(char *, uint64_t))(v16 + 8);
  v16 += 8;
  v8(v4, v15);
  sub_10005E510();
  v19._countAndFlagsBits = 0x206E65704FLL;
  v19._object = (void *)0xE500000000000000;
  sub_10005E500(v19);
  swift_getKeyPath();
  sub_10005E440();
  swift_release();
  sub_10005E4F0();
  swift_release();
  v20._countAndFlagsBits = 0x676E697474655320;
  v20._object = (void *)0xE900000000000073;
  sub_10005E500(v20);
  sub_10005E520();
  uint64_t v9 = sub_10005E470();
  v8(v4, v7);
  sub_100005268(&qword_1000820A8);
  uint64_t v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_10006F6F0;
  *(void *)(v10 + 32) = v14;
  *(void *)(v10 + 40) = v9;
  uint64_t v11 = sub_10005E460();
  swift_bridgeObjectRelease();
  return v11;
}

uint64_t sub_100031830()
{
  uint64_t v0 = sub_10005E4D0();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  sub_10003D288(&qword_100080EF0, (void (*)(uint64_t))type metadata accessor for SiriLanguageEntity);
  sub_10005E440();
  swift_release();
  sub_10000E900();
  sub_10005E4C0();
  uint64_t v4 = sub_10005E4B0();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  sub_100005268(&qword_100081EA0);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_10006EC10;
  *(void *)(v5 + 32) = v4;
  uint64_t v6 = sub_10005E4A0();
  swift_bridgeObjectRelease();
  return v6;
}

uint64_t sub_1000319C8()
{
  return sub_100032444();
}

uint64_t sub_1000319EC(uint64_t a1)
{
  uint64_t v13 = a1;
  uint64_t v1 = sub_100005268(&qword_100082080);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v15 = v1;
  uint64_t v16 = v2;
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)&v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100005268(&qword_100082088);
  uint64_t v6 = __chkstk_darwin(v5);
  __chkstk_darwin(v6);
  sub_1000106E0();
  sub_10005E510();
  v17._countAndFlagsBits = 0x206E65704FLL;
  v17._object = (void *)0xE500000000000000;
  sub_10005E500(v17);
  swift_getKeyPath();
  sub_10003D288(&qword_1000810C0, (void (*)(uint64_t))type metadata accessor for SiriAndDictationHistoryEntity);
  sub_10005E440();
  swift_release();
  sub_10005E4F0();
  swift_release();
  v18._countAndFlagsBits = 0;
  v18._object = (void *)0xE000000000000000;
  sub_10005E500(v18);
  sub_10005E520();
  uint64_t v14 = sub_10005E470();
  uint64_t v7 = v15;
  uint64_t v8 = *(void (**)(char *, uint64_t))(v16 + 8);
  v16 += 8;
  v8(v4, v15);
  sub_10005E510();
  v19._countAndFlagsBits = 0x206E65704FLL;
  v19._object = (void *)0xE500000000000000;
  sub_10005E500(v19);
  swift_getKeyPath();
  sub_10005E440();
  swift_release();
  sub_10005E4F0();
  swift_release();
  v20._countAndFlagsBits = 0x676E697474655320;
  v20._object = (void *)0xE900000000000073;
  sub_10005E500(v20);
  sub_10005E520();
  uint64_t v9 = sub_10005E470();
  v8(v4, v7);
  sub_100005268(&qword_100082090);
  uint64_t v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_10006F6F0;
  *(void *)(v10 + 32) = v14;
  *(void *)(v10 + 40) = v9;
  uint64_t v11 = sub_10005E460();
  swift_bridgeObjectRelease();
  return v11;
}

uint64_t sub_100031D64()
{
  uint64_t v0 = sub_10005E4D0();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  sub_10003D288(&qword_1000810C0, (void (*)(uint64_t))type metadata accessor for SiriAndDictationHistoryEntity);
  sub_10005E440();
  swift_release();
  sub_1000106E0();
  sub_10005E4C0();
  uint64_t v4 = sub_10005E4B0();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  sub_100005268(&qword_100081EA0);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_10006EC10;
  *(void *)(v5 + 32) = v4;
  uint64_t v6 = sub_10005E4A0();
  swift_bridgeObjectRelease();
  return v6;
}

uint64_t sub_100031EFC()
{
  return sub_100032444();
}

uint64_t sub_100031F18(uint64_t a1)
{
  uint64_t v13 = a1;
  uint64_t v1 = sub_100005268(&qword_100082068);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v15 = v1;
  uint64_t v16 = v2;
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)&v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100005268(&qword_100082070);
  uint64_t v6 = __chkstk_darwin(v5);
  __chkstk_darwin(v6);
  sub_1000124C4();
  sub_10005E510();
  v17._countAndFlagsBits = 0x206E65704FLL;
  v17._object = (void *)0xE500000000000000;
  sub_10005E500(v17);
  swift_getKeyPath();
  sub_10003D288(&qword_1000812C0, (void (*)(uint64_t))type metadata accessor for AlwaysShowSpeechEntity);
  sub_10005E440();
  swift_release();
  sub_10005E4F0();
  swift_release();
  v18._countAndFlagsBits = 0;
  v18._object = (void *)0xE000000000000000;
  sub_10005E500(v18);
  sub_10005E520();
  uint64_t v14 = sub_10005E470();
  uint64_t v7 = v15;
  uint64_t v8 = *(void (**)(char *, uint64_t))(v16 + 8);
  v16 += 8;
  v8(v4, v15);
  sub_10005E510();
  v19._countAndFlagsBits = 0x206E65704FLL;
  v19._object = (void *)0xE500000000000000;
  sub_10005E500(v19);
  swift_getKeyPath();
  sub_10005E440();
  swift_release();
  sub_10005E4F0();
  swift_release();
  v20._countAndFlagsBits = 0x676E697474655320;
  v20._object = (void *)0xE900000000000073;
  sub_10005E500(v20);
  sub_10005E520();
  uint64_t v9 = sub_10005E470();
  v8(v4, v7);
  sub_100005268(&qword_100082078);
  uint64_t v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_10006F6F0;
  *(void *)(v10 + 32) = v14;
  *(void *)(v10 + 40) = v9;
  uint64_t v11 = sub_10005E460();
  swift_bridgeObjectRelease();
  return v11;
}

uint64_t sub_100032290()
{
  uint64_t v0 = sub_10005E4D0();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  sub_10003D288(&qword_1000812C0, (void (*)(uint64_t))type metadata accessor for AlwaysShowSpeechEntity);
  sub_10005E440();
  swift_release();
  sub_1000124C4();
  sub_10005E4C0();
  uint64_t v4 = sub_10005E4B0();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  sub_100005268(&qword_100081EA0);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_10006EC10;
  *(void *)(v5 + 32) = v4;
  uint64_t v6 = sub_10005E4A0();
  swift_bridgeObjectRelease();
  return v6;
}

uint64_t sub_100032428()
{
  return sub_100032444();
}

uint64_t sub_100032444()
{
  uint64_t v0 = sub_10005E490();
  sub_100005268(&qword_100081EA8);
  uint64_t v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_10006EC10;
  *(void *)(v1 + 32) = v0;
  uint64_t v2 = sub_10005E480();
  swift_bridgeObjectRelease();
  return v2;
}

uint64_t sub_1000324A8(uint64_t a1)
{
  v21[1] = a1;
  uint64_t v1 = sub_100005268(&qword_100082050);
  uint64_t v31 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v3 = (char *)v21 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100005268(&qword_100082058);
  uint64_t v5 = __chkstk_darwin(v4);
  uint64_t v27 = (char *)v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __chkstk_darwin(v5);
  uint64_t v24 = (char *)v21 - v8;
  __chkstk_darwin(v7);
  sub_10003C8B0();
  sub_10005E510();
  v32._countAndFlagsBits = 0xD00000000000001BLL;
  v32._object = (void *)0x80000001000623B0;
  sub_10005E500(v32);
  swift_getKeyPath();
  unint64_t v30 = sub_10003CDA4();
  sub_10005E440();
  swift_release();
  sub_10005E4F0();
  swift_release();
  v33._countAndFlagsBits = 0;
  v33._object = (void *)0xE000000000000000;
  sub_10005E500(v33);
  sub_10005E520();
  uint64_t v26 = sub_10005E470();
  uint64_t v9 = *(void (**)(uint64_t, uint64_t))(v31 + 8);
  v31 += 8;
  uint64_t v28 = v1;
  Swift::String v29 = v9;
  v9((uint64_t)v3, v1);
  sub_10005E510();
  v34._countAndFlagsBits = 0xD00000000000001ELL;
  v34._object = (void *)0x80000001000623D0;
  sub_10005E500(v34);
  swift_getKeyPath();
  sub_10005E440();
  swift_release();
  sub_10005E4F0();
  swift_release();
  v35._countAndFlagsBits = 0;
  v35._object = (void *)0xE000000000000000;
  sub_10005E500(v35);
  v21[0] = v3;
  sub_10005E520();
  uint64_t v25 = sub_10005E470();
  uint64_t v10 = v1;
  uint64_t v11 = v29;
  v29((uint64_t)v3, v10);
  sub_10005E510();
  v36._countAndFlagsBits = 0x206E727554;
  v36._object = (void *)0xE500000000000000;
  sub_10005E500(v36);
  swift_getKeyPath();
  sub_10005E440();
  swift_release();
  sub_10005E4F0();
  swift_release();
  v37._object = (void *)0x80000001000623F0;
  v37._countAndFlagsBits = 0xD000000000000014;
  sub_10005E500(v37);
  uint64_t v12 = v21[0];
  sub_10005E520();
  uint64_t v24 = (char *)sub_10005E470();
  uint64_t v13 = v28;
  v11(v12, v28);
  sub_10005E510();
  v38._countAndFlagsBits = 0xD000000000000016;
  v38._object = (void *)0x8000000100062410;
  sub_10005E500(v38);
  swift_getKeyPath();
  sub_10005E440();
  swift_release();
  sub_10005E4F0();
  swift_release();
  v39._countAndFlagsBits = 0;
  v39._object = (void *)0xE000000000000000;
  sub_10005E500(v39);
  sub_10005E520();
  uint64_t v23 = sub_10005E470();
  v29(v12, v13);
  sub_10005E510();
  v40._countAndFlagsBits = 0xD000000000000019;
  v40._object = (void *)0x8000000100062430;
  sub_10005E500(v40);
  swift_getKeyPath();
  sub_10005E440();
  swift_release();
  sub_10005E4F0();
  swift_release();
  v41._countAndFlagsBits = 0;
  v41._object = (void *)0xE000000000000000;
  sub_10005E500(v41);
  sub_10005E520();
  uint64_t v22 = sub_10005E470();
  uint64_t v14 = v29;
  v29(v12, v28);
  sub_10005E510();
  v42._countAndFlagsBits = 0x206E727554;
  v42._object = (void *)0xE500000000000000;
  sub_10005E500(v42);
  swift_getKeyPath();
  sub_10005E440();
  swift_release();
  sub_10005E4F0();
  swift_release();
  v43._countAndFlagsBits = 0x636E756F6E6E4120;
  v43._object = (void *)0xEF736C6C61432065;
  sub_10005E500(v43);
  sub_10005E520();
  uint64_t v15 = sub_10005E470();
  v14(v12, v28);
  sub_100005268(&qword_100082060);
  uint64_t v16 = swift_allocObject();
  *(_OWORD *)(v16 + 16) = xmmword_10006F710;
  uint64_t v17 = v25;
  *(void *)(v16 + 32) = v26;
  *(void *)(v16 + 40) = v17;
  uint64_t v18 = v23;
  *(void *)(v16 + 48) = v24;
  *(void *)(v16 + 56) = v18;
  *(void *)(v16 + 64) = v22;
  *(void *)(v16 + 72) = v15;
  uint64_t v19 = sub_10005E460();
  swift_bridgeObjectRelease();
  return v19;
}

uint64_t sub_100032BC8(uint64_t a1)
{
  return sub_10002E064(a1, (uint64_t)&unk_10006FA40, (void (*)(void))sub_10003CDA4, (void (*)(uint64_t))sub_10003C8B0);
}

uint64_t sub_100032C10()
{
  uint64_t v0 = sub_10005E490();
  uint64_t v1 = sub_10005E490();
  uint64_t v2 = sub_10005E490();
  uint64_t v3 = sub_10005E490();
  sub_100005268(&qword_100081EA8);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_10006F700;
  *(void *)(v4 + 32) = v0;
  *(void *)(v4 + 40) = v1;
  *(void *)(v4 + 48) = v2;
  *(void *)(v4 + 56) = v3;
  uint64_t v5 = sub_10005E480();
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_100032CF8(uint64_t a1)
{
  uint64_t v2 = sub_100005268(&qword_100082030);
  uint64_t v32 = v2;
  uint64_t v34 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v4 = (char *)&v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100005268(&qword_100082038);
  uint64_t v6 = __chkstk_darwin(v5);
  Swift::String v29 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v26 = (char *)&v23 - v9;
  __chkstk_darwin(v8);
  sub_10001F080();
  sub_10005E510();
  v35._countAndFlagsBits = 0xD00000000000001DLL;
  v35._object = (void *)0x80000001000622C0;
  sub_10005E500(v35);
  swift_getKeyPath();
  unint64_t v33 = sub_10003CC54();
  uint64_t v31 = a1;
  sub_10005E440();
  swift_release();
  sub_10005E4F0();
  swift_release();
  v36._countAndFlagsBits = 0;
  v36._object = (void *)0xE000000000000000;
  sub_10005E500(v36);
  sub_10005E520();
  uint64_t v28 = sub_10005E470();
  uint64_t v10 = v34 + 8;
  unint64_t v30 = *(void (**)(char *, uint64_t))(v34 + 8);
  v30(v4, v2);
  uint64_t v34 = v10;
  sub_10005E510();
  v37._countAndFlagsBits = 0xD000000000000020;
  v37._object = (void *)0x80000001000622E0;
  sub_10005E500(v37);
  swift_getKeyPath();
  sub_10005E440();
  swift_release();
  sub_10005E4F0();
  swift_release();
  v38._countAndFlagsBits = 0;
  v38._object = (void *)0xE000000000000000;
  sub_10005E500(v38);
  uint64_t v23 = v4;
  sub_10005E520();
  uint64_t v27 = sub_10005E470();
  uint64_t v11 = v30;
  v30(v4, v32);
  sub_10005E510();
  v39._countAndFlagsBits = 0x206E727554;
  v39._object = (void *)0xE500000000000000;
  sub_10005E500(v39);
  swift_getKeyPath();
  sub_10005E440();
  swift_release();
  sub_10005E4F0();
  swift_release();
  v40._object = (void *)0x8000000100062310;
  v40._countAndFlagsBits = 0xD000000000000016;
  sub_10005E500(v40);
  uint64_t v12 = v23;
  sub_10005E520();
  uint64_t v26 = (char *)sub_10005E470();
  uint64_t v13 = v12;
  uint64_t v14 = v32;
  v11(v12, v32);
  sub_10005E510();
  v41._countAndFlagsBits = 0xD000000000000022;
  v41._object = (void *)0x8000000100062330;
  sub_10005E500(v41);
  swift_getKeyPath();
  sub_10005E440();
  swift_release();
  sub_10005E4F0();
  swift_release();
  v42._countAndFlagsBits = 0;
  v42._object = (void *)0xE000000000000000;
  sub_10005E500(v42);
  sub_10005E520();
  uint64_t v25 = sub_10005E470();
  uint64_t v15 = v30;
  v30(v12, v14);
  sub_10005E510();
  v43._countAndFlagsBits = 0xD000000000000025;
  v43._object = (void *)0x8000000100062360;
  sub_10005E500(v43);
  swift_getKeyPath();
  sub_10005E440();
  swift_release();
  sub_10005E4F0();
  swift_release();
  v44._countAndFlagsBits = 0;
  v44._object = (void *)0xE000000000000000;
  sub_10005E500(v44);
  sub_10005E520();
  uint64_t v24 = sub_10005E470();
  uint64_t v16 = v32;
  v15(v12, v32);
  sub_10005E510();
  v45._countAndFlagsBits = 0x206E727554;
  v45._object = (void *)0xE500000000000000;
  sub_10005E500(v45);
  swift_getKeyPath();
  sub_10005E440();
  swift_release();
  sub_10005E4F0();
  swift_release();
  v46._countAndFlagsBits = 0xD00000000000001BLL;
  v46._object = (void *)0x8000000100062390;
  sub_10005E500(v46);
  sub_10005E520();
  uint64_t v17 = sub_10005E470();
  v15(v13, v16);
  sub_100005268(&qword_100082040);
  uint64_t v18 = swift_allocObject();
  *(_OWORD *)(v18 + 16) = xmmword_10006F710;
  uint64_t v19 = v27;
  *(void *)(v18 + 32) = v28;
  *(void *)(v18 + 40) = v19;
  uint64_t v20 = v25;
  *(void *)(v18 + 48) = v26;
  *(void *)(v18 + 56) = v20;
  *(void *)(v18 + 64) = v24;
  *(void *)(v18 + 72) = v17;
  uint64_t v21 = sub_10005E460();
  swift_bridgeObjectRelease();
  return v21;
}

uint64_t sub_100033424(uint64_t a1)
{
  return sub_10002E064(a1, (uint64_t)&unk_10006FA18, (void (*)(void))sub_10003CC54, (void (*)(uint64_t))sub_10001F080);
}

uint64_t sub_10003346C()
{
  return sub_10003B308();
}

uint64_t sub_100033484(uint64_t a1)
{
  uint64_t v50 = a1;
  uint64_t v1 = sub_100005268(&qword_100082018);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v61 = v1;
  uint64_t v62 = v2;
  __chkstk_darwin(v1);
  Swift::String v53 = (char *)&v42 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_10005E450();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v42 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100005268(&qword_100082020);
  uint64_t v9 = __chkstk_darwin(v8);
  Swift::String v48 = (char *)&v42 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __chkstk_darwin(v9);
  Swift::String v46 = (char *)&v42 - v12;
  uint64_t v13 = __chkstk_darwin(v11);
  Swift::String v44 = (char *)&v42 - v14;
  uint64_t v15 = __chkstk_darwin(v13);
  Swift::String v43 = (char *)&v42 - v16;
  uint64_t v17 = __chkstk_darwin(v15);
  __chkstk_darwin(v17);
  unint64_t v18 = sub_10003C904();
  sub_10005E510();
  v63._countAndFlagsBits = 0xD00000000000001ELL;
  v63._object = (void *)0x80000001000621E0;
  sub_10005E500(v63);
  unsigned int v55 = enum case for _AssistantIntent.PhraseToken.applicationName(_:);
  uint64_t v19 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 104);
  uint64_t v58 = v5 + 104;
  v59 = v19;
  uint64_t v60 = v4;
  ((void (*)(char *))v19)(v7);
  sub_10005E4E0();
  Swift::String v57 = *(void (**)(char *, uint64_t))(v5 + 8);
  v57(v7, v4);
  uint64_t v52 = v5 + 8;
  v64._countAndFlagsBits = 544175136;
  v64._object = (void *)0xE400000000000000;
  sub_10005E500(v64);
  swift_getKeyPath();
  unint64_t v54 = sub_10003CC54();
  sub_10005E440();
  swift_release();
  sub_10005E4F0();
  swift_release();
  v65._countAndFlagsBits = 0;
  v65._object = (void *)0xE000000000000000;
  sub_10005E500(v65);
  uint64_t v20 = v53;
  sub_10005E520();
  uint64_t v47 = sub_10005E470();
  Swift::String v56 = *(void (**)(char *, uint64_t))(v62 + 8);
  v62 += 8;
  v56(v20, v61);
  sub_10005E510();
  v66._countAndFlagsBits = 0xD000000000000021;
  v66._object = (void *)0x8000000100062200;
  sub_10005E500(v66);
  uint64_t v21 = v60;
  v59(v7, v55, v60);
  sub_10005E4E0();
  v57(v7, v21);
  v67._countAndFlagsBits = 544175136;
  v67._object = (void *)0xE400000000000000;
  sub_10005E500(v67);
  swift_getKeyPath();
  sub_10005E440();
  swift_release();
  sub_10005E4F0();
  swift_release();
  v68._countAndFlagsBits = 0;
  v68._object = (void *)0xE000000000000000;
  sub_10005E500(v68);
  uint64_t v22 = v53;
  sub_10005E520();
  unint64_t v49 = v18;
  uint64_t v45 = sub_10005E470();
  v56(v22, v61);
  sub_10005E510();
  v69._countAndFlagsBits = 0x206E727554;
  v69._object = (void *)0xE500000000000000;
  sub_10005E500(v69);
  swift_getKeyPath();
  sub_10005E440();
  swift_release();
  sub_10005E4F0();
  swift_release();
  v70._object = (void *)0x8000000100062230;
  v70._countAndFlagsBits = 0xD00000000000001BLL;
  sub_10005E500(v70);
  Swift::String v51 = v7;
  uint64_t v23 = v55;
  uint64_t v24 = v59;
  uint64_t v25 = v60;
  v59(v7, v55, v60);
  sub_10005E4E0();
  uint64_t v26 = v57;
  v57(v7, v25);
  v71._countAndFlagsBits = 0;
  v71._object = (void *)0xE000000000000000;
  sub_10005E500(v71);
  sub_10005E520();
  Swift::String v43 = (char *)sub_10005E470();
  v56(v22, v61);
  sub_10005E510();
  v72._countAndFlagsBits = 0xD00000000000001FLL;
  v72._object = (void *)0x8000000100062250;
  sub_10005E500(v72);
  uint64_t v27 = v51;
  uint64_t v28 = v60;
  v24(v51, v23, v60);
  sub_10005E4E0();
  v26(v27, v28);
  v73._countAndFlagsBits = 544175136;
  v73._object = (void *)0xE400000000000000;
  sub_10005E500(v73);
  swift_getKeyPath();
  sub_10005E440();
  swift_release();
  sub_10005E4F0();
  swift_release();
  v74._countAndFlagsBits = 0;
  v74._object = (void *)0xE000000000000000;
  sub_10005E500(v74);
  Swift::String v29 = v53;
  sub_10005E520();
  Swift::String v44 = (char *)sub_10005E470();
  uint64_t v30 = v61;
  v56(v29, v61);
  sub_10005E510();
  v75._countAndFlagsBits = 0xD000000000000022;
  v75._object = (void *)0x8000000100062270;
  sub_10005E500(v75);
  uint64_t v31 = v51;
  uint64_t v32 = v60;
  v59(v51, v23, v60);
  sub_10005E4E0();
  v57(v31, v32);
  v76._countAndFlagsBits = 544175136;
  v76._object = (void *)0xE400000000000000;
  sub_10005E500(v76);
  swift_getKeyPath();
  sub_10005E440();
  swift_release();
  sub_10005E4F0();
  swift_release();
  v77._countAndFlagsBits = 0;
  v77._object = (void *)0xE000000000000000;
  sub_10005E500(v77);
  sub_10005E520();
  Swift::String v46 = (char *)sub_10005E470();
  unint64_t v33 = v56;
  v56(v29, v30);
  sub_10005E510();
  v78._countAndFlagsBits = 0x206E727554;
  v78._object = (void *)0xE500000000000000;
  sub_10005E500(v78);
  swift_getKeyPath();
  sub_10005E440();
  swift_release();
  sub_10005E4F0();
  swift_release();
  v79._countAndFlagsBits = 0xD00000000000001CLL;
  v79._object = (void *)0x80000001000622A0;
  sub_10005E500(v79);
  uint64_t v34 = v51;
  uint64_t v35 = v60;
  v59(v51, v55, v60);
  sub_10005E4E0();
  v57(v34, v35);
  v80._countAndFlagsBits = 0;
  v80._object = (void *)0xE000000000000000;
  sub_10005E500(v80);
  sub_10005E520();
  uint64_t v36 = sub_10005E470();
  v33(v29, v61);
  sub_100005268(&qword_100082028);
  uint64_t v37 = swift_allocObject();
  *(_OWORD *)(v37 + 16) = xmmword_10006F710;
  uint64_t v38 = v45;
  *(void *)(v37 + 32) = v47;
  *(void *)(v37 + 40) = v38;
  Swift::String v39 = v44;
  *(void *)(v37 + 48) = v43;
  *(void *)(v37 + 56) = v39;
  *(void *)(v37 + 64) = v46;
  *(void *)(v37 + 72) = v36;
  uint64_t v40 = sub_10005E460();
  swift_bridgeObjectRelease();
  return v40;
}

uint64_t sub_100033EF4(uint64_t a1)
{
  return sub_10002E064(a1, (uint64_t)&unk_10006F9F0, (void (*)(void))sub_10003CC54, (void (*)(uint64_t))sub_10003C904);
}

uint64_t sub_100033F3C(uint64_t a1)
{
  uint64_t v2 = sub_100005268(&qword_100082000);
  uint64_t v32 = v2;
  uint64_t v34 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v4 = (char *)&v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100005268(&qword_100082008);
  uint64_t v6 = __chkstk_darwin(v5);
  Swift::String v29 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v26 = (char *)&v23 - v9;
  __chkstk_darwin(v8);
  sub_10003C958();
  sub_10005E510();
  v35._countAndFlagsBits = 0xD000000000000023;
  v35._object = (void *)0x80000001000620D0;
  sub_10005E500(v35);
  swift_getKeyPath();
  unint64_t v33 = sub_10003CC54();
  uint64_t v31 = a1;
  sub_10005E440();
  swift_release();
  sub_10005E4F0();
  swift_release();
  v36._countAndFlagsBits = 0;
  v36._object = (void *)0xE000000000000000;
  sub_10005E500(v36);
  sub_10005E520();
  uint64_t v28 = sub_10005E470();
  uint64_t v10 = v34 + 8;
  uint64_t v30 = *(void (**)(char *, uint64_t))(v34 + 8);
  v30(v4, v2);
  uint64_t v34 = v10;
  sub_10005E510();
  v37._countAndFlagsBits = 0xD000000000000026;
  v37._object = (void *)0x8000000100062100;
  sub_10005E500(v37);
  swift_getKeyPath();
  sub_10005E440();
  swift_release();
  sub_10005E4F0();
  swift_release();
  v38._countAndFlagsBits = 0;
  v38._object = (void *)0xE000000000000000;
  sub_10005E500(v38);
  uint64_t v23 = v4;
  sub_10005E520();
  uint64_t v27 = sub_10005E470();
  uint64_t v11 = v30;
  v30(v4, v32);
  sub_10005E510();
  v39._countAndFlagsBits = 0x206E727554;
  v39._object = (void *)0xE500000000000000;
  sub_10005E500(v39);
  swift_getKeyPath();
  sub_10005E440();
  swift_release();
  sub_10005E4F0();
  swift_release();
  v40._object = (void *)0x8000000100062130;
  v40._countAndFlagsBits = 0xD00000000000001CLL;
  sub_10005E500(v40);
  uint64_t v12 = v23;
  sub_10005E520();
  uint64_t v26 = (char *)sub_10005E470();
  uint64_t v13 = v12;
  uint64_t v14 = v32;
  v11(v12, v32);
  sub_10005E510();
  v41._countAndFlagsBits = 0xD000000000000028;
  v41._object = (void *)0x8000000100062150;
  sub_10005E500(v41);
  swift_getKeyPath();
  sub_10005E440();
  swift_release();
  sub_10005E4F0();
  swift_release();
  v42._countAndFlagsBits = 0;
  v42._object = (void *)0xE000000000000000;
  sub_10005E500(v42);
  sub_10005E520();
  uint64_t v25 = sub_10005E470();
  uint64_t v15 = v30;
  v30(v12, v14);
  sub_10005E510();
  v43._countAndFlagsBits = 0xD00000000000002BLL;
  v43._object = (void *)0x8000000100062180;
  sub_10005E500(v43);
  swift_getKeyPath();
  sub_10005E440();
  swift_release();
  sub_10005E4F0();
  swift_release();
  v44._countAndFlagsBits = 0;
  v44._object = (void *)0xE000000000000000;
  sub_10005E500(v44);
  sub_10005E520();
  uint64_t v24 = sub_10005E470();
  uint64_t v16 = v32;
  v15(v12, v32);
  sub_10005E510();
  v45._countAndFlagsBits = 0x206E727554;
  v45._object = (void *)0xE500000000000000;
  sub_10005E500(v45);
  swift_getKeyPath();
  sub_10005E440();
  swift_release();
  sub_10005E4F0();
  swift_release();
  v46._countAndFlagsBits = 0xD000000000000021;
  v46._object = (void *)0x80000001000621B0;
  sub_10005E500(v46);
  sub_10005E520();
  uint64_t v17 = sub_10005E470();
  v15(v13, v16);
  sub_100005268(&qword_100082010);
  uint64_t v18 = swift_allocObject();
  *(_OWORD *)(v18 + 16) = xmmword_10006F710;
  uint64_t v19 = v27;
  *(void *)(v18 + 32) = v28;
  *(void *)(v18 + 40) = v19;
  uint64_t v20 = v25;
  *(void *)(v18 + 48) = v26;
  *(void *)(v18 + 56) = v20;
  *(void *)(v18 + 64) = v24;
  *(void *)(v18 + 72) = v17;
  uint64_t v21 = sub_10005E460();
  swift_bridgeObjectRelease();
  return v21;
}

uint64_t sub_100034668(uint64_t a1)
{
  return sub_10002E064(a1, (uint64_t)&unk_10006F9C8, (void (*)(void))sub_10003CC54, (void (*)(uint64_t))sub_10003C958);
}

uint64_t sub_1000346B0(uint64_t a1)
{
  uint64_t v2 = sub_100005268(&qword_100081FE8);
  uint64_t v32 = v2;
  uint64_t v34 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v4 = (char *)&v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100005268(&qword_100081FF0);
  uint64_t v6 = __chkstk_darwin(v5);
  Swift::String v29 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v26 = (char *)&v23 - v9;
  __chkstk_darwin(v8);
  sub_10003C9AC();
  sub_10005E510();
  v35._countAndFlagsBits = 0xD00000000000002FLL;
  v35._object = (void *)0x8000000100061F80;
  sub_10005E500(v35);
  swift_getKeyPath();
  unint64_t v33 = sub_10003CC54();
  uint64_t v31 = a1;
  sub_10005E440();
  swift_release();
  sub_10005E4F0();
  swift_release();
  v36._countAndFlagsBits = 0;
  v36._object = (void *)0xE000000000000000;
  sub_10005E500(v36);
  sub_10005E520();
  uint64_t v28 = sub_10005E470();
  uint64_t v10 = v34 + 8;
  uint64_t v30 = *(void (**)(char *, uint64_t))(v34 + 8);
  v30(v4, v2);
  uint64_t v34 = v10;
  sub_10005E510();
  v37._countAndFlagsBits = 0xD000000000000032;
  v37._object = (void *)0x8000000100061FB0;
  sub_10005E500(v37);
  swift_getKeyPath();
  sub_10005E440();
  swift_release();
  sub_10005E4F0();
  swift_release();
  v38._countAndFlagsBits = 0;
  v38._object = (void *)0xE000000000000000;
  sub_10005E500(v38);
  uint64_t v23 = v4;
  sub_10005E520();
  uint64_t v27 = sub_10005E470();
  uint64_t v11 = v30;
  v30(v4, v32);
  sub_10005E510();
  v39._countAndFlagsBits = 0x206E727554;
  v39._object = (void *)0xE500000000000000;
  sub_10005E500(v39);
  swift_getKeyPath();
  sub_10005E440();
  swift_release();
  sub_10005E4F0();
  swift_release();
  v40._object = (void *)0x8000000100061FF0;
  v40._countAndFlagsBits = 0xD000000000000028;
  sub_10005E500(v40);
  uint64_t v12 = v23;
  sub_10005E520();
  uint64_t v26 = (char *)sub_10005E470();
  uint64_t v13 = v12;
  uint64_t v14 = v32;
  v11(v12, v32);
  sub_10005E510();
  v41._countAndFlagsBits = 0xD000000000000034;
  v41._object = (void *)0x8000000100062020;
  sub_10005E500(v41);
  swift_getKeyPath();
  sub_10005E440();
  swift_release();
  sub_10005E4F0();
  swift_release();
  v42._countAndFlagsBits = 0;
  v42._object = (void *)0xE000000000000000;
  sub_10005E500(v42);
  sub_10005E520();
  uint64_t v25 = sub_10005E470();
  uint64_t v15 = v30;
  v30(v12, v14);
  sub_10005E510();
  v43._countAndFlagsBits = 0xD000000000000037;
  v43._object = (void *)0x8000000100062060;
  sub_10005E500(v43);
  swift_getKeyPath();
  sub_10005E440();
  swift_release();
  sub_10005E4F0();
  swift_release();
  v44._countAndFlagsBits = 0;
  v44._object = (void *)0xE000000000000000;
  sub_10005E500(v44);
  sub_10005E520();
  uint64_t v24 = sub_10005E470();
  uint64_t v16 = v32;
  v15(v12, v32);
  sub_10005E510();
  v45._countAndFlagsBits = 0x206E727554;
  v45._object = (void *)0xE500000000000000;
  sub_10005E500(v45);
  swift_getKeyPath();
  sub_10005E440();
  swift_release();
  sub_10005E4F0();
  swift_release();
  v46._countAndFlagsBits = 0xD00000000000002DLL;
  v46._object = (void *)0x80000001000620A0;
  sub_10005E500(v46);
  sub_10005E520();
  uint64_t v17 = sub_10005E470();
  v15(v13, v16);
  sub_100005268(&qword_100081FF8);
  uint64_t v18 = swift_allocObject();
  *(_OWORD *)(v18 + 16) = xmmword_10006F710;
  uint64_t v19 = v27;
  *(void *)(v18 + 32) = v28;
  *(void *)(v18 + 40) = v19;
  uint64_t v20 = v25;
  *(void *)(v18 + 48) = v26;
  *(void *)(v18 + 56) = v20;
  *(void *)(v18 + 64) = v24;
  *(void *)(v18 + 72) = v17;
  uint64_t v21 = sub_10005E460();
  swift_bridgeObjectRelease();
  return v21;
}

uint64_t sub_100034DE0(uint64_t a1)
{
  return sub_10002E064(a1, (uint64_t)&unk_10006F9A0, (void (*)(void))sub_10003CC54, (void (*)(uint64_t))sub_10003C9AC);
}

uint64_t sub_100034E28(uint64_t a1)
{
  uint64_t v2 = sub_100005268(&qword_100081FD0);
  uint64_t v32 = v2;
  uint64_t v34 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v4 = (char *)&v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100005268(&qword_100081FD8);
  uint64_t v6 = __chkstk_darwin(v5);
  Swift::String v29 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v26 = (char *)&v23 - v9;
  __chkstk_darwin(v8);
  sub_10003CA00();
  sub_10005E510();
  v35._countAndFlagsBits = 0xD000000000000031;
  v35._object = (void *)0x8000000100061E20;
  sub_10005E500(v35);
  swift_getKeyPath();
  unint64_t v33 = sub_10003CC54();
  uint64_t v31 = a1;
  sub_10005E440();
  swift_release();
  sub_10005E4F0();
  swift_release();
  v36._countAndFlagsBits = 0;
  v36._object = (void *)0xE000000000000000;
  sub_10005E500(v36);
  sub_10005E520();
  uint64_t v28 = sub_10005E470();
  uint64_t v10 = v34 + 8;
  uint64_t v30 = *(void (**)(char *, uint64_t))(v34 + 8);
  v30(v4, v2);
  uint64_t v34 = v10;
  sub_10005E510();
  v37._countAndFlagsBits = 0xD000000000000034;
  v37._object = (void *)0x8000000100061E60;
  sub_10005E500(v37);
  swift_getKeyPath();
  sub_10005E440();
  swift_release();
  sub_10005E4F0();
  swift_release();
  v38._countAndFlagsBits = 0;
  v38._object = (void *)0xE000000000000000;
  sub_10005E500(v38);
  uint64_t v23 = v4;
  sub_10005E520();
  uint64_t v27 = sub_10005E470();
  uint64_t v11 = v30;
  v30(v4, v32);
  sub_10005E510();
  v39._countAndFlagsBits = 0x206E727554;
  v39._object = (void *)0xE500000000000000;
  sub_10005E500(v39);
  swift_getKeyPath();
  sub_10005E440();
  swift_release();
  sub_10005E4F0();
  swift_release();
  v40._object = (void *)0x8000000100061EA0;
  v40._countAndFlagsBits = 0xD00000000000002ALL;
  sub_10005E500(v40);
  uint64_t v12 = v23;
  sub_10005E520();
  uint64_t v26 = (char *)sub_10005E470();
  uint64_t v13 = v12;
  uint64_t v14 = v32;
  v11(v12, v32);
  sub_10005E510();
  v41._countAndFlagsBits = 0xD000000000000036;
  v41._object = (void *)0x8000000100061ED0;
  sub_10005E500(v41);
  swift_getKeyPath();
  sub_10005E440();
  swift_release();
  sub_10005E4F0();
  swift_release();
  v42._countAndFlagsBits = 0;
  v42._object = (void *)0xE000000000000000;
  sub_10005E500(v42);
  sub_10005E520();
  uint64_t v25 = sub_10005E470();
  uint64_t v15 = v30;
  v30(v12, v14);
  sub_10005E510();
  v43._countAndFlagsBits = 0xD000000000000039;
  v43._object = (void *)0x8000000100061F10;
  sub_10005E500(v43);
  swift_getKeyPath();
  sub_10005E440();
  swift_release();
  sub_10005E4F0();
  swift_release();
  v44._countAndFlagsBits = 0;
  v44._object = (void *)0xE000000000000000;
  sub_10005E500(v44);
  sub_10005E520();
  uint64_t v24 = sub_10005E470();
  uint64_t v16 = v32;
  v15(v12, v32);
  sub_10005E510();
  v45._countAndFlagsBits = 0x206E727554;
  v45._object = (void *)0xE500000000000000;
  sub_10005E500(v45);
  swift_getKeyPath();
  sub_10005E440();
  swift_release();
  sub_10005E4F0();
  swift_release();
  v46._countAndFlagsBits = 0xD00000000000002FLL;
  v46._object = (void *)0x8000000100061F50;
  sub_10005E500(v46);
  sub_10005E520();
  uint64_t v17 = sub_10005E470();
  v15(v13, v16);
  sub_100005268(&qword_100081FE0);
  uint64_t v18 = swift_allocObject();
  *(_OWORD *)(v18 + 16) = xmmword_10006F710;
  uint64_t v19 = v27;
  *(void *)(v18 + 32) = v28;
  *(void *)(v18 + 40) = v19;
  uint64_t v20 = v25;
  *(void *)(v18 + 48) = v26;
  *(void *)(v18 + 56) = v20;
  *(void *)(v18 + 64) = v24;
  *(void *)(v18 + 72) = v17;
  uint64_t v21 = sub_10005E460();
  swift_bridgeObjectRelease();
  return v21;
}

uint64_t sub_100035558(uint64_t a1)
{
  return sub_10002E064(a1, (uint64_t)&unk_10006F978, (void (*)(void))sub_10003CC54, (void (*)(uint64_t))sub_10003CA00);
}

uint64_t sub_1000355A0(uint64_t a1)
{
  v21[1] = a1;
  uint64_t v1 = sub_100005268(&qword_100081FB8);
  uint64_t v31 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v3 = (char *)v21 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100005268(&qword_100081FC0);
  uint64_t v5 = __chkstk_darwin(v4);
  uint64_t v27 = (char *)v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __chkstk_darwin(v5);
  uint64_t v24 = (char *)v21 - v8;
  __chkstk_darwin(v7);
  sub_1000289B4();
  sub_10005E510();
  v32._countAndFlagsBits = 0xD000000000000014;
  v32._object = (void *)0x8000000100061D80;
  sub_10005E500(v32);
  swift_getKeyPath();
  unint64_t v30 = sub_10003CC54();
  sub_10005E440();
  swift_release();
  sub_10005E4F0();
  swift_release();
  v33._countAndFlagsBits = 0;
  v33._object = (void *)0xE000000000000000;
  sub_10005E500(v33);
  sub_10005E520();
  uint64_t v26 = sub_10005E470();
  uint64_t v9 = *(void (**)(uint64_t, uint64_t))(v31 + 8);
  v31 += 8;
  uint64_t v28 = v1;
  Swift::String v29 = v9;
  v9((uint64_t)v3, v1);
  sub_10005E510();
  v34._countAndFlagsBits = 0xD000000000000017;
  v34._object = (void *)0x8000000100061DA0;
  sub_10005E500(v34);
  swift_getKeyPath();
  sub_10005E440();
  swift_release();
  sub_10005E4F0();
  swift_release();
  v35._countAndFlagsBits = 0;
  v35._object = (void *)0xE000000000000000;
  sub_10005E500(v35);
  v21[0] = v3;
  sub_10005E520();
  uint64_t v25 = sub_10005E470();
  uint64_t v10 = v1;
  uint64_t v11 = v29;
  v29((uint64_t)v3, v10);
  sub_10005E510();
  v36._countAndFlagsBits = 0x206E727554;
  v36._object = (void *)0xE500000000000000;
  sub_10005E500(v36);
  swift_getKeyPath();
  sub_10005E440();
  swift_release();
  sub_10005E4F0();
  swift_release();
  v37._countAndFlagsBits = 0x6148206C6C614320;
  v37._object = (void *)0xED0000705520676ELL;
  sub_10005E500(v37);
  uint64_t v12 = v21[0];
  sub_10005E520();
  uint64_t v24 = (char *)sub_10005E470();
  uint64_t v13 = v28;
  v11(v12, v28);
  sub_10005E510();
  v38._countAndFlagsBits = 0xD000000000000019;
  v38._object = (void *)0x8000000100061DC0;
  sub_10005E500(v38);
  swift_getKeyPath();
  sub_10005E440();
  swift_release();
  sub_10005E4F0();
  swift_release();
  v39._countAndFlagsBits = 0;
  v39._object = (void *)0xE000000000000000;
  sub_10005E500(v39);
  sub_10005E520();
  uint64_t v23 = sub_10005E470();
  v29(v12, v13);
  sub_10005E510();
  v40._countAndFlagsBits = 0xD00000000000001CLL;
  v40._object = (void *)0x8000000100061DE0;
  sub_10005E500(v40);
  swift_getKeyPath();
  sub_10005E440();
  swift_release();
  sub_10005E4F0();
  swift_release();
  v41._countAndFlagsBits = 0;
  v41._object = (void *)0xE000000000000000;
  sub_10005E500(v41);
  sub_10005E520();
  uint64_t v22 = sub_10005E470();
  uint64_t v14 = v29;
  v29(v12, v28);
  sub_10005E510();
  v42._countAndFlagsBits = 0x206E727554;
  v42._object = (void *)0xE500000000000000;
  sub_10005E500(v42);
  swift_getKeyPath();
  sub_10005E440();
  swift_release();
  sub_10005E4F0();
  swift_release();
  v43._object = (void *)0x8000000100061E00;
  v43._countAndFlagsBits = 0xD000000000000012;
  sub_10005E500(v43);
  sub_10005E520();
  uint64_t v15 = sub_10005E470();
  v14(v12, v28);
  sub_100005268(&qword_100081FC8);
  uint64_t v16 = swift_allocObject();
  *(_OWORD *)(v16 + 16) = xmmword_10006F710;
  uint64_t v17 = v25;
  *(void *)(v16 + 32) = v26;
  *(void *)(v16 + 40) = v17;
  uint64_t v18 = v23;
  *(void *)(v16 + 48) = v24;
  *(void *)(v16 + 56) = v18;
  *(void *)(v16 + 64) = v22;
  *(void *)(v16 + 72) = v15;
  uint64_t v19 = sub_10005E460();
  swift_bridgeObjectRelease();
  return v19;
}

uint64_t sub_100035CC0(uint64_t a1)
{
  return sub_10002E064(a1, (uint64_t)&unk_10006F950, (void (*)(void))sub_10003CC54, (void (*)(uint64_t))sub_1000289B4);
}

uint64_t sub_100035D08()
{
  uint64_t v18 = sub_100005268(&qword_100081FA0);
  uint64_t v0 = *(void *)(v18 - 8);
  __chkstk_darwin(v18);
  uint64_t v2 = (char *)&v14 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100005268(&qword_100081FA8);
  uint64_t v4 = __chkstk_darwin(v3);
  uint64_t v16 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  sub_10001CB28();
  sub_10005E510();
  v20._object = (void *)0x8000000100061D40;
  v20._countAndFlagsBits = 0xD000000000000014;
  sub_10005E500(v20);
  swift_getKeyPath();
  unint64_t v19 = sub_10003CC54();
  sub_10005E440();
  swift_release();
  sub_10005E4F0();
  swift_release();
  v21._countAndFlagsBits = 0;
  v21._object = (void *)0xE000000000000000;
  sub_10005E500(v21);
  sub_10005E520();
  uint64_t v17 = sub_10005E470();
  uint64_t v14 = *(void (**)(char *, uint64_t))(v0 + 8);
  uint64_t v6 = v18;
  v14(v2, v18);
  sub_10005E510();
  v22._countAndFlagsBits = 0xD000000000000017;
  v22._object = (void *)0x8000000100061D60;
  sub_10005E500(v22);
  swift_getKeyPath();
  sub_10005E440();
  swift_release();
  sub_10005E4F0();
  swift_release();
  v23._countAndFlagsBits = 0;
  v23._object = (void *)0xE000000000000000;
  sub_10005E500(v23);
  sub_10005E520();
  uint64_t v15 = sub_10005E470();
  uint64_t v7 = v6;
  uint64_t v8 = v14;
  v14(v2, v7);
  sub_10005E510();
  v24._countAndFlagsBits = 0x206E727554;
  v24._object = (void *)0xE500000000000000;
  sub_10005E500(v24);
  swift_getKeyPath();
  sub_10005E440();
  swift_release();
  sub_10005E4F0();
  swift_release();
  v25._countAndFlagsBits = 0x6F54206B6C615420;
  v25._object = (void *)0xED00006972695320;
  sub_10005E500(v25);
  sub_10005E520();
  uint64_t v9 = sub_10005E470();
  v8(v2, v18);
  sub_100005268(&qword_100081FB0);
  uint64_t v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_10006C7B0;
  uint64_t v11 = v15;
  *(void *)(v10 + 32) = v17;
  *(void *)(v10 + 40) = v11;
  *(void *)(v10 + 48) = v9;
  uint64_t v12 = sub_10005E460();
  swift_bridgeObjectRelease();
  return v12;
}

uint64_t sub_100036148(uint64_t a1)
{
  return sub_10002E064(a1, (uint64_t)&unk_10006F928, (void (*)(void))sub_10003CC54, (void (*)(uint64_t))sub_10001CB28);
}

uint64_t sub_100036190(uint64_t a1)
{
  v11[1] = a1;
  uint64_t v13 = sub_100005268(&qword_100081F88);
  uint64_t v1 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  uint64_t v3 = (char *)v11 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100005268(&qword_100081F90);
  __chkstk_darwin(v4);
  sub_100016110();
  sub_10005E510();
  v14._object = (void *)0x8000000100061D00;
  v14._countAndFlagsBits = 0xD000000000000016;
  sub_10005E500(v14);
  swift_getKeyPath();
  sub_100018F88();
  sub_10005E440();
  swift_release();
  sub_10005E4F0();
  swift_release();
  v15._countAndFlagsBits = 0;
  v15._object = (void *)0xE000000000000000;
  sub_10005E500(v15);
  sub_10005E520();
  uint64_t v12 = sub_10005E470();
  uint64_t v5 = *(void (**)(char *, uint64_t))(v1 + 8);
  uint64_t v6 = v13;
  v5(v3, v13);
  sub_10005E510();
  v16._countAndFlagsBits = 0xD000000000000019;
  v16._object = (void *)0x8000000100061D20;
  sub_10005E500(v16);
  swift_getKeyPath();
  sub_10005E440();
  swift_release();
  sub_10005E4F0();
  swift_release();
  v17._countAndFlagsBits = 0;
  v17._object = (void *)0xE000000000000000;
  sub_10005E500(v17);
  sub_10005E520();
  uint64_t v7 = sub_10005E470();
  v5(v3, v6);
  sub_100005268(&qword_100081F98);
  uint64_t v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_10006F6F0;
  *(void *)(v8 + 32) = v12;
  *(void *)(v8 + 40) = v7;
  uint64_t v9 = sub_10005E460();
  swift_bridgeObjectRelease();
  return v9;
}

uint64_t sub_1000364B8(uint64_t a1)
{
  return sub_10002E064(a1, (uint64_t)&unk_10006F900, (void (*)(void))sub_100018F88, (void (*)(uint64_t))sub_100016110);
}

uint64_t sub_100036500()
{
  uint64_t v0 = sub_10005E490();
  uint64_t v1 = sub_10005E490();
  uint64_t v2 = sub_10005E490();
  sub_100005268(&qword_100081EA8);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_10006C7B0;
  *(void *)(v3 + 32) = v0;
  *(void *)(v3 + 40) = v1;
  *(void *)(v3 + 48) = v2;
  uint64_t v4 = sub_10005E480();
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_1000365C8(uint64_t a1)
{
  uint64_t v32 = sub_100005268(&qword_100081F70);
  uint64_t v38 = *(void *)(v32 - 8);
  __chkstk_darwin(v32);
  uint64_t v3 = (char *)v24 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_10005E450();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100005268(&qword_100081F78);
  uint64_t v9 = __chkstk_darwin(v8);
  Swift::String v29 = (char *)v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __chkstk_darwin(v9);
  __chkstk_darwin(v11);
  sub_10003CA54();
  sub_10005E510();
  v39._countAndFlagsBits = 0xD000000000000016;
  v39._object = (void *)0x8000000100061C60;
  sub_10005E500(v39);
  unsigned int v35 = enum case for _AssistantIntent.PhraseToken.applicationName(_:);
  uint64_t v12 = *(void (**)(void))(v5 + 104);
  uint64_t v36 = v5 + 104;
  Swift::String v37 = (void (*)(char *, void, uint64_t))v12;
  uint64_t v30 = v4;
  v12(v7);
  sub_10005E4E0();
  uint64_t v13 = *(void (**)(char *, uint64_t))(v5 + 8);
  uint64_t v33 = v5 + 8;
  Swift::String v34 = v13;
  v13(v7, v4);
  v40._countAndFlagsBits = 544175136;
  v40._object = (void *)0xE400000000000000;
  sub_10005E500(v40);
  swift_getKeyPath();
  unint64_t v26 = sub_10003CC54();
  v24[1] = a1;
  sub_10005E440();
  swift_release();
  sub_10005E4F0();
  swift_release();
  v41._countAndFlagsBits = 0;
  v41._object = (void *)0xE000000000000000;
  sub_10005E500(v41);
  Swift::String v25 = v3;
  sub_10005E520();
  uint64_t v28 = sub_10005E470();
  Swift::String v14 = *(void (**)(char *, uint64_t))(v38 + 8);
  v38 += 8;
  uint64_t v31 = v14;
  uint64_t v15 = v32;
  v14(v3, v32);
  sub_10005E510();
  v42._countAndFlagsBits = 0xD000000000000019;
  v42._object = (void *)0x8000000100061C80;
  sub_10005E500(v42);
  uint64_t v16 = v30;
  v37(v7, v35, v30);
  sub_10005E4E0();
  v34(v7, v16);
  v43._countAndFlagsBits = 544175136;
  v43._object = (void *)0xE400000000000000;
  sub_10005E500(v43);
  swift_getKeyPath();
  sub_10005E440();
  swift_release();
  sub_10005E4F0();
  swift_release();
  v44._countAndFlagsBits = 0;
  v44._object = (void *)0xE000000000000000;
  sub_10005E500(v44);
  Swift::String v17 = v25;
  sub_10005E520();
  uint64_t v27 = sub_10005E470();
  v31(v17, v15);
  sub_10005E510();
  v45._countAndFlagsBits = 0x206E727554;
  v45._object = (void *)0xE500000000000000;
  sub_10005E500(v45);
  swift_getKeyPath();
  sub_10005E440();
  swift_release();
  sub_10005E4F0();
  swift_release();
  v46._object = (void *)0x8000000100061CA0;
  v46._countAndFlagsBits = 0xD000000000000013;
  sub_10005E500(v46);
  uint64_t v18 = v30;
  v37(v7, v35, v30);
  sub_10005E4E0();
  v34(v7, v18);
  v47._countAndFlagsBits = 0;
  v47._object = (void *)0xE000000000000000;
  sub_10005E500(v47);
  sub_10005E520();
  uint64_t v19 = sub_10005E470();
  v31(v17, v32);
  sub_100005268(&qword_100081F80);
  uint64_t v20 = swift_allocObject();
  *(_OWORD *)(v20 + 16) = xmmword_10006C7B0;
  uint64_t v21 = v27;
  *(void *)(v20 + 32) = v28;
  *(void *)(v20 + 40) = v21;
  *(void *)(v20 + 48) = v19;
  uint64_t v22 = sub_10005E460();
  swift_bridgeObjectRelease();
  return v22;
}

uint64_t sub_100036BD0(uint64_t a1)
{
  return sub_10002E064(a1, (uint64_t)&unk_10006F8D8, (void (*)(void))sub_10003CC54, (void (*)(uint64_t))sub_10003CA54);
}

uint64_t sub_100036C18(uint64_t a1)
{
  uint64_t v50 = a1;
  uint64_t v1 = sub_100005268(&qword_100081F58);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v61 = v1;
  uint64_t v62 = v2;
  __chkstk_darwin(v1);
  unint64_t v54 = (char *)v43 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_10005E450();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)v43 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100005268(&qword_100081F60);
  uint64_t v9 = __chkstk_darwin(v8);
  unint64_t v49 = (char *)v43 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __chkstk_darwin(v9);
  Swift::String v47 = (char *)v43 - v12;
  uint64_t v13 = __chkstk_darwin(v11);
  Swift::String v45 = (char *)v43 - v14;
  uint64_t v15 = __chkstk_darwin(v13);
  Swift::String v44 = (char *)v43 - v16;
  uint64_t v17 = __chkstk_darwin(v15);
  __chkstk_darwin(v17);
  unint64_t v18 = sub_10003CAA8();
  sub_10005E510();
  v63._countAndFlagsBits = 0xD00000000000002DLL;
  v63._object = (void *)0x8000000100061B30;
  sub_10005E500(v63);
  unsigned int v55 = enum case for _AssistantIntent.PhraseToken.applicationName(_:);
  uint64_t v19 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 104);
  uint64_t v58 = v5 + 104;
  v59 = v19;
  uint64_t v60 = v4;
  ((void (*)(char *))v19)(v7);
  sub_10005E4E0();
  Swift::String v57 = *(void (**)(char *, uint64_t))(v5 + 8);
  v57(v7, v4);
  uint64_t v53 = v5 + 8;
  v64._countAndFlagsBits = 544175136;
  v64._object = (void *)0xE400000000000000;
  sub_10005E500(v64);
  swift_getKeyPath();
  unint64_t v52 = sub_10003CC54();
  sub_10005E440();
  swift_release();
  sub_10005E4F0();
  swift_release();
  v65._countAndFlagsBits = 0;
  v65._object = (void *)0xE000000000000000;
  sub_10005E500(v65);
  uint64_t v20 = v54;
  sub_10005E520();
  uint64_t v48 = sub_10005E470();
  Swift::String v56 = *(void (**)(char *, uint64_t))(v62 + 8);
  v62 += 8;
  v56(v20, v61);
  sub_10005E510();
  v66._countAndFlagsBits = 0xD000000000000030;
  v66._object = (void *)0x8000000100061B60;
  sub_10005E500(v66);
  uint64_t v21 = v60;
  v59(v7, v55, v60);
  sub_10005E4E0();
  v57(v7, v21);
  v67._countAndFlagsBits = 544175136;
  v67._object = (void *)0xE400000000000000;
  sub_10005E500(v67);
  swift_getKeyPath();
  sub_10005E440();
  swift_release();
  sub_10005E4F0();
  swift_release();
  v68._countAndFlagsBits = 0;
  v68._object = (void *)0xE000000000000000;
  sub_10005E500(v68);
  uint64_t v22 = v54;
  sub_10005E520();
  v43[1] = v18;
  uint64_t v46 = sub_10005E470();
  v56(v22, v61);
  sub_10005E510();
  v69._countAndFlagsBits = 0x206E727554;
  v69._object = (void *)0xE500000000000000;
  sub_10005E500(v69);
  swift_getKeyPath();
  sub_10005E440();
  swift_release();
  sub_10005E4F0();
  swift_release();
  v70._countAndFlagsBits = 0xD00000000000002ALL;
  v70._object = (void *)0x8000000100061BA0;
  sub_10005E500(v70);
  Swift::String v51 = v7;
  uint64_t v23 = v55;
  Swift::String v24 = v59;
  uint64_t v25 = v60;
  v59(v7, v55, v60);
  sub_10005E4E0();
  uint64_t v26 = v25;
  uint64_t v27 = v57;
  v57(v7, v26);
  v71._countAndFlagsBits = 0;
  v71._object = (void *)0xE000000000000000;
  sub_10005E500(v71);
  sub_10005E520();
  Swift::String v44 = (char *)sub_10005E470();
  v56(v22, v61);
  sub_10005E510();
  v72._countAndFlagsBits = 0xD000000000000028;
  v72._object = (void *)0x8000000100061BD0;
  sub_10005E500(v72);
  uint64_t v28 = v51;
  uint64_t v29 = v60;
  v24(v51, v23, v60);
  sub_10005E4E0();
  v27(v28, v29);
  v73._countAndFlagsBits = 544175136;
  v73._object = (void *)0xE400000000000000;
  sub_10005E500(v73);
  swift_getKeyPath();
  sub_10005E440();
  swift_release();
  sub_10005E4F0();
  swift_release();
  v74._countAndFlagsBits = 0;
  v74._object = (void *)0xE000000000000000;
  sub_10005E500(v74);
  uint64_t v30 = v54;
  sub_10005E520();
  Swift::String v45 = (char *)sub_10005E470();
  v56(v30, v61);
  sub_10005E510();
  v75._countAndFlagsBits = 0xD00000000000002BLL;
  v75._object = (void *)0x8000000100061C00;
  sub_10005E500(v75);
  uint64_t v31 = v51;
  uint64_t v32 = v60;
  v59(v51, v23, v60);
  sub_10005E4E0();
  v57(v31, v32);
  v76._countAndFlagsBits = 544175136;
  v76._object = (void *)0xE400000000000000;
  sub_10005E500(v76);
  swift_getKeyPath();
  sub_10005E440();
  swift_release();
  sub_10005E4F0();
  swift_release();
  v77._countAndFlagsBits = 0;
  v77._object = (void *)0xE000000000000000;
  sub_10005E500(v77);
  sub_10005E520();
  Swift::String v47 = (char *)sub_10005E470();
  uint64_t v33 = v61;
  Swift::String v34 = v56;
  v56(v30, v61);
  sub_10005E510();
  v78._countAndFlagsBits = 0x206E727554;
  v78._object = (void *)0xE500000000000000;
  sub_10005E500(v78);
  swift_getKeyPath();
  sub_10005E440();
  swift_release();
  sub_10005E4F0();
  swift_release();
  v79._object = (void *)0x8000000100061C30;
  v79._countAndFlagsBits = 0xD000000000000025;
  sub_10005E500(v79);
  unsigned int v35 = v51;
  uint64_t v36 = v60;
  v59(v51, v55, v60);
  sub_10005E4E0();
  v57(v35, v36);
  v80._countAndFlagsBits = 0;
  v80._object = (void *)0xE000000000000000;
  sub_10005E500(v80);
  sub_10005E520();
  uint64_t v37 = sub_10005E470();
  v34(v30, v33);
  sub_100005268(&qword_100081F68);
  uint64_t v38 = swift_allocObject();
  *(_OWORD *)(v38 + 16) = xmmword_10006F710;
  uint64_t v39 = v46;
  *(void *)(v38 + 32) = v48;
  *(void *)(v38 + 40) = v39;
  Swift::String v40 = v45;
  *(void *)(v38 + 48) = v44;
  *(void *)(v38 + 56) = v40;
  *(void *)(v38 + 64) = v47;
  *(void *)(v38 + 72) = v37;
  uint64_t v41 = sub_10005E460();
  swift_bridgeObjectRelease();
  return v41;
}

uint64_t sub_100037678(uint64_t a1)
{
  return sub_10002E064(a1, (uint64_t)&unk_10006F8B0, (void (*)(void))sub_10003CC54, (void (*)(uint64_t))sub_10003CAA8);
}

uint64_t sub_1000376C0(uint64_t a1)
{
  uint64_t v2 = sub_100005268(&qword_100081F40);
  uint64_t v65 = *(void *)(v2 - 8);
  uint64_t v66 = v2;
  __chkstk_darwin(v2);
  Swift::String v63 = (char *)v47 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_10005E450();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)v47 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100005268(&qword_100081F48);
  uint64_t v9 = __chkstk_darwin(v8);
  uint64_t v53 = (char *)v47 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __chkstk_darwin(v9);
  Swift::String v51 = (char *)v47 - v12;
  uint64_t v13 = __chkstk_darwin(v11);
  unint64_t v49 = (char *)v47 - v14;
  uint64_t v15 = __chkstk_darwin(v13);
  uint64_t v48 = (char *)v47 - v16;
  uint64_t v17 = __chkstk_darwin(v15);
  __chkstk_darwin(v17);
  unint64_t v18 = sub_10003CAFC();
  sub_10005E510();
  v67._countAndFlagsBits = 0x6767755320746553;
  v67._object = (void *)0xEC00000020747365;
  sub_10005E500(v67);
  unsigned int v60 = enum case for _AssistantIntent.PhraseToken.applicationName(_:);
  uint64_t v19 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 104);
  uint64_t v61 = v5 + 104;
  uint64_t v62 = v19;
  uint64_t v59 = v4;
  ((void (*)(char *))v19)(v7);
  sub_10005E4E0();
  uint64_t v20 = *(void (**)(char *, uint64_t))(v5 + 8);
  uint64_t v58 = v5 + 8;
  v20(v7, v4);
  uint64_t v21 = v20;
  Swift::String v56 = v20;
  v68._countAndFlagsBits = 544175136;
  v68._object = (void *)0xE400000000000000;
  sub_10005E500(v68);
  swift_getKeyPath();
  unint64_t v57 = sub_10003CC54();
  sub_10005E440();
  swift_release();
  sub_10005E4F0();
  swift_release();
  v69._countAndFlagsBits = 0;
  v69._object = (void *)0xE000000000000000;
  sub_10005E500(v69);
  uint64_t v22 = v63;
  sub_10005E520();
  uint64_t v52 = sub_10005E470();
  Swift::String v64 = *(void (**)(char *, uint64_t))(v65 + 8);
  v65 += 8;
  v64(v22, v66);
  sub_10005E510();
  v70._countAndFlagsBits = 0x532065676E616843;
  v70._object = (void *)0xEF20747365676775;
  sub_10005E500(v70);
  unint64_t v54 = v7;
  uint64_t v23 = v59;
  v62(v7, v60, v59);
  sub_10005E4E0();
  v21(v7, v23);
  v71._countAndFlagsBits = 544175136;
  v71._object = (void *)0xE400000000000000;
  sub_10005E500(v71);
  swift_getKeyPath();
  uint64_t v55 = a1;
  sub_10005E440();
  swift_release();
  sub_10005E4F0();
  swift_release();
  v72._countAndFlagsBits = 0;
  v72._object = (void *)0xE000000000000000;
  sub_10005E500(v72);
  Swift::String v24 = v63;
  sub_10005E520();
  uint64_t v50 = sub_10005E470();
  v64(v24, v66);
  sub_10005E510();
  v73._countAndFlagsBits = 0x206E727554;
  v73._object = (void *)0xE500000000000000;
  sub_10005E500(v73);
  swift_getKeyPath();
  sub_10005E440();
  swift_release();
  sub_10005E4F0();
  swift_release();
  v74._countAndFlagsBits = 0x7473656767755320;
  v74._object = (void *)0xE900000000000020;
  sub_10005E500(v74);
  uint64_t v25 = v54;
  uint64_t v26 = v60;
  uint64_t v27 = v59;
  uint64_t v28 = v62;
  v62(v54, v60, v59);
  sub_10005E4E0();
  v56(v25, v27);
  v75._countAndFlagsBits = 0;
  v75._object = (void *)0xE000000000000000;
  sub_10005E500(v75);
  uint64_t v29 = v63;
  sub_10005E520();
  unint64_t v30 = v18;
  uint64_t v48 = (char *)sub_10005E470();
  v64(v29, v66);
  sub_10005E510();
  v76._countAndFlagsBits = 0xD000000000000014;
  v76._object = (void *)0x8000000100061AD0;
  sub_10005E500(v76);
  uint64_t v31 = v54;
  uint64_t v32 = v26;
  uint64_t v33 = v59;
  v28(v54, v32, v59);
  sub_10005E4E0();
  uint64_t v34 = v33;
  uint64_t v35 = v33;
  uint64_t v36 = v56;
  v56(v31, v34);
  v77._countAndFlagsBits = 544175136;
  v77._object = (void *)0xE400000000000000;
  sub_10005E500(v77);
  swift_getKeyPath();
  sub_10005E440();
  swift_release();
  sub_10005E4F0();
  swift_release();
  v78._countAndFlagsBits = 0;
  v78._object = (void *)0xE000000000000000;
  sub_10005E500(v78);
  uint64_t v37 = v63;
  sub_10005E520();
  v47[1] = v30;
  unint64_t v49 = (char *)sub_10005E470();
  uint64_t v38 = v66;
  v64(v37, v66);
  sub_10005E510();
  v79._countAndFlagsBits = 0xD000000000000017;
  v79._object = (void *)0x8000000100061AF0;
  sub_10005E500(v79);
  v62(v31, v60, v35);
  sub_10005E4E0();
  v36(v31, v35);
  v80._countAndFlagsBits = 544175136;
  v80._object = (void *)0xE400000000000000;
  sub_10005E500(v80);
  swift_getKeyPath();
  sub_10005E440();
  swift_release();
  sub_10005E4F0();
  swift_release();
  v81._countAndFlagsBits = 0;
  v81._object = (void *)0xE000000000000000;
  sub_10005E500(v81);
  uint64_t v39 = v63;
  sub_10005E520();
  Swift::String v51 = (char *)sub_10005E470();
  v64(v39, v38);
  sub_10005E510();
  v82._countAndFlagsBits = 0x206E727554;
  v82._object = (void *)0xE500000000000000;
  sub_10005E500(v82);
  swift_getKeyPath();
  sub_10005E440();
  swift_release();
  sub_10005E4F0();
  swift_release();
  v83._object = (void *)0x8000000100061B10;
  v83._countAndFlagsBits = 0xD000000000000011;
  sub_10005E500(v83);
  uint64_t v40 = v59;
  v62(v31, v60, v59);
  sub_10005E4E0();
  v56(v31, v40);
  v84._countAndFlagsBits = 0;
  v84._object = (void *)0xE000000000000000;
  sub_10005E500(v84);
  sub_10005E520();
  uint64_t v41 = sub_10005E470();
  v64(v39, v66);
  sub_100005268(&qword_100081F50);
  uint64_t v42 = swift_allocObject();
  *(_OWORD *)(v42 + 16) = xmmword_10006F710;
  uint64_t v43 = v50;
  *(void *)(v42 + 32) = v52;
  *(void *)(v42 + 40) = v43;
  Swift::String v44 = v49;
  *(void *)(v42 + 48) = v48;
  *(void *)(v42 + 56) = v44;
  *(void *)(v42 + 64) = v51;
  *(void *)(v42 + 72) = v41;
  uint64_t v45 = sub_10005E460();
  swift_bridgeObjectRelease();
  return v45;
}

uint64_t sub_10003812C(uint64_t a1)
{
  return sub_10002E064(a1, (uint64_t)&unk_10006F888, (void (*)(void))sub_10003CC54, (void (*)(uint64_t))sub_10003CAFC);
}

uint64_t sub_100038174(uint64_t a1)
{
  uint64_t v51 = a1;
  uint64_t v1 = sub_100005268(&qword_100081F40);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v61 = v1;
  uint64_t v62 = v2;
  __chkstk_darwin(v1);
  unint64_t v54 = (char *)&v42 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_10005E450();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v42 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100005268(&qword_100081F48);
  uint64_t v9 = __chkstk_darwin(v8);
  uint64_t v48 = (char *)&v42 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __chkstk_darwin(v9);
  uint64_t v46 = (char *)&v42 - v12;
  uint64_t v13 = __chkstk_darwin(v11);
  Swift::String v44 = (char *)&v42 - v14;
  uint64_t v15 = __chkstk_darwin(v13);
  uint64_t v43 = (char *)&v42 - v16;
  uint64_t v17 = __chkstk_darwin(v15);
  __chkstk_darwin(v17);
  unint64_t v18 = sub_10003CAFC();
  sub_10005E510();
  v63._countAndFlagsBits = 0xD000000000000021;
  v63._object = (void *)0x80000001000619D0;
  sub_10005E500(v63);
  unsigned int v55 = enum case for _AssistantIntent.PhraseToken.applicationName(_:);
  uint64_t v19 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 104);
  uint64_t v58 = v5 + 104;
  uint64_t v59 = v19;
  uint64_t v60 = v4;
  ((void (*)(char *))v19)(v7);
  sub_10005E4E0();
  unint64_t v57 = *(void (**)(char *, uint64_t))(v5 + 8);
  v57(v7, v4);
  uint64_t v53 = v5 + 8;
  v64._countAndFlagsBits = 544175136;
  v64._object = (void *)0xE400000000000000;
  sub_10005E500(v64);
  swift_getKeyPath();
  unint64_t v50 = sub_10003CC54();
  sub_10005E440();
  swift_release();
  sub_10005E4F0();
  swift_release();
  v65._countAndFlagsBits = 0;
  v65._object = (void *)0xE000000000000000;
  sub_10005E500(v65);
  uint64_t v20 = v54;
  sub_10005E520();
  uint64_t v47 = sub_10005E470();
  Swift::String v56 = *(void (**)(char *, uint64_t))(v62 + 8);
  v62 += 8;
  v56(v20, v61);
  sub_10005E510();
  v66._countAndFlagsBits = 0xD000000000000024;
  v66._object = (void *)0x8000000100061A00;
  sub_10005E500(v66);
  uint64_t v21 = v60;
  v59(v7, v55, v60);
  sub_10005E4E0();
  v57(v7, v21);
  v67._countAndFlagsBits = 544175136;
  v67._object = (void *)0xE400000000000000;
  sub_10005E500(v67);
  swift_getKeyPath();
  sub_10005E440();
  swift_release();
  sub_10005E4F0();
  swift_release();
  v68._countAndFlagsBits = 0;
  v68._object = (void *)0xE000000000000000;
  sub_10005E500(v68);
  uint64_t v22 = v54;
  sub_10005E520();
  unint64_t v49 = v18;
  uint64_t v45 = sub_10005E470();
  v56(v22, v61);
  sub_10005E510();
  v69._countAndFlagsBits = 0x206E727554;
  v69._object = (void *)0xE500000000000000;
  sub_10005E500(v69);
  swift_getKeyPath();
  sub_10005E440();
  swift_release();
  sub_10005E4F0();
  swift_release();
  v70._object = (void *)0x8000000100061A30;
  v70._countAndFlagsBits = 0xD00000000000001ALL;
  sub_10005E500(v70);
  uint64_t v52 = v7;
  uint64_t v23 = v55;
  Swift::String v24 = v59;
  uint64_t v25 = v60;
  v59(v7, v55, v60);
  sub_10005E4E0();
  uint64_t v26 = v57;
  v57(v7, v25);
  v71._countAndFlagsBits = 0;
  v71._object = (void *)0xE000000000000000;
  sub_10005E500(v71);
  sub_10005E520();
  uint64_t v43 = (char *)sub_10005E470();
  v56(v22, v61);
  sub_10005E510();
  v72._countAndFlagsBits = 0xD000000000000026;
  v72._object = (void *)0x8000000100061A50;
  sub_10005E500(v72);
  uint64_t v27 = v52;
  uint64_t v28 = v60;
  v24(v52, v23, v60);
  sub_10005E4E0();
  v26(v27, v28);
  v73._countAndFlagsBits = 544175136;
  v73._object = (void *)0xE400000000000000;
  sub_10005E500(v73);
  swift_getKeyPath();
  sub_10005E440();
  swift_release();
  sub_10005E4F0();
  swift_release();
  v74._countAndFlagsBits = 0;
  v74._object = (void *)0xE000000000000000;
  sub_10005E500(v74);
  uint64_t v29 = v54;
  sub_10005E520();
  Swift::String v44 = (char *)sub_10005E470();
  v56(v29, v61);
  sub_10005E510();
  v75._countAndFlagsBits = 0xD000000000000029;
  v75._object = (void *)0x8000000100061A80;
  sub_10005E500(v75);
  unint64_t v30 = v52;
  uint64_t v31 = v60;
  v59(v52, v23, v60);
  sub_10005E4E0();
  v57(v30, v31);
  v76._countAndFlagsBits = 544175136;
  v76._object = (void *)0xE400000000000000;
  sub_10005E500(v76);
  swift_getKeyPath();
  sub_10005E440();
  swift_release();
  sub_10005E4F0();
  swift_release();
  v77._countAndFlagsBits = 0;
  v77._object = (void *)0xE000000000000000;
  sub_10005E500(v77);
  sub_10005E520();
  uint64_t v46 = (char *)sub_10005E470();
  uint64_t v32 = v61;
  uint64_t v33 = v56;
  v56(v29, v61);
  sub_10005E510();
  v78._countAndFlagsBits = 0x206E727554;
  v78._object = (void *)0xE500000000000000;
  sub_10005E500(v78);
  swift_getKeyPath();
  sub_10005E440();
  swift_release();
  sub_10005E4F0();
  swift_release();
  v79._countAndFlagsBits = 0xD00000000000001FLL;
  v79._object = (void *)0x8000000100061AB0;
  sub_10005E500(v79);
  uint64_t v34 = v52;
  uint64_t v35 = v60;
  v59(v52, v55, v60);
  sub_10005E4E0();
  v57(v34, v35);
  v80._countAndFlagsBits = 0;
  v80._object = (void *)0xE000000000000000;
  sub_10005E500(v80);
  sub_10005E520();
  uint64_t v36 = sub_10005E470();
  v33(v29, v32);
  sub_100005268(&qword_100081F50);
  uint64_t v37 = swift_allocObject();
  *(_OWORD *)(v37 + 16) = xmmword_10006F710;
  uint64_t v38 = v45;
  *(void *)(v37 + 32) = v47;
  *(void *)(v37 + 40) = v38;
  uint64_t v39 = v44;
  *(void *)(v37 + 48) = v43;
  *(void *)(v37 + 56) = v39;
  *(void *)(v37 + 64) = v46;
  *(void *)(v37 + 72) = v36;
  uint64_t v40 = sub_10005E460();
  swift_bridgeObjectRelease();
  return v40;
}

uint64_t sub_100038BE4(uint64_t a1)
{
  uint64_t v2 = sub_100005268(&qword_100081F28);
  uint64_t v32 = v2;
  uint64_t v34 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v4 = (char *)&v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100005268(&qword_100081F30);
  uint64_t v6 = __chkstk_darwin(v5);
  uint64_t v29 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v26 = (char *)&v23 - v9;
  __chkstk_darwin(v8);
  sub_10003CB50();
  sub_10005E510();
  v35._countAndFlagsBits = 0xD00000000000001CLL;
  v35._object = (void *)0x80000001000618F0;
  sub_10005E500(v35);
  swift_getKeyPath();
  unint64_t v33 = sub_10003CC54();
  uint64_t v31 = a1;
  sub_10005E440();
  swift_release();
  sub_10005E4F0();
  swift_release();
  v36._countAndFlagsBits = 0;
  v36._object = (void *)0xE000000000000000;
  sub_10005E500(v36);
  sub_10005E520();
  uint64_t v28 = sub_10005E470();
  uint64_t v10 = v34 + 8;
  unint64_t v30 = *(void (**)(char *, uint64_t))(v34 + 8);
  v30(v4, v2);
  uint64_t v34 = v10;
  sub_10005E510();
  v37._countAndFlagsBits = 0xD00000000000001FLL;
  v37._object = (void *)0x8000000100061910;
  sub_10005E500(v37);
  swift_getKeyPath();
  sub_10005E440();
  swift_release();
  sub_10005E4F0();
  swift_release();
  v38._countAndFlagsBits = 0;
  v38._object = (void *)0xE000000000000000;
  sub_10005E500(v38);
  uint64_t v23 = v4;
  sub_10005E520();
  uint64_t v27 = sub_10005E470();
  uint64_t v11 = v30;
  v30(v4, v32);
  sub_10005E510();
  v39._countAndFlagsBits = 0x206E727554;
  v39._object = (void *)0xE500000000000000;
  sub_10005E500(v39);
  swift_getKeyPath();
  sub_10005E440();
  swift_release();
  sub_10005E4F0();
  swift_release();
  v40._object = (void *)0x8000000100061930;
  v40._countAndFlagsBits = 0xD000000000000015;
  sub_10005E500(v40);
  uint64_t v12 = v23;
  sub_10005E520();
  uint64_t v26 = (char *)sub_10005E470();
  uint64_t v13 = v12;
  uint64_t v14 = v32;
  v11(v12, v32);
  sub_10005E510();
  v41._countAndFlagsBits = 0xD000000000000021;
  v41._object = (void *)0x8000000100061950;
  sub_10005E500(v41);
  swift_getKeyPath();
  sub_10005E440();
  swift_release();
  sub_10005E4F0();
  swift_release();
  v42._countAndFlagsBits = 0;
  v42._object = (void *)0xE000000000000000;
  sub_10005E500(v42);
  sub_10005E520();
  uint64_t v25 = sub_10005E470();
  uint64_t v15 = v30;
  v30(v12, v14);
  sub_10005E510();
  v43._countAndFlagsBits = 0xD000000000000024;
  v43._object = (void *)0x8000000100061980;
  sub_10005E500(v43);
  swift_getKeyPath();
  sub_10005E440();
  swift_release();
  sub_10005E4F0();
  swift_release();
  v44._countAndFlagsBits = 0;
  v44._object = (void *)0xE000000000000000;
  sub_10005E500(v44);
  sub_10005E520();
  uint64_t v24 = sub_10005E470();
  uint64_t v16 = v32;
  v15(v12, v32);
  sub_10005E510();
  v45._countAndFlagsBits = 0x206E727554;
  v45._object = (void *)0xE500000000000000;
  sub_10005E500(v45);
  swift_getKeyPath();
  sub_10005E440();
  swift_release();
  sub_10005E4F0();
  swift_release();
  v46._countAndFlagsBits = 0xD00000000000001ALL;
  v46._object = (void *)0x80000001000619B0;
  sub_10005E500(v46);
  sub_10005E520();
  uint64_t v17 = sub_10005E470();
  v15(v13, v16);
  sub_100005268(&qword_100081F38);
  uint64_t v18 = swift_allocObject();
  *(_OWORD *)(v18 + 16) = xmmword_10006F710;
  uint64_t v19 = v27;
  *(void *)(v18 + 32) = v28;
  *(void *)(v18 + 40) = v19;
  uint64_t v20 = v25;
  *(void *)(v18 + 48) = v26;
  *(void *)(v18 + 56) = v20;
  *(void *)(v18 + 64) = v24;
  *(void *)(v18 + 72) = v17;
  uint64_t v21 = sub_10005E460();
  swift_bridgeObjectRelease();
  return v21;
}

uint64_t sub_10003931C(uint64_t a1)
{
  return sub_10002E064(a1, (uint64_t)&unk_10006F860, (void (*)(void))sub_10003CC54, (void (*)(uint64_t))sub_10003CB50);
}

uint64_t sub_100039364()
{
  uint64_t v18 = sub_100005268(&qword_100081F10);
  uint64_t v0 = *(void *)(v18 - 8);
  __chkstk_darwin(v18);
  uint64_t v2 = (char *)&v14 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100005268(&qword_100081F18);
  uint64_t v4 = __chkstk_darwin(v3);
  uint64_t v16 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  sub_10003CBA4();
  sub_10005E510();
  v20._countAndFlagsBits = 0xD000000000000020;
  v20._object = (void *)0x8000000100061870;
  sub_10005E500(v20);
  swift_getKeyPath();
  unint64_t v19 = sub_10003CC54();
  sub_10005E440();
  swift_release();
  sub_10005E4F0();
  swift_release();
  v21._countAndFlagsBits = 0;
  v21._object = (void *)0xE000000000000000;
  sub_10005E500(v21);
  sub_10005E520();
  uint64_t v17 = sub_10005E470();
  uint64_t v14 = *(void (**)(char *, uint64_t))(v0 + 8);
  uint64_t v6 = v18;
  v14(v2, v18);
  sub_10005E510();
  v22._countAndFlagsBits = 0xD000000000000023;
  v22._object = (void *)0x80000001000618A0;
  sub_10005E500(v22);
  swift_getKeyPath();
  sub_10005E440();
  swift_release();
  sub_10005E4F0();
  swift_release();
  v23._countAndFlagsBits = 0;
  v23._object = (void *)0xE000000000000000;
  sub_10005E500(v23);
  sub_10005E520();
  uint64_t v15 = sub_10005E470();
  uint64_t v7 = v6;
  uint64_t v8 = v14;
  v14(v2, v7);
  sub_10005E510();
  v24._countAndFlagsBits = 0x206E727554;
  v24._object = (void *)0xE500000000000000;
  sub_10005E500(v24);
  swift_getKeyPath();
  sub_10005E440();
  swift_release();
  sub_10005E4F0();
  swift_release();
  v25._object = (void *)0x80000001000618D0;
  v25._countAndFlagsBits = 0xD000000000000019;
  sub_10005E500(v25);
  sub_10005E520();
  uint64_t v9 = sub_10005E470();
  v8(v2, v18);
  sub_100005268(&qword_100081F20);
  uint64_t v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_10006C7B0;
  uint64_t v11 = v15;
  *(void *)(v10 + 32) = v17;
  *(void *)(v10 + 40) = v11;
  *(void *)(v10 + 48) = v9;
  uint64_t v12 = sub_10005E460();
  swift_bridgeObjectRelease();
  return v12;
}

uint64_t sub_1000397A0(uint64_t a1)
{
  return sub_10002E064(a1, (uint64_t)&unk_10006F838, (void (*)(void))sub_10003CC54, (void (*)(uint64_t))sub_10003CBA4);
}

uint64_t sub_1000397E8()
{
  uint64_t v18 = sub_100005268(&qword_100081EF8);
  uint64_t v0 = *(void *)(v18 - 8);
  __chkstk_darwin(v18);
  uint64_t v2 = (char *)&v14 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100005268(&qword_100081F00);
  uint64_t v4 = __chkstk_darwin(v3);
  uint64_t v16 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  sub_10003CBF8();
  sub_10005E510();
  v20._countAndFlagsBits = 0xD000000000000019;
  v20._object = (void *)0x8000000100061810;
  sub_10005E500(v20);
  swift_getKeyPath();
  unint64_t v19 = sub_10003CC54();
  sub_10005E440();
  swift_release();
  sub_10005E4F0();
  swift_release();
  v21._countAndFlagsBits = 0;
  v21._object = (void *)0xE000000000000000;
  sub_10005E500(v21);
  sub_10005E520();
  uint64_t v17 = sub_10005E470();
  uint64_t v14 = *(void (**)(char *, uint64_t))(v0 + 8);
  uint64_t v6 = v18;
  v14(v2, v18);
  sub_10005E510();
  v22._countAndFlagsBits = 0xD00000000000001CLL;
  v22._object = (void *)0x8000000100061830;
  sub_10005E500(v22);
  swift_getKeyPath();
  sub_10005E440();
  swift_release();
  sub_10005E4F0();
  swift_release();
  v23._countAndFlagsBits = 0;
  v23._object = (void *)0xE000000000000000;
  sub_10005E500(v23);
  sub_10005E520();
  uint64_t v15 = sub_10005E470();
  uint64_t v7 = v6;
  uint64_t v8 = v14;
  v14(v2, v7);
  sub_10005E510();
  v24._countAndFlagsBits = 0x206E727554;
  v24._object = (void *)0xE500000000000000;
  sub_10005E500(v24);
  swift_getKeyPath();
  sub_10005E440();
  swift_release();
  sub_10005E4F0();
  swift_release();
  v25._object = (void *)0x8000000100061850;
  v25._countAndFlagsBits = 0xD000000000000012;
  sub_10005E500(v25);
  sub_10005E520();
  uint64_t v9 = sub_10005E470();
  v8(v2, v18);
  sub_100005268(&qword_100081F08);
  uint64_t v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_10006C7B0;
  uint64_t v11 = v15;
  *(void *)(v10 + 32) = v17;
  *(void *)(v10 + 40) = v11;
  *(void *)(v10 + 48) = v9;
  uint64_t v12 = sub_10005E460();
  swift_bridgeObjectRelease();
  return v12;
}

uint64_t sub_100039C24(uint64_t a1)
{
  return sub_10002E064(a1, (uint64_t)&unk_10006F810, (void (*)(void))sub_10003CC54, (void (*)(uint64_t))sub_10003CBF8);
}

uint64_t sub_100039C6C(uint64_t a1)
{
  uint64_t v2 = sub_100005268(&qword_100081EE0);
  uint64_t v32 = v2;
  uint64_t v34 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v4 = (char *)&v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100005268(&qword_100081EE8);
  uint64_t v6 = __chkstk_darwin(v5);
  uint64_t v29 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v26 = (char *)&v23 - v9;
  __chkstk_darwin(v8);
  sub_10000A404();
  sub_10005E510();
  v35._countAndFlagsBits = 0xD000000000000021;
  v35._object = (void *)0x8000000100061730;
  sub_10005E500(v35);
  swift_getKeyPath();
  unint64_t v33 = sub_10003CC54();
  uint64_t v31 = a1;
  sub_10005E440();
  swift_release();
  sub_10005E4F0();
  swift_release();
  v36._countAndFlagsBits = 0;
  v36._object = (void *)0xE000000000000000;
  sub_10005E500(v36);
  sub_10005E520();
  uint64_t v28 = sub_10005E470();
  uint64_t v10 = v34 + 8;
  unint64_t v30 = *(void (**)(char *, uint64_t))(v34 + 8);
  v30(v4, v2);
  uint64_t v34 = v10;
  sub_10005E510();
  v37._countAndFlagsBits = 0xD000000000000024;
  v37._object = (void *)0x8000000100061760;
  sub_10005E500(v37);
  swift_getKeyPath();
  sub_10005E440();
  swift_release();
  sub_10005E4F0();
  swift_release();
  v38._countAndFlagsBits = 0;
  v38._object = (void *)0xE000000000000000;
  sub_10005E500(v38);
  Swift::String v23 = v4;
  sub_10005E520();
  uint64_t v27 = sub_10005E470();
  uint64_t v11 = v30;
  v30(v4, v32);
  sub_10005E510();
  v39._countAndFlagsBits = 0x206E727554;
  v39._object = (void *)0xE500000000000000;
  sub_10005E500(v39);
  swift_getKeyPath();
  sub_10005E440();
  swift_release();
  sub_10005E4F0();
  swift_release();
  v40._object = (void *)0x8000000100061790;
  v40._countAndFlagsBits = 0xD00000000000001ALL;
  sub_10005E500(v40);
  uint64_t v12 = v23;
  sub_10005E520();
  uint64_t v26 = (char *)sub_10005E470();
  uint64_t v13 = v12;
  uint64_t v14 = v32;
  v11(v12, v32);
  sub_10005E510();
  v41._object = (void *)0x80000001000617B0;
  v41._countAndFlagsBits = 0xD00000000000001ALL;
  sub_10005E500(v41);
  swift_getKeyPath();
  sub_10005E440();
  swift_release();
  sub_10005E4F0();
  swift_release();
  v42._countAndFlagsBits = 0;
  v42._object = (void *)0xE000000000000000;
  sub_10005E500(v42);
  sub_10005E520();
  uint64_t v25 = sub_10005E470();
  uint64_t v15 = v30;
  v30(v12, v14);
  sub_10005E510();
  v43._countAndFlagsBits = 0xD00000000000001DLL;
  v43._object = (void *)0x80000001000617D0;
  sub_10005E500(v43);
  swift_getKeyPath();
  sub_10005E440();
  swift_release();
  sub_10005E4F0();
  swift_release();
  v44._countAndFlagsBits = 0;
  v44._object = (void *)0xE000000000000000;
  sub_10005E500(v44);
  sub_10005E520();
  uint64_t v24 = sub_10005E470();
  uint64_t v16 = v32;
  v15(v12, v32);
  sub_10005E510();
  v45._countAndFlagsBits = 0x206E727554;
  v45._object = (void *)0xE500000000000000;
  sub_10005E500(v45);
  swift_getKeyPath();
  sub_10005E440();
  swift_release();
  sub_10005E4F0();
  swift_release();
  v46._countAndFlagsBits = 0xD000000000000013;
  v46._object = (void *)0x80000001000617F0;
  sub_10005E500(v46);
  sub_10005E520();
  uint64_t v17 = sub_10005E470();
  v15(v13, v16);
  sub_100005268(&qword_100081EF0);
  uint64_t v18 = swift_allocObject();
  *(_OWORD *)(v18 + 16) = xmmword_10006F710;
  uint64_t v19 = v27;
  *(void *)(v18 + 32) = v28;
  *(void *)(v18 + 40) = v19;
  uint64_t v20 = v25;
  *(void *)(v18 + 48) = v26;
  *(void *)(v18 + 56) = v20;
  *(void *)(v18 + 64) = v24;
  *(void *)(v18 + 72) = v17;
  uint64_t v21 = sub_10005E460();
  swift_bridgeObjectRelease();
  return v21;
}

uint64_t sub_10003A394(uint64_t a1)
{
  return sub_10002E064(a1, (uint64_t)&unk_10006F7E8, (void (*)(void))sub_10003CC54, (void (*)(uint64_t))sub_10000A404);
}

uint64_t sub_10003A3DC()
{
  uint64_t v18 = sub_100005268(&qword_100081EC8);
  uint64_t v0 = *(void *)(v18 - 8);
  __chkstk_darwin(v18);
  uint64_t v2 = (char *)&v14 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100005268(&qword_100081ED0);
  uint64_t v4 = __chkstk_darwin(v3);
  uint64_t v16 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  sub_1000127EC();
  sub_10005E510();
  v20._countAndFlagsBits = 0xD00000000000001ALL;
  v20._object = (void *)0x80000001000616D0;
  sub_10005E500(v20);
  swift_getKeyPath();
  unint64_t v19 = sub_10003CC54();
  sub_10005E440();
  swift_release();
  sub_10005E4F0();
  swift_release();
  v21._countAndFlagsBits = 0;
  v21._object = (void *)0xE000000000000000;
  sub_10005E500(v21);
  sub_10005E520();
  uint64_t v17 = sub_10005E470();
  uint64_t v14 = *(void (**)(char *, uint64_t))(v0 + 8);
  uint64_t v6 = v18;
  v14(v2, v18);
  sub_10005E510();
  v22._countAndFlagsBits = 0xD00000000000001DLL;
  v22._object = (void *)0x80000001000616F0;
  sub_10005E500(v22);
  swift_getKeyPath();
  sub_10005E440();
  swift_release();
  sub_10005E4F0();
  swift_release();
  v23._countAndFlagsBits = 0;
  v23._object = (void *)0xE000000000000000;
  sub_10005E500(v23);
  sub_10005E520();
  uint64_t v15 = sub_10005E470();
  uint64_t v7 = v6;
  uint64_t v8 = v14;
  v14(v2, v7);
  sub_10005E510();
  v24._countAndFlagsBits = 0x206E727554;
  v24._object = (void *)0xE500000000000000;
  sub_10005E500(v24);
  swift_getKeyPath();
  sub_10005E440();
  swift_release();
  sub_10005E4F0();
  swift_release();
  v25._object = (void *)0x8000000100061710;
  v25._countAndFlagsBits = 0xD000000000000013;
  sub_10005E500(v25);
  sub_10005E520();
  uint64_t v9 = sub_10005E470();
  v8(v2, v18);
  sub_100005268(&qword_100081ED8);
  uint64_t v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_10006C7B0;
  uint64_t v11 = v15;
  *(void *)(v10 + 32) = v17;
  *(void *)(v10 + 40) = v11;
  *(void *)(v10 + 48) = v9;
  uint64_t v12 = sub_10005E460();
  swift_bridgeObjectRelease();
  return v12;
}

uint64_t sub_10003A818(uint64_t a1)
{
  return sub_10002E064(a1, (uint64_t)&unk_10006F7C0, (void (*)(void))sub_10003CC54, (void (*)(uint64_t))sub_1000127EC);
}

uint64_t sub_10003A860(uint64_t a1)
{
  uint64_t v50 = a1;
  uint64_t v1 = sub_100005268(&qword_100081EB0);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v61 = v1;
  uint64_t v62 = v2;
  __chkstk_darwin(v1);
  unint64_t v54 = (char *)v43 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_10005E450();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)v43 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100005268(&qword_100081EB8);
  uint64_t v9 = __chkstk_darwin(v8);
  unint64_t v49 = (char *)v43 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __chkstk_darwin(v9);
  uint64_t v47 = (char *)v43 - v12;
  uint64_t v13 = __chkstk_darwin(v11);
  Swift::String v45 = (char *)v43 - v14;
  uint64_t v15 = __chkstk_darwin(v13);
  Swift::String v44 = (char *)v43 - v16;
  uint64_t v17 = __chkstk_darwin(v15);
  __chkstk_darwin(v17);
  unint64_t v18 = sub_100005AC0();
  sub_10005E510();
  v63._countAndFlagsBits = 0xD00000000000001FLL;
  v63._object = (void *)0x8000000100061600;
  sub_10005E500(v63);
  unsigned int v55 = enum case for _AssistantIntent.PhraseToken.applicationName(_:);
  unint64_t v19 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 104);
  uint64_t v58 = v5 + 104;
  uint64_t v59 = v19;
  uint64_t v60 = v4;
  ((void (*)(char *))v19)(v7);
  sub_10005E4E0();
  unint64_t v57 = *(void (**)(char *, uint64_t))(v5 + 8);
  v57(v7, v4);
  uint64_t v53 = v5 + 8;
  v64._countAndFlagsBits = 544175136;
  v64._object = (void *)0xE400000000000000;
  sub_10005E500(v64);
  swift_getKeyPath();
  unint64_t v52 = sub_10003CC54();
  sub_10005E440();
  swift_release();
  sub_10005E4F0();
  swift_release();
  v65._countAndFlagsBits = 0;
  v65._object = (void *)0xE000000000000000;
  sub_10005E500(v65);
  Swift::String v20 = v54;
  sub_10005E520();
  uint64_t v48 = sub_10005E470();
  Swift::String v56 = *(void (**)(char *, uint64_t))(v62 + 8);
  v62 += 8;
  v56(v20, v61);
  sub_10005E510();
  v66._countAndFlagsBits = 0xD000000000000022;
  v66._object = (void *)0x8000000100061620;
  sub_10005E500(v66);
  uint64_t v21 = v60;
  v59(v7, v55, v60);
  sub_10005E4E0();
  v57(v7, v21);
  v67._countAndFlagsBits = 544175136;
  v67._object = (void *)0xE400000000000000;
  sub_10005E500(v67);
  swift_getKeyPath();
  sub_10005E440();
  swift_release();
  sub_10005E4F0();
  swift_release();
  v68._countAndFlagsBits = 0;
  v68._object = (void *)0xE000000000000000;
  sub_10005E500(v68);
  Swift::String v22 = v54;
  sub_10005E520();
  v43[1] = v18;
  uint64_t v46 = sub_10005E470();
  v56(v22, v61);
  sub_10005E510();
  v69._countAndFlagsBits = 0x206E727554;
  v69._object = (void *)0xE500000000000000;
  sub_10005E500(v69);
  swift_getKeyPath();
  sub_10005E440();
  swift_release();
  sub_10005E4F0();
  swift_release();
  v70._countAndFlagsBits = 0xD00000000000001CLL;
  v70._object = (void *)0x8000000100061650;
  sub_10005E500(v70);
  uint64_t v51 = v7;
  uint64_t v23 = v55;
  Swift::String v24 = v59;
  uint64_t v25 = v60;
  v59(v7, v55, v60);
  sub_10005E4E0();
  uint64_t v26 = v25;
  uint64_t v27 = v57;
  v57(v7, v26);
  v71._countAndFlagsBits = 0;
  v71._object = (void *)0xE000000000000000;
  sub_10005E500(v71);
  sub_10005E520();
  Swift::String v44 = (char *)sub_10005E470();
  v56(v22, v61);
  sub_10005E510();
  v72._countAndFlagsBits = 0xD00000000000001ALL;
  v72._object = (void *)0x8000000100061670;
  sub_10005E500(v72);
  uint64_t v28 = v51;
  uint64_t v29 = v60;
  v24(v51, v23, v60);
  sub_10005E4E0();
  v27(v28, v29);
  v73._countAndFlagsBits = 544175136;
  v73._object = (void *)0xE400000000000000;
  sub_10005E500(v73);
  swift_getKeyPath();
  sub_10005E440();
  swift_release();
  sub_10005E4F0();
  swift_release();
  v74._countAndFlagsBits = 0;
  v74._object = (void *)0xE000000000000000;
  sub_10005E500(v74);
  unint64_t v30 = v54;
  sub_10005E520();
  Swift::String v45 = (char *)sub_10005E470();
  v56(v30, v61);
  sub_10005E510();
  v75._countAndFlagsBits = 0xD00000000000001DLL;
  v75._object = (void *)0x8000000100061690;
  sub_10005E500(v75);
  uint64_t v31 = v51;
  uint64_t v32 = v60;
  v59(v51, v23, v60);
  sub_10005E4E0();
  v57(v31, v32);
  v76._countAndFlagsBits = 544175136;
  v76._object = (void *)0xE400000000000000;
  sub_10005E500(v76);
  swift_getKeyPath();
  sub_10005E440();
  swift_release();
  sub_10005E4F0();
  swift_release();
  v77._countAndFlagsBits = 0;
  v77._object = (void *)0xE000000000000000;
  sub_10005E500(v77);
  sub_10005E520();
  uint64_t v47 = (char *)sub_10005E470();
  uint64_t v33 = v61;
  uint64_t v34 = v56;
  v56(v30, v61);
  sub_10005E510();
  v78._countAndFlagsBits = 0x206E727554;
  v78._object = (void *)0xE500000000000000;
  sub_10005E500(v78);
  swift_getKeyPath();
  sub_10005E440();
  swift_release();
  sub_10005E4F0();
  swift_release();
  v79._object = (void *)0x80000001000616B0;
  v79._countAndFlagsBits = 0xD000000000000017;
  sub_10005E500(v79);
  Swift::String v35 = v51;
  uint64_t v36 = v60;
  v59(v51, v55, v60);
  sub_10005E4E0();
  v57(v35, v36);
  v80._countAndFlagsBits = 0;
  v80._object = (void *)0xE000000000000000;
  sub_10005E500(v80);
  sub_10005E520();
  uint64_t v37 = sub_10005E470();
  v34(v30, v33);
  sub_100005268(&qword_100081EC0);
  uint64_t v38 = swift_allocObject();
  *(_OWORD *)(v38 + 16) = xmmword_10006F710;
  uint64_t v39 = v46;
  *(void *)(v38 + 32) = v48;
  *(void *)(v38 + 40) = v39;
  Swift::String v40 = v45;
  *(void *)(v38 + 48) = v44;
  *(void *)(v38 + 56) = v40;
  *(void *)(v38 + 64) = v47;
  *(void *)(v38 + 72) = v37;
  uint64_t v41 = sub_10005E460();
  swift_bridgeObjectRelease();
  return v41;
}

uint64_t sub_10003B2C0(uint64_t a1)
{
  return sub_10002E064(a1, (uint64_t)&unk_10006F798, (void (*)(void))sub_10003CC54, (void (*)(uint64_t))sub_100005AC0);
}

uint64_t sub_10003B308()
{
  uint64_t v0 = sub_10005E490();
  uint64_t v1 = sub_10005E490();
  sub_100005268(&qword_100081EA8);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_10006F6F0;
  *(void *)(v2 + 32) = v0;
  *(void *)(v2 + 40) = v1;
  uint64_t v3 = sub_10005E480();
  swift_bridgeObjectRelease();
  return v3;
}

uint64_t sub_10003B394()
{
  if (qword_1000804A8 != -1) {
    swift_once();
  }

  return swift_bridgeObjectRetain();
}

ValueMetadata *type metadata accessor for SiriSettingsAssistantIntentsProvider()
{
  return &type metadata for SiriSettingsAssistantIntentsProvider;
}

uint64_t sub_10003B400()
{
  uint64_t v0 = sub_10005E550();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v48 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v79 = sub_10001E2CC();
  sub_10001C838();
  sub_10005E560();
  uint64_t v78 = sub_10005E540();
  uint64_t v4 = *(void (**)(char *, uint64_t))(v1 + 8);
  v4(v3, v0);
  uint64_t v79 = sub_100019880();
  sub_100015DAC();
  sub_10005E560();
  uint64_t v77 = sub_10005E540();
  v4(v3, v0);
  uint64_t v79 = sub_10004E938();
  sub_10003C664();
  sub_10005E560();
  uint64_t v76 = sub_10005E540();
  v4(v3, v0);
  uint64_t v79 = sub_100058FB8();
  sub_10003C6B8();
  sub_10005E560();
  uint64_t v75 = sub_10005E540();
  v4(v3, v0);
  uint64_t v79 = sub_100025E34();
  sub_10001ED90();
  sub_10005E560();
  uint64_t v74 = sub_10005E540();
  v4(v3, v0);
  uint64_t v79 = sub_10002B0D4();
  sub_10002868C();
  sub_10005E560();
  uint64_t v73 = sub_10005E540();
  v4(v3, v0);
  uint64_t v79 = sub_100004EE4();
  sub_100002E20();
  sub_10005E560();
  uint64_t v72 = sub_10005E540();
  v4(v3, v0);
  uint64_t v79 = sub_100050F94();
  sub_10003C70C();
  sub_10005E560();
  uint64_t v71 = sub_10005E540();
  v4(v3, v0);
  uint64_t v79 = sub_10005D844();
  sub_10003C760();
  sub_10005E560();
  uint64_t v70 = sub_10005E540();
  v4(v3, v0);
  uint64_t v79 = sub_10000E34C();
  sub_10000CFE0();
  sub_10005E560();
  uint64_t v69 = sub_10005E540();
  v4(v3, v0);
  uint64_t v79 = sub_10004A7B8();
  sub_10003C7B4();
  sub_10005E560();
  uint64_t v68 = sub_10005E540();
  v4(v3, v0);
  uint64_t v79 = sub_1000419C4();
  sub_10003C808();
  sub_10005E560();
  uint64_t v67 = sub_10005E540();
  v4(v3, v0);
  uint64_t v79 = sub_10000C488();
  sub_10000A0DC();
  sub_10005E560();
  uint64_t v66 = sub_10005E540();
  v4(v3, v0);
  uint64_t v79 = sub_100052D3C();
  sub_10003C85C();
  sub_10005E560();
  uint64_t v65 = sub_10005E540();
  v4(v3, v0);
  uint64_t v79 = sub_10000FFE0();
  sub_10000E900();
  sub_10005E560();
  uint64_t v64 = sub_10005E540();
  v4(v3, v0);
  uint64_t v79 = sub_100011E04();
  sub_1000106E0();
  sub_10005E560();
  uint64_t v63 = sub_10005E540();
  v4(v3, v0);
  uint64_t v79 = sub_100014878();
  sub_1000124C4();
  sub_10005E560();
  uint64_t v62 = sub_10005E540();
  v4(v3, v0);
  uint64_t v79 = sub_10004ECBC();
  uint64_t v80 = v5;
  sub_10003C8B0();
  sub_10005E560();
  uint64_t v61 = sub_10005E540();
  v4(v3, v0);
  uint64_t v79 = sub_100026120();
  uint64_t v80 = v6;
  sub_10001F080();
  sub_10005E560();
  uint64_t v60 = sub_10005E540();
  v4(v3, v0);
  uint64_t v79 = sub_10005DBDC();
  uint64_t v80 = v7;
  sub_10003C904();
  sub_10005E560();
  uint64_t v59 = sub_10005E540();
  v4(v3, v0);
  uint64_t v79 = sub_10005933C();
  uint64_t v80 = v8;
  sub_10003C958();
  sub_10005E560();
  uint64_t v58 = sub_10005E540();
  v4(v3, v0);
  uint64_t v79 = sub_100059358();
  uint64_t v80 = v9;
  sub_10003C9AC();
  sub_10005E560();
  uint64_t v57 = sub_10005E540();
  v4(v3, v0);
  uint64_t v79 = sub_100059854();
  uint64_t v80 = v10;
  sub_10003CA00();
  sub_10005E560();
  uint64_t v56 = sub_10005E540();
  v4(v3, v0);
  uint64_t v79 = sub_10002B458();
  uint64_t v80 = v11;
  sub_1000289B4();
  sub_10005E560();
  uint64_t v55 = sub_10005E540();
  v4(v3, v0);
  uint64_t v79 = sub_10001E5B0();
  uint64_t v80 = v12;
  sub_10001CB28();
  sub_10005E560();
  uint64_t v54 = sub_10005E540();
  v4(v3, v0);
  uint64_t v79 = sub_100019C18();
  uint64_t v80 = v13;
  sub_100016110();
  sub_10005E560();
  uint64_t v53 = sub_10005E540();
  v4(v3, v0);
  uint64_t v79 = sub_10004AB50();
  uint64_t v80 = v14;
  sub_10003CA54();
  sub_10005E560();
  uint64_t v52 = sub_10005E540();
  v4(v3, v0);
  uint64_t v79 = sub_10004AB6C();
  uint64_t v80 = v15;
  sub_10003CAA8();
  sub_10005E560();
  uint64_t v51 = sub_10005E540();
  v4(v3, v0);
  uint64_t v79 = sub_10004B07C();
  uint64_t v80 = v16;
  sub_10003CAFC();
  sub_10005E560();
  uint64_t v50 = sub_10005E540();
  v4(v3, v0);
  uint64_t v79 = sub_10004B07C();
  uint64_t v80 = v17;
  sub_10005E560();
  uint64_t v49 = sub_10005E540();
  v4(v3, v0);
  uint64_t v79 = sub_100041CAC();
  uint64_t v80 = v18;
  sub_10003CB50();
  sub_10005E560();
  uint64_t v19 = sub_10005E540();
  v4(v3, v0);
  uint64_t v79 = sub_100041CC8();
  uint64_t v80 = v20;
  sub_10003CBA4();
  sub_10005E560();
  uint64_t v21 = sub_10005E540();
  v4(v3, v0);
  uint64_t v79 = sub_100041CE4();
  uint64_t v80 = v22;
  sub_10003CBF8();
  sub_10005E560();
  uint64_t v23 = sub_10005E540();
  v4(v3, v0);
  uint64_t v79 = sub_10000C80C();
  uint64_t v80 = v24;
  sub_10000A404();
  sub_10005E560();
  uint64_t v25 = sub_10005E540();
  v4(v3, v0);
  uint64_t v79 = sub_100014BFC();
  uint64_t v80 = v26;
  sub_1000127EC();
  sub_10005E560();
  uint64_t v27 = sub_10005E540();
  v4(v3, v0);
  uint64_t v79 = sub_100009408();
  uint64_t v80 = v28;
  sub_100005AC0();
  sub_10005E560();
  uint64_t v29 = sub_10005E540();
  v4(v3, v0);
  sub_100005268(&qword_100081E90);
  uint64_t v30 = swift_allocObject();
  uint64_t v31 = v77;
  *(void *)(v30 + 32) = v78;
  *(void *)(v30 + 40) = v31;
  uint64_t v32 = v75;
  *(void *)(v30 + 48) = v76;
  *(void *)(v30 + 56) = v32;
  uint64_t v33 = v73;
  *(void *)(v30 + 64) = v74;
  *(void *)(v30 + 72) = v33;
  uint64_t v34 = v71;
  *(void *)(v30 + 80) = v72;
  *(void *)(v30 + 88) = v34;
  *(_OWORD *)(v30 + 16) = xmmword_10006F720;
  uint64_t v35 = v69;
  *(void *)(v30 + 96) = v70;
  *(void *)(v30 + 104) = v35;
  uint64_t v36 = v67;
  *(void *)(v30 + 112) = v68;
  *(void *)(v30 + 120) = v36;
  uint64_t v37 = v65;
  *(void *)(v30 + 128) = v66;
  *(void *)(v30 + 136) = v37;
  uint64_t v38 = v63;
  *(void *)(v30 + 144) = v64;
  *(void *)(v30 + 152) = v38;
  uint64_t v39 = v61;
  *(void *)(v30 + 160) = v62;
  *(void *)(v30 + 168) = v39;
  uint64_t v40 = v59;
  *(void *)(v30 + 176) = v60;
  *(void *)(v30 + 184) = v40;
  uint64_t v41 = v57;
  *(void *)(v30 + 192) = v58;
  *(void *)(v30 + 200) = v41;
  uint64_t v42 = v55;
  *(void *)(v30 + 208) = v56;
  *(void *)(v30 + 216) = v42;
  uint64_t v43 = v53;
  *(void *)(v30 + 224) = v54;
  *(void *)(v30 + 232) = v43;
  uint64_t v44 = v51;
  *(void *)(v30 + 240) = v52;
  *(void *)(v30 + 248) = v44;
  uint64_t v45 = v49;
  *(void *)(v30 + 256) = v50;
  *(void *)(v30 + 264) = v45;
  *(void *)(v30 + 272) = v19;
  *(void *)(v30 + 280) = v21;
  *(void *)(v30 + 288) = v23;
  *(void *)(v30 + 296) = v25;
  *(void *)(v30 + 304) = v27;
  *(void *)(v30 + 312) = v29;
  uint64_t v46 = sub_10005E530();
  swift_bridgeObjectRelease();
  return v46;
}

unint64_t sub_10003C664()
{
  unint64_t result = qword_100081E00;
  if (!qword_100081E00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100081E00);
  }
  return result;
}

unint64_t sub_10003C6B8()
{
  unint64_t result = qword_100081E08;
  if (!qword_100081E08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100081E08);
  }
  return result;
}

unint64_t sub_10003C70C()
{
  unint64_t result = qword_100081E10;
  if (!qword_100081E10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100081E10);
  }
  return result;
}

unint64_t sub_10003C760()
{
  unint64_t result = qword_100081E18;
  if (!qword_100081E18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100081E18);
  }
  return result;
}

unint64_t sub_10003C7B4()
{
  unint64_t result = qword_100081E20;
  if (!qword_100081E20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100081E20);
  }
  return result;
}

unint64_t sub_10003C808()
{
  unint64_t result = qword_100081E28;
  if (!qword_100081E28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100081E28);
  }
  return result;
}

unint64_t sub_10003C85C()
{
  unint64_t result = qword_100081E30;
  if (!qword_100081E30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100081E30);
  }
  return result;
}

unint64_t sub_10003C8B0()
{
  unint64_t result = qword_100081E38;
  if (!qword_100081E38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100081E38);
  }
  return result;
}

unint64_t sub_10003C904()
{
  unint64_t result = qword_100081E40;
  if (!qword_100081E40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100081E40);
  }
  return result;
}

unint64_t sub_10003C958()
{
  unint64_t result = qword_100081E48;
  if (!qword_100081E48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100081E48);
  }
  return result;
}

unint64_t sub_10003C9AC()
{
  unint64_t result = qword_100081E50;
  if (!qword_100081E50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100081E50);
  }
  return result;
}

unint64_t sub_10003CA00()
{
  unint64_t result = qword_100081E58;
  if (!qword_100081E58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100081E58);
  }
  return result;
}

unint64_t sub_10003CA54()
{
  unint64_t result = qword_100081E60;
  if (!qword_100081E60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100081E60);
  }
  return result;
}

unint64_t sub_10003CAA8()
{
  unint64_t result = qword_100081E68;
  if (!qword_100081E68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100081E68);
  }
  return result;
}

unint64_t sub_10003CAFC()
{
  unint64_t result = qword_100081E70;
  if (!qword_100081E70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100081E70);
  }
  return result;
}

unint64_t sub_10003CB50()
{
  unint64_t result = qword_100081E78;
  if (!qword_100081E78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100081E78);
  }
  return result;
}

unint64_t sub_10003CBA4()
{
  unint64_t result = qword_100081E80;
  if (!qword_100081E80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100081E80);
  }
  return result;
}

unint64_t sub_10003CBF8()
{
  unint64_t result = qword_100081E88;
  if (!qword_100081E88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100081E88);
  }
  return result;
}

unint64_t sub_10003CC54()
{
  unint64_t result = qword_100081E98;
  if (!qword_100081E98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100081E98);
  }
  return result;
}

uint64_t sub_10003CD24@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_10005E3F0();
  *a1 = v3;
  return result;
}

uint64_t sub_10003CD64()
{
  return sub_10005E400();
}

unint64_t sub_10003CDA4()
{
  unint64_t result = qword_100082048;
  if (!qword_100082048)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100082048);
  }
  return result;
}

uint64_t sub_10003CDF8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_10002D404(a1, a2, a3, a4, (uint64_t (*)(void))type metadata accessor for AlwaysShowSpeechEntity, (uint64_t (*)(void))type metadata accessor for AlwaysShowSpeechEntity);
}

uint64_t sub_10003CE38(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_10002D404(a1, a2, a3, a4, (uint64_t (*)(void))type metadata accessor for SiriAndDictationHistoryEntity, (uint64_t (*)(void))type metadata accessor for SiriAndDictationHistoryEntity);
}

uint64_t sub_10003CE78(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_10002D404(a1, a2, a3, a4, (uint64_t (*)(void))type metadata accessor for SiriLanguageEntity, (uint64_t (*)(void))type metadata accessor for SiriLanguageEntity);
}

uint64_t sub_10003CEB8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_10002D404(a1, a2, a3, a4, (uint64_t (*)(void))type metadata accessor for SiriVoiceEntity, (uint64_t (*)(void))type metadata accessor for SiriVoiceEntity);
}

uint64_t sub_10003CEF8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_10002D404(a1, a2, a3, a4, (uint64_t (*)(void))type metadata accessor for AlwaysPrintSiriResponseEntity, (uint64_t (*)(void))type metadata accessor for AlwaysPrintSiriResponseEntity);
}

double sub_10003CF38@<D0>(uint64_t a1@<X8>)
{
  sub_10005E3F0();
  double result = *(double *)&v3;
  *(_OWORD *)a1 = v3;
  *(void *)(a1 + 16) = v4;
  return result;
}

unint64_t sub_10003CF80()
{
  unint64_t result = qword_1000820E8;
  if (!qword_1000820E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000820E8);
  }
  return result;
}

uint64_t sub_10003CFD4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_10002D404(a1, a2, a3, a4, (uint64_t (*)(void))type metadata accessor for SiriAppAccessForAppEntity, (uint64_t (*)(void))type metadata accessor for SiriAppAccessForAppEntity);
}

uint64_t sub_10003D014()
{
  return sub_10005E3F0();
}

uint64_t sub_10003D038()
{
  return sub_10005E400();
}

uint64_t sub_10003D05C()
{
  return sub_10005E3F0();
}

uint64_t sub_10003D080(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_10002D404(a1, a2, a3, a4, (uint64_t (*)(void))type metadata accessor for AnnounceNotificationForAppEntity, (uint64_t (*)(void))type metadata accessor for AnnounceNotificationForAppEntity);
}

uint64_t sub_10003D0C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_10002D404(a1, a2, a3, a4, (uint64_t (*)(void))type metadata accessor for MyInformationEntity, (uint64_t (*)(void))type metadata accessor for MyInformationEntity);
}

uint64_t sub_10003D100(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_10002D404(a1, a2, a3, a4, (uint64_t (*)(void))type metadata accessor for AssistantLockScreenAccessEntity, (uint64_t (*)(void))type metadata accessor for AssistantLockScreenAccessEntity);
}

uint64_t sub_10003D140(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_10002D404(a1, a2, a3, a4, (uint64_t (*)(void))type metadata accessor for CallHangUpEntity, (uint64_t (*)(void))type metadata accessor for CallHangUpEntity);
}

double sub_10003D180@<D0>(_OWORD *a1@<X8>)
{
  sub_10005E3F0();
  double result = *(double *)&v3;
  *a1 = v3;
  a1[1] = v4;
  a1[2] = v5;
  return result;
}

uint64_t sub_10003D1C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_10002D404(a1, a2, a3, a4, (uint64_t (*)(void))type metadata accessor for AutoSendMessagesEntity, (uint64_t (*)(void))type metadata accessor for AutoSendMessagesEntity);
}

uint64_t sub_10003D208(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_10002D404(a1, a2, a3, a4, (uint64_t (*)(void))type metadata accessor for AnnounceCallsEntity, (uint64_t (*)(void))type metadata accessor for AnnounceCallsEntity);
}

uint64_t sub_10003D248(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_10002D404(a1, a2, a3, a4, (uint64_t (*)(void))type metadata accessor for SpokenResponsesEntity, (uint64_t (*)(void))type metadata accessor for SpokenResponsesEntity);
}

uint64_t sub_10003D288(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_10003D2D0(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_10003D338(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_10003D398@<X0>(void *a1@<X8>)
{
  uint64_t result = sub_10005E3F0();
  *a1 = v3;
  return result;
}

uint64_t sub_10003D3D4()
{
  return sub_10005E400();
}

unint64_t sub_10003D444()
{
  unint64_t result = qword_100082238;
  if (!qword_100082238)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100082238);
  }
  return result;
}

unint64_t sub_10003D49C()
{
  unint64_t result = qword_100082240;
  if (!qword_100082240)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100082240);
  }
  return result;
}

uint64_t sub_10003D4F0()
{
  sub_10005E3F0();
  return v1;
}

uint64_t sub_10003D528(uint64_t a1)
{
  return sub_100005E9C(a1, qword_100083958);
}

double sub_10003D54C@<D0>(uint64_t a1@<X8>)
{
  sub_10005E3F0();
  double result = *(double *)&v3;
  *(_OWORD *)a1 = v3;
  *(void *)(a1 + 16) = v4;
  return result;
}

uint64_t sub_10003D590()
{
  return swift_release();
}

uint64_t sub_10003D60C(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_100042374();
  unint64_t v5 = sub_100041970();

  return static URLRepresentableIntent<>.urlRepresentation.getter(a1, v4, a2, v5);
}

unint64_t sub_10003D678()
{
  unint64_t result = qword_100082248;
  if (!qword_100082248)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100082248);
  }
  return result;
}

unint64_t sub_10003D6D0()
{
  unint64_t result = qword_100082250;
  if (!qword_100082250)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100082250);
  }
  return result;
}

uint64_t sub_10003D724(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100040524(a1, a2, a3, (void (*)(void))sub_10003C808);
}

uint64_t sub_10003D73C@<X0>(uint64_t a1@<X8>)
{
  return sub_1000412FC(&qword_1000804B0, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_100083958, a1);
}

uint64_t sub_10003D774(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  unint64_t v5 = sub_100042374();
  unint64_t v6 = sub_1000423C8();
  unint64_t v7 = sub_100041970();
  *unint64_t v4 = v2;
  v4[1] = sub_100003184;
  return URLRepresentableIntent<>.perform()(a2, v5, v6, v7);
}

uint64_t sub_10003D840@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1000419C4();
  *a1 = result;
  return result;
}

uint64_t sub_10003D868(uint64_t a1)
{
  unint64_t v2 = sub_10003C808();

  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

uint64_t sub_10003D8A8()
{
  return sub_100009DAC(&qword_100082260, &qword_100082268);
}

id sub_10003D8E4()
{
  id result = [self sharedController];
  qword_100083970 = (uint64_t)result;
  return result;
}

uint64_t sub_10003D920()
{
  uint64_t v0 = sub_100005268(&qword_100080858);
  __chkstk_darwin(v0 - 8);
  unint64_t v2 = (char *)v12 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12[0] = sub_10005E7F0();
  uint64_t v3 = *(void *)(v12[0] - 8);
  __chkstk_darwin(v12[0]);
  unint64_t v5 = (char *)v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10005E830();
  __chkstk_darwin(v6 - 8);
  uint64_t v7 = sub_10005E990();
  __chkstk_darwin(v7 - 8);
  uint64_t v8 = sub_10005E800();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v10 = sub_10005E780();
  sub_1000052E4(v10, qword_100083978);
  sub_1000052AC(v10, (uint64_t)qword_100083978);
  sub_10005E980();
  sub_10005E820();
  (*(void (**)(char *, void, void))(v3 + 104))(v5, enum case for LocalizedStringResource.BundleDescription.main(_:), v12[0]);
  sub_10005E810();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(v2, 1, 1, v8);
  return sub_10005E770();
}

uint64_t sub_10003DC0C(uint64_t a1)
{
  return sub_100005E9C(a1, qword_100083990);
}

uint64_t sub_10003DC30(uint64_t a1)
{
  return sub_1000240D0(a1, qword_1000839A8);
}

uint64_t sub_10003DC54()
{
  uint64_t result = swift_getKeyPath();
  qword_1000839C0 = result;
  return result;
}

uint64_t sub_10003DC7C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[21] = a2;
  v3[22] = a3;
  v3[20] = a1;
  sub_100005268(&qword_100080AF0);
  v3[23] = swift_task_alloc();
  sub_100005268(&qword_100080AF8);
  v3[24] = swift_task_alloc();
  sub_100005268(&qword_100082450);
  v3[25] = swift_task_alloc();
  uint64_t v4 = sub_10005E390();
  v3[26] = v4;
  v3[27] = *(void *)(v4 - 8);
  v3[28] = swift_task_alloc();
  uint64_t v5 = sub_100005268(&qword_100082420);
  v3[29] = v5;
  v3[30] = *(void *)(v5 - 8);
  v3[31] = swift_task_alloc();
  v3[32] = swift_task_alloc();
  return _swift_task_switch(sub_10003DE40, 0, 0);
}

uint64_t sub_10003DE40()
{
  sub_10005E3F0();
  uint64_t v1 = *(void *)(v0 + 32);
  *(_OWORD *)(v0 + 40) = *(_OWORD *)(v0 + 16);
  *(void *)(v0 + 56) = v1;
  unint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 264) = v2;
  unint64_t v3 = sub_100040BEC();
  *unint64_t v2 = v0;
  v2[1] = sub_10003DF24;
  uint64_t v4 = *(void *)(v0 + 256);
  return IntentDialog._CapturedContent.init<>(entity:_:)(v4, v0 + 40, sub_10003E598, 0, &type metadata for SiriAppClipsAccessEntity, v3);
}

uint64_t sub_10003DF24()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_10003E020, 0, 0);
}

uint64_t sub_10003E020()
{
  sub_10005E3F0();
  uint64_t v1 = *(void *)(v0 + 64);
  *(void *)(v0 + 88) = v1;
  uint64_t v2 = *(void *)(v0 + 72);
  uint64_t v3 = *(void *)(v0 + 80);
  *(void *)(v0 + 272) = v1;
  *(void *)(v0 + 280) = v2;
  *(void *)(v0 + 288) = v3;
  *(void *)(v0 + 96) = v2;
  *(void *)(v0 + 104) = v3;
  sub_10005E3F0();
  *(unsigned char *)(v0 + 320) = *(unsigned char *)(v0 + 321);
  if (qword_1000804D8 != -1) {
    swift_once();
  }
  uint64_t v4 = qword_1000839C0;
  *(void *)(v0 + 296) = qword_1000839C0;
  swift_retain();
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v0 + 304) = v5;
  uint64_t v6 = sub_100009DAC(&qword_1000823D8, &qword_1000823E0);
  *uint64_t v5 = v0;
  v5[1] = sub_10003E184;
  return AppEntity._setValue<A, B, C>(_:for:)(v0 + 320, v4, &type metadata for Bool, v6);
}

uint64_t sub_10003E184()
{
  *(void *)(*(void *)v1 + 312) = v0;
  swift_task_dealloc();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  if (v0) {
    uint64_t v2 = sub_100042420;
  }
  else {
    uint64_t v2 = sub_10003E318;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_10003E318()
{
  uint64_t v1 = *(void *)(v0 + 240);
  uint64_t v10 = *(void *)(v0 + 248);
  uint64_t v11 = *(void *)(v0 + 256);
  uint64_t v2 = *(void *)(v0 + 232);
  uint64_t v13 = *(void *)(v0 + 216);
  uint64_t v14 = *(void *)(v0 + 208);
  uint64_t v3 = *(void *)(v0 + 184);
  uint64_t v4 = *(void *)(v0 + 192);
  uint64_t v12 = *(void *)(v0 + 224);
  sub_10005E3F0();
  uint64_t v5 = *(void *)(v0 + 152);
  *(_OWORD *)(v0 + 112) = *(_OWORD *)(v0 + 136);
  *(void *)(v0 + 128) = v5;
  uint64_t v6 = sub_10005E750();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v4, 1, 1, v6);
  uint64_t v7 = sub_10005E790();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v3, 1, 1, v7);
  sub_10003CB50();
  sub_10003CF80();
  sub_10005E350();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v1 + 16))(v10, v11, v2);
  sub_10005E370();
  sub_10005E3A0();
  (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v12, v14);
  swift_release();
  swift_release();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v1 + 8))(v11, v2);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v8 = *(uint64_t (**)(void))(v0 + 8);
  return v8();
}

uint64_t sub_10003E598()
{
  return sub_10003E5BC(&qword_1000804D8);
}

uint64_t sub_10003E5BC(void *a1)
{
  uint64_t v2 = sub_100005268(&qword_100082428);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*a1 != -1) {
    swift_once();
  }
  swift_retain();
  sub_10005E5D0();
  swift_release();
  sub_10003CF80();
  sub_100009DAC(&qword_100082430, &qword_100082428);
  sub_10005E5C0();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_10003E728(uint64_t a1, uint64_t a2)
{
  return sub_100024B94(a1, a2, &qword_1000804D8);
}

unint64_t sub_10003E750()
{
  unint64_t result = qword_100082270;
  if (!qword_100082270)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100082270);
  }
  return result;
}

unint64_t sub_10003E7A8()
{
  unint64_t result = qword_100082278;
  if (!qword_100082278)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100082278);
  }
  return result;
}

uint64_t sub_10003E7FC()
{
  return *(void *)(swift_getOpaqueTypeConformance2() + 8);
}

uint64_t sub_10003E830(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100040524(a1, a2, a3, (void (*)(void))sub_10003CB50);
}

uint64_t sub_10003E848@<X0>(uint64_t a1@<X8>)
{
  return sub_1000412FC(&qword_1000804C8, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_100083990, a1);
}

uint64_t sub_10003E880@<X0>(uint64_t a1@<X8>)
{
  return sub_100024D90(&qword_1000804D0, (uint64_t)qword_1000839A8, a1);
}

uint64_t sub_10003E8A4(uint64_t a1)
{
  uint64_t v5 = *v1;
  uint64_t v4 = v1[1];
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v6;
  *uint64_t v6 = v2;
  v6[1] = sub_100009F48;
  return sub_10003DC7C(a1, v5, v4);
}

uint64_t sub_10003E950@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100041D00(0xD00000000000003BLL, 0x80000001000628C0);
  *a1 = result;
  a1[1] = v3;
  return result;
}

unint64_t sub_10003E990()
{
  return 0xD000000000000035;
}

uint64_t sub_10003E9B0()
{
  return sub_100009DAC(&qword_100082288, &qword_100082290);
}

uint64_t sub_10003E9EC(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return _swift_task_switch(sub_10003EA0C, 0, 0);
}

uint64_t sub_10003EA0C()
{
  if (qword_1000804B8 != -1) {
    swift_once();
  }
  uint64_t v1 = *(unsigned char **)(v0 + 16);
  unsigned char *v1 = [(id)qword_100083970 learnFromAppClipsEnabled];
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_10003EAB4(uint64_t a1, unsigned char *a2)
{
  *(unsigned char *)(v2 + 16) = *a2;
  return _swift_task_switch(sub_10003EAD8, 0, 0);
}

uint64_t sub_10003EAD8()
{
  if (qword_1000804B8 != -1) {
    swift_once();
  }
  [(id)qword_100083970 setLearnFromAppClipsEnabled:*(unsigned __int8 *)(v0 + 16)];
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_10003EB7C(uint64_t a1)
{
  return sub_100005E9C(a1, qword_1000839C8);
}

uint64_t sub_10003EBA0(uint64_t a1)
{
  return sub_1000240D0(a1, qword_1000839E0);
}

uint64_t sub_10003EBC4()
{
  uint64_t result = swift_getKeyPath();
  qword_1000839F8 = result;
  return result;
}

uint64_t sub_10003EBEC()
{
  return swift_retain();
}

uint64_t sub_10003EBF4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[21] = a2;
  v3[22] = a3;
  v3[20] = a1;
  sub_100005268(&qword_100080AF0);
  v3[23] = swift_task_alloc();
  sub_100005268(&qword_100080AF8);
  v3[24] = swift_task_alloc();
  sub_100005268(&qword_100082440);
  v3[25] = swift_task_alloc();
  uint64_t v4 = sub_10005E390();
  v3[26] = v4;
  v3[27] = *(void *)(v4 - 8);
  v3[28] = swift_task_alloc();
  uint64_t v5 = sub_100005268(&qword_100082420);
  v3[29] = v5;
  v3[30] = *(void *)(v5 - 8);
  v3[31] = swift_task_alloc();
  v3[32] = swift_task_alloc();
  return _swift_task_switch(sub_10003EDB8, 0, 0);
}

uint64_t sub_10003EDB8()
{
  sub_10005E3F0();
  uint64_t v1 = *(void *)(v0 + 32);
  *(_OWORD *)(v0 + 40) = *(_OWORD *)(v0 + 16);
  *(void *)(v0 + 56) = v1;
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 264) = v2;
  unint64_t v3 = sub_100040BEC();
  *uint64_t v2 = v0;
  v2[1] = sub_10003EE9C;
  uint64_t v4 = *(void *)(v0 + 256);
  return IntentDialog._CapturedContent.init<>(entity:_:)(v4, v0 + 40, sub_10003F510, 0, &type metadata for SiriAppClipsAccessEntity, v3);
}

uint64_t sub_10003EE9C()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_10003EF98, 0, 0);
}

uint64_t sub_10003EF98()
{
  sub_10005E3F0();
  uint64_t v1 = *(void *)(v0 + 64);
  *(void *)(v0 + 88) = v1;
  uint64_t v2 = *(void *)(v0 + 72);
  uint64_t v3 = *(void *)(v0 + 80);
  *(void *)(v0 + 272) = v1;
  *(void *)(v0 + 280) = v2;
  *(void *)(v0 + 288) = v3;
  *(void *)(v0 + 96) = v2;
  *(void *)(v0 + 104) = v3;
  sub_10005E3F0();
  *(unsigned char *)(v0 + 320) = *(unsigned char *)(v0 + 321);
  if (qword_1000804F0 != -1) {
    swift_once();
  }
  uint64_t v4 = qword_1000839F8;
  *(void *)(v0 + 296) = qword_1000839F8;
  swift_retain();
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v0 + 304) = v5;
  uint64_t v6 = sub_100009DAC(&qword_1000823D8, &qword_1000823E0);
  *uint64_t v5 = v0;
  v5[1] = sub_10003F0FC;
  return AppEntity._setValue<A, B, C>(_:for:)(v0 + 320, v4, &type metadata for Bool, v6);
}

uint64_t sub_10003F0FC()
{
  *(void *)(*(void *)v1 + 312) = v0;
  swift_task_dealloc();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  if (v0) {
    uint64_t v2 = sub_100042420;
  }
  else {
    uint64_t v2 = sub_10003F290;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_10003F290()
{
  uint64_t v1 = *(void *)(v0 + 240);
  uint64_t v10 = *(void *)(v0 + 248);
  uint64_t v11 = *(void *)(v0 + 256);
  uint64_t v2 = *(void *)(v0 + 232);
  uint64_t v13 = *(void *)(v0 + 216);
  uint64_t v14 = *(void *)(v0 + 208);
  uint64_t v3 = *(void *)(v0 + 184);
  uint64_t v4 = *(void *)(v0 + 192);
  uint64_t v12 = *(void *)(v0 + 224);
  sub_10005E3F0();
  uint64_t v5 = *(void *)(v0 + 152);
  *(_OWORD *)(v0 + 112) = *(_OWORD *)(v0 + 136);
  *(void *)(v0 + 128) = v5;
  uint64_t v6 = sub_10005E750();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v4, 1, 1, v6);
  uint64_t v7 = sub_10005E790();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v3, 1, 1, v7);
  sub_10003CBA4();
  sub_10003CF80();
  sub_10005E350();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v1 + 16))(v10, v11, v2);
  sub_10005E370();
  sub_10005E3A0();
  (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v12, v14);
  swift_release();
  swift_release();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v1 + 8))(v11, v2);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v8 = *(uint64_t (**)(void))(v0 + 8);
  return v8();
}

uint64_t sub_10003F510()
{
  return sub_10003E5BC(&qword_1000804F0);
}

uint64_t sub_10003F534(uint64_t a1, uint64_t a2)
{
  return sub_100024B94(a1, a2, &qword_1000804F0);
}

unint64_t sub_10003F55C()
{
  unint64_t result = qword_100082298;
  if (!qword_100082298)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100082298);
  }
  return result;
}

unint64_t sub_10003F5B4()
{
  unint64_t result = qword_1000822A0;
  if (!qword_1000822A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000822A0);
  }
  return result;
}

uint64_t sub_10003F608()
{
  return *(void *)(swift_getOpaqueTypeConformance2() + 8);
}

uint64_t sub_10003F63C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100040524(a1, a2, a3, (void (*)(void))sub_10003CBA4);
}

uint64_t sub_10003F654@<X0>(uint64_t a1@<X8>)
{
  return sub_1000412FC(&qword_1000804E0, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_1000839C8, a1);
}

uint64_t sub_10003F68C@<X0>(uint64_t a1@<X8>)
{
  return sub_100024D90(&qword_1000804E8, (uint64_t)qword_1000839E0, a1);
}

uint64_t sub_10003F6B0(uint64_t a1)
{
  uint64_t v5 = *v1;
  uint64_t v4 = v1[1];
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v6;
  *uint64_t v6 = v2;
  v6[1] = sub_100009F48;
  return sub_10003EBF4(a1, v5, v4);
}

uint64_t sub_10003F75C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100041D00(0xD000000000000035, 0x80000001000627C0);
  *a1 = result;
  a1[1] = v3;
  return result;
}

unint64_t sub_10003F79C()
{
  return 0xD000000000000030;
}

uint64_t sub_10003F7BC()
{
  return sub_100009DAC(&qword_1000822B0, &qword_1000822B8);
}

uint64_t sub_10003F7F8(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return _swift_task_switch(sub_10003F818, 0, 0);
}

uint64_t sub_10003F818()
{
  if (qword_1000804B8 != -1) {
    swift_once();
  }
  uint64_t v1 = *(unsigned char **)(v0 + 16);
  unsigned char *v1 = [(id)qword_100083970 showInSearchEnabled];
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_10003F8C0(uint64_t a1, unsigned char *a2)
{
  *(unsigned char *)(v2 + 16) = *a2;
  return _swift_task_switch(sub_10003F8E4, 0, 0);
}

uint64_t sub_10003F8E4()
{
  if (qword_1000804B8 != -1) {
    swift_once();
  }
  [(id)qword_100083970 setShowInSearchEnabled:*(unsigned __int8 *)(v0 + 16)];
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_10003F988(uint64_t a1)
{
  return sub_100005E9C(a1, qword_100083A00);
}

uint64_t sub_10003F9AC(uint64_t a1)
{
  return sub_1000240D0(a1, qword_100083A18);
}

uint64_t sub_10003F9D0()
{
  uint64_t result = swift_getKeyPath();
  qword_100083A30 = result;
  return result;
}

uint64_t sub_10003F9F8()
{
  return swift_retain();
}

uint64_t sub_10003FA00(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[21] = a2;
  v3[22] = a3;
  v3[20] = a1;
  sub_100005268(&qword_100080AF0);
  v3[23] = swift_task_alloc();
  sub_100005268(&qword_100080AF8);
  v3[24] = swift_task_alloc();
  sub_100005268(&qword_100082418);
  v3[25] = swift_task_alloc();
  uint64_t v4 = sub_10005E390();
  v3[26] = v4;
  v3[27] = *(void *)(v4 - 8);
  v3[28] = swift_task_alloc();
  uint64_t v5 = sub_100005268(&qword_100082420);
  v3[29] = v5;
  v3[30] = *(void *)(v5 - 8);
  v3[31] = swift_task_alloc();
  v3[32] = swift_task_alloc();
  return _swift_task_switch(sub_10003FBC4, 0, 0);
}

uint64_t sub_10003FBC4()
{
  sub_10005E3F0();
  uint64_t v1 = *(void *)(v0 + 32);
  *(_OWORD *)(v0 + 40) = *(_OWORD *)(v0 + 16);
  *(void *)(v0 + 56) = v1;
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 264) = v2;
  unint64_t v3 = sub_100040BEC();
  *uint64_t v2 = v0;
  v2[1] = sub_10003FCA8;
  uint64_t v4 = *(void *)(v0 + 256);
  return IntentDialog._CapturedContent.init<>(entity:_:)(v4, v0 + 40, sub_1000403E0, 0, &type metadata for SiriAppClipsAccessEntity, v3);
}

uint64_t sub_10003FCA8()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_10003FDA4, 0, 0);
}

uint64_t sub_10003FDA4()
{
  sub_10005E3F0();
  uint64_t v1 = *(void *)(v0 + 64);
  *(void *)(v0 + 88) = v1;
  uint64_t v2 = *(void *)(v0 + 72);
  uint64_t v3 = *(void *)(v0 + 80);
  *(void *)(v0 + 272) = v1;
  *(void *)(v0 + 280) = v2;
  *(void *)(v0 + 288) = v3;
  *(void *)(v0 + 96) = v2;
  *(void *)(v0 + 104) = v3;
  sub_10005E3F0();
  *(unsigned char *)(v0 + 320) = *(unsigned char *)(v0 + 321);
  if (qword_100080508 != -1) {
    swift_once();
  }
  uint64_t v4 = qword_100083A30;
  *(void *)(v0 + 296) = qword_100083A30;
  swift_retain();
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v0 + 304) = v5;
  uint64_t v6 = sub_100009DAC(&qword_1000823D8, &qword_1000823E0);
  *uint64_t v5 = v0;
  v5[1] = sub_10003FF08;
  return AppEntity._setValue<A, B, C>(_:for:)(v0 + 320, v4, &type metadata for Bool, v6);
}

uint64_t sub_10003FF08()
{
  *(void *)(*(void *)v1 + 312) = v0;
  swift_task_dealloc();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  if (v0) {
    uint64_t v2 = sub_10004031C;
  }
  else {
    uint64_t v2 = sub_10004009C;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_10004009C()
{
  uint64_t v1 = *(void *)(v0 + 240);
  uint64_t v10 = *(void *)(v0 + 248);
  uint64_t v11 = *(void *)(v0 + 256);
  uint64_t v2 = *(void *)(v0 + 232);
  uint64_t v13 = *(void *)(v0 + 216);
  uint64_t v14 = *(void *)(v0 + 208);
  uint64_t v3 = *(void *)(v0 + 184);
  uint64_t v4 = *(void *)(v0 + 192);
  uint64_t v12 = *(void *)(v0 + 224);
  sub_10005E3F0();
  uint64_t v5 = *(void *)(v0 + 152);
  *(_OWORD *)(v0 + 112) = *(_OWORD *)(v0 + 136);
  *(void *)(v0 + 128) = v5;
  uint64_t v6 = sub_10005E750();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v4, 1, 1, v6);
  uint64_t v7 = sub_10005E790();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v3, 1, 1, v7);
  sub_10003CBF8();
  sub_10003CF80();
  sub_10005E350();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v1 + 16))(v10, v11, v2);
  sub_10005E370();
  sub_10005E3A0();
  (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v12, v14);
  swift_release();
  swift_release();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v1 + 8))(v11, v2);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v8 = *(uint64_t (**)(void))(v0 + 8);
  return v8();
}

uint64_t sub_10004031C()
{
  (*(void (**)(void, void))(v0[30] + 8))(v0[32], v0[29]);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_1000403E0()
{
  return sub_10003E5BC(&qword_100080508);
}

uint64_t sub_100040404(uint64_t a1, uint64_t a2)
{
  return sub_100024B94(a1, a2, &qword_100080508);
}

unint64_t sub_10004042C()
{
  unint64_t result = qword_1000822C0;
  if (!qword_1000822C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000822C0);
  }
  return result;
}

unint64_t sub_100040484()
{
  unint64_t result = qword_1000822C8;
  if (!qword_1000822C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000822C8);
  }
  return result;
}

uint64_t sub_1000404D8()
{
  return *(void *)(swift_getOpaqueTypeConformance2() + 8);
}

uint64_t sub_10004050C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100040524(a1, a2, a3, (void (*)(void))sub_10003CBF8);
}

uint64_t sub_100040524(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100040578@<X0>(uint64_t a1@<X8>)
{
  return sub_1000412FC(&qword_1000804F8, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_100083A00, a1);
}

uint64_t sub_1000405B0@<X0>(uint64_t a1@<X8>)
{
  return sub_100024D90(&qword_100080500, (uint64_t)qword_100083A18, a1);
}

uint64_t sub_1000405D4(uint64_t a1)
{
  uint64_t v5 = *v1;
  uint64_t v4 = v1[1];
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v6;
  *uint64_t v6 = v2;
  v6[1] = sub_1000042AC;
  return sub_10003FA00(a1, v5, v4);
}

uint64_t sub_100040680@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100041D00(0xD000000000000038, 0x80000001000626C0);
  *a1 = result;
  a1[1] = v3;
  return result;
}

unint64_t sub_1000406C0()
{
  return 0xD000000000000033;
}

unint64_t sub_1000406E0()
{
  unint64_t result = qword_1000822D8;
  if (!qword_1000822D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000822D8);
  }
  return result;
}

unint64_t sub_100040738()
{
  unint64_t result = qword_1000822E0;
  if (!qword_1000822E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000822E0);
  }
  return result;
}

uint64_t sub_10004078C(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return _swift_task_switch(sub_1000407AC, 0, 0);
}

uint64_t sub_1000407AC()
{
  if (qword_1000804B8 != -1) {
    swift_once();
  }
  uint64_t v1 = *(unsigned char **)(v0 + 16);
  unsigned char *v1 = [(id)qword_100083970 suggestAppClipsEnabled];
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_100040854(uint64_t a1, unsigned char *a2)
{
  *(unsigned char *)(v2 + 16) = *a2;
  return _swift_task_switch(sub_100040878, 0, 0);
}

uint64_t sub_100040878()
{
  if (qword_1000804B8 != -1) {
    swift_once();
  }
  [(id)qword_100083970 setSuggestAppClipsEnabled:*(unsigned __int8 *)(v0 + 16)];
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_10004091C()
{
  uint64_t result = sub_100042134();
  qword_100083A38 = result;
  unk_100083A40 = v1;
  qword_100083A48 = v2;
  return result;
}

uint64_t sub_100040944(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return _swift_task_switch(sub_100040964, 0, 0);
}

uint64_t sub_100040964()
{
  if (qword_100080510 != -1) {
    swift_once();
  }
  uint64_t v1 = *(void **)(v0 + 16);
  uint64_t v2 = unk_100083A40;
  uint64_t v3 = qword_100083A48;
  void *v1 = qword_100083A38;
  v1[1] = v2;
  v1[2] = v3;
  uint64_t v5 = *(uint64_t (**)(void))(v0 + 8);
  swift_retain();
  swift_retain();
  swift_retain();
  return v5();
}

unint64_t sub_100040A34()
{
  unint64_t result = qword_1000822F0;
  if (!qword_1000822F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000822F0);
  }
  return result;
}

uint64_t sub_100040A88(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v4;
  unint64_t v5 = sub_100040F30();
  *uint64_t v4 = v2;
  v4[1] = sub_100003BF0;
  return UniqueAppEntityQuery.allEntities()(a2, v5);
}

unint64_t sub_100040B3C()
{
  unint64_t result = qword_100082300;
  if (!qword_100082300)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100082300);
  }
  return result;
}

unint64_t sub_100040B94()
{
  unint64_t result = qword_100082308;
  if (!qword_100082308)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100082308);
  }
  return result;
}

unint64_t sub_100040BEC()
{
  unint64_t result = qword_100082310[0];
  if (!qword_100082310[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_100082310);
  }
  return result;
}

uint64_t sub_100040C40(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_100040F30();
  *unint64_t v5 = v2;
  v5[1] = sub_100003EE0;
  return UniqueAppEntityQuery.entities(for:)(a1, a2, v6);
}

uint64_t sub_100040CF4(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v4;
  unint64_t v5 = sub_100040F30();
  *uint64_t v4 = v2;
  v4[1] = sub_100005568;
  return UniqueAppEntityQuery.suggestedEntities()(a2, v5);
}

unint64_t sub_100040DA8()
{
  unint64_t result = qword_100082328;
  if (!qword_100082328)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100082328);
  }
  return result;
}

unint64_t sub_100040E04()
{
  unint64_t result = qword_100082330;
  if (!qword_100082330)
  {
    sub_1000041B0(qword_100082338);
    sub_10003CF80();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100082330);
  }
  return result;
}

uint64_t sub_100040E78(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_100040A34();
  *unint64_t v5 = v2;
  v5[1] = sub_100009F48;
  return EntityQuery.results()(a1, a2, v6);
}

unint64_t sub_100040F30()
{
  unint64_t result = qword_100082350;
  if (!qword_100082350)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100082350);
  }
  return result;
}

unint64_t sub_100040F88()
{
  unint64_t result = qword_100082358;
  if (!qword_100082358)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100082358);
  }
  return result;
}

uint64_t sub_100040FDC(uint64_t a1)
{
  unint64_t v2 = sub_100040BEC();

  return EntityURLRepresentation.init(_:)(0xD00000000000004DLL, 0x80000001000625C0, a1, v2);
}

unint64_t sub_10004103C()
{
  unint64_t result = qword_100082360;
  if (!qword_100082360)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100082360);
  }
  return result;
}

unint64_t sub_100041094()
{
  unint64_t result = qword_100082368;
  if (!qword_100082368)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100082368);
  }
  return result;
}

uint64_t sub_1000410E8()
{
  sub_100041970();
  uint64_t v2 = sub_10005E6A0();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
  return sub_10000538C(v3, v0, v2, v1);
}

unint64_t sub_100041180()
{
  unint64_t result = qword_100082378;
  if (!qword_100082378)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100082378);
  }
  return result;
}

unint64_t sub_1000411D8()
{
  unint64_t result = qword_100082380;
  if (!qword_100082380)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100082380);
  }
  return result;
}

unint64_t sub_100041230()
{
  unint64_t result = qword_100082388;
  if (!qword_100082388)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100082388);
  }
  return result;
}

uint64_t sub_100041284@<X0>(uint64_t *a1@<X8>)
{
  sub_100040738();
  uint64_t result = sub_10005E240();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_1000412C4@<X0>(uint64_t a1@<X8>)
{
  return sub_1000412FC(&qword_1000804C0, (uint64_t (*)(void))&type metadata accessor for TypeDisplayRepresentation, (uint64_t)qword_100083978, a1);
}

uint64_t sub_1000412FC@<X0>(void *a1@<X2>, uint64_t (*a2)(void)@<X3>, uint64_t a3@<X4>, uint64_t a4@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v7 = a2(0);
  uint64_t v8 = sub_1000052AC(v7, a3);
  uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 16);

  return v9(a4, v8, v7);
}

uint64_t sub_1000413A0()
{
  return sub_100009DAC(&qword_100082390, &qword_100082398);
}

uint64_t sub_1000413DC(uint64_t a1)
{
  unint64_t v2 = sub_100040BEC();

  return static AppEntity.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_10004142C()
{
  unint64_t result = qword_1000823A0;
  if (!qword_1000823A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000823A0);
  }
  return result;
}

uint64_t sub_100041480()
{
  uint64_t v0 = sub_100005268(&qword_100080878);
  __chkstk_darwin(v0 - 8);
  unint64_t v2 = (char *)&v10 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100005268(&qword_100080858);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10005E800();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  sub_10005E7E0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v7 + 56))(v5, 1, 1, v6);
  uint64_t v8 = sub_10005E5F0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v2, 1, 1, v8);
  return sub_10005E610();
}

uint64_t sub_100041650(uint64_t a1)
{
  unint64_t v2 = sub_100041230();

  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

ValueMetadata *type metadata accessor for SiriAppClipsAccessEntity.SiriAppClipsAccessEntityQuery()
{
  return &type metadata for SiriAppClipsAccessEntity.SiriAppClipsAccessEntityQuery;
}

ValueMetadata *type metadata accessor for SiriAppClipsAccessEntity.UpdateIntent_suggestAppClips()
{
  return &type metadata for SiriAppClipsAccessEntity.UpdateIntent_suggestAppClips;
}

ValueMetadata *type metadata accessor for SiriAppClipsAccessEntity.UpdateIntent_showInSearch()
{
  return &type metadata for SiriAppClipsAccessEntity.UpdateIntent_showInSearch;
}

ValueMetadata *type metadata accessor for SiriAppClipsAccessEntity.UpdateIntent_learnFromAppClips()
{
  return &type metadata for SiriAppClipsAccessEntity.UpdateIntent_learnFromAppClips;
}

uint64_t destroy for SiriAppClipsAccessEntity()
{
  swift_release();
  swift_release();

  return swift_release();
}

void *_s34AssistantSettingsControlsExtension24SiriAppClipsAccessEntityVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

void *assignWithCopy for SiriAppClipsAccessEntity(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  a1[2] = a2[2];
  swift_retain();
  swift_release();
  return a1;
}

__n128 initializeWithTake for SiriAppClipsAccessEntity(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for SiriAppClipsAccessEntity(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for SiriAppClipsAccessEntity(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 24)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SiriAppClipsAccessEntity(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 24) = 1;
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
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 24) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SiriAppClipsAccessEntity()
{
  return &type metadata for SiriAppClipsAccessEntity;
}

ValueMetadata *type metadata accessor for OpenSiriAppClipsAccessEntity()
{
  return &type metadata for OpenSiriAppClipsAccessEntity;
}

uint64_t sub_1000418F8()
{
  return sub_100009DAC(&qword_1000823A8, &qword_1000823B0);
}

uint64_t sub_100041934()
{
  return sub_100009DAC(&qword_1000823B8, &qword_1000823B0);
}

unint64_t sub_100041970()
{
  unint64_t result = qword_1000823C0;
  if (!qword_1000823C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000823C0);
  }
  return result;
}

uint64_t sub_1000419C4()
{
  v17[0] = sub_10005E720();
  uint64_t v0 = *(void *)(v17[0] - 8);
  __chkstk_darwin(v17[0]);
  uint64_t v2 = (char *)v17 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100005268(&qword_100080848);
  uint64_t v4 = __chkstk_darwin(v3 - 8);
  uint64_t v6 = (char *)v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)v17 - v7;
  uint64_t v9 = sub_100005268(&qword_100080858);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_10005E800();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  sub_100005268(&qword_100082408);
  sub_10005E7E0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56))(v11, 1, 1, v12);
  uint64_t v14 = sub_10005E390();
  memset(&v17[1], 0, 24);
  uint64_t v15 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56);
  v15(v8, 1, 1, v14);
  v15(v6, 1, 1, v14);
  (*(void (**)(char *, void, void))(v0 + 104))(v2, enum case for InputConnectionBehavior.default(_:), v17[0]);
  sub_100040BEC();
  return sub_10005E420();
}

uint64_t sub_100041CAC()
{
  return sub_100041D00(0xD00000000000003BLL, 0x80000001000628C0);
}

uint64_t sub_100041CC8()
{
  return sub_100041D00(0xD000000000000035, 0x80000001000627C0);
}

uint64_t sub_100041CE4()
{
  return sub_100041D00(0xD000000000000038, 0x80000001000626C0);
}

uint64_t sub_100041D00(uint64_t a1, uint64_t a2)
{
  uint64_t v30 = a1;
  uint64_t v31 = a2;
  uint64_t v2 = sub_100005268(&qword_100080A68);
  __chkstk_darwin(v2 - 8);
  uint64_t v32 = (char *)v24 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v33 = sub_10005E720();
  uint64_t v4 = *(void *)(v33 - 8);
  __chkstk_darwin(v33);
  uint64_t v6 = (char *)v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100005268(&qword_100080848);
  uint64_t v8 = __chkstk_darwin(v7 - 8);
  uint64_t v10 = (char *)v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v12 = (char *)v24 - v11;
  uint64_t v13 = sub_100005268(&qword_100080858);
  __chkstk_darwin(v13 - 8);
  uint64_t v15 = (char *)v24 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24[0] = v15;
  uint64_t v16 = sub_10005E800();
  uint64_t v29 = v16;
  uint64_t v17 = *(void *)(v16 - 8);
  __chkstk_darwin(v16);
  uint64_t v27 = sub_100005268(&qword_100082408);
  sub_10005E7E0();
  uint64_t v28 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v17 + 56);
  v28(v15, 1, 1, v16);
  uint64_t v18 = sub_10005E390();
  uint64_t v35 = 0;
  uint64_t v36 = 0;
  uint64_t v34 = 0;
  uint64_t v19 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56);
  v19(v12, 1, 1, v18);
  v19(v10, 1, 1, v18);
  unsigned int v26 = enum case for InputConnectionBehavior.default(_:);
  uint64_t v20 = *(void (**)(void))(v4 + 104);
  v24[1] = v4 + 104;
  uint64_t v25 = (void (*)(char *, void, uint64_t))v20;
  v20(v6);
  sub_100040BEC();
  uint64_t v21 = (char *)v24[0];
  uint64_t v27 = sub_10005E420();
  sub_100005268(&qword_100080A80);
  sub_10005E7E0();
  v28(v21, 1, 1, v29);
  LOBYTE(v34) = 2;
  uint64_t v22 = sub_10005E9F0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56))(v32, 1, 1, v22);
  v19(v12, 1, 1, v18);
  v25(v6, v26, v33);
  sub_10005E430();
  return v27;
}

uint64_t sub_100042134()
{
  uint64_t v0 = sub_10005E800();
  __chkstk_darwin(v0 - 8);
  sub_100005268(&qword_100082268);
  sub_10005E7E0();
  sub_100009DAC(&qword_1000823D8, &qword_1000823E0);
  uint64_t v1 = sub_10005E7C0();
  sub_100005268(&qword_100082290);
  sub_10005E7E0();
  sub_10005E7C0();
  sub_100005268(&qword_1000822B8);
  sub_10005E7E0();
  sub_10005E7C0();
  return v1;
}

uint64_t sub_100042350@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  *a2 = *(void *)(a1 + 16);
  return swift_retain();
}

uint64_t sub_10004235C@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  *a2 = *(void *)(a1 + 8);
  return swift_retain();
}

uint64_t sub_100042368@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  *a2 = *a1;
  return swift_retain();
}

unint64_t sub_100042374()
{
  unint64_t result = qword_100082458;
  if (!qword_100082458)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100082458);
  }
  return result;
}

unint64_t sub_1000423C8()
{
  unint64_t result = qword_100082460;
  if (!qword_100082460)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100082460);
  }
  return result;
}

uint64_t sub_100042424()
{
  return sub_100009DAC(&qword_100082468, &qword_100082470);
}

uint64_t sub_100042460(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[11] = a2;
  v3[12] = a3;
  v3[10] = a1;
  uint64_t v4 = sub_10005E670();
  v3[13] = v4;
  v3[14] = *(void *)(v4 - 8);
  v3[15] = swift_task_alloc();
  v3[16] = swift_task_alloc();
  v3[17] = swift_task_alloc();
  uint64_t v5 = sub_10005E390();
  v3[18] = v5;
  v3[19] = *(void *)(v5 - 8);
  v3[20] = swift_task_alloc();
  uint64_t v6 = sub_100005268(&qword_100082480);
  v3[21] = v6;
  v3[22] = *(void *)(v6 - 8);
  v3[23] = swift_task_alloc();
  v3[24] = swift_task_alloc();
  v3[25] = swift_task_alloc();
  return _swift_task_switch(sub_100042618, 0, 0);
}

uint64_t sub_100042618()
{
  uint64_t v1 = self;
  *(void *)(v0 + 208) = v1;
  id v2 = [v1 sharedController];
  unsigned int v3 = [v2 assistantIsEnabled];

  if (v3)
  {
    sub_10005E3F0();
    int v4 = *(unsigned __int8 *)(v0 + 364);
    id v5 = [v1 sharedController];
    id v6 = v5;
    if (v4 == 1)
    {
      uint64_t v7 = (unsigned __int8 *)(v0 + 370);
LABEL_10:
      sub_10005E3F0();
      [v6 setHardwareButtonAssistant:*v7];

      sub_10005E3F0();
      uint64_t v19 = *(void *)(v0 + 64);
      *(void *)(v0 + 328) = v19;
      *(void *)(v0 + 72) = v19;
      if (qword_1000803C8 != -1) {
        swift_once();
      }
      uint64_t v20 = qword_100083750;
      *(void *)(v0 + 336) = qword_100083750;
      swift_retain();
      uint64_t v21 = (void *)swift_task_alloc();
      *(void *)(v0 + 344) = v21;
      uint64_t v22 = sub_100009DAC(&qword_100081848, &qword_100081850);
      *uint64_t v21 = v0;
      v21[1] = sub_100043568;
      return AppEntity._value<A, B>(for:)(v0 + 361, v20, v22);
    }
    unsigned int v17 = [v5 isVoiceTriggerEnabled];

    if (v17)
    {
      uint64_t v7 = (unsigned __int8 *)(v0 + 369);
      id v18 = [v1 sharedController];
LABEL_9:
      id v6 = v18;
      goto LABEL_10;
    }
    uint64_t v24 = *(void *)(v0 + 152);
    uint64_t v23 = *(void *)(v0 + 160);
    uint64_t v25 = *(void *)(v0 + 144);
    *(_OWORD *)(v0 + 32) = *(_OWORD *)(v0 + 88);
    sub_100043AA0(0xD000000000000027, 0x8000000100062A50, v23);
    sub_10005E3C0();
    unsigned int v26 = *(void (**)(uint64_t, uint64_t))(v24 + 8);
    *(void *)(v0 + 216) = v26;
    *(void *)(v0 + 224) = (v24 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
    v26(v23, v25);
    sub_10005E660();
    uint64_t v27 = (void *)swift_task_alloc();
    *(void *)(v0 + 232) = v27;
    unint64_t v12 = sub_10001CB28();
    *(void *)(v0 + 240) = v12;
    uint64_t v13 = sub_100009DAC(&qword_100082488, &qword_100082480);
    *(void *)(v0 + 248) = v13;
    *uint64_t v27 = v0;
    v27[1] = sub_100042AD8;
    uint64_t v14 = *(void *)(v0 + 200);
    uint64_t v15 = *(void *)(v0 + 168);
    uint64_t v16 = *(void *)(v0 + 136);
  }
  else
  {
    sub_10005E3F0();
    if (*(unsigned char *)(v0 + 366) != 1)
    {
      uint64_t v7 = (unsigned __int8 *)(v0 + 365);
      id v18 = [v1 sharedController];
      goto LABEL_9;
    }
    uint64_t v9 = *(void *)(v0 + 152);
    uint64_t v8 = *(void *)(v0 + 160);
    uint64_t v10 = *(void *)(v0 + 144);
    *(_OWORD *)(v0 + 48) = *(_OWORD *)(v0 + 88);
    sub_100043AA0(0xD000000000000018, 0x8000000100062AA0, v8);
    sub_10005E3C0();
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v8, v10);
    sub_10005E660();
    uint64_t v11 = (void *)swift_task_alloc();
    *(void *)(v0 + 312) = v11;
    unint64_t v12 = sub_10001CB28();
    uint64_t v13 = sub_100009DAC(&qword_100082488, &qword_100082480);
    *uint64_t v11 = v0;
    v11[1] = sub_1000431C4;
    uint64_t v14 = *(void *)(v0 + 184);
    uint64_t v15 = *(void *)(v0 + 168);
    uint64_t v16 = *(void *)(v0 + 120);
  }
  return AppIntent.requestConfirmation<A>(result:confirmationActionName:showPrompt:)(v14, v16, 1, &type metadata for TalkToSiriEntity.UpdateIntent_value, v15, v12, v13);
}

uint64_t sub_100042AD8()
{
  id v2 = *(void **)v1;
  uint64_t v3 = *(void *)(*(void *)v1 + 200);
  uint64_t v4 = *(void *)(*(void *)v1 + 176);
  uint64_t v5 = *(void *)(*(void *)v1 + 168);
  uint64_t v6 = *(void *)(*(void *)v1 + 136);
  uint64_t v7 = *(void *)(*(void *)v1 + 112);
  uint64_t v8 = *(void *)(*(void *)v1 + 104);
  v2[32] = v0;
  swift_task_dealloc();
  uint64_t v9 = *(void (**)(uint64_t, uint64_t))(v7 + 8);
  v2[33] = v9;
  v2[34] = (v7 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v9(v6, v8);
  uint64_t v10 = *(void (**)(uint64_t, uint64_t))(v4 + 8);
  v2[35] = v10;
  v2[36] = (v4 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v10(v3, v5);
  if (v0) {
    uint64_t v11 = sub_1000437B0;
  }
  else {
    uint64_t v11 = sub_100042CC4;
  }
  return _swift_task_switch(v11, 0, 0);
}

uint64_t sub_100042CC4()
{
  uint64_t v1 = *(void (**)(uint64_t, uint64_t))(v0 + 216);
  uint64_t v2 = *(void *)(v0 + 160);
  uint64_t v3 = *(void *)(v0 + 144);
  *(_OWORD *)(v0 + 16) = *(_OWORD *)(v0 + 88);
  sub_100043AA0(0xD00000000000002CLL, 0x80000001000629F0, v2);
  sub_10005E3C0();
  v1(v2, v3);
  sub_10005E660();
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v0 + 296) = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_100042E08;
  uint64_t v5 = *(void *)(v0 + 240);
  uint64_t v6 = *(void *)(v0 + 248);
  uint64_t v7 = *(void *)(v0 + 192);
  uint64_t v8 = *(void *)(v0 + 168);
  uint64_t v9 = *(void *)(v0 + 128);
  return AppIntent.requestConfirmation<A>(result:confirmationActionName:showPrompt:)(v7, v9, 1, &type metadata for TalkToSiriEntity.UpdateIntent_value, v8, v5, v6);
}

uint64_t sub_100042E08()
{
  uint64_t v2 = *(void (**)(uint64_t, uint64_t))(*(void *)v1 + 280);
  uint64_t v3 = *(void (**)(uint64_t, uint64_t))(*(void *)v1 + 264);
  uint64_t v4 = *(void *)(*(void *)v1 + 192);
  uint64_t v5 = *(void *)(*(void *)v1 + 168);
  uint64_t v6 = *(void *)(*(void *)v1 + 128);
  uint64_t v7 = *(void *)(*(void *)v1 + 104);
  *(void *)(*(void *)v1 + 304) = v0;
  swift_task_dealloc();
  v3(v6, v7);
  v2(v4, v5);
  if (v0) {
    uint64_t v8 = sub_10004386C;
  }
  else {
    uint64_t v8 = sub_100042FF4;
  }
  return _swift_task_switch(v8, 0, 0);
}

uint64_t sub_100042FF4()
{
  uint64_t v1 = *(void **)(v0 + 208);
  id v2 = [v1 sharedController];
  sub_10005E3F0();
  [v2 setHardwareButtonAssistant:*(unsigned __int8 *)(v0 + 367)];

  id v3 = [v1 sharedController];
  sub_10005E3F0();
  [v3 setAssistantIsEnabled:*(unsigned __int8 *)(v0 + 368)];

  sub_10005E3F0();
  uint64_t v4 = *(void *)(v0 + 64);
  *(void *)(v0 + 72) = v4;
  *(void *)(v0 + 328) = v4;
  if (qword_1000803C8 != -1) {
    swift_once();
  }
  uint64_t v5 = qword_100083750;
  *(void *)(v0 + 336) = qword_100083750;
  swift_retain();
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v0 + 344) = v6;
  uint64_t v7 = sub_100009DAC(&qword_100081848, &qword_100081850);
  *uint64_t v6 = v0;
  v6[1] = sub_100043568;
  return AppEntity._value<A, B>(for:)(v0 + 361, v5, v7);
}

uint64_t sub_1000431C4()
{
  uint64_t v2 = *(void *)(*(void *)v1 + 184);
  uint64_t v3 = *(void *)(*(void *)v1 + 176);
  uint64_t v4 = *(void *)(*(void *)v1 + 168);
  uint64_t v5 = *(void *)(*(void *)v1 + 120);
  uint64_t v6 = *(void *)(*(void *)v1 + 112);
  uint64_t v7 = *(void *)(*(void *)v1 + 104);
  *(void *)(*(void *)v1 + 320) = v0;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  if (v0) {
    uint64_t v8 = sub_100043928;
  }
  else {
    uint64_t v8 = sub_100043398;
  }
  return _swift_task_switch(v8, 0, 0);
}

uint64_t sub_100043398()
{
  uint64_t v1 = *(void **)(v0 + 208);
  id v2 = [v1 sharedController];
  sub_10005E3F0();
  [v2 setHardwareButtonAssistant:*(unsigned __int8 *)(v0 + 362)];

  id v3 = [v1 sharedController];
  sub_10005E3F0();
  [v3 setAssistantIsEnabled:*(unsigned __int8 *)(v0 + 363)];

  sub_10005E3F0();
  uint64_t v4 = *(void *)(v0 + 64);
  *(void *)(v0 + 72) = v4;
  *(void *)(v0 + 328) = v4;
  if (qword_1000803C8 != -1) {
    swift_once();
  }
  uint64_t v5 = qword_100083750;
  *(void *)(v0 + 336) = qword_100083750;
  swift_retain();
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v0 + 344) = v6;
  uint64_t v7 = sub_100009DAC(&qword_100081848, &qword_100081850);
  *uint64_t v6 = v0;
  v6[1] = sub_100043568;
  return AppEntity._value<A, B>(for:)(v0 + 361, v5, v7);
}

uint64_t sub_100043568()
{
  *(void *)(*(void *)v1 + 352) = v0;
  swift_task_dealloc();
  swift_release();
  swift_release();
  if (v0) {
    id v2 = sub_1000439E4;
  }
  else {
    id v2 = sub_1000436BC;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_1000436BC()
{
  *(unsigned char *)(v0 + 360) = *(unsigned char *)(v0 + 361);
  sub_10003CC54();
  sub_10005E3B0();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1000437B0()
{
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_10004386C()
{
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_100043928()
{
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1000439E4()
{
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_100043AA0@<X0>(uint64_t a1@<X4>, uint64_t a2@<X5>, uint64_t a3@<X8>)
{
  v14[0] = a1;
  v14[1] = a2;
  v14[2] = a3;
  uint64_t v3 = sub_10005E7F0();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_10005E830();
  __chkstk_darwin(v7 - 8);
  uint64_t v8 = sub_10005E990();
  __chkstk_darwin(v8 - 8);
  uint64_t v9 = sub_10005E800();
  uint64_t v10 = __chkstk_darwin(v9 - 8);
  __chkstk_darwin(v10);
  sub_10005E980();
  sub_10005E820();
  uint64_t v11 = enum case for LocalizedStringResource.BundleDescription.main(_:);
  unint64_t v12 = *(void (**)(char *, uint64_t, uint64_t))(v4 + 104);
  v12(v6, enum case for LocalizedStringResource.BundleDescription.main(_:), v3);
  sub_10005E810();
  sub_10005E980();
  sub_10005E820();
  v12(v6, v11, v3);
  sub_10005E810();
  return sub_10005E380();
}

unint64_t sub_100043D40()
{
  unint64_t result = qword_1000824A0;
  if (!qword_1000824A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000824A0);
  }
  return result;
}

uint64_t sub_100043D94()
{
  return sub_10004A770(&qword_1000824A8, (void (*)(uint64_t))type metadata accessor for SiriAppAccessForAppEntity);
}

uint64_t type metadata accessor for SiriAppAccessForAppEntity()
{
  uint64_t result = qword_100082678;
  if (!qword_100082678) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_100043E28(uint64_t a1)
{
  return sub_100005E9C(a1, qword_100083A50);
}

uint64_t sub_100043E4C(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for SiriAppAccessForAppEntity();
  __chkstk_darwin(v2 - 8);
  sub_10004A64C(a1, (uint64_t)&v5 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_10005E400();
  return sub_10004A6B0(a1);
}

uint64_t sub_100043EE0(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_10004B1B8();
  uint64_t v5 = sub_10004A770(&qword_1000826D8, (void (*)(uint64_t))type metadata accessor for SiriAppAccessForAppEntity);

  return static URLRepresentableIntent<>.urlRepresentation.getter(a1, v4, a2, v5);
}

unint64_t sub_100043F7C()
{
  unint64_t result = qword_1000824B0;
  if (!qword_1000824B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000824B0);
  }
  return result;
}

unint64_t sub_100043FD4()
{
  unint64_t result = qword_1000824B8;
  if (!qword_1000824B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000824B8);
  }
  return result;
}

uint64_t sub_100044028(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1000483B0(a1, a2, a3, (void (*)(void))sub_10003C7B4);
}

uint64_t sub_100044040@<X0>(uint64_t a1@<X8>)
{
  return sub_1000498E4(&qword_100080518, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_100083A50, a1);
}

uint64_t sub_100044078(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  unint64_t v5 = sub_10004B1B8();
  unint64_t v6 = sub_10004B20C();
  uint64_t v7 = sub_10004A770(&qword_1000826D8, (void (*)(uint64_t))type metadata accessor for SiriAppAccessForAppEntity);
  *unint64_t v4 = v2;
  v4[1] = sub_100003184;
  return URLRepresentableIntent<>.perform()(a2, v5, v6, v7);
}

uint64_t sub_100044174@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10004A7B8();
  *a1 = result;
  return result;
}

uint64_t sub_10004419C(uint64_t a1)
{
  unint64_t v2 = sub_10003C7B4();

  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

uint64_t sub_1000441DC()
{
  return sub_100009DAC(&qword_1000824C8, &qword_1000824D0);
}

id sub_100044218(uint64_t a1)
{
  return sub_100044240(a1, (uint64_t)ASFController_ptr, &qword_100083A68);
}

id sub_10004422C(uint64_t a1)
{
  return sub_100044240(a1, (uint64_t)ASFSuggestionsController_ptr, &qword_100083A70);
}

id sub_100044240(uint64_t a1, uint64_t a2, void *a3)
{
  id result = [self sharedController];
  *a3 = result;
  return result;
}

uint64_t sub_100044280()
{
  uint64_t v0 = sub_100005268(&qword_100080858);
  __chkstk_darwin(v0 - 8);
  unint64_t v2 = (char *)v12 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12[0] = sub_10005E7F0();
  uint64_t v3 = *(void *)(v12[0] - 8);
  __chkstk_darwin(v12[0]);
  unint64_t v5 = (char *)v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10005E830();
  __chkstk_darwin(v6 - 8);
  uint64_t v7 = sub_10005E990();
  __chkstk_darwin(v7 - 8);
  uint64_t v8 = sub_10005E800();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v10 = sub_10005E780();
  sub_1000052E4(v10, qword_100083A78);
  sub_1000052AC(v10, (uint64_t)qword_100083A78);
  sub_10005E980();
  sub_10005E820();
  (*(void (**)(char *, void, void))(v3 + 104))(v5, enum case for LocalizedStringResource.BundleDescription.main(_:), v12[0]);
  sub_10005E810();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(v2, 1, 1, v8);
  return sub_10005E770();
}

uint64_t sub_10004456C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v25 = a3;
  uint64_t v26 = a4;
  uint64_t v23 = a1;
  uint64_t v24 = a2;
  uint64_t v6 = sub_100005268(&qword_100080878);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_100005268(&qword_100080858);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_10005E800();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  uint64_t v14 = (int *)type metadata accessor for SiriAppAccessForAppEntity();
  uint64_t v15 = v14[6];
  sub_100005268(&qword_1000824D0);
  sub_10005E7E0();
  sub_100009DAC(&qword_100082710, &qword_100082718);
  *(void *)(a5 + v15) = sub_10005E7C0();
  uint64_t v16 = v14[7];
  sub_100005268(&qword_1000824F8);
  sub_10005E7E0();
  *(void *)(a5 + v16) = sub_10005E7C0();
  uint64_t v17 = v14[8];
  sub_100005268(&qword_100082520);
  sub_10005E7E0();
  *(void *)(a5 + v17) = sub_10005E7C0();
  uint64_t v18 = v14[9];
  sub_100005268(&qword_100082550);
  sub_10005E7E0();
  *(void *)(a5 + v18) = sub_10005E7C0();
  uint64_t v19 = (void *)(a5 + v14[5]);
  uint64_t v20 = v24;
  *uint64_t v19 = v23;
  v19[1] = v20;
  sub_10005E7E0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56))(v11, 1, 1, v12);
  uint64_t v21 = sub_10005E5F0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56))(v8, 1, 1, v21);
  return sub_10005E610();
}

uint64_t sub_100044988(uint64_t a1)
{
  return sub_100005E9C(a1, qword_100083A90);
}

uint64_t sub_1000449AC(uint64_t a1)
{
  return sub_1000240D0(a1, qword_100083AA8);
}

uint64_t sub_1000449D0()
{
  uint64_t result = swift_getKeyPath();
  qword_100083AC0 = result;
  return result;
}

uint64_t sub_1000449F8()
{
  type metadata accessor for SiriAppAccessForAppEntity();

  return swift_retain();
}

uint64_t sub_100044A2C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  sub_100005268(&qword_100080AF0);
  v3[5] = swift_task_alloc();
  sub_100005268(&qword_100080AF8);
  v3[6] = swift_task_alloc();
  sub_100005268(&qword_1000827B0);
  v3[7] = swift_task_alloc();
  uint64_t v4 = sub_10005E390();
  v3[8] = v4;
  v3[9] = *(void *)(v4 - 8);
  v3[10] = swift_task_alloc();
  v3[11] = type metadata accessor for SiriAppAccessForAppEntity();
  v3[12] = swift_task_alloc();
  v3[13] = swift_task_alloc();
  uint64_t v5 = sub_100005268(&qword_100082770);
  v3[14] = v5;
  v3[15] = *(void *)(v5 - 8);
  v3[16] = swift_task_alloc();
  v3[17] = swift_task_alloc();
  return _swift_task_switch(sub_100044C30, 0, 0);
}

uint64_t sub_100044C30()
{
  sub_10005E3F0();
  uint64_t v1 = (void *)swift_task_alloc();
  v0[18] = v1;
  uint64_t v2 = sub_10004A770(qword_100082590, (void (*)(uint64_t))type metadata accessor for SiriAppAccessForAppEntity);
  void *v1 = v0;
  v1[1] = sub_100044D2C;
  uint64_t v3 = v0[17];
  uint64_t v4 = v0[13];
  uint64_t v5 = v0[11];
  return IntentDialog._CapturedContent.init<>(entity:_:)(v3, v4, sub_100045378, 0, v5, v2);
}

uint64_t sub_100044D2C()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_100044E28, 0, 0);
}

uint64_t sub_100044E28()
{
  sub_10005E3F0();
  sub_10005E3F0();
  *(unsigned char *)(v0 + 177) = *(unsigned char *)(v0 + 176);
  if (qword_100080548 != -1) {
    swift_once();
  }
  uint64_t v1 = qword_100083AC0;
  *(void *)(v0 + 152) = qword_100083AC0;
  swift_retain();
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 160) = v2;
  uint64_t v3 = sub_100009DAC(&qword_100082710, &qword_100082718);
  *uint64_t v2 = v0;
  v2[1] = sub_100044F74;
  return AppEntity._setValue<A, B, C>(_:for:)(v0 + 177, v1, &type metadata for Bool, v3);
}

uint64_t sub_100044F74()
{
  uint64_t v2 = *(void *)(*(void *)v1 + 96);
  *(void *)(*(void *)v1 + 168) = v0;
  swift_task_dealloc();
  sub_10004A6B0(v2);
  swift_release();
  if (v0) {
    uint64_t v3 = sub_10004B264;
  }
  else {
    uint64_t v3 = sub_1000450C8;
  }
  return _swift_task_switch(v3, 0, 0);
}

uint64_t sub_1000450C8()
{
  uint64_t v1 = v0[16];
  uint64_t v2 = v0[15];
  uint64_t v11 = v0[13];
  uint64_t v12 = v0[17];
  uint64_t v9 = v0[10];
  uint64_t v10 = v0[14];
  uint64_t v13 = v0[9];
  uint64_t v14 = v0[8];
  uint64_t v3 = v0[5];
  uint64_t v4 = v0[6];
  sub_10005E3F0();
  uint64_t v5 = sub_10005E750();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56))(v4, 1, 1, v5);
  uint64_t v6 = sub_10005E790();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v3, 1, 1, v6);
  sub_10003CA54();
  sub_10004A770(&qword_100082108, (void (*)(uint64_t))type metadata accessor for SiriAppAccessForAppEntity);
  sub_10005E350();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v12, v10);
  sub_10005E370();
  sub_10005E3A0();
  (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v9, v14);
  sub_10004A6B0(v11);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v12, v10);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v7 = (uint64_t (*)(void))v0[1];
  return v7();
}

uint64_t sub_100045378()
{
  return sub_10004539C(&qword_100080548);
}

uint64_t sub_10004539C(void *a1)
{
  uint64_t v2 = sub_100005268(&qword_100082778);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*a1 != -1) {
    swift_once();
  }
  swift_retain();
  sub_10005E5D0();
  swift_release();
  type metadata accessor for SiriAppAccessForAppEntity();
  sub_10004A770(&qword_100082108, (void (*)(uint64_t))type metadata accessor for SiriAppAccessForAppEntity);
  sub_100009DAC(&qword_100082780, &qword_100082778);
  sub_10005E5C0();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_10004553C(uint64_t a1, uint64_t a2)
{
  return sub_100024B94(a1, a2, &qword_100080548);
}

unint64_t sub_100045564()
{
  unint64_t result = qword_1000824D8;
  if (!qword_1000824D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000824D8);
  }
  return result;
}

unint64_t sub_1000455BC()
{
  unint64_t result = qword_1000824E0;
  if (!qword_1000824E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000824E0);
  }
  return result;
}

uint64_t sub_100045610()
{
  return *(void *)(swift_getOpaqueTypeConformance2() + 8);
}

uint64_t sub_100045644(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1000483B0(a1, a2, a3, (void (*)(void))sub_10003CA54);
}

uint64_t sub_10004565C@<X0>(uint64_t a1@<X8>)
{
  return sub_1000498E4(&qword_100080538, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_100083A90, a1);
}

uint64_t sub_100045694@<X0>(uint64_t a1@<X8>)
{
  return sub_100024D90(&qword_100080540, (uint64_t)qword_100083AA8, a1);
}

uint64_t sub_1000456B8(uint64_t a1)
{
  uint64_t v5 = *v1;
  uint64_t v4 = v1[1];
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v6;
  *uint64_t v6 = v2;
  v6[1] = sub_100009F48;
  return sub_100044A2C(a1, v5, v4);
}

uint64_t sub_100045764@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10004AB88(0xD000000000000034, 0x8000000100062EE0);
  *a1 = result;
  a1[1] = v3;
  return result;
}

unint64_t sub_1000457A4()
{
  return 0xD00000000000003DLL;
}

uint64_t sub_1000457C4()
{
  return sub_100009DAC(&qword_1000824F0, &qword_1000824F8);
}

uint64_t sub_100045800(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return _swift_task_switch(sub_100045820, 0, 0);
}

uint64_t sub_100045820()
{
  if (qword_100080520 != -1) {
    swift_once();
  }
  uint64_t v1 = *(unsigned __int8 **)(v0 + 16);
  uint64_t v2 = (void *)qword_100083A68;
  type metadata accessor for SiriAppAccessForAppEntity();
  id v3 = v2;
  NSString v4 = sub_10005E9A0();
  unsigned __int8 v5 = [v3 isLearningEnabledForApp:v4];

  unsigned __int8 *v1 = v5;
  uint64_t v6 = *(uint64_t (**)(void))(v0 + 8);
  return v6();
}

uint64_t sub_100045910(uint64_t a1, unsigned char *a2)
{
  *(void *)(v2 + 16) = a1;
  *(unsigned char *)(v2 + 24) = *a2;
  return _swift_task_switch(sub_100045938, 0, 0);
}

uint64_t sub_100045938()
{
  if (qword_100080520 != -1) {
    swift_once();
  }
  uint64_t v1 = *(unsigned __int8 *)(v0 + 24);
  uint64_t v2 = (void *)qword_100083A68;
  type metadata accessor for SiriAppAccessForAppEntity();
  id v3 = v2;
  NSString v4 = sub_10005E9A0();
  [v3 setLearningForApp:v4 enabled:v1];

  unsigned __int8 v5 = *(uint64_t (**)(void))(v0 + 8);
  return v5();
}

uint64_t sub_100045A28(uint64_t a1)
{
  return sub_100005E9C(a1, qword_100083AC8);
}

uint64_t sub_100045A4C(uint64_t a1)
{
  return sub_1000240D0(a1, qword_100083AE0);
}

uint64_t sub_100045A70()
{
  uint64_t result = swift_getKeyPath();
  qword_100083AF8 = result;
  return result;
}

uint64_t sub_100045A98()
{
  type metadata accessor for SiriAppAccessForAppEntity();

  return swift_retain();
}

uint64_t sub_100045ACC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  sub_100005268(&qword_100080AF0);
  v3[5] = swift_task_alloc();
  sub_100005268(&qword_100080AF8);
  v3[6] = swift_task_alloc();
  sub_100005268(&qword_1000827A0);
  v3[7] = swift_task_alloc();
  uint64_t v4 = sub_10005E390();
  v3[8] = v4;
  v3[9] = *(void *)(v4 - 8);
  v3[10] = swift_task_alloc();
  v3[11] = type metadata accessor for SiriAppAccessForAppEntity();
  v3[12] = swift_task_alloc();
  v3[13] = swift_task_alloc();
  uint64_t v5 = sub_100005268(&qword_100082770);
  v3[14] = v5;
  v3[15] = *(void *)(v5 - 8);
  v3[16] = swift_task_alloc();
  v3[17] = swift_task_alloc();
  return _swift_task_switch(sub_100045CD0, 0, 0);
}

uint64_t sub_100045CD0()
{
  sub_10005E3F0();
  uint64_t v1 = (void *)swift_task_alloc();
  v0[18] = v1;
  uint64_t v2 = sub_10004A770(qword_100082590, (void (*)(uint64_t))type metadata accessor for SiriAppAccessForAppEntity);
  void *v1 = v0;
  v1[1] = sub_100045DCC;
  uint64_t v3 = v0[17];
  uint64_t v4 = v0[13];
  uint64_t v5 = v0[11];
  return IntentDialog._CapturedContent.init<>(entity:_:)(v3, v4, sub_100046418, 0, v5, v2);
}

uint64_t sub_100045DCC()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_100045EC8, 0, 0);
}

uint64_t sub_100045EC8()
{
  sub_10005E3F0();
  sub_10005E3F0();
  *(unsigned char *)(v0 + 177) = *(unsigned char *)(v0 + 176);
  if (qword_100080560 != -1) {
    swift_once();
  }
  uint64_t v1 = qword_100083AF8;
  *(void *)(v0 + 152) = qword_100083AF8;
  swift_retain();
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 160) = v2;
  uint64_t v3 = sub_100009DAC(&qword_100082710, &qword_100082718);
  *uint64_t v2 = v0;
  v2[1] = sub_100046014;
  return AppEntity._setValue<A, B, C>(_:for:)(v0 + 177, v1, &type metadata for Bool, v3);
}

uint64_t sub_100046014()
{
  uint64_t v2 = *(void *)(*(void *)v1 + 96);
  *(void *)(*(void *)v1 + 168) = v0;
  swift_task_dealloc();
  sub_10004A6B0(v2);
  swift_release();
  if (v0) {
    uint64_t v3 = sub_100006990;
  }
  else {
    uint64_t v3 = sub_100046168;
  }
  return _swift_task_switch(v3, 0, 0);
}

uint64_t sub_100046168()
{
  uint64_t v1 = v0[16];
  uint64_t v2 = v0[15];
  uint64_t v11 = v0[13];
  uint64_t v12 = v0[17];
  uint64_t v9 = v0[10];
  uint64_t v10 = v0[14];
  uint64_t v13 = v0[9];
  uint64_t v14 = v0[8];
  uint64_t v3 = v0[5];
  uint64_t v4 = v0[6];
  sub_10005E3F0();
  uint64_t v5 = sub_10005E750();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56))(v4, 1, 1, v5);
  uint64_t v6 = sub_10005E790();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v3, 1, 1, v6);
  sub_10003CAA8();
  sub_10004A770(&qword_100082108, (void (*)(uint64_t))type metadata accessor for SiriAppAccessForAppEntity);
  sub_10005E350();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v12, v10);
  sub_10005E370();
  sub_10005E3A0();
  (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v9, v14);
  sub_10004A6B0(v11);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v12, v10);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v7 = (uint64_t (*)(void))v0[1];
  return v7();
}

uint64_t sub_100046418()
{
  return sub_10004539C(&qword_100080560);
}

uint64_t sub_10004643C(uint64_t a1, uint64_t a2)
{
  return sub_100024B94(a1, a2, &qword_100080560);
}

unint64_t sub_100046464()
{
  unint64_t result = qword_100082500;
  if (!qword_100082500)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100082500);
  }
  return result;
}

unint64_t sub_1000464BC()
{
  unint64_t result = qword_100082508;
  if (!qword_100082508)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100082508);
  }
  return result;
}

uint64_t sub_100046510()
{
  return *(void *)(swift_getOpaqueTypeConformance2() + 8);
}

uint64_t sub_100046544(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1000483B0(a1, a2, a3, (void (*)(void))sub_10003CAA8);
}

uint64_t sub_10004655C@<X0>(uint64_t a1@<X8>)
{
  return sub_1000498E4(&qword_100080550, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_100083AC8, a1);
}

uint64_t sub_100046594@<X0>(uint64_t a1@<X8>)
{
  return sub_100024D90(&qword_100080558, (uint64_t)qword_100083AE0, a1);
}

uint64_t sub_1000465B8(uint64_t a1)
{
  uint64_t v5 = *v1;
  uint64_t v4 = v1[1];
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v6;
  *uint64_t v6 = v2;
  v6[1] = sub_1000042AC;
  return sub_100045ACC(a1, v5, v4);
}

uint64_t sub_100046664@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10004AB88(0xD000000000000034, 0x8000000100062DE0);
  *a1 = result;
  a1[1] = v3;
  return result;
}

unint64_t sub_1000466A4()
{
  return 0xD000000000000044;
}

uint64_t sub_1000466C4()
{
  return sub_100009DAC(&qword_100082518, &qword_100082520);
}

uint64_t sub_100046700(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return _swift_task_switch(sub_100046720, 0, 0);
}

uint64_t sub_100046720()
{
  if (qword_100080528 != -1) {
    swift_once();
  }
  uint64_t v1 = *(unsigned __int8 **)(v0 + 16);
  uint64_t v2 = (void *)qword_100083A70;
  type metadata accessor for SiriAppAccessForAppEntity();
  id v3 = v2;
  NSString v4 = sub_10005E9A0();
  unsigned __int8 v5 = [v3 suggestionsShowOnHomeScreenEnabledForBundleId:v4];

  unsigned __int8 *v1 = v5;
  uint64_t v6 = *(uint64_t (**)(void))(v0 + 8);
  return v6();
}

uint64_t sub_100046810(uint64_t a1, unsigned char *a2)
{
  *(void *)(v2 + 16) = a1;
  *(unsigned char *)(v2 + 24) = *a2;
  return _swift_task_switch(sub_100046838, 0, 0);
}

uint64_t sub_100046838()
{
  if (qword_100080528 != -1) {
    swift_once();
  }
  uint64_t v1 = *(unsigned __int8 *)(v0 + 24);
  uint64_t v2 = (void *)qword_100083A70;
  type metadata accessor for SiriAppAccessForAppEntity();
  id v3 = v2;
  NSString v4 = sub_10005E9A0();
  [v3 setSuggestionsShowOnHomeScreenEnabled:v1 bundleId:v4];

  unsigned __int8 v5 = *(uint64_t (**)(void))(v0 + 8);
  return v5();
}

uint64_t sub_100046928(uint64_t a1)
{
  return sub_100005E9C(a1, qword_100083B00);
}

uint64_t sub_10004694C(uint64_t a1)
{
  return sub_1000240D0(a1, qword_100083B18);
}

uint64_t sub_100046970()
{
  uint64_t result = swift_getKeyPath();
  qword_100083B30 = result;
  return result;
}

uint64_t sub_100046998()
{
  type metadata accessor for SiriAppAccessForAppEntity();

  return swift_retain();
}

uint64_t sub_1000469CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  sub_100005268(&qword_100080AF0);
  v3[5] = swift_task_alloc();
  sub_100005268(&qword_100080AF8);
  v3[6] = swift_task_alloc();
  sub_100005268(&qword_100082790);
  v3[7] = swift_task_alloc();
  uint64_t v4 = sub_10005E390();
  v3[8] = v4;
  v3[9] = *(void *)(v4 - 8);
  v3[10] = swift_task_alloc();
  v3[11] = type metadata accessor for SiriAppAccessForAppEntity();
  v3[12] = swift_task_alloc();
  v3[13] = swift_task_alloc();
  uint64_t v5 = sub_100005268(&qword_100082770);
  v3[14] = v5;
  v3[15] = *(void *)(v5 - 8);
  v3[16] = swift_task_alloc();
  v3[17] = swift_task_alloc();
  return _swift_task_switch(sub_100046BD0, 0, 0);
}

uint64_t sub_100046BD0()
{
  sub_10005E3F0();
  uint64_t v1 = (void *)swift_task_alloc();
  v0[18] = v1;
  uint64_t v2 = sub_10004A770(qword_100082590, (void (*)(uint64_t))type metadata accessor for SiriAppAccessForAppEntity);
  void *v1 = v0;
  v1[1] = sub_100046CCC;
  uint64_t v3 = v0[17];
  uint64_t v4 = v0[13];
  uint64_t v5 = v0[11];
  return IntentDialog._CapturedContent.init<>(entity:_:)(v3, v4, sub_100047318, 0, v5, v2);
}

uint64_t sub_100046CCC()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_100046DC8, 0, 0);
}

uint64_t sub_100046DC8()
{
  sub_10005E3F0();
  sub_10005E3F0();
  *(unsigned char *)(v0 + 177) = *(unsigned char *)(v0 + 176);
  if (qword_100080578 != -1) {
    swift_once();
  }
  uint64_t v1 = qword_100083B30;
  *(void *)(v0 + 152) = qword_100083B30;
  swift_retain();
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 160) = v2;
  uint64_t v3 = sub_100009DAC(&qword_100082710, &qword_100082718);
  *uint64_t v2 = v0;
  v2[1] = sub_100046F14;
  return AppEntity._setValue<A, B, C>(_:for:)(v0 + 177, v1, &type metadata for Bool, v3);
}

uint64_t sub_100046F14()
{
  uint64_t v2 = *(void *)(*(void *)v1 + 96);
  *(void *)(*(void *)v1 + 168) = v0;
  swift_task_dealloc();
  sub_10004A6B0(v2);
  swift_release();
  if (v0) {
    uint64_t v3 = sub_10004B264;
  }
  else {
    uint64_t v3 = sub_100047068;
  }
  return _swift_task_switch(v3, 0, 0);
}

uint64_t sub_100047068()
{
  uint64_t v1 = v0[16];
  uint64_t v2 = v0[15];
  uint64_t v11 = v0[13];
  uint64_t v12 = v0[17];
  uint64_t v9 = v0[10];
  uint64_t v10 = v0[14];
  uint64_t v13 = v0[9];
  uint64_t v14 = v0[8];
  uint64_t v3 = v0[5];
  uint64_t v4 = v0[6];
  sub_10005E3F0();
  uint64_t v5 = sub_10005E750();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56))(v4, 1, 1, v5);
  uint64_t v6 = sub_10005E790();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v3, 1, 1, v6);
  sub_10003CAFC();
  sub_10004A770(&qword_100082108, (void (*)(uint64_t))type metadata accessor for SiriAppAccessForAppEntity);
  sub_10005E350();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v12, v10);
  sub_10005E370();
  sub_10005E3A0();
  (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v9, v14);
  sub_10004A6B0(v11);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v12, v10);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v7 = (uint64_t (*)(void))v0[1];
  return v7();
}

uint64_t sub_100047318()
{
  return sub_10004539C(&qword_100080578);
}

uint64_t sub_10004733C(uint64_t a1, uint64_t a2)
{
  return sub_100024B94(a1, a2, &qword_100080578);
}

unint64_t sub_100047364()
{
  unint64_t result = qword_100082528;
  if (!qword_100082528)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100082528);
  }
  return result;
}

unint64_t sub_1000473BC()
{
  unint64_t result = qword_100082530;
  if (!qword_100082530)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100082530);
  }
  return result;
}

uint64_t sub_100047410()
{
  return *(void *)(swift_getOpaqueTypeConformance2() + 8);
}

uint64_t sub_100047444(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1000483B0(a1, a2, a3, (void (*)(void))sub_10003CAFC);
}

uint64_t sub_10004745C@<X0>(uint64_t a1@<X8>)
{
  return sub_1000498E4(&qword_100080568, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_100083B00, a1);
}

uint64_t sub_100047494@<X0>(uint64_t a1@<X8>)
{
  return sub_100024D90(&qword_100080570, (uint64_t)qword_100083B18, a1);
}

uint64_t sub_1000474B8(uint64_t a1)
{
  uint64_t v5 = *v1;
  uint64_t v4 = v1[1];
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v6;
  *uint64_t v6 = v2;
  v6[1] = sub_100009F48;
  return sub_1000469CC(a1, v5, v4);
}

uint64_t sub_100047564@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10004AB88(0xD00000000000002CLL, 0x8000000100062CF0);
  *a1 = result;
  a1[1] = v3;
  return result;
}

unint64_t sub_1000475A4()
{
  return 0xD000000000000042;
}

unint64_t sub_1000475C4()
{
  unint64_t result = qword_100082540;
  if (!qword_100082540)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100082540);
  }
  return result;
}

uint64_t sub_100047618()
{
  return sub_100009DAC(&qword_100082548, &qword_100082550);
}

uint64_t sub_100047654(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return _swift_task_switch(sub_100047674, 0, 0);
}

uint64_t sub_100047674()
{
  if (qword_100080528 != -1) {
    swift_once();
  }
  uint64_t v1 = *(unsigned __int8 **)(v0 + 16);
  uint64_t v2 = (void *)qword_100083A70;
  type metadata accessor for SiriAppAccessForAppEntity();
  id v3 = v2;
  NSString v4 = sub_10005E9A0();
  unsigned __int8 v5 = [v3 suggestionsSuggestAppEnabledForBundleId:v4];

  unsigned __int8 *v1 = v5;
  uint64_t v6 = *(uint64_t (**)(void))(v0 + 8);
  return v6();
}

uint64_t sub_100047764(uint64_t a1, unsigned char *a2)
{
  *(void *)(v2 + 16) = a1;
  *(unsigned char *)(v2 + 24) = *a2;
  return _swift_task_switch(sub_10004778C, 0, 0);
}

uint64_t sub_10004778C()
{
  if (qword_100080528 != -1) {
    swift_once();
  }
  uint64_t v1 = *(unsigned __int8 *)(v0 + 24);
  uint64_t v2 = (void *)qword_100083A70;
  type metadata accessor for SiriAppAccessForAppEntity();
  id v3 = v2;
  NSString v4 = sub_10005E9A0();
  [v3 setSuggestionsSuggestAppEnabled:v1 bundleId:v4];

  unsigned __int8 v5 = *(uint64_t (**)(void))(v0 + 8);
  return v5();
}

uint64_t sub_10004787C(uint64_t a1)
{
  return sub_100005E9C(a1, qword_100083B38);
}

uint64_t sub_1000478A0(uint64_t a1)
{
  return sub_1000240D0(a1, qword_100083B50);
}

uint64_t sub_1000478C4()
{
  uint64_t result = swift_getKeyPath();
  qword_100083B68 = result;
  return result;
}

uint64_t sub_1000478EC()
{
  type metadata accessor for SiriAppAccessForAppEntity();

  return swift_retain();
}

uint64_t sub_100047920(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  sub_100005268(&qword_100080AF0);
  v3[5] = swift_task_alloc();
  sub_100005268(&qword_100080AF8);
  v3[6] = swift_task_alloc();
  sub_100005268(&qword_100082768);
  v3[7] = swift_task_alloc();
  uint64_t v4 = sub_10005E390();
  v3[8] = v4;
  v3[9] = *(void *)(v4 - 8);
  v3[10] = swift_task_alloc();
  v3[11] = type metadata accessor for SiriAppAccessForAppEntity();
  v3[12] = swift_task_alloc();
  v3[13] = swift_task_alloc();
  uint64_t v5 = sub_100005268(&qword_100082770);
  v3[14] = v5;
  v3[15] = *(void *)(v5 - 8);
  v3[16] = swift_task_alloc();
  v3[17] = swift_task_alloc();
  return _swift_task_switch(sub_100047B24, 0, 0);
}

uint64_t sub_100047B24()
{
  sub_10005E3F0();
  uint64_t v1 = (void *)swift_task_alloc();
  v0[18] = v1;
  uint64_t v2 = sub_10004A770(qword_100082590, (void (*)(uint64_t))type metadata accessor for SiriAppAccessForAppEntity);
  void *v1 = v0;
  v1[1] = sub_100047C20;
  uint64_t v3 = v0[17];
  uint64_t v4 = v0[13];
  uint64_t v5 = v0[11];
  return IntentDialog._CapturedContent.init<>(entity:_:)(v3, v4, sub_10004826C, 0, v5, v2);
}

uint64_t sub_100047C20()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_100047D1C, 0, 0);
}

uint64_t sub_100047D1C()
{
  sub_10005E3F0();
  sub_10005E3F0();
  *(unsigned char *)(v0 + 177) = *(unsigned char *)(v0 + 176);
  if (qword_100080590 != -1) {
    swift_once();
  }
  uint64_t v1 = qword_100083B68;
  *(void *)(v0 + 152) = qword_100083B68;
  swift_retain();
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 160) = v2;
  uint64_t v3 = sub_100009DAC(&qword_100082710, &qword_100082718);
  *uint64_t v2 = v0;
  v2[1] = sub_100047E68;
  return AppEntity._setValue<A, B, C>(_:for:)(v0 + 177, v1, &type metadata for Bool, v3);
}

uint64_t sub_100047E68()
{
  uint64_t v2 = *(void *)(*(void *)v1 + 96);
  *(void *)(*(void *)v1 + 168) = v0;
  swift_task_dealloc();
  sub_10004A6B0(v2);
  swift_release();
  if (v0) {
    uint64_t v3 = sub_10004B264;
  }
  else {
    uint64_t v3 = sub_100047FBC;
  }
  return _swift_task_switch(v3, 0, 0);
}

uint64_t sub_100047FBC()
{
  uint64_t v1 = v0[16];
  uint64_t v2 = v0[15];
  uint64_t v11 = v0[13];
  uint64_t v12 = v0[17];
  uint64_t v9 = v0[10];
  uint64_t v10 = v0[14];
  uint64_t v13 = v0[9];
  uint64_t v14 = v0[8];
  uint64_t v3 = v0[5];
  uint64_t v4 = v0[6];
  sub_10005E3F0();
  uint64_t v5 = sub_10005E750();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56))(v4, 1, 1, v5);
  uint64_t v6 = sub_10005E790();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v3, 1, 1, v6);
  sub_1000475C4();
  sub_10004A770(&qword_100082108, (void (*)(uint64_t))type metadata accessor for SiriAppAccessForAppEntity);
  sub_10005E350();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v12, v10);
  sub_10005E370();
  sub_10005E3A0();
  (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v9, v14);
  sub_10004A6B0(v11);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v12, v10);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v7 = (uint64_t (*)(void))v0[1];
  return v7();
}

uint64_t sub_10004826C()
{
  return sub_10004539C(&qword_100080590);
}

uint64_t sub_100048290(uint64_t a1, uint64_t a2)
{
  return sub_100024B94(a1, a2, &qword_100080590);
}

unint64_t sub_1000482B8()
{
  unint64_t result = qword_100082558;
  if (!qword_100082558)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100082558);
  }
  return result;
}

unint64_t sub_100048310()
{
  unint64_t result = qword_100082560;
  if (!qword_100082560)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100082560);
  }
  return result;
}

uint64_t sub_100048364()
{
  return *(void *)(swift_getOpaqueTypeConformance2() + 8);
}

uint64_t sub_100048398(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1000483B0(a1, a2, a3, (void (*)(void))sub_1000475C4);
}

uint64_t sub_1000483B0(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100048404@<X0>(uint64_t a1@<X8>)
{
  return sub_1000498E4(&qword_100080580, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_100083B38, a1);
}

uint64_t sub_10004843C@<X0>(uint64_t a1@<X8>)
{
  return sub_100024D90(&qword_100080588, (uint64_t)qword_100083B50, a1);
}

uint64_t sub_100048460(uint64_t a1)
{
  uint64_t v5 = *v1;
  uint64_t v4 = v1[1];
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v6;
  *uint64_t v6 = v2;
  v6[1] = sub_100009F48;
  return sub_100047920(a1, v5, v4);
}

uint64_t sub_10004850C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10004AB88(0xD000000000000039, 0x8000000100062BD0);
  *a1 = result;
  a1[1] = v3;
  return result;
}

unint64_t sub_10004854C()
{
  return 0xD000000000000045;
}

unint64_t sub_10004856C()
{
  unint64_t result = qword_100082570;
  if (!qword_100082570)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100082570);
  }
  return result;
}

uint64_t sub_1000485C0(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return _swift_task_switch(sub_1000485E0, 0, 0);
}

uint64_t sub_1000485E0()
{
  if (qword_100080528 != -1) {
    swift_once();
  }
  uint64_t v1 = *(unsigned __int8 **)(v0 + 16);
  uint64_t v2 = (void *)qword_100083A70;
  type metadata accessor for SiriAppAccessForAppEntity();
  id v3 = v2;
  NSString v4 = sub_10005E9A0();
  unsigned __int8 v5 = [v3 suggestionsNotificationEnabledForBundleId:v4];

  unsigned __int8 *v1 = v5;
  uint64_t v6 = *(uint64_t (**)(void))(v0 + 8);
  return v6();
}

uint64_t sub_1000486D0(uint64_t a1, unsigned char *a2)
{
  *(void *)(v2 + 16) = a1;
  *(unsigned char *)(v2 + 24) = *a2;
  return _swift_task_switch(sub_1000486F8, 0, 0);
}

uint64_t sub_1000486F8()
{
  if (qword_100080528 != -1) {
    swift_once();
  }
  uint64_t v1 = *(unsigned __int8 *)(v0 + 24);
  uint64_t v2 = (void *)qword_100083A70;
  type metadata accessor for SiriAppAccessForAppEntity();
  id v3 = v2;
  NSString v4 = sub_10005E9A0();
  [v3 setSuggestionsNotificationsEnabled:v1 bundleId:v4];

  unsigned __int8 v5 = *(uint64_t (**)(void))(v0 + 8);
  return v5();
}

id sub_1000487E8()
{
  id result = [self sharedController];
  qword_100083B70 = (uint64_t)result;
  return result;
}

uint64_t sub_100048824(uint64_t a1)
{
  v1[6] = a1;
  v1[7] = *(void *)(type metadata accessor for SiriAppAccessForAppEntity() - 8);
  v1[8] = swift_task_alloc();
  return _swift_task_switch(sub_1000488E0, 0, 0);
}

uint64_t sub_1000488E0()
{
  id v1 = [*(id *)(v0 + 48) visibleApps];
  sub_100009D18();
  sub_10004A770(&qword_100080AB8, (void (*)(uint64_t))sub_100009D18);
  uint64_t v2 = sub_10005EA00();

  unint64_t v33 = v2 & 0xC000000000000001;
  if ((v2 & 0xC000000000000001) != 0)
  {
    uint64_t v3 = sub_10005EAB0();
    if (v3) {
      goto LABEL_3;
    }
LABEL_6:
    swift_bridgeObjectRelease();
LABEL_21:
    swift_task_dealloc();
    uint64_t v28 = *(uint64_t (**)(void *))(v0 + 8);
    return v28(_swiftEmptyArrayStorage);
  }
  uint64_t v3 = *(void *)(v2 + 16);
  if (!v3) {
    goto LABEL_6;
  }
LABEL_3:
  sub_10005CDBC(0, v3 & ~(v3 >> 63), 0);
  if (v33)
  {
    uint64_t result = sub_10005EA70();
    char v6 = 1;
  }
  else
  {
    uint64_t result = sub_10005D3B8(v2);
    char v6 = v7 & 1;
  }
  uint64_t v34 = result;
  uint64_t v35 = v5;
  char v36 = v6;
  if ((v3 & 0x8000000000000000) == 0)
  {
    uint64_t v31 = *(void *)(v0 + 56);
    uint64_t v32 = v0;
    uint64_t v29 = v0 + 16;
    uint64_t v30 = v2;
    do
    {
      while (1)
      {
        uint64_t v13 = *(void *)(v0 + 64);
        sub_10005D160(v34, v35, v36, v2);
        uint64_t v15 = v14;
        id v16 = [v14 bundleId];
        uint64_t v17 = sub_10005E9B0();
        uint64_t v19 = v18;

        id v20 = [v15 localizedName];
        uint64_t v21 = sub_10005E9B0();
        uint64_t v23 = v22;

        sub_10004456C(v17, v19, v21, v23, v13);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          sub_10005CDBC(0, _swiftEmptyArrayStorage[2] + 1, 1);
        }
        unint64_t v25 = _swiftEmptyArrayStorage[2];
        unint64_t v24 = _swiftEmptyArrayStorage[3];
        uint64_t v0 = v32;
        if (v25 >= v24 >> 1) {
          sub_10005CDBC(v24 > 1, v25 + 1, 1);
        }
        uint64_t v26 = *(void *)(v32 + 64);
        _swiftEmptyArrayStorage[2] = v25 + 1;
        uint64_t result = sub_10004A70C(v26, (uint64_t)_swiftEmptyArrayStorage+ ((*(unsigned __int8 *)(v31 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v31 + 80))+ *(void *)(v31 + 72) * v25);
        if (v33) {
          break;
        }
        uint64_t v2 = v30;
        int64_t v8 = sub_10005D07C(v34, v35, v36, v30);
        uint64_t v10 = v9;
        char v12 = v11;
        sub_100009DA0(v34, v35, v36);
        uint64_t v34 = v8;
        uint64_t v35 = v10;
        char v36 = v12 & 1;
        if (!--v3) {
          goto LABEL_20;
        }
      }
      if ((v36 & 1) == 0) {
        goto LABEL_25;
      }
      if (sub_10005EA80()) {
        swift_isUniquelyReferenced_nonNull_native();
      }
      sub_100005268(&qword_100080AE0);
      uint64_t v27 = (void (*)(uint64_t, void))sub_10005EA10();
      sub_10005EAD0();
      v27(v29, 0);
      uint64_t v2 = v30;
      --v3;
    }
    while (v3);
LABEL_20:
    sub_100009DA0(v34, v35, v36);
    swift_bridgeObjectRelease();
    goto LABEL_21;
  }
  __break(1u);
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_100048CA4(uint64_t a1)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v3 = *v1;
  NSString v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v4;
  *NSString v4 = v2;
  v4[1] = sub_100003BF0;
  return sub_100048824(v3);
}

unint64_t sub_100048D40()
{
  unint64_t result = qword_100082580;
  if (!qword_100082580)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100082580);
  }
  return result;
}

unint64_t sub_100048D98()
{
  unint64_t result = qword_100082588;
  if (!qword_100082588)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100082588);
  }
  return result;
}

uint64_t sub_100048DEC()
{
  return sub_10004A770(qword_100082590, (void (*)(uint64_t))type metadata accessor for SiriAppAccessForAppEntity);
}

id sub_100048E34@<X0>(void *a1@<X8>)
{
  id result = [self sharedController];
  *a1 = result;
  return result;
}

uint64_t sub_100048E78(uint64_t a1)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v3 = *v1;
  NSString v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v4;
  *NSString v4 = v2;
  v4[1] = sub_100048F10;
  return sub_100048824(v3);
}

uint64_t sub_100048F10(uint64_t a1)
{
  uint64_t v4 = *v2;
  uint64_t v5 = *v2;
  *(void *)(*v2 + 32) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v6 = *(uint64_t (**)(void))(v5 + 8);
    return v6();
  }
  else
  {
    *(void *)(v4 + 40) = a1;
    return _swift_task_switch(sub_100049060, 0, 0);
  }
}

uint64_t sub_100049060()
{
  uint64_t v1 = v0[5];
  uint64_t v2 = (void *)v0[2];
  swift_bridgeObjectRetain();
  uint64_t v3 = sub_10004A3B4(v1, v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = (uint64_t (*)(uint64_t))v0[1];
  return v4(v3);
}

uint64_t sub_1000490F8(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_10004A360();
  *uint64_t v5 = v2;
  v5[1] = sub_100009F48;
  return EnumerableEntityQuery.suggestedEntities()(a1, a2, v6);
}

unint64_t sub_1000491B0()
{
  unint64_t result = qword_1000825A8;
  if (!qword_1000825A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000825A8);
  }
  return result;
}

uint64_t sub_100049204()
{
  return sub_10004A770(&qword_100082108, (void (*)(uint64_t))type metadata accessor for SiriAppAccessForAppEntity);
}

unint64_t sub_100049250()
{
  unint64_t result = qword_1000825B0;
  if (!qword_1000825B0)
  {
    sub_1000041B0(qword_1000825B8);
    sub_10004A770(&qword_100082108, (void (*)(uint64_t))type metadata accessor for SiriAppAccessForAppEntity);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000825B0);
  }
  return result;
}

uint64_t sub_1000492F4(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_10004856C();
  *uint64_t v5 = v2;
  v5[1] = sub_100009F48;
  return EntityQuery.results()(a1, a2, v6);
}

uint64_t sub_1000493A8()
{
  return sub_10004A770(&qword_1000825D0, (void (*)(uint64_t))type metadata accessor for SiriAppAccessForAppEntity);
}

uint64_t sub_1000493F0()
{
  return sub_10004A770(&qword_1000825D8, (void (*)(uint64_t))type metadata accessor for SiriAppAccessForAppEntity);
}

id sub_100049438@<X0>(void *a1@<X8>)
{
  if (qword_100080598 != -1) {
    swift_once();
  }
  uint64_t v2 = (void *)qword_100083B70;
  *a1 = qword_100083B70;

  return v2;
}

uint64_t sub_1000494A4()
{
  uint64_t v0 = qword_100082490;
  swift_bridgeObjectRetain();
  return v0;
}

uint64_t sub_1000494DC()
{
  return sub_10004A770(&qword_1000825E0, (void (*)(uint64_t))type metadata accessor for SiriAppAccessForAppEntity);
}

uint64_t sub_100049524()
{
  uint64_t v0 = sub_100005268(&qword_1000826E0);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100005268(&qword_1000826E8);
  __chkstk_darwin(v4);
  sub_10004A770(qword_100082590, (void (*)(uint64_t))type metadata accessor for SiriAppAccessForAppEntity);
  sub_10005E6F0();
  v7._object = (void *)0x800000010005F350;
  v7._countAndFlagsBits = 0xD000000000000049;
  sub_10005E6E0(v7);
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, enum case for EntityURLRepresentation.StringInterpolation.Token.id<A>(_:), v0);
  sub_10005E6D0();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  v8._countAndFlagsBits = 0;
  v8._object = (void *)0xE000000000000000;
  sub_10005E6E0(v8);
  return sub_10005E700();
}

uint64_t sub_100049710()
{
  return sub_10004A770(&qword_1000825E8, (void (*)(uint64_t))type metadata accessor for SiriAppAccessForAppEntity);
}

uint64_t sub_100049758()
{
  return sub_10004A770(&qword_1000825F0, (void (*)(uint64_t))type metadata accessor for SiriAppAccessForAppEntity);
}

uint64_t sub_1000497A0()
{
  return sub_10004A770((unint64_t *)&unk_1000825F8, (void (*)(uint64_t))type metadata accessor for SiriAppAccessForAppEntity);
}

uint64_t sub_1000497E8()
{
  sub_10004A770(&qword_1000826D8, (void (*)(uint64_t))type metadata accessor for SiriAppAccessForAppEntity);
  uint64_t v2 = sub_10005E6A0();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
  return sub_10000538C(v3, v0, v2, v1);
}

uint64_t sub_1000498AC@<X0>(uint64_t a1@<X8>)
{
  return sub_1000498E4(&qword_100080530, (uint64_t (*)(void))&type metadata accessor for TypeDisplayRepresentation, (uint64_t)qword_100083A78, a1);
}

uint64_t sub_1000498E4@<X0>(void *a1@<X2>, uint64_t (*a2)(void)@<X3>, uint64_t a3@<X4>, uint64_t a4@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v7 = a2(0);
  uint64_t v8 = sub_1000052AC(v7, a3);
  uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 16);

  return v9(a4, v8, v7);
}

uint64_t sub_100049988()
{
  return sub_100009DAC(&qword_100082608, &qword_100082610);
}

uint64_t sub_1000499C4(uint64_t a1)
{
  uint64_t v2 = sub_10004A770(qword_100082590, (void (*)(uint64_t))type metadata accessor for SiriAppAccessForAppEntity);

  return static AppEntity.defaultResolverSpecification.getter(a1, v2);
}

uint64_t sub_100049A40()
{
  return sub_10004A770(&qword_100082618, (void (*)(uint64_t))type metadata accessor for SiriAppAccessForAppEntity);
}

uint64_t sub_100049A88(uint64_t a1)
{
  uint64_t v2 = sub_10004A770((unint64_t *)&unk_1000825F8, (void (*)(uint64_t))type metadata accessor for SiriAppAccessForAppEntity);

  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

ValueMetadata *type metadata accessor for SiriAppAccessForAppEntity.SiriAppAccessForAppEntityQuery()
{
  return &type metadata for SiriAppAccessForAppEntity.SiriAppAccessForAppEntityQuery;
}

ValueMetadata *type metadata accessor for SiriAppAccessForAppEntity.UpdateIntent_showSiriSuggestionsNotifications()
{
  return &type metadata for SiriAppAccessForAppEntity.UpdateIntent_showSiriSuggestionsNotifications;
}

ValueMetadata *type metadata accessor for SiriAppAccessForAppEntity.UpdateIntent_showSiriSuggestionsSuggestApp()
{
  return &type metadata for SiriAppAccessForAppEntity.UpdateIntent_showSiriSuggestionsSuggestApp;
}

ValueMetadata *type metadata accessor for SiriAppAccessForAppEntity.UpdateIntent_showSiriSuggestionsOnHomeScreen()
{
  return &type metadata for SiriAppAccessForAppEntity.UpdateIntent_showSiriSuggestionsOnHomeScreen;
}

ValueMetadata *type metadata accessor for SiriAppAccessForAppEntity.UpdateIntent_learnFromThisApplication()
{
  return &type metadata for SiriAppAccessForAppEntity.UpdateIntent_learnFromThisApplication;
}

uint64_t *sub_100049B54(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v14 = *a2;
    *a1 = *a2;
    uint64_t v4 = (uint64_t *)(v14 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    uint64_t v7 = sub_10005E620();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(v4, a2, v7);
    uint64_t v8 = a3[5];
    uint64_t v9 = a3[6];
    uint64_t v10 = (uint64_t *)((char *)v4 + v8);
    char v11 = (uint64_t *)((char *)a2 + v8);
    uint64_t v12 = v11[1];
    *uint64_t v10 = *v11;
    v10[1] = v12;
    *(uint64_t *)((char *)v4 + v9) = *(uint64_t *)((char *)a2 + v9);
    uint64_t v13 = a3[8];
    *(uint64_t *)((char *)v4 + a3[7]) = *(uint64_t *)((char *)a2 + a3[7]);
    *(uint64_t *)((char *)v4 + v13) = *(uint64_t *)((char *)a2 + v13);
    *(uint64_t *)((char *)v4 + a3[9]) = *(uint64_t *)((char *)a2 + a3[9]);
    swift_bridgeObjectRetain();
    swift_retain();
    swift_retain();
    swift_retain();
  }
  swift_retain();
  return v4;
}

uint64_t sub_100049C78(uint64_t a1)
{
  uint64_t v2 = sub_10005E620();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();

  return swift_release();
}

uint64_t sub_100049D20(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_10005E620();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a3[6];
  uint64_t v9 = (void *)(a1 + v7);
  uint64_t v10 = (void *)(a2 + v7);
  uint64_t v11 = v10[1];
  *uint64_t v9 = *v10;
  v9[1] = v11;
  *(void *)(a1 + v8) = *(void *)(a2 + v8);
  uint64_t v12 = a3[8];
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  *(void *)(a1 + v12) = *(void *)(a2 + v12);
  *(void *)(a1 + a3[9]) = *(void *)(a2 + a3[9]);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t sub_100049DF8(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_10005E620();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  *uint64_t v8 = *v9;
  v8[1] = v9[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + a3[6]) = *(void *)(a2 + a3[6]);
  swift_retain();
  swift_release();
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  swift_retain();
  swift_release();
  *(void *)(a1 + a3[8]) = *(void *)(a2 + a3[8]);
  swift_retain();
  swift_release();
  *(void *)(a1 + a3[9]) = *(void *)(a2 + a3[9]);
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_100049F04(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_10005E620();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(_OWORD *)(a1 + a3[5]) = *(_OWORD *)(a2 + a3[5]);
  *(void *)(a1 + v7) = *(void *)(a2 + v7);
  uint64_t v8 = a3[8];
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  *(void *)(a1 + v8) = *(void *)(a2 + v8);
  *(void *)(a1 + a3[9]) = *(void *)(a2 + a3[9]);
  return a1;
}

uint64_t sub_100049FA8(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_10005E620();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (uint64_t *)(a2 + v7);
  uint64_t v11 = *v9;
  uint64_t v10 = v9[1];
  *uint64_t v8 = v11;
  v8[1] = v10;
  swift_bridgeObjectRelease();
  *(void *)(a1 + a3[6]) = *(void *)(a2 + a3[6]);
  swift_release();
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  swift_release();
  *(void *)(a1 + a3[8]) = *(void *)(a2 + a3[8]);
  swift_release();
  *(void *)(a1 + a3[9]) = *(void *)(a2 + a3[9]);
  swift_release();
  return a1;
}

uint64_t sub_10004A084(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10004A098);
}

uint64_t sub_10004A098(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_10005E620();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20) + 8);
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
}

uint64_t sub_10004A15C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10004A170);
}

uint64_t sub_10004A170(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_10005E620();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20) + 8) = (a2 - 1);
  }
  return result;
}

uint64_t sub_10004A230()
{
  uint64_t result = sub_10005E620();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for OpenSiriAppAccessForAppEntity()
{
  return &type metadata for OpenSiriAppAccessForAppEntity;
}

uint64_t sub_10004A2E8()
{
  return sub_100009DAC(&qword_1000826C0, &qword_1000826C8);
}

uint64_t sub_10004A324()
{
  return sub_100009DAC(&qword_1000826D0, &qword_1000826C8);
}

unint64_t sub_10004A360()
{
  unint64_t result = qword_1000826F0;
  if (!qword_1000826F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_1000826F0);
  }
  return result;
}

uint64_t sub_10004A3B4(uint64_t a1, void *a2)
{
  uint64_t v28 = type metadata accessor for SiriAppAccessForAppEntity();
  uint64_t v5 = __chkstk_darwin(v28);
  uint64_t v31 = (uint64_t)v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v33 = (uint64_t)v25 - v8;
  uint64_t result = (uint64_t)_swiftEmptyArrayStorage;
  uint64_t v34 = _swiftEmptyArrayStorage;
  uint64_t v30 = *(void *)(a1 + 16);
  if (!v30) {
    return result;
  }
  v25[1] = v2;
  uint64_t v10 = 0;
  unint64_t v11 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v32 = *(void *)(v7 + 72);
  uint64_t v29 = a1 + v11;
  uint64_t v26 = a2 + 7;
  unint64_t v27 = v11;
  uint64_t v12 = _swiftEmptyArrayStorage;
  while (1)
  {
    sub_10004A64C(v29 + v32 * v10, v33);
    uint64_t v13 = a2[2];
    if (v13)
    {
      uint64_t v14 = (uint64_t *)(v33 + *(int *)(v28 + 20));
      uint64_t v15 = *v14;
      uint64_t v16 = v14[1];
      uint64_t v17 = a2;
      BOOL v18 = a2[4] == *v14 && a2[5] == v16;
      if (v18 || (uint64_t result = sub_10005EB40(), (result & 1) != 0))
      {
LABEL_11:
        sub_10004A70C(v33, v31);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          sub_10005CDBC(0, v12[2] + 1, 1);
        }
        uint64_t v12 = v34;
        unint64_t v20 = v34[2];
        unint64_t v19 = v34[3];
        if (v20 >= v19 >> 1)
        {
          sub_10005CDBC(v19 > 1, v20 + 1, 1);
          uint64_t v12 = v34;
        }
        void v12[2] = v20 + 1;
        sub_10004A70C(v31, (uint64_t)v12 + v27 + v20 * v32);
        a2 = v17;
        goto LABEL_4;
      }
      if (v13 != 1) {
        break;
      }
    }
LABEL_3:
    sub_10004A6B0(v33);
LABEL_4:
    if (++v10 == v30) {
      return (uint64_t)v34;
    }
  }
  uint64_t v21 = v26;
  uint64_t v22 = 1;
  while (1)
  {
    uint64_t v23 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (*(v21 - 1) == v15 && *v21 == v16) {
      goto LABEL_11;
    }
    uint64_t result = sub_10005EB40();
    if (result) {
      goto LABEL_11;
    }
    v21 += 2;
    ++v22;
    BOOL v18 = v23 == v13;
    a2 = v17;
    if (v18) {
      goto LABEL_3;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_10004A64C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SiriAppAccessForAppEntity();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10004A6B0(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for SiriAppAccessForAppEntity();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10004A70C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SiriAppAccessForAppEntity();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10004A770(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_10004A7B8()
{
  uint64_t v22 = sub_10005E720();
  uint64_t v0 = *(void *)(v22 - 8);
  __chkstk_darwin(v22);
  uint64_t v2 = (char *)&v21 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100005268(&qword_100080848);
  uint64_t v4 = __chkstk_darwin(v3 - 8);
  uint64_t v6 = (char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v21 - v7;
  uint64_t v9 = sub_100005268(&qword_100082750);
  __chkstk_darwin(v9 - 8);
  unint64_t v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100005268(&qword_100080858);
  __chkstk_darwin(v12 - 8);
  uint64_t v14 = (char *)&v21 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_10005E800();
  uint64_t v16 = *(void *)(v15 - 8);
  __chkstk_darwin(v15);
  uint64_t v21 = sub_100005268(&qword_100082758);
  sub_10005E7E0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v16 + 56))(v14, 1, 1, v15);
  uint64_t v17 = type metadata accessor for SiriAppAccessForAppEntity();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v11, 1, 1, v17);
  uint64_t v18 = sub_10005E390();
  unint64_t v19 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56);
  v19(v8, 1, 1, v18);
  v19(v6, 1, 1, v18);
  (*(void (**)(char *, void, uint64_t))(v0 + 104))(v2, enum case for InputConnectionBehavior.default(_:), v22);
  sub_10004A770(qword_100082590, (void (*)(uint64_t))type metadata accessor for SiriAppAccessForAppEntity);
  return sub_10005E420();
}

uint64_t sub_10004AB50()
{
  return sub_10004AB88(0xD000000000000034, 0x8000000100062EE0);
}

uint64_t sub_10004AB6C()
{
  return sub_10004AB88(0xD000000000000034, 0x8000000100062DE0);
}

uint64_t sub_10004AB88(uint64_t a1, uint64_t a2)
{
  uint64_t v36 = a1;
  uint64_t v37 = a2;
  uint64_t v2 = sub_100005268(&qword_100080A68);
  __chkstk_darwin(v2 - 8);
  uint64_t v38 = (char *)v28 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v39 = sub_10005E720();
  uint64_t v4 = *(void *)(v39 - 8);
  __chkstk_darwin(v39);
  uint64_t v35 = (char *)v28 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100005268(&qword_100080848);
  uint64_t v7 = __chkstk_darwin(v6 - 8);
  uint64_t v9 = (char *)v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  unint64_t v11 = (char *)v28 - v10;
  uint64_t v12 = sub_100005268(&qword_100082750);
  __chkstk_darwin(v12 - 8);
  uint64_t v14 = (char *)v28 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_100005268(&qword_100080858);
  __chkstk_darwin(v15 - 8);
  uint64_t v17 = (char *)v28 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_10005E800();
  uint64_t v34 = v18;
  uint64_t v19 = *(void *)(v18 - 8);
  __chkstk_darwin(v18);
  uint64_t v32 = sub_100005268(&qword_100082758);
  sub_10005E7E0();
  unint64_t v20 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v19 + 56);
  uint64_t v31 = v19 + 56;
  uint64_t v33 = v20;
  v20(v17, 1, 1, v18);
  uint64_t v21 = type metadata accessor for SiriAppAccessForAppEntity();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56))(v14, 1, 1, v21);
  uint64_t v22 = sub_10005E390();
  uint64_t v23 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56);
  v23(v11, 1, 1, v22);
  v23(v9, 1, 1, v22);
  unsigned int v30 = enum case for InputConnectionBehavior.default(_:);
  unint64_t v24 = *(void (**)(void))(v4 + 104);
  v28[1] = v4 + 104;
  uint64_t v29 = (void (*)(char *, void, uint64_t))v24;
  unint64_t v25 = v35;
  v24(v35);
  sub_10004A770(qword_100082590, (void (*)(uint64_t))type metadata accessor for SiriAppAccessForAppEntity);
  uint64_t v32 = sub_10005E420();
  sub_100005268(&qword_100080A80);
  sub_10005E7E0();
  v33(v17, 1, 1, v34);
  char v40 = 2;
  uint64_t v26 = sub_10005E9F0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v26 - 8) + 56))(v38, 1, 1, v26);
  v23(v11, 1, 1, v22);
  v29(v25, v30, v39);
  sub_10005E430();
  return v32;
}

uint64_t sub_10004B07C()
{
  return sub_10004AB88(0xD00000000000002CLL, 0x8000000100062CF0);
}

uint64_t sub_10004B098@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  *a2 = *(void *)(a1 + *(int *)(type metadata accessor for SiriAppAccessForAppEntity() + 36));

  return swift_retain();
}

uint64_t sub_10004B0E0@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  *a2 = *(void *)(a1 + *(int *)(type metadata accessor for SiriAppAccessForAppEntity() + 32));

  return swift_retain();
}

uint64_t sub_10004B128@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  *a2 = *(void *)(a1 + *(int *)(type metadata accessor for SiriAppAccessForAppEntity() + 28));

  return swift_retain();
}

uint64_t sub_10004B170@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  *a2 = *(void *)(a1 + *(int *)(type metadata accessor for SiriAppAccessForAppEntity() + 24));

  return swift_retain();
}

unint64_t sub_10004B1B8()
{
  unint64_t result = qword_1000827B8;
  if (!qword_1000827B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000827B8);
  }
  return result;
}

unint64_t sub_10004B20C()
{
  unint64_t result = qword_1000827C0;
  if (!qword_1000827C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000827C0);
  }
  return result;
}

unint64_t sub_10004B268(uint64_t a1)
{
  return sub_10004B290(a1, &qword_100081638, &qword_100082A48, (uint64_t (*)(void))sub_10004E538);
}

unint64_t sub_10004B290(uint64_t a1, uint64_t *a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v29 = a4;
  uint64_t v7 = sub_100005268(a2);
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v28 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(void *)(a1 + 16))
  {
    uint64_t v12 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100005268(a3);
  uint64_t v11 = sub_10005EB10();
  uint64_t v12 = (void *)v11;
  uint64_t v13 = *(void *)(a1 + 16);
  if (!v13)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v12;
  }
  uint64_t v14 = &v10[*(int *)(v7 + 48)];
  uint64_t v15 = v11 + 64;
  unint64_t v16 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  uint64_t v28 = a1;
  uint64_t v17 = a1 + v16;
  uint64_t v18 = *(void *)(v8 + 72);
  swift_retain();
  while (1)
  {
    sub_10004F350(v17, (uint64_t)v10, a2);
    char v19 = *v10;
    unint64_t result = v29(*v10);
    if (v21) {
      break;
    }
    unint64_t v22 = result;
    *(void *)(v15 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(unsigned char *)(v12[6] + result) = v19;
    uint64_t v23 = v12[7];
    uint64_t v24 = sub_10005E620();
    unint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(void *)(v24 - 8) + 32))(v23 + *(void *)(*(void *)(v24 - 8) + 72) * v22, v14, v24);
    uint64_t v25 = v12[2];
    BOOL v26 = __OFADD__(v25, 1);
    uint64_t v27 = v25 + 1;
    if (v26) {
      goto LABEL_11;
    }
    void v12[2] = v27;
    v17 += v18;
    if (!--v13)
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

uint64_t sub_10004B48C(unsigned __int8 a1, unsigned __int8 a2)
{
  unint64_t v2 = 0xD000000000000011;
  unint64_t v3 = 0x800000010005EF60;
  int v4 = a1;
  if (a1)
  {
    if (a1 == 1) {
      unint64_t v5 = 0x737961776C61;
    }
    else {
      unint64_t v5 = 0x726576656ELL;
    }
    if (v4 == 1) {
      unint64_t v6 = 0xE600000000000000;
    }
    else {
      unint64_t v6 = 0xE500000000000000;
    }
    int v7 = a2;
    if (!a2) {
      goto LABEL_15;
    }
    goto LABEL_9;
  }
  unint64_t v5 = 0xD000000000000011;
  unint64_t v6 = 0x800000010005EF60;
  int v7 = a2;
  if (a2)
  {
LABEL_9:
    if (v7 == 1) {
      unint64_t v2 = 0x737961776C61;
    }
    else {
      unint64_t v2 = 0x726576656ELL;
    }
    if (v7 == 1) {
      unint64_t v3 = 0xE600000000000000;
    }
    else {
      unint64_t v3 = 0xE500000000000000;
    }
  }
LABEL_15:
  if (v5 == v2 && v6 == v3) {
    char v8 = 1;
  }
  else {
    char v8 = sub_10005EB40();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_10004B588(char a1, char a2)
{
  if (*(void *)&aNever_2[8 * a1] == *(void *)&aNever_2[8 * a2]
    && *(void *)&aHandsfreheadph[8 * a1 + 16] == *(void *)&aHandsfreheadph[8 * a2 + 16])
  {
    char v3 = 1;
  }
  else
  {
    char v3 = sub_10005EB40();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

Swift::Int sub_10004B610()
{
  return sub_10005EBA0();
}

Swift::Int sub_10004B6B0()
{
  return sub_10005EBA0();
}

uint64_t sub_10004B71C()
{
  sub_10005E9C0();

  return swift_bridgeObjectRelease();
}

uint64_t sub_10004B7A4()
{
  sub_10005E9C0();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_10004B7F8()
{
  return sub_10005EBA0();
}

Swift::Int sub_10004B860()
{
  return sub_10005EBA0();
}

unint64_t sub_10004B8FC()
{
  sub_100005268(&qword_100082A30);
  uint64_t v0 = *(void *)(sub_100005268(&qword_100082A38) - 8);
  uint64_t v1 = *(void *)(v0 + 72);
  unint64_t v2 = (*(unsigned __int8 *)(v0 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v0 + 80);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_10006F700;
  int v4 = (unsigned char *)(v3 + v2);
  *int v4 = 1;
  sub_10005E5E0();
  v4[v1] = 2;
  sub_10005E5E0();
  v4[2 * v1] = 3;
  sub_10005E5E0();
  v4[3 * v1] = 0;
  sub_10005E5E0();
  unint64_t result = sub_10004B290(v3, &qword_100082A38, &qword_100082A40, (uint64_t (*)(void))sub_10004E5FC);
  qword_100083B78 = result;
  return result;
}

uint64_t sub_10004BAB0(uint64_t a1)
{
  return sub_10004C5C0(a1, qword_100083B80);
}

uint64_t sub_10004BAD4(char a1)
{
  return *(void *)&aNever_2[8 * a1];
}

uint64_t sub_10004BAF4(char *a1, char *a2)
{
  return sub_10004B588(*a1, *a2);
}

unint64_t sub_10004BB04()
{
  unint64_t result = qword_1000827D8;
  if (!qword_1000827D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000827D8);
  }
  return result;
}

Swift::Int sub_10004BB58()
{
  return sub_10004B6B0();
}

uint64_t sub_10004BB60()
{
  return sub_10004B7A4();
}

Swift::Int sub_10004BB68()
{
  return sub_10004B7F8();
}

uint64_t sub_10004BB70@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_10004F304(*(void *)a1, *(void **)(a1 + 8));
  *a2 = result;
  return result;
}

uint64_t sub_10004BBA0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10004BAD4(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

unint64_t sub_10004BBD0()
{
  unint64_t result = qword_1000827E0;
  if (!qword_1000827E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000827E0);
  }
  return result;
}

unint64_t sub_10004BC28()
{
  unint64_t result = qword_1000827E8;
  if (!qword_1000827E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000827E8);
  }
  return result;
}

unint64_t sub_10004BC80()
{
  unint64_t result = qword_1000827F0;
  if (!qword_1000827F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000827F0);
  }
  return result;
}

unint64_t sub_10004BCD8()
{
  unint64_t result = qword_1000827F8;
  if (!qword_1000827F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000827F8);
  }
  return result;
}

unint64_t sub_10004BD30()
{
  unint64_t result = qword_100082800;
  if (!qword_100082800)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100082800);
  }
  return result;
}

unint64_t sub_10004BD8C()
{
  unint64_t result = qword_100082808;
  if (!qword_100082808)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100082808);
  }
  return result;
}

uint64_t sub_10004BDE0@<X0>(uint64_t a1@<X8>)
{
  return sub_10004DF40(&qword_1000805A8, (uint64_t (*)(void))&type metadata accessor for TypeDisplayRepresentation, (uint64_t)qword_100083B80, a1);
}

uint64_t sub_10004BE18(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_10004D394(a1, a2, a3, (void (*)(void))sub_10004BE44);
}

unint64_t sub_10004BE44()
{
  unint64_t result = qword_100082810;
  if (!qword_100082810)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100082810);
  }
  return result;
}

uint64_t sub_10004BE98(uint64_t a1)
{
  unint64_t v2 = sub_10004BE44();

  return static AppEnum.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_10004BEE8()
{
  unint64_t result = qword_100082818;
  if (!qword_100082818)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100082818);
  }
  return result;
}

unint64_t sub_10004BF40()
{
  unint64_t result = qword_100082820;
  if (!qword_100082820)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100082820);
  }
  return result;
}

unint64_t sub_10004BF98()
{
  unint64_t result = qword_100082828;
  if (!qword_100082828)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100082828);
  }
  return result;
}

uint64_t sub_10004BFEC()
{
  if (qword_1000805A0 != -1) {
    swift_once();
  }

  return swift_bridgeObjectRetain();
}

uint64_t sub_10004C048(uint64_t a1)
{
  unint64_t v2 = sub_10004BD8C();

  return CaseDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

uint64_t sub_10004C094()
{
  return sub_100009DAC(&qword_100082830, &qword_100082838);
}

void sub_10004C0D0(void *a1@<X8>)
{
  *a1 = &off_10007D7E0;
}

unint64_t sub_10004C0E4()
{
  unint64_t result = qword_100082840;
  if (!qword_100082840)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100082840);
  }
  return result;
}

uint64_t sub_10004C138()
{
  return sub_10004E0BC(&qword_100082848);
}

uint64_t type metadata accessor for AnnounceCallsEntity()
{
  uint64_t result = qword_100082970;
  if (!qword_100082970) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_10004C1B8(uint64_t a1)
{
  return sub_100005E9C(a1, qword_100083B98);
}

uint64_t sub_10004C1DC(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for AnnounceCallsEntity();
  __chkstk_darwin(v2 - 8);
  sub_10004F1F8(a1, (uint64_t)&v5 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_10005E400();
  return sub_10004F154(a1);
}

uint64_t sub_10004C270(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_10004F25C();
  uint64_t v5 = sub_10004E0BC(&qword_100082898);

  return static URLRepresentableIntent<>.urlRepresentation.getter(a1, v4, a2, v5);
}

unint64_t sub_10004C2F8()
{
  unint64_t result = qword_100082850;
  if (!qword_100082850)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100082850);
  }
  return result;
}

unint64_t sub_10004C350()
{
  unint64_t result = qword_100082858;
  if (!qword_100082858)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100082858);
  }
  return result;
}

uint64_t sub_10004C3A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_10004D394(a1, a2, a3, (void (*)(void))sub_10003C664);
}

uint64_t sub_10004C3D0@<X0>(uint64_t a1@<X8>)
{
  return sub_10004DF40(&qword_1000805B0, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_100083B98, a1);
}

uint64_t sub_10004C408(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  unint64_t v5 = sub_10004F25C();
  unint64_t v6 = sub_10004F2B0();
  uint64_t v7 = sub_10004E0BC(&qword_100082898);
  *unint64_t v4 = v2;
  v4[1] = sub_100003184;
  return URLRepresentableIntent<>.perform()(a2, v5, v6, v7);
}

uint64_t sub_10004C4F0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10004E938();
  *a1 = result;
  return result;
}

uint64_t sub_10004C518(uint64_t a1)
{
  unint64_t v2 = sub_10003C664();

  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

uint64_t sub_10004C558()
{
  return sub_100009DAC(&qword_100082868, &qword_100082870);
}

uint64_t sub_10004C594(uint64_t a1)
{
  return sub_10004C5C0(a1, qword_100083BB0);
}

uint64_t sub_10004C5C0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_10005E780();
  sub_1000052E4(v3, a2);
  sub_1000052AC(v3, (uint64_t)a2);
  return sub_10005E760();
}

id sub_10004C620()
{
  id result = [self sharedController];
  qword_100083BC8 = (uint64_t)result;
  return result;
}

uint64_t sub_10004C65C(uint64_t a1)
{
  return sub_100005E9C(a1, qword_100083BD0);
}

uint64_t sub_10004C680()
{
  uint64_t v0 = sub_100005268(&qword_100080B20);
  sub_1000052E4(v0, qword_100083BE8);
  uint64_t v1 = sub_1000052AC(v0, (uint64_t)qword_100083BE8);
  sub_10005E570();
  uint64_t v2 = sub_10005E580();
  uint64_t v3 = *(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56);

  return v3(v1, 0, 1, v2);
}

uint64_t sub_10004C738()
{
  uint64_t result = swift_getKeyPath();
  qword_100083C00 = result;
  return result;
}

uint64_t sub_10004C760()
{
  type metadata accessor for AnnounceCallsEntity();

  return swift_retain();
}

uint64_t sub_10004C794(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  sub_100005268(&qword_100080AF0);
  v3[5] = swift_task_alloc();
  sub_100005268(&qword_100080AF8);
  v3[6] = swift_task_alloc();
  sub_100005268(&qword_100082A00);
  v3[7] = swift_task_alloc();
  uint64_t v4 = sub_10005E390();
  v3[8] = v4;
  v3[9] = *(void *)(v4 - 8);
  v3[10] = swift_task_alloc();
  v3[11] = type metadata accessor for AnnounceCallsEntity();
  v3[12] = swift_task_alloc();
  v3[13] = swift_task_alloc();
  uint64_t v5 = sub_100005268(&qword_100082A08);
  v3[14] = v5;
  v3[15] = *(void *)(v5 - 8);
  v3[16] = swift_task_alloc();
  v3[17] = swift_task_alloc();
  return _swift_task_switch(sub_10004C998, 0, 0);
}

uint64_t sub_10004C998()
{
  sub_10005E3F0();
  uint64_t v1 = (void *)swift_task_alloc();
  v0[18] = v1;
  uint64_t v2 = sub_10004E0BC(&qword_1000828A8);
  void *v1 = v0;
  v1[1] = sub_10004CA80;
  uint64_t v3 = v0[17];
  uint64_t v4 = v0[13];
  uint64_t v5 = v0[11];
  return IntentDialog._CapturedContent.init<>(entity:_:)(v3, v4, sub_10004D098, 0, v5, v2);
}

uint64_t sub_10004CA80()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_10004CB7C, 0, 0);
}

uint64_t sub_10004CB7C()
{
  sub_10005E3F0();
  sub_10005E3F0();
  if (qword_1000805D8 != -1) {
    swift_once();
  }
  uint64_t v1 = qword_100083C00;
  *(void *)(v0 + 152) = qword_100083C00;
  swift_retain();
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 160) = v2;
  uint64_t v3 = sub_100009DAC(&qword_1000829D0, &qword_1000829D8);
  *uint64_t v2 = v0;
  v2[1] = sub_10004CCBC;
  return AppEntity._setValue<A, B, C>(_:for:)(v0 + 176, v1, &type metadata for AnnounceCallsOption, v3);
}

uint64_t sub_10004CCBC()
{
  uint64_t v2 = *(void *)(*(void *)v1 + 96);
  *(void *)(*(void *)v1 + 168) = v0;
  swift_task_dealloc();
  sub_10004F154(v2);
  swift_release();
  if (v0) {
    uint64_t v3 = sub_100006990;
  }
  else {
    uint64_t v3 = sub_10004CE10;
  }
  return _swift_task_switch(v3, 0, 0);
}

uint64_t sub_10004CE10()
{
  uint64_t v1 = v0[15];
  uint64_t v10 = v0[16];
  uint64_t v2 = v0[14];
  uint64_t v11 = v0[13];
  uint64_t v12 = v0[17];
  uint64_t v3 = v0[10];
  uint64_t v14 = v0[8];
  uint64_t v4 = v0[5];
  uint64_t v5 = v0[6];
  uint64_t v13 = v0[9];
  sub_10005E3F0();
  uint64_t v6 = sub_10005E750();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  uint64_t v7 = sub_10005E790();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v4, 1, 1, v7);
  sub_10003C8B0();
  sub_10004E0BC(&qword_1000821E8);
  sub_10005E350();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v1 + 16))(v10, v12, v2);
  sub_10005E370();
  sub_10005E3A0();
  (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v3, v14);
  sub_10004F154(v11);
  (*(void (**)(uint64_t, uint64_t))(v1 + 8))(v12, v2);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  char v8 = (uint64_t (*)(void))v0[1];
  return v8();
}

uint64_t sub_10004D09C()
{
  uint64_t v0 = sub_100005268(&qword_100082A10);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1000805D8 != -1) {
    swift_once();
  }
  swift_retain();
  sub_10005E5D0();
  swift_release();
  type metadata accessor for AnnounceCallsEntity();
  sub_10004E0BC(&qword_1000821E8);
  sub_100009DAC(&qword_100082A18, &qword_100082A10);
  sub_10005E5C0();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t sub_10004D228()
{
  if (qword_1000805D8 != -1) {
    swift_once();
  }

  return swift_retain();
}

unint64_t sub_10004D288()
{
  unint64_t result = qword_100082878;
  if (!qword_100082878)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100082878);
  }
  return result;
}

unint64_t sub_10004D2E0()
{
  unint64_t result = qword_100082880;
  if (!qword_100082880)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100082880);
  }
  return result;
}

uint64_t sub_10004D334()
{
  return *(void *)(swift_getOpaqueTypeConformance2() + 8);
}

uint64_t sub_10004D368(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_10004D394(a1, a2, a3, (void (*)(void))sub_10003C8B0);
}

uint64_t sub_10004D394(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10004D3DC@<X0>(uint64_t a1@<X8>)
{
  return sub_10004DF40(&qword_1000805C8, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_100083BD0, a1);
}

uint64_t sub_10004D414@<X0>(uint64_t a1@<X8>)
{
  if (qword_1000805D0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100005268(&qword_100080B20);
  uint64_t v3 = sub_1000052AC(v2, (uint64_t)qword_100083BE8);
  return sub_10004F350(v3, a1, &qword_100080B20);
}

uint64_t sub_10004D48C(uint64_t a1)
{
  uint64_t v5 = *v1;
  uint64_t v4 = v1[1];
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v6;
  *uint64_t v6 = v2;
  v6[1] = sub_1000042AC;
  return sub_10004C794(a1, v5, v4);
}

uint64_t sub_10004D538@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10004ECBC();
  *a1 = result;
  a1[1] = v3;
  return result;
}

unint64_t sub_10004D560()
{
  return 0xD000000000000024;
}

uint64_t sub_10004D57C(void *a1)
{
  a1[1] = sub_10004E0BC(&qword_100082890);
  a1[2] = sub_10004E0BC(&qword_100082898);
  uint64_t result = sub_10004E0BC(&qword_1000828A0);
  a1[3] = result;
  return result;
}

uint64_t sub_10004D608()
{
  return sub_10004E0BC(&qword_1000828A8);
}

uint64_t sub_10004D63C()
{
  return sub_10004E0BC(&qword_1000828B0);
}

uint64_t sub_10004D670(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return _swift_task_switch(sub_10004D690, 0, 0);
}

uint64_t sub_10004D690()
{
  id v1 = [objc_allocWithZone((Class)TUUserConfiguration) init];
  id v2 = [v1 announceCalls];

  if ((unint64_t)v2 >= 4) {
    char v3 = 0;
  }
  else {
    char v3 = (char)v2;
  }
  **(unsigned char **)(v0 + 16) = v3;
  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

uint64_t sub_10004D72C(uint64_t a1, unsigned char *a2)
{
  *(unsigned char *)(v2 + 16) = *a2;
  return _swift_task_switch(sub_10004D750, 0, 0);
}

uint64_t sub_10004D750()
{
  uint64_t v1 = *(unsigned __int8 *)(v0 + 16);
  id v2 = [objc_allocWithZone((Class)TUUserConfiguration) init];
  [v2 setAnnounceCalls:v1];

  char v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

uint64_t sub_10004D7E0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_100005268(&qword_100080878);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)v18 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100005268(&qword_100080858);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_10005E800();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  sub_10005E890();
  uint64_t v10 = (void *)sub_10005E880();
  sub_10005E860();

  uint64_t v11 = (void *)sub_10005E880();
  char v12 = sub_10005E870();

  if (v12) {
    unint64_t v13 = 0x100000000000001ELL;
  }
  else {
    unint64_t v13 = 0x9286E22069726953;
  }
  if (v12) {
    unint64_t v14 = 0x800000010005F260;
  }
  else {
    unint64_t v14 = 0xA900000000000020;
  }
  sub_10005E7E0();
  v18[0] = v13;
  v18[1] = v14;
  swift_bridgeObjectRetain();
  v19._countAndFlagsBits = 0x65636E756F6E6E41;
  v19._object = (void *)0xEE00736C6C614320;
  sub_10005E9D0(v19);
  swift_bridgeObjectRelease();
  sub_10005E7E0();
  (*(void (**)(char *, void, uint64_t, uint64_t))(v9 + 56))(v7, 0, 1, v8);
  uint64_t v15 = sub_10005E5F0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v4, 1, 1, v15);
  sub_10005E610();
  uint64_t v16 = *(int *)(type metadata accessor for AnnounceCallsEntity() + 20);
  sub_100005268(&qword_100082870);
  sub_10005E7E0();
  sub_100009DAC(&qword_1000829D0, &qword_1000829D8);
  sub_10004BE44();
  uint64_t result = sub_10005E7B0();
  *(void *)(a1 + v16) = result;
  return result;
}

uint64_t sub_10004DB44(uint64_t a1)
{
  uint64_t v2 = qword_1000827C8;
  uint64_t v3 = off_1000827D0;
  uint64_t v4 = sub_10004E0BC(&qword_1000828A8);
  swift_bridgeObjectRetain();

  return EntityURLRepresentation.init(_:)(v2, v3, a1, v4);
}

uint64_t sub_10004DBD4()
{
  return sub_10004E0BC(&qword_1000828B8);
}

uint64_t sub_10004DC08()
{
  return sub_10004E0BC(&qword_1000828C0);
}

uint64_t sub_10004DC3C()
{
  return sub_100009DAC(&qword_1000828C8, &qword_1000828D0);
}

uint64_t sub_10004DC78(uint64_t a1)
{
  uint64_t v2 = sub_10004E0BC(&qword_1000828A0);

  return _UniqueEntityProvider.init(_:)(&unk_100083090, 0, a1, v2);
}

uint64_t sub_10004DCF0()
{
  return sub_100009DAC((unint64_t *)&unk_1000828D8, &qword_1000828D0);
}

uint64_t sub_10004DD2C()
{
  sub_10004E0BC(&qword_100082898);
  uint64_t v2 = sub_10005E6A0();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
  return sub_10000538C(v3, v0, v2, v1);
}

uint64_t sub_10004DDDC()
{
  return sub_10004E0BC(&qword_1000828E8);
}

uint64_t sub_10004DE10()
{
  return sub_10004E0BC(&qword_1000828F0);
}

uint64_t sub_10004DE44()
{
  return sub_10004E0BC(&qword_1000821E8);
}

uint64_t sub_10004DE78()
{
  return sub_10004E0BC(&qword_1000828F8);
}

uint64_t sub_10004DEAC@<X0>(uint64_t *a1@<X8>)
{
  sub_10004E0BC(&qword_1000828A0);
  uint64_t result = sub_10005E3D0();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_10004DF08@<X0>(uint64_t a1@<X8>)
{
  return sub_10004DF40(&qword_1000805B8, (uint64_t (*)(void))&type metadata accessor for TypeDisplayRepresentation, (uint64_t)qword_100083BB0, a1);
}

uint64_t sub_10004DF40@<X0>(void *a1@<X2>, uint64_t (*a2)(void)@<X3>, uint64_t a3@<X4>, uint64_t a4@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v7 = a2(0);
  uint64_t v8 = sub_1000052AC(v7, a3);
  uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 16);

  return v9(a4, v8, v7);
}

uint64_t sub_10004DFE4()
{
  return sub_100009DAC(&qword_100082900, &qword_100082908);
}

uint64_t sub_10004E020(uint64_t a1)
{
  uint64_t v2 = sub_10004E0BC(&qword_1000828A8);

  return static AppEntity.defaultResolverSpecification.getter(a1, v2);
}

uint64_t sub_10004E088()
{
  return sub_10004E0BC(&qword_100082910);
}

uint64_t sub_10004E0BC(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for AnnounceCallsEntity();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10004E100(uint64_t a1)
{
  uint64_t v2 = sub_10004E0BC(&qword_1000828F8);

  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

ValueMetadata *type metadata accessor for AnnounceCallsEntity.UpdateIntent_value()
{
  return &type metadata for AnnounceCallsEntity.UpdateIntent_value;
}

uint64_t sub_10004E178(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10004E18C);
}

uint64_t sub_10004E18C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_10005E620();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20));
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
}

uint64_t sub_10004E24C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10004E260);
}

uint64_t sub_10004E260(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_10005E620();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20)) = (a2 - 1);
  }
  return result;
}

ValueMetadata *type metadata accessor for OpenAnnounceCallsEntity()
{
  return &type metadata for OpenAnnounceCallsEntity;
}

uint64_t getEnumTagSinglePayload for AnnounceCallsOption(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for AnnounceCallsOption(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x10004E488);
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

ValueMetadata *type metadata accessor for AnnounceCallsOption()
{
  return &type metadata for AnnounceCallsOption;
}

uint64_t sub_10004E4C0()
{
  return sub_100009DAC(&qword_1000829A8, &qword_1000829B0);
}

uint64_t sub_10004E4FC()
{
  return sub_100009DAC(&qword_1000829B8, &qword_1000829B0);
}

unint64_t sub_10004E538(char a1)
{
  sub_10005EB90();
  sub_10005E9C0();
  swift_bridgeObjectRelease();
  Swift::Int v2 = sub_10005EBA0();

  return sub_10004E68C(a1, v2);
}

unint64_t sub_10004E5FC(char a1)
{
  sub_10005EB90();
  sub_10005E9C0();
  swift_bridgeObjectRelease();
  Swift::Int v2 = sub_10005EBA0();

  return sub_10004E824(a1, v2);
}

unint64_t sub_10004E68C(char a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v6 = ~v3;
    while (1)
    {
      int v7 = *(unsigned __int8 *)(*(void *)(v2 + 48) + v4);
      uint64_t v8 = 0x737961776C61;
      if (v7 != 1) {
        uint64_t v8 = 0x726576656ELL;
      }
      unint64_t v9 = 0xE600000000000000;
      if (v7 != 1) {
        unint64_t v9 = 0xE500000000000000;
      }
      if (*(unsigned char *)(*(void *)(v2 + 48) + v4)) {
        unint64_t v10 = v8;
      }
      else {
        unint64_t v10 = 0xD000000000000011;
      }
      if (*(unsigned char *)(*(void *)(v2 + 48) + v4)) {
        unint64_t v11 = v9;
      }
      else {
        unint64_t v11 = 0x800000010005EF60;
      }
      if (a1)
      {
        if (a1 == 1) {
          uint64_t v12 = 0x737961776C61;
        }
        else {
          uint64_t v12 = 0x726576656ELL;
        }
        if (a1 == 1) {
          unint64_t v13 = 0xE600000000000000;
        }
        else {
          unint64_t v13 = 0xE500000000000000;
        }
        if (v10 != v12) {
          goto LABEL_24;
        }
      }
      else
      {
        unint64_t v13 = 0x800000010005EF60;
        if (v10 != 0xD000000000000011) {
          goto LABEL_24;
        }
      }
      if (v11 == v13)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        return v4;
      }
LABEL_24:
      char v14 = sub_10005EB40();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v14 & 1) == 0)
      {
        unint64_t v4 = (v4 + 1) & v6;
        if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4)) {
          continue;
        }
      }
      return v4;
    }
  }
  return v4;
}

unint64_t sub_10004E824(char a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    uint64_t v6 = 8 * a1;
    uint64_t v7 = *(void *)&aNever_2[v6];
    uint64_t v8 = *(void *)&aHandsfreheadph[v6 + 16];
    while (*(void *)&aNever_2[8 * *(char *)(*(void *)(v2 + 48) + v4)] != v7
         || *(void *)&aHandsfreheadph[8 * *(char *)(*(void *)(v2 + 48) + v4) + 16] != v8)
    {
      char v10 = sub_10005EB40();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v10 & 1) == 0)
      {
        unint64_t v4 = (v4 + 1) & v5;
        if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4)) {
          continue;
        }
      }
      return v4;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return v4;
}

uint64_t sub_10004E938()
{
  uint64_t v22 = sub_10005E720();
  uint64_t v0 = *(void *)(v22 - 8);
  __chkstk_darwin(v22);
  uint64_t v2 = (char *)&v21 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100005268(&qword_100080848);
  uint64_t v4 = __chkstk_darwin(v3 - 8);
  uint64_t v6 = (char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v21 - v7;
  uint64_t v9 = sub_100005268(&qword_1000829E0);
  __chkstk_darwin(v9 - 8);
  unint64_t v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100005268(&qword_100080858);
  __chkstk_darwin(v12 - 8);
  char v14 = (char *)&v21 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_10005E800();
  uint64_t v16 = *(void *)(v15 - 8);
  __chkstk_darwin(v15);
  uint64_t v21 = sub_100005268(&qword_1000829E8);
  sub_10005E7E0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v16 + 56))(v14, 1, 1, v15);
  uint64_t v17 = type metadata accessor for AnnounceCallsEntity();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v11, 1, 1, v17);
  uint64_t v18 = sub_10005E390();
  Swift::String v19 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56);
  v19(v8, 1, 1, v18);
  v19(v6, 1, 1, v18);
  (*(void (**)(char *, void, uint64_t))(v0 + 104))(v2, enum case for InputConnectionBehavior.default(_:), v22);
  sub_10004E0BC(&qword_1000828A8);
  return sub_10005E420();
}

uint64_t sub_10004ECBC()
{
  uint64_t v34 = sub_10005E720();
  uint64_t v0 = *(void *)(v34 - 8);
  __chkstk_darwin(v34);
  uint64_t v2 = (char *)v26 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100005268(&qword_100080848);
  uint64_t v4 = __chkstk_darwin(v3 - 8);
  uint64_t v6 = (char *)v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)v26 - v7;
  uint64_t v9 = sub_100005268(&qword_1000829E0);
  __chkstk_darwin(v9 - 8);
  unint64_t v11 = (char *)v26 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26[1] = v11;
  uint64_t v12 = sub_100005268(&qword_100080858);
  __chkstk_darwin(v12 - 8);
  char v14 = (char *)v26 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = v14;
  uint64_t v15 = sub_10005E800();
  uint64_t v32 = v15;
  uint64_t v16 = *(void *)(v15 - 8);
  __chkstk_darwin(v15);
  uint64_t v30 = sub_100005268(&qword_1000829E8);
  sub_10005E7E0();
  uint64_t v17 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v16 + 56);
  uint64_t v31 = v16 + 56;
  uint64_t v33 = v17;
  v17(v14, 1, 1, v15);
  uint64_t v18 = type metadata accessor for AnnounceCallsEntity();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v11, 1, 1, v18);
  uint64_t v19 = sub_10005E390();
  unint64_t v20 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56);
  v20(v8, 1, 1, v19);
  uint64_t v21 = v6;
  v20(v6, 1, 1, v19);
  unsigned int v28 = enum case for InputConnectionBehavior.default(_:);
  uint64_t v22 = *(void (**)(void))(v0 + 104);
  void v26[2] = v0 + 104;
  uint64_t v27 = (void (*)(char *, void, uint64_t))v22;
  uint64_t v23 = v34;
  v22(v2);
  sub_10004E0BC(&qword_1000828A8);
  uint64_t v24 = v29;
  uint64_t v30 = sub_10005E420();
  sub_100005268(&qword_1000829F0);
  sub_10005E7E0();
  v33(v24, 1, 1, v32);
  char v35 = 4;
  v20(v8, 1, 1, v19);
  v20(v21, 1, 1, v19);
  v27(v2, v28, v23);
  sub_10004BE44();
  sub_10005E410();
  return v30;
}

uint64_t sub_10004F154(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for AnnounceCallsEntity();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10004F1B0@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  *a2 = *(void *)(a1 + *(int *)(type metadata accessor for AnnounceCallsEntity() + 20));

  return swift_retain();
}

uint64_t sub_10004F1F8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for AnnounceCallsEntity();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_10004F25C()
{
  unint64_t result = qword_100082A20;
  if (!qword_100082A20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100082A20);
  }
  return result;
}

unint64_t sub_10004F2B0()
{
  unint64_t result = qword_100082A28;
  if (!qword_100082A28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100082A28);
  }
  return result;
}

uint64_t sub_10004F304(uint64_t a1, void *a2)
{
  v6._countAndFlagsBits = a1;
  v3._rawValue = &off_10007D760;
  v6._object = a2;
  unint64_t v4 = sub_10005EB30(v3, v6);
  swift_bridgeObjectRelease();
  if (v4 >= 4) {
    return 4;
  }
  else {
    return v4;
  }
}

uint64_t sub_10004F350(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100005268(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

void *initializeBufferWithCopyOfBuffer for AssistantSettingsControlError(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for AssistantSettingsControlError()
{
  return swift_bridgeObjectRelease();
}

void *assignWithCopy for AssistantSettingsControlError(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *assignWithTake for AssistantSettingsControlError(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for AssistantSettingsControlError(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for AssistantSettingsControlError(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for AssistantSettingsControlError()
{
  return &type metadata for AssistantSettingsControlError;
}

uint64_t sub_10004F50C()
{
  uint64_t v0 = sub_100005268(&qword_100082A58);

  return TupleWidget.init(_:)(v0, v0);
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

unint64_t sub_10004F58C()
{
  unint64_t result = qword_100082A50;
  if (!qword_100082A50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100082A50);
  }
  return result;
}

ValueMetadata *type metadata accessor for AssistantSettingsControlsBundle()
{
  return &type metadata for AssistantSettingsControlsBundle;
}

uint64_t sub_10004F5F0()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_10004F610()
{
  unint64_t result = qword_100082A60;
  if (!qword_100082A60)
  {
    sub_1000041B0(&qword_100082A68);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100082A60);
  }
  return result;
}

unint64_t sub_10004F670()
{
  unint64_t result = qword_100082A80;
  if (!qword_100082A80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100082A80);
  }
  return result;
}

uint64_t sub_10004F6C4()
{
  return sub_100050EEC(&qword_100082A88);
}

uint64_t type metadata accessor for MyInformationEntity()
{
  uint64_t result = qword_100082BD0;
  if (!qword_100082BD0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_10004F744()
{
  uint64_t v0 = sub_10005E800();
  sub_1000052E4(v0, qword_100083C08);
  sub_1000052AC(v0, (uint64_t)qword_100083C08);
  return sub_10005E7E0();
}

uint64_t sub_10004F7A8(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for MyInformationEntity();
  __chkstk_darwin(v2 - 8);
  sub_100050F30(a1, (uint64_t)&v5 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_10005E400();
  return sub_1000513C0(a1);
}

uint64_t sub_10004F83C(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_100051318();
  uint64_t v5 = sub_100050EEC(&qword_100082C08);

  return static URLRepresentableIntent<>.urlRepresentation.getter(a1, v4, a2, v5);
}

unint64_t sub_10004F8C4()
{
  unint64_t result = qword_100082A90;
  if (!qword_100082A90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100082A90);
  }
  return result;
}

unint64_t sub_10004F91C()
{
  unint64_t result = qword_100082A98;
  if (!qword_100082A98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100082A98);
  }
  return result;
}

uint64_t sub_10004F970()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10004F9C0@<X0>(uint64_t a1@<X8>)
{
  return sub_100004864(&qword_1000805E0, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_100083C08, a1);
}

uint64_t sub_10004F9F8(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  unint64_t v5 = sub_100051318();
  unint64_t v6 = sub_10005136C();
  uint64_t v7 = sub_100050EEC(&qword_100082C08);
  *unint64_t v4 = v2;
  v4[1] = sub_100003184;
  return URLRepresentableIntent<>.perform()(a2, v5, v6, v7);
}

uint64_t sub_10004FAE0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100050F94();
  *a1 = result;
  return result;
}

uint64_t sub_10004FB08(uint64_t a1)
{
  unint64_t v2 = sub_10003C70C();

  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

unint64_t sub_10004FB48()
{
  unint64_t result = qword_100082AA8;
  if (!qword_100082AA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100082AA8);
  }
  return result;
}

uint64_t sub_10004FB9C()
{
  return sub_100050EEC((unint64_t *)&unk_100082AB0);
}

uint64_t sub_10004FBD0()
{
  uint64_t v0 = sub_100005268(&qword_100080858);
  __chkstk_darwin(v0 - 8);
  unint64_t v2 = (char *)v12 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12[0] = sub_10005E7F0();
  uint64_t v3 = *(void *)(v12[0] - 8);
  __chkstk_darwin(v12[0]);
  unint64_t v5 = (char *)v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10005E830();
  __chkstk_darwin(v6 - 8);
  uint64_t v7 = sub_10005E990();
  __chkstk_darwin(v7 - 8);
  uint64_t v8 = sub_10005E800();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v10 = sub_10005E780();
  sub_1000052E4(v10, qword_100083C20);
  sub_1000052AC(v10, (uint64_t)qword_100083C20);
  sub_10005E980();
  sub_10005E820();
  (*(void (**)(char *, void, void))(v3 + 104))(v5, enum case for LocalizedStringResource.BundleDescription.main(_:), v12[0]);
  sub_10005E810();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(v2, 1, 1, v8);
  return sub_10005E770();
}

uint64_t sub_10004FEC0()
{
  uint64_t v0 = type metadata accessor for MyInformationEntity();
  sub_1000052E4(v0, qword_100083C38);
  sub_1000052AC(v0, (uint64_t)qword_100083C38);
  return sub_10004FF0C();
}

uint64_t sub_10004FF0C()
{
  uint64_t v0 = sub_100005268(&qword_100080878);
  __chkstk_darwin(v0 - 8);
  unint64_t v2 = (char *)v15 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100005268(&qword_100080858);
  __chkstk_darwin(v3 - 8);
  unint64_t v5 = (char *)v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10005E800();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  sub_10005E890();
  uint64_t v8 = (void *)sub_10005E880();
  sub_10005E860();

  uint64_t v9 = (void *)sub_10005E880();
  char v10 = sub_10005E870();

  if (v10) {
    unint64_t v11 = 0x100000000000001ELL;
  }
  else {
    unint64_t v11 = 0x9286E22069726953;
  }
  if (v10) {
    unint64_t v12 = 0x800000010005F260;
  }
  else {
    unint64_t v12 = 0xA900000000000020;
  }
  sub_10005E7E0();
  v15[0] = v11;
  v15[1] = v12;
  swift_bridgeObjectRetain();
  v16._countAndFlagsBits = 0x726F666E4920794DLL;
  v16._object = (void *)0xEE006E6F6974616DLL;
  sub_10005E9D0(v16);
  swift_bridgeObjectRelease();
  sub_10005E7E0();
  (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v5, 0, 1, v6);
  uint64_t v13 = sub_10005E5F0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v2, 1, 1, v13);
  return sub_10005E610();
}

id sub_1000501B0()
{
  id result = [self sharedController];
  qword_100083C50 = (uint64_t)result;
  return result;
}

uint64_t sub_1000501EC(uint64_t a1)
{
  if ([*v1 assistantIsEnabled])
  {
    if (qword_1000805F0 != -1) {
      swift_once();
    }
    uint64_t v4 = type metadata accessor for MyInformationEntity();
    uint64_t v5 = sub_1000052AC(v4, (uint64_t)qword_100083C38);
    sub_100050F30(v5, a1);
    uint64_t v6 = *(uint64_t (**)(void))(v2 + 8);
  }
  else
  {
    sub_1000053A0();
    swift_allocError();
    *uint64_t v7 = 0xD00000000000002ELL;
    v7[1] = 0x800000010005F210;
    swift_willThrow();
    uint64_t v6 = *(uint64_t (**)(void))(v2 + 8);
  }
  return sub_1000053F4(v6);
}

unint64_t sub_100050354()
{
  unint64_t result = qword_100082AC0;
  if (!qword_100082AC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100082AC0);
  }
  return result;
}

uint64_t sub_1000503A8(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v4;
  unint64_t v5 = sub_100050878();
  *uint64_t v4 = v2;
  v4[1] = sub_100003BF0;
  return _UniqueEntityQuery.allEntities()(a2, v5);
}

unint64_t sub_10005045C()
{
  unint64_t result = qword_100082AD0;
  if (!qword_100082AD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100082AD0);
  }
  return result;
}

unint64_t sub_1000504B4()
{
  unint64_t result = qword_100082AD8;
  if (!qword_100082AD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100082AD8);
  }
  return result;
}

uint64_t sub_100050508()
{
  return sub_100050EEC(qword_100082AE0);
}

uint64_t sub_10005053C(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_100050878();
  *unint64_t v5 = v2;
  v5[1] = sub_100003EE0;
  return _UniqueEntityQuery.entities(for:)(a1, a2, v6);
}

uint64_t sub_1000505F0(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v4;
  unint64_t v5 = sub_100050878();
  *uint64_t v4 = v2;
  v4[1] = sub_100005568;
  return _UniqueEntityQuery.suggestedEntities()(a2, v5);
}

unint64_t sub_1000506A4()
{
  unint64_t result = qword_100082AF8;
  if (!qword_100082AF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100082AF8);
  }
  return result;
}

uint64_t sub_1000506F8()
{
  return sub_100050EEC(&qword_100082160);
}

unint64_t sub_100050730()
{
  unint64_t result = qword_100082B00;
  if (!qword_100082B00)
  {
    sub_1000041B0(qword_100082B08);
    sub_100050EEC(&qword_100082160);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100082B00);
  }
  return result;
}

uint64_t sub_1000507C0(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_100050354();
  *unint64_t v5 = v2;
  v5[1] = sub_1000042AC;
  return EntityQuery.results()(a1, a2, v6);
}

unint64_t sub_100050878()
{
  unint64_t result = qword_100082B20;
  if (!qword_100082B20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100082B20);
  }
  return result;
}

uint64_t sub_1000508CC()
{
  return sub_100050EEC(&qword_100082B28);
}

uint64_t sub_100050900(uint64_t a1)
{
  uint64_t v2 = sub_100050EEC(qword_100082AE0);

  return EntityURLRepresentation.init(_:)(0xD000000000000035, 0x8000000100063220, a1, v2);
}

uint64_t sub_100050978()
{
  uint64_t v0 = qword_100082A70;
  swift_bridgeObjectRetain();
  return v0;
}

uint64_t sub_1000509B0()
{
  return sub_100050EEC(&qword_100082B30);
}

uint64_t sub_1000509E4()
{
  return sub_100050EEC((unint64_t *)&unk_100082B38);
}

id sub_100050A18@<X0>(void *a1@<X8>)
{
  if (qword_1000805F8 != -1) {
    swift_once();
  }
  uint64_t v2 = (void *)qword_100083C50;
  *a1 = qword_100083C50;

  return v2;
}

uint64_t sub_100050A84()
{
  sub_100050EEC(&qword_100082C08);
  uint64_t v2 = sub_10005E6A0();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
  return sub_10000538C(v3, v0, v2, v1);
}

uint64_t sub_100050B34()
{
  return sub_100050EEC(&qword_100082B48);
}

uint64_t sub_100050B68()
{
  return sub_100050EEC(&qword_100082B50);
}

uint64_t sub_100050B9C()
{
  return sub_100050EEC(&qword_100082B58);
}

uint64_t sub_100050BD0@<X0>(uint64_t *a1@<X8>)
{
  sub_100050EEC((unint64_t *)&unk_100082AB0);
  uint64_t result = sub_10005E3D0();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_100050C2C@<X0>(uint64_t a1@<X8>)
{
  return sub_100004864(&qword_1000805E8, (uint64_t (*)(void))&type metadata accessor for TypeDisplayRepresentation, (uint64_t)qword_100083C20, a1);
}

unint64_t sub_100050C68()
{
  unint64_t result = qword_100082B60;
  if (!qword_100082B60)
  {
    sub_1000041B0(&qword_100082B68);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100082B60);
  }
  return result;
}

uint64_t sub_100050CC4(uint64_t a1)
{
  uint64_t v2 = sub_100050EEC(qword_100082AE0);

  return static AppEntity.defaultResolverSpecification.getter(a1, v2);
}

uint64_t sub_100050D2C()
{
  return sub_100050EEC(&qword_100082B70);
}

uint64_t sub_100050D60(uint64_t a1)
{
  uint64_t v2 = sub_100050EEC(&qword_100082B58);

  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

ValueMetadata *type metadata accessor for MyInformationEntity.MyInformationEntityQuery()
{
  return &type metadata for MyInformationEntity.MyInformationEntityQuery;
}

uint64_t sub_100050DD8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100050DEC);
}

uint64_t sub_100050DEC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10005E620();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);

  return v5(a1, a2, v4);
}

uint64_t sub_100050E58(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100050E6C);
}

uint64_t sub_100050E6C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10005E620();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);

  return v5(a1, a2, a2, v4);
}

ValueMetadata *type metadata accessor for OpenMyInformationEntity()
{
  return &type metadata for OpenMyInformationEntity;
}

uint64_t sub_100050EEC(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for MyInformationEntity();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100050F30(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for MyInformationEntity();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100050F94()
{
  uint64_t v22 = sub_10005E720();
  uint64_t v0 = *(void *)(v22 - 8);
  __chkstk_darwin(v22);
  uint64_t v2 = (char *)&v21 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100005268(&qword_100080848);
  uint64_t v4 = __chkstk_darwin(v3 - 8);
  unint64_t v6 = (char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v21 - v7;
  uint64_t v9 = sub_100005268(&qword_100082C10);
  __chkstk_darwin(v9 - 8);
  unint64_t v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100005268(&qword_100080858);
  __chkstk_darwin(v12 - 8);
  char v14 = (char *)&v21 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_10005E800();
  uint64_t v16 = *(void *)(v15 - 8);
  __chkstk_darwin(v15);
  uint64_t v21 = sub_100005268(&qword_100082C18);
  sub_10005E7E0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v16 + 56))(v14, 1, 1, v15);
  uint64_t v17 = type metadata accessor for MyInformationEntity();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v11, 1, 1, v17);
  uint64_t v18 = sub_10005E390();
  uint64_t v19 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56);
  v19(v8, 1, 1, v18);
  v19(v6, 1, 1, v18);
  (*(void (**)(char *, void, uint64_t))(v0 + 104))(v2, enum case for InputConnectionBehavior.default(_:), v22);
  sub_100050EEC(qword_100082AE0);
  return sub_10005E420();
}

unint64_t sub_100051318()
{
  unint64_t result = qword_100082C20;
  if (!qword_100082C20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100082C20);
  }
  return result;
}

unint64_t sub_10005136C()
{
  unint64_t result = qword_100082C28;
  if (!qword_100082C28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100082C28);
  }
  return result;
}

uint64_t sub_1000513C0(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for MyInformationEntity();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_100051420()
{
  unint64_t result = qword_100082C40;
  if (!qword_100082C40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100082C40);
  }
  return result;
}

uint64_t sub_100051474()
{
  return sub_100052C94(&qword_100082C48);
}

uint64_t type metadata accessor for SiriVoiceEntity()
{
  uint64_t result = qword_100082D90;
  if (!qword_100082D90) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1000514F4()
{
  uint64_t v0 = sub_10005E800();
  sub_1000052E4(v0, qword_100083C58);
  sub_1000052AC(v0, (uint64_t)qword_100083C58);
  return sub_10005E7E0();
}

uint64_t sub_100051560(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for SiriVoiceEntity();
  __chkstk_darwin(v2 - 8);
  sub_100052CD8(a1, (uint64_t)&v5 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_10005E400();
  return sub_100053168(a1);
}

uint64_t sub_1000515F4(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_1000530C0();
  uint64_t v5 = sub_100052C94(&qword_100082DC8);

  return static URLRepresentableIntent<>.urlRepresentation.getter(a1, v4, a2, v5);
}

unint64_t sub_10005167C()
{
  unint64_t result = qword_100082C50;
  if (!qword_100082C50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100082C50);
  }
  return result;
}

unint64_t sub_1000516D4()
{
  unint64_t result = qword_100082C58;
  if (!qword_100082C58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100082C58);
  }
  return result;
}

uint64_t sub_100051728()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100051778@<X0>(uint64_t a1@<X8>)
{
  return sub_100004864(&qword_100080600, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_100083C58, a1);
}

uint64_t sub_1000517B0(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  unint64_t v5 = sub_1000530C0();
  unint64_t v6 = sub_100053114();
  uint64_t v7 = sub_100052C94(&qword_100082DC8);
  *unint64_t v4 = v2;
  v4[1] = sub_100003184;
  return URLRepresentableIntent<>.perform()(a2, v5, v6, v7);
}

uint64_t sub_100051898@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100052D3C();
  *a1 = result;
  return result;
}

uint64_t sub_1000518C0(uint64_t a1)
{
  unint64_t v2 = sub_10003C85C();

  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

unint64_t sub_100051900()
{
  unint64_t result = qword_100082C68;
  if (!qword_100082C68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100082C68);
  }
  return result;
}

uint64_t sub_100051954()
{
  return sub_100052C94((unint64_t *)&unk_100082C70);
}

uint64_t sub_100051988()
{
  uint64_t v0 = sub_100005268(&qword_100080858);
  __chkstk_darwin(v0 - 8);
  unint64_t v2 = (char *)v12 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12[0] = sub_10005E7F0();
  uint64_t v3 = *(void *)(v12[0] - 8);
  __chkstk_darwin(v12[0]);
  unint64_t v5 = (char *)v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10005E830();
  __chkstk_darwin(v6 - 8);
  uint64_t v7 = sub_10005E990();
  __chkstk_darwin(v7 - 8);
  uint64_t v8 = sub_10005E800();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v10 = sub_10005E780();
  sub_1000052E4(v10, qword_100083C70);
  sub_1000052AC(v10, (uint64_t)qword_100083C70);
  sub_10005E980();
  sub_10005E820();
  (*(void (**)(char *, void, void))(v3 + 104))(v5, enum case for LocalizedStringResource.BundleDescription.main(_:), v12[0]);
  sub_10005E810();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(v2, 1, 1, v8);
  return sub_10005E770();
}

uint64_t sub_100051C78()
{
  uint64_t v0 = type metadata accessor for SiriVoiceEntity();
  sub_1000052E4(v0, qword_100083C88);
  sub_1000052AC(v0, (uint64_t)qword_100083C88);
  return sub_100051CC4();
}

uint64_t sub_100051CC4()
{
  uint64_t v0 = sub_100005268(&qword_100080878);
  __chkstk_darwin(v0 - 8);
  unint64_t v2 = (char *)v15 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100005268(&qword_100080858);
  __chkstk_darwin(v3 - 8);
  unint64_t v5 = (char *)v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10005E800();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  sub_10005E890();
  uint64_t v8 = (void *)sub_10005E880();
  sub_10005E860();

  uint64_t v9 = (void *)sub_10005E880();
  char v10 = sub_10005E870();

  if (v10) {
    unint64_t v11 = 0x100000000000001ELL;
  }
  else {
    unint64_t v11 = 0x9286E22069726953;
  }
  if (v10) {
    unint64_t v12 = 0x800000010005F260;
  }
  else {
    unint64_t v12 = 0xA900000000000020;
  }
  sub_10005E7E0();
  v15[0] = v11;
  v15[1] = v12;
  swift_bridgeObjectRetain();
  v16._countAndFlagsBits = 0x696F562069726953;
  v16._object = (void *)0xEA00000000006563;
  sub_10005E9D0(v16);
  swift_bridgeObjectRelease();
  sub_10005E7E0();
  (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v5, 0, 1, v6);
  uint64_t v13 = sub_10005E5F0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v2, 1, 1, v13);
  return sub_10005E610();
}

id sub_100051F58()
{
  id result = [self sharedController];
  qword_100083CA0 = (uint64_t)result;
  return result;
}

uint64_t sub_100051F94(uint64_t a1)
{
  if ([*v1 assistantIsEnabled])
  {
    if (qword_100080610 != -1) {
      swift_once();
    }
    uint64_t v4 = type metadata accessor for SiriVoiceEntity();
    uint64_t v5 = sub_1000052AC(v4, (uint64_t)qword_100083C88);
    sub_100052CD8(v5, a1);
    uint64_t v6 = *(uint64_t (**)(void))(v2 + 8);
  }
  else
  {
    sub_1000053A0();
    swift_allocError();
    *uint64_t v7 = 0xD00000000000002ELL;
    v7[1] = 0x800000010005F210;
    swift_willThrow();
    uint64_t v6 = *(uint64_t (**)(void))(v2 + 8);
  }
  return sub_1000053F4(v6);
}

unint64_t sub_1000520FC()
{
  unint64_t result = qword_100082C80;
  if (!qword_100082C80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100082C80);
  }
  return result;
}

uint64_t sub_100052150(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v4;
  unint64_t v5 = sub_100052620();
  *uint64_t v4 = v2;
  v4[1] = sub_100003BF0;
  return _UniqueEntityQuery.allEntities()(a2, v5);
}

unint64_t sub_100052204()
{
  unint64_t result = qword_100082C90;
  if (!qword_100082C90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100082C90);
  }
  return result;
}

unint64_t sub_10005225C()
{
  unint64_t result = qword_100082C98;
  if (!qword_100082C98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100082C98);
  }
  return result;
}

uint64_t sub_1000522B0()
{
  return sub_100052C94(qword_100082CA0);
}

uint64_t sub_1000522E4(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_100052620();
  *unint64_t v5 = v2;
  v5[1] = sub_100003EE0;
  return _UniqueEntityQuery.entities(for:)(a1, a2, v6);
}

uint64_t sub_100052398(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v4;
  unint64_t v5 = sub_100052620();
  *uint64_t v4 = v2;
  v4[1] = sub_100005568;
  return _UniqueEntityQuery.suggestedEntities()(a2, v5);
}

unint64_t sub_10005244C()
{
  unint64_t result = qword_100082CB8;
  if (!qword_100082CB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100082CB8);
  }
  return result;
}

uint64_t sub_1000524A0()
{
  return sub_100052C94(&qword_1000820B0);
}

unint64_t sub_1000524D8()
{
  unint64_t result = qword_100082CC0;
  if (!qword_100082CC0)
  {
    sub_1000041B0(qword_100082CC8);
    sub_100052C94(&qword_1000820B0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100082CC0);
  }
  return result;
}

uint64_t sub_100052568(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_1000520FC();
  *unint64_t v5 = v2;
  v5[1] = sub_1000042AC;
  return EntityQuery.results()(a1, a2, v6);
}

unint64_t sub_100052620()
{
  unint64_t result = qword_100082CE0;
  if (!qword_100082CE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100082CE0);
  }
  return result;
}

uint64_t sub_100052674()
{
  return sub_100052C94(&qword_100082CE8);
}

uint64_t sub_1000526A8(uint64_t a1)
{
  uint64_t v2 = sub_100052C94(qword_100082CA0);

  return EntityURLRepresentation.init(_:)(0xD000000000000036, 0x80000001000632D0, a1, v2);
}

uint64_t sub_100052720()
{
  uint64_t v0 = qword_100082C30;
  swift_bridgeObjectRetain();
  return v0;
}

uint64_t sub_100052758()
{
  return sub_100052C94(&qword_100082CF0);
}

uint64_t sub_10005278C()
{
  return sub_100052C94((unint64_t *)&unk_100082CF8);
}

id sub_1000527C0@<X0>(void *a1@<X8>)
{
  if (qword_100080618 != -1) {
    swift_once();
  }
  uint64_t v2 = (void *)qword_100083CA0;
  *a1 = qword_100083CA0;

  return v2;
}

uint64_t sub_10005282C()
{
  sub_100052C94(&qword_100082DC8);
  uint64_t v2 = sub_10005E6A0();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
  return sub_10000538C(v3, v0, v2, v1);
}

uint64_t sub_1000528DC()
{
  return sub_100052C94(&qword_100082D08);
}

uint64_t sub_100052910()
{
  return sub_100052C94(&qword_100082D10);
}

uint64_t sub_100052944()
{
  return sub_100052C94(&qword_100082D18);
}

uint64_t sub_100052978@<X0>(uint64_t *a1@<X8>)
{
  sub_100052C94((unint64_t *)&unk_100082C70);
  uint64_t result = sub_10005E3D0();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_1000529D4@<X0>(uint64_t a1@<X8>)
{
  return sub_100004864(&qword_100080608, (uint64_t (*)(void))&type metadata accessor for TypeDisplayRepresentation, (uint64_t)qword_100083C70, a1);
}

unint64_t sub_100052A10()
{
  unint64_t result = qword_100082D20;
  if (!qword_100082D20)
  {
    sub_1000041B0(&qword_100082D28);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100082D20);
  }
  return result;
}

uint64_t sub_100052A6C(uint64_t a1)
{
  uint64_t v2 = sub_100052C94(qword_100082CA0);

  return static AppEntity.defaultResolverSpecification.getter(a1, v2);
}

uint64_t sub_100052AD4()
{
  return sub_100052C94(&qword_100082D30);
}

uint64_t sub_100052B08(uint64_t a1)
{
  uint64_t v2 = sub_100052C94(&qword_100082D18);

  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

ValueMetadata *type metadata accessor for SiriVoiceEntity.SiriVoiceEntityQuery()
{
  return &type metadata for SiriVoiceEntity.SiriVoiceEntityQuery;
}

uint64_t sub_100052B80(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100052B94);
}

uint64_t sub_100052B94(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10005E620();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);

  return v5(a1, a2, v4);
}

uint64_t sub_100052C00(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100052C14);
}

uint64_t sub_100052C14(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10005E620();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);

  return v5(a1, a2, a2, v4);
}

ValueMetadata *type metadata accessor for OpenSiriVoiceEntity()
{
  return &type metadata for OpenSiriVoiceEntity;
}

uint64_t sub_100052C94(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for SiriVoiceEntity();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100052CD8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SiriVoiceEntity();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100052D3C()
{
  uint64_t v22 = sub_10005E720();
  uint64_t v0 = *(void *)(v22 - 8);
  __chkstk_darwin(v22);
  uint64_t v2 = (char *)&v21 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100005268(&qword_100080848);
  uint64_t v4 = __chkstk_darwin(v3 - 8);
  unint64_t v6 = (char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v21 - v7;
  uint64_t v9 = sub_100005268(&qword_100082DD0);
  __chkstk_darwin(v9 - 8);
  unint64_t v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100005268(&qword_100080858);
  __chkstk_darwin(v12 - 8);
  char v14 = (char *)&v21 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_10005E800();
  uint64_t v16 = *(void *)(v15 - 8);
  __chkstk_darwin(v15);
  uint64_t v21 = sub_100005268(&qword_100082DD8);
  sub_10005E7E0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v16 + 56))(v14, 1, 1, v15);
  uint64_t v17 = type metadata accessor for SiriVoiceEntity();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v11, 1, 1, v17);
  uint64_t v18 = sub_10005E390();
  uint64_t v19 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56);
  v19(v8, 1, 1, v18);
  v19(v6, 1, 1, v18);
  (*(void (**)(char *, void, uint64_t))(v0 + 104))(v2, enum case for InputConnectionBehavior.default(_:), v22);
  sub_100052C94(qword_100082CA0);
  return sub_10005E420();
}

unint64_t sub_1000530C0()
{
  unint64_t result = qword_100082DE0;
  if (!qword_100082DE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100082DE0);
  }
  return result;
}

unint64_t sub_100053114()
{
  unint64_t result = qword_100082DE8;
  if (!qword_100082DE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100082DE8);
  }
  return result;
}

uint64_t sub_100053168(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for SiriVoiceEntity();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

ValueMetadata *type metadata accessor for AutoSendMessagesHeadphonesToggleControl()
{
  return &type metadata for AutoSendMessagesHeadphonesToggleControl;
}

ValueMetadata *type metadata accessor for AutoSendMessagesCarPlayToggleControl()
{
  return &type metadata for AutoSendMessagesCarPlayToggleControl;
}

ValueMetadata *type metadata accessor for AutoSendMessagesToggleControl()
{
  return &type metadata for AutoSendMessagesToggleControl;
}

uint64_t sub_1000531F4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100053210@<X0>(uint64_t a1@<X8>)
{
  uint64_t v30 = a1;
  uint64_t v1 = sub_100005268(&qword_1000816A8);
  uint64_t v23 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v3 = (char *)&v23 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100005268(&qword_1000816B0);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v24 = v4;
  uint64_t v25 = v5;
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100005268(&qword_1000816B8);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v26 = v8;
  uint64_t v27 = v9;
  __chkstk_darwin(v8);
  unint64_t v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100005268(&qword_1000816C0);
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v28 = v12;
  uint64_t v29 = v13;
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)&v23 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  sub_100005268(&qword_1000816C8);
  sub_1000540E0();
  sub_100009DAC(&qword_1000816D8, &qword_1000816C8);
  sub_10005E970();
  sub_10005E8F0();
  uint64_t v16 = sub_100009DAC(&qword_1000816E0, &qword_1000816A8);
  sub_10005E920();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v23 + 8))(v3, v1);
  sub_10005E8F0();
  uint64_t v31 = v1;
  uint64_t v32 = v16;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v18 = v24;
  sub_10005E900();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v25 + 8))(v7, v18);
  uint64_t v31 = v18;
  uint64_t v32 = OpaqueTypeConformance2;
  uint64_t v19 = swift_getOpaqueTypeConformance2();
  uint64_t v20 = v26;
  sub_10005E930();
  (*(void (**)(char *, uint64_t))(v27 + 8))(v11, v20);
  uint64_t v31 = v20;
  uint64_t v32 = v19;
  swift_getOpaqueTypeConformance2();
  uint64_t v21 = v28;
  sub_10005E910();
  return (*(uint64_t (**)(char *, uint64_t))(v29 + 8))(v15, v21);
}

uint64_t sub_10005370C@<X0>(uint64_t a1@<X8>)
{
  return sub_100053F54(a1);
}

uint64_t sub_100053730()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10005374C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v20 = a1;
  uint64_t v1 = sub_100005268(&qword_1000816A8);
  uint64_t v16 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v3 = (char *)&v15 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100005268(&qword_1000816B0);
  uint64_t v17 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100005268(&qword_100082DF0);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v18 = v7;
  uint64_t v19 = v8;
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  sub_100005268(&qword_1000816C8);
  sub_1000540E0();
  sub_100009DAC(&qword_1000816D8, &qword_1000816C8);
  sub_10005E970();
  sub_10005E8F0();
  uint64_t v11 = sub_100009DAC(&qword_1000816E0, &qword_1000816A8);
  sub_10005E920();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v16 + 8))(v3, v1);
  uint64_t v21 = v1;
  uint64_t v22 = v11;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  sub_10005E930();
  (*(void (**)(char *, uint64_t))(v17 + 8))(v6, v4);
  uint64_t v21 = v4;
  uint64_t v22 = OpaqueTypeConformance2;
  swift_getOpaqueTypeConformance2();
  uint64_t v13 = v18;
  sub_10005E910();
  return (*(uint64_t (**)(char *, uint64_t))(v19 + 8))(v10, v13);
}

uint64_t sub_100053B24@<X0>(uint64_t a1@<X8>)
{
  return sub_100053F54(a1);
}

uint64_t sub_100053B44()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100053B60@<X0>(uint64_t a1@<X8>)
{
  uint64_t v20 = a1;
  uint64_t v1 = sub_100005268(&qword_1000816A8);
  uint64_t v16 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v3 = (char *)&v15 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100005268(&qword_1000816B0);
  uint64_t v17 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100005268(&qword_100082DF0);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v18 = v7;
  uint64_t v19 = v8;
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  sub_100005268(&qword_1000816C8);
  sub_1000540E0();
  sub_100009DAC(&qword_1000816D8, &qword_1000816C8);
  sub_10005E970();
  sub_10005E8F0();
  uint64_t v11 = sub_100009DAC(&qword_1000816E0, &qword_1000816A8);
  sub_10005E920();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v16 + 8))(v3, v1);
  uint64_t v21 = v1;
  uint64_t v22 = v11;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  sub_10005E930();
  (*(void (**)(char *, uint64_t))(v17 + 8))(v6, v4);
  uint64_t v21 = v4;
  uint64_t v22 = OpaqueTypeConformance2;
  swift_getOpaqueTypeConformance2();
  uint64_t v13 = v18;
  sub_10005E910();
  return (*(uint64_t (**)(char *, uint64_t))(v19 + 8))(v10, v13);
}

uint64_t sub_100053F38@<X0>(uint64_t a1@<X8>)
{
  return sub_100053F54(a1);
}

uint64_t sub_100053F54@<X0>(uint64_t a1@<X8>)
{
  sub_10005E8F0();
  uint64_t result = sub_10005E940();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = v4 & 1;
  *(void *)(a1 + 24) = v5;
  return result;
}

uint64_t sub_100053FBC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_100005268(&qword_1000816C8);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10005E8F0();
  sub_10005E950();
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v3 + 32))(a1, v5, v2);
}

unint64_t sub_1000540E0()
{
  unint64_t result = qword_100082DF8;
  if (!qword_100082DF8)
  {
    type metadata accessor for AutoSendMessagesEntity();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100082DF8);
  }
  return result;
}

uint64_t sub_10005413C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10005422C()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_10005435C()
{
  unint64_t result = qword_100082E10;
  if (!qword_100082E10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100082E10);
  }
  return result;
}

uint64_t sub_1000543B0()
{
  return sub_1000587F4(&qword_100082E18);
}

uint64_t type metadata accessor for AutoSendMessagesEntity()
{
  uint64_t result = qword_100082F88;
  if (!qword_100082F88) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_100054430(uint64_t a1, unsigned char *a2)
{
  *(unsigned char *)(v2 + 16) = *a2;
  return _swift_task_switch(sub_100054454, 0, 0);
}

uint64_t sub_100054454()
{
  uint64_t v1 = *(unsigned __int8 *)(v0 + 16);
  id v2 = [self sharedController];
  [v2 setSiriResponseShouldAlwaysPrint:v1];

  uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

uint64_t sub_1000544EC(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  sub_10005E800();
  *(void *)(v1 + 24) = swift_task_alloc();
  return _swift_task_switch(sub_10005457C, 0, 0);
}

uint64_t sub_10005457C()
{
  if (qword_1000802A8 != -1) {
    swift_once();
  }
  if ([(id)qword_1000834A0 assistantIsEnabled])
  {
    uint64_t v1 = *(void *)(v0 + 16);
    sub_10005E890();
    id v2 = (void *)sub_10005E880();
    sub_10005E860();

    sub_1000269F0(2, v1);
    uint64_t v3 = *(int *)(type metadata accessor for AlwaysPrintSiriResponseEntity() + 20);
    sub_100005268(&qword_100080B78);
    sub_10005E7E0();
    sub_100009DAC(&qword_100080D00, &qword_100080D08);
    *(void *)(v1 + v3) = sub_10005E7C0();
  }
  else
  {
    sub_1000053A0();
    swift_allocError();
    *uint64_t v5 = 0xD00000000000002ELL;
    v5[1] = 0x800000010005F210;
    swift_willThrow();
  }
  swift_task_dealloc();
  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

uint64_t sub_100054778(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return _swift_task_switch(sub_100054798, 0, 0);
}

uint64_t sub_100054798()
{
  if (qword_100080328 != -1) {
    swift_once();
  }
  if ([(id)qword_1000835E0 assistantIsEnabled])
  {
    sub_100013D8C(*(void *)(v0 + 16));
  }
  else
  {
    sub_1000053A0();
    swift_allocError();
    *id v2 = 0xD00000000000002ELL;
    v2[1] = 0x800000010005F210;
    swift_willThrow();
  }
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_10005489C(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return _swift_task_switch(sub_1000548BC, 0, 0);
}

uint64_t sub_1000548BC()
{
  if (qword_100080360 != -1) {
    swift_once();
  }
  if ([(id)qword_100083668 assistantIsEnabled])
  {
    sub_100017920(*(void *)(v0 + 16));
  }
  else
  {
    sub_1000053A0();
    swift_allocError();
    *id v2 = 0xD00000000000002ELL;
    v2[1] = 0x800000010005F210;
    swift_willThrow();
  }
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1000549C0(uint64_t a1)
{
  *(void *)(v1 + 64) = a1;
  return _swift_task_switch(sub_1000549E0, 0, 0);
}

uint64_t sub_1000549E0()
{
  if (qword_1000803D8 != -1) {
    swift_once();
  }
  if ([(id)qword_100083770 assistantIsEnabled])
  {
    uint64_t v1 = *(_OWORD **)(v0 + 64);
    sub_100026574((uint64_t *)(v0 + 16));
    long long v2 = *(_OWORD *)(v0 + 16);
    long long v3 = *(_OWORD *)(v0 + 48);
    v1[1] = *(_OWORD *)(v0 + 32);
    v1[2] = v3;
    _OWORD *v1 = v2;
  }
  else
  {
    sub_1000053A0();
    swift_allocError();
    *uint64_t v5 = 0xD00000000000002ELL;
    v5[1] = 0x800000010005F210;
    swift_willThrow();
  }
  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

uint64_t sub_100054AFC(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return _swift_task_switch(sub_100054B1C, 0, 0);
}

uint64_t sub_100054B1C()
{
  if (qword_1000805C0 != -1) {
    swift_once();
  }
  if ([(id)qword_100083BC8 assistantIsEnabled])
  {
    sub_10004D7E0(*(void *)(v0 + 16));
    uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  }
  else
  {
    if (qword_100080350 != -1) {
      swift_once();
    }
    uint64_t v2 = sub_10005E8C0();
    sub_1000052AC(v2, (uint64_t)qword_100083638);
    os_log_type_t v3 = sub_10005EA20();
    sub_100015304(v3, 0x6C62697369567369, 0xE900000000000065, 0xD000000000000044, 0x80000001000638F0);
    sub_1000053A0();
    swift_allocError();
    *uint64_t v4 = 0xD00000000000002ELL;
    v4[1] = 0x800000010005F210;
    swift_willThrow();
    uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  }
  return v1();
}

uint64_t sub_100054C9C(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return _swift_task_switch(sub_100054CBC, 0, 0);
}

uint64_t sub_100054CBC()
{
  sub_100057EC4(*(void *)(v0 + 16));
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_100054D20()
{
  type metadata accessor for AutoSendMessagesEntity();

  return swift_retain();
}

uint64_t sub_100054D54@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  *a2 = *(void *)(a1 + *(int *)(type metadata accessor for AutoSendMessagesEntity() + 28));

  return swift_retain();
}

uint64_t sub_100054D9C()
{
  type metadata accessor for AutoSendMessagesEntity();

  return swift_retain();
}

uint64_t sub_100054DD0@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  *a2 = *(void *)(a1 + *(int *)(type metadata accessor for AutoSendMessagesEntity() + 24));

  return swift_retain();
}

uint64_t sub_100054E18(uint64_t a1)
{
  return sub_100005E9C(a1, qword_100083CA8);
}

uint64_t sub_100054E3C(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for AutoSendMessagesEntity();
  __chkstk_darwin(v2 - 8);
  sub_100059914(a1, (uint64_t)&v5 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_10005E400();
  return sub_100059870(a1);
}

uint64_t sub_100054ED0(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_100059A08();
  uint64_t v5 = sub_1000587F4(&qword_100082EB8);

  return static URLRepresentableIntent<>.urlRepresentation.getter(a1, v4, a2, v5);
}

unint64_t sub_100054F58()
{
  unint64_t result = qword_100082E20;
  if (!qword_100082E20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100082E20);
  }
  return result;
}

unint64_t sub_100054FB0()
{
  unint64_t result = qword_100082E28;
  if (!qword_100082E28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100082E28);
  }
  return result;
}

uint64_t sub_100055004(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100057A98(a1, a2, a3, (void (*)(void))sub_10003C6B8);
}

uint64_t sub_10005501C@<X0>(uint64_t a1@<X8>)
{
  return sub_1000412FC(&qword_100080620, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_100083CA8, a1);
}

uint64_t sub_100055054(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  unint64_t v5 = sub_100059A08();
  unint64_t v6 = sub_100059A5C();
  uint64_t v7 = sub_1000587F4(&qword_100082EB8);
  *unint64_t v4 = v2;
  v4[1] = sub_100003184;
  return URLRepresentableIntent<>.perform()(a2, v5, v6, v7);
}

uint64_t sub_10005513C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100058FB8();
  *a1 = result;
  return result;
}

uint64_t sub_100055164(uint64_t a1)
{
  unint64_t v2 = sub_10003C6B8();

  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

uint64_t sub_1000551A4()
{
  return sub_100009DAC(&qword_100082E38, &qword_100082E40);
}

uint64_t sub_1000551E0()
{
  uint64_t v0 = sub_10005E780();
  sub_1000052E4(v0, qword_100083CC0);
  sub_1000052AC(v0, (uint64_t)qword_100083CC0);
  return sub_10005E760();
}

uint64_t sub_100055244(uint64_t a1)
{
  return sub_100005E9C(a1, qword_100083CD8);
}

uint64_t sub_100055268(uint64_t a1)
{
  return sub_1000240D0(a1, qword_100083CF0);
}

uint64_t sub_10005528C()
{
  uint64_t result = swift_getKeyPath();
  qword_100083D08 = result;
  return result;
}

uint64_t sub_1000552B4()
{
  type metadata accessor for AutoSendMessagesEntity();

  return swift_retain();
}

uint64_t sub_1000552E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  sub_100005268(&qword_100080AF0);
  v3[5] = swift_task_alloc();
  sub_100005268(&qword_100080AF8);
  v3[6] = swift_task_alloc();
  sub_100005268(&qword_100083078);
  v3[7] = swift_task_alloc();
  uint64_t v4 = sub_10005E390();
  v3[8] = v4;
  v3[9] = *(void *)(v4 - 8);
  v3[10] = swift_task_alloc();
  v3[11] = type metadata accessor for AutoSendMessagesEntity();
  v3[12] = swift_task_alloc();
  v3[13] = swift_task_alloc();
  uint64_t v5 = sub_100005268(&qword_100083048);
  v3[14] = v5;
  v3[15] = *(void *)(v5 - 8);
  v3[16] = swift_task_alloc();
  v3[17] = swift_task_alloc();
  return _swift_task_switch(sub_1000554EC, 0, 0);
}

uint64_t sub_1000554EC()
{
  sub_10005E3F0();
  uint64_t v1 = (void *)swift_task_alloc();
  v0[18] = v1;
  uint64_t v2 = sub_1000587F4(&qword_100082EC0);
  void *v1 = v0;
  v1[1] = sub_1000555D4;
  uint64_t v3 = v0[17];
  uint64_t v4 = v0[13];
  uint64_t v5 = v0[11];
  return IntentDialog._CapturedContent.init<>(entity:_:)(v3, v4, sub_100055BF8, 0, v5, v2);
}

uint64_t sub_1000555D4()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_1000556D0, 0, 0);
}

uint64_t sub_1000556D0()
{
  sub_10005E3F0();
  sub_10005E3F0();
  *(unsigned char *)(v0 + 177) = *(unsigned char *)(v0 + 176);
  if (qword_100080640 != -1) {
    swift_once();
  }
  uint64_t v1 = qword_100083D08;
  *(void *)(v0 + 152) = qword_100083D08;
  swift_retain();
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 160) = v2;
  uint64_t v3 = sub_100009DAC(&qword_100082FF8, &qword_100083000);
  *uint64_t v2 = v0;
  v2[1] = sub_10005581C;
  return AppEntity._setValue<A, B, C>(_:for:)(v0 + 177, v1, &type metadata for Bool, v3);
}

uint64_t sub_10005581C()
{
  uint64_t v2 = *(void *)(*(void *)v1 + 96);
  *(void *)(*(void *)v1 + 168) = v0;
  swift_task_dealloc();
  sub_100059870(v2);
  swift_release();
  if (v0) {
    uint64_t v3 = sub_100006990;
  }
  else {
    uint64_t v3 = sub_100055970;
  }
  return _swift_task_switch(v3, 0, 0);
}

uint64_t sub_100055970()
{
  uint64_t v1 = v0[15];
  uint64_t v10 = v0[16];
  uint64_t v2 = v0[14];
  uint64_t v11 = v0[13];
  uint64_t v12 = v0[17];
  uint64_t v3 = v0[10];
  uint64_t v14 = v0[8];
  uint64_t v4 = v0[5];
  uint64_t v5 = v0[6];
  uint64_t v13 = v0[9];
  sub_10005E3F0();
  uint64_t v6 = sub_10005E750();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  uint64_t v7 = sub_10005E790();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v4, 1, 1, v7);
  sub_10003C958();
  sub_1000587F4(&qword_1000821C8);
  sub_10005E350();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v1 + 16))(v10, v12, v2);
  sub_10005E370();
  sub_10005E3A0();
  (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v3, v14);
  sub_100059870(v11);
  (*(void (**)(uint64_t, uint64_t))(v1 + 8))(v12, v2);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v8 = (uint64_t (*)(void))v0[1];
  return v8();
}

uint64_t sub_100055BF8()
{
  return sub_100055C1C(&qword_100080640);
}

uint64_t sub_100055C1C(void *a1)
{
  uint64_t v2 = sub_100005268(&qword_100083050);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*a1 != -1) {
    swift_once();
  }
  swift_retain();
  sub_10005E5D0();
  swift_release();
  type metadata accessor for AutoSendMessagesEntity();
  sub_1000587F4(&qword_1000821C8);
  sub_100009DAC(&qword_100083058, &qword_100083050);
  sub_10005E5C0();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_100055DA8(uint64_t a1, uint64_t a2)
{
  return sub_100024B94(a1, a2, &qword_100080640);
}

unint64_t sub_100055DD0()
{
  unint64_t result = qword_100082E48;
  if (!qword_100082E48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100082E48);
  }
  return result;
}

unint64_t sub_100055E28()
{
  unint64_t result = qword_100082E50;
  if (!qword_100082E50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100082E50);
  }
  return result;
}

uint64_t sub_100055E7C()
{
  return *(void *)(swift_getOpaqueTypeConformance2() + 8);
}

uint64_t sub_100055EB0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100057A98(a1, a2, a3, (void (*)(void))sub_10003C958);
}

uint64_t sub_100055EC8@<X0>(uint64_t a1@<X8>)
{
  return sub_1000412FC(&qword_100080630, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_100083CD8, a1);
}

uint64_t sub_100055F00@<X0>(uint64_t a1@<X8>)
{
  return sub_100024D90(&qword_100080638, (uint64_t)qword_100083CF0, a1);
}

uint64_t sub_100055F24(uint64_t a1)
{
  uint64_t v5 = *v1;
  uint64_t v4 = v1[1];
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v6;
  *uint64_t v6 = v2;
  v6[1] = sub_1000042AC;
  return sub_1000552E8(a1, v5, v4);
}

uint64_t sub_100055FD0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100059374(0xD000000000000046, 0x80000001000637D0);
  *a1 = result;
  a1[1] = v3;
  return result;
}

unint64_t sub_100056010()
{
  return 0xD00000000000002BLL;
}

uint64_t sub_100056030()
{
  return sub_100009DAC(&qword_100082E60, &qword_100082E68);
}

uint64_t sub_10005606C(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return _swift_task_switch(sub_10005608C, 0, 0);
}

uint64_t sub_10005608C()
{
  uint64_t v1 = *(unsigned __int8 **)(v0 + 16);
  id v2 = [self sharedPreferences];
  unsigned __int8 v3 = [v2 getMessageWithoutConfirmationEnabled];

  unsigned __int8 *v1 = v3;
  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

uint64_t sub_100056130(uint64_t a1, unsigned char *a2)
{
  *(unsigned char *)(v2 + 16) = *a2;
  return _swift_task_switch(sub_100056154, 0, 0);
}

uint64_t sub_100056154()
{
  uint64_t v1 = *(unsigned __int8 *)(v0 + 16);
  id v2 = [self sharedPreferences];
  [v2 setMessageWithoutConfirmationEnabled:v1];

  unsigned __int8 v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

uint64_t sub_1000561EC(uint64_t a1)
{
  return sub_100005E9C(a1, qword_100083D10);
}

uint64_t sub_100056210(uint64_t a1)
{
  return sub_1000240D0(a1, qword_100083D28);
}

uint64_t sub_100056234()
{
  uint64_t result = swift_getKeyPath();
  qword_100083D40 = result;
  return result;
}

uint64_t sub_10005625C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  sub_100005268(&qword_100080AF0);
  v3[5] = swift_task_alloc();
  sub_100005268(&qword_100080AF8);
  v3[6] = swift_task_alloc();
  sub_100005268(&qword_100083068);
  v3[7] = swift_task_alloc();
  uint64_t v4 = sub_10005E390();
  v3[8] = v4;
  v3[9] = *(void *)(v4 - 8);
  v3[10] = swift_task_alloc();
  v3[11] = type metadata accessor for AutoSendMessagesEntity();
  v3[12] = swift_task_alloc();
  v3[13] = swift_task_alloc();
  uint64_t v5 = sub_100005268(&qword_100083048);
  v3[14] = v5;
  v3[15] = *(void *)(v5 - 8);
  v3[16] = swift_task_alloc();
  v3[17] = swift_task_alloc();
  return _swift_task_switch(sub_100056460, 0, 0);
}

uint64_t sub_100056460()
{
  sub_10005E3F0();
  uint64_t v1 = (void *)swift_task_alloc();
  v0[18] = v1;
  uint64_t v2 = sub_1000587F4(&qword_100082EC0);
  void *v1 = v0;
  v1[1] = sub_100056548;
  uint64_t v3 = v0[17];
  uint64_t v4 = v0[13];
  uint64_t v5 = v0[11];
  return IntentDialog._CapturedContent.init<>(entity:_:)(v3, v4, sub_100056B6C, 0, v5, v2);
}

uint64_t sub_100056548()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_100056644, 0, 0);
}

uint64_t sub_100056644()
{
  sub_10005E3F0();
  sub_10005E3F0();
  *(unsigned char *)(v0 + 177) = *(unsigned char *)(v0 + 176);
  if (qword_100080658 != -1) {
    swift_once();
  }
  uint64_t v1 = qword_100083D40;
  *(void *)(v0 + 152) = qword_100083D40;
  swift_retain();
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 160) = v2;
  uint64_t v3 = sub_100009DAC(&qword_100082FF8, &qword_100083000);
  *uint64_t v2 = v0;
  v2[1] = sub_100056790;
  return AppEntity._setValue<A, B, C>(_:for:)(v0 + 177, v1, &type metadata for Bool, v3);
}

uint64_t sub_100056790()
{
  uint64_t v2 = *(void *)(*(void *)v1 + 96);
  *(void *)(*(void *)v1 + 168) = v0;
  swift_task_dealloc();
  sub_100059870(v2);
  swift_release();
  if (v0) {
    uint64_t v3 = sub_10004B264;
  }
  else {
    uint64_t v3 = sub_1000568E4;
  }
  return _swift_task_switch(v3, 0, 0);
}

uint64_t sub_1000568E4()
{
  uint64_t v1 = v0[15];
  uint64_t v10 = v0[16];
  uint64_t v2 = v0[14];
  uint64_t v11 = v0[13];
  uint64_t v12 = v0[17];
  uint64_t v3 = v0[10];
  uint64_t v14 = v0[8];
  uint64_t v4 = v0[5];
  uint64_t v5 = v0[6];
  uint64_t v13 = v0[9];
  sub_10005E3F0();
  uint64_t v6 = sub_10005E750();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  uint64_t v7 = sub_10005E790();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v4, 1, 1, v7);
  sub_10003C9AC();
  sub_1000587F4(&qword_1000821C8);
  sub_10005E350();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v1 + 16))(v10, v12, v2);
  sub_10005E370();
  sub_10005E3A0();
  (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v3, v14);
  sub_100059870(v11);
  (*(void (**)(uint64_t, uint64_t))(v1 + 8))(v12, v2);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v8 = (uint64_t (*)(void))v0[1];
  return v8();
}

uint64_t sub_100056B6C()
{
  return sub_100055C1C(&qword_100080658);
}

uint64_t sub_100056B90(uint64_t a1, uint64_t a2)
{
  return sub_100024B94(a1, a2, &qword_100080658);
}

unint64_t sub_100056BB8()
{
  unint64_t result = qword_100082E70;
  if (!qword_100082E70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100082E70);
  }
  return result;
}

unint64_t sub_100056C10()
{
  unint64_t result = qword_100082E78;
  if (!qword_100082E78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100082E78);
  }
  return result;
}

uint64_t sub_100056C64()
{
  return *(void *)(swift_getOpaqueTypeConformance2() + 8);
}

uint64_t sub_100056C98(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100057A98(a1, a2, a3, (void (*)(void))sub_10003C9AC);
}

uint64_t sub_100056CB0@<X0>(uint64_t a1@<X8>)
{
  return sub_1000412FC(&qword_100080648, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_100083D10, a1);
}

uint64_t sub_100056CE8@<X0>(uint64_t a1@<X8>)
{
  return sub_100024D90(&qword_100080650, (uint64_t)qword_100083D28, a1);
}

uint64_t sub_100056D0C(uint64_t a1)
{
  uint64_t v5 = *v1;
  uint64_t v4 = v1[1];
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v6;
  *uint64_t v6 = v2;
  v6[1] = sub_100009F48;
  return sub_10005625C(a1, v5, v4);
}

uint64_t sub_100056DB8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100059374(0xD00000000000004ELL, 0x80000001000636A0);
  *a1 = result;
  a1[1] = v3;
  return result;
}

unint64_t sub_100056DF8()
{
  return 0xD000000000000034;
}

uint64_t sub_100056E18()
{
  return sub_100009DAC(&qword_100082E88, &qword_100082E90);
}

uint64_t sub_100056E54(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return _swift_task_switch(sub_100056E74, 0, 0);
}

uint64_t sub_100056E74()
{
  uint64_t v1 = *(unsigned __int8 **)(v0 + 16);
  id v2 = [self sharedPreferences];
  unsigned __int8 v3 = [v2 getMessageWithoutConfirmationInCarPlayEnabled];

  unsigned __int8 *v1 = v3;
  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

uint64_t sub_100056F18(uint64_t a1, unsigned char *a2)
{
  *(unsigned char *)(v2 + 16) = *a2;
  return _swift_task_switch(sub_100056F3C, 0, 0);
}

uint64_t sub_100056F3C()
{
  uint64_t v1 = *(unsigned __int8 *)(v0 + 16);
  id v2 = [self sharedPreferences];
  [v2 setMessageWithoutConfirmationInCarPlayEnabled:v1];

  unsigned __int8 v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

uint64_t sub_100056FD4(uint64_t a1)
{
  return sub_100005E9C(a1, qword_100083D48);
}

uint64_t sub_100056FF8(uint64_t a1)
{
  return sub_1000240D0(a1, qword_100083D60);
}

uint64_t sub_10005701C()
{
  uint64_t result = swift_getKeyPath();
  qword_100083D78 = result;
  return result;
}

uint64_t sub_100057044(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  sub_100005268(&qword_100080AF0);
  v3[5] = swift_task_alloc();
  sub_100005268(&qword_100080AF8);
  v3[6] = swift_task_alloc();
  sub_100005268(&qword_100083040);
  v3[7] = swift_task_alloc();
  uint64_t v4 = sub_10005E390();
  v3[8] = v4;
  v3[9] = *(void *)(v4 - 8);
  v3[10] = swift_task_alloc();
  v3[11] = type metadata accessor for AutoSendMessagesEntity();
  v3[12] = swift_task_alloc();
  v3[13] = swift_task_alloc();
  uint64_t v5 = sub_100005268(&qword_100083048);
  v3[14] = v5;
  v3[15] = *(void *)(v5 - 8);
  v3[16] = swift_task_alloc();
  v3[17] = swift_task_alloc();
  return _swift_task_switch(sub_100057248, 0, 0);
}

uint64_t sub_100057248()
{
  sub_10005E3F0();
  uint64_t v1 = (void *)swift_task_alloc();
  v0[18] = v1;
  uint64_t v2 = sub_1000587F4(&qword_100082EC0);
  void *v1 = v0;
  v1[1] = sub_100057330;
  uint64_t v3 = v0[17];
  uint64_t v4 = v0[13];
  uint64_t v5 = v0[11];
  return IntentDialog._CapturedContent.init<>(entity:_:)(v3, v4, sub_100057954, 0, v5, v2);
}

uint64_t sub_100057330()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_10005742C, 0, 0);
}

uint64_t sub_10005742C()
{
  sub_10005E3F0();
  sub_10005E3F0();
  *(unsigned char *)(v0 + 177) = *(unsigned char *)(v0 + 176);
  if (qword_100080670 != -1) {
    swift_once();
  }
  uint64_t v1 = qword_100083D78;
  *(void *)(v0 + 152) = qword_100083D78;
  swift_retain();
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 160) = v2;
  uint64_t v3 = sub_100009DAC(&qword_100082FF8, &qword_100083000);
  *uint64_t v2 = v0;
  v2[1] = sub_100057578;
  return AppEntity._setValue<A, B, C>(_:for:)(v0 + 177, v1, &type metadata for Bool, v3);
}

uint64_t sub_100057578()
{
  uint64_t v2 = *(void *)(*(void *)v1 + 96);
  *(void *)(*(void *)v1 + 168) = v0;
  swift_task_dealloc();
  sub_100059870(v2);
  swift_release();
  if (v0) {
    uint64_t v3 = sub_10004B264;
  }
  else {
    uint64_t v3 = sub_1000576CC;
  }
  return _swift_task_switch(v3, 0, 0);
}

uint64_t sub_1000576CC()
{
  uint64_t v1 = v0[15];
  uint64_t v10 = v0[16];
  uint64_t v2 = v0[14];
  uint64_t v11 = v0[13];
  uint64_t v12 = v0[17];
  uint64_t v3 = v0[10];
  uint64_t v14 = v0[8];
  uint64_t v4 = v0[5];
  uint64_t v5 = v0[6];
  uint64_t v13 = v0[9];
  sub_10005E3F0();
  uint64_t v6 = sub_10005E750();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  uint64_t v7 = sub_10005E790();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v4, 1, 1, v7);
  sub_10003CA00();
  sub_1000587F4(&qword_1000821C8);
  sub_10005E350();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v1 + 16))(v10, v12, v2);
  sub_10005E370();
  sub_10005E3A0();
  (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v3, v14);
  sub_100059870(v11);
  (*(void (**)(uint64_t, uint64_t))(v1 + 8))(v12, v2);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v8 = (uint64_t (*)(void))v0[1];
  return v8();
}

uint64_t sub_100057954()
{
  return sub_100055C1C(&qword_100080670);
}

uint64_t sub_100057978(uint64_t a1, uint64_t a2)
{
  return sub_100024B94(a1, a2, &qword_100080670);
}

unint64_t sub_1000579A0()
{
  unint64_t result = qword_100082E98;
  if (!qword_100082E98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100082E98);
  }
  return result;
}

unint64_t sub_1000579F8()
{
  unint64_t result = qword_100082EA0;
  if (!qword_100082EA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100082EA0);
  }
  return result;
}

uint64_t sub_100057A4C()
{
  return *(void *)(swift_getOpaqueTypeConformance2() + 8);
}

uint64_t sub_100057A80(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100057A98(a1, a2, a3, (void (*)(void))sub_10003CA00);
}

uint64_t sub_100057A98(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100057AEC@<X0>(uint64_t a1@<X8>)
{
  return sub_1000412FC(&qword_100080660, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_100083D48, a1);
}

uint64_t sub_100057B24@<X0>(uint64_t a1@<X8>)
{
  return sub_100024D90(&qword_100080668, (uint64_t)qword_100083D60, a1);
}

uint64_t sub_100057B48(uint64_t a1)
{
  uint64_t v5 = *v1;
  uint64_t v4 = v1[1];
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v6;
  *uint64_t v6 = v2;
  v6[1] = sub_100009F48;
  return sub_100057044(a1, v5, v4);
}

uint64_t sub_100057BF4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100059374(0xD000000000000051, 0x8000000100063550);
  *a1 = result;
  a1[1] = v3;
  return result;
}

unint64_t sub_100057C34()
{
  return 0xD000000000000037;
}

uint64_t sub_100057C50(void *a1)
{
  a1[1] = sub_1000587F4(&qword_100082EB0);
  a1[2] = sub_1000587F4(&qword_100082EB8);
  uint64_t result = sub_1000587F4((unint64_t *)&qword_100082DF8);
  a1[3] = result;
  return result;
}

uint64_t sub_100057CDC()
{
  return sub_1000587F4(&qword_100082EC0);
}

uint64_t sub_100057D10()
{
  return sub_1000587F4(&qword_100082EC8);
}

uint64_t sub_100057D44(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return _swift_task_switch(sub_100057D64, 0, 0);
}

uint64_t sub_100057D64()
{
  uint64_t v1 = *(unsigned __int8 **)(v0 + 16);
  id v2 = [self sharedPreferences];
  unsigned __int8 v3 = [v2 getMessageWithoutConfirmationHeadphonesEnabled];

  unsigned __int8 *v1 = v3;
  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

uint64_t sub_100057E08(uint64_t a1, unsigned char *a2)
{
  *(unsigned char *)(v2 + 16) = *a2;
  return _swift_task_switch(sub_100057E2C, 0, 0);
}

uint64_t sub_100057E2C()
{
  uint64_t v1 = *(unsigned __int8 *)(v0 + 16);
  id v2 = [self sharedPreferences];
  [v2 setMessageWithoutConfirmationHeadphonesEnabled:v1];

  unsigned __int8 v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

uint64_t sub_100057EC4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_100005268(&qword_100080878);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)v21 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100005268(&qword_100080858);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_10005E800();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  sub_10005E890();
  uint64_t v10 = (void *)sub_10005E880();
  sub_10005E860();

  uint64_t v11 = (void *)sub_10005E880();
  char v12 = sub_10005E870();

  if (v12) {
    unint64_t v13 = 0x100000000000001ELL;
  }
  else {
    unint64_t v13 = 0x9286E22069726953;
  }
  if (v12) {
    unint64_t v14 = 0x800000010005F260;
  }
  else {
    unint64_t v14 = 0xA900000000000020;
  }
  sub_10005E7E0();
  v21[0] = v13;
  v21[1] = v14;
  swift_bridgeObjectRetain();
  v22._countAndFlagsBits = 0xD000000000000013;
  v22._object = (void *)0x80000001000610C0;
  sub_10005E9D0(v22);
  swift_bridgeObjectRelease();
  sub_10005E7E0();
  (*(void (**)(char *, void, uint64_t, uint64_t))(v9 + 56))(v7, 0, 1, v8);
  uint64_t v15 = sub_10005E5F0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v4, 1, 1, v15);
  sub_10005E610();
  uint64_t v16 = (int *)type metadata accessor for AutoSendMessagesEntity();
  uint64_t v17 = v16[5];
  sub_100005268(&qword_100082E40);
  sub_10005E7E0();
  sub_100009DAC(&qword_100082FF8, &qword_100083000);
  *(void *)(a1 + v17) = sub_10005E7C0();
  uint64_t v18 = v16[6];
  sub_100005268(&qword_100082E68);
  sub_10005E7E0();
  *(void *)(a1 + v18) = sub_10005E7C0();
  uint64_t v19 = v16[7];
  sub_100005268(&qword_100082E90);
  sub_10005E7E0();
  uint64_t result = sub_10005E7C0();
  *(void *)(a1 + v19) = result;
  return result;
}

uint64_t sub_100058300(uint64_t a1)
{
  uint64_t v2 = sub_1000587F4(&qword_100082EC0);

  return EntityURLRepresentation.init(_:)(0xD00000000000004ALL, 0x8000000100063490, a1, v2);
}

uint64_t sub_100058378()
{
  uint64_t v0 = qword_100082E00;
  swift_bridgeObjectRetain();
  return v0;
}

uint64_t sub_1000583B0()
{
  return sub_1000587F4(&qword_100082ED0);
}

uint64_t sub_1000583E4()
{
  return sub_1000587F4(&qword_100082ED8);
}

uint64_t sub_100058418()
{
  return sub_100009DAC(&qword_100082EE0, &qword_100082EE8);
}

uint64_t sub_100058454(uint64_t a1)
{
  uint64_t v2 = sub_1000587F4((unint64_t *)&qword_100082DF8);

  return _UniqueEntityProvider.init(_:)(&unk_100082FE0, 0, a1, v2);
}

uint64_t sub_1000584CC()
{
  return sub_100009DAC((unint64_t *)&unk_100082EF0, &qword_100082EE8);
}

uint64_t sub_100058508()
{
  sub_1000587F4(&qword_100082EB8);
  uint64_t v2 = sub_10005E6A0();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
  return sub_10000538C(v3, v0, v2, v1);
}

uint64_t sub_1000585B8()
{
  return sub_1000587F4(&qword_100082F00);
}

uint64_t sub_1000585EC()
{
  return sub_1000587F4(&qword_100082F08);
}

uint64_t sub_100058620()
{
  return sub_1000587F4(&qword_1000821C8);
}

uint64_t sub_100058654()
{
  return sub_1000587F4(&qword_100082F10);
}

uint64_t sub_100058688@<X0>(uint64_t *a1@<X8>)
{
  sub_1000587F4((unint64_t *)&qword_100082DF8);
  uint64_t result = sub_10005E3D0();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_1000586E4@<X0>(uint64_t a1@<X8>)
{
  return sub_1000412FC(&qword_100080628, (uint64_t (*)(void))&type metadata accessor for TypeDisplayRepresentation, (uint64_t)qword_100083CC0, a1);
}

uint64_t sub_10005871C()
{
  return sub_100009DAC(&qword_100082F18, &qword_100082F20);
}

uint64_t sub_100058758(uint64_t a1)
{
  uint64_t v2 = sub_1000587F4(&qword_100082EC0);

  return static AppEntity.defaultResolverSpecification.getter(a1, v2);
}

uint64_t sub_1000587C0()
{
  return sub_1000587F4(&qword_100082F28);
}

uint64_t sub_1000587F4(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for AutoSendMessagesEntity();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100058838(uint64_t a1)
{
  uint64_t v2 = sub_1000587F4(&qword_100082F10);

  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

ValueMetadata *type metadata accessor for AutoSendMessagesEntity.UpdateIntent_isEnabledOnHeadphones()
{
  return &type metadata for AutoSendMessagesEntity.UpdateIntent_isEnabledOnHeadphones;
}

ValueMetadata *type metadata accessor for AutoSendMessagesEntity.UpdateIntent_isEnabledInCarPlay()
{
  return &type metadata for AutoSendMessagesEntity.UpdateIntent_isEnabledInCarPlay;
}

ValueMetadata *type metadata accessor for AutoSendMessagesEntity.UpdateIntent_isEnabled()
{
  return &type metadata for AutoSendMessagesEntity.UpdateIntent_isEnabled;
}

uint64_t *sub_1000588D0(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v9 = *a2;
    *a1 = *a2;
    uint64_t v4 = (uint64_t *)(v9 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    uint64_t v7 = sub_10005E620();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(v4, a2, v7);
    uint64_t v8 = a3[6];
    *(uint64_t *)((char *)v4 + a3[5]) = *(uint64_t *)((char *)a2 + a3[5]);
    *(uint64_t *)((char *)v4 + v8) = *(uint64_t *)((char *)a2 + v8);
    *(uint64_t *)((char *)v4 + a3[7]) = *(uint64_t *)((char *)a2 + a3[7]);
    swift_retain();
    swift_retain();
  }
  swift_retain();
  return v4;
}

uint64_t sub_1000589C0(uint64_t a1)
{
  uint64_t v2 = sub_10005E620();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  swift_release();
  swift_release();

  return swift_release();
}

uint64_t sub_100058A4C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_10005E620();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  *(void *)(a1 + v7) = *(void *)(a2 + v7);
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t sub_100058AF0(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_10005E620();
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
  return a1;
}

uint64_t sub_100058BB4(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_10005E620();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  *(void *)(a1 + v7) = *(void *)(a2 + v7);
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  return a1;
}

uint64_t sub_100058C44(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_10005E620();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  swift_release();
  *(void *)(a1 + a3[6]) = *(void *)(a2 + a3[6]);
  swift_release();
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  swift_release();
  return a1;
}

uint64_t sub_100058CF0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100058D04);
}

uint64_t sub_100058D04(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_10005E620();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20));
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
}

uint64_t sub_100058DC4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100058DD8);
}

uint64_t sub_100058DD8(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_10005E620();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20)) = (a2 - 1);
  }
  return result;
}

uint64_t sub_100058E94()
{
  uint64_t result = sub_10005E620();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for OpenAutoSendMessagesEntity()
{
  return &type metadata for OpenAutoSendMessagesEntity;
}

uint64_t sub_100058F40()
{
  return sub_100009DAC(&qword_100082FC8, &qword_100082FD0);
}

uint64_t sub_100058F7C()
{
  return sub_100009DAC(&qword_100082FD8, &qword_100082FD0);
}

uint64_t sub_100058FB8()
{
  uint64_t v22 = sub_10005E720();
  uint64_t v0 = *(void *)(v22 - 8);
  __chkstk_darwin(v22);
  uint64_t v2 = (char *)&v21 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100005268(&qword_100080848);
  uint64_t v4 = __chkstk_darwin(v3 - 8);
  uint64_t v6 = (char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v21 - v7;
  uint64_t v9 = sub_100005268(&qword_100083028);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100005268(&qword_100080858);
  __chkstk_darwin(v12 - 8);
  unint64_t v14 = (char *)&v21 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_10005E800();
  uint64_t v16 = *(void *)(v15 - 8);
  __chkstk_darwin(v15);
  uint64_t v21 = sub_100005268(&qword_100083030);
  sub_10005E7E0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v16 + 56))(v14, 1, 1, v15);
  uint64_t v17 = type metadata accessor for AutoSendMessagesEntity();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v11, 1, 1, v17);
  uint64_t v18 = sub_10005E390();
  uint64_t v19 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56);
  v19(v8, 1, 1, v18);
  v19(v6, 1, 1, v18);
  (*(void (**)(char *, void, uint64_t))(v0 + 104))(v2, enum case for InputConnectionBehavior.default(_:), v22);
  sub_1000587F4(&qword_100082EC0);
  return sub_10005E420();
}

uint64_t sub_10005933C()
{
  return sub_100059374(0xD000000000000046, 0x80000001000637D0);
}

uint64_t sub_100059358()
{
  return sub_100059374(0xD00000000000004ELL, 0x80000001000636A0);
}

uint64_t sub_100059374(uint64_t a1, uint64_t a2)
{
  uint64_t v36 = a1;
  uint64_t v37 = a2;
  uint64_t v2 = sub_100005268(&qword_100080A68);
  __chkstk_darwin(v2 - 8);
  uint64_t v38 = (char *)v28 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v39 = sub_10005E720();
  uint64_t v4 = *(void *)(v39 - 8);
  __chkstk_darwin(v39);
  char v35 = (char *)v28 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100005268(&qword_100080848);
  uint64_t v7 = __chkstk_darwin(v6 - 8);
  uint64_t v9 = (char *)v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v11 = (char *)v28 - v10;
  uint64_t v12 = sub_100005268(&qword_100083028);
  __chkstk_darwin(v12 - 8);
  unint64_t v14 = (char *)v28 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_100005268(&qword_100080858);
  __chkstk_darwin(v15 - 8);
  uint64_t v17 = (char *)v28 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_10005E800();
  uint64_t v34 = v18;
  uint64_t v19 = *(void *)(v18 - 8);
  __chkstk_darwin(v18);
  uint64_t v32 = sub_100005268(&qword_100083030);
  sub_10005E7E0();
  uint64_t v20 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v19 + 56);
  uint64_t v31 = v19 + 56;
  uint64_t v33 = v20;
  v20(v17, 1, 1, v18);
  uint64_t v21 = type metadata accessor for AutoSendMessagesEntity();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56))(v14, 1, 1, v21);
  uint64_t v22 = sub_10005E390();
  uint64_t v23 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56);
  v23(v11, 1, 1, v22);
  v23(v9, 1, 1, v22);
  unsigned int v30 = enum case for InputConnectionBehavior.default(_:);
  uint64_t v24 = *(void (**)(void))(v4 + 104);
  v28[1] = v4 + 104;
  uint64_t v29 = (void (*)(char *, void, uint64_t))v24;
  uint64_t v25 = v35;
  v24(v35);
  sub_1000587F4(&qword_100082EC0);
  uint64_t v32 = sub_10005E420();
  sub_100005268(&qword_100080A80);
  sub_10005E7E0();
  v33(v17, 1, 1, v34);
  char v40 = 2;
  uint64_t v26 = sub_10005E9F0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v26 - 8) + 56))(v38, 1, 1, v26);
  v23(v11, 1, 1, v22);
  v29(v25, v30, v39);
  sub_10005E430();
  return v32;
}

uint64_t sub_100059854()
{
  return sub_100059374(0xD000000000000051, 0x8000000100063550);
}

uint64_t sub_100059870(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for AutoSendMessagesEntity();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1000598CC@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  *a2 = *(void *)(a1 + *(int *)(type metadata accessor for AutoSendMessagesEntity() + 28));

  return swift_retain();
}

uint64_t sub_100059914(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for AutoSendMessagesEntity();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100059978@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  *a2 = *(void *)(a1 + *(int *)(type metadata accessor for AutoSendMessagesEntity() + 24));

  return swift_retain();
}

uint64_t sub_1000599C0@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  *a2 = *(void *)(a1 + *(int *)(type metadata accessor for AutoSendMessagesEntity() + 20));

  return swift_retain();
}

unint64_t sub_100059A08()
{
  unint64_t result = qword_100083080;
  if (!qword_100083080)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100083080);
  }
  return result;
}

unint64_t sub_100059A5C()
{
  unint64_t result = qword_100083088;
  if (!qword_100083088)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100083088);
  }
  return result;
}

unint64_t sub_100059AB4()
{
  unint64_t result = qword_1000830D0;
  if (!qword_1000830D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000830D0);
  }
  return result;
}

uint64_t sub_100059B08()
{
  return sub_10005D7FC(&qword_1000830D8, (void (*)(uint64_t))type metadata accessor for AnnounceNotificationForAppEntity);
}

uint64_t type metadata accessor for AnnounceNotificationForAppEntity()
{
  uint64_t result = qword_100083228;
  if (!qword_100083228) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_100059B9C(uint64_t a1)
{
  return sub_100005E9C(a1, qword_100083D80);
}

uint64_t sub_100059BC0(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for AnnounceNotificationForAppEntity();
  __chkstk_darwin(v2 - 8);
  sub_10005D6D8(a1, (uint64_t)&v5 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_10005E400();
  return sub_10005D73C(a1);
}

uint64_t sub_100059C54(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_10005E124();
  uint64_t v5 = sub_10005D7FC(&qword_100083280, (void (*)(uint64_t))type metadata accessor for AnnounceNotificationForAppEntity);

  return static URLRepresentableIntent<>.urlRepresentation.getter(a1, v4, a2, v5);
}

unint64_t sub_100059CF0()
{
  unint64_t result = qword_1000830E0;
  if (!qword_1000830E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000830E0);
  }
  return result;
}

unint64_t sub_100059D48()
{
  unint64_t result = qword_1000830E8;
  if (!qword_1000830E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000830E8);
  }
  return result;
}

uint64_t sub_100059D9C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_10005AFFC(a1, a2, a3, (void (*)(void))sub_10003C760);
}

uint64_t sub_100059DB4@<X0>(uint64_t a1@<X8>)
{
  return sub_1000085D4(&qword_100080678, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_100083D80, a1);
}

uint64_t sub_100059DEC(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  unint64_t v5 = sub_10005E124();
  unint64_t v6 = sub_10005E178();
  uint64_t v7 = sub_10005D7FC(&qword_100083280, (void (*)(uint64_t))type metadata accessor for AnnounceNotificationForAppEntity);
  *unint64_t v4 = v2;
  v4[1] = sub_100003184;
  return URLRepresentableIntent<>.perform()(a2, v5, v6, v7);
}

uint64_t sub_100059EE8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10005D844();
  *a1 = result;
  return result;
}

uint64_t sub_100059F10(uint64_t a1)
{
  unint64_t v2 = sub_10003C760();

  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

uint64_t sub_100059F50()
{
  return sub_100009DAC(&qword_1000830F8, &qword_100083100);
}

uint64_t sub_100059F8C()
{
  uint64_t v0 = sub_100005268(&qword_100080858);
  __chkstk_darwin(v0 - 8);
  unint64_t v2 = (char *)v12 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12[0] = sub_10005E7F0();
  uint64_t v3 = *(void *)(v12[0] - 8);
  __chkstk_darwin(v12[0]);
  unint64_t v5 = (char *)v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10005E830();
  __chkstk_darwin(v6 - 8);
  uint64_t v7 = sub_10005E990();
  __chkstk_darwin(v7 - 8);
  uint64_t v8 = sub_10005E800();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v10 = sub_10005E780();
  sub_1000052E4(v10, qword_100083D98);
  sub_1000052AC(v10, (uint64_t)qword_100083D98);
  sub_10005E980();
  sub_10005E820();
  (*(void (**)(char *, void, void))(v3 + 104))(v5, enum case for LocalizedStringResource.BundleDescription.main(_:), v12[0]);
  sub_10005E810();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(v2, 1, 1, v8);
  return sub_10005E770();
}

uint64_t sub_10005A27C(uint64_t a1)
{
  return sub_100005E9C(a1, qword_100083DB0);
}

uint64_t sub_10005A2A0()
{
  uint64_t v0 = sub_100005268(&qword_100080B20);
  sub_1000052E4(v0, qword_100083DC8);
  uint64_t v1 = sub_1000052AC(v0, (uint64_t)qword_100083DC8);
  sub_10005E570();
  uint64_t v2 = sub_10005E580();
  uint64_t v3 = *(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56);

  return v3(v1, 0, 1, v2);
}

uint64_t sub_10005A358()
{
  uint64_t result = swift_getKeyPath();
  qword_100083DE0 = result;
  return result;
}

uint64_t sub_10005A380()
{
  type metadata accessor for AnnounceNotificationForAppEntity();

  return swift_retain();
}

uint64_t sub_10005A3B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  sub_100005268(&qword_100080AF0);
  v3[5] = swift_task_alloc();
  sub_100005268(&qword_100080AF8);
  v3[6] = swift_task_alloc();
  sub_100005268(&qword_1000832E8);
  v3[7] = swift_task_alloc();
  uint64_t v4 = sub_10005E390();
  v3[8] = v4;
  v3[9] = *(void *)(v4 - 8);
  v3[10] = swift_task_alloc();
  v3[11] = type metadata accessor for AnnounceNotificationForAppEntity();
  v3[12] = swift_task_alloc();
  v3[13] = swift_task_alloc();
  uint64_t v5 = sub_100005268(&qword_1000832F0);
  v3[14] = v5;
  v3[15] = *(void *)(v5 - 8);
  v3[16] = swift_task_alloc();
  v3[17] = swift_task_alloc();
  return _swift_task_switch(sub_10005A5B8, 0, 0);
}

uint64_t sub_10005A5B8()
{
  sub_10005E3F0();
  uint64_t v1 = (void *)swift_task_alloc();
  v0[18] = v1;
  uint64_t v2 = sub_10005D7FC(qword_100083140, (void (*)(uint64_t))type metadata accessor for AnnounceNotificationForAppEntity);
  void *v1 = v0;
  v1[1] = sub_10005A6B4;
  uint64_t v3 = v0[17];
  uint64_t v4 = v0[13];
  uint64_t v5 = v0[11];
  return IntentDialog._CapturedContent.init<>(entity:_:)(v3, v4, sub_10005AD00, 0, v5, v2);
}

uint64_t sub_10005A6B4()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_10005A7B0, 0, 0);
}

uint64_t sub_10005A7B0()
{
  sub_10005E3F0();
  sub_10005E3F0();
  *(unsigned char *)(v0 + 177) = *(unsigned char *)(v0 + 176);
  if (qword_100080698 != -1) {
    swift_once();
  }
  uint64_t v1 = qword_100083DE0;
  *(void *)(v0 + 152) = qword_100083DE0;
  swift_retain();
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 160) = v2;
  uint64_t v3 = sub_100009DAC(&qword_1000832C0, &qword_1000832C8);
  *uint64_t v2 = v0;
  v2[1] = sub_10005A8FC;
  return AppEntity._setValue<A, B, C>(_:for:)(v0 + 177, v1, &type metadata for Bool, v3);
}

uint64_t sub_10005A8FC()
{
  uint64_t v2 = *(void *)(*(void *)v1 + 96);
  *(void *)(*(void *)v1 + 168) = v0;
  swift_task_dealloc();
  sub_10005D73C(v2);
  swift_release();
  if (v0) {
    uint64_t v3 = sub_100006990;
  }
  else {
    uint64_t v3 = sub_10005AA50;
  }
  return _swift_task_switch(v3, 0, 0);
}

uint64_t sub_10005AA50()
{
  uint64_t v1 = v0[16];
  uint64_t v2 = v0[15];
  uint64_t v11 = v0[13];
  uint64_t v12 = v0[17];
  uint64_t v9 = v0[10];
  uint64_t v10 = v0[14];
  uint64_t v13 = v0[9];
  uint64_t v14 = v0[8];
  uint64_t v3 = v0[5];
  uint64_t v4 = v0[6];
  sub_10005E3F0();
  uint64_t v5 = sub_10005E750();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56))(v4, 1, 1, v5);
  uint64_t v6 = sub_10005E790();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v3, 1, 1, v6);
  sub_10003C904();
  sub_10005D7FC(&qword_100082140, (void (*)(uint64_t))type metadata accessor for AnnounceNotificationForAppEntity);
  sub_10005E350();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v12, v10);
  sub_10005E370();
  sub_10005E3A0();
  (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v9, v14);
  sub_10005D73C(v11);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v12, v10);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v7 = (uint64_t (*)(void))v0[1];
  return v7();
}

uint64_t sub_10005AD04()
{
  uint64_t v0 = sub_100005268(&qword_1000832F8);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100080698 != -1) {
    swift_once();
  }
  swift_retain();
  sub_10005E5D0();
  swift_release();
  type metadata accessor for AnnounceNotificationForAppEntity();
  sub_10005D7FC(&qword_100082140, (void (*)(uint64_t))type metadata accessor for AnnounceNotificationForAppEntity);
  sub_100009DAC(&qword_100083300, &qword_1000832F8);
  sub_10005E5C0();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t sub_10005AEA4()
{
  if (qword_100080698 != -1) {
    swift_once();
  }

  return swift_retain();
}

unint64_t sub_10005AF04()
{
  unint64_t result = qword_100083108;
  if (!qword_100083108)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100083108);
  }
  return result;
}

unint64_t sub_10005AF5C()
{
  unint64_t result = qword_100083110;
  if (!qword_100083110)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100083110);
  }
  return result;
}

uint64_t sub_10005AFB0()
{
  return *(void *)(swift_getOpaqueTypeConformance2() + 8);
}

uint64_t sub_10005AFE4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_10005AFFC(a1, a2, a3, (void (*)(void))sub_10003C904);
}

uint64_t sub_10005AFFC(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10005B050@<X0>(uint64_t a1@<X8>)
{
  return sub_1000085D4(&qword_100080688, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_100083DB0, a1);
}

uint64_t sub_10005B088@<X0>(uint64_t a1@<X8>)
{
  if (qword_100080690 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100005268(&qword_100080B20);
  uint64_t v3 = sub_1000052AC(v2, (uint64_t)qword_100083DC8);

  return sub_100009E38(v3, a1);
}

uint64_t sub_10005B104(uint64_t a1)
{
  uint64_t v5 = *v1;
  uint64_t v4 = v1[1];
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v6;
  *uint64_t v6 = v2;
  v6[1] = sub_100009F48;
  return sub_10005A3B4(a1, v5, v4);
}

uint64_t sub_10005B1B0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10005DBDC();
  *a1 = result;
  a1[1] = v3;
  return result;
}

unint64_t sub_10005B1D8()
{
  return 0xD000000000000031;
}

unint64_t sub_10005B1F8()
{
  unint64_t result = qword_100083120;
  if (!qword_100083120)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100083120);
  }
  return result;
}

uint64_t sub_10005B24C(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return _swift_task_switch(sub_10005B26C, 0, 0);
}

uint64_t sub_10005B26C()
{
  uint64_t v1 = *(unsigned __int8 **)(v0 + 16);
  id v2 = [self sharedController];
  type metadata accessor for AnnounceNotificationForAppEntity();
  NSString v3 = sub_10005E9A0();
  unsigned __int8 v4 = [v2 isAnnounceNotificationEnabledForApp:v3];

  unsigned __int8 *v1 = v4;
  uint64_t v5 = *(uint64_t (**)(void))(v0 + 8);
  return v5();
}

uint64_t sub_10005B338(uint64_t a1, unsigned char *a2)
{
  *(void *)(v2 + 16) = a1;
  *(unsigned char *)(v2 + 24) = *a2;
  return _swift_task_switch(sub_10005B360, 0, 0);
}

uint64_t sub_10005B360()
{
  uint64_t v1 = *(unsigned __int8 *)(v0 + 24);
  id v2 = [self sharedController];
  type metadata accessor for AnnounceNotificationForAppEntity();
  NSString v3 = sub_10005E9A0();
  [v2 setAnnounceNotificationEnabledForApp:v3 annouceNotificationEnabled:v1];

  unsigned __int8 v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

id sub_10005B42C()
{
  id result = [self sharedController];
  qword_100083DE8 = (uint64_t)result;
  return result;
}

uint64_t sub_10005B468(uint64_t a1)
{
  v1[6] = a1;
  sub_100005268(&qword_100080878);
  v1[7] = swift_task_alloc();
  sub_100005268(&qword_100080858);
  v1[8] = swift_task_alloc();
  uint64_t v2 = sub_10005E800();
  v1[9] = v2;
  v1[10] = *(void *)(v2 - 8);
  v1[11] = swift_task_alloc();
  uint64_t v3 = type metadata accessor for AnnounceNotificationForAppEntity();
  v1[12] = v3;
  v1[13] = *(void *)(v3 - 8);
  v1[14] = swift_task_alloc();
  v1[15] = swift_task_alloc();
  return _swift_task_switch(sub_10005B5F4, 0, 0);
}

uint64_t sub_10005B5F4()
{
  uint64_t v1 = *(void **)(v0 + 48);
  sub_10005E890();
  uint64_t v2 = (void *)sub_10005E880();
  sub_10005E860();

  if (![v1 assistantIsEnabled]
    || ![*(id *)(v0 + 48) isAnnounceNotificationEnabled])
  {
    sub_1000053A0();
    swift_allocError();
    *uint64_t v9 = 0xD00000000000002ELL;
    v9[1] = 0x800000010005F210;
    swift_willThrow();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v10 = *(uint64_t (**)(void))(v0 + 8);
    return v10();
  }
  id v3 = [*(id *)(v0 + 48) getAllNotificationApps];
  sub_100009D18();
  sub_10005D7FC(&qword_100080AB8, (void (*)(uint64_t))sub_100009D18);
  uint64_t v4 = sub_10005EA00();

  unint64_t v41 = v4 & 0xC000000000000001;
  if ((v4 & 0xC000000000000001) == 0)
  {
    uint64_t v5 = *(void *)(v4 + 16);
    if (v5) {
      goto LABEL_5;
    }
LABEL_11:
    swift_bridgeObjectRelease();
LABEL_28:
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v34 = *(uint64_t (**)(void *))(v0 + 8);
    return v34(_swiftEmptyArrayStorage);
  }
  uint64_t v5 = sub_10005EAB0();
  if (!v5) {
    goto LABEL_11;
  }
LABEL_5:
  sub_10005CDF8(0, v5 & ~(v5 >> 63), 0);
  if (v41)
  {
    uint64_t result = sub_10005EA70();
    char v8 = 1;
  }
  else
  {
    uint64_t result = sub_10005D3B8(v4);
    char v8 = v11 & 1;
  }
  uint64_t v47 = result;
  uint64_t v48 = v7;
  char v49 = v8;
  if ((v5 & 0x8000000000000000) == 0)
  {
    uint64_t v35 = v0 + 16;
    uint64_t v37 = *(void *)(v0 + 96);
    uint64_t v38 = *(void *)(v0 + 104);
    uint64_t v12 = *(void *)(v0 + 80);
    uint64_t result = sub_100005268(&qword_100083100);
    uint64_t v36 = (void (**)(uint64_t, void, uint64_t, uint64_t))(v12 + 56);
    uint64_t v39 = v4;
    uint64_t v40 = v0;
    while (v5)
    {
      uint64_t v42 = v5;
      uint64_t v18 = *(void *)(v0 + 112);
      uint64_t v46 = *(void *)(v0 + 120);
      uint64_t v43 = *(void *)(v0 + 64);
      uint64_t v44 = *(void *)(v0 + 72);
      uint64_t v45 = *(void *)(v0 + 56);
      sub_10005D160(v47, v48, v49, v4);
      uint64_t v20 = v19;
      id v21 = [v19 bundleId];
      uint64_t v22 = sub_10005E9B0();
      uint64_t v24 = v23;

      id v25 = [v20 localizedName];
      sub_10005E9B0();

      uint64_t v26 = *(int *)(v37 + 24);
      sub_10005E7E0();
      sub_100009DAC(&qword_1000832C0, &qword_1000832C8);
      *(void *)(v18 + v26) = sub_10005E7C0();
      uint64_t v27 = (uint64_t *)(v18 + *(int *)(v37 + 20));
      *uint64_t v27 = v22;
      v27[1] = v24;
      uint64_t v28 = (void *)sub_10005E880();
      sub_10005E870();

      sub_10005E7E0();
      sub_10005E7E0();
      (*v36)(v43, 0, 1, v44);
      uint64_t v29 = sub_10005E5F0();
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v29 - 8) + 56))(v45, 1, 1, v29);
      sub_10005E610();
      sub_10005D798(v18, v46);

      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        sub_10005CDF8(0, _swiftEmptyArrayStorage[2] + 1, 1);
      }
      unint64_t v31 = _swiftEmptyArrayStorage[2];
      unint64_t v30 = _swiftEmptyArrayStorage[3];
      uint64_t v4 = v39;
      uint64_t v0 = v40;
      if (v31 >= v30 >> 1) {
        sub_10005CDF8(v30 > 1, v31 + 1, 1);
      }
      uint64_t v32 = *(void *)(v40 + 120);
      _swiftEmptyArrayStorage[2] = v31 + 1;
      uint64_t result = sub_10005D798(v32, (uint64_t)_swiftEmptyArrayStorage+ ((*(unsigned __int8 *)(v38 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v38 + 80))+ *(void *)(v38 + 72) * v31);
      if (v41)
      {
        if ((v49 & 1) == 0) {
          goto LABEL_33;
        }
        if (sub_10005EA80()) {
          swift_isUniquelyReferenced_nonNull_native();
        }
        sub_100005268(&qword_100080AE0);
        uint64_t v33 = (uint64_t (*)(uint64_t, void))sub_10005EA10();
        sub_10005EAD0();
        uint64_t result = v33(v35, 0);
      }
      else
      {
        int64_t v13 = sub_10005D07C(v47, v48, v49, v39);
        uint64_t v15 = v14;
        char v17 = v16;
        uint64_t result = sub_100009DA0(v47, v48, v49);
        uint64_t v47 = v13;
        uint64_t v48 = v15;
        char v49 = v17 & 1;
      }
      uint64_t v5 = v42 - 1;
      if (v42 == 1)
      {
        sub_100009DA0(v47, v48, v49);
        swift_bridgeObjectRelease();
        goto LABEL_28;
      }
    }
    __break(1u);
  }
  __break(1u);
LABEL_33:
  __break(1u);
  return result;
}

uint64_t sub_10005BCBC(uint64_t a1)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v3 = *v1;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_100003BF0;
  return sub_10005B468(v3);
}

unint64_t sub_10005BD58()
{
  unint64_t result = qword_100083130;
  if (!qword_100083130)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100083130);
  }
  return result;
}

unint64_t sub_10005BDB0()
{
  unint64_t result = qword_100083138;
  if (!qword_100083138)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100083138);
  }
  return result;
}

uint64_t sub_10005BE04()
{
  return sub_10005D7FC(qword_100083140, (void (*)(uint64_t))type metadata accessor for AnnounceNotificationForAppEntity);
}

uint64_t sub_10005BE4C(uint64_t a1)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v3 = *v1;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_10005BEE4;
  return sub_10005B468(v3);
}

uint64_t sub_10005BEE4(uint64_t a1)
{
  uint64_t v4 = *v2;
  uint64_t v5 = *v2;
  *(void *)(*v2 + 32) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v6 = *(uint64_t (**)(void))(v5 + 8);
    return v6();
  }
  else
  {
    *(void *)(v4 + 40) = a1;
    return _swift_task_switch(sub_10005C034, 0, 0);
  }
}

uint64_t sub_10005C034()
{
  uint64_t v1 = v0[5];
  uint64_t v2 = (void *)v0[2];
  swift_bridgeObjectRetain();
  uint64_t v3 = sub_10005D440(v1, v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = (uint64_t (*)(uint64_t))v0[1];
  return v4(v3);
}

uint64_t sub_10005C0CC(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_10005CD2C();
  *uint64_t v5 = v2;
  v5[1] = sub_1000042AC;
  return EnumerableEntityQuery.suggestedEntities()(a1, a2, v6);
}

unint64_t sub_10005C184()
{
  unint64_t result = qword_100083158;
  if (!qword_100083158)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100083158);
  }
  return result;
}

uint64_t sub_10005C1D8()
{
  return sub_10005D7FC(&qword_100082140, (void (*)(uint64_t))type metadata accessor for AnnounceNotificationForAppEntity);
}

unint64_t sub_10005C224()
{
  unint64_t result = qword_100083160;
  if (!qword_100083160)
  {
    sub_1000041B0(qword_100083168);
    sub_10005D7FC(&qword_100082140, (void (*)(uint64_t))type metadata accessor for AnnounceNotificationForAppEntity);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100083160);
  }
  return result;
}

uint64_t sub_10005C2C8(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_10005B1F8();
  *uint64_t v5 = v2;
  v5[1] = sub_100009F48;
  return EntityQuery.results()(a1, a2, v6);
}

uint64_t sub_10005C37C()
{
  return sub_10005D7FC(&qword_100083180, (void (*)(uint64_t))type metadata accessor for AnnounceNotificationForAppEntity);
}

uint64_t sub_10005C3C4()
{
  return sub_10005D7FC(&qword_100083188, (void (*)(uint64_t))type metadata accessor for AnnounceNotificationForAppEntity);
}

id sub_10005C40C@<X0>(void *a1@<X8>)
{
  if (qword_1000806A0 != -1) {
    swift_once();
  }
  uint64_t v2 = (void *)qword_100083DE8;
  *a1 = qword_100083DE8;

  return v2;
}

uint64_t sub_10005C478()
{
  uint64_t v0 = qword_1000830C0;
  swift_bridgeObjectRetain();
  return v0;
}

uint64_t sub_10005C4B0()
{
  return sub_10005D7FC(&qword_100083190, (void (*)(uint64_t))type metadata accessor for AnnounceNotificationForAppEntity);
}

uint64_t sub_10005C4F8()
{
  uint64_t v0 = sub_100005268(&qword_100083288);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100005268(&qword_100083290);
  __chkstk_darwin(v4);
  sub_10005D7FC(qword_100083140, (void (*)(uint64_t))type metadata accessor for AnnounceNotificationForAppEntity);
  sub_10005E6F0();
  v7._object = (void *)0x80000001000639A0;
  v7._countAndFlagsBits = 0xD00000000000005CLL;
  sub_10005E6E0(v7);
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, enum case for EntityURLRepresentation.StringInterpolation.Token.id<A>(_:), v0);
  sub_10005E6D0();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  v8._countAndFlagsBits = 0;
  v8._object = (void *)0xE000000000000000;
  sub_10005E6E0(v8);
  return sub_10005E700();
}

uint64_t sub_10005C6E4()
{
  return sub_10005D7FC(&qword_100083198, (void (*)(uint64_t))type metadata accessor for AnnounceNotificationForAppEntity);
}

uint64_t sub_10005C72C()
{
  return sub_10005D7FC(&qword_1000831A0, (void (*)(uint64_t))type metadata accessor for AnnounceNotificationForAppEntity);
}

uint64_t sub_10005C774()
{
  return sub_10005D7FC((unint64_t *)&unk_1000831A8, (void (*)(uint64_t))type metadata accessor for AnnounceNotificationForAppEntity);
}

uint64_t sub_10005C7BC()
{
  sub_10005D7FC(&qword_100083280, (void (*)(uint64_t))type metadata accessor for AnnounceNotificationForAppEntity);
  uint64_t v2 = sub_10005E6A0();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
  return sub_10000538C(v3, v0, v2, v1);
}

uint64_t sub_10005C880@<X0>(uint64_t a1@<X8>)
{
  return sub_1000085D4(&qword_100080680, (uint64_t (*)(void))&type metadata accessor for TypeDisplayRepresentation, (uint64_t)qword_100083D98, a1);
}

uint64_t sub_10005C8B8()
{
  return sub_100009DAC(&qword_1000831B8, &qword_1000831C0);
}

uint64_t sub_10005C8F4(uint64_t a1)
{
  uint64_t v2 = sub_10005D7FC(qword_100083140, (void (*)(uint64_t))type metadata accessor for AnnounceNotificationForAppEntity);

  return static AppEntity.defaultResolverSpecification.getter(a1, v2);
}

uint64_t sub_10005C970()
{
  return sub_10005D7FC(&qword_1000831C8, (void (*)(uint64_t))type metadata accessor for AnnounceNotificationForAppEntity);
}

uint64_t sub_10005C9B8(uint64_t a1)
{
  uint64_t v2 = sub_10005D7FC((unint64_t *)&unk_1000831A8, (void (*)(uint64_t))type metadata accessor for AnnounceNotificationForAppEntity);

  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

ValueMetadata *type metadata accessor for AnnounceNotificationForAppEntity.AnnounceNotificationForAppEntityQuery()
{
  return &type metadata for AnnounceNotificationForAppEntity.AnnounceNotificationForAppEntityQuery;
}

ValueMetadata *type metadata accessor for AnnounceNotificationForAppEntity.UpdateIntent_value()
{
  return &type metadata for AnnounceNotificationForAppEntity.UpdateIntent_value;
}

uint64_t sub_10005CA54(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10005CA68);
}

uint64_t sub_10005CA68(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_10005E620();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    Swift::String v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20) + 8);
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
}

uint64_t sub_10005CB2C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10005CB40);
}

uint64_t sub_10005CB40(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_10005E620();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20) + 8) = (a2 - 1);
  }
  return result;
}

uint64_t sub_10005CC00()
{
  uint64_t result = sub_10005E620();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for OpenAnnounceNotificationForAppEntity()
{
  return &type metadata for OpenAnnounceNotificationForAppEntity;
}

uint64_t sub_10005CCB4()
{
  return sub_100009DAC(&qword_100083268, &qword_100083270);
}

uint64_t sub_10005CCF0()
{
  return sub_100009DAC(&qword_100083278, &qword_100083270);
}

unint64_t sub_10005CD2C()
{
  unint64_t result = qword_100083298;
  if (!qword_100083298)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_100083298);
  }
  return result;
}

uint64_t sub_10005CD80(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_10005CE34(a1, a2, a3, (void *)*v3, &qword_100083320, (uint64_t (*)(void))type metadata accessor for SiriSuggestionsShowInAppEntity);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_10005CDBC(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_10005CE34(a1, a2, a3, (void *)*v3, &qword_100083318, (uint64_t (*)(void))type metadata accessor for SiriAppAccessForAppEntity);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_10005CDF8(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_10005CE34(a1, a2, a3, (void *)*v3, &qword_1000832A8, (uint64_t (*)(void))type metadata accessor for AnnounceNotificationForAppEntity);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_10005CE34(char a1, int64_t a2, char a3, void *a4, uint64_t *a5, uint64_t (*a6)(void))
{
  if (a3)
  {
    unint64_t v9 = a4[3];
    int64_t v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < a2)
    {
      if (v10 + 0x4000000000000000 < 0)
      {
LABEL_35:
        __break(1u);
        goto LABEL_36;
      }
      int64_t v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v9 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v10 = a2;
      }
    }
  }
  else
  {
    int64_t v10 = a2;
  }
  uint64_t v11 = a4[2];
  if (v10 <= v11) {
    uint64_t v12 = a4[2];
  }
  else {
    uint64_t v12 = v10;
  }
  if (!v12)
  {
    char v16 = &_swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  sub_100005268(a5);
  uint64_t v13 = *(void *)(a6(0) - 8);
  uint64_t v14 = *(void *)(v13 + 72);
  unint64_t v15 = (*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  char v16 = (void *)swift_allocObject();
  size_t v17 = j__malloc_size(v16);
  if (!v14)
  {
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if (v17 - v15 == 0x8000000000000000 && v14 == -1) {
    goto LABEL_34;
  }
  v16[2] = v11;
  v16[3] = 2 * ((uint64_t)(v17 - v15) / v14);
LABEL_19:
  uint64_t v19 = *(void *)(a6(0) - 8);
  unint64_t v20 = (*(unsigned __int8 *)(v19 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
  id v21 = (char *)v16 + v20;
  uint64_t v22 = (char *)a4 + v20;
  if (a1)
  {
    if (v16 < a4 || v21 >= &v22[*(void *)(v19 + 72) * v11])
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v16 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
    goto LABEL_32;
  }
  uint64_t v23 = *(void *)(v19 + 72) * v11;
  uint64_t v24 = &v21[v23];
  unint64_t v25 = (unint64_t)&v22[v23];
  if (v22 >= v24 || (unint64_t)v21 >= v25)
  {
    swift_arrayInitWithCopy();
LABEL_32:
    swift_release();
    return (uint64_t)v16;
  }
LABEL_36:
  uint64_t result = sub_10005EB20();
  __break(1u);
  return result;
}

int64_t sub_10005D07C(int64_t result, int a2, char a3, uint64_t a4)
{
  if (a3) {
    goto LABEL_20;
  }
  unint64_t v4 = result;
  if (result < 0 || (uint64_t result = 1 << *(unsigned char *)(a4 + 32), result <= (uint64_t)v4))
  {
    __break(1u);
    goto LABEL_18;
  }
  unint64_t v5 = v4 >> 6;
  uint64_t v6 = a4 + 56;
  unint64_t v7 = *(void *)(a4 + 56 + 8 * (v4 >> 6));
  if (((v7 >> v4) & 1) == 0)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  if (*(_DWORD *)(a4 + 36) != a2)
  {
LABEL_19:
    __break(1u);
LABEL_20:
    __break(1u);
    return result;
  }
  unint64_t v8 = v7 & (-2 << (v4 & 0x3F));
  if (v8) {
    return __clz(__rbit64(v8)) | v4 & 0xFFFFFFFFFFFFFFC0;
  }
  unint64_t v9 = v5 + 1;
  unint64_t v10 = (unint64_t)(result + 63) >> 6;
  if (v5 + 1 < v10)
  {
    unint64_t v11 = *(void *)(v6 + 8 * v9);
    if (v11) {
      return __clz(__rbit64(v11)) + (v9 << 6);
    }
    unint64_t v9 = v5 + 2;
    if (v5 + 2 < v10)
    {
      unint64_t v11 = *(void *)(v6 + 8 * v9);
      if (v11) {
        return __clz(__rbit64(v11)) + (v9 << 6);
      }
      while (v10 - 3 != v5)
      {
        unint64_t v11 = *(void *)(a4 + 80 + 8 * v5++);
        if (v11)
        {
          unint64_t v9 = v5 + 2;
          return __clz(__rbit64(v11)) + (v9 << 6);
        }
      }
    }
  }
  return result;
}

void sub_10005D160(uint64_t a1, int a2, char a3, uint64_t a4)
{
  unint64_t v6 = a1;
  if ((a4 & 0xC000000000000001) != 0)
  {
    if (a3)
    {
      sub_10005EAC0();
      sub_100009D18();
      swift_unknownObjectRetain();
      swift_dynamicCast();
      swift_unknownObjectRelease();
      return;
    }
    goto LABEL_24;
  }
  if (a3) {
    goto LABEL_10;
  }
  if (a1 < 0 || 1 << *(unsigned char *)(a4 + 32) <= a1)
  {
    __break(1u);
    goto LABEL_21;
  }
  if (((*(void *)(a4 + 8 * ((unint64_t)a1 >> 6) + 56) >> a1) & 1) == 0)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  if (*(_DWORD *)(a4 + 36) == a2) {
    goto LABEL_17;
  }
  __break(1u);
LABEL_10:
  if (sub_10005EA90() != *(_DWORD *)(a4 + 36))
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  sub_10005EAA0();
  sub_100009D18();
  swift_unknownObjectRetain();
  swift_dynamicCast();
  unint64_t v4 = v16;
  swift_unknownObjectRelease();
  Swift::Int v7 = sub_10005EA30(*(void *)(a4 + 40));
  uint64_t v8 = -1 << *(unsigned char *)(a4 + 32);
  unint64_t v6 = v7 & ~v8;
  if (((*(void *)(a4 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
  {
LABEL_23:

    __break(1u);
LABEL_24:
    __break(1u);
    return;
  }
  id v9 = *(id *)(*(void *)(a4 + 48) + 8 * v6);
  char v10 = sub_10005EA40();

  if ((v10 & 1) == 0)
  {
    uint64_t v11 = ~v8;
    do
    {
      unint64_t v6 = (v6 + 1) & v11;
      if (((*(void *)(a4 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
        goto LABEL_23;
      }
      id v12 = *(id *)(*(void *)(a4 + 48) + 8 * v6);
      char v13 = sub_10005EA40();
    }
    while ((v13 & 1) == 0);
  }

LABEL_17:
  uint64_t v14 = *(void **)(*(void *)(a4 + 48) + 8 * v6);

  id v15 = v14;
}

uint64_t sub_10005D3B8(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 56);
  if (v1)
  {
    uint64_t v2 = 0;
    return __clz(__rbit64(v1)) + v2;
  }
  char v5 = *(unsigned char *)(a1 + 32);
  unsigned int v6 = v5 & 0x3F;
  uint64_t v3 = 1 << v5;
  if (v6 < 7) {
    return v3;
  }
  unint64_t v1 = *(void *)(a1 + 64);
  if (v1)
  {
    uint64_t v2 = 64;
    return __clz(__rbit64(v1)) + v2;
  }
  unint64_t v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 2) {
    unint64_t v7 = 2;
  }
  unint64_t v8 = v7 - 2;
  id v9 = (unint64_t *)(a1 + 72);
  uint64_t v2 = 64;
  while (v8)
  {
    unint64_t v10 = *v9++;
    unint64_t v1 = v10;
    --v8;
    v2 += 64;
    if (v10) {
      return __clz(__rbit64(v1)) + v2;
    }
  }
  return v3;
}

uint64_t sub_10005D440(uint64_t a1, void *a2)
{
  uint64_t v28 = type metadata accessor for AnnounceNotificationForAppEntity();
  uint64_t v5 = __chkstk_darwin(v28);
  uint64_t v31 = (uint64_t)v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v33 = (uint64_t)v25 - v8;
  uint64_t result = (uint64_t)_swiftEmptyArrayStorage;
  uint64_t v34 = _swiftEmptyArrayStorage;
  uint64_t v30 = *(void *)(a1 + 16);
  if (!v30) {
    return result;
  }
  v25[1] = v2;
  uint64_t v10 = 0;
  unint64_t v11 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v32 = *(void *)(v7 + 72);
  uint64_t v29 = a1 + v11;
  uint64_t v26 = a2 + 7;
  unint64_t v27 = v11;
  id v12 = _swiftEmptyArrayStorage;
  while (1)
  {
    sub_10005D6D8(v29 + v32 * v10, v33);
    uint64_t v13 = a2[2];
    if (v13)
    {
      uint64_t v14 = (uint64_t *)(v33 + *(int *)(v28 + 20));
      uint64_t v15 = *v14;
      uint64_t v16 = v14[1];
      size_t v17 = a2;
      BOOL v18 = a2[4] == *v14 && a2[5] == v16;
      if (v18 || (uint64_t result = sub_10005EB40(), (result & 1) != 0))
      {
LABEL_11:
        sub_10005D798(v33, v31);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          sub_10005CDF8(0, v12[2] + 1, 1);
        }
        id v12 = v34;
        unint64_t v20 = v34[2];
        unint64_t v19 = v34[3];
        if (v20 >= v19 >> 1)
        {
          sub_10005CDF8(v19 > 1, v20 + 1, 1);
          id v12 = v34;
        }
        void v12[2] = v20 + 1;
        sub_10005D798(v31, (uint64_t)v12 + v27 + v20 * v32);
        a2 = v17;
        goto LABEL_4;
      }
      if (v13 != 1) {
        break;
      }
    }
LABEL_3:
    sub_10005D73C(v33);
LABEL_4:
    if (++v10 == v30) {
      return (uint64_t)v34;
    }
  }
  id v21 = v26;
  uint64_t v22 = 1;
  while (1)
  {
    uint64_t v23 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (*(v21 - 1) == v15 && *v21 == v16) {
      goto LABEL_11;
    }
    uint64_t result = sub_10005EB40();
    if (result) {
      goto LABEL_11;
    }
    v21 += 2;
    ++v22;
    BOOL v18 = v23 == v13;
    a2 = v17;
    if (v18) {
      goto LABEL_3;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_10005D6D8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for AnnounceNotificationForAppEntity();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10005D73C(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for AnnounceNotificationForAppEntity();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10005D798(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for AnnounceNotificationForAppEntity();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10005D7FC(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_10005D844()
{
  uint64_t v22 = sub_10005E720();
  uint64_t v0 = *(void *)(v22 - 8);
  __chkstk_darwin(v22);
  uint64_t v2 = (char *)&v21 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100005268(&qword_100080848);
  uint64_t v4 = __chkstk_darwin(v3 - 8);
  uint64_t v6 = (char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v21 - v7;
  uint64_t v9 = sub_100005268(&qword_1000832D0);
  __chkstk_darwin(v9 - 8);
  unint64_t v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100005268(&qword_100080858);
  __chkstk_darwin(v12 - 8);
  uint64_t v14 = (char *)&v21 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_10005E800();
  uint64_t v16 = *(void *)(v15 - 8);
  __chkstk_darwin(v15);
  uint64_t v21 = sub_100005268(&qword_1000832D8);
  sub_10005E7E0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v16 + 56))(v14, 1, 1, v15);
  uint64_t v17 = type metadata accessor for AnnounceNotificationForAppEntity();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v11, 1, 1, v17);
  uint64_t v18 = sub_10005E390();
  unint64_t v19 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56);
  v19(v8, 1, 1, v18);
  v19(v6, 1, 1, v18);
  (*(void (**)(char *, void, uint64_t))(v0 + 104))(v2, enum case for InputConnectionBehavior.default(_:), v22);
  sub_10005D7FC(qword_100083140, (void (*)(uint64_t))type metadata accessor for AnnounceNotificationForAppEntity);
  return sub_10005E420();
}

uint64_t sub_10005DBDC()
{
  uint64_t v0 = sub_100005268(&qword_100080A68);
  __chkstk_darwin(v0 - 8);
  uint64_t v36 = (char *)v28 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v37 = sub_10005E720();
  uint64_t v2 = *(void *)(v37 - 8);
  __chkstk_darwin(v37);
  uint64_t v4 = (char *)v28 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100005268(&qword_100080848);
  uint64_t v6 = __chkstk_darwin(v5 - 8);
  uint64_t v8 = (char *)v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)v28 - v9;
  uint64_t v11 = sub_100005268(&qword_1000832D0);
  __chkstk_darwin(v11 - 8);
  uint64_t v13 = (char *)v28 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28[1] = v13;
  uint64_t v14 = sub_100005268(&qword_100080858);
  __chkstk_darwin(v14 - 8);
  uint64_t v16 = (char *)v28 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = v16;
  uint64_t v17 = sub_10005E800();
  uint64_t v35 = v17;
  uint64_t v18 = *(void *)(v17 - 8);
  __chkstk_darwin(v17);
  uint64_t v33 = sub_100005268(&qword_1000832D8);
  sub_10005E7E0();
  uint64_t v34 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v18 + 56);
  v34(v16, 1, 1, v17);
  uint64_t v19 = type metadata accessor for AnnounceNotificationForAppEntity();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v13, 1, 1, v19);
  uint64_t v20 = sub_10005E390();
  uint64_t v21 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56);
  v21(v10, 1, 1, v20);
  v21(v8, 1, 1, v20);
  unsigned int v32 = enum case for InputConnectionBehavior.default(_:);
  uint64_t v22 = *(void (**)(void))(v2 + 104);
  uint64_t v30 = v2 + 104;
  uint64_t v31 = (void (*)(char *, void, uint64_t))v22;
  v22(v4);
  sub_10005D7FC(qword_100083140, (void (*)(uint64_t))type metadata accessor for AnnounceNotificationForAppEntity);
  uint64_t v23 = v29;
  uint64_t v24 = v10;
  uint64_t v25 = sub_10005E420();
  sub_100005268(&qword_100080A80);
  sub_10005E7E0();
  v34(v23, 1, 1, v35);
  char v38 = 2;
  uint64_t v26 = sub_10005E9F0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v26 - 8) + 56))(v36, 1, 1, v26);
  v21(v24, 1, 1, v20);
  v31(v4, v32, v37);
  sub_10005E430();
  return v25;
}

uint64_t sub_10005E0DC@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  *a2 = *(void *)(a1 + *(int *)(type metadata accessor for AnnounceNotificationForAppEntity() + 24));

  return swift_retain();
}

unint64_t sub_10005E124()
{
  unint64_t result = qword_100083308;
  if (!qword_100083308)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100083308);
  }
  return result;
}

unint64_t sub_10005E178()
{
  unint64_t result = qword_100083310;
  if (!qword_100083310)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100083310);
  }
  return result;
}

uint64_t sub_10005E1CC()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t sub_10005E200()
{
  return static _AssistantIntentsProvider.uniqueEntities.getter();
}

uint64_t sub_10005E240()
{
  return UniqueAppEntity<>.id.getter();
}

uint64_t sub_10005E250()
{
  return static AppIntentError.Unrecoverable.entityNotFound.getter();
}

uint64_t sub_10005E260()
{
  return type metadata accessor for AppIntentError();
}

uint64_t sub_10005E270()
{
  return static AppIntentInternal.sideEffect.getter();
}

uint64_t sub_10005E280()
{
  return static AppIntentInternal.shortcutsMetadata.getter();
}

uint64_t sub_10005E2D0()
{
  return static AppIntent.openAppWhenRun.getter();
}

uint64_t sub_10005E2E0()
{
  return static AppIntent.description.getter();
}

uint64_t sub_10005E2F0()
{
  return static AppIntent.isDiscoverable.getter();
}

uint64_t sub_10005E300()
{
  return static AppIntent.parameterSummary.getter();
}

uint64_t sub_10005E320()
{
  return static AppIntent.authenticationPolicy.getter();
}

uint64_t sub_10005E350()
{
  return IntentDialog._GeneratedDialogContent.init(fromResult:options:fallbackDialog:)();
}

uint64_t sub_10005E370()
{
  return IntentDialog.init<A, B>(from:capturedContent:)();
}

uint64_t sub_10005E380()
{
  return IntentDialog.init(full:supporting:)();
}

uint64_t sub_10005E390()
{
  return type metadata accessor for IntentDialog();
}

uint64_t sub_10005E3A0()
{
  return static IntentResult.result<A>(value:dialog:)();
}

uint64_t sub_10005E3B0()
{
  return static IntentResult.result<A>(value:)();
}

uint64_t sub_10005E3C0()
{
  return static IntentResult.result<>(dialog:)();
}

uint64_t sub_10005E3D0()
{
  return _UniqueEntity.id.getter();
}

uint64_t sub_10005E3E0()
{
  return IntentParameter.wrappedValue.modify();
}

uint64_t sub_10005E3F0()
{
  return IntentParameter.wrappedValue.getter();
}

uint64_t sub_10005E400()
{
  return IntentParameter.wrappedValue.setter();
}

uint64_t sub_10005E410()
{
  return IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:supportedValues:)();
}

uint64_t sub_10005E420()
{
  return IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:)();
}

uint64_t sub_10005E430()
{
  return IntentParameter<>.init(title:description:default:displayName:requestValueDialog:inputConnectionBehavior:)();
}

uint64_t sub_10005E440()
{
  return _AssistantIntent.IntentProjection.subscript.getter();
}

uint64_t sub_10005E450()
{
  return type metadata accessor for _AssistantIntent.PhraseToken();
}

uint64_t sub_10005E460()
{
  return static _AssistantIntent.PhraseBuilder.buildBlock(_:)();
}

uint64_t sub_10005E470()
{
  return static _AssistantIntent.PhraseBuilder.buildExpression(_:)();
}

uint64_t sub_10005E480()
{
  return static _AssistantIntent.StringValueBuilder.buildBlock(_:)();
}

uint64_t sub_10005E490()
{
  return static _AssistantIntent.StringValueBuilder.buildExpression(_:)();
}

uint64_t sub_10005E4A0()
{
  return static _AssistantIntent.ParameterValueBuilder.buildBlock(_:)();
}

uint64_t sub_10005E4B0()
{
  return static _AssistantIntent.ParameterValueBuilder.buildExpression(_:)();
}

uint64_t sub_10005E4C0()
{
  return _AssistantIntent.Value.init<A>(for:builder:)();
}

uint64_t sub_10005E4D0()
{
  return type metadata accessor for _AssistantIntent.Value();
}

uint64_t sub_10005E4E0()
{
  return _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)();
}

uint64_t sub_10005E4F0()
{
  return _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)();
}

void sub_10005E500(Swift::String a1)
{
}

uint64_t sub_10005E510()
{
  return _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)();
}

uint64_t sub_10005E520()
{
  return _AssistantIntent.Phrase.init(stringInterpolation:)();
}

uint64_t sub_10005E530()
{
  return static _AssistantIntent.Builder.buildBlock(_:)();
}

uint64_t sub_10005E540()
{
  return static _AssistantIntent.Builder.buildExpression(_:)();
}

uint64_t sub_10005E550()
{
  return type metadata accessor for _AssistantIntent();
}

uint64_t sub_10005E560()
{
  return _AssistantIntent.init<A>(_:phrases:parameterValues:)();
}

uint64_t sub_10005E570()
{
  return IntentDescription.init(stringLiteral:)();
}

uint64_t sub_10005E580()
{
  return type metadata accessor for IntentDescription();
}

uint64_t sub_10005E5C0()
{
  return static _DialogBuilderEntity.buildBlock<A>(_:)();
}

uint64_t sub_10005E5D0()
{
  return static _DialogBuilderEntity.buildExpression<A, B>(_:)();
}

uint64_t sub_10005E5E0()
{
  return DisplayRepresentation.init(stringLiteral:)();
}

uint64_t sub_10005E5F0()
{
  return type metadata accessor for DisplayRepresentation.Image();
}

uint64_t sub_10005E600()
{
  return DisplayRepresentation.init(title:subtitle:image:synonyms:descriptionText:)();
}

uint64_t sub_10005E610()
{
  return DisplayRepresentation.init(title:subtitle:image:)();
}

uint64_t sub_10005E620()
{
  return type metadata accessor for DisplayRepresentation();
}

uint64_t sub_10005E640()
{
  return static EnumerableEntityQuery.findIntentDescription.getter();
}

uint64_t sub_10005E660()
{
  return static ConfirmationActionName.continue.getter();
}

uint64_t sub_10005E670()
{
  return type metadata accessor for ConfirmationActionName();
}

uint64_t sub_10005E690()
{
  return static DynamicOptionsProvider.useForParameterResolution.getter();
}

uint64_t sub_10005E6A0()
{
  return URLRepresentableEntity.urlRepresentationParameter.getter();
}

uint64_t sub_10005E6D0()
{
  return EntityURLRepresentation.StringInterpolation.appendInterpolation(_:)();
}

void sub_10005E6E0(Swift::String a1)
{
}

uint64_t sub_10005E6F0()
{
  return EntityURLRepresentation.StringInterpolation.init(literalCapacity:interpolationCount:)();
}

uint64_t sub_10005E700()
{
  return EntityURLRepresentation.init(stringInterpolation:)();
}

uint64_t sub_10005E720()
{
  return type metadata accessor for InputConnectionBehavior();
}

uint64_t sub_10005E740()
{
  return static PersistentlyIdentifiable.persistentIdentifier.getter();
}

uint64_t sub_10005E750()
{
  return type metadata accessor for _GeneratedContentOptions();
}

uint64_t sub_10005E760()
{
  return TypeDisplayRepresentation.init(stringLiteral:)();
}

uint64_t sub_10005E770()
{
  return TypeDisplayRepresentation.init(name:numericFormat:)();
}

uint64_t sub_10005E780()
{
  return type metadata accessor for TypeDisplayRepresentation();
}

uint64_t sub_10005E790()
{
  return type metadata accessor for _GeneratedContentFallback();
}

uint64_t sub_10005E7B0()
{
  return _IntentUpdatableEntityProperty<>.init(title:get:set:intent:)();
}

uint64_t sub_10005E7C0()
{
  return _IntentUpdatableEntityProperty<>.init(title:get:set:intent:)();
}

uint64_t sub_10005E7D0()
{
  return _IntentUpdatableEntityProperty<>.init(title:get:intent:)();
}

uint64_t sub_10005E7E0()
{
  return LocalizedStringResource.init(stringLiteral:)();
}

uint64_t sub_10005E7F0()
{
  return type metadata accessor for LocalizedStringResource.BundleDescription();
}

uint64_t sub_10005E800()
{
  return type metadata accessor for LocalizedStringResource();
}

uint64_t sub_10005E810()
{
  return LocalizedStringResource.init(_:table:locale:bundle:comment:)();
}

uint64_t sub_10005E820()
{
  return static Locale.current.getter();
}

uint64_t sub_10005E830()
{
  return type metadata accessor for Locale();
}

uint64_t sub_10005E840()
{
  return GMEligibilityContext.rawValue.getter();
}

uint64_t sub_10005E850()
{
  return dispatch thunk of GMEligibilityProvider.eligibility.getter();
}

uint64_t sub_10005E860()
{
  return dispatch thunk of GMEligibilityProvider.fetchStatus(presenter:)();
}

uint64_t sub_10005E870()
{
  return dispatch thunk of GMEligibilityProvider.deviceSupported.getter();
}

uint64_t sub_10005E880()
{
  return static GMEligibilityProvider.shared.getter();
}

uint64_t sub_10005E890()
{
  return type metadata accessor for GMEligibilityProvider();
}

uint64_t sub_10005E8A0()
{
  return Logger.logObject.getter();
}

uint64_t sub_10005E8B0()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_10005E8C0()
{
  return type metadata accessor for Logger();
}

uint64_t sub_10005E8E0()
{
  return static WidgetBundle.main()();
}

uint64_t sub_10005E8F0()
{
  return LocalizedStringKey.init(stringLiteral:)();
}

uint64_t sub_10005E900()
{
  return WidgetConfiguration.description(_:)();
}

uint64_t sub_10005E910()
{
  return WidgetConfiguration.hiddenControl()();
}

uint64_t sub_10005E920()
{
  return WidgetConfiguration.configurationDisplayName(_:)();
}

uint64_t sub_10005E930()
{
  return WidgetConfiguration.disablesControlStateCaching()();
}

uint64_t sub_10005E940()
{
  return Text.init(_:tableName:bundle:comment:)();
}

uint64_t sub_10005E950()
{
  return Label<>.init(_:systemImage:)();
}

uint64_t sub_10005E960()
{
  return ControlToggle.init<A, B, C, D, E, F, G>(kind:intentUpdatableProperty:title:subtitle:value:)();
}

uint64_t sub_10005E970()
{
  return ControlToggle.init<A, B, C, D, E, F>(kind:intentUpdatableProperty:content:value:)();
}

uint64_t sub_10005E980()
{
  return String.LocalizationValue.init(stringLiteral:)();
}

uint64_t sub_10005E990()
{
  return type metadata accessor for String.LocalizationValue();
}

NSString sub_10005E9A0()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_10005E9B0()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10005E9C0()
{
  return String.hash(into:)();
}

void sub_10005E9D0(Swift::String a1)
{
}

Swift::Int sub_10005E9E0()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_10005E9F0()
{
  return type metadata accessor for Bool.IntentDisplayName();
}

uint64_t sub_10005EA00()
{
  return static Set._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10005EA10()
{
  return Set.Index._asCocoa.modify();
}

uint64_t sub_10005EA20()
{
  return static os_log_type_t.debug.getter();
}

Swift::Int sub_10005EA30(Swift::Int seed)
{
  return NSObject._rawHashValue(seed:)(seed);
}

uint64_t sub_10005EA40()
{
  return static NSObject.== infix(_:_:)();
}

uint64_t sub_10005EA50()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_10005EA60()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_10005EA70()
{
  return __CocoaSet.startIndex.getter();
}

uint64_t sub_10005EA80()
{
  return __CocoaSet.Index.handleBitPattern.getter();
}

uint64_t sub_10005EA90()
{
  return __CocoaSet.Index.age.getter();
}

uint64_t sub_10005EAA0()
{
  return __CocoaSet.Index.element.getter();
}

uint64_t sub_10005EAB0()
{
  return __CocoaSet.count.getter();
}

uint64_t sub_10005EAC0()
{
  return __CocoaSet.element(at:)();
}

uint64_t sub_10005EAD0()
{
  return __CocoaSet.formIndex(after:isUnique:)();
}

uint64_t sub_10005EAE0()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_10005EAF0()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_10005EB00()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_10005EB10()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_10005EB20()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

Swift::Int sub_10005EB30(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases, string);
}

uint64_t sub_10005EB40()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_10005EB50()
{
  return Error._getEmbeddedNSError()();
}

uint64_t sub_10005EB60()
{
  return Error._code.getter();
}

uint64_t sub_10005EB70()
{
  return Error._domain.getter();
}

uint64_t sub_10005EB80()
{
  return Error._userInfo.getter();
}

uint64_t sub_10005EB90()
{
  return Hasher.init(_seed:)();
}

Swift::Int sub_10005EBA0()
{
  return Hasher._finalize()();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
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

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
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

uint64_t swift_retain_n()
{
  return _swift_retain_n();
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