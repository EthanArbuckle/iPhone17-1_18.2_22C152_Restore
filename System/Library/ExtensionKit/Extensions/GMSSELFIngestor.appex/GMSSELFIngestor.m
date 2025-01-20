uint64_t sub_100002508(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;

  v2[14] = a1;
  v2[15] = v1;
  v3 = sub_1000115F0();
  v2[16] = v3;
  v4 = *(void *)(v3 - 8);
  v2[17] = v4;
  v2[18] = *(void *)(v4 + 64);
  v2[19] = swift_task_alloc();
  sub_100008CD0(&qword_1000186C0);
  v2[20] = swift_task_alloc();
  v2[21] = swift_task_alloc();
  v5 = sub_100011580();
  v2[22] = v5;
  v2[23] = *(void *)(v5 - 8);
  v2[24] = swift_task_alloc();
  v2[25] = swift_task_alloc();
  v2[26] = swift_task_alloc();
  return _swift_task_switch(sub_100002688, 0, 0);
}

uint64_t sub_100002688()
{
  v34 = v0 + 9;
  if (qword_100018500 != -1) {
    swift_once();
  }
  uint64_t v1 = v0[26];
  uint64_t v3 = v0[22];
  uint64_t v2 = v0[23];
  uint64_t v4 = v0[21];
  uint64_t v31 = v0[25];
  uint64_t v33 = v0[20];
  uint64_t v5 = sub_1000116F0();
  uint64_t v7 = v6;
  type metadata accessor for BiomeBookmarkProvider();
  inited = (void *)swift_initStackObject();
  id v9 = objc_allocWithZone((Class)NSUserDefaults);
  NSString v10 = sub_100011990();
  id v11 = [v9 initWithSuiteName:v10];

  inited[2] = v11;
  inited[3] = v5;
  inited[4] = v7;
  swift_bridgeObjectRetain();
  v36._object = (void *)0x8000000100012470;
  v36._countAndFlagsBits = 0xD000000000000015;
  sub_1000119C0(v36);
  inited[5] = v5;
  inited[6] = v7;
  sub_100009FB0(v1);
  sub_100011570();
  sub_10000946C();
  v12 = *(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16);
  v12(v4, v1, v3);
  v13 = *(void (**)(uint64_t, void, uint64_t, uint64_t))(v2 + 56);
  v13(v4, 0, 1, v3);
  v28 = v12;
  v12(v33, v31, v3);
  v13(v33, 0, 1, v3);
  id v14 = sub_100002B6C(v4, v33, 0, 0, 0);
  sub_100011700();
  sub_1000094AC(&qword_1000186D0, 255, (void (*)(uint64_t))&type metadata accessor for Library.Streams.GenerativeModels.GenerativeFunctions.Instrumentation);
  v30 = v14;
  sub_100011710();
  uint64_t v15 = v0[25];
  uint64_t v29 = v0[26];
  uint64_t v16 = v0[23];
  uint64_t v17 = v0[22];
  uint64_t v32 = v0[24];
  uint64_t v18 = v0[19];
  uint64_t v19 = v0[16];
  uint64_t v20 = v0[17];
  uint64_t v21 = v0[14];
  uint64_t v22 = v0[15];
  sub_1000094F4(v34, v0[12]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v20 + 16))(v18, v21, v19);
  unint64_t v23 = (*(unsigned __int8 *)(v20 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v20 + 80);
  uint64_t v24 = swift_allocObject();
  *(void *)(v24 + 16) = v22;
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v20 + 32))(v24 + v23, v18, v19);
  swift_retain();
  sub_100011950();
  swift_release();
  swift_release();
  v28(v32, v15, v17);
  sub_10000A584(v32);
  swift_release();

  v25 = *(void (**)(uint64_t, uint64_t))(v16 + 8);
  v25(v15, v17);
  v25(v29, v17);
  sub_100009670((uint64_t)v34);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  v26 = (uint64_t (*)(void))v0[1];
  return v26();
}

id sub_100002B6C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t v9 = sub_100011580();
  uint64_t v10 = *(void *)(v9 - 8);
  id v11 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v10 + 48);
  Class isa = 0;
  if (v11(a1, 1, v9) != 1)
  {
    Class isa = sub_100011550().super.isa;
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(a1, v9);
  }
  if (v11(a2, 1, v9) == 1)
  {
    Class v13 = 0;
  }
  else
  {
    Class v13 = sub_100011550().super.isa;
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(a2, v9);
  }
  id v14 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) initWithStartDate:isa endDate:v13 maxEvents:a3 lastN:a4 reversed:a5 & 1];

  return v14;
}

void sub_100002CEC(void *a1)
{
  if (*a1)
  {
    swift_errorRetain();
    if (qword_100018510 != -1) {
      swift_once();
    }
    uint64_t v1 = sub_100011940();
    sub_100008E8C(v1, (uint64_t)qword_100018BA8);
    swift_errorRetain();
    swift_errorRetain();
    oslog = sub_100011920();
    os_log_type_t v2 = sub_100011A10();
    if (os_log_type_enabled(oslog, v2))
    {
      uint64_t v3 = (uint8_t *)swift_slowAlloc();
      uint64_t v4 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v3 = 138412290;
      swift_errorRetain();
      uint64_t v9 = _swift_stdlib_bridgeErrorToNSError();
      sub_100011A30();
      *uint64_t v4 = v9;
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, oslog, v2, "Polling biome stream has failed: %@", v3, 0xCu);
      sub_100008CD0(&qword_1000186A0);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      swift_errorRelease();
      return;
    }
    swift_errorRelease();
    swift_errorRelease();
    swift_errorRelease();
  }
  else
  {
    if (qword_100018510 != -1) {
      swift_once();
    }
    uint64_t v5 = sub_100011940();
    sub_100008E8C(v5, (uint64_t)qword_100018BA8);
    oslog = sub_100011920();
    os_log_type_t v6 = sub_1000119F0();
    if (os_log_type_enabled(oslog, v6))
    {
      uint64_t v7 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, oslog, v6, "Polling biome stream has finished", v7, 2u);
      swift_slowDealloc();
    }
  }
}

BOOL sub_100002F98(uint64_t a1, void *a2)
{
  uint64_t v3 = v2;
  if (qword_100018518 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_100011940();
  sub_100008E8C(v6, (uint64_t)qword_100018BC0);
  swift_bridgeObjectRetain_n();
  uint64_t v7 = sub_100011920();
  os_log_type_t v8 = sub_100011A00();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    uint64_t v13 = swift_slowAlloc();
    *(_DWORD *)uint64_t v9 = 136315138;
    if (a2) {
      uint64_t v10 = a1;
    }
    else {
      uint64_t v10 = 0x7974706D65;
    }
    if (a2) {
      unint64_t v11 = (unint64_t)a2;
    }
    else {
      unint64_t v11 = 0xE500000000000000;
    }
    swift_bridgeObjectRetain();
    sub_10000F408(v10, v11, &v13);
    sub_100011A30();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "check  useCaseString%s", v9, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  BOOL result = 0;
  if (*(unsigned char *)(v3 + 16) == 1)
  {
    if (a2)
    {
      swift_bridgeObjectRetain();
      return sub_10000FEF8(a1, a2) != 5;
    }
  }
  return result;
}

uint64_t sub_1000031AC(uint64_t a1, uint64_t a2)
{
  uint64_t v372 = a2;
  uint64_t v3 = sub_100008CD0(&qword_100018658);
  __chkstk_darwin(v3 - 8);
  v371 = (char *)&v349 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100008CD0(&qword_100018660);
  uint64_t v6 = __chkstk_darwin(v5 - 8);
  v365 = (void **)((char *)&v349 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v8 = __chkstk_darwin(v6);
  v363 = (void **)((char *)&v349 - v9);
  __chkstk_darwin(v8);
  v368 = (void **)((char *)&v349 - v10);
  uint64_t v370 = sub_100011620();
  uint64_t v369 = *(void *)(v370 - 8);
  uint64_t v11 = __chkstk_darwin(v370);
  v360 = (char *)&v349 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __chkstk_darwin(v11);
  v359 = (char *)&v349 - v14;
  __chkstk_darwin(v13);
  v361 = (char *)&v349 - v15;
  uint64_t v411 = sub_1000118A0();
  uint64_t v407 = *(void *)(v411 - 8);
  uint64_t v16 = __chkstk_darwin(v411);
  v387 = (char *)&v349 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v16);
  v375 = (char *)&v349 - v18;
  uint64_t v19 = sub_100008CD0(&qword_100018668);
  __chkstk_darwin(v19 - 8);
  v403 = (char *)&v349 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v412 = sub_100011850();
  uint64_t v409 = *(void *)(v412 - 8);
  __chkstk_darwin(v412);
  v402 = (char *)&v349 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v408 = sub_100008CD0(&qword_100018670);
  uint64_t v22 = __chkstk_darwin(v408);
  v380 = (char *)&v349 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = __chkstk_darwin(v22);
  uint64_t v389 = (uint64_t)&v349 - v25;
  uint64_t v26 = __chkstk_darwin(v24);
  uint64_t v396 = (uint64_t)&v349 - v27;
  uint64_t v28 = __chkstk_darwin(v26);
  uint64_t v386 = (uint64_t)&v349 - v29;
  uint64_t v30 = __chkstk_darwin(v28);
  v391 = (char *)&v349 - v31;
  __chkstk_darwin(v30);
  v410 = (uint64_t *)((char *)&v349 - v32);
  uint64_t v33 = sub_100008CD0(&qword_100018678);
  uint64_t v34 = __chkstk_darwin(v33 - 8);
  v378 = (char *)&v349 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v36 = __chkstk_darwin(v34);
  uint64_t v384 = (uint64_t)&v349 - v37;
  uint64_t v38 = __chkstk_darwin(v36);
  v379 = (char *)&v349 - v39;
  uint64_t v40 = __chkstk_darwin(v38);
  uint64_t v366 = (uint64_t)&v349 - v41;
  uint64_t v42 = __chkstk_darwin(v40);
  uint64_t v382 = (uint64_t)&v349 - v43;
  uint64_t v44 = __chkstk_darwin(v42);
  uint64_t v383 = (uint64_t)&v349 - v45;
  uint64_t v46 = __chkstk_darwin(v44);
  uint64_t v367 = (uint64_t)&v349 - v47;
  uint64_t v48 = __chkstk_darwin(v46);
  uint64_t v385 = (uint64_t)&v349 - v49;
  uint64_t v50 = __chkstk_darwin(v48);
  uint64_t v388 = (uint64_t)&v349 - v51;
  uint64_t v52 = __chkstk_darwin(v50);
  uint64_t v377 = (uint64_t)&v349 - v53;
  uint64_t v54 = __chkstk_darwin(v52);
  uint64_t v398 = (uint64_t)&v349 - v55;
  uint64_t v56 = __chkstk_darwin(v54);
  uint64_t v399 = (uint64_t)&v349 - v57;
  uint64_t v58 = __chkstk_darwin(v56);
  uint64_t v376 = (uint64_t)&v349 - v59;
  uint64_t v60 = __chkstk_darwin(v58);
  uint64_t v397 = (uint64_t)&v349 - v61;
  uint64_t v62 = __chkstk_darwin(v60);
  uint64_t v392 = (uint64_t)&v349 - v63;
  uint64_t v64 = __chkstk_darwin(v62);
  v374 = (char *)&v349 - v65;
  uint64_t v66 = __chkstk_darwin(v64);
  uint64_t v401 = (uint64_t)&v349 - v67;
  uint64_t v68 = __chkstk_darwin(v66);
  v405 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&v349 - v69);
  __chkstk_darwin(v68);
  v71 = (char *)&v349 - v70;
  uint64_t v72 = sub_100008CD0(&qword_100018680);
  __chkstk_darwin(v72 - 8);
  v74 = (char *)&v349 - ((v73 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v75 = sub_1000117E0();
  uint64_t v76 = *(void *)(v75 - 8);
  uint64_t v77 = __chkstk_darwin(v75);
  v393 = (char *)&v349 - ((v78 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v77);
  v80 = (char *)&v349 - v79;
  uint64_t v81 = sub_1000115D0();
  uint64_t v82 = *(void *)(v81 - 8);
  uint64_t v83 = __chkstk_darwin(v81);
  v364 = (char *)&v349 - ((v84 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v85 = __chkstk_darwin(v83);
  v362 = (char *)&v349 - v86;
  uint64_t v87 = __chkstk_darwin(v85);
  uint64_t v381 = (uint64_t)&v349 - v88;
  uint64_t v89 = __chkstk_darwin(v87);
  v373 = (char *)&v349 - v90;
  __chkstk_darwin(v89);
  v92 = (char *)&v349 - v91;
  uint64_t v93 = a1;
  sub_1000117F0();
  sub_1000117D0();
  uint64_t v94 = v82;
  v95 = *(void (**)(char *, uint64_t))(v76 + 8);
  v96 = v80;
  uint64_t v97 = v81;
  uint64_t v395 = v75;
  uint64_t v394 = v76 + 8;
  v95(v96, v75);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v94 + 48))(v74, 1, v81) == 1) {
    return sub_100009410((uint64_t)v74, &qword_100018680);
  }
  v353 = v95;
  uint64_t v390 = v94;
  (*(void (**)(char *, char *, uint64_t))(v94 + 32))(v92, v74, v81);
  uint64_t v99 = v93;
  sub_100011860();
  uint64_t v100 = v409;
  v101 = *(void (**)(void))(v409 + 104);
  uint64_t v102 = (uint64_t)v405;
  unsigned int v351 = enum case for GenerativeFunctionsInstrumentationEvent.Subtype.start(_:);
  uint64_t v103 = v412;
  uint64_t v358 = v409 + 104;
  v357 = v101;
  v101(v405);
  v104 = *(void (**)(uint64_t, void, uint64_t, uint64_t))(v100 + 56);
  uint64_t v355 = v100 + 56;
  v354 = v104;
  v104(v102, 0, 1, v103);
  v105 = (void (*)(void, void, void))v410;
  uint64_t v106 = (uint64_t)v410 + *(int *)(v408 + 48);
  sub_100008DBC((uint64_t)v71, (uint64_t)v410);
  sub_100008DBC(v102, v106);
  v107 = *(unsigned int (**)(void, uint64_t, uint64_t))(v100 + 48);
  unsigned int v108 = v107(v105, 1, v103);
  uint64_t v413 = v99;
  uint64_t v400 = v97;
  v404 = v92;
  uint64_t v356 = v100 + 48;
  if (v108 == 1)
  {
    sub_100009410(v102, &qword_100018678);
    sub_100009410((uint64_t)v71, &qword_100018678);
    v109 = v107;
    unsigned int v110 = v107(v106, 1, v412);
    uint64_t v111 = (uint64_t)v404;
    v112 = (void (*)(void, void, void))v410;
    if (v110 == 1)
    {
      sub_100009410((uint64_t)v410, &qword_100018678);
      v113 = v353;
      goto LABEL_10;
    }
LABEL_8:
    sub_100009410((uint64_t)v112, &qword_100018670);
    v107 = v109;
    goto LABEL_22;
  }
  uint64_t v114 = v102;
  v112 = (void (*)(void, void, void))v410;
  uint64_t v115 = v401;
  sub_100008DBC((uint64_t)v410, v401);
  uint64_t v116 = v412;
  v109 = v107;
  unsigned int v117 = v107(v106, 1, v412);
  uint64_t v118 = v116;
  if (v117 == 1)
  {
    sub_100009410(v114, &qword_100018678);
    sub_100009410((uint64_t)v71, &qword_100018678);
    (*(void (**)(uint64_t, uint64_t))(v409 + 8))(v115, v116);
    uint64_t v111 = (uint64_t)v404;
    goto LABEL_8;
  }
  uint64_t v119 = v409;
  uint64_t v120 = (uint64_t)v112;
  v121 = v402;
  (*(void (**)(char *, uint64_t, uint64_t))(v409 + 32))(v402, v106, v116);
  sub_1000094AC(&qword_100018698, 255, (void (*)(uint64_t))&type metadata accessor for GenerativeFunctionsInstrumentationEvent.Subtype);
  int v350 = sub_100011980();
  v122 = *(void (**)(char *, uint64_t))(v119 + 8);
  v122(v121, v118);
  sub_100009410(v114, &qword_100018678);
  sub_100009410((uint64_t)v71, &qword_100018678);
  v122((char *)v115, v118);
  sub_100009410(v120, &qword_100018678);
  uint64_t v111 = (uint64_t)v404;
  v107 = v109;
  v113 = v353;
  if ((v350 & 1) == 0) {
    goto LABEL_22;
  }
LABEL_10:
  if (sub_100011880() == 0xD000000000000021 && v123 == 0x80000001000123E0)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    char v124 = sub_100011B30();
    swift_bridgeObjectRelease();
    if ((v124 & 1) == 0) {
      goto LABEL_22;
    }
  }
  v125 = v393;
  sub_1000117F0();
  uint64_t v126 = sub_1000117A0();
  v128 = v127;
  v113(v125, v395);
  if (v128 && sub_10000FEF8(v126, v128) != 5)
  {
    v352 = v107;
    if (qword_100018518 != -1) {
      swift_once();
    }
    uint64_t v129 = sub_100011940();
    sub_100008E8C(v129, (uint64_t)qword_100018BC0);
    uint64_t v130 = v390;
    v131 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(v390 + 16);
    v132 = v373;
    uint64_t v133 = v400;
    v410 = *(void **)(v390 + 16);
    ((void (*)(char *, uint64_t, uint64_t))v410)(v373, v111, v400);
    v134 = sub_100011920();
    os_log_type_t v135 = sub_100011A00();
    if (os_log_type_enabled(v134, v135))
    {
      v136 = (uint8_t *)swift_slowAlloc();
      uint64_t v417 = swift_slowAlloc();
      *(_DWORD *)v136 = 136315138;
      sub_1000094AC(&qword_100018690, 255, (void (*)(uint64_t))&type metadata accessor for UUID);
      uint64_t v137 = sub_100011B20();
      uint64_t v415 = sub_10000F408(v137, v138, &v417);
      uint64_t v133 = v400;
      sub_100011A30();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v130 + 8))(v132, v133);
      _os_log_impl((void *)&_mh_execute_header, v134, v135, "Client request start event requestIdentifier%s", v136, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v130 + 8))(v132, v133);
    }

    uint64_t v139 = v381;
    uint64_t v111 = (uint64_t)v404;
    ((void (*)(uint64_t, char *, uint64_t))v410)(v381, v404, v133);
    uint64_t v140 = v407;
    uint64_t v141 = (uint64_t)v403;
    uint64_t v142 = v411;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v407 + 56))(v403, 1, 1, v411);
    v143 = *(void (**)(char *, uint64_t, uint64_t))(v140 + 16);
    v405 = v131;
    uint64_t v144 = v133;
    uint64_t v145 = (uint64_t)v375;
    v143(v375, v413, v142);
    uint64_t v146 = sub_100011880();
    uint64_t v148 = v147;
    uint64_t v149 = (uint64_t)v374;
    sub_100011860();
    type metadata accessor for PartnerCloudRequestEvents();
    swift_allocObject();
    uint64_t v150 = v406;
    swift_retain();
    sub_10000AAA8(v139, 5, v141, v145, v146, v148, v149, v150);
    ((void (*)(uint64_t, uint64_t, uint64_t))v410)(v139, v111, v144);
    swift_beginAccess();
    uint64_t v151 = swift_retain();
    sub_1000063D0(v151, v139);
    swift_endAccess();
    swift_release();
    v107 = v352;
  }
LABEL_22:
  uint64_t v152 = v406;
  uint64_t v153 = v406 + 24;
  swift_beginAccess();
  uint64_t v154 = *(void *)(v152 + 24);
  uint64_t v156 = v152 + 40;
  uint64_t v155 = *(void *)(v152 + 40);
  uint64_t v157 = *(void *)(v156 - 8);
  swift_retain();
  swift_retain();
  swift_retain();
  v158 = (void *)sub_100006670(v111, v154, v157, v155);
  swift_release();
  swift_release();
  swift_release();
  if (!v158) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(v390 + 8))(v111, v400);
  }
  uint64_t v401 = v153;
  uint64_t v395 = v156;
  uint64_t v159 = sub_100011880();
  uint64_t v161 = v160;
  v410 = v158;
  uint64_t v162 = (uint64_t)v158 + OBJC_IVAR____TtC15GMSSELFIngestor25PartnerCloudRequestEvents_inferenceStartEvent;
  swift_beginAccess();
  uint64_t v164 = v407 + 48;
  v163 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v407 + 48);
  uint64_t v165 = v411;
  int v166 = v163(v162, 1, v411);
  v352 = v107;
  v405 = v163;
  if (v166)
  {
    swift_endAccess();
    swift_bridgeObjectRelease();
    goto LABEL_25;
  }
  uint64_t v176 = sub_100011880();
  uint64_t v178 = v177;
  swift_endAccess();
  if (v159 == v176 && v161 == v178)
  {
    swift_bridgeObjectRelease_n();
    uint64_t v165 = v411;
    uint64_t v179 = (uint64_t)v391;
    uint64_t v180 = v397;
  }
  else
  {
    char v199 = sub_100011B30();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v165 = v411;
    uint64_t v179 = (uint64_t)v391;
    uint64_t v180 = v397;
    if ((v199 & 1) == 0) {
      goto LABEL_25;
    }
  }
  uint64_t v200 = v392;
  sub_100011860();
  uint64_t v201 = v412;
  ((void (*)(uint64_t, void, uint64_t))v357)(v180, v351, v412);
  v354(v180, 0, 1, v201);
  uint64_t v202 = v179 + *(int *)(v408 + 48);
  sub_100008DBC(v200, v179);
  sub_100008DBC(v180, v202);
  v203 = v352;
  if (v352(v179, 1, v201) != 1)
  {
    uint64_t v394 = v164;
    uint64_t v210 = v376;
    sub_100008DBC(v179, v376);
    if (v203(v202, 1, v201) != 1)
    {
      uint64_t v231 = v409;
      v232 = v402;
      (*(void (**)(char *, uint64_t, uint64_t))(v409 + 32))(v402, v202, v201);
      sub_1000094AC(&qword_100018698, 255, (void (*)(uint64_t))&type metadata accessor for GenerativeFunctionsInstrumentationEvent.Subtype);
      char v233 = sub_100011980();
      v234 = *(void (**)(char *, uint64_t))(v231 + 8);
      v234(v232, v201);
      sub_100009410(v397, &qword_100018678);
      sub_100009410(v392, &qword_100018678);
      v234((char *)v210, v201);
      uint64_t v165 = v411;
      sub_100009410(v179, &qword_100018678);
      if ((v233 & 1) == 0) {
        goto LABEL_25;
      }
      goto LABEL_71;
    }
    sub_100009410(v397, &qword_100018678);
    sub_100009410(v392, &qword_100018678);
    (*(void (**)(uint64_t, uint64_t))(v409 + 8))(v210, v201);
LABEL_54:
    sub_100009410(v179, &qword_100018670);
    goto LABEL_25;
  }
  sub_100009410(v180, &qword_100018678);
  sub_100009410(v200, &qword_100018678);
  if (v203(v202, 1, v201) != 1) {
    goto LABEL_54;
  }
  sub_100009410(v179, &qword_100018678);
