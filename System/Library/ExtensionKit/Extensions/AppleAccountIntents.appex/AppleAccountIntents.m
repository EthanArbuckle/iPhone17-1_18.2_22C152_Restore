uint64_t sub_100004F84()
{
  uint64_t v0;

  v0 = sub_100012D20();
  sub_100005E38(v0, qword_10001DE40);
  sub_100005054(v0, (uint64_t)qword_10001DE40);
  return sub_100012D10();
}

uint64_t sub_100004FF0()
{
  if (qword_10001C9F0 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_100012D20();

  return sub_100005054(v0, (uint64_t)qword_10001DE40);
}

uint64_t sub_100005054(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_10000508C@<X0>(uint64_t a1@<X8>)
{
  if (qword_10001C9F0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100012D20();
  uint64_t v3 = sub_100005054(v2, (uint64_t)qword_10001DE40);
  v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

void *sub_100005134()
{
  return &unk_100013300;
}

uint64_t sub_100005140()
{
  return 0;
}

void *sub_100005148()
{
  return &unk_100013301;
}

uint64_t sub_100005154()
{
  return 1;
}

uint64_t *sub_10000515C()
{
  return &qword_10001C680;
}

uint64_t sub_100005168()
{
  swift_beginAccess();
  uint64_t v0 = qword_10001C680;
  swift_bridgeObjectRetain();
  return v0;
}

uint64_t sub_1000051BC(uint64_t a1, char *a2)
{
  qword_10001C680 = a1;
  off_10001C688 = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_100005218())()
{
  return j__swift_endAccess;
}

uint64_t sub_100005274()
{
  sub_100012AD0();
  return v1;
}

uint64_t sub_1000052A8()
{
  return sub_100012AE0();
}

uint64_t (*sub_1000052DC(void *a1))()
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_100012AC0();
  return sub_100005338;
}

uint64_t sub_100005340(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_100005384()
{
  unint64_t result = qword_10001C6A8;
  if (!qword_10001C6A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C6A8);
  }
  return result;
}

uint64_t sub_1000053D8()
{
  return sub_100012AF0();
}

uint64_t sub_1000053FC()
{
  uint64_t v16 = sub_100012C20();
  uint64_t v0 = *(void *)(v16 - 8);
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v2 = (char *)&v16 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100005340(&qword_10001C690);
  uint64_t v3 = ((uint64_t (*)(void))__chkstk_darwin)();
  v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  v7 = (char *)&v16 - v6;
  uint64_t v8 = sub_100005340(&qword_10001C698);
  __chkstk_darwin(v8 - 8);
  v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_100012D20();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  sub_100005340(&qword_10001C6A0);
  sub_100012D10();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v12 + 56))(v10, 1, 1, v11);
  char v17 = 19;
  uint64_t v13 = sub_100012AB0();
  v14 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56);
  v14(v7, 1, 1, v13);
  v14(v5, 1, 1, v13);
  (*(void (**)(char *, void, uint64_t))(v0 + 104))(v2, enum case for InputConnectionBehavior.default(_:), v16);
  sub_100005384();
  return sub_100012B00();
}

uint64_t sub_1000056F0@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_100012AD0();
  *a1 = v3;
  return result;
}

uint64_t sub_10000572C()
{
  return sub_100012AE0();
}

uint64_t (*sub_100005764(void *a1))()
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_100012AC0();
  return sub_100005338;
}

void sub_1000057C0(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void, void))(*a1 + 32))(*a1, 0);

  free(v1);
}

uint64_t sub_10000580C(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_100005D3C();
  unint64_t v5 = sub_100005DE4();

  return static _URLRepresentableIntent<>.urlRepresentation.getter(a1, v4, a2, v5);
}

uint64_t sub_10000588C(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_100005D3C();
  unint64_t v7 = sub_100005D90();
  unint64_t v8 = sub_100005DE4();
  void *v5 = v2;
  v5[1] = sub_100005960;
  return _URLRepresentableIntent<>.perform()(a1, a2, v6, v7, v8);
}

uint64_t sub_100005960()
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

uint64_t sub_100005A68@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1000053FC();
  *a1 = result;
  return result;
}

uint64_t sub_100005A90(uint64_t a1)
{
  unint64_t v2 = sub_100005B80();

  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

unint64_t sub_100005AD0()
{
  unint64_t result = qword_10001C6B0;
  if (!qword_10001C6B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C6B0);
  }
  return result;
}

unint64_t sub_100005B28()
{
  unint64_t result = qword_10001C6B8;
  if (!qword_10001C6B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C6B8);
  }
  return result;
}

unint64_t sub_100005B80()
{
  unint64_t result = qword_10001C6C0;
  if (!qword_10001C6C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C6C0);
  }
  return result;
}

unint64_t sub_100005BD8()
{
  unint64_t result = qword_10001C6C8;
  if (!qword_10001C6C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C6C8);
  }
  return result;
}

unint64_t sub_100005C30()
{
  unint64_t result = qword_10001C6D0;
  if (!qword_10001C6D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C6D0);
  }
  return result;
}

unint64_t sub_100005C88()
{
  unint64_t result = qword_10001C6D8;
  if (!qword_10001C6D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C6D8);
  }
  return result;
}

uint64_t sub_100005CDC()
{
  return swift_getOpaqueTypeConformance2();
}

ValueMetadata *type metadata accessor for OpenAppleAccountMainDeepLink()
{
  return &type metadata for OpenAppleAccountMainDeepLink;
}

unint64_t sub_100005D3C()
{
  unint64_t result = qword_10001C6E8;
  if (!qword_10001C6E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C6E8);
  }
  return result;
}

unint64_t sub_100005D90()
{
  unint64_t result = qword_10001C6F0;
  if (!qword_10001C6F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C6F0);
  }
  return result;
}

unint64_t sub_100005DE4()
{
  unint64_t result = qword_10001C6F8;
  if (!qword_10001C6F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C6F8);
  }
  return result;
}

uint64_t *sub_100005E38(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_100005EA0()
{
  uint64_t v0 = sub_100005340(&qword_10001C718);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v15 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100005B80();
  sub_100012B80();
  uint64_t v20 = sub_100012B30();
  unint64_t v4 = *(void (**)(char *, uint64_t))(v1 + 8);
  v4(v3, v0);
  sub_100012B80();
  uint64_t v19 = sub_100012B30();
  v4(v3, v0);
  sub_100012B80();
  uint64_t v18 = sub_100012B30();
  v4(v3, v0);
  sub_100012B80();
  uint64_t v17 = sub_100012B30();
  v4(v3, v0);
  sub_100012B80();
  uint64_t v16 = sub_100012B30();
  v4(v3, v0);
  sub_100012B80();
  uint64_t v15 = sub_100012B30();
  v4(v3, v0);
  sub_100012B80();
  uint64_t v5 = sub_100012B30();
  v4(v3, v0);
  sub_100012B80();
  uint64_t v6 = sub_100012B30();
  v4(v3, v0);
  sub_100012B80();
  uint64_t v7 = sub_100012B30();
  v4(v3, v0);
  sub_100012B80();
  uint64_t v8 = sub_100012B30();
  v4(v3, v0);
  sub_100005340(&qword_10001C720);
  uint64_t v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_100013510;
  uint64_t v10 = v19;
  *(void *)(v9 + 32) = v20;
  *(void *)(v9 + 40) = v10;
  uint64_t v11 = v17;
  *(void *)(v9 + 48) = v18;
  *(void *)(v9 + 56) = v11;
  uint64_t v12 = v15;
  *(void *)(v9 + 64) = v16;
  *(void *)(v9 + 72) = v12;
  *(void *)(v9 + 80) = v5;
  *(void *)(v9 + 88) = v6;
  *(void *)(v9 + 96) = v7;
  *(void *)(v9 + 104) = v8;
  uint64_t v13 = sub_100012B20();
  swift_bridgeObjectRelease();
  return v13;
}

uint64_t sub_1000062F8()
{
  return sub_10000AC80();
}

uint64_t sub_100006308@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_100005274();
  *a1 = result;
  return result;
}

uint64_t sub_100006334()
{
  return sub_1000052A8();
}

uint64_t sub_100006340()
{
  uint64_t v0 = sub_100005340(&qword_10001C718);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v14 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100005B80();
  sub_100012B80();
  uint64_t v17 = sub_100012B30();
  unint64_t v4 = *(void (**)(char *, uint64_t))(v1 + 8);
  v4(v3, v0);
  sub_100012B80();
  uint64_t v16 = sub_100012B30();
  v4(v3, v0);
  sub_100012B80();
  uint64_t v15 = sub_100012B30();
  v4(v3, v0);
  sub_100012B80();
  uint64_t v14 = sub_100012B30();
  v4(v3, v0);
  sub_100012B80();
  uint64_t v5 = sub_100012B30();
  v4(v3, v0);
  sub_100012B80();
  uint64_t v6 = sub_100012B30();
  v4(v3, v0);
  sub_100012B80();
  uint64_t v7 = sub_100012B30();
  v4(v3, v0);
  sub_100012B80();
  uint64_t v8 = sub_100012B30();
  v4(v3, v0);
  sub_100005340(&qword_10001C720);
  uint64_t v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_100013520;
  uint64_t v10 = v16;
  *(void *)(v9 + 32) = v17;
  *(void *)(v9 + 40) = v10;
  uint64_t v11 = v14;
  *(void *)(v9 + 48) = v15;
  *(void *)(v9 + 56) = v11;
  *(void *)(v9 + 64) = v5;
  *(void *)(v9 + 72) = v6;
  *(void *)(v9 + 80) = v7;
  *(void *)(v9 + 88) = v8;
  uint64_t v12 = sub_100012B20();
  swift_bridgeObjectRelease();
  return v12;
}

uint64_t sub_1000066E4()
{
  return sub_10000AC80();
}

uint64_t sub_100006700()
{
  uint64_t v0 = sub_100005340(&qword_10001C718);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v32 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100005B80();
  sub_100012B80();
  uint64_t v74 = sub_100012B30();
  unint64_t v4 = *(void (**)(char *, uint64_t))(v1 + 8);
  v4(v3, v0);
  sub_100012B80();
  uint64_t v73 = sub_100012B30();
  v4(v3, v0);
  sub_100012B80();
  uint64_t v72 = sub_100012B30();
  v4(v3, v0);
  sub_100012B80();
  uint64_t v71 = sub_100012B30();
  v4(v3, v0);
  sub_100012B80();
  uint64_t v70 = sub_100012B30();
  v4(v3, v0);
  uint64_t v48 = 0xD00000000000001BLL;
  sub_100012B80();
  uint64_t v69 = sub_100012B30();
  v4(v3, v0);
  sub_100012B80();
  uint64_t v68 = sub_100012B30();
  v4(v3, v0);
  sub_100012B80();
  uint64_t v67 = sub_100012B30();
  v4(v3, v0);
  sub_100012B80();
  uint64_t v66 = sub_100012B30();
  v4(v3, v0);
  unint64_t v60 = 0xD000000000000020;
  sub_100012B80();
  uint64_t v65 = sub_100012B30();
  v4(v3, v0);
  sub_100012B80();
  uint64_t v64 = sub_100012B30();
  v4(v3, v0);
  uint64_t v43 = 0xD00000000000001ALL;
  sub_100012B80();
  uint64_t v63 = sub_100012B30();
  v4(v3, v0);
  sub_100012B80();
  uint64_t v62 = sub_100012B30();
  v4(v3, v0);
  sub_100012B80();
  uint64_t v61 = sub_100012B30();
  v4(v3, v0);
  sub_100012B80();
  uint64_t v59 = sub_100012B30();
  v4(v3, v0);
  sub_100012B80();
  uint64_t v58 = sub_100012B30();
  v4(v3, v0);
  sub_100012B80();
  uint64_t v57 = sub_100012B30();
  v4(v3, v0);
  sub_100012B80();
  uint64_t v56 = sub_100012B30();
  v4(v3, v0);
  uint64_t v46 = 0xD000000000000029;
  sub_100012B80();
  uint64_t v55 = sub_100012B30();
  v4(v3, v0);
  sub_100012B80();
  uint64_t v54 = sub_100012B30();
  v4(v3, v0);
  sub_100012B80();
  uint64_t v53 = sub_100012B30();
  v4(v3, v0);
  sub_100012B80();
  uint64_t v52 = sub_100012B30();
  v4(v3, v0);
  sub_100012B80();
  uint64_t v51 = sub_100012B30();
  v4(v3, v0);
  sub_100012B80();
  uint64_t v50 = sub_100012B30();
  v4(v3, v0);
  sub_100012B80();
  uint64_t v49 = sub_100012B30();
  v4(v3, v0);
  sub_100012B80();
  uint64_t v48 = sub_100012B30();
  v4(v3, v0);
  sub_100012B80();
  uint64_t v47 = sub_100012B30();
  v4(v3, v0);
  sub_100012B80();
  uint64_t v45 = sub_100012B30();
  v4(v3, v0);
  sub_100012B80();
  uint64_t v44 = sub_100012B30();
  v4(v3, v0);
  sub_100012B80();
  uint64_t v43 = sub_100012B30();
  v4(v3, v0);
  sub_100012B80();
  uint64_t v42 = sub_100012B30();
  v4(v3, v0);
  sub_100012B80();
  uint64_t v41 = sub_100012B30();
  v4(v3, v0);
  sub_100012B80();
  uint64_t v40 = sub_100012B30();
  v4(v3, v0);
  sub_100012B80();
  uint64_t v39 = sub_100012B30();
  v4(v3, v0);
  sub_100012B80();
  uint64_t v38 = sub_100012B30();
  v4(v3, v0);
  sub_100012B80();
  uint64_t v37 = sub_100012B30();
  v4(v3, v0);
  sub_100012B80();
  uint64_t v36 = sub_100012B30();
  v4(v3, v0);
  sub_100012B80();
  uint64_t v35 = sub_100012B30();
  v4(v3, v0);
  sub_100012B80();
  uint64_t v34 = sub_100012B30();
  v4(v3, v0);
  sub_100012B80();
  uint64_t v46 = sub_100012B30();
  v4(v3, v0);
  sub_100012B80();
  uint64_t v33 = sub_100012B30();
  v4(v3, v0);
  sub_100012B80();
  uint64_t v5 = sub_100012B30();
  v4(v3, v0);
  sub_100012B80();
  uint64_t v6 = sub_100012B30();
  v4(v3, v0);
  sub_100012B80();
  uint64_t v7 = sub_100012B30();
  v4(v3, v0);
  sub_100012B80();
  uint64_t v8 = sub_100012B30();
  v4(v3, v0);
  sub_100005340(&qword_10001C720);
  uint64_t v9 = swift_allocObject();
  uint64_t v10 = v73;
  *(void *)(v9 + 32) = v74;
  *(void *)(v9 + 40) = v10;
  uint64_t v11 = v71;
  *(void *)(v9 + 48) = v72;
  *(void *)(v9 + 56) = v11;
  uint64_t v12 = v69;
  *(void *)(v9 + 64) = v70;
  *(void *)(v9 + 72) = v12;
  uint64_t v13 = v67;
  *(void *)(v9 + 80) = v68;
  *(void *)(v9 + 88) = v13;
  uint64_t v14 = v65;
  *(void *)(v9 + 96) = v66;
  *(void *)(v9 + 104) = v14;
  uint64_t v15 = v63;
  *(void *)(v9 + 112) = v64;
  *(void *)(v9 + 120) = v15;
  uint64_t v16 = v61;
  *(void *)(v9 + 128) = v62;
  *(void *)(v9 + 136) = v16;
  uint64_t v17 = v58;
  *(void *)(v9 + 144) = v59;
  *(void *)(v9 + 152) = v17;
  *(_OWORD *)(v9 + 16) = xmmword_100013530;
  uint64_t v18 = v56;
  *(void *)(v9 + 160) = v57;
  *(void *)(v9 + 168) = v18;
  uint64_t v19 = v54;
  *(void *)(v9 + 176) = v55;
  *(void *)(v9 + 184) = v19;
  uint64_t v20 = v52;
  *(void *)(v9 + 192) = v53;
  *(void *)(v9 + 200) = v20;
  uint64_t v21 = v50;
  *(void *)(v9 + 208) = v51;
  *(void *)(v9 + 216) = v21;
  uint64_t v22 = v48;
  *(void *)(v9 + 224) = v49;
  *(void *)(v9 + 232) = v22;
  uint64_t v23 = v45;
  *(void *)(v9 + 240) = v47;
  *(void *)(v9 + 248) = v23;
  uint64_t v24 = v43;
  *(void *)(v9 + 256) = v44;
  *(void *)(v9 + 264) = v24;
  uint64_t v25 = v41;
  *(void *)(v9 + 272) = v42;
  *(void *)(v9 + 280) = v25;
  uint64_t v26 = v39;
  *(void *)(v9 + 288) = v40;
  *(void *)(v9 + 296) = v26;
  uint64_t v27 = v37;
  *(void *)(v9 + 304) = v38;
  *(void *)(v9 + 312) = v27;
  uint64_t v28 = v35;
  *(void *)(v9 + 320) = v36;
  *(void *)(v9 + 328) = v28;
  uint64_t v29 = v46;
  *(void *)(v9 + 336) = v34;
  *(void *)(v9 + 344) = v29;
  *(void *)(v9 + 352) = v33;
  *(void *)(v9 + 360) = v5;
  *(void *)(v9 + 368) = v6;
  *(void *)(v9 + 376) = v7;
  *(void *)(v9 + 384) = v8;
  uint64_t v30 = sub_100012B20();
  swift_bridgeObjectRelease();
  return v30;
}

