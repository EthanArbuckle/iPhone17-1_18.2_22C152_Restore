__CFString *LocalizedString(void *a1)
{
  id v1;
  __CFString *v2;
  uint64_t vars8;

  v1 = a1;
  if (qword_10568[0] != -1) {
    dispatch_once(qword_10568, &stru_C5E8);
  }
  v2 = [(id)qword_10560 localizedStringForKey:v1 value:@"localized string not found" table:@"DriverKitSettings"];
  if (v2 == @"localized string not found" && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_A1E0((uint64_t)v1);
  }

  return v2;
}

void sub_584C(id a1)
{
  qword_10560 = +[NSBundle bundleForClass:objc_opt_class()];

  _objc_release_x1();
}

void sub_5D54(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + OBJC_IVAR___PSBundleController__parent));
  [WeakRetained reloadSpecifiers];
}

id sub_5DA4()
{
  v1 = *v0;
  if (*v0)
  {
    return v1;
  }
  else
  {
    sub_A2C0();
    sub_5F34((unint64_t *)&qword_10408, (void (*)(uint64_t))&type metadata accessor for DriverManager);
    id result = (id)sub_A370();
    __break(1u);
  }
  return result;
}

uint64_t sub_5E34()
{
  uint64_t v1 = *v0;
  uint64_t v2 = v0[1];
  uint64_t v3 = sub_A2C0();
  uint64_t v4 = sub_5F34((unint64_t *)&qword_10408, (void (*)(uint64_t))&type metadata accessor for DriverManager);

  return EnvironmentObject.projectedValue.getter(v1, v2, v3, v4);
}

uint64_t sub_5EBC()
{
  swift_getObjectType();
  sub_5F34(&qword_10410, (void (*)(uint64_t))&type metadata accessor for DriverApprovalState);

  return sub_A340();
}

uint64_t sub_5F34(unint64_t *a1, void (*a2)(uint64_t))
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

id sub_5F7C()
{
  return *(id *)(v0 + 24);
}

void sub_5F84(uint64_t a1)
{
  *(void *)(v1 + 24) = a1;
}

uint64_t (*sub_5FB0())()
{
  return nullsub_1;
}

uint64_t sub_5FD4()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = *(void *)(v0 + 24);
  uint64_t v3 = sub_A280();
  uint64_t v4 = sub_5F34(&qword_10410, (void (*)(uint64_t))&type metadata accessor for DriverApprovalState);

  return ObservedObject.projectedValue.getter(v1, v2, v3, v4);
}

uint64_t sub_605C()
{
  uint64_t v1 = *(void *)(v0 + 32);
  sub_6090(v1, *(void *)(v0 + 40));
  return v1;
}

uint64_t sub_6090(uint64_t a1, unint64_t a2)
{
  if (a2 >= 2) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_60A4()
{
  sub_A440();
  return v1;
}

uint64_t sub_60E0()
{
  sub_6128(&qword_10418);
  sub_A450();
  return v1;
}

uint64_t sub_6128(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_616C()
{
  return sub_A460();
}

void (*sub_61B8(void *a1))(uint64_t a1)
{
  uint64_t v3 = malloc(0x38uLL);
  *a1 = v3;
  v3[1] = *(_OWORD *)(v1 + 48);
  sub_62B8((uint64_t)v3 + 24, (uint64_t)(v3 + 2));
  *uint64_t v3 = v3[1];
  sub_6320((uint64_t)(v3 + 2));
  *((void *)v3 + 5) = sub_6128(&qword_10418);
  sub_A450();
  return sub_625C;
}

void sub_625C(uint64_t a1)
{
  uint64_t v1 = *(unsigned char **)a1;
  uint64_t v2 = (_OWORD *)(*(void *)a1 + 16);
  char v3 = *(unsigned char *)(*(void *)a1 + 49);
  *(_OWORD *)uint64_t v1 = *v2;
  v1[48] = v3;
  sub_A460();
  sub_634C((uint64_t)v2);

  free(v1);
}

uint64_t sub_62B8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_6128(&qword_10420);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_6320(uint64_t a1)
{
  return a1;
}

uint64_t sub_634C(uint64_t a1)
{
  return a1;
}

uint64_t sub_6378()
{
  return 0;
}

uint64_t sub_6380()
{
  sub_6128(&qword_10418);
  sub_A470();
  return v1;
}

uint64_t sub_63CC()
{
  uint64_t v1 = sub_A300();
  ((void (*)(void))__chkstk_darwin)();
  char v3 = (char *)&v21 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_A2E0();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = ((uint64_t (*)(void))__chkstk_darwin)();
  v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  v10 = (char *)&v21 - v9;
  uint64_t v11 = sub_A2F0();
  __chkstk_darwin(v11 - 8);
  v13 = (char *)&v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = *(void *)(v0 + 24);
  uint64_t v15 = direct field offset for DriverApprovalState.driver;
  uint64_t v16 = sub_A2D0();
  sub_8150(v14 + *(int *)(v16 + 20) + v15, (uint64_t)v13, (uint64_t (*)(void))&type metadata accessor for DriverKitDriverSource);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v13, 1, v4) == 1) {
    return sub_8F50(3);
  }
  sub_81B8((uint64_t)v13, (uint64_t)v10, (uint64_t (*)(void))&type metadata accessor for DriverKitDriverApp);
  sub_8150((uint64_t)v10, (uint64_t)v8, (uint64_t (*)(void))&type metadata accessor for DriverKitDriverApp);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_8280(*(void *)v8, *((void *)v8 + 1));
    uint64_t v17 = sub_8F50(4);
    v18 = &type metadata accessor for DriverKitDriverApp;
    uint64_t v19 = (uint64_t)v10;
  }
  else
  {
    sub_8220((uint64_t)v10, (uint64_t (*)(void))&type metadata accessor for DriverKitDriverApp);
    sub_81B8((uint64_t)v8, (uint64_t)v3, (uint64_t (*)(void))&type metadata accessor for SettingsApplicationRecord);
    uint64_t v17 = *(void *)&v3[*(int *)(v1 + 36)];
    swift_bridgeObjectRetain();
    uint64_t v19 = (uint64_t)v3;
    v18 = &type metadata accessor for SettingsApplicationRecord;
  }
  sub_8220(v19, (uint64_t (*)(void))v18);
  return v17;
}

