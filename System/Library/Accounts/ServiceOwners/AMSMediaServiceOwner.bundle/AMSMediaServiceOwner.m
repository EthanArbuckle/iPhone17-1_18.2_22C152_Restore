uint64_t sub_3B98()
{
  return sub_3C3C(&qword_1C700, type metadata accessor for AIDAServiceOperationUIPermissions);
}

void type metadata accessor for AIDAServiceOperationUIPermissions(uint64_t a1)
{
}

uint64_t sub_3BF4()
{
  return sub_3C3C(&qword_1C708, type metadata accessor for AIDAServiceType);
}

uint64_t sub_3C3C(unint64_t *a1, void (*a2)(uint64_t))
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

void type metadata accessor for AIDAServiceType(uint64_t a1)
{
}

uint64_t sub_3C98()
{
  return sub_3DD0(*v0, (uint64_t (*)(uint64_t))&String.hashValue.getter);
}

uint64_t sub_3CC8()
{
  return sub_3CD0();
}

uint64_t sub_3CD0()
{
  sub_146E0();
  sub_146F0();
  return swift_bridgeObjectRelease();
}

Swift::Int sub_3D24()
{
  return sub_3D2C();
}

Swift::Int sub_3D2C()
{
  sub_146E0();
  sub_147E0();
  sub_146F0();
  Swift::Int v0 = sub_147F0();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_3DA0()
{
  return sub_3DD0(*v0, (uint64_t (*)(uint64_t))&String._bridgeToObjectiveC());
}

uint64_t sub_3DD0(uint64_t a1, uint64_t (*a2)(uint64_t))
{
  uint64_t v3 = sub_146E0();
  uint64_t v4 = a2(v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_3E10(uint64_t a1, id *a2)
{
  return sub_4384(a1, a2);
}

uint64_t sub_3E28(uint64_t a1, id *a2)
{
  return sub_43FC(a1, a2) & 1;
}

NSString sub_3E44@<X0>(void *a1@<X8>)
{
  NSString result = sub_447C();
  *a1 = result;
  return result;
}

BOOL sub_3E6C(uint64_t *a1, uint64_t *a2)
{
  return sub_3E78(*a1, *a2);
}

BOOL sub_3E78(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

uint64_t sub_3E84()
{
  uint64_t v0 = sub_146E0();
  uint64_t v2 = v1;
  if (v0 == sub_146E0() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_147D0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_3F10@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_3F3C(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_3F40()
{
  return sub_3E84();
}

void sub_3F4C(uint64_t a1@<X8>)
{
  sub_3F80();
  *(void *)a1 = v2;
  *(unsigned char *)(a1 + 8) = v3 & 1;
}

uint64_t sub_3F88@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = nullsub_1(*v1);
  *a1 = result;
  return result;
}

uint64_t sub_3FB8(uint64_t a1)
{
  uint64_t v2 = sub_3C3C((unint64_t *)&qword_1C780, type metadata accessor for AIDAServiceType);
  uint64_t v3 = sub_3C3C(&qword_1C788, type metadata accessor for AIDAServiceType);
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_4074()
{
  return sub_3C3C(&qword_1C768, type metadata accessor for AIDAServiceType);
}

uint64_t sub_40BC()
{
  return sub_3C3C(&qword_1C770, type metadata accessor for AIDAServiceType);
}

uint64_t sub_4104()
{
  return sub_3C3C(&qword_1C778, type metadata accessor for AIDAServiceType);
}

void type metadata accessor for AMSAccountMediaType(uint64_t a1)
{
}

void sub_4160(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_41A8@<X0>(void *a1@<X8>)
{
  NSString v2 = sub_146B0();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_41F0(uint64_t a1)
{
  uint64_t v2 = sub_3C3C(&qword_1C7B0, type metadata accessor for AMSAccountMediaType);
  uint64_t v3 = sub_3C3C(&qword_1C7B8, type metadata accessor for AMSAccountMediaType);
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_42AC()
{
  return sub_3C3C(&qword_1C798, type metadata accessor for AMSAccountMediaType);
}

uint64_t sub_42F4()
{
  return sub_3C3C(&qword_1C7A0, type metadata accessor for AMSAccountMediaType);
}

uint64_t sub_433C()
{
  return sub_3C3C(&qword_1C7A8, type metadata accessor for AMSAccountMediaType);
}

uint64_t sub_4384(uint64_t a1, id *a2)
{
  uint64_t result = sub_146C0();
  *a2 = 0;
  return result;
}

uint64_t sub_43FC(uint64_t a1, id *a2)
{
  char v3 = sub_146D0();
  *a2 = 0;
  return v3 & 1;
}

NSString sub_447C()
{
  sub_146E0();
  NSString v0 = sub_146B0();
  swift_bridgeObjectRelease();
  return v0;
}

unint64_t sub_44B8(uint64_t a1)
{
  unint64_t result = sub_44E0();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_44E0()
{
  unint64_t result = qword_1C820;
  if (!qword_1C820)
  {
    type metadata accessor for AIDAServiceOperationUIPermissions(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1C820);
  }
  return result;
}

uint64_t sub_4530(uint64_t a1)
{
  *(void *)(a1 + 8) = sub_4598((unint64_t *)&qword_1C780);
  uint64_t result = sub_4598(&qword_1C768);
  *(void *)(a1 + 16) = result;
  return result;
}

uint64_t sub_4598(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for AIDAServiceType(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

id AMSMediaServiceOwner.__allocating_init(accountStore:)(uint64_t a1)
{
  char v3 = (char *)objc_allocWithZone(v1);
  uint64_t v4 = &v3[OBJC_IVAR____TtC20AMSMediaServiceOwner20AMSMediaServiceOwner_serviceOwner];
  *(void *)uint64_t v4 = a1;
  *((void *)v4 + 1) = sub_46B4;
  *((void *)v4 + 2) = 0;
  v4[24] = 0;
  v6.receiver = v3;
  v6.super_class = v1;
  return objc_msgSendSuper2(&v6, "init");
}

id AMSMediaServiceOwner.init(accountStore:)(uint64_t a1)
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v4 = &v1[OBJC_IVAR____TtC20AMSMediaServiceOwner20AMSMediaServiceOwner_serviceOwner];
  *(void *)uint64_t v4 = a1;
  *((void *)v4 + 1) = sub_46B4;
  *((void *)v4 + 2) = 0;
  v4[24] = 0;
  v6.receiver = v1;
  v6.super_class = ObjectType;
  return objc_msgSendSuper2(&v6, "init");
}

id sub_46B4@<X0>(uint64_t a1@<X1>, void *a2@<X2>, void *a3@<X8>)
{
  id v6 = objc_allocWithZone((Class)AMSAuthenticateTask);
  swift_bridgeObjectRetain();
  id v7 = a2;
  id result = sub_10A04(a1, a2);
  *a3 = result;
  return result;
}

id AMSMediaServiceOwner.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return [v1 init];
}

void AMSMediaServiceOwner.init()()
{
}

id AMSMediaServiceOwner.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_4890()
{
  uint64_t v10 = sub_14670();
  uint64_t v0 = *(void *)(v10 - 8);
  __chkstk_darwin();
  objc_super v2 = (char *)&v9 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_E5EC((void (*)(char *, uint64_t))"supportedServices", 0x11uLL, 2, 0);
  sub_BC94(&qword_1CB20);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_151F0;
  uint64_t v4 = (void *)AIDAServiceTypeStore;
  *(void *)(v3 + 32) = AIDAServiceTypeStore;
  id v5 = v4;
  sub_14630();
  sub_BC94(&qword_1C978);
  sub_145D0();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_15200;
  sub_BC94(&qword_1C980);
  id v6 = (id)AMSSetLogKeyIfNeeded();
  sub_146E0();

  sub_145B0();
  swift_bridgeObjectRelease();
  v18 = &type metadata for String;
  v17[0] = 0xD000000000000011;
  v17[1] = 0x8000000000016590;
  sub_14590();
  sub_11D74((uint64_t)v17, &qword_1C988);
  sub_14580();
  uint64_t v11 = sub_126AC(0, &qword_1C968);
  uint64_t v12 = sub_126AC(0, &qword_1C948);
  uint64_t v13 = sub_126AC(0, &qword_1CB08);
  v14 = &protocol witness table for ACAccountStore;
  unint64_t v15 = sub_1275C();
  v16 = &protocol witness table for AMSAuthenticateTask;
  swift_getKeyPath();
  id v7 = sub_108E8(v3);
  v18 = (void *)sub_BC94(&qword_1CB30);
  v17[0] = v7;
  sub_14590();
  sub_11D74((uint64_t)v17, &qword_1C988);
  sub_14640();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v0 + 8))(v2, v10);
  sub_E3A0((uint64_t)"supportedServices", 0x11uLL, 2);
  return v3;
}

ACAccount_optional __swiftcall AMSMediaServiceOwner.account(forService:)(__C::AIDAServiceType forService)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC20AMSMediaServiceOwner20AMSMediaServiceOwner_serviceOwner;
  uint64_t v4 = *(void **)(v1 + OBJC_IVAR____TtC20AMSMediaServiceOwner20AMSMediaServiceOwner_serviceOwner);
  uint64_t v5 = *(void *)(v1 + OBJC_IVAR____TtC20AMSMediaServiceOwner20AMSMediaServiceOwner_serviceOwner + 8);
  uint64_t v6 = *(void *)(v3 + 16);
  int v7 = *(unsigned __int8 *)(v3 + 24);
  id v8 = v4;
  swift_retain();
  uint64_t v9 = (objc_class *)sub_4C70((uint64_t)forService._rawValue, v8, v5, v6, v7);
  swift_release();

  uint64_t v11 = v9;
  result.value.super.isa = v11;
  result.is_nil = v10;
  return result;
}

void *sub_4C70(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, int a5)
{
  LODWORD(v71) = a5;
  uint64_t v72 = sub_14670();
  uint64_t v70 = *(void *)(v72 - 8);
  uint64_t v8 = ((uint64_t (*)(void))__chkstk_darwin)();
  v65 = (char *)v58 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __chkstk_darwin(v8);
  v59 = (char *)v58 - v11;
  uint64_t v12 = __chkstk_darwin(v10);
  v14 = (char *)v58 - v13;
  __chkstk_darwin(v12);
  v60 = (char *)v58 - v15;
  v77 = a2;
  sub_BC94(&qword_1C940);
  uint64_t inited = swift_initStackObject();
  long long v73 = xmmword_151F0;
  *(_OWORD *)(inited + 16) = xmmword_151F0;
  *(void *)(inited + 32) = 0x5465636976726573;
  *(void *)(inited + 40) = 0xEB00000000657079;
  *(void *)(inited + 72) = &type metadata for String;
  *(void *)(inited + 48) = sub_146E0();
  *(void *)(inited + 56) = v17;
  uint64_t v18 = sub_146A0();
  sub_E5EC((void (*)(char *, uint64_t))"account(forService:)", 0x14uLL, 2, v18);
  swift_bridgeObjectRelease();
  sub_BC94(&qword_1C9D8);
  uint64_t v19 = swift_initStackObject();
  *(_OWORD *)(v19 + 16) = v73;
  v20 = (void *)AMSAccountMediaTypeProduction;
  uint64_t v61 = v19;
  *(void *)(v19 + 32) = AMSAccountMediaTypeProduction;
  *(void *)&long long v73 = v20;
  sub_14630();
  uint64_t v21 = sub_BC94(&qword_1C978);
  uint64_t v22 = *(void *)(sub_145D0() - 8);
  uint64_t v23 = *(unsigned __int8 *)(v22 + 80);
  uint64_t v24 = *(void *)(v22 + 72);
  v58[1] = 3 * v24;
  uint64_t v68 = v21;
  uint64_t v64 = ((v23 + 32) & ~v23) + 3 * v24;
  uint64_t v67 = v23 | 7;
  uint64_t v25 = swift_allocObject();
  long long v63 = xmmword_15210;
  *(_OWORD *)(v25 + 16) = xmmword_15210;
  uint64_t v66 = sub_BC94(&qword_1C980);
  v76 = (void *)v66;
  uint64_t v26 = swift_allocObject();
  unint64_t v74 = v26;
  *(void *)(v26 + 16) = a2;
  *(void *)(v26 + 24) = a3;
  uint64_t v27 = a3;
  *(void *)(v26 + 32) = a4;
  int v69 = v71 & 1;
  *(unsigned char *)(v26 + 40) = v71;
  uint64_t v71 = a4;
  swift_retain();
  id v28 = a2;
  id v29 = (id)AMSLogKey();
  if (v29)
  {
    v30 = v29;
    sub_146E0();
  }
  uint64_t v31 = v70;
  sub_145C0();
  swift_bridgeObjectRelease();
  sub_11D24((uint64_t)&v74);
  sub_14580();
  uint64_t v70 = 2 * v24;
  uint64_t v32 = sub_146E0();
  v76 = &type metadata for String;
  unint64_t v74 = v32;
  unint64_t v75 = v33;
  sub_145A0();
  sub_11D74((uint64_t)&v74, &qword_1C988);
  sub_14640();
  swift_bridgeObjectRelease();
  v34 = *(void (**)(char *, uint64_t))(v31 + 8);
  uint64_t v35 = v72;
  v34(v14, v72);
  sub_126AC(0, &qword_1C968);
  sub_14610();
  v62 = v34;
  v41 = (void *)v74;
  if (v74)
  {
    swift_setDeallocating();
    sub_1129C();
    sub_14630();
    *(_OWORD *)(swift_allocObject() + 16) = xmmword_15200;
    v76 = (void *)v66;
    uint64_t v42 = swift_allocObject();
    unint64_t v74 = v42;
    v43 = v77;
    *(void *)(v42 + 16) = v77;
    *(void *)(v42 + 24) = a3;
    *(void *)(v42 + 32) = v71;
    *(unsigned char *)(v42 + 40) = v69;
    swift_retain();
    id v44 = v43;
    id v45 = (id)AMSLogKey();
    if (v45)
    {
      v46 = v45;
      sub_146E0();
    }
    sub_145C0();
    swift_bridgeObjectRelease();
    sub_11D24((uint64_t)&v74);
    v76 = &type metadata for String;
    unint64_t v74 = 0xD000000000000014;
    unint64_t v75 = 0x8000000000016D30;
    sub_14590();
    sub_11D74((uint64_t)&v74, &qword_1C988);
    sub_14580();
    v76 = (void *)sub_126AC(0, &qword_1C990);
    unint64_t v74 = (unint64_t)v41;
    id v56 = v41;
    sub_14590();
    sub_11D74((uint64_t)&v74, &qword_1C988);
    v50 = v59;
    sub_14640();
  }
  else
  {
    sub_14630();
    *(_OWORD *)(swift_allocObject() + 16) = v63;
    v76 = (void *)v66;
    uint64_t v36 = swift_allocObject();
    unint64_t v74 = v36;
    v37 = v77;
    *(void *)(v36 + 16) = v77;
    *(void *)(v36 + 24) = v27;
    *(void *)(v36 + 32) = v71;
    *(unsigned char *)(v36 + 40) = v69;
    swift_retain();
    id v38 = v37;
    id v39 = (id)AMSLogKey();
    if (v39)
    {
      v40 = v39;
      sub_146E0();
    }
    sub_145C0();
    swift_bridgeObjectRelease();
    sub_11D24((uint64_t)&v74);
    sub_14580();
    type metadata accessor for AMSAccountMediaType(0);
    v76 = v47;
    unint64_t v74 = v73;
    id v48 = (id)v73;
    sub_14590();
    sub_11D74((uint64_t)&v74, &qword_1C988);
    v49 = v65;
    sub_14640();

    swift_bridgeObjectRelease();
    uint64_t v35 = v72;
    v34(v49, v72);
    swift_setDeallocating();
    sub_1129C();
    v50 = v60;
    sub_14630();
    *(_OWORD *)(swift_allocObject() + 16) = v63;
    v76 = (void *)v66;
    uint64_t v51 = swift_allocObject();
    unint64_t v74 = v51;
    v52 = v77;
    *(void *)(v51 + 16) = v77;
    *(void *)(v51 + 24) = v27;
    *(void *)(v51 + 32) = v71;
    *(unsigned char *)(v51 + 40) = v69;
    id v53 = v52;
    swift_retain();
    id v54 = (id)AMSLogKey();
    if (v54)
    {
      v55 = v54;
      sub_146E0();
    }
    sub_145C0();
    swift_bridgeObjectRelease();
    sub_11D24((uint64_t)&v74);
    v76 = &type metadata for String;
    unint64_t v74 = 0xD000000000000014;
    unint64_t v75 = 0x8000000000016D30;
    sub_14590();
    sub_11D74((uint64_t)&v74, &qword_1C988);
    sub_14580();
    sub_14640();
    v41 = 0;
  }
  swift_bridgeObjectRelease();
  v62(v50, v35);
  sub_E3A0((uint64_t)"account(forService:)", 0x14uLL, 2);
  return v41;
}

Swift::String_optional __swiftcall AMSMediaServiceOwner.altDSID(for:service:)(ACAccount a1, __C::AIDAServiceType service)
{
  uint64_t v2 = sub_5CF0((uint64_t)a1.super.isa, (uint64_t)service._rawValue, (void (*)(uint64_t, uint64_t, id, uint64_t, uint64_t, uint64_t))sub_56AC);
  result.value._object = v3;
  result.value._countAndFlagsBits = v2;
  return result;
}

uint64_t sub_56AC(void *a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, int a6)
{
  int v39 = a6;
  uint64_t v38 = a4;
  uint64_t v9 = sub_14670();
  uint64_t v40 = *(void *)(v9 - 8);
  uint64_t v10 = __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v37 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  v14 = (char *)&v37 - v13;
  id v44 = a1;
  sub_BC94(&qword_1C940);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_15220;
  *(void *)(inited + 32) = 0x746E756F636361;
  *(void *)(inited + 40) = 0xE700000000000000;
  uint64_t v16 = sub_126AC(0, &qword_1C990);
  *(void *)(inited + 48) = a1;
  *(void *)(inited + 72) = v16;
  *(void *)(inited + 80) = 0x5465636976726573;
  *(void *)(inited + 88) = 0xEB00000000657079;
  *(void *)(inited + 120) = &type metadata for String;
  *(void *)(inited + 96) = sub_146E0();
  *(void *)(inited + 104) = v17;
  id v18 = a1;
  uint64_t v19 = sub_146A0();
  sub_E5EC((void (*)(char *, uint64_t))"altDSID(for:service:)", 0x15uLL, 2, v19);
  swift_bridgeObjectRelease();
  uint64_t result = sub_14520();
  if (v41)
  {
    uint64_t v37 = v9;

    uint64_t v21 = sub_14540();
    unint64_t v23 = v22;
    if (v22)
    {
      uint64_t v24 = (void *)v21;
      swift_bridgeObjectRetain();
      sub_14630();
      sub_BC94(&qword_1C978);
      sub_145D0();
      *(_OWORD *)(swift_allocObject() + 16) = xmmword_15200;
      v43 = (void *)sub_BC94(&qword_1C980);
      uint64_t v25 = swift_allocObject();
      id v41 = (id)v25;
      uint64_t v26 = v38;
      *(void *)(v25 + 16) = a3;
      *(void *)(v25 + 24) = v26;
      *(void *)(v25 + 32) = a5;
      *(unsigned char *)(v25 + 40) = v39 & 1;
      id v27 = a3;
      swift_retain();
      id v28 = (id)AMSLogKey();
      if (v28)
      {
        id v29 = v28;
        sub_146E0();
      }
      uint64_t v35 = v37;
      sub_145C0();
      swift_bridgeObjectRelease();
      sub_11D24((uint64_t)&v41);
      v43 = &type metadata for String;
      id v41 = (id)0xD000000000000015;
      unint64_t v42 = 0x8000000000016CC0;
      sub_14590();
      sub_11D74((uint64_t)&v41, &qword_1C988);
      sub_14580();
      v43 = &type metadata for String;
      id v41 = v24;
      unint64_t v42 = v23;
      sub_14590();
      sub_11D74((uint64_t)&v41, &qword_1C988);
      sub_14640();
      uint64_t v36 = v40;
    }
    else
    {
      sub_14630();
      sub_BC94(&qword_1C978);
      sub_145D0();
      *(_OWORD *)(swift_allocObject() + 16) = xmmword_15210;
      v43 = (void *)sub_BC94(&qword_1C980);
      uint64_t v30 = swift_allocObject();
      id v41 = (id)v30;
      uint64_t v31 = v38;
      *(void *)(v30 + 16) = a3;
      *(void *)(v30 + 24) = v31;
      *(void *)(v30 + 32) = a5;
      *(unsigned char *)(v30 + 40) = v39 & 1;
      id v32 = a3;
      swift_retain();
      id v33 = (id)AMSLogKey();
      if (v33)
      {
        v34 = v33;
        sub_146E0();
      }
      uint64_t v36 = v40;
      sub_145C0();
      swift_bridgeObjectRelease();
      sub_11D24((uint64_t)&v41);
      v43 = &type metadata for String;
      id v41 = (id)0xD000000000000015;
      unint64_t v42 = 0x8000000000016CC0;
      sub_14590();
      sub_11D74((uint64_t)&v41, &qword_1C988);
      sub_14580();
      sub_14640();
      uint64_t v24 = 0;
      v14 = v12;
      uint64_t v35 = v37;
    }
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v36 + 8))(v14, v35);
    sub_E3A0((uint64_t)"altDSID(for:service:)", 0x15uLL, 2);
    return (uint64_t)v24;
  }
  else
  {
    __break(1u);
  }
  return result;
}

Swift::String_optional __swiftcall AMSMediaServiceOwner.dsid(for:service:)(ACAccount a1, __C::AIDAServiceType service)
{
  uint64_t v2 = sub_5CF0((uint64_t)a1.super.isa, (uint64_t)service._rawValue, (void (*)(uint64_t, uint64_t, id, uint64_t, uint64_t, uint64_t))sub_5D80);
  result.value._object = v3;
  result.value._countAndFlagsBits = v2;
  return result;
}

uint64_t sub_5CF0(uint64_t a1, uint64_t a2, void (*a3)(uint64_t, uint64_t, id, uint64_t, uint64_t, uint64_t))
{
  id v9 = sub_13978(OBJC_IVAR____TtC20AMSMediaServiceOwner20AMSMediaServiceOwner_serviceOwner);
  swift_retain();
  a3(a1, a2, v9, v3, v4, v5);
  swift_release();

  return sub_138D0();
}

uint64_t sub_5D80(void *a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, int a6)
{
  int v37 = a6;
  uint64_t v36 = a4;
  uint64_t v9 = sub_14670();
  uint64_t v38 = *(void *)(v9 - 8);
  uint64_t v10 = __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v35 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  v14 = (char *)&v35 - v13;
  unint64_t v42 = a1;
  sub_BC94(&qword_1C940);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_15220;
  *(void *)(inited + 32) = 0x746E756F636361;
  *(void *)(inited + 40) = 0xE700000000000000;
  uint64_t v16 = sub_126AC(0, &qword_1C990);
  *(void *)(inited + 48) = a1;
  *(void *)(inited + 72) = v16;
  *(void *)(inited + 80) = 0x5465636976726573;
  *(void *)(inited + 88) = 0xEB00000000657079;
  *(void *)(inited + 120) = &type metadata for String;
  *(void *)(inited + 96) = sub_146E0();
  *(void *)(inited + 104) = v17;
  id v18 = a1;
  uint64_t v19 = sub_146A0();
  sub_E5EC((void (*)(char *, uint64_t))"dsid(for:service:)", 0x12uLL, 2, v19);
  swift_bridgeObjectRelease();
  uint64_t result = sub_14520();
  if (v39)
  {
    uint64_t v35 = v9;

    uint64_t v21 = sub_14530();
    if (v22)
    {
      sub_14630();
      sub_BC94(&qword_1C978);
      sub_145D0();
      *(_OWORD *)(swift_allocObject() + 16) = xmmword_15210;
      id v41 = (void *)sub_BC94(&qword_1C980);
      uint64_t v29 = swift_allocObject();
      id v39 = (id)v29;
      uint64_t v30 = v36;
      *(void *)(v29 + 16) = a3;
      *(void *)(v29 + 24) = v30;
      *(void *)(v29 + 32) = a5;
      *(unsigned char *)(v29 + 40) = v37 & 1;
      id v31 = a3;
      swift_retain();
      id v32 = (id)AMSLogKey();
      if (v32)
      {
        id v33 = v32;
        sub_146E0();
      }
      sub_145C0();
      swift_bridgeObjectRelease();
      sub_11D24((uint64_t)&v39);
      id v41 = &type metadata for String;
      id v39 = (id)0xD000000000000012;
      unint64_t v40 = 0x8000000000016C80;
      sub_14590();
      sub_11D74((uint64_t)&v39, &qword_1C988);
      sub_14580();
      sub_14640();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v38 + 8))(v12, v35);
      uint64_t v34 = 0;
    }
    else
    {
      unint64_t v23 = (void *)v21;
      sub_14630();
      sub_BC94(&qword_1C978);
      sub_145D0();
      *(_OWORD *)(swift_allocObject() + 16) = xmmword_15200;
      id v41 = (void *)sub_BC94(&qword_1C980);
      uint64_t v24 = swift_allocObject();
      id v39 = (id)v24;
      uint64_t v25 = v36;
      *(void *)(v24 + 16) = a3;
      *(void *)(v24 + 24) = v25;
      *(void *)(v24 + 32) = a5;
      *(unsigned char *)(v24 + 40) = v37 & 1;
      id v26 = a3;
      swift_retain();
      id v27 = (id)AMSLogKey();
      if (v27)
      {
        id v28 = v27;
        sub_146E0();
      }
      sub_145C0();
      swift_bridgeObjectRelease();
      sub_11D24((uint64_t)&v39);
      id v41 = &type metadata for String;
      id v39 = (id)0xD000000000000012;
      unint64_t v40 = 0x8000000000016C80;
      sub_14590();
      sub_11D74((uint64_t)&v39, &qword_1C988);
      sub_14580();
      id v41 = &type metadata for Int64;
      id v39 = v23;
      sub_14590();
      sub_11D74((uint64_t)&v39, &qword_1C988);
      sub_14640();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v38 + 8))(v14, v35);
      id v39 = v23;
      uint64_t v34 = sub_147C0();
    }
    sub_E3A0((uint64_t)"dsid(for:service:)", 0x12uLL, 2);
    return v34;
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_63E0(void *a1, uint64_t a2, void *a3, void *a4, void (*a5)(id, id))
{
  id v8 = a3;
  id v9 = a1;
  id v10 = a4;
  a5(v8, v10);
  uint64_t v12 = v11;

  if (v12)
  {
    NSString v13 = sub_146B0();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v13 = 0;
  }
  return v13;
}

void AMSMediaServiceOwner.nameComponents(for:service:)(void *a1@<X0>, uint64_t a2@<X8>)
{
  id v7 = sub_13978(OBJC_IVAR____TtC20AMSMediaServiceOwner20AMSMediaServiceOwner_serviceOwner);
  swift_retain();
  sub_6524(a1, v7, v2, v3, v4, a2);
  swift_release();
}

uint64_t sub_6524@<X0>(void *a1@<X0>, void *a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, int a5@<W5>, uint64_t a6@<X8>)
{
  int v50 = a5;
  uint64_t v49 = a3;
  uint64_t v51 = a6;
  uint64_t v9 = sub_14670();
  uint64_t v48 = *(void *)(v9 - 8);
  uint64_t v10 = __chkstk_darwin(v9);
  v47 = (char *)&v46 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  NSString v13 = (char *)&v46 - v12;
  uint64_t v14 = sub_BC94(&qword_1C938);
  __chkstk_darwin(v14 - 8);
  uint64_t v16 = (char *)&v46 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v55 = a1;
  sub_BC94(&qword_1C940);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_15220;
  *(void *)(inited + 32) = 0x746E756F636361;
  *(void *)(inited + 40) = 0xE700000000000000;
  uint64_t v18 = sub_126AC(0, &qword_1C990);
  *(void *)(inited + 48) = a1;
  *(void *)(inited + 72) = v18;
  *(void *)(inited + 80) = 0x5465636976726573;
  *(void *)(inited + 88) = 0xEB00000000657079;
  *(void *)(inited + 120) = &type metadata for String;
  *(void *)(inited + 96) = sub_146E0();
  *(void *)(inited + 104) = v19;
  id v20 = a1;
  uint64_t v21 = sub_146A0();
  sub_E5EC((void (*)(char *, uint64_t))"nameComponents(for:service:)", 0x1CuLL, 2, v21);
  swift_bridgeObjectRelease();
  uint64_t result = sub_14520();
  if (v52)
  {

    sub_14560();
    uint64_t v24 = v23;
    sub_14550();
    uint64_t v26 = v25;
    swift_bridgeObjectRelease();
    if (v24)
    {
      swift_bridgeObjectRelease();
    }
    else if (!v26)
    {
      unint64_t v40 = v47;
      sub_14630();
      sub_BC94(&qword_1C978);
      sub_145D0();
      *(_OWORD *)(swift_allocObject() + 16) = xmmword_15210;
      id v54 = &type metadata for String;
      id v52 = (id)0xD00000000000001CLL;
      unint64_t v53 = 0x8000000000016C20;
      sub_14590();
      sub_11D74((uint64_t)&v52, &qword_1C988);
      id v54 = (void *)sub_BC94(&qword_1C980);
      uint64_t v41 = swift_allocObject();
      id v52 = (id)v41;
      uint64_t v42 = v49;
      *(void *)(v41 + 16) = a2;
      *(void *)(v41 + 24) = v42;
      *(void *)(v41 + 32) = a4;
      *(unsigned char *)(v41 + 40) = v50 & 1;
      id v43 = a2;
      swift_retain();
      id v44 = (id)AMSLogKey();
      if (v44)
      {
        id v45 = v44;
        sub_146E0();
      }
      sub_145C0();
      swift_bridgeObjectRelease();
      sub_11D24((uint64_t)&v52);
      sub_14580();
      sub_14640();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v48 + 8))(v40, v9);
      uint64_t v39 = sub_14500();
      uint64_t v37 = v51;
      uint64_t v38 = 1;
      goto LABEL_8;
    }
    v47 = (char *)v9;
    sub_14560();
    sub_14550();
    uint64_t v27 = sub_14500();
    sub_BCD8((uint64_t)v16, 1, 1, v27);
    sub_144E0();
    sub_14630();
    sub_BC94(&qword_1C978);
    sub_145D0();
    *(_OWORD *)(swift_allocObject() + 16) = xmmword_15200;
    id v54 = (void *)sub_BC94(&qword_1C980);
    uint64_t v28 = swift_allocObject();
    id v52 = (id)v28;
    uint64_t v29 = v49;
    *(void *)(v28 + 16) = a2;
    *(void *)(v28 + 24) = v29;
    *(void *)(v28 + 32) = a4;
    *(unsigned char *)(v28 + 40) = v50 & 1;
    id v30 = a2;
    swift_retain();
    id v31 = (id)AMSLogKey();
    if (v31)
    {
      id v32 = v31;
      sub_146E0();
    }
    id v33 = v47;
    uint64_t v34 = v48;
    sub_145C0();
    swift_bridgeObjectRelease();
    sub_11D24((uint64_t)&v52);
    id v54 = &type metadata for String;
    id v52 = (id)0xD00000000000001CLL;
    unint64_t v53 = 0x8000000000016C20;
    sub_14590();
    sub_11D74((uint64_t)&v52, &qword_1C988);
    sub_14580();
    id v54 = (void *)v27;
    uint64_t v35 = sub_11DCC((uint64_t *)&v52);
    uint64_t v36 = v51;
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v27 - 8) + 16))(v35, v51, v27);
    sub_14590();
    sub_11D74((uint64_t)&v52, &qword_1C988);
    sub_14640();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, char *))(v34 + 8))(v13, v33);
    uint64_t v37 = v36;
    uint64_t v38 = 0;
    uint64_t v39 = v27;
