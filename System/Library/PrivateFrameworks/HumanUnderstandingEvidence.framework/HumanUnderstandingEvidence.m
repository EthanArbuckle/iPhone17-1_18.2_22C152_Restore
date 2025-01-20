void type metadata accessor for RPProximity(uint64_t a1)
{
  sub_1C7B1D738(a1, &qword_1EA4F7BF0);
}

void type metadata accessor for RPPersonFlags(uint64_t a1)
{
}

void type metadata accessor for RPActivityLevel(uint64_t a1)
{
}

void sub_1C7B1D738(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

_DWORD *sub_1C7B1D780@<X0>(_DWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_DWORD *)a2 = *result;
  *(unsigned char *)(a2 + 4) = 0;
  return result;
}

void sub_1C7B1D790(_DWORD *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_1C7B1D79C@<X0>(unsigned int *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = sub_1C7B1D7D0(*a1);
  *(_DWORD *)a2 = result;
  *(unsigned char *)(a2 + 4) = BYTE4(result) & 1;
  return result;
}

uint64_t sub_1C7B1D7D0(uint64_t result)
{
  return result;
}

uint64_t sub_1C7B1D7EC@<X0>(_DWORD *a1@<X8>)
{
  uint64_t result = nullsub_1(*v1);
  *a1 = result;
  return result;
}

uint64_t sub_1C7B1D824()
{
  uint64_t v0 = sub_1C7B223C0();
  sub_1C7B1D89C(v0, qword_1EA4F8670);
  sub_1C7B1D900(v0, (uint64_t)qword_1EA4F8670);
  return sub_1C7B223B0();
}

uint64_t *sub_1C7B1D89C(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_1C7B1D900(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

void sub_1C7B1D938()
{
  qword_1EA4F8688 = 0x6944656C706F6550;
  unk_1EA4F8690 = 0xEF797265766F6373;
}

uint64_t PeopleDiscoveryBiomeStream.identifier.getter()
{
  id v1 = objc_msgSend(*v0, sel_identifier);
  uint64_t v2 = sub_1C7B22400();

  return v2;
}

id PeopleDiscoveryBiomeStream.init()@<X0>(void *a1@<X8>)
{
  uint64_t v2 = self;
  sub_1C7B1DE50(0xD000000000000033, 0x80000001C7B235F0, v2);
  if (qword_1EA4F7BE8 != -1) {
    swift_once();
  }
  id v3 = objc_allocWithZone(MEMORY[0x1E4F50490]);
  swift_bridgeObjectRetain();
  id result = sub_1C7B1DED4();
  *a1 = result;
  return result;
}

id PeopleDiscoveryBiomeStream.init(basePath:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  v6 = self;
  sub_1C7B1DE50(a1, a2, v6);
  if (qword_1EA4F7BE8 != -1) {
    swift_once();
  }
  id v7 = objc_allocWithZone(MEMORY[0x1E4F50490]);
  swift_bridgeObjectRetain();
  id result = sub_1C7B1DED4();
  *a3 = result;
  return result;
}

id PeopleDiscoveryBiomeStream.source()()
{
  id v1 = objc_msgSend(*v0, sel_source);
  return v1;
}

id PeopleDiscoveryBiomeStream.publisher(fromStartTime:)()
{
  id v1 = objc_msgSend(*v0, sel_publisherFromStartTime_);
  return v1;
}

id PeopleDiscoveryBiomeStream.publisher(withStartTime:endTime:maxEvents:lastN:reversed:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  id v6 = objc_msgSend(*v5, sel_publisherWithStartTime_endTime_maxEvents_lastN_reversed_, a1, a2, a3, a4, a5 & 1);
  return v6;
}

Swift::Void __swiftcall PeopleDiscoveryBiomeStream.clearAllData()()
{
  id v1 = *v0;
  v7[4] = sub_1C7B1DD8C;
  v7[5] = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 1107296256;
  v7[2] = sub_1C7B1DD90;
  v7[3] = &unk_1F2239128;
  uint64_t v2 = _Block_copy(v7);
  swift_release();
  objc_msgSend(v1, sel_pruneWithPredicateBlock_, v2);
  _Block_release(v2);
  if (swift_isEscapingClosureAtFileLocation())
  {
    __break(1u);
  }
  else if (qword_1EA4F7BE0 == -1)
  {
    goto LABEL_3;
  }
  swift_once();
LABEL_3:
  uint64_t v3 = sub_1C7B223C0();
  sub_1C7B1D900(v3, (uint64_t)qword_1EA4F8670);
  uint64_t v4 = sub_1C7B223A0();
  os_log_type_t v5 = sub_1C7B22490();
  if (os_log_type_enabled(v4, v5))
  {
    id v6 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_1C7B1B000, v4, v5, "PeopleDiscoveryBiomeStream cleared.", v6, 2u);
    MEMORY[0x1C87BB2D0](v6, -1, -1);
  }
}

uint64_t sub_1C7B1DD84()
{
  return 1;
}

uint64_t sub_1C7B1DD90(uint64_t a1, void *a2, uint64_t a3)
{
  os_log_type_t v5 = *(uint64_t (**)(void *, uint64_t))(a1 + 32);
  id v6 = a2;
  LOBYTE(a3) = v5(a2, a3);

  return a3 & 1;
}

id sub_1C7B1DDEC(uint64_t a1, uint64_t a2, void *a3)
{
  os_log_type_t v5 = (void *)sub_1C7B223F0();
  swift_bridgeObjectRelease();
  id v6 = objc_msgSend(v3, sel_initWithPrivateStreamIdentifier_storeConfig_, v5, a3);

  return v6;
}

id sub_1C7B1DE50(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = (void *)sub_1C7B223F0();
  swift_bridgeObjectRelease();
  id v5 = objc_msgSend(a3, sel_newPrivateStreamDefaultConfigurationWithStoreBasePath_, v4);

  return v5;
}

uint64_t sub_1C7B1DEAC(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_1C7B1DEBC()
{
  return swift_release();
}

ValueMetadata *type metadata accessor for PeopleDiscoveryBiomeStream()
{
  return &type metadata for PeopleDiscoveryBiomeStream;
}

id sub_1C7B1DED4()
{
  return sub_1C7B1DDEC(v1, v2, v0);
}

uint64_t sub_1C7B1DEF4()
{
  return sub_1C7B22440();
}

uint64_t sub_1C7B1DF84()
{
  return sub_1C7B22420();
}

uint64_t sub_1C7B1E004()
{
  return sub_1C7B22450();
}

uint64_t sub_1C7B1E094()
{
  return sub_1C7B22430();
}

uint64_t sub_1C7B1E114()
{
  return sub_1C7B22440();
}

uint64_t sub_1C7B1E1A4()
{
  return sub_1C7B22420();
}

uint64_t RPPersonWrapper.activityLevel.getter()
{
  return *v0;
}

uint64_t RPPersonWrapper.contactID.getter()
{
  return sub_1C7B20664();
}

uint64_t RPPersonWrapper.flags.getter()
{
  return *(unsigned int *)(v0 + 24);
}

uint64_t RPPersonWrapper.identifier.getter()
{
  return sub_1C7B20664();
}

uint64_t RPPersonWrapper.name.getter()
{
  return sub_1C7B20664();
}

uint64_t RPPersonWrapper.proximity.getter()
{
  return *(unsigned int *)(v0 + 64);
}

uint64_t RPPersonWrapper.init(WithContactID:activityLevel:flags:identifier:name:proximity:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, int a3@<W2>, int a4@<W3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, int a10)
{
  *(_DWORD *)a9 = a3;
  *(void *)(a9 + 8) = result;
  *(void *)(a9 + 16) = a2;
  *(_DWORD *)(a9 + 24) = a4;
  *(void *)(a9 + 32) = a5;
  *(void *)(a9 + 40) = a6;
  *(void *)(a9 + 48) = a7;
  *(void *)(a9 + 56) = a8;
  *(_DWORD *)(a9 + 64) = a10;
  return result;
}

void RPPersonWrapper.init(WithRPPerson:)(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v16 = sub_1C7B1FCA4(a1, (SEL *)&selRef_contactID);
  uint64_t v5 = v4;
  unsigned int v6 = objc_msgSend(a1, sel_activityLevel);
  unsigned int v7 = objc_msgSend(a1, sel_flags);
  id v8 = objc_msgSend(a1, sel_identifier);
  uint64_t v9 = sub_1C7B22400();
  uint64_t v11 = v10;

  uint64_t v12 = sub_1C7B1FCA4(a1, (SEL *)&selRef_name);
  uint64_t v14 = v13;
  unsigned int v15 = objc_msgSend(a1, sel_proximity);

  *(_DWORD *)a2 = v6;
  *(void *)(a2 + 8) = v16;
  *(void *)(a2 + 16) = v5;
  *(_DWORD *)(a2 + 24) = v7;
  *(void *)(a2 + 32) = v9;
  *(void *)(a2 + 40) = v11;
  *(void *)(a2 + 48) = v12;
  *(void *)(a2 + 56) = v14;
  *(_DWORD *)(a2 + 64) = v15;
}

BOOL sub_1C7B1E3E0(char a1, char a2)
{
  return a1 == a2;
}

uint64_t sub_1C7B1E3F0()
{
  return sub_1C7B22580();
}

uint64_t sub_1C7B1E418(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x7974697669746361 && a2 == 0xED00006C6576654CLL;
  if (v3 || (sub_1C7B22550() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 0x49746361746E6F63 && a2 == 0xE900000000000044;
    if (v6 || (sub_1C7B22550() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      BOOL v7 = a1 == 0x7367616C66 && a2 == 0xE500000000000000;
      if (v7 || (sub_1C7B22550() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else
      {
        BOOL v8 = a1 == 0x696669746E656469 && a2 == 0xEA00000000007265;
        if (v8 || (sub_1C7B22550() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 3;
        }
        else
        {
          BOOL v9 = a1 == 1701667182 && a2 == 0xE400000000000000;
          if (v9 || (sub_1C7B22550() & 1) != 0)
          {
            swift_bridgeObjectRelease();
            return 4;
          }
          else if (a1 == 0x74696D69786F7270 && a2 == 0xE900000000000079)
          {
            swift_bridgeObjectRelease();
            return 5;
          }
          else
          {
            char v11 = sub_1C7B22550();
            swift_bridgeObjectRelease();
            if (v11) {
              return 5;
            }
            else {
              return 6;
            }
          }
        }
      }
    }
  }
}

uint64_t sub_1C7B1E674()
{
  return 6;
}

uint64_t sub_1C7B1E67C()
{
  return sub_1C7B22590();
}

uint64_t sub_1C7B1E6C4()
{
  return 0;
}

uint64_t sub_1C7B1E6D0(char a1)
{
  return *(void *)&aActivitycontac[8 * a1];
}

BOOL sub_1C7B1E6F0(char *a1, char *a2)
{
  return sub_1C7B1E3E0(*a1, *a2);
}

uint64_t sub_1C7B1E6FC()
{
  return sub_1C7B1E67C();
}

uint64_t sub_1C7B1E704()
{
  return sub_1C7B1E3F0();
}

uint64_t sub_1C7B1E70C()
{
  return sub_1C7B22590();
}

uint64_t sub_1C7B1E750()
{
  return sub_1C7B1E6D0(*v0);
}

uint64_t sub_1C7B1E758@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1C7B1E418(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1C7B1E780()
{
  return sub_1C7B1E6C4();
}

uint64_t sub_1C7B1E7A0@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_1C7B1E674();
  *a1 = result;
  return result;
}

uint64_t sub_1C7B1E7C8(uint64_t a1)
{
  unint64_t v2 = sub_1C7B1FD88();
  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1C7B1E804(uint64_t a1)
{
  unint64_t v2 = sub_1C7B1FD88();
  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t RPPersonWrapper.encode(to:)(void *a1)
{
  uint64_t v4 = sub_1C7B1FD00(&qword_1EA4F7C10);
  sub_1C7B20648();
  uint64_t v6 = v5;
  MEMORY[0x1F4188790]();
  BOOL v8 = (char *)v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  int v9 = *v1;
  uint64_t v10 = *((void *)v1 + 1);
  uint64_t v25 = *((void *)v1 + 2);
  uint64_t v26 = v10;
  int v24 = v1[6];
  uint64_t v11 = *((void *)v1 + 4);
  uint64_t v22 = *((void *)v1 + 5);
  uint64_t v23 = v11;
  uint64_t v12 = *((void *)v1 + 7);
  v20[0] = *((void *)v1 + 6);
  v20[1] = v12;
  int v21 = v1[16];
  sub_1C7B1FD44(a1, a1[3]);
  sub_1C7B1FD88();
  sub_1C7B225B0();
  int v28 = v9;
  char v27 = 0;
  type metadata accessor for RPActivityLevel(0);
  uint64_t v13 = sub_1C7B205B8(&qword_1EA4F7C20, type metadata accessor for RPActivityLevel);
  sub_1C7B2061C(v13);
  if (v2) {
    return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v4);
  }
  int v15 = v24;
  uint64_t v16 = v6;
  int v17 = v21;
  LOBYTE(v28) = 1;
  sub_1C7B22520();
  int v28 = v15;
  char v27 = 2;
  type metadata accessor for RPPersonFlags(0);
  uint64_t v18 = sub_1C7B205B8(&qword_1EA4F7C28, type metadata accessor for RPPersonFlags);
  sub_1C7B2061C(v18);
  LOBYTE(v28) = 3;
  sub_1C7B22530();
  LOBYTE(v28) = 4;
  sub_1C7B22520();
  int v28 = v17;
  char v27 = 5;
  type metadata accessor for RPProximity(0);
  uint64_t v19 = sub_1C7B205B8(&qword_1EA4F7C30, type metadata accessor for RPProximity);
  sub_1C7B2061C(v19);
  return (*(uint64_t (**)(char *, uint64_t))(v16 + 8))(v8, v4);
}

uint64_t RPPersonWrapper.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  sub_1C7B1FD00(&qword_1EA4F7C38);
  sub_1C7B20648();
  MEMORY[0x1F4188790]();
  sub_1C7B1FD44(a1, a1[3]);
  sub_1C7B1FD88();
  sub_1C7B225A0();
  if (v2) {
    return sub_1C7B1FDD4((uint64_t)a1);
  }
  type metadata accessor for RPActivityLevel(0);
  sub_1C7B205B8(&qword_1EA4F7C40, type metadata accessor for RPActivityLevel);
  sub_1C7B20688();
  sub_1C7B22510();
  int v5 = v20;
  sub_1C7B20670(1);
  uint64_t v6 = sub_1C7B224F0();
  uint64_t v9 = v8;
  uint64_t v19 = v6;
  type metadata accessor for RPPersonFlags(0);
  sub_1C7B205B8(&qword_1EA4F7C48, type metadata accessor for RPPersonFlags);
  swift_bridgeObjectRetain();
  sub_1C7B20688();
  sub_1C7B22510();
  int v18 = v20;
  sub_1C7B20670(3);
  uint64_t v16 = sub_1C7B22500();
  uint64_t v17 = v10;
  LOBYTE(v20) = 4;
  swift_bridgeObjectRetain();
  uint64_t v15 = sub_1C7B224F0();
  uint64_t v12 = v11;
  type metadata accessor for RPProximity(0);
  sub_1C7B205B8(&qword_1EA4F7C50, type metadata accessor for RPProximity);
  swift_bridgeObjectRetain();
  sub_1C7B22510();
  uint64_t v13 = sub_1C7B20604();
  v14(v13);
  *(_DWORD *)a2 = v5;
  *(void *)(a2 + 8) = v19;
  *(void *)(a2 + 16) = v9;
  *(_DWORD *)(a2 + 24) = v18;
  *(void *)(a2 + 32) = v16;
  *(void *)(a2 + 40) = v17;
  *(void *)(a2 + 48) = v15;
  *(void *)(a2 + 56) = v12;
  *(_DWORD *)(a2 + 64) = v20;
  sub_1C7B1FDD4((uint64_t)a1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1C7B1EF04@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return RPPersonWrapper.init(from:)(a1, a2);
}

uint64_t sub_1C7B1EF1C(void *a1)
{
  return RPPersonWrapper.encode(to:)(a1);
}

uint64_t PeopleDiscoveryEvent.peopleDiscovered.getter()
{
  return swift_bridgeObjectRetain();
}

unint64_t PeopleDiscoveryEvent.__allocating_init(WithPeopleDiscovered:)(unint64_t result)
{
  unint64_t v1 = result;
  if (result >> 62)
  {
    uint64_t result = sub_1C7B224D0();
    uint64_t v2 = result;
  }
  else
  {
    uint64_t v2 = *(void *)((result & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  if (!v2)
  {
    v31 = (char *)MEMORY[0x1E4FBC860];
LABEL_21:
    swift_bridgeObjectRelease();
    uint64_t v23 = (char *)objc_allocWithZone(v24);
    *(void *)&v23[OBJC_IVAR____TtC26HumanUnderstandingEvidence20PeopleDiscoveryEvent_peopleDiscovered] = v31;
    v32.receiver = v23;
    v32.super_class = v24;
    return (unint64_t)objc_msgSendSuper2(&v32, sel_init);
  }
  if (v2 >= 1)
  {
    uint64_t v3 = 0;
    unint64_t v27 = v1 & 0xC000000000000001;
    v31 = (char *)MEMORY[0x1E4FBC860];
    uint64_t v25 = v2;
    unint64_t v26 = v1;
    do
    {
      if (v27) {
        id v4 = (id)MEMORY[0x1C87BAC50](v3, v1);
      }
      else {
        id v4 = *(id *)(v1 + 8 * v3 + 32);
      }
      int v5 = v4;
      id v6 = objc_msgSend(v4, sel_devices);
      sub_1C7B1FE24();
      unint64_t v7 = sub_1C7B22460();

      if (v7 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v8 = sub_1C7B224D0();
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v8 = *(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10);
      }
      swift_bridgeObjectRelease();
      if (v8)
      {
        id v9 = v5;
        uint64_t v10 = sub_1C7B1FCA4(v9, (SEL *)&selRef_contactID);
        uint64_t v30 = v11;
        unsigned int v29 = objc_msgSend(v9, sel_activityLevel);
        unsigned int v28 = objc_msgSend(v9, sel_flags);
        id v12 = objc_msgSend(v9, sel_identifier);
        uint64_t v13 = sub_1C7B22400();
        uint64_t v15 = v14;

        uint64_t v16 = sub_1C7B1FCA4(v9, (SEL *)&selRef_name);
        uint64_t v18 = v17;
        unsigned int v19 = objc_msgSend(v9, sel_proximity);

        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          v31 = sub_1C7B1FA14(0, *((void *)v31 + 2) + 1, 1, (uint64_t)v31);
        }
        unint64_t v21 = *((void *)v31 + 2);
        unint64_t v20 = *((void *)v31 + 3);
        if (v21 >= v20 >> 1) {
          v31 = sub_1C7B1FA14((char *)(v20 > 1), v21 + 1, 1, (uint64_t)v31);
        }
        *((void *)v31 + 2) = v21 + 1;
        uint64_t v22 = &v31[72 * v21];
        *((_DWORD *)v22 + 8) = v29;
        *((void *)v22 + 5) = v10;
        *((void *)v22 + 6) = v30;
        *((_DWORD *)v22 + 14) = v28;
        *((void *)v22 + 8) = v13;
        *((void *)v22 + 9) = v15;
        *((void *)v22 + 10) = v16;
        *((void *)v22 + 11) = v18;
        *((_DWORD *)v22 + 24) = v19;
        uint64_t v2 = v25;
        unint64_t v1 = v26;
      }
      ++v3;
    }
    while (v2 != v3);
    goto LABEL_21;
  }
  __break(1u);
  return result;
}

id PeopleDiscoveryEvent.__allocating_init(WithPeopleDiscovered:)(uint64_t a1)
{
  uint64_t v3 = (char *)objc_allocWithZone(v1);
  *(void *)&v3[OBJC_IVAR____TtC26HumanUnderstandingEvidence20PeopleDiscoveryEvent_peopleDiscovered] = a1;
  v5.receiver = v3;
  v5.super_class = v1;
  return objc_msgSendSuper2(&v5, sel_init);
}

id PeopleDiscoveryEvent.init(WithPeopleDiscovered:)(uint64_t a1)
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(void *)&v1[OBJC_IVAR____TtC26HumanUnderstandingEvidence20PeopleDiscoveryEvent_peopleDiscovered] = a1;
  v5.receiver = v1;
  v5.super_class = ObjectType;
  return objc_msgSendSuper2(&v5, sel_init);
}

uint64_t PeopleDiscoveryEvent.dataVersion.getter()
{
  return 1;
}

id static PeopleDiscoveryEvent.event(with:dataVersion:)(uint64_t a1, uint64_t a2, int a3)
{
  id v4 = v3;
  id v5 = 0;
  if (a3 == 1)
  {
    sub_1C7B22320();
    swift_allocObject();
    sub_1C7B22310();
    sub_1C7B1FD00(&qword_1EA4F7C68);
    sub_1C7B1FEF8(&qword_1EA4F7C70, (void (*)(void))sub_1C7B1FEAC);
    sub_1C7B22300();
    id v6 = (char *)objc_allocWithZone(v4);
    *(void *)&v6[OBJC_IVAR____TtC26HumanUnderstandingEvidence20PeopleDiscoveryEvent_peopleDiscovered] = v9;
    v8.receiver = v6;
    v8.super_class = v4;
    id v5 = objc_msgSendSuper2(&v8, sel_init);
    swift_release();
  }
  return v5;
}

uint64_t PeopleDiscoveryEvent.serialize()()
{
  sub_1C7B22360();
  swift_allocObject();
  sub_1C7B22350();
  sub_1C7B22330();
  swift_bridgeObjectRetain();
  sub_1C7B1FD00(&qword_1EA4F7C68);
  sub_1C7B1FEF8(&qword_1EA4F7C90, (void (*)(void))sub_1C7B1FF68);
  uint64_t v0 = sub_1C7B22340();
  swift_release();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t PeopleDiscoveryEvent.json()()
{
  v10[9] = *(id *)MEMORY[0x1E4F143B8];
  unint64_t v1 = self;
  sub_1C7B1FD00((uint64_t *)&unk_1EA4F7CA0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1C7B22DF0;
  *(void *)(inited + 32) = 0xD000000000000010;
  *(void *)(inited + 40) = 0x80000001C7B23670;
  *(void *)(inited + 48) = MEMORY[0x1C87BAC10](*(void *)(v0+ OBJC_IVAR____TtC26HumanUnderstandingEvidence20PeopleDiscoveryEvent_peopleDiscovered), &type metadata for RPPersonWrapper);
  *(void *)(inited + 56) = v3;
  sub_1C7B223E0();
  id v4 = (void *)sub_1C7B223D0();
  swift_bridgeObjectRelease();
  v10[0] = 0;
  id v5 = objc_msgSend(v1, sel_dataWithJSONObject_options_error_, v4, 1, v10);

  id v6 = v10[0];
  if (v5)
  {
    sub_1C7B22390();
  }
  else
  {
    unint64_t v7 = v6;
    objc_super v8 = (void *)sub_1C7B22370();

    swift_willThrow();
  }
  return sub_1C7B20664();
}

id sub_1C7B1F8D4(void *a1, uint64_t a2, void (*a3)(void))
{
  id v4 = a1;
  a3();
  unint64_t v6 = v5;

  if (v6 >> 60 == 15)
  {
    unint64_t v7 = 0;
  }
  else
  {
    sub_1C7B20664();
    unint64_t v7 = (void *)sub_1C7B22380();
    uint64_t v8 = sub_1C7B20664();
    sub_1C7B2054C(v8, v9);
  }
  return v7;
}

id PeopleDiscoveryEvent.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void PeopleDiscoveryEvent.init()()
{
}

id PeopleDiscoveryEvent.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

char *sub_1C7B1FA14(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *(void *)(a4 + 24);
    uint64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
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
  if (v9)
  {
    sub_1C7B1FD00((uint64_t *)&unk_1EA4F7D40);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 72);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x1E4FBC860];
  }
  id v12 = v10 + 32;
  if (v5)
  {
    sub_1C7B1FC0C((char *)(a4 + 32), v8, v12);
    *(void *)(a4 + 16) = 0;
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_1C7B1FB0C(0, v8, (unint64_t)v12, a4);
  }
  return v10;
}

uint64_t sub_1C7B1FB0C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 72 * a1 + 32;
    unint64_t v6 = a3 + 72 * v4;
    if (v5 >= v6 || v5 + 72 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  uint64_t result = sub_1C7B224E0();
  __break(1u);
  return result;
}

char *sub_1C7B1FC0C(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)sub_1C7B224E0();
    __break(1u);
  }
  else if (__dst != __src || &__src[72 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 72 * a2);
  }
  return __src;
}

uint64_t sub_1C7B1FCA4(void *a1, SEL *a2)
{
  id v2 = [a1 *a2];
  if (v2)
  {
    uint64_t v3 = v2;
    sub_1C7B22400();
  }
  return sub_1C7B20664();
}

uint64_t sub_1C7B1FD00(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

void *sub_1C7B1FD44(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_1C7B1FD88()
{
  unint64_t result = qword_1EA4F7C18;
  if (!qword_1EA4F7C18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA4F7C18);
  }
  return result;
}

uint64_t sub_1C7B1FDD4(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

unint64_t sub_1C7B1FE24()
{
  unint64_t result = qword_1EA4F7C60;
  if (!qword_1EA4F7C60)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EA4F7C60);
  }
  return result;
}

uint64_t sub_1C7B1FE64(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_1C7B1FEAC()
{
  unint64_t result = qword_1EA4F7C78;
  if (!qword_1EA4F7C78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA4F7C78);
  }
  return result;
}

uint64_t sub_1C7B1FEF8(unint64_t *a1, void (*a2)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_1C7B1FE64(&qword_1EA4F7C68);
    a2();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_1C7B1FF68()
{
  unint64_t result = qword_1EA4F7C98;
  if (!qword_1EA4F7C98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA4F7C98);
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for RPPersonWrapper(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for RPPersonWrapper()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for RPPersonWrapper(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  uint64_t v3 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v3;
  *(_DWORD *)(a1 + 24) = *(_DWORD *)(a2 + 24);
  uint64_t v4 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v4;
  uint64_t v5 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v5;
  *(_DWORD *)(a1 + 64) = *(_DWORD *)(a2 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for RPPersonWrapper(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_DWORD *)(a1 + 24) = *(_DWORD *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_DWORD *)(a1 + 64) = *(_DWORD *)(a2 + 64);
  return a1;
}

void *initializeWithTake for RPPersonWrapper(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x44uLL);
}

uint64_t assignWithTake for RPPersonWrapper(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  uint64_t v4 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v4;
  swift_bridgeObjectRelease();
  *(_DWORD *)(a1 + 24) = *(_DWORD *)(a2 + 24);
  uint64_t v5 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v6;
  swift_bridgeObjectRelease();
  *(_DWORD *)(a1 + 64) = *(_DWORD *)(a2 + 64);
  return a1;
}

uint64_t getEnumTagSinglePayload for RPPersonWrapper(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 68))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 40);
      if (v2 >= 0xFFFFFFFF) {
        LODWORD(v2) = -1;
      }
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for RPPersonWrapper(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_DWORD *)(result + 64) = 0;
    *(void *)unint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 68) = 1;
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
      *(void *)(result + 40) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 68) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for RPPersonWrapper()
{
  return &type metadata for RPPersonWrapper;
}

uint64_t type metadata accessor for PeopleDiscoveryEvent()
{
  return self;
}

uint64_t method lookup function for PeopleDiscoveryEvent(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for PeopleDiscoveryEvent);
}

uint64_t dispatch thunk of PeopleDiscoveryEvent.__allocating_init(WithPeopleDiscovered:)()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

unsigned char *initializeBufferWithCopyOfBuffer for RPPersonWrapper.CodingKeys(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for RPPersonWrapper.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFB)
  {
    if (a2 + 5 >= 0xFFFF00) {
      int v2 = 4;
    }
    else {
      int v2 = 2;
    }
    if ((a2 + 5) >> 8 < 0xFF) {
      int v3 = 1;
    }
    else {
      int v3 = v2;
    }
    if (v3 == 4)
    {
      int v4 = *(_DWORD *)(a1 + 1);
      if (!v4) {
        goto LABEL_17;
      }
    }
    else if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
    }
    else
    {
      int v4 = a1[1];
      if (!a1[1]) {
        goto LABEL_17;
      }
    }
    int v5 = (*a1 | (v4 << 8)) - 6;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 6;
  int v5 = v6 - 6;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for RPPersonWrapper.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 5 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 5) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFB) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFA)
  {
    unsigned int v6 = ((a2 - 251) >> 8) + 1;
    *unint64_t result = a2 + 5;
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
        JUMPOUT(0x1C7B20414);
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
          *unint64_t result = a2 + 5;
        break;
    }
  }
  return result;
}

uint64_t sub_1C7B2043C(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_1C7B20444(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for RPPersonWrapper.CodingKeys()
{
  return &type metadata for RPPersonWrapper.CodingKeys;
}

unint64_t sub_1C7B20460()
{
  unint64_t result = qword_1EA4F7D10;
  if (!qword_1EA4F7D10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA4F7D10);
  }
  return result;
}

unint64_t sub_1C7B204B0()
{
  unint64_t result = qword_1EA4F7D18;
  if (!qword_1EA4F7D18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA4F7D18);
  }
  return result;
}

unint64_t sub_1C7B20500()
{
  unint64_t result = qword_1EA4F7D20;
  if (!qword_1EA4F7D20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA4F7D20);
  }
  return result;
}

