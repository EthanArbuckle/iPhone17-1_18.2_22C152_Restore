uint64_t sub_1000044A4()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t (*v3)(void *, uint64_t, uint64_t);
  uint64_t vars8;

  v0 = sub_10000A110();
  sub_100004540(v0, qword_1000102E0);
  v1 = (void *)sub_1000045A4(v0, (uint64_t)qword_1000102E0);
  *v1 = sub_1000045DC();
  v2 = enum case for LocalizedStringResource.BundleDescription.forClass(_:);
  v3 = *(uint64_t (**)(void *, uint64_t, uint64_t))(*(void *)(v0 - 8) + 104);

  return v3(v1, v2, v0);
}

uint64_t *sub_100004540(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_1000045A4(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

unint64_t sub_1000045DC()
{
  unint64_t result = qword_100010070;
  if (!qword_100010070)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100010070);
  }
  return result;
}

uint64_t sub_10000461C()
{
  return _swift_task_switch(sub_1000046A8, 0, 0);
}

uint64_t sub_1000046A8()
{
  id v1 = [self sharedAccountStore];
  v0[16] = v1;
  v0[2] = v0;
  v0[7] = v0 + 15;
  v0[3] = sub_100004800;
  uint64_t v2 = swift_continuation_init();
  v0[10] = _NSConcreteStackBlock;
  v0[11] = 0x40000000;
  v0[12] = sub_100004A90;
  v0[13] = &unk_10000C990;
  v0[14] = v2;
  [v1 fetchAccountsWithCompletionHandler:v0 + 10];
  return _swift_continuation_await(v0 + 2);
}

uint64_t sub_100004800()
{
  return _swift_task_switch(sub_10000490C, 0, 0);
}

uint64_t sub_10000490C()
{
  uint64_t v1 = *(void **)(v0 + 120);

  *(void *)(v0 + 80) = 0;
  id v2 = [v1 unwrappedWithError:v0 + 80];
  uint64_t v3 = *(void **)(v0 + 80);
  if (v2)
  {
    sub_100005000();
    id v4 = v3;
    uint64_t result = sub_10000A210();
    __break(1u);
  }
  else
  {
    id v6 = v3;
    sub_10000A0F0();

    swift_willThrow();
    v7 = *(uint64_t (**)(void))(v0 + 8);
    return v7();
  }
  return result;
}

uint64_t sub_100004A90(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  **(void **)(*(void *)(v2 + 64) + 40) = a2;
  id v3 = a2;

  return _swift_continuation_resume(v2);
}

void sub_100004AE4(uint64_t a1)
{
  uint64_t v2 = sub_100004D08(&qword_100010078);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  __chkstk_darwin(v2);
  id v5 = objc_allocWithZone((Class)VSIdentityProviderFetchOperation);
  swift_bridgeObjectRetain();
  NSString v6 = sub_10000A1E0();
  swift_bridgeObjectRelease();
  id v7 = [v5 initWithIdentityProviderID:v6];

  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))((char *)aBlock - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v2);
  unint64_t v8 = (*(unsigned __int8 *)(v3 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v7;
  (*(void (**)(unint64_t, char *, uint64_t))(v3 + 32))(v9 + v8, (char *)aBlock - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v2);
  aBlock[4] = sub_100004F3C;
  aBlock[5] = v9;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100004FA4;
  aBlock[3] = &unk_10000C968;
  v10 = _Block_copy(aBlock);
  id v11 = v7;
  swift_release();
  [v11 setCompletionBlock:v10];
  _Block_release(v10);

  [v11 start];
}

uint64_t sub_100004D08(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100004D4C(void *a1)
{
  id v1 = [a1 result];
  id v2 = [v1 object];

  if (v2)
  {
    id v8 = 0;
    id v3 = [v2 unwrappedWithError:&v8];

    id v4 = v8;
    if (!v3)
    {
      id v5 = v4;
      NSString v6 = (void *)sub_10000A0F0();

      swift_willThrow();
      id v8 = v6;
      sub_100004D08(&qword_100010078);
      return sub_10000A220();
    }
  }
  else
  {
    id v3 = 0;
  }
  id v8 = v3;
  sub_100004D08(&qword_100010078);
  return sub_10000A230();
}

uint64_t sub_100004E6C()
{
  uint64_t v1 = sub_100004D08(&qword_100010078);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 24) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;

  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v5, v6);
}

uint64_t sub_100004F3C()
{
  sub_100004D08(&qword_100010078);
  uint64_t v1 = *(void **)(v0 + 16);

  return sub_100004D4C(v1);
}

uint64_t sub_100004FA4(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

uint64_t sub_100004FE8(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100004FF8()
{
  return swift_release();
}

unint64_t sub_100005000()
{
  unint64_t result = qword_100010088;
  if (!qword_100010088)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100010088);
  }
  return result;
}

uint64_t sub_100005040(uint64_t a1)
{
  unint64_t v2 = sub_100005194();

  return AppIntentsExtension.configuration.getter(a1, v2);
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

unint64_t sub_1000050EC()
{
  unint64_t result = qword_100010090;
  if (!qword_100010090)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010090);
  }
  return result;
}

uint64_t sub_100005144()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_100005194()
{
  unint64_t result = qword_100010098;
  if (!qword_100010098)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010098);
  }
  return result;
}

ValueMetadata *type metadata accessor for IntentsExtension()
{
  return &type metadata for IntentsExtension;
}