uint64_t sub_669C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  v29[4] = a1;
  uint64_t v3 = sub_6128(&qword_10428);
  uint64_t v31 = *(void *)(v3 - 8);
  uint64_t v32 = v3;
  __chkstk_darwin(v3);
  uint64_t v5 = (char *)v29 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_A540();
  sub_6B08((uint64_t)v1);
  uint64_t v6 = sub_A530();
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  *(void *)(v7 + 24) = &protocol witness table for MainActor;
  long long v8 = v1[1];
  *(_OWORD *)(v7 + 32) = *v1;
  *(_OWORD *)(v7 + 48) = v8;
  long long v9 = v1[3];
  *(_OWORD *)(v7 + 64) = v1[2];
  *(_OWORD *)(v7 + 80) = v9;
  sub_6B08((uint64_t)v1);
  uint64_t v10 = sub_A530();
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v10;
  *(void *)(v11 + 24) = &protocol witness table for MainActor;
  long long v12 = v2[1];
  *(_OWORD *)(v11 + 32) = *v2;
  *(_OWORD *)(v11 + 48) = v12;
  long long v13 = v2[3];
  *(_OWORD *)(v11 + 64) = v2[2];
  *(_OWORD *)(v11 + 80) = v13;
  sub_A4B0();
  uint64_t v14 = v37;
  uint64_t v15 = v38;
  v33 = v2;
  swift_retain();
  swift_retain();
  sub_6128(&qword_10430);
  sub_7110();
  v30 = v5;
  v29[2] = v15;
  v29[3] = v14;
  sub_A4A0();
  sub_8F50(10);
  sub_6128(&qword_10450);
  uint64_t v16 = swift_allocObject();
  *(_OWORD *)(v16 + 16) = xmmword_AB90;
  uint64_t v17 = (uint64_t *)(*((void *)v2 + 3) + direct field offset for DriverApprovalState.driver);
  v18 = (uint64_t *)((char *)v17 + *(int *)(sub_A2D0() + 24));
  if (v18[1])
  {
    uint64_t v19 = *v18;
    uint64_t v20 = v18[1];
  }
  else
  {
    uint64_t v19 = *v17;
    uint64_t v20 = v17[1];
    swift_bridgeObjectRetain();
  }
  *(void *)(v16 + 56) = &type metadata for String;
  *(void *)(v16 + 64) = sub_71F8();
  *(void *)(v16 + 32) = v19;
  *(void *)(v16 + 40) = v20;
  swift_bridgeObjectRetain();
  uint64_t v21 = sub_A500();
  uint64_t v23 = v22;
  swift_bridgeObjectRelease();
  uint64_t v35 = v21;
  uint64_t v36 = v23;
  long long v34 = v2[3];
  sub_6128(&qword_10418);
  uint64_t v24 = sub_A470();
  v29[1] = v29;
  uint64_t v25 = __chkstk_darwin(v24);
  __chkstk_darwin(v25);
  sub_6128(&qword_10460);
  sub_6128(&qword_10468);
  sub_7778(&qword_10470, &qword_10428);
  sub_7724();
  sub_7778(&qword_10480, &qword_10460);
  sub_77BC();
  uint64_t v26 = v32;
  v27 = v30;
  sub_A430();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(char *, uint64_t))(v31 + 8))(v27, v26);
}

uint64_t sub_6B08(uint64_t a1)
{
  uint64_t v3 = *(void **)(a1 + 24);
  uint64_t v2 = *(void *)(a1 + 32);
  unint64_t v4 = *(void *)(a1 + 40);
  id v5 = *(id *)a1;
  id v6 = v3;
  sub_6090(v2, v4);
  swift_retain();
  return a1;
}

uint64_t sub_6B6C@<X0>(BOOL *a1@<X8>)
{
  long long v6 = *(_OWORD *)(v1 + 48);
  id v3 = *((id *)&v6 + 1);
  int v4 = sub_A260();
  uint64_t result = sub_80A8((uint64_t)&v6);
  *a1 = v4 == 1;
  return result;
}

uint64_t sub_6BC8()
{
  swift_unknownObjectRelease();

  if (*(void *)(v0 + 72) >= 2uLL) {
    swift_bridgeObjectRelease();
  }
  swift_release();

  return _swift_deallocObject(v0, 96, 7);
}

void sub_6C28(unsigned __int8 *a1)
{
  uint64_t v2 = v1;
  int v3 = *a1;
  long long v10 = *(_OWORD *)(v1 + 48);
  id v4 = *((id *)&v10 + 1);
  uint64_t v5 = sub_A270();
  sub_80A8((uint64_t)&v10);
  if (v5)
  {
    swift_release();
  }
  else
  {
    long long v13 = *(_OWORD *)(v2 + 48);
    id v6 = *((id *)&v13 + 1);
    int v7 = sub_A260();
    sub_80A8((uint64_t)&v13);
    if (v7 == 1)
    {
      if ((v3 & 1) == 0)
      {
        long long v8 = *(void **)(v2 + 32);
        if (v8)
        {
          sub_807C((uint64_t)&v13);
          id v9 = v8;
          sub_A290();
          sub_80A8((uint64_t)&v13);
        }
        else
        {
          sub_A2C0();
          sub_5F34((unint64_t *)&qword_10408, (void (*)(uint64_t))&type metadata accessor for DriverManager);
          sub_A370();
          __break(1u);
        }
      }
    }
    else if (v3)
    {
      long long v12 = *(_OWORD *)(v2 + 80);
      char v11 = 1;
      sub_6128(&qword_10418);
      sub_A460();
    }
  }
}

