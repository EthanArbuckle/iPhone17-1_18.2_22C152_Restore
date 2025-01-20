unint64_t sub_1000018D4()
{
  unint64_t result;

  result = qword_100010058;
  if (!qword_100010058)
  {
    result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010058);
  }
  return result;
}

unint64_t sub_10000192C()
{
  unint64_t result = qword_100010060;
  if (!qword_100010060)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010060);
  }
  return result;
}

uint64_t sub_100001980()
{
  sub_1000097B0();
  return v1;
}

uint64_t sub_1000019B4()
{
  uint64_t v0 = sub_100009A70();
  sub_10000756C(v0, qword_100010288);
  sub_100007534(v0, (uint64_t)qword_100010288);
  return sub_100009A40();
}

uint64_t sub_100001A18()
{
  sub_100008948(0, &qword_100010180, (uint64_t (*)(uint64_t))&type metadata accessor for LocalizedStringResource, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
  __chkstk_darwin();
  unsigned __int8 v1 = (char *)v12 - v0;
  v12[0] = sub_100009A50();
  uint64_t v2 = *(void *)(v12[0] - 8);
  __chkstk_darwin();
  v4 = (char *)v12 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100009AA0();
  __chkstk_darwin();
  sub_100009B00();
  __chkstk_darwin();
  uint64_t v5 = sub_100009A70();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin();
  sub_100008948(0, &qword_100010220, (uint64_t (*)(uint64_t))&type metadata accessor for IntentDescription, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
  uint64_t v8 = v7;
  sub_10000756C(v7, qword_1000102A0);
  uint64_t v9 = sub_100007534(v8, (uint64_t)qword_1000102A0);
  sub_100009AF0();
  sub_100009A90();
  (*(void (**)(char *, void, void))(v2 + 104))(v4, enum case for LocalizedStringResource.BundleDescription.main(_:), v12[0]);
  sub_100009A80();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56))(v1, 1, 1, v5);
  sub_100009900();
  uint64_t v10 = sub_1000098F0();
  return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v9, 0, 1, v10);
}

uint64_t sub_100001D90@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_1000097B0();
  *a1 = v3;
  return result;
}

uint64_t sub_100001DCC()
{
  return sub_1000097C0();
}

void (*sub_100001E04(void *a1))(void *a1)
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_1000097A0();
  return sub_100001E60;
}

void sub_100001E60(void *a1)
{
  unsigned __int8 v1 = (void *)*a1;
  (*(void (**)(void, void))(*a1 + 32))(*a1, 0);

  free(v1);
}

unint64_t sub_100001EB0()
{
  unint64_t result = qword_100010068;
  if (!qword_100010068)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010068);
  }
  return result;
}

uint64_t sub_100001F04(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_1000088A0();
  unint64_t v5 = sub_1000075D0();

  return static URLRepresentableIntent<>.urlRepresentation.getter(a1, v4, a2, v5);
}

unint64_t sub_100001F70()
{
  return 0xD000000000000015;
}

unint64_t sub_100001F94()
{
  unint64_t result = qword_100010070;
  if (!qword_100010070)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010070);
  }
  return result;
}

unint64_t sub_100001FEC()
{
  unint64_t result = qword_100010078;
  if (!qword_100010078)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010078);
  }
  return result;
}

unint64_t sub_100002044()
{
  unint64_t result = qword_100010080;
  if (!qword_100010080)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010080);
  }
  return result;
}

uint64_t sub_100002098()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1000020E8@<X0>(uint64_t a1@<X8>)
{
  return sub_1000061DC(&qword_100010028, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_100010288, a1);
}

uint64_t sub_100002120()
{
  return 0;
}

uint64_t sub_10000212C()
{
  return 1;
}

uint64_t sub_100002138@<X0>(uint64_t a1@<X8>)
{
  if (qword_100010030 != -1) {
    swift_once();
  }
  sub_100008948(0, &qword_100010220, (uint64_t (*)(uint64_t))&type metadata accessor for IntentDescription, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
  uint64_t v3 = sub_100007534(v2, (uint64_t)qword_1000102A0);

  return sub_1000089AC(v3, a1);
}

uint64_t sub_1000021E0(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  unint64_t v5 = sub_1000088A0();
  unint64_t v6 = sub_1000088F4();
  unint64_t v7 = sub_1000075D0();
  void *v4 = v2;
  v4[1] = sub_1000022AC;
  return URLRepresentableIntent<>.perform()(a2, v5, v6, v7);
}

uint64_t sub_1000022AC()
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

uint64_t sub_1000023B4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100006FB8();
  *a1 = result;
  return result;
}