LABEL_8:
    sub_BCD8(v37, v38, 1, v39);
    return sub_E3A0((uint64_t)"nameComponents(for:service:)", 0x1CuLL, 2);
  }
  __break(1u);
  return result;
}

uint64_t AMSMediaServiceOwner.sign(inService:with:)(uint64_t a1, uint64_t a2)
{
  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  return sub_1315C((uint64_t)sub_6E04);
}

uint64_t sub_6E04()
{
  sub_13148();
  sub_12C78();
  uint64_t v1 = (void *)(v0[4] + OBJC_IVAR____TtC20AMSMediaServiceOwner20AMSMediaServiceOwner_serviceOwner);
  v0[5] = *v1;
  sub_1311C((uint64_t)v1);
  swift_retain();
  uint64_t v2 = (void *)swift_task_alloc();
  v0[7] = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_127BC;
  sub_1300C();
  sub_13108();
  return v9(v3, v4, v5, v6, v7, v8, v9, v10);
}

uint64_t sub_6EC0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  *(unsigned char *)(v6 + 916) = a6;
  *(void *)(v6 + 736) = a5;
  *(void *)(v6 + 728) = a4;
  *(void *)(v6 + 720) = a3;
  *(void *)(v6 + 712) = a2;
  *(void *)(v6 + 704) = a1;
  uint64_t v7 = sub_14670();
  *(void *)(v6 + 744) = v7;
  *(void *)(v6 + 752) = *(void *)(v7 - 8);
  *(void *)(v6 + 760) = swift_task_alloc();
  *(void *)(v6 + 768) = swift_task_alloc();
  *(void *)(v6 + 776) = swift_task_alloc();
  *(void *)(v6 + 784) = swift_task_alloc();
  *(void *)(v6 + 792) = swift_task_alloc();
  return _swift_task_switch(sub_6FC8, 0, 0);
}