uint64_t sub_6D88@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *(void *)(v1 + 16);
  sub_80D4(v3 + 32, (uint64_t)v40);
  sub_80D4((uint64_t)v40, (uint64_t)v41);
  unint64_t v4 = v42;
  uint64_t v5 = (uint64_t *)(*(void *)(v3 + 24) + direct field offset for DriverApprovalState.driver);
  id v6 = (uint64_t *)((char *)v5 + *(int *)(sub_A2D0() + 24));
  uint64_t v7 = v6[1];
  if (v4 >= 2)
  {
    if (v7)
    {
      uint64_t v8 = *v6;
      uint64_t v9 = v6[1];
    }
    else
    {
      uint64_t v8 = *v5;
      uint64_t v9 = swift_bridgeObjectRetain();
    }
    *(void *)&long long v35 = v8;
    *((void *)&v35 + 1) = v9;
    sub_7724();
    swift_bridgeObjectRetain();
    sub_A3E0();
    sub_6128(&qword_10448);
    sub_7778(&qword_10440, &qword_10448);
    uint64_t result = sub_A3A0();
    long long v26 = v35;
    long long v27 = v36;
    long long v28 = v37;
    long long v29 = v38;
    char v30 = v39;
  }
  else
  {
    uint64_t v33 = a1;
    if (!v7) {
      swift_bridgeObjectRetain();
    }
    sub_7724();
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_A3E0();
    uint64_t v31 = v11;
    uint64_t v32 = v10;
    char v13 = v12 & 1;
    *(void *)&long long v34 = sub_63CC();
    *((void *)&v34 + 1) = v14;
    uint64_t v15 = sub_A3E0();
    uint64_t v17 = v16;
    char v19 = v18 & 1;
    sub_A3B0();
    uint64_t v20 = sub_A3D0();
    uint64_t v22 = v21;
    char v24 = v23;
    swift_release();
    sub_8130(v15, v17, v19);
    swift_bridgeObjectRelease();
    sub_8140(v32, v31, v13);
    swift_bridgeObjectRetain();
    sub_8140(v20, v22, v24 & 1);
    swift_bridgeObjectRetain();
    sub_8140(v32, v31, v13);
    swift_bridgeObjectRetain();
    sub_8140(v20, v22, v24 & 1);
    swift_bridgeObjectRetain();
    sub_8130(v20, v22, v24 & 1);
    swift_bridgeObjectRelease();
    sub_8130(v32, v31, v13);
    swift_bridgeObjectRelease();
    sub_6128(&qword_10448);
    sub_7778(&qword_10440, &qword_10448);
    sub_A3A0();
    sub_8130(v20, v22, v24 & 1);
    swift_bridgeObjectRelease();
    sub_8130(v32, v31, v13);
    uint64_t result = swift_bridgeObjectRelease();
    long long v26 = v34;
    long long v27 = v36;
    long long v28 = v37;
    long long v29 = v38;
    char v30 = v39;
    a1 = v33;
  }
  *(_OWORD *)a1 = v26;
  *(_OWORD *)(a1 + 16) = v27;
  *(_OWORD *)(a1 + 32) = v28;
  *(_OWORD *)(a1 + 48) = v29;
  *(unsigned char *)(a1 + 64) = v30;
  return result;
}

unint64_t sub_7110()
{
  unint64_t result = qword_10438;
  if (!qword_10438)
  {
    sub_71B0(&qword_10430);
    sub_7778(&qword_10440, &qword_10448);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10438);
  }
  return result;
}

uint64_t sub_71B0(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_71F8()
{
  unint64_t result = qword_10458;
  if (!qword_10458)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10458);
  }
  return result;
}

uint64_t sub_724C@<X0>(_OWORD *a1@<X0>, char *a2@<X8>)
{
  uint64_t v32 = a2;
  uint64_t v3 = sub_6128(&qword_10490);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)&v31 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_6128(&qword_10498);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v31 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __chkstk_darwin(v8);
  char v13 = (char *)&v31 - v12;
  uint64_t v14 = __chkstk_darwin(v11);
  uint64_t v16 = (char *)&v31 - v15;
  __chkstk_darwin(v14);
  char v18 = (char *)&v31 - v17;
  sub_A320();
  uint64_t v19 = sub_A330();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v5, 0, 1, v19);
  uint64_t v20 = (_OWORD *)swift_allocObject();
  long long v21 = a1[1];
  v20[1] = *a1;
  v20[2] = v21;
  long long v22 = a1[3];
  v20[3] = a1[2];
  v20[4] = v22;
  sub_6B08((uint64_t)a1);
  sub_A480();
  char v23 = (_OWORD *)swift_allocObject();
  long long v24 = a1[1];
  v23[1] = *a1;
  v23[2] = v24;
  long long v25 = a1[3];
  v23[3] = a1[2];
  v23[4] = v25;
  sub_6B08((uint64_t)a1);
  sub_A490();
  long long v26 = *(void (**)(char *, char *, uint64_t))(v7 + 16);
  v26(v13, v18, v6);
  v26(v10, v16, v6);
  long long v27 = v32;
  v26(v32, v13, v6);
  uint64_t v28 = sub_6128(&qword_104A0);
  v26(&v27[*(int *)(v28 + 48)], v10, v6);
  long long v29 = *(void (**)(char *, uint64_t))(v7 + 8);
  v29(v16, v6);
  v29(v18, v6);
  v29(v10, v6);
  return ((uint64_t (*)(char *, uint64_t))v29)(v13, v6);
}

uint64_t sub_75C8@<X0>(char *a1@<X8>)
{
  return sub_724C(*(_OWORD **)(v1 + 16), a1);
}

uint64_t sub_75D0@<X0>(uint64_t a1@<X8>)
{
  return sub_75E0(13, a1);
}

uint64_t sub_75D8@<X0>(uint64_t a1@<X8>)
{
  return sub_75E0(12, a1);
}

