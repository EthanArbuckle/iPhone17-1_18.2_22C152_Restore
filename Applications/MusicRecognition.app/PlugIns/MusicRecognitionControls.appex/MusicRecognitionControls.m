uint64_t sub_100003CA4()
{
  uint64_t v0;

  v0 = sub_100006C10();
  sub_100003FFC(v0, qword_10000C388);
  sub_100004060(v0, (uint64_t)qword_10000C388);
  return sub_100006C00();
}

uint64_t sub_100003D18()
{
  uint64_t v0 = sub_100003EC0(&qword_10000C110);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin();
  v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100003F04();
  sub_100006CC0();
  sub_100003F58();
  sub_100006C90();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

unint64_t sub_100003E40()
{
  unint64_t result = qword_10000C108;
  if (!qword_10000C108)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C108);
  }
  return result;
}

ValueMetadata *type metadata accessor for MusicRecognitionControlsBundle()
{
  return &type metadata for MusicRecognitionControlsBundle;
}

uint64_t sub_100003EA4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100003EC0(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_100003F04()
{
  unint64_t result = qword_10000C118;
  if (!qword_10000C118)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C118);
  }
  return result;
}

unint64_t sub_100003F58()
{
  unint64_t result = qword_10000C120;
  if (!qword_10000C120)
  {
    sub_100003FB4(&qword_10000C110);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C120);
  }
  return result;
}