uint64_t sub_1000023DC(uint64_t a1)
{
  unint64_t v2 = sub_100001EB0();

  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

uint64_t sub_100002418@<X0>(void (*a1)(char *, uint64_t, uint64_t)@<X0>, uint64_t a2@<X8>)
{
  v132 = a1;
  uint64_t v135 = a2;
  sub_100008948(0, &qword_100010190, (uint64_t (*)(uint64_t))&type metadata accessor for DisplayRepresentation.Image, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
  uint64_t v3 = __chkstk_darwin(v2 - 8);
  v131 = (char *)v119 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __chkstk_darwin(v3);
  v130 = (char *)v119 - v6;
  uint64_t v7 = __chkstk_darwin(v5);
  v129 = (char *)v119 - v8;
  uint64_t v9 = __chkstk_darwin(v7);
  v128 = (char *)v119 - v10;
  __chkstk_darwin(v9);
  v120 = (char *)v119 - v11;
  uint64_t v12 = sub_100009B00();
  uint64_t v13 = __chkstk_darwin(v12 - 8);
  v122 = (char *)v119 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __chkstk_darwin(v13);
  v123 = (char *)v119 - v16;
  uint64_t v17 = __chkstk_darwin(v15);
  v119[19] = (char *)v119 - v18;
  uint64_t v19 = __chkstk_darwin(v17);
  v119[11] = (char *)v119 - v20;
  uint64_t v21 = __chkstk_darwin(v19);
  v119[12] = (char *)v119 - v22;
  uint64_t v23 = __chkstk_darwin(v21);
  v121 = (char *)v119 - v24;
  uint64_t v25 = __chkstk_darwin(v23);
  v119[20] = (char *)v119 - v26;
  uint64_t v27 = __chkstk_darwin(v25);
  v119[16] = (char *)v119 - v28;
  uint64_t v29 = __chkstk_darwin(v27);
  v119[8] = (char *)v119 - v30;
  uint64_t v31 = __chkstk_darwin(v29);
  v119[10] = (char *)v119 - v32;
  uint64_t v33 = __chkstk_darwin(v31);
  v119[17] = (char *)v119 - v34;
  uint64_t v35 = __chkstk_darwin(v33);
  v119[18] = (char *)v119 - v36;
  uint64_t v37 = __chkstk_darwin(v35);
  v119[14] = (char *)v119 - v38;
  uint64_t v39 = __chkstk_darwin(v37);
  v119[6] = (char *)v119 - v40;
  uint64_t v41 = __chkstk_darwin(v39);
  v119[7] = (char *)v119 - v42;
  uint64_t v43 = __chkstk_darwin(v41);
  v119[15] = (char *)v119 - v44;
  uint64_t v45 = __chkstk_darwin(v43);
  v119[13] = (char *)v119 - v46;
  uint64_t v47 = __chkstk_darwin(v45);
  uint64_t v48 = __chkstk_darwin(v47);
  v119[5] = (char *)v119 - v49;
  uint64_t v50 = __chkstk_darwin(v48);
  v119[9] = (char *)v119 - v51;
  uint64_t v52 = __chkstk_darwin(v50);
  v119[4] = (char *)v119 - v53;
  __chkstk_darwin(v52);
  sub_100008948(0, &qword_100010180, (uint64_t (*)(uint64_t))&type metadata accessor for LocalizedStringResource, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
  uint64_t v55 = __chkstk_darwin(v54 - 8);
  v127 = (char *)v119 - ((v56 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v57 = __chkstk_darwin(v55);
  v126 = (char *)v119 - v58;
  uint64_t v59 = __chkstk_darwin(v57);
  v125 = (char *)v119 - v60;
  uint64_t v61 = __chkstk_darwin(v59);
  v124 = (char *)v119 - v62;
  __chkstk_darwin(v61);
  v64 = (char *)v119 - v63;
  uint64_t v136 = sub_100009A50();
  uint64_t v65 = *(void *)(v136 - 8);
  __chkstk_darwin(v136);
  v67 = (char *)v119 - ((v66 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v68 = sub_100009AA0();
  __chkstk_darwin(v68 - 8);
  uint64_t v69 = sub_100009A70();
  uint64_t v70 = *(void *)(v69 - 8);
  uint64_t v133 = v69;
  uint64_t v134 = v70;
  uint64_t v71 = __chkstk_darwin(v69);
  uint64_t v72 = __chkstk_darwin(v71);
  uint64_t v73 = __chkstk_darwin(v72);
  __chkstk_darwin(v73);
  uint64_t v75 = __chkstk_darwin((char *)v119 - v74);
  uint64_t v76 = __chkstk_darwin(v75);
  uint64_t v77 = __chkstk_darwin(v76);
  uint64_t v78 = __chkstk_darwin(v77);
  uint64_t v79 = __chkstk_darwin(v78);
  uint64_t v80 = __chkstk_darwin(v79);
  switch((char)v132)
  {
    case 1:
      sub_100009AF0();
      sub_100009A90();
      uint64_t v92 = enum case for LocalizedStringResource.BundleDescription.main(_:);
      v93 = *(void (**)(char *, uint64_t, uint64_t))(v65 + 104);
      uint64_t v94 = v136;
      v93(v67, enum case for LocalizedStringResource.BundleDescription.main(_:), v136);
      v132 = v93;
      sub_100009A80();
      sub_100009AF0();
      sub_100009A90();
      v93(v67, v92, v94);
      v95 = v124;
      sub_100009A80();
      (*(void (**)(char *, void, uint64_t, uint64_t))(v134 + 56))(v95, 0, 1, v133);
      v96 = v128;
      sub_100009910();
      uint64_t v97 = sub_100009920();
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v97 - 8) + 56))(v96, 0, 1, v97);
      sub_100008948(0, &qword_100010198, (uint64_t (*)(uint64_t))&type metadata accessor for LocalizedStringResource, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for _ContiguousArrayStorage);
      *(_OWORD *)(swift_allocObject() + 16) = xmmword_100009F30;
      sub_100009AF0();
      sub_100009A90();
      uint64_t v98 = v94;
      v99 = v132;
      v132(v67, v92, v98);
      sub_100009A80();
      sub_100009AF0();
      sub_100009A90();
      v99(v67, v92, v136);
      sub_100009A80();
      break;
    case 2:
      v119[3] = v81;
      v132 = v82;
      sub_100009AF0();
      sub_100009A90();
      uint64_t v100 = enum case for LocalizedStringResource.BundleDescription.main(_:);
      v101 = *(void (**)(char *, uint64_t, uint64_t))(v65 + 104);
      uint64_t v102 = v136;
      v101(v67, enum case for LocalizedStringResource.BundleDescription.main(_:), v136);
      sub_100009A80();
      sub_100009AF0();
      sub_100009A90();
      v101(v67, v100, v102);
      v103 = v125;
      sub_100009A80();
      (*(void (**)(char *, void, uint64_t, uint64_t))(v134 + 56))(v103, 0, 1, v133);
      v104 = v129;
      sub_100009910();
      uint64_t v105 = sub_100009920();
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v105 - 8) + 56))(v104, 0, 1, v105);
      sub_100008948(0, &qword_100010198, (uint64_t (*)(uint64_t))&type metadata accessor for LocalizedStringResource, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for _ContiguousArrayStorage);
      *(_OWORD *)(swift_allocObject() + 16) = xmmword_100009F20;
      sub_100009AF0();
      sub_100009A90();
      v101(v67, v100, v102);
      sub_100009A80();
      sub_100009AF0();
      sub_100009A90();
      v101(v67, v100, v102);
      sub_100009A80();
      sub_100009AF0();
      sub_100009A90();
      v101(v67, v100, v102);
      sub_100009A80();
      break;
    case 3:
      v119[2] = v80;
      v132 = v84;
      sub_100009AF0();
      sub_100009A90();
      uint64_t v106 = enum case for LocalizedStringResource.BundleDescription.main(_:);
      v107 = *(void (**)(char *, uint64_t, uint64_t))(v65 + 104);
      uint64_t v108 = v136;
      v107(v67, enum case for LocalizedStringResource.BundleDescription.main(_:), v136);
      sub_100009A80();
      sub_100009AF0();
      sub_100009A90();
      v107(v67, v106, v108);
      v109 = v126;
      sub_100009A80();
      (*(void (**)(char *, void, uint64_t, uint64_t))(v134 + 56))(v109, 0, 1, v133);
      v110 = v130;
      sub_100009910();
      uint64_t v111 = sub_100009920();
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v111 - 8) + 56))(v110, 0, 1, v111);
      sub_100008948(0, &qword_100010198, (uint64_t (*)(uint64_t))&type metadata accessor for LocalizedStringResource, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for _ContiguousArrayStorage);
      *(_OWORD *)(swift_allocObject() + 16) = xmmword_100009F20;
      sub_100009AF0();
      sub_100009A90();
      v107(v67, v106, v108);
      sub_100009A80();
      sub_100009AF0();
      sub_100009A90();
      v107(v67, v106, v108);
      sub_100009A80();
      sub_100009AF0();
      sub_100009A90();
      v107(v67, v106, v108);
      sub_100009A80();
      break;
    case 4:
      v119[1] = v85;
      v132 = v83;
      sub_100009AF0();
      sub_100009A90();
      uint64_t v112 = enum case for LocalizedStringResource.BundleDescription.main(_:);
      v113 = *(void (**)(char *, uint64_t, uint64_t))(v65 + 104);
      uint64_t v114 = v136;
      v113(v67, enum case for LocalizedStringResource.BundleDescription.main(_:), v136);
      sub_100009A80();
      sub_100009AF0();
      sub_100009A90();
      v113(v67, v112, v114);
      v115 = v127;
      sub_100009A80();
      (*(void (**)(char *, void, uint64_t, uint64_t))(v134 + 56))(v115, 0, 1, v133);
      v116 = v131;
      sub_100009910();
      uint64_t v117 = sub_100009920();
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v117 - 8) + 56))(v116, 0, 1, v117);
      sub_100008948(0, &qword_100010198, (uint64_t (*)(uint64_t))&type metadata accessor for LocalizedStringResource, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for _ContiguousArrayStorage);
      *(_OWORD *)(swift_allocObject() + 16) = xmmword_100009F20;
      sub_100009AF0();
      sub_100009A90();
      v113(v67, v112, v114);
      sub_100009A80();
      sub_100009AF0();
      sub_100009A90();
      v113(v67, v112, v114);
      sub_100009A80();
      sub_100009AF0();
      sub_100009A90();
      v113(v67, v112, v114);
      sub_100009A80();
      break;
    default:
      sub_100009AF0();
      sub_100009A90();
      uint64_t v86 = enum case for LocalizedStringResource.BundleDescription.main(_:);
      v87 = *(void (**)(char *, uint64_t, uint64_t))(v65 + 104);
      LODWORD(v132) = enum case for LocalizedStringResource.BundleDescription.main(_:);
      v87(v67, enum case for LocalizedStringResource.BundleDescription.main(_:), v136);
      sub_100009A80();
      sub_100009AF0();
      sub_100009A90();
      uint64_t v88 = v86;
      uint64_t v89 = v136;
      v87(v67, v88, v136);
      sub_100009A80();
      (*(void (**)(char *, void, uint64_t, uint64_t))(v134 + 56))(v64, 0, 1, v133);
      v90 = v120;
      sub_100009910();
      uint64_t v91 = sub_100009920();
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v91 - 8) + 56))(v90, 0, 1, v91);
      sub_100009AF0();
      sub_100009A90();
      v87(v67, v132, v89);
      sub_100009A80();
      break;
  }
  return sub_100009940();
}

uint64_t sub_100003D50(char a1)
{
  *(unsigned char *)(v1 + 216) = a1;
  uint64_t v2 = sub_100009AE0();
  *(void *)(v1 + 176) = v2;
  *(void *)(v1 + 184) = *(void *)(v2 - 8);
  *(void *)(v1 + 192) = swift_task_alloc();
  return _swift_task_switch(sub_100003E10, 0, 0);
}

uint64_t sub_100003E10()
{
  unsigned int v1 = *(unsigned __int8 *)(v0 + 216);
  if (v1 < 3)
  {
    uint64_t v2 = 1;
LABEL_8:
    swift_task_dealloc();
    uint64_t v7 = *(uint64_t (**)(uint64_t))(v0 + 8);
    return v7(v2);
  }
  if (v1 != 3)
  {
    id v6 = [self shared];
    uint64_t v2 = (uint64_t)[v6 isMedicalIDAvailable];

    goto LABEL_8;
  }
  id v3 = [objc_allocWithZone((Class)HKHealthStore) init];
  id v4 = [objc_allocWithZone((Class)HKHealthRecordsStore) initWithHealthStore:v3];
  *(void *)(v0 + 200) = v4;

  *(void *)(v0 + 16) = v0;
  *(void *)(v0 + 56) = v0 + 160;
  *(void *)(v0 + 24) = sub_100003FE8;
  uint64_t v5 = swift_continuation_init();
  *(void *)(v0 + 80) = _NSConcreteStackBlock;
  *(void *)(v0 + 88) = 0x40000000;
  *(void *)(v0 + 96) = sub_10000449C;
  *(void *)(v0 + 104) = &unk_10000CCC0;
  *(void *)(v0 + 112) = v5;
  [v4 fetchClinicalConnectedAccountsWithCompletion:v0 + 80];
  return _swift_continuation_await(v0 + 16);
}