uint64_t sub_1C7B2054C(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_1C7B20560(a1, a2);
  }
  return a1;
}

uint64_t sub_1C7B20560(uint64_t a1, unint64_t a2)
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

uint64_t sub_1C7B205B8(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1C7B20604()
{
  return v0;
}

uint64_t sub_1C7B2061C(uint64_t a1)
{
  return MEMORY[0x1F41856C0](v3 - 68, v3 - 69, v1, v2, a1);
}

uint64_t sub_1C7B20664()
{
  return v0;
}

uint64_t sub_1C7B20670@<X0>(char a1@<W8>)
{
  *(unsigned char *)(v1 - 68) = a1;
  return v1 - 68;
}

uint64_t sub_1C7B20688()
{
  return v0;
}

uint64_t *sub_1C7B20720(uint64_t *result, uint64_t a2)
{
  uint64_t v2 = *result;
  *uint64_t result = a2;
  if (v2)
  {
    pthread_mutex_destroy((pthread_mutex_t *)(v2 + 8));
    JUMPOUT(0x1C87BADF0);
  }
  return result;
}

void sub_1C7B20784(void *a1)
{
}

void sub_1C7B208A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  id v12 = v11;

  pthread_mutex_unlock(v10);
  _Unwind_Resume(a1);
}