uint64_t sub_1000051F8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v43 = a1;
  sub_100004D08(&qword_1000100A0);
  ((void (*)(void))__chkstk_darwin)();
  v42 = (char *)&v36 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100004D08(&qword_1000100A8);
  ((void (*)(void))__chkstk_darwin)();
  v45 = (char *)&v36 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000A160();
  ((void (*)(void))__chkstk_darwin)();
  v40 = (char *)&v36 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_10000A110();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v36 = v5;
  uint64_t v37 = v6;
  ((void (*)(void))__chkstk_darwin)();
  id v8 = (char *)&v36 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000A1D0();
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v9 = sub_10000A120();
  uint64_t v38 = *(void *)(v9 - 8);
  uint64_t v39 = v9;
  uint64_t v10 = ((uint64_t (*)(void))__chkstk_darwin)();
  v41 = (char *)&v36 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  v44 = (char *)&v36 - v12;
  uint64_t v13 = sub_10000A1B0();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = __chkstk_darwin(v13);
  v17 = (char *)&v36 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v15);
  v19 = (char *)&v36 - v18;
  v20 = *(void (**)(char *, uint64_t, uint64_t))(v14 + 16);
  v20((char *)&v36 - v18, v1, v13);
  int v21 = (*(uint64_t (**)(char *, uint64_t))(v14 + 88))(v19, v13);
  if (v21 == enum case for VSDestination.signIn(_:))
  {
    sub_10000A1C0();
    if (qword_100010050 != -1) {
      swift_once();
    }
    uint64_t v22 = v36;
    uint64_t v23 = sub_1000045A4(v36, (uint64_t)qword_1000102E0);
    v24 = *(void (**)(char *, uint64_t, uint64_t))(v37 + 16);
    v24(v8, v23, v22);
    sub_10000A150();
    sub_10000A140();
    sub_10000A1C0();
    v24(v8, v23, v22);
    sub_10000A150();
    v25 = v45;
    sub_10000A130();
    (*(void (**)(char *, void, uint64_t, uint64_t))(v38 + 56))(v25, 0, 1, v39);
    v26 = v42;
    if (qword_100010068 == -1) {
      goto LABEL_15;
    }
    goto LABEL_16;
  }
  if (v21 == enum case for VSDestination.signOut(_:))
  {
    sub_10000A1C0();
    uint64_t v22 = v36;
    uint64_t v27 = v37;
    if (qword_100010050 != -1) {
      swift_once();
    }
    uint64_t v23 = sub_1000045A4(v22, (uint64_t)qword_1000102E0);
    v24 = *(void (**)(char *, uint64_t, uint64_t))(v27 + 16);
    v24(v8, v23, v22);
    sub_10000A150();
    sub_10000A140();
    sub_10000A1C0();
    v24(v8, v23, v22);
    sub_10000A150();
    v28 = v45;
    sub_10000A130();
    (*(void (**)(char *, void, uint64_t, uint64_t))(v38 + 56))(v28, 0, 1, v39);
    v26 = v42;
    if (qword_100010068 == -1) {
      goto LABEL_15;
    }
    goto LABEL_16;
  }
  uint64_t v29 = v36;
  uint64_t v30 = v37;
  if (v21 == enum case for VSDestination.removeTVProvider(_:))
  {
    sub_10000A1C0();
    if (qword_100010050 != -1) {
      swift_once();
    }
    uint64_t v23 = sub_1000045A4(v29, (uint64_t)qword_1000102E0);
    v24 = *(void (**)(char *, uint64_t, uint64_t))(v30 + 16);
    v24(v8, v23, v29);
    sub_10000A150();
    sub_10000A140();
    sub_10000A1C0();
    v24(v8, v23, v29);
    sub_10000A150();
    uint64_t v22 = v29;
    v31 = v45;
    sub_10000A130();
    (*(void (**)(char *, void, uint64_t, uint64_t))(v38 + 56))(v31, 0, 1, v39);
    v26 = v42;
    if (qword_100010068 == -1) {
      goto LABEL_15;
    }
LABEL_16:
    swift_once();
LABEL_15:
    uint64_t v32 = sub_100009FE0();
    uint64_t v33 = sub_1000045A4(v32, (uint64_t)qword_100010328);
    uint64_t v34 = *(void *)(v32 - 8);
    (*(void (**)(char *, uint64_t, uint64_t))(v34 + 16))(v26, v33, v32);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v34 + 56))(v26, 0, 1, v32);
    sub_10000A1C0();
    v24(v8, v23, v22);
    sub_10000A150();
    sub_10000A130();
    return sub_100009FF0();
  }
  v20(v17, v1, v13);
  uint64_t v46 = 0;
  unint64_t v47 = 0xE000000000000000;
  sub_10000A240(24);
  v48._countAndFlagsBits = 0xD000000000000016;
  v48._object = (void *)0x800000010000B190;
  sub_10000A200(v48);
  sub_10000A260();
  uint64_t result = sub_10000A270();
  __break(1u);
  return result;
}

uint64_t static VSDestination.entityIdentifier(for:)()
{
  swift_bridgeObjectRetain();

  return sub_10000A190();
}

uint64_t sub_100005EB4()
{
  return sub_100009C44(&qword_1000100B0, (void (*)(uint64_t))type metadata accessor for TVProviderDeepLinks);
}

uint64_t type metadata accessor for TVProviderDeepLinks()
{
  uint64_t result = qword_100010210;
  if (!qword_100010210) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_100005F48()
{
  return sub_100009C44(&qword_1000100B8, (void (*)(uint64_t))type metadata accessor for TVProviderDeepLinks);
}

uint64_t sub_100005F90()
{
  uint64_t v0 = sub_100004D08(&qword_1000100A8);
  __chkstk_darwin(v0 - 8);
  uint64_t v2 = (char *)&v7 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_10000A120();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v5 = sub_10000A0C0();
  sub_100004540(v5, qword_1000102F8);
  sub_1000045A4(v5, (uint64_t)qword_1000102F8);
  sub_10000A100();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v4 + 56))(v2, 1, 1, v3);
  return sub_10000A0B0();
}

uint64_t sub_100006100(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return _swift_task_switch(sub_100006120, 0, 0);
}