uint64_t sub_100003FE8()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 208) = v1;
  if (v1) {
    uint64_t v2 = sub_1000041C4;
  }
  else {
    uint64_t v2 = sub_1000040F8;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_1000040F8()
{
  unint64_t v1 = v0[20];
  uint64_t v2 = (void *)v0[25];
  if (v1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_100009BD0();
    swift_bridgeObjectRelease_n();
  }
  else
  {
    uint64_t v3 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);

    swift_bridgeObjectRelease();
  }
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(BOOL))v0[1];
  return v4(v3 != 0);
}

uint64_t sub_1000041C4()
{
  uint64_t v19 = v0;
  unint64_t v1 = (void *)v0[25];
  swift_willThrow();

  if (qword_100010048 != -1) {
    swift_once();
  }
  uint64_t v2 = v0[22];
  uint64_t v4 = v0[23];
  uint64_t v3 = v0[24];
  uint64_t v5 = sub_100007534(v2, (uint64_t)qword_1000102E8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v3, v5, v2);
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v6 = sub_100009AC0();
  os_log_type_t v7 = sub_100009B60();
  BOOL v8 = os_log_type_enabled(v6, v7);
  uint64_t v10 = v0[23];
  uint64_t v9 = v0[24];
  uint64_t v11 = v0[22];
  if (v8)
  {
    uint64_t v17 = v0[22];
    uint64_t v12 = swift_slowAlloc();
    v18[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v12 = 136315394;
    v0[18] = sub_100006790(0x73676E6974746553, 0xEC000000656E6150, v18);
    sub_100009B70();
    *(_WORD *)(v12 + 12) = 2080;
    swift_getErrorValue();
    uint64_t v13 = sub_100009C10();
    v0[21] = sub_100006790(v13, v14, v18);
    sub_100009B70();
    swift_bridgeObjectRelease();
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "%s failed to fetch CHR accounts: %s", (uint8_t *)v12, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    swift_errorRelease();
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v9, v17);
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
    swift_errorRelease();

    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v9, v11);
  }
  swift_task_dealloc();
  uint64_t v15 = (uint64_t (*)(void))v0[1];
  return v15(0);
}

uint64_t sub_10000449C(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    sub_100007E2C();
    uint64_t v5 = swift_allocError();
    *uint64_t v6 = a3;
    id v7 = a3;
    return _swift_continuation_throwingResumeWithError(v3, v5);
  }
  else
  {
    sub_100007DEC();
    **(void **)(*(void *)(v3 + 64) + 40) = sub_100009B40();
    return _swift_continuation_throwingResume(v3);
  }
}

unint64_t sub_100004564(char a1)
{
  unint64_t result = 0xD000000000000013;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x5F53454352554F53;
      break;
    case 2:
    case 3:
      return result;
    case 4:
      unint64_t result = 0x5F4C41434944454DLL;
      break;
    default:
      unint64_t result = 1953460082;
      break;
  }
  return result;
}

unint64_t sub_100004620(char a1)
{
  unint64_t result = 0xD000000000000013;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x5F53454352554F53;
      break;
    case 2:
    case 3:
      return result;
    case 4:
      unint64_t result = 0x5F4C41434944454DLL;
      break;
    default:
      unint64_t result = 1953460082;
      break;
  }
  return result;
}

uint64_t sub_1000046DC(unsigned __int8 *a1, char *a2)
{
  return sub_100004740(*a1, *a2);
}

unint64_t sub_1000046EC()
{
  unint64_t result = qword_100010090;
  if (!qword_100010090)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010090);
  }
  return result;
}

uint64_t sub_100004740(unsigned __int8 a1, char a2)
{
  unint64_t v2 = 0x800000010000A7A0;
  uint64_t v3 = a1;
  unint64_t v4 = 0xD000000000000013;
  switch(v3)
  {
    case 1:
      unint64_t v2 = 0xEC0000004D455449;
      unint64_t v4 = 0x5F53454352554F53;
      break;
    case 2:
      break;
    case 3:
      unint64_t v2 = 0x800000010000A7C0;
      break;
    case 4:
      unint64_t v2 = 0xEF4D4554495F4449;
      unint64_t v4 = 0x5F4C41434944454DLL;
      break;
    default:
      unint64_t v2 = 0xE400000000000000;
      unint64_t v4 = 1953460082;
      break;
  }
  unint64_t v5 = 0x800000010000A7A0;
  switch(a2)
  {
    case 1:
      unint64_t v5 = 0xEC0000004D455449;
      if (v4 == 0x5F53454352554F53) {
        goto LABEL_13;
      }
      goto LABEL_16;
    case 2:
      goto LABEL_12;
    case 3:
      unint64_t v5 = 0x800000010000A7C0;
LABEL_12:
      if (v4 == 0xD000000000000013) {
        goto LABEL_13;
      }
      goto LABEL_16;
    case 4:
      unint64_t v5 = 0xEF4D4554495F4449;
      if (v4 != 0x5F4C41434944454DLL) {
        goto LABEL_16;
      }
      goto LABEL_13;
    default:
      unint64_t v5 = 0xE400000000000000;
      if (v4 != 1953460082) {
        goto LABEL_16;
      }
LABEL_13:
      if (v2 == v5) {
        char v6 = 1;
      }
      else {
LABEL_16:
      }
        char v6 = sub_100009C00();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v6 & 1;
  }
}

Swift::Int sub_100004914()
{
  return sub_10000491C();
}

Swift::Int sub_10000491C()
{
  return sub_100009C30();
}

uint64_t sub_100004A2C()
{
  return sub_100004A34();
}

uint64_t sub_100004A34()
{
  sub_100009B20();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_100004B24()
{
  return sub_100004B2C();
}

Swift::Int sub_100004B2C()
{
  return sub_100009C30();
}

uint64_t sub_100004C38@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_1000076A0(*(void *)a1, *(void **)(a1 + 8));
  *a2 = result;
  return result;
}

unint64_t sub_100004C68@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_100004620(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

unint64_t sub_100004C98()
{
  unint64_t result = qword_100010098;
  if (!qword_100010098)
  {
    sub_100007DA0(255, &qword_1000100A0, (uint64_t)&type metadata for SettingsPane, (uint64_t (*)(void, uint64_t))&type metadata accessor for Array);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010098);
  }
  return result;
}

void sub_100004D14(void *a1@<X8>)
{
  *a1 = &off_10000CAF0;
}

unint64_t sub_100004D24()
{
  return sub_100004564(*v0);
}

uint64_t sub_100004D2C@<X0>(uint64_t a1@<X0>, void *a2@<X1>, unsigned char *a3@<X8>)
{
  swift_bridgeObjectRetain();
  uint64_t result = sub_1000076A0(a1, a2);
  *a3 = result;
  return result;
}

unint64_t sub_100004D78()
{
  unint64_t result = qword_1000100A8[0];
  if (!qword_1000100A8[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_1000100A8);
  }
  return result;
}

