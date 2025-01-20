unint64_t sub_100003480()
{
  unint64_t result;

  result = qword_100010088;
  if (!qword_100010088)
  {
    result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010088);
  }
  return result;
}

unint64_t sub_1000034D8()
{
  unint64_t result = qword_100010090;
  if (!qword_100010090)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010090);
  }
  return result;
}

unint64_t sub_100003530()
{
  unint64_t result = qword_100010098[0];
  if (!qword_100010098[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_100010098);
  }
  return result;
}

void sub_100003584(uint64_t a1@<X8>)
{
  sub_100006B10(&qword_1000101B8);
  ((void (*)(void))__chkstk_darwin)();
  v3 = (char *)&v31 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100006B10(&qword_100010190);
  ((void (*)(void))__chkstk_darwin)();
  v5 = (char *)&v31 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v38 = sub_1000097B0();
  uint64_t v6 = *(void *)(v38 - 8);
  uint64_t v7 = ((uint64_t (*)(void))__chkstk_darwin)();
  v40 = (char *)&v31 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  v39 = (char *)&v31 - v9;
  uint64_t v10 = sub_100009850();
  uint64_t v11 = __chkstk_darwin(v10 - 8);
  uint64_t v12 = __chkstk_darwin(v11);
  __chkstk_darwin(v12);
  id v13 = [self defaultStore];
  if (v13)
  {
    v14 = v13;
    NSString v15 = sub_100009860();
    id v16 = [v14 accountWithIdentifier:v15];

    v17 = v16;
    v36 = v3;
    uint64_t v37 = a1;
    id v34 = v16;
    v35 = v5;
    if (!v16)
    {
      uint64_t v20 = 0x6E776F6E6B6E55;
      sub_100006D68(0, &qword_1000101C0);
      v22 = (void *)0xE700000000000000;
LABEL_10:
      uint64_t v26 = sub_1000098C0();
      v32 = v27;
      uint64_t v33 = v26;
      swift_bridgeObjectRelease();
      sub_100009840();
      v41._object = (void *)0x800000010000A980;
      v41._countAndFlagsBits = 0xD000000000000013;
      sub_100009830(v41);
      v42._countAndFlagsBits = v20;
      v42._object = v22;
      sub_100009820(v42);
      v43._countAndFlagsBits = 0;
      v43._object = (void *)0xE000000000000000;
      sub_100009830(v43);
      sub_1000097A0();
      sub_100009840();
      v44._object = (void *)0x800000010000A9A0;
      v44._countAndFlagsBits = 0x100000000000002CLL;
      sub_100009830(v44);
      v45._countAndFlagsBits = v20;
      v45._object = v22;
      sub_100009820(v45);
      v46._countAndFlagsBits = 0;
      v46._object = (void *)0xE000000000000000;
      sub_100009830(v46);
      v28 = v35;
      sub_1000097A0();
      (*(void (**)(char *, void, uint64_t, uint64_t))(v6 + 56))(v28, 0, 1, v38);
      v29 = v36;
      sub_100009630();
      uint64_t v30 = sub_100009640();
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v30 - 8) + 56))(v29, 0, 1, v30);
      sub_100006B10(&qword_1000101C8);
      *(_OWORD *)(swift_allocObject() + 16) = xmmword_100009C50;
      sub_100009840();
      v47._countAndFlagsBits = 0;
      v47._object = (void *)0xE000000000000000;
      sub_100009830(v47);
      v48._countAndFlagsBits = v20;
      v48._object = v22;
      sub_100009820(v48);
      v49._countAndFlagsBits = 0x676E697474657320;
      v49._object = (void *)0xE900000000000073;
      sub_100009830(v49);
      sub_1000097A0();
      sub_100009840();
      v50._countAndFlagsBits = 0xD00000000000001BLL;
      v50._object = (void *)0x800000010000AA00;
      sub_100009830(v50);
      v51._countAndFlagsBits = v33;
      v51._object = v32;
      sub_100009820(v51);
      swift_bridgeObjectRelease();
      v52._countAndFlagsBits = 0x746E756F63636120;
      v52._object = (void *)0xEA0000000000203ALL;
      sub_100009830(v52);
      v53._countAndFlagsBits = v20;
      v53._object = v22;
      sub_100009820(v53);
      swift_bridgeObjectRelease();
      v54._countAndFlagsBits = 46;
      v54._object = (void *)0xE100000000000000;
      sub_100009830(v54);
      sub_1000097A0();
      sub_100009650();

      return;
    }
    id v18 = [v16 accountDescription];
    if (v18)
    {
      v19 = v18;
      uint64_t v20 = sub_100009880();
      v22 = v21;
    }
    else
    {
      uint64_t v20 = 0x6E776F6E6B6E55;
      v22 = (void *)0xE700000000000000;
    }
    id v23 = [v17 accountType];
    if (v23)
    {
      v24 = v23;
      sub_100006D68(0, &qword_1000101C0);
      id v25 = [v24 identifier];

      if (v25)
      {
        sub_100009880();
      }
      goto LABEL_10;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

uint64_t sub_100003B94()
{
  sub_100006B10(&qword_100010190);
  __chkstk_darwin();
  v1 = (char *)&v6 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = sub_1000097B0();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  uint64_t v4 = sub_100009770();
  sub_100006C88(v4, qword_100010348);
  sub_100006C50(v4, (uint64_t)qword_100010348);
  sub_100009790();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v3 + 56))(v1, 1, 1, v2);
  return sub_100009760();
}

uint64_t sub_100003D00(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    sub_100006B10(&qword_100010200);
    uint64_t v5 = swift_allocError();
    *uint64_t v6 = a3;
    id v7 = a3;
    return _swift_continuation_throwingResumeWithError(v3, v5);
  }
  else
  {
    if (a2)
    {
      sub_100006D68(0, &qword_1000101F8);
      uint64_t v8 = sub_1000098B0();
    }
    else
    {
      uint64_t v8 = 0;
    }
    uint64_t v10 = v8;
    sub_100006D00((uint64_t)&v10, *(void *)(*(void *)(v3 + 64) + 40));
    return swift_continuation_throwingResume();
  }
}

uint64_t sub_100003DF4()
{
  uint64_t v3 = (uint64_t (__cdecl *)())((char *)&dword_100010218 + dword_100010218);
  v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_100003E94;
  return v3();
}