uint64_t sub_100007794()
{
  return sub_10000AC80();
}

uint64_t sub_1000077B0()
{
  uint64_t v0 = sub_100005340(&qword_10001C718);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v12 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100005B80();
  sub_100012B80();
  uint64_t v4 = sub_100012B30();
  uint64_t v5 = *(void (**)(char *, uint64_t))(v1 + 8);
  v5(v3, v0);
  sub_100012B80();
  uint64_t v6 = sub_100012B30();
  v5(v3, v0);
  sub_100012B80();
  uint64_t v7 = sub_100012B30();
  v5(v3, v0);
  sub_100012B80();
  uint64_t v8 = sub_100012B30();
  v5(v3, v0);
  sub_100005340(&qword_10001C720);
  uint64_t v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_100013540;
  *(void *)(v9 + 32) = v4;
  *(void *)(v9 + 40) = v6;
  *(void *)(v9 + 48) = v7;
  *(void *)(v9 + 56) = v8;
  uint64_t v10 = sub_100012B20();
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_100007A08()
{
  return sub_10000AC80();
}

uint64_t sub_100007A24()
{
  uint64_t v0 = sub_100005340(&qword_10001C718);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v11 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100005B80();
  sub_100012B80();
  uint64_t v4 = sub_100012B30();
  uint64_t v5 = *(void (**)(char *, uint64_t))(v1 + 8);
  v5(v3, v0);
  sub_100012B80();
  uint64_t v6 = sub_100012B30();
  v5(v3, v0);
  sub_100012B80();
  uint64_t v7 = sub_100012B30();
  v5(v3, v0);
  sub_100005340(&qword_10001C720);
  uint64_t v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_100013550;
  *(void *)(v8 + 32) = v4;
  *(void *)(v8 + 40) = v6;
  *(void *)(v8 + 48) = v7;
  uint64_t v9 = sub_100012B20();
  swift_bridgeObjectRelease();
  return v9;
}

uint64_t sub_100007C30()
{
  return sub_10000AC80();
}

uint64_t sub_100007C54()
{
  uint64_t v0 = sub_100005340(&qword_10001C718);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v13 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100005B80();
  sub_100012B80();
  uint64_t v16 = sub_100012B30();
  uint64_t v4 = *(void (**)(char *, uint64_t))(v1 + 8);
  v4(v3, v0);
  sub_100012B80();
  uint64_t v15 = sub_100012B30();
  v4(v3, v0);
  sub_100012B80();
  uint64_t v14 = sub_100012B30();
  v4(v3, v0);
  sub_100012B80();
  uint64_t v5 = sub_100012B30();
  v4(v3, v0);
  sub_100012B80();
  uint64_t v6 = sub_100012B30();
  v4(v3, v0);
  sub_100012B80();
  uint64_t v7 = sub_100012B30();
  v4(v3, v0);
  sub_100012B80();
  uint64_t v8 = sub_100012B30();
  v4(v3, v0);
  sub_100005340(&qword_10001C720);
  uint64_t v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_100013560;
  uint64_t v10 = v15;
  *(void *)(v9 + 32) = v16;
  *(void *)(v9 + 40) = v10;
  *(void *)(v9 + 48) = v14;
  *(void *)(v9 + 56) = v5;
  *(void *)(v9 + 64) = v6;
  *(void *)(v9 + 72) = v7;
  *(void *)(v9 + 80) = v8;
  uint64_t v11 = sub_100012B20();
  swift_bridgeObjectRelease();
  return v11;
}

uint64_t sub_100007FA8()
{
  return sub_10000AC80();
}

uint64_t sub_100007FC4()
{
  uint64_t v0 = sub_100005340(&qword_10001C718);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v10 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100005B80();
  sub_100012B80();
  uint64_t v4 = sub_100012B30();
  uint64_t v5 = *(void (**)(char *, uint64_t))(v1 + 8);
  v5(v3, v0);
  sub_100012B80();
  uint64_t v6 = sub_100012B30();
  v5(v3, v0);
  sub_100005340(&qword_10001C720);
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_100013570;
  *(void *)(v7 + 32) = v4;
  *(void *)(v7 + 40) = v6;
  uint64_t v8 = sub_100012B20();
  swift_bridgeObjectRelease();
  return v8;
}

uint64_t sub_100008178()
{
  return sub_10000AC80();
}

uint64_t sub_100008190()
{
  uint64_t v0 = sub_100005340(&qword_10001C718);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v14 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100005B80();
  sub_100012B80();
  uint64_t v17 = sub_100012B30();
  uint64_t v4 = *(void (**)(char *, uint64_t))(v1 + 8);
  v4(v3, v0);
  sub_100012B80();
  uint64_t v16 = sub_100012B30();
  v4(v3, v0);
  sub_100012B80();
  uint64_t v15 = sub_100012B30();
  v4(v3, v0);
  sub_100012B80();
  uint64_t v14 = sub_100012B30();
  v4(v3, v0);
  sub_100012B80();
  uint64_t v5 = sub_100012B30();
  v4(v3, v0);
  sub_100012B80();
  uint64_t v6 = sub_100012B30();
  v4(v3, v0);
  sub_100012B80();
  uint64_t v7 = sub_100012B30();
  v4(v3, v0);
  sub_100012B80();
  uint64_t v8 = sub_100012B30();
  v4(v3, v0);
  sub_100005340(&qword_10001C720);
  uint64_t v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_100013520;
  uint64_t v10 = v16;
  *(void *)(v9 + 32) = v17;
  *(void *)(v9 + 40) = v10;
  uint64_t v11 = v14;
  *(void *)(v9 + 48) = v15;
  *(void *)(v9 + 56) = v11;
  *(void *)(v9 + 64) = v5;
  *(void *)(v9 + 72) = v6;
  *(void *)(v9 + 80) = v7;
  *(void *)(v9 + 88) = v8;
  uint64_t v12 = sub_100012B20();
  swift_bridgeObjectRelease();
  return v12;
}

uint64_t sub_100008534()
{
  return sub_10000AC80();
}

uint64_t sub_100008558()
{
  uint64_t v0 = sub_100005340(&qword_10001C718);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v13 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100005B80();
  sub_100012B80();
  uint64_t v16 = sub_100012B30();
  uint64_t v4 = *(void (**)(char *, uint64_t))(v1 + 8);
  v4(v3, v0);
  sub_100012B80();
  uint64_t v15 = sub_100012B30();
  v4(v3, v0);
  sub_100012B80();
  uint64_t v14 = sub_100012B30();
  v4(v3, v0);
  sub_100012B80();
  uint64_t v5 = sub_100012B30();
  v4(v3, v0);
  sub_100012B80();
  uint64_t v6 = sub_100012B30();
  v4(v3, v0);
  sub_100012B80();
  uint64_t v7 = sub_100012B30();
  v4(v3, v0);
  sub_100012B80();
  uint64_t v8 = sub_100012B30();
  v4(v3, v0);
  sub_100005340(&qword_10001C720);
  uint64_t v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_100013560;
  uint64_t v10 = v15;
  *(void *)(v9 + 32) = v16;
  *(void *)(v9 + 40) = v10;
  *(void *)(v9 + 48) = v14;
  *(void *)(v9 + 56) = v5;
  *(void *)(v9 + 64) = v6;
  *(void *)(v9 + 72) = v7;
  *(void *)(v9 + 80) = v8;
  uint64_t v11 = sub_100012B20();
  swift_bridgeObjectRelease();
  return v11;
}

uint64_t sub_1000088B0()
{
  return sub_10000AC80();
}

uint64_t sub_1000088D0()
{
  uint64_t v0 = sub_100005340(&qword_10001C718);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v15 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100005B80();
  sub_100012B80();
  uint64_t v20 = sub_100012B30();
  uint64_t v4 = *(void (**)(char *, uint64_t))(v1 + 8);
  v4(v3, v0);
  sub_100012B80();
  uint64_t v19 = sub_100012B30();
  v4(v3, v0);
  sub_100012B80();
  uint64_t v18 = sub_100012B30();
  v4(v3, v0);
  sub_100012B80();
  uint64_t v17 = sub_100012B30();
  v4(v3, v0);
  sub_100012B80();
  uint64_t v16 = sub_100012B30();
  v4(v3, v0);
  sub_100012B80();
  uint64_t v15 = sub_100012B30();
  v4(v3, v0);
  sub_100012B80();
  uint64_t v5 = sub_100012B30();
  v4(v3, v0);
  sub_100012B80();
  uint64_t v6 = sub_100012B30();
  v4(v3, v0);
  sub_100012B80();
  uint64_t v7 = sub_100012B30();
  v4(v3, v0);
  sub_100012B80();
  uint64_t v8 = sub_100012B30();
  v4(v3, v0);
  sub_100005340(&qword_10001C720);
  uint64_t v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_100013510;
  uint64_t v10 = v19;
  *(void *)(v9 + 32) = v20;
  *(void *)(v9 + 40) = v10;
  uint64_t v11 = v17;
  *(void *)(v9 + 48) = v18;
  *(void *)(v9 + 56) = v11;
  uint64_t v12 = v15;
  *(void *)(v9 + 64) = v16;
  *(void *)(v9 + 72) = v12;
  *(void *)(v9 + 80) = v5;
  *(void *)(v9 + 88) = v6;
  *(void *)(v9 + 96) = v7;
  *(void *)(v9 + 104) = v8;
  uint64_t v13 = sub_100012B20();
  swift_bridgeObjectRelease();
  return v13;
}

uint64_t sub_100008D24()
{
  return sub_10000AC80();
}

uint64_t sub_100008D44()
{
  uint64_t v0 = sub_100005340(&qword_10001C718);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v13 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100005B80();
  sub_100012B80();
  uint64_t v14 = sub_100012B30();
  uint64_t v4 = *(void (**)(char *, uint64_t))(v1 + 8);
  v4(v3, v0);
  sub_100012B80();
  uint64_t v13 = sub_100012B30();
  v4(v3, v0);
  sub_100012B80();
  uint64_t v5 = sub_100012B30();
  v4(v3, v0);
  sub_100012B80();
  uint64_t v6 = sub_100012B30();
  v4(v3, v0);
  sub_100012B80();
  uint64_t v7 = sub_100012B30();
  v4(v3, v0);
  sub_100012B80();
  uint64_t v8 = sub_100012B30();
  v4(v3, v0);
  sub_100005340(&qword_10001C720);
  uint64_t v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_100013580;
  uint64_t v10 = v13;
  *(void *)(v9 + 32) = v14;
  *(void *)(v9 + 40) = v10;
  *(void *)(v9 + 48) = v5;
  *(void *)(v9 + 56) = v6;
  *(void *)(v9 + 64) = v7;
  *(void *)(v9 + 72) = v8;
  uint64_t v11 = sub_100012B20();
  swift_bridgeObjectRelease();
  return v11;
}

uint64_t sub_100009044()
{
  return sub_10000AC80();
}

uint64_t sub_100009060()
{
  uint64_t v0 = sub_100005340(&qword_10001C718);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v14 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100005B80();
  sub_100012B80();
  uint64_t v19 = sub_100012B30();
  uint64_t v4 = *(void (**)(char *, uint64_t))(v1 + 8);
  v4(v3, v0);
  sub_100012B80();
  uint64_t v18 = sub_100012B30();
  v4(v3, v0);
  sub_100012B80();
  uint64_t v17 = sub_100012B30();
  v4(v3, v0);
  sub_100012B80();
  uint64_t v16 = sub_100012B30();
  v4(v3, v0);
  sub_100012B80();
  uint64_t v15 = sub_100012B30();
  v4(v3, v0);
  sub_100012B80();
  uint64_t v5 = sub_100012B30();
  v4(v3, v0);
  sub_100012B80();
  uint64_t v6 = sub_100012B30();
  v4(v3, v0);
  sub_100012B80();
  uint64_t v7 = sub_100012B30();
  v4(v3, v0);
  sub_100012B80();
  uint64_t v8 = sub_100012B30();
  v4(v3, v0);
  sub_100005340(&qword_10001C720);
  uint64_t v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_100013590;
  uint64_t v10 = v18;
  *(void *)(v9 + 32) = v19;
  *(void *)(v9 + 40) = v10;
  uint64_t v11 = v16;
  *(void *)(v9 + 48) = v17;
  *(void *)(v9 + 56) = v11;
  *(void *)(v9 + 64) = v15;
  *(void *)(v9 + 72) = v5;
  *(void *)(v9 + 80) = v6;
  *(void *)(v9 + 88) = v7;
  *(void *)(v9 + 96) = v8;
  uint64_t v12 = sub_100012B20();
  swift_bridgeObjectRelease();
  return v12;
}

uint64_t sub_10000945C()
{
  return sub_10000AC80();
}

uint64_t sub_10000947C()
{
  uint64_t v0 = sub_100005340(&qword_10001C718);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v14 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100005B80();
  sub_100012B80();
  uint64_t v19 = sub_100012B30();
  uint64_t v4 = *(void (**)(char *, uint64_t))(v1 + 8);
  v4(v3, v0);
  sub_100012B80();
  uint64_t v18 = sub_100012B30();
  v4(v3, v0);
  sub_100012B80();
  uint64_t v17 = sub_100012B30();
  v4(v3, v0);
  sub_100012B80();
  uint64_t v16 = sub_100012B30();
  v4(v3, v0);
  sub_100012B80();
  uint64_t v15 = sub_100012B30();
  v4(v3, v0);
  sub_100012B80();
  uint64_t v5 = sub_100012B30();
  v4(v3, v0);
  sub_100012B80();
  uint64_t v6 = sub_100012B30();
  v4(v3, v0);
  sub_100012B80();
  uint64_t v7 = sub_100012B30();
  v4(v3, v0);
  sub_100012B80();
  uint64_t v8 = sub_100012B30();
  v4(v3, v0);
  sub_100005340(&qword_10001C720);
  uint64_t v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_100013590;
  uint64_t v10 = v18;
  *(void *)(v9 + 32) = v19;
  *(void *)(v9 + 40) = v10;
  uint64_t v11 = v16;
  *(void *)(v9 + 48) = v17;
  *(void *)(v9 + 56) = v11;
  *(void *)(v9 + 64) = v15;
  *(void *)(v9 + 72) = v5;
  *(void *)(v9 + 80) = v6;
  *(void *)(v9 + 88) = v7;
  *(void *)(v9 + 96) = v8;
  uint64_t v12 = sub_100012B20();
  swift_bridgeObjectRelease();
  return v12;
}

uint64_t sub_100009870()
{
  return sub_10000AC80();
}

uint64_t sub_10000988C()
{
  uint64_t v0 = sub_100005340(&qword_10001C718);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v14 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100005B80();
  sub_100012B80();
  uint64_t v17 = sub_100012B30();
  uint64_t v4 = *(void (**)(char *, uint64_t))(v1 + 8);
  v4(v3, v0);
  sub_100012B80();
  uint64_t v16 = sub_100012B30();
  v4(v3, v0);
  sub_100012B80();
  uint64_t v15 = sub_100012B30();
  v4(v3, v0);
  sub_100012B80();
  uint64_t v14 = sub_100012B30();
  v4(v3, v0);
  sub_100012B80();
  uint64_t v5 = sub_100012B30();
  v4(v3, v0);
  sub_100012B80();
  uint64_t v6 = sub_100012B30();
  v4(v3, v0);
  sub_100012B80();
  uint64_t v7 = sub_100012B30();
  v4(v3, v0);
  sub_100012B80();
  uint64_t v8 = sub_100012B30();
  v4(v3, v0);
  sub_100005340(&qword_10001C720);
  uint64_t v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_100013520;
  uint64_t v10 = v16;
  *(void *)(v9 + 32) = v17;
  *(void *)(v9 + 40) = v10;
  uint64_t v11 = v14;
  *(void *)(v9 + 48) = v15;
  *(void *)(v9 + 56) = v11;
  *(void *)(v9 + 64) = v5;
  *(void *)(v9 + 72) = v6;
  *(void *)(v9 + 80) = v7;
  *(void *)(v9 + 88) = v8;
  uint64_t v12 = sub_100012B20();
  swift_bridgeObjectRelease();
  return v12;
}

uint64_t sub_100009C38()
{
  return sub_10000AC80();
}

uint64_t sub_100009C5C()
{
  uint64_t v0 = sub_100005340(&qword_10001C718);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v13 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100005B80();
  sub_100012B80();
  uint64_t v14 = sub_100012B30();
  uint64_t v4 = *(void (**)(char *, uint64_t))(v1 + 8);
  v4(v3, v0);
  sub_100012B80();
  uint64_t v13 = sub_100012B30();
  v4(v3, v0);
  sub_100012B80();
  uint64_t v5 = sub_100012B30();
  v4(v3, v0);
  sub_100012B80();
  uint64_t v6 = sub_100012B30();
  v4(v3, v0);
  sub_100012B80();
  uint64_t v7 = sub_100012B30();
  v4(v3, v0);
  sub_100012B80();
  uint64_t v8 = sub_100012B30();
  v4(v3, v0);
  sub_100005340(&qword_10001C720);
  uint64_t v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_100013580;
  uint64_t v10 = v13;
  *(void *)(v9 + 32) = v14;
  *(void *)(v9 + 40) = v10;
  *(void *)(v9 + 48) = v5;
  *(void *)(v9 + 56) = v6;
  *(void *)(v9 + 64) = v7;
  *(void *)(v9 + 72) = v8;
  uint64_t v11 = sub_100012B20();
  swift_bridgeObjectRelease();
  return v11;
}

uint64_t sub_100009F5C()
{
  return sub_10000AC80();
}

uint64_t sub_100009F80()
{
  uint64_t v0 = sub_100005340(&qword_10001C718);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v13 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100005B80();
  sub_100012B80();
  uint64_t v16 = sub_100012B30();
  uint64_t v4 = *(void (**)(char *, uint64_t))(v1 + 8);
  v4(v3, v0);
  sub_100012B80();
  uint64_t v15 = sub_100012B30();
  v4(v3, v0);
  sub_100012B80();
  uint64_t v14 = sub_100012B30();
  v4(v3, v0);
  sub_100012B80();
  uint64_t v5 = sub_100012B30();
  v4(v3, v0);
  sub_100012B80();
  uint64_t v6 = sub_100012B30();
  v4(v3, v0);
  sub_100012B80();
  uint64_t v7 = sub_100012B30();
  v4(v3, v0);
  sub_100012B80();
  uint64_t v8 = sub_100012B30();
  v4(v3, v0);
  sub_100005340(&qword_10001C720);
  uint64_t v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_100013560;
  uint64_t v10 = v15;
  *(void *)(v9 + 32) = v16;
  *(void *)(v9 + 40) = v10;
  *(void *)(v9 + 48) = v14;
  *(void *)(v9 + 56) = v5;
  *(void *)(v9 + 64) = v6;
  *(void *)(v9 + 72) = v7;
  *(void *)(v9 + 80) = v8;
  uint64_t v11 = sub_100012B20();
  swift_bridgeObjectRelease();
  return v11;
}

uint64_t sub_10000A2DC()
{
  return sub_10000AC80();
}

uint64_t sub_10000A300()
{
  uint64_t v0 = sub_100005340(&qword_10001C718);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v14 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100005B80();
  sub_100012B80();
  uint64_t v19 = sub_100012B30();
  uint64_t v4 = *(void (**)(char *, uint64_t))(v1 + 8);
  v4(v3, v0);
  sub_100012B80();
  uint64_t v18 = sub_100012B30();
  v4(v3, v0);
  sub_100012B80();
  uint64_t v17 = sub_100012B30();
  v4(v3, v0);
  sub_100012B80();
  uint64_t v16 = sub_100012B30();
  v4(v3, v0);
  sub_100012B80();
  uint64_t v15 = sub_100012B30();
  v4(v3, v0);
  sub_100012B80();
  uint64_t v5 = sub_100012B30();
  v4(v3, v0);
  sub_100012B80();
  uint64_t v6 = sub_100012B30();
  v4(v3, v0);
  sub_100012B80();
  uint64_t v7 = sub_100012B30();
  v4(v3, v0);
  sub_100012B80();
  uint64_t v8 = sub_100012B30();
  v4(v3, v0);
  sub_100005340(&qword_10001C720);
  uint64_t v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_100013590;
  uint64_t v10 = v18;
  *(void *)(v9 + 32) = v19;
  *(void *)(v9 + 40) = v10;
  uint64_t v11 = v16;
  *(void *)(v9 + 48) = v17;
  *(void *)(v9 + 56) = v11;
  *(void *)(v9 + 64) = v15;
  *(void *)(v9 + 72) = v5;
  *(void *)(v9 + 80) = v6;
  *(void *)(v9 + 88) = v7;
  *(void *)(v9 + 96) = v8;
  uint64_t v12 = sub_100012B20();
  swift_bridgeObjectRelease();
  return v12;
}

uint64_t sub_10000A6FC()
{
  return sub_10000AC80();
}

uint64_t sub_10000A720()
{
  uint64_t v0 = sub_100005340(&qword_10001C718);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v16 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100005B80();
  sub_100012B80();
  uint64_t v25 = sub_100012B30();
  uint64_t v4 = *(void (**)(char *, uint64_t))(v1 + 8);
  v4(v3, v0);
  sub_100012B80();
  uint64_t v24 = sub_100012B30();
  v4(v3, v0);
  sub_100012B80();
  uint64_t v23 = sub_100012B30();
  v4(v3, v0);
  sub_100012B80();
  uint64_t v22 = sub_100012B30();
  v4(v3, v0);
  sub_100012B80();
  uint64_t v21 = sub_100012B30();
  v4(v3, v0);
  sub_100012B80();
  uint64_t v20 = sub_100012B30();
  v4(v3, v0);
  sub_100012B80();
  uint64_t v19 = sub_100012B30();
  v4(v3, v0);
  sub_100012B80();
  uint64_t v18 = sub_100012B30();
  v4(v3, v0);
  sub_100012B80();
  uint64_t v17 = sub_100012B30();
  v4(v3, v0);
  sub_100012B80();
  uint64_t v5 = sub_100012B30();
  v4(v3, v0);
  sub_100012B80();
  uint64_t v6 = sub_100012B30();
  v4(v3, v0);
  sub_100012B80();
  uint64_t v7 = sub_100012B30();
  v4(v3, v0);
  sub_100012B80();
  uint64_t v8 = sub_100012B30();
  v4(v3, v0);
  sub_100005340(&qword_10001C720);
  uint64_t v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_1000135A0;
  uint64_t v10 = v24;
  *(void *)(v9 + 32) = v25;
  *(void *)(v9 + 40) = v10;
  uint64_t v11 = v22;
  *(void *)(v9 + 48) = v23;
  *(void *)(v9 + 56) = v11;
  uint64_t v12 = v20;
  *(void *)(v9 + 64) = v21;
  *(void *)(v9 + 72) = v12;
  uint64_t v13 = v18;
  *(void *)(v9 + 80) = v19;
  *(void *)(v9 + 88) = v13;
  *(void *)(v9 + 96) = v17;
  *(void *)(v9 + 104) = v5;
  *(void *)(v9 + 112) = v6;
  *(void *)(v9 + 120) = v7;
  *(void *)(v9 + 128) = v8;
  uint64_t v14 = sub_100012B20();
  swift_bridgeObjectRelease();
  return v14;
}

uint64_t sub_10000AC64()
{
  return sub_10000AC80();
}

uint64_t sub_10000AC80()
{
  uint64_t v0 = sub_100012B60();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  sub_10000B7BC();
  sub_100012B10();
  swift_release();
  sub_100005B80();
  sub_100012B70();
  uint64_t v4 = sub_100012B50();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  sub_100005340(&qword_10001C710);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_1000135B0;
  *(void *)(v5 + 32) = v4;
  uint64_t v6 = sub_100012B40();
  swift_bridgeObjectRelease();
  return v6;
}

void sub_10000ADF0()
{
  qword_10001DE58 = (uint64_t)&_swiftEmptyArrayStorage;
}

uint64_t *sub_10000AE04()
{
  if (qword_10001CD80 != -1) {
    swift_once();
  }
  return &qword_10001DE58;
}

uint64_t sub_10000AE50()
{
  if (qword_10001CD80 != -1) {
    swift_once();
  }

  return swift_bridgeObjectRetain();
}

uint64_t sub_10000AEB0()
{
  uint64_t v0 = sub_100012BB0();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v19 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v32 = sub_10000533C();
  sub_100005B80();
  sub_100012BC0();
  uint64_t v31 = sub_100012BA0();
  uint64_t v4 = *(void (**)(char *, uint64_t))(v1 + 8);
  v4(v3, v0);
  uint64_t v32 = sub_10000533C();
  sub_100012BC0();
  uint64_t v30 = sub_100012BA0();
  v4(v3, v0);
  uint64_t v32 = sub_10000533C();
  sub_100012BC0();
  uint64_t v29 = sub_100012BA0();
  v4(v3, v0);
  uint64_t v32 = sub_10000533C();
  sub_100012BC0();
  uint64_t v28 = sub_100012BA0();
  v4(v3, v0);
  uint64_t v32 = sub_10000533C();
  sub_100012BC0();
  uint64_t v27 = sub_100012BA0();
  v4(v3, v0);
  uint64_t v32 = sub_10000533C();
  sub_100012BC0();
  uint64_t v26 = sub_100012BA0();
  v4(v3, v0);
  uint64_t v32 = sub_10000533C();
  sub_100012BC0();
  uint64_t v25 = sub_100012BA0();
  v4(v3, v0);
  uint64_t v32 = sub_10000533C();
  sub_100012BC0();
  uint64_t v24 = sub_100012BA0();
  v4(v3, v0);
  uint64_t v32 = sub_10000533C();
  sub_100012BC0();
  uint64_t v23 = sub_100012BA0();
  v4(v3, v0);
  uint64_t v32 = sub_10000533C();
  sub_100012BC0();
  uint64_t v22 = sub_100012BA0();
  v4(v3, v0);
  uint64_t v32 = sub_10000533C();
  sub_100012BC0();
  uint64_t v21 = sub_100012BA0();
  v4(v3, v0);
  uint64_t v32 = sub_10000533C();
  sub_100012BC0();
  uint64_t v20 = sub_100012BA0();
  v4(v3, v0);
  uint64_t v32 = sub_10000533C();
  sub_100012BC0();
  uint64_t v19 = sub_100012BA0();
  v4(v3, v0);
  uint64_t v32 = sub_10000533C();
  sub_100012BC0();
  uint64_t v5 = sub_100012BA0();
  v4(v3, v0);
  uint64_t v32 = sub_10000533C();
  sub_100012BC0();
  uint64_t v6 = sub_100012BA0();
  v4(v3, v0);
  uint64_t v32 = sub_10000533C();
  sub_100012BC0();
  uint64_t v7 = sub_100012BA0();
  v4(v3, v0);
  uint64_t v32 = sub_10000533C();
  sub_100012BC0();
  uint64_t v8 = sub_100012BA0();
  v4(v3, v0);
  uint64_t v32 = sub_10000533C();
  sub_100012BC0();
  uint64_t v9 = sub_100012BA0();
  v4(v3, v0);
  sub_100005340(&qword_10001C700);
  uint64_t v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_1000135C0;
  uint64_t v11 = v30;
  *(void *)(v10 + 32) = v31;
  *(void *)(v10 + 40) = v11;
  uint64_t v12 = v28;
  *(void *)(v10 + 48) = v29;
  *(void *)(v10 + 56) = v12;
  uint64_t v13 = v26;
  *(void *)(v10 + 64) = v27;
  *(void *)(v10 + 72) = v13;
  uint64_t v14 = v24;
  *(void *)(v10 + 80) = v25;
  *(void *)(v10 + 88) = v14;
  uint64_t v15 = v22;
  *(void *)(v10 + 96) = v23;
  *(void *)(v10 + 104) = v15;
  uint64_t v16 = v20;
  *(void *)(v10 + 112) = v21;
  *(void *)(v10 + 120) = v16;
  *(void *)(v10 + 128) = v19;
  *(void *)(v10 + 136) = v5;
  *(void *)(v10 + 144) = v6;
  *(void *)(v10 + 152) = v7;
  *(void *)(v10 + 160) = v8;
  *(void *)(v10 + 168) = v9;
  uint64_t v17 = sub_100012B90();
  swift_bridgeObjectRelease();
  return v17;
}

ValueMetadata *type metadata accessor for AppleAccountIntentsProvider()
{
  return &type metadata for AppleAccountIntentsProvider;
}

unint64_t sub_10000B7BC()
{
  unint64_t result = qword_10001C708;
  if (!qword_10001C708)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C708);
  }
  return result;
}