LABEL_71:
  uint64_t v235 = v407;
  uint64_t v236 = (uint64_t)v403;
  uint64_t v237 = v413;
  (*(void (**)(char *, uint64_t, uint64_t))(v407 + 16))(v403, v413, v165);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v235 + 56))(v236, 0, 1, v165);
  swift_beginAccess();
  sub_100008E24(v236, v162);
  swift_endAccess();
  uint64_t v238 = (uint64_t)v402;
  uint64_t v239 = v412;
  ((void (*)(char *, void, uint64_t))v357)(v402, v351, v412);
  v240 = v368;
  sub_1000096C0(v237, v238, v368);
  (*(void (**)(uint64_t, uint64_t))(v409 + 8))(v238, v239);
  uint64_t v241 = sub_100008CD0(&qword_100018688);
  if ((*(unsigned int (**)(void **, uint64_t, uint64_t))(*(void *)(v241 - 8) + 48))(v240, 1, v241) == 1)
  {
    sub_100009410((uint64_t)v240, &qword_100018660);
  }
  else
  {
    v261 = *v240;
    v262 = (char *)v240 + *(int *)(v241 + 48);
    uint64_t v263 = v369;
    v264 = v361;
    uint64_t v265 = v370;
    (*(void (**)(char *, char *, uint64_t))(v369 + 32))(v361, v262, v370);
    uint64_t v266 = (uint64_t)v371;
    (*(void (**)(char *, char *, uint64_t))(v263 + 16))(v371, v264, v265);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v263 + 56))(v266, 0, 1, v265);
    id v267 = v261;
    sub_100008FA4(v261);

    sub_100009410(v266, &qword_100018658);
    uint64_t v268 = v265;
    uint64_t v165 = v411;
    (*(void (**)(char *, uint64_t))(v263 + 8))(v264, v268);
  }
LABEL_25:
  uint64_t v167 = sub_100011880();
  uint64_t v169 = v168;
  swift_beginAccess();
  v170 = (unsigned int (*)(uint64_t, uint64_t, uint64_t))v405;
  if (v405(v162, 1, v165))
  {
    swift_endAccess();
    swift_bridgeObjectRelease();
    goto LABEL_27;
  }
  uint64_t v181 = sub_100011880();
  uint64_t v183 = v182;
  swift_endAccess();
  if (v167 == v181 && v169 == v183)
  {
    swift_bridgeObjectRelease_n();
    uint64_t v165 = v411;
    uint64_t v184 = v399;
    uint64_t v185 = v398;
    v186 = v352;
  }
  else
  {
    char v204 = sub_100011B30();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v165 = v411;
    uint64_t v184 = v399;
    uint64_t v185 = v398;
    v186 = v352;
    if ((v204 & 1) == 0) {
      goto LABEL_27;
    }
  }
  sub_100011860();
  LODWORD(v397) = enum case for GenerativeFunctionsInstrumentationEvent.Subtype.end(_:);
  uint64_t v205 = v412;
  v357(v185);
  v354(v185, 0, 1, v205);
  uint64_t v206 = v386;
  uint64_t v207 = v386 + *(int *)(v408 + 48);
  sub_100008DBC(v184, v386);
  sub_100008DBC(v185, v207);
  if (v186(v206, 1, v205) == 1)
  {
    sub_100009410(v185, &qword_100018678);
    sub_100009410(v184, &qword_100018678);
    if (v186(v207, 1, v205) == 1)
    {
      sub_100009410(v206, &qword_100018678);
      uint64_t v208 = v407;
      v209 = v387;
      (*(void (**)(char *, uint64_t, uint64_t))(v407 + 16))(v387, v413, v165);
LABEL_74:
      (*(void (**)(char *, uint64_t))(v208 + 8))(v209, v165);
      v220 = v352;
      goto LABEL_75;
    }
    goto LABEL_57;
  }
  uint64_t v211 = v377;
  sub_100008DBC(v206, v377);
  unsigned int v212 = v186(v207, 1, v205);
  uint64_t v213 = v409;
  if (v212 == 1)
  {
    sub_100009410(v398, &qword_100018678);
    sub_100009410(v399, &qword_100018678);
    (*(void (**)(uint64_t, uint64_t))(v213 + 8))(v211, v205);
    uint64_t v165 = v411;
LABEL_57:
    sub_100009410(v206, &qword_100018670);
    v209 = v387;
    (*(void (**)(char *, uint64_t, uint64_t))(v407 + 16))(v387, v413, v165);
    uint64_t v214 = v396;
    uint64_t v215 = v388;
    goto LABEL_58;
  }
  v242 = v402;
  (*(void (**)(char *, uint64_t, uint64_t))(v409 + 32))(v402, v207, v205);
  sub_1000094AC(&qword_100018698, 255, (void (*)(uint64_t))&type metadata accessor for GenerativeFunctionsInstrumentationEvent.Subtype);
  char v243 = sub_100011980();
  v244 = *(void (**)(char *, uint64_t))(v213 + 8);
  v244(v242, v205);
  sub_100009410(v398, &qword_100018678);
  sub_100009410(v399, &qword_100018678);
  v244((char *)v211, v205);
  uint64_t v245 = v413;
  sub_100009410(v206, &qword_100018678);
  uint64_t v208 = v407;
  v209 = v387;
  uint64_t v165 = v411;
  (*(void (**)(char *, uint64_t, uint64_t))(v407 + 16))(v387, v245, v411);
  uint64_t v214 = v396;
  uint64_t v215 = v388;
  if (v243) {
    goto LABEL_74;
  }
LABEL_58:
  sub_100011860();
  uint64_t v216 = v385;
  uint64_t v217 = v412;
  ((void (*)(uint64_t, void, uint64_t))v357)(v385, enum case for GenerativeFunctionsInstrumentationEvent.Subtype.fail(_:), v412);
  v354(v216, 0, 1, v217);
  uint64_t v218 = v214 + *(int *)(v408 + 48);
  sub_100008DBC(v215, v214);
  sub_100008DBC(v216, v218);
  uint64_t v219 = v214;
  v220 = v352;
  if (v352(v219, 1, v217) == 1)
  {
    sub_100009410(v216, &qword_100018678);
    sub_100009410(v215, &qword_100018678);
    (*(void (**)(char *, uint64_t))(v407 + 8))(v209, v165);
    if (v220(v218, 1, v217) == 1)
    {
      sub_100009410(v396, &qword_100018678);
      goto LABEL_75;
    }
    goto LABEL_63;
  }
  uint64_t v221 = v367;
  sub_100008DBC(v396, v367);
  unsigned int v222 = v220(v218, 1, v217);
  v223 = (void (**)(uint64_t, uint64_t))(v409 + 8);
  if (v222 == 1)
  {
    sub_100009410(v385, &qword_100018678);
    sub_100009410(v388, &qword_100018678);
    uint64_t v165 = v411;
    (*(void (**)(char *, uint64_t))(v407 + 8))(v209, v411);
    (*v223)(v221, v217);
LABEL_63:
    sub_100009410(v396, &qword_100018670);
    v170 = (unsigned int (*)(uint64_t, uint64_t, uint64_t))v405;
    goto LABEL_27;
  }
  uint64_t v272 = v409 + 32;
  v273 = v209;
  v274 = v402;
  (*(void (**)(char *, uint64_t, uint64_t))(v409 + 32))(v402, v218, v217);
  sub_1000094AC(&qword_100018698, 255, (void (*)(uint64_t))&type metadata accessor for GenerativeFunctionsInstrumentationEvent.Subtype);
  LODWORD(v399) = sub_100011980();
  v275 = *(void (**)(char *, uint64_t))(v272 - 24);
  v275(v274, v217);
  sub_100009410(v385, &qword_100018678);
  sub_100009410(v388, &qword_100018678);
  v276 = v273;
  uint64_t v165 = v411;
  (*(void (**)(char *, uint64_t))(v407 + 8))(v276, v411);
  v275((char *)v221, v217);
  v220 = v352;
  sub_100009410(v396, &qword_100018678);
  v170 = (unsigned int (*)(uint64_t, uint64_t, uint64_t))v405;
  if ((v399 & 1) == 0)
  {
LABEL_27:
    uint64_t v171 = sub_100011880();
    uint64_t v173 = v172;
    swift_beginAccess();
    if (v170(v162, 1, v165))
    {
      swift_endAccess();
      uint64_t v174 = 0;
      unint64_t v175 = 0xE000000000000000;
    }
    else
    {
      uint64_t v174 = sub_100011880();
      unint64_t v175 = v187;
      swift_endAccess();
    }
    v188 = v404;
    uint64_t v415 = v174;
    unint64_t v416 = v175;
    swift_bridgeObjectRetain();
    v418._countAndFlagsBits = 0x6F5474737269662ELL;
    v418._object = (void *)0xEB000000006E656BLL;
    sub_1000119C0(v418);
    swift_bridgeObjectRelease();
    if (v171 == v415 && v173 == v416)
    {
      swift_bridgeObjectRelease_n();
      uint64_t v189 = v411;
LABEL_41:
      (*(void (**)(char *, uint64_t))(v390 + 8))(v188, v400);
      uint64_t v191 = v407;
      uint64_t v192 = (uint64_t)v403;
      (*(void (**)(char *, uint64_t, uint64_t))(v407 + 16))(v403, v413, v189);
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v191 + 56))(v192, 0, 1, v189);
      uint64_t v193 = (uint64_t)v410 + OBJC_IVAR____TtC15GMSSELFIngestor25PartnerCloudRequestEvents_firstTokenEvent;
      swift_beginAccess();
      sub_100008E24(v192, v193);
      swift_endAccess();
      return swift_release();
    }
    char v190 = sub_100011B30();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v189 = v411;
    if (v190) {
      goto LABEL_41;
    }
    uint64_t v194 = sub_100011880();
    uint64_t v196 = v195;
    swift_beginAccess();
    if (v170(v162, 1, v189))
    {
      swift_endAccess();
      uint64_t v197 = 0;
      unint64_t v198 = 0xE000000000000000;
    }
    else
    {
      uint64_t v197 = sub_100011880();
      unint64_t v198 = v224;
      swift_endAccess();
    }
    uint64_t v415 = v197;
    unint64_t v416 = v198;
    swift_bridgeObjectRetain();
    v419._countAndFlagsBits = 0x6E496C65646F6D2ELL;
    v419._object = (void *)0xEA00000000006F66;
    sub_1000119C0(v419);
    swift_bridgeObjectRelease();
    v225 = (void (*)(void, void, void))v410;
    if (v194 == v415 && v196 == v416)
    {
      swift_bridgeObjectRelease_n();
    }
    else
    {
      char v226 = sub_100011B30();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v226 & 1) == 0)
      {
        uint64_t v269 = sub_100011880();
        uint64_t v271 = v400;
        if (v269 == 0xD000000000000024 && v270 == 0x8000000100012380)
        {
          swift_bridgeObjectRelease();
        }
        else
        {
          char v341 = sub_100011B30();
          swift_bridgeObjectRelease();
          if ((v341 & 1) == 0)
          {
            if (sub_100011880() == 0xD000000000000025 && v344 == 0x80000001000123B0)
            {
              swift_bridgeObjectRelease();
              (*(void (**)(char *, uint64_t))(v390 + 8))(v188, v271);
            }
            else
            {
              char v345 = sub_100011B30();
              swift_bridgeObjectRelease();
              (*(void (**)(char *, uint64_t))(v390 + 8))(v188, v271);
              if ((v345 & 1) == 0) {
                return swift_release();
              }
            }
            uint64_t v346 = v407;
            uint64_t v228 = (uint64_t)v403;
            uint64_t v347 = v411;
            (*(void (**)(char *, uint64_t, uint64_t))(v407 + 16))(v403, v413, v411);
            (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v346 + 56))(v228, 0, 1, v347);
            v230 = &OBJC_IVAR____TtC15GMSSELFIngestor25PartnerCloudRequestEvents_webSearchStatusEvent;
LABEL_122:
            uint64_t v348 = (uint64_t)v225 + *v230;
            swift_beginAccess();
            sub_100008E24(v228, v348);
            swift_endAccess();
            return swift_release();
          }
        }
        (*(void (**)(char *, uint64_t))(v390 + 8))(v188, v271);
        uint64_t v342 = v407;
        uint64_t v228 = (uint64_t)v403;
        uint64_t v343 = v411;
        (*(void (**)(char *, uint64_t, uint64_t))(v407 + 16))(v403, v413, v411);
        (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v342 + 56))(v228, 0, 1, v343);
        v230 = &OBJC_IVAR____TtC15GMSSELFIngestor25PartnerCloudRequestEvents_signedInStatusEvent;
        goto LABEL_122;
      }
    }
    (*(void (**)(char *, uint64_t))(v390 + 8))(v188, v400);
    uint64_t v227 = v407;
    uint64_t v228 = (uint64_t)v403;
    uint64_t v229 = v411;
    (*(void (**)(char *, uint64_t, uint64_t))(v407 + 16))(v403, v413, v411);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v227 + 56))(v228, 0, 1, v229);
    v230 = &OBJC_IVAR____TtC15GMSSELFIngestor25PartnerCloudRequestEvents_modelInfoEvent;
    goto LABEL_122;
  }
LABEL_75:
  uint64_t v246 = v383;
  sub_100011860();
  uint64_t v247 = v382;
  uint64_t v248 = v412;
  ((void (*)(uint64_t, void, uint64_t))v357)(v382, v397, v412);
  v354(v247, 0, 1, v248);
  uint64_t v249 = v408;
  uint64_t v250 = v389;
  uint64_t v251 = v389 + *(int *)(v408 + 48);
  sub_100008DBC(v246, v389);
  sub_100008DBC(v247, v251);
  if (v220(v250, 1, v248) != 1)
  {
    uint64_t v256 = v366;
    sub_100008DBC(v250, v366);
    unsigned int v257 = v220(v251, 1, v248);
    uint64_t v258 = v409;
    uint64_t v254 = (uint64_t)v380;
    v259 = v379;
    if (v257 != 1)
    {
      v277 = v402;
      (*(void (**)(char *, uint64_t, uint64_t))(v409 + 32))(v402, v251, v248);
      sub_1000094AC(&qword_100018698, 255, (void (*)(uint64_t))&type metadata accessor for GenerativeFunctionsInstrumentationEvent.Subtype);
      LODWORD(v411) = sub_100011980();
      v278 = *(void (**)(char *, uint64_t))(v258 + 8);
      v279 = v277;
      uint64_t v260 = (uint64_t)v378;
      v278(v279, v248);
      sub_100009410(v382, &qword_100018678);
      sub_100009410(v383, &qword_100018678);
      v278((char *)v256, v248);
      uint64_t v249 = v408;
      sub_100009410(v250, &qword_100018678);
      uint64_t v253 = v400;
      uint64_t v255 = (uint64_t)v259;
      if ((v411 & 1) == 0) {
        goto LABEL_97;
      }
      goto LABEL_88;
    }
    sub_100009410(v382, &qword_100018678);
    sub_100009410(v383, &qword_100018678);
    (*(void (**)(uint64_t, uint64_t))(v258 + 8))(v256, v248);
    uint64_t v255 = (uint64_t)v259;
LABEL_80:
    sub_100009410(v389, &qword_100018670);
    uint64_t v260 = (uint64_t)v378;
    goto LABEL_97;
  }
  sub_100009410(v247, &qword_100018678);
  sub_100009410(v246, &qword_100018678);
  unsigned int v252 = v220(v251, 1, v248);
  uint64_t v253 = v400;
  uint64_t v254 = (uint64_t)v380;
  uint64_t v255 = (uint64_t)v379;
  if (v252 != 1) {
    goto LABEL_80;
  }
  sub_100009410(v389, &qword_100018678);
LABEL_88:
  uint64_t v280 = v255;
  if (qword_100018518 != -1) {
    swift_once();
  }
  uint64_t v281 = sub_100011940();
  sub_100008E8C(v281, (uint64_t)qword_100018BC0);
  uint64_t v282 = v390;
  v283 = v362;
  (*(void (**)(char *, char *, uint64_t))(v390 + 16))(v362, v404, v253);
  v284 = sub_100011920();
  os_log_type_t v285 = sub_100011A00();
  if (os_log_type_enabled(v284, v285))
  {
    v286 = (uint8_t *)swift_slowAlloc();
    uint64_t v415 = swift_slowAlloc();
    v287 = v283;
    *(_DWORD *)v286 = 136315138;
    sub_1000094AC(&qword_100018690, 255, (void (*)(uint64_t))&type metadata accessor for UUID);
    uint64_t v288 = sub_100011B20();
    uint64_t v414 = sub_10000F408(v288, v289, &v415);
    uint64_t v254 = (uint64_t)v380;
    uint64_t v255 = (uint64_t)v379;
    sub_100011A30();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v282 + 8))(v287, v400);
    _os_log_impl((void *)&_mh_execute_header, v284, v285, "End event requestIdentifier%s", v286, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v282 + 8))(v283, v253);

    uint64_t v255 = v280;
  }
  uint64_t v290 = (uint64_t)v402;
  uint64_t v248 = v412;
  ((void (*)(char *, void, uint64_t))v357)(v402, v397, v412);
  v291 = v363;
  sub_1000096C0(v413, v290, v363);
  (*(void (**)(uint64_t, uint64_t))(v409 + 8))(v290, v248);
  uint64_t v292 = sub_100008CD0(&qword_100018688);
  int v293 = (*(uint64_t (**)(void **, uint64_t, uint64_t))(*(void *)(v292 - 8) + 48))(v291, 1, v292);
  v220 = v352;
  if (v293 == 1)
  {
    sub_100009410((uint64_t)v291, &qword_100018660);
  }
  else
  {
    v294 = *v291;
    uint64_t v295 = v369;
    v296 = v359;
    uint64_t v297 = v370;
    (*(void (**)(char *, char *, uint64_t))(v369 + 32))(v359, (char *)v291 + *(int *)(v292 + 48), v370);
    uint64_t v298 = (uint64_t)v371;
    (*(void (**)(char *, char *, uint64_t))(v295 + 16))(v371, v296, v297);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v295 + 56))(v298, 0, 1, v297);
    id v299 = v294;
    sub_100008FA4(v294);

    sub_100009410(v298, &qword_100018658);
    (*(void (**)(char *, uint64_t))(v295 + 8))(v296, v297);
  }
  uint64_t v260 = (uint64_t)v378;
  uint64_t v249 = v408;
LABEL_97:
  sub_100011860();
  uint64_t v300 = enum case for GenerativeFunctionsInstrumentationEvent.Subtype.fail(_:);
  uint64_t v301 = v384;
  ((void (*)(uint64_t, void, uint64_t))v357)(v384, enum case for GenerativeFunctionsInstrumentationEvent.Subtype.fail(_:), v248);
  v354(v301, 0, 1, v248);
  uint64_t v302 = v254 + *(int *)(v249 + 48);
  sub_100008DBC(v255, v254);
  sub_100008DBC(v301, v302);
  if (v220(v254, 1, v248) == 1)
  {
    sub_100009410(v301, &qword_100018678);
    sub_100009410(v255, &qword_100018678);
    unsigned int v303 = v220(v302, 1, v248);
    uint64_t v304 = (uint64_t)v404;
    if (v303 == 1)
    {
      sub_100009410(v254, &qword_100018678);
LABEL_104:
      if (qword_100018518 != -1) {
        swift_once();
      }
      uint64_t v312 = sub_100011940();
      sub_100008E8C(v312, (uint64_t)qword_100018BC0);
      uint64_t v313 = v390;
      v314 = v364;
      uint64_t v315 = v400;
      (*(void (**)(char *, uint64_t, uint64_t))(v390 + 16))(v364, v304, v400);
      v316 = sub_100011920();
      os_log_type_t v317 = sub_100011A00();
      if (os_log_type_enabled(v316, v317))
      {
        v318 = (uint8_t *)swift_slowAlloc();
        uint64_t v415 = swift_slowAlloc();
        *(_DWORD *)v318 = 136315138;
        uint64_t v411 = (uint64_t)(v318 + 4);
        sub_1000094AC(&qword_100018690, 255, (void (*)(uint64_t))&type metadata accessor for UUID);
        uint64_t v319 = sub_100011B20();
        uint64_t v414 = sub_10000F408(v319, v320, &v415);
        sub_100011A30();
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v313 + 8))(v314, v315);
        _os_log_impl((void *)&_mh_execute_header, v316, v317, "Failed event requestIdentifier%s", v318, 0xCu);
        swift_arrayDestroy();
        uint64_t v304 = (uint64_t)v404;
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {
        (*(void (**)(char *, uint64_t))(v313 + 8))(v314, v315);
      }

      uint64_t v321 = v409;
      uint64_t v322 = (uint64_t)v402;
      uint64_t v323 = v412;
      ((void (*)(char *, uint64_t, uint64_t))v357)(v402, v300, v412);
      v324 = v365;
      sub_1000096C0(v413, v322, v365);
      (*(void (**)(uint64_t, uint64_t))(v321 + 8))(v322, v323);
      uint64_t v325 = sub_100008CD0(&qword_100018688);
      if ((*(unsigned int (**)(void **, uint64_t, uint64_t))(*(void *)(v325 - 8) + 48))(v324, 1, v325) == 1)
      {
        sub_100009410((uint64_t)v324, &qword_100018660);
      }
      else
      {
        v326 = *v324;
        uint64_t v327 = v369;
        v328 = v360;
        uint64_t v329 = v370;
        (*(void (**)(char *, char *, uint64_t))(v369 + 32))(v360, (char *)v324 + *(int *)(v325 + 48), v370);
        uint64_t v330 = (uint64_t)v371;
        (*(void (**)(char *, char *, uint64_t))(v327 + 16))(v371, v328, v329);
        (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v327 + 56))(v330, 0, 1, v329);
        id v331 = v326;
        sub_100008FA4(v326);

        sub_100009410(v330, &qword_100018658);
        (*(void (**)(char *, uint64_t))(v327 + 8))(v328, v329);
      }
      goto LABEL_112;
    }
    goto LABEL_102;
  }
  sub_100008DBC(v254, v260);
  unsigned int v305 = v220(v302, 1, v248);
  uint64_t v306 = v409;
  if (v305 == 1)
  {
    sub_100009410(v384, &qword_100018678);
    sub_100009410(v255, &qword_100018678);
    (*(void (**)(uint64_t, uint64_t))(v306 + 8))(v260, v248);
    uint64_t v304 = (uint64_t)v404;
LABEL_102:
    sub_100009410(v254, &qword_100018670);
    goto LABEL_112;
  }
  uint64_t v307 = v255;
  uint64_t v308 = v260;
  v309 = v402;
  (*(void (**)(char *, uint64_t, uint64_t))(v409 + 32))(v402, v302, v248);
  sub_1000094AC(&qword_100018698, 255, (void (*)(uint64_t))&type metadata accessor for GenerativeFunctionsInstrumentationEvent.Subtype);
  char v310 = sub_100011980();
  v311 = *(void (**)(char *, uint64_t))(v306 + 8);
  v311(v309, v248);
  sub_100009410(v384, &qword_100018678);
  sub_100009410(v307, &qword_100018678);
  v311((char *)v308, v248);
  sub_100009410(v254, &qword_100018678);
  uint64_t v304 = (uint64_t)v404;
  if (v310) {
    goto LABEL_104;
  }