uint64_t sub_6FC8()
{
  sub_13284();
  uint64_t v1 = *(void **)(v0 + 712);
  id v2 = (id)AMSSetLogKeyIfNeeded();
  sub_146E0();
  uint64_t v4 = v3;

  *(void *)(v0 + 800) = v4;
  sub_BC94(&qword_1C940);
  uint64_t inited = (__n128 *)swift_initStackObject();
  sub_12E78(inited, (__n128)xmmword_15220)[4].n128_u64[1] = (unint64_t)&type metadata for String;
  inited[3].n128_u64[0] = sub_146E0();
  inited[3].n128_u64[1] = v6;
  sub_133DC();
  inited[5].n128_u64[0] = v7;
  inited[5].n128_u64[1] = v8;
  inited[7].n128_u64[1] = sub_126AC(0, &qword_1C948);
  inited[6].n128_u64[0] = (unint64_t)v1;
  id v9 = v1;
  uint64_t v10 = sub_146A0();
  sub_E5EC((void (*)(char *, uint64_t))"sign(inService:with:)", 0x15uLL, 2, v10);
  swift_bridgeObjectRelease();
  uint64_t v11 = sub_119C0(v9);
  *(void *)(v0 + 808) = v11;
  if (!v11)
  {
    char v17 = *(unsigned char *)(v0 + 916);
    uint64_t v18 = *(void *)(v0 + 736);
    long long v69 = *(_OWORD *)(v0 + 720);
    swift_bridgeObjectRelease();
    sub_14630();
    sub_BC94(&qword_1C978);
    uint64_t v19 = sub_13998();
    sub_127E8(v19);
    *(_OWORD *)(sub_13354() + 16) = xmmword_15210;
    *(void *)(v0 + 368) = sub_BC94(&qword_1C980);
    uint64_t v20 = sub_12810();
    *(void *)(v0 + 344) = v20;
    *(_OWORD *)(v20 + 16) = v69;
    *(void *)(v20 + 32) = v18;
    *(unsigned char *)(v20 + 40) = v17;
    id v21 = (id)v69;
    swift_retain();
    id v22 = (id)AMSLogKey();
    if (v22)
    {
      uint64_t v23 = v22;
      sub_146E0();
    }
    else
    {
      sub_12EEC();
    }
    sub_12EBC();
    swift_bridgeObjectRelease();
    sub_11D24(v0 + 344);
    *(void *)(v0 + 208) = &type metadata for String;
    *(void *)(v0 + 184) = 0xD000000000000015;
    *(void *)(v0 + 192) = 0x80000000000166B0;
    sub_14590();
    sub_11D74(v0 + 184, &qword_1C988);
    sub_1295C();
    sub_14650();
    swift_bridgeObjectRelease();
    sub_13168();
    v62();
    NSString v63 = sub_12944();
    NSString v64 = sub_12944();
    id v65 = (id)sub_13178();

    swift_willThrow();
    sub_12ED4();
    sub_12E34((uint64_t)"sign(inService:with:)");
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v66 = sub_129C0();
    return v67(v66);
  }
  uint64_t v12 = v11;
  uint64_t v13 = sub_11A34(*(void **)(v0 + 712));
  if (v13)
  {
    uint64_t v14 = v13;
    id v15 = AIDAServiceTypeStore;
    sub_DFF4((uint64_t)v15, v14, (_OWORD *)(v0 + 216));
    swift_bridgeObjectRelease();

    if (*(void *)(v0 + 240))
    {
      sub_126AC(0, &qword_1CA38);
      sub_138D0();
      if (swift_dynamicCast()) {
        uint64_t v16 = *(void **)(v0 + 696);
      }
      else {
        uint64_t v16 = 0;
      }
      goto LABEL_11;
    }
  }
  else
  {
    *(_OWORD *)(v0 + 216) = 0u;
    *(_OWORD *)(v0 + 232) = 0u;
  }
  sub_11D74(v0 + 216, &qword_1C988);
  uint64_t v16 = 0;
LABEL_11:
  char v24 = *(unsigned char *)(v0 + 916);
  uint64_t v25 = *(void *)(v0 + 736);
  long long v68 = *(_OWORD *)(v0 + 720);
  sub_14630();
  *(void *)(v0 + 816) = sub_BC94(&qword_1C978);
  uint64_t v26 = sub_145D0();
  sub_127E8(v26);
  *(void *)(v0 + 824) = *(void *)(v27 + 72);
  *(_DWORD *)(v0 + 912) = *(_DWORD *)(v28 + 80);
  *(_OWORD *)(sub_13354() + 16) = xmmword_15200;
  uint64_t v29 = sub_BC94(&qword_1C980);
  *(void *)(v0 + 832) = v29;
  *(void *)(v0 + 272) = v29;
  uint64_t v30 = sub_12810();
  *(void *)(v0 + 248) = v30;
  *(_OWORD *)(v30 + 16) = v68;
  *(void *)(v30 + 32) = v25;
  *(unsigned char *)(v30 + 40) = v24;
  id v31 = (id)v68;
  swift_retain();
  id v32 = (id)AMSLogKey();
  if (v32)
  {
    id v33 = v32;
    sub_146E0();
  }
  sub_145C0();
  swift_bridgeObjectRelease();
  sub_11D24(v0 + 248);
  *(void *)(v0 + 304) = &type metadata for String;
  *(void *)(v0 + 280) = 0xD000000000000015;
  *(void *)(v0 + 288) = 0x80000000000166B0;
  sub_14590();
  sub_11D74(v0 + 280, &qword_1C988);
  sub_14580();
  if (v16)
  {
    *(void *)(v0 + 336) = sub_126AC(0, &qword_1CA38);
    *(void *)(v0 + 312) = v16;
    uint64_t v34 = v16;
  }
  else
  {
    uint64_t v34 = 0;
    *(_OWORD *)(v0 + 312) = 0u;
    *(_OWORD *)(v0 + 328) = 0u;
  }
  *(void *)(v0 + 840) = v34;
  uint64_t v35 = *(void *)(v0 + 752);
  id v36 = v34;
  sub_14590();
  sub_11D74(v0 + 312, &qword_1C988);
  sub_14660();
  swift_bridgeObjectRelease();
  *(void *)(v0 + 848) = *(void *)(v35 + 8);
  *(void *)(v0 + 856) = (v35 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  sub_13168();
  v37();
  sub_BC94(&qword_1C9D8);
  uint64_t v38 = swift_initStackObject();
  *(void *)(v0 + 864) = v38;
  *(_OWORD *)(v38 + 16) = xmmword_151F0;
  uint64_t v39 = (void *)AMSAccountMediaTypeProduction;
  *(void *)(v0 + 872) = AMSAccountMediaTypeProduction;
  *(void *)(v38 + 32) = v39;
  id v40 = v39;
  uint64_t v41 = v40;
  if (v16)
  {
    id v42 = v36;
    id v43 = v41;
    if ([v42 skipAuthentication])
    {
      id v44 = (void *)swift_task_alloc();
      *(void *)(v0 + 880) = v44;
      *id v44 = v0;
      v44[1] = sub_77F4;
      char v45 = *(unsigned char *)(v0 + 916);
      uint64_t v46 = *(void *)(v0 + 736);
      uint64_t v47 = *(void *)(v0 + 728);
      uint64_t v48 = *(void *)(v0 + 720);
      uint64_t v49 = *(void *)(v0 + 712);
      return sub_F508(v12, (uint64_t)v43, v49, (uint64_t)v42, v48, v47, v46, v45);
    }
  }
  else
  {
    id v51 = v40;
  }
  id v52 = (void *)swift_task_alloc();
  *(void *)(v0 + 896) = v52;
  void *v52 = v0;
  v52[1] = sub_84E8;
  sub_12828();
  return sub_C174(v53, v54, v55, v56, v57, v58, v59, v60);
}

uint64_t sub_77F4()
{
  sub_12864();
  uint64_t v3 = v2;
  sub_127D0();
  sub_12844();
  *uint64_t v5 = v4;
  uint64_t v6 = *v1;
  sub_12800();
  *unint64_t v7 = v6;
  *(void *)(v8 + 888) = v0;
  swift_task_dealloc();
  if (!v0) {

  }
  sub_12B88();
  return _swift_task_switch(v9, v10, v11);
}

uint64_t sub_78D8()
{
  unint64_t v7 = *(void **)(v1 + 872);

  sub_13640();
  sub_1129C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v8 = _swiftEmptyArrayStorage[2];
  if (v8 == 1)
  {
    sub_12AA4();
    *(_OWORD *)(swift_allocObject() + 16) = xmmword_15200;
    *(void *)(v1 + 560) = v4;
    uint64_t v18 = sub_12810();
    sub_1336C(v18, v19, v20, v21, v22, v23, v24, v25, v66, v69, v73, *((uint64_t *)&v73 + 1), v76, v78, v79, v80, v81, *((uint64_t *)&v81 + 1), v82);
    swift_retain();
    id v26 = (id)AMSLogKey();
    if (v26)
    {
      uint64_t v27 = v26;
      sub_146E0();
      uint64_t v3 = v28;
    }
    else
    {
      sub_13938();
    }
    sub_134E4();
    swift_bridgeObjectRelease();
    sub_11D24((uint64_t)v2);
    sub_13824();
    sub_13898();
    sub_11D74((uint64_t)v0, &qword_1C988);
    uint64_t result = sub_1295C();
    if (_swiftEmptyArrayStorage[2])
    {
      sub_12D14();
      sub_13770();
      sub_129D4();
      sub_12A70();
      v54();
      sub_14590();
      sub_11D74((uint64_t)v0, &qword_1C988);
      sub_14650();
      swift_bridgeObjectRelease();
      uint64_t result = v5(v2, v3);
      if (_swiftEmptyArrayStorage[2])
      {
        uint64_t v6 = *(void **)(v1 + 840);
        swift_errorRetain();
        goto LABEL_16;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    return result;
  }
  if (!v8)
  {
    sub_12A20();
    *(_OWORD *)(swift_allocObject() + 16) = xmmword_15210;
    *(void *)(v1 + 528) = 0xD000000000000015;
    uint64_t v9 = sub_12810();
    sub_1325C(v9, v10, v11, v12, v13, v14, v15, v16, v66, v69, v73, *((uint64_t *)&v73 + 1), v76, v78, v79, v80, v81);
    swift_retain();
    id v17 = (id)AMSLogKey();
    if (v17)
    {
      id v2 = v17;
      sub_146E0();
    }
    sub_12870();
    swift_bridgeObjectRelease();
    sub_11D24(v4);
    *(void *)(v1 + 496) = &type metadata for String;
    sub_132D0();
    sub_11D74((uint64_t)v2, &qword_1C988);
    sub_1295C();
    sub_14660();
    swift_bridgeObjectRelease();

    uint64_t v49 = sub_1375C();
    v50(v49);
    swift_bridgeObjectRelease();
    sub_12E34((uint64_t)"sign(inService:with:)");
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v51 = sub_12850();
    goto LABEL_17;
  }
  sub_128E0();
  uint64_t v29 = sub_12944();
  NSString v30 = sub_12944();
  swift_bridgeObjectRetain();
  sub_BC94(&qword_1C970);
  v31.super.isa = sub_13314().super.isa;
  swift_bridgeObjectRelease();
  (id)sub_136F0();

  sub_14630();
  id v32 = (__n128 *)swift_allocObject();
  sub_13680(v32, (__n128)xmmword_15200, v33, v34, v35, v36, v37, v38, v39, v66, v69);
  uint64_t v40 = sub_12810();
  sub_131FC(v40, v41, v42, v43, v44, v45, v46, v47, v67, v71, v73, v76);
  swift_retain();
  id v48 = (id)AMSLogKey();
  if (v48)
  {
    uint64_t v0 = v48;
    uint64_t v29 = (void *)sub_146E0();
  }
  else
  {
    sub_12EEC();
  }
  sub_12B3C();
  swift_bridgeObjectRelease();
  sub_11D24((uint64_t)v31.super.isa);
  *(void *)(v1 + 432) = &type metadata for String;
  sub_131D0();
  sub_11D74((uint64_t)v29, &qword_1C988);
  sub_1295C();
  uint64_t ErrorValue = swift_getErrorValue();
  sub_13440(ErrorValue, v56, v57, v58, v59, v60, v61, v62, v68, v72, v74, v75, v77, v78, v79, v80, v81, *((uint64_t *)&v81 + 1), (uint64_t *)v82);
  sub_129D4();
  sub_12A70();
  v63();
  sub_14590();
  sub_11D74((uint64_t)v0, &qword_1C988);
  sub_14650();
  swift_bridgeObjectRelease();
  uint64_t v64 = sub_1361C();
  v65(v64);
LABEL_16:
  swift_willThrow();

  swift_bridgeObjectRelease();
  sub_13428();
  sub_12E34((uint64_t)"sign(inService:with:)");
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v51 = sub_136DC();
LABEL_17:
  return v52(v51);
}

uint64_t sub_7E20()
{
  swift_errorRetain();
  uint64_t v4 = _swiftEmptyArrayStorage;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v4 = sub_12C3C();
  }
  unint64_t v6 = v4[2];
  unint64_t v5 = v4[3];
  if (v6 >= v5 >> 1) {
    uint64_t v4 = sub_13060((void *)(v5 > 1), v6 + 1);
  }
  uint64_t v7 = *(void *)(v0 + 888);
  uint64_t v8 = *(void **)(v0 + 872);
  uint64_t v9 = *(void **)(v0 + 840);
  v4[2] = v6 + 1;
  v4[v6 + 4] = v7;

  swift_errorRelease();
  sub_13660();
  sub_1129C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v10 = v4[2];
  if (!v10)
  {
    sub_12AF0();
    *(_OWORD *)(swift_allocObject() + 16) = xmmword_15210;
    *(void *)(v0 + 528) = v1;
    uint64_t v15 = sub_12810();
    sub_13234(v15, v16, v17, v18, v19, v20, v21, v22, v56, v59, v62, v65, v66, v67, v71, v74, v76, v78, v79, v81, v82);
    swift_retain();
    if ((id)AMSLogKey())
    {
      sub_146E0();
      sub_13290();
    }
    else
    {
      sub_12EEC();
    }
    long long v73 = *(void (**)(uint64_t, uint64_t))(v0 + 848);
    uint64_t v69 = *(void **)(v0 + 840);
    sub_13950();
    uint64_t v44 = *(void *)(v0 + 776);
    uint64_t v63 = *(void *)(v0 + 744);
    sub_12EBC();
    swift_bridgeObjectRelease();
    sub_11D24(v3);
    *(void *)(v0 + 496) = &type metadata for String;
    sub_1332C();
    sub_11D74(v0 + 472, &qword_1C988);
    sub_1295C();
    sub_14660();
    swift_bridgeObjectRelease();

    v73(v44, v63);
    swift_bridgeObjectRelease();
    sub_12E34((uint64_t)"sign(inService:with:)");
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v45 = sub_12850();
    goto LABEL_22;
  }
  if (v10 != 1)
  {
    uint64_t v75 = v0 + 376;
    uint64_t v77 = v0 + 408;
    sub_13964();
    char v68 = *(unsigned char *)(v0 + 916);
    sub_12FD0();
    NSString v23 = sub_12944();
    NSString v24 = sub_12944();
    swift_bridgeObjectRetain();
    sub_BC94(&qword_1C970);
    v25.super.isa = sub_13314().super.isa;
    swift_bridgeObjectRelease();
    (id)sub_13710();

    sub_14630();
    uint64_t v26 = swift_allocObject();
    *(_OWORD *)(v26 + 16) = xmmword_15200;
    uint64_t v72 = v26;
    *(void *)(v0 + 400) = v59;
    uint64_t v27 = (__n128 *)sub_12810();
    uint64_t v36 = (void *)sub_13924(v27, v28, v29, v30, v31, v32, v33, v34, v56, v59, v35).n128_u64[0];
    *(unsigned char *)(v37 + 40) = v68;
    id v38 = v36;
    swift_retain();
    id v39 = (id)AMSLogKey();
    if (v39)
    {
      uint64_t v40 = v39;
      sub_146E0();
    }
    else
    {
      sub_129F8();
    }
    uint64_t v70 = *(void *)(v0 + 856);
    sub_12F84();
    sub_129E0();
    swift_bridgeObjectRelease();
    sub_11D24(v75);
    *(void *)(v0 + 432) = &type metadata for String;
    sub_135A0();
    sub_14590();
    sub_11D74(v77, &qword_1C988);
    sub_1295C();
    uint64_t ErrorValue = swift_getErrorValue();
    sub_135E8(ErrorValue, v48, v49, v50, v51, v52, v53, v54, v57, v60, v62, v65, v66, v70, v72, v75, v77, v0 + 688, v0 + 632,
      v81,
      (uint64_t *)(v0 + 440));
    sub_129D4();
    sub_12A70();
    v55();
    sub_14590();
    sub_11D74((uint64_t)v24, &qword_1C988);
    sub_14650();
    swift_bridgeObjectRelease();
    v64(v58, v61);
    goto LABEL_21;
  }
  sub_133F4();
  char v11 = *(unsigned char *)(v0 + 916);
  uint64_t v12 = *(void *)(v0 + 736);
  long long v80 = *(_OWORD *)(v0 + 720);
  sub_14630();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_15200;
  *(void *)(v0 + 560) = v2;
  uint64_t v13 = sub_12810();
  *(void *)(v0 + 536) = v13;
  *(_OWORD *)(v13 + 16) = v80;
  *(void *)(v13 + 32) = v12;
  *(unsigned char *)(v13 + 40) = v11;
  id v14 = (id)v80;
  swift_retain();
  if ((id)AMSLogKey())
  {
    sub_146E0();
    sub_12FF4();
  }
  else
  {
    sub_129F8();
  }
  sub_129E0();
  swift_bridgeObjectRelease();
  sub_11D24(v0 + 536);
  *(void *)(v0 + 592) = &type metadata for String;
  *(void *)(v0 + 568) = 0xD000000000000015;
  sub_1357C();
  sub_11D74(v12, &qword_1C988);
  uint64_t result = sub_1295C();
  if (!v4[2])
  {
    __break(1u);
    goto LABEL_26;
  }
  uint64_t v42 = *(uint64_t (**)(unint64_t, uint64_t))(v0 + 848);
  sub_132A8();
  sub_139B0();
  sub_129D4();
  sub_12A70();
  v43();
  sub_14590();
  sub_11D74(v0 + 600, &qword_1C988);
  sub_138F4();
  swift_bridgeObjectRelease();
  uint64_t result = v42(0xD000000000000015, v12);
  if (!v4[2])
  {
LABEL_26:
    __break(1u);
    return result;
  }
  v25.super.isa = *(Class *)(v0 + 840);
  swift_errorRetain();
LABEL_21:
  swift_willThrow();

  swift_bridgeObjectRelease();
  sub_12ED4();
  sub_12E34((uint64_t)"sign(inService:with:)");
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v45 = sub_129C0();
LABEL_22:
  return v46(v45);
}

uint64_t sub_84E8()
{
  sub_12864();
  sub_127D0();
  sub_12844();
  *uint64_t v3 = v2;
  uint64_t v4 = *v1;
  sub_12800();
  *unint64_t v5 = v4;
  *(void *)(v6 + 904) = v0;
  swift_task_dealloc();
  sub_12B88();
  return _swift_task_switch(v7, v8, v9);
}

uint64_t sub_85C4()
{
  sub_13640();
  sub_1129C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v7 = _swiftEmptyArrayStorage[2];
  if (v7 == 1)
  {
    sub_12AA4();
    *(_OWORD *)(swift_allocObject() + 16) = xmmword_15200;
    *(void *)(v1 + 560) = v4;
    uint64_t v17 = sub_12810();
    sub_1336C(v17, v18, v19, v20, v21, v22, v23, v24, v65, v68, v72, *((uint64_t *)&v72 + 1), v75, v77, v78, v79, v80, *((uint64_t *)&v80 + 1), v81);
    swift_retain();
    id v25 = (id)AMSLogKey();
    if (v25)
    {
      uint64_t v26 = v25;
      sub_146E0();
      uint64_t v3 = v27;
    }
    else
    {
      sub_13938();
    }
    sub_134E4();
    swift_bridgeObjectRelease();
    sub_11D24((uint64_t)v2);
    sub_13824();
    sub_13898();
    sub_11D74((uint64_t)v0, &qword_1C988);
    uint64_t result = sub_1295C();
    if (_swiftEmptyArrayStorage[2])
    {
      sub_12D14();
      sub_13770();
      sub_129D4();
      sub_12A70();
      v53();
      sub_14590();
      sub_11D74((uint64_t)v0, &qword_1C988);
      sub_14650();
      swift_bridgeObjectRelease();
      uint64_t result = v5(v2, v3);
      if (_swiftEmptyArrayStorage[2])
      {
        uint64_t v6 = *(void **)(v1 + 840);
        swift_errorRetain();
        goto LABEL_16;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    return result;
  }
  if (!v7)
  {
    sub_12A20();
    *(_OWORD *)(swift_allocObject() + 16) = xmmword_15210;
    *(void *)(v1 + 528) = 0xD000000000000015;
    uint64_t v8 = sub_12810();
    sub_1325C(v8, v9, v10, v11, v12, v13, v14, v15, v65, v68, v72, *((uint64_t *)&v72 + 1), v75, v77, v78, v79, v80);
    swift_retain();
    id v16 = (id)AMSLogKey();
    if (v16)
    {
      uint64_t v2 = v16;
      sub_146E0();
    }
    sub_12870();
    swift_bridgeObjectRelease();
    sub_11D24(v4);
    *(void *)(v1 + 496) = &type metadata for String;
    sub_132D0();
    sub_11D74((uint64_t)v2, &qword_1C988);
    sub_1295C();
    sub_14660();
    swift_bridgeObjectRelease();

    uint64_t v48 = sub_1375C();
    v49(v48);
    swift_bridgeObjectRelease();
    sub_12E34((uint64_t)"sign(inService:with:)");
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v50 = sub_12850();
    goto LABEL_17;
  }
  sub_128E0();
  uint64_t v28 = sub_12944();
  NSString v29 = sub_12944();
  swift_bridgeObjectRetain();
  sub_BC94(&qword_1C970);
  v30.super.isa = sub_13314().super.isa;
  swift_bridgeObjectRelease();
  (id)sub_136F0();

  sub_14630();
  uint64_t v31 = (__n128 *)swift_allocObject();
  sub_13680(v31, (__n128)xmmword_15200, v32, v33, v34, v35, v36, v37, v38, v65, v68);
  uint64_t v39 = sub_12810();
  sub_131FC(v39, v40, v41, v42, v43, v44, v45, v46, v66, v70, v72, v75);
  swift_retain();
  id v47 = (id)AMSLogKey();
  if (v47)
  {
    uint64_t v0 = v47;
    uint64_t v28 = (void *)sub_146E0();
  }
  else
  {
    sub_12EEC();
  }
  sub_12B3C();
  swift_bridgeObjectRelease();
  sub_11D24((uint64_t)v30.super.isa);
  *(void *)(v1 + 432) = &type metadata for String;
  sub_131D0();
  sub_11D74((uint64_t)v28, &qword_1C988);
  sub_1295C();
  uint64_t ErrorValue = swift_getErrorValue();
  sub_13440(ErrorValue, v55, v56, v57, v58, v59, v60, v61, v67, v71, v73, v74, v76, v77, v78, v79, v80, *((uint64_t *)&v80 + 1), (uint64_t *)v81);
  sub_129D4();
  sub_12A70();
  v62();
  sub_14590();
  sub_11D74((uint64_t)v0, &qword_1C988);
  sub_14650();
  swift_bridgeObjectRelease();
  uint64_t v63 = sub_1361C();
  v64(v63);
LABEL_16:
  swift_willThrow();

  swift_bridgeObjectRelease();
  sub_13428();
  sub_12E34((uint64_t)"sign(inService:with:)");
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v50 = sub_136DC();
LABEL_17:
  return v51(v50);
}

uint64_t sub_8B04()
{
  swift_errorRetain();
  uint64_t v3 = _swiftEmptyArrayStorage;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v3 = sub_12C3C();
  }
  unint64_t v5 = v3[2];
  unint64_t v4 = v3[3];
  if (v5 >= v4 >> 1) {
    uint64_t v3 = sub_13060((void *)(v4 > 1), v5 + 1);
  }
  uint64_t v6 = *(void *)(v0 + 904);
  uint64_t v7 = *(void **)(v0 + 872);
  v3[2] = v5 + 1;
  v3[v5 + 4] = v6;

  swift_errorRelease();
  sub_13660();
  sub_1129C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v8 = v3[2];
  if (!v8)
  {
    sub_12AF0();
    *(_OWORD *)(swift_allocObject() + 16) = xmmword_15210;
    *(void *)(v0 + 528) = v1;
    uint64_t v13 = sub_12810();
    sub_13234(v13, v14, v15, v16, v17, v18, v19, v20, v55, v57, v59, v61, v62, v66, v69, v71, v73, v75, v76, v77, v79);
    swift_retain();
    if ((id)AMSLogKey())
    {
      sub_146E0();
      sub_13290();
    }
    else
    {
      sub_12EEC();
    }
    uint64_t v68 = *(void (**)(uint64_t, uint64_t))(v0 + 848);
    uint64_t v64 = *(void **)(v0 + 840);
    sub_13950();
    uint64_t v41 = *(void *)(v0 + 776);
    uint64_t v60 = *(void *)(v0 + 744);
    sub_12EBC();
    swift_bridgeObjectRelease();
    sub_11D24((uint64_t)(v3 + 4));
    *(void *)(v0 + 496) = &type metadata for String;
    sub_1332C();
    sub_11D74(v0 + 472, &qword_1C988);
    sub_1295C();
    sub_14660();
    swift_bridgeObjectRelease();

    v68(v41, v60);
    swift_bridgeObjectRelease();
    sub_12E34((uint64_t)"sign(inService:with:)");
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v42 = sub_12850();
    goto LABEL_22;
  }
  if (v8 != 1)
  {
    uint64_t v70 = v0 + 376;
    uint64_t v72 = v0 + 408;
    sub_13964();
    char v63 = *(unsigned char *)(v0 + 916);
    sub_12FD0();
    NSString v21 = sub_12944();
    NSString v22 = sub_12944();
    swift_bridgeObjectRetain();
    sub_BC94(&qword_1C970);
    v23.super.isa = sub_13314().super.isa;
    swift_bridgeObjectRelease();
    (id)sub_13710();

    sub_14630();
    uint64_t v24 = swift_allocObject();
    *(_OWORD *)(v24 + 16) = xmmword_15200;
    uint64_t v67 = v24;
    *(void *)(v0 + 400) = v57;
    id v25 = (__n128 *)sub_12810();
    uint64_t v34 = (void *)sub_13924(v25, v26, v27, v28, v29, v30, v31, v32, v55, v57, v33).n128_u64[0];
    *(unsigned char *)(v35 + 40) = v63;
    id v36 = v34;
    swift_retain();
    id v37 = (id)AMSLogKey();
    if (v37)
    {
      uint64_t v38 = v37;
      sub_146E0();
    }
    else
    {
      sub_129F8();
    }
    uint64_t v65 = *(void *)(v0 + 856);
    sub_12F84();
    sub_129E0();
    swift_bridgeObjectRelease();
    sub_11D24(v70);
    *(void *)(v0 + 432) = &type metadata for String;
    sub_135A0();
    sub_14590();
    sub_11D74(v72, &qword_1C988);
    sub_1295C();
    uint64_t ErrorValue = swift_getErrorValue();
    sub_135E8(ErrorValue, v45, v46, v47, v48, v49, v50, v51, v56, v58, v59, v61, v65, v67, v70, v72, v0 + 688, v75, v76,
      v0 + 632,
      (uint64_t *)(v0 + 440));
    sub_129D4();
    sub_12A70();
    v52();
    sub_14590();
    sub_11D74((uint64_t)v22, &qword_1C988);
    sub_14650();
    swift_bridgeObjectRelease();
    uint64_t v53 = sub_1361C();
    v54(v53);
    goto LABEL_21;
  }
  sub_133F4();
  char v9 = *(unsigned char *)(v0 + 916);
  uint64_t v10 = *(void *)(v0 + 736);
  long long v74 = *(_OWORD *)(v0 + 720);
  sub_14630();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_15200;
  *(void *)(v0 + 560) = v2;
  uint64_t v11 = sub_12810();
  *(void *)(v0 + 536) = v11;
  *(_OWORD *)(v11 + 16) = v74;
  *(void *)(v11 + 32) = v10;
  *(unsigned char *)(v11 + 40) = v9;
  id v12 = (id)v74;
  swift_retain();
  if ((id)AMSLogKey())
  {
    sub_146E0();
    sub_12FF4();
  }
  else
  {
    sub_129F8();
  }
  sub_129E0();
  swift_bridgeObjectRelease();
  sub_11D24(v0 + 536);
  *(void *)(v0 + 592) = &type metadata for String;
  *(void *)(v0 + 568) = 0xD000000000000015;
  sub_1357C();
  sub_11D74(v10, &qword_1C988);
  uint64_t result = sub_1295C();
  if (!v3[2])
  {
    __break(1u);
    goto LABEL_26;
  }
  uint64_t v78 = *(uint64_t (**)(unint64_t, uint64_t))(v0 + 848);
  sub_132A8();
  sub_139B0();
  sub_129D4();
  sub_12A70();
  v40();
  sub_14590();
  sub_11D74(v0 + 600, &qword_1C988);
  sub_138F4();
  swift_bridgeObjectRelease();
  uint64_t result = v78(0xD000000000000015, v10);
  if (!v3[2])
  {
LABEL_26:
    __break(1u);
    return result;
  }
  v23.super.isa = *(Class *)(v0 + 840);
  swift_errorRetain();
LABEL_21:
  swift_willThrow();

  swift_bridgeObjectRelease();
  sub_12ED4();
  sub_12E34((uint64_t)"sign(inService:with:)");
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v42 = sub_129C0();
LABEL_22:
  return v43(v42);
}

uint64_t sub_91D8(void *a1, void *a2, void *aBlock, void *a4)
{
  v4[3] = a2;
  v4[4] = a4;
  v4[2] = a1;
  v4[5] = _Block_copy(aBlock);
  id v8 = a1;
  id v9 = a2;
  a4;
  uint64_t v10 = (void *)swift_task_alloc();
  v4[6] = v10;
  *uint64_t v10 = v4;
  v10[1] = sub_127C8;
  return AMSMediaServiceOwner.sign(inService:with:)((uint64_t)v8, (uint64_t)v9);
}

uint64_t sub_92B0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_BC94(&qword_1C8F0);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_14770();
  sub_BCD8((uint64_t)v6, 1, 1, v7);
  id v8 = (void *)swift_allocObject();
  v8[2] = 0;
  v8[3] = 0;
  v8[4] = a1;
  v8[5] = a2;
  id v9 = (void *)swift_allocObject();
  v9[2] = 0;
  v9[3] = 0;
  v9[4] = &unk_1C900;
  v9[5] = v8;
  sub_10DB4((uint64_t)v6, (uint64_t)&unk_1C910, (uint64_t)v9);
  return swift_release();
}

uint64_t AMSMediaServiceOwner.signOutService(_:with:)(uint64_t a1, uint64_t a2)
{
  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  return sub_1315C((uint64_t)sub_93D0);
}

uint64_t sub_93D0()
{
  sub_13148();
  sub_12C78();
  uint64_t v1 = (void *)(v0[4] + OBJC_IVAR____TtC20AMSMediaServiceOwner20AMSMediaServiceOwner_serviceOwner);
  v0[5] = *v1;
  sub_1311C((uint64_t)v1);
  swift_retain();
  uint64_t v2 = (void *)swift_task_alloc();
  v0[7] = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_948C;
  sub_1300C();
  sub_13108();
  return v9(v3, v4, v5, v6, v7, v8, v9, v10);
}

uint64_t sub_948C()
{
  sub_12F10();
  char v3 = v2;
  sub_127D0();
  uint64_t v5 = *(void **)(v4 + 40);
  uint64_t v6 = *v1;
  sub_12800();
  *uint64_t v7 = v6;
  swift_task_dealloc();

  swift_release();
  uint64_t v8 = *(uint64_t (**)(uint64_t))(v6 + 8);
  if (v0) {
    uint64_t v9 = 0;
  }
  else {
    uint64_t v9 = v3 & 1;
  }
  return v8(v9);
}

uint64_t sub_95A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  *(unsigned char *)(v6 + 736) = a6;
  *(void *)(v6 + 584) = a5;
  *(void *)(v6 + 576) = a4;
  *(void *)(v6 + 568) = a3;
  *(void *)(v6 + 560) = a2;
  *(void *)(v6 + 552) = a1;
  uint64_t v8 = sub_14670();
  *(void *)(v6 + 592) = v8;
  *(void *)(v6 + 600) = *(void *)(v8 - 8);
  *(void *)(v6 + 608) = swift_task_alloc();
  *(void *)(v6 + 616) = swift_task_alloc();
  *(void *)(v6 + 624) = swift_task_alloc();
  *(void *)(v6 + 632) = swift_task_alloc();
  *(void *)(v6 + 544) = a3;
  return _swift_task_switch(sub_96A4, 0, 0);
}

uint64_t sub_96A4()
{
  sub_13790();
  char v1 = *(unsigned char *)(v0 + 736);
  uint64_t v2 = *(void *)(v0 + 584);
  char v3 = *(void **)(v0 + 560);
  sub_BC94(&qword_1C940);
  long long v14 = *(_OWORD *)(v0 + 568);
  uint64_t inited = (__n128 *)swift_initStackObject();
  sub_12E78(inited, (__n128)xmmword_15220)[4].n128_u64[1] = (unint64_t)&type metadata for String;
  inited[3].n128_u64[0] = sub_146E0();
  inited[3].n128_u64[1] = v5;
  sub_133DC();
  inited[5].n128_u64[0] = v6;
  inited[5].n128_u64[1] = v7;
  inited[7].n128_u64[1] = sub_126AC(0, &qword_1C948);
  inited[6].n128_u64[0] = (unint64_t)v3;
  id v8 = v3;
  uint64_t v9 = sub_146A0();
  sub_E5EC((void (*)(char *, uint64_t))"signOutService(_:with:)", 0x17uLL, 2, v9);
  swift_bridgeObjectRelease();
  uint64_t v10 = sub_12810();
  *(void *)(v0 + 640) = v10;
  *(_OWORD *)(v10 + 16) = v14;
  *(void *)(v10 + 32) = v2;
  *(unsigned char *)(v10 + 40) = v1;
  id v11 = (id)v14;
  swift_retain();
  uint64_t v12 = (void *)swift_task_alloc();
  *(void *)(v0 + 648) = v12;
  *uint64_t v12 = v0;
  v12[1] = sub_9864;
  return sub_BF40(2, (uint64_t)&unk_1C958, v10);
}

uint64_t sub_9864()
{
  sub_12864();
  sub_127D0();
  sub_12844();
  *uint64_t v2 = v1;
  uint64_t v3 = *v0;
  sub_12800();
  *uint64_t v4 = v3;
  *(void *)(v6 + 656) = v5;
  swift_task_dealloc();
  swift_release();
  sub_12B88();
  return _swift_task_switch(v7, v8, v9);
}

uint64_t sub_994C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  sub_13498();
  uint64_t v17 = *(void *)(v16 + 656);
  uint64_t v18 = *(void *)(v17 + 16);
  *(void *)(v16 + 664) = v18;
  if (v18)
  {
    *(void *)(v16 + 680) = _swiftEmptyArrayStorage;
    *(void *)(v16 + 672) = 0;
    uint64_t v19 = *(void **)(v17 + 32);
    *(void *)(v16 + 688) = v19;
    v19;
    uint64_t v20 = (void *)swift_task_alloc();
    *(void *)(v16 + 696) = v20;
    uint64_t v21 = sub_126AC(0, &qword_1C968);
    sub_12EA0(v21);
    void *v20 = v22;
    v20[1] = sub_9C50;
    sub_12A04();
    return AccountStoreProtocol.activeiTunesAccount(for:)(v23, v24, v25, v26, v27, v28, v29, v30, a9, a10, a11, a12, a13, a14, a15, a16);
  }
  else
  {
    char v31 = *(unsigned char *)(v16 + 736);
    uint64_t v32 = *(void *)(v16 + 584);
    uint64_t v33 = *(void *)(v16 + 576);
    swift_bridgeObjectRelease();
    sub_14630();
    sub_BC94(&qword_1C978);
    uint64_t v34 = sub_13998();
    sub_127E8(v34);
    *(_OWORD *)(sub_13354() + 16) = xmmword_15210;
    *(void *)(v16 + 232) = sub_BC94(&qword_1C980);
    uint64_t v35 = sub_12810();
    *(void *)(v16 + 208) = v35;
    id v36 = *(void **)(v16 + 544);
    *(void *)(v35 + 16) = v36;
    *(void *)(v35 + 24) = v33;
    *(void *)(v35 + 32) = v32;
    *(unsigned char *)(v35 + 40) = v31;
    swift_retain();
    id v37 = v36;
    id v38 = (id)AMSLogKey();
    if (v38)
    {
      uint64_t v39 = v38;
      sub_146E0();
    }
    else
    {
      sub_13938();
    }
    uint64_t v40 = *(void *)(v16 + 632);
    uint64_t v41 = *(void *)(v16 + 600);
    uint64_t v51 = *(void *)(v16 + 592);
    sub_145C0();
    swift_bridgeObjectRelease();
    sub_11D24(v16 + 208);
    *(void *)(v16 + 424) = &type metadata for String;
    *(void *)(v16 + 400) = 0xD000000000000017;
    *(void *)(v16 + 408) = 0x80000000000165C0;
    sub_14590();
    sub_11D74(v16 + 400, &qword_1C988);
    sub_1295C();
    sub_14660();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v41 + 8))(v40, v51);
    sub_12EF8((uint64_t)"signOutService(_:with:)");
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    sub_12850();
    sub_12A04();
    return v44(v42, v43, v44, v45, v46, v47, v48, v49, v51, a10, a11, a12);
  }
}