uint64_t sub_10000B810(uint64_t result)
{
  *uint64_t v1 = result;
  return result;
}

uint64_t (*sub_10000B818())()
{
  return nullsub_1;
}

uint64_t *sub_10000B838()
{
  return &qword_10001C728;
}

uint64_t sub_10000B844()
{
  swift_beginAccess();
  uint64_t v0 = qword_10001C728;
  swift_bridgeObjectRetain();
  return v0;
}

uint64_t sub_10000B898(uint64_t a1, char *a2)
{
  qword_10001C728 = a1;
  off_10001C730 = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_10000B8F4())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_10000B94C()
{
  uint64_t v0 = sub_100005340(&qword_10001C738);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100005340(&qword_10001C740);
  __chkstk_darwin(v4);
  sub_100005384();
  sub_100012C90();
  v7._countAndFlagsBits = 0;
  v7._object = (void *)0xE000000000000000;
  sub_100012C80(v7);
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, enum case for _EntityURLRepresentation.StringInterpolation.Token.id<A>(_:), v0);
  sub_100012C70();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  v8._countAndFlagsBits = 0;
  v8._object = (void *)0xE000000000000000;
  sub_100012C80(v8);
  return sub_100012CA0();
}

uint64_t sub_10000BAFC(char a1)
{
  uint64_t v2 = sub_100005340(&qword_10001C748);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)&v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100005340(&qword_10001C698);
  __chkstk_darwin(v5 - 8);
  Swift::String v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100012D20();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  switch(a1)
  {
    case 1:
      sub_100012D10();
      sub_100012D10();
      (*(void (**)(char *, void, uint64_t, uint64_t))(v9 + 56))(v7, 0, 1, v8);
      uint64_t v10 = sub_100012BD0();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v4, 1, 1, v10);
      sub_100005340(&qword_10001C750);
      *(_OWORD *)(swift_allocObject() + 16) = xmmword_1000135B0;
      goto LABEL_4;
    case 2:
      sub_100012D10();
      sub_100012D10();
      (*(void (**)(char *, void, uint64_t, uint64_t))(v9 + 56))(v7, 0, 1, v8);
      uint64_t v11 = sub_100012BD0();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v4, 1, 1, v11);
      sub_100005340(&qword_10001C750);
      *(_OWORD *)(swift_allocObject() + 16) = xmmword_100013570;
      sub_100012D10();