LABEL_112:
  swift_beginAccess();
  uint64_t v332 = *(void *)(v406 + 24);
  uint64_t v333 = *(void *)(v406 + 32);
  swift_retain();
  swift_retain();
  uint64_t v334 = sub_100006E38(v304, v332, v333);
  char v336 = v335;
  uint64_t v338 = v337;
  swift_release();
  swift_release();
  uint64_t v339 = v400;
  if ((v336 & 1) == 0)
  {
    uint64_t v340 = v381;
    sub_10000726C(v334, v338, v381);
    (*(void (**)(uint64_t, uint64_t))(v390 + 8))(v340, v339);
    sub_1000073D8(v334);
    swift_release();
  }
  swift_endAccess();
  swift_release();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v390 + 8))(v304, v339);
}

uint64_t sub_1000063D0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_1000115D0();
  uint64_t v23 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *v2;
  uint64_t v10 = v2[1];
  swift_retain();
  swift_retain();
  unint64_t v11 = sub_100006E38(a2, v9, v10);
  char v13 = v12;
  uint64_t v15 = v14;
  swift_release();
  swift_release();
  if (v13)
  {
    if (a1)
    {
      swift_retain();
      sub_100007030(a2);
      swift_retain();
      sub_100011A90();
      sub_100011AB0();
      sub_100011AC0();
      goto LABEL_10;
    }
    uint64_t v21 = *(uint64_t (**)(uint64_t, uint64_t))(v23 + 8);
    return v21(a2, v6);
  }
  else if (a1)
  {
    uint64_t v18 = v3[2];
    uint64_t v17 = v3 + 2;
    uint64_t v16 = v18;
    swift_retain();
    uint64_t result = swift_isUniquelyReferenced_nonNull_native();
    *uint64_t v17 = v18;
    if ((result & 1) == 0)
    {
      uint64_t result = sub_100007938(v16);
      uint64_t v16 = result;
      *uint64_t v17 = result;
    }
    if ((v11 & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else if (v11 < *(void *)(v16 + 16))
    {
      swift_retain();
      swift_release();
      *(void *)(v16 + 8 * v11 + 32) = a1;
LABEL_10:
      sub_100011AA0();
      (*(void (**)(uint64_t, uint64_t))(v23 + 8))(a2, v6);
      return swift_release_n();
    }
    __break(1u);
  }
  else
  {
    sub_10000726C(v11, v15, (uint64_t)v8);
    uint64_t v20 = *(void (**)(char *, uint64_t))(v23 + 8);
    v23 += 8;
    v20(v8, v6);
    sub_1000073D8(v11);
    v20((char *)a2, v6);
    return swift_release();
  }
  return result;
}

uint64_t sub_100006670(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = sub_1000115D0();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  unint64_t v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = a3 + ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80));
  uint64_t v13 = *(void *)(a3 + 16);
  if (!a2)
  {
LABEL_5:
    if (v13)
    {
      unint64_t v14 = 0;
      uint64_t v19 = *(void (**)(char *, uint64_t, uint64_t))(v9 + 16);
      uint64_t v18 = v9 + 16;
      uint64_t v17 = v19;
      uint64_t v20 = *(void *)(v18 + 56);
      uint64_t v23 = a4;
      uint64_t v24 = v20;
      while (1)
      {
        v17(v11, v12, v8);
        sub_1000094AC(&qword_1000186B8, 255, (void (*)(uint64_t))&type metadata accessor for UUID);
        uint64_t v21 = a1;
        char v22 = sub_100011980();
        uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v18 - 8))(v11, v8);
        if (v22) {
          break;
        }
        ++v14;
        v12 += v24;
        a1 = v21;
        if (v13 == v14) {
          return 0;
        }
      }
      a4 = v23;
      goto LABEL_11;
    }
    return 0;
  }
  swift_retain();
  unint64_t v14 = sub_100007608(a1, v12, v13, (void *)(a2 + 16), a2 + 32);
  uint64_t v8 = v15;
  uint64_t result = swift_release();
  if (v8) {
    return 0;
  }
  if ((v14 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_5;
  }
LABEL_11:
  if (v14 < *(void *)(a4 + 16)) {
    return swift_retain();
  }
  __break(1u);
  return result;
}

uint64_t sub_100006878()
{
  swift_release();
  swift_release();
  swift_release();

  return _swift_deallocClassInstance(v0, 48, 7);
}

uint64_t sub_1000068D4(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_10000696C;
  return sub_100002508(a1);
}

uint64_t sub_10000696C()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_100006A60()
{
  uint64_t v0 = type metadata accessor for GMSSELFIngestor();
  uint64_t v2 = sub_1000094AC(&qword_100018638, v1, (void (*)(uint64_t))type metadata accessor for GMSSELFIngestor);

  return IngestionExtension.configuration.getter(v0, v2);
}

void *sub_100006AE0@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for GMSSELFIngestor();
  uint64_t v2 = swift_allocObject();
  *(unsigned char *)(v2 + 16) = 1;
  uint64_t result = &_swiftEmptyArrayStorage;
  if (((unint64_t)&_swiftEmptyArrayStorage & 0xC000000000000000) != 0) {
    uint64_t result = sub_100006D40((unint64_t)&_swiftEmptyArrayStorage);
  }
  *(void *)(v2 + 24) = 0;
  *(void *)(v2 + 32) = &_swiftEmptyArrayStorage;
  *(void *)(v2 + 40) = result;
  *a1 = v2;
  return result;
}

int main(int argc, const char **argv, const char **envp)
{
  type metadata accessor for GMSSELFIngestor();
  sub_1000094AC(&qword_100018520, v3, (void (*)(uint64_t))type metadata accessor for GMSSELFIngestor);
  sub_1000116E0();
  return 0;
}

uint64_t type metadata accessor for GMSSELFIngestor()
{
  return self;
}

uint64_t sub_100006C08@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_1000118A0();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56);

  return v3(a1, 1, 1, v2);
}

uint64_t sub_100006C74(uint64_t a1, uint64_t a2)
{
  return sub_1000094AC(&qword_100018520, a2, (void (*)(uint64_t))type metadata accessor for GMSSELFIngestor);
}

uint64_t sub_100006CBC(uint64_t a1, uint64_t a2)
{
  return *(void *)(swift_getOpaqueTypeConformance2() + 8);
}

void *sub_100006D40(unint64_t a1)
{
  unint64_t v1 = a1;
  if (a1 >> 62) {
    goto LABEL_10;
  }
  uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v2) {
    return &_swiftEmptyArrayStorage;
  }
  while (1)
  {
    if (v2 <= 0)
    {
      uint64_t v3 = &_swiftEmptyArrayStorage;
    }
    else
    {
      sub_100008CD0(&qword_100018640);
      uint64_t v3 = (void *)swift_allocObject();
      int64_t v4 = j__malloc_size(v3);
      uint64_t v5 = v4 - 32;
      if (v4 < 32) {
        uint64_t v5 = v4 - 25;
      }
      v3[2] = v2;
      v3[3] = (2 * (v5 >> 3)) | 1;
    }
    swift_bridgeObjectRetain();
    sub_100008ACC((unint64_t)(v3 + 4), v2, v1);
    unint64_t v1 = v6;
    swift_bridgeObjectRelease();
    if (v1 == v2) {
      break;
    }
    __break(1u);
LABEL_10:
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_100011AE0();
    swift_bridgeObjectRelease();
    if (!v2) {
      return &_swiftEmptyArrayStorage;
    }
  }
  return v3;
}

uint64_t sub_100006E38(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1000115D0();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin();
  uint64_t v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = a3 + ((*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80));
  uint64_t v11 = *(void *)(a3 + 16);
  if (a2)
  {
    swift_retain();
    uint64_t v12 = sub_100007608(a1, v10, v11, (void *)(a2 + 16), a2 + 32);
    swift_release();
  }
  else if (v11)
  {
    uint64_t v19 = a1;
    uint64_t v12 = 0;
    uint64_t v15 = *(void (**)(char *, uint64_t, uint64_t))(v7 + 16);
    uint64_t v13 = v7 + 16;
    unint64_t v14 = v15;
    uint64_t v16 = *(void *)(v13 + 56);
    while (1)
    {
      v14(v9, v10, v6);
      sub_1000094AC(&qword_1000186B8, 255, (void (*)(uint64_t))&type metadata accessor for UUID);
      char v17 = sub_100011980();
      (*(void (**)(char *, uint64_t))(v13 - 8))(v9, v6);
      if (v17) {
        break;
      }
      ++v12;
      v10 += v16;
      if (v11 == v12) {
        return 0;
      }
    }
  }
  else
  {
    return 0;
  }
  return v12;
}

uint64_t sub_100007030(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_1000115D0();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin();
  uint64_t v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  uint64_t v8 = v2 + 1;
  uint64_t v9 = v2[1];
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v2[1] = v9;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    sub_100008974(0, *(void *)(v9 + 16) + 1, 1);
    uint64_t v9 = *v8;
  }
  unint64_t v12 = *(void *)(v9 + 16);
  unint64_t v11 = *(void *)(v9 + 24);
  if (v12 >= v11 >> 1)
  {
    sub_100008974(v11 > 1, v12 + 1, 1);
    uint64_t v9 = *v8;
  }
  *(void *)(v9 + 16) = v12 + 1;
  uint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v5 + 32))(v9+ ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80))+ *(void *)(v5 + 72) * v12, v7, v4);
  v2[1] = v9;
  uint64_t v14 = *(void *)(v9 + 16);
  if (*v2)
  {
    swift_beginAccess();
    if (sub_100011690() >= v14)
    {
      uint64_t result = swift_isUniquelyReferenced_native();
      uint64_t v15 = *v2;
      if (!result)
      {
        if (!v15)
        {
LABEL_16:
          __break(1u);
          return result;
        }
        uint64_t v15 = sub_1000116B0();
        uint64_t result = swift_release();
        *uint64_t v2 = v15;
      }
      if (v15) {
        return sub_100011650();
      }
      __break(1u);
      goto LABEL_16;
    }
  }
  else if ((unint64_t)v14 < 0x10)
  {
    return result;
  }
  return sub_100007880();
}

unint64_t sub_10000726C@<X0>(int64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = *(void *)(v3[1] + 16);
  uint64_t v7 = *v3;
  if (!*v3)
  {
    if (!v6) {
      goto LABEL_16;
    }
    return sub_1000074B0(a1, a3);
  }
  swift_beginAccess();
  if ((*(void *)(v7 + 16) & 0x3FLL) == (*(void *)(v7 + 24) & 0x3FLL))
  {
    if (!v6) {
      goto LABEL_16;
    }
  }
  else if (v6 <= sub_1000116A0())
  {
LABEL_16:
    sub_1000074B0(a1, a3);
    return sub_100007880();
  }
  unint64_t result = swift_isUniquelyReferenced_native();
  uint64_t v10 = *v3;
  if (!result)
  {
    if (!v10) {
      goto LABEL_20;
    }
    uint64_t v10 = sub_1000116B0();
    unint64_t result = swift_release();
    *uint64_t v3 = v10;
  }
  if (v10)
  {
    swift_retain();
    unint64_t result = sub_100007B8C(a2, (void *)(v10 + 16), v10 + 32, (uint64_t)v3);
    if (__OFADD__(a1, 1))
    {
      __break(1u);
    }
    else if (a1 + 1 >= a1)
    {
      uint64_t v11 = v3[1];
      swift_retain();
      sub_100007EA8(a1, a1 + 1, v11, (void *)(v10 + 16), v10 + 32);
      swift_release();
      swift_release();
      return sub_1000074B0(a1, a3);
    }
    __break(1u);
  }
  __break(1u);
LABEL_20:
  __break(1u);
  return result;
}

uint64_t sub_1000073D8(unint64_t a1)
{
  uint64_t v3 = *v1;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *unint64_t v1 = v3;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    uint64_t v3 = sub_100007938(v3);
    *unint64_t v1 = v3;
  }
  unint64_t v5 = *(void *)(v3 + 16);
  if (v5 <= a1)
  {
    __break(1u);
  }
  else
  {
    unint64_t v6 = v5 - 1;
    uint64_t v7 = v5 - 1 - a1;
    if (v7 >= 0)
    {
      uint64_t v8 = v3 + 8 * a1;
      uint64_t v9 = *(void *)(v8 + 32);
      memmove((void *)(v8 + 32), (const void *)(v8 + 40), 8 * v7);
      *(void *)(v3 + 16) = v6;
      sub_100011AA0();
      return v9;
    }
  }
  uint64_t result = sub_100011AF0();
  __break(1u);
  return result;
}

uint64_t sub_1000074B0@<X0>(unint64_t a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t v5 = *v2;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    unint64_t v5 = (void *)sub_100007924(v5);
  }
  unint64_t v6 = v5[2];
  if (v6 <= a1)
  {
    __break(1u);
    goto LABEL_15;
  }
  unint64_t v7 = v6 - 1;
  uint64_t v8 = sub_1000115D0();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(void *)(v9 + 72);
  unint64_t v11 = (unint64_t)v5
      + ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80))
      + v10 * a1;
  uint64_t result = (*(uint64_t (**)(uint64_t, unint64_t, uint64_t))(v9 + 32))(a2, v11, v8);
  if ((uint64_t)(v7 - a1) < 0)
  {
LABEL_15:
    uint64_t result = sub_100011AF0();
    __break(1u);
    return result;
  }
  if (v10 > 0 || v11 >= v11 + v10 + v10 * (v7 - a1))
  {
    uint64_t result = swift_arrayInitWithTakeFrontToBack();
  }
  else if (v10)
  {
    uint64_t result = swift_arrayInitWithTakeBackToFront();
  }
  v5[2] = v7;
  *uint64_t v2 = v5;
  return result;
}

uint64_t sub_100007608(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5)
{
  uint64_t v27 = a2;
  uint64_t v7 = sub_1000115D0();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin();
  uint64_t v10 = (char *)&v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000094AC(&qword_1000186A8, 255, (void (*)(uint64_t))&type metadata accessor for UUID);
  uint64_t result = sub_100011960();
  uint64_t v12 = 1 << *a4;
  BOOL v13 = __OFSUB__(v12, 1);
  uint64_t v14 = v12 - 1;
  if (v13)
  {
    __break(1u);
  }
  else
  {
    uint64_t v15 = v14 & result;
    uint64_t v16 = sub_100011630();
    *(void *)&long long v36 = a4;
    *((void *)&v36 + 1) = a5;
    *(void *)&long long v37 = v15;
    *((void *)&v37 + 1) = v16;
    *(void *)&long long v38 = v17;
    *((void *)&v38 + 1) = v18;
    char v39 = 0;
    uint64_t v19 = sub_100011660();
    long long v28 = v36;
    long long v29 = v37;
    long long v30 = v38;
    char v31 = v39;
    if ((v20 & 1) == 0)
    {
      uint64_t v23 = *(void (**)(char *, uint64_t, uint64_t))(v8 + 16);
      uint64_t v21 = v8 + 16;
      char v22 = v23;
      uint64_t v24 = *(void *)(v21 + 56);
      do
      {
        v22(v10, v27 + v24 * v19, v7);
        sub_1000094AC(&qword_1000186B8, 255, (void (*)(uint64_t))&type metadata accessor for UUID);
        char v25 = sub_100011980();
        (*(void (**)(char *, uint64_t))(v21 - 8))(v10, v7);
        if (v25) {
          break;
        }
        sub_100011680();
        long long v32 = v28;
        long long v33 = v29;
        long long v34 = v30;
        char v35 = v31;
        uint64_t v19 = sub_100011660();
      }
      while ((v26 & 1) == 0);
    }
    return v19;
  }
  return result;
}

uint64_t sub_100007880()
{
  uint64_t v1 = *v0;
  uint64_t v2 = v0[1];
  if (*v0)
  {
    swift_beginAccess();
    uint64_t v3 = *(void *)(v1 + 24) & 0x3FLL;
    unint64_t v4 = *(void *)(v2 + 16);
    if (v3) {
      goto LABEL_7;
    }
  }
  else
  {
    uint64_t v3 = 0;
    unint64_t v4 = *(void *)(v2 + 16);
  }
  if (v4 < 0x10)
  {
    uint64_t v5 = 0;
    goto LABEL_11;
  }
LABEL_7:
  uint64_t v6 = sub_1000116C0();
  if (v3 <= v6) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = v3;
  }
  uint64_t v5 = sub_100008750(v2, v7, 0, v3);
LABEL_11:
  uint64_t result = swift_release();
  uint64_t *v0 = v5;
  return result;
}

uint64_t sub_100007924(void *a1)
{
  return sub_10000794C(0, a1[2], 0, a1);
}

uint64_t sub_100007938(uint64_t a1)
{
  return specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(void *)(a1 + 16), 0, a1);
}

uint64_t sub_10000794C(char a1, int64_t a2, char a3, void *a4)
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
    BOOL v13 = &_swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  sub_100008CD0(&qword_1000186B0);
  uint64_t v10 = *(void *)(sub_1000115D0() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  BOOL v13 = (void *)swift_allocObject();
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
  uint64_t v16 = *(void *)(sub_1000115D0() - 8);
  unint64_t v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  uint64_t v18 = (char *)v13 + v17;
  uint64_t v19 = (char *)a4 + v17;
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
  uint64_t result = sub_100011AF0();
  __break(1u);
  return result;
}

unint64_t sub_100007B8C(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v33 = a4;
  uint64_t v7 = sub_1000115D0();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin();
  uint64_t v10 = (char *)&v28 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_100011630();
  *(void *)&long long v34 = a2;
  *((void *)&v34 + 1) = a3;
  uint64_t v35 = a1;
  uint64_t v36 = v11;
  uint64_t v37 = v12;
  uint64_t v38 = v13;
  char v39 = 0;
  sub_100011680();
  uint64_t v14 = v36;
  if (v36)
  {
    uint64_t v15 = a3;
    char v16 = v39;
    uint64_t v17 = v37;
    uint64_t v18 = v38;
    uint64_t v19 = v35;
    long long v28 = v34;
    uint64_t v29 = v15;
    uint64_t v20 = sub_100011640();
    long long v21 = v28;
    uint64_t v32 = v8 + 16;
    uint64_t v30 = v20;
    uint64_t v31 = v8 + 8;
    while (1)
    {
      long long v40 = v21;
      uint64_t v41 = v19;
      uint64_t v42 = v14;
      uint64_t v43 = v17;
      uint64_t v44 = v18;
      char v45 = v16 & 1;
      unint64_t result = sub_100011660();
      if (v23)
      {
LABEL_21:
        __break(1u);
        return result;
      }
      if ((result & 0x8000000000000000) != 0)
      {
        __break(1u);
LABEL_19:
        __break(1u);
LABEL_20:
        __break(1u);
        goto LABEL_21;
      }
      uint64_t v24 = *(void *)(v33 + 8);
      if (result >= *(void *)(v24 + 16)) {
        goto LABEL_19;
      }
      (*(void (**)(char *, unint64_t, uint64_t))(v8 + 16))(v10, v24+ ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80))+ *(void *)(v8 + 72) * result, v7);
      sub_1000094AC(&qword_1000186A8, 255, (void (*)(uint64_t))&type metadata accessor for UUID);
      uint64_t v25 = sub_100011960();
      unint64_t result = (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
      uint64_t v26 = 1 << *a2;
      if (__OFSUB__(v26, 1)) {
        goto LABEL_20;
      }
      uint64_t v27 = (v26 - 1) & v25;
      if (a1 >= v30)
      {
        if (v27 < v30) {
          goto LABEL_3;
        }
      }
      else if (v27 >= v30)
      {
        goto LABEL_13;
      }
      if (a1 >= v27)
      {
LABEL_13:
        sub_100011660();
        sub_100011650();
        a1 = v19;
      }
LABEL_3:
      sub_100011680();
      long long v21 = v34;
      uint64_t v19 = v35;
      uint64_t v14 = v36;
      uint64_t v17 = v37;
      uint64_t v18 = v38;
      char v16 = v39;
      if (!v36) {
        return sub_100011650();
      }
    }
  }

  return sub_100011650();
}

void sub_100007EA8(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5)
{
  uint64_t v90 = a5;
  uint64_t v87 = a3;
  uint64_t v8 = sub_1000115D0();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v12 = (char *)v80 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  uint64_t v14 = (char *)v80 - v13;
  uint64_t v15 = sub_100008CD0(&qword_100018680);
  uint64_t v16 = __chkstk_darwin(v15 - 8);
  uint64_t v18 = (char *)v80 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v16);
  uint64_t v20 = (char *)v80 - v19;
  uint64_t v21 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
