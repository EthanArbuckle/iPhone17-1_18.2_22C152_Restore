uint64_t sub_56C0(uint64_t a1, uint64_t a2)
{
  return sub_5C0C(a1, a2, (uint64_t (*)(uint64_t))&String._bridgeToObjectiveC());
}

uint64_t sub_56E4(uint64_t a1, id *a2)
{
  uint64_t result = sub_1DAB0();
  *a2 = 0;
  return result;
}

uint64_t sub_575C(uint64_t a1, id *a2)
{
  char v3 = sub_1DAC0();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_57DC@<X0>(void *a1@<X8>)
{
  sub_1DAD0();
  NSString v2 = sub_1DAA0();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_5820(uint64_t a1, uint64_t a2)
{
  return sub_5C0C(a1, a2, (uint64_t (*)(uint64_t))&String.hashValue.getter);
}

void type metadata accessor for FileProtectionType(uint64_t a1)
{
}

void type metadata accessor for FileAttributeKey(uint64_t a1)
{
}

void sub_586C(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_58B8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1DAD0();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_58E4(uint64_t a1)
{
  uint64_t v2 = sub_5A30((unint64_t *)&qword_29088, type metadata accessor for FileAttributeKey);
  uint64_t v3 = sub_5A30((unint64_t *)&unk_29090, type metadata accessor for FileAttributeKey);

  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_59A0()
{
  return sub_5A30(&qword_29048, type metadata accessor for FileAttributeKey);
}

uint64_t sub_59E8()
{
  return sub_5A30(&qword_29050, type metadata accessor for FileAttributeKey);
}

uint64_t sub_5A30(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_5A78@<X0>(void *a1@<X8>)
{
  NSString v2 = sub_1DAA0();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_5AC0(uint64_t a1)
{
  uint64_t v2 = sub_5A30(&qword_29078, type metadata accessor for FileProtectionType);
  uint64_t v3 = sub_5A30(&qword_29080, type metadata accessor for FileProtectionType);

  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_5B7C()
{
  return sub_5A30(&qword_29058, type metadata accessor for FileProtectionType);
}

uint64_t sub_5BC4()
{
  return sub_5A30(&qword_29060, type metadata accessor for FileProtectionType);
}

uint64_t sub_5C0C(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = sub_1DAD0();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_5C50()
{
  sub_1DAD0();
  sub_1DB50();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_5CA4()
{
  sub_1DAD0();
  sub_1DF70();
  sub_1DB50();
  Swift::Int v0 = sub_1DF90();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_5D18()
{
  uint64_t v0 = sub_1DAD0();
  uint64_t v2 = v1;
  if (v0 == sub_1DAD0() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_1DF50();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_5DA4()
{
  return sub_5A30(&qword_29068, type metadata accessor for FileProtectionType);
}

uint64_t sub_5DEC()
{
  return sub_5A30(&qword_29070, type metadata accessor for FileAttributeKey);
}

uint64_t sub_5E3C(uint64_t a1, uint64_t a2)
{
  v3[14] = a2;
  v3[15] = v2;
  v3[13] = a1;
  uint64_t v4 = sub_1D9E0();
  v3[16] = v4;
  v3[17] = *(void *)(v4 - 8);
  v3[18] = swift_task_alloc();
  return _swift_task_switch(sub_5F00, 0, 0);
}

uint64_t sub_5F00()
{
  uint64_t v1 = *(void **)(v0 + 104);
  sub_6FF8(&qword_294D0);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_1F560;
  *(void *)(v2 + 32) = v1;
  sub_1DC00();
  *(_OWORD *)(v0 + 16) = 0u;
  *(void *)(v0 + 48) = 0;
  *(_OWORD *)(v0 + 32) = 0u;
  id v3 = v1;
  sub_1D890();
  swift_bridgeObjectRelease();
  sub_70D0(v0 + 16, &qword_294E8);
  if (qword_28FC8 != -1) {
    swift_once();
  }
  uint64_t v4 = *(void **)(v0 + 104);
  uint64_t v5 = sub_1DA30();
  *(void *)(v0 + 152) = sub_6FC0(v5, (uint64_t)qword_2BF10);
  id v6 = v4;
  v7 = sub_1DA20();
  os_log_type_t v8 = sub_1DC40();
  BOOL v9 = os_log_type_enabled(v7, v8);
  v10 = *(void **)(v0 + 104);
  if (v9)
  {
    v11 = (uint8_t *)swift_slowAlloc();
    v12 = (void *)swift_slowAlloc();
    *(_DWORD *)v11 = 138412290;
    *(void *)(v0 + 96) = v10;
    id v13 = v10;
    sub_1DD00();
    void *v12 = v10;

    _os_log_impl(&dword_0, v7, v8, "submitting addViews command: %@", v11, 0xCu);
    sub_6FF8((uint64_t *)&unk_294F0);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    v7 = *(NSObject **)(v0 + 104);
  }

  v14 = sub_1DA20();
  os_log_type_t v15 = sub_1DC30();
  if (os_log_type_enabled(v14, v15))
  {
    v16 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v16 = 0;
    _os_log_impl(&dword_0, v14, v15, "submit addViews command and nlContextUpdate", v16, 2u);
    swift_slowDealloc();
  }
  uint64_t v18 = *(void *)(v0 + 136);
  uint64_t v17 = *(void *)(v0 + 144);
  v20 = *(void **)(v0 + 120);
  uint64_t v19 = *(void *)(v0 + 128);

  v21 = v20 + 7;
  uint64_t v22 = v20[10];
  uint64_t v23 = v20[11];
  sub_703C(v21, v22);
  *(void *)(v0 + 80) = v19;
  *(void *)(v0 + 88) = &protocol witness table for AceOutput;
  v24 = sub_712C((uint64_t *)(v0 + 56));
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(v18 + 16))(v24, v17, v19);
  v25 = (void *)swift_task_alloc();
  *(void *)(v0 + 160) = v25;
  void *v25 = v0;
  v25[1] = sub_6270;
  return dispatch thunk of OutputPublisherAsync.publish(output:)(v0 + 56, v22, v23);
}

uint64_t sub_6270()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 168) = v0;
  swift_task_dealloc();
  if (v0)
  {
    id v3 = sub_6408;
  }
  else
  {
    sub_7080(v2 + 56);
    id v3 = sub_638C;
  }
  return _swift_task_switch(v3, 0, 0);
}

uint64_t sub_638C()
{
  (*(void (**)(void, void))(v0[17] + 8))(v0[18], v0[16]);
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_6408()
{
  sub_7080((uint64_t)(v0 + 7));
  uint64_t v1 = sub_1DA20();
  os_log_type_t v2 = sub_1DC50();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl(&dword_0, v1, v2, "submit commands failed.", v3, 2u);
    swift_slowDealloc();
  }
  swift_errorRelease();

  (*(void (**)(void, void))(v0[17] + 8))(v0[18], v0[16]);
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_6510()
{
  v1[12] = v0;
  sub_6FF8(&qword_294E0);
  v1[13] = swift_task_alloc();
  uint64_t v2 = sub_1D9E0();
  v1[14] = v2;
  v1[15] = *(void *)(v2 - 8);
  v1[16] = swift_task_alloc();
  uint64_t v3 = sub_1D930();
  v1[17] = v3;
  v1[18] = *(void *)(v3 - 8);
  v1[19] = swift_task_alloc();
  return _swift_task_switch(sub_665C, 0, 0);
}

uint64_t sub_665C()
{
  uint64_t v2 = *(void *)(v0 + 144);
  uint64_t v1 = *(void *)(v0 + 152);
  uint64_t v3 = *(void *)(v0 + 136);
  uint64_t v4 = *(void *)(v0 + 104);
  sub_1D920();
  sub_1D8E0();
  sub_1D8D0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v4, v1, v3);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v2 + 56))(v4, 0, 1, v3);
  *(_OWORD *)(v0 + 16) = 0u;
  *(void *)(v0 + 48) = 0;
  *(_OWORD *)(v0 + 32) = 0u;
  sub_1D890();
  sub_70D0(v0 + 16, &qword_294E8);
  sub_70D0(v4, &qword_294E0);
  if (qword_28FC8 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_1DA30();
  *(void *)(v0 + 160) = sub_6FC0(v5, (uint64_t)qword_2BF10);
  uint64_t v6 = sub_1DA20();
  os_log_type_t v7 = sub_1DC30();
  if (os_log_type_enabled(v6, v7))
  {
    os_log_type_t v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)os_log_type_t v8 = 0;
    _os_log_impl(&dword_0, v6, v7, "submit nlContextUpdate.", v8, 2u);
    swift_slowDealloc();
  }
  uint64_t v10 = *(void *)(v0 + 120);
  uint64_t v9 = *(void *)(v0 + 128);
  uint64_t v11 = *(void *)(v0 + 112);
  v12 = *(void **)(v0 + 96);

  id v13 = v12 + 7;
  uint64_t v14 = v12[10];
  uint64_t v15 = v12[11];
  sub_703C(v13, v14);
  *(void *)(v0 + 80) = v11;
  *(void *)(v0 + 88) = &protocol witness table for AceOutput;
  v16 = sub_712C((uint64_t *)(v0 + 56));
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(v10 + 16))(v16, v9, v11);
  uint64_t v17 = (void *)swift_task_alloc();
  *(void *)(v0 + 168) = v17;
  *uint64_t v17 = v0;
  v17[1] = sub_68E0;
  return dispatch thunk of OutputPublisherAsync.publish(output:)(v0 + 56, v14, v15);
}

uint64_t sub_68E0()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 176) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = sub_6AB8;
  }
  else
  {
    sub_7080(v2 + 56);
    uint64_t v3 = sub_69FC;
  }
  return _swift_task_switch(v3, 0, 0);
}

uint64_t sub_69FC()
{
  uint64_t v2 = v0[18];
  uint64_t v1 = v0[19];
  uint64_t v3 = v0[17];
  (*(void (**)(void, void))(v0[15] + 8))(v0[16], v0[14]);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_6AB8()
{
  sub_7080((uint64_t)(v0 + 7));
  uint64_t v1 = sub_1DA20();
  os_log_type_t v2 = sub_1DC50();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl(&dword_0, v1, v2, "submit nlContextUpdate failed.", v3, 2u);
    swift_slowDealloc();
  }
  swift_errorRelease();

  uint64_t v5 = v0[18];
  uint64_t v4 = v0[19];
  uint64_t v6 = v0[17];
  (*(void (**)(void, void))(v0[15] + 8))(v0[16], v0[14]);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  os_log_type_t v7 = (uint64_t (*)(void))v0[1];
  return v7();
}

uint64_t sub_6BF8()
{
  sub_7080(v0 + 16);
  sub_7080(v0 + 56);

  return _swift_deallocClassInstance(v0, 96, 7);
}

uint64_t type metadata accessor for EdutainmentOutput()
{
  return self;
}

void sub_6C5C(uint64_t a1, unint64_t a2)
{
  if (qword_28FC8 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_1DA30();
  sub_6FC0(v4, (uint64_t)qword_2BF10);
  swift_bridgeObjectRetain_n();
  uint64_t v5 = sub_1DA20();
  os_log_type_t v6 = sub_1DC40();
  if (os_log_type_enabled(v5, v6))
  {
    os_log_type_t v7 = (uint8_t *)swift_slowAlloc();
    v18[0] = swift_slowAlloc();
    *(_DWORD *)os_log_type_t v7 = 136315138;
    swift_bridgeObjectRetain();
    sub_1B87C(a1, a2, v18);
    sub_1DD00();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_0, v5, v6, "startRequest: %s", v7, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  id v8 = [objc_allocWithZone((Class)SAStartRequest) init];
  [v8 setOrigin:SAInputOriginServerGeneratedValue];
  NSString v9 = sub_1DAA0();
  [v8 setUtterance:v9];

  id v10 = [objc_allocWithZone((Class)SASendCommands) init];
  sub_6FF8(&qword_294D0);
  uint64_t v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = xmmword_1F560;
  *(void *)(v11 + 32) = v8;
  v18[0] = v11;
  sub_1DC00();
  v12 = v8;
  sub_6FF8(&qword_294D8);
  Class isa = sub_1DBD0().super.isa;
  swift_bridgeObjectRelease();
  [v10 setCommands:isa];

  sub_1D870();
  sub_703C(v18, v18[3]);
  sub_1D950();
  sub_7080((uint64_t)v18);
  uint64_t v14 = sub_1DA20();
  os_log_type_t v15 = sub_1DC30();
  if (os_log_type_enabled(v14, v15))
  {
    v16 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v16 = 0;
    _os_log_impl(&dword_0, v14, v15, "submit SAStartRequest ", v16, 2u);
    swift_slowDealloc();
    uint64_t v17 = v12;
  }
  else
  {
    uint64_t v17 = v14;
    uint64_t v14 = v12;
  }
}

uint64_t sub_6FC0(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_6FF8(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

void *sub_703C(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_7080(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_70D0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_6FF8(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t *sub_712C(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t sub_7190(uint64_t a1)
{
  uint64_t v2 = sub_1D9B0();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  v36 = (char *)&v30 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_1D9C0();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  v38 = (char *)&v30 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1D990();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v30 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_28FC8 != -1) {
    swift_once();
  }
  uint64_t v12 = sub_1DA30();
  uint64_t v13 = sub_6FC0(v12, (uint64_t)qword_2BF10);
  uint64_t v14 = *(void (**)(char *, uint64_t, uint64_t))(v9 + 16);
  uint64_t v37 = a1;
  v14(v11, a1, v8);
  uint64_t v35 = v13;
  os_log_type_t v15 = sub_1DA20();
  os_log_type_t v16 = sub_1DC40();
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v17 = swift_slowAlloc();
    uint64_t v34 = v2;
    uint64_t v18 = (uint8_t *)v17;
    uint64_t v19 = swift_slowAlloc();
    uint64_t v33 = v5;
    uint64_t v40 = v19;
    uint64_t v31 = v6;
    uint64_t v32 = v3;
    *(_DWORD *)uint64_t v18 = 136315138;
    uint64_t v20 = sub_1D970();
    uint64_t v39 = sub_1B87C(v20, v21, &v40);
    uint64_t v6 = v31;
    uint64_t v3 = v32;
    sub_1DD00();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    _os_log_impl(&dword_0, v15, v16, "edutainment input is: %s", v18, 0xCu);
    swift_arrayDestroy();
    uint64_t v5 = v33;
    swift_slowDealloc();
    uint64_t v2 = v34;
    swift_slowDealloc();
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }

  uint64_t v22 = v38;
  sub_1D980();
  if ((*(unsigned int (**)(char *, uint64_t))(v6 + 88))(v22, v5) == enum case for Parse.directInvocation(_:))
  {
    (*(void (**)(char *, uint64_t))(v6 + 96))(v22, v5);
    uint64_t v23 = v36;
    (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v36, v22, v2);
    uint64_t v24 = sub_18C70();
    if (v24)
    {
      sub_8BF8(v24);
      swift_release();
      (*(void (**)(char *, uint64_t))(v3 + 8))(v23, v2);
      return 1;
    }
    (*(void (**)(char *, uint64_t))(v3 + 8))(v23, v2);
  }
  else
  {
    uint64_t v26 = v6;
    uint64_t v27 = sub_1DA20();
    os_log_type_t v28 = sub_1DC60();
    if (os_log_type_enabled(v27, v28))
    {
      v29 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v29 = 0;
      _os_log_impl(&dword_0, v27, v28, "please use directInvocaion instead.", v29, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v26 + 8))(v22, v5);
  }
  return 0;
}

uint64_t sub_7664(uint64_t a1)
{
  v2[5] = a1;
  v2[6] = v1;
  uint64_t v3 = sub_1DA30();
  v2[7] = v3;
  v2[8] = *(void *)(v3 - 8);
  v2[9] = swift_task_alloc();
  return _swift_task_switch(sub_7724, 0, 0);
}

uint64_t sub_7724()
{
  v49 = v0;
  uint64_t v1 = v0[6];
  unint64_t v2 = *(void *)(v1 + 16);
  unint64_t v3 = *(void *)(v1 + 24);
  switch(v3 >> 62)
  {
    case 1uLL:
      sub_9CAC(*(void *)(v1 + 16), *(void *)(v1 + 24));
      uint64_t v8 = qword_28FC8;
      swift_retain();
      if (v8 != -1) {
        swift_once();
      }
      sub_6FC0(v0[7], (uint64_t)qword_2BF10);
      uint64_t v9 = sub_1DA20();
      os_log_type_t v10 = sub_1DC30();
      if (os_log_type_enabled(v9, v10))
      {
        uint64_t v11 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v11 = 0;
        _os_log_impl(&dword_0, v9, v10, "step2: push play/resume flow", v11, 2u);
        swift_slowDealloc();
      }
      uint64_t v12 = v0[6];

      uint64_t v13 = *(void *)(v12 + 88);
      if (v2)
      {
        sub_9CAC(v2, v3);
        swift_retain();
        v0[4] = sub_1A83C(v3 & 0x3FFFFFFFFFFFFFFFLL, v13);
        type metadata accessor for EdutainmentGameFlow();
        sub_AB84(&qword_29698, (void (*)(uint64_t))type metadata accessor for EdutainmentGameFlow);
      }
      else
      {
        type metadata accessor for EdutainmentGameFlow();
        uint64_t v14 = swift_allocObject();
        *(_OWORD *)(v14 + 16) = 0u;
        *(_OWORD *)(v14 + 32) = 0u;
        *(_OWORD *)(v14 + 48) = 0u;
        *(_OWORD *)(v14 + 64) = 0u;
        *(_OWORD *)(v14 + 80) = 0u;
        *(void *)(v14 + 120) = v3 & 0x3FFFFFFFFFFFFFFFLL;
        *(void *)(v14 + 96) = 0;
        *(void *)(v14 + 104) = v13;
        *(unsigned char *)(v14 + 112) = 0;
        v0[3] = v14;
        sub_9CAC(v2, v3);
        sub_AB84(&qword_29698, (void (*)(uint64_t))type metadata accessor for EdutainmentGameFlow);
        swift_retain();
      }
      swift_retain();
      sub_1D8B0();
      swift_release();
      sub_9CD4(v2, v3);
      sub_9CD4(v2, v3);
      swift_release();
      goto LABEL_58;
    case 2uLL:
      if (qword_28FC8 != -1) {
        swift_once();
      }
      sub_6FC0(v0[7], (uint64_t)qword_2BF10);
      os_log_type_t v15 = sub_1DA20();
      os_log_type_t v16 = sub_1DC30();
      if (os_log_type_enabled(v15, v16))
      {
        uint64_t v17 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v17 = 0;
        _os_log_impl(&dword_0, v15, v16, "user ends game and flow completes1", v17, 2u);
        swift_slowDealloc();
      }

      if ((v2 & 1) == 0)
      {
        uint64_t v18 = v0[6];
        if (*(void *)(v18 + 80))
        {
          *(void *)(v18 + 80) = 0;
          if (qword_28FD0 != -1) {
            swift_once();
          }
          uint64_t v19 = qword_2BF28;
          if (qword_2BF28)
          {
            uint64_t v20 = swift_retain();
            sub_A8A8(v20, v19, (uint64_t)&unk_253B0, (uint64_t)sub_AC24, (uint64_t)&unk_253C8);
            swift_release();
          }
          swift_release();
        }
        goto LABEL_57;
      }
      v25 = sub_1DA20();
      os_log_type_t v26 = sub_1DC40();
      if (os_log_type_enabled(v25, v26))
      {
        uint64_t v27 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v27 = 0;
        _os_log_impl(&dword_0, v25, v26, "update NLContextUpdate", v27, 2u);
        swift_slowDealloc();
      }

      uint64_t v23 = (void *)swift_task_alloc();
      v0[11] = v23;
      *uint64_t v23 = v0;
      uint64_t v24 = sub_8390;
      goto LABEL_46;
    case 3uLL:
      if (!(v2 | v3 ^ 0xC000000000000000))
      {
        sub_1D8A0();
LABEL_58:
        swift_task_dealloc();
        v45 = (uint64_t (*)(void))v0[1];
        return v45();
      }
      if (v3 == 0xC000000000000000 && v2 == 1)
      {
        if (qword_28FC8 != -1) {
          swift_once();
        }
        sub_6FC0(v0[7], (uint64_t)qword_2BF10);
        os_log_type_t v28 = sub_1DA20();
        os_log_type_t v29 = sub_1DC30();
        if (os_log_type_enabled(v28, v29))
        {
          uint64_t v30 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v30 = 0;
          _os_log_impl(&dword_0, v28, v29, "user is answering and flow completes", v30, 2u);
          swift_slowDealloc();
        }

        uint64_t v23 = (void *)swift_task_alloc();
        v0[10] = v23;
        *uint64_t v23 = v0;
        uint64_t v24 = sub_822C;
      }
      else
      {
        if (v3 != 0xC000000000000000 || v2 != 2)
        {
          if (qword_28FC8 != -1) {
            swift_once();
          }
          uint64_t v33 = v0[8];
          uint64_t v32 = v0[9];
          uint64_t v34 = v0[7];
          uint64_t v35 = sub_6FC0(v34, (uint64_t)qword_2BF10);
          (*(void (**)(uint64_t, uint64_t, uint64_t))(v33 + 16))(v32, v35, v34);
          swift_retain_n();
          v36 = sub_1DA20();
          os_log_type_t v37 = sub_1DC30();
          if (os_log_type_enabled(v36, v37))
          {
            v38 = (uint8_t *)swift_slowAlloc();
            uint64_t v48 = swift_slowAlloc();
            *(_DWORD *)v38 = 136315138;
            unint64_t v39 = 0xEA0000000000657ALL;
            uint64_t v40 = 0x696C616974696E69;
            switch(*(void *)(v1 + 24) >> 62)
            {
              case 1:
                unint64_t v39 = 0xEF656D6167207961;
                uint64_t v40 = 0x6C70207472617473;
                break;
              case 2:
                unint64_t v39 = 0xEE00656D61672073;
                uint64_t v40 = 0x646E652072657375;
                break;
              case 3:
                uint64_t v40 = 0xD000000000000011;
                unint64_t v39 = 0x800000000001E800;
                switch(*(void *)(v1 + 16))
                {
                  case 1:
                    goto LABEL_56;
                  case 2:
                    uint64_t v40 = 0xD00000000000002CLL;
                    unint64_t v39 = 0x800000000001E7D0;
                    break;
                  case 3:
                    unint64_t v39 = 0xEF7465792074726FLL;
                    uint64_t v40 = 0x7070757320746F6ELL;
                    break;
                  case 4:
                    unint64_t v39 = 0xEB00000000726F72;
                    uint64_t v40 = 0x7265207475706E69;
                    break;
                  default:
                    unint64_t v39 = 0xEF7475706E692072;
                    uint64_t v40 = 0x657375206465656ELL;
                    break;
                }
                break;
              default:
                break;
            }
LABEL_56:
            uint64_t v44 = v0[8];
            uint64_t v46 = v0[7];
            uint64_t v47 = v0[9];
            v0[2] = sub_1B87C(v40, v39, &v48);
            sub_1DD00();
            swift_release_n();
            swift_bridgeObjectRelease();
            _os_log_impl(&dword_0, v36, v37, "%s and flow completes", v38, 0xCu);
            swift_arrayDestroy();
            swift_slowDealloc();
            swift_slowDealloc();

            (*(void (**)(uint64_t, uint64_t))(v44 + 8))(v47, v46);
          }
          else
          {
            uint64_t v42 = v0[8];
            uint64_t v41 = v0[9];
            uint64_t v43 = v0[7];

            swift_release_n();
            (*(void (**)(uint64_t, uint64_t))(v42 + 8))(v41, v43);
          }
LABEL_57:
          sub_1D8C0();
          goto LABEL_58;
        }
        uint64_t v23 = (void *)swift_task_alloc();
        v0[12] = v23;
        *uint64_t v23 = v0;
        uint64_t v24 = sub_8584;
      }
LABEL_46:
      v23[1] = v24;
      return sub_6510();
    default:
      uint64_t v4 = qword_28FC8;
      swift_retain_n();
      if (v4 != -1) {
        swift_once();
      }
      sub_6FC0(v0[7], (uint64_t)qword_2BF10);
      uint64_t v5 = sub_1DA20();
      os_log_type_t v6 = sub_1DC30();
      if (os_log_type_enabled(v5, v6))
      {
        uint64_t v7 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v7 = 0;
        _os_log_impl(&dword_0, v5, v6, "step1: initialize", v7, 2u);
        swift_slowDealloc();
      }

      sub_8F94(v2);
      sub_1D8A0();
      sub_9CD4(v2, v3);
      sub_9CD4(v2, v3);
      goto LABEL_58;
  }
}

uint64_t sub_822C()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_8328, 0, 0);
}

uint64_t sub_8328()
{
  sub_1D8C0();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_8390()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_848C, 0, 0);
}

uint64_t sub_848C()
{
  uint64_t v1 = *(void *)(v0 + 48);
  if (*(void *)(v1 + 80))
  {
    *(void *)(v1 + 80) = 0;
    if (qword_28FD0 != -1) {
      swift_once();
    }
    uint64_t v2 = qword_2BF28;
    if (qword_2BF28)
    {
      uint64_t v3 = swift_retain();
      sub_A8A8(v3, v2, (uint64_t)&unk_253B0, (uint64_t)sub_AC24, (uint64_t)&unk_253C8);
      swift_release();
    }
    swift_release();
  }
  sub_1D8C0();
  swift_task_dealloc();
  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

uint64_t sub_8584()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_AC34, 0, 0);
}

uint64_t sub_8680(uint64_t a1, uint64_t a2)
{
  if (qword_28FC8 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_1DA30();
  sub_6FC0(v3, (uint64_t)qword_2BF10);
  uint64_t v4 = sub_1DA20();
  os_log_type_t v5 = sub_1DC30();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl(&dword_0, v4, v5, "step3: complete playing flow", v6, 2u);
    swift_slowDealloc();
  }

  uint64_t v7 = *(void *)(a2 + 16);
  unint64_t v8 = *(void *)(a2 + 24);
  *(_OWORD *)(a2 + 16) = xmmword_1F5C0;

  return sub_9CD4(v7, v8);
}

unint64_t sub_877C(uint64_t a1, unint64_t a2)
{
  unint64_t result = 0x696C616974696E69;
  switch(a2 >> 62)
  {
    case 1uLL:
      unint64_t result = 0x6C70207472617473;
      break;
    case 2uLL:
      unint64_t result = 0x646E652072657375;
      break;
    case 3uLL:
      unint64_t result = 0xD000000000000011;
      switch(a1)
      {
        case 1:
          return result;
        case 2:
          unint64_t result = 0xD00000000000002CLL;
          break;
        case 3:
          unint64_t result = 0x7070757320746F6ELL;
          break;
        case 4:
          unint64_t result = 0x7265207475706E69;
          break;
        default:
          unint64_t result = 0x657375206465656ELL;
          break;
      }
      break;
    default:
      return result;
  }
  return result;
}

void *sub_88E8()
{
  uint64_t v1 = v0;
  uint64_t v2 = v0[10];
  if (v2)
  {
    switch(*(unsigned char *)(v2 + 90))
    {
      case 1:
      case 2:
      case 3:
      case 4:
        char v3 = sub_1DF50();
        swift_retain();
        swift_bridgeObjectRelease();
        if ((v3 & 1) == 0) {
          goto LABEL_19;
        }
        goto LABEL_5;
      case 5:
        break;
      default:
        swift_retain();
        swift_bridgeObjectRelease();
LABEL_5:
        unint64_t v4 = *(void *)(v2 + 104);
        if (v4 < 2) {
          goto LABEL_19;
        }
        if (!((v4 & 0x2000000000000000) != 0 ? HIBYTE(v4) & 0xF : *(void *)(v2 + 96) & 0xFFFFFFFFFFFFLL)) {
          goto LABEL_19;
        }
        if (qword_28FD0 != -1) {
          swift_once();
        }
        uint64_t v6 = qword_2BF28;
        if (qword_2BF28)
        {
          uint64_t v7 = swift_retain();
          sub_A8A8(v7, v6, (uint64_t)&unk_25360, (uint64_t)sub_A790, (uint64_t)&unk_25378);
          swift_release();
        }
        v1[10] = 0;
        swift_release();
        if (qword_28FC8 != -1) {
          swift_once();
        }
        uint64_t v8 = sub_1DA30();
        sub_6FC0(v8, (uint64_t)qword_2BF10);
        uint64_t v9 = sub_1DA20();
        os_log_type_t v10 = sub_1DC40();
        if (os_log_type_enabled(v9, v10))
        {
          uint64_t v11 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v11 = 0;
          _os_log_impl(&dword_0, v9, v10, "deinit", v11, 2u);
          swift_slowDealloc();
          swift_release();
        }
        else
        {

LABEL_19:
          swift_release();
        }
        break;
    }
  }
  sub_9CD4(v1[2], v1[3]);
  sub_A858(v1[4], v1[5]);
  swift_release();
  swift_release();
  sub_7080((uint64_t)(v1 + 12));
  return v1;
}

uint64_t sub_8BA0()
{
  sub_88E8();

  return _swift_deallocClassInstance(v0, 136, 7);
}

uint64_t type metadata accessor for EdutainmentDispatchFlow()
{
  return self;
}

uint64_t sub_8BF8(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 56);
  uint64_t v9 = *(void *)(a1 + 64);
  uint64_t v8 = *(void *)(a1 + 72);
  uint64_t v10 = v2[4];
  uint64_t v11 = v2[5];
  v2[4] = v4;
  v2[5] = v5;
  v2[6] = v6;
  v2[7] = v7;
  v2[8] = v9;
  v2[9] = v8;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_A858(v10, v11);
  int v12 = 1 << *(unsigned char *)(a1 + 90);
  if ((v12 & 0xD) != 0)
  {
    if (qword_28FC8 != -1) {
      swift_once();
    }
    uint64_t v13 = sub_1DA30();
    sub_6FC0(v13, (uint64_t)qword_2BF10);
    swift_retain_n();
    uint64_t v14 = sub_1DA20();
    os_log_type_t v15 = sub_1DC40();
    if (os_log_type_enabled(v14, v15))
    {
      os_log_type_t v16 = (uint8_t *)swift_slowAlloc();
      uint64_t v29 = swift_slowAlloc();
      *(_DWORD *)os_log_type_t v16 = 136315138;
      sub_6FF8(&qword_29678);
      uint64_t v17 = sub_1DCF0();
      sub_1B87C(v17, v18, &v29);
      sub_1DD00();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_0, v14, v15, "edutainment new clientAction = %s", v16, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_release_n();
    }
    uint64_t v22 = v2[2];
    unint64_t v23 = v2[3];
    v2[2] = a1;
    v2[3] = 0;
    swift_retain();
    return sub_9CD4(v22, v23);
  }
  else
  {
    if ((v12 & 0x30) != 0)
    {
      uint64_t v19 = v2[2];
      unint64_t v20 = v2[3];
      long long v21 = xmmword_1F5E0;
    }
    else
    {
      sub_703C(v2 + 12, v2[15]);
      if (sub_1D880())
      {
        if (qword_28FC8 != -1) {
          swift_once();
        }
        uint64_t v25 = sub_1DA30();
        sub_6FC0(v25, (uint64_t)qword_2BF10);
        os_log_type_t v26 = sub_1DA20();
        os_log_type_t v27 = sub_1DC30();
        if (os_log_type_enabled(v26, v27))
        {
          os_log_type_t v28 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)os_log_type_t v28 = 0;
          _os_log_impl(&dword_0, v26, v27, "Device is locked when user end game", v28, 2u);
          swift_slowDealloc();
        }
      }
      else
      {
        v2[10] = a1;
        swift_retain();
        swift_release();
      }
      uint64_t v19 = v2[2];
      unint64_t v20 = v2[3];
      long long v21 = xmmword_1F5D0;
    }
    *((_OWORD *)v2 + 1) = v21;
    return sub_9CD4(v19, v20);
  }
}

uint64_t sub_8F94(unint64_t a1)
{
  uint64_t v2 = v1;
  if (a1 && (uint64_t v3 = v1[5]) != 0)
  {
    unint64_t v4 = a1;
    uint64_t v5 = v1[4];
    uint64_t v6 = v1[8];
    uint64_t v7 = v2[9];
    uint64_t v8 = v2[6];
    uint64_t v9 = v2[7];
    uint64_t v69 = v2[4];
    uint64_t v70 = v3;
    uint64_t v71 = v8;
    uint64_t v72 = v9;
    uint64_t v73 = v6;
    uint64_t v74 = v7;
    uint64_t v65 = *(unsigned __int8 *)(a1 + 90);
    swift_retain();
    sub_A5C0(v5, v3);
    if (qword_28FC8 != -1) {
      swift_once();
    }
    uint64_t v10 = sub_1DA30();
    sub_6FC0(v10, (uint64_t)qword_2BF10);
    uint64_t v11 = sub_1DA20();
    os_log_type_t v12 = sub_1DC40();
    if (os_log_type_enabled(v11, v12))
    {
      uint64_t v13 = (uint8_t *)swift_slowAlloc();
      *(void *)&long long v66 = swift_slowAlloc();
      *(_DWORD *)uint64_t v13 = 136315138;
      sub_6FF8(&qword_29678);
      uint64_t v14 = sub_1DCF0();
      sub_1B87C(v14, v15, (uint64_t *)&v66);
      sub_1DD00();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_0, v11, v12, "edutainment clientAction = %s", v13, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    if (v2[10])
    {
      unint64_t v16 = v2[10];
    }
    else
    {
      swift_retain();
      unint64_t v16 = v4;
    }
    sub_703C(v2 + 12, v2[15]);
    swift_retain();
    if (sub_1D880())
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v24 = sub_1DA20();
      os_log_type_t v25 = sub_1DC30();
      if (os_log_type_enabled(v24, v25))
      {
        os_log_type_t v26 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)os_log_type_t v26 = 0;
        _os_log_impl(&dword_0, v24, v25, "device is locked, so play game directly.", v26, 2u);
        swift_slowDealloc();
      }

      switch(v65)
      {
        case 2:
          swift_bridgeObjectRelease();
          goto LABEL_33;
        case 5:
          goto LABEL_35;
        default:
          char v32 = sub_1DF50();
          swift_bridgeObjectRelease();
          if (v32)
          {
LABEL_33:
            uint64_t v33 = sub_1DA20();
            os_log_type_t v34 = sub_1DC40();
            if (os_log_type_enabled(v33, v34))
            {
              uint64_t v35 = (uint8_t *)swift_slowAlloc();
              *(_WORD *)uint64_t v35 = 0;
              _os_log_impl(&dword_0, v33, v34, "device is locked, server clientAction is resume", v35, 2u);
              swift_slowDealloc();

              swift_release();
            }
            else
            {
              swift_release();
            }
            uint64_t v39 = v2[2];
            unint64_t v40 = v2[3];
            v2[2] = 0;
            v2[3] = v16 | 0x4000000000000000;
            return sub_9CD4(v39, v40);
          }
LABEL_35:
          v36 = sub_1DA20();
          os_log_type_t v37 = sub_1DC40();
          if (os_log_type_enabled(v36, v37))
          {
            v38 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)v38 = 0;
            _os_log_impl(&dword_0, v36, v37, "device is locked, server clientAction is update or end", v38, 2u);
            swift_slowDealloc();

            swift_release();
            goto LABEL_58;
          }
          swift_release();
          swift_release();

          break;
      }
LABEL_59:
      uint64_t v39 = v2[2];
      unint64_t v40 = v2[3];
      *((_OWORD *)v2 + 1) = xmmword_1F5F0;
      return sub_9CD4(v39, v40);
    }
    else
    {
      swift_retain_n();
      os_log_type_t v27 = sub_1DA20();
      os_log_type_t v28 = sub_1DC40();
      if (os_log_type_enabled(v27, v28))
      {
        uint64_t v29 = (uint8_t *)swift_slowAlloc();
        *(void *)&long long v66 = swift_slowAlloc();
        *(_DWORD *)uint64_t v29 = 136315138;
        uint64_t v30 = sub_10824();
        sub_1B87C(v30, v31, (uint64_t *)&v66);
        sub_1DD00();
        swift_bridgeObjectRelease();
        swift_release_n();
        _os_log_impl(&dword_0, v27, v28, "edutainment game state = %s", v29, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {
        swift_release_n();
      }

      if (*(void *)(v16 + 32) == v5 && v3 == *(void *)(v16 + 40)
        || (sub_1DF50() & 1) != 0
        || *(void *)(v16 + 104) == 1)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      else
      {
        unint64_t v62 = v4;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        uint64_t v42 = sub_1DA20();
        os_log_type_t v43 = sub_1DC40();
        if (os_log_type_enabled(v42, v43))
        {
          uint64_t v44 = (uint8_t *)swift_slowAlloc();
          *(void *)&long long v66 = swift_slowAlloc();
          *(_DWORD *)uint64_t v44 = 136315138;
          uint64_t v45 = sub_AEB0();
          sub_1B87C(v45, v46, (uint64_t *)&v66);
          sub_1DD00();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease_n();
          swift_bridgeObjectRelease_n();
          swift_bridgeObjectRelease_n();
          _os_log_impl(&dword_0, v42, v43, "edutainment newGame = %s", v44, 0xCu);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();
        }
        else
        {
          swift_bridgeObjectRelease_n();
          swift_bridgeObjectRelease_n();
          swift_bridgeObjectRelease_n();
        }

        unint64_t v4 = v62;
        if (qword_28FD0 != -1) {
          swift_once();
        }
        uint64_t v60 = qword_2BF28;
        if (qword_2BF28)
        {
          uint64_t v61 = swift_retain();
          sub_A8A8(v61, v60, (uint64_t)&unk_25360, (uint64_t)sub_A790, (uint64_t)&unk_25378);
          swift_release();
        }
        v2[10] = v62;
        swift_retain();
        swift_release();
      }
      switch(v65)
      {
        case 2:
LABEL_42:
          swift_bridgeObjectRelease();
          break;
        case 5:
LABEL_51:
          v56 = sub_1DA20();
          os_log_type_t v57 = sub_1DC30();
          if (os_log_type_enabled(v56, v57))
          {
            v58 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)v58 = 0;
            _os_log_impl(&dword_0, v56, v57, "update edutainment gameState", v58, 2u);
            swift_slowDealloc();

            swift_release();
          }
          else
          {
            swift_release();
          }
          v2[10] = v4;
LABEL_58:
          swift_release();
          goto LABEL_59;
        default:
          char v41 = sub_1DF50();
          swift_bridgeObjectRelease();
          if ((v41 & 1) == 0)
          {
            switch(v65)
            {
              case 3:
                goto LABEL_42;
              default:
                char v47 = sub_1DF50();
                swift_bridgeObjectRelease();
                if (v47) {
                  goto LABEL_46;
                }
                goto LABEL_51;
            }
          }
          break;
      }
LABEL_46:
      if (qword_28FD0 != -1) {
        swift_once();
      }
      if (qword_2BF28)
      {
        unint64_t v48 = v16;
        uint64_t v50 = v2[4];
        uint64_t v49 = v2[5];
        uint64_t v52 = v2[6];
        uint64_t v51 = v2[7];
        uint64_t v54 = v2[8];
        uint64_t v53 = v2[9];
        if (v49)
        {
          *((void *)&v67 + 1) = &type metadata for EdutainmentGame;
          v68 = &off_25478;
          v55 = (void *)swift_allocObject();
          *(void *)&long long v66 = v55;
          v55[2] = v50;
          v55[3] = v49;
          v55[4] = v52;
          v55[5] = v51;
          v55[6] = v54;
          v55[7] = v53;
        }
        else
        {
          v68 = 0;
          long long v66 = 0u;
          long long v67 = 0u;
        }
        uint64_t v64 = *(void *)(v4 + 176);
        int log = *(unsigned __int8 *)(v4 + 184);
        uint64_t v59 = swift_allocObject();
        *(void *)(v59 + 16) = v2;
        *(unsigned char *)(v59 + 24) = v65;
        *(void *)(v59 + 32) = v4;
        *(void *)(v59 + 40) = v48;
        swift_retain();
        swift_retain();
        sub_A5C0(v50, v49);
        swift_retain();
        sub_1ADD4((uint64_t)&v66, v64, log, (uint64_t)sub_A658, v59);
        swift_release();
        swift_release();
        swift_release();
        return sub_A668((uint64_t)&v66);
      }
      else
      {
        swift_release();
        return swift_release();
      }
    }
  }
  else
  {
    if (qword_28FC8 != -1) {
      swift_once();
    }
    uint64_t v17 = sub_1DA30();
    sub_6FC0(v17, (uint64_t)qword_2BF10);
    unint64_t v18 = sub_1DA20();
    os_log_type_t v19 = sub_1DC50();
    if (os_log_type_enabled(v18, v19))
    {
      unint64_t v20 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v20 = 0;
      _os_log_impl(&dword_0, v18, v19, "invalid game state", v20, 2u);
      swift_slowDealloc();
    }

    uint64_t v21 = v2[2];
    unint64_t v22 = v2[3];
    *((_OWORD *)v2 + 1) = xmmword_1F600;
    return sub_9CD4(v21, v22);
  }
}

uint64_t *initializeBufferWithCopyOfBuffer for EdutainmentDispatchFlow.EdutainmentFlowState(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  unint64_t v4 = a2[1];
  sub_9CAC(*a2, v4);
  *a1 = v3;
  a1[1] = v4;
  return a1;
}

uint64_t sub_9CAC(uint64_t a1, unint64_t a2)
{
  if ((a2 >> 62) <= 1) {
    return swift_retain();
  }
  return result;
}

uint64_t destroy for EdutainmentDispatchFlow.EdutainmentFlowState(uint64_t a1)
{
  return sub_9CD4(*(void *)a1, *(void *)(a1 + 8));
}

uint64_t sub_9CD4(uint64_t a1, unint64_t a2)
{
  if ((a2 >> 62) <= 1) {
    return swift_release();
  }
  return result;
}

uint64_t *assignWithCopy for EdutainmentDispatchFlow.EdutainmentFlowState(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  unint64_t v4 = a2[1];
  sub_9CAC(*a2, v4);
  uint64_t v5 = *a1;
  unint64_t v6 = a1[1];
  *a1 = v3;
  a1[1] = v4;
  sub_9CD4(v5, v6);
  return a1;
}

__n128 initializeWithTake for EdutainmentDispatchFlow.EdutainmentFlowState(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t *assignWithTake for EdutainmentDispatchFlow.EdutainmentFlowState(uint64_t *a1, _OWORD *a2)
{
  uint64_t v3 = *a1;
  unint64_t v4 = a1[1];
  *(_OWORD *)a1 = *a2;
  sub_9CD4(v3, v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for EdutainmentDispatchFlow.EdutainmentFlowState(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7D && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 125);
  }
  unsigned int v3 = (((*(void *)(a1 + 8) >> 57) >> 5) | (4
                                                          * ((*(void *)(a1 + 8) >> 57) & 0x18 | *(void *)(a1 + 8) & 7))) ^ 0x7F;
  if (v3 >= 0x7C) {
    unsigned int v3 = -1;
  }
  return v3 + 1;
}

uint64_t storeEnumTagSinglePayload for EdutainmentDispatchFlow.EdutainmentFlowState(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7C)
  {
    *(void *)__n128 result = a2 - 125;
    *(void *)(result + 8) = 0;
    if (a3 >= 0x7D) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7D) {
      *(unsigned char *)(result + 16) = 0;
    }
    if (a2)
    {
      uint64_t v3 = (-a2 >> 2) & 0x1F | (32 * (-a2 & 0x7F));
      *(void *)__n128 result = 0;
      *(void *)(result + 8) = (v3 | (v3 << 57)) & 0xF000000000000007;
    }
  }
  return result;
}

uint64_t sub_9E2C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 8) >> 62;
  if (v1 == 3) {
    return (*(_DWORD *)a1 + 3);
  }
  else {
    return v1;
  }
}