LABEL_4:
      sub_100012D10();
      uint64_t result = sub_100012BE0();
      break;
    default:
      sub_100012D10();
      sub_100012D10();
      (*(void (**)(char *, void, uint64_t, uint64_t))(v9 + 56))(v7, 0, 1, v8);
      uint64_t v13 = sub_100012BD0();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v4, 1, 1, v13);
      uint64_t result = sub_100012BF0();
      break;
  }
  return result;
}

uint64_t sub_10000C358()
{
  uint64_t v0 = sub_100005340(&qword_10001C698);
  __chkstk_darwin(v0 - 8);
  uint64_t v2 = (char *)&v7 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100012D20();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v5 = sub_100012CC0();
  sub_100005E38(v5, qword_10001DE60);
  sub_100005054(v5, (uint64_t)qword_10001DE60);
  sub_100012D10();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v4 + 56))(v2, 1, 1, v3);
  return sub_100012CB0();
}

uint64_t sub_10000C4CC()
{
  if (qword_10001CE20 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_100012CC0();

  return sub_100005054(v0, (uint64_t)qword_10001DE60);
}

uint64_t sub_10000C530@<X0>(uint64_t a1@<X8>)
{
  if (qword_10001CE20 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100012CC0();
  uint64_t v3 = sub_100005054(v2, (uint64_t)qword_10001DE60);
  swift_beginAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t sub_10000C5F0(uint64_t a1)
{
  if (qword_10001CE20 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100012CC0();
  uint64_t v3 = sub_100005054(v2, (uint64_t)qword_10001DE60);
  swift_beginAccess();
  uint64_t v4 = *(void *)(v2 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 24))(v3, a1, v2);
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(a1, v2);
}

uint64_t (*sub_10000C6E8())()
{
  if (qword_10001CE20 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_100012CC0();
  sub_100005054(v0, (uint64_t)qword_10001DE60);
  swift_beginAccess();
  return j_j__swift_endAccess;
}

id sub_10000C77C()
{
  uint64_t v0 = AppleAccountSettingsModel.shared.unsafeMutableAddressor();
  swift_beginAccess();
  uint64_t v1 = (void *)*v0;
  qword_10001DE78 = *v0;

  return v1;
}

id sub_10000C7D4()
{
  uint64_t v0 = AppleAccountSettingsModel.shared.unsafeMutableAddressor();
  swift_beginAccess();
  uint64_t v1 = (void *)*v0;

  return v1;
}

uint64_t *sub_10000C824()
{
  if (qword_10001CE28 != -1) {
    swift_once();
  }
  return &qword_10001DE78;
}

id sub_10000C870()
{
  if (qword_10001CE28 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v0 = (void *)qword_10001DE78;

  return v0;
}

void sub_10000C8F4(uint64_t a1)
{
  if (qword_10001CE28 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v2 = (void *)qword_10001DE78;
  qword_10001DE78 = a1;
}

uint64_t (*sub_10000C974())()
{
  if (qword_10001CE28 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j__swift_endAccess;
}

void sub_10000CA04(void *a1)
{
  *uint64_t v1 = a1;
}

uint64_t sub_10000CA30(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return _swift_task_switch(sub_10000CA50, 0, 0);
}

uint64_t sub_10000CA50()
{
  uint64_t v1 = (*(uint64_t (**)(void))((swift_isaMask & **(void **)(v0 + 16)) + 0x140))();
  if (v1)
  {
    uint64_t v2 = (void *)v1;
    uint64_t v3 = sub_10000E600((uint64_t)&off_100018C18);
    int64_t v4 = v3[2];
    if (v4)
    {
      sub_10000E2F8(0, v4, 0);
      uint64_t v5 = 0;
      uint64_t v6 = *((void *)&_swiftEmptyArrayStorage + 2);
      do
      {
        char v7 = *((unsigned char *)v3 + v5 + 32);
        unint64_t v8 = *((void *)&_swiftEmptyArrayStorage + 3);
        if (v6 + v5 >= v8 >> 1) {
          sub_10000E2F8((char *)(v8 > 1), v6 + v5 + 1, 1);
        }
        *((void *)&_swiftEmptyArrayStorage + 2) = v6 + v5 + 1;
        *((unsigned char *)&_swiftEmptyArrayStorage + v6 + v5++ + 32) = v7;
      }
      while (v4 != v5);
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v9 = sub_10000E510((uint64_t)&off_100018C18);
    int64_t v10 = *(void *)(v9 + 16);
    if (v10)
    {
      sub_10000E2F8(0, v10, 0);
      uint64_t v11 = 0;
      uint64_t v12 = *((void *)&_swiftEmptyArrayStorage + 2);
      do
      {
        char v13 = *(unsigned char *)(v9 + v11 + 32);
        unint64_t v14 = *((void *)&_swiftEmptyArrayStorage + 3);
        if (v12 + v11 >= v14 >> 1) {
          sub_10000E2F8((char *)(v14 > 1), v12 + v11 + 1, 1);
        }
        *((void *)&_swiftEmptyArrayStorage + 2) = v12 + v11 + 1;
        *((unsigned char *)&_swiftEmptyArrayStorage + v12 + v11++ + 32) = v13;
      }
      while (v10 != v11);
    }
    swift_bridgeObjectRelease();
  }
  uint64_t v15 = *(uint64_t (**)(void *))(v0 + 8);
  return v15(&_swiftEmptyArrayStorage);
}

_UNKNOWN **sub_10000CCAC()
{
  return &off_100018C18;
}

BOOL sub_10000CCB8(char a1)
{
  return a1 == 0;
}

uint64_t sub_10000CCC4(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return _swift_task_switch(sub_10000CCE4, 0, 0);
}

uint64_t sub_10000CCE4()
{
  uint64_t v1 = (*(uint64_t (**)(void))((swift_isaMask & **(void **)(v0 + 24)) + 0x140))();
  if (v1)
  {
    uint64_t v2 = (void *)v1;
    uint64_t v3 = swift_bridgeObjectRetain();
    int64_t v4 = sub_10000E600(v3);
    swift_bridgeObjectRelease();
    int64_t v5 = v4[2];
    if (v5)
    {
      sub_10000E2F8(0, v5, 0);
      uint64_t v6 = 0;
      uint64_t v7 = *((void *)&_swiftEmptyArrayStorage + 2);
      do
      {
        char v8 = *((unsigned char *)v4 + v6 + 32);
        unint64_t v9 = *((void *)&_swiftEmptyArrayStorage + 3);
        if (v7 + v6 >= v9 >> 1) {
          sub_10000E2F8((char *)(v9 > 1), v7 + v6 + 1, 1);
        }
        *((void *)&_swiftEmptyArrayStorage + 2) = v7 + v6 + 1;
        *((unsigned char *)&_swiftEmptyArrayStorage + v7 + v6++ + 32) = v8;
      }
      while (v5 != v6);
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v10 = sub_10000E510((uint64_t)&off_100018C18);
    int64_t v11 = *(void *)(v10 + 16);
    if (v11)
    {
      sub_10000E2F8(0, v11, 0);
      uint64_t v12 = 0;
      uint64_t v13 = *((void *)&_swiftEmptyArrayStorage + 2);
      do
      {
        char v14 = *(unsigned char *)(v10 + v12 + 32);
        unint64_t v15 = *((void *)&_swiftEmptyArrayStorage + 3);
        if (v13 + v12 >= v15 >> 1) {
          sub_10000E2F8((char *)(v15 > 1), v13 + v12 + 1, 1);
        }
        *((void *)&_swiftEmptyArrayStorage + 2) = v13 + v12 + 1;
        *((unsigned char *)&_swiftEmptyArrayStorage + v13 + v12++ + 32) = v14;
      }
      while (v11 != v12);
    }
    swift_bridgeObjectRelease();
  }
  uint64_t v16 = *(uint64_t (**)(void *))(v0 + 8);
  return v16(&_swiftEmptyArrayStorage);
}

uint64_t sub_10000CF4C()
{
  uint64_t v3 = (uint64_t (__cdecl *)())((char *)&dword_10001C770 + dword_10001C770);
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_10000CFEC;
  return v3();
}

uint64_t sub_10000CFEC(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

uint64_t sub_10000D0E8()
{
  uint64_t v3 = (uint64_t (__cdecl *)())((char *)&dword_10001C780 + dword_10001C780);
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_10000F144;
  return v3();
}

id sub_10000D188@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = AppleAccountSettingsModel.shared.unsafeMutableAddressor();
  swift_beginAccess();
  uint64_t v3 = (void *)*v2;
  *a1 = *v2;

  return v3;
}

uint64_t sub_10000D1E0(uint64_t a1)
{
  uint64_t v4 = *v1;
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[2] = a1;
  v5[3] = v4;
  v5[1] = sub_10000D290;
  return _swift_task_switch(sub_10000CCE4, 0, 0);
}

uint64_t sub_10000D290(uint64_t a1)
{
  uint64_t v7 = *v2;
  uint64_t v4 = swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(uint64_t))(v7 + 8);
  if (!v1) {
    uint64_t v4 = a1;
  }
  return v5(v4);
}

uint64_t sub_10000D390(uint64_t a1)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v3 = *v1;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_10000F140;
  v4[2] = v3;
  return _swift_task_switch(sub_10000CA50, 0, 0);
}

uint64_t sub_10000D43C(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  uint64_t v4 = (uint64_t (__cdecl *)())((char *)&dword_10001C780 + dword_10001C780);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 24) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_10000D4E0;
  return v4();
}

uint64_t sub_10000D4E0(uint64_t a1)
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

uint64_t sub_10000D5F4(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_10000E9B0();
  void *v5 = v2;
  v5[1] = sub_10000D6A8;
  return EntityQuery.results()(a1, a2, v6);
}

uint64_t sub_10000D6A8()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_10000D79C(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  uint64_t v4 = (uint64_t (__cdecl *)())((char *)&dword_10001C770 + dword_10001C770);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 24) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_10000D840;
  return v4();
}

uint64_t sub_10000D840(char a1)
{
  uint64_t v3 = *(unsigned char **)(*v1 + 16);
  uint64_t v6 = *v1;
  swift_task_dealloc();
  *uint64_t v3 = a1;
  uint64_t v4 = *(uint64_t (**)(void))(v6 + 8);
  return v4();
}

uint64_t sub_10000D958()
{
  uint64_t v0 = sub_100005340(&qword_10001C738);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100005340(&qword_10001C740);
  __chkstk_darwin(v4);
  sub_100005384();
  sub_100012C90();
  v7._countAndFlagsBits = 0;
  v7._object = (void *)0xE000000000000000;
  sub_100012C80(v7);
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, enum case for _EntityURLRepresentation.StringInterpolation.Token.id<A>(_:), v0);
  sub_100012C70();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  v8._countAndFlagsBits = 0;
  v8._object = (void *)0xE000000000000000;
  sub_100012C80(v8);
  return sub_100012CA0();
}

id sub_10000DB04@<X0>(void *a1@<X8>)
{
  if (qword_10001CE28 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v2 = (void *)qword_10001DE78;
  *a1 = qword_10001DE78;

  return v2;
}

uint64_t sub_10000DB90()
{
  sub_100005DE4();
  uint64_t v2 = sub_100012C30();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
  return sub_10000F128(v3, v0, v2, v1);
}

void sub_10000DC24(unsigned char *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_10000DC30(uint64_t a1)
{
  unint64_t v2 = sub_100005384();

  return static AppEntity.defaultResolverSpecification.getter(a1, v2);
}

uint64_t sub_10000DC7C()
{
  return sub_10000BAFC(*v0);
}

uint64_t sub_10000DC84(uint64_t a1)
{
  unint64_t v2 = sub_10000ED34();

  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

unint64_t sub_10000DCD0(char a1)
{
  unint64_t result = 0xD000000000000018;
  switch(a1)
  {
    case 1:
      unint64_t result = 0xD000000000000033;
      break;
    case 2:
      unint64_t result = 0xD000000000000033;
      break;
    case 3:
      unint64_t result = 0xD000000000000032;
      break;
    case 4:
    case 6:
      unint64_t result = 0xD00000000000002BLL;
      break;
    case 5:
      unint64_t result = 0xD00000000000002CLL;
      break;
    case 7:
      unint64_t result = 0xD00000000000002ELL;
      break;
    case 8:
      unint64_t result = 0xD00000000000004CLL;
      break;
    case 9:
      unint64_t result = 0xD000000000000049;
      break;
    case 10:
      unint64_t result = 0xD000000000000045;
      break;
    case 11:
      unint64_t result = 0xD00000000000004DLL;
      break;
    case 12:
      unint64_t result = 0xD000000000000046;
      break;
    case 13:
      unint64_t result = 0xD000000000000049;
      break;
    case 14:
      unint64_t result = 0xD000000000000047;
      break;
    case 15:
      unint64_t result = 0xD00000000000004ALL;
      break;
    case 16:
      unint64_t result = 0xD000000000000047;
      break;
    case 17:
      unint64_t result = 0xD00000000000003BLL;
      break;
    case 18:
      unint64_t result = 0xD000000000000046;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t sub_10000DE90(char a1)
{
  unint64_t result = 0xD000000000000018;
  switch(a1)
  {
    case 1:
      unint64_t result = 0xD000000000000033;
      break;
    case 2:
      unint64_t result = 0xD000000000000033;
      break;
    case 3:
      unint64_t result = 0xD000000000000032;
      break;
    case 4:
    case 6:
      unint64_t result = 0xD00000000000002BLL;
      break;
    case 5:
      unint64_t result = 0xD00000000000002CLL;
      break;
    case 7:
      unint64_t result = 0xD00000000000002ELL;
      break;
    case 8:
      unint64_t result = 0xD00000000000004CLL;
      break;
    case 9:
      unint64_t result = 0xD000000000000049;
      break;
    case 10:
      unint64_t result = 0xD000000000000045;
      break;
    case 11:
      unint64_t result = 0xD00000000000004DLL;
      break;
    case 12:
      unint64_t result = 0xD000000000000046;
      break;
    case 13:
      unint64_t result = 0xD000000000000049;
      break;
    case 14:
      unint64_t result = 0xD000000000000047;
      break;
    case 15:
      unint64_t result = 0xD00000000000004ALL;
      break;
    case 16:
      unint64_t result = 0xD000000000000047;
      break;
    case 17:
      unint64_t result = 0xD00000000000003BLL;
      break;
    case 18:
      unint64_t result = 0xD000000000000046;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_10000E050()
{
  swift_bridgeObjectRetain();

  return sub_10000E8A4();
}

uint64_t sub_10000E098(char *a1, char *a2)
{
  char v2 = *a2;
  unint64_t v3 = sub_10000DE90(*a1);
  uint64_t v5 = v4;
  if (v3 == sub_10000DE90(v2) && v5 == v6) {
    char v8 = 1;
  }
  else {
    char v8 = sub_100012E70();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

Swift::Int sub_10000E124()
{
  char v1 = *v0;
  sub_100012EB0();
  sub_10000DE90(v1);
  sub_100012E20();
  swift_bridgeObjectRelease();
  return sub_100012EC0();
}

uint64_t sub_10000E188()
{
  sub_10000DE90(*v0);
  sub_100012E20();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_10000E1DC()
{
  char v1 = *v0;
  sub_100012EB0();
  sub_10000DE90(v1);
  sub_100012E20();
  swift_bridgeObjectRelease();
  return sub_100012EC0();
}

uint64_t sub_10000E23C@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_10000E8A4();
  *a1 = result;
  return result;
}

unint64_t sub_10000E26C@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_10000DE90(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

void sub_10000E298(void *a1@<X8>)
{
  *a1 = &off_100018C18;
}

unint64_t sub_10000E2A8()
{
  return sub_10000DCD0(*v0);
}

uint64_t sub_10000E2B0@<X0>(unsigned char *a1@<X8>)
{
  swift_bridgeObjectRetain();
  uint64_t result = sub_10000E8A4();
  *a1 = result;
  return result;
}

char *sub_10000E2F8(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_10000E338(a1, a2, a3, *v3);
  *unint64_t v3 = result;
  return result;
}

char *sub_10000E318(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_10000E424(a1, a2, a3, *v3);
  *unint64_t v3 = result;
  return result;
}

char *sub_10000E338(char *result, int64_t a2, char a3, char *a4)
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
    sub_100005340((uint64_t *)&unk_10001C860);
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

char *sub_10000E424(char *result, int64_t a2, char a3, char *a4)
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
    sub_100005340(&qword_10001C858);
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

uint64_t sub_10000E510(uint64_t result)
{
  unint64_t v1 = 0;
  unint64_t v2 = *(void *)(result + 16);
  uint64_t v3 = result + 32;
LABEL_2:
  if (v1 <= v2) {
    unint64_t v4 = v2;
  }
  else {
    unint64_t v4 = v1;
  }
  unint64_t v5 = v1;
  while (1)
  {
    if (v2 == v5) {
      return (uint64_t)&_swiftEmptyArrayStorage;
    }
    if (v4 == v5) {
      break;
    }
    unint64_t v1 = v5 + 1;
    if (!*(unsigned __int8 *)(v3 + v5++))
    {
      uint64_t result = swift_isUniquelyReferenced_nonNull_native();
      if ((result & 1) == 0) {
        uint64_t result = (uint64_t)sub_10000E318(0, *((void *)&_swiftEmptyArrayStorage + 2) + 1, 1);
      }
      unint64_t v8 = *((void *)&_swiftEmptyArrayStorage + 2);
      unint64_t v7 = *((void *)&_swiftEmptyArrayStorage + 3);
      if (v8 >= v7 >> 1) {
        uint64_t result = (uint64_t)sub_10000E318((char *)(v7 > 1), v8 + 1, 1);
      }
      *((void *)&_swiftEmptyArrayStorage + 2) = v8 + 1;
      *((unsigned char *)&_swiftEmptyArrayStorage + v8 + 32) = 0;
      goto LABEL_2;
    }
  }
  __break(1u);
  return result;
}

void *sub_10000E600(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    unint64_t v2 = (char *)(a1 + 32);
    do
    {
      char v4 = *v2++;
      char v3 = v4;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        sub_10000E318(0, *((void *)&_swiftEmptyArrayStorage + 2) + 1, 1);
      }
      unint64_t v6 = *((void *)&_swiftEmptyArrayStorage + 2);
      unint64_t v5 = *((void *)&_swiftEmptyArrayStorage + 3);
      if (v6 >= v5 >> 1) {
        sub_10000E318((char *)(v5 > 1), v6 + 1, 1);
      }
      *((void *)&_swiftEmptyArrayStorage + 2) = v6 + 1;
      *((unsigned char *)&_swiftEmptyArrayStorage + v6 + 32) = v3;
      --v1;
    }
    while (v1);
  }
  return &_swiftEmptyArrayStorage;
}

uint64_t sub_10000E6D4()
{
  return _swift_task_switch(sub_10000E6F0, 0, 0);
}

uint64_t sub_10000E6F0()
{
  uint64_t v1 = sub_10000E600((uint64_t)&off_100018C18);
  if (v1[2]) {
    uint64_t v2 = *((unsigned __int8 *)v1 + 32);
  }
  else {
    uint64_t v2 = 19;
  }
  swift_bridgeObjectRelease();
  char v3 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v3(v2);
}

uint64_t sub_10000E77C()
{
  return _swift_task_switch(sub_10000E798, 0, 0);
}

uint64_t sub_10000E798()
{
  sub_10000E2F8(0, 19, 0);
  uint64_t v1 = 0;
  uint64_t v2 = &_swiftEmptyArrayStorage;
  uint64_t v3 = *((void *)&_swiftEmptyArrayStorage + 2);
  do
  {
    char v4 = *((unsigned char *)&off_100018C18 + v1 + 32);
    unint64_t v8 = v2;
    unint64_t v5 = v2[3];
    if (v3 + v1 >= v5 >> 1)
    {
      sub_10000E2F8((char *)(v5 > 1), v3 + v1 + 1, 1);
      uint64_t v2 = v8;
    }
    v2[2] = v3 + v1 + 1;
    *((unsigned char *)v2 + v3 + v1++ + 32) = v4;
  }
  while (v1 != 19);
  unint64_t v6 = *(uint64_t (**)(void))(v0 + 8);
  return v6();
}

uint64_t sub_10000E8A4()
{
  unint64_t v0 = sub_100012E80();
  swift_bridgeObjectRelease();
  if (v0 >= 0x13) {
    return 19;
  }
  else {
    return v0;
  }
}

unint64_t sub_10000E8FC()
{
  unint64_t result = qword_10001C788;
  if (!qword_10001C788)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C788);
  }
  return result;
}

unint64_t sub_10000E954()
{
  unint64_t result = qword_10001C790[0];
  if (!qword_10001C790[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_10001C790);
  }
  return result;
}

unint64_t sub_10000E9B0()
{
  unint64_t result = qword_10001C7A8;
  if (!qword_10001C7A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C7A8);
  }
  return result;
}

unint64_t sub_10000EA08()
{
  unint64_t result = qword_10001C7B8;
  if (!qword_10001C7B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C7B8);
  }
  return result;
}

unint64_t sub_10000EA64()
{
  unint64_t result = qword_10001C7C0;
  if (!qword_10001C7C0)
  {
    sub_10000EAD8(qword_10001C7C8);
    sub_10000B7BC();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C7C0);
  }
  return result;
}

uint64_t sub_10000EAD8(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_10000EB24()
{
  unint64_t result = qword_10001C7E0;
  if (!qword_10001C7E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C7E0);
  }
  return result;
}

unint64_t sub_10000EB7C()
{
  unint64_t result = qword_10001C7E8;
  if (!qword_10001C7E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C7E8);
  }
  return result;
}

unint64_t sub_10000EBD4()
{
  unint64_t result = qword_10001C7F0;
  if (!qword_10001C7F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C7F0);
  }
  return result;
}

unint64_t sub_10000EC2C()
{
  unint64_t result = qword_10001C7F8;
  if (!qword_10001C7F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C7F8);
  }
  return result;
}

unint64_t sub_10000EC84()
{
  unint64_t result = qword_10001C808;
  if (!qword_10001C808)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C808);
  }
  return result;
}

unint64_t sub_10000ECDC()
{
  unint64_t result = qword_10001C810;
  if (!qword_10001C810)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C810);
  }
  return result;
}