uint64_t sub_100003FB4(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t *sub_100003FFC(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_100004060(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_100004098()
{
  return swift_getOpaqueTypeConformance2();
}

void sub_1000040F4()
{
  id v0 = objc_allocWithZone((Class)NSUserDefaults);
  NSString v1 = sub_100006E50();
  id v2 = [v0 initWithSuiteName:v1];

  qword_10000C128 = (uint64_t)v2;
}

unint64_t sub_100004168()
{
  unint64_t result = qword_10000C1D8;
  if (!qword_10000C1D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C1D8);
  }
  return result;
}

unint64_t sub_1000041C0()
{
  unint64_t result = qword_10000C1E0;
  if (!qword_10000C1E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C1E0);
  }
  return result;
}

uint64_t sub_100004214()
{
  uint64_t result = sub_100006C70();
  qword_10000C130 = result;
  *(void *)algn_10000C138 = v1;
  byte_10000C140 = v2 & 1;
  qword_10000C148 = v3;
  return result;
}

uint64_t sub_10000425C()
{
  uint64_t result = sub_100006C70();
  qword_10000C150 = result;
  *(void *)algn_10000C158 = v1;
  byte_10000C160 = v2 & 1;
  qword_10000C168 = v3;
  return result;
}

uint64_t sub_1000042A4()
{
  uint64_t result = sub_100006C70();
  qword_10000C170 = result;
  *(void *)algn_10000C178 = v1;
  byte_10000C180 = v2 & 1;
  qword_10000C188 = v3;
  return result;
}

uint64_t sub_1000042EC()
{
  uint64_t result = sub_100006C70();
  qword_10000C190 = result;
  *(void *)algn_10000C198 = v1;
  byte_10000C1A0 = v2 & 1;
  qword_10000C1A8 = v3;
  return result;
}

uint64_t sub_100004334()
{
  uint64_t result = sub_100006C70();
  qword_10000C1B0 = result;
  *(void *)algn_10000C1B8 = v1;
  byte_10000C1C0 = v2 & 1;
  qword_10000C1C8 = v3;
  return result;
}

UIColor sub_10000437C()
{
  sub_1000067D4(0, &qword_10000C2E0);
  result.super.isa = sub_100006E80(0.0, 0.53333, 1.0, 1.0).super.isa;
  qword_10000C1D0 = (uint64_t)result.super.isa;
  return result;
}

uint64_t sub_1000043D8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v28 = a1;
  uint64_t v26 = sub_100006BE0();
  uint64_t v23 = *(void *)(v26 - 8);
  __chkstk_darwin(v26);
  char v2 = (char *)&v21 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100003EC0(&qword_10000C240);
  uint64_t v22 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100003EC0(&qword_10000C248);
  uint64_t v24 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = sub_100003EC0(&qword_10000C250);
  uint64_t v27 = *(void *)(v25 - 8);
  __chkstk_darwin(v25);
  v10 = (char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100003EC0(&qword_10000C258);
  uint64_t v11 = sub_100003FB4(&qword_10000C260);
  uint64_t v12 = sub_100003FB4(&qword_10000C268);
  uint64_t v13 = sub_10000673C(&qword_10000C270, &qword_10000C268);
  uint64_t v29 = v12;
  uint64_t v30 = v13;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v29 = v11;
  uint64_t v30 = OpaqueTypeConformance2;
  swift_getOpaqueTypeConformance2();
  sub_100006E40();
  sub_100006BD0();
  uint64_t v15 = sub_10000673C(&qword_10000C278, &qword_10000C240);
  sub_100006CE0();
  v16 = *(void (**)(char *, uint64_t))(v23 + 8);
  uint64_t v17 = v26;
  v16(v2, v26);
  (*(void (**)(char *, uint64_t))(v22 + 8))(v5, v3);
  sub_100006BD0();
  uint64_t v29 = v3;
  uint64_t v30 = v15;
  uint64_t v18 = swift_getOpaqueTypeConformance2();
  sub_100006CD0();
  v16(v2, v17);
  (*(void (**)(char *, uint64_t))(v24 + 8))(v8, v6);
  uint64_t v29 = v6;
  uint64_t v30 = v18;
  swift_getOpaqueTypeConformance2();
  uint64_t v19 = v25;
  sub_100006CF0();
  return (*(uint64_t (**)(char *, uint64_t))(v27 + 8))(v10, v19);
}

uint64_t sub_10000487C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v28 = a1;
  uint64_t v1 = sub_100003EC0(&qword_10000C268);
  uint64_t v24 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v3 = (char *)v23 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100003EC0(&qword_10000C260);
  uint64_t v26 = *(void *)(v4 - 8);
  uint64_t v27 = v4;
  __chkstk_darwin(v4);
  uint64_t v6 = (char *)v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = sub_100003EC0(&qword_10000C258);
  uint64_t v7 = *(void *)(v25 - 8);
  __chkstk_darwin(v25);
  uint64_t v9 = (char *)v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100006C80();
  v23[2] = v11;
  v23[3] = v10;
  v23[1] = v12;
  if (qword_10000C0B8 != -1) {
    swift_once();
  }
  uint64_t v13 = (void *)qword_10000C128;
  if (qword_10000C128)
  {
    NSString v14 = sub_100006E50();
    [v13 BOOLForKey:v14];
  }
  uint64_t v31 = sub_10000622C();
  sub_100003EC0(&qword_10000C280);
  uint64_t v15 = sub_100003FB4(&qword_10000C288);
  uint64_t v16 = sub_100003FB4(&qword_10000C290);
  unint64_t v17 = sub_1000065CC();
  uint64_t v29 = v16;
  unint64_t v30 = v17;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v29 = v15;
  unint64_t v30 = OpaqueTypeConformance2;
  swift_getOpaqueTypeConformance2();
  sub_100006780();
  sub_100006E30();
  if (qword_10000C0E8 != -1) {
    swift_once();
  }
  id v19 = (id)qword_10000C1D0;
  sub_100006D40();
  uint64_t v20 = sub_10000673C(&qword_10000C270, &qword_10000C268);
  sub_100006CB0();
  swift_release();
  (*(void (**)(char *, uint64_t))(v24 + 8))(v3, v1);
  uint64_t v29 = v1;
  unint64_t v30 = v20;
  swift_getOpaqueTypeConformance2();
  uint64_t v21 = v27;
  sub_100006CA0();
  (*(void (**)(char *, uint64_t))(v26 + 8))(v6, v21);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v7 + 32))(v28, v9, v25);
}