uint64_t sub_9E48(uint64_t result)
{
  *(void *)(result + 8) &= 0x3FFFFFFFFFFFFFFFuLL;
  return result;
}

void *sub_9E58(void *result, uint64_t a2)
{
  if (a2 < 3)
  {
    result[1] = result[1] & 0xFFFFFFFFFFFFFF8 | (a2 << 62);
  }
  else
  {
    *__n128 result = (a2 - 3);
    result[1] = 0xC000000000000000;
  }
  return result;
}

ValueMetadata *type metadata accessor for EdutainmentDispatchFlow.EdutainmentFlowState()
{
  return &type metadata for EdutainmentDispatchFlow.EdutainmentFlowState;
}

uint64_t sub_9E90(uint64_t a1, void *a2, char a3, uint64_t a4, uint64_t a5)
{
  if (a1)
  {
    uint64_t v9 = qword_28FC8;
    swift_retain();
    if (v9 != -1) {
      swift_once();
    }
    uint64_t v10 = sub_1DA30();
    sub_6FC0(v10, (uint64_t)qword_2BF10);
    swift_retain_n();
    uint64_t v11 = sub_1DA20();
    os_log_type_t v12 = sub_1DC40();
    if (os_log_type_enabled(v11, v12))
    {
      uint64_t v13 = (uint8_t *)swift_slowAlloc();
      uint64_t v25 = swift_slowAlloc();
      *(_DWORD *)uint64_t v13 = 136315138;
      uint64_t v14 = sub_10824();
      sub_1B87C(v14, v15, &v25);
      sub_1DD00();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_0, v11, v12, "edutainment storedGameState = %s", v13, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_release_n();
    }
    uint64_t v20 = a1;
    switch(a3)
    {
      case 3:
        swift_bridgeObjectRelease();
        uint64_t v20 = a4;
        break;
      case 5:
        break;
      default:
        char v21 = sub_1DF50();
        swift_bridgeObjectRelease();
        if (v21) {
          uint64_t v20 = a4;
        }
        else {
          uint64_t v20 = a1;
        }
        break;
    }
    a2[10] = v20;
    swift_retain();
    swift_release();
    uint64_t v22 = a2[10];
    if (!v22)
    {
      __break(1u);
      JUMPOUT(0xA1D8);
    }
    swift_retain();
    swift_release();
    uint64_t v23 = a2[2];
    unint64_t v24 = a2[3];
    a2[2] = 1;
    a2[3] = v22 | 0x4000000000000000;
    return sub_9CD4(v23, v24);
  }
  else
  {
    a2[10] = a4;
    swift_retain();
    swift_release();
    uint64_t v17 = a2[2];
    unint64_t v18 = a2[3];
    a2[2] = 0;
    a2[3] = a5 | 0x4000000000000000;
    swift_retain();
    return sub_9CD4(v17, v18);
  }
}

unint64_t sub_A1F0()
{
  return sub_877C(*(void *)v0, *(void *)(v0 + 8));
}

uint64_t sub_A1F8(uint64_t a1)
{
  return sub_7190(a1) & 1;
}

uint64_t sub_A220(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  void *v7 = v3;
  v7[1] = sub_A2D0;
  return Flow.onAsync(input:)(a1, a2, a3);
}

uint64_t sub_A2D0(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

uint64_t sub_A3CC()
{
  return sub_1D800();
}

uint64_t sub_A428(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_A4C4;
  return sub_7664(a1);
}

uint64_t sub_A4C4()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_A5C0(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_A610()
{
  swift_release();
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_A658(uint64_t a1)
{
  return sub_9E90(a1, *(void **)(v1 + 16), *(unsigned char *)(v1 + 24), *(void *)(v1 + 32), *(void *)(v1 + 40));
}

uint64_t sub_A668(uint64_t a1)
{
  uint64_t v2 = sub_6FF8(&qword_29670);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_A6C8()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 64, 7);
}

uint64_t sub_A710(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_A778(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_A790()
{
  return sub_1AD34((void *)(v0 + 16), *(void *)(v0 + 56));
}

uint64_t sub_A79C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_A7AC()
{
  return swift_release();
}

unint64_t sub_A7B4()
{
  unint64_t result = qword_29690;
  if (!qword_29690)
  {
    sub_A810(&qword_29688);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_29690);
  }
  return result;
}

uint64_t sub_A810(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_A858(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_A8A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9 = sub_1DA50();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin();
  os_log_type_t v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = sub_1DA70();
  uint64_t v13 = *(void *)(v20 - 8);
  __chkstk_darwin();
  unint64_t v15 = (char *)&v19 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24[3] = type metadata accessor for GameState();
  v24[4] = &off_25900;
  v24[0] = a1;
  uint64_t v19 = *(void *)(a2 + 24);
  sub_A710((uint64_t)v24, (uint64_t)v23);
  uint64_t v16 = swift_allocObject();
  sub_A778(v23, v16 + 16);
  *(void *)(v16 + 56) = a2;
  aBlock[4] = a4;
  aBlock[5] = v16;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1AD90;
  aBlock[3] = a5;
  uint64_t v17 = _Block_copy(aBlock);
  swift_retain();
  swift_retain();
  sub_1DA60();
  char v21 = &_swiftEmptyArrayStorage;
  sub_AB84(&qword_29680, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_6FF8(&qword_29688);
  sub_A7B4();
  sub_1DD30();
  sub_1DC90();
  _Block_release(v17);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v20);
  swift_release();
  return sub_7080((uint64_t)v24);
}

uint64_t sub_AB7C(uint64_t a1)
{
  return sub_8680(a1, v1);
}

uint64_t sub_AB84(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_ABCC()
{
  uint64_t v1 = *(void *)(v0 + 16);
  unint64_t v2 = *(void *)(v0 + 24);
  *(_OWORD *)(v0 + 16) = xmmword_1F5C0;
  return sub_9CD4(v1, v2);
}

uint64_t sub_ABE4()
{
  sub_7080(v0 + 16);
  swift_release();

  return _swift_deallocObject(v0, 64, 7);
}

uint64_t sub_AC24()
{
  return sub_1B690((void *)(v0 + 16), *(void *)(v0 + 56));
}

uint64_t initializeBufferWithCopyOfBuffer for ConversationData(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for EdutainmentGame()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for EdutainmentGame(void *a1, void *a2)
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
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for EdutainmentGame(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 initializeWithTake for EdutainmentGame(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

void *assignWithTake for EdutainmentGame(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = a2[5];
  a1[4] = a2[4];
  a1[5] = v6;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for EdutainmentGame(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 48)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for EdutainmentGame(uint64_t result, int a2, int a3)
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 48) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for EdutainmentGame()
{
  return &type metadata for EdutainmentGame;
}

uint64_t sub_AEB0()
{
  uint64_t v1 = *v0;
  unint64_t v2 = (void *)v0[1];
  swift_bridgeObjectRetain();
  v8._countAndFlagsBits = v1;
  v8._object = v2;
  sub_1DB60(v8);
  swift_bridgeObjectRelease();
  v9._countAndFlagsBits = 2592;
  v9._object = (void *)0xE200000000000000;
  sub_1DB60(v9);
  uint64_t v3 = v0[2];
  uint64_t v4 = (void *)v0[3];
  swift_bridgeObjectRetain();
  v10._countAndFlagsBits = v3;
  v10._object = v4;
  sub_1DB60(v10);
  swift_bridgeObjectRelease();
  v11._countAndFlagsBits = 2592;
  v11._object = (void *)0xE200000000000000;
  sub_1DB60(v11);
  swift_bridgeObjectRetain();
  v12._countAndFlagsBits = 0x79726F6765746163;
  v12._object = (void *)0xE90000000000003ALL;
  sub_1DB60(v12);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v0[5])
  {
    uint64_t v5 = v0[4];
    uint64_t v6 = (void *)v0[5];
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v6 = (void *)0xE000000000000000;
  }
  swift_bridgeObjectRetain();
  v13._countAndFlagsBits = v5;
  v13._object = v6;
  sub_1DB60(v13);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  v14._countAndFlagsBits = 0x6C75636966666964;
  v14._object = (void *)0xEB000000003A7974;
  sub_1DB60(v14);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return 0x3A656D616ELL;
}

uint64_t sub_B044()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_B074()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_B0A4(char a1)
{
  uint64_t v1 = 8 * a1;
  v3._countAndFlagsBits = *(void *)&aPlay_2[v1];
  v3._object = *(void **)((char *)&unk_1F7E0 + v1);
  sub_1DB60(v3);
  swift_bridgeObjectRelease();
  v4._countAndFlagsBits = 39;
  v4._object = (void *)0xE100000000000000;
  sub_1DB60(v4);
  return 39;
}

uint64_t sub_B118(char a1)
{
  unint64_t v2 = (void *)0x800000000001E590;
  v3._countAndFlagsBits = 0xD000000000000013;
  switch(a1)
  {
    case 1:
      unint64_t v2 = (void *)0xE300000000000000;
      v3._countAndFlagsBits = 6581861;
      break;
    case 2:
      unint64_t v2 = (void *)0xE600000000000000;
      v3._countAndFlagsBits = 0x656D75736572;
      break;
    case 3:
      break;
    case 4:
      unint64_t v2 = (void *)0xE700000000000000;
      v3._countAndFlagsBits = 0x6E776F6E6B6E75;
      break;
    default:
      unint64_t v2 = (void *)0xE600000000000000;
      v3._countAndFlagsBits = 0x657461647075;
      break;
  }
  v3._object = v2;
  sub_1DB60(v3);
  swift_bridgeObjectRelease();
  v5._countAndFlagsBits = 39;
  v5._object = (void *)0xE100000000000000;
  sub_1DB60(v5);
  return 39;
}

uint64_t destroy for EdutainmentQuestion()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for EdutainmentQuestion(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  uint64_t v5 = *(void *)(a2 + 80);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = v5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for EdutainmentQuestion(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 initializeWithTake for EdutainmentQuestion(uint64_t a1, uint64_t a2)
{
  long long v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  __n128 result = *(__n128 *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  long long v5 = *(_OWORD *)(a2 + 64);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)(a1 + 64) = v5;
  *(__n128 *)(a1 + 32) = result;
  return result;
}

uint64_t assignWithTake for EdutainmentQuestion(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  uint64_t v5 = *(void *)(a2 + 80);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = v5;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for EdutainmentQuestion(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 88)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for EdutainmentQuestion(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 88) = 1;
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
    *(unsigned char *)(result + 88) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for EdutainmentQuestion()
{
  return &type metadata for EdutainmentQuestion;
}

uint64_t sub_B524(char a1)
{
  return *(void *)&aMultipleBOOLea[8 * a1];
}

uint64_t sub_B544(char *a1, char *a2)
{
  return sub_1152C(*a1, *a2);
}

Swift::Int sub_B550()
{
  return sub_115B4();
}

uint64_t sub_B558()
{
  return sub_11D14();
}

Swift::Int sub_B560()
{
  return sub_11D68();
}

uint64_t sub_B568@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_BC74(*(void *)a1, *(void **)(a1 + 8));
  *a2 = result;
  return result;
}

uint64_t sub_B598@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_B524(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_B5C4()
{
  return sub_1DBB0();
}

uint64_t sub_B624()
{
  return sub_1DBA0();
}

unint64_t sub_B674(char a1)
{
  unint64_t result = 0xD000000000000012;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x6E6F697473657571;
      break;
    case 2:
      unint64_t result = 0x73726577736E61;
      break;
    case 3:
      return result;
    case 4:
      unint64_t result = 1953393000;
      break;
    case 5:
      unint64_t result = 1701869940;
      break;
    case 6:
      unint64_t result = 0x6C75636966666964;
      break;
    default:
      unint64_t result = 0x79726F6765746163;
      break;
  }
  return result;
}

unint64_t sub_B754(char a1)
{
  unint64_t result = 0xD000000000000012;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x6E6F697473657571;
      break;
    case 2:
      unint64_t result = 0x73726577736E61;
      break;
    case 3:
      return result;
    case 4:
      unint64_t result = 1953393000;
      break;
    case 5:
      unint64_t result = 1701869940;
      break;
    case 6:
      unint64_t result = 0x6C75636966666964;
      break;
    default:
      unint64_t result = 0x79726F6765746163;
      break;
  }
  return result;
}

uint64_t sub_B834(unsigned __int8 *a1, char *a2)
{
  return sub_11300(*a1, *a2);
}

Swift::Int sub_B840()
{
  return sub_11DD0();
}

uint64_t sub_B84C()
{
  return sub_11C00();
}

Swift::Int sub_B854()
{
  return sub_11DD0();
}

uint64_t sub_B85C@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_BCC0(*(void *)a1, *(void **)(a1 + 8));
  *a2 = result;
  return result;
}

unint64_t sub_B88C@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_B674(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

unint64_t sub_B8B8()
{
  return sub_B754(*v0);
}

uint64_t sub_B8C0@<X0>(uint64_t a1@<X0>, void *a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_BCC0(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_B8E8()
{
  return 0;
}

void sub_B8F4(unsigned char *a1@<X8>)
{
  *a1 = 7;
}

uint64_t sub_B900(uint64_t a1)
{
  unint64_t v2 = sub_C1C8();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_B93C(uint64_t a1)
{
  unint64_t v2 = sub_C1C8();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_B978(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = sub_6FF8(&qword_296C0);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  Swift::String v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_703C(a1, a1[3]);
  sub_C1C8();
  sub_1DFB0();
  LOBYTE(v11) = 0;
  sub_1DF10();
  if (!v2)
  {
    LOBYTE(v11) = 1;
    sub_1DF10();
    uint64_t v11 = *(void *)(v3 + 32);
    HIBYTE(v10) = 2;
    sub_6FF8(&qword_296B0);
    sub_C21C(&qword_296C8);
    sub_1DF30();
    LOBYTE(v11) = 3;
    sub_1DF20();
    LOBYTE(v11) = 4;
    sub_1DF10();
    LOBYTE(v11) = *(unsigned char *)(v3 + 64);
    HIBYTE(v10) = 5;
    sub_C280();
    sub_1DF30();
    LOBYTE(v11) = 6;
    sub_1DF10();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

double sub_BC00@<D0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  sub_BD0C(a1, (uint64_t)v7);
  if (!v2)
  {
    long long v5 = v7[3];
    *(_OWORD *)(a2 + 32) = v7[2];
    *(_OWORD *)(a2 + 48) = v5;
    *(_OWORD *)(a2 + 64) = v7[4];
    *(void *)(a2 + 80) = v8;
    double result = *(double *)v7;
    long long v6 = v7[1];
    *(_OWORD *)a2 = v7[0];
    *(_OWORD *)(a2 + 16) = v6;
  }
  return result;
}

uint64_t sub_BC5C(void *a1)
{
  return sub_B978(a1);
}

uint64_t sub_BC74(uint64_t a1, void *a2)
{
  v6._countAndFlagsBits = a1;
  v3._rawValue = &off_24CE0;
  v6._object = a2;
  unint64_t v4 = sub_1DE50(v3, v6);
  swift_bridgeObjectRelease();
  if (v4 >= 3) {
    return 3;
  }
  else {
    return v4;
  }
}

uint64_t sub_BCC0(uint64_t a1, void *a2)
{
  v6._countAndFlagsBits = a1;
  v3._rawValue = &off_24D48;
  v6._object = a2;
  unint64_t v4 = sub_1DE50(v3, v6);
  swift_bridgeObjectRelease();
  if (v4 >= 7) {
    return 7;
  }
  else {
    return v4;
  }
}

uint64_t sub_BD0C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = sub_6FF8(&qword_296A0);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_703C(a1, a1[3]);
  sub_C1C8();
  sub_1DFA0();
  if (v2)
  {
    sub_7080((uint64_t)a1);
    return swift_bridgeObjectRelease();
  }
  else
  {
    char v39 = 0;
    uint64_t v9 = sub_1DEA0();
    uint64_t v11 = v10;
    uint64_t v32 = v9;
    char v38 = 1;
    swift_bridgeObjectRetain();
    uint64_t v12 = sub_1DEA0();
    uint64_t v14 = v13;
    uint64_t v31 = v12;
    sub_6FF8(&qword_296B0);
    char v37 = 2;
    sub_C21C(&qword_296B8);
    swift_bridgeObjectRetain();
    sub_1DEC0();
    char v36 = 3;
    uint64_t v30 = v33;
    swift_bridgeObjectRetain();
    uint64_t v29 = 0;
    uint64_t v27 = sub_1DEB0();
    uint64_t v28 = v14;
    char v35 = 4;
    uint64_t v15 = sub_1DEA0();
    uint64_t v17 = v16;
    uint64_t v26 = v15;
    char v34 = 6;
    swift_bridgeObjectRetain();
    uint64_t v18 = sub_1DEA0();
    uint64_t v20 = v19;
    char v21 = *(void (**)(char *, uint64_t))(v6 + 8);
    uint64_t v29 = v18;
    v21(v8, v5);
    swift_bridgeObjectRetain();
    uint64_t v22 = v28;
    swift_bridgeObjectRetain();
    uint64_t v23 = v30;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_7080((uint64_t)a1);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t result = swift_bridgeObjectRelease();
    *(void *)a2 = v32;
    *(void *)(a2 + 8) = v11;
    *(void *)(a2 + 16) = v31;
    *(void *)(a2 + 24) = v22;
    uint64_t v25 = v27;
    *(void *)(a2 + 32) = v23;
    *(void *)(a2 + 40) = v25;
    *(void *)(a2 + 48) = v26;
    *(void *)(a2 + 56) = v17;
    *(unsigned char *)(a2 + 64) = 2;
    *(void *)(a2 + 72) = v29;
    *(void *)(a2 + 80) = v20;
  }
  return result;
}

unint64_t sub_C1C8()
{
  unint64_t result = qword_296A8;
  if (!qword_296A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_296A8);
  }
  return result;
}

uint64_t sub_C21C(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_A810(&qword_296B0);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_C280()
{
  unint64_t result = qword_296D0;
  if (!qword_296D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_296D0);
  }
  return result;
}

unsigned char *initializeBufferWithCopyOfBuffer for GameState.UserAction(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for GameState.UserAction(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFA) {
    goto LABEL_17;
  }
  if (a2 + 6 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 6) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 6;
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
      return (*a1 | (v4 << 8)) - 6;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 6;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 7;
  int v8 = v6 - 7;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for EdutainmentQuestion.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 6 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 6) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFA) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF9)
  {
    unsigned int v6 = ((a2 - 250) >> 8) + 1;
    *unint64_t result = a2 + 6;
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
        JUMPOUT(0xC440);
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
          *unint64_t result = a2 + 6;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for EdutainmentQuestion.CodingKeys()
{
  return &type metadata for EdutainmentQuestion.CodingKeys;
}

uint64_t getEnumTagSinglePayload for EdutainmentQuestion.QuestionType(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for EdutainmentQuestion.QuestionType(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0xC5D4);
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

uint64_t sub_C5FC(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_C604(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for EdutainmentQuestion.QuestionType()
{
  return &type metadata for EdutainmentQuestion.QuestionType;
}

unint64_t sub_C620()
{
  unint64_t result = qword_296D8;
  if (!qword_296D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_296D8);
  }
  return result;
}

unint64_t sub_C678()
{
  unint64_t result = qword_296E0;
  if (!qword_296E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_296E0);
  }
  return result;
}

unint64_t sub_C6D0()
{
  unint64_t result = qword_296E8;
  if (!qword_296E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_296E8);
  }
  return result;
}

unint64_t sub_C728()
{
  unint64_t result = qword_296F0;
  if (!qword_296F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_296F0);
  }
  return result;
}

unint64_t sub_C77C()
{
  unint64_t result = qword_296F8;
  if (!qword_296F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_296F8);
  }
  return result;
}

uint64_t destroy for ConversationData()
{
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for ConversationData(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for ConversationData(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 initializeWithTake for ConversationData(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

void *assignWithTake for ConversationData(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ConversationData(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 32)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  unint64_t v3 = *(void *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for ConversationData(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    *(void *)(result + 8) = 0;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 32) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 32) = 0;
    }
    if (a2) {
      *(void *)(result + 8) = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ConversationData()
{
  return &type metadata for ConversationData;
}

uint64_t sub_C9D8(char a1)
{
  if (a1) {
    return 0xD000000000000017;
  }
  else {
    return 0x7377656956646461;
  }
}

uint64_t sub_CA1C(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v12[0] = a4;
  v12[1] = a5;
  uint64_t v7 = sub_6FF8(&qword_29710);
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)v12 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_703C(a1, a1[3]);
  sub_D240();
  sub_1DFB0();
  char v14 = 0;
  sub_1DED0();
  if (!v5)
  {
    char v13 = 1;
    sub_1DED0();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

uint64_t sub_CB90(char *a1, char *a2)
{
  return sub_10F84(*a1, *a2);
}

Swift::Int sub_CB9C()
{
  return sub_11620();
}

uint64_t sub_CBA4()
{
  return sub_11A2C();
}

Swift::Int sub_CBAC()
{
  return sub_11EF4();
}

uint64_t sub_CBB4@<X0>(uint64_t *a1@<X0>, char *a2@<X8>)
{
  v8._countAndFlagsBits = *a1;
  unint64_t v3 = (void *)a1[1];
  v4._rawValue = &off_24E10;
  v8._object = v3;
  Swift::Int v5 = sub_1DE50(v4, v8);
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

uint64_t sub_CC14@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_C9D8(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_CC40()
{
  return sub_C9D8(*v0);
}

uint64_t sub_CC48@<X0>(uint64_t a1@<X0>, void *a2@<X1>, char *a3@<X8>)
{
  v9._countAndFlagsBits = a1;
  v5._rawValue = &off_24E10;
  v9._object = a2;
  Swift::Int v6 = sub_1DE50(v5, v9);
  uint64_t result = swift_bridgeObjectRelease();
  if (v6 == 1) {
    char v8 = 1;
  }
  else {
    char v8 = 2;
  }
  if (!v6) {
    char v8 = 0;
  }
  *a3 = v8;
  return result;
}

void sub_CCAC(unsigned char *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_CCB8(uint64_t a1)
{
  unint64_t v2 = sub_D240();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_CCF4(uint64_t a1)
{
  unint64_t v2 = sub_D240();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_CD30@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_D05C(a1);
  if (!v2)
  {
    *a2 = result;
    a2[1] = v5;
    a2[2] = v6;
    a2[3] = v7;
  }
  return result;
}

uint64_t sub_CD60(void *a1)
{
  return sub_CA1C(a1, *v1, v1[1], v1[2], v1[3]);
}

uint64_t sub_CD80()
{
  sub_1DB20();
  __chkstk_darwin();
  sub_1D710();
  swift_allocObject();
  sub_1D700();
  sub_D520();
  uint64_t v0 = sub_1D6F0();
  unint64_t v2 = v1;
  swift_release();
  sub_1DB10();
  v3._countAndFlagsBits = sub_1DAF0();
  if (v3._object)
  {
    sub_1DB60(v3);
    v10._countAndFlagsBits = 39;
    v10._object = (void *)0xE100000000000000;
    sub_1DB60(v10);
    swift_bridgeObjectRelease();
    sub_D4C8(v0, v2);
    return 39;
  }
  else
  {
    if (qword_28FC0 != -1) {
      swift_once();
    }
    uint64_t v6 = sub_1DA30();
    sub_6FC0(v6, (uint64_t)qword_2BEF8);
    uint64_t v7 = sub_1DA20();
    os_log_type_t v8 = sub_1DC50();
    if (os_log_type_enabled(v7, v8))
    {
      Swift::String v9 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)Swift::String v9 = 0;
      _os_log_impl(&dword_0, v7, v8, "Failed to decode ConversationData into JSON String.", v9, 2u);
      swift_slowDealloc();
    }
    uint64_t v4 = 1280070990;

    sub_D4C8(v0, v2);
  }
  return v4;
}

uint64_t sub_D05C(void *a1)
{
  uint64_t v3 = sub_6FF8(&qword_29700);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = a1[4];
  sub_703C(a1, a1[3]);
  sub_D240();
  sub_1DFA0();
  if (v1)
  {
    sub_7080((uint64_t)a1);
    swift_bridgeObjectRelease();
  }
  else
  {
    char v11 = 0;
    uint64_t v7 = sub_1DE60();
    char v10 = 1;
    sub_1DE60();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    sub_7080((uint64_t)a1);
  }
  return v7;
}

unint64_t sub_D240()
{
  unint64_t result = qword_29708;
  if (!qword_29708)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_29708);
  }
  return result;
}

const unsigned __int8 *sub_D294(sqlite3_stmt *a1, int a2)
{
  uint64_t v4 = sub_1DB20();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (sqlite3_column_type(a1, a2) == 5) {
    return 0;
  }
  unint64_t result = sqlite3_column_text(a1, a2);
  if (!result) {
    return result;
  }
  sub_1DB80();
  sub_1DB10();
  uint64_t v9 = sub_1DAE0();
  unint64_t v11 = v10;
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  if (v11 >> 60 == 15) {
    return 0;
  }
  sub_1D6E0();
  swift_allocObject();
  sub_1D6D0();
  sub_D460();
  sub_1D6C0();
  sub_D4B4(v9, v11);
  swift_release();
  return (const unsigned __int8 *)v12[2];
}

unint64_t sub_D460()
{
  unint64_t result = qword_29718;
  if (!qword_29718)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_29718);
  }
  return result;
}

uint64_t sub_D4B4(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_D4C8(a1, a2);
  }
  return a1;
}

uint64_t sub_D4C8(uint64_t a1, unint64_t a2)
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

unint64_t sub_D520()
{
  unint64_t result = qword_29720;
  if (!qword_29720)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_29720);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for ConversationData.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for ConversationData.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 1;
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
        JUMPOUT(0xD6D0);
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
          *unint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

unsigned char *sub_D6F8(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for ConversationData.CodingKeys()
{
  return &type metadata for ConversationData.CodingKeys;
}

unint64_t sub_D718()
{
  unint64_t result = qword_29728;
  if (!qword_29728)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_29728);
  }
  return result;
}

unint64_t sub_D770()
{
  unint64_t result = qword_29730;
  if (!qword_29730)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_29730);
  }
  return result;
}

unint64_t sub_D7C8()
{
  unint64_t result = qword_29738;
  if (!qword_29738)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_29738);
  }
  return result;
}

uint64_t sub_D81C()
{
  uint64_t v1 = v0;
  sqlite3_close(*(sqlite3 **)(v0 + 16));
  if (qword_28FC0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_1DA30();
  sub_6FC0(v2, (uint64_t)qword_2BEF8);
  int v3 = sub_1DA20();
  os_log_type_t v4 = sub_1DC30();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_0, v3, v4, "Closed database.", v5, 2u);
    swift_slowDealloc();
  }

  return _swift_deallocClassInstance(v1, 24, 7);
}

uint64_t type metadata accessor for SqlDatabase()
{
  return self;
}

uint64_t sub_D940()
{
  uint64_t result = sub_D964();
  qword_2BED0 = result;
  qword_2BED8 = v1;
  return result;
}

uint64_t sub_D964()
{
  sub_6FF8(&qword_29848);
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v1 = (char *)&v39 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = sub_1D760();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = ((uint64_t (*)(void))__chkstk_darwin)();
  unsigned int v6 = (char *)&v39 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __chkstk_darwin(v4);
  uint64_t v9 = (char *)&v39 - v8;
  __chkstk_darwin(v7);
  unint64_t v11 = (char *)&v39 - v10;
  uint64_t v12 = self;
  id v13 = [v12 defaultManager];
  id v14 = [v13 URLsForDirectory:5 inDomains:1];

  uint64_t v15 = sub_1DBE0();
  if (*(void *)(v15 + 16))
  {
    (*(void (**)(char *, unint64_t, uint64_t))(v3 + 16))(v1, v15 + ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80)), v2);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v3 + 56))(v1, 0, 1, v2);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v3 + 56))(v1, 1, 1, v2);
  }
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v3 + 48))(v1, 1, v2) == 1)
  {
    sub_70D0((uint64_t)v1, &qword_29848);
    if (qword_28FC0 != -1) {
      swift_once();
    }
    uint64_t v16 = sub_1DA30();
    sub_6FC0(v16, (uint64_t)qword_2BEF8);
    uint64_t v17 = sub_1DA20();
    os_log_type_t v18 = sub_1DC50();
    if (os_log_type_enabled(v17, v18))
    {
      uint64_t v19 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v19 = 0;
      _os_log_impl(&dword_0, v17, v18, "Failed to get user document directory.", v19, 2u);
      swift_slowDealloc();
    }

    return 0;
  }
  (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v11, v1, v2);
  sub_1D740();
  id v20 = [v12 defaultManager];
  sub_1D730(v21);
  uint64_t v23 = v22;
  sub_6FF8(&qword_29850);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1FCF0;
  *(void *)(inited + 32) = NSFileProtectionKey;
  type metadata accessor for FileProtectionType(0);
  *(void *)(inited + 64) = v25;
  *(void *)(inited + 40) = NSFileProtectionCompleteUntilFirstUserAuthentication;
  uint64_t v26 = NSFileProtectionKey;
  uint64_t v27 = NSFileProtectionCompleteUntilFirstUserAuthentication;
  sub_F514(inited);
  type metadata accessor for FileAttributeKey(0);
  sub_F4BC();
  Class isa = sub_1DA80().super.isa;
  swift_bridgeObjectRelease();
  id v40 = 0;
  LODWORD(inited) = [v20 createDirectoryAtURL:v23 withIntermediateDirectories:1 attributes:isa error:&v40];

  if (!inited)
  {
    id v32 = v40;
    sub_1D720();

    swift_willThrow();
    swift_errorRelease();
    if (qword_28FC0 != -1) {
      swift_once();
    }
    uint64_t v33 = sub_1DA30();
    sub_6FC0(v33, (uint64_t)qword_2BEF8);
    char v34 = sub_1DA20();
    os_log_type_t v35 = sub_1DC50();
    if (os_log_type_enabled(v34, v35))
    {
      char v36 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)char v36 = 0;
      _os_log_impl(&dword_0, v34, v35, "Failed to create edutainment directory.", v36, 2u);
      swift_slowDealloc();
    }

    char v37 = *(void (**)(char *, uint64_t))(v3 + 8);
    v37(v9, v2);
    v37(v11, v2);
    return 0;
  }
  id v29 = v40;
  sub_1D740();
  uint64_t v30 = sub_1D750();
  uint64_t v31 = *(void (**)(char *, uint64_t))(v3 + 8);
  v31(v6, v2);
  v31(v9, v2);
  v31(v11, v2);
  return v30;
}