uint64_t sub_9C50()
{
  sub_12864();
  sub_127D0();
  sub_12844();
  *uint64_t v3 = v2;
  uint64_t v4 = *v1;
  sub_12800();
  *uint64_t v5 = v4;
  *(void *)(v6 + 712) = v0;
  swift_task_dealloc();
  sub_12B88();
  return _swift_task_switch(v7, v8, v9);
}

#error "A12C: call analysis failed (funcsize=427)"

#error "A7A0: call analysis failed (funcsize=401)"

uint64_t sub_AAD4()
{
  sub_12864();
  sub_127D0();
  sub_12844();
  *uint64_t v3 = v2;
  uint64_t v4 = *v1;
  sub_12800();
  *uint64_t v5 = v4;
  *(void *)(v6 + 728) = v0;
  swift_task_dealloc();
  sub_12B88();
  return _swift_task_switch(v7, v8, v9);
}

#error "AEF0: call analysis failed (funcsize=379)"

#error "B56C: call analysis failed (funcsize=403)"

uint64_t type metadata accessor for AMSMediaServiceOwner()
{
  return self;
}

uint64_t sub_B8E4(void *a1, int a2, void *a3, void *a4, void *aBlock)
{
  uint64_t v8 = _Block_copy(aBlock);
  sub_1360C();
  uint64_t v9 = (void *)swift_allocObject();
  v9[2] = a3;
  v9[3] = a4;
  v9[4] = v8;
  v9[5] = a1;
  id v10 = a3;
  id v11 = a4;
  id v12 = a1;
  uint64_t v13 = sub_138D0();
  return sub_92B0(v13, v14);
}

uint64_t sub_B964(void *a1, void *a2, void *aBlock, void *a4)
{
  v4[3] = a2;
  v4[4] = a4;
  v4[2] = a1;
  v4[5] = _Block_copy(aBlock);
  id v8 = a1;
  id v9 = a2;
  a4;
  id v10 = (void *)swift_task_alloc();
  v4[6] = v10;
  *id v10 = v4;
  v10[1] = sub_BA3C;
  return AMSMediaServiceOwner.signOutService(_:with:)((uint64_t)v8, (uint64_t)v9);
}

uint64_t sub_BA3C()
{
  sub_13790();
  uint64_t v2 = v0;
  char v4 = v3;
  uint64_t v5 = (void *)*v1;
  uint64_t v6 = (void *)*v1;
  sub_12800();
  *uint64_t v7 = v6;
  id v8 = (void *)v5[4];
  id v9 = (void *)v5[3];
  id v10 = (void *)v5[2];
  id v11 = (void *)*v1;
  *uint64_t v7 = *v1;
  swift_task_dealloc();

  uint64_t v12 = v5[5];
  if (v2)
  {
    uint64_t v13 = (void *)sub_14510();
    swift_errorRelease();
    (*(void (**)(uint64_t, void, void *))(v12 + 16))(v12, 0, v13);
  }
  else
  {
    (*(void (**)(uint64_t, void, void))(v12 + 16))(v12, v4 & 1, 0);
  }
  _Block_release((const void *)v6[5]);
  uint64_t v14 = (uint64_t (*)(void))v11[1];
  return v14();
}

uint64_t sub_BBFC()
{
  sub_13148();
  sub_12C78();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)sub_12EB0(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_127C4;
  sub_12C1C();
  sub_13108();
  return v7(v3, v4, v5, v6, v7, v8, v9, v10);
}

uint64_t sub_BC94(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_BCD8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t sub_BD00(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  *(void *)(v16 + 16) = a2;
  uint64_t v18 = (void *)swift_task_alloc();
  *(void *)(v16 + 32) = v18;
  uint64_t v19 = sub_126AC(0, &qword_1C968);
  void *v18 = v16;
  v18[1] = sub_BDD8;
  return AccountStoreProtocol.activeiTunesAccount(for:)(v16 + 24, a1, v19, &protocol witness table for ACAccountStore, v20, v21, v22, v23, a9, a10, a11, a12, a13, a14, a15, a16);
}

uint64_t sub_BDD8()
{
  sub_12864();
  sub_127D0();
  uint64_t v2 = *v1;
  sub_12800();
  *uint64_t v3 = v2;
  swift_task_dealloc();
  if (v0) {
    swift_errorRelease();
  }
  sub_12B88();
  return _swift_task_switch(v4, v5, v6);
}

uint64_t sub_BEBC()
{
  sub_12864();
  uint64_t v1 = *(void **)(v0 + 24);
  if (v1) {

  }
  uint64_t v2 = *(uint64_t (**)(BOOL))(v0 + 8);
  return v2(v1 != 0);
}

uint64_t sub_BF28()
{
  return (*(uint64_t (**)(void))(v0 + 8))(0);
}

uint64_t sub_BF40(char a1, uint64_t a2, uint64_t a3)
{
  *(void *)(v3 + 24) = a2;
  *(void *)(v3 + 32) = a3;
  *(unsigned char *)(v3 + 56) = a1;
  return _swift_task_switch(sub_BF64, 0, 0);
}

uint64_t sub_BF64()
{
  sub_12F10();
  char v1 = *(unsigned char *)(v0 + 56);
  uint64_t v2 = sub_BC94(&qword_1C9A0);
  uint64_t v3 = swift_task_alloc();
  *(void *)(v0 + 40) = v3;
  long long v4 = *(_OWORD *)(v0 + 24);
  *(unsigned char *)(v3 + 16) = v1;
  *(_OWORD *)(v3 + 24) = v4;
  uint64_t v5 = sub_BC94(&qword_1C9B8);
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v0 + 48) = v6;
  *uint64_t v6 = v0;
  v6[1] = sub_C078;
  return withTaskGroup<A, B>(of:returning:isolation:body:)(v0 + 16, v2, v5, 0, 0, &unk_1C9B0, v3, v2);
}

uint64_t sub_C078()
{
  sub_12864();
  sub_127D0();
  uint64_t v1 = *v0;
  sub_12800();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  swift_task_dealloc();
  sub_12B88();
  return _swift_task_switch(v3, v4, v5);
}

uint64_t sub_C15C()
{
  return (*(uint64_t (**)(void))(v0 + 8))(*(void *)(v0 + 16));
}

uint64_t sub_C174(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(unsigned char *)(v8 + 604) = v14;
  *(void *)(v8 + 424) = a8;
  *(void *)(v8 + 432) = v13;
  *(void *)(v8 + 408) = a6;
  *(void *)(v8 + 416) = a7;
  *(void *)(v8 + 392) = a4;
  *(void *)(v8 + 400) = a5;
  *(void *)(v8 + 376) = a2;
  *(void *)(v8 + 384) = a3;
  *(void *)(v8 + 368) = a1;
  uint64_t v10 = sub_14670();
  *(void *)(v8 + 440) = v10;
  *(void *)(v8 + 448) = *(void *)(v10 - 8);
  *(void *)(v8 + 456) = swift_task_alloc();
  *(void *)(v8 + 464) = swift_task_alloc();
  *(void *)(v8 + 472) = swift_task_alloc();
  *(void *)(v8 + 480) = swift_task_alloc();
  *(void *)(v8 + 488) = swift_task_alloc();
  *(void *)(v8 + 288) = a7;
  return _swift_task_switch(sub_C290, 0, 0);
}