uint64_t sub_75E0@<X0>(char a1@<W0>, uint64_t a2@<X8>)
{
  sub_8F50(a1);
  sub_7724();
  uint64_t result = sub_A3E0();
  *(void *)a2 = result;
  *(void *)(a2 + 8) = v4;
  *(unsigned char *)(a2 + 16) = v5 & 1;
  *(void *)(a2 + 24) = v6;
  return result;
}

double sub_7638@<D0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *(void *)(*(void *)(v1 + 16) + 24);
  uint64_t v4 = direct field offset for DriverApprovalState.driver;
  char v5 = (long long *)(v3 + *(int *)(sub_A2D0() + 28) + v4);
  if (*((void *)v5 + 1))
  {
    long long v7 = *v5;
    sub_7724();
    swift_bridgeObjectRetain();
    sub_A3E0();
  }
  sub_A3A0();
  double result = *(double *)&v7;
  *(_OWORD *)a1 = v7;
  *(_OWORD *)(a1 + 16) = v8;
  *(unsigned char *)(a1 + 32) = v9;
  return result;
}

unint64_t sub_7724()
{
  unint64_t result = qword_10478;
  if (!qword_10478)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10478);
  }
  return result;
}

uint64_t sub_7778(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_71B0(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_77BC()
{
  unint64_t result = qword_10488;
  if (!qword_10488)
  {
    sub_71B0(&qword_10468);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10488);
  }
  return result;
}

uint64_t sub_7830()
{
  sub_A2C0();
  sub_5F34((unint64_t *)&qword_10408, (void (*)(uint64_t))&type metadata accessor for DriverManager);

  return sub_A380();
}

uint64_t sub_78A4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X8>)
{
  sub_A280();
  sub_5F34(&qword_10410, (void (*)(uint64_t))&type metadata accessor for DriverApprovalState);
  uint64_t v10 = sub_A340();
  uint64_t v12 = v11;
  uint64_t result = sub_A440();
  *(void *)a5 = a1;
  *(void *)(a5 + 8) = a2;
  *(void *)(a5 + 16) = v10;
  *(void *)(a5 + 24) = v12;
  *(void *)(a5 + 32) = a3;
  *(void *)(a5 + 40) = a4;
  *(unsigned char *)(a5 + 48) = v14;
  *(void *)(a5 + 56) = v15;
  return result;
}

uint64_t sub_7988()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_79AC()
{
  return sub_A420();
}

uint64_t sub_79C8@<X0>(uint64_t a1@<X8>)
{
  return sub_669C(a1);
}