unint64_t sub_10000ED34()
{
  unint64_t result = qword_10001C818;
  if (!qword_10001C818)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C818);
  }
  return result;
}

unint64_t sub_10000ED8C()
{
  unint64_t result = qword_10001C820;
  if (!qword_10001C820)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C820);
  }
  return result;
}

uint64_t sub_10000EDE0()
{
  return sub_10000EF08(&qword_10001C828, &qword_10001C830);
}

unint64_t sub_10000EE20()
{
  unint64_t result = qword_10001C838;
  if (!qword_10001C838)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C838);
  }
  return result;
}

unint64_t sub_10000EE78()
{
  unint64_t result = qword_10001C840;
  if (!qword_10001C840)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C840);
  }
  return result;
}

uint64_t sub_10000EECC()
{
  return sub_10000EF08(&qword_10001C848, &qword_10001C850);
}

uint64_t sub_10000EF08(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10000EAD8(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unsigned char *initializeBufferWithCopyOfBuffer for AppleAccountMainDynamicDestination(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

ValueMetadata *type metadata accessor for AppleAccountMainDynamicDeepLinks()
{
  return &type metadata for AppleAccountMainDynamicDeepLinks;
}

ValueMetadata *type metadata accessor for AppleAccountMainDynamicDeepLinks.AvailabitityQuery()
{
  return &type metadata for AppleAccountMainDynamicDeepLinks.AvailabitityQuery;
}

uint64_t _s19AppleAccountIntents34AppleAccountMainDynamicDestinationOwet_0(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xEE) {
    goto LABEL_17;
  }
  if (a2 + 18 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 18) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 18;
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
      return (*a1 | (v4 << 8)) - 18;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 18;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0x13;
  int v8 = v6 - 19;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *_s19AppleAccountIntents34AppleAccountMainDynamicDestinationOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 18 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 18) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xEE) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xED)
  {
    unsigned int v6 = ((a2 - 238) >> 8) + 1;
    *uint64_t result = a2 + 18;
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
        JUMPOUT(0x10000F0E0);
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
          *uint64_t result = a2 + 18;
        break;
    }
  }
  return result;
}