void sub_1C7B20B94(_Unwind_Exception *a1)
{
  pthread_mutex_unlock(v3);
  _Unwind_Resume(a1);
}

void sub_1C7B20BFC(uint64_t a1, unint64_t a2)
{
  unint64_t v4 = *(void *)(a1 + 24);
  unint64_t v5 = (a2 + 7) >> 3;
  unsigned int v6 = *(char **)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  unint64_t v8 = (v7 - *(void *)a1) >> 5;
  if (v5 <= v8)
  {
    if (v5 >= v8) {
      goto LABEL_21;
    }
    unint64_t v21 = &v6[32 * v5];
    goto LABEL_15;
  }
  unint64_t v9 = v5 - v8;
  uint64_t v10 = *(void *)(a1 + 16);
  if (v5 - v8 <= (v10 - v7) >> 5)
  {
    bzero(*(void **)(a1 + 8), 32 * v9);
    unint64_t v21 = (char *)(v7 + 32 * v9);
LABEL_15:
    *(void *)(a1 + 8) = v21;
    goto LABEL_21;
  }
  uint64_t v34 = 0;
  long long v32 = 0u;
  *(_OWORD *)v33 = 0u;
  if ((a2 + 7) >> 62) {
    sub_1C7B21064();
  }
  uint64_t v11 = v10 - (void)v6;
  if (v11 >> 4 > v5) {
    unint64_t v5 = v11 >> 4;
  }
  if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFE0) {
    uint64_t v12 = 0x7FFFFFFFFFFFFFFLL;
  }
  else {
    uint64_t v12 = v5;
  }
  sub_1C7B21074(&v32, v12, v8, a1 + 16);
  uint64_t v13 = (char *)v33[0];
  bzero(v33[0], 32 * v9);
  uint64_t v14 = &v13[32 * v9];
  v33[0] = v14;
  uint64_t v16 = *(char **)a1;
  uint64_t v15 = *(char **)(a1 + 8);
  uint64_t v17 = *((void *)&v32 + 1);
  if (v15 == *(char **)a1)
  {
    unint64_t v20 = *(char **)(a1 + 8);
  }
  else
  {
    do
    {
      long long v18 = *((_OWORD *)v15 - 2);
      long long v19 = *((_OWORD *)v15 - 1);
      v15 -= 32;
      *(_OWORD *)(v17 - 32) = v18;
      *(_OWORD *)(v17 - 16) = v19;
      v17 -= 32;
    }
    while (v15 != v16);
    unint64_t v20 = *(char **)a1;
    uint64_t v15 = *(char **)(a1 + 8);
    uint64_t v14 = (char *)v33[0];
  }
  *(void *)a1 = v17;
  *(void *)(a1 + 8) = v14;
  uint64_t v22 = *(void **)(a1 + 16);
  *(void **)(a1 + 16) = v33[1];
  v33[0] = v15;
  v33[1] = v22;
  *(void *)&long long v32 = v20;
  *((void *)&v32 + 1) = v20;
  if (v15 != v20) {
    v33[0] = &v15[(v20 - v15 + 31) & 0xFFFFFFFFFFFFFFE0];
  }
  if (v20) {
    free(v20);
  }