uint64_t sub_100003E94(uint64_t a1)
{
  uint64_t v7 = *v2;
  uint64_t v4 = swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(uint64_t))(v7 + 8);
  if (!v1) {
    uint64_t v4 = a1;
  }
  return v5(v4);
}

uint64_t sub_100003F94(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  uint64_t v4 = (uint64_t (__cdecl *)())((char *)&dword_100010208 + dword_100010208);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 24) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_100004038;
  return v4();
}

uint64_t sub_100004038(uint64_t a1)
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

unint64_t sub_10000414C()
{
  unint64_t result = qword_1000100B0;
  if (!qword_1000100B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000100B0);
  }
  return result;
}

unint64_t sub_1000041A4()
{
  unint64_t result = qword_1000100B8;
  if (!qword_1000100B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000100B8);
  }
  return result;
}

unint64_t sub_1000041FC()
{
  unint64_t result = qword_1000100C0;
  if (!qword_1000100C0)
  {
    sub_100004270(qword_1000100C8);
    sub_1000041A4();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000100C0);
  }
  return result;
}

uint64_t sub_100004270(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_1000042B8(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_100004980();
  void *v5 = v2;
  v5[1] = sub_10000436C;
  return EntityQuery.results()(a1, a2, v6);
}

uint64_t sub_10000436C()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_100004460(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  uint64_t v4 = (uint64_t (__cdecl *)())((char *)&dword_1000101E0 + dword_1000101E0);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 24) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_100004504;
  return v4();
}

uint64_t sub_100004504(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *(void **)(*v2 + 16);
  uint64_t v8 = *v2;
  swift_task_dealloc();
  void *v5 = a1;
  v5[1] = a2;
  unint64_t v6 = *(uint64_t (**)(void))(v8 + 8);
  return v6();
}

unint64_t sub_10000462C()
{
  unint64_t result = qword_1000100E0;
  if (!qword_1000100E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000100E0);
  }
  return result;
}

uint64_t sub_100004680()
{
  uint64_t v0 = sub_100006B10(&qword_1000101D0);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin();
  uint64_t v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100006B10(&qword_1000101D8);
  __chkstk_darwin();
  sub_100003530();
  sub_100009710();
  v6._object = (void *)0x800000010000AA40;
  v6._countAndFlagsBits = 0xD00000000000003ALL;
  sub_100009700(v6);
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, enum case for EntityURLRepresentation.StringInterpolation.Token.id<A>(_:), v0);
  sub_1000096F0();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  v7._countAndFlagsBits = 0;
  v7._object = (void *)0xE000000000000000;
  sub_100009700(v7);
  return sub_100009720();
}

uint64_t sub_10000483C()
{
  uint64_t v0 = qword_100010038;
  swift_bridgeObjectRetain();
  return v0;
}

unint64_t sub_100004878()
{
  unint64_t result = qword_1000100E8;
  if (!qword_1000100E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000100E8);
  }
  return result;
}

unint64_t sub_1000048D0()
{
  unint64_t result = qword_1000100F0;
  if (!qword_1000100F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000100F0);
  }
  return result;
}

unint64_t sub_100004928()
{
  unint64_t result = qword_1000100F8;
  if (!qword_1000100F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000100F8);
  }
  return result;
}

unint64_t sub_100004980()
{
  unint64_t result = qword_100010100;
  if (!qword_100010100)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010100);
  }
  return result;
}

unint64_t sub_1000049D8()
{
  unint64_t result = qword_100010108;
  if (!qword_100010108)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010108);
  }
  return result;
}

uint64_t sub_100004A2C()
{
  sub_100006BFC();
  uint64_t v2 = sub_1000096A0();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
  return sub_100006CEC(v3, v0, v2, v1);
}

unint64_t sub_100004AC4()
{
  unint64_t result = qword_100010118;
  if (!qword_100010118)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010118);
  }
  return result;
}

unint64_t sub_100004B1C()
{
  unint64_t result = qword_100010120;
  if (!qword_100010120)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010120);
  }
  return result;
}

unint64_t sub_100004B74()
{
  unint64_t result = qword_100010128;
  if (!qword_100010128)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010128);
  }
  return result;
}

unint64_t sub_100004BCC()
{
  unint64_t result = qword_100010130;
  if (!qword_100010130)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010130);
  }
  return result;
}

uint64_t sub_100004C20@<X0>(void *a1@<X8>)
{
  uint64_t v2 = v1[1];
  *a1 = *v1;
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

uint64_t sub_100004C2C@<X0>(uint64_t a1@<X8>)
{
  return sub_1000053A0(&qword_100010048, (uint64_t (*)(void))&type metadata accessor for TypeDisplayRepresentation, (uint64_t)qword_100010348, a1);
}

unint64_t sub_100004C68()
{
  unint64_t result = qword_100010138;
  if (!qword_100010138)
  {
    sub_100004270(&qword_100010140);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010138);
  }
  return result;
}

uint64_t sub_100004CC4(uint64_t a1)
{
  unint64_t v2 = sub_100003530();

  return static AppEntity.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_100004D14()
{
  unint64_t result = qword_100010148;
  if (!qword_100010148)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010148);
  }
  return result;
}

void sub_100004D68(uint64_t a1@<X8>)
{
}

uint64_t sub_100004D70(uint64_t a1)
{
  unint64_t v2 = sub_100004B74();

  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

uint64_t sub_100004DBC()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

id sub_100004DEC@<X0>(void *a1@<X8>)
{
  id result = sub_100006734();
  *a1 = result;
  a1[1] = v3;
  return result;
}

unint64_t sub_100004E18()
{
  unint64_t result = qword_100010150;
  if (!qword_100010150)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010150);
  }
  return result;
}

Swift::Int sub_100004E6C()
{
  return sub_100009940();
}

uint64_t sub_100004EB8()
{
  return sub_100009890();
}

Swift::Int sub_100004EC0()
{
  return sub_100009940();
}

uint64_t sub_100004F08(void *a1, void *a2)
{
  if (*a1 == *a2 && a1[1] == a2[1]) {
    return 1;
  }
  else {
    return sub_100009920();
  }
}

unint64_t sub_100004F3C()
{
  unint64_t result = qword_100010158;
  if (!qword_100010158)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010158);
  }
  return result;
}

uint64_t sub_100004F90()
{
  uint64_t v0 = sub_1000097B0();
  sub_100006C88(v0, qword_100010360);
  sub_100006C50(v0, (uint64_t)qword_100010360);
  return sub_100009790();
}