LABEL_70:
    __break(1u);
    goto LABEL_71;
  }
  if (v21 >= 1)
  {
    uint64_t v22 = *(void *)(v87 + 16);
    uint64_t v23 = v22 - v21;
    if (v22 < v21) {
      ++v23;
    }
    uint64_t v88 = *(void (**)(void, void, void))(v87 + 16);
    if (a1 >= v23 >> 1)
    {
      uint64_t v86 = v9;
      if (__OFSUB__(v22, a2))
      {
LABEL_71:
        __break(1u);
LABEL_72:
        __break(1u);
        goto LABEL_73;
      }
      if (v22 - a2 >= sub_100011690() / 3)
      {
LABEL_35:
        uint64_t v52 = v90;
        uint64_t v53 = sub_100011630();
        uint64_t v54 = 0;
        *(void *)&long long v91 = a4;
        *((void *)&v91 + 1) = v52;
        uint64_t v92 = 0;
        *(void *)&long long v93 = v53;
        *((void *)&v93 + 1) = v55;
        uint64_t v94 = v56;
        char v95 = 0;
        while (1)
        {
          long long v96 = v91;
          uint64_t v97 = v54;
          long long v98 = v93;
          uint64_t v99 = v94;
          char v100 = v95;
          uint64_t v43 = &v96;
          uint64_t v57 = sub_100011660();
          if ((v58 & 1) == 0 && v57 >= a2)
          {
            if (__OFSUB__(v57, v21))
            {
              __break(1u);
              goto LABEL_42;
            }
            sub_100011670();
          }
          sub_100011680();
          uint64_t v54 = v92;
          if (!v92) {
            return;
          }
        }
      }
      if ((uint64_t)v88 < a2) {
        goto LABEL_76;
      }
      uint64_t v43 = (long long *)v86;
      if (a2 < 0)
      {
LABEL_77:
        __break(1u);
        return;
      }
      if (v88 != (void (*)(void, void, void))a2)
      {
LABEL_42:
        uint64_t v89 = a2 - a1;
        uint64_t v85 = (char *)(v87
                     + ((*((unsigned __int8 *)v43 + 80) + 32) & ~(unint64_t)*((unsigned __int8 *)v43 + 80)));
        uint64_t v84 = (unsigned int (**)(char *, uint64_t, uint64_t))(v43 + 1);
        uint64_t v82 = (void (**)(char *, char *, uint64_t))(v43 + 3);
        uint64_t v59 = (void (**)(char *, char *, uint64_t))(v43 + 2);
        uint64_t v60 = (void (**)(char *, uint64_t))v43 + 1;
        swift_retain();
        uint64_t v61 = v88;
        uint64_t v83 = (char *)v43 + 56;
        uint64_t v81 = (void (**)(char *, uint64_t))(((unint64_t)v43 + 56) & 0xFFFFFFFFFFFFLL | 0xA0D1000000000000);
        while (a2 < (uint64_t)v61)
        {
          (*((void (**)(char *, char *, uint64_t))v43 + 2))(v18, &v85[*((void *)v43 + 9) * a2], v8);
          uint64_t v62 = (void (*)(char *, uint64_t, uint64_t, uint64_t))*((void *)v43 + 7);
          v62(v18, 0, 1, v8);
          if ((*((unsigned int (**)(char *, uint64_t, uint64_t))v43 + 6))(v18, 1, v8) == 1) {
            goto LABEL_63;
          }
          (*v59)(v12, v18, v8);
          sub_1000094AC(&qword_1000186A8, 255, (void (*)(uint64_t))&type metadata accessor for UUID);
          uint64_t v63 = sub_100011960();
          uint64_t v64 = 1 << *a4;
          BOOL v32 = __OFSUB__(v64, 1);
          uint64_t v65 = v64 - 1;
          if (v32) {
            goto LABEL_69;
          }
          uint64_t v66 = v65 & v63;
          uint64_t v67 = v90;
          uint64_t v68 = sub_100011630();
          *(void *)&long long v91 = a4;
          *((void *)&v91 + 1) = v67;
          uint64_t v92 = v66;
          *(void *)&long long v93 = v68;
          *((void *)&v93 + 1) = v69;
          uint64_t v94 = v70;
          char v95 = 0;
          if (v68)
          {
            char v71 = 0;
            uint64_t v72 = a4;
            uint64_t v73 = v90;
            do
            {
              *(void *)&long long v96 = v72;
              *((void *)&v96 + 1) = v73;
              uint64_t v97 = v66;
              *(void *)&long long v98 = v68;
              *((void *)&v98 + 1) = v69;
              uint64_t v99 = v70;
              char v100 = v71 & 1;
              uint64_t v74 = sub_100011660();
              if ((v75 & 1) == 0 && v74 == a2) {
                break;
              }
              sub_100011680();
              uint64_t v73 = *((void *)&v91 + 1);
              uint64_t v72 = (void *)v91;
              uint64_t v66 = v92;
              uint64_t v69 = *((void *)&v93 + 1);
              uint64_t v68 = v93;
              uint64_t v70 = v94;
              char v71 = v95;
            }
            while ((void)v93);
          }
          sub_100011670();
          (*v60)(v12, v8);
          ++a2;
          uint64_t v61 = v88;
          uint64_t v43 = (long long *)v86;
          if ((void (*)(void, void, void))a2 == v88)
          {
            v62(v18, 1, 1, v8);
            goto LABEL_63;
          }
        }
        goto LABEL_68;
      }
      uint64_t v44 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v86 + 56);
      swift_retain();
      v44(v18, 1, 1, v8);
LABEL_63:
      swift_release();
    }
    else
    {
      if (sub_100011690() / 3 <= a1)
      {
        uint64_t v45 = v90;
        uint64_t v46 = sub_100011630();
        uint64_t v47 = 0;
        *(void *)&long long v91 = a4;
        *((void *)&v91 + 1) = v45;
        uint64_t v92 = 0;
        *(void *)&long long v93 = v46;
        *((void *)&v93 + 1) = v48;
        uint64_t v94 = v49;
        char v95 = 0;
        while (1)
        {
          long long v96 = v91;
          uint64_t v97 = v47;
          long long v98 = v93;
          uint64_t v99 = v94;
          char v100 = v95;
          uint64_t v50 = sub_100011660();
          if ((v51 & 1) == 0 && v50 < a1)
          {
            if (__OFADD__(v50, v21))
            {
              __break(1u);
              goto LABEL_35;
            }
            sub_100011670();
          }
          sub_100011680();
          uint64_t v47 = v92;
          if (!v92) {
            goto LABEL_56;
          }
        }
      }
      if (a1 < 0) {
        goto LABEL_74;
      }
      if ((unint64_t)v88 < a1)
      {
LABEL_75:
        __break(1u);
LABEL_76:
        __break(1u);
        goto LABEL_77;
      }
      if (a1)
      {
        uint64_t v25 = *(void (**)(void, void, void))(v9 + 16);
        uint64_t v24 = v9 + 16;
        uint64_t v88 = v25;
        uint64_t v89 = a2 - a1;
        uint64_t v86 = v87 + ((*(unsigned __int8 *)(v24 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v24 + 64));
        uint64_t v84 = (unsigned int (**)(char *, uint64_t, uint64_t))(v24 + 32);
        uint64_t v82 = (void (**)(char *, char *, uint64_t))(v24 + 16);
        uint64_t v81 = (void (**)(char *, uint64_t))(v24 - 8);
        uint64_t v83 = *(char **)(v24 + 56);
        swift_retain();
        uint64_t v26 = 0;
        uint64_t v85 = (char *)(v24 + 40);
        v80[1] = (v24 + 40) & 0xFFFFFFFFFFFFLL | 0xA0D1000000000000;
        uint64_t v27 = v90;
        while (v26 != a1)
        {
          v88(v20, v86 + (void)v83 * v26, v8);
          long long v28 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))v85;
          (*(void (**)(char *, void, uint64_t, uint64_t))v85)(v20, 0, 1, v8);
          if ((*v84)(v20, 1, v8) == 1)
          {
            swift_release();
            uint64_t v21 = v89;
            goto LABEL_56;
          }
          uint64_t v29 = v24;
          (*v82)(v14, v20, v8);
          sub_1000094AC(&qword_1000186A8, 255, (void (*)(uint64_t))&type metadata accessor for UUID);
          uint64_t v30 = sub_100011960();
          uint64_t v31 = 1 << *a4;
          BOOL v32 = __OFSUB__(v31, 1);
          uint64_t v33 = v31 - 1;
          if (v32) {
            goto LABEL_66;
          }
          uint64_t v34 = v33 & v30;
          uint64_t v35 = sub_100011630();
          *(void *)&long long v91 = a4;
          *((void *)&v91 + 1) = v27;
          uint64_t v92 = v34;
          *(void *)&long long v93 = v35;
          *((void *)&v93 + 1) = v36;
          uint64_t v94 = v37;
          char v95 = 0;
          if (v35)
          {
            char v38 = 0;
            char v39 = a4;
            uint64_t v40 = v90;
            do
            {
              *(void *)&long long v96 = v39;
              *((void *)&v96 + 1) = v40;
              uint64_t v97 = v34;
              *(void *)&long long v98 = v35;
              *((void *)&v98 + 1) = v36;
              uint64_t v99 = v37;
              char v100 = v38 & 1;
              uint64_t v41 = sub_100011660();
              if ((v42 & 1) == 0 && v41 == v26) {
                break;
              }
              sub_100011680();
              uint64_t v40 = *((void *)&v91 + 1);
              char v39 = (void *)v91;
              uint64_t v34 = v92;
              uint64_t v36 = *((void *)&v93 + 1);
              uint64_t v35 = v93;
              uint64_t v37 = v94;
              char v38 = v95;
            }
            while ((void)v93);
          }
          if (__OFADD__(v26, v89)) {
            goto LABEL_67;
          }
          ++v26;
          sub_100011670();
          (*v81)(v14, v8);
          uint64_t v24 = v29;
          if (v26 == a1)
          {
            uint64_t v21 = v89;
            goto LABEL_54;
          }
        }
        __break(1u);
LABEL_66:
        __break(1u);
LABEL_67:
        __break(1u);
LABEL_68:
        __break(1u);
LABEL_69:
        __break(1u);
        goto LABEL_70;
      }
      long long v28 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56);
      swift_retain();
LABEL_54:
      v28(v20, 1, 1, v8);
      swift_release();
LABEL_56:
      uint64_t v76 = a4[1];
      if (__OFSUB__(v76 >> 6, v21)) {
        goto LABEL_72;
      }
      uint64_t v77 = 1 << *a4;
      BOOL v32 = __OFSUB__(v77, 1);
      uint64_t v78 = v77 - 1;
      if (v32)
      {
LABEL_73:
        __break(1u);
LABEL_74:
        __break(1u);
        goto LABEL_75;
      }
      uint64_t v79 = (v78 & (((v76 >> 6) - v21) >> 63)) + (v76 >> 6) - v21;
      if (v79 < v78) {
        uint64_t v78 = 0;
      }
      a4[1] = a4[1] & 0x3FLL | ((v79 - v78) << 6);
    }
  }
}

uint64_t sub_100008750(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  uint64_t v8 = sub_1000116C0();
  uint64_t v9 = 0;
  if (a3) {
    uint64_t v10 = 0;
  }
  else {
    uint64_t v10 = a2;
  }
  if (v10 <= v8) {
    uint64_t v10 = v8;
  }
  if (v10 <= a4) {
    uint64_t v11 = a4;
  }
  else {
    uint64_t v11 = v10;
  }
  if (v11 >= 5)
  {
    uint64_t v9 = sub_1000116D0();
    sub_1000087E4(v9 + 16, v9 + 32, a1);
  }
  return v9;
}

uint64_t sub_1000087E4(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a3 + 16);
  if (v6)
  {
    uint64_t v3 = (void *)result;
    sub_1000115D0();
    sub_1000094AC(&qword_1000186A8, 255, (void (*)(uint64_t))&type metadata accessor for UUID);
    uint64_t v4 = 0;
    while (1)
    {
      unint64_t result = sub_100011960();
      if (__OFSUB__(1 << *v3, 1)) {
        break;
      }
      if (sub_100011630())
      {
        while (1)
          sub_100011680();
      }
      unint64_t result = sub_100011670();
      if (++v4 == v6) {
        return result;
      }
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_100008974(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_10000794C(a1, a2, a3, (void *)*v3);
  *uint64_t v3 = result;
  return result;
}

void (*sub_100008994(uint64_t (**a1)(), unint64_t a2, uint64_t a3))(void *a1)
{
  uint64_t v6 = (uint64_t (*)())malloc(0x28uLL);
  *a1 = v6;
  *((void *)v6 + 4) = sub_100008A44(v6, a2, a3);
  return sub_1000089FC;
}

void sub_1000089FC(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);

  free(v1);
}

uint64_t (*sub_100008A44(uint64_t (*result)(), unint64_t a2, uint64_t a3))()
{
  uint64_t v3 = (uint64_t *)result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    uint64_t v4 = sub_100011A70();
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
    return sub_100008AC4;
  }
  __break(1u);
  return result;
}

uint64_t sub_100008AC4()
{
  return swift_release();
}

uint64_t sub_100008ACC(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_100011AE0();
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
    uint64_t v10 = sub_100011AE0();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_100008D18();
        swift_bridgeObjectRetain();
        for (unint64_t i = 0; i != v7; ++i)
        {
          sub_100008CD0(&qword_100018648);
          uint64_t v12 = sub_100008994(v16, i, a3);
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
    type metadata accessor for PartnerCloudRequestEvents();
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  uint64_t result = sub_100011AF0();
  __break(1u);
  return result;
}

uint64_t sub_100008CD0(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_100008D18()
{
  unint64_t result = qword_100018650;
  if (!qword_100018650)
  {
    sub_100008D74(&qword_100018648);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018650);
  }
  return result;
}

uint64_t sub_100008D74(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100008DBC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100008CD0(&qword_100018678);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100008E24(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100008CD0(&qword_100018668);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_100008E8C(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

void *sub_100008EC4(uint64_t a1)
{
  id v2 = [objc_allocWithZone((Class)GMSSchemaGMSClientEvent) init];
  if (!v2) {
    return 0;
  }
  uint64_t v3 = v2;
  id v4 = [objc_allocWithZone((Class)GMSSchemaGMSClientEventMetadata) init];
  if (v4)
  {
    uint64_t v5 = v4;
    unint64_t v6 = v3;
    [v4 setGmsId:a1];
    [v3 setEventMetadata:v5];
    id v7 = [objc_allocWithZone((Class)GMSSchemaGMSModelRequestContext) init];
    [v3 setGmsModelRequestContext:v7];

    uint64_t v3 = v7;
  }
  else
  {
    unint64_t v6 = 0;
  }

  return v6;
}

void sub_100008FA4(void *a1)
{
  if (a1)
  {
    id v1 = a1;
    sub_1000115E0();
    if (qword_100018518 != -1) {
      swift_once();
    }
    uint64_t v5 = sub_100011940();
    sub_100008E8C(v5, (uint64_t)qword_100018BC0);
    os_log_t oslog = (os_log_t)v1;
    unint64_t v6 = sub_100011920();
    os_log_type_t v7 = sub_100011A00();
    if (os_log_type_enabled(v6, v7))
    {
      uint64_t v8 = (uint8_t *)swift_slowAlloc();
      uint64_t v15 = swift_slowAlloc();
      *(_DWORD *)uint64_t v8 = 136315138;
      id v9 = [oslog formattedJsonBody];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = sub_1000119A0();
        unint64_t v13 = v12;
      }
      else
      {
        uint64_t v11 = 0;
        unint64_t v13 = 0xE000000000000000;
      }
      sub_10000F408(v11, v13, &v15);
      sub_100011A30();

      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v6, v7, "emit SELF event %s", v8, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      return;
    }
  }
  else
  {
    if (qword_100018518 != -1) {
      swift_once();
    }
    uint64_t v2 = sub_100011940();
    sub_100008E8C(v2, (uint64_t)qword_100018BC0);
    os_log_t oslog = (os_log_t)sub_100011920();
    os_log_type_t v3 = sub_100011A00();
    if (os_log_type_enabled(oslog, v3))
    {
      id v4 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, oslog, v3, "emit nil SELF event", v4, 2u);
      swift_slowDealloc();
    }
  }
}

uint64_t sub_100009410(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100008CD0(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_10000946C()
{
  unint64_t result = qword_1000186C8;
  if (!qword_1000186C8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1000186C8);
  }
  return result;
}

uint64_t sub_1000094AC(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a3(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

void *sub_1000094F4(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_100009538()
{
  uint64_t v1 = sub_1000115F0();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 24) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v5, v6);
}

uint64_t sub_100009604(uint64_t a1)
{
  uint64_t v3 = *(void *)(sub_1000115F0() - 8);
  return sub_1000031AC(a1, v1 + ((*(unsigned __int8 *)(v3 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80)));
}

uint64_t sub_100009670(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_1000096C0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  uint64_t v47 = (uint8_t *)a1;
  uint64_t v48 = a3;
  uint64_t v43 = sub_100008CD0(&qword_1000188E8);
  __chkstk_darwin(v43);
  uint64_t v4 = sub_1000118A0();
  uint64_t v45 = *(void *)(v4 - 8);
  uint64_t v46 = v4;
  __chkstk_darwin(v4);
  uint64_t v44 = (char *)&v43 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100011850();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v43 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __chkstk_darwin(v8);
  unint64_t v13 = (char *)&v43 - v12;
  __chkstk_darwin(v11);
  uint64_t v15 = (char *)&v43 - v14;
  uint64_t v16 = *(void (**)(char *, uint64_t, uint64_t))(v7 + 16);
  v16((char *)&v43 - v14, a2, v6);
  int v17 = (*(uint64_t (**)(char *, uint64_t))(v7 + 88))(v15, v6);
  if (v17 == enum case for GenerativeFunctionsInstrumentationEvent.Subtype.unknown(_:))
  {
    if (qword_100018518 != -1) {
      swift_once();
    }
    uint64_t v18 = sub_100011940();
    sub_100008E8C(v18, (uint64_t)qword_100018BC0);
    v16(v13, a2, v6);
    uint64_t v19 = sub_100011920();
    os_log_type_t v20 = sub_100011A10();
    if (os_log_type_enabled(v19, v20))
    {
      uint64_t v21 = (uint8_t *)swift_slowAlloc();
      uint64_t v50 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v21 = 136315138;
      uint64_t v22 = sub_100011840();
      uint64_t v49 = sub_10000F408(v22, v23, (uint64_t *)&v50);
      sub_100011A30();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v7 + 8))(v13, v6);
      _os_log_impl((void *)&_mh_execute_header, v19, v20, "GenerativeFunctionsInstrumentationEvent.subtype not supported %s", v21, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v7 + 8))(v13, v6);
    }

LABEL_10:
    uint64_t v25 = sub_100008CD0(&qword_100018688);
    return (*(uint64_t (**)(void *, uint64_t, uint64_t, uint64_t))(*(void *)(v25 - 8) + 56))(v48, 1, 1, v25);
  }
  if (v17 == enum case for GenerativeFunctionsInstrumentationEvent.Subtype.start(_:)) {
    return sub_10000D0B0(v48);
  }
  if (v17 == enum case for GenerativeFunctionsInstrumentationEvent.Subtype.end(_:)) {
    return sub_10000ACF4((uint64_t)v47, v48);
  }
  if (v17 == enum case for GenerativeFunctionsInstrumentationEvent.Subtype.fail(_:)) {
    return sub_10000BEF0((uint64_t)v47, v48);
  }
  if (v17 == enum case for GenerativeFunctionsInstrumentationEvent.Subtype.info(_:))
  {
    if (qword_100018518 != -1) {
      swift_once();
    }
    uint64_t v26 = sub_100011940();
    sub_100008E8C(v26, (uint64_t)qword_100018BC0);
    long long v28 = v44;
    uint64_t v27 = v45;
    uint64_t v29 = v46;
    (*(void (**)(char *, uint8_t *, uint64_t))(v45 + 16))(v44, v47, v46);
    uint64_t v30 = sub_100011920();
    os_log_type_t v31 = sub_100011A10();
    if (os_log_type_enabled(v30, v31))
    {
      BOOL v32 = (uint8_t *)swift_slowAlloc();
      uint64_t v50 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)BOOL v32 = 136315138;
      uint64_t v47 = v32 + 4;
      sub_100011870();
      uint64_t v33 = sub_1000119B0();
      uint64_t v49 = sub_10000F408(v33, v34, (uint64_t *)&v50);
      sub_100011A30();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v27 + 8))(v28, v29);
      _os_log_impl((void *)&_mh_execute_header, v30, v31, "GenerativeFunctionsInstrumentationEvent.subtype.info not supported %s", v32, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v27 + 8))(v28, v29);
    }

    goto LABEL_10;
  }
  if (qword_100018518 != -1) {
    swift_once();
  }
  uint64_t v35 = sub_100011940();
  sub_100008E8C(v35, (uint64_t)qword_100018BC0);
  v16(v10, a2, v6);
  uint64_t v36 = sub_100011920();
  os_log_type_t v37 = sub_100011A10();
  if (os_log_type_enabled(v36, v37))
  {
    char v38 = (uint8_t *)swift_slowAlloc();
    uint64_t v47 = (uint8_t *)swift_slowAlloc();
    uint64_t v50 = v47;
    *(_DWORD *)char v38 = 136315138;
    uint64_t v39 = sub_100011840();
    uint64_t v49 = sub_10000F408(v39, v40, (uint64_t *)&v50);
    sub_100011A30();
    swift_bridgeObjectRelease();
    uint64_t v41 = *(void (**)(char *, uint64_t))(v7 + 8);
    v41(v10, v6);
    _os_log_impl((void *)&_mh_execute_header, v36, v37, "GenerativeFunctionsInstrumentationEvent.subtype not supported %s", v38, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    uint64_t v41 = *(void (**)(char *, uint64_t))(v7 + 8);
    v41(v10, v6);
  }

  uint64_t v42 = sub_100008CD0(&qword_100018688);
  (*(void (**)(void *, uint64_t, uint64_t, uint64_t))(*(void *)(v42 - 8) + 56))(v48, 1, 1, v42);
  return ((uint64_t (*)(char *, uint64_t))v41)(v15, v6);
}

uint64_t sub_100009ECC(uint64_t a1)
{
  return sub_100009F38(a1, qword_100018B90);
}

uint64_t sub_100009EF0(uint64_t a1)
{
  return sub_100009F38(a1, qword_100018BA8);
}

uint64_t sub_100009F18(uint64_t a1)
{
  return sub_100009F38(a1, qword_100018BC0);
}

uint64_t sub_100009F38(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100011940();
  sub_100011360(v3, a2);
  sub_100008E8C(v3, (uint64_t)a2);
  return sub_100011930();
}

