id sub_1000028E4@<X0>(void *a1@<X8>)
{
  id result;

  result = [objc_allocWithZone((Class)type metadata accessor for PersonalHotspotStateProvider()) init];
  *a1 = result;
  return result;
}

uint64_t sub_100002920()
{
  uint64_t v1 = sub_100002AE8(&qword_100010318);
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin();
  v4 = (char *)&v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *v0;
  v5 = v9;
  sub_100002B2C();
  id v6 = v5;
  sub_100009C20();
  sub_100002B80();
  sub_100009BF0();
  return (*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v4, v1);
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

unint64_t sub_100002A68()
{
  unint64_t result = qword_100010310;
  if (!qword_100010310)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010310);
  }
  return result;
}

ValueMetadata *type metadata accessor for PersonalHotspotControlBundle()
{
  return &type metadata for PersonalHotspotControlBundle;
}

uint64_t sub_100002ACC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100002AE8(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_100002B2C()
{
  unint64_t result = qword_100010320;
  if (!qword_100010320)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010320);
  }
  return result;
}

unint64_t sub_100002B80()
{
  unint64_t result = qword_100010328;
  if (!qword_100010328)
  {
    sub_100002BDC(&qword_100010318);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010328);
  }
  return result;
}

uint64_t sub_100002BDC(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

BOOL sub_100002C24(_DWORD *a1, _DWORD *a2)
{
  return *a1 == *a2;
}

void sub_100002C38(_DWORD *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_100002C44()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_100002CA4()
{
  unint64_t result = qword_100010340;
  if (!qword_100010340)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010340);
  }
  return result;
}

unint64_t sub_100002CFC()
{
  unint64_t result = qword_100010348;
  if (!qword_100010348)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010348);
  }
  return result;
}

void sub_100002D50()
{
  v0 = (objc_class *)[self mainBundle];
  v5._countAndFlagsBits = 0x800000010000B4D0;
  v6._object = (void *)0x800000010000B4B0;
  v6._countAndFlagsBits = 0xD000000000000010;
  v7.value._countAndFlagsBits = 0;
  v7.value._object = 0;
  v1.super.isa = v0;
  v8._countAndFlagsBits = 0;
  v8._object = (void *)0xE000000000000000;
  uint64_t v2 = sub_100009B40(v6, v7, v1, v8, v5);
  uint64_t v4 = v3;

  qword_1000109B0 = v2;
  *(void *)algn_1000109B8 = v4;
}

uint64_t sub_100002E08()
{
  uint64_t v0 = sub_100009B60();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin();
  uint64_t v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100009BA0();
  __chkstk_darwin();
  sub_100009CF0();
  __chkstk_darwin();
  uint64_t v4 = sub_100009B70();
  sub_100008F98(v4, qword_1000109C0);
  sub_100008EB0(v4, (uint64_t)qword_1000109C0);
  sub_100009CE0();
  sub_100009B90();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, enum case for LocalizedStringResource.BundleDescription.main(_:), v0);
  return sub_100009B80();
}

void sub_100002FE8()
{
  uint64_t v0 = (objc_class *)[self mainBundle];
  v5._countAndFlagsBits = 0x800000010000B5E0;
  v6._countAndFlagsBits = 0x6C62616C69617641;
  v6._object = (void *)0xE900000000000065;
  v7.value._countAndFlagsBits = 0;
  v7.value._object = 0;
  v1.super.isa = v0;
  v8._countAndFlagsBits = 0;
  v8._object = (void *)0xE000000000000000;
  uint64_t v2 = sub_100009B40(v6, v7, v1, v8, v5);
  uint64_t v4 = v3;

  qword_1000109D8 = v2;
  unk_1000109E0 = v4;
}

void sub_10000309C()
{
  uint64_t v0 = (objc_class *)[self mainBundle];
  v5._countAndFlagsBits = 0x800000010000B630;
  v6._countAndFlagsBits = 6710863;
  v6._object = (void *)0xE300000000000000;
  v7.value._countAndFlagsBits = 0;
  v7.value._object = 0;
  v1.super.isa = v0;
  v8._countAndFlagsBits = 0;
  v8._object = (void *)0xE000000000000000;
  uint64_t v2 = sub_100009B40(v6, v7, v1, v8, v5);
  uint64_t v4 = v3;

  qword_1000109E8 = v2;
  unk_1000109F0 = v4;
}

void sub_100003144()
{
  uint64_t v0 = (objc_class *)[self mainBundle];
  v5._countAndFlagsBits = 0x800000010000B520;
  v6._object = (void *)0x800000010000B500;
  v6._countAndFlagsBits = 0xD000000000000018;
  v7.value._countAndFlagsBits = 0;
  v7.value._object = 0;
  v1.super.isa = v0;
  v8._countAndFlagsBits = 0;
  v8._object = (void *)0xE000000000000000;
  uint64_t v2 = sub_100009B40(v6, v7, v1, v8, v5);
  uint64_t v4 = v3;

  qword_1000109F8 = v2;
  unk_100010A00 = v4;
}

void sub_1000031FC()
{
  uint64_t v0 = (objc_class *)[self mainBundle];
  v5._countAndFlagsBits = 0x800000010000B570;
  v6._object = (void *)0x800000010000B550;
  v6._countAndFlagsBits = 0xD000000000000019;
  v7.value._countAndFlagsBits = 0;
  v7.value._object = 0;
  v1.super.isa = v0;
  v8._countAndFlagsBits = 0;
  v8._object = (void *)0xE000000000000000;
  uint64_t v2 = sub_100009B40(v6, v7, v1, v8, v5);
  uint64_t v4 = v3;

  qword_100010A08 = v2;
  unk_100010A10 = v4;
}

BOOL sub_1000032B4(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

Swift::Int sub_1000032C8()
{
  Swift::UInt v1 = *v0;
  sub_100009E10();
  sub_100009E20(v1);
  return sub_100009E30();
}

void sub_100003310()
{
  sub_100009E20(*v0);
}

Swift::Int sub_10000333C()
{
  Swift::UInt v1 = *v0;
  sub_100009E10();
  sub_100009E20(v1);
  return sub_100009E30();
}

uint64_t sub_100003380@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v28 = a2;
  uint64_t v3 = sub_100009B70();
  uint64_t v29 = *(void *)(v3 - 8);
  uint64_t v30 = v3;
  __chkstk_darwin();
  v27 = (char *)v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100002AE8(&qword_100010420);
  uint64_t v24 = *(void *)(v5 - 8);
  __chkstk_darwin();
  Swift::String_optional v7 = (char *)v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100002AE8(&qword_100010428);
  uint64_t v25 = *(void *)(v8 - 8);
  uint64_t v26 = v8;
  __chkstk_darwin();
  v10 = (char *)v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23[1] = qword_100010330;
  v33 = a1;
  *(void *)(swift_allocObject() + 16) = a1;
  id v11 = a1;
  swift_bridgeObjectRetain();
  sub_100002AE8(&qword_100010430);
  type metadata accessor for PersonalHotspotStateProvider();
  uint64_t v12 = sub_100002BDC(&qword_100010438);
  uint64_t v13 = sub_100002BDC(&qword_100010440);
  uint64_t v14 = sub_10000980C(&qword_100010448, &qword_100010440);
  uint64_t v31 = v13;
  uint64_t v32 = v14;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v31 = v12;
  uint64_t v32 = OpaqueTypeConformance2;
  swift_getOpaqueTypeConformance2();
  sub_1000097B0();
  sub_100009CC0();
  uint64_t v16 = sub_10000980C(&qword_100010458, &qword_100010420);
  sub_100009C40();
  (*(void (**)(char *, uint64_t))(v24 + 8))(v7, v5);
  if (qword_1000102D8 != -1) {
    swift_once();
  }
  uint64_t v17 = v30;
  uint64_t v18 = sub_100008EB0(v30, (uint64_t)qword_1000109C0);
  uint64_t v19 = v29;
  v20 = v27;
  (*(void (**)(char *, uint64_t, uint64_t))(v29 + 16))(v27, v18, v17);
  uint64_t v31 = v5;
  uint64_t v32 = v16;
  swift_getOpaqueTypeConformance2();
  uint64_t v21 = v26;
  sub_100009C30();
  (*(void (**)(char *, uint64_t))(v19 + 8))(v20, v17);
  return (*(uint64_t (**)(char *, uint64_t))(v25 + 8))(v10, v21);
}