uint64_t sub_100006120()
{
  uint64_t v1 = *(uint64_t **)(v0 + 16);
  *uint64_t v1 = _s24VideoSubscriberAccountUI13VSDestinationO12VSAppIntentsE22entityIdentifierStringSSvg_0();
  v1[1] = v2;
  uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

uint64_t sub_100006188()
{
  uint64_t v0 = sub_100004D08(&qword_1000102C8);
  __chkstk_darwin(v0);
  sub_100009C44(&qword_1000100B0, (void (*)(uint64_t))type metadata accessor for TVProviderDeepLinks);
  sub_10000A070();
  v2._object = (void *)0x800000010000B6C0;
  v2._countAndFlagsBits = 0xD000000000000034;
  sub_10000A060(v2);
  swift_getKeyPath();
  sub_100004D08(&qword_1000102D0);
  sub_100009E30(&qword_1000102D8, &qword_100010298);
  sub_10000A050();
  swift_release();
  v3._countAndFlagsBits = 0;
  v3._object = (void *)0xE000000000000000;
  sub_10000A060(v3);
  return sub_10000A080();
}

unint64_t sub_100006310()
{
  return 0xD000000000000015;
}

uint64_t sub_10000632C()
{
  return sub_100009C44(&qword_1000100C0, (void (*)(uint64_t))type metadata accessor for TVProviderDeepLinks);
}

uint64_t sub_100006374()
{
  return sub_100009C44(&qword_1000100C8, (void (*)(uint64_t))type metadata accessor for TVProviderDeepLinks);
}

uint64_t sub_1000063BC()
{
  return sub_100009C44(&qword_1000100D0, (void (*)(uint64_t))type metadata accessor for TVProviderDeepLinks);
}

unint64_t sub_100006408()
{
  unint64_t result = qword_1000100D8;
  if (!qword_1000100D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000100D8);
  }
  return result;
}

uint64_t sub_10000645C()
{
  return sub_100009C44((unint64_t *)&unk_1000100E0, (void (*)(uint64_t))&type metadata accessor for VSDestination);
}

uint64_t sub_1000064A4()
{
  sub_100009C44(&qword_100010270, (void (*)(uint64_t))type metadata accessor for TVProviderDeepLinks);
  uint64_t v2 = sub_10000A020();
  Swift::String v3 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
  return sub_100009E1C(v3, v0, v2, v1);
}

uint64_t sub_100006568()
{
  return sub_100009C44(&qword_1000100F0, (void (*)(uint64_t))type metadata accessor for TVProviderDeepLinks);
}

uint64_t sub_1000065B0()
{
  return sub_100009C44(&qword_1000100F8, (void (*)(uint64_t))type metadata accessor for TVProviderDeepLinks);
}

uint64_t sub_1000065F8()
{
  return sub_100009C44(&qword_100010100, (void (*)(uint64_t))type metadata accessor for TVProviderDeepLinks);
}

uint64_t sub_100006640()
{
  return sub_100009C44(&qword_100010108, (void (*)(uint64_t))type metadata accessor for TVProviderDeepLinks);
}

uint64_t sub_100006688()
{
  return sub_100009C44(&qword_100010110, (void (*)(uint64_t))&type metadata accessor for VSDestination);
}

uint64_t sub_1000066D0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_10000A1B0();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);

  return v4(a1, v1, v3);
}

uint64_t sub_10000673C@<X0>(uint64_t a1@<X8>)
{
  return sub_100007748(&qword_100010058, (uint64_t (*)(void))&type metadata accessor for TypeDisplayRepresentation, (uint64_t)qword_1000102F8, a1);
}

uint64_t sub_100006774()
{
  return sub_100009E30(&qword_100010118, &qword_100010120);
}

uint64_t sub_1000067B0(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_1000067F8(uint64_t a1)
{
  uint64_t v2 = sub_100009C44(&qword_1000100B0, (void (*)(uint64_t))type metadata accessor for TVProviderDeepLinks);

  return static AppEntity.defaultResolverSpecification.getter(a1, v2);
}

uint64_t sub_100006874()
{
  return sub_100009C44(&qword_100010128, (void (*)(uint64_t))type metadata accessor for TVProviderDeepLinks);
}

uint64_t sub_1000068C0(uint64_t a1)
{
  uint64_t v2 = sub_100009C44(&qword_100010108, (void (*)(uint64_t))type metadata accessor for TVProviderDeepLinks);

  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

unint64_t sub_100006940()
{
  unint64_t result = qword_100010130;
  if (!qword_100010130)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010130);
  }
  return result;
}

unint64_t sub_100006998()
{
  unint64_t result = qword_100010138[0];
  if (!qword_100010138[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_100010138);
  }
  return result;
}

uint64_t sub_1000069EC(uint64_t a1)
{
  uint64_t v5 = (uint64_t (*)(uint64_t))((char *)&dword_1000102C0 + dword_1000102C0);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_100006A94;
  return v5(a1);
}

uint64_t sub_100006A94(uint64_t a1)
{
  uint64_t v7 = *v2;
  uint64_t v4 = swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(uint64_t))(v7 + 8);
  if (!v1) {
    uint64_t v4 = a1;
  }
  return v5(v4);
}

uint64_t sub_100006B94(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  uint64_t v4 = (uint64_t (__cdecl *)())((char *)&dword_1000102A8 + dword_1000102A8);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 24) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_100009E74;
  return v4();
}

uint64_t sub_100006C38(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  uint64_t v4 = (uint64_t (__cdecl *)())((char *)&dword_1000102A0 + dword_1000102A0);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 24) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_100009E74;
  return v4();
}

unint64_t sub_100006CE4()
{
  unint64_t result = qword_100010158;
  if (!qword_100010158)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010158);
  }
  return result;
}

unint64_t sub_100006D3C()
{
  unint64_t result = qword_100010160;
  if (!qword_100010160)
  {
    sub_1000067B0(qword_100010168);
    sub_100009C44(&qword_100010100, (void (*)(uint64_t))type metadata accessor for TVProviderDeepLinks);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010160);
  }
  return result;
}

uint64_t sub_100006DE0(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_100006408();
  *uint64_t v5 = v2;
  v5[1] = sub_100006E94;
  return EntityQuery.results()(a1, a2, v6);
}

uint64_t sub_100006E94()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_100006F88(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return _swift_task_switch(sub_100006FA8, 0, 0);
}

