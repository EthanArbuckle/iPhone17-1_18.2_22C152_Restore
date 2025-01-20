uint64_t sub_10000173C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(void);
  void (*v27)(void);
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  os_log_type_t v31;
  BOOL v32;
  uint8_t *v33;
  uint64_t v34;
  unint64_t v35;
  void (*v36)(char *, uint64_t);
  uint64_t v37;
  void *v38;
  char v39;
  void *v40;
  char v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void (*v45)(uint64_t, uint64_t);
  char *v46;
  char *v47;
  NSObject *v48;
  os_log_type_t v49;
  uint64_t v50;
  uint8_t *v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  char *v55;
  NSObject *v56;
  os_log_type_t v57;
  uint64_t v58;
  uint64_t v59;
  uint8_t *v60;
  uint64_t v61;
  unint64_t v62;
  void (*v63)(char *, uint64_t);
  char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v69;
  char *v70;
  void (*v71)(void);
  NSObject *v72;
  os_log_type_t v73;
  uint64_t v74;
  uint8_t *v75;
  uint64_t v76;
  uint64_t v77;
  unint64_t v78;
  void *v79;
  char *v80;
  uint64_t v81;
  NSObject *v82;
  os_log_type_t v83;
  uint64_t v84;
  uint8_t *v85;
  uint64_t v86;
  unint64_t v87;
  uint64_t (*v88)(char *, uint64_t);
  uint64_t (*v89)(char *, uint64_t);
  uint64_t v90;
  void (*v91)(uint64_t, uint64_t);
  uint64_t v92;
  char *v93;
  uint64_t v94;
  char *v95;
  char *v96;
  char *v97;
  char *v98;
  char *v99;
  uint64_t v100;
  char *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  void (*v105)(void);
  uint64_t v106;
  char *v107;
  uint64_t v108;
  uint64_t v109[2];

  v2 = sub_10000A280();
  v100 = *(void *)(v2 - 8);
  ((void (*)(void))__chkstk_darwin)();
  v4 = (char *)&v90 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_10000A200();
  v6 = *(void *)(v5 - 8);
  v7 = ((uint64_t (*)(void))__chkstk_darwin)();
  v9 = (char *)&v90 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __chkstk_darwin(v7);
  v93 = (char *)&v90 - v11;
  v12 = __chkstk_darwin(v10);
  v97 = (char *)&v90 - v13;
  v14 = __chkstk_darwin(v12);
  v98 = (char *)&v90 - v15;
  v16 = __chkstk_darwin(v14);
  v99 = (char *)&v90 - v17;
  v18 = __chkstk_darwin(v16);
  v20 = (char *)&v90 - v19;
  v21 = __chkstk_darwin(v18);
  v23 = (char *)&v90 - v22;
  __chkstk_darwin(v21);
  v106 = v6;
  v107 = (char *)&v90 - v24;
  v27 = *(void (**)(void))(v6 + 16);
  v25 = v6 + 16;
  v26 = v27;
  v104 = a1;
  v27();
  if (qword_100010070 != -1) {
    swift_once();
  }
  v96 = v4;
  v28 = sub_10000A370();
  v29 = sub_100003634(v28, (uint64_t)qword_100010210);
  v103 = v25;
  v105 = v26;
  ((void (*)(char *, char *, uint64_t))v26)(v23, v107, v5);
  v102 = v29;
  v30 = sub_10000A350();
  v31 = sub_10000A3F0();
  v32 = os_log_type_enabled(v30, v31);
  v95 = v9;
  if (v32)
  {
    v33 = (uint8_t *)swift_slowAlloc();
    v109[0] = swift_slowAlloc();
    v101 = v20;
    *(_DWORD *)v33 = 136315138;
    sub_1000036FC();
    v34 = sub_10000A4D0();
    v108 = sub_100007974(v34, v35, v109);
    v20 = v101;
    sub_10000A440();
    swift_bridgeObjectRelease();
    v36 = *(void (**)(char *, uint64_t))(v106 + 8);
    v36(v23, v5);
    _os_log_impl((void *)&_mh_execute_header, v30, v31, "Attempting to run subtask %s", v33, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    v36 = *(void (**)(char *, uint64_t))(v106 + 8);
    v36(v23, v5);
  }

  v37 = type metadata accessor for PluginSubtask();
  v38 = (void *)(v104 + *(int *)(v37 + 20));
  sub_1000036B8(v38, v38[3]);
  v39 = sub_10000A290();
  ((void (*)(char *, char *, uint64_t))v105)(v20, v107, v5);
  v101 = (char *)v36;
  if (v39)
  {
    v36(v20, v5);
LABEL_11:
    v55 = v99;
    ((void (*)(char *, char *, uint64_t))v105)(v99, v107, v5);
    v56 = sub_10000A350();
    v57 = sub_10000A3E0();
    if (os_log_type_enabled(v56, v57))
    {
      v58 = swift_slowAlloc();
      v94 = v2;
      v59 = v5;
      v60 = (uint8_t *)v58;
      v109[0] = swift_slowAlloc();
      *(_DWORD *)v60 = 136315138;
      sub_1000036FC();
      v61 = sub_10000A4D0();
      v108 = sub_100007974(v61, v62, v109);
      sub_10000A440();
      swift_bridgeObjectRelease();
      v63 = (void (*)(char *, uint64_t))v101;
      ((void (*)(char *, uint64_t))v101)(v55, v59);
      _os_log_impl((void *)&_mh_execute_header, v56, v57, "Skipping subtask %s", v60, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      v64 = v107;
      v65 = v59;
      v2 = v94;
    }
    else
    {

      v63 = (void (*)(char *, uint64_t))v101;
      ((void (*)(char *, uint64_t))v101)(v55, v5);
      v64 = v107;
      v65 = v5;
    }
    v63(v64, v65);
    v66 = v104 + *(int *)(v37 + 24);
    v67 = v100;
    (*(void (**)(uint64_t, uint64_t))(v100 + 8))(v66, v2);
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(v67 + 104))(v66, enum case for ComputationState.taskSkipped(_:), v2);
  }
  v40 = (void *)sub_10000A210();
  v41 = sub_10000A420();

  v36(v20, v5);
  if ((v41 & 1) == 0) {
    goto LABEL_11;
  }
  v42 = v104 + *(int *)(v37 + 24);
  v43 = v100;
  v44 = v100 + 8;
  v45 = *(void (**)(uint64_t, uint64_t))(v100 + 8);
  v45(v42, v2);
  v46 = *(char **)(v43 + 104);
  v106 = v42;
  v104 = v43 + 104;
  v99 = v46;
  ((void (*)(uint64_t, void, uint64_t))v46)(v42, enum case for ComputationState.taskStarted(_:), v2);
  v47 = v98;
  ((void (*)(char *, char *, uint64_t))v105)(v98, v107, v5);
  v48 = sub_10000A350();
  v49 = sub_10000A3E0();
  if (os_log_type_enabled(v48, v49))
  {
    v50 = swift_slowAlloc();
    v94 = v2;
    v92 = v5;
    v51 = (uint8_t *)v50;
    v52 = swift_slowAlloc();
    v90 = v44;
    v109[0] = v52;
    *(_DWORD *)v51 = 136315138;
    v91 = v45;
    sub_1000036FC();
    v53 = sub_10000A4D0();
    v108 = sub_100007974(v53, v54, v109);
    v45 = v91;
    sub_10000A440();
    swift_bridgeObjectRelease();
    ((void (*)(char *, uint64_t))v101)(v47, v92);
    _os_log_impl((void *)&_mh_execute_header, v48, v49, "Running subtask %s", v51, 0xCu);
    swift_arrayDestroy();
    v44 = v90;
    swift_slowDealloc();
    v5 = v92;
    v2 = v94;
    swift_slowDealloc();
  }
  else
  {
    ((void (*)(char *, uint64_t))v101)(v47, v5);
  }

  sub_10000A170();
  v69 = v106;
  v45(v106, v2);
  ((void (*)(uint64_t, void, uint64_t))v99)(v69, enum case for ComputationState.taskCompleted(_:), v2);
  sub_1000036B8(v38, v38[3]);
  if (sub_10000A290())
  {
    v91 = v45;
    v70 = v93;
    v71 = v105;
    ((void (*)(char *, char *, uint64_t))v105)(v93, v107, v5);
    v72 = sub_10000A350();
    v73 = sub_10000A3E0();
    if (os_log_type_enabled(v72, v73))
    {
      v74 = v5;
      v75 = (uint8_t *)swift_slowAlloc();
      v76 = swift_slowAlloc();
      v94 = v2;
      v90 = v44;
      v109[0] = v76;
      *(_DWORD *)v75 = 136315138;
      sub_1000036FC();
      v77 = sub_10000A4D0();
      v108 = sub_100007974(v77, v78, v109);
      sub_10000A440();
      swift_bridgeObjectRelease();
      ((void (*)(char *, uint64_t))v101)(v70, v74);
      _os_log_impl((void *)&_mh_execute_header, v72, v73, "Plugin was asked to stop while running subtask %s", v75, 0xCu);
      swift_arrayDestroy();
      v2 = v94;
      swift_slowDealloc();
      v5 = v74;
      v71 = v105;
      swift_slowDealloc();
    }
    else
    {
      ((void (*)(char *, uint64_t))v101)(v70, v5);
    }

    v80 = v95;
    v81 = v106;
    v91(v106, v2);
    ((void (*)(uint64_t, void, uint64_t))v99)(v81, enum case for ComputationState.taskStopped(_:), v2);
    ((void (*)(char *, char *, uint64_t))v71)(v80, v107, v5);
  }
  else
  {
    v79 = (void *)sub_10000A210();
    sub_10000A430();

    v80 = v95;
    ((void (*)(char *, char *, uint64_t))v105)(v95, v107, v5);
  }
  v82 = sub_10000A350();
  v83 = sub_10000A3F0();
  if (os_log_type_enabled(v82, v83))
  {
    v84 = v5;
    v85 = (uint8_t *)swift_slowAlloc();
    v109[0] = swift_slowAlloc();
    *(_DWORD *)v85 = 136315138;
    sub_1000036FC();
    v86 = sub_10000A4D0();
    v108 = sub_100007974(v86, v87, v109);
    sub_10000A440();
    swift_bridgeObjectRelease();
    v88 = (uint64_t (*)(char *, uint64_t))v101;
    ((void (*)(char *, uint64_t))v101)(v80, v84);
    _os_log_impl((void *)&_mh_execute_header, v82, v83, "Finished running subtask %s", v85, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    return v88(v107, v84);
  }
  else
  {

    v89 = (uint64_t (*)(char *, uint64_t))v101;
    ((void (*)(char *, uint64_t))v101)(v80, v5);
    return v89(v107, v5);
  }
}

uint64_t sub_1000026AC(void (*a1)(void), uint64_t a2)
{
  v3 = v2;
  uint64_t v105 = a2;
  v106 = a1;
  uint64_t v113 = sub_10000A280();
  uint64_t v110 = *(void *)(v113 - 8);
  __chkstk_darwin(v113);
  v5 = (char *)v98 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10000A200();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  v103 = (char *)v98 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __chkstk_darwin(v8);
  v12 = (char *)v98 - v11;
  uint64_t v13 = __chkstk_darwin(v10);
  v100 = (char *)v98 - v14;
  uint64_t v15 = __chkstk_darwin(v13);
  v104 = (char *)v98 - v16;
  uint64_t v17 = __chkstk_darwin(v15);
  v19 = (char *)v98 - v18;
  uint64_t v20 = __chkstk_darwin(v17);
  v22 = (char *)v98 - v21;
  uint64_t v23 = __chkstk_darwin(v20);
  v25 = (char *)v98 - v24;
  __chkstk_darwin(v23);
  v27 = (char *)v98 - v26;
  uint64_t v116 = v7;
  v30 = *(void (**)(char *, char *, uint64_t))(v7 + 16);
  uint64_t v28 = v7 + 16;
  v29 = v30;
  v114 = v3;
  v30((char *)v98 - v26, v3, v6);
  if (qword_100010070 != -1) {
    swift_once();
  }
  v109 = v19;
  v102 = v5;
  uint64_t v31 = sub_10000A370();
  uint64_t v32 = sub_100003634(v31, (uint64_t)qword_100010210);
  uint64_t v112 = v28;
  v115 = v29;
  v29(v25, v27, v6);
  uint64_t v111 = v32;
  v33 = sub_10000A350();
  os_log_type_t v34 = sub_10000A3F0();
  BOOL v35 = os_log_type_enabled(v33, v34);
  v101 = v12;
  if (v35)
  {
    v36 = (uint8_t *)swift_slowAlloc();
    v118[0] = swift_slowAlloc();
    v108 = v27;
    *(_DWORD *)v36 = 136315138;
    sub_1000036FC();
    uint64_t v37 = sub_10000A4D0();
    uint64_t v117 = sub_100007974(v37, v38, v118);
    v27 = v108;
    sub_10000A440();
    swift_bridgeObjectRelease();
    v39 = *(void (**)(char *, uint64_t))(v116 + 8);
    v39(v25, v6);
    _os_log_impl((void *)&_mh_execute_header, v33, v34, "Attempting to run subtask %s", v36, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    v39 = *(void (**)(char *, uint64_t))(v116 + 8);
    v39(v25, v6);
  }

  uint64_t v40 = type metadata accessor for PluginSubtask();
  v41 = &v114[*(int *)(v40 + 20)];
  sub_1000036B8(v41, *((void *)v41 + 3));
  char v42 = sub_10000A290();
  v115(v22, v27, v6);
  if (v42)
  {
    v39(v22, v6);
LABEL_11:
    v62 = v109;
    v115(v109, v27, v6);
    v63 = sub_10000A350();
    os_log_type_t v64 = sub_10000A3E0();
    if (os_log_type_enabled(v63, v64))
    {
      uint64_t v65 = swift_slowAlloc();
      v115 = (void (*)(char *, char *, uint64_t))v40;
      uint64_t v66 = v6;
      v67 = (uint8_t *)v65;
      v118[0] = swift_slowAlloc();
      *(_DWORD *)v67 = 136315138;
      v107 = v39;
      sub_1000036FC();
      uint64_t v68 = sub_10000A4D0();
      uint64_t v117 = sub_100007974(v68, v69, v118);
      sub_10000A440();
      swift_bridgeObjectRelease();
      v70 = v107;
      v107(v62, v66);
      _os_log_impl((void *)&_mh_execute_header, v63, v64, "Skipping subtask %s", v67, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      uint64_t v71 = v66;
      uint64_t v40 = (uint64_t)v115;
      v70(v27, v71);
    }
    else
    {

      v39(v62, v6);
      v39(v27, v6);
    }
    uint64_t v72 = v113;
    v73 = &v114[*(int *)(v40 + 24)];
    uint64_t v74 = v110;
    (*(void (**)(char *, uint64_t))(v110 + 8))(v73, v113);
    return (*(uint64_t (**)(char *, void, uint64_t))(v74 + 104))(v73, enum case for ComputationState.taskSkipped(_:), v72);
  }
  v43 = (void *)sub_10000A210();
  char v44 = sub_10000A420();

  uint64_t v45 = v116 + 8;
  v39(v22, v6);
  if ((v44 & 1) == 0) {
    goto LABEL_11;
  }
  v107 = v39;
  uint64_t v46 = v113;
  v47 = &v114[*(int *)(v40 + 24)];
  uint64_t v48 = v110;
  uint64_t v49 = v110 + 8;
  v99 = *(void (**)(char *, uint64_t))(v110 + 8);
  v99(v47, v113);
  v50 = *(char **)(v48 + 104);
  uint64_t v116 = v48 + 104;
  v114 = v50;
  ((void (*)(char *, void, uint64_t))v50)(v47, enum case for ComputationState.taskStarted(_:), v46);
  v51 = v104;
  v108 = v27;
  v52 = v115;
  v115(v104, v27, v6);
  v53 = sub_10000A350();
  os_log_type_t v54 = sub_10000A3E0();
  BOOL v55 = os_log_type_enabled(v53, v54);
  v109 = v47;
  if (v55)
  {
    uint64_t v56 = swift_slowAlloc();
    v98[0] = v49;
    uint64_t v57 = v6;
    v58 = (uint8_t *)v56;
    uint64_t v59 = swift_slowAlloc();
    v98[1] = v45;
    v118[0] = v59;
    *(_DWORD *)v58 = 136315138;
    sub_1000036FC();
    uint64_t v60 = sub_10000A4D0();
    uint64_t v117 = sub_100007974(v60, v61, v118);
    v52 = v115;
    sub_10000A440();
    swift_bridgeObjectRelease();
    v107(v51, v57);
    _os_log_impl((void *)&_mh_execute_header, v53, v54, "Running subtask %s", v58, 0xCu);
    swift_arrayDestroy();
    v47 = v109;
    swift_slowDealloc();
    uint64_t v6 = v57;
    swift_slowDealloc();
  }
  else
  {
    v107(v51, v6);
  }

  v106();
  v76 = v108;
  uint64_t v77 = v113;
  v99(v47, v113);
  ((void (*)(char *, void, uint64_t))v114)(v47, enum case for ComputationState.taskCompleted(_:), v77);
  sub_1000036B8(v41, *((void *)v41 + 3));
  if (sub_10000A290())
  {
    v78 = v100;
    v52(v100, v76, v6);
    v79 = sub_10000A350();
    os_log_type_t v80 = sub_10000A3E0();
    if (os_log_type_enabled(v79, v80))
    {
      uint64_t v81 = swift_slowAlloc();
      uint64_t v110 = v6;
      v82 = (uint8_t *)v81;
      v118[0] = swift_slowAlloc();
      *(_DWORD *)v82 = 136315138;
      sub_1000036FC();
      uint64_t v83 = sub_10000A4D0();
      uint64_t v117 = sub_100007974(v83, v84, v118);
      v47 = v109;
      sub_10000A440();
      swift_bridgeObjectRelease();
      v107(v78, v110);
      _os_log_impl((void *)&_mh_execute_header, v79, v80, "Plugin was asked to stop while running subtask %s", v82, 0xCu);
      swift_arrayDestroy();
      v76 = v108;
      swift_slowDealloc();
      uint64_t v6 = v110;
      v52 = v115;
      swift_slowDealloc();
    }
    else
    {
      v107(v78, v6);
    }

    v86 = v101;
    uint64_t v87 = v113;
    v99(v47, v113);
    ((void (*)(char *, void, uint64_t))v114)(v47, enum case for ComputationState.taskStopped(_:), v87);
  }
  else
  {
    v85 = (void *)sub_10000A210();
    sub_10000A430();

    v86 = v101;
  }
  v52(v86, v76, v6);
  v88 = sub_10000A350();
  os_log_type_t v89 = sub_10000A3F0();
  if (os_log_type_enabled(v88, v89))
  {
    uint64_t v90 = v6;
    v91 = (uint8_t *)swift_slowAlloc();
    v118[0] = swift_slowAlloc();
    *(_DWORD *)v91 = 136315138;
    sub_1000036FC();
    uint64_t v92 = sub_10000A4D0();
    uint64_t v117 = sub_100007974(v92, v93, v118);
    sub_10000A440();
    swift_bridgeObjectRelease();
    v94 = v86;
    v95 = (uint64_t (*)(char *, uint64_t))v107;
    v107(v94, v90);
    _os_log_impl((void *)&_mh_execute_header, v88, v89, "Finished running subtask %s", v91, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    return v95(v108, v90);
  }
  else
  {

    v96 = v86;
    v97 = (uint64_t (*)(char *, uint64_t))v107;
    v107(v96, v6);
    return v97(v76, v6);
  }
}

uint64_t sub_100003634(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t type metadata accessor for PluginSubtask()
{
  uint64_t result = qword_100010110;
  if (!qword_100010110) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void *sub_1000036B8(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_1000036FC()
{
  unint64_t result = qword_1000100A8;
  if (!qword_1000100A8)
  {
    sub_10000A200();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000100A8);
  }
  return result;
}

uint64_t sub_100003754(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t *sub_100003798(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v14 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v14 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_10000A200();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    long long v9 = *(_OWORD *)((char *)a2 + v8 + 24);
    *(_OWORD *)((char *)a1 + v8 + 24) = v9;
    (**(void (***)(void))(v9 - 8))();
    uint64_t v10 = *(int *)(a3 + 24);
    uint64_t v11 = (char *)a1 + v10;
    v12 = (char *)a2 + v10;
    uint64_t v13 = sub_10000A280();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 16))(v11, v12, v13);
  }
  return a1;
}

uint64_t sub_1000038F4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000A200();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  sub_1000039A8(a1 + *(int *)(a2 + 20));
  uint64_t v5 = a1 + *(int *)(a2 + 24);
  uint64_t v6 = sub_10000A280();
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8);

  return v7(v5, v6);
}

uint64_t sub_1000039A8(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_1000039F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_10000A200();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  long long v8 = *(_OWORD *)(a2 + v7 + 24);
  *(_OWORD *)(a1 + v7 + 24) = v8;
  (**(void (***)(void))(v8 - 8))();
  uint64_t v9 = *(int *)(a3 + 24);
  uint64_t v10 = a1 + v9;
  uint64_t v11 = a2 + v9;
  uint64_t v12 = sub_10000A280();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 16))(v10, v11, v12);
  return a1;
}