uint64_t sub_100004DCC()
{
  sub_100008948(0, &qword_100010180, (uint64_t (*)(uint64_t))&type metadata accessor for LocalizedStringResource, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
  __chkstk_darwin(v0 - 8);
  unint64_t v2 = (char *)v12 - v1;
  v12[0] = sub_100009A50();
  uint64_t v3 = *(void *)(v12[0] - 8);
  __chkstk_darwin(v12[0]);
  unint64_t v5 = (char *)v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100009AA0();
  __chkstk_darwin(v6 - 8);
  uint64_t v7 = sub_100009B00();
  __chkstk_darwin(v7 - 8);
  uint64_t v8 = sub_100009A70();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v10 = sub_100009A20();
  sub_10000756C(v10, qword_1000102B8);
  sub_100007534(v10, (uint64_t)qword_1000102B8);
  sub_100009AF0();
  sub_100009A90();
  (*(void (**)(char *, void, void))(v3 + 104))(v5, enum case for LocalizedStringResource.BundleDescription.main(_:), v12[0]);
  sub_100009A80();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(v2, 1, 1, v8);
  return sub_100009A10();
}

uint64_t sub_1000050D8()
{
  sub_100007638(0, &qword_1000101B0, (uint64_t (*)(void))sub_100005794, (uint64_t (*)(uint64_t, ValueMetadata *, uint64_t))&type metadata accessor for EntityURLRepresentation.StringInterpolation.Token);
  uint64_t v1 = v0;
  uint64_t v2 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v4 = (char *)&v9 - v3;
  sub_100007638(0, &qword_1000101B8, (uint64_t (*)(void))sub_100005794, (uint64_t (*)(uint64_t, ValueMetadata *, uint64_t))&type metadata accessor for EntityURLRepresentation.StringInterpolation);
  __chkstk_darwin(v5);
  sub_100007638(0, &qword_1000101A8, (uint64_t (*)(void))sub_100005794, (uint64_t (*)(uint64_t, ValueMetadata *, uint64_t))&type metadata accessor for EntityURLRepresentation);
  uint64_t v7 = v6;
  sub_10000756C(v6, qword_1000102D0);
  sub_100007534(v7, (uint64_t)qword_1000102D0);
  sub_100005794();
  sub_1000099D0();
  v10._object = (void *)0x800000010000AF30;
  v10._countAndFlagsBits = 0xD000000000000019;
  sub_1000099C0(v10);
  (*(void (**)(char *, void, uint64_t))(v2 + 104))(v4, enum case for EntityURLRepresentation.StringInterpolation.Token.id<A>(_:), v1);
  sub_1000099B0();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  v11._countAndFlagsBits = 0;
  v11._object = (void *)0xE000000000000000;
  sub_1000099C0(v11);
  return sub_1000099E0();
}

uint64_t sub_100005324(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  return _swift_task_switch(sub_100005348, 0, 0);
}

uint64_t sub_100005348()
{
  swift_bridgeObjectRetain();
  uint64_t v1 = (void *)swift_task_alloc();
  v0[5] = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_1000053F0;
  uint64_t v2 = v0[3];
  uint64_t v3 = v0[4];
  return sub_100007E84((uint64_t)&off_10000CB40, v2, v3);
}

uint64_t sub_1000053F0(uint64_t a1)
{
  uint64_t v3 = *(void **)(*v1 + 16);
  uint64_t v6 = *v1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  *uint64_t v3 = a1;
  uint64_t v4 = *(uint64_t (**)(void))(v6 + 8);
  return v4();
}

uint64_t sub_100005528(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  uint64_t v4 = (uint64_t (__cdecl *)())((char *)&dword_1000101F8 + dword_1000101F8);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 24) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_1000055CC;
  return v4();
}

uint64_t sub_1000055CC(uint64_t a1)
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

unint64_t sub_1000056E4()
{
  unint64_t result = qword_1000100C0;
  if (!qword_1000100C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000100C0);
  }
  return result;
}

unint64_t sub_10000573C()
{
  unint64_t result = qword_1000100C8;
  if (!qword_1000100C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000100C8);
  }
  return result;
}

unint64_t sub_100005794()
{
  unint64_t result = qword_1000100D0[0];
  if (!qword_1000100D0[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_1000100D0);
  }
  return result;
}

uint64_t sub_1000057EC(uint64_t a1)
{
  uint64_t v5 = (uint64_t (*)(uint64_t))((char *)&dword_1000101F0 + dword_1000101F0);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_100005894;
  return v5(a1);
}

uint64_t sub_100005894(uint64_t a1)
{
  uint64_t v7 = *v2;
  uint64_t v4 = swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(uint64_t))(v7 + 8);
  if (!v1) {
    uint64_t v4 = a1;
  }
  return v5(v4);
}

uint64_t sub_100005994(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  uint64_t v4 = (uint64_t (__cdecl *)())((char *)&dword_1000101C0 + dword_1000101C0);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 24) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_100008A40;
  return v4();
}

unint64_t sub_100005A3C()
{
  unint64_t result = qword_1000100E8;
  if (!qword_1000100E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000100E8);
  }
  return result;
}

unint64_t sub_100005A94()
{
  unint64_t result = qword_1000100F0;
  if (!qword_1000100F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000100F0);
  }
  return result;
}

unint64_t sub_100005AEC()
{
  unint64_t result = qword_1000100F8;
  if (!qword_1000100F8)
  {
    sub_100007DA0(255, qword_100010100, (uint64_t)&type metadata for HealthSettingsDeepLink, (uint64_t (*)(void, uint64_t))&type metadata accessor for Array);
    sub_100005A94();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000100F8);
  }
  return result;
}

uint64_t sub_100005B80(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_100004D78();
  *uint64_t v5 = v2;
  v5[1] = sub_100005C34;
  return EntityQuery.results()(a1, a2, v6);
}

uint64_t sub_100005C34()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_100005D28(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return _swift_task_switch(sub_100005D48, 0, 0);
}

uint64_t sub_100005D48()
{
  **(unsigned char **)(v0 + 16) = 0;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

unint64_t sub_100005D70()
{
  unint64_t result = qword_100010118;
  if (!qword_100010118)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010118);
  }
  return result;
}

uint64_t sub_100005DC4@<X0>(uint64_t a1@<X8>)
{
  if (qword_100010040 != -1) {
    swift_once();
  }
  sub_100007638(0, &qword_1000101A8, (uint64_t (*)(void))sub_100005794, (uint64_t (*)(uint64_t, ValueMetadata *, uint64_t))&type metadata accessor for EntityURLRepresentation);
  uint64_t v3 = v2;
  uint64_t v4 = sub_100007534(v2, (uint64_t)qword_1000102D0);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);

  return v5(a1, v4, v3);
}

unint64_t sub_100005EA0()
{
  unint64_t result = qword_100010120;
  if (!qword_100010120)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010120);
  }
  return result;
}

unint64_t sub_100005EF8()
{
  unint64_t result = qword_100010128;
  if (!qword_100010128)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010128);
  }
  return result;
}

unint64_t sub_100005F50()
{
  unint64_t result = qword_100010130;
  if (!qword_100010130)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010130);
  }
  return result;
}

uint64_t sub_100005FA4()
{
  sub_1000075D0();
  uint64_t v2 = sub_100009980();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
  return sub_100007624(v3, v0, v2, v1);
}

unint64_t sub_10000603C()
{
  unint64_t result = qword_100010140;
  if (!qword_100010140)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010140);
  }
  return result;
}

unint64_t sub_100006094()
{
  unint64_t result = qword_100010148;
  if (!qword_100010148)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010148);
  }
  return result;
}

unint64_t sub_1000060EC()
{
  unint64_t result = qword_100010150;
  if (!qword_100010150)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010150);
  }
  return result;
}

unint64_t sub_100006144()
{
  unint64_t result = qword_100010158;
  if (!qword_100010158)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010158);
  }
  return result;
}

void sub_100006198(unsigned char *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_1000061A4@<X0>(uint64_t a1@<X8>)
{
  return sub_1000061DC(&qword_100010038, (uint64_t (*)(void))&type metadata accessor for TypeDisplayRepresentation, (uint64_t)qword_1000102B8, a1);
}

uint64_t sub_1000061DC@<X0>(void *a1@<X2>, uint64_t (*a2)(void)@<X3>, uint64_t a3@<X4>, uint64_t a4@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v7 = a2(0);
  uint64_t v8 = sub_100007534(v7, a3);
  uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 16);

  return v9(a4, v8, v7);
}

unint64_t sub_100006284()
{
  unint64_t result = qword_100010160;
  if (!qword_100010160)
  {
    sub_100007638(255, &qword_100010168, (uint64_t (*)(void))sub_100005A94, (uint64_t (*)(uint64_t, ValueMetadata *, uint64_t))&type metadata accessor for EmptyResolverSpecification);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010160);
  }
  return result;
}

uint64_t sub_10000630C(uint64_t a1)
{
  unint64_t v2 = sub_100005794();

  return static AppEntity.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_10000635C()
{
  unint64_t result = qword_100010170;
  if (!qword_100010170)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010170);
  }
  return result;
}

uint64_t sub_1000063B0@<X0>(uint64_t a1@<X8>)
{
  return sub_100002418((void (*)(char *, uint64_t, uint64_t))*v1, a1);
}