LABEL_21:
  *(void *)(a1 + 24) = a2;
  if (v4 > a2)
  {
    unint64_t v23 = (uint64_t)(*(void *)(a1 + 8) - *(void *)a1) >> 5;
    if (v23 < (uint64_t)(*(void *)(a1 + 16) - *(void *)a1) >> 5)
    {
      uint64_t v34 = 0;
      long long v32 = 0u;
      *(_OWORD *)v33 = 0u;
      sub_1C7B21074(&v32, v23, v23, a1 + 16);
      uint64_t v25 = *(char **)a1;
      int v24 = *(char **)(a1 + 8);
      uint64_t v26 = *((void *)&v32 + 1);
      if (v24 == *(char **)a1)
      {
        unsigned int v29 = *(char **)(a1 + 8);
      }
      else
      {
        do
        {
          long long v27 = *((_OWORD *)v24 - 2);
          long long v28 = *((_OWORD *)v24 - 1);
          v24 -= 32;
          *(_OWORD *)(v26 - 32) = v27;
          *(_OWORD *)(v26 - 16) = v28;
          v26 -= 32;
        }
        while (v24 != v25);
        unsigned int v29 = *(char **)a1;
        int v24 = *(char **)(a1 + 8);
      }
      *(void *)a1 = v26;
      uint64_t v30 = *(void **)(a1 + 16);
      *(_OWORD *)(a1 + 8) = *(_OWORD *)v33;
      v33[0] = v24;
      v33[1] = v30;
      *(void *)&long long v32 = v29;
      *((void *)&v32 + 1) = v29;
      if (v24 != v29) {
        v33[0] = &v24[(v29 - v24 + 31) & 0xFFFFFFFFFFFFFFE0];
      }
      if (v29) {
        free(v29);
      }
    }
    uint64_t v31 = *(void *)(a1 + 24);
    if (v31) {
      bzero((void *)(*(void *)a1 + 4 * v31), *(void *)(a1 + 8) - (*(void *)a1 + 4 * v31));
    }
  }
}