uint64_t sub_C290(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  sub_1347C();
  char v17 = *(unsigned char *)(v16 + 604);
  uint64_t v18 = *(void *)(v16 + 432);
  long long v44 = *(_OWORD *)(v16 + 416);
  sub_14630();
  *(void *)(v16 + 496) = sub_BC94(&qword_1C978);
  uint64_t v19 = sub_145D0();
  sub_127E8(v19);
  *(void *)(v16 + 504) = *(void *)(v20 + 72);
  *(_DWORD *)(v16 + 600) = *(_DWORD *)(v21 + 80);
  *(_OWORD *)(sub_13354() + 16) = xmmword_15210;
  uint64_t v22 = sub_BC94(&qword_1C980);
  *(void *)(v16 + 512) = v22;
  *(void *)(v16 + 72) = v22;
  uint64_t v23 = sub_12810();
  *(void *)(v16 + 48) = v23;
  *(_OWORD *)(v23 + 16) = v44;
  *(void *)(v23 + 32) = v18;
  *(unsigned char *)(v23 + 40) = v17;
  id v24 = (id)v44;
  swift_retain();
  id v25 = (id)AMSLogKey();
  if (v25)
  {
    uint64_t v26 = v25;
    sub_146E0();
  }
  uint64_t v27 = *(void *)(v16 + 488);
  uint64_t v28 = *(void *)(v16 + 448);
  uint64_t v43 = *(void *)(v16 + 440);
  uint64_t v29 = *(void **)(v16 + 376);
  sub_145C0();
  swift_bridgeObjectRelease();
  sub_11D24(v16 + 48);
  sub_14580();
  type metadata accessor for AMSAccountMediaType(0);
  *(void *)(v16 + 104) = v30;
  *(void *)(v16 + 80) = v29;
  id v31 = v29;
  sub_14590();
  sub_11D74(v16 + 80, &qword_1C988);
  sub_14660();
  swift_bridgeObjectRelease();
  uint64_t v32 = *(void (**)(uint64_t, uint64_t))(v28 + 8);
  *(void *)(v16 + 520) = v32;
  *(void *)(v16 + 528) = (v28 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v32(v27, v43);
  uint64_t v33 = (void *)swift_task_alloc();
  *(void *)(v16 + 536) = v33;
  *(void *)(v16 + 544) = sub_126AC(0, &qword_1C968);
  *uint64_t v33 = v16;
  v33[1] = sub_C52C;
  sub_12D50();
  return AccountStoreProtocol.activeiTunesAccount(for:)(v34, v35, v36, v37, v38, v39, v40, v41, v43, v16 + 352, v16 + 288, *((void *)&v44 + 1), a13, a14, a15, a16);
}

uint64_t sub_C52C()
{
  sub_12864();
  sub_127D0();
  uint64_t v2 = *v1;
  sub_12800();
  *uint64_t v3 = v2;
  swift_task_dealloc();
  if (v0) {
    swift_errorRelease();
  }
  sub_12B88();
  return _swift_task_switch(v4, v5, v6);
}

uint64_t sub_C610(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  sub_12CF8();
  sub_13284();
  *(void *)(v20 + 352) = 0;
  uint64_t v21 = *(void *)(v20 + 512);
  char v22 = *(unsigned char *)(v20 + 604);
  uint64_t v24 = *(void *)(v20 + 424);
  uint64_t v23 = *(void *)(v20 + 432);
  sub_14630();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_15220;
  *(void *)(v20 + 168) = v21;
  uint64_t v25 = sub_12810();
  *(void *)(v20 + 144) = v25;
  uint64_t v124 = v20 + 144;
  uint64_t v26 = *(void **)(v20 + 288);
  uint64_t v119 = v20 + 288;
  *(void *)(v25 + 16) = v26;
  *(void *)(v25 + 24) = v24;
  *(void *)(v25 + 32) = v23;
  *(unsigned char *)(v25 + 40) = v22;
  swift_retain();
  id v27 = v26;
  id v28 = (id)AMSLogKey();
  if (v28)
  {
    uint64_t v29 = v28;
    sub_146E0();
  }
  else
  {
    sub_13938();
  }
  v123 = (char *)(v20 + 604);
  uint64_t v30 = *(void (**)(uint64_t, uint64_t))(v20 + 520);
  uint64_t v31 = *(void *)(v20 + 472);
  uint64_t v32 = *(void *)(v20 + 440);
  sub_145C0();
  swift_bridgeObjectRelease();
  sub_11D24(v124);
  sub_1295C();
  sub_14660();
  swift_bridgeObjectRelease();
  v30(v31, v32);
  uint64_t v33 = *(void **)(v20 + 392);
  if (v33 && ([v33 canMakeAccountActive] & 1) == 0)
  {
    a10 = v20 + 208;
    uint64_t v39 = *(void *)(v20 + 512);
    uint64_t v120 = v20 + 464;
    char v40 = *v123;
    uint64_t v42 = *(void *)(v20 + 424);
    uint64_t v41 = *(void *)(v20 + 432);
    sub_14630();
    *(_OWORD *)(swift_allocObject() + 16) = xmmword_15220;
    *(void *)(v20 + 232) = v39;
    uint64_t v43 = sub_12810();
    *(void *)(v20 + 208) = v43;
    long long v44 = *(void **)(v20 + 288);
    *(void *)(v43 + 16) = v44;
    *(void *)(v43 + 24) = v42;
    *(void *)(v43 + 32) = v41;
    *(unsigned char *)(v43 + 40) = v40;
    swift_retain();
    id v45 = v44;
    if ((id)AMSLogKey())
    {
      sub_146E0();
      sub_12FF4();
    }
    else
    {
      sub_129F8();
    }
    sub_129E0();
    swift_bridgeObjectRelease();
    sub_11D24(a10);
    sub_1295C();
    sub_14660();
    int v47 = 0;
    uint64_t v46 = (uint64_t *)(v20 + 464);
  }
  else
  {
    uint64_t v34 = *(void *)(v20 + 512);
    uint64_t v120 = v20 + 456;
    uint64_t v35 = *(void *)(v20 + 424);
    sub_14630();
    *(_OWORD *)(swift_allocObject() + 16) = xmmword_15220;
    *(void *)(v20 + 200) = v34;
    uint64_t v36 = sub_12810();
    *(void *)(v20 + 176) = v36;
    uint64_t v37 = *(void **)(v20 + 288);
    *(void *)(v36 + 16) = v37;
    *(void *)(v36 + 24) = v35;
    sub_12E5C(v36);
    id v38 = v37;
    if ((id)AMSLogKey())
    {
      sub_146E0();
      sub_12FF4();
    }
    else
    {
      sub_129F8();
    }
    uint64_t v46 = (uint64_t *)(v20 + 456);
    sub_129E0();
    swift_bridgeObjectRelease();
    sub_11D24(v20 + 176);
    sub_13878();
    sub_14660();
    int v47 = 1;
  }
  uint64_t v48 = *v46;
  uint64_t v49 = *(void (**)(uint64_t, uint64_t))(v20 + 520);
  uint64_t v50 = *(void *)(v20 + 440);
  uint64_t v51 = *(void **)(v20 + 384);
  swift_bridgeObjectRelease();
  v49(v48, v50);
  unsigned int v52 = [v51 shouldForceOperation];
  uint64_t v53 = *(void **)(v20 + 352);
  *(void *)(v20 + 552) = v53;
  if (!v53) {
    goto LABEL_74;
  }
  uint64_t v54 = (id *)(v20 + 312);
  *(void *)(v20 + 312) = v53;
  if (v52)
  {
    if (v47)
    {
      uint64_t v55 = *(void *)(v20 + 368);
      *(void *)(v20 + 320) = v53;
      sub_126AC(0, &qword_1C990);
      id v56 = v53;
      uint64_t v57 = sub_14540();
      uint64_t v59 = v58;
      uint64_t v60 = sub_146E0();
      uint64_t v62 = sub_DFB0(v60, v61, v55);
      swift_bridgeObjectRelease();
      if (v62)
      {
        *(void *)(v20 + 328) = v62;
        sub_BC94(&qword_1CB00);
        swift_dynamicCast();
        sub_13228();
        if (v66) {
          uint64_t v65 = 0;
        }
        else {
          uint64_t v65 = v64;
        }
        if (v59)
        {
          if (v65)
          {
            BOOL v66 = v57 == v63 && v59 == v65;
            if (!v66)
            {
              char v67 = sub_147D0();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              if (v67) {
                goto LABEL_73;
              }
              goto LABEL_69;
            }
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
LABEL_73:

            goto LABEL_74;
          }
        }
        else if (!v65)
        {
          goto LABEL_73;
        }
      }
      else if (!v59)
      {
        goto LABEL_73;
      }
      swift_bridgeObjectRelease();
LABEL_69:
      sub_14570();
      v102 = (void *)swift_task_alloc();
      *(void *)(v20 + 584) = v102;
      void *v102 = v20;
      v102[1] = sub_DC9C;
      sub_12828();
      return AccountStoreProtocol.save(_:)(v103, v104, v105, v106, v107, v108, v109, v110, a9, a10, v119, v120, 2, 4, v123, v124, a17, a18, a19,
               a20);
    }
LABEL_74:
    uint64_t v111 = sub_13030();
    *(void *)(v20 + 560) = v111;
    *(void *)(v20 + 336) = v111;
    sub_126AC(0, &qword_1CB08);
    v112 = (void *)swift_task_alloc();
    *(void *)(v20 + 568) = v112;
    void *v112 = v20;
    v112[1] = sub_DA90;
    sub_12828();
    return dispatch thunk of AuthenticateTaskProtocol.performAuthentication()(v113, v114, v115);
  }
  uint64_t v68 = *(void *)(v20 + 368);
  uint64_t v69 = sub_126AC(0, &qword_1C990);
  id v122 = v53;
  uint64_t v121 = v69;
  uint64_t v70 = sub_14540();
  uint64_t v72 = v71;
  uint64_t v73 = sub_146E0();
  uint64_t v75 = sub_DFB0(v73, v74, v68);
  swift_bridgeObjectRelease();
  if (!v75)
  {
    if (!v72) {
      goto LABEL_63;
    }
    goto LABEL_44;
  }
  *(void *)(v20 + 304) = v75;
  sub_BC94(&qword_1CB00);
  swift_dynamicCast();
  sub_13228();
  if (v66) {
    uint64_t v78 = 0;
  }
  else {
    uint64_t v78 = v77;
  }
  if (!v72)
  {
    if (!v78) {
      goto LABEL_63;
    }
LABEL_44:
    swift_bridgeObjectRelease();
    goto LABEL_45;
  }
  if (!v78) {
    goto LABEL_44;
  }
  if (v70 != v76 || v72 != v78)
  {
    char v80 = sub_147D0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v80) {
      goto LABEL_63;
    }
LABEL_45:
    if (!v47 || (*v123 & 1) != 0) {
      goto LABEL_47;
    }
    uint64_t v54 = (id *)(v20 + 296);
    uint64_t v81 = *(void *)(v20 + 368);
    *(void *)(v20 + 296) = *(void *)(v20 + 312);
    uint64_t v82 = sub_14540();
    uint64_t v84 = v83;
    uint64_t v85 = sub_146E0();
    uint64_t v87 = sub_DFB0(v85, v86, v81);
    swift_bridgeObjectRelease();
    if (v87)
    {
      *(void *)(v20 + 360) = v87;
      sub_BC94(&qword_1CB00);
      swift_dynamicCast();
      sub_13228();
      if (v66) {
        uint64_t v90 = 0;
      }
      else {
        uint64_t v90 = v89;
      }
      if (v84)
      {
        if (v90)
        {
          if (v82 == v88 && v84 == v90)
          {
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
          }
          else
          {
            char v92 = sub_147D0();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            if ((v92 & 1) == 0) {
              goto LABEL_81;
            }
          }
LABEL_47:

          goto LABEL_74;
        }
      }
      else if (!v90)
      {
        goto LABEL_47;
      }
    }
    else if (!v84)
    {
      goto LABEL_47;
    }
    swift_bridgeObjectRelease();
LABEL_81:
    sub_13730();
    sub_137BC();
    NSString v117 = sub_12944();
    (id)sub_13178();

    swift_willThrow();
    v118 = *(void **)(v20 + 352);

    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    sub_13524();
    goto LABEL_64;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
LABEL_63:

  sub_1340C();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_13194();
LABEL_64:
  sub_12828();
  return v94(v93, v94, v95, v96, v97, v98, v99, v100, a9, a10, v119, v121, v122, 4, v123, v124, a17, a18, a19, a20);
}

uint64_t sub_CF94(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void (*a10)(uint64_t, uint64_t), uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  sub_1347C();
  uint64_t v21 = *(void **)(v20 + 352);
  uint64_t v22 = *(void *)(v20 + 512);
  char v23 = *(unsigned char *)(v20 + 604);
  uint64_t v24 = *(void *)(v20 + 424);
  uint64_t v25 = *(void *)(v20 + 432);
  if (v21)
  {
    id v126 = v21;
    sub_14630();
    *(_OWORD *)(swift_allocObject() + 16) = xmmword_15210;
    *(void *)(v20 + 136) = v22;
    uint64_t v26 = sub_12810();
    *(void *)(v20 + 112) = v26;
    id v27 = *(void **)(v20 + 288);
    *(void *)(v26 + 16) = v27;
    *(void *)(v26 + 24) = v24;
    *(void *)(v26 + 32) = v25;
    *(unsigned char *)(v26 + 40) = v23;
    swift_retain();
    id v28 = v27;
    id v29 = (id)AMSLogKey();
    if (v29)
    {
      uint64_t v30 = v29;
      uint64_t v31 = sub_146E0();
    }
    else
    {
      uint64_t v31 = 0;
    }
    a10 = *(void (**)(uint64_t, uint64_t))(v20 + 520);
    uint64_t v38 = *(void *)(v20 + 480);
    uint64_t v39 = *(void *)(v20 + 440);
    sub_145C0();
    swift_bridgeObjectRelease();
    sub_11D24(v20 + 112);
    sub_14580();
    *(void *)(v20 + 40) = sub_126AC(0, &qword_1C990);
    *(void *)(v20 + 16) = v126;
    id v40 = v126;
    sub_14590();
    sub_11D74(v20 + 16, &qword_1C988);
    sub_14660();
    swift_bridgeObjectRelease();
    a10(v38, v39);
  }
  else
  {
    unint64_t v32 = (*(unsigned __int8 *)(v20 + 600) + 32) & ~(unint64_t)*(unsigned __int8 *)(v20 + 600);
    sub_14630();
    uint64_t v33 = swift_allocObject();
    *(_OWORD *)(v33 + 16) = xmmword_15220;
    uint64_t v34 = v33 + v32;
    *(void *)(v20 + 168) = v22;
    uint64_t v35 = sub_12810();
    *(void *)(v20 + 144) = v35;
    uint64_t v36 = *(void **)(v20 + 288);
    *(void *)(v35 + 16) = v36;
    *(void *)(v35 + 24) = v24;
    *(void *)(v35 + 32) = v25;
    *(unsigned char *)(v35 + 40) = v23;
    swift_retain();
    id v37 = v36;
    if ((id)AMSLogKey())
    {
      sub_146E0();
      sub_13290();
    }
    else
    {
      sub_12EEC();
    }
    uint64_t v41 = *(void (**)(uint64_t, uint64_t))(v20 + 520);
    uint64_t v42 = *(void *)(v20 + 472);
    uint64_t v43 = *(void *)(v20 + 440);
    uint64_t v31 = v34;
    sub_12EBC();
    swift_bridgeObjectRelease();
    sub_11D24(v20 + 144);
    sub_1295C();
    sub_14660();
    swift_bridgeObjectRelease();
    v41(v42, v43);
  }
  long long v44 = *(void **)(v20 + 392);
  v128 = (unsigned char *)(v20 + 604);
  if (v44 && ([v44 canMakeAccountActive] & 1) == 0)
  {
    uint64_t v127 = v20 + 208;
    uint64_t v49 = *(void *)(v20 + 512);
    uint64_t v50 = (uint64_t *)(v20 + 464);
    sub_1362C();
    sub_14630();
    *(_OWORD *)(swift_allocObject() + 16) = xmmword_15220;
    *(void *)(v20 + 232) = v49;
    uint64_t v51 = sub_12810();
    *(void *)(v20 + 208) = v51;
    unsigned int v52 = *(void **)(v20 + 288);
    *(void *)(v51 + 16) = v52;
    *(void *)(v51 + 24) = v31;
    sub_12CB4(v51);
    id v53 = v52;
    if ((id)AMSLogKey())
    {
      sub_146E0();
      sub_13290();
    }
    else
    {
      sub_12EEC();
    }
    sub_12EBC();
    swift_bridgeObjectRelease();
    sub_11D24(v127);
    sub_1295C();
    sub_14660();
    int v54 = 0;
  }
  else
  {
    uint64_t v45 = *(void *)(v20 + 512);
    uint64_t v127 = v20 + 456;
    sub_1362C();
    sub_14630();
    *(_OWORD *)(swift_allocObject() + 16) = xmmword_15220;
    *(void *)(v20 + 200) = v45;
    uint64_t v46 = sub_12810();
    *(void *)(v20 + 176) = v46;
    int v47 = *(void **)(v20 + 288);
    *(void *)(v46 + 16) = v47;
    *(void *)(v46 + 24) = v31;
    sub_12CB4(v46);
    id v48 = v47;
    if ((id)AMSLogKey())
    {
      sub_146E0();
      sub_13290();
    }
    else
    {
      sub_12EEC();
    }
    uint64_t v50 = (uint64_t *)(v20 + 456);
    sub_12EBC();
    swift_bridgeObjectRelease();
    sub_11D24(v20 + 176);
    sub_13878();
    sub_14660();
    int v54 = 1;
  }
  uint64_t v55 = *v50;
  id v56 = *(void (**)(uint64_t, uint64_t))(v20 + 520);
  uint64_t v57 = *(void *)(v20 + 440);
  uint64_t v58 = *(void **)(v20 + 384);
  swift_bridgeObjectRelease();
  v56(v55, v57);
  unsigned int v59 = [v58 shouldForceOperation];
  uint64_t v60 = *(void **)(v20 + 352);
  *(void *)(v20 + 552) = v60;
  if (!v60) {
    goto LABEL_81;
  }
  uint64_t v61 = (id *)(v20 + 312);
  *(void *)(v20 + 312) = v60;
  if (v59)
  {
    if (v54)
    {
      uint64_t v62 = *(void *)(v20 + 368);
      *(void *)(v20 + 320) = v60;
      sub_126AC(0, &qword_1C990);
      id v63 = v60;
      uint64_t v64 = sub_14540();
      uint64_t v66 = v65;
      uint64_t v67 = sub_146E0();
      uint64_t v69 = sub_DFB0(v67, v68, v62);
      swift_bridgeObjectRelease();
      if (v69)
      {
        *(void *)(v20 + 328) = v69;
        sub_BC94(&qword_1CB00);
        swift_dynamicCast();
        sub_13228();
        if (v73) {
          uint64_t v72 = 0;
        }
        else {
          uint64_t v72 = v71;
        }
        if (v66)
        {
          if (v72)
          {
            BOOL v73 = v64 == v70 && v66 == v72;
            if (!v73)
            {
              char v74 = sub_147D0();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              if (v74) {
                goto LABEL_80;
              }
              goto LABEL_76;
            }
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
LABEL_80:

            goto LABEL_81;
          }
        }
        else if (!v72)
        {
          goto LABEL_80;
        }
      }
      else if (!v66)
      {
        goto LABEL_80;
      }
      swift_bridgeObjectRelease();
LABEL_76:
      sub_14570();
      uint64_t v109 = (void *)swift_task_alloc();
      *(void *)(v20 + 584) = v109;
      *uint64_t v109 = v20;
      v109[1] = sub_DC9C;
      sub_12D50();
      return AccountStoreProtocol.save(_:)(v110, v111, v112, v113, v114, v115, v116, v117, a9, a10, v127, v128, a13, a14, a15, a16, a17, a18, a19,
               a20);
    }
LABEL_81:
    uint64_t v118 = sub_13030();
    *(void *)(v20 + 560) = v118;
    *(void *)(v20 + 336) = v118;
    sub_126AC(0, &qword_1CB08);
    uint64_t v119 = (void *)swift_task_alloc();
    *(void *)(v20 + 568) = v119;
    *uint64_t v119 = v20;
    v119[1] = sub_DA90;
    sub_12D50();
    return dispatch thunk of AuthenticateTaskProtocol.performAuthentication()(v120, v121, v122);
  }
  uint64_t v75 = *(void *)(v20 + 368);
  uint64_t v76 = sub_126AC(0, &qword_1C990);
  id v77 = v60;
  uint64_t v78 = sub_14540();
  uint64_t v80 = v79;
  uint64_t v81 = sub_146E0();
  sub_DFB0(v81, v82, v75);
  sub_13694();
  if (!v75)
  {
    if (!v80) {
      goto LABEL_70;
    }
    goto LABEL_53;
  }
  uint64_t v127 = v76;
  *(void *)(v20 + 304) = v75;
  sub_BC94(&qword_1CB00);
  swift_dynamicCast();
  sub_13228();
  if (v73) {
    uint64_t v85 = 0;
  }
  else {
    uint64_t v85 = v84;
  }
  if (!v80)
  {
    if (!v85) {
      goto LABEL_70;
    }
LABEL_53:
    swift_bridgeObjectRelease();
    goto LABEL_54;
  }
  if (!v85) {
    goto LABEL_53;
  }
  if (v78 != v83 || v80 != v85)
  {
    char v87 = sub_147D0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v87) {
      goto LABEL_70;
    }
LABEL_54:
    if (!v54 || (*v128 & 1) != 0) {
      goto LABEL_56;
    }
    uint64_t v61 = (id *)(v20 + 296);
    uint64_t v88 = *(void *)(v20 + 368);
    *(void *)(v20 + 296) = *(void *)(v20 + 312);
    uint64_t v89 = sub_14540();
    uint64_t v91 = v90;
    uint64_t v92 = sub_146E0();
    uint64_t v94 = sub_DFB0(v92, v93, v88);
    swift_bridgeObjectRelease();
    if (v94)
    {
      *(void *)(v20 + 360) = v94;
      sub_BC94(&qword_1CB00);
      swift_dynamicCast();
      sub_13228();
      if (v73) {
        uint64_t v97 = 0;
      }
      else {
        uint64_t v97 = v96;
      }
      if (v91)
      {
        if (v97)
        {
          if (v89 == v95 && v91 == v97)
          {
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
          }
          else
          {
            char v99 = sub_147D0();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            if ((v99 & 1) == 0) {
              goto LABEL_88;
            }
          }
LABEL_56:

          goto LABEL_81;
        }
      }
      else if (!v97)
      {
        goto LABEL_56;
      }
    }
    else if (!v91)
    {
      goto LABEL_56;
    }
    swift_bridgeObjectRelease();
LABEL_88:
    sub_13730();
    sub_137BC();
    NSString v124 = sub_12944();
    (id)AMSError();

    swift_willThrow();
    v125 = *(void **)(v20 + 352);

    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    sub_13524();
    goto LABEL_71;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
LABEL_70:

  sub_1340C();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_13194();
LABEL_71:
  sub_12D50();
  return v101(v100, v101, v102, v103, v104, v105, v106, v107, a9, a10, v127, v128, a13, a14, a15, a16);
}

uint64_t sub_DA90()
{
  sub_12864();
  sub_127D0();
  uint64_t v3 = v2;
  sub_12844();
  *uint64_t v4 = v3;
  uint64_t v5 = *v1;
  sub_12800();
  *uint64_t v6 = v5;
  *(void *)(v3 + 576) = v0;
  swift_task_dealloc();

  if (!v0) {
  sub_12B88();
  }
  return _swift_task_switch(v7, v8, v9);
}

uint64_t sub_DB84()
{
  sub_12F10();

  sub_1340C();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_13194();
  return v1();
}

uint64_t sub_DC08()
{
  sub_13148();
  sub_12C78();

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_13518();
  sub_13108();
  return v2(v1, v2, v3, v4, v5, v6, v7, v8);
}

uint64_t sub_DC9C()
{
  sub_12864();
  sub_127D0();
  sub_12844();
  *uint64_t v3 = v2;
  uint64_t v4 = *v1;
  sub_12800();
  *uint64_t v5 = v4;
  *(void *)(v6 + 592) = v0;
  swift_task_dealloc();
  sub_12B88();
  return _swift_task_switch(v7, v8, v9);
}

uint64_t sub_DD78()
{
  sub_12F10();
  uint64_t v1 = *(void **)(v0 + 320);

  uint64_t v2 = sub_E058(*(void **)(v0 + 384), *(void *)(v0 + 376), *(void *)(v0 + 368), *(void *)(v0 + 400), *(void *)(v0 + 408), *(void *)(v0 + 288), *(void (**)(long long *__return_ptr, id *, uint64_t, id))(v0 + 424));
  *(void *)(v0 + 560) = v2;
  *(void *)(v0 + 336) = v2;
  uint64_t v3 = sub_126AC(0, &qword_1CB08);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v0 + 568) = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_DA90;
  return dispatch thunk of AuthenticateTaskProtocol.performAuthentication()(v0 + 344, v3, &protocol witness table for AMSAuthenticateTask);
}

uint64_t sub_DE80()
{
  sub_13790();
  uint64_t v1 = *(void **)(v0 + 552);
  NSString v2 = sub_146B0();
  NSString v3 = sub_12944();
  uint64_t v4 = (void *)sub_14510();
  sub_13508();
  (id)AMSError();

  swift_willThrow();
  swift_errorRelease();

  uint64_t v5 = *(void **)(v0 + 352);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_13518();
  return v6();
}

uint64_t sub_DFB0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a3 + 16) && (sub_112FC(a1, a2), (v3 & 1) != 0)) {
    return swift_unknownObjectRetain();
  }
  else {
    return 0;
  }
}

double sub_DFF4@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  if (*(void *)(a2 + 16) && (unint64_t v5 = sub_11374(a1), (v6 & 1) != 0))
  {
    uint64_t v7 = *(void *)(a2 + 56) + 32 * v5;
    sub_125D8(v7, (uint64_t)a3);
  }
  else
  {
    double result = 0.0;
    *a3 = 0u;
    a3[1] = 0u;
  }
  return result;
}

uint64_t sub_E058(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void (*a7)(long long *__return_ptr, id *, uint64_t, id))
{
  id v26 = a1;
  uint64_t v9 = sub_11A34(a1);
  if (!v9)
  {
    long long v24 = 0u;
    long long v25 = 0u;
    goto LABEL_6;
  }
  uint64_t v10 = v9;
  id v11 = AIDAServiceTypeStore;
  sub_DFF4((uint64_t)v11, v10, &v24);

  swift_bridgeObjectRelease();
  if (!*((void *)&v25 + 1))
  {
LABEL_6:
    sub_11D74((uint64_t)&v24, &qword_1C988);
    goto LABEL_7;
  }
  sub_126AC(0, &qword_1CA38);
  if (swift_dynamicCast())
  {
    uint64_t v12 = v23;
    id v13 = [v23 canMakeAccountActive];
    goto LABEL_8;
  }
LABEL_7:
  uint64_t v12 = 0;
  id v13 = &dword_0 + 1;
LABEL_8:
  id v14 = [objc_allocWithZone((Class)AMSAuthenticateOptions) init];
  sub_126AC(0, (unint64_t *)&unk_1CB10);
  id v15 = sub_E32C();
  [v14 setClientInfo:v15];

  id v16 = v26;
  objc_msgSend(v14, "setAllowServerDialogs:", objc_msgSend(v26, "operationUIPermissions") == (char *)&dword_0 + 1);
  objc_msgSend(v14, "setAuthenticationType:", objc_msgSend(v16, "operationUIPermissions") != (char *)&dword_0 + 1);
  [v14 setCanMakeAccountActive:v13];
  id v17 = [v14 clientInfo];
  [v17 setAccountMediaType:a2];

  NSString v18 = sub_146B0();
  [v14 setDebugReason:v18];

  if (v12) {
    id v19 = [v12 ignoreAccountConversion];
  }
  else {
    id v19 = &dword_0 + 1;
  }
  [v14 setIgnoreAccountConversion:v19];
  NSString v20 = sub_146B0();
  [v14 setLogKey:v20];

  a7(&v24, &v26, a3, v14);
  return v24;
}

id sub_E32C()
{
  id v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  NSString v1 = sub_146B0();
  swift_bridgeObjectRelease();
  id v2 = [v0 initWithBundleIdentifier:v1];

  return v2;
}