uint64_t sub_100003B04(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_10000A200();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  sub_100003BCC((uint64_t *)(a1 + *(int *)(a3 + 20)), (uint64_t *)(a2 + *(int *)(a3 + 20)));
  uint64_t v7 = *(int *)(a3 + 24);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_10000A280();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 24))(v8, v9, v10);
  return a1;
}

uint64_t *sub_100003BCC(uint64_t *result, uint64_t *a2)
{
  if (result != a2)
  {
    v3 = result;
    uint64_t v4 = result[3];
    uint64_t v5 = a2[3];
    if (v4 == v5)
    {
      uint64_t v10 = *(void *)(v4 - 8);
      if ((*(unsigned char *)(v10 + 82) & 2) != 0)
      {
        uint64_t v12 = *a2;
        swift_retain();
        uint64_t result = (uint64_t *)swift_release();
        uint64_t *v3 = v12;
      }
      else
      {
        uint64_t v11 = *(uint64_t (**)(void))(v10 + 24);
        return (uint64_t *)v11();
      }
    }
    else
    {
      result[3] = v5;
      result[4] = a2[4];
      uint64_t v6 = *(void *)(v4 - 8);
      uint64_t v7 = *(void *)(v5 - 8);
      uint64_t v8 = v7;
      int v9 = *(_DWORD *)(v7 + 80);
      if ((*(unsigned char *)(v6 + 82) & 2) != 0)
      {
        if ((v9 & 0x20000) != 0)
        {
          *uint64_t result = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(result, a2, v5);
        }
        return (uint64_t *)swift_release();
      }
      else
      {
        (*(void (**)(unsigned char *, uint64_t *, uint64_t))(v6 + 32))(v13, result, v4);
        if ((v9 & 0x20000) != 0)
        {
          uint64_t *v3 = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(v3, a2, v5);
        }
        return (uint64_t *)(*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v13, v4);
      }
    }
  }
  return result;
}