void sub_1C7B20E20(void *a1)
{
}

void sub_1C7B20E30(uint64_t a1, unint64_t a2)
{
  unint64_t v4 = *(void *)(a1 + 24);
  unint64_t v5 = (a2 + 7) >> 3;
  unsigned int v6 = *(char **)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  unint64_t v8 = (v7 - *(void *)a1) >> 5;
  if (v5 <= v8)
  {
    if (v5 >= v8) {
      goto LABEL_21;
    }
    unint64_t v21 = &v6[32 * v5];
    goto LABEL_15;
  }
  unint64_t v9 = v5 - v8;
  uint64_t v10 = *(void *)(a1 + 16);
  if (v5 - v8 <= (v10 - v7) >> 5)
  {
    bzero(*(void **)(a1 + 8), 32 * v9);
    unint64_t v21 = (char *)(v7 + 32 * v9);
LABEL_15:
    *(void *)(a1 + 8) = v21;
    goto LABEL_21;
  }
  uint64_t v34 = 0;
  long long v32 = 0u;
  *(_OWORD *)v33 = 0u;
  if ((a2 + 7) >> 62) {
    sub_1C7B21064();
  }
  uint64_t v11 = v10 - (void)v6;
  if (v11 >> 4 > v5) {
    unint64_t v5 = v11 >> 4;
  }
  if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFE0) {
    uint64_t v12 = 0x7FFFFFFFFFFFFFFLL;
  }
  else {
    uint64_t v12 = v5;
  }
  sub_1C7B21074(&v32, v12, v8, a1 + 16);
  uint64_t v13 = (char *)v33[0];
  bzero(v33[0], 32 * v9);
  uint64_t v14 = &v13[32 * v9];
  v33[0] = v14;
  uint64_t v16 = *(char **)a1;
  uint64_t v15 = *(char **)(a1 + 8);
  uint64_t v17 = *((void *)&v32 + 1);
  if (v15 == *(char **)a1)
  {
    unint64_t v20 = *(char **)(a1 + 8);
  }
  else
  {
    do
    {
      long long v18 = *((_OWORD *)v15 - 2);
      long long v19 = *((_OWORD *)v15 - 1);
      v15 -= 32;
      *(_OWORD *)(v17 - 32) = v18;
      *(_OWORD *)(v17 - 16) = v19;
      v17 -= 32;
    }
    while (v15 != v16);
    unint64_t v20 = *(char **)a1;
    uint64_t v15 = *(char **)(a1 + 8);
    uint64_t v14 = (char *)v33[0];
  }
  *(void *)a1 = v17;
  *(void *)(a1 + 8) = v14;
  uint64_t v22 = *(void **)(a1 + 16);
  *(void **)(a1 + 16) = v33[1];
  v33[0] = v15;
  v33[1] = v22;
  *(void *)&long long v32 = v20;
  *((void *)&v32 + 1) = v20;
  if (v15 != v20) {
    v33[0] = &v15[(v20 - v15 + 31) & 0xFFFFFFFFFFFFFFE0];
  }
  if (v20) {
    free(v20);
  }