uint64_t sub_1000063B8(uint64_t a1)
{
  unint64_t v2 = sub_1000060EC();

  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

ValueMetadata *type metadata accessor for HealthSettingsDeepLink.AvailableHealthSettingsQuery()
{
  return &type metadata for HealthSettingsDeepLink.AvailableHealthSettingsQuery;
}

unsigned char *initializeBufferWithCopyOfBuffer for SettingsPane(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t sub_10000642C(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_100006434(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for SettingsPane()
{
  return &type metadata for SettingsPane;
}

uint64_t _s23HealthStandaloneIntents12SettingsPaneOwet_0(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *_s23HealthStandaloneIntents12SettingsPaneOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1000065A8);
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

ValueMetadata *type metadata accessor for HealthSettingsDeepLink()
{
  return &type metadata for HealthSettingsDeepLink;
}

ValueMetadata *type metadata accessor for OpenHealthSettingsIntent()
{
  return &type metadata for OpenHealthSettingsIntent;
}

uint64_t sub_1000065F0()
{
  uint64_t v0 = sub_100009AE0();
  sub_10000756C(v0, qword_1000102E8);
  sub_100007534(v0, (uint64_t)qword_1000102E8);
  return sub_100009AD0();
}

char *sub_100006674(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    int64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = *((void *)a4 + 3);
  int64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      int64_t v7 = a2;
    }
LABEL_8:
    int64_t v8 = *((void *)a4 + 2);
    if (v7 <= v8) {
      int64_t v9 = *((void *)a4 + 2);
    }
    else {
      int64_t v9 = v7;
    }
    if (v9)
    {
      sub_100007DA0(0, &qword_1000101D0, (uint64_t)&type metadata for HealthSettingsDeepLink, (uint64_t (*)(void, uint64_t))&type metadata accessor for _ContiguousArrayStorage);
      Swift::String v10 = (char *)swift_allocObject();
      size_t v11 = j__malloc_size(v10);
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * v11 - 64;
      uint64_t v12 = v10 + 32;
      if (v5)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[v8 + 32]) {
          memmove(v12, a4 + 32, v8);
        }
        *((void *)a4 + 2) = 0;
        goto LABEL_22;
      }
    }
    else
    {
      Swift::String v10 = (char *)&_swiftEmptyArrayStorage;
      uint64_t v12 = (char *)&_swiftEmptyArrayStorage + 32;
      if (result) {
        goto LABEL_13;
      }
    }
    sub_1000078E8(0, v8, v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_100006790(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_100006864(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_100007D44((uint64_t)v12, *a3);
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
      sub_100007D44((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_100007CF4((uint64_t)v12);
  return v7;
}

uint64_t sub_100006864(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_100009B80();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_100006A20(a5, a6);
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
  uint64_t v8 = sub_100009BB0();
  if (!v8)
  {
    sub_100009BC0();
    __break(1u);
LABEL_17:
    uint64_t result = sub_100009BE0();
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

uint64_t sub_100006A20(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_100006AB8(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_100006CB8(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_100006CB8(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_100006AB8(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_100006C30(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_100009BA0();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_100009BC0();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_100009B30();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_100009BE0();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_100009BC0();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_100006C30(uint64_t a1, uint64_t a2)
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
  sub_100007DA0(0, &qword_1000101D8, (uint64_t)&type metadata for UInt8, (uint64_t (*)(void, uint64_t))&type metadata accessor for _ContiguousArrayStorage);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_100006CB8(char a1, int64_t a2, char a3, char *a4)
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
    sub_100007DA0(0, &qword_1000101D8, (uint64_t)&type metadata for UInt8, (uint64_t (*)(void, uint64_t))&type metadata accessor for _ContiguousArrayStorage);
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
  uint64_t result = sub_100009BE0();
  __break(1u);
  return result;
}

uint64_t sub_100006E28(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_100006E48(a1, a2, a3, *v3);
  *unint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_100006E48(char a1, int64_t a2, char a3, char *a4)
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
    sub_100007DA0(0, &qword_1000101D0, (uint64_t)&type metadata for HealthSettingsDeepLink, (uint64_t (*)(void, uint64_t))&type metadata accessor for _ContiguousArrayStorage);
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
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_100009BE0();
  __break(1u);
  return result;
}

uint64_t sub_100006FB8()
{
  uint64_t v0 = sub_1000099F0();
  uint64_t v26 = *(void *)(v0 - 8);
  uint64_t v27 = v0;
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v25 = (char *)&v21 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100008948(0, &qword_100010178, (uint64_t (*)(uint64_t))&type metadata accessor for IntentDialog, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
  uint64_t v2 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v24 = (char *)&v21 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v2);
  uint64_t v23 = (char *)&v21 - v4;
  sub_100008948(0, &qword_100010180, (uint64_t (*)(uint64_t))&type metadata accessor for LocalizedStringResource, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
  __chkstk_darwin(v5 - 8);
  uint64_t v22 = (char *)&v21 - v6;
  uint64_t v7 = sub_100009A50();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_100009AA0();
  __chkstk_darwin(v11 - 8);
  uint64_t v12 = sub_100009B00();
  uint64_t v13 = __chkstk_darwin(v12 - 8);
  __chkstk_darwin(v13);
  uint64_t v21 = sub_100009A70();
  uint64_t v14 = *(void *)(v21 - 8);
  __chkstk_darwin(v21);
  sub_100009AF0();
  sub_100009A90();
  uint64_t v15 = enum case for LocalizedStringResource.BundleDescription.main(_:);
  uint64_t v16 = *(void (**)(char *, uint64_t, uint64_t))(v8 + 104);
  v16(v10, enum case for LocalizedStringResource.BundleDescription.main(_:), v7);
  sub_100009A80();
  sub_100009AF0();
  sub_100007638(0, &qword_100010188, (uint64_t (*)(void))sub_100005A94, (uint64_t (*)(uint64_t, ValueMetadata *, uint64_t))&type metadata accessor for IntentParameter);
  sub_100009A90();
  v16(v10, v15, v7);
  uint64_t v17 = v22;
  sub_100009A80();
  (*(void (**)(char *, void, uint64_t, uint64_t))(v14 + 56))(v17, 0, 1, v21);
  char v28 = 5;
  uint64_t v18 = sub_100009790();
  uint64_t v19 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56);
  v19(v23, 1, 1, v18);
  v19(v24, 1, 1, v18);
  (*(void (**)(char *, void, uint64_t))(v26 + 104))(v25, enum case for InputConnectionBehavior.default(_:), v27);
  sub_100005794();
  return sub_1000097D0();
}

uint64_t sub_100007534(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t *sub_10000756C(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

unint64_t sub_1000075D0()
{
  unint64_t result = qword_1000101A0;
  if (!qword_1000101A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000101A0);
  }
  return result;
}

uint64_t sub_100007624(uint64_t (*a1)(uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return a1(a3, a4);
}

void sub_100007638(uint64_t a1, unint64_t *a2, uint64_t (*a3)(void), uint64_t (*a4)(uint64_t, ValueMetadata *, uint64_t))
{
  if (!*a2)
  {
    uint64_t v7 = a3();
    unint64_t v8 = a4(a1, &type metadata for HealthSettingsDeepLink, v7);
    if (!v9) {
      atomic_store(v8, a2);
    }
  }
}

uint64_t sub_1000076A0(uint64_t a1, void *a2)
{
  v6._countAndFlagsBits = a1;
  v3._rawValue = &off_10000CA58;
  v6._object = a2;
  unint64_t v4 = sub_100009BF0(v3, v6);
  swift_bridgeObjectRelease();
  if (v4 >= 5) {
    return 5;
  }
  else {
    return v4;
  }
}

uint64_t sub_1000076EC()
{
  return _swift_task_switch(sub_100007708, 0, 0);
}

uint64_t sub_100007708()
{
  sub_100006E28(0, 5, 0);
  unint64_t v2 = *((void *)&_swiftEmptyArrayStorage + 2);
  unint64_t v1 = *((void *)&_swiftEmptyArrayStorage + 3);
  int64_t v3 = v1 >> 1;
  unint64_t v4 = v2 + 1;
  if (v1 >> 1 <= v2)
  {
    sub_100006E28(v1 > 1, v2 + 1, 1);
    unint64_t v1 = *((void *)&_swiftEmptyArrayStorage + 3);
    int64_t v3 = v1 >> 1;
  }
  *((void *)&_swiftEmptyArrayStorage + 2) = v4;
  *((unsigned char *)&_swiftEmptyArrayStorage + v2 + 32) = 0;
  unint64_t v5 = v2 + 2;
  if (v3 < (uint64_t)(v2 + 2))
  {
    sub_100006E28(v1 > 1, v2 + 2, 1);
    unint64_t v1 = *((void *)&_swiftEmptyArrayStorage + 3);
    int64_t v3 = v1 >> 1;
  }
  *((void *)&_swiftEmptyArrayStorage + 2) = v5;
  *((unsigned char *)&_swiftEmptyArrayStorage + v4 + 32) = 1;
  unint64_t v6 = v2 + 3;
  if (v3 < (uint64_t)(v2 + 3)) {
    sub_100006E28(v1 > 1, v2 + 3, 1);
  }
  *((void *)&_swiftEmptyArrayStorage + 2) = v6;
  *((unsigned char *)&_swiftEmptyArrayStorage + v5 + 32) = 2;
  unint64_t v7 = *((void *)&_swiftEmptyArrayStorage + 3);
  int64_t v8 = v7 >> 1;
  unint64_t v9 = v2 + 4;
  if ((uint64_t)(v7 >> 1) < (uint64_t)(v2 + 4))
  {
    sub_100006E28(v7 > 1, v2 + 4, 1);
    unint64_t v7 = *((void *)&_swiftEmptyArrayStorage + 3);
    int64_t v8 = v7 >> 1;
  }
  *((void *)&_swiftEmptyArrayStorage + 2) = v9;
  *((unsigned char *)&_swiftEmptyArrayStorage + v6 + 32) = 3;
  if (v8 < (uint64_t)(v2 + 5)) {
    sub_100006E28(v7 > 1, v2 + 5, 1);
  }
  *((void *)&_swiftEmptyArrayStorage + 2) = v2 + 5;
  *((unsigned char *)&_swiftEmptyArrayStorage + v9 + 32) = 4;
  uint64_t v10 = *(uint64_t (**)(void))(v0 + 8);
  return v10();
}

char *sub_1000078E8(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  size_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = (char *)(a4 + a1 + 32);
    unint64_t v6 = &__dst[v4];
    if (v5 >= &__dst[v4] || &v5[v4] <= __dst)
    {
      memcpy(__dst, v5, v4);
      return v6;
    }
  }
  unint64_t result = (char *)sub_100009BE0();
  __break(1u);
  return result;
}

uint64_t sub_1000079D0()
{
  return _swift_task_switch(sub_1000079EC, 0, 0);
}

uint64_t sub_1000079EC()
{
  *(void *)(v0 + 16) = 0;
  *(void *)(v0 + 24) = &_swiftEmptyArrayStorage;
  *(unsigned char *)(v0 + 40) = 0;
  unint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 32) = v1;
  *unint64_t v1 = v0;
  v1[1] = sub_100007A8C;
  return sub_100003D50(0);
}

uint64_t sub_100007A8C(char a1)
{
  *(unsigned char *)(*(void *)v1 + 41) = a1;
  swift_task_dealloc();
  return _swift_task_switch(sub_100007B8C, 0, 0);
}

uint64_t sub_100007B8C()
{
  uint64_t v1 = *(char **)(v0 + 24);
  if (*(unsigned char *)(v0 + 41))
  {
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v1 = *(char **)(v0 + 24);
    if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
      uint64_t v1 = sub_100006674(0, *((void *)v1 + 2) + 1, 1, v1);
    }
    unint64_t v4 = *((void *)v1 + 2);
    unint64_t v3 = *((void *)v1 + 3);
    if (v4 >= v3 >> 1) {
      uint64_t v1 = sub_100006674((char *)(v3 > 1), v4 + 1, 1, v1);
    }
    char v5 = *(unsigned char *)(v0 + 40);
    *((void *)v1 + 2) = v4 + 1;
    v1[v4 + 32] = v5;
  }
  uint64_t v6 = *(void *)(v0 + 16) + 1;
  if (*(void *)(v0 + 16) == 4)
  {
    unint64_t v7 = *(uint64_t (**)(char *))(v0 + 8);
    return v7(v1);
  }
  else
  {
    *(void *)(v0 + 16) = v6;
    *(void *)(v0 + 24) = v1;
    char v9 = *((unsigned char *)&off_10000CB18 + v6 + 32);
    *(unsigned char *)(v0 + 40) = v9;
    uint64_t v10 = (void *)swift_task_alloc();
    *(void *)(v0 + 32) = v10;
    *uint64_t v10 = v0;
    v10[1] = sub_100007A8C;
    return sub_100003D50(v9);
  }
}

uint64_t sub_100007CF4(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_100007D44(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void sub_100007DA0(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t (*a4)(void, uint64_t))
{
  if (!*a2)
  {
    unint64_t v5 = a4(0, a3);
    if (!v6) {
      atomic_store(v5, a2);
    }
  }
}

unint64_t sub_100007DEC()
{
  unint64_t result = qword_1000101E0;
  if (!qword_1000101E0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1000101E0);
  }
  return result;
}

unint64_t sub_100007E2C()
{
  unint64_t result = qword_1000101E8;
  if (!qword_1000101E8)
  {
    unint64_t result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_1000101E8);
  }
  return result;
}

uint64_t sub_100007E84(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[7] = a2;
  v3[8] = a3;
  v3[6] = a1;
  sub_100009AA0();
  v3[9] = swift_task_alloc();
  uint64_t v4 = sub_100009950();
  v3[10] = v4;
  v3[11] = *(void *)(v4 - 8);
  v3[12] = swift_task_alloc();
  uint64_t v5 = sub_100009A70();
  v3[13] = v5;
  v3[14] = *(void *)(v5 - 8);
  v3[15] = swift_task_alloc();
  v3[16] = swift_task_alloc();
  return _swift_task_switch(sub_100007FE0, 0, 0);
}

uint64_t sub_100007FE0()
{
  uint64_t v1 = *(void *)(v0 + 48);
  uint64_t v2 = *(void *)(v1 + 16);
  *(void *)(v0 + 136) = v2;
  if (v2)
  {
    *(void *)(v0 + 144) = 0;
    *(void *)(v0 + 152) = &_swiftEmptyArrayStorage;
    char v3 = *(unsigned char *)(v1 + 32);
    *(unsigned char *)(v0 + 168) = v3;
    swift_bridgeObjectRetain();
    uint64_t v4 = (void *)swift_task_alloc();
    *(void *)(v0 + 160) = v4;
    void *v4 = v0;
    v4[1] = sub_100008108;
    return sub_100003D50(v3);
  }
  else
  {
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v6 = *(uint64_t (**)(void *))(v0 + 8);
    return v6(&_swiftEmptyArrayStorage);
  }
}

uint64_t sub_100008108(char a1)
{
  *(unsigned char *)(*(void *)v1 + 169) = a1;
  swift_task_dealloc();
  return _swift_task_switch(sub_100008208, 0, 0);
}

uint64_t sub_100008208()
{
  if (*(unsigned char *)(v0 + 169))
  {
    uint64_t v2 = *(void *)(v0 + 120);
    uint64_t v1 = *(void *)(v0 + 128);
    uint64_t v3 = *(void *)(v0 + 104);
    uint64_t v4 = *(void *)(v0 + 112);
    uint64_t v6 = *(void *)(v0 + 88);
    uint64_t v5 = *(void *)(v0 + 96);
    uint64_t v7 = *(void *)(v0 + 80);
    uint64_t v8 = *(void *)(v0 + 56);
    uint64_t v20 = *(void *)(v0 + 64);
    sub_100002418((void (*)(char *, uint64_t, uint64_t))*(unsigned __int8 *)(v0 + 168), v5);
    sub_100009930();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);
    sub_100009A90();
    sub_100009A60();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v2, v1, v3);
    *(void *)(v0 + 16) = sub_100009B10();
    *(void *)(v0 + 24) = v9;
    *(void *)(v0 + 32) = v8;
    *(void *)(v0 + 40) = v20;
    sub_10000884C();
    LOBYTE(v7) = sub_100009B90();
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v1, v3);
    swift_bridgeObjectRelease();
    uint64_t v10 = *(char **)(v0 + 152);
    if (v7)
    {
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v10 = *(char **)(v0 + 152);
      if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
        uint64_t v10 = sub_100006674(0, *((void *)v10 + 2) + 1, 1, *(char **)(v0 + 152));
      }
      unint64_t v13 = *((void *)v10 + 2);
      unint64_t v12 = *((void *)v10 + 3);
      if (v13 >= v12 >> 1) {
        uint64_t v10 = sub_100006674((char *)(v12 > 1), v13 + 1, 1, v10);
      }
      char v14 = *(unsigned char *)(v0 + 168);
      *((void *)v10 + 2) = v13 + 1;
      v10[v13 + 32] = v14;
    }
  }
  else
  {
    uint64_t v10 = *(char **)(v0 + 152);
  }
  uint64_t v15 = *(void *)(v0 + 144) + 1;
  if (v15 == *(void *)(v0 + 136))
  {
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v16 = *(uint64_t (**)(char *))(v0 + 8);
    return v16(v10);
  }
  else
  {
    *(void *)(v0 + 144) = v15;
    *(void *)(v0 + 152) = v10;
    char v18 = *(unsigned char *)(*(void *)(v0 + 48) + v15 + 32);
    *(unsigned char *)(v0 + 168) = v18;
    uint64_t v19 = (void *)swift_task_alloc();
    *(void *)(v0 + 160) = v19;
    *uint64_t v19 = v0;
    v19[1] = sub_100008108;
    return sub_100003D50(v18);
  }
}

uint64_t sub_1000084B8(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return _swift_task_switch(sub_1000084D8, 0, 0);
}

uint64_t sub_1000084D8()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = *(void *)(v1 + 16);
  *(void *)(v0 + 24) = v2;
  if (v2)
  {
    *(void *)(v0 + 32) = 0;
    *(void *)(v0 + 40) = &_swiftEmptyArrayStorage;
    char v3 = *(unsigned char *)(v1 + 32);
    *(unsigned char *)(v0 + 56) = v3;
    swift_bridgeObjectRetain();
    uint64_t v4 = (void *)swift_task_alloc();
    *(void *)(v0 + 48) = v4;
    void *v4 = v0;
    v4[1] = sub_1000085D0;
    return sub_100003D50(v3);
  }
  else
  {
    uint64_t v6 = *(uint64_t (**)(void *))(v0 + 8);
    return v6(&_swiftEmptyArrayStorage);
  }
}

uint64_t sub_1000085D0(char a1)
{
  *(unsigned char *)(*(void *)v1 + 57) = a1;
  swift_task_dealloc();
  return _swift_task_switch(sub_1000086D0, 0, 0);
}

uint64_t sub_1000086D0()
{
  uint64_t v1 = *(char **)(v0 + 40);
  if (*(unsigned char *)(v0 + 57))
  {
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v1 = *(char **)(v0 + 40);
    if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
      uint64_t v1 = sub_100006674(0, *((void *)v1 + 2) + 1, 1, *(char **)(v0 + 40));
    }
    unint64_t v4 = *((void *)v1 + 2);
    unint64_t v3 = *((void *)v1 + 3);
    if (v4 >= v3 >> 1) {
      uint64_t v1 = sub_100006674((char *)(v3 > 1), v4 + 1, 1, v1);
    }
    char v5 = *(unsigned char *)(v0 + 56);
    *((void *)v1 + 2) = v4 + 1;
    v1[v4 + 32] = v5;
  }
  uint64_t v6 = *(void *)(v0 + 32) + 1;
  if (v6 == *(void *)(v0 + 24))
  {
    swift_bridgeObjectRelease();
    uint64_t v7 = *(uint64_t (**)(char *))(v0 + 8);
    return v7(v1);
  }
  else
  {
    *(void *)(v0 + 32) = v6;
    *(void *)(v0 + 40) = v1;
    char v9 = *(unsigned char *)(*(void *)(v0 + 16) + v6 + 32);
    *(unsigned char *)(v0 + 56) = v9;
    uint64_t v10 = (void *)swift_task_alloc();
    *(void *)(v0 + 48) = v10;
    *uint64_t v10 = v0;
    v10[1] = sub_1000085D0;
    return sub_100003D50(v9);
  }
}

unint64_t sub_10000884C()
{
  unint64_t result = qword_100010208;
  if (!qword_100010208)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010208);
  }
  return result;
}

unint64_t sub_1000088A0()
{
  unint64_t result = qword_100010210;
  if (!qword_100010210)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010210);
  }
  return result;
}

unint64_t sub_1000088F4()
{
  unint64_t result = qword_100010218;
  if (!qword_100010218)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010218);
  }
  return result;
}