uint64_t sub_10000F108(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_10000F110(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for AppleAccountMainDynamicDestination()
{
  return &type metadata for AppleAccountMainDynamicDestination;
}

uint64_t sub_10000F128(uint64_t (*a1)(uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return a1(a3, a4);
}

id sub_10000F14C()
{
  id result = [objc_allocWithZone((Class)type metadata accessor for AppleAccountSettingsModel()) init];
  static AppleAccountSettingsModel.shared = (uint64_t)result;
  return result;
}

id AppleAccountSettingsModel.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return [v1 init];
}

uint64_t *AppleAccountSettingsModel.shared.unsafeMutableAddressor()
{
  if (qword_10001D940 != -1) {
    swift_once();
  }
  return &static AppleAccountSettingsModel.shared;
}

id static AppleAccountSettingsModel.shared.getter()
{
  if (qword_10001D940 != -1) {
    swift_once();
  }
  swift_beginAccess();
  unint64_t v0 = (void *)static AppleAccountSettingsModel.shared;

  return v0;
}

void static AppleAccountSettingsModel.shared.setter(uint64_t a1)
{
  if (qword_10001D940 != -1) {
    swift_once();
  }
  swift_beginAccess();
  int v2 = (void *)static AppleAccountSettingsModel.shared;
  static AppleAccountSettingsModel.shared = a1;
}

uint64_t (*static AppleAccountSettingsModel.shared.modify())()
{
  if (qword_10001D940 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t sub_10000F38C()
{
  return sub_10000F974();
}

uint64_t sub_10000F3A0@<X0>(void **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((swift_isaMask & **a1) + 0x80))();
  *a2 = result;
  a2[1] = v4;
  return result;
}

uint64_t sub_10000F3FC(uint64_t *a1, void **a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))((swift_isaMask & **a2) + 0x88);
  swift_bridgeObjectRetain();
  return v4(v2, v3);
}

uint64_t sub_10000F474()
{
  return sub_10000FAC8();
}

uint64_t (*sub_10000F488(void *a1))()
{
  uint64_t v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_100012D80();
  return sub_10000F514;
}

uint64_t variable initialization expression of AppleAccountSettingsModel._fullname()
{
  return 0;
}

uint64_t sub_10000F524()
{
  return sub_1000109CC((uint64_t)&OBJC_IVAR____TtC19AppleAccountIntents25AppleAccountSettingsModel__fullname, &qword_10001C870);
}

uint64_t sub_10000F538(uint64_t a1)
{
  return sub_100010A50(a1, &qword_10001C878, (uint64_t)&OBJC_IVAR____TtC19AppleAccountIntents25AppleAccountSettingsModel__fullname, &qword_10001C870);
}

uint64_t (*sub_10000F554(void *a1))()
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = sub_100005340(&qword_10001C878);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  BOOL v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC19AppleAccountIntents25AppleAccountSettingsModel__fullname;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = sub_100005340(&qword_10001C870);
  sub_100012D60();
  swift_endAccess();
  return sub_10000F664;
}

uint64_t property wrapper backing initializer of AppleAccountSettingsModel.formattedUsername()
{
  return sub_100012D50();
}

uint64_t sub_10000F698()
{
  return sub_10000F974();
}

uint64_t sub_10000F6AC@<X0>(void **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((swift_isaMask & **a1) + 0xB0))();
  *a2 = result;
  a2[1] = v4;
  return result;
}

uint64_t sub_10000F708(uint64_t *a1, void **a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))((swift_isaMask & **a2) + 0xB8);
  swift_bridgeObjectRetain();
  return v4(v2, v3);
}

uint64_t sub_10000F780()
{
  return sub_10000FAC8();
}

uint64_t (*sub_10000F794(void *a1))()
{
  uint64_t v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_100012D80();
  return sub_10000F514;
}

uint64_t sub_10000F820()
{
  return sub_1000109CC((uint64_t)&OBJC_IVAR____TtC19AppleAccountIntents25AppleAccountSettingsModel__formattedUsername, &qword_10001C870);
}

uint64_t sub_10000F834(uint64_t a1)
{
  return sub_100010A50(a1, &qword_10001C878, (uint64_t)&OBJC_IVAR____TtC19AppleAccountIntents25AppleAccountSettingsModel__formattedUsername, &qword_10001C870);
}

uint64_t (*sub_10000F850(void *a1))()
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = sub_100005340(&qword_10001C878);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  BOOL v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC19AppleAccountIntents25AppleAccountSettingsModel__formattedUsername;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = sub_100005340(&qword_10001C870);
  sub_100012D60();
  swift_endAccess();
  return sub_10000F664;
}

uint64_t sub_10000F960()
{
  return sub_10000F974();
}

uint64_t sub_10000F974()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_100012D90();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_10000F9E0@<X0>(void **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((swift_isaMask & **a1) + 0xE0))();
  *a2 = result;
  a2[1] = v4;
  return result;
}

uint64_t sub_10000FA3C(uint64_t *a1, void **a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))((swift_isaMask & **a2) + 0xE8);
  swift_bridgeObjectRetain();
  return v4(v2, v3);
}

uint64_t sub_10000FAB4()
{
  return sub_10000FAC8();
}

uint64_t sub_10000FAC8()
{
  swift_getKeyPath();
  swift_getKeyPath();
  id v1 = v0;
  return sub_100012DA0();
}

uint64_t (*sub_10000FB3C(void *a1))()
{
  uint64_t v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_100012D80();
  return sub_10000F514;
}

void sub_10000FBC8(void *a1)
{
  id v1 = (void *)*a1;
  (*(void (**)(void, void))(*a1 + 48))(*a1, 0);
  swift_release();
  swift_release();

  free(v1);
}

uint64_t sub_10000FC30()
{
  return sub_1000109CC((uint64_t)&OBJC_IVAR____TtC19AppleAccountIntents25AppleAccountSettingsModel__accountDescription, &qword_10001C870);
}

uint64_t sub_10000FC44(uint64_t a1)
{
  return sub_100010A50(a1, &qword_10001C878, (uint64_t)&OBJC_IVAR____TtC19AppleAccountIntents25AppleAccountSettingsModel__accountDescription, &qword_10001C870);
}

uint64_t (*sub_10000FC60(void *a1))()
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = sub_100005340(&qword_10001C878);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  BOOL v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC19AppleAccountIntents25AppleAccountSettingsModel__accountDescription;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = sub_100005340(&qword_10001C870);
  sub_100012D60();
  swift_endAccess();
  return sub_10000F664;
}

char *AppleAccountSettingsModel.init()()
{
  uint64_t v27 = sub_100005340(&qword_10001C880);
  uint64_t v1 = *(void *)(v27 - 8);
  __chkstk_darwin(v27);
  uint64_t v3 = (char *)&v26 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100005340(&qword_10001C870);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  BOOL v7 = (char *)&v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = &v0[OBJC_IVAR____TtC19AppleAccountIntents25AppleAccountSettingsModel__fullname];
  uint64_t v29 = 0;
  unint64_t v30 = 0xE000000000000000;
  uint64_t v9 = v0;
  sub_100012D50();
  uint64_t v10 = *(void (**)(char *, char *, uint64_t))(v5 + 32);
  v10(v8, v7, v4);
  size_t v11 = &v9[OBJC_IVAR____TtC19AppleAccountIntents25AppleAccountSettingsModel__formattedUsername];
  uint64_t v29 = 0;
  unint64_t v30 = 0xE000000000000000;
  sub_100012D50();
  v10(v11, v7, v4);
  uint64_t v12 = &v9[OBJC_IVAR____TtC19AppleAccountIntents25AppleAccountSettingsModel__accountDescription];
  uint64_t v29 = 0;
  unint64_t v30 = 0xE000000000000000;
  sub_100012D50();
  v10(v12, v7, v4);
  uint64_t v13 = &v9[OBJC_IVAR____TtC19AppleAccountIntents25AppleAccountSettingsModel__account];
  uint64_t v29 = 0;
  sub_100005340(&qword_10001C888);
  sub_100012D50();
  (*(void (**)(char *, char *, uint64_t))(v1 + 32))(v13, v3, v27);
  char v14 = self;
  uint64_t result = (char *)[v14 defaultStore];
  if (result)
  {
    uint64_t v16 = result;
    uint64_t v17 = OBJC_IVAR____TtC19AppleAccountIntents25AppleAccountSettingsModel_serviceOwnersManager;
    id v18 = [objc_allocWithZone((Class)AIDAServiceOwnersManager) initWithAccountStore:result];

    *(void *)&v9[v17] = v18;
    uint64_t result = (char *)[v14 defaultStore];
    if (result)
    {
      uint64_t v19 = result;
      uint64_t v20 = OBJC_IVAR____TtC19AppleAccountIntents25AppleAccountSettingsModel_accountManager;
      id v21 = [objc_allocWithZone((Class)AIDAAccountManager) initWithAccountStore:result];

      *(void *)&v9[v20] = v21;
      uint64_t v22 = (objc_class *)type metadata accessor for AppleAccountSettingsModel();
      v28.receiver = v9;
      v28.super_class = v22;
      uint64_t v23 = (char *)objc_msgSendSuper2(&v28, "init");
      uint64_t v24 = *(void **)&v23[OBJC_IVAR____TtC19AppleAccountIntents25AppleAccountSettingsModel_accountManager];
      uint64_t v25 = v23;
      [v24 setDelegate:v25];
      sub_100011084();

      return v25;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t variable initialization expression of AppleAccountSettingsModel._account()
{
  return 0;
}

uint64_t property wrapper backing initializer of AppleAccountSettingsModel.account()
{
  return sub_100012D50();
}

uint64_t type metadata accessor for AppleAccountSettingsModel()
{
  uint64_t result = qword_10001DA30;
  if (!qword_10001DA30) {
    return swift_getSingletonMetadata();
  }
  return result;
}

id variable initialization expression of AppleAccountSettingsModel.serviceOwnersManager()
{
  return sub_100010164((Class *)AIDAServiceOwnersManager_ptr);
}

id variable initialization expression of AppleAccountSettingsModel.accountManager()
{
  return sub_100010164((Class *)AIDAAccountManager_ptr);
}

id sub_100010164(Class *a1)
{
  id result = [self defaultStore];
  if (result)
  {
    uint64_t v3 = result;
    id v4 = [objc_allocWithZone(*a1) initWithAccountStore:result];

    return v4;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1000101F8()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_100005340(&qword_10001C970);
  __chkstk_darwin(v2 - 8);
  id v4 = (char *)&v26 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100012D00();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = (*(uint64_t (**)(uint64_t))((swift_isaMask & *v0) + 0x110))(v7);
  if (v10)
  {
    size_t v11 = (void *)v10;
    uint64_t v31 = sub_100012E10();
    uint64_t v32 = v12;
    id v13 = [v11 objectForKeyedSubscript:sub_100012E90()];
    swift_unknownObjectRelease();
    if (v13)
    {
      sub_100012E30();
      swift_unknownObjectRelease();
    }
    else
    {
      long long v29 = 0u;
      long long v30 = 0u;
    }
    sub_100012524((uint64_t)&v29, (uint64_t)&v31);
    if (v33)
    {
      int v16 = swift_dynamicCast();
      uint64_t v17 = v28;
      if (!v16) {
        uint64_t v17 = 0;
      }
      uint64_t v27 = v17;
    }
    else
    {
      sub_10001258C((uint64_t)&v31);
      uint64_t v27 = 0;
    }
    uint64_t v31 = sub_100012E10();
    uint64_t v32 = v18;
    id v19 = [v11 objectForKeyedSubscript:sub_100012E90()];
    swift_unknownObjectRelease();
    if (v19)
    {
      sub_100012E30();
      swift_unknownObjectRelease();
    }
    else
    {
      long long v29 = 0u;
      long long v30 = 0u;
    }
    sub_100012524((uint64_t)&v29, (uint64_t)&v31);
    if (v33) {
      swift_dynamicCast();
    }
    else {
      sub_10001258C((uint64_t)&v31);
    }
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56))(v4, 1, 1, v5);
    sub_100012CE0();
    uint64_t v20 = self;
    Class v21 = sub_100012CF0();
    id v22 = [v20 localizedStringFromPersonNameComponents:v21 style:2 options:0];

    uint64_t v23 = sub_100012E10();
    uint64_t v25 = v24;

    (*(void (**)(uint64_t, uint64_t))((swift_isaMask & *v1) + 0x88))(v23, v25);
    return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v9, v5);
  }
  else
  {
    char v14 = *(uint64_t (**)(void))((swift_isaMask & *v0) + 0x88);
    return v14();
  }
}

uint64_t sub_100010664()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_100012D90();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_1000106D8@<X0>(void **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((swift_isaMask & **a1) + 0x110))();
  *a2 = result;
  return result;
}