LABEL_21:
  *(void *)(a1 + 24) = a2;
  if (v4 > a2)
  {
    unint64_t v23 = (uint64_t)(*(void *)(a1 + 8) - *(void *)a1) >> 5;
    if (v23 < (uint64_t)(*(void *)(a1 + 16) - *(void *)a1) >> 5)
    {
      uint64_t v34 = 0;
      long long v32 = 0u;
      *(_OWORD *)v33 = 0u;
      sub_1C7B21074(&v32, v23, v23, a1 + 16);
      uint64_t v25 = *(char **)a1;
      int v24 = *(char **)(a1 + 8);
      uint64_t v26 = *((void *)&v32 + 1);
      if (v24 == *(char **)a1)
      {
        unsigned int v29 = *(char **)(a1 + 8);
      }
      else
      {
        do
        {
          long long v27 = *((_OWORD *)v24 - 2);
          long long v28 = *((_OWORD *)v24 - 1);
          v24 -= 32;
          *(_OWORD *)(v26 - 32) = v27;
          *(_OWORD *)(v26 - 16) = v28;
          v26 -= 32;
        }
        while (v24 != v25);
        unsigned int v29 = *(char **)a1;
        int v24 = *(char **)(a1 + 8);
      }
      *(void *)a1 = v26;
      uint64_t v30 = *(void **)(a1 + 16);
      *(_OWORD *)(a1 + 8) = *(_OWORD *)v33;
      v33[0] = v24;
      v33[1] = v30;
      *(void *)&long long v32 = v29;
      *((void *)&v32 + 1) = v29;
      if (v24 != v29) {
        v33[0] = &v24[(v29 - v24 + 31) & 0xFFFFFFFFFFFFFFE0];
      }
      if (v29) {
        free(v29);
      }
    }
    uint64_t v31 = *(void *)(a1 + 24);
    if (v31) {
      bzero((void *)(*(void *)a1 + 4 * v31), *(void *)(a1 + 8) - (*(void *)a1 + 4 * v31));
    }
  }
}