uint64_t sub_E3A0(uint64_t a1, unint64_t a2, int a3)
{
  int v12 = a3;
  uint64_t v10 = a1;
  unint64_t v11 = a2;
  uint64_t v3 = sub_14670();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin();
  char v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_14630();
  sub_BC94(&qword_1C978);
  sub_145D0();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_15210;
  sub_BC94(&qword_1C980);
  id v7 = (id)AMSSetLogKeyIfNeeded();
  sub_146E0();

  sub_145B0();
  swift_bridgeObjectRelease();
  id v16 = &type metadata for StaticString;
  uint64_t v13 = v10;
  unint64_t v14 = v11;
  char v15 = v12;
  sub_14590();
  sub_11D74((uint64_t)&v13, &qword_1C988);
  id v16 = &type metadata for String;
  uint64_t v13 = 0x64656873696E6966;
  unint64_t v14 = 0xE800000000000000;
  sub_145A0();
  sub_11D74((uint64_t)&v13, &qword_1C988);
  sub_14640();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t sub_E5EC(void (*a1)(char *, uint64_t), unint64_t a2, int a3, uint64_t a4)
{
  uint64_t v39 = a4;
  LODWORD(v51) = a3;
  unint64_t v50 = a2;
  uint64_t v43 = a1;
  uint64_t v4 = sub_14670();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin();
  id v7 = (char *)&v35 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_14630();
  uint64_t v8 = sub_BC94(&qword_1C978);
  uint64_t v9 = *(void *)(sub_145D0() - 8);
  uint64_t v10 = *(void *)(v9 + 72);
  uint64_t v11 = *(unsigned __int8 *)(v9 + 80);
  uint64_t v12 = (v11 + 32) & ~v11;
  uint64_t v49 = v8;
  uint64_t v47 = v12 + 3 * v10;
  uint64_t v46 = v11 | 7;
  uint64_t v13 = swift_allocObject();
  long long v45 = xmmword_15210;
  *(_OWORD *)(v13 + 16) = xmmword_15210;
  uint64_t v48 = v12;
  uint64_t v14 = sub_BC94(&qword_1C980);
  id v15 = (id)AMSSetLogKeyIfNeeded();
  sub_146E0();

  uint64_t v44 = v14;
  sub_145B0();
  swift_bridgeObjectRelease();
  uint64_t v62 = &type metadata for StaticString;
  uint64_t v59 = (uint64_t)v43;
  unint64_t v60 = v50;
  char v61 = v51;
  sub_14590();
  sub_11D74((uint64_t)&v59, &qword_1C988);
  uint64_t v62 = &type metadata for String;
  uint64_t v59 = 0x64657472617473;
  unint64_t v60 = 0xE700000000000000;
  sub_145A0();
  sub_11D74((uint64_t)&v59, &qword_1C988);
  sub_14640();
  swift_bridgeObjectRelease();
  id v16 = *(void (**)(char *, uint64_t))(v5 + 8);
  unint64_t v50 = v5 + 8;
  uint64_t v51 = v4;
  uint64_t v43 = v16;
  uint64_t result = ((uint64_t (*)(char *, uint64_t))v16)(v7, v4);
  if (!v39) {
    return result;
  }
  uint64_t v42 = v10;
  uint64_t v41 = 2 * v10;
  uint64_t v18 = *(void *)(v39 + 64);
  uint64_t v36 = v39 + 64;
  uint64_t v19 = 1 << *(unsigned char *)(v39 + 32);
  uint64_t v20 = -1;
  if (v19 < 64) {
    uint64_t v20 = ~(-1 << v19);
  }
  unint64_t v21 = v20 & v18;
  uint64_t v38 = v58;
  id v40 = &v61;
  int64_t v37 = (unint64_t)(v19 + 63) >> 6;
  int64_t v35 = v37 - 1;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v22 = 0;
  if (!v21) {
    goto LABEL_7;
  }
LABEL_5:
  unint64_t v23 = __clz(__rbit64(v21));
  v21 &= v21 - 1;
  unint64_t v24 = v23 | (v22 << 6);
  while (2)
  {
    uint64_t v25 = *(void *)(v39 + 56);
    id v26 = (void *)(*(void *)(v39 + 48) + 16 * v24);
    uint64_t v27 = v26[1];
    *(void *)&long long v57 = *v26;
    *((void *)&v57 + 1) = v27;
    sub_125D8(v25 + 32 * v24, (uint64_t)v38);
    swift_bridgeObjectRetain();
    while (1)
    {
      sub_12634((uint64_t)&v57, (uint64_t)&v59);
      unint64_t v31 = v60;
      if (!v60) {
        return swift_release();
      }
      uint64_t v32 = v59;
      sub_1269C(v40, &v57);
      sub_14630();
      *(_OWORD *)(swift_allocObject() + 16) = v45;
      id v33 = (id)AMSSetLogKeyIfNeeded();
      sub_146E0();

      sub_145B0();
      swift_bridgeObjectRelease();
      unint64_t v53 = v31;
      uint64_t v54 = 58;
      unint64_t v55 = 0xE100000000000000;
      uint64_t v52 = v32;
      swift_bridgeObjectRetain();
      uint64_t v52 = sub_14710();
      unint64_t v53 = v34;
      sub_14700();
      swift_bridgeObjectRelease();
      id v56 = &type metadata for String;
      uint64_t v54 = v52;
      unint64_t v55 = v53;
      sub_14590();
      sub_11D74((uint64_t)&v54, &qword_1C988);
      sub_125D8((uint64_t)&v57, (uint64_t)&v54);
      sub_14590();
      sub_11D74((uint64_t)&v54, &qword_1C988);
      sub_14640();
      swift_bridgeObjectRelease();
      v43(v7, v51);
      uint64_t result = sub_11D24((uint64_t)&v57);
      if (v21) {
        goto LABEL_5;
      }
LABEL_7:
      int64_t v28 = v22 + 1;
      if (__OFADD__(v22, 1))
      {
        __break(1u);
        goto LABEL_34;
      }
      if (v28 < v37)
      {
        unint64_t v29 = *(void *)(v36 + 8 * v28);
        if (v29) {
          goto LABEL_10;
        }
        int64_t v30 = v22 + 2;
        ++v22;
        if (v28 + 1 < v37)
        {
          unint64_t v29 = *(void *)(v36 + 8 * v30);
          if (v29) {
            goto LABEL_13;
          }
          int64_t v22 = v28 + 1;
          if (v28 + 2 < v37)
          {
            unint64_t v29 = *(void *)(v36 + 8 * (v28 + 2));
            if (v29)
            {
              v28 += 2;
              goto LABEL_10;
            }
            int64_t v22 = v28 + 2;
            if (v28 + 3 < v37)
            {
              unint64_t v29 = *(void *)(v36 + 8 * (v28 + 3));
              if (v29)
              {
                v28 += 3;
                goto LABEL_10;
              }
              int64_t v30 = v28 + 4;
              int64_t v22 = v28 + 3;
              if (v28 + 4 < v37) {
                break;
              }
            }
          }
        }
      }
LABEL_27:
      unint64_t v21 = 0;
      memset(v58, 0, sizeof(v58));
      long long v57 = 0u;
    }
    unint64_t v29 = *(void *)(v36 + 8 * v30);
    if (v29)
    {
LABEL_13:
      int64_t v28 = v30;
LABEL_10:
      unint64_t v21 = (v29 - 1) & v29;
      unint64_t v24 = __clz(__rbit64(v29)) + (v28 << 6);
      int64_t v22 = v28;
      continue;
    }
    break;
  }
  while (1)
  {
    int64_t v28 = v30 + 1;
    if (__OFADD__(v30, 1)) {
      break;
    }
    if (v28 >= v37)
    {
      int64_t v22 = v35;
      goto LABEL_27;
    }
    unint64_t v29 = *(void *)(v36 + 8 * v28);
    ++v30;
    if (v29) {
      goto LABEL_10;
    }
  }
LABEL_34:
  __break(1u);
  return result;
}

uint64_t sub_EC84(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[17] = a3;
  v4[18] = a4;
  v4[16] = a1;
  uint64_t v5 = sub_BC94(&qword_1C9C8);
  v4[19] = v5;
  v4[20] = *(void *)(v5 - 8);
  v4[21] = swift_task_alloc();
  uint64_t v6 = sub_BC94(&qword_1C9D0);
  v4[22] = v6;
  v4[23] = *(void *)(v6 - 8);
  v4[24] = swift_task_alloc();
  v4[25] = swift_task_alloc();
  sub_BC94(&qword_1C8F0);
  v4[26] = swift_task_alloc();
  v4[27] = swift_task_alloc();
  return _swift_task_switch(sub_EDFC, 0, 0);
}

uint64_t sub_EDFC()
{
  sub_1347C();
  uint64_t v1 = v0[26];
  uint64_t v2 = v0[27];
  uint64_t v4 = v0[17];
  uint64_t v3 = v0[18];
  sub_BC94(&qword_1C9D8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_151F0;
  uint64_t v6 = (void *)AMSAccountMediaTypeProduction;
  *(void *)(inited + 32) = AMSAccountMediaTypeProduction;
  uint64_t v7 = sub_14770();
  id v8 = v6;
  sub_BCD8(v2, 1, 1, v7);
  uint64_t v9 = (void *)swift_allocObject();
  v9[2] = 0;
  v9[3] = 0;
  v9[4] = v4;
  v9[5] = v3;
  v9[6] = v8;
  sub_1244C(v2, v1);
  LODWORD(v1) = sub_10F24(v1, 1, v7);
  id v10 = v8;
  swift_retain();
  uint64_t v11 = v0[26];
  if (v1 == 1)
  {
    sub_11D74(v0[26], &qword_1C8F0);
    uint64_t v12 = 0;
    uint64_t v13 = 0;
  }
  else
  {
    sub_14760();
    sub_129D4();
    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v11, v7);
    if (v9[2])
    {
      swift_getObjectType();
      swift_unknownObjectRetain();
      uint64_t v12 = sub_14740();
      uint64_t v13 = v15;
      swift_unknownObjectRelease();
    }
    else
    {
      uint64_t v12 = 0;
      uint64_t v13 = 0;
    }
  }
  id v16 = (uint64_t *)v0[16];
  uint64_t v17 = *v16;
  uint64_t v18 = swift_allocObject();
  *(void *)(v18 + 16) = &unk_1C9E8;
  *(void *)(v18 + 24) = v9;
  sub_BC94(&qword_1C9A0);
  uint64_t v19 = (void *)(v13 | v12);
  if (v13 | v12)
  {
    uint64_t v19 = v0 + 7;
    v0[7] = 0;
    v0[8] = 0;
    v0[9] = v12;
    v0[10] = v13;
  }
  uint64_t v20 = v0[27];
  uint64_t v21 = v0[25];
  uint64_t v30 = v0[24];
  uint64_t v23 = v0[22];
  uint64_t v22 = v0[23];
  v0[11] = 1;
  v0[12] = v19;
  v0[13] = v17;
  swift_task_create();

  swift_release();
  sub_11D74(v20, &qword_1C8F0);
  swift_setDeallocating();
  sub_1129C();
  v0[14] = *v16;
  sub_BC94(&qword_1C9F8);
  type metadata accessor for AMSAccountMediaType(0);
  sub_12594(&qword_1CA00, &qword_1C9F8);
  sub_147B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v22 + 16))(v30, v21, v23);
  sub_12594(&qword_1CA08, &qword_1C9D0);
  sub_14780();
  v0[28] = _swiftEmptyArrayStorage;
  sub_12594(&qword_1CA10, &qword_1C9C8);
  unint64_t v24 = (void *)swift_task_alloc();
  v0[29] = v24;
  *unint64_t v24 = v0;
  v24[1] = sub_F204;
  sub_12D50();
  return dispatch thunk of AsyncIteratorProtocol.next()(v25, v26, v27);
}

uint64_t sub_F204()
{
  sub_12864();
  sub_127D0();
  uint64_t v3 = v2;
  sub_12844();
  *uint64_t v4 = v3;
  uint64_t v5 = *v1;
  sub_12800();
  *uint64_t v6 = v5;
  swift_task_dealloc();
  if (v0)
  {
    (*(void (**)(void, void))(v3[20] + 8))(v3[21], v3[19]);
    swift_bridgeObjectRelease();
  }
  sub_12B88();
  return _swift_task_switch(v7, v8, v9);
}

uint64_t sub_F300()
{
  sub_13790();
  uint64_t v1 = *(void *)(v0 + 120);
  if (v1)
  {
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v3 = *(void **)(v0 + 224);
    if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
      uint64_t v3 = sub_11784(0, v3[2] + 1, 1, v3);
    }
    unint64_t v5 = v3[2];
    unint64_t v4 = v3[3];
    if (v5 >= v4 >> 1) {
      uint64_t v3 = sub_11784((void *)(v4 > 1), v5 + 1, 1, v3);
    }
    v3[2] = v5 + 1;
    v3[v5 + 4] = v1;
    *(void *)(v0 + 224) = v3;
    uint64_t v6 = sub_12594(&qword_1CA10, &qword_1C9C8);
    uint64_t v7 = (void *)swift_task_alloc();
    *(void *)(v0 + 232) = v7;
    *uint64_t v7 = v0;
    v7[1] = sub_F204;
    uint64_t v8 = *(void *)(v0 + 152);
    return dispatch thunk of AsyncIteratorProtocol.next()(v0 + 120, v8, v6);
  }
  else
  {
    uint64_t v9 = *(void *)(v0 + 200);
    uint64_t v10 = *(void *)(v0 + 176);
    uint64_t v11 = *(void *)(v0 + 184);
    (*(void (**)(void, void))(*(void *)(v0 + 160) + 8))(*(void *)(v0 + 168), *(void *)(v0 + 152));

    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v9, v10);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v12 = *(uint64_t (**)(uint64_t))(v0 + 8);
    uint64_t v13 = *(void *)(v0 + 224);
    return v12(v13);
  }
}

uint64_t sub_F508(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8)
{
  *(unsigned char *)(v8 + 360) = a8;
  *(void *)(v8 + 240) = a6;
  *(void *)(v8 + 248) = a7;
  *(void *)(v8 + 224) = a4;
  *(void *)(v8 + 232) = a5;
  *(void *)(v8 + 208) = a2;
  *(void *)(v8 + 216) = a3;
  *(void *)(v8 + 200) = a1;
  uint64_t v10 = sub_14670();
  *(void *)(v8 + 256) = v10;
  *(void *)(v8 + 264) = *(void *)(v10 - 8);
  *(void *)(v8 + 272) = swift_task_alloc();
  *(void *)(v8 + 280) = swift_task_alloc();
  *(void *)(v8 + 136) = a5;
  return _swift_task_switch(sub_F5F0, 0, 0);
}

uint64_t sub_F5F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  sub_13498();
  uint64_t v17 = *(void **)(v16 + 232);
  *(void *)(v16 + 112) = v17;
  uint64_t v18 = *(void *)(v16 + 200);
  uint64_t v19 = sub_146E0();
  uint64_t v21 = v20;
  id v22 = v17;
  uint64_t v23 = sub_DFB0(v19, v21, v18);
  swift_bridgeObjectRelease();
  if (v23)
  {
    *(void *)(v16 + 184) = v23;
    sub_BC94(&qword_1CB00);
    swift_dynamicCast();
  }
  uint64_t v24 = *(void *)(v16 + 200);
  uint64_t v25 = sub_146E0();
  uint64_t v27 = sub_DFB0(v25, v26, v24);
  swift_bridgeObjectRelease();
  if (v27)
  {
    *(void *)(v16 + 168) = v27;
    sub_BC94(&qword_1CB00);
    swift_dynamicCast();
  }
  uint64_t v28 = *(void *)(v16 + 200);
  uint64_t v29 = sub_146E0();
  sub_DFB0(v29, v30, v28);
  sub_13694();
  if (v28)
  {
    *(void *)(v16 + 152) = v28;
    sub_BC94(&qword_1CB00);
    swift_dynamicCast();
  }
  *(void *)(v16 + 288) = sub_126AC(0, &qword_1C968);
  sub_14620();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  id v40 = *(void **)(v16 + 144);
  if (v40)
  {
    uint64_t v41 = *(void **)(v16 + 224);
    *(void *)(v16 + 160) = v40;
    if ([v41 canMakeAccountActive])
    {
      uint64_t v42 = (void *)swift_task_alloc();
      *(void *)(v16 + 296) = v42;
      *uint64_t v42 = v16;
      v42[1] = sub_FB0C;
      sub_12A04();
      return AccountStoreProtocol.activeiTunesAccount(for:)(v43, v44, v45, v46, v47, v48, v49, v50, a9, a10, a11, a12, a13, a14, a15, a16);
    }
    NSString v58 = sub_146B0();
    NSString v59 = sub_12944();
    (id)sub_13178();

    swift_willThrow();
  }
  else
  {
    char v51 = *(unsigned char *)(v16 + 360);
    uint64_t v53 = *(void *)(v16 + 240);
    uint64_t v52 = *(void *)(v16 + 248);
    sub_14630();
    sub_BC94(&qword_1C978);
    uint64_t v54 = sub_13998();
    sub_127E8(v54);
    *(_OWORD *)(sub_13354() + 16) = xmmword_15220;
    *(void *)(v16 + 72) = sub_BC94(&qword_1C980);
    uint64_t v55 = sub_12810();
    *(void *)(v16 + 48) = v55;
    id v56 = *(void **)(v16 + 136);
    *(void *)(v55 + 16) = v56;
    *(void *)(v55 + 24) = v53;
    *(void *)(v55 + 32) = v52;
    *(unsigned char *)(v55 + 40) = v51;
    id v57 = v56;
    swift_retain();
    if ((id)AMSLogKey())
    {
      sub_146E0();
      sub_13290();
    }
    else
    {
      sub_12EEC();
    }
    sub_12EBC();
    swift_bridgeObjectRelease();
    sub_11D24(v16 + 48);
    sub_14580();
    sub_14650();
    swift_bridgeObjectRelease();
    sub_13168();
    v60();
    NSString v61 = sub_146B0();
    NSString v62 = sub_12944();
    (id)sub_13178();

    swift_willThrow();
  }
  swift_task_dealloc();
  swift_task_dealloc();
  sub_131A4();
  sub_12A04();
  return v32(v31, v32, v33, v34, v35, v36, v37, v38, a9, a10, a11, a12);
}

uint64_t sub_FB0C()
{
  sub_12864();
  sub_127D0();
  uint64_t v2 = *v1;
  sub_12800();
  *uint64_t v3 = v2;
  swift_task_dealloc();
  if (v0) {
    swift_errorRelease();
  }
  sub_12B88();
  return _swift_task_switch(v4, v5, v6);
}

uint64_t sub_FBF0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  sub_12F10();
  v20[15] = 0;
  sub_126AC(0, &qword_1C990);
  sub_14570();
  uint64_t v21 = (void *)swift_task_alloc();
  v20[43] = v21;
  *uint64_t v21 = v20;
  v21[1] = sub_10638;
  uint64_t v27 = v20[36];
  return AccountStoreProtocol.save(_:)(v20 + 20, v27, &protocol witness table for ACAccountStore, v22, v23, v24, v25, v26, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20);
}

uint64_t sub_FCD8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17)
{
  sub_13498();
  uint64_t v71 = v19;
  uint64_t v20 = *(void **)(v17 + 120);
  if (!v20)
  {
    sub_126AC(0, &qword_1C990);
    sub_14570();
    uint64_t v30 = (void *)swift_task_alloc();
    *(void *)(v17 + 344) = v30;
    void *v30 = v17;
    v30[1] = sub_10638;
LABEL_15:
    sub_12A04();
    return AccountStoreProtocol.save(_:)(v34, v35, v36, v37, v38, v39, v40, v41, a9, a10, a11, a12, a13, a14, a15, a16, a17, v17, v18,
             v71);
  }
  *(void *)(v17 + 128) = v20;
  uint64_t v21 = sub_126AC(0, &qword_1C990);
  id v22 = v20;
  uint64_t v23 = sub_14540();
  uint64_t v25 = v24;
  uint64_t v26 = sub_14540();
  if (!v25)
  {
    if (!v27) {
      goto LABEL_22;
    }
LABEL_12:

    swift_bridgeObjectRelease();
    goto LABEL_13;
  }
  if (!v27) {
    goto LABEL_12;
  }
  if (v23 == v26 && v25 == v27)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_22;
  }
  char v29 = sub_147D0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v29)
  {
LABEL_22:
    char v52 = *(unsigned char *)(v17 + 360);
    uint64_t v54 = *(void *)(v17 + 240);
    uint64_t v53 = *(void *)(v17 + 248);
    sub_14630();
    sub_BC94(&qword_1C978);
    uint64_t v55 = sub_13998();
    sub_127E8(v55);
    *(_OWORD *)(sub_13354() + 16) = xmmword_15220;
    *(void *)(v17 + 40) = sub_BC94(&qword_1C980);
    uint64_t v56 = sub_12810();
    *(void *)(v17 + 16) = v56;
    id v57 = *(void **)(v17 + 136);
    *(void *)(v56 + 16) = v57;
    *(void *)(v56 + 24) = v54;
    *(void *)(v56 + 32) = v53;
    *(unsigned char *)(v56 + 40) = v52;
    swift_retain();
    id v58 = v57;
    id v59 = (id)AMSLogKey();
    if (v59)
    {
      unint64_t v60 = v59;
      sub_146E0();
    }
    sub_145C0();
    swift_bridgeObjectRelease();
    sub_11D24(v17 + 16);
    sub_1295C();
    sub_14660();
    swift_bridgeObjectRelease();
    sub_13168();
    v61();

    swift_task_dealloc();
    swift_task_dealloc();
    sub_130F4();
    sub_12A04();
    return v64(v62, v63, v64, v65, v66, v67, v68, v69, a9, a10, a11, a12);
  }

LABEL_13:
  uint64_t v31 = *(void **)(v17 + 216);
  *(void *)(v17 + 192) = v22;
  id v32 = v22;
  if ([v31 shouldForceOperation])
  {
    *(void *)(v17 + 304) = v21;
    sub_14570();
    uint64_t v33 = (void *)swift_task_alloc();
    *(void *)(v17 + 312) = v33;
    *uint64_t v33 = v17;
    v33[1] = sub_10194;
    goto LABEL_15;
  }

  NSString v42 = sub_146B0();
  NSString v43 = sub_12944();
  (id)AMSError();

  swift_willThrow();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_13524();
  sub_12A04();
  return v45(v44, v45, v46, v47, v48, v49, v50, v51, a9, a10, a11, a12);
}