uint64_t initializeBufferWithCopyOfBuffer for DriverKitSettingsDriverApprovalToggle(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for DriverKitSettingsDriverApprovalToggle(uint64_t a1)
{
  if (*(void *)(a1 + 40) >= 2uLL) {
    swift_bridgeObjectRelease();
  }

  return swift_release();
}

uint64_t initializeWithCopy for DriverKitSettingsDriverApprovalToggle(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  char v5 = *(void **)(a2 + 24);
  *(void *)(a1 + 24) = v5;
  uint64_t v6 = (void *)(a2 + 32);
  unint64_t v7 = *(void *)(a2 + 40);
  id v8 = v4;
  id v9 = v5;
  if (v7 >= 2)
  {
    *(void *)(a1 + 32) = *v6;
    *(void *)(a1 + 40) = v7;
    swift_bridgeObjectRetain();
  }
  else
  {
    *(_OWORD *)(a1 + 32) = *(_OWORD *)v6;
  }
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for DriverKitSettingsDriverApprovalToggle(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a1;
  char v5 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  id v6 = v5;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  unint64_t v7 = *(void **)(a2 + 24);
  id v8 = *(void **)(a1 + 24);
  *(void *)(a1 + 24) = v7;
  id v9 = v7;

  unint64_t v10 = *(void *)(a2 + 40);
  if (*(void *)(a1 + 40) >= 2uLL)
  {
    if (v10 >= 2)
    {
      *(void *)(a1 + 32) = *(void *)(a2 + 32);
      *(void *)(a1 + 40) = *(void *)(a2 + 40);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      goto LABEL_8;
    }
    sub_7C28(a1 + 32);
    goto LABEL_6;
  }
  if (v10 < 2)
  {
LABEL_6:
    *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
    goto LABEL_8;
  }
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
LABEL_8:
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_7C28(uint64_t a1)
{
  return a1;
}

__n128 initializeWithTake for DriverKitSettingsDriverApprovalToggle(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for DriverKitSettingsDriverApprovalToggle(uint64_t a1, uint64_t a2)
{
  long long v4 = *(void **)a1;
  *(void *)a1 = *(void *)a2;

  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  char v5 = *(void **)(a1 + 24);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);

  id v6 = (void *)(a2 + 32);
  if (*(void *)(a1 + 40) >= 2uLL)
  {
    unint64_t v7 = *(void *)(a2 + 40);
    if (v7 >= 2)
    {
      *(void *)(a1 + 32) = *v6;
      *(void *)(a1 + 40) = v7;
      swift_bridgeObjectRelease();
      goto LABEL_6;
    }
    sub_7C28(a1 + 32);
  }
  *(_OWORD *)(a1 + 32) = *(_OWORD *)v6;
LABEL_6:
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for DriverKitSettingsDriverApprovalToggle(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 64)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for DriverKitSettingsDriverApprovalToggle(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 64) = 1;
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
    *(unsigned char *)(result + 64) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for DriverKitSettingsDriverApprovalToggle()
{
  return &type metadata for DriverKitSettingsDriverApprovalToggle;
}

uint64_t sub_7DE8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_7EEC()
{
  return sub_A460();
}

uint64_t sub_7F3C()
{
  if (*(void *)(v0 + 56) >= 2uLL) {
    swift_bridgeObjectRelease();
  }
  swift_release();

  return _swift_deallocObject(v0, 80, 7);
}

void sub_7F94()
{
  long long v3 = *(_OWORD *)(v0 + 64);
  sub_6128(&qword_10418);
  sub_A460();
  uint64_t v1 = *(void **)(v0 + 16);
  if (v1)
  {
    long long v3 = *(_OWORD *)(v0 + 32);
    id v2 = v1;
    sub_807C((uint64_t)&v3);
    sub_A290();
    sub_80A8((uint64_t)&v3);
  }
  else
  {
    sub_A2C0();
    sub_5F34((unint64_t *)&qword_10408, (void (*)(uint64_t))&type metadata accessor for DriverManager);
    sub_A370();
    __break(1u);
  }
}

uint64_t sub_807C(uint64_t a1)
{
  id v2 = *(id *)(a1 + 8);
  return a1;
}

uint64_t sub_80A8(uint64_t a1)
{
  return a1;
}

uint64_t sub_80D4(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_8130(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_8140(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_retain();
  }
  else {
    return swift_bridgeObjectRetain();
  }
}

uint64_t sub_8150(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_81B8(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_8220(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_8280(uint64_t a1, unint64_t a2)
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

id sub_82D8()
{
  uint64_t v1 = OBJC_IVAR____TtC17DriverKitSettings31DriverKitSettingsViewController____lazy_storage___hostingController;
  id v2 = *(void **)&v0[OBJC_IVAR____TtC17DriverKitSettings31DriverKitSettingsViewController____lazy_storage___hostingController];
  if (v2)
  {
    id v3 = *(id *)&v0[OBJC_IVAR____TtC17DriverKitSettings31DriverKitSettingsViewController____lazy_storage___hostingController];
LABEL_11:
    id v22 = v2;
    return v3;
  }
  long long v4 = v0;
  id result = [v0 specifier];
  if (result)
  {
    id v6 = result;
    id v7 = [result propertyForKey:PSAppSettingsBundleIDKey];

    if (v7)
    {
      sub_A550();
      swift_unknownObjectRelease();
    }
    else
    {
      memset(v27, 0, sizeof(v27));
    }
    sub_8CE4((uint64_t)v27, (uint64_t)v23);
    if (v24) {
      swift_dynamicCast();
    }
    else {
      sub_8D4C((uint64_t)v23);
    }
    uint64_t v8 = sub_5E30();
    uint64_t v9 = j_nullsub_1(v8);
    uint64_t v11 = v10;
    uint64_t v13 = v12;
    uint64_t v15 = v14;
    uint64_t v16 = *(void **)sub_A2B0();
    sub_A2C0();
    sub_8DAC();
    id v17 = v16;
    uint64_t v18 = sub_A310();
    v23[0] = v9;
    v23[1] = v11;
    v23[2] = v13;
    uint64_t v24 = v15;
    uint64_t v25 = v18;
    id v26 = v17;
    id v19 = objc_allocWithZone((Class)sub_6128(&qword_104F0));
    uint64_t v20 = (void *)sub_A390();
    long long v21 = *(void **)&v4[v1];
    *(void *)&v4[v1] = v20;
    id v3 = v20;

    id v2 = 0;
    goto LABEL_11;
  }
  __break(1u);
  return result;
}

uint64_t sub_8494()
{
  return 0;
}

void sub_849C()
{
  v40.receiver = v0;
  v40.super_class = (Class)swift_getObjectType();
  objc_msgSendSuper2(&v40, "viewDidLoad");
  sub_8F50(0);
  NSString v1 = sub_A4E0();
  swift_bridgeObjectRelease();
  [v0 setTitle:v1];

  id v2 = sub_82D8();
  [v0 addChildViewController:v2];

  id v3 = [v0 view];
  if (!v3)
  {
    __break(1u);
    goto LABEL_14;
  }
  long long v4 = v3;
  id v5 = sub_82D8();
  id v6 = [v5 view];

  if (!v6)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  [v4 addSubview:v6];

  id v7 = sub_82D8();
  id v8 = [v7 view];

  if (!v8)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  [v8 setTranslatesAutoresizingMaskIntoConstraints:0];

  sub_6128(&qword_104A8);
  uint64_t v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_AC40;
  id v10 = sub_82D8();
  id v11 = [v10 view];

  if (!v11)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  id v12 = [v11 trailingAnchor];

  id v13 = [v0 view];
  if (!v13)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  uint64_t v14 = v13;
  id v15 = [v13 trailingAnchor];

  id v16 = [v12 constraintEqualToAnchor:v15];
  *(void *)(v9 + 32) = v16;
  id v17 = sub_82D8();
  id v18 = [v17 view];

  if (!v18)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  id v19 = [v18 leadingAnchor];

  id v20 = [v0 view];
  if (!v20)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  long long v21 = v20;
  id v22 = [v20 leadingAnchor];

  id v23 = [v19 constraintEqualToAnchor:v22];
  *(void *)(v9 + 40) = v23;
  id v24 = sub_82D8();
  id v25 = [v24 view];

  if (!v25)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  id v26 = [v25 topAnchor];

  id v27 = [v0 view];
  if (!v27)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  uint64_t v28 = v27;
  id v29 = [v27 topAnchor];

  id v30 = [v26 constraintEqualToAnchor:v29];
  *(void *)(v9 + 48) = v30;
  id v31 = sub_82D8();
  id v32 = [v31 view];

  if (!v32)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  id v33 = [v32 bottomAnchor];

  id v34 = [v0 view];
  if (v34)
  {
    long long v35 = v34;
    id v36 = [v34 bottomAnchor];

    id v37 = [v33 constraintEqualToAnchor:v36];
    *(void *)(v9 + 56) = v37;
    sub_A520();
    long long v38 = self;
    sub_8914();
    Class isa = sub_A510().super.isa;
    swift_bridgeObjectRelease();
    [v38 activateConstraints:isa];

    return;
  }
LABEL_23:
  __break(1u);
}

unint64_t sub_8914()
{
  unint64_t result = qword_104B0;
  if (!qword_104B0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_104B0);
  }
  return result;
}

id sub_899C(uint64_t a1, uint64_t a2, void *a3)
{
  long long v4 = v3;
  if (a2)
  {
    NSString v6 = sub_A4E0();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v6 = 0;
  }
  id v7 = [objc_allocWithZone(v4) initWithNibName:v6 bundle:a3];

  return v7;
}

id sub_8A14(uint64_t a1, uint64_t a2, void *a3)
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(void *)&v3[OBJC_IVAR____TtC17DriverKitSettings31DriverKitSettingsViewController____lazy_storage___hostingController] = 0;
  if (a2)
  {
    NSString v7 = sub_A4E0();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v7 = 0;
  }
  v10.receiver = v3;
  v10.super_class = ObjectType;
  id v8 = objc_msgSendSuper2(&v10, "initWithNibName:bundle:", v7, a3);

  return v8;
}

id sub_8B80(void *a1)
{
  id v3 = [objc_allocWithZone(v1) initWithCoder:a1];

  return v3;
}

id sub_8BC4(void *a1)
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(void *)&v1[OBJC_IVAR____TtC17DriverKitSettings31DriverKitSettingsViewController____lazy_storage___hostingController] = 0;
  v6.receiver = v1;
  v6.super_class = ObjectType;
  id v4 = objc_msgSendSuper2(&v6, "initWithCoder:", a1);

  return v4;
}

id sub_8C78()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for DriverKitSettingsViewController()
{
  return self;
}

uint64_t sub_8CE4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_6128(&qword_104E8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_8D4C(uint64_t a1)
{
  uint64_t v2 = sub_6128(&qword_104E8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_8DAC()
{
  unint64_t result = qword_10408;
  if (!qword_10408)
  {
    sub_A2C0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10408);
  }
  return result;
}

BOOL sub_8E04(char a1, char a2)
{
  return a1 == a2;
}

void sub_8E14(uint64_t a1, unsigned __int8 a2)
{
}

Swift::Int sub_8E3C(unsigned __int8 a1)
{
  return sub_A580();
}

BOOL sub_8E84(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

Swift::Int sub_8E98()
{
  Swift::UInt v1 = *v0;
  sub_A560();
  sub_A570(v1);
  return sub_A580();
}

void sub_8EE0()
{
  sub_A570(*v0);
}

Swift::Int sub_8F0C()
{
  Swift::UInt v1 = *v0;
  sub_A560();
  sub_A570(v1);
  return sub_A580();
}

uint64_t sub_8F50(char a1)
{
  sub_8FC0(a1);
  NSString v1 = sub_A4E0();
  swift_bridgeObjectRelease();
  uint64_t v2 = LocalizedString(v1);

  uint64_t v3 = sub_A4F0();
  return v3;
}

unint64_t sub_8FC0(char a1)
{
  unint64_t result = 0xD00000000000001BLL;
  switch(a1)
  {
    case 1:
      unint64_t result = 0xD000000000000021;
      break;
    case 2:
      unint64_t result = 0xD00000000000002DLL;
      break;
    case 3:
      unint64_t result = 0xD00000000000002CLL;
      break;
    case 4:
      unint64_t result = 0xD000000000000036;
      break;
    case 5:
      unint64_t result = 0xD00000000000002CLL;
      break;
    case 6:
      unint64_t result = 0xD00000000000002DLL;
      break;
    case 7:
    case 12:
    case 13:
      unint64_t result = 0xD000000000000030;
      break;
    case 8:
      unint64_t result = 0xD000000000000031;
      break;
    case 9:
      unint64_t result = 0xD000000000000029;
      break;
    case 10:
      unint64_t result = 0xD000000000000029;
      break;
    case 11:
      unint64_t result = 0xD00000000000002FLL;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t sub_911C()
{
  unint64_t result = qword_104F8;
  if (!qword_104F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_104F8);
  }
  return result;
}

unsigned char *initializeBufferWithCopyOfBuffer for LocalizedStrings(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for LocalizedStrings(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for LocalizedStrings(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 13;
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
        JUMPOUT(0x92DCLL);
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
          *unint64_t result = a2 + 13;
        break;
    }
  }
  return result;
}

uint64_t sub_9304(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_930C(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for LocalizedStrings()
{
  return &type metadata for LocalizedStrings;
}

uint64_t sub_932C@<X0>(uint64_t a1@<X2>, unint64_t a2@<X3>, uint64_t *a3@<X8>)
{
  sub_6090(a1, a2);
  sub_A2C0();
  sub_5F34((unint64_t *)&qword_10408, (void (*)(uint64_t))&type metadata accessor for DriverManager);
  uint64_t result = sub_A380();
  *a3 = result;
  a3[1] = v7;
  a3[2] = a1;
  a3[3] = a2;
  return result;
}

uint64_t sub_93BC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v4 = *(void *)(v1 + 16);
  unint64_t v3 = *(void *)(v1 + 24);
  sub_6090(v4, v3);
  sub_A2C0();
  sub_5F34((unint64_t *)&qword_10408, (void (*)(uint64_t))&type metadata accessor for DriverManager);
  uint64_t result = sub_A380();
  *a1 = result;
  a1[1] = v6;
  a1[2] = v4;
  a1[3] = v3;
  return result;
}

id sub_9448(void *a1)
{
  if (a1)
  {
    return a1;
  }
  else
  {
    sub_A2C0();
    sub_5F34((unint64_t *)&qword_10408, (void (*)(uint64_t))&type metadata accessor for DriverManager);
    id result = (id)sub_A370();
    __break(1u);
  }
  return result;
}

uint64_t sub_94C4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_A2C0();
  uint64_t v5 = sub_5F34((unint64_t *)&qword_10408, (void (*)(uint64_t))&type metadata accessor for DriverManager);

  return EnvironmentObject.projectedValue.getter(a1, a2, v4, v5);
}

uint64_t sub_9550(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  return a3;
}

uint64_t sub_9588(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = sub_6128(&qword_10500);
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  id v11 = &v13[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v14 = a1;
  uint64_t v15 = a2;
  uint64_t v16 = a3;
  uint64_t v17 = a4;
  sub_6128(&qword_10508);
  sub_97E4();
  sub_A3C0();
  sub_7778(&qword_10530, &qword_10500);
  sub_A3F0();
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v9 + 8))(v11, v8);
}

uint64_t sub_96F4()
{
  return sub_A4D0();
}

uint64_t sub_97D8()
{
  return sub_96F4();
}

unint64_t sub_97E4()
{
  unint64_t result = qword_10510;
  if (!qword_10510)
  {
    sub_71B0(&qword_10508);
    sub_986C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10510);
  }
  return result;
}

unint64_t sub_986C()
{
  unint64_t result = qword_10518;
  if (!qword_10518)
  {
    sub_71B0(&qword_10520);
    sub_98E0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10518);
  }
  return result;
}

unint64_t sub_98E0()
{
  unint64_t result = qword_10528;
  if (!qword_10528)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10528);
  }
  return result;
}

uint64_t sub_9934()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_9950()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_996C@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v10 = sub_6128(&qword_10520);
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  id v13 = (char *)v19 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    id v14 = a1;
    uint64_t v15 = sub_A2A0();

    v19[1] = v15;
    uint64_t v16 = (void *)swift_allocObject();
    v16[2] = a1;
    v16[3] = a2;
    v16[4] = a3;
    v16[5] = a4;
    id v17 = v14;
    sub_6090(a3, a4);
    sub_6128(&qword_10540);
    sub_7778(&qword_10548, &qword_10540);
    sub_98E0();
    sub_5F34((unint64_t *)&unk_10550, (void (*)(uint64_t))&type metadata accessor for DriverApprovalState);
    sub_A4C0();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v11 + 32))(a5, v13, v10);
  }
  else
  {
    sub_A2C0();
    sub_5F34((unint64_t *)&qword_10408, (void (*)(uint64_t))&type metadata accessor for DriverManager);
    uint64_t result = sub_A370();
    __break(1u);
  }
  return result;
}