uint64_t sub_100009FB0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v36 = a1;
  uint64_t v3 = sub_100011580();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = __chkstk_darwin(v3);
  uint64_t v7 = (char *)&v33 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v33 - v8;
  sub_100011560();
  uint64_t v10 = *(void **)(v1 + 16);
  if (v10)
  {
    swift_bridgeObjectRetain();
    NSString v11 = sub_100011990();
    swift_bridgeObjectRelease();
    id v12 = [v10 valueForKey:v11];

    if (v12)
    {
      sub_100011A50();
      swift_unknownObjectRelease();
    }
    else
    {
      memset(v37, 0, sizeof(v37));
    }
    sub_1000113C4((uint64_t)v37, (uint64_t)&v38, &qword_1000188D8);
    if (*((void *)&v39 + 1))
    {
      sub_100009410((uint64_t)&v38, &qword_1000188D8);
      swift_bridgeObjectRetain();
      NSString v13 = sub_100011990();
      swift_bridgeObjectRelease();
      [v10 doubleForKey:v13];
      uint64_t v15 = v14;

      if (qword_100018510 != -1) {
        swift_once();
      }
      uint64_t v16 = sub_100011940();
      sub_100008E8C(v16, (uint64_t)qword_100018BA8);
      swift_retain();
      int v17 = sub_100011920();
      os_log_type_t v18 = sub_100011A00();
      if (os_log_type_enabled(v17, v18))
      {
        uint64_t v19 = swift_slowAlloc();
        uint64_t v34 = swift_slowAlloc();
        *(void *)&long long v38 = v34;
        *(_DWORD *)uint64_t v19 = 136315394;
        uint64_t v35 = v4;
        uint64_t v20 = *(void *)(v2 + 40);
        unint64_t v21 = *(void *)(v2 + 48);
        swift_bridgeObjectRetain();
        *(void *)&v37[0] = sub_10000F408(v20, v21, (uint64_t *)&v38);
        sub_100011A30();
        swift_release();
        swift_bridgeObjectRelease();
        *(_WORD *)(v19 + 12) = 2048;
        *(void *)&v37[0] = v15;
        uint64_t v4 = v35;
        sub_100011A30();
        _os_log_impl((void *)&_mh_execute_header, v17, v18, "The userdefault has key %s with the value %f", (uint8_t *)v19, 0x16u);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {

        swift_release();
      }
      sub_100011530();
      sub_10001148C(&qword_1000188E0, (void (*)(uint64_t))&type metadata accessor for Date);
      if (sub_100011970()) {
        os_log_type_t v31 = v7;
      }
      else {
        os_log_type_t v31 = v9;
      }
      (*(void (**)(uint64_t, char *, uint64_t))(v4 + 16))(v36, v31, v3);
      BOOL v32 = *(void (**)(char *, uint64_t))(v4 + 8);
      v32(v7, v3);
      return ((uint64_t (*)(char *, uint64_t))v32)(v9, v3);
    }
  }
  else
  {
    long long v38 = 0u;
    long long v39 = 0u;
  }
  sub_100009410((uint64_t)&v38, &qword_1000188D8);
  if (qword_100018510 != -1) {
    swift_once();
  }
  uint64_t v22 = sub_100011940();
  sub_100008E8C(v22, (uint64_t)qword_100018BA8);
  swift_retain();
  unint64_t v23 = sub_100011920();
  os_log_type_t v24 = sub_100011A00();
  if (os_log_type_enabled(v23, v24))
  {
    uint64_t v34 = v3;
    uint64_t v25 = (uint8_t *)swift_slowAlloc();
    *(void *)&long long v38 = swift_slowAlloc();
    uint64_t v35 = v4;
    *(_DWORD *)uint64_t v25 = 136315138;
    uint64_t v26 = v9;
    uint64_t v28 = *(void *)(v2 + 40);
    unint64_t v27 = *(void *)(v2 + 48);
    swift_bridgeObjectRetain();
    uint64_t v29 = v28;
    uint64_t v9 = v26;
    *(void *)&v37[0] = sub_10000F408(v29, v27, (uint64_t *)&v38);
    uint64_t v4 = v35;
    sub_100011A30();
    swift_release();
    uint64_t v3 = v34;
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v23, v24, "The userdefault contained no value for %s", v25, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_release();
  }
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v4 + 32))(v36, v9, v3);
}

uint64_t sub_10000A584(uint64_t a1)
{
  unint64_t v3 = v1[4];
  uint64_t v4 = v1[3] & 0xFFFFFFFFFFFFLL;
  if ((v3 & 0x2000000000000000) != 0) {
    uint64_t v4 = HIBYTE(v3) & 0xF;
  }
  if (v4)
  {
    uint64_t v5 = v1;
    sub_100011540();
    if (qword_100018510 != -1) {
      swift_once();
    }
    uint64_t v6 = sub_100011940();
    sub_100008E8C(v6, (uint64_t)qword_100018BA8);
    swift_retain();
    uint64_t v7 = sub_100011920();
    os_log_type_t v8 = sub_100011A00();
    if (os_log_type_enabled(v7, v8))
    {
      uint64_t v9 = swift_slowAlloc();
      uint64_t v29 = swift_slowAlloc();
      *(_DWORD *)uint64_t v9 = 136315394;
      uint64_t v10 = v1[5];
      unint64_t v11 = v1[6];
      swift_bridgeObjectRetain();
      sub_10000F408(v10, v11, &v29);
      sub_100011A30();
      swift_release();
      swift_bridgeObjectRelease();
      *(_WORD *)(v9 + 12) = 2048;
      sub_100011A30();
      _os_log_impl((void *)&_mh_execute_header, v7, v8, "Set key %s to %f", (uint8_t *)v9, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      id v12 = (void *)v1[2];
      if (v12)
      {
LABEL_8:
        id v13 = v12;
        Class isa = sub_1000119E0().super.super.isa;
        swift_bridgeObjectRetain();
        NSString v15 = sub_100011990();
        swift_bridgeObjectRelease();
        [v13 setValue:isa forKey:v15];

LABEL_21:
        uint64_t v28 = sub_100011580();
        return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v28 - 8) + 8))(a1, v28);
      }
    }
    else
    {

      swift_release();
      id v12 = (void *)v1[2];
      if (v12) {
        goto LABEL_8;
      }
    }
    swift_retain_n();
    unint64_t v23 = sub_100011920();
    os_log_type_t v24 = sub_100011A00();
    if (os_log_type_enabled(v23, v24))
    {
      uint64_t v25 = (uint8_t *)swift_slowAlloc();
      uint64_t v29 = swift_slowAlloc();
      *(_DWORD *)uint64_t v25 = 136315138;
      uint64_t v26 = v5[5];
      unint64_t v27 = v5[6];
      swift_bridgeObjectRetain();
      sub_10000F408(v26, v27, &v29);
      sub_100011A30();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v23, v24, "Fail to set key %s due to empty userdefaults", v25, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      swift_release_n();
    }

    goto LABEL_21;
  }
  if (qword_100018510 != -1) {
    swift_once();
  }
  uint64_t v16 = sub_100011940();
  sub_100008E8C(v16, (uint64_t)qword_100018BA8);
  int v17 = sub_100011920();
  os_log_type_t v18 = sub_100011A00();
  if (os_log_type_enabled(v17, v18))
  {
    uint64_t v19 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v19 = 0;
    _os_log_impl((void *)&_mh_execute_header, v17, v18, "Skip userDefault set due to empty identifier", v19, 2u);
    swift_slowDealloc();
  }

  uint64_t v20 = sub_100011580();
  unint64_t v21 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v20 - 8) + 8);

  return v21(a1, v20);
}

uint64_t sub_10000AA60()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return _swift_deallocClassInstance(v0, 56, 7);
}

uint64_t sub_10000AAA8(uint64_t a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v13 = v8 + OBJC_IVAR____TtC15GMSSELFIngestor25PartnerCloudRequestEvents_inferenceStartEvent;
  uint64_t v14 = sub_1000118A0();
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v15 + 56);
  v16(v13, 1, 1, v14);
  v16(v8 + OBJC_IVAR____TtC15GMSSELFIngestor25PartnerCloudRequestEvents_firstTokenEvent, 1, 1, v14);
  v16(v8 + OBJC_IVAR____TtC15GMSSELFIngestor25PartnerCloudRequestEvents_modelInfoEvent, 1, 1, v14);
  v16(v8 + OBJC_IVAR____TtC15GMSSELFIngestor25PartnerCloudRequestEvents_signedInStatusEvent, 1, 1, v14);
  v16(v8 + OBJC_IVAR____TtC15GMSSELFIngestor25PartnerCloudRequestEvents_webSearchStatusEvent, 1, 1, v14);
  uint64_t v17 = v8 + OBJC_IVAR____TtC15GMSSELFIngestor25PartnerCloudRequestEvents_requestIdentifier;
  uint64_t v18 = sub_1000115D0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 32))(v17, a1, v18);
  *(unsigned char *)(v8 + OBJC_IVAR____TtC15GMSSELFIngestor25PartnerCloudRequestEvents_inferenceRequestType) = a2;
  swift_beginAccess();
  sub_100008E24(a3, v13);
  swift_endAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v15 + 32))(v8 + OBJC_IVAR____TtC15GMSSELFIngestor25PartnerCloudRequestEvents_clientRequestStartEvent, a4, v14);
  *(void *)(v8 + OBJC_IVAR____TtC15GMSSELFIngestor25PartnerCloudRequestEvents_ingestor) = a8;
  uint64_t v19 = (void *)(v8 + OBJC_IVAR____TtC15GMSSELFIngestor25PartnerCloudRequestEvents_eventType);
  *uint64_t v19 = a5;
  v19[1] = a6;
  sub_1000113C4(a7, v8 + OBJC_IVAR____TtC15GMSSELFIngestor25PartnerCloudRequestEvents_eventSubType, &qword_100018678);
  return v8;
}

uint64_t sub_10000ACF4@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v130 = a1;
  v131 = a2;
  uint64_t v3 = sub_100011740();
  __chkstk_darwin(v3 - 8);
  uint64_t v126 = (char *)&v114 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v123 = sub_1000118A0();
  uint64_t v122 = *(void *)(v123 - 8);
  __chkstk_darwin(v123);
  uint64_t v120 = (char *)&v114 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1000118D0();
  uint64_t v124 = *(void *)(v6 - 8);
  uint64_t v125 = v6;
  __chkstk_darwin(v6);
  v121 = (char *)&v114 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100008CD0(&qword_1000188E8);
  uint64_t v9 = __chkstk_darwin(v8 - 8);
  unint64_t v11 = (uint64_t *)((char *)&v114 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v12 = __chkstk_darwin(v9);
  uint64_t v128 = (uint64_t)&v114 - v13;
  __chkstk_darwin(v12);
  v127 = (char *)&v114 - v14;
  uint64_t v15 = sub_1000117E0();
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = __chkstk_darwin(v15);
  uint64_t v19 = (char *)&v114 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v17);
  unint64_t v21 = (char *)&v114 - v20;
  uint64_t v22 = *(void *)(v2 + OBJC_IVAR____TtC15GMSSELFIngestor25PartnerCloudRequestEvents_ingestor);
  uint64_t v132 = v2;
  uint64_t v23 = v2 + OBJC_IVAR____TtC15GMSSELFIngestor25PartnerCloudRequestEvents_requestIdentifier;
  id v24 = objc_allocWithZone((Class)SISchemaUUID);
  uint64_t v129 = v23;
  Class isa = sub_1000115B0().super.isa;
  id v26 = [v24 initWithNSUUID:isa];

  unint64_t v27 = sub_100008EC4((uint64_t)v26);
  if (!v27) {
    goto LABEL_14;
  }
  id v28 = [objc_allocWithZone((Class)GMSSchemaGMSModelRequestEnded) init];
  if (!v28)
  {
    uint64_t v29 = v27;
LABEL_13:

LABEL_14:
    if (qword_100018518 != -1) {
      swift_once();
    }
    uint64_t v42 = sub_100011940();
    sub_100008E8C(v42, (uint64_t)qword_100018BC0);
    swift_retain_n();
    uint64_t v43 = sub_100011920();
    os_log_type_t v44 = sub_100011A10();
    if (os_log_type_enabled(v43, v44))
    {
      uint64_t v45 = (uint8_t *)swift_slowAlloc();
      v136[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v45 = 136315138;
      sub_1000115D0();
      sub_10001148C(&qword_100018690, (void (*)(uint64_t))&type metadata accessor for UUID);
      uint64_t v46 = sub_100011B20();
      uint64_t v135 = sub_10000F408(v46, v47, v136);
      sub_100011A30();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v43, v44, "Latency can't be computed for request %s", v45, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_release_n();
    }
    goto LABEL_19;
  }
  uint64_t v29 = v28;
  uint64_t v30 = v132 + OBJC_IVAR____TtC15GMSSELFIngestor25PartnerCloudRequestEvents_clientRequestStartEvent;
  uint64_t v31 = GenerativeFunctionsInstrumentationEvent.latency(since:)(v132 + OBJC_IVAR____TtC15GMSSELFIngestor25PartnerCloudRequestEvents_clientRequestStartEvent);
  if (v32)
  {

    goto LABEL_13;
  }
  double v116 = *(double *)&v31;
  id v118 = v27;
  id v119 = v29;
  uint64_t v117 = v30;
  sub_1000117F0();
  uint64_t v33 = sub_1000117A0();
  id v35 = v34;
  uint64_t v36 = *(void (**)(char *, uint64_t))(v16 + 8);
  v36(v21, v15);
  if (!v35)
  {
    if (qword_100018518 != -1) {
      swift_once();
    }
    uint64_t v92 = sub_100011940();
    long long v93 = qword_100018BC0;
    goto LABEL_45;
  }
  if (*(unsigned char *)(v22 + 16) == 1)
  {
    swift_bridgeObjectRetain();
    BOOL v37 = sub_100002F98(v33, v35);
    swift_bridgeObjectRelease();
    if (!v37 && (*(unsigned char *)(v22 + 16) & 1) != 0)
    {
      if (qword_100018518 == -1)
      {
LABEL_9:
        uint64_t v38 = sub_100011940();
        sub_100008E8C(v38, (uint64_t)qword_100018BC0);
        swift_bridgeObjectRetain();
        long long v39 = sub_100011920();
        os_log_type_t v40 = sub_100011A10();
        if (os_log_type_enabled(v39, v40))
        {
          uint64_t v41 = (uint8_t *)swift_slowAlloc();
          v136[0] = swift_slowAlloc();
          *(_DWORD *)uint64_t v41 = 136315138;
          swift_bridgeObjectRetain();
          uint64_t v135 = sub_10000F408(v33, (unint64_t)v35, v136);
          sub_100011A30();
          swift_bridgeObjectRelease_n();
          _os_log_impl((void *)&_mh_execute_header, v39, v40, "Should not log for this useCaseString:%s", v41, 0xCu);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();

LABEL_19:
          uint64_t v48 = sub_100008CD0(&qword_100018688);
          return (*(uint64_t (**)(void *, uint64_t, uint64_t, uint64_t))(*(void *)(v48 - 8) + 56))(v131, 1, 1, v48);
        }

        swift_bridgeObjectRelease_n();
        goto LABEL_48;
      }
LABEL_82:
      swift_once();
      goto LABEL_9;
    }
  }
  swift_bridgeObjectRelease();
  sub_1000117F0();
  sub_1000117A0();
  uint64_t v51 = v50;
  v36(v19, v15);
  if (!v51)
  {
    if (qword_100018508 != -1) {
      swift_once();
    }
    uint64_t v92 = sub_100011940();
    long long v93 = qword_100018B90;
LABEL_45:
    sub_100008E8C(v92, (uint64_t)v93);
    swift_retain_n();
    uint64_t v94 = sub_100011920();
    os_log_type_t v95 = sub_100011A10();
    if (os_log_type_enabled(v94, v95))
    {
      long long v96 = (uint8_t *)swift_slowAlloc();
      v136[0] = swift_slowAlloc();
      *(_DWORD *)long long v96 = 136315138;
      sub_1000115D0();
      sub_10001148C(&qword_100018690, (void (*)(uint64_t))&type metadata accessor for UUID);
      uint64_t v97 = sub_100011B20();
      uint64_t v135 = sub_10000F408(v97, v98, v136);
      sub_100011A30();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v94, v95, "useCaseIdentifier missing for request %s", v96, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      goto LABEL_19;
    }

    swift_release_n();
LABEL_48:

    goto LABEL_19;
  }
  swift_bridgeObjectRelease();
  uint64_t v52 = (uint64_t)v127;
  sub_100011870();
  uint64_t v53 = v128;
  sub_100011428(v52, v128, &qword_1000188E8);
  uint64_t v54 = sub_100011910();
  uint64_t v55 = *(void *)(v54 - 8);
  int v56 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v55 + 48))(v53, 1, v54);
  id v57 = v118;
  if (v56 != 1)
  {
    sub_100011428(v53, (uint64_t)v11, &qword_1000188E8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t))(v55 + 88))(v11, v54) == enum case for GenerativeFunctionsInstrumentationMetadata.tgiExecuteRequest(_:))
    {
      (*(void (**)(uint64_t *, uint64_t))(v55 + 96))(v11, v54);
      uint64_t v114 = *v11;
      uint64_t v58 = swift_projectBox();
      uint64_t v59 = v121;
      (*(void (**)(char *, uint64_t, uint64_t))(v124 + 16))(v121, v58, v125);
      uint64_t v60 = sub_1000118C0();
      if (v61) {
        uint64_t v62 = 0;
      }
      else {
        uint64_t v62 = v60;
      }
      unint64_t v115 = v62;
      uint64_t v63 = sub_1000118B0();
      if (v64) {
        unint64_t v65 = 0;
      }
      else {
        unint64_t v65 = v63;
      }
      uint64_t v33 = v132;
      uint64_t v66 = v132 + OBJC_IVAR____TtC15GMSSELFIngestor25PartnerCloudRequestEvents_inferenceStartEvent;
      swift_beginAccess();
      uint64_t v67 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v122 + 48);
      uint64_t v68 = v123;
      double v69 = 0.0;
      if (!v67(v66, 1, v123))
      {
        uint64_t v70 = v122;
        uint64_t v71 = v33;
        unint64_t v72 = v65;
        uint64_t v73 = v120;
        (*(void (**)(char *, uint64_t, uint64_t))(v122 + 16))(v120, v66, v68);
        double v74 = COERCE_DOUBLE(GenerativeFunctionsInstrumentationEvent.latency(since:)(v117));
        char v76 = v75;
        uint64_t v77 = v70;
        uint64_t v59 = v121;
        uint64_t v78 = v73;
        unint64_t v65 = v72;
        uint64_t v33 = v71;
        (*(void (**)(char *, uint64_t))(v77 + 8))(v78, v123);
        BOOL v79 = (v76 & 1) == 0;
        uint64_t v68 = v123;
        if (v79) {
          double v69 = v74;
        }
        else {
          double v69 = 0.0;
        }
      }
      uint64_t v80 = v33 + OBJC_IVAR____TtC15GMSSELFIngestor25PartnerCloudRequestEvents_firstTokenEvent;
      swift_beginAccess();
      if (v67(v80, 1, v68)) {
        goto LABEL_50;
      }
      uint64_t v81 = v122;
      uint64_t v82 = v33;
      unint64_t v83 = v65;
      uint64_t v84 = v120;
      (*(void (**)(char *, uint64_t, uint64_t))(v122 + 16))(v120, v80, v68);
      uint64_t v85 = v68;
      *(double *)&uint64_t v86 = COERCE_DOUBLE(GenerativeFunctionsInstrumentationEvent.latency(since:)(v117));
      char v88 = v87;
      uint64_t v89 = v84;
      unint64_t v65 = v83;
      uint64_t v33 = v82;
      (*(void (**)(char *, uint64_t))(v81 + 8))(v89, v85);
      if (v88)
      {
LABEL_50:
        double v90 = 0.0;
        id v35 = v119;
        uint64_t v91 = v115;
        if ((v115 & 0x8000000000000000) == 0 && (v65 & 0x8000000000000000) == 0 && v69 >= 0.0)
        {
          if (HIDWORD(v115))
          {
LABEL_68:
            sub_100011AD0();
            __break(1u);
            goto LABEL_69;
          }
          [v119 setResponseTokensCount:v115];
LABEL_67:
          if (!HIDWORD(v65)) {
            goto LABEL_70;
          }
          goto LABEL_68;
        }
      }
      else
      {
        double v90 = *(double *)&v86;
        uint64_t v91 = v115;
        if ((v115 & 0x8000000000000000) != 0)
        {
          id v35 = v119;
        }
        else
        {
          id v35 = v119;
          if ((v65 & 0x8000000000000000) == 0 && v69 >= 0.0) {
            goto LABEL_63;
          }
        }
      }
      if (qword_100018518 != -1) {
        swift_once();
      }
      uint64_t v99 = sub_100011940();
      sub_100008E8C(v99, (uint64_t)qword_100018BC0);
      swift_retain_n();
      char v100 = sub_100011920();
      os_log_type_t v101 = sub_100011A10();
      if (os_log_type_enabled(v100, v101))
      {
        uint64_t v102 = swift_slowAlloc();
        uint64_t v134 = swift_slowAlloc();
        *(_DWORD *)uint64_t v102 = 136315906;
        sub_1000115D0();
        sub_10001148C(&qword_100018690, (void (*)(uint64_t))&type metadata accessor for UUID);
        uint64_t v103 = sub_100011B20();
        uint64_t v133 = sub_10000F408(v103, v104, &v134);
        sub_100011A30();
        swift_release_n();
        swift_bridgeObjectRelease();
        *(_WORD *)(v102 + 12) = 2048;
        uint64_t v133 = v115;
        sub_100011A30();
        *(_WORD *)(v102 + 22) = 2048;
        uint64_t v133 = v65;
        sub_100011A30();
        *(_WORD *)(v102 + 32) = 2048;
        uint64_t v133 = *(void *)&v69;
        uint64_t v59 = v121;
        sub_100011A30();
        _os_log_impl((void *)&_mh_execute_header, v100, v101, "Negative values encountered for request %s:\noutputTokens: %lld\noutputImages: %lld\nresponseTime: %f", (uint8_t *)v102, 0x2Au);
        swift_arrayDestroy();
        uint64_t v91 = v115;
        swift_slowDealloc();
        id v35 = v119;
        swift_slowDealloc();
      }
      else
      {

        swift_release_n();
      }
      id v57 = v118;
      if (v91 < 0)
      {
        uint64_t v105 = 0;
LABEL_66:
        [v35 setResponseTokensCount:v105];
        if ((v65 & 0x8000000000000000) != 0)
        {
LABEL_69:
          unint64_t v65 = 0;
LABEL_70:
          [v35 setImageCount:v65];
          double v106 = 0.0;
          if (v69 >= 0.0) {
            double v106 = v69;
          }
          if ((~*(void *)&v106 & 0x7FF0000000000000) != 0)
          {
            if (v106 > -1.0)
            {
              if (v106 < 4294967300.0)
              {
                double v107 = v116;
                [v35 setResponseTimeInMilliseconds:v106];
                [v35 setTimeToFirstTokenInSeconds:v90 / 1000.0];
                [v35 setTimeToLastTokenInSeconds:v107 / 1000.0];
                [v35 setTokensPerSecond:(double)(v91 & ~(v91 >> 63)) * 1000.0 / v107];
                (*(void (**)(char *, uint64_t))(v124 + 8))(v59, v125);
                swift_release();
                uint64_t v53 = v128;
                goto LABEL_76;
              }
LABEL_81:
              __break(1u);
              goto LABEL_82;
            }
          }
          else
          {
            __break(1u);
          }
          __break(1u);
          goto LABEL_81;
        }
        goto LABEL_67;
      }