uint64_t sub_10194()
{
  sub_12864();
  sub_127D0();
  sub_12844();
  *uint64_t v3 = v2;
  uint64_t v4 = *v1;
  sub_12800();
  *uint64_t v5 = v4;
  *(void *)(v6 + 320) = v0;
  swift_task_dealloc();
  sub_12B88();
  return _swift_task_switch(v7, v8, v9);
}

uint64_t sub_10270(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  sub_12864();
  sub_14570();
  uint64_t v21 = (void *)swift_task_alloc();
  *(void *)(v20 + 328) = v21;
  *uint64_t v21 = v20;
  v21[1] = sub_10330;
  uint64_t v27 = *(void *)(v20 + 288);
  return AccountStoreProtocol.save(_:)(v20 + 160, v27, &protocol witness table for ACAccountStore, v22, v23, v24, v25, v26, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20);
}

uint64_t sub_10330()
{
  sub_12864();
  sub_127D0();
  sub_12844();
  *uint64_t v3 = v2;
  uint64_t v4 = *v1;
  sub_12800();
  *uint64_t v5 = v4;
  *(void *)(v6 + 336) = v0;
  swift_task_dealloc();
  sub_12B88();
  return _swift_task_switch(v7, v8, v9);
}

uint64_t sub_1040C()
{
  sub_13148();
  sub_12C78();
  NSString v2 = sub_12CD0();
  NSString v3 = sub_12944();
  sub_14510();
  (id)sub_12FAC();

  swift_willThrow();
  swift_errorRelease();

  swift_task_dealloc();
  swift_task_dealloc();
  sub_131A4();
  sub_13108();
  return v5(v4, v5, v6, v7, v8, v9, v10, v11);
}

uint64_t sub_104E8()
{
  sub_12864();

  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = sub_130F4();
  return v2(v1);
}

uint64_t sub_1055C()
{
  sub_13148();
  sub_12C78();
  NSString v2 = sub_12CD0();
  NSString v3 = sub_12944();
  sub_14510();
  (id)sub_12FAC();

  swift_willThrow();
  swift_errorRelease();

  swift_task_dealloc();
  swift_task_dealloc();
  sub_131A4();
  sub_13108();
  return v5(v4, v5, v6, v7, v8, v9, v10, v11);
}

uint64_t sub_10638()
{
  sub_12864();
  sub_127D0();
  sub_12844();
  *NSString v3 = v2;
  uint64_t v4 = *v1;
  sub_12800();
  *uint64_t v5 = v4;
  *(void *)(v6 + 352) = v0;
  swift_task_dealloc();
  sub_12B88();
  return _swift_task_switch(v7, v8, v9);
}

uint64_t sub_10714()
{
  sub_12864();

  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = sub_130F4();
  return v2(v1);
}

uint64_t sub_10780()
{
  sub_13148();
  sub_12C78();
  NSString v2 = sub_12CD0();
  NSString v3 = sub_12944();
  sub_14510();
  (id)sub_12FAC();

  swift_willThrow();
  swift_errorRelease();

  swift_task_dealloc();
  swift_task_dealloc();
  sub_131A4();
  sub_13108();
  return v5(v4, v5, v6, v7, v8, v9, v10, v11);
}

uint64_t sub_10854()
{
  return sub_14720();
}

void *sub_108E8(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    sub_118A0(0, v1, 0);
    NSString v3 = (id *)(a1 + 32);
    do
    {
      id v4 = *v3;
      swift_getAtKeyPath();

      unint64_t v6 = _swiftEmptyArrayStorage[2];
      unint64_t v5 = _swiftEmptyArrayStorage[3];
      if (v6 >= v5 >> 1) {
        sub_118A0((char *)(v5 > 1), v6 + 1, 1);
      }
      _swiftEmptyArrayStorage[2] = v6 + 1;
      uint64_t v7 = (char *)&_swiftEmptyArrayStorage[2 * v6];
      *((void *)v7 + 4) = v9;
      *((void *)v7 + 5) = v10;
      ++v3;
      --v1;
    }
    while (v1);
  }
  swift_release();
  return _swiftEmptyArrayStorage;
}

id sub_10A04(uint64_t a1, void *a2)
{
  sub_BC94(&qword_1CB00);
  Class isa = sub_14680().super.isa;
  swift_bridgeObjectRelease();
  id v5 = [v2 initWithAuthenticationResults:isa options:a2];

  return v5;
}

uint64_t sub_10A8C(uint64_t a1, uint64_t a2, int *a3)
{
  unint64_t v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  id v4 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v4;
  *id v4 = v3;
  v4[1] = sub_127C4;
  return v6();
}

uint64_t sub_10B5C()
{
  sub_13148();
  sub_12C78();
  uint64_t v0 = swift_task_alloc();
  int64_t v1 = (void *)sub_12EB0(v0);
  *int64_t v1 = v2;
  v1[1] = sub_127C4;
  sub_12C1C();
  sub_13108();
  return v7(v3, v4, v5, v6, v7, v8, v9, v10);
}

uint64_t sub_10BF4(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v5;
  *uint64_t v5 = v4;
  v5[1] = sub_127C4;
  return v7();
}

uint64_t sub_10CC4()
{
  swift_unknownObjectRelease();
  swift_release();
  uint64_t v0 = sub_1360C();
  return _swift_deallocObject(v0);
}

uint64_t sub_10CFC()
{
  sub_12C78();
  uint64_t v0 = swift_task_alloc();
  int64_t v1 = (void *)sub_12E4C(v0);
  *int64_t v1 = v2;
  v1[1] = sub_127C4;
  sub_13508();
  return v3();
}

uint64_t sub_10DB4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_14770();
  if (sub_10F24(a1, 1, v6) == 1)
  {
    sub_11D74(a1, &qword_1C8F0);
  }
  else
  {
    sub_14760();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(a1, v6);
  }
  if (*(void *)(a3 + 16))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_14740();
    swift_unknownObjectRelease();
  }
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = a2;
  *(void *)(v7 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_10F24(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t sub_10F4C(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_11028;
  return v6(a1);
}

uint64_t sub_11028()
{
  sub_12864();
  sub_127D0();
  uint64_t v1 = *v0;
  sub_12800();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  sub_13194();
  return v3();
}

uint64_t sub_110E8()
{
  swift_release();
  return _swift_deallocObject(v0);
}

uint64_t sub_11120()
{
  sub_12F10();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)sub_12E4C(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_127C4;
  uint64_t v3 = sub_132F8();
  return v4(v3);
}

uint64_t sub_111BC()
{
  _Block_release(*(const void **)(v0 + 32));
  uint64_t v1 = sub_1360C();
  return _swift_deallocObject(v1);
}

uint64_t sub_11204()
{
  sub_13148();
  sub_12C78();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)sub_12EB0(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_127C4;
  sub_12C1C();
  sub_13108();
  return v7(v3, v4, v5, v6, v7, v8, v9, v10);
}

uint64_t sub_1129C()
{
  type metadata accessor for AMSAccountMediaType(0);
  swift_arrayDestroy();
  return _swift_deallocClassInstance(v0, 32, 7);
}

unint64_t sub_112FC(uint64_t a1, uint64_t a2)
{
  sub_147E0();
  sub_146F0();
  Swift::Int v4 = sub_147F0();
  return sub_11408(a1, a2, v4);
}

unint64_t sub_11374(uint64_t a1)
{
  sub_146E0();
  sub_147E0();
  sub_146F0();
  Swift::Int v2 = sub_147F0();
  swift_bridgeObjectRelease();
  return sub_114EC(a1, v2);
}

unint64_t sub_11408(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_147D0() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        uint64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_147D0() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_114EC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v5 = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
  {
    uint64_t v6 = sub_146E0();
    uint64_t v8 = v7;
    if (v6 == sub_146E0() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    char v11 = sub_147D0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v11 & 1) == 0)
    {
      uint64_t v12 = ~v4;
      unint64_t v5 = (v5 + 1) & v12;
      if ((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
      {
        while (1)
        {
          uint64_t v13 = sub_146E0();
          uint64_t v15 = v14;
          if (v13 == sub_146E0() && v15 == v16) {
            break;
          }
          char v18 = sub_147D0();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v18 & 1) == 0)
          {
            unint64_t v5 = (v5 + 1) & v12;
            if ((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5)) {
              continue;
            }
          }
          return v5;
        }
        goto LABEL_16;
      }
    }
  }
  return v5;
}

void *sub_11664(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = a4[3];
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
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    sub_BC94(&qword_1C998);
    uint64_t v10 = (void *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    v10[2] = v8;
    v10[3] = 2 * ((uint64_t)(v11 - 32) / 8);
  }
  else
  {
    uint64_t v10 = _swiftEmptyArrayStorage;
  }
  if (v5)
  {
    if (v10 != a4 || &a4[v8 + 4] <= v10 + 4) {
      memmove(v10 + 4, a4 + 4, 8 * v8);
    }
    a4[2] = 0;
  }
  else
  {
    sub_BC94(&qword_1C970);
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_11784(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = a4[3];
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
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    sub_BC94(&qword_1C9D8);
    uint64_t v10 = (void *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    v10[2] = v8;
    v10[3] = 2 * ((uint64_t)(v11 - 32) / 8);
  }
  else
  {
    uint64_t v10 = _swiftEmptyArrayStorage;
  }
  if (v5)
  {
    if (v10 != a4 || &a4[v8 + 4] <= v10 + 4) {
      memmove(v10 + 4, a4 + 4, 8 * v8);
    }
    a4[2] = 0;
  }
  else
  {
    type metadata accessor for AMSAccountMediaType(0);
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_118A0(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_118C0(a1, a2, a3, *v3);
  *uint64_t v3 = result;
  return result;
}

char *sub_118C0(char *result, int64_t a2, char a3, char *a4)
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
    sub_BC94(qword_1CB38);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 16);
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || &v13[16 * v8] <= v12) {
      memmove(v12, v13, 16 * v8);
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

uint64_t sub_119C0(void *a1)
{
  id v1 = [a1 authenticationResults];
  if (!v1) {
    return 0;
  }
  uint64_t v2 = v1;
  sub_BC94(&qword_1CB00);
  uint64_t v3 = sub_14690();

  return v3;
}

uint64_t sub_11A34(void *a1)
{
  id v1 = [a1 signInContexts];
  if (!v1) {
    return 0;
  }
  uint64_t v2 = v1;
  type metadata accessor for AIDAServiceType(0);
  sub_126E8();
  uint64_t v3 = sub_14690();

  return v3;
}

uint64_t sub_11AAC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  uint64_t v18 = *(void *)a2;
  uint64_t v19 = *(void *)(a2 + 8);
  uint64_t v20 = *(void *)(a2 + 16);
  uint64_t v21 = *(unsigned __int8 *)(a2 + 24);
  uint64_t v22 = (void *)swift_task_alloc();
  *(void *)(v16 + 16) = v22;
  *uint64_t v22 = v16;
  v22[1] = sub_127C0;
  return sub_BD00(a1, v18, v19, v20, v21, v23, v24, v25, a9, a10, a11, a12, a13, a14, a15, a16);
}

uint64_t sub_11B70()
{
  sub_12F10();
  uint64_t v0 = swift_task_alloc();
  id v1 = (void *)sub_12EB0(v0);
  *id v1 = v2;
  v1[1] = sub_11C14;
  uint64_t v3 = sub_138D0();
  return v4(v3);
}

uint64_t sub_11C14()
{
  sub_12864();
  uint64_t v2 = v1;
  sub_127D0();
  uint64_t v3 = *v0;
  sub_12800();
  *uint64_t v4 = v3;
  swift_task_dealloc();
  char v5 = *(uint64_t (**)(uint64_t))(v3 + 8);
  return v5(v2);
}

uint64_t sub_11CE4()
{
  swift_release();
  return _swift_deallocObject(v0);
}

uint64_t sub_11D24(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_11D74(uint64_t a1, uint64_t *a2)
{
  sub_BC94(a2);
  sub_129D4();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
}

uint64_t *sub_11DCC(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t sub_11E34(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(void *)(v5 + 16) = a1;
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v5 + 24) = v10;
  *uint64_t v10 = v5;
  v10[1] = sub_11EEC;
  return sub_EC84(a2, a3, a4, a5);
}

uint64_t sub_11EEC()
{
  sub_12864();
  uint64_t v2 = v1;
  sub_127D0();
  uint64_t v4 = *(void **)(v3 + 16);
  uint64_t v5 = *v0;
  sub_12800();
  *uint64_t v6 = v5;
  swift_task_dealloc();
  *uint64_t v4 = v2;
  sub_13518();
  return v7();
}

uint64_t sub_11FC8()
{
  sub_12C78();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v5 = *(void *)(v0 + 24);
  uint64_t v6 = *(void *)(v0 + 32);
  uint64_t v7 = *(unsigned __int8 *)(v0 + 16);
  uint64_t v8 = swift_task_alloc();
  uint64_t v9 = (void *)sub_12E4C(v8);
  *uint64_t v9 = v10;
  v9[1] = sub_127C4;
  size_t v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)&dword_1C9A8 + dword_1C9A8);
  return v11(v4, v2, v7, v5, v6);
}

uint64_t sub_1208C(uint64_t a1, int *a2)
{
  *(void *)(v2 + 24) = a1;
  uint64_t v5 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v2 + 32) = v3;
  *uint64_t v3 = v2;
  v3[1] = sub_1216C;
  return v5(v2 + 16);
}

uint64_t sub_1216C()
{
  sub_12F10();
  uint64_t v1 = *v0;
  uint64_t v2 = *(void **)(*v0 + 24);
  uint64_t v3 = *v0;
  sub_12800();
  *uint64_t v4 = v3;
  swift_task_dealloc();
  *uint64_t v2 = *(void *)(v1 + 16);
  uint64_t v5 = *(uint64_t (**)(void))(v3 + 8);
  return v5();
}

uint64_t sub_12290()
{
  swift_unknownObjectRelease();
  swift_release();

  return _swift_deallocObject(v0);
}

uint64_t sub_122D8()
{
  sub_12C78();
  uint64_t v1 = *(void *)(v0 + 40);
  uint64_t v2 = *(void *)(v0 + 48);
  uint64_t v3 = swift_task_alloc();
  uint64_t v4 = (void *)sub_12E4C(v3);
  *uint64_t v4 = v5;
  v4[1] = sub_1238C;
  sub_13508();
  return sub_141F4(v6, v7, v8, v9, v1, v2);
}

uint64_t sub_1238C()
{
  sub_12864();
  sub_127D0();
  uint64_t v1 = *v0;
  sub_12800();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  sub_13518();
  return v3();
}

uint64_t sub_1244C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_BC94(&qword_1C8F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_124B4()
{
  sub_12F10();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)sub_12E4C(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_1238C;
  uint64_t v3 = sub_132F8();
  return v4(v3);
}

uint64_t sub_1254C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_12594(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_1254C(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_125D8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_12634(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_BC94(&qword_1CA20);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

_OWORD *sub_1269C(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_126AC(uint64_t a1, unint64_t *a2)
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

unint64_t sub_126E8()
{
  unint64_t result = qword_1C780;
  if (!qword_1C780)
  {
    type metadata accessor for AIDAServiceType(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1C780);
  }
  return result;
}

uint64_t sub_1273C()
{
  return 48;
}

__n128 sub_12748(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a1;
  long long v3 = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(a2 + 16) = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(a2 + 32) = v3;
  *(__n128 *)a2 = result;
  return result;
}

unint64_t sub_1275C()
{
  unint64_t result = qword_1CB28;
  if (!qword_1CB28)
  {
    sub_126AC(255, &qword_1C948);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1CB28);
  }
  return result;
}

uint64_t sub_127E8(uint64_t a1)
{
  return a1 - 8;
}

uint64_t sub_12810()
{
  return swift_allocObject();
}

uint64_t sub_12850()
{
  return 1;
}

uint64_t sub_12870()
{
  return sub_145C0();
}

uint64_t sub_128E0()
{
  return v0 + 1;
}

NSString sub_12944()
{
  return sub_146B0();
}

uint64_t sub_1295C()
{
  return sub_14580();
}

uint64_t sub_12974()
{
  return sub_14580();
}

uint64_t sub_12994()
{
  return sub_E3A0(v0, 0x17uLL, 2);
}

uint64_t sub_129C0()
{
  return 0;
}

uint64_t sub_129E0()
{
  return sub_145C0();
}

uint64_t sub_12A20()
{
  return sub_14630();
}

uint64_t sub_12A7C()
{
  return sub_14630();
}

uint64_t sub_12AA4()
{
  return sub_14630();
}

uint64_t sub_12AF0()
{
  return sub_14630();
}

uint64_t sub_12B3C()
{
  return sub_145C0();
}

uint64_t sub_12C1C()
{
  return v0;
}

void *sub_12C3C()
{
  int64_t v2 = v0[2] + 1;
  return sub_11664(0, v2, 1, v0);
}

void sub_12C60(uint64_t a1@<X8>)
{
  v1[84] = a1;
  v1[86] = *(void *)(v1[82] + 8 * a1 + 32);
}

uint64_t sub_12C84()
{
  return sub_145D0();
}

uint64_t sub_12C9C()
{
  return swift_allocObject();
}

uint64_t sub_12CB4(uint64_t a1)
{
  *(void *)(a1 + 32) = v1;
  *(unsigned char *)(a1 + 40) = v2;
  return swift_retain();
}

NSString sub_12CD0()
{
  return sub_146B0();
}

uint64_t sub_12D14()
{
  return swift_getErrorValue();
}

uint64_t sub_12D6C()
{
  return sub_14630();
}

NSString sub_12DA0()
{
  return sub_146B0();
}

uint64_t sub_12DC0()
{
  *(void *)(v2 + 176) = v0;
  *(void *)(v2 + 184) = (v1 - 32) | 0x8000000000000000;
  return sub_14590();
}

uint64_t sub_12DE0()
{
  *(void *)(v1 + 336) = v0;
  *(void *)(v1 + 344) = (v2 - 32) | 0x8000000000000000;
  return sub_14590();
}

void sub_12E00()
{
  *(void *)(v1 + 360) = v0;
}

uint64_t sub_12E14()
{
  return _AMSErrorWithMultipleUnderlyingErrors(15, v0, v1, v2);
}

uint64_t sub_12E34(uint64_t a1)
{
  return sub_E3A0(a1, 0x15uLL, 2);
}

uint64_t sub_12E4C(uint64_t result)
{
  *(void *)(v1 + 16) = result;
  return result;
}

uint64_t sub_12E5C(uint64_t a1)
{
  *(void *)(a1 + 32) = v1;
  *(unsigned char *)(a1 + 40) = v2;
  return swift_retain();
}

__n128 *sub_12E78(__n128 *result, __n128 a2)
{
  result[1] = a2;
  result[2].n128_u64[0] = 0x5465636976726573;
  result[2].n128_u64[1] = 0xEB00000000657079;
  return result;
}

uint64_t sub_12EA0(uint64_t result)
{
  *(void *)(v1 + 704) = result;
  return result;
}

uint64_t sub_12EB0(uint64_t result)
{
  *(void *)(v1 + 16) = result;
  return result;
}

uint64_t sub_12EBC()
{
  return sub_145C0();
}

uint64_t sub_12EF8(uint64_t a1)
{
  return sub_E3A0(a1, 0x17uLL, 2);
}

uint64_t sub_12F1C()
{
  return swift_getErrorValue();
}

uint64_t sub_12F50()
{
  return swift_getErrorValue();
}

uint64_t sub_12FAC()
{
  return AMSError();
}

__n128 sub_12FD0()
{
  return v0[45];
}

void sub_12FF4()
{
}

uint64_t sub_1300C()
{
  return *(void *)(v0 + 16);
}

uint64_t sub_13030()
{
  void (*v2)(long long *__return_ptr, id *, uint64_t, id);
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  char v2 = (void (*)(long long *__return_ptr, id *, uint64_t, id))v0[53];
  uint64_t v3 = v0[50];
  uint64_t v4 = v0[51];
  uint64_t v6 = v0[47];
  uint64_t v5 = (void *)v0[48];
  uint64_t v7 = v0[46];
  uint64_t v8 = v0[36];
  return sub_E058(v5, v6, v7, v3, v4, v8, v2);
}

void *sub_13060(void *a1, int64_t a2)
{
  return sub_11664(a1, a2, 1, v2);
}

uint64_t sub_13078(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10)
{
  *(void *)(v10 + 240) = a1;
  *(void *)(a1 + 16) = *(void *)(v10 + 544);
  *(void *)(a1 + 24) = a9;
  *(void *)(a1 + 32) = v11;
  *(unsigned char *)(a1 + 40) = a10;
  return swift_retain();
}

uint64_t sub_130A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11)
{
  *(void *)(v11 + 240) = a1;
  *(void *)(a1 + 16) = *(void *)(v11 + 544);
  *(void *)(a1 + 24) = a10;
  *(void *)(a1 + 32) = v12;
  *(unsigned char *)(a1 + 40) = a11;
  return swift_retain();
}

uint64_t sub_130D8()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_130F4()
{
  return v0;
}

id sub_1311C@<X0>(uint64_t a1@<X8>)
{
  *(void *)(v2 + 48) = *(void *)(a1 + 16);
  return v1;
}

uint64_t sub_1315C(uint64_t a1)
{
  return _swift_task_switch(a1, 0, 0);
}

uint64_t sub_13178()
{
  return AMSError();
}

uint64_t sub_13194()
{
  return v0 + 8;
}

uint64_t sub_131A4()
{
  return v0 + 8;
}

uint64_t *sub_131B4()
{
  *(void *)(v1 + 392) = *(void *)(v1 + 496);
  return sub_11DCC(v0);
}

uint64_t sub_131D0()
{
  *(void *)(v1 + 408) = 0xD000000000000015;
  *(void *)(v1 + 416) = (v0 - 32) | 0x8000000000000000;
  return sub_14590();
}

id sub_131FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, long long a11, char a12)
{
  *(void *)(v12 + 376) = a1;
  *(_OWORD *)(a1 + 16) = a11;
  *(void *)(a1 + 32) = v13;
  *(unsigned char *)(a1 + 40) = a12;
  return (id)a11;
}

id sub_13234(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,long long a21)
{
  *(void *)(v21 + 504) = a1;
  *(_OWORD *)(a1 + 16) = a21;
  *(void *)(a1 + 32) = v22;
  *(unsigned char *)(a1 + 40) = v23;
  return (id)a21;
}

id sub_1325C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, long long a17)
{
  *(void *)(v18 + 504) = a1;
  *(_OWORD *)(a1 + 16) = a17;
  *(void *)(a1 + 32) = v17;
  *(unsigned char *)(a1 + 40) = v19;
  return (id)a17;
}

void sub_13290()
{
}

uint64_t sub_132A8()
{
  return swift_getErrorValue();
}

uint64_t sub_132D0()
{
  *(void *)(v1 + 472) = 0xD000000000000015;
  *(void *)(v1 + 480) = (v0 - 32) | 0x8000000000000000;
  return sub_14590();
}

uint64_t sub_132F8()
{
  return v0;
}

NSArray sub_13314()
{
  return sub_14730();
}

uint64_t sub_1332C()
{
  *(void *)(v0 + 472) = 0xD000000000000015;
  *(void *)(v0 + 480) = (v1 - 32) | 0x8000000000000000;
  return sub_14590();
}

uint64_t sub_13354()
{
  return swift_allocObject();
}

id sub_1336C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, long long a19)
{
  *(void *)(v19 + 536) = a1;
  *(_OWORD *)(a1 + 16) = a19;
  *(void *)(a1 + 32) = v20;
  *(unsigned char *)(a1 + 40) = v21;
  return (id)a19;
}

uint64_t sub_13394()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_133B8()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_1340C()
{
  return swift_task_dealloc();
}

uint64_t *sub_13440(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t *a19)
{
  *(void *)(v19 + 464) = *(void *)(v19 + 640);
  return sub_11DCC(a19);
}

uint64_t sub_13464()
{
  return v0;
}

uint64_t sub_134B4()
{
  return v0;
}

uint64_t sub_134CC()
{
  return v0;
}

uint64_t sub_134E4()
{
  return sub_145C0();
}

uint64_t sub_13518()
{
  return v0 + 8;
}

uint64_t sub_13524()
{
  return v0 + 8;
}

uint64_t sub_13534()
{
  *(void *)(v2 + 272) = v0;
  *(void *)(v2 + 280) = (v1 - 32) | 0x8000000000000000;
  return sub_14590();
}

uint64_t sub_13558()
{
  *(void *)(v2 + 272) = v0;
  *(void *)(v2 + 280) = (v1 - 32) | 0x8000000000000000;
  return sub_14590();
}

uint64_t sub_1357C()
{
  *(void *)(v1 + 576) = (v0 - 32) | 0x8000000000000000;
  return sub_14590();
}

void sub_135A0()
{
  *(void *)(v1 + 408) = 0xD000000000000015;
  *(void *)(v1 + 416) = (v0 - 32) | 0x8000000000000000;
}

uint64_t sub_135B8()
{
  return v0;
}

uint64_t sub_135D0()
{
  return v0;
}

uint64_t *sub_135E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t *a21)
{
  *(void *)(v21 + 464) = *(void *)(v21 + 640);
  return sub_11DCC(a21);
}