uint64_t sub_DF70()
{
  uint64_t result = sub_DF90();
  qword_2BEE0 = result;
  return result;
}

uint64_t sub_DF90()
{
  uint64_t v0 = sub_1DA10();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1DCC0();
  if (qword_28FB0 != -1) {
    swift_once();
  }
  sub_1DA00();
  sub_1D9F0();
  uint64_t v4 = *(void (**)(char *, uint64_t))(v1 + 8);
  v4(v3, v0);
  if (qword_28FA0 != -1) {
    swift_once();
  }
  if (qword_2BED8) {
    uint64_t v5 = sub_EE80(qword_2BED0, qword_2BED8);
  }
  else {
    uint64_t v5 = 0;
  }
  sub_1DCB0();
  sub_1DA00();
  sub_1D9F0();
  v4(v3, v0);
  return v5;
}

sqlite3_stmt *sub_E170()
{
  ppStmt = 0;
  uint64_t v1 = *(sqlite3 **)(v0 + 16);
  uint64_t v2 = sub_1DB40();
  int v3 = sqlite3_prepare_v2(v1, (const char *)(v2 + 32), -1, &ppStmt, 0);
  swift_release();
  if (!v3) {
    return ppStmt;
  }
  if (qword_28FC0 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_1DA30();
  sub_6FC0(v4, (uint64_t)qword_2BEF8);
  swift_retain_n();
  uint64_t v5 = sub_1DA20();
  os_log_type_t v6 = sub_1DC50();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v12 = swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 136315138;
    if (sqlite3_errmsg(v1))
    {
      unint64_t v8 = sub_1DB70();
      unint64_t v10 = v9;
    }
    else
    {
      unint64_t v10 = 0x800000000001E860;
      unint64_t v8 = 0xD00000000000001DLL;
    }
    sub_1B87C(v8, v10, &v12);
    sub_1DD00();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_0, v5, v6, "%s", v7, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_release_n();
  }
  return 0;
}

BOOL sub_E3A8(uint64_t a1, unint64_t a2)
{
  uint64_t v3 = v2;
  os_log_type_t v6 = sub_E170();
  if (v6)
  {
    uint64_t v7 = v6;
    int v8 = sqlite3_step(v6);
    BOOL v9 = v8 == 101;
    if (v8 == 101)
    {
      if (qword_28FC0 != -1) {
        swift_once();
      }
      uint64_t v10 = sub_1DA30();
      sub_6FC0(v10, (uint64_t)qword_2BEF8);
      swift_bridgeObjectRetain_n();
      unint64_t v11 = sub_1DA20();
      os_log_type_t v12 = sub_1DC30();
      if (os_log_type_enabled(v11, v12))
      {
        id v13 = (uint8_t *)swift_slowAlloc();
        uint64_t v21 = swift_slowAlloc();
        *(_DWORD *)id v13 = 136315138;
        swift_bridgeObjectRetain();
        sub_1B87C(a1, a2, &v21);
        sub_1DD00();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_0, v11, v12, "Execution succeeded: %s", v13, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
LABEL_17:
        swift_slowDealloc();

        goto LABEL_18;
      }

      swift_bridgeObjectRelease_n();
    }
    else
    {
      if (qword_28FC0 != -1) {
        swift_once();
      }
      uint64_t v14 = sub_1DA30();
      sub_6FC0(v14, (uint64_t)qword_2BEF8);
      swift_retain_n();
      unint64_t v11 = sub_1DA20();
      os_log_type_t v15 = sub_1DC50();
      if (os_log_type_enabled(v11, v15))
      {
        uint64_t v16 = (uint8_t *)swift_slowAlloc();
        uint64_t v21 = swift_slowAlloc();
        *(_DWORD *)uint64_t v16 = 136315138;
        if (sqlite3_errmsg(*(sqlite3 **)(v3 + 16)))
        {
          unint64_t v17 = sub_1DB70();
          unint64_t v19 = v18;
        }
        else
        {
          unint64_t v19 = 0x800000000001E860;
          unint64_t v17 = 0xD00000000000001DLL;
        }
        sub_1B87C(v17, v19, &v21);
        sub_1DD00();
        swift_release_n();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_0, v11, v15, "%s", v16, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        goto LABEL_17;
      }

      swift_release_n();
    }
LABEL_18:
    sqlite3_finalize(v7);
    return v9;
  }
  return 0;
}

char *sub_E700(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = sub_E170();
  if (!v4) {
    return 0;
  }
  uint64_t v5 = v4;
  int v6 = sqlite3_step(v4);
  if (v6 == 101)
  {
    uint64_t v7 = (char *)&_swiftEmptyArrayStorage;
  }
  else if (v6 == 100)
  {
    uint64_t v7 = (char *)&_swiftEmptyArrayStorage;
    do
    {
      if (sqlite3_column_type(v5, 0) != 5)
      {
        uint64_t v8 = sqlite3_column_int(v5, 0);
        uint64_t v9 = type metadata accessor for GameState();
        swift_allocObject();
        uint64_t v10 = sub_120D0(0x656C676E6953, 0xE600000000000000, 0, 0xE000000000000000, 0, 0, 0, 1, 1287, 0, 1uLL, 0, 0, 0, 0, 1);
        *(void *)(v10 + 16) = v8;
        *(unsigned char *)(v10 + 24) = 0;
        uint64_t v22 = v9;
        uint64_t v23 = &off_25918;
        *(void *)&long long v21 = v10;
        sub_A778(&v21, (uint64_t)v24);
        sub_A710((uint64_t)v24, (uint64_t)&v21);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v7 = sub_ED5C(0, *((void *)v7 + 2) + 1, 1, v7);
        }
        unint64_t v12 = *((void *)v7 + 2);
        unint64_t v11 = *((void *)v7 + 3);
        if (v12 >= v11 >> 1) {
          uint64_t v7 = sub_ED5C((char *)(v11 > 1), v12 + 1, 1, v7);
        }
        *((void *)v7 + 2) = v12 + 1;
        sub_A778(&v21, (uint64_t)&v7[40 * v12 + 32]);
        sub_7080((uint64_t)v24);
      }
    }
    while (sqlite3_step(v5) == 100);
  }
  else
  {
    if (qword_28FC0 != -1) {
      swift_once();
    }
    uint64_t v13 = sub_1DA30();
    sub_6FC0(v13, (uint64_t)qword_2BEF8);
    swift_retain_n();
    uint64_t v14 = sub_1DA20();
    os_log_type_t v15 = sub_1DC50();
    if (os_log_type_enabled(v14, v15))
    {
      uint64_t v16 = (uint8_t *)swift_slowAlloc();
      v24[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v16 = 136315138;
      if (sqlite3_errmsg(*(sqlite3 **)(a3 + 16)))
      {
        unint64_t v17 = sub_1DB70();
        unint64_t v19 = v18;
      }
      else
      {
        unint64_t v19 = 0x800000000001E860;
        unint64_t v17 = 0xD00000000000001DLL;
      }
      *(void *)&long long v21 = sub_1B87C(v17, v19, v24);
      sub_1DD00();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_0, v14, v15, "%s", v16, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_release_n();
    }
    uint64_t v7 = 0;
  }
  sqlite3_finalize(v5);
  return v7;
}

char *sub_EA70(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = sub_E170();
  if (!v4) {
    return 0;
  }
  uint64_t v5 = v4;
  int v6 = sqlite3_step(v4);
  if (v6 == 101)
  {
    uint64_t v7 = (char *)&_swiftEmptyArrayStorage;
  }
  else if (v6 == 100)
  {
    uint64_t v7 = (char *)&_swiftEmptyArrayStorage;
    do
    {
      sub_14290(v5, (uint64_t)&v18);
      if (v19)
      {
        sub_A778(&v18, (uint64_t)v20);
        sub_A710((uint64_t)v20, (uint64_t)&v18);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v7 = sub_ED5C(0, *((void *)v7 + 2) + 1, 1, v7);
        }
        unint64_t v9 = *((void *)v7 + 2);
        unint64_t v8 = *((void *)v7 + 3);
        if (v9 >= v8 >> 1) {
          uint64_t v7 = sub_ED5C((char *)(v8 > 1), v9 + 1, 1, v7);
        }
        *((void *)v7 + 2) = v9 + 1;
        sub_A778(&v18, (uint64_t)&v7[40 * v9 + 32]);
        sub_7080((uint64_t)v20);
      }
      else
      {
        sub_70D0((uint64_t)&v18, &qword_29830);
      }
    }
    while (sqlite3_step(v5) == 100);
  }
  else
  {
    if (qword_28FC0 != -1) {
      swift_once();
    }
    uint64_t v10 = sub_1DA30();
    sub_6FC0(v10, (uint64_t)qword_2BEF8);
    swift_retain_n();
    unint64_t v11 = sub_1DA20();
    os_log_type_t v12 = sub_1DC50();
    if (os_log_type_enabled(v11, v12))
    {
      uint64_t v13 = (uint8_t *)swift_slowAlloc();
      v20[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v13 = 136315138;
      if (sqlite3_errmsg(*(sqlite3 **)(a3 + 16)))
      {
        unint64_t v14 = sub_1DB70();
        unint64_t v16 = v15;
      }
      else
      {
        unint64_t v16 = 0x800000000001E860;
        unint64_t v14 = 0xD00000000000001DLL;
      }
      *(void *)&long long v18 = sub_1B87C(v14, v16, v20);
      sub_1DD00();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_0, v11, v12, "%s", v13, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_release_n();
    }
    uint64_t v7 = 0;
  }
  sqlite3_finalize(v5);
  return v7;
}

char *sub_ED5C(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = *((void *)a4 + 3);
  uint64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v7 = a2;
    }