uint64_t sub_100003DFC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_10000A200();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = *(int *)(a3 + 24);
  uint64_t v9 = a1 + v7;
  uint64_t v10 = a2 + v7;
  long long v11 = *(_OWORD *)(v10 + 16);
  *(_OWORD *)uint64_t v9 = *(_OWORD *)v10;
  *(_OWORD *)(v9 + 16) = v11;
  *(void *)(v9 + 32) = *(void *)(v10 + 32);
  uint64_t v12 = a1 + v8;
  uint64_t v13 = a2 + v8;
  uint64_t v14 = sub_10000A280();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 32))(v12, v13, v14);
  return a1;
}

uint64_t sub_100003ECC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_10000A200();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  sub_1000039A8(a1 + v7);
  long long v10 = *(_OWORD *)(v9 + 16);
  *(_OWORD *)uint64_t v8 = *(_OWORD *)v9;
  *(_OWORD *)(v8 + 16) = v10;
  *(void *)(v8 + 32) = *(void *)(v9 + 32);
  uint64_t v11 = *(int *)(a3 + 24);
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  uint64_t v14 = sub_10000A280();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 40))(v12, v13, v14);
  return a1;
}

uint64_t sub_100003FB0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100003FC4);
}

uint64_t sub_100003FC4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_10000A200();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else if (a2 == 0x7FFFFFFF)
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20) + 24);
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
  else
  {
    uint64_t v11 = sub_10000A280();
    uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 48);
    uint64_t v13 = v11;
    uint64_t v14 = a1 + *(int *)(a3 + 24);
    return v12(v14, a2, v13);
  }
}

uint64_t sub_1000040F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100004108);
}

uint64_t sub_100004108(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_10000A200();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else if (a3 == 0x7FFFFFFF)
  {
    *(void *)(a1 + *(int *)(a4 + 20) + 24) = (a2 - 1);
  }
  else
  {
    uint64_t v11 = sub_10000A280();
    uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56);
    uint64_t v13 = v11;
    uint64_t v14 = a1 + *(int *)(a4 + 24);
    return v12(v14, a2, a2, v13);
  }
  return result;
}