void sub_100008948(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v7 = a3(255);
    unint64_t v8 = a4(a1, v7);
    if (!v9) {
      atomic_store(v8, a2);
    }
  }
}

uint64_t sub_1000089AC(uint64_t a1, uint64_t a2)
{
  sub_100008948(0, &qword_100010220, (uint64_t (*)(uint64_t))&type metadata accessor for IntentDescription, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100008A44(uint64_t a1)
{
  unint64_t v2 = sub_100008B94();

  return AppIntentsExtension.configuration.getter(a1, v2);
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

unint64_t sub_100008AEC()
{
  unint64_t result = qword_100010228;
  if (!qword_100010228)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010228);
  }
  return result;
}

uint64_t sub_100008B44()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_100008B94()
{
  unint64_t result = qword_100010230;
  if (!qword_100010230)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010230);
  }
  return result;
}

ValueMetadata *type metadata accessor for HealthStandaloneIntentsExtension()
{
  return &type metadata for HealthStandaloneIntentsExtension;
}

uint64_t sub_100008BF8(uint64_t a1)
{
  uint64_t v13 = a1;
  sub_100009628(0, &qword_100010268, (uint64_t (*)(uint64_t, ValueMetadata *, unint64_t))&type metadata accessor for _AssistantIntent.Phrase);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v15 = v1;
  uint64_t v16 = v2;
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)&v13 - v3;
  sub_100009628(0, &qword_100010270, (uint64_t (*)(uint64_t, ValueMetadata *, unint64_t))&type metadata accessor for _AssistantIntent.Phrase.StringInterpolation);
  uint64_t v6 = __chkstk_darwin(v5);
  __chkstk_darwin(v6);
  sub_100001EB0();
  sub_100009890();
  v17._countAndFlagsBits = 0x206E65704FLL;
  v17._object = (void *)0xE500000000000000;
  sub_100009880(v17);
  swift_getKeyPath();
  sub_100005A94();
  sub_1000097E0();
  swift_release();
  sub_100009870();
  swift_release();
  v18._countAndFlagsBits = 0x74746553206E6920;
  v18._object = (void *)0xEC00000073676E69;
  sub_100009880(v18);
  sub_1000098A0();
  uint64_t v14 = sub_100009800();
  uint64_t v7 = v15;
  unint64_t v8 = *(void (**)(char *, uint64_t))(v16 + 8);
  v16 += 8;
  v8(v4, v15);
  sub_100009890();
  v19._countAndFlagsBits = 0x20656D20776F6853;
  v19._object = (void *)0xEB0000000020796DLL;
  sub_100009880(v19);
  swift_getKeyPath();
  sub_1000097E0();
  swift_release();
  sub_100009870();
  swift_release();
  v20._countAndFlagsBits = 0;
  v20._object = (void *)0xE000000000000000;
  sub_100009880(v20);
  sub_1000098A0();
  uint64_t v9 = sub_100009800();
  v8(v4, v7);
  sub_1000094C4(0, &qword_100010278, (uint64_t (*)(uint64_t))sub_10000968C, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for _ContiguousArrayStorage);
  uint64_t v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_100009F20;
  *(void *)(v10 + 32) = v14;
  *(void *)(v10 + 40) = v9;
  uint64_t v11 = sub_1000097F0();
  swift_bridgeObjectRelease();
  return v11;
}