uint64_t sub_100006FA8()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = enum case for VSDestination.signIn(_:);
  uint64_t v3 = sub_10000A1B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 104))(v1, v2, v3);
  uint64_t v4 = type metadata accessor for TVProviderDeepLinks();
  uint64_t v5 = *(int *)(v4 + 20);
  sub_100004D08(&qword_100010298);
  swift_allocObject();
  *(void *)(v1 + v5) = sub_10000A0E0();
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56))(v1, 0, 1, v4);
  unint64_t v6 = *(uint64_t (**)(void))(v0 + 8);
  return v6();
}

uint64_t sub_1000070DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(v3 + 16) = a1;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_100010278 + dword_100010278);
  unint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v3 + 24) = v6;
  *unint64_t v6 = v3;
  v6[1] = sub_100007194;
  return v8(a2, a3);
}

uint64_t sub_100007194(uint64_t a1)
{
  uint64_t v4 = *v2;
  uint64_t v5 = *v2;
  swift_task_dealloc();
  if (!v1) {
    **(void **)(v4 + 16) = a1;
  }
  unint64_t v6 = *(uint64_t (**)(void))(v5 + 8);
  return v6();
}

unint64_t sub_1000072A8()
{
  unint64_t result = qword_100010188;
  if (!qword_100010188)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010188);
  }
  return result;
}

uint64_t sub_1000072FC()
{
  uint64_t v0 = sub_10000A120();
  sub_100004540(v0, qword_100010310);
  sub_1000045A4(v0, (uint64_t)qword_100010310);
  return sub_10000A100();
}

uint64_t sub_100007360()
{
  return sub_100009FA0();
}

uint64_t sub_100007384(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for TVProviderDeepLinks();
  __chkstk_darwin(v2 - 8);
  sub_100009C8C(a1, (uint64_t)&v5 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_100009FB0();
  return sub_100009CF0(a1);
}

void (*sub_100007414(void *a1))(void *a1)
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_100009F90();
  return sub_100007470;
}

void sub_100007470(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void, void))(*a1 + 32))(*a1, 0);

  free(v1);
}

unint64_t sub_1000074C0()
{
  unint64_t result = qword_100010190;
  if (!qword_100010190)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010190);
  }
  return result;
}

uint64_t sub_100007514(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_100009B9C();
  uint64_t v5 = sub_100009C44(&qword_100010270, (void (*)(uint64_t))type metadata accessor for TVProviderDeepLinks);

  return static URLRepresentableIntent<>.urlRepresentation.getter(a1, v4, a2, v5);
}

unint64_t sub_1000075BC()
{
  unint64_t result = qword_100010198;
  if (!qword_100010198)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010198);
  }
  return result;
}

unint64_t sub_100007614()
{
  unint64_t result = qword_1000101A0;
  if (!qword_1000101A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000101A0);
  }
  return result;
}

unint64_t sub_10000766C()
{
  unint64_t result = qword_1000101A8;
  if (!qword_1000101A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000101A8);
  }
  return result;
}

uint64_t sub_1000076C0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100007710@<X0>(uint64_t a1@<X8>)
{
  return sub_100007748(&qword_100010060, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_100010310, a1);
}

uint64_t sub_100007748@<X0>(void *a1@<X2>, uint64_t (*a2)(void)@<X3>, uint64_t a3@<X4>, uint64_t a4@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v7 = a2(0);
  uint64_t v8 = sub_1000045A4(v7, a3);
  uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 16);

  return v9(a4, v8, v7);
}

uint64_t sub_1000077EC()
{
  return 0;
}

uint64_t sub_1000077F8()
{
  return 1;
}

uint64_t sub_100007808(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  unint64_t v5 = sub_100009B9C();
  unint64_t v6 = sub_100009BF0();
  uint64_t v7 = sub_100009C44(&qword_100010270, (void (*)(uint64_t))type metadata accessor for TVProviderDeepLinks);
  *unint64_t v4 = v2;
  v4[1] = sub_100007904;
  return URLRepresentableIntent<>.perform()(a2, v5, v6, v7);
}

uint64_t sub_100007904()
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

uint64_t sub_100007A0C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100009804();
  *a1 = result;
  return result;
}

uint64_t sub_100007A34(uint64_t a1)
{
  unint64_t v2 = sub_1000074C0();

  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

ValueMetadata *type metadata accessor for OpenTVProviderDeepLinks()
{
  return &type metadata for OpenTVProviderDeepLinks;
}

ValueMetadata *type metadata accessor for TVProviderDeepLinks.DefaultQuery()
{
  return &type metadata for TVProviderDeepLinks.DefaultQuery;
}

uint64_t *sub_100007A90(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    uint64_t v7 = sub_10000A1B0();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    *(uint64_t *)((char *)a1 + *(int *)(a3 + 20)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 20));
  }
  swift_retain();
  return a1;
}

uint64_t sub_100007B5C(uint64_t a1)
{
  uint64_t v2 = sub_10000A1B0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);

  return swift_release();
}

uint64_t sub_100007BD0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_10000A1B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  swift_retain();
  return a1;
}

uint64_t sub_100007C50(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_10000A1B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_100007CDC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_10000A1B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t sub_100007D58(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_10000A1B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  swift_release();
  return a1;
}

uint64_t sub_100007DDC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100007DF0);
}

uint64_t sub_100007DF0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_10000A1B0();
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

uint64_t sub_100007EB0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100007EC4);
}