uint64_t sub_9BC8()
{
  uint64_t v1 = sub_6128(&qword_10500);
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = &v7[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  long long v5 = v0[1];
  long long v8 = *v0;
  long long v9 = v5;
  sub_6128(&qword_10508);
  sub_97E4();
  sub_A3C0();
  sub_7778(&qword_10530, &qword_10500);
  sub_A3F0();
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v2 + 8))(v4, v1);
}

__n128 initializeWithTake for DriverKitSettingsView(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

ValueMetadata *type metadata accessor for DriverKitSettingsView()
{
  return &type metadata for DriverKitSettingsView;
}

unint64_t destroy for DriverKitSettingsForm(uint64_t a1)
{
  unint64_t result = *(void *)(a1 + 24);
  if (result >= 2)
  {
    return swift_bridgeObjectRelease();
  }
  return result;
}

void *_s17DriverKitSettings21DriverKitSettingsViewVwcp_0(void *a1, uint64_t a2)
{
  long long v3 = *(void **)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v4;
  long long v5 = (void *)(a2 + 16);
  unint64_t v6 = *(void *)(a2 + 24);
  id v7 = v3;
  if (v6 >= 2)
  {
    a1[2] = *v5;
    a1[3] = v6;
    swift_bridgeObjectRetain();
  }
  else
  {
    *((_OWORD *)a1 + 1) = *(_OWORD *)v5;
  }
  return a1;
}

uint64_t _s17DriverKitSettings21DriverKitSettingsViewVwca_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a1;
  long long v5 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  id v6 = v5;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  unint64_t v7 = *(void *)(a2 + 24);
  if (*(void *)(a1 + 24) >= 2uLL)
  {
    if (v7 >= 2)
    {
      *(void *)(a1 + 16) = *(void *)(a2 + 16);
      *(void *)(a1 + 24) = *(void *)(a2 + 24);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      return a1;
    }
    sub_7C28(a1 + 16);
    goto LABEL_6;
  }
  if (v7 < 2)
  {
LABEL_6:
    *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
    return a1;
  }
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t _s17DriverKitSettings21DriverKitSettingsViewVwta_0(uint64_t a1, void *a2)
{
  uint64_t v4 = *(void **)a1;
  *(void *)a1 = *a2;

  *(void *)(a1 + 8) = a2[1];
  long long v5 = a2 + 2;
  if (*(void *)(a1 + 24) >= 2uLL)
  {
    unint64_t v6 = a2[3];
    if (v6 >= 2)
    {
      *(void *)(a1 + 16) = *v5;
      *(void *)(a1 + 24) = v6;
      swift_bridgeObjectRelease();
      return a1;
    }
    sub_7C28(a1 + 16);
  }
  *(_OWORD *)(a1 + 16) = *(_OWORD *)v5;
  return a1;
}

uint64_t _s17DriverKitSettings21DriverKitSettingsViewVwet_0(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *((unsigned char *)a1 + 32)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  uint64_t v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t _s17DriverKitSettings21DriverKitSettingsViewVwst_0(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)unint64_t result = a2 - 0x7FFFFFFF;
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
      *(void *)unint64_t result = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for DriverKitSettingsForm()
{
  return &type metadata for DriverKitSettingsForm;
}

unint64_t sub_A00C()
{
  unint64_t result = qword_10538;
  if (!qword_10538)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10538);
  }
  return result;
}