void sub_1C7B21054(void *a1)
{
}

void sub_1C7B21064()
{
}

void *sub_1C7B21074(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  a1[3] = 0;
  a1[4] = a4;
  if (a2)
  {
    memptr = 0;
    if (malloc_type_posix_memalign(&memptr, 0x40uLL, 32 * a2, 0x1000040E0EAB150uLL))
    {
      exception = (std::bad_alloc *)__cxa_allocate_exception(8uLL);
      uint64_t v11 = std::bad_alloc::bad_alloc(exception);
      __cxa_throw(v11, MEMORY[0x1E4FBA360], MEMORY[0x1E4FBA2C0]);
    }
    uint64_t v7 = (char *)memptr;
  }
  else
  {
    uint64_t v7 = 0;
  }
  unint64_t v8 = &v7[32 * a3];
  *a1 = v7;
  a1[1] = v8;
  a1[2] = v8;
  a1[3] = &v7[32 * a2];
  return a1;
}

void sub_1C7B21124()
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_1C7B21178(exception);
  __cxa_throw(exception, (struct type_info *)off_1E653A770, MEMORY[0x1E4FBA1C8]);
}

void sub_1C7B21164(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *sub_1C7B21178(std::logic_error *a1)
{
  uint64_t result = std::logic_error::logic_error(a1, "vector");
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x1E4FBA4D0] + 16);
  return result;
}

void sub_1C7B21268(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C7B21340(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C7B2154C(_Unwind_Exception *a1)
{
  pthread_mutex_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1C7B216D0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1C7B216F0(uint64_t result, uint64_t a2, int a3)
{
  if (*(unsigned __int16 *)(result + 40) == a3) {
    ++*(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24);
  }
  return result;
}

uint64_t sub_1C7B21714(uint64_t result, int a2)
{
  if (*(unsigned __int16 *)(result + 40) == a2) {
    ++*(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24);
  }
  return result;
}

void sub_1C7B21818(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1C7B218B4(_Unwind_Exception *a1)
{
  pthread_mutex_unlock(v1);
  _Unwind_Resume(a1);
}

float sub_1C7B218CC(uint64_t ***a1, int a2, int a3)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  float v3 = 0.0;
  if (a2 != 0xFFFF && a3 != 0xFFFF) {
    return v3;
  }
  size_t v8 = (**a1)[1] - ***a1;
  unint64_t v9 = v8 | 0xF;
  memptr = 0;
  uint64_t v43 = 0;
  if ((v8 | 0xF) > 0x800)
  {
    int v37 = malloc_type_posix_memalign(&memptr, 0x10uLL, v8, 0x72D18ACAuLL);
    LOBYTE(v43) = 0;
    if (v37)
    {
      id v39 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C4A0] reason:@"malloc failed" userInfo:0];
      objc_exception_throw(v39);
    }
    uint64_t v10 = (float *)memptr;
  }
  else
  {
    MEMORY[0x1F4188790]();
    bzero((char *)&v41 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), v8 | 0xF);
    uint64_t v10 = (float *)(((unint64_t)&v41 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0) + 15) & 0xFFFFFFFFFFFFFFF0);
  }
  size_t v11 = v8 | 3;
  memptr = 0;
  uint64_t v43 = 0;
  if ((v8 | 3) > 0x800)
  {
    int v38 = malloc_type_posix_memalign(&memptr, 8uLL, v8, 0x50C67BDFuLL);
    LOBYTE(v43) = 0;
    if (v38)
    {
      id v40 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C4A0] reason:@"malloc failed" userInfo:0];
      objc_exception_throw(v40);
    }
    uint64_t v12 = (char *)memptr;
  }
  else
  {
    MEMORY[0x1F4188790]();
    uint64_t v12 = (char *)&v41 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
    bzero(v12, v11);
  }
  if ((a3 & a2) == 0xFFFF)
  {
    uint64_t v13 = **a1;
    uint64_t v14 = *v13;
    if (v13[1] != *v13)
    {
      unint64_t v15 = 0;
      float32x4_t v16 = 0uLL;
      float32x4_t v17 = 0uLL;
      do
      {
        long long v18 = (float32x4_t *)(v14 + 32 * v15);
        float32x4_t v19 = *v18;
        float32x4_t v20 = v18[1];
        float32x4_t v17 = vaddq_f32(v17, v20);
        float32x4_t v16 = vaddq_f32(v16, *v18);
        unint64_t v21 = (float32x4_t *)&v10[8 * v15];
        *unint64_t v21 = v19;
        v21[1] = v20;
        ++v15;
        uint64_t v13 = **a1;
        uint64_t v14 = *v13;
      }
      while (v15 < (v13[1] - *v13) >> 5);
    }
    int v25 = *((_DWORD *)v13 + 6);
LABEL_29:
    if (v25 < 1)
    {
      float v3 = 0.0;
    }
    else
    {
      cblas_sscal_NEWLAPACK();
      LODWORD(memptr) = (v25 + 7) & 0xFFFFFFF8;
      vvlog2f((float *)v12, v10, (const int *)&memptr);
      cblas_sdot_NEWLAPACK();
      float v3 = -v35;
    }
    goto LABEL_32;
  }
  if (a2 == 0xFFFF)
  {
    uint64_t v22 = **a1;
    unint64_t v23 = v22[3];
    if (v23)
    {
      uint64_t v24 = 0;
      int v25 = 0;
      uint64_t v26 = v22[4];
      double v27 = 0.0;
      do
      {
        if (*(unsigned __int16 *)(v26 + 4 * v24) == a3)
        {
          float v28 = *(float *)(*v22 + 4 * v24);
          double v27 = v27 + v28;
          v10[v25++] = v28;
        }
        ++v24;
      }
      while (v23 > v24);
      goto LABEL_29;
    }
  }
  else
  {
    unsigned int v29 = **a1;
    unint64_t v30 = v29[3];
    if (v30)
    {
      uint64_t v31 = 0;
      int v25 = 0;
      uint64_t v32 = v29[4];
      double v33 = 0.0;
      do
      {
        if (*(unsigned __int16 *)(v32 + 4 * v31 + 2) == a2)
        {
          float v34 = *(float *)(*v29 + 4 * v31);
          double v33 = v33 + v34;
          v10[v25++] = v34;
        }
        ++v31;
      }
      while (v30 > v31);
      goto LABEL_29;
    }
  }
LABEL_32:
  if (v11 >= 0x801) {
    free(v12);
  }
  if (v9 >= 0x801) {
    free(v10);
  }
  if (fabsf(v3) == INFINITY) {
    return 0.0;
  }
  return v3;
}