uint64_t sub_100004CE8@<X0>(int a1@<W0>, uint64_t a2@<X8>)
{
  char v2 = a1;
  int v60 = a1;
  uint64_t v76 = a2;
  uint64_t v3 = sub_100006C40();
  uint64_t v68 = *(void *)(v3 - 8);
  uint64_t v69 = v3;
  ((void (*)(void))__chkstk_darwin)();
  v67 = (char *)v58 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100006DD0();
  uint64_t v65 = *(void *)(v5 - 8);
  uint64_t v66 = v5;
  ((void (*)(void))__chkstk_darwin)();
  v61 = (char *)v58 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100006DB0();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v11 = (char *)v58 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __chkstk_darwin(v9);
  NSString v14 = (char *)v58 - v13;
  __chkstk_darwin(v12);
  uint64_t v16 = (char *)v58 - v15;
  uint64_t v17 = sub_100003EC0(&qword_10000C2B8);
  uint64_t v63 = *(void *)(v17 - 8);
  uint64_t v64 = v17;
  __chkstk_darwin(v17);
  v59 = (char *)v58 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_100003EC0(&qword_10000C2A8);
  uint64_t v20 = v19 - 8;
  __chkstk_darwin(v19);
  uint64_t v22 = (char *)v58 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v62 = sub_100003EC0(&qword_10000C290);
  __chkstk_darwin(v62);
  uint64_t v24 = (char *)v58 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = sub_100003EC0(&qword_10000C288);
  uint64_t v74 = *(void *)(v25 - 8);
  uint64_t v75 = v25;
  __chkstk_darwin(v25);
  v73 = (char *)v58 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = sub_100003EC0(&qword_10000C280);
  uint64_t v71 = *(void *)(v27 - 8);
  uint64_t v72 = v27;
  __chkstk_darwin(v27);
  v70 = (char *)v58 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v77 = v2;
  sub_100006D60();
  sub_100006DA0();
  sub_100006D90();
  uint64_t v29 = *(void (**)(char *, uint64_t))(v8 + 8);
  v29(v16, v7);
  v58[1] = v8 + 8;
  v58[0] = v11;
  sub_100006D80();
  uint64_t v30 = v7;
  v29(v14, v7);
  uint64_t v31 = v61;
  sub_100006DC0();
  uint64_t v32 = *(int *)(v20 + 44);
  uint64_t v33 = (uint64_t)v24;
  v34 = v22;
  v35 = &v22[v32];
  sub_100006818(&qword_10000C2E8, (void (*)(uint64_t))&type metadata accessor for BreatheSymbolEffect);
  sub_100006D70();
  uint64_t v36 = sub_100006D00();
  uint64_t v37 = v65;
  uint64_t v38 = v66;
  v39 = v31;
  (*(void (**)(char *, char *, uint64_t))(v65 + 16))(&v35[*(int *)(v36 + 20)], v31, v66);
  v35[*(int *)(v36 + 24)] = 1;
  uint64_t v41 = v63;
  uint64_t v40 = v64;
  uint64_t v42 = (uint64_t)v34;
  v43 = v34;
  v44 = v59;
  (*(void (**)(char *, char *, uint64_t))(v63 + 16))(v43, v59, v64);
  (*(void (**)(char *, uint64_t))(v37 + 8))(v39, v38);
  uint64_t v45 = v62;
  v29((char *)v58[0], v30);
  (*(void (**)(char *, uint64_t))(v41 + 8))(v44, v40);
  v46 = v67;
  sub_100006C30();
  uint64_t KeyPath = swift_getKeyPath();
  v48 = (uint64_t *)(v33 + *(int *)(v45 + 36));
  uint64_t v49 = sub_100003EC0(&qword_10000C2D0);
  uint64_t v51 = v68;
  uint64_t v50 = v69;
  (*(void (**)(char *, char *, uint64_t))(v68 + 16))((char *)v48 + *(int *)(v49 + 28), v46, v69);
  uint64_t *v48 = KeyPath;
  char v52 = v60;
  sub_100006888(v42, v33);
  (*(void (**)(char *, uint64_t))(v51 + 8))(v46, v50);
  sub_1000068F0(v42, &qword_10000C2A8);
  if ((v52 & 1) == 0)
  {
    if (qword_10000C0D0 == -1) {
      goto LABEL_5;
    }
    goto LABEL_10;
  }
  if (qword_10000C0C8 != -1) {
LABEL_10:
  }
    swift_once();
LABEL_5:
  v53 = v73;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  unint64_t v54 = sub_1000065CC();
  sub_100006D30();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1000068F0(v33, &qword_10000C290);
  if (v52)
  {
    if (qword_10000C0D8 == -1) {
      goto LABEL_9;
    }
    goto LABEL_12;
  }
  if (qword_10000C0E0 != -1) {
LABEL_12:
  }
    swift_once();
LABEL_9:
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v78 = v45;
  unint64_t v79 = v54;
  swift_getOpaqueTypeConformance2();
  v55 = v70;
  uint64_t v56 = v75;
  sub_100006D20();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v74 + 8))(v53, v56);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v71 + 32))(v76, v55, v72);
}

uint64_t sub_10000559C@<X0>(char a1@<W0>, uint64_t a2@<X8>)
{
  if (a1)
  {
    if (qword_10000C0C0 != -1) {
      swift_once();
    }
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t result = sub_100006D10();
    char v7 = v6 & 1;
  }
  else
  {
    uint64_t result = 0;
    char v7 = 0;
    uint64_t v5 = &_swiftEmptyArrayStorage;
    unint64_t v4 = 0xE000000000000000;
  }
  *(void *)a2 = result;
  *(void *)(a2 + 8) = v4;
  *(unsigned char *)(a2 + 16) = v7;
  *(void *)(a2 + 24) = v5;
  return result;
}

