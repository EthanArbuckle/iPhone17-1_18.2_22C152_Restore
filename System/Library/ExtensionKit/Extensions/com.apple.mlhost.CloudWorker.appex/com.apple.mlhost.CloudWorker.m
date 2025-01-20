void sub_100001AB4()
{
  qword_10003C990 = 0x736B736154;
  *(void *)algn_10003C998 = 0xE500000000000000;
}

uint64_t sub_100001AD4(char a1)
{
  return *(void *)&aTasknameextens[8 * a1];
}

BOOL sub_100001AF4(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

void sub_100001B0C()
{
  sub_100032D10(*v0);
}

uint64_t sub_100001B3C()
{
  return sub_100001AD4(*v0);
}

uint64_t sub_100001B44@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_100009294(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_100001B6C()
{
  return 0;
}

void sub_100001B78(unsigned char *a1@<X8>)
{
  *a1 = 6;
}

uint64_t sub_100001B84(uint64_t a1)
{
  unint64_t v2 = sub_100008A24();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100001BC0(uint64_t a1)
{
  unint64_t v2 = sub_100008A24();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_100001BFC(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = sub_100005644(&qword_10003C680);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000089E0(a1, a1[3]);
  sub_100008A24();
  sub_100032D40();
  LOBYTE(v10) = 0;
  sub_100032C30();
  if (!v2)
  {
    LOBYTE(v10) = 1;
    sub_100032C30();
    long long v10 = *(_OWORD *)(v3 + 32);
    char v11 = 2;
    sub_100008B1C();
    sub_100032C40();
    type metadata accessor for TaskRecord(0);
    LOBYTE(v10) = 3;
    sub_1000325D0();
    sub_1000086EC(&qword_10003C690, (void (*)(uint64_t))&type metadata accessor for Date);
    sub_100032C40();
    LOBYTE(v10) = 4;
    sub_100032C40();
    LOBYTE(v10) = 5;
    sub_100032C20();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_100001E94@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v39 = a2;
  sub_100005644(&qword_10003C3B0);
  ((void (*)(void))__chkstk_darwin)();
  v42 = (char *)&v34 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_1000325D0();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = ((uint64_t (*)(void))__chkstk_darwin)();
  v8 = (char *)&v34 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  long long v10 = (char *)&v34 - v9;
  uint64_t v43 = sub_100005644(&qword_10003C660);
  uint64_t v41 = *(void *)(v43 - 8);
  __chkstk_darwin(v43);
  v12 = (char *)&v34 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = type metadata accessor for TaskRecord(0);
  uint64_t v14 = __chkstk_darwin(v13);
  v16 = (char *)&v34 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = &v16[*(int *)(v14 + 36)];
  uint64_t v40 = v5;
  v18 = *(void (**)(void))(v5 + 56);
  uint64_t v46 = (uint64_t)v17;
  v18();
  uint64_t v19 = a1[3];
  v45 = a1;
  sub_1000089E0(a1, v19);
  sub_100008A24();
  v44 = v12;
  uint64_t v20 = v47;
  sub_100032D30();
  if (v20)
  {
    uint64_t v23 = v46;
    sub_100008A78((uint64_t)v45);
    return sub_1000065E4(v23, &qword_10003C3B0);
  }
  else
  {
    v38 = v8;
    uint64_t v21 = v41;
    uint64_t v22 = (uint64_t)v42;
    uint64_t v47 = v13;
    LOBYTE(v48) = 0;
    *(void *)v16 = sub_100032C00();
    *((void *)v16 + 1) = v24;
    LOBYTE(v48) = 1;
    *((void *)v16 + 2) = sub_100032C00();
    *((void *)v16 + 3) = v25;
    char v49 = 2;
    sub_100008AC8();
    sub_100032C10();
    *((_OWORD *)v16 + 2) = v48;
    LOBYTE(v48) = 3;
    uint64_t v36 = sub_1000086EC(&qword_10003C678, (void (*)(uint64_t))&type metadata accessor for Date);
    uint64_t v37 = 0;
    sub_100032C10();
    v26 = v10;
    v27 = &v16[*(int *)(v47 + 28)];
    v35 = v16;
    v28 = *(void (**)(char *, char *, uint64_t))(v40 + 32);
    v28(v27, v26, v4);
    LOBYTE(v48) = 4;
    v29 = v38;
    sub_100032C10();
    v30 = v28;
    uint64_t v31 = (uint64_t)v35;
    v30(&v35[*(int *)(v47 + 32)], v29, v4);
    LOBYTE(v48) = 5;
    sub_100032BF0();
    uint64_t v32 = v46;
    (*(void (**)(char *, uint64_t))(v21 + 8))(v44, v43);
    sub_1000062F8(v22, v32);
    sub_1000064C4(v31, v39, type metadata accessor for TaskRecord);
    sub_100008A78((uint64_t)v45);
    return sub_10000652C(v31, type metadata accessor for TaskRecord);
  }
}

uint64_t sub_1000024C4@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_100001E94(a1, a2);
}

uint64_t sub_1000024DC(void *a1)
{
  return sub_100001BFC(a1);
}

uint64_t sub_1000024F4@<X0>(id a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_100005644(&qword_10003C3B0);
  uint64_t v5 = __chkstk_darwin(v4 - 8);
  v107 = (char *)v98 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __chkstk_darwin(v5);
  uint64_t v9 = (char *)v98 - v8;
  __chkstk_darwin(v7);
  uint64_t v11 = (char *)v98 - v10;
  uint64_t v12 = sub_1000325D0();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = __chkstk_darwin(v12);
  v16 = (char *)v98 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  v108 = (char *)v98 - v17;
  uint64_t v18 = type metadata accessor for TaskRecord(0);
  uint64_t v113 = *(void *)(v18 - 8);
  uint64_t v19 = __chkstk_darwin(v18);
  uint64_t v21 = (void *)((char *)v98 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v114 = v19;
  uint64_t v22 = (uint64_t)v21 + *(int *)(v19 + 36);
  uint64_t v109 = v13;
  uint64_t v23 = *(void (**)(void))(v13 + 56);
  uint64_t v112 = v22;
  v110 = v23;
  v23();
  uint64_t v24 = sub_100032AC0();
  uint64_t v26 = v25;
  if (qword_10003C380 != -1) {
    swift_once();
  }
  if (v24 == qword_10003C990 && v26 == *(void *)algn_10003C998)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    char v27 = sub_100032C70();
    swift_bridgeObjectRelease();
    if ((v27 & 1) == 0)
    {
      if (qword_10003C398 != -1) {
        swift_once();
      }
      uint64_t v76 = sub_100032880();
      sub_1000056A8(v76, (uint64_t)qword_10003C9C0);
      id v77 = a1;
      v78 = sub_100032860();
      os_log_type_t v79 = sub_100032A90();
      if (os_log_type_enabled(v78, v79))
      {
        v80 = (uint8_t *)swift_slowAlloc();
        uint64_t v115 = swift_slowAlloc();
        *(_DWORD *)v80 = 136315138;
        uint64_t v81 = sub_100032AC0();
        uint64_t v117 = sub_100005B78(v81, v82, &v115);
        sub_100032AF0();

        swift_bridgeObjectRelease();
        _os_log_impl((void *)&_mh_execute_header, v78, v79, "Invalid recordType: %s", v80, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {
      }
      goto LABEL_37;
    }
  }
  uint64_t v111 = a2;
  id v28 = [a1 values];
  sub_100005644(&qword_10003C418);
  uint64_t v29 = sub_1000328E0();

  if (!*(void *)(v29 + 16) || (unint64_t v30 = sub_1000061D0(0x656D614E6B736174, 0xE800000000000000), (v31 & 1) == 0))
  {
    swift_bridgeObjectRelease();
    goto LABEL_25;
  }
  uint64_t v32 = *(void *)(*(void *)(v29 + 56) + 8 * v30);
  swift_unknownObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v117 = v32;
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_25:
    if (qword_10003C398 != -1) {
      swift_once();
    }
    uint64_t v71 = sub_100032880();
    sub_1000056A8(v71, (uint64_t)qword_10003C9C0);
    v72 = sub_100032860();
    os_log_type_t v73 = sub_100032A90();
    if (!os_log_type_enabled(v72, v73)) {
      goto LABEL_30;
    }
    v74 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v74 = 0;
    v75 = "Failed at parsing taskName";
LABEL_29:
    _os_log_impl((void *)&_mh_execute_header, v72, v73, v75, v74, 2u);
    swift_slowDealloc();
    goto LABEL_30;
  }
  uint64_t v104 = v115;
  v33 = a1;
  unint64_t v34 = v116;
  id v106 = v33;
  id v35 = [v33 values];
  uint64_t v36 = sub_1000328E0();

  if (!*(void *)(v36 + 16)
    || (v105 = v34, unint64_t v37 = sub_1000061D0(0x6F69736E65747865, 0xEB0000000044496ELL), (v38 & 1) == 0))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    a1 = v106;
LABEL_39:
    if (qword_10003C398 != -1) {
      swift_once();
    }
    uint64_t v85 = sub_100032880();
    sub_1000056A8(v85, (uint64_t)qword_10003C9C0);
    v72 = sub_100032860();
    os_log_type_t v73 = sub_100032A90();
    if (!os_log_type_enabled(v72, v73)) {
      goto LABEL_30;
    }
    v74 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v74 = 0;
    v75 = "Failed at parsing extensionID";
    goto LABEL_29;
  }
  uint64_t v39 = *(void *)(*(void *)(v36 + 56) + 8 * v37);
  swift_unknownObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v117 = v39;
  char v40 = swift_dynamicCast();
  a1 = v106;
  if ((v40 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    goto LABEL_39;
  }
  uint64_t v102 = v115;
  unint64_t v103 = v116;
  id v41 = [v106 values];
  uint64_t v42 = sub_1000328E0();

  if (!*(void *)(v42 + 16) || (unint64_t v43 = sub_1000061D0(0x666E6F436B736174, 0xEE00617461446769), (v44 & 1) == 0))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_45:
    swift_bridgeObjectRelease();
    if (qword_10003C398 != -1) {
      swift_once();
    }
    uint64_t v86 = sub_100032880();
    sub_1000056A8(v86, (uint64_t)qword_10003C9C0);
    v72 = sub_100032860();
    os_log_type_t v73 = sub_100032A90();
    if (!os_log_type_enabled(v72, v73)) {
      goto LABEL_30;
    }
    v74 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v74 = 0;
    v75 = "Failed at parsing taskConfigData";
    goto LABEL_29;
  }
  uint64_t v45 = *(void *)(*(void *)(v42 + 56) + 8 * v43);
  swift_unknownObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v117 = v45;
  if ((swift_dynamicCast() & 1) == 0)
  {
    swift_bridgeObjectRelease();
    goto LABEL_45;
  }
  uint64_t v100 = v115;
  unint64_t v101 = v116;
  id v46 = [a1 values];
  uint64_t v47 = sub_1000328E0();

  if (!*(void *)(v47 + 16) || (unint64_t v48 = sub_1000061D0(0x7461447472617473, 0xE900000000000065), (v49 & 1) == 0))
  {
    swift_bridgeObjectRelease();
    ((void (*)(char *, uint64_t, uint64_t, uint64_t))v110)(v11, 1, 1, v12);
    goto LABEL_51;
  }
  uint64_t v50 = *(void *)(*(void *)(v47 + 56) + 8 * v48);
  swift_unknownObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v115 = v50;
  int v51 = swift_dynamicCast();
  ((void (*)(char *, void, uint64_t, uint64_t))v110)(v11, v51 ^ 1u, 1, v12);
  uint64_t v52 = v109;
  uint64_t v53 = v109 + 48;
  v99 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v109 + 48);
  if (v99(v11, 1, v12) == 1)
  {
LABEL_51:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_1000065E4((uint64_t)v11, &qword_10003C3B0);
    if (qword_10003C398 != -1) {
      swift_once();
    }
    uint64_t v87 = sub_100032880();
    sub_1000056A8(v87, (uint64_t)qword_10003C9C0);
    v72 = sub_100032860();
    os_log_type_t v88 = sub_100032A90();
    if (os_log_type_enabled(v72, v88))
    {
      v89 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v89 = 0;
      _os_log_impl((void *)&_mh_execute_header, v72, v88, "Failed at parsing startDate", v89, 2u);
      swift_slowDealloc();

      sub_100006248(v100, v101);
      a2 = v111;
      goto LABEL_37;
    }
    sub_100006248(v100, v101);
LABEL_30:

    a2 = v111;
LABEL_37:
    uint64_t v83 = v113;
    sub_1000065E4(v112, &qword_10003C3B0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v83 + 56))(a2, 1, 1, v114);
  }
  v98[0] = *(void *)(v52 + 32);
  v98[1] = v53;
  ((void (*)(char *, char *, uint64_t))v98[0])(v108, v11, v12);
  id v54 = [a1 values];
  uint64_t v55 = sub_1000328E0();

  if (!*(void *)(v55 + 16) || (unint64_t v56 = sub_1000061D0(0x65746144646E65, 0xE700000000000000), (v57 & 1) == 0))
  {
    swift_bridgeObjectRelease();
    ((void (*)(char *, uint64_t, uint64_t, uint64_t))v110)(v9, 1, 1, v12);
    goto LABEL_57;
  }
  uint64_t v58 = *(void *)(*(void *)(v55 + 56) + 8 * v56);
  swift_unknownObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v115 = v58;
  int v59 = swift_dynamicCast();
  ((void (*)(char *, void, uint64_t, uint64_t))v110)(v9, v59 ^ 1u, 1, v12);
  unsigned int v60 = v99(v9, 1, v12);
  uint64_t v61 = v105;
  unint64_t v62 = v103;
  if (v60 == 1)
  {
LABEL_57:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_1000065E4((uint64_t)v9, &qword_10003C3B0);
    a2 = v111;
    v90 = v108;
    if (qword_10003C398 != -1) {
      swift_once();
    }
    uint64_t v91 = sub_100032880();
    sub_1000056A8(v91, (uint64_t)qword_10003C9C0);
    v92 = sub_100032860();
    os_log_type_t v93 = sub_100032A90();
    if (os_log_type_enabled(v92, v93))
    {
      v94 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v94 = 0;
      _os_log_impl((void *)&_mh_execute_header, v92, v93, "Failed at parsing endDate", v94, 2u);
      a2 = v111;
      swift_slowDealloc();
    }

    sub_100006248(v100, v101);
    (*(void (**)(char *, uint64_t))(v109 + 8))(v90, v12);
    goto LABEL_37;
  }
  ((void (*)(char *, char *, uint64_t))v98[0])(v16, v9, v12);
  *uint64_t v21 = v104;
  v21[1] = v61;
  unint64_t v63 = v101;
  v21[2] = v102;
  v21[3] = v62;
  uint64_t v64 = v100;
  v21[4] = v100;
  v21[5] = v63;
  uint64_t v65 = v114;
  v66 = *(void (**)(char *, char *, uint64_t))(v109 + 16);
  v66((char *)v21 + *(int *)(v114 + 28), v108, v12);
  v66((char *)v21 + *(int *)(v65 + 32), v16, v12);
  sub_1000062A0(v64, v63);
  id v67 = [a1 creationDate];
  if (v67)
  {
    v68 = v67;
    sub_100032590();

    sub_100006248(v64, v63);
    v69 = *(void (**)(char *, uint64_t))(v109 + 8);
    v69(v16, v12);
    v69(v108, v12);
    uint64_t v70 = 0;
  }
  else
  {

    sub_100006248(v64, v63);
    v95 = *(void (**)(char *, uint64_t))(v109 + 8);
    v95(v16, v12);
    v95(v108, v12);
    uint64_t v70 = 1;
  }
  uint64_t v96 = (uint64_t)v107;
  ((void (*)(char *, uint64_t, uint64_t, uint64_t))v110)(v107, v70, 1, v12);
  sub_1000062F8(v96, v112);
  uint64_t v97 = v111;
  sub_1000064C4((uint64_t)v21, v111, type metadata accessor for TaskRecord);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v113 + 56))(v97, 0, 1, v114);
  return sub_10000652C((uint64_t)v21, type metadata accessor for TaskRecord);
}

void sub_10000339C()
{
  algn_10003C9A8[7] = -18;
}

uint64_t sub_1000033CC(char a1)
{
  return *(void *)&aTasknameextens_0[8 * a1];
}

uint64_t sub_1000033EC(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = sub_100005644(&qword_10003C6A8);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = &v10[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_1000089E0(a1, a1[3]);
  sub_100008B70();
  sub_100032D40();
  LOBYTE(v11) = 0;
  sub_100032C30();
  if (!v2)
  {
    LOBYTE(v11) = 1;
    sub_100032C30();
    long long v11 = *(_OWORD *)(v3 + 32);
    v10[15] = 2;
    sub_100008B1C();
    sub_100032C40();
    type metadata accessor for TaskParametersRecord(0);
    LOBYTE(v11) = 3;
    sub_1000325D0();
    sub_1000086EC(&qword_10003C690, (void (*)(uint64_t))&type metadata accessor for Date);
    sub_100032C20();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_10000360C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v24 = a2;
  uint64_t v4 = sub_100005644(&qword_10003C3B0);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100005644(&qword_10003C698);
  uint64_t v25 = *(void *)(v7 - 8);
  uint64_t v26 = v7;
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for TaskParametersRecord(0);
  uint64_t v11 = __chkstk_darwin(v10 - 8);
  uint64_t v13 = (char *)v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = (uint64_t)&v13[*(int *)(v11 + 36)];
  uint64_t v15 = sub_1000325D0();
  v16 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56);
  uint64_t v27 = v14;
  v16(v14, 1, 1, v15);
  sub_1000089E0(a1, a1[3]);
  sub_100008B70();
  sub_100032D30();
  if (v2)
  {
    sub_100008A78((uint64_t)a1);
    return sub_1000065E4(v27, &qword_10003C3B0);
  }
  else
  {
    uint64_t v17 = (uint64_t)v6;
    uint64_t v19 = v25;
    uint64_t v18 = v26;
    LOBYTE(v28) = 0;
    *(void *)uint64_t v13 = sub_100032C00();
    *((void *)v13 + 1) = v20;
    LOBYTE(v28) = 1;
    *((void *)v13 + 2) = sub_100032C00();
    *((void *)v13 + 3) = v21;
    char v29 = 2;
    sub_100008AC8();
    v23[1] = 0;
    sub_100032C10();
    *((_OWORD *)v13 + 2) = v28;
    LOBYTE(v28) = 3;
    sub_1000086EC(&qword_10003C678, (void (*)(uint64_t))&type metadata accessor for Date);
    sub_100032BF0();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v9, v18);
    sub_1000062F8(v17, v27);
    sub_1000064C4((uint64_t)v13, v24, type metadata accessor for TaskParametersRecord);
    sub_100008A78((uint64_t)a1);
    return sub_10000652C((uint64_t)v13, type metadata accessor for TaskParametersRecord);
  }
}

uint64_t sub_100003A1C()
{
  return sub_1000033CC(*v0);
}

uint64_t sub_100003A24@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_100009530(a1, a2);
  *a3 = result;
  return result;
}

void sub_100003A4C(unsigned char *a1@<X8>)
{
  *a1 = 4;
}

uint64_t sub_100003A58(uint64_t a1)
{
  unint64_t v2 = sub_100008B70();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100003A94(uint64_t a1)
{
  unint64_t v2 = sub_100008B70();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_100003AD0@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_10000360C(a1, a2);
}

uint64_t sub_100003AE8(void *a1)
{
  return sub_1000033EC(a1);
}

uint64_t sub_100003B00@<X0>(id a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_100005644(&qword_10003C3B0);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v55 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for TaskParametersRecord(0);
  uint64_t v61 = *(void *)(v7 - 8);
  uint64_t v8 = __chkstk_darwin(v7);
  uint64_t v10 = (uint64_t *)((char *)&v55 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v11 = (uint64_t)v10 + *(int *)(v8 + 28);
  uint64_t v12 = sub_1000325D0();
  uint64_t v13 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56);
  uint64_t v60 = v11;
  v13(v11, 1, 1, v12);
  uint64_t v14 = sub_100032AC0();
  uint64_t v16 = v15;
  if (qword_10003C388 != -1) {
    swift_once();
  }
  if (v14 == qword_10003C9A0 && v16 == *(void *)algn_10003C9A8)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    char v17 = sub_100032C70();
    swift_bridgeObjectRelease();
    if ((v17 & 1) == 0)
    {
      if (qword_10003C398 != -1) {
        swift_once();
      }
      uint64_t v47 = sub_100032880();
      sub_1000056A8(v47, (uint64_t)qword_10003C9C0);
      a1 = a1;
      unint64_t v48 = sub_100032860();
      os_log_type_t v49 = sub_100032A90();
      if (os_log_type_enabled(v48, v49))
      {
        uint64_t v50 = (uint8_t *)swift_slowAlloc();
        uint64_t v62 = swift_slowAlloc();
        *(_DWORD *)uint64_t v50 = 136315138;
        uint64_t v51 = sub_100032AC0();
        uint64_t v64 = sub_100005B78(v51, v52, &v62);
        sub_100032AF0();

        swift_bridgeObjectRelease();
        _os_log_impl((void *)&_mh_execute_header, v48, v49, "Invalid recordType: %s", v50, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {
      }
      goto LABEL_25;
    }
  }
  uint64_t v59 = v7;
  id v18 = [a1 values];
  sub_100005644(&qword_10003C418);
  uint64_t v19 = sub_1000328E0();

  if (!*(void *)(v19 + 16) || (unint64_t v20 = sub_1000061D0(0x656D614E6B736174, 0xE800000000000000), (v21 & 1) == 0))
  {
    swift_bridgeObjectRelease();
    goto LABEL_19;
  }
  uint64_t v22 = *(void *)(*(void *)(v19 + 56) + 8 * v20);
  swift_unknownObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v64 = v22;
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_19:
    uint64_t v7 = v59;
    if (qword_10003C398 != -1) {
      swift_once();
    }
    uint64_t v40 = sub_100032880();
    sub_1000056A8(v40, (uint64_t)qword_10003C9C0);
    id v41 = sub_100032860();
    os_log_type_t v42 = sub_100032A90();
    if (!os_log_type_enabled(v41, v42)) {
      goto LABEL_24;
    }
    unint64_t v43 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unint64_t v43 = 0;
    char v44 = "Failed at parsing taskName";
    goto LABEL_23;
  }
  uint64_t v57 = v62;
  unint64_t v58 = v63;
  id v23 = [a1 values];
  uint64_t v24 = sub_1000328E0();

  if (!*(void *)(v24 + 16) || (unint64_t v25 = sub_1000061D0(0x6F69736E65747865, 0xEB0000000044496ELL), (v26 & 1) == 0))
  {
    swift_bridgeObjectRelease();
LABEL_32:
    swift_bridgeObjectRelease();
    uint64_t v7 = v59;
    if (qword_10003C398 != -1) {
      swift_once();
    }
    uint64_t v53 = sub_100032880();
    sub_1000056A8(v53, (uint64_t)qword_10003C9C0);
    id v41 = sub_100032860();
    os_log_type_t v42 = sub_100032A90();
    if (!os_log_type_enabled(v41, v42)) {
      goto LABEL_24;
    }
    unint64_t v43 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unint64_t v43 = 0;
    char v44 = "Failed at parsing extensionID";
    goto LABEL_23;
  }
  uint64_t v27 = *(void *)(*(void *)(v24 + 56) + 8 * v25);
  swift_unknownObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v64 = v27;
  if ((swift_dynamicCast() & 1) == 0) {
    goto LABEL_32;
  }
  uint64_t v55 = v62;
  unint64_t v56 = v63;
  id v28 = [a1 values];
  uint64_t v29 = sub_1000328E0();

  if (!*(void *)(v29 + 16) || (unint64_t v30 = sub_1000061D0(0x6574656D61726170, 0xEE00617461447372), (v31 & 1) == 0))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_38:
    swift_bridgeObjectRelease();
    uint64_t v7 = v59;
    if (qword_10003C398 != -1) {
      swift_once();
    }
    uint64_t v54 = sub_100032880();
    sub_1000056A8(v54, (uint64_t)qword_10003C9C0);
    id v41 = sub_100032860();
    os_log_type_t v42 = sub_100032A90();
    if (!os_log_type_enabled(v41, v42)) {
      goto LABEL_24;
    }
    unint64_t v43 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unint64_t v43 = 0;
    char v44 = "Failed at parsing parametersData";
LABEL_23:
    _os_log_impl((void *)&_mh_execute_header, v41, v42, v44, v43, 2u);
    swift_slowDealloc();
LABEL_24:

LABEL_25:
    uint64_t v45 = v61;
    sub_1000065E4(v60, &qword_10003C3B0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v45 + 56))(a2, 1, 1, v7);
  }
  uint64_t v32 = *(void *)(*(void *)(v29 + 56) + 8 * v30);
  swift_unknownObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v64 = v32;
  if ((swift_dynamicCast() & 1) == 0)
  {
    swift_bridgeObjectRelease();
    goto LABEL_38;
  }
  uint64_t v33 = v62;
  unint64_t v34 = v63;
  uint64_t v35 = v58;
  *uint64_t v10 = v57;
  v10[1] = v35;
  uint64_t v36 = v56;
  v10[2] = v55;
  v10[3] = v36;
  v10[4] = v33;
  v10[5] = v34;
  sub_1000062A0(v33, v34);
  id v37 = [a1 creationDate];
  if (v37)
  {
    char v38 = v37;
    sub_100032590();

    sub_100006248(v33, v34);
    uint64_t v39 = 0;
  }
  else
  {

    sub_100006248(v33, v34);
    uint64_t v39 = 1;
  }
  v13((uint64_t)v6, v39, 1, v12);
  sub_1000062F8((uint64_t)v6, v60);
  sub_1000064C4((uint64_t)v10, a2, type metadata accessor for TaskParametersRecord);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v61 + 56))(a2, 0, 1, v59);
  return sub_10000652C((uint64_t)v10, type metadata accessor for TaskParametersRecord);
}

void sub_1000043C4()
{
  algn_10003C9B8[5] = 0;
  *(_WORD *)&algn_10003C9B8[6] = -5120;
}

uint64_t sub_1000043F0(char a1)
{
  return *(void *)&aTasknameextens_1[8 * a1];
}

uint64_t sub_100004410(void *a1)
{
  uint64_t v3 = sub_100005644(&qword_10003C6C0);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = &v8[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_1000089E0(a1, a1[3]);
  sub_100008BC4();
  sub_100032D40();
  v8[15] = 0;
  sub_100032C30();
  if (!v1)
  {
    v8[14] = 1;
    sub_100032C30();
    v8[13] = 2;
    sub_100032C30();
    type metadata accessor for TaskPayloadRecord(0);
    v8[12] = 3;
    sub_1000325D0();
    sub_1000086EC(&qword_10003C690, (void (*)(uint64_t))&type metadata accessor for Date);
    sub_100032C20();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t sub_100004618@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v25 = a2;
  uint64_t v4 = sub_100005644(&qword_10003C3B0);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100005644(&qword_10003C6B0);
  uint64_t v26 = *(void *)(v7 - 8);
  uint64_t v27 = v7;
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for TaskPayloadRecord(0);
  uint64_t v11 = __chkstk_darwin(v10 - 8);
  uint64_t v13 = (void *)((char *)v24 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v14 = (uint64_t)v13 + *(int *)(v11 + 36);
  uint64_t v15 = sub_1000325D0();
  uint64_t v16 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56);
  uint64_t v28 = v14;
  v16(v14, 1, 1, v15);
  sub_1000089E0(a1, a1[3]);
  sub_100008BC4();
  sub_100032D30();
  if (v2)
  {
    sub_100008A78((uint64_t)a1);
    return sub_1000065E4(v28, &qword_10003C3B0);
  }
  else
  {
    uint64_t v17 = (uint64_t)v6;
    uint64_t v19 = v26;
    uint64_t v18 = v27;
    char v32 = 0;
    *uint64_t v13 = sub_100032C00();
    v13[1] = v20;
    char v31 = 1;
    v13[2] = sub_100032C00();
    v13[3] = v21;
    char v30 = 2;
    v24[1] = 0;
    v13[4] = sub_100032C00();
    v13[5] = v22;
    char v29 = 3;
    sub_1000086EC(&qword_10003C678, (void (*)(uint64_t))&type metadata accessor for Date);
    sub_100032BF0();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v9, v18);
    sub_1000062F8(v17, v28);
    sub_1000064C4((uint64_t)v13, v25, type metadata accessor for TaskPayloadRecord);
    sub_100008A78((uint64_t)a1);
    return sub_10000652C((uint64_t)v13, type metadata accessor for TaskPayloadRecord);
  }
}

Swift::Int sub_100004A0C()
{
  Swift::UInt v1 = *v0;
  sub_100032D00();
  sub_100032D10(v1);
  return sub_100032D20();
}

Swift::Int sub_100004A54()
{
  Swift::UInt v1 = *v0;
  sub_100032D00();
  sub_100032D10(v1);
  return sub_100032D20();
}

uint64_t sub_100004A98()
{
  return sub_1000043F0(*v0);
}

uint64_t sub_100004AA0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_10000970C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_100004AC8(uint64_t a1)
{
  unint64_t v2 = sub_100008BC4();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100004B04(uint64_t a1)
{
  unint64_t v2 = sub_100008BC4();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_100004B40@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_100004618(a1, a2);
}

uint64_t sub_100004B58(void *a1)
{
  return sub_100004410(a1);
}

uint64_t sub_100004B70@<X0>(void *a1@<X0>, id a2@<X8>)
{
  uint64_t v4 = sub_100005644(&qword_10003C3B0);
  __chkstk_darwin(v4 - 8);
  v80 = (char *)&v71 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100005644(&qword_10003C428);
  __chkstk_darwin(v6 - 8);
  unint64_t v82 = (char *)&v71 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100032540();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v83 = v8;
  uint64_t v84 = v9;
  uint64_t v10 = __chkstk_darwin(v8);
  __chkstk_darwin(v10);
  uint64_t v81 = (char *)&v71 - v11;
  uint64_t v12 = type metadata accessor for TaskPayloadRecord(0);
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = __chkstk_darwin(v12);
  uint64_t v16 = (uint64_t *)((char *)&v71 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v17 = (uint64_t)v16 + *(int *)(v14 + 28);
  uint64_t v18 = sub_1000325D0();
  uint64_t v19 = *(void *)(v18 - 8);
  uint64_t v20 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v19 + 56);
  uint64_t v78 = v19 + 56;
  os_log_type_t v79 = v20;
  v20(v17, 1, 1, v18);
  uint64_t v21 = sub_100032AC0();
  uint64_t v23 = v22;
  if (qword_10003C390 != -1) {
    swift_once();
  }
  if (v21 == qword_10003C9B0 && v23 == *(void *)algn_10003C9B8)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    char v24 = sub_100032C70();
    swift_bridgeObjectRelease();
    if ((v24 & 1) == 0)
    {
      if (qword_10003C398 != -1) {
        swift_once();
      }
      uint64_t v59 = sub_100032880();
      sub_1000056A8(v59, (uint64_t)qword_10003C9C0);
      id v60 = a1;
      uint64_t v61 = sub_100032860();
      os_log_type_t v62 = sub_100032A90();
      if (os_log_type_enabled(v61, v62))
      {
        uint64_t v63 = swift_slowAlloc();
        id v85 = a2;
        uint64_t v64 = (uint8_t *)v63;
        uint64_t v65 = swift_slowAlloc();
        uint64_t v84 = v17;
        uint64_t v86 = v65;
        *(_DWORD *)uint64_t v64 = 136315138;
        uint64_t v66 = sub_100032AC0();
        uint64_t v88 = sub_100005B78(v66, v67, &v86);
        sub_100032AF0();

        swift_bridgeObjectRelease();
        _os_log_impl((void *)&_mh_execute_header, v61, v62, "Invalid recordType: %s", v64, 0xCu);
        swift_arrayDestroy();
        uint64_t v17 = v84;
        swift_slowDealloc();
        a2 = v85;
        swift_slowDealloc();
      }
      else
      {
      }
      goto LABEL_33;
    }
  }
  id v85 = a1;
  id v25 = [a1 values];
  sub_100005644(&qword_10003C418);
  uint64_t v26 = sub_1000328E0();

  if (!*(void *)(v26 + 16) || (unint64_t v27 = sub_1000061D0(0x656D614E6B736174, 0xE800000000000000), (v28 & 1) == 0))
  {
    swift_bridgeObjectRelease();
    goto LABEL_21;
  }
  uint64_t v29 = *(void *)(*(void *)(v26 + 56) + 8 * v27);
  swift_unknownObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v88 = v29;
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_21:
    if (qword_10003C398 != -1) {
      swift_once();
    }
    uint64_t v54 = sub_100032880();
    sub_1000056A8(v54, (uint64_t)qword_10003C9C0);
    uint64_t v55 = sub_100032860();
    os_log_type_t v56 = sub_100032A90();
    if (!os_log_type_enabled(v55, v56)) {
      goto LABEL_26;
    }
    uint64_t v57 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v57 = 0;
    unint64_t v58 = "Failed at parsing taskName";
    goto LABEL_25;
  }
  uint64_t v76 = v86;
  uint64_t v77 = v87;
  id v30 = [v85 values];
  uint64_t v31 = sub_1000328E0();

  if (!*(void *)(v31 + 16) || (unint64_t v32 = sub_1000061D0(0x6F69736E65747865, 0xEB0000000044496ELL), (v33 & 1) == 0))
  {
    swift_bridgeObjectRelease();
LABEL_35:
    swift_bridgeObjectRelease();
    if (qword_10003C398 != -1) {
      swift_once();
    }
    uint64_t v69 = sub_100032880();
    sub_1000056A8(v69, (uint64_t)qword_10003C9C0);
    uint64_t v55 = sub_100032860();
    os_log_type_t v56 = sub_100032A90();
    if (!os_log_type_enabled(v55, v56)) {
      goto LABEL_26;
    }
    uint64_t v57 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v57 = 0;
    unint64_t v58 = "Failed at parsing extensionID";
    goto LABEL_25;
  }
  uint64_t v34 = *(void *)(*(void *)(v31 + 56) + 8 * v32);
  swift_unknownObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v88 = v34;
  if ((swift_dynamicCast() & 1) == 0) {
    goto LABEL_35;
  }
  uint64_t v74 = v86;
  uint64_t v75 = v87;
  id v35 = [v85 values];
  uint64_t v36 = sub_1000328E0();

  if (!*(void *)(v36 + 16) || (unint64_t v37 = sub_1000061D0(0x617474416B736174, 0xEE00746E656D6863), (v38 & 1) == 0))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_41:
    swift_bridgeObjectRelease();
LABEL_42:
    if (qword_10003C398 != -1) {
      swift_once();
    }
    uint64_t v70 = sub_100032880();
    sub_1000056A8(v70, (uint64_t)qword_10003C9C0);
    uint64_t v55 = sub_100032860();
    os_log_type_t v56 = sub_100032A90();
    if (!os_log_type_enabled(v55, v56)) {
      goto LABEL_26;
    }
    uint64_t v57 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v57 = 0;
    unint64_t v58 = "Failed at parsing taskAttachment";
LABEL_25:
    _os_log_impl((void *)&_mh_execute_header, v55, v56, v58, v57, 2u);
    swift_slowDealloc();
LABEL_26:

LABEL_33:
    sub_1000065E4(v17, &qword_10003C3B0);
    return (*(uint64_t (**)(id, uint64_t, uint64_t, uint64_t))(v13 + 56))(a2, 1, 1, v12);
  }
  uint64_t v39 = *(void *)(*(void *)(v36 + 56) + 8 * v37);
  swift_unknownObjectRetain();
  swift_bridgeObjectRelease();
  self;
  uint64_t v40 = (void *)swift_dynamicCastObjCClass();
  if (!v40)
  {
    swift_unknownObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_41;
  }
  uint64_t v73 = v39;
  id v41 = [v40 fileURL];
  if (!v41)
  {
    uint64_t v45 = (uint64_t)v82;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v84 + 56))(v82, 1, 1, v83);
    goto LABEL_48;
  }
  os_log_type_t v42 = v41;
  sub_100032500();

  uint64_t v44 = v83;
  uint64_t v43 = v84;
  uint64_t v45 = (uint64_t)v82;
  v72 = *(void (**)(void))(v84 + 32);
  v72();
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v43 + 56))(v45, 0, 1, v44);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v43 + 48))(v45, 1, v44) == 1)
  {
LABEL_48:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();
    sub_1000065E4(v45, &qword_10003C428);
    goto LABEL_42;
  }
  ((void (*)(char *, uint64_t, uint64_t))v72)(v81, v45, v44);
  uint64_t v46 = v77;
  uint64_t *v16 = v76;
  v16[1] = v46;
  uint64_t v47 = v75;
  v16[2] = v74;
  v16[3] = v47;
  v16[4] = sub_100032510(0);
  v16[5] = v48;
  id v49 = v85;
  id v50 = [v85 creationDate];
  if (v50)
  {
    uint64_t v51 = v50;
    uint64_t v52 = (uint64_t)v80;
    sub_100032590();

    uint64_t v53 = 0;
  }
  else
  {
    uint64_t v53 = 1;
    uint64_t v52 = (uint64_t)v80;
  }

  swift_unknownObjectRelease();
  (*(void (**)(char *, uint64_t))(v84 + 8))(v81, v44);
  v79(v52, v53, 1, v18);
  sub_1000062F8(v52, v17);
  sub_1000064C4((uint64_t)v16, (uint64_t)a2, type metadata accessor for TaskPayloadRecord);
  (*(void (**)(id, void, uint64_t, uint64_t))(v13 + 56))(a2, 0, 1, v12);
  return sub_10000652C((uint64_t)v16, type metadata accessor for TaskPayloadRecord);
}

uint64_t sub_100005644(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t type metadata accessor for TaskRecord(uint64_t a1)
{
  return sub_1000065AC(a1, (uint64_t *)&unk_10003C490);
}

uint64_t sub_1000056A8(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_1000056E0(uint64_t a1)
{
  uint64_t v2 = sub_1000086EC(&qword_10003C620, type metadata accessor for CKError);

  return Error<>._domain.getter(a1, v2);
}

uint64_t sub_10000574C(uint64_t a1)
{
  uint64_t v2 = sub_1000086EC(&qword_10003C620, type metadata accessor for CKError);

  return Error<>._code.getter(a1, v2);
}

uint64_t sub_1000057BC(uint64_t a1)
{
  uint64_t v2 = sub_1000086EC(&qword_10003C658, type metadata accessor for CKError);

  return _BridgedStoredNSError._getEmbeddedNSError()(a1, v2);
}

id sub_100005828()
{
  return *v0;
}

uint64_t sub_100005830@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = result;
  return result;
}

BOOL sub_100005838(void *a1, void *a2)
{
  return *a1 == *a2;
}

uint64_t sub_10000584C()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)(CKErrorDomain);
}

uint64_t sub_10000585C(uint64_t a1)
{
  uint64_t v2 = sub_1000086EC(&qword_10003C658, type metadata accessor for CKError);

  return _BridgedStoredNSError.errorCode.getter(a1, v2);
}

uint64_t sub_1000058C8(uint64_t a1)
{
  uint64_t v2 = sub_1000086EC(&qword_10003C658, type metadata accessor for CKError);

  return _BridgedStoredNSError.errorUserInfo.getter(a1, v2);
}

uint64_t sub_100005934(void *a1, uint64_t a2)
{
  uint64_t v4 = sub_1000086EC(&qword_10003C658, type metadata accessor for CKError);
  id v5 = a1;

  return _BridgedStoredNSError.init(_bridgedNSError:)(v5, a2, v4);
}

uint64_t sub_1000059C4()
{
  id v1 = *v0;
  uint64_t v2 = sub_100032AD0();

  return v2;
}

uint64_t sub_1000059FC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000086EC(&qword_10003C658, type metadata accessor for CKError);

  return _BridgedStoredNSError.hash(into:)(a1, a2, v4);
}

Swift::Int sub_100005A78()
{
  return sub_100032D20();
}

void *sub_100005AD8@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void sub_100005AE8(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_100005AF4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1000086EC(&qword_10003C658, type metadata accessor for CKError);

  return static _BridgedStoredNSError.== infix(_:_:)(a1, a2, a3, v6);
}

uint64_t sub_100005B78(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_100005C4C(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_100006444((uint64_t)v12, *a3);
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
      sub_100006444((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_100008A78((uint64_t)v12);
  return v7;
}

uint64_t sub_100005C4C(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_100032B00();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_100005E08(a5, a6);
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
  uint64_t v8 = sub_100032B70();
  if (!v8)
  {
    sub_100032B80();
    __break(1u);
LABEL_17:
    uint64_t result = sub_100032BD0();
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

uint64_t sub_100005E08(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_100005EA0(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_100006080(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_100006080(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_100005EA0(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_100006018(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_100032B50();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_100032B80();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_100032950();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_100032BD0();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_100032B80();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_100006018(uint64_t a1, uint64_t a2)
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
  sub_100005644(&qword_10003C420);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_100006080(char a1, int64_t a2, char a3, char *a4)
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
    sub_100005644(&qword_10003C420);
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
  uint64_t result = sub_100032BD0();
  __break(1u);
  return result;
}

unint64_t sub_1000061D0(uint64_t a1, uint64_t a2)
{
  sub_100032D00();
  sub_100032940();
  Swift::Int v4 = sub_100032D20();

  return sub_100006360(a1, a2, v4);
}

uint64_t sub_100006248(uint64_t a1, unint64_t a2)
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

uint64_t sub_1000062A0(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_retain();
  }

  return swift_retain();
}

uint64_t sub_1000062F8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100005644(&qword_10003C3B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

unint64_t sub_100006360(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_100032C70() & 1) == 0)
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
      while (!v14 && (sub_100032C70() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_100006444(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t type metadata accessor for TaskParametersRecord(uint64_t a1)
{
  return sub_1000065AC(a1, qword_10003C538);
}

uint64_t sub_1000064C4(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_10000652C(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t type metadata accessor for TaskPayloadRecord(uint64_t a1)
{
  return sub_1000065AC(a1, qword_10003C5D0);
}

uint64_t sub_1000065AC(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1000065E4(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100005644(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

void type metadata accessor for CKError(uint64_t a1)
{
}

char *sub_100006654(char *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v21 = *a2;
    *(void *)a1 = *a2;
    a1 = (char *)(v21 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = a2[1];
    *(void *)a1 = *a2;
    *((void *)a1 + 1) = v7;
    uint64_t v8 = a2[3];
    *((void *)a1 + 2) = a2[2];
    *((void *)a1 + 3) = v8;
    uint64_t v9 = a2[4];
    unint64_t v10 = a2[5];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_1000062A0(v9, v10);
    *((void *)a1 + 4) = v9;
    *((void *)a1 + 5) = v10;
    uint64_t v11 = a3[7];
    uint64_t v12 = &a1[v11];
    uint64_t v13 = (char *)a2 + v11;
    uint64_t v14 = sub_1000325D0();
    uint64_t v15 = *(void *)(v14 - 8);
    uint64_t v16 = *(void (**)(char *, char *, uint64_t))(v15 + 16);
    v16(v12, v13, v14);
    v16(&a1[a3[8]], (char *)a2 + a3[8], v14);
    uint64_t v17 = a3[9];
    uint64_t v18 = &a1[v17];
    uint64_t v19 = (char *)a2 + v17;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v19, 1, v14))
    {
      uint64_t v20 = sub_100005644(&qword_10003C3B0);
      memcpy(v18, v19, *(void *)(*(void *)(v20 - 8) + 64));
    }
    else
    {
      v16(v18, v19, v14);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v15 + 56))(v18, 0, 1, v14);
    }
  }
  return a1;
}

uint64_t sub_100006838(uint64_t a1, int *a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_100006248(*(void *)(a1 + 32), *(void *)(a1 + 40));
  uint64_t v4 = a1 + a2[7];
  uint64_t v5 = sub_1000325D0();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v9 = *(void (**)(uint64_t, uint64_t))(v6 + 8);
  v9(v4, v5);
  v9(a1 + a2[8], v5);
  uint64_t v7 = a1 + a2[9];
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v7, 1, v5);
  if (!result)
  {
    return ((uint64_t (*)(uint64_t, uint64_t))v9)(v7, v5);
  }
  return result;
}

char *sub_100006970(char *a1, char *a2, int *a3)
{
  uint64_t v6 = *((void *)a2 + 1);
  *(void *)a1 = *(void *)a2;
  *((void *)a1 + 1) = v6;
  uint64_t v7 = *((void *)a2 + 3);
  *((void *)a1 + 2) = *((void *)a2 + 2);
  *((void *)a1 + 3) = v7;
  uint64_t v8 = *((void *)a2 + 4);
  unint64_t v9 = *((void *)a2 + 5);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1000062A0(v8, v9);
  *((void *)a1 + 4) = v8;
  *((void *)a1 + 5) = v9;
  uint64_t v10 = a3[7];
  uint64_t v11 = &a1[v10];
  uint64_t v12 = &a2[v10];
  uint64_t v13 = sub_1000325D0();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = *(void (**)(char *, char *, uint64_t))(v14 + 16);
  v15(v11, v12, v13);
  v15(&a1[a3[8]], &a2[a3[8]], v13);
  uint64_t v16 = a3[9];
  uint64_t v17 = &a1[v16];
  uint64_t v18 = &a2[v16];
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v18, 1, v13))
  {
    uint64_t v19 = sub_100005644(&qword_10003C3B0);
    memcpy(v17, v18, *(void *)(*(void *)(v19 - 8) + 64));
  }
  else
  {
    v15(v17, v18, v13);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v14 + 56))(v17, 0, 1, v13);
  }
  return a1;
}

char *sub_100006B04(char *a1, char *a2, int *a3)
{
  *(void *)a1 = *(void *)a2;
  *((void *)a1 + 1) = *((void *)a2 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((void *)a1 + 2) = *((void *)a2 + 2);
  *((void *)a1 + 3) = *((void *)a2 + 3);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *((void *)a2 + 4);
  unint64_t v7 = *((void *)a2 + 5);
  sub_1000062A0(v6, v7);
  uint64_t v8 = *((void *)a1 + 4);
  unint64_t v9 = *((void *)a1 + 5);
  *((void *)a1 + 4) = v6;
  *((void *)a1 + 5) = v7;
  sub_100006248(v8, v9);
  uint64_t v10 = a3[7];
  uint64_t v11 = &a1[v10];
  uint64_t v12 = &a2[v10];
  uint64_t v13 = sub_1000325D0();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = *(void (**)(char *, char *, uint64_t))(v14 + 24);
  v15(v11, v12, v13);
  v15(&a1[a3[8]], &a2[a3[8]], v13);
  uint64_t v16 = a3[9];
  uint64_t v17 = &a1[v16];
  uint64_t v18 = &a2[v16];
  uint64_t v19 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v14 + 48);
  LODWORD(v11) = v19(&a1[v16], 1, v13);
  int v20 = v19(v18, 1, v13);
  if (!v11)
  {
    if (!v20)
    {
      v15(v17, v18, v13);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v14 + 8))(v17, v13);
    goto LABEL_6;
  }
  if (v20)
  {
LABEL_6:
    uint64_t v21 = sub_100005644(&qword_10003C3B0);
    memcpy(v17, v18, *(void *)(*(void *)(v21 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v14 + 16))(v17, v18, v13);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v14 + 56))(v17, 0, 1, v13);
  return a1;
}

char *sub_100006D24(char *a1, char *a2, int *a3)
{
  long long v6 = *((_OWORD *)a2 + 1);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *((_OWORD *)a1 + 1) = v6;
  *((_OWORD *)a1 + 2) = *((_OWORD *)a2 + 2);
  uint64_t v7 = a3[7];
  uint64_t v8 = &a1[v7];
  unint64_t v9 = &a2[v7];
  uint64_t v10 = sub_1000325D0();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(void (**)(char *, char *, uint64_t))(v11 + 32);
  v12(v8, v9, v10);
  v12(&a1[a3[8]], &a2[a3[8]], v10);
  uint64_t v13 = a3[9];
  uint64_t v14 = &a1[v13];
  uint64_t v15 = &a2[v13];
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v15, 1, v10))
  {
    uint64_t v16 = sub_100005644(&qword_10003C3B0);
    memcpy(v14, v15, *(void *)(*(void *)(v16 - 8) + 64));
  }
  else
  {
    v12(v14, v15, v10);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v14, 0, 1, v10);
  }
  return a1;
}

void *sub_100006E98(void *a1, uint64_t a2, int *a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(a2 + 24);
  a1[2] = *(void *)(a2 + 16);
  a1[3] = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = a1[4];
  unint64_t v9 = a1[5];
  *((_OWORD *)a1 + 2) = *(_OWORD *)(a2 + 32);
  sub_100006248(v8, v9);
  uint64_t v10 = a3[7];
  uint64_t v11 = (char *)a1 + v10;
  uint64_t v12 = a2 + v10;
  uint64_t v13 = sub_1000325D0();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = *(void (**)(char *, uint64_t, uint64_t))(v14 + 40);
  v15(v11, v12, v13);
  v15((char *)a1 + a3[8], a2 + a3[8], v13);
  uint64_t v16 = a3[9];
  uint64_t v17 = (char *)a1 + v16;
  uint64_t v18 = (char *)(a2 + v16);
  uint64_t v19 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v14 + 48);
  LODWORD(v11) = v19((char *)a1 + v16, 1, v13);
  int v20 = v19(v18, 1, v13);
  if (!v11)
  {
    if (!v20)
    {
      v15(v17, (uint64_t)v18, v13);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v14 + 8))(v17, v13);
    goto LABEL_6;
  }
  if (v20)
  {
LABEL_6:
    uint64_t v21 = sub_100005644(&qword_10003C3B0);
    memcpy(v17, v18, *(void *)(*(void *)(v21 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v17, v18, v13);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v14 + 56))(v17, 0, 1, v13);
  return a1;
}

uint64_t sub_10000708C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000070A0);
}

uint64_t sub_1000070A0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = sub_1000325D0();
    uint64_t v9 = *(void *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a2)
    {
      uint64_t v10 = v8;
      uint64_t v11 = a1 + *(int *)(a3 + 28);
      uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 48);
      return v12(v11, a2, v10);
    }
    else
    {
      uint64_t v13 = sub_100005644(&qword_10003C3B0);
      uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 48);
      uint64_t v15 = v13;
      uint64_t v16 = a1 + *(int *)(a3 + 36);
      return v14(v16, a2, v15);
    }
  }
}

uint64_t sub_1000071D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000071E4);
}

uint64_t sub_1000071E4(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v8 = sub_1000325D0();
    uint64_t v9 = *(void *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      uint64_t v10 = v8;
      uint64_t v11 = v5 + *(int *)(a4 + 28);
      uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
      return v12(v11, a2, a2, v10);
    }
    else
    {
      uint64_t v13 = sub_100005644(&qword_10003C3B0);
      uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56);
      uint64_t v15 = v13;
      uint64_t v16 = v5 + *(int *)(a4 + 36);
      return v14(v16, a2, a2, v15);
    }
  }
  return result;
}

void sub_100007314()
{
  sub_1000325D0();
  if (v0 <= 0x3F)
  {
    sub_1000073F4();
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void sub_1000073F4()
{
  if (!qword_10003C4A0)
  {
    sub_1000325D0();
    unint64_t v0 = sub_100032AE0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_10003C4A0);
    }
  }
}

uint64_t *sub_10000744C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v17 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v17 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    uint64_t v8 = a2[3];
    a1[2] = a2[2];
    a1[3] = v8;
    uint64_t v9 = a2[4];
    unint64_t v10 = a2[5];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_1000062A0(v9, v10);
    a1[4] = v9;
    a1[5] = v10;
    uint64_t v11 = *(int *)(a3 + 28);
    uint64_t v12 = (char *)a1 + v11;
    uint64_t v13 = (char *)a2 + v11;
    uint64_t v14 = sub_1000325D0();
    uint64_t v15 = *(void *)(v14 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14))
    {
      uint64_t v16 = sub_100005644(&qword_10003C3B0);
      memcpy(v12, v13, *(void *)(*(void *)(v16 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v15 + 16))(v12, v13, v14);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v15 + 56))(v12, 0, 1, v14);
    }
  }
  return a1;
}

uint64_t sub_1000075E0(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_100006248(*(void *)(a1 + 32), *(void *)(a1 + 40));
  uint64_t v4 = a1 + *(int *)(a2 + 28);
  uint64_t v5 = sub_1000325D0();
  uint64_t v8 = *(void *)(v5 - 8);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v8 + 48))(v4, 1, v5);
  if (!result)
  {
    uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(v8 + 8);
    return v7(v4, v5);
  }
  return result;
}

void *sub_1000076C0(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  uint64_t v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  uint64_t v8 = a2[4];
  unint64_t v9 = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1000062A0(v8, v9);
  a1[4] = v8;
  a1[5] = v9;
  uint64_t v10 = *(int *)(a3 + 28);
  uint64_t v11 = (char *)a1 + v10;
  uint64_t v12 = (char *)a2 + v10;
  uint64_t v13 = sub_1000325D0();
  uint64_t v14 = *(void *)(v13 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13))
  {
    uint64_t v15 = sub_100005644(&qword_10003C3B0);
    memcpy(v11, v12, *(void *)(*(void *)(v15 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v14 + 16))(v11, v12, v13);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v14 + 56))(v11, 0, 1, v13);
  }
  return a1;
}

void *sub_100007804(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = a2[4];
  unint64_t v7 = a2[5];
  sub_1000062A0(v6, v7);
  uint64_t v8 = a1[4];
  unint64_t v9 = a1[5];
  a1[4] = v6;
  a1[5] = v7;
  sub_100006248(v8, v9);
  uint64_t v10 = *(int *)(a3 + 28);
  uint64_t v11 = (char *)a1 + v10;
  uint64_t v12 = (char *)a2 + v10;
  uint64_t v13 = sub_1000325D0();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v14 + 48);
  LODWORD(v7) = v15(v11, 1, v13);
  int v16 = v15(v12, 1, v13);
  if (!v7)
  {
    if (!v16)
    {
      (*(void (**)(char *, char *, uint64_t))(v14 + 24))(v11, v12, v13);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v14 + 8))(v11, v13);
    goto LABEL_6;
  }
  if (v16)
  {
LABEL_6:
    uint64_t v17 = sub_100005644(&qword_10003C3B0);
    memcpy(v11, v12, *(void *)(*(void *)(v17 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v14 + 16))(v11, v12, v13);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v14 + 56))(v11, 0, 1, v13);
  return a1;
}

void *sub_1000079DC(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(a2 + 24);
  a1[2] = *(void *)(a2 + 16);
  a1[3] = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = a1[4];
  unint64_t v9 = a1[5];
  *((_OWORD *)a1 + 2) = *(_OWORD *)(a2 + 32);
  sub_100006248(v8, v9);
  uint64_t v10 = *(int *)(a3 + 28);
  uint64_t v11 = (char *)a1 + v10;
  uint64_t v12 = (char *)(a2 + v10);
  uint64_t v13 = sub_1000325D0();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v14 + 48);
  int v16 = v15(v11, 1, v13);
  int v17 = v15(v12, 1, v13);
  if (!v16)
  {
    if (!v17)
    {
      (*(void (**)(char *, char *, uint64_t))(v14 + 40))(v11, v12, v13);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v14 + 8))(v11, v13);
    goto LABEL_6;
  }
  if (v17)
  {
LABEL_6:
    uint64_t v18 = sub_100005644(&qword_10003C3B0);
    memcpy(v11, v12, *(void *)(*(void *)(v18 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v11, v12, v13);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v14 + 56))(v11, 0, 1, v13);
  return a1;
}

uint64_t sub_100007B84(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100007B98);
}

uint64_t sub_100007B9C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100007BB0);
}

void sub_100007BB4()
{
}

uint64_t *sub_100007BC0(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3 = a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v15 = *a2;
    *uint64_t v3 = *a2;
    uint64_t v3 = (uint64_t *)(v15 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    uint64_t v5 = a2[1];
    *a1 = *a2;
    a1[1] = v5;
    uint64_t v6 = a2[3];
    a1[2] = a2[2];
    a1[3] = v6;
    uint64_t v7 = a2[5];
    uint64_t v8 = *(int *)(a3 + 28);
    unint64_t v9 = (char *)a2 + v8;
    uint64_t v10 = (char *)a1 + v8;
    a1[4] = a2[4];
    a1[5] = v7;
    uint64_t v11 = sub_1000325D0();
    uint64_t v12 = *(void *)(v11 - 8);
    uint64_t v13 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v13(v9, 1, v11))
    {
      uint64_t v14 = sub_100005644(&qword_10003C3B0);
      memcpy(v10, v9, *(void *)(*(void *)(v14 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v10, v9, v11);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v10, 0, 1, v11);
    }
  }
  return v3;
}

uint64_t sub_100007D5C(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 28);
  uint64_t v5 = sub_1000325D0();
  uint64_t v8 = *(void *)(v5 - 8);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v8 + 48))(v4, 1, v5);
  if (!result)
  {
    uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(v8 + 8);
    return v7(v4, v5);
  }
  return result;
}

void *sub_100007E3C(void *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  uint64_t v6 = a2[5];
  uint64_t v7 = *(int *)(a3 + 28);
  uint64_t v8 = (char *)a2 + v7;
  unint64_t v9 = (char *)a1 + v7;
  a1[4] = a2[4];
  a1[5] = v6;
  uint64_t v10 = sub_1000325D0();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v12(v8, 1, v10))
  {
    uint64_t v13 = sub_100005644(&qword_10003C3B0);
    memcpy(v9, v8, *(void *)(*(void *)(v13 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v9, v8, v10);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v9, 0, 1, v10);
  }
  return a1;
}

void *sub_100007F88(void *a1, void *a2, uint64_t a3)
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
  uint64_t v6 = *(int *)(a3 + 28);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_1000325D0();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48);
  int v12 = v11(v7, 1, v9);
  int v13 = v11(v8, 1, v9);
  if (!v12)
  {
    if (!v13)
    {
      (*(void (**)(char *, char *, uint64_t))(v10 + 24))(v7, v8, v9);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v10 + 8))(v7, v9);
    goto LABEL_6;
  }
  if (v13)
  {
LABEL_6:
    uint64_t v14 = sub_100005644(&qword_10003C3B0);
    memcpy(v7, v8, *(void *)(*(void *)(v14 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v7, v8, v9);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  return a1;
}

_OWORD *sub_100008160(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  long long v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  a1[2] = a2[2];
  uint64_t v5 = *(int *)(a3 + 28);
  uint64_t v6 = (char *)a1 + v5;
  uint64_t v7 = (char *)a2 + v5;
  uint64_t v8 = sub_1000325D0();
  uint64_t v9 = *(void *)(v8 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8))
  {
    uint64_t v10 = sub_100005644(&qword_10003C3B0);
    memcpy(v6, v7, *(void *)(*(void *)(v10 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v6, v7, v8);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v9 + 56))(v6, 0, 1, v8);
  }
  return a1;
}

void *sub_10000827C(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = a2[5];
  a1[4] = a2[4];
  a1[5] = v8;
  swift_bridgeObjectRelease();
  uint64_t v9 = *(int *)(a3 + 28);
  uint64_t v10 = (char *)a1 + v9;
  uint64_t v11 = (char *)a2 + v9;
  uint64_t v12 = sub_1000325D0();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v13 + 48);
  int v15 = v14(v10, 1, v12);
  int v16 = v14(v11, 1, v12);
  if (!v15)
  {
    if (!v16)
    {
      (*(void (**)(char *, char *, uint64_t))(v13 + 40))(v10, v11, v12);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v13 + 8))(v10, v12);
    goto LABEL_6;
  }
  if (v16)
  {
LABEL_6:
    uint64_t v17 = sub_100005644(&qword_10003C3B0);
    memcpy(v10, v11, *(void *)(*(void *)(v17 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v10, v11, v12);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
  return a1;
}

uint64_t sub_100008424(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100008438);
}

uint64_t sub_10000843C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = sub_100005644(&qword_10003C3B0);
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 28);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_1000084F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100008504);
}

uint64_t sub_100008508(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_100005644(&qword_10003C3B0);
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 28);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

void sub_1000085B4()
{
}

void sub_1000085C0()
{
  sub_1000073F4();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

uint64_t sub_10000865C()
{
  return sub_1000086EC(&qword_10003C610, type metadata accessor for CKError);
}

uint64_t sub_1000086A4()
{
  return sub_1000086EC(&qword_10003C618, type metadata accessor for CKError);
}

uint64_t sub_1000086EC(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100008734()
{
  return sub_1000086EC(&qword_10003C620, type metadata accessor for CKError);
}

uint64_t sub_10000877C()
{
  return sub_1000086EC(&qword_10003C628, type metadata accessor for CKError);
}

uint64_t sub_1000087C4()
{
  return sub_1000086EC(&qword_10003C630, type metadata accessor for CKError);
}

uint64_t sub_10000880C()
{
  return sub_1000086EC(&qword_10003C638, type metadata accessor for Code);
}

void type metadata accessor for Code(uint64_t a1)
{
}

void sub_100008868(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_1000088B0()
{
  return sub_1000086EC(&qword_10003C640, type metadata accessor for Code);
}

unint64_t sub_1000088FC()
{
  unint64_t result = qword_10003C648;
  if (!qword_10003C648)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003C648);
  }
  return result;
}

uint64_t sub_100008950()
{
  return sub_1000086EC(&qword_10003C650, type metadata accessor for Code);
}

uint64_t sub_100008998()
{
  return sub_1000086EC(&qword_10003C658, type metadata accessor for CKError);
}

void *sub_1000089E0(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_100008A24()
{
  unint64_t result = qword_10003C668;
  if (!qword_10003C668)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003C668);
  }
  return result;
}

uint64_t sub_100008A78(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

unint64_t sub_100008AC8()
{
  unint64_t result = qword_10003C670;
  if (!qword_10003C670)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003C670);
  }
  return result;
}

unint64_t sub_100008B1C()
{
  unint64_t result = qword_10003C688;
  if (!qword_10003C688)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003C688);
  }
  return result;
}

unint64_t sub_100008B70()
{
  unint64_t result = qword_10003C6A0;
  if (!qword_10003C6A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003C6A0);
  }
  return result;
}

unint64_t sub_100008BC4()
{
  unint64_t result = qword_10003C6B8;
  if (!qword_10003C6B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003C6B8);
  }
  return result;
}

unsigned char *initializeBufferWithCopyOfBuffer for TaskPayloadRecord.CodingKeys(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

ValueMetadata *type metadata accessor for TaskPayloadRecord.CodingKeys()
{
  return &type metadata for TaskPayloadRecord.CodingKeys;
}

uint64_t _s28com_apple_mlhost_CloudWorker17TaskPayloadRecordV10CodingKeysOwet_0(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *_s28com_apple_mlhost_CloudWorker17TaskPayloadRecordV10CodingKeysOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 3;
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
        JUMPOUT(0x100008DA0);
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
          *unint64_t result = a2 + 3;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for TaskParametersRecord.CodingKeys()
{
  return &type metadata for TaskParametersRecord.CodingKeys;
}

uint64_t getEnumTagSinglePayload for TaskRecord.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFB) {
    goto LABEL_17;
  }
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
    if (v4) {
      return (*a1 | (v4 << 8)) - 5;
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
      return (*a1 | (v4 << 8)) - 5;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 5;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 6;
  int v8 = v6 - 6;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for TaskRecord.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x100008F34);
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

uint64_t sub_100008F5C(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_100008F64(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for TaskRecord.CodingKeys()
{
  return &type metadata for TaskRecord.CodingKeys;
}

unint64_t sub_100008F80()
{
  unint64_t result = qword_10003C6D0;
  if (!qword_10003C6D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003C6D0);
  }
  return result;
}

unint64_t sub_100008FD8()
{
  unint64_t result = qword_10003C6D8;
  if (!qword_10003C6D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003C6D8);
  }
  return result;
}

unint64_t sub_100009030()
{
  unint64_t result = qword_10003C6E0;
  if (!qword_10003C6E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003C6E0);
  }
  return result;
}

unint64_t sub_100009088()
{
  unint64_t result = qword_10003C6E8;
  if (!qword_10003C6E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003C6E8);
  }
  return result;
}

unint64_t sub_1000090E0()
{
  unint64_t result = qword_10003C6F0;
  if (!qword_10003C6F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003C6F0);
  }
  return result;
}

unint64_t sub_100009138()
{
  unint64_t result = qword_10003C6F8;
  if (!qword_10003C6F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003C6F8);
  }
  return result;
}

unint64_t sub_100009190()
{
  unint64_t result = qword_10003C700;
  if (!qword_10003C700)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003C700);
  }
  return result;
}

unint64_t sub_1000091E8()
{
  unint64_t result = qword_10003C708;
  if (!qword_10003C708)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003C708);
  }
  return result;
}

unint64_t sub_100009240()
{
  unint64_t result = qword_10003C710;
  if (!qword_10003C710)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003C710);
  }
  return result;
}

uint64_t sub_100009294(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x656D614E6B736174 && a2 == 0xE800000000000000;
  if (v3 || (sub_100032C70() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6F69736E65747865 && a2 == 0xEB0000000064496ELL || (sub_100032C70() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x666E6F436B736174 && a2 == 0xEE00617461446769 || (sub_100032C70() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x7461447472617473 && a2 == 0xE900000000000065 || (sub_100032C70() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x65746144646E65 && a2 == 0xE700000000000000 || (sub_100032C70() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x6E6F697461657263 && a2 == 0xEC00000065746144)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else
  {
    char v6 = sub_100032C70();
    swift_bridgeObjectRelease();
    if (v6) {
      return 5;
    }
    else {
      return 6;
    }
  }
}

uint64_t sub_100009530(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x656D614E6B736174 && a2 == 0xE800000000000000;
  if (v3 || (sub_100032C70() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6F69736E65747865 && a2 == 0xEB0000000064496ELL || (sub_100032C70() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6574656D61726170 && a2 == 0xEE00617461447372 || (sub_100032C70() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x6E6F697461657263 && a2 == 0xEC00000065746144)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    char v6 = sub_100032C70();
    swift_bridgeObjectRelease();
    if (v6) {
      return 3;
    }
    else {
      return 4;
    }
  }
}

uint64_t sub_10000970C(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x656D614E6B736174 && a2 == 0xE800000000000000;
  if (v3 || (sub_100032C70() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6F69736E65747865 && a2 == 0xEB0000000064496ELL || (sub_100032C70() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x617474416B736174 && a2 == 0xEE00746E656D6863 || (sub_100032C70() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x6E6F697461657263 && a2 == 0xEC00000065746144)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    char v6 = sub_100032C70();
    swift_bridgeObjectRelease();
    if (v6) {
      return 3;
    }
    else {
      return 4;
    }
  }
}

uint64_t sub_1000098F8()
{
  if (qword_10003C398 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_100032880();

  return sub_1000056A8(v0, (uint64_t)qword_10003C9C0);
}

uint64_t sub_10000995C()
{
  uint64_t v0 = sub_100032880();
  sub_100031864(v0, qword_10003C9C0);
  sub_1000056A8(v0, (uint64_t)qword_10003C9C0);
  return sub_100032870();
}

void sub_1000099DC()
{
  qword_10003C780 = 0x737465737361;
  *(void *)algn_10003C788 = 0xE600000000000000;
}

void sub_1000099FC()
{
  qword_10003C790 = 0x6574656D61726170;
  *(void *)algn_10003C798 = 0xEF6E6F736A2E7372;
}

com_apple_mlhost_CloudWorker::CloudError_optional __swiftcall CloudError.init(rawValue:)(Swift::String rawValue)
{
  object = rawValue._object;
  v6._countAndFlagsBits = rawValue._countAndFlagsBits;
  v2._rawValue = &off_100038CF8;
  v6._object = object;
  Swift::Int v3 = sub_100032BE0(v2, v6);
  swift_bridgeObjectRelease();
  if (v3 == 1) {
    v4.value = com_apple_mlhost_CloudWorker_CloudError_queryError;
  }
  else {
    v4.value = com_apple_mlhost_CloudWorker_CloudError_unknownDefault;
  }
  if (v3) {
    return v4;
  }
  else {
    return 0;
  }
}

uint64_t CloudError.rawValue.getter(char a1)
{
  if (a1) {
    return 0x7272457972657571;
  }
  else {
    return 0x656C6C65636E6163;
  }
}

uint64_t sub_100009AC0(char *a1, char *a2)
{
  return sub_100009ACC(*a1, *a2);
}

uint64_t sub_100009ACC(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    uint64_t v3 = 0x7272457972657571;
  }
  else {
    uint64_t v3 = 0x656C6C65636E6163;
  }
  if (v2) {
    unint64_t v4 = 0xE900000000000064;
  }
  else {
    unint64_t v4 = 0xEA0000000000726FLL;
  }
  if (a2) {
    uint64_t v5 = 0x7272457972657571;
  }
  else {
    uint64_t v5 = 0x656C6C65636E6163;
  }
  if (a2) {
    unint64_t v6 = 0xEA0000000000726FLL;
  }
  else {
    unint64_t v6 = 0xE900000000000064;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = sub_100032C70();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

Swift::Int sub_100009B78()
{
  return sub_100009B80();
}

Swift::Int sub_100009B80()
{
  return sub_100032D20();
}

uint64_t sub_100009C0C()
{
  return sub_100009C14();
}

uint64_t sub_100009C14()
{
  sub_100032940();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_100009C88()
{
  return sub_100009C90();
}

Swift::Int sub_100009C90()
{
  return sub_100032D20();
}

uint64_t sub_100009D18@<X0>(uint64_t *a1@<X0>, char *a2@<X8>)
{
  v8._countAndFlagsBits = *a1;
  uint64_t v3 = (void *)a1[1];
  v4._rawValue = &off_100038CF8;
  v8._object = v3;
  Swift::Int v5 = sub_100032BE0(v4, v8);
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

uint64_t sub_100009D78@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = CloudError.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_100009DB0(uint64_t a1, uint64_t a2)
{
  v2[52] = a1;
  v2[53] = a2;
  sub_100005644(&qword_10003C7F0);
  v2[54] = swift_task_alloc();
  v2[55] = swift_task_alloc();
  sub_100005644(&qword_10003C7F8);
  v2[56] = swift_task_alloc();
  uint64_t v3 = type metadata accessor for TaskPayloadRecord(0);
  v2[57] = v3;
  uint64_t v4 = *(void *)(v3 - 8);
  v2[58] = v4;
  v2[59] = *(void *)(v4 + 64);
  v2[60] = swift_task_alloc();
  v2[61] = swift_task_alloc();
  v2[62] = swift_task_alloc();
  sub_100005644(&qword_10003C800);
  v2[63] = swift_task_alloc();
  uint64_t v5 = type metadata accessor for TaskParametersRecord(0);
  v2[64] = v5;
  uint64_t v6 = *(void *)(v5 - 8);
  v2[65] = v6;
  v2[66] = *(void *)(v6 + 64);
  v2[67] = swift_task_alloc();
  v2[68] = swift_task_alloc();
  v2[69] = swift_task_alloc();
  uint64_t v7 = sub_1000324E0();
  v2[70] = v7;
  v2[71] = *(void *)(v7 - 8);
  v2[72] = swift_task_alloc();
  sub_100005644(&qword_10003C428);
  v2[73] = swift_task_alloc();
  uint64_t v8 = sub_100032540();
  v2[74] = v8;
  uint64_t v9 = *(void *)(v8 - 8);
  v2[75] = v9;
  v2[76] = *(void *)(v9 + 64);
  v2[77] = swift_task_alloc();
  v2[78] = swift_task_alloc();
  v2[79] = swift_task_alloc();
  v2[80] = swift_task_alloc();
  v2[81] = swift_task_alloc();
  v2[82] = swift_task_alloc();
  uint64_t v10 = sub_100032700();
  v2[83] = v10;
  uint64_t v11 = *(void *)(v10 - 8);
  v2[84] = v11;
  v2[85] = *(void *)(v11 + 64);
  v2[86] = swift_task_alloc();
  v2[87] = swift_task_alloc();
  v2[88] = swift_task_alloc();
  v2[89] = swift_task_alloc();
  sub_100005644(&qword_10003C3B0);
  v2[90] = swift_task_alloc();
  sub_100005644(&qword_10003C808);
  v2[91] = swift_task_alloc();
  v2[92] = swift_task_alloc();
  uint64_t v12 = sub_1000327C0();
  v2[93] = v12;
  uint64_t v13 = *(void *)(v12 - 8);
  v2[94] = v13;
  v2[95] = *(void *)(v13 + 64);
  v2[96] = swift_task_alloc();
  v2[97] = swift_task_alloc();
  v2[98] = swift_task_alloc();
  sub_100005644(&qword_10003C810);
  v2[99] = swift_task_alloc();
  uint64_t v14 = type metadata accessor for TaskRecord(0);
  v2[100] = v14;
  uint64_t v15 = *(void *)(v14 - 8);
  v2[101] = v15;
  v2[102] = *(void *)(v15 + 64);
  v2[103] = swift_task_alloc();
  v2[104] = swift_task_alloc();
  v2[105] = swift_task_alloc();
  uint64_t v16 = sub_100032600();
  v2[106] = v16;
  v2[107] = *(void *)(v16 - 8);
  v2[108] = swift_task_alloc();
  uint64_t v17 = sub_1000325D0();
  v2[109] = v17;
  uint64_t v18 = *(void *)(v17 - 8);
  v2[110] = v18;
  v2[111] = *(void *)(v18 + 64);
  v2[112] = swift_task_alloc();
  v2[113] = swift_task_alloc();
  v2[114] = swift_task_alloc();
  v2[115] = swift_task_alloc();
  sub_100005644(&qword_10003C818);
  v2[116] = swift_task_alloc();
  uint64_t v19 = sub_100032750();
  v2[117] = v19;
  v2[118] = *(void *)(v19 - 8);
  v2[119] = swift_task_alloc();
  uint64_t v20 = sub_100032880();
  v2[120] = v20;
  v2[121] = *(void *)(v20 - 8);
  v2[122] = swift_task_alloc();
  v2[123] = swift_task_alloc();
  v2[124] = swift_task_alloc();
  v2[125] = swift_task_alloc();
  v2[126] = swift_task_alloc();
  v2[127] = swift_task_alloc();
  v2[128] = swift_task_alloc();
  v2[129] = swift_task_alloc();
  v2[130] = swift_task_alloc();
  v2[131] = swift_task_alloc();
  v2[132] = swift_task_alloc();
  v2[133] = swift_task_alloc();
  v2[134] = swift_task_alloc();
  v2[135] = swift_task_alloc();
  v2[136] = swift_task_alloc();
  v2[137] = swift_task_alloc();
  v2[138] = swift_task_alloc();
  v2[139] = swift_task_alloc();
  v2[140] = swift_task_alloc();
  v2[141] = swift_task_alloc();
  v2[142] = swift_task_alloc();
  v2[143] = swift_task_alloc();
  v2[144] = swift_task_alloc();
  v2[145] = swift_task_alloc();
  v2[146] = swift_task_alloc();
  v2[147] = swift_task_alloc();
  v2[148] = swift_task_alloc();
  v2[149] = swift_task_alloc();
  v2[150] = swift_task_alloc();
  v2[151] = swift_task_alloc();
  v2[152] = swift_task_alloc();
  v2[153] = swift_task_alloc();
  v2[154] = swift_task_alloc();
  v2[155] = swift_task_alloc();
  v2[156] = swift_task_alloc();
  v2[157] = swift_task_alloc();
  v2[158] = swift_task_alloc();
  v2[159] = swift_task_alloc();
  v2[160] = swift_task_alloc();
  v2[161] = swift_task_alloc();
  v2[162] = swift_task_alloc();
  v2[163] = swift_task_alloc();
  v2[164] = swift_task_alloc();
  v2[165] = swift_task_alloc();
  v2[166] = swift_task_alloc();
  v2[167] = swift_task_alloc();
  v2[168] = swift_task_alloc();
  v2[169] = swift_task_alloc();
  v2[170] = swift_task_alloc();
  v2[171] = swift_task_alloc();
  v2[172] = swift_task_alloc();
  v2[173] = swift_task_alloc();
  v2[174] = swift_task_alloc();
  v2[175] = swift_task_alloc();
  v2[176] = swift_task_alloc();
  v2[177] = swift_task_alloc();
  v2[178] = swift_task_alloc();
  return _swift_task_switch(sub_10000A7B0, 0, 0);
}

uint64_t sub_10000A7B0()
{
  uint64_t v31 = v0;
  uint64_t v1 = v0[178];
  uint64_t v2 = v0[121];
  uint64_t v3 = v0[120];
  uint64_t v4 = (void *)v0[52];
  uint64_t v5 = sub_1000098F8();
  v0[179] = v5;
  uint64_t v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16);
  v0[180] = v6;
  v0[181] = (v2 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  v6(v1, v5, v3);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v4;
  id v8 = v4;
  uint64_t v9 = sub_100032860();
  LOBYTE(v4) = sub_100032A80();
  uint64_t v10 = swift_allocObject();
  *(unsigned char *)(v10 + 16) = 64;
  uint64_t v11 = swift_allocObject();
  *(unsigned char *)(v11 + 16) = 8;
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = sub_100031D88;
  *(void *)(v12 + 24) = v7;
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = sub_100031B4C;
  *(void *)(v13 + 24) = v12;
  v0[182] = sub_100005644(&qword_10003C820);
  uint64_t v14 = swift_allocObject();
  *(_OWORD *)(v14 + 16) = xmmword_100033B60;
  *(void *)(v14 + 32) = sub_10002C2FC;
  *(void *)(v14 + 40) = v10;
  *(void *)(v14 + 48) = sub_100031D8C;
  *(void *)(v14 + 56) = v11;
  *(void *)(v14 + 64) = sub_10002C3D8;
  *(void *)(v14 + 72) = v13;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRelease();
  os_log_type_t v15 = v4;
  if (os_log_type_enabled(v9, (os_log_type_t)v4))
  {
    uint64_t v16 = (uint8_t *)swift_slowAlloc();
    uint64_t v29 = (void *)swift_slowAlloc();
    uint64_t v30 = 0;
    *(_WORD *)uint64_t v16 = 258;
    v16[2] = *(unsigned char *)(v10 + 16);
    swift_release();
    v16[3] = *(unsigned char *)(v11 + 16);
    char v28 = v16 + 4;
    swift_release();
    sub_10002C320((uint64_t *)&v28, &v29, (uint64_t)&v30, *(uint64_t (**)(void))(v13 + 16));
    uint64_t v17 = v0[178];
    uint64_t v18 = v0[121];
    uint64_t v19 = v0[120];
    swift_release();
    _os_log_impl((void *)&_mh_execute_header, v9, v15, "Context: %@", v16, 0xCu);
    sub_100005644(&qword_10003C8A0);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    uint64_t v20 = *(void (**)(uint64_t, uint64_t))(v18 + 8);
    v20(v17, v19);
  }
  else
  {
    uint64_t v21 = v0[178];
    uint64_t v22 = v0[121];
    uint64_t v23 = v0[120];
    swift_release();
    swift_release();
    swift_release();

    uint64_t v20 = *(void (**)(uint64_t, uint64_t))(v22 + 8);
    v20(v21, v23);
  }
  v0[183] = v20;
  uint64_t v24 = async function pointer to dispatch thunk of MLHostClient.getConfig();
  id v25 = (void *)swift_task_alloc();
  v0[184] = v25;
  *id v25 = v0;
  v25[1] = sub_10000AB88;
  uint64_t v26 = v0[116];
  return ((uint64_t (*)(uint64_t))((char *)&async function pointer to dispatch thunk of MLHostClient.getConfig()
                                          + v24))(v26);
}

uint64_t sub_10000AB88()
{
  *(void *)(*(void *)v1 + 1480) = v0;
  swift_task_dealloc();
  if (v0)
  {
    swift_errorRelease();
    uint64_t v2 = sub_1000238A8;
  }
  else
  {
    uint64_t v2 = sub_10000ACD0;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_10000ACD0()
{
  uint64_t v139 = v0;
  uint64_t v1 = *(void *)(v0 + 952);
  uint64_t v2 = *(void *)(v0 + 944);
  uint64_t v3 = *(void *)(v0 + 936);
  uint64_t v4 = *(void *)(v0 + 928);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v2 + 56))(v4, 0, 1, v3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 32))(v1, v4, v3);
  if (sub_100032740() == 0x6D706F6C65766564 && v5 == 0xEB00000000746E65)
  {
    swift_bridgeObjectRelease();
    char v7 = 1;
  }
  else
  {
    char v7 = sub_100032C70();
    swift_bridgeObjectRelease();
  }
  (*(void (**)(void, void, void))(v0 + 1440))(*(void *)(v0 + 1416), *(void *)(v0 + 1432), *(void *)(v0 + 960));
  uint64_t v8 = swift_allocObject();
  *(unsigned char *)(v8 + 16) = v7 & 1;
  uint64_t v9 = sub_100032860();
  os_log_type_t v10 = sub_100032A80();
  uint64_t v11 = swift_allocObject();
  *(unsigned char *)(v11 + 16) = 0;
  uint64_t v12 = swift_allocObject();
  *(unsigned char *)(v12 + 16) = 4;
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = sub_10002C3F0;
  *(void *)(v13 + 24) = v8;
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = sub_10002C418;
  *(void *)(v14 + 24) = v13;
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = sub_10002C444;
  *(void *)(v15 + 24) = v14;
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = sub_10002C46C;
  *(void *)(v16 + 24) = v15;
  uint64_t v17 = swift_allocObject();
  *(_OWORD *)(v17 + 16) = xmmword_100033B60;
  *(void *)(v17 + 32) = sub_100031D8C;
  *(void *)(v17 + 40) = v11;
  *(void *)(v17 + 48) = sub_100031D8C;
  *(void *)(v17 + 56) = v12;
  *(void *)(v17 + 64) = sub_10002C49C;
  *(void *)(v17 + 72) = v16;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRelease();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v18 = (uint64_t *)(v0 + 1480);
    uint64_t v19 = *(void *)(v0 + 1480);
    uint64_t v20 = swift_slowAlloc();
    *(_WORD *)uint64_t v20 = 256;
    *(unsigned char *)(v20 + 2) = *(unsigned char *)(v11 + 16);
    if (v19) {
      goto LABEL_33;
    }
    uint64_t v21 = (uint8_t *)v20;
    uint64_t v22 = *v18;
    swift_release();
    v21[3] = *(unsigned char *)(v12 + 16);
    if (v22) {
      goto LABEL_33;
    }
    char v133 = v7;
    uint64_t v23 = *v18;
    uint64_t v24 = swift_release();
    (*(void (**)(uint64_t *__return_ptr, uint64_t))(v16 + 16))(v138, v24);
    sub_100032AF0();
    if (v23) {
      goto LABEL_33;
    }
    id v25 = *(void (**)(uint64_t, uint64_t))(v0 + 1464);
    uint64_t v26 = *(void *)(v0 + 1416);
    uint64_t v27 = *(void *)(v0 + 960);
    swift_release();
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "useSandboxEnvironment: %{BOOL}d", v21, 8u);
    swift_slowDealloc();

    uint64_t v28 = v26;
    uint64_t v29 = v27;
  }
  else
  {
    char v133 = v7;
    id v25 = *(void (**)(uint64_t, uint64_t))(v0 + 1464);
    uint64_t v30 = *(void *)(v0 + 1416);
    uint64_t v31 = *(void *)(v0 + 960);
    swift_release();
    swift_release();
    swift_release();

    uint64_t v28 = v30;
    uint64_t v29 = v31;
  }
  v25(v28, v29);
  unint64_t v32 = 0xD00000000000001ALL;
  char v33 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 1440);
  uint64_t v34 = *(void *)(v0 + 1432);
  uint64_t v35 = *(void *)(v0 + 1408);
  uint64_t v36 = *(void *)(v0 + 960);
  uint64_t v37 = sub_100032730();
  if (v38)
  {
    unint64_t v32 = v37;
    unint64_t v39 = v38;
  }
  else
  {
    unint64_t v39 = 0x8000000100033FF0;
  }
  v33(v35, v34, v36);
  uint64_t v40 = swift_allocObject();
  uint64_t v131 = v32;
  uint64_t v132 = v39;
  *(void *)(v40 + 16) = v32;
  *(void *)(v40 + 24) = v39;
  swift_bridgeObjectRetain();
  id v41 = sub_100032860();
  os_log_type_t v42 = sub_100032A80();
  uint64_t v43 = swift_allocObject();
  *(unsigned char *)(v43 + 16) = 32;
  uint64_t v44 = swift_allocObject();
  *(unsigned char *)(v44 + 16) = 8;
  uint64_t v45 = swift_allocObject();
  *(void *)(v45 + 16) = sub_10002C534;
  *(void *)(v45 + 24) = v40;
  uint64_t v46 = swift_allocObject();
  *(void *)(v46 + 16) = sub_10002C584;
  *(void *)(v46 + 24) = v45;
  uint64_t v47 = swift_allocObject();
  *(_OWORD *)(v47 + 16) = xmmword_100033B60;
  *(void *)(v47 + 32) = sub_100031D8C;
  *(void *)(v47 + 40) = v43;
  *(void *)(v47 + 48) = sub_100031D8C;
  *(void *)(v47 + 56) = v44;
  *(void *)(v47 + 64) = sub_10002C5AC;
  *(void *)(v47 + 72) = v46;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRelease();
  if (!os_log_type_enabled(v41, v42))
  {
    uint64_t v53 = *(void (**)(uint64_t, uint64_t))(v0 + 1464);
    uint64_t v58 = *(void *)(v0 + 1408);
    uint64_t v59 = *(void *)(v0 + 960);
    swift_release();
    swift_release();
    swift_release();

    uint64_t v56 = v58;
    uint64_t v57 = v59;
    goto LABEL_22;
  }
  uint64_t v48 = (uint64_t *)(v0 + 1480);
  uint64_t v49 = *(void *)(v0 + 1480);
  id v50 = (uint8_t *)swift_slowAlloc();
  uint64_t v137 = 0;
  v138[0] = swift_slowAlloc();
  *(_WORD *)id v50 = 258;
  v50[2] = *(unsigned char *)(v43 + 16);
  if (v49
    || (uint64_t v51 = *v48, swift_release(), v50[3] = *(unsigned char *)(v44 + 16), v136[0] = (uint64_t)(v50 + 4), v51)
    || (uint64_t v52 = *v48, swift_release(), sub_10002C274(v136, (uint64_t)&v137, v138, *(uint64_t (**)(void))(v46 + 16)), v52))
  {
LABEL_33:
    return swift_errorRelease();
  }
  uint64_t v53 = *(void (**)(uint64_t, uint64_t))(v0 + 1464);
  uint64_t v54 = *(void *)(v0 + 1408);
  uint64_t v55 = *(void *)(v0 + 960);
  swift_release();
  _os_log_impl((void *)&_mh_execute_header, v41, v42, "containerName: %s", v50, 0xCu);
  swift_arrayDestroy();
  swift_slowDealloc();
  swift_slowDealloc();

  uint64_t v56 = v54;
  uint64_t v57 = v55;
LABEL_22:
  v53(v56, v57);
  uint64_t v60 = *(void *)(v0 + 920);
  uint64_t v61 = *(void *)(v0 + 880);
  uint64_t v62 = *(void *)(v0 + 872);
  sub_100032570();
  sub_100032560();
  double v64 = v63;
  uint64_t v65 = *(void (**)(uint64_t, uint64_t))(v61 + 8);
  *(void *)(v0 + 1488) = v65;
  *(void *)(v0 + 1496) = (v61 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v65(v60, v62);
  if ((v133 & 1) == 0)
  {
    sub_100031AE8(0, &qword_10003C828);
    id v66 = sub_100027BB0(0xD000000000000010, 0x8000000100034010);
    if (v66)
    {
      unint64_t v67 = v66;
      NSString v68 = sub_100032920();
      [v67 doubleForKey:v68];
      double v64 = v69;
    }
  }
  uint64_t v70 = *(void *)(v0 + 920);
  uint64_t v71 = *(void *)(v0 + 872);
  sub_1000325A0();
  sub_100032560();
  double v73 = v72;
  v65(v70, v71);
  if (v73 - v64 < 604800.0)
  {
    uint64_t v74 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 1440);
    uint64_t v75 = *(void *)(v0 + 1432);
    uint64_t v76 = *(void *)(v0 + 1400);
    uint64_t v77 = *(void *)(v0 + 960);
    swift_bridgeObjectRelease();
    v74(v76, v75, v77);
    uint64_t v78 = swift_allocObject();
    *(double *)(v78 + 16) = v64;
    os_log_type_t v79 = sub_100032860();
    os_log_type_t v80 = sub_100032A80();
    uint64_t v81 = swift_allocObject();
    *(unsigned char *)(v81 + 16) = 0;
    uint64_t v82 = swift_allocObject();
    *(unsigned char *)(v82 + 16) = 8;
    uint64_t v83 = swift_allocObject();
    *(void *)(v83 + 16) = sub_1000317C4;
    *(void *)(v83 + 24) = v78;
    uint64_t v84 = swift_allocObject();
    *(void *)(v84 + 16) = sub_100031B48;
    *(void *)(v84 + 24) = v83;
    uint64_t v85 = swift_allocObject();
    *(unsigned char *)(v85 + 16) = 0;
    uint64_t v86 = swift_allocObject();
    *(unsigned char *)(v86 + 16) = 8;
    uint64_t v87 = swift_allocObject();
    *(_OWORD *)(v87 + 16) = xmmword_100033B70;
    *(void *)(v87 + 32) = sub_100031D8C;
    *(void *)(v87 + 40) = v81;
    *(void *)(v87 + 48) = sub_100031D8C;
    *(void *)(v87 + 56) = v82;
    *(void *)(v87 + 64) = sub_100030C88;
    *(void *)(v87 + 72) = v84;
    *(void *)(v87 + 80) = sub_100031D8C;
    *(void *)(v87 + 88) = v85;
    *(void *)(v87 + 96) = sub_100031D8C;
    *(void *)(v87 + 104) = v86;
    *(void *)(v87 + 112) = sub_10002C5EC;
    *(void *)(v87 + 120) = 0;
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_bridgeObjectRelease();
    if (os_log_type_enabled(v79, v80))
    {
      os_log_type_t v134 = v80;
      uint64_t v88 = (uint64_t *)(v0 + 1480);
      uint64_t v89 = *(void *)(v0 + 1480);
      uint64_t v90 = swift_slowAlloc();
      *(_WORD *)uint64_t v90 = 512;
      *(unsigned char *)(v90 + 2) = *(unsigned char *)(v81 + 16);
      if (v89) {
        goto LABEL_33;
      }
      uint64_t v91 = v90;
      uint64_t v92 = *v88;
      swift_release();
      *(unsigned char *)(v91 + 3) = *(unsigned char *)(v82 + 16);
      if (v92) {
        goto LABEL_33;
      }
      uint64_t v93 = *v88;
      uint64_t v94 = swift_release();
      v138[0] = (*(double (**)(uint64_t))(v84 + 16))(v94);
      sub_100032AF0();
      if (v93) {
        goto LABEL_33;
      }
      uint64_t v95 = *v88;
      swift_release();
      *(unsigned char *)(v91 + 12) = *(unsigned char *)(v85 + 16);
      if (v95) {
        goto LABEL_33;
      }
      uint64_t v96 = *v88;
      swift_release();
      *(unsigned char *)(v91 + 13) = *(unsigned char *)(v86 + 16);
      if (v96) {
        goto LABEL_33;
      }
      uint64_t v97 = *v88;
      swift_release();
      *(void *)(v91 + 14) = 0x4122750000000000;
      if (v97) {
        goto LABEL_33;
      }
      v127 = *(void (**)(uint64_t, uint64_t))(v0 + 1464);
      uint64_t v128 = *(void *)(v0 + 1400);
      uint64_t v129 = *(void *)(v0 + 960);
      _os_log_impl((void *)&_mh_execute_header, v79, v134, "Last CloudSync was %f. Skipping execution due to minInterval: %f.", (uint8_t *)v91, 0x16u);
      swift_slowDealloc();

      v127(v128, v129);
    }
    else
    {
      v135 = *(void (**)(uint64_t, uint64_t))(v0 + 1464);
      uint64_t v109 = *(void *)(v0 + 1400);
      uint64_t v110 = *(void *)(v0 + 960);
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();

      v135(v109, v110);
    }
    goto LABEL_47;
  }
  if (sub_100032A00())
  {
    v99 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 1440);
    uint64_t v100 = *(void *)(v0 + 1432);
    uint64_t v101 = *(void *)(v0 + 1392);
    uint64_t v102 = *(void *)(v0 + 960);
    swift_bridgeObjectRelease();
    v99(v101, v100, v102);
    unint64_t v103 = sub_100032860();
    os_log_type_t v104 = sub_100032A80();
    if (os_log_type_enabled(v103, v104))
    {
      unint64_t v105 = *(void (**)(uint64_t, uint64_t))(v0 + 1464);
      uint64_t v106 = *(void *)(v0 + 1392);
      uint64_t v107 = *(void *)(v0 + 960);
      v108 = (uint8_t *)swift_slowAlloc();
      uint64_t v137 = 0;
      v138[0] = 0;
      *(_WORD *)v108 = 0;
      v136[0] = (uint64_t)(v108 + 2);
      sub_10002BCC0((uint64_t)_swiftEmptyArrayStorage, (uint64_t)v136, (uint64_t)&v137, (uint64_t)v138);
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v103, v104, "Task cancelled.", v108, 2u);
      swift_slowDealloc();

      v105(v106, v107);
    }
    else
    {
      v119 = *(void (**)(uint64_t, uint64_t))(v0 + 1464);
      uint64_t v120 = *(void *)(v0 + 1392);
      uint64_t v121 = *(void *)(v0 + 960);
      swift_bridgeObjectRelease();

      v119(v120, v121);
    }
LABEL_47:
    uint64_t v122 = *(void *)(v0 + 952);
    uint64_t v123 = *(void *)(v0 + 944);
    uint64_t v124 = *(void *)(v0 + 936);
    id v125 = objc_allocWithZone((Class)sub_100032780());
    uint64_t v130 = sub_100032770();
    (*(void (**)(uint64_t, uint64_t))(v123 + 8))(v122, v124);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    v126 = *(uint64_t (**)(uint64_t))(v0 + 8);
    return v126(v130);
  }
  uint64_t v111 = swift_allocObject();
  *(void *)(v0 + 1504) = v111;
  *(_OWORD *)(v111 + 16) = 0u;
  *(_OWORD *)(v111 + 32) = 0u;
  *(_OWORD *)(v111 + 48) = 0u;
  *(_OWORD *)(v111 + 64) = 0u;
  *(_OWORD *)(v111 + 80) = 0u;
  *(_OWORD *)(v111 + 96) = 0u;
  *(void *)(v111 + 112) = _swiftEmptyArrayStorage;
  sub_100032450();
  swift_allocObject();
  *(void *)(v0 + 1512) = sub_100032440();
  if (v133) {
    uint64_t v112 = 2;
  }
  else {
    uint64_t v112 = 1;
  }
  sub_100031AE8(0, &qword_10003C830);
  id v113 = sub_100027FF8(v131, v132, v112);
  *(void *)(v0 + 1520) = v113;
  id v114 = [objc_allocWithZone((Class)CKContainer) initWithContainerID:v113];
  *(void *)(v0 + 1528) = v114;
  *(void *)(v0 + 1536) = [v114 publicCloudDatabase];
  id v115 = [self defaultRecordZone];
  *(void *)(v0 + 1544) = [v115 zoneID];

  *(void *)(v0 + 1552) = sub_100028074();
  id v116 = [objc_allocWithZone((Class)CKOperationConfiguration) init];
  *(void *)(v0 + 1560) = v116;
  [v116 setPreferAnonymousRequests:1];
  uint64_t v117 = async function pointer to dispatch thunk of MLHostClient.getExtensions();
  v118 = (void *)swift_task_alloc();
  *(void *)(v0 + 1568) = v118;
  void *v118 = v0;
  v118[1] = sub_10000C210;
  return ((uint64_t (*)(void))((char *)&async function pointer to dispatch thunk of MLHostClient.getExtensions() + v117))();
}

uint64_t sub_10000C210(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 1576) = v1;
  swift_task_dealloc();
  if (v1)
  {
    swift_errorRelease();
    uint64_t v5 = sub_10002313C;
  }
  else
  {
    *(void *)(v4 + 1584) = a1;
    uint64_t v5 = sub_10000C368;
  }
  return _swift_task_switch(v5, 0, 0);
}

uint64_t sub_10000C368()
{
  uint64_t v81 = v0;
  uint64_t v1 = v0[197];
  uint64_t v2 = (void (*)(uint64_t, uint64_t, uint64_t))v0[180];
  uint64_t v3 = v0[179];
  uint64_t v4 = v0[173];
  uint64_t v5 = v0[120];
  uint64_t v6 = sub_1000280E4(v0[198]);
  uint64_t v76 = v1;
  swift_bridgeObjectRelease();
  uint64_t v7 = sub_10002F8E4((uint64_t)v6);
  v0[199] = v7;
  swift_bridgeObjectRelease();
  v2(v4, v3, v5);
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v7;
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = sub_10002F97C;
  *(void *)(v9 + 24) = v8;
  swift_bridgeObjectRetain();
  os_log_type_t v10 = sub_100032860();
  os_log_type_t v11 = sub_100032A80();
  uint64_t v12 = swift_allocObject();
  *(unsigned char *)(v12 + 16) = 32;
  uint64_t v13 = swift_allocObject();
  *(unsigned char *)(v13 + 16) = 8;
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = sub_10002F988;
  *(void *)(v14 + 24) = v9;
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = sub_100031B40;
  *(void *)(v15 + 24) = v14;
  uint64_t v16 = swift_allocObject();
  *(_OWORD *)(v16 + 16) = xmmword_100033B60;
  *(void *)(v16 + 32) = sub_100031D8C;
  *(void *)(v16 + 40) = v12;
  *(void *)(v16 + 48) = sub_100031D8C;
  *(void *)(v16 + 56) = v13;
  *(void *)(v16 + 64) = sub_100031B50;
  *(void *)(v16 + 72) = v15;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRelease();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v17 = (uint8_t *)swift_slowAlloc();
    uint64_t v79 = 0;
    v80[0] = swift_slowAlloc();
    *(_WORD *)uint64_t v17 = 258;
    v17[2] = *(unsigned char *)(v12 + 16);
    if (v76)
    {
LABEL_7:
      return swift_errorRelease();
    }
    swift_release();
    v17[3] = *(unsigned char *)(v13 + 16);
    v78[0] = (uint64_t)(v17 + 4);
    swift_release();
    sub_10002C274(v78, (uint64_t)&v79, v80, *(uint64_t (**)(void))(v15 + 16));
    uint64_t v18 = v0[173];
    uint64_t v19 = v0[121];
    uint64_t v20 = v0[120];
    swift_release();
    _os_log_impl((void *)&_mh_execute_header, v10, v11, "Available extensions: %s", v17, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    uint64_t v21 = *(void (**)(uint64_t, uint64_t))(v19 + 8);
    v21(v18, v20);
  }
  else
  {
    uint64_t v22 = v0[173];
    uint64_t v23 = v0[121];
    uint64_t v24 = v0[120];
    swift_release();
    swift_release();
    swift_release();

    uint64_t v21 = *(void (**)(uint64_t, uint64_t))(v23 + 8);
    v21(v22, v24);
  }
  v0[200] = v21;
  id v25 = (void (*)(uint64_t, uint64_t))v0[186];
  uint64_t v75 = v21;
  uint64_t v74 = (void (*)(uint64_t, uint64_t, uint64_t))v0[180];
  uint64_t v72 = v0[120];
  uint64_t v73 = v0[179];
  uint64_t v26 = v0[115];
  uint64_t v70 = v0[114];
  uint64_t v71 = v0[172];
  uint64_t v27 = v0[113];
  uint64_t v28 = v0[110];
  uint64_t v29 = v0[109];
  uint64_t v30 = v0[108];
  uint64_t v31 = v0[107];
  uint64_t v32 = v0[106];
  sub_1000325F0();
  sub_1000325A0();
  sub_1000325E0();
  uint64_t v33 = v27;
  uint64_t v34 = v29;
  v25(v33, v29);
  (*(void (**)(uint64_t, uint64_t))(v31 + 8))(v30, v32);
  sub_1000325B0();
  uint64_t v35 = v26;
  uint64_t v36 = v26;
  uint64_t v37 = v34;
  v25(v35, v34);
  v0[201] = sub_100005644(&qword_10003C838);
  uint64_t v38 = swift_allocObject();
  *(_OWORD *)(v38 + 16) = xmmword_100033B80;
  v0[202] = sub_100031AE8(0, &qword_10003C840);
  *(void *)(v38 + 56) = &type metadata for String;
  unint64_t v39 = sub_10002F9AC();
  v0[203] = v39;
  *(void *)(v38 + 64) = v39;
  *(void *)(v38 + 32) = 0x65746144646E65;
  *(void *)(v38 + 40) = 0xE700000000000000;
  Class isa = sub_100032580().super.isa;
  *(void *)(v38 + 96) = sub_100031AE8(0, &qword_10003C850);
  *(void *)(v38 + 104) = sub_10002FA00();
  *(void *)(v38 + 72) = isa;
  id v41 = (void *)sub_100032A70();
  v0[204] = v41;
  v74(v71, v73, v72);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v28 + 16))(v36, v70, v37);
  unint64_t v42 = (*(unsigned __int8 *)(v28 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v28 + 80);
  uint64_t v43 = swift_allocObject();
  uint64_t v44 = *(void (**)(unint64_t, uint64_t, uint64_t))(v28 + 32);
  v0[205] = v44;
  v0[206] = (v28 + 32) & 0xFFFFFFFFFFFFLL | 0x48D8000000000000;
  v44(v43 + v42, v36, v37);
  uint64_t v45 = swift_allocObject();
  *(void *)(v45 + 16) = sub_10002FA80;
  *(void *)(v45 + 24) = v43;
  uint64_t v46 = sub_100032860();
  os_log_type_t v47 = sub_100032A80();
  uint64_t v48 = swift_allocObject();
  *(unsigned char *)(v48 + 16) = 32;
  uint64_t v49 = swift_allocObject();
  *(unsigned char *)(v49 + 16) = 8;
  uint64_t v50 = swift_allocObject();
  *(void *)(v50 + 16) = sub_10002FA98;
  *(void *)(v50 + 24) = v45;
  uint64_t v51 = swift_allocObject();
  *(void *)(v51 + 16) = sub_100031B40;
  *(void *)(v51 + 24) = v50;
  uint64_t v52 = swift_allocObject();
  *(_OWORD *)(v52 + 16) = xmmword_100033B60;
  *(void *)(v52 + 32) = sub_100031D8C;
  *(void *)(v52 + 40) = v48;
  *(void *)(v52 + 48) = sub_100031D8C;
  *(void *)(v52 + 56) = v49;
  *(void *)(v52 + 64) = sub_100031B50;
  *(void *)(v52 + 72) = v51;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRelease();
  if (os_log_type_enabled(v46, v47))
  {
    uint64_t v53 = (uint8_t *)swift_slowAlloc();
    uint64_t v54 = swift_slowAlloc();
    uint64_t v79 = 0;
    v80[0] = v54;
    *(_WORD *)uint64_t v53 = 258;
    v53[2] = *(unsigned char *)(v48 + 16);
    if (v76) {
      goto LABEL_7;
    }
    swift_release();
    v53[3] = *(unsigned char *)(v49 + 16);
    v78[0] = (uint64_t)(v53 + 4);
    swift_release();
    sub_10002C274(v78, (uint64_t)&v79, v80, *(uint64_t (**)(void))(v51 + 16));
    uint64_t v77 = v0[172];
    uint64_t v58 = v0[120];
    swift_release();
    _os_log_impl((void *)&_mh_execute_header, v46, v47, "Querying Tasks with endDate after cutoff: %s", v53, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    v75(v77, v58);
  }
  else
  {
    uint64_t v56 = v0[172];
    uint64_t v57 = v0[120];
    swift_release();
    swift_release();
    swift_release();

    v75(v56, v57);
  }
  uint64_t v59 = (void *)v0[195];
  uint64_t v60 = (void *)v0[194];
  uint64_t v61 = v0[193];
  v0[207] = sub_100031AE8(0, &qword_10003C860);
  uint64_t v62 = v41;
  v83._countAndFlagsBits = 0x736B736154;
  v83._object = (void *)0xE500000000000000;
  Class v63 = sub_100032AB0(v83, v62).super.isa;
  v0[208] = v63;
  uint64_t v64 = swift_task_alloc();
  v0[209] = v64;
  *(void *)(v64 + 16) = v63;
  *(void *)(v64 + 24) = v61;
  uint64_t v65 = swift_task_alloc();
  v0[210] = v65;
  *(void *)(v65 + 16) = &unk_10003C870;
  *(void *)(v65 + 24) = v64;
  id v66 = v59;
  id v67 = v60;
  NSString v68 = (void *)swift_task_alloc();
  v0[211] = v68;
  uint64_t v69 = sub_100005644(&qword_10003C888);
  v0[212] = v69;
  void *v68 = v0;
  v68[1] = sub_10000CD6C;
  return CKDatabase.configuredWith<A>(configuration:group:body:)(v0 + 24, v59, v60, &unk_10003C880, v65, v69);
}

uint64_t sub_10000CD6C()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 1704) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void **)(v2 + 1560);

    swift_bridgeObjectRelease();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v4 = sub_100023FE4;
  }
  else
  {
    uint64_t v5 = *(void **)(v2 + 1560);

    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v4 = sub_10000CF30;
  }
  return _swift_task_switch(v4, 0, 0);
}

uint64_t sub_10000CF30()
{
  uint64_t v259 = v0;
  uint64_t v1 = *(void **)(v0 + 1664);
  uint64_t v2 = *(void *)(v0 + 1504);
  uint64_t v3 = *(void (**)(uint64_t, uint64_t))(v0 + 1488);
  uint64_t v4 = *(void *)(v0 + 912);
  uint64_t v5 = *(void *)(v0 + 872);

  uint64_t v6 = *(void *)(v0 + 192);
  uint64_t v7 = *(void *)(v6 + 16);
  v3(v4, v5);
  *(void *)(v2 + 16) = v7;
  type metadata accessor for TaskRecord(0);
  *(void *)(v0 + 304) = _swiftEmptyArrayStorage;
  uint64_t v8 = *(void *)(v6 + 16);
  if (!v8)
  {
    uint64_t v12 = *(void *)(v0 + 1704);
    goto LABEL_48;
  }
  uint64_t v9 = *(void **)(v6 + 40);
  char v10 = *(unsigned char *)(v6 + 48);
  id v11 = *(id *)(v6 + 32);
  sub_10002FF18(v9, v10);
  if (sub_100032A00())
  {
    char v249 = v10;
    v253 = v9;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_60:
    v183 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 1440);
    uint64_t v184 = *(void *)(v0 + 1432);
    uint64_t v185 = *(void *)(v0 + 1368);
    uint64_t v186 = *(void *)(v0 + 960);
    swift_bridgeObjectRelease();
    v183(v185, v184, v186);
    v187 = sub_100032860();
    os_log_type_t v188 = sub_100032A80();
    BOOL v189 = os_log_type_enabled(v187, v188);
    v190 = *(void (**)(uint64_t, uint64_t))(v0 + 1600);
    uint64_t v191 = *(void *)(v0 + 1368);
    uint64_t v192 = *(void *)(v0 + 960);
    if (v189)
    {
      v193 = (uint8_t *)swift_slowAlloc();
      v257 = 0;
      v258[0] = 0;
      *(_WORD *)v193 = 0;
      v256[0] = (uint64_t)(v193 + 2);
      sub_10002BCC0((uint64_t)_swiftEmptyArrayStorage, (uint64_t)v256, (uint64_t)&v257, (uint64_t)v258);
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v187, v188, "Task cancelled.", v193, 2u);
      swift_slowDealloc();
    }
    else
    {
      swift_bridgeObjectRelease();
    }

    v190(v191, v192);
    v194 = *(void **)(v0 + 1560);
    v195 = *(void **)(v0 + 1552);
    v196 = *(void **)(v0 + 1544);
    v197 = *(void **)(v0 + 1536);
    v198 = *(void **)(v0 + 1520);
    v244 = *(void **)(v0 + 1528);
    uint64_t v199 = *(void *)(v0 + 1504);
    uint64_t v200 = *(void *)(v0 + 944);
    uint64_t v246 = *(void *)(v0 + 936);
    uint64_t v248 = *(void *)(v0 + 952);
    id v201 = objc_allocWithZone((Class)sub_100032780());
    uint64_t v232 = sub_100032770();

    swift_release();
    sub_10002FF64(v253, v249);

    sub_100027C1C(v199);
    (*(void (**)(uint64_t, uint64_t))(v200 + 8))(v248, v246);
LABEL_64:
    swift_release();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    v202 = *(uint64_t (**)(uint64_t))(v0 + 8);
    return v202(v232);
  }
  unint64_t v13 = 0;
  uint64_t v236 = *(void *)(v0 + 808);
  uint64_t v14 = *(void *)(v0 + 752);
  v235 = (void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
  v234 = (void (**)(uint64_t, uint64_t, uint64_t))(v14 + 32);
  v233 = (void (**)(uint64_t, uint64_t))(v14 + 8);
  v237 = *(void **)(v0 + 840);
  uint64_t v240 = *(void *)(v0 + 1704);
  v241 = (char *)(v6 + 72);
  v245 = *(void (**)(uint64_t, uint64_t))(v0 + 1600);
  uint64_t v238 = v8 - 1;
  uint64_t v239 = v6;
  while (1)
  {
    char v250 = v10;
    v254 = v9;
    unint64_t v242 = v13;
    (*(void (**)(void, void, void))(v0 + 1440))(*(void *)(v0 + 1360), *(void *)(v0 + 1432), *(void *)(v0 + 960));
    uint64_t v15 = swift_allocObject();
    *(void *)(v15 + 16) = v11;
    id v243 = v11;
    uint64_t v16 = sub_100032860();
    os_log_type_t v17 = sub_100032A90();
    uint64_t v18 = swift_allocObject();
    *(unsigned char *)(v18 + 16) = 64;
    uint64_t v19 = swift_allocObject();
    *(unsigned char *)(v19 + 16) = 8;
    uint64_t v20 = swift_allocObject();
    *(void *)(v20 + 16) = sub_100031D88;
    *(void *)(v20 + 24) = v15;
    uint64_t v21 = swift_allocObject();
    *(void *)(v21 + 16) = sub_100031B4C;
    *(void *)(v21 + 24) = v20;
    uint64_t v22 = swift_allocObject();
    *(_OWORD *)(v22 + 16) = xmmword_100033B60;
    *(void *)(v22 + 32) = sub_100031D8C;
    *(void *)(v22 + 40) = v18;
    *(void *)(v22 + 48) = sub_100031D8C;
    *(void *)(v22 + 56) = v19;
    *(void *)(v22 + 64) = sub_100031B54;
    *(void *)(v22 + 72) = v21;
    swift_retain();
    swift_retain();
    swift_retain();
    swift_bridgeObjectRelease();
    if (os_log_type_enabled(v16, v17))
    {
      uint64_t v23 = (uint8_t *)swift_slowAlloc();
      v257 = (void *)swift_slowAlloc();
      v258[0] = 0;
      *(_WORD *)uint64_t v23 = 258;
      void v23[2] = *(unsigned char *)(v18 + 16);
      if (v240) {
        goto LABEL_74;
      }
      swift_release();
      v23[3] = *(unsigned char *)(v19 + 16);
      v256[0] = (uint64_t)(v23 + 4);
      swift_release();
      sub_10002C320(v256, &v257, (uint64_t)v258, *(uint64_t (**)(void))(v21 + 16));
      uint64_t v24 = *(void *)(v0 + 1360);
      uint64_t v25 = *(void *)(v0 + 960);
      swift_release();
      _os_log_impl((void *)&_mh_execute_header, v16, v17, "CKRecordID: %@", v23, 0xCu);
      sub_100005644(&qword_10003C8A0);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      uint64_t v26 = v24;
      uint64_t v27 = v25;
    }
    else
    {
      uint64_t v28 = *(void *)(v0 + 1360);
      uint64_t v29 = *(void *)(v0 + 960);
      swift_release();
      swift_release();
      swift_release();

      uint64_t v26 = v28;
      uint64_t v27 = v29;
    }
    v245(v26, v27);
    if (v250)
    {
      (*(void (**)(void, void, void))(v0 + 1440))(*(void *)(v0 + 1320), *(void *)(v0 + 1432), *(void *)(v0 + 960));
      uint64_t v30 = swift_allocObject();
      *(void *)(v30 + 16) = v9;
      swift_errorRetain();
      swift_errorRetain();
      uint64_t v31 = sub_100032860();
      os_log_type_t v32 = sub_100032AA0();
      uint64_t v33 = swift_allocObject();
      *(unsigned char *)(v33 + 16) = 64;
      uint64_t v34 = swift_allocObject();
      *(unsigned char *)(v34 + 16) = 8;
      uint64_t v35 = swift_allocObject();
      *(void *)(v35 + 16) = sub_100031D84;
      *(void *)(v35 + 24) = v30;
      uint64_t v36 = swift_allocObject();
      *(void *)(v36 + 16) = sub_10002FE30;
      *(void *)(v36 + 24) = v35;
      uint64_t v37 = swift_allocObject();
      *(void *)(v37 + 16) = sub_100031B4C;
      *(void *)(v37 + 24) = v36;
      uint64_t v38 = swift_allocObject();
      *(_OWORD *)(v38 + 16) = xmmword_100033B60;
      *(void *)(v38 + 32) = sub_100031D8C;
      *(void *)(v38 + 40) = v33;
      *(void *)(v38 + 48) = sub_100031D8C;
      *(void *)(v38 + 56) = v34;
      *(void *)(v38 + 64) = sub_100031B54;
      *(void *)(v38 + 72) = v37;
      swift_retain();
      swift_retain();
      swift_retain();
      swift_bridgeObjectRelease();
      if (os_log_type_enabled(v31, v32))
      {
        unint64_t v39 = (uint8_t *)swift_slowAlloc();
        v257 = (void *)swift_slowAlloc();
        v258[0] = 0;
        *(_WORD *)unint64_t v39 = 258;
        v39[2] = *(unsigned char *)(v33 + 16);
        if (v240) {
          goto LABEL_74;
        }
        swift_release();
        v39[3] = *(unsigned char *)(v34 + 16);
        v256[0] = (uint64_t)(v39 + 4);
        swift_release();
        sub_10002C320(v256, &v257, (uint64_t)v258, *(uint64_t (**)(void))(v37 + 16));
        uint64_t v40 = *(void (**)(uint64_t, uint64_t))(v0 + 1600);
        uint64_t v41 = *(void *)(v0 + 1320);
        uint64_t v42 = *(void *)(v0 + 960);
        swift_release();
        _os_log_impl((void *)&_mh_execute_header, v31, v32, "Error: %@", v39, 0xCu);
        sub_100005644(&qword_10003C8A0);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        sub_10002FF64(v254, 1);
        sub_10002FF64(v254, 1);

        v40(v41, v42);
        v245 = *(void (**)(uint64_t, uint64_t))(v0 + 1600);
      }
      else
      {
        uint64_t v62 = *(void *)(v0 + 1320);
        uint64_t v63 = *(void *)(v0 + 960);

        sub_10002FF64(v254, 1);
        swift_release();
        swift_release();
        swift_release();

        sub_10002FF64(v254, 1);
        v245(v62, v63);
      }
      uint64_t v64 = *(void *)(v0 + 1504);
      uint64_t v65 = *(void *)(v64 + 32);
      BOOL v66 = __OFADD__(v65, 1);
      uint64_t v67 = v65 + 1;
      uint64_t v68 = v239;
      unint64_t v69 = v242;
      if (v66) {
        goto LABEL_83;
      }
      goto LABEL_20;
    }
    uint64_t v43 = *(void *)(v0 + 800);
    uint64_t v44 = *(void *)(v0 + 792);
    id v45 = v9;
    sub_1000024F4(v45, v44);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v236 + 48))(v44, 1, v43) == 1)
    {
      uint64_t v46 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 1440);
      uint64_t v47 = *(void *)(v0 + 1432);
      uint64_t v48 = *(void *)(v0 + 1328);
      uint64_t v49 = *(void *)(v0 + 960);
      sub_1000065E4(*(void *)(v0 + 792), &qword_10003C810);
      v46(v48, v47, v49);
      uint64_t v50 = swift_allocObject();
      *(void *)(v50 + 16) = v45;
      id v51 = v45;
      uint64_t v52 = sub_100032860();
      os_log_type_t v53 = sub_100032AA0();
      uint64_t v54 = swift_allocObject();
      *(unsigned char *)(v54 + 16) = 64;
      uint64_t v55 = swift_allocObject();
      *(unsigned char *)(v55 + 16) = 8;
      uint64_t v56 = swift_allocObject();
      *(void *)(v56 + 16) = sub_100031440;
      *(void *)(v56 + 24) = v50;
      uint64_t v57 = swift_allocObject();
      *(void *)(v57 + 16) = sub_100031B4C;
      *(void *)(v57 + 24) = v56;
      uint64_t v58 = swift_allocObject();
      *(_OWORD *)(v58 + 16) = xmmword_100033B60;
      *(void *)(v58 + 32) = sub_100031D8C;
      *(void *)(v58 + 40) = v54;
      *(void *)(v58 + 48) = sub_100031D8C;
      *(void *)(v58 + 56) = v55;
      *(void *)(v58 + 64) = sub_100031B54;
      *(void *)(v58 + 72) = v57;
      swift_retain();
      swift_retain();
      swift_retain();
      swift_bridgeObjectRelease();
      if (os_log_type_enabled(v52, v53))
      {
        uint64_t v59 = (uint8_t *)swift_slowAlloc();
        v257 = (void *)swift_slowAlloc();
        v258[0] = 0;
        *(_WORD *)uint64_t v59 = 258;
        v59[2] = *(unsigned char *)(v54 + 16);
        if (v240) {
          goto LABEL_74;
        }
        swift_release();
        v59[3] = *(unsigned char *)(v55 + 16);
        v256[0] = (uint64_t)(v59 + 4);
        swift_release();
        sub_10002C320(v256, &v257, (uint64_t)v258, *(uint64_t (**)(void))(v57 + 16));
        uint64_t v60 = *(void *)(v0 + 1328);
        uint64_t v61 = *(void *)(v0 + 960);
        swift_release();
        _os_log_impl((void *)&_mh_execute_header, v52, v53, "Skipping record: %@", v59, 0xCu);
        sub_100005644(&qword_10003C8A0);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        sub_10002FF64(v254, 0);
        sub_10002FF64(v254, 0);

        v245(v60, v61);
LABEL_29:
        uint64_t v240 = 0;
        goto LABEL_42;
      }
      uint64_t v94 = *(void *)(v0 + 1328);
      uint64_t v95 = *(void *)(v0 + 960);

      sub_10002FF64(v9, 0);
      swift_release();
      swift_release();
      swift_release();

      sub_10002FF64(v9, 0);
      v245(v94, v95);
    }
    else
    {
      uint64_t v70 = *(void *)(v0 + 1592);
      sub_100031468(*(void *)(v0 + 792), *(void *)(v0 + 840), type metadata accessor for TaskRecord);
      uint64_t v71 = v237[2];
      uint64_t v72 = v237[3];
      swift_bridgeObjectRetain();
      char v73 = sub_100028604(v71, v72, v70);
      swift_bridgeObjectRelease();
      uint64_t v74 = *(void (**)(void, uint64_t, uint64_t))(v0 + 1440);
      uint64_t v75 = *(void *)(v0 + 1432);
      uint64_t v76 = *(void *)(v0 + 960);
      uint64_t v77 = *(void *)(v0 + 840);
      uint64_t v78 = *(void *)(v0 + 832);
      if ((v73 & 1) == 0)
      {
        v74(*(void *)(v0 + 1352), v75, v76);
        sub_100030B2C(v77, v78, type metadata accessor for TaskRecord);
        unint64_t v96 = (*(unsigned __int8 *)(v236 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v236 + 80);
        uint64_t v97 = swift_allocObject();
        sub_100031468(v78, v97 + v96, type metadata accessor for TaskRecord);
        v98 = sub_100032860();
        os_log_type_t v99 = sub_100032A90();
        uint64_t v100 = swift_allocObject();
        *(unsigned char *)(v100 + 16) = 32;
        uint64_t v101 = swift_allocObject();
        *(unsigned char *)(v101 + 16) = 8;
        uint64_t v102 = swift_allocObject();
        *(void *)(v102 + 16) = sub_1000314D4;
        *(void *)(v102 + 24) = v97;
        uint64_t v103 = swift_allocObject();
        *(void *)(v103 + 16) = sub_100031B40;
        *(void *)(v103 + 24) = v102;
        uint64_t v104 = swift_allocObject();
        *(_OWORD *)(v104 + 16) = xmmword_100033B60;
        *(void *)(v104 + 32) = sub_100031D8C;
        *(void *)(v104 + 40) = v100;
        *(void *)(v104 + 48) = sub_100031D8C;
        *(void *)(v104 + 56) = v101;
        *(void *)(v104 + 64) = sub_100031B50;
        *(void *)(v104 + 72) = v103;
        swift_retain();
        swift_retain();
        swift_retain();
        swift_bridgeObjectRelease();
        if (!os_log_type_enabled(v98, v99))
        {
          uint64_t v127 = *(void *)(v0 + 1352);
          uint64_t v128 = *(void *)(v0 + 960);
          uint64_t v129 = *(void *)(v0 + 840);

          sub_10002FF64(v9, 0);
          swift_release();
          swift_release();
          swift_release();
          sub_10002FF64(v9, 0);

          v245(v127, v128);
          sub_100030BD0(v129, type metadata accessor for TaskRecord);
          goto LABEL_42;
        }
        unint64_t v105 = (uint8_t *)swift_slowAlloc();
        uint64_t v106 = swift_slowAlloc();
        v257 = 0;
        v258[0] = v106;
        *(_WORD *)unint64_t v105 = 258;
        v105[2] = *(unsigned char *)(v100 + 16);
        if (v240) {
          goto LABEL_74;
        }
        swift_release();
        v105[3] = *(unsigned char *)(v101 + 16);
        v256[0] = (uint64_t)(v105 + 4);
        swift_release();
        sub_10002C274(v256, (uint64_t)&v257, v258, *(uint64_t (**)(void))(v103 + 16));
        uint64_t v107 = *(void *)(v0 + 1352);
        uint64_t v108 = *(void *)(v0 + 960);
        uint64_t v109 = *(void *)(v0 + 840);
        swift_release();
        _os_log_impl((void *)&_mh_execute_header, v98, v99, "Skipping task %s because extensionId is not available.", v105, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        sub_10002FF64(v254, 0);
        sub_10002FF64(v254, 0);

        v245(v107, v108);
        sub_100030BD0(v109, type metadata accessor for TaskRecord);
        goto LABEL_29;
      }
      v74(*(void *)(v0 + 1344), v75, v76);
      sub_100030B2C(v77, v78, type metadata accessor for TaskRecord);
      unint64_t v79 = (*(unsigned __int8 *)(v236 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v236 + 80);
      uint64_t v80 = swift_allocObject();
      sub_100031468(v78, v80 + v79, type metadata accessor for TaskRecord);
      uint64_t v81 = sub_100032860();
      os_log_type_t v82 = sub_100032A90();
      uint64_t v83 = swift_allocObject();
      *(unsigned char *)(v83 + 16) = 32;
      uint64_t v84 = swift_allocObject();
      *(unsigned char *)(v84 + 16) = 8;
      uint64_t v85 = swift_allocObject();
      *(void *)(v85 + 16) = sub_1000314D4;
      *(void *)(v85 + 24) = v80;
      uint64_t v86 = swift_allocObject();
      *(void *)(v86 + 16) = sub_100031B40;
      *(void *)(v86 + 24) = v85;
      uint64_t v87 = swift_allocObject();
      *(_OWORD *)(v87 + 16) = xmmword_100033B60;
      *(void *)(v87 + 32) = sub_100031D8C;
      *(void *)(v87 + 40) = v83;
      *(void *)(v87 + 48) = sub_100031D8C;
      *(void *)(v87 + 56) = v84;
      *(void *)(v87 + 64) = sub_100031B50;
      *(void *)(v87 + 72) = v86;
      swift_retain();
      swift_retain();
      swift_retain();
      swift_bridgeObjectRelease();
      if (os_log_type_enabled(v81, v82))
      {
        uint64_t v88 = (uint8_t *)swift_slowAlloc();
        uint64_t v89 = swift_slowAlloc();
        v257 = 0;
        v258[0] = v89;
        *(_WORD *)uint64_t v88 = 258;
        v88[2] = *(unsigned char *)(v83 + 16);
        if (v240) {
          goto LABEL_74;
        }
        swift_release();
        v88[3] = *(unsigned char *)(v84 + 16);
        v256[0] = (uint64_t)(v88 + 4);
        swift_release();
        sub_10002C274(v256, (uint64_t)&v257, v258, *(uint64_t (**)(void))(v86 + 16));
        uint64_t v90 = *(void *)(v0 + 1344);
        uint64_t v91 = *(void *)(v0 + 960);
        swift_release();
        _os_log_impl((void *)&_mh_execute_header, v81, v82, "Parsing  config file for taskName: %s", v88, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        uint64_t v92 = v90;
        uint64_t v93 = v91;
      }
      else
      {
        uint64_t v110 = *(void *)(v0 + 1344);
        uint64_t v111 = *(void *)(v0 + 960);
        swift_release();
        swift_release();
        swift_release();

        uint64_t v92 = v110;
        uint64_t v93 = v111;
      }
      v245(v92, v93);
      uint64_t v112 = v237[4];
      unint64_t v113 = v237[5];
      sub_1000062A0(v112, v113);
      sub_10002FED0(&qword_10003C8A8, (void (*)(uint64_t))&type metadata accessor for TaskDefinition);
      sub_100032430();
      if (v240)
      {
        id v114 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 1440);
        uint64_t v115 = *(void *)(v0 + 1432);
        uint64_t v116 = *(void *)(v0 + 1336);
        uint64_t v117 = *(void *)(v0 + 960);
        uint64_t v118 = *(void *)(v0 + 744);
        uint64_t v119 = *(void *)(v0 + 736);
        swift_errorRelease();
        sub_100006248(v112, v113);
        (*v235)(v119, 1, 1, v118);
        sub_1000065E4(v119, &qword_10003C808);
        v114(v116, v115, v117);
        uint64_t v120 = sub_100032860();
        os_log_type_t v121 = sub_100032AA0();
        BOOL v122 = os_log_type_enabled(v120, v121);
        uint64_t v123 = *(void *)(v0 + 1336);
        uint64_t v124 = *(void *)(v0 + 960);
        uint64_t v125 = *(void *)(v0 + 840);
        if (v122)
        {
          v126 = (uint8_t *)swift_slowAlloc();
          v257 = 0;
          v258[0] = 0;
          *(_WORD *)v126 = 0;
          v256[0] = (uint64_t)(v126 + 2);
          sub_10002BCC0((uint64_t)_swiftEmptyArrayStorage, (uint64_t)v256, (uint64_t)&v257, (uint64_t)v258);
          swift_bridgeObjectRelease();
          _os_log_impl((void *)&_mh_execute_header, v120, v121, "Failed to parse TaskDefinition from config file, skipping task.", v126, 2u);
          swift_slowDealloc();
        }
        else
        {
          swift_bridgeObjectRelease();
        }

        sub_10002FF64(v9, 0);
        sub_10002FF64(v9, 0);

        v245(v123, v124);
        sub_100030BD0(v125, type metadata accessor for TaskRecord);
        uint64_t v240 = 0;
        uint64_t v68 = v239;
        uint64_t v64 = *(void *)(v0 + 1504);
        uint64_t v133 = *(void *)(v64 + 32);
        BOOL v66 = __OFADD__(v133, 1);
        uint64_t v67 = v133 + 1;
        unint64_t v69 = v242;
        if (v66) {
          goto LABEL_84;
        }
LABEL_20:
        *(void *)(v64 + 32) = v67;
        goto LABEL_43;
      }
      uint64_t v130 = *(void *)(v0 + 784);
      uint64_t v131 = *(void *)(v0 + 744);
      uint64_t v132 = *(void *)(v0 + 736);
      sub_100006248(v112, v113);
      (*v235)(v132, 0, 1, v131);
      (*v234)(v130, v132, v131);
      sub_100032840();
      uint64_t v134 = *(void *)(v0 + 1504);
      uint64_t v135 = *(void *)(v0 + 840);
      uint64_t v136 = *(void *)(v0 + 832);
      uint64_t v137 = *(void *)(v0 + 784);
      uint64_t v138 = *(void *)(v0 + 744);
      sub_100030B2C(v135, v136, type metadata accessor for TaskRecord);
      sub_10002873C(v136);
      sub_10002FF64(v254, 0);
      sub_10002FF64(v254, 0);

      (*v233)(v137, v138);
      sub_100030BD0(v135, type metadata accessor for TaskRecord);
      uint64_t v139 = *(void *)(v134 + 24);
      BOOL v66 = __OFADD__(v139, 1);
      uint64_t v140 = v139 + 1;
      if (v66) {
        goto LABEL_85;
      }
      uint64_t v240 = 0;
      *(void *)(*(void *)(v0 + 1504) + 24) = v140;
    }
LABEL_42:
    uint64_t v68 = v239;
    unint64_t v69 = v242;
LABEL_43:
    if (v238 == v69) {
      break;
    }
    unint64_t v13 = v69 + 1;
    if (*(void *)(v68 + 16) <= v13)
    {
      __break(1u);
LABEL_83:
      __break(1u);
LABEL_84:
      __break(1u);
      __break(1u);
LABEL_85:
      __break(1u);
    }
    uint64_t v9 = (void *)*((void *)v241 - 1);
    char v10 = *v241;
    id v11 = *((id *)v241 - 2);
    sub_10002FF18(v9, v10);
    v241 += 24;
    if (sub_100032A00())
    {
      char v249 = v10;
      v253 = v9;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      goto LABEL_60;
    }
  }
  uint64_t v12 = v240;
LABEL_48:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (sub_100032A00())
  {
    v141 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 1440);
    uint64_t v142 = *(void *)(v0 + 1432);
    uint64_t v143 = *(void *)(v0 + 1312);
    uint64_t v144 = *(void *)(v0 + 960);
    swift_bridgeObjectRelease();
    v141(v143, v142, v144);
    v145 = sub_100032860();
    os_log_type_t v146 = sub_100032A80();
    BOOL v147 = os_log_type_enabled(v145, v146);
    v148 = *(void (**)(uint64_t, uint64_t))(v0 + 1600);
    uint64_t v149 = *(void *)(v0 + 1312);
    uint64_t v150 = *(void *)(v0 + 960);
    if (v147)
    {
      v151 = (uint8_t *)swift_slowAlloc();
      v257 = 0;
      v258[0] = 0;
      *(_WORD *)v151 = 0;
      v256[0] = (uint64_t)(v151 + 2);
      sub_10002BCC0((uint64_t)_swiftEmptyArrayStorage, (uint64_t)v256, (uint64_t)&v257, (uint64_t)v258);
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v145, v146, "Task cancelled before adding tasks to mlhost.", v151, 2u);
      swift_slowDealloc();
    }
    else
    {
      swift_bridgeObjectRelease();
    }

    v148(v149, v150);
    v174 = *(void **)(v0 + 1560);
    v175 = *(void **)(v0 + 1552);
    v176 = *(void **)(v0 + 1544);
    v177 = *(void **)(v0 + 1536);
    v178 = *(void **)(v0 + 1528);
    v179 = *(void **)(v0 + 1520);
    uint64_t v180 = *(void *)(v0 + 1504);
    uint64_t v255 = *(void *)(v0 + 952);
    uint64_t v181 = *(void *)(v0 + 944);
    uint64_t v252 = *(void *)(v0 + 936);
    id v182 = objc_allocWithZone((Class)sub_100032780());
    uint64_t v232 = sub_100032770();

    swift_release();
    sub_100027C1C(v180);
    (*(void (**)(uint64_t, uint64_t))(v181 + 8))(v255, v252);
    goto LABEL_64;
  }
  uint64_t v152 = swift_allocObject();
  *(void *)(v0 + 1712) = v152;
  *(void *)(v152 + 16) = &_swiftEmptySetSingleton;
  uint64_t v153 = *(void *)(v0 + 304);
  *(void *)(v0 + 1720) = v153;
  uint64_t v154 = *(void *)(v153 + 16);
  *(void *)(v0 + 1728) = v154;
  if (v154)
  {
    uint64_t v155 = *(void *)(v0 + 808);
    *(_DWORD *)(v0 + 1944) = *(_DWORD *)(v155 + 80);
    *(void *)(v0 + 1736) = *(void *)(v155 + 72);
    v156 = *(void (**)(void, void))(v0 + 1600);
    swift_bridgeObjectRetain();
    uint64_t v157 = 0;
    v247 = v156;
    while (1)
    {
      *(void *)(v0 + 1768) = v157;
      *(void *)(v0 + 1760) = v156;
      *(void *)(v0 + 1752) = v156;
      *(void *)(v0 + 1744) = v156;
      uint64_t v158 = *(void *)(v0 + 824);
      sub_100030B2C(*(void *)(v0 + 1720)+ ((*(unsigned __int8 *)(v0 + 1944) + 32) & ~(unint64_t)*(unsigned __int8 *)(v0 + 1944))+ *(void *)(v0 + 1736) * v157, v158, type metadata accessor for TaskRecord);
      uint64_t v159 = *(void *)(v158 + 32);
      unint64_t v160 = *(void *)(v158 + 40);
      sub_1000062A0(v159, v160);
      sub_10002FED0(&qword_10003C8A8, (void (*)(uint64_t))&type metadata accessor for TaskDefinition);
      sub_100032430();
      if (!v12) {
        break;
      }
      v251 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 1440);
      uint64_t v161 = *(void *)(v0 + 1432);
      uint64_t v162 = *(void *)(v0 + 1288);
      uint64_t v163 = *(void *)(v0 + 960);
      uint64_t v164 = *(void *)(v0 + 752);
      uint64_t v165 = *(void *)(v0 + 744);
      uint64_t v166 = *(void *)(v0 + 728);
      swift_errorRelease();
      sub_100006248(v159, v160);
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v164 + 56))(v166, 1, 1, v165);
      sub_1000065E4(v166, &qword_10003C808);
      v251(v162, v161, v163);
      v167 = sub_100032860();
      os_log_type_t v168 = sub_100032AA0();
      BOOL v169 = os_log_type_enabled(v167, v168);
      uint64_t v170 = *(void *)(v0 + 1288);
      uint64_t v171 = *(void *)(v0 + 960);
      uint64_t v172 = *(void *)(v0 + 824);
      if (v169)
      {
        v173 = (uint8_t *)swift_slowAlloc();
        v257 = 0;
        v258[0] = 0;
        *(_WORD *)v173 = 0;
        v256[0] = (uint64_t)(v173 + 2);
        uint64_t v12 = 0;
        sub_10002BCC0((uint64_t)_swiftEmptyArrayStorage, (uint64_t)v256, (uint64_t)&v257, (uint64_t)v258);
        swift_bridgeObjectRelease();
        _os_log_impl((void *)&_mh_execute_header, v167, v168, "Failed to parse TaskDefinition from config file, skipping task.", v173, 2u);
        swift_slowDealloc();

        v156 = v247;
        v247(v170, v171);
        sub_100030BD0(v172, type metadata accessor for TaskRecord);
      }
      else
      {
        swift_bridgeObjectRelease();

        v156 = v247;
        v247(v170, v171);
        sub_100030BD0(v172, type metadata accessor for TaskRecord);
        uint64_t v12 = 0;
      }
      uint64_t v157 = *(void *)(v0 + 1768) + 1;
      if (v157 == *(void *)(v0 + 1728))
      {
        swift_bridgeObjectRelease();
        uint64_t v152 = *(void *)(v0 + 1712);
        goto LABEL_72;
      }
    }
    uint64_t v204 = *(void *)(v0 + 776);
    uint64_t v205 = *(void *)(v0 + 752);
    uint64_t v206 = *(void *)(v0 + 744);
    uint64_t v207 = *(void *)(v0 + 728);
    sub_100006248(v159, v160);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v205 + 56))(v207, 0, 1, v206);
    v208 = *(void (**)(uint64_t, uint64_t, uint64_t))(v205 + 32);
    *(void *)(v0 + 1776) = v208;
    *(void *)(v0 + 1784) = (v205 + 32) & 0xFFFFFFFFFFFFLL | 0x48D8000000000000;
    v208(v204, v207, v206);
    uint64_t v209 = async function pointer to dispatch thunk of MLHostClient.addTask(taskDefinition:);
    v210 = (void *)swift_task_alloc();
    *(void *)(v0 + 1792) = v210;
    void *v210 = v0;
    v210[1] = sub_10000F9A4;
    uint64_t v211 = *(void *)(v0 + 776);
    return ((uint64_t (*)(uint64_t))((char *)&async function pointer to dispatch thunk of MLHostClient.addTask(taskDefinition:)
                                            + v209))(v211);
  }
  else
  {
LABEL_72:
    (*(void (**)(void, void, void))(v0 + 1440))(*(void *)(v0 + 1280), *(void *)(v0 + 1432), *(void *)(v0 + 960));
    v212 = (void *)v0;
    uint64_t v213 = swift_allocObject();
    *(void *)(v213 + 16) = sub_10002FFA8;
    *(void *)(v213 + 24) = v152;
    swift_retain();
    v214 = sub_100032860();
    os_log_type_t v215 = sub_100032A80();
    uint64_t v216 = swift_allocObject();
    *(unsigned char *)(v216 + 16) = 32;
    uint64_t v217 = swift_allocObject();
    *(unsigned char *)(v217 + 16) = 8;
    uint64_t v218 = swift_allocObject();
    *(void *)(v218 + 16) = sub_10002F988;
    *(void *)(v218 + 24) = v213;
    uint64_t v219 = swift_allocObject();
    *(void *)(v219 + 16) = sub_100031B40;
    *(void *)(v219 + 24) = v218;
    uint64_t v220 = swift_allocObject();
    *(_OWORD *)(v220 + 16) = xmmword_100033B60;
    *(void *)(v220 + 32) = sub_100031D8C;
    *(void *)(v220 + 40) = v216;
    *(void *)(v220 + 48) = sub_100031D8C;
    *(void *)(v220 + 56) = v217;
    *(void *)(v220 + 64) = sub_100031B50;
    *(void *)(v220 + 72) = v219;
    swift_retain();
    swift_retain();
    swift_retain();
    swift_bridgeObjectRelease();
    if (os_log_type_enabled(v214, v215))
    {
      v221 = (uint8_t *)swift_slowAlloc();
      uint64_t v222 = swift_slowAlloc();
      v257 = 0;
      v258[0] = v222;
      *(_WORD *)v221 = 258;
      v221[2] = *(unsigned char *)(v216 + 16);
      if (v12)
      {
LABEL_74:
        return swift_errorRelease();
      }
      swift_release();
      v221[3] = *(unsigned char *)(v217 + 16);
      v256[0] = (uint64_t)(v221 + 4);
      swift_release();
      sub_10002C274(v256, (uint64_t)&v257, v258, *(uint64_t (**)(void))(v219 + 16));
      v223 = *(void (**)(uint64_t, uint64_t))(v0 + 1600);
      uint64_t v228 = v212[160];
      uint64_t v229 = v212[120];
      swift_release();
      _os_log_impl((void *)&_mh_execute_header, v214, v215, "Computed addedTaskNames: %s", v221, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      uint64_t v226 = v228;
      uint64_t v227 = v229;
    }
    else
    {
      v223 = *(void (**)(uint64_t, uint64_t))(v0 + 1600);
      uint64_t v224 = v212[160];
      uint64_t v225 = v212[120];
      swift_release();
      swift_release();
      swift_release();

      uint64_t v226 = v224;
      uint64_t v227 = v225;
    }
    v223(v226, v227);
    uint64_t v230 = async function pointer to dispatch thunk of MLHostClient.getTasks();
    v231 = (void *)swift_task_alloc();
    v212[226] = v231;
    void *v231 = v212;
    v231[1] = sub_100010C8C;
    return ((uint64_t (*)(void))((char *)&async function pointer to dispatch thunk of MLHostClient.getTasks() + v230))();
  }
}

uint64_t sub_10000F9A4(char a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 1800) = v1;
  swift_task_dealloc();
  if (v1)
  {
    swift_errorRelease();
    uint64_t v5 = sub_100024FC0;
  }
  else
  {
    *(unsigned char *)(v4 + 1948) = a1 & 1;
    uint64_t v5 = sub_10000FB00;
  }
  return _swift_task_switch(v5, 0, 0);
}

uint64_t sub_10000FB00()
{
  uint64_t v155 = v0;
  if ((*(unsigned char *)(v0 + 1948) & 1) == 0)
  {
    uint64_t v21 = *(void *)(v0 + 1800);
    uint64_t v22 = *(void (**)(unint64_t, uint64_t, uint64_t))(v0 + 1776);
    uint64_t v23 = *(void *)(v0 + 776);
    uint64_t v24 = *(void *)(v0 + 768);
    uint64_t v25 = *(void *)(v0 + 752);
    uint64_t v26 = *(void *)(v0 + 744);
    (*(void (**)(void, void, void))(v0 + 1440))(*(void *)(v0 + 1296), *(void *)(v0 + 1432), *(void *)(v0 + 960));
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v25 + 16))(v24, v23, v26);
    unint64_t v27 = (*(unsigned __int8 *)(v25 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v25 + 80);
    uint64_t v28 = swift_allocObject();
    v22(v28 + v27, v24, v26);
    uint64_t v29 = sub_100032860();
    os_log_type_t v30 = sub_100032AA0();
    uint64_t v31 = swift_allocObject();
    *(unsigned char *)(v31 + 16) = 32;
    uint64_t v32 = swift_allocObject();
    *(unsigned char *)(v32 + 16) = 8;
    uint64_t v33 = swift_allocObject();
    *(void *)(v33 + 16) = sub_100031250;
    *(void *)(v33 + 24) = v28;
    uint64_t v34 = swift_allocObject();
    *(void *)(v34 + 16) = sub_100031B40;
    *(void *)(v34 + 24) = v33;
    uint64_t v35 = swift_allocObject();
    *(_OWORD *)(v35 + 16) = xmmword_100033B60;
    *(void *)(v35 + 32) = sub_100031D8C;
    *(void *)(v35 + 40) = v31;
    *(void *)(v35 + 48) = sub_100031D8C;
    *(void *)(v35 + 56) = v32;
    *(void *)(v35 + 64) = sub_100031B50;
    *(void *)(v35 + 72) = v34;
    swift_retain();
    swift_retain();
    swift_retain();
    swift_bridgeObjectRelease();
    if (os_log_type_enabled(v29, v30))
    {
      os_log_type_t v142 = v30;
      log = v29;
      uint64_t v36 = (uint8_t *)swift_slowAlloc();
      uint64_t v37 = swift_slowAlloc();
      *(void *)(v0 + 368) = 0;
      *(void *)(v0 + 376) = v37;
      *(_WORD *)uint64_t v36 = 258;
      v36[2] = *(unsigned char *)(v31 + 16);
      *(void *)(v0 + 360) = v36 + 3;
      if (v21) {
        goto LABEL_24;
      }
      swift_release();
      uint64_t v38 = *(unsigned char **)(v0 + 360);
      unsigned char *v38 = *(unsigned char *)(v32 + 16);
      *(void *)(v0 + 360) = v38 + 1;
      swift_release();
      sub_10002C274((uint64_t *)(v0 + 360), v0 + 368, (uint64_t *)(v0 + 376), *(uint64_t (**)(void))(v34 + 16));
      uint64_t v149 = (void *)(v0 + 1752);
      uint64_t v39 = *(void *)(v0 + 1296);
      uint64_t v40 = *(void *)(v0 + 960);
      uint64_t v136 = *(void (**)(uint64_t, uint64_t))(v0 + 1752);
      uint64_t v139 = *(void *)(v0 + 824);
      uint64_t v135 = *(void *)(v0 + 776);
      uint64_t v41 = *(void *)(v0 + 752);
      uint64_t v42 = *(void *)(v0 + 744);
      swift_release();
      _os_log_impl((void *)&_mh_execute_header, log, v142, "Invalid remote reply for taskName: %s", v36, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      v136(v39, v40);
      (*(void (**)(uint64_t, uint64_t))(v41 + 8))(v135, v42);
      uint64_t v43 = v139;
    }
    else
    {
      uint64_t v62 = *(void *)(v0 + 1296);
      uint64_t v63 = *(void *)(v0 + 960);
      os_log_t loga = *(os_log_t *)(v0 + 824);
      uint64_t v149 = (void *)(v0 + 1760);
      uint64_t v140 = *(void *)(v0 + 776);
      uint64_t v143 = *(void (**)(uint64_t, uint64_t))(v0 + 1760);
      uint64_t v64 = *(void *)(v0 + 752);
      uint64_t v137 = *(void *)(v0 + 744);

      swift_release();
      swift_release();
      swift_release();
      v143(v62, v63);
      (*(void (**)(uint64_t, uint64_t))(v64 + 8))(v140, v137);
      uint64_t v43 = (uint64_t)loga;
    }
    sub_100030BD0(v43, type metadata accessor for TaskRecord);
    uint64_t v65 = *(void *)(v0 + 1504);
    uint64_t v66 = *(void *)(v65 + 48);
    BOOL v50 = __OFADD__(v66, 1);
    uint64_t v67 = v66 + 1;
    if (!v50)
    {
      uint64_t v68 = (void (*)(void, void))*v149;
      *(void *)(v65 + 48) = v67;
      uint64_t v144 = *(void (**)(void, void))(v0 + 1752);
      uint64_t v52 = *(void (**)(void, void))(v0 + 1744);
      goto LABEL_21;
    }
    __break(1u);
LABEL_44:
    __break(1u);
  }
  uint64_t v1 = *(void (**)(unint64_t, uint64_t, uint64_t))(v0 + 1776);
  uint64_t v2 = *(void *)(v0 + 776);
  uint64_t v3 = *(void *)(v0 + 768);
  uint64_t v4 = *(void *)(v0 + 752);
  uint64_t v5 = *(void *)(v0 + 744);
  (*(void (**)(void, void, void))(v0 + 1440))(*(void *)(v0 + 1304), *(void *)(v0 + 1432), *(void *)(v0 + 960));
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v3, v2, v5);
  unint64_t v6 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v7 = swift_allocObject();
  v1(v7 + v6, v3, v5);
  uint64_t v8 = sub_100032860();
  os_log_type_t v9 = sub_100032A90();
  uint64_t v10 = swift_allocObject();
  *(unsigned char *)(v10 + 16) = 32;
  uint64_t v11 = swift_allocObject();
  *(unsigned char *)(v11 + 16) = 8;
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = sub_100031250;
  *(void *)(v12 + 24) = v7;
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = sub_100031B40;
  *(void *)(v13 + 24) = v12;
  uint64_t v14 = swift_allocObject();
  *(_OWORD *)(v14 + 16) = xmmword_100033B60;
  *(void *)(v14 + 32) = sub_100031D8C;
  *(void *)(v14 + 40) = v10;
  *(void *)(v14 + 48) = sub_100031D8C;
  *(void *)(v14 + 56) = v11;
  *(void *)(v14 + 64) = sub_100031B50;
  *(void *)(v14 + 72) = v13;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRelease();
  if (!os_log_type_enabled(v8, v9))
  {
    uint64_t v44 = (void *)(v0 + 1744);
    id v45 = *(void (**)(uint64_t, uint64_t))(v0 + 1744);
    uint64_t v46 = *(void *)(v0 + 1304);
    uint64_t v47 = *(void *)(v0 + 960);
    swift_release();
    swift_release();
    swift_release();

    v45(v46, v47);
    goto LABEL_10;
  }
  uint64_t v15 = *(void *)(v0 + 1800);
  uint64_t v16 = (uint8_t *)swift_slowAlloc();
  uint64_t v17 = swift_slowAlloc();
  *(void *)(v0 + 400) = 0;
  *(void *)(v0 + 408) = v17;
  *(_WORD *)uint64_t v16 = 258;
  v16[2] = *(unsigned char *)(v10 + 16);
  *(void *)(v0 + 392) = v16 + 3;
  uint64_t v18 = *(void *)(v0 + 1800);
  if (v15
    || (swift_release(),
        uint64_t v19 = *(unsigned char **)(v0 + 392),
        *uint64_t v19 = *(unsigned char *)(v11 + 16),
        *(void *)(v0 + 392) = v19 + 1,
        uint64_t v20 = *(void *)(v0 + 1800),
        v18)
    || (swift_release(),
        sub_10002C274((uint64_t *)(v0 + 392), v0 + 400, (uint64_t *)(v0 + 408), *(uint64_t (**)(void))(v13 + 16)),
        v20))
  {
LABEL_24:
    return swift_errorRelease();
  }
  uint64_t v44 = (void *)(v0 + 1600);
  v151 = *(void (**)(uint64_t, uint64_t))(v0 + 1600);
  uint64_t v133 = *(void *)(v0 + 1304);
  uint64_t v134 = *(void *)(v0 + 960);
  swift_release();
  _os_log_impl((void *)&_mh_execute_header, v8, v9, "Task %s is successfully registered.", v16, 0xCu);
  swift_arrayDestroy();
  swift_slowDealloc();
  swift_slowDealloc();

  v151(v133, v134);
LABEL_10:
  uint64_t v48 = *(void *)(v0 + 1504);
  uint64_t v49 = *(void *)(v48 + 40);
  BOOL v50 = __OFADD__(v49, 1);
  uint64_t v51 = v49 + 1;
  if (v50) {
    goto LABEL_44;
  }
  uint64_t v52 = (void (*)(void, void))*v44;
  uint64_t v53 = *(void *)(v0 + 880);
  uint64_t v54 = *(void *)(v0 + 872);
  uint64_t v55 = *(void *)(v0 + 824);
  uint64_t v56 = *(void *)(v0 + 800);
  uint64_t v57 = *(void *)(v0 + 720);
  *(void *)(v48 + 40) = v51;
  Swift::Int v58 = sub_1000327B0();
  sub_10002C604((Swift::Int *)(v0 + 224), v58, v59);
  swift_bridgeObjectRelease();
  sub_1000313D8(v55 + *(int *)(v56 + 36), v57);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v53 + 48))(v57, 1, v54) == 1)
  {
    uint64_t v60 = *(void *)(v0 + 824);
    uint64_t v61 = *(void *)(v0 + 720);
    (*(void (**)(void, void))(*(void *)(v0 + 752) + 8))(*(void *)(v0 + 776), *(void *)(v0 + 744));
    sub_100030BD0(v60, type metadata accessor for TaskRecord);
    sub_1000065E4(v61, &qword_10003C3B0);
  }
  else
  {
    unint64_t v69 = *(void (**)(uint64_t, uint64_t))(v0 + 1488);
    uint64_t v70 = *(void *)(v0 + 920);
    uint64_t v71 = *(void *)(v0 + 872);
    (*(void (**)(void, void, uint64_t))(v0 + 1640))(*(void *)(v0 + 896), *(void *)(v0 + 720), v71);
    sub_1000325A0();
    BOOL v72 = sub_100028C2C();
    v69(v70, v71);
    if (v72)
    {
      char v73 = *(void (**)(uint64_t, uint64_t))(v0 + 1488);
      uint64_t v74 = *(void *)(v0 + 920);
      uint64_t v75 = *(void *)(v0 + 896);
      uint64_t v76 = *(void *)(v0 + 872);
      os_log_t logb = *(os_log_t *)(v0 + 776);
      uint64_t v150 = *(void *)(v0 + 824);
      uint64_t v77 = *(void *)(v0 + 752);
      uint64_t v78 = *(void *)(v0 + 744);
      sub_1000325A0();
      sub_1000325C0();
      double v80 = v79;
      v73(v74, v76);
      sub_1000288AC(v80);
      v73(v75, v76);
      (*(void (**)(os_log_t, uint64_t))(v77 + 8))(logb, v78);
      uint64_t v81 = v150;
    }
    else
    {
      uint64_t v82 = *(void *)(v0 + 824);
      uint64_t v83 = *(void *)(v0 + 776);
      uint64_t v84 = *(void *)(v0 + 752);
      uint64_t v85 = *(void *)(v0 + 744);
      (*(void (**)(void, void))(v0 + 1488))(*(void *)(v0 + 896), *(void *)(v0 + 872));
      (*(void (**)(uint64_t, uint64_t))(v84 + 8))(v83, v85);
      uint64_t v81 = v82;
    }
    sub_100030BD0(v81, type metadata accessor for TaskRecord);
  }
  uint64_t v21 = *(void *)(v0 + 1800);
  uint64_t v144 = v52;
  uint64_t v68 = v52;
LABEL_21:
  uint64_t v86 = *(void *)(v0 + 1768) + 1;
  if (v86 == *(void *)(v0 + 1728))
  {
LABEL_22:
    swift_bridgeObjectRelease();
    uint64_t v87 = *(void *)(v0 + 1712);
    (*(void (**)(void, void, void))(v0 + 1440))(*(void *)(v0 + 1280), *(void *)(v0 + 1432), *(void *)(v0 + 960));
    uint64_t v88 = swift_allocObject();
    *(void *)(v88 + 16) = sub_10002FFA8;
    *(void *)(v88 + 24) = v87;
    swift_retain();
    uint64_t v89 = sub_100032860();
    os_log_type_t v90 = sub_100032A80();
    uint64_t v91 = swift_allocObject();
    *(unsigned char *)(v91 + 16) = 32;
    uint64_t v92 = swift_allocObject();
    *(unsigned char *)(v92 + 16) = 8;
    uint64_t v93 = swift_allocObject();
    *(void *)(v93 + 16) = sub_10002F988;
    *(void *)(v93 + 24) = v88;
    uint64_t v94 = swift_allocObject();
    *(void *)(v94 + 16) = sub_100031B40;
    *(void *)(v94 + 24) = v93;
    uint64_t v95 = swift_allocObject();
    *(_OWORD *)(v95 + 16) = xmmword_100033B60;
    *(void *)(v95 + 32) = sub_100031D8C;
    *(void *)(v95 + 40) = v91;
    *(void *)(v95 + 48) = sub_100031D8C;
    *(void *)(v95 + 56) = v92;
    *(void *)(v95 + 64) = sub_100031B50;
    *(void *)(v95 + 72) = v94;
    swift_retain();
    swift_retain();
    swift_retain();
    swift_bridgeObjectRelease();
    if (os_log_type_enabled(v89, v90))
    {
      unint64_t v96 = (uint8_t *)swift_slowAlloc();
      uint64_t v97 = swift_slowAlloc();
      uint64_t v153 = 0;
      uint64_t v154 = v97;
      *(_WORD *)unint64_t v96 = 258;
      v96[2] = *(unsigned char *)(v91 + 16);
      if (v21) {
        goto LABEL_24;
      }
      swift_release();
      v96[3] = *(unsigned char *)(v92 + 16);
      v152[0] = (uint64_t)(v96 + 4);
      swift_release();
      sub_10002C274(v152, (uint64_t)&v153, &v154, *(uint64_t (**)(void))(v94 + 16));
      uint64_t v115 = (void *)v0;
      uint64_t v116 = *(void (**)(uint64_t, uint64_t))(v0 + 1600);
      uint64_t v129 = v115[160];
      uint64_t v130 = v115[120];
      swift_release();
      _os_log_impl((void *)&_mh_execute_header, v89, v90, "Computed addedTaskNames: %s", v96, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      uint64_t v119 = v129;
      uint64_t v120 = v130;
    }
    else
    {
      uint64_t v115 = (void *)v0;
      uint64_t v116 = *(void (**)(uint64_t, uint64_t))(v0 + 1600);
      uint64_t v117 = v115[160];
      uint64_t v118 = v115[120];
      swift_release();
      swift_release();
      swift_release();

      uint64_t v119 = v117;
      uint64_t v120 = v118;
    }
    v116(v119, v120);
    uint64_t v131 = async function pointer to dispatch thunk of MLHostClient.getTasks();
    uint64_t v132 = (void *)swift_task_alloc();
    v115[226] = v132;
    *uint64_t v132 = v115;
    v132[1] = sub_100010C8C;
    return ((uint64_t (*)(void))((char *)&async function pointer to dispatch thunk of MLHostClient.getTasks() + v131))();
  }
  else
  {
    uint64_t v138 = v68;
    v141 = v52;
    while (1)
    {
      *(void *)(v0 + 1768) = v86;
      *(void *)(v0 + 1760) = v68;
      *(void *)(v0 + 1752) = v144;
      *(void *)(v0 + 1744) = v52;
      uint64_t v99 = *(void *)(v0 + 824);
      sub_100030B2C(*(void *)(v0 + 1720)+ ((*(unsigned __int8 *)(v0 + 1944) + 32) & ~(unint64_t)*(unsigned __int8 *)(v0 + 1944))+ *(void *)(v0 + 1736) * v86, v99, type metadata accessor for TaskRecord);
      uint64_t v100 = *(void *)(v99 + 32);
      unint64_t v101 = *(void *)(v99 + 40);
      sub_1000062A0(v100, v101);
      sub_10002FED0(&qword_10003C8A8, (void (*)(uint64_t))&type metadata accessor for TaskDefinition);
      sub_100032430();
      if (!v21) {
        break;
      }
      os_log_t logc = *(os_log_t *)(v0 + 1440);
      uint64_t v102 = *(void *)(v0 + 1432);
      uint64_t v103 = *(void *)(v0 + 1288);
      uint64_t v104 = *(void *)(v0 + 960);
      uint64_t v105 = *(void *)(v0 + 752);
      uint64_t v106 = *(void *)(v0 + 744);
      uint64_t v107 = *(void *)(v0 + 728);
      swift_errorRelease();
      sub_100006248(v100, v101);
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v105 + 56))(v107, 1, 1, v106);
      sub_1000065E4(v107, &qword_10003C808);
      ((void (*)(uint64_t, uint64_t, uint64_t))logc)(v103, v102, v104);
      uint64_t v108 = sub_100032860();
      os_log_type_t v109 = sub_100032AA0();
      BOOL v110 = os_log_type_enabled(v108, v109);
      uint64_t v111 = *(void *)(v0 + 1288);
      uint64_t v112 = *(void *)(v0 + 960);
      uint64_t v113 = *(void *)(v0 + 824);
      if (v110)
      {
        id v114 = (uint8_t *)swift_slowAlloc();
        uint64_t v153 = 0;
        uint64_t v154 = 0;
        *(_WORD *)id v114 = 0;
        v152[0] = (uint64_t)(v114 + 2);
        uint64_t v21 = 0;
        sub_10002BCC0((uint64_t)_swiftEmptyArrayStorage, (uint64_t)v152, (uint64_t)&v153, (uint64_t)&v154);
        swift_bridgeObjectRelease();
        _os_log_impl((void *)&_mh_execute_header, v108, v109, "Failed to parse TaskDefinition from config file, skipping task.", v114, 2u);
        swift_slowDealloc();

        uint64_t v68 = v138;
        v138(v111, v112);
        sub_100030BD0(v113, type metadata accessor for TaskRecord);
      }
      else
      {
        swift_bridgeObjectRelease();

        uint64_t v68 = v138;
        v138(v111, v112);
        sub_100030BD0(v113, type metadata accessor for TaskRecord);
        uint64_t v21 = 0;
      }
      uint64_t v86 = *(void *)(v0 + 1768) + 1;
      uint64_t v52 = v141;
      if (v86 == *(void *)(v0 + 1728)) {
        goto LABEL_22;
      }
    }
    uint64_t v121 = *(void *)(v0 + 776);
    uint64_t v122 = *(void *)(v0 + 752);
    uint64_t v123 = *(void *)(v0 + 744);
    uint64_t v124 = *(void *)(v0 + 728);
    sub_100006248(v100, v101);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v122 + 56))(v124, 0, 1, v123);
    uint64_t v125 = *(void (**)(uint64_t, uint64_t, uint64_t))(v122 + 32);
    *(void *)(v0 + 1776) = v125;
    *(void *)(v0 + 1784) = (v122 + 32) & 0xFFFFFFFFFFFFLL | 0x48D8000000000000;
    v125(v121, v124, v123);
    uint64_t v126 = async function pointer to dispatch thunk of MLHostClient.addTask(taskDefinition:);
    uint64_t v127 = (void *)swift_task_alloc();
    *(void *)(v0 + 1792) = v127;
    *uint64_t v127 = v0;
    v127[1] = sub_10000F9A4;
    uint64_t v128 = *(void *)(v0 + 776);
    return ((uint64_t (*)(uint64_t))((char *)&async function pointer to dispatch thunk of MLHostClient.addTask(taskDefinition:)
                                            + v126))(v128);
  }
}

uint64_t sub_100010C8C(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 1816) = v1;
  swift_task_dealloc();
  if (v1)
  {
    swift_errorRelease();
    uint64_t v5 = sub_1000229A8;
  }
  else
  {
    *(void *)(v4 + 1824) = a1;
    uint64_t v5 = sub_100010DE4;
  }
  return _swift_task_switch(v5, 0, 0);
}

uint64_t sub_100010DE4()
{
  v807 = v0;
  uint64_t v1 = v0;
  uint64_t v2 = v0[228];
  uint64_t v3 = v0[227];
  uint64_t v4 = v0[214];
  uint64_t v5 = sub_1000300B8(v2);
  uint64_t v765 = v3;
  v1[229] = (uint64_t)v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = swift_allocObject();
  v1[230] = v6;
  swift_beginAccess();
  uint64_t v709 = v6;
  *(void *)(v6 + 16) = *(void *)(v4 + 16);
  uint64_t v7 = *((void *)v5 + 2);
  v713 = v1;
  if (v7)
  {
    uint64_t v8 = v1[84];
    uint64_t v9 = v1[75];
    uint64_t v11 = *(void (**)(void, void, void))(v8 + 16);
    v8 += 16;
    uint64_t v10 = (void (*)(uint64_t, char *, uint64_t))v11;
    uint64_t v12 = *(unsigned __int8 *)(v8 + 64);
    uint64_t v13 = &v5[(v12 + 32) & ~v12];
    v720 = (void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v14 = enum case for URL.DirectoryHint.inferFromPath(_:);
    v717 = (void (**)(uint64_t, uint64_t))(v1[71] + 8);
    v714 = (void (**)(uint64_t, uint64_t))(v9 + 8);
    uint64_t v764 = (v12 + 16) & ~v12;
    v745 = (void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16);
    uint64_t v767 = *(void *)(v8 + 56);
    v768 = (void (**)(uint64_t, uint64_t))(v8 - 8);
    v727 = (void (*)(uint64_t, uint64_t))v1[200];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v783 = v11;
    unsigned int v774 = v14;
    do
    {
      v795 = v13;
      v10(v1[89], v13, v1[83]);
      sub_1000326D0();
      if (v16)
      {
        uint64_t v794 = v7;
        uint64_t v17 = v1[72];
        (*v720)(v1[73], 1, 1, v1[74]);
        uint64_t v18 = sub_1000324E0();
        uint64_t v19 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 104);
        v19(v17, v14, v18);
        sub_100032520();
        uint64_t v20 = v14;
        if (qword_10003C3A0 != -1) {
          swift_once();
        }
        uint64_t v21 = v1[82];
        uint64_t v22 = v1[81];
        uint64_t v23 = v1[74];
        uint64_t v24 = v1[72];
        uint64_t v777 = v1[70];
        uint64_t v25 = *(void *)algn_10003C788;
        v1[20] = qword_10003C780;
        v1[21] = v25;
        v19(v24, v20, v18);
        sub_10002B8C0();
        swift_bridgeObjectRetain();
        sub_100032530();
        (*v717)(v24, v777);
        swift_bridgeObjectRelease();
        uint64_t v26 = *v714;
        (*v714)(v22, v23);
        sub_100032510(0);
        v26(v21, v23);
        id v27 = [self defaultManager];
        NSString v28 = sub_100032920();
        swift_bridgeObjectRelease();
        LODWORD(v22) = [v27 fileExistsAtPath:v28];

        if (v22)
        {
          uint64_t v29 = v1[89];
          uint64_t v30 = v1[88];
          uint64_t v31 = v1[83];
          ((void (*)(uint64_t, uint64_t, uint64_t))v1[180])(v1[159], v1[179], v1[120]);
          v783(v30, v29, v31);
          uint64_t v32 = swift_allocObject();
          (*v745)(v32 + v764, v30, v31);
          uint64_t v33 = sub_100032860();
          os_log_type_t v34 = sub_100032A80();
          uint64_t v35 = swift_allocObject();
          *(unsigned char *)(v35 + 16) = 32;
          uint64_t v36 = swift_allocObject();
          *(unsigned char *)(v36 + 16) = 8;
          uint64_t v37 = v1;
          uint64_t v38 = swift_allocObject();
          *(void *)(v38 + 16) = sub_10003050C;
          *(void *)(v38 + 24) = v32;
          uint64_t v39 = swift_allocObject();
          *(void *)(v39 + 16) = sub_100031B40;
          *(void *)(v39 + 24) = v38;
          uint64_t v40 = swift_allocObject();
          *(_OWORD *)(v40 + 16) = xmmword_100033B60;
          *(void *)(v40 + 32) = sub_100031D8C;
          *(void *)(v40 + 40) = v35;
          *(void *)(v40 + 48) = sub_100031D8C;
          *(void *)(v40 + 56) = v36;
          *(void *)(v40 + 64) = sub_100031B50;
          *(void *)(v40 + 72) = v39;
          swift_retain();
          swift_retain();
          swift_retain();
          swift_bridgeObjectRelease();
          uint64_t v7 = v794;
          if (os_log_type_enabled(v33, v34))
          {
            uint64_t v41 = (uint8_t *)swift_slowAlloc();
            uint64_t v42 = swift_slowAlloc();
            v805 = 0;
            v806[0] = v42;
            *(_WORD *)uint64_t v41 = 258;
            v41[2] = *(unsigned char *)(v35 + 16);
            if (v765) {
              goto LABEL_169;
            }
            swift_release();
            v41[3] = *(unsigned char *)(v36 + 16);
            v804[0] = (uint64_t)(v41 + 4);
            swift_release();
            sub_10002C274(v804, (uint64_t)&v805, v806, *(uint64_t (**)(void))(v39 + 16));
            uint64_t v1 = v713;
            uint64_t v43 = v713[159];
            uint64_t v44 = v713[120];
            swift_release();
            _os_log_impl((void *)&_mh_execute_header, v33, v34, "Assets already available. Skipping payload download for task: %s", v41, 0xCu);
            swift_arrayDestroy();
            swift_slowDealloc();
            swift_slowDealloc();

            v727(v43, v44);
          }
          else
          {
            uint64_t v68 = v37[159];
            uint64_t v69 = v37[120];
            swift_release();
            swift_release();
            swift_release();

            v727(v68, v69);
            uint64_t v1 = v37;
          }
          uint64_t v70 = sub_1000326E0();
          sub_10002C89C(v70, v71);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
        }
        else
        {
          uint64_t v7 = v794;
        }
        uint64_t v10 = (void (*)(uint64_t, char *, uint64_t))v783;
        uint64_t v15 = v795;
        uint64_t v14 = v774;
        (*v768)(v1[89], v1[83]);
      }
      else
      {
        uint64_t v45 = v1[89];
        uint64_t v46 = v1[88];
        uint64_t v47 = v1[83];
        ((void (*)(uint64_t, uint64_t, uint64_t))v1[180])(v1[158], v1[179], v1[120]);
        v10(v46, (char *)v45, v47);
        uint64_t v48 = swift_allocObject();
        (*v745)(v48 + v764, v46, v47);
        uint64_t v49 = sub_100032860();
        os_log_type_t v50 = sub_100032A90();
        uint64_t v51 = swift_allocObject();
        *(unsigned char *)(v51 + 16) = 32;
        uint64_t v52 = swift_allocObject();
        *(unsigned char *)(v52 + 16) = 8;
        uint64_t v53 = v1;
        uint64_t v54 = swift_allocObject();
        *(void *)(v54 + 16) = sub_10003050C;
        *(void *)(v54 + 24) = v48;
        uint64_t v55 = swift_allocObject();
        *(void *)(v55 + 16) = sub_100031B40;
        *(void *)(v55 + 24) = v54;
        uint64_t v56 = swift_allocObject();
        *(_OWORD *)(v56 + 16) = xmmword_100033B60;
        *(void *)(v56 + 32) = sub_100031D8C;
        *(void *)(v56 + 40) = v51;
        *(void *)(v56 + 48) = sub_100031D8C;
        *(void *)(v56 + 56) = v52;
        *(void *)(v56 + 64) = sub_100031B50;
        *(void *)(v56 + 72) = v55;
        swift_retain();
        swift_retain();
        swift_retain();
        swift_bridgeObjectRelease();
        if (os_log_type_enabled(v49, v50))
        {
          uint64_t v57 = (uint8_t *)swift_slowAlloc();
          uint64_t v58 = swift_slowAlloc();
          v805 = 0;
          v806[0] = v58;
          *(_WORD *)uint64_t v57 = 258;
          v57[2] = *(unsigned char *)(v51 + 16);
          if (v765) {
            goto LABEL_169;
          }
          swift_release();
          v57[3] = *(unsigned char *)(v52 + 16);
          v804[0] = (uint64_t)(v57 + 4);
          swift_release();
          sub_10002C274(v804, (uint64_t)&v805, v806, *(uint64_t (**)(void))(v55 + 16));
          Swift::Int v59 = (void (*)(uint64_t, uint64_t))v713[200];
          uint64_t v60 = v713[158];
          uint64_t v61 = v713[120];
          uint64_t v62 = v713[89];
          uint64_t v778 = v713[83];
          swift_release();
          _os_log_impl((void *)&_mh_execute_header, v49, v50, "Skipping registeredTask %s due to lack of taskFolder.", v57, 0xCu);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();

          v59(v60, v61);
          uint64_t v63 = v62;
          uint64_t v1 = v713;
          (*v768)(v63, v778);
          v727 = (void (*)(uint64_t, uint64_t))v713[200];
        }
        else
        {
          uint64_t v64 = v53[158];
          uint64_t v65 = v53[120];
          uint64_t v66 = v53[89];
          uint64_t v67 = v53[83];

          swift_release();
          swift_release();
          swift_release();
          v727(v64, v65);
          (*v768)(v66, v67);
          uint64_t v1 = v53;
        }
        uint64_t v10 = (void (*)(uint64_t, char *, uint64_t))v783;
        uint64_t v15 = v795;
        uint64_t v14 = v774;
      }
      uint64_t v13 = &v15[v767];
      --v7;
    }
    while (v7);
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRetain();
  }
  ((void (*)(uint64_t, uint64_t, uint64_t))v1[180])(v1[157], v1[179], v1[120]);
  uint64_t v72 = swift_allocObject();
  *(void *)(v72 + 16) = sub_10002FFA8;
  *(void *)(v72 + 24) = v709;
  swift_retain();
  char v73 = sub_100032860();
  os_log_type_t v74 = sub_100032A80();
  uint64_t v75 = swift_allocObject();
  *(unsigned char *)(v75 + 16) = 32;
  uint64_t v76 = swift_allocObject();
  *(unsigned char *)(v76 + 16) = 8;
  uint64_t v77 = swift_allocObject();
  *(void *)(v77 + 16) = sub_10002F988;
  *(void *)(v77 + 24) = v72;
  uint64_t v78 = swift_allocObject();
  *(void *)(v78 + 16) = sub_100031B40;
  *(void *)(v78 + 24) = v77;
  uint64_t v79 = swift_allocObject();
  *(_OWORD *)(v79 + 16) = xmmword_100033B60;
  *(void *)(v79 + 32) = sub_100031D8C;
  *(void *)(v79 + 40) = v75;
  *(void *)(v79 + 48) = sub_100031D8C;
  *(void *)(v79 + 56) = v76;
  *(void *)(v79 + 64) = sub_100031B50;
  *(void *)(v79 + 72) = v78;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRelease();
  if (os_log_type_enabled(v73, v74))
  {
    double v80 = (uint8_t *)swift_slowAlloc();
    uint64_t v81 = swift_slowAlloc();
    v805 = 0;
    v806[0] = v81;
    *(_WORD *)double v80 = 258;
    uint64_t v80[2] = *(unsigned char *)(v75 + 16);
    if (v765) {
      goto LABEL_169;
    }
    swift_release();
    v80[3] = *(unsigned char *)(v76 + 16);
    v804[0] = (uint64_t)(v80 + 4);
    swift_release();
    sub_10002C274(v804, (uint64_t)&v805, v806, *(uint64_t (**)(void))(v78 + 16));
    uint64_t v82 = (void (*)(uint64_t, uint64_t))v1[200];
    uint64_t v83 = v1[157];
    uint64_t v84 = v713[120];
    swift_release();
    _os_log_impl((void *)&_mh_execute_header, v73, v74, "Computed payloadsTaskNames: %s", v80, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    uint64_t v1 = v713;
    v82(v83, v84);
  }
  else
  {
    uint64_t v85 = (void (*)(uint64_t, uint64_t))v1[200];
    uint64_t v86 = v1[157];
    uint64_t v87 = v1[120];
    swift_release();
    swift_release();
    swift_release();

    v85(v86, v87);
  }
  uint64_t v88 = v1[214];
  uint64_t v89 = swift_allocObject();
  v1[231] = v89;
  type metadata accessor for TaskParametersRecord(0);
  *(void *)(v89 + 16) = _swiftEmptyArrayStorage;
  if (*(void *)(*(void *)(v88 + 16) + 16))
  {
    os_log_type_t v90 = (void (*)(uint64_t, uint64_t, uint64_t))v1[180];
    uint64_t v91 = v1[179];
    uint64_t v92 = v1[156];
    uint64_t v93 = v1[120];
    swift_bridgeObjectRelease();
    v90(v92, v91, v93);
    uint64_t v94 = swift_allocObject();
    *(void *)(v94 + 16) = sub_1000305E8;
    *(void *)(v94 + 24) = v88;
    swift_retain();
    uint64_t v95 = sub_100032860();
    os_log_type_t v96 = sub_100032A80();
    uint64_t v97 = swift_allocObject();
    *(unsigned char *)(v97 + 16) = 32;
    uint64_t v98 = swift_allocObject();
    *(unsigned char *)(v98 + 16) = 8;
    uint64_t v99 = swift_allocObject();
    *(void *)(v99 + 16) = sub_100030604;
    *(void *)(v99 + 24) = v94;
    uint64_t v100 = swift_allocObject();
    *(void *)(v100 + 16) = sub_100031B40;
    *(void *)(v100 + 24) = v99;
    uint64_t v101 = swift_allocObject();
    *(_OWORD *)(v101 + 16) = xmmword_100033B60;
    *(void *)(v101 + 32) = sub_100031D8C;
    *(void *)(v101 + 40) = v97;
    *(void *)(v101 + 48) = sub_100031D8C;
    *(void *)(v101 + 56) = v98;
    *(void *)(v101 + 64) = sub_100031B50;
    *(void *)(v101 + 72) = v100;
    swift_retain();
    swift_retain();
    swift_retain();
    swift_bridgeObjectRelease();
    if (os_log_type_enabled(v95, v96))
    {
      uint64_t v102 = (uint8_t *)swift_slowAlloc();
      uint64_t v103 = swift_slowAlloc();
      v805 = 0;
      v806[0] = v103;
      *(_WORD *)uint64_t v102 = 258;
      v102[2] = *(unsigned char *)(v97 + 16);
      if (v765) {
        goto LABEL_169;
      }
      swift_release();
      v102[3] = *(unsigned char *)(v98 + 16);
      v804[0] = (uint64_t)(v102 + 4);
      swift_release();
      sub_10002C274(v804, (uint64_t)&v805, v806, *(uint64_t (**)(void))(v100 + 16));
      uint64_t v104 = (void (*)(uint64_t, uint64_t))v713[200];
      uint64_t v105 = v713[156];
      uint64_t v106 = v713[120];
      swift_release();
      _os_log_impl((void *)&_mh_execute_header, v95, v96, "Querying TaskParameters for added tasks: %s", v102, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      uint64_t v1 = v713;
      v104(v105, v106);
    }
    else
    {
      os_log_type_t v168 = (void (*)(uint64_t, uint64_t))v1[200];
      uint64_t v169 = v1[156];
      uint64_t v170 = v1[120];
      swift_release();
      swift_release();
      swift_release();

      v168(v169, v170);
    }
    uint64_t v171 = v1[203];
    uint64_t v172 = (void *)v1[195];
    v173 = (void *)v1[194];
    uint64_t v174 = v1[193];
    uint64_t v175 = swift_allocObject();
    *(_OWORD *)(v175 + 16) = xmmword_100033B80;
    *(void *)(v175 + 56) = &type metadata for String;
    *(void *)(v175 + 64) = v171;
    *(void *)(v175 + 32) = 0x656D614E6B736174;
    *(void *)(v175 + 40) = 0xE800000000000000;
    swift_bridgeObjectRetain();
    uint64_t v176 = sub_100028D2C();
    swift_bridgeObjectRelease();
    *(void *)(v175 + 96) = sub_100005644(&qword_10003C8B0);
    *(void *)(v175 + 104) = sub_100031A24(&qword_10003C8B8, &qword_10003C8B0);
    *(void *)(v175 + 72) = v176;
    v177 = (NSPredicate *)sub_100032A70();
    v809._countAndFlagsBits = 0x617261506B736154;
    v809._object = (void *)0xEE0073726574656DLL;
    Class isa = sub_100032AB0(v809, v177).super.isa;
    v1[232] = (uint64_t)isa;
    uint64_t v179 = swift_task_alloc();
    v1[233] = v179;
    *(void *)(v179 + 16) = isa;
    *(void *)(v179 + 24) = v174;
    uint64_t v180 = swift_task_alloc();
    v1[234] = v180;
    *(void *)(v180 + 16) = &unk_10003C8C8;
    *(void *)(v180 + 24) = v179;
    id v181 = v172;
    id v182 = v173;
    v183 = (void *)swift_task_alloc();
    v1[235] = (uint64_t)v183;
    void *v183 = v1;
    v183[1] = sub_100017BFC;
    uint64_t v184 = v1[212];
    uint64_t v185 = v1 + 22;
    uint64_t v186 = &unk_10003C8D0;
LABEL_84:
    return CKDatabase.configuredWith<A>(configuration:group:body:)(v185, v181, v182, v186, v180, v184);
  }
  uint64_t v107 = _swiftEmptyArrayStorage[2];
  if (v107)
  {
    uint64_t v108 = &_swiftEmptyArrayStorage[6];
    uint64_t v769 = v1[69];
    v779 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v1[65] + 48);
    v784 = (void (*)(uint64_t, uint64_t))v1[200];
    do
    {
      uint64_t v111 = (void *)*((void *)v108 - 1);
      if (*v108)
      {
        uint64_t v796 = v107;
        ((void (*)(uint64_t, uint64_t, uint64_t))v1[180])(v1[153], v1[179], v1[120]);
        uint64_t v112 = swift_allocObject();
        *(void *)(v112 + 16) = v111;
        sub_10002FF18(v111, 1);
        sub_10002FF18(v111, 1);
        swift_errorRetain();
        uint64_t v113 = sub_100032860();
        os_log_type_t v114 = sub_100032AA0();
        uint64_t v115 = swift_allocObject();
        *(unsigned char *)(v115 + 16) = 64;
        uint64_t v116 = swift_allocObject();
        *(unsigned char *)(v116 + 16) = 8;
        uint64_t v117 = swift_allocObject();
        *(void *)(v117 + 16) = sub_100031D84;
        *(void *)(v117 + 24) = v112;
        uint64_t v118 = swift_allocObject();
        *(void *)(v118 + 16) = sub_10002FE30;
        *(void *)(v118 + 24) = v117;
        uint64_t v119 = swift_allocObject();
        *(void *)(v119 + 16) = sub_100031B4C;
        *(void *)(v119 + 24) = v118;
        uint64_t v120 = swift_allocObject();
        *(_OWORD *)(v120 + 16) = xmmword_100033B60;
        *(void *)(v120 + 32) = sub_100031D8C;
        *(void *)(v120 + 40) = v115;
        *(void *)(v120 + 48) = sub_100031D8C;
        *(void *)(v120 + 56) = v116;
        *(void *)(v120 + 64) = sub_100031B54;
        *(void *)(v120 + 72) = v119;
        swift_retain();
        swift_retain();
        swift_retain();
        swift_bridgeObjectRelease();
        if (os_log_type_enabled(v113, v114))
        {
          uint64_t v121 = (uint8_t *)swift_slowAlloc();
          v805 = (void *)swift_slowAlloc();
          v806[0] = 0;
          *(_WORD *)uint64_t v121 = 258;
          v121[2] = *(unsigned char *)(v115 + 16);
          if (v765) {
            goto LABEL_169;
          }
          swift_release();
          v121[3] = *(unsigned char *)(v116 + 16);
          v804[0] = (uint64_t)(v121 + 4);
          swift_release();
          sub_10002C320(v804, &v805, (uint64_t)v806, *(uint64_t (**)(void))(v119 + 16));
          uint64_t v1 = v713;
          v785 = (void (*)(uint64_t, uint64_t))v713[200];
          uint64_t v122 = v713[153];
          uint64_t v123 = v713[120];
          swift_release();
          _os_log_impl((void *)&_mh_execute_header, v113, v114, "Error: %@", v121, 0xCu);
          sub_100005644(&qword_10003C8A0);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();

          sub_10002FF64(v111, 1);
          sub_10002FF64(v111, 1);
          v785(v122, v123);
          v784 = (void (*)(uint64_t, uint64_t))v713[200];
        }
        else
        {
          uint64_t v145 = v1[153];
          uint64_t v146 = v1[120];
          sub_10002FF64(v111, 1);
          swift_release();
          swift_release();
          swift_release();

          sub_10002FF64(v111, 1);
          v784(v145, v146);
        }
        uint64_t v147 = v1[188];
        uint64_t v148 = *(void *)(v147 + 72);
        BOOL v149 = __OFADD__(v148, 1);
        uint64_t v150 = v148 + 1;
        uint64_t v107 = v796;
        if (v149)
        {
          __break(1u);
LABEL_182:
          __break(1u);
LABEL_183:
          __break(1u);
LABEL_184:
          __break(1u);
        }
        *(void *)(v147 + 72) = v150;
      }
      else
      {
        uint64_t v124 = v1[63];
        uint64_t v125 = v1[64];
        sub_10002FF18(*((void **)v108 - 1), 0);
        sub_10002FF18(v111, 0);
        id v126 = v111;
        sub_100003B00(v126, v124);
        if ((*v779)(v124, 1, v125) == 1)
        {
          uint64_t v797 = v107;
          uint64_t v127 = (void (*)(uint64_t, uint64_t, uint64_t))v1[180];
          uint64_t v128 = v1[179];
          uint64_t v129 = v1[154];
          uint64_t v130 = v1[120];
          sub_1000065E4(v1[63], &qword_10003C800);
          v127(v129, v128, v130);
          uint64_t v131 = swift_allocObject();
          *(void *)(v131 + 16) = v126;
          id v132 = v126;
          uint64_t v133 = sub_100032860();
          os_log_type_t v134 = sub_100032AA0();
          uint64_t v135 = swift_allocObject();
          *(unsigned char *)(v135 + 16) = 64;
          uint64_t v136 = swift_allocObject();
          *(unsigned char *)(v136 + 16) = 8;
          uint64_t v137 = v1;
          uint64_t v138 = swift_allocObject();
          *(void *)(v138 + 16) = sub_100031D88;
          *(void *)(v138 + 24) = v131;
          uint64_t v139 = swift_allocObject();
          *(void *)(v139 + 16) = sub_100031B4C;
          *(void *)(v139 + 24) = v138;
          uint64_t v140 = swift_allocObject();
          *(_OWORD *)(v140 + 16) = xmmword_100033B60;
          *(void *)(v140 + 32) = sub_100031D8C;
          *(void *)(v140 + 40) = v135;
          *(void *)(v140 + 48) = sub_100031D8C;
          *(void *)(v140 + 56) = v136;
          *(void *)(v140 + 64) = sub_100031B54;
          *(void *)(v140 + 72) = v139;
          swift_retain();
          swift_retain();
          swift_retain();
          swift_bridgeObjectRelease();
          if (os_log_type_enabled(v133, v134))
          {
            v141 = v133;
            os_log_type_t v142 = (uint8_t *)swift_slowAlloc();
            v805 = (void *)swift_slowAlloc();
            v806[0] = 0;
            *(_WORD *)os_log_type_t v142 = 258;
            v142[2] = *(unsigned char *)(v135 + 16);
            if (v765) {
              goto LABEL_169;
            }
            swift_release();
            v142[3] = *(unsigned char *)(v136 + 16);
            v804[0] = (uint64_t)(v142 + 4);
            swift_release();
            sub_10002C320(v804, &v805, (uint64_t)v806, *(uint64_t (**)(void))(v139 + 16));
            uint64_t v143 = v713[154];
            uint64_t v144 = v713[120];
            swift_release();
            _os_log_impl((void *)&_mh_execute_header, v141, v134, "Skipping record: %@", v142, 0xCu);
            sub_100005644(&qword_10003C8A0);
            swift_arrayDestroy();
            uint64_t v1 = v713;
            swift_slowDealloc();
            swift_slowDealloc();

            sub_10002FF64(v111, 0);
            sub_10002FF64(v111, 0);
            v784(v143, v144);
            uint64_t v765 = 0;
          }
          else
          {
            uint64_t v109 = v137[154];
            uint64_t v110 = v137[120];
            sub_10002FF64(v111, 0);
            swift_release();
            swift_release();
            swift_release();

            sub_10002FF64(v111, 0);
            v784(v109, v110);
            uint64_t v1 = v137;
          }
          goto LABEL_33;
        }
        uint64_t v151 = v1[214];
        uint64_t v152 = (uint64_t *)v1[69];
        sub_100031468(v1[63], (uint64_t)v152, type metadata accessor for TaskParametersRecord);
        uint64_t v153 = *(void *)(v151 + 16);
        uint64_t v154 = *v152;
        uint64_t v155 = *(void *)(v769 + 8);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        LOBYTE(v154) = sub_100028604(v154, v155, v153);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v154 & 1) == 0)
        {
          uint64_t v797 = v107;
          ((void (*)(uint64_t, uint64_t, uint64_t))v1[180])(v1[155], v1[179], v1[120]);
          uint64_t v161 = sub_100032860();
          os_log_type_t v162 = sub_100032A90();
          BOOL v163 = os_log_type_enabled(v161, v162);
          uint64_t v164 = v1[155];
          uint64_t v165 = v1[120];
          uint64_t v166 = v1[69];
          if (v163)
          {
            v167 = (uint8_t *)swift_slowAlloc();
            v805 = 0;
            v806[0] = 0;
            *(_WORD *)v167 = 0;
            v804[0] = (uint64_t)(v167 + 2);
            sub_10002BCC0((uint64_t)_swiftEmptyArrayStorage, (uint64_t)v804, (uint64_t)&v805, (uint64_t)v806);
            swift_bridgeObjectRelease();
            _os_log_impl((void *)&_mh_execute_header, v161, v162, "Skipping taskParametersRecord because associated with an unavailable taskName.", v167, 2u);
            swift_slowDealloc();
          }
          else
          {
            swift_bridgeObjectRelease();
          }

          sub_10002FF64(v111, 0);
          sub_10002FF64(v111, 0);
          v784(v164, v165);
          sub_100030BD0(v166, type metadata accessor for TaskParametersRecord);
LABEL_33:
          uint64_t v107 = v797;
          goto LABEL_34;
        }
        uint64_t v156 = v1[188];
        uint64_t v157 = v1[69];
        uint64_t v158 = v1[68];
        sub_100030B2C(v157, v158, type metadata accessor for TaskParametersRecord);
        sub_10002894C(v158);
        sub_10002FF64(v111, 0);
        sub_10002FF64(v111, 0);
        sub_100030BD0(v157, type metadata accessor for TaskParametersRecord);
        uint64_t v159 = *(void *)(v156 + 64);
        BOOL v149 = __OFADD__(v159, 1);
        uint64_t v160 = v159 + 1;
        if (v149) {
          goto LABEL_183;
        }
        *(void *)(v1[188] + 64) = v160;
      }
LABEL_34:
      v108 += 24;
      --v107;
    }
    while (v107);
  }
  uint64_t v187 = v1[230];
  swift_bridgeObjectRelease();
  uint64_t v188 = swift_allocObject();
  v1[237] = v188;
  type metadata accessor for TaskPayloadRecord(0);
  *(void *)(v188 + 16) = _swiftEmptyArrayStorage;
  swift_beginAccess();
  if (*(void *)(*(void *)(v187 + 16) + 16))
  {
    uint64_t v189 = v1[230];
    v190 = (void (*)(uint64_t, uint64_t, uint64_t))v1[180];
    uint64_t v191 = v1[179];
    uint64_t v192 = v1[152];
    uint64_t v193 = v1[120];
    swift_bridgeObjectRelease();
    v190(v192, v191, v193);
    uint64_t v194 = swift_allocObject();
    *(void *)(v194 + 16) = sub_1000305E8;
    *(void *)(v194 + 24) = v189;
    swift_retain();
    v195 = sub_100032860();
    os_log_type_t v196 = sub_100032A80();
    uint64_t v197 = swift_allocObject();
    *(unsigned char *)(v197 + 16) = 32;
    uint64_t v198 = swift_allocObject();
    *(unsigned char *)(v198 + 16) = 8;
    uint64_t v199 = swift_allocObject();
    *(void *)(v199 + 16) = sub_100030604;
    *(void *)(v199 + 24) = v194;
    uint64_t v200 = swift_allocObject();
    *(void *)(v200 + 16) = sub_100031B40;
    *(void *)(v200 + 24) = v199;
    uint64_t v201 = swift_allocObject();
    *(_OWORD *)(v201 + 16) = xmmword_100033B60;
    *(void *)(v201 + 32) = sub_100031D8C;
    *(void *)(v201 + 40) = v197;
    *(void *)(v201 + 48) = sub_100031D8C;
    *(void *)(v201 + 56) = v198;
    *(void *)(v201 + 64) = sub_100031B50;
    *(void *)(v201 + 72) = v200;
    swift_retain();
    swift_retain();
    swift_retain();
    swift_bridgeObjectRelease();
    if (os_log_type_enabled(v195, v196))
    {
      v202 = (uint8_t *)swift_slowAlloc();
      uint64_t v203 = swift_slowAlloc();
      v805 = 0;
      v806[0] = v203;
      *(_WORD *)v202 = 258;
      v202[2] = *(unsigned char *)(v197 + 16);
      if (v765) {
        goto LABEL_169;
      }
      swift_release();
      v202[3] = *(unsigned char *)(v198 + 16);
      v804[0] = (uint64_t)(v202 + 4);
      swift_release();
      sub_10002C274(v804, (uint64_t)&v805, v806, *(uint64_t (**)(void))(v200 + 16));
      uint64_t v204 = (void (*)(uint64_t, uint64_t))v713[200];
      uint64_t v205 = v713[152];
      uint64_t v206 = v713[120];
      swift_release();
      _os_log_impl((void *)&_mh_execute_header, v195, v196, "Querying TaskPayloads for new tasks: %s", v202, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      uint64_t v1 = v713;
      v204(v205, v206);
    }
    else
    {
      v267 = (void (*)(uint64_t, uint64_t))v1[200];
      uint64_t v268 = v1[152];
      uint64_t v269 = v1[120];
      swift_release();
      swift_release();
      swift_release();

      v267(v268, v269);
    }
    uint64_t v270 = v1[203];
    v271 = (void *)v1[195];
    v272 = (void *)v1[194];
    uint64_t v273 = v1[193];
    uint64_t v274 = swift_allocObject();
    *(_OWORD *)(v274 + 16) = xmmword_100033B80;
    *(void *)(v274 + 56) = &type metadata for String;
    *(void *)(v274 + 64) = v270;
    *(void *)(v274 + 32) = 0x656D614E6B736174;
    *(void *)(v274 + 40) = 0xE800000000000000;
    swift_bridgeObjectRetain();
    uint64_t v275 = sub_100028D2C();
    swift_bridgeObjectRelease();
    *(void *)(v274 + 96) = sub_100005644(&qword_10003C8B0);
    *(void *)(v274 + 104) = sub_100031A24(&qword_10003C8B8, &qword_10003C8B0);
    *(void *)(v274 + 72) = v275;
    v276 = (NSPredicate *)sub_100032A70();
    v810._countAndFlagsBits = 0x6C7961506B736154;
    v810._object = (void *)0xEC0000007364616FLL;
    Class v277 = sub_100032AB0(v810, v276).super.isa;
    v1[238] = (uint64_t)v277;
    uint64_t v278 = swift_task_alloc();
    v1[239] = v278;
    *(void *)(v278 + 16) = v277;
    *(void *)(v278 + 24) = v273;
    uint64_t v180 = swift_task_alloc();
    v1[240] = v180;
    *(void *)(v180 + 16) = &unk_10003C8E0;
    *(void *)(v180 + 24) = v278;
    id v181 = v271;
    id v182 = v272;
    v279 = (void *)swift_task_alloc();
    v1[241] = (uint64_t)v279;
    void *v279 = v1;
    v279[1] = sub_10001DA40;
    uint64_t v184 = v1[212];
    uint64_t v185 = v1 + 26;
    uint64_t v186 = &unk_10003C8E8;
    goto LABEL_84;
  }
  uint64_t v207 = _swiftEmptyArrayStorage[2];
  if (v207)
  {
    v208 = &_swiftEmptyArrayStorage[6];
    uint64_t v770 = v1[62];
    v780 = (unsigned int (**)(void *, uint64_t, uint64_t))(v1[58] + 48);
    v786 = (void (*)(uint64_t, uint64_t))v1[200];
    do
    {
      uint64_t v211 = (void *)*((void *)v208 - 1);
      if (*v208)
      {
        uint64_t v798 = v207;
        ((void (*)(uint64_t, uint64_t, uint64_t))v1[180])(v1[149], v1[179], v1[120]);
        uint64_t v212 = swift_allocObject();
        *(void *)(v212 + 16) = v211;
        sub_10002FF18(v211, 1);
        sub_10002FF18(v211, 1);
        swift_errorRetain();
        uint64_t v213 = sub_100032860();
        os_log_type_t v214 = sub_100032AA0();
        uint64_t v215 = swift_allocObject();
        *(unsigned char *)(v215 + 16) = 64;
        uint64_t v216 = swift_allocObject();
        *(unsigned char *)(v216 + 16) = 8;
        uint64_t v217 = swift_allocObject();
        *(void *)(v217 + 16) = sub_100031D84;
        *(void *)(v217 + 24) = v212;
        uint64_t v218 = swift_allocObject();
        *(void *)(v218 + 16) = sub_10002FE30;
        *(void *)(v218 + 24) = v217;
        uint64_t v219 = swift_allocObject();
        *(void *)(v219 + 16) = sub_100031B4C;
        *(void *)(v219 + 24) = v218;
        uint64_t v220 = swift_allocObject();
        *(_OWORD *)(v220 + 16) = xmmword_100033B60;
        *(void *)(v220 + 32) = sub_100031D8C;
        *(void *)(v220 + 40) = v215;
        *(void *)(v220 + 48) = sub_100031D8C;
        *(void *)(v220 + 56) = v216;
        *(void *)(v220 + 64) = sub_100031B54;
        *(void *)(v220 + 72) = v219;
        swift_retain();
        swift_retain();
        swift_retain();
        swift_bridgeObjectRelease();
        if (os_log_type_enabled(v213, v214))
        {
          v221 = (uint8_t *)swift_slowAlloc();
          v805 = (void *)swift_slowAlloc();
          v806[0] = 0;
          *(_WORD *)v221 = 258;
          v221[2] = *(unsigned char *)(v215 + 16);
          if (v765) {
            goto LABEL_169;
          }
          swift_release();
          v221[3] = *(unsigned char *)(v216 + 16);
          v804[0] = (uint64_t)(v221 + 4);
          swift_release();
          sub_10002C320(v804, &v805, (uint64_t)v806, *(uint64_t (**)(void))(v219 + 16));
          uint64_t v1 = v713;
          v787 = (void (*)(uint64_t, uint64_t))v713[200];
          uint64_t v222 = v713[149];
          uint64_t v223 = v713[120];
          swift_release();
          _os_log_impl((void *)&_mh_execute_header, v213, v214, "Error: %@", v221, 0xCu);
          sub_100005644(&qword_10003C8A0);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();

          sub_10002FF64(v211, 1);
          sub_10002FF64(v211, 1);
          v787(v222, v223);
          v786 = (void (*)(uint64_t, uint64_t))v713[200];
        }
        else
        {
          uint64_t v245 = v1[149];
          uint64_t v246 = v1[120];
          sub_10002FF64(v211, 1);
          swift_release();
          swift_release();
          swift_release();

          sub_10002FF64(v211, 1);
          v786(v245, v246);
        }
        uint64_t v247 = v1[188];
        uint64_t v248 = *(void *)(v247 + 96);
        BOOL v149 = __OFADD__(v248, 1);
        uint64_t v249 = v248 + 1;
        uint64_t v207 = v798;
        if (v149) {
          goto LABEL_182;
        }
        *(void *)(v247 + 96) = v249;
      }
      else
      {
        uint64_t v224 = (void *)v1[56];
        uint64_t v225 = v1[57];
        sub_10002FF18(*((void **)v208 - 1), 0);
        sub_10002FF18(v211, 0);
        id v226 = v211;
        sub_100004B70(v226, v224);
        if ((*v780)(v224, 1, v225) == 1)
        {
          uint64_t v799 = v207;
          uint64_t v227 = (void (*)(uint64_t, uint64_t, uint64_t))v1[180];
          uint64_t v228 = v1[179];
          uint64_t v229 = v1[150];
          uint64_t v230 = v1[120];
          sub_1000065E4(v1[56], &qword_10003C7F8);
          v227(v229, v228, v230);
          uint64_t v231 = swift_allocObject();
          *(void *)(v231 + 16) = v226;
          id v232 = v226;
          v233 = sub_100032860();
          os_log_type_t v234 = sub_100032AA0();
          uint64_t v235 = swift_allocObject();
          *(unsigned char *)(v235 + 16) = 64;
          uint64_t v236 = swift_allocObject();
          *(unsigned char *)(v236 + 16) = 8;
          v237 = v1;
          uint64_t v238 = swift_allocObject();
          *(void *)(v238 + 16) = sub_100031D88;
          *(void *)(v238 + 24) = v231;
          uint64_t v239 = swift_allocObject();
          *(void *)(v239 + 16) = sub_100031B4C;
          *(void *)(v239 + 24) = v238;
          uint64_t v240 = swift_allocObject();
          *(_OWORD *)(v240 + 16) = xmmword_100033B60;
          *(void *)(v240 + 32) = sub_100031D8C;
          *(void *)(v240 + 40) = v235;
          *(void *)(v240 + 48) = sub_100031D8C;
          *(void *)(v240 + 56) = v236;
          *(void *)(v240 + 64) = sub_100031B54;
          *(void *)(v240 + 72) = v239;
          swift_retain();
          swift_retain();
          swift_retain();
          swift_bridgeObjectRelease();
          if (os_log_type_enabled(v233, v234))
          {
            v241 = v233;
            unint64_t v242 = (uint8_t *)swift_slowAlloc();
            v805 = (void *)swift_slowAlloc();
            v806[0] = 0;
            *(_WORD *)unint64_t v242 = 258;
            v242[2] = *(unsigned char *)(v235 + 16);
            if (v765) {
              goto LABEL_169;
            }
            swift_release();
            v242[3] = *(unsigned char *)(v236 + 16);
            v804[0] = (uint64_t)(v242 + 4);
            swift_release();
            sub_10002C320(v804, &v805, (uint64_t)v806, *(uint64_t (**)(void))(v239 + 16));
            uint64_t v243 = v713[150];
            uint64_t v244 = v713[120];
            swift_release();
            _os_log_impl((void *)&_mh_execute_header, v241, v234, "Skipping record: %@", v242, 0xCu);
            sub_100005644(&qword_10003C8A0);
            swift_arrayDestroy();
            uint64_t v1 = v713;
            swift_slowDealloc();
            swift_slowDealloc();

            sub_10002FF64(v211, 0);
            sub_10002FF64(v211, 0);
            v786(v243, v244);
            uint64_t v765 = 0;
          }
          else
          {
            uint64_t v209 = v237[150];
            uint64_t v210 = v237[120];
            sub_10002FF64(v211, 0);
            swift_release();
            swift_release();
            swift_release();

            sub_10002FF64(v211, 0);
            v786(v209, v210);
            uint64_t v1 = v237;
          }
          goto LABEL_62;
        }
        uint64_t v250 = v1[214];
        v251 = (uint64_t *)v1[62];
        sub_100031468(v1[56], (uint64_t)v251, type metadata accessor for TaskPayloadRecord);
        uint64_t v252 = *(void *)(v250 + 16);
        uint64_t v253 = *v251;
        uint64_t v254 = *(void *)(v770 + 8);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        LOBYTE(v253) = sub_100028604(v253, v254, v252);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v253 & 1) == 0)
        {
          uint64_t v799 = v207;
          ((void (*)(uint64_t, uint64_t, uint64_t))v1[180])(v1[151], v1[179], v1[120]);
          uint64_t v260 = sub_100032860();
          os_log_type_t v261 = sub_100032A90();
          BOOL v262 = os_log_type_enabled(v260, v261);
          uint64_t v263 = v1[151];
          uint64_t v264 = v1[120];
          uint64_t v265 = v1[62];
          if (v262)
          {
            v266 = (uint8_t *)swift_slowAlloc();
            v805 = 0;
            v806[0] = 0;
            *(_WORD *)v266 = 0;
            v804[0] = (uint64_t)(v266 + 2);
            sub_10002BCC0((uint64_t)_swiftEmptyArrayStorage, (uint64_t)v804, (uint64_t)&v805, (uint64_t)v806);
            swift_bridgeObjectRelease();
            _os_log_impl((void *)&_mh_execute_header, v260, v261, "Skipping taskPayloadRecord because associated with an unavailable taskName.", v266, 2u);
            swift_slowDealloc();
          }
          else
          {
            swift_bridgeObjectRelease();
          }

          sub_10002FF64(v211, 0);
          sub_10002FF64(v211, 0);
          v786(v263, v264);
          sub_100030BD0(v265, type metadata accessor for TaskPayloadRecord);
LABEL_62:
          uint64_t v207 = v799;
          goto LABEL_63;
        }
        uint64_t v255 = v1[188];
        uint64_t v256 = v1[61];
        uint64_t v257 = v1[62];
        sub_100030B2C(v257, v256, type metadata accessor for TaskPayloadRecord);
        sub_100028ABC(v256);
        sub_10002FF64(v211, 0);
        sub_10002FF64(v211, 0);
        sub_100030BD0(v257, type metadata accessor for TaskPayloadRecord);
        uint64_t v258 = *(void *)(v255 + 88);
        BOOL v149 = __OFADD__(v258, 1);
        uint64_t v259 = v258 + 1;
        if (v149) {
          goto LABEL_184;
        }
        *(void *)(v1[188] + 88) = v259;
      }
LABEL_63:
      v208 += 24;
      --v207;
    }
    while (v207);
  }
  uint64_t v280 = v1[231];
  v281 = (void (*)(uint64_t, uint64_t, uint64_t))v1[180];
  uint64_t v282 = v1[179];
  uint64_t v283 = v1[148];
  uint64_t v284 = v1[120];
  swift_bridgeObjectRelease();
  v281(v283, v282, v284);
  uint64_t v285 = swift_allocObject();
  *(void *)(v285 + 16) = sub_10002FFA8;
  *(void *)(v285 + 24) = v280;
  swift_retain();
  v286 = sub_100032860();
  os_log_type_t v287 = sub_100032A80();
  uint64_t v288 = swift_allocObject();
  *(unsigned char *)(v288 + 16) = 32;
  uint64_t v289 = swift_allocObject();
  *(unsigned char *)(v289 + 16) = 8;
  uint64_t v290 = swift_allocObject();
  *(void *)(v290 + 16) = sub_1000309E8;
  *(void *)(v290 + 24) = v285;
  uint64_t v291 = swift_allocObject();
  *(void *)(v291 + 16) = sub_100031B40;
  *(void *)(v291 + 24) = v290;
  uint64_t v292 = swift_allocObject();
  *(_OWORD *)(v292 + 16) = xmmword_100033B60;
  *(void *)(v292 + 32) = sub_100031D8C;
  *(void *)(v292 + 40) = v288;
  *(void *)(v292 + 48) = sub_100031D8C;
  *(void *)(v292 + 56) = v289;
  *(void *)(v292 + 64) = sub_100031B50;
  *(void *)(v292 + 72) = v291;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRelease();
  if (os_log_type_enabled(v286, v287))
  {
    v293 = (uint8_t *)swift_slowAlloc();
    uint64_t v294 = swift_slowAlloc();
    v805 = 0;
    v806[0] = v294;
    *(_WORD *)v293 = 258;
    v293[2] = *(unsigned char *)(v288 + 16);
    if (v765) {
      goto LABEL_169;
    }
    swift_release();
    v293[3] = *(unsigned char *)(v289 + 16);
    v804[0] = (uint64_t)(v293 + 4);
    swift_release();
    sub_10002C274(v804, (uint64_t)&v805, v806, *(uint64_t (**)(void))(v291 + 16));
    uint64_t v295 = v1[148];
    uint64_t v296 = v1[121];
    uint64_t v297 = v1[120];
    swift_release();
    _os_log_impl((void *)&_mh_execute_header, v286, v287, "Processing TaskParametersRecords: %s", v293, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    v298 = *(void (**)(uint64_t, uint64_t))(v296 + 8);
    v298(v295, v297);
  }
  else
  {
    uint64_t v299 = v1[148];
    uint64_t v300 = v1[121];
    uint64_t v301 = v1[120];
    swift_release();
    swift_release();
    swift_release();

    v298 = *(void (**)(uint64_t, uint64_t))(v300 + 8);
    v298(v299, v301);
  }
  uint64_t v302 = v1[231];
  swift_beginAccess();
  uint64_t v303 = *(void *)(v302 + 16);
  uint64_t v304 = *(void *)(v303 + 16);
  if (!v304) {
    goto LABEL_116;
  }
  uint64_t v305 = v1[84];
  uint64_t v306 = v1[75];
  uint64_t v721 = v1[67];
  uint64_t v307 = v1[65];
  uint64_t v308 = *(unsigned __int8 *)(v307 + 80);
  uint64_t v309 = v303 + ((v308 + 32) & ~v308);
  v788 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v305 + 48);
  v736 = (void (**)(uint64_t, uint64_t, uint64_t))(v305 + 32);
  v718 = (void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v306 + 56);
  v715 = (void (**)(uint64_t, uint64_t))(v1[71] + 8);
  v746 = (void (**)(uint64_t, uint64_t))(v306 + 8);
  uint64_t v710 = v306;
  v775 = (void (**)(uint64_t, uint64_t))(v1[121] + 8);
  v733 = (void (**)(uint64_t, uint64_t))(v305 + 8);
  uint64_t v771 = (v308 + 16) & ~v308;
  uint64_t v781 = *(void *)(v307 + 72);
  unsigned int v310 = enum case for URL.DirectoryHint.inferFromPath(_:);
  swift_bridgeObjectRetain();
  unsigned int v711 = v310;
  do
  {
    uint64_t v315 = v1[229];
    uint64_t v316 = v1[83];
    uint64_t v317 = v1[67];
    uint64_t v318 = v1[55];
    sub_100030B2C(v309, v317, type metadata accessor for TaskParametersRecord);
    *(void *)(swift_task_alloc() + 16) = v317;
    sub_100028F5C((uint64_t (*)(char *))sub_100030A38, v315, v318);
    swift_task_dealloc();
    uint64_t v790 = v304;
    uint64_t v800 = v309;
    if ((*v788)(v318, 1, v316) == 1)
    {
      v319 = v298;
      v320 = v1;
      v321 = (void (*)(uint64_t, uint64_t, uint64_t))v1[180];
      uint64_t v322 = v320[179];
      uint64_t v323 = v320[146];
      uint64_t v324 = v320[120];
      uint64_t v325 = v320[68];
      uint64_t v326 = v320[67];
      sub_1000065E4(v320[55], &qword_10003C7F0);
      v321(v323, v322, v324);
      sub_100030B2C(v326, v325, type metadata accessor for TaskParametersRecord);
      uint64_t v327 = swift_allocObject();
      sub_100031468(v325, v327 + v771, type metadata accessor for TaskParametersRecord);
      v328 = sub_100032860();
      os_log_type_t v329 = sub_100032AA0();
      uint64_t v330 = swift_allocObject();
      *(unsigned char *)(v330 + 16) = 32;
      uint64_t v331 = swift_allocObject();
      *(unsigned char *)(v331 + 16) = 8;
      uint64_t v332 = swift_allocObject();
      *(void *)(v332 + 16) = sub_100030A5C;
      *(void *)(v332 + 24) = v327;
      uint64_t v333 = swift_allocObject();
      *(void *)(v333 + 16) = sub_100031B40;
      *(void *)(v333 + 24) = v332;
      uint64_t v334 = swift_allocObject();
      *(_OWORD *)(v334 + 16) = xmmword_100033B60;
      *(void *)(v334 + 32) = sub_100031D8C;
      *(void *)(v334 + 40) = v330;
      *(void *)(v334 + 48) = sub_100031D8C;
      *(void *)(v334 + 56) = v331;
      *(void *)(v334 + 64) = sub_100031B50;
      *(void *)(v334 + 72) = v333;
      swift_retain();
      swift_retain();
      swift_retain();
      swift_bridgeObjectRelease();
      if (os_log_type_enabled(v328, v329))
      {
        v335 = (uint8_t *)swift_slowAlloc();
        uint64_t v336 = swift_slowAlloc();
        v805 = 0;
        v806[0] = v336;
        *(_WORD *)v335 = 258;
        v335[2] = *(unsigned char *)(v330 + 16);
        if (v765) {
          goto LABEL_169;
        }
        swift_release();
        v335[3] = *(unsigned char *)(v331 + 16);
        v804[0] = (uint64_t)(v335 + 4);
        swift_release();
        sub_10002C274(v804, (uint64_t)&v805, v806, *(uint64_t (**)(void))(v333 + 16));
        v320 = v713;
        uint64_t v337 = v713[146];
        uint64_t v338 = v713[120];
        swift_release();
        _os_log_impl((void *)&_mh_execute_header, v328, v329, "Task %s not registered on the system. Skipping task.", v335, 0xCu);
        swift_arrayDestroy();
        uint64_t v1 = v713;
        swift_slowDealloc();
        swift_slowDealloc();

        v298 = v319;
        v319(v337, v338);
      }
      else
      {
        uint64_t v311 = v320[146];
        uint64_t v312 = v320[120];
        swift_release();
        swift_release();
        swift_release();

        v298(v311, v312);
        uint64_t v1 = v320;
      }
      uint64_t v313 = v320[67];
      goto LABEL_95;
    }
    (*v736)(v1[87], v1[55], v1[83]);
    sub_1000326D0();
    if (!v339)
    {
      v383 = v298;
      uint64_t v384 = v1[68];
      uint64_t v385 = v1[67];
      ((void (*)(uint64_t, uint64_t, uint64_t))v1[180])(v1[147], v1[179], v1[120]);
      sub_100030B2C(v385, v384, type metadata accessor for TaskParametersRecord);
      uint64_t v386 = swift_allocObject();
      sub_100031468(v384, v386 + v771, type metadata accessor for TaskParametersRecord);
      v387 = sub_100032860();
      os_log_type_t v388 = sub_100032AA0();
      uint64_t v389 = swift_allocObject();
      *(unsigned char *)(v389 + 16) = 32;
      uint64_t v390 = swift_allocObject();
      *(unsigned char *)(v390 + 16) = 8;
      uint64_t v391 = swift_allocObject();
      *(void *)(v391 + 16) = sub_100030A5C;
      *(void *)(v391 + 24) = v386;
      uint64_t v392 = swift_allocObject();
      *(void *)(v392 + 16) = sub_100031B40;
      *(void *)(v392 + 24) = v391;
      uint64_t v393 = swift_allocObject();
      *(_OWORD *)(v393 + 16) = xmmword_100033B60;
      *(void *)(v393 + 32) = sub_100031D8C;
      *(void *)(v393 + 40) = v389;
      *(void *)(v393 + 48) = sub_100031D8C;
      *(void *)(v393 + 56) = v390;
      *(void *)(v393 + 64) = sub_100031B50;
      *(void *)(v393 + 72) = v392;
      swift_retain();
      swift_retain();
      swift_retain();
      swift_bridgeObjectRelease();
      if (os_log_type_enabled(v387, v388))
      {
        v394 = (uint8_t *)swift_slowAlloc();
        uint64_t v395 = swift_slowAlloc();
        v805 = 0;
        v806[0] = v395;
        *(_WORD *)v394 = 258;
        v394[2] = *(unsigned char *)(v389 + 16);
        if (v765) {
          goto LABEL_169;
        }
        swift_release();
        v394[3] = *(unsigned char *)(v390 + 16);
        v804[0] = (uint64_t)(v394 + 4);
        swift_release();
        sub_10002C274(v804, (uint64_t)&v805, v806, *(uint64_t (**)(void))(v392 + 16));
        v396 = v713;
        uint64_t v397 = v713[147];
        uint64_t v398 = v713[120];
        uint64_t v399 = v713[87];
        uint64_t v762 = v713[83];
        swift_release();
        _os_log_impl((void *)&_mh_execute_header, v387, v388, "Task %s doesn't have a valid taskFolder. Skipping task.", v394, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        v383(v397, v398);
        v298 = v383;
        (*v733)(v399, v762);
      }
      else
      {
        uint64_t v408 = v1[147];
        uint64_t v409 = v1[120];
        uint64_t v410 = v1[87];
        v396 = v1;
        uint64_t v411 = v1[83];

        swift_release();
        swift_release();
        swift_release();
        v383(v408, v409);
        uint64_t v412 = v410;
        v298 = v383;
        (*v733)(v412, v411);
      }
      uint64_t v313 = v396[67];
      uint64_t v1 = v396;
      goto LABEL_95;
    }
    v752 = v298;
    uint64_t v340 = v1[72];
    (*v718)(v1[73], 1, 1, v1[74]);
    uint64_t v341 = sub_1000324E0();
    v342 = v1;
    v343 = *(void (**)(uint64_t, void, uint64_t))(*(void *)(v341 - 8) + 104);
    v343(v340, v711, v341);
    sub_100032520();
    if (qword_10003C3A8 != -1) {
      swift_once();
    }
    uint64_t v344 = v342[82];
    uint64_t v760 = v342[74];
    uint64_t v345 = v342[72];
    uint64_t v346 = v342[70];
    uint64_t v347 = *(void *)algn_10003C798;
    v342[18] = qword_10003C790;
    v342[19] = v347;
    v343(v345, v711, v341);
    sub_10002B8C0();
    swift_bridgeObjectRetain();
    sub_100032530();
    (*v715)(v345, v346);
    swift_bridgeObjectRelease();
    v348 = *v746;
    (*v746)(v344, v760);
    uint64_t v349 = *(void *)(v721 + 32);
    unint64_t v350 = *(void *)(v721 + 40);
    sub_1000062A0(v349, v350);
    sub_100032550();
    uint64_t v1 = v342;
    if (!v765)
    {
      uint64_t v400 = v342[87];
      uint64_t v401 = v342[83];
      uint64_t v402 = v1[80];
      uint64_t v403 = v1[74];
      uint64_t v313 = v1[67];
      sub_100006248(v349, v350);
      v348(v402, v403);
      (*v733)(v400, v401);
      uint64_t v765 = 0;
      v298 = v752;
LABEL_95:
      uint64_t v314 = v790;
      goto LABEL_96;
    }
    v728 = v348;
    v351 = (void (*)(uint64_t, uint64_t, uint64_t))v342[180];
    uint64_t v352 = v1[179];
    uint64_t v353 = v1[124];
    uint64_t v354 = v1[120];
    uint64_t v355 = v1[82];
    uint64_t v356 = v1[80];
    uint64_t v357 = v1[74];
    sub_100006248(v349, v350);
    v351(v353, v352, v354);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v710 + 16))(v355, v356, v357);
    unint64_t v358 = (*(unsigned __int8 *)(v710 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v710 + 80);
    uint64_t v359 = swift_allocObject();
    (*(void (**)(unint64_t, uint64_t, uint64_t))(v710 + 32))(v359 + v358, v355, v357);
    uint64_t v360 = swift_allocObject();
    *(void *)(v360 + 16) = sub_100030E08;
    *(void *)(v360 + 24) = v359;
    uint64_t v361 = swift_allocObject();
    *(void *)(v361 + 16) = v765;
    swift_errorRetain();
    uint64_t v362 = sub_100032860();
    LOBYTE(v353) = sub_100032AA0();
    uint64_t v363 = swift_allocObject();
    *(unsigned char *)(v363 + 16) = 32;
    uint64_t v364 = swift_allocObject();
    *(unsigned char *)(v364 + 16) = 8;
    uint64_t v365 = swift_allocObject();
    *(void *)(v365 + 16) = sub_100031B44;
    *(void *)(v365 + 24) = v360;
    uint64_t v366 = swift_allocObject();
    *(void *)(v366 + 16) = sub_100031B40;
    *(void *)(v366 + 24) = v365;
    uint64_t v367 = swift_allocObject();
    *(unsigned char *)(v367 + 16) = 64;
    uint64_t v368 = swift_allocObject();
    *(unsigned char *)(v368 + 16) = 8;
    v369 = v362;
    uint64_t v370 = swift_allocObject();
    *(void *)(v370 + 16) = sub_100031D84;
    *(void *)(v370 + 24) = v361;
    uint64_t v371 = swift_allocObject();
    *(void *)(v371 + 16) = sub_10002FE30;
    *(void *)(v371 + 24) = v370;
    uint64_t v372 = swift_allocObject();
    *(void *)(v372 + 16) = sub_100031B4C;
    *(void *)(v372 + 24) = v371;
    uint64_t v373 = swift_allocObject();
    *(_OWORD *)(v373 + 16) = xmmword_100033B70;
    *(void *)(v373 + 32) = sub_100031D8C;
    *(void *)(v373 + 40) = v363;
    *(void *)(v373 + 48) = sub_100031D8C;
    *(void *)(v373 + 56) = v364;
    *(void *)(v373 + 64) = sub_100031B50;
    *(void *)(v373 + 72) = v366;
    *(void *)(v373 + 80) = sub_100031D8C;
    *(void *)(v373 + 88) = v367;
    *(void *)(v373 + 96) = sub_100031D8C;
    *(void *)(v373 + 104) = v368;
    *(void *)(v373 + 112) = sub_100031B54;
    *(void *)(v373 + 120) = v372;
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_bridgeObjectRelease();
    os_log_type_t v374 = v353;
    v761 = v369;
    if (os_log_type_enabled(v369, (os_log_type_t)v353))
    {
      v375 = (uint8_t *)swift_slowAlloc();
      v376 = (void *)swift_slowAlloc();
      uint64_t v753 = swift_slowAlloc();
      v805 = v376;
      v806[0] = v753;
      *(_WORD *)v375 = 514;
      v375[2] = *(unsigned char *)(v363 + 16);
      swift_release();
      v375[3] = *(unsigned char *)(v364 + 16);
      v804[0] = (uint64_t)(v375 + 4);
      swift_release();
      sub_10002C274(v804, (uint64_t)&v805, v806, *(uint64_t (**)(void))(v366 + 16));
      swift_release();
      uint64_t v377 = v804[0];
      *(unsigned char *)v804[0] = *(unsigned char *)(v367 + 16);
      swift_release();
      *(unsigned char *)(v377 + 1) = *(unsigned char *)(v368 + 16);
      v804[0] = v377 + 2;
      swift_release();
      sub_10002C320(v804, &v805, (uint64_t)v806, *(uint64_t (**)(void))(v372 + 16));
      uint64_t v378 = v713[124];
      uint64_t v379 = v713[120];
      uint64_t v702 = v713[87];
      uint64_t v380 = v713[83];
      uint64_t v381 = v713[80];
      uint64_t v382 = v713[74];
      swift_release();
      _os_log_impl((void *)&_mh_execute_header, v761, v374, "Failed at writing taskParamFile: %s : %@", v375, 0x16u);
      sub_100005644(&qword_10003C8A0);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      swift_errorRelease();
      v298 = *v775;
      (*v775)(v378, v379);
      v728(v381, v382);
      (*v733)(v702, v380);
    }
    else
    {
      uint64_t v404 = v713[124];
      uint64_t v405 = v713[120];
      uint64_t v406 = v713[87];
      uint64_t v754 = v713[83];
      uint64_t v407 = v713[80];
      uint64_t v703 = v713[74];

      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_errorRelease();
      v298 = *v775;
      (*v775)(v404, v405);
      v728(v407, v703);
      (*v733)(v406, v754);
    }
    uint64_t v314 = v790;
    uint64_t v765 = 0;
    uint64_t v1 = v713;
    uint64_t v313 = v713[67];
LABEL_96:
    sub_100030BD0(v313, type metadata accessor for TaskParametersRecord);
    uint64_t v309 = v800 + v781;
    uint64_t v304 = v314 - 1;
  }
  while (v304);
  swift_bridgeObjectRelease();
LABEL_116:
  uint64_t v413 = v1[237];
  ((void (*)(uint64_t, uint64_t, uint64_t))v1[180])(v1[145], v1[179], v1[120]);
  uint64_t v414 = swift_allocObject();
  *(void *)(v414 + 16) = sub_10002FFA8;
  *(void *)(v414 + 24) = v413;
  swift_retain();
  v415 = sub_100032860();
  os_log_type_t v416 = sub_100032A80();
  uint64_t v417 = swift_allocObject();
  *(unsigned char *)(v417 + 16) = 32;
  uint64_t v418 = swift_allocObject();
  *(unsigned char *)(v418 + 16) = 8;
  uint64_t v419 = swift_allocObject();
  *(void *)(v419 + 16) = sub_100030ADC;
  *(void *)(v419 + 24) = v414;
  uint64_t v420 = swift_allocObject();
  *(void *)(v420 + 16) = sub_100031B40;
  *(void *)(v420 + 24) = v419;
  uint64_t v421 = swift_allocObject();
  *(_OWORD *)(v421 + 16) = xmmword_100033B60;
  *(void *)(v421 + 32) = sub_100031D8C;
  *(void *)(v421 + 40) = v417;
  *(void *)(v421 + 48) = sub_100031D8C;
  *(void *)(v421 + 56) = v418;
  *(void *)(v421 + 64) = sub_100031B50;
  *(void *)(v421 + 72) = v420;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRelease();
  if (os_log_type_enabled(v415, v416))
  {
    v422 = (uint8_t *)swift_slowAlloc();
    uint64_t v423 = swift_slowAlloc();
    v805 = 0;
    v806[0] = v423;
    *(_WORD *)v422 = 258;
    v422[2] = *(unsigned char *)(v417 + 16);
    if (!v765)
    {
      swift_release();
      v422[3] = *(unsigned char *)(v418 + 16);
      v804[0] = (uint64_t)(v422 + 4);
      swift_release();
      sub_10002C274(v804, (uint64_t)&v805, v806, *(uint64_t (**)(void))(v420 + 16));
      uint64_t v424 = v1[145];
      uint64_t v425 = v1[120];
      swift_release();
      _os_log_impl((void *)&_mh_execute_header, v415, v416, "Processing TaskPayloadRecords: %s", v422, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      v298(v424, v425);
      goto LABEL_120;
    }
LABEL_169:
    return swift_errorRelease();
  }
  uint64_t v426 = v1[145];
  uint64_t v427 = v1[120];
  swift_release();
  swift_release();
  swift_release();

  v298(v426, v427);
LABEL_120:
  uint64_t v428 = v1[237];
  swift_beginAccess();
  uint64_t v429 = *(void *)(v428 + 16);
  uint64_t v430 = *(void *)(v429 + 16);
  if (!v430)
  {
LABEL_166:
    v651 = (void (*)(uint64_t, uint64_t))v1[186];
    uint64_t v652 = v1[115];
    uint64_t v653 = v1[109];
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_1000325A0();
    sub_100032560();
    uint64_t v655 = v654;
    v651(v652, v653);
    sub_100031AE8(0, &qword_10003C828);
    id v656 = sub_100027BB0(0xD000000000000010, 0x8000000100034010);
    if (v656)
    {
      v657 = v656;
      v759 = v298;
      ((void (*)(uint64_t, uint64_t, uint64_t))v1[180])(v1[138], v1[179], v1[120]);
      uint64_t v658 = swift_allocObject();
      *(void *)(v658 + 16) = v655;
      v659 = sub_100032860();
      os_log_type_t v660 = sub_100032A80();
      uint64_t v661 = swift_allocObject();
      *(unsigned char *)(v661 + 16) = 0;
      uint64_t v662 = swift_allocObject();
      *(unsigned char *)(v662 + 16) = 8;
      v663 = v1;
      uint64_t v664 = swift_allocObject();
      *(void *)(v664 + 16) = sub_100031B60;
      *(void *)(v664 + 24) = v658;
      uint64_t v665 = swift_allocObject();
      *(void *)(v665 + 16) = sub_100030C60;
      *(void *)(v665 + 24) = v664;
      uint64_t v666 = swift_allocObject();
      *(_OWORD *)(v666 + 16) = xmmword_100033B60;
      *(void *)(v666 + 32) = sub_100031D8C;
      *(void *)(v666 + 40) = v661;
      *(void *)(v666 + 48) = sub_100031D8C;
      *(void *)(v666 + 56) = v662;
      *(void *)(v666 + 64) = sub_100030C88;
      *(void *)(v666 + 72) = v665;
      swift_retain();
      swift_retain();
      swift_retain();
      swift_bridgeObjectRelease();
      if (os_log_type_enabled(v659, v660))
      {
        uint64_t v667 = swift_slowAlloc();
        *(_WORD *)uint64_t v667 = 256;
        *(unsigned char *)(v667 + 2) = *(unsigned char *)(v661 + 16);
        if (v765) {
          goto LABEL_169;
        }
        v679 = (uint8_t *)v667;
        swift_release();
        v679[3] = *(unsigned char *)(v662 + 16);
        uint64_t v680 = swift_release();
        v806[0] = (*(double (**)(uint64_t))(v665 + 16))(v680);
        sub_100032AF0();
        uint64_t v1 = v713;
        uint64_t v681 = v713[138];
        uint64_t v682 = v713[120];
        swift_release();
        _os_log_impl((void *)&_mh_execute_header, v659, v660, "Marking lastSuccessTimestamp: %f", v679, 0xCu);
        swift_slowDealloc();

        v759(v681, v682);
      }
      else
      {
        uint64_t v668 = v663[138];
        uint64_t v669 = v663[120];
        swift_release();
        swift_release();
        swift_release();

        v298(v668, v669);
        uint64_t v1 = v663;
      }
      Class v683 = sub_100032A10().super.super.isa;
      NSString v684 = sub_100032920();
      [v657 setValue:v683 forKey:v684];
    }
    v685 = (void *)v1[195];
    v686 = (void *)v1[194];
    v687 = (void *)v1[193];
    v688 = (void *)v1[192];
    v689 = (void *)v1[191];
    v690 = (void *)v1[190];
    uint64_t v691 = v1[188];
    uint64_t v803 = v1[119];
    uint64_t v692 = v1[118];
    uint64_t v793 = v1[117];
    id v693 = objc_allocWithZone((Class)sub_100032780());
    uint64_t v696 = sub_100032770();

    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    sub_100027C1C(v691);
    (*(void (**)(uint64_t, uint64_t))(v692 + 8))(v803, v793);
    goto LABEL_178;
  }
  v704 = v1 + 40;
  v697 = v1 + 42;
  uint64_t v431 = v1[84];
  uint64_t v432 = v1[75];
  uint64_t v433 = v1[58];
  uint64_t v434 = *(unsigned __int8 *)(v433 + 80);
  uint64_t v435 = v429 + ((v434 + 32) & ~v434);
  v782 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v431 + 48);
  v719 = (void (**)(uint64_t, uint64_t, uint64_t))(v431 + 32);
  v712 = (void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v432 + 56);
  v705 = (void (**)(uint64_t, uint64_t))(v1[71] + 8);
  v763 = (void (**)(uint64_t, uint64_t))(v432 + 8);
  uint64_t v701 = v432;
  v789 = (void (**)(uint64_t, uint64_t))(v1[121] + 8);
  v716 = (void (**)(uint64_t, uint64_t))(v431 + 8);
  uint64_t v772 = (v434 + 16) & ~v434;
  uint64_t v776 = *(void *)(v433 + 72);
  swift_bridgeObjectRetain();
  while (2)
  {
    sub_100030B2C(v435, v1[60], type metadata accessor for TaskPayloadRecord);
    char v442 = sub_100032A00();
    uint64_t v443 = v1[229];
    if ((v442 & 1) == 0)
    {
      uint64_t v444 = v1[83];
      uint64_t v445 = v1[60];
      uint64_t v446 = v1[54];
      *(void *)(swift_task_alloc() + 16) = v445;
      sub_100028F5C((uint64_t (*)(char *))sub_100031B24, v443, v446);
      swift_task_dealloc();
      uint64_t v801 = v430;
      uint64_t v791 = v435;
      if ((*v782)(v446, 1, v444) == 1)
      {
        v447 = v298;
        v448 = (void (*)(uint64_t, uint64_t, uint64_t))v1[180];
        uint64_t v449 = v1[179];
        uint64_t v450 = v1[139];
        uint64_t v451 = v1[120];
        uint64_t v453 = v1[60];
        uint64_t v452 = v1[61];
        sub_1000065E4(v1[54], &qword_10003C7F0);
        v448(v450, v449, v451);
        sub_100030B2C(v453, v452, type metadata accessor for TaskPayloadRecord);
        uint64_t v454 = swift_allocObject();
        sub_100031468(v452, v454 + v772, type metadata accessor for TaskPayloadRecord);
        v455 = sub_100032860();
        os_log_type_t v456 = sub_100032AA0();
        uint64_t v457 = swift_allocObject();
        *(unsigned char *)(v457 + 16) = 32;
        uint64_t v458 = swift_allocObject();
        *(unsigned char *)(v458 + 16) = 8;
        uint64_t v459 = swift_allocObject();
        *(void *)(v459 + 16) = sub_100030B98;
        *(void *)(v459 + 24) = v454;
        uint64_t v460 = swift_allocObject();
        *(void *)(v460 + 16) = sub_100031B40;
        *(void *)(v460 + 24) = v459;
        uint64_t v461 = swift_allocObject();
        *(_OWORD *)(v461 + 16) = xmmword_100033B60;
        *(void *)(v461 + 32) = sub_100031D8C;
        *(void *)(v461 + 40) = v457;
        *(void *)(v461 + 48) = sub_100031D8C;
        *(void *)(v461 + 56) = v458;
        *(void *)(v461 + 64) = sub_100031B50;
        *(void *)(v461 + 72) = v460;
        swift_retain();
        swift_retain();
        swift_retain();
        swift_bridgeObjectRelease();
        if (os_log_type_enabled(v455, v456))
        {
          v462 = (uint8_t *)swift_slowAlloc();
          uint64_t v463 = swift_slowAlloc();
          v805 = 0;
          v806[0] = v463;
          *(_WORD *)v462 = 258;
          v462[2] = *(unsigned char *)(v457 + 16);
          if (v765) {
            goto LABEL_169;
          }
          swift_release();
          v462[3] = *(unsigned char *)(v458 + 16);
          v804[0] = (uint64_t)(v462 + 4);
          swift_release();
          sub_10002C274(v804, (uint64_t)&v805, v806, *(uint64_t (**)(void))(v460 + 16));
          uint64_t v464 = v1[139];
          uint64_t v465 = v1[120];
          swift_release();
          _os_log_impl((void *)&_mh_execute_header, v455, v456, "Task %s not registered on the system. Skipping task.", v462, 0xCu);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();

          uint64_t v466 = v464;
          uint64_t v467 = v465;
        }
        else
        {
          uint64_t v502 = v1[139];
          uint64_t v503 = v1[120];
          swift_release();
          swift_release();
          swift_release();

          uint64_t v466 = v502;
          uint64_t v467 = v503;
        }
        v447(v466, v467);
        uint64_t v440 = v1[60];
        uint64_t v441 = v801;
        v298 = v447;
LABEL_125:
        sub_100030BD0(v440, type metadata accessor for TaskPayloadRecord);
        uint64_t v435 = v791 + v776;
        uint64_t v430 = v441 - 1;
        if (!v430)
        {
          swift_bridgeObjectRelease();
          goto LABEL_166;
        }
        continue;
      }
      (*v719)(v1[86], v1[54], v1[83]);
      sub_1000326D0();
      if (v468)
      {
        uint64_t v469 = v1[72];
        v706 = *v712;
        (*v712)(v1[73], 1, 1, v1[74]);
        sub_100028CB8(v469);
        sub_100032520();
        if (qword_10003C3A0 != -1) {
          swift_once();
        }
        uint64_t v470 = v1[82];
        uint64_t v471 = v1[74];
        uint64_t v472 = v1[72];
        uint64_t v473 = v1[70];
        uint64_t v474 = *(void *)algn_10003C788;
        v1[16] = qword_10003C780;
        v1[17] = v474;
        sub_100028CB8(v472);
        sub_10002B8C0();
        swift_bridgeObjectRetain();
        sub_100032530();
        v475 = *v705;
        (*v705)(v472, v473);
        swift_bridgeObjectRelease();
        v722 = *v763;
        (*v763)(v470, v471);
        id v700 = self;
        id v476 = [v700 defaultManager];
        sub_100032510(0);
        NSString v477 = sub_100032920();
        swift_bridgeObjectRelease();
        v1[40] = 0;
        LODWORD(v472) = [v476 createDirectoryAtPath:v477 withIntermediateDirectories:1 attributes:0 error:v704];

        v478 = v1;
        v479 = (void *)v1[40];
        v723 = (void (*)(uint64_t, uint64_t, uint64_t))v478[180];
        uint64_t v480 = v478[179];
        uint64_t v481 = v478[120];
        uint64_t v738 = v478[82];
        uint64_t v482 = v478[74];
        if (!v472)
        {
          uint64_t v522 = v478[123];
          uint64_t v523 = v478[79];
          id v524 = v479;
          uint64_t v525 = sub_1000324D0();

          swift_willThrow();
          v723(v522, v480, v481);
          (*(void (**)(uint64_t, uint64_t, uint64_t))(v701 + 16))(v738, v523, v482);
          unint64_t v526 = (*(unsigned __int8 *)(v701 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v701 + 80);
          uint64_t v527 = swift_allocObject();
          (*(void (**)(unint64_t, uint64_t, uint64_t))(v701 + 32))(v527 + v526, v738, v482);
          uint64_t v528 = swift_allocObject();
          *(void *)(v528 + 16) = sub_100030E08;
          *(void *)(v528 + 24) = v527;
          uint64_t v529 = swift_allocObject();
          *(void *)(v529 + 16) = v525;
          swift_errorRetain();
          v530 = sub_100032860();
          os_log_type_t v756 = sub_100032AA0();
          uint64_t v531 = swift_allocObject();
          *(unsigned char *)(v531 + 16) = 32;
          uint64_t v532 = swift_allocObject();
          *(unsigned char *)(v532 + 16) = 8;
          uint64_t v533 = swift_allocObject();
          *(void *)(v533 + 16) = sub_100030E20;
          *(void *)(v533 + 24) = v528;
          uint64_t v534 = swift_allocObject();
          *(void *)(v534 + 16) = sub_100031B40;
          *(void *)(v534 + 24) = v533;
          uint64_t v535 = swift_allocObject();
          *(unsigned char *)(v535 + 16) = 64;
          uint64_t v536 = swift_allocObject();
          *(unsigned char *)(v536 + 16) = 8;
          uint64_t v537 = swift_allocObject();
          *(void *)(v537 + 16) = sub_100031D84;
          *(void *)(v537 + 24) = v529;
          uint64_t v538 = swift_allocObject();
          *(void *)(v538 + 16) = sub_10002FE30;
          *(void *)(v538 + 24) = v537;
          uint64_t v539 = swift_allocObject();
          *(void *)(v539 + 16) = sub_100031B4C;
          *(void *)(v539 + 24) = v538;
          uint64_t v540 = swift_allocObject();
          *(_OWORD *)(v540 + 16) = xmmword_100033B70;
          *(void *)(v540 + 32) = sub_100031D8C;
          *(void *)(v540 + 40) = v531;
          *(void *)(v540 + 48) = sub_100031D8C;
          *(void *)(v540 + 56) = v532;
          *(void *)(v540 + 64) = sub_100031B50;
          *(void *)(v540 + 72) = v534;
          *(void *)(v540 + 80) = sub_100031D8C;
          *(void *)(v540 + 88) = v535;
          *(void *)(v540 + 96) = sub_100031D8C;
          *(void *)(v540 + 104) = v536;
          *(void *)(v540 + 112) = sub_100031B54;
          *(void *)(v540 + 120) = v539;
          swift_retain();
          swift_retain();
          swift_retain();
          swift_retain();
          swift_retain();
          swift_retain();
          swift_bridgeObjectRelease();
          os_log_type_t v541 = v756;
          v757 = v530;
          if (os_log_type_enabled(v530, v541))
          {
            v542 = (uint8_t *)swift_slowAlloc();
            v740 = (void *)swift_slowAlloc();
            uint64_t v748 = swift_slowAlloc();
            v805 = v740;
            v806[0] = v748;
            *(_WORD *)v542 = 514;
            v542[2] = *(unsigned char *)(v531 + 16);
            swift_release();
            v542[3] = *(unsigned char *)(v532 + 16);
            v804[0] = (uint64_t)(v542 + 4);
            swift_release();
            sub_10002C274(v804, (uint64_t)&v805, v806, *(uint64_t (**)(void))(v534 + 16));
            swift_release();
            uint64_t v543 = v804[0];
            *(unsigned char *)v804[0] = *(unsigned char *)(v535 + 16);
            swift_release();
            *(unsigned char *)(v543 + 1) = *(unsigned char *)(v536 + 16);
            v804[0] = v543 + 2;
            swift_release();
            sub_10002C320(v804, &v805, (uint64_t)v806, *(uint64_t (**)(void))(v539 + 16));
            uint64_t v544 = v478[123];
            uint64_t v545 = v478[120];
            uint64_t v546 = v478[86];
            uint64_t v547 = v478[83];
            uint64_t v548 = v478[79];
            uint64_t v549 = v478[74];
            swift_release();
            _os_log_impl((void *)&_mh_execute_header, v757, v541, "Failed at creating taskAssetsURL: %s : %@", v542, 0x16u);
            sub_100005644(&qword_10003C8A0);
            swift_arrayDestroy();
            swift_slowDealloc();
            swift_arrayDestroy();
            swift_slowDealloc();
            swift_slowDealloc();

            swift_errorRelease();
            uint64_t v550 = v544;
            v298 = *v789;
            (*v789)(v550, v545);
            v722(v548, v549);
            (*v716)(v546, v547);
          }
          else
          {
            uint64_t v436 = v478[123];
            uint64_t v437 = v478[120];
            uint64_t v747 = v478[86];
            uint64_t v737 = v478[83];
            uint64_t v734 = v478[79];
            uint64_t v438 = v478[74];

            swift_release();
            swift_release();
            swift_release();
            swift_release();
            swift_release();
            swift_release();
            swift_errorRelease();
            v439 = *v789;
            (*v789)(v436, v437);
            v298 = v439;
            v722(v734, v438);
            (*v716)(v747, v737);
          }
          uint64_t v765 = 0;
          uint64_t v440 = v478[60];
          uint64_t v1 = v478;
          goto LABEL_124;
        }
        v698 = v475;
        v755 = v298;
        uint64_t v699 = v478[143];
        uint64_t v483 = v478[78];
        uint64_t v484 = v478[72];
        v706(v478[73], 1, 1, v482);
        sub_100028CB8(v484);
        id v485 = v479;
        swift_bridgeObjectRetain();
        sub_100032520();
        v723(v699, v480, v481);
        uint64_t v486 = v738;
        v724 = *(void (**)(uint64_t, uint64_t, uint64_t))(v701 + 16);
        v724(v738, v483, v482);
        unint64_t v487 = (*(unsigned __int8 *)(v701 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v701 + 80);
        uint64_t v488 = swift_allocObject();
        v739 = *(void (**)(unint64_t, uint64_t, uint64_t))(v701 + 32);
        v739(v488 + v487, v486, v482);
        uint64_t v489 = swift_allocObject();
        *(void *)(v489 + 16) = sub_100030E08;
        *(void *)(v489 + 24) = v488;
        v490 = sub_100032860();
        os_log_type_t v491 = sub_100032A80();
        uint64_t v492 = swift_allocObject();
        *(unsigned char *)(v492 + 16) = 32;
        uint64_t v493 = swift_allocObject();
        *(unsigned char *)(v493 + 16) = 8;
        uint64_t v494 = swift_allocObject();
        *(void *)(v494 + 16) = sub_100031B44;
        *(void *)(v494 + 24) = v489;
        uint64_t v495 = swift_allocObject();
        *(void *)(v495 + 16) = sub_100031B40;
        *(void *)(v495 + 24) = v494;
        uint64_t v496 = swift_allocObject();
        *(_OWORD *)(v496 + 16) = xmmword_100033B60;
        *(void *)(v496 + 32) = sub_100031D8C;
        *(void *)(v496 + 40) = v492;
        *(void *)(v496 + 48) = sub_100031D8C;
        *(void *)(v496 + 56) = v493;
        *(void *)(v496 + 64) = sub_100031B50;
        *(void *)(v496 + 72) = v495;
        swift_retain();
        swift_retain();
        swift_retain();
        swift_bridgeObjectRelease();
        unint64_t v729 = v487;
        if (os_log_type_enabled(v490, v491))
        {
          v497 = (uint8_t *)swift_slowAlloc();
          uint64_t v498 = swift_slowAlloc();
          v805 = 0;
          v806[0] = v498;
          *(_WORD *)v497 = 258;
          v497[2] = *(unsigned char *)(v492 + 16);
          if (v765) {
            goto LABEL_169;
          }
          swift_release();
          v497[3] = *(unsigned char *)(v493 + 16);
          v804[0] = (uint64_t)(v497 + 4);
          swift_release();
          sub_10002C274(v804, (uint64_t)&v805, v806, *(uint64_t (**)(void))(v495 + 16));
          uint64_t v499 = v713[143];
          uint64_t v500 = v713[120];
          swift_release();
          _os_log_impl((void *)&_mh_execute_header, v490, v491, "Processing: %s", v497, 0xCu);
          swift_arrayDestroy();
          swift_slowDealloc();
          uint64_t v1 = v713;
          swift_slowDealloc();

          v501 = v755;
          v755(v499, v500);
        }
        else
        {
          uint64_t v556 = v478[143];
          uint64_t v557 = v478[120];
          swift_release();
          swift_release();
          swift_release();

          v501 = v755;
          v755(v556, v557);
          uint64_t v1 = v478;
        }
        if (sub_1000291C0(v1[78], v1[79]))
        {
          v558 = v501;
          uint64_t v559 = v1[82];
          uint64_t v560 = v1[79];
          uint64_t v561 = v1[74];
          ((void (*)(uint64_t, uint64_t, uint64_t))v1[180])(v1[142], v1[179], v1[120]);
          v724(v559, v560, v561);
          uint64_t v562 = swift_allocObject();
          v739(v562 + v729, v559, v561);
          uint64_t v563 = swift_allocObject();
          *(void *)(v563 + 16) = sub_100030E08;
          *(void *)(v563 + 24) = v562;
          v564 = sub_100032860();
          os_log_type_t v565 = sub_100032A80();
          uint64_t v566 = swift_allocObject();
          *(unsigned char *)(v566 + 16) = 32;
          uint64_t v567 = swift_allocObject();
          *(unsigned char *)(v567 + 16) = 8;
          uint64_t v568 = swift_allocObject();
          *(void *)(v568 + 16) = sub_100031B44;
          *(void *)(v568 + 24) = v563;
          uint64_t v569 = swift_allocObject();
          *(void *)(v569 + 16) = sub_100031B40;
          *(void *)(v569 + 24) = v568;
          uint64_t v570 = swift_allocObject();
          *(_OWORD *)(v570 + 16) = xmmword_100033B60;
          *(void *)(v570 + 32) = sub_100031D8C;
          *(void *)(v570 + 40) = v566;
          *(void *)(v570 + 48) = sub_100031D8C;
          *(void *)(v570 + 56) = v567;
          *(void *)(v570 + 64) = sub_100031B50;
          *(void *)(v570 + 72) = v569;
          swift_retain();
          swift_retain();
          swift_retain();
          swift_bridgeObjectRelease();
          if (os_log_type_enabled(v564, v565))
          {
            v571 = (uint8_t *)swift_slowAlloc();
            uint64_t v572 = swift_slowAlloc();
            v805 = 0;
            v806[0] = v572;
            *(_WORD *)v571 = 258;
            v571[2] = *(unsigned char *)(v566 + 16);
            if (v765) {
              goto LABEL_169;
            }
            swift_release();
            v571[3] = *(unsigned char *)(v567 + 16);
            v804[0] = (uint64_t)(v571 + 4);
            swift_release();
            sub_10002C274(v804, (uint64_t)&v805, v806, *(uint64_t (**)(void))(v569 + 16));
            uint64_t v730 = v1[142];
            uint64_t v573 = v1[120];
            uint64_t v749 = v1[86];
            uint64_t v741 = v1[83];
            uint64_t v735 = v1[79];
            uint64_t v574 = v1[78];
            uint64_t v575 = v1[74];
            swift_release();
            _os_log_impl((void *)&_mh_execute_header, v564, v565, "TaskPayload extracted at: %s", v571, 0xCu);
            swift_arrayDestroy();
            swift_slowDealloc();
            swift_slowDealloc();

            v558(v730, v573);
            v722(v574, v575);
            v722(v735, v575);
          }
          else
          {
            uint64_t v582 = v1[142];
            uint64_t v583 = v1[120];
            uint64_t v749 = v1[86];
            uint64_t v741 = v1[83];
            uint64_t v584 = v1[79];
            uint64_t v585 = v1[78];
            v586 = v564;
            uint64_t v587 = v1[74];

            swift_release();
            swift_release();
            swift_release();
            v558(v582, v583);
            v722(v585, v587);
            v722(v584, v587);
          }
          (*v716)(v749, v741);
          uint64_t v440 = v1[60];
          v298 = v755;
          goto LABEL_124;
        }
        ((void (*)(uint64_t, uint64_t, uint64_t))v1[180])(v1[141], v1[179], v1[120]);
        v576 = sub_100032860();
        os_log_type_t v577 = sub_100032A80();
        BOOL v578 = os_log_type_enabled(v576, v577);
        uint64_t v579 = v1[141];
        uint64_t v580 = v1[120];
        if (v578)
        {
          v581 = (uint8_t *)swift_slowAlloc();
          v805 = 0;
          v806[0] = 0;
          *(_WORD *)v581 = 0;
          v804[0] = (uint64_t)(v581 + 2);
          sub_10002BCC0((uint64_t)_swiftEmptyArrayStorage, (uint64_t)v804, (uint64_t)&v805, (uint64_t)v806);
          swift_bridgeObjectRelease();
          _os_log_impl((void *)&_mh_execute_header, v576, v577, "Failed at processing archive, copying raw archive into taskFolder.", v581, 2u);
          swift_slowDealloc();
        }
        else
        {
          swift_bridgeObjectRelease();
        }

        v501(v579, v580);
        uint64_t v588 = v1[72];
        uint64_t v589 = v1[70];
        v1[14] = 0x612E737465737361;
        v1[15] = 0xEA00000000007261;
        sub_100028CB8(v588);
        sub_100032530();
        v698(v588, v589);
        swift_bridgeObjectRelease();
        id v590 = [v700 defaultManager];
        sub_1000324F0(v591);
        v593 = v592;
        sub_1000324F0(v594);
        v596 = v595;
        v1[42] = 0;
        LODWORD(v589) = [v590 copyItemAtURL:v593 toURL:v595 error:v697];

        v597 = (void *)v1[42];
        if (v589)
        {
          uint64_t v598 = v1[86];
          uint64_t v599 = v1[83];
          uint64_t v600 = v1[79];
          uint64_t v601 = v1[78];
          uint64_t v602 = v1[77];
          v603 = v501;
          uint64_t v604 = v1[74];
          uint64_t v440 = v1[60];
          id v605 = v597;
          v722(v602, v604);
          v722(v601, v604);
          uint64_t v606 = v604;
          v298 = v603;
          v722(v600, v606);
          (*v716)(v598, v599);
          goto LABEL_124;
        }
        v758 = v501;
        v607 = (void (*)(uint64_t, uint64_t, uint64_t))v1[180];
        uint64_t v608 = v1[179];
        uint64_t v609 = v1[122];
        uint64_t v610 = v1[120];
        uint64_t v611 = v1[82];
        uint64_t v612 = v1[77];
        uint64_t v613 = v1[74];
        id v614 = v597;
        uint64_t v615 = sub_1000324D0();

        swift_willThrow();
        v607(v609, v608, v610);
        v724(v611, v612, v613);
        uint64_t v616 = swift_allocObject();
        v739(v616 + v729, v611, v613);
        uint64_t v617 = swift_allocObject();
        *(void *)(v617 + 16) = sub_100030E08;
        *(void *)(v617 + 24) = v616;
        uint64_t v618 = swift_allocObject();
        *(void *)(v618 + 16) = v615;
        swift_errorRetain();
        v766 = sub_100032860();
        os_log_type_t v742 = sub_100032AA0();
        uint64_t v619 = swift_allocObject();
        *(unsigned char *)(v619 + 16) = 32;
        uint64_t v620 = swift_allocObject();
        *(unsigned char *)(v620 + 16) = 8;
        uint64_t v621 = swift_allocObject();
        *(void *)(v621 + 16) = sub_100031B44;
        *(void *)(v621 + 24) = v617;
        uint64_t v622 = swift_allocObject();
        *(void *)(v622 + 16) = sub_100031B40;
        *(void *)(v622 + 24) = v621;
        uint64_t v623 = swift_allocObject();
        *(unsigned char *)(v623 + 16) = 64;
        uint64_t v624 = swift_allocObject();
        *(unsigned char *)(v624 + 16) = 8;
        uint64_t v625 = swift_allocObject();
        *(void *)(v625 + 16) = sub_100031D84;
        *(void *)(v625 + 24) = v618;
        uint64_t v626 = swift_allocObject();
        *(void *)(v626 + 16) = sub_10002FE30;
        *(void *)(v626 + 24) = v625;
        uint64_t v627 = swift_allocObject();
        *(void *)(v627 + 16) = sub_100031B4C;
        *(void *)(v627 + 24) = v626;
        uint64_t v628 = swift_allocObject();
        *(_OWORD *)(v628 + 16) = xmmword_100033B70;
        *(void *)(v628 + 32) = sub_100031D8C;
        *(void *)(v628 + 40) = v619;
        *(void *)(v628 + 48) = sub_100031D8C;
        *(void *)(v628 + 56) = v620;
        *(void *)(v628 + 64) = sub_100031B50;
        *(void *)(v628 + 72) = v622;
        *(void *)(v628 + 80) = sub_100031D8C;
        *(void *)(v628 + 88) = v623;
        *(void *)(v628 + 96) = sub_100031D8C;
        *(void *)(v628 + 104) = v624;
        *(void *)(v628 + 112) = sub_100031B54;
        *(void *)(v628 + 120) = v627;
        swift_retain();
        swift_retain();
        swift_retain();
        swift_retain();
        swift_retain();
        swift_retain();
        swift_bridgeObjectRelease();
        os_log_type_t v629 = v742;
        if (os_log_type_enabled(v766, v742))
        {
          v630 = (uint8_t *)swift_slowAlloc();
          v725 = (void *)swift_slowAlloc();
          uint64_t v750 = swift_slowAlloc();
          v805 = v725;
          v806[0] = v750;
          *(_WORD *)v630 = 514;
          v630[2] = *(unsigned char *)(v619 + 16);
          swift_release();
          v630[3] = *(unsigned char *)(v620 + 16);
          v804[0] = (uint64_t)(v630 + 4);
          swift_release();
          sub_10002C274(v804, (uint64_t)&v805, v806, *(uint64_t (**)(void))(v622 + 16));
          swift_release();
          uint64_t v631 = v804[0];
          *(unsigned char *)v804[0] = *(unsigned char *)(v623 + 16);
          swift_release();
          *(unsigned char *)(v631 + 1) = *(unsigned char *)(v624 + 16);
          v804[0] = v631 + 2;
          swift_release();
          sub_10002C320(v804, &v805, (uint64_t)v806, *(uint64_t (**)(void))(v627 + 16));
          uint64_t v632 = v1[122];
          uint64_t v633 = v1[120];
          uint64_t v743 = v1[86];
          uint64_t v731 = v1[83];
          uint64_t v707 = v1[79];
          uint64_t v634 = v1[78];
          uint64_t v635 = v1[77];
          uint64_t v636 = v1[74];
          swift_release();
          _os_log_impl((void *)&_mh_execute_header, v766, v629, "Failed at asset to: %s : %@", v630, 0x16u);
          sub_100005644(&qword_10003C8A0);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();

          swift_errorRelease();
          v758(v632, v633);
          v722(v635, v636);
          v722(v634, v636);
          uint64_t v637 = v636;
          v298 = v758;
          v722(v707, v637);
          (*v716)(v743, v731);
        }
        else
        {
          uint64_t v638 = v1[122];
          uint64_t v708 = v1[120];
          uint64_t v751 = v1[86];
          uint64_t v744 = v1[83];
          uint64_t v732 = v1[79];
          uint64_t v726 = v1[78];
          uint64_t v639 = v1[77];
          uint64_t v640 = v1[74];

          swift_release();
          swift_release();
          swift_release();
          swift_release();
          swift_release();
          swift_release();
          swift_errorRelease();
          v298 = v758;
          v758(v638, v708);
          v722(v639, v640);
          v722(v726, v640);
          v722(v732, v640);
          (*v716)(v751, v744);
        }
        uint64_t v765 = 0;
      }
      else
      {
        v504 = v298;
        uint64_t v505 = v1[60];
        uint64_t v506 = v1[61];
        ((void (*)(uint64_t, uint64_t, uint64_t))v1[180])(v1[140], v1[179], v1[120]);
        sub_100030B2C(v505, v506, type metadata accessor for TaskPayloadRecord);
        uint64_t v507 = swift_allocObject();
        sub_100031468(v506, v507 + v772, type metadata accessor for TaskPayloadRecord);
        v508 = sub_100032860();
        os_log_type_t v509 = sub_100032AA0();
        uint64_t v510 = swift_allocObject();
        *(unsigned char *)(v510 + 16) = 32;
        uint64_t v511 = swift_allocObject();
        *(unsigned char *)(v511 + 16) = 8;
        uint64_t v512 = swift_allocObject();
        *(void *)(v512 + 16) = sub_100030B98;
        *(void *)(v512 + 24) = v507;
        uint64_t v513 = swift_allocObject();
        *(void *)(v513 + 16) = sub_100031B40;
        *(void *)(v513 + 24) = v512;
        uint64_t v514 = swift_allocObject();
        *(_OWORD *)(v514 + 16) = xmmword_100033B60;
        *(void *)(v514 + 32) = sub_100031D8C;
        *(void *)(v514 + 40) = v510;
        *(void *)(v514 + 48) = sub_100031D8C;
        *(void *)(v514 + 56) = v511;
        *(void *)(v514 + 64) = sub_100031B50;
        *(void *)(v514 + 72) = v513;
        swift_retain();
        swift_retain();
        swift_retain();
        swift_bridgeObjectRelease();
        if (os_log_type_enabled(v508, v509))
        {
          v515 = (uint8_t *)swift_slowAlloc();
          uint64_t v516 = swift_slowAlloc();
          v805 = 0;
          v806[0] = v516;
          *(_WORD *)v515 = 258;
          v515[2] = *(unsigned char *)(v510 + 16);
          if (v765) {
            goto LABEL_169;
          }
          swift_release();
          v515[3] = *(unsigned char *)(v511 + 16);
          v804[0] = (uint64_t)(v515 + 4);
          swift_release();
          sub_10002C274(v804, (uint64_t)&v805, v806, *(uint64_t (**)(void))(v513 + 16));
          uint64_t v517 = v1[140];
          uint64_t v518 = v1[120];
          uint64_t v519 = v1[86];
          uint64_t v520 = v713[83];
          swift_release();
          _os_log_impl((void *)&_mh_execute_header, v508, v509, "Task %s doesn't have a valid taskFolder. Skipping task.", v515, 0xCu);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();

          v298(v517, v518);
          uint64_t v521 = v520;
          uint64_t v1 = v713;
          (*v716)(v519, v521);
        }
        else
        {
          uint64_t v551 = v1[140];
          uint64_t v552 = v1[120];
          uint64_t v553 = v1[86];
          uint64_t v554 = v1[83];

          swift_release();
          swift_release();
          swift_release();
          v504(v551, v552);
          uint64_t v555 = v554;
          v298 = v504;
          (*v716)(v553, v555);
        }
      }
      uint64_t v440 = v1[60];
LABEL_124:
      uint64_t v441 = v801;
      goto LABEL_125;
    }
    break;
  }
  v641 = (void (*)(uint64_t, uint64_t, uint64_t))v1[180];
  uint64_t v642 = v1[179];
  uint64_t v643 = v1[144];
  uint64_t v644 = v1[120];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v641(v643, v642, v644);
  v645 = sub_100032860();
  os_log_type_t v646 = sub_100032A80();
  BOOL v647 = os_log_type_enabled(v645, v646);
  uint64_t v648 = v1[144];
  uint64_t v649 = v1[120];
  if (v647)
  {
    v650 = (uint8_t *)swift_slowAlloc();
    v805 = 0;
    v806[0] = 0;
    *(_WORD *)v650 = 0;
    v804[0] = (uint64_t)(v650 + 2);
    sub_10002BCC0((uint64_t)_swiftEmptyArrayStorage, (uint64_t)v804, (uint64_t)&v805, (uint64_t)v806);
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v645, v646, "Task cancelled before while processing TaskPayloads.", v650, 2u);
    swift_slowDealloc();
  }
  else
  {
    swift_bridgeObjectRelease();
  }

  v298(v648, v649);
  v670 = (void *)v1[195];
  v671 = (void *)v1[194];
  v672 = (void *)v1[193];
  v673 = (void *)v1[192];
  v674 = (void *)v1[191];
  v675 = (void *)v1[190];
  uint64_t v676 = v1[188];
  uint64_t v802 = v1[119];
  uint64_t v677 = v1[118];
  uint64_t v792 = v1[117];
  uint64_t v773 = v1[60];
  id v678 = objc_allocWithZone((Class)sub_100032780());
  uint64_t v696 = sub_100032770();

  swift_release();
  sub_100030BD0(v773, type metadata accessor for TaskPayloadRecord);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  sub_100027C1C(v676);
  (*(void (**)(uint64_t, uint64_t))(v677 + 8))(v802, v792);
LABEL_178:
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  v694 = (uint64_t (*)(uint64_t))v1[1];
  return v694(v696);
}

uint64_t sub_100017BFC()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 1888) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void **)(v2 + 1560);
    uint64_t v4 = *(void **)(v2 + 1552);
    swift_bridgeObjectRelease();

    swift_bridgeObjectRelease();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v5 = sub_100025B68;
  }
  else
  {
    uint64_t v6 = *(void **)(v2 + 1560);

    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v5 = sub_100017DB8;
  }
  return _swift_task_switch(v5, 0, 0);
}

uint64_t sub_100017DB8()
{
  uint64_t v669 = v0;
  uint64_t v1 = (void *)v0;
  uint64_t v2 = *(void *)(v0 + 1504);

  uint64_t v3 = *(void *)(v0 + 176);
  *(void *)(v2 + 56) = *(void *)(v3 + 16);
  uint64_t v655 = v1[236];
  uint64_t v4 = *(void *)(v3 + 16);
  uint64_t v644 = v1;
  if (v4)
  {
    v641 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v1[65] + 48);
    uint64_t v5 = (unsigned char *)(v3 + 48);
    uint64_t v633 = v1[69];
    uint64_t v648 = (void (*)(uint64_t, uint64_t))v1[200];
    do
    {
      uint64_t v8 = (void *)*((void *)v5 - 1);
      if (*v5)
      {
        uint64_t v657 = v4;
        ((void (*)(void, void, void))v1[180])(v1[153], v1[179], v1[120]);
        uint64_t v9 = swift_allocObject();
        *(void *)(v9 + 16) = v8;
        sub_10002FF18(v8, 1);
        sub_10002FF18(v8, 1);
        swift_errorRetain();
        uint64_t v10 = sub_100032860();
        os_log_type_t v11 = sub_100032AA0();
        uint64_t v12 = swift_allocObject();
        *(unsigned char *)(v12 + 16) = 64;
        uint64_t v13 = swift_allocObject();
        *(unsigned char *)(v13 + 16) = 8;
        uint64_t v14 = swift_allocObject();
        *(void *)(v14 + 16) = sub_100031D84;
        *(void *)(v14 + 24) = v9;
        uint64_t v15 = swift_allocObject();
        *(void *)(v15 + 16) = sub_10002FE30;
        *(void *)(v15 + 24) = v14;
        uint64_t v16 = swift_allocObject();
        *(void *)(v16 + 16) = sub_100031B4C;
        *(void *)(v16 + 24) = v15;
        uint64_t v17 = swift_allocObject();
        *(_OWORD *)(v17 + 16) = xmmword_100033B60;
        *(void *)(v17 + 32) = sub_100031D8C;
        *(void *)(v17 + 40) = v12;
        *(void *)(v17 + 48) = sub_100031D8C;
        *(void *)(v17 + 56) = v13;
        *(void *)(v17 + 64) = sub_100031B54;
        *(void *)(v17 + 72) = v16;
        swift_retain();
        swift_retain();
        swift_retain();
        swift_bridgeObjectRelease();
        if (os_log_type_enabled(v10, v11))
        {
          uint64_t v18 = (uint8_t *)swift_slowAlloc();
          uint64_t v667 = (void *)swift_slowAlloc();
          v668[0] = 0;
          *(_WORD *)uint64_t v18 = 258;
          v18[2] = *(unsigned char *)(v12 + 16);
          if (v655) {
            goto LABEL_137;
          }
          swift_release();
          v18[3] = *(unsigned char *)(v13 + 16);
          v666[0] = (uint64_t)(v18 + 4);
          swift_release();
          sub_10002C320(v666, &v667, (uint64_t)v668, *(uint64_t (**)(void))(v16 + 16));
          uint64_t v649 = (void (*)(uint64_t, uint64_t))v644[200];
          uint64_t v19 = v644[153];
          uint64_t v20 = v644[120];
          swift_release();
          _os_log_impl((void *)&_mh_execute_header, v10, v11, "Error: %@", v18, 0xCu);
          sub_100005644(&qword_10003C8A0);
          swift_arrayDestroy();
          swift_slowDealloc();
          uint64_t v1 = v644;
          swift_slowDealloc();

          sub_10002FF64(v8, 1);
          sub_10002FF64(v8, 1);
          v649(v19, v20);
          uint64_t v648 = (void (*)(uint64_t, uint64_t))v644[200];
        }
        else
        {
          uint64_t v40 = v1[153];
          uint64_t v41 = v1[120];
          sub_10002FF64(v8, 1);
          swift_release();
          swift_release();
          swift_release();

          sub_10002FF64(v8, 1);
          v648(v40, v41);
        }
        uint64_t v42 = v1[188];
        uint64_t v43 = *(void *)(v42 + 72);
        BOOL v44 = __OFADD__(v43, 1);
        uint64_t v45 = v43 + 1;
        uint64_t v4 = v657;
        if (v44)
        {
          __break(1u);
LABEL_150:
          __break(1u);
LABEL_151:
          __break(1u);
LABEL_152:
          __break(1u);
        }
        *(void *)(v42 + 72) = v45;
      }
      else
      {
        uint64_t v22 = v1[63];
        uint64_t v21 = v1[64];
        sub_10002FF18(*((void **)v5 - 1), 0);
        sub_10002FF18(v8, 0);
        id v23 = v8;
        sub_100003B00(v23, v22);
        if ((*v641)(v22, 1, v21) == 1)
        {
          uint64_t v658 = v4;
          uint64_t v24 = (void (*)(uint64_t, uint64_t, uint64_t))v1[180];
          uint64_t v25 = v1[179];
          uint64_t v26 = v1[154];
          uint64_t v27 = v1[120];
          sub_1000065E4(v1[63], &qword_10003C800);
          v24(v26, v25, v27);
          uint64_t v28 = swift_allocObject();
          *(void *)(v28 + 16) = v23;
          id v29 = v23;
          uint64_t v30 = sub_100032860();
          os_log_type_t v31 = sub_100032AA0();
          uint64_t v32 = swift_allocObject();
          *(unsigned char *)(v32 + 16) = 64;
          uint64_t v33 = swift_allocObject();
          *(unsigned char *)(v33 + 16) = 8;
          uint64_t v34 = swift_allocObject();
          *(void *)(v34 + 16) = sub_100031D88;
          *(void *)(v34 + 24) = v28;
          uint64_t v35 = swift_allocObject();
          *(void *)(v35 + 16) = sub_100031B4C;
          *(void *)(v35 + 24) = v34;
          uint64_t v36 = swift_allocObject();
          *(_OWORD *)(v36 + 16) = xmmword_100033B60;
          *(void *)(v36 + 32) = sub_100031D8C;
          *(void *)(v36 + 40) = v32;
          *(void *)(v36 + 48) = sub_100031D8C;
          *(void *)(v36 + 56) = v33;
          *(void *)(v36 + 64) = sub_100031B54;
          *(void *)(v36 + 72) = v35;
          swift_retain();
          swift_retain();
          swift_retain();
          swift_bridgeObjectRelease();
          if (os_log_type_enabled(v30, v31))
          {
            uint64_t v37 = (uint8_t *)swift_slowAlloc();
            uint64_t v667 = (void *)swift_slowAlloc();
            v668[0] = 0;
            *(_WORD *)uint64_t v37 = 258;
            v37[2] = *(unsigned char *)(v32 + 16);
            if (v655) {
              goto LABEL_137;
            }
            swift_release();
            v37[3] = *(unsigned char *)(v33 + 16);
            v666[0] = (uint64_t)(v37 + 4);
            swift_release();
            sub_10002C320(v666, &v667, (uint64_t)v668, *(uint64_t (**)(void))(v35 + 16));
            uint64_t v38 = v644[154];
            uint64_t v39 = v644[120];
            swift_release();
            _os_log_impl((void *)&_mh_execute_header, v30, v31, "Skipping record: %@", v37, 0xCu);
            sub_100005644(&qword_10003C8A0);
            swift_arrayDestroy();
            swift_slowDealloc();
            uint64_t v1 = v644;
            swift_slowDealloc();

            sub_10002FF64(v8, 0);
            sub_10002FF64(v8, 0);
            v648(v38, v39);
            uint64_t v655 = 0;
          }
          else
          {
            uint64_t v6 = v1[154];
            uint64_t v7 = v1[120];
            sub_10002FF64(v8, 0);
            swift_release();
            swift_release();
            swift_release();

            sub_10002FF64(v8, 0);
            v648(v6, v7);
          }
          uint64_t v4 = v658;
        }
        else
        {
          uint64_t v46 = v1[214];
          uint64_t v47 = (uint64_t *)v1[69];
          sub_100031468(v1[63], (uint64_t)v47, type metadata accessor for TaskParametersRecord);
          uint64_t v48 = *(void *)(v46 + 16);
          uint64_t v49 = *v47;
          uint64_t v50 = *(void *)(v633 + 8);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          LOBYTE(v49) = sub_100028604(v49, v50, v48);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if (v49)
          {
            uint64_t v51 = v1[188];
            uint64_t v52 = v1[69];
            uint64_t v53 = v1[68];
            sub_100030B2C(v52, v53, type metadata accessor for TaskParametersRecord);
            sub_10002894C(v53);
            sub_10002FF64(v8, 0);
            sub_10002FF64(v8, 0);
            sub_100030BD0(v52, type metadata accessor for TaskParametersRecord);
            uint64_t v54 = *(void *)(v51 + 64);
            BOOL v44 = __OFADD__(v54, 1);
            uint64_t v55 = v54 + 1;
            if (v44) {
              goto LABEL_151;
            }
            *(void *)(v1[188] + 64) = v55;
          }
          else
          {
            ((void (*)(void, void, void))v1[180])(v1[155], v1[179], v1[120]);
            uint64_t v56 = sub_100032860();
            os_log_type_t v57 = sub_100032A90();
            BOOL v58 = os_log_type_enabled(v56, v57);
            uint64_t v59 = v1[155];
            uint64_t v60 = v1[120];
            uint64_t v61 = v1[69];
            if (v58)
            {
              uint64_t v659 = v4;
              uint64_t v62 = (uint8_t *)swift_slowAlloc();
              uint64_t v667 = 0;
              v668[0] = 0;
              *(_WORD *)uint64_t v62 = 0;
              v666[0] = (uint64_t)(v62 + 2);
              sub_10002BCC0((uint64_t)_swiftEmptyArrayStorage, (uint64_t)v666, (uint64_t)&v667, (uint64_t)v668);
              swift_bridgeObjectRelease();
              _os_log_impl((void *)&_mh_execute_header, v56, v57, "Skipping taskParametersRecord because associated with an unavailable taskName.", v62, 2u);
              uint64_t v4 = v659;
              swift_slowDealloc();
            }
            else
            {
              swift_bridgeObjectRelease();
            }

            sub_10002FF64(v8, 0);
            sub_10002FF64(v8, 0);
            v648(v59, v60);
            sub_100030BD0(v61, type metadata accessor for TaskParametersRecord);
          }
        }
      }
      v5 += 24;
      --v4;
    }
    while (v4);
  }
  uint64_t v63 = v1[230];
  swift_bridgeObjectRelease();
  uint64_t v64 = swift_allocObject();
  v1[237] = v64;
  type metadata accessor for TaskPayloadRecord(0);
  *(void *)(v64 + 16) = _swiftEmptyArrayStorage;
  swift_beginAccess();
  if (*(void *)(*(void *)(v63 + 16) + 16))
  {
    uint64_t v65 = v1[230];
    uint64_t v66 = (void (*)(uint64_t, uint64_t, uint64_t))v1[180];
    uint64_t v67 = v1[179];
    uint64_t v68 = v1[152];
    uint64_t v69 = v1[120];
    swift_bridgeObjectRelease();
    v66(v68, v67, v69);
    uint64_t v70 = swift_allocObject();
    *(void *)(v70 + 16) = sub_1000305E8;
    *(void *)(v70 + 24) = v65;
    swift_retain();
    uint64_t v71 = sub_100032860();
    os_log_type_t v72 = sub_100032A80();
    uint64_t v73 = swift_allocObject();
    *(unsigned char *)(v73 + 16) = 32;
    uint64_t v74 = swift_allocObject();
    *(unsigned char *)(v74 + 16) = 8;
    uint64_t v75 = swift_allocObject();
    *(void *)(v75 + 16) = sub_100030604;
    *(void *)(v75 + 24) = v70;
    uint64_t v76 = swift_allocObject();
    *(void *)(v76 + 16) = sub_100031B40;
    *(void *)(v76 + 24) = v75;
    uint64_t v77 = swift_allocObject();
    *(_OWORD *)(v77 + 16) = xmmword_100033B60;
    *(void *)(v77 + 32) = sub_100031D8C;
    *(void *)(v77 + 40) = v73;
    *(void *)(v77 + 48) = sub_100031D8C;
    *(void *)(v77 + 56) = v74;
    *(void *)(v77 + 64) = sub_100031B50;
    *(void *)(v77 + 72) = v76;
    swift_retain();
    swift_retain();
    swift_retain();
    swift_bridgeObjectRelease();
    if (os_log_type_enabled(v71, v72))
    {
      uint64_t v78 = (uint8_t *)swift_slowAlloc();
      uint64_t v79 = swift_slowAlloc();
      uint64_t v667 = 0;
      v668[0] = v79;
      *(_WORD *)uint64_t v78 = 258;
      uint64_t v78[2] = *(unsigned char *)(v73 + 16);
      if (v655) {
        goto LABEL_137;
      }
      swift_release();
      v78[3] = *(unsigned char *)(v74 + 16);
      v666[0] = (uint64_t)(v78 + 4);
      swift_release();
      sub_10002C274(v666, (uint64_t)&v667, v668, *(uint64_t (**)(void))(v76 + 16));
      uint64_t v1 = v644;
      double v80 = (void (*)(uint64_t, uint64_t))v644[200];
      uint64_t v81 = v644[152];
      uint64_t v82 = v644[120];
      swift_release();
      _os_log_impl((void *)&_mh_execute_header, v71, v72, "Querying TaskPayloads for new tasks: %s", v78, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      uint64_t v83 = v81;
      uint64_t v84 = v82;
    }
    else
    {
      double v80 = (void (*)(uint64_t, uint64_t))v1[200];
      uint64_t v145 = v1[152];
      uint64_t v146 = v1[120];
      swift_release();
      swift_release();
      swift_release();

      uint64_t v83 = v145;
      uint64_t v84 = v146;
    }
    v80(v83, v84);
    uint64_t v147 = v1[203];
    uint64_t v148 = (void *)v1[195];
    BOOL v149 = (void *)v1[194];
    uint64_t v150 = v1[193];
    uint64_t v151 = swift_allocObject();
    *(_OWORD *)(v151 + 16) = xmmword_100033B80;
    *(void *)(v151 + 56) = &type metadata for String;
    *(void *)(v151 + 64) = v147;
    *(void *)(v151 + 32) = 0x656D614E6B736174;
    *(void *)(v151 + 40) = 0xE800000000000000;
    swift_bridgeObjectRetain();
    uint64_t v152 = sub_100028D2C();
    swift_bridgeObjectRelease();
    *(void *)(v151 + 96) = sub_100005644(&qword_10003C8B0);
    *(void *)(v151 + 104) = sub_100031A24(&qword_10003C8B8, &qword_10003C8B0);
    *(void *)(v151 + 72) = v152;
    uint64_t v153 = (NSPredicate *)sub_100032A70();
    v671._countAndFlagsBits = 0x6C7961506B736154;
    v671._object = (void *)0xEC0000007364616FLL;
    Class isa = sub_100032AB0(v671, v153).super.isa;
    v1[238] = isa;
    uint64_t v155 = swift_task_alloc();
    v1[239] = v155;
    *(void *)(v155 + 16) = isa;
    *(void *)(v155 + 24) = v150;
    uint64_t v156 = swift_task_alloc();
    v1[240] = v156;
    *(void *)(v156 + 16) = &unk_10003C8E0;
    *(void *)(v156 + 24) = v155;
    id v157 = v148;
    id v158 = v149;
    uint64_t v159 = (void *)swift_task_alloc();
    v1[241] = v159;
    *uint64_t v159 = v1;
    v159[1] = sub_10001DA40;
    uint64_t v160 = v1[212];
    return CKDatabase.configuredWith<A>(configuration:group:body:)(v1 + 26, v157, v158, &unk_10003C8E8, v156, v160);
  }
  uint64_t v85 = _swiftEmptyArrayStorage[2];
  if (v85)
  {
    uint64_t v634 = v1[62];
    uint64_t v637 = (unsigned int (**)(void *, uint64_t, uint64_t))(v1[58] + 48);
    uint64_t v86 = &_swiftEmptyArrayStorage[6];
    v645 = (void (*)(uint64_t, uint64_t))v1[200];
    do
    {
      uint64_t v89 = (void *)*((void *)v86 - 1);
      if (*v86)
      {
        v650 = v86;
        uint64_t v660 = v85;
        ((void (*)(void, void, void))v1[180])(v1[149], v1[179], v1[120]);
        uint64_t v90 = swift_allocObject();
        *(void *)(v90 + 16) = v89;
        sub_10002FF18(v89, 1);
        sub_10002FF18(v89, 1);
        swift_errorRetain();
        uint64_t v91 = sub_100032860();
        os_log_type_t v92 = sub_100032AA0();
        uint64_t v93 = swift_allocObject();
        *(unsigned char *)(v93 + 16) = 64;
        uint64_t v94 = swift_allocObject();
        *(unsigned char *)(v94 + 16) = 8;
        uint64_t v95 = swift_allocObject();
        *(void *)(v95 + 16) = sub_100031D84;
        *(void *)(v95 + 24) = v90;
        uint64_t v96 = swift_allocObject();
        *(void *)(v96 + 16) = sub_10002FE30;
        *(void *)(v96 + 24) = v95;
        uint64_t v97 = swift_allocObject();
        *(void *)(v97 + 16) = sub_100031B4C;
        *(void *)(v97 + 24) = v96;
        uint64_t v98 = swift_allocObject();
        *(_OWORD *)(v98 + 16) = xmmword_100033B60;
        *(void *)(v98 + 32) = sub_100031D8C;
        *(void *)(v98 + 40) = v93;
        *(void *)(v98 + 48) = sub_100031D8C;
        *(void *)(v98 + 56) = v94;
        *(void *)(v98 + 64) = sub_100031B54;
        *(void *)(v98 + 72) = v97;
        swift_retain();
        swift_retain();
        swift_retain();
        swift_bridgeObjectRelease();
        os_log_type_t v99 = v92;
        if (os_log_type_enabled(v91, v92))
        {
          uint64_t v100 = (uint8_t *)swift_slowAlloc();
          uint64_t v667 = (void *)swift_slowAlloc();
          v668[0] = 0;
          *(_WORD *)uint64_t v100 = 258;
          v100[2] = *(unsigned char *)(v93 + 16);
          if (v655) {
            goto LABEL_137;
          }
          swift_release();
          v100[3] = *(unsigned char *)(v94 + 16);
          v666[0] = (uint64_t)(v100 + 4);
          swift_release();
          sub_10002C320(v666, &v667, (uint64_t)v668, *(uint64_t (**)(void))(v97 + 16));
          uint64_t v101 = (void (*)(uint64_t, uint64_t))v644[200];
          uint64_t v102 = v644[149];
          uint64_t v103 = v644[120];
          swift_release();
          _os_log_impl((void *)&_mh_execute_header, v91, v99, "Error: %@", v100, 0xCu);
          sub_100005644(&qword_10003C8A0);
          swift_arrayDestroy();
          swift_slowDealloc();
          uint64_t v1 = v644;
          swift_slowDealloc();

          sub_10002FF64(v89, 1);
          sub_10002FF64(v89, 1);
          v101(v102, v103);
          v645 = (void (*)(uint64_t, uint64_t))v644[200];
        }
        else
        {
          uint64_t v123 = v1[149];
          uint64_t v124 = v1[120];
          sub_10002FF64(v89, 1);
          swift_release();
          swift_release();
          swift_release();

          sub_10002FF64(v89, 1);
          v645(v123, v124);
        }
        uint64_t v125 = v1[188];
        uint64_t v126 = *(void *)(v125 + 96);
        BOOL v44 = __OFADD__(v126, 1);
        uint64_t v127 = v126 + 1;
        uint64_t v85 = v660;
        uint64_t v86 = v650;
        if (v44) {
          goto LABEL_150;
        }
        *(void *)(v125 + 96) = v127;
      }
      else
      {
        uint64_t v105 = (void *)v1[56];
        uint64_t v104 = v1[57];
        sub_10002FF18(*((void **)v86 - 1), 0);
        sub_10002FF18(v89, 0);
        id v106 = v89;
        sub_100004B70(v106, v105);
        if ((*v637)(v105, 1, v104) == 1)
        {
          uint64_t v661 = v85;
          uint64_t v107 = (void (*)(uint64_t, uint64_t, uint64_t))v1[180];
          uint64_t v108 = v1[179];
          uint64_t v109 = v1[150];
          uint64_t v110 = v1[120];
          sub_1000065E4(v1[56], &qword_10003C7F8);
          v107(v109, v108, v110);
          uint64_t v111 = swift_allocObject();
          *(void *)(v111 + 16) = v106;
          id v112 = v106;
          uint64_t v113 = sub_100032860();
          os_log_type_t v114 = sub_100032AA0();
          uint64_t v115 = swift_allocObject();
          *(unsigned char *)(v115 + 16) = 64;
          uint64_t v116 = swift_allocObject();
          *(unsigned char *)(v116 + 16) = 8;
          uint64_t v117 = swift_allocObject();
          *(void *)(v117 + 16) = sub_100031D88;
          *(void *)(v117 + 24) = v111;
          uint64_t v118 = swift_allocObject();
          *(void *)(v118 + 16) = sub_100031B4C;
          *(void *)(v118 + 24) = v117;
          uint64_t v119 = swift_allocObject();
          *(_OWORD *)(v119 + 16) = xmmword_100033B60;
          *(void *)(v119 + 32) = sub_100031D8C;
          *(void *)(v119 + 40) = v115;
          *(void *)(v119 + 48) = sub_100031D8C;
          *(void *)(v119 + 56) = v116;
          *(void *)(v119 + 64) = sub_100031B54;
          *(void *)(v119 + 72) = v118;
          swift_retain();
          swift_retain();
          swift_retain();
          swift_bridgeObjectRelease();
          if (os_log_type_enabled(v113, v114))
          {
            uint64_t v120 = (uint8_t *)swift_slowAlloc();
            uint64_t v667 = (void *)swift_slowAlloc();
            v668[0] = 0;
            *(_WORD *)uint64_t v120 = 258;
            v120[2] = *(unsigned char *)(v115 + 16);
            if (v655) {
              goto LABEL_137;
            }
            swift_release();
            v120[3] = *(unsigned char *)(v116 + 16);
            v666[0] = (uint64_t)(v120 + 4);
            swift_release();
            sub_10002C320(v666, &v667, (uint64_t)v668, *(uint64_t (**)(void))(v118 + 16));
            uint64_t v121 = v644[150];
            uint64_t v122 = v644[120];
            swift_release();
            _os_log_impl((void *)&_mh_execute_header, v113, v114, "Skipping record: %@", v120, 0xCu);
            sub_100005644(&qword_10003C8A0);
            swift_arrayDestroy();
            swift_slowDealloc();
            uint64_t v1 = v644;
            swift_slowDealloc();

            sub_10002FF64(v89, 0);
            sub_10002FF64(v89, 0);
            v645(v121, v122);
            uint64_t v655 = 0;
          }
          else
          {
            uint64_t v87 = v1[150];
            uint64_t v88 = v1[120];
            sub_10002FF64(v89, 0);
            swift_release();
            swift_release();
            swift_release();

            sub_10002FF64(v89, 0);
            v645(v87, v88);
          }
          uint64_t v85 = v661;
        }
        else
        {
          uint64_t v128 = v1[214];
          uint64_t v129 = (uint64_t *)v1[62];
          sub_100031468(v1[56], (uint64_t)v129, type metadata accessor for TaskPayloadRecord);
          uint64_t v130 = *(void *)(v128 + 16);
          uint64_t v131 = *v129;
          uint64_t v132 = *(void *)(v634 + 8);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          LOBYTE(v131) = sub_100028604(v131, v132, v130);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if (v131)
          {
            uint64_t v133 = v1[188];
            uint64_t v135 = v1[61];
            uint64_t v134 = v1[62];
            sub_100030B2C(v134, v135, type metadata accessor for TaskPayloadRecord);
            sub_100028ABC(v135);
            sub_10002FF64(v89, 0);
            sub_10002FF64(v89, 0);
            sub_100030BD0(v134, type metadata accessor for TaskPayloadRecord);
            uint64_t v136 = *(void *)(v133 + 88);
            BOOL v44 = __OFADD__(v136, 1);
            uint64_t v137 = v136 + 1;
            if (v44) {
              goto LABEL_152;
            }
            *(void *)(v1[188] + 88) = v137;
          }
          else
          {
            ((void (*)(void, void, void))v1[180])(v1[151], v1[179], v1[120]);
            uint64_t v138 = sub_100032860();
            os_log_type_t v139 = sub_100032A90();
            BOOL v140 = os_log_type_enabled(v138, v139);
            uint64_t v141 = v1[151];
            uint64_t v142 = v1[120];
            uint64_t v143 = v1[62];
            if (v140)
            {
              uint64_t v662 = v85;
              uint64_t v144 = (uint8_t *)swift_slowAlloc();
              uint64_t v667 = 0;
              v668[0] = 0;
              *(_WORD *)uint64_t v144 = 0;
              v666[0] = (uint64_t)(v144 + 2);
              sub_10002BCC0((uint64_t)_swiftEmptyArrayStorage, (uint64_t)v666, (uint64_t)&v667, (uint64_t)v668);
              swift_bridgeObjectRelease();
              _os_log_impl((void *)&_mh_execute_header, v138, v139, "Skipping taskPayloadRecord because associated with an unavailable taskName.", v144, 2u);
              uint64_t v85 = v662;
              swift_slowDealloc();
            }
            else
            {
              swift_bridgeObjectRelease();
            }

            sub_10002FF64(v89, 0);
            sub_10002FF64(v89, 0);
            v645(v141, v142);
            sub_100030BD0(v143, type metadata accessor for TaskPayloadRecord);
          }
        }
      }
      v86 += 24;
      --v85;
    }
    while (v85);
  }
  uint64_t v161 = v1[231];
  os_log_type_t v162 = (void (*)(uint64_t, uint64_t, uint64_t))v1[180];
  uint64_t v163 = v1[179];
  uint64_t v164 = v1[148];
  uint64_t v165 = v1[120];
  swift_bridgeObjectRelease();
  v162(v164, v163, v165);
  uint64_t v166 = swift_allocObject();
  *(void *)(v166 + 16) = sub_10002FFA8;
  *(void *)(v166 + 24) = v161;
  swift_retain();
  v167 = sub_100032860();
  os_log_type_t v168 = sub_100032A80();
  uint64_t v169 = swift_allocObject();
  *(unsigned char *)(v169 + 16) = 32;
  uint64_t v170 = swift_allocObject();
  *(unsigned char *)(v170 + 16) = 8;
  uint64_t v171 = swift_allocObject();
  *(void *)(v171 + 16) = sub_1000309E8;
  *(void *)(v171 + 24) = v166;
  uint64_t v172 = swift_allocObject();
  *(void *)(v172 + 16) = sub_100031B40;
  *(void *)(v172 + 24) = v171;
  uint64_t v173 = swift_allocObject();
  *(_OWORD *)(v173 + 16) = xmmword_100033B60;
  *(void *)(v173 + 32) = sub_100031D8C;
  *(void *)(v173 + 40) = v169;
  *(void *)(v173 + 48) = sub_100031D8C;
  *(void *)(v173 + 56) = v170;
  *(void *)(v173 + 64) = sub_100031B50;
  *(void *)(v173 + 72) = v172;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRelease();
  if (os_log_type_enabled(v167, v168))
  {
    uint64_t v174 = (uint8_t *)swift_slowAlloc();
    uint64_t v175 = swift_slowAlloc();
    uint64_t v667 = 0;
    v668[0] = v175;
    *(_WORD *)uint64_t v174 = 258;
    v174[2] = *(unsigned char *)(v169 + 16);
    if (v655) {
      goto LABEL_137;
    }
    swift_release();
    v174[3] = *(unsigned char *)(v170 + 16);
    v666[0] = (uint64_t)(v174 + 4);
    swift_release();
    sub_10002C274(v666, (uint64_t)&v667, v668, *(uint64_t (**)(void))(v172 + 16));
    uint64_t v176 = v1[148];
    uint64_t v177 = v1[121];
    uint64_t v178 = v1[120];
    swift_release();
    _os_log_impl((void *)&_mh_execute_header, v167, v168, "Processing TaskParametersRecords: %s", v174, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    uint64_t v179 = *(void (**)(uint64_t, uint64_t))(v177 + 8);
    uint64_t v180 = v176;
    uint64_t v181 = v178;
  }
  else
  {
    uint64_t v182 = v1[148];
    uint64_t v183 = v1[121];
    uint64_t v184 = v1[120];
    swift_release();
    swift_release();
    swift_release();

    uint64_t v179 = *(void (**)(uint64_t, uint64_t))(v183 + 8);
    uint64_t v180 = v182;
    uint64_t v181 = v184;
  }
  v651 = v179;
  v179(v180, v181);
  uint64_t v185 = v1[231];
  swift_beginAccess();
  uint64_t v186 = *(void *)(v185 + 16);
  uint64_t v187 = *(void *)(v186 + 16);
  if (!v187) {
    goto LABEL_84;
  }
  uint64_t v188 = v1[84];
  uint64_t v189 = v1[75];
  uint64_t v598 = v1[67];
  uint64_t v190 = v1[65];
  uint64_t v191 = *(unsigned __int8 *)(v190 + 80);
  uint64_t v192 = v186 + ((v191 + 32) & ~v191);
  os_log_type_t v646 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v188 + 48);
  uint64_t v612 = (void (**)(void, void, void))(v188 + 32);
  v596 = (void (**)(void, uint64_t, uint64_t, void))(v189 + 56);
  v594 = (void (**)(uint64_t, uint64_t))(v1[71] + 8);
  uint64_t v619 = (void (**)(uint64_t, uint64_t))(v189 + 8);
  uint64_t v591 = v189;
  uint64_t v635 = (void (**)(uint64_t, uint64_t))(v1[121] + 8);
  v607 = (void (**)(uint64_t, uint64_t))(v188 + 8);
  uint64_t v631 = (v191 + 16) & ~v191;
  uint64_t v642 = *(void *)(v190 + 72);
  uint64_t v193 = enum case for URL.DirectoryHint.inferFromPath(_:);
  swift_bridgeObjectRetain();
  unsigned int v638 = v193;
  do
  {
    uint64_t v198 = v1[229];
    uint64_t v199 = v1[83];
    uint64_t v200 = v1[67];
    uint64_t v201 = v1[55];
    sub_100030B2C(v192, v200, type metadata accessor for TaskParametersRecord);
    *(void *)(swift_task_alloc() + 16) = v200;
    sub_100028F5C((uint64_t (*)(char *))sub_100030A38, v198, v201);
    swift_task_dealloc();
    uint64_t v663 = v192;
    if ((*v646)(v201, 1, v199) == 1)
    {
      v202 = (void (*)(uint64_t, uint64_t, uint64_t))v1[180];
      uint64_t v203 = v1[179];
      uint64_t v204 = v1[146];
      uint64_t v205 = v1[120];
      uint64_t v206 = v1[68];
      uint64_t v207 = v1[67];
      sub_1000065E4(v1[55], &qword_10003C7F0);
      v202(v204, v203, v205);
      sub_100030B2C(v207, v206, type metadata accessor for TaskParametersRecord);
      uint64_t v208 = swift_allocObject();
      sub_100031468(v206, v208 + v631, type metadata accessor for TaskParametersRecord);
      uint64_t v209 = sub_100032860();
      os_log_type_t v210 = sub_100032AA0();
      uint64_t v211 = swift_allocObject();
      *(unsigned char *)(v211 + 16) = 32;
      uint64_t v212 = swift_allocObject();
      *(unsigned char *)(v212 + 16) = 8;
      uint64_t v213 = v1;
      uint64_t v214 = swift_allocObject();
      *(void *)(v214 + 16) = sub_100030A5C;
      *(void *)(v214 + 24) = v208;
      uint64_t v215 = swift_allocObject();
      *(void *)(v215 + 16) = sub_100031B40;
      *(void *)(v215 + 24) = v214;
      uint64_t v216 = swift_allocObject();
      *(_OWORD *)(v216 + 16) = xmmword_100033B60;
      *(void *)(v216 + 32) = sub_100031D8C;
      *(void *)(v216 + 40) = v211;
      *(void *)(v216 + 48) = sub_100031D8C;
      *(void *)(v216 + 56) = v212;
      *(void *)(v216 + 64) = sub_100031B50;
      *(void *)(v216 + 72) = v215;
      swift_retain();
      swift_retain();
      swift_retain();
      swift_bridgeObjectRelease();
      if (os_log_type_enabled(v209, v210))
      {
        uint64_t v217 = (uint8_t *)swift_slowAlloc();
        uint64_t v218 = swift_slowAlloc();
        uint64_t v667 = 0;
        v668[0] = v218;
        *(_WORD *)uint64_t v217 = 258;
        v217[2] = *(unsigned char *)(v211 + 16);
        if (v655) {
          goto LABEL_137;
        }
        swift_release();
        v217[3] = *(unsigned char *)(v212 + 16);
        v666[0] = (uint64_t)(v217 + 4);
        swift_release();
        sub_10002C274(v666, (uint64_t)&v667, v668, *(uint64_t (**)(void))(v215 + 16));
        uint64_t v213 = v644;
        uint64_t v219 = v644[146];
        uint64_t v220 = v644[120];
        swift_release();
        _os_log_impl((void *)&_mh_execute_header, v209, v210, "Task %s not registered on the system. Skipping task.", v217, 0xCu);
        swift_arrayDestroy();
        uint64_t v1 = v644;
        swift_slowDealloc();
        swift_slowDealloc();

        v651(v219, v220);
      }
      else
      {
        uint64_t v194 = v213[146];
        uint64_t v195 = v213[120];
        swift_release();
        swift_release();
        swift_release();

        v651(v194, v195);
        uint64_t v1 = v213;
      }
      uint64_t v196 = v213[67];
      goto LABEL_63;
    }
    (*v612)(v1[87], v1[55], v1[83]);
    sub_1000326D0();
    if (!v221)
    {
      uint64_t v264 = v1[68];
      uint64_t v265 = v1[67];
      ((void (*)(void, void, void))v1[180])(v1[147], v1[179], v1[120]);
      sub_100030B2C(v265, v264, type metadata accessor for TaskParametersRecord);
      uint64_t v266 = swift_allocObject();
      sub_100031468(v264, v266 + v631, type metadata accessor for TaskParametersRecord);
      v267 = sub_100032860();
      os_log_type_t v268 = sub_100032AA0();
      uint64_t v269 = swift_allocObject();
      *(unsigned char *)(v269 + 16) = 32;
      uint64_t v270 = swift_allocObject();
      *(unsigned char *)(v270 + 16) = 8;
      v271 = v1;
      uint64_t v272 = swift_allocObject();
      *(void *)(v272 + 16) = sub_100030A5C;
      *(void *)(v272 + 24) = v266;
      uint64_t v273 = swift_allocObject();
      *(void *)(v273 + 16) = sub_100031B40;
      *(void *)(v273 + 24) = v272;
      uint64_t v274 = swift_allocObject();
      *(_OWORD *)(v274 + 16) = xmmword_100033B60;
      *(void *)(v274 + 32) = sub_100031D8C;
      *(void *)(v274 + 40) = v269;
      *(void *)(v274 + 48) = sub_100031D8C;
      *(void *)(v274 + 56) = v270;
      *(void *)(v274 + 64) = sub_100031B50;
      *(void *)(v274 + 72) = v273;
      swift_retain();
      swift_retain();
      swift_retain();
      swift_bridgeObjectRelease();
      if (os_log_type_enabled(v267, v268))
      {
        uint64_t v275 = (uint8_t *)swift_slowAlloc();
        uint64_t v276 = swift_slowAlloc();
        uint64_t v667 = 0;
        v668[0] = v276;
        *(_WORD *)uint64_t v275 = 258;
        v275[2] = *(unsigned char *)(v269 + 16);
        if (v655) {
          goto LABEL_137;
        }
        swift_release();
        v275[3] = *(unsigned char *)(v270 + 16);
        v666[0] = (uint64_t)(v275 + 4);
        swift_release();
        sub_10002C274(v666, (uint64_t)&v667, v668, *(uint64_t (**)(void))(v273 + 16));
        v271 = v644;
        uint64_t v277 = v644[147];
        uint64_t v278 = v644[120];
        uint64_t v279 = v644[87];
        uint64_t v624 = v644[83];
        swift_release();
        _os_log_impl((void *)&_mh_execute_header, v267, v268, "Task %s doesn't have a valid taskFolder. Skipping task.", v275, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        v651(v277, v278);
        (*v607)(v279, v624);
      }
      else
      {
        uint64_t v287 = v271[147];
        uint64_t v288 = v271[120];
        uint64_t v289 = v271[87];
        uint64_t v290 = v271[83];

        swift_release();
        swift_release();
        swift_release();
        v651(v287, v288);
        (*v607)(v289, v290);
      }
      uint64_t v196 = v271[67];
      uint64_t v1 = v271;
      goto LABEL_63;
    }
    uint64_t v621 = v187;
    uint64_t v222 = v1[72];
    (*v596)(v1[73], 1, 1, v1[74]);
    uint64_t v223 = sub_1000324E0();
    uint64_t v224 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v223 - 8) + 104);
    v224(v222, v193, v223);
    sub_100032520();
    uint64_t v225 = v193;
    if (qword_10003C3A8 != -1) {
      swift_once();
    }
    uint64_t v226 = v1[82];
    uint64_t v622 = v1[74];
    uint64_t v227 = v1[72];
    uint64_t v228 = v1[70];
    uint64_t v229 = *(void *)algn_10003C798;
    v1[18] = qword_10003C790;
    v1[19] = v229;
    v224(v227, v225, v223);
    sub_10002B8C0();
    swift_bridgeObjectRetain();
    sub_100032530();
    (*v594)(v227, v228);
    swift_bridgeObjectRelease();
    uint64_t v230 = *v619;
    (*v619)(v226, v622);
    uint64_t v231 = *(void *)(v598 + 32);
    unint64_t v232 = *(void *)(v598 + 40);
    sub_1000062A0(v231, v232);
    sub_100032550();
    if (!v655)
    {
      uint64_t v280 = v1[87];
      uint64_t v281 = v1[83];
      uint64_t v282 = v1[80];
      uint64_t v283 = v1[74];
      uint64_t v196 = v1[67];
      sub_100006248(v231, v232);
      v230(v282, v283);
      (*v607)(v280, v281);
      uint64_t v655 = 0;
      uint64_t v187 = v621;
LABEL_63:
      uint64_t v197 = v663;
      goto LABEL_64;
    }
    uint64_t v623 = v230;
    v233 = (void (*)(uint64_t, uint64_t, uint64_t))v1[180];
    uint64_t v234 = v1[179];
    uint64_t v235 = v1[124];
    uint64_t v236 = v1[120];
    uint64_t v237 = v1[82];
    uint64_t v238 = v1[80];
    uint64_t v239 = v1[74];
    sub_100006248(v231, v232);
    v233(v235, v234, v236);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v591 + 16))(v237, v238, v239);
    unint64_t v240 = (*(unsigned __int8 *)(v591 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v591 + 80);
    uint64_t v241 = swift_allocObject();
    (*(void (**)(unint64_t, uint64_t, uint64_t))(v591 + 32))(v241 + v240, v237, v239);
    uint64_t v242 = swift_allocObject();
    *(void *)(v242 + 16) = sub_100030E08;
    *(void *)(v242 + 24) = v241;
    uint64_t v243 = swift_allocObject();
    *(void *)(v243 + 16) = v655;
    swift_errorRetain();
    uint64_t v244 = sub_100032860();
    LOBYTE(v235) = sub_100032AA0();
    uint64_t v245 = swift_allocObject();
    *(unsigned char *)(v245 + 16) = 32;
    uint64_t v246 = swift_allocObject();
    *(unsigned char *)(v246 + 16) = 8;
    uint64_t v247 = swift_allocObject();
    *(void *)(v247 + 16) = sub_100031B44;
    *(void *)(v247 + 24) = v242;
    uint64_t v248 = swift_allocObject();
    *(void *)(v248 + 16) = sub_100031B40;
    *(void *)(v248 + 24) = v247;
    uint64_t v249 = swift_allocObject();
    *(unsigned char *)(v249 + 16) = 64;
    uint64_t v250 = swift_allocObject();
    *(unsigned char *)(v250 + 16) = 8;
    uint64_t v251 = swift_allocObject();
    *(void *)(v251 + 16) = sub_100031D84;
    *(void *)(v251 + 24) = v243;
    uint64_t v252 = swift_allocObject();
    *(void *)(v252 + 16) = sub_10002FE30;
    *(void *)(v252 + 24) = v251;
    uint64_t v253 = swift_allocObject();
    *(void *)(v253 + 16) = sub_100031B4C;
    *(void *)(v253 + 24) = v252;
    uint64_t v254 = swift_allocObject();
    *(_OWORD *)(v254 + 16) = xmmword_100033B70;
    *(void *)(v254 + 32) = sub_100031D8C;
    *(void *)(v254 + 40) = v245;
    *(void *)(v254 + 48) = sub_100031D8C;
    *(void *)(v254 + 56) = v246;
    *(void *)(v254 + 64) = sub_100031B50;
    *(void *)(v254 + 72) = v248;
    *(void *)(v254 + 80) = sub_100031D8C;
    *(void *)(v254 + 88) = v249;
    *(void *)(v254 + 96) = sub_100031D8C;
    *(void *)(v254 + 104) = v250;
    *(void *)(v254 + 112) = sub_100031B54;
    *(void *)(v254 + 120) = v253;
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_bridgeObjectRelease();
    os_log_type_t v255 = v235;
    if (os_log_type_enabled(v244, (os_log_type_t)v235))
    {
      uint64_t v256 = (uint8_t *)swift_slowAlloc();
      uint64_t v652 = (void *)swift_slowAlloc();
      uint64_t v257 = swift_slowAlloc();
      uint64_t v667 = v652;
      v668[0] = v257;
      *(_WORD *)uint64_t v256 = 514;
      uint64_t v256[2] = *(unsigned char *)(v245 + 16);
      swift_release();
      v256[3] = *(unsigned char *)(v246 + 16);
      v666[0] = (uint64_t)(v256 + 4);
      swift_release();
      sub_10002C274(v666, (uint64_t)&v667, v668, *(uint64_t (**)(void))(v248 + 16));
      swift_release();
      uint64_t v258 = v666[0];
      *(unsigned char *)v666[0] = *(unsigned char *)(v249 + 16);
      swift_release();
      *(unsigned char *)(v258 + 1) = *(unsigned char *)(v250 + 16);
      v666[0] = v258 + 2;
      swift_release();
      sub_10002C320(v666, &v667, (uint64_t)v668, *(uint64_t (**)(void))(v253 + 16));
      uint64_t v259 = v644[124];
      uint64_t v260 = v644[120];
      uint64_t v603 = v644[87];
      uint64_t v261 = v644[83];
      uint64_t v262 = v644[80];
      uint64_t v263 = v644[74];
      swift_release();
      _os_log_impl((void *)&_mh_execute_header, v244, v255, "Failed at writing taskParamFile: %s : %@", v256, 0x16u);
      sub_100005644(&qword_10003C8A0);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      swift_errorRelease();
      v651 = *v635;
      (*v635)(v259, v260);
      v623(v262, v263);
      (*v607)(v603, v261);
    }
    else
    {
      uint64_t v284 = v644[124];
      uint64_t v285 = v644[120];
      uint64_t v286 = v644[87];
      uint64_t v604 = v644[83];
      uint64_t v586 = v644[74];
      os_log_t loga = (os_log_t)v644[80];

      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_errorRelease();
      v651 = *v635;
      (*v635)(v284, v285);
      v623((uint64_t)loga, v586);
      (*v607)(v286, v604);
    }
    uint64_t v187 = v621;
    uint64_t v197 = v663;
    uint64_t v655 = 0;
    uint64_t v1 = v644;
    uint64_t v196 = v644[67];
LABEL_64:
    uint64_t v193 = v638;
    sub_100030BD0(v196, type metadata accessor for TaskParametersRecord);
    uint64_t v192 = v197 + v642;
    --v187;
  }
  while (v187);
  swift_bridgeObjectRelease();
LABEL_84:
  uint64_t v291 = v1[237];
  ((void (*)(void, void, void))v1[180])(v1[145], v1[179], v1[120]);
  uint64_t v292 = swift_allocObject();
  *(void *)(v292 + 16) = sub_10002FFA8;
  *(void *)(v292 + 24) = v291;
  swift_retain();
  v293 = sub_100032860();
  os_log_type_t v294 = sub_100032A80();
  uint64_t v295 = swift_allocObject();
  *(unsigned char *)(v295 + 16) = 32;
  uint64_t v296 = swift_allocObject();
  *(unsigned char *)(v296 + 16) = 8;
  uint64_t v297 = swift_allocObject();
  *(void *)(v297 + 16) = sub_100030ADC;
  *(void *)(v297 + 24) = v292;
  uint64_t v298 = swift_allocObject();
  *(void *)(v298 + 16) = sub_100031B40;
  *(void *)(v298 + 24) = v297;
  uint64_t v299 = swift_allocObject();
  *(_OWORD *)(v299 + 16) = xmmword_100033B60;
  *(void *)(v299 + 32) = sub_100031D8C;
  *(void *)(v299 + 40) = v295;
  *(void *)(v299 + 48) = sub_100031D8C;
  *(void *)(v299 + 56) = v296;
  *(void *)(v299 + 64) = sub_100031B50;
  *(void *)(v299 + 72) = v298;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRelease();
  if (os_log_type_enabled(v293, v294))
  {
    uint64_t v300 = (uint8_t *)swift_slowAlloc();
    uint64_t v301 = swift_slowAlloc();
    uint64_t v667 = 0;
    v668[0] = v301;
    *(_WORD *)uint64_t v300 = 258;
    v300[2] = *(unsigned char *)(v295 + 16);
    if (!v655)
    {
      swift_release();
      v300[3] = *(unsigned char *)(v296 + 16);
      v666[0] = (uint64_t)(v300 + 4);
      swift_release();
      sub_10002C274(v666, (uint64_t)&v667, v668, *(uint64_t (**)(void))(v298 + 16));
      uint64_t v302 = v1[145];
      uint64_t v303 = v1[120];
      swift_release();
      _os_log_impl((void *)&_mh_execute_header, v293, v294, "Processing TaskPayloadRecords: %s", v300, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      uint64_t v304 = v302;
      uint64_t v305 = v303;
      goto LABEL_88;
    }
LABEL_137:
    return swift_errorRelease();
  }
  uint64_t v306 = v1[145];
  uint64_t v307 = v1[120];
  swift_release();
  swift_release();
  swift_release();

  uint64_t v304 = v306;
  uint64_t v305 = v307;
LABEL_88:
  v651(v304, v305);
  uint64_t v308 = v1[237];
  swift_beginAccess();
  uint64_t v309 = *(void *)(v308 + 16);
  uint64_t v310 = *(void *)(v309 + 16);
  if (!v310)
  {
LABEL_134:
    uint64_t v537 = (void (*)(uint64_t, uint64_t))v1[186];
    uint64_t v538 = v1[115];
    uint64_t v539 = v1[109];
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_1000325A0();
    sub_100032560();
    uint64_t v541 = v540;
    v537(v538, v539);
    sub_100031AE8(0, &qword_10003C828);
    id v542 = sub_100027BB0(0xD000000000000010, 0x8000000100034010);
    if (v542)
    {
      uint64_t v543 = v542;
      ((void (*)(void, void, void))v1[180])(v1[138], v1[179], v1[120]);
      uint64_t v544 = swift_allocObject();
      *(void *)(v544 + 16) = v541;
      uint64_t v545 = sub_100032860();
      os_log_type_t v546 = sub_100032A80();
      uint64_t v547 = swift_allocObject();
      *(unsigned char *)(v547 + 16) = 0;
      uint64_t v548 = swift_allocObject();
      *(unsigned char *)(v548 + 16) = 8;
      uint64_t v549 = v1;
      uint64_t v550 = swift_allocObject();
      *(void *)(v550 + 16) = sub_100031B60;
      *(void *)(v550 + 24) = v544;
      uint64_t v551 = swift_allocObject();
      *(void *)(v551 + 16) = sub_100030C60;
      *(void *)(v551 + 24) = v550;
      uint64_t v552 = swift_allocObject();
      *(_OWORD *)(v552 + 16) = xmmword_100033B60;
      *(void *)(v552 + 32) = sub_100031D8C;
      *(void *)(v552 + 40) = v547;
      *(void *)(v552 + 48) = sub_100031D8C;
      *(void *)(v552 + 56) = v548;
      *(void *)(v552 + 64) = sub_100030C88;
      *(void *)(v552 + 72) = v551;
      swift_retain();
      swift_retain();
      swift_retain();
      swift_bridgeObjectRelease();
      if (os_log_type_enabled(v545, v546))
      {
        uint64_t v553 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v553 = 256;
        v553[2] = *(unsigned char *)(v547 + 16);
        if (v655) {
          goto LABEL_137;
        }
        swift_release();
        v553[3] = *(unsigned char *)(v548 + 16);
        uint64_t v565 = swift_release();
        v668[0] = (*(double (**)(uint64_t))(v551 + 16))(v565);
        sub_100032AF0();
        uint64_t v1 = v644;
        uint64_t v566 = v644[138];
        uint64_t v567 = v644[120];
        swift_release();
        _os_log_impl((void *)&_mh_execute_header, v545, v546, "Marking lastSuccessTimestamp: %f", v553, 0xCu);
        swift_slowDealloc();

        v651(v566, v567);
      }
      else
      {
        uint64_t v554 = v549[138];
        uint64_t v555 = v549[120];
        swift_release();
        swift_release();
        swift_release();

        v651(v554, v555);
        uint64_t v1 = v549;
      }
      Class v568 = sub_100032A10().super.super.isa;
      NSString v569 = sub_100032920();
      [v543 setValue:v568 forKey:v569];
    }
    uint64_t v570 = (void *)v1[195];
    v571 = (void *)v1[194];
    uint64_t v572 = (void *)v1[193];
    uint64_t v573 = (void *)v1[192];
    uint64_t v574 = (void *)v1[191];
    uint64_t v575 = (void *)v1[190];
    uint64_t v562 = v1[188];
    uint64_t v665 = v1[119];
    uint64_t v563 = v1[118];
    uint64_t v654 = v1[117];
    id v576 = objc_allocWithZone((Class)sub_100032780());
    uint64_t v579 = sub_100032770();

    swift_release();
    goto LABEL_146;
  }
  uint64_t v585 = v1 + 40;
  uint64_t v580 = v1 + 42;
  uint64_t v311 = v1[84];
  uint64_t v312 = v1[75];
  uint64_t v313 = v1[58];
  uint64_t v314 = *(unsigned __int8 *)(v313 + 80);
  uint64_t v315 = v309 + ((v314 + 32) & ~v314);
  uint64_t v639 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v311 + 48);
  v595 = (void (**)(void, void, void))(v311 + 32);
  v592 = (void (**)(void, uint64_t, uint64_t, uint64_t))(v312 + 56);
  uint64_t v587 = (void (**)(uint64_t, uint64_t))(v1[71] + 8);
  uint64_t v620 = (void (**)(uint64_t, uint64_t))(v312 + 8);
  uint64_t v584 = v312;
  uint64_t v643 = (void (**)(uint64_t, uint64_t))(v1[121] + 8);
  v593 = (void (**)(uint64_t, uint64_t))(v311 + 8);
  uint64_t v625 = (v314 + 16) & ~v314;
  uint64_t v636 = *(void *)(v313 + 72);
  uint64_t v316 = enum case for URL.DirectoryHint.inferFromPath(_:);
  swift_bridgeObjectRetain();
  unsigned int v632 = v316;
  while (2)
  {
    sub_100030B2C(v315, v1[60], type metadata accessor for TaskPayloadRecord);
    char v323 = sub_100032A00();
    uint64_t v324 = v1[229];
    if ((v323 & 1) == 0)
    {
      uint64_t v325 = v1[83];
      uint64_t v326 = v1[60];
      uint64_t v327 = v1[54];
      *(void *)(swift_task_alloc() + 16) = v326;
      sub_100028F5C((uint64_t (*)(char *))sub_100031B24, v324, v327);
      swift_task_dealloc();
      uint64_t v664 = v315;
      if ((*v639)(v327, 1, v325) == 1)
      {
        uint64_t v647 = v310;
        v328 = (void (*)(uint64_t, uint64_t, uint64_t))v1[180];
        uint64_t v329 = v1[179];
        uint64_t v330 = v1[139];
        uint64_t v331 = v1[120];
        uint64_t v333 = v1[60];
        uint64_t v332 = v1[61];
        sub_1000065E4(v1[54], &qword_10003C7F0);
        v328(v330, v329, v331);
        sub_100030B2C(v333, v332, type metadata accessor for TaskPayloadRecord);
        uint64_t v334 = swift_allocObject();
        sub_100031468(v332, v334 + v625, type metadata accessor for TaskPayloadRecord);
        v335 = sub_100032860();
        os_log_type_t v336 = sub_100032AA0();
        uint64_t v337 = swift_allocObject();
        *(unsigned char *)(v337 + 16) = 32;
        uint64_t v338 = swift_allocObject();
        *(unsigned char *)(v338 + 16) = 8;
        uint64_t v339 = swift_allocObject();
        *(void *)(v339 + 16) = sub_100030B98;
        *(void *)(v339 + 24) = v334;
        uint64_t v340 = swift_allocObject();
        *(void *)(v340 + 16) = sub_100031B40;
        *(void *)(v340 + 24) = v339;
        uint64_t v341 = swift_allocObject();
        *(_OWORD *)(v341 + 16) = xmmword_100033B60;
        *(void *)(v341 + 32) = sub_100031D8C;
        *(void *)(v341 + 40) = v337;
        *(void *)(v341 + 48) = sub_100031D8C;
        *(void *)(v341 + 56) = v338;
        *(void *)(v341 + 64) = sub_100031B50;
        *(void *)(v341 + 72) = v340;
        swift_retain();
        swift_retain();
        swift_retain();
        swift_bridgeObjectRelease();
        if (os_log_type_enabled(v335, v336))
        {
          v342 = (uint8_t *)swift_slowAlloc();
          uint64_t v343 = swift_slowAlloc();
          uint64_t v667 = 0;
          v668[0] = v343;
          *(_WORD *)v342 = 258;
          v342[2] = *(unsigned char *)(v337 + 16);
          if (v655) {
            goto LABEL_137;
          }
          swift_release();
          v342[3] = *(unsigned char *)(v338 + 16);
          v666[0] = (uint64_t)(v342 + 4);
          swift_release();
          sub_10002C274(v666, (uint64_t)&v667, v668, *(uint64_t (**)(void))(v340 + 16));
          uint64_t v344 = v1[139];
          uint64_t v345 = v1[120];
          swift_release();
          _os_log_impl((void *)&_mh_execute_header, v335, v336, "Task %s not registered on the system. Skipping task.", v342, 0xCu);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();

          uint64_t v319 = v344;
          uint64_t v320 = v345;
        }
        else
        {
          uint64_t v317 = v1[139];
          uint64_t v318 = v1[120];
          swift_release();
          swift_release();
          swift_release();

          uint64_t v319 = v317;
          uint64_t v320 = v318;
        }
        v651(v319, v320);
LABEL_92:
        uint64_t v321 = v1[60];
LABEL_93:
        uint64_t v322 = v647;
      }
      else
      {
        (*v595)(v1[86], v1[54], v1[83]);
        sub_1000326D0();
        if (v346)
        {
          uint64_t v647 = v310;
          uint64_t v347 = v1[72];
          id v590 = *v592;
          (*v592)(v1[73], 1, 1, v1[74]);
          uint64_t v348 = sub_1000324E0();
          uint64_t v349 = *(NSObject **)(*(void *)(v348 - 8) + 104);
          ((void (*)(uint64_t, uint64_t, uint64_t))v349)(v347, v316, v348);
          sub_100032520();
          if (qword_10003C3A0 != -1) {
            swift_once();
          }
          uint64_t v350 = v1[82];
          uint64_t v351 = v1[74];
          uint64_t v352 = v1[72];
          uint64_t v353 = v1[70];
          uint64_t v354 = *(void *)algn_10003C788;
          v1[16] = qword_10003C780;
          v1[17] = v354;
          ((void (*)(uint64_t, uint64_t, uint64_t))v349)(v352, v316, v348);
          os_log_t log = v349;
          sub_10002B8C0();
          swift_bridgeObjectRetain();
          sub_100032530();
          uint64_t v355 = *v587;
          (*v587)(v352, v353);
          swift_bridgeObjectRelease();
          v597 = *v620;
          (*v620)(v350, v351);
          id v583 = self;
          id v356 = [v583 defaultManager];
          sub_100032510(0);
          NSString v357 = sub_100032920();
          swift_bridgeObjectRelease();
          v1[40] = 0;
          LODWORD(v352) = [v356 createDirectoryAtPath:v357 withIntermediateDirectories:1 attributes:0 error:v585];

          unint64_t v358 = (void *)v1[40];
          uint64_t v599 = (void (*)(uint64_t, uint64_t, uint64_t))v1[180];
          uint64_t v359 = v1[179];
          uint64_t v360 = v1;
          uint64_t v361 = v1[120];
          uint64_t v608 = v360[82];
          uint64_t v362 = v360[74];
          if (v352)
          {
            v581 = v355;
            uint64_t v363 = v360[78];
            uint64_t v364 = v360[72];
            uint64_t v582 = v360[143];
            v590(v360[73], 1, 1, v362);
            ((void (*)(uint64_t, uint64_t, uint64_t))log)(v364, v316, v348);
            id v365 = v358;
            swift_bridgeObjectRetain();
            sub_100032520();
            v599(v582, v359, v361);
            uint64_t v366 = *(void (**)(uint64_t, uint64_t, uint64_t))(v584 + 16);
            v366(v608, v363, v362);
            unint64_t v367 = (*(unsigned __int8 *)(v584 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v584 + 80);
            uint64_t v368 = swift_allocObject();
            v369 = *(void (**)(unint64_t, uint64_t, uint64_t))(v584 + 32);
            v369(v368 + v367, v608, v362);
            uint64_t v370 = swift_allocObject();
            *(void *)(v370 + 16) = sub_100030E08;
            *(void *)(v370 + 24) = v368;
            uint64_t v371 = sub_100032860();
            os_log_type_t v372 = sub_100032A80();
            uint64_t v373 = swift_allocObject();
            *(unsigned char *)(v373 + 16) = 32;
            uint64_t v374 = swift_allocObject();
            *(unsigned char *)(v374 + 16) = 8;
            uint64_t v375 = swift_allocObject();
            *(void *)(v375 + 16) = sub_100031B44;
            *(void *)(v375 + 24) = v370;
            uint64_t v376 = swift_allocObject();
            *(void *)(v376 + 16) = sub_100031B40;
            *(void *)(v376 + 24) = v375;
            uint64_t v377 = swift_allocObject();
            *(_OWORD *)(v377 + 16) = xmmword_100033B60;
            *(void *)(v377 + 32) = sub_100031D8C;
            *(void *)(v377 + 40) = v373;
            *(void *)(v377 + 48) = sub_100031D8C;
            *(void *)(v377 + 56) = v374;
            *(void *)(v377 + 64) = sub_100031B50;
            *(void *)(v377 + 72) = v376;
            swift_retain();
            swift_retain();
            swift_retain();
            swift_bridgeObjectRelease();
            uint64_t v600 = v369;
            if (os_log_type_enabled(v371, v372))
            {
              unint64_t v378 = v367;
              uint64_t v379 = (uint8_t *)swift_slowAlloc();
              uint64_t v380 = swift_slowAlloc();
              uint64_t v667 = 0;
              v668[0] = v380;
              *(_WORD *)uint64_t v379 = 258;
              v379[2] = *(unsigned char *)(v373 + 16);
              if (v655) {
                goto LABEL_137;
              }
              swift_release();
              v379[3] = *(unsigned char *)(v374 + 16);
              v666[0] = (uint64_t)(v379 + 4);
              swift_release();
              sub_10002C274(v666, (uint64_t)&v667, v668, *(uint64_t (**)(void))(v376 + 16));
              uint64_t v1 = v644;
              uint64_t v381 = v644[143];
              uint64_t v382 = v644[120];
              swift_release();
              _os_log_impl((void *)&_mh_execute_header, v371, v372, "Processing: %s", v379, 0xCu);
              swift_arrayDestroy();
              swift_slowDealloc();
              swift_slowDealloc();

              uint64_t v383 = v382;
              v369 = v600;
              v651(v381, v383);
              unint64_t v367 = v378;
            }
            else
            {
              uint64_t v434 = v644[143];
              uint64_t v435 = v644[120];
              swift_release();
              swift_release();
              swift_release();

              v651(v434, v435);
              uint64_t v1 = v644;
            }
            if (sub_1000291C0(v1[78], v1[79]))
            {
              uint64_t v436 = v1[82];
              uint64_t v437 = v1[79];
              uint64_t v438 = v1[74];
              ((void (*)(void, void, void))v1[180])(v1[142], v1[179], v1[120]);
              v366(v436, v437, v438);
              uint64_t v439 = swift_allocObject();
              v369(v439 + v367, v436, v438);
              uint64_t v440 = swift_allocObject();
              *(void *)(v440 + 16) = sub_100030E08;
              *(void *)(v440 + 24) = v439;
              uint64_t v441 = sub_100032860();
              os_log_type_t v442 = sub_100032A80();
              uint64_t v443 = swift_allocObject();
              *(unsigned char *)(v443 + 16) = 32;
              uint64_t v444 = swift_allocObject();
              *(unsigned char *)(v444 + 16) = 8;
              uint64_t v445 = swift_allocObject();
              *(void *)(v445 + 16) = sub_100031B44;
              *(void *)(v445 + 24) = v440;
              uint64_t v446 = swift_allocObject();
              *(void *)(v446 + 16) = sub_100031B40;
              *(void *)(v446 + 24) = v445;
              uint64_t v447 = swift_allocObject();
              *(_OWORD *)(v447 + 16) = xmmword_100033B60;
              *(void *)(v447 + 32) = sub_100031D8C;
              *(void *)(v447 + 40) = v443;
              *(void *)(v447 + 48) = sub_100031D8C;
              *(void *)(v447 + 56) = v444;
              *(void *)(v447 + 64) = sub_100031B50;
              *(void *)(v447 + 72) = v446;
              swift_retain();
              swift_retain();
              swift_retain();
              swift_bridgeObjectRelease();
              if (os_log_type_enabled(v441, v442))
              {
                v448 = (uint8_t *)swift_slowAlloc();
                uint64_t v449 = swift_slowAlloc();
                uint64_t v667 = 0;
                v668[0] = v449;
                *(_WORD *)v448 = 258;
                v448[2] = *(unsigned char *)(v443 + 16);
                if (v655) {
                  goto LABEL_137;
                }
                swift_release();
                v448[3] = *(unsigned char *)(v444 + 16);
                v666[0] = (uint64_t)(v448 + 4);
                swift_release();
                sub_10002C274(v666, (uint64_t)&v667, v668, *(uint64_t (**)(void))(v446 + 16));
                uint64_t v609 = v1[142];
                uint64_t v450 = v1[120];
                uint64_t v627 = v1[86];
                uint64_t v614 = v1[83];
                uint64_t v451 = v1;
                uint64_t v452 = v1[79];
                uint64_t v453 = v451[78];
                uint64_t v454 = v451[74];
                swift_release();
                _os_log_impl((void *)&_mh_execute_header, v441, v442, "TaskPayload extracted at: %s", v448, 0xCu);
                swift_arrayDestroy();
                swift_slowDealloc();
                swift_slowDealloc();

                v651(v609, v450);
                v597(v453, v454);
                v597(v452, v454);
                (*v593)(v627, v614);
              }
              else
              {
                uint64_t v465 = v1[142];
                uint64_t v466 = v1[120];
                uint64_t v629 = v1[86];
                uint64_t v467 = v1[83];
                uint64_t v451 = v1;
                uint64_t v468 = v1[79];
                uint64_t v469 = v441;
                uint64_t v470 = v451[78];
                uint64_t v471 = v451[74];

                swift_release();
                swift_release();
                swift_release();
                v651(v465, v466);
                v597(v470, v471);
                v597(v468, v471);
                (*v593)(v629, v467);
              }
              uint64_t v321 = v451[60];
              uint64_t v1 = v451;
              goto LABEL_93;
            }
            uint64_t v616 = v366;
            ((void (*)(void, void, void))v1[180])(v1[141], v1[179], v1[120]);
            uint64_t v459 = sub_100032860();
            os_log_type_t v460 = sub_100032A80();
            BOOL v461 = os_log_type_enabled(v459, v460);
            uint64_t v462 = v1[141];
            uint64_t v463 = v1[120];
            if (v461)
            {
              uint64_t v464 = (uint8_t *)swift_slowAlloc();
              uint64_t v667 = 0;
              v668[0] = 0;
              *(_WORD *)uint64_t v464 = 0;
              v666[0] = (uint64_t)(v464 + 2);
              sub_10002BCC0((uint64_t)_swiftEmptyArrayStorage, (uint64_t)v666, (uint64_t)&v667, (uint64_t)v668);
              swift_bridgeObjectRelease();
              _os_log_impl((void *)&_mh_execute_header, v459, v460, "Failed at processing archive, copying raw archive into taskFolder.", v464, 2u);
              swift_slowDealloc();
            }
            else
            {
              swift_bridgeObjectRelease();
            }

            v651(v462, v463);
            uint64_t v472 = v1[72];
            uint64_t v473 = v1[70];
            v1[14] = 0x612E737465737361;
            v1[15] = 0xEA00000000007261;
            sub_100028CB8(v472);
            sub_100032530();
            v581(v472, v473);
            swift_bridgeObjectRelease();
            id v474 = [v583 defaultManager];
            sub_1000324F0(v475);
            NSString v477 = v476;
            sub_1000324F0(v478);
            uint64_t v480 = v479;
            v1[42] = 0;
            unsigned int v481 = [v474 copyItemAtURL:v477 toURL:v479 error:v580];

            uint64_t v482 = (void *)v1[42];
            if (v481)
            {
              uint64_t v483 = v1[86];
              uint64_t v484 = v1[83];
              uint64_t v485 = v1[79];
              uint64_t v486 = v1[78];
              uint64_t v487 = v1[77];
              uint64_t v488 = v1[74];
              uint64_t v321 = v1[60];
              id v489 = v482;
              v597(v487, v488);
              v597(v486, v488);
              v597(v485, v488);
              (*v593)(v483, v484);
              goto LABEL_93;
            }
            v490 = v1;
            os_log_type_t v491 = (void (*)(uint64_t, uint64_t, uint64_t))v1[180];
            uint64_t v492 = v490[179];
            uint64_t v493 = v490[122];
            uint64_t v494 = v490[120];
            uint64_t v495 = v490[82];
            uint64_t v496 = v490[77];
            unint64_t v656 = v367;
            uint64_t v497 = v490[74];
            id v498 = v482;
            uint64_t v499 = sub_1000324D0();

            swift_willThrow();
            v491(v493, v492, v494);
            v616(v495, v496, v497);
            uint64_t v500 = swift_allocObject();
            v600(v500 + v656, v495, v497);
            uint64_t v501 = swift_allocObject();
            *(void *)(v501 + 16) = sub_100030E08;
            *(void *)(v501 + 24) = v500;
            uint64_t v502 = swift_allocObject();
            *(void *)(v502 + 16) = v499;
            swift_errorRetain();
            uint64_t v503 = sub_100032860();
            LOBYTE(v499) = sub_100032AA0();
            uint64_t v504 = swift_allocObject();
            *(unsigned char *)(v504 + 16) = 32;
            uint64_t v505 = swift_allocObject();
            *(unsigned char *)(v505 + 16) = 8;
            uint64_t v506 = swift_allocObject();
            *(void *)(v506 + 16) = sub_100031B44;
            *(void *)(v506 + 24) = v501;
            uint64_t v507 = swift_allocObject();
            *(void *)(v507 + 16) = sub_100031B40;
            *(void *)(v507 + 24) = v506;
            uint64_t v508 = swift_allocObject();
            *(unsigned char *)(v508 + 16) = 64;
            uint64_t v509 = swift_allocObject();
            *(unsigned char *)(v509 + 16) = 8;
            uint64_t v510 = swift_allocObject();
            *(void *)(v510 + 16) = sub_100031D84;
            *(void *)(v510 + 24) = v502;
            uint64_t v511 = swift_allocObject();
            *(void *)(v511 + 16) = sub_10002FE30;
            *(void *)(v511 + 24) = v510;
            uint64_t v512 = swift_allocObject();
            *(void *)(v512 + 16) = sub_100031B4C;
            *(void *)(v512 + 24) = v511;
            uint64_t v513 = swift_allocObject();
            *(_OWORD *)(v513 + 16) = xmmword_100033B70;
            *(void *)(v513 + 32) = sub_100031D8C;
            *(void *)(v513 + 40) = v504;
            *(void *)(v513 + 48) = sub_100031D8C;
            *(void *)(v513 + 56) = v505;
            *(void *)(v513 + 64) = sub_100031B50;
            *(void *)(v513 + 72) = v507;
            *(void *)(v513 + 80) = sub_100031D8C;
            *(void *)(v513 + 88) = v508;
            *(void *)(v513 + 96) = sub_100031D8C;
            *(void *)(v513 + 104) = v509;
            *(void *)(v513 + 112) = sub_100031B54;
            *(void *)(v513 + 120) = v512;
            swift_retain();
            swift_retain();
            swift_retain();
            swift_retain();
            swift_retain();
            swift_retain();
            swift_bridgeObjectRelease();
            os_log_type_t v514 = v499;
            v630 = v503;
            if (os_log_type_enabled(v503, (os_log_type_t)v499))
            {
              v515 = (uint8_t *)swift_slowAlloc();
              uint64_t v516 = (void *)swift_slowAlloc();
              uint64_t v617 = swift_slowAlloc();
              uint64_t v667 = v516;
              v668[0] = v617;
              *(_WORD *)v515 = 514;
              v515[2] = *(unsigned char *)(v504 + 16);
              swift_release();
              v515[3] = *(unsigned char *)(v505 + 16);
              v666[0] = (uint64_t)(v515 + 4);
              swift_release();
              sub_10002C274(v666, (uint64_t)&v667, v668, *(uint64_t (**)(void))(v507 + 16));
              swift_release();
              uint64_t v517 = v666[0];
              *(unsigned char *)v666[0] = *(unsigned char *)(v508 + 16);
              swift_release();
              *(unsigned char *)(v517 + 1) = *(unsigned char *)(v509 + 16);
              v666[0] = v517 + 2;
              swift_release();
              sub_10002C320(v666, &v667, (uint64_t)v668, *(uint64_t (**)(void))(v512 + 16));
              uint64_t v518 = v644[122];
              uint64_t v519 = v644[120];
              uint64_t v610 = v644[86];
              uint64_t v605 = v644[83];
              uint64_t v601 = v644[79];
              uint64_t v520 = v644[78];
              uint64_t v521 = v644[77];
              uint64_t v522 = v644[74];
              swift_release();
              _os_log_impl((void *)&_mh_execute_header, v630, v514, "Failed at asset to: %s : %@", v515, 0x16u);
              sub_100005644(&qword_10003C8A0);
              swift_arrayDestroy();
              swift_slowDealloc();
              swift_arrayDestroy();
              swift_slowDealloc();
              swift_slowDealloc();

              swift_errorRelease();
              v651(v518, v519);
              v597(v521, v522);
              v597(v520, v522);
              v597(v601, v522);
              (*v593)(v610, v605);
            }
            else
            {
              uint64_t v523 = v644[122];
              uint64_t v524 = v644[120];
              uint64_t v618 = v644[86];
              uint64_t v611 = v644[83];
              uint64_t v606 = v644[79];
              uint64_t v602 = v644[78];
              uint64_t v525 = v644[77];
              uint64_t v526 = v644[74];

              swift_release();
              swift_release();
              swift_release();
              swift_release();
              swift_release();
              swift_release();
              swift_errorRelease();
              v651(v523, v524);
              v597(v525, v526);
              v597(v602, v526);
              v597(v606, v526);
              (*v593)(v618, v611);
            }
          }
          else
          {
            uint64_t v402 = v360[123];
            uint64_t v403 = v360[79];
            id v404 = v358;
            uint64_t v405 = sub_1000324D0();

            swift_willThrow();
            v599(v402, v359, v361);
            (*(void (**)(uint64_t, uint64_t, uint64_t))(v584 + 16))(v608, v403, v362);
            unint64_t v406 = (*(unsigned __int8 *)(v584 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v584 + 80);
            uint64_t v407 = swift_allocObject();
            (*(void (**)(unint64_t, uint64_t, uint64_t))(v584 + 32))(v407 + v406, v608, v362);
            uint64_t v408 = swift_allocObject();
            *(void *)(v408 + 16) = sub_100030E08;
            *(void *)(v408 + 24) = v407;
            uint64_t v409 = swift_allocObject();
            *(void *)(v409 + 16) = v405;
            swift_errorRetain();
            uint64_t v410 = sub_100032860();
            os_log_type_t v411 = sub_100032AA0();
            uint64_t v412 = swift_allocObject();
            *(unsigned char *)(v412 + 16) = 32;
            uint64_t v413 = swift_allocObject();
            *(unsigned char *)(v413 + 16) = 8;
            uint64_t v414 = swift_allocObject();
            *(void *)(v414 + 16) = sub_100030E20;
            *(void *)(v414 + 24) = v408;
            uint64_t v415 = swift_allocObject();
            *(void *)(v415 + 16) = sub_100031B40;
            *(void *)(v415 + 24) = v414;
            uint64_t v416 = swift_allocObject();
            *(unsigned char *)(v416 + 16) = 64;
            uint64_t v417 = swift_allocObject();
            *(unsigned char *)(v417 + 16) = 8;
            uint64_t v418 = swift_allocObject();
            *(void *)(v418 + 16) = sub_100031D84;
            *(void *)(v418 + 24) = v409;
            uint64_t v419 = swift_allocObject();
            *(void *)(v419 + 16) = sub_10002FE30;
            *(void *)(v419 + 24) = v418;
            uint64_t v420 = swift_allocObject();
            *(void *)(v420 + 16) = sub_100031B4C;
            *(void *)(v420 + 24) = v419;
            uint64_t v421 = swift_allocObject();
            *(_OWORD *)(v421 + 16) = xmmword_100033B70;
            *(void *)(v421 + 32) = sub_100031D8C;
            *(void *)(v421 + 40) = v412;
            *(void *)(v421 + 48) = sub_100031D8C;
            *(void *)(v421 + 56) = v413;
            *(void *)(v421 + 64) = sub_100031B50;
            *(void *)(v421 + 72) = v415;
            *(void *)(v421 + 80) = sub_100031D8C;
            *(void *)(v421 + 88) = v416;
            *(void *)(v421 + 96) = sub_100031D8C;
            *(void *)(v421 + 104) = v417;
            *(void *)(v421 + 112) = sub_100031B54;
            *(void *)(v421 + 120) = v420;
            swift_retain();
            swift_retain();
            swift_retain();
            swift_retain();
            swift_retain();
            swift_retain();
            swift_bridgeObjectRelease();
            uint64_t v653 = v410;
            if (os_log_type_enabled(v410, v411))
            {
              v422 = (uint8_t *)swift_slowAlloc();
              uint64_t v423 = (void *)swift_slowAlloc();
              uint64_t v626 = swift_slowAlloc();
              uint64_t v667 = v423;
              v668[0] = v626;
              *(_WORD *)v422 = 514;
              v422[2] = *(unsigned char *)(v412 + 16);
              swift_release();
              v422[3] = *(unsigned char *)(v413 + 16);
              v666[0] = (uint64_t)(v422 + 4);
              swift_release();
              sub_10002C274(v666, (uint64_t)&v667, v668, *(uint64_t (**)(void))(v415 + 16));
              swift_release();
              uint64_t v424 = v666[0];
              *(unsigned char *)v666[0] = *(unsigned char *)(v416 + 16);
              swift_release();
              *(unsigned char *)(v424 + 1) = *(unsigned char *)(v417 + 16);
              v666[0] = v424 + 2;
              swift_release();
              sub_10002C320(v666, &v667, (uint64_t)v668, *(uint64_t (**)(void))(v420 + 16));
              uint64_t v425 = v644[123];
              uint64_t v426 = v644[120];
              uint64_t v613 = v644[86];
              uint64_t v427 = v644[83];
              uint64_t v428 = v644[79];
              uint64_t v429 = v644[74];
              swift_release();
              _os_log_impl((void *)&_mh_execute_header, v653, v411, "Failed at creating taskAssetsURL: %s : %@", v422, 0x16u);
              sub_100005644(&qword_10003C8A0);
              swift_arrayDestroy();
              swift_slowDealloc();
              swift_arrayDestroy();
              swift_slowDealloc();
              swift_slowDealloc();

              swift_errorRelease();
              v651 = *v643;
              (*v643)(v425, v426);
              v597(v428, v429);
              (*v593)(v613, v427);
            }
            else
            {
              uint64_t v455 = v644[123];
              uint64_t v456 = v644[120];
              uint64_t v457 = v644[86];
              uint64_t v628 = v644[83];
              uint64_t v458 = v644[79];
              uint64_t v615 = v644[74];

              swift_release();
              swift_release();
              swift_release();
              swift_release();
              swift_release();
              swift_release();
              swift_errorRelease();
              v651 = *v643;
              (*v643)(v455, v456);
              v597(v458, v615);
              (*v593)(v457, v628);
            }
          }
          uint64_t v655 = 0;
          uint64_t v1 = v644;
          goto LABEL_92;
        }
        uint64_t v384 = v310;
        uint64_t v386 = v1[60];
        uint64_t v385 = v1[61];
        ((void (*)(void, void, void))v1[180])(v1[140], v1[179], v1[120]);
        sub_100030B2C(v386, v385, type metadata accessor for TaskPayloadRecord);
        uint64_t v387 = swift_allocObject();
        sub_100031468(v385, v387 + v625, type metadata accessor for TaskPayloadRecord);
        os_log_type_t v388 = sub_100032860();
        os_log_type_t v389 = sub_100032AA0();
        uint64_t v390 = swift_allocObject();
        *(unsigned char *)(v390 + 16) = 32;
        uint64_t v391 = swift_allocObject();
        *(unsigned char *)(v391 + 16) = 8;
        uint64_t v392 = swift_allocObject();
        *(void *)(v392 + 16) = sub_100030B98;
        *(void *)(v392 + 24) = v387;
        uint64_t v393 = swift_allocObject();
        *(void *)(v393 + 16) = sub_100031B40;
        *(void *)(v393 + 24) = v392;
        uint64_t v394 = swift_allocObject();
        *(_OWORD *)(v394 + 16) = xmmword_100033B60;
        *(void *)(v394 + 32) = sub_100031D8C;
        *(void *)(v394 + 40) = v390;
        *(void *)(v394 + 48) = sub_100031D8C;
        *(void *)(v394 + 56) = v391;
        *(void *)(v394 + 64) = sub_100031B50;
        *(void *)(v394 + 72) = v393;
        swift_retain();
        swift_retain();
        swift_retain();
        swift_bridgeObjectRelease();
        if (os_log_type_enabled(v388, v389))
        {
          uint64_t v395 = (uint8_t *)swift_slowAlloc();
          uint64_t v396 = swift_slowAlloc();
          uint64_t v667 = 0;
          v668[0] = v396;
          *(_WORD *)uint64_t v395 = 258;
          v395[2] = *(unsigned char *)(v390 + 16);
          if (v655) {
            goto LABEL_137;
          }
          swift_release();
          v395[3] = *(unsigned char *)(v391 + 16);
          v666[0] = (uint64_t)(v395 + 4);
          swift_release();
          sub_10002C274(v666, (uint64_t)&v667, v668, *(uint64_t (**)(void))(v393 + 16));
          uint64_t v397 = v1[140];
          uint64_t v398 = v1[120];
          uint64_t v399 = v1[86];
          uint64_t v400 = v644[83];
          swift_release();
          _os_log_impl((void *)&_mh_execute_header, v388, v389, "Task %s doesn't have a valid taskFolder. Skipping task.", v395, 0xCu);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();

          v651(v397, v398);
          uint64_t v401 = v400;
          uint64_t v1 = v644;
          (*v593)(v399, v401);
        }
        else
        {
          uint64_t v430 = v1[140];
          uint64_t v431 = v1[120];
          uint64_t v432 = v1[86];
          uint64_t v433 = v1[83];

          swift_release();
          swift_release();
          swift_release();
          v651(v430, v431);
          (*v593)(v432, v433);
        }
        uint64_t v321 = v1[60];
        uint64_t v322 = v384;
      }
      uint64_t v316 = v632;
      sub_100030BD0(v321, type metadata accessor for TaskPayloadRecord);
      uint64_t v315 = v664 + v636;
      uint64_t v310 = v322 - 1;
      if (!v310)
      {
        swift_bridgeObjectRelease();
        goto LABEL_134;
      }
      continue;
    }
    break;
  }
  uint64_t v527 = (void (*)(uint64_t, uint64_t, uint64_t))v1[180];
  uint64_t v528 = v1[179];
  uint64_t v529 = v1[144];
  uint64_t v530 = v1[120];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v527(v529, v528, v530);
  uint64_t v531 = sub_100032860();
  os_log_type_t v532 = sub_100032A80();
  BOOL v533 = os_log_type_enabled(v531, v532);
  uint64_t v534 = v1[144];
  uint64_t v535 = v1[120];
  if (v533)
  {
    uint64_t v536 = (uint8_t *)swift_slowAlloc();
    uint64_t v667 = 0;
    v668[0] = 0;
    *(_WORD *)uint64_t v536 = 0;
    v666[0] = (uint64_t)(v536 + 2);
    sub_10002BCC0((uint64_t)_swiftEmptyArrayStorage, (uint64_t)v666, (uint64_t)&v667, (uint64_t)v668);
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v531, v532, "Task cancelled before while processing TaskPayloads.", v536, 2u);
    swift_slowDealloc();
  }
  else
  {
    swift_bridgeObjectRelease();
  }

  v651(v534, v535);
  uint64_t v556 = (void *)v1[195];
  uint64_t v557 = (void *)v1[194];
  v558 = (void *)v1[193];
  uint64_t v559 = (void *)v1[192];
  uint64_t v560 = (void *)v1[191];
  uint64_t v561 = (void *)v1[190];
  uint64_t v562 = v1[188];
  uint64_t v665 = v1[119];
  uint64_t v563 = v1[118];
  uint64_t v654 = v1[117];
  uint64_t v640 = v1[60];
  id v564 = objc_allocWithZone((Class)sub_100032780());
  uint64_t v579 = sub_100032770();

  swift_release();
  sub_100030BD0(v640, type metadata accessor for TaskPayloadRecord);
LABEL_146:
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  sub_100027C1C(v562);
  (*(void (**)(uint64_t, uint64_t))(v563 + 8))(v665, v654);
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  os_log_type_t v577 = (uint64_t (*)(uint64_t))v1[1];
  return v577(v579);
}

uint64_t sub_10001DA40()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 1936) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void **)(v2 + 1560);
    uint64_t v4 = *(void **)(v2 + 1552);
    swift_bridgeObjectRelease();

    swift_bridgeObjectRelease();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v5 = sub_100026B8C;
  }
  else
  {
    uint64_t v6 = *(void **)(v2 + 1560);

    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v5 = sub_10001DBFC;
  }
  return _swift_task_switch(v5, 0, 0);
}

uint64_t sub_10001DBFC()
{
  uint64_t v569 = v0;
  uint64_t v1 = (void *)v0;
  uint64_t v2 = *(void *)(v0 + 1504);

  uint64_t v3 = *(void *)(v0 + 208);
  *(void *)(v2 + 80) = *(void *)(v3 + 16);
  uint64_t v561 = v1[242];
  uint64_t v4 = *(void *)(v3 + 16);
  uint64_t v555 = v1;
  if (v4)
  {
    uint64_t v545 = (unsigned int (**)(void *, uint64_t, uint64_t))(v1[58] + 48);
    uint64_t v5 = (unsigned char *)(v3 + 48);
    uint64_t v539 = v1[62];
    uint64_t v550 = (void (*)(void, void))v1[200];
    do
    {
      uint64_t v8 = (void *)*((void *)v5 - 1);
      if (*v5)
      {
        uint64_t v556 = v4;
        ((void (*)(void, void, void))v1[180])(v1[149], v1[179], v1[120]);
        uint64_t v9 = swift_allocObject();
        *(void *)(v9 + 16) = v8;
        sub_10002FF18(v8, 1);
        sub_10002FF18(v8, 1);
        swift_errorRetain();
        uint64_t v10 = sub_100032860();
        os_log_type_t v11 = sub_100032AA0();
        uint64_t v12 = swift_allocObject();
        *(unsigned char *)(v12 + 16) = 64;
        uint64_t v13 = swift_allocObject();
        *(unsigned char *)(v13 + 16) = 8;
        uint64_t v14 = swift_allocObject();
        *(void *)(v14 + 16) = sub_100031D84;
        *(void *)(v14 + 24) = v9;
        uint64_t v15 = swift_allocObject();
        *(void *)(v15 + 16) = sub_10002FE30;
        *(void *)(v15 + 24) = v14;
        uint64_t v16 = swift_allocObject();
        *(void *)(v16 + 16) = sub_100031B4C;
        *(void *)(v16 + 24) = v15;
        uint64_t v17 = swift_allocObject();
        *(_OWORD *)(v17 + 16) = xmmword_100033B60;
        *(void *)(v17 + 32) = sub_100031D8C;
        *(void *)(v17 + 40) = v12;
        *(void *)(v17 + 48) = sub_100031D8C;
        *(void *)(v17 + 56) = v13;
        *(void *)(v17 + 64) = sub_100031B54;
        *(void *)(v17 + 72) = v16;
        swift_retain();
        swift_retain();
        swift_retain();
        swift_bridgeObjectRelease();
        if (os_log_type_enabled(v10, v11))
        {
          uint64_t v18 = (uint8_t *)swift_slowAlloc();
          uint64_t v567 = (void *)swift_slowAlloc();
          v568[0] = 0;
          *(_WORD *)uint64_t v18 = 258;
          v18[2] = *(unsigned char *)(v12 + 16);
          if (v561) {
            goto LABEL_107;
          }
          swift_release();
          v18[3] = *(unsigned char *)(v13 + 16);
          v566[0] = (uint64_t)(v18 + 4);
          swift_release();
          sub_10002C320(v566, &v567, (uint64_t)v568, *(uint64_t (**)(void))(v16 + 16));
          uint64_t v551 = (void (*)(void, void))v555[200];
          uint64_t v19 = v555[149];
          uint64_t v20 = v555[120];
          swift_release();
          _os_log_impl((void *)&_mh_execute_header, v10, v11, "Error: %@", v18, 0xCu);
          sub_100005644(&qword_10003C8A0);
          swift_arrayDestroy();
          swift_slowDealloc();
          uint64_t v1 = v555;
          swift_slowDealloc();

          sub_10002FF64(v8, 1);
          sub_10002FF64(v8, 1);
          v551(v19, v20);
          uint64_t v550 = (void (*)(void, void))v555[200];
        }
        else
        {
          uint64_t v40 = v1[149];
          uint64_t v41 = v1[120];
          sub_10002FF64(v8, 1);
          swift_release();
          swift_release();
          swift_release();

          sub_10002FF64(v8, 1);
          v550(v40, v41);
        }
        uint64_t v42 = v1[188];
        uint64_t v43 = *(void *)(v42 + 96);
        BOOL v44 = __OFADD__(v43, 1);
        uint64_t v45 = v43 + 1;
        uint64_t v4 = v556;
        if (v44)
        {
          __break(1u);
LABEL_120:
          __break(1u);
        }
        *(void *)(v42 + 96) = v45;
      }
      else
      {
        uint64_t v22 = (void *)v1[56];
        uint64_t v21 = v1[57];
        sub_10002FF18(*((void **)v5 - 1), 0);
        sub_10002FF18(v8, 0);
        id v23 = v8;
        sub_100004B70(v23, v22);
        if ((*v545)(v22, 1, v21) == 1)
        {
          uint64_t v557 = v4;
          uint64_t v24 = (void (*)(void, void, void))v1[180];
          uint64_t v25 = v1[179];
          uint64_t v26 = v1[150];
          uint64_t v27 = v1[120];
          sub_1000065E4(v1[56], &qword_10003C7F8);
          v24(v26, v25, v27);
          uint64_t v28 = swift_allocObject();
          *(void *)(v28 + 16) = v23;
          id v29 = v23;
          uint64_t v30 = sub_100032860();
          os_log_type_t v31 = sub_100032AA0();
          uint64_t v32 = swift_allocObject();
          *(unsigned char *)(v32 + 16) = 64;
          uint64_t v33 = swift_allocObject();
          *(unsigned char *)(v33 + 16) = 8;
          uint64_t v34 = swift_allocObject();
          *(void *)(v34 + 16) = sub_100031D88;
          *(void *)(v34 + 24) = v28;
          uint64_t v35 = swift_allocObject();
          *(void *)(v35 + 16) = sub_100031B4C;
          *(void *)(v35 + 24) = v34;
          uint64_t v36 = swift_allocObject();
          *(_OWORD *)(v36 + 16) = xmmword_100033B60;
          *(void *)(v36 + 32) = sub_100031D8C;
          *(void *)(v36 + 40) = v32;
          *(void *)(v36 + 48) = sub_100031D8C;
          *(void *)(v36 + 56) = v33;
          *(void *)(v36 + 64) = sub_100031B54;
          *(void *)(v36 + 72) = v35;
          swift_retain();
          swift_retain();
          swift_retain();
          swift_bridgeObjectRelease();
          if (os_log_type_enabled(v30, v31))
          {
            uint64_t v37 = (uint8_t *)swift_slowAlloc();
            uint64_t v567 = (void *)swift_slowAlloc();
            v568[0] = 0;
            *(_WORD *)uint64_t v37 = 258;
            v37[2] = *(unsigned char *)(v32 + 16);
            if (v561) {
              goto LABEL_107;
            }
            swift_release();
            v37[3] = *(unsigned char *)(v33 + 16);
            v566[0] = (uint64_t)(v37 + 4);
            swift_release();
            sub_10002C320(v566, &v567, (uint64_t)v568, *(uint64_t (**)(void))(v35 + 16));
            uint64_t v38 = v555[150];
            uint64_t v39 = v555[120];
            swift_release();
            _os_log_impl((void *)&_mh_execute_header, v30, v31, "Skipping record: %@", v37, 0xCu);
            sub_100005644(&qword_10003C8A0);
            swift_arrayDestroy();
            swift_slowDealloc();
            uint64_t v1 = v555;
            swift_slowDealloc();

            sub_10002FF64(v8, 0);
            sub_10002FF64(v8, 0);
            v550(v38, v39);
            uint64_t v561 = 0;
          }
          else
          {
            uint64_t v6 = v1[150];
            uint64_t v7 = v1[120];
            sub_10002FF64(v8, 0);
            swift_release();
            swift_release();
            swift_release();

            sub_10002FF64(v8, 0);
            v550(v6, v7);
          }
          uint64_t v4 = v557;
        }
        else
        {
          uint64_t v46 = v1[214];
          uint64_t v47 = (uint64_t *)v1[62];
          sub_100031468(v1[56], (uint64_t)v47, type metadata accessor for TaskPayloadRecord);
          uint64_t v48 = *(void *)(v46 + 16);
          uint64_t v49 = *v47;
          uint64_t v50 = *(void *)(v539 + 8);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          LOBYTE(v49) = sub_100028604(v49, v50, v48);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if (v49)
          {
            uint64_t v51 = v1[188];
            uint64_t v53 = v1[61];
            uint64_t v52 = v1[62];
            sub_100030B2C(v52, v53, type metadata accessor for TaskPayloadRecord);
            sub_100028ABC(v53);
            sub_10002FF64(v8, 0);
            sub_10002FF64(v8, 0);
            sub_100030BD0(v52, type metadata accessor for TaskPayloadRecord);
            uint64_t v54 = *(void *)(v51 + 88);
            BOOL v44 = __OFADD__(v54, 1);
            uint64_t v55 = v54 + 1;
            if (v44) {
              goto LABEL_120;
            }
            *(void *)(v1[188] + 88) = v55;
          }
          else
          {
            ((void (*)(void, void, void))v1[180])(v1[151], v1[179], v1[120]);
            uint64_t v56 = sub_100032860();
            os_log_type_t v57 = sub_100032A90();
            BOOL v58 = os_log_type_enabled(v56, v57);
            uint64_t v59 = v1[151];
            uint64_t v60 = v1[120];
            uint64_t v61 = v1[62];
            if (v58)
            {
              uint64_t v558 = v4;
              uint64_t v62 = (uint8_t *)swift_slowAlloc();
              uint64_t v567 = 0;
              v568[0] = 0;
              *(_WORD *)uint64_t v62 = 0;
              v566[0] = (uint64_t)(v62 + 2);
              sub_10002BCC0((uint64_t)_swiftEmptyArrayStorage, (uint64_t)v566, (uint64_t)&v567, (uint64_t)v568);
              swift_bridgeObjectRelease();
              _os_log_impl((void *)&_mh_execute_header, v56, v57, "Skipping taskPayloadRecord because associated with an unavailable taskName.", v62, 2u);
              uint64_t v4 = v558;
              swift_slowDealloc();
            }
            else
            {
              swift_bridgeObjectRelease();
            }

            sub_10002FF64(v8, 0);
            sub_10002FF64(v8, 0);
            v550(v59, v60);
            sub_100030BD0(v61, type metadata accessor for TaskPayloadRecord);
          }
        }
      }
      v5 += 24;
      --v4;
    }
    while (v4);
  }
  uint64_t v63 = v1[231];
  uint64_t v64 = (void (*)(void, void, void))v1[180];
  uint64_t v65 = v1[179];
  uint64_t v66 = v1[148];
  uint64_t v67 = v1[120];
  swift_bridgeObjectRelease();
  v64(v66, v65, v67);
  uint64_t v68 = swift_allocObject();
  *(void *)(v68 + 16) = sub_10002FFA8;
  *(void *)(v68 + 24) = v63;
  swift_retain();
  uint64_t v69 = sub_100032860();
  os_log_type_t v70 = sub_100032A80();
  uint64_t v71 = swift_allocObject();
  *(unsigned char *)(v71 + 16) = 32;
  uint64_t v72 = swift_allocObject();
  *(unsigned char *)(v72 + 16) = 8;
  uint64_t v73 = swift_allocObject();
  *(void *)(v73 + 16) = sub_1000309E8;
  *(void *)(v73 + 24) = v68;
  uint64_t v74 = swift_allocObject();
  *(void *)(v74 + 16) = sub_100031B40;
  *(void *)(v74 + 24) = v73;
  uint64_t v75 = swift_allocObject();
  *(_OWORD *)(v75 + 16) = xmmword_100033B60;
  *(void *)(v75 + 32) = sub_100031D8C;
  *(void *)(v75 + 40) = v71;
  *(void *)(v75 + 48) = sub_100031D8C;
  *(void *)(v75 + 56) = v72;
  *(void *)(v75 + 64) = sub_100031B50;
  *(void *)(v75 + 72) = v74;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRelease();
  if (os_log_type_enabled(v69, v70))
  {
    uint64_t v76 = (uint8_t *)swift_slowAlloc();
    uint64_t v77 = swift_slowAlloc();
    uint64_t v567 = 0;
    v568[0] = v77;
    *(_WORD *)uint64_t v76 = 258;
    v76[2] = *(unsigned char *)(v71 + 16);
    if (v561) {
      goto LABEL_107;
    }
    swift_release();
    v76[3] = *(unsigned char *)(v72 + 16);
    v566[0] = (uint64_t)(v76 + 4);
    swift_release();
    sub_10002C274(v566, (uint64_t)&v567, v568, *(uint64_t (**)(void))(v74 + 16));
    uint64_t v78 = v1[148];
    uint64_t v79 = v1[121];
    uint64_t v80 = v1[120];
    swift_release();
    _os_log_impl((void *)&_mh_execute_header, v69, v70, "Processing TaskParametersRecords: %s", v76, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    uint64_t v81 = *(void (**)(uint64_t, uint64_t))(v79 + 8);
    uint64_t v82 = v78;
    uint64_t v83 = v80;
  }
  else
  {
    uint64_t v84 = v1[148];
    uint64_t v85 = v1[121];
    uint64_t v86 = v1[120];
    swift_release();
    swift_release();
    swift_release();

    uint64_t v81 = *(void (**)(uint64_t, uint64_t))(v85 + 8);
    uint64_t v82 = v84;
    uint64_t v83 = v86;
  }
  uint64_t v552 = v81;
  v81(v82, v83);
  uint64_t v87 = v1[231];
  swift_beginAccess();
  uint64_t v88 = *(void *)(v87 + 16);
  uint64_t v89 = *(void *)(v88 + 16);
  if (!v89) {
    goto LABEL_53;
  }
  uint64_t v90 = v1[84];
  uint64_t v91 = v1[75];
  uint64_t v500 = v1[67];
  uint64_t v92 = v1[65];
  uint64_t v93 = *(unsigned __int8 *)(v92 + 80);
  uint64_t v94 = v88 + ((v93 + 32) & ~v93);
  uint64_t v548 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v90 + 48);
  uint64_t v511 = (void (**)(void, void, void))(v90 + 32);
  id v498 = (void (**)(void, uint64_t, uint64_t, void))(v91 + 56);
  uint64_t v496 = (void (**)(uint64_t, uint64_t))(v1[71] + 8);
  uint64_t v518 = (void (**)(uint64_t, uint64_t))(v91 + 8);
  uint64_t v493 = v91;
  uint64_t v540 = (void (**)(uint64_t, uint64_t))(v1[121] + 8);
  uint64_t v508 = (void (**)(uint64_t, uint64_t))(v90 + 8);
  uint64_t v530 = (v93 + 16) & ~v93;
  uint64_t v546 = *(void *)(v92 + 72);
  uint64_t v95 = enum case for URL.DirectoryHint.inferFromPath(_:);
  swift_bridgeObjectRetain();
  unsigned int v542 = v95;
  do
  {
    uint64_t v100 = v1[229];
    uint64_t v101 = v1[83];
    uint64_t v102 = v1[67];
    uint64_t v103 = v1[55];
    sub_100030B2C(v94, v102, type metadata accessor for TaskParametersRecord);
    *(void *)(swift_task_alloc() + 16) = v102;
    sub_100028F5C((uint64_t (*)(char *))sub_100030A38, v100, v103);
    swift_task_dealloc();
    uint64_t v559 = v94;
    if ((*v548)(v103, 1, v101) == 1)
    {
      uint64_t v104 = (void (*)(void, void, void))v1[180];
      uint64_t v105 = v1[179];
      uint64_t v106 = v1[146];
      uint64_t v107 = v1[120];
      uint64_t v108 = v1[68];
      uint64_t v109 = v1[67];
      sub_1000065E4(v1[55], &qword_10003C7F0);
      v104(v106, v105, v107);
      sub_100030B2C(v109, v108, type metadata accessor for TaskParametersRecord);
      uint64_t v110 = swift_allocObject();
      sub_100031468(v108, v110 + v530, type metadata accessor for TaskParametersRecord);
      uint64_t v111 = sub_100032860();
      os_log_type_t v112 = sub_100032AA0();
      uint64_t v113 = swift_allocObject();
      *(unsigned char *)(v113 + 16) = 32;
      uint64_t v114 = swift_allocObject();
      *(unsigned char *)(v114 + 16) = 8;
      uint64_t v115 = v1;
      uint64_t v116 = swift_allocObject();
      *(void *)(v116 + 16) = sub_100030A5C;
      *(void *)(v116 + 24) = v110;
      uint64_t v117 = swift_allocObject();
      *(void *)(v117 + 16) = sub_100031B40;
      *(void *)(v117 + 24) = v116;
      uint64_t v118 = swift_allocObject();
      *(_OWORD *)(v118 + 16) = xmmword_100033B60;
      *(void *)(v118 + 32) = sub_100031D8C;
      *(void *)(v118 + 40) = v113;
      *(void *)(v118 + 48) = sub_100031D8C;
      *(void *)(v118 + 56) = v114;
      *(void *)(v118 + 64) = sub_100031B50;
      *(void *)(v118 + 72) = v117;
      swift_retain();
      swift_retain();
      swift_retain();
      swift_bridgeObjectRelease();
      if (os_log_type_enabled(v111, v112))
      {
        uint64_t v119 = (uint8_t *)swift_slowAlloc();
        uint64_t v120 = swift_slowAlloc();
        uint64_t v567 = 0;
        v568[0] = v120;
        *(_WORD *)uint64_t v119 = 258;
        v119[2] = *(unsigned char *)(v113 + 16);
        if (v561) {
          goto LABEL_107;
        }
        swift_release();
        v119[3] = *(unsigned char *)(v114 + 16);
        v566[0] = (uint64_t)(v119 + 4);
        swift_release();
        sub_10002C274(v566, (uint64_t)&v567, v568, *(uint64_t (**)(void))(v117 + 16));
        uint64_t v115 = v555;
        uint64_t v121 = v555[146];
        uint64_t v122 = v555[120];
        swift_release();
        _os_log_impl((void *)&_mh_execute_header, v111, v112, "Task %s not registered on the system. Skipping task.", v119, 0xCu);
        swift_arrayDestroy();
        uint64_t v1 = v555;
        swift_slowDealloc();
        swift_slowDealloc();

        v552(v121, v122);
      }
      else
      {
        uint64_t v96 = v115[146];
        uint64_t v97 = v115[120];
        swift_release();
        swift_release();
        swift_release();

        v552(v96, v97);
        uint64_t v1 = v115;
      }
      uint64_t v98 = v115[67];
      goto LABEL_32;
    }
    (*v511)(v1[87], v1[55], v1[83]);
    sub_1000326D0();
    if (!v123)
    {
      uint64_t v166 = v1[68];
      uint64_t v167 = v1[67];
      ((void (*)(void, void, void))v1[180])(v1[147], v1[179], v1[120]);
      sub_100030B2C(v167, v166, type metadata accessor for TaskParametersRecord);
      uint64_t v168 = swift_allocObject();
      sub_100031468(v166, v168 + v530, type metadata accessor for TaskParametersRecord);
      uint64_t v169 = sub_100032860();
      os_log_type_t v170 = sub_100032AA0();
      uint64_t v171 = swift_allocObject();
      *(unsigned char *)(v171 + 16) = 32;
      uint64_t v172 = swift_allocObject();
      *(unsigned char *)(v172 + 16) = 8;
      uint64_t v173 = v1;
      uint64_t v174 = swift_allocObject();
      *(void *)(v174 + 16) = sub_100030A5C;
      *(void *)(v174 + 24) = v168;
      uint64_t v175 = swift_allocObject();
      *(void *)(v175 + 16) = sub_100031B40;
      *(void *)(v175 + 24) = v174;
      uint64_t v176 = swift_allocObject();
      *(_OWORD *)(v176 + 16) = xmmword_100033B60;
      *(void *)(v176 + 32) = sub_100031D8C;
      *(void *)(v176 + 40) = v171;
      *(void *)(v176 + 48) = sub_100031D8C;
      *(void *)(v176 + 56) = v172;
      *(void *)(v176 + 64) = sub_100031B50;
      *(void *)(v176 + 72) = v175;
      swift_retain();
      swift_retain();
      swift_retain();
      swift_bridgeObjectRelease();
      if (os_log_type_enabled(v169, v170))
      {
        uint64_t v177 = (uint8_t *)swift_slowAlloc();
        uint64_t v178 = swift_slowAlloc();
        uint64_t v567 = 0;
        v568[0] = v178;
        *(_WORD *)uint64_t v177 = 258;
        v177[2] = *(unsigned char *)(v171 + 16);
        if (v561) {
          goto LABEL_107;
        }
        swift_release();
        v177[3] = *(unsigned char *)(v172 + 16);
        v566[0] = (uint64_t)(v177 + 4);
        swift_release();
        sub_10002C274(v566, (uint64_t)&v567, v568, *(uint64_t (**)(void))(v175 + 16));
        uint64_t v173 = v555;
        uint64_t v179 = v555[147];
        uint64_t v180 = v555[120];
        uint64_t v181 = v555[87];
        uint64_t v528 = v555[83];
        swift_release();
        _os_log_impl((void *)&_mh_execute_header, v169, v170, "Task %s doesn't have a valid taskFolder. Skipping task.", v177, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        v552(v179, v180);
        (*v508)(v181, v528);
      }
      else
      {
        uint64_t v189 = v173[147];
        uint64_t v190 = v173[120];
        uint64_t v191 = v173[87];
        uint64_t v192 = v173[83];

        swift_release();
        swift_release();
        swift_release();
        v552(v189, v190);
        (*v508)(v191, v192);
      }
      uint64_t v98 = v173[67];
      uint64_t v1 = v173;
      goto LABEL_32;
    }
    uint64_t v527 = v89;
    uint64_t v124 = v1[72];
    (*v498)(v1[73], 1, 1, v1[74]);
    uint64_t v125 = sub_1000324E0();
    uint64_t v126 = *(void (**)(void, void, void))(*(void *)(v125 - 8) + 104);
    v126(v124, v95, v125);
    sub_100032520();
    uint64_t v127 = v95;
    if (qword_10003C3A8 != -1) {
      swift_once();
    }
    uint64_t v128 = v1[82];
    uint64_t v523 = v1[74];
    uint64_t v129 = v1[72];
    uint64_t v130 = v1[70];
    uint64_t v131 = *(void *)algn_10003C798;
    v1[18] = qword_10003C790;
    v1[19] = v131;
    v126(v129, v127, v125);
    sub_10002B8C0();
    swift_bridgeObjectRetain();
    sub_100032530();
    (*v496)(v129, v130);
    swift_bridgeObjectRelease();
    uint64_t v132 = *v518;
    (*v518)(v128, v523);
    uint64_t v133 = *(void *)(v500 + 32);
    unint64_t v134 = *(void *)(v500 + 40);
    sub_1000062A0(v133, v134);
    sub_100032550();
    if (!v561)
    {
      uint64_t v182 = v1[87];
      uint64_t v183 = v1[83];
      uint64_t v184 = v1[80];
      uint64_t v185 = v1[74];
      uint64_t v98 = v1[67];
      sub_100006248(v133, v134);
      v132(v184, v185);
      (*v508)(v182, v183);
      uint64_t v561 = 0;
      uint64_t v89 = v527;
LABEL_32:
      uint64_t v99 = v559;
      goto LABEL_33;
    }
    uint64_t v504 = v132;
    uint64_t v135 = (void (*)(void, void, void))v1[180];
    uint64_t v136 = v1[179];
    uint64_t v137 = v1[124];
    uint64_t v138 = v1[120];
    uint64_t v139 = v1[82];
    uint64_t v140 = v1[80];
    uint64_t v141 = v1[74];
    sub_100006248(v133, v134);
    v135(v137, v136, v138);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v493 + 16))(v139, v140, v141);
    unint64_t v142 = (*(unsigned __int8 *)(v493 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v493 + 80);
    uint64_t v143 = swift_allocObject();
    (*(void (**)(unint64_t, uint64_t, uint64_t))(v493 + 32))(v143 + v142, v139, v141);
    uint64_t v144 = swift_allocObject();
    *(void *)(v144 + 16) = sub_100030E08;
    *(void *)(v144 + 24) = v143;
    uint64_t v145 = swift_allocObject();
    *(void *)(v145 + 16) = v561;
    swift_errorRetain();
    uint64_t v146 = sub_100032860();
    LOBYTE(v137) = sub_100032AA0();
    uint64_t v147 = swift_allocObject();
    *(unsigned char *)(v147 + 16) = 32;
    uint64_t v148 = swift_allocObject();
    *(unsigned char *)(v148 + 16) = 8;
    uint64_t v149 = swift_allocObject();
    *(void *)(v149 + 16) = sub_100031B44;
    *(void *)(v149 + 24) = v144;
    uint64_t v150 = swift_allocObject();
    *(void *)(v150 + 16) = sub_100031B40;
    *(void *)(v150 + 24) = v149;
    uint64_t v151 = swift_allocObject();
    *(unsigned char *)(v151 + 16) = 64;
    uint64_t v152 = swift_allocObject();
    *(unsigned char *)(v152 + 16) = 8;
    uint64_t v153 = swift_allocObject();
    *(void *)(v153 + 16) = sub_100031D84;
    *(void *)(v153 + 24) = v145;
    uint64_t v154 = swift_allocObject();
    *(void *)(v154 + 16) = sub_10002FE30;
    *(void *)(v154 + 24) = v153;
    uint64_t v155 = swift_allocObject();
    *(void *)(v155 + 16) = sub_100031B4C;
    *(void *)(v155 + 24) = v154;
    uint64_t v156 = swift_allocObject();
    *(_OWORD *)(v156 + 16) = xmmword_100033B70;
    *(void *)(v156 + 32) = sub_100031D8C;
    *(void *)(v156 + 40) = v147;
    *(void *)(v156 + 48) = sub_100031D8C;
    *(void *)(v156 + 56) = v148;
    *(void *)(v156 + 64) = sub_100031B50;
    *(void *)(v156 + 72) = v150;
    *(void *)(v156 + 80) = sub_100031D8C;
    *(void *)(v156 + 88) = v151;
    *(void *)(v156 + 96) = sub_100031D8C;
    *(void *)(v156 + 104) = v152;
    *(void *)(v156 + 112) = sub_100031B54;
    *(void *)(v156 + 120) = v155;
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_bridgeObjectRelease();
    os_log_type_t v157 = v137;
    if (os_log_type_enabled(v146, (os_log_type_t)v137))
    {
      id v158 = (uint8_t *)swift_slowAlloc();
      uint64_t v553 = (void *)swift_slowAlloc();
      uint64_t v159 = swift_slowAlloc();
      uint64_t v567 = v553;
      v568[0] = v159;
      *(_WORD *)id v158 = 514;
      v158[2] = *(unsigned char *)(v147 + 16);
      swift_release();
      v158[3] = *(unsigned char *)(v148 + 16);
      v566[0] = (uint64_t)(v158 + 4);
      swift_release();
      sub_10002C274(v566, (uint64_t)&v567, v568, *(uint64_t (**)(void))(v150 + 16));
      swift_release();
      uint64_t v160 = v566[0];
      *(unsigned char *)v566[0] = *(unsigned char *)(v151 + 16);
      swift_release();
      *(unsigned char *)(v160 + 1) = *(unsigned char *)(v152 + 16);
      v566[0] = v160 + 2;
      swift_release();
      sub_10002C320(v566, &v567, (uint64_t)v568, *(uint64_t (**)(void))(v155 + 16));
      uint64_t v161 = v555[124];
      uint64_t v162 = v555[120];
      uint64_t v524 = v555[87];
      uint64_t v163 = v555[83];
      uint64_t v164 = v555[80];
      uint64_t v165 = v555[74];
      swift_release();
      _os_log_impl((void *)&_mh_execute_header, v146, v157, "Failed at writing taskParamFile: %s : %@", v158, 0x16u);
      sub_100005644(&qword_10003C8A0);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      swift_errorRelease();
      uint64_t v552 = *v540;
      (*v540)(v161, v162);
      v504(v164, v165);
      (*v508)(v524, v163);
    }
    else
    {
      uint64_t v186 = v555[124];
      uint64_t v187 = v555[120];
      uint64_t v188 = v555[87];
      uint64_t v525 = v555[83];
      uint64_t v488 = v555[74];
      os_log_t loga = (os_log_t)v555[80];

      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_errorRelease();
      uint64_t v552 = *v540;
      (*v540)(v186, v187);
      v504((uint64_t)loga, v488);
      (*v508)(v188, v525);
    }
    uint64_t v89 = v527;
    uint64_t v1 = v555;
    uint64_t v99 = v559;
    uint64_t v561 = 0;
    uint64_t v98 = v555[67];
LABEL_33:
    uint64_t v95 = v542;
    sub_100030BD0(v98, type metadata accessor for TaskParametersRecord);
    uint64_t v94 = v99 + v546;
    --v89;
  }
  while (v89);
  swift_bridgeObjectRelease();
LABEL_53:
  uint64_t v193 = v1[237];
  ((void (*)(void, void, void))v1[180])(v1[145], v1[179], v1[120]);
  uint64_t v194 = swift_allocObject();
  *(void *)(v194 + 16) = sub_10002FFA8;
  *(void *)(v194 + 24) = v193;
  swift_retain();
  uint64_t v195 = sub_100032860();
  os_log_type_t v196 = sub_100032A80();
  uint64_t v197 = swift_allocObject();
  *(unsigned char *)(v197 + 16) = 32;
  uint64_t v198 = swift_allocObject();
  *(unsigned char *)(v198 + 16) = 8;
  uint64_t v199 = swift_allocObject();
  *(void *)(v199 + 16) = sub_100030ADC;
  *(void *)(v199 + 24) = v194;
  uint64_t v200 = swift_allocObject();
  *(void *)(v200 + 16) = sub_100031B40;
  *(void *)(v200 + 24) = v199;
  uint64_t v201 = swift_allocObject();
  *(_OWORD *)(v201 + 16) = xmmword_100033B60;
  *(void *)(v201 + 32) = sub_100031D8C;
  *(void *)(v201 + 40) = v197;
  *(void *)(v201 + 48) = sub_100031D8C;
  *(void *)(v201 + 56) = v198;
  *(void *)(v201 + 64) = sub_100031B50;
  *(void *)(v201 + 72) = v200;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRelease();
  if (os_log_type_enabled(v195, v196))
  {
    v202 = (uint8_t *)swift_slowAlloc();
    uint64_t v203 = swift_slowAlloc();
    uint64_t v567 = 0;
    v568[0] = v203;
    *(_WORD *)v202 = 258;
    v202[2] = *(unsigned char *)(v197 + 16);
    if (!v561)
    {
      swift_release();
      v202[3] = *(unsigned char *)(v198 + 16);
      v566[0] = (uint64_t)(v202 + 4);
      swift_release();
      sub_10002C274(v566, (uint64_t)&v567, v568, *(uint64_t (**)(void))(v200 + 16));
      uint64_t v204 = v1[145];
      uint64_t v205 = v1[120];
      swift_release();
      _os_log_impl((void *)&_mh_execute_header, v195, v196, "Processing TaskPayloadRecords: %s", v202, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      uint64_t v206 = v204;
      uint64_t v207 = v205;
      goto LABEL_57;
    }
LABEL_107:
    return swift_errorRelease();
  }
  uint64_t v208 = v1[145];
  uint64_t v209 = v1[120];
  swift_release();
  swift_release();
  swift_release();

  uint64_t v206 = v208;
  uint64_t v207 = v209;
LABEL_57:
  v552(v206, v207);
  uint64_t v210 = v1[237];
  swift_beginAccess();
  uint64_t v211 = *(void *)(v210 + 16);
  uint64_t v212 = *(void *)(v211 + 16);
  if (!v212)
  {
LABEL_104:
    uint64_t v437 = (void (*)(void, void))v1[186];
    uint64_t v438 = v1[115];
    uint64_t v439 = v1[109];
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_1000325A0();
    sub_100032560();
    uint64_t v441 = v440;
    v437(v438, v439);
    sub_100031AE8(0, &qword_10003C828);
    id v442 = sub_100027BB0(0xD000000000000010, 0x8000000100034010);
    if (v442)
    {
      uint64_t v443 = v442;
      ((void (*)(void, void, void))v1[180])(v1[138], v1[179], v1[120]);
      uint64_t v444 = swift_allocObject();
      *(void *)(v444 + 16) = v441;
      uint64_t v445 = sub_100032860();
      os_log_type_t v446 = sub_100032A80();
      uint64_t v447 = swift_allocObject();
      *(unsigned char *)(v447 + 16) = 0;
      uint64_t v448 = swift_allocObject();
      *(unsigned char *)(v448 + 16) = 8;
      uint64_t v449 = v1;
      uint64_t v450 = swift_allocObject();
      *(void *)(v450 + 16) = sub_100031B60;
      *(void *)(v450 + 24) = v444;
      uint64_t v451 = swift_allocObject();
      *(void *)(v451 + 16) = sub_100030C60;
      *(void *)(v451 + 24) = v450;
      uint64_t v452 = swift_allocObject();
      *(_OWORD *)(v452 + 16) = xmmword_100033B60;
      *(void *)(v452 + 32) = sub_100031D8C;
      *(void *)(v452 + 40) = v447;
      *(void *)(v452 + 48) = sub_100031D8C;
      *(void *)(v452 + 56) = v448;
      *(void *)(v452 + 64) = sub_100030C88;
      *(void *)(v452 + 72) = v451;
      swift_retain();
      swift_retain();
      swift_retain();
      swift_bridgeObjectRelease();
      if (os_log_type_enabled(v445, v446))
      {
        uint64_t v453 = swift_slowAlloc();
        *(_WORD *)uint64_t v453 = 256;
        *(unsigned char *)(v453 + 2) = *(unsigned char *)(v447 + 16);
        if (v561) {
          goto LABEL_107;
        }
        uint64_t v466 = (uint8_t *)v453;
        swift_release();
        v466[3] = *(unsigned char *)(v448 + 16);
        uint64_t v467 = swift_release();
        v568[0] = (*(double (**)(uint64_t))(v451 + 16))(v467);
        sub_100032AF0();
        uint64_t v1 = v555;
        uint64_t v468 = v555[138];
        uint64_t v469 = v555[120];
        swift_release();
        _os_log_impl((void *)&_mh_execute_header, v445, v446, "Marking lastSuccessTimestamp: %f", v466, 0xCu);
        swift_slowDealloc();

        v552(v468, v469);
      }
      else
      {
        uint64_t v455 = v449[138];
        uint64_t v456 = v449[120];
        swift_release();
        swift_release();
        swift_release();

        v552(v455, v456);
        uint64_t v1 = v449;
      }
      Class isa = sub_100032A10().super.super.isa;
      NSString v471 = sub_100032920();
      [v443 setValue:isa forKey:v471];
    }
    uint64_t v472 = (void *)v1[195];
    uint64_t v473 = (void *)v1[194];
    id v474 = (void *)v1[193];
    v475 = (void *)v1[192];
    id v476 = (void *)v1[191];
    NSString v477 = (void *)v1[190];
    uint64_t v463 = v1[188];
    uint64_t v565 = v1[119];
    uint64_t v464 = v1[118];
    uint64_t v554 = v1[117];
    id v478 = objc_allocWithZone((Class)sub_100032780());
    uint64_t v480 = sub_100032770();

    swift_release();
    goto LABEL_116;
  }
  uint64_t v487 = v1 + 40;
  unsigned int v481 = v1 + 42;
  uint64_t v213 = v1[84];
  uint64_t v214 = v1[75];
  uint64_t v215 = v1[58];
  uint64_t v216 = *(unsigned __int8 *)(v215 + 80);
  uint64_t v217 = v211 + ((v216 + 32) & ~v216);
  uint64_t v543 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v213 + 48);
  uint64_t v495 = (void (**)(void, void, void))(v213 + 32);
  uint64_t v492 = (os_log_t *)(v214 + 56);
  id v489 = (void *)(v1[71] + 8);
  uint64_t v526 = (void (**)(uint64_t, uint64_t))(v214 + 8);
  uint64_t v486 = v214;
  uint64_t v547 = (void (**)(uint64_t, uint64_t))(v1[121] + 8);
  uint64_t v494 = (void (**)(uint64_t, uint64_t))(v213 + 8);
  uint64_t v529 = (v216 + 16) & ~v216;
  uint64_t v541 = *(void *)(v215 + 72);
  unsigned int v499 = enum case for URL.DirectoryHint.inferFromPath(_:);
  swift_bridgeObjectRetain();
  while (2)
  {
    sub_100030B2C(v217, v1[60], type metadata accessor for TaskPayloadRecord);
    char v224 = sub_100032A00();
    uint64_t v225 = v1[229];
    if ((v224 & 1) == 0)
    {
      uint64_t v226 = v1[83];
      uint64_t v227 = v1[60];
      uint64_t v228 = v1[54];
      *(void *)(swift_task_alloc() + 16) = v227;
      sub_100028F5C((uint64_t (*)(char *))sub_100031B24, v225, v228);
      swift_task_dealloc();
      uint64_t v560 = v212;
      if ((*v543)(v228, 1, v226) == 1)
      {
        uint64_t v549 = v217;
        uint64_t v229 = (void (*)(void, void, void))v1[180];
        uint64_t v230 = v1[179];
        uint64_t v231 = v1[139];
        uint64_t v232 = v1[120];
        uint64_t v234 = v1[60];
        uint64_t v233 = v1[61];
        sub_1000065E4(v1[54], &qword_10003C7F0);
        v229(v231, v230, v232);
        sub_100030B2C(v234, v233, type metadata accessor for TaskPayloadRecord);
        uint64_t v235 = swift_allocObject();
        sub_100031468(v233, v235 + v529, type metadata accessor for TaskPayloadRecord);
        uint64_t v236 = sub_100032860();
        os_log_type_t v237 = sub_100032AA0();
        uint64_t v238 = swift_allocObject();
        *(unsigned char *)(v238 + 16) = 32;
        uint64_t v239 = swift_allocObject();
        *(unsigned char *)(v239 + 16) = 8;
        uint64_t v240 = swift_allocObject();
        *(void *)(v240 + 16) = sub_100030B98;
        *(void *)(v240 + 24) = v235;
        uint64_t v241 = swift_allocObject();
        *(void *)(v241 + 16) = sub_100031B40;
        *(void *)(v241 + 24) = v240;
        uint64_t v242 = swift_allocObject();
        *(_OWORD *)(v242 + 16) = xmmword_100033B60;
        *(void *)(v242 + 32) = sub_100031D8C;
        *(void *)(v242 + 40) = v238;
        *(void *)(v242 + 48) = sub_100031D8C;
        *(void *)(v242 + 56) = v239;
        *(void *)(v242 + 64) = sub_100031B50;
        *(void *)(v242 + 72) = v241;
        swift_retain();
        swift_retain();
        swift_retain();
        swift_bridgeObjectRelease();
        if (os_log_type_enabled(v236, v237))
        {
          uint64_t v243 = (uint8_t *)swift_slowAlloc();
          uint64_t v244 = swift_slowAlloc();
          uint64_t v567 = 0;
          v568[0] = v244;
          *(_WORD *)uint64_t v243 = 258;
          v243[2] = *(unsigned char *)(v238 + 16);
          if (v561) {
            goto LABEL_107;
          }
          swift_release();
          v243[3] = *(unsigned char *)(v239 + 16);
          v566[0] = (uint64_t)(v243 + 4);
          swift_release();
          sub_10002C274(v566, (uint64_t)&v567, v568, *(uint64_t (**)(void))(v241 + 16));
          uint64_t v245 = v1[139];
          uint64_t v246 = v1[120];
          swift_release();
          _os_log_impl((void *)&_mh_execute_header, v236, v237, "Task %s not registered on the system. Skipping task.", v243, 0xCu);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();

          uint64_t v247 = v245;
          uint64_t v248 = v246;
        }
        else
        {
          uint64_t v286 = v1[139];
          uint64_t v287 = v1[120];
          swift_release();
          swift_release();
          swift_release();

          uint64_t v247 = v286;
          uint64_t v248 = v287;
        }
        v552(v247, v248);
LABEL_77:
        uint64_t v221 = v1[60];
        goto LABEL_61;
      }
      (*v495)(v1[86], v1[54], v1[83]);
      sub_1000326D0();
      if (v249)
      {
        uint64_t v549 = v217;
        uint64_t v250 = v1[72];
        os_log_t log = *v492;
        ((void (*)(void, uint64_t, uint64_t, void))*v492)(v1[73], 1, 1, v1[74]);
        uint64_t v251 = sub_1000324E0();
        uint64_t v252 = (void (**)(uint64_t, void, uint64_t))(*(void *)(v251 - 8) + 104);
        os_log_type_t v532 = *v252;
        (*v252)(v250, v499, v251);
        sub_100032520();
        if (qword_10003C3A0 != -1) {
          swift_once();
        }
        uint64_t v253 = v1[82];
        uint64_t v254 = v1[74];
        uint64_t v255 = v1[72];
        uint64_t v256 = v1[70];
        uint64_t v257 = *(void *)algn_10003C788;
        v1[16] = qword_10003C780;
        v1[17] = v257;
        v532(v255, v499, v251);
        sub_10002B8C0();
        swift_bridgeObjectRetain();
        sub_100032530();
        uint64_t v258 = (void (*)(void, void))*v489;
        ((void (*)(uint64_t, uint64_t))*v489)(v255, v256);
        swift_bridgeObjectRelease();
        uint64_t v497 = *v526;
        (*v526)(v253, v254);
        id v485 = self;
        id v259 = [v485 defaultManager];
        sub_100032510(0);
        NSString v260 = sub_100032920();
        swift_bridgeObjectRelease();
        v1[40] = 0;
        unsigned int v261 = [v259 createDirectoryAtPath:v260 withIntermediateDirectories:1 attributes:0 error:v487];

        uint64_t v262 = (void *)v1[40];
        uint64_t v503 = (void (*)(void, void, void))v1[180];
        uint64_t v263 = v1[179];
        uint64_t v501 = v1[120];
        uint64_t v513 = v1[82];
        uint64_t v264 = v1[74];
        if (v261)
        {
          uint64_t v482 = v258;
          uint64_t v484 = v1[143];
          uint64_t v265 = v1[78];
          uint64_t v266 = v1[72];
          ((void (*)(void, uint64_t, uint64_t, uint64_t))log)(v1[73], 1, 1, v264);
          uint64_t v483 = v251;
          v532(v266, v499, v251);
          id v267 = v262;
          swift_bridgeObjectRetain();
          sub_100032520();
          v503(v484, v263, v501);
          uint64_t v505 = *(void (**)(void, void, void))(v486 + 16);
          v505(v513, v265, v264);
          unint64_t v268 = (*(unsigned __int8 *)(v486 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v486 + 80);
          uint64_t v269 = swift_allocObject();
          uint64_t v270 = *(void (**)(void, void, void))(v486 + 32);
          v270(v269 + v268, v513, v264);
          uint64_t v271 = swift_allocObject();
          *(void *)(v271 + 16) = sub_100030E08;
          *(void *)(v271 + 24) = v269;
          uint64_t v272 = sub_100032860();
          os_log_type_t v273 = sub_100032A80();
          uint64_t v274 = swift_allocObject();
          *(unsigned char *)(v274 + 16) = 32;
          uint64_t v275 = swift_allocObject();
          *(unsigned char *)(v275 + 16) = 8;
          uint64_t v276 = swift_allocObject();
          *(void *)(v276 + 16) = sub_100031B44;
          *(void *)(v276 + 24) = v271;
          uint64_t v277 = swift_allocObject();
          *(void *)(v277 + 16) = sub_100031B40;
          *(void *)(v277 + 24) = v276;
          uint64_t v278 = swift_allocObject();
          *(_OWORD *)(v278 + 16) = xmmword_100033B60;
          *(void *)(v278 + 32) = sub_100031D8C;
          *(void *)(v278 + 40) = v274;
          *(void *)(v278 + 48) = sub_100031D8C;
          *(void *)(v278 + 56) = v275;
          *(void *)(v278 + 64) = sub_100031B50;
          *(void *)(v278 + 72) = v277;
          swift_retain();
          swift_retain();
          swift_retain();
          swift_bridgeObjectRelease();
          if (os_log_type_enabled(v272, v273))
          {
            uint64_t v279 = (uint8_t *)swift_slowAlloc();
            uint64_t v280 = swift_slowAlloc();
            uint64_t v567 = 0;
            v568[0] = v280;
            *(_WORD *)uint64_t v279 = 258;
            v279[2] = *(unsigned char *)(v274 + 16);
            if (v561) {
              goto LABEL_107;
            }
            swift_release();
            v279[3] = *(unsigned char *)(v275 + 16);
            v566[0] = (uint64_t)(v279 + 4);
            swift_release();
            sub_10002C274(v566, (uint64_t)&v567, v568, *(uint64_t (**)(void))(v277 + 16));
            uint64_t v1 = v555;
            uint64_t v281 = v555[143];
            uint64_t v282 = v270;
            unint64_t v283 = v268;
            uint64_t v284 = v555[120];
            swift_release();
            _os_log_impl((void *)&_mh_execute_header, v272, v273, "Processing: %s", v279, 0xCu);
            swift_arrayDestroy();
            swift_slowDealloc();
            swift_slowDealloc();

            uint64_t v285 = v284;
            unint64_t v268 = v283;
            uint64_t v270 = v282;
            v552(v281, v285);
          }
          else
          {
            uint64_t v338 = v555[143];
            uint64_t v339 = v555[120];
            swift_release();
            swift_release();
            swift_release();

            v552(v338, v339);
            uint64_t v1 = v555;
          }
          if (sub_1000291C0(v1[78], v1[79]))
          {
            uint64_t v340 = v1[82];
            uint64_t v341 = v1[79];
            uint64_t v342 = v1[74];
            ((void (*)(void, void, void))v1[180])(v1[142], v1[179], v1[120]);
            v505(v340, v341, v342);
            uint64_t v343 = swift_allocObject();
            v270(v343 + v268, v340, v342);
            uint64_t v344 = swift_allocObject();
            *(void *)(v344 + 16) = sub_100030E08;
            *(void *)(v344 + 24) = v343;
            uint64_t v345 = sub_100032860();
            os_log_type_t v346 = sub_100032A80();
            uint64_t v347 = swift_allocObject();
            *(unsigned char *)(v347 + 16) = 32;
            uint64_t v348 = swift_allocObject();
            *(unsigned char *)(v348 + 16) = 8;
            uint64_t v349 = swift_allocObject();
            *(void *)(v349 + 16) = sub_100031B44;
            *(void *)(v349 + 24) = v344;
            uint64_t v350 = swift_allocObject();
            *(void *)(v350 + 16) = sub_100031B40;
            *(void *)(v350 + 24) = v349;
            uint64_t v351 = swift_allocObject();
            *(_OWORD *)(v351 + 16) = xmmword_100033B60;
            *(void *)(v351 + 32) = sub_100031D8C;
            *(void *)(v351 + 40) = v347;
            *(void *)(v351 + 48) = sub_100031D8C;
            *(void *)(v351 + 56) = v348;
            *(void *)(v351 + 64) = sub_100031B50;
            *(void *)(v351 + 72) = v350;
            swift_retain();
            swift_retain();
            swift_retain();
            swift_bridgeObjectRelease();
            if (os_log_type_enabled(v345, v346))
            {
              uint64_t v352 = (uint8_t *)swift_slowAlloc();
              uint64_t v353 = swift_slowAlloc();
              uint64_t v567 = 0;
              v568[0] = v353;
              *(_WORD *)uint64_t v352 = 258;
              v352[2] = *(unsigned char *)(v347 + 16);
              if (v561) {
                goto LABEL_107;
              }
              swift_release();
              v352[3] = *(unsigned char *)(v348 + 16);
              v566[0] = (uint64_t)(v352 + 4);
              swift_release();
              sub_10002C274(v566, (uint64_t)&v567, v568, *(uint64_t (**)(void))(v350 + 16));
              uint64_t v515 = v1[142];
              uint64_t v354 = v1[120];
              uint64_t v534 = v1[86];
              uint64_t v521 = v1[83];
              uint64_t v355 = v1;
              uint64_t v356 = v1[79];
              uint64_t v357 = v355[78];
              uint64_t v358 = v355[74];
              swift_release();
              _os_log_impl((void *)&_mh_execute_header, v345, v346, "TaskPayload extracted at: %s", v352, 0xCu);
              swift_arrayDestroy();
              swift_slowDealloc();
              swift_slowDealloc();

              v552(v515, v354);
              v497(v357, v358);
              v497(v356, v358);
              (*v494)(v534, v521);
            }
            else
            {
              uint64_t v365 = v1[142];
              uint64_t v366 = v1[120];
              uint64_t v535 = v1[86];
              uint64_t v367 = v1[83];
              uint64_t v355 = v1;
              uint64_t v368 = v1[79];
              v369 = v345;
              uint64_t v370 = v355[78];
              uint64_t v371 = v355[74];

              swift_release();
              swift_release();
              swift_release();
              v552(v365, v366);
              v497(v370, v371);
              v497(v368, v371);
              (*v494)(v535, v367);
            }
            uint64_t v221 = v355[60];
            uint64_t v1 = v355;
          }
          else
          {
            uint64_t v522 = v270;
            ((void (*)(void, void, void))v1[180])(v1[141], v1[179], v1[120]);
            uint64_t v359 = sub_100032860();
            os_log_type_t v360 = sub_100032A80();
            BOOL v361 = os_log_type_enabled(v359, v360);
            uint64_t v362 = v1[141];
            uint64_t v363 = v1[120];
            unint64_t v502 = v268;
            if (v361)
            {
              uint64_t v364 = (uint8_t *)swift_slowAlloc();
              uint64_t v567 = 0;
              v568[0] = 0;
              *(_WORD *)uint64_t v364 = 0;
              v566[0] = (uint64_t)(v364 + 2);
              sub_10002BCC0((uint64_t)_swiftEmptyArrayStorage, (uint64_t)v566, (uint64_t)&v567, (uint64_t)v568);
              swift_bridgeObjectRelease();
              _os_log_impl((void *)&_mh_execute_header, v359, v360, "Failed at processing archive, copying raw archive into taskFolder.", v364, 2u);
              swift_slowDealloc();
            }
            else
            {
              swift_bridgeObjectRelease();
            }

            v552(v362, v363);
            uint64_t v372 = v1[72];
            uint64_t v373 = v1[70];
            v1[14] = 0x612E737465737361;
            v1[15] = 0xEA00000000007261;
            v532(v372, v499, v483);
            sub_100032530();
            v482(v372, v373);
            swift_bridgeObjectRelease();
            id v374 = [v485 defaultManager];
            sub_1000324F0(v375);
            uint64_t v377 = v376;
            sub_1000324F0(v378);
            uint64_t v380 = v379;
            v1[42] = 0;
            unsigned int v381 = [v374 copyItemAtURL:v377 toURL:v379 error:v481];

            uint64_t v382 = (void *)v1[42];
            if (!v381)
            {
              uint64_t v390 = v1;
              uint64_t v391 = (void (*)(void, void, void))v1[180];
              uint64_t v392 = v390[179];
              uint64_t v393 = v390[122];
              uint64_t v394 = v390[120];
              uint64_t v395 = v390[82];
              uint64_t v396 = v390[77];
              uint64_t v397 = v390[74];
              id v398 = v382;
              uint64_t v399 = sub_1000324D0();

              swift_willThrow();
              v391(v393, v392, v394);
              v505(v395, v396, v397);
              uint64_t v400 = swift_allocObject();
              v522(v400 + v502, v395, v397);
              uint64_t v401 = swift_allocObject();
              *(void *)(v401 + 16) = sub_100030E08;
              *(void *)(v401 + 24) = v400;
              uint64_t v402 = swift_allocObject();
              *(void *)(v402 + 16) = v399;
              swift_errorRetain();
              uint64_t v403 = sub_100032860();
              os_log_type_t v536 = sub_100032AA0();
              uint64_t v404 = swift_allocObject();
              *(unsigned char *)(v404 + 16) = 32;
              uint64_t v405 = swift_allocObject();
              *(unsigned char *)(v405 + 16) = 8;
              uint64_t v406 = swift_allocObject();
              *(void *)(v406 + 16) = sub_100031B44;
              *(void *)(v406 + 24) = v401;
              uint64_t v407 = swift_allocObject();
              *(void *)(v407 + 16) = sub_100031B40;
              *(void *)(v407 + 24) = v406;
              uint64_t v408 = swift_allocObject();
              *(unsigned char *)(v408 + 16) = 64;
              uint64_t v409 = swift_allocObject();
              *(unsigned char *)(v409 + 16) = 8;
              uint64_t v410 = swift_allocObject();
              *(void *)(v410 + 16) = sub_100031D84;
              *(void *)(v410 + 24) = v402;
              uint64_t v411 = swift_allocObject();
              *(void *)(v411 + 16) = sub_10002FE30;
              *(void *)(v411 + 24) = v410;
              uint64_t v412 = swift_allocObject();
              *(void *)(v412 + 16) = sub_100031B4C;
              *(void *)(v412 + 24) = v411;
              uint64_t v413 = swift_allocObject();
              *(_OWORD *)(v413 + 16) = xmmword_100033B70;
              *(void *)(v413 + 32) = sub_100031D8C;
              *(void *)(v413 + 40) = v404;
              *(void *)(v413 + 48) = sub_100031D8C;
              *(void *)(v413 + 56) = v405;
              *(void *)(v413 + 64) = sub_100031B50;
              *(void *)(v413 + 72) = v407;
              *(void *)(v413 + 80) = sub_100031D8C;
              *(void *)(v413 + 88) = v408;
              *(void *)(v413 + 96) = sub_100031D8C;
              *(void *)(v413 + 104) = v409;
              *(void *)(v413 + 112) = sub_100031B54;
              *(void *)(v413 + 120) = v412;
              swift_retain();
              swift_retain();
              swift_retain();
              swift_retain();
              swift_retain();
              swift_retain();
              swift_bridgeObjectRelease();
              os_log_type_t v414 = v536;
              id v564 = v403;
              if (os_log_type_enabled(v403, v536))
              {
                uint64_t v415 = (uint8_t *)swift_slowAlloc();
                uint64_t v416 = (void *)swift_slowAlloc();
                uint64_t v537 = swift_slowAlloc();
                uint64_t v567 = v416;
                v568[0] = v537;
                *(_WORD *)uint64_t v415 = 514;
                v415[2] = *(unsigned char *)(v404 + 16);
                swift_release();
                v415[3] = *(unsigned char *)(v405 + 16);
                v566[0] = (uint64_t)(v415 + 4);
                swift_release();
                sub_10002C274(v566, (uint64_t)&v567, v568, *(uint64_t (**)(void))(v407 + 16));
                swift_release();
                uint64_t v417 = v566[0];
                *(unsigned char *)v566[0] = *(unsigned char *)(v408 + 16);
                swift_release();
                *(unsigned char *)(v417 + 1) = *(unsigned char *)(v409 + 16);
                v566[0] = v417 + 2;
                swift_release();
                sub_10002C320(v566, &v567, (uint64_t)v568, *(uint64_t (**)(void))(v412 + 16));
                uint64_t v418 = v555[122];
                uint64_t v419 = v555[120];
                uint64_t v516 = v555[86];
                uint64_t v509 = v555[83];
                uint64_t v506 = v555[79];
                uint64_t v420 = v555[78];
                uint64_t v421 = v555[77];
                uint64_t v422 = v555[74];
                swift_release();
                _os_log_impl((void *)&_mh_execute_header, v564, v414, "Failed at asset to: %s : %@", v415, 0x16u);
                sub_100005644(&qword_10003C8A0);
                swift_arrayDestroy();
                swift_slowDealloc();
                swift_arrayDestroy();
                swift_slowDealloc();
                swift_slowDealloc();

                swift_errorRelease();
                v552(v418, v419);
                v497(v421, v422);
                v497(v420, v422);
                v497(v506, v422);
                (*v494)(v516, v509);
              }
              else
              {
                uint64_t v423 = v555[122];
                uint64_t v424 = v555[120];
                uint64_t v538 = v555[86];
                uint64_t v517 = v555[83];
                uint64_t v510 = v555[79];
                uint64_t v507 = v555[78];
                uint64_t v425 = v555[77];
                uint64_t v426 = v555[74];

                swift_release();
                swift_release();
                swift_release();
                swift_release();
                swift_release();
                swift_release();
                swift_errorRelease();
                v552(v423, v424);
                v497(v425, v426);
                v497(v507, v426);
                v497(v510, v426);
                (*v494)(v538, v517);
              }
              uint64_t v561 = 0;
              uint64_t v1 = v555;
              goto LABEL_77;
            }
            uint64_t v383 = v1[86];
            uint64_t v384 = v1[83];
            uint64_t v385 = v1[79];
            uint64_t v386 = v1[78];
            uint64_t v387 = v1[77];
            uint64_t v388 = v1[74];
            uint64_t v221 = v1[60];
            id v389 = v382;
            v497(v387, v388);
            v497(v386, v388);
            v497(v385, v388);
            (*v494)(v383, v384);
          }
        }
        else
        {
          uint64_t v306 = v1[123];
          uint64_t v307 = v1[79];
          id v308 = v262;
          uint64_t v309 = sub_1000324D0();

          swift_willThrow();
          v503(v306, v263, v501);
          (*(void (**)(uint64_t, uint64_t, uint64_t))(v486 + 16))(v513, v307, v264);
          unint64_t v310 = (*(unsigned __int8 *)(v486 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v486 + 80);
          uint64_t v311 = swift_allocObject();
          (*(void (**)(unint64_t, uint64_t, uint64_t))(v486 + 32))(v311 + v310, v513, v264);
          uint64_t v312 = swift_allocObject();
          *(void *)(v312 + 16) = sub_100030E08;
          *(void *)(v312 + 24) = v311;
          uint64_t v313 = swift_allocObject();
          *(void *)(v313 + 16) = v309;
          swift_errorRetain();
          uint64_t v314 = sub_100032860();
          os_log_type_t v562 = sub_100032AA0();
          uint64_t v315 = swift_allocObject();
          *(unsigned char *)(v315 + 16) = 32;
          uint64_t v316 = swift_allocObject();
          *(unsigned char *)(v316 + 16) = 8;
          uint64_t v317 = swift_allocObject();
          *(void *)(v317 + 16) = sub_100030E20;
          *(void *)(v317 + 24) = v312;
          uint64_t v318 = swift_allocObject();
          *(void *)(v318 + 16) = sub_100031B40;
          *(void *)(v318 + 24) = v317;
          uint64_t v319 = swift_allocObject();
          *(unsigned char *)(v319 + 16) = 64;
          uint64_t v320 = v1;
          uint64_t v321 = swift_allocObject();
          *(unsigned char *)(v321 + 16) = 8;
          uint64_t v322 = swift_allocObject();
          *(void *)(v322 + 16) = sub_100031D84;
          *(void *)(v322 + 24) = v313;
          uint64_t v323 = swift_allocObject();
          *(void *)(v323 + 16) = sub_10002FE30;
          *(void *)(v323 + 24) = v322;
          uint64_t v324 = swift_allocObject();
          *(void *)(v324 + 16) = sub_100031B4C;
          *(void *)(v324 + 24) = v323;
          uint64_t v325 = swift_allocObject();
          *(_OWORD *)(v325 + 16) = xmmword_100033B70;
          *(void *)(v325 + 32) = sub_100031D8C;
          *(void *)(v325 + 40) = v315;
          *(void *)(v325 + 48) = sub_100031D8C;
          *(void *)(v325 + 56) = v316;
          *(void *)(v325 + 64) = sub_100031B50;
          *(void *)(v325 + 72) = v318;
          *(void *)(v325 + 80) = sub_100031D8C;
          *(void *)(v325 + 88) = v319;
          *(void *)(v325 + 96) = sub_100031D8C;
          *(void *)(v325 + 104) = v321;
          *(void *)(v325 + 112) = sub_100031B54;
          *(void *)(v325 + 120) = v324;
          swift_retain();
          swift_retain();
          swift_retain();
          swift_retain();
          swift_retain();
          swift_retain();
          swift_bridgeObjectRelease();
          os_log_type_t v326 = v562;
          uint64_t v563 = v314;
          if (os_log_type_enabled(v314, v326))
          {
            uint64_t v327 = (uint8_t *)swift_slowAlloc();
            uint64_t v520 = (void *)swift_slowAlloc();
            uint64_t v533 = swift_slowAlloc();
            uint64_t v567 = v520;
            v568[0] = v533;
            *(_WORD *)uint64_t v327 = 514;
            v327[2] = *(unsigned char *)(v315 + 16);
            swift_release();
            v327[3] = *(unsigned char *)(v316 + 16);
            v566[0] = (uint64_t)(v327 + 4);
            swift_release();
            sub_10002C274(v566, (uint64_t)&v567, v568, *(uint64_t (**)(void))(v318 + 16));
            swift_release();
            uint64_t v328 = v566[0];
            *(unsigned char *)v566[0] = *(unsigned char *)(v319 + 16);
            swift_release();
            *(unsigned char *)(v328 + 1) = *(unsigned char *)(v321 + 16);
            v566[0] = v328 + 2;
            swift_release();
            sub_10002C320(v566, &v567, (uint64_t)v568, *(uint64_t (**)(void))(v324 + 16));
            uint64_t v329 = v320[123];
            uint64_t v330 = v320[120];
            uint64_t v514 = v320[86];
            uint64_t v331 = v320[83];
            uint64_t v332 = v320[79];
            uint64_t v333 = v320[74];
            swift_release();
            _os_log_impl((void *)&_mh_execute_header, v563, v326, "Failed at creating taskAssetsURL: %s : %@", v327, 0x16u);
            sub_100005644(&qword_10003C8A0);
            swift_arrayDestroy();
            swift_slowDealloc();
            swift_arrayDestroy();
            swift_slowDealloc();
            swift_slowDealloc();

            swift_errorRelease();
            uint64_t v552 = *v547;
            (*v547)(v329, v330);
            v497(v332, v333);
            (*v494)(v514, v331);
          }
          else
          {
            uint64_t v218 = v320[123];
            uint64_t v219 = v320[120];
            uint64_t v531 = v320[86];
            uint64_t v519 = v320[83];
            uint64_t v220 = v320[79];
            uint64_t v512 = v320[74];

            swift_release();
            swift_release();
            swift_release();
            swift_release();
            swift_release();
            swift_release();
            swift_errorRelease();
            uint64_t v552 = *v547;
            (*v547)(v218, v219);
            v497(v220, v512);
            (*v494)(v531, v519);
          }
          uint64_t v561 = 0;
          uint64_t v221 = v320[60];
          uint64_t v1 = v320;
        }
LABEL_61:
        uint64_t v222 = v560;
        uint64_t v223 = v549;
      }
      else
      {
        uint64_t v288 = v217;
        uint64_t v290 = v1[60];
        uint64_t v289 = v1[61];
        ((void (*)(void, void, void))v1[180])(v1[140], v1[179], v1[120]);
        sub_100030B2C(v290, v289, type metadata accessor for TaskPayloadRecord);
        uint64_t v291 = swift_allocObject();
        sub_100031468(v289, v291 + v529, type metadata accessor for TaskPayloadRecord);
        uint64_t v292 = sub_100032860();
        os_log_type_t v293 = sub_100032AA0();
        uint64_t v294 = swift_allocObject();
        *(unsigned char *)(v294 + 16) = 32;
        uint64_t v295 = swift_allocObject();
        *(unsigned char *)(v295 + 16) = 8;
        uint64_t v296 = swift_allocObject();
        *(void *)(v296 + 16) = sub_100030B98;
        *(void *)(v296 + 24) = v291;
        uint64_t v297 = swift_allocObject();
        *(void *)(v297 + 16) = sub_100031B40;
        *(void *)(v297 + 24) = v296;
        uint64_t v298 = swift_allocObject();
        *(_OWORD *)(v298 + 16) = xmmword_100033B60;
        *(void *)(v298 + 32) = sub_100031D8C;
        *(void *)(v298 + 40) = v294;
        *(void *)(v298 + 48) = sub_100031D8C;
        *(void *)(v298 + 56) = v295;
        *(void *)(v298 + 64) = sub_100031B50;
        *(void *)(v298 + 72) = v297;
        swift_retain();
        swift_retain();
        swift_retain();
        swift_bridgeObjectRelease();
        if (os_log_type_enabled(v292, v293))
        {
          uint64_t v299 = (uint8_t *)swift_slowAlloc();
          uint64_t v300 = swift_slowAlloc();
          uint64_t v567 = 0;
          v568[0] = v300;
          *(_WORD *)uint64_t v299 = 258;
          v299[2] = *(unsigned char *)(v294 + 16);
          if (v561) {
            goto LABEL_107;
          }
          swift_release();
          v299[3] = *(unsigned char *)(v295 + 16);
          v566[0] = (uint64_t)(v299 + 4);
          swift_release();
          sub_10002C274(v566, (uint64_t)&v567, v568, *(uint64_t (**)(void))(v297 + 16));
          uint64_t v301 = v1[140];
          uint64_t v302 = v1[120];
          uint64_t v303 = v1[86];
          uint64_t v304 = v555[83];
          swift_release();
          _os_log_impl((void *)&_mh_execute_header, v292, v293, "Task %s doesn't have a valid taskFolder. Skipping task.", v299, 0xCu);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();

          v552(v301, v302);
          uint64_t v305 = v304;
          uint64_t v1 = v555;
          (*v494)(v303, v305);
        }
        else
        {
          uint64_t v334 = v1[140];
          uint64_t v335 = v1[120];
          uint64_t v336 = v1[86];
          uint64_t v337 = v1[83];

          swift_release();
          swift_release();
          swift_release();
          v552(v334, v335);
          (*v494)(v336, v337);
        }
        uint64_t v221 = v1[60];
        uint64_t v222 = v560;
        uint64_t v223 = v288;
      }
      sub_100030BD0(v221, type metadata accessor for TaskPayloadRecord);
      uint64_t v217 = v223 + v541;
      uint64_t v212 = v222 - 1;
      if (!v212)
      {
        swift_bridgeObjectRelease();
        goto LABEL_104;
      }
      continue;
    }
    break;
  }
  uint64_t v427 = (void (*)(void, void, void))v1[180];
  uint64_t v428 = v1[179];
  uint64_t v429 = v1[144];
  uint64_t v430 = v1[120];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v427(v429, v428, v430);
  uint64_t v431 = sub_100032860();
  os_log_type_t v432 = sub_100032A80();
  BOOL v433 = os_log_type_enabled(v431, v432);
  uint64_t v434 = v1[144];
  uint64_t v435 = v1[120];
  if (v433)
  {
    uint64_t v436 = (uint8_t *)swift_slowAlloc();
    uint64_t v567 = 0;
    v568[0] = 0;
    *(_WORD *)uint64_t v436 = 0;
    v566[0] = (uint64_t)(v436 + 2);
    sub_10002BCC0((uint64_t)_swiftEmptyArrayStorage, (uint64_t)v566, (uint64_t)&v567, (uint64_t)v568);
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v431, v432, "Task cancelled before while processing TaskPayloads.", v436, 2u);
    swift_slowDealloc();
  }
  else
  {
    swift_bridgeObjectRelease();
  }

  v552(v434, v435);
  uint64_t v457 = (void *)v1[195];
  uint64_t v458 = (void *)v1[194];
  uint64_t v459 = (void *)v1[193];
  os_log_type_t v460 = (void *)v1[192];
  BOOL v461 = (void *)v1[191];
  uint64_t v462 = (void *)v1[190];
  uint64_t v463 = v1[188];
  uint64_t v565 = v1[119];
  uint64_t v464 = v1[118];
  uint64_t v554 = v1[117];
  uint64_t v544 = v1[60];
  id v465 = objc_allocWithZone((Class)sub_100032780());
  uint64_t v480 = sub_100032770();

  swift_release();
  sub_100030BD0(v544, type metadata accessor for TaskPayloadRecord);
LABEL_116:
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  sub_100027C1C(v463);
  (*(void (**)(NSObject *, uint64_t))(v464 + 8))(v565, v554);
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  v479 = (uint64_t (*)(void))v1[1];
  return v479(v480);
}

uint64_t sub_1000229A8()
{
  id v29 = v0;
  uint64_t v1 = (void (*)(uint64_t, uint64_t, uint64_t))v0[180];
  uint64_t v2 = v0[179];
  uint64_t v3 = v0[137];
  uint64_t v4 = v0[120];
  swift_bridgeObjectRelease();
  v1(v3, v2, v4);
  uint64_t v5 = sub_100032860();
  os_log_type_t v6 = sub_100032AA0();
  BOOL v7 = os_log_type_enabled(v5, v6);
  uint64_t v8 = (void (*)(uint64_t, uint64_t))v0[200];
  uint64_t v9 = v0[137];
  uint64_t v10 = v0[120];
  if (v7)
  {
    os_log_type_t v11 = (uint8_t *)swift_slowAlloc();
    uint64_t v27 = 0;
    v28[0] = 0;
    *(_WORD *)os_log_type_t v11 = 0;
    uint64_t v26 = v11 + 2;
    sub_10002BCC0((uint64_t)_swiftEmptyArrayStorage, (uint64_t)&v26, (uint64_t)&v27, (uint64_t)v28);
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "Invalid remote reply when requesting active tasks.", v11, 2u);
    swift_slowDealloc();
  }
  else
  {
    swift_bridgeObjectRelease();
  }

  v8(v9, v10);
  uint64_t v12 = (void *)v0[195];
  uint64_t v13 = (void *)v0[194];
  uint64_t v14 = (void *)v0[193];
  uint64_t v15 = (void *)v0[192];
  uint64_t v16 = (void *)v0[191];
  uint64_t v17 = (void *)v0[190];
  uint64_t v18 = v0[188];
  uint64_t v25 = v0[119];
  uint64_t v19 = v0[118];
  uint64_t v24 = v0[117];
  id v20 = objc_allocWithZone((Class)sub_100032780());
  uint64_t v23 = sub_100032770();

  swift_release();
  swift_release();
  sub_100027C1C(v18);
  (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v25, v24);
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v21 = (uint64_t (*)(uint64_t))v0[1];
  return v21(v23);
}

uint64_t sub_10002313C()
{
  uint64_t v25 = v0;
  (*(void (**)(void, void, void))(v0 + 1440))(*(void *)(v0 + 1088), *(void *)(v0 + 1432), *(void *)(v0 + 960));
  uint64_t v1 = sub_100032860();
  os_log_type_t v2 = sub_100032AA0();
  BOOL v3 = os_log_type_enabled(v1, v2);
  uint64_t v4 = *(void *)(v0 + 1088);
  uint64_t v5 = *(void *)(v0 + 968);
  uint64_t v6 = *(void *)(v0 + 960);
  if (v3)
  {
    BOOL v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v23 = 0;
    v24[0] = 0;
    *(_WORD *)BOOL v7 = 0;
    uint64_t v22 = v7 + 2;
    sub_10002BCC0((uint64_t)_swiftEmptyArrayStorage, (uint64_t)&v22, (uint64_t)&v23, (uint64_t)v24);
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "Failed at fetching available extentions from mlhostd.", v7, 2u);
    swift_slowDealloc();
  }
  else
  {
    swift_bridgeObjectRelease();
  }

  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
  uint64_t v8 = *(void **)(v0 + 1560);
  uint64_t v9 = *(void **)(v0 + 1552);
  uint64_t v10 = *(void **)(v0 + 1544);
  os_log_type_t v11 = *(void **)(v0 + 1536);
  uint64_t v12 = *(void **)(v0 + 1528);
  uint64_t v13 = *(void **)(v0 + 1520);
  uint64_t v14 = *(void *)(v0 + 1504);
  uint64_t v21 = *(void *)(v0 + 952);
  uint64_t v15 = *(void *)(v0 + 944);
  uint64_t v20 = *(void *)(v0 + 936);
  id v16 = objc_allocWithZone((Class)sub_100032780());
  uint64_t v19 = sub_100032770();

  swift_release();
  sub_100027C1C(v14);
  (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v21, v20);
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v17 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v17(v19);
}

uint64_t sub_1000238A8()
{
  uint64_t v20 = v0;
  uint64_t v1 = (void (*)(uint64_t, uint64_t, uint64_t))v0[180];
  uint64_t v2 = v0[179];
  uint64_t v3 = v0[135];
  uint64_t v4 = v0[120];
  uint64_t v5 = v0[116];
  (*(void (**)(uint64_t, uint64_t, uint64_t, void))(v0[118] + 56))(v5, 1, 1, v0[117]);
  sub_1000065E4(v5, &qword_10003C818);
  v1(v3, v2, v4);
  uint64_t v6 = sub_100032860();
  os_log_type_t v7 = sub_100032AA0();
  BOOL v8 = os_log_type_enabled(v6, v7);
  uint64_t v9 = (void (*)(uint64_t, uint64_t))v0[183];
  uint64_t v10 = v0[135];
  uint64_t v11 = v0[120];
  if (v8)
  {
    uint64_t v12 = (uint8_t *)swift_slowAlloc();
    uint64_t v18 = 0;
    v19[0] = 0;
    *(_WORD *)uint64_t v12 = 0;
    uint64_t v17 = v12 + 2;
    sub_10002BCC0((uint64_t)_swiftEmptyArrayStorage, (uint64_t)&v17, (uint64_t)&v18, (uint64_t)v19);
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "Failed at querying mlhostd.", v12, 2u);
    swift_slowDealloc();
  }
  else
  {
    swift_bridgeObjectRelease();
  }

  v9(v10, v11);
  id v13 = objc_allocWithZone((Class)sub_100032780());
  uint64_t v16 = sub_100032770();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v14 = (uint64_t (*)(uint64_t))v0[1];
  return v14(v16);
}

uint64_t sub_100023FE4()
{
  uint64_t v93 = v0;
  uint64_t v1 = *(void *)(v0 + 1704);
  uint64_t v2 = *(void **)(v0 + 1664);
  uint64_t v3 = *(void (**)(uint64_t, uint64_t))(v0 + 1488);
  uint64_t v4 = *(void *)(v0 + 912);
  uint64_t v5 = *(void *)(v0 + 872);

  v3(v4, v5);
  *(void *)(v0 + 352) = v1;
  swift_errorRetain();
  sub_100005644(&qword_10003C890);
  type metadata accessor for CKError(0);
  char v6 = swift_dynamicCast();
  uint64_t v7 = *(void *)(v0 + 1704);
  BOOL v8 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 1440);
  uint64_t v9 = *(void *)(v0 + 1432);
  uint64_t v10 = *(void *)(v0 + 960);
  if (v6)
  {
    uint64_t v11 = *(void *)(v0 + 1072);
    swift_errorRelease();
    uint64_t v12 = *(void **)(v0 + 344);
    v8(v11, v9, v10);
    uint64_t v13 = swift_allocObject();
    *(void *)(v13 + 16) = v12;
    id v87 = v12;
    uint64_t v14 = sub_100032860();
    os_log_type_t v15 = sub_100032AA0();
    uint64_t v16 = swift_allocObject();
    *(unsigned char *)(v16 + 16) = 64;
    uint64_t v17 = swift_allocObject();
    *(unsigned char *)(v17 + 16) = 8;
    uint64_t v18 = swift_allocObject();
    *(void *)(v18 + 16) = sub_100031D84;
    *(void *)(v18 + 24) = v13;
    uint64_t v19 = swift_allocObject();
    *(void *)(v19 + 16) = sub_10002FE30;
    *(void *)(v19 + 24) = v18;
    uint64_t v20 = swift_allocObject();
    *(void *)(v20 + 16) = sub_100031B4C;
    *(void *)(v20 + 24) = v19;
    uint64_t v21 = swift_allocObject();
    *(_OWORD *)(v21 + 16) = xmmword_100033B60;
    *(void *)(v21 + 32) = sub_100031D8C;
    *(void *)(v21 + 40) = v16;
    *(void *)(v21 + 48) = sub_100031D8C;
    *(void *)(v21 + 56) = v17;
    *(void *)(v21 + 64) = sub_100031B54;
    *(void *)(v21 + 72) = v20;
    swift_retain();
    swift_retain();
    swift_retain();
    swift_bridgeObjectRelease();
    os_log_type_t v22 = v15;
    if (os_log_type_enabled(v14, v15))
    {
      uint64_t v23 = (uint8_t *)swift_slowAlloc();
      v92[0] = (void *)swift_slowAlloc();
      v89[0] = 0;
      *(_WORD *)uint64_t v23 = 258;
      void v23[2] = *(unsigned char *)(v16 + 16);
      swift_release();
      v23[3] = *(unsigned char *)(v17 + 16);
      v88[0] = (uint64_t)(v23 + 4);
      swift_release();
      sub_10002C320(v88, v92, (uint64_t)v89, *(uint64_t (**)(void))(v20 + 16));
      uint64_t v82 = *(void (**)(uint64_t, uint64_t))(v0 + 1600);
      uint64_t v24 = *(void *)(v0 + 1072);
      uint64_t v25 = *(void *)(v0 + 960);
      swift_release();
      _os_log_impl((void *)&_mh_execute_header, v14, v22, "CKError: %@", v23, 0xCu);
      sub_100005644(&qword_10003C8A0);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      v82(v24, v25);
    }
    else
    {
      uint64_t v41 = *(void (**)(uint64_t, uint64_t))(v0 + 1600);
      uint64_t v42 = *(void *)(v0 + 1072);
      uint64_t v43 = *(void *)(v0 + 960);
      swift_release();
      swift_release();
      swift_release();

      v41(v42, v43);
    }
    *(void *)(v0 + 312) = v87;
    sub_10002FED0(&qword_10003C658, type metadata accessor for CKError);
    sub_1000324A0();
    if (*(void *)(v0 + 328) == 7)
    {
      (*(void (**)(void, void, void))(v0 + 1440))(*(void *)(v0 + 1064), *(void *)(v0 + 1432), *(void *)(v0 + 960));
      BOOL v44 = sub_100032860();
      os_log_type_t v45 = sub_100032A80();
      BOOL v46 = os_log_type_enabled(v44, v45);
      uint64_t v47 = *(void (**)(uint64_t, uint64_t))(v0 + 1600);
      uint64_t v48 = *(void *)(v0 + 1064);
      uint64_t v49 = *(void *)(v0 + 960);
      if (v46)
      {
        uint64_t v50 = (uint8_t *)swift_slowAlloc();
        v92[0] = 0;
        v89[0] = 0;
        *(_WORD *)uint64_t v50 = 0;
        v88[0] = (uint64_t)(v50 + 2);
        sub_10002BCC0((uint64_t)_swiftEmptyArrayStorage, (uint64_t)v88, (uint64_t)v92, (uint64_t)v89);
        swift_bridgeObjectRelease();
        _os_log_impl((void *)&_mh_execute_header, v44, v45, "Found CloudKit rate-limit, deferring execution.", v50, 2u);
        swift_slowDealloc();
      }
      else
      {
        swift_bridgeObjectRelease();
      }

      v47(v48, v49);
      uint64_t v71 = *(void **)(v0 + 1560);
      uint64_t v72 = *(void **)(v0 + 1552);
      uint64_t v73 = *(void **)(v0 + 1544);
      uint64_t v74 = *(void **)(v0 + 1536);
      uint64_t v75 = *(void **)(v0 + 1528);
      uint64_t v76 = *(void **)(v0 + 1520);
      uint64_t v68 = *(void *)(v0 + 1504);
      uint64_t v86 = *(void *)(v0 + 952);
      uint64_t v69 = *(void *)(v0 + 944);
      uint64_t v84 = *(void *)(v0 + 936);
      id v77 = objc_allocWithZone((Class)sub_100032780());
      uint64_t v80 = sub_100032770();

      swift_release();
    }
    else
    {
      uint64_t v63 = *(void **)(v0 + 1560);
      uint64_t v64 = *(void **)(v0 + 1552);
      uint64_t v65 = *(void **)(v0 + 1544);
      uint64_t v66 = *(void **)(v0 + 1536);
      uint64_t v67 = *(void **)(v0 + 1520);
      uint64_t v81 = *(void **)(v0 + 1528);
      uint64_t v68 = *(void *)(v0 + 1504);
      uint64_t v69 = *(void *)(v0 + 944);
      uint64_t v84 = *(void *)(v0 + 936);
      uint64_t v86 = *(void *)(v0 + 952);
      uint64_t v90 = &type metadata for CloudError;
      unint64_t v91 = sub_10002FE5C();
      LOBYTE(v89[0]) = 1;
      id v70 = objc_allocWithZone((Class)sub_100032780());
      uint64_t v80 = sub_100032760();

      swift_release();
    }
    swift_errorRelease();
    sub_100027C1C(v68);
    (*(void (**)(uint64_t, uint64_t))(v69 + 8))(v86, v84);
  }
  else
  {
    uint64_t v26 = *(void *)(v0 + 1056);
    swift_errorRelease();
    v8(v26, v9, v10);
    uint64_t v27 = swift_allocObject();
    *(void *)(v27 + 16) = v7;
    swift_errorRetain();
    uint64_t v28 = sub_100032860();
    os_log_type_t v29 = sub_100032AA0();
    uint64_t v30 = swift_allocObject();
    *(unsigned char *)(v30 + 16) = 64;
    uint64_t v31 = swift_allocObject();
    *(unsigned char *)(v31 + 16) = 8;
    uint64_t v32 = swift_allocObject();
    *(void *)(v32 + 16) = sub_100031D84;
    *(void *)(v32 + 24) = v27;
    uint64_t v33 = swift_allocObject();
    *(void *)(v33 + 16) = sub_10002FE30;
    *(void *)(v33 + 24) = v32;
    uint64_t v34 = swift_allocObject();
    *(void *)(v34 + 16) = sub_10002FE34;
    *(void *)(v34 + 24) = v33;
    uint64_t v35 = swift_allocObject();
    *(_OWORD *)(v35 + 16) = xmmword_100033B60;
    *(void *)(v35 + 32) = sub_100031D8C;
    *(void *)(v35 + 40) = v30;
    *(void *)(v35 + 48) = sub_100031D8C;
    *(void *)(v35 + 56) = v31;
    *(void *)(v35 + 64) = sub_100031B54;
    *(void *)(v35 + 72) = v34;
    swift_retain();
    swift_retain();
    swift_retain();
    swift_bridgeObjectRelease();
    os_log_type_t v36 = v29;
    if (os_log_type_enabled(v28, v29))
    {
      uint64_t v37 = (uint8_t *)swift_slowAlloc();
      v92[0] = (void *)swift_slowAlloc();
      v89[0] = 0;
      *(_WORD *)uint64_t v37 = 258;
      v37[2] = *(unsigned char *)(v30 + 16);
      swift_release();
      v37[3] = *(unsigned char *)(v31 + 16);
      v88[0] = (uint64_t)(v37 + 4);
      swift_release();
      sub_10002C320(v88, v92, (uint64_t)v89, *(uint64_t (**)(void))(v34 + 16));
      uint64_t v38 = *(void (**)(uint64_t, uint64_t))(v0 + 1600);
      uint64_t v39 = *(void *)(v0 + 1056);
      uint64_t v40 = *(void *)(v0 + 960);
      swift_release();
      _os_log_impl((void *)&_mh_execute_header, v28, v36, "Error: %@", v37, 0xCu);
      sub_100005644(&qword_10003C8A0);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      v38(v39, v40);
    }
    else
    {
      uint64_t v51 = *(void (**)(uint64_t, uint64_t))(v0 + 1600);
      uint64_t v52 = *(void *)(v0 + 1056);
      uint64_t v53 = *(void *)(v0 + 960);
      swift_release();
      swift_release();
      swift_release();

      v51(v52, v53);
    }
    uint64_t v54 = *(void **)(v0 + 1560);
    uint64_t v55 = *(void **)(v0 + 1552);
    uint64_t v56 = *(void **)(v0 + 1544);
    os_log_type_t v57 = *(void **)(v0 + 1536);
    BOOL v58 = *(void **)(v0 + 1528);
    uint64_t v59 = *(void **)(v0 + 1520);
    uint64_t v60 = *(void *)(v0 + 1504);
    uint64_t v85 = *(void *)(v0 + 952);
    uint64_t v61 = *(void *)(v0 + 944);
    uint64_t v83 = *(void *)(v0 + 936);
    uint64_t v90 = &type metadata for CloudError;
    unint64_t v91 = sub_10002FE5C();
    LOBYTE(v89[0]) = 1;
    id v62 = objc_allocWithZone((Class)sub_100032780());
    uint64_t v80 = sub_100032760();

    swift_release();
    swift_errorRelease();
    sub_100027C1C(v60);
    (*(void (**)(uint64_t, uint64_t))(v61 + 8))(v85, v83);
  }
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v78 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v78(v80);
}

uint64_t sub_100024FC0()
{
  uint64_t v76 = v0;
  uint64_t v1 = *(void (**)(unint64_t, uint64_t, uint64_t))(v0 + 1776);
  uint64_t v2 = *(void *)(v0 + 776);
  uint64_t v3 = *(void *)(v0 + 768);
  uint64_t v4 = *(void *)(v0 + 752);
  uint64_t v5 = *(void *)(v0 + 744);
  (*(void (**)(void, void, void))(v0 + 1440))(*(void *)(v0 + 1296), *(void *)(v0 + 1432), *(void *)(v0 + 960));
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v3, v2, v5);
  unint64_t v6 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v7 = swift_allocObject();
  v1(v7 + v6, v3, v5);
  BOOL v8 = sub_100032860();
  os_log_type_t v9 = sub_100032AA0();
  uint64_t v10 = swift_allocObject();
  *(unsigned char *)(v10 + 16) = 32;
  uint64_t v11 = swift_allocObject();
  *(unsigned char *)(v11 + 16) = 8;
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = sub_100031250;
  *(void *)(v12 + 24) = v7;
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = sub_100031B40;
  *(void *)(v13 + 24) = v12;
  uint64_t v14 = swift_allocObject();
  *(_OWORD *)(v14 + 16) = xmmword_100033B60;
  *(void *)(v14 + 32) = sub_100031D8C;
  *(void *)(v14 + 40) = v10;
  *(void *)(v14 + 48) = sub_100031D8C;
  *(void *)(v14 + 56) = v11;
  *(void *)(v14 + 64) = sub_100031B50;
  *(void *)(v14 + 72) = v13;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRelease();
  if (os_log_type_enabled(v8, v9))
  {
    os_log_type_t v15 = (uint8_t *)swift_slowAlloc();
    uint64_t v16 = swift_slowAlloc();
    *(void *)(v0 + 368) = 0;
    *(void *)(v0 + 376) = v16;
    *(_WORD *)os_log_type_t v15 = 258;
    v15[2] = *(unsigned char *)(v10 + 16);
    *(void *)(v0 + 360) = v15 + 3;
    swift_release();
    uint64_t v17 = *(unsigned char **)(v0 + 360);
    unsigned char *v17 = *(unsigned char *)(v11 + 16);
    *(void *)(v0 + 360) = v17 + 1;
    swift_release();
    sub_10002C274((uint64_t *)(v0 + 360), v0 + 368, (uint64_t *)(v0 + 376), *(uint64_t (**)(void))(v13 + 16));
    uint64_t v18 = *(void *)(v0 + 1296);
    uint64_t v19 = *(void *)(v0 + 960);
    uint64_t v71 = *(void *)(v0 + 824);
    uint64_t v72 = (uint64_t *)(v0 + 1752);
    uint64_t v67 = *(void *)(v0 + 776);
    uint64_t v68 = *(void (**)(uint64_t, uint64_t))(v0 + 1752);
    uint64_t v20 = *(void *)(v0 + 752);
    uint64_t v66 = *(void *)(v0 + 744);
    swift_release();
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "Invalid remote reply for taskName: %s", v15, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    v68(v18, v19);
    (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v67, v66);
  }
  else
  {
    uint64_t v69 = *(void (**)(uint64_t, uint64_t))(v0 + 1760);
    uint64_t v21 = *(void *)(v0 + 1296);
    uint64_t v22 = *(void *)(v0 + 960);
    uint64_t v71 = *(void *)(v0 + 824);
    uint64_t v72 = (uint64_t *)(v0 + 1760);
    uint64_t v23 = *(void *)(v0 + 776);
    uint64_t v24 = v8;
    uint64_t v25 = *(void *)(v0 + 752);
    uint64_t v26 = *(void *)(v0 + 744);

    swift_release();
    swift_release();
    swift_release();
    v69(v21, v22);
    (*(void (**)(uint64_t, uint64_t))(v25 + 8))(v23, v26);
  }
  sub_100030BD0(v71, type metadata accessor for TaskRecord);
  uint64_t v27 = *(void *)(v0 + 1504);
  uint64_t v28 = *(void *)(v27 + 48);
  BOOL v29 = __OFADD__(v28, 1);
  uint64_t v30 = v28 + 1;
  if (v29) {
    __break(1u);
  }
  uint64_t v31 = *v72;
  *(void *)(v27 + 48) = v30;
  uint64_t v32 = *(void *)(v0 + 1768) + 1;
  if (v32 == *(void *)(v0 + 1728))
  {
    swift_bridgeObjectRelease();
    uint64_t v33 = *(void *)(v0 + 1712);
    (*(void (**)(void, void, void))(v0 + 1440))(*(void *)(v0 + 1280), *(void *)(v0 + 1432), *(void *)(v0 + 960));
    uint64_t v34 = swift_allocObject();
    *(void *)(v34 + 16) = sub_10002FFA8;
    *(void *)(v34 + 24) = v33;
    swift_retain();
    uint64_t v35 = sub_100032860();
    os_log_type_t v36 = sub_100032A80();
    uint64_t v37 = swift_allocObject();
    *(unsigned char *)(v37 + 16) = 32;
    uint64_t v38 = swift_allocObject();
    *(unsigned char *)(v38 + 16) = 8;
    uint64_t v39 = swift_allocObject();
    *(void *)(v39 + 16) = sub_10002F988;
    *(void *)(v39 + 24) = v34;
    uint64_t v40 = swift_allocObject();
    *(void *)(v40 + 16) = sub_100031B40;
    *(void *)(v40 + 24) = v39;
    uint64_t v41 = swift_allocObject();
    *(_OWORD *)(v41 + 16) = xmmword_100033B60;
    *(void *)(v41 + 32) = sub_100031D8C;
    *(void *)(v41 + 40) = v37;
    *(void *)(v41 + 48) = sub_100031D8C;
    *(void *)(v41 + 56) = v38;
    *(void *)(v41 + 64) = sub_100031B50;
    *(void *)(v41 + 72) = v40;
    swift_retain();
    swift_retain();
    swift_retain();
    swift_bridgeObjectRelease();
    if (os_log_type_enabled(v35, v36))
    {
      uint64_t v42 = (uint8_t *)swift_slowAlloc();
      uint64_t v43 = swift_slowAlloc();
      uint64_t v74 = 0;
      uint64_t v75 = v43;
      *(_WORD *)uint64_t v42 = 258;
      v42[2] = *(unsigned char *)(v37 + 16);
      swift_release();
      v42[3] = *(unsigned char *)(v38 + 16);
      uint64_t v73 = v42 + 4;
      swift_release();
      sub_10002C274((uint64_t *)&v73, (uint64_t)&v74, &v75, *(uint64_t (**)(void))(v40 + 16));
      BOOL v58 = (void *)v0;
      uint64_t v59 = *(void (**)(uint64_t, uint64_t))(v0 + 1600);
      uint64_t v60 = v58[160];
      uint64_t v61 = v58[120];
      swift_release();
      _os_log_impl((void *)&_mh_execute_header, v35, v36, "Computed addedTaskNames: %s", v42, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      uint64_t v62 = v60;
      uint64_t v63 = v61;
    }
    else
    {
      BOOL v58 = (void *)v0;
      uint64_t v59 = *(void (**)(uint64_t, uint64_t))(v0 + 1600);
      uint64_t v47 = v58[160];
      uint64_t v48 = v58[120];
      swift_release();
      swift_release();
      swift_release();

      uint64_t v62 = v47;
      uint64_t v63 = v48;
    }
    v59(v62, v63);
    uint64_t v64 = async function pointer to dispatch thunk of MLHostClient.getTasks();
    uint64_t v65 = (void *)swift_task_alloc();
    v58[226] = v65;
    *uint64_t v65 = v58;
    v65[1] = sub_100010C8C;
    return ((uint64_t (*)(void))((char *)&async function pointer to dispatch thunk of MLHostClient.getTasks() + v64))();
  }
  else
  {
    long long v70 = *(_OWORD *)(v0 + 1744);
    *(void *)(v0 + 1768) = v32;
    *(void *)(v0 + 1760) = v31;
    *(_OWORD *)(v0 + 1744) = v70;
    uint64_t v44 = *(void *)(v0 + 824);
    sub_100030B2C(*(void *)(v0 + 1720)+ ((*(unsigned __int8 *)(v0 + 1944) + 32) & ~(unint64_t)*(unsigned __int8 *)(v0 + 1944))+ *(void *)(v0 + 1736) * v32, v44, type metadata accessor for TaskRecord);
    uint64_t v45 = *(void *)(v44 + 32);
    unint64_t v46 = *(void *)(v44 + 40);
    sub_1000062A0(v45, v46);
    sub_10002FED0(&qword_10003C8A8, (void (*)(uint64_t))&type metadata accessor for TaskDefinition);
    sub_100032430();
    uint64_t v49 = *(void *)(v0 + 776);
    uint64_t v50 = *(void *)(v0 + 752);
    uint64_t v51 = *(void *)(v0 + 744);
    uint64_t v52 = *(void *)(v0 + 728);
    sub_100006248(v45, v46);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v50 + 56))(v52, 0, 1, v51);
    uint64_t v53 = *(void (**)(uint64_t, uint64_t, uint64_t))(v50 + 32);
    *(void *)(v0 + 1776) = v53;
    *(void *)(v0 + 1784) = (v50 + 32) & 0xFFFFFFFFFFFFLL | 0x48D8000000000000;
    v53(v49, v52, v51);
    uint64_t v54 = async function pointer to dispatch thunk of MLHostClient.addTask(taskDefinition:);
    uint64_t v55 = (void *)swift_task_alloc();
    *(void *)(v0 + 1792) = v55;
    *uint64_t v55 = v0;
    v55[1] = sub_10000F9A4;
    uint64_t v56 = *(void *)(v0 + 776);
    return ((uint64_t (*)(uint64_t))((char *)&async function pointer to dispatch thunk of MLHostClient.addTask(taskDefinition:)
                                            + v54))(v56);
  }
}

uint64_t sub_100025B68()
{
  uint64_t v89 = v0;
  uint64_t v1 = *(void *)(v0 + 1888);

  *(void *)(v0 + 296) = v1;
  swift_errorRetain();
  sub_100005644(&qword_10003C890);
  type metadata accessor for CKError(0);
  char v2 = swift_dynamicCast();
  uint64_t v3 = *(void *)(v0 + 1888);
  uint64_t v4 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 1440);
  uint64_t v5 = *(void *)(v0 + 1432);
  uint64_t v6 = *(void *)(v0 + 960);
  if (v2)
  {
    uint64_t v7 = *(void *)(v0 + 1040);
    swift_errorRelease();
    BOOL v8 = *(void **)(v0 + 256);
    v4(v7, v5, v6);
    uint64_t v9 = swift_allocObject();
    *(void *)(v9 + 16) = v8;
    id v83 = v8;
    uint64_t v10 = sub_100032860();
    os_log_type_t v11 = sub_100032AA0();
    uint64_t v12 = swift_allocObject();
    *(unsigned char *)(v12 + 16) = 64;
    uint64_t v13 = swift_allocObject();
    *(unsigned char *)(v13 + 16) = 8;
    uint64_t v14 = swift_allocObject();
    *(void *)(v14 + 16) = sub_100031D84;
    *(void *)(v14 + 24) = v9;
    uint64_t v15 = swift_allocObject();
    *(void *)(v15 + 16) = sub_10002FE30;
    *(void *)(v15 + 24) = v14;
    uint64_t v16 = swift_allocObject();
    *(void *)(v16 + 16) = sub_100031B4C;
    *(void *)(v16 + 24) = v15;
    uint64_t v17 = swift_allocObject();
    *(_OWORD *)(v17 + 16) = xmmword_100033B60;
    *(void *)(v17 + 32) = sub_100031D8C;
    *(void *)(v17 + 40) = v12;
    *(void *)(v17 + 48) = sub_100031D8C;
    *(void *)(v17 + 56) = v13;
    *(void *)(v17 + 64) = sub_100031B54;
    *(void *)(v17 + 72) = v16;
    swift_retain();
    swift_retain();
    swift_retain();
    swift_bridgeObjectRelease();
    os_log_type_t v18 = v11;
    if (os_log_type_enabled(v10, v11))
    {
      uint64_t v19 = (uint8_t *)swift_slowAlloc();
      v88[0] = (void *)swift_slowAlloc();
      v85[0] = 0;
      *(_WORD *)uint64_t v19 = 258;
      v19[2] = *(unsigned char *)(v12 + 16);
      swift_release();
      void v19[3] = *(unsigned char *)(v13 + 16);
      v84[0] = (uint64_t)(v19 + 4);
      swift_release();
      sub_10002C320(v84, v88, (uint64_t)v85, *(uint64_t (**)(void))(v16 + 16));
      uint64_t v78 = *(void (**)(uint64_t, uint64_t))(v0 + 1600);
      uint64_t v20 = *(void *)(v0 + 1040);
      uint64_t v21 = *(void *)(v0 + 960);
      swift_release();
      _os_log_impl((void *)&_mh_execute_header, v10, v18, "CKError: %@", v19, 0xCu);
      sub_100005644(&qword_10003C8A0);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      v78(v20, v21);
    }
    else
    {
      uint64_t v37 = *(void (**)(uint64_t, uint64_t))(v0 + 1600);
      uint64_t v38 = *(void *)(v0 + 1040);
      uint64_t v39 = *(void *)(v0 + 960);
      swift_release();
      swift_release();
      swift_release();

      v37(v38, v39);
    }
    *(void *)(v0 + 240) = v83;
    sub_10002FED0(&qword_10003C658, type metadata accessor for CKError);
    sub_1000324A0();
    if (*(void *)(v0 + 248) == 7)
    {
      (*(void (**)(void, void, void))(v0 + 1440))(*(void *)(v0 + 1032), *(void *)(v0 + 1432), *(void *)(v0 + 960));
      uint64_t v40 = sub_100032860();
      os_log_type_t v41 = sub_100032A80();
      BOOL v42 = os_log_type_enabled(v40, v41);
      uint64_t v43 = *(void (**)(uint64_t, uint64_t))(v0 + 1600);
      uint64_t v44 = *(void *)(v0 + 1032);
      uint64_t v45 = *(void *)(v0 + 960);
      if (v42)
      {
        unint64_t v46 = (uint8_t *)swift_slowAlloc();
        v88[0] = 0;
        v85[0] = 0;
        *(_WORD *)unint64_t v46 = 0;
        v84[0] = (uint64_t)(v46 + 2);
        sub_10002BCC0((uint64_t)_swiftEmptyArrayStorage, (uint64_t)v84, (uint64_t)v88, (uint64_t)v85);
        swift_bridgeObjectRelease();
        _os_log_impl((void *)&_mh_execute_header, v40, v41, "Found CloudKit rate-limit, deferring execution.", v46, 2u);
        swift_slowDealloc();
      }
      else
      {
        swift_bridgeObjectRelease();
      }

      v43(v44, v45);
      uint64_t v67 = *(void **)(v0 + 1560);
      uint64_t v68 = *(void **)(v0 + 1552);
      uint64_t v69 = *(void **)(v0 + 1544);
      long long v70 = *(void **)(v0 + 1536);
      uint64_t v71 = *(void **)(v0 + 1528);
      uint64_t v72 = *(void **)(v0 + 1520);
      uint64_t v64 = *(void *)(v0 + 1504);
      uint64_t v81 = *(void *)(v0 + 952);
      uint64_t v65 = *(void *)(v0 + 944);
      uint64_t v79 = *(void *)(v0 + 936);
      id v73 = objc_allocWithZone((Class)sub_100032780());
      uint64_t v76 = sub_100032770();

      swift_release();
    }
    else
    {
      uint64_t v59 = *(void **)(v0 + 1560);
      uint64_t v60 = *(void **)(v0 + 1552);
      uint64_t v61 = *(void **)(v0 + 1544);
      uint64_t v62 = *(void **)(v0 + 1536);
      uint64_t v63 = *(void **)(v0 + 1520);
      uint64_t v77 = *(void **)(v0 + 1528);
      uint64_t v64 = *(void *)(v0 + 1504);
      uint64_t v81 = *(void *)(v0 + 952);
      uint64_t v65 = *(void *)(v0 + 944);
      uint64_t v79 = *(void *)(v0 + 936);
      uint64_t v86 = &type metadata for CloudError;
      unint64_t v87 = sub_10002FE5C();
      LOBYTE(v85[0]) = 1;
      id v66 = objc_allocWithZone((Class)sub_100032780());
      uint64_t v76 = sub_100032760();

      swift_release();
    }
    swift_errorRelease();
    swift_release();
    swift_release();
    swift_release();
    sub_100027C1C(v64);
    (*(void (**)(uint64_t, uint64_t))(v65 + 8))(v81, v79);
  }
  else
  {
    uint64_t v22 = *(void *)(v0 + 1024);
    swift_errorRelease();
    v4(v22, v5, v6);
    uint64_t v23 = swift_allocObject();
    *(void *)(v23 + 16) = v3;
    swift_errorRetain();
    uint64_t v24 = sub_100032860();
    os_log_type_t v25 = sub_100032AA0();
    uint64_t v26 = swift_allocObject();
    *(unsigned char *)(v26 + 16) = 64;
    uint64_t v27 = swift_allocObject();
    *(unsigned char *)(v27 + 16) = 8;
    uint64_t v28 = swift_allocObject();
    *(void *)(v28 + 16) = sub_100031D84;
    *(void *)(v28 + 24) = v23;
    uint64_t v29 = swift_allocObject();
    *(void *)(v29 + 16) = sub_10002FE30;
    *(void *)(v29 + 24) = v28;
    uint64_t v30 = swift_allocObject();
    *(void *)(v30 + 16) = sub_100031B4C;
    *(void *)(v30 + 24) = v29;
    uint64_t v31 = swift_allocObject();
    *(_OWORD *)(v31 + 16) = xmmword_100033B60;
    *(void *)(v31 + 32) = sub_100031D8C;
    *(void *)(v31 + 40) = v26;
    *(void *)(v31 + 48) = sub_100031D8C;
    *(void *)(v31 + 56) = v27;
    *(void *)(v31 + 64) = sub_100031B54;
    *(void *)(v31 + 72) = v30;
    swift_retain();
    swift_retain();
    swift_retain();
    swift_bridgeObjectRelease();
    os_log_type_t v32 = v25;
    if (os_log_type_enabled(v24, v25))
    {
      uint64_t v33 = (uint8_t *)swift_slowAlloc();
      v88[0] = (void *)swift_slowAlloc();
      v85[0] = 0;
      *(_WORD *)uint64_t v33 = 258;
      v33[2] = *(unsigned char *)(v26 + 16);
      swift_release();
      v33[3] = *(unsigned char *)(v27 + 16);
      v84[0] = (uint64_t)(v33 + 4);
      swift_release();
      sub_10002C320(v84, v88, (uint64_t)v85, *(uint64_t (**)(void))(v30 + 16));
      uint64_t v34 = *(void (**)(uint64_t, uint64_t))(v0 + 1600);
      uint64_t v35 = *(void *)(v0 + 1024);
      uint64_t v36 = *(void *)(v0 + 960);
      swift_release();
      _os_log_impl((void *)&_mh_execute_header, v24, v32, "Error: %@", v33, 0xCu);
      sub_100005644(&qword_10003C8A0);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      v34(v35, v36);
    }
    else
    {
      uint64_t v47 = *(void (**)(uint64_t, uint64_t))(v0 + 1600);
      uint64_t v48 = *(void *)(v0 + 1024);
      uint64_t v49 = *(void *)(v0 + 960);
      swift_release();
      swift_release();
      swift_release();

      v47(v48, v49);
    }
    uint64_t v50 = *(void **)(v0 + 1560);
    uint64_t v51 = *(void **)(v0 + 1552);
    uint64_t v52 = *(void **)(v0 + 1544);
    uint64_t v53 = *(void **)(v0 + 1536);
    uint64_t v54 = *(void **)(v0 + 1528);
    uint64_t v55 = *(void **)(v0 + 1520);
    uint64_t v56 = *(void *)(v0 + 1504);
    uint64_t v82 = *(void *)(v0 + 952);
    uint64_t v57 = *(void *)(v0 + 944);
    uint64_t v80 = *(void *)(v0 + 936);
    uint64_t v86 = &type metadata for CloudError;
    unint64_t v87 = sub_10002FE5C();
    LOBYTE(v85[0]) = 1;
    id v58 = objc_allocWithZone((Class)sub_100032780());
    uint64_t v76 = sub_100032760();

    swift_release();
    swift_errorRelease();
    swift_release();
    swift_release();
    swift_release();
    sub_100027C1C(v56);
    (*(void (**)(uint64_t, uint64_t))(v57 + 8))(v82, v80);
  }
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v74 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v74(v76);
}

uint64_t sub_100026B8C()
{
  uint64_t v87 = v0;
  uint64_t v1 = *(void *)(v0 + 1936);

  *(void *)(v0 + 264) = v1;
  swift_errorRetain();
  sub_100005644(&qword_10003C890);
  type metadata accessor for CKError(0);
  char v2 = swift_dynamicCast();
  uint64_t v3 = *(void *)(v0 + 1936);
  uint64_t v4 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 1440);
  uint64_t v5 = *(void *)(v0 + 1432);
  uint64_t v6 = *(void *)(v0 + 960);
  if (v2)
  {
    uint64_t v7 = *(void *)(v0 + 1016);
    swift_errorRelease();
    BOOL v8 = *(void **)(v0 + 272);
    v4(v7, v5, v6);
    uint64_t v9 = swift_allocObject();
    *(void *)(v9 + 16) = v8;
    id v83 = v8;
    uint64_t v10 = sub_100032860();
    os_log_type_t v11 = sub_100032AA0();
    uint64_t v12 = swift_allocObject();
    *(unsigned char *)(v12 + 16) = 64;
    uint64_t v13 = swift_allocObject();
    *(unsigned char *)(v13 + 16) = 8;
    uint64_t v14 = swift_allocObject();
    *(void *)(v14 + 16) = sub_100031D84;
    *(void *)(v14 + 24) = v9;
    uint64_t v15 = swift_allocObject();
    *(void *)(v15 + 16) = sub_10002FE30;
    *(void *)(v15 + 24) = v14;
    uint64_t v16 = swift_allocObject();
    *(void *)(v16 + 16) = sub_100031B4C;
    *(void *)(v16 + 24) = v15;
    uint64_t v17 = swift_allocObject();
    *(_OWORD *)(v17 + 16) = xmmword_100033B60;
    *(void *)(v17 + 32) = sub_100031D8C;
    *(void *)(v17 + 40) = v12;
    *(void *)(v17 + 48) = sub_100031D8C;
    *(void *)(v17 + 56) = v13;
    *(void *)(v17 + 64) = sub_100031B54;
    *(void *)(v17 + 72) = v16;
    swift_retain();
    swift_retain();
    swift_retain();
    swift_bridgeObjectRelease();
    os_log_type_t v18 = v11;
    if (os_log_type_enabled(v10, v11))
    {
      uint64_t v19 = (uint8_t *)swift_slowAlloc();
      v86[0] = (void *)swift_slowAlloc();
      v85[0] = 0;
      *(_WORD *)uint64_t v19 = 258;
      v19[2] = *(unsigned char *)(v12 + 16);
      swift_release();
      void v19[3] = *(unsigned char *)(v13 + 16);
      v84[0] = (uint64_t)(v19 + 4);
      swift_release();
      sub_10002C320(v84, v86, (uint64_t)v85, *(uint64_t (**)(void))(v16 + 16));
      uint64_t v78 = *(void (**)(uint64_t, uint64_t))(v0 + 1600);
      uint64_t v20 = *(void *)(v0 + 1016);
      uint64_t v21 = *(void *)(v0 + 960);
      swift_release();
      _os_log_impl((void *)&_mh_execute_header, v10, v18, "CKError: %@", v19, 0xCu);
      sub_100005644(&qword_10003C8A0);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      v78(v20, v21);
    }
    else
    {
      uint64_t v37 = *(void (**)(uint64_t, uint64_t))(v0 + 1600);
      uint64_t v38 = *(void *)(v0 + 1016);
      uint64_t v39 = *(void *)(v0 + 960);
      swift_release();
      swift_release();
      swift_release();

      v37(v38, v39);
    }
    *(void *)(v0 + 288) = v83;
    sub_10002FED0(&qword_10003C658, type metadata accessor for CKError);
    sub_1000324A0();
    if (*(void *)(v0 + 280) == 7)
    {
      (*(void (**)(void, void, void))(v0 + 1440))(*(void *)(v0 + 1008), *(void *)(v0 + 1432), *(void *)(v0 + 960));
      uint64_t v40 = sub_100032860();
      os_log_type_t v41 = sub_100032A80();
      BOOL v42 = os_log_type_enabled(v40, v41);
      uint64_t v43 = *(void *)(v0 + 1008);
      uint64_t v44 = *(void *)(v0 + 968);
      uint64_t v45 = *(void *)(v0 + 960);
      if (v42)
      {
        unint64_t v46 = (uint8_t *)swift_slowAlloc();
        v86[0] = 0;
        v85[0] = 0;
        *(_WORD *)unint64_t v46 = 0;
        v84[0] = (uint64_t)(v46 + 2);
        sub_10002BCC0((uint64_t)_swiftEmptyArrayStorage, (uint64_t)v84, (uint64_t)v86, (uint64_t)v85);
        swift_bridgeObjectRelease();
        _os_log_impl((void *)&_mh_execute_header, v40, v41, "Found CloudKit rate-limit, deferring execution.", v46, 2u);
        swift_slowDealloc();
      }
      else
      {
        swift_bridgeObjectRelease();
      }

      (*(void (**)(uint64_t, uint64_t))(v44 + 8))(v43, v45);
      uint64_t v67 = *(void **)(v0 + 1560);
      uint64_t v68 = *(void **)(v0 + 1552);
      uint64_t v69 = *(void **)(v0 + 1544);
      long long v70 = *(void **)(v0 + 1536);
      uint64_t v71 = *(void **)(v0 + 1528);
      uint64_t v72 = *(void **)(v0 + 1520);
      uint64_t v64 = *(void *)(v0 + 1504);
      uint64_t v81 = *(void *)(v0 + 952);
      uint64_t v65 = *(void *)(v0 + 944);
      uint64_t v79 = *(void *)(v0 + 936);
      id v73 = objc_allocWithZone((Class)sub_100032780());
      uint64_t v76 = sub_100032770();

      swift_release();
    }
    else
    {
      uint64_t v59 = *(void **)(v0 + 1560);
      uint64_t v60 = *(void **)(v0 + 1552);
      uint64_t v61 = *(void **)(v0 + 1544);
      uint64_t v62 = *(void **)(v0 + 1536);
      uint64_t v63 = *(void **)(v0 + 1520);
      uint64_t v77 = *(void **)(v0 + 1528);
      uint64_t v64 = *(void *)(v0 + 1504);
      uint64_t v81 = *(void *)(v0 + 952);
      uint64_t v65 = *(void *)(v0 + 944);
      uint64_t v79 = *(void *)(v0 + 936);
      void v85[3] = &type metadata for CloudError;
      v85[4] = sub_10002FE5C();
      LOBYTE(v85[0]) = 1;
      id v66 = objc_allocWithZone((Class)sub_100032780());
      uint64_t v76 = sub_100032760();

      swift_release();
    }
    swift_errorRelease();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    sub_100027C1C(v64);
    (*(void (**)(uint64_t, uint64_t))(v65 + 8))(v81, v79);
  }
  else
  {
    uint64_t v22 = *(void *)(v0 + 1000);
    swift_errorRelease();
    v4(v22, v5, v6);
    uint64_t v23 = swift_allocObject();
    *(void *)(v23 + 16) = v3;
    swift_errorRetain();
    uint64_t v24 = sub_100032860();
    os_log_type_t v25 = sub_100032AA0();
    uint64_t v26 = swift_allocObject();
    *(unsigned char *)(v26 + 16) = 64;
    uint64_t v27 = swift_allocObject();
    *(unsigned char *)(v27 + 16) = 8;
    uint64_t v28 = swift_allocObject();
    *(void *)(v28 + 16) = sub_100031D84;
    *(void *)(v28 + 24) = v23;
    uint64_t v29 = swift_allocObject();
    *(void *)(v29 + 16) = sub_10002FE30;
    *(void *)(v29 + 24) = v28;
    uint64_t v30 = swift_allocObject();
    *(void *)(v30 + 16) = sub_100031B4C;
    *(void *)(v30 + 24) = v29;
    uint64_t v31 = swift_allocObject();
    *(_OWORD *)(v31 + 16) = xmmword_100033B60;
    *(void *)(v31 + 32) = sub_100031D8C;
    *(void *)(v31 + 40) = v26;
    *(void *)(v31 + 48) = sub_100031D8C;
    *(void *)(v31 + 56) = v27;
    *(void *)(v31 + 64) = sub_100031B54;
    *(void *)(v31 + 72) = v30;
    swift_retain();
    swift_retain();
    swift_retain();
    swift_bridgeObjectRelease();
    os_log_type_t v32 = v25;
    if (os_log_type_enabled(v24, v25))
    {
      uint64_t v33 = (uint8_t *)swift_slowAlloc();
      v86[0] = (void *)swift_slowAlloc();
      v85[0] = 0;
      *(_WORD *)uint64_t v33 = 258;
      v33[2] = *(unsigned char *)(v26 + 16);
      swift_release();
      v33[3] = *(unsigned char *)(v27 + 16);
      v84[0] = (uint64_t)(v33 + 4);
      swift_release();
      sub_10002C320(v84, v86, (uint64_t)v85, *(uint64_t (**)(void))(v30 + 16));
      uint64_t v34 = *(void (**)(uint64_t, uint64_t))(v0 + 1600);
      uint64_t v35 = *(void *)(v0 + 1000);
      uint64_t v36 = *(void *)(v0 + 960);
      swift_release();
      _os_log_impl((void *)&_mh_execute_header, v24, v32, "Error: %@", v33, 0xCu);
      sub_100005644(&qword_10003C8A0);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      v34(v35, v36);
    }
    else
    {
      uint64_t v47 = *(void (**)(uint64_t, uint64_t))(v0 + 1600);
      uint64_t v48 = *(void *)(v0 + 1000);
      uint64_t v49 = *(void *)(v0 + 960);
      swift_release();
      swift_release();
      swift_release();

      v47(v48, v49);
    }
    uint64_t v50 = *(void **)(v0 + 1560);
    uint64_t v51 = *(void **)(v0 + 1552);
    uint64_t v52 = *(void **)(v0 + 1544);
    uint64_t v53 = *(void **)(v0 + 1536);
    uint64_t v54 = *(void **)(v0 + 1528);
    uint64_t v55 = *(void **)(v0 + 1520);
    uint64_t v56 = *(void *)(v0 + 1504);
    uint64_t v82 = *(void *)(v0 + 952);
    uint64_t v57 = *(void *)(v0 + 944);
    uint64_t v80 = *(void *)(v0 + 936);
    id v58 = objc_allocWithZone((Class)sub_100032780());
    uint64_t v76 = sub_100032770();

    swift_release();
    swift_errorRelease();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    sub_100027C1C(v56);
    (*(void (**)(uint64_t, uint64_t))(v57 + 8))(v82, v80);
  }
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v74 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v74(v76);
}

id sub_100027BB0(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    NSString v2 = sub_100032920();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v2 = 0;
  }
  id v3 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) initWithSuiteName:v2];

  return v3;
}

void sub_100027C1C(uint64_t a1)
{
  uint64_t v2 = sub_100032830();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_10003C398 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_100032880();
  sub_1000056A8(v6, (uint64_t)qword_10003C9C0);
  swift_retain_n();
  uint64_t v7 = sub_100032860();
  os_log_type_t v8 = sub_100032A90();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = swift_slowAlloc();
    uint64_t v21 = v2;
    uint64_t v10 = (uint8_t *)v9;
    uint64_t v20 = swift_slowAlloc();
    aBlock[0] = v20;
    *(_DWORD *)uint64_t v10 = 136315138;
    v19[1] = v10 + 4;
    swift_beginAccess();
    long long v11 = *(_OWORD *)(a1 + 96);
    v24[4] = *(_OWORD *)(a1 + 80);
    v24[5] = v11;
    uint64_t v25 = *(void *)(a1 + 112);
    long long v12 = *(_OWORD *)(a1 + 32);
    v24[0] = *(_OWORD *)(a1 + 16);
    v24[1] = v12;
    long long v13 = *(_OWORD *)(a1 + 64);
    void v24[2] = *(_OWORD *)(a1 + 48);
    void v24[3] = v13;
    sub_100031A90((uint64_t)v24);
    sub_10002AD04();
    sub_100031ABC((uint64_t)v24);
    sub_100031AE8(0, &qword_10003C978);
    uint64_t v14 = sub_1000328F0();
    unint64_t v16 = v15;
    swift_bridgeObjectRelease();
    uint64_t v22 = sub_100005B78(v14, v16, aBlock);
    sub_100032AF0();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "CloudWorker Telemetry: %s", v10, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    uint64_t v2 = v21;
    swift_slowDealloc();
  }
  else
  {

    swift_release_n();
  }
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, enum case for CoreAnalyticsEvents.cloudWorkerTelemetry(_:), v2);
  sub_100032820();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  NSString v17 = sub_100032920();
  swift_bridgeObjectRelease();
  aBlock[4] = (uint64_t)sub_100031A70;
  aBlock[5] = a1;
  aBlock[0] = (uint64_t)_NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_10002BC24;
  aBlock[3] = (uint64_t)&unk_10003B7E0;
  os_log_type_t v18 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  AnalyticsSendEventLazy();
  _Block_release(v18);
}

id sub_100027FF8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  NSString v5 = sub_100032920();
  swift_bridgeObjectRelease();
  id v6 = [v4 initWithContainerIdentifier:v5 environment:a3];

  return v6;
}

id sub_100028074()
{
  id v0 = [objc_allocWithZone((Class)CKOperationGroup) init];
  NSString v1 = sub_100032920();
  [v0 setName:v1];

  return v0;
}

void *sub_1000280E4(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    sub_10002E9C0(0, v1, 0);
    uint64_t v3 = *(void *)(sub_1000327E0() - 8);
    uint64_t v4 = a1 + ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
    uint64_t v5 = *(void *)(v3 + 72);
    do
    {
      uint64_t v6 = sub_1000327D0();
      uint64_t v8 = v7;
      unint64_t v10 = _swiftEmptyArrayStorage[2];
      unint64_t v9 = _swiftEmptyArrayStorage[3];
      if (v10 >= v9 >> 1) {
        sub_10002E9C0(v9 > 1, v10 + 1, 1);
      }
      _swiftEmptyArrayStorage[2] = v10 + 1;
      long long v11 = &_swiftEmptyArrayStorage[2 * v10];
      v11[4] = v6;
      v11[5] = v8;
      v4 += v5;
      --v1;
    }
    while (v1);
  }
  return _swiftEmptyArrayStorage;
}

uint64_t sub_10002821C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  return _swift_task_switch(sub_100028240, 0, 0);
}

uint64_t sub_100028240()
{
  uint64_t v1 = v0[4];
  uint64_t v2 = (void *)swift_task_alloc();
  v0[5] = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_1000282FC;
  uint64_t v3 = v0[3];
  return CKDatabase.records(matching:inZoneWith:desiredKeys:resultsLimit:)(v3, v1, 0, CKQueryOperationMaximumResults);
}

uint64_t sub_1000282FC(uint64_t a1, uint64_t a2)
{
  uint64_t v10 = *v3;
  uint64_t v6 = swift_task_dealloc();
  uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t))(v10 + 8);
  if (!v2)
  {
    uint64_t v6 = a1;
    uint64_t v7 = a2;
  }
  return v8(v6, v7);
}

uint64_t sub_10002840C(uint64_t a1, uint64_t a2, int *a3)
{
  *(void *)(v3 + 16) = a1;
  uint64_t v7 = (uint64_t (*)(uint64_t))((char *)a3 + *a3);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v3 + 24) = v5;
  *uint64_t v5 = v3;
  v5[1] = sub_1000284E8;
  return v7(a2);
}

uint64_t sub_1000284E8(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *v3;
  uint64_t v7 = *v3;
  swift_task_dealloc();
  if (!v2)
  {
    uint64_t v8 = *(void **)(v6 + 16);
    void *v8 = a1;
    v8[1] = a2;
  }
  unint64_t v9 = *(uint64_t (**)(void))(v7 + 8);
  return v9();
}

uint64_t sub_100028604(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a3 + 16))
  {
    sub_100032D00();
    sub_100032940();
    Swift::Int v6 = sub_100032D20();
    uint64_t v7 = -1 << *(unsigned char *)(a3 + 32);
    unint64_t v8 = v6 & ~v7;
    uint64_t v9 = a3 + 56;
    if ((*(void *)(a3 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8))
    {
      uint64_t v10 = *(void *)(a3 + 48);
      uint64_t v11 = (void *)(v10 + 16 * v8);
      BOOL v12 = *v11 == a1 && v11[1] == a2;
      if (v12 || (sub_100032C70() & 1) != 0) {
        return 1;
      }
      uint64_t v14 = ~v7;
      unint64_t v15 = (v8 + 1) & v14;
      if ((*(void *)(v9 + ((v15 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v15))
      {
        while (1)
        {
          unint64_t v16 = (void *)(v10 + 16 * v15);
          BOOL v17 = *v16 == a1 && v16[1] == a2;
          if (v17 || (sub_100032C70() & 1) != 0) {
            break;
          }
          uint64_t result = 0;
          unint64_t v15 = (v15 + 1) & v14;
          if (((*(void *)(v9 + ((v15 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v15) & 1) == 0) {
            return result;
          }
        }
        return 1;
      }
    }
  }
  return 0;
}

uint64_t sub_10002873C(uint64_t a1)
{
  unint64_t v3 = *v1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    unint64_t v3 = sub_10002BEE4(0, *(void *)(v3 + 16) + 1, 1, v3, &qword_10003C8F0, type metadata accessor for TaskRecord, type metadata accessor for TaskRecord);
  }
  unint64_t v5 = *(void *)(v3 + 16);
  unint64_t v4 = *(void *)(v3 + 24);
  if (v5 >= v4 >> 1) {
    unint64_t v3 = sub_10002BEE4(v4 > 1, v5 + 1, 1, v3, &qword_10003C8F0, type metadata accessor for TaskRecord, type metadata accessor for TaskRecord);
  }
  *(void *)(v3 + 16) = v5 + 1;
  uint64_t v6 = *(void *)(type metadata accessor for TaskRecord(0) - 8);
  uint64_t result = sub_100031468(a1, v3+ ((*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80))+ *(void *)(v6 + 72) * v5, type metadata accessor for TaskRecord);
  *uint64_t v1 = v3;
  return result;
}

uint64_t sub_1000288AC(double a1)
{
  unint64_t v3 = *v1;
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  if ((result & 1) == 0)
  {
    uint64_t result = (uint64_t)sub_10002C164(0, v3[2] + 1, 1, v3);
    unint64_t v3 = (void *)result;
  }
  unint64_t v6 = v3[2];
  unint64_t v5 = v3[3];
  if (v6 >= v5 >> 1)
  {
    uint64_t result = (uint64_t)sub_10002C164((void *)(v5 > 1), v6 + 1, 1, v3);
    unint64_t v3 = (void *)result;
  }
  v3[2] = v6 + 1;
  *(double *)&v3[v6 + 4] = a1;
  *uint64_t v1 = v3;
  return result;
}

uint64_t sub_10002894C(uint64_t a1)
{
  unint64_t v3 = *v1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    unint64_t v3 = sub_10002BEE4(0, *(void *)(v3 + 16) + 1, 1, v3, &qword_10003C910, type metadata accessor for TaskParametersRecord, type metadata accessor for TaskParametersRecord);
  }
  unint64_t v5 = *(void *)(v3 + 16);
  unint64_t v4 = *(void *)(v3 + 24);
  if (v5 >= v4 >> 1) {
    unint64_t v3 = sub_10002BEE4(v4 > 1, v5 + 1, 1, v3, &qword_10003C910, type metadata accessor for TaskParametersRecord, type metadata accessor for TaskParametersRecord);
  }
  *(void *)(v3 + 16) = v5 + 1;
  uint64_t v6 = *(void *)(type metadata accessor for TaskParametersRecord(0) - 8);
  uint64_t result = sub_100031468(a1, v3+ ((*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80))+ *(void *)(v6 + 72) * v5, type metadata accessor for TaskParametersRecord);
  *uint64_t v1 = v3;
  return result;
}

uint64_t sub_100028ABC(uint64_t a1)
{
  unint64_t v3 = *v1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    unint64_t v3 = sub_10002BEE4(0, *(void *)(v3 + 16) + 1, 1, v3, &qword_10003C918, type metadata accessor for TaskPayloadRecord, type metadata accessor for TaskPayloadRecord);
  }
  unint64_t v5 = *(void *)(v3 + 16);
  unint64_t v4 = *(void *)(v3 + 24);
  if (v5 >= v4 >> 1) {
    unint64_t v3 = sub_10002BEE4(v4 > 1, v5 + 1, 1, v3, &qword_10003C918, type metadata accessor for TaskPayloadRecord, type metadata accessor for TaskPayloadRecord);
  }
  *(void *)(v3 + 16) = v5 + 1;
  uint64_t v6 = *(void *)(type metadata accessor for TaskPayloadRecord(0) - 8);
  uint64_t result = sub_100031468(a1, v3+ ((*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80))+ *(void *)(v6 + 72) * v5, type metadata accessor for TaskPayloadRecord);
  *uint64_t v1 = v3;
  return result;
}

BOOL sub_100028C2C()
{
  return (sub_100032910() & 1) == 0;
}

uint64_t sub_100028CB8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = enum case for URL.DirectoryHint.inferFromPath(_:);
  uint64_t v3 = sub_1000324E0();
  unint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 104);

  return v4(a1, v2, v3);
}

uint64_t sub_100028D2C()
{
  uint64_t v0 = swift_bridgeObjectRetain();
  uint64_t v1 = sub_10002C7B4(v0);
  swift_bridgeObjectRelease();
  uint64_t v3 = v1;
  sub_10002CA2C((uint64_t *)&v3, sub_10002F8BC, sub_10002CAB0);
  return (uint64_t)v3;
}

uint64_t sub_100028DB8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  return _swift_task_switch(sub_100028DDC, 0, 0);
}

uint64_t sub_100028DDC()
{
  uint64_t v1 = v0[4];
  uint64_t v2 = (void *)swift_task_alloc();
  v0[5] = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_100031D94;
  uint64_t v3 = v0[3];
  return CKDatabase.records(matching:inZoneWith:desiredKeys:resultsLimit:)(v3, v1, 0, CKQueryOperationMaximumResults);
}

uint64_t sub_100028E98@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  swift_beginAccess();
  uint64_t v4 = *(void *)(a1 + 16);
  swift_bridgeObjectRetain_n();
  uint64_t v5 = sub_10002C7B4(v4);
  swift_bridgeObjectRelease();
  uint64_t v7 = v5;
  sub_10002CA2C((uint64_t *)&v7, sub_10002F8BC, sub_10002CAB0);
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v7;
  return result;
}

uint64_t sub_100028F5C@<X0>(uint64_t (*a1)(char *)@<X0>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v24 = a1;
  uint64_t v6 = sub_100032700();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *(void *)(a2 + 16);
  if (v10)
  {
    uint64_t v20 = v7;
    uint64_t v21 = a3;
    BOOL v12 = *(void (**)(char *, uint64_t, uint64_t))(v7 + 16);
    uint64_t v11 = v7 + 16;
    uint64_t v13 = a2 + ((*(unsigned __int8 *)(v11 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 64));
    uint64_t v14 = a2;
    unint64_t v15 = (void (**)(char *, uint64_t))(v11 - 8);
    uint64_t v16 = *(void *)(v11 + 56);
    uint64_t v22 = v14;
    uint64_t v23 = v12;
    swift_bridgeObjectRetain();
    while (1)
    {
      v23(v9, v13, v6);
      char v17 = v24(v9);
      if (v3)
      {
        (*v15)(v9, v6);
        return swift_bridgeObjectRelease();
      }
      if (v17) {
        break;
      }
      (*v15)(v9, v6);
      v13 += v16;
      if (!--v10)
      {
        swift_bridgeObjectRelease();
        uint64_t v18 = 1;
        uint64_t v7 = v20;
        a3 = v21;
        return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v7 + 56))(a3, v18, 1, v6);
      }
    }
    swift_bridgeObjectRelease();
    uint64_t v7 = v20;
    a3 = v21;
    (*(void (**)(uint64_t, char *, uint64_t))(v20 + 32))(v21, v9, v6);
    uint64_t v18 = 0;
  }
  else
  {
    uint64_t v18 = 1;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v7 + 56))(a3, v18, 1, v6);
}

uint64_t sub_100029150(uint64_t a1, void *a2)
{
  if (sub_1000326E0() == *a2 && v3 == a2[1]) {
    char v5 = 1;
  }
  else {
    char v5 = sub_100032C70();
  }
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_1000291C0(uint64_t a1, uint64_t a2)
{
  uint64_t v125 = sub_100032540();
  uint64_t v123 = *(uint8_t **)(v125 - 8);
  __chkstk_darwin(v125);
  uint64_t v122 = (char *)v117 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100032660();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin(v4);
  uint64_t v120 = (char *)v117 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)v117 - v8;
  uint64_t v10 = sub_1000328A0();
  uint64_t v131 = *(void *)(v10 - 8);
  uint64_t v11 = __chkstk_darwin(v10);
  uint64_t v118 = (char *)v117 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __chkstk_darwin(v11);
  unint64_t v15 = (char *)v117 - v14;
  uint64_t v16 = __chkstk_darwin(v13);
  uint64_t v126 = (char *)v117 - v17;
  uint64_t v18 = __chkstk_darwin(v16);
  uint64_t v124 = (char *)v117 - v19;
  uint64_t v20 = __chkstk_darwin(v18);
  uint64_t v119 = (char *)v117 - v21;
  uint64_t v22 = __chkstk_darwin(v20);
  uint64_t v24 = (char *)v117 - v23;
  __chkstk_darwin(v22);
  uint64_t v26 = (char *)v117 - v25;
  sub_100032510(0);
  sub_1000328B0();
  uint64_t v121 = a2;
  sub_100032510(0);
  sub_1000328B0();
  sub_100032640();
  uint64_t v27 = sub_100032620();
  if (!v27)
  {
    if (qword_10003C398 != -1) {
      swift_once();
    }
    uint64_t v47 = sub_100032880();
    sub_1000056A8(v47, (uint64_t)qword_10003C9C0);
    uint64_t v48 = v131;
    (*(void (**)(char *, char *, uint64_t))(v131 + 16))(v15, v26, v10);
    uint64_t v49 = sub_100032860();
    os_log_type_t v50 = sub_100032AA0();
    if (os_log_type_enabled(v49, v50))
    {
      uint64_t v51 = (uint8_t *)swift_slowAlloc();
      uint64_t v133 = (void *)swift_slowAlloc();
      uint64_t v129 = v26;
      uint64_t v130 = v24;
      *(_DWORD *)uint64_t v51 = 136315138;
      sub_10002FED0(&qword_10003C920, (void (*)(uint64_t))&type metadata accessor for FilePath);
      uint64_t v52 = sub_100032C60();
      uint64_t v132 = sub_100005B78(v52, v53, (uint64_t *)&v133);
      sub_100032AF0();
      swift_bridgeObjectRelease();
      uint64_t v54 = *(void (**)(char *, uint64_t))(v48 + 8);
      v54(v15, v10);
      _os_log_impl((void *)&_mh_execute_header, v49, v50, "Failed at reading archive: %s", v51, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      v54(v130, v10);
      v54(v129, v10);
    }
    else
    {

      id v66 = *(void (**)(char *, uint64_t))(v48 + 8);
      v66(v15, v10);
      v66(v24, v10);
      v66(v26, v10);
    }
    return 0;
  }
  uint64_t v28 = v27;
  uint64_t v129 = v26;
  uint64_t v130 = v24;
  uint64_t v127 = v10;
  uint64_t v133 = _swiftEmptyArrayStorage;
  uint64_t v29 = sub_10002FED0(&qword_10003C928, (void (*)(uint64_t))&type metadata accessor for ArchiveFlags);
  uint64_t v30 = sub_100005644(&qword_10003C930);
  sub_100031A24(&qword_10003C938, &qword_10003C930);
  sub_100032B10();
  uint64_t v128 = v28;
  uint64_t v31 = sub_100032610();
  os_log_type_t v32 = *(void (**)(char *, uint64_t))(v5 + 8);
  v32(v9, v4);
  if (!v31)
  {
    if (qword_10003C398 != -1) {
      swift_once();
    }
    uint64_t v55 = sub_100032880();
    sub_1000056A8(v55, (uint64_t)qword_10003C9C0);
    uint64_t v56 = v131;
    uint64_t v57 = v126;
    uint64_t v58 = v127;
    uint64_t v59 = v129;
    (*(void (**)(char *, char *, uint64_t))(v131 + 16))(v126, v129, v127);
    uint64_t v60 = sub_100032860();
    os_log_type_t v61 = sub_100032AA0();
    if (os_log_type_enabled(v60, v61))
    {
      uint64_t v62 = (uint8_t *)swift_slowAlloc();
      uint64_t v133 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v62 = 136315138;
      sub_10002FED0(&qword_10003C920, (void (*)(uint64_t))&type metadata accessor for FilePath);
      uint64_t v63 = sub_100032C60();
      uint64_t v132 = sub_100005B78(v63, v64, (uint64_t *)&v133);
      uint64_t v59 = v129;
      sub_100032AF0();
      swift_bridgeObjectRelease();
      uint64_t v65 = *(void (**)(char *, uint64_t))(v56 + 8);
      v65(v57, v58);
      _os_log_impl((void *)&_mh_execute_header, v60, v61, "Failed at decompressing archive: %s", v62, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      uint64_t v65 = *(void (**)(char *, uint64_t))(v56 + 8);
      v65(v57, v58);
    }

    sub_100032630();
    swift_release();
    v65(v130, v58);
    uint64_t v77 = v59;
    goto LABEL_45;
  }
  uint64_t v33 = v5;
  uint64_t v34 = sub_1000326B0();
  uint64_t v133 = _swiftEmptyArrayStorage;
  v117[2] = v30;
  v117[3] = v29;
  uint64_t v126 = (char *)v32;
  sub_100032B10();
  v117[1] = v34;
  uint64_t v35 = sub_100032670();
  ((void (*)(char *, uint64_t))v126)(v9, v4);
  if (!v35)
  {
    if (qword_10003C398 != -1) {
      swift_once();
    }
    uint64_t v67 = sub_100032880();
    sub_1000056A8(v67, (uint64_t)qword_10003C9C0);
    uint64_t v68 = v131;
    uint64_t v69 = v124;
    uint64_t v70 = v127;
    (*(void (**)(char *, char *, uint64_t))(v131 + 16))(v124, v129, v127);
    uint64_t v71 = sub_100032860();
    os_log_type_t v72 = sub_100032AA0();
    if (os_log_type_enabled(v71, v72))
    {
      id v73 = (uint8_t *)swift_slowAlloc();
      uint64_t v133 = (void *)swift_slowAlloc();
      *(_DWORD *)id v73 = 136315138;
      uint64_t v126 = (char *)(v73 + 4);
      sub_10002FED0(&qword_10003C920, (void (*)(uint64_t))&type metadata accessor for FilePath);
      uint64_t v74 = sub_100032C60();
      uint64_t v132 = sub_100005B78(v74, v75, (uint64_t *)&v133);
      sub_100032AF0();
      swift_bridgeObjectRelease();
      uint64_t v76 = *(void (**)(char *, uint64_t))(v68 + 8);
      v76(v69, v70);
      _os_log_impl((void *)&_mh_execute_header, v71, v72, "Failed at decoding archive: %s", v73, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      uint64_t v76 = *(void (**)(char *, uint64_t))(v68 + 8);
      v76(v69, v70);
    }

    uint64_t v78 = v130;
    sub_100032630();
    swift_release();
    sub_100032630();
    swift_release();
    uint64_t v79 = v78;
    goto LABEL_42;
  }
  v117[0] = v33;
  uint64_t v124 = (char *)v35;
  v117[4] = v31;
  uint64_t v36 = self;
  id v37 = [v36 defaultManager];
  sub_100032890();
  NSString v38 = sub_100032920();
  swift_bridgeObjectRelease();
  unsigned __int8 v39 = [v37 fileExistsAtPath:v38];

  if ((v39 & 1) == 0)
  {
    id v40 = [v36 defaultManager];
    sub_100032890();
    NSString v41 = sub_100032920();
    swift_bridgeObjectRelease();
    uint64_t v133 = 0;
    unsigned int v42 = [v40 createDirectoryAtPath:v41 withIntermediateDirectories:1 attributes:0 error:&v133];

    if (v42)
    {
      uint64_t v43 = v133;
      goto LABEL_7;
    }
    uint64_t v89 = v133;
    uint64_t v90 = sub_1000324D0();

    swift_willThrow();
    if (qword_10003C398 != -1) {
      swift_once();
    }
    uint64_t v91 = sub_100032880();
    sub_1000056A8(v91, (uint64_t)qword_10003C9C0);
    uint64_t v92 = v131;
    uint64_t v93 = v118;
    uint64_t v58 = v127;
    (*(void (**)(char *, char *, uint64_t))(v131 + 16))(v118, v130, v127);
    uint64_t v94 = sub_100032860();
    os_log_type_t v95 = sub_100032AA0();
    if (os_log_type_enabled(v94, v95))
    {
      uint64_t v96 = swift_slowAlloc();
      uint64_t v126 = (char *)v90;
      uint64_t v97 = (uint8_t *)v96;
      uint64_t v133 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v97 = 136315138;
      sub_10002FED0(&qword_10003C920, (void (*)(uint64_t))&type metadata accessor for FilePath);
      uint64_t v98 = sub_100032C60();
      uint64_t v132 = sub_100005B78(v98, v99, (uint64_t *)&v133);
      sub_100032AF0();
      swift_bridgeObjectRelease();
      uint64_t v65 = *(void (**)(char *, uint64_t))(v92 + 8);
      v65(v93, v58);
      _os_log_impl((void *)&_mh_execute_header, v94, v95, "Unable to create destination directory: %s", v97, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      uint64_t v65 = *(void (**)(char *, uint64_t))(v92 + 8);
      v65(v93, v58);
    }
    swift_errorRelease();

    uint64_t v116 = v129;
    sub_100032690();
    swift_release();
    sub_100032630();
    swift_release();
    sub_100032630();
    swift_release();
    v65(v130, v58);
    uint64_t v77 = v116;
LABEL_45:
    v65(v77, v58);
    return 0;
  }
LABEL_7:
  sub_100005644(&qword_10003C940);
  uint64_t v44 = (_OWORD *)swift_allocObject();
  v44[1] = xmmword_100033B90;
  sub_100032650();
  uint64_t v133 = v44;
  sub_100032B10();
  uint64_t v45 = sub_100032680();
  ((void (*)(char *, uint64_t))v126)(v9, v4);
  if (!v45)
  {
    if (qword_10003C398 != -1) {
      swift_once();
    }
    uint64_t v80 = sub_100032880();
    sub_1000056A8(v80, (uint64_t)qword_10003C9C0);
    uint64_t v81 = v130;
    uint64_t v82 = v131;
    id v83 = v119;
    uint64_t v70 = v127;
    (*(void (**)(char *, char *, uint64_t))(v131 + 16))(v119, v130, v127);
    uint64_t v84 = sub_100032860();
    os_log_type_t v85 = sub_100032AA0();
    if (os_log_type_enabled(v84, v85))
    {
      uint64_t v86 = (uint8_t *)swift_slowAlloc();
      uint64_t v133 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v86 = 136315138;
      sub_10002FED0(&qword_10003C920, (void (*)(uint64_t))&type metadata accessor for FilePath);
      uint64_t v87 = sub_100032C60();
      uint64_t v132 = sub_100005B78(v87, v88, (uint64_t *)&v133);
      uint64_t v81 = v130;
      sub_100032AF0();
      swift_bridgeObjectRelease();
      uint64_t v76 = *(void (**)(char *, uint64_t))(v82 + 8);
      v76(v83, v70);
      _os_log_impl((void *)&_mh_execute_header, v84, v85, "Failed at creating extractStream: %s", v86, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      uint64_t v76 = *(void (**)(char *, uint64_t))(v82 + 8);
      v76(v83, v70);
    }

    sub_100032690();
    swift_release();
    sub_100032630();
    swift_release();
    sub_100032630();
    swift_release();
    uint64_t v79 = v81;
LABEL_42:
    v76(v79, v70);
    v76(v129, v70);
    return 0;
  }
  uint64_t v133 = _swiftEmptyArrayStorage;
  unint64_t v46 = v120;
  sub_100032B10();
  sub_1000326A0();
  ((void (*)(char *, uint64_t))v126)(v46, v4);
  uint64_t v100 = v125;
  uint64_t v102 = v122;
  uint64_t v101 = v123;
  if (qword_10003C398 != -1) {
    swift_once();
  }
  uint64_t v103 = sub_100032880();
  sub_1000056A8(v103, (uint64_t)qword_10003C9C0);
  (*((void (**)(char *, uint64_t, uint64_t))v101 + 2))(v102, v121, v100);
  uint64_t v104 = sub_100032860();
  os_log_type_t v105 = sub_100032A80();
  if (os_log_type_enabled(v104, v105))
  {
    uint64_t v106 = (uint8_t *)swift_slowAlloc();
    uint64_t v107 = (void *)swift_slowAlloc();
    uint64_t v126 = (char *)v45;
    uint64_t v133 = v107;
    *(_DWORD *)uint64_t v106 = 136315138;
    uint64_t v123 = v106 + 4;
    sub_10002FED0(&qword_10003C948, (void (*)(uint64_t))&type metadata accessor for URL);
    uint64_t v108 = sub_100032C60();
    uint64_t v132 = sub_100005B78(v108, v109, (uint64_t *)&v133);
    sub_100032AF0();
    swift_bridgeObjectRelease();
    (*((void (**)(char *, uint64_t))v101 + 1))(v102, v125);
    _os_log_impl((void *)&_mh_execute_header, v104, v105, "Decompression completed: %s", v106, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    (*((void (**)(char *, uint64_t))v101 + 1))(v102, v100);
  }

  uint64_t v110 = v129;
  uint64_t v111 = v130;
  sub_100032690();
  swift_release();
  sub_100032690();
  uint64_t v112 = v131;
  swift_release();
  sub_100032630();
  swift_release();
  sub_100032630();
  swift_release();
  uint64_t v113 = *(void (**)(char *, uint64_t))(v112 + 8);
  uint64_t v114 = v127;
  v113(v111, v127);
  v113(v110, v114);
  return 1;
}

uint64_t sub_10002A864(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_100031B58;
  return MLHostExtension.shouldRun(context:)(a1, a2, a3);
}

uint64_t sub_10002A914(uint64_t a1)
{
  uint64_t v4 = *v1;
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_10002A9B0;
  return sub_100009DB0(a1, v4);
}

uint64_t sub_10002A9B0(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

uint64_t sub_10002AAAC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  unint64_t v15 = (void *)swift_task_alloc();
  *(void *)(v7 + 16) = v15;
  *unint64_t v15 = v7;
  v15[1] = sub_10002AB90;
  return MLHostExtension.loadConfig<A>(context:)(a1, a2, a6, a3, a7, a4, a5);
}

uint64_t sub_10002AB90()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_10002AC84(uint64_t a1)
{
  unint64_t v2 = sub_10002BB1C();

  return MLHostExtension.configuration.getter(a1, v2);
}

uint64_t sub_10002ACD0@<X0>(uint64_t *a1@<X8>)
{
  sub_100032720();
  uint64_t result = sub_100032710();
  *a1 = result;
  return result;
}

unint64_t sub_10002AD04()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_1000327A0();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v63 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, enum case for BucketInterval.hour(_:), v2);
  sub_100032790();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  unint64_t v6 = sub_10002B390((uint64_t)_swiftEmptyArrayStorage);
  Class isa = sub_100032A40().super.super.isa;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  unint64_t v64 = v6;
  sub_10002F398((uint64_t)isa, 0xD000000000000013, 0x80000001000341C0, isUniquelyReferenced_nonNull_native);
  unint64_t v9 = v64;
  swift_bridgeObjectRelease();
  Class v10 = sub_100032A40().super.super.isa;
  char v11 = swift_isUniquelyReferenced_nonNull_native();
  unint64_t v64 = v9;
  sub_10002F398((uint64_t)v10, 0xD00000000000001ALL, 0x80000001000341E0, v11);
  unint64_t v12 = v64;
  swift_bridgeObjectRelease();
  Class v13 = sub_100032A40().super.super.isa;
  char v14 = swift_isUniquelyReferenced_nonNull_native();
  unint64_t v64 = v12;
  sub_10002F398((uint64_t)v13, 0xD00000000000001ALL, 0x8000000100034200, v14);
  unint64_t v15 = v64;
  swift_bridgeObjectRelease();
  Class v16 = sub_100032A40().super.super.isa;
  char v17 = swift_isUniquelyReferenced_nonNull_native();
  unint64_t v64 = v15;
  sub_10002F398((uint64_t)v16, 0xD000000000000024, 0x8000000100034220, v17);
  unint64_t v18 = v64;
  swift_bridgeObjectRelease();
  Class v19 = sub_100032A40().super.super.isa;
  char v20 = swift_isUniquelyReferenced_nonNull_native();
  unint64_t v64 = v18;
  sub_10002F398((uint64_t)v19, 0xD00000000000002ALL, 0x8000000100034250, v20);
  unint64_t v21 = v64;
  swift_bridgeObjectRelease();
  Class v22 = sub_100032A40().super.super.isa;
  char v23 = swift_isUniquelyReferenced_nonNull_native();
  unint64_t v64 = v21;
  sub_10002F398((uint64_t)v22, 0xD000000000000018, 0x8000000100034280, v23);
  unint64_t v24 = v64;
  swift_bridgeObjectRelease();
  Class v25 = sub_100032A40().super.super.isa;
  char v26 = swift_isUniquelyReferenced_nonNull_native();
  unint64_t v64 = v24;
  sub_10002F398((uint64_t)v25, 0xD00000000000001FLL, 0x80000001000342A0, v26);
  unint64_t v27 = v64;
  swift_bridgeObjectRelease();
  Class v28 = sub_100032A40().super.super.isa;
  char v29 = swift_isUniquelyReferenced_nonNull_native();
  unint64_t v64 = v27;
  sub_10002F398((uint64_t)v28, 0xD00000000000001FLL, 0x80000001000342C0, v29);
  unint64_t v30 = v64;
  swift_bridgeObjectRelease();
  Class v31 = sub_100032A40().super.super.isa;
  char v32 = swift_isUniquelyReferenced_nonNull_native();
  unint64_t v64 = v30;
  sub_10002F398((uint64_t)v31, 0xD00000000000001ALL, 0x80000001000342E0, v32);
  unint64_t v33 = v64;
  swift_bridgeObjectRelease();
  Class v34 = sub_100032A40().super.super.isa;
  char v35 = swift_isUniquelyReferenced_nonNull_native();
  unint64_t v64 = v33;
  sub_10002F398((uint64_t)v34, 0xD00000000000001ALL, 0x8000000100034300, v35);
  unint64_t v36 = v64;
  swift_bridgeObjectRelease();
  Class v37 = sub_100032A40().super.super.isa;
  char v38 = swift_isUniquelyReferenced_nonNull_native();
  unint64_t v64 = v36;
  sub_10002F398((uint64_t)v37, 0xD00000000000001ALL, 0x8000000100034320, v38);
  unint64_t v39 = v64;
  swift_bridgeObjectRelease();
  Class v40 = sub_100032A10().super.super.isa;
  char v41 = swift_isUniquelyReferenced_nonNull_native();
  unint64_t v64 = v39;
  sub_10002F398((uint64_t)v40, 0xD00000000000001BLL, 0x8000000100034340, v41);
  unint64_t v42 = v64;
  swift_bridgeObjectRelease();
  uint64_t v43 = *(void *)(v1 + 96);
  sub_10002B4AC(v43);
  if ((v44 & 1) == 0)
  {
    Class v45 = sub_100032A10().super.super.isa;
    char v46 = swift_isUniquelyReferenced_nonNull_native();
    unint64_t v64 = v42;
    sub_10002F398((uint64_t)v45, 0xD000000000000012, 0x80000001000343F0, v46);
    unint64_t v47 = v64;
    swift_bridgeObjectRelease();
    Class v48 = sub_100032A10().super.super.isa;
    char v49 = swift_isUniquelyReferenced_nonNull_native();
    unint64_t v64 = v47;
    sub_10002F398((uint64_t)v48, 0xD00000000000001BLL, 0x8000000100034410, v49);
    unint64_t v42 = v64;
    swift_bridgeObjectRelease();
  }
  sub_10002B50C(v43);
  if ((v50 & 1) == 0)
  {
    Class v51 = sub_100032A10().super.super.isa;
    char v52 = swift_isUniquelyReferenced_nonNull_native();
    unint64_t v64 = v42;
    sub_10002F398((uint64_t)v51, 0xD000000000000014, 0x80000001000343B0, v52);
    unint64_t v53 = v64;
    swift_bridgeObjectRelease();
    Class v54 = sub_100032A10().super.super.isa;
    char v55 = swift_isUniquelyReferenced_nonNull_native();
    unint64_t v64 = v53;
    sub_10002F398((uint64_t)v54, 0xD00000000000001DLL, 0x80000001000343D0, v55);
    unint64_t v42 = v64;
    swift_bridgeObjectRelease();
  }
  sub_10002B600(v43);
  if ((v56 & 1) == 0)
  {
    Class v57 = sub_100032A10().super.super.isa;
    char v58 = swift_isUniquelyReferenced_nonNull_native();
    unint64_t v64 = v42;
    sub_10002F398((uint64_t)v57, 0xD00000000000001FLL, 0x8000000100034360, v58);
    unint64_t v59 = v64;
    swift_bridgeObjectRelease();
    Class v60 = sub_100032A10().super.super.isa;
    char v61 = swift_isUniquelyReferenced_nonNull_native();
    unint64_t v64 = v59;
    sub_10002F398((uint64_t)v60, 0xD000000000000028, 0x8000000100034380, v61);
    unint64_t v42 = v64;
    swift_bridgeObjectRelease();
  }
  return v42;
}

unint64_t sub_10002B390(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100005644(&qword_10003C980);
  uint64_t v2 = (void *)sub_100032BC0();
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
    uint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    id v8 = v7;
    unint64_t result = sub_1000061D0(v5, v6);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    char v11 = (uint64_t *)(v2[6] + 16 * result);
    *char v11 = v5;
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

uint64_t sub_10002B4AC(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return 0;
  }
  double v2 = *(double *)(a1 + 32) + 0.0;
  if (v1 != 1)
  {
    uint64_t v3 = 0;
    do
    {
      double v2 = v2 + (*(double *)(a1 + 40 + 8 * v3) - v2) / (double)(v3 + 2);
      ++v3;
    }
    while (v1 - 1 != v3);
  }
  return *(void *)&v2;
}

uint64_t sub_10002B50C(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 16);
  if (!v1)
  {
    double v7 = 0.0;
    return *(void *)&v7;
  }
  uint64_t v9 = a1;
  swift_bridgeObjectRetain();
  sub_10002CA2C(&v9, sub_10002F8D0, sub_10002D19C);
  unint64_t v2 = v1 >> 1;
  unint64_t v3 = *(void *)(v9 + 16);
  if (v1)
  {
    if (v1 >> 1 < v3)
    {
      double v7 = *(double *)(v9 + 8 * v2 + 32);
      swift_release();
      return *(void *)&v7;
    }
    goto LABEL_11;
  }
  if (v1 >> 1 >= v3)
  {
    __break(1u);
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  if (v1 >= 2)
  {
    uint64_t v4 = v9 + 8 * v2;
    double v6 = *(double *)(v4 + 24);
    double v5 = *(double *)(v4 + 32);
    swift_release();
    double v7 = (v5 + v6) * 0.5;
    return *(void *)&v7;
  }
LABEL_12:
  __break(1u);
  uint64_t result = swift_release();
  __break(1u);
  return result;
}

uint64_t sub_10002B600(uint64_t result)
{
  unint64_t v1 = *(void *)(result + 16);
  if (v1 < 2) {
    return 0;
  }
  uint64_t v2 = 0;
  double v3 = *(double *)(result + 32) + 0.0;
  unint64_t v4 = v1 - 1;
  while (v4 != v2)
  {
    double v3 = v3 + (*(double *)(result + 40 + 8 * v2) - v3) / (double)(v2 + 2);
    if (v4 == ++v2)
    {
      if (v1 < 4)
      {
        uint64_t v5 = 0;
        double v6 = 0.0;
        goto LABEL_11;
      }
      uint64_t v5 = v1 & 0x7FFFFFFFFFFFFFFCLL;
      float64x2_t v7 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&v3, 0);
      id v8 = (float64x2_t *)(result + 48);
      double v6 = 0.0;
      uint64_t v9 = v1 & 0x7FFFFFFFFFFFFFFCLL;
      do
      {
        float64x2_t v10 = vsubq_f64(v8[-1], v7);
        float64x2_t v11 = vsubq_f64(*v8, v7);
        float64x2_t v12 = vmulq_f64(v10, v10);
        float64x2_t v13 = vmulq_f64(v11, v11);
        double v6 = v6 + v12.f64[0] + v12.f64[1] + v13.f64[0] + v13.f64[1];
        v8 += 2;
        v9 -= 4;
      }
      while (v9);
      if (v1 != v5)
      {
LABEL_11:
        unint64_t v14 = v1 - v5;
        unint64_t v15 = (double *)(result + 8 * v5 + 32);
        do
        {
          double v16 = *v15++;
          double v6 = v6 + (v16 - v3) * (v16 - v3);
          --v14;
        }
        while (v14);
      }
      return sqrt(v6 / (double)(uint64_t)v1);
    }
  }
  __break(1u);
  return result;
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

unint64_t sub_10002B760()
{
  unint64_t result = qword_10003C7A0;
  if (!qword_10003C7A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003C7A0);
  }
  return result;
}

unint64_t sub_10002B7B8()
{
  unint64_t result = qword_10003C7A8;
  if (!qword_10003C7A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003C7A8);
  }
  return result;
}

unint64_t sub_10002B810()
{
  unint64_t result = qword_10003C7B0;
  if (!qword_10003C7B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003C7B0);
  }
  return result;
}

unint64_t sub_10002B868()
{
  unint64_t result = qword_10003C7B8;
  if (!qword_10003C7B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003C7B8);
  }
  return result;
}

unint64_t sub_10002B8C0()
{
  unint64_t result = qword_10003C7C0[0];
  if (!qword_10003C7C0[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_10003C7C0);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for CloudError(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for CloudError(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x10002BA70);
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

unsigned char *sub_10002BA98(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for CloudError()
{
  return &type metadata for CloudError;
}

ValueMetadata *type metadata accessor for CloudWorker()
{
  return &type metadata for CloudWorker;
}

uint64_t sub_10002BAC8()
{
  return *(void *)(swift_getOpaqueTypeConformance2() + 8);
}

unint64_t sub_10002BB1C()
{
  unint64_t result = qword_10003C7E0;
  if (!qword_10003C7E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_10003C7E0);
  }
  return result;
}

uint64_t sub_10002BB70()
{
  return _swift_deallocObject(v0, 24, 7);
}

unint64_t sub_10002BBA8(uint64_t a1)
{
  swift_beginAccess();
  long long v2 = *(_OWORD *)(a1 + 96);
  v7[4] = *(_OWORD *)(a1 + 80);
  v7[5] = v2;
  uint64_t v8 = *(void *)(a1 + 112);
  long long v3 = *(_OWORD *)(a1 + 32);
  v7[0] = *(_OWORD *)(a1 + 16);
  v7[1] = v3;
  long long v4 = *(_OWORD *)(a1 + 64);
  v7[2] = *(_OWORD *)(a1 + 48);
  v7[3] = v4;
  sub_100031A90((uint64_t)v7);
  unint64_t v5 = sub_10002AD04();
  sub_100031ABC((uint64_t)v7);
  return v5;
}

Class sub_10002BC24(uint64_t a1)
{
  unint64_t v1 = *(uint64_t (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  uint64_t v3 = v1(v2);
  swift_release();
  if (v3)
  {
    sub_100031AE8(0, &qword_10003C978);
    v4.super.Class isa = sub_1000328D0().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v4.super.Class isa = 0;
  }

  return v4.super.isa;
}

uint64_t sub_10002BCC0(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = *(void *)(result + 16);
  if (v4)
  {
    uint64_t v8 = swift_bridgeObjectRetain() + 40;
    do
    {
      uint64_t v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(v8 - 8);
      swift_retain();
      v9(a2, a3, a4);
      swift_release();
      v8 += 16;
      --v4;
    }
    while (v4);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_10002BD58(void (*a1)(uint64_t), uint64_t a2, uint64_t (*a3)(void), unint64_t *a4, void (*a5)(uint64_t))
{
  uint64_t v8 = a3(0);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = __chkstk_darwin(v8);
  float64x2_t v12 = (char *)&v15 - v11;
  a1(v10);
  sub_10002FED0(a4, a5);
  uint64_t v13 = sub_100032C60();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);
  return v13;
}

uint64_t sub_10002BE70(void (*a1)(uint64_t *__return_ptr), uint64_t a2, void (*a3)(void))
{
  a1(&v6);
  a3(0);
  uint64_t v4 = sub_100032980();
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_10002BEE4(char a1, int64_t a2, char a3, unint64_t a4, uint64_t *a5, uint64_t (*a6)(void), uint64_t (*a7)(void))
{
  if (a3)
  {
    unint64_t v11 = *(void *)(a4 + 24);
    uint64_t v12 = v11 >> 1;
    if ((uint64_t)(v11 >> 1) < a2)
    {
      if (v12 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_29;
      }
      uint64_t v12 = v11 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v11 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        uint64_t v12 = a2;
      }
    }
  }
  else
  {
    uint64_t v12 = a2;
  }
  uint64_t v13 = *(void *)(a4 + 16);
  if (v12 <= v13) {
    uint64_t v14 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v14 = v12;
  }
  if (!v14)
  {
    unint64_t v18 = _swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  sub_100005644(a5);
  uint64_t v15 = *(void *)(a6(0) - 8);
  uint64_t v16 = *(void *)(v15 + 72);
  unint64_t v17 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
  unint64_t v18 = (void *)swift_allocObject();
  size_t v19 = j__malloc_size(v18);
  if (!v16 || (v19 - v17 == 0x8000000000000000 ? (BOOL v20 = v16 == -1) : (BOOL v20 = 0), v20))
  {
LABEL_29:
    uint64_t result = sub_100032B80();
    __break(1u);
    return result;
  }
  v18[2] = v13;
  v18[3] = 2 * ((uint64_t)(v19 - v17) / v16);
LABEL_19:
  uint64_t v21 = *(void *)(a6(0) - 8);
  unint64_t v22 = (*(unsigned __int8 *)(v21 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v21 + 80);
  unint64_t v23 = (unint64_t)v18 + v22;
  if (a1)
  {
    if ((unint64_t)v18 < a4 || v23 >= a4 + v22 + *(void *)(v21 + 72) * v13)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v18 != (void *)a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_1000318C8(0, v13, v23, a4, a7);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v18;
}

void *sub_10002C164(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = a4[3];
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
    uint64_t v8 = a4[2];
    if (v7 <= v8) {
      uint64_t v9 = a4[2];
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      sub_100005644(&qword_10003C8F8);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = j__malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 25;
      }
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 3);
      uint64_t v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = _swiftEmptyArrayStorage;
      uint64_t v13 = &_swiftEmptyArrayStorage[4];
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[v8 + 4]) {
          memmove(v13, a4 + 4, 8 * v8);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_10002FFCC(0, v8, (char *)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_10002C274(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a4();
  sub_100005B78(v6, v7, a3);
  uint64_t v8 = *a1 + 8;
  sub_100032AF0();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_10002C2EC()
{
  return _swift_deallocObject(v0, 17, 7);
}

unsigned char **sub_10002C2FC(unsigned char **result)
{
  uint64_t v2 = *result;
  *uint64_t v2 = *(unsigned char *)(v1 + 16);
  *uint64_t result = v2 + 1;
  return result;
}

uint64_t sub_10002C310()
{
  return _swift_deallocObject(v0, 17, 7);
}

void sub_10002C320(uint64_t *a1, void **a2, uint64_t a3, uint64_t (*a4)(void))
{
  uint64_t v6 = (void *)a4();
  uint64_t v7 = *a1 + 8;
  sub_100032AF0();
  *a1 = v7;
  uint64_t v8 = *a2;
  if (*a2)
  {
    void *v8 = v6;
    *a2 = v8 + 1;
  }
  else
  {
  }
}

void sub_10002C3D8(uint64_t *a1, void **a2, uint64_t a3)
{
  sub_10002C320(a1, a2, a3, *(uint64_t (**)(void))(v3 + 16));
}

uint64_t sub_10002C3E0()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_10002C3F0()
{
  return *(unsigned __int8 *)(v0 + 16);
}

uint64_t sub_10002C3F8()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_10002C408()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_10002C418()
{
  return (*(uint64_t (**)(void))(v0 + 16))() & 1;
}

uint64_t sub_10002C444()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_10002C46C@<X0>(_DWORD *a1@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(v1 + 16))();
  *a1 = result;
  return result;
}

uint64_t sub_10002C49C(uint64_t *a1)
{
  (*(void (**)(uint64_t *__return_ptr))(v1 + 16))(&v5);
  uint64_t v3 = *a1 + 4;
  uint64_t result = sub_100032AF0();
  *a1 = v3;
  return result;
}

uint64_t sub_10002C4FC()
{
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10002C534()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_10002C564()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_10002C574()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_10002C584()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_10002C5AC(uint64_t *a1, uint64_t a2, uint64_t *a3)
{
  return sub_10002C274(a1, a2, a3, *(uint64_t (**)(void))(v3 + 16));
}

uint64_t sub_10002C5B4()
{
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 120, 7);
}

void **sub_10002C5EC(void **result)
{
  uint64_t v1 = *result;
  *uint64_t v1 = 0x4122750000000000;
  *uint64_t result = v1 + 1;
  return result;
}

uint64_t sub_10002C604(Swift::Int *a1, Swift::Int a2, Swift::Int a3)
{
  uint64_t v7 = *v3;
  sub_100032D00();
  swift_bridgeObjectRetain();
  sub_100032940();
  Swift::Int v8 = sub_100032D20();
  uint64_t v9 = -1 << *(unsigned char *)(v7 + 32);
  unint64_t v10 = v8 & ~v9;
  if ((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10))
  {
    uint64_t v11 = *(void *)(v7 + 48);
    uint64_t v12 = (void *)(v11 + 16 * v10);
    BOOL v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_100032C70() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v14 = (Swift::Int *)(*(void *)(*v3 + 48) + 16 * v10);
      Swift::Int v15 = v14[1];
      *a1 = *v14;
      a1[1] = v15;
      swift_bridgeObjectRetain();
      return 0;
    }
    uint64_t v17 = ~v9;
    while (1)
    {
      unint64_t v10 = (v10 + 1) & v17;
      if (((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) == 0) {
        break;
      }
      unint64_t v18 = (void *)(v11 + 16 * v10);
      BOOL v19 = *v18 == a2 && v18[1] == a3;
      if (v19 || (sub_100032C70() & 1) != 0) {
        goto LABEL_7;
      }
    }
  }
  swift_bridgeObjectRelease();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v21 = *v3;
  *uint64_t v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_10002EEEC(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *uint64_t v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

void *sub_10002C7B4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return _swiftEmptyArrayStorage;
  }
  sub_100005644(&qword_10003C950);
  uint64_t v3 = (void *)swift_allocObject();
  int64_t v4 = j__malloc_size(v3);
  uint64_t v5 = v4 - 32;
  if (v4 < 32) {
    uint64_t v5 = v4 - 17;
  }
  v3[2] = v1;
  v3[3] = 2 * (v5 >> 4);
  uint64_t v6 = sub_10002F6BC((uint64_t)&v8, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  sub_100031A68();
  if (v6 != v1)
  {
    __break(1u);
    return _swiftEmptyArrayStorage;
  }
  return v3;
}

uint64_t sub_10002C89C(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *v2;
  sub_100032D00();
  swift_bridgeObjectRetain();
  sub_100032940();
  Swift::Int v6 = sub_100032D20();
  uint64_t v7 = -1 << *(unsigned char *)(v5 + 32);
  unint64_t v8 = v6 & ~v7;
  if (((*(void *)(v5 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8) & 1) == 0)
  {
LABEL_18:
    swift_bridgeObjectRelease();
    return 0;
  }
  uint64_t v9 = *(void *)(v5 + 48);
  unint64_t v10 = (void *)(v9 + 16 * v8);
  BOOL v11 = *v10 == a1 && v10[1] == a2;
  if (!v11 && (sub_100032C70() & 1) == 0)
  {
    uint64_t v15 = ~v7;
    do
    {
      unint64_t v8 = (v8 + 1) & v15;
      if (((*(void *)(v5 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8) & 1) == 0) {
        goto LABEL_18;
      }
      uint64_t v16 = (void *)(v9 + 16 * v8);
      BOOL v17 = *v16 == a1 && v16[1] == a2;
    }
    while (!v17 && (sub_100032C70() & 1) == 0);
  }
  swift_bridgeObjectRelease();
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v13 = *v2;
  uint64_t v19 = *v2;
  *uint64_t v2 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_10002E094();
    uint64_t v13 = v19;
  }
  uint64_t v14 = *(void *)(*(void *)(v13 + 48) + 16 * v8);
  sub_10002E7D8(v8);
  *uint64_t v2 = v19;
  swift_bridgeObjectRelease();
  return v14;
}

uint64_t sub_10002CA2C(uint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t (*a3)(void *))
{
  uint64_t v6 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v6 = a2(v6);
  }
  uint64_t v7 = *(void *)(v6 + 16);
  v9[0] = v6 + 32;
  v9[1] = v7;
  uint64_t result = a3(v9);
  *a1 = v6;
  return result;
}

Swift::Int sub_10002CAB0(uint64_t *a1)
{
  Swift::Int v3 = a1[1];
  Swift::Int result = sub_100032C50(v3);
  if (result >= v3)
  {
    if (v3 < 0) {
      goto LABEL_152;
    }
    if (v3) {
      return sub_10002D830(0, v3, 1, a1);
    }
    return result;
  }
  if (v3 >= 0) {
    uint64_t v5 = v3;
  }
  else {
    uint64_t v5 = v3 + 1;
  }
  if (v3 < -1) {
    goto LABEL_160;
  }
  Swift::Int v105 = result;
  uint64_t v102 = a1;
  if (v3 < 2)
  {
    unint64_t v8 = _swiftEmptyArrayStorage;
    __dst = (char *)&_swiftEmptyArrayStorage[4];
    if (v3 != 1)
    {
      unint64_t v12 = _swiftEmptyArrayStorage[2];
      BOOL v11 = (char *)_swiftEmptyArrayStorage;
LABEL_118:
      uint64_t v94 = v11;
      uint64_t v104 = v8;
      if (v12 >= 2)
      {
        uint64_t v95 = *v102;
        do
        {
          unint64_t v96 = v12 - 2;
          if (v12 < 2) {
            goto LABEL_147;
          }
          if (!v95) {
            goto LABEL_159;
          }
          uint64_t v97 = v94;
          uint64_t v98 = *(void *)&v94[16 * v96 + 32];
          uint64_t v99 = *(void *)&v94[16 * v12 + 24];
          sub_10002D900((char *)(v95 + 16 * v98), (char *)(v95 + 16 * *(void *)&v94[16 * v12 + 16]), v95 + 16 * v99, __dst);
          if (v1) {
            break;
          }
          if (v99 < v98) {
            goto LABEL_148;
          }
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            uint64_t v97 = sub_10002E080((uint64_t)v97);
          }
          if (v96 >= *((void *)v97 + 2)) {
            goto LABEL_149;
          }
          uint64_t v100 = &v97[16 * v96 + 32];
          *(void *)uint64_t v100 = v98;
          *((void *)v100 + 1) = v99;
          unint64_t v101 = *((void *)v97 + 2);
          if (v12 > v101) {
            goto LABEL_150;
          }
          memmove(&v97[16 * v12 + 16], &v97[16 * v12 + 32], 16 * (v101 - v12));
          uint64_t v94 = v97;
          *((void *)v97 + 2) = v101 - 1;
          unint64_t v12 = v101 - 1;
        }
        while (v101 > 2);
      }
LABEL_115:
      swift_bridgeObjectRelease();
      v104[2] = 0;
      return swift_bridgeObjectRelease();
    }
    uint64_t v104 = _swiftEmptyArrayStorage;
  }
  else
  {
    uint64_t v6 = v5 >> 1;
    uint64_t v7 = sub_1000329A0();
    *(void *)(v7 + 16) = v6;
    uint64_t v104 = (void *)v7;
    __dst = (char *)(v7 + 32);
  }
  Swift::Int v9 = 0;
  uint64_t v10 = *a1;
  uint64_t v103 = v10 + 8;
  BOOL v11 = (char *)_swiftEmptyArrayStorage;
  Swift::Int v106 = v3;
  while (1)
  {
    Swift::Int v13 = v9++;
    if (v9 >= v3) {
      goto LABEL_46;
    }
    uint64_t v14 = (uint64_t *)(v10 + 16 * v9);
    uint64_t v15 = *v14;
    uint64_t v16 = v14[1];
    BOOL v17 = (void *)(v10 + 16 * v13);
    if (v15 == *v17 && v16 == v17[1])
    {
      Swift::Int v20 = v13 + 2;
      if (v13 + 2 >= v3) {
        goto LABEL_45;
      }
      int v19 = 0;
    }
    else
    {
      int v19 = sub_100032C70();
      Swift::Int v20 = v13 + 2;
      if (v13 + 2 >= v3) {
        goto LABEL_36;
      }
    }
    uint64_t v21 = (void *)(v103 + 16 * v20);
    do
    {
      unint64_t v23 = (void *)(v10 + 16 * v9);
      if (*(v21 - 1) == *v23 && *v21 == v23[1])
      {
        if (v19) {
          goto LABEL_37;
        }
      }
      else if ((v19 ^ sub_100032C70()))
      {
        goto LABEL_36;
      }
      v21 += 2;
      Swift::Int v22 = v20 + 1;
      Swift::Int v9 = v20;
      Swift::Int v20 = v22;
    }
    while (v22 < v3);
    Swift::Int v20 = v22;
LABEL_36:
    Swift::Int v9 = v20;
    if (v19)
    {
LABEL_37:
      if (v20 < v13) {
        goto LABEL_155;
      }
      if (v13 < v20)
      {
        uint64_t v25 = 16 * v20;
        uint64_t v26 = 16 * v13;
        Swift::Int v27 = v20;
        Swift::Int v28 = v13;
        do
        {
          if (v28 != --v27)
          {
            if (!v10) {
              goto LABEL_158;
            }
            uint64_t v29 = v10 + v25;
            uint64_t v30 = *(void *)(v10 + v26);
            uint64_t v31 = *(void *)(v10 + v26 + 8);
            *(_OWORD *)(v10 + v26) = *(_OWORD *)(v10 + v25 - 16);
            *(void *)(v29 - 16) = v30;
            *(void *)(v29 - 8) = v31;
          }
          ++v28;
          v25 -= 16;
          v26 += 16;
        }
        while (v28 < v27);
      }
LABEL_45:
      Swift::Int v9 = v20;
    }
LABEL_46:
    if (v9 < v3)
    {
      if (__OFSUB__(v9, v13)) {
        goto LABEL_151;
      }
      if (v9 - v13 < v105) {
        break;
      }
    }
LABEL_67:
    if (v9 < v13) {
      goto LABEL_146;
    }
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      BOOL v11 = sub_10002DE0C(0, *((void *)v11 + 2) + 1, 1, v11);
    }
    unint64_t v41 = *((void *)v11 + 2);
    unint64_t v40 = *((void *)v11 + 3);
    unint64_t v12 = v41 + 1;
    if (v41 >= v40 >> 1) {
      BOOL v11 = sub_10002DE0C((char *)(v40 > 1), v41 + 1, 1, v11);
    }
    *((void *)v11 + 2) = v12;
    unint64_t v42 = v11 + 32;
    uint64_t v43 = &v11[16 * v41 + 32];
    *(void *)uint64_t v43 = v13;
    *((void *)v43 + 1) = v9;
    if (v41)
    {
      Swift::Int v107 = v9;
      while (1)
      {
        unint64_t v44 = v12 - 1;
        if (v12 >= 4)
        {
          char v49 = &v42[16 * v12];
          uint64_t v50 = *((void *)v49 - 8);
          uint64_t v51 = *((void *)v49 - 7);
          BOOL v55 = __OFSUB__(v51, v50);
          uint64_t v52 = v51 - v50;
          if (v55) {
            goto LABEL_135;
          }
          uint64_t v54 = *((void *)v49 - 6);
          uint64_t v53 = *((void *)v49 - 5);
          BOOL v55 = __OFSUB__(v53, v54);
          uint64_t v47 = v53 - v54;
          char v48 = v55;
          if (v55) {
            goto LABEL_136;
          }
          unint64_t v56 = v12 - 2;
          Class v57 = &v42[16 * v12 - 32];
          uint64_t v59 = *(void *)v57;
          uint64_t v58 = *((void *)v57 + 1);
          BOOL v55 = __OFSUB__(v58, v59);
          uint64_t v60 = v58 - v59;
          if (v55) {
            goto LABEL_138;
          }
          BOOL v55 = __OFADD__(v47, v60);
          uint64_t v61 = v47 + v60;
          if (v55) {
            goto LABEL_141;
          }
          if (v61 >= v52)
          {
            uint64_t v79 = &v42[16 * v44];
            uint64_t v81 = *(void *)v79;
            uint64_t v80 = *((void *)v79 + 1);
            BOOL v55 = __OFSUB__(v80, v81);
            uint64_t v82 = v80 - v81;
            if (v55) {
              goto LABEL_145;
            }
            BOOL v72 = v47 < v82;
            goto LABEL_105;
          }
        }
        else
        {
          if (v12 != 3)
          {
            uint64_t v73 = *((void *)v11 + 4);
            uint64_t v74 = *((void *)v11 + 5);
            BOOL v55 = __OFSUB__(v74, v73);
            uint64_t v66 = v74 - v73;
            char v67 = v55;
            goto LABEL_99;
          }
          uint64_t v46 = *((void *)v11 + 4);
          uint64_t v45 = *((void *)v11 + 5);
          BOOL v55 = __OFSUB__(v45, v46);
          uint64_t v47 = v45 - v46;
          char v48 = v55;
        }
        if (v48) {
          goto LABEL_137;
        }
        unint64_t v56 = v12 - 2;
        uint64_t v62 = &v42[16 * v12 - 32];
        uint64_t v64 = *(void *)v62;
        uint64_t v63 = *((void *)v62 + 1);
        BOOL v65 = __OFSUB__(v63, v64);
        uint64_t v66 = v63 - v64;
        char v67 = v65;
        if (v65) {
          goto LABEL_140;
        }
        uint64_t v68 = &v42[16 * v44];
        uint64_t v70 = *(void *)v68;
        uint64_t v69 = *((void *)v68 + 1);
        BOOL v55 = __OFSUB__(v69, v70);
        uint64_t v71 = v69 - v70;
        if (v55) {
          goto LABEL_143;
        }
        if (__OFADD__(v66, v71)) {
          goto LABEL_144;
        }
        if (v66 + v71 >= v47)
        {
          BOOL v72 = v47 < v71;
LABEL_105:
          if (v72) {
            unint64_t v44 = v56;
          }
          goto LABEL_107;
        }
LABEL_99:
        if (v67) {
          goto LABEL_139;
        }
        unint64_t v75 = &v42[16 * v44];
        uint64_t v77 = *(void *)v75;
        uint64_t v76 = *((void *)v75 + 1);
        BOOL v55 = __OFSUB__(v76, v77);
        uint64_t v78 = v76 - v77;
        if (v55) {
          goto LABEL_142;
        }
        if (v78 < v66) {
          goto LABEL_15;
        }
LABEL_107:
        unint64_t v83 = v44 - 1;
        if (v44 - 1 >= v12)
        {
          __break(1u);
LABEL_132:
          __break(1u);
LABEL_133:
          __break(1u);
LABEL_134:
          __break(1u);
LABEL_135:
          __break(1u);
LABEL_136:
          __break(1u);
LABEL_137:
          __break(1u);
LABEL_138:
          __break(1u);
LABEL_139:
          __break(1u);
LABEL_140:
          __break(1u);
LABEL_141:
          __break(1u);
LABEL_142:
          __break(1u);
LABEL_143:
          __break(1u);
LABEL_144:
          __break(1u);
LABEL_145:
          __break(1u);
LABEL_146:
          __break(1u);
LABEL_147:
          __break(1u);
LABEL_148:
          __break(1u);
LABEL_149:
          __break(1u);
LABEL_150:
          __break(1u);
LABEL_151:
          __break(1u);
LABEL_152:
          __break(1u);
LABEL_153:
          __break(1u);
          goto LABEL_154;
        }
        uint64_t v84 = v10;
        if (!v10) {
          goto LABEL_157;
        }
        os_log_type_t v85 = v11;
        uint64_t v86 = &v42[16 * v83];
        uint64_t v87 = *(void *)v86;
        unint64_t v88 = v42;
        unint64_t v89 = v44;
        uint64_t v90 = &v42[16 * v44];
        uint64_t v91 = *((void *)v90 + 1);
        uint64_t v92 = v84;
        sub_10002D900((char *)(v84 + 16 * *(void *)v86), (char *)(v84 + 16 * *(void *)v90), v84 + 16 * v91, __dst);
        if (v1) {
          goto LABEL_115;
        }
        if (v91 < v87) {
          goto LABEL_132;
        }
        if (v89 > *((void *)v85 + 2)) {
          goto LABEL_133;
        }
        *(void *)uint64_t v86 = v87;
        *(void *)&v88[16 * v83 + 8] = v91;
        unint64_t v93 = *((void *)v85 + 2);
        if (v89 >= v93) {
          goto LABEL_134;
        }
        BOOL v11 = v85;
        unint64_t v12 = v93 - 1;
        memmove(v90, v90 + 16, 16 * (v93 - 1 - v89));
        unint64_t v42 = v88;
        *((void *)v85 + 2) = v93 - 1;
        uint64_t v10 = v92;
        Swift::Int v9 = v107;
        if (v93 <= 2) {
          goto LABEL_15;
        }
      }
    }
    unint64_t v12 = 1;
LABEL_15:
    Swift::Int v3 = v106;
    if (v9 >= v106)
    {
      unint64_t v8 = v104;
      goto LABEL_118;
    }
  }
  if (__OFADD__(v13, v105)) {
    goto LABEL_153;
  }
  if (v13 + v105 >= v3) {
    Swift::Int v32 = v3;
  }
  else {
    Swift::Int v32 = v13 + v105;
  }
  if (v32 >= v13)
  {
    if (v9 != v32)
    {
      unint64_t v33 = (void *)(v10 + 16 * v9);
      do
      {
        Class v34 = (uint64_t *)(v10 + 16 * v9);
        uint64_t v35 = *v34;
        uint64_t v36 = v34[1];
        Swift::Int v37 = v13;
        char v38 = v33;
        do
        {
          BOOL v39 = v35 == *(v38 - 2) && v36 == *(v38 - 1);
          if (v39 || (sub_100032C70() & 1) == 0) {
            break;
          }
          if (!v10) {
            goto LABEL_156;
          }
          uint64_t v35 = *v38;
          uint64_t v36 = v38[1];
          *(_OWORD *)char v38 = *((_OWORD *)v38 - 1);
          *(v38 - 1) = v36;
          *(v38 - 2) = v35;
          v38 -= 2;
          ++v37;
        }
        while (v9 != v37);
        ++v9;
        v33 += 2;
      }
      while (v9 != v32);
      Swift::Int v9 = v32;
    }
    goto LABEL_67;
  }
LABEL_154:
  __break(1u);
LABEL_155:
  __break(1u);
LABEL_156:
  __break(1u);
LABEL_157:
  __break(1u);
LABEL_158:
  __break(1u);
LABEL_159:
  __break(1u);
LABEL_160:
  Swift::Int result = sub_100032B80();
  __break(1u);
  return result;
}

Swift::Int sub_10002D19C(void *a1)
{
  uint64_t v2 = a1;
  Swift::Int v3 = a1[1];
  Swift::Int result = sub_100032C50(v3);
  if (result >= v3)
  {
    if (v3 < 0) {
      goto LABEL_136;
    }
    if ((unint64_t)v3 >= 2)
    {
      uint64_t v80 = 0;
      uint64_t v81 = *v2;
      for (uint64_t i = 1; i != v3; ++i)
      {
        double v83 = *(double *)(v81 + 8 * i);
        uint64_t v84 = v80;
        do
        {
          uint64_t v85 = v81 + 8 * v84;
          if (v83 >= *(double *)v85) {
            break;
          }
          if (!v81) {
            goto LABEL_140;
          }
          *(void *)(v85 + 8) = *(void *)v85;
          *(double *)(v81 + 8 * v84--) = v83;
        }
        while (v84 != -1);
        ++v80;
      }
    }
    return result;
  }
  if (v3 >= 0) {
    uint64_t v5 = v3;
  }
  else {
    uint64_t v5 = v3 + 1;
  }
  if (v3 < -1) {
    goto LABEL_145;
  }
  Swift::Int v97 = result;
  Swift::Int v98 = v3;
  if (v3 < 2)
  {
    unint64_t v8 = &_swiftEmptyArrayStorage;
    __dst = (double *)((char *)&_swiftEmptyArrayStorage + 32);
    if (v3 != 1)
    {
      unint64_t v12 = *((void *)&_swiftEmptyArrayStorage + 2);
      BOOL v11 = (char *)&_swiftEmptyArrayStorage;
LABEL_102:
      unint64_t v96 = v8;
      if (v12 >= 2)
      {
        uint64_t v86 = *v2;
        do
        {
          unint64_t v87 = v12 - 2;
          if (v12 < 2) {
            goto LABEL_131;
          }
          if (!v86) {
            goto LABEL_144;
          }
          unint64_t v88 = v11;
          unint64_t v89 = v11 + 32;
          uint64_t v90 = *(void *)&v11[16 * v87 + 32];
          uint64_t v91 = *(void *)&v11[16 * v12 + 24];
          sub_10002DB9C((double *)(v86 + 8 * v90), (double *)(v86 + 8 * *(void *)&v89[16 * v12 - 16]), v86 + 8 * v91, __dst);
          if (v1) {
            break;
          }
          if (v91 < v90) {
            goto LABEL_132;
          }
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            unint64_t v88 = sub_10002E080((uint64_t)v88);
          }
          if (v87 >= *((void *)v88 + 2)) {
            goto LABEL_133;
          }
          uint64_t v92 = &v88[16 * v87 + 32];
          *(void *)uint64_t v92 = v90;
          *((void *)v92 + 1) = v91;
          unint64_t v93 = *((void *)v88 + 2);
          if (v12 > v93) {
            goto LABEL_134;
          }
          memmove(&v88[16 * v12 + 16], &v88[16 * v12 + 32], 16 * (v93 - v12));
          BOOL v11 = v88;
          *((void *)v88 + 2) = v93 - 1;
          unint64_t v12 = v93 - 1;
        }
        while (v93 > 2);
      }
LABEL_113:
      swift_bridgeObjectRelease();
      v96[2] = 0;
      return swift_bridgeObjectRelease();
    }
    unint64_t v96 = &_swiftEmptyArrayStorage;
  }
  else
  {
    uint64_t v6 = v5 >> 1;
    uint64_t v7 = sub_1000329A0();
    *(void *)(v7 + 16) = v6;
    Swift::Int v3 = v98;
    unint64_t v96 = (void *)v7;
    __dst = (double *)(v7 + 32);
  }
  Swift::Int v9 = 0;
  uint64_t v10 = *v2;
  uint64_t v94 = v2;
  uint64_t v95 = *v2 - 8;
  BOOL v11 = (char *)&_swiftEmptyArrayStorage;
  uint64_t v99 = *v2;
  while (1)
  {
    Swift::Int v13 = v9++;
    if (v9 < v3)
    {
      double v14 = *(double *)(v10 + 8 * v9);
      double v15 = *(double *)(v10 + 8 * v13);
      Swift::Int v9 = v13 + 2;
      if (v13 + 2 < v3)
      {
        double v16 = v14;
        while (1)
        {
          double v17 = v16;
          double v16 = *(double *)(v10 + 8 * v9);
          if (v14 < v15 == v16 >= v17) {
            break;
          }
          if (v3 == ++v9)
          {
            Swift::Int v9 = v3;
            break;
          }
        }
      }
      if (v14 < v15)
      {
        if (v9 < v13) {
          goto LABEL_137;
        }
        if (v13 < v9)
        {
          unint64_t v18 = (uint64_t *)(v95 + 8 * v9);
          Swift::Int v19 = v9;
          Swift::Int v20 = v13;
          uint64_t v21 = (uint64_t *)(v10 + 8 * v13);
          do
          {
            if (v20 != --v19)
            {
              if (!v10) {
                goto LABEL_143;
              }
              uint64_t v22 = *v21;
              *uint64_t v21 = *v18;
              *unint64_t v18 = v22;
            }
            ++v20;
            --v18;
            ++v21;
          }
          while (v20 < v19);
        }
      }
    }
    if (v9 >= v3) {
      goto LABEL_46;
    }
    if (__OFSUB__(v9, v13)) {
      goto LABEL_135;
    }
    if (v9 - v13 >= v97) {
      goto LABEL_46;
    }
    Swift::Int v23 = v13 + v97;
    if (__OFADD__(v13, v97)) {
      goto LABEL_138;
    }
    if (v23 >= v3) {
      Swift::Int v23 = v3;
    }
    if (v23 < v13) {
      break;
    }
    if (v9 != v23)
    {
      unint64_t v24 = (double *)(v95 + 8 * v9);
      do
      {
        double v25 = *(double *)(v10 + 8 * v9);
        Swift::Int v26 = v13;
        Swift::Int v27 = v24;
        do
        {
          double v28 = *v27;
          if (v25 >= *v27) {
            break;
          }
          if (!v10) {
            goto LABEL_141;
          }
          double *v27 = v25;
          v27[1] = v28;
          --v27;
          ++v26;
        }
        while (v9 != v26);
        ++v9;
        ++v24;
      }
      while (v9 != v23);
      Swift::Int v9 = v23;
    }
LABEL_46:
    if (v9 < v13) {
      goto LABEL_130;
    }
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      BOOL v11 = sub_10002DE0C(0, *((void *)v11 + 2) + 1, 1, v11);
    }
    unint64_t v30 = *((void *)v11 + 2);
    unint64_t v29 = *((void *)v11 + 3);
    unint64_t v12 = v30 + 1;
    uint64_t v10 = v99;
    if (v30 >= v29 >> 1)
    {
      uint64_t v79 = sub_10002DE0C((char *)(v29 > 1), v30 + 1, 1, v11);
      uint64_t v10 = v99;
      BOOL v11 = v79;
    }
    *((void *)v11 + 2) = v12;
    uint64_t v31 = v11 + 32;
    Swift::Int v32 = &v11[16 * v30 + 32];
    *(void *)Swift::Int v32 = v13;
    *((void *)v32 + 1) = v9;
    if (v30)
    {
      while (1)
      {
        unint64_t v33 = v12 - 1;
        if (v12 >= 4)
        {
          char v38 = &v31[16 * v12];
          uint64_t v39 = *((void *)v38 - 8);
          uint64_t v40 = *((void *)v38 - 7);
          BOOL v44 = __OFSUB__(v40, v39);
          uint64_t v41 = v40 - v39;
          if (v44) {
            goto LABEL_119;
          }
          uint64_t v43 = *((void *)v38 - 6);
          uint64_t v42 = *((void *)v38 - 5);
          BOOL v44 = __OFSUB__(v42, v43);
          uint64_t v36 = v42 - v43;
          char v37 = v44;
          if (v44) {
            goto LABEL_120;
          }
          unint64_t v45 = v12 - 2;
          uint64_t v46 = &v31[16 * v12 - 32];
          uint64_t v48 = *(void *)v46;
          uint64_t v47 = *((void *)v46 + 1);
          BOOL v44 = __OFSUB__(v47, v48);
          uint64_t v49 = v47 - v48;
          if (v44) {
            goto LABEL_122;
          }
          BOOL v44 = __OFADD__(v36, v49);
          uint64_t v50 = v36 + v49;
          if (v44) {
            goto LABEL_125;
          }
          if (v50 >= v41)
          {
            uint64_t v68 = &v31[16 * v33];
            uint64_t v70 = *(void *)v68;
            uint64_t v69 = *((void *)v68 + 1);
            BOOL v44 = __OFSUB__(v69, v70);
            uint64_t v71 = v69 - v70;
            if (v44) {
              goto LABEL_129;
            }
            BOOL v61 = v36 < v71;
            goto LABEL_83;
          }
        }
        else
        {
          if (v12 != 3)
          {
            uint64_t v62 = *((void *)v11 + 4);
            uint64_t v63 = *((void *)v11 + 5);
            BOOL v44 = __OFSUB__(v63, v62);
            uint64_t v55 = v63 - v62;
            char v56 = v44;
            goto LABEL_77;
          }
          uint64_t v35 = *((void *)v11 + 4);
          uint64_t v34 = *((void *)v11 + 5);
          BOOL v44 = __OFSUB__(v34, v35);
          uint64_t v36 = v34 - v35;
          char v37 = v44;
        }
        if (v37) {
          goto LABEL_121;
        }
        unint64_t v45 = v12 - 2;
        uint64_t v51 = &v31[16 * v12 - 32];
        uint64_t v53 = *(void *)v51;
        uint64_t v52 = *((void *)v51 + 1);
        BOOL v54 = __OFSUB__(v52, v53);
        uint64_t v55 = v52 - v53;
        char v56 = v54;
        if (v54) {
          goto LABEL_124;
        }
        Class v57 = &v31[16 * v33];
        uint64_t v59 = *(void *)v57;
        uint64_t v58 = *((void *)v57 + 1);
        BOOL v44 = __OFSUB__(v58, v59);
        uint64_t v60 = v58 - v59;
        if (v44) {
          goto LABEL_127;
        }
        if (__OFADD__(v55, v60)) {
          goto LABEL_128;
        }
        if (v55 + v60 >= v36)
        {
          BOOL v61 = v36 < v60;
LABEL_83:
          if (v61) {
            unint64_t v33 = v45;
          }
          goto LABEL_85;
        }
LABEL_77:
        if (v56) {
          goto LABEL_123;
        }
        uint64_t v64 = &v31[16 * v33];
        uint64_t v66 = *(void *)v64;
        uint64_t v65 = *((void *)v64 + 1);
        BOOL v44 = __OFSUB__(v65, v66);
        uint64_t v67 = v65 - v66;
        if (v44) {
          goto LABEL_126;
        }
        if (v67 < v55) {
          goto LABEL_15;
        }
LABEL_85:
        unint64_t v72 = v33 - 1;
        if (v33 - 1 >= v12)
        {
          __break(1u);
LABEL_116:
          __break(1u);
LABEL_117:
          __break(1u);
LABEL_118:
          __break(1u);
LABEL_119:
          __break(1u);
LABEL_120:
          __break(1u);
LABEL_121:
          __break(1u);
LABEL_122:
          __break(1u);
LABEL_123:
          __break(1u);
LABEL_124:
          __break(1u);
LABEL_125:
          __break(1u);
LABEL_126:
          __break(1u);
LABEL_127:
          __break(1u);
LABEL_128:
          __break(1u);
LABEL_129:
          __break(1u);
LABEL_130:
          __break(1u);
LABEL_131:
          __break(1u);
LABEL_132:
          __break(1u);
LABEL_133:
          __break(1u);
LABEL_134:
          __break(1u);
LABEL_135:
          __break(1u);
LABEL_136:
          __break(1u);
LABEL_137:
          __break(1u);
LABEL_138:
          __break(1u);
          goto LABEL_139;
        }
        if (!v10) {
          goto LABEL_142;
        }
        uint64_t v73 = &v31[16 * v72];
        uint64_t v74 = *(void *)v73;
        unint64_t v75 = v31;
        uint64_t v76 = &v31[16 * v33];
        uint64_t v77 = *((void *)v76 + 1);
        sub_10002DB9C((double *)(v10 + 8 * *(void *)v73), (double *)(v10 + 8 * *(void *)v76), v10 + 8 * v77, __dst);
        if (v1) {
          goto LABEL_113;
        }
        if (v77 < v74) {
          goto LABEL_116;
        }
        if (v33 > *((void *)v11 + 2)) {
          goto LABEL_117;
        }
        *(void *)uint64_t v73 = v74;
        *(void *)&v75[16 * v72 + 8] = v77;
        unint64_t v78 = *((void *)v11 + 2);
        if (v33 >= v78) {
          goto LABEL_118;
        }
        unint64_t v12 = v78 - 1;
        memmove(v76, v76 + 16, 16 * (v78 - 1 - v33));
        uint64_t v31 = v75;
        *((void *)v11 + 2) = v78 - 1;
        uint64_t v10 = v99;
        if (v78 <= 2) {
          goto LABEL_15;
        }
      }
    }
    unint64_t v12 = 1;
LABEL_15:
    Swift::Int v3 = v98;
    if (v9 >= v98)
    {
      unint64_t v8 = v96;
      uint64_t v2 = v94;
      goto LABEL_102;
    }
  }
LABEL_139:
  __break(1u);
LABEL_140:
  __break(1u);
LABEL_141:
  __break(1u);
LABEL_142:
  __break(1u);
LABEL_143:
  __break(1u);
LABEL_144:
  __break(1u);
LABEL_145:
  Swift::Int result = sub_100032B80();
  __break(1u);
  return result;
}

uint64_t sub_10002D830(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  if (a3 != a2)
  {
    uint64_t v4 = a3;
    uint64_t v6 = result;
    uint64_t v7 = *a4;
    uint64_t v8 = *a4 + 16 * a3;
LABEL_5:
    Swift::Int v9 = (uint64_t *)(v7 + 16 * v4);
    Swift::Int result = *v9;
    uint64_t v10 = v9[1];
    uint64_t v11 = v6;
    unint64_t v12 = (uint64_t *)v8;
    while (1)
    {
      BOOL v13 = result == *(v12 - 2) && v10 == *(v12 - 1);
      if (v13 || (Swift::Int result = sub_100032C70(), (result & 1) == 0))
      {
LABEL_4:
        ++v4;
        v8 += 16;
        if (v4 == a2) {
          return result;
        }
        goto LABEL_5;
      }
      if (!v7) {
        break;
      }
      Swift::Int result = *v12;
      uint64_t v10 = v12[1];
      *(_OWORD *)unint64_t v12 = *((_OWORD *)v12 - 1);
      *(v12 - 1) = v10;
      *(v12 - 2) = result;
      v12 -= 2;
      if (v4 == ++v11) {
        goto LABEL_4;
      }
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_10002D900(char *__src, char *a2, unint64_t a3, char *__dst)
{
  uint64_t v4 = __dst;
  uint64_t v6 = a2;
  uint64_t v7 = __src;
  int64_t v8 = a2 - __src;
  int64_t v9 = a2 - __src + 15;
  if (a2 - __src >= 0) {
    int64_t v9 = a2 - __src;
  }
  uint64_t v10 = v9 >> 4;
  uint64_t v11 = a3 - (void)a2;
  uint64_t v12 = a3 - (void)a2 + 15;
  if ((uint64_t)(a3 - (void)a2) >= 0) {
    uint64_t v12 = a3 - (void)a2;
  }
  uint64_t v13 = v12 >> 4;
  Swift::Int v27 = __src;
  Swift::Int v26 = __dst;
  if (v10 >= v12 >> 4)
  {
    if (v11 >= -15)
    {
      if (__dst != a2 || &a2[16 * v13] <= __dst) {
        memmove(__dst, a2, 16 * v13);
      }
      double v17 = &v4[16 * v13];
      double v25 = v17;
      Swift::Int v27 = v6;
      if (v7 < v6 && v11 >= 16)
      {
        unint64_t v18 = (char *)(a3 - 16);
        Swift::Int v19 = v6;
        while (1)
        {
          Swift::Int v20 = v18 + 16;
          uint64_t v21 = *((void *)v19 - 2);
          uint64_t v22 = *((void *)v19 - 1);
          v19 -= 16;
          BOOL v23 = *((void *)v17 - 2) == v21 && *((void *)v17 - 1) == v22;
          if (v23 || (sub_100032C70() & 1) == 0)
          {
            double v25 = v17 - 16;
            if (v20 < v17 || v18 >= v17 || v20 != v17) {
              *(_OWORD *)unint64_t v18 = *((_OWORD *)v17 - 1);
            }
            Swift::Int v19 = v6;
            v17 -= 16;
            if (v6 <= v7) {
              goto LABEL_50;
            }
          }
          else
          {
            if (v20 != v6 || v18 >= v6) {
              *(_OWORD *)unint64_t v18 = *(_OWORD *)v19;
            }
            Swift::Int v27 = v19;
            if (v19 <= v7) {
              goto LABEL_50;
            }
          }
          v18 -= 16;
          uint64_t v6 = v19;
          if (v17 <= v4) {
            goto LABEL_50;
          }
        }
      }
      goto LABEL_50;
    }
  }
  else if (v8 >= -15)
  {
    if (__dst != __src || &__src[16 * v10] <= __dst) {
      memmove(__dst, __src, 16 * v10);
    }
    double v14 = &v4[16 * v10];
    double v25 = v14;
    if ((unint64_t)v6 < a3 && v8 >= 16)
    {
      do
      {
        BOOL v15 = *(void *)v6 == *(void *)v4 && *((void *)v6 + 1) == *((void *)v4 + 1);
        if (v15 || (sub_100032C70() & 1) == 0)
        {
          if (v7 != v4) {
            *(_OWORD *)uint64_t v7 = *(_OWORD *)v4;
          }
          v4 += 16;
          Swift::Int v26 = v4;
          double v16 = v6;
        }
        else
        {
          double v16 = v6 + 16;
          if (v7 < v6 || v7 >= v16 || v7 != v6) {
            *(_OWORD *)uint64_t v7 = *(_OWORD *)v6;
          }
        }
        v7 += 16;
        if (v4 >= v14) {
          break;
        }
        uint64_t v6 = v16;
      }
      while ((unint64_t)v16 < a3);
      Swift::Int v27 = v7;
    }
LABEL_50:
    sub_10002DF08((void **)&v27, (const void **)&v26, &v25);
    return 1;
  }
  uint64_t result = sub_100032BD0();
  __break(1u);
  return result;
}

uint64_t sub_10002DB9C(double *__src, double *a2, unint64_t a3, double *__dst)
{
  uint64_t v4 = __dst;
  uint64_t v6 = a2;
  uint64_t v7 = __src;
  int64_t v8 = (char *)a2 - (char *)__src;
  int64_t v9 = (char *)a2 - (char *)__src + 7;
  if ((char *)a2 - (char *)__src >= 0) {
    int64_t v9 = (char *)a2 - (char *)__src;
  }
  uint64_t v10 = v9 >> 3;
  uint64_t v11 = a3 - (void)a2;
  uint64_t v12 = a3 - (void)a2 + 7;
  if ((uint64_t)(a3 - (void)a2) >= 0) {
    uint64_t v12 = a3 - (void)a2;
  }
  uint64_t v13 = v12 >> 3;
  unint64_t v24 = __src;
  BOOL v23 = __dst;
  if (v10 >= v12 >> 3)
  {
    if (v11 >= -7)
    {
      if (__dst != a2 || &a2[v13] <= __dst) {
        memmove(__dst, a2, 8 * v13);
      }
      double v16 = &v4[v13];
      uint64_t v22 = v16;
      unint64_t v24 = v6;
      if (v7 < v6 && v11 >= 8)
      {
        double v17 = (double *)(a3 - 8);
        while (1)
        {
          unint64_t v18 = v17 + 1;
          Swift::Int v19 = v6 - 1;
          double v20 = *(v6 - 1);
          if (*(v16 - 1) >= v20)
          {
            uint64_t v22 = v16 - 1;
            if (v18 < v16 || v17 >= v16 || v18 != v16) {
              double *v17 = *(v16 - 1);
            }
            --v16;
            if (v6 <= v7) {
              goto LABEL_42;
            }
          }
          else
          {
            if (v18 != v6 || v17 >= v6) {
              double *v17 = v20;
            }
            unint64_t v24 = --v6;
            if (v19 <= v7) {
              goto LABEL_42;
            }
          }
          --v17;
          if (v16 <= v4) {
            goto LABEL_42;
          }
        }
      }
      goto LABEL_42;
    }
  }
  else if (v8 >= -7)
  {
    if (__dst != __src || &__src[v10] <= __dst) {
      memmove(__dst, __src, 8 * v10);
    }
    double v14 = &v4[v10];
    uint64_t v22 = v14;
    if ((unint64_t)v6 < a3 && v8 >= 8)
    {
      do
      {
        if (*v6 >= *v4)
        {
          if (v7 != v4) {
            *uint64_t v7 = *v4;
          }
          BOOL v23 = ++v4;
          BOOL v15 = v6;
        }
        else
        {
          BOOL v15 = v6 + 1;
          if (v7 < v6 || v7 >= v15 || v7 != v6) {
            *uint64_t v7 = *v6;
          }
        }
        ++v7;
        if (v4 >= v14) {
          break;
        }
        uint64_t v6 = v15;
      }
      while ((unint64_t)v15 < a3);
      unint64_t v24 = v7;
    }
LABEL_42:
    sub_10002DFC4((void **)&v24, (const void **)&v23, &v22);
    return 1;
  }
  uint64_t result = sub_100032BD0();
  __break(1u);
  return result;
}

char *sub_10002DE0C(char *result, int64_t a2, char a3, char *a4)
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
    sub_100005644(&qword_10003C958);
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
  uint64_t v13 = v10 + 32;
  double v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 16 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_10002DF08(void **a1, const void **a2, void *a3)
{
  Swift::Int v3 = (char *)*a2;
  uint64_t v4 = *a3 - (void)v3;
  uint64_t v5 = v4 + 15;
  if (v4 >= 0) {
    uint64_t v5 = *a3 - (void)v3;
  }
  if (v4 <= -16)
  {
    uint64_t result = (char *)sub_100032BD0();
    __break(1u);
  }
  else
  {
    uint64_t result = (char *)*a1;
    uint64_t v7 = v5 >> 4;
    if (result != v3 || result >= &v3[16 * v7])
    {
      return (char *)memmove(result, v3, 16 * v7);
    }
  }
  return result;
}

char *sub_10002DFC4(void **a1, const void **a2, void *a3)
{
  Swift::Int v3 = (char *)*a2;
  uint64_t v4 = *a3 - (void)v3;
  uint64_t v5 = v4 + 7;
  if (v4 >= 0) {
    uint64_t v5 = *a3 - (void)v3;
  }
  if (v4 <= -8)
  {
    uint64_t result = (char *)sub_100032BD0();
    __break(1u);
  }
  else
  {
    uint64_t result = (char *)*a1;
    uint64_t v7 = v5 >> 3;
    if (result != v3 || result >= &v3[8 * v7])
    {
      return (char *)memmove(result, v3, 8 * v7);
    }
  }
  return result;
}

char *sub_10002E080(uint64_t a1)
{
  return sub_10002DE0C(0, *(void *)(a1 + 16), 0, (char *)a1);
}

void *sub_10002E094()
{
  uint64_t v1 = v0;
  sub_100005644(&qword_10003C908);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_100032B30();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    uint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 56);
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
      goto LABEL_30;
    }
    if (v20 >= v13) {
      goto LABEL_28;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      int64_t v9 = v20 + 1;
      if (v20 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v21 = *(void *)(v6 + 8 * v9);
      if (!v21)
      {
        int64_t v9 = v20 + 2;
        if (v20 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v21 = *(void *)(v6 + 8 * v9);
        if (!v21) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v21 - 1) & v21;
    unint64_t v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    double v17 = (void *)(*(void *)(v2 + 48) + v16);
    uint64_t v18 = v17[1];
    Swift::Int v19 = (void *)(*(void *)(v4 + 48) + v16);
    *Swift::Int v19 = *v17;
    v19[1] = v18;
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v22 = v20 + 3;
  if (v22 >= v13) {
    goto LABEL_28;
  }
  unint64_t v21 = *(void *)(v6 + 8 * v22);
  if (v21)
  {
    int64_t v9 = v22;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v9);
    ++v22;
    if (v21) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_10002E248()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_100005644(&qword_10003C908);
  uint64_t v3 = sub_100032B40();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v6 = v2 + 56;
  if (v5 < 64) {
    uint64_t v7 = ~(-1 << v5);
  }
  else {
    uint64_t v7 = -1;
  }
  unint64_t v8 = v7 & *(void *)(v2 + 56);
  int64_t v29 = (unint64_t)(v5 + 63) >> 6;
  uint64_t v9 = v3 + 56;
  uint64_t result = swift_retain();
  int64_t v11 = 0;
  while (1)
  {
    if (v8)
    {
      unint64_t v14 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v15 = v14 | (v11 << 6);
      goto LABEL_24;
    }
    int64_t v16 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v16 >= v29) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v11;
    if (!v17)
    {
      int64_t v11 = v16 + 1;
      if (v16 + 1 >= v29) {
        goto LABEL_33;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v11);
      if (!v17)
      {
        int64_t v11 = v16 + 2;
        if (v16 + 2 >= v29) {
          goto LABEL_33;
        }
        unint64_t v17 = *(void *)(v6 + 8 * v11);
        if (!v17) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v8 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v11 << 6);
LABEL_24:
    Swift::Int v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v20 = *v19;
    uint64_t v21 = v19[1];
    sub_100032D00();
    swift_bridgeObjectRetain();
    sub_100032940();
    uint64_t result = sub_100032D20();
    uint64_t v22 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v23 = result & ~v22;
    unint64_t v24 = v23 >> 6;
    if (((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6))) != 0)
    {
      unint64_t v12 = __clz(__rbit64((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v22) >> 6;
      do
      {
        if (++v24 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v27 = v24 == v26;
        if (v24 == v26) {
          unint64_t v24 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v9 + 8 * v24);
      }
      while (v28 == -1);
      unint64_t v12 = __clz(__rbit64(~v28)) + (v24 << 6);
    }
    *(void *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
    int64_t v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
    *int64_t v13 = v20;
    v13[1] = v21;
    ++*(void *)(v4 + 16);
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v29)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    uint64_t v1 = v0;
    goto LABEL_35;
  }
  unint64_t v17 = *(void *)(v6 + 8 * v18);
  if (v17)
  {
    int64_t v11 = v18;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v11 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v11 >= v29) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v11);
    ++v18;
    if (v17) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_10002E4F8()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_100005644(&qword_10003C908);
  uint64_t v3 = sub_100032B40();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    unint64_t v30 = (void *)(v2 + 56);
    if (v5 < 64) {
      uint64_t v6 = ~(-1 << v5);
    }
    else {
      uint64_t v6 = -1;
    }
    unint64_t v7 = v6 & *(void *)(v2 + 56);
    int64_t v8 = (unint64_t)(v5 + 63) >> 6;
    uint64_t v9 = v3 + 56;
    uint64_t result = swift_retain();
    int64_t v11 = 0;
    while (1)
    {
      if (v7)
      {
        unint64_t v14 = __clz(__rbit64(v7));
        v7 &= v7 - 1;
        unint64_t v15 = v14 | (v11 << 6);
      }
      else
      {
        int64_t v16 = v11 + 1;
        if (__OFADD__(v11, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v16 >= v8) {
          goto LABEL_33;
        }
        unint64_t v17 = v30[v16];
        ++v11;
        if (!v17)
        {
          int64_t v11 = v16 + 1;
          if (v16 + 1 >= v8) {
            goto LABEL_33;
          }
          unint64_t v17 = v30[v11];
          if (!v17)
          {
            int64_t v11 = v16 + 2;
            if (v16 + 2 >= v8) {
              goto LABEL_33;
            }
            unint64_t v17 = v30[v11];
            if (!v17)
            {
              int64_t v18 = v16 + 3;
              if (v18 >= v8)
              {
LABEL_33:
                swift_release();
                uint64_t v1 = v0;
                uint64_t v29 = 1 << *(unsigned char *)(v2 + 32);
                if (v29 > 63) {
                  bzero(v30, ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *unint64_t v30 = -1 << v29;
                }
                *(void *)(v2 + 16) = 0;
                break;
              }
              unint64_t v17 = v30[v18];
              if (!v17)
              {
                while (1)
                {
                  int64_t v11 = v18 + 1;
                  if (__OFADD__(v18, 1)) {
                    goto LABEL_39;
                  }
                  if (v11 >= v8) {
                    goto LABEL_33;
                  }
                  unint64_t v17 = v30[v11];
                  ++v18;
                  if (v17) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v11 = v18;
            }
          }
        }
LABEL_23:
        unint64_t v7 = (v17 - 1) & v17;
        unint64_t v15 = __clz(__rbit64(v17)) + (v11 << 6);
      }
      Swift::Int v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
      uint64_t v20 = *v19;
      uint64_t v21 = v19[1];
      sub_100032D00();
      sub_100032940();
      uint64_t result = sub_100032D20();
      uint64_t v22 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v23 = result & ~v22;
      unint64_t v24 = v23 >> 6;
      if (((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6))) != 0)
      {
        unint64_t v12 = __clz(__rbit64((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v25 = 0;
        unint64_t v26 = (unint64_t)(63 - v22) >> 6;
        do
        {
          if (++v24 == v26 && (v25 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v27 = v24 == v26;
          if (v24 == v26) {
            unint64_t v24 = 0;
          }
          v25 |= v27;
          uint64_t v28 = *(void *)(v9 + 8 * v24);
        }
        while (v28 == -1);
        unint64_t v12 = __clz(__rbit64(~v28)) + (v24 << 6);
      }
      *(void *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
      int64_t v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
      *int64_t v13 = v20;
      v13[1] = v21;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v1 = v4;
  return result;
}

unint64_t sub_10002E7D8(unint64_t result)
{
  int64_t v2 = result;
  uint64_t v3 = *v1;
  uint64_t v4 = *v1 + 56;
  uint64_t v5 = -1 << *(unsigned char *)(*v1 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(v4 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    swift_retain();
    uint64_t v8 = sub_100032B20();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v9 = (v8 + 1) & v7;
      do
      {
        sub_100032D00();
        swift_bridgeObjectRetain();
        sub_100032940();
        Swift::Int v10 = sub_100032D20();
        swift_bridgeObjectRelease();
        unint64_t v11 = v10 & v7;
        if (v2 >= (uint64_t)v9)
        {
          if (v11 < v9) {
            goto LABEL_5;
          }
        }
        else if (v11 >= v9)
        {
          goto LABEL_11;
        }
        if (v2 >= (uint64_t)v11)
        {
LABEL_11:
          uint64_t v12 = *(void *)(v3 + 48);
          int64_t v13 = (_OWORD *)(v12 + 16 * v2);
          unint64_t v14 = (_OWORD *)(v12 + 16 * v6);
          if (v2 != v6 || (int64_t v2 = v6, v13 >= v14 + 1))
          {
            *int64_t v13 = *v14;
            int64_t v2 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    *(void *)(v4 + (((unint64_t)v2 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << v2) - 1;
    uint64_t result = swift_release();
  }
  else
  {
    *(void *)(v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << result) - 1;
  }
  uint64_t v15 = *(void *)(v3 + 16);
  BOOL v16 = __OFSUB__(v15, 1);
  uint64_t v17 = v15 - 1;
  if (v16)
  {
    __break(1u);
  }
  else
  {
    *(void *)(v3 + 16) = v17;
    ++*(_DWORD *)(v3 + 36);
  }
  return result;
}

uint64_t sub_10002E9A0(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_10002EB4C(a1, a2, a3, (void *)*v3);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_10002E9C0(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_10002E9E0(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_10002E9E0(char a1, int64_t a2, char a3, char *a4)
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
        goto LABEL_32;
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
    sub_100005644(&qword_10003C950);
    Swift::Int v10 = (char *)swift_allocObject();
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
    Swift::Int v10 = (char *)_swiftEmptyArrayStorage;
  }
  int64_t v13 = v10 + 32;
  unint64_t v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[16 * v8] || v13 >= &v14[16 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_100032BD0();
  __break(1u);
  return result;
}

uint64_t sub_10002EB4C(char a1, int64_t a2, char a3, void *a4)
{
  if (a3)
  {
    unint64_t v6 = a4[3];
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_35:
        __break(1u);
        goto LABEL_36;
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
    int64_t v13 = _swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  sub_100005644(&qword_10003C968);
  uint64_t v10 = *(void *)(sub_100032700() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  int64_t v13 = (void *)swift_allocObject();
  size_t v14 = j__malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if (v14 - v12 == 0x8000000000000000 && v11 == -1) {
    goto LABEL_34;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  uint64_t v16 = *(void *)(sub_100032700() - 8);
  unint64_t v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  int64_t v18 = (char *)v13 + v17;
  Swift::Int v19 = (char *)a4 + v17;
  if (a1)
  {
    if (v13 < a4 || v18 >= &v19[*(void *)(v16 + 72) * v8])
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
    goto LABEL_32;
  }
  uint64_t v20 = *(void *)(v16 + 72) * v8;
  uint64_t v21 = &v18[v20];
  unint64_t v22 = (unint64_t)&v19[v20];
  if (v19 >= v21 || (unint64_t)v18 >= v22)
  {
    swift_arrayInitWithCopy();
LABEL_32:
    swift_release();
    return (uint64_t)v13;
  }
LABEL_36:
  uint64_t result = sub_100032BD0();
  __break(1u);
  return result;
}

uint64_t sub_10002ED8C(char a1, int64_t a2, char a3, char *a4)
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
        goto LABEL_32;
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
    sub_100005644(&qword_10003C8F8);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 25;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 3);
  }
  else
  {
    uint64_t v10 = (char *)_swiftEmptyArrayStorage;
  }
  int64_t v13 = v10 + 32;
  size_t v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[8 * v8]) {
      memmove(v13, v14, 8 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[8 * v8] || v13 >= &v14[8 * v8])
  {
    memcpy(v13, v14, 8 * v8);
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_100032BD0();
  __break(1u);
  return result;
}

Swift::Int sub_10002EEEC(Swift::Int result, Swift::Int a2, unint64_t a3, char a4)
{
  uint64_t v5 = v4;
  Swift::Int v8 = result;
  unint64_t v9 = *(void *)(*v4 + 16);
  unint64_t v10 = *(void *)(*v4 + 24);
  if (v10 > v9 && (a4 & 1) != 0) {
    goto LABEL_22;
  }
  if (a4)
  {
    sub_10002E4F8();
  }
  else
  {
    if (v10 > v9)
    {
      uint64_t result = (Swift::Int)sub_10002E094();
      goto LABEL_22;
    }
    sub_10002E248();
  }
  uint64_t v11 = *v4;
  sub_100032D00();
  sub_100032940();
  uint64_t result = sub_100032D20();
  uint64_t v12 = -1 << *(unsigned char *)(v11 + 32);
  a3 = result & ~v12;
  uint64_t v13 = v11 + 56;
  if ((*(void *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3))
  {
    uint64_t v14 = *(void *)(v11 + 48);
    uint64_t v15 = (void *)(v14 + 16 * a3);
    BOOL v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (uint64_t result = sub_100032C70(), (result & 1) != 0))
    {
LABEL_21:
      uint64_t result = sub_100032C80();
      __break(1u);
    }
    else
    {
      uint64_t v17 = ~v12;
      while (1)
      {
        a3 = (a3 + 1) & v17;
        if (((*(void *)(v13 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3) & 1) == 0) {
          break;
        }
        int64_t v18 = (void *)(v14 + 16 * a3);
        if (*v18 != v8 || v18[1] != a2)
        {
          uint64_t result = sub_100032C70();
          if ((result & 1) == 0) {
            continue;
          }
        }
        goto LABEL_21;
      }
    }
  }
LABEL_22:
  uint64_t v20 = *v5;
  *(void *)(*v5 + 8 * (a3 >> 6) + 56) |= 1 << a3;
  uint64_t v21 = (Swift::Int *)(*(void *)(v20 + 48) + 16 * a3);
  *uint64_t v21 = v8;
  v21[1] = a2;
  uint64_t v22 = *(void *)(v20 + 16);
  BOOL v23 = __OFADD__(v22, 1);
  uint64_t v24 = v22 + 1;
  if (v23) {
    __break(1u);
  }
  else {
    *(void *)(v20 + 16) = v24;
  }
  return result;
}

uint64_t sub_10002F088(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_100005644(&qword_10003C980);
  char v38 = a2;
  uint64_t v6 = sub_100032BB0();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v37 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  uint64_t v35 = v2;
  int64_t v36 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v20 = v19 | (v13 << 6);
      goto LABEL_31;
    }
    int64_t v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v36) {
      break;
    }
    uint64_t v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v37 + 8 * v21);
    ++v13;
    if (!v23)
    {
      int64_t v13 = v21 + 1;
      if (v21 + 1 >= v36) {
        goto LABEL_33;
      }
      unint64_t v23 = *(void *)(v37 + 8 * v13);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v36)
        {
LABEL_33:
          swift_release();
          uint64_t v3 = v35;
          if ((v38 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v23 = *(void *)(v37 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v13 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v36) {
              goto LABEL_33;
            }
            unint64_t v23 = *(void *)(v37 + 8 * v13);
            ++v24;
            if (v23) {
              goto LABEL_30;
            }
          }
        }
        int64_t v13 = v24;
      }
    }
LABEL_30:
    unint64_t v10 = (v23 - 1) & v23;
    unint64_t v20 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_31:
    uint64_t v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v20);
    uint64_t v31 = *v29;
    uint64_t v30 = v29[1];
    Swift::Int v32 = *(void **)(*(void *)(v5 + 56) + 8 * v20);
    if ((v38 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      id v33 = v32;
    }
    sub_100032D00();
    sub_100032940();
    uint64_t result = sub_100032D20();
    uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v15 = result & ~v14;
    unint64_t v16 = v15 >> 6;
    if (((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v27 = v16 == v26;
        if (v16 == v26) {
          unint64_t v16 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v11 + 8 * v16);
      }
      while (v28 == -1);
      unint64_t v17 = __clz(__rbit64(~v28)) + (v16 << 6);
    }
    *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    int64_t v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
    *int64_t v18 = v31;
    v18[1] = v30;
    *(void *)(*(void *)(v7 + 56) + 8 * v17) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v35;
  uint64_t v22 = (void *)(v5 + 64);
  if ((v38 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v34 = 1 << *(unsigned char *)(v5 + 32);
  if (v34 >= 64) {
    bzero(v22, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v22 = -1 << v34;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

void sub_10002F398(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = *v4;
  unint64_t v12 = sub_1000061D0(a2, a3);
  uint64_t v13 = *(void *)(v10 + 16);
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v16 = v11;
  uint64_t v17 = *(void *)(v10 + 24);
  if (v17 >= v15 && (a4 & 1) != 0) {
    goto LABEL_7;
  }
  if (v17 >= v15 && (a4 & 1) == 0)
  {
    sub_10002F508();
LABEL_7:
    int64_t v18 = (void *)*v5;
    if (v16)
    {
LABEL_8:
      uint64_t v19 = v18[7];

      *(void *)(v19 + 8 * v12) = a1;
      return;
    }
    goto LABEL_11;
  }
  sub_10002F088(v15, a4 & 1);
  unint64_t v20 = sub_1000061D0(a2, a3);
  if ((v16 & 1) != (v21 & 1))
  {
LABEL_17:
    sub_100032C90();
    __break(1u);
    return;
  }
  unint64_t v12 = v20;
  int64_t v18 = (void *)*v5;
  if (v16) {
    goto LABEL_8;
  }
LABEL_11:
  v18[(v12 >> 6) + 8] |= 1 << v12;
  uint64_t v22 = (uint64_t *)(v18[6] + 16 * v12);
  *uint64_t v22 = a2;
  v22[1] = a3;
  *(void *)(v18[7] + 8 * v12) = a1;
  uint64_t v23 = v18[2];
  BOOL v24 = __OFADD__(v23, 1);
  uint64_t v25 = v23 + 1;
  if (v24)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v18[2] = v25;

  swift_bridgeObjectRetain();
}

id sub_10002F508()
{
  uint64_t v1 = v0;
  sub_100005644(&qword_10003C980);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_100032BA0();
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
    int64_t v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
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
    uint64_t v17 = (void *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v18 = v17[1];
    uint64_t v19 = 8 * v15;
    unint64_t v20 = *(void **)(*(void *)(v2 + 56) + v19);
    char v21 = (void *)(*(void *)(v4 + 48) + v16);
    *char v21 = *v17;
    v21[1] = v18;
    *(void *)(*(void *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    id result = v20;
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v13) {
    goto LABEL_26;
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
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_10002F6BC(uint64_t result, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = (void *)result;
  uint64_t v6 = a4 + 56;
  uint64_t v7 = -1 << *(unsigned char *)(a4 + 32);
  if (-v7 < 64) {
    uint64_t v8 = ~(-1 << -(char)v7);
  }
  else {
    uint64_t v8 = -1;
  }
  unint64_t v9 = v8 & *(void *)(a4 + 56);
  if (!a2)
  {
    int64_t v12 = 0;
    uint64_t v10 = 0;
LABEL_38:
    *uint64_t v5 = a4;
    v5[1] = v6;
    v5[2] = ~v7;
    v5[3] = v12;
    v5[4] = v9;
    return v10;
  }
  uint64_t v10 = a3;
  if (!a3)
  {
    int64_t v12 = 0;
    goto LABEL_38;
  }
  if (a3 < 0)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  uint64_t v11 = a2;
  int64_t v12 = 0;
  uint64_t v13 = 0;
  int64_t v14 = (unint64_t)(63 - v7) >> 6;
  if (!v9) {
    goto LABEL_9;
  }
LABEL_8:
  unint64_t v15 = __clz(__rbit64(v9));
  v9 &= v9 - 1;
  unint64_t v16 = v15 | (v12 << 6);
  while (1)
  {
    ++v13;
    unint64_t v20 = (void *)(*(void *)(a4 + 48) + 16 * v16);
    uint64_t v21 = v20[1];
    *uint64_t v11 = *v20;
    v11[1] = v21;
    if (v13 == v10)
    {
      swift_bridgeObjectRetain();
      goto LABEL_38;
    }
    v11 += 2;
    id result = swift_bridgeObjectRetain();
    if (v9) {
      goto LABEL_8;
    }
LABEL_9:
    int64_t v17 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_40;
    }
    if (v17 >= v14) {
      goto LABEL_33;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    if (!v18) {
      break;
    }
LABEL_18:
    unint64_t v9 = (v18 - 1) & v18;
    unint64_t v16 = __clz(__rbit64(v18)) + (v17 << 6);
    int64_t v12 = v17;
  }
  v12 += 2;
  if (v17 + 1 >= v14)
  {
    unint64_t v9 = 0;
    int64_t v12 = v17;
    goto LABEL_37;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v12);
  if (v18) {
    goto LABEL_14;
  }
  int64_t v19 = v17 + 2;
  if (v17 + 2 >= v14) {
    goto LABEL_33;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18) {
    goto LABEL_17;
  }
  int64_t v12 = v17 + 3;
  if (v17 + 3 >= v14)
  {
    unint64_t v9 = 0;
    int64_t v12 = v17 + 2;
    goto LABEL_37;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v12);
  if (v18)
  {
LABEL_14:
    int64_t v17 = v12;
    goto LABEL_18;
  }
  int64_t v19 = v17 + 4;
  if (v17 + 4 >= v14)
  {
LABEL_33:
    unint64_t v9 = 0;
LABEL_37:
    uint64_t v10 = v13;
    goto LABEL_38;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18)
  {
LABEL_17:
    int64_t v17 = v19;
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v17 = v19 + 1;
    if (__OFADD__(v19, 1)) {
      break;
    }
    if (v17 >= v14)
    {
      unint64_t v9 = 0;
      int64_t v12 = v14 - 1;
      goto LABEL_37;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    ++v19;
    if (v18) {
      goto LABEL_18;
    }
  }
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_10002F8BC(uint64_t a1)
{
  return sub_10002E9E0(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_10002F8D0(uint64_t a1)
{
  return sub_10002ED8C(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_10002F8E4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t result = sub_100032A30();
  uint64_t v8 = result;
  if (v2)
  {
    uint64_t v4 = (Swift::Int *)(a1 + 40);
    do
    {
      Swift::Int v5 = *(v4 - 1);
      Swift::Int v6 = *v4;
      swift_bridgeObjectRetain();
      sub_10002C604(&v7, v5, v6);
      swift_bridgeObjectRelease();
      v4 += 2;
      --v2;
    }
    while (v2);
    return v8;
  }
  return result;
}

uint64_t sub_10002F97C@<X0>(void *a1@<X8>)
{
  *a1 = *(void *)(v1 + 16);
  return swift_bridgeObjectRetain();
}

uint64_t sub_10002F98C()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_10002F99C()
{
  return _swift_deallocObject(v0, 17, 7);
}

unint64_t sub_10002F9AC()
{
  unint64_t result = qword_10003C848;
  if (!qword_10003C848)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003C848);
  }
  return result;
}

unint64_t sub_10002FA00()
{
  unint64_t result = qword_10003C858;
  if (!qword_10003C858)
  {
    sub_100031AE8(255, &qword_10003C850);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003C858);
  }
  return result;
}

uint64_t sub_10002FA68()
{
  return sub_1000312B4((uint64_t (*)(void))&type metadata accessor for Date);
}

uint64_t sub_10002FA80@<X0>(uint64_t a1@<X8>)
{
  return sub_100031104((uint64_t (*)(void))&type metadata accessor for Date, a1);
}

uint64_t sub_10002FA98()
{
  return sub_10002BD58(*(void (**)(uint64_t))(v0 + 16), *(void *)(v0 + 24), (uint64_t (*)(void))&type metadata accessor for Date, &qword_10003C970, (void (*)(uint64_t))&type metadata accessor for Date);
}

uint64_t sub_10002FAF8()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_10002FB08()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_10002FB18()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10002FB50(uint64_t a1)
{
  uint64_t v4 = swift_task_alloc();
  long long v5 = *(_OWORD *)(v1 + 16);
  *(void *)(v2 + 16) = v4;
  *(void *)uint64_t v4 = v2;
  *(void *)(v4 + 8) = sub_10002FC04;
  *(_OWORD *)(v4 + 24) = v5;
  *(void *)(v4 + 16) = a1;
  return _swift_task_switch(sub_100028240, 0, 0);
}

uint64_t sub_10002FC04(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = *v2;
  swift_task_dealloc();
  long long v5 = *(uint64_t (**)(uint64_t, uint64_t))(v7 + 8);
  return v5(a1, a2);
}

uint64_t sub_10002FD10(uint64_t a1, uint64_t a2)
{
  Swift::Int v6 = *(int **)(v2 + 16);
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_100031B5C;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_10003C878 + dword_10003C878);
  return v8(a1, a2, v6);
}

uint64_t sub_10002FDD8()
{
  swift_errorRelease();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10002FE10()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_10002FE20()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_10002FE34()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

unint64_t sub_10002FE5C()
{
  unint64_t result = qword_10003C898;
  if (!qword_10003C898)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003C898);
  }
  return result;
}

uint64_t sub_10002FEB0()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_10002FEC0()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_10002FED0(unint64_t *a1, void (*a2)(uint64_t))
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

id sub_10002FF18(void *a1, char a2)
{
  if (a2) {
    return (id)swift_errorRetain();
  }
  else {
    return a1;
  }
}

uint64_t sub_10002FF24()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_10002FF34()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_10002FF44()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_10002FF54()
{
  return _swift_deallocObject(v0, 17, 7);
}

void sub_10002FF64(void *a1, char a2)
{
  if (a2) {
    swift_errorRelease();
  }
  else {
}
  }

uint64_t sub_10002FF70()
{
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10002FFAC()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_10002FFBC()
{
  return _swift_deallocObject(v0, 17, 7);
}

char *sub_10002FFCC(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    long long v5 = (char *)(a4 + 8 * a1 + 32);
    size_t v6 = 8 * v4;
    uint64_t v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  uint64_t result = (char *)sub_100032BD0();
  __break(1u);
  return result;
}

char *sub_1000300B8(uint64_t a1)
{
  uint64_t v3 = sub_100032850();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = __chkstk_darwin(v3);
  uint64_t v7 = (char *)&v31 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  unint64_t v9 = (char *)&v31 - v8;
  uint64_t v10 = sub_100032700();
  uint64_t v11 = __chkstk_darwin(v10);
  uint64_t v43 = (char *)&v31 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  BOOL v44 = (char *)&v31 - v14;
  uint64_t result = (char *)_swiftEmptyArrayStorage;
  uint64_t v49 = (char *)_swiftEmptyArrayStorage;
  uint64_t v16 = *(void *)(a1 + 16);
  if (v16)
  {
    uint64_t v31 = v1;
    unint64_t v18 = *(void (**)(void, void, void))(v13 + 16);
    uint64_t v17 = v13 + 16;
    char v38 = (void (*)(char *, uint64_t, uint64_t))v18;
    uint64_t v19 = *(void *)(v17 + 56);
    unint64_t v33 = (*(unsigned __int8 *)(v17 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v17 + 64);
    uint64_t v20 = a1 + v33;
    unsigned int v36 = enum case for TaskType.dynamicTask(_:);
    uint64_t v34 = v7;
    uint64_t v35 = (void (**)(char *, void, uint64_t))(v4 + 104);
    Swift::Int v32 = (void (**)(char *, uint64_t))(v17 - 8);
    uint64_t v41 = (void (**)(char *, uint64_t))(v4 + 8);
    uint64_t v42 = (void (**)(char *, char *, uint64_t))(v17 + 16);
    uint64_t v39 = v17;
    uint64_t v40 = v9;
    uint64_t v37 = v19;
    while (1)
    {
      uint64_t v22 = v10;
      v38(v44, v20, v10);
      sub_1000326F0();
      (*v35)(v7, v36, v3);
      sub_10002FED0(&qword_10003C960, (void (*)(uint64_t))&type metadata accessor for TaskType);
      sub_100032970();
      sub_100032970();
      if (v47 == v45 && v48 == v46) {
        break;
      }
      char v24 = sub_100032C70();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v25 = *v41;
      (*v41)(v7, v3);
      v25(v9, v3);
      if (v24) {
        goto LABEL_12;
      }
      uint64_t v10 = v22;
      (*v32)(v44, v22);
      uint64_t v21 = v37;
LABEL_4:
      v20 += v21;
      --v16;
      unint64_t v9 = v40;
      if (!v16) {
        return v49;
      }
    }
    swift_bridgeObjectRelease_n();
    unint64_t v26 = *v41;
    (*v41)(v7, v3);
    v26(v9, v3);
LABEL_12:
    BOOL v27 = *v42;
    uint64_t v10 = v22;
    (*v42)(v43, v44, v22);
    uint64_t v28 = v49;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      sub_10002E9A0(0, *((void *)v28 + 2) + 1, 1);
      uint64_t v28 = v49;
    }
    uint64_t v21 = v37;
    unint64_t v30 = *((void *)v28 + 2);
    unint64_t v29 = *((void *)v28 + 3);
    if (v30 >= v29 >> 1)
    {
      sub_10002E9A0(v29 > 1, v30 + 1, 1);
      uint64_t v28 = v49;
    }
    *((void *)v28 + 2) = v30 + 1;
    v27(&v28[v33 + v30 * v21], v43, v10);
    uint64_t v49 = v28;
    uint64_t v7 = v34;
    goto LABEL_4;
  }
  return result;
}

uint64_t sub_1000304F4()
{
  return sub_1000312B4((uint64_t (*)(void))&type metadata accessor for MLHostTask);
}

uint64_t sub_10003050C()
{
  return sub_10003134C((void (*)(void))&type metadata accessor for MLHostTask, (uint64_t (*)(void))&MLHostTask.name.getter);
}

uint64_t sub_100030538()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_100030548()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_100030558()
{
  (*(void (**)(uint64_t *__return_ptr))(v0 + 16))(&v3);
  uint64_t v1 = sub_100032A20();
  swift_bridgeObjectRelease();
  return v1;
}

uint64_t sub_1000305C8()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_1000305D8()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_1000305E8@<X0>(void *a1@<X8>)
{
  return sub_100028E98(v1, a1);
}

uint64_t sub_100030608()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_100030618()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_100030628(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100030670(uint64_t a1)
{
  uint64_t v4 = swift_task_alloc();
  long long v5 = *(_OWORD *)(v1 + 16);
  *(void *)(v2 + 16) = v4;
  *(void *)uint64_t v4 = v2;
  *(void *)(v4 + 8) = sub_100031D90;
  *(_OWORD *)(v4 + 24) = v5;
  *(void *)(v4 + 16) = a1;
  return _swift_task_switch(sub_100028DDC, 0, 0);
}

uint64_t sub_100030724(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *(int **)(v2 + 16);
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_10002AB90;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_10003C878 + dword_10003C878);
  return v8(a1, a2, v6);
}

uint64_t sub_1000307EC()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_1000307FC()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_10003080C()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_10003081C()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_10003082C()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_10003083C()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_10003084C()
{
  (*(void (**)(uint64_t *__return_ptr))(v0 + 16))(&v3);
  uint64_t v1 = sub_100032980();
  swift_bridgeObjectRelease();
  return v1;
}

uint64_t sub_1000308B4()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_1000308C4()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_1000308D4(uint64_t a1)
{
  uint64_t v4 = swift_task_alloc();
  long long v5 = *(_OWORD *)(v1 + 16);
  *(void *)(v2 + 16) = v4;
  *(void *)uint64_t v4 = v2;
  *(void *)(v4 + 8) = sub_100031D90;
  *(_OWORD *)(v4 + 24) = v5;
  *(void *)(v4 + 16) = a1;
  return _swift_task_switch(sub_100028DDC, 0, 0);
}

uint64_t sub_100030988()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_100030998()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_1000309A8()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_1000309B8()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_1000309C8()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_1000309D8()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_1000309E8()
{
  return sub_10002BE70(*(void (**)(uint64_t *__return_ptr))(v0 + 16), *(void *)(v0 + 24), (void (*)(void))type metadata accessor for TaskParametersRecord);
}

uint64_t sub_100030A18()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_100030A28()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_100030A38(uint64_t a1)
{
  return sub_100029150(a1, *(void **)(v1 + 16)) & 1;
}

uint64_t sub_100030A5C()
{
  return sub_10003169C(type metadata accessor for TaskParametersRecord);
}

uint64_t sub_100030A74()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_100030A84()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_100030A94@<X0>(void *a1@<X8>)
{
  swift_beginAccess();
  *a1 = *(void *)(v1 + 16);
  return swift_bridgeObjectRetain();
}

uint64_t sub_100030ADC()
{
  return sub_10002BE70(*(void (**)(uint64_t *__return_ptr))(v0 + 16), *(void *)(v0 + 24), (void (*)(void))type metadata accessor for TaskPayloadRecord);
}

uint64_t sub_100030B0C()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_100030B1C()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_100030B2C(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_100030B98()
{
  return sub_10003169C(type metadata accessor for TaskPayloadRecord);
}

uint64_t sub_100030BB0()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_100030BC0()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_100030BD0(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_100030C30()
{
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100030C40()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_100030C50()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_100030C60()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_100030C90()
{
  uint64_t v1 = (int *)(type metadata accessor for TaskPayloadRecord(0) - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*(void *)v1 + 64);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v5 = v0 + v3 + v1[9];
  uint64_t v6 = sub_1000325D0();
  uint64_t v7 = *(void *)(v6 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6)) {
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v5, v6);
  }

  return _swift_deallocObject(v0, v3 + v4, v2 | 7);
}

uint64_t sub_100030DD0()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_100030DE0()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_100030DF0()
{
  return sub_1000312B4((uint64_t (*)(void))&type metadata accessor for URL);
}

uint64_t sub_100030E08@<X0>(uint64_t a1@<X8>)
{
  return sub_100031104((uint64_t (*)(void))&type metadata accessor for URL, a1);
}

uint64_t sub_100030E20()
{
  return sub_10002BD58(*(void (**)(uint64_t))(v0 + 16), *(void *)(v0 + 24), (uint64_t (*)(void))&type metadata accessor for URL, &qword_10003C948, (void (*)(uint64_t))&type metadata accessor for URL);
}

uint64_t sub_100030E80()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_100030E90()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_100030EA0()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_100030EB0()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_100030EC0()
{
  return sub_1000312B4((uint64_t (*)(void))&type metadata accessor for URL);
}

uint64_t sub_100030ED8()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_100030EE8()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_100030EF8()
{
  return sub_1000312B4((uint64_t (*)(void))&type metadata accessor for URL);
}

uint64_t sub_100030F10()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_100030F20()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_100030F30()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_100030F40()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_100030F50()
{
  return sub_1000312B4((uint64_t (*)(void))&type metadata accessor for URL);
}

uint64_t sub_100030F68()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_100030F78()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_100030F8C()
{
  uint64_t v1 = (int *)(type metadata accessor for TaskParametersRecord(0) - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*(void *)v1 + 64);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_100006248(*(void *)(v0 + v3 + 32), *(void *)(v0 + v3 + 40));
  uint64_t v5 = v0 + v3 + v1[9];
  uint64_t v6 = sub_1000325D0();
  uint64_t v7 = *(void *)(v6 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6)) {
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v5, v6);
  }

  return _swift_deallocObject(v0, v3 + v4, v2 | 7);
}

uint64_t sub_1000310CC()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_1000310DC()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_1000310EC()
{
  return sub_1000312B4((uint64_t (*)(void))&type metadata accessor for URL);
}

uint64_t sub_100031104@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = a1(0);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
  uint64_t v7 = v2 + ((*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));

  return v6(a2, v7, v4);
}

uint64_t sub_100031180()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_100031190()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_1000311A0()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_1000311B0()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_1000311C0()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_1000311D0()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_1000311E0()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_1000311F0()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_100031200()
{
  return sub_1000312B4((uint64_t (*)(void))&type metadata accessor for MLHostTask);
}

uint64_t sub_100031218()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_100031228()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_100031238()
{
  return sub_1000312B4((uint64_t (*)(void))&type metadata accessor for TaskDefinition);
}

uint64_t sub_100031250()
{
  return sub_10003134C((void (*)(void))&type metadata accessor for TaskDefinition, (uint64_t (*)(void))&TaskDefinition.name.getter);
}

uint64_t sub_10003127C()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_10003128C()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_10003129C()
{
  return sub_1000312B4((uint64_t (*)(void))&type metadata accessor for TaskDefinition);
}

uint64_t sub_1000312B4(uint64_t (*a1)(void))
{
  uint64_t v2 = a1(0);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(unsigned __int8 *)(v3 + 80);
  uint64_t v5 = (v4 + 16) & ~v4;
  uint64_t v6 = v5 + *(void *)(v3 + 64);
  uint64_t v7 = v4 | 7;
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1 + v5, v2);

  return _swift_deallocObject(v1, v6, v7);
}

uint64_t sub_10003134C(void (*a1)(void), uint64_t (*a2)(void))
{
  return a2();
}

uint64_t sub_1000313B8()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_1000313C8()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_1000313D8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100005644(&qword_10003C3B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

id sub_100031440()
{
  return *(id *)(v0 + 16);
}

uint64_t sub_100031448()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_100031458()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_100031468(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_1000314D4()
{
  return sub_10003169C(type metadata accessor for TaskRecord);
}

uint64_t sub_1000314EC()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_1000314FC()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_100031510()
{
  uint64_t v1 = (int *)(type metadata accessor for TaskRecord(0) - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v10 = *(void *)(*(void *)v1 + 64);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_100006248(*(void *)(v0 + v3 + 32), *(void *)(v0 + v3 + 40));
  uint64_t v4 = v0 + v3 + v1[9];
  uint64_t v5 = sub_1000325D0();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t))(v6 + 8);
  v7(v4, v5);
  v7(v0 + v3 + v1[10], v5);
  uint64_t v8 = v0 + v3 + v1[11];
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v8, 1, v5)) {
    v7(v8, v5);
  }

  return _swift_deallocObject(v0, v3 + v10, v2 | 7);
}

uint64_t sub_10003169C(uint64_t (*a1)(void))
{
  uint64_t v2 = *(void *)(a1(0) - 8);
  uint64_t v3 = *(void *)(v1 + ((*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80)));
  swift_bridgeObjectRetain();
  return v3;
}

uint64_t sub_100031710()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_100031720()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_100031730()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_errorRetain();
  return v1;
}

uint64_t sub_10003175C()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_10003176C()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_10003177C()
{
  (*(void (**)(void))(v0 + 16))();

  return _swift_stdlib_bridgeErrorToNSError();
}

uint64_t sub_1000317B4()
{
  return _swift_deallocObject(v0, 24, 7);
}

double sub_1000317C4()
{
  return *(double *)(v0 + 16);
}

uint64_t sub_1000317CC()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_1000317DC()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_1000317EC(uint64_t *a1)
{
  (*(void (**)(void))(v1 + 16))();
  uint64_t v3 = *a1 + 8;
  uint64_t result = sub_100032AF0();
  *a1 = v3;
  return result;
}

uint64_t sub_100031844()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_100031854()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t *sub_100031864(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_1000318C8(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t (*a5)(void))
{
  uint64_t v5 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v5 & 0x8000000000000000) == 0)
  {
    uint64_t v9 = *(void *)(a5(0) - 8);
    uint64_t v10 = a4 + ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80));
    uint64_t v11 = *(void *)(v9 + 72);
    unint64_t v12 = v10 + v11 * a1;
    unint64_t v13 = a3 + v11 * v5;
    if (v12 >= v13 || v12 + v11 * v5 <= a3)
    {
      swift_arrayInitWithCopy();
      return v13;
    }
  }
  uint64_t result = sub_100032BD0();
  __break(1u);
  return result;
}

uint64_t sub_100031A24(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100030628(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100031A68()
{
  return swift_release();
}

unint64_t sub_100031A70()
{
  return sub_10002BBA8(v0);
}

uint64_t sub_100031A78(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100031A88()
{
  return swift_release();
}

uint64_t sub_100031A90(uint64_t a1)
{
  return a1;
}

uint64_t sub_100031ABC(uint64_t a1)
{
  return a1;
}

uint64_t sub_100031AE8(uint64_t a1, unint64_t *a2)
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

uint64_t sub_100031B24(uint64_t a1)
{
  return sub_100030A38(a1) & 1;
}

uint64_t Array<A>.mean()(uint64_t a1)
{
  __chkstk_darwin(a1);
  uint64_t v1 = sub_1000329C0();
  uint64_t v2 = v1 - 1;
  if (v1 < 1) {
    return 0;
  }
  double v3 = 0.0;
  uint64_t v4 = 1;
  while (1)
  {
    sub_1000329F0();
    sub_1000323DC();
    sub_1000328C0();
    double v3 = v3 + (v7 - v3) / (double)v4;
    if (!v2) {
      break;
    }
    --v2;
    if (__OFADD__(v4++, 1))
    {
      __break(1u);
      return *(void *)&v3;
    }
  }
  return *(void *)&v3;
}

uint64_t Array<A>.median()(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 - 8);
  uint64_t v5 = __chkstk_darwin(a1);
  double v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __chkstk_darwin(v5);
  uint64_t v10 = (char *)&v14 - v9;
  __chkstk_darwin(v8);
  uint64_t v11 = sub_1000329C0();
  if (v11 < 1)
  {
    *(double *)&uint64_t result = 0.0;
  }
  else
  {
    double v15 = *(double *)&a1;
    sub_1000329E0();
    swift_getWitnessTable();
    sub_100032960();
    sub_1000329F0();
    if (v11)
    {
      swift_bridgeObjectRelease();
      sub_1000323DC();
      sub_1000328C0();
      *(double *)&uint64_t result = v15;
    }
    else
    {
      sub_1000329F0();
      swift_bridgeObjectRelease();
      sub_100032B90();
      unint64_t v12 = *(void (**)(char *, uint64_t))(v4 + 8);
      v12(v7, a2);
      v12(v10, a2);
      sub_1000323DC();
      sub_1000328C0();
      *(double *)&uint64_t result = v15 * 0.5;
    }
  }
  return result;
}

uint64_t Array<A>.stddev()(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a2 - 8);
  uint64_t v7 = *(void *)(v6 + 64);
  uint64_t v8 = __chkstk_darwin(a1);
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)&v20 - v9;
  uint64_t v11 = sub_1000329C0();
  if (v11 < 2)
  {
LABEL_13:
    double v13 = 0.0;
    return *(void *)&v13;
  }
  uint64_t v12 = v11;
  double v13 = COERCE_DOUBLE(Array<A>.mean()(a1));
  if (v14) {
    return *(void *)&v13;
  }
  swift_bridgeObjectRetain();
  if (!sub_1000329D0())
  {
    swift_bridgeObjectRelease();
    double v16 = 0.0;
LABEL_16:
    double v13 = sqrt(v16 / (double)v12);
    return *(void *)&v13;
  }
  uint64_t v20 = v7;
  uint64_t v21 = v12;
  uint64_t v22 = a3;
  uint64_t v15 = 0;
  double v16 = 0.0;
  while (1)
  {
    BOOL v17 = sub_1000329B0();
    sub_100032990();
    if (v17)
    {
      (*(void (**)(char *, unint64_t, uint64_t))(v6 + 16))(v10, a1+ ((*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80))+ *(void *)(v6 + 72) * v15, a2);
      uint64_t v18 = v15 + 1;
      if (__OFADD__(v15, 1)) {
        goto LABEL_12;
      }
      goto LABEL_7;
    }
    uint64_t result = sub_100032B60();
    if (v20 != 8) {
      break;
    }
    double v23 = *(double *)&result;
    (*(void (**)(char *, double *, uint64_t))(v6 + 16))(v10, &v23, a2);
    swift_unknownObjectRelease();
    uint64_t v18 = v15 + 1;
    if (__OFADD__(v15, 1))
    {
LABEL_12:
      __break(1u);
      goto LABEL_13;
    }
LABEL_7:
    (*(void (**)(char *, char *, uint64_t))(v6 + 32))((char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), v10, a2);
    sub_1000323DC();
    sub_1000328C0();
    double v16 = v16 + (v23 - v13) * (v23 - v13);
    ++v15;
    if (v18 == sub_1000329D0())
    {
      swift_bridgeObjectRelease();
      uint64_t v12 = v21;
      goto LABEL_16;
    }
  }
  __break(1u);
  return result;
}

unint64_t sub_1000323DC()
{
  unint64_t result = qword_10003C988;
  if (!qword_10003C988)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003C988);
  }
  return result;
}

uint64_t sub_100032430()
{
  return dispatch thunk of PropertyListDecoder.decode<A>(_:from:)();
}

uint64_t sub_100032440()
{
  return PropertyListDecoder.init()();
}

uint64_t sub_100032450()
{
  return type metadata accessor for PropertyListDecoder();
}

uint64_t sub_1000324A0()
{
  return _BridgedStoredNSError.code.getter();
}

uint64_t sub_1000324D0()
{
  return _convertNSErrorToError(_:)();
}

uint64_t sub_1000324E0()
{
  return type metadata accessor for URL.DirectoryHint();
}

void sub_1000324F0(NSURL *retstr@<X8>)
{
}

uint64_t sub_100032500()
{
  return static URL._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100032510(Swift::Bool percentEncoded)
{
  return URL.path(percentEncoded:)(percentEncoded)._countAndFlagsBits;
}

uint64_t sub_100032520()
{
  return URL.init(filePath:directoryHint:relativeTo:)();
}

uint64_t sub_100032530()
{
  return URL.appending<A>(path:directoryHint:)();
}

uint64_t sub_100032540()
{
  return type metadata accessor for URL();
}

uint64_t sub_100032550()
{
  return Data.write(to:options:)();
}

uint64_t sub_100032560()
{
  return Date.timeIntervalSinceReferenceDate.getter();
}

uint64_t sub_100032570()
{
  return static Date.distantPast.getter();
}

NSDate sub_100032580()
{
  return Date._bridgeToObjectiveC()();
}

uint64_t sub_100032590()
{
  return static Date._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_1000325A0()
{
  return static Date.now.getter();
}

uint64_t sub_1000325B0()
{
  return Date.advanced(by:)();
}

uint64_t sub_1000325C0()
{
  return Date.distance(to:)();
}

uint64_t sub_1000325D0()
{
  return type metadata accessor for Date();
}

uint64_t sub_1000325E0()
{
  return Calendar.startOfDay(for:)();
}

uint64_t sub_1000325F0()
{
  return static Calendar.current.getter();
}

uint64_t sub_100032600()
{
  return type metadata accessor for Calendar();
}

uint64_t sub_100032610()
{
  return static ArchiveByteStream.decompressionStream(readingFrom:flags:threadCount:)();
}

uint64_t sub_100032620()
{
  return static ArchiveByteStream.fileStream(path:mode:options:permissions:)();
}

uint64_t sub_100032630()
{
  return dispatch thunk of ArchiveByteStream.close()();
}

uint64_t sub_100032640()
{
  return type metadata accessor for ArchiveByteStream();
}

uint64_t sub_100032650()
{
  return static ArchiveFlags.ignoreOperationNotPermitted.getter();
}

uint64_t sub_100032660()
{
  return type metadata accessor for ArchiveFlags();
}

uint64_t sub_100032670()
{
  return static ArchiveStream.decodeStream(readingFrom:selectUsing:flags:threadCount:)();
}

uint64_t sub_100032680()
{
  return static ArchiveStream.extractStream(extractingTo:selectUsing:flags:threadCount:)();
}

uint64_t sub_100032690()
{
  return dispatch thunk of ArchiveStream.close()();
}

uint64_t sub_1000326A0()
{
  return static ArchiveStream.process(readingFrom:writingTo:selectUsing:flags:threadCount:)();
}

uint64_t sub_1000326B0()
{
  return type metadata accessor for ArchiveStream();
}

uint64_t sub_1000326C0()
{
  return static AppExtension.main()();
}

uint64_t sub_1000326D0()
{
  return MLHostTask.taskFolder.getter();
}

uint64_t sub_1000326E0()
{
  return MLHostTask.name.getter();
}

uint64_t sub_1000326F0()
{
  return MLHostTask.taskType.getter();
}

uint64_t sub_100032700()
{
  return type metadata accessor for MLHostTask();
}

uint64_t sub_100032710()
{
  return MLHostClient.__allocating_init()();
}

uint64_t sub_100032720()
{
  return type metadata accessor for MLHostClient();
}

uint64_t sub_100032730()
{
  return MLHostConfig.cloudContainer.getter();
}

uint64_t sub_100032740()
{
  return MLHostConfig.cloudEnvironment.getter();
}

uint64_t sub_100032750()
{
  return type metadata accessor for MLHostConfig();
}

uint64_t sub_100032760()
{
  return MLHostResult.init(error:policy:)();
}

uint64_t sub_100032770()
{
  return MLHostResult.init(status:policy:)();
}

uint64_t sub_100032780()
{
  return type metadata accessor for MLHostResult();
}

uint64_t sub_100032790()
{
  return BucketInterval.rawValue.getter();
}

uint64_t sub_1000327A0()
{
  return type metadata accessor for BucketInterval();
}

uint64_t sub_1000327B0()
{
  return TaskDefinition.name.getter();
}

uint64_t sub_1000327C0()
{
  return type metadata accessor for TaskDefinition();
}

uint64_t sub_1000327D0()
{
  return ExtensionRecord.bundleIdentifier.getter();
}

uint64_t sub_1000327E0()
{
  return type metadata accessor for ExtensionRecord();
}

uint64_t sub_100032820()
{
  return CoreAnalyticsEvents.rawValue.getter();
}

uint64_t sub_100032830()
{
  return type metadata accessor for CoreAnalyticsEvents();
}

uint64_t sub_100032840()
{
  return validateTaskDefinition(_:)();
}

uint64_t sub_100032850()
{
  return type metadata accessor for TaskType();
}

uint64_t sub_100032860()
{
  return Logger.logObject.getter();
}

uint64_t sub_100032870()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_100032880()
{
  return type metadata accessor for Logger();
}

uint64_t sub_100032890()
{
  return FilePath.string.getter();
}

uint64_t sub_1000328A0()
{
  return type metadata accessor for FilePath();
}

uint64_t sub_1000328B0()
{
  return FilePath.init(_:)();
}

uint64_t sub_1000328C0()
{
  return BinaryFloatingPoint.init<A>(_:)();
}

NSDictionary sub_1000328D0()
{
  return Dictionary._bridgeToObjectiveC()();
}

uint64_t sub_1000328E0()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_1000328F0()
{
  return Dictionary.description.getter();
}

uint64_t sub_100032900()
{
  return dispatch thunk of Hashable.hash(into:)();
}

uint64_t sub_100032910()
{
  return dispatch thunk of static Comparable.< infix(_:_:)();
}

NSString sub_100032920()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_100032940()
{
  return String.hash(into:)();
}

Swift::Int sub_100032950()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_100032960()
{
  return Sequence<>.sorted()();
}

uint64_t sub_100032970()
{
  return dispatch thunk of RawRepresentable.rawValue.getter();
}

uint64_t sub_100032980()
{
  return Array.description.getter();
}

uint64_t sub_100032990()
{
  return Array._checkSubscript(_:wasNativeTypeChecked:)();
}

uint64_t sub_1000329A0()
{
  return static Array._allocateBufferUninitialized(minimumCapacity:)();
}

BOOL sub_1000329B0()
{
  return Array._hoistableIsNativeTypeChecked()();
}

uint64_t sub_1000329C0()
{
  return Array.count.getter();
}

uint64_t sub_1000329D0()
{
  return Array.endIndex.getter();
}

uint64_t sub_1000329E0()
{
  return type metadata accessor for Array();
}

uint64_t sub_1000329F0()
{
  return Array.subscript.getter();
}

uint64_t sub_100032A00()
{
  return static Task<>.isCancelled.getter();
}

NSNumber sub_100032A10()
{
  return Double._bridgeToObjectiveC()();
}

uint64_t sub_100032A20()
{
  return Set.description.getter();
}

uint64_t sub_100032A30()
{
  return Set.init(minimumCapacity:)();
}

NSNumber sub_100032A40()
{
  return Int._bridgeToObjectiveC()();
}

uint64_t sub_100032A70()
{
  return NSPredicate.init(format:_:)();
}

uint64_t sub_100032A80()
{
  return static os_log_type_t.info.getter();
}

uint64_t sub_100032A90()
{
  return static os_log_type_t.debug.getter();
}

uint64_t sub_100032AA0()
{
  return static os_log_type_t.error.getter();
}

CKQuery sub_100032AB0(Swift::String recordType, NSPredicate *predicate)
{
  return CKQuery.init(recordType:predicate:)(recordType, predicate);
}

uint64_t sub_100032AC0()
{
  return CKRecord.recordType.getter();
}

uint64_t sub_100032AD0()
{
  return NSObject.hashValue.getter();
}

uint64_t sub_100032AE0()
{
  return type metadata accessor for Optional();
}

uint64_t sub_100032AF0()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_100032B00()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_100032B10()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

uint64_t sub_100032B20()
{
  return _HashTable.previousHole(before:)();
}

uint64_t sub_100032B30()
{
  return static _SetStorage.copy(original:)();
}

uint64_t sub_100032B40()
{
  return static _SetStorage.resize(original:capacity:move:)();
}

uint64_t sub_100032B50()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_100032B60()
{
  return _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_100032B70()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_100032B80()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_100032B90()
{
  return dispatch thunk of static AdditiveArithmetic.+ infix(_:_:)();
}

uint64_t sub_100032BA0()
{
  return static _DictionaryStorage.copy(original:)();
}

uint64_t sub_100032BB0()
{
  return static _DictionaryStorage.resize(original:capacity:move:)();
}

uint64_t sub_100032BC0()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_100032BD0()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

Swift::Int sub_100032BE0(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases, string);
}

uint64_t sub_100032BF0()
{
  return KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)();
}

uint64_t sub_100032C00()
{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

uint64_t sub_100032C10()
{
  return KeyedDecodingContainer.decode<A>(_:forKey:)();
}

uint64_t sub_100032C20()
{
  return KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)();
}

uint64_t sub_100032C30()
{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

uint64_t sub_100032C40()
{
  return KeyedEncodingContainer.encode<A>(_:forKey:)();
}

Swift::Int sub_100032C50(Swift::Int a1)
{
  return _minimumMergeRunLength(_:)(a1);
}

uint64_t sub_100032C60()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t sub_100032C70()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_100032C80()
{
  return ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_100032C90()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_100032CC0()
{
  return Error._getEmbeddedNSError()();
}

uint64_t sub_100032CD0()
{
  return Error._code.getter();
}

uint64_t sub_100032CE0()
{
  return Error._domain.getter();
}

uint64_t sub_100032CF0()
{
  return Error._userInfo.getter();
}

uint64_t sub_100032D00()
{
  return Hasher.init(_seed:)();
}

void sub_100032D10(Swift::UInt a1)
{
}

Swift::Int sub_100032D20()
{
  return Hasher._finalize()();
}

uint64_t sub_100032D30()
{
  return dispatch thunk of Decoder.container<A>(keyedBy:)();
}

uint64_t sub_100032D40()
{
  return dispatch thunk of Encoder.container<A>(keyedBy:)();
}

uint64_t AnalyticsSendEventLazy()
{
  return _AnalyticsSendEventLazy();
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

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return __swift_stdlib_bridgeErrorToNSError();
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

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
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

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_dynamicCastObjCClass()
{
  return _swift_dynamicCastObjCClass();
}

uint64_t swift_errorInMain()
{
  return _swift_errorInMain();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_errorRetain()
{
  return _swift_errorRetain();
}

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
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