uint64_t sub_100004238()
{
  uint64_t result = sub_10000A200();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_10000A280();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t sub_100004308()
{
  uint64_t v0 = sub_10000A370();
  sub_100009900(v0, qword_100010210);
  sub_100003634(v0, (uint64_t)qword_100010210);
  return sub_10000A360();
}

unint64_t sub_10000437C(char a1)
{
  unint64_t result = 0xD000000000000026;
  switch(a1)
  {
    case 1:
      return result;
    case 2:
      unint64_t result = 0xD00000000000001CLL;
      break;
    case 3:
      unint64_t result = 0xD00000000000001DLL;
      break;
    case 4:
      unint64_t result = 0xD000000000000014;
      break;
    case 5:
      unint64_t result = 0xD000000000000015;
      break;
    default:
      unint64_t result = 0x6465727265666564;
      break;
  }
  return result;
}

uint64_t sub_100004450(char *a1, char *a2)
{
  return sub_10000445C(*a1, *a2);
}

uint64_t sub_10000445C(char a1, char a2)
{
  unint64_t v3 = 0xD000000000000026;
  unint64_t v4 = 0x800000010000ADD0;
  switch(a1)
  {
    case 1:
      break;
    case 2:
      unint64_t v3 = 0xD00000000000001CLL;
      uint64_t v5 = "deferredDuringDataHarvesting";
      goto LABEL_7;
    case 3:
      unint64_t v3 = 0xD00000000000001DLL;
      uint64_t v5 = "deferredAfterDataStorePruning";
      goto LABEL_7;
    case 4:
      unint64_t v4 = 0x800000010000AE40;
      unint64_t v3 = 0xD000000000000014;
      break;
    case 5:
      unint64_t v3 = 0xD000000000000015;
      uint64_t v5 = "deferredAfterTraining";
LABEL_7:
      unint64_t v4 = (unint64_t)(v5 - 32) | 0x8000000000000000;
      break;
    default:
      unint64_t v3 = 0x6465727265666564;
      unint64_t v4 = 0xEF74726174537441;
      break;
  }
  unint64_t v6 = 0xD000000000000026;
  unint64_t v7 = 0x800000010000ADD0;
  switch(a2)
  {
    case 1:
      break;
    case 2:
      unint64_t v6 = 0xD00000000000001CLL;
      uint64_t v8 = "deferredDuringDataHarvesting";
      goto LABEL_14;
    case 3:
      unint64_t v6 = 0xD00000000000001DLL;
      uint64_t v8 = "deferredAfterDataStorePruning";
      goto LABEL_14;
    case 4:
      unint64_t v7 = 0x800000010000AE40;
      unint64_t v6 = 0xD000000000000014;
      break;
    case 5:
      unint64_t v6 = 0xD000000000000015;
      uint64_t v8 = "deferredAfterTraining";
LABEL_14:
      unint64_t v7 = (unint64_t)(v8 - 32) | 0x8000000000000000;
      break;
    default:
      unint64_t v6 = 0x6465727265666564;
      unint64_t v7 = 0xEF74726174537441;
      break;
  }
  if (v3 == v6 && v4 == v7) {
    char v9 = 1;
  }
  else {
    char v9 = sub_10000A4E0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v9 & 1;
}

Swift::Int sub_10000464C()
{
  return sub_100004654();
}

Swift::Int sub_100004654()
{
  return sub_10000A560();
}

uint64_t sub_100004778()
{
  return sub_100004780();
}

uint64_t sub_100004780()
{
  sub_10000A3B0();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_100004888()
{
  return sub_100004890();
}

Swift::Int sub_100004890()
{
  return sub_10000A560();
}

uint64_t sub_1000049B0@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_100008128(*(void *)a1, *(void **)(a1 + 8));
  *a2 = result;
  return result;
}

unint64_t sub_1000049E0@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_10000437C(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_100004A1C()
{
  return 1;
}

Swift::Int sub_100004A24()
{
  return sub_10000A560();
}

uint64_t sub_100004A7C()
{
  return sub_10000A3B0();
}

Swift::Int sub_100004A98()
{
  return sub_10000A560();
}

uint64_t sub_100004AEC@<X0>(uint64_t *a1@<X0>, BOOL *a2@<X8>)
{
  v7._countAndFlagsBits = *a1;
  unint64_t v3 = (void *)a1[1];
  v4._rawValue = &off_10000C7B0;
  v7._object = v3;
  Swift::Int v5 = sub_10000A4C0(v4, v7);
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v5 != 0;
  return result;
}

void sub_100004B40(void *a1@<X8>)
{
  *a1 = 0xD00000000000001DLL;
  a1[1] = 0x800000010000AE80;
}

void sub_100004B60()
{
  qword_100010228 = 0x6E6F6973726576;
  qword_100010230 = 0xE700000000000000;
}

void sub_100004B84()
{
  qword_100010238 = 0x6E776F6E6B6E75;
  unk_100010240 = 0xE700000000000000;
}

void sub_100004BA8(uint64_t a1)
{
}

void sub_100004BCC()
{
  qword_100010250 = 0x6E6F447075746553;
  *(void *)algn_100010258 = 0xE900000000000065;
}

void sub_100004BF4(uint64_t a1)
{
}

void sub_100004C18(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5 = objc_allocWithZone((Class)NSUserDefaults);
  NSString v6 = sub_10000A380();
  id v7 = [v5 initWithSuiteName:v6];

  *a4 = v7;
}

void sub_100004C88(uint64_t a1@<X8>)
{
  id v2 = [self clientWithIdentifier:210];
  NSString v3 = sub_10000A380();
  id v4 = [v2 experimentIdentifiersWithNamespaceName:v3];

  if (qword_100010070 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_10000A370();
  sub_100003634(v5, (uint64_t)qword_100010210);
  id v6 = v4;
  id v7 = sub_10000A350();
  os_log_type_t v8 = sub_10000A3E0();
  if (os_log_type_enabled(v7, v8))
  {
    char v9 = (uint8_t *)swift_slowAlloc();
    unint64_t v10 = (void *)swift_slowAlloc();
    *(_DWORD *)char v9 = 138412290;
    if (v6)
    {
      id v11 = v6;
      sub_10000A440();
    }
    else
    {
      sub_10000A440();
      id v4 = 0;
    }
    *unint64_t v10 = v4;

    _os_log_impl((void *)&_mh_execute_header, v7, v8, "TrialRecipe: Trial identifiers: %@", v9, 0xCu);
    sub_100003754(&qword_1000100B0);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    if (!v6) {
      goto LABEL_10;
    }
LABEL_7:
    id v12 = v6;
    id v13 = [v12 experimentId];
    sub_10000A390();

    id v14 = [v12 treatmentId];
    sub_10000A390();

    [v12 deploymentId];
    sub_10000A4D0();
    sub_10000A260();

    uint64_t v15 = sub_10000A270();
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(a1, 0, 1, v15);
    return;
  }

  if (v6) {
    goto LABEL_7;
  }
LABEL_10:
  uint64_t v16 = sub_10000A270();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(a1, 1, 1, v16);
}

uint64_t sub_100005028(uint64_t a1)
{
  v1[17] = a1;
  v1[18] = type metadata accessor for PluginSubtask();
  v1[19] = swift_task_alloc();
  v1[20] = swift_task_alloc();
  v1[21] = swift_task_alloc();
  v1[22] = swift_task_alloc();
  uint64_t v2 = sub_10000A340();
  v1[23] = v2;
  v1[24] = *(void *)(v2 - 8);
  v1[25] = swift_task_alloc();
  uint64_t v3 = sub_10000A250();
  v1[26] = v3;
  v1[27] = *(void *)(v3 - 8);
  v1[28] = swift_task_alloc();
  sub_100003754(&qword_100010180);
  v1[29] = swift_task_alloc();
  return _swift_task_switch(sub_1000051CC, 0, 0);
}

uint64_t sub_1000051CC()
{
  v164 = v0;
  if (qword_100010070 != -1) {
    swift_once();
  }
  uint64_t v2 = (id *)(v0 + 17);
  unint64_t v1 = (void *)v0[17];
  uint64_t v3 = sub_10000A370();
  sub_100003634(v3, (uint64_t)qword_100010210);
  id v4 = v1;
  uint64_t v5 = sub_10000A350();
  os_log_type_t v6 = sub_10000A3E0();
  BOOL v7 = os_log_type_enabled(v5, v6);
  os_log_type_t v8 = (void *)v0[17];
  v158 = (id *)(v0 + 17);
  if (v7)
  {
    uint64_t v9 = swift_slowAlloc();
    v161[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v9 = 136315394;
    uint64_t v10 = sub_10000A1E0();
    v0[15] = sub_100007974(v10, v11, v161);
    sub_10000A440();
    swift_bridgeObjectRelease();

    *(_WORD *)(v9 + 12) = 2080;
    uint64_t v12 = sub_10000A1F0();
    v0[16] = sub_100007974(v12, v13, v161);
    uint64_t v2 = (id *)(v0 + 17);
    sub_10000A440();
    swift_bridgeObjectRelease();

    _os_log_impl((void *)&_mh_execute_header, v5, v6, "TaskId: %s, TaskName: %s", (uint8_t *)v9, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  if (sub_10000A3D0())
  {
    id v14 = *v2;
    uint64_t v15 = sub_10000A350();
    os_log_type_t v16 = sub_10000A3E0();
    BOOL v17 = os_log_type_enabled(v15, v16);
    id v18 = *v2;
    if (v17)
    {
      uint64_t v19 = swift_slowAlloc();
      v161[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v19 = 136315394;
      uint64_t v20 = sub_10000A1E0();
      v0[13] = sub_100007974(v20, v21, v161);
      sub_10000A440();
      swift_bridgeObjectRelease();

      *(_WORD *)(v19 + 12) = 2080;
      uint64_t v22 = sub_10000A1F0();
      v0[14] = sub_100007974(v22, v23, v161);
      sub_10000A440();
      swift_bridgeObjectRelease();

      _os_log_impl((void *)&_mh_execute_header, v15, v16, "TaskId: %s, TaskName: %s: asked to stop!", (uint8_t *)v19, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
    }
    v162 = &type metadata for BackgroundWorkerError;
    unint64_t v163 = sub_100009664();
    LOBYTE(v161[0]) = 0;
    id v26 = objc_allocWithZone((Class)sub_10000A1B0());
    uint64_t v27 = sub_10000A190();
    goto LABEL_56;
  }
  if (sub_10000A1F0() == 0xD00000000000005ELL && v24 == 0x800000010000AEA0)
  {
    swift_bridgeObjectRelease();
    char v25 = 1;
  }
  else
  {
    char v25 = sub_10000A4E0();
    swift_bridgeObjectRelease();
  }
  id v28 = sub_100008174();
  char v159 = v25;
  if (v28)
  {
    v29 = v28;
    v30 = sub_10000A350();
    os_log_type_t v31 = sub_10000A3E0();
    if (os_log_type_enabled(v30, v31))
    {
      uint64_t v32 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v32 = 0;
      _os_log_impl((void *)&_mh_execute_header, v30, v31, "Using Recipe from Trial", v32, 2u);
      swift_slowDealloc();
    }
  }
  else
  {
    unint64_t v69 = (char *)v0[29];
    sub_10000664C(v69);
    v29 = sub_100009034(v69);
    sub_1000096D8(v0[29], &qword_100010180);
  }
  uint64_t v33 = v0[28];
  uint64_t v35 = v0[24];
  uint64_t v34 = v0[25];
  uint64_t v37 = v0[22];
  uint64_t v36 = v0[23];
  uint64_t v38 = v0[18];
  swift_bridgeObjectRetain();
  sub_10000A240();
  sub_10000A330();
  uint64_t v39 = enum case for SubtaskName.computeDurableFeatures(_:);
  uint64_t v40 = sub_10000A200();
  v155 = *(void (**)(uint64_t, uint64_t))(*(void *)(v40 - 8) + 104);
  uint64_t v156 = v40;
  v155(v37, v39);
  v41 = (uint64_t *)(v37 + *(int *)(v38 + 20));
  v41[3] = v36;
  v41[4] = (uint64_t)&protocol witness table for IsTaskCancelledExecutionManager;
  char v42 = sub_10000956C(v41);
  v154 = *(void (**)(uint64_t *, uint64_t, uint64_t))(v35 + 16);
  v154(v42, v34, v36);
  uint64_t v157 = v38;
  uint64_t v43 = v37 + *(int *)(v38 + 24);
  uint64_t v44 = enum case for ComputationState.taskNotExecuted(_:);
  uint64_t v45 = sub_10000A280();
  v153 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v45 - 8) + 104);
  v153(v43, v44, v45);
  uint64_t v46 = swift_task_alloc();
  *(void *)(v46 + 16) = v33;
  *(void *)(v46 + 24) = v34;
  sub_1000026AC((void (*)(void))sub_1000095D0, v46);
  swift_task_dealloc();
  if (v159)
  {
    swift_bridgeObjectRelease();
    if (qword_100010098 != -1) {
      swift_once();
    }
    v47 = (void *)qword_100010260;
    if (qword_100010260)
    {
      NSString v48 = sub_10000A380();
      [v47 setBool:1 forKey:v48];
    }
    uint64_t v50 = v0[27];
    uint64_t v49 = v0[28];
    uint64_t v52 = v0[25];
    uint64_t v51 = v0[26];
    uint64_t v53 = v0[23];
    uint64_t v54 = v0[24];
    uint64_t v55 = v0[22];
    id v56 = objc_allocWithZone((Class)sub_10000A1B0());
    uint64_t v57 = sub_10000A1A0();
    goto LABEL_35;
  }
  if (sub_10000A3D0())
  {
    id v58 = *v158;
    swift_bridgeObjectRelease();
    id v59 = v58;
    uint64_t v60 = sub_10000A350();
    os_log_type_t v61 = sub_10000A3E0();
    BOOL v62 = os_log_type_enabled(v60, v61);
    id v63 = *v158;
    if (v62)
    {
      uint64_t v64 = swift_slowAlloc();
      v161[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v64 = 136315394;
      uint64_t v65 = sub_10000A1E0();
      v0[10] = sub_100007974(v65, v66, v161);
      sub_10000A440();
      swift_bridgeObjectRelease();

      *(_WORD *)(v64 + 12) = 2080;
      uint64_t v67 = sub_10000A1F0();
      v0[11] = sub_100007974(v67, v68, v161);
      sub_10000A440();
      swift_bridgeObjectRelease();

      _os_log_impl((void *)&_mh_execute_header, v60, v61, "TaskId: %s, TaskName: %s: plugin stopped after durable feature generation", (uint8_t *)v64, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
    }
    uint64_t v50 = v0[27];
    uint64_t v49 = v0[28];
    uint64_t v52 = v0[25];
    uint64_t v51 = v0[26];
    uint64_t v53 = v0[23];
    uint64_t v54 = v0[24];
    uint64_t v55 = v0[22];
    v162 = &type metadata for BackgroundWorkerError;
    unint64_t v163 = sub_100009664();
    LOBYTE(v161[0]) = 1;
    id v87 = objc_allocWithZone((Class)sub_10000A1B0());
    uint64_t v57 = sub_10000A190();
LABEL_35:
    uint64_t v27 = v57;
    sub_100009608(v55);
    (*(void (**)(uint64_t, uint64_t))(v54 + 8))(v52, v53);
    (*(void (**)(uint64_t, uint64_t))(v50 + 8))(v49, v51);
    goto LABEL_56;
  }
  if (sub_10000A220())
  {
    uint64_t v70 = v0[28];
    uint64_t v71 = v0[25];
    uint64_t v72 = v0[23];
    uint64_t v73 = v0[21];
    ((void (*)(uint64_t, void, uint64_t))v155)(v73, enum case for SubtaskName.harvestData(_:), v156);
    uint64_t v74 = (uint64_t *)(v73 + *(int *)(v157 + 20));
    v74[3] = v72;
    v74[4] = (uint64_t)&protocol witness table for IsTaskCancelledExecutionManager;
    v75 = sub_10000956C(v74);
    v154(v75, v71, v72);
    v153(v73 + *(int *)(v157 + 24), v44, v45);
    v76 = (void *)swift_task_alloc();
    v76[2] = v70;
    v76[3] = v71;
    v76[4] = v29;
    sub_1000026AC((void (*)(void))sub_1000096B8, (uint64_t)v76);
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    if (sub_10000A3D0())
    {
      id v77 = *v158;
      v78 = sub_10000A350();
      os_log_type_t v79 = sub_10000A3E0();
      BOOL v80 = os_log_type_enabled(v78, v79);
      id v81 = *v158;
      if (v80)
      {
        uint64_t v82 = swift_slowAlloc();
        v161[0] = swift_slowAlloc();
        *(_DWORD *)uint64_t v82 = 136315394;
        uint64_t v83 = sub_10000A1E0();
        v0[8] = sub_100007974(v83, v84, v161);
        sub_10000A440();
        swift_bridgeObjectRelease();

        *(_WORD *)(v82 + 12) = 2080;
        uint64_t v85 = sub_10000A1F0();
        v0[9] = sub_100007974(v85, v86, v161);
        sub_10000A440();
        swift_bridgeObjectRelease();

        _os_log_impl((void *)&_mh_execute_header, v78, v79, "TaskId: %s, TaskName: %s: plugin stopped after data harvesting", (uint8_t *)v82, 0x16u);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {
      }
      uint64_t v121 = v0[27];
      uint64_t v120 = v0[28];
      uint64_t v123 = v0[25];
      uint64_t v122 = v0[26];
      uint64_t v124 = v0[23];
      uint64_t v125 = v0[24];
      uint64_t v127 = v0[21];
      uint64_t v126 = v0[22];
      v162 = &type metadata for BackgroundWorkerError;
      unint64_t v163 = sub_100009664();
      char v128 = 2;
      goto LABEL_49;
    }
    sub_100009608(v0[21]);
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  uint64_t v88 = v0[28];
  uint64_t v89 = v0[25];
  uint64_t v90 = v0[23];
  uint64_t v91 = v0[20];
  ((void (*)(uint64_t, void, uint64_t))v155)(v91, enum case for SubtaskName.pruneVirtualFeatureStore(_:), v156);
  uint64_t v92 = (uint64_t *)(v91 + *(int *)(v157 + 20));
  v92[3] = v90;
  v92[4] = (uint64_t)&protocol witness table for IsTaskCancelledExecutionManager;
  unint64_t v93 = sub_10000956C(v92);
  v154(v93, v89, v90);
  v153(v91 + *(int *)(v157 + 24), v44, v45);
  uint64_t v94 = swift_task_alloc();
  *(void *)(v94 + 16) = v88;
  *(void *)(v94 + 24) = v89;
  sub_1000026AC((void (*)(void))sub_1000095EC, v94);
  swift_task_dealloc();
  if ((sub_10000A3D0() & 1) == 0)
  {
    if (sub_10000A230())
    {
      uint64_t v105 = v0[25];
      uint64_t v106 = v0[23];
      uint64_t v107 = v0[19];
      ((void (*)(uint64_t, void, uint64_t))v155)(v107, enum case for SubtaskName.sendMetrics(_:), v156);
      v108 = (uint64_t *)(v107 + *(int *)(v157 + 20));
      v108[3] = v106;
      v108[4] = (uint64_t)&protocol witness table for IsTaskCancelledExecutionManager;
      v109 = sub_10000956C(v108);
      v154(v109, v105, v106);
      v153(v107 + *(int *)(v157 + 24), v44, v45);
      sub_10000173C(v107);
      if (sub_10000A3D0())
      {
        id v110 = *v158;
        uint64_t v111 = sub_10000A350();
        os_log_type_t v112 = sub_10000A3E0();
        BOOL v113 = os_log_type_enabled(v111, v112);
        id v114 = *v158;
        if (v113)
        {
          uint64_t v115 = swift_slowAlloc();
          v161[0] = swift_slowAlloc();
          *(_DWORD *)uint64_t v115 = 136315394;
          uint64_t v116 = sub_10000A1E0();
          v0[4] = sub_100007974(v116, v117, v161);
          sub_10000A440();
          swift_bridgeObjectRelease();

          *(_WORD *)(v115 + 12) = 2080;
          uint64_t v118 = sub_10000A1F0();
          v0[5] = sub_100007974(v118, v119, v161);
          sub_10000A440();
          swift_bridgeObjectRelease();

          _os_log_impl((void *)&_mh_execute_header, v111, v112, "TaskId: %s, TaskName: %s: plugin stopped after metrics reporting", (uint8_t *)v115, 0x16u);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();
        }
        else
        {
        }
        uint64_t v144 = v0[27];
        uint64_t v160 = v0[28];
        uint64_t v146 = v0[25];
        uint64_t v145 = v0[26];
        uint64_t v148 = v0[23];
        uint64_t v147 = v0[24];
        uint64_t v149 = v0[22];
        uint64_t v151 = v0[19];
        uint64_t v150 = v0[20];
        v162 = &type metadata for BackgroundWorkerError;
        unint64_t v163 = sub_100009664();
        LOBYTE(v161[0]) = 4;
        id v152 = objc_allocWithZone((Class)sub_10000A1B0());
        uint64_t v27 = sub_10000A190();
        sub_100009608(v151);
        sub_100009608(v150);
        sub_100009608(v149);
        (*(void (**)(uint64_t, uint64_t))(v147 + 8))(v146, v148);
        (*(void (**)(uint64_t, uint64_t))(v144 + 8))(v160, v145);
        goto LABEL_56;
      }
      sub_100009608(v0[19]);
    }
    id v131 = *v158;
    v132 = sub_10000A350();
    os_log_type_t v133 = sub_10000A3E0();
    BOOL v134 = os_log_type_enabled(v132, v133);
    id v135 = *v158;
    if (v134)
    {
      uint64_t v136 = swift_slowAlloc();
      v161[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v136 = 136315394;
      uint64_t v137 = sub_10000A1E0();
      v0[2] = sub_100007974(v137, v138, v161);
      sub_10000A440();
      swift_bridgeObjectRelease();

      *(_WORD *)(v136 + 12) = 2080;
      uint64_t v139 = sub_10000A1F0();
      v0[3] = sub_100007974(v139, v140, v161);
      sub_10000A440();
      swift_bridgeObjectRelease();

      _os_log_impl((void *)&_mh_execute_header, v132, v133, "TaskId: %s, TaskName: %s: task completed", (uint8_t *)v136, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
    }
    uint64_t v121 = v0[27];
    uint64_t v120 = v0[28];
    uint64_t v123 = v0[25];
    uint64_t v122 = v0[26];
    uint64_t v124 = v0[23];
    uint64_t v125 = v0[24];
    uint64_t v126 = v0[22];
    uint64_t v127 = v0[20];
    id v141 = objc_allocWithZone((Class)sub_10000A1B0());
    uint64_t v130 = sub_10000A1A0();
    goto LABEL_55;
  }
  id v95 = *v158;
  v96 = sub_10000A350();
  os_log_type_t v97 = sub_10000A3E0();
  BOOL v98 = os_log_type_enabled(v96, v97);
  id v99 = *v158;
  if (v98)
  {
    uint64_t v100 = swift_slowAlloc();
    v161[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v100 = 136315394;
    uint64_t v101 = sub_10000A1E0();
    v0[6] = sub_100007974(v101, v102, v161);
    sub_10000A440();
    swift_bridgeObjectRelease();

    *(_WORD *)(v100 + 12) = 2080;
    uint64_t v103 = sub_10000A1F0();
    v0[7] = sub_100007974(v103, v104, v161);
    sub_10000A440();
    swift_bridgeObjectRelease();

    _os_log_impl((void *)&_mh_execute_header, v96, v97, "TaskId: %s, TaskName: %s: plugin stopped after virtual feature store pruning", (uint8_t *)v100, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  uint64_t v121 = v0[27];
  uint64_t v120 = v0[28];
  uint64_t v123 = v0[25];
  uint64_t v122 = v0[26];
  uint64_t v124 = v0[23];
  uint64_t v125 = v0[24];
  uint64_t v126 = v0[22];
  uint64_t v127 = v0[20];
  v162 = &type metadata for BackgroundWorkerError;
  unint64_t v163 = sub_100009664();
  char v128 = 3;
LABEL_49:
  LOBYTE(v161[0]) = v128;
  id v129 = objc_allocWithZone((Class)sub_10000A1B0());
  uint64_t v130 = sub_10000A190();
LABEL_55:
  uint64_t v27 = v130;
  sub_100009608(v127);
  sub_100009608(v126);
  (*(void (**)(uint64_t, uint64_t))(v125 + 8))(v123, v124);
  (*(void (**)(uint64_t, uint64_t))(v121 + 8))(v120, v122);
LABEL_56:
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  v142 = (uint64_t (*)(uint64_t))v0[1];
  return v142(v27);
}

uint64_t sub_10000664C@<X0>(char *a1@<X8>)
{
  uint64_t v2 = sub_10000A140();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100003754(&qword_100010180);
  __chkstk_darwin(v6 - 8);
  os_log_type_t v8 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100010070 != -1) {
    swift_once();
  }
  uint64_t v9 = sub_10000A370();
  sub_100003634(v9, (uint64_t)qword_100010210);
  uint64_t v10 = sub_10000A350();
  os_log_type_t v11 = sub_10000A3E0();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, v11, "Looking for default plugin recipe file", v12, 2u);
    swift_slowDealloc();
  }

  id v13 = [self mainBundle];
  if (qword_1000100A0 != -1) {
    swift_once();
  }
  NSString v14 = sub_10000A380();
  NSString v15 = sub_10000A380();
  id v16 = [v13 URLForResource:v14 withExtension:v15];

  if (v16)
  {
    sub_10000A120();

    BOOL v17 = *(void (**)(char *, char *, uint64_t))(v3 + 32);
    v17(v8, v5, v2);
    id v18 = *(void (**)(char *, void, uint64_t, uint64_t))(v3 + 56);
    v18(v8, 0, 1, v2);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v3 + 48))(v8, 1, v2) != 1)
    {
      v17(a1, v8, v2);
      return ((uint64_t (*)(char *, void, uint64_t, uint64_t))v18)(a1, 0, 1, v2);
    }
  }
  else
  {
    id v18 = *(void (**)(char *, void, uint64_t, uint64_t))(v3 + 56);
    v18(v8, 1, 1, v2);
  }
  sub_1000096D8((uint64_t)v8, &qword_100010180);
  uint64_t v20 = sub_10000A350();
  os_log_type_t v21 = sub_10000A400();
  if (os_log_type_enabled(v20, v21))
  {
    uint64_t v22 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v22 = 0;
    _os_log_impl((void *)&_mh_execute_header, v20, v21, "Default plugin recipe file not found", v22, 2u);
    swift_slowDealloc();
  }

  return ((uint64_t (*)(char *, uint64_t, uint64_t, uint64_t))v18)(a1, 1, 1, v2);
}

uint64_t sub_100006A28(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000A250();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v16[-1] - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_10000A320();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  os_log_type_t v11 = (char *)&v16[-1] - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  uint64_t v12 = sub_10000A340();
  v16[3] = v12;
  v16[4] = (uint64_t)&protocol witness table for IsTaskCancelledExecutionManager;
  id v13 = sub_10000956C(v16);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v12 - 8) + 16))(v13, a2, v12);
  sub_10000A310();
  sub_10000A300();
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

uint64_t sub_100006C08(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v31 = a2;
  uint64_t v32 = a3;
  uint64_t v4 = sub_100003754(&qword_100010190);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100003754(&qword_100010198);
  __chkstk_darwin(v7 - 8);
  uint64_t v35 = (uint64_t)&v30 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_10000A2B0();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v30 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_10000A250();
  uint64_t v14 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  id v16 = (char *)&v30 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_10000A2F0();
  uint64_t v33 = *(void *)(v17 - 8);
  uint64_t v34 = v17;
  __chkstk_darwin(v17);
  uint64_t v19 = (char *)&v30 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v16, a1, v13);
  uint64_t v20 = sub_10000A340();
  v36[3] = v20;
  v36[4] = (uint64_t)&protocol witness table for IsTaskCancelledExecutionManager;
  os_log_type_t v21 = sub_10000956C(v36);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v20 - 8) + 16))(v21, v31, v20);
  sub_10000A3A0();
  uint64_t v22 = v32;
  sub_10000A2D0();
  if (!v22) {
    goto LABEL_7;
  }
  if (qword_100010078 == -1)
  {
    if (!*(void *)(v22 + 16)) {
      goto LABEL_7;
    }
  }
  else
  {
    swift_once();
    if (!*(void *)(v22 + 16)) {
      goto LABEL_7;
    }
  }
  uint64_t v23 = qword_100010230;
  uint64_t v24 = qword_100010228;
  swift_bridgeObjectRetain();
  unint64_t v25 = sub_100007FCC(v24, v23);
  if (v26)
  {
    uint64_t v27 = *(void *)(*(void *)(v22 + 56) + 8 * v25);
    swift_unknownObjectRetain();
    swift_bridgeObjectRelease();
    v36[0] = 0;
    v36[1] = 0xE000000000000000;
    v36[6] = v27;
    sub_10000A490();
    swift_unknownObjectRelease();
    goto LABEL_10;
  }
  swift_bridgeObjectRelease();
LABEL_7:
  if (qword_100010080 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
LABEL_10:
  sub_10000A2A0();
  uint64_t v28 = v35;
  sub_100004C88(v35);
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v6, v12, v9);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v6, 0, 1, v9);
  sub_10000A2E0();
  swift_bridgeObjectRelease();
  sub_1000096D8((uint64_t)v6, &qword_100010190);
  sub_1000096D8(v28, &qword_100010198);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  return (*(uint64_t (**)(char *, uint64_t))(v33 + 8))(v19, v34);
}

uint64_t sub_1000070C4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000A250();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v16[-1] - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_10000A2F0();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v16[-1] - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  uint64_t v12 = sub_10000A340();
  v16[3] = v12;
  v16[4] = (uint64_t)&protocol witness table for IsTaskCancelledExecutionManager;
  uint64_t v13 = sub_10000956C(v16);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v12 - 8) + 16))(v13, a2, v12);
  sub_10000A3A0();
  sub_10000A2D0();
  sub_10000A2C0();
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