LABEL_63:
      uint64_t v105 = v91;
      if (HIDWORD(v91)) {
        goto LABEL_68;
      }
      goto LABEL_66;
    }
    (*(void (**)(uint64_t *, uint64_t))(v55 + 8))(v11, v54);
  }
LABEL_76:
  sub_100009410(v53, &qword_1000188E8);
  id v108 = [v57 gmsModelRequestContext];
  id v109 = v119;
  if (v108)
  {
    unsigned int v110 = v108;
    [v108 setEnded:v119];
  }
  uint64_t v111 = sub_100008CD0(&qword_100018688);
  v112 = v131;
  void *v131 = v57;
  id v113 = v57;
  sub_100011890();
  sub_100011610();

  sub_100009410(v52, &qword_1000188E8);
  return (*(uint64_t (**)(void *, void, uint64_t, uint64_t))(*(void *)(v111 - 8) + 56))(v112, 0, 1, v111);
}

uint64_t sub_10000BEF0@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v114 = a1;
  unint64_t v115 = a2;
  uint64_t v3 = sub_100011740();
  __chkstk_darwin(v3 - 8);
  uint64_t v105 = (char *)&v98 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v99 = sub_100011780();
  uint64_t v101 = *(void *)(v99 - 8);
  __chkstk_darwin(v99);
  char v100 = (char *)&v98 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100008CD0(&qword_1000188F0);
  __chkstk_darwin(v6 - 8);
  unint64_t v104 = (char *)&v98 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100011790();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v106 = v8;
  uint64_t v107 = v9;
  uint64_t v10 = __chkstk_darwin(v8);
  uint64_t v102 = (char *)&v98 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  uint64_t v103 = (char *)&v98 - v12;
  uint64_t v13 = sub_1000117E0();
  uint64_t v110 = *(void *)(v13 - 8);
  uint64_t v111 = v13;
  __chkstk_darwin(v13);
  id v109 = (char *)&v98 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_100011850();
  uint64_t v16 = *(void *)(v15 - 8);
  __chkstk_darwin(v15);
  uint64_t v18 = (char *)&v98 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_100008CD0(&qword_100018670);
  __chkstk_darwin(v19);
  unint64_t v21 = (char *)&v98 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = sub_100008CD0(&qword_100018678);
  uint64_t v23 = __chkstk_darwin(v22 - 8);
  uint64_t v25 = (char *)&v98 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = __chkstk_darwin(v23);
  id v28 = (char *)&v98 - v27;
  __chkstk_darwin(v26);
  uint64_t v30 = (char *)&v98 - v29;
  uint64_t v108 = *(void *)(v2 + OBJC_IVAR____TtC15GMSSELFIngestor25PartnerCloudRequestEvents_ingestor);
  uint64_t v116 = v2;
  uint64_t v31 = v2 + OBJC_IVAR____TtC15GMSSELFIngestor25PartnerCloudRequestEvents_requestIdentifier;
  id v32 = objc_allocWithZone((Class)SISchemaUUID);
  uint64_t v113 = v31;
  Class isa = sub_1000115B0().super.isa;
  id v34 = [v32 initWithNSUUID:isa];

  id v35 = sub_100008EC4((uint64_t)v34);
  if (!v35) {
    goto LABEL_20;
  }
  id v112 = v35;
  uint64_t v36 = v116 + OBJC_IVAR____TtC15GMSSELFIngestor25PartnerCloudRequestEvents_clientRequestStartEvent;
  GenerativeFunctionsInstrumentationEvent.latency(since:)(v116 + OBJC_IVAR____TtC15GMSSELFIngestor25PartnerCloudRequestEvents_clientRequestStartEvent);
  if (v37)
  {
LABEL_19:

LABEL_20:
    if (qword_100018518 != -1) {
      swift_once();
    }
    uint64_t v54 = sub_100011940();
    sub_100008E8C(v54, (uint64_t)qword_100018BC0);
    swift_retain_n();
    uint64_t v55 = sub_100011920();
    os_log_type_t v56 = sub_100011A10();
    if (os_log_type_enabled(v55, v56))
    {
      id v57 = (uint8_t *)swift_slowAlloc();
      v118[0] = swift_slowAlloc();
      *(_DWORD *)id v57 = 136315138;
      sub_1000115D0();
      sub_10001148C(&qword_100018690, (void (*)(uint64_t))&type metadata accessor for UUID);
      uint64_t v58 = sub_100011B20();
      uint64_t v117 = sub_10000F408(v58, v59, v118);
      sub_100011A30();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v55, v56, "Latency can't be computed for request %s", v57, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_release_n();
    }
    goto LABEL_25;
  }
  uint64_t v98 = v36;
  sub_100011860();
  (*(void (**)(char *, void, uint64_t))(v16 + 104))(v28, enum case for GenerativeFunctionsInstrumentationEvent.Subtype.fail(_:), v15);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v16 + 56))(v28, 0, 1, v15);
  uint64_t v38 = (uint64_t)&v21[*(int *)(v19 + 48)];
  sub_100011428((uint64_t)v30, (uint64_t)v21, &qword_100018678);
  sub_100011428((uint64_t)v28, v38, &qword_100018678);
  long long v39 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v16 + 48);
  if (v39((uint64_t)v21, 1, v15) == 1)
  {
    sub_100009410((uint64_t)v28, &qword_100018678);
    sub_100009410((uint64_t)v30, &qword_100018678);
    if (v39(v38, 1, v15) == 1)
    {
      sub_100009410((uint64_t)v21, &qword_100018678);
      goto LABEL_10;
    }
    goto LABEL_8;
  }
  sub_100011428((uint64_t)v21, (uint64_t)v25, &qword_100018678);
  if (v39(v38, 1, v15) == 1)
  {
    sub_100009410((uint64_t)v28, &qword_100018678);
    sub_100009410((uint64_t)v30, &qword_100018678);
    (*(void (**)(char *, uint64_t))(v16 + 8))(v25, v15);
LABEL_8:
    sub_100009410((uint64_t)v21, &qword_100018670);
    goto LABEL_19;
  }
  (*(void (**)(char *, uint64_t, uint64_t))(v16 + 32))(v18, v38, v15);
  sub_10001148C(&qword_100018698, (void (*)(uint64_t))&type metadata accessor for GenerativeFunctionsInstrumentationEvent.Subtype);
  char v40 = sub_100011980();
  uint64_t v41 = *(void (**)(char *, uint64_t))(v16 + 8);
  v41(v18, v15);
  sub_100009410((uint64_t)v28, &qword_100018678);
  sub_100009410((uint64_t)v30, &qword_100018678);
  v41(v25, v15);
  sub_100009410((uint64_t)v21, &qword_100018678);
  if ((v40 & 1) == 0) {
    goto LABEL_19;
  }
LABEL_10:
  id v42 = [objc_allocWithZone((Class)GMSSchemaGMSModelRequestFailed) init];
  if (!v42) {
    goto LABEL_19;
  }
  uint64_t v43 = v42;
  os_log_type_t v44 = v109;
  sub_1000117F0();
  uint64_t v45 = sub_1000117A0();
  unint64_t v47 = v46;
  (*(void (**)(char *, uint64_t))(v110 + 8))(v44, v111);
  if (!v47)
  {
    if (qword_100018518 != -1) {
      swift_once();
    }
    uint64_t v66 = sub_100011940();
    sub_100008E8C(v66, (uint64_t)qword_100018BC0);
    swift_retain_n();
    uint64_t v67 = sub_100011920();
    os_log_type_t v68 = sub_100011A10();
    if (os_log_type_enabled(v67, v68))
    {
      double v69 = (uint8_t *)swift_slowAlloc();
      v118[0] = swift_slowAlloc();
      *(_DWORD *)double v69 = 136315138;
      sub_1000115D0();
      sub_10001148C(&qword_100018690, (void (*)(uint64_t))&type metadata accessor for UUID);
      uint64_t v70 = sub_100011B20();
      uint64_t v117 = sub_10000F408(v70, v71, v118);
      sub_100011A30();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v67, v68, "useCaseIdentifier missing for request %s", v69, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      goto LABEL_25;
    }

    swift_release_n();
LABEL_39:

    goto LABEL_25;
  }
  uint64_t v48 = v108;
  if (*(unsigned char *)(v108 + 16) == 1)
  {
    swift_bridgeObjectRetain();
    BOOL v49 = sub_100002F98(v45, v47);
    swift_bridgeObjectRelease();
    if (!v49 && (*(unsigned char *)(v48 + 16) & 1) != 0)
    {
      if (qword_100018518 != -1) {
        swift_once();
      }
      uint64_t v50 = sub_100011940();
      sub_100008E8C(v50, (uint64_t)qword_100018BC0);
      swift_bridgeObjectRetain();
      uint64_t v51 = sub_100011920();
      os_log_type_t v52 = sub_100011A10();
      if (os_log_type_enabled(v51, v52))
      {
        uint64_t v53 = (uint8_t *)swift_slowAlloc();
        v118[0] = swift_slowAlloc();
        *(_DWORD *)uint64_t v53 = 136315138;
        swift_bridgeObjectRetain();
        uint64_t v117 = sub_10000F408(v45, (unint64_t)v47, v118);
        sub_100011A30();
        swift_bridgeObjectRelease_n();
        _os_log_impl((void *)&_mh_execute_header, v51, v52, "Should not log for this useCaseString:%s", v53, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

LABEL_25:
        uint64_t v60 = sub_100008CD0(&qword_100018688);
        return (*(uint64_t (**)(void *, uint64_t, uint64_t, uint64_t))(*(void *)(v60 - 8) + 56))(v115, 1, 1, v60);
      }

      swift_bridgeObjectRelease_n();
      goto LABEL_39;
    }
  }
  swift_bridgeObjectRelease();
  uint64_t v62 = (uint64_t)v104;
  sub_100011830();
  uint64_t v64 = v106;
  uint64_t v63 = v107;
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v107 + 48))(v62, 1, v106) == 1)
  {
    sub_100009410(v62, &qword_1000188F0);
    id v65 = v112;
    goto LABEL_43;
  }
  unint64_t v72 = v103;
  (*(void (**)(char *, uint64_t, uint64_t))(v63 + 32))(v103, v62, v64);
  uint64_t v73 = v102;
  (*(void (**)(char *, char *, uint64_t))(v63 + 16))(v102, v72, v64);
  if ((*(unsigned int (**)(char *, uint64_t))(v63 + 88))(v73, v64) != enum case for GenerativeFunctionsInstrumentationError.genericError(_:))
  {
    (*(void (**)(char *, uint64_t))(v63 + 8))(v73, v64);
LABEL_42:
    id v65 = v112;
    [v43 setErrorDomain:0];
    [v43 setGmsErrorCode:0];
    (*(void (**)(char *, uint64_t))(v63 + 8))(v72, v64);
    goto LABEL_43;
  }
  (*(void (**)(char *, uint64_t))(v63 + 96))(v73, v64);
  uint64_t v74 = swift_projectBox();
  char v75 = v100;
  uint64_t v76 = v101;
  uint64_t v77 = v99;
  (*(void (**)(char *, uint64_t, uint64_t))(v101 + 16))(v100, v74, v99);
  swift_release();
  uint64_t v78 = sub_100011770();
  if (!v79)
  {
    (*(void (**)(char *, uint64_t))(v76 + 8))(v75, v77);
    goto LABEL_42;
  }
  uint64_t v80 = v78;
  uint64_t v81 = v79;
  uint64_t v82 = sub_100011760();
  if (v83)
  {
    swift_bridgeObjectRelease();
    id v65 = v112;
  }
  else
  {
    unint64_t v84 = v82;
    uint64_t v85 = sub_10000FF44(v80, v81);
    swift_bridgeObjectRelease();
    [v43 setErrorDomain:v85];
    if ((v84 & 0x8000000000000000) != 0)
    {
      if (qword_100018518 != -1) {
        swift_once();
      }
      uint64_t v91 = sub_100011940();
      sub_100008E8C(v91, (uint64_t)qword_100018BC0);
      swift_retain_n();
      uint64_t v92 = sub_100011920();
      os_log_type_t v93 = sub_100011A10();
      if (os_log_type_enabled(v92, v93))
      {
        uint64_t v94 = swift_slowAlloc();
        uint64_t v95 = swift_slowAlloc();
        uint64_t v117 = v84;
        v118[0] = v95;
        *(_DWORD *)uint64_t v94 = 134218242;
        sub_100011A30();
        *(_WORD *)(v94 + 12) = 2080;
        sub_1000115D0();
        sub_10001148C(&qword_100018690, (void (*)(uint64_t))&type metadata accessor for UUID);
        uint64_t v77 = v99;
        uint64_t v96 = sub_100011B20();
        uint64_t v117 = sub_10000F408(v96, v97, v118);
        uint64_t v64 = v106;
        sub_100011A30();
        swift_release_n();
        swift_bridgeObjectRelease();
        _os_log_impl((void *)&_mh_execute_header, v92, v93, "Negative error code (%lld) encountered for request %s, defaulting to 0", (uint8_t *)v94, 0x16u);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {

        swift_release_n();
      }
      unint64_t v84 = 0;
      id v65 = v112;
      uint64_t v63 = v107;
    }
    else
    {
      if (HIDWORD(v84))
      {
        uint64_t result = sub_100011AD0();
        __break(1u);
        return result;
      }
      id v65 = v112;
    }
    [v43 setGmsErrorCode:v84];
  }
  (*(void (**)(char *, uint64_t))(v101 + 8))(v100, v77);
  (*(void (**)(char *, uint64_t))(v63 + 8))(v103, v64);
LABEL_43:
  id v86 = [v65 gmsModelRequestContext];
  if (v86)
  {
    char v87 = v86;
    [v86 setFailed:v43];
  }
  uint64_t v88 = sub_100008CD0(&qword_100018688);
  uint64_t v89 = v115;
  *unint64_t v115 = v65;
  id v90 = v65;
  sub_100011890();
  sub_100011610();

  return (*(uint64_t (**)(void *, void, uint64_t, uint64_t))(*(void *)(v88 - 8) + 56))(v89, 0, 1, v88);
}

uint64_t sub_10000D0B0@<X0>(void *a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v139 = a1;
  uint64_t v3 = sub_100011740();
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)v118 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100008CD0(&qword_100018680);
  __chkstk_darwin(v6 - 8);
  v131 = (char *)v118 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v138 = sub_1000115D0();
  uint64_t v132 = *(void *)(v138 - 8);
  __chkstk_darwin(v138);
  uint64_t v130 = (char *)v118 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_100008CD0(&qword_1000188F8);
  uint64_t v10 = __chkstk_darwin(v9 - 8);
  uint64_t v128 = (char *)v118 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  uint64_t v126 = (char *)v118 - v12;
  uint64_t v13 = sub_100008CD0(&qword_1000188E8);
  uint64_t v14 = __chkstk_darwin(v13 - 8);
  uint64_t v133 = (char *)v118 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  uint64_t v17 = (char *)v118 - v16;
  uint64_t v129 = sub_100011900();
  uint64_t v124 = *(void *)(v129 - 8);
  uint64_t v18 = __chkstk_darwin(v129);
  uint64_t v123 = (char *)v118 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v18);
  unint64_t v21 = (char *)v118 - v20;
  uint64_t v22 = sub_1000117E0();
  uint64_t v23 = *(void *)(v22 - 8);
  uint64_t v24 = __chkstk_darwin(v22);
  uint64_t v134 = (char *)v118 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = __chkstk_darwin(v24);
  v127 = (char *)v118 - v27;
  uint64_t v28 = __chkstk_darwin(v26);
  uint64_t v125 = (char *)v118 - v29;
  __chkstk_darwin(v28);
  uint64_t v31 = (char *)v118 - v30;
  uint64_t v32 = *(void *)(v1 + OBJC_IVAR____TtC15GMSSELFIngestor25PartnerCloudRequestEvents_ingestor);
  uint64_t v33 = v1 + OBJC_IVAR____TtC15GMSSELFIngestor25PartnerCloudRequestEvents_requestIdentifier;
  id v34 = objc_allocWithZone((Class)SISchemaUUID);
  uint64_t v137 = v33;
  Class isa = sub_1000115B0().super.isa;
  id v36 = [v34 initWithNSUUID:isa];

  char v37 = sub_100008EC4((uint64_t)v36);
  if (!v37) {
    goto LABEL_14;
  }
  id v136 = v37;
  uint64_t v122 = v5;
  uint64_t v121 = v2 + OBJC_IVAR____TtC15GMSSELFIngestor25PartnerCloudRequestEvents_clientRequestStartEvent;
  sub_1000117F0();
  uint64_t v38 = sub_1000117A0();
  char v40 = v39;
  uint64_t v43 = *(void (**)(char *, uint64_t))(v23 + 8);
  uint64_t v42 = v23 + 8;
  uint64_t v41 = v43;
  uint64_t v120 = v22;
  v43(v31, v22);
  if (!v40)
  {

LABEL_14:
    if (qword_100018518 != -1) {
      swift_once();
    }
    uint64_t v51 = sub_100011940();
    sub_100008E8C(v51, (uint64_t)qword_100018BC0);
    swift_retain_n();
    os_log_type_t v52 = sub_100011920();
    os_log_type_t v53 = sub_100011A10();
    if (os_log_type_enabled(v52, v53))
    {
      uint64_t v54 = (uint8_t *)swift_slowAlloc();
      v140[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v54 = 136315138;
      sub_10001148C(&qword_100018690, (void (*)(uint64_t))&type metadata accessor for UUID);
      uint64_t v55 = sub_100011B20();
      uint64_t v141 = sub_10000F408(v55, v56, v140);
      sub_100011A30();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v52, v53, "useCaseIdentifier missing for request %s", v54, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_release_n();
    }
    goto LABEL_19;
  }
  id v119 = v41;
  if (*(unsigned char *)(v32 + 16))
  {
    swift_bridgeObjectRetain();
    BOOL v44 = sub_100002F98(v38, v40);
    swift_bridgeObjectRelease();
    if (!v44 && (*(unsigned char *)(v32 + 16) & 1) != 0)
    {
      if (qword_100018518 != -1) {
        swift_once();
      }
      uint64_t v45 = sub_100011940();
      sub_100008E8C(v45, (uint64_t)qword_100018BC0);
      swift_bridgeObjectRetain();
      uint64_t v46 = sub_100011920();
      os_log_type_t v47 = sub_100011A10();
      if (os_log_type_enabled(v46, v47))
      {
        uint64_t v48 = (uint8_t *)swift_slowAlloc();
        v140[0] = swift_slowAlloc();
        *(_DWORD *)uint64_t v48 = 136315138;
        swift_bridgeObjectRetain();
        uint64_t v141 = sub_10000F408(v38, (unint64_t)v40, v140);
        sub_100011A30();
        swift_bridgeObjectRelease_n();
        _os_log_impl((void *)&_mh_execute_header, v46, v47, "Should not log for this useCaseString:%s", v48, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
LABEL_19:
      id v57 = v139;
      uint64_t v58 = sub_100008CD0(&qword_100018688);
      return (*(uint64_t (**)(void *, uint64_t, uint64_t, uint64_t))(*(void *)(v58 - 8) + 56))(v57, 1, 1, v58);
    }
  }
  id v49 = [objc_allocWithZone((Class)GMSSchemaGMSModelRequestStarted) init];
  switch(sub_10000FEF8(v38, v40))
  {
    case 1u:
      if (v49)
      {
        uint64_t v50 = 2;
        goto LABEL_28;
      }
      break;
    case 2u:
      if (v49)
      {
        uint64_t v50 = 3;
        goto LABEL_28;
      }
      break;
    case 3u:
      if (v49)
      {
        uint64_t v50 = 4;
        goto LABEL_28;
      }
      break;
    case 4u:
      if (v49)
      {
        uint64_t v50 = 0;
        goto LABEL_28;
      }
      break;
    case 5u:
      break;
    default:
      if (v49)
      {
        uint64_t v50 = 1;
LABEL_28:
        [v49 setUseCase:v50];
      }
      break;
  }
  id v135 = v49;
  uint64_t v60 = v2 + OBJC_IVAR____TtC15GMSSELFIngestor25PartnerCloudRequestEvents_signedInStatusEvent;
  swift_beginAccess();
  uint64_t v61 = sub_1000118A0();
  uint64_t v62 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v61 - 8) + 48);
  int v63 = v62(v60, 1, v61);
  v118[1] = v42;
  if (v63)
  {
    swift_endAccess();
    uint64_t v64 = sub_100011910();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v64 - 8) + 56))(v17, 1, 1, v64);
LABEL_32:
    sub_100009410((uint64_t)v17, &qword_1000188E8);
LABEL_33:
    uint64_t v67 = v139;
    goto LABEL_34;
  }
  sub_100011870();
  swift_endAccess();
  uint64_t v65 = sub_100011910();
  uint64_t v66 = *(void *)(v65 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v66 + 48))(v17, 1, v65) == 1) {
    goto LABEL_32;
  }
  if ((*(unsigned int (**)(char *, uint64_t))(v66 + 88))(v17, v65) != enum case for GenerativeFunctionsInstrumentationMetadata.partnerCloudRequest(_:))
  {
    (*(void (**)(char *, uint64_t))(v66 + 8))(v17, v65);
    goto LABEL_33;
  }
  (*(void (**)(char *, uint64_t))(v66 + 96))(v17, v65);
  uint64_t v108 = swift_projectBox();
  uint64_t v109 = v124;
  uint64_t v110 = v129;
  (*(void (**)(char *, uint64_t, uint64_t))(v124 + 16))(v21, v108, v129);
  swift_release();
  char v111 = sub_1000118E0();
  if (v111 == 2)
  {
    (*(void (**)(char *, uint64_t))(v109 + 8))(v21, v110);
    goto LABEL_33;
  }
  uint64_t v67 = v139;
  if (v111) {
    [v135 setIsUserSignedIn:1];
  }
  (*(void (**)(char *, uint64_t))(v124 + 8))(v21, v129);