uint64_t sub_1000037A4@<X0>(unsigned __int8 *a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v29 = a3;
  uint64_t v5 = sub_100002AE8(&qword_100010440);
  uint64_t v25 = *(void *)(v5 - 8);
  __chkstk_darwin();
  Swift::String_optional v7 = (char *)v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100002AE8(&qword_100010438);
  uint64_t v27 = *(void *)(v8 - 8);
  uint64_t v28 = v8;
  __chkstk_darwin();
  v10 = (char *)v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = sub_100002AE8(&qword_100010430);
  uint64_t v24 = *(void *)(v26 - 8);
  __chkstk_darwin();
  v23 = (char *)v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  int v12 = *a1;
  if (qword_1000102D0 != -1) {
    swift_once();
  }
  uint64_t v36 = qword_1000109B0;
  uint64_t v37 = *(void *)algn_1000109B8;
  v21[3] = (v12 & 0xFE) == 2;
  swift_bridgeObjectRetain();
  uint64_t v34 = sub_1000091EC();
  uint64_t v35 = v13;
  *(void *)(swift_allocObject() + 16) = a2;
  id v22 = a2;
  sub_100002AE8(&qword_100010460);
  uint64_t v14 = sub_100002BDC(&qword_100010468);
  uint64_t v15 = sub_10000980C(&qword_100010470, &qword_100010468);
  unint64_t v16 = sub_100009850();
  uint64_t v30 = v14;
  uint64_t v31 = &type metadata for String;
  uint64_t v32 = v15;
  unint64_t v33 = v16;
  swift_getOpaqueTypeConformance2();
  sub_1000098A4();
  sub_100009CB0();
  if (v12 == 3) {
    sub_100009C70();
  }
  else {
    sub_100009C80();
  }
  uint64_t v17 = sub_10000980C(&qword_100010448, &qword_100010440);
  sub_100009C00();
  swift_release();
  (*(void (**)(char *, uint64_t))(v25 + 8))(v7, v5);
  sub_100007C5C();
  uint64_t v30 = v5;
  uint64_t v31 = (void *)v17;
  swift_getOpaqueTypeConformance2();
  uint64_t v18 = v23;
  uint64_t v19 = v28;
  sub_100009C10();
  (*(void (**)(char *, uint64_t))(v27 + 8))(v10, v19);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v24 + 32))(v29, v18, v26);
}

uint64_t sub_100003BCC@<X0>(char a1@<W0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = sub_100002AE8(&qword_100010468);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin();
  uint64_t v9 = &v18[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v10 = sub_100002AE8(&qword_100010460);
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin();
  uint64_t v13 = &v18[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v19 = a2;
  v18[16] = a1;
  sub_100009CA0();
  if (a1)
  {
    if (qword_1000102F0 != -1) {
      swift_once();
    }
    uint64_t v14 = &qword_1000109F8;
  }
  else
  {
    if (qword_1000102F8 != -1) {
      swift_once();
    }
    uint64_t v14 = &qword_100010A08;
  }
  uint64_t v16 = *v14;
  uint64_t v15 = v14[1];
  swift_bridgeObjectRetain();
  uint64_t v20 = v16;
  uint64_t v21 = v15;
  sub_10000980C(&qword_100010470, &qword_100010468);
  sub_100009850();
  sub_100009C60();
  swift_bridgeObjectRelease();
  (*(void (**)(unsigned char *, uint64_t))(v7 + 8))(v9, v6);
  return (*(uint64_t (**)(uint64_t, unsigned char *, uint64_t))(v11 + 32))(a3, v13, v10);
}

uint64_t sub_100003E88@<X0>(uint64_t a1@<X8>)
{
  sub_100003EE0();
  sub_100009850();
  uint64_t result = sub_100009C50();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = v4 & 1;
  *(void *)(a1 + 24) = v5;
  return result;
}

uint64_t sub_100003EE0()
{
  uint64_t v0 = sub_100009BD0();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin();
  uint64_t v3 = (char *)&v27 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  int v30 = sub_100005F14();
  uint64_t v4 = sub_100005854();
  BOOL v5 = sub_1000050B4();
  char v6 = sub_100007C5C();
  uint64_t v31 = v4;
  BOOL v29 = v5;
  if (v6)
  {
    if (qword_100010308 != -1) {
      swift_once();
    }
    sub_100008EB0(v0, (uint64_t)qword_100010A30);
    uint64_t v7 = sub_100009BB0();
    os_log_type_t v8 = sub_100009D70();
    if (os_log_type_enabled(v7, v8))
    {
      uint64_t v9 = (uint8_t *)swift_slowAlloc();
      v33[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v9 = 136315138;
      uint64_t v34 = sub_100008858(0x656C746974627573, 0xEC00000074786554, v33);
      sub_100009D90();
      _os_log_impl((void *)&_mh_execute_header, v7, v8, "%s: Setting subtitle to OFF due to widgetDisabled'", v9, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    goto LABEL_7;
  }
  if (!v4)
  {
    if (v5)
    {
      if (qword_1000102E0 != -1) {
        swift_once();
      }
      uint64_t v10 = &qword_1000109D8;
      goto LABEL_10;
    }
LABEL_7:
    if (qword_1000102E8 != -1) {
      swift_once();
    }
    uint64_t v10 = &qword_1000109E8;
LABEL_10:
    uint64_t v11 = v10[1];
    uint64_t v34 = *v10;
    unint64_t v35 = v11;
    swift_bridgeObjectRetain();
    goto LABEL_13;
  }
  uint64_t v12 = (objc_class *)[self mainBundle];
  v26._countAndFlagsBits = 0xE000000000000000;
  v36._object = (void *)0x800000010000B5C0;
  v36._countAndFlagsBits = 0xD000000000000013;
  v37.value._countAndFlagsBits = 0;
  v37.value._object = 0;
  v13.super.isa = v12;
  v38._countAndFlagsBits = 0;
  v38._object = (void *)0xE000000000000000;
  sub_100009B40(v36, v37, v13, v38, v26);

  sub_100002AE8(&qword_100010488);
  uint64_t v14 = swift_allocObject();
  *(_OWORD *)(v14 + 16) = xmmword_10000A3A0;
  *(void *)(v14 + 56) = &type metadata for Int;
  *(void *)(v14 + 64) = &protocol witness table for Int;
  *(void *)(v14 + 32) = v4;
  uint64_t v15 = sub_100009D10();
  unint64_t v17 = v16;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v34 = v15;
  unint64_t v35 = v17;
LABEL_13:
  if (qword_100010308 != -1) {
    swift_once();
  }
  uint64_t v18 = sub_100008EB0(v0, (uint64_t)qword_100010A30);
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v3, v18, v0);
  uint64_t v19 = v34;
  unint64_t v20 = v35;
  swift_bridgeObjectRetain_n();
  uint64_t v21 = sub_100009BB0();
  os_log_type_t v22 = sub_100009D70();
  if (os_log_type_enabled(v21, v22))
  {
    uint64_t v23 = swift_slowAlloc();
    uint64_t v24 = swift_slowAlloc();
    uint64_t v28 = v3;
    v33[0] = v24;
    *(_DWORD *)uint64_t v23 = 136316162;
    uint64_t v32 = sub_100008858(0x656C746974627573, 0xEC00000074786554, v33);
    uint64_t v27 = v0;
    sub_100009D90();
    *(_WORD *)(v23 + 12) = 2080;
    swift_bridgeObjectRetain();
    uint64_t v32 = sub_100008858(v19, v20, v33);
    sub_100009D90();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v23 + 22) = 1024;
    LODWORD(v32) = v30;
    sub_100009D90();
    *(_WORD *)(v23 + 28) = 1024;
    LODWORD(v32) = v29;
    sub_100009D90();
    *(_WORD *)(v23 + 34) = 2048;
    uint64_t v32 = v31;
    sub_100009D90();
    _os_log_impl((void *)&_mh_execute_header, v21, v22, "%s: getting subtitle='%s' global service state=%u, getting discoverable state=%{BOOL}d, connectionCount=%ld", (uint8_t *)v23, 0x2Cu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v1 + 8))(v28, v27);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  }
  swift_beginAccess();
  return v34;
}

id sub_1000044EC@<X0>(void *a1@<X8>)
{
  id result = [objc_allocWithZone((Class)type metadata accessor for PersonalHotspotStateProvider()) init];
  *a1 = result;
  return result;
}

uint64_t sub_100004524@<X0>(uint64_t a1@<X8>)
{
  return sub_100003380(*v1, a1);
}

uint64_t sub_10000452C()
{
  uint64_t v0 = sub_100009B70();
  sub_100008F98(v0, qword_100010A18);
  sub_100008EB0(v0, (uint64_t)qword_100010A18);
  return sub_100009B50();
}

uint64_t sub_100004590(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[4] = a2;
  v3[5] = a3;
  v3[3] = a1;
  return _swift_task_switch(sub_1000045B4, 0, 0);
}

uint64_t sub_1000045B4()
{
  uint64_t v12 = v0;
  if (sub_100007C5C())
  {
    if (qword_100010308 != -1) {
      swift_once();
    }
    uint64_t v1 = sub_100009BD0();
    sub_100008EB0(v1, (uint64_t)qword_100010A30);
    uint64_t v2 = sub_100009BB0();
    os_log_type_t v3 = sub_100009D70();
    if (os_log_type_enabled(v2, v3))
    {
      uint64_t v4 = (uint8_t *)swift_slowAlloc();
      uint64_t v11 = swift_slowAlloc();
      *(_DWORD *)uint64_t v4 = 136315138;
      *(void *)(v0 + 16) = sub_100008858(0x286D726F66726570, 0xE900000000000029, &v11);
      sub_100009D90();
      _os_log_impl((void *)&_mh_execute_header, v2, v3, "%s: Suppressing PH toggle because widget is disabled", v4, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
  }
  else
  {
    if (qword_100010308 != -1) {
      swift_once();
    }
    uint64_t v5 = sub_100009BD0();
    sub_100008EB0(v5, (uint64_t)qword_100010A30);
    char v6 = sub_100009BB0();
    os_log_type_t v7 = sub_100009D70();
    if (os_log_type_enabled(v6, v7))
    {
      os_log_type_t v8 = (uint8_t *)swift_slowAlloc();
      uint64_t v11 = swift_slowAlloc();
      *(_DWORD *)os_log_type_t v8 = 136315138;
      *(void *)(v0 + 16) = sub_100008858(0x286D726F66726570, 0xE900000000000029, &v11);
      sub_100009D90();
      _os_log_impl((void *)&_mh_execute_header, v6, v7, "%s: Toggled PH mode", v8, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    sub_100009B00();
    sub_1000067AC();
  }
  sub_100009AE0();
  uint64_t v9 = *(uint64_t (**)(void))(v0 + 8);
  return v9();
}

uint64_t sub_1000048C8@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_100009B00();
  *a1 = v3;
  return result;
}

uint64_t sub_100004904()
{
  return sub_100009B10();
}

void (*sub_10000493C(void *a1))(void *a1)
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_100009AF0();
  return sub_100004998;
}

void sub_100004998(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void, void))(*a1 + 32))(*a1, 0);

  free(v1);
}

unint64_t sub_1000049E8()
{
  unint64_t result = qword_100010350;
  if (!qword_100010350)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010350);
  }
  return result;
}