uint64_t sub_1000072B8(uint64_t a1)
{
  uint64_t v5 = (uint64_t (*)(uint64_t))((char *)&dword_1000101C0 + dword_1000101C0);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  void *v3 = v1;
  v3[1] = sub_10000A0FC;
  return v5(a1);
}

uint64_t sub_100007360(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  void *v3 = v1;
  v3[1] = sub_1000073F4;
  return sub_100005028(a1);
}

uint64_t sub_1000073F4(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

uint64_t sub_1000074F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v15 = (void *)swift_task_alloc();
  *(void *)(v7 + 16) = v15;
  *uint64_t v15 = v7;
  v15[1] = sub_1000075D4;
  return MLHostExtension.loadConfig<A>(context:)(a1, a2, a6, a3, a7, a4, a5);
}

uint64_t sub_1000075D4()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_1000076C8(uint64_t a1)
{
  unint64_t v2 = sub_100007920();

  return MLHostExtension.configuration.getter(a1, v2);
}

void sub_100007718()
{
  qword_100010268 = 0x657069636572;
  *(void *)algn_100010270 = 0xE600000000000000;
}

BOOL sub_100007738(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

Swift::Int sub_100007750()
{
  Swift::UInt v1 = *v0;
  sub_10000A540();
  sub_10000A550(v1);
  return sub_10000A560();
}

void sub_100007798()
{
  sub_10000A550(*v0);
}

Swift::Int sub_1000077C4()
{
  Swift::UInt v1 = *v0;
  sub_10000A540();
  sub_10000A550(v1);
  return sub_10000A560();
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

unint64_t sub_100007864()
{
  unint64_t result = qword_100010150[0];
  if (!qword_100010150[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_100010150);
  }
  return result;
}

ValueMetadata *type metadata accessor for ShareSheetBackgroundWorker()
{
  return &type metadata for ShareSheetBackgroundWorker;
}

uint64_t sub_1000078CC()
{
  return *(void *)(swift_getOpaqueTypeConformance2() + 8);
}

unint64_t sub_100007920()
{
  unint64_t result = qword_100010170;
  if (!qword_100010170)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_100010170);
  }
  return result;
}