uint64_t sub_100007EC4(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_10000A1B0();
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

uint64_t sub_100007F80()
{
  uint64_t result = sub_10000A1B0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

size_t sub_100008018(size_t a1, int64_t a2, char a3)
{
  size_t result = sub_100008038(a1, a2, a3, (void *)*v3);
  *uint64_t v3 = result;
  return result;
}

size_t sub_100008038(size_t result, int64_t a2, char a3, void *a4)
{
  char v5 = result;
  if (a3)
  {
    unint64_t v6 = a4[3];
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_30:
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
  sub_100004D08(&qword_100010288);
  uint64_t v10 = *(void *)(type metadata accessor for TVProviderDeepLinks() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (void *)swift_allocObject();
  size_t result = j__malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  if (result - v12 == 0x8000000000000000 && v11 == -1) {
    goto LABEL_29;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(result - v12) / v11);
LABEL_19:
  uint64_t v15 = *(void *)(type metadata accessor for TVProviderDeepLinks() - 8);
  if (v5)
  {
    if (v13 < a4
      || (unint64_t v16 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80),
          (char *)v13 + v16 >= (char *)a4 + v16 + *(void *)(v15 + 72) * v8))
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return (size_t)v13;
}

uint64_t sub_10000820C()
{
  uint64_t v1 = sub_10000A1B0();
  v0[2] = v1;
  v0[3] = *(void *)(v1 - 8);
  v0[4] = swift_task_alloc();
  uint64_t v2 = type metadata accessor for TVProviderDeepLinks();
  v0[5] = v2;
  v0[6] = *(void *)(v2 - 8);
  v0[7] = swift_task_alloc();
  return _swift_task_switch(sub_100008324, 0, 0);
}

uint64_t sub_100008324()
{
  uint64_t v1 = sub_10000A180();
  int64_t v2 = *(void *)(v1 + 16);
  if (v2)
  {
    uint64_t v18 = v0[5];
    uint64_t v19 = v0[6];
    uint64_t v3 = v0[3];
    sub_100008018(0, v2, 0);
    char v5 = *(void (**)(unint64_t, unint64_t, uint64_t))(v3 + 16);
    uint64_t v4 = v3 + 16;
    unint64_t v6 = v1 + ((*(unsigned __int8 *)(v4 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 64));
    uint64_t v16 = *(void *)(v4 + 56);
    v17 = v5;
    do
    {
      unint64_t v7 = v0[7];
      unint64_t v8 = v0[4];
      uint64_t v9 = v0[2];
      v17(v8, v6, v9);
      v17(v7, v8, v9);
      uint64_t v10 = *(int *)(v18 + 20);
      sub_100004D08(&qword_100010298);
      swift_allocObject();
      *(void *)(v7 + v10) = sub_10000A0E0();
      (*(void (**)(unint64_t, uint64_t))(v4 - 8))(v8, v9);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        sub_100008018(0, _swiftEmptyArrayStorage[2] + 1, 1);
      }
      unint64_t v12 = _swiftEmptyArrayStorage[2];
      unint64_t v11 = _swiftEmptyArrayStorage[3];
      if (v12 >= v11 >> 1) {
        sub_100008018(v11 > 1, v12 + 1, 1);
      }
      uint64_t v13 = v0[7];
      _swiftEmptyArrayStorage[2] = v12 + 1;
      sub_100009DAC(v13, (uint64_t)_swiftEmptyArrayStorage+ ((*(unsigned __int8 *)(v19 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80))+ *(void *)(v19 + 72) * v12);
      v6 += v16;
      --v2;
    }
    while (v2);
  }
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v14 = (uint64_t (*)(void *))v0[1];
  return v14(_swiftEmptyArrayStorage);
}

uint64_t sub_100008570()
{
  uint64_t v1 = sub_10000A1B0();
  v0[3] = v1;
  v0[4] = *(void *)(v1 - 8);
  v0[5] = swift_task_alloc();
  uint64_t v2 = type metadata accessor for TVProviderDeepLinks();
  v0[6] = v2;
  v0[7] = *(void *)(v2 - 8);
  v0[8] = swift_task_alloc();
  uint64_t v3 = (void *)swift_task_alloc();
  v0[9] = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_1000086B4;
  return sub_10000461C();
}

uint64_t sub_1000086B4(uint64_t a1)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 80) = a1;
  swift_task_dealloc();
  if (v1)
  {
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v4 = *(uint64_t (**)(void))(v3 + 8);
    return v4();
  }
  else
  {
    return _swift_task_switch(sub_1000087FC, 0, 0);
  }
}

uint64_t sub_1000087FC(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, void (*a6)(uint64_t a1), uint64_t a7, uint64_t a8)
{
  unint64_t v9 = v8[10];
  if (v9 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v18 = sub_10000A280();
    a1 = swift_bridgeObjectRelease();
    if (v18) {
      goto LABEL_3;
    }
LABEL_12:
    swift_bridgeObjectRelease();
    goto LABEL_13;
  }
  if (!*(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
    goto LABEL_12;
  }
LABEL_3:
  if ((v9 & 0xC000000000000001) != 0)
  {
    id v10 = (id)sub_10000A250();
  }
  else
  {
    if (!*(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      return withCheckedThrowingContinuation<A>(isolation:function:_:)(a1, a2, a3, a4, a5, a6, a7, a8);
    }
    id v10 = *(id *)(v8[10] + 32);
  }
  v8[11] = v10;
  swift_bridgeObjectRelease();
  id v11 = [v10 identityProviderID];
  id v12 = [v11 object];
  v8[12] = v12;

  if (v12)
  {
    uint64_t v13 = sub_10000A1F0();
    uint64_t v15 = v14;
    v8[13] = v14;
    uint64_t v16 = swift_task_alloc();
    v8[14] = v16;
    *(void *)(v16 + 16) = v13;
    *(void *)(v16 + 24) = v15;
    v17 = (void *)swift_task_alloc();
    v8[15] = v17;
    a8 = sub_100004D08(&qword_1000102B8);
    void *v17 = v8;
    v17[1] = sub_100008C6C;
    a5 = 0x800000010000B680;
    a6 = sub_100009E14;
    a1 = (uint64_t)(v8 + 2);
    a2 = 0;
    a3 = 0;
    a4 = 0xD00000000000001CLL;
    a7 = v16;
    return withCheckedThrowingContinuation<A>(isolation:function:_:)(a1, a2, a3, a4, a5, a6, a7, a8);
  }

LABEL_13:
  uint64_t v19 = v8[3];
  uint64_t v20 = v8[4];
  sub_100004D08(&qword_1000102B0);
  unint64_t v21 = (*(unsigned __int8 *)(v20 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v20 + 80);
  uint64_t v40 = *(void *)(v20 + 72);
  uint64_t v22 = swift_allocObject();
  *(_OWORD *)(v22 + 16) = xmmword_10000A6D0;
  unint64_t v23 = v22 + v21;
  (*(void (**)(unint64_t, void, uint64_t))(v20 + 104))(v22 + v21, enum case for VSDestination.signIn(_:), v19);
  int64_t v24 = *(void *)(v22 + 16);
  if (v24)
  {
    uint64_t v38 = v8[6];
    uint64_t v39 = v8[7];
    uint64_t v25 = v8[4];
    sub_100008018(0, v24, 0);
    uint64_t v37 = *(void (**)(uint64_t, unint64_t, uint64_t))(v25 + 16);
    v26 = (void (**)(uint64_t, uint64_t))(v25 + 8);
    do
    {
      uint64_t v27 = v8[8];
      unint64_t v28 = v8[5];
      uint64_t v29 = v8;
      uint64_t v30 = v8[3];
      v37(v28, v23, v30);
      v37(v27, v28, v30);
      uint64_t v31 = *(int *)(v38 + 20);
      sub_100004D08(&qword_100010298);
      swift_allocObject();
      *(void *)(v27 + v31) = sub_10000A0E0();
      (*v26)(v28, v30);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        sub_100008018(0, _swiftEmptyArrayStorage[2] + 1, 1);
      }
      unint64_t v33 = _swiftEmptyArrayStorage[2];
      unint64_t v32 = _swiftEmptyArrayStorage[3];
      unint64_t v8 = v29;
      if (v33 >= v32 >> 1) {
        sub_100008018(v32 > 1, v33 + 1, 1);
      }
      uint64_t v34 = v29[8];
      _swiftEmptyArrayStorage[2] = v33 + 1;
      sub_100009DAC(v34, (uint64_t)_swiftEmptyArrayStorage+ ((*(unsigned __int8 *)(v39 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v39 + 80))+ *(void *)(v39 + 72) * v33);
      v23 += v40;
      --v24;
    }
    while (v24);
  }
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  v35 = (uint64_t (*)(void *))v8[1];
  return v35(_swiftEmptyArrayStorage);
}

uint64_t sub_100008C6C()
{
  *(void *)(*(void *)v1 + 128) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_1000090E8;
  }
  else
  {
    swift_task_dealloc();
    uint64_t v2 = sub_100008D88;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_100008D88()
{
  swift_bridgeObjectRelease();
  uint64_t v1 = (void *)v0[2];
  uint64_t v3 = (void *)v0[11];
  uint64_t v2 = (void *)v0[12];
  if (!v1)
  {

    uint64_t v20 = v0[3];
    uint64_t v6 = v0[4];
    sub_100004D08(&qword_1000102B0);
    uint64_t v21 = *(unsigned __int8 *)(v6 + 80);
    uint64_t v27 = *(void *)(v6 + 72);
    uint64_t v7 = swift_allocObject();
    *(_OWORD *)(v7 + 16) = xmmword_10000A6D0;
    (*(void (**)(uint64_t, void, uint64_t))(v6 + 104))(v7 + ((v21 + 32) & ~v21), enum case for VSDestination.signIn(_:), v20);
    LODWORD(v6) = v21;
    int64_t v10 = *(void *)(v7 + 16);
    if (!v10) {
      goto LABEL_13;
    }
    goto LABEL_5;
  }
  uint64_t v4 = v0[3];
  uint64_t v5 = v0[4];
  sub_100004D08(&qword_1000102B0);
  uint64_t v6 = *(unsigned __int8 *)(v5 + 80);
  uint64_t v27 = *(void *)(v5 + 72);
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_10000A6D0;
  unsigned int v8 = [v1 isFullySupportedForRequestsExpectingAuthenticationSchemes:0];
  unint64_t v9 = (unsigned int *)&enum case for VSDestination.signOut(_:);
  if (!v8) {
    unint64_t v9 = (unsigned int *)&enum case for VSDestination.removeTVProvider(_:);
  }
  (*(void (**)(uint64_t, void, uint64_t))(v5 + 104))(v7 + ((v6 + 32) & ~v6), *v9, v4);

  int64_t v10 = *(void *)(v7 + 16);
  if (v10)
  {
LABEL_5:
    uint64_t v25 = v0[6];
    uint64_t v26 = v0[7];
    uint64_t v11 = v0[4];
    sub_100008018(0, v10, 0);
    unint64_t v12 = v7 + ((v6 + 32) & ~(unint64_t)v6);
    int64_t v24 = *(void (**)(uint64_t, unint64_t, uint64_t))(v11 + 16);
    do
    {
      uint64_t v13 = v0[8];
      uint64_t v14 = v0[5];
      uint64_t v15 = v0[3];
      v24(v14, v12, v15);
      v24(v13, v14, v15);
      uint64_t v16 = *(int *)(v25 + 20);
      sub_100004D08(&qword_100010298);
      swift_allocObject();
      *(void *)(v13 + v16) = sub_10000A0E0();
      (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v14, v15);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        sub_100008018(0, _swiftEmptyArrayStorage[2] + 1, 1);
      }
      unint64_t v18 = _swiftEmptyArrayStorage[2];
      unint64_t v17 = _swiftEmptyArrayStorage[3];
      if (v18 >= v17 >> 1) {
        sub_100008018(v17 > 1, v18 + 1, 1);
      }
      uint64_t v19 = v0[8];
      _swiftEmptyArrayStorage[2] = v18 + 1;
      sub_100009DAC(v19, (uint64_t)_swiftEmptyArrayStorage+ ((*(unsigned __int8 *)(v26 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v26 + 80))+ *(void *)(v26 + 72) * v18);
      v12 += v27;
      --v10;
    }
    while (v10);
  }
LABEL_13:
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v22 = (uint64_t (*)(void *))v0[1];
  return v22(_swiftEmptyArrayStorage);
}

uint64_t sub_1000090E8()
{
  uint64_t v2 = (void *)v0[11];
  uint64_t v1 = (void *)v0[12];
  swift_task_dealloc();
  swift_bridgeObjectRelease();

  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v3 = (uint64_t (*)(void))v0[1];
  return v3();
}

uint64_t sub_10000917C(uint64_t a1)
{
  v1[2] = a1;
  uint64_t v2 = sub_10000A1B0();
  v1[3] = v2;
  v1[4] = *(void *)(v2 - 8);
  v1[5] = swift_task_alloc();
  uint64_t v3 = type metadata accessor for TVProviderDeepLinks();
  v1[6] = v3;
  v1[7] = *(void *)(v3 - 8);
  v1[8] = swift_task_alloc();
  return _swift_task_switch(sub_100009298, 0, 0);
}

uint64_t sub_100009298()
{
  uint64_t v1 = v0[2];
  int64_t v2 = *(void *)(v1 + 16);
  if (v2)
  {
    uint64_t v18 = v0[6];
    uint64_t v19 = v0[7];
    uint64_t v3 = v0[4];
    sub_100008018(0, v2, 0);
    uint64_t v4 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
    v3 += 16;
    uint64_t v5 = v1 + ((*(unsigned __int8 *)(v3 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 64));
    uint64_t v16 = *(void *)(v3 + 56);
    unint64_t v17 = v4;
    uint64_t v6 = (void (**)(uint64_t, uint64_t))(v3 - 8);
    do
    {
      uint64_t v7 = v0[8];
      uint64_t v8 = v0[5];
      uint64_t v9 = v0[3];
      v17(v8, v5, v9);
      v17(v7, v8, v9);
      uint64_t v10 = *(int *)(v18 + 20);
      sub_100004D08(&qword_100010298);
      swift_allocObject();
      *(void *)(v7 + v10) = sub_10000A0E0();
      (*v6)(v8, v9);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        sub_100008018(0, _swiftEmptyArrayStorage[2] + 1, 1);
      }
      unint64_t v12 = _swiftEmptyArrayStorage[2];
      unint64_t v11 = _swiftEmptyArrayStorage[3];
      if (v12 >= v11 >> 1) {
        sub_100008018(v11 > 1, v12 + 1, 1);
      }
      uint64_t v13 = v0[8];
      _swiftEmptyArrayStorage[2] = v12 + 1;
      sub_100009DAC(v13, (uint64_t)_swiftEmptyArrayStorage+ ((*(unsigned __int8 *)(v19 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80))+ *(void *)(v19 + 72) * v12);
      v5 += v16;
      --v2;
    }
    while (v2);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v14 = (uint64_t (*)(void *))v0[1];
  return v14(_swiftEmptyArrayStorage);
}

uint64_t sub_1000094C0(uint64_t a1, uint64_t a2)
{
  v2[2] = a1;
  v2[3] = a2;
  sub_100004D08(&qword_100010280);
  v2[4] = swift_task_alloc();
  uint64_t v3 = sub_10000A1B0();
  v2[5] = v3;
  v2[6] = *(void *)(v3 - 8);
  v2[7] = swift_task_alloc();
  v2[8] = swift_task_alloc();
  return _swift_task_switch(sub_1000095C0, 0, 0);
}

uint64_t sub_1000095C0()
{
  uint64_t v1 = v0[5];
  uint64_t v2 = v0[6];
  uint64_t v3 = v0[4];
  swift_bridgeObjectRetain();
  sub_10000A190();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v3, 1, v1) == 1)
  {
    sub_100009D4C(v0[4]);
    uint64_t v4 = _swiftEmptyArrayStorage;
  }
  else
  {
    uint64_t v6 = v0[7];
    uint64_t v5 = (char *)v0[8];
    uint64_t v7 = v0[5];
    uint64_t v8 = v0[6];
    uint64_t v9 = *(void (**)(char *, uint64_t, uint64_t))(v8 + 32);
    v9(v5, v0[4], v7);
    sub_100004D08(&qword_100010288);
    uint64_t v10 = (int *)(type metadata accessor for TVProviderDeepLinks() - 8);
    unint64_t v11 = (*(unsigned __int8 *)(*(void *)v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v10 + 80);
    uint64_t v4 = (void *)swift_allocObject();
    *((_OWORD *)v4 + 1) = xmmword_10000A6D0;
    unint64_t v12 = (char *)v4 + v11;
    (*(void (**)(uint64_t, char *, uint64_t))(v8 + 16))(v6, v5, v7);
    uint64_t v13 = v10[7];
    sub_100004D08(&qword_100010298);
    swift_allocObject();
    *(void *)&v12[v13] = sub_10000A0E0();
    v9(v12, v6, v7);
    (*(void (**)(char *, uint64_t))(v8 + 8))(v5, v7);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v14 = (uint64_t (*)(void *))v0[1];
  return v14(v4);
}

uint64_t sub_100009804()
{
  uint64_t v22 = sub_10000A090();
  uint64_t v0 = *(void *)(v22 - 8);
  __chkstk_darwin(v22);
  uint64_t v2 = (char *)&v21 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100004D08(&qword_100010248);
  uint64_t v4 = __chkstk_darwin(v3 - 8);
  uint64_t v6 = (char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v21 - v7;
  uint64_t v9 = sub_100004D08(&qword_100010250);
  __chkstk_darwin(v9 - 8);
  unint64_t v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100004D08(&qword_1000100A8);
  __chkstk_darwin(v12 - 8);
  uint64_t v14 = (char *)&v21 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_10000A120();
  uint64_t v16 = *(void *)(v15 - 8);
  __chkstk_darwin(v15);
  uint64_t v21 = sub_100004D08(&qword_100010258);
  sub_10000A100();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v16 + 56))(v14, 1, 1, v15);
  uint64_t v17 = type metadata accessor for TVProviderDeepLinks();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v11, 1, 1, v17);
  uint64_t v18 = sub_100009F80();
  uint64_t v19 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56);
  v19(v8, 1, 1, v18);
  v19(v6, 1, 1, v18);
  (*(void (**)(char *, void, uint64_t))(v0 + 104))(v2, enum case for InputConnectionBehavior.default(_:), v22);
  sub_100009C44(&qword_1000100B0, (void (*)(uint64_t))type metadata accessor for TVProviderDeepLinks);
  return sub_100009FC0();
}

unint64_t sub_100009B9C()
{
  unint64_t result = qword_100010260;
  if (!qword_100010260)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010260);
  }
  return result;
}

unint64_t sub_100009BF0()
{
  unint64_t result = qword_100010268;
  if (!qword_100010268)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010268);
  }
  return result;
}

uint64_t sub_100009C44(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100009C8C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for TVProviderDeepLinks();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100009CF0(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for TVProviderDeepLinks();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100009D4C(uint64_t a1)
{
  uint64_t v2 = sub_100004D08(&qword_100010280);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100009DAC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for TVProviderDeepLinks();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_100009E14(uint64_t a1)
{
}

uint64_t sub_100009E1C(uint64_t (*a1)(uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return a1(a3, a4);
}

uint64_t sub_100009E30(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_1000067B0(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100009E78()
{
  uint64_t v0 = sub_100009FE0();
  sub_100004540(v0, qword_100010328);
  sub_1000045A4(v0, (uint64_t)qword_100010328);
  return sub_100009FD0();
}

uint64_t sub_100009EE0()
{
  return static AppIntentInternal.sideEffect.getter();
}

uint64_t sub_100009EF0()
{
  return static AppIntentInternal.shortcutsMetadata.getter();
}

uint64_t sub_100009F00()
{
  return static AppIntentInternal.attributionBundleIdentifier.getter();
}

uint64_t sub_100009F20()
{
  return static AppIntent.description.getter();
}

uint64_t sub_100009F30()
{
  return static AppIntent.parameterSummary.getter();
}

uint64_t sub_100009F40()
{
  return static AppIntent.authenticationPolicy.getter();
}

uint64_t sub_100009F80()
{
  return type metadata accessor for IntentDialog();
}

uint64_t sub_100009F90()
{
  return IntentParameter.wrappedValue.modify();
}

uint64_t sub_100009FA0()
{
  return IntentParameter.wrappedValue.getter();
}

uint64_t sub_100009FB0()
{
  return IntentParameter.wrappedValue.setter();
}

uint64_t sub_100009FC0()
{
  return IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:)();
}

uint64_t sub_100009FD0()
{
  return DisplayRepresentation.Image.init(systemName:isTemplate:)();
}

uint64_t sub_100009FE0()
{
  return type metadata accessor for DisplayRepresentation.Image();
}

uint64_t sub_100009FF0()
{
  return DisplayRepresentation.init(title:subtitle:image:synonyms:descriptionText:)();
}

uint64_t sub_10000A000()
{
  return static EnumerableEntityQuery.findIntentDescription.getter();
}

uint64_t sub_10000A010()
{
  return static DynamicOptionsProvider.useForParameterResolution.getter();
}

uint64_t sub_10000A020()
{
  return URLRepresentableEntity.urlRepresentationParameter.getter();
}

uint64_t sub_10000A050()
{
  return EntityURLRepresentation.StringInterpolation.appendInterpolation<A, B>(_:)();
}

void sub_10000A060(Swift::String a1)
{
}

uint64_t sub_10000A070()
{
  return EntityURLRepresentation.StringInterpolation.init(literalCapacity:interpolationCount:)();
}

uint64_t sub_10000A080()
{
  return EntityURLRepresentation.init(stringInterpolation:)();
}

uint64_t sub_10000A090()
{
  return type metadata accessor for InputConnectionBehavior();
}

uint64_t sub_10000A0A0()
{
  return static PersistentlyIdentifiable.persistentIdentifier.getter();
}

uint64_t sub_10000A0B0()
{
  return TypeDisplayRepresentation.init(name:numericFormat:)();
}

uint64_t sub_10000A0C0()
{
  return type metadata accessor for TypeDisplayRepresentation();
}

uint64_t sub_10000A0E0()
{
  return _EntityDeferredPropertyValue.init(get:)();
}

uint64_t sub_10000A0F0()
{
  return _convertNSErrorToError(_:)();
}

uint64_t sub_10000A100()
{
  return LocalizedStringResource.init(stringLiteral:)();
}

uint64_t sub_10000A110()
{
  return type metadata accessor for LocalizedStringResource.BundleDescription();
}

uint64_t sub_10000A120()
{
  return type metadata accessor for LocalizedStringResource();
}

uint64_t sub_10000A130()
{
  return LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)();
}

uint64_t sub_10000A140()
{
  return LocalizedStringResource.init(_:table:locale:bundle:comment:)();
}

uint64_t sub_10000A150()
{
  return static Locale.current.getter();
}

uint64_t sub_10000A160()
{
  return type metadata accessor for Locale();
}

uint64_t sub_10000A170()
{
  return static AppExtension.main()();
}

uint64_t sub_10000A180()
{
  return static VSDestination.allCases.getter();
}

uint64_t sub_10000A190()
{
  return VSDestination.init(rawValue:)();
}

uint64_t _s24VideoSubscriberAccountUI13VSDestinationO12VSAppIntentsE22entityIdentifierStringSSvg_0()
{
  return VSDestination.rawValue.getter();
}

uint64_t sub_10000A1B0()
{
  return type metadata accessor for VSDestination();
}

uint64_t sub_10000A1C0()
{
  return String.LocalizationValue.init(stringLiteral:)();
}

uint64_t sub_10000A1D0()
{
  return type metadata accessor for String.LocalizationValue();
}

NSString sub_10000A1E0()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_10000A1F0()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

void sub_10000A200(Swift::String a1)
{
}

uint64_t sub_10000A210()
{
  return static Array._forceBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_10000A220()
{
  return CheckedContinuation.resume(throwing:)();
}

uint64_t sub_10000A230()
{
  return CheckedContinuation.resume(returning:)();
}

void sub_10000A240(Swift::Int a1)
{
}

uint64_t sub_10000A250()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_10000A260()
{
  return _print_unlocked<A, B>(_:_:)();
}

uint64_t sub_10000A270()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_10000A280()
{
  return _CocoaArrayWrapper.endIndex.getter();
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

uint64_t swift_allocObject()
{
  return _swift_allocObject();
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