LABEL_8:
    uint64_t v8 = *((void *)a4 + 2);
    if (v7 <= v8) {
      uint64_t v9 = *((void *)a4 + 2);
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      sub_6FF8(&qword_29838);
      uint64_t v10 = (char *)swift_allocObject();
      size_t v11 = j__malloc_size(v10);
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 40);
      os_log_type_t v12 = v10 + 32;
      if (v5)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[40 * v8 + 32]) {
          memmove(v12, a4 + 32, 40 * v8);
        }
        *((void *)a4 + 2) = 0;
        goto LABEL_22;
      }
    }
    else
    {
      uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
      os_log_type_t v12 = (char *)&_swiftEmptyArrayStorage + 32;
      if (result) {
        goto LABEL_13;
      }
    }
    sub_F3A8(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_EE80(uint64_t a1, unint64_t a2)
{
  if (qword_28FC0 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_1DA30();
  sub_6FC0(v4, (uint64_t)qword_2BEF8);
  swift_bridgeObjectRetain_n();
  char v5 = sub_1DA20();
  os_log_type_t v6 = sub_1DC30();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    ppDb = (sqlite3 *)swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v24 = sub_1B87C(a1, a2, (uint64_t *)&ppDb);
    sub_1DD00();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_0, v5, v6, "Opening DB %s.", v7, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  ppDb = 0;
  uint64_t v8 = sub_1DB40();
  int v9 = sqlite3_open((const char *)(v8 + 32), &ppDb);
  swift_release();
  uint64_t v10 = ppDb;
  if (v9)
  {
    if (sqlite3_errmsg(ppDb))
    {
      uint64_t v11 = sub_1DB70();
      unint64_t v13 = v12;
      swift_bridgeObjectRetain();
      unint64_t v14 = sub_1DA20();
      os_log_type_t v15 = sub_1DC50();
      if (!os_log_type_enabled(v14, v15))
      {

        swift_bridgeObjectRelease_n();
        return 0;
      }
      unint64_t v16 = (uint8_t *)swift_slowAlloc();
      uint64_t v24 = swift_slowAlloc();
      *(_DWORD *)unint64_t v16 = 136315138;
      swift_bridgeObjectRetain();
      sub_1B87C(v11, v13, &v24);
      sub_1DD00();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_0, v14, v15, "%s", v16, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      goto LABEL_19;
    }
    unint64_t v14 = sub_1DA20();
    os_log_type_t v20 = sub_1DC50();
    if (os_log_type_enabled(v14, v20))
    {
      long long v21 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)long long v21 = 0;
      uint64_t v22 = "No error message from SQLite.";
LABEL_18:
      _os_log_impl(&dword_0, v14, v20, v22, v21, 2u);
LABEL_19:
      swift_slowDealloc();
      goto LABEL_20;
    }
    goto LABEL_20;
  }
  if (!ppDb)
  {
    unint64_t v14 = sub_1DA20();
    os_log_type_t v20 = sub_1DC50();
    if (os_log_type_enabled(v14, v20))
    {
      long long v21 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)long long v21 = 0;
      uint64_t v22 = "Null DB pointer.";
      goto LABEL_18;
    }
LABEL_20:

    return 0;
  }
  swift_bridgeObjectRetain_n();
  unint64_t v17 = sub_1DA20();
  os_log_type_t v18 = sub_1DC30();
  if (os_log_type_enabled(v17, v18))
  {
    uint64_t v19 = (uint8_t *)swift_slowAlloc();
    uint64_t v24 = swift_slowAlloc();
    *(_DWORD *)uint64_t v19 = 136315138;
    swift_bridgeObjectRetain();
    sub_1B87C(a1, a2, &v24);
    sub_1DD00();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_0, v17, v18, "Open DB %s succeeded.", v19, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  type metadata accessor for SqlDatabase();
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = v10;
  return result;
}

uint64_t sub_F3A8(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 40 * a1 + 32;
    unint64_t v6 = a3 + 40 * v4;
    if (v5 >= v6 || v5 + 40 * v4 <= a3)
    {
      sub_6FF8(&qword_29840);
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_1DE30();
  __break(1u);
  return result;
}

unint64_t sub_F4BC()
{
  unint64_t result = qword_29088;
  if (!qword_29088)
  {
    type metadata accessor for FileAttributeKey(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_29088);
  }
  return result;
}

unint64_t sub_F514(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_6FF8(&qword_29878);
  uint64_t v2 = sub_1DE20();
  uint64_t v3 = (void *)v2;
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  uint64_t v5 = v2 + 64;
  uint64_t v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_10570(v6, (uint64_t)&v13, &qword_29880);
    uint64_t v7 = v13;
    unint64_t result = sub_17BD8(v13);
    if (v9) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(void *)(v3[6] + 8 * result) = v7;
    unint64_t result = (unint64_t)sub_FE54(&v14, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v10 = v3[2];
    BOOL v11 = __OFADD__(v10, 1);
    uint64_t v12 = v10 + 1;
    if (v11) {
      goto LABEL_11;
    }
    v3[2] = v12;
    v6 += 40;
    if (!--v4)
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

unint64_t sub_F644(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_6FF8(&qword_29860);
  uint64_t v2 = sub_1DE20();
  uint64_t v3 = (void *)v2;
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  uint64_t v5 = v2 + 64;
  uint64_t v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_10570(v6, (uint64_t)&v15, &qword_29870);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_17AC4(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    BOOL v11 = (uint64_t *)(v3[6] + 16 * result);
    uint64_t *v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_FE54(&v17, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v3[2] = v14;
    v6 += 48;
    if (!--v4)
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

uint64_t sub_F77C()
{
  sub_6FF8(&qword_29858);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1FD30;
  *(void *)(inited + 32) = 0x70756F726724;
  *(void *)(inited + 40) = 0xE600000000000000;
  *(void *)(inited + 48) = 0xD000000000000026;
  *(void *)(inited + 56) = 0x800000000001E940;
  *(void *)(inited + 72) = &type metadata for String;
  *(void *)(inited + 80) = 0x7373616C6324;
  *(void *)(inited + 120) = &type metadata for String;
  *(void *)(inited + 88) = 0xE600000000000000;
  *(void *)(inited + 96) = 0xD00000000000001ALL;
  *(void *)(inited + 104) = 0x800000000001E970;
  unint64_t v2 = sub_F644(inited);
  unint64_t v20 = v2;
  if (v0[13] != 1)
  {
    unint64_t v3 = v2;
    if (v0[15])
    {
      uint64_t v4 = v0[14];
      os_log_type_t v18 = &type metadata for String;
      *(void *)&long long v17 = v4;
      *((void *)&v17 + 1) = swift_bridgeObjectRetain();
      sub_FE54(&v17, v16);
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v19 = v3;
      sub_10164(v16, 0xD000000000000011, 0x800000000001E990, isUniquelyReferenced_nonNull_native);
      unint64_t v20 = v19;
      swift_bridgeObjectRelease();
    }
  }
  if (qword_28FC8 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_1DA30();
  sub_6FC0(v6, (uint64_t)qword_2BF10);
  uint64_t v7 = sub_1DA20();
  os_log_type_t v8 = sub_1DC40();
  if (os_log_type_enabled(v7, v8))
  {
    char v9 = (uint8_t *)swift_slowAlloc();
    *(void *)&long long v17 = swift_slowAlloc();
    *(_DWORD *)char v9 = 136315138;
    swift_beginAccess();
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_1DA90();
    unint64_t v12 = v11;
    swift_bridgeObjectRelease();
    uint64_t v19 = sub_1B87C(v10, v12, (uint64_t *)&v17);
    sub_1DD00();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_0, v7, v8, "attachment is:%s", v9, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  swift_beginAccess();
  uint64_t v13 = swift_bridgeObjectRetain();
  uint64_t v14 = sub_FA8C(v13);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v14;
}

uint64_t sub_FA8C(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    sub_6FF8(&qword_29868);
    unint64_t v2 = (void *)sub_1DE20();
  }
  else
  {
    unint64_t v2 = &_swiftEmptyDictionarySingleton;
  }
  uint64_t v28 = a1 + 64;
  uint64_t v3 = -1 << *(unsigned char *)(a1 + 32);
  if (-v3 < 64) {
    uint64_t v4 = ~(-1 << -(char)v3);
  }
  else {
    uint64_t v4 = -1;
  }
  unint64_t v5 = v4 & *(void *)(a1 + 64);
  int64_t v27 = (unint64_t)(63 - v3) >> 6;
  uint64_t v6 = (char *)(v2 + 8);
  swift_bridgeObjectRetain();
  uint64_t result = swift_retain();
  int64_t v8 = 0;
  while (1)
  {
    if (v5)
    {
      unint64_t v11 = __clz(__rbit64(v5));
      v5 &= v5 - 1;
      unint64_t v12 = v11 | (v8 << 6);
      goto LABEL_28;
    }
    int64_t v13 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    if (v13 >= v27) {
      goto LABEL_37;
    }
    unint64_t v14 = *(void *)(v28 + 8 * v13);
    int64_t v15 = v8 + 1;
    if (!v14)
    {
      int64_t v15 = v8 + 2;
      if (v8 + 2 >= v27) {
        goto LABEL_37;
      }
      unint64_t v14 = *(void *)(v28 + 8 * v15);
      if (!v14)
      {
        int64_t v15 = v8 + 3;
        if (v8 + 3 >= v27) {
          goto LABEL_37;
        }
        unint64_t v14 = *(void *)(v28 + 8 * v15);
        if (!v14)
        {
          int64_t v15 = v8 + 4;
          if (v8 + 4 >= v27) {
            goto LABEL_37;
          }
          unint64_t v14 = *(void *)(v28 + 8 * v15);
          if (!v14) {
            break;
          }
        }
      }
    }
LABEL_27:
    unint64_t v5 = (v14 - 1) & v14;
    unint64_t v12 = __clz(__rbit64(v14)) + (v15 << 6);
    int64_t v8 = v15;
LABEL_28:
    long long v17 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v12);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    sub_1050C(*(void *)(a1 + 56) + 32 * v12, (uint64_t)v40);
    *(void *)&long long v39 = v19;
    *((void *)&v39 + 1) = v18;
    v37[2] = v39;
    v38[0] = v40[0];
    v38[1] = v40[1];
    *(void *)&v37[0] = v19;
    *((void *)&v37[0] + 1) = v18;
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    sub_FE54(v38, v32);
    long long v33 = v29;
    long long v34 = v30;
    uint64_t v35 = v31;
    sub_FE54(v32, v36);
    long long v29 = v33;
    long long v30 = v34;
    uint64_t v31 = v35;
    sub_FE54(v36, v37);
    sub_FE54(v37, &v33);
    uint64_t result = sub_1DD40(v2[5]);
    uint64_t v20 = -1 << *((unsigned char *)v2 + 32);
    unint64_t v21 = result & ~v20;
    unint64_t v22 = v21 >> 6;
    if (((-1 << v21) & ~*(void *)&v6[8 * (v21 >> 6)]) != 0)
    {
      unint64_t v9 = __clz(__rbit64((-1 << v21) & ~*(void *)&v6[8 * (v21 >> 6)])) | v21 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v23 = 0;
      unint64_t v24 = (unint64_t)(63 - v20) >> 6;
      do
      {
        if (++v22 == v24 && (v23 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        BOOL v25 = v22 == v24;
        if (v22 == v24) {
          unint64_t v22 = 0;
        }
        v23 |= v25;
        uint64_t v26 = *(void *)&v6[8 * v22];
      }
      while (v26 == -1);
      unint64_t v9 = __clz(__rbit64(~v26)) + (v22 << 6);
    }
    *(void *)&v6[(v9 >> 3) & 0x1FFFFFFFFFFFFFF8] |= 1 << v9;
    uint64_t v10 = v2[6] + 40 * v9;
    *(_OWORD *)uint64_t v10 = v29;
    *(_OWORD *)(v10 + 16) = v30;
    *(void *)(v10 + 32) = v31;
    uint64_t result = (uint64_t)sub_FE54(&v33, (_OWORD *)(v2[7] + 32 * v9));
    ++v2[2];
  }
  int64_t v16 = v8 + 5;
  if (v8 + 5 >= v27)
  {
LABEL_37:
    swift_release();
    sub_10568();
    return (uint64_t)v2;
  }
  unint64_t v14 = *(void *)(v28 + 8 * v16);
  if (v14)
  {
    int64_t v15 = v8 + 5;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v15 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v15 >= v27) {
      goto LABEL_37;
    }
    unint64_t v14 = *(void *)(v28 + 8 * v15);
    ++v16;
    if (v14) {
      goto LABEL_27;
    }
  }
LABEL_39:
  __break(1u);
  return result;
}

_OWORD *sub_FE54(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_FE64(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_6FF8(&qword_29860);
  uint64_t v6 = sub_1DE10();
  uint64_t v7 = v6;
  if (*(void *)(v5 + 16))
  {
    uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
    long long v34 = (void *)(v5 + 64);
    if (v8 < 64) {
      uint64_t v9 = ~(-1 << v8);
    }
    else {
      uint64_t v9 = -1;
    }
    unint64_t v10 = v9 & *(void *)(v5 + 64);
    int64_t v33 = (unint64_t)(v8 + 63) >> 6;
    uint64_t v11 = v6 + 64;
    uint64_t result = swift_retain();
    int64_t v13 = 0;
    while (1)
    {
      if (v10)
      {
        unint64_t v16 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        unint64_t v17 = v16 | (v13 << 6);
      }
      else
      {
        int64_t v18 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }
        if (v18 >= v33) {
          goto LABEL_34;
        }
        unint64_t v19 = v34[v18];
        ++v13;
        if (!v19)
        {
          int64_t v13 = v18 + 1;
          if (v18 + 1 >= v33) {
            goto LABEL_34;
          }
          unint64_t v19 = v34[v13];
          if (!v19)
          {
            int64_t v20 = v18 + 2;
            if (v20 >= v33)
            {
LABEL_34:
              swift_release();
              uint64_t v3 = v2;
              if (a2)
              {
                uint64_t v32 = 1 << *(unsigned char *)(v5 + 32);
                if (v32 >= 64) {
                  bzero(v34, ((unint64_t)(v32 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *long long v34 = -1 << v32;
                }
                *(void *)(v5 + 16) = 0;
              }
              break;
            }
            unint64_t v19 = v34[v20];
            if (!v19)
            {
              while (1)
              {
                int64_t v13 = v20 + 1;
                if (__OFADD__(v20, 1)) {
                  goto LABEL_41;
                }
                if (v13 >= v33) {
                  goto LABEL_34;
                }
                unint64_t v19 = v34[v13];
                ++v20;
                if (v19) {
                  goto LABEL_21;
                }
              }
            }
            int64_t v13 = v20;
          }
        }
LABEL_21:
        unint64_t v10 = (v19 - 1) & v19;
        unint64_t v17 = __clz(__rbit64(v19)) + (v13 << 6);
      }
      unint64_t v21 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v17);
      uint64_t v23 = *v21;
      uint64_t v22 = v21[1];
      unint64_t v24 = (_OWORD *)(*(void *)(v5 + 56) + 32 * v17);
      if (a2)
      {
        sub_FE54(v24, v35);
      }
      else
      {
        sub_1050C((uint64_t)v24, (uint64_t)v35);
        swift_bridgeObjectRetain();
      }
      sub_1DF70();
      sub_1DB50();
      uint64_t result = sub_1DF90();
      uint64_t v25 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v26 = result & ~v25;
      unint64_t v27 = v26 >> 6;
      if (((-1 << v26) & ~*(void *)(v11 + 8 * (v26 >> 6))) != 0)
      {
        unint64_t v14 = __clz(__rbit64((-1 << v26) & ~*(void *)(v11 + 8 * (v26 >> 6)))) | v26 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v28 = 0;
        unint64_t v29 = (unint64_t)(63 - v25) >> 6;
        do
        {
          if (++v27 == v29 && (v28 & 1) != 0)
          {
            __break(1u);
            goto LABEL_40;
          }
          BOOL v30 = v27 == v29;
          if (v27 == v29) {
            unint64_t v27 = 0;
          }
          v28 |= v30;
          uint64_t v31 = *(void *)(v11 + 8 * v27);
        }
        while (v31 == -1);
        unint64_t v14 = __clz(__rbit64(~v31)) + (v27 << 6);
      }
      *(void *)(v11 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
      int64_t v15 = (void *)(*(void *)(v7 + 48) + 16 * v14);
      *int64_t v15 = v23;
      v15[1] = v22;
      uint64_t result = (uint64_t)sub_FE54(v35, (_OWORD *)(*(void *)(v7 + 56) + 32 * v14));
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

_OWORD *sub_10164(_OWORD *a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = (void **)v4;
  unint64_t v10 = (void *)*v4;
  unint64_t v12 = sub_17AC4(a2, a3);
  uint64_t v13 = v10[2];
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_17;
  }
  char v16 = v11;
  uint64_t v17 = v10[3];
  if (v17 < v15 || (a4 & 1) == 0)
  {
    if (v17 >= v15 && (a4 & 1) == 0)
    {
      sub_10324();
      goto LABEL_7;
    }
    sub_FE64(v15, a4 & 1);
    unint64_t v21 = sub_17AC4(a2, a3);
    if ((v16 & 1) == (v22 & 1))
    {
      unint64_t v12 = v21;
      int64_t v18 = *v5;
      if (v16) {
        goto LABEL_8;
      }
      goto LABEL_13;
    }
LABEL_17:
    uint64_t result = (_OWORD *)sub_1DF60();
    __break(1u);
    return result;
  }
LABEL_7:
  int64_t v18 = *v5;
  if (v16)
  {
LABEL_8:
    unint64_t v19 = (_OWORD *)(v18[7] + 32 * v12);
    sub_7080((uint64_t)v19);
    return sub_FE54(a1, v19);
  }
LABEL_13:
  sub_102B8(v12, a2, a3, a1, v18);

  return (_OWORD *)swift_bridgeObjectRetain();
}

_OWORD *sub_102B8(unint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4, void *a5)
{
  a5[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v6 = (void *)(a5[6] + 16 * a1);
  *uint64_t v6 = a2;
  v6[1] = a3;
  uint64_t result = sub_FE54(a4, (_OWORD *)(a5[7] + 32 * a1));
  uint64_t v8 = a5[2];
  BOOL v9 = __OFADD__(v8, 1);
  uint64_t v10 = v8 + 1;
  if (v9) {
    __break(1u);
  }
  else {
    a5[2] = v10;
  }
  return result;
}

void *sub_10324()
{
  uint64_t v1 = v0;
  sub_6FF8(&qword_29860);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_1DE00();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = (void *)swift_release();
LABEL_28:
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t v25 = v1;
  uint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v22 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      int64_t v9 = v22 + 1;
      if (v22 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v23 = *(void *)(v6 + 8 * v9);
      if (!v23) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v23 - 1) & v23;
    unint64_t v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    uint64_t v20 = 32 * v15;
    sub_1050C(*(void *)(v2 + 56) + 32 * v15, (uint64_t)v26);
    unint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    void *v21 = v19;
    v21[1] = v18;
    sub_FE54(v26, (_OWORD *)(*(void *)(v4 + 56) + v20));
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v13)
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    uint64_t v1 = v25;
    goto LABEL_28;
  }
  unint64_t v23 = *(void *)(v6 + 8 * v24);
  if (v23)
  {
    int64_t v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v9);
    ++v24;
    if (v23) {
      goto LABEL_25;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_1050C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_10568()
{
  return swift_release();
}

uint64_t sub_10570(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_6FF8(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_105D4()
{
  sub_10630();
  uint64_t result = sub_1DCE0();
  qword_2BEE8 = result;
  return result;
}

unint64_t sub_10630()
{
  unint64_t result = qword_29888;
  if (!qword_29888)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_29888);
  }
  return result;
}

uint64_t sub_10670()
{
  sub_10630();
  uint64_t result = sub_1DCE0();
  qword_2BEF0 = result;
  return result;
}

uint64_t sub_106DC(uint64_t a1)
{
  return sub_10798(a1, qword_2BEF8, &qword_28FB0, (id *)&qword_2BEE8);
}

uint64_t *sub_10708(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_1076C(uint64_t a1)
{
  return sub_10798(a1, qword_2BF10, &qword_28FB8, (id *)&qword_2BEF0);
}

uint64_t sub_10798(uint64_t a1, uint64_t *a2, void *a3, id *a4)
{
  uint64_t v7 = sub_1DA30();
  sub_10708(v7, a2);
  sub_6FC0(v7, (uint64_t)a2);
  if (*a3 != -1) {
    swift_once();
  }
  id v8 = *a4;
  return sub_1DA40();
}

uint64_t sub_10824()
{
  uint64_t v1 = *(void *)(v0 + 32);
  uint64_t v2 = *(void **)(v0 + 40);
  swift_bridgeObjectRetain();
  v5._countAndFlagsBits = v1;
  v5._object = v2;
  sub_1DB60(v5);
  swift_bridgeObjectRelease();
  v6._countAndFlagsBits = 2592;
  v6._object = (void *)0xE200000000000000;
  sub_1DB60(v6);
  sub_6FF8(&qword_29678);
  v7._countAndFlagsBits = sub_1DB30();
  sub_1DB60(v7);
  swift_bridgeObjectRelease();
  v8._countAndFlagsBits = 2592;
  v8._object = (void *)0xE200000000000000;
  sub_1DB60(v8);
  swift_bridgeObjectRetain();
  v9._countAndFlagsBits = 0x3A736920776F6C66;
  v9._object = (void *)0xE800000000000000;
  sub_1DB60(v9);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  strcpy((char *)&v4, "gameContent:");
  BYTE5(v4._object) = 0;
  HIWORD(v4._object) = -5120;
  sub_6FF8(&qword_299E0);
  v10._countAndFlagsBits = sub_1DCF0();
  sub_1DB60(v10);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_1DB60(v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return 0x3A656D6167;
}

uint64_t sub_109BC(char a1)
{
  return *(void *)&aPlay_3[8 * a1];
}

unint64_t sub_109DC(char a1)
{
  unint64_t result = 0xD000000000000013;
  switch(a1)
  {
    case 1:
      unint64_t result = 6581861;
      break;
    case 2:
      unint64_t result = 0x656D75736572;
      break;
    case 3:
      return result;
    case 4:
      unint64_t result = 0x6E776F6E6B6E75;
      break;
    default:
      unint64_t result = 0x657461647075;
      break;
  }
  return result;
}

uint64_t sub_10A80(unsigned __int8 a1, char a2)
{
  unint64_t v2 = 0xD000000000000013;
  unint64_t v3 = 0x800000000001E590;
  uint64_t v4 = a1;
  unint64_t v5 = 0xD000000000000013;
  switch(v4)
  {
    case 1:
      unint64_t v3 = 0xE300000000000000;
      unint64_t v5 = 6581861;
      break;
    case 2:
      unint64_t v3 = 0xE600000000000000;
      unint64_t v5 = 0x656D75736572;
      break;
    case 3:
      break;
    case 4:
      unint64_t v3 = 0xE700000000000000;
      unint64_t v5 = 0x6E776F6E6B6E75;
      break;
    default:
      unint64_t v3 = 0xE600000000000000;
      unint64_t v5 = 0x657461647075;
      break;
  }
  unint64_t v6 = 0x800000000001E590;
  switch(a2)
  {
    case 1:
      unint64_t v6 = 0xE300000000000000;
      if (v5 == 6581861) {
        goto LABEL_13;
      }
      goto LABEL_16;
    case 2:
      unint64_t v6 = 0xE600000000000000;
      unint64_t v2 = 0x656D75736572;
      goto LABEL_12;
    case 3:
LABEL_12:
      if (v5 == v2) {
        goto LABEL_13;
      }
      goto LABEL_16;
    case 4:
      unint64_t v6 = 0xE700000000000000;
      if (v5 != 0x6E776F6E6B6E75) {
        goto LABEL_16;
      }
      goto LABEL_13;
    default:
      unint64_t v6 = 0xE600000000000000;
      if (v5 != 0x657461647075) {
        goto LABEL_16;
      }
LABEL_13:
      if (v3 == v6) {
        char v7 = 1;
      }
      else {
LABEL_16:
      }
        char v7 = sub_1DF50();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v7 & 1;
  }
}

uint64_t sub_10C24(char a1, char a2)
{
  if (*(void *)&aPlay_3[8 * a1] == *(void *)&aPlay_3[8 * a2] && qword_20240[a1] == qword_20240[a2]) {
    char v3 = 1;
  }
  else {
    char v3 = sub_1DF50();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

uint64_t sub_10CAC(char a1, char a2)
{
  unint64_t v3 = 0xD000000000000018;
  unint64_t v4 = 0x800000000001E5B0;
  switch(a1)
  {
    case 1:
      unint64_t v4 = 0xE800000000000000;
      unint64_t v3 = 0x79726F6765746163;
      break;
    case 2:
      unint64_t v4 = 0xE500000000000000;
      unint64_t v3 = 0x6C6576656CLL;
      break;
    case 3:
      break;
    case 4:
      unint64_t v4 = 0xEA00000000006E6FLL;
      unint64_t v3 = 0x6974634172657375;
      break;
    case 5:
      unint64_t v4 = 0xEC0000006E6F6974;
      unint64_t v3 = 0x6341746E65696C63;
      break;
    case 6:
      unint64_t v4 = 0x800000000001E5F0;
      unint64_t v3 = 0xD000000000000010;
      break;
    case 7:
      unint64_t v4 = 0xE600000000000000;
      unint64_t v3 = 0x656C61636F6CLL;
      break;
    case 8:
      unint64_t v4 = 0xEB00000000656D69;
      unint64_t v3 = 0x5464657461647075;
      break;
    default:
      unint64_t v4 = 0xE400000000000000;
      unint64_t v3 = 1701667182;
      break;
  }
  unint64_t v5 = 0xD000000000000018;
  unint64_t v6 = 0x800000000001E5B0;
  switch(a2)
  {
    case 1:
      unint64_t v6 = 0xE800000000000000;
      if (v3 == 0x79726F6765746163) {
        goto LABEL_25;
      }
      goto LABEL_28;
    case 2:
      unint64_t v6 = 0xE500000000000000;
      if (v3 != 0x6C6576656CLL) {
        goto LABEL_28;
      }
      goto LABEL_25;
    case 3:
      goto LABEL_24;
    case 4:
      unint64_t v6 = 0xEA00000000006E6FLL;
      if (v3 != 0x6974634172657375) {
        goto LABEL_28;
      }
      goto LABEL_25;
    case 5:
      unint64_t v6 = 0xEC0000006E6F6974;
      if (v3 != 0x6341746E65696C63) {
        goto LABEL_28;
      }
      goto LABEL_25;
    case 6:
      unint64_t v6 = 0x800000000001E5F0;
      if (v3 != 0xD000000000000010) {
        goto LABEL_28;
      }
      goto LABEL_25;
    case 7:
      unint64_t v6 = 0xE600000000000000;
      unint64_t v5 = 0x656C61636F6CLL;
LABEL_24:
      if (v3 == v5) {
        goto LABEL_25;
      }
      goto LABEL_28;
    case 8:
      unint64_t v6 = 0xEB00000000656D69;
      if (v3 != 0x5464657461647075) {
        goto LABEL_28;
      }
      goto LABEL_25;
    default:
      unint64_t v6 = 0xE400000000000000;
      if (v3 != 1701667182) {
        goto LABEL_28;
      }
LABEL_25:
      if (v4 == v6) {
        char v7 = 1;
      }
      else {
LABEL_28:
      }
        char v7 = sub_1DF50();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v7 & 1;
  }
}

uint64_t sub_10F84(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    unint64_t v3 = 0xD000000000000017;
  }
  else {
    unint64_t v3 = 0x7377656956646461;
  }
  if (v2) {
    unint64_t v4 = 0xEC0000006E6F734ALL;
  }
  else {
    unint64_t v4 = 0x800000000001E540;
  }
  if (a2) {
    unint64_t v5 = 0xD000000000000017;
  }
  else {
    unint64_t v5 = 0x7377656956646461;
  }
  if (a2) {
    unint64_t v6 = 0x800000000001E540;
  }
  else {
    unint64_t v6 = 0xEC0000006E6F734ALL;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = sub_1DF50();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_11034(unsigned __int8 a1, char a2)
{
  unint64_t v2 = 0xD000000000000013;
  unint64_t v3 = 0x800000000001E690;
  uint64_t v4 = a1;
  unint64_t v5 = 0xD000000000000013;
  switch(v4)
  {
    case 1:
      unint64_t v3 = 0xE800000000000000;
      unint64_t v5 = 0x79726F6765746163;
      break;
    case 2:
      unint64_t v3 = 0xE500000000000000;
      unint64_t v5 = 0x6C6576656CLL;
      break;
    case 3:
      unint64_t v3 = 0xEA00000000006574;
      unint64_t v5 = 0x6174537472617473;
      break;
    case 4:
      unint64_t v3 = 0xE500000000000000;
      unint64_t v5 = 0x65726F6373;
      break;
    case 5:
      break;
    case 6:
      unint64_t v3 = 0xEB00000000646574;
      unint64_t v5 = 0x656C706D6F437369;
      break;
    case 7:
      unint64_t v3 = 0xEB00000000656D69;
      unint64_t v5 = 0x5464657461657263;
      break;
    case 8:
      unint64_t v3 = 0xE800000000000000;
      unint64_t v5 = 0x6E6F697461727564;
      break;
    default:
      unint64_t v3 = 0xE400000000000000;
      unint64_t v5 = 1701667182;
      break;
  }
  unint64_t v6 = 0x800000000001E690;
  switch(a2)
  {
    case 1:
      unint64_t v6 = 0xE800000000000000;
      if (v5 == 0x79726F6765746163) {
        goto LABEL_25;
      }
      goto LABEL_28;
    case 2:
      unint64_t v6 = 0xE500000000000000;
      if (v5 != 0x6C6576656CLL) {
        goto LABEL_28;
      }
      goto LABEL_25;
    case 3:
      unint64_t v6 = 0xEA00000000006574;
      if (v5 != 0x6174537472617473) {
        goto LABEL_28;
      }
      goto LABEL_25;
    case 4:
      unint64_t v6 = 0xE500000000000000;
      if (v5 != 0x65726F6373) {
        goto LABEL_28;
      }
      goto LABEL_25;
    case 5:
      goto LABEL_24;
    case 6:
      unint64_t v6 = 0xEB00000000646574;
      if (v5 != 0x656C706D6F437369) {
        goto LABEL_28;
      }
      goto LABEL_25;
    case 7:
      unint64_t v6 = 0xEB00000000656D69;
      unint64_t v2 = 0x5464657461657263;
LABEL_24:
      if (v5 == v2) {
        goto LABEL_25;
      }
      goto LABEL_28;
    case 8:
      unint64_t v6 = 0xE800000000000000;
      if (v5 != 0x6E6F697461727564) {
        goto LABEL_28;
      }
      goto LABEL_25;
    default:
      unint64_t v6 = 0xE400000000000000;
      if (v5 != 1701667182) {
        goto LABEL_28;
      }
LABEL_25:
      if (v3 == v6) {
        char v7 = 1;
      }
      else {
LABEL_28:
      }
        char v7 = sub_1DF50();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v7 & 1;
  }
}

uint64_t sub_11300(unsigned __int8 a1, char a2)
{
  unint64_t v2 = 0xD000000000000012;
  unint64_t v3 = 0x800000000001E500;
  uint64_t v4 = a1;
  unint64_t v5 = 0xD000000000000012;
  switch(v4)
  {
    case 1:
      unint64_t v3 = 0xE800000000000000;
      unint64_t v5 = 0x6E6F697473657571;
      break;
    case 2:
      unint64_t v3 = 0xE700000000000000;
      unint64_t v5 = 0x73726577736E61;
      break;
    case 3:
      break;
    case 4:
      unint64_t v3 = 0xE400000000000000;
      unint64_t v5 = 1953393000;
      break;
    case 5:
      unint64_t v3 = 0xE400000000000000;
      unint64_t v5 = 1701869940;
      break;
    case 6:
      unint64_t v3 = 0xEA00000000007974;
      unint64_t v5 = 0x6C75636966666964;
      break;
    default:
      unint64_t v3 = 0xE800000000000000;
      unint64_t v5 = 0x79726F6765746163;
      break;
  }
  unint64_t v6 = 0x800000000001E500;
  switch(a2)
  {
    case 1:
      unint64_t v6 = 0xE800000000000000;
      if (v5 == 0x6E6F697473657571) {
        goto LABEL_19;
      }
      goto LABEL_22;
    case 2:
      unint64_t v6 = 0xE700000000000000;
      if (v5 != 0x73726577736E61) {
        goto LABEL_22;
      }
      goto LABEL_19;
    case 3:
      goto LABEL_18;
    case 4:
      unint64_t v6 = 0xE400000000000000;
      if (v5 != 1953393000) {
        goto LABEL_22;
      }
      goto LABEL_19;
    case 5:
      unint64_t v6 = 0xE400000000000000;
      unint64_t v2 = 1701869940;
LABEL_18:
      if (v5 == v2) {
        goto LABEL_19;
      }
      goto LABEL_22;
    case 6:
      unint64_t v6 = 0xEA00000000007974;
      if (v5 != 0x6C75636966666964) {
        goto LABEL_22;
      }
      goto LABEL_19;
    default:
      unint64_t v6 = 0xE800000000000000;
      if (v5 != 0x79726F6765746163) {
        goto LABEL_22;
      }
LABEL_19:
      if (v3 == v6) {
        char v7 = 1;
      }
      else {
LABEL_22:
      }
        char v7 = sub_1DF50();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v7 & 1;
  }
}

uint64_t sub_1152C(char a1, char a2)
{
  if (*(void *)&aMultipleBOOLea_0[8 * a1] == *(void *)&aMultipleBOOLea_0[8 * a2]
    && *(void *)&aFreeform_2[8 * a1 + 8] == *(void *)&aFreeform_2[8 * a2 + 8])
  {
    char v3 = 1;
  }
  else
  {
    char v3 = sub_1DF50();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

Swift::Int sub_115B4()
{
  return sub_1DF90();
}

Swift::Int sub_11620()
{
  return sub_1DF90();
}

Swift::Int sub_116B0()
{
  return sub_1DF90();
}

uint64_t sub_1179C()
{
  sub_1DB50();

  return swift_bridgeObjectRelease();
}

uint64_t sub_11874()
{
  sub_1DB50();

  return swift_bridgeObjectRelease();
}

uint64_t sub_118C8()
{
  sub_1DB50();

  return swift_bridgeObjectRelease();
}

uint64_t sub_11A2C()
{
  sub_1DB50();

  return swift_bridgeObjectRelease();
}

uint64_t sub_11AA4()
{
  sub_1DB50();

  return swift_bridgeObjectRelease();
}

uint64_t sub_11C00()
{
  sub_1DB50();

  return swift_bridgeObjectRelease();
}

uint64_t sub_11D14()
{
  sub_1DB50();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_11D68()
{
  return sub_1DF90();
}

Swift::Int sub_11DD0()
{
  return sub_1DF90();
}

Swift::Int sub_11EF4()
{
  return sub_1DF90();
}

Swift::Int sub_11F80()
{
  return sub_1DF90();
}

Swift::Int sub_11FE8()
{
  return sub_1DF90();
}

uint64_t sub_120D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8, __int16 a9, uint64_t a10, long long a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16)
{
  *(void *)(v16 + 16) = 0;
  *(unsigned char *)(v16 + 24) = 1;
  *(void *)(v16 + 80) = 0;
  *(unsigned char *)(v16 + 88) = 1;
  *(_WORD *)(v16 + 89) = 1287;
  *(_OWORD *)(v16 + 96) = xmmword_1FD70;
  *(_OWORD *)(v16 + 112) = 0u;
  *(_OWORD *)(v16 + 128) = 0u;
  *(void *)(v16 + 144) = 0;
  *(unsigned char *)(v16 + 152) = 1;
  *(void *)(v16 + 168) = 0;
  *(void *)(v16 + 176) = 0;
  *(void *)(v16 + 160) = 0;
  *(unsigned char *)(v16 + 184) = 1;
  *(void *)(v16 + 32) = a1;
  *(void *)(v16 + 40) = a2;
  *(void *)(v16 + 48) = a3;
  *(void *)(v16 + 56) = a4;
  *(void *)(v16 + 64) = a5;
  *(void *)(v16 + 72) = a6;
  swift_bridgeObjectRelease();
  *(void *)(v16 + 80) = a7;
  *(unsigned char *)(v16 + 88) = a8 & 1;
  *(_WORD *)(v16 + 89) = a9;
  uint64_t v19 = *(void *)(v16 + 96);
  uint64_t v20 = *(void *)(v16 + 104);
  *(void *)(v16 + 96) = a10;
  *(_OWORD *)(v16 + 104) = a11;
  *(void *)(v16 + 120) = a12;
  sub_13504(v19, v20);
  *(void *)(v16 + 128) = a13;
  *(void *)(v16 + 136) = a14;
  swift_bridgeObjectRelease();
  *(void *)(v16 + 144) = a15;
  *(unsigned char *)(v16 + 152) = a16 & 1;
  return v16;
}

uint64_t sub_121D8(char *a1, char *a2)
{
  return sub_10C24(*a1, *a2);
}

Swift::Int sub_121E4()
{
  return sub_11F80();
}

uint64_t sub_121F0()
{
  return sub_11874();
}

Swift::Int sub_121F8()
{
  return sub_11F80();
}

uint64_t sub_12200@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_15148(*(void *)a1, *(void **)(a1 + 8));
  *a2 = result;
  return result;
}

uint64_t sub_12230@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_109BC(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_1225C()
{
  return sub_1DBB0();
}

uint64_t sub_122BC()
{
  return sub_1DBA0();
}

uint64_t sub_1230C(unsigned __int8 *a1, char *a2)
{
  return sub_10A80(*a1, *a2);
}

Swift::Int sub_12318()
{
  return sub_116B0();
}

uint64_t sub_12320()
{
  return sub_1179C();
}

Swift::Int sub_12328()
{
  return sub_11FE8();
}

uint64_t sub_12330@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_15194(*(void *)a1, *(void **)(a1 + 8));
  *a2 = result;
  return result;
}

unint64_t sub_12360@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_109DC(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_1238C()
{
  return sub_1DBB0();
}

uint64_t sub_123EC()
{
  return sub_1DBA0();
}

uint64_t sub_1243C()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_13504(*(void *)(v0 + 96), *(void *)(v0 + 104));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return _swift_deallocClassInstance(v0, 185, 7);
}

uint64_t type metadata accessor for GameState()
{
  return self;
}

uint64_t getEnumTagSinglePayload for GameState.ClientAction(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFC) {
    goto LABEL_17;
  }
  if (a2 + 4 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 4) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 4;
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
      return (*a1 | (v4 << 8)) - 4;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 4;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 5;
  int v8 = v6 - 5;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for GameState.ClientAction(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 4 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 4) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFC) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFB)
  {
    unsigned int v6 = ((a2 - 252) >> 8) + 1;
    *unint64_t result = a2 + 4;
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
        JUMPOUT(0x12620);
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
          *unint64_t result = a2 + 4;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for GameState.ClientAction()
{
  return &type metadata for GameState.ClientAction;
}

unsigned char *storeEnumTagSinglePayload for GameState.UserAction(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 6 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 6) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFA) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF9)
  {
    unsigned int v6 = ((a2 - 250) >> 8) + 1;
    *unint64_t result = a2 + 6;
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
        JUMPOUT(0x12724);
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
          *unint64_t result = a2 + 6;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for GameState.UserAction()
{
  return &type metadata for GameState.UserAction;
}

unint64_t sub_12760()
{
  unint64_t result = qword_29988;
  if (!qword_29988)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_29988);
  }
  return result;
}

unint64_t sub_127B8()
{
  unint64_t result = qword_29990;
  if (!qword_29990)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_29990);
  }
  return result;
}

unint64_t sub_1280C(char a1)
{
  unint64_t result = 0xD000000000000018;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x79726F6765746163;
      break;
    case 2:
      unint64_t result = 0x6C6576656CLL;
      break;
    case 3:
      return result;
    case 4:
      unint64_t result = 0x6974634172657375;
      break;
    case 5:
      unint64_t result = 0x6341746E65696C63;
      break;
    case 6:
      unint64_t result = 0xD000000000000010;
      break;
    case 7:
      unint64_t result = 0x656C61636F6CLL;
      break;
    case 8:
      unint64_t result = 0x5464657461647075;
      break;
    default:
      unint64_t result = 1701667182;
      break;
  }
  return result;
}

unint64_t sub_1293C(char a1)
{
  unint64_t result = 0xD000000000000018;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x79726F6765746163;
      break;
    case 2:
      unint64_t result = 0x6C6576656CLL;
      break;
    case 3:
      return result;
    case 4:
      unint64_t result = 0x6974634172657375;
      break;
    case 5:
      unint64_t result = 0x6341746E65696C63;
      break;
    case 6:
      unint64_t result = 0xD000000000000010;
      break;
    case 7:
      unint64_t result = 0x656C61636F6CLL;
      break;
    case 8:
      unint64_t result = 0x5464657461647075;
      break;
    default:
      unint64_t result = 1701667182;
      break;
  }
  return result;
}

uint64_t sub_12A6C(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = sub_6FF8(&qword_299B8);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  int v8 = (char *)v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_703C(a1, a1[3]);
  sub_134B0();
  sub_1DFB0();
  LOBYTE(v11[0]) = 0;
  swift_bridgeObjectRetain();
  sub_1DF10();
  if (v2)
  {
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    return swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    LOBYTE(v11[0]) = 1;
    swift_bridgeObjectRetain();
    sub_1DF10();
    swift_bridgeObjectRelease();
    LOBYTE(v11[0]) = 2;
    swift_bridgeObjectRetain();
    sub_1DED0();
    swift_bridgeObjectRelease();
    LOBYTE(v11[0]) = 3;
    sub_1DEF0();
    LOBYTE(v11[0]) = *(unsigned char *)(v3 + 89);
    char v12 = 4;
    sub_135F4();
    sub_1DF00();
    LOBYTE(v11[0]) = *(unsigned char *)(v3 + 90);
    char v12 = 5;
    sub_13648();
    sub_1DF00();
    long long v9 = *(_OWORD *)(v3 + 112);
    v11[0] = *(_OWORD *)(v3 + 96);
    v11[1] = v9;
    char v12 = 6;
    sub_D520();
    sub_1DF00();
    LOBYTE(v11[0]) = 7;
    swift_bridgeObjectRetain();
    sub_1DED0();
    swift_bridgeObjectRelease();
    LOBYTE(v11[0]) = 8;
    sub_1DEF0();
    return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
}

uint64_t sub_12DBC(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = sub_6FF8(&qword_29998);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  int v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)(v3 + 16) = 0;
  *(unsigned char *)(v3 + 24) = 1;
  *(void *)(v3 + 72) = 0;
  *(void *)(v3 + 80) = 0;
  *(void *)(v3 + 64) = 0;
  *(unsigned char *)(v3 + 88) = 1;
  *(_WORD *)(v3 + 89) = 1287;
  *(_OWORD *)(v3 + 96) = xmmword_1FD70;
  *(_OWORD *)(v3 + 112) = 0u;
  *(_OWORD *)(v3 + 128) = 0u;
  *(void *)(v3 + 144) = 0;
  *(unsigned char *)(v3 + 152) = 1;
  *(void *)(v3 + 168) = 0;
  *(void *)(v3 + 176) = 0;
  *(void *)(v3 + 160) = 0;
  *(unsigned char *)(v3 + 184) = 1;
  uint64_t v9 = a1[3];
  unint64_t v23 = a1;
  sub_703C(a1, v9);
  sub_134B0();
  sub_1DFA0();
  if (v2)
  {
    swift_bridgeObjectRelease();
    sub_13504(*(void *)(v3 + 96), *(void *)(v3 + 104));
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_deallocPartialClassInstance();
  }
  else
  {
    LOBYTE(v24) = 0;
    *(void *)(v3 + 32) = sub_1DEA0();
    *(void *)(v3 + 40) = v10;
    LOBYTE(v24) = 1;
    *(void *)(v3 + 48) = sub_1DEA0();
    *(void *)(v3 + 56) = v12;
    LOBYTE(v24) = 2;
    *(void *)(v3 + 64) = sub_1DE60();
    *(void *)(v3 + 72) = v13;
    swift_bridgeObjectRelease();
    LOBYTE(v24) = 3;
    *(void *)(v3 + 80) = sub_1DE80();
    *(unsigned char *)(v3 + 88) = v14 & 1;
    char v26 = 4;
    sub_1354C();
    sub_1DE90();
    *(unsigned char *)(v3 + 89) = v24;
    char v26 = 5;
    sub_135A0();
    sub_1DE90();
    *(unsigned char *)(v3 + 90) = v24;
    char v26 = 6;
    sub_D460();
    sub_1DE90();
    uint64_t v15 = *(void *)(v3 + 96);
    uint64_t v16 = *(void *)(v3 + 104);
    long long v17 = v25;
    *(_OWORD *)(v3 + 96) = v24;
    *(_OWORD *)(v3 + 112) = v17;
    sub_13504(v15, v16);
    LOBYTE(v24) = 7;
    *(void *)(v3 + 128) = sub_1DE60();
    *(void *)(v3 + 136) = v18;
    swift_bridgeObjectRelease();
    LOBYTE(v24) = 8;
    uint64_t v19 = sub_1DE80();
    char v21 = v20;
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *(void *)(v3 + 144) = v19;
    *(unsigned char *)(v3 + 152) = v21 & 1;
  }
  sub_7080((uint64_t)v23);
  return v3;
}

uint64_t sub_1321C()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 32);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_13250()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_13284(char *a1, char *a2)
{
  return sub_10CAC(*a1, *a2);
}

Swift::Int sub_13290()
{
  return sub_1DF90();
}

uint64_t sub_132D8()
{
  return sub_118C8();
}

Swift::Int sub_132E0()
{
  return sub_1DF90();
}

uint64_t sub_13324@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_15288(*(void *)a1, *(void **)(a1 + 8));
  *a2 = result;
  return result;
}

unint64_t sub_13354@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_1280C(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

unint64_t sub_13380()
{
  return sub_1293C(*v0);
}

uint64_t sub_13388@<X0>(uint64_t a1@<X0>, void *a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_15288(a1, a2);
  *a3 = result;
  return result;
}

void sub_133B0(unsigned char *a1@<X8>)
{
  *a1 = 9;
}

uint64_t sub_133BC(uint64_t a1)
{
  unint64_t v2 = sub_134B0();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_133F8(uint64_t a1)
{
  unint64_t v2 = sub_134B0();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_13434@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v5 = swift_allocObject();
  uint64_t result = sub_12DBC(a1);
  if (!v2) {
    *a2 = v5;
  }
  return result;
}

uint64_t sub_1348C(void *a1)
{
  return sub_12A6C(a1);
}

unint64_t sub_134B0()
{
  unint64_t result = qword_299A0;
  if (!qword_299A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_299A0);
  }
  return result;
}

uint64_t sub_13504(uint64_t a1, uint64_t a2)
{
  if (a2 != 1)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

unint64_t sub_1354C()
{
  unint64_t result = qword_299A8;
  if (!qword_299A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_299A8);
  }
  return result;
}

unint64_t sub_135A0()
{
  unint64_t result = qword_299B0;
  if (!qword_299B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_299B0);
  }
  return result;
}

unint64_t sub_135F4()
{
  unint64_t result = qword_299C0;
  if (!qword_299C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_299C0);
  }
  return result;
}

unint64_t sub_13648()
{
  unint64_t result = qword_299C8;
  if (!qword_299C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_299C8);
  }
  return result;
}

uint64_t sub_1369C()
{
  uint64_t v1 = v0;
  uint64_t v2 = 1280070990;
  sub_6FF8(&qword_299E8);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_1FD80;
  uint64_t v4 = *(void *)(v0 + 32);
  uint64_t v5 = *(void **)(v0 + 40);
  uint64_t v40 = 39;
  unint64_t v41 = 0xE100000000000000;
  swift_bridgeObjectRetain();
  v42._countAndFlagsBits = v4;
  v42._object = v5;
  sub_1DB60(v42);
  v43._countAndFlagsBits = 39;
  v43._object = (void *)0xE100000000000000;
  sub_1DB60(v43);
  swift_bridgeObjectRelease();
  *(void *)(v3 + 56) = &type metadata for String;
  unint64_t v6 = sub_15A64();
  *(void *)(v3 + 64) = v6;
  *(void *)(v3 + 32) = 39;
  *(void *)(v3 + 40) = 0xE100000000000000;
  uint64_t v7 = *(void *)(v0 + 48);
  int v8 = *(void **)(v0 + 56);
  uint64_t v40 = 39;
  unint64_t v41 = 0xE100000000000000;
  swift_bridgeObjectRetain();
  v44._countAndFlagsBits = v7;
  v44._object = v8;
  sub_1DB60(v44);
  v45._countAndFlagsBits = 39;
  v45._object = (void *)0xE100000000000000;
  sub_1DB60(v45);
  swift_bridgeObjectRelease();
  *(void *)(v3 + 96) = &type metadata for String;
  *(void *)(v3 + 104) = v6;
  *(void *)(v3 + 72) = 39;
  *(void *)(v3 + 80) = 0xE100000000000000;
  uint64_t v9 = *(void **)(v0 + 72);
  if (v9)
  {
    uint64_t v10 = *(void *)(v0 + 64);
    uint64_t v40 = 39;
    unint64_t v41 = 0xE100000000000000;
    swift_bridgeObjectRetain_n();
    v46._countAndFlagsBits = v10;
    v46._object = v9;
    sub_1DB60(v46);
    v47._countAndFlagsBits = 39;
    v47._object = (void *)0xE100000000000000;
    sub_1DB60(v47);
    swift_bridgeObjectRelease_n();
    uint64_t v12 = 39;
    unint64_t v11 = 0xE100000000000000;
  }
  else
  {
    unint64_t v11 = 0xE400000000000000;
    uint64_t v12 = 1280070990;
  }
  *(void *)(v3 + 136) = &type metadata for String;
  *(void *)(v3 + 144) = v6;
  *(void *)(v3 + 112) = v12;
  *(void *)(v3 + 120) = v11;
  if (*(unsigned char *)(v0 + 88))
  {
    unint64_t v13 = 0xE400000000000000;
    uint64_t v14 = 1280070990;
  }
  else
  {
    uint64_t v40 = *(void *)(v0 + 80);
    uint64_t v14 = sub_1DF40();
  }
  *(void *)(v3 + 176) = &type metadata for String;
  *(void *)(v3 + 184) = v6;
  *(void *)(v3 + 152) = v14;
  *(void *)(v3 + 160) = v13;
  int v15 = *(unsigned __int8 *)(v0 + 89);
  if (v15 == 7)
  {
    unint64_t v16 = 0xE400000000000000;
    uint64_t v17 = 1280070990;
  }
  else
  {
    uint64_t v17 = sub_B0A4(v15);
  }
  *(void *)(v3 + 216) = &type metadata for String;
  *(void *)(v3 + 224) = v6;
  *(void *)(v3 + 192) = v17;
  *(void *)(v3 + 200) = v16;
  int v18 = *(unsigned __int8 *)(v0 + 90);
  if (v18 == 5)
  {
    unint64_t v19 = 0xE400000000000000;
    uint64_t v20 = 1280070990;
  }
  else
  {
    uint64_t v20 = sub_B118(v18);
  }
  *(void *)(v3 + 256) = &type metadata for String;
  *(void *)(v3 + 264) = v6;
  *(void *)(v3 + 232) = v20;
  *(void *)(v3 + 240) = v19;
  uint64_t v21 = *(void *)(v0 + 104);
  if (v21 == 1)
  {
    unint64_t v22 = 0xE400000000000000;
    uint64_t v23 = 1280070990;
  }
  else
  {
    uint64_t v24 = *(void *)(v1 + 96);
    sub_15AB8(v24, *(void *)(v1 + 104));
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v23 = sub_CD80();
    unint64_t v22 = v25;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v26 = v24;
    uint64_t v2 = 1280070990;
    sub_13504(v26, v21);
  }
  *(void *)(v3 + 296) = &type metadata for String;
  *(void *)(v3 + 304) = v6;
  *(void *)(v3 + 272) = v23;
  *(void *)(v3 + 280) = v22;
  unint64_t v27 = *(void **)(v1 + 136);
  if (v27)
  {
    uint64_t v28 = *(void *)(v1 + 128);
    uint64_t v40 = 39;
    unint64_t v41 = 0xE100000000000000;
    swift_bridgeObjectRetain_n();
    v48._countAndFlagsBits = v28;
    v48._object = v27;
    sub_1DB60(v48);
    v49._countAndFlagsBits = 39;
    v49._object = (void *)0xE100000000000000;
    sub_1DB60(v49);
    swift_bridgeObjectRelease_n();
    uint64_t v30 = 39;
    unint64_t v29 = 0xE100000000000000;
  }
  else
  {
    unint64_t v29 = 0xE400000000000000;
    uint64_t v30 = 1280070990;
  }
  *(void *)(v3 + 336) = &type metadata for String;
  *(void *)(v3 + 344) = v6;
  *(void *)(v3 + 312) = v30;
  *(void *)(v3 + 320) = v29;
  if (*(unsigned char *)(v1 + 152))
  {
    unint64_t v31 = 0xE400000000000000;
  }
  else
  {
    uint64_t v40 = *(void *)(v1 + 144);
    uint64_t v2 = sub_1DF40();
  }
  *(void *)(v3 + 376) = &type metadata for String;
  *(void *)(v3 + 384) = v6;
  *(void *)(v3 + 352) = v2;
  *(void *)(v3 + 360) = v31;
  uint64_t v32 = sub_1DB00();
  unint64_t v34 = v33;
  if (qword_28FC0 != -1) {
    swift_once();
  }
  uint64_t v35 = sub_1DA30();
  sub_6FC0(v35, (uint64_t)qword_2BEF8);
  swift_bridgeObjectRetain_n();
  char v36 = sub_1DA20();
  os_log_type_t v37 = sub_1DC40();
  if (os_log_type_enabled(v36, v37))
  {
    char v38 = (uint8_t *)swift_slowAlloc();
    uint64_t v40 = swift_slowAlloc();
    *(_DWORD *)char v38 = 136315138;
    swift_bridgeObjectRetain();
    sub_1B87C(v32, v34, &v40);
    sub_1DD00();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_0, v36, v37, "Insert statement: %s", v38, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  return v32;
}

uint64_t sub_13B84()
{
  uint64_t v1 = v0;
  uint64_t v2 = 1280070990;
  sub_6FF8(&qword_299E8);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_1FD80;
  uint64_t v4 = *(void **)(v0 + 72);
  if (v4)
  {
    uint64_t v5 = *(void *)(v0 + 64);
    uint64_t v39 = 39;
    unint64_t v40 = 0xE100000000000000;
    swift_bridgeObjectRetain_n();
    v41._countAndFlagsBits = v5;
    v41._object = v4;
    sub_1DB60(v41);
    v42._countAndFlagsBits = 39;
    v42._object = (void *)0xE100000000000000;
    sub_1DB60(v42);
    swift_bridgeObjectRelease_n();
    uint64_t v7 = 39;
    unint64_t v6 = 0xE100000000000000;
  }
  else
  {
    unint64_t v6 = 0xE400000000000000;
    uint64_t v7 = 1280070990;
  }
  *(void *)(v3 + 56) = &type metadata for String;
  unint64_t v8 = sub_15A64();
  *(void *)(v3 + 64) = v8;
  *(void *)(v3 + 32) = v7;
  *(void *)(v3 + 40) = v6;
  if (*(unsigned char *)(v1 + 88))
  {
    unint64_t v9 = 0xE400000000000000;
    uint64_t v10 = 1280070990;
  }
  else
  {
    uint64_t v39 = *(void *)(v1 + 80);
    uint64_t v10 = sub_1DF40();
  }
  *(void *)(v3 + 96) = &type metadata for String;
  *(void *)(v3 + 104) = v8;
  *(void *)(v3 + 72) = v10;
  *(void *)(v3 + 80) = v9;
  int v11 = *(unsigned __int8 *)(v1 + 89);
  if (v11 == 7)
  {
    unint64_t v12 = 0xE400000000000000;
    uint64_t v13 = 1280070990;
  }
  else
  {
    uint64_t v13 = sub_B0A4(v11);
  }
  *(void *)(v3 + 136) = &type metadata for String;
  *(void *)(v3 + 144) = v8;
  *(void *)(v3 + 112) = v13;
  *(void *)(v3 + 120) = v12;
  int v14 = *(unsigned __int8 *)(v1 + 90);
  if (v14 == 5)
  {
    unint64_t v15 = 0xE400000000000000;
    uint64_t v16 = 1280070990;
  }
  else
  {
    uint64_t v16 = sub_B118(v14);
  }
  *(void *)(v3 + 176) = &type metadata for String;
  *(void *)(v3 + 184) = v8;
  *(void *)(v3 + 152) = v16;
  *(void *)(v3 + 160) = v15;
  uint64_t v17 = *(void *)(v1 + 104);
  if (v17 == 1)
  {
    unint64_t v18 = 0xE400000000000000;
    uint64_t v19 = 1280070990;
  }
  else
  {
    uint64_t v20 = *(void *)(v1 + 96);
    sub_15AB8(v20, *(void *)(v1 + 104));
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v19 = sub_CD80();
    unint64_t v18 = v21;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v2 = 1280070990;
    sub_13504(v20, v17);
  }
  *(void *)(v3 + 216) = &type metadata for String;
  *(void *)(v3 + 224) = v8;
  *(void *)(v3 + 192) = v19;
  *(void *)(v3 + 200) = v18;
  unint64_t v22 = *(void **)(v1 + 136);
  if (v22)
  {
    uint64_t v23 = *(void *)(v1 + 128);
    uint64_t v39 = 39;
    unint64_t v40 = 0xE100000000000000;
    swift_bridgeObjectRetain_n();
    v43._countAndFlagsBits = v23;
    v43._object = v22;
    sub_1DB60(v43);
    v44._countAndFlagsBits = 39;
    v44._object = (void *)0xE100000000000000;
    sub_1DB60(v44);
    swift_bridgeObjectRelease_n();
    uint64_t v25 = 39;
    unint64_t v24 = 0xE100000000000000;
  }
  else
  {
    unint64_t v24 = 0xE400000000000000;
    uint64_t v25 = 1280070990;
  }
  *(void *)(v3 + 256) = &type metadata for String;
  *(void *)(v3 + 264) = v8;
  *(void *)(v3 + 232) = v25;
  *(void *)(v3 + 240) = v24;
  if (*(unsigned char *)(v1 + 152))
  {
    unint64_t v26 = 0xE400000000000000;
  }
  else
  {
    uint64_t v39 = *(void *)(v1 + 144);
    uint64_t v2 = sub_1DF40();
  }
  *(void *)(v3 + 296) = &type metadata for String;
  *(void *)(v3 + 304) = v8;
  *(void *)(v3 + 272) = v2;
  *(void *)(v3 + 280) = v26;
  uint64_t v27 = *(void *)(v1 + 32);
  uint64_t v28 = *(void **)(v1 + 40);
  uint64_t v39 = 39;
  unint64_t v40 = 0xE100000000000000;
  swift_bridgeObjectRetain();
  v45._countAndFlagsBits = v27;
  v45._object = v28;
  sub_1DB60(v45);
  v46._countAndFlagsBits = 39;
  v46._object = (void *)0xE100000000000000;
  sub_1DB60(v46);
  swift_bridgeObjectRelease();
  *(void *)(v3 + 336) = &type metadata for String;
  *(void *)(v3 + 344) = v8;
  *(void *)(v3 + 312) = 39;
  *(void *)(v3 + 320) = 0xE100000000000000;
  uint64_t v30 = *(void *)(v1 + 48);
  unint64_t v29 = *(void **)(v1 + 56);
  unint64_t v40 = 0xE100000000000000;
  swift_bridgeObjectRetain();
  v47._countAndFlagsBits = v30;
  v47._object = v29;
  sub_1DB60(v47);
  v48._countAndFlagsBits = 39;
  v48._object = (void *)0xE100000000000000;
  sub_1DB60(v48);
  swift_bridgeObjectRelease();
  *(void *)(v3 + 376) = &type metadata for String;
  *(void *)(v3 + 384) = v8;
  *(void *)(v3 + 352) = 39;
  *(void *)(v3 + 360) = 0xE100000000000000;
  uint64_t v31 = sub_1DB00();
  unint64_t v33 = v32;
  if (qword_28FC0 != -1) {
    swift_once();
  }
  uint64_t v34 = sub_1DA30();
  sub_6FC0(v34, (uint64_t)qword_2BEF8);
  swift_bridgeObjectRetain_n();
  uint64_t v35 = sub_1DA20();
  os_log_type_t v36 = sub_1DC40();
  if (os_log_type_enabled(v35, v36))
  {
    os_log_type_t v37 = (uint8_t *)swift_slowAlloc();
    uint64_t v39 = swift_slowAlloc();
    *(_DWORD *)os_log_type_t v37 = 136315138;
    swift_bridgeObjectRetain();
    sub_1B87C(v31, v33, &v39);
    sub_1DD00();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_0, v35, v36, "Update statement: %s", v37, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  return v31;
}

unint64_t sub_14078()
{
  uint64_t v1 = *(void *)(v0 + 32);
  uint64_t v2 = *(void **)(v0 + 40);
  swift_bridgeObjectRetain();
  sub_1DD50(41);
  swift_bridgeObjectRelease();
  v8[1] = 0x800000000001EE30;
  v9._countAndFlagsBits = v1;
  v9._object = v2;
  sub_1DB60(v9);
  v10._countAndFlagsBits = 15143;
  v10._object = (void *)0xE200000000000000;
  sub_1DB60(v10);
  swift_bridgeObjectRelease();
  if (qword_28FC0 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_1DA30();
  sub_6FC0(v3, (uint64_t)qword_2BEF8);
  swift_bridgeObjectRetain_n();
  uint64_t v4 = sub_1DA20();
  os_log_type_t v5 = sub_1DC40();
  if (os_log_type_enabled(v4, v5))
  {
    unint64_t v6 = (uint8_t *)swift_slowAlloc();
    v8[0] = swift_slowAlloc();
    *(_DWORD *)unint64_t v6 = 136315138;
    swift_bridgeObjectRetain();
    sub_1B87C(0xD000000000000025, 0x800000000001EE30, v8);
    sub_1DD00();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_0, v4, v5, "Delete statement: %s", v6, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  return 0xD000000000000025;
}

uint64_t sub_14290@<X0>(sqlite3_stmt *a1@<X0>, uint64_t a2@<X8>)
{
  int v4 = sqlite3_column_type(a1, 0);
  if (v4 == 5) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = sqlite3_column_int(a1, 0);
  }
  if (sqlite3_column_type(a1, 1) == 5 || !sqlite3_column_text(a1, 1))
  {
    uint64_t v40 = 0;
    uint64_t v46 = 0;
  }
  else
  {
    uint64_t v40 = sub_1DB80();
    uint64_t v46 = v6;
  }
  if (sqlite3_column_type(a1, 2) == 5 || !sqlite3_column_text(a1, 2))
  {
    uint64_t v7 = 0;
    uint64_t v9 = 0;
  }
  else
  {
    uint64_t v7 = sub_1DB80();
    uint64_t v9 = v8;
  }
  if (sqlite3_column_type(a1, 3) == 5 || !sqlite3_column_text(a1, 3))
  {
    uint64_t v39 = 0;
    uint64_t v45 = 0;
  }
  else
  {
    uint64_t v39 = sub_1DB80();
    uint64_t v45 = v10;
  }
  int v11 = sqlite3_column_type(a1, 4);
  if (v11 == 5) {
    uint64_t v38 = 0;
  }
  else {
    uint64_t v38 = sqlite3_column_int(a1, 4);
  }
  uint64_t v12 = 0x6E776F6E6B6E75;
  if (sqlite3_column_type(a1, 5) == 5 || !sqlite3_column_text(a1, 5))
  {
    int v14 = (void *)0xE700000000000000;
    uint64_t v13 = 0x6E776F6E6B6E75;
  }
  else
  {
    uint64_t v13 = sub_1DB80();
  }
  char v37 = sub_15148(v13, v14);
  if (sqlite3_column_type(a1, 6) == 5 || !sqlite3_column_text(a1, 6)) {
    unint64_t v15 = (void *)0xE700000000000000;
  }
  else {
    uint64_t v12 = sub_1DB80();
  }
  char v36 = sub_15194(v12, v15);
  uint64_t v16 = sub_D294(a1, 7);
  uint64_t v43 = v17;
  uint64_t v44 = (uint64_t)v16;
  uint64_t v41 = v19;
  uint64_t v42 = v18;
  if (sqlite3_column_type(a1, 8) == 5)
  {
    uint64_t v35 = 0;
    uint64_t v20 = 0;
    uint64_t v21 = v9;
  }
  else
  {
    uint64_t v21 = v9;
    if (sqlite3_column_text(a1, 8))
    {
      uint64_t v35 = sub_1DB80();
      uint64_t v20 = v22;
    }
    else
    {
      uint64_t v35 = 0;
      uint64_t v20 = 0;
    }
  }
  int v23 = sqlite3_column_type(a1, 9);
  if (v23 == 5)
  {
    uint64_t v24 = 0;
    if (!v46) {
      goto LABEL_38;
    }
  }
  else
  {
    uint64_t v24 = sqlite3_column_int(a1, 9);
    if (!v46) {
      goto LABEL_38;
    }
  }
  if (v21)
  {
    int v25 = v4;
    uint64_t v26 = v21;
    char v27 = v23 == 5;
    char v28 = v11 == 5;
    BOOL v34 = v25 == 5;
    uint64_t v29 = type metadata accessor for GameState();
    uint64_t v30 = swift_allocObject();
    *((void *)&v33 + 1) = v42;
    *(void *)&long long v33 = v43;
    HIBYTE(v32) = v36;
    LOBYTE(v32) = v37;
    uint64_t result = sub_120D0(v40, v46, v7, v26, v39, v45, v38, v28, v32, v44, v33, v41, v35, v20, v24, v27);
    *(void *)(v30 + 16) = v5;
    *(unsigned char *)(v30 + 24) = v34;
    *(void *)(a2 + 24) = v29;
    *(void *)(a2 + 32) = &off_25918;
    *(void *)a2 = v30;
    return result;
  }
LABEL_38:
  *(void *)(a2 + 32) = 0;
  *(_OWORD *)a2 = 0u;
  *(_OWORD *)(a2 + 16) = 0u;
  swift_bridgeObjectRelease();
  sub_13504(v44, v43);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

BOOL sub_14644()
{
  uint64_t v0 = sub_1DA10();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin();
  uint64_t v3 = (char *)&v13 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1DCC0();
  if (qword_28FB0 != -1) {
    swift_once();
  }
  sub_1DA00();
  sub_1D9F0();
  int v4 = *(void (**)(char *, uint64_t))(v1 + 8);
  v4(v3, v0);
  swift_retain();
  uint64_t v5 = sub_13B84();
  BOOL v7 = sub_E3A8(v5, v6);
  swift_release();
  swift_bridgeObjectRelease();
  if (v7)
  {
    if (qword_28FC0 != -1) {
      swift_once();
    }
    uint64_t v8 = sub_1DA30();
    sub_6FC0(v8, (uint64_t)qword_2BEF8);
    uint64_t v9 = sub_1DA20();
    os_log_type_t v10 = sub_1DC30();
    if (os_log_type_enabled(v9, v10))
    {
      int v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)int v11 = 0;
      _os_log_impl(&dword_0, v9, v10, "Update succeeded.", v11, 2u);
      swift_slowDealloc();
    }
  }
  sub_1DCB0();
  sub_1DA00();
  sub_1D9F0();
  v4(v3, v0);
  return v7;
}

uint64_t sub_148C8(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_1DA10();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin();
  BOOL v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1DCC0();
  if (qword_28FB0 != -1) {
    swift_once();
  }
  sub_1DA00();
  sub_1D9F0();
  uint64_t v8 = *(void (**)(char *, uint64_t))(v5 + 8);
  v8(v7, v4);
  if (sub_E3A8(0xD00000000000014FLL, 0x800000000001EC10)
    && (swift_retain(), uint64_t v9 = sub_1369C(), v11 = sub_E3A8(v9, v10), swift_release(), swift_bridgeObjectRelease(), v11))
  {
    *(void *)(v2 + 16) = sqlite3_last_insert_rowid(*(sqlite3 **)(a1 + 16));
    *(unsigned char *)(v2 + 24) = 0;
    if (qword_28FC0 != -1) {
      swift_once();
    }
    uint64_t v12 = sub_1DA30();
    sub_6FC0(v12, (uint64_t)qword_2BEF8);
    uint64_t v13 = sub_1DA20();
    os_log_type_t v14 = sub_1DC30();
    if (os_log_type_enabled(v13, v14))
    {
      unint64_t v15 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v15 = 0;
      _os_log_impl(&dword_0, v13, v14, "Insert succeeded.", v15, 2u);
      swift_slowDealloc();
    }

    uint64_t v16 = 1;
  }
  else
  {
    uint64_t v16 = 0;
  }
  sub_1DCB0();
  sub_1DA00();
  sub_1D9F0();
  v8(v7, v4);
  return v16;
}

uint64_t sub_14B8C(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_1DA10();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  BOOL v7 = (char *)&v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1DCC0();
  if (qword_28FB0 != -1) {
    swift_once();
  }
  sub_1DA00();
  sub_1D9F0();
  uint64_t v8 = *(void (**)(char *, uint64_t))(v5 + 8);
  v8(v7, v4);
  if (*(unsigned char *)(v1 + 24) == 1 && (sub_14EFC(a1) & 1) == 0)
  {
    if (qword_28FC0 != -1) {
      swift_once();
    }
    uint64_t v17 = sub_1DA30();
    sub_6FC0(v17, (uint64_t)qword_2BEF8);
    uint64_t v13 = sub_1DA20();
    os_log_type_t v18 = sub_1DC50();
    if (!os_log_type_enabled(v13, v18))
    {
      uint64_t v16 = 0;
      goto LABEL_18;
    }
    uint64_t v19 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v19 = 0;
    _os_log_impl(&dword_0, v13, v18, "Failed to delete data because it's not in database yet.", v19, 2u);
    uint64_t v16 = 0;
    goto LABEL_15;
  }
  swift_retain();
  unint64_t v9 = sub_14078();
  BOOL v11 = sub_E3A8(v9, v10);
  swift_release();
  swift_bridgeObjectRelease();
  if (v11)
  {
    *(void *)(v2 + 16) = 0;
    *(unsigned char *)(v2 + 24) = 1;
    if (qword_28FC0 != -1) {
      swift_once();
    }
    uint64_t v12 = sub_1DA30();
    sub_6FC0(v12, (uint64_t)qword_2BEF8);
    uint64_t v13 = sub_1DA20();
    os_log_type_t v14 = sub_1DC30();
    if (!os_log_type_enabled(v13, v14))
    {
      uint64_t v16 = 1;
      goto LABEL_18;
    }
    unint64_t v15 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unint64_t v15 = 0;
    _os_log_impl(&dword_0, v13, v14, "Delete succeeded.", v15, 2u);
    uint64_t v16 = 1;
LABEL_15:
    swift_slowDealloc();
LABEL_18:

    goto LABEL_19;
  }
  uint64_t v16 = 0;
LABEL_19:
  sub_1DCB0();
  sub_1DA00();
  sub_1D9F0();
  v8(v7, v4);
  return v16;
}

uint64_t sub_14EFC(uint64_t a1)
{
  uint64_t v3 = v1[4];
  uint64_t v4 = (void *)v1[5];
  uint64_t v6 = v1[6];
  unint64_t v5 = v1[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  unint64_t v7 = sub_152D4(v3, v4, v6, v5);
  uint64_t v9 = v8;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  unint64_t v10 = sub_E700(v7, v9, a1);
  swift_bridgeObjectRelease();
  if (!v10) {
    return 0;
  }
  unint64_t v11 = (unint64_t)sub_15048((uint64_t)v10);
  uint64_t result = swift_bridgeObjectRelease();
  if (!v11) {
    return 0;
  }
  if (!(v11 >> 62))
  {
    if (*(void *)((char *)&dword_10 + (v11 & 0xFFFFFFFFFFFFFF8))) {
      goto LABEL_5;
    }
    goto LABEL_11;
  }
  swift_bridgeObjectRetain();
  uint64_t v15 = sub_1DDF0();
  uint64_t result = swift_bridgeObjectRelease();
  if (!v15)
  {
LABEL_11:
    swift_bridgeObjectRelease();
    return 0;
  }
LABEL_5:
  if ((v11 & 0xC000000000000001) != 0)
  {
    uint64_t v13 = sub_1DD70();
LABEL_8:
    swift_bridgeObjectRelease();
    int v14 = *(unsigned __int8 *)(v13 + 24);
    swift_release();
    return v14 != 1;
  }
  if (*(void *)((char *)&dword_10 + (v11 & 0xFFFFFFFFFFFFFF8)))
  {
    uint64_t v13 = *(void *)(v11 + 32);
    swift_retain();
    goto LABEL_8;
  }
  __break(1u);
  return result;
}

void *sub_15048(uint64_t a1)
{
  uint64_t v6 = &_swiftEmptyArrayStorage;
  uint64_t v2 = *(void *)(a1 + 16);
  sub_1DDB0();
  if (!v2) {
    return v6;
  }
  for (uint64_t i = a1 + 32; ; i += 40)
  {
    sub_A710(i, (uint64_t)v5);
    sub_6FF8(&qword_29840);
    type metadata accessor for GameState();
    if (!swift_dynamicCast()) {
      break;
    }
    sub_1DD90();
    sub_1DDC0();
    sub_1DDD0();
    sub_1DDA0();
    if (!--v2) {
      return v6;
    }
  }
  swift_release();
  swift_release();
  return 0;
}

uint64_t sub_15148(uint64_t a1, void *a2)
{
  v6._countAndFlagsBits = a1;
  v3._rawValue = &off_24E60;
  v6._object = a2;
  unint64_t v4 = sub_1DE50(v3, v6);
  swift_bridgeObjectRelease();
  if (v4 >= 7) {
    return 7;
  }
  else {
    return v4;
  }
}

uint64_t sub_15194(uint64_t a1, void *a2)
{
  v6._countAndFlagsBits = a1;
  v3._rawValue = &off_24F28;
  v6._object = a2;
  unint64_t v4 = sub_1DE50(v3, v6);
  swift_bridgeObjectRelease();
  if (v4 >= 5) {
    return 5;
  }
  else {
    return v4;
  }
}

unint64_t sub_151E0()
{
  unint64_t result = qword_299D0;
  if (!qword_299D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_299D0);
  }
  return result;
}

unint64_t sub_15234()
{
  unint64_t result = qword_299D8;
  if (!qword_299D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_299D8);
  }
  return result;
}

uint64_t sub_15288(uint64_t a1, void *a2)
{
  v6._countAndFlagsBits = a1;
  v3._rawValue = &off_24FC0;
  v6._object = a2;
  unint64_t v4 = sub_1DE50(v3, v6);
  swift_bridgeObjectRelease();
  if (v4 >= 9) {
    return 9;
  }
  else {
    return v4;
  }
}

unint64_t sub_152D4(uint64_t a1, void *a2, uint64_t a3, unint64_t a4)
{
  if (!a2) {
    return 0xD00000000000003ALL;
  }
  if (!a4) {
    goto LABEL_8;
  }
  uint64_t v8 = HIBYTE(a4) & 0xF;
  if ((a4 & 0x2000000000000000) == 0) {
    uint64_t v8 = a3 & 0xFFFFFFFFFFFFLL;
  }
  if (v8)
  {
    sub_1DD50(98);
    v11._countAndFlagsBits = 0xD000000000000027;
    v11._object = (void *)0x800000000001EA70;
    sub_1DB60(v11);
    v12._countAndFlagsBits = a1;
    v12._object = a2;
    sub_1DB60(v12);
    v13._countAndFlagsBits = 0xD000000000000013;
    v13._object = (void *)0x800000000001EAD0;
    sub_1DB60(v13);
    v9._countAndFlagsBits = a3;
    v9._object = (void *)a4;
  }
  else
  {
LABEL_8:
    sub_1DD50(77);
    v14._countAndFlagsBits = 0xD000000000000027;
    v14._object = (void *)0x800000000001EA70;
    sub_1DB60(v14);
    v9._countAndFlagsBits = a1;
    v9._object = a2;
  }
  sub_1DB60(v9);
  v15._object = (void *)0x800000000001EAA0;
  v15._countAndFlagsBits = 0xD000000000000024;
  sub_1DB60(v15);
  return 0;
}

uint64_t sub_15434(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, unint64_t a5)
{
  uint64_t v47 = a1;
  unint64_t v48 = a5;
  uint64_t v8 = sub_1DA30();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  Swift::String v11 = (char *)&v38 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v49 = sub_1DA10();
  uint64_t v12 = *(void *)(v49 - 8);
  __chkstk_darwin(v49);
  Swift::String v14 = (char *)&v38 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1DCC0();
  if (qword_28FB0 != -1) {
    swift_once();
  }
  uint64_t v46 = a2;
  sub_1DA00();
  sub_1D9F0();
  Swift::String v15 = *(void (**)(char *, uint64_t))(v12 + 8);
  uint64_t v43 = v12 + 8;
  v15(v14, v49);
  if (qword_28FC0 != -1) {
    swift_once();
  }
  uint64_t v16 = v11;
  uint64_t v17 = sub_6FC0(v8, (uint64_t)qword_2BEF8);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v16, v17, v8);
  swift_bridgeObjectRetain_n();
  os_log_type_t v18 = sub_1DA20();
  uint64_t v19 = v8;
  os_log_type_t v20 = sub_1DC40();
  BOOL v21 = os_log_type_enabled(v18, v20);
  uint64_t v44 = v15;
  uint64_t v45 = v14;
  if (v21)
  {
    uint64_t v22 = swift_slowAlloc();
    uint64_t v42 = a4;
    int v23 = (uint8_t *)v22;
    uint64_t v39 = swift_slowAlloc();
    uint64_t v51 = v39;
    uint64_t v40 = v16;
    uint64_t v41 = v19;
    *(_DWORD *)int v23 = 136315138;
    uint64_t v24 = v46;
    if (a3) {
      uint64_t v25 = v46;
    }
    else {
      uint64_t v25 = 7104878;
    }
    if (a3) {
      unint64_t v26 = (unint64_t)a3;
    }
    else {
      unint64_t v26 = 0xE300000000000000;
    }
    uint64_t v38 = v23 + 4;
    swift_bridgeObjectRetain();
    uint64_t v50 = sub_1B87C(v25, v26, &v51);
    sub_1DD00();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_0, v18, v20, "read data from DB, game= %s", v23, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    a4 = v42;
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v9 + 8))(v40, v41);
    char v27 = a3;
  }
  else
  {

    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v16, v19);
    char v27 = a3;
    uint64_t v24 = v46;
  }
  unint64_t v28 = sub_152D4(v24, v27, a4, v48);
  unint64_t v30 = v29;
  swift_bridgeObjectRetain_n();
  uint64_t v31 = sub_1DA20();
  os_log_type_t v32 = sub_1DC40();
  if (os_log_type_enabled(v31, v32))
  {
    long long v33 = (uint8_t *)swift_slowAlloc();
    uint64_t v51 = swift_slowAlloc();
    *(_DWORD *)long long v33 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v50 = sub_1B87C(v28, v30, &v51);
    sub_1DD00();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_0, v31, v32, "read data from DB, queryStatement= %s", v33, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  uint64_t v34 = (uint64_t)sub_EA70(v28, v30, v47);
  swift_bridgeObjectRelease();
  if (!v34) {
    goto LABEL_26;
  }
  unint64_t v35 = (unint64_t)sub_15048(v34);
  uint64_t result = swift_bridgeObjectRelease();
  if (!v35)
  {
    uint64_t v34 = 0;
    goto LABEL_26;
  }
  if (v35 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v34 = sub_1DDF0();
    uint64_t result = swift_bridgeObjectRelease();
    if (!v34) {
      goto LABEL_24;
    }
  }
  else
  {
    uint64_t v34 = *(void *)((char *)&dword_10 + (v35 & 0xFFFFFFFFFFFFFF8));
    if (!v34)
    {
LABEL_24:
      swift_bridgeObjectRelease();
LABEL_26:
      sub_1DCB0();
      char v37 = v45;
      sub_1DA00();
      sub_1D9F0();
      v44(v37, v49);
      return v34;
    }
  }
  if ((v35 & 0xC000000000000001) != 0)
  {
    uint64_t v34 = sub_1DD70();
    goto LABEL_24;
  }
  if (*(void *)((char *)&dword_10 + (v35 & 0xFFFFFFFFFFFFFF8)))
  {
    uint64_t v34 = *(void *)(v35 + 32);
    swift_retain();
    goto LABEL_24;
  }
  __break(1u);
  return result;
}

unint64_t sub_15A64()
{
  unint64_t result = qword_299F0;
  if (!qword_299F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_299F0);
  }
  return result;
}

uint64_t sub_15AB8(uint64_t a1, uint64_t a2)
{
  if (a2 != 1)
  {
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t getEnumTagSinglePayload for GameState.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF8) {
    goto LABEL_17;
  }
  if (a2 + 8 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 8) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 8;
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
      return (*a1 | (v4 << 8)) - 8;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 8;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 9;
  int v8 = v6 - 9;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for GameState.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 8 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 8) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF8) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF7)
  {
    unsigned int v6 = ((a2 - 248) >> 8) + 1;
    *uint64_t result = a2 + 8;
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
        JUMPOUT(0x15C5CLL);
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
          *uint64_t result = a2 + 8;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for GameState.CodingKeys()
{
  return &type metadata for GameState.CodingKeys;
}

unint64_t sub_15C98()
{
  unint64_t result = qword_299F8;
  if (!qword_299F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_299F8);
  }
  return result;
}

unint64_t sub_15CF0()
{
  unint64_t result = qword_29A00;
  if (!qword_29A00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_29A00);
  }
  return result;
}

unint64_t sub_15D48()
{
  unint64_t result = qword_29A08;
  if (!qword_29A08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_29A08);
  }
  return result;
}

void sub_15D9C()
{
  sub_1D920();
  sub_1D8E0();
  sub_1D8D0();
  sub_1D910();
  sub_1D900();
  sub_6FF8(&qword_294D0);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_1F560;
  sub_F77C();
  id v1 = objc_allocWithZone((Class)SABaseAceObject);
  Class isa = sub_1DA80().super.isa;
  swift_bridgeObjectRelease();
  id v3 = [v1 initWithDictionary:isa];

  if (v3)
  {
    *(void *)(v0 + 32) = v3;
    sub_1DC00();
    sub_1D8F0();
  }
  else
  {
    __break(1u);
  }
}

id sub_15ED0()
{
  uint64_t v1 = sub_1D7E0();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  unsigned int v4 = (char *)v78 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_1DB20();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  int v8 = (char *)v78 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(void *)(v0 + 104) < 2uLL
    || (swift_bridgeObjectRetain(),
        sub_1DB10(),
        uint64_t v9 = sub_1DAE0(),
        unint64_t v11 = v10,
        swift_bridgeObjectRelease(),
        (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5),
        v11 >> 60 == 15))
  {
    if (qword_28FC8 != -1) {
      swift_once();
    }
    uint64_t v12 = sub_1DA30();
    sub_6FC0(v12, (uint64_t)qword_2BF10);
    uint64_t v13 = sub_1DA20();
    os_log_type_t v14 = sub_1DC30();
    if (os_log_type_enabled(v13, v14))
    {
      Swift::String v15 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)Swift::String v15 = 0;
      _os_log_impl(&dword_0, v13, v14, "no addViewsJson from storage", v15, 2u);
      swift_slowDealloc();
    }

    return 0;
  }
  os_log_type_t v18 = self;
  uint64_t v85 = v9;
  Class isa = sub_1D780().super.isa;
  *(void *)&long long v88 = 0;
  id v20 = [v18 JSONObjectWithData:isa options:4 error:&v88];

  if (!v20)
  {
    id v30 = (id)v88;
    sub_1D720();

    swift_willThrow();
    if (qword_28FC8 != -1) {
      swift_once();
    }
    uint64_t v31 = sub_1DA30();
    sub_6FC0(v31, (uint64_t)qword_2BF10);
    os_log_type_t v32 = sub_1DA20();
    os_log_type_t v33 = sub_1DC50();
    if (os_log_type_enabled(v32, v33))
    {
      uint64_t v34 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v34 = 0;
      _os_log_impl(&dword_0, v32, v33, "parse addViewsJson to addViews failed", v34, 2u);
      swift_slowDealloc();
    }
    sub_D4B4(v85, v11);
    swift_errorRelease();

    return 0;
  }
  id v21 = (id)v88;
  sub_1DD20();
  swift_unknownObjectRelease();
  sub_6FF8((uint64_t *)&unk_29A10);
  if (swift_dynamicCast()) {
    uint64_t v22 = v87[0];
  }
  else {
    uint64_t v22 = 0;
  }
  id v23 = [objc_allocWithZone((Class)SAUIAddViews) init];
  sub_17EC8(v22);
  if (!v24)
  {

    swift_bridgeObjectRelease();
    sub_D4B4(v85, v11);
    return 0;
  }
  uint64_t v25 = v24;
  id v26 = objc_allocWithZone((Class)SAUIAssistantUtteranceView);
  id v27 = v25;
  id v84 = [v26 init];
  if (v22)
  {
    if (*(void *)(v22 + 16) && (unint64_t v28 = sub_17AC4(0x676F6C616964, 0xE600000000000000), (v29 & 1) != 0))
    {
      sub_1050C(*(void *)(v22 + 56) + 32 * v28, (uint64_t)&v88);
    }
    else
    {
      long long v88 = 0u;
      long long v89 = 0u;
    }
    swift_bridgeObjectRelease();
    if (!*((void *)&v89 + 1))
    {
      sub_17B3C((uint64_t)&v88);
      goto LABEL_52;
    }
    if ((swift_dynamicCast() & 1) == 0) {
      goto LABEL_52;
    }
    uint64_t v35 = v87[0];
    if (qword_28FC8 != -1) {
      swift_once();
    }
    uint64_t v36 = sub_1DA30();
    sub_6FC0(v36, (uint64_t)qword_2BF10);
    swift_bridgeObjectRetain_n();
    char v37 = sub_1DA20();
    os_log_type_t v38 = sub_1DC40();
    int v39 = v38;
    BOOL v40 = os_log_type_enabled(v37, v38);
    unint64_t v83 = v11;
    if (v40)
    {
      v82 = v37;
      uint64_t v41 = swift_slowAlloc();
      LODWORD(v81) = v39;
      uint64_t v42 = (uint8_t *)v41;
      uint64_t v80 = swift_slowAlloc();
      *(void *)&long long v88 = v80;
      v79 = v42;
      *(_DWORD *)uint64_t v42 = 136315138;
      v78[1] = v42 + 4;
      swift_bridgeObjectRetain();
      v78[2] = (char *)&type metadata for Any + 8;
      uint64_t v43 = sub_1DA90();
      unint64_t v45 = v44;
      swift_bridgeObjectRelease();
      v87[0] = sub_1B87C(v43, v45, (uint64_t *)&v88);
      sub_1DD00();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      uint64_t v46 = v82;
      _os_log_impl(&dword_0, v82, (os_log_type_t)v81, "parse result - dialogJson is: %s", v79, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    id v47 = v84;
    sub_1D7D0();
    sub_1D7C0();
    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
    NSString v48 = sub_1DAA0();
    swift_bridgeObjectRelease();
    [v47 setAceId:v48];

    if (*(void *)(v35 + 16)
      && (unint64_t v49 = sub_17AC4(0xD000000000000010, 0x800000000001EE60), (v50 & 1) != 0)
      && (sub_1050C(*(void *)(v35 + 56) + 32 * v49, (uint64_t)&v88), (swift_dynamicCast() & 1) != 0))
    {
      NSString v51 = sub_1DAA0();
      swift_bridgeObjectRelease();
    }
    else
    {
      NSString v51 = 0;
    }
    [v47 setDialogIdentifier:v51];

    if (*(void *)(v35 + 16) && (unint64_t v52 = sub_17AC4(0x746E65746E6F63, 0xE700000000000000), (v53 & 1) != 0))
    {
      sub_1050C(*(void *)(v35 + 56) + 32 * v52, (uint64_t)&v88);
    }
    else
    {
      long long v88 = 0u;
      long long v89 = 0u;
    }
    swift_bridgeObjectRelease();
    if (*((void *)&v89 + 1))
    {
      if (swift_dynamicCast())
      {
        uint64_t v54 = v87[1];
        swift_bridgeObjectRetain();
        NSString v55 = sub_1DAA0();
        swift_bridgeObjectRelease();
LABEL_48:
        [v47 setText:v55];

        id v56 = v47;
        if (v54)
        {
          NSString v57 = sub_1DAA0();
          swift_bridgeObjectRelease();
        }
        else
        {
          NSString v57 = 0;
        }
        [v47 setSpeakableText:v57];

        sub_17B9C(0, &qword_29A30);
        id v58 = v47;
        Class v59 = sub_1DCD0(1).super.super.isa;
        [v58 setListenAfterSpeaking:v59];

        unint64_t v11 = v83;
        goto LABEL_52;
      }
    }
    else
    {
      sub_17B3C((uint64_t)&v88);
    }
    NSString v55 = 0;
    uint64_t v54 = 0;
    goto LABEL_48;
  }
LABEL_52:
  id v60 = [objc_allocWithZone((Class)SAUISash) init];
  id result = [v27 sash];
  if (result)
  {
    uint64_t v61 = result;
    id v62 = [result title];

    [v60 setTitle:v62];
    NSString v63 = sub_1DAA0();
    [v60 setApplicationBundleIdentifier:v63];

    [v27 setSash:v60];
    *(void *)&long long v88 = &_swiftEmptyArrayStorage;
    uint64_t v64 = v84;
    sub_1DBC0();
    if (*(void *)((char *)&dword_10 + (v88 & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18
                                                                                   + (v88 & 0xFFFFFFFFFFFFFF8)) >> 1)
      sub_1DC10();
    sub_1DC20();
    sub_1DC00();
    id v65 = v27;
    sub_1DBC0();
    if (*(void *)((char *)&dword_10 + (v88 & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18
                                                                                   + (v88 & 0xFFFFFFFFFFFFFF8)) >> 1)
      sub_1DC10();
    sub_1DC20();
    sub_1DC00();
    sub_17B9C(0, &qword_29A20);
    Class v66 = sub_1DBD0().super.isa;
    swift_bridgeObjectRelease();
    [v23 setViews:v66];

    [v23 setImmersiveExperience:1];
    [v23 setDialogPhase:SAUIDialogPhaseSummaryValue];
    if (qword_28FC8 != -1) {
      swift_once();
    }
    uint64_t v67 = sub_1DA30();
    sub_6FC0(v67, (uint64_t)qword_2BF10);
    id v16 = v23;
    v68 = sub_1DA20();
    os_log_type_t v69 = sub_1DC40();
    if (os_log_type_enabled(v68, v69))
    {
      id v84 = v60;
      uint64_t v70 = swift_slowAlloc();
      v82 = v64;
      uint64_t v71 = (uint8_t *)v70;
      uint64_t v72 = swift_slowAlloc();
      unint64_t v83 = v11;
      v87[0] = v72;
      *(_DWORD *)uint64_t v71 = 136315138;
      id v73 = [v16 debugDescription];
      uint64_t v74 = sub_1DAD0();
      id v81 = v65;
      unint64_t v76 = v75;

      uint64_t v86 = sub_1B87C(v74, v76, v87);
      sub_1DD00();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_0, v68, v69, "addViewsCommand is: %s", v71, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
      sub_D4B4(v85, v83);
      id v77 = v81;
    }
    else
    {

      sub_D4B4(v85, v11);
    }

    return v16;
  }
  __break(1u);
  return result;
}

id sub_16BD4()
{
  uint64_t v1 = sub_1D7E0();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  unsigned int v4 = (char *)v69 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_1DB20();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  int v8 = (char *)v69 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = &SAServerBoundCommand__prots;
  if (*(void *)(v0 + 104) < 2uLL
    || (swift_bridgeObjectRetain(),
        sub_1DB10(),
        uint64_t v10 = sub_1DAE0(),
        unint64_t v12 = v11,
        swift_bridgeObjectRelease(),
        (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5),
        uint64_t v9 = &SAServerBoundCommand__prots,
        v12 >> 60 == 15))
  {
    if (v9[505].count != -1) {
      swift_once();
    }
    uint64_t v13 = sub_1DA30();
    sub_6FC0(v13, (uint64_t)qword_2BF10);
    os_log_type_t v14 = sub_1DA20();
    os_log_type_t v15 = sub_1DC30();
    if (os_log_type_enabled(v14, v15))
    {
      id v16 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v16 = 0;
      _os_log_impl(&dword_0, v14, v15, "no addViewsJson from storage", v16, 2u);
      swift_slowDealloc();
    }

    return 0;
  }
  uint64_t v19 = self;
  uint64_t v74 = v10;
  Class isa = sub_1D780().super.isa;
  *(void *)&long long v77 = 0;
  id v21 = [v19 JSONObjectWithData:isa options:4 error:&v77];

  if (!v21)
  {
    id v29 = (id)v77;
    sub_1D720();

    swift_willThrow();
    if (qword_28FC8 != -1) {
      swift_once();
    }
    uint64_t v30 = sub_1DA30();
    sub_6FC0(v30, (uint64_t)qword_2BF10);
    uint64_t v31 = sub_1DA20();
    os_log_type_t v32 = sub_1DC50();
    if (os_log_type_enabled(v31, v32))
    {
      os_log_type_t v33 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)os_log_type_t v33 = 0;
      _os_log_impl(&dword_0, v31, v32, "parse addViewsJson to addViews failed", v33, 2u);
      swift_slowDealloc();
    }
    sub_D4B4(v74, v12);
    swift_errorRelease();

    return 0;
  }
  id v22 = (id)v77;
  sub_1DD20();
  swift_unknownObjectRelease();
  sub_6FF8((uint64_t *)&unk_29A10);
  int v23 = swift_dynamicCast();
  uint64_t v24 = v75;
  id v25 = [objc_allocWithZone((Class)SAUIAddViews) init];
  id v26 = [objc_allocWithZone((Class)SAUIAssistantUtteranceView) init];
  if (v23 && v24)
  {
    if (*(void *)(v24 + 16) && (unint64_t v27 = sub_17AC4(0x6944656D75736572, 0xEC000000676F6C61), (v28 & 1) != 0))
    {
      sub_1050C(*(void *)(v24 + 56) + 32 * v27, (uint64_t)&v77);
    }
    else
    {
      long long v77 = 0u;
      long long v78 = 0u;
    }
    swift_bridgeObjectRelease();
    if (*((void *)&v78 + 1))
    {
      if (swift_dynamicCast())
      {
        uint64_t v34 = v75;
        if (qword_28FC8 != -1) {
          swift_once();
        }
        uint64_t v35 = sub_1DA30();
        sub_6FC0(v35, (uint64_t)qword_2BF10);
        swift_bridgeObjectRetain_n();
        uint64_t v36 = sub_1DA20();
        os_log_type_t v37 = sub_1DC40();
        int v38 = v37;
        BOOL v39 = os_log_type_enabled(v36, v37);
        unint64_t v73 = v12;
        if (v39)
        {
          os_log_t v71 = v36;
          LODWORD(v72) = v38;
          BOOL v40 = (uint8_t *)swift_slowAlloc();
          uint64_t v70 = swift_slowAlloc();
          *(void *)&long long v77 = v70;
          *(_DWORD *)BOOL v40 = 136315138;
          v69[0] = v40 + 4;
          swift_bridgeObjectRetain();
          v69[1] = (char *)&type metadata for Any + 8;
          uint64_t v41 = sub_1DA90();
          unint64_t v43 = v42;
          swift_bridgeObjectRelease();
          uint64_t v75 = sub_1B87C(v41, v43, (uint64_t *)&v77);
          sub_1DD00();
          swift_bridgeObjectRelease_n();
          swift_bridgeObjectRelease();
          os_log_t v44 = v71;
          _os_log_impl(&dword_0, v71, (os_log_type_t)v72, "parse result - dialogJson is: %s", v40, 0xCu);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();
        }
        else
        {

          swift_bridgeObjectRelease_n();
        }
        id v45 = v26;
        sub_1D7D0();
        sub_1D7C0();
        (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
        NSString v46 = sub_1DAA0();
        swift_bridgeObjectRelease();
        [v45 setAceId:v46];

        unint64_t v12 = v73;
        if (*(void *)(v34 + 16)
          && (unint64_t v47 = sub_17AC4(0xD000000000000010, 0x800000000001EE60), (v48 & 1) != 0)
          && (sub_1050C(*(void *)(v34 + 56) + 32 * v47, (uint64_t)&v77), (swift_dynamicCast() & 1) != 0))
        {
          NSString v49 = sub_1DAA0();
          swift_bridgeObjectRelease();
        }
        else
        {
          NSString v49 = 0;
        }
        [v45 setDialogIdentifier:v49];

        if (*(void *)(v34 + 16) && (unint64_t v50 = sub_17AC4(0x746E65746E6F63, 0xE700000000000000), (v51 & 1) != 0))
        {
          sub_1050C(*(void *)(v34 + 56) + 32 * v50, (uint64_t)&v77);
        }
        else
        {
          long long v77 = 0u;
          long long v78 = 0u;
        }
        swift_bridgeObjectRelease();
        if (*((void *)&v78 + 1))
        {
          if (swift_dynamicCast())
          {
            uint64_t v52 = v76;
            swift_bridgeObjectRetain();
            NSString v53 = sub_1DAA0();
            swift_bridgeObjectRelease();
LABEL_44:
            [v45 setText:v53];

            id v54 = v45;
            if (v52)
            {
              NSString v55 = sub_1DAA0();
              swift_bridgeObjectRelease();
            }
            else
            {
              NSString v55 = 0;
            }
            [v45 setSpeakableText:v55];

            sub_17B9C(0, &qword_29A30);
            id v56 = v45;
            Class v57 = sub_1DCD0(1).super.super.isa;
            [v56 setListenAfterSpeaking:v57];

            goto LABEL_48;
          }
        }
        else
        {
          sub_17B3C((uint64_t)&v77);
        }
        NSString v53 = 0;
        uint64_t v52 = 0;
        goto LABEL_44;
      }
    }
    else
    {
      sub_17B3C((uint64_t)&v77);
    }
  }
LABEL_48:
  sub_6FF8(&qword_294D0);
  uint64_t v58 = swift_allocObject();
  *(_OWORD *)(v58 + 16) = xmmword_1F560;
  *(void *)(v58 + 32) = v26;
  *(void *)&long long v77 = v58;
  sub_1DC00();
  sub_17B9C(0, &qword_29A20);
  id v59 = v26;
  Class v60 = sub_1DBD0().super.isa;
  swift_bridgeObjectRelease();
  [v25 setViews:v60];

  [v25 setImmersiveExperience:1];
  [v25 setDialogPhase:SAUIDialogPhaseCompletionValue];
  if (qword_28FC8 != -1) {
    swift_once();
  }
  uint64_t v61 = sub_1DA30();
  sub_6FC0(v61, (uint64_t)qword_2BF10);
  id v17 = v25;
  id v62 = sub_1DA20();
  os_log_type_t v63 = sub_1DC40();
  if (os_log_type_enabled(v62, v63))
  {
    id v72 = v59;
    uint64_t v64 = (uint8_t *)swift_slowAlloc();
    *(void *)&long long v77 = swift_slowAlloc();
    *(_DWORD *)uint64_t v64 = 136315138;
    unint64_t v73 = v12;
    id v65 = [v17 debugDescription];
    uint64_t v66 = sub_1DAD0();
    unint64_t v68 = v67;

    uint64_t v75 = sub_1B87C(v66, v68, (uint64_t *)&v77);
    sub_1DD00();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_0, v62, v63, "addViewsCommand is: %s", v64, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
    sub_D4B4(v74, v73);
  }
  else
  {

    sub_D4B4(v74, v12);
  }

  return v17;
}

void sub_17748(uint64_t *a1, void *a2)
{
  uint64_t v4 = sub_1D7E0();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *a1;
  id v9 = [objc_allocWithZone((Class)SAStartRequest) init];
  sub_1D7D0();
  sub_1D7C0();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  NSString v10 = sub_1DAA0();
  swift_bridgeObjectRelease();
  [v9 setAceId:v10];

  if (*(void *)(v8 + 16)
    && (unint64_t v11 = sub_17AC4(0x636E617265747475, 0xE900000000000065), (v12 & 1) != 0)
    && (sub_1050C(*(void *)(v8 + 56) + 32 * v11, (uint64_t)v25), (swift_dynamicCast() & 1) != 0))
  {
    NSString v13 = sub_1DAA0();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v13 = 0;
  }
  [v9 setUtterance:v13];

  id v14 = [objc_allocWithZone((Class)SASendCommands) init];
  sub_6FF8(&qword_294D0);
  uint64_t v15 = swift_allocObject();
  *(_OWORD *)(v15 + 16) = xmmword_1F560;
  *(void *)(v15 + 32) = v9;
  v25[0] = v15;
  sub_1DC00();
  id v16 = v9;
  sub_6FF8(&qword_294D8);
  Class isa = sub_1DBD0().super.isa;
  swift_bridgeObjectRelease();
  [v14 setCommands:isa];

  uint64_t v18 = *(void *)(v8 + 16);
  id v19 = v14;
  if (v18
    && (unint64_t v20 = sub_17AC4(0x6449656361, 0xE500000000000000), (v21 & 1) != 0)
    && (sub_1050C(*(void *)(v8 + 56) + 32 * v20, (uint64_t)v25), (swift_dynamicCast() & 1) != 0))
  {
    NSString v22 = sub_1DAA0();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v22 = 0;
  }
  [v19 setAceId:v22];

  id v23 = v19;
  sub_1DBC0();
  if (*(void *)((char *)&dword_10 + (*a2 & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18
                                                                                 + (*a2 & 0xFFFFFFFFFFFFFF8)) >> 1)
    sub_1DC10();
  sub_1DC20();
  sub_1DC00();
}

unint64_t sub_17AC4(uint64_t a1, uint64_t a2)
{
  sub_1DF70();
  sub_1DB50();
  Swift::Int v4 = sub_1DF90();

  return sub_17C6C(a1, a2, v4);
}

uint64_t sub_17B3C(uint64_t a1)
{
  uint64_t v2 = sub_6FF8(&qword_29A28);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_17B9C(uint64_t a1, unint64_t *a2)
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

unint64_t sub_17BD8(uint64_t a1)
{
  sub_1DAD0();
  sub_1DF70();
  sub_1DB50();
  Swift::Int v2 = sub_1DF90();
  swift_bridgeObjectRelease();

  return sub_17D50(a1, v2);
}

unint64_t sub_17C6C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    NSString v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_1DF50() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        NSString v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_1DF50() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_17D50(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v5 = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
  {
    uint64_t v6 = sub_1DAD0();
    uint64_t v8 = v7;
    if (v6 == sub_1DAD0() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    char v11 = sub_1DF50();
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
          uint64_t v13 = sub_1DAD0();
          uint64_t v15 = v14;
          if (v13 == sub_1DAD0() && v15 == v16) {
            break;
          }
          char v18 = sub_1DF50();
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

void sub_17EC8(uint64_t a1)
{
  uint64_t v2 = sub_1DA30();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  unint64_t v5 = (char *)&v54 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = &SAServerBoundCommand__prots;
  id v7 = [objc_allocWithZone((Class)SACardSnippet) init];
  if (a1)
  {
    if (*(void *)(a1 + 16))
    {
      unint64_t v8 = sub_17AC4(0x74657070696E73, 0xE700000000000000);
      if (v9)
      {
        sub_1050C(*(void *)(a1 + 56) + 32 * v8, (uint64_t)&v64);
        sub_6FF8((uint64_t *)&unk_29A10);
        if (swift_dynamicCast())
        {
          uint64_t v10 = v63;
          if (qword_28FC8 != -1) {
            swift_once();
          }
          uint64_t v11 = sub_6FC0(v2, (uint64_t)qword_2BF10);
          swift_bridgeObjectRetain_n();
          uint64_t v12 = sub_1DA20();
          os_log_type_t v13 = sub_1DC40();
          BOOL v14 = os_log_type_enabled(v12, v13);
          uint64_t v61 = v3;
          if (v14)
          {
            uint64_t v60 = v11;
            uint64_t v15 = (uint8_t *)swift_slowAlloc();
            id v59 = swift_slowAlloc();
            *(void *)&long long v64 = v59;
            *(_DWORD *)uint64_t v15 = 136315138;
            uint64_t v57 = (uint64_t)(v15 + 4);
            swift_bridgeObjectRetain();
            uint64_t v58 = (char *)&type metadata for Any + 8;
            uint64_t v16 = sub_1DA90();
            unint64_t v18 = v17;
            swift_bridgeObjectRelease();
            uint64_t v19 = v16;
            uint64_t v11 = v60;
            uint64_t v63 = sub_1B87C(v19, v18, (uint64_t *)&v64);
            sub_1DD00();
            swift_bridgeObjectRelease_n();
            swift_bridgeObjectRelease();
            _os_log_impl(&dword_0, v12, v13, "parse result - snippetJson is: %s", v15, 0xCu);
            swift_arrayDestroy();
            swift_slowDealloc();
            uint64_t v6 = &SAServerBoundCommand__prots;
            swift_slowDealloc();

            if (!*(void *)(v10 + 16))
            {
LABEL_20:
              swift_bridgeObjectRelease();
              uint64_t v30 = sub_1DA20();
              os_log_type_t v31 = sub_1DC50();
              if (os_log_type_enabled(v30, v31))
              {
                os_log_type_t v32 = (uint8_t *)swift_slowAlloc();
                *(_WORD *)os_log_type_t v32 = 0;
                _os_log_impl(&dword_0, v30, v31, "parse error - snippet cardData is empty", v32, 2u);
                swift_slowDealloc();
              }
              else
              {
              }
              return;
            }
          }
          else
          {

            swift_bridgeObjectRelease_n();
            if (!*(void *)(v10 + 16)) {
              goto LABEL_20;
            }
          }
          unint64_t v20 = sub_17AC4(0x6174614464726163, 0xE800000000000000);
          if ((v21 & 1) == 0) {
            goto LABEL_20;
          }
          sub_1050C(*(void *)(v10 + 56) + 32 * v20, (uint64_t)&v64);
          if ((swift_dynamicCast() & 1) == 0) {
            goto LABEL_20;
          }
          uint64_t v22 = v63;
          if (*(void *)(v10 + 16))
          {
            unint64_t v23 = sub_17AC4(0xD000000000000012, 0x800000000001EE80);
            if (v24)
            {
              sub_1050C(*(void *)(v10 + 56) + 32 * v23, (uint64_t)&v64);
              sub_6FF8(&qword_29A38);
              if (swift_dynamicCast())
              {
                uint64_t v58 = (char *)v22;
                uint64_t v60 = v10;
                uint64_t v25 = v63;
                *(void *)&long long v64 = &_swiftEmptyArrayStorage;
                uint64_t v26 = *(void *)(v63 + 16);
                if (v26)
                {
                  unint64_t v27 = v6;
                  swift_bridgeObjectRetain();
                  for (uint64_t i = 0; i != v26; ++i)
                  {
                    uint64_t v29 = *(void *)(v25 + 8 * i + 32);
                    uint64_t v63 = v29;
                    sub_17748(&v63, &v64);
                  }
                  swift_bridgeObjectRelease_n();
                  uint64_t v6 = v27;
                }
                else
                {
                  swift_bridgeObjectRelease();
                }
                swift_bridgeObjectRetain();
                uint64_t v57 = sub_6FF8(&qword_29AA0);
                Class isa = sub_1DBD0().super.isa;
                swift_bridgeObjectRelease();
                [v7 setReferencedCommands:isa];

                uint64_t v34 = v61;
                (*(void (**)(char *, uint64_t, uint64_t))(v61 + 16))(v5, v11, v2);
                id v35 = v7;
                uint64_t v36 = sub_1DA20();
                int v37 = sub_1DC40();
                id v59 = v36;
                BOOL v38 = os_log_type_enabled(v36, (os_log_type_t)v37);
                uint64_t v10 = v60;
                if (v38)
                {
                  int v56 = v37;
                  BOOL v39 = (uint8_t *)swift_slowAlloc();
                  uint64_t v55 = swift_slowAlloc();
                  uint64_t v63 = v55;
                  *(_DWORD *)BOOL v39 = 136315138;
                  id v40 = [v35 referencedCommands];
                  if (!v40)
                  {

                    __break(1u);
                    return;
                  }
                  uint64_t v41 = v40;
                  id v54 = v39 + 4;
                  sub_1DBE0();

                  uint64_t v42 = sub_1DBF0();
                  unint64_t v44 = v43;
                  swift_bridgeObjectRelease();
                  uint64_t v62 = sub_1B87C(v42, v44, &v63);
                  sub_1DD00();

                  swift_bridgeObjectRelease();
                  id v45 = v59;
                  _os_log_impl(&dword_0, v59, (os_log_type_t)v56, "referencedCommands are: %s", v39, 0xCu);
                  swift_arrayDestroy();
                  swift_slowDealloc();
                  swift_slowDealloc();

                  (*(void (**)(char *, uint64_t))(v61 + 8))(v5, v2);
                  uint64_t v6 = &SAServerBoundCommand__prots;
                  uint64_t v10 = v60;
                }
                else
                {

                  (*(void (**)(char *, uint64_t))(v34 + 8))(v5, v2);
                }
                swift_bridgeObjectRelease();
              }
            }
          }
          uint64_t v46 = sub_1D770();
          unint64_t v48 = v47;
          swift_bridgeObjectRelease();
          if (v48 >> 60 == 15)
          {
            Class v49 = 0;
          }
          else
          {
            Class v49 = sub_1D780().super.isa;
            sub_D4B4(v46, v48);
          }
          [v7 setCardData:v49];

          id v50 = [objc_allocWithZone((Class)SAUISash) (SEL)v6[472].count];
          if (*(void *)(v10 + 16) && (unint64_t v51 = sub_17AC4(0x6C74695468736173, 0xE900000000000065), (v52 & 1) != 0))
          {
            sub_1050C(*(void *)(v10 + 56) + 32 * v51, (uint64_t)&v64);
          }
          else
          {
            long long v64 = 0u;
            long long v65 = 0u;
          }
          swift_bridgeObjectRelease();
          if (*((void *)&v65 + 1))
          {
            if (swift_dynamicCast())
            {
              NSString v53 = sub_1DAA0();
              swift_bridgeObjectRelease();
LABEL_42:
              [v50 setTitle:v53];

              [v7 setSash:v50];
              return;
            }
          }
          else
          {
            sub_17B3C((uint64_t)&v64);
          }
          NSString v53 = 0;
          goto LABEL_42;
        }
      }
    }
  }
}

uint64_t sub_1872C(uint64_t a1, unint64_t a2)
{
  uint64_t v4 = sub_1DB20();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  id v7 = (char *)v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for GameState();
  sub_1DB10();
  uint64_t v8 = sub_1DAE0();
  unint64_t v10 = v9;
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  if (v10 >> 60 == 15)
  {
    if (qword_28FC8 != -1) {
      swift_once();
    }
    uint64_t v11 = sub_1DA30();
    sub_6FC0(v11, (uint64_t)qword_2BF10);
    swift_bridgeObjectRetain_n();
    uint64_t v12 = sub_1DA20();
    os_log_type_t v13 = sub_1DC30();
    if (os_log_type_enabled(v12, v13))
    {
      BOOL v14 = (uint8_t *)swift_slowAlloc();
      uint64_t v17 = swift_slowAlloc();
      *(_DWORD *)BOOL v14 = 136315138;
      swift_bridgeObjectRetain();
      v16[6] = sub_1B87C(a1, a2, &v17);
      sub_1DD00();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_0, v12, v13, "no invalid data for String= %s", v14, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    return 0;
  }
  else
  {
    sub_1D6E0();
    swift_allocObject();
    sub_1D6D0();
    sub_19810();
    sub_1D6C0();
    sub_D4B4(v8, v10);
    swift_release();
    return v17;
  }
}

uint64_t sub_18C70()
{
  uint64_t v0 = sub_1D7B0();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  id v72 = (char *)&v61 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_1DA10();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v61 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1DCC0();
  if (qword_28FB8 != -1) {
    swift_once();
  }
  sub_1DA00();
  sub_1D9F0();
  id v7 = *(void (**)(char *, uint64_t))(v4 + 8);
  v7(v6, v3);
  uint64_t v8 = sub_1D9A0();
  if (!v8) {
    goto LABEL_16;
  }
  uint64_t v9 = v8;
  if (!*(void *)(v8 + 16))
  {
    swift_bridgeObjectRelease();
LABEL_16:
    if (qword_28FC8 != -1) {
      swift_once();
    }
    uint64_t v25 = sub_1DA30();
    sub_6FC0(v25, (uint64_t)qword_2BF10);
    char v21 = sub_1DA20();
    os_log_type_t v22 = sub_1DC30();
    if (!os_log_type_enabled(v21, v22)) {
      goto LABEL_21;
    }
    unint64_t v23 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unint64_t v23 = 0;
    char v24 = "no domainData";
    goto LABEL_20;
  }
  unint64_t v10 = sub_17AC4(0x74617453656D6167, 0xE900000000000065);
  if ((v11 & 1) == 0 || (sub_1050C(*(void *)(v9 + 56) + 32 * v10, (uint64_t)&v75), (swift_dynamicCast() & 1) == 0))
  {
    swift_bridgeObjectRelease();
    if (qword_28FC8 != -1) {
      swift_once();
    }
    uint64_t v20 = sub_1DA30();
    sub_6FC0(v20, (uint64_t)qword_2BF10);
    char v21 = sub_1DA20();
    os_log_type_t v22 = sub_1DC30();
    if (!os_log_type_enabled(v21, v22)) {
      goto LABEL_21;
    }
    unint64_t v23 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unint64_t v23 = 0;
    char v24 = "no game info from server";
LABEL_20:
    _os_log_impl(&dword_0, v21, v22, v24, v23, 2u);
    swift_slowDealloc();
LABEL_21:

    uint64_t v26 = 0;
LABEL_22:
    sub_1DCB0();
    sub_1DA00();
    sub_1D9F0();
    v7(v6, v3);
    return v26;
  }
  uint64_t v67 = v1;
  uint64_t v68 = v0;
  uint64_t v13 = (uint64_t)v73;
  unint64_t v12 = (unint64_t)v74;
  if (qword_28FC8 != -1) {
    swift_once();
  }
  uint64_t v14 = sub_1DA30();
  uint64_t v15 = sub_6FC0(v14, (uint64_t)qword_2BF10);
  swift_bridgeObjectRetain_n();
  uint64_t v70 = v15;
  uint64_t v16 = sub_1DA20();
  os_log_type_t v17 = sub_1DC40();
  BOOL v18 = os_log_type_enabled(v16, v17);
  uint64_t v71 = v13;
  if (v18)
  {
    uint64_t v19 = (uint8_t *)swift_slowAlloc();
    uint64_t v69 = swift_slowAlloc();
    *(void *)&long long v75 = v69;
    *(_DWORD *)uint64_t v19 = 136315138;
    uint64_t v66 = v19 + 4;
    swift_bridgeObjectRetain();
    unint64_t v73 = sub_1B87C(v71, v12, (uint64_t *)&v75);
    sub_1DD00();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_0, v16, v17, "serverGameStateStr is: %s", v19, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    uint64_t v13 = v71;
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  uint64_t v26 = sub_1872C(v13, v12);
  uint64_t v28 = *(void *)(v9 + 16);
  swift_bridgeObjectRetain();
  if (v28
    && (unint64_t v29 = sub_17AC4(0x6E697265646E6572, 0xEA00000000007367), (v30 & 1) != 0)
    && (sub_1050C(*(void *)(v9 + 56) + 32 * v29, (uint64_t)&v75), (swift_dynamicCast() & 1) != 0))
  {
    os_log_type_t v31 = v74;
    uint64_t v69 = (uint64_t)v73;
    swift_bridgeObjectRetain_n();
    os_log_type_t v32 = sub_1DA20();
    os_log_type_t v33 = sub_1DC40();
    long long v65 = v32;
    if (os_log_type_enabled(v32, v33))
    {
      uint64_t v34 = (uint8_t *)swift_slowAlloc();
      uint64_t v35 = swift_slowAlloc();
      uint64_t v66 = (uint8_t *)v12;
      *(void *)&long long v75 = v35;
      long long v64 = v34;
      *(_DWORD *)uint64_t v34 = 136315138;
      uint64_t v63 = v34 + 4;
      swift_bridgeObjectRetain();
      unint64_t v73 = sub_1B87C(v69, (unint64_t)v31, (uint64_t *)&v75);
      sub_1DD00();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_0, v65, v33, "renderingsJson from Server is: %s", v64, 0xCu);
      swift_arrayDestroy();
      unint64_t v12 = (unint64_t)v66;
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
  else
  {
    uint64_t v36 = sub_1DA20();
    os_log_type_t v37 = sub_1DC30();
    if (os_log_type_enabled(v36, v37))
    {
      BOOL v38 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)BOOL v38 = 0;
      _os_log_impl(&dword_0, v36, v37, "no addViews from server", v38, 2u);
      swift_slowDealloc();
    }

    uint64_t v69 = 0;
    os_log_type_t v31 = 0;
  }
  if (*(void *)(v9 + 16))
  {
    unint64_t v39 = sub_17AC4(0x6B6361626C6C6166, 0xEF74736575716552);
    if (v40)
    {
      sub_1050C(*(void *)(v9 + 56) + 32 * v39, (uint64_t)&v75);
      if (swift_dynamicCast())
      {
        long long v64 = v31;
        long long v65 = v73;
        unint64_t v41 = (unint64_t)v74;
        swift_bridgeObjectRetain_n();
        uint64_t v42 = sub_1DA20();
        os_log_type_t v43 = sub_1DC40();
        if (os_log_type_enabled(v42, v43))
        {
          uint64_t v63 = (uint8_t *)swift_slowAlloc();
          uint64_t v44 = swift_slowAlloc();
          uint64_t v66 = (uint8_t *)v12;
          *(void *)&long long v75 = v44;
          os_log_t v62 = v42;
          id v45 = v63;
          *(_DWORD *)uint64_t v63 = 136315138;
          uint64_t v61 = v45 + 4;
          swift_bridgeObjectRetain();
          unint64_t v73 = sub_1B87C((uint64_t)v65, v41, (uint64_t *)&v75);
          sub_1DD00();
          swift_bridgeObjectRelease_n();
          os_log_t v46 = v62;
          _os_log_impl(&dword_0, v62, v43, "fallbackRequest from Server is: %s", v63, 0xCu);
          swift_arrayDestroy();
          unint64_t v12 = (unint64_t)v66;
          swift_slowDealloc();
          swift_slowDealloc();
        }
        else
        {

          swift_bridgeObjectRelease_n();
        }
        if (v26)
        {
          *(void *)(v26 + 160) = v65;
          *(void *)(v26 + 168) = v41;
        }
        swift_bridgeObjectRelease();
        os_log_type_t v31 = v64;
      }
    }
  }
  if (*(void *)(v9 + 16) && (unint64_t v47 = sub_17AC4(0x72754464696C6176, 0xED00006E6F697461), (v48 & 1) != 0))
  {
    sub_1050C(*(void *)(v9 + 56) + 32 * v47, (uint64_t)&v75);
  }
  else
  {
    long long v75 = 0u;
    long long v76 = 0u;
  }
  swift_bridgeObjectRelease();
  if (*((void *)&v76 + 1))
  {
    if (swift_dynamicCast())
    {
      Class v49 = v31;
      id v50 = v73;
      unint64_t v51 = sub_1DA20();
      os_log_type_t v52 = sub_1DC40();
      if (os_log_type_enabled(v51, v52))
      {
        NSString v53 = (uint8_t *)swift_slowAlloc();
        uint64_t v66 = (uint8_t *)v12;
        id v54 = v53;
        *(_DWORD *)NSString v53 = 134217984;
        *(void *)&long long v75 = v50;
        sub_1DD00();
        _os_log_impl(&dword_0, v51, v52, "validDuration from Server is: %ld", v54, 0xCu);
        unint64_t v12 = (unint64_t)v66;
        swift_slowDealloc();
      }

      os_log_type_t v31 = v49;
      uint64_t v55 = v69;
      if (v26)
      {
        *(void *)(v26 + 176) = v50;
        *(unsigned char *)(v26 + 184) = 0;
        goto LABEL_54;
      }
LABEL_58:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      goto LABEL_59;
    }
  }
  else
  {
    sub_17B3C((uint64_t)&v75);
  }
  uint64_t v55 = v69;
  if (!v26) {
    goto LABEL_58;
  }
LABEL_54:
  swift_retain();
  int v56 = v72;
  sub_1D7A0();
  sub_1D790();
  double v58 = v57;
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v67 + 8))(v56, v68);
  if ((~*(void *)&v58 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_61;
  }
  if (v58 <= -9.22337204e18)
  {
LABEL_61:
    __break(1u);
    goto LABEL_62;
  }
  if (v58 < 9.22337204e18)
  {
    *(void *)(v26 + 144) = (uint64_t)v58;
    *(unsigned char *)(v26 + 152) = 0;
    swift_release();
    uint64_t v59 = *(void *)(v26 + 96);
    uint64_t v60 = *(void *)(v26 + 104);
    *(void *)(v26 + 96) = v55;
    *(void *)(v26 + 104) = v31;
    *(void *)(v26 + 112) = v71;
    *(void *)(v26 + 120) = v12;
    sub_13504(v59, v60);
LABEL_59:
    swift_bridgeObjectRelease();
    goto LABEL_22;
  }
LABEL_62:
  __break(1u);
  return result;
}

unint64_t sub_19810()
{
  unint64_t result = qword_29AA8;
  if (!qword_29AA8)
  {
    type metadata accessor for GameState();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_29AA8);
  }
  return result;
}

unint64_t sub_19868()
{
  unint64_t result = qword_29AB8;
  if (!qword_29AB8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_29AB8);
  }
  return result;
}

uint64_t sub_198A8(uint64_t a1)
{
  v2[2] = a1;
  v2[3] = v1;
  sub_6FF8(&qword_294E0);
  v2[4] = swift_task_alloc();
  return _swift_task_switch(sub_1993C, 0, 0);
}

uint64_t sub_1993C()
{
  if (*(unsigned char *)(v0[3] + 112))
  {
    if (*(unsigned char *)(v0[3] + 112) == 1)
    {
      if (qword_28FC8 != -1) {
        swift_once();
      }
      uint64_t v1 = sub_1DA30();
      sub_6FC0(v1, (uint64_t)qword_2BF10);
      uint64_t v2 = sub_1DA20();
      os_log_type_t v3 = sub_1DC30();
      if (os_log_type_enabled(v2, v3))
      {
        uint64_t v4 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v4 = 0;
        _os_log_impl(&dword_0, v2, v3, "resume game", v4, 2u);
        swift_slowDealloc();
      }
      uint64_t v5 = v0[3];

      uint64_t v6 = *(void *)(v5 + 16);
      uint64_t v7 = *(void *)(v5 + 24);
      long long v8 = *(_OWORD *)(v5 + 80);
      uint64_t v9 = *(void *)(v5 + 96);
      *(_OWORD *)(v5 + 16) = 0u;
      *(_OWORD *)(v5 + 32) = 0u;
      *(_OWORD *)(v5 + 48) = 0u;
      *(_OWORD *)(v5 + 64) = 0u;
      *(_OWORD *)(v5 + 80) = 0u;
      *(void *)(v5 + 96) = 0;
      uint64_t v49 = v9;
      long long v47 = v8;
      sub_1A76C(v6, v7);
      id v10 = sub_15ED0();
      v0[7] = v10;
      if (v10)
      {
        uint64_t v11 = (uint64_t)v10;
        uint64_t v12 = v0[4];
        objc_msgSend(v10, "setRefId:", 0, v47, v49);
        sub_15D9C();
        uint64_t v13 = sub_1D930();
        (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v12, 0, 1, v13);
        uint64_t v14 = (void *)swift_task_alloc();
        v0[8] = v14;
        void *v14 = v0;
        v14[1] = sub_1A0F4;
        uint64_t v15 = v0[4];
        uint64_t v16 = v11;
LABEL_21:
        return sub_5E3C(v16, v15);
      }
    }
    else
    {
      if (qword_28FC8 != -1) {
        swift_once();
      }
      uint64_t v27 = sub_1DA30();
      sub_6FC0(v27, (uint64_t)qword_2BF10);
      uint64_t v28 = sub_1DA20();
      os_log_type_t v29 = sub_1DC30();
      if (os_log_type_enabled(v28, v29))
      {
        char v30 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)char v30 = 0;
        _os_log_impl(&dword_0, v28, v29, "ask user whether to resume game", v30, 2u);
        swift_slowDealloc();
      }
      uint64_t v31 = v0[3];

      uint64_t v32 = *(void *)(v31 + 16);
      uint64_t v33 = *(void *)(v31 + 24);
      long long v34 = *(_OWORD *)(v31 + 80);
      uint64_t v35 = *(void *)(v31 + 96);
      *(_OWORD *)(v31 + 16) = 0u;
      *(_OWORD *)(v31 + 32) = 0u;
      *(_OWORD *)(v31 + 48) = 0u;
      *(_OWORD *)(v31 + 64) = 0u;
      *(_OWORD *)(v31 + 80) = 0u;
      *(void *)(v31 + 96) = 0;
      uint64_t v50 = v35;
      long long v48 = v34;
      sub_1A76C(v32, v33);
      id v36 = sub_16BD4();
      v0[5] = v36;
      if (v36)
      {
        uint64_t v37 = (uint64_t)v36;
        uint64_t v38 = v0[4];
        objc_msgSend(v36, "setRefId:", 0, v48, v50);
        sub_1D920();
        sub_1D8E0();
        sub_1D8D0();
        uint64_t v39 = sub_1D930();
        (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v39 - 8) + 56))(v38, 0, 1, v39);
        char v40 = (void *)swift_task_alloc();
        v0[6] = v40;
        *char v40 = v0;
        v40[1] = sub_19F6C;
        uint64_t v15 = v0[4];
        uint64_t v16 = v37;
        goto LABEL_21;
      }
    }
    uint64_t v42 = sub_1DA20();
    os_log_type_t v43 = sub_1DC50();
    if (!os_log_type_enabled(v42, v43)) {
      goto LABEL_29;
    }
    uint64_t v44 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v44 = 0;
    id v45 = "no invalid addViews";
    goto LABEL_28;
  }
  if (qword_28FC8 != -1) {
    swift_once();
  }
  uint64_t v17 = sub_1DA30();
  sub_6FC0(v17, (uint64_t)qword_2BF10);
  BOOL v18 = sub_1DA20();
  os_log_type_t v19 = sub_1DC30();
  if (os_log_type_enabled(v18, v19))
  {
    uint64_t v20 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v20 = 0;
    _os_log_impl(&dword_0, v18, v19, "request to start a new game", v20, 2u);
    swift_slowDealloc();
  }
  uint64_t v21 = v0[3];

  uint64_t v22 = *(void *)(v21 + 16);
  uint64_t v23 = *(void *)(v21 + 24);
  *(_OWORD *)(v21 + 16) = 0u;
  *(_OWORD *)(v21 + 32) = 0u;
  *(_OWORD *)(v21 + 48) = 0u;
  *(_OWORD *)(v21 + 64) = 0u;
  *(_OWORD *)(v21 + 80) = 0u;
  *(void *)(v21 + 96) = 0;
  sub_1A76C(v22, v23);
  uint64_t v24 = *(void *)(v21 + 120);
  unint64_t v25 = *(void *)(v24 + 168);
  if (!v25)
  {
    uint64_t v42 = sub_1DA20();
    os_log_type_t v43 = sub_1DC50();
    if (!os_log_type_enabled(v42, v43))
    {
LABEL_29:

      goto LABEL_30;
    }
    uint64_t v44 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v44 = 0;
    id v45 = "no invalid machineUtterance from server";
LABEL_28:
    _os_log_impl(&dword_0, v42, v43, v45, v44, 2u);
    swift_slowDealloc();
    goto LABEL_29;
  }
  uint64_t v26 = *(void *)(v24 + 160);
  swift_bridgeObjectRetain();
  sub_6C5C(v26, v25);
  swift_bridgeObjectRelease();
LABEL_30:
  sub_1D8C0();
  swift_task_dealloc();
  os_log_t v46 = (uint64_t (*)(void))v0[1];
  return v46();
}

uint64_t sub_19F6C()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 32);
  swift_task_dealloc();
  sub_1A7DC(v1);
  return _swift_task_switch(sub_1A084, 0, 0);
}

uint64_t sub_1A084()
{
  uint64_t v1 = *(void **)(v0 + 40);
  sub_1D8C0();

  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_1A0F4()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 32);
  swift_task_dealloc();
  sub_1A7DC(v1);
  return _swift_task_switch(sub_1A20C, 0, 0);
}

uint64_t sub_1A20C()
{
  uint64_t v1 = *(void **)(v0 + 56);
  sub_1D8C0();

  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_1A27C(char a1)
{
  if (!a1) {
    return 0xD000000000000018;
  }
  if (a1 == 1) {
    return 0x6720656D75736572;
  }
  return 0xD000000000000013;
}

BOOL sub_1A2E0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

Swift::Int sub_1A2F4()
{
  Swift::UInt v1 = *v0;
  sub_1DF70();
  sub_1DF80(v1);
  return sub_1DF90();
}

void sub_1A33C()
{
  sub_1DF80(*v0);
}

Swift::Int sub_1A368()
{
  Swift::UInt v1 = *v0;
  sub_1DF70();
  sub_1DF80(v1);
  return sub_1DF90();
}

uint64_t sub_1A3AC()
{
  return sub_1A27C(*v0);
}

uint64_t sub_1A3B4()
{
  sub_1A76C(*(void *)(v0 + 16), *(void *)(v0 + 24));
  swift_release();
  swift_release();

  return _swift_deallocClassInstance(v0, 128, 7);
}

uint64_t type metadata accessor for EdutainmentGameFlow()
{
  return self;
}

unsigned char *storeEnumTagSinglePayload for EdutainmentGameFlow.State(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1A510);
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

ValueMetadata *type metadata accessor for EdutainmentGameFlow.State()
{
  return &type metadata for EdutainmentGameFlow.State;
}

unint64_t sub_1A54C()
{
  unint64_t result = qword_29BD0[0];
  if (!qword_29BD0[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_29BD0);
  }
  return result;
}

uint64_t sub_1A5A0()
{
  return 1;
}

uint64_t sub_1A5A8()
{
  return sub_1D800();
}

uint64_t sub_1A604(uint64_t a1)
{
  int v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *int v3 = v1;
  v3[1] = sub_A4C4;
  return sub_198A8(a1);
}

uint64_t sub_1A6A0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = *(void *)(*(void *)v1 + 16);
  uint64_t v3 = *(void *)(*(void *)v1 + 24);
  uint64_t v4 = *(void *)(*(void *)v1 + 32);
  uint64_t v5 = *(void *)(*(void *)v1 + 40);
  uint64_t v6 = *(void *)(*(void *)v1 + 48);
  uint64_t v7 = *(void *)(*(void *)v1 + 56);
  uint64_t v8 = *(void *)(*(void *)v1 + 64);
  uint64_t v9 = *(void *)(*(void *)v1 + 72);
  uint64_t v10 = *(void *)(*(void *)v1 + 80);
  uint64_t v11 = *(void *)(*(void *)v1 + 88);
  uint64_t v12 = *(void *)(*(void *)v1 + 96);
  *a1 = v2;
  a1[1] = v3;
  a1[2] = v4;
  a1[3] = v5;
  a1[4] = v6;
  a1[5] = v7;
  a1[6] = v8;
  a1[7] = v9;
  a1[8] = v10;
  a1[9] = v11;
  a1[10] = v12;
  return sub_1A6FC(v2, v3);
}

uint64_t sub_1A6FC(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_1A76C(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_1A7DC(uint64_t a1)
{
  uint64_t v2 = sub_6FF8(&qword_294E0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1A83C(uint64_t a1, uint64_t a2)
{
  type metadata accessor for EdutainmentGameFlow();
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = 0u;
  *(_OWORD *)(v4 + 32) = 0u;
  *(_OWORD *)(v4 + 48) = 0u;
  *(_OWORD *)(v4 + 64) = 0u;
  *(_OWORD *)(v4 + 80) = 0u;
  *(void *)(v4 + 120) = a1;
  *(void *)(v4 + 96) = 0;
  *(void *)(v4 + 104) = a2;
  switch(*(unsigned char *)(a1 + 90))
  {
    case 3:
      swift_bridgeObjectRelease();
      goto LABEL_4;
    case 5:
      goto LABEL_5;
    default:
      char v5 = sub_1DF50();
      swift_bridgeObjectRelease();
      if (v5) {
LABEL_4:
      }
        char v6 = 2;
      else {
LABEL_5:
      }
        char v6 = 1;
      *(unsigned char *)(v4 + 112) = v6;
      return v4;
  }
}

uint64_t sub_1A978()
{
  type metadata accessor for EdutainmentStoreManager();
  swift_allocObject();
  uint64_t result = sub_1A9B4();
  qword_2BF28 = result;
  return result;
}

uint64_t sub_1A9B4()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_1DC80();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  char v5 = (char *)v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1DC70();
  __chkstk_darwin(v6);
  uint64_t v7 = sub_1DA70();
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_28FC8 != -1) {
    swift_once();
  }
  uint64_t v10 = sub_1DA30();
  sub_6FC0(v10, (uint64_t)qword_2BF10);
  uint64_t v11 = sub_1DA20();
  os_log_type_t v12 = sub_1DC30();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v13 = 0;
    _os_log_impl(&dword_0, v11, v12, "init StoreManager", v13, 2u);
    swift_slowDealloc();
  }

  if (qword_28FA8 != -1) {
    swift_once();
  }
  if (qword_2BEE0)
  {
    *(void *)(v1 + 16) = qword_2BEE0;
    v17[2] = sub_1C00C();
    swift_retain_n();
    sub_1DA60();
    v17[3] = &_swiftEmptyArrayStorage;
    sub_1C04C(&qword_29CD8, (void (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes);
    uint64_t v14 = v1;
    v17[1] = v9;
    sub_6FF8(&qword_29CE0);
    sub_1C094(&qword_29CE8, &qword_29CE0);
    sub_1DD30();
    (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:), v2);
    uint64_t v15 = sub_1DCA0();
    swift_release();
    *(void *)(v1 + 24) = v15;
  }
  else
  {
    type metadata accessor for EdutainmentStoreManager();
    swift_deallocPartialClassInstance();
    return 0;
  }
  return v14;
}

uint64_t sub_1AD34(void *a1, uint64_t a2)
{
  uint64_t v3 = sub_703C(a1, a1[3]);
  uint64_t v4 = *(void *)(a2 + 16);
  if (*(unsigned char *)(*v3 + 24) == 1 && (sub_14EFC(v4) & 1) == 0) {
    return sub_148C8(v4);
  }
  else {
    return sub_14644();
  }
}

uint64_t sub_1AD90(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

uint64_t sub_1ADD4(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6 = v5;
  int v23 = a3;
  uint64_t v22 = a2;
  uint64_t v10 = *v6;
  uint64_t v11 = sub_1DA50();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)&v22 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = sub_1DA70();
  uint64_t v15 = *(void *)(v25 - 8);
  __chkstk_darwin(v25);
  uint64_t v17 = (char *)&v22 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = v6[3];
  sub_1B72C(a1, (uint64_t)v28);
  uint64_t v18 = swift_allocObject();
  sub_1B7E4((uint64_t)v28, v18 + 16);
  *(void *)(v18 + 56) = v6;
  *(void *)(v18 + 64) = a4;
  uint64_t v19 = v22;
  *(void *)(v18 + 72) = a5;
  *(void *)(v18 + 80) = v19;
  *(unsigned char *)(v18 + 88) = v23 & 1;
  *(void *)(v18 + 96) = v10;
  aBlock[4] = sub_1B84C;
  aBlock[5] = v18;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1AD90;
  aBlock[3] = &unk_25AF0;
  uint64_t v20 = _Block_copy(aBlock);
  swift_retain();
  swift_retain();
  sub_1DA60();
  uint64_t v26 = &_swiftEmptyArrayStorage;
  sub_1C04C(&qword_29680, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_6FF8(&qword_29688);
  sub_1C094((unint64_t *)&qword_29690, &qword_29688);
  sub_1DD30();
  sub_1DC90();
  _Block_release(v20);
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v25);
  return swift_release();
}

uint64_t sub_1B0F8(uint64_t a1, uint64_t a2, void (*a3)(void), uint64_t a4, uint64_t a5, int a6)
{
  int v46 = a6;
  uint64_t v47 = a5;
  uint64_t v49 = a4;
  uint64_t v9 = sub_1DA30();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v43 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_28FC0 != -1) {
    swift_once();
  }
  uint64_t v13 = sub_6FC0(v9, (uint64_t)qword_2BEF8);
  uint64_t v14 = *(void (**)(char *))(v10 + 16);
  uint64_t v48 = v13;
  v14(v12);
  sub_1B72C(a1, (uint64_t)v54);
  uint64_t v15 = sub_1DA20();
  os_log_type_t v16 = sub_1DC40();
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v43 = a2;
    uint64_t v44 = a1;
    id v45 = a3;
    uint64_t v17 = (uint8_t *)swift_slowAlloc();
    uint64_t v53 = swift_slowAlloc();
    *(_DWORD *)uint64_t v17 = 136315138;
    sub_1B72C((uint64_t)v54, (uint64_t)v50);
    uint64_t v18 = v51;
    if (v51)
    {
      uint64_t v19 = v52;
      sub_703C(v50, v51);
      uint64_t v20 = (*(uint64_t (**)(uint64_t, uint64_t))(v19 + 8))(v18, v19);
      unint64_t v22 = v21;
      sub_7080((uint64_t)v50);
    }
    else
    {
      sub_A668((uint64_t)v50);
      unint64_t v22 = 0xE300000000000000;
      uint64_t v20 = 7104878;
    }
    v50[0] = sub_1B87C(v20, v22, &v53);
    sub_1DD00();
    swift_bridgeObjectRelease();
    sub_A668((uint64_t)v54);
    _os_log_impl(&dword_0, v15, v16, "read record for game= %s", v17, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
    a1 = v44;
    a3 = v45;
    a2 = v43;
  }
  else
  {
    sub_A668((uint64_t)v54);

    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  }
  uint64_t v23 = *(void *)(a2 + 16);
  sub_1B72C(a1, (uint64_t)v54);
  uint64_t v24 = v55;
  if (v55)
  {
    uint64_t v25 = v56;
    sub_703C(v54, (uint64_t)v55);
    uint64_t v26 = (*(uint64_t (**)(void *, uint64_t))(v25 + 8))(v24, v25);
    uint64_t v24 = v27;
    sub_7080((uint64_t)v54);
  }
  else
  {
    sub_A668((uint64_t)v54);
    uint64_t v26 = 0;
  }
  sub_1B72C(a1, (uint64_t)v54);
  uint64_t v28 = (uint64_t)v55;
  if (v55)
  {
    uint64_t v29 = v56;
    sub_703C(v54, (uint64_t)v55);
    uint64_t v28 = (*(uint64_t (**)(uint64_t, uint64_t))(v29 + 16))(v28, v29);
    unint64_t v31 = v30;
    sub_7080((uint64_t)v54);
  }
  else
  {
    sub_A668((uint64_t)v54);
    unint64_t v31 = 0;
  }
  uint64_t v32 = sub_15434(v23, v26, v24, v28, v31);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v32)
  {
    if (*(unsigned char *)(v32 + 152))
    {
      uint64_t v33 = sub_1DA20();
      os_log_type_t v34 = sub_1DC50();
      if (os_log_type_enabled(v33, v34))
      {
        uint64_t v35 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v35 = 0;
        id v36 = "Empty timestamp of game state.";
LABEL_28:
        _os_log_impl(&dword_0, v33, v34, v36, v35, 2u);
        swift_slowDealloc();
        goto LABEL_29;
      }
      goto LABEL_29;
    }
    if (v46) {
      uint64_t v41 = 86400;
    }
    else {
      uint64_t v41 = v47;
    }
    if (sub_1BED4(*(void *)(v32 + 144), v41))
    {
      uint64_t v33 = sub_1DA20();
      os_log_type_t v34 = sub_1DC30();
      if (os_log_type_enabled(v33, v34))
      {
        uint64_t v35 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v35 = 0;
        id v36 = "Drop game state because it's expired";
        goto LABEL_28;
      }
LABEL_29:

      a3(0);
      return swift_release();
    }
    uint64_t v42 = swift_retain();
    a3(v42);
    return swift_release_n();
  }
  else
  {
    uint64_t v37 = sub_1DA20();
    os_log_type_t v38 = sub_1DC30();
    if (os_log_type_enabled(v37, v38))
    {
      uint64_t v39 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v39 = 0;
      _os_log_impl(&dword_0, v37, v38, "Didn't find any record from database.", v39, 2u);
      swift_slowDealloc();
    }

    return ((uint64_t (*)(void))a3)(0);
  }
}

uint64_t sub_1B690(void *a1, uint64_t a2)
{
  return sub_14B8C(*(void *)(a2 + 16));
}

uint64_t sub_1B6C8()
{
  swift_release();

  return _swift_deallocClassInstance(v0, 32, 7);
}

uint64_t type metadata accessor for EdutainmentStoreManager()
{
  return self;
}

uint64_t sub_1B72C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_6FF8(&qword_29670);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1B794()
{
  if (*(void *)(v0 + 40)) {
    sub_7080(v0 + 16);
  }
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 104, 7);
}

uint64_t sub_1B7E4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_6FF8(&qword_29670);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1B84C()
{
  return sub_1B0F8(v0 + 16, *(void *)(v0 + 56), *(void (**)(void))(v0 + 64), *(void *)(v0 + 72), *(void *)(v0 + 80), *(unsigned __int8 *)(v0 + 88));
}

uint64_t sub_1B864(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_1B874()
{
  return swift_release();
}

uint64_t sub_1B87C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_1B950(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_1050C((uint64_t)v12, *a3);
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
      sub_1050C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_7080((uint64_t)v12);
  return v7;
}

uint64_t sub_1B950(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_1DD10();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_1BB0C(a5, a6);
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
  uint64_t v8 = sub_1DD80();
  if (!v8)
  {
    sub_1DDE0();
    __break(1u);
LABEL_17:
    uint64_t result = sub_1DE30();
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

uint64_t sub_1BB0C(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_1BBA4(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_1BD84(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_1BD84(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_1BBA4(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_1BD1C(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_1DD60();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_1DDE0();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_1DB90();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_1DE30();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_1DDE0();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_1BD1C(uint64_t a1, uint64_t a2)
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
  sub_6FF8(&qword_29CC8);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_1BD84(char a1, int64_t a2, char a3, char *a4)
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
    sub_6FF8(&qword_29CC8);
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
  uint64_t result = sub_1DE30();
  __break(1u);
  return result;
}

uint64_t sub_1BED4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1D7B0();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  int64_t v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1D7A0();
  sub_1D790();
  double v9 = v8;
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  if ((~*(void *)&v9 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_7;
  }
  if (v9 <= -9.22337204e18)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  if (v9 >= 9.22337204e18)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  if (!__OFSUB__((uint64_t)v9, a1)) {
    return (uint64_t)v9 - a1 > a2;
  }
LABEL_9:
  __break(1u);
  return result;
}

unint64_t sub_1C00C()
{
  unint64_t result = qword_29CD0;
  if (!qword_29CD0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_29CD0);
  }
  return result;
}

uint64_t sub_1C04C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1C094(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_A810(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_1C0E4(char a1)
{
  unint64_t result = 0xD000000000000013;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x79726F6765746163;
      break;
    case 2:
      unint64_t result = 0x6C6576656CLL;
      break;
    case 3:
      unint64_t result = 0x6174537472617473;
      break;
    case 4:
      unint64_t result = 0x65726F6373;
      break;
    case 5:
      return result;
    case 6:
      unint64_t result = 0x656C706D6F437369;
      break;
    case 7:
      unint64_t result = 0x5464657461657263;
      break;
    case 8:
      unint64_t result = 0x6E6F697461727564;
      break;
    default:
      unint64_t result = 1701667182;
      break;
  }
  return result;
}

unint64_t sub_1C20C(char a1)
{
  unint64_t result = 0xD000000000000013;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x79726F6765746163;
      break;
    case 2:
      unint64_t result = 0x6C6576656CLL;
      break;
    case 3:
      unint64_t result = 0x6174537472617473;
      break;
    case 4:
      unint64_t result = 0x65726F6373;
      break;
    case 5:
      return result;
    case 6:
      unint64_t result = 0x656C706D6F437369;
      break;
    case 7:
      unint64_t result = 0x5464657461657263;
      break;
    case 8:
      unint64_t result = 0x6E6F697461727564;
      break;
    default:
      unint64_t result = 1701667182;
      break;
  }
  return result;
}

uint64_t sub_1C334(void *a1)
{
  uint64_t v3 = sub_6FF8(&qword_29D00);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = &v8[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_703C(a1, a1[3]);
  sub_1CE50();
  sub_1DFB0();
  v8[15] = 0;
  sub_1DF10();
  if (!v1)
  {
    v8[14] = 1;
    sub_1DF10();
    v8[13] = 2;
    sub_1DF10();
    v8[12] = 3;
    sub_1DED0();
    v8[11] = 4;
    sub_1DEF0();
    v8[10] = 5;
    sub_1DEF0();
    v8[9] = 6;
    sub_1DEE0();
    v8[8] = 7;
    sub_1DEF0();
    v8[7] = 8;
    sub_1DEF0();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t sub_1C5BC(unsigned __int8 *a1, char *a2)
{
  return sub_11034(*a1, *a2);
}

Swift::Int sub_1C5C8()
{
  return sub_1DF90();
}

uint64_t sub_1C610()
{
  return sub_11AA4();
}

Swift::Int sub_1C618()
{
  return sub_1DF90();
}

uint64_t sub_1C65C@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_1C7D4(*(void *)a1, *(void **)(a1 + 8));
  *a2 = result;
  return result;
}

unint64_t sub_1C68C@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_1C0E4(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

unint64_t sub_1C6B8()
{
  return sub_1C20C(*v0);
}

uint64_t sub_1C6C0@<X0>(uint64_t a1@<X0>, void *a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1C7D4(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1C6E8(uint64_t a1)
{
  unint64_t v2 = sub_1CE50();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1C724(uint64_t a1)
{
  unint64_t v2 = sub_1CE50();

  return CodingKey.debugDescription.getter(a1, v2);
}

__n128 sub_1C760@<Q0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  sub_1C820(a1, v8);
  if (!v2)
  {
    long long v5 = v9[0];
    *(_OWORD *)(a2 + 96) = v8[6];
    *(_OWORD *)(a2 + 112) = v5;
    *(_OWORD *)(a2 + 121) = *(_OWORD *)((char *)v9 + 9);
    long long v6 = v8[3];
    *(_OWORD *)(a2 + 32) = v8[2];
    *(_OWORD *)(a2 + 48) = v6;
    long long v7 = v8[5];
    *(_OWORD *)(a2 + 64) = v8[4];
    *(_OWORD *)(a2 + 80) = v7;
    __n128 result = (__n128)v8[1];
    *(_OWORD *)a2 = v8[0];
    *(__n128 *)(a2 + 16) = result;
  }
  return result;
}

uint64_t sub_1C7BC(void *a1)
{
  return sub_1C334(a1);
}

uint64_t sub_1C7D4(uint64_t a1, void *a2)
{
  v6._countAndFlagsBits = a1;
  v3._rawValue = &off_250F8;
  v6._object = a2;
  unint64_t v4 = sub_1DE50(v3, v6);
  swift_bridgeObjectRelease();
  if (v4 >= 9) {
    return 9;
  }
  else {
    return v4;
  }
}

uint64_t sub_1C820@<X0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  id v54 = a2;
  uint64_t v98 = sub_6FF8(&qword_29CF0);
  uint64_t v4 = *(void *)(v98 - 8);
  __chkstk_darwin(v98);
  Swift::String v6 = (char *)&v38 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v97 = 1;
  char v95 = 1;
  char v93 = 1;
  char v90 = 1;
  char v88 = 1;
  sub_703C(a1, a1[3]);
  sub_1CE50();
  sub_1DFA0();
  if (v2)
  {
    sub_7080((uint64_t)a1);
    return swift_bridgeObjectRelease();
  }
  else
  {
    long long v7 = a1;
    uint64_t v8 = v4;
    LOBYTE(v63) = 0;
    uint64_t v9 = v98;
    uint64_t v10 = v6;
    uint64_t v11 = sub_1DEA0();
    uint64_t v13 = v12;
    LOBYTE(v63) = 1;
    swift_bridgeObjectRetain();
    uint64_t v14 = sub_1DEA0();
    uint64_t v53 = v15;
    uint64_t v50 = v14;
    LOBYTE(v63) = 2;
    swift_bridgeObjectRetain();
    uint64_t v52 = 0;
    uint64_t v48 = sub_1DEA0();
    uint64_t v49 = (uint64_t)v7;
    LOBYTE(v63) = 3;
    uint64_t v17 = v16;
    swift_bridgeObjectRetain();
    uint64_t v18 = sub_1DE60();
    uint64_t v51 = v17;
    uint64_t v20 = v19;
    uint64_t v47 = v18;
    LOBYTE(v63) = 4;
    swift_bridgeObjectRetain();
    uint64_t v46 = sub_1DE80();
    char v95 = v21 & 1;
    LOBYTE(v63) = 5;
    int v45 = v21;
    uint64_t v22 = sub_1DE80();
    uint64_t v23 = v49;
    uint64_t v44 = v22;
    char v93 = v24 & 1;
    LOBYTE(v63) = 6;
    int v43 = v24;
    int v42 = sub_1DE70();
    LOBYTE(v63) = 7;
    uint64_t v41 = sub_1DE80();
    uint64_t v39 = v11;
    HIDWORD(v38) = v25 & 1;
    char v90 = v25 & 1;
    char v87 = 8;
    uint64_t v40 = sub_1DE80();
    LOBYTE(v11) = v26;
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v9);
    char v27 = v11 & 1;
    char v88 = v11 & 1;
    *(void *)&long long v55 = 0;
    BYTE8(v55) = 1;
    uint64_t v28 = v39;
    *(void *)&long long v56 = v39;
    *((void *)&v56 + 1) = v13;
    uint64_t v30 = v50;
    uint64_t v29 = v51;
    uint64_t v31 = v53;
    *(void *)&long long v57 = v50;
    *((void *)&v57 + 1) = v53;
    *(void *)&long long v58 = v48;
    *((void *)&v58 + 1) = v51;
    *(void *)&long long v59 = v47;
    *((void *)&v59 + 1) = v20;
    *(void *)&long long v60 = v46;
    BYTE8(v60) = v45 & 1;
    *(void *)&long long v61 = v44;
    BYTE8(v61) = v43 & 1;
    BYTE9(v61) = v42;
    *(void *)&v62[0] = v41;
    BYTE8(v62[0]) = BYTE4(v38);
    *(void *)&v62[1] = v40;
    BYTE8(v62[1]) = v27;
    sub_1CEA4((uint64_t)&v55);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_7080(v23);
    uint64_t v63 = 0;
    char v64 = v97;
    *(_DWORD *)long long v65 = *(_DWORD *)v96;
    *(_DWORD *)&v65[3] = *(_DWORD *)&v96[3];
    uint64_t v66 = v28;
    uint64_t v67 = v13;
    uint64_t v68 = v30;
    uint64_t v69 = v31;
    uint64_t v70 = v48;
    uint64_t v71 = v29;
    uint64_t v72 = v47;
    uint64_t v73 = v20;
    uint64_t v74 = v46;
    char v75 = v95;
    *(_DWORD *)&v76[3] = *(_DWORD *)&v94[3];
    *(_DWORD *)long long v76 = *(_DWORD *)v94;
    uint64_t v77 = v44;
    char v78 = v93;
    char v79 = v42;
    int v80 = v91;
    __int16 v81 = v92;
    uint64_t v82 = v41;
    char v83 = v90;
    *(_DWORD *)id v84 = *(_DWORD *)v89;
    *(_DWORD *)&v84[3] = *(_DWORD *)&v89[3];
    uint64_t v85 = v40;
    char v86 = v88;
    uint64_t result = sub_1CEFC((uint64_t)&v63);
    long long v33 = v62[0];
    os_log_type_t v34 = v54;
    v54[6] = v61;
    v34[7] = v33;
    *(_OWORD *)((char *)v34 + 121) = *(_OWORD *)((char *)v62 + 9);
    long long v35 = v58;
    v34[2] = v57;
    v34[3] = v35;
    long long v36 = v60;
    v34[4] = v59;
    v34[5] = v36;
    long long v37 = v56;
    *os_log_type_t v34 = v55;
    v34[1] = v37;
  }
  return result;
}

unint64_t sub_1CE50()
{
  unint64_t result = qword_29CF8;
  if (!qword_29CF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_29CF8);
  }
  return result;
}

uint64_t sub_1CEA4(uint64_t a1)
{
  return a1;
}

uint64_t sub_1CEFC(uint64_t a1)
{
  return a1;
}

unsigned char *storeEnumTagSinglePayload for GameHistory.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 8 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 8) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF8) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF7)
  {
    unsigned int v6 = ((a2 - 248) >> 8) + 1;
    *unint64_t result = a2 + 8;
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
        JUMPOUT(0x1D020);
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
          *unint64_t result = a2 + 8;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for GameHistory.CodingKeys()
{
  return &type metadata for GameHistory.CodingKeys;
}

uint64_t destroy for GameHistory()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for GameHistory(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  uint64_t v3 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v3;
  uint64_t v4 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v4;
  uint64_t v5 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v5;
  uint64_t v6 = *(void *)(a2 + 72);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = v6;
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(unsigned char *)(a1 + 88) = *(unsigned char *)(a2 + 88);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(_WORD *)(a1 + 104) = *(_WORD *)(a2 + 104);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  *(unsigned char *)(a1 + 120) = *(unsigned char *)(a2 + 120);
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  *(unsigned char *)(a1 + 136) = *(unsigned char *)(a2 + 136);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for GameHistory(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  *(unsigned char *)(a1 + 8) = *((unsigned char *)a2 + 8);
  *(void *)a1 = v4;
  *(void *)(a1 + 16) = a2[2];
  *(void *)(a1 + 24) = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = a2[4];
  *(void *)(a1 + 40) = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 48) = a2[6];
  *(void *)(a1 + 56) = a2[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 64) = a2[8];
  *(void *)(a1 + 72) = a2[9];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v5 = a2[10];
  *(unsigned char *)(a1 + 88) = *((unsigned char *)a2 + 88);
  *(void *)(a1 + 80) = v5;
  uint64_t v6 = a2[12];
  *(unsigned char *)(a1 + 104) = *((unsigned char *)a2 + 104);
  *(void *)(a1 + 96) = v6;
  *(unsigned char *)(a1 + 105) = *((unsigned char *)a2 + 105);
  uint64_t v7 = a2[14];
  *(unsigned char *)(a1 + 120) = *((unsigned char *)a2 + 120);
  *(void *)(a1 + 112) = v7;
  uint64_t v8 = a2[16];
  *(unsigned char *)(a1 + 136) = *((unsigned char *)a2 + 136);
  *(void *)(a1 + 128) = v8;
  return a1;
}

__n128 initializeWithTake for GameHistory(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  long long v2 = *(_OWORD *)(a2 + 16);
  long long v3 = *(_OWORD *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v4;
  *(_OWORD *)(a1 + 16) = v2;
  *(_OWORD *)(a1 + 32) = v3;
  __n128 result = *(__n128 *)(a2 + 80);
  long long v6 = *(_OWORD *)(a2 + 96);
  long long v7 = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 121) = *(_OWORD *)(a2 + 121);
  *(_OWORD *)(a1 + 96) = v6;
  *(_OWORD *)(a1 + 112) = v7;
  *(__n128 *)(a1 + 80) = result;
  return result;
}

uint64_t assignWithTake for GameHistory(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(a2 + 72);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = v7;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(unsigned char *)(a1 + 88) = *(unsigned char *)(a2 + 88);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(_WORD *)(a1 + 104) = *(_WORD *)(a2 + 104);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  *(unsigned char *)(a1 + 120) = *(unsigned char *)(a2 + 120);
  *(unsigned char *)(a1 + 136) = *(unsigned char *)(a2 + 136);
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  return a1;
}

uint64_t getEnumTagSinglePayload for GameHistory(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 137)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for GameHistory(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 136) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 137) = 1;
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
    *(unsigned char *)(result + 137) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for GameHistory()
{
  return &type metadata for GameHistory;
}

unint64_t sub_1D410()
{
  unint64_t result = qword_29D08;
  if (!qword_29D08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_29D08);
  }
  return result;
}

unint64_t sub_1D468()
{
  unint64_t result = qword_29D10;
  if (!qword_29D10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_29D10);
  }
  return result;
}

unint64_t sub_1D4C0()
{
  unint64_t result = qword_29D18;
  if (!qword_29D18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_29D18);
  }
  return result;
}

uint64_t sub_1D514()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for EdutainmentFlowPlugin()
{
  return self;
}

uint64_t sub_1D548@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for EdutainmentFlowPlugin();
  uint64_t result = swift_allocObject();
  *a1 = result;
  return result;
}

uint64_t sub_1D590()
{
  sub_1D9D0();
  sub_1D9D0();
  sub_1D960();
  type metadata accessor for EdutainmentOutput();
  uint64_t v0 = swift_allocObject();
  sub_A778(&v5, v0 + 16);
  sub_A778(&v4, v0 + 56);
  type metadata accessor for EdutainmentDispatchFlow();
  uint64_t v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = 0u;
  *(_OWORD *)(v1 + 32) = 0u;
  *(_OWORD *)(v1 + 48) = 0u;
  *(_OWORD *)(v1 + 64) = 0u;
  *(void *)(v1 + 80) = 0;
  sub_A778(&v6, v1 + 96);
  *(void *)(v1 + 88) = v0;
  *(void *)&long long v6 = v1;
  sub_1D668();
  uint64_t v2 = sub_1D7F0();
  swift_release();
  return v2;
}

unint64_t sub_1D668()
{
  unint64_t result = qword_29DC0;
  if (!qword_29DC0)
  {
    type metadata accessor for EdutainmentDispatchFlow();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_29DC0);
  }
  return result;
}

uint64_t sub_1D6C0()
{
  return dispatch thunk of JSONDecoder.decode<A>(_:from:)();
}

uint64_t sub_1D6D0()
{
  return JSONDecoder.init()();
}

uint64_t sub_1D6E0()
{
  return type metadata accessor for JSONDecoder();
}

uint64_t sub_1D6F0()
{
  return dispatch thunk of JSONEncoder.encode<A>(_:)();
}

uint64_t sub_1D700()
{
  return JSONEncoder.init()();
}

uint64_t sub_1D710()
{
  return type metadata accessor for JSONEncoder();
}

uint64_t sub_1D720()
{
  return _convertNSErrorToError(_:)();
}

void sub_1D730(NSURL *retstr@<X8>)
{
}

uint64_t sub_1D740()
{
  return URL.appendingPathComponent(_:)();
}

uint64_t sub_1D750()
{
  return URL.path.getter();
}

uint64_t sub_1D760()
{
  return type metadata accessor for URL();
}

uint64_t sub_1D770()
{
  return Data.init(base64Encoded:options:)();
}

NSData sub_1D780()
{
  return Data._bridgeToObjectiveC()();
}

uint64_t sub_1D790()
{
  return Date.timeIntervalSince1970.getter();
}

uint64_t sub_1D7A0()
{
  return Date.init()();
}

uint64_t sub_1D7B0()
{
  return type metadata accessor for Date();
}

uint64_t sub_1D7C0()
{
  return UUID.uuidString.getter();
}

uint64_t sub_1D7D0()
{
  return UUID.init()();
}

uint64_t sub_1D7E0()
{
  return type metadata accessor for UUID();
}

uint64_t sub_1D7F0()
{
  return Flow.eraseToAnyFlow()();
}

uint64_t sub_1D800()
{
  return Flow.deferToExecuteAsync(_:)();
}

uint64_t sub_1D810()
{
  return Flow.flexibleExecutionSupport.getter();
}

uint64_t sub_1D830()
{
  return FlowPlugin.findFlowFor(parse:)();
}

uint64_t sub_1D840()
{
  return FlowPlugin.makeFlowFrame(parse:)();
}

void sub_1D850(Swift::String refId)
{
}

void sub_1D860()
{
}

uint64_t sub_1D870()
{
  return static AceService.currentAsync.getter();
}

uint64_t sub_1D880()
{
  return dispatch thunk of DeviceState.isLockedWithPasscode.getter();
}

uint64_t sub_1D890()
{
  return static AceOutputHelper.makeAceOutput(allAddViews:nlContextUpdate:additionalCommands:flowActivity:)();
}

uint64_t sub_1D8A0()
{
  return static ExecuteResponse.ongoing(requireInput:)();
}

uint64_t sub_1D8B0()
{
  return static ExecuteResponse.ongoing<A>(next:childCompletion:)();
}

uint64_t sub_1D8C0()
{
  return static ExecuteResponse.complete()();
}

uint64_t sub_1D8D0()
{
  return NLContextUpdate.weightedPromptStrict.setter();
}

uint64_t sub_1D8E0()
{
  return NLContextUpdate.weightedPromptTargetDomain.setter();
}

uint64_t sub_1D8F0()
{
  return NLContextUpdate.conversationStateAttachments.setter();
}

uint64_t sub_1D900()
{
  return NLContextUpdate.weightedPromptResponseOptions.setter();
}

uint64_t sub_1D910()
{
  return NLContextUpdate.weightedPromptResponseTargets.setter();
}

uint64_t sub_1D920()
{
  return NLContextUpdate.init()();
}

uint64_t sub_1D930()
{
  return type metadata accessor for NLContextUpdate();
}

uint64_t sub_1D950()
{
  return AceServiceInvokerAsync.submitAndForget(_:)();
}

uint64_t sub_1D960()
{
  return static OutputPublisherFactory.makeOutputPublisherAsync()();
}

uint64_t sub_1D970()
{
  return Input.description.getter();
}

uint64_t sub_1D980()
{
  return Input.parse.getter();
}

uint64_t sub_1D990()
{
  return type metadata accessor for Input();
}

uint64_t sub_1D9A0()
{
  return Parse.DirectInvocation.userData.getter();
}

uint64_t sub_1D9B0()
{
  return type metadata accessor for Parse.DirectInvocation();
}

uint64_t sub_1D9C0()
{
  return type metadata accessor for Parse();
}

uint64_t sub_1D9D0()
{
  return static Device.current.getter();
}

uint64_t sub_1D9E0()
{
  return type metadata accessor for AceOutput();
}

uint64_t sub_1D9F0()
{
  return os_signpost(_:dso:log:name:signpostID:)();
}

uint64_t sub_1DA00()
{
  return static OSSignpostID.exclusive.getter();
}

uint64_t sub_1DA10()
{
  return type metadata accessor for OSSignpostID();
}

uint64_t sub_1DA20()
{
  return Logger.logObject.getter();
}

uint64_t sub_1DA30()
{
  return type metadata accessor for Logger();
}

uint64_t sub_1DA40()
{
  return Logger.init(_:)();
}

uint64_t sub_1DA50()
{
  return type metadata accessor for DispatchWorkItemFlags();
}

uint64_t sub_1DA60()
{
  return static DispatchQoS.unspecified.getter();
}

uint64_t sub_1DA70()
{
  return type metadata accessor for DispatchQoS();
}

NSDictionary sub_1DA80()
{
  return Dictionary._bridgeToObjectiveC()();
}

uint64_t sub_1DA90()
{
  return Dictionary.description.getter();
}

NSString sub_1DAA0()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_1DAB0()
{
  return static String._forceBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_1DAC0()
{
  return static String._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_1DAD0()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_1DAE0()
{
  return String.data(using:allowLossyConversion:)();
}

uint64_t sub_1DAF0()
{
  return String.init(data:encoding:)();
}

uint64_t sub_1DB00()
{
  return String.init(format:_:)();
}

uint64_t sub_1DB10()
{
  return static String.Encoding.utf8.getter();
}

uint64_t sub_1DB20()
{
  return type metadata accessor for String.Encoding();
}

uint64_t sub_1DB30()
{
  return String.init<A>(describing:)();
}

uint64_t sub_1DB40()
{
  return String.utf8CString.getter();
}

uint64_t sub_1DB50()
{
  return String.hash(into:)();
}

void sub_1DB60(Swift::String a1)
{
}

uint64_t sub_1DB70()
{
  return String.init(cString:)();
}

uint64_t sub_1DB80()
{
  return String.init(cString:)();
}

Swift::Int sub_1DB90()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_1DBA0()
{
  return RawRepresentable<>.encode(to:)();
}

uint64_t sub_1DBB0()
{
  return RawRepresentable<>.init(from:)();
}

uint64_t sub_1DBC0()
{
  return specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
}

NSArray sub_1DBD0()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_1DBE0()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_1DBF0()
{
  return Array.description.getter();
}

uint64_t sub_1DC00()
{
  return specialized Array._endMutation()();
}

uint64_t sub_1DC10()
{
  return specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_1DC20()
{
  return specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_1DC30()
{
  return static os_log_type_t.info.getter();
}

uint64_t sub_1DC40()
{
  return static os_log_type_t.debug.getter();
}

uint64_t sub_1DC50()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_1DC60()
{
  return static os_log_type_t.fault.getter();
}

uint64_t sub_1DC70()
{
  return type metadata accessor for OS_dispatch_queue.Attributes();
}

uint64_t sub_1DC80()
{
  return type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
}

uint64_t sub_1DC90()
{
  return OS_dispatch_queue.async(group:qos:flags:execute:)();
}

uint64_t sub_1DCA0()
{
  return OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
}

uint64_t sub_1DCB0()
{
  return static os_signpost_type_t.end.getter();
}

uint64_t sub_1DCC0()
{
  return static os_signpost_type_t.begin.getter();
}

NSNumber sub_1DCD0(Swift::Bool BOOLeanLiteral)
{
  return NSNumber.init(BOOLeanLiteral:)(BOOLeanLiteral);
}

uint64_t sub_1DCE0()
{
  return OS_os_log.init(subsystem:category:)();
}

uint64_t sub_1DCF0()
{
  return Optional.debugDescription.getter();
}

uint64_t sub_1DD00()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_1DD10()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_1DD20()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t sub_1DD30()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

Swift::Int sub_1DD40(Swift::Int seed)
{
  return AnyHashable._rawHashValue(seed:)(seed);
}

void sub_1DD50(Swift::Int a1)
{
}

uint64_t sub_1DD60()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_1DD70()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_1DD80()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_1DD90()
{
  return specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
}

uint64_t sub_1DDA0()
{
  return specialized ContiguousArray._endMutation()();
}

uint64_t sub_1DDB0()
{
  return specialized ContiguousArray.reserveCapacity(_:)();
}

uint64_t sub_1DDC0()
{
  return specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
}

uint64_t sub_1DDD0()
{
  return specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_1DDE0()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_1DDF0()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_1DE00()
{
  return static _DictionaryStorage.copy(original:)();
}

uint64_t sub_1DE10()
{
  return static _DictionaryStorage.resize(original:capacity:move:)();
}

uint64_t sub_1DE20()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_1DE30()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

Swift::Int sub_1DE50(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases, string);
}

uint64_t sub_1DE60()
{
  return KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
}

uint64_t sub_1DE70()
{
  return KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
}

uint64_t sub_1DE80()
{
  return KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
}

uint64_t sub_1DE90()
{
  return KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)();
}

uint64_t sub_1DEA0()
{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

uint64_t sub_1DEB0()
{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

uint64_t sub_1DEC0()
{
  return KeyedDecodingContainer.decode<A>(_:forKey:)();
}

uint64_t sub_1DED0()
{
  return KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
}

uint64_t sub_1DEE0()
{
  return KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
}

uint64_t sub_1DEF0()
{
  return KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
}

uint64_t sub_1DF00()
{
  return KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)();
}

uint64_t sub_1DF10()
{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

uint64_t sub_1DF20()
{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

uint64_t sub_1DF30()
{
  return KeyedEncodingContainer.encode<A>(_:forKey:)();
}

uint64_t sub_1DF40()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t sub_1DF50()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_1DF60()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_1DF70()
{
  return Hasher.init(_seed:)();
}

void sub_1DF80(Swift::UInt a1)
{
}

Swift::Int sub_1DF90()
{
  return Hasher._finalize()();
}

uint64_t sub_1DFA0()
{
  return dispatch thunk of Decoder.container<A>(keyedBy:)();
}

uint64_t sub_1DFB0()
{
  return dispatch thunk of Encoder.container<A>(keyedBy:)();
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

void bzero(void *a1, size_t a2)
{
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

int sqlite3_close(sqlite3 *a1)
{
  return _sqlite3_close(a1);
}

int sqlite3_column_int(sqlite3_stmt *a1, int iCol)
{
  return _sqlite3_column_int(a1, iCol);
}

const unsigned __int8 *__cdecl sqlite3_column_text(sqlite3_stmt *a1, int iCol)
{
  return _sqlite3_column_text(a1, iCol);
}

int sqlite3_column_type(sqlite3_stmt *a1, int iCol)
{
  return _sqlite3_column_type(a1, iCol);
}

const char *__cdecl sqlite3_errmsg(sqlite3 *a1)
{
  return _sqlite3_errmsg(a1);
}

int sqlite3_finalize(sqlite3_stmt *pStmt)
{
  return _sqlite3_finalize(pStmt);
}

sqlite3_int64 sqlite3_last_insert_rowid(sqlite3 *a1)
{
  return _sqlite3_last_insert_rowid(a1);
}

int sqlite3_open(const char *filename, sqlite3 **ppDb)
{
  return _sqlite3_open(filename, ppDb);
}

int sqlite3_prepare_v2(sqlite3 *db, const char *zSql, int nByte, sqlite3_stmt **ppStmt, const char **pzTail)
{
  return _sqlite3_prepare_v2(db, zSql, nByte, ppStmt, pzTail);
}

int sqlite3_step(sqlite3_stmt *a1)
{
  return _sqlite3_step(a1);
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

uint64_t swift_deallocPartialClassInstance()
{
  return _swift_deallocPartialClassInstance();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
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