LABEL_34:
  uint64_t v68 = v2 + OBJC_IVAR____TtC15GMSSELFIngestor25PartnerCloudRequestEvents_webSearchStatusEvent;
  swift_beginAccess();
  int v69 = v62(v68, 1, v61);
  uint64_t v70 = v120;
  uint64_t v71 = (uint64_t)v133;
  if (v69)
  {
    swift_endAccess();
    uint64_t v72 = sub_100011910();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v72 - 8) + 56))(v71, 1, 1, v72);
LABEL_37:
    sub_100009410(v71, &qword_1000188E8);
    goto LABEL_38;
  }
  sub_100011870();
  swift_endAccess();
  uint64_t v73 = sub_100011910();
  uint64_t v74 = *(void *)(v73 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v74 + 48))(v71, 1, v73) == 1) {
    goto LABEL_37;
  }
  if ((*(unsigned int (**)(uint64_t, uint64_t))(v74 + 88))(v71, v73) == enum case for GenerativeFunctionsInstrumentationMetadata.partnerCloudRequest(_:))
  {
    (*(void (**)(uint64_t, uint64_t))(v74 + 96))(v71, v73);
    uint64_t v112 = swift_projectBox();
    uint64_t v113 = v123;
    uint64_t v114 = v124;
    uint64_t v115 = v129;
    (*(void (**)(char *, uint64_t, uint64_t))(v124 + 16))(v123, v112, v129);
    swift_release();
    char v116 = sub_1000118F0();
    if (v116 != 2)
    {
      id v117 = v135;
      if (v116) {
        [v135 setIsWebSearchUsed:1];
      }
      (*(void (**)(char *, uint64_t))(v114 + 8))(v123, v129);
      if (!v117) {
        goto LABEL_48;
      }
LABEL_39:
      uint64_t v75 = v2 + OBJC_IVAR____TtC15GMSSELFIngestor25PartnerCloudRequestEvents_modelInfoEvent;
      swift_beginAccess();
      int v76 = v62(v75, 1, v61);
      id v77 = v135;
      if (!v76)
      {
        uint64_t v78 = v125;
        sub_1000117F0();
        uint64_t v79 = (uint64_t)v126;
        sub_1000117C0();
        v119(v78, v70);
        uint64_t v80 = sub_100011820();
        if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v80 - 8) + 48))(v79, 1, v80))
        {
          sub_100011800();
          sub_100009410(v79, &qword_1000188F8);
          swift_endAccess();
          NSString v81 = sub_100011990();
          swift_bridgeObjectRelease();
LABEL_43:
          [v77 setModelName:v81];

          swift_beginAccess();
          int v82 = v62(v75, 1, v61);
          id v83 = v77;
          if (!v82)
          {
            unint64_t v84 = v127;
            sub_1000117F0();
            uint64_t v85 = (uint64_t)v128;
            sub_1000117C0();
            v119(v84, v70);
            uint64_t v86 = sub_100011820();
            if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v86 - 8) + 48))(v85, 1, v86))
            {
              sub_100011810();
              sub_100009410(v85, &qword_1000188F8);
              swift_endAccess();
              NSString v87 = sub_100011990();
              swift_bridgeObjectRelease();
              goto LABEL_47;
            }
            sub_100009410(v85, &qword_1000188F8);
          }
          swift_endAccess();
          NSString v87 = 0;
LABEL_47:
          [v83 setModelVersion:v87];

          [v83 setModelParty:1];
          [v83 setModelLocation:1];
          [v83 setExternalPartner:1];
          goto LABEL_48;
        }
        sub_100009410(v79, &qword_1000188F8);
      }
      swift_endAccess();
      NSString v81 = 0;
      goto LABEL_43;
    }
    (*(void (**)(char *, uint64_t))(v114 + 8))(v113, v115);
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t))(v74 + 8))(v71, v73);
  }
LABEL_38:
  if (v135) {
    goto LABEL_39;
  }
LABEL_48:
  uint64_t v88 = v134;
  sub_1000117F0();
  uint64_t v89 = sub_1000117B0();
  uint64_t v91 = v90;
  v119(v88, v70);
  id v92 = v136;
  if (v91)
  {
    uint64_t v93 = (uint64_t)v131;
    sub_100011590();
    uint64_t v94 = v132;
    uint64_t v95 = v138;
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v132 + 48))(v93, 1, v138) == 1)
    {
      swift_bridgeObjectRelease();
      sub_100009410(v93, &qword_100018680);
    }
    else
    {
      uint64_t v96 = v130;
      (*(void (**)(char *, uint64_t, uint64_t))(v94 + 32))(v130, v93, v95);
      id v97 = v135;
      if (v135)
      {
        id v98 = objc_allocWithZone((Class)SISchemaUUID);
        id v99 = v97;
        Class v100 = sub_1000115B0().super.isa;
        id v101 = [v98 initWithNSUUID:v100];

        [v99 setGmsClientRequestIdentifier:v101];
      }
      uint64_t v102 = sub_1000115A0();
      sub_100010AE8(v89, v91, 46, 62, v102, v103);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v94 + 8))(v96, v95);
      id v92 = v136;
    }
  }
  id v104 = [v92 gmsModelRequestContext];
  id v105 = v135;
  [v104 setStarted:v135];

  uint64_t v106 = sub_100008CD0(&qword_100018688);
  *uint64_t v67 = v92;
  id v107 = v92;
  sub_100011890();
  sub_100011610();

  return (*(uint64_t (**)(void *, void, uint64_t, uint64_t))(*(void *)(v106 - 8) + 56))(v67, 0, 1, v106);
}

uint64_t GenerativeFunctionsInstrumentationEvent.latency(since:)(uint64_t a1)
{
  uint64_t v113 = a1;
  uint64_t v2 = sub_1000118A0();
  uint64_t v106 = *(void *)(v2 - 8);
  uint64_t v107 = v2;
  uint64_t v3 = __chkstk_darwin(v2);
  id v105 = (char *)&v98 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __chkstk_darwin(v3);
  uint64_t v103 = (char *)&v98 - v6;
  uint64_t v7 = __chkstk_darwin(v5);
  id v101 = (char *)&v98 - v8;
  __chkstk_darwin(v7);
  Class v100 = (char *)&v98 - v9;
  uint64_t v102 = sub_100008CD0(&qword_1000186D8);
  __chkstk_darwin(v102);
  uint64_t v110 = (char *)&v98 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v108 = sub_100011750();
  id v104 = *(void **)(v108 - 8);
  uint64_t v11 = __chkstk_darwin(v108);
  id v98 = (char *)&v98 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __chkstk_darwin(v11);
  id v99 = (char *)&v98 - v14;
  uint64_t v15 = __chkstk_darwin(v13);
  uint64_t v109 = (char *)&v98 - v16;
  __chkstk_darwin(v15);
  char v111 = (char *)&v98 - v17;
  uint64_t v18 = sub_1000115D0();
  uint64_t v19 = *(void *)(v18 - 8);
  uint64_t v20 = __chkstk_darwin(v18);
  uint64_t v22 = (char *)&v98 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v20);
  uint64_t v24 = (char *)&v98 - v23;
  uint64_t v25 = sub_100011740();
  uint64_t v26 = *(void *)(v25 - 8);
  uint64_t v27 = __chkstk_darwin(v25);
  uint64_t v29 = (char *)&v98 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v27);
  uint64_t v31 = (char *)&v98 - v30;
  uint64_t v112 = v1;
  sub_100011890();
  sub_100011720();
  uint64_t v32 = *(void (**)(char *, uint64_t))(v26 + 8);
  v32(v31, v25);
  sub_100011890();
  sub_100011720();
  v32(v29, v25);
  char v33 = sub_1000115C0();
  id v34 = *(void (**)(char *, uint64_t))(v19 + 8);
  v34(v22, v18);
  v34(v24, v18);
  if ((v33 & 1) == 0)
  {
    uint64_t v54 = v112;
    uint64_t v53 = v113;
    if (qword_100018508 != -1) {
      swift_once();
    }
    uint64_t v55 = sub_100011940();
    sub_100008E8C(v55, (uint64_t)qword_100018B90);
    uint64_t v57 = v106;
    uint64_t v56 = v107;
    uint64_t v58 = *(void (**)(char *, uint64_t, uint64_t))(v106 + 16);
    unint64_t v59 = v103;
    v58(v103, v54, v107);
    unint64_t v60 = (unint64_t)v105;
    v58(v105, v53, v56);
    uint64_t v61 = sub_100011920();
    os_log_type_t v62 = sub_100011A10();
    if (os_log_type_enabled(v61, v62))
    {
      uint64_t v63 = swift_slowAlloc();
      uint64_t v113 = swift_slowAlloc();
      uint64_t v115 = v113;
      *(_DWORD *)uint64_t v63 = 136315394;
      uint64_t v64 = sub_100011880();
      uint64_t v114 = sub_10000F408(v64, v65, &v115);
      sub_100011A30();
      swift_bridgeObjectRelease();
      uint64_t v66 = *(void (**)(char *, uint64_t))(v57 + 8);
      v66(v59, v56);
      *(_WORD *)(v63 + 12) = 2080;
      unint64_t v67 = (unint64_t)v105;
      uint64_t v68 = sub_100011880();
      uint64_t v114 = sub_10000F408(v68, v69, &v115);
      sub_100011A30();
      swift_bridgeObjectRelease();
      v66((char *)v67, v56);
      _os_log_impl((void *)&_mh_execute_header, v61, v62, "DataProcessors: mismatched boot sessions, ignoring events of type %s and %s", (uint8_t *)v63, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      uint64_t v78 = *(void (**)(char *, uint64_t))(v57 + 8);
      v78(v59, v56);
      v78((char *)v60, v56);
    }

    return 0;
  }
  sub_100011890();
  id v35 = v111;
  sub_100011730();
  v32(v31, v25);
  sub_100011890();
  id v36 = v109;
  sub_100011730();
  v32(v31, v25);
  uint64_t v37 = (uint64_t)v110;
  uint64_t v38 = &v110[*(int *)(v102 + 48)];
  long long v39 = v104;
  char v40 = (void (*)(uint64_t, char *, uint64_t))v104[2];
  uint64_t v41 = v35;
  uint64_t v42 = v35;
  uint64_t v43 = v108;
  v40((uint64_t)v110, v42, v108);
  v40((uint64_t)v38, v36, v43);
  BOOL v44 = (uint64_t (*)(uint64_t, uint64_t))v39[11];
  int v45 = v44(v37, v43);
  int v46 = v45;
  if (v45 != enum case for MonotonicTimestampValue.suspendingNanosecondsSinceBoot(_:))
  {
    uint64_t v71 = v106;
    uint64_t v70 = v107;
    if (v45 != enum case for MonotonicTimestampValue.continuousNanosecondsSinceBoot(_:))
    {
LABEL_17:
      if (qword_100018508 != -1) {
        swift_once();
      }
      uint64_t v79 = sub_100011940();
      sub_100008E8C(v79, (uint64_t)qword_100018B90);
      uint64_t v80 = *(void (**)(char *, uint64_t, uint64_t))(v71 + 16);
      NSString v81 = v100;
      v80(v100, v112, v70);
      int v82 = v101;
      v80(v101, v113, v70);
      id v83 = sub_100011920();
      os_log_type_t v84 = sub_100011A10();
      int v85 = v84;
      if (os_log_type_enabled(v83, v84))
      {
        uint64_t v86 = swift_slowAlloc();
        uint64_t v113 = swift_slowAlloc();
        uint64_t v115 = v113;
        *(_DWORD *)uint64_t v86 = 136315394;
        LODWORD(v112) = v85;
        uint64_t v87 = sub_100011880();
        uint64_t v114 = sub_10000F408(v87, v88, &v115);
        sub_100011A30();
        swift_bridgeObjectRelease();
        uint64_t v89 = *(void (**)(char *, uint64_t))(v71 + 8);
        v89(v81, v70);
        *(_WORD *)(v86 + 12) = 2080;
        uint64_t v90 = sub_100011880();
        uint64_t v114 = sub_10000F408(v90, v91, &v115);
        sub_100011A30();
        swift_bridgeObjectRelease();
        v89(v82, v70);
        _os_log_impl((void *)&_mh_execute_header, v83, (os_log_type_t)v112, "DataProcessors: mismatched timestamp clock, ignoring events of type %s and %s", (uint8_t *)v86, 0x16u);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        id v92 = (void (*)(char *, uint64_t))v104[1];
        uint64_t v93 = v108;
        v92(v109, v108);
        v92(v111, v93);
      }
      else
      {

        uint64_t v94 = *(void (**)(char *, uint64_t))(v71 + 8);
        v94(v82, v70);
        v94(v81, v70);
        uint64_t v95 = (void (*)(char *, uint64_t))v39[1];
        uint64_t v96 = v108;
        v95(v109, v108);
        v95(v41, v96);
      }
      sub_100009410((uint64_t)v110, &qword_1000186D8);
      return 0;
    }
    uint64_t v72 = v98;
    uint64_t v73 = v108;
    v40((uint64_t)v98, v110, v108);
    uint64_t v74 = (void (*)(char *, uint64_t))v39[12];
    v74(v72, v73);
    id v105 = *(char **)(*(void *)v72 + 16);
    if (v44((uint64_t)v38, v73) == v46)
    {
      v74(v38, v73);
      double v75 = sub_10000F17C((unint64_t)v105, *(void *)(*(void *)v38 + 16));
      uint64_t v51 = v76;
      id v77 = (void (*)(char *, uint64_t, double))v39[1];
      v77(v109, v73, v75);
      ((void (*)(char *, uint64_t))v77)(v111, v73);
      swift_release();
      swift_release();
      ((void (*)(char *, uint64_t))v77)(v110, v73);
      return v51;
    }
    uint64_t v70 = v107;
LABEL_16:
    swift_release();
    uint64_t v41 = v111;
    goto LABEL_17;
  }
  os_log_type_t v47 = v99;
  v40((uint64_t)v99, (char *)v37, v43);
  uint64_t v48 = (void (*)(char *, uint64_t))v39[12];
  v48(v47, v43);
  id v105 = *(char **)(*(void *)v47 + 16);
  if (v44((uint64_t)v38, v43) != v46)
  {
    uint64_t v71 = v106;
    uint64_t v70 = v107;
    goto LABEL_16;
  }
  v48(v38, v43);
  double v49 = sub_10000F17C((unint64_t)v105, *(void *)(*(void *)v38 + 16));
  uint64_t v51 = v50;
  os_log_type_t v52 = (void (*)(char *, uint64_t, double))v39[1];
  v52(v109, v43, v49);
  ((void (*)(char *, uint64_t))v52)(v111, v43);
  swift_release();
  swift_release();
  ((void (*)(uint64_t, uint64_t))v52)(v37, v43);
  return v51;
}

uint64_t PartnerCloudRequestEvents.deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC15GMSSELFIngestor25PartnerCloudRequestEvents_requestIdentifier;
  uint64_t v2 = sub_1000115D0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  swift_release();
  swift_bridgeObjectRelease();
  sub_100009410(v0 + OBJC_IVAR____TtC15GMSSELFIngestor25PartnerCloudRequestEvents_eventSubType, &qword_100018678);
  uint64_t v3 = v0 + OBJC_IVAR____TtC15GMSSELFIngestor25PartnerCloudRequestEvents_clientRequestStartEvent;
  uint64_t v4 = sub_1000118A0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  sub_100009410(v0 + OBJC_IVAR____TtC15GMSSELFIngestor25PartnerCloudRequestEvents_inferenceStartEvent, &qword_100018668);
  sub_100009410(v0 + OBJC_IVAR____TtC15GMSSELFIngestor25PartnerCloudRequestEvents_firstTokenEvent, &qword_100018668);
  sub_100009410(v0 + OBJC_IVAR____TtC15GMSSELFIngestor25PartnerCloudRequestEvents_modelInfoEvent, &qword_100018668);
  sub_100009410(v0 + OBJC_IVAR____TtC15GMSSELFIngestor25PartnerCloudRequestEvents_signedInStatusEvent, &qword_100018668);
  sub_100009410(v0 + OBJC_IVAR____TtC15GMSSELFIngestor25PartnerCloudRequestEvents_webSearchStatusEvent, &qword_100018668);
  return v0;
}

uint64_t PartnerCloudRequestEvents.__deallocating_deinit()
{
  PartnerCloudRequestEvents.deinit();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return _swift_deallocClassInstance(v0, v1, v2);
}