uint64_t sub_10001073C(id *a1, void **a2)
{
  id v2 = *a1;
  uint64_t v3 = *(uint64_t (**)(id))((swift_isaMask & **a2) + 0x118);
  id v4 = *a1;
  return v3(v2);
}

void sub_1000107AC(void *a1)
{
  swift_getKeyPath();
  swift_getKeyPath();
  id v3 = a1;
  id v4 = v1;
  sub_100012DA0();
  sub_1000101F8();
}

void (*sub_10001082C(void *a1))(uint64_t a1, char a2)
{
  a1[2] = v1;
  swift_getKeyPath();
  swift_getKeyPath();
  sub_100012D90();
  swift_release();
  swift_release();
  *a1 = a1[1];
  return sub_1000108CC;
}

void sub_1000108CC(uint64_t a1, char a2)
{
  id v4 = *(void **)a1;
  swift_getKeyPath();
  swift_getKeyPath();
  *(void *)(a1 + 8) = v4;
  uint64_t v5 = *(void **)(a1 + 16);
  id v8 = v4;
  v5;
  if (a2)
  {
    id v6 = v8;
    sub_100012DA0();
    sub_1000101F8();

    uint64_t v7 = *(void **)a1;
  }
  else
  {
    sub_100012DA0();
    sub_1000101F8();
    uint64_t v7 = v8;
  }
}

uint64_t sub_1000109B8()
{
  return sub_1000109CC((uint64_t)&OBJC_IVAR____TtC19AppleAccountIntents25AppleAccountSettingsModel__account, &qword_10001C880);
}

uint64_t sub_1000109CC(uint64_t a1, uint64_t *a2)
{
  return swift_endAccess();
}

uint64_t sub_100010A34(uint64_t a1)
{
  return sub_100010A50(a1, &qword_10001C890, (uint64_t)&OBJC_IVAR____TtC19AppleAccountIntents25AppleAccountSettingsModel__account, &qword_10001C880);
}

uint64_t sub_100010A50(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v6 = sub_100005340(a2);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)&v10 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v6);
  swift_beginAccess();
  sub_100005340(a4);
  sub_100012D70();
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
}

uint64_t (*sub_100010B80(void *a1))()
{
  id v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = sub_100005340(&qword_10001C890);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  uint64_t v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC19AppleAccountIntents25AppleAccountSettingsModel__account;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = sub_100005340(&qword_10001C880);
  sub_100012D60();
  swift_endAccess();
  return sub_10000F664;
}

void sub_100010C90(uint64_t a1, char a2)
{
  id v3 = *(void **)a1;
  uint64_t v4 = *(void (**)(void, void, void))(*(void *)(*(void *)a1 + 88) + 16);
  v4(*(void *)(*(void *)a1 + 104), v3[14], v3[10]);
  uint64_t v5 = (void *)v3[14];
  size_t v6 = (void *)v3[12];
  uint64_t v7 = (void *)v3[13];
  uint64_t v8 = v3[10];
  uint64_t v9 = v3[11];
  if (a2)
  {
    v4(v3[12], v3[13], v3[10]);
    swift_beginAccess();
    sub_100012D70();
    swift_endAccess();
    uint64_t v10 = *(void (**)(void *, uint64_t))(v9 + 8);
    v10(v7, v8);
    v10(v5, v8);
  }
  else
  {
    swift_beginAccess();
    sub_100012D70();
    swift_endAccess();
    (*(void (**)(void *, uint64_t))(v9 + 8))(v5, v8);
  }
  free(v5);
  free(v7);
  free(v6);

  free(v3);
}

id sub_100010E00()
{
  return *(id *)(v0 + OBJC_IVAR____TtC19AppleAccountIntents25AppleAccountSettingsModel_serviceOwnersManager);
}

id sub_100010E10()
{
  return *(id *)(v0 + OBJC_IVAR____TtC19AppleAccountIntents25AppleAccountSettingsModel_accountManager);
}

id sub_100010E20()
{
  return sub_100010E38((id *)&AIDAServiceTypeCloud);
}

id sub_100010E2C()
{
  return sub_100010E38((id *)&AIDAServiceTypeStore);
}

id sub_100010E38(id *a1)
{
  id v2 = *(void **)(v1 + OBJC_IVAR____TtC19AppleAccountIntents25AppleAccountSettingsModel_accountManager);
  id v3 = *a1;
  id result = [v2 accounts];
  if (result)
  {
    uint64_t v5 = result;
    type metadata accessor for AIDAServiceType(0);
    sub_10001121C();
    sub_100012478(&qword_10001C8A0);
    uint64_t v6 = sub_100012DD0();

    if (*(void *)(v6 + 16) && (unint64_t v7 = sub_1000118F8((uint64_t)v3), (v8 & 1) != 0))
    {
      uint64_t v9 = *(void **)(*(void *)(v6 + 56) + 8 * v7);
      id v10 = v9;
    }
    else
    {
      uint64_t v9 = 0;
    }

    swift_bridgeObjectRelease();
    return v9;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_100010F24()
{
  uint64_t result = (*(uint64_t (**)(void))((swift_isaMask & *v0) + 0x140))();
  if (!result)
  {
    id v2 = *(uint64_t (**)(void))((swift_isaMask & *v0) + 0x148);
    return v2();
  }
  return result;
}

uint64_t sub_100011084()
{
  uint64_t v1 = *(void **)((char *)v0 + OBJC_IVAR____TtC19AppleAccountIntents25AppleAccountSettingsModel_accountManager);
  uint64_t v2 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v6[4] = sub_100012624;
  v6[5] = v2;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 1107296256;
  v6[2] = sub_10001125C;
  v6[3] = &unk_100018FC0;
  id v3 = _Block_copy(v6);
  swift_release();
  [v1 addAccountChangeObserver:v0 handler:v3];
  _Block_release(v3);
  uint64_t v4 = (*(uint64_t (**)(void))((swift_isaMask & *v0) + 0x150))();
  return (*(uint64_t (**)(uint64_t))((swift_isaMask & *v0) + 0x118))(v4);
}

void type metadata accessor for AIDAServiceType(uint64_t a1)
{
}

unint64_t sub_10001121C()
{
  unint64_t result = qword_10001C898;
  if (!qword_10001C898)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10001C898);
  }
  return result;
}

uint64_t sub_10001125C(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t, uint64_t))(a1 + 32);
  type metadata accessor for AIDAServiceType(0);
  sub_10001121C();
  sub_100012478(&qword_10001C8A0);
  uint64_t v2 = sub_100012DD0();
  uint64_t v3 = sub_100012DD0();
  swift_retain();
  v1(v2, v3);
  swift_release();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

id AppleAccountSettingsModel.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AppleAccountSettingsModel();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_1000114A8@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for AppleAccountSettingsModel();
  uint64_t result = sub_100012D40();
  *a1 = result;
  return result;
}

uint64_t sub_1000114E8(uint64_t a1, uint64_t a2)
{
  return sub_1000115E0(a1, a2, (uint64_t (*)(uint64_t))&String.hashValue.getter);
}