unint64_t sub_100004A40()
{
  unint64_t result = qword_100010358;
  if (!qword_100010358)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010358);
  }
  return result;
}

uint64_t sub_100004A94()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100004AB0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100004B00@<X0>(uint64_t a1@<X8>)
{
  if (qword_100010300 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100009B70();
  uint64_t v3 = sub_100008EB0(v2, (uint64_t)qword_100010A18);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

uint64_t sub_100004BBC(uint64_t a1)
{
  uint64_t v4 = swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *(void *)uint64_t v4 = v2;
  *(void *)(v4 + 8) = sub_100004C70;
  *(_OWORD *)(v4 + 32) = *v1;
  *(void *)(v4 + 24) = a1;
  return _swift_task_switch(sub_1000045B4, 0, 0);
}

uint64_t sub_100004C70()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_100004D64@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1000091EC();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_100004D8C(uint64_t a1)
{
  unint64_t v2 = sub_100002CA4();

  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

uint64_t sub_100004DC8()
{
  uint64_t v1 = (unsigned char *)(v0
               + OBJC_IVAR____TtC31PersonalHotspotControlExtension28PersonalHotspotStateProvider____lazy_storage___misClient);
  if (*(unsigned char *)(v0
                + OBJC_IVAR____TtC31PersonalHotspotControlExtension28PersonalHotspotStateProvider____lazy_storage___misClient
                + 8) != 1)
    return *(void *)v1;
  sub_1000091B0(0, &qword_1000103E8);
  unint64_t v2 = (void *)sub_100009D80();
  v6[4] = sub_100004EC8;
  v6[5] = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 1107296256;
  v6[2] = sub_100004ED0;
  v6[3] = &unk_10000C978;
  uint64_t v3 = _Block_copy(v6);
  uint64_t v4 = _NETRBClientCreate();
  _Block_release(v3);

  *(void *)uint64_t v1 = v4;
  v1[8] = 0;
  return v4;
}

uint64_t sub_100004EC8()
{
  return 0;
}

uint64_t sub_100004ED0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t))(a1 + 32);
  swift_retain();
  swift_unknownObjectRetain();
  uint64_t v6 = v5(a2, a3);
  swift_release();
  swift_unknownObjectRelease();
  return v6;
}

uint64_t sub_100004F3C()
{
  uint64_t v1 = (unsigned char *)(v0
               + OBJC_IVAR____TtC31PersonalHotspotControlExtension28PersonalHotspotStateProvider____lazy_storage___wifiClient);
  if (*(unsigned char *)(v0
                + OBJC_IVAR____TtC31PersonalHotspotControlExtension28PersonalHotspotStateProvider____lazy_storage___wifiClient
                + 8) != 1)
    return *(void *)v1;
  uint64_t result = WiFiManagerClientCreate();
  *(void *)uint64_t v1 = result;
  v1[8] = 0;
  return result;
}

uint64_t sub_100004F8C()
{
  uint64_t v1 = (unsigned char *)(v0
               + OBJC_IVAR____TtC31PersonalHotspotControlExtension28PersonalHotspotStateProvider____lazy_storage___cellularClient);
  if (*(unsigned char *)(v0
                + OBJC_IVAR____TtC31PersonalHotspotControlExtension28PersonalHotspotStateProvider____lazy_storage___cellularClient
                + 8) != 1)
    return *(void *)v1;
  NSString v2 = sub_100009D00();
  uint64_t v3 = _CTServerConnectionCreateWithIdentifier();

  *(void *)uint64_t v1 = v3;
  v1[8] = 0;
  return v3;
}

id sub_100005018()
{
  if (sub_100004DC8())
  {
    _NETRBClientDestroy();
    uint64_t v1 = &v0[OBJC_IVAR____TtC31PersonalHotspotControlExtension28PersonalHotspotStateProvider____lazy_storage___misClient];
    *(void *)uint64_t v1 = 0;
    v1[8] = 0;
  }
  if (sub_100004F3C())
  {
    swift_unknownObjectRelease();
    NSString v2 = &v0[OBJC_IVAR____TtC31PersonalHotspotControlExtension28PersonalHotspotStateProvider____lazy_storage___wifiClient];
    *(void *)NSString v2 = 0;
    v2[8] = 0;
  }
  v4.receiver = v0;
  v4.super_class = (Class)type metadata accessor for PersonalHotspotStateProvider();
  return objc_msgSendSuper2(&v4, "dealloc");
}