BOOL sub_10000F078(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

Swift::Int sub_10000F08C()
{
  Swift::UInt v1 = *v0;
  sub_100011B40();
  sub_100011B50(v1);
  return sub_100011B60();
}

void sub_10000F0D4()
{
  sub_100011B50(*v0);
}

Swift::Int sub_10000F100()
{
  Swift::UInt v1 = *v0;
  sub_100011B40();
  sub_100011B50(v1);
  return sub_100011B60();
}

unint64_t sub_10000F144@<X0>(unint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  unint64_t result = sub_100011350(*a1);
  *a2 = result;
  return result;
}

void sub_10000F170(void *a1@<X8>)
{
  *a1 = *v1;
}

double sub_10000F17C(unint64_t a1, unint64_t a2)
{
  if (!a1 || !a2)
  {
    if (qword_100018508 != -1) {
      swift_once();
    }
    uint64_t v7 = sub_100011940();
    sub_100008E8C(v7, (uint64_t)qword_100018B90);
    uint64_t v3 = sub_100011920();
    os_log_type_t v4 = sub_100011A10();
    if (!os_log_type_enabled(v3, v4)) {
      goto LABEL_13;
    }
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v5 = 0;
    uint64_t v6 = "DataProcessors: start or end timestamp value is 0";
    goto LABEL_12;
  }
  if (a2 < a1)
  {
    if (qword_100018508 != -1) {
      swift_once();
    }
    uint64_t v2 = sub_100011940();
    sub_100008E8C(v2, (uint64_t)qword_100018B90);
    uint64_t v3 = sub_100011920();
    os_log_type_t v4 = sub_100011A10();
    if (!os_log_type_enabled(v3, v4)) {
      goto LABEL_13;
    }
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v5 = 0;
    uint64_t v6 = "DataProcessors: start timestamp value is greater than end timestamp value";
LABEL_12:
    _os_log_impl((void *)&_mh_execute_header, v3, v4, v6, v5, 2u);
    swift_slowDealloc();
LABEL_13:

    return result;
  }
  return (double)(a2 - a1) / 1000000.0;
}

uint64_t sub_10000F31C(uint64_t result, unsigned char **a2)
{
  uint64_t v2 = *a2;
  *uint64_t v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_10000F32C(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_10000F368(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_10000F390(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a4();
  sub_10000F408(v6, v7, a3);
  uint64_t v8 = *a1 + 8;
  sub_100011A30();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_10000F408(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_10000F4DC(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_1000114D4((uint64_t)v12, *a3);
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
      sub_1000114D4((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_100009670((uint64_t)v12);
  return v7;
}

uint64_t sub_10000F4DC(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_100011A40();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_10000F698(a5, a6);
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
  uint64_t v8 = sub_100011A80();
  if (!v8)
  {
    sub_100011AD0();
    __break(1u);
LABEL_17:
    uint64_t result = sub_100011AF0();
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

uint64_t sub_10000F698(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_10000F730(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_10000F910(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_10000F910(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_10000F730(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_10000F8A8(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_100011A60();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_100011AD0();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_1000119D0();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_100011AF0();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_100011AD0();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_10000F8A8(uint64_t a1, uint64_t a2)
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
  sub_100008CD0((uint64_t *)&unk_100018900);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_10000F910(char a1, int64_t a2, char a3, char *a4)
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
    sub_100008CD0((uint64_t *)&unk_100018900);
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
  uint64_t result = sub_100011AF0();
  __break(1u);
  return result;
}

unsigned char **sub_10000FA60(unsigned char **result, uint64_t a2, uint64_t a3, char a4)
{
  unint64_t v4 = *result;
  *unint64_t v4 = a4;
  *uint64_t result = v4 + 1;
  return result;
}

ValueMetadata *type metadata accessor for GMSBiomeEventConstant()
{
  return &type metadata for GMSBiomeEventConstant;
}

uint64_t type metadata accessor for BiomeBookmarkProvider()
{
  return self;
}

uint64_t sub_10000FAA4()
{
  return type metadata accessor for PartnerCloudRequestEvents();
}

uint64_t type metadata accessor for PartnerCloudRequestEvents()
{
  uint64_t result = qword_1000187E8;
  if (!qword_1000187E8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_10000FAF8()
{
  sub_1000115D0();
  if (v0 <= 0x3F)
  {
    sub_10000FC98(319, &qword_1000187F8, (void (*)(uint64_t))&type metadata accessor for GenerativeFunctionsInstrumentationEvent.Subtype);
    if (v1 <= 0x3F)
    {
      sub_1000118A0();
      if (v2 <= 0x3F)
      {
        sub_10000FC98(319, (unint64_t *)&unk_100018800, (void (*)(uint64_t))&type metadata accessor for GenerativeFunctionsInstrumentationEvent);
        if (v3 <= 0x3F) {
          swift_updateClassMetadata2();
        }
      }
    }
  }
}

void sub_10000FC98(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = sub_100011A20();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

unsigned char *initializeBufferWithCopyOfBuffer for InferenceRequestType(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for InferenceRequestType(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for InferenceRequestType(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 4;
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
        JUMPOUT(0x10000FE58);
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
          *uint64_t result = a2 + 4;
        break;
    }
  }
  return result;
}

uint64_t sub_10000FE80(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_10000FE88(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for InferenceRequestType()
{
  return &type metadata for InferenceRequestType;
}

unint64_t sub_10000FEA4()
{
  unint64_t result = qword_1000188D0;
  if (!qword_1000188D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000188D0);
  }
  return result;
}

uint64_t sub_10000FEF8(uint64_t a1, void *a2)
{
  v6._countAndFlagsBits = a1;
  v3._rawValue = &off_100014860;
  v6._object = a2;
  unint64_t v4 = sub_100011B00(v3, v6);
  swift_bridgeObjectRelease();
  if (v4 >= 5) {
    return 5;
  }
  else {
    return v4;
  }
}

uint64_t sub_10000FF44(uint64_t a1, uint64_t a2)
{
  if (!a2) {
    return 0;
  }
  if (a1 == 0xD00000000000001ELL && a2 == 0x80000001000126A0 || (sub_100011B30() & 1) != 0) {
    return 1;
  }
  if (a1 == 0xD000000000000020 && a2 == 0x80000001000126C0 || (sub_100011B30() & 1) != 0) {
    return 2;
  }
  if (a1 == 0xD000000000000012 && a2 == 0x80000001000126F0 || (sub_100011B30() & 1) != 0) {
    return 3;
  }
  if (a1 == 0x65636E65746E6553 && a2 == 0xED00006563656950 || (sub_100011B30() & 1) != 0) {
    return 4;
  }
  if (a1 == 0x726F727245534ELL && a2 == 0xE700000000000000 || (sub_100011B30() & 1) != 0) {
    return 5;
  }
  if (a1 == 0xD000000000000016 && a2 == 0x8000000100012710 || (sub_100011B30() & 1) != 0) {
    return 6;
  }
  if (a1 == 0xD000000000000013 && a2 == 0x8000000100012730 || (sub_100011B30() & 1) != 0)
  {
    if (sub_100011760()) {
      BOOL v7 = 0;
    }
    else {
      BOOL v7 = (v6 & 1) == 0;
    }
    if (v7) {
      return 7;
    }
    else {
      return 15;
    }
  }
  else if (a1 == 5459524 && a2 == 0xE300000000000000 || (sub_100011B30() & 1) != 0)
  {
    return 8;
  }
  else if (a1 == 0xD000000000000026 && a2 == 0x8000000100012750 || (sub_100011B30() & 1) != 0)
  {
    return 9;
  }
  else if (a1 == 0xD000000000000035 && a2 == 0x8000000100012780 || (sub_100011B30() & 1) != 0)
  {
    return 10;
  }
  else if (a1 == 0xD000000000000014 && a2 == 0x80000001000127C0 || (sub_100011B30() & 1) != 0)
  {
    return 11;
  }
  else if (a1 == 0xD00000000000001BLL && a2 == 0x80000001000127E0 || (sub_100011B30() & 1) != 0)
  {
    return 12;
  }
  else if (a1 == 0xD00000000000002FLL && a2 == 0x8000000100012800 || (sub_100011B30() & 1) != 0)
  {
    return 14;
  }
  else if (a1 == 0xD00000000000002DLL && a2 == 0x8000000100012830 || (sub_100011B30() & 1) != 0)
  {
    return 16;
  }
  else if (a1 == 0xD000000000000017 && a2 == 0x8000000100012860 || (sub_100011B30() & 1) != 0)
  {
    return 17;
  }
  else if (a1 == 0xD00000000000002BLL && a2 == 0x8000000100012880 || (sub_100011B30() & 1) != 0)
  {
    return 18;
  }
  else if (a1 == 0xD000000000000028 && a2 == 0x80000001000128B0 || (sub_100011B30() & 1) != 0)
  {
    return 19;
  }
  else if (a1 == 0xD00000000000001ALL && a2 == 0x80000001000128E0 || (sub_100011B30() & 1) != 0)
  {
    return 20;
  }
  else if (a1 == 0xD00000000000002ALL && a2 == 0x8000000100012900 || (sub_100011B30() & 1) != 0)
  {
    return 21;
  }
  else if (a1 == 0xD00000000000002BLL && a2 == 0x8000000100012930 || (sub_100011B30() & 1) != 0)
  {
    return 23;
  }
  else if (a1 == 0xD000000000000038 && a2 == 0x8000000100012960 || (sub_100011B30() & 1) != 0)
  {
    return 25;
  }
  else if (a1 == 0xD000000000000024 && a2 == 0x80000001000129A0 || (sub_100011B30() & 1) != 0)
  {
    return 26;
  }
  else if (a1 == 0x5849534F50 && a2 == 0xE500000000000000 || (sub_100011B30() & 1) != 0)
  {
    return 27;
  }
  else if (a1 == 0xD000000000000019 && a2 == 0x80000001000129D0 || (sub_100011B30() & 1) != 0)
  {
    return 28;
  }
  else if (a1 == 0xD000000000000023 && a2 == 0x80000001000129F0 || (sub_100011B30() & 1) != 0)
  {
    return 29;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x8000000100012A20 || (sub_100011B30() & 1) != 0)
  {
    return 30;
  }
  else if (a1 == 0x6E65476E656B6F54 && a2 == 0xEF6E6F6974617265 || (sub_100011B30() & 1) != 0)
  {
    return 31;
  }
  else if (a1 == 0xD000000000000012 && a2 == 0x8000000100012A40 || (sub_100011B30() & 1) != 0)
  {
    return 33;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x8000000100012A60 || (sub_100011B30() & 1) != 0)
  {
    return 34;
  }
  else if (a1 == 0xD000000000000018 && a2 == 0x8000000100012A80 || (sub_100011B30() & 1) != 0)
  {
    return 35;
  }
  else if (a1 == 0xD000000000000019 && a2 == 0x8000000100012AA0 || (sub_100011B30() & 1) != 0)
  {
    return 36;
  }
  else if (a1 == 0xD000000000000014 && a2 == 0x8000000100012AC0 || (sub_100011B30() & 1) != 0)
  {
    return 38;
  }
  else if (a1 == 0xD00000000000002CLL && a2 == 0x8000000100012AE0 || (sub_100011B30() & 1) != 0)
  {
    return 39;
  }
  else if (a1 == 5459028 && a2 == 0xE300000000000000 || (sub_100011B30() & 1) != 0)
  {
    return 42;
  }
  else if (a1 == 0xD000000000000023 && a2 == 0x8000000100012B10 || (sub_100011B30() & 1) != 0)
  {
    return 43;
  }
  else if (a1 == 0xD000000000000013 && a2 == 0x8000000100012B40 || (sub_100011B30() & 1) != 0)
  {
    return 45;
  }
  else if (a1 == 0xD000000000000029 && a2 == 0x8000000100012B60 || (sub_100011B30() & 1) != 0)
  {
    return 46;
  }
  else
  {
    uint64_t v4 = 47;
    if (a1 != 0xD00000000000003ALL || a2 != 0x8000000100012B90)
    {
      if (sub_100011B30()) {
        return 47;
      }
      else {
        return 0;
      }
    }
  }
  return v4;
}

void sub_100010AE8(uint64_t a1, uint64_t a2, int a3, int a4, uint64_t a5, uint64_t a6)
{
  LODWORD(v72) = a4;
  LODWORD(v71) = a3;
  uint64_t v7 = sub_100008CD0(&qword_100018680);
  uint64_t v8 = __chkstk_darwin(v7 - 8);
  uint64_t v10 = (char *)v66 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v12 = (char *)v66 - v11;
  uint64_t v13 = sub_1000115D0();
  os_log_t v74 = *(os_log_t *)(v13 - 8);
  uint64_t v14 = __chkstk_darwin(v13);
  uint64_t v73 = (char *)v66 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  uint64_t v17 = (char *)v66 - v16;
  id v18 = [objc_allocWithZone((Class)SISchemaRequestLink) init];
  if (v18)
  {
    id v19 = v18;
    unint64_t v69 = v17;
    uint64_t v70 = v13;
    id v20 = [objc_allocWithZone((Class)SISchemaRequestLinkInfo) init];
    if (v20)
    {
      id v68 = v20;
      id v21 = [objc_allocWithZone((Class)SISchemaRequestLinkInfo) init];
      if (v21)
      {
        uint64_t v22 = v21;
        sub_100011590();
        os_log_t v23 = v74;
        Class isa = v74[6].isa;
        uint64_t v25 = v70;
        if (((unsigned int (*)(char *, uint64_t, uint64_t))isa)(v12, 1, v70) == 1)
        {
          sub_100009410((uint64_t)v12, &qword_100018680);
          if (qword_100018518 != -1) {
            swift_once();
          }
          uint64_t v26 = sub_100011940();
          sub_100008E8C(v26, (uint64_t)qword_100018BC0);
          uint64_t v27 = sub_100011920();
          os_log_type_t v28 = sub_100011A10();
          if (os_log_type_enabled(v27, v28))
          {
            uint64_t v29 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)uint64_t v29 = 0;
            _os_log_impl((void *)&_mh_execute_header, v27, v28, "Failed to emit RequestLink, source ID is nil", v29, 2u);
            swift_slowDealloc();
          }
          else
          {
          }
        }
        else
        {
          v66[1] = a6;
          id v67 = v22;
          v66[0] = v23[4].isa;
          ((void (*)(char *, char *, uint64_t))v66[0])(v69, v12, v25);
          id v34 = objc_allocWithZone((Class)SISchemaUUID);
          Class v35 = sub_1000115B0().super.isa;
          id v36 = [v34 initWithNSUUID:v35];

          sub_100011590();
          if (((unsigned int (*)(char *, uint64_t, uint64_t))isa)(v10, 1, v25) == 1)
          {
            uint64_t v37 = v36;
            sub_100009410((uint64_t)v10, &qword_100018680);
            if (qword_100018518 != -1) {
              swift_once();
            }
            uint64_t v38 = sub_100011940();
            sub_100008E8C(v38, (uint64_t)qword_100018BC0);
            long long v39 = sub_100011920();
            os_log_type_t v40 = sub_100011A10();
            BOOL v41 = os_log_type_enabled(v39, v40);
            os_log_t v42 = v74;
            id v43 = v67;
            int v45 = v69;
            uint64_t v44 = v70;
            if (v41)
            {
              int v46 = (uint8_t *)swift_slowAlloc();
              *(_WORD *)int v46 = 0;
              _os_log_impl((void *)&_mh_execute_header, v39, v40, "Failed to emit RequestLink, target ID is nil", v46, 2u);
              swift_slowDealloc();
            }

            ((void (*)(char *, uint64_t))v42[1].isa)(v45, v44);
          }
          else
          {
            ((void (*)(char *, char *, uint64_t))v66[0])(v73, v10, v25);
            id v47 = objc_allocWithZone((Class)SISchemaUUID);
            Class v48 = sub_1000115B0().super.isa;
            id v49 = [v47 initWithNSUUID:v48];

            id v50 = v68;
            [v68 setComponent:v71];
            [v50 setUuid:v36];
            [v19 setSource:v50];
            id v51 = v67;
            [v67 setComponent:v72];
            [v51 setUuid:v49];
            [v19 setTarget:v51];
            if (qword_100018518 != -1) {
              swift_once();
            }
            uint64_t v52 = sub_100011940();
            sub_100008E8C(v52, (uint64_t)qword_100018BC0);
            id v53 = v19;
            uint64_t v54 = sub_100011920();
            os_log_type_t v55 = sub_100011A00();
            BOOL v56 = os_log_type_enabled(v54, v55);
            os_log_t v57 = v74;
            uint64_t v58 = v69;
            if (v56)
            {
              id v71 = v49;
              id v72 = v36;
              unint64_t v59 = (uint8_t *)swift_slowAlloc();
              uint64_t v76 = swift_slowAlloc();
              *(_DWORD *)unint64_t v59 = 136315138;
              id v60 = [v53 formattedJsonBody];
              if (v60)
              {
                uint64_t v61 = v60;
                uint64_t v62 = sub_1000119A0();
                unint64_t v64 = v63;
              }
              else
              {
                uint64_t v62 = 0;
                unint64_t v64 = 0xE000000000000000;
              }
              uint64_t v75 = sub_10000F408(v62, v64, &v76);
              sub_100011A30();

              swift_bridgeObjectRelease();
              _os_log_impl((void *)&_mh_execute_header, v54, v55, "emit Request Link %s", v59, 0xCu);
              swift_arrayDestroy();
              swift_slowDealloc();
              swift_slowDealloc();

              uint64_t v58 = v69;
              uint64_t v25 = v70;
              id v49 = v71;
              id v36 = v72;
            }
            else
            {
            }
            objc_msgSend(objc_msgSend(self, "sharedStream"), "emitMessage:", v53);

            swift_unknownObjectRelease();
            unint64_t v65 = (void (*)(char *, uint64_t))v57[1].isa;
            v65(v73, v25);
            v65(v58, v25);
          }
        }
        return;
      }

      id v19 = v68;
    }
  }
  if (qword_100018518 != -1) {
    swift_once();
  }
  uint64_t v30 = sub_100011940();
  sub_100008E8C(v30, (uint64_t)qword_100018BC0);
  os_log_t v74 = (os_log_t)sub_100011920();
  os_log_type_t v31 = sub_100011A10();
  if (os_log_type_enabled(v74, v31))
  {
    uint64_t v32 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v32 = 0;
    _os_log_impl((void *)&_mh_execute_header, v74, v31, "Failed to emit RequestLink, either RequestLink or RequestLinkInfo is nil", v32, 2u);
    swift_slowDealloc();
  }
  os_log_t v33 = v74;
}

unint64_t sub_100011350(unint64_t result)
{
  if (result >= 5) {
    return 5;
  }
  return result;
}

uint64_t *sub_100011360(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_1000113C4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100008CD0(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_100011428(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100008CD0(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_10001148C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1000114D4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_100011530()
{
  return Date.init(timeIntervalSinceReferenceDate:)();
}

uint64_t sub_100011540()
{
  return Date.timeIntervalSinceReferenceDate.getter();
}

NSDate sub_100011550()
{
  return Date._bridgeToObjectiveC()();
}

uint64_t sub_100011560()
{
  return Date.init(timeIntervalSinceNow:)();
}

uint64_t sub_100011570()
{
  return static Date.now.getter();
}

uint64_t sub_100011580()
{
  return type metadata accessor for Date();
}

uint64_t sub_100011590()
{
  return UUID.init(uuidString:)();
}

uint64_t sub_1000115A0()
{
  return UUID.uuidString.getter();
}

NSUUID sub_1000115B0()
{
  return UUID._bridgeToObjectiveC()();
}

uint64_t sub_1000115C0()
{
  return static UUID.== infix(_:_:)();
}

uint64_t sub_1000115D0()
{
  return type metadata accessor for UUID();
}

uint64_t sub_1000115E0()
{
  return StagingPool.add(timestamp:message:)();
}

uint64_t sub_1000115F0()
{
  return type metadata accessor for StagingPool();
}

uint64_t sub_100011610()
{
  return MonotonicTimestamp.init(biomeType:)();
}

uint64_t sub_100011620()
{
  return type metadata accessor for MonotonicTimestamp();
}

uint64_t sub_100011630()
{
  return _HashTable.UnsafeHandle._startIterator(bucket:)();
}

uint64_t sub_100011640()
{
  return _HashTable.UnsafeHandle.firstOccupiedBucketInChain(with:)();
}

uint64_t sub_100011650()
{
  return _HashTable.UnsafeHandle.subscript.setter();
}

uint64_t sub_100011660()
{
  return _HashTable.BucketIterator.currentValue.getter();
}

uint64_t sub_100011670()
{
  return _HashTable.BucketIterator.currentValue.setter();
}

void sub_100011680()
{
}

uint64_t sub_100011690()
{
  return static _HashTable.maximumCapacity(forScale:)();
}

uint64_t sub_1000116A0()
{
  return static _HashTable.minimumCapacity(forScale:)();
}

uint64_t sub_1000116B0()
{
  return _HashTable.copy()();
}

uint64_t sub_1000116C0()
{
  return static _HashTable.scale(forCapacity:)();
}

uint64_t sub_1000116D0()
{
  return _HashTable.init(scale:reservedScale:)();
}

uint64_t sub_1000116E0()
{
  return static AppExtension.main()();
}

uint64_t sub_1000116F0()
{
  return static Library.Streams.GenerativeModels.GenerativeFunctions.Instrumentation.identifier.getter();
}

uint64_t sub_100011700()
{
  return type metadata accessor for Library.Streams.GenerativeModels.GenerativeFunctions.Instrumentation();
}

uint64_t sub_100011710()
{
  return static StreamResource.publisher(useCase:bmOptions:)();
}

uint64_t sub_100011720()
{
  return MonotonicTimestamp.bootSessionUUID.getter();
}

uint64_t sub_100011730()
{
  return MonotonicTimestamp.value.getter();
}

uint64_t sub_100011740()
{
  return type metadata accessor for MonotonicTimestamp();
}

uint64_t sub_100011750()
{
  return type metadata accessor for MonotonicTimestampValue();
}

uint64_t sub_100011760()
{
  return GenerativeFunctionsInstrumentationError.GenericError.code.getter();
}

uint64_t sub_100011770()
{
  return GenerativeFunctionsInstrumentationError.GenericError.domain.getter();
}

uint64_t sub_100011780()
{
  return type metadata accessor for GenerativeFunctionsInstrumentationError.GenericError();
}

uint64_t sub_100011790()
{
  return type metadata accessor for GenerativeFunctionsInstrumentationError();
}

uint64_t sub_1000117A0()
{
  return GenerativeFunctionsInstrumentationEvent.Identifiers.useCaseIdentifier.getter();
}

uint64_t sub_1000117B0()
{
  return GenerativeFunctionsInstrumentationEvent.Identifiers.clientRequestIdentifier.getter();
}

uint64_t sub_1000117C0()
{
  return GenerativeFunctionsInstrumentationEvent.Identifiers.catalogResourceIdentifier.getter();
}

uint64_t sub_1000117D0()
{
  return GenerativeFunctionsInstrumentationEvent.Identifiers.modelManagerRequestIdentifier.getter();
}

uint64_t sub_1000117E0()
{
  return type metadata accessor for GenerativeFunctionsInstrumentationEvent.Identifiers();
}

uint64_t sub_1000117F0()
{
  return GenerativeFunctionsInstrumentationEvent.identifiers.getter();
}

uint64_t sub_100011800()
{
  return GenerativeFunctionsInstrumentationEvent.CatalogResourceIdentifierAndVersion.identifier.getter();
}

uint64_t sub_100011810()
{
  return GenerativeFunctionsInstrumentationEvent.CatalogResourceIdentifierAndVersion.version.getter();
}

uint64_t sub_100011820()
{
  return type metadata accessor for GenerativeFunctionsInstrumentationEvent.CatalogResourceIdentifierAndVersion();
}

uint64_t sub_100011830()
{
  return GenerativeFunctionsInstrumentationEvent.error.getter();
}

uint64_t sub_100011840()
{
  return GenerativeFunctionsInstrumentationEvent.Subtype.description.getter();
}

uint64_t sub_100011850()
{
  return type metadata accessor for GenerativeFunctionsInstrumentationEvent.Subtype();
}

uint64_t sub_100011860()
{
  return GenerativeFunctionsInstrumentationEvent.subtype.getter();
}

uint64_t sub_100011870()
{
  return GenerativeFunctionsInstrumentationEvent.metadata.getter();
}

uint64_t sub_100011880()
{
  return GenerativeFunctionsInstrumentationEvent.eventType.getter();
}

uint64_t sub_100011890()
{
  return GenerativeFunctionsInstrumentationEvent.timestamp.getter();
}

uint64_t sub_1000118A0()
{
  return type metadata accessor for GenerativeFunctionsInstrumentationEvent();
}

uint64_t sub_1000118B0()
{
  return GenerativeFunctionsInstrumentationMetadata.TGIExecuteRequest.outputImagesCount.getter();
}

uint64_t sub_1000118C0()
{
  return GenerativeFunctionsInstrumentationMetadata.TGIExecuteRequest.outputTokensCount.getter();
}

uint64_t sub_1000118D0()
{
  return type metadata accessor for GenerativeFunctionsInstrumentationMetadata.TGIExecuteRequest();
}

uint64_t sub_1000118E0()
{
  return GenerativeFunctionsInstrumentationMetadata.PartnerCloudRequest.isSignedIn.getter();
}

uint64_t sub_1000118F0()
{
  return GenerativeFunctionsInstrumentationMetadata.PartnerCloudRequest.webSearchUsed.getter();
}

uint64_t sub_100011900()
{
  return type metadata accessor for GenerativeFunctionsInstrumentationMetadata.PartnerCloudRequest();
}

uint64_t sub_100011910()
{
  return type metadata accessor for GenerativeFunctionsInstrumentationMetadata();
}

uint64_t sub_100011920()
{
  return Logger.logObject.getter();
}

uint64_t sub_100011930()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_100011940()
{
  return type metadata accessor for Logger();
}

uint64_t sub_100011950()
{
  return Publisher.sink(receiveCompletion:receiveValue:)();
}

uint64_t sub_100011960()
{
  return dispatch thunk of Hashable._rawHashValue(seed:)();
}

uint64_t sub_100011970()
{
  return dispatch thunk of static Comparable.>= infix(_:_:)();
}

uint64_t sub_100011980()
{
  return dispatch thunk of static Equatable.== infix(_:_:)();
}

NSString sub_100011990()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_1000119A0()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_1000119B0()
{
  return String.init<A>(describing:)();
}

void sub_1000119C0(Swift::String a1)
{
}

Swift::Int sub_1000119D0()
{
  return String.UTF8View._foreignCount()();
}

NSNumber sub_1000119E0()
{
  return Double._bridgeToObjectiveC()();
}

uint64_t sub_1000119F0()
{
  return static os_log_type_t.info.getter();
}

uint64_t sub_100011A00()
{
  return static os_log_type_t.debug.getter();
}

uint64_t sub_100011A10()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_100011A20()
{
  return type metadata accessor for Optional();
}

uint64_t sub_100011A30()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_100011A40()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_100011A50()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t sub_100011A60()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_100011A70()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_100011A80()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_100011A90()
{
  return specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
}

uint64_t sub_100011AA0()
{
  return specialized ContiguousArray._endMutation()();
}

uint64_t sub_100011AB0()
{
  return specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
}

uint64_t sub_100011AC0()
{
  return specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_100011AD0()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_100011AE0()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_100011AF0()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

Swift::Int sub_100011B00(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases, string);
}

uint64_t sub_100011B20()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t sub_100011B30()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_100011B40()
{
  return Hasher.init(_seed:)();
}

void sub_100011B50(Swift::UInt a1)
{
}

Swift::Int sub_100011B60()
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

uint64_t swift_endAccess()
{
  return _swift_endAccess();
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

uint64_t swift_initStackObject()
{
  return _swift_initStackObject();
}

uint64_t swift_isUniquelyReferenced_native()
{
  return _swift_isUniquelyReferenced_native();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
}

uint64_t swift_once()
{
  return _swift_once();
}

uint64_t swift_projectBox()
{
  return _swift_projectBox();
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

uint64_t swift_updateClassMetadata2()
{
  return _swift_updateClassMetadata2();
}