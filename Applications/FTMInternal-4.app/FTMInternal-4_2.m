uint64_t storeEnumTagSinglePayload for FTMCellMonitorHardwareRowCellView(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)result = a2 - 0x7FFFFFFF;
    *(void *)(result + 8) = 0;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 16) = 0;
    }
    if (a2) {
      *(void *)result = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for FTMCellMonitorHardwareRowCellView()
{
  return &type metadata for FTMCellMonitorHardwareRowCellView;
}

uint64_t sub_1001FC3D0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1001FC3EC(uint64_t *a1, void (*a2)(void *))
{
  uint64_t v4 = *a1;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *a1 = v4;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    uint64_t v4 = sub_1001B54CC(v4);
    *a1 = v4;
  }
  uint64_t v6 = *(void *)(v4 + 16);
  v8[0] = v4 + 32;
  v8[1] = v6;
  a2(v8);
  return specialized ContiguousArray._endMutation()();
}

uint64_t sub_1001FC470@<X0>(uint64_t a1@<X8>)
{
  uint64_t v31 = a1;
  uint64_t v32 = sub_100157064(&qword_1002DBDC0);
  __chkstk_darwin(v32);
  v2 = (char *)&v31 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100157064(&qword_1002DBDC8);
  __chkstk_darwin(v3);
  v5 = (char *)&v31 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100157064(&qword_1002D8098);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v31 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100157064(&qword_1002D8078);
  uint64_t v11 = __chkstk_darwin(v10);
  v13 = (char *)&v31 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  v15 = (char *)&v31 - v14;
  uint64_t v16 = sub_1002003A4();
  if (*(void *)(v16 + 16))
  {
    *(void *)v2 = static HorizontalAlignment.center.getter();
    *((void *)v2 + 1) = 0;
    v2[16] = 1;
    uint64_t v17 = sub_100157064(&qword_1002DBDD0);
    sub_1001FC820(v16, &v2[*(int *)(v17 + 44)]);
    swift_bridgeObjectRelease();
    v18 = &qword_1002DBDC0;
    sub_10015D5F4((uint64_t)v2, (uint64_t)v5, &qword_1002DBDC0);
    swift_storeEnumTagMultiPayload();
    sub_10016568C();
    sub_10015D788(&qword_1002DBDD8, &qword_1002DBDC0);
    _ConditionalContent<>.init(storage:)();
    uint64_t v19 = (uint64_t)v2;
  }
  else
  {
    swift_bridgeObjectRelease();
    ProgressView<>.init<>()();
    char v20 = static Edge.Set.vertical.getter();
    EdgeInsets.init(_all:)();
    uint64_t v22 = v21;
    uint64_t v24 = v23;
    uint64_t v26 = v25;
    uint64_t v28 = v27;
    (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v13, v9, v6);
    v29 = &v13[*(int *)(v10 + 36)];
    char *v29 = v20;
    *((void *)v29 + 1) = v22;
    *((void *)v29 + 2) = v24;
    *((void *)v29 + 3) = v26;
    *((void *)v29 + 4) = v28;
    v29[40] = 0;
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    v18 = &qword_1002D8078;
    sub_10015D474((uint64_t)v13, (uint64_t)v15, &qword_1002D8078);
    sub_10015D5F4((uint64_t)v15, (uint64_t)v5, &qword_1002D8078);
    swift_storeEnumTagMultiPayload();
    sub_10016568C();
    sub_10015D788(&qword_1002DBDD8, &qword_1002DBDC0);
    _ConditionalContent<>.init(storage:)();
    uint64_t v19 = (uint64_t)v15;
  }
  return sub_10015D658(v19, v18);
}

uint64_t sub_1001FC820@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  v73 = a2;
  uint64_t v3 = type metadata accessor for Divider();
  uint64_t v70 = *(void *)(v3 - 8);
  uint64_t v71 = v3;
  __chkstk_darwin(v3);
  v69 = (char *)&v61 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v66 = sub_100157064(&qword_1002DBDE0);
  uint64_t v5 = __chkstk_darwin(v66);
  v65 = (char *)&v61 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v72 = (uint64_t)&v61 - v7;
  uint64_t v8 = sub_100157064(&qword_1002DBDE8);
  uint64_t v9 = __chkstk_darwin(v8 - 8);
  uint64_t v62 = (uint64_t)&v61 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __chkstk_darwin(v9);
  uint64_t v61 = (uint64_t)&v61 - v12;
  uint64_t v13 = __chkstk_darwin(v11);
  v15 = (char *)&v61 - v14;
  __chkstk_darwin(v13);
  uint64_t v17 = (char *)&v61 - v16;
  uint64_t v18 = sub_100157064(&qword_1002DBDF0);
  uint64_t v19 = __chkstk_darwin(v18 - 8);
  uint64_t v21 = (char *)&v61 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v19);
  uint64_t v74 = (uint64_t)&v61 - v22;
  uint64_t v23 = sub_100157064(&qword_1002DBDF8);
  uint64_t v67 = *(void *)(v23 - 8);
  uint64_t v68 = v23;
  uint64_t v24 = __chkstk_darwin(v23);
  v64 = (char *)&v61 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v24);
  uint64_t v27 = (char *)&v61 - v26;
  uint64_t v75 = a1;
  *(void *)(swift_allocObject() + 16) = a1;
  swift_bridgeObjectRetain_n();
  sub_100157064(&qword_1002DBE00);
  type metadata accessor for UUID();
  sub_100157064(&qword_1002DBE08);
  sub_10015D788(&qword_1002DBE10, &qword_1002DBE00);
  sub_10015D788(&qword_1002DBE18, &qword_1002DBE08);
  sub_100201714();
  v63 = v27;
  ForEach<>.init(_:content:)();
  if (qword_1002D7B18 != -1) {
    swift_once();
  }
  uint64_t v28 = qword_1002E31C8;
  if (*(unsigned char *)(qword_1002E31C8 + 24) == 1)
  {
    *(void *)uint64_t v17 = static VerticalAlignment.center.getter();
    *((void *)v17 + 1) = 0;
    v17[16] = 1;
    uint64_t v29 = sub_100157064(&qword_1002DBE38);
    sub_1001FDD38(v28, (uint64_t *)&v17[*(int *)(v29 + 44)]);
    *(void *)v15 = static VerticalAlignment.center.getter();
    *((void *)v15 + 1) = 0;
    v15[16] = 1;
    sub_1001FE234(v28, (uint64_t *)&v15[*(int *)(v29 + 44)]);
    uint64_t v30 = v61;
    sub_10015D5F4((uint64_t)v17, v61, &qword_1002DBDE8);
    uint64_t v31 = v62;
    sub_10015D5F4((uint64_t)v15, v62, &qword_1002DBDE8);
    sub_10015D5F4(v30, (uint64_t)v21, &qword_1002DBDE8);
    uint64_t v32 = sub_100157064(&qword_1002DBE40);
    sub_10015D5F4(v31, (uint64_t)&v21[*(int *)(v32 + 48)], &qword_1002DBDE8);
    sub_10015D658((uint64_t)v15, &qword_1002DBDE8);
    sub_10015D658((uint64_t)v17, &qword_1002DBDE8);
    sub_10015D658(v31, &qword_1002DBDE8);
    sub_10015D658(v30, &qword_1002DBDE8);
    uint64_t v33 = sub_100157064(&qword_1002DBE28);
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v33 - 8) + 56))(v21, 0, 1, v33);
    uint64_t v34 = (uint64_t)v21;
    uint64_t v35 = v74;
    sub_10015D474((uint64_t)v21, v74, &qword_1002DBDF0);
  }
  else
  {
    uint64_t v36 = sub_100157064(&qword_1002DBE28);
    uint64_t v35 = v74;
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v36 - 8) + 56))(v74, 1, 1, v36);
    uint64_t v34 = (uint64_t)v21;
  }
  v37 = v69;
  Divider.init()();
  char v38 = static Edge.Set.horizontal.getter();
  EdgeInsets.init(_all:)();
  uint64_t v40 = v39;
  uint64_t v42 = v41;
  uint64_t v44 = v43;
  uint64_t v46 = v45;
  uint64_t v48 = v70;
  uint64_t v47 = v71;
  uint64_t v49 = (uint64_t)v65;
  (*(void (**)(char *, char *, uint64_t))(v70 + 16))(v65, v37, v71);
  uint64_t v50 = v49 + *(int *)(v66 + 36);
  *(unsigned char *)uint64_t v50 = v38;
  *(void *)(v50 + 8) = v40;
  *(void *)(v50 + 16) = v42;
  *(void *)(v50 + 24) = v44;
  *(void *)(v50 + 32) = v46;
  *(unsigned char *)(v50 + 40) = 0;
  (*(void (**)(char *, uint64_t))(v48 + 8))(v37, v47);
  uint64_t v51 = v72;
  sub_10015D474(v49, v72, &qword_1002DBDE0);
  uint64_t v53 = v67;
  uint64_t v52 = v68;
  v54 = *(void (**)(char *, char *, uint64_t))(v67 + 16);
  v55 = v63;
  v56 = v64;
  v54(v64, v63, v68);
  sub_10015D5F4(v35, v34, &qword_1002DBDF0);
  sub_10015D5F4(v51, v49, &qword_1002DBDE0);
  v57 = v73;
  v54(v73, v56, v52);
  uint64_t v58 = sub_100157064(&qword_1002DBE30);
  sub_10015D5F4(v34, (uint64_t)&v57[*(int *)(v58 + 48)], &qword_1002DBDF0);
  sub_10015D5F4(v49, (uint64_t)&v57[*(int *)(v58 + 64)], &qword_1002DBDE0);
  sub_10015D658(v51, &qword_1002DBDE0);
  sub_10015D658(v74, &qword_1002DBDF0);
  v59 = *(void (**)(char *, uint64_t))(v53 + 8);
  v59(v55, v52);
  sub_10015D658(v49, &qword_1002DBDE0);
  sub_10015D658(v34, &qword_1002DBDF0);
  return ((uint64_t (*)(char *, uint64_t))v59)(v56, v52);
}

uint64_t sub_1001FCFA4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v47 = a3;
  uint64_t v5 = sub_100157064(&qword_1002DBE50);
  uint64_t v6 = __chkstk_darwin(v5 - 8);
  uint64_t v45 = (uint64_t)&v42 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v42 - v8;
  uint64_t v44 = type metadata accessor for Divider();
  uint64_t v10 = *(void *)(v44 - 8);
  __chkstk_darwin(v44);
  uint64_t v12 = (char *)&v42 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_100157064(&qword_1002DBDE0);
  uint64_t v14 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  uint64_t v16 = (char *)&v42 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_100157064(&qword_1002DBE58);
  uint64_t v18 = __chkstk_darwin(v17 - 8);
  uint64_t v20 = (char *)&v42 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v18);
  uint64_t v22 = (char *)&v42 - v21;
  uint64_t v23 = type metadata accessor for FTMCellMonitorHardwareDetailModel();
  uint64_t v24 = *(void *)(a2 + 16);
  uint64_t v46 = a1;
  if (v24
    && *(void *)(a1 + *(int *)(v23 + 20)) == *(void *)(a2
                                                         + ((*(unsigned __int8 *)(*(void *)(v23 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v23 - 8) + 80))
                                                         + *(void *)(*(void *)(v23 - 8) + 72) * (v24 - 1)
                                                         + *(int *)(v23 + 20)))
  {
    Divider.init()();
    char v25 = static Edge.Set.horizontal.getter();
    uint64_t v43 = a2;
    char v26 = v25;
    EdgeInsets.init(_all:)();
    uint64_t v28 = v27;
    uint64_t v30 = v29;
    uint64_t v32 = v31;
    uint64_t v34 = v33;
    uint64_t v35 = v44;
    (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v16, v12, v44);
    uint64_t v36 = &v16[*(int *)(v13 + 36)];
    *uint64_t v36 = v26;
    a2 = v43;
    *((void *)v36 + 1) = v28;
    *((void *)v36 + 2) = v30;
    *((void *)v36 + 3) = v32;
    *((void *)v36 + 4) = v34;
    v36[40] = 0;
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v35);
    sub_10015D474((uint64_t)v16, (uint64_t)v22, &qword_1002DBDE0);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v14 + 56))(v22, 0, 1, v13);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v14 + 56))(v22, 1, 1, v13);
  }
  *(void *)uint64_t v9 = static VerticalAlignment.center.getter();
  *((void *)v9 + 1) = 0;
  v9[16] = 1;
  uint64_t v37 = sub_100157064(&qword_1002DBE60);
  sub_1001FD3D8(v46, a2, (uint64_t)&v9[*(int *)(v37 + 44)]);
  sub_10015D5F4((uint64_t)v22, (uint64_t)v20, &qword_1002DBE58);
  uint64_t v38 = v45;
  sub_10015D5F4((uint64_t)v9, v45, &qword_1002DBE50);
  uint64_t v39 = v47;
  sub_10015D5F4((uint64_t)v20, v47, &qword_1002DBE58);
  uint64_t v40 = sub_100157064(&qword_1002DBE68);
  sub_10015D5F4(v38, v39 + *(int *)(v40 + 48), &qword_1002DBE50);
  sub_10015D658((uint64_t)v9, &qword_1002DBE50);
  sub_10015D658((uint64_t)v22, &qword_1002DBE58);
  sub_10015D658(v38, &qword_1002DBE50);
  return sub_10015D658((uint64_t)v20, &qword_1002DBE58);
}

uint64_t sub_1001FD3D8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v107 = a2;
  uint64_t v116 = sub_100157064(&qword_1002DBE70);
  __chkstk_darwin(v116);
  uint64_t v122 = (uint64_t)&v105 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v119 = sub_100157064(&qword_1002DBE78);
  __chkstk_darwin(v119);
  v118 = (uint64_t *)((char *)&v105 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v121 = sub_100157064(&qword_1002D9420);
  uint64_t v117 = *(void *)(v121 - 8);
  uint64_t v7 = __chkstk_darwin(v121);
  v111 = (char *)&v105 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  v115 = (char *)&v105 - v9;
  uint64_t v10 = sub_100157064(&qword_1002DBE80);
  uint64_t v11 = __chkstk_darwin(v10 - 8);
  uint64_t v123 = (uint64_t)&v105 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  v120 = (char *)&v105 - v13;
  uint64_t v14 = (int *)type metadata accessor for FTMCellMonitorHardwareDetailModel();
  uint64_t v15 = (uint64_t *)(a1 + v14[6]);
  uint64_t v16 = *v15;
  uint64_t v17 = v15[1];
  uint64_t v18 = (uint64_t *)(a1 + v14[7]);
  uint64_t v19 = v18[1];
  uint64_t v108 = *v18;
  uint64_t v124 = v16;
  uint64_t v125 = v17;
  sub_1001571E0();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v20 = Text.init<A>(_:)();
  uint64_t v22 = v21;
  char v24 = v23 & 1;
  static Color.blue.getter();
  uint64_t v113 = Text.foregroundColor(_:)();
  uint64_t v112 = v25;
  int v110 = v26;
  uint64_t v114 = v27;
  swift_release();
  sub_10015D6C4(v20, v22, v24);
  swift_bridgeObjectRelease();
  int v109 = static Edge.Set.leading.getter();
  EdgeInsets.init(_all:)();
  uint64_t v29 = v28;
  uint64_t v31 = v30;
  uint64_t v33 = v32;
  uint64_t v35 = v34;
  uint64_t v36 = *(void *)(v107 + 16);
  if (v36
    && *(void *)(a1 + v14[5]) == *(void *)(v107
                                             + ((*(unsigned __int8 *)(*((void *)v14 - 1) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*((void *)v14 - 1) + 80))
                                             + *(void *)(*((void *)v14 - 1) + 72) * (v36 - 1)
                                             + v14[5]))
  {
    uint64_t v37 = v108;
    uint64_t v124 = v108;
    uint64_t v125 = v19;
    swift_bridgeObjectRetain();
    uint64_t v38 = Text.init<A>(_:)();
    uint64_t v40 = v39;
    char v42 = v41 & 1;
    static Color.gray.getter();
    uint64_t v107 = Text.foregroundColor(_:)();
    uint64_t v106 = v43;
    char v45 = v44;
    uint64_t v47 = v46;
    swift_release();
    char v48 = v45 & 1;
    sub_10015D6C4(v38, v40, v42);
    swift_bridgeObjectRelease();
    char v49 = static Edge.Set.trailing.getter();
    EdgeInsets.init(_all:)();
    uint64_t v51 = v50;
    uint64_t v53 = v52;
    uint64_t v55 = v54;
    uint64_t v57 = v56;
    uint64_t v58 = swift_allocObject();
    *(void *)(v58 + 16) = v37;
    *(void *)(v58 + 24) = v19;
    uint64_t v59 = v107;
    uint64_t v60 = v106;
    uint64_t v124 = v107;
    uint64_t v125 = v106;
    char v126 = v48;
    uint64_t v127 = v47;
    char v128 = v49;
    uint64_t v129 = v51;
    uint64_t v130 = v53;
    uint64_t v131 = v55;
    uint64_t v132 = v57;
    char v133 = 0;
    sub_100157064(&qword_1002D9428);
    sub_10020176C();
    uint64_t v61 = v115;
    View.onLongPressGesture(minimumDuration:maximumDistance:pressing:perform:)();
    swift_release();
    sub_10015D6C4(v59, v60, v48);
    swift_bridgeObjectRelease();
    uint64_t v62 = v117;
    v63 = *(void (**)(char *, char *, uint64_t))(v117 + 16);
    v64 = v111;
    uint64_t v65 = v121;
    v63(v111, v61, v121);
    uint64_t v66 = (uint64_t)v118;
    void *v118 = 0;
    *(unsigned char *)(v66 + 8) = 1;
    uint64_t v67 = sub_100157064(&qword_1002DBE88);
    v63((char *)(v66 + *(int *)(v67 + 48)), v64, v65);
    uint64_t v68 = *(void (**)(char *, uint64_t))(v62 + 8);
    v68(v64, v65);
    sub_10015D5F4(v66, v122, &qword_1002DBE78);
  }
  else
  {
    uint64_t v107 = a3;
    uint64_t v69 = v108;
    uint64_t v124 = v108;
    uint64_t v125 = v19;
    swift_bridgeObjectRetain();
    uint64_t v70 = Text.init<A>(_:)();
    uint64_t v72 = v71;
    char v74 = v73 & 1;
    static Color.gray.getter();
    uint64_t v75 = Text.foregroundColor(_:)();
    uint64_t v106 = v76;
    char v78 = v77;
    uint64_t v80 = v79;
    swift_release();
    char v81 = v78 & 1;
    sub_10015D6C4(v70, v72, v74);
    swift_bridgeObjectRelease();
    char v82 = static Edge.Set.trailing.getter();
    EdgeInsets.init(_all:)();
    uint64_t v84 = v83;
    uint64_t v86 = v85;
    uint64_t v88 = v87;
    uint64_t v90 = v89;
    uint64_t v91 = swift_allocObject();
    *(void *)(v91 + 16) = v69;
    *(void *)(v91 + 24) = v19;
    a3 = v107;
    uint64_t v92 = v75;
    uint64_t v124 = v75;
    uint64_t v93 = v106;
    uint64_t v125 = v106;
    char v126 = v81;
    uint64_t v127 = v80;
    char v128 = v82;
    uint64_t v129 = v84;
    uint64_t v130 = v86;
    uint64_t v131 = v88;
    uint64_t v132 = v90;
    char v133 = 0;
    sub_100157064(&qword_1002D9428);
    sub_10020176C();
    uint64_t v61 = v115;
    View.onLongPressGesture(minimumDuration:maximumDistance:pressing:perform:)();
    swift_release();
    sub_10015D6C4(v92, v93, v81);
    swift_bridgeObjectRelease();
    uint64_t v94 = v117;
    v95 = *(void (**)(char *, char *, uint64_t))(v117 + 16);
    v96 = v111;
    uint64_t v65 = v121;
    v95(v111, v61, v121);
    uint64_t v66 = (uint64_t)v118;
    void *v118 = 0;
    *(unsigned char *)(v66 + 8) = 1;
    uint64_t v97 = sub_100157064(&qword_1002DBE88);
    v95((char *)(v66 + *(int *)(v97 + 48)), v96, v65);
    uint64_t v68 = *(void (**)(char *, uint64_t))(v94 + 8);
    v68(v96, v65);
    sub_10015D5F4(v66, v122, &qword_1002DBE78);
  }
  swift_storeEnumTagMultiPayload();
  sub_10015D788(&qword_1002DBE90, &qword_1002DBE78);
  uint64_t v98 = (uint64_t)v120;
  _ConditionalContent<>.init(storage:)();
  sub_10015D658(v66, &qword_1002DBE78);
  v68(v61, v65);
  char v99 = v110 & 1;
  uint64_t v100 = v123;
  sub_10015D5F4(v98, v123, &qword_1002DBE80);
  uint64_t v101 = v113;
  uint64_t v102 = v112;
  *(void *)a3 = v113;
  *(void *)(a3 + 8) = v102;
  *(unsigned char *)(a3 + 16) = v99;
  *(void *)(a3 + 24) = v114;
  *(unsigned char *)(a3 + 32) = v109;
  *(void *)(a3 + 40) = v29;
  *(void *)(a3 + 48) = v31;
  *(void *)(a3 + 56) = v33;
  *(void *)(a3 + 64) = v35;
  *(unsigned char *)(a3 + 72) = 0;
  uint64_t v103 = sub_100157064(&qword_1002DBE98);
  sub_10015D5F4(v100, a3 + *(int *)(v103 + 48), &qword_1002DBE80);
  sub_10015D6B4(v101, v102, v99);
  swift_bridgeObjectRetain();
  sub_10015D658(v98, &qword_1002DBE80);
  sub_10015D658(v100, &qword_1002DBE80);
  sub_10015D6C4(v101, v102, v99);
  return swift_bridgeObjectRelease();
}

uint64_t sub_1001FDD38@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v72 = a2;
  uint64_t v75 = sub_100157064(&qword_1002D9420);
  uint64_t v74 = *(void *)(v75 - 8);
  uint64_t v3 = __chkstk_darwin(v75);
  char v73 = (char *)&v65 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  uint64_t v76 = (char *)&v65 - v5;
  unint64_t v6 = *(void *)(a1 + 112);
  uint64_t v77 = *(void *)(a1 + 104);
  unint64_t v78 = v6;
  uint64_t v87 = 46;
  unint64_t v88 = 0xE100000000000000;
  sub_1001571E0();
  uint64_t v7 = StringProtocol.components<A>(separatedBy:)();
  uint64_t v8 = *(void *)(v7 + 16);
  if (v8)
  {
    uint64_t v9 = v7 + 16 * v8;
    uint64_t v11 = *(void *)(v9 + 16);
    unint64_t v10 = *(void *)(v9 + 24);
    swift_bridgeObjectRetain();
  }
  else
  {
    uint64_t v11 = 0;
    unint64_t v10 = 0xE000000000000000;
  }
  unint64_t v66 = v10;
  swift_bridgeObjectRelease();
  uint64_t v77 = 0x2072656972726143;
  unint64_t v78 = 0xEF3A656C646E7542;
  uint64_t v12 = Text.init<A>(_:)();
  uint64_t v14 = v13;
  char v16 = v15 & 1;
  static Color.blue.getter();
  uint64_t v70 = Text.foregroundColor(_:)();
  uint64_t v69 = v17;
  char v19 = v18;
  uint64_t v71 = v20;
  swift_release();
  int v68 = v19 & 1;
  sub_10015D6C4(v12, v14, v16);
  swift_bridgeObjectRelease();
  int v67 = static Edge.Set.leading.getter();
  EdgeInsets.init(_all:)();
  uint64_t v22 = v21;
  uint64_t v24 = v23;
  uint64_t v26 = v25;
  uint64_t v28 = v27;
  uint64_t v77 = v11;
  unint64_t v78 = v10;
  swift_bridgeObjectRetain();
  uint64_t v29 = Text.init<A>(_:)();
  uint64_t v31 = v30;
  char v33 = v32 & 1;
  static Color.gray.getter();
  uint64_t v34 = Text.foregroundColor(_:)();
  uint64_t v36 = v35;
  uint64_t v37 = v11;
  char v39 = v38;
  uint64_t v41 = v40;
  swift_release();
  sub_10015D6C4(v29, v31, v33);
  swift_bridgeObjectRelease();
  char v42 = static Edge.Set.trailing.getter();
  EdgeInsets.init(_all:)();
  uint64_t v44 = v43;
  uint64_t v46 = v45;
  uint64_t v48 = v47;
  uint64_t v50 = v49;
  uint64_t v51 = swift_allocObject();
  unint64_t v52 = v66;
  *(void *)(v51 + 16) = v37;
  *(void *)(v51 + 24) = v52;
  uint64_t v77 = v34;
  unint64_t v78 = v36;
  char v79 = v39 & 1;
  uint64_t v80 = v41;
  char v81 = v42;
  uint64_t v82 = v44;
  uint64_t v83 = v46;
  uint64_t v84 = v48;
  uint64_t v85 = v50;
  char v86 = 0;
  sub_100157064(&qword_1002D9428);
  sub_10020176C();
  uint64_t v53 = v76;
  View.onLongPressGesture(minimumDuration:maximumDistance:pressing:perform:)();
  swift_release();
  sub_10015D6C4(v34, v36, v39 & 1);
  swift_bridgeObjectRelease();
  uint64_t v54 = v74;
  uint64_t v55 = *(void (**)(char *, char *, uint64_t))(v74 + 16);
  uint64_t v56 = v73;
  uint64_t v57 = v75;
  v55(v73, v53, v75);
  uint64_t v58 = v70;
  uint64_t v59 = v72;
  uint64_t v60 = v69;
  *uint64_t v72 = v70;
  v59[1] = v60;
  char v61 = v68;
  *((unsigned char *)v59 + 16) = v68;
  v59[3] = v71;
  *((unsigned char *)v59 + 32) = v67;
  v59[5] = v22;
  v59[6] = v24;
  v59[7] = v26;
  v59[8] = v28;
  *((unsigned char *)v59 + 72) = 0;
  v59[10] = 0;
  *((unsigned char *)v59 + 88) = 1;
  uint64_t v62 = sub_100157064(&qword_1002DBE48);
  v55((char *)v59 + *(int *)(v62 + 64), v56, v57);
  sub_10015D6B4(v58, v60, v61);
  v63 = *(void (**)(char *, uint64_t))(v54 + 8);
  swift_bridgeObjectRetain();
  v63(v76, v57);
  v63(v56, v57);
  sub_10015D6C4(v58, v60, v61);
  return swift_bridgeObjectRelease();
}

uint64_t sub_1001FE234@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v62 = a2;
  uint64_t v65 = sub_100157064(&qword_1002D9420);
  uint64_t v64 = *(void *)(v65 - 8);
  uint64_t v3 = __chkstk_darwin(v65);
  v63 = (char *)&v55 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  unint64_t v66 = (char *)&v55 - v5;
  unint64_t v6 = *(void *)(a1 + 88);
  unint64_t v7 = *(void *)(a1 + 96);
  unint64_t v56 = v6;
  unint64_t v67 = 0xD000000000000017;
  unint64_t v68 = 0x800000010023FBC0;
  sub_1001571E0();
  swift_bridgeObjectRetain();
  uint64_t v8 = Text.init<A>(_:)();
  uint64_t v10 = v9;
  char v12 = v11 & 1;
  static Color.blue.getter();
  uint64_t v60 = Text.foregroundColor(_:)();
  uint64_t v59 = v13;
  char v15 = v14;
  uint64_t v61 = v16;
  swift_release();
  int v58 = v15 & 1;
  sub_10015D6C4(v8, v10, v12);
  swift_bridgeObjectRelease();
  int v57 = static Edge.Set.leading.getter();
  EdgeInsets.init(_all:)();
  uint64_t v18 = v17;
  uint64_t v20 = v19;
  uint64_t v22 = v21;
  uint64_t v24 = v23;
  unint64_t v67 = v6;
  unint64_t v68 = v7;
  swift_bridgeObjectRetain();
  uint64_t v25 = Text.init<A>(_:)();
  uint64_t v27 = v26;
  LOBYTE(v6) = v28 & 1;
  static Color.gray.getter();
  uint64_t v29 = Text.foregroundColor(_:)();
  uint64_t v31 = v30;
  LOBYTE(v10) = v32;
  uint64_t v34 = v33;
  swift_release();
  sub_10015D6C4(v25, v27, v6);
  swift_bridgeObjectRelease();
  LOBYTE(v6) = static Edge.Set.trailing.getter();
  EdgeInsets.init(_all:)();
  uint64_t v36 = v35;
  uint64_t v38 = v37;
  uint64_t v40 = v39;
  uint64_t v42 = v41;
  uint64_t v43 = swift_allocObject();
  *(void *)(v43 + 16) = v56;
  *(void *)(v43 + 24) = v7;
  unint64_t v67 = v29;
  unint64_t v68 = v31;
  char v69 = v10 & 1;
  uint64_t v70 = v34;
  char v71 = v6;
  uint64_t v72 = v36;
  uint64_t v73 = v38;
  uint64_t v74 = v40;
  uint64_t v75 = v42;
  char v76 = 0;
  sub_100157064(&qword_1002D9428);
  sub_10020176C();
  uint64_t v44 = v66;
  View.onLongPressGesture(minimumDuration:maximumDistance:pressing:perform:)();
  swift_release();
  sub_10015D6C4(v29, v31, v10 & 1);
  swift_bridgeObjectRelease();
  uint64_t v45 = v64;
  uint64_t v46 = *(void (**)(char *, char *, uint64_t))(v64 + 16);
  uint64_t v47 = v63;
  uint64_t v48 = v65;
  v46(v63, v44, v65);
  uint64_t v49 = v60;
  uint64_t v50 = v62;
  uint64_t v51 = v59;
  *uint64_t v62 = v60;
  v50[1] = v51;
  LOBYTE(v7) = v58;
  *((unsigned char *)v50 + 16) = v58;
  v50[3] = v61;
  *((unsigned char *)v50 + 32) = v57;
  v50[5] = v18;
  v50[6] = v20;
  v50[7] = v22;
  v50[8] = v24;
  *((unsigned char *)v50 + 72) = 0;
  v50[10] = 0;
  *((unsigned char *)v50 + 88) = 1;
  uint64_t v52 = sub_100157064(&qword_1002DBE48);
  v46((char *)v50 + *(int *)(v52 + 64), v47, v48);
  sub_10015D6B4(v49, v51, v7);
  uint64_t v53 = *(void (**)(char *, uint64_t))(v45 + 8);
  swift_bridgeObjectRetain();
  v53(v66, v48);
  v53(v47, v48);
  sub_10015D6C4(v49, v51, v7);
  return swift_bridgeObjectRelease();
}

uint64_t sub_1001FE6A0@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *(void **)a1;
  uint64_t v19 = *(void *)(*(void *)a1 + 32);
  uint64_t v20 = *(void *)(*(void *)a1 + 40);
  swift_bridgeObjectRetain();
  v4._countAndFlagsBits = 126;
  v4._object = (void *)0xE100000000000000;
  String.append(_:)(v4);
  v5._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v5);
  swift_bridgeObjectRelease();
  v6._countAndFlagsBits = 126;
  v6._object = (void *)0xE100000000000000;
  String.append(_:)(v6);
  if (*((unsigned char *)v3 + OBJC_IVAR____TtC13FTMInternal_418FTMAllMetricsModel_isVisible)) {
    uint64_t v7 = 1702195828;
  }
  else {
    uint64_t v7 = 0x65736C6166;
  }
  if (*((unsigned char *)v3 + OBJC_IVAR____TtC13FTMInternal_418FTMAllMetricsModel_isVisible)) {
    unint64_t v8 = 0xE400000000000000;
  }
  else {
    unint64_t v8 = 0xE500000000000000;
  }
  unint64_t v9 = v8;
  String.append(_:)(*(Swift::String *)&v7);
  swift_bridgeObjectRelease();
  v10._countAndFlagsBits = 126;
  v10._object = (void *)0xE100000000000000;
  String.append(_:)(v10);
  uint64_t v11 = v3[6];
  char v12 = (void *)v3[7];
  swift_bridgeObjectRetain();
  v13._countAndFlagsBits = v11;
  v13._object = v12;
  String.append(_:)(v13);
  swift_bridgeObjectRelease();
  v14._countAndFlagsBits = 126;
  v14._object = (void *)0xE100000000000000;
  String.append(_:)(v14);
  uint64_t v15 = v3[14];
  uint64_t v16 = (void *)v3[15];
  swift_bridgeObjectRetain();
  v17._countAndFlagsBits = v15;
  v17._object = v16;
  String.append(_:)(v17);
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v19;
  a2[1] = v20;
  return result;
}

Swift::Int sub_1001FE810(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_100157064(&qword_1002D8210);
  uint64_t v5 = __chkstk_darwin(v4 - 8);
  v217 = (uint64_t *)((char *)&v191 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v7 = __chkstk_darwin(v5);
  v218 = (char *)&v191 - v8;
  uint64_t v9 = __chkstk_darwin(v7);
  v213 = (void (**)(char *, uint64_t))((char *)&v191 - v10);
  uint64_t v11 = __chkstk_darwin(v9);
  uint64_t v212 = (uint64_t)&v191 - v12;
  uint64_t v13 = __chkstk_darwin(v11);
  uint64_t v203 = (uint64_t)&v191 - v14;
  uint64_t v15 = __chkstk_darwin(v13);
  uint64_t v202 = (uint64_t)&v191 - v16;
  uint64_t v17 = __chkstk_darwin(v15);
  uint64_t v19 = (char *)&v191 - v18;
  __chkstk_darwin(v17);
  uint64_t v21 = (char *)&v191 - v20;
  uint64_t v22 = type metadata accessor for Date();
  uint64_t v23 = *(void *)(v22 - 8);
  uint64_t v24 = __chkstk_darwin(v22);
  v216 = (char *)&v191 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = __chkstk_darwin(v24);
  v221 = (char *)&v191 - v27;
  uint64_t v28 = __chkstk_darwin(v26);
  uint64_t v30 = (char *)&v191 - v29;
  uint64_t v31 = __chkstk_darwin(v28);
  v220 = (char *)&v191 - v32;
  uint64_t v33 = __chkstk_darwin(v31);
  uint64_t v35 = (char *)&v191 - v34;
  uint64_t v36 = __chkstk_darwin(v33);
  v206 = (char *)&v191 - v37;
  uint64_t v38 = __chkstk_darwin(v36);
  v198 = (char *)&v191 - v39;
  __chkstk_darwin(v38);
  v199 = (char *)&v191 - v40;
  Swift::Int v41 = *(void *)(a1 + 8);
  Swift::Int result = _minimumMergeRunLength(_:)(v41);
  uint64_t v219 = v22;
  uint64_t v208 = v41;
  if (result >= v41)
  {
    if (v41 < 0) {
      goto LABEL_169;
    }
    if ((unint64_t)v41 >= 2)
    {
      uint64_t v209 = v1;
      uint64_t v46 = *(char **)a1;
      uint64_t v47 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v23 + 48);
      v214 = (char **)(v23 + 32);
      v213 = (void (**)(char *, uint64_t))(v23 + 8);
      uint64_t v48 = -1;
      uint64_t v49 = 1;
      v220 = v46;
      uint64_t v50 = (uint64_t)v218;
      v215 = (char *)v47;
      do
      {
        v211 = (char *)v49;
        uint64_t v51 = *(void *)&v220[8 * v49];
        uint64_t v212 = v48;
        v210 = v46;
        do
        {
          uint64_t v52 = *(void *)v46;
          uint64_t v53 = v51 + OBJC_IVAR____TtC13FTMInternal_418FTMAllMetricsModel_timestamp;
          swift_beginAccess();
          sub_10015D5F4(v53, v50, &qword_1002D8210);
          uint64_t v54 = *v47;
          uint64_t v55 = v219;
          if ((*v47)(v50, 1, v219) == 1)
          {
            swift_retain();
            swift_retain();
            Date.init()();
            sub_10015D658(v50, &qword_1002D8210);
          }
          else
          {
            ((void (*)(char *, uint64_t, uint64_t))*v214)(v221, v50, v55);
            swift_retain();
            swift_retain();
          }
          uint64_t v56 = v55;
          uint64_t v57 = v52 + OBJC_IVAR____TtC13FTMInternal_418FTMAllMetricsModel_timestamp;
          swift_beginAccess();
          uint64_t v58 = v57;
          uint64_t v59 = (void (**)(void, void, void))v217;
          sub_10015D5F4(v58, (uint64_t)v217, &qword_1002D8210);
          if (v54((uint64_t)v59, 1, v56) == 1)
          {
            uint64_t v60 = v216;
            Date.init()();
            sub_10015D658((uint64_t)v59, &qword_1002D8210);
          }
          else
          {
            uint64_t v60 = v216;
            ((void (*)(char *, void, uint64_t))*v214)(v216, v59, v56);
          }
          uint64_t v61 = v221;
          char v62 = static Date.> infix(_:_:)();
          v63 = v60;
          uint64_t v64 = *v213;
          (*v213)(v63, v56);
          v64(v61, v56);
          swift_release();
          Swift::Int result = swift_release();
          uint64_t v50 = (uint64_t)v218;
          uint64_t v47 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))v215;
          if ((v62 & 1) == 0) {
            break;
          }
          if (!v220) {
            goto LABEL_173;
          }
          uint64_t v65 = *(void *)v46;
          uint64_t v51 = *((void *)v46 + 1);
          *(void *)uint64_t v46 = v51;
          *((void *)v46 + 1) = v65;
          v46 -= 8;
        }
        while (!__CFADD__(v48++, 1));
        uint64_t v49 = (uint64_t)(v211 + 1);
        uint64_t v46 = v210 + 8;
        uint64_t v48 = v212 - 1;
      }
      while (v211 + 1 != (char *)v208);
    }
    return result;
  }
  if (v41 >= 0) {
    uint64_t v43 = v41;
  }
  else {
    uint64_t v43 = v41 + 1;
  }
  if (v41 < -1) {
    goto LABEL_178;
  }
  Swift::Int v196 = result;
  v197 = v21;
  if (v41 < 2)
  {
    unint64_t v67 = (char *)_swiftEmptyArrayStorage;
    uint64_t v222 = (uint64_t)_swiftEmptyArrayStorage;
    v207 = (char *)(((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 32);
    if (v41 != 1)
    {
      unint64_t v72 = _swiftEmptyArrayStorage[2];
      if (v72 < 2)
      {
LABEL_146:
        swift_bridgeObjectRelease();
        *(void *)((v222 & 0xFFFFFFFFFFFFFF8) + 0x10) = 0;
        specialized Array._endMutation()();
        return swift_bridgeObjectRelease();
      }
LABEL_133:
      v183 = *(char **)a1;
      while (1)
      {
        unint64_t v184 = v72 - 2;
        if (v72 < 2) {
          goto LABEL_164;
        }
        if (!v183) {
          goto LABEL_177;
        }
        v210 = v67;
        uint64_t v185 = *(void *)&v67[16 * v184 + 32];
        uint64_t v186 = *(void *)&v67[16 * v72 + 24];
        sub_1001FFB1C(&v183[8 * v185], &v183[8 * *(void *)&v67[16 * v72 + 16]], (unint64_t)&v183[8 * v186], v207);
        if (v2) {
          goto LABEL_146;
        }
        if (v186 < v185) {
          goto LABEL_165;
        }
        if (swift_isUniquelyReferenced_nonNull_native()) {
          v187 = v210;
        }
        else {
          v187 = sub_1001B49EC((uint64_t)v210);
        }
        if (v184 >= *((void *)v187 + 2)) {
          goto LABEL_166;
        }
        v188 = &v187[16 * v184 + 32];
        *(void *)v188 = v185;
        *((void *)v188 + 1) = v186;
        unint64_t v189 = *((void *)v187 + 2);
        if (v72 > v189) {
          goto LABEL_167;
        }
        v190 = v187;
        memmove(&v187[16 * v72 + 16], &v187[16 * v72 + 32], 16 * (v189 - v72));
        unint64_t v67 = v190;
        *((void *)v190 + 2) = v189 - 1;
        unint64_t v72 = v189 - 1;
        if (v189 <= 2) {
          goto LABEL_146;
        }
      }
    }
  }
  else
  {
    uint64_t v44 = v43 >> 1;
    type metadata accessor for FTMAllMetricsModel();
    uint64_t v45 = static Array._allocateBufferUninitialized(minimumCapacity:)();
    *(void *)((v45 & 0xFFFFFFFFFFFFFF8) + 0x10) = v44;
    v207 = (char *)((v45 & 0xFFFFFFFFFFFFFF8) + 32);
    uint64_t v222 = v45;
  }
  v211 = v30;
  v195 = v19;
  uint64_t v209 = v1;
  Swift::Int v68 = 0;
  uint64_t v192 = a1;
  char v69 = *(char **)a1;
  uint64_t v70 = v23;
  char v71 = (char **)(v23 + 48);
  v217 = (uint64_t *)(v70 + 32);
  v216 = (char *)(v70 + 8);
  v194 = v69 + 16;
  v193 = v69 - 8;
  unint64_t v67 = (char *)_swiftEmptyArrayStorage;
  v201 = v35;
  v215 = v69;
  v214 = v71;
  while (1)
  {
    Swift::Int v73 = v68;
    Swift::Int v74 = v68 + 1;
    Swift::Int v204 = v68;
    if (v68 + 1 < v41)
    {
      v210 = v67;
      uint64_t v75 = *(void *)&v69[8 * v74];
      uint64_t v76 = *(void *)&v69[8 * v68];
      uint64_t v77 = v75 + OBJC_IVAR____TtC13FTMInternal_418FTMAllMetricsModel_timestamp;
      swift_beginAccess();
      uint64_t v78 = v77;
      uint64_t v79 = (uint64_t)v197;
      sub_10015D5F4(v78, (uint64_t)v197, &qword_1002D8210);
      v221 = *v71;
      int v80 = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v221)(v79, 1, v22);
      char v81 = v198;
      if (v80 == 1)
      {
        swift_retain();
        swift_retain();
        Date.init()();
        sub_10015D658(v79, &qword_1002D8210);
      }
      else
      {
        ((void (*)(char *, uint64_t, uint64_t))*v217)(v199, v79, v22);
        swift_retain();
        swift_retain();
      }
      uint64_t v82 = v76 + OBJC_IVAR____TtC13FTMInternal_418FTMAllMetricsModel_timestamp;
      swift_beginAccess();
      uint64_t v83 = v82;
      uint64_t v84 = (uint64_t)v195;
      sub_10015D5F4(v83, (uint64_t)v195, &qword_1002D8210);
      if (((unsigned int (*)(uint64_t, uint64_t, uint64_t))v221)(v84, 1, v22) == 1)
      {
        Date.init()();
        sub_10015D658(v84, &qword_1002D8210);
      }
      else
      {
        ((void (*)(char *, uint64_t, uint64_t))*v217)(v81, v84, v22);
      }
      uint64_t v85 = v199;
      LODWORD(v218) = static Date.> infix(_:_:)();
      char v86 = v81;
      uint64_t v87 = *(void (**)(char *, uint64_t))v216;
      (*(void (**)(char *, uint64_t))v216)(v86, v22);
      v87(v85, v22);
      swift_release();
      swift_release();
      Swift::Int v73 = v204;
      Swift::Int v74 = v204 + 2;
      if (v204 + 2 < v41)
      {
        unint64_t v88 = &v194[8 * v204];
        while (1)
        {
          uint64_t v89 = *((void *)v88 - 1);
          uint64_t v90 = *(void *)v88 + OBJC_IVAR____TtC13FTMInternal_418FTMAllMetricsModel_timestamp;
          swift_beginAccess();
          uint64_t v91 = v90;
          uint64_t v92 = v202;
          sub_10015D5F4(v91, v202, &qword_1002D8210);
          if (((unsigned int (*)(uint64_t, uint64_t, uint64_t))v221)(v92, 1, v22) == 1)
          {
            swift_retain();
            swift_retain();
            Date.init()();
            sub_10015D658(v92, &qword_1002D8210);
          }
          else
          {
            ((void (*)(char *, uint64_t, uint64_t))*v217)(v206, v92, v22);
            swift_retain();
            swift_retain();
          }
          uint64_t v93 = v89 + OBJC_IVAR____TtC13FTMInternal_418FTMAllMetricsModel_timestamp;
          swift_beginAccess();
          uint64_t v94 = v93;
          uint64_t v95 = v203;
          sub_10015D5F4(v94, v203, &qword_1002D8210);
          if (((unsigned int (*)(uint64_t, uint64_t, uint64_t))v221)(v95, 1, v22) == 1)
          {
            v96 = v201;
            Date.init()();
            sub_10015D658(v95, &qword_1002D8210);
          }
          else
          {
            v96 = v201;
            ((void (*)(char *, uint64_t, uint64_t))*v217)(v201, v95, v22);
          }
          uint64_t v97 = v206;
          int v98 = static Date.> infix(_:_:)();
          v87(v96, v22);
          v87(v97, v22);
          swift_release();
          swift_release();
          if ((v218 ^ v98)) {
            break;
          }
          ++v74;
          v88 += 8;
          Swift::Int v41 = v208;
          char v69 = v215;
          char v71 = v214;
          if (v208 == v74)
          {
            Swift::Int v74 = v208;
            goto LABEL_47;
          }
        }
        Swift::Int v41 = v208;
        char v69 = v215;
        char v71 = v214;
LABEL_47:
        Swift::Int v73 = v204;
      }
      unint64_t v67 = v210;
      if (v218)
      {
        if (v74 < v73) {
          goto LABEL_170;
        }
        if (v73 < v74)
        {
          char v99 = &v193[8 * v74];
          Swift::Int v100 = v74;
          Swift::Int v101 = v73;
          uint64_t v102 = &v69[8 * v73];
          do
          {
            if (v101 != --v100)
            {
              if (!v69) {
                goto LABEL_176;
              }
              uint64_t v103 = *(void *)v102;
              *(void *)uint64_t v102 = *(void *)v99;
              *(void *)char v99 = v103;
            }
            ++v101;
            v99 -= 8;
            v102 += 8;
          }
          while (v101 < v100);
        }
      }
    }
    if (v74 >= v41) {
      goto LABEL_81;
    }
    if (__OFSUB__(v74, v73)) {
      goto LABEL_168;
    }
    if (v74 - v73 >= v196) {
      goto LABEL_81;
    }
    if (__OFADD__(v73, v196)) {
      goto LABEL_171;
    }
    Swift::Int v104 = v73 + v196 >= v41 ? v41 : v73 + v196;
    if (v104 < v73) {
      break;
    }
    if (v74 != v104)
    {
      v210 = v67;
      uint64_t v105 = &v193[8 * v74];
      Swift::Int v200 = v104;
      do
      {
        v218 = (char *)v74;
        uint64_t v107 = *(char **)&v69[8 * v74];
        uint64_t v108 = (char *)v73;
        v205 = v105;
        int v109 = (char **)v105;
        while (1)
        {
          int v110 = *v109;
          uint64_t v111 = (uint64_t)&v107[OBJC_IVAR____TtC13FTMInternal_418FTMAllMetricsModel_timestamp];
          swift_beginAccess();
          uint64_t v112 = v111;
          uint64_t v113 = v212;
          sub_10015D5F4(v112, v212, &qword_1002D8210);
          uint64_t v114 = v22;
          v115 = *v71;
          if (((unsigned int (*)(uint64_t, uint64_t, uint64_t))*v71)(v113, 1, v114) == 1)
          {
            swift_retain();
            swift_retain();
            Date.init()();
            sub_10015D658(v113, &qword_1002D8210);
          }
          else
          {
            ((void (*)(char *, uint64_t, uint64_t))*v217)(v220, v113, v114);
            swift_retain();
            swift_retain();
          }
          uint64_t v116 = (uint64_t)&v110[OBJC_IVAR____TtC13FTMInternal_418FTMAllMetricsModel_timestamp];
          swift_beginAccess();
          uint64_t v117 = v116;
          v118 = v213;
          sub_10015D5F4(v117, (uint64_t)v213, &qword_1002D8210);
          unsigned int v119 = ((uint64_t (*)(void (**)(char *, uint64_t), uint64_t, uint64_t))v115)(v118, 1, v114);
          v221 = v110;
          v120 = v211;
          if (v119 == 1)
          {
            Date.init()();
            sub_10015D658((uint64_t)v118, &qword_1002D8210);
          }
          else
          {
            ((void (*)(char *, void (**)(char *, uint64_t), uint64_t))*v217)(v211, v118, v114);
          }
          uint64_t v121 = v220;
          char v122 = static Date.> infix(_:_:)();
          uint64_t v123 = *(void (**)(char *, uint64_t))v216;
          (*(void (**)(char *, uint64_t))v216)(v120, v114);
          uint64_t v124 = v121;
          uint64_t v125 = v114;
          v123(v124, v114);
          swift_release();
          swift_release();
          if ((v122 & 1) == 0) {
            break;
          }
          char v69 = v215;
          char v71 = v214;
          uint64_t v106 = v218;
          if (!v215) {
            goto LABEL_174;
          }
          char v126 = *v109;
          uint64_t v107 = v109[1];
          *int v109 = v107;
          v109[1] = v126;
          --v109;
          ++v108;
          uint64_t v22 = v125;
          if (v106 == v108) {
            goto LABEL_68;
          }
        }
        char v69 = v215;
        char v71 = v214;
        uint64_t v22 = v114;
        uint64_t v106 = v218;
LABEL_68:
        Swift::Int v74 = (Swift::Int)(v106 + 1);
        uint64_t v105 = v205 + 8;
        Swift::Int v73 = v204;
      }
      while (v74 != v200);
      Swift::Int v74 = v200;
      unint64_t v67 = v210;
    }
LABEL_81:
    if (v74 < v73) {
      goto LABEL_163;
    }
    uint64_t v127 = v67;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v218 = (char *)v74;
    if (isUniquelyReferenced_nonNull_native) {
      unint64_t v67 = v127;
    }
    else {
      unint64_t v67 = sub_1001B43F0(0, *((void *)v127 + 2) + 1, 1, v127);
    }
    unint64_t v130 = *((void *)v67 + 2);
    unint64_t v129 = *((void *)v67 + 3);
    unint64_t v72 = v130 + 1;
    if (v130 >= v129 >> 1) {
      unint64_t v67 = sub_1001B43F0((char *)(v129 > 1), v130 + 1, 1, v67);
    }
    *((void *)v67 + 2) = v72;
    uint64_t v131 = v67 + 32;
    uint64_t v132 = &v67[16 * v130 + 32];
    char v133 = v218;
    *(void *)uint64_t v132 = v73;
    *((void *)v132 + 1) = v133;
    if (v130)
    {
      v210 = v67;
      while (1)
      {
        unint64_t v134 = v72 - 1;
        if (v72 >= 4)
        {
          v139 = &v131[16 * v72];
          uint64_t v140 = *((void *)v139 - 8);
          uint64_t v141 = *((void *)v139 - 7);
          BOOL v145 = __OFSUB__(v141, v140);
          uint64_t v142 = v141 - v140;
          if (v145) {
            goto LABEL_152;
          }
          uint64_t v144 = *((void *)v139 - 6);
          uint64_t v143 = *((void *)v139 - 5);
          BOOL v145 = __OFSUB__(v143, v144);
          uint64_t v137 = v143 - v144;
          char v138 = v145;
          if (v145) {
            goto LABEL_153;
          }
          unint64_t v146 = v72 - 2;
          v147 = &v131[16 * v72 - 32];
          uint64_t v149 = *(void *)v147;
          uint64_t v148 = *((void *)v147 + 1);
          BOOL v145 = __OFSUB__(v148, v149);
          uint64_t v150 = v148 - v149;
          if (v145) {
            goto LABEL_155;
          }
          BOOL v145 = __OFADD__(v137, v150);
          uint64_t v151 = v137 + v150;
          if (v145) {
            goto LABEL_158;
          }
          if (v151 >= v142)
          {
            v169 = &v131[16 * v134];
            uint64_t v171 = *(void *)v169;
            uint64_t v170 = *((void *)v169 + 1);
            BOOL v145 = __OFSUB__(v170, v171);
            uint64_t v172 = v170 - v171;
            if (v145) {
              goto LABEL_162;
            }
            BOOL v162 = v137 < v172;
            goto LABEL_119;
          }
        }
        else
        {
          if (v72 != 3)
          {
            uint64_t v163 = *((void *)v67 + 4);
            uint64_t v164 = *((void *)v67 + 5);
            BOOL v145 = __OFSUB__(v164, v163);
            uint64_t v156 = v164 - v163;
            char v157 = v145;
            goto LABEL_113;
          }
          uint64_t v136 = *((void *)v67 + 4);
          uint64_t v135 = *((void *)v67 + 5);
          BOOL v145 = __OFSUB__(v135, v136);
          uint64_t v137 = v135 - v136;
          char v138 = v145;
        }
        if (v138) {
          goto LABEL_154;
        }
        unint64_t v146 = v72 - 2;
        v152 = &v131[16 * v72 - 32];
        uint64_t v154 = *(void *)v152;
        uint64_t v153 = *((void *)v152 + 1);
        BOOL v155 = __OFSUB__(v153, v154);
        uint64_t v156 = v153 - v154;
        char v157 = v155;
        if (v155) {
          goto LABEL_157;
        }
        v158 = &v131[16 * v134];
        uint64_t v160 = *(void *)v158;
        uint64_t v159 = *((void *)v158 + 1);
        BOOL v145 = __OFSUB__(v159, v160);
        uint64_t v161 = v159 - v160;
        if (v145) {
          goto LABEL_160;
        }
        if (__OFADD__(v156, v161)) {
          goto LABEL_161;
        }
        if (v156 + v161 >= v137)
        {
          BOOL v162 = v137 < v161;
LABEL_119:
          if (v162) {
            unint64_t v134 = v146;
          }
          goto LABEL_121;
        }
LABEL_113:
        if (v157) {
          goto LABEL_156;
        }
        v165 = &v131[16 * v134];
        uint64_t v167 = *(void *)v165;
        uint64_t v166 = *((void *)v165 + 1);
        BOOL v145 = __OFSUB__(v166, v167);
        uint64_t v168 = v166 - v167;
        if (v145) {
          goto LABEL_159;
        }
        if (v168 < v156) {
          goto LABEL_27;
        }
LABEL_121:
        unint64_t v173 = v134 - 1;
        if (v134 - 1 >= v72)
        {
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
          __break(1u);
LABEL_161:
          __break(1u);
LABEL_162:
          __break(1u);
LABEL_163:
          __break(1u);
LABEL_164:
          __break(1u);
LABEL_165:
          __break(1u);
LABEL_166:
          __break(1u);
LABEL_167:
          __break(1u);
LABEL_168:
          __break(1u);
LABEL_169:
          __break(1u);
LABEL_170:
          __break(1u);
LABEL_171:
          __break(1u);
          goto LABEL_172;
        }
        if (!v69) {
          goto LABEL_175;
        }
        v174 = &v131[16 * v173];
        uint64_t v175 = *(void *)v174;
        v176 = v131;
        unint64_t v177 = v134;
        v178 = &v131[16 * v134];
        uint64_t v179 = *((void *)v178 + 1);
        uint64_t v180 = v209;
        sub_1001FFB1C(&v69[8 * *(void *)v174], &v69[8 * *(void *)v178], (unint64_t)&v69[8 * v179], v207);
        uint64_t v209 = v180;
        if (v180) {
          goto LABEL_146;
        }
        if (v179 < v175) {
          goto LABEL_149;
        }
        uint64_t v181 = (uint64_t)v210;
        if (v177 > *((void *)v210 + 2)) {
          goto LABEL_150;
        }
        *(void *)v174 = v175;
        *(void *)&v176[16 * v173 + 8] = v179;
        unint64_t v182 = *(void *)(v181 + 16);
        if (v177 >= v182) {
          goto LABEL_151;
        }
        unint64_t v72 = v182 - 1;
        memmove(v178, v178 + 16, 16 * (v182 - 1 - v177));
        uint64_t v131 = v176;
        unint64_t v67 = v210;
        *((void *)v210 + 2) = v182 - 1;
        uint64_t v22 = v219;
        if (v182 <= 2) {
          goto LABEL_27;
        }
      }
    }
    unint64_t v72 = 1;
LABEL_27:
    Swift::Int v41 = v208;
    Swift::Int v68 = (Swift::Int)v218;
    if ((uint64_t)v218 >= v208)
    {
      uint64_t v2 = v209;
      a1 = v192;
      if (v72 < 2) {
        goto LABEL_146;
      }
      goto LABEL_133;
    }
  }
LABEL_172:
  __break(1u);
LABEL_173:
  __break(1u);
LABEL_174:
  __break(1u);
LABEL_175:
  __break(1u);
LABEL_176:
  __break(1u);
LABEL_177:
  __break(1u);
LABEL_178:
  Swift::Int result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_1001FFB1C(char *a1, char *a2, unint64_t a3, char *a4)
{
  uint64_t v8 = sub_100157064(&qword_1002D8210);
  uint64_t v9 = __chkstk_darwin(v8 - 8);
  uint64_t v83 = &v77[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v11 = __chkstk_darwin(v9);
  uint64_t v82 = &v77[-v12];
  uint64_t v13 = __chkstk_darwin(v11);
  char v86 = &v77[-v14];
  __chkstk_darwin(v13);
  uint64_t v87 = &v77[-v15];
  uint64_t v91 = type metadata accessor for Date();
  uint64_t v16 = __chkstk_darwin(v91);
  char v81 = &v77[-((v17 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v18 = __chkstk_darwin(v16);
  uint64_t v90 = &v77[-v19];
  uint64_t v20 = __chkstk_darwin(v18);
  int v80 = &v77[-v21];
  __chkstk_darwin(v20);
  unint64_t v88 = a3;
  uint64_t v89 = &v77[-v23];
  uint64_t v24 = a2 - a1;
  uint64_t v25 = a2 - a1 + 7;
  if (a2 - a1 >= 0) {
    uint64_t v25 = a2 - a1;
  }
  uint64_t v26 = v25 >> 3;
  uint64_t v27 = a3 - (void)a2;
  uint64_t v28 = a3 - (void)a2 + 7;
  if ((uint64_t)(a3 - (void)a2) >= 0) {
    uint64_t v28 = a3 - (void)a2;
  }
  uint64_t v29 = v28 >> 3;
  uint64_t v84 = a1;
  uint64_t v85 = a4;
  uint64_t v95 = a1;
  uint64_t v94 = a4;
  if (v26 >= v28 >> 3)
  {
    if (v27 < -7) {
      goto LABEL_60;
    }
    uint64_t v49 = v85;
    if (v85 != a2 || &a2[8 * v29] <= v85)
    {
      uint64_t v50 = v22;
      memmove(v85, a2, 8 * v29);
      uint64_t v22 = v50;
    }
    uint64_t v51 = &v49[8 * v29];
    uint64_t v93 = v51;
    uint64_t v95 = a2;
    if (v27 < 8 || v84 >= a2)
    {
LABEL_59:
      sub_1001B45A8((void **)&v95, (const void **)&v94, &v93);
      return 1;
    }
    uint64_t v52 = (unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v22 + 48);
    uint64_t v79 = (void (**)(char *, unsigned char *, uint64_t))(v22 + 32);
    uint64_t v78 = (void (**)(char *, uint64_t))(v22 + 8);
    uint64_t v53 = (char *)(v88 - 8);
    uint64_t v54 = a2;
    int v80 = (unsigned char *)(v22 + 48);
    while (1)
    {
      uint64_t v92 = a2;
      uint64_t v89 = v51;
      uint64_t v55 = *((void *)v51 - 1);
      unint64_t v56 = *((void *)v54 - 1);
      char v86 = v51 - 8;
      uint64_t v87 = v54 - 8;
      uint64_t v57 = v55 + OBJC_IVAR____TtC13FTMInternal_418FTMAllMetricsModel_timestamp;
      swift_beginAccess();
      uint64_t v58 = v82;
      sub_10015D5F4(v57, (uint64_t)v82, &qword_1002D8210);
      uint64_t v59 = *v52;
      uint64_t v60 = v91;
      if ((*v52)(v58, 1, v91) == 1)
      {
        swift_retain();
        swift_retain();
        Date.init()();
        sub_10015D658((uint64_t)v58, &qword_1002D8210);
      }
      else
      {
        (*v79)(v90, v58, v60);
        swift_retain();
        swift_retain();
      }
      unint64_t v88 = v56;
      uint64_t v61 = v56 + OBJC_IVAR____TtC13FTMInternal_418FTMAllMetricsModel_timestamp;
      swift_beginAccess();
      char v62 = v83;
      sub_10015D5F4(v61, (uint64_t)v83, &qword_1002D8210);
      if (v59(v62, 1, v60) == 1)
      {
        v63 = v89;
        uint64_t v64 = v81;
        Date.init()();
        sub_10015D658((uint64_t)v62, &qword_1002D8210);
      }
      else
      {
        v63 = v89;
        uint64_t v64 = v81;
        (*v79)(v81, v62, v60);
      }
      uint64_t v65 = v60;
      unint64_t v66 = v53 + 8;
      unint64_t v67 = v90;
      char v68 = static Date.> infix(_:_:)();
      char v69 = v64;
      char v70 = v68;
      char v71 = *v78;
      (*v78)(v69, v65);
      v71(v67, v65);
      swift_release();
      swift_release();
      if (v70) {
        break;
      }
      unint64_t v72 = v85;
      uint64_t v51 = v86;
      uint64_t v93 = v86;
      Swift::Int v73 = v84;
      if (v66 < v63 || v53 >= v63)
      {
        *(void *)uint64_t v53 = *(void *)v86;
        uint64_t v54 = v92;
        goto LABEL_57;
      }
      BOOL v74 = v66 == v63;
      uint64_t v75 = v92;
      if (!v74) {
        *(void *)uint64_t v53 = *(void *)v86;
      }
      uint64_t v54 = v75;
      uint64_t v52 = (unsigned int (**)(unsigned char *, uint64_t, uint64_t))v80;
      if (v51 <= v72) {
        goto LABEL_59;
      }
LABEL_58:
      v53 -= 8;
      a2 = v54;
      if (v54 <= v73) {
        goto LABEL_59;
      }
    }
    Swift::Int v73 = v84;
    unint64_t v72 = v85;
    uint64_t v51 = v63;
    uint64_t v54 = v87;
    if (v66 != v92 || v53 >= v92) {
      *(void *)uint64_t v53 = *(void *)v87;
    }
    uint64_t v95 = v54;
LABEL_57:
    uint64_t v52 = (unsigned int (**)(unsigned char *, uint64_t, uint64_t))v80;
    if (v51 <= v72) {
      goto LABEL_59;
    }
    goto LABEL_58;
  }
  if (v24 >= -7)
  {
    uint64_t v31 = v84;
    uint64_t v30 = v85;
    if (v85 != v84 || &v84[8 * v26] <= v85)
    {
      uint64_t v32 = v22;
      memmove(v85, v84, 8 * v26);
      uint64_t v22 = v32;
    }
    uint64_t v90 = &v30[8 * v26];
    uint64_t v93 = v90;
    uint64_t v33 = (uint64_t)v87;
    if (v24 >= 8 && (unint64_t)a2 < v88)
    {
      uint64_t v34 = (unsigned char *)(v22 + 48);
      char v81 = (unsigned char *)(v22 + 8);
      uint64_t v82 = (unsigned char *)(v22 + 32);
      uint64_t v83 = (unsigned char *)(v22 + 48);
      while (1)
      {
        uint64_t v92 = a2;
        uint64_t v35 = *(void *)v30;
        uint64_t v36 = *(void *)a2 + OBJC_IVAR____TtC13FTMInternal_418FTMAllMetricsModel_timestamp;
        swift_beginAccess();
        sub_10015D5F4(v36, v33, &qword_1002D8210);
        uint64_t v37 = *(unsigned int (**)(char *, uint64_t, uint64_t))v34;
        uint64_t v38 = v91;
        if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))v34)(v33, 1, v91) == 1)
        {
          swift_retain();
          swift_retain();
          Date.init()();
          sub_10015D658(v33, &qword_1002D8210);
        }
        else
        {
          (*(void (**)(char *, uint64_t, uint64_t))v82)(v89, v33, v38);
          swift_retain();
          swift_retain();
        }
        uint64_t v39 = v38;
        uint64_t v40 = v35 + OBJC_IVAR____TtC13FTMInternal_418FTMAllMetricsModel_timestamp;
        swift_beginAccess();
        uint64_t v41 = v40;
        uint64_t v42 = v86;
        sub_10015D5F4(v41, (uint64_t)v86, &qword_1002D8210);
        if (v37(v42, 1, v39) == 1)
        {
          uint64_t v43 = v80;
          Date.init()();
          sub_10015D658((uint64_t)v42, &qword_1002D8210);
        }
        else
        {
          uint64_t v43 = v80;
          (*(void (**)(unsigned char *, char *, uint64_t))v82)(v80, v42, v39);
        }
        uint64_t v44 = v89;
        char v45 = static Date.> infix(_:_:)();
        uint64_t v46 = v43;
        uint64_t v47 = *(void (**)(char *, uint64_t))v81;
        (*(void (**)(unsigned char *, uint64_t))v81)(v46, v39);
        v47(v44, v39);
        swift_release();
        swift_release();
        if (v45)
        {
          uint64_t v48 = v92 + 8;
          uint64_t v33 = (uint64_t)v87;
          if (v31 >= v92 && v31 < v48)
          {
            uint64_t v34 = v83;
            if (v31 != v92) {
              *(void *)uint64_t v31 = *(void *)v92;
            }
            goto LABEL_29;
          }
          *(void *)uint64_t v31 = *(void *)v92;
        }
        else
        {
          uint64_t v33 = (uint64_t)v87;
          if (v31 != v30) {
            *(void *)uint64_t v31 = *(void *)v30;
          }
          v30 += 8;
          uint64_t v94 = v30;
          uint64_t v48 = v92;
        }
        uint64_t v34 = v83;
LABEL_29:
        v31 += 8;
        uint64_t v95 = v31;
        if (v30 < v90)
        {
          a2 = v48;
          if ((unint64_t)v48 < v88) {
            continue;
          }
        }
        goto LABEL_59;
      }
    }
    goto LABEL_59;
  }
LABEL_60:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_1002003A4()
{
  uint64_t v125 = type metadata accessor for FTMCellMonitorHardwareDetailModel();
  uint64_t v126 = *(void *)(v125 - 8);
  uint64_t v2 = __chkstk_darwin(v125);
  uint64_t v121 = (uint64_t)&v118 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __chkstk_darwin(v2);
  unint64_t v129 = (unint64_t)&v118 - v5;
  __chkstk_darwin(v4);
  unint64_t v7 = (unint64_t)&v118 - v6;
  unint64_t v137 = (unint64_t)_swiftEmptyArrayStorage;
  if (qword_1002D7B18 != -1) {
    goto LABEL_51;
  }
  while (1)
  {
    uint64_t v8 = qword_1002E31C8;
    swift_beginAccess();
    uint64_t v9 = *(void *)(v8 + 80);
    unint64_t v10 = *(void *)(v9 + 16);
    uint64_t v11 = _swiftEmptyArrayStorage;
    if (!v10) {
      break;
    }
    if (*(unsigned char *)(v8 + 152))
    {
      LODWORD(v12) = 0;
LABEL_6:
      int64_t v12 = (int)v12;
      if ((int)v12 < v10) {
        goto LABEL_7;
      }
      goto LABEL_48;
    }
    int64_t v12 = *(int *)(v8 + 148);
    if ((uint64_t)v10 > v12) {
      goto LABEL_6;
    }
    int64_t v12 = v10 - 1;
    if (v10 - 1 < v10)
    {
LABEL_7:
      uint64_t v13 = v9 + 88 * v12;
      uint64_t v15 = *(void *)(v13 + 32);
      uint64_t v14 = *(void *)(v13 + 40);
      swift_bridgeObjectRetain();
      UUID.init()();
      uint64_t v16 = v125;
      uint64_t v17 = (void *)(v7 + *(int *)(v125 + 32));
      *(void *)(v7 + *(int *)(v125 + 20)) = 1;
      uint64_t v18 = (void *)(v7 + *(int *)(v16 + 24));
      void *v18 = 0x3A72656972726143;
      v18[1] = 0xE800000000000000;
      uint64_t v19 = (void *)(v7 + *(int *)(v16 + 28));
      *uint64_t v19 = v15;
      v19[1] = v14;
      *uint64_t v17 = 0;
      v17[1] = 0;
      uint64_t v11 = (void *)sub_1001EB570(0, 1, 1, (unint64_t)_swiftEmptyArrayStorage);
      unint64_t v21 = v11[2];
      unint64_t v20 = v11[3];
      if (v21 >= v20 >> 1) {
        uint64_t v11 = (void *)sub_1001EB570(v20 > 1, v21 + 1, 1, (unint64_t)v11);
      }
      v11[2] = v21 + 1;
      sub_100201834(v7, (uint64_t)v11+ ((*(unsigned __int8 *)(v126 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v126 + 80))+ *(void *)(v126 + 72) * v21);
      break;
    }
LABEL_48:
    __break(1u);
LABEL_49:
    __break(1u);
LABEL_50:
    __break(1u);
LABEL_51:
    swift_once();
  }
  if (qword_1002D7B20 != -1) {
    swift_once();
  }
  [*(id *)(qword_1002E31D0 + OBJC_IVAR____TtC13FTMInternal_425FTMCellMonitorSharedClass_lock) lock];
  char v22 = *(unsigned char *)(qword_1002E31C8 + 152);
  unsigned int v119 = v11;
  if (v22)
  {
    unint64_t v23 = 0;
LABEL_154:
    [*(id *)(qword_1002E31D0 + OBJC_IVAR____TtC13FTMInternal_425FTMCellMonitorSharedClass_lock) unlock];
    uint64_t v56 = v137;
    unint64_t v135 = (unint64_t)_swiftEmptyArrayStorage;
    unint64_t v0 = v137 >> 62;
    if (v137 >> 62) {
      goto LABEL_196;
    }
    uint64_t v77 = *(void *)((v137 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    goto LABEL_156;
  }
  int v24 = *(_DWORD *)(qword_1002E31C8 + 148);
  unint64_t v135 = 2119450962;
  unint64_t v136 = 0xE400000000000000;
  int v134 = v24;
  v25._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v25);
  swift_bridgeObjectRelease();
  uint64_t v26 = (void *)v136;
  unint64_t v130 = v135;
  uint64_t v27 = (unint64_t *)(qword_1002E31D0
                           + OBJC_IVAR____TtC13FTMInternal_425FTMCellMonitorSharedClass_metricModelsArray);
  swift_beginAccess();
  unint64_t v7 = *v27;
  char v128 = v26;
  if (v7 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v26 = v128;
    uint64_t v28 = _CocoaArrayWrapper.endIndex.getter();
  }
  else
  {
    uint64_t v28 = *(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
  }
  if (v28)
  {
    uint64_t v132 = _swiftEmptyArrayStorage;
    sub_1001B2350(0, v28 & ~(v28 >> 63), 0);
    if (v28 < 0)
    {
      __break(1u);
LABEL_236:
      __break(1u);
LABEL_237:
      uint64_t result = swift_release();
      __break(1u);
      return result;
    }
    unint64_t v0 = 0;
    uint64_t v29 = v132;
    do
    {
      if (v28 == v0) {
        goto LABEL_49;
      }
      if ((v7 & 0xC000000000000001) != 0)
      {
        uint64_t v30 = specialized _ArrayBuffer._getElementSlowPath(_:)();
      }
      else
      {
        uint64_t v30 = *(void *)(v7 + 8 * v0 + 32);
        swift_retain();
      }
      char v133 = (void *)v30;
      sub_1001FE6A0((uint64_t)&v133, &v135);
      swift_release();
      unint64_t v31 = v135;
      unint64_t v32 = v136;
      uint64_t v132 = v29;
      unint64_t v34 = v29[2];
      unint64_t v33 = v29[3];
      unint64_t v1 = v34 + 1;
      if (v34 >= v33 >> 1)
      {
        sub_1001B2350(v33 > 1, v34 + 1, 1);
        uint64_t v29 = v132;
      }
      ++v0;
      v29[2] = v1;
      uint64_t v35 = &v29[2 * v34];
      v35[4] = v31;
      v35[5] = v32;
    }
    while (v28 != v0);
    uint64_t v127 = 0;
    swift_bridgeObjectRelease();
    swift_release();
    uint64_t v26 = v128;
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v127 = 0;
  }
  uint64_t v36 = (unint64_t *)(qword_1002E31D0
                           + OBJC_IVAR____TtC13FTMInternal_425FTMCellMonitorSharedClass_metricModelsArray);
  swift_beginAccess();
  unint64_t v37 = *v36;
  unint64_t v135 = (unint64_t)_swiftEmptyArrayStorage;
  if (!(v37 >> 62))
  {
    uint64_t v38 = *(void *)((v37 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v38) {
      goto LABEL_30;
    }
LABEL_54:
    uint64_t v42 = (uint64_t)_swiftEmptyArrayStorage;
    goto LABEL_55;
  }
  swift_bridgeObjectRetain();
  uint64_t v26 = v128;
  uint64_t v38 = _CocoaArrayWrapper.endIndex.getter();
  if (!v38) {
    goto LABEL_54;
  }
LABEL_30:
  unint64_t v39 = 0;
  unint64_t v7 = (unint64_t)&OBJC_IVAR____TtC13FTMInternal_418FTMAllMetricsModel_isVisible;
  while (2)
  {
    if ((v37 & 0xC000000000000001) != 0)
    {
      unint64_t v0 = specialized _ArrayBuffer._getElementSlowPath(_:)();
      unint64_t v40 = v39 + 1;
      if (__OFADD__(v39, 1)) {
        break;
      }
      goto LABEL_36;
    }
    if (v39 >= *(void *)((v37 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      goto LABEL_50;
    }
    unint64_t v0 = *(void *)(v37 + 8 * v39 + 32);
    swift_retain();
    unint64_t v40 = v39 + 1;
    if (!__OFADD__(v39, 1))
    {
LABEL_36:
      BOOL v41 = *(void *)(v0 + 16) == v130 && *(void *)(v0 + 24) == (void)v26;
      if (v41 || (_stringCompareWithSmolCheck(_:_:expecting:)())
        && *(unsigned char *)(v0 + OBJC_IVAR____TtC13FTMInternal_418FTMAllMetricsModel_isVisible) == 1)
      {
        specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
        unint64_t v1 = *(void *)(v135 + 16);
        specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
        specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
        specialized ContiguousArray._endMutation()();
        uint64_t v26 = v128;
      }
      else
      {
        swift_release();
      }
      ++v39;
      if (v40 == v38) {
        goto LABEL_46;
      }
      continue;
    }
    break;
  }
  __break(1u);
LABEL_46:
  uint64_t v42 = v135;
LABEL_55:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  LODWORD(v43) = v42 < 0 || (v42 & 0x4000000000000000) != 0;
  if (v43) {
    goto LABEL_76;
  }
  unint64_t v23 = v127;
  if (*(void *)(v42 + 16))
  {
    while (1)
    {
      sub_100157064(&qword_1002D9670);
      unint64_t v0 = swift_allocObject();
      *(_OWORD *)(v0 + 16) = xmmword_100269B50;
      *(void *)(v0 + 56) = &type metadata for String;
      *(void *)(v0 + 32) = 0xD000000000000017;
      *(void *)(v0 + 40) = 0x800000010023FBE0;
      unint64_t v130 = v42;
      if (v43)
      {
        swift_bridgeObjectRetain();
        uint64_t v44 = _CocoaArrayWrapper.endIndex.getter();
        swift_release();
      }
      else
      {
        uint64_t v44 = *(void *)(v42 + 16);
      }
      char v45 = _swiftEmptyArrayStorage;
      if (!v44) {
        break;
      }
      char v128 = (void *)v0;
      char v133 = _swiftEmptyArrayStorage;
      uint64_t v43 = (uint64_t)&v133;
      sub_1001B2350(0, v44 & ~(v44 >> 63), 0);
      if (v44 < 0) {
        goto LABEL_236;
      }
      unint64_t v0 = 0;
      char v45 = v133;
      unint64_t v46 = v130 & 0xC000000000000001;
      while (v44 != v0)
      {
        if (v46)
        {
          uint64_t v43 = specialized _ArrayBuffer._getElementSlowPath(_:)();
        }
        else
        {
          uint64_t v43 = *(void *)(v130 + 8 * v0 + 32);
          swift_retain();
        }
        uint64_t v131 = v43;
        sub_1001FE6A0((uint64_t)&v131, &v135);
        swift_release();
        unint64_t v47 = v135;
        unint64_t v48 = v136;
        char v133 = v45;
        uint64_t v42 = v45[2];
        unint64_t v49 = v45[3];
        unint64_t v1 = v42 + 1;
        if (v42 >= v49 >> 1)
        {
          uint64_t v43 = (uint64_t)&v133;
          sub_1001B2350(v49 > 1, v42 + 1, 1);
          char v45 = v133;
        }
        ++v0;
        v45[2] = v1;
        uint64_t v50 = &v45[2 * v42];
        v50[4] = v47;
        v50[5] = v48;
        if (v44 == v0)
        {
          unint64_t v0 = (unint64_t)v128;
          goto LABEL_74;
        }
      }
      __break(1u);
LABEL_76:
      swift_bridgeObjectRetain();
      uint64_t v52 = _CocoaArrayWrapper.endIndex.getter();
      swift_release();
      unint64_t v23 = v127;
      if (!v52) {
        goto LABEL_77;
      }
    }
LABEL_74:
    *(void *)(v0 + 88) = sub_100157064(&qword_1002D9640);
    *(void *)(v0 + 64) = v45;
    print(_:separator:terminator:)();
    swift_bridgeObjectRelease();
    uint64_t v51 = v130;
  }
  else
  {
LABEL_77:
    swift_release();
    uint64_t v51 = (uint64_t)_swiftEmptyArrayStorage;
  }
  unint64_t v123 = (unint64_t)v51 >> 62;
  if ((unint64_t)v51 >> 62)
  {
    swift_bridgeObjectRetain_n();
    uint64_t v53 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v53 = *(void *)((v51 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
  }
  uint64_t v54 = _swiftEmptyArrayStorage;
  if (!v53)
  {
LABEL_153:
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    goto LABEL_154;
  }
  unint64_t v55 = 0;
  uint64_t v56 = v51 & 0xC000000000000001;
  uint64_t v57 = v51 & 0xFFFFFFFFFFFFFF8;
  uint64_t v122 = v51 + 32;
  uint64_t v127 = v51 & 0xFFFFFFFFFFFFFF8;
  if (v51 < 0) {
    uint64_t v57 = v51;
  }
  uint64_t v120 = v57;
  unint64_t v130 = v51;
  uint64_t v124 = v53;
  while (2)
  {
    char v128 = v54;
    if (v56)
    {
      uint64_t v58 = specialized _ArrayBuffer._getElementSlowPath(_:)();
    }
    else
    {
      if (v55 >= *(void *)(v127 + 16)) {
        goto LABEL_194;
      }
      uint64_t v58 = *(void *)(v122 + 8 * v55);
      swift_retain();
    }
    if (__OFADD__(v55++, 1)) {
      goto LABEL_193;
    }
    uint64_t v61 = *(void *)(v58 + 48);
    uint64_t v60 = *(void *)(v58 + 56);
    unint64_t v0 = v128[2];
    if (v0)
    {
      BOOL v62 = v128[4] == v61 && v128[5] == v60;
      if (v62 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0) {
        goto LABEL_150;
      }
      if (v0 != 1)
      {
        if (v128[6] == v61 && v128[7] == v60 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0) {
          goto LABEL_150;
        }
        if (v0 != 2)
        {
          unint64_t v1 = (unint64_t)(v128 + 9);
          uint64_t v73 = 2;
          while (1)
          {
            uint64_t v74 = v73 + 1;
            if (__OFADD__(v73, 1))
            {
LABEL_229:
              __break(1u);
              goto LABEL_230;
            }
            BOOL v75 = *(void *)(v1 - 8) == v61 && *(void *)v1 == v60;
            if (v75 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0) {
              break;
            }
            v1 += 16;
            ++v73;
            if (v74 == v0) {
              goto LABEL_97;
            }
          }
LABEL_150:
          swift_release();
          uint64_t v54 = v128;
          if (v55 == v124) {
            goto LABEL_153;
          }
          continue;
        }
      }
    }
    break;
  }
LABEL_97:
  swift_bridgeObjectRetain();
  if (swift_isUniquelyReferenced_nonNull_native())
  {
    unint64_t v63 = v130;
    uint64_t v64 = v128;
  }
  else
  {
    uint64_t v64 = sub_1001EABC4(0, v0 + 1, 1, v128);
    unint64_t v63 = v130;
  }
  unint64_t v1 = v64[2];
  unint64_t v65 = v64[3];
  unint64_t v0 = v1 + 1;
  if (v1 >= v65 >> 1) {
    uint64_t v64 = sub_1001EABC4((void *)(v65 > 1), v1 + 1, 1, v64);
  }
  v64[2] = v0;
  char v128 = v64;
  unint64_t v66 = &v64[2 * v1];
  v66[4] = v61;
  v66[5] = v60;
  unint64_t v135 = (unint64_t)_swiftEmptyArrayStorage;
  if (!v123)
  {
    uint64_t v67 = *(void *)(v127 + 16);
    swift_bridgeObjectRetain();
    swift_retain();
    if (v67) {
      goto LABEL_105;
    }
LABEL_120:
    unint64_t v70 = v135;
    swift_bridgeObjectRelease();
    swift_release();
    swift_bridgeObjectRetain();
    if ((v70 & 0x8000000000000000) != 0 || (char v71 = (void *)v70, (v70 & 0x4000000000000000) != 0))
    {
      char v71 = sub_1001B1F70(v70);
      swift_release();
    }
    unint64_t v135 = (unint64_t)v71;
    sub_1001FC3EC((uint64_t *)&v135, (void (*)(void *))sub_1001FE810);
    if (v23) {
      goto LABEL_237;
    }
    swift_release();
    unint64_t v72 = v135;
    if ((v135 & 0x8000000000000000) != 0 || (v135 & 0x4000000000000000) != 0)
    {
      swift_bridgeObjectRetain();
      uint64_t v76 = _CocoaArrayWrapper.endIndex.getter();
      swift_release();
      if (v76) {
        goto LABEL_126;
      }
    }
    else if (*(void *)(v135 + 16))
    {
LABEL_126:
      if ((v72 & 0xC000000000000001) != 0)
      {
        specialized _ArrayBuffer._getElementSlowPath(_:)();
      }
      else
      {
        if (!*(void *)(v72 + 16)) {
          goto LABEL_195;
        }
        swift_retain();
      }
      swift_release();
      swift_retain();
      specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
      unint64_t v0 = *(void *)((v137 & 0xFFFFFFFFFFFFFF8) + 0x10);
      if (v0 >= *(void *)((v137 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
      }
      specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
      specialized Array._endMutation()();
      swift_release();
      goto LABEL_150;
    }
    swift_release();
    goto LABEL_150;
  }
  swift_bridgeObjectRetain();
  swift_retain();
  uint64_t v67 = _CocoaArrayWrapper.endIndex.getter();
  if (!v67) {
    goto LABEL_120;
  }
LABEL_105:
  unint64_t v0 = 0;
  while (2)
  {
    if (v56)
    {
      unint64_t v1 = specialized _ArrayBuffer._getElementSlowPath(_:)();
      unint64_t v68 = v0 + 1;
      if (__OFADD__(v0, 1)) {
        break;
      }
      goto LABEL_114;
    }
    if (v0 >= *(void *)(v127 + 16)) {
      goto LABEL_192;
    }
    unint64_t v1 = *(void *)(v63 + 8 * v0 + 32);
    swift_retain();
    unint64_t v68 = v0 + 1;
    if (!__OFADD__(v0, 1))
    {
LABEL_114:
      BOOL v69 = *(void *)(v1 + 48) == *(void *)(v58 + 48) && *(void *)(v1 + 56) == *(void *)(v58 + 56);
      if (v69 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
      {
        specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
        specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
        unint64_t v63 = v130;
        specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
        specialized ContiguousArray._endMutation()();
      }
      else
      {
        swift_release();
      }
      ++v0;
      if (v68 == v67) {
        goto LABEL_120;
      }
      continue;
    }
    break;
  }
  __break(1u);
LABEL_192:
  __break(1u);
LABEL_193:
  __break(1u);
LABEL_194:
  __break(1u);
LABEL_195:
  __break(1u);
LABEL_196:
  swift_bridgeObjectRetain();
  uint64_t v77 = _CocoaArrayWrapper.endIndex.getter();
LABEL_156:
  uint64_t v78 = (void *)0xEC0000004E4D4C50;
  unint64_t v79 = 0x206B726F7774654ELL;
  if (v77)
  {
    if (v77 >= 1)
    {
      unint64_t v130 = v0;
      for (uint64_t i = 0; i != v77; ++i)
      {
        if ((v56 & 0xC000000000000001) != 0)
        {
          unint64_t v1 = specialized _ArrayBuffer._getElementSlowPath(_:)();
        }
        else
        {
          unint64_t v1 = *(void *)(v56 + 8 * i + 32);
          swift_retain();
        }
        BOOL v81 = *(void *)(v1 + 48) == 0x206B726F7774654ELL && *(void *)(v1 + 56) == 0xEC0000004E4D4C50;
        if (v81 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
        {
          swift_release();
        }
        else
        {
          specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
          specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
          specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
          specialized ContiguousArray._endMutation()();
        }
      }
      swift_bridgeObjectRelease();
      unint64_t v82 = v135;
      unint64_t v0 = v130;
      goto LABEL_172;
    }
LABEL_230:
    __break(1u);
LABEL_231:
    __break(1u);
LABEL_232:
    __break(1u);
LABEL_233:
    unint64_t v1 = sub_1001EB570(0, *(void *)(v1 + 16) + 1, 1, v1);
LABEL_223:
    unint64_t v116 = *(void *)(v1 + 16);
    unint64_t v115 = *(void *)(v1 + 24);
    if (v116 >= v115 >> 1) {
      unint64_t v1 = sub_1001EB570(v115 > 1, v116 + 1, 1, v1);
    }
    *(void *)(v1 + 16) = v116 + 1;
    sub_100201834(v121, v1+ ((*(unsigned __int8 *)(v126 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v126 + 80))+ *(void *)(v126 + 72) * v116);
    return v1;
  }
  swift_bridgeObjectRelease();
  unint64_t v82 = (unint64_t)_swiftEmptyArrayStorage;
LABEL_172:
  swift_bridgeObjectRetain();
  if ((v82 & 0x8000000000000000) != 0) {
    goto LABEL_214;
  }
  uint64_t v83 = (void *)v82;
  if ((v82 & 0x4000000000000000) != 0) {
    goto LABEL_214;
  }
  while (2)
  {
    unint64_t v135 = (unint64_t)v83;
    sub_1001FC3EC((uint64_t *)&v135, (void (*)(void *))sub_1001869B0);
    if (v23) {
      goto LABEL_237;
    }
    swift_release();
    unint64_t v84 = v135;
    unint64_t v135 = (unint64_t)_swiftEmptyArrayStorage;
    if (v0)
    {
      swift_bridgeObjectRetain();
      uint64_t v85 = _CocoaArrayWrapper.endIndex.getter();
      if (!v85) {
        goto LABEL_198;
      }
LABEL_177:
      if (v85 < 1) {
        goto LABEL_231;
      }
      for (uint64_t j = 0; j != v85; ++j)
      {
        if ((v56 & 0xC000000000000001) != 0)
        {
          uint64_t v87 = specialized _ArrayBuffer._getElementSlowPath(_:)();
        }
        else
        {
          uint64_t v87 = *(void *)(v56 + 8 * j + 32);
          swift_retain();
        }
        BOOL v88 = *(void *)(v87 + 48) == v79 && *(void *)(v87 + 56) == (void)v78;
        if (v88 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
        {
          specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
          specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
          specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
          specialized ContiguousArray._endMutation()();
        }
        else
        {
          swift_release();
        }
      }
      swift_bridgeObjectRelease();
      uint64_t v89 = (void *)v135;
    }
    else
    {
      uint64_t v85 = *(void *)((v56 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      if (v85) {
        goto LABEL_177;
      }
LABEL_198:
      swift_bridgeObjectRelease();
      uint64_t v89 = _swiftEmptyArrayStorage;
    }
    swift_bridgeObjectRelease();
    unint64_t v135 = v84;
    sub_100202CDC((unint64_t)v89);
    uint64_t v90 = v135;
    unint64_t v137 = v135;
    unint64_t v1 = (unint64_t)v119;
    if (!(v135 >> 62))
    {
      uint64_t v56 = *(void *)((v135 & 0xFFFFFFFFFFFFFF8) + 0x10);
      if (!v56) {
        break;
      }
      goto LABEL_201;
    }
    swift_bridgeObjectRetain();
    uint64_t v56 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (v56)
    {
LABEL_201:
      if (v56 < 1) {
        goto LABEL_232;
      }
      unint64_t v82 = 0;
      unint64_t v130 = v90 & 0xC000000000000001;
      char v128 = (void *)v90;
      while (1)
      {
        unint64_t v23 = v1;
        if (v130)
        {
          uint64_t v78 = (void *)specialized _ArrayBuffer._getElementSlowPath(_:)();
        }
        else
        {
          uint64_t v78 = *(void **)(v90 + 8 * v82 + 32);
          swift_retain();
        }
        unint64_t v91 = v78[7];
        unint64_t v135 = v78[6];
        unint64_t v136 = v91;
        swift_bridgeObjectRetain();
        v92._countAndFlagsBits = 58;
        v92._object = (void *)0xE100000000000000;
        String.append(_:)(v92);
        unint64_t v79 = v135;
        unint64_t v93 = v136;
        uint64_t v95 = v78[12];
        uint64_t v94 = v78[13];
        swift_bridgeObjectRetain();
        unint64_t v0 = v129;
        UUID.init()();
        uint64_t v96 = v125;
        uint64_t v97 = (void *)(v0 + *(int *)(v125 + 32));
        *(void *)(v0 + *(int *)(v125 + 20)) = v82 + 2;
        int v98 = (unint64_t *)(v0 + *(int *)(v96 + 24));
        *int v98 = v79;
        v98[1] = v93;
        char v99 = (void *)(v0 + *(int *)(v96 + 28));
        *char v99 = v95;
        v99[1] = v94;
        *uint64_t v97 = 0;
        v97[1] = 0;
        unint64_t v1 = v23;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          unint64_t v1 = sub_1001EB570(0, *(void *)(v23 + 16) + 1, 1, v23);
        }
        unint64_t v101 = *(void *)(v1 + 16);
        unint64_t v100 = *(void *)(v1 + 24);
        if (v101 >= v100 >> 1) {
          unint64_t v1 = sub_1001EB570(v100 > 1, v101 + 1, 1, v1);
        }
        *(void *)(v1 + 16) = v101 + 1;
        sub_100201834(v129, v1+ ((*(unsigned __int8 *)(v126 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v126 + 80))+ *(void *)(v126 + 72) * v101);
        swift_release();
        if (v82 == 0x7FFFFFFFFFFFFFFDLL) {
          break;
        }
        ++v82;
        uint64_t v90 = (uint64_t)v128;
        if (v56 == v82)
        {
          uint64_t v102 = v82 + 2;
          goto LABEL_217;
        }
      }
      __break(1u);
LABEL_214:
      uint64_t v83 = sub_1001B1F70(v82);
      swift_release();
      continue;
    }
    break;
  }
  uint64_t v102 = 2;
LABEL_217:
  swift_bridgeObjectRelease();
  uint64_t v103 = qword_1002E31C8;
  swift_beginAccess();
  uint64_t v104 = *(void *)(v103 + 80);
  unint64_t v105 = *(void *)(v104 + 16);
  if (v105)
  {
    if (*(unsigned char *)(v103 + 152))
    {
      LODWORD(v106) = 0;
      goto LABEL_221;
    }
    int64_t v106 = *(int *)(v103 + 148);
    if ((uint64_t)v105 <= v106)
    {
      int64_t v106 = v105 - 1;
      if (v105 - 1 < v105) {
        goto LABEL_222;
      }
    }
    else
    {
LABEL_221:
      int64_t v106 = (int)v106;
      if ((int)v106 < v105)
      {
LABEL_222:
        uint64_t v107 = v104 + 88 * v106;
        uint64_t v109 = *(void *)(v107 + 80);
        uint64_t v108 = *(void *)(v107 + 88);
        swift_bridgeObjectRetain();
        uint64_t v110 = v121;
        UUID.init()();
        uint64_t v111 = v125;
        uint64_t v112 = (void *)(v110 + *(int *)(v125 + 32));
        *(void *)(v110 + *(int *)(v125 + 20)) = v102;
        uint64_t v113 = v110 + *(int *)(v111 + 24);
        strcpy((char *)v113, "Phone Number:");
        *(_WORD *)(v113 + 14) = -4864;
        uint64_t v114 = (void *)(v110 + *(int *)(v111 + 28));
        *uint64_t v114 = v109;
        v114[1] = v108;
        *uint64_t v112 = 0;
        v112[1] = 0;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          goto LABEL_233;
        }
        goto LABEL_223;
      }
    }
    __break(1u);
    goto LABEL_229;
  }
  return v1;
}

uint64_t sub_1002016D4()
{
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10020170C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1001FCFA4(a1, *(void *)(v2 + 16), a2);
}

unint64_t sub_100201714()
{
  unint64_t result = qword_1002DBE20;
  if (!qword_1002DBE20)
  {
    type metadata accessor for FTMCellMonitorHardwareDetailModel();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1002DBE20);
  }
  return result;
}

unint64_t sub_10020176C()
{
  unint64_t result = qword_1002D9430;
  if (!qword_1002D9430)
  {
    sub_100157104(&qword_1002D9428);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1002D9430);
  }
  return result;
}

void sub_1002017E0()
{
  sub_10018519C(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_1002017FC()
{
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100201834(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for FTMCellMonitorHardwareDetailModel();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_10020189C()
{
  unint64_t result = qword_1002DBEA0;
  if (!qword_1002DBEA0)
  {
    sub_100157104(&qword_1002DBEA8);
    sub_10016568C();
    sub_10015D788(&qword_1002DBDD8, &qword_1002DBDC0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1002DBEA0);
  }
  return result;
}

uint64_t sub_100201950(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v11[1] = a4;
  uint64_t v6 = sub_100157064(&qword_1002DBEC8);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10015714C(a1, a1[3]);
  sub_10020205C();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  char v13 = 0;
  KeyedEncodingContainer.encode(_:forKey:)();
  if (!v4)
  {
    char v12 = 1;
    KeyedEncodingContainer.encode(_:forKey:)();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

BOOL sub_100201AC4(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_100201ADC()
{
  if (*v0) {
    return 1701667182;
  }
  else {
    return 25705;
  }
}

uint64_t sub_100201B04@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_100201DE8(a1, a2);
  *a3 = result;
  return result;
}

void sub_100201B2C(unsigned char *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_100201B38(uint64_t a1)
{
  unint64_t v2 = sub_10020205C();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100201B74(uint64_t a1)
{
  unint64_t v2 = sub_10020205C();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_100201BB0(void *a1, void *a2)
{
  if (*a1 != *a2) {
    return 0;
  }
  if (a1[1] == a2[1] && a1[2] == a2[2]) {
    return 1;
  }
  else {
    return _stringCompareWithSmolCheck(_:_:expecting:)();
  }
}

Swift::Int sub_100201BF8()
{
  Swift::UInt64 v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  swift_bridgeObjectRetain();
  String.hash(into:)();
  swift_bridgeObjectRelease();
  return Hasher._finalize()();
}

uint64_t sub_100201C6C()
{
  Hasher._combine(_:)(*v0);
  swift_bridgeObjectRetain();
  String.hash(into:)();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_100201CD0()
{
  Swift::UInt64 v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  swift_bridgeObjectRetain();
  String.hash(into:)();
  swift_bridgeObjectRelease();
  return Hasher._finalize()();
}

uint64_t sub_100201D40@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_100201EB4(a1);
  if (!v2)
  {
    *a2 = result;
    a2[1] = v5;
    a2[2] = v6;
  }
  return result;
}

uint64_t sub_100201D70(void *a1)
{
  return sub_100201950(a1, *v1, v1[1], v1[2]);
}

unint64_t sub_100201D94()
{
  unint64_t result = qword_1002DBEB0;
  if (!qword_1002DBEB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1002DBEB0);
  }
  return result;
}

uint64_t sub_100201DE8(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 25705 && a2 == 0xE200000000000000;
  if (v2 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 1701667182 && a2 == 0xE400000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_100201EB4(void *a1)
{
  uint64_t v3 = sub_100157064(&qword_1002DBEB8);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  char v6 = &v9[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v7 = a1[3];
  sub_10015714C(a1, v7);
  sub_10020205C();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (!v1)
  {
    v9[15] = 0;
    uint64_t v7 = KeyedDecodingContainer.decode(_:forKey:)();
    v9[14] = 1;
    KeyedDecodingContainer.decode(_:forKey:)();
    (*(void (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
  }
  sub_100157190((uint64_t)a1);
  return v7;
}

unint64_t sub_10020205C()
{
  unint64_t result = qword_1002DBEC0;
  if (!qword_1002DBEC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1002DBEC0);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for Genre.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x10020217CLL);
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

ValueMetadata *type metadata accessor for Genre.CodingKeys()
{
  return &type metadata for Genre.CodingKeys;
}

uint64_t initializeBufferWithCopyOfBuffer for Genre(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for Genre()
{
  return swift_bridgeObjectRelease();
}

void *assignWithCopy for Genre(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for Genre(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for Genre(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 24)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for Genre(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)unint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 24) = 1;
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
      *(void *)(result + 16) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 24) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for Genre()
{
  return &type metadata for Genre;
}

void *sub_100202314()
{
  return &protocol witness table for UInt64;
}

unint64_t sub_100202324()
{
  unint64_t result = qword_1002DBED0;
  if (!qword_1002DBED0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1002DBED0);
  }
  return result;
}

unint64_t sub_10020237C()
{
  unint64_t result = qword_1002DBED8;
  if (!qword_1002DBED8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1002DBED8);
  }
  return result;
}

unint64_t sub_1002023D4()
{
  unint64_t result = qword_1002DBEE0;
  if (!qword_1002DBEE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1002DBEE0);
  }
  return result;
}

uint64_t sub_10020242C(uint64_t a1)
{
  unint64_t v2 = *(void *)(a1 + 16);
  unint64_t v3 = *v1;
  int64_t v4 = *(void *)(*v1 + 16);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
    goto LABEL_21;
  }
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  if (isUniquelyReferenced_nonNull_native && v5 <= *(void *)(v3 + 24) >> 1)
  {
    unint64_t v8 = *(void *)(a1 + 16);
    if (v8) {
      goto LABEL_5;
    }
LABEL_18:
    if (!v2) {
      goto LABEL_19;
    }
    goto LABEL_21;
  }
  if (v4 <= v5) {
    int64_t v23 = v4 + v2;
  }
  else {
    int64_t v23 = v4;
  }
  unint64_t v3 = sub_1001EAB90(isUniquelyReferenced_nonNull_native, v23, 1, v3);
  unint64_t v8 = *(void *)(a1 + 16);
  if (!v8) {
    goto LABEL_18;
  }
LABEL_5:
  uint64_t v9 = *(void *)(v3 + 16);
  uint64_t v10 = (*(void *)(v3 + 24) >> 1) - v9;
  uint64_t v11 = *(void *)(type metadata accessor for Metric(0) - 8);
  uint64_t v12 = *(void *)(v11 + 72);
  if (v10 < (uint64_t)v8)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  unint64_t v13 = (*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  unint64_t v14 = v3 + v13 + v12 * v9;
  unint64_t v15 = a1 + v13;
  uint64_t v16 = v12 * v8;
  unint64_t v17 = v14 + v16;
  unint64_t v18 = v15 + v16;
  if (v15 < v17 && v14 < v18) {
    goto LABEL_24;
  }
  swift_arrayInitWithCopy();
  if (v8 < v2)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  uint64_t v20 = *(void *)(v3 + 16);
  BOOL v21 = __OFADD__(v20, v8);
  uint64_t v22 = v20 + v8;
  if (!v21)
  {
    *(void *)(v3 + 16) = v22;
LABEL_19:
    uint64_t result = swift_bridgeObjectRelease();
    *uint64_t v1 = v3;
    return result;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_1002025DC(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  unint64_t v3 = *(void **)v1;
  int64_t v4 = *(void *)(*(void *)v1 + 16);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  int isUniquelyReferenced_nonNull_native = (void *)swift_isUniquelyReferenced_nonNull_native();
  if (isUniquelyReferenced_nonNull_native && v5 <= v3[3] >> 1)
  {
    if (*(void *)(a1 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_18;
  }
  if (v4 <= v5) {
    int64_t v14 = v4 + v2;
  }
  else {
    int64_t v14 = v4;
  }
  unint64_t v3 = sub_1001EACD4(isUniquelyReferenced_nonNull_native, v14, 1, v3);
  if (!*(void *)(a1 + 16))
  {
LABEL_18:
    if (!v2) {
      goto LABEL_19;
    }
    goto LABEL_21;
  }
LABEL_5:
  uint64_t v8 = v3[2];
  if ((v3[3] >> 1) - v8 < v2)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  unint64_t v9 = (unint64_t)&v3[11 * v8 + 4];
  if (a1 + 32 < v9 + 88 * v2 && v9 < a1 + 32 + 88 * v2) {
    goto LABEL_24;
  }
  swift_arrayInitWithCopy();
  if (!v2)
  {
LABEL_19:
    uint64_t result = swift_bridgeObjectRelease();
    *(void *)uint64_t v1 = v3;
    return result;
  }
  uint64_t v11 = v3[2];
  BOOL v12 = __OFADD__(v11, v2);
  uint64_t v13 = v11 + v2;
  if (!v12)
  {
    v3[2] = v13;
    goto LABEL_19;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_100202738(unint64_t a1)
{
  return sub_100202CF4(a1, (uint64_t (*)(uint64_t, void, unint64_t))sub_100209328);
}

uint64_t sub_100202750(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 16);
  int64_t v4 = *v2;
  int64_t v5 = (*v2)[2];
  int64_t v6 = v5 + v3;
  if (__OFADD__(v5, v3))
  {
    __break(1u);
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  uint64_t v7 = a1;
  int isUniquelyReferenced_nonNull_native = (void *)swift_isUniquelyReferenced_nonNull_native();
  char *v2 = v4;
  if (!isUniquelyReferenced_nonNull_native || (int64_t v9 = v4[3] >> 1, v9 < v6))
  {
    if (v5 <= v6) {
      int64_t v10 = v5 + v3;
    }
    else {
      int64_t v10 = v5;
    }
    int64_t v4 = sub_1001EB2D0(isUniquelyReferenced_nonNull_native, v10, 1, v4);
    char *v2 = v4;
    int64_t v9 = v4[3] >> 1;
  }
  uint64_t v11 = v4[2];
  uint64_t v12 = v9 - v11;
  uint64_t v13 = sub_1001B4F24(v55, &v4[6 * v11 + 4], v9 - v11, v7);
  if ((uint64_t)v13 < v3) {
    goto LABEL_17;
  }
  if (v13)
  {
    uint64_t v14 = v4[2];
    BOOL v15 = __OFADD__(v14, v13);
    uint64_t v16 = (char *)v13 + v14;
    if (v15)
    {
      __break(1u);
      goto LABEL_22;
    }
    v4[2] = v16;
  }
  if (v13 == (void *)v12)
  {
LABEL_18:
    uint64_t v12 = v4[2];
    int64_t v4 = (void *)v55[0];
    uint64_t v46 = v55[1];
    uint64_t v7 = v57;
    if (v58)
    {
      unint64_t v18 = (v58 - 1) & v58;
      unint64_t v19 = __clz(__rbit64(v58)) | (v57 << 6);
      uint64_t v20 = v56;
LABEL_20:
      BOOL v21 = (uint64_t *)(v4[6] + 16 * v19);
      uint64_t v23 = *v21;
      uint64_t v22 = v21[1];
      sub_100196D64(v4[7] + 32 * v19, (uint64_t)&v53);
      *(void *)&long long v52 = v23;
      *((void *)&v52 + 1) = v22;
      swift_bridgeObjectRetain();
      uint64_t v3 = v7;
LABEL_44:
      sub_100209FC0((uint64_t)&v52, (uint64_t)&v49);
      if (!*((void *)&v49 + 1))
      {
LABEL_82:
        sub_10015D658((uint64_t)&v52, &qword_1002D96A0);
        sub_1001B6994();
        return sub_10015D658((uint64_t)&v49, &qword_1002D96A0);
      }
      int64_t v47 = (unint64_t)(v20 + 64) >> 6;
      while (1)
      {
        sub_10015D658((uint64_t)&v49, &qword_1002D96A0);
        uint64_t v29 = *v2;
        unint64_t v30 = (*v2)[3];
        int64_t v31 = v30 >> 1;
        if ((uint64_t)(v30 >> 1) < v12 + 1)
        {
          uint64_t v29 = sub_1001EB2D0((void *)(v30 > 1), v12 + 1, 1, *v2);
          char *v2 = v29;
          int64_t v31 = v29[3] >> 1;
        }
        sub_100209FC0((uint64_t)&v52, (uint64_t)v48);
        if (*((void *)&v48[0] + 1)) {
          break;
        }
        int64_t v38 = v3;
LABEL_81:
        sub_10015D658((uint64_t)v48, &qword_1002D96A0);
        uint64_t v3 = v38;
        int64_t v31 = v12;
LABEL_47:
        (*v2)[2] = v31;
        sub_100209FC0((uint64_t)&v52, (uint64_t)&v49);
        if (!*((void *)&v49 + 1)) {
          goto LABEL_82;
        }
      }
      unint64_t v32 = v29 + 4;
      if (v12 > v31) {
        int64_t v31 = v12;
      }
      while (1)
      {
        long long v49 = v48[0];
        long long v50 = v48[1];
        long long v51 = v48[2];
        if (v12 == v31)
        {
          sub_10015D658((uint64_t)&v49, (uint64_t *)&unk_1002D96B0);
          uint64_t v12 = v31;
          goto LABEL_47;
        }
        uint64_t result = sub_10015D658((uint64_t)&v52, &qword_1002D96A0);
        unint64_t v39 = &v32[6 * v12];
        long long v41 = v50;
        long long v40 = v51;
        *unint64_t v39 = v49;
        v39[1] = v41;
        v39[2] = v40;
        if (!v18) {
          break;
        }
        unint64_t v33 = __clz(__rbit64(v18));
        v18 &= v18 - 1;
        unint64_t v34 = v33 | (v3 << 6);
LABEL_55:
        uint64_t v35 = (uint64_t *)(v4[6] + 16 * v34);
        uint64_t v36 = *v35;
        uint64_t v37 = v35[1];
        sub_100196D64(v4[7] + 32 * v34, (uint64_t)&v53);
        *(void *)&long long v52 = v36;
        *((void *)&v52 + 1) = v37;
        swift_bridgeObjectRetain();
        int64_t v38 = v3;
LABEL_56:
        ++v12;
        sub_100209FC0((uint64_t)&v52, (uint64_t)v48);
        if (!*((void *)&v48[0] + 1)) {
          goto LABEL_81;
        }
      }
      int64_t v42 = v3 + 1;
      if (__OFADD__(v3, 1))
      {
        __break(1u);
        return result;
      }
      if (v42 >= v47)
      {
        int64_t v38 = v3;
LABEL_64:
        unint64_t v18 = 0;
        long long v53 = 0u;
        long long v54 = 0u;
        uint64_t v3 = v38;
        long long v52 = 0u;
        goto LABEL_56;
      }
      unint64_t v43 = *(void *)(v46 + 8 * v42);
      if (!v43)
      {
        int64_t v44 = v3 + 2;
        int64_t v38 = v3 + 1;
        if (v3 + 2 >= v47) {
          goto LABEL_64;
        }
        unint64_t v43 = *(void *)(v46 + 8 * v44);
        if (!v43)
        {
          int64_t v38 = v3 + 2;
          if (v3 + 3 >= v47) {
            goto LABEL_64;
          }
          unint64_t v43 = *(void *)(v46 + 8 * (v3 + 3));
          if (v43)
          {
            int64_t v42 = v3 + 3;
            goto LABEL_62;
          }
          int64_t v44 = v3 + 4;
          int64_t v38 = v3 + 3;
          if (v3 + 4 >= v47) {
            goto LABEL_64;
          }
          unint64_t v43 = *(void *)(v46 + 8 * v44);
          if (!v43)
          {
            int64_t v42 = v3 + 5;
            int64_t v38 = v3 + 4;
            if (v3 + 5 >= v47) {
              goto LABEL_64;
            }
            unint64_t v43 = *(void *)(v46 + 8 * v42);
            if (!v43)
            {
              uint64_t v45 = v3 + 6;
              while (v47 != v45)
              {
                unint64_t v43 = *(void *)(v46 + 8 * v45++);
                if (v43)
                {
                  int64_t v42 = v45 - 1;
                  goto LABEL_62;
                }
              }
              int64_t v38 = v47 - 1;
              goto LABEL_64;
            }
            goto LABEL_62;
          }
        }
        int64_t v42 = v44;
      }
LABEL_62:
      unint64_t v18 = (v43 - 1) & v43;
      unint64_t v34 = __clz(__rbit64(v43)) + (v42 << 6);
      uint64_t v3 = v42;
      goto LABEL_55;
    }
LABEL_22:
    int64_t v24 = v7 + 1;
    if (__OFADD__(v7, 1))
    {
      __break(1u);
LABEL_42:
      uint64_t v20 = v1;
    }
    else
    {
      uint64_t v20 = v56;
      int64_t v25 = (unint64_t)(v56 + 64) >> 6;
      uint64_t v3 = v7;
      if (v24 < v25)
      {
        unint64_t v26 = *(void *)(v46 + 8 * v24);
        if (v26)
        {
LABEL_25:
          unint64_t v18 = (v26 - 1) & v26;
          unint64_t v19 = __clz(__rbit64(v26)) + (v24 << 6);
          uint64_t v7 = v24;
          goto LABEL_20;
        }
        uint64_t v27 = v7 + 2;
        uint64_t v3 = v7 + 1;
        if (v7 + 2 < v25)
        {
          uint64_t v1 = v56;
          unint64_t v26 = *(void *)(v46 + 8 * v27);
          if (v26)
          {
LABEL_28:
            int64_t v24 = v27;
LABEL_29:
            uint64_t v20 = v56;
            goto LABEL_25;
          }
          uint64_t v3 = v7 + 2;
          if (v7 + 3 < v25)
          {
            unint64_t v26 = *(void *)(v46 + 8 * (v7 + 3));
            if (v26)
            {
              int64_t v24 = v7 + 3;
              goto LABEL_29;
            }
            uint64_t v27 = v7 + 4;
            uint64_t v3 = v7 + 3;
            uint64_t v20 = v56;
            if (v7 + 4 < v25)
            {
              unint64_t v26 = *(void *)(v46 + 8 * v27);
              if (v26) {
                goto LABEL_28;
              }
              int64_t v24 = v7 + 5;
              uint64_t v3 = v7 + 4;
              uint64_t v20 = v56;
              if (v7 + 5 < v25)
              {
                unint64_t v26 = *(void *)(v46 + 8 * v24);
                if (v26) {
                  goto LABEL_25;
                }
                uint64_t v3 = v25 - 1;
                uint64_t v28 = v7 + 6;
                do
                {
                  if (v25 == v28) {
                    goto LABEL_42;
                  }
                  unint64_t v26 = *(void *)(v46 + 8 * v28++);
                }
                while (!v26);
                int64_t v24 = v28 - 1;
                goto LABEL_29;
              }
            }
          }
        }
      }
    }
    unint64_t v18 = 0;
    long long v53 = 0u;
    long long v54 = 0u;
    long long v52 = 0u;
    goto LABEL_44;
  }

  return sub_1001B6994();
}

uint64_t sub_100202CDC(unint64_t a1)
{
  return sub_100202CF4(a1, (uint64_t (*)(uint64_t, void, unint64_t))sub_100209104);
}

uint64_t sub_100202CF4(unint64_t a1, uint64_t (*a2)(uint64_t, void, unint64_t))
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v5 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v5 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  if (!((unint64_t)*v2 >> 62))
  {
    uint64_t v6 = *(void *)((*v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t v7 = v6 + v5;
    if (!__OFADD__(v6, v5)) {
      goto LABEL_5;
    }
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  swift_bridgeObjectRetain();
  uint64_t v17 = _CocoaArrayWrapper.endIndex.getter();
  swift_bridgeObjectRelease();
  uint64_t v7 = v17 + v5;
  if (__OFADD__(v17, v5)) {
    goto LABEL_21;
  }
LABEL_5:
  unint64_t v8 = *v2;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  uint64_t *v2 = v8;
  if (isUniquelyReferenced_nonNull_bridgeObject)
  {
    if ((v8 & 0x8000000000000000) == 0 && (v8 & 0x4000000000000000) == 0)
    {
      uint64_t v10 = v8 & 0xFFFFFFFFFFFFFF8;
      if (v7 <= *(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        goto LABEL_11;
      }
    }
  }
  if (v8 >> 62) {
    goto LABEL_23;
  }
  while (1)
  {
    swift_bridgeObjectRetain();
    uint64_t v11 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)();
    swift_bridgeObjectRelease();
    uint64_t *v2 = v11;
    uint64_t v10 = v11 & 0xFFFFFFFFFFFFFF8;
LABEL_11:
    uint64_t result = a2(v10 + 8 * *(void *)(v10 + 16) + 32, (*(void *)(v10 + 24) >> 1) - *(void *)(v10 + 16), a1);
    if (v13 >= v5) {
      break;
    }
LABEL_22:
    __break(1u);
LABEL_23:
    swift_bridgeObjectRetain();
    _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  if (v13 >= 1)
  {
    uint64_t v14 = *(void *)((*v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
    BOOL v15 = __OFADD__(v14, v13);
    uint64_t v16 = v14 + v13;
    if (v15)
    {
      __break(1u);
      return result;
    }
    *(void *)((*v2 & 0xFFFFFFFFFFFFFF8) + 0x10) = v16;
  }
  swift_bridgeObjectRelease();

  return specialized Array._endMutation()();
}

uint64_t sub_100202EC8(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  if (!((unint64_t)*v1 >> 62))
  {
    uint64_t v4 = *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t v5 = v4 + v3;
    if (!__OFADD__(v4, v3)) {
      goto LABEL_5;
    }
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  swift_bridgeObjectRetain();
  uint64_t v15 = _CocoaArrayWrapper.endIndex.getter();
  swift_bridgeObjectRelease();
  uint64_t v5 = v15 + v3;
  if (__OFADD__(v15, v3)) {
    goto LABEL_21;
  }
LABEL_5:
  unint64_t v6 = *v1;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *uint64_t v1 = v6;
  if (isUniquelyReferenced_nonNull_bridgeObject)
  {
    if ((v6 & 0x8000000000000000) == 0 && (v6 & 0x4000000000000000) == 0)
    {
      uint64_t v8 = v6 & 0xFFFFFFFFFFFFFF8;
      if (v5 <= *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        goto LABEL_11;
      }
    }
  }
  if (v6 >> 62) {
    goto LABEL_23;
  }
  while (1)
  {
    swift_bridgeObjectRetain();
    uint64_t v9 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)();
    swift_bridgeObjectRelease();
    *uint64_t v1 = v9;
    uint64_t v8 = v9 & 0xFFFFFFFFFFFFFF8;
LABEL_11:
    uint64_t result = sub_10020955C(v8 + 8 * *(void *)(v8 + 16) + 32, (*(void *)(v8 + 24) >> 1) - *(void *)(v8 + 16), a1);
    if (v11 >= v3) {
      break;
    }
LABEL_22:
    __break(1u);
LABEL_23:
    swift_bridgeObjectRetain();
    _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  if (v11 >= 1)
  {
    uint64_t v12 = *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    BOOL v13 = __OFADD__(v12, v11);
    uint64_t v14 = v12 + v11;
    if (v13)
    {
      __break(1u);
      return result;
    }
    *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10) = v14;
  }
  swift_bridgeObjectRelease();

  return specialized Array._endMutation()();
}

void sub_100203094()
{
  qword_1002E32B8 = 0x402C000000000000;
}

void sub_1002030A4()
{
  qword_1002E32C0 = 0x4034000000000000;
}

id sub_1002030B4()
{
  type metadata accessor for CellularLoggingViewController();
  id v0 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) init];
  id v1 = [objc_allocWithZone((Class)UINavigationController) initWithRootViewController:v0];

  return v1;
}

uint64_t sub_100203120()
{
  return UIViewControllerRepresentable.sizeThatFits(_:uiViewController:context:)();
}

uint64_t sub_10020315C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_10020A048();

  return static UIViewControllerRepresentable._makeView(view:inputs:)(a1, a2, a3, v6);
}

uint64_t sub_1002031C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_10020A048();

  return static UIViewControllerRepresentable._makeViewList(view:inputs:)(a1, a2, a3, v6);
}

void sub_100203224()
{
}

uint64_t (*sub_10020324C())()
{
  return j__swift_endAccess;
}

id sub_1002032AC()
{
  return sub_100203738(&OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController____lazy_storage___tableView, (uint64_t (*)(uint64_t))sub_1002032CC);
}

id sub_1002032CC(void *a1)
{
  id v2 = [objc_allocWithZone((Class)UITableView) initWithFrame:0 style:0.0];
  type metadata accessor for FavoritesTableCellV2();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  swift_bridgeObjectRetain();
  NSString v4 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v2 registerClass:ObjCClassFromMetadata forCellReuseIdentifier:v4];

  [v2 setSeparatorStyle:0];
  uint64_t v5 = self;
  id v6 = v2;
  id v7 = [v5 systemBackgroundColor];
  [v6 setBackgroundColor:v7];

  [v6 setDataSource:a1];
  [v6 setDelegate:a1];
  [v6 setAlwaysBounceVertical:1];
  id result = [a1 view];
  if (!result)
  {
    __break(1u);
    goto LABEL_8;
  }
  uint64_t v9 = result;
  [result frame];
  double v11 = v10;

  id result = [a1 view];
  if (!result)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  uint64_t v12 = result;
  [result frame];
  double v14 = v13;

  id result = [a1 view];
  if (!result)
  {
LABEL_9:
    __break(1u);
    return result;
  }
  uint64_t v15 = result;
  [result frame];
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  CGFloat v21 = v20;
  CGFloat v23 = v22;

  v26.origin.x = v17;
  v26.origin.y = v19;
  v26.size.width = v21;
  v26.size.height = v23;
  double Width = CGRectGetWidth(v26);
  if (qword_1002D7B68 != -1) {
    swift_once();
  }
  id v25 = [objc_allocWithZone((Class)UIView) initWithFrame:v11, v14, Width, *(double *)&qword_1002E32B8];
  [v6 setTableHeaderView:v25];

  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
  return v6;
}

id sub_10020358C()
{
  uint64_t v1 = OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController____lazy_storage___separatorView;
  id v2 = *(void **)(v0 + OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController____lazy_storage___separatorView);
  if (v2)
  {
    id v3 = *(id *)(v0 + OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController____lazy_storage___separatorView);
  }
  else
  {
    id v4 = [objc_allocWithZone((Class)UIView) init];
    id v5 = [self lightGrayColor];
    [v4 setBackgroundColor:v5];

    [v4 setTranslatesAutoresizingMaskIntoConstraints:0];
    id v6 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v4;
    id v3 = v4;

    id v2 = 0;
  }
  id v7 = v2;
  return v3;
}

id sub_100203654()
{
  uint64_t v1 = OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController____lazy_storage___loadingView;
  id v2 = *(void **)(v0 + OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController____lazy_storage___loadingView);
  if (v2)
  {
    id v3 = *(id *)(v0 + OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController____lazy_storage___loadingView);
  }
  else
  {
    uint64_t v4 = v0;
    id v5 = objc_allocWithZone((Class)type metadata accessor for LoadingView());
    id v6 = sub_100198918(0xD000000000000020, 0x800000010023FF70, 0.0, 0.0, 0.0, 0.0);
    [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v6 setHidden:0];
    id v7 = *(void **)(v4 + v1);
    *(void *)(v4 + v1) = v6;
    id v3 = v6;

    id v2 = 0;
  }
  id v8 = v2;
  return v3;
}

id sub_100203718()
{
  return sub_100203738(&OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController____lazy_storage___currentConfigButton, (uint64_t (*)(uint64_t))sub_10020379C);
}

id sub_100203738(uint64_t *a1, uint64_t (*a2)(uint64_t))
{
  uint64_t v3 = *a1;
  uint64_t v4 = *(void **)(v2 + *a1);
  if (v4)
  {
    id v5 = *(id *)(v2 + *a1);
  }
  else
  {
    id v6 = (void *)a2(v2);
    id v7 = *(void **)(v2 + v3);
    *(void *)(v2 + v3) = v6;
    id v5 = v6;

    uint64_t v4 = 0;
  }
  id v8 = v4;
  return v5;
}

id sub_10020379C(uint64_t a1)
{
  id v2 = [objc_allocWithZone((Class)UIButton) init];
  [v2 setClipsToBounds:1];
  NSString v3 = String._bridgeToObjectiveC()();
  uint64_t v4 = self;
  id v5 = [v4 colorNamed:v3];

  [v2 setTitleColor:v5 forState:0];
  id v6 = [v4 grayColor];
  id v7 = sub_100209A9C(0xD000000000000013, 0x800000010023CC40, 0x746C7561666544, (void *)0xE700000000000000, (uint64_t)v6);

  [v2 setAttributedTitle:v7 forState:0];
  id v8 = [v2 titleLabel];
  if (v8)
  {
    uint64_t v9 = v8;
    id v10 = [self systemFontOfSize:18.0];
    [v9 setFont:v10];
  }
  [v2 addTarget:a1 action:"didTapConfig" forControlEvents:1];
  [v2 setTranslatesAutoresizingMaskIntoConstraints:0];

  return v2;
}

id sub_10020396C()
{
  return sub_10020398C(&OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController____lazy_storage___startButton, 0x7472617453, &selRef_didTapStart);
}

id sub_10020398C(uint64_t *a1, uint64_t a2, void *a3)
{
  uint64_t v4 = *a1;
  id v5 = *(void **)(v3 + *a1);
  if (v5)
  {
    id v6 = *(id *)(v3 + *a1);
  }
  else
  {
    id v7 = sub_100203A0C(v3, a2, a3);
    id v8 = *(void **)(v3 + v4);
    *(void *)(v3 + v4) = v7;
    id v6 = v7;

    id v5 = 0;
  }
  id v9 = v5;
  return v6;
}

id sub_1002039EC()
{
  return sub_10020398C(&OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController____lazy_storage___resetButton, 0x7465736552, &selRef_didTapReset);
}

id sub_100203A0C(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = [objc_allocWithZone((Class)UIButton) init];
  NSString v6 = String._bridgeToObjectiveC()();
  [v5 setTitle:v6 forState:0];

  id v7 = [v5 titleLabel];
  if (v7)
  {
    id v8 = v7;
    id v9 = self;
    if (qword_1002D7B70 != -1) {
      swift_once();
    }
    id v10 = [v9 systemFontOfSize:*(double *)&qword_1002E32C0 weight:UIFontWeightRegular];
    [v8 setFont:v10];
  }
  NSString v11 = String._bridgeToObjectiveC()();
  uint64_t v12 = self;
  id v13 = [v12 colorNamed:v11];

  [v5 setTitleColor:v13 forState:0];
  [v5 addTarget:a1 action:*a3 forControlEvents:1];
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v14 = [v5 layer];
  [v14 setCornerRadius:12.0];

  id v15 = [v5 layer];
  [v15 setBorderWidth:1.0];

  [v5 setClipsToBounds:1];
  id v16 = [v5 layer];
  NSString v17 = String._bridgeToObjectiveC()();
  id v18 = [v12 colorNamed:v17];

  if (v18)
  {
    id v19 = [v18 CGColor];
  }
  else
  {
    id v19 = 0;
  }
  [v16 setBorderColor:v19];

  return v5;
}

id sub_100203CF0()
{
  return sub_100203738(&OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController____lazy_storage___stopButton, (uint64_t (*)(uint64_t))sub_100203D10);
}

id sub_100203D10(uint64_t a1)
{
  id v2 = [objc_allocWithZone((Class)UIButton) init];
  NSString v3 = String._bridgeToObjectiveC()();
  [v2 setTitle:v3 forState:0];

  NSString v4 = String._bridgeToObjectiveC()();
  id v5 = self;
  id v6 = [v5 colorNamed:v4];

  [v2 setTitleColor:v6 forState:0];
  id v7 = [v2 titleLabel];
  if (v7)
  {
    id v8 = v7;
    id v9 = self;
    if (qword_1002D7B70 != -1) {
      swift_once();
    }
    id v10 = [v9 systemFontOfSize:*(double *)&qword_1002E32C0 weight:UIFontWeightRegular];
    [v8 setFont:v10];
  }
  [v2 addTarget:a1 action:"didTapStop" forControlEvents:1];
  [v2 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v11 = [v2 layer];
  [v11 setCornerRadius:12.0];

  id v12 = [v2 layer];
  [v12 setBorderWidth:1.0];

  [v2 setClipsToBounds:1];
  id v13 = [v2 layer];
  NSString v14 = String._bridgeToObjectiveC()();
  id v15 = [v5 colorNamed:v14];

  if (v15)
  {
    id v16 = [v15 CGColor];
  }
  else
  {
    id v16 = 0;
  }
  [v13 setBorderColor:v16];

  return v2;
}

id sub_100203FEC()
{
  return sub_10020400C(&OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController____lazy_storage___chunkFileSlider, &selRef_didChangedChunkFileSliderValue_, 1024.0, 32.0);
}

id sub_10020400C(uint64_t *a1, void *a2, float a3, float a4)
{
  uint64_t v5 = *a1;
  id v6 = *(void **)(v4 + *a1);
  if (v6)
  {
    id v7 = *(id *)(v4 + *a1);
  }
  else
  {
    id v8 = sub_100204114(v4, a2, a3, a4);
    id v9 = *(void **)(v4 + v5);
    *(void *)(v4 + v5) = v8;
    id v7 = v8;

    id v6 = 0;
  }
  id v10 = v6;
  return v7;
}

id sub_10020406C()
{
  uint64_t v1 = OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController____lazy_storage___chunkFileSizeLabel;
  id v2 = *(void **)(v0
                + OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController____lazy_storage___chunkFileSizeLabel);
  if (v2)
  {
    id v3 = *(id *)(v0 + OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController____lazy_storage___chunkFileSizeLabel);
  }
  else
  {
    id v4 = sub_100209BD4(0xD000000000000010, 0x80000001002400D0, 0x624B20323320, (void *)0xE600000000000000);
    uint64_t v5 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v4;
    id v3 = v4;

    id v2 = 0;
  }
  id v6 = v2;
  return v3;
}

id sub_1002040F4()
{
  return sub_10020400C(&OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController____lazy_storage___maxNumberOfLogsSlider, &selRef_didChangedMaxLogsSlider_, 8192.0, 256.0);
}

id sub_100204114(uint64_t a1, void *a2, float a3, float a4)
{
  id v8 = [objc_allocWithZone((Class)UISlider) init];
  NSString v9 = String._bridgeToObjectiveC()();
  id v10 = self;
  id v11 = [v10 colorNamed:v9];

  [v8 setMinimumTrackTintColor:v11];
  NSString v12 = String._bridgeToObjectiveC()();
  id v13 = [v10 colorNamed:v12];

  [v8 setMaximumTrackTintColor:v13];
  id v14 = [v10 whiteColor];
  [v8 setThumbTintColor:v14];

  *(float *)&double v15 = a3;
  [v8 setMaximumValue:v15];
  *(float *)&double v16 = a4;
  [v8 setMinimumValue:v16];
  *(float *)&double v17 = a4;
  [v8 setValue:1 animated:v17];
  [v8 addTarget:a1 action:*a2 forControlEvents:4096];
  [v8 setTranslatesAutoresizingMaskIntoConstraints:0];
  return v8;
}

id sub_1002042D4()
{
  uint64_t v1 = OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController____lazy_storage___maxNumberOfLogsLabel;
  id v2 = *(void **)(v0
                + OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController____lazy_storage___maxNumberOfLogsLabel);
  if (v2)
  {
    id v3 = *(id *)(v0
               + OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController____lazy_storage___maxNumberOfLogsLabel);
  }
  else
  {
    id v4 = sub_100209BD4(0x20676F6C2078614DLL, 0xED00003A656C6966, 0x6C69662036353220, (void *)0xEA00000000007365);
    uint64_t v5 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v4;
    id v3 = v4;

    id v2 = 0;
  }
  id v6 = v2;
  return v3;
}

void sub_10020436C()
{
  v6.receiver = v0;
  v6.super_class = (Class)type metadata accessor for CellularLoggingViewController();
  [super viewDidLoad];
  if (qword_1002D7A80 != -1) {
    swift_once();
  }
  static os_log_type_t.default.getter();
  os_log(_:dso:log:type:_:)();
  NSString v1 = String._bridgeToObjectiveC()();
  [v0 setTitle:v1];

  id v2 = [objc_allocWithZone((Class)type metadata accessor for CellularLoggingService()) init];
  uint64_t v3 = OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController_cellularLoggingService;
  id v4 = *(void **)&v0[OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController_cellularLoggingService];
  *(void *)&v0[OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController_cellularLoggingService] = v2;

  uint64_t v5 = *(void *)&v0[v3];
  if (v5)
  {
    *(void *)(v5 + OBJC_IVAR____TtC13FTMInternal_422CellularLoggingService_delegate + 8) = &off_10028F458;
    swift_unknownObjectWeakAssign();
  }
  sub_10020659C();
}

uint64_t sub_10020462C()
{
  uint64_t v0 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v40 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for DispatchQoS();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  id v7 = (char *)&v40 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for DispatchTime();
  uint64_t v9 = __chkstk_darwin(v8);
  id v11 = (char *)&v40 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = __chkstk_darwin(v9);
  double v15 = (char *)&v40 - v13;
  if (qword_1002D7B18 != -1)
  {
    uint64_t v45 = v0;
    uint64_t v34 = result;
    uint64_t v35 = (char *)&v40 - v13;
    uint64_t v36 = v7;
    uint64_t v37 = v3;
    uint64_t v38 = v14;
    swift_once();
    uint64_t v14 = v38;
    uint64_t v3 = v37;
    id v7 = v36;
    double v15 = v35;
    uint64_t result = v34;
    uint64_t v0 = v45;
  }
  if ((*(unsigned char *)(qword_1002E31C8 + 145) & 1) == 0)
  {
    uint64_t v40 = result;
    uint64_t v41 = v14;
    uint64_t v44 = v1;
    uint64_t v45 = v0;
    uint64_t v42 = v5;
    uint64_t v43 = v4;
    *(unsigned char *)(qword_1002E31C8 + 145) = 1;
    double v17 = sub_10020324C();
    unint64_t v18 = *v16;
    if (!*v16)
    {
      CGFloat v23 = v15;
      id v25 = v7;
      ((void (*)(void *, void))v17)(aBlock, 0);
      goto LABEL_15;
    }
    id v19 = v16;
    if (!(v18 >> 62))
    {
      char isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
      unint64_t v18 = *v19;
      if (isUniquelyReferenced_nonNull_bridgeObject)
      {
        CGFloat v21 = v17;
        if (!(v18 >> 62))
        {
          uint64_t v22 = *(void *)((v18 & 0xFFFFFFFFFFFFFF8) + 0x10);
LABEL_9:
          CGFloat v23 = v15;
          sub_1001B699C(0, v22);
LABEL_13:
          id v25 = v7;
          ((void (*)(void *, void))v21)(aBlock, 0);
LABEL_15:
          id v26 = sub_1002032AC();
          [v26 reloadData];

          id v27 = sub_10020396C();
          sub_1001810E4();

          if (qword_1002D7A80 != -1) {
            swift_once();
          }
          static os_log_type_t.default.getter();
          os_log(_:dso:log:type:_:)();
          sub_100167598(0, (unint64_t *)&qword_1002D95F0);
          uint64_t v28 = (void *)static OS_dispatch_queue.main.getter();
          static DispatchTime.now()();
          uint64_t v29 = v23;
          + infix(_:_:)();
          uint64_t v30 = v40;
          uint64_t v41 = *(void *)(v41 + 8);
          ((void (*)(char *, uint64_t))v41)(v11, v40);
          uint64_t v31 = swift_allocObject();
          swift_unknownObjectWeakInit();
          aBlock[4] = sub_100209FB8;
          aBlock[5] = v31;
          aBlock[0] = _NSConcreteStackBlock;
          aBlock[1] = 1107296256;
          aBlock[2] = sub_1001E0068;
          aBlock[3] = &unk_10028F500;
          unint64_t v32 = _Block_copy(aBlock);
          swift_release();
          static DispatchQoS.unspecified.getter();
          aBlock[0] = _swiftEmptyArrayStorage;
          sub_100195820();
          sub_100157064((uint64_t *)&unk_1002D9600);
          sub_10015D788((unint64_t *)&qword_1002DA570, (uint64_t *)&unk_1002D9600);
          uint64_t v33 = v45;
          dispatch thunk of SetAlgebra.init<A>(_:)();
          OS_dispatch_queue.asyncAfter(deadline:qos:flags:execute:)();
          _Block_release(v32);

          (*(void (**)(char *, uint64_t))(v44 + 8))(v3, v33);
          (*(void (**)(char *, uint64_t))(v42 + 8))(v25, v43);
          return ((uint64_t (*)(char *, uint64_t))v41)(v29, v30);
        }
        goto LABEL_23;
      }
    }
    CGFloat v21 = v17;
    if (v18 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v24 = _CocoaArrayWrapper.endIndex.getter();
      uint64_t result = _CocoaArrayWrapper.endIndex.getter();
      if (result < 0) {
        goto LABEL_25;
      }
      uint64_t v39 = _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
      if (v24 < 0 || v39 < v24)
      {
        __break(1u);
LABEL_23:
        swift_bridgeObjectRetain();
        uint64_t v22 = _CocoaArrayWrapper.endIndex.getter();
        uint64_t result = swift_bridgeObjectRelease();
        if ((v22 & 0x8000000000000000) == 0) {
          goto LABEL_9;
        }
        __break(1u);
LABEL_25:
        __break(1u);
        return result;
      }
    }
    else
    {
      uint64_t v24 = *(void *)((v18 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1;
    }
    CGFloat v23 = v15;
    *id v19 = (unint64_t)sub_1001B3538(0, v24);
    swift_bridgeObjectRelease();
    goto LABEL_13;
  }
  return result;
}

uint64_t sub_100204C4C()
{
  swift_beginAccess();
  uint64_t result = swift_unknownObjectWeakLoadStrong();
  if (result)
  {
    uint64_t v1 = (void *)result;
    swift_bridgeObjectRetain();
    id v2 = sub_100203FEC();
    [v2 value];
    float v4 = v3;

    id v5 = sub_1002040F4();
    [v5 value];
    float v7 = v6;

    sub_1002063A4(v4, v7);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_100204E74()
{
  uint64_t v0 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v23 = *(void *)(v0 - 8);
  uint64_t v24 = v0;
  __chkstk_darwin(v0);
  id v2 = (char *)&v19 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = type metadata accessor for DispatchQoS();
  uint64_t v21 = *(void *)(v3 - 8);
  uint64_t v22 = v3;
  __chkstk_darwin(v3);
  id v5 = (char *)&v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for DispatchTime();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  NSString v12 = (char *)&v19 - v11;
  if (qword_1002D7A80 != -1) {
    swift_once();
  }
  static os_log_type_t.default.getter();
  os_log(_:dso:log:type:_:)();
  sub_100167598(0, (unint64_t *)&qword_1002D95F0);
  uint64_t v13 = (void *)static OS_dispatch_queue.main.getter();
  static DispatchTime.now()();
  + infix(_:_:)();
  double v20 = *(void (**)(char *, uint64_t))(v7 + 8);
  v20(v10, v6);
  uint64_t v14 = swift_allocObject();
  swift_unknownObjectWeakInit();
  aBlock[4] = sub_100209FB0;
  aBlock[5] = v14;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1001E0068;
  aBlock[3] = &unk_10028F4D8;
  double v15 = _Block_copy(aBlock);
  swift_release();
  static DispatchQoS.unspecified.getter();
  aBlock[0] = _swiftEmptyArrayStorage;
  sub_100195820();
  sub_100157064((uint64_t *)&unk_1002D9600);
  uint64_t v16 = v6;
  sub_10015D788((unint64_t *)&qword_1002DA570, (uint64_t *)&unk_1002D9600);
  uint64_t v17 = v24;
  dispatch thunk of SetAlgebra.init<A>(_:)();
  OS_dispatch_queue.asyncAfter(deadline:qos:flags:execute:)();
  _Block_release(v15);

  (*(void (**)(char *, uint64_t))(v23 + 8))(v2, v17);
  (*(void (**)(char *, uint64_t))(v21 + 8))(v5, v22);
  return ((uint64_t (*)(char *, uint64_t))v20)(v12, v16);
}

void sub_100205280()
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v1 = (void *)Strong;
    id v2 = *(void **)(Strong + OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController_cellularLoggingService);
    if (v2)
    {
      uint64_t v3 = qword_1002D7B18;
      uint64_t v4 = v2;
      if (v3 != -1) {
        swift_once();
      }
      *(unsigned char *)(qword_1002E31C8 + 145) = 0;
      id v5 = *(id *)&v4[OBJC_IVAR____TtC13FTMInternal_422CellularLoggingService_cellularLogging];
      id v6 = [v5 stop];

      uint64_t v1 = v6;
    }
  }
}

uint64_t sub_10020536C()
{
  uint64_t v0 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v23 = *(void *)(v0 - 8);
  uint64_t v24 = v0;
  __chkstk_darwin(v0);
  id v2 = (char *)&v19 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = type metadata accessor for DispatchQoS();
  uint64_t v21 = *(void *)(v3 - 8);
  uint64_t v22 = v3;
  __chkstk_darwin(v3);
  id v5 = (char *)&v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for DispatchTime();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  NSString v12 = (char *)&v19 - v11;
  id v13 = sub_1002039EC();
  sub_1001810E4();

  if (qword_1002D7A80 != -1) {
    swift_once();
  }
  static os_log_type_t.default.getter();
  os_log(_:dso:log:type:_:)();
  sub_100167598(0, (unint64_t *)&qword_1002D95F0);
  uint64_t v14 = (void *)static OS_dispatch_queue.main.getter();
  static DispatchTime.now()();
  + infix(_:_:)();
  double v20 = *(void (**)(char *, uint64_t))(v7 + 8);
  v20(v10, v6);
  uint64_t v15 = swift_allocObject();
  swift_unknownObjectWeakInit();
  aBlock[4] = sub_100209F90;
  aBlock[5] = v15;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1001E0068;
  aBlock[3] = &unk_10028F4B0;
  uint64_t v16 = _Block_copy(aBlock);
  swift_release();
  static DispatchQoS.unspecified.getter();
  aBlock[0] = _swiftEmptyArrayStorage;
  sub_100195820();
  sub_100157064((uint64_t *)&unk_1002D9600);
  sub_10015D788((unint64_t *)&qword_1002DA570, (uint64_t *)&unk_1002D9600);
  uint64_t v17 = v24;
  dispatch thunk of SetAlgebra.init<A>(_:)();
  OS_dispatch_queue.asyncAfter(deadline:qos:flags:execute:)();
  _Block_release(v16);

  (*(void (**)(char *, uint64_t))(v23 + 8))(v2, v17);
  (*(void (**)(char *, uint64_t))(v21 + 8))(v5, v22);
  return ((uint64_t (*)(char *, uint64_t))v20)(v12, v6);
}

void sub_100205788()
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v1 = (void *)Strong;
    id v2 = *(void **)(Strong + OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController_cellularLoggingService);
    if (v2)
    {
      id v3 = v2;
      sub_10020610C();

      uint64_t v1 = v3;
    }
  }
}

void sub_100205844()
{
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController_cellularLoggingService);
  if (v1)
  {
    uint64_t v2 = qword_1002D7A80;
    id v3 = v1;
    if (v2 != -1) {
      swift_once();
    }
    static os_log_type_t.default.getter();
    os_log(_:dso:log:type:_:)();
    id v4 = [*(id *)&v3[OBJC_IVAR____TtC13FTMInternal_422CellularLoggingService_cellularLogging] getConfigurationList];
  }
}

void sub_100205980(void *a1)
{
  id v1 = a1;
  [a1 value];
  float v3 = v2;
  id v4 = sub_100203FEC();
  [v4 minimumValue];
  float v6 = v5;

  if (v3 != v6) {
    goto LABEL_6;
  }
  id v1 = sub_100203FEC();
  [v1 minimumValue];
  float v8 = v7;

  if ((~LODWORD(v8) & 0x7F800000) == 0)
  {
    __break(1u);
    goto LABEL_16;
  }
  if (v8 <= -9.2234e18)
  {
LABEL_16:
    __break(1u);
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  if (v8 < 9.2234e18)
  {
LABEL_14:
    id v19 = sub_10020406C();
    uint64_t v24 = dispatch thunk of CustomStringConvertible.description.getter();
    id v25 = v20;
    swift_bridgeObjectRetain();
    v21._countAndFlagsBits = 6441760;
    v21._object = (void *)0xE300000000000000;
    String.append(_:)(v21);
    swift_bridgeObjectRelease();
    id v22 = [self grayColor];
    id v23 = sub_100209A9C(0xD000000000000011, 0x800000010023FFE0, v24, v25, (uint64_t)v22);
    swift_bridgeObjectRelease();

    [v19 setAttributedText:v23];
    return;
  }
  __break(1u);
LABEL_6:
  [v1 value];
  float v10 = v9;
  id v11 = sub_100203FEC();
  [v11 maximumValue];
  float v13 = v12;

  if (v10 != v13) {
    goto LABEL_11;
  }
  id v1 = sub_100203FEC();
  [v1 maximumValue];
  float v15 = v14;

  if ((~LODWORD(v15) & 0x7F800000) == 0) {
    goto LABEL_17;
  }
  if (v15 <= -9.2234e18)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  if (v15 < 9.2234e18) {
    goto LABEL_14;
  }
  __break(1u);
LABEL_11:
  [v1 value];
  float v17 = roundf(v16 * 0.03125) * 32.0;
  *(float *)&double v18 = v17;
  [v1 setValue:v18];
  if ((~LODWORD(v17) & 0x7F800000) == 0)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  if (v17 <= -9.2234e18)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  if (v17 < 9.2234e18) {
    goto LABEL_14;
  }
LABEL_21:
  __break(1u);
}

void sub_100205C78(void *a1)
{
  id v1 = a1;
  [a1 value];
  float v3 = v2;
  id v4 = sub_100203FEC();
  [v4 minimumValue];
  float v6 = v5;

  if (v3 != v6) {
    goto LABEL_6;
  }
  id v1 = sub_100203FEC();
  [v1 minimumValue];
  float v8 = v7;

  if ((~LODWORD(v8) & 0x7F800000) == 0)
  {
    __break(1u);
    goto LABEL_16;
  }
  if (v8 <= -9.2234e18)
  {
LABEL_16:
    __break(1u);
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  if (v8 < 9.2234e18)
  {
LABEL_14:
    id v19 = sub_1002042D4();
    uint64_t v24 = dispatch thunk of CustomStringConvertible.description.getter();
    id v25 = v20;
    swift_bridgeObjectRetain();
    v21._countAndFlagsBits = 0x73656C696620;
    v21._object = (void *)0xE600000000000000;
    String.append(_:)(v21);
    swift_bridgeObjectRelease();
    id v22 = [self grayColor];
    id v23 = sub_100209A9C(0x20676F6C2078614DLL, 0xEE00203A656C6966, v24, v25, (uint64_t)v22);
    swift_bridgeObjectRelease();

    [v19 setAttributedText:v23];
    return;
  }
  __break(1u);
LABEL_6:
  [v1 value];
  float v10 = v9;
  id v11 = sub_100203FEC();
  [v11 maximumValue];
  float v13 = v12;

  if (v10 != v13) {
    goto LABEL_11;
  }
  id v1 = sub_100203FEC();
  [v1 maximumValue];
  float v15 = v14;

  if ((~LODWORD(v15) & 0x7F800000) == 0) {
    goto LABEL_17;
  }
  if (v15 <= -9.2234e18)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  if (v15 < 9.2234e18) {
    goto LABEL_14;
  }
  __break(1u);
LABEL_11:
  [v1 value];
  float v17 = roundf(v16);
  *(float *)&double v18 = v17;
  [v1 setValue:v18];
  if ((~LODWORD(v17) & 0x7F800000) == 0)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  if (v17 <= -9.2234e18)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  if (v17 < 9.2234e18) {
    goto LABEL_14;
  }
LABEL_21:
  __break(1u);
}

void sub_100205F6C(uint64_t a1)
{
  float v3 = (objc_class *)type metadata accessor for MultiChoiceSelectionModal();
  id v4 = (char *)objc_allocWithZone(v3);
  *(void *)&v4[OBJC_IVAR____TtC13FTMInternal_425MultiChoiceSelectionModal____lazy_storage___tableView] = 0;
  *(void *)&v4[OBJC_IVAR____TtC13FTMInternal_425MultiChoiceSelectionModal_delegate + 8] = 0;
  swift_unknownObjectWeakInit();
  uint64_t v5 = OBJC_IVAR____TtC13FTMInternal_425MultiChoiceSelectionModal_dismissButton;
  swift_bridgeObjectRetain();
  float v6 = v4;
  *(void *)&v4[v5] = sub_1001A57B4();
  *(void *)&v6[OBJC_IVAR____TtC13FTMInternal_425MultiChoiceSelectionModal_tableViewData] = a1;

  v8.receiver = v6;
  v8.super_class = v3;
  float v7 = [super initWithNibName:0 bundle:0];
  if (qword_1002D7A80 != -1) {
    swift_once();
  }
  static os_log_type_t.default.getter();
  os_log(_:dso:log:type:_:)();
  [v7 setTransitioningDelegate:v1];
  *(void *)&v7[OBJC_IVAR____TtC13FTMInternal_425MultiChoiceSelectionModal_delegate + 8] = &off_10028F448;
  swift_unknownObjectWeakAssign();
  [v7 setModalPresentationStyle:4];
  [v1 presentViewController:v7 animated:1 completion:0];
}

void sub_10020610C()
{
  if (qword_1002D7A80 != -1) {
    swift_once();
  }
  static os_log_type_t.default.getter();
  os_log(_:dso:log:type:_:)();
  id v1 = sub_10020324C();
  unint64_t v2 = *v0;
  if (!*v0) {
    goto LABEL_12;
  }
  float v3 = v0;
  if (!(v2 >> 62))
  {
    char isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
    unint64_t v2 = *v3;
    if (isUniquelyReferenced_nonNull_bridgeObject)
    {
      if (!(v2 >> 62))
      {
        uint64_t v5 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
LABEL_8:
        sub_1001B699C(0, v5);
LABEL_12:
        ((void (*)(uint64_t *, void))v1)(&v15, 0);
        id v7 = sub_1002032AC();
        [v7 reloadData];

        id v8 = sub_100203654();
        [v8 setHidden:0];

        id v9 = sub_100203654();
        id v10 = sub_100198740();

        NSString v11 = String._bridgeToObjectiveC()();
        [v10 setText:v11];

        id v12 = sub_100203654();
        id v13 = sub_100198638();

        [v13 stopAnimating];
        return;
      }
      goto LABEL_17;
    }
  }
  if (!(v2 >> 62))
  {
    uint64_t v6 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1;
    goto LABEL_11;
  }
  swift_bridgeObjectRetain();
  uint64_t v6 = _CocoaArrayWrapper.endIndex.getter();
  if (_CocoaArrayWrapper.endIndex.getter() < 0) {
    goto LABEL_19;
  }
  uint64_t v14 = _CocoaArrayWrapper.endIndex.getter();
  swift_bridgeObjectRelease();
  if ((v6 & 0x8000000000000000) == 0 && v14 >= v6)
  {
LABEL_11:
    *float v3 = (unint64_t)sub_1001B3538(0, v6);
    swift_bridgeObjectRelease();
    goto LABEL_12;
  }
  __break(1u);
LABEL_17:
  swift_bridgeObjectRetain();
  uint64_t v5 = _CocoaArrayWrapper.endIndex.getter();
  swift_bridgeObjectRelease();
  if ((v5 & 0x8000000000000000) == 0) {
    goto LABEL_8;
  }
  __break(1u);
LABEL_19:
  __break(1u);
}

void sub_1002063A4(float a1, float a2)
{
  float v3 = *(char **)(v2 + OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController_cellularLoggingService);
  if (v3)
  {
    id v4 = *(void **)&v3[OBJC_IVAR____TtC13FTMInternal_422CellularLoggingService_cellularLogging];
    if (v4)
    {
      id v7 = objc_allocWithZone((Class)CellularLoggingConfiguration);
      id v8 = v3;
      id v18 = v4;
      id v9 = [v7 init];
      NSString v10 = String._bridgeToObjectiveC()();
      [v9 setActiveConfig:v10];

      id v11 = objc_allocWithZone((Class)NSNumber);
      *(float *)&double v12 = a1;
      id v13 = [v11 initWithFloat:v12];
      [v9 setChunkFileSize:v13];

      id v14 = objc_allocWithZone((Class)NSNumber);
      *(float *)&double v15 = a2;
      id v16 = [v14 initWithFloat:v15];
      [v9 setMaxNumberOfLogs:v16];

      if (qword_1002D7A90 != -1) {
        swift_once();
      }
      static os_log_type_t.default.getter();
      os_log(_:dso:log:type:_:)();
      id v17 = [v18 start:v9];
    }
  }
}

void sub_10020659C()
{
  id v1 = v0;
  id v2 = [v0 view];
  if (!v2)
  {
    __break(1u);
    goto LABEL_17;
  }
  float v3 = v2;
  id v4 = sub_1002032AC();
  [v3 addSubview:v4];

  id v5 = [v1 view];
  if (!v5)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  uint64_t v6 = v5;
  id v7 = sub_100203654();
  [v6 addSubview:v7];

  id v8 = [v1 view];
  if (!v8)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  id v9 = v8;
  NSString v10 = *(void **)&v1[OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController_containerView];
  [v8 addSubview:v10];

  [v10 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v11 = sub_10020358C();
  [v10 addSubview:v11];

  id v12 = sub_100203718();
  [v10 addSubview:v12];

  id v13 = sub_100203FEC();
  [v10 addSubview:v13];

  id v14 = sub_1002040F4();
  [v10 addSubview:v14];

  id v15 = sub_10020406C();
  [v10 addSubview:v15];

  id v16 = sub_1002042D4();
  [v10 addSubview:v16];

  id v17 = *(void **)&v1[OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController_stackView];
  [v10 addSubview:v17];
  id v18 = [self whiteColor];
  [v10 setBackgroundColor:v18];

  [v17 setAxis:0];
  [v17 setAlignment:3];
  [v17 setSpacing:10.0];
  [v17 setDistribution:1];
  [v17 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v19 = self;
  sub_100157064((uint64_t *)&unk_1002D8290);
  uint64_t v20 = swift_allocObject();
  *(_OWORD *)(v20 + 16) = xmmword_100269400;
  id v21 = [v17 leftAnchor];
  id v22 = [v10 safeAreaLayoutGuide];
  id v23 = [v22 leftAnchor];

  id v24 = [v21 constraintEqualToAnchor:v23 constant:5.0];
  *(void *)(v20 + 32) = v24;
  id v25 = [v17 rightAnchor];
  id v26 = [v10 safeAreaLayoutGuide];
  id v27 = [v26 rightAnchor];

  id v28 = [v25 constraintEqualToAnchor:v27 constant:-5.0];
  *(void *)(v20 + 40) = v28;
  id v29 = [v17 bottomAnchor];
  id v30 = [v10 safeAreaLayoutGuide];
  id v31 = [v30 bottomAnchor];

  id v32 = [v29 constraintEqualToAnchor:v31 constant:-5.0];
  *(void *)(v20 + 48) = v32;
  specialized Array._endMutation()();
  sub_100167598(0, (unint64_t *)&qword_1002D9800);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  [v19 activateConstraints:isa];

  id v34 = sub_10020396C();
  [v17 addArrangedSubview:v34];

  id v35 = sub_100203CF0();
  [v17 addArrangedSubview:v35];

  id v36 = sub_1002039EC();
  [v17 addArrangedSubview:v36];

  uint64_t v37 = swift_allocObject();
  *(_OWORD *)(v37 + 16) = xmmword_10026C580;
  id v38 = [v10 leftAnchor];
  id v39 = [v1 view];
  if (!v39)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  uint64_t v40 = v39;
  id v41 = [v39 safeAreaLayoutGuide];

  id v42 = [v41 leftAnchor];
  id v43 = [v38 constraintEqualToAnchor:v42];

  *(void *)(v37 + 32) = v43;
  id v44 = [v10 rightAnchor];
  id v45 = [v1 view];
  if (!v45)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  uint64_t v46 = v45;
  id v47 = [v45 safeAreaLayoutGuide];

  id v48 = [v47 rightAnchor];
  id v49 = [v44 constraintEqualToAnchor:v48];

  *(void *)(v37 + 40) = v49;
  id v50 = [v10 topAnchor];
  id v51 = [v1 view];
  if (!v51)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  long long v52 = v51;
  id v53 = [v51 safeAreaLayoutGuide];

  id v54 = [v53 topAnchor];
  id v55 = [v50 constraintEqualToAnchor:v54];

  *(void *)(v37 + 48) = v55;
  id v56 = [v10 heightAnchor];
  id v57 = [v56 constraintEqualToConstant:200.0];

  *(void *)(v37 + 56) = v57;
  id v58 = sub_100203718();
  id v59 = [v58 topAnchor];

  id v60 = [v10 safeAreaLayoutGuide];
  id v61 = [v60 topAnchor];

  id v62 = [v59 constraintEqualToAnchor:v61 constant:5.0];
  *(void *)(v37 + 64) = v62;
  id v63 = sub_100203718();
  id v64 = [v63 leftAnchor];

  id v65 = sub_10020358C();
  id v66 = [v65 leftAnchor];

  id v67 = [v64 constraintEqualToAnchor:v66];
  *(void *)(v37 + 72) = v67;
  id v68 = sub_10020406C();
  id v69 = [v68 leftAnchor];

  id v70 = sub_10020358C();
  id v71 = [v70 leftAnchor];

  id v72 = [v69 constraintEqualToAnchor:v71];
  *(void *)(v37 + 80) = v72;
  id v73 = sub_10020406C();
  id v74 = [v73 topAnchor];

  id v75 = sub_100203718();
  id v76 = [v75 safeAreaLayoutGuide];

  id v77 = [v76 bottomAnchor];
  id v78 = [v74 constraintEqualToAnchor:v77];

  *(void *)(v37 + 88) = v78;
  id v79 = sub_100203FEC();
  id v80 = [v79 leftAnchor];

  id v81 = sub_10020358C();
  id v82 = [v81 leftAnchor];

  id v83 = [v80 constraintEqualToAnchor:v82];
  *(void *)(v37 + 96) = v83;
  id v84 = sub_100203FEC();
  id v85 = [v84 topAnchor];

  id v86 = sub_10020406C();
  id v87 = [v86 safeAreaLayoutGuide];

  id v88 = [v87 bottomAnchor];
  id v89 = [v85 constraintEqualToAnchor:v88];

  *(void *)(v37 + 104) = v89;
  id v90 = sub_100203FEC();
  id v91 = [v90 widthAnchor];

  id v92 = [v10 widthAnchor];
  id v93 = [v91 constraintEqualToAnchor:v92 constant:-40.0];

  *(void *)(v37 + 112) = v93;
  id v94 = sub_1002042D4();
  id v95 = [v94 leftAnchor];

  id v96 = sub_10020358C();
  id v97 = [v96 leftAnchor];

  id v98 = [v95 constraintEqualToAnchor:v97];
  *(void *)(v37 + 120) = v98;
  id v99 = sub_1002042D4();
  id v100 = [v99 topAnchor];

  id v101 = sub_100203FEC();
  id v102 = [v101 safeAreaLayoutGuide];

  id v103 = [v102 bottomAnchor];
  id v104 = [v100 constraintEqualToAnchor:v103];

  *(void *)(v37 + 128) = v104;
  id v105 = sub_1002040F4();
  id v106 = [v105 leftAnchor];

  id v107 = sub_10020358C();
  id v108 = [v107 leftAnchor];

  id v109 = [v106 constraintEqualToAnchor:v108];
  *(void *)(v37 + 136) = v109;
  id v110 = sub_1002040F4();
  id v111 = [v110 topAnchor];

  id v112 = sub_1002042D4();
  id v113 = [v112 safeAreaLayoutGuide];

  id v114 = [v113 bottomAnchor];
  id v115 = [v111 constraintEqualToAnchor:v114];

  *(void *)(v37 + 144) = v115;
  id v116 = sub_1002040F4();
  id v117 = [v116 widthAnchor];

  id v118 = [v10 widthAnchor];
  id v119 = [v117 constraintEqualToAnchor:v118 constant:-40.0];

  *(void *)(v37 + 152) = v119;
  id v120 = sub_10020358C();
  id v121 = [v120 centerXAnchor];

  id v122 = [v10 centerXAnchor];
  id v123 = [v121 constraintEqualToAnchor:v122];

  *(void *)(v37 + 160) = v123;
  id v124 = sub_10020358C();
  id v125 = [v124 bottomAnchor];

  id v126 = [v17 safeAreaLayoutGuide];
  id v127 = [v126 topAnchor];

  id v128 = [v125 constraintEqualToAnchor:v127 constant:-5.0];
  *(void *)(v37 + 168) = v128;
  id v129 = sub_10020358C();
  id v130 = [v129 heightAnchor];

  id v131 = [v130 constraintEqualToConstant:1.0];
  *(void *)(v37 + 176) = v131;
  id v132 = sub_10020358C();
  id v133 = [v132 widthAnchor];

  id v134 = [v10 widthAnchor];
  id v135 = [v133 constraintEqualToAnchor:v134 constant:-40.0];

  *(void *)(v37 + 184) = v135;
  specialized Array._endMutation()();
  Class v136 = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  [v19 activateConstraints:v136];

  uint64_t v137 = swift_allocObject();
  *(_OWORD *)(v137 + 16) = xmmword_100268000;
  id v138 = sub_1002032AC();
  id v139 = [v138 topAnchor];

  id v140 = [v10 bottomAnchor];
  id v141 = [v139 constraintEqualToAnchor:v140];

  *(void *)(v137 + 32) = v141;
  id v142 = sub_1002032AC();
  id v143 = [v142 leadingAnchor];

  id v144 = [v1 view];
  if (!v144)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  BOOL v145 = v144;
  id v146 = [v144 safeAreaLayoutGuide];

  id v147 = [v146 leadingAnchor];
  id v148 = [v143 constraintEqualToAnchor:v147];

  *(void *)(v137 + 40) = v148;
  id v149 = sub_1002032AC();
  id v150 = [v149 trailingAnchor];

  id v151 = [v1 view];
  if (!v151)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  v152 = v151;
  id v153 = [v151 safeAreaLayoutGuide];

  id v154 = [v153 trailingAnchor];
  id v155 = [v150 constraintEqualToAnchor:v154];

  *(void *)(v137 + 48) = v155;
  id v156 = sub_1002032AC();
  id v157 = [v156 bottomAnchor];

  id v158 = [v1 view];
  if (!v158)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  uint64_t v159 = v158;
  id v160 = [v158 safeAreaLayoutGuide];

  id v161 = [v160 bottomAnchor];
  id v162 = [v157 constraintEqualToAnchor:v161];

  *(void *)(v137 + 56) = v162;
  specialized Array._endMutation()();
  Class v163 = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  [v19 activateConstraints:v163];

  uint64_t v164 = swift_allocObject();
  *(_OWORD *)(v164 + 16) = xmmword_100268000;
  id v165 = sub_100203654();
  id v166 = [v165 topAnchor];

  id v167 = [v10 bottomAnchor];
  id v168 = [v166 constraintEqualToAnchor:v167];

  *(void *)(v164 + 32) = v168;
  id v169 = sub_100203654();
  id v170 = [v169 leadingAnchor];

  id v171 = [v1 view];
  if (!v171)
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  uint64_t v172 = v171;
  id v173 = [v171 safeAreaLayoutGuide];

  id v174 = [v173 leadingAnchor];
  id v175 = [v170 constraintEqualToAnchor:v174];

  *(void *)(v164 + 40) = v175;
  id v176 = sub_100203654();
  id v177 = [v176 trailingAnchor];

  id v178 = [v1 view];
  if (!v178)
  {
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  uint64_t v179 = v178;
  id v180 = [v178 safeAreaLayoutGuide];

  id v181 = [v180 trailingAnchor];
  id v182 = [v177 constraintEqualToAnchor:v181];

  *(void *)(v164 + 48) = v182;
  id v183 = sub_100203654();
  id v184 = [v183 bottomAnchor];

  id v185 = [v1 view];
  if (!v185)
  {
LABEL_27:
    __break(1u);
    return;
  }
  uint64_t v186 = v185;
  id v187 = [v185 safeAreaLayoutGuide];

  id v188 = [v187 bottomAnchor];
  id v189 = [v184 constraintEqualToAnchor:v188];

  *(void *)(v164 + 56) = v189;
  specialized Array._endMutation()();
  Class v190 = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  [v19 activateConstraints:v190];
}

id sub_100207AC0(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6 = OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController_transition;
  id v7 = objc_allocWithZone((Class)type metadata accessor for CircularTransition());
  id v8 = v3;
  *(void *)&v3[v6] = [v7 init];
  uint64_t v9 = OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController_stackView;
  *(void *)&v8[v9] = [objc_allocWithZone((Class)UIStackView) init];
  *(void *)&v8[OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController_cellularLoggingService] = 0;
  *(void *)&v8[OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController_cellularData] = 0;
  *(void *)&v8[OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController_cellularConfigurations] = _swiftEmptyArrayStorage;
  NSString v10 = &v8[OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController_currentLogConfiguration];
  *(void *)NSString v10 = 0x746C7561666544;
  *((void *)v10 + 1) = 0xE700000000000000;
  id v11 = &v8[OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController_loadingViewContext];
  *(void *)id v11 = 0;
  *((void *)v11 + 1) = 0xE000000000000000;
  uint64_t v12 = OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController_maxNumberOfLogs;
  sub_100167598(0, &qword_1002D9690);
  *(NSNumber *)&v8[v12] = NSNumber.init(integerLiteral:)(0);
  *(void *)&v8[OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController____lazy_storage___tableView] = 0;
  *(void *)&v8[OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController____lazy_storage___separatorView] = 0;
  *(void *)&v8[OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController____lazy_storage___loadingView] = 0;
  *(void *)&v8[OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController____lazy_storage___currentConfigButton] = 0;
  *(void *)&v8[OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController____lazy_storage___startButton] = 0;
  *(void *)&v8[OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController____lazy_storage___resetButton] = 0;
  *(void *)&v8[OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController____lazy_storage___stopButton] = 0;
  *(void *)&v8[OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController_fixedValues] = _swiftEmptyArrayStorage;
  *(void *)&v8[OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController____lazy_storage___chunkFileSlider] = 0;
  *(void *)&v8[OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController____lazy_storage___chunkFileSizeLabel] = 0;
  *(void *)&v8[OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController____lazy_storage___maxNumberOfLogsSlider] = 0;
  *(void *)&v8[OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController____lazy_storage___maxNumberOfLogsLabel] = 0;
  uint64_t v13 = OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController_containerView;
  *(void *)&v8[v13] = [objc_allocWithZone((Class)UIView) init];

  if (a2)
  {
    NSString v14 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v14 = 0;
  }
  v17.receiver = v8;
  v17.super_class = (Class)type metadata accessor for CellularLoggingViewController();
  [super initWithNibName:v14 bundle:a3];

  return v15;
}

id sub_100207D58(void *a1)
{
  uint64_t v3 = OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController_transition;
  id v4 = objc_allocWithZone((Class)type metadata accessor for CircularTransition());
  id v5 = v1;
  *(void *)&v1[v3] = [v4 init];
  uint64_t v6 = OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController_stackView;
  *(void *)&v5[v6] = [objc_allocWithZone((Class)UIStackView) init];
  *(void *)&v5[OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController_cellularLoggingService] = 0;
  *(void *)&v5[OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController_cellularData] = 0;
  *(void *)&v5[OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController_cellularConfigurations] = _swiftEmptyArrayStorage;
  id v7 = &v5[OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController_currentLogConfiguration];
  *(void *)id v7 = 0x746C7561666544;
  *((void *)v7 + 1) = 0xE700000000000000;
  id v8 = &v5[OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController_loadingViewContext];
  *(void *)id v8 = 0;
  *((void *)v8 + 1) = 0xE000000000000000;
  uint64_t v9 = OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController_maxNumberOfLogs;
  sub_100167598(0, &qword_1002D9690);
  *(NSNumber *)&v5[v9] = NSNumber.init(integerLiteral:)(0);
  *(void *)&v5[OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController____lazy_storage___tableView] = 0;
  *(void *)&v5[OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController____lazy_storage___separatorView] = 0;
  *(void *)&v5[OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController____lazy_storage___loadingView] = 0;
  *(void *)&v5[OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController____lazy_storage___currentConfigButton] = 0;
  *(void *)&v5[OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController____lazy_storage___startButton] = 0;
  *(void *)&v5[OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController____lazy_storage___resetButton] = 0;
  *(void *)&v5[OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController____lazy_storage___stopButton] = 0;
  *(void *)&v5[OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController_fixedValues] = _swiftEmptyArrayStorage;
  *(void *)&v5[OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController____lazy_storage___chunkFileSlider] = 0;
  *(void *)&v5[OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController____lazy_storage___chunkFileSizeLabel] = 0;
  *(void *)&v5[OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController____lazy_storage___maxNumberOfLogsSlider] = 0;
  *(void *)&v5[OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController____lazy_storage___maxNumberOfLogsLabel] = 0;
  uint64_t v10 = OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController_containerView;
  *(void *)&v5[v10] = [objc_allocWithZone((Class)UIView) init];

  v13.receiver = v5;
  v13.super_class = (Class)type metadata accessor for CellularLoggingViewController();
  [super initWithCoder:a1];

  return v11;
}

void sub_100207F7C()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  objc_release(*(id *)(v0
                     + OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController____lazy_storage___separatorView));

  objc_release(*(id *)(v0
                     + OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController____lazy_storage___currentConfigButton));

  swift_bridgeObjectRelease();
  objc_release(*(id *)(v0
                     + OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController____lazy_storage___chunkFileSlider));
  objc_release(*(id *)(v0
                     + OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController____lazy_storage___chunkFileSizeLabel));
  objc_release(*(id *)(v0
                     + OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController____lazy_storage___maxNumberOfLogsSlider));
  objc_release(*(id *)(v0
                     + OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController____lazy_storage___maxNumberOfLogsLabel));
  id v1 = *(void **)(v0 + OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController_containerView);
}

id sub_1002080F4()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CellularLoggingViewController();
  return [super dealloc];
}

uint64_t type metadata accessor for CellularLoggingViewController()
{
  return self;
}

uint64_t sub_1002082D0()
{
  return sub_100204E74();
}

void sub_1002082F4(unint64_t a1)
{
  if (qword_1002D7A90 != -1) {
    swift_once();
  }
  static os_log_type_t.default.getter();
  os_log(_:dso:log:type:_:)();
  uint64_t v3 = (unint64_t *)(v1 + OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController_cellularData);
  swift_beginAccess();
  if (*v3)
  {
    if (*v3 >> 62)
    {
      swift_bridgeObjectRetain();
      _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
    }
    sub_1002084D0(a1);
    id v4 = sub_10020324C();
    if (*v5)
    {
      unint64_t v6 = swift_bridgeObjectRetain();
      sub_100202EC8(v6);
    }
    ((void (*)(unsigned char *, void))v4)(v10, 0);
  }
  else
  {
    *uint64_t v3 = a1;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  id v7 = sub_100203654();
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v8 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v8 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  [v7 setHidden:v8 > 0];

  id v9 = sub_1002032AC();
  [v9 reloadData];
}

void sub_1002084D0(unint64_t a1)
{
  uint64_t v2 = v1;
  id v4 = (unint64_t *)(v1 + OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController_cellularData);
  swift_beginAccess();
  unint64_t v5 = *v4;
  if (*v4)
  {
    if (!(v5 >> 62))
    {
      uint64_t v6 = v5 & 0xFFFFFFFFFFFFFF8;
LABEL_6:
      uint64_t v7 = *(void *)(v6 + 16);
      goto LABEL_7;
    }
  }
  else if (!(a1 >> 62))
  {
    uint64_t v6 = a1 & 0xFFFFFFFFFFFFFF8;
    goto LABEL_6;
  }
  swift_bridgeObjectRetain();
  uint64_t v7 = _CocoaArrayWrapper.endIndex.getter();
  swift_bridgeObjectRelease();
LABEL_7:
  if (v7 < (uint64_t)[*(id *)(v2 + OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController_maxNumberOfLogs) integerValue])return; {
  unint64_t v8 = *v4;
  }
  if (*v4)
  {
    if (v8 >> 62)
    {
      swift_bridgeObjectRetain();
      id v9 = (unint64_t *)_CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
    }
    else
    {
      id v9 = *(unint64_t **)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    if (qword_1002D7A90 != -1) {
      swift_once();
    }
    uint64_t v10 = (uint64_t (*)())qword_1002E3140;
    static os_log_type_t.default.getter();
    sub_100157064((uint64_t *)&unk_1002D97F0);
    uint64_t v11 = swift_allocObject();
    *(_OWORD *)(v11 + 16) = xmmword_100267EF0;
    if (a1 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v23 = _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
      objc_super v13 = (char *)v9 + v23;
      if (!__OFADD__(v9, v23)) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v12 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
      objc_super v13 = (char *)v9 + v12;
      if (!__OFADD__(v9, v12))
      {
LABEL_15:
        *(void *)(v11 + 56) = &type metadata for Int;
        *(void *)(v11 + 64) = &protocol witness table for Int;
        *(void *)(v11 + 32) = v13;
        os_log(_:dso:log:type:_:)();
        swift_bridgeObjectRelease();
        goto LABEL_16;
      }
    }
    __break(1u);
    goto LABEL_35;
  }
LABEL_16:
  uint64_t v10 = sub_10020324C();
  unint64_t v15 = *v14;
  if (*v14)
  {
    id v9 = v14;
    if (!(v15 >> 62))
    {
      char isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
      unint64_t v15 = *v9;
      if (isUniquelyReferenced_nonNull_bridgeObject)
      {
        if (!(v15 >> 62))
        {
          uint64_t v17 = *(void *)((v15 & 0xFFFFFFFFFFFFFF8) + 0x10);
LABEL_21:
          sub_1001B699C(0, v17);
          goto LABEL_25;
        }
        goto LABEL_39;
      }
    }
    if (!(v15 >> 62))
    {
      uint64_t v18 = *(void *)((v15 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1;
      goto LABEL_24;
    }
LABEL_35:
    swift_bridgeObjectRetain();
    uint64_t v18 = _CocoaArrayWrapper.endIndex.getter();
    if (_CocoaArrayWrapper.endIndex.getter() < 0) {
      goto LABEL_41;
    }
    uint64_t v24 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (v18 < 0 || v24 < v18)
    {
      __break(1u);
LABEL_39:
      swift_bridgeObjectRetain();
      uint64_t v17 = _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
      if ((v17 & 0x8000000000000000) == 0) {
        goto LABEL_21;
      }
      __break(1u);
LABEL_41:
      __break(1u);
      return;
    }
LABEL_24:
    unint64_t *v9 = (unint64_t)sub_1001B3538(0, v18);
    swift_bridgeObjectRelease();
  }
LABEL_25:
  ((void (*)(unsigned char *, void))v10)(v25, 0);
  id v19 = sub_10020324C();
  if (*v20)
  {
    unint64_t v21 = swift_bridgeObjectRetain();
    sub_100202EC8(v21);
  }
  ((void (*)(unsigned char *, void))v19)(v25, 0);
  id v22 = sub_1002032AC();
  [v22 reloadData];
}

unint64_t sub_100208AAC(void *a1)
{
  uint64_t v3 = type metadata accessor for Date();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v36 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_bridgeObjectRetain();
  NSString v7 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  Class isa = IndexPath._bridgeToObjectiveC()().super.isa;
  id v9 = [a1 dequeueReusableCellWithIdentifier:v7 forIndexPath:isa];

  type metadata accessor for FavoritesTableCellV2();
  uint64_t v10 = swift_dynamicCastClass();
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = (uint64_t *)(v1 + OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController_cellularData);
    swift_beginAccess();
    uint64_t v13 = *v12;
    if (!*v12) {
      return v11;
    }
    swift_bridgeObjectRetain();
    unint64_t result = IndexPath.row.getter();
    uint64_t v36 = v4;
    if ((v13 & 0xC000000000000001) != 0)
    {
      id v15 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
      goto LABEL_7;
    }
    if ((result & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else if (result < *(void *)((v13 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      id v15 = *(id *)(v13 + 8 * result + 32);
LABEL_7:
      id v16 = v15;
      swift_bridgeObjectRelease();
      id v17 = sub_1001779FC();
      id v18 = [v16 fileName];
      uint64_t v19 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      unint64_t v21 = v20;

      uint64_t v37 = 0x6D616E20656C6946;
      unint64_t v38 = 0xEB00000000203A65;
      v22._countAndFlagsBits = v19;
      v22._object = v21;
      String.append(_:)(v22);
      swift_bridgeObjectRelease();
      String.init<A>(_:)();
      NSString v23 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease();
      [v17 setText:v23];

      id v24 = sub_100177A14();
      id v25 = [v16 fileSize];
      uint64_t v26 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      id v28 = v27;

      uint64_t v37 = 0x7A695320656C6946;
      unint64_t v38 = 0xEB00000000203A65;
      v29._countAndFlagsBits = v26;
      v29._object = v28;
      String.append(_:)(v29);
      swift_bridgeObjectRelease();
      String.init<A>(_:)();
      NSString v30 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease();
      [v24 setText:v30];

      id v31 = sub_100177A2C();
      id v32 = [v16 timestamp];
      static Date._unconditionallyBridgeFromObjectiveC(_:)();

      sub_100180C9C(2);
      (*(void (**)(char *, uint64_t))(v36 + 8))(v6, v3);
      NSString v33 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease();
      [v31 setText:v33];

      id v34 = sub_100177AB0();
      [v34 setHidden:1];

      return v11;
    }
    __break(1u);
  }
  else
  {

    id v35 = objc_allocWithZone((Class)UITableViewCell);
    return (unint64_t)[v35 init];
  }
  return result;
}

uint64_t sub_100209104(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (!v7) {
      return a3;
    }
  }
  else
  {
    uint64_t v7 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v7) {
      return a3;
    }
  }
  if (!a1) {
    goto LABEL_19;
  }
  uint64_t v8 = a3 & 0xFFFFFFFFFFFFFF8;
  if (v6)
  {
    swift_bridgeObjectRetain();
    uint64_t v10 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_10015D788(&qword_1002DC110, &qword_1002D80F0);
        swift_bridgeObjectRetain();
        for (unint64_t i = 0; i != v7; ++i)
        {
          sub_100157064(&qword_1002D80F0);
          uint64_t v12 = sub_100209790(v16, i, a3);
          uint64_t v14 = *v13;
          swift_retain();
          ((void (*)(uint64_t (**)(), void))v12)(v16, 0);
          *(void *)(a1 + 8 * i) = v14;
        }
        swift_bridgeObjectRelease();
        return a3;
      }
      goto LABEL_18;
    }
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  uint64_t v9 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v9 > a2)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v8 + 32 >= a1 + 8 * v9 || v8 + 32 + 8 * v9 <= a1)
  {
    type metadata accessor for FTMAllMetricsModel();
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_100209328(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (!v7) {
      return a3;
    }
  }
  else
  {
    uint64_t v7 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v7) {
      return a3;
    }
  }
  if (!a1) {
    goto LABEL_19;
  }
  uint64_t v8 = a3 & 0xFFFFFFFFFFFFFF8;
  if (v6)
  {
    swift_bridgeObjectRetain();
    uint64_t v10 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_10015D788(&qword_1002DC128, &qword_1002DC120);
        swift_bridgeObjectRetain();
        for (unint64_t i = 0; i != v7; ++i)
        {
          sub_100157064(&qword_1002DC120);
          uint64_t v12 = sub_1002097FC(v16, i, a3);
          id v14 = *v13;
          ((void (*)(void (**)(id *), void))v12)(v16, 0);
          *(void *)(a1 + 8 * i) = v14;
        }
        swift_bridgeObjectRelease();
        return a3;
      }
      goto LABEL_18;
    }
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  uint64_t v9 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v9 > a2)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v8 + 32 >= a1 + 8 * v9 || v8 + 32 + 8 * v9 <= a1)
  {
    sub_100167598(0, &qword_1002DC118);
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_10020955C(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (!v7) {
      return a3;
    }
  }
  else
  {
    uint64_t v7 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v7) {
      return a3;
    }
  }
  if (!a1) {
    goto LABEL_19;
  }
  uint64_t v8 = a3 & 0xFFFFFFFFFFFFFF8;
  if (v6)
  {
    swift_bridgeObjectRetain();
    uint64_t v10 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_10015D788((unint64_t *)&unk_1002DC0F0, (uint64_t *)&unk_1002DC0E0);
        swift_bridgeObjectRetain();
        for (unint64_t i = 0; i != v7; ++i)
        {
          sub_100157064((uint64_t *)&unk_1002DC0E0);
          uint64_t v12 = sub_100209864(v16, i, a3);
          id v14 = *v13;
          ((void (*)(void (**)(id *), void))v12)(v16, 0);
          *(void *)(a1 + 8 * i) = v14;
        }
        swift_bridgeObjectRelease();
        return a3;
      }
      goto LABEL_18;
    }
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  uint64_t v9 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v9 > a2)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v8 + 32 >= a1 + 8 * v9 || v8 + 32 + 8 * v9 <= a1)
  {
    sub_100167598(0, (unint64_t *)&qword_1002DC1D0);
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t (*sub_100209790(uint64_t (**a1)(), unint64_t a2, uint64_t a3))()
{
  unint64_t v6 = (uint64_t (*)())malloc(0x28uLL);
  *a1 = v6;
  *((void *)v6 + 4) = sub_100209914(v6, a2, a3);
  return sub_1002097F8;
}

uint64_t (*sub_1002097FC(void (**a1)(id *a1), unint64_t a2, uint64_t a3))()
{
  unint64_t v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((void *)v6 + 4) = sub_100209994(v6, a2, a3);
  return sub_1002097F8;
}

uint64_t (*sub_100209864(void (**a1)(id *), unint64_t a2, uint64_t a3))()
{
  unint64_t v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((void *)v6 + 4) = sub_100209A1C(v6, a2, a3);
  return sub_1002097F8;
}

void sub_1002098CC(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);

  free(v1);
}

uint64_t (*sub_100209914(uint64_t (*result)(), unint64_t a2, uint64_t a3))()
{
  uint64_t v3 = (uint64_t *)result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    uint64_t v4 = specialized _ArrayBuffer._getElementSlowPath(_:)();
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) > a2)
  {
    uint64_t v4 = swift_retain();
LABEL_5:
    *uint64_t v3 = v4;
    return destroy for FTMCellMonitorHardwareRowCellView;
  }
  __break(1u);
  return result;
}

void (*sub_100209994(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
{
  uint64_t v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    id v4 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) > a2)
  {
    id v4 = *(id *)(a3 + 8 * a2 + 32);
LABEL_5:
    *(void *)uint64_t v3 = v4;
    return sub_100209A14;
  }
  __break(1u);
  return result;
}

void sub_100209A14(id *a1)
{
}

void (*sub_100209A1C(void (*result)(id *), unint64_t a2, uint64_t a3))(id *)
{
  uint64_t v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    id v4 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) > a2)
  {
    id v4 = *(id *)(a3 + 8 * a2 + 32);
LABEL_5:
    *(void *)uint64_t v3 = v4;
    return sub_10020A0AC;
  }
  __break(1u);
  return result;
}

id sub_100209A9C(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5)
{
  swift_bridgeObjectRetain();
  v8._countAndFlagsBits = a3;
  v8._object = a4;
  String.append(_:)(v8);
  id v9 = objc_allocWithZone((Class)NSMutableAttributedString);
  NSString v10 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v11 = [v9 initWithString:v10 a1, a2];

  id v12 = [v11 mutableString];
  NSString v13 = String._bridgeToObjectiveC()();
  id v14 = [v12 rangeOfString:v13 options:1];
  uint64_t v16 = v15;

  if (v14 != (id)NSNotFound.getter()) {
    [v11 addAttribute:NSForegroundColorAttributeName value:a5 range:v14];
  }
  return v11;
}

id sub_100209BD4(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v8 = [objc_allocWithZone((Class)UILabel) init];
  NSString v9 = String._bridgeToObjectiveC()();
  NSString v10 = self;
  id v11 = [v10 colorNamed:v9];

  [v8 setTextColor:v11];
  id v12 = [v10 grayColor];
  id v13 = sub_100209A9C(a1, a2, a3, a4, (uint64_t)v12);

  [v8 setAttributedText:v13];
  [v8 setTextAlignment:2];
  id v14 = [self systemFontOfSize:18.0];
  [v8 setFont:v14];

  [v8 setTranslatesAutoresizingMaskIntoConstraints:0];
  return v8;
}

id sub_100209D54()
{
  uint64_t v1 = *(void *)&v0[OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController_transition];
  *(unsigned char *)(v1 + OBJC_IVAR____TtC13FTMInternal_418CircularTransition_transitionMode) = 0;
  id v2 = sub_10020396C();
  [v2 center];
  double v4 = v3;
  double v6 = v5;

  uint64_t v7 = (double *)(v1 + OBJC_IVAR____TtC13FTMInternal_418CircularTransition_startingPoint);
  *uint64_t v7 = v4;
  v7[1] = v6;
  [*(id *)(v1 + OBJC_IVAR____TtC13FTMInternal_418CircularTransition_circle) setCenter:v4, v6];
  id result = [v0 view];
  if (result)
  {
    NSString v9 = result;
    id v10 = [result backgroundColor];

    if (v10)
    {
      id v11 = *(void **)(v1 + OBJC_IVAR____TtC13FTMInternal_418CircularTransition_circleColor);
      *(void *)(v1 + OBJC_IVAR____TtC13FTMInternal_418CircularTransition_circleColor) = v10;
    }
    return (id)v1;
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_100209E54()
{
  uint64_t v1 = *(void *)&v0[OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController_transition];
  *(unsigned char *)(v1 + OBJC_IVAR____TtC13FTMInternal_418CircularTransition_transitionMode) = 1;
  id v2 = sub_10020396C();
  [v2 center];
  double v4 = v3;
  double v6 = v5;

  uint64_t v7 = (double *)(v1 + OBJC_IVAR____TtC13FTMInternal_418CircularTransition_startingPoint);
  *uint64_t v7 = v4;
  v7[1] = v6;
  [*(id *)(v1 + OBJC_IVAR____TtC13FTMInternal_418CircularTransition_circle) setCenter:v4, v6];
  id result = [v0 view];
  if (result)
  {
    NSString v9 = result;
    id v10 = [result backgroundColor];

    if (v10)
    {
      id v11 = *(void **)(v1 + OBJC_IVAR____TtC13FTMInternal_418CircularTransition_circleColor);
      *(void *)(v1 + OBJC_IVAR____TtC13FTMInternal_418CircularTransition_circleColor) = v10;
    }
    return (id)v1;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_100209F58()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

void sub_100209F90()
{
}

uint64_t sub_100209F98(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100209FA8()
{
  return swift_release();
}

void sub_100209FB0()
{
}

uint64_t sub_100209FB8()
{
  return sub_100204C4C();
}

uint64_t sub_100209FC0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100157064(&qword_1002D96A0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

ValueMetadata *type metadata accessor for CellularLoggingReprestable()
{
  return &type metadata for CellularLoggingReprestable;
}

void *sub_10020A03C()
{
  return &protocol witness table for Never;
}

unint64_t sub_10020A048()
{
  unint64_t result = qword_1002DC100;
  if (!qword_1002DC100)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1002DC100);
  }
  return result;
}

char *sub_10020A0B0()
{
  *(void *)&v0[OBJC_IVAR____TtC13FTMInternal_422CellularLoggingService_cellularLogging] = 0;
  *(void *)&v0[OBJC_IVAR____TtC13FTMInternal_422CellularLoggingService_delegate + 8] = 0;
  swift_unknownObjectWeakInit();
  *(void *)&v0[OBJC_IVAR____TtC13FTMInternal_422CellularLoggingService_timer] = 0;
  v9.receiver = v0;
  v9.super_class = (Class)type metadata accessor for CellularLoggingService();
  id v1 = [super init];
  id v2 = objc_allocWithZone((Class)CellularLogging);
  double v3 = (char *)v1;
  id v4 = [v2 init];
  uint64_t v5 = OBJC_IVAR____TtC13FTMInternal_422CellularLoggingService_cellularLogging;
  double v6 = *(void **)&v3[OBJC_IVAR____TtC13FTMInternal_422CellularLoggingService_cellularLogging];
  *(void *)&v3[OBJC_IVAR____TtC13FTMInternal_422CellularLoggingService_cellularLogging] = v4;

  uint64_t v7 = *(void **)&v3[v5];
  if (v7) {
    [v7 setDelegate:v3];
  }
  sub_10020A1AC();

  return v3;
}

void sub_10020A1AC()
{
  id v1 = [self defaultCenter];
  uint64_t v2 = swift_allocObject();
  *(void *)(v2 + 16) = v0;
  v6[4] = sub_10020B4BC;
  v6[5] = v2;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 1107296256;
  v6[2] = sub_1001DD9E8;
  v6[3] = &unk_10028F5C0;
  double v3 = _Block_copy(v6);
  id v4 = v0;
  swift_release();
  id v5 = [v1 addObserverForName:UIApplicationWillTerminateNotification object:0 queue:0 usingBlock:v3];
  _Block_release(v3);
  swift_unknownObjectRelease();
}

void sub_10020A2DC(uint64_t a1, uint64_t a2)
{
  if (qword_1002D7A90 != -1) {
    swift_once();
  }
  static os_log_type_t.default.getter();
  os_log(_:dso:log:type:_:)();
  double v3 = *(void **)(a2 + OBJC_IVAR____TtC13FTMInternal_422CellularLoggingService_cellularLogging);
  if (v3)
  {
    id v4 = [v3 stop];
  }
  else
  {
    static os_log_type_t.default.getter();
    os_log(_:dso:log:type:_:)();
  }
}

id sub_10020A3E0()
{
  id v1 = [self defaultCenter];
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  NSString v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v1 removeObserver:v2];

  v4.receiver = v0;
  v4.super_class = (Class)type metadata accessor for CellularLoggingService();
  return [super dealloc];
}

uint64_t type metadata accessor for CellularLoggingService()
{
  return self;
}

void *sub_10020A5C4(void *result, uint64_t a2)
{
  if (result && (unint64_t result = sub_10020A9C4((uint64_t)result)) != 0)
  {
    unint64_t v3 = (unint64_t)result;
    if (swift_unknownObjectWeakLoadStrong())
    {
      sub_1002082F4(v3);
      swift_bridgeObjectRelease();
      return (void *)swift_unknownObjectRelease();
    }
    else
    {
      return (void *)swift_bridgeObjectRelease();
    }
  }
  else if (a2)
  {
    swift_errorRetain();
    if (qword_1002D7A90 != -1) {
      swift_once();
    }
    static os_log_type_t.error.getter();
    sub_100157064((uint64_t *)&unk_1002D97F0);
    uint64_t v4 = swift_allocObject();
    *(_OWORD *)(v4 + 16) = xmmword_100267EF0;
    swift_getErrorValue();
    uint64_t v5 = Error.localizedDescription.getter();
    uint64_t v7 = v6;
    *(void *)(v4 + 56) = &type metadata for String;
    unint64_t v8 = sub_100181588();
    *(void *)(v4 + 64) = v8;
    *(void *)(v4 + 32) = v5;
    *(void *)(v4 + 40) = v7;
    os_log(_:dso:log:type:_:)();
    swift_bridgeObjectRelease();
    uint64_t Strong = swift_unknownObjectWeakLoadStrong();
    if (Strong)
    {
      id v10 = (void *)Strong;
      swift_errorRetain();
      swift_errorRetain();
      static os_log_type_t.error.getter();
      uint64_t v11 = swift_allocObject();
      *(_OWORD *)(v11 + 16) = xmmword_100267EF0;
      swift_getErrorValue();
      uint64_t v12 = Error.localizedDescription.getter();
      *(void *)(v11 + 56) = &type metadata for String;
      *(void *)(v11 + 64) = v8;
      *(void *)(v11 + 32) = v12;
      *(void *)(v11 + 40) = v13;
      os_log(_:dso:log:type:_:)();
      swift_bridgeObjectRelease();
      uint64_t v14 = swift_allocObject();
      *(void *)(v14 + 16) = v10;
      id v15 = v10;
      sub_1001809A4(0xD00000000000007ELL, 0x8000000100240240, 0, 0xE000000000000000, 27471, 0xE200000000000000, 0x6C65636E6143, 0xE600000000000000, (uint64_t)sub_10020B4DC, v14);
      swift_release();
      NSString v16 = String._bridgeToObjectiveC()();
      NSString v17 = String._bridgeToObjectiveC()();
      id v18 = [self alertControllerWithTitle:v16 message:v17 preferredStyle:1];

      NSString v19 = String._bridgeToObjectiveC()();
      id v20 = [self actionWithTitle:v19 style:0 handler:0];

      [v18 addAction:v20];
      [v15 presentViewController:v18 animated:1 completion:0];

      swift_errorRelease();
      swift_unknownObjectRelease();
      swift_errorRelease();
    }
    return (void *)swift_errorRelease();
  }
  return result;
}

void *sub_10020A9C4(uint64_t a1)
{
  uint64_t v6 = _swiftEmptyArrayStorage;
  uint64_t v2 = *(void *)(a1 + 16);
  specialized ContiguousArray.reserveCapacity(_:)();
  if (!v2) {
    return v6;
  }
  for (uint64_t i = a1 + 32; ; i += 32)
  {
    sub_100196D64(i, (uint64_t)v5);
    sub_10020B47C();
    if (!swift_dynamicCast()) {
      break;
    }
    specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
    specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
    specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
    specialized ContiguousArray._endMutation()();
    if (!--v2) {
      return v6;
    }
  }
  swift_release();

  return 0;
}

void *sub_10020AAC0(uint64_t a1)
{
  int64_t v2 = *(void *)(a1 + 16);
  uint64_t v12 = _swiftEmptyArrayStorage;
  sub_1001B2350(0, v2, 0);
  unint64_t v3 = _swiftEmptyArrayStorage;
  if (v2)
  {
    for (uint64_t i = a1 + 32; ; i += 32)
    {
      sub_100196D64(i, (uint64_t)v11);
      if (!swift_dynamicCast()) {
        break;
      }
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_1001B2350(0, v3[2] + 1, 1);
        unint64_t v3 = v12;
      }
      unint64_t v6 = v3[2];
      unint64_t v5 = v3[3];
      if (v6 >= v5 >> 1)
      {
        sub_1001B2350(v5 > 1, v6 + 1, 1);
        unint64_t v3 = v12;
      }
      v3[2] = v6 + 1;
      uint64_t v7 = &v3[2 * v6];
      v7[4] = v9;
      v7[5] = v10;
      if (!--v2) {
        return v3;
      }
    }
    swift_release();
    swift_bridgeObjectRelease();
    return 0;
  }
  return v3;
}

void sub_10020AC90(uint64_t a1, uint64_t a2, void *a3)
{
  switch(a1)
  {
    case 0:
      if (!swift_unknownObjectWeakLoadStrong()) {
        return;
      }
      if (qword_1002D7A90 != -1) {
        swift_once();
      }
      static os_log_type_t.error.getter();
      os_log(_:dso:log:type:_:)();
      goto LABEL_14;
    case 2:
      if (a2)
      {
        swift_errorRetain();
        if (qword_1002D7A90 != -1) {
          swift_once();
        }
        static os_log_type_t.error.getter();
        sub_100157064((uint64_t *)&unk_1002D97F0);
        uint64_t v7 = swift_allocObject();
        *(_OWORD *)(v7 + 16) = xmmword_100267EF0;
        swift_getErrorValue();
        uint64_t v8 = Error.localizedDescription.getter();
        uint64_t v10 = v9;
        *(void *)(v7 + 56) = &type metadata for String;
        unint64_t v11 = sub_100181588();
        *(void *)(v7 + 64) = v11;
        *(void *)(v7 + 32) = v8;
        *(void *)(v7 + 40) = v10;
        os_log(_:dso:log:type:_:)();
        swift_bridgeObjectRelease();
        swift_errorRelease();
        uint64_t Strong = swift_unknownObjectWeakLoadStrong();
        if (Strong)
        {
          uint64_t v13 = (void *)Strong;
          swift_errorRetain();
          if (qword_1002D7A90 != -1) {
            swift_once();
          }
          static os_log_type_t.error.getter();
          sub_100157064((uint64_t *)&unk_1002D97F0);
          uint64_t v14 = swift_allocObject();
          *(_OWORD *)(v14 + 16) = xmmword_100267EF0;
          swift_getErrorValue();
          uint64_t v15 = Error.localizedDescription.getter();
          *(void *)(v14 + 56) = &type metadata for String;
          *(void *)(v14 + 64) = v11;
          *(void *)(v14 + 32) = v15;
          *(void *)(v14 + 40) = v16;
          os_log(_:dso:log:type:_:)();
          swift_bridgeObjectRelease();
          uint64_t v17 = swift_allocObject();
          *(void *)(v17 + 16) = v13;
          id v18 = v13;
          sub_1001809A4(0xD00000000000007ELL, 0x8000000100240240, 0, 0xE000000000000000, 27471, 0xE200000000000000, 0x6C65636E6143, 0xE600000000000000, (uint64_t)sub_10020B470, v17);
          swift_release();
          NSString v19 = String._bridgeToObjectiveC()();
          NSString v20 = String._bridgeToObjectiveC()();
          id v21 = [self alertControllerWithTitle:v19 message:v20 preferredStyle:1];

          NSString v22 = String._bridgeToObjectiveC()();
          id v23 = [self actionWithTitle:v22 style:0 handler:0];

          [v21 addAction:v23];
          [v18 presentViewController:v21 animated:1 completion:0];

          swift_errorRelease();
          swift_unknownObjectRelease();
        }
        return;
      }
      if (!swift_unknownObjectWeakLoadStrong()) {
        return;
      }
LABEL_14:
      swift_unknownObjectRelease();
      return;
    case 1:
      uint64_t v4 = swift_unknownObjectWeakLoadStrong();
      if (!v4) {
        return;
      }
      uint64_t v5 = v4;
      if (a3)
      {
        id v6 = [a3 maxNumberOfLogs];
        if (v6)
        {
          id v24 = *(void **)(v5 + OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController_maxNumberOfLogs);
          *(void *)(v5 + OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController_maxNumberOfLogs) = v6;
          swift_unknownObjectRelease();

          return;
        }
      }
      goto LABEL_14;
  }
  if (qword_1002D7A90 != -1) {
    swift_once();
  }
  static os_log_type_t.default.getter();

  os_log(_:dso:log:type:_:)();
}

void *sub_10020B2A0(void *result)
{
  if (result)
  {
    unint64_t result = sub_10020AAC0((uint64_t)result);
    if (result)
    {
      id v1 = result;
      if (qword_1002D7A90 != -1) {
        swift_once();
      }
      static os_log_type_t.default.getter();
      os_log(_:dso:log:type:_:)();
      uint64_t Strong = swift_unknownObjectWeakLoadStrong();
      if (Strong)
      {
        *(void *)(Strong + OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController_cellularConfigurations) = v1;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        uint64_t v3 = swift_bridgeObjectRetain();
        sub_100205F6C(v3);
        swift_bridgeObjectRelease();
        swift_unknownObjectRelease();
      }
      return (void *)swift_bridgeObjectRelease();
    }
  }
  return result;
}

uint64_t sub_10020B438()
{
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10020B470()
{
  return sub_1002082D0();
}

unint64_t sub_10020B47C()
{
  unint64_t result = qword_1002DC1D0;
  if (!qword_1002DC1D0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1002DC1D0);
  }
  return result;
}

void sub_10020B4BC(uint64_t a1)
{
  sub_10020A2DC(a1, *(void *)(v1 + 16));
}

uint64_t sub_10020B4C4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10020B4D4()
{
  return swift_release();
}

double sub_10020B4E8@<D0>(uint64_t a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_10020BF08(SBYTE10(v18));
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  long long v19 = v13;
  long long v20 = v14;
  long long v21 = v15;
  __int16 v22 = v16;
  long long v17 = v11;
  long long v18 = v12;
  uint64_t v3 = *(void **)(v1 + OBJC_IVAR____TtC13FTMInternal_420SURLSessionViewModel_coreTelephonyService);
  id v4 = objc_allocWithZone((Class)NSOperationQueue);
  id v5 = v3;
  id v6 = [v4 init];
  [v6 setQualityOfService:25];
  id v7 = objc_allocWithZone((Class)type metadata accessor for SURLSessionRunningViewModel());
  sub_1001BF0CC(0, 0, (uint64_t)&v17, v6, v5);

  uint64_t KeyPath = swift_getKeyPath();
  *(void *)(a1 + *(int *)(type metadata accessor for SURLSessionRunningView() + 28)) = KeyPath;
  sub_100157064(&qword_1002D7FA0);
  swift_storeEnumTagMultiPayload();
  sub_10020CEB8();
  *(void *)a1 = ObservedObject.init(wrappedValue:)();
  *(void *)(a1 + 8) = v9;
  State.init(wrappedValue:)();
  *(unsigned char *)(a1 + 16) = v11;
  *(void *)(a1 + 24) = *((void *)&v11 + 1);
  sub_100157064((uint64_t *)&unk_1002D9650);
  State.init(wrappedValue:)();
  double result = *(double *)&v11;
  *(_OWORD *)(a1 + 32) = v11;
  *(void *)(a1 + 48) = v12;
  return result;
}

uint64_t sub_10020B728@<X0>(uint64_t a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  uint64_t result = v14;
  *(unsigned char *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(_WORD *)(a1 + 24) = v6;
  *(unsigned char *)(a1 + 26) = v7;
  *(void *)(a1 + 32) = v8;
  *(void *)(a1 + 40) = v9;
  *(unsigned char *)(a1 + 48) = v10;
  *(unsigned char *)(a1 + 49) = v11;
  *(void *)(a1 + 56) = v12;
  *(unsigned char *)(a1 + 64) = v13;
  *(void *)(a1 + 72) = v14;
  *(unsigned char *)(a1 + 80) = v15;
  *(unsigned char *)(a1 + 81) = v16;
  return result;
}

uint64_t sub_10020B804@<X0>(uint64_t a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  uint64_t result = v14;
  *(unsigned char *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(_WORD *)(a1 + 24) = v6;
  *(unsigned char *)(a1 + 26) = v7;
  *(void *)(a1 + 32) = v8;
  *(void *)(a1 + 40) = v9;
  *(unsigned char *)(a1 + 48) = v10;
  *(unsigned char *)(a1 + 49) = v11;
  *(void *)(a1 + 56) = v12;
  *(unsigned char *)(a1 + 64) = v13;
  *(void *)(a1 + 72) = v14;
  *(unsigned char *)(a1 + 80) = v15;
  *(unsigned char *)(a1 + 81) = v16;
  return result;
}

uint64_t sub_10020B8E4(uint64_t a1, void **a2)
{
  uint64_t v4 = *a2;
  swift_getKeyPath();
  swift_getKeyPath();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v2 = v4;
  return static Published.subscript.setter();
}

uint64_t sub_10020BA00()
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v2) {
    return 1;
  }
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  uint64_t v0 = v3;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

void sub_10020BAF4()
{
  if (qword_1002D7B40 != -1) {
    swift_once();
  }
  uint64_t v1 = type metadata accessor for Logger();
  sub_1001A9488(v1, (uint64_t)qword_1002E3208);
  char v2 = Logger.logObject.getter();
  os_log_type_t v3 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    uint64_t v14 = swift_slowAlloc();
    *(_DWORD *)uint64_t v4 = 136315138;
    sub_1001AB860(0x7261657070416E6FLL, 0xEA00000000002928, &v14);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "%s getting traffic descriptors", v4, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  id v5 = [*(id *)(v0 + OBJC_IVAR____TtC13FTMInternal_420SURLSessionViewModel_coreTelephonyService) getTrafficDescriptors];
  if (!v5)
  {
    char v7 = Logger.logObject.getter();
    os_log_type_t v12 = static os_log_type_t.error.getter();
    if (!os_log_type_enabled(v7, v12))
    {
LABEL_11:

      return;
    }
    char v13 = (uint8_t *)swift_slowAlloc();
    uint64_t v14 = swift_slowAlloc();
    *(_DWORD *)char v13 = 136315138;
    sub_1001AB860(0x7261657070416E6FLL, 0xEA00000000002928, &v14);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v7, v12, "%s: no descriptors available", v13, 0xCu);
    swift_arrayDestroy();
LABEL_10:
    swift_slowDealloc();
    swift_slowDealloc();
    goto LABEL_11;
  }
  __int16 v6 = v5;
  sub_100167598(0, &qword_1002DC298);
  static Array._unconditionallyBridgeFromObjectiveC(_:)();

  swift_bridgeObjectRetain();
  char v7 = Logger.logObject.getter();
  os_log_type_t v8 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = swift_slowAlloc();
    uint64_t v14 = swift_slowAlloc();
    *(_DWORD *)uint64_t v9 = 136315394;
    sub_1001AB860(0x7261657070416E6FLL, 0xEA00000000002928, &v14);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v9 + 12) = 2080;
    uint64_t v10 = Array.description.getter();
    sub_1001AB860(v10, v11, &v14);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "%s: %s", (uint8_t *)v9, 0x16u);
    swift_arrayDestroy();
    goto LABEL_10;
  }

  swift_bridgeObjectRelease_n();
}

void sub_10020BF08(char a1)
{
  uint64_t v2 = v1;
  if (qword_1002D7B40 != -1) {
    swift_once();
  }
  uint64_t v4 = type metadata accessor for Logger();
  sub_1001A9488(v4, (uint64_t)qword_1002E3208);
  id v5 = Logger.logObject.getter();
  os_log_type_t v6 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v5, v6))
  {
    char v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v29 = swift_slowAlloc();
    *(_DWORD *)char v7 = 136315138;
    sub_1001AB860(0xD00000000000001ALL, 0x8000000100240440, &v29);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "%s invoked", v7, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  if (a1 != 24)
  {
    if (qword_1002D7B38 != -1) {
      swift_once();
    }
    sub_1001A9488(v4, (uint64_t)qword_1002E31F0);
    long long v18 = Logger.logObject.getter();
    os_log_type_t v19 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v18, v19))
    {
      long long v20 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)long long v20 = 134217984;
      uint64_t v29 = qword_10026C8B0[a1];
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl((void *)&_mh_execute_header, v18, v19, "settings application category to %ld", v20, 0xCu);
      swift_slowDealloc();
    }

    sub_100167598(0, &qword_1002D9690);
    v21.super.super.Class isa = NSNumber.init(integerLiteral:)(qword_10026C8B0[a1]).super.super.isa;
    id v22 = [*(id *)(v2 + OBJC_IVAR____TtC13FTMInternal_420SURLSessionViewModel_coreTelephonyService) setApplicationCategory:v21.super.super.isa];
    if (!v22)
    {

      return;
    }
    id v12 = v22;
    char v13 = Logger.logObject.getter();
    os_log_type_t v23 = static os_log_type_t.error.getter();
    if (!os_log_type_enabled(v13, v23))
    {

      goto LABEL_24;
    }
    uint64_t v24 = swift_slowAlloc();
    uint64_t v29 = swift_slowAlloc();
    *(_DWORD *)uint64_t v24 = 136315394;
    unint64_t v25 = sub_1001C286C(a1);
    sub_1001AB860(v25, v26, &v29);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    *(_WORD *)(v24 + 12) = 2080;
    swift_getErrorValue();
    uint64_t v27 = Error.localizedDescription.getter();
    sub_1001AB860(v27, v28, &v29);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v13, v23, "unable to set category %s due to %s", (uint8_t *)v24, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    goto LABEL_20;
  }
  if (qword_1002D7B38 != -1) {
    swift_once();
  }
  sub_1001A9488(v4, (uint64_t)qword_1002E31F0);
  os_log_type_t v8 = Logger.logObject.getter();
  os_log_type_t v9 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "settings application category to nil", v10, 2u);
    swift_slowDealloc();
  }

  id v11 = [*(id *)(v2 + OBJC_IVAR____TtC13FTMInternal_420SURLSessionViewModel_coreTelephonyService) setApplicationCategory:0];
  if (v11)
  {
    id v12 = v11;
    char v13 = Logger.logObject.getter();
    os_log_type_t v14 = static os_log_type_t.error.getter();
    if (!os_log_type_enabled(v13, v14))
    {

      goto LABEL_24;
    }
    char v15 = (uint8_t *)swift_slowAlloc();
    uint64_t v29 = swift_slowAlloc();
    *(_DWORD *)char v15 = 136315138;
    swift_getErrorValue();
    uint64_t v16 = Error.localizedDescription.getter();
    sub_1001AB860(v16, v17, &v29);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v13, v14, "unable to set category (nil) due to %s", v15, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
LABEL_20:

LABEL_24:
    sub_10020CE40();
    swift_allocError();
    swift_willThrow();
  }
}

char *sub_10020C5BC(uint64_t a1)
{
  ObjectType = (objc_class *)swift_getObjectType();
  swift_beginAccess();
  objc_super v4 = *(objc_super *)(a1 + 48);
  v10[3] = *(objc_super *)(a1 + 32);
  v10[4] = v4;
  v10[5] = *(objc_super *)(a1 + 64);
  __int16 v11 = *(_WORD *)(a1 + 80);
  objc_super v5 = *(objc_super *)(a1 + 16);
  v10[1] = *(objc_super *)a1;
  v10[2] = v5;
  os_log_type_t v6 = v1;
  Published.init(initialValue:)();
  swift_endAccess();
  id v7 = [objc_allocWithZone((Class)SPCoreTelephonyAdapter) init];
  *(void *)&v6[OBJC_IVAR____TtC13FTMInternal_420SURLSessionViewModel_coreTelephonyService] = v7;

  v10[0].receiver = v6;
  v10[0].super_class = ObjectType;
  os_log_type_t v8 = (char *)[(objc_super *)v10 init];
  [*(id *)&v8[OBJC_IVAR____TtC13FTMInternal_420SURLSessionViewModel_coreTelephonyService] setDelegate:v8];
  return v8;
}

uint64_t sub_10020C768()
{
  return type metadata accessor for SURLSessionViewModel();
}

uint64_t type metadata accessor for SURLSessionViewModel()
{
  uint64_t result = qword_1002DC218;
  if (!qword_1002DC218) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_10020C7BC()
{
  sub_10020C858();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void sub_10020C858()
{
  if (!qword_1002DC228)
  {
    unint64_t v0 = type metadata accessor for Published();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1002DC228);
    }
  }
}

uint64_t sub_10020C9C8()
{
  return EnvironmentValues.dismiss.getter();
}

void sub_10020C9EC(uint64_t a1, uint64_t a2, unint64_t a3)
{
  if (qword_1002D7B38 != -1) {
    swift_once();
  }
  uint64_t v5 = type metadata accessor for Logger();
  sub_1001A9488(v5, (uint64_t)qword_1002E31F0);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  os_log_type_t v6 = Logger.logObject.getter();
  os_log_type_t v7 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = swift_slowAlloc();
    uint64_t v12 = swift_slowAlloc();
    *(_DWORD *)uint64_t v8 = 136315650;
    sub_100167598(0, &qword_1002DC298);
    swift_bridgeObjectRetain();
    uint64_t v9 = Array.description.getter();
    unint64_t v11 = v10;
    swift_bridgeObjectRelease();
    sub_1001AB860(v9, v11, &v12);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v8 + 12) = 2080;
    swift_bridgeObjectRetain();
    sub_1001AB860(a2, a3, &v12);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v8 + 22) = 1024;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "slicing descriptors were updated: %s appInfo=%s status=%{BOOL}d", (uint8_t *)v8, 0x1Cu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
  }
}

void sub_10020CC6C(void *a1)
{
  if (qword_1002D7B38 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Logger();
  sub_1001A9488(v2, (uint64_t)qword_1002E31F0);
  id v8 = a1;
  os_log_type_t v3 = Logger.logObject.getter();
  os_log_type_t v4 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    os_log_type_t v6 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v5 = 138412290;
    id v7 = v8;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *os_log_type_t v6 = v8;

    _os_log_impl((void *)&_mh_execute_header, v3, v4, "slicing running app state changed: %@", v5, 0xCu);
    sub_100157064((uint64_t *)&unk_1002DA9C0);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
}

unint64_t sub_10020CE40()
{
  unint64_t result = qword_1002DC2A8;
  if (!qword_1002DC2A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1002DC2A8);
  }
  return result;
}

uint64_t sub_10020CE94()
{
  return EnvironmentValues.dismiss.getter();
}

unint64_t sub_10020CEB8()
{
  unint64_t result = qword_1002DC2B0;
  if (!qword_1002DC2B0)
  {
    type metadata accessor for SURLSessionRunningViewModel();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1002DC2B0);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for SPSlicingError(unsigned char *result, int a2, int a3)
{
  if ((a3 + 1) >= 0x10000) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) < 0x100) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2)
  {
    switch(v5)
    {
      case 1:
        *unint64_t result = a2;
        return result;
      case 2:
        *(_WORD *)unint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)unint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *unint64_t result = 0;
      break;
    case 2:
      *(_WORD *)unint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x10020CFACLL);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for SPSlicingError()
{
  return &type metadata for SPSlicingError;
}

unint64_t sub_10020CFE8()
{
  unint64_t result = qword_1002DC2C0;
  if (!qword_1002DC2C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1002DC2C0);
  }
  return result;
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

void sub_10020D060(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138412802;
  CFStringRef v4 = @"NRSlicing";
  __int16 v5 = 2112;
  uint64_t v6 = a1;
  __int16 v7 = 2112;
  uint64_t v8 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Unable to read carrier bundle key %@ from context %@ with error: %@", (uint8_t *)&v3, 0x20u);
}

void sub_10020D0F8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10020D130(os_log_t log)
{
  int v1 = 138412290;
  CFStringRef v2 = @"__SlicingTestModule__";
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Expected %@ key to be dictionary type", (uint8_t *)&v1, 0xCu);
}

void sub_10020D1B4(os_log_t log)
{
  int v1 = 138412290;
  CFStringRef v2 = @"SupportsLLPHS";
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Expected %@ key to be dictionary type", (uint8_t *)&v1, 0xCu);
}

void sub_10020D238(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10020D270(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Error setting the category %@. %@", (uint8_t *)&v3, 0x16u);
}

void sub_10020D2F8(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "error getting slice traffic descriptors %@", (uint8_t *)&v2, 0xCu);
}

uint64_t NSNotFound.getter()
{
  return NSNotFound.getter();
}

uint64_t URLRequest.httpMethod.setter()
{
  return URLRequest.httpMethod.setter();
}

uint64_t URLRequest.networkServiceType.getter()
{
  return URLRequest.networkServiceType.getter();
}

uint64_t URLRequest.networkServiceType.setter()
{
  return URLRequest.networkServiceType.setter();
}

NSURLRequest __swiftcall URLRequest._bridgeToObjectiveC()()
{
  unint64_t v0 = (objc_class *)URLRequest._bridgeToObjectiveC()();
  result._internal = v1;
  result.super.Class isa = v0;
  return result;
}

uint64_t URLRequest.allowsCellularAccess.setter()
{
  return URLRequest.allowsCellularAccess.setter();
}

uint64_t URLRequest.allowsExpensiveNetworkAccess.setter()
{
  return URLRequest.allowsExpensiveNetworkAccess.setter();
}

uint64_t URLRequest.allowsConstrainedNetworkAccess.setter()
{
  return URLRequest.allowsConstrainedNetworkAccess.setter();
}

uint64_t static URLRequest._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static URLRequest._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t URLRequest.init(url:cachePolicy:timeoutInterval:)()
{
  return URLRequest.init(url:cachePolicy:timeoutInterval:)();
}

Swift::Void __swiftcall URLRequest.addValue(_:forHTTPHeaderField:)(Swift::String _, Swift::String forHTTPHeaderField)
{
}

uint64_t type metadata accessor for URLRequest()
{
  return type metadata accessor for URLRequest();
}

uint64_t dispatch thunk of JSONDecoder.decode<A>(_:from:)()
{
  return dispatch thunk of JSONDecoder.decode<A>(_:from:)();
}

uint64_t JSONDecoder.init()()
{
  return JSONDecoder.init()();
}

uint64_t type metadata accessor for JSONDecoder()
{
  return type metadata accessor for JSONDecoder();
}

uint64_t dispatch thunk of JSONEncoder.encode<A>(_:)()
{
  return dispatch thunk of JSONEncoder.encode<A>(_:)();
}

uint64_t JSONEncoder.init()()
{
  return JSONEncoder.init()();
}

uint64_t type metadata accessor for JSONEncoder()
{
  return type metadata accessor for JSONEncoder();
}

uint64_t Measurement.init(value:unit:)()
{
  return Measurement.init(value:unit:)();
}

uint64_t Measurement<>.converted(to:)()
{
  return Measurement<>.converted(to:)();
}

uint64_t static CharacterSet._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static CharacterSet._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t CharacterSet.inverted.getter()
{
  return CharacterSet.inverted.getter();
}

uint64_t type metadata accessor for CharacterSet()
{
  return type metadata accessor for CharacterSet();
}

uint64_t static Notification._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Notification._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t Notification.userInfo.getter()
{
  return Notification.userInfo.getter();
}

uint64_t type metadata accessor for Notification()
{
  return type metadata accessor for Notification();
}

uint64_t URLQueryItem.init(name:value:)()
{
  return URLQueryItem.init(name:value:)();
}

uint64_t type metadata accessor for URLQueryItem()
{
  return type metadata accessor for URLQueryItem();
}

uint64_t URLComponents.queryItems.setter()
{
  return URLComponents.queryItems.setter();
}

uint64_t URLComponents.url.getter()
{
  return URLComponents.url.getter();
}

uint64_t URLComponents.host.setter()
{
  return URLComponents.host.setter();
}

uint64_t URLComponents.port.setter()
{
  return URLComponents.port.setter();
}

uint64_t URLComponents.scheme.setter()
{
  return URLComponents.scheme.setter();
}

uint64_t URLComponents.init()()
{
  return URLComponents.init()();
}

uint64_t type metadata accessor for URLComponents()
{
  return type metadata accessor for URLComponents();
}

uint64_t __DataStorage.init(bytes:length:)()
{
  return __DataStorage.init(bytes:length:)();
}

uint64_t type metadata accessor for __DataStorage()
{
  return type metadata accessor for __DataStorage();
}

uint64_t DateComponents.day.setter()
{
  return DateComponents.day.setter();
}

uint64_t DateComponents.init(calendar:timeZone:era:year:month:day:hour:minute:second:nanosecond:weekday:weekdayOrdinal:quarter:weekOfMonth:weekOfYear:yearForWeekOfYear:)()
{
  return DateComponents.init(calendar:timeZone:era:year:month:day:hour:minute:second:nanosecond:weekday:weekdayOrdinal:quarter:weekOfMonth:weekOfYear:yearForWeekOfYear:)();
}

uint64_t type metadata accessor for DateComponents()
{
  return type metadata accessor for DateComponents();
}

Swift::String __swiftcall NSLocalizedString(_:tableName:bundle:value:comment:)(Swift::String _, Swift::String_optional tableName, NSBundle bundle, Swift::String value, Swift::String comment)
{
  uint64_t v5 = NSLocalizedString(_:tableName:bundle:value:comment:)(_._countAndFlagsBits, _._object, tableName.value._countAndFlagsBits, tableName.value._object, bundle.super.isa, value._countAndFlagsBits, value._object, comment._countAndFlagsBits);
  result._object = v6;
  result._countAndFlagsBits = v5;
  return result;
}

uint64_t _BridgedStoredNSError.init(_:userInfo:)()
{
  return _BridgedStoredNSError.init(_:userInfo:)();
}

uint64_t _convertNSErrorToError(_:)()
{
  return _convertNSErrorToError(_:)();
}

uint64_t URL.relativePath.getter()
{
  return URL.relativePath.getter();
}

uint64_t type metadata accessor for URL.DirectoryHint()
{
  return type metadata accessor for URL.DirectoryHint();
}

void __swiftcall URL._bridgeToObjectiveC()(NSURL *__return_ptr retstr)
{
}

uint64_t URL.appendingPathComponent(_:)()
{
  return URL.appendingPathComponent(_:)();
}

uint64_t URL.appendingPathExtension(_:)()
{
  return URL.appendingPathExtension(_:)();
}

uint64_t static URL._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static URL._unconditionallyBridgeFromObjectiveC(_:)();
}

Swift::String __swiftcall URL.path(percentEncoded:)(Swift::Bool percentEncoded)
{
  uint64_t v1 = URL.path(percentEncoded:)(percentEncoded);
  result._object = v2;
  result._countAndFlagsBits = v1;
  return result;
}

uint64_t URL.appending<A>(path:directoryHint:)()
{
  return URL.appending<A>(path:directoryHint:)();
}

uint64_t URL.appending<A>(component:directoryHint:)()
{
  return URL.appending<A>(component:directoryHint:)();
}

uint64_t type metadata accessor for URL()
{
  return type metadata accessor for URL();
}

uint64_t type metadata accessor for Data.RangeReference()
{
  return type metadata accessor for Data.RangeReference();
}

NSData __swiftcall Data._bridgeToObjectiveC()()
{
  return (NSData)Data._bridgeToObjectiveC()();
}

uint64_t Date.timeIntervalSince(_:)()
{
  return Date.timeIntervalSince(_:)();
}

NSDate __swiftcall Date._bridgeToObjectiveC()()
{
  return (NSDate)Date._bridgeToObjectiveC()();
}

uint64_t static Date.> infix(_:_:)()
{
  return static Date.> infix(_:_:)();
}

uint64_t static Date.< infix(_:_:)()
{
  return static Date.< infix(_:_:)();
}

uint64_t Date.init(timeIntervalSince1970:)()
{
  return Date.init(timeIntervalSince1970:)();
}

uint64_t static Date._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Date._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t static Date.now.getter()
{
  return static Date.now.getter();
}

uint64_t Date.init()()
{
  return Date.init()();
}

uint64_t type metadata accessor for Date()
{
  return type metadata accessor for Date();
}

uint64_t UUID.uuidString.getter()
{
  return UUID.uuidString.getter();
}

uint64_t UUID.init()()
{
  return UUID.init()();
}

uint64_t type metadata accessor for UUID()
{
  return type metadata accessor for UUID();
}

NSLocale __swiftcall Locale._bridgeToObjectiveC()()
{
  return (NSLocale)Locale._bridgeToObjectiveC()();
}

uint64_t static Locale._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Locale._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t static Locale.current.getter()
{
  return static Locale.current.getter();
}

uint64_t type metadata accessor for Locale()
{
  return type metadata accessor for Locale();
}

uint64_t Calendar.date(byAdding:to:wrappingComponents:)()
{
  return Calendar.date(byAdding:to:wrappingComponents:)();
}

uint64_t static Calendar.current.getter()
{
  return static Calendar.current.getter();
}

uint64_t type metadata accessor for Calendar()
{
  return type metadata accessor for Calendar();
}

NSTimeZone __swiftcall TimeZone._bridgeToObjectiveC()()
{
  return (NSTimeZone)TimeZone._bridgeToObjectiveC()();
}

uint64_t static TimeZone.autoupdatingCurrent.getter()
{
  return static TimeZone.autoupdatingCurrent.getter();
}

uint64_t static TimeZone.current.getter()
{
  return static TimeZone.current.getter();
}

uint64_t type metadata accessor for TimeZone()
{
  return type metadata accessor for TimeZone();
}

uint64_t static URLError.Code.cannotCreateFile.getter()
{
  return static URLError.Code.cannotCreateFile.getter();
}

uint64_t static URLError.Code.badURL.getter()
{
  return static URLError.Code.badURL.getter();
}

uint64_t type metadata accessor for URLError.Code()
{
  return type metadata accessor for URLError.Code();
}

uint64_t URLError._nsError.getter()
{
  return URLError._nsError.getter();
}

uint64_t type metadata accessor for URLError()
{
  return type metadata accessor for URLError();
}

NSIndexPath __swiftcall IndexPath._bridgeToObjectiveC()()
{
  return (NSIndexPath)IndexPath._bridgeToObjectiveC()();
}

uint64_t static IndexPath._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t IndexPath.row.getter()
{
  return IndexPath.row.getter();
}

uint64_t IndexPath.init(item:section:)()
{
  return IndexPath.init(item:section:)();
}

uint64_t IndexPath.item.getter()
{
  return IndexPath.item.getter();
}

uint64_t IndexPath.section.getter()
{
  return IndexPath.section.getter();
}

uint64_t type metadata accessor for IndexPath()
{
  return type metadata accessor for IndexPath();
}

uint64_t os_log(_:dso:log:type:_:)()
{
  return os_log(_:dso:log:type:_:)();
}

uint64_t os_log(_:dso:log:_:_:)()
{
  return os_log(_:dso:log:_:_:)();
}

uint64_t Logger.logObject.getter()
{
  return Logger.logObject.getter();
}

uint64_t Logger.init(subsystem:category:)()
{
  return Logger.init(subsystem:category:)();
}

uint64_t type metadata accessor for Logger()
{
  return type metadata accessor for Logger();
}

uint64_t ChartProxy.plotAreaFrame.getter()
{
  return ChartProxy.plotAreaFrame.getter();
}

uint64_t ChartProxy.value<A, B>(at:as:)()
{
  return ChartProxy.value<A, B>(at:as:)();
}

uint64_t type metadata accessor for ChartProxy()
{
  return type metadata accessor for ChartProxy();
}

uint64_t ChartContent.annotation<A>(position:alignment:spacing:content:)()
{
  return ChartContent.annotation<A>(position:alignment:spacing:content:)();
}

uint64_t ChartContent.foregroundStyle<A>(by:)()
{
  return ChartContent.foregroundStyle<A>(by:)();
}

uint64_t ChartContent.foregroundStyle<A>(_:)()
{
  return ChartContent.foregroundStyle<A>(_:)();
}

uint64_t ChartContent.interpolationMethod(_:)()
{
  return ChartContent.interpolationMethod(_:)();
}

uint64_t ChartContent.symbol<A>(symbol:)()
{
  return ChartContent.symbol<A>(symbol:)();
}

uint64_t ChartContent.lineStyle(_:)()
{
  return ChartContent.lineStyle(_:)();
}

uint64_t static PlottableValue.value(_:_:)()
{
  return static PlottableValue.value(_:_:)();
}

uint64_t static AnnotationPosition.automatic.getter()
{
  return static AnnotationPosition.automatic.getter();
}

uint64_t type metadata accessor for AnnotationPosition()
{
  return type metadata accessor for AnnotationPosition();
}

uint64_t Chart.init<A, B>(_:content:)()
{
  return Chart.init<A, B>(_:content:)();
}

uint64_t LineMark.init<A, B>(x:y:)()
{
  return LineMark.init<A, B>(x:y:)();
}

uint64_t type metadata accessor for LineMark()
{
  return type metadata accessor for LineMark();
}

uint64_t RuleMark.init<A>(xStart:xEnd:y:)()
{
  return RuleMark.init<A>(xStart:xEnd:y:)();
}

uint64_t type metadata accessor for RuleMark()
{
  return type metadata accessor for RuleMark();
}

uint64_t type metadata accessor for ScaleType()
{
  return type metadata accessor for ScaleType();
}

uint64_t static ObservableObject.environmentStore.getter()
{
  return static ObservableObject.environmentStore.getter();
}

uint64_t ObservableObject<>.objectWillChange.getter()
{
  return ObservableObject<>.objectWillChange.getter();
}

uint64_t PassthroughSubject.send(_:)()
{
  return PassthroughSubject.send(_:)();
}

uint64_t PassthroughSubject.init()()
{
  return PassthroughSubject.init()();
}

Swift::Void __swiftcall ObservableObjectPublisher.send()()
{
}

uint64_t Published.init(initialValue:)()
{
  return Published.init(initialValue:)();
}

uint64_t static Published.subscript.modify()
{
  return static Published.subscript.modify();
}

uint64_t static Published.subscript.getter()
{
  return static Published.subscript.getter();
}

uint64_t static Published.subscript.setter()
{
  return static Published.subscript.setter();
}

uint64_t type metadata accessor for Published()
{
  return type metadata accessor for Published();
}

uint64_t Publisher.collect(_:)()
{
  return Publisher.collect(_:)();
}

uint64_t Publisher<>.sink(receiveValue:)()
{
  return Publisher<>.sink(receiveValue:)();
}

uint64_t EdgeInsets.init(_all:)()
{
  return EdgeInsets.init(_all:)();
}

uint64_t type metadata accessor for ScenePhase()
{
  return type metadata accessor for ScenePhase();
}

uint64_t DragGesture.init<A>(minimumDistance:coordinateSpace:)()
{
  return DragGesture.init<A>(minimumDistance:coordinateSpace:)();
}

uint64_t DragGesture.Value.location.getter()
{
  return DragGesture.Value.location.getter();
}

uint64_t type metadata accessor for DragGesture()
{
  return type metadata accessor for DragGesture();
}

uint64_t type metadata accessor for Environment.Content()
{
  return type metadata accessor for Environment.Content();
}

uint64_t static GestureMask.all.getter()
{
  return static GestureMask.all.getter();
}

uint64_t StateObject.wrappedValue.getter()
{
  return StateObject.wrappedValue.getter();
}

uint64_t StrokeStyle.init(lineWidth:lineCap:lineJoin:miterLimit:dash:dashPhase:)()
{
  return StrokeStyle.init(lineWidth:lineCap:lineJoin:miterLimit:dash:dashPhase:)();
}

uint64_t ToolbarItem<>.init(placement:content:)()
{
  return ToolbarItem<>.init(placement:content:)();
}

uint64_t WindowGroup.init(id:title:lazyContent:)()
{
  return WindowGroup.init(id:title:lazyContent:)();
}

uint64_t ProgressView.init<A>(value:total:label:currentValueLabel:)()
{
  return ProgressView.init<A>(value:total:label:currentValueLabel:)();
}

uint64_t ProgressView<>.init(label:)()
{
  return ProgressView<>.init(label:)();
}

uint64_t ProgressView<>.init<>()()
{
  return ProgressView<>.init<>()();
}

uint64_t static SceneBuilder.buildBlock<A>(_:)()
{
  return static SceneBuilder.buildBlock<A>(_:)();
}

uint64_t _FrameLayout.init(width:height:alignment:)()
{
  return _FrameLayout.init(width:height:alignment:)();
}

uint64_t AnyShapeStyle.init<A>(_:)()
{
  return AnyShapeStyle.init<A>(_:)();
}

Swift::Void __swiftcall DismissAction.callAsFunction()()
{
}

uint64_t type metadata accessor for DismissAction()
{
  return type metadata accessor for DismissAction();
}

uint64_t type metadata accessor for GeometryProxy()
{
  return type metadata accessor for GeometryProxy();
}

uint64_t GeometryProxy.subscript.getter()
{
  return GeometryProxy.subscript.getter();
}

uint64_t type metadata accessor for _TaskModifier()
{
  return type metadata accessor for _TaskModifier();
}

uint64_t NavigationLink.init(destination:label:)()
{
  return NavigationLink.init(destination:label:)();
}

uint64_t NavigationLink<>.init(_:destination:isActive:)()
{
  return NavigationLink<>.init(_:destination:isActive:)();
}

uint64_t type metadata accessor for NavigationLink()
{
  return type metadata accessor for NavigationLink();
}

uint64_t NavigationView.init(content:)()
{
  return NavigationView.init(content:)();
}

uint64_t ObservedObject.init(wrappedValue:)()
{
  return ObservedObject.init(wrappedValue:)();
}

uint64_t ObservedObject.projectedValue.getter()
{
  return ObservedObject.projectedValue.getter();
}

uint64_t ObservedObject.Wrapper.subscript.getter()
{
  return ObservedObject.Wrapper.subscript.getter();
}

uint64_t GroupedListStyle.init()()
{
  return GroupedListStyle.init()();
}

uint64_t type metadata accessor for GroupedListStyle()
{
  return type metadata accessor for GroupedListStyle();
}

uint64_t _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)()
{
  return _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)();
}

uint64_t EnvironmentObject.error()()
{
  return EnvironmentObject.error()();
}

uint64_t EnvironmentObject.init()()
{
  return EnvironmentObject.init()();
}

uint64_t EnvironmentValues.scenePhase.getter()
{
  return EnvironmentValues.scenePhase.getter();
}

uint64_t EnvironmentValues.scenePhase.setter()
{
  return EnvironmentValues.scenePhase.setter();
}

uint64_t EnvironmentValues.truncationMode.getter()
{
  return EnvironmentValues.truncationMode.getter();
}

uint64_t EnvironmentValues.truncationMode.setter()
{
  return EnvironmentValues.truncationMode.setter();
}

uint64_t EnvironmentValues.foregroundColor.getter()
{
  return EnvironmentValues.foregroundColor.getter();
}

uint64_t EnvironmentValues.foregroundColor.setter()
{
  return EnvironmentValues.foregroundColor.setter();
}

uint64_t EnvironmentValues.multilineTextAlignment.getter()
{
  return EnvironmentValues.multilineTextAlignment.getter();
}

uint64_t EnvironmentValues.multilineTextAlignment.setter()
{
  return EnvironmentValues.multilineTextAlignment.setter();
}

uint64_t EnvironmentValues.font.getter()
{
  return EnvironmentValues.font.getter();
}

uint64_t EnvironmentValues.font.setter()
{
  return EnvironmentValues.font.setter();
}

uint64_t EnvironmentValues.tint.getter()
{
  return EnvironmentValues.tint.getter();
}

uint64_t EnvironmentValues.tint.setter()
{
  return EnvironmentValues.tint.setter();
}

uint64_t EnvironmentValues.dismiss.getter()
{
  return EnvironmentValues.dismiss.getter();
}

uint64_t EnvironmentValues.isEnabled.getter()
{
  return EnvironmentValues.isEnabled.getter();
}

uint64_t EnvironmentValues.isEnabled.setter()
{
  return EnvironmentValues.isEnabled.setter();
}

uint64_t EnvironmentValues.lineLimit.getter()
{
  return EnvironmentValues.lineLimit.getter();
}

uint64_t EnvironmentValues.lineLimit.setter()
{
  return EnvironmentValues.lineLimit.setter();
}

uint64_t EnvironmentValues.init()()
{
  return EnvironmentValues.init()();
}

uint64_t type metadata accessor for EnvironmentValues()
{
  return type metadata accessor for EnvironmentValues();
}

uint64_t InlinePickerStyle.init()()
{
  return InlinePickerStyle.init()();
}

uint64_t type metadata accessor for InlinePickerStyle()
{
  return type metadata accessor for InlinePickerStyle();
}

uint64_t type metadata accessor for NavigationBarItem.TitleDisplayMode()
{
  return type metadata accessor for NavigationBarItem.TitleDisplayMode();
}

uint64_t static VerticalAlignment.center.getter()
{
  return static VerticalAlignment.center.getter();
}

uint64_t LocalizedStringKey.StringInterpolation.appendInterpolation<A>(_:specifier:)()
{
  return LocalizedStringKey.StringInterpolation.appendInterpolation<A>(_:specifier:)();
}

Swift::Void __swiftcall LocalizedStringKey.StringInterpolation.appendInterpolation(_:)(Swift::String a1)
{
}

Swift::Void __swiftcall LocalizedStringKey.StringInterpolation.appendLiteral(_:)(Swift::String a1)
{
}

uint64_t LocalizedStringKey.StringInterpolation.init(literalCapacity:interpolationCount:)()
{
  return LocalizedStringKey.StringInterpolation.init(literalCapacity:interpolationCount:)();
}

uint64_t type metadata accessor for LocalizedStringKey.StringInterpolation()
{
  return type metadata accessor for LocalizedStringKey.StringInterpolation();
}

uint64_t LocalizedStringKey.init(stringLiteral:)()
{
  return LocalizedStringKey.init(stringLiteral:)();
}

uint64_t LocalizedStringKey.init(stringInterpolation:)()
{
  return LocalizedStringKey.init(stringInterpolation:)();
}

uint64_t static HorizontalAlignment.center.getter()
{
  return static HorizontalAlignment.center.getter();
}

uint64_t static SymbolRenderingMode.multicolor.getter()
{
  return static SymbolRenderingMode.multicolor.getter();
}

uint64_t type metadata accessor for SymbolRenderingMode()
{
  return type metadata accessor for SymbolRenderingMode();
}

uint64_t _ConditionalContent<>.init(storage:)()
{
  return _ConditionalContent<>.init(storage:)();
}

uint64_t type metadata accessor for LocalCoordinateSpace()
{
  return type metadata accessor for LocalCoordinateSpace();
}

uint64_t static ToolbarItemPlacement.principal.getter()
{
  return static ToolbarItemPlacement.principal.getter();
}

uint64_t type metadata accessor for ToolbarItemPlacement()
{
  return type metadata accessor for ToolbarItemPlacement();
}

uint64_t static ToolbarContentBuilder.buildBlock<A>(_:)()
{
  return static ToolbarContentBuilder.buildBlock<A>(_:)();
}

uint64_t static CoordinateSpaceProtocol<>.local.getter()
{
  return static CoordinateSpaceProtocol<>.local.getter();
}

uint64_t LinearProgressViewStyle.init()()
{
  return LinearProgressViewStyle.init()();
}

uint64_t type metadata accessor for LinearProgressViewStyle()
{
  return type metadata accessor for LinearProgressViewStyle();
}

uint64_t type metadata accessor for ButtonStyleConfiguration.Label()
{
  return type metadata accessor for ButtonStyleConfiguration.Label();
}

uint64_t ButtonStyleConfiguration.label.getter()
{
  return ButtonStyleConfiguration.label.getter();
}

uint64_t ButtonStyleConfiguration.isPressed.getter()
{
  return ButtonStyleConfiguration.isPressed.getter();
}

uint64_t StackNavigationViewStyle.init()()
{
  return StackNavigationViewStyle.init()();
}

uint64_t type metadata accessor for StackNavigationViewStyle()
{
  return type metadata accessor for StackNavigationViewStyle();
}

uint64_t UIApplicationDelegateAdaptor.init(_:)()
{
  return UIApplicationDelegateAdaptor.init(_:)();
}

uint64_t UIViewControllerRepresentable._resetUIViewController(_:coordinator:destroy:)()
{
  return UIViewControllerRepresentable._resetUIViewController(_:coordinator:destroy:)();
}

uint64_t static UIViewControllerRepresentable.dismantleUIViewController(_:coordinator:)()
{
  return static UIViewControllerRepresentable.dismantleUIViewController(_:coordinator:)();
}

uint64_t UIViewControllerRepresentable.sizeThatFits(_:uiViewController:context:)()
{
  return UIViewControllerRepresentable.sizeThatFits(_:uiViewController:context:)();
}

uint64_t static UIViewControllerRepresentable._layoutOptions(_:)()
{
  return static UIViewControllerRepresentable._layoutOptions(_:)();
}

uint64_t UIViewControllerRepresentable._identifiedViewTree(in:)()
{
  return UIViewControllerRepresentable._identifiedViewTree(in:)();
}

uint64_t UIViewControllerRepresentable.body.getter()
{
  return UIViewControllerRepresentable.body.getter();
}

uint64_t UIViewControllerRepresentable<>.makeCoordinator()()
{
  return UIViewControllerRepresentable<>.makeCoordinator()();
}

uint64_t static App.main()()
{
  return static App.main()();
}

uint64_t static Log.runtimeIssuesLog.getter()
{
  return static Log.runtimeIssuesLog.getter();
}

uint64_t static Edge.Set.horizontal.getter()
{
  return static Edge.Set.horizontal.getter();
}

uint64_t static Edge.Set.all.getter()
{
  return static Edge.Set.all.getter();
}

uint64_t static Edge.Set.top.getter()
{
  return static Edge.Set.top.getter();
}

uint64_t static Edge.Set.leading.getter()
{
  return static Edge.Set.leading.getter();
}

uint64_t static Edge.Set.trailing.getter()
{
  return static Edge.Set.trailing.getter();
}

uint64_t static Edge.Set.vertical.getter()
{
  return static Edge.Set.vertical.getter();
}

uint64_t static Font.largeTitle.getter()
{
  return static Font.largeTitle.getter();
}

uint64_t static Font.subheadline.getter()
{
  return static Font.subheadline.getter();
}

uint64_t type metadata accessor for Font.Design()
{
  return type metadata accessor for Font.Design();
}

uint64_t static Font.system(size:weight:design:)()
{
  return static Font.system(size:weight:design:)();
}

uint64_t static Font.caption.getter()
{
  return static Font.caption.getter();
}

uint64_t static Font.headline.getter()
{
  return static Font.headline.getter();
}

uint64_t Form.init(content:)()
{
  return Form.init(content:)();
}

uint64_t List<>.init(content:)()
{
  return List<>.init(content:)();
}

uint64_t type metadata accessor for List()
{
  return type metadata accessor for List();
}

uint64_t type metadata accessor for Text.TruncationMode()
{
  return type metadata accessor for Text.TruncationMode();
}

uint64_t Text.foregroundColor(_:)()
{
  return Text.foregroundColor(_:)();
}

uint64_t Text.bold()()
{
  return Text.bold()();
}

uint64_t Text.font(_:)()
{
  return Text.font(_:)();
}

uint64_t Text.init(_:tableName:bundle:comment:)()
{
  return Text.init(_:tableName:bundle:comment:)();
}

uint64_t Text.init<A>(_:)()
{
  return Text.init<A>(_:)();
}

uint64_t Text.init(_:)()
{
  return Text.init(_:)();
}

uint64_t View.chartYScale<A>(domain:type:)()
{
  return View.chartYScale<A>(domain:type:)();
}

uint64_t View.chartOverlay<A>(alignment:content:)()
{
  return View.chartOverlay<A>(alignment:content:)();
}

uint64_t View.navigationViewStyle<A>(_:)()
{
  return View.navigationViewStyle<A>(_:)();
}

uint64_t static View._makeView(view:inputs:)()
{
  return static View._makeView(view:inputs:)();
}

uint64_t static View._makeViewList(view:inputs:)()
{
  return static View._makeViewList(view:inputs:)();
}

uint64_t View.progressViewStyle<A>(_:)()
{
  return View.progressViewStyle<A>(_:)();
}

uint64_t View.buttonStyle<A>(_:)()
{
  return View.buttonStyle<A>(_:)();
}

uint64_t View.pickerStyle<A>(_:)()
{
  return View.pickerStyle<A>(_:)();
}

uint64_t View.refreshable(action:)()
{
  return View.refreshable(action:)();
}

uint64_t static View._viewListCount(inputs:)()
{
  return static View._viewListCount(inputs:)();
}

uint64_t View.navigationTitle(_:)()
{
  return View.navigationTitle(_:)();
}

uint64_t View.navigationTitle<A>(_:)()
{
  return View.navigationTitle<A>(_:)();
}

uint64_t View.navigationBarTitle(_:displayMode:)()
{
  return View.navigationBarTitle(_:displayMode:)();
}

uint64_t View.onLongPressGesture(minimumDuration:maximumDistance:pressing:perform:)()
{
  return View.onLongPressGesture(minimumDuration:maximumDistance:pressing:perform:)();
}

uint64_t View.alert<A, B>(_:isPresented:actions:message:)()
{
  return View.alert<A, B>(_:isPresented:actions:message:)();
}

uint64_t View.alert<A>(_:isPresented:actions:)()
{
  return View.alert<A>(_:isPresented:actions:)();
}

uint64_t View.badge(_:)()
{
  return View.badge(_:)();
}

uint64_t View.sheet<A>(isPresented:onDismiss:content:)()
{
  return View.sheet<A>(isPresented:onDismiss:content:)();
}

uint64_t View.gesture<A>(_:including:)()
{
  return View.gesture<A>(_:including:)();
}

uint64_t View.tabItem<A>(_:)()
{
  return View.tabItem<A>(_:)();
}

uint64_t View.toolbar<A>(content:)()
{
  return View.toolbar<A>(content:)();
}

uint64_t View.listStyle<A>(_:)()
{
  return View.listStyle<A>(_:)();
}

uint64_t type metadata accessor for Color.RGBColorSpace()
{
  return type metadata accessor for Color.RGBColorSpace();
}

uint64_t static Color.red.getter()
{
  return static Color.red.getter();
}

uint64_t static Color.blue.getter()
{
  return static Color.blue.getter();
}

uint64_t static Color.gray.getter()
{
  return static Color.gray.getter();
}

uint64_t static Color.black.getter()
{
  return static Color.black.getter();
}

uint64_t static Color.clear.getter()
{
  return static Color.clear.getter();
}

uint64_t static Color.green.getter()
{
  return static Color.green.getter();
}

uint64_t static Color.white.getter()
{
  return static Color.white.getter();
}

uint64_t static Color.yellow.getter()
{
  return static Color.yellow.getter();
}

uint64_t static Color.primary.getter()
{
  return static Color.primary.getter();
}

uint64_t Color.gradient.getter()
{
  return Color.gradient.getter();
}

uint64_t Color.init(_:white:opacity:)()
{
  return Color.init(_:white:opacity:)();
}

uint64_t Image.init(systemName:)()
{
  return Image.init(systemName:)();
}

uint64_t Image.symbolRenderingMode(_:)()
{
  return Image.symbolRenderingMode(_:)();
}

uint64_t Label<>.init(_:systemImage:)()
{
  return Label<>.init(_:systemImage:)();
}

uint64_t State.init(wrappedValue:)()
{
  return State.init(wrappedValue:)();
}

uint64_t State.wrappedValue.getter()
{
  return State.wrappedValue.getter();
}

uint64_t State.wrappedValue.setter()
{
  return State.wrappedValue.setter();
}

uint64_t State.projectedValue.getter()
{
  return State.projectedValue.getter();
}

uint64_t Button.init(action:label:)()
{
  return Button.init(action:label:)();
}

uint64_t Button<>.init(_:action:)()
{
  return Button<>.init(_:action:)();
}

uint64_t Picker.init(selection:label:content:)()
{
  return Picker.init(selection:label:content:)();
}

uint64_t Slider.init<A>(value:in:step:onEditingChanged:minimumValueLabel:maximumValueLabel:label:)()
{
  return Slider.init<A>(value:in:step:onEditingChanged:minimumValueLabel:maximumValueLabel:label:)();
}

uint64_t Toggle<>.init(_:isOn:)()
{
  return Toggle<>.init(_:isOn:)();
}

uint64_t Binding.wrappedValue.getter()
{
  return Binding.wrappedValue.getter();
}

uint64_t Binding.wrappedValue.setter()
{
  return Binding.wrappedValue.setter();
}

uint64_t Binding.subscript.getter()
{
  return Binding.subscript.getter();
}

uint64_t Binding.projectedValue.getter()
{
  return Binding.projectedValue.getter();
}

uint64_t type metadata accessor for Binding()
{
  return type metadata accessor for Binding();
}

uint64_t Divider.init()()
{
  return Divider.init()();
}

uint64_t type metadata accessor for Divider()
{
  return type metadata accessor for Divider();
}

uint64_t ForEach<>.init(_:id:content:)()
{
  return ForEach<>.init(_:id:content:)();
}

uint64_t ForEach<>.init(_:content:)()
{
  return ForEach<>.init(_:content:)();
}

uint64_t type metadata accessor for ForEach()
{
  return type metadata accessor for ForEach();
}

uint64_t Gesture.onEnded(_:)()
{
  return Gesture.onEnded(_:)();
}

uint64_t Gesture<>.onChanged(_:)()
{
  return Gesture<>.onChanged(_:)();
}

uint64_t Section<>.init<A>(_:content:)()
{
  return Section<>.init<A>(_:content:)();
}

uint64_t Section<>.init(header:content:)()
{
  return Section<>.init(header:content:)();
}

uint64_t TabView<>.init(content:)()
{
  return TabView<>.init(content:)();
}

uint64_t static Alignment.center.getter()
{
  return static Alignment.center.getter();
}

uint64_t static Animation.easeInOut(duration:)()
{
  return static Animation.easeInOut(duration:)();
}

uint64_t static UnitPoint.center.getter()
{
  return static UnitPoint.center.getter();
}

uint64_t type metadata accessor for DispatchWorkItemFlags()
{
  return type metadata accessor for DispatchWorkItemFlags();
}

uint64_t type metadata accessor for DispatchQoS.QoSClass()
{
  return type metadata accessor for DispatchQoS.QoSClass();
}

uint64_t static DispatchQoS.background.getter()
{
  return static DispatchQoS.background.getter();
}

uint64_t static DispatchQoS.unspecified.getter()
{
  return static DispatchQoS.unspecified.getter();
}

uint64_t static DispatchQoS.userInteractive.getter()
{
  return static DispatchQoS.userInteractive.getter();
}

uint64_t type metadata accessor for DispatchQoS()
{
  return type metadata accessor for DispatchQoS();
}

uint64_t static DispatchTime.now()()
{
  return static DispatchTime.now()();
}

uint64_t type metadata accessor for DispatchTime()
{
  return type metadata accessor for DispatchTime();
}

uint64_t + infix(_:_:)()
{
  return + infix(_:_:)();
}

NSDictionary __swiftcall Dictionary._bridgeToObjectiveC()()
{
  return (NSDictionary)Dictionary._bridgeToObjectiveC()();
}

uint64_t static Dictionary._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t Dictionary.description.getter()
{
  return Dictionary.description.getter();
}

uint64_t Character.write<A>(to:)()
{
  return Character.write<A>(to:)();
}

uint64_t BidirectionalCollection<>.joined(separator:)()
{
  return BidirectionalCollection<>.joined(separator:)();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)String._bridgeToObjectiveC()();
}

uint64_t static String._forceBridgeFromObjectiveC(_:result:)()
{
  return static String._forceBridgeFromObjectiveC(_:result:)();
}

uint64_t static String._conditionallyBridgeFromObjectiveC(_:result:)()
{
  return static String._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t String.data(using:allowLossyConversion:)()
{
  return String.data(using:allowLossyConversion:)();
}

uint64_t String.init(data:encoding:)()
{
  return String.init(data:encoding:)();
}

uint64_t String.init(format:_:)()
{
  return String.init(format:_:)();
}

uint64_t static String.Encoding.utf8.getter()
{
  return static String.Encoding.utf8.getter();
}

uint64_t type metadata accessor for String.Encoding()
{
  return type metadata accessor for String.Encoding();
}

Swift::String __swiftcall String.init(_:)(NSString a1)
{
  uint64_t v1 = String.init(_:)(a1);
  result._object = v2;
  result._countAndFlagsBits = v1;
  return result;
}

uint64_t String.init<A>(describing:)()
{
  return String.init<A>(describing:)();
}

Swift::String __swiftcall String.lowercased()()
{
  uint64_t v0 = String.lowercased()();
  result._object = v1;
  result._countAndFlagsBits = v0;
  return result;
}

uint64_t String.utf8CString.getter()
{
  return String.utf8CString.getter();
}

uint64_t static String._fromSubstring(_:)()
{
  return static String._fromSubstring(_:)();
}

uint64_t static String._uncheckedFromUTF8(_:)()
{
  return static String._uncheckedFromUTF8(_:)();
}

uint64_t String.hash(into:)()
{
  return String.hash(into:)();
}

uint64_t String.count.getter()
{
  return String.count.getter();
}

uint64_t String.index(_:offsetBy:limitedBy:)()
{
  return String.index(_:offsetBy:limitedBy:)();
}

uint64_t String.index(_:offsetBy:)()
{
  return String.index(_:offsetBy:)();
}

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
}

uint64_t String.init(cString:)()
{
  return String.init(cString:)();
}

{
  return String.init(cString:)();
}

Swift::String_optional __swiftcall String.Iterator.next()()
{
  uint64_t v0 = String.Iterator.next()();
  result.value._object = v1;
  result.value._countAndFlagsBits = v0;
  return result;
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return String.UTF8View._foreignCount()();
}

uint64_t String.UTF8View._foreignIndex(after:)()
{
  return String.UTF8View._foreignIndex(after:)();
}

uint64_t String.UTF8View._foreignIndex(_:offsetBy:)()
{
  return String.UTF8View._foreignIndex(_:offsetBy:)();
}

uint64_t String.UTF8View._foreignSubscript(position:)()
{
  return String.UTF8View._foreignSubscript(position:)();
}

uint64_t String.UTF16View.index(_:offsetBy:)()
{
  return String.UTF16View.index(_:offsetBy:)();
}

uint64_t String.subscript.getter()
{
  return String.subscript.getter();
}

{
  return String.subscript.getter();
}

uint64_t String.init<A>(_:)()
{
  return String.init<A>(_:)();
}

uint64_t Sequence.sorted(by:)()
{
  return Sequence.sorted(by:)();
}

uint64_t RawRepresentable<>.encode(to:)()
{
  return RawRepresentable<>.encode(to:)();
}

{
  return RawRepresentable<>.encode(to:)();
}

uint64_t RawRepresentable<>.init(from:)()
{
  return RawRepresentable<>.init(from:)();
}

{
  return RawRepresentable<>.init(from:)();
}

uint64_t specialized Array._makeUniqueAndReserveCapacityIfNotUnique()()
{
  return specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
}

NSArray __swiftcall Array._bridgeToObjectiveC()()
{
  return (NSArray)Array._bridgeToObjectiveC()();
}

uint64_t static Array._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t Array.description.getter()
{
  return Array.description.getter();
}

uint64_t specialized Array._endMutation()()
{
  return specialized Array._endMutation()();
}

uint64_t specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)()
{
  return specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t static Array._allocateUninitialized(_:)()
{
  return static Array._allocateUninitialized(_:)();
}

uint64_t static Array._allocateBufferUninitialized(minimumCapacity:)()
{
  return static Array._allocateBufferUninitialized(minimumCapacity:)();
}

uint64_t specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)()
{
  return specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t type metadata accessor for Array()
{
  return type metadata accessor for Array();
}

NSNumber __swiftcall Bool._bridgeToObjectiveC()()
{
  return (NSNumber)Bool._bridgeToObjectiveC()();
}

uint64_t static Bool._conditionallyBridgeFromObjectiveC(_:result:)()
{
  return static Bool._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t dispatch thunk of Actor.unownedExecutor.getter()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t static MainActor.shared.getter()
{
  return static MainActor.shared.getter();
}

uint64_t type metadata accessor for MainActor()
{
  return type metadata accessor for MainActor();
}

uint64_t static TaskPriority.userInitiated.getter()
{
  return static TaskPriority.userInitiated.getter();
}

uint64_t TaskPriority.rawValue.getter()
{
  return TaskPriority.rawValue.getter();
}

uint64_t type metadata accessor for TaskPriority()
{
  return type metadata accessor for TaskPriority();
}

NSNumber __swiftcall Double._bridgeToObjectiveC()()
{
  return (NSNumber)Double._bridgeToObjectiveC()();
}

uint64_t Double.description.getter()
{
  return Double.description.getter();
}

uint64_t Double.write<A>(to:)()
{
  return Double.write<A>(to:)();
}

uint64_t Float.description.getter()
{
  return Float.description.getter();
}

uint64_t Set.description.getter()
{
  return Set.description.getter();
}

uint64_t Set.init(minimumCapacity:)()
{
  return Set.init(minimumCapacity:)();
}

uint64_t Set.count.getter()
{
  return Set.count.getter();
}

uint64_t Set.insert(_:)()
{
  return Set.insert(_:)();
}

uint64_t Set.remove(_:)()
{
  return Set.remove(_:)();
}

uint64_t Set.isEmpty.getter()
{
  return Set.isEmpty.getter();
}

uint64_t Set.contains(_:)()
{
  return Set.contains(_:)();
}

uint64_t type metadata accessor for Set()
{
  return type metadata accessor for Set();
}

NSNumber __swiftcall Int._bridgeToObjectiveC()()
{
  return (NSNumber)Int._bridgeToObjectiveC()();
}

uint64_t dispatch thunk of Collection.startIndex.getter()
{
  return dispatch thunk of Collection.startIndex.getter();
}

uint64_t dispatch thunk of Collection.count.getter()
{
  return dispatch thunk of Collection.count.getter();
}

uint64_t dispatch thunk of Collection.formIndex(after:)()
{
  return dispatch thunk of Collection.formIndex(after:)();
}

uint64_t dispatch thunk of Collection.subscript.read()
{
  return dispatch thunk of Collection.subscript.read();
}

uint64_t NSFileHandle.write<A>(contentsOf:)()
{
  return NSFileHandle.write<A>(contentsOf:)();
}

uint64_t static os_log_type_t.info.getter()
{
  return static os_log_type_t.info.getter();
}

uint64_t static os_log_type_t.debug.getter()
{
  return static os_log_type_t.debug.getter();
}

uint64_t static os_log_type_t.error.getter()
{
  return static os_log_type_t.error.getter();
}

uint64_t static os_log_type_t.fault.getter()
{
  return static os_log_type_t.fault.getter();
}

uint64_t static os_log_type_t.default.getter()
{
  return static os_log_type_t.default.getter();
}

uint64_t OS_dispatch_group.notify(qos:flags:queue:execute:)()
{
  return OS_dispatch_group.notify(qos:flags:queue:execute:)();
}

uint64_t type metadata accessor for OS_dispatch_queue.Attributes()
{
  return type metadata accessor for OS_dispatch_queue.Attributes();
}

uint64_t OS_dispatch_queue.asyncAfter(deadline:qos:flags:execute:)()
{
  return OS_dispatch_queue.asyncAfter(deadline:qos:flags:execute:)();
}

uint64_t type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency()
{
  return type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
}

uint64_t static OS_dispatch_queue.main.getter()
{
  return static OS_dispatch_queue.main.getter();
}

uint64_t OS_dispatch_queue.async(group:qos:flags:execute:)()
{
  return OS_dispatch_queue.async(group:qos:flags:execute:)();
}

uint64_t OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)()
{
  return OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
}

uint64_t static OS_dispatch_queue.global(qos:)()
{
  return static OS_dispatch_queue.global(qos:)();
}

uint64_t type metadata accessor for NSNotificationCenter.Publisher()
{
  return type metadata accessor for NSNotificationCenter.Publisher();
}

uint64_t NSNotificationCenter.publisher(for:object:)()
{
  return NSNotificationCenter.publisher(for:object:)();
}

NSNumber __swiftcall NSNumber.init(integerLiteral:)(Swift::Int integerLiteral)
{
  return (NSNumber)NSNumber.init(integerLiteral:)(integerLiteral);
}

uint64_t static NSObject.== infix(_:_:)()
{
  return static NSObject.== infix(_:_:)();
}

uint64_t NSString.init(stringLiteral:)()
{
  return NSString.init(stringLiteral:)();
}

uint64_t NSString.init(format:_:)()
{
  return NSString.init(format:_:)();
}

uint64_t OS_os_log.init(subsystem:category:)()
{
  return OS_os_log.init(subsystem:category:)();
}

uint64_t type metadata accessor for Optional()
{
  return type metadata accessor for Optional();
}

uint64_t UnsafeMutableRawBufferPointer.copyMemory(from:)()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t UnsafeMutableRawBufferPointer.subscript.setter()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t StringProtocol.components<A>(separatedBy:)()
{
  return StringProtocol.components<A>(separatedBy:)();
}

uint64_t StringProtocol.rangeOfCharacter(from:options:range:)()
{
  return StringProtocol.rangeOfCharacter(from:options:range:)();
}

uint64_t StringProtocol.replacingOccurrences<A, B>(of:with:options:range:)()
{
  return StringProtocol.replacingOccurrences<A, B>(of:with:options:range:)();
}

uint64_t StringProtocol.caseInsensitiveCompare<A>(_:)()
{
  return StringProtocol.caseInsensitiveCompare<A>(_:)();
}

uint64_t StringProtocol.contains<A>(_:)()
{
  return StringProtocol.contains<A>(_:)();
}

uint64_t _bridgeAnyObjectToAny(_:)()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t dispatch thunk of SetAlgebra.init<A>(_:)()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

uint64_t _HashTable.previousHole(before:)()
{
  return _HashTable.previousHole(before:)();
}

NSObject __swiftcall AnyHashable._bridgeToObjectiveC()()
{
  return (NSObject)AnyHashable._bridgeToObjectiveC()();
}

uint64_t AnyHashable.description.getter()
{
  return AnyHashable.description.getter();
}

Swift::Int __swiftcall AnyHashable._rawHashValue(seed:)(Swift::Int seed)
{
  return AnyHashable._rawHashValue(seed:)(seed);
}

uint64_t static AnyHashable.== infix(_:_:)()
{
  return static AnyHashable.== infix(_:_:)();
}

uint64_t AnyHashable.init<A>(_:)()
{
  return AnyHashable.init<A>(_:)();
}

uint64_t static _SetStorage.copy(original:)()
{
  return static _SetStorage.copy(original:)();
}

uint64_t static _SetStorage.resize(original:capacity:move:)()
{
  return static _SetStorage.resize(original:capacity:move:)();
}

uint64_t _StringGuts._slowWithCString<A>(_:)()
{
  return _StringGuts._slowWithCString<A>(_:)();
}

Swift::Void __swiftcall _StringGuts.grow(_:)(Swift::Int a1)
{
}

uint64_t _StringGuts.copyUTF8(into:)()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t Identifiable<>.id.getter()
{
  return Identifiable<>.id.getter();
}

uint64_t specialized _ArrayBuffer._getElementSlowPath(_:)()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)()
{
  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t DecodingError.Context.init(codingPath:debugDescription:underlyingError:)()
{
  return DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
}

uint64_t type metadata accessor for DecodingError()
{
  return type metadata accessor for DecodingError();
}

uint64_t _StringObject.sharedUTF8.getter()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()()
{
  return specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
}

uint64_t specialized ContiguousArray._endMutation()()
{
  return specialized ContiguousArray._endMutation()();
}

Swift::Void __swiftcall ContiguousArray.reserveCapacity(_:)(Swift::Int a1)
{
}

uint64_t specialized ContiguousArray.reserveCapacity(_:)()
{
  return specialized ContiguousArray.reserveCapacity(_:)();
}

uint64_t specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)()
{
  return specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
}

uint64_t specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)()
{
  return specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t ContiguousArray.append(_:)()
{
  return ContiguousArray.append(_:)();
}

uint64_t ContiguousArray.init()()
{
  return ContiguousArray.init()();
}

uint64_t type metadata accessor for ContiguousArray()
{
  return type metadata accessor for ContiguousArray();
}

uint64_t _print_unlocked<A, B>(_:_:)()
{
  return _print_unlocked<A, B>(_:_:)();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t _CocoaArrayWrapper.endIndex.getter()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t static _DictionaryStorage.copy(original:)()
{
  return static _DictionaryStorage.copy(original:)();
}

uint64_t static _DictionaryStorage.resize(original:capacity:move:)()
{
  return static _DictionaryStorage.resize(original:capacity:move:)();
}

uint64_t static _DictionaryStorage.allocate(capacity:)()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t _fatalErrorMessage(_:_:file:line:flags:)()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

Swift::Int __swiftcall _findStringSwitchCase(cases:string:)(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases._rawValue, string._countAndFlagsBits, string._object);
}

uint64_t KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)()
{
  return KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)();
}

uint64_t KeyedDecodingContainer.codingPath.getter()
{
  return KeyedDecodingContainer.codingPath.getter();
}

uint64_t KeyedDecodingContainer.decodeIfPresent(_:forKey:)()
{
  return KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
}

uint64_t KeyedDecodingContainer.decode(_:forKey:)()
{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

uint64_t KeyedDecodingContainer.decode<A>(_:forKey:)()
{
  return KeyedDecodingContainer.decode<A>(_:forKey:)();
}

uint64_t KeyedDecodingContainer.allKeys.getter()
{
  return KeyedDecodingContainer.allKeys.getter();
}

uint64_t KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)()
{
  return KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)();
}

uint64_t KeyedEncodingContainer.encodeIfPresent(_:forKey:)()
{
  return KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
}

uint64_t KeyedEncodingContainer.encode(_:forKey:)()
{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

uint64_t KeyedEncodingContainer.encode<A>(_:forKey:)()
{
  return KeyedEncodingContainer.encode<A>(_:forKey:)();
}

Swift::Int __swiftcall _minimumMergeRunLength(_:)(Swift::Int a1)
{
  return _minimumMergeRunLength(_:)(a1);
}

uint64_t dispatch thunk of CustomStringConvertible.description.getter()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t _bridgeAnythingToObjectiveC<A>(_:)()
{
  return _bridgeAnythingToObjectiveC<A>(_:)();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t _bridgeAnythingNonVerbatimToObjectiveC<A>(_:)()
{
  return _bridgeAnythingNonVerbatimToObjectiveC<A>(_:)();
}

uint64_t ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t Error.localizedDescription.getter()
{
  return Error.localizedDescription.getter();
}

uint64_t Error._getEmbeddedNSError()()
{
  return Error._getEmbeddedNSError()();
}

uint64_t Error._code.getter()
{
  return Error._code.getter();
}

uint64_t Error._domain.getter()
{
  return Error._domain.getter();
}

uint64_t Error._userInfo.getter()
{
  return Error._userInfo.getter();
}

uint64_t print(_:separator:terminator:)()
{
  return print(_:separator:terminator:)();
}

uint64_t static Hasher._hash(seed:_:)()
{
  return static Hasher._hash(seed:_:)();
}

uint64_t Hasher.init(_seed:)()
{
  return Hasher.init(_seed:)();
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt a1)
{
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt8 a1)
{
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt64 a1)
{
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return Hasher._finalize()();
}

uint64_t dispatch thunk of Decoder.container<A>(keyedBy:)()
{
  return dispatch thunk of Decoder.container<A>(keyedBy:)();
}

uint64_t dispatch thunk of Encoder.container<A>(keyedBy:)()
{
  return dispatch thunk of Encoder.container<A>(keyedBy:)();
}

uint64_t AnalyticsSendEvent()
{
  return _AnalyticsSendEvent();
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return _CFRetain(cf);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return _CGAffineTransformMakeScale(retstr, sx, sy);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  return _CGRectGetHeight(rect);
}

CGFloat CGRectGetWidth(CGRect rect)
{
  return _CGRectGetWidth(rect);
}

uint64_t MGGetBoolAnswer()
{
  return _MGGetBoolAnswer();
}

uint64_t MGGetStringAnswer()
{
  return _MGGetStringAnswer();
}

Class NSClassFromString(NSString *aClassName)
{
  return _NSClassFromString(aClassName);
}

void NSLog(NSString *format, ...)
{
}

uint64_t PBDataWriterPlaceMark()
{
  return _PBDataWriterPlaceMark();
}

uint64_t PBDataWriterRecallMark()
{
  return _PBDataWriterRecallMark();
}

uint64_t PBDataWriterWriteBOOLField()
{
  return _PBDataWriterWriteBOOLField();
}

uint64_t PBDataWriterWriteDataField()
{
  return _PBDataWriterWriteDataField();
}

uint64_t PBDataWriterWriteInt32Field()
{
  return _PBDataWriterWriteInt32Field();
}

uint64_t PBDataWriterWriteSint32Field()
{
  return _PBDataWriterWriteSint32Field();
}

uint64_t PBDataWriterWriteStringField()
{
  return _PBDataWriterWriteStringField();
}

uint64_t PBDataWriterWriteSubmessage()
{
  return _PBDataWriterWriteSubmessage();
}

uint64_t PBDataWriterWriteUint32Field()
{
  return _PBDataWriterWriteUint32Field();
}

uint64_t PBDataWriterWriteUint64Field()
{
  return _PBDataWriterWriteUint64Field();
}

uint64_t PBReaderPlaceMark()
{
  return _PBReaderPlaceMark();
}

uint64_t PBReaderReadData()
{
  return _PBReaderReadData();
}

uint64_t PBReaderReadString()
{
  return _PBReaderReadString();
}

uint64_t PBReaderRecallMark()
{
  return _PBReaderRecallMark();
}

uint64_t PBReaderSkipValueWithTag()
{
  return _PBReaderSkipValueWithTag();
}

uint64_t PBRepeatedInt32Add()
{
  return _PBRepeatedInt32Add();
}

uint64_t PBRepeatedInt32Clear()
{
  return _PBRepeatedInt32Clear();
}

uint64_t PBRepeatedInt32Copy()
{
  return _PBRepeatedInt32Copy();
}

uint64_t PBRepeatedInt32Hash()
{
  return _PBRepeatedInt32Hash();
}

uint64_t PBRepeatedInt32IsEqual()
{
  return _PBRepeatedInt32IsEqual();
}

uint64_t PBRepeatedInt32NSArray()
{
  return _PBRepeatedInt32NSArray();
}

uint64_t PBRepeatedUInt32Add()
{
  return _PBRepeatedUInt32Add();
}

uint64_t PBRepeatedUInt32Clear()
{
  return _PBRepeatedUInt32Clear();
}

uint64_t PBRepeatedUInt32Copy()
{
  return _PBRepeatedUInt32Copy();
}

uint64_t PBRepeatedUInt32Hash()
{
  return _PBRepeatedUInt32Hash();
}

uint64_t PBRepeatedUInt32IsEqual()
{
  return _PBRepeatedUInt32IsEqual();
}

uint64_t PBRepeatedUInt32NSArray()
{
  return _PBRepeatedUInt32NSArray();
}

uint64_t PBRepeatedUInt64Add()
{
  return _PBRepeatedUInt64Add();
}

uint64_t PBRepeatedUInt64Clear()
{
  return _PBRepeatedUInt64Clear();
}

uint64_t PBRepeatedUInt64Copy()
{
  return _PBRepeatedUInt64Copy();
}

uint64_t PBRepeatedUInt64Hash()
{
  return _PBRepeatedUInt64Hash();
}

uint64_t PBRepeatedUInt64IsEqual()
{
  return _PBRepeatedUInt64IsEqual();
}

uint64_t PBRepeatedUInt64NSArray()
{
  return _PBRepeatedUInt64NSArray();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_release(const void *aBlock)
{
}

uint64_t _CFXPCCreateCFObjectFromXPCObject()
{
  return __CFXPCCreateCFObjectFromXPCObject();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t abm::client::CreateManager()
{
  return abm::client::CreateManager();
}

uint64_t abm::client::PerformCommand()
{
  return abm::client::PerformCommand();
}

uint64_t abm::client::RegisterEventHandler()
{
  return abm::client::RegisterEventHandler();
}

uint64_t abm::client::EventsOn()
{
  return abm::client::EventsOn();
}

uint64_t abm::client::EventsOff()
{
  return abm::client::EventsOff();
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return std::logic_error::logic_error(this, a2);
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
}

void std::terminate(void)
{
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return ___cxa_allocate_exception(thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return ___cxa_begin_catch(a1);
}

void __cxa_free_exception(void *a1)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return __swift_stdlib_bridgeErrorToNSError();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return __swift_stdlib_reportUnimplementedInitializer();
}

uint64_t _swift_stdlib_strtod_clocale()
{
  return __swift_stdlib_strtod_clocale();
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return _dispatch_group_create();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
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

id objc_alloc(Class a1)
{
  return _[a1 alloc];
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

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

Class objc_getClass(const char *name)
{
  return _objc_getClass(name);
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
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
  return [super a2];
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

uint64_t objc_opt_respondsToSelector()
{
  return _objc_opt_respondsToSelector();
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

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
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

const char *__cdecl sqlite3_errmsg(sqlite3 *a1)
{
  return _sqlite3_errmsg(a1);
}

int sqlite3_exec(sqlite3 *a1, const char *sql, int (__cdecl *callback)(void *, int, char **, char **), void *a4, char **errmsg)
{
  return _sqlite3_exec(a1, sql, callback, a4, errmsg);
}

int sqlite3_finalize(sqlite3_stmt *pStmt)
{
  return _sqlite3_finalize(pStmt);
}

int sqlite3_open_v2(const char *filename, sqlite3 **ppDb, int flags, const char *zVfs)
{
  return _sqlite3_open_v2(filename, ppDb, flags, zVfs);
}

int sqlite3_prepare_v2(sqlite3 *db, const char *zSql, int nByte, sqlite3_stmt **ppStmt, const char **pzTail)
{
  return _sqlite3_prepare_v2(db, zSql, nByte, ppStmt, pzTail);
}

int sqlite3_step(sqlite3_stmt *a1)
{
  return _sqlite3_step(a1);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

uint64_t swift_allocBox()
{
  return _swift_allocBox();
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

uint64_t swift_deallocPartialClassInstance()
{
  return _swift_deallocPartialClassInstance();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_dynamicCastClass()
{
  return _swift_dynamicCastClass();
}

uint64_t swift_dynamicCastMetatype()
{
  return _swift_dynamicCastMetatype();
}

uint64_t swift_dynamicCastObjCClass()
{
  return _swift_dynamicCastObjCClass();
}

uint64_t swift_dynamicCastObjCClassUnconditional()
{
  return _swift_dynamicCastObjCClassUnconditional();
}

uint64_t swift_endAccess()
{
  return _swift_endAccess();
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

uint64_t swift_getDynamicType()
{
  return _swift_getDynamicType();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return _swift_getEnumCaseMultiPayload();
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

uint64_t swift_getOpaqueTypeConformance2()
{
  return _swift_getOpaqueTypeConformance2();
}

uint64_t swift_getOpaqueTypeMetadata2()
{
  return _swift_getOpaqueTypeMetadata2();
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

uint64_t swift_initStackObject()
{
  return _swift_initStackObject();
}

uint64_t swift_initStructMetadata()
{
  return _swift_initStructMetadata();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return _swift_isUniquelyReferenced_nonNull_bridgeObject();
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

uint64_t swift_setDeallocating()
{
  return _swift_setDeallocating();
}

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}

uint64_t swift_slowDealloc()
{
  return _swift_slowDealloc();
}

uint64_t swift_stdlib_random()
{
  return _swift_stdlib_random();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return _swift_storeEnumTagMultiPayload();
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

uint64_t swift_unexpectedError()
{
  return _swift_unexpectedError();
}

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_unknownObjectUnownedDestroy()
{
  return _swift_unknownObjectUnownedDestroy();
}

uint64_t swift_unknownObjectUnownedInit()
{
  return _swift_unknownObjectUnownedInit();
}

uint64_t swift_unknownObjectUnownedLoadStrong()
{
  return _swift_unknownObjectUnownedLoadStrong();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return _swift_unknownObjectWeakAssign();
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

uint64_t swift_weakDestroy()
{
  return _swift_weakDestroy();
}

uint64_t swift_weakInit()
{
  return _swift_weakInit();
}

uint64_t swift_weakLoadStrong()
{
  return _swift_weakLoadStrong();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}

xpc_object_t xpc_data_create(const void *bytes, size_t length)
{
  return _xpc_data_create(bytes, length);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return _xpc_dictionary_create(keys, values, count);
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return _xpc_get_type(object);
}

xpc_object_t xpc_int64_create(int64_t value)
{
  return _xpc_int64_create(value);
}

xpc_object_t xpc_null_create(void)
{
  return _xpc_null_create();
}

void xpc_release(xpc_object_t object)
{
}

xpc_object_t xpc_retain(xpc_object_t object)
{
  return _xpc_retain(object);
}

id objc_msgSend__coreTelephonyAppInfoContainer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_coreTelephonyAppInfoContainer:");
}

id objc_msgSend__coreTelephonyAppInfoList_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_coreTelephonyAppInfoList:");
}

id objc_msgSend__coreTelephonyApplicationInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_coreTelephonyApplicationInfo:");
}

id objc_msgSend__coreTelephonyContainer_(void *a1, const char *a2, ...)
{
  return [a1 _coreTelephonyContainer:];
}

id objc_msgSend__coreTelephonyDescriptor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_coreTelephonyDescriptor:");
}

id objc_msgSend__coreTelephonyDescritorList_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_coreTelephonyDescritorList:");
}

id objc_msgSend__coreTelephonyInterface_(void *a1, const char *a2, ...)
{
  return [a1 _coreTelephonyInterface:];
}

id objc_msgSend__coreTelephonyInterfaceList_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_coreTelephonyInterfaceList:");
}

id objc_msgSend__getCarrierBundleKeyForDataContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_getCarrierBundleKeyForDataContext:");
}

id objc_msgSend__getCarrierBundleKeyValue_forContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_getCarrierBundleKeyValue:forContext:");
}

id objc_msgSend__handleSubscriptionAndBundleChange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleSubscriptionAndBundleChange:");
}

id objc_msgSend__loadSlicingConfigForContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_loadSlicingConfigForContext:");
}

id objc_msgSend__loadSubscriptionInfo(void *a1, const char *a2, ...)
{
  return _[a1 _loadSubscriptionInfo];
}

id objc_msgSend__loadSubscriptionInfoForContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_loadSubscriptionInfoForContext:");
}

id objc_msgSend_acTxBinsAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 acTxBinsAtIndex:];
}

id objc_msgSend_acTxBinsCount(void *a1, const char *a2, ...)
{
  return _[a1 acTxBinsCount];
}

id objc_msgSend_adTxBinsAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 adTxBinsAtIndex:];
}

id objc_msgSend_adTxBinsCount(void *a1, const char *a2, ...)
{
  return _[a1 adTxBinsCount];
}

id objc_msgSend_addAcTxBins_(void *a1, const char *a2, ...)
{
  return [a1 addAcTxBins:];
}

id objc_msgSend_addAdTxBins_(void *a1, const char *a2, ...)
{
  return [a1 addAdTxBins:];
}

id objc_msgSend_addBandInfo_(void *a1, const char *a2, ...)
{
  return [a1 addBandInfo:];
}

id objc_msgSend_addBearerContexts_(void *a1, const char *a2, ...)
{
  return [a1 addBearerContexts:];
}

id objc_msgSend_addBoundDurationSecs_(void *a1, const char *a2, ...)
{
  return [a1 addBoundDurationSecs:];
}

id objc_msgSend_addCapEvent_(void *a1, const char *a2, ...)
{
  return [a1 addCapEvent:];
}

id objc_msgSend_addCapHist_(void *a1, const char *a2, ...)
{
  return [a1 addCapHist:];
}

id objc_msgSend_addCarrierInfo_(void *a1, const char *a2, ...)
{
  return [a1 addCarrierInfo:];
}

id objc_msgSend_addCauseCount_(void *a1, const char *a2, ...)
{
  return [a1 addCauseCount:];
}

id objc_msgSend_addCauseCountAp_(void *a1, const char *a2, ...)
{
  return [a1 addCauseCountAp];
}

id objc_msgSend_addCell_(void *a1, const char *a2, ...)
{
  return [a1 addCell:];
}

id objc_msgSend_addConnReqRel_(void *a1, const char *a2, ...)
{
  return [a1 addConnReqRel];
}

id objc_msgSend_addCountOfInvalidationReason_(void *a1, const char *a2, ...)
{
  return [a1 addCountOfInvalidationReason:];
}

id objc_msgSend_addCsTxPwr_(void *a1, const char *a2, ...)
{
  return [a1 addCsTxPwr:];
}

id objc_msgSend_addCtolReselCount_(void *a1, const char *a2, ...)
{
  return [a1 addCtolReselCount:];
}

id objc_msgSend_addDelayCnt_(void *a1, const char *a2, ...)
{
  return [a1 addDelayCnt:];
}

id objc_msgSend_addDrb_(void *a1, const char *a2, ...)
{
  return [a1 addDrb:];
}

id objc_msgSend_addDrbConfig_(void *a1, const char *a2, ...)
{
  return [a1 addDrbConfig:];
}

id objc_msgSend_addEf_(void *a1, const char *a2, ...)
{
  return [a1 addEf:];
}

id objc_msgSend_addEhplmnList_(void *a1, const char *a2, ...)
{
  return [a1 addEhplmnList:];
}

id objc_msgSend_addEndStatusCount_(void *a1, const char *a2, ...)
{
  return [a1 addEndStatusCount:];
}

id objc_msgSend_addEndStatusCountAp_(void *a1, const char *a2, ...)
{
  return [a1 addEndStatusCountAp];
}

id objc_msgSend_addEndStatusCountConnectedCdma_(void *a1, const char *a2, ...)
{
  return [a1 addEndStatusCountConnectedCdma];
}

id objc_msgSend_addEndStatusCountConnectedGw_(void *a1, const char *a2, ...)
{
  return [a1 addEndStatusCountConnectedGw:];
}

id objc_msgSend_addEndStatusCountNotConnectedCdma_(void *a1, const char *a2, ...)
{
  return [a1 addEndStatusCountNotConnectedCdma];
}

id objc_msgSend_addEndStatusCountNotConnectedGw_(void *a1, const char *a2, ...)
{
  return [a1 addEndStatusCountNotConnectedGw];
}

id objc_msgSend_addEplmnList_(void *a1, const char *a2, ...)
{
  return [a1 addEplmnList];
}

id objc_msgSend_addEstablishCause_(void *a1, const char *a2, ...)
{
  return [a1 addEstablishCause:];
}

id objc_msgSend_addEutraPrioInfo_(void *a1, const char *a2, ...)
{
  return [a1 addEutraPrioInfo:];
}

id objc_msgSend_addFailureCount_(void *a1, const char *a2, ...)
{
  return [a1 addFailureCount:];
}

id objc_msgSend_addFailureCountAp_(void *a1, const char *a2, ...)
{
  return [a1 addFailureCountAp];
}

id objc_msgSend_addFetchStateDurationSecs_(void *a1, const char *a2, ...)
{
  return [a1 addFetchStateDurationSecs:];
}

id objc_msgSend_addFromLteHoCount_(void *a1, const char *a2, ...)
{
  return [a1 addFromLteHoCount:];
}

id objc_msgSend_addFromLteRedirCount_(void *a1, const char *a2, ...)
{
  return [a1 addFromLteRedirCount];
}

id objc_msgSend_addFromLteReselCount_(void *a1, const char *a2, ...)
{
  return [a1 addFromLteReselCount:];
}

id objc_msgSend_addGeraNcell_(void *a1, const char *a2, ...)
{
  return [a1 addGeraNcell:];
}

id objc_msgSend_addGsmNcellMeas_(void *a1, const char *a2, ...)
{
  return [a1 addGsmNcellMeas];
}

id objc_msgSend_addGsmPrioInfo_(void *a1, const char *a2, ...)
{
  return [a1 addGsmPrioInfo:];
}

id objc_msgSend_addHcStat_(void *a1, const char *a2, ...)
{
  return [a1 addHcStat:];
}

id objc_msgSend_addHdrRx0IdleCount_(void *a1, const char *a2, ...)
{
  return [a1 addHdrRx0IdleCount:];
}

id objc_msgSend_addHdrRx0TrafficCount_(void *a1, const char *a2, ...)
{
  return [a1 addHdrRx0TrafficCount:];
}

id objc_msgSend_addHdrRx1TrafficCount_(void *a1, const char *a2, ...)
{
  return [a1 addHdrRx1TrafficCount];
}

id objc_msgSend_addHdrTxTrafficCount_(void *a1, const char *a2, ...)
{
  return [a1 addHdrTxTrafficCount:];
}

id objc_msgSend_addHistPerBand_(void *a1, const char *a2, ...)
{
  return [a1 addHistPerBand:];
}

id objc_msgSend_addHomeSidNidList_(void *a1, const char *a2, ...)
{
  return [a1 addHomeSidNidList];
}

id objc_msgSend_addInstValues_(void *a1, const char *a2, ...)
{
  return [a1 addInstValues:];
}

id objc_msgSend_addIntraFreqPci_(void *a1, const char *a2, ...)
{
  return [a1 addIntraFreqPci:];
}

id objc_msgSend_addLteChanInfo_(void *a1, const char *a2, ...)
{
  return [a1 addLteChanInfo:];
}

id objc_msgSend_addLteMetrics_(void *a1, const char *a2, ...)
{
  return [a1 addLteMetrics:];
}

id objc_msgSend_addLteNcellMeas_(void *a1, const char *a2, ...)
{
  return [a1 addLteNcellMeas:];
}

id objc_msgSend_addMeasGsmResult_(void *a1, const char *a2, ...)
{
  return [a1 addMeasGsmResult:];
}

id objc_msgSend_addMeasLteResult_(void *a1, const char *a2, ...)
{
  return [a1 addMeasLteResult:];
}

id objc_msgSend_addMeasNbrEutra_(void *a1, const char *a2, ...)
{
  return [a1 addMeasNbrEutra];
}

id objc_msgSend_addMeasNbrGeran_(void *a1, const char *a2, ...)
{
  return [a1 addMeasNbrGeran:];
}

id objc_msgSend_addMeasNbrUtra_(void *a1, const char *a2, ...)
{
  return [a1 addMeasNbrUtra:];
}

id objc_msgSend_addMeasUtraResult_(void *a1, const char *a2, ...)
{
  return [a1 addMeasUtraResult:];
}

id objc_msgSend_addMultiBandInfo_(void *a1, const char *a2, ...)
{
  return [a1 addMultiBandInfo:];
}

id objc_msgSend_addNbrEutra_(void *a1, const char *a2, ...)
{
  return [a1 addNbrEutra:];
}

id objc_msgSend_addNewBeamInfo_(void *a1, const char *a2, ...)
{
  return [a1 addNewBeamInfo:];
}

id objc_msgSend_addNumRxLevel_(void *a1, const char *a2, ...)
{
  return [a1 addNumRxLevel:];
}

id objc_msgSend_addNumTxLevel_(void *a1, const char *a2, ...)
{
  return [a1 addNumTxLevel:];
}

id objc_msgSend_addNwUeCapStat_(void *a1, const char *a2, ...)
{
  return [a1 addNwUeCapStat:];
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return [a1 addObject:];
}

id objc_msgSend_addOldBeamInfo_(void *a1, const char *a2, ...)
{
  return [a1 addOldBeamInfo:];
}

id objc_msgSend_addOosStateCount_(void *a1, const char *a2, ...)
{
  return [a1 addOosStateCount:];
}

id objc_msgSend_addOosStateDurationMs_(void *a1, const char *a2, ...)
{
  return [a1 addOosStateDurationMs:];
}

id objc_msgSend_addOosToOosCount_(void *a1, const char *a2, ...)
{
  return [a1 addOosToOosCount:];
}

id objc_msgSend_addPci_(void *a1, const char *a2, ...)
{
  return [a1 addPci:];
}

id objc_msgSend_addPerBand_(void *a1, const char *a2, ...)
{
  return [a1 addPerBand:];
}

id objc_msgSend_addPerDrbConfig_(void *a1, const char *a2, ...)
{
  return [a1 addPerDrbConfig:];
}

id objc_msgSend_addPucchCounter_(void *a1, const char *a2, ...)
{
  return [a1 addPucchCounter:];
}

id objc_msgSend_addPuschCounter_(void *a1, const char *a2, ...)
{
  return [a1 addPuschCounter:];
}

id objc_msgSend_addRbData_(void *a1, const char *a2, ...)
{
  return [a1 addRbData:];
}

id objc_msgSend_addRecoverCountStateBreak_(void *a1, const char *a2, ...)
{
  return [a1 addRecoverCountStateBreak:];
}

id objc_msgSend_addRecoverHist_(void *a1, const char *a2, ...)
{
  return [a1 addRecoverHist:];
}

id objc_msgSend_addRedirArfcn_(void *a1, const char *a2, ...)
{
  return [a1 addRedirArfcn:];
}

id objc_msgSend_addRegProvFlaiList_(void *a1, const char *a2, ...)
{
  return [a1 addRegProvFlaiList:];
}

id objc_msgSend_addRegProvFtaiList_(void *a1, const char *a2, ...)
{
  return [a1 addRegProvFtaiList:];
}

id objc_msgSend_addReleaseCause_(void *a1, const char *a2, ...)
{
  return [a1 addReleaseCause:];
}

id objc_msgSend_addReleaseCauseCountConnected_(void *a1, const char *a2, ...)
{
  return [a1 addReleaseCauseCountConnected:];
}

id objc_msgSend_addReleaseCauseCountConnectedGsm_(void *a1, const char *a2, ...)
{
  return [a1 addReleaseCauseCountConnectedGsm];
}

id objc_msgSend_addReleaseCauseCountConnectedWcdma_(void *a1, const char *a2, ...)
{
  return [a1 addReleaseCauseCountConnectedWcdma];
}

id objc_msgSend_addReleaseCauseCountNotConnected_(void *a1, const char *a2, ...)
{
  return [a1 addReleaseCauseCountNotConnected:];
}

id objc_msgSend_addReleaseCauseCountNotConnectedGsm_(void *a1, const char *a2, ...)
{
  return [a1 addReleaseCauseCountNotConnectedGsm];
}

id objc_msgSend_addReleaseCauseCountNotConnectedWcdma_(void *a1, const char *a2, ...)
{
  return [a1 addReleaseCauseCountNotConnectedWcdma];
}

id objc_msgSend_addRfMeasInfo_(void *a1, const char *a2, ...)
{
  return [a1 addRfMeasInfo:];
}

id objc_msgSend_addRlfCause_(void *a1, const char *a2, ...)
{
  return [a1 addRlfCause:];
}

id objc_msgSend_addRlfCauseSensor_(void *a1, const char *a2, ...)
{
  return [a1 addRlfCauseSensor:];
}

id objc_msgSend_addRoamingFlaiList_(void *a1, const char *a2, ...)
{
  return [a1 addRoamingFlaiList:];
}

id objc_msgSend_addRoamingFtaiList_(void *a1, const char *a2, ...)
{
  return [a1 addRoamingFtaiList:];
}

id objc_msgSend_addRrcConnReestReq_(void *a1, const char *a2, ...)
{
  return [a1 addRrcConnReestReq:];
}

id objc_msgSend_addRrcConnReject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addRrcConnReject:");
}

id objc_msgSend_addRrcConnRel_(void *a1, const char *a2, ...)
{
  return [a1 addRrcConnRel];
}

id objc_msgSend_addRrcConnReqCause_(void *a1, const char *a2, ...)
{
  return [a1 addRrcConnReqCause:];
}

id objc_msgSend_addRrcConnRlf_(void *a1, const char *a2, ...)
{
  return [a1 addRrcConnRlf:];
}

id objc_msgSend_addRrcConnSetupReq_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addRrcConnSetupReq:");
}

id objc_msgSend_addRrcResumeReq_(void *a1, const char *a2, ...)
{
  return [a1 addRrcResumeReq:];
}

id objc_msgSend_addRsrp0_(void *a1, const char *a2, ...)
{
  return [a1 addRsrp0];
}

id objc_msgSend_addRsrp1_(void *a1, const char *a2, ...)
{
  return [a1 addRsrp1];
}

id objc_msgSend_addRsrp2_(void *a1, const char *a2, ...)
{
  return [a1 addRsrp2:];
}

id objc_msgSend_addRsrp3_(void *a1, const char *a2, ...)
{
  return [a1 addRsrp3];
}

id objc_msgSend_addRsrq0_(void *a1, const char *a2, ...)
{
  return [a1 addRsrq0:];
}

id objc_msgSend_addRsrq1_(void *a1, const char *a2, ...)
{
  return [a1 addRsrq1:];
}

id objc_msgSend_addRsrq2_(void *a1, const char *a2, ...)
{
  return [a1 addRsrq2:];
}

id objc_msgSend_addRsrq3_(void *a1, const char *a2, ...)
{
  return [a1 addRsrq3:];
}

id objc_msgSend_addRx0IdleCount_(void *a1, const char *a2, ...)
{
  return [a1 addRx0IdleCount:];
}

id objc_msgSend_addRx0TrafficCount_(void *a1, const char *a2, ...)
{
  return [a1 addRx0TrafficCount:];
}

id objc_msgSend_addRx1TrafficCount_(void *a1, const char *a2, ...)
{
  return [a1 addRx1TrafficCount:];
}

id objc_msgSend_addRxBeamId_(void *a1, const char *a2, ...)
{
  return [a1 addRxBeamId:];
}

id objc_msgSend_addRxBins_(void *a1, const char *a2, ...)
{
  return [a1 addRxBins:];
}

id objc_msgSend_addRxBinsIdle_(void *a1, const char *a2, ...)
{
  return [a1 addRxBinsIdle:];
}

id objc_msgSend_addRxHist_(void *a1, const char *a2, ...)
{
  return [a1 addRxHist:];
}

id objc_msgSend_addRxInfo_(void *a1, const char *a2, ...)
{
  return [a1 addRxInfo:];
}

id objc_msgSend_addRxPowerHist_(void *a1, const char *a2, ...)
{
  return [a1 addRxPowerHist];
}

id objc_msgSend_addSccList_(void *a1, const char *a2, ...)
{
  return [a1 addSccList:];
}

id objc_msgSend_addSecRxBins_(void *a1, const char *a2, ...)
{
  return [a1 addSecRxBins:];
}

id objc_msgSend_addSecRxBinsIdle_(void *a1, const char *a2, ...)
{
  return [a1 addSecRxBinsIdle:];
}

id objc_msgSend_addSecTxBins_(void *a1, const char *a2, ...)
{
  return [a1 addSecTxBins:];
}

id objc_msgSend_addServingCellBeamInfo_(void *a1, const char *a2, ...)
{
  return [a1 addServingCellBeamInfo:];
}

id objc_msgSend_addSfScheduledByState_(void *a1, const char *a2, ...)
{
  return [a1 addSfScheduledByState:];
}

id objc_msgSend_addSfScheduledByType_(void *a1, const char *a2, ...)
{
  return [a1 addSfScheduledByType:];
}

id objc_msgSend_addSib_(void *a1, const char *a2, ...)
{
  return [a1 addSib:];
}

id objc_msgSend_addSinr0_(void *a1, const char *a2, ...)
{
  return [a1 addSinr0:];
}

id objc_msgSend_addSinr1_(void *a1, const char *a2, ...)
{
  return [a1 addSinr1:];
}

id objc_msgSend_addSinr2_(void *a1, const char *a2, ...)
{
  return [a1 addSinr2:];
}

id objc_msgSend_addSinr3_(void *a1, const char *a2, ...)
{
  return [a1 addSinr3:];
}

id objc_msgSend_addSizeTbTotalByState_(void *a1, const char *a2, ...)
{
  return [a1 addSizeTbTotalByState:];
}

id objc_msgSend_addSizeTbTotalByType_(void *a1, const char *a2, ...)
{
  return [a1 addSizeTbTotalByType:];
}

id objc_msgSend_addSrb_(void *a1, const char *a2, ...)
{
  return [a1 addSrb:];
}

id objc_msgSend_addSrvStat_(void *a1, const char *a2, ...)
{
  return [a1 addSrvStat:];
}

id objc_msgSend_addStateHist_(void *a1, const char *a2, ...)
{
  return [a1 addStateHist:];
}

id objc_msgSend_addTaiList_(void *a1, const char *a2, ...)
{
  return [a1 addTaiList:];
}

id objc_msgSend_addTxBins_(void *a1, const char *a2, ...)
{
  return [a1 addTxBins:];
}

id objc_msgSend_addTxHist_(void *a1, const char *a2, ...)
{
  return [a1 addTxHist:];
}

id objc_msgSend_addTxPowerHist_(void *a1, const char *a2, ...)
{
  return [a1 addTxPowerHist:];
}

id objc_msgSend_addTxPowerInfo_(void *a1, const char *a2, ...)
{
  return [a1 addTxPowerInfo:];
}

id objc_msgSend_addTxTrafficCount_(void *a1, const char *a2, ...)
{
  return [a1 addTxTrafficCount];
}

id objc_msgSend_addUlSfScheduledByState_(void *a1, const char *a2, ...)
{
  return [a1 addUlSfScheduledByState:];
}

id objc_msgSend_addUlSfScheduledByType_(void *a1, const char *a2, ...)
{
  return [a1 addUlSfScheduledByType:];
}

id objc_msgSend_addUlSizeTbTotalByState_(void *a1, const char *a2, ...)
{
  return [a1 addUlSizeTbTotalByState:];
}

id objc_msgSend_addUlSizeTbTotalByType_(void *a1, const char *a2, ...)
{
  return [a1 addUlSizeTbTotalByType:];
}

id objc_msgSend_addUmtsChanInfo_(void *a1, const char *a2, ...)
{
  return [a1 addUmtsChanInfo:];
}

id objc_msgSend_addUmtsNcellMeas_(void *a1, const char *a2, ...)
{
  return [a1 addUmtsNcellMeas];
}

id objc_msgSend_addUtraNcell_(void *a1, const char *a2, ...)
{
  return [a1 addUtraNcell:];
}

id objc_msgSend_addUtraPrioInfo_(void *a1, const char *a2, ...)
{
  return [a1 addUtraPrioInfo:];
}

id objc_msgSend_addWtolRedirCount_(void *a1, const char *a2, ...)
{
  return [a1 addWtolRedirCount:];
}

id objc_msgSend_address(void *a1, const char *a2, ...)
{
  return _[a1 address];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return _[a1 allKeys];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return _[a1 allValues];
}

id objc_msgSend_allocWithZone_(void *a1, const char *a2, ...)
{
  return [a1 allocWithZone:];
}

id objc_msgSend_appCategory(void *a1, const char *a2, ...)
{
  return _[a1 appCategory];
}

id objc_msgSend_appsInfo(void *a1, const char *a2, ...)
{
  return _[a1 appsInfo];
}

id objc_msgSend_bandInfoAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 bandInfoAtIndex:];
}

id objc_msgSend_bandInfosCount(void *a1, const char *a2, ...)
{
  return _[a1 bandInfosCount];
}

id objc_msgSend_bearerContextsAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 bearerContextsAtIndex:];
}

id objc_msgSend_bearerContextsCount(void *a1, const char *a2, ...)
{
  return _[a1 bearerContextsCount];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _[a1 BOOLValue];
}

id objc_msgSend_bootstrap(void *a1, const char *a2, ...)
{
  return _[a1 bootstrap];
}

id objc_msgSend_boundDurationSecsAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 boundDurationSecsAtIndex:];
}

id objc_msgSend_boundDurationSecsCount(void *a1, const char *a2, ...)
{
  return _[a1 boundDurationSecsCount];
}

id objc_msgSend_bundleId(void *a1, const char *a2, ...)
{
  return _[a1 bundleId];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return _[a1 bytes];
}

id objc_msgSend_capEventAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 capEventAtIndex:];
}

id objc_msgSend_capEventsCount(void *a1, const char *a2, ...)
{
  return _[a1 capEventsCount];
}

id objc_msgSend_capHistAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 capHistAtIndex:];
}

id objc_msgSend_capHistsCount(void *a1, const char *a2, ...)
{
  return _[a1 capHistsCount];
}

id objc_msgSend_carrierBundleDidUpdate(void *a1, const char *a2, ...)
{
  return _[a1 carrierBundleDidUpdate];
}

id objc_msgSend_carrierBundleType(void *a1, const char *a2, ...)
{
  return _[a1 carrierBundleType];
}

id objc_msgSend_carrierInfoAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 carrierInfoAtIndex:];
}

id objc_msgSend_carrierInfosCount(void *a1, const char *a2, ...)
{
  return _[a1 carrierInfosCount];
}

id objc_msgSend_causeCountApAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 causeCountApAtIndex:];
}

id objc_msgSend_causeCountApsCount(void *a1, const char *a2, ...)
{
  return _[a1 causeCountApsCount];
}

id objc_msgSend_causeCountAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 causeCountAtIndex:];
}

id objc_msgSend_causeCountsCount(void *a1, const char *a2, ...)
{
  return _[a1 causeCountsCount];
}

id objc_msgSend_cellAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 cellAtIndex:];
}

id objc_msgSend_cellsCount(void *a1, const char *a2, ...)
{
  return _[a1 cellsCount];
}

id objc_msgSend_clearAcTxBins(void *a1, const char *a2, ...)
{
  return _[a1 clearAcTxBins];
}

id objc_msgSend_clearAdTxBins(void *a1, const char *a2, ...)
{
  return _[a1 clearAdTxBins];
}

id objc_msgSend_clearBandInfos(void *a1, const char *a2, ...)
{
  return _[a1 clearBandInfos];
}

id objc_msgSend_clearBearerContexts(void *a1, const char *a2, ...)
{
  return _[a1 clearBearerContexts];
}

id objc_msgSend_clearBoundDurationSecs(void *a1, const char *a2, ...)
{
  return _[a1 clearBoundDurationSecs];
}

id objc_msgSend_clearCapEvents(void *a1, const char *a2, ...)
{
  return _[a1 clearCapEvents];
}

id objc_msgSend_clearCapHists(void *a1, const char *a2, ...)
{
  return _[a1 clearCapHists];
}

id objc_msgSend_clearCarrierInfos(void *a1, const char *a2, ...)
{
  return _[a1 clearCarrierInfos];
}

id objc_msgSend_clearCauseCountAps(void *a1, const char *a2, ...)
{
  return _[a1 clearCauseCountAps];
}

id objc_msgSend_clearCauseCounts(void *a1, const char *a2, ...)
{
  return _[a1 clearCauseCounts];
}

id objc_msgSend_clearCells(void *a1, const char *a2, ...)
{
  return _[a1 clearCells];
}

id objc_msgSend_clearConnReqRels(void *a1, const char *a2, ...)
{
  return _[a1 clearConnReqRels];
}

id objc_msgSend_clearCountOfInvalidationReasons(void *a1, const char *a2, ...)
{
  return _[a1 clearCountOfInvalidationReasons];
}

id objc_msgSend_clearCsTxPwrs(void *a1, const char *a2, ...)
{
  return _[a1 clearCsTxPwrs];
}

id objc_msgSend_clearCtolReselCounts(void *a1, const char *a2, ...)
{
  return _[a1 clearCtolReselCounts];
}

id objc_msgSend_clearDelayCnts(void *a1, const char *a2, ...)
{
  return _[a1 clearDelayCnts];
}

id objc_msgSend_clearDrbConfigs(void *a1, const char *a2, ...)
{
  return _[a1 clearDrbConfigs];
}

id objc_msgSend_clearDrbs(void *a1, const char *a2, ...)
{
  return _[a1 clearDrbs];
}

id objc_msgSend_clearEfs(void *a1, const char *a2, ...)
{
  return _[a1 clearEfs];
}

id objc_msgSend_clearEhplmnLists(void *a1, const char *a2, ...)
{
  return _[a1 clearEhplmnLists];
}

id objc_msgSend_clearEndStatusCountAps(void *a1, const char *a2, ...)
{
  return _[a1 clearEndStatusCountAps];
}

id objc_msgSend_clearEndStatusCountConnectedCdmas(void *a1, const char *a2, ...)
{
  return _[a1 clearEndStatusCountConnectedCdmas];
}

id objc_msgSend_clearEndStatusCountConnectedGws(void *a1, const char *a2, ...)
{
  return _[a1 clearEndStatusCountConnectedGws];
}

id objc_msgSend_clearEndStatusCountNotConnectedCdmas(void *a1, const char *a2, ...)
{
  return _[a1 clearEndStatusCountNotConnectedCdmas];
}

id objc_msgSend_clearEndStatusCountNotConnectedGws(void *a1, const char *a2, ...)
{
  return _[a1 clearEndStatusCountNotConnectedGws];
}

id objc_msgSend_clearEndStatusCounts(void *a1, const char *a2, ...)
{
  return _[a1 clearEndStatusCounts];
}

id objc_msgSend_clearEplmnLists(void *a1, const char *a2, ...)
{
  return _[a1 clearEplmnLists];
}

id objc_msgSend_clearEstablishCauses(void *a1, const char *a2, ...)
{
  return _[a1 clearEstablishCauses];
}

id objc_msgSend_clearEutraPrioInfos(void *a1, const char *a2, ...)
{
  return _[a1 clearEutraPrioInfos];
}

id objc_msgSend_clearFailureCountAps(void *a1, const char *a2, ...)
{
  return _[a1 clearFailureCountAps];
}

id objc_msgSend_clearFailureCounts(void *a1, const char *a2, ...)
{
  return _[a1 clearFailureCounts];
}

id objc_msgSend_clearFetchStateDurationSecs(void *a1, const char *a2, ...)
{
  return _[a1 clearFetchStateDurationSecs];
}

id objc_msgSend_clearFromLteHoCounts(void *a1, const char *a2, ...)
{
  return _[a1 clearFromLteHoCounts];
}

id objc_msgSend_clearFromLteRedirCounts(void *a1, const char *a2, ...)
{
  return _[a1 clearFromLteRedirCounts];
}

id objc_msgSend_clearFromLteReselCounts(void *a1, const char *a2, ...)
{
  return _[a1 clearFromLteReselCounts];
}

id objc_msgSend_clearGeraNcells(void *a1, const char *a2, ...)
{
  return _[a1 clearGeraNcells];
}

id objc_msgSend_clearGsmNcellMeas(void *a1, const char *a2, ...)
{
  return _[a1 clearGsmNcellMeas];
}

id objc_msgSend_clearGsmPrioInfos(void *a1, const char *a2, ...)
{
  return _[a1 clearGsmPrioInfos];
}

id objc_msgSend_clearHcStats(void *a1, const char *a2, ...)
{
  return _[a1 clearHcStats];
}

id objc_msgSend_clearHdrRx0IdleCounts(void *a1, const char *a2, ...)
{
  return _[a1 clearHdrRx0IdleCounts];
}

id objc_msgSend_clearHdrRx0TrafficCounts(void *a1, const char *a2, ...)
{
  return _[a1 clearHdrRx0TrafficCounts];
}

id objc_msgSend_clearHdrRx1TrafficCounts(void *a1, const char *a2, ...)
{
  return _[a1 clearHdrRx1TrafficCounts];
}

id objc_msgSend_clearHdrTxTrafficCounts(void *a1, const char *a2, ...)
{
  return _[a1 clearHdrTxTrafficCounts];
}

id objc_msgSend_clearHistPerBands(void *a1, const char *a2, ...)
{
  return _[a1 clearHistPerBands];
}

id objc_msgSend_clearHomeSidNidLists(void *a1, const char *a2, ...)
{
  return _[a1 clearHomeSidNidLists];
}

id objc_msgSend_clearInstValues(void *a1, const char *a2, ...)
{
  return _[a1 clearInstValues];
}

id objc_msgSend_clearIntraFreqPcis(void *a1, const char *a2, ...)
{
  return _[a1 clearIntraFreqPcis];
}

id objc_msgSend_clearLteChanInfos(void *a1, const char *a2, ...)
{
  return _[a1 clearLteChanInfos];
}

id objc_msgSend_clearLteMetrics(void *a1, const char *a2, ...)
{
  return _[a1 clearLteMetrics];
}

id objc_msgSend_clearLteNcellMeas(void *a1, const char *a2, ...)
{
  return _[a1 clearLteNcellMeas];
}

id objc_msgSend_clearMeasGsmResults(void *a1, const char *a2, ...)
{
  return _[a1 clearMeasGsmResults];
}

id objc_msgSend_clearMeasLteResults(void *a1, const char *a2, ...)
{
  return _[a1 clearMeasLteResults];
}

id objc_msgSend_clearMeasNbrEutras(void *a1, const char *a2, ...)
{
  return _[a1 clearMeasNbrEutras];
}

id objc_msgSend_clearMeasNbrGerans(void *a1, const char *a2, ...)
{
  return _[a1 clearMeasNbrGerans];
}

id objc_msgSend_clearMeasNbrUtras(void *a1, const char *a2, ...)
{
  return _[a1 clearMeasNbrUtras];
}

id objc_msgSend_clearMeasUtraResults(void *a1, const char *a2, ...)
{
  return _[a1 clearMeasUtraResults];
}

id objc_msgSend_clearMultiBandInfos(void *a1, const char *a2, ...)
{
  return _[a1 clearMultiBandInfos];
}

id objc_msgSend_clearNbrEutras(void *a1, const char *a2, ...)
{
  return _[a1 clearNbrEutras];
}

id objc_msgSend_clearNewBeamInfos(void *a1, const char *a2, ...)
{
  return _[a1 clearNewBeamInfos];
}

id objc_msgSend_clearNumRxLevels(void *a1, const char *a2, ...)
{
  return _[a1 clearNumRxLevels];
}

id objc_msgSend_clearNumTxLevels(void *a1, const char *a2, ...)
{
  return _[a1 clearNumTxLevels];
}

id objc_msgSend_clearNwUeCapStats(void *a1, const char *a2, ...)
{
  return _[a1 clearNwUeCapStats];
}

id objc_msgSend_clearOldBeamInfos(void *a1, const char *a2, ...)
{
  return _[a1 clearOldBeamInfos];
}

id objc_msgSend_clearOosStateCounts(void *a1, const char *a2, ...)
{
  return _[a1 clearOosStateCounts];
}

id objc_msgSend_clearOosStateDurationMs(void *a1, const char *a2, ...)
{
  return _[a1 clearOosStateDurationMs];
}

id objc_msgSend_clearOosToOosCounts(void *a1, const char *a2, ...)
{
  return _[a1 clearOosToOosCounts];
}

id objc_msgSend_clearPcis(void *a1, const char *a2, ...)
{
  return _[a1 clearPcis];
}

id objc_msgSend_clearPerBands(void *a1, const char *a2, ...)
{
  return _[a1 clearPerBands];
}

id objc_msgSend_clearPerDrbConfigs(void *a1, const char *a2, ...)
{
  return _[a1 clearPerDrbConfigs];
}

id objc_msgSend_clearPucchCounters(void *a1, const char *a2, ...)
{
  return _[a1 clearPucchCounters];
}

id objc_msgSend_clearPuschCounters(void *a1, const char *a2, ...)
{
  return _[a1 clearPuschCounters];
}

id objc_msgSend_clearRbDatas(void *a1, const char *a2, ...)
{
  return _[a1 clearRbDatas];
}

id objc_msgSend_clearRecoverCountStateBreaks(void *a1, const char *a2, ...)
{
  return _[a1 clearRecoverCountStateBreaks];
}

id objc_msgSend_clearRecoverHists(void *a1, const char *a2, ...)
{
  return _[a1 clearRecoverHists];
}

id objc_msgSend_clearRedirArfcns(void *a1, const char *a2, ...)
{
  return _[a1 clearRedirArfcns];
}

id objc_msgSend_clearRegProvFlaiLists(void *a1, const char *a2, ...)
{
  return _[a1 clearRegProvFlaiLists];
}

id objc_msgSend_clearRegProvFtaiLists(void *a1, const char *a2, ...)
{
  return _[a1 clearRegProvFtaiLists];
}

id objc_msgSend_clearReleaseCauseCountConnectedGsms(void *a1, const char *a2, ...)
{
  return _[a1 clearReleaseCauseCountConnectedGsms];
}

id objc_msgSend_clearReleaseCauseCountConnectedWcdmas(void *a1, const char *a2, ...)
{
  return _[a1 clearReleaseCauseCountConnectedWcdmas];
}

id objc_msgSend_clearReleaseCauseCountConnecteds(void *a1, const char *a2, ...)
{
  return _[a1 clearReleaseCauseCountConnecteds];
}

id objc_msgSend_clearReleaseCauseCountNotConnectedGsms(void *a1, const char *a2, ...)
{
  return _[a1 clearReleaseCauseCountNotConnectedGsms];
}

id objc_msgSend_clearReleaseCauseCountNotConnectedWcdmas(void *a1, const char *a2, ...)
{
  return _[a1 clearReleaseCauseCountNotConnectedWcdmas];
}

id objc_msgSend_clearReleaseCauseCountNotConnecteds(void *a1, const char *a2, ...)
{
  return _[a1 clearReleaseCauseCountNotConnecteds];
}

id objc_msgSend_clearReleaseCauses(void *a1, const char *a2, ...)
{
  return _[a1 clearReleaseCauses];
}

id objc_msgSend_clearRfMeasInfos(void *a1, const char *a2, ...)
{
  return _[a1 clearRfMeasInfos];
}

id objc_msgSend_clearRlfCauseSensors(void *a1, const char *a2, ...)
{
  return _[a1 clearRlfCauseSensors];
}

id objc_msgSend_clearRlfCauses(void *a1, const char *a2, ...)
{
  return _[a1 clearRlfCauses];
}

id objc_msgSend_clearRoamingFlaiLists(void *a1, const char *a2, ...)
{
  return _[a1 clearRoamingFlaiLists];
}

id objc_msgSend_clearRoamingFtaiLists(void *a1, const char *a2, ...)
{
  return _[a1 clearRoamingFtaiLists];
}

id objc_msgSend_clearRrcConnReestReqs(void *a1, const char *a2, ...)
{
  return _[a1 clearRrcConnReestReqs];
}

id objc_msgSend_clearRrcConnRejects(void *a1, const char *a2, ...)
{
  return _[a1 clearRrcConnRejects];
}

id objc_msgSend_clearRrcConnRels(void *a1, const char *a2, ...)
{
  return _[a1 clearRrcConnRels];
}

id objc_msgSend_clearRrcConnReqCauses(void *a1, const char *a2, ...)
{
  return _[a1 clearRrcConnReqCauses];
}

id objc_msgSend_clearRrcConnRlfs(void *a1, const char *a2, ...)
{
  return _[a1 clearRrcConnRlfs];
}

id objc_msgSend_clearRrcConnSetupReqs(void *a1, const char *a2, ...)
{
  return _[a1 clearRrcConnSetupReqs];
}

id objc_msgSend_clearRrcResumeReqs(void *a1, const char *a2, ...)
{
  return _[a1 clearRrcResumeReqs];
}

id objc_msgSend_clearRsrp0s(void *a1, const char *a2, ...)
{
  return _[a1 clearRsrp0s];
}

id objc_msgSend_clearRsrp1s(void *a1, const char *a2, ...)
{
  return _[a1 clearRsrp1s];
}

id objc_msgSend_clearRsrp2s(void *a1, const char *a2, ...)
{
  return _[a1 clearRsrp2s];
}

id objc_msgSend_clearRsrp3s(void *a1, const char *a2, ...)
{
  return _[a1 clearRsrp3s];
}

id objc_msgSend_clearRsrq0s(void *a1, const char *a2, ...)
{
  return _[a1 clearRsrq0s];
}

id objc_msgSend_clearRsrq1s(void *a1, const char *a2, ...)
{
  return _[a1 clearRsrq1s];
}

id objc_msgSend_clearRsrq2s(void *a1, const char *a2, ...)
{
  return _[a1 clearRsrq2s];
}

id objc_msgSend_clearRsrq3s(void *a1, const char *a2, ...)
{
  return _[a1 clearRsrq3s];
}

id objc_msgSend_clearRx0IdleCounts(void *a1, const char *a2, ...)
{
  return _[a1 clearRx0IdleCounts];
}

id objc_msgSend_clearRx0TrafficCounts(void *a1, const char *a2, ...)
{
  return _[a1 clearRx0TrafficCounts];
}

id objc_msgSend_clearRx1TrafficCounts(void *a1, const char *a2, ...)
{
  return _[a1 clearRx1TrafficCounts];
}

id objc_msgSend_clearRxBeamIds(void *a1, const char *a2, ...)
{
  return _[a1 clearRxBeamIds];
}

id objc_msgSend_clearRxBins(void *a1, const char *a2, ...)
{
  return _[a1 clearRxBins];
}

id objc_msgSend_clearRxBinsIdles(void *a1, const char *a2, ...)
{
  return _[a1 clearRxBinsIdles];
}

id objc_msgSend_clearRxHists(void *a1, const char *a2, ...)
{
  return _[a1 clearRxHists];
}

id objc_msgSend_clearRxInfos(void *a1, const char *a2, ...)
{
  return _[a1 clearRxInfos];
}

id objc_msgSend_clearRxPowerHists(void *a1, const char *a2, ...)
{
  return _[a1 clearRxPowerHists];
}

id objc_msgSend_clearSccLists(void *a1, const char *a2, ...)
{
  return _[a1 clearSccLists];
}

id objc_msgSend_clearSecRxBins(void *a1, const char *a2, ...)
{
  return _[a1 clearSecRxBins];
}

id objc_msgSend_clearSecRxBinsIdles(void *a1, const char *a2, ...)
{
  return _[a1 clearSecRxBinsIdles];
}

id objc_msgSend_clearSecTxBins(void *a1, const char *a2, ...)
{
  return _[a1 clearSecTxBins];
}

id objc_msgSend_clearServingCellBeamInfos(void *a1, const char *a2, ...)
{
  return _[a1 clearServingCellBeamInfos];
}

id objc_msgSend_clearSfScheduledByStates(void *a1, const char *a2, ...)
{
  return _[a1 clearSfScheduledByStates];
}

id objc_msgSend_clearSfScheduledByTypes(void *a1, const char *a2, ...)
{
  return _[a1 clearSfScheduledByTypes];
}

id objc_msgSend_clearSibs(void *a1, const char *a2, ...)
{
  return _[a1 clearSibs];
}

id objc_msgSend_clearSinr0s(void *a1, const char *a2, ...)
{
  return _[a1 clearSinr0s];
}

id objc_msgSend_clearSinr1s(void *a1, const char *a2, ...)
{
  return _[a1 clearSinr1s];
}

id objc_msgSend_clearSinr2s(void *a1, const char *a2, ...)
{
  return _[a1 clearSinr2s];
}

id objc_msgSend_clearSinr3s(void *a1, const char *a2, ...)
{
  return _[a1 clearSinr3s];
}

id objc_msgSend_clearSizeTbTotalByStates(void *a1, const char *a2, ...)
{
  return _[a1 clearSizeTbTotalByStates];
}

id objc_msgSend_clearSizeTbTotalByTypes(void *a1, const char *a2, ...)
{
  return _[a1 clearSizeTbTotalByTypes];
}

id objc_msgSend_clearSrbs(void *a1, const char *a2, ...)
{
  return _[a1 clearSrbs];
}

id objc_msgSend_clearSrvStats(void *a1, const char *a2, ...)
{
  return _[a1 clearSrvStats];
}

id objc_msgSend_clearStateHists(void *a1, const char *a2, ...)
{
  return _[a1 clearStateHists];
}

id objc_msgSend_clearTaiLists(void *a1, const char *a2, ...)
{
  return _[a1 clearTaiLists];
}

id objc_msgSend_clearTxBins(void *a1, const char *a2, ...)
{
  return _[a1 clearTxBins];
}

id objc_msgSend_clearTxHists(void *a1, const char *a2, ...)
{
  return _[a1 clearTxHists];
}

id objc_msgSend_clearTxPowerHists(void *a1, const char *a2, ...)
{
  return _[a1 clearTxPowerHists];
}

id objc_msgSend_clearTxPowerInfos(void *a1, const char *a2, ...)
{
  return _[a1 clearTxPowerInfos];
}

id objc_msgSend_clearTxTrafficCounts(void *a1, const char *a2, ...)
{
  return _[a1 clearTxTrafficCounts];
}

id objc_msgSend_clearUlSfScheduledByStates(void *a1, const char *a2, ...)
{
  return _[a1 clearUlSfScheduledByStates];
}

id objc_msgSend_clearUlSfScheduledByTypes(void *a1, const char *a2, ...)
{
  return _[a1 clearUlSfScheduledByTypes];
}

id objc_msgSend_clearUlSizeTbTotalByStates(void *a1, const char *a2, ...)
{
  return _[a1 clearUlSizeTbTotalByStates];
}

id objc_msgSend_clearUlSizeTbTotalByTypes(void *a1, const char *a2, ...)
{
  return _[a1 clearUlSizeTbTotalByTypes];
}

id objc_msgSend_clearUmtsChanInfos(void *a1, const char *a2, ...)
{
  return _[a1 clearUmtsChanInfos];
}

id objc_msgSend_clearUmtsNcellMeas(void *a1, const char *a2, ...)
{
  return _[a1 clearUmtsNcellMeas];
}

id objc_msgSend_clearUtraNcells(void *a1, const char *a2, ...)
{
  return _[a1 clearUtraNcells];
}

id objc_msgSend_clearUtraPrioInfos(void *a1, const char *a2, ...)
{
  return _[a1 clearUtraPrioInfos];
}

id objc_msgSend_clearWtolRedirCounts(void *a1, const char *a2, ...)
{
  return _[a1 clearWtolRedirCounts];
}

id objc_msgSend_client(void *a1, const char *a2, ...)
{
  return _[a1 client];
}

id objc_msgSend_connReqRelAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 connReqRelAtIndex:];
}

id objc_msgSend_connReqRelsCount(void *a1, const char *a2, ...)
{
  return _[a1 connReqRelsCount];
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return [a1 containsObject:];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return _[a1 copy];
}

id objc_msgSend_copyBundleIdentifier_bundleType_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "copyBundleIdentifier:bundleType:error:");
}

id objc_msgSend_copyCarrierBundleValue_key_bundleType_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "copyCarrierBundleValue:key:bundleType:error:");
}

id objc_msgSend_copyCarrierBundleVersion_error_(void *a1, const char *a2, ...)
{
  return [a1 copyCarrierBundleVersion:error:];
}

id objc_msgSend_copyWithZone_(void *a1, const char *a2, ...)
{
  return [a1 copyWithZone:];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _[a1 count];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_countOfInvalidationReasonAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 countOfInvalidationReasonAtIndex:];
}

id objc_msgSend_countOfInvalidationReasonsCount(void *a1, const char *a2, ...)
{
  return _[a1 countOfInvalidationReasonsCount];
}

id objc_msgSend_csTxPwrAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 csTxPwrAtIndex:];
}

id objc_msgSend_csTxPwrsCount(void *a1, const char *a2, ...)
{
  return _[a1 csTxPwrsCount];
}

id objc_msgSend_ctolReselCountAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 ctolReselCountAtIndex:];
}

id objc_msgSend_ctolReselCountsCount(void *a1, const char *a2, ...)
{
  return _[a1 ctolReselCountsCount];
}

id objc_msgSend_dataWithContentsOfFile_(void *a1, const char *a2, ...)
{
  return [a1 dataWithContentsOfFile:];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return _[a1 date];
}

id objc_msgSend_delayCntAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 delayCntAtIndex:];
}

id objc_msgSend_delayCntsCount(void *a1, const char *a2, ...)
{
  return _[a1 delayCntsCount];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return _[a1 delegate];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return _[a1 description];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return _[a1 dictionary];
}

id objc_msgSend_dictionaryRepresentation(void *a1, const char *a2, ...)
{
  return _[a1 dictionaryRepresentation];
}

id objc_msgSend_dictionaryWithCapacity_(void *a1, const char *a2, ...)
{
  return [a1 dictionaryWithCapacity:];
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return [a1 dictionaryWithObjects:forKeys:count:];
}

id objc_msgSend_dnn(void *a1, const char *a2, ...)
{
  return _[a1 dnn];
}

id objc_msgSend_drbAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 drbAtIndex:];
}

id objc_msgSend_drbConfigAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 drbConfigAtIndex:];
}

id objc_msgSend_drbConfigsCount(void *a1, const char *a2, ...)
{
  return _[a1 drbConfigsCount];
}

id objc_msgSend_drbsCount(void *a1, const char *a2, ...)
{
  return _[a1 drbsCount];
}

id objc_msgSend_efAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 efAtIndex:];
}

id objc_msgSend_efsCount(void *a1, const char *a2, ...)
{
  return _[a1 efsCount];
}

id objc_msgSend_ehplmnListAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 ehplmnListAtIndex:];
}

id objc_msgSend_ehplmnListsCount(void *a1, const char *a2, ...)
{
  return _[a1 ehplmnListsCount];
}

id objc_msgSend_endStatusCountApAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 endStatusCountApAtIndex:];
}

id objc_msgSend_endStatusCountApsCount(void *a1, const char *a2, ...)
{
  return _[a1 endStatusCountApsCount];
}

id objc_msgSend_endStatusCountAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 endStatusCountAtIndex:];
}

id objc_msgSend_endStatusCountConnectedCdmaAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 endStatusCountConnectedCdmaAtIndex:];
}

id objc_msgSend_endStatusCountConnectedCdmasCount(void *a1, const char *a2, ...)
{
  return _[a1 endStatusCountConnectedCdmasCount];
}

id objc_msgSend_endStatusCountConnectedGwAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 endStatusCountConnectedGwAtIndex:];
}

id objc_msgSend_endStatusCountConnectedGwsCount(void *a1, const char *a2, ...)
{
  return _[a1 endStatusCountConnectedGwsCount];
}

id objc_msgSend_endStatusCountNotConnectedCdmaAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 endStatusCountNotConnectedCdmaAtIndex:];
}

id objc_msgSend_endStatusCountNotConnectedCdmasCount(void *a1, const char *a2, ...)
{
  return _[a1 endStatusCountNotConnectedCdmasCount];
}

id objc_msgSend_endStatusCountNotConnectedGwAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 endStatusCountNotConnectedGwAtIndex:];
}

id objc_msgSend_endStatusCountNotConnectedGwsCount(void *a1, const char *a2, ...)
{
  return _[a1 endStatusCountNotConnectedGwsCount];
}

id objc_msgSend_endStatusCountsCount(void *a1, const char *a2, ...)
{
  return _[a1 endStatusCountsCount];
}

id objc_msgSend_eplmnListAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 eplmnListAtIndex:];
}

id objc_msgSend_eplmnListsCount(void *a1, const char *a2, ...)
{
  return _[a1 eplmnListsCount];
}

id objc_msgSend_establishCauseAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 establishCauseAtIndex:];
}

id objc_msgSend_establishCausesCount(void *a1, const char *a2, ...)
{
  return _[a1 establishCausesCount];
}

id objc_msgSend_eutraPrioInfoAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 eutraPrioInfoAtIndex:];
}

id objc_msgSend_eutraPrioInfosCount(void *a1, const char *a2, ...)
{
  return _[a1 eutraPrioInfosCount];
}

id objc_msgSend_eventsDidUpdate_(void *a1, const char *a2, ...)
{
  return [a1 eventsDidUpdate:];
}

id objc_msgSend_exceptionWithName_reason_userInfo_(void *a1, const char *a2, ...)
{
  return [a1 exceptionWithName:reason:userInfo:];
}

id objc_msgSend_failureCountApAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "failureCountApAtIndex:");
}

id objc_msgSend_failureCountApsCount(void *a1, const char *a2, ...)
{
  return _[a1 failureCountApsCount];
}

id objc_msgSend_failureCountAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 failureCountAtIndex:];
}

id objc_msgSend_failureCountsCount(void *a1, const char *a2, ...)
{
  return _[a1 failureCountsCount];
}

id objc_msgSend_fetchStateDurationSecsAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 fetchStateDurationSecsAtIndex:];
}

id objc_msgSend_fetchStateDurationSecsCount(void *a1, const char *a2, ...)
{
  return _[a1 fetchStateDurationSecsCount];
}

id objc_msgSend_foreground(void *a1, const char *a2, ...)
{
  return _[a1 foreground];
}

id objc_msgSend_fromLteHoCountAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 fromLteHoCountAtIndex:];
}

id objc_msgSend_fromLteHoCountsCount(void *a1, const char *a2, ...)
{
  return _[a1 fromLteHoCountsCount];
}

id objc_msgSend_fromLteRedirCountAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 fromLteRedirCountAtIndex:];
}

id objc_msgSend_fromLteRedirCountsCount(void *a1, const char *a2, ...)
{
  return _[a1 fromLteRedirCountsCount];
}

id objc_msgSend_fromLteReselCountAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 fromLteReselCountAtIndex:];
}

id objc_msgSend_fromLteReselCountsCount(void *a1, const char *a2, ...)
{
  return _[a1 fromLteReselCountsCount];
}

id objc_msgSend_geraNcellAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 geraNcellAtIndex:];
}

id objc_msgSend_geraNcellsCount(void *a1, const char *a2, ...)
{
  return _[a1 geraNcellsCount];
}

id objc_msgSend_getConnectionState_connectionType_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getConnectionState:connectionType:error:");
}

id objc_msgSend_getCurrentDataSubscriptionContextSync_(void *a1, const char *a2, ...)
{
  return [a1 getCurrentDataSubscriptionContextSync];
}

id objc_msgSend_getDualSimCapability_(void *a1, const char *a2, ...)
{
  return [a1 getDualSimCapability];
}

id objc_msgSend_getNRSlicingCBConfigCurrentDataContext(void *a1, const char *a2, ...)
{
  return _[a1 getNRSlicingCBConfigCurrentDataContext];
}

id objc_msgSend_getSliceTrafficDescriptors_(void *a1, const char *a2, ...)
{
  return [a1 getSliceTrafficDescriptors:];
}

id objc_msgSend_getSubscriptionInfoWithError_(void *a1, const char *a2, ...)
{
  return [a1 getSubscriptionInfoWithError:];
}

id objc_msgSend_get_queue(void *a1, const char *a2, ...)
{
  return [a1 get_queue];
}

id objc_msgSend_gsmNcellMeasAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 gsmNcellMeasAtIndex:];
}

id objc_msgSend_gsmNcellMeasCount(void *a1, const char *a2, ...)
{
  return _[a1 gsmNcellMeasCount];
}

id objc_msgSend_gsmPrioInfoAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 gsmPrioInfoAtIndex:];
}

id objc_msgSend_gsmPrioInfosCount(void *a1, const char *a2, ...)
{
  return _[a1 gsmPrioInfosCount];
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return _[a1 hash];
}

id objc_msgSend_hcStatAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 hcStatAtIndex:];
}

id objc_msgSend_hcStatsCount(void *a1, const char *a2, ...)
{
  return _[a1 hcStatsCount];
}

id objc_msgSend_hdrRx0IdleCountAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 hdrRx0IdleCountAtIndex:];
}

id objc_msgSend_hdrRx0IdleCountsCount(void *a1, const char *a2, ...)
{
  return _[a1 hdrRx0IdleCountsCount];
}

id objc_msgSend_hdrRx0TrafficCountAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 hdrRx0TrafficCountAtIndex:];
}

id objc_msgSend_hdrRx0TrafficCountsCount(void *a1, const char *a2, ...)
{
  return _[a1 hdrRx0TrafficCountsCount];
}

id objc_msgSend_hdrRx1TrafficCountAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 hdrRx1TrafficCountAtIndex:];
}

id objc_msgSend_hdrRx1TrafficCountsCount(void *a1, const char *a2, ...)
{
  return _[a1 hdrRx1TrafficCountsCount];
}

id objc_msgSend_hdrTxTrafficCountAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 hdrTxTrafficCountAtIndex:];
}

id objc_msgSend_hdrTxTrafficCountsCount(void *a1, const char *a2, ...)
{
  return _[a1 hdrTxTrafficCountsCount];
}

id objc_msgSend_histPerBandAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 histPerBandAtIndex:];
}

id objc_msgSend_histPerBandsCount(void *a1, const char *a2, ...)
{
  return _[a1 histPerBandsCount];
}

id objc_msgSend_homeSidNidListAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 homeSidNidListAtIndex:];
}

id objc_msgSend_homeSidNidListsCount(void *a1, const char *a2, ...)
{
  return _[a1 homeSidNidListsCount];
}

id objc_msgSend_host(void *a1, const char *a2, ...)
{
  return _[a1 host];
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return _[a1 init];
}

id objc_msgSend_initWithBundleType_(void *a1, const char *a2, ...)
{
  return [a1 initWithBundleType:];
}

id objc_msgSend_initWithCapacity_(void *a1, const char *a2, ...)
{
  return [a1 initWithCapacity:];
}

id objc_msgSend_initWithQueue_(void *a1, const char *a2, ...)
{
  return [a1 initWithQueue:];
}

id objc_msgSend_instValuesAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 instValuesAtIndex:];
}

id objc_msgSend_instValuesCount(void *a1, const char *a2, ...)
{
  return _[a1 instValuesCount];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return _[a1 integerValue];
}

id objc_msgSend_interface(void *a1, const char *a2, ...)
{
  return _[a1 interface];
}

id objc_msgSend_interfaceName(void *a1, const char *a2, ...)
{
  return _[a1 interfaceName];
}

id objc_msgSend_interfaces(void *a1, const char *a2, ...)
{
  return _[a1 interfaces];
}

id objc_msgSend_intraFreqPciAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 intraFreqPciAtIndex:];
}

id objc_msgSend_intraFreqPcisCount(void *a1, const char *a2, ...)
{
  return _[a1 intraFreqPcisCount];
}

id objc_msgSend_ipProtocol(void *a1, const char *a2, ...)
{
  return _[a1 ipProtocol];
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return [a1 isEqual:];
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return [a1 isEqualToString:];
}

id objc_msgSend_isMemberOfClass_(void *a1, const char *a2, ...)
{
  return [a1 isMemberOfClass:];
}

id objc_msgSend_isValidMetricIdTag_forClass_(void *a1, const char *a2, ...)
{
  return [a1 isValidMetricIdTag:forClass:];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _[a1 length];
}

id objc_msgSend_lteChanInfoAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 lteChanInfoAtIndex:];
}

id objc_msgSend_lteChanInfosCount(void *a1, const char *a2, ...)
{
  return _[a1 lteChanInfosCount];
}

id objc_msgSend_lteMetricsAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 lteMetricsAtIndex:];
}

id objc_msgSend_lteMetricsCount(void *a1, const char *a2, ...)
{
  return _[a1 lteMetricsCount];
}

id objc_msgSend_lteNcellMeasAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 lteNcellMeasAtIndex:];
}

id objc_msgSend_lteNcellMeasCount(void *a1, const char *a2, ...)
{
  return _[a1 lteNcellMeasCount];
}

id objc_msgSend_measGsmResultAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 measGsmResultAtIndex:];
}

id objc_msgSend_measGsmResultsCount(void *a1, const char *a2, ...)
{
  return _[a1 measGsmResultsCount];
}

id objc_msgSend_measLteResultAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 measLteResultAtIndex:];
}

id objc_msgSend_measLteResultsCount(void *a1, const char *a2, ...)
{
  return _[a1 measLteResultsCount];
}

id objc_msgSend_measNbrEutraAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 measNbrEutraAtIndex:];
}

id objc_msgSend_measNbrEutrasCount(void *a1, const char *a2, ...)
{
  return _[a1 measNbrEutrasCount];
}

id objc_msgSend_measNbrGeranAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 measNbrGeranAtIndex:];
}

id objc_msgSend_measNbrGeransCount(void *a1, const char *a2, ...)
{
  return _[a1 measNbrGeransCount];
}

id objc_msgSend_measNbrUtraAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 measNbrUtraAtIndex:];
}

id objc_msgSend_measNbrUtrasCount(void *a1, const char *a2, ...)
{
  return _[a1 measNbrUtrasCount];
}

id objc_msgSend_measUtraResultAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 measUtraResultAtIndex:];
}

id objc_msgSend_measUtraResultsCount(void *a1, const char *a2, ...)
{
  return _[a1 measUtraResultsCount];
}

id objc_msgSend_mergeFrom_(void *a1, const char *a2, ...)
{
  return [a1 mergeFrom:];
}

id objc_msgSend_metricsDidUpdate_(void *a1, const char *a2, ...)
{
  return [a1 metricsDidUpdate:];
}

id objc_msgSend_multiBandInfoAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 multiBandInfoAtIndex:];
}

id objc_msgSend_multiBandInfosCount(void *a1, const char *a2, ...)
{
  return _[a1 multiBandInfosCount];
}

id objc_msgSend_nbrEutraAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 nbrEutraAtIndex:];
}

id objc_msgSend_nbrEutrasCount(void *a1, const char *a2, ...)
{
  return _[a1 nbrEutrasCount];
}

id objc_msgSend_newBeamInfoAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 newBeamInfoAtIndex:];
}

id objc_msgSend_newBeamInfosCount(void *a1, const char *a2, ...)
{
  return _[a1 newBeamInfosCount];
}

id objc_msgSend_numRxLevelAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 numRxLevelAtIndex:];
}

id objc_msgSend_numRxLevelsCount(void *a1, const char *a2, ...)
{
  return _[a1 numRxLevelsCount];
}

id objc_msgSend_numTxLevelAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 numTxLevelAtIndex:];
}

id objc_msgSend_numTxLevelsCount(void *a1, const char *a2, ...)
{
  return _[a1 numTxLevelsCount];
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return [a1 numberWithBool:];
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return [a1 numberWithInt:];
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return [a1 numberWithInteger:];
}

id objc_msgSend_numberWithUnsignedInt_(void *a1, const char *a2, ...)
{
  return [a1 numberWithUnsignedInt:];
}

id objc_msgSend_numberWithUnsignedLongLong_(void *a1, const char *a2, ...)
{
  return [a1 numberWithUnsignedLongLong:];
}

id objc_msgSend_nwUeCapStatAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 nwUeCapStatAtIndex:];
}

id objc_msgSend_nwUeCapStatsCount(void *a1, const char *a2, ...)
{
  return _[a1 nwUeCapStatsCount];
}

id objc_msgSend_objectAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 objectAtIndex:];
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return [a1 objectForKey:];
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return [a1 objectForKeyedSubscript:];
}

id objc_msgSend_oldBeamInfoAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 oldBeamInfoAtIndex:];
}

id objc_msgSend_oldBeamInfosCount(void *a1, const char *a2, ...)
{
  return _[a1 oldBeamInfosCount];
}

id objc_msgSend_oosStateCountAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 oosStateCountAtIndex:];
}

id objc_msgSend_oosStateCountsCount(void *a1, const char *a2, ...)
{
  return _[a1 oosStateCountsCount];
}

id objc_msgSend_oosStateDurationMsAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 oosStateDurationMsAtIndex:];
}

id objc_msgSend_oosStateDurationMsCount(void *a1, const char *a2, ...)
{
  return _[a1 oosStateDurationMsCount];
}

id objc_msgSend_oosToOosCountAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 oosToOosCountAtIndex:];
}

id objc_msgSend_oosToOosCountsCount(void *a1, const char *a2, ...)
{
  return _[a1 oosToOosCountsCount];
}

id objc_msgSend_pciAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 pciAtIndex:];
}

id objc_msgSend_pcisCount(void *a1, const char *a2, ...)
{
  return _[a1 pcisCount];
}

id objc_msgSend_perBandAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 perBandAtIndex:];
}

id objc_msgSend_perBandsCount(void *a1, const char *a2, ...)
{
  return _[a1 perBandsCount];
}

id objc_msgSend_perDrbConfigAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 perDrbConfigAtIndex:];
}

id objc_msgSend_perDrbConfigsCount(void *a1, const char *a2, ...)
{
  return _[a1 perDrbConfigsCount];
}

id objc_msgSend_phoneNumber(void *a1, const char *a2, ...)
{
  return _[a1 phoneNumber];
}

id objc_msgSend_port(void *a1, const char *a2, ...)
{
  return _[a1 port];
}

id objc_msgSend_portRangeLow(void *a1, const char *a2, ...)
{
  return _[a1 portRangeLow];
}

id objc_msgSend_portRangeUpper(void *a1, const char *a2, ...)
{
  return _[a1 portRangeUpper];
}

id objc_msgSend_pucchCounterAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 pucchCounterAtIndex:];
}

id objc_msgSend_pucchCountersCount(void *a1, const char *a2, ...)
{
  return _[a1 pucchCountersCount];
}

id objc_msgSend_puschCounterAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 puschCounterAtIndex:];
}

id objc_msgSend_puschCountersCount(void *a1, const char *a2, ...)
{
  return _[a1 puschCountersCount];
}

id objc_msgSend_queue(void *a1, const char *a2, ...)
{
  return _[a1 queue];
}

id objc_msgSend_raise(void *a1, const char *a2, ...)
{
  return _[a1 raise];
}

id objc_msgSend_rbDataAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 rbDataAtIndex:];
}

id objc_msgSend_rbDatasCount(void *a1, const char *a2, ...)
{
  return _[a1 rbDatasCount];
}

id objc_msgSend_recoverCountStateBreakAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 recoverCountStateBreakAtIndex:];
}

id objc_msgSend_recoverCountStateBreaksCount(void *a1, const char *a2, ...)
{
  return _[a1 recoverCountStateBreaksCount];
}

id objc_msgSend_recoverHistAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 recoverHistAtIndex:];
}

id objc_msgSend_recoverHistsCount(void *a1, const char *a2, ...)
{
  return _[a1 recoverHistsCount];
}

id objc_msgSend_redirArfcnAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 redirArfcnAtIndex:];
}

id objc_msgSend_redirArfcnsCount(void *a1, const char *a2, ...)
{
  return _[a1 redirArfcnsCount];
}

id objc_msgSend_regProvFlaiListAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 regProvFlaiListAtIndex:];
}

id objc_msgSend_regProvFlaiListsCount(void *a1, const char *a2, ...)
{
  return _[a1 regProvFlaiListsCount];
}

id objc_msgSend_regProvFtaiListAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 regProvFtaiListAtIndex:];
}

id objc_msgSend_regProvFtaiListsCount(void *a1, const char *a2, ...)
{
  return _[a1 regProvFtaiListsCount];
}

id objc_msgSend_releaseCauseAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 releaseCauseAtIndex:];
}

id objc_msgSend_releaseCauseCountConnectedAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 releaseCauseCountConnectedAtIndex:];
}

id objc_msgSend_releaseCauseCountConnectedGsmAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 releaseCauseCountConnectedGsmAtIndex:];
}

id objc_msgSend_releaseCauseCountConnectedGsmsCount(void *a1, const char *a2, ...)
{
  return _[a1 releaseCauseCountConnectedGsmsCount];
}

id objc_msgSend_releaseCauseCountConnectedWcdmaAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 releaseCauseCountConnectedWcdmaAtIndex:];
}

id objc_msgSend_releaseCauseCountConnectedWcdmasCount(void *a1, const char *a2, ...)
{
  return _[a1 releaseCauseCountConnectedWcdmasCount];
}

id objc_msgSend_releaseCauseCountConnectedsCount(void *a1, const char *a2, ...)
{
  return _[a1 releaseCauseCountConnectedsCount];
}

id objc_msgSend_releaseCauseCountNotConnectedAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 releaseCauseCountNotConnectedAtIndex:];
}

id objc_msgSend_releaseCauseCountNotConnectedGsmAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 releaseCauseCountNotConnectedGsmAtIndex:];
}

id objc_msgSend_releaseCauseCountNotConnectedGsmsCount(void *a1, const char *a2, ...)
{
  return _[a1 releaseCauseCountNotConnectedGsmsCount];
}

id objc_msgSend_releaseCauseCountNotConnectedWcdmaAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 releaseCauseCountNotConnectedWcdmaAtIndex:];
}

id objc_msgSend_releaseCauseCountNotConnectedWcdmasCount(void *a1, const char *a2, ...)
{
  return _[a1 releaseCauseCountNotConnectedWcdmasCount];
}

id objc_msgSend_releaseCauseCountNotConnectedsCount(void *a1, const char *a2, ...)
{
  return _[a1 releaseCauseCountNotConnectedsCount];
}

id objc_msgSend_releaseCausesCount(void *a1, const char *a2, ...)
{
  return _[a1 releaseCausesCount];
}

id objc_msgSend_rfMeasInfoAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 rfMeasInfoAtIndex:];
}

id objc_msgSend_rfMeasInfosCount(void *a1, const char *a2, ...)
{
  return _[a1 rfMeasInfosCount];
}

id objc_msgSend_rlfCauseAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 rlfCauseAtIndex:];
}

id objc_msgSend_rlfCauseSensorAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 rlfCauseSensorAtIndex:];
}

id objc_msgSend_rlfCauseSensorsCount(void *a1, const char *a2, ...)
{
  return _[a1 rlfCauseSensorsCount];
}

id objc_msgSend_rlfCausesCount(void *a1, const char *a2, ...)
{
  return _[a1 rlfCausesCount];
}

id objc_msgSend_roamingFlaiListAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 roamingFlaiListAtIndex:];
}

id objc_msgSend_roamingFlaiListsCount(void *a1, const char *a2, ...)
{
  return _[a1 roamingFlaiListsCount];
}

id objc_msgSend_roamingFtaiListAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 roamingFtaiListAtIndex:];
}

id objc_msgSend_roamingFtaiListsCount(void *a1, const char *a2, ...)
{
  return _[a1 roamingFtaiListsCount];
}

id objc_msgSend_rrcConnReestReqAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 rrcConnReestReqAtIndex:];
}

id objc_msgSend_rrcConnReestReqsCount(void *a1, const char *a2, ...)
{
  return _[a1 rrcConnReestReqsCount];
}

id objc_msgSend_rrcConnRejectAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 rrcConnRejectAtIndex:];
}

id objc_msgSend_rrcConnRejectsCount(void *a1, const char *a2, ...)
{
  return _[a1 rrcConnRejectsCount];
}

id objc_msgSend_rrcConnRelAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 rrcConnRelAtIndex:];
}

id objc_msgSend_rrcConnRelsCount(void *a1, const char *a2, ...)
{
  return _[a1 rrcConnRelsCount];
}

id objc_msgSend_rrcConnReqCauseAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 rrcConnReqCauseAtIndex:];
}

id objc_msgSend_rrcConnReqCausesCount(void *a1, const char *a2, ...)
{
  return _[a1 rrcConnReqCausesCount];
}

id objc_msgSend_rrcConnRlfAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 rrcConnRlfAtIndex:];
}

id objc_msgSend_rrcConnRlfsCount(void *a1, const char *a2, ...)
{
  return _[a1 rrcConnRlfsCount];
}

id objc_msgSend_rrcConnSetupReqAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 rrcConnSetupReqAtIndex:];
}

id objc_msgSend_rrcConnSetupReqsCount(void *a1, const char *a2, ...)
{
  return _[a1 rrcConnSetupReqsCount];
}

id objc_msgSend_rrcResumeReqAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 rrcResumeReqAtIndex:];
}

id objc_msgSend_rrcResumeReqsCount(void *a1, const char *a2, ...)
{
  return _[a1 rrcResumeReqsCount];
}

id objc_msgSend_rsrp0AtIndex_(void *a1, const char *a2, ...)
{
  return [a1 rsrp0AtIndex:];
}

id objc_msgSend_rsrp0sCount(void *a1, const char *a2, ...)
{
  return _[a1 rsrp0sCount];
}

id objc_msgSend_rsrp1AtIndex_(void *a1, const char *a2, ...)
{
  return [a1 rsrp1AtIndex:];
}

id objc_msgSend_rsrp1sCount(void *a1, const char *a2, ...)
{
  return _[a1 rsrp1sCount];
}

id objc_msgSend_rsrp2AtIndex_(void *a1, const char *a2, ...)
{
  return [a1 rsrp2AtIndex:];
}

id objc_msgSend_rsrp2sCount(void *a1, const char *a2, ...)
{
  return _[a1 rsrp2sCount];
}

id objc_msgSend_rsrp3AtIndex_(void *a1, const char *a2, ...)
{
  return [a1 rsrp3AtIndex:];
}

id objc_msgSend_rsrp3sCount(void *a1, const char *a2, ...)
{
  return _[a1 rsrp3sCount];
}

id objc_msgSend_rsrq0AtIndex_(void *a1, const char *a2, ...)
{
  return [a1 rsrq0AtIndex:];
}

id objc_msgSend_rsrq0sCount(void *a1, const char *a2, ...)
{
  return _[a1 rsrq0sCount];
}

id objc_msgSend_rsrq1AtIndex_(void *a1, const char *a2, ...)
{
  return [a1 rsrq1AtIndex:];
}

id objc_msgSend_rsrq1sCount(void *a1, const char *a2, ...)
{
  return _[a1 rsrq1sCount];
}

id objc_msgSend_rsrq2AtIndex_(void *a1, const char *a2, ...)
{
  return [a1 rsrq2AtIndex:];
}

id objc_msgSend_rsrq2sCount(void *a1, const char *a2, ...)
{
  return _[a1 rsrq2sCount];
}

id objc_msgSend_rsrq3AtIndex_(void *a1, const char *a2, ...)
{
  return [a1 rsrq3AtIndex:];
}

id objc_msgSend_rsrq3sCount(void *a1, const char *a2, ...)
{
  return _[a1 rsrq3sCount];
}

id objc_msgSend_rx0IdleCountAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 rx0IdleCountAtIndex:];
}

id objc_msgSend_rx0IdleCountsCount(void *a1, const char *a2, ...)
{
  return _[a1 rx0IdleCountsCount];
}

id objc_msgSend_rx0TrafficCountAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 rx0TrafficCountAtIndex:];
}

id objc_msgSend_rx0TrafficCountsCount(void *a1, const char *a2, ...)
{
  return _[a1 rx0TrafficCountsCount];
}

id objc_msgSend_rx1TrafficCountAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 rx1TrafficCountAtIndex:];
}

id objc_msgSend_rx1TrafficCountsCount(void *a1, const char *a2, ...)
{
  return _[a1 rx1TrafficCountsCount];
}

id objc_msgSend_rxBeamIdAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 rxBeamIdAtIndex:];
}

id objc_msgSend_rxBeamIdsCount(void *a1, const char *a2, ...)
{
  return _[a1 rxBeamIdsCount];
}

id objc_msgSend_rxBinsAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 rxBinsAtIndex:];
}

id objc_msgSend_rxBinsCount(void *a1, const char *a2, ...)
{
  return _[a1 rxBinsCount];
}

id objc_msgSend_rxBinsIdleAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 rxBinsIdleAtIndex:];
}

id objc_msgSend_rxBinsIdlesCount(void *a1, const char *a2, ...)
{
  return _[a1 rxBinsIdlesCount];
}

id objc_msgSend_rxHistAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 rxHistAtIndex:];
}

id objc_msgSend_rxHistsCount(void *a1, const char *a2, ...)
{
  return _[a1 rxHistsCount];
}

id objc_msgSend_rxInfoAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 rxInfoAtIndex:];
}

id objc_msgSend_rxInfosCount(void *a1, const char *a2, ...)
{
  return _[a1 rxInfosCount];
}

id objc_msgSend_rxPowerHistAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 rxPowerHistAtIndex:];
}

id objc_msgSend_rxPowerHistsCount(void *a1, const char *a2, ...)
{
  return _[a1 rxPowerHistsCount];
}

id objc_msgSend_sccListAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 sccListAtIndex:];
}

id objc_msgSend_sccListsCount(void *a1, const char *a2, ...)
{
  return _[a1 sccListsCount];
}

id objc_msgSend_secRxBinsAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 secRxBinsAtIndex:];
}

id objc_msgSend_secRxBinsCount(void *a1, const char *a2, ...)
{
  return _[a1 secRxBinsCount];
}

id objc_msgSend_secRxBinsIdleAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 secRxBinsIdleAtIndex:];
}

id objc_msgSend_secRxBinsIdlesCount(void *a1, const char *a2, ...)
{
  return _[a1 secRxBinsIdlesCount];
}

id objc_msgSend_secTxBinsAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 secTxBinsAtIndex:];
}

id objc_msgSend_secTxBinsCount(void *a1, const char *a2, ...)
{
  return _[a1 secTxBinsCount];
}

id objc_msgSend_servingCellBeamInfoAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 servingCellBeamInfoAtIndex:];
}

id objc_msgSend_servingCellBeamInfosCount(void *a1, const char *a2, ...)
{
  return _[a1 servingCellBeamInfosCount];
}

id objc_msgSend_setActivatedMetric_(void *a1, const char *a2, ...)
{
  return [a1 setActivatedMetric:];
}

id objc_msgSend_setAddress_(void *a1, const char *a2, ...)
{
  return [a1 setAddress:];
}

id objc_msgSend_setApn_(void *a1, const char *a2, ...)
{
  return [a1 setApn:];
}

id objc_msgSend_setAppCategory_(void *a1, const char *a2, ...)
{
  return [a1 setAppCategory:];
}

id objc_msgSend_setApplicationCategory_(void *a1, const char *a2, ...)
{
  return [a1 setApplicationCategory:];
}

id objc_msgSend_setAppsInfo_(void *a1, const char *a2, ...)
{
  return [a1 setAppsInfo:];
}

id objc_msgSend_setAttemptedPlmn_(void *a1, const char *a2, ...)
{
  return [a1 setAttemptedPlmn:];
}

id objc_msgSend_setAvgValues_(void *a1, const char *a2, ...)
{
  return [a1 setAvgValues:];
}

id objc_msgSend_setBdStat_(void *a1, const char *a2, ...)
{
  return [a1 setBdStat:];
}

id objc_msgSend_setBundleId_(void *a1, const char *a2, ...)
{
  return [a1 setBundleId:];
}

id objc_msgSend_setCallId_(void *a1, const char *a2, ...)
{
  return [a1 setCallId:];
}

id objc_msgSend_setConfiguredMetric_(void *a1, const char *a2, ...)
{
  return [a1 setConfiguredMetric:];
}

id objc_msgSend_setContent_(void *a1, const char *a2, ...)
{
  return [a1 setContent:];
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return [a1 setDelegate:];
}

id objc_msgSend_setDnn_(void *a1, const char *a2, ...)
{
  return [a1 setDnn];
}

id objc_msgSend_setDrbConfig_(void *a1, const char *a2, ...)
{
  return [a1 setDrbConfig:];
}

id objc_msgSend_setEncodedPlmn_(void *a1, const char *a2, ...)
{
  return [a1 setEncodedPlmn:];
}

id objc_msgSend_setForeground_(void *a1, const char *a2, ...)
{
  return [a1 setForeground:];
}

id objc_msgSend_setGeraReselInfo_(void *a1, const char *a2, ...)
{
  return [a1 setGeraReselInfo:];
}

id objc_msgSend_setGuti_(void *a1, const char *a2, ...)
{
  return [a1 setGuti:];
}

id objc_msgSend_setHost_(void *a1, const char *a2, ...)
{
  return [a1 setHost:];
}

id objc_msgSend_setHplmn_(void *a1, const char *a2, ...)
{
  return [a1 setHplmn:];
}

id objc_msgSend_setImei_(void *a1, const char *a2, ...)
{
  return [a1 setImei:];
}

id objc_msgSend_setImsi_(void *a1, const char *a2, ...)
{
  return [a1 setImsi:];
}

id objc_msgSend_setInterface_(void *a1, const char *a2, ...)
{
  return [a1 setInterface:];
}

id objc_msgSend_setInterfaces_(void *a1, const char *a2, ...)
{
  return [a1 setInterfaces:];
}

id objc_msgSend_setIpProtocol_(void *a1, const char *a2, ...)
{
  return [a1 setIpProtocol:];
}

id objc_msgSend_setLai_(void *a1, const char *a2, ...)
{
  return [a1 setLai:];
}

id objc_msgSend_setLastAudioQualityCnt_(void *a1, const char *a2, ...)
{
  return [a1 setLastAudioQualityCnt:];
}

id objc_msgSend_setLteBandCombo_(void *a1, const char *a2, ...)
{
  return [a1 setLteBandCombo];
}

id objc_msgSend_setMib_(void *a1, const char *a2, ...)
{
  return [a1 setMib:];
}

id objc_msgSend_setMibContent_(void *a1, const char *a2, ...)
{
  return [a1 setMibContent:];
}

id objc_msgSend_setMrdcLteBandCombo_(void *a1, const char *a2, ...)
{
  return [a1 setMrdcLteBandCombo:];
}

id objc_msgSend_setMrdcNrBandCombo_(void *a1, const char *a2, ...)
{
  return [a1 setMrdcNrBandCombo:];
}

id objc_msgSend_setNr5gBandCombo_(void *a1, const char *a2, ...)
{
  return [a1 setNr5gBandCombo:];
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return [a1 setObject:forKey:];
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return [a1 setObject:forKeyedSubscript:];
}

id objc_msgSend_setOldState_(void *a1, const char *a2, ...)
{
  return [a1 setOldState:];
}

id objc_msgSend_setPdpAddr_(void *a1, const char *a2, ...)
{
  return [a1 setPdpAddr:];
}

id objc_msgSend_setPlmn2nd_(void *a1, const char *a2, ...)
{
  return [a1 setPlmn2nd:];
}

id objc_msgSend_setPlmn_(void *a1, const char *a2, ...)
{
  return [a1 setPlmn:];
}

id objc_msgSend_setPlmnO_(void *a1, const char *a2, ...)
{
  return [a1 setPlmnO:];
}

id objc_msgSend_setPort_(void *a1, const char *a2, ...)
{
  return [a1 setPort:];
}

id objc_msgSend_setPortRangeLow_(void *a1, const char *a2, ...)
{
  return [a1 setPortRangeLow:];
}

id objc_msgSend_setPortRangeUpper_(void *a1, const char *a2, ...)
{
  return [a1 setPortRangeUpper:];
}

id objc_msgSend_setPrimaryDnsAddr_(void *a1, const char *a2, ...)
{
  return [a1 setPrimaryDnsAddr:];
}

id objc_msgSend_setRachConnInfo_(void *a1, const char *a2, ...)
{
  return [a1 setRachConnInfo:];
}

id objc_msgSend_setRai_(void *a1, const char *a2, ...)
{
  return [a1 setRai:];
}

id objc_msgSend_setRecordType_(void *a1, const char *a2, ...)
{
  return [a1 setRecordType:];
}

id objc_msgSend_setSecondaryDnsAddr_(void *a1, const char *a2, ...)
{
  return [a1 setSecondaryDnsAddr:];
}

id objc_msgSend_setSectorId_(void *a1, const char *a2, ...)
{
  return [a1 setSectorId:];
}

id objc_msgSend_setSimHplmn_(void *a1, const char *a2, ...)
{
  return [a1 setSimHplmn];
}

id objc_msgSend_setSimPlmn_(void *a1, const char *a2, ...)
{
  return [a1 setSimPlmn];
}

id objc_msgSend_setThenewState_(void *a1, const char *a2, ...)
{
  return [a1 setThenewState:];
}

id objc_msgSend_setTotalMetric_(void *a1, const char *a2, ...)
{
  return [a1 setTotalMetric:];
}

id objc_msgSend_setTrafficClass_(void *a1, const char *a2, ...)
{
  return [a1 setTrafficClass:];
}

id objc_msgSend_setTrafficDescriptors_(void *a1, const char *a2, ...)
{
  return [a1 setTrafficDescriptors:];
}

id objc_msgSend_setTransId_(void *a1, const char *a2, ...)
{
  return [a1 setTransId:];
}

id objc_msgSend_setUtraReselInfo_(void *a1, const char *a2, ...)
{
  return [a1 setUtraReselInfo:];
}

id objc_msgSend_setVolteCallId_(void *a1, const char *a2, ...)
{
  return [a1 setVolteCallId:];
}

id objc_msgSend_setWtolHoCount_(void *a1, const char *a2, ...)
{
  return [a1 setWtolHoCount:];
}

id objc_msgSend_setWtolReselCount_(void *a1, const char *a2, ...)
{
  return [a1 setWtolReselCount:];
}

id objc_msgSend_sfScheduledByStateAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 sfScheduledByStateAtIndex:];
}

id objc_msgSend_sfScheduledByStatesCount(void *a1, const char *a2, ...)
{
  return _[a1 sfScheduledByStatesCount];
}

id objc_msgSend_sfScheduledByTypeAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 sfScheduledByTypeAtIndex:];
}

id objc_msgSend_sfScheduledByTypesCount(void *a1, const char *a2, ...)
{
  return _[a1 sfScheduledByTypesCount];
}

id objc_msgSend_sibAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 sibAtIndex:];
}

id objc_msgSend_sibsCount(void *a1, const char *a2, ...)
{
  return _[a1 sibsCount];
}

id objc_msgSend_sinr0AtIndex_(void *a1, const char *a2, ...)
{
  return [a1 sinr0AtIndex:];
}

id objc_msgSend_sinr0sCount(void *a1, const char *a2, ...)
{
  return _[a1 sinr0sCount];
}

id objc_msgSend_sinr1AtIndex_(void *a1, const char *a2, ...)
{
  return [a1 sinr1AtIndex:];
}

id objc_msgSend_sinr1sCount(void *a1, const char *a2, ...)
{
  return _[a1 sinr1sCount];
}

id objc_msgSend_sinr2AtIndex_(void *a1, const char *a2, ...)
{
  return [a1 sinr2AtIndex:];
}

id objc_msgSend_sinr2sCount(void *a1, const char *a2, ...)
{
  return _[a1 sinr2sCount];
}

id objc_msgSend_sinr3AtIndex_(void *a1, const char *a2, ...)
{
  return [a1 sinr3AtIndex:];
}

id objc_msgSend_sinr3sCount(void *a1, const char *a2, ...)
{
  return _[a1 sinr3sCount];
}

id objc_msgSend_sizeTbTotalByStateAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 sizeTbTotalByStateAtIndex:];
}

id objc_msgSend_sizeTbTotalByStatesCount(void *a1, const char *a2, ...)
{
  return _[a1 sizeTbTotalByStatesCount];
}

id objc_msgSend_sizeTbTotalByTypeAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 sizeTbTotalByTypeAtIndex:];
}

id objc_msgSend_sizeTbTotalByTypesCount(void *a1, const char *a2, ...)
{
  return _[a1 sizeTbTotalByTypesCount];
}

id objc_msgSend_slicingConfiguration(void *a1, const char *a2, ...)
{
  return _[a1 slicingConfiguration];
}

id objc_msgSend_slicingDescriptorsDidUpdate_withDescriptors_appInfo_andStatus_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "slicingDescriptorsDidUpdate:withDescriptors:appInfo:andStatus:");
}

id objc_msgSend_slicingRunningAppStateChanged_(void *a1, const char *a2, ...)
{
  return [a1 slicingRunningAppStateChanged:];
}

id objc_msgSend_slotID(void *a1, const char *a2, ...)
{
  return _[a1 slotID];
}

id objc_msgSend_srbAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 srbAtIndex:];
}

id objc_msgSend_srbsCount(void *a1, const char *a2, ...)
{
  return _[a1 srbsCount];
}

id objc_msgSend_srvStatAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 srvStatAtIndex:];
}

id objc_msgSend_srvStatsCount(void *a1, const char *a2, ...)
{
  return _[a1 srvStatsCount];
}

id objc_msgSend_stateHistAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 stateHistAtIndex:];
}

id objc_msgSend_stateHistsCount(void *a1, const char *a2, ...)
{
  return _[a1 stateHistsCount];
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return [a1 stringWithFormat:];
}

id objc_msgSend_subscriptionsValid(void *a1, const char *a2, ...)
{
  return _[a1 subscriptionsValid];
}

id objc_msgSend_taiListAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 taiListAtIndex:];
}

id objc_msgSend_taiListsCount(void *a1, const char *a2, ...)
{
  return _[a1 taiListsCount];
}

id objc_msgSend_timeIntervalSince1970(void *a1, const char *a2, ...)
{
  return _[a1 timeIntervalSince1970];
}

id objc_msgSend_trafficClass(void *a1, const char *a2, ...)
{
  return _[a1 trafficClass];
}

id objc_msgSend_trafficDescriptors(void *a1, const char *a2, ...)
{
  return _[a1 trafficDescriptors];
}

id objc_msgSend_txBinsAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 txBinsAtIndex:];
}

id objc_msgSend_txBinsCount(void *a1, const char *a2, ...)
{
  return _[a1 txBinsCount];
}

id objc_msgSend_txHistAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 txHistAtIndex:];
}

id objc_msgSend_txHistsCount(void *a1, const char *a2, ...)
{
  return _[a1 txHistsCount];
}

id objc_msgSend_txPowerHistAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 txPowerHistAtIndex:];
}

id objc_msgSend_txPowerHistsCount(void *a1, const char *a2, ...)
{
  return _[a1 txPowerHistsCount];
}

id objc_msgSend_txPowerInfoAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 txPowerInfoAtIndex:];
}

id objc_msgSend_txPowerInfosCount(void *a1, const char *a2, ...)
{
  return _[a1 txPowerInfosCount];
}

id objc_msgSend_txTrafficCountAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 txTrafficCountAtIndex:];
}

id objc_msgSend_txTrafficCountsCount(void *a1, const char *a2, ...)
{
  return _[a1 txTrafficCountsCount];
}

id objc_msgSend_ulSfScheduledByStateAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 ulSfScheduledByStateAtIndex:];
}

id objc_msgSend_ulSfScheduledByStatesCount(void *a1, const char *a2, ...)
{
  return _[a1 ulSfScheduledByStatesCount];
}

id objc_msgSend_ulSfScheduledByTypeAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 ulSfScheduledByTypeAtIndex:];
}

id objc_msgSend_ulSfScheduledByTypesCount(void *a1, const char *a2, ...)
{
  return _[a1 ulSfScheduledByTypesCount];
}

id objc_msgSend_ulSizeTbTotalByStateAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ulSizeTbTotalByStateAtIndex:");
}

id objc_msgSend_ulSizeTbTotalByStatesCount(void *a1, const char *a2, ...)
{
  return _[a1 ulSizeTbTotalByStatesCount];
}

id objc_msgSend_ulSizeTbTotalByTypeAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ulSizeTbTotalByTypeAtIndex:");
}

id objc_msgSend_ulSizeTbTotalByTypesCount(void *a1, const char *a2, ...)
{
  return _[a1 ulSizeTbTotalByTypesCount];
}

id objc_msgSend_umtsChanInfoAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 umtsChanInfoAtIndex:];
}

id objc_msgSend_umtsChanInfosCount(void *a1, const char *a2, ...)
{
  return _[a1 umtsChanInfosCount];
}

id objc_msgSend_umtsNcellMeasAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 umtsNcellMeasAtIndex:];
}

id objc_msgSend_umtsNcellMeasCount(void *a1, const char *a2, ...)
{
  return _[a1 umtsNcellMeasCount];
}

id objc_msgSend_updateDelegate_status_trafficDescriptors_(void *a1, const char *a2, ...)
{
  return [a1 updateDelegate:status:trafficDescriptors:];
}

id objc_msgSend_utraNcellAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 utraNcellAtIndex:];
}

id objc_msgSend_utraNcellsCount(void *a1, const char *a2, ...)
{
  return _[a1 utraNcellsCount];
}

id objc_msgSend_utraPrioInfoAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 utraPrioInfoAtIndex:];
}

id objc_msgSend_utraPrioInfosCount(void *a1, const char *a2, ...)
{
  return _[a1 utraPrioInfosCount];
}

id objc_msgSend_validSubscriptions(void *a1, const char *a2, ...)
{
  return _[a1 validSubscriptions];
}

id objc_msgSend_wtolRedirCountAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 wtolRedirCountAtIndex:];
}

id objc_msgSend_wtolRedirCountsCount(void *a1, const char *a2, ...)
{
  return _[a1 wtolRedirCountsCount];
}