uint64_t sub_A060()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_A0E0@<X0>(uint64_t a1@<X8>)
{
  return sub_996C(*(void **)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32), *(void *)(v1 + 40), a1);
}

uint64_t sub_A0EC()
{
  if (*(void *)(v0 + 40) >= 2uLL) {
    swift_bridgeObjectRelease();
  }

  return _swift_deallocObject(v0, 48, 7);
}

double sub_A134@<D0>(id *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v5 = *(void *)(v2 + 32);
  unint64_t v4 = *(void *)(v2 + 40);
  id v6 = *a1;
  sub_6090(v5, v4);
  uint64_t v7 = sub_5E30();
  uint64_t v9 = v8;
  sub_6378();
  sub_78A4(v7, v9, v5, v4, (uint64_t)v13);
  long long v10 = v13[1];
  *a2 = v13[0];
  a2[1] = v10;
  double result = *(double *)&v14;
  long long v12 = v15;
  a2[2] = v14;
  a2[3] = v12;
  return result;
}

void sub_A1E0(uint64_t a1)
{
  int v1 = 138412290;
  uint64_t v2 = a1;
  _os_log_error_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Failed to get localized string for %@", (uint8_t *)&v1, 0xCu);
}

uint64_t sub_A260()
{
  return DriverApprovalState.approvalState.getter();
}