uint64_t sub_100008FA8()
{
  uint64_t v0 = sub_100009860();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  sub_100005A94();
  sub_1000097E0();
  swift_release();
  sub_100001EB0();
  sub_100009850();
  uint64_t v4 = sub_100009840();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  sub_1000094C4(0, &qword_100010248, (uint64_t (*)(uint64_t))sub_10000959C, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for _ContiguousArrayStorage);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_100009F30;
  *(void *)(v5 + 32) = v4;
  uint64_t v6 = sub_100009830();
  swift_bridgeObjectRelease();
  return v6;
}

uint64_t sub_10000913C()
{
  uint64_t v0 = sub_100009820();
  uint64_t v1 = sub_100009820();
  uint64_t v2 = sub_100009820();
  uint64_t v3 = sub_100009820();
  uint64_t v4 = sub_100009820();
  sub_1000094C4(0, &qword_100010258, (uint64_t (*)(uint64_t))sub_1000095D0, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for _ContiguousArrayStorage);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_10000A700;
  *(void *)(v5 + 32) = v0;
  *(void *)(v5 + 40) = v1;
  *(void *)(v5 + 48) = v2;
  *(void *)(v5 + 56) = v3;
  *(void *)(v5 + 64) = v4;
  uint64_t v6 = sub_100009810();
  swift_bridgeObjectRelease();
  return v6;
}

void sub_100009284()
{
  qword_100010300 = (uint64_t)&_swiftEmptyArrayStorage;
}

uint64_t sub_100009298()
{
  uint64_t v0 = sub_1000098D0();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8[1] = sub_100006FB8();
  sub_100001EB0();
  sub_1000098E0();
  uint64_t v4 = sub_1000098C0();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  sub_1000094C4(0, &qword_100010238, (uint64_t (*)(uint64_t))sub_100009490, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for _ContiguousArrayStorage);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_100009F30;
  *(void *)(v5 + 32) = v4;
  uint64_t v6 = sub_1000098B0();
  swift_bridgeObjectRelease();
  return v6;
}