uint64_t sub_100007974(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_100007A48(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_100009734((uint64_t)v12, *a3);
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
      sub_100009734((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_1000039A8((uint64_t)v12);
  return v7;
}

uint64_t sub_100007A48(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_10000A450();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_100007C04(a5, a6);
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
  uint64_t v8 = sub_10000A480();
  if (!v8)
  {
    sub_10000A4A0();
    __break(1u);
LABEL_17:
    uint64_t result = sub_10000A4B0();
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

uint64_t sub_100007C04(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_100007C9C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_100007E7C(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_100007E7C(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_100007C9C(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_100007E14(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_10000A470();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_10000A4A0();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_10000A3C0();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_10000A4B0();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_10000A4A0();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_100007E14(uint64_t a1, uint64_t a2)
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
  sub_100003754(&qword_1000101A0);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_100007E7C(char a1, int64_t a2, char a3, char *a4)
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
    sub_100003754(&qword_1000101A0);
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
  uint64_t result = sub_10000A4B0();
  __break(1u);
  return result;
}

unint64_t sub_100007FCC(uint64_t a1, uint64_t a2)
{
  sub_10000A540();
  sub_10000A3B0();
  Swift::Int v4 = sub_10000A560();

  return sub_100008044(a1, a2, v4);
}

unint64_t sub_100008044(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_10000A4E0() & 1) == 0)
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
      while (!v14 && (sub_10000A4E0() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_100008128(uint64_t a1, void *a2)
{
  v6._countAndFlagsBits = a1;
  v3._rawValue = &off_10000C700;
  v6._object = a2;
  unint64_t v4 = sub_10000A4C0(v3, v6);
  swift_bridgeObjectRelease();
  if (v4 >= 6) {
    return 6;
  }
  else {
    return v4;
  }
}

id sub_100008174()
{
  uint64_t v0 = (void *)sub_10000A110();
  uint64_t v47 = *(v0 - 1);
  __chkstk_darwin(v0);
  uint64_t v45 = (char *)&v41 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = sub_100003754(&qword_100010180);
  __chkstk_darwin(v2 - 8);
  uint64_t v43 = (char *)&v41 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v48 = sub_10000A140();
  uint64_t v46 = *(void *)(v48 - 8);
  __chkstk_darwin(v48);
  uint64_t v44 = (char *)&v41 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v5 = [self clientWithIdentifier:210];
  NSString v6 = sub_10000A380();
  id v7 = [v5 experimentIdentifiersWithNamespaceName:v6];

  if (qword_100010070 != -1) {
    swift_once();
  }
  uint64_t v8 = sub_10000A370();
  uint64_t v9 = sub_100003634(v8, (uint64_t)qword_100010210);
  id v10 = v7;
  uint64_t v49 = v9;
  BOOL v11 = sub_10000A350();
  os_log_type_t v12 = sub_10000A3E0();
  if (os_log_type_enabled(v11, v12))
  {
    v41 = v0;
    id v42 = v5;
    uint64_t v13 = (uint8_t *)swift_slowAlloc();
    BOOL v14 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v13 = 138412290;
    if (v10)
    {
      v51[0] = v10;
      id v15 = v10;
      sub_10000A440();
    }
    else
    {
      v51[0] = 0;
      sub_10000A440();
      id v7 = 0;
    }
    *BOOL v14 = v7;

    _os_log_impl((void *)&_mh_execute_header, v11, v12, "TrialRecipe: Trial identifiers: %@", v13, 0xCu);
    sub_100003754(&qword_1000100B0);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    uint64_t v0 = v41;
    id v5 = v42;
  }
  else
  {
  }
  if (qword_1000100A0 != -1) {
    swift_once();
  }
  NSString v16 = sub_10000A380();
  NSString v17 = sub_10000A380();
  id v18 = [v5 levelForFactor:v16 withNamespaceName:v17];

  if (!v18)
  {

    goto LABEL_26;
  }
  id result = [v18 fileValue];
  if (!result)
  {
    __break(1u);
    return result;
  }
  uint64_t v20 = result;
  id v21 = [result path];

  if (!v21)
  {
    uint64_t v30 = sub_10000A350();
    os_log_type_t v31 = sub_10000A400();
    if (os_log_type_enabled(v30, v31))
    {
      uint64_t v32 = (uint8_t *)swift_slowAlloc();
      v51[0] = (id)swift_slowAlloc();
      *(_DWORD *)uint64_t v32 = 136315138;
      uint64_t v50 = sub_100007974(0xD00000000000001FLL, 0x800000010000AF80, (uint64_t *)v51);
      sub_10000A440();
      _os_log_impl((void *)&_mh_execute_header, v30, v31, "TrialRecipe: Config recipe path not found in %s namespace", v32, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      return 0;
    }

LABEL_26:
    return 0;
  }
  v41 = v10;
  sub_10000A390();

  uint64_t v22 = v46;
  uint64_t v23 = v48;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v46 + 56))(v43, 1, 1, v48);
  (*(void (**)(char *, void, void *))(v47 + 104))(v45, enum case for URL.DirectoryHint.inferFromPath(_:), v0);
  uint64_t v24 = v44;
  sub_10000A130();
  uint64_t v33 = sub_10000A150();
  unint64_t v35 = v34;
  (*(void (**)(char *, uint64_t))(v22 + 8))(v24, v23);
  uint64_t v36 = self;
  Class isa = sub_10000A160().super.isa;
  v51[0] = 0;
  id v38 = [v36 JSONObjectWithData:isa options:0 error:v51];

  if (!v38)
  {
    id v40 = v51[0];
    sub_10000A100();

    swift_willThrow();
    sub_100009850(v33, v35);
    swift_errorRetain();
    swift_errorRetain();
    unint64_t v25 = sub_10000A350();
    os_log_type_t v26 = sub_10000A400();
    if (os_log_type_enabled(v25, v26))
    {
      uint64_t v27 = (uint8_t *)swift_slowAlloc();
      uint64_t v28 = (void *)swift_slowAlloc();
      id v42 = v5;
      *(_DWORD *)uint64_t v27 = 138412290;
      swift_errorRetain();
      v29 = (void *)_swift_stdlib_bridgeErrorToNSError();
      v51[0] = v29;
      sub_10000A440();
      *uint64_t v28 = v29;
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v25, v26, "TrialRecipe: Failed to retrieve the recipe. Error: %@.", v27, 0xCu);
      sub_100003754(&qword_1000100B0);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      swift_errorRelease();
    }
    else
    {

      swift_errorRelease();
      swift_errorRelease();
      swift_errorRelease();
    }
    return 0;
  }
  id v39 = v51[0];
  sub_10000A460();

  sub_100009850(v33, v35);
  swift_unknownObjectRelease();
  sub_100003754(&qword_1000101B0);
  if (swift_dynamicCast()) {
    return (id)v50;
  }
  else {
    return 0;
  }
}

uint64_t sub_100008A48(uint64_t a1)
{
  *(void *)(v1 + 24) = a1;
  return _swift_task_switch(sub_100008A68, 0, 0);
}

uint64_t sub_100008A68()
{
  uint64_t v40 = v0;
  uint64_t v1 = (void **)(v0 + 24);
  if (sub_10000A1F0() == 0xD00000000000005ELL && v2 == 0x800000010000AEA0)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    char v3 = sub_10000A4E0();
    swift_bridgeObjectRelease();
    if ((v3 & 1) == 0)
    {
LABEL_28:
      objc_allocWithZone((Class)sub_10000A1B0());
      goto LABEL_29;
    }
  }
  if (qword_100010098 != -1) {
    swift_once();
  }
  if (qword_100010260)
  {
    id v4 = (id)qword_100010260;
    NSString v5 = sub_10000A380();
    unsigned int v6 = [v4 BOOLForKey:v5];

    if (v6)
    {
      objc_allocWithZone((Class)sub_10000A1B0());
LABEL_29:
      uint64_t v36 = sub_10000A1A0();
      goto LABEL_30;
    }
  }
  id v7 = (uint64_t *)(v0 + 16);
  if (qword_100010088 != -1) {
    swift_once();
  }
  if (qword_100010248)
  {
    uint64_t v8 = qword_100010090;
    id v9 = (id)qword_100010248;
    if (v8 != -1) {
      swift_once();
    }
    NSString v10 = sub_10000A380();
    unsigned int v11 = [v9 BOOLForKey:v10];

    if (v11)
    {
      if (qword_100010070 != -1) {
        swift_once();
      }
      os_log_type_t v12 = *v1;
      uint64_t v13 = sub_10000A370();
      sub_100003634(v13, (uint64_t)qword_100010210);
      id v14 = v12;
      id v15 = sub_10000A350();
      os_log_type_t v16 = sub_10000A3E0();
      BOOL v17 = os_log_type_enabled(v15, v16);
      id v18 = *v1;
      if (v17)
      {
        uint64_t v19 = swift_slowAlloc();
        v39[0] = swift_slowAlloc();
        *(_DWORD *)uint64_t v19 = 136315394;
        uint64_t v20 = sub_10000A1E0();
        *id v7 = sub_100007974(v20, v21, v39);
        sub_10000A440();
        swift_bridgeObjectRelease();

        *(_WORD *)(v19 + 12) = 2080;
        uint64_t v22 = sub_10000A1F0();
        *id v7 = sub_100007974(v22, v23, v39);
        sub_10000A440();
        swift_bridgeObjectRelease();

        _os_log_impl((void *)&_mh_execute_header, v15, v16, "Migration task: TaskId: %s, TaskName: %s PurpleBuddy is complete", (uint8_t *)v19, 0x16u);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {
      }
      goto LABEL_28;
    }
  }
  if (qword_100010070 != -1) {
    swift_once();
  }
  uint64_t v24 = *v1;
  uint64_t v25 = sub_10000A370();
  sub_100003634(v25, (uint64_t)qword_100010210);
  id v26 = v24;
  uint64_t v27 = sub_10000A350();
  os_log_type_t v28 = sub_10000A3E0();
  BOOL v29 = os_log_type_enabled(v27, v28);
  uint64_t v30 = *v1;
  if (v29)
  {
    uint64_t v31 = swift_slowAlloc();
    v39[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v31 = 136315394;
    uint64_t v32 = sub_10000A1E0();
    *id v7 = sub_100007974(v32, v33, v39);
    sub_10000A440();
    swift_bridgeObjectRelease();

    *(_WORD *)(v31 + 12) = 2080;
    uint64_t v34 = sub_10000A1F0();
    *id v7 = sub_100007974(v34, v35, v39);
    sub_10000A440();
    swift_bridgeObjectRelease();

    _os_log_impl((void *)&_mh_execute_header, v27, v28, "Rescheduling TaskId: %s, TaskName: %s since PurpleBuddy is not complete", (uint8_t *)v31, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  v39[3] = (uint64_t)&type metadata for MigrationWorkerError;
  v39[4] = sub_100009964();
  objc_allocWithZone((Class)sub_10000A1B0());
  uint64_t v36 = sub_10000A190();
LABEL_30:
  uint64_t v37 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v37(v36);
}

void *sub_100009034(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_100003754(&qword_100010180);
  __chkstk_darwin(v4 - 8);
  unsigned int v6 = (char *)v36 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_10000A140();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = __chkstk_darwin(v7);
  unsigned int v11 = (char *)v36 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v13 = (char *)v36 - v12;
  sub_100009794((uint64_t)a1, (uint64_t)v6);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
  {
    sub_1000096D8((uint64_t)v6, &qword_100010180);
    sub_1000097FC();
    swift_allocError();
    *id v14 = 0;
    swift_willThrow();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v13, v6, v7);
    if (qword_100010070 != -1) {
      swift_once();
    }
    uint64_t v15 = sub_10000A370();
    sub_100003634(v15, (uint64_t)qword_100010210);
    (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v11, v13, v7);
    os_log_type_t v16 = sub_10000A350();
    os_log_type_t v17 = sub_10000A3E0();
    if (os_log_type_enabled(v16, v17))
    {
      uint64_t v18 = swift_slowAlloc();
      uint64_t v37 = v1;
      uint64_t v19 = (uint8_t *)v18;
      a1 = (void *)swift_slowAlloc();
      v40[0] = a1;
      id v38 = (void (*)(char *, uint64_t))v8;
      *(_DWORD *)uint64_t v19 = 136315138;
      v36[1] = v19 + 4;
      sub_1000098A8();
      uint64_t v20 = sub_10000A4D0();
      uint64_t v39 = sub_100007974(v20, v21, (uint64_t *)v40);
      uint64_t v22 = v38;
      sub_10000A440();
      swift_bridgeObjectRelease();
      unint64_t v23 = (void (*)(char *, uint64_t))*((void *)v22 + 1);
      v23(v11, v7);
      os_log_type_t v24 = v17;
      uint64_t v25 = v23;
      _os_log_impl((void *)&_mh_execute_header, v16, v24, "Attempting to read plugin recipe: %s", v19, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      uint64_t v2 = v37;
      swift_slowDealloc();
    }
    else
    {
      uint64_t v25 = *(void (**)(char *, uint64_t))(v8 + 8);
      v25(v11, v7);
    }

    uint64_t v26 = sub_10000A150();
    if (!v2)
    {
      uint64_t v28 = v26;
      a1 = v27;
      id v38 = v25;
      BOOL v29 = self;
      Class isa = sub_10000A160().super.isa;
      v40[0] = 0;
      id v31 = [v29 JSONObjectWithData:isa options:0 error:v40];

      if (v31)
      {
        id v32 = v40[0];
        sub_10000A460();
        swift_unknownObjectRelease();
        sub_100003754(&qword_1000101B0);
        if (swift_dynamicCast())
        {
          sub_100009850(v28, (unint64_t)a1);
          a1 = (void *)v39;
          v38(v13, v7);
          return a1;
        }
        sub_1000097FC();
        swift_allocError();
        *uint64_t v34 = 1;
      }
      else
      {
        id v33 = v40[0];
        sub_10000A100();
      }
      swift_willThrow();
      sub_100009850(v28, (unint64_t)a1);
      v38(v13, v7);
      return a1;
    }
    v25(v13, v7);
  }
  return a1;
}

uint64_t *sub_10000956C(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t sub_1000095D0()
{
  return sub_100006A28(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_1000095EC()
{
  return sub_1000070C4(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_100009608(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for PluginSubtask();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_100009664()
{
  unint64_t result = qword_100010188;
  if (!qword_100010188)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010188);
  }
  return result;
}

uint64_t sub_1000096B8()
{
  return sub_100006C08(v0[2], v0[3], v0[4]);
}

uint64_t sub_1000096D8(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100003754(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_100009734(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_100009794(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100003754(&qword_100010180);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_1000097FC()
{
  unint64_t result = qword_1000101A8;
  if (!qword_1000101A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000101A8);
  }
  return result;
}

uint64_t sub_100009850(uint64_t a1, unint64_t a2)
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

unint64_t sub_1000098A8()
{
  unint64_t result = qword_1000101B8;
  if (!qword_1000101B8)
  {
    sub_10000A140();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000101B8);
  }
  return result;
}

uint64_t *sub_100009900(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

unint64_t sub_100009964()
{
  unint64_t result = qword_1000101C8;
  if (!qword_1000101C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000101C8);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for MigrationWorkerError(unsigned int *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if ((a2 + 1) >= 0x10000) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) < 0x100) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4) {
    return *a1;
  }
  if (v3 == 2) {
    return *(unsigned __int16 *)a1;
  }
  return *(unsigned __int8 *)a1;
}

unsigned char *storeEnumTagSinglePayload for MigrationWorkerError(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x100009AACLL);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_100009AD4()
{
  return 0;
}

ValueMetadata *type metadata accessor for MigrationWorkerError()
{
  return &type metadata for MigrationWorkerError;
}

unsigned char *initializeBufferWithCopyOfBuffer for RecipeError(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for RecipeError(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for RecipeError(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x100009C54);
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

uint64_t sub_100009C7C(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_100009C84(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for RecipeError()
{
  return &type metadata for RecipeError;
}

uint64_t getEnumTagSinglePayload for BackgroundWorkerError(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for BackgroundWorkerError(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x100009DFCLL);
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

unsigned char *sub_100009E24(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for BackgroundWorkerError()
{
  return &type metadata for BackgroundWorkerError;
}

unint64_t sub_100009E40()
{
  unint64_t result = qword_1000101D0;
  if (!qword_1000101D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000101D0);
  }
  return result;
}

unint64_t sub_100009E98()
{
  unint64_t result = qword_1000101D8;
  if (!qword_1000101D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000101D8);
  }
  return result;
}

unint64_t sub_100009EF0()
{
  unint64_t result = qword_1000101E0;
  if (!qword_1000101E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000101E0);
  }
  return result;
}

unint64_t sub_100009F48()
{
  unint64_t result = qword_1000101E8;
  if (!qword_1000101E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000101E8);
  }
  return result;
}

unint64_t sub_100009FA0()
{
  unint64_t result = qword_1000101F0;
  if (!qword_1000101F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000101F0);
  }
  return result;
}

unint64_t sub_100009FF8()
{
  unint64_t result = qword_1000101F8;
  if (!qword_1000101F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000101F8);
  }
  return result;
}

unint64_t sub_10000A050()
{
  unint64_t result = qword_100010200;
  if (!qword_100010200)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010200);
  }
  return result;
}

unint64_t sub_10000A0A8()
{
  unint64_t result = qword_100010208;
  if (!qword_100010208)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010208);
  }
  return result;
}

uint64_t sub_10000A100()
{
  return _convertNSErrorToError(_:)();
}

uint64_t sub_10000A110()
{
  return type metadata accessor for URL.DirectoryHint();
}

uint64_t sub_10000A120()
{
  return static URL._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10000A130()
{
  return URL.init(filePath:directoryHint:relativeTo:)();
}

uint64_t sub_10000A140()
{
  return type metadata accessor for URL();
}

uint64_t sub_10000A150()
{
  return Data.init(contentsOf:options:)();
}

NSData sub_10000A160()
{
  return Data._bridgeToObjectiveC()();
}

uint64_t sub_10000A170()
{
  return static PeopleSuggesterMetricsCollector.sendMetrics()();
}

uint64_t sub_10000A180()
{
  return static AppExtension.main()();
}

uint64_t sub_10000A190()
{
  return MLHostResult.init(error:policy:)();
}

uint64_t sub_10000A1A0()
{
  return MLHostResult.init(status:policy:)();
}

uint64_t sub_10000A1B0()
{
  return type metadata accessor for MLHostResult();
}

uint64_t sub_10000A1E0()
{
  return MLHostExtensionContext.taskId.getter();
}

uint64_t sub_10000A1F0()
{
  return MLHostExtensionContext.taskName.getter();
}

uint64_t sub_10000A200()
{
  return type metadata accessor for SubtaskName();
}

uint64_t sub_10000A210()
{
  return userDefaults.getter();
}

uint64_t sub_10000A220()
{
  return ConfigManager.shouldHarvestData.getter();
}

uint64_t sub_10000A230()
{
  return ConfigManager.shouldSendMetrics.getter();
}

uint64_t sub_10000A240()
{
  return ConfigManager.init(recipe:)();
}

uint64_t sub_10000A250()
{
  return type metadata accessor for ConfigManager();
}

uint64_t sub_10000A260()
{
  return TrialIdentifier.init(task:treatment:deployment:)();
}

uint64_t sub_10000A270()
{
  return type metadata accessor for TrialIdentifier();
}

uint64_t sub_10000A280()
{
  return type metadata accessor for ComputationState();
}

uint64_t sub_10000A290()
{
  return dispatch thunk of ExecutionManager.shouldStop.getter();
}

uint64_t sub_10000A2A0()
{
  return FeaturizationConfig.init(identifier:)();
}

uint64_t sub_10000A2B0()
{
  return type metadata accessor for FeaturizationConfig();
}

void sub_10000A2C0()
{
}

uint64_t sub_10000A2D0()
{
  return DataHarvestingManager.init(config:executionManager:readerName:)();
}

uint64_t sub_10000A2E0()
{
  return DataHarvestingManager.harvest(appendingTrialIdentifier:appendingFeaturizationConfig:inTests:)();
}

uint64_t sub_10000A2F0()
{
  return type metadata accessor for DataHarvestingManager();
}

void sub_10000A300()
{
}

uint64_t sub_10000A310()
{
  return DurableFeatureManager.init(config:executionManager:)();
}

uint64_t sub_10000A320()
{
  return type metadata accessor for DurableFeatureManager();
}

uint64_t sub_10000A330()
{
  return IsTaskCancelledExecutionManager.init()();
}

uint64_t sub_10000A340()
{
  return type metadata accessor for IsTaskCancelledExecutionManager();
}

uint64_t sub_10000A350()
{
  return Logger.logObject.getter();
}

uint64_t sub_10000A360()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_10000A370()
{
  return type metadata accessor for Logger();
}

NSString sub_10000A380()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_10000A390()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10000A3A0()
{
  return String.init<A>(describing:)();
}

uint64_t sub_10000A3B0()
{
  return String.hash(into:)();
}

Swift::Int sub_10000A3C0()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_10000A3D0()
{
  return static Task<>.isCancelled.getter();
}

uint64_t sub_10000A3E0()
{
  return static os_log_type_t.info.getter();
}

uint64_t sub_10000A3F0()
{
  return static os_log_type_t.debug.getter();
}

uint64_t sub_10000A400()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_10000A410()
{
  return static os_log_type_t.fault.getter();
}

uint64_t sub_10000A420()
{
  return NSUserDefaults.shouldCompute(_:)();
}

uint64_t sub_10000A430()
{
  return NSUserDefaults.saveComputationDate(_:)();
}

uint64_t sub_10000A440()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_10000A450()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_10000A460()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t sub_10000A470()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_10000A480()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_10000A490()
{
  return _print_unlocked<A, B>(_:_:)();
}

uint64_t sub_10000A4A0()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_10000A4B0()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

Swift::Int sub_10000A4C0(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases, string);
}

uint64_t sub_10000A4D0()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t sub_10000A4E0()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_10000A4F0()
{
  return Error.localizedDescription.getter();
}

uint64_t sub_10000A500()
{
  return Error._getEmbeddedNSError()();
}

uint64_t sub_10000A510()
{
  return Error._code.getter();
}

uint64_t sub_10000A520()
{
  return Error._domain.getter();
}

uint64_t sub_10000A530()
{
  return Error._userInfo.getter();
}

uint64_t sub_10000A540()
{
  return Hasher.init(_seed:)();
}

void sub_10000A550(Swift::UInt a1)
{
}

Swift::Int sub_10000A560()
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

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return __swift_stdlib_bridgeErrorToNSError();
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

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}