uint64_t sub_100005684@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100006D50();
  *a1 = result;
  return result;
}

uint64_t sub_1000056CC()
{
  uint64_t v0 = sub_100006BE0();
  sub_100003FFC(v0, qword_10000C3A0);
  sub_100004060(v0, (uint64_t)qword_10000C3A0);
  return sub_100006BD0();
}

uint64_t sub_100005730(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return _swift_task_switch(sub_100005750, 0, 0);
}

uint64_t sub_100005750()
{
  sub_100006B90();
  if (*(unsigned char *)(v0 + 40) == 1)
  {
    if (qword_10000C0B0 != -1) {
      swift_once();
    }
    uint64_t v1 = sub_100006C10();
    sub_100004060(v1, (uint64_t)qword_10000C388);
    uint64_t v2 = sub_100006BF0();
    os_log_type_t v3 = sub_100006E70();
    if (os_log_type_enabled(v2, v3))
    {
      unint64_t v4 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, v3, "Start matching", v4, 2u);
      swift_slowDealloc();
    }

    if (qword_10000C100 != -1) {
      swift_once();
    }
    uint64_t v5 = (void *)swift_task_alloc();
    *(void *)(v0 + 32) = v5;
    *uint64_t v5 = v0;
    v5[1] = sub_100005A98;
    return SHManagedSession.result()();
  }
  else
  {
    if (qword_10000C0B0 != -1) {
      swift_once();
    }
    uint64_t v6 = sub_100006C10();
    sub_100004060(v6, (uint64_t)qword_10000C388);
    char v7 = sub_100006BF0();
    os_log_type_t v8 = sub_100006E70();
    if (os_log_type_enabled(v7, v8))
    {
      uint64_t v9 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, v8, "Stop matching", v9, 2u);
      swift_slowDealloc();
    }

    if (qword_10000C100 != -1) {
      swift_once();
    }
    sub_100006DF0();
    sub_1000067D4(0, &qword_10000C238);
    id v10 = [(id)swift_getObjCClassFromMetadata() defaultCenter];
    if (qword_10000C0F8 != -1) {
      swift_once();
    }
    [v10 postNotificationName:qword_10000C3B8 object:0];

    sub_100006B70();
    uint64_t v11 = *(uint64_t (**)(void))(v0 + 8);
    return v11();
  }
}

uint64_t sub_100005A98(void *a1, void *a2, unsigned __int8 a3)
{
  swift_task_dealloc();
  sub_100006554(a1, a2, a3);
  return _swift_task_switch(sub_100005BB8, 0, 0);
}

uint64_t sub_100005BB8()
{
  sub_100006B70();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_100005C1C@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_100006B90();
  *a1 = v3;
  return result;
}

uint64_t sub_100005C58()
{
  return sub_100006BA0();
}

void (*sub_100005C90(void *a1))(void *a1)
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_100006B80();
  return sub_100005CEC;
}

void sub_100005CEC(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void, void))(*a1 + 32))(*a1, 0);

  free(v1);
}

unint64_t sub_100005D3C()
{
  unint64_t result = qword_10000C1E8;
  if (!qword_10000C1E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C1E8);
  }
  return result;
}

unint64_t sub_100005D94()
{
  unint64_t result = qword_10000C1F0;
  if (!qword_10000C1F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C1F0);
  }
  return result;
}