void sub_1C7B21EAC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C7B220F0(_Unwind_Exception *a1)
{
  pthread_mutex_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1C7B22170(_Unwind_Exception *a1)
{
  pthread_mutex_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1C7B222C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_1C7B22300()
{
  return MEMORY[0x1F40E41E0]();
}

uint64_t sub_1C7B22310()
{
  return MEMORY[0x1F40E4210]();
}

uint64_t sub_1C7B22320()
{
  return MEMORY[0x1F40E4220]();
}

uint64_t sub_1C7B22330()
{
  return MEMORY[0x1F40E4228]();
}

uint64_t sub_1C7B22340()
{
  return MEMORY[0x1F40E4240]();
}

uint64_t sub_1C7B22350()
{
  return MEMORY[0x1F40E4260]();
}

uint64_t sub_1C7B22360()
{
  return MEMORY[0x1F40E4270]();
}

uint64_t sub_1C7B22370()
{
  return MEMORY[0x1F40E4550]();
}

uint64_t sub_1C7B22380()
{
  return MEMORY[0x1F40E4D48]();
}

uint64_t sub_1C7B22390()
{
  return MEMORY[0x1F40E4DA8]();
}

uint64_t sub_1C7B223A0()
{
  return MEMORY[0x1F4188670]();
}

uint64_t sub_1C7B223B0()
{
  return MEMORY[0x1F4188680]();
}

uint64_t sub_1C7B223C0()
{
  return MEMORY[0x1F41886A0]();
}

uint64_t sub_1C7B223D0()
{
  return MEMORY[0x1F40E6000]();
}

uint64_t sub_1C7B223E0()
{
  return MEMORY[0x1F4183358]();
}

uint64_t sub_1C7B223F0()
{
  return MEMORY[0x1F40E6190]();
}

uint64_t sub_1C7B22400()
{
  return MEMORY[0x1F40E61D8]();
}

uint64_t sub_1C7B22410()
{
  return MEMORY[0x1F4183A38]();
}

uint64_t sub_1C7B22420()
{
  return MEMORY[0x1F4183DB0]();
}

uint64_t sub_1C7B22430()
{
  return MEMORY[0x1F4183DD0]();
}

uint64_t sub_1C7B22440()
{
  return MEMORY[0x1F4183E28]();
}

uint64_t sub_1C7B22450()
{
  return MEMORY[0x1F4183E48]();
}

uint64_t sub_1C7B22460()
{
  return MEMORY[0x1F40E6370]();
}

uint64_t sub_1C7B22470()
{
  return MEMORY[0x1F4183E90]();
}

uint64_t sub_1C7B22480()
{
  return MEMORY[0x1F41886E0]();
}

uint64_t sub_1C7B22490()
{
  return MEMORY[0x1F4188700]();
}

uint64_t sub_1C7B224A0()
{
  return MEMORY[0x1F4184CE8]();
}

uint64_t sub_1C7B224B0()
{
  return MEMORY[0x1F4184D80]();
}

uint64_t sub_1C7B224C0()
{
  return MEMORY[0x1F4185050]();
}

uint64_t sub_1C7B224D0()
{
  return MEMORY[0x1F4185350]();
}

uint64_t sub_1C7B224E0()
{
  return MEMORY[0x1F4185398]();
}

uint64_t sub_1C7B224F0()
{
  return MEMORY[0x1F41854F8]();
}

uint64_t sub_1C7B22500()
{
  return MEMORY[0x1F4185568]();
}

uint64_t sub_1C7B22510()
{
  return MEMORY[0x1F4185598]();
}

uint64_t sub_1C7B22520()
{
  return MEMORY[0x1F4185628]();
}

uint64_t sub_1C7B22530()
{
  return MEMORY[0x1F4185690]();
}

uint64_t sub_1C7B22550()
{
  return MEMORY[0x1F4185A40]();
}

uint64_t sub_1C7B22560()
{
  return MEMORY[0x1F4185E90]();
}

uint64_t sub_1C7B22570()
{
  return MEMORY[0x1F4185EB0]();
}

uint64_t sub_1C7B22580()
{
  return MEMORY[0x1F4185EC8]();
}

uint64_t sub_1C7B22590()
{
  return MEMORY[0x1F4185EF8]();
}

uint64_t sub_1C7B225A0()
{
  return MEMORY[0x1F4185FC8]();
}

uint64_t sub_1C7B225B0()
{
  return MEMORY[0x1F4185FF0]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1F40C9A70](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x1F417E448](this, a2);
}

std::bad_alloc *__cdecl std::bad_alloc::bad_alloc(std::bad_alloc *this)
{
  return (std::bad_alloc *)MEMORY[0x1F417EEC8](this);
}

void std::terminate(void)
{
}

void operator delete()
{
  while (1)
    ;
}

void operator new()
{
  while (1)
    ;
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x1F417EF30](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x1F417EF48](a1);
}

void __cxa_end_catch(void)
{
}

void __cxa_free_exception(void *a1)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1F4186388]();
}

void bzero(void *a1, size_t a2)
{
}

uint64_t cblas_sdot_NEWLAPACK()
{
  return MEMORY[0x1F40D1600]();
}

uint64_t cblas_sscal_NEWLAPACK()
{
  return MEMORY[0x1F40D1688]();
}

long double exp2(long double __x)
{
  MEMORY[0x1F40CBFE8](__x);
  return result;
}

void free(void *a1)
{
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1F40CCB80](ptr);
}

int malloc_type_posix_memalign(void **memptr, size_t alignment, size_t size, malloc_type_id_t type_id)
{
  return MEMORY[0x1F40CCBA0](memptr, alignment, size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD10](__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1F4181640](a1);
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1F4181660](a1);
}

{
  MEMORY[0x1F4181668](context);
}

{
  return (void *)MEMORY[0x1F4181670]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
}

void objc_exception_throw(id exception)
{
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F4181798](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1F41817B0]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1F41817C0]();
}

uint64_t self
{
  return MEMORY[0x1F41817D0]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1F41818B8](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C8](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA78](a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x1F40CDA80](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA88](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA98](a1);
}

int pthread_mutexattr_destroy(pthread_mutexattr_t *a1)
{
  return MEMORY[0x1F40CDAA0](a1);
}

int pthread_mutexattr_init(pthread_mutexattr_t *a1)
{
  return MEMORY[0x1F40CDAA8](a1);
}

int pthread_mutexattr_settype(pthread_mutexattr_t *a1, int a2)
{
  return MEMORY[0x1F40CDAC0](a1, *(void *)&a2);
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1F41863E8]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x1F4186418]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1F4186440]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1F4186450]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x1F4186528]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1F41865A8]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1F4186608]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1F4186610]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1F4186668]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x1F4186670]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1F4186680]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x1F41866A8]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x1F41866C8]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1F4186700]();
}

uint64_t swift_once()
{
  return MEMORY[0x1F4186728]();
}

uint64_t swift_release()
{
  return MEMORY[0x1F4186758]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1F4186770]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1F4186798]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x1F41867A0]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x1F41868E0]();
}

void vvlog2f(float *a1, const float *a2, const int *a3)
{
}