uint64_t sub_100004FF4@<X0>(void *a1@<X8>)
{
  uint64_t result = sub_1000095E0();
  *a1 = v3;
  a1[1] = v4;
  return result;
}

uint64_t sub_100005030()
{
  return sub_1000095F0();
}

void (*sub_100005068(void *a1))(void *a1)
{
  unint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_1000095D0();
  return sub_1000050C4;
}

void sub_1000050C4(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void, void))(*a1 + 32))(*a1, 0);

  free(v1);
}

unint64_t sub_100005114()
{
  unint64_t result = qword_100010160;
  if (!qword_100010160)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010160);
  }
  return result;
}

uint64_t sub_100005168(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_100006B54();
  unint64_t v5 = sub_100006BFC();

  return static URLRepresentableIntent<>.urlRepresentation.getter(a1, v4, a2, v5);
}

uint64_t sub_1000051D4()
{
  uint64_t v0 = qword_100010058;
  swift_bridgeObjectRetain();
  return v0;
}

unint64_t sub_100005214()
{
  unint64_t result = qword_100010168;
  if (!qword_100010168)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010168);
  }
  return result;
}

unint64_t sub_10000526C()
{
  unint64_t result = qword_100010170;
  if (!qword_100010170)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010170);
  }
  return result;
}

unint64_t sub_1000052C4()
{
  unint64_t result = qword_100010178;
  if (!qword_100010178)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010178);
  }
  return result;
}

uint64_t sub_100005318()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100005368@<X0>(uint64_t a1@<X8>)
{
  return sub_1000053A0(&qword_100010050, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_100010360, a1);
}

uint64_t sub_1000053A0@<X0>(void *a1@<X2>, uint64_t (*a2)(void)@<X3>, uint64_t a3@<X4>, uint64_t a4@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v7 = a2(0);
  uint64_t v8 = sub_100006C50(v7, a3);
  uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 16);

  return v9(a4, v8, v7);
}

uint64_t sub_100005444()
{
  return 0;
}

uint64_t sub_100005450()
{
  return 1;
}

uint64_t sub_100005460(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  unint64_t v5 = sub_100006B54();
  unint64_t v6 = sub_100006BA8();
  unint64_t v7 = sub_100006BFC();
  *unint64_t v4 = v2;
  v4[1] = sub_10000552C;
  return URLRepresentableIntent<>.perform()(a2, v5, v6, v7);
}

uint64_t sub_10000552C()
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

uint64_t sub_100005634@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100006808();
  *a1 = result;
  return result;
}