BOOL sub_1000050B4()
{
  uint64_t v0 = sub_100009BD0();
  uint64_t v18 = *(void *)(v0 - 8);
  __chkstk_darwin();
  NSString v2 = (char *)&v16 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  BOOL v21 = 0;
  if (qword_100010308 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_100008EB0(v0, (uint64_t)qword_100010A30);
  objc_super v4 = sub_100009BB0();
  os_log_type_t v5 = sub_100009D70();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    v20[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v6 = 136315138;
    uint64_t v19 = sub_100008858(0x745353494D746567, 0xED00002928657461, v20);
    sub_100009D90();
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "%s: start querying MIS state", v6, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  if (sub_100004F3C())
  {
    BOOL v21 = WiFiManagerClientGetMISDiscoveryState() != 0;
  }
  else
  {
    os_log_type_t v7 = sub_100009BB0();
    os_log_type_t v8 = sub_100009D60();
    if (os_log_type_enabled(v7, v8))
    {
      uint64_t v9 = (uint8_t *)swift_slowAlloc();
      v20[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v9 = 136315138;
      uint64_t v19 = sub_100008858(0x745353494D746567, 0xED00002928657461, v20);
      sub_100009D90();
      _os_log_impl((void *)&_mh_execute_header, v7, v8, "%s: failed to get wifiClient", v9, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
  }
  (*(void (**)(char *, uint64_t, uint64_t))(v18 + 16))(v2, v3, v0);
  BOOL v10 = v21;
  uint64_t v11 = sub_100009BB0();
  os_log_type_t v12 = sub_100009D70();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = swift_slowAlloc();
    v20[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v13 = 136315394;
    uint64_t v19 = sub_100008858(0x745353494D746567, 0xED00002928657461, v20);
    uint64_t v14 = v18;
    unint64_t v17 = v2;
    sub_100009D90();
    *(_WORD *)(v13 + 12) = 1024;
    LODWORD(v19) = v10;
    sub_100009D90();
    _os_log_impl((void *)&_mh_execute_header, v11, v12, "%s: MIS state=%{BOOL}d", (uint8_t *)v13, 0x12u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v14 + 8))(v17, v0);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v18 + 8))(v2, v0);
  }
  swift_beginAccess();
  return v21;
}

void sub_10000558C()
{
  if (qword_100010308 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_100009BD0();
  sub_100008EB0(v0, (uint64_t)qword_100010A30);
  uint64_t v1 = sub_100009BB0();
  os_log_type_t v2 = sub_100009D70();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = swift_slowAlloc();
    uint64_t v7 = swift_slowAlloc();
    *(_DWORD *)uint64_t v3 = 136315394;
    sub_100008858(0xD000000000000027, 0x800000010000B3F0, &v7);
    sub_100009D90();
    *(_WORD *)(v3 + 12) = 1024;
    sub_100009D90();
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "%s: setting MIS state to='%{BOOL}d'", (uint8_t *)v3, 0x12u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  if (sub_100004F3C())
  {
    WiFiManagerClientSetMISDiscoveryState();
  }
  else
  {
    objc_super v4 = sub_100009BB0();
    os_log_type_t v5 = sub_100009D60();
    if (os_log_type_enabled(v4, v5))
    {
      uint64_t v6 = (uint8_t *)swift_slowAlloc();
      uint64_t v7 = swift_slowAlloc();
      *(_DWORD *)uint64_t v6 = 136315138;
      sub_100008858(0xD000000000000027, 0x800000010000B3F0, &v7);
      sub_100009D90();
      _os_log_impl((void *)&_mh_execute_header, v4, v5, "%s: failed to get wifiClient", v6, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
  }
}

uint64_t sub_100005854()
{
  if (qword_100010308 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_100009BD0();
  sub_100008EB0(v0, (uint64_t)qword_100010A30);
  uint64_t v1 = sub_100009BB0();
  os_log_type_t v2 = sub_100009D70();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    v11[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v3 = 136315138;
    sub_100008858(0xD000000000000014, 0x800000010000B3D0, v11);
    sub_100009D90();
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "%s: start querying connection count", v3, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  if (sub_100004DC8())
  {
    LODWORD(v11[0]) = 0;
    _NETRBClientGetHostCount();
  }
  else
  {
    objc_super v4 = sub_100009BB0();
    os_log_type_t v5 = sub_100009D60();
    if (os_log_type_enabled(v4, v5))
    {
      uint64_t v6 = (uint8_t *)swift_slowAlloc();
      v11[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v6 = 136315138;
      sub_100008858(0xD000000000000014, 0x800000010000B3D0, v11);
      sub_100009D90();
      _os_log_impl((void *)&_mh_execute_header, v4, v5, "%s: fail to create NETRBClient", v6, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
  }
  uint64_t v7 = sub_100009BB0();
  os_log_type_t v8 = sub_100009D70();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = swift_slowAlloc();
    v11[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v9 = 136315394;
    sub_100008858(0xD000000000000014, 0x800000010000B3D0, v11);
    sub_100009D90();
    *(_WORD *)(v9 + 12) = 1024;
    swift_beginAccess();
    sub_100009D90();
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "%s: updating connections count=%u", (uint8_t *)v9, 0x12u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  swift_beginAccess();
  return 0;
}

void sub_100005C58()
{
  if (qword_100010308 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_100009BD0();
  sub_100008EB0(v0, (uint64_t)qword_100010A30);
  uint64_t v1 = sub_100009BB0();
  os_log_type_t v2 = sub_100009D70();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = swift_slowAlloc();
    uint64_t v7 = swift_slowAlloc();
    *(_DWORD *)uint64_t v3 = 136315394;
    sub_100008858(0xD000000000000020, 0x800000010000B3A0, &v7);
    sub_100009D90();
    *(_WORD *)(v3 + 12) = 1024;
    sub_100009D90();
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "%s: setting global service state to='%u'", (uint8_t *)v3, 0x12u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  if (sub_100004DC8())
  {
    _NETRBClientSetGlobalServiceState();
  }
  else
  {
    objc_super v4 = sub_100009BB0();
    os_log_type_t v5 = sub_100009D60();
    if (os_log_type_enabled(v4, v5))
    {
      uint64_t v6 = (uint8_t *)swift_slowAlloc();
      uint64_t v7 = swift_slowAlloc();
      *(_DWORD *)uint64_t v6 = 136315138;
      sub_100008858(0xD000000000000020, 0x800000010000B3A0, &v7);
      sub_100009D90();
      _os_log_impl((void *)&_mh_execute_header, v4, v5, "%s: fail to create NETRBClient", v6, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
  }
}

uint64_t sub_100005F14()
{
  if (sub_100004DC8())
  {
    _NETRBClientGetGlobalServiceState();
  }
  else
  {
    if (qword_100010308 != -1) {
      swift_once();
    }
    uint64_t v0 = sub_100009BD0();
    sub_100008EB0(v0, (uint64_t)qword_100010A30);
    uint64_t v1 = sub_100009BB0();
    os_log_type_t v2 = sub_100009D60();
    if (os_log_type_enabled(v1, v2))
    {
      uint64_t v3 = (uint8_t *)swift_slowAlloc();
      v9[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v3 = 136315138;
      sub_100008858(0xD000000000000017, 0x800000010000B380, v9);
      sub_100009D90();
      _os_log_impl((void *)&_mh_execute_header, v1, v2, "%s: fail to create NETRBClient", v3, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
  }
  if (qword_100010308 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_100009BD0();
  sub_100008EB0(v4, (uint64_t)qword_100010A30);
  os_log_type_t v5 = sub_100009BB0();
  os_log_type_t v6 = sub_100009D70();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = swift_slowAlloc();
    v9[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 136315650;
    sub_100008858(0xD000000000000017, 0x800000010000B380, v9);
    sub_100009D90();
    *(_WORD *)(v7 + 12) = 1024;
    swift_beginAccess();
    sub_100009D90();
    *(_WORD *)(v7 + 18) = 1024;
    swift_beginAccess();
    sub_100009D90();
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "%s: current global service state=%u, reason=%u", (uint8_t *)v7, 0x18u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  swift_beginAccess();
  return 1022;
}

uint64_t sub_1000062A4()
{
  v1[5] = v0;
  uint64_t v2 = sub_100009BD0();
  v1[6] = v2;
  v1[7] = *(void *)(v2 - 8);
  v1[8] = swift_task_alloc();
  return _swift_task_switch(sub_100006364, 0, 0);
}

uint64_t sub_100006364()
{
  uint64_t v23 = v0;
  if (sub_100007C5C())
  {
    if (qword_100010308 != -1) {
      swift_once();
    }
    sub_100008EB0(*(void *)(v0 + 48), (uint64_t)qword_100010A30);
    uint64_t v1 = sub_100009BB0();
    os_log_type_t v2 = sub_100009D70();
    if (os_log_type_enabled(v1, v2))
    {
      uint64_t v3 = (uint8_t *)swift_slowAlloc();
      uint64_t v22 = swift_slowAlloc();
      *(_DWORD *)uint64_t v3 = 136315138;
      *(void *)(v0 + 32) = sub_100008858(0x56746E6572727563, 0xEE00292865756C61, &v22);
      sub_100009D90();
      _os_log_impl((void *)&_mh_execute_header, v1, v2, "%s: returning false due to widgetDisabled", v3, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    uint64_t v4 = 0;
  }
  else
  {
    BOOL v5 = sub_1000050B4();
    unsigned int v6 = sub_100005F14();
    uint64_t v7 = sub_100005854();
    if (qword_100010308 != -1) {
      swift_once();
    }
    uint64_t v8 = *(void *)(v0 + 56);
    uint64_t v9 = *(void *)(v0 + 64);
    uint64_t v10 = *(void *)(v0 + 48);
    uint64_t v11 = sub_100008EB0(v10, (uint64_t)qword_100010A30);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))(v9, v11, v10);
    os_log_type_t v12 = sub_100009BB0();
    os_log_type_t v13 = sub_100009D70();
    BOOL v14 = os_log_type_enabled(v12, v13);
    uint64_t v15 = *(void *)(v0 + 56);
    uint64_t v16 = *(void *)(v0 + 64);
    uint64_t v17 = *(void *)(v0 + 48);
    if (v14)
    {
      uint64_t v18 = swift_slowAlloc();
      uint64_t v22 = swift_slowAlloc();
      *(_DWORD *)uint64_t v18 = 136315906;
      *(void *)(v0 + 16) = sub_100008858(0x56746E6572727563, 0xEE00292865756C61, &v22);
      sub_100009D90();
      *(_WORD *)(v18 + 12) = 1024;
      *(_DWORD *)(v0 + 72) = v6;
      sub_100009D90();
      *(_WORD *)(v18 + 18) = 1024;
      *(_DWORD *)(v0 + 76) = v5;
      sub_100009D90();
      *(_WORD *)(v18 + 24) = 2048;
      *(void *)(v0 + 24) = v7;
      sub_100009D90();
      _os_log_impl((void *)&_mh_execute_header, v12, v13, "%s: getting global service state=%u, MIS discovery state=%{BOOL}d, connectionCount=%ld", (uint8_t *)v18, 0x22u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v16, v17);
    }
    else
    {

      (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v16, v17);
    }
    if (v5) {
      unsigned int v19 = 2;
    }
    else {
      unsigned int v19 = 1;
    }
    if (v7) {
      unsigned int v19 = 3;
    }
    if (v6 >= 0x3FE) {
      uint64_t v4 = v19;
    }
    else {
      uint64_t v4 = 0;
    }
  }
  swift_task_dealloc();
  unint64_t v20 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v20(v4);
}

void sub_1000067AC()
{
  int v0 = sub_100005F14();
  if (qword_100010308 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_100009BD0();
  sub_100008EB0(v1, (uint64_t)qword_100010A30);
  os_log_type_t v2 = sub_100009BB0();
  os_log_type_t v3 = sub_100009D70();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = swift_slowAlloc();
    aBlock[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v4 = 136315394;
    sub_100008858(0xD000000000000018, 0x800000010000B340, aBlock);
    sub_100009D90();
    *(_WORD *)(v4 + 12) = 1024;
    sub_100009D90();
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "%s: global service state=%u", (uint8_t *)v4, 0x12u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  if (v0 != 1023)
  {
    BOOL v5 = sub_100009BB0();
    os_log_type_t v6 = sub_100009D70();
    if (os_log_type_enabled(v5, v6))
    {
      uint64_t v7 = (uint8_t *)swift_slowAlloc();
      aBlock[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v7 = 136315138;
      sub_100008858(0xD000000000000018, 0x800000010000B340, aBlock);
      sub_100009D90();
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "%s: setting GlobalServiceState to ON", v7, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    sub_100005C58();
  }
  uint64_t v8 = sub_100005854();
  uint64_t v9 = sub_100009BB0();
  os_log_type_t v10 = sub_100009D70();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = swift_slowAlloc();
    aBlock[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v11 = 136315394;
    sub_100008858(0xD000000000000018, 0x800000010000B340, aBlock);
    sub_100009D90();
    *(_WORD *)(v11 + 12) = 2048;
    sub_100009D90();
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "%s: connections count: %ld when user toggles widget", (uint8_t *)v11, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  if (v8)
  {
    os_log_type_t v12 = sub_100009BB0();
    os_log_type_t v13 = sub_100009D70();
    if (os_log_type_enabled(v12, v13))
    {
      BOOL v14 = (uint8_t *)swift_slowAlloc();
      aBlock[0] = swift_slowAlloc();
      *(_DWORD *)BOOL v14 = 136315138;
      sub_100008858(0xD000000000000018, 0x800000010000B340, aBlock);
      sub_100009D90();
      _os_log_impl((void *)&_mh_execute_header, v12, v13, "%s: Stopping hotspot service", v14, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    sub_100005C58();
  }
  BOOL v15 = sub_1000050B4();
  uint64_t v16 = sub_100009BB0();
  os_log_type_t v17 = sub_100009D70();
  BOOL v18 = os_log_type_enabled(v16, v17);
  if (v15)
  {
    if (v18)
    {
      unsigned int v19 = (uint8_t *)swift_slowAlloc();
      aBlock[0] = swift_slowAlloc();
      *(_DWORD *)unsigned int v19 = 136315138;
      sub_100008858(0xD000000000000018, 0x800000010000B340, aBlock);
      sub_100009D90();
      _os_log_impl((void *)&_mh_execute_header, v16, v17, "%s: Shutting down hotspot discoverability immediately", v19, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    sub_10000558C();
    unint64_t v20 = 0xE300000000000000;
    uint64_t v21 = 6710895;
    if (v8) {
LABEL_19:
    }
      swift_bridgeObjectRelease();
  }
  else
  {
    if (v18)
    {
      uint64_t v25 = (uint8_t *)swift_slowAlloc();
      aBlock[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v25 = 136315138;
      sub_100008858(0xD000000000000018, 0x800000010000B340, aBlock);
      sub_100009D90();
      _os_log_impl((void *)&_mh_execute_header, v16, v17, "%s: Starting hotspot discoverability", v25, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    sub_10000558C();
    unint64_t v20 = 0xE200000000000000;
    uint64_t v21 = 28271;
    if (v8) {
      goto LABEL_19;
    }
  }
  NSString v22 = sub_100009D00();
  uint64_t v23 = swift_allocObject();
  *(void *)(v23 + 16) = v21;
  *(void *)(v23 + 24) = v20;
  aBlock[4] = (uint64_t)sub_100009034;
  aBlock[5] = v23;
  aBlock[0] = (uint64_t)_NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_10000873C;
  aBlock[3] = (uint64_t)&unk_10000C950;
  uint64_t v24 = _Block_copy(aBlock);
  swift_bridgeObjectRetain();
  swift_release();
  AnalyticsSendEventLazy();
  _Block_release(v24);
  swift_bridgeObjectRelease();
}

uint64_t sub_100006FA4()
{
  if (sub_100004DC8())
  {
    _NETRBClientGetGlobalServiceState();
  }
  else
  {
    if (qword_100010308 != -1) {
      swift_once();
    }
    uint64_t v0 = sub_100009BD0();
    sub_100008EB0(v0, (uint64_t)qword_100010A30);
    uint64_t v1 = sub_100009BB0();
    os_log_type_t v2 = sub_100009D60();
    if (os_log_type_enabled(v1, v2))
    {
      os_log_type_t v3 = (uint8_t *)swift_slowAlloc();
      v10[0] = swift_slowAlloc();
      *(_DWORD *)os_log_type_t v3 = 136315138;
      uint64_t v9 = sub_100008858(0xD000000000000011, 0x800000010000B2E0, v10);
      sub_100009D90();
      _os_log_impl((void *)&_mh_execute_header, v1, v2, "%s: fail to create NETRBClient", v3, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
  }
  if (qword_100010308 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_100009BD0();
  sub_100008EB0(v4, (uint64_t)qword_100010A30);
  BOOL v5 = sub_100009BB0();
  os_log_type_t v6 = sub_100009D70();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = swift_slowAlloc();
    v10[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 136315650;
    HIDWORD(v9) = (unint64_t)sub_100008858(0xD000000000000011, 0x800000010000B2E0, v10) >> 32;
    sub_100009D90();
    *(_WORD *)(v7 + 12) = 1024;
    swift_beginAccess();
    sub_100009D90();
    *(_WORD *)(v7 + 18) = 1024;
    swift_beginAccess();
    LODWORD(v9) = 0;
    sub_100009D90();
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "%s: current global service state=%u, reason=%u", (uint8_t *)v7, 0x18u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  swift_beginAccess();
  swift_beginAccess();
  return 0;
}

uint64_t sub_100007490()
{
  if (qword_100010308 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_100009BD0();
  sub_100008EB0(v0, (uint64_t)qword_100010A30);
  uint64_t v1 = sub_100009BB0();
  os_log_type_t v2 = sub_100009D70();
  if (os_log_type_enabled(v1, v2))
  {
    os_log_type_t v3 = (uint8_t *)swift_slowAlloc();
    uint64_t v11 = swift_slowAlloc();
    *(_DWORD *)os_log_type_t v3 = 136315138;
    sub_100008858(0xD000000000000018, 0x800000010000B2C0, &v11);
    sub_100009D90();
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "%s: start querying PH allow modification capability.", v3, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  if (!sub_100004F3C())
  {
    BOOL v5 = sub_100009BB0();
    os_log_type_t v8 = sub_100009D60();
    if (!os_log_type_enabled(v5, v8))
    {

      return 1;
    }
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    uint64_t v11 = swift_slowAlloc();
    *(_DWORD *)uint64_t v9 = 136315138;
    sub_100008858(0xD000000000000018, 0x800000010000B2C0, &v11);
    sub_100009D90();
    _os_log_impl((void *)&_mh_execute_header, v5, v8, "%s: failed to get wifiClient", v9, 0xCu);
    BOOL v4 = 1;
    swift_arrayDestroy();
    goto LABEL_10;
  }
  BOOL v4 = WiFiManagerClientIsPersonalHotspotModificationDisabled() != 0;
  BOOL v5 = sub_100009BB0();
  os_log_type_t v6 = sub_100009D70();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = swift_slowAlloc();
    uint64_t v11 = swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 136315394;
    sub_100008858(0xD000000000000018, 0x800000010000B2C0, &v11);
    sub_100009D90();
    *(_WORD *)(v7 + 12) = 1024;
    sub_100009D90();
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "%s: getting PH allow modification capability: %{BOOL}d", (uint8_t *)v7, 0x12u);
    swift_arrayDestroy();
LABEL_10:
    swift_slowDealloc();
    swift_slowDealloc();
  }

  return v4;
}

uint64_t sub_100007840()
{
  if (sub_100004F8C())
  {
    _CTServerConnectionGetCellularDataSettings();
  }
  else
  {
    if (qword_100010308 != -1) {
      swift_once();
    }
    uint64_t v0 = sub_100009BD0();
    sub_100008EB0(v0, (uint64_t)qword_100010A30);
    uint64_t v1 = sub_100009BB0();
    os_log_type_t v2 = sub_100009D60();
    if (os_log_type_enabled(v1, v2))
    {
      os_log_type_t v3 = (uint8_t *)swift_slowAlloc();
      v9[0] = swift_slowAlloc();
      *(_DWORD *)os_log_type_t v3 = 136315138;
      sub_100008858(0xD000000000000015, 0x800000010000B2A0, v9);
      sub_100009D90();
      _os_log_impl((void *)&_mh_execute_header, v1, v2, "%s: failed to get cellular connection", v3, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
  }
  if (qword_100010308 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_100009BD0();
  sub_100008EB0(v4, (uint64_t)qword_100010A30);
  BOOL v5 = sub_100009BB0();
  os_log_type_t v6 = sub_100009D60();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = swift_slowAlloc();
    v9[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 136315906;
    sub_100008858(0xD000000000000015, 0x800000010000B2A0, v9);
    sub_100009D90();
    *(_WORD *)(v7 + 12) = 1024;
    swift_beginAccess();
    sub_100009D90();
    *(_WORD *)(v7 + 18) = 1024;
    swift_beginAccess();
    sub_100009D90();
    *(_WORD *)(v7 + 24) = 1024;
    swift_beginAccess();
    sub_100009D90();
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "%s: cellular states: capable:%{BOOL}d, enabled: %{BOOL}d, airplaneMode: %{BOOL}d", (uint8_t *)v7, 0x1Eu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  swift_beginAccess();
  return 0;
}

uint64_t sub_100007C5C()
{
  if (sub_100004F3C())
  {
    char v0 = sub_100007490();
    char v1 = v0 | sub_100006FA4();
    if (qword_100010308 != -1) {
      swift_once();
    }
    uint64_t v2 = sub_100009BD0();
    sub_100008EB0(v2, (uint64_t)qword_100010A30);
    os_log_type_t v3 = sub_100009BB0();
    os_log_type_t v4 = sub_100009D70();
    if (!os_log_type_enabled(v3, v4)) {
      goto LABEL_11;
    }
    uint64_t v5 = swift_slowAlloc();
    uint64_t v10 = swift_slowAlloc();
    *(_DWORD *)uint64_t v5 = 136315906;
    sub_100008858(0xD000000000000010, 0x800000010000B010, &v10);
    sub_100009D90();
    *(_WORD *)(v5 + 12) = 1024;
    sub_100009D90();
    *(_WORD *)(v5 + 18) = 1024;
    sub_100009D90();
    *(_WORD *)(v5 + 24) = 1024;
    sub_100009D90();
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "%s: widget disabled=%{BOOL}d, phModificationDisabled=%{BOOL}d, phIsInoperative=%{BOOL}d", (uint8_t *)v5, 0x1Eu);
    swift_arrayDestroy();
  }
  else
  {
    if (qword_100010308 != -1) {
      swift_once();
    }
    uint64_t v6 = sub_100009BD0();
    sub_100008EB0(v6, (uint64_t)qword_100010A30);
    os_log_type_t v3 = sub_100009BB0();
    os_log_type_t v7 = sub_100009D60();
    if (!os_log_type_enabled(v3, v7))
    {

      char v1 = 1;
      return v1 & 1;
    }
    os_log_type_t v8 = (uint8_t *)swift_slowAlloc();
    uint64_t v10 = swift_slowAlloc();
    *(_DWORD *)os_log_type_t v8 = 136315138;
    sub_100008858(0xD000000000000010, 0x800000010000B010, &v10);
    sub_100009D90();
    _os_log_impl((void *)&_mh_execute_header, v3, v7, "%s: failed to get wifiClient, defaulting to widget disabled", v8, 0xCu);
    char v1 = 1;
    swift_arrayDestroy();
  }
  swift_slowDealloc();
  swift_slowDealloc();
LABEL_11:

  return v1 & 1;
}

uint64_t type metadata accessor for PersonalHotspotStateProvider()
{
  return self;
}

void *initializeBufferWithCopyOfBuffer for SetPersonalHotspotIntent(void *a1, void *a2)
{
  os_log_type_t v3 = (void *)a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  id v4 = v3;
  return a1;
}

void destroy for SetPersonalHotspotIntent(uint64_t a1)
{
  swift_release();
  uint64_t v2 = *(void **)(a1 + 8);
}

void *assignWithCopy for SetPersonalHotspotIntent(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  id v4 = (void *)a2[1];
  uint64_t v5 = (void *)a1[1];
  a1[1] = v4;
  id v6 = v4;

  return a1;
}

__n128 initializeWithTake for SetPersonalHotspotIntent(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t assignWithTake for SetPersonalHotspotIntent(uint64_t a1, _OWORD *a2)
{
  swift_release();
  id v4 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *a2;

  return a1;
}

uint64_t getEnumTagSinglePayload for SetPersonalHotspotIntent(uint64_t *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for SetPersonalHotspotIntent(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for SetPersonalHotspotIntent()
{
  return &type metadata for SetPersonalHotspotIntent;
}

uint64_t sub_1000081E4()
{
  return sub_10000980C(&qword_1000103B0, (uint64_t *)&unk_1000103B8);
}

void sub_100008220(unsigned char *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_10000822C(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 24) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_1000082C0;
  return sub_1000062A4();
}

uint64_t sub_1000082C0(char a1)
{
  uint64_t v4 = *v2;
  uint64_t v5 = *v2;
  swift_task_dealloc();
  if (!v1) {
    **(unsigned char **)(v4 + 16) = a1;
  }
  id v6 = *(uint64_t (**)(void))(v5 + 8);
  return v6();
}

unint64_t sub_1000083D0()
{
  sub_100002AE8(&qword_1000103D8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_10000A3B0;
  id v1 = objc_allocWithZone((Class)NSString);
  NSString v2 = sub_100009D00();
  id v3 = [v1 initWithString:v2];

  uint64_t v4 = sub_100009D20();
  uint64_t v6 = v5;

  *(void *)(inited + 32) = v4;
  *(void *)(inited + 40) = v6;
  id v7 = objc_allocWithZone((Class)NSString);
  swift_bridgeObjectRetain();
  NSString v8 = sub_100009D00();
  swift_bridgeObjectRelease();
  id v9 = [v7 initWithString:v8];

  *(void *)(inited + 48) = v9;
  id v10 = objc_allocWithZone((Class)NSString);
  NSString v11 = sub_100009D00();
  id v12 = [v10 initWithString:v11];

  uint64_t v13 = sub_100009D20();
  uint64_t v15 = v14;

  *(void *)(inited + 56) = v13;
  *(void *)(inited + 64) = v15;
  id v16 = objc_allocWithZone((Class)NSString);
  NSString v17 = sub_100009D00();
  id v18 = [v16 initWithString:v17];

  *(void *)(inited + 72) = v18;
  id v19 = objc_allocWithZone((Class)NSString);
  NSString v20 = sub_100009D00();
  id v21 = [v19 initWithString:v20];

  uint64_t v22 = sub_100009D20();
  uint64_t v24 = v23;

  *(void *)(inited + 80) = v22;
  *(void *)(inited + 88) = v24;
  id v25 = objc_allocWithZone((Class)NSString);
  NSString v26 = sub_100009D00();
  id v27 = [v25 initWithString:v26];

  *(void *)(inited + 96) = v27;
  return sub_100008620(inited);
}

unint64_t sub_100008620(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    NSString v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100002AE8(&qword_1000103E0);
  NSString v2 = (void *)sub_100009DE0();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (void **)(a1 + 48);
  while (1)
  {
    uint64_t v5 = (uint64_t)*(v4 - 2);
    uint64_t v6 = (uint64_t)*(v4 - 1);
    id v7 = *v4;
    swift_bridgeObjectRetain();
    id v8 = v7;
    unint64_t result = sub_100009054(v5, v6);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    NSString v11 = (uint64_t *)(v2[6] + 16 * result);
    *NSString v11 = v5;
    v11[1] = v6;
    *(void *)(v2[7] + 8 * result) = v8;
    uint64_t v12 = v2[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v2[2] = v14;
    v4 += 3;
    if (!--v3)
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

Class sub_10000873C(uint64_t a1)
{
  id v1 = *(uint64_t (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  uint64_t v3 = v1(v2);
  swift_release();
  if (v3)
  {
    sub_1000091B0(0, &qword_1000103D0);
    v4.super.isa = sub_100009CD0().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v4.super.isa = 0;
  }

  return v4.super.isa;
}

uint64_t sub_1000087D8()
{
  uint64_t v0 = sub_100009BD0();
  sub_100008F98(v0, qword_100010A30);
  sub_100008EB0(v0, (uint64_t)qword_100010A30);
  return sub_100009BC0();
}

uint64_t sub_100008858(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_10000892C(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_100008F38((uint64_t)v12, *a3);
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
      sub_100008F38((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_100008EE8((uint64_t)v12);
  return v7;
}

uint64_t sub_10000892C(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_100009DA0();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_100008AE8(a5, a6);
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
  uint64_t v8 = sub_100009DC0();
  if (!v8)
  {
    sub_100009DD0();
    __break(1u);
LABEL_17:
    uint64_t result = sub_100009DF0();
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

uint64_t sub_100008AE8(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_100008B80(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_100008D60(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_100008D60(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_100008B80(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_100008CF8(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_100009DB0();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_100009DD0();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_100009D40();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_100009DF0();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_100009DD0();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_100008CF8(uint64_t a1, uint64_t a2)
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
  sub_100002AE8(&qword_1000103C8);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_100008D60(char a1, int64_t a2, char a3, char *a4)
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
    sub_100002AE8(&qword_1000103C8);
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
  BOOL v13 = a4 + 32;
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
  uint64_t result = sub_100009DF0();
  __break(1u);
  return result;
}

uint64_t sub_100008EB0(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_100008EE8(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_100008F38(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t *sub_100008F98(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_100008FFC()
{
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 32, 7);
}

unint64_t sub_100009034()
{
  return sub_1000083D0();
}

uint64_t sub_10000903C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10000904C()
{
  return swift_release();
}

unint64_t sub_100009054(uint64_t a1, uint64_t a2)
{
  sub_100009E10();
  sub_100009D30();
  Swift::Int v4 = sub_100009E30();

  return sub_1000090CC(a1, a2, v4);
}

unint64_t sub_1000090CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_100009E00() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        BOOL v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_100009E00() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_1000091B0(uint64_t a1, unint64_t *a2)
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

uint64_t sub_1000091EC()
{
  uint64_t v0 = sub_100009B30();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin();
  uint64_t v3 = &v16[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_100002AE8(&qword_1000103F0);
  __chkstk_darwin();
  uint64_t v5 = &v16[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_100002AE8(&qword_1000103F8);
  __chkstk_darwin();
  int64_t v7 = &v16[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_100002AE8(&qword_100010400);
  __chkstk_darwin();
  uint64_t v9 = &v16[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v10 = sub_100009B70();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin();
  sub_100002AE8(&qword_100010408);
  sub_100009B50();
  (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(v11 + 56))(v9, 1, 1, v10);
  v16[15] = 2;
  uint64_t v12 = sub_100009D50();
  (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v7, 1, 1, v12);
  uint64_t v13 = sub_100009AD0();
  (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v5, 1, 1, v13);
  (*(void (**)(unsigned char *, void, uint64_t))(v1 + 104))(v3, enum case for InputConnectionBehavior.default(_:), v0);
  uint64_t v14 = sub_100009B20();
  [objc_allocWithZone((Class)type metadata accessor for PersonalHotspotStateProvider()) init];
  return v14;
}

ValueMetadata *type metadata accessor for PersonalHotspotControl()
{
  return &type metadata for PersonalHotspotControl;
}

unsigned char *initializeBufferWithCopyOfBuffer for PersonalHotspotState(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for PersonalHotspotState(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for PersonalHotspotState(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1000096B0);
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

uint64_t sub_1000096D8(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_1000096E4(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for PersonalHotspotState()
{
  return &type metadata for PersonalHotspotState;
}

unint64_t sub_100009700()
{
  unint64_t result = qword_100010418;
  if (!qword_100010418)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010418);
  }
  return result;
}

uint64_t sub_100009754()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100009770()
{
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_1000097A8@<X0>(unsigned __int8 *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1000037A4(a1, *(void **)(v2 + 16), a2);
}

unint64_t sub_1000097B0()
{
  unint64_t result = qword_100010450;
  if (!qword_100010450)
  {
    type metadata accessor for PersonalHotspotStateProvider();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010450);
  }
  return result;
}

uint64_t sub_100009804@<X0>(char a1@<W0>, uint64_t a2@<X8>)
{
  return sub_100003BCC(a1, *(void *)(v2 + 16), a2);
}

uint64_t sub_10000980C(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100002BDC(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_100009850()
{
  unint64_t result = qword_100010478;
  if (!qword_100010478)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010478);
  }
  return result;
}

unint64_t sub_1000098A4()
{
  unint64_t result = qword_100010480;
  if (!qword_100010480)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010480);
  }
  return result;
}

uint64_t sub_1000098F8@<X0>(uint64_t a1@<X8>)
{
  return sub_100003E88(a1);
}

uint64_t sub_100009900@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100009C90();
  *a1 = result;
  return result;
}

uint64_t sub_100009970()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100009A3C()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t sub_100009A70()
{
  return static AppIntent.openAppWhenRun.getter();
}

uint64_t sub_100009A80()
{
  return static AppIntent.description.getter();
}

uint64_t sub_100009A90()
{
  return static AppIntent.isDiscoverable.getter();
}

uint64_t sub_100009AA0()
{
  return static AppIntent.parameterSummary.getter();
}

uint64_t sub_100009AB0()
{
  return static AppIntent.authenticationPolicy.getter();
}

uint64_t sub_100009AD0()
{
  return type metadata accessor for IntentDialog();
}

uint64_t sub_100009AE0()
{
  return static IntentResult.result<>()();
}

uint64_t sub_100009AF0()
{
  return IntentParameter.wrappedValue.modify();
}

uint64_t sub_100009B00()
{
  return IntentParameter.wrappedValue.getter();
}

uint64_t sub_100009B10()
{
  return IntentParameter.wrappedValue.setter();
}

uint64_t sub_100009B20()
{
  return IntentParameter<>.init(title:description:default:displayName:requestValueDialog:inputConnectionBehavior:)();
}

uint64_t sub_100009B30()
{
  return type metadata accessor for InputConnectionBehavior();
}

uint64_t sub_100009B40(Swift::String _, Swift::String_optional tableName, NSBundle bundle, Swift::String value, Swift::String comment)
{
  return NSLocalizedString(_:tableName:bundle:value:comment:)(_, tableName, bundle, value, comment)._countAndFlagsBits;
}

uint64_t sub_100009B50()
{
  return LocalizedStringResource.init(stringLiteral:)();
}

uint64_t sub_100009B60()
{
  return type metadata accessor for LocalizedStringResource.BundleDescription();
}

uint64_t sub_100009B70()
{
  return type metadata accessor for LocalizedStringResource();
}

uint64_t sub_100009B80()
{
  return LocalizedStringResource.init(_:table:locale:bundle:comment:)();
}

uint64_t sub_100009B90()
{
  return static Locale.current.getter();
}

uint64_t sub_100009BA0()
{
  return type metadata accessor for Locale();
}

uint64_t sub_100009BB0()
{
  return Logger.logObject.getter();
}

uint64_t sub_100009BC0()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_100009BD0()
{
  return type metadata accessor for Logger();
}

uint64_t sub_100009BE0()
{
  return static WidgetBundle.main()();
}

uint64_t sub_100009BF0()
{
  return static WidgetBundleBuilder.buildBlock<A>(_:)();
}

uint64_t sub_100009C00()
{
  return ControlWidgetTemplate.tint(_:)();
}

uint64_t sub_100009C10()
{
  return ControlWidgetTemplate.disabled(_:)();
}

uint64_t sub_100009C20()
{
  return _ControlWidgetAdaptor.init(_:)();
}

uint64_t sub_100009C30()
{
  return ControlWidgetConfiguration.displayName(_:)();
}

uint64_t sub_100009C40()
{
  return ControlWidgetConfiguration.showsInSystemSpaces()();
}

uint64_t sub_100009C50()
{
  return Text.init<A>(_:)();
}

uint64_t sub_100009C60()
{
  return View.controlWidgetActionHint<A>(_:)();
}

uint64_t sub_100009C70()
{
  return static Color.green.getter();
}

uint64_t sub_100009C80()
{
  return static Color.white.getter();
}

uint64_t sub_100009C90()
{
  return Image.init(_internalSystemName:)();
}

uint64_t sub_100009CA0()
{
  return Label.init(title:icon:)();
}

uint64_t sub_100009CB0()
{
  return ControlWidgetToggle<>.init<A>(_:isOn:action:valueLabel:)();
}

uint64_t sub_100009CC0()
{
  return StaticControlConfiguration.init<A>(kind:provider:content:)();
}

NSDictionary sub_100009CD0()
{
  return Dictionary._bridgeToObjectiveC()();
}

uint64_t sub_100009CE0()
{
  return String.LocalizationValue.init(stringLiteral:)();
}

uint64_t sub_100009CF0()
{
  return type metadata accessor for String.LocalizationValue();
}

NSString sub_100009D00()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_100009D10()
{
  return static String.localizedStringWithFormat(_:_:)();
}

uint64_t sub_100009D20()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100009D30()
{
  return String.hash(into:)();
}

Swift::Int sub_100009D40()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_100009D50()
{
  return type metadata accessor for Bool.IntentDisplayName();
}

uint64_t sub_100009D60()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_100009D70()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_100009D80()
{
  return static OS_dispatch_queue.main.getter();
}

uint64_t sub_100009D90()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_100009DA0()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_100009DB0()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_100009DC0()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_100009DD0()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_100009DE0()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_100009DF0()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t sub_100009E00()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_100009E10()
{
  return Hasher.init(_seed:)();
}

void sub_100009E20(Swift::UInt a1)
{
}

Swift::Int sub_100009E30()
{
  return Hasher._finalize()();
}

uint64_t AnalyticsSendEventLazy()
{
  return _AnalyticsSendEventLazy();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

uint64_t WiFiManagerClientCreate()
{
  return _WiFiManagerClientCreate();
}

uint64_t WiFiManagerClientGetMISDiscoveryState()
{
  return _WiFiManagerClientGetMISDiscoveryState();
}

uint64_t WiFiManagerClientIsPersonalHotspotModificationDisabled()
{
  return _WiFiManagerClientIsPersonalHotspotModificationDisabled();
}

uint64_t WiFiManagerClientSetMISDiscoveryState()
{
  return _WiFiManagerClientSetMISDiscoveryState();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_release(const void *aBlock)
{
}

uint64_t _CTServerConnectionCreateWithIdentifier()
{
  return __CTServerConnectionCreateWithIdentifier();
}

uint64_t _CTServerConnectionGetCellularDataSettings()
{
  return __CTServerConnectionGetCellularDataSettings();
}

uint64_t _NETRBClientCreate()
{
  return __NETRBClientCreate();
}

uint64_t _NETRBClientDestroy()
{
  return __NETRBClientDestroy();
}

uint64_t _NETRBClientGetGlobalServiceState()
{
  return __NETRBClientGetGlobalServiceState();
}

uint64_t _NETRBClientGetHostCount()
{
  return __NETRBClientGetHostCount();
}

uint64_t _NETRBClientSetGlobalServiceState()
{
  return __NETRBClientSetGlobalServiceState();
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_arrayDestroy()
{
  return _swift_arrayDestroy();
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

uint64_t swift_retain()
{
  return _swift_retain();
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