uint64_t sub_A270()
{
  return DriverApprovalState.updateStatus.getter();
}

uint64_t sub_A280()
{
  return type metadata accessor for DriverApprovalState();
}

uint64_t sub_A290()
{
  return DriverManager.setDriverState(driverApprovalState:state:)();
}

uint64_t sub_A2A0()
{
  return DriverManager.driverApprovalStates(filter:)();
}

uint64_t sub_A2B0()
{
  return DriverManager.shared.unsafeMutableAddressor();
}

uint64_t sub_A2C0()
{
  return type metadata accessor for DriverManager();
}

uint64_t sub_A2D0()
{
  return type metadata accessor for DriverKitDriver();
}

uint64_t sub_A2E0()
{
  return type metadata accessor for DriverKitDriverApp();
}

uint64_t sub_A2F0()
{
  return type metadata accessor for DriverKitDriverSource();
}

uint64_t sub_A300()
{
  return type metadata accessor for SettingsApplicationRecord();
}

uint64_t sub_A310()
{
  return static ObservableObject.environmentStore.getter();
}

uint64_t sub_A320()
{
  return static ButtonRole.cancel.getter();
}

uint64_t sub_A330()
{
  return type metadata accessor for ButtonRole();
}

uint64_t sub_A340()
{
  return ObservedObject.init(wrappedValue:)();
}

uint64_t sub_A370()
{
  return EnvironmentObject.error()();
}

uint64_t sub_A380()
{
  return EnvironmentObject.init()();
}

uint64_t sub_A390()
{
  return UIHostingController.init(rootView:)();
}

uint64_t sub_A3A0()
{
  return _ConditionalContent<>.init(storage:)();
}

uint64_t sub_A3B0()
{
  return static Font.subheadline.getter();
}

uint64_t sub_A3C0()
{
  return Form.init(content:)();
}

uint64_t sub_A3D0()
{
  return Text.font(_:)();
}

uint64_t sub_A3E0()
{
  return Text.init<A>(_:)();
}

uint64_t sub_A3F0()
{
  return View.settingsListAppearance()();
}

uint64_t sub_A400()
{
  return static View._makeView(view:inputs:)();
}

uint64_t sub_A410()
{
  return static View._makeViewList(view:inputs:)();
}

uint64_t sub_A420()
{
  return static View._viewListCount(inputs:)();
}

uint64_t sub_A430()
{
  return View.alert<A, B, C>(_:isPresented:actions:message:)();
}

uint64_t sub_A440()
{
  return State.init(wrappedValue:)();
}

uint64_t sub_A450()
{
  return State.wrappedValue.getter();
}

uint64_t sub_A460()
{
  return State.wrappedValue.setter();
}

uint64_t sub_A470()
{
  return State.projectedValue.getter();
}

uint64_t sub_A480()
{
  return Button.init(role:action:label:)();
}

uint64_t sub_A490()
{
  return Button.init(action:label:)();
}

uint64_t sub_A4A0()
{
  return Toggle.init(isOn:label:)();
}

uint64_t sub_A4B0()
{
  return Binding.init(get:set:)();
}

uint64_t sub_A4C0()
{
  return ForEach<>.init(_:content:)();
}

uint64_t sub_A4D0()
{
  return Section<>.init(header:footer:content:)();
}

NSString sub_A4E0()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_A4F0()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_A500()
{
  return String.init(format:_:)();
}

NSArray sub_A510()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_A520()
{
  return specialized Array._endMutation()();
}

uint64_t sub_A530()
{
  return static MainActor.shared.getter();
}

uint64_t sub_A540()
{
  return type metadata accessor for MainActor();
}

uint64_t sub_A550()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t sub_A560()
{
  return Hasher.init(_seed:)();
}

void sub_A570(Swift::UInt a1)
{
}

Swift::Int sub_A580()
{
  return Hasher._finalize()();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void free(void *a1)
{
}

void *__cdecl malloc(size_t __size)
{
  return _malloc(__size);
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
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

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return _swift_getEnumCaseMultiPayload();
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

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_retain()
{
  return _swift_retain();
}

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserver:");
}

id objc_msgSend_bundleForClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleForClass:");
}

id objc_msgSend_driverCountForAppID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "driverCountForAppID:");
}

id objc_msgSend_groupSpecifierWithID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "groupSpecifierWithID:");
}

id objc_msgSend_localizedStringForKey_value_table_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedStringForKey:value:table:");
}

id objc_msgSend_preferenceSpecifierNamed_target_set_get_detail_cell_edit_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:");
}

id objc_msgSend_propertyForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "propertyForKey:");
}

id objc_msgSend_refresh(void *a1, const char *a2, ...)
{
  return _[a1 refresh];
}

id objc_msgSend_registerObserver(void *a1, const char *a2, ...)
{
  return _[a1 registerObserver];
}

id objc_msgSend_reloadSpecifiers(void *a1, const char *a2, ...)
{
  return _[a1 reloadSpecifiers];
}

id objc_msgSend_removeObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObserver:");
}

id objc_msgSend_setIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIdentifier:");
}

id objc_msgSend_setProperty_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setProperty:forKey:");
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return _[a1 sharedManager];
}

id objc_msgSend_thirdPartyDriverCount(void *a1, const char *a2, ...)
{
  return _[a1 thirdPartyDriverCount];
}

id objc_msgSend_unregisterObserver(void *a1, const char *a2, ...)
{
  return _[a1 unregisterObserver];
}