uint64_t sub_100011500()
{
  sub_100012E10();
  sub_100012E20();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_100011554()
{
  sub_100012E10();
  sub_100012EB0();
  sub_100012E20();
  Swift::Int v0 = sub_100012EC0();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_1000115C8(uint64_t a1, uint64_t a2)
{
  return sub_1000115E0(a1, a2, (uint64_t (*)(uint64_t))&String._bridgeToObjectiveC());
}

uint64_t sub_1000115E0(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = sub_100012E10();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_100011624(uint64_t a1, id *a2)
{
  uint64_t result = sub_100012DF0();
  *a2 = 0;
  return result;
}

uint64_t sub_10001169C(uint64_t a1, id *a2)
{
  char v3 = sub_100012E00();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_10001171C@<X0>(void *a1@<X8>)
{
  sub_100012E10();
  NSString v2 = sub_100012DE0();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_100011760()
{
  uint64_t v0 = sub_100012E10();
  uint64_t v2 = v1;
  if (v0 == sub_100012E10() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_100012E70();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_1000117EC@<X0>(void *a1@<X8>)
{
  NSString v2 = sub_100012DE0();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_100011834@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100012E10();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_100011860(uint64_t a1)
{
  uint64_t v2 = sub_100012478(&qword_10001C8A0);
  uint64_t v3 = sub_100012478(&qword_10001C960);

  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

unint64_t sub_1000118F8(uint64_t a1)
{
  sub_100012E10();
  sub_100012EB0();
  sub_100012E20();
  Swift::Int v2 = sub_100012EC0();
  swift_bridgeObjectRelease();

  return sub_10001198C(a1, v2);
}

unint64_t sub_10001198C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v5 = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
  {
    uint64_t v6 = sub_100012E10();
    uint64_t v8 = v7;
    if (v6 == sub_100012E10() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    char v11 = sub_100012E70();
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
          uint64_t v13 = sub_100012E10();
          uint64_t v15 = v14;
          if (v13 == sub_100012E10() && v15 == v16) {
            break;
          }
          char v18 = sub_100012E70();
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

uint64_t sub_100011B04(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_100005340(&qword_10001C968);
  char v39 = a2;
  uint64_t v6 = sub_100012E50();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v38 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  uint64_t v36 = v2;
  int64_t v37 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v20 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v21 = v20 | (v13 << 6);
      goto LABEL_31;
    }
    int64_t v22 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v22 >= v37) {
      break;
    }
    uint64_t v23 = (void *)(v5 + 64);
    unint64_t v24 = *(void *)(v38 + 8 * v22);
    ++v13;
    if (!v24)
    {
      int64_t v13 = v22 + 1;
      if (v22 + 1 >= v37) {
        goto LABEL_33;
      }
      unint64_t v24 = *(void *)(v38 + 8 * v13);
      if (!v24)
      {
        int64_t v25 = v22 + 2;
        if (v25 >= v37)
        {
LABEL_33:
          swift_release();
          uint64_t v3 = v36;
          if ((v39 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v24 = *(void *)(v38 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            int64_t v13 = v25 + 1;
            if (__OFADD__(v25, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v37) {
              goto LABEL_33;
            }
            unint64_t v24 = *(void *)(v38 + 8 * v13);
            ++v25;
            if (v24) {
              goto LABEL_30;
            }
          }
        }
        int64_t v13 = v25;
      }
    }
LABEL_30:
    unint64_t v10 = (v24 - 1) & v24;
    unint64_t v21 = __clz(__rbit64(v24)) + (v13 << 6);
LABEL_31:
    uint64_t v30 = 8 * v21;
    uint64_t v31 = *(void **)(*(void *)(v5 + 48) + v30);
    uint64_t v32 = *(void **)(*(void *)(v5 + 56) + v30);
    if ((v39 & 1) == 0)
    {
      id v33 = v31;
      id v34 = v32;
    }
    sub_100012E10();
    sub_100012EB0();
    sub_100012E20();
    Swift::Int v14 = sub_100012EC0();
    uint64_t result = swift_bridgeObjectRelease();
    uint64_t v15 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v16 = v14 & ~v15;
    unint64_t v17 = v16 >> 6;
    if (((-1 << v16) & ~*(void *)(v11 + 8 * (v16 >> 6))) != 0)
    {
      unint64_t v18 = __clz(__rbit64((-1 << v16) & ~*(void *)(v11 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v26 = 0;
      unint64_t v27 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v28 = v17 == v27;
        if (v17 == v27) {
          unint64_t v17 = 0;
        }
        v26 |= v28;
        uint64_t v29 = *(void *)(v11 + 8 * v17);
      }
      while (v29 == -1);
      unint64_t v18 = __clz(__rbit64(~v29)) + (v17 << 6);
    }
    *(void *)(v11 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    uint64_t v19 = 8 * v18;
    *(void *)(*(void *)(v7 + 48) + v19) = v31;
    *(void *)(*(void *)(v7 + 56) + v19) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v36;
  uint64_t v23 = (void *)(v5 + 64);
  if ((v39 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v35 = 1 << *(unsigned char *)(v5 + 32);
  if (v35 >= 64) {
    bzero(v23, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v23 = -1 << v35;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

void sub_100011E34(uint64_t a1, void *a2, char a3)
{
  uint64_t v4 = v3;
  uint64_t v7 = *v3;
  unint64_t v9 = sub_1000118F8((uint64_t)a2);
  uint64_t v10 = *(void *)(v7 + 16);
  BOOL v11 = (v8 & 1) == 0;
  uint64_t v12 = v10 + v11;
  if (__OFADD__(v10, v11))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v13 = v8;
  uint64_t v14 = *(void *)(v7 + 24);
  if (v14 >= v12 && (a3 & 1) != 0) {
    goto LABEL_7;
  }
  if (v14 >= v12 && (a3 & 1) == 0)
  {
    sub_100011F98();
LABEL_7:
    uint64_t v15 = (void *)*v4;
    if (v13)
    {
LABEL_8:
      uint64_t v16 = v15[7];

      *(void *)(v16 + 8 * v9) = a1;
      return;
    }
    goto LABEL_11;
  }
  sub_100011B04(v12, a3 & 1);
  unint64_t v17 = sub_1000118F8((uint64_t)a2);
  if ((v13 & 1) != (v18 & 1))
  {
LABEL_17:
    type metadata accessor for AIDAServiceType(0);
    sub_100012EA0();
    __break(1u);
    return;
  }
  unint64_t v9 = v17;
  uint64_t v15 = (void *)*v4;
  if (v13) {
    goto LABEL_8;
  }
LABEL_11:
  v15[(v9 >> 6) + 8] |= 1 << v9;
  uint64_t v19 = 8 * v9;
  *(void *)(v15[6] + v19) = a2;
  *(void *)(v15[7] + v19) = a1;
  uint64_t v20 = v15[2];
  BOOL v21 = __OFADD__(v20, 1);
  uint64_t v22 = v20 + 1;
  if (v21)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v15[2] = v22;

  id v23 = a2;
}

id sub_100011F98()
{
  uint64_t v1 = v0;
  sub_100005340(&qword_10001C968);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_100012E40();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (id)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  id result = (id)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 64), 8 * v7);
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
    int64_t v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v20 >= v13) {
      goto LABEL_26;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      int64_t v9 = v20 + 1;
      if (v20 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v21 = *(void *)(v6 + 8 * v9);
      if (!v21) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v21 - 1) & v21;
    unint64_t v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    unint64_t v17 = *(void **)(*(void *)(v2 + 48) + v16);
    char v18 = *(void **)(*(void *)(v2 + 56) + v16);
    *(void *)(*(void *)(v4 + 48) + v16) = v17;
    *(void *)(*(void *)(v4 + 56) + v16) = v18;
    id v19 = v17;
    id result = v18;
  }
  int64_t v22 = v20 + 2;
  if (v22 >= v13) {
    goto LABEL_26;
  }
  unint64_t v21 = *(void *)(v6 + 8 * v22);
  if (v21)
  {
    int64_t v9 = v22;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v9);
    ++v22;
    if (v21) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *_s19AppleAccountIntents0aB13SettingsModelC8accounts3forSDySo15AIDAServiceTypeaSo9ACAccountCGSo18AIDAAccountManagerC_tF_0()
{
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR____TtC19AppleAccountIntents25AppleAccountSettingsModel_serviceOwnersManager);
  uint64_t v2 = (void *)AIDAServiceTypeCloud;
  id v3 = [v1 accountForService:AIDAServiceTypeCloud];
  uint64_t v4 = v3;
  if (v3)
  {
    id v5 = v3;
    id v6 = v2;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    sub_100011E34((uint64_t)v5, v6, isUniquelyReferenced_nonNull_native);

    swift_bridgeObjectRelease();
  }
  char v8 = (void *)AIDAServiceTypeStore;
  id v9 = [v1 accountForService:AIDAServiceTypeStore];
  if (v9)
  {
    id v10 = v9;
    id v11 = v8;
    char v12 = swift_isUniquelyReferenced_nonNull_native();
    sub_100011E34((uint64_t)v10, v11, v12);

    swift_bridgeObjectRelease();
  }
  else
  {
  }
  return &_swiftEmptyDictionarySingleton;
}

void *sub_100012284()
{
  return &protocol witness table for ObservableObjectPublisher;
}

uint64_t sub_100012290()
{
  return type metadata accessor for AppleAccountSettingsModel();
}

void sub_100012298()
{
  sub_10001239C(319, &qword_10001C930, (uint64_t)&type metadata for String, (uint64_t (*)(void, uint64_t))&type metadata accessor for Published);
  if (v0 <= 0x3F)
  {
    sub_1000123E8();
    if (v1 <= 0x3F) {
      swift_updateClassMetadata2();
    }
  }
}

void sub_10001239C(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t (*a4)(void, uint64_t))
{
  if (!*a2)
  {
    unint64_t v5 = a4(0, a3);
    if (!v6) {
      atomic_store(v5, a2);
    }
  }
}

void sub_1000123E8()
{
  if (!qword_10001C938)
  {
    sub_10000EAD8(&qword_10001C888);
    unint64_t v0 = sub_100012DB0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_10001C938);
    }
  }
}

uint64_t sub_100012444()
{
  return sub_100012478(&qword_10001C948);
}

uint64_t sub_100012478(unint64_t *a1)
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

uint64_t sub_1000124BC()
{
  return sub_100012478(&qword_10001C950);
}

uint64_t sub_1000124F0()
{
  return sub_100012478(&qword_10001C958);
}

uint64_t sub_100012524(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100005340(&qword_10001C978);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10001258C(uint64_t a1)
{
  uint64_t v2 = sub_100005340(&qword_10001C978);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1000125EC()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

void sub_100012624(uint64_t a1, uint64_t a2)
{
  id v3 = (void *)AIDAServiceTypeCloud;
  if (!*(void *)(a1 + 16)) {
    goto LABEL_8;
  }
  id v5 = AIDAServiceTypeCloud;
  unint64_t v6 = sub_1000118F8((uint64_t)v5);
  if ((v7 & 1) == 0)
  {

    if (*(void *)(a1 + 16))
    {
      id v9 = AIDAServiceTypeStore;
      unint64_t v10 = sub_1000118F8((uint64_t)v9);
      if (v11)
      {
        id v8 = *(id *)(*(void *)(a1 + 56) + 8 * v10);
        id v12 = v8;

        goto LABEL_9;
      }
    }
LABEL_8:
    id v8 = 0;
    goto LABEL_9;
  }
  id v8 = *(id *)(*(void *)(a1 + 56) + 8 * v6);

LABEL_9:
  if (*(void *)(a2 + 16))
  {
    id v13 = v3;
    unint64_t v14 = sub_1000118F8((uint64_t)v13);
    if (v15)
    {
      id v16 = *(id *)(*(void *)(a2 + 56) + 8 * v14);

      goto LABEL_17;
    }

    if (*(void *)(a2 + 16))
    {
      id v17 = AIDAServiceTypeStore;
      unint64_t v18 = sub_1000118F8((uint64_t)v17);
      if (v19)
      {
        id v16 = *(id *)(*(void *)(a2 + 56) + 8 * v18);
        id v20 = v16;

        goto LABEL_17;
      }
    }
  }
  id v16 = 0;
LABEL_17:
  swift_beginAccess();
  Strong = (void *)swift_unknownObjectWeakLoadStrong();
  if (!Strong)
  {
LABEL_20:
    int64_t v22 = v8;
    goto LABEL_21;
  }
  int64_t v22 = Strong;
  if (v16)
  {

    goto LABEL_20;
  }
  if (!v8) {
    goto LABEL_22;
  }
  (*(void (**)(void))((swift_isaMask & *Strong) + 0x118))(0);
  id v16 = v8;
LABEL_21:

  int64_t v22 = v16;
LABEL_22:
}

uint64_t sub_1000127F4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100012804()
{
  return swift_release();
}

uint64_t sub_100012810()
{
  return sub_100012D30();
}

unint64_t sub_10001284C()
{
  unint64_t result = qword_10001C9E0;
  if (!qword_10001C9E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C9E0);
  }
  return result;
}

uint64_t sub_1000128A0(uint64_t a1)
{
  unint64_t v2 = sub_10001299C();

  return AppIntentsExtension.configuration.getter(a1, v2);
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

uint64_t sub_10001294C()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_10001299C()
{
  unint64_t result = qword_10001C9E8;
  if (!qword_10001C9E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C9E8);
  }
  return result;
}

ValueMetadata *type metadata accessor for AppleAccountIntentsExtension()
{
  return &type metadata for AppleAccountIntentsExtension;
}

uint64_t sub_100012A00()
{
  return static _AssistantIntentsProvider.uniqueEntities.getter();
}

uint64_t sub_100012A10()
{
  return static AppIntentInternal.sideEffect.getter();
}

uint64_t sub_100012A20()
{
  return static AppIntentInternal.shortcutsMetadata.getter();
}

uint64_t sub_100012A30()
{
  return static AppIntentInternal.attributionBundleIdentifier.getter();
}

uint64_t sub_100012A50()
{
  return static AppIntent.description.getter();
}

uint64_t sub_100012A60()
{
  return static AppIntent.parameterSummary.getter();
}

uint64_t sub_100012A70()
{
  return static AppIntent.authenticationPolicy.getter();
}

uint64_t sub_100012AB0()
{
  return type metadata accessor for IntentDialog();
}

uint64_t sub_100012AC0()
{
  return IntentParameter.wrappedValue.modify();
}

uint64_t sub_100012AD0()
{
  return IntentParameter.wrappedValue.getter();
}

uint64_t sub_100012AE0()
{
  return IntentParameter.wrappedValue.setter();
}

uint64_t sub_100012AF0()
{
  return IntentParameter.projectedValue.getter();
}

uint64_t sub_100012B00()
{
  return IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:)();
}

uint64_t sub_100012B10()
{
  return _AssistantIntent.IntentProjection.subscript.getter();
}

uint64_t sub_100012B20()
{
  return static _AssistantIntent.PhraseBuilder.buildBlock(_:)();
}

uint64_t sub_100012B30()
{
  return static _AssistantIntent.PhraseBuilder.buildExpression(_:)();
}

uint64_t sub_100012B40()
{
  return static _AssistantIntent.ParameterValueBuilder.buildBlock(_:)();
}

uint64_t sub_100012B50()
{
  return static _AssistantIntent.ParameterValueBuilder.buildExpression(_:)();
}

uint64_t sub_100012B60()
{
  return type metadata accessor for _AssistantIntent.Value();
}

uint64_t sub_100012B70()
{
  return _AssistantIntent.Value.init<A, B>(_:for:)();
}

uint64_t sub_100012B80()
{
  return _AssistantIntent.Phrase.init(stringLiteral:)();
}

uint64_t sub_100012B90()
{
  return static _AssistantIntent.Builder.buildBlock(_:)();
}

uint64_t sub_100012BA0()
{
  return static _AssistantIntent.Builder.buildExpression(_:)();
}

uint64_t sub_100012BB0()
{
  return type metadata accessor for _AssistantIntent();
}

uint64_t sub_100012BC0()
{
  return _AssistantIntent.init<A>(_:phrases:implying:)();
}

uint64_t sub_100012BD0()
{
  return type metadata accessor for DisplayRepresentation.Image();
}

uint64_t sub_100012BE0()
{
  return DisplayRepresentation.init(title:subtitle:image:synonyms:)();
}

uint64_t sub_100012BF0()
{
  return DisplayRepresentation.init(title:subtitle:image:)();
}

uint64_t sub_100012C00()
{
  return static EnumerableEntityQuery.findIntentDescription.getter();
}

uint64_t sub_100012C10()
{
  return static DynamicOptionsProvider.useForParameterResolution.getter();
}

uint64_t sub_100012C20()
{
  return type metadata accessor for InputConnectionBehavior();
}

uint64_t sub_100012C30()
{
  return _URLRepresentableEntity.urlRepresentationParameter.getter();
}

uint64_t sub_100012C60()
{
  return static PersistentlyIdentifiable.persistentIdentifier.getter();
}

uint64_t sub_100012C70()
{
  return _EntityURLRepresentation.StringInterpolation.appendInterpolation(_:)();
}

void sub_100012C80(Swift::String a1)
{
}

uint64_t sub_100012C90()
{
  return _EntityURLRepresentation.StringInterpolation.init(literalCapacity:interpolationCount:)();
}

uint64_t sub_100012CA0()
{
  return _EntityURLRepresentation.init(stringInterpolation:)();
}

uint64_t sub_100012CB0()
{
  return TypeDisplayRepresentation.init(name:numericFormat:)();
}

uint64_t sub_100012CC0()
{
  return type metadata accessor for TypeDisplayRepresentation();
}

uint64_t sub_100012CE0()
{
  return PersonNameComponents.init(namePrefix:givenName:middleName:familyName:nameSuffix:nickname:phoneticRepresentation:)();
}

Class sub_100012CF0()
{
  return PersonNameComponents._bridgeToObjectiveC()().super.isa;
}

uint64_t sub_100012D00()
{
  return type metadata accessor for PersonNameComponents();
}

uint64_t sub_100012D10()
{
  return LocalizedStringResource.init(stringLiteral:)();
}

uint64_t sub_100012D20()
{
  return type metadata accessor for LocalizedStringResource();
}

uint64_t sub_100012D30()
{
  return static AppExtension.main()();
}

uint64_t sub_100012D40()
{
  return ObservableObject<>.objectWillChange.getter();
}

uint64_t sub_100012D50()
{
  return Published.init(initialValue:)();
}

uint64_t sub_100012D60()
{
  return Published.projectedValue.getter();
}

uint64_t sub_100012D70()
{
  return Published.projectedValue.setter();
}

uint64_t sub_100012D80()
{
  return static Published.subscript.modify();
}

uint64_t sub_100012D90()
{
  return static Published.subscript.getter();
}

uint64_t sub_100012DA0()
{
  return static Published.subscript.setter();
}

uint64_t sub_100012DB0()
{
  return type metadata accessor for Published();
}

NSDictionary sub_100012DC0()
{
  return Dictionary._bridgeToObjectiveC()();
}

uint64_t sub_100012DD0()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

NSString sub_100012DE0()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_100012DF0()
{
  return static String._forceBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_100012E00()
{
  return static String._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_100012E10()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100012E20()
{
  return String.hash(into:)();
}

uint64_t sub_100012E30()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t sub_100012E40()
{
  return static _DictionaryStorage.copy(original:)();
}

uint64_t sub_100012E50()
{
  return static _DictionaryStorage.resize(original:capacity:move:)();
}

uint64_t sub_100012E70()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_100012E80()
{
  return _findStringSwitchCaseWithCache(cases:string:cache:)();
}

uint64_t sub_100012E90()
{
  return _bridgeAnythingNonVerbatimToObjectiveC<A>(_:)();
}

uint64_t sub_100012EA0()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_100012EB0()
{
  return Hasher.init(_seed:)();
}

Swift::Int sub_100012EC0()
{
  return Hasher._finalize()();
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

void bzero(void *a1, size_t a2)
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

uint64_t swift_allocObject()
{
  return _swift_allocObject();
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

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_endAccess()
{
  return _swift_endAccess();
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

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return _swift_unknownObjectWeakDestroy();
}

uint64_t swift_unknownObjectWeakInit()
{
  return _swift_unknownObjectWeakInit();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return _swift_unknownObjectWeakLoadStrong();
}

uint64_t swift_updateClassMetadata2()
{
  return _swift_updateClassMetadata2();
}