uint64_t sub_1360C()
{
  return v0;
}

uint64_t sub_1361C()
{
  return v0;
}

uint64_t sub_13640()
{
  return swift_setDeallocating();
}

uint64_t sub_13660()
{
  return swift_setDeallocating();
}

__n128 *sub_13680(__n128 *result, __n128 a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  result[1] = a2;
  *(void *)(v11 + 400) = a11;
  return result;
}

uint64_t sub_13694()
{
  return swift_bridgeObjectRelease();
}

void sub_136AC()
{
}

void sub_136C4()
{
}

uint64_t sub_136DC()
{
  return 0;
}

uint64_t sub_136F0()
{
  return _AMSErrorWithMultipleUnderlyingErrors(100, v1, v2, v0);
}

uint64_t sub_13710()
{
  return _AMSErrorWithMultipleUnderlyingErrors(100, v2, v0, v1);
}

NSString sub_13730()
{
  return sub_146B0();
}

uint64_t sub_13750()
{
  return v0 + 28;
}

uint64_t sub_1375C()
{
  return v0;
}

uint64_t *sub_13770()
{
  *(void *)(v1 + 624) = *(void *)(v1 + 664);
  return sub_11DCC(v0);
}

void sub_1379C()
{
  uint64_t v6 = *(void **)(v3 + 688);
  *(void *)(v0 + 16) = v2;
  *(void *)(v0 + 32 + 8 * v4) = v1;
}

uint64_t sub_137BC()
{
  return 0x1000000000000030;
}

uint64_t sub_137D0()
{
  return v0;
}

uint64_t *sub_137E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t *a16)
{
  *(void *)(v16 + 328) = *(void *)(v16 + 472);
  return sub_11DCC(a16);
}

uint64_t *sub_13804(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t *a15)
{
  *(void *)(v15 + 328) = *(void *)(v15 + 472);
  return sub_11DCC(a15);
}

void sub_13824()
{
  *(void *)(v1 + 592) = v0;
  *(void *)(v1 + 568) = 0xD000000000000015;
}

uint64_t sub_13838()
{
  return swift_getErrorValue();
}

uint64_t sub_13858()
{
  return swift_getErrorValue();
}

uint64_t sub_13878()
{
  return sub_14580();
}

uint64_t sub_13898()
{
  *(void *)(v1 + 576) = (v0 - 32) | 0x8000000000000000;
  return sub_14590();
}

uint64_t sub_138B8()
{
  return sub_14590();
}

uint64_t sub_138D0()
{
  return v0;
}

uint64_t sub_138DC()
{
  return sub_11D74(v0, v1);
}

uint64_t sub_138F4()
{
  return sub_14650();
}

uint64_t sub_1390C()
{
  return sub_14660();
}

__n128 sub_13924(__n128 *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, __n128 a11)
{
  *(void *)(v12 + 376) = a1;
  __n128 result = a11;
  a1[1] = a11;
  a1[2].n128_u64[0] = v11;
  return result;
}

uint64_t sub_13944()
{
  return v0 + 30;
}

id sub_13978@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *(void **)(v1 + a1);
  return v3;
}

uint64_t sub_13998()
{
  return sub_145D0();
}

uint64_t *sub_139B0()
{
  *(void *)(v0 + 624) = *(void *)(v0 + 664);
  return sub_11DCC(v1);
}

uint64_t sub_139D0()
{
  return sub_11D74(v0, v1);
}

uint64_t sub_139E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_allocateGenericValueMetadata(a1, a2, a3, 64);
}

uint64_t sub_139F0()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_13A98(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = a1;
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  int v7 = *(_DWORD *)(v5 + 80);
  if ((v7 & 0x1000F8) != 0 || ((v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 17 > 0x18)
  {
    uint64_t v9 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (uint64_t *)(v9 + ((unsigned __int16)((v7 & 0xF8) + 23) & (unsigned __int16)~(v7 & 0xF8) & 0x1F8));
  }
  else
  {
    (*(void (**)(uint64_t *, uint64_t *))(v5 + 16))(a1, a2);
    unint64_t v10 = ((unint64_t)v4 + v6 + 7) & 0xFFFFFFFFFFFFFFF8;
    unint64_t v11 = ((unint64_t)a2 + v6 + 7) & 0xFFFFFFFFFFFFFFF8;
    uint64_t v12 = *(void *)(v11 + 8);
    *(void *)unint64_t v10 = *(void *)v11;
    *(void *)(v10 + 8) = v12;
    *(unsigned char *)(v10 + 16) = *(unsigned char *)(v11 + 16);
  }
  swift_retain();
  return v4;
}

uint64_t sub_13B98(uint64_t a1, uint64_t a2)
{
  (*(void (**)(void))(*(void *)(*(void *)(a2 + 16) - 8) + 8))();
  return swift_release();
}

uint64_t sub_13C08(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 16;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 48) + 7;
  unint64_t v7 = (v6 + a1) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v8 = (v6 + a2) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v9 = *(void *)(v8 + 8);
  *(void *)unint64_t v7 = *(void *)v8;
  *(void *)(v7 + 8) = v9;
  *(unsigned char *)(v7 + 16) = *(unsigned char *)(v8 + 16);
  swift_retain();
  return a1;
}

uint64_t sub_13C90(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 24;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 40) + 7;
  unint64_t v7 = (v6 + a1) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v8 = (v6 + a2) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v9 = *(void *)(v8 + 8);
  *(void *)unint64_t v7 = *(void *)v8;
  *(void *)(v7 + 8) = v9;
  swift_retain();
  swift_release();
  *(unsigned char *)(v7 + 16) = *(unsigned char *)(v8 + 16);
  return a1;
}

uint64_t sub_13D24(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 32;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 32) + 7;
  unint64_t v7 = (v6 + a1) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v8 = (v6 + a2) & 0xFFFFFFFFFFFFFFF8;
  *(_OWORD *)unint64_t v7 = *(_OWORD *)v8;
  *(unsigned char *)(v7 + 16) = *(unsigned char *)(v8 + 16);
  return a1;
}

uint64_t sub_13DA8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 40;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 24) + 7;
  unint64_t v7 = (v6 + a1) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v8 = (v6 + a2) & 0xFFFFFFFFFFFFFFF8;
  *(_OWORD *)unint64_t v7 = *(_OWORD *)v8;
  swift_release();
  *(unsigned char *)(v7 + 16) = *(unsigned char *)(v8 + 16);
  return a1;
}

uint64_t sub_13E34(unsigned __int8 *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a3 + 16);
  uint64_t v5 = *(unsigned int *)(*(void *)(v4 - 8) + 84);
  uint64_t v6 = *(void *)(*(void *)(v4 - 8) + 64);
  if (v5 <= 0x7FFFFFFF) {
    unsigned int v7 = 0x7FFFFFFF;
  }
  else {
    unsigned int v7 = *(_DWORD *)(*(void *)(v4 - 8) + 84);
  }
  if (!a2) {
    return 0;
  }
  if (v7 < a2)
  {
    unint64_t v8 = ((v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 17;
    unsigned int v9 = (a2 - v7 + 255) >> (8 * v8);
    if (v8 < 4) {
      unsigned int v10 = v9 + 1;
    }
    else {
      unsigned int v10 = 2;
    }
    if (v10 >= 0x10000) {
      unsigned int v11 = 4;
    }
    else {
      unsigned int v11 = 2;
    }
    if (v10 < 0x100) {
      unsigned int v11 = 1;
    }
    if (v10 >= 2) {
      uint64_t v12 = v11;
    }
    else {
      uint64_t v12 = 0;
    }
    switch(v12)
    {
      case 1:
        int v13 = a1[v8];
        if (!a1[v8]) {
          break;
        }
        goto LABEL_22;
      case 2:
        int v13 = *(unsigned __int16 *)&a1[v8];
        if (*(_WORD *)&a1[v8]) {
          goto LABEL_22;
        }
        break;
      case 3:
        __break(1u);
        JUMPOUT(0x13F8CLL);
      case 4:
        int v13 = *(_DWORD *)&a1[v8];
        if (!v13) {
          break;
        }
LABEL_22:
        int v15 = (v13 - 1) << (8 * v8);
        if (v8 >= 4) {
          int v15 = 0;
        }
        if (((v6 + 7) & 0xFFFFFFF8) == 0xFFFFFFF0) {
          int v16 = *a1;
        }
        else {
          int v16 = *(_DWORD *)a1;
        }
        return v7 + (v16 | v15) + 1;
      default:
        break;
    }
  }
  if (v5 >= 0x7FFFFFFF) {
    return sub_10F24((uint64_t)a1, v5, v4);
  }
  unint64_t v17 = *(void *)((unint64_t)&a1[v6 + 7] & 0xFFFFFFFFFFFFFFF8);
  if (v17 >= 0xFFFFFFFF) {
    LODWORD(v17) = -1;
  }
  return (v17 + 1);
}

void sub_13FA0(char *a1, uint64_t a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(a4 + 16);
  uint64_t v7 = *(unsigned int *)(*(void *)(v6 - 8) + 84);
  if (v7 <= 0x7FFFFFFF) {
    unsigned int v8 = 0x7FFFFFFF;
  }
  else {
    unsigned int v8 = *(_DWORD *)(*(void *)(v6 - 8) + 84);
  }
  uint64_t v9 = *(void *)(*(void *)(v6 - 8) + 64);
  size_t v10 = ((v9 + 7) & 0xFFFFFFFFFFFFFFF8) + 17;
  char v11 = 8 * v10;
  if (v8 >= a3)
  {
    int v15 = 0;
  }
  else
  {
    unsigned int v12 = (a3 - v8 + 255) >> v11;
    if (v10 <= 3) {
      unsigned int v13 = v12 + 1;
    }
    else {
      unsigned int v13 = 2;
    }
    if (v13 >= 0x10000) {
      int v14 = 4;
    }
    else {
      int v14 = 2;
    }
    if (v13 < 0x100) {
      int v14 = 1;
    }
    if (v13 >= 2) {
      int v15 = v14;
    }
    else {
      int v15 = 0;
    }
  }
  if (v8 < a2)
  {
    unsigned int v16 = ~v8 + a2;
    unsigned int v17 = (~(_BYTE)v8 + a2);
    if (v10 < 4) {
      int v18 = (v16 >> v11) + 1;
    }
    else {
      int v18 = 1;
    }
    if (v10 >= 4) {
      unsigned int v19 = v16;
    }
    else {
      unsigned int v19 = v17;
    }
    bzero(a1, v10);
    if (v10 == 1) {
      *a1 = v19;
    }
    else {
      *(_DWORD *)a1 = v19;
    }
    switch(v15)
    {
      case 1:
        a1[v10] = v18;
        return;
      case 2:
        *(_WORD *)&a1[v10] = v18;
        return;
      case 3:
        goto LABEL_47;
      case 4:
        *(_DWORD *)&a1[v10] = v18;
        return;
      default:
        return;
    }
  }
  switch(v15)
  {
    case 1:
      a1[v10] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_34;
    case 2:
      *(_WORD *)&a1[v10] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_34;
    case 3:
LABEL_47:
      __break(1u);
      JUMPOUT(0x141A0);
    case 4:
      *(_DWORD *)&a1[v10] = 0;
      goto LABEL_33;
    default:
LABEL_33:
      if (a2)
      {
LABEL_34:
        if (v7 < 0x7FFFFFFF)
        {
          uint64_t v20 = (void *)((unint64_t)&a1[v9 + 7] & 0xFFFFFFFFFFFFFFF8);
          if ((a2 & 0x80000000) != 0)
          {
            uint64_t v21 = a2 ^ 0x80000000;
            v20[1] = 0;
          }
          else
          {
            uint64_t v21 = (a2 - 1);
          }
          void *v20 = v21;
        }
        else
        {
          sub_BCD8((uint64_t)a1, a2, v7, v6);
        }
      }
      return;
  }
}

uint64_t type metadata accessor for MediaServiceOwner(uint64_t a1, uint64_t a2)
{
  return _swift_getGenericMetadata(a1, a2, &nominal type descriptor for MediaServiceOwner);
}

uint64_t sub_141E0(uint64_t a1, uint64_t a2)
{
  return *(void *)(*(void *)(a2 + 40) + 8);
}

uint64_t sub_141EC(uint64_t a1, uint64_t a2)
{
  return *(void *)(a2 + 48);
}

uint64_t sub_141F4(uint64_t a1, uint64_t a2, uint64_t a3, int *a4, uint64_t a5, uint64_t a6)
{
  v6[2] = a1;
  v6[3] = a6;
  size_t v10 = (uint64_t (*)(uint64_t))((char *)a4 + *a4);
  unsigned int v8 = (void *)swift_task_alloc();
  v6[4] = v8;
  *unsigned int v8 = v6;
  v8[1] = sub_142D4;
  return v10(a6);
}

uint64_t sub_142D4(char a1)
{
  *(unsigned char *)(*(void *)v1 + 40) = a1;
  swift_task_dealloc();
  return _swift_task_switch(sub_143D4, 0, 0);
}

uint64_t sub_143D4()
{
  if (*(unsigned char *)(v0 + 40) == 1)
  {
    uint64_t v1 = *(void **)(v0 + 24);
    id v2 = v1;
  }
  else
  {
    uint64_t v1 = 0;
  }
  **(void **)(v0 + 16) = v1;
  uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

uint64_t sub_14450(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = v3;
  return _swift_task_switch(sub_14474, 0, 0);
}

uint64_t sub_14474()
{
  uint64_t v1 = *(void **)(v0 + 24);
  **(void **)(v0 + 16) = v1;
  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  id v2 = v1;
  return v4();
}

uint64_t sub_144E0()
{
  return PersonNameComponents.init(namePrefix:givenName:middleName:familyName:nameSuffix:nickname:phoneticRepresentation:)();
}

Class sub_144F0()
{
  return PersonNameComponents._bridgeToObjectiveC()().super.isa;
}

uint64_t sub_14500()
{
  return type metadata accessor for PersonNameComponents();
}

uint64_t sub_14510()
{
  return _convertErrorToNSError(_:)();
}

uint64_t sub_14520()
{
  return dispatch thunk of AccountProtocol.accountType.getter();
}

uint64_t sub_14530()
{
  return dispatch thunk of AccountProtocol.dsid.getter();
}

uint64_t sub_14540()
{
  return dispatch thunk of AccountProtocol.altDSID.getter();
}

uint64_t sub_14550()
{
  return dispatch thunk of AccountProtocol.lastName.getter();
}

uint64_t sub_14560()
{
  return dispatch thunk of AccountProtocol.firstName.getter();
}

uint64_t sub_14570()
{
  return dispatch thunk of AccountProtocol.setActive(_:for:)();
}

uint64_t sub_14580()
{
  return LogInterpolation.init(stringLiteral:)();
}

uint64_t sub_14590()
{
  return static LogInterpolation.traceableSensitive(_:)();
}

uint64_t sub_145A0()
{
  return static LogInterpolation.safe(_:)();
}

uint64_t sub_145B0()
{
  return static LogInterpolation.prefix<A>(_:_:)();
}

uint64_t sub_145C0()
{
  return static LogInterpolation.prefix(_:_:)();
}

uint64_t sub_145D0()
{
  return type metadata accessor for LogInterpolation();
}

uint64_t sub_14610()
{
  return SynchronousAccountStoreProtocol.activeiTunesAccount(for:)();
}

uint64_t sub_14620()
{
  return SynchronousAccountStoreProtocol.iTunesAccount(with:dsid:username:)();
}

uint64_t sub_14630()
{
  return static Log.mediaServiceOwner.getter();
}

uint64_t sub_14640()
{
  return Log.debug(_:)();
}

uint64_t sub_14650()
{
  return Log.error(_:)();
}

uint64_t sub_14660()
{
  return Log.default(_:)();
}

uint64_t sub_14670()
{
  return type metadata accessor for Log();
}

NSDictionary sub_14680()
{
  return Dictionary._bridgeToObjectiveC()();
}

uint64_t sub_14690()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_146A0()
{
  return Dictionary.init(dictionaryLiteral:)();
}

NSString sub_146B0()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_146C0()
{
  return static String._forceBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_146D0()
{
  return static String._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_146E0()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_146F0()
{
  return String.hash(into:)();
}

uint64_t sub_14700()
{
  return String.append<A>(contentsOf:)();
}

uint64_t sub_14710()
{
  return String.init<A>(_:)();
}

uint64_t sub_14720()
{
  return dispatch thunk of RawRepresentable.rawValue.getter();
}

NSArray sub_14730()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_14740()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_14760()
{
  return TaskPriority.rawValue.getter();
}

uint64_t sub_14770()
{
  return type metadata accessor for TaskPriority();
}

uint64_t sub_14780()
{
  return dispatch thunk of AsyncSequence.makeAsyncIterator()();
}

uint64_t sub_147B0()
{
  return AsyncCompactMapSequence.init(_:transform:)();
}

uint64_t sub_147C0()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t sub_147D0()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_147E0()
{
  return Hasher.init(_seed:)();
}

Swift::Int sub_147F0()
{
  return Hasher._finalize()();
}

uint64_t AMSError()
{
  return _AMSError();
}

uint64_t AMSLogKey()
{
  return _AMSLogKey();
}

uint64_t AMSSetLogKeyIfNeeded()
{
  return _AMSSetLogKeyIfNeeded();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_release(const void *aBlock)
{
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return __swift_stdlib_reportUnimplementedInitializer();
}

void bzero(void *a1, size_t a2)
{
}

size_t malloc_size(const void *ptr)
{
  return _malloc_size(ptr);
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
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

uint64_t swift_checkMetadataState()
{
  return _swift_checkMetadataState();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_errorRetain()
{
  return _swift_errorRetain();
}

uint64_t swift_getAssociatedConformanceWitness()
{
  return _swift_getAssociatedConformanceWitness();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return _swift_getAssociatedTypeWitness();
}

uint64_t swift_getAtKeyPath()
{
  return _swift_getAtKeyPath();
}

uint64_t swift_getErrorValue()
{
  return _swift_getErrorValue();
}

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
}

uint64_t swift_getKeyPath()
{
  return _swift_getKeyPath();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return _swift_getObjCClassFromMetadata();
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

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return _swift_getTypeByMangledNameInContextInMetadataState2();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}

uint64_t swift_initStackObject()
{
  return _swift_initStackObject();
}

uint64_t swift_initStructMetadata()
{
  return _swift_initStructMetadata();
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

uint64_t swift_setDeallocating()
{
  return _swift_setDeallocating();
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