uint64_t sub_100005DE8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100005E04()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100005E54@<X0>(uint64_t a1@<X8>)
{
  if (qword_10000C0F0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100006BE0();
  uint64_t v3 = sub_100004060(v2, (uint64_t)qword_10000C3A0);
  unint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

uint64_t sub_100005F10(uint64_t a1)
{
  uint64_t v4 = *v1;
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[2] = a1;
  v5[3] = v4;
  v5[1] = sub_100005FC0;
  return _swift_task_switch(sub_100005750, 0, 0);
}

uint64_t sub_100005FC0()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_1000060B4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10000622C();
  *a1 = result;
  return result;
}

uint64_t sub_1000060DC(uint64_t a1)
{
  unint64_t v2 = sub_100004168();

  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

ValueMetadata *type metadata accessor for ToggleIntent()
{
  return &type metadata for ToggleIntent;
}

uint64_t sub_100006128()
{
  return sub_10000673C(&qword_10000C200, &qword_10000C208);
}

uint64_t sub_100006164(uint64_t a1)
{
  uint64_t v2 = sub_100006C40();
  __chkstk_darwin(v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return sub_100006C60();
}

uint64_t sub_10000622C()
{
  uint64_t v0 = sub_100006BC0();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = &v18[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v4 = sub_100003EC0(&qword_10000C210);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = &v18[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v7 = sub_100003EC0(&qword_10000C218);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = &v18[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v10 = sub_100003EC0(&qword_10000C220);
  __chkstk_darwin(v10 - 8);
  uint64_t v12 = &v18[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v13 = sub_100006BE0();
  uint64_t v14 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  sub_100003EC0(&qword_10000C228);
  sub_100006BD0();
  (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(v14 + 56))(v12, 1, 1, v13);
  v18[15] = 2;
  uint64_t v15 = sub_100006E60();
  (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v9, 1, 1, v15);
  uint64_t v16 = sub_100006B60();
  (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v6, 1, 1, v16);
  (*(void (**)(unsigned char *, void, uint64_t))(v1 + 104))(v3, enum case for InputConnectionBehavior.default(_:), v0);
  return sub_100006BB0();
}

void sub_100006554(void *a1, void *a2, unsigned __int8 a3)
{
  if (a3 >= 2u)
  {
    if (a3 != 2) {
      return;
    }
    swift_errorRelease();
    a1 = a2;
  }
}

ValueMetadata *type metadata accessor for MusicRecognitionToggle()
{
  return &type metadata for MusicRecognitionToggle;
}

uint64_t sub_1000065B0()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_1000065CC()
{
  unint64_t result = qword_10000C298;
  if (!qword_10000C298)
  {
    sub_100003FB4(&qword_10000C290);
    sub_10000666C();
    sub_10000673C(&qword_10000C2C8, &qword_10000C2D0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C298);
  }
  return result;
}

unint64_t sub_10000666C()
{
  unint64_t result = qword_10000C2A0;
  if (!qword_10000C2A0)
  {
    sub_100003FB4(&qword_10000C2A8);
    sub_10000673C(&qword_10000C2B0, &qword_10000C2B8);
    sub_100006818(&qword_10000C2C0, (void (*)(uint64_t))&type metadata accessor for _IndefiniteSymbolEffectModifier);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C2A0);
  }
  return result;
}

uint64_t sub_10000673C(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100003FB4(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_100006780()
{
  unint64_t result = qword_10000C2D8;
  if (!qword_10000C2D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C2D8);
  }
  return result;
}

uint64_t sub_1000067D4(uint64_t a1, unint64_t *a2)
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

uint64_t sub_100006810@<X0>(uint64_t a1@<X8>)
{
  return sub_10000559C(*(unsigned char *)(v1 + 16), a1);
}

uint64_t sub_100006818(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100006860()
{
  return sub_100006C50();
}

uint64_t sub_100006888(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100003EC0(&qword_10000C2A8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000068F0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100003EC0(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_10000694C()
{
  return swift_getOpaqueTypeConformance2();
}

NSString sub_100006A3C()
{
  NSString result = sub_100006E50();
  qword_10000C3B8 = (uint64_t)result;
  return result;
}

uint64_t sub_100006A74()
{
  sub_100006E20();
  swift_allocObject();
  uint64_t v0 = sub_100006E10();
  swift_retain();
  sub_100006DE0();
  uint64_t result = swift_release();
  qword_10000C3C0 = v0;
  return result;
}

uint64_t sub_100006ACC()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t sub_100006B00()
{
  return static AppIntent.openAppWhenRun.getter();
}

uint64_t sub_100006B10()
{
  return static AppIntent.description.getter();
}

uint64_t sub_100006B20()
{
  return static AppIntent.isDiscoverable.getter();
}

uint64_t sub_100006B30()
{
  return static AppIntent.parameterSummary.getter();
}

uint64_t sub_100006B40()
{
  return static AppIntent.authenticationPolicy.getter();
}

uint64_t sub_100006B60()
{
  return type metadata accessor for IntentDialog();
}

uint64_t sub_100006B70()
{
  return static IntentResult.result<>()();
}

uint64_t sub_100006B80()
{
  return IntentParameter.wrappedValue.modify();
}

uint64_t sub_100006B90()
{
  return IntentParameter.wrappedValue.getter();
}

uint64_t sub_100006BA0()
{
  return IntentParameter.wrappedValue.setter();
}

uint64_t sub_100006BB0()
{
  return IntentParameter<>.init(title:description:default:displayName:requestValueDialog:inputConnectionBehavior:)();
}

uint64_t sub_100006BC0()
{
  return type metadata accessor for InputConnectionBehavior();
}

uint64_t sub_100006BD0()
{
  return LocalizedStringResource.init(stringLiteral:)();
}

uint64_t sub_100006BE0()
{
  return type metadata accessor for LocalizedStringResource();
}

uint64_t sub_100006BF0()
{
  return Logger.logObject.getter();
}

uint64_t sub_100006C00()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_100006C10()
{
  return type metadata accessor for Logger();
}

uint64_t sub_100006C20()
{
  return static WidgetBundle.main()();
}

uint64_t sub_100006C30()
{
  return static ContentTransition.identity.getter();
}

uint64_t sub_100006C40()
{
  return type metadata accessor for ContentTransition();
}

uint64_t sub_100006C50()
{
  return EnvironmentValues.contentTransition.getter();
}

uint64_t sub_100006C60()
{
  return EnvironmentValues.contentTransition.setter();
}

uint64_t sub_100006C70()
{
  return LocalizedStringKey.init(stringLiteral:)();
}

uint64_t sub_100006C80()
{
  return LocalizedStringKey.init(_:)();
}

uint64_t sub_100006C90()
{
  return static WidgetBundleBuilder.buildBlock<A>(_:)();
}

uint64_t sub_100006CA0()
{
  return ControlWidgetTemplate.accessibilityIdentifier(_:)();
}

uint64_t sub_100006CB0()
{
  return ControlWidgetTemplate.tint(_:)();
}

uint64_t sub_100006CC0()
{
  return _ControlWidgetAdaptor.init(_:)();
}

uint64_t sub_100006CD0()
{
  return ControlWidgetConfiguration.description(_:)();
}

uint64_t sub_100006CE0()
{
  return ControlWidgetConfiguration.displayName(_:)();
}

uint64_t sub_100006CF0()
{
  return ControlWidgetConfiguration.showsInSystemSpaces()();
}

uint64_t sub_100006D00()
{
  return type metadata accessor for _IndefiniteSymbolEffectModifier();
}

uint64_t sub_100006D10()
{
  return Text.init(_:tableName:bundle:comment:)();
}

uint64_t sub_100006D20()
{
  return View.controlWidgetActionHint(_:)();
}

uint64_t sub_100006D30()
{
  return View.controlWidgetStatus(_:)();
}

uint64_t sub_100006D40()
{
  return Color.init(_:)();
}

uint64_t sub_100006D50()
{
  return Image.init(_:bundle:)();
}

uint64_t sub_100006D60()
{
  return Label.init(title:icon:)();
}

uint64_t sub_100006D70()
{
  return dispatch thunk of SymbolEffect.configuration.getter();
}

uint64_t sub_100006D80()
{
  return BreatheSymbolEffect.wholeSymbol.getter();
}

uint64_t sub_100006D90()
{
  return BreatheSymbolEffect.plain.getter();
}

uint64_t sub_100006DA0()
{
  return BreatheSymbolEffect.init()();
}

uint64_t sub_100006DB0()
{
  return type metadata accessor for BreatheSymbolEffect();
}

uint64_t sub_100006DC0()
{
  return static SymbolEffectOptions.speed(_:)();
}

uint64_t sub_100006DD0()
{
  return type metadata accessor for SymbolEffectOptions();
}

uint64_t sub_100006DE0()
{
  return SHManagedSession.enableLiveActivity.setter();
}

void sub_100006DF0()
{
}

uint64_t sub_100006E10()
{
  return SHManagedSession.init()();
}

uint64_t sub_100006E20()
{
  return type metadata accessor for SHManagedSession();
}

uint64_t sub_100006E30()
{
  return ControlWidgetToggle<>.init<>(_:isOn:action:valueLabel:)();
}

uint64_t sub_100006E40()
{
  return StaticControlConfiguration.init(kind:content:)();
}

NSString sub_100006E50()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_100006E60()
{
  return type metadata accessor for Bool.IntentDisplayName();
}

uint64_t sub_100006E70()
{
  return static os_log_type_t.debug.getter();
}

UIColor sub_100006E80(Swift::Float _colorLiteralRed, Swift::Float green, Swift::Float blue, Swift::Float alpha)
{
  return UIColor.init(_colorLiteralRed:green:blue:alpha:)(_colorLiteralRed, green, blue, alpha);
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

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
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