uint64_t sub_100009424()
{
  if (qword_100010050 != -1) {
    swift_once();
  }

  return swift_bridgeObjectRetain();
}

ValueMetadata *type metadata accessor for HealthStandaloneIntentPhrases()
{
  return &type metadata for HealthStandaloneIntentPhrases;
}

void sub_100009490(uint64_t a1)
{
}

void sub_1000094C4(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v7 = a3(255);
    unint64_t v8 = a4(a1, v7);
    if (!v9) {
      atomic_store(v8, a2);
    }
  }
}

uint64_t sub_100009528@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_1000097B0();
  *a1 = v3;
  return result;
}

uint64_t sub_100009564()
{
  return sub_1000097C0();
}

void sub_10000959C(uint64_t a1)
{
}

void sub_1000095D0()
{
  if (!qword_100010260)
  {
    unint64_t v0 = sub_100009B50();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_100010260);
    }
  }
}

void sub_100009628(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, ValueMetadata *, unint64_t))
{
  if (!*a2)
  {
    unint64_t v6 = sub_100001EB0();
    unint64_t v7 = a3(a1, &type metadata for OpenHealthSettingsIntent, v6);
    if (!v8) {
      atomic_store(v7, a2);
    }
  }
}

void sub_10000968C()
{
  if (!qword_100010280)
  {
    sub_100009628(255, &qword_100010268, (uint64_t (*)(uint64_t, ValueMetadata *, unint64_t))&type metadata accessor for _AssistantIntent.Phrase);
    unint64_t v0 = sub_100009B50();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_100010280);
    }
  }
}

uint64_t sub_100009700()
{
  return static _AssistantIntentsProvider.uniqueEntities.getter();
}

uint64_t sub_100009710()
{
  return static AppIntentInternal.sideEffect.getter();
}

uint64_t sub_100009720()
{
  return static AppIntentInternal.shortcutsMetadata.getter();
}

uint64_t sub_100009740()
{
  return static AppIntent.parameterSummary.getter();
}

uint64_t sub_100009750()
{
  return static AppIntent.authenticationPolicy.getter();
}

uint64_t sub_100009790()
{
  return type metadata accessor for IntentDialog();
}

uint64_t sub_1000097A0()
{
  return IntentParameter.wrappedValue.modify();
}

uint64_t sub_1000097B0()
{
  return IntentParameter.wrappedValue.getter();
}

uint64_t sub_1000097C0()
{
  return IntentParameter.wrappedValue.setter();
}

uint64_t sub_1000097D0()
{
  return IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:)();
}

uint64_t sub_1000097E0()
{
  return _AssistantIntent.IntentProjection.subscript.getter();
}

uint64_t sub_1000097F0()
{
  return static _AssistantIntent.PhraseBuilder.buildBlock(_:)();
}

uint64_t sub_100009800()
{
  return static _AssistantIntent.PhraseBuilder.buildExpression(_:)();
}

uint64_t sub_100009810()
{
  return static _AssistantIntent.StringValueBuilder.buildBlock(_:)();
}

uint64_t sub_100009820()
{
  return static _AssistantIntent.StringValueBuilder.buildExpression(_:)();
}

uint64_t sub_100009830()
{
  return static _AssistantIntent.ParameterValueBuilder.buildBlock(_:)();
}

uint64_t sub_100009840()
{
  return static _AssistantIntent.ParameterValueBuilder.buildExpression(_:)();
}

uint64_t sub_100009850()
{
  return _AssistantIntent.Value.init<A>(for:builder:)();
}

uint64_t sub_100009860()
{
  return type metadata accessor for _AssistantIntent.Value();
}

uint64_t sub_100009870()
{
  return _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)();
}

void sub_100009880(Swift::String a1)
{
}

uint64_t sub_100009890()
{
  return _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)();
}

uint64_t sub_1000098A0()
{
  return _AssistantIntent.Phrase.init(stringInterpolation:)();
}

uint64_t sub_1000098B0()
{
  return static _AssistantIntent.Builder.buildBlock(_:)();
}

uint64_t sub_1000098C0()
{
  return static _AssistantIntent.Builder.buildExpression(_:)();
}

uint64_t sub_1000098D0()
{
  return type metadata accessor for _AssistantIntent();
}

uint64_t sub_1000098E0()
{
  return _AssistantIntent.init<A>(_:phrases:parameterValues:)();
}

uint64_t sub_1000098F0()
{
  return type metadata accessor for IntentDescription();
}

uint64_t sub_100009900()
{
  return IntentDescription.init(_:categoryName:searchKeywords:)();
}

uint64_t sub_100009910()
{
  return DisplayRepresentation.Image.init(appBundleIdentifier:)();
}

uint64_t sub_100009920()
{
  return type metadata accessor for DisplayRepresentation.Image();
}

uint64_t sub_100009930()
{
  return DisplayRepresentation.title.getter();
}

uint64_t sub_100009940()
{
  return DisplayRepresentation.init(title:subtitle:image:synonyms:descriptionText:)();
}

uint64_t sub_100009950()
{
  return type metadata accessor for DisplayRepresentation();
}

uint64_t sub_100009960()
{
  return static EnumerableEntityQuery.findIntentDescription.getter();
}

uint64_t sub_100009970()
{
  return static DynamicOptionsProvider.useForParameterResolution.getter();
}

uint64_t sub_100009980()
{
  return URLRepresentableEntity.urlRepresentationParameter.getter();
}

uint64_t sub_1000099B0()
{
  return EntityURLRepresentation.StringInterpolation.appendInterpolation(_:)();
}

void sub_1000099C0(Swift::String a1)
{
}

uint64_t sub_1000099D0()
{
  return EntityURLRepresentation.StringInterpolation.init(literalCapacity:interpolationCount:)();
}

uint64_t sub_1000099E0()
{
  return EntityURLRepresentation.init(stringInterpolation:)();
}

uint64_t sub_1000099F0()
{
  return type metadata accessor for InputConnectionBehavior();
}

uint64_t sub_100009A00()
{
  return static PersistentlyIdentifiable.persistentIdentifier.getter();
}

uint64_t sub_100009A10()
{
  return TypeDisplayRepresentation.init(name:numericFormat:)();
}

uint64_t sub_100009A20()
{
  return type metadata accessor for TypeDisplayRepresentation();
}

uint64_t sub_100009A40()
{
  return LocalizedStringResource.init(stringLiteral:)();
}

uint64_t sub_100009A50()
{
  return type metadata accessor for LocalizedStringResource.BundleDescription();
}

uint64_t sub_100009A60()
{
  return LocalizedStringResource.locale.setter();
}

uint64_t sub_100009A70()
{
  return type metadata accessor for LocalizedStringResource();
}

uint64_t sub_100009A80()
{
  return LocalizedStringResource.init(_:table:locale:bundle:comment:)();
}

uint64_t sub_100009A90()
{
  return static Locale.current.getter();
}

uint64_t sub_100009AA0()
{
  return type metadata accessor for Locale();
}

uint64_t sub_100009AB0()
{
  return static AppExtension.main()();
}

uint64_t sub_100009AC0()
{
  return Logger.logObject.getter();
}

uint64_t sub_100009AD0()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_100009AE0()
{
  return type metadata accessor for Logger();
}

uint64_t sub_100009AF0()
{
  return String.LocalizationValue.init(stringLiteral:)();
}

uint64_t sub_100009B00()
{
  return type metadata accessor for String.LocalizationValue();
}

uint64_t sub_100009B10()
{
  return String.init(localized:)();
}

uint64_t sub_100009B20()
{
  return String.hash(into:)();
}

Swift::Int sub_100009B30()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_100009B40()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100009B50()
{
  return type metadata accessor for Array();
}

uint64_t sub_100009B60()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_100009B70()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_100009B80()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_100009B90()
{
  return StringProtocol.localizedStandardContains<A>(_:)();
}

uint64_t sub_100009BA0()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_100009BB0()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_100009BC0()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_100009BD0()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_100009BE0()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

Swift::Int sub_100009BF0(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases, string);
}

uint64_t sub_100009C00()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_100009C10()
{
  return Error.localizedDescription.getter();
}

uint64_t sub_100009C20()
{
  return Hasher.init(_seed:)();
}

Swift::Int sub_100009C30()
{
  return Hasher._finalize()();
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t swift_allocError()
{
  return _swift_allocError();
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_arrayDestroy()
{
  return _swift_arrayDestroy();
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

uint64_t swift_getErrorValue()
{
  return _swift_getErrorValue();
}

uint64_t swift_getExistentialTypeMetadata()
{
  return _swift_getExistentialTypeMetadata();
}

uint64_t swift_getKeyPath()
{
  return _swift_getKeyPath();
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

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}