uint64_t sub_10000565C(uint64_t a1)
{
  unint64_t v2 = sub_100005114();

  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

ValueMetadata *type metadata accessor for OpenConfiguredInternetAccountSettings()
{
  return &type metadata for OpenConfiguredInternetAccountSettings;
}

__n128 initializeWithTake for InternetAccountIdentifier(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

ValueMetadata *type metadata accessor for InternetAccountIdentifier()
{
  return &type metadata for InternetAccountIdentifier;
}

void *initializeBufferWithCopyOfBuffer for InternetAccountEntity(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for InternetAccountEntity()
{
  return swift_bridgeObjectRelease();
}

void *_s28AccountsUISettingsAppIntents25InternetAccountIdentifierVwca_0(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *assignWithTake for InternetAccountEntity(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s28AccountsUISettingsAppIntents25InternetAccountIdentifierVwet_0(uint64_t a1, int a2)
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

uint64_t sub_1000057C8(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for InternetAccountEntity()
{
  return &type metadata for InternetAccountEntity;
}

ValueMetadata *type metadata accessor for InternetAccountEntity.InternetAccountEntityQuery()
{
  return &type metadata for InternetAccountEntity.InternetAccountEntityQuery;
}

char *sub_100005824(char *a1, int64_t a2, char a3)
{
  __n128 result = sub_100005844(a1, a2, a3, *v3);
  char *v3 = result;
  return result;
}

char *sub_100005844(char *result, int64_t a2, char a3, char *a4)
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
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    sub_100006B10(&qword_100010210);
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
  id v13 = v10 + 32;
  v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

uint64_t sub_100005948()
{
  uint64_t v1 = sub_1000097C0();
  v0[16] = v1;
  v0[17] = *(void *)(v1 - 8);
  v0[18] = swift_task_alloc();
  return _swift_task_switch(sub_100005A04, 0, 0);
}

uint64_t sub_100005A04()
{
  id v1 = [self defaultStore];
  v0[19] = v1;
  if (v1)
  {
    unint64_t v2 = v1;
    sub_100006D68(0, &qword_1000101C0);
    sub_1000098D0();
    Class isa = sub_1000098A0().super.isa;
    v0[20] = isa;
    swift_bridgeObjectRelease();
    v0[2] = v0;
    v0[7] = v0 + 15;
    v0[3] = sub_100005B78;
    uint64_t v4 = swift_continuation_init();
    v0[10] = _NSConcreteStackBlock;
    v0[11] = 0x40000000;
    v0[12] = sub_100003D00;
    v0[13] = &unk_10000CBE8;
    v0[14] = v4;
    [v2 accountsWithAccountTypeIdentifiers:isa completion:v0 + 10];
    id v1 = v0 + 2;
  }
  else
  {
    __break(1u);
  }
  return _swift_continuation_await(v1);
}

uint64_t sub_100005B78()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 168) = v1;
  if (v1) {
    unint64_t v2 = sub_100005D88;
  }
  else {
    unint64_t v2 = sub_100005C88;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_100005C88()
{
  uint64_t v1 = *(void **)(v0 + 160);
  uint64_t v2 = *(void *)(v0 + 120);

  if (v2)
  {
    uint64_t v4 = *(void *)(v0 + 136);
    uint64_t v3 = *(void *)(v0 + 144);
    uint64_t v5 = *(void *)(v0 + 128);
    sub_100009800();
    (*(void (**)(uint64_t, void, uint64_t))(v4 + 104))(v3, enum case for AccountsUIModel.FilterType.none(_:), v5);
    uint64_t v6 = (void *)sub_1000097E0();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  }
  else
  {
    uint64_t v6 = &_swiftEmptyArrayStorage;
  }
  swift_task_dealloc();
  int64_t v7 = *(uint64_t (**)(void *))(v0 + 8);
  return v7(v6);
}

uint64_t sub_100005D88()
{
  uint64_t v1 = (void *)v0[20];
  uint64_t v2 = (void *)v0[19];
  swift_willThrow();
  swift_errorRelease();

  swift_task_dealloc();
  uint64_t v3 = (uint64_t (*)(void *))v0[1];
  return v3(&_swiftEmptyArrayStorage);
}

uint64_t sub_100005E20()
{
  uint64_t v1 = sub_1000097C0();
  v0[2] = v1;
  v0[3] = *(void *)(v1 - 8);
  v0[4] = swift_task_alloc();
  uint64_t v4 = (uint64_t (__cdecl *)())((char *)&dword_1000101E8 + dword_1000101E8);
  uint64_t v2 = (void *)swift_task_alloc();
  v0[5] = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_100005F1C;
  return v4();
}

uint64_t sub_100005F1C(uint64_t a1)
{
  *(void *)(*(void *)v1 + 48) = a1;
  swift_task_dealloc();
  return _swift_task_switch(sub_10000601C, 0, 0);
}

char *sub_10000601C()
{
  uint64_t v2 = v0[3];
  uint64_t v1 = v0[4];
  uint64_t v3 = v0[2];
  sub_100009800();
  (*(void (**)(uint64_t, void, uint64_t))(v2 + 104))(v1, enum case for AccountsUIModel.FilterType.none(_:), v3);
  unint64_t v4 = sub_1000097E0();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  if (v4 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v5 = sub_1000098F0();
    swift_bridgeObjectRelease();
    if (v5) {
      goto LABEL_3;
    }
LABEL_14:
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    v17 = (uint64_t (*)(void *))v0[1];
    return (char *)v17(_swiftEmptyArrayStorage);
  }
  uint64_t v5 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v5) {
    goto LABEL_14;
  }
LABEL_3:
  __n128 result = sub_100005824(0, v5 & ~(v5 >> 63), 0);
  if (v5 < 0)
  {
    __break(1u);
  }
  else
  {
    uint64_t v7 = 0;
    while (1)
    {
      id v8 = (v4 & 0xC000000000000001) != 0 ? (id)sub_1000098E0() : *(id *)(v4 + 8 * v7 + 32);
      uint64_t v9 = v8;
      __n128 result = (char *)[v8 identifier];
      if (!result) {
        break;
      }
      uint64_t v10 = result;
      uint64_t v11 = sub_100009880();
      uint64_t v13 = v12;

      unint64_t v15 = _swiftEmptyArrayStorage[2];
      unint64_t v14 = _swiftEmptyArrayStorage[3];
      if (v15 >= v14 >> 1) {
        sub_100005824((char *)(v14 > 1), v15 + 1, 1);
      }
      ++v7;
      _swiftEmptyArrayStorage[2] = v15 + 1;
      id v16 = (char *)&_swiftEmptyArrayStorage[2 * v15];
      *((void *)v16 + 4) = v11;
      *((void *)v16 + 5) = v13;
      if (v5 == v7) {
        goto LABEL_14;
      }
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_100006254()
{
  uint64_t v1 = sub_1000097C0();
  v0[2] = v1;
  v0[3] = *(void *)(v1 - 8);
  v0[4] = swift_task_alloc();
  unint64_t v4 = (uint64_t (__cdecl *)())((char *)&dword_1000101E8 + dword_1000101E8);
  uint64_t v2 = (void *)swift_task_alloc();
  v0[5] = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_100006350;
  return v4();
}

uint64_t sub_100006350(uint64_t a1)
{
  *(void *)(*(void *)v1 + 48) = a1;
  swift_task_dealloc();
  return _swift_task_switch(sub_100006DB4, 0, 0);
}

uint64_t sub_100006450()
{
  uint64_t v3 = (uint64_t (__cdecl *)())((char *)&dword_1000101E8 + dword_1000101E8);
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_1000064F0;
  return v3();
}

uint64_t sub_1000064F0(uint64_t a1)
{
  *(void *)(*(void *)v1 + 24) = a1;
  swift_task_dealloc();
  return _swift_task_switch(sub_1000065F0, 0, 0);
}

void sub_1000065F0()
{
  unint64_t v1 = *(void *)(v0 + 24);
  if (v1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v4 = sub_1000098F0();
    swift_bridgeObjectRelease();
    if (v4) {
      goto LABEL_3;
    }
LABEL_9:
    swift_bridgeObjectRelease();
    goto LABEL_10;
  }
  if (!*(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
    goto LABEL_9;
  }
LABEL_3:
  if ((v1 & 0xC000000000000001) != 0)
  {
    id v2 = (id)sub_1000098E0();
  }
  else
  {
    if (!*(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      return;
    }
    id v2 = *(id *)(*(void *)(v0 + 24) + 32);
  }
  swift_bridgeObjectRelease();
  id v3 = [v2 identifier];

  if (v3)
  {
    sub_100009870();
  }
LABEL_10:
  uint64_t v5 = *(void (**)(void))(v0 + 8);
  v5(0);
}

id sub_100006734()
{
  sub_100009800();
  uint64_t v0 = (void *)sub_1000097F0();
  unint64_t v1 = (void *)sub_1000097D0();

  NSString v2 = sub_100009860();
  id v3 = [v1 monitoredAccountWithIdentifier:v2];

  if (!v3) {
    return 0;
  }
  id result = [v3 identifier];
  if (result)
  {
    uint64_t v5 = result;
    uint64_t v6 = sub_100009880();

    return (id)v6;
  }
  __break(1u);
  return result;
}

uint64_t sub_100006808()
{
  uint64_t v18 = sub_100009730();
  uint64_t v0 = *(void *)(v18 - 8);
  __chkstk_darwin(v18);
  NSString v2 = (char *)&v17 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100006B10(&qword_100010188);
  uint64_t v4 = __chkstk_darwin(v3 - 8);
  uint64_t v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  id v8 = (char *)&v17 - v7;
  uint64_t v9 = sub_100006B10(&qword_100010190);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_1000097B0();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  sub_100006B10(&qword_100010198);
  sub_100009790();
  sub_100009790();
  (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(v11, 0, 1, v12);
  uint64_t v14 = sub_1000095C0();
  uint64_t v19 = 0;
  uint64_t v20 = 0;
  unint64_t v15 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56);
  v15(v8, 1, 1, v14);
  v15(v6, 1, 1, v14);
  (*(void (**)(char *, void, uint64_t))(v0 + 104))(v2, enum case for InputConnectionBehavior.default(_:), v18);
  sub_100003530();
  return sub_100009610();
}

uint64_t sub_100006B10(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_100006B54()
{
  unint64_t result = qword_1000101A0;
  if (!qword_1000101A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000101A0);
  }
  return result;
}

unint64_t sub_100006BA8()
{
  unint64_t result = qword_1000101A8;
  if (!qword_1000101A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000101A8);
  }
  return result;
}

unint64_t sub_100006BFC()
{
  unint64_t result = qword_1000101B0;
  if (!qword_1000101B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000101B0);
  }
  return result;
}

uint64_t sub_100006C50(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t *sub_100006C88(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_100006CEC(uint64_t (*a1)(uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return a1(a3, a4);
}

uint64_t sub_100006D00(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100006B10(&qword_1000101F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100006D68(uint64_t a1, unint64_t *a2)
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

uint64_t sub_100006DB8()
{
  uint64_t v0 = sub_100006B10(&qword_100010190);
  __chkstk_darwin(v0 - 8);
  NSString v2 = (char *)&v7 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_1000097B0();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v5 = sub_100009770();
  sub_100006C88(v5, qword_100010378);
  sub_100006C50(v5, (uint64_t)qword_100010378);
  sub_100009790();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v4 + 56))(v2, 1, 1, v3);
  return sub_100009760();
}

unint64_t sub_100006F24()
{
  uint64_t v0 = sub_100006B10(&qword_1000101B8);
  __chkstk_darwin(v0 - 8);
  NSString v2 = (char *)v25 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100006B10(&qword_100010190);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1000097B0();
  uint64_t v34 = v6;
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  Swift::String v44 = (char *)v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)v25 - v10;
  sub_100006B10(&qword_1000102F8);
  uint64_t v12 = (int *)(sub_100006B10(&qword_100010300) - 8);
  uint64_t v13 = *(void *)v12;
  uint64_t v39 = *(void *)(*(void *)v12 + 72);
  unint64_t v14 = (*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  uint64_t v15 = swift_allocObject();
  uint64_t v41 = v15;
  *(_OWORD *)(v15 + 16) = xmmword_10000A300;
  unint64_t v16 = v15 + v14 + v12[14];
  unint64_t v29 = v15 + v14;
  unint64_t v30 = v16;
  *(unsigned char *)(v15 + v14) = 0;
  unint64_t v36 = 0xD000000000000019;
  sub_100009790();
  Swift::String v43 = v5;
  sub_100009790();
  uint64_t v17 = *(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56);
  v7 += 56;
  uint64_t v33 = v17;
  v17(v5, 0, 1, v6);
  unint64_t v31 = 0x800000010000A9D0;
  unint64_t v32 = 0xD000000000000027;
  Swift::String v42 = v2;
  sub_100009630();
  uint64_t v26 = sub_100009640();
  uint64_t v18 = *(void *)(v26 - 8);
  v27 = *(void (**)(char *, void, uint64_t, uint64_t))(v18 + 56);
  uint64_t v28 = v18 + 56;
  v27(v2, 0, 1, v26);
  v25[5] = sub_100006B10(&qword_1000101C8);
  uint64_t v19 = *(void *)(v7 + 16);
  uint64_t v20 = *(unsigned __int8 *)(v7 + 24);
  v25[2] = 4 * v19;
  uint64_t v35 = 5 * v19;
  v25[4] = v20 | 7;
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_10000A310;
  unint64_t v40 = 0xD000000000000012;
  sub_100009790();
  sub_100009790();
  sub_100009790();
  v25[3] = 3 * v19;
  unint64_t v37 = 0xD000000000000013;
  sub_100009790();
  v25[1] = 0xD000000000000017;
  sub_100009790();
  sub_100009790();
  uint64_t v38 = v11;
  v21 = v42;
  v22 = v43;
  sub_100009650();
  id v23 = (unsigned char *)(v29 + v39);
  v39 += v29 + v12[14];
  *id v23 = 1;
  sub_100009790();
  sub_100009790();
  v33(v22, 0, 1, v34);
  sub_100009630();
  v27(v21, 0, 1, v26);
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_10000A320;
  sub_100009790();
  sub_100009790();
  sub_100009790();
  sub_100009790();
  sub_100009790();
  sub_100009790();
  sub_100009790();
  sub_100009790();
  sub_100009790();
  sub_100009790();
  sub_100009790();
  sub_100009790();
  sub_100009790();
  sub_100009790();
  sub_100009790();
  sub_100009790();
  sub_100009790();
  sub_100009650();
  unint64_t result = sub_1000076CC(v41);
  qword_100010390 = result;
  return result;
}

unint64_t sub_1000076CC(uint64_t a1)
{
  uint64_t v2 = sub_100006B10(&qword_100010300);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(void *)(a1 + 16))
  {
    uint64_t v7 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100006B10(&qword_100010308);
  uint64_t v6 = sub_100009900();
  uint64_t v7 = (void *)v6;
  uint64_t v8 = *(void *)(a1 + 16);
  if (!v8)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v7;
  }
  uint64_t v9 = &v5[*(int *)(v2 + 48)];
  uint64_t v10 = v6 + 64;
  unint64_t v11 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v23[1] = a1;
  uint64_t v12 = a1 + v11;
  uint64_t v13 = *(void *)(v3 + 72);
  swift_retain();
  while (1)
  {
    sub_100009308(v12, (uint64_t)v5, &qword_100010300);
    char v14 = *v5;
    unint64_t result = sub_100008D18(*v5);
    if (v16) {
      break;
    }
    unint64_t v17 = result;
    *(void *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(unsigned char *)(v7[6] + result) = v14;
    uint64_t v18 = v7[7];
    uint64_t v19 = sub_100009660();
    unint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(void *)(v19 - 8) + 32))(v18 + *(void *)(*(void *)(v19 - 8) + 72) * v17, v9, v19);
    uint64_t v20 = v7[2];
    BOOL v21 = __OFADD__(v20, 1);
    uint64_t v22 = v20 + 1;
    if (v21) {
      goto LABEL_11;
    }
    v7[2] = v22;
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

unint64_t sub_1000078C4(uint64_t a1)
{
  uint64_t v2 = sub_100006B10(&qword_100010320);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(void *)(a1 + 16))
  {
    uint64_t v7 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100006B10(&qword_100010328);
  uint64_t v6 = sub_100009900();
  uint64_t v7 = (void *)v6;
  uint64_t v8 = *(void *)(a1 + 16);
  if (!v8)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v7;
  }
  uint64_t v9 = &v5[*(int *)(v2 + 48)];
  uint64_t v10 = v6 + 64;
  unint64_t v11 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v23[1] = a1;
  uint64_t v12 = a1 + v11;
  uint64_t v13 = *(void *)(v3 + 72);
  swift_retain();
  while (1)
  {
    sub_100009308(v12, (uint64_t)v5, &qword_100010320);
    char v14 = *v5;
    unint64_t result = sub_100008D18(*v5);
    if (v16) {
      break;
    }
    unint64_t v17 = result;
    *(void *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(unsigned char *)(v7[6] + result) = v14;
    uint64_t v18 = v7[7];
    uint64_t v19 = sub_100006B10(&qword_100010330);
    unint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(void *)(v19 - 8) + 32))(v18 + *(void *)(*(void *)(v19 - 8) + 72) * v17, v9, v19);
    uint64_t v20 = v7[2];
    BOOL v21 = __OFADD__(v20, 1);
    uint64_t v22 = v20 + 1;
    if (v21) {
      goto LABEL_11;
    }
    v7[2] = v22;
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

uint64_t sub_100007AC4()
{
  uint64_t v0 = sub_100006B10(&qword_100010310);
  sub_100006C88(v0, qword_100010398);
  sub_100006C50(v0, (uint64_t)qword_100010398);
  sub_100006B10(&qword_100010318);
  uint64_t v1 = *(void *)(sub_100006B10(&qword_100010320) - 8);
  uint64_t v2 = *(void *)(v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_10000A300;
  *(unsigned char *)(v4 + v3) = 0;
  sub_100007F68();
  sub_100009670();
  *(unsigned char *)(v4 + v3 + v2) = 1;
  sub_100009670();
  sub_1000078C4(v4);
  return sub_100009680();
}

uint64_t sub_100007C58(char *a1, char *a2)
{
  return sub_100007CBC(*a1, *a2);
}

unint64_t sub_100007C68()
{
  unint64_t result = qword_100010230;
  if (!qword_100010230)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010230);
  }
  return result;
}

uint64_t sub_100007CBC(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    uint64_t v3 = 0x756F636341646461;
  }
  else {
    uint64_t v3 = 1953460082;
  }
  if (v2) {
    unint64_t v4 = 0xE400000000000000;
  }
  else {
    unint64_t v4 = 0xEA0000000000746ELL;
  }
  if (a2) {
    uint64_t v5 = 0x756F636341646461;
  }
  else {
    uint64_t v5 = 1953460082;
  }
  if (a2) {
    unint64_t v6 = 0xEA0000000000746ELL;
  }
  else {
    unint64_t v6 = 0xE400000000000000;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = sub_100009920();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

Swift::Int sub_100007D60()
{
  return sub_100009940();
}

uint64_t sub_100007DE0()
{
  sub_100009890();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_100007E4C()
{
  return sub_100009940();
}

uint64_t sub_100007EC8@<X0>(uint64_t *a1@<X0>, char *a2@<X8>)
{
  v8._countAndFlagsBits = *a1;
  uint64_t v3 = (void *)a1[1];
  v4._rawValue = &off_10000CA00;
  v8._object = v3;
  Swift::Int v5 = sub_100009910(v4, v8);
  uint64_t result = swift_bridgeObjectRelease();
  if (v5 == 1) {
    char v7 = 1;
  }
  else {
    char v7 = 2;
  }
  if (!v5) {
    char v7 = 0;
  }
  *a2 = v7;
  return result;
}

void sub_100007F28(uint64_t *a1@<X8>)
{
  uint64_t v2 = 1953460082;
  if (*v1) {
    uint64_t v2 = 0x756F636341646461;
  }
  unint64_t v3 = 0xE400000000000000;
  if (*v1) {
    unint64_t v3 = 0xEA0000000000746ELL;
  }
  *a1 = v2;
  a1[1] = v3;
}

unint64_t sub_100007F68()
{
  unint64_t result = qword_100010238;
  if (!qword_100010238)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010238);
  }
  return result;
}

unint64_t sub_100007FC0()
{
  unint64_t result = qword_100010240;
  if (!qword_100010240)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010240);
  }
  return result;
}

uint64_t sub_100008014@<X0>(uint64_t a1@<X8>)
{
  if (qword_100010078 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100006B10(&qword_100010310);
  uint64_t v3 = sub_100006C50(v2, (uint64_t)qword_100010398);
  Swift::OpaquePointer v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

unint64_t sub_1000080C4()
{
  unint64_t result = qword_100010248;
  if (!qword_100010248)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010248);
  }
  return result;
}

unint64_t sub_10000811C()
{
  unint64_t result = qword_100010250;
  if (!qword_100010250)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010250);
  }
  return result;
}

unint64_t sub_100008174()
{
  unint64_t result = qword_100010258;
  if (!qword_100010258)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010258);
  }
  return result;
}

void *sub_1000081C8()
{
  return &protocol witness table for String;
}

uint64_t sub_1000081D4()
{
  sub_1000092B4();
  uint64_t v2 = sub_100009620();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
  return sub_100006CEC(v3, v0, v2, v1);
}

unint64_t sub_10000826C()
{
  unint64_t result = qword_100010268;
  if (!qword_100010268)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010268);
  }
  return result;
}

unint64_t sub_1000082C4()
{
  unint64_t result = qword_100010270;
  if (!qword_100010270)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010270);
  }
  return result;
}

unint64_t sub_10000831C()
{
  unint64_t result = qword_100010278;
  if (!qword_100010278)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010278);
  }
  return result;
}

unint64_t sub_100008374()
{
  unint64_t result = qword_100010280;
  if (!qword_100010280)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010280);
  }
  return result;
}

uint64_t sub_1000083C8@<X0>(uint64_t a1@<X8>)
{
  return sub_1000053A0(&qword_100010068, (uint64_t (*)(void))&type metadata accessor for TypeDisplayRepresentation, (uint64_t)qword_100010378, a1);
}

uint64_t sub_100008400(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1000089A0(a1, a2, a3, (void (*)(void))sub_100007F68);
}

uint64_t sub_10000842C(uint64_t a1)
{
  unint64_t v2 = sub_100007F68();

  return static AppEnum.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_10000847C()
{
  unint64_t result = qword_100010288;
  if (!qword_100010288)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010288);
  }
  return result;
}

unint64_t sub_1000084D4()
{
  unint64_t result = qword_100010290;
  if (!qword_100010290)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010290);
  }
  return result;
}

unint64_t sub_10000852C()
{
  unint64_t result = qword_100010298;
  if (!qword_100010298)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010298);
  }
  return result;
}

uint64_t sub_100008580()
{
  if (qword_100010070 != -1) {
    swift_once();
  }

  return swift_bridgeObjectRetain();
}

uint64_t sub_1000085DC(uint64_t a1)
{
  unint64_t v2 = sub_100008374();

  return CaseDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

unint64_t sub_10000862C()
{
  unint64_t result = qword_1000102A0;
  if (!qword_1000102A0)
  {
    sub_100004270(&qword_1000102A8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000102A0);
  }
  return result;
}

void sub_100008688(void *a1@<X8>)
{
  *a1 = &off_10000CA50;
}

unint64_t sub_10000869C()
{
  unint64_t result = qword_1000102B0;
  if (!qword_1000102B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000102B0);
  }
  return result;
}

uint64_t sub_1000086F4()
{
  uint64_t v0 = sub_1000097B0();
  sub_100006C88(v0, qword_1000103B0);
  sub_100006C50(v0, (uint64_t)qword_1000103B0);
  return sub_100009790();
}

uint64_t sub_100008758@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_1000095E0();
  *a1 = v3;
  return result;
}

uint64_t sub_100008794()
{
  return sub_1000095F0();
}

unint64_t sub_1000087D0()
{
  unint64_t result = qword_1000102B8;
  if (!qword_1000102B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000102B8);
  }
  return result;
}

uint64_t sub_100008824(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_10000920C();
  unint64_t v5 = sub_1000092B4();

  return static URLRepresentableIntent<>.urlRepresentation.getter(a1, v4, a2, v5);
}

uint64_t sub_10000888C()
{
  uint64_t v0 = qword_100010220;
  swift_bridgeObjectRetain();
  return v0;
}

unint64_t sub_1000088C8()
{
  unint64_t result = qword_1000102C0;
  if (!qword_1000102C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000102C0);
  }
  return result;
}

unint64_t sub_100008920()
{
  unint64_t result = qword_1000102C8;
  if (!qword_1000102C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000102C8);
  }
  return result;
}

uint64_t sub_100008974(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1000089A0(a1, a2, a3, (void (*)(void))sub_1000087D0);
}

uint64_t sub_1000089A0(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1000089E8@<X0>(uint64_t a1@<X8>)
{
  return sub_1000053A0(&qword_100010080, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_1000103B0, a1);
}

uint64_t sub_100008A20(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  unint64_t v5 = sub_10000920C();
  unint64_t v6 = sub_100009260();
  unint64_t v7 = sub_1000092B4();
  *unint64_t v4 = v2;
  v4[1] = sub_10000552C;
  return URLRepresentableIntent<>.perform()(a2, v5, v6, v7);
}

uint64_t sub_100008AEC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100008EF8();
  *a1 = result;
  return result;
}

uint64_t sub_100008B14(uint64_t a1)
{
  unint64_t v2 = sub_1000087D0();

  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

ValueMetadata *type metadata accessor for OpenInternetAccountsSettings()
{
  return &type metadata for OpenInternetAccountsSettings;
}

unsigned char *initializeBufferWithCopyOfBuffer for InternetAccountsDeepLinks(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for InternetAccountsDeepLinks(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFF) {
    goto LABEL_17;
  }
  if (a2 + 1 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 1;
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
      return (*a1 | (v4 << 8)) - 1;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 1;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 2;
  int v8 = v6 - 2;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for InternetAccountsDeepLinks(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFE)
  {
    unsigned int v6 = ((a2 - 255) >> 8) + 1;
    *uint64_t result = a2 + 1;
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
        JUMPOUT(0x100008CCCLL);
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
          *uint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

uint64_t sub_100008CF4(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_100008CFC(unsigned char *result, char a2)
{
  *uint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for InternetAccountsDeepLinks()
{
  return &type metadata for InternetAccountsDeepLinks;
}

unint64_t sub_100008D18(char a1)
{
  sub_100009930();
  sub_100009890();
  swift_bridgeObjectRelease();
  Swift::Int v2 = sub_100009940();

  return sub_100008DBC(a1 & 1, v2);
}

unint64_t sub_100008DBC(char a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    if (a1) {
      uint64_t v6 = 0x756F636341646461;
    }
    else {
      uint64_t v6 = 1953460082;
    }
    if (a1) {
      unint64_t v7 = 0xEA0000000000746ELL;
    }
    else {
      unint64_t v7 = 0xE400000000000000;
    }
    while (1)
    {
      uint64_t v8 = *(unsigned char *)(*(void *)(v2 + 48) + v4) ? 0x756F636341646461 : 1953460082;
      unint64_t v9 = *(unsigned char *)(*(void *)(v2 + 48) + v4) ? 0xEA0000000000746ELL : 0xE400000000000000;
      if (v8 == v6 && v9 == v7) {
        break;
      }
      char v11 = sub_100009920();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v11 & 1) == 0)
      {
        unint64_t v4 = (v4 + 1) & v5;
        if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4)) {
          continue;
        }
      }
      return v4;
    }
    swift_bridgeObjectRelease_n();
  }
  return v4;
}

uint64_t sub_100008EF8()
{
  uint64_t v17 = sub_100009730();
  uint64_t v0 = *(void *)(v17 - 8);
  __chkstk_darwin(v17);
  uint64_t v2 = (char *)&v17 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100006B10(&qword_100010188);
  uint64_t v4 = __chkstk_darwin(v3 - 8);
  uint64_t v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v17 - v7;
  uint64_t v9 = sub_100006B10(&qword_100010190);
  __chkstk_darwin(v9 - 8);
  char v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_1000097B0();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  sub_100006B10(&qword_1000102D8);
  sub_100009790();
  sub_100009790();
  (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(v11, 0, 1, v12);
  char v18 = 2;
  uint64_t v14 = sub_1000095C0();
  uint64_t v15 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56);
  v15(v8, 1, 1, v14);
  v15(v6, 1, 1, v14);
  (*(void (**)(char *, void, uint64_t))(v0 + 104))(v2, enum case for InputConnectionBehavior.default(_:), v17);
  sub_100007F68();
  return sub_100009600();
}

unint64_t sub_10000920C()
{
  unint64_t result = qword_1000102E0;
  if (!qword_1000102E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000102E0);
  }
  return result;
}

unint64_t sub_100009260()
{
  unint64_t result = qword_1000102E8;
  if (!qword_1000102E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000102E8);
  }
  return result;
}

unint64_t sub_1000092B4()
{
  unint64_t result = qword_1000102F0;
  if (!qword_1000102F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000102F0);
  }
  return result;
}

uint64_t sub_100009308(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100006B10(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_10000936C(uint64_t a1)
{
  unint64_t v2 = sub_1000094BC();

  return AppIntentsExtension.configuration.getter(a1, v2);
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

unint64_t sub_100009414()
{
  unint64_t result = qword_100010338;
  if (!qword_100010338)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010338);
  }
  return result;
}

uint64_t sub_10000946C()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_1000094BC()
{
  unint64_t result = qword_100010340;
  if (!qword_100010340)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010340);
  }
  return result;
}

ValueMetadata *type metadata accessor for AccountsUISettingsAppIntentsExtension()
{
  return &type metadata for AccountsUISettingsAppIntentsExtension;
}

uint64_t sub_100009520()
{
  return static AppIntentInternal.sideEffect.getter();
}

uint64_t sub_100009530()
{
  return static AppIntentInternal.shortcutsMetadata.getter();
}

uint64_t sub_100009560()
{
  return static AppIntent.description.getter();
}

uint64_t sub_100009570()
{
  return static AppIntent.parameterSummary.getter();
}

uint64_t sub_100009580()
{
  return static AppIntent.authenticationPolicy.getter();
}

uint64_t sub_1000095C0()
{
  return type metadata accessor for IntentDialog();
}

uint64_t sub_1000095D0()
{
  return IntentParameter.wrappedValue.modify();
}

uint64_t sub_1000095E0()
{
  return IntentParameter.wrappedValue.getter();
}

uint64_t sub_1000095F0()
{
  return IntentParameter.wrappedValue.setter();
}

uint64_t sub_100009600()
{
  return IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:supportedValues:)();
}

uint64_t sub_100009610()
{
  return IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:)();
}

uint64_t sub_100009620()
{
  return URLRepresentableEnum.urlRepresentationParameter.getter();
}

uint64_t sub_100009630()
{
  return DisplayRepresentation.Image.init(appBundleIdentifier:)();
}

uint64_t sub_100009640()
{
  return type metadata accessor for DisplayRepresentation.Image();
}

uint64_t sub_100009650()
{
  return DisplayRepresentation.init(title:subtitle:image:synonyms:descriptionText:)();
}

uint64_t sub_100009660()
{
  return type metadata accessor for DisplayRepresentation();
}

uint64_t sub_100009670()
{
  return EnumURLRepresentation.EnumSingleURLRepresentation.init(stringLiteral:)();
}

uint64_t sub_100009680()
{
  return EnumURLRepresentation.init(_:)();
}

uint64_t sub_100009690()
{
  return static DynamicOptionsProvider.useForParameterResolution.getter();
}

uint64_t sub_1000096A0()
{
  return URLRepresentableEntity.urlRepresentationParameter.getter();
}

uint64_t sub_1000096F0()
{
  return EntityURLRepresentation.StringInterpolation.appendInterpolation(_:)();
}

void sub_100009700(Swift::String a1)
{
}

uint64_t sub_100009710()
{
  return EntityURLRepresentation.StringInterpolation.init(literalCapacity:interpolationCount:)();
}

uint64_t sub_100009720()
{
  return EntityURLRepresentation.init(stringInterpolation:)();
}

uint64_t sub_100009730()
{
  return type metadata accessor for InputConnectionBehavior();
}

uint64_t sub_100009750()
{
  return static PersistentlyIdentifiable.persistentIdentifier.getter();
}

uint64_t sub_100009760()
{
  return TypeDisplayRepresentation.init(name:numericFormat:)();
}

uint64_t sub_100009770()
{
  return type metadata accessor for TypeDisplayRepresentation();
}

uint64_t sub_100009790()
{
  return LocalizedStringResource.init(stringLiteral:)();
}

uint64_t sub_1000097A0()
{
  return LocalizedStringResource.init(stringInterpolation:)();
}

uint64_t sub_1000097B0()
{
  return type metadata accessor for LocalizedStringResource();
}

uint64_t sub_1000097C0()
{
  return type metadata accessor for AccountsUIModel.FilterType();
}

uint64_t sub_1000097D0()
{
  return dispatch thunk of AccountsUIModel.monitoredStore.getter();
}

uint64_t sub_1000097E0()
{
  return static AccountsUIModel.filter(_:filter:)();
}

uint64_t sub_1000097F0()
{
  return static AccountsUIModel.shared.getter();
}

uint64_t sub_100009800()
{
  return type metadata accessor for AccountsUIModel();
}

uint64_t sub_100009810()
{
  return static AppExtension.main()();
}

void sub_100009820(Swift::String a1)
{
}

void sub_100009830(Swift::String a1)
{
}

uint64_t sub_100009840()
{
  return String.LocalizationValue.StringInterpolation.init(literalCapacity:interpolationCount:)();
}

uint64_t sub_100009850()
{
  return type metadata accessor for String.LocalizationValue.StringInterpolation();
}

NSString sub_100009860()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_100009870()
{
  return static String._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_100009880()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100009890()
{
  return String.hash(into:)();
}

NSArray sub_1000098A0()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_1000098B0()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_1000098C0()
{
  return static ACAccountType.localizedTypeName(for:)();
}

uint64_t sub_1000098D0()
{
  return static ACAccountType.internetAccountTypes.getter();
}

uint64_t sub_1000098E0()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_1000098F0()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_100009900()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

Swift::Int sub_100009910(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases, string);
}

uint64_t sub_100009920()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_100009930()
{
  return Hasher.init(_seed:)();
}

Swift::Int sub_100009940()
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

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
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

uint64_t swift_allocError()
{
  return _swift_allocError();
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_arrayInitWithCopy()
{
  return _swift_arrayInitWithCopy();
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

uint64_t swift_continuation_init()
{
  return _swift_continuation_init();
}

uint64_t swift_continuation_throwingResume()
{
  return _swift_continuation_throwingResume();
}

uint64_t swift_errorInMain()
{
  return _swift_errorInMain();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
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