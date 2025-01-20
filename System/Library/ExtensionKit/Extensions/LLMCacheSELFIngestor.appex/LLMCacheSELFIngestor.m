uint64_t sub_100004D64(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;

  v2[14] = a1;
  v2[15] = v1;
  v3 = sub_10000A7F0();
  v2[16] = v3;
  v4 = *(void *)(v3 - 8);
  v2[17] = v4;
  v2[18] = *(void *)(v4 + 64);
  v2[19] = swift_task_alloc();
  sub_100006954(&qword_100010360);
  v2[20] = swift_task_alloc();
  v2[21] = swift_task_alloc();
  v5 = sub_10000A7B0();
  v2[22] = v5;
  v2[23] = *(void *)(v5 - 8);
  v2[24] = swift_task_alloc();
  v2[25] = swift_task_alloc();
  v2[26] = swift_task_alloc();
  return _swift_task_switch(sub_100004EE4, 0, 0);
}

uint64_t sub_100004EE4()
{
  v34 = v0 + 9;
  if (qword_100010258 != -1) {
    swift_once();
  }
  uint64_t v1 = v0[26];
  uint64_t v3 = v0[22];
  uint64_t v2 = v0[23];
  uint64_t v4 = v0[21];
  uint64_t v31 = v0[25];
  uint64_t v33 = v0[20];
  uint64_t v5 = sub_10000A840();
  uint64_t v7 = v6;
  type metadata accessor for BiomeBookmarkProvider();
  inited = (void *)swift_initStackObject();
  id v9 = objc_allocWithZone((Class)NSUserDefaults);
  NSString v10 = sub_10000AA50();
  id v11 = [v9 initWithSuiteName:v10];

  inited[2] = v11;
  inited[3] = v5;
  inited[4] = v7;
  swift_bridgeObjectRetain();
  v36._object = (void *)0x800000010000B090;
  v36._countAndFlagsBits = 0xD000000000000018;
  sub_10000AA60(v36);
  inited[5] = v5;
  inited[6] = v7;
  sub_1000093A8(v1);
  sub_10000A7A0();
  sub_100006998();
  v12 = *(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16);
  v12(v4, v1, v3);
  v13 = *(void (**)(uint64_t, void, uint64_t, uint64_t))(v2 + 56);
  v13(v4, 0, 1, v3);
  v28 = v12;
  v12(v33, v31, v3);
  v13(v33, 0, 1, v3);
  id v14 = sub_1000053C8(v4, v33, 0, 0, 0);
  sub_10000A850();
  sub_100006C98(&qword_100010370, 255, (void (*)(uint64_t))&type metadata accessor for Library.Streams.LLMCache.CacheManagerTelemetry);
  v30 = v14;
  sub_10000A860();
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
  sub_1000069D8(v34, v0[12]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v20 + 16))(v18, v21, v19);
  unint64_t v23 = (*(unsigned __int8 *)(v20 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v20 + 80);
  uint64_t v24 = swift_allocObject();
  *(void *)(v24 + 16) = v22;
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v20 + 32))(v24 + v23, v18, v19);
  swift_retain();
  sub_10000AA30();
  swift_release();
  swift_release();
  v28(v32, v15, v17);
  sub_100009934(v32);
  swift_release();

  v25 = *(void (**)(uint64_t, uint64_t))(v16 + 8);
  v25(v15, v17);
  v25(v29, v17);
  sub_100006B5C((uint64_t)v34);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  v26 = (uint64_t (*)(void))v0[1];
  return v26();
}

id sub_1000053C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t v9 = sub_10000A7B0();
  uint64_t v10 = *(void *)(v9 - 8);
  id v11 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v10 + 48);
  Class isa = 0;
  if (v11(a1, 1, v9) != 1)
  {
    Class isa = sub_10000A780().super.isa;
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(a1, v9);
  }
  if (v11(a2, 1, v9) == 1)
  {
    Class v13 = 0;
  }
  else
  {
    Class v13 = sub_10000A780().super.isa;
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(a2, v9);
  }
  id v14 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) initWithStartDate:isa endDate:v13 maxEvents:a3 lastN:a4 reversed:a5 & 1];

  return v14;
}

void sub_100005548(void *a1)
{
  if (*a1)
  {
    swift_errorRetain();
    if (qword_100010260 != -1) {
      swift_once();
    }
    uint64_t v1 = sub_10000AA10();
    sub_100006C04(v1, (uint64_t)qword_1000105D0);
    swift_errorRetain();
    swift_errorRetain();
    oslog = sub_10000AA00();
    os_log_type_t v2 = sub_10000AAB0();
    if (os_log_type_enabled(oslog, v2))
    {
      uint64_t v3 = (uint8_t *)swift_slowAlloc();
      uint64_t v4 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v3 = 138412290;
      swift_errorRetain();
      uint64_t v9 = _swift_stdlib_bridgeErrorToNSError();
      sub_10000AAE0();
      *uint64_t v4 = v9;
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, oslog, v2, "Polling biome stream has failed: %@", v3, 0xCu);
      sub_100006954(&qword_1000103A8);
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
    if (qword_100010260 != -1) {
      swift_once();
    }
    uint64_t v5 = sub_10000AA10();
    sub_100006C04(v5, (uint64_t)qword_1000105D0);
    oslog = sub_10000AA00();
    os_log_type_t v6 = sub_10000AA90();
    if (os_log_type_enabled(oslog, v6))
    {
      uint64_t v7 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, oslog, v6, "Polling biome stream has finished", v7, 2u);
      swift_slowDealloc();
    }
  }
}

uint64_t sub_1000057F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v100 = a3;
  uint64_t v4 = sub_10000A9B0();
  uint64_t v107 = *(void *)(v4 - 8);
  uint64_t v108 = v4;
  __chkstk_darwin(v4);
  v106 = (char *)&v90 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10000A950();
  uint64_t v95 = *(void *)(v6 - 8);
  uint64_t v96 = v6;
  __chkstk_darwin(v6);
  v94 = (char *)&v90 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_10000A8C0();
  uint64_t v98 = *(void *)(v8 - 8);
  uint64_t v99 = v8;
  __chkstk_darwin(v8);
  v97 = (char *)&v90 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_10000A9D0();
  uint64_t v102 = *(void *)(v10 - 8);
  v103 = (uint8_t *)v10;
  __chkstk_darwin(v10);
  v101 = (char *)&v90 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v105 = sub_100006954(&qword_100010378);
  uint64_t v12 = __chkstk_darwin(v105);
  v104 = (char *)&v90 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __chkstk_darwin(v12);
  uint64_t v16 = (char *)&v90 - v15;
  __chkstk_darwin(v14);
  v110 = (char *)&v90 - v17;
  uint64_t v18 = sub_100006954(&qword_100010380);
  __chkstk_darwin(v18 - 8);
  uint64_t v20 = (char *)&v90 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = sub_100006954(&qword_100010388);
  __chkstk_darwin(v21 - 8);
  uint64_t v112 = (uint64_t)&v90 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = sub_100006954(&qword_100010390);
  __chkstk_darwin(v23 - 8);
  v25 = (char *)&v90 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = sub_100006954(&qword_100010398);
  __chkstk_darwin(v26 - 8);
  v28 = (char *)&v90 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = sub_10000A7D0();
  uint64_t v30 = *(void *)(v29 - 8);
  uint64_t v31 = __chkstk_darwin(v29);
  v109 = (char *)&v90 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v31);
  v111 = (char *)&v90 - v33;
  uint64_t v34 = a1;
  sub_10000A980();
  uint64_t v35 = sub_10000A9F0();
  uint64_t v36 = *(void *)(v35 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v36 + 48))(v25, 1, v35) == 1)
  {
    sub_100006C3C((uint64_t)v25, &qword_100010390);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v30 + 56))(v28, 1, 1, v29);
    return sub_100006C3C((uint64_t)v28, &qword_100010398);
  }
  sub_10000A9E0();
  (*(void (**)(char *, uint64_t))(v36 + 8))(v25, v35);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v30 + 48))(v28, 1, v29) == 1) {
    return sub_100006C3C((uint64_t)v28, &qword_100010398);
  }
  uint64_t v38 = v29;
  uint64_t v93 = v30;
  v39 = *(void (**)(char *, char *))(v30 + 32);
  v40 = v111;
  uint64_t v91 = v38;
  v39(v111, v28);
  uint64_t v41 = sub_10000A7C0();
  unint64_t v43 = v42;
  id v44 = objc_allocWithZone((Class)SISchemaUUID);
  Class isa = sub_10000A750().super.isa;
  v46 = [v44 initWithBytesAsData:isa];
  sub_100006BAC(v41, v43);

  sub_10000A990();
  sub_100007738((uint64_t)v20, v112);
  sub_100006C3C((uint64_t)v20, &qword_100010380);
  uint64_t v47 = (uint64_t)v110;
  sub_10000A9A0();
  uint64_t v48 = sub_10000A960();
  uint64_t v49 = *(void *)(v48 - 8);
  int v50 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v49 + 48))(v47, 1, v48);
  v92 = v46;
  if (v50 == 1) {
    goto LABEL_6;
  }
  sub_100006CE0(v47, (uint64_t)v16);
  int v63 = (*(uint64_t (**)(char *, uint64_t))(v49 + 88))(v16, v48);
  if (v63 == enum case for CacheManagerTarget.invocation(_:))
  {
    (*(void (**)(char *, uint64_t))(v49 + 96))(v16, v48);
    v65 = v101;
    uint64_t v64 = v102;
    v66 = v103;
    (*(void (**)(char *, char *, uint8_t *))(v102 + 32))(v101, v16, v103);
    sub_100006D48(v46);
    (*(void (**)(char *, uint8_t *))(v64 + 8))(v65, v66);
    unint64_t v67 = 0xEA00000000006E6FLL;
    uint64_t v68 = 0x697461636F766E69;
    uint64_t v69 = v91;
    v70 = v109;
  }
  else
  {
    v70 = v109;
    if (v63 == enum case for CacheManagerTarget.insertContext(_:))
    {
      unint64_t v67 = 0xED0000747865746ELL;
      (*(void (**)(char *, uint64_t))(v49 + 96))(v16, v48);
      uint64_t v72 = (uint64_t)v97;
      uint64_t v71 = v98;
      uint64_t v73 = v99;
      (*(void (**)(char *, char *, uint64_t))(v98 + 32))(v97, v16, v99);
      v74 = sub_100007B40(v72, (uint64_t)v46);
      sub_100007208(v74);

      (*(void (**)(uint64_t, uint64_t))(v71 + 8))(v72, v73);
      uint64_t v75 = 0x747265736E69;
    }
    else
    {
      if (v63 != enum case for CacheManagerTarget.searchContext(_:))
      {
        (*(void (**)(char *, uint64_t))(v49 + 8))(v16, v48);
LABEL_6:
        if (qword_100010268 != -1) {
          swift_once();
        }
        uint64_t v51 = sub_10000AA10();
        sub_100006C04(v51, (uint64_t)qword_1000105E8);
        v53 = v106;
        uint64_t v52 = v107;
        uint64_t v54 = v108;
        (*(void (**)(char *, uint64_t, uint64_t))(v107 + 16))(v106, v34, v108);
        v55 = sub_10000AA00();
        os_log_type_t v56 = sub_10000AAA0();
        if (os_log_type_enabled(v55, v56))
        {
          v57 = (uint8_t *)swift_slowAlloc();
          v114[0] = swift_slowAlloc();
          *(_DWORD *)v57 = 136315138;
          v103 = v57 + 4;
          uint64_t v58 = (uint64_t)v104;
          sub_10000A9A0();
          uint64_t v59 = sub_10000AAD0();
          v60 = v53;
          unint64_t v62 = v61;
          sub_100006C3C(v58, &qword_100010378);
          uint64_t v113 = sub_100009F68(v59, v62, v114);
          uint64_t v47 = (uint64_t)v110;
          sub_10000AAE0();
          swift_bridgeObjectRelease();
          (*(void (**)(char *, uint64_t))(v52 + 8))(v60, v108);
          _os_log_impl((void *)&_mh_execute_header, v55, v56, "Unknown target type %s, skipping", v57, 0xCu);
          swift_arrayDestroy();
          v40 = v111;
          swift_slowDealloc();
          swift_slowDealloc();
        }
        else
        {
          (*(void (**)(char *, uint64_t))(v52 + 8))(v53, v54);
        }

        unint64_t v67 = 0xE700000000000000;
        uint64_t v69 = v91;
        v70 = v109;
        uint64_t v68 = 0x6E776F6E6B6E75;
        goto LABEL_19;
      }
      unint64_t v67 = 0xED0000747865746ELL;
      (*(void (**)(char *, uint64_t))(v49 + 96))(v16, v48);
      uint64_t v77 = (uint64_t)v94;
      uint64_t v76 = v95;
      uint64_t v78 = v96;
      (*(void (**)(char *, char *, uint64_t))(v95 + 32))(v94, v16, v96);
      v79 = sub_10000856C(v77, (uint64_t)v46);
      sub_100007208(v79);

      (*(void (**)(uint64_t, uint64_t))(v76 + 8))(v77, v78);
      uint64_t v75 = 0x686372616573;
    }
    uint64_t v68 = v75 & 0xFFFFFFFFFFFFLL | 0x6F43000000000000;
    uint64_t v69 = v91;
  }
LABEL_19:
  sub_100006C3C(v47, &qword_100010378);
  if (qword_100010260 != -1) {
    swift_once();
  }
  uint64_t v80 = sub_10000AA10();
  sub_100006C04(v80, (uint64_t)qword_1000105D0);
  uint64_t v81 = v93;
  (*(void (**)(char *, char *, uint64_t))(v93 + 16))(v70, v40, v69);
  swift_bridgeObjectRetain();
  v82 = sub_10000AA00();
  v83 = v40;
  os_log_type_t v84 = sub_10000AA90();
  if (os_log_type_enabled(v82, v84))
  {
    uint64_t v85 = swift_slowAlloc();
    v114[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v85 = 136315394;
    swift_bridgeObjectRetain();
    uint64_t v113 = sub_100009F68(v68, v67, v114);
    sub_10000AAE0();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v85 + 12) = 2080;
    sub_100006C98(&qword_1000103A0, 255, (void (*)(uint64_t))&type metadata accessor for UUID);
    uint64_t v86 = sub_10000AB50();
    uint64_t v113 = sub_100009F68(v86, v87, v114);
    sub_10000AAE0();
    swift_bridgeObjectRelease();
    v88 = *(void (**)(char *, uint64_t))(v81 + 8);
    v88(v70, v69);
    _os_log_impl((void *)&_mh_execute_header, v82, v84, "Processed biome event of type %s, CM Id %s successfully", (uint8_t *)v85, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    sub_100006C3C(v112, &qword_100010388);
    return ((uint64_t (*)(char *, uint64_t))v88)(v111, v69);
  }
  else
  {

    v89 = *(void (**)(char *, uint64_t))(v81 + 8);
    v89(v70, v69);
    swift_bridgeObjectRelease_n();
    sub_100006C3C(v112, &qword_100010388);
    return ((uint64_t (*)(char *, uint64_t))v89)(v83, v69);
  }
}

uint64_t sub_100006588()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t sub_100006598(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_100006630;
  return sub_100004D64(a1);
}

uint64_t sub_100006630()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_100006724()
{
  uint64_t v0 = type metadata accessor for LLMCacheSELFIngestor();
  uint64_t v2 = sub_100006C98(&qword_100010358, v1, (void (*)(uint64_t))type metadata accessor for LLMCacheSELFIngestor);

  return IngestionExtension.configuration.getter(v0, v2);
}

uint64_t sub_1000067A4@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for LLMCacheSELFIngestor();
  uint64_t result = swift_allocObject();
  *a1 = result;
  return result;
}

int main(int argc, const char **argv, const char **envp)
{
  type metadata accessor for LLMCacheSELFIngestor();
  sub_100006C98(&qword_100010290, v3, (void (*)(uint64_t))type metadata accessor for LLMCacheSELFIngestor);
  sub_10000A830();
  return 0;
}

uint64_t type metadata accessor for LLMCacheSELFIngestor()
{
  return self;
}

uint64_t sub_100006888(uint64_t a1, uint64_t a2)
{
  return sub_100006C98(&qword_100010290, a2, (void (*)(uint64_t))type metadata accessor for LLMCacheSELFIngestor);
}

uint64_t sub_1000068D0(uint64_t a1, uint64_t a2)
{
  return *(void *)(swift_getOpaqueTypeConformance2() + 8);
}

uint64_t sub_100006954(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_100006998()
{
  unint64_t result = qword_100010368;
  if (!qword_100010368)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100010368);
  }
  return result;
}

void *sub_1000069D8(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_100006A1C()
{
  uint64_t v1 = sub_10000A7F0();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 24) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v5, v6);
}

uint64_t sub_100006AE8(uint64_t a1)
{
  uint64_t v3 = *(void *)(sub_10000A7F0() - 8);
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));

  return sub_1000057F4(a1, v4, v5);
}

uint64_t sub_100006B5C(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_100006BAC(uint64_t a1, unint64_t a2)
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

uint64_t sub_100006C04(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_100006C3C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100006954(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_100006C98(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
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

uint64_t sub_100006CE0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100006954(&qword_100010378);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void sub_100006D48(NSObject *a1)
{
  sub_100006954(&qword_100010398);
  __chkstk_darwin();
  uint64_t v3 = (char *)&v29 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_10000A7D0();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin();
  uint64_t v7 = (char *)&v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v8 = [objc_allocWithZone((Class)SISchemaRequestLink) init];
  if (v8)
  {
    uint64_t v9 = v8;
    id v10 = [objc_allocWithZone((Class)SISchemaRequestLinkInfo) init];
    if (v10)
    {
      uint64_t v11 = v10;
      id v12 = [objc_allocWithZone((Class)SISchemaRequestLinkInfo) init];
      if (v12)
      {
        uint64_t v13 = v12;
        sub_10000A9C0();
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4) == 1)
        {
          sub_100006C3C((uint64_t)v3, &qword_100010398);
          if (qword_100010268 != -1) {
            swift_once();
          }
          uint64_t v14 = sub_10000AA10();
          sub_100006C04(v14, (uint64_t)qword_1000105E8);
          uint64_t v15 = sub_10000AA00();
          os_log_type_t v16 = sub_10000AAB0();
          if (os_log_type_enabled(v15, v16))
          {
            uint64_t v17 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)uint64_t v17 = 0;
            _os_log_impl((void *)&_mh_execute_header, v15, v16, "Failed to emit RequestLink, clientTraceId is nil", v17, 2u);
            swift_slowDealloc();
          }
          else
          {
          }
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v7, v3, v4);
          [v11 setComponent:46];
          uint64_t v22 = sub_10000A7C0();
          unint64_t v24 = v23;
          id v25 = objc_allocWithZone((Class)SISchemaUUID);
          v26.super.Class isa = sub_10000A750().super.isa;
          os_log_t v30 = a1;
          Class isa = v26.super.isa;
          id v28 = [v25 initWithBytesAsData:v26.super.isa];
          sub_100006BAC(v22, v24);

          [v11 setUuid:v28];
          [v9 setSource:v11];
          [v13 setComponent:47];
          [v13 setUuid:v30];
          [v9 setTarget:v13];
          objc_msgSend(objc_msgSend(self, "sharedStream"), "emitMessage:", v9);

          swift_unknownObjectRelease();
          (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
        }
        return;
      }
    }
    else
    {
      uint64_t v11 = v9;
    }
  }
  if (qword_100010268 != -1) {
    swift_once();
  }
  uint64_t v18 = sub_10000AA10();
  sub_100006C04(v18, (uint64_t)qword_1000105E8);
  os_log_t v30 = (os_log_t)sub_10000AA00();
  os_log_type_t v19 = sub_10000AAB0();
  if (os_log_type_enabled(v30, v19))
  {
    uint64_t v20 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v20 = 0;
    _os_log_impl((void *)&_mh_execute_header, v30, v19, "Failed to emit RequestLink, either RequestLink or RequestLinkInfo is nil", v20, 2u);
    swift_slowDealloc();
  }
  os_log_t v21 = v30;
}

void sub_100007208(void *a1)
{
  if (a1)
  {
    id v1 = a1;
    sub_10000A7E0();
  }
}

uint64_t sub_100007430(uint64_t a1)
{
  return sub_100007518(a1, qword_1000105D0, &qword_100010278, (id *)&qword_100010618);
}

uint64_t *sub_10000745C(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_1000074C0(uint64_t a1)
{
  return sub_100007518(a1, qword_1000105E8, &qword_100010280, (id *)&qword_100010620);
}

uint64_t sub_1000074EC(uint64_t a1)
{
  return sub_100007518(a1, qword_100010600, &qword_100010288, (id *)&qword_100010628);
}

uint64_t sub_100007518(uint64_t a1, uint64_t *a2, void *a3, id *a4)
{
  uint64_t v7 = sub_10000AA10();
  sub_10000745C(v7, a2);
  sub_100006C04(v7, (uint64_t)a2);
  if (*a3 != -1) {
    swift_once();
  }
  id v8 = *a4;
  return sub_10000AA20();
}

uint64_t sub_1000075A4()
{
  sub_10000762C();
  uint64_t result = sub_10000AAC0();
  qword_100010618 = result;
  return result;
}

uint64_t sub_10000760C(char a1)
{
  return *(void *)&aBiomepulingest[8 * a1];
}

unint64_t sub_10000762C()
{
  unint64_t result = qword_1000103B0;
  if (!qword_1000103B0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1000103B0);
  }
  return result;
}

uint64_t sub_10000766C()
{
  sub_10000762C();
  uint64_t result = sub_10000AAC0();
  qword_100010620 = result;
  return result;
}

uint64_t sub_1000076CC()
{
  sub_10000762C();
  uint64_t result = sub_10000AAC0();
  qword_100010628 = result;
  return result;
}

uint64_t sub_100007738@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  sub_100006954(&qword_100010380);
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v5 = (char *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10000A970();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = ((uint64_t (*)(void))__chkstk_darwin)();
  id v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  id v12 = (char *)&v20 - v11;
  sub_100009340(a1, (uint64_t)v5);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) == 1)
  {
    sub_100006C3C((uint64_t)v5, &qword_100010380);
    if (qword_100010270 != -1) {
      swift_once();
    }
    uint64_t v13 = sub_10000AA10();
    sub_100006C04(v13, (uint64_t)qword_100010600);
    uint64_t v14 = sub_10000AA00();
    os_log_type_t v15 = sub_10000AAB0();
    if (os_log_type_enabled(v14, v15))
    {
      os_log_type_t v16 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)os_log_type_t v16 = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, v15, "MonotonicTimestamp is nil", v16, 2u);
      swift_slowDealloc();
    }

    uint64_t v17 = sub_10000A820();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(a2, 1, 1, v17);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v12, v5, v6);
    (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v10, v12, v6);
    sub_10000A810();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v12, v6);
    uint64_t v19 = sub_10000A820();
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(a2, 0, 1, v19);
  }
}

id sub_100007A28(uint64_t a1)
{
  id v2 = [objc_allocWithZone((Class)CMSchemaCMClientEventMetadata) init];
  if (v2)
  {
    id v3 = v2;
    [v2 setCmId:a1];
  }
  else
  {
    if (qword_100010270 != -1) {
      swift_once();
    }
    uint64_t v4 = sub_10000AA10();
    sub_100006C04(v4, (uint64_t)qword_100010600);
    uint64_t v5 = sub_10000AA00();
    os_log_type_t v6 = sub_10000AAB0();
    if (os_log_type_enabled(v5, v6))
    {
      uint64_t v7 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "Failed to build CMClientEventMetadata", v7, 2u);
      swift_slowDealloc();
    }

    return 0;
  }
  return v3;
}

NSObject *sub_100007B40(uint64_t a1, uint64_t a2)
{
  uint64_t v65 = a2;
  uint64_t v3 = sub_100006954(&qword_1000103B8);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)&v59 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100006954(&qword_1000103C0);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)&v59 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_10000A870();
  uint64_t v61 = *(void *)(v9 - 8);
  uint64_t v10 = __chkstk_darwin(v9);
  id v12 = (char *)&v59 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  uint64_t v14 = (char *)&v59 - v13;
  uint64_t v15 = sub_10000A8B0();
  uint64_t v62 = *(void *)(v15 - 8);
  uint64_t v63 = v15;
  __chkstk_darwin(v15);
  uint64_t v64 = (char *)&v59 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_10000A8C0();
  uint64_t v18 = *(void *)(v17 - 8);
  __chkstk_darwin(v17);
  uint64_t v20 = (char *)&v59 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v66 = [objc_allocWithZone((Class)CMSchemaCMInsertContext) init];
  if (!v66) {
    goto LABEL_7;
  }
  v60 = [objc_allocWithZone((Class)CMSchemaCMClientEvent) init];
  if (!v60)
  {

LABEL_7:
    if (qword_100010270 != -1) {
      swift_once();
    }
    uint64_t v25 = sub_10000AA10();
    sub_100006C04(v25, (uint64_t)qword_100010600);
    NSData v26 = sub_10000AA00();
    os_log_type_t v27 = sub_10000AAB0();
    if (os_log_type_enabled(v26, v27))
    {
      id v28 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v28 = 0;
      _os_log_impl((void *)&_mh_execute_header, v26, v27, "Failed to build CMClientEvent for insert event, either CMInsertContext or CMClientEvent is nil", v28, 2u);
      swift_slowDealloc();
    }

    return 0;
  }
  (*(void (**)(char *, uint64_t, uint64_t))(v18 + 16))(v20, a1, v17);
  int v21 = (*(uint64_t (**)(char *, uint64_t))(v18 + 88))(v20, v17);
  if (v21 != enum case for CacheManagerInsert.started(_:))
  {
    if (v21 == enum case for CacheManagerInsert.ended(_:))
    {
      id v29 = [objc_allocWithZone((Class)CMSchemaCMInsertEnded) init];
      if (v29)
      {
        unint64_t v23 = v29;
        [v29 setExists:1];
        unint64_t v24 = "setEnded:";
        goto LABEL_15;
      }
      uint64_t v38 = v60;
      if (qword_100010270 != -1) {
        swift_once();
      }
      uint64_t v46 = sub_10000AA10();
      sub_100006C04(v46, (uint64_t)qword_100010600);
      v40 = sub_10000AA00();
      os_log_type_t v41 = sub_10000AAB0();
      if (os_log_type_enabled(v40, v41))
      {
        unint64_t v42 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)unint64_t v42 = 0;
        unint64_t v43 = "Failed to build CMClientEvent for insert event, CMInsertEnded is nil";
        goto LABEL_33;
      }
    }
    else
    {
      if (v21 == enum case for CacheManagerInsert.failed(_:))
      {
        (*(void (**)(char *, uint64_t))(v18 + 96))(v20, v17);
        (*(void (**)(char *, char *, uint64_t))(v62 + 32))(v64, v20, v63);
        id v34 = [objc_allocWithZone((Class)CMSchemaCMInsertFailed) init];
        if (v34)
        {
          uint64_t v35 = v34;
          sub_10000A8A0();
          uint64_t v36 = sub_10000A890();
          uint64_t v37 = *(void *)(v36 - 8);
          if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v37 + 48))(v5, 1, v36) == 1)
          {
            sub_100006C3C((uint64_t)v5, &qword_1000103B8);
            (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v61 + 56))(v8, 1, 1, v9);
          }
          else
          {
            sub_10000A880();
            (*(void (**)(char *, uint64_t))(v37 + 8))(v5, v36);
            uint64_t v48 = v61;
            if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v61 + 48))(v8, 1, v9) != 1)
            {
              (*(void (**)(char *, char *, uint64_t))(v48 + 32))(v14, v8, v9);
              (*(void (**)(char *, char *, uint64_t))(v48 + 16))(v12, v14, v9);
              int v57 = (*(uint64_t (**)(char *, uint64_t))(v48 + 88))(v12, v9);
              if (v57 == enum case for CacheManagerError.ErrorType.invalidId(_:))
              {
                uint64_t v58 = 1;
                uint64_t v31 = v60;
                uint64_t v32 = v65;
                os_log_t v30 = v66;
              }
              else
              {
                uint64_t v31 = v60;
                uint64_t v32 = v65;
                os_log_t v30 = v66;
                if (v57 == enum case for CacheManagerError.ErrorType.internalFailure(_:))
                {
                  uint64_t v58 = 2;
                }
                else
                {
                  (*(void (**)(char *, uint64_t))(v48 + 8))(v12, v9);
                  uint64_t v58 = 0;
                }
              }
              [v35 setReason:v58];
              [v30 setFailed:v35];

              (*(void (**)(char *, uint64_t))(v48 + 8))(v14, v9);
              (*(void (**)(char *, uint64_t))(v62 + 8))(v64, v63);
              goto LABEL_16;
            }
          }

          sub_100006C3C((uint64_t)v8, &qword_1000103C0);
        }
        if (qword_100010270 != -1) {
          swift_once();
        }
        uint64_t v49 = sub_10000AA10();
        sub_100006C04(v49, (uint64_t)qword_100010600);
        int v50 = sub_10000AA00();
        os_log_type_t v51 = sub_10000AAB0();
        BOOL v52 = os_log_type_enabled(v50, v51);
        v53 = v60;
        uint64_t v54 = v66;
        if (v52)
        {
          v55 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v55 = 0;
          _os_log_impl((void *)&_mh_execute_header, v50, v51, "Failed to build CMClientEvent for insert event, either CMInsertFailed or ErrorType is nil", v55, 2u);
          swift_slowDealloc();
        }

        (*(void (**)(char *, uint64_t))(v62 + 8))(v64, v63);
        return 0;
      }
      if (qword_100010270 != -1) {
        swift_once();
      }
      uint64_t v44 = sub_10000AA10();
      sub_100006C04(v44, (uint64_t)qword_100010600);
      v40 = sub_10000AA00();
      os_log_type_t v41 = sub_10000AAB0();
      BOOL v45 = os_log_type_enabled(v40, v41);
      uint64_t v38 = v60;
      if (v45)
      {
        unint64_t v42 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)unint64_t v42 = 0;
        unint64_t v43 = "Failed to build CMClientEvent for insert event, encountered unknown context type";
        goto LABEL_33;
      }
    }
LABEL_34:
    uint64_t v47 = v40;
    v40 = v38;
    uint64_t v38 = v66;
    goto LABEL_35;
  }
  id v22 = [objc_allocWithZone((Class)CMSchemaCMInsertStarted) init];
  if (!v22)
  {
    uint64_t v38 = v60;
    if (qword_100010270 != -1) {
      swift_once();
    }
    uint64_t v39 = sub_10000AA10();
    sub_100006C04(v39, (uint64_t)qword_100010600);
    v40 = sub_10000AA00();
    os_log_type_t v41 = sub_10000AAB0();
    if (os_log_type_enabled(v40, v41))
    {
      unint64_t v42 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v42 = 0;
      unint64_t v43 = "Failed to build CMClientEvent for insert event, CMInsertStarted is nil";
LABEL_33:
      _os_log_impl((void *)&_mh_execute_header, v40, v41, v43, v42, 2u);
      swift_slowDealloc();
      uint64_t v47 = v66;
LABEL_35:

      (*(void (**)(char *, uint64_t))(v18 + 8))(v20, v17);
      return 0;
    }
    goto LABEL_34;
  }
  unint64_t v23 = v22;
  [v22 setExists:1];
  unint64_t v24 = "setStartedOrChanged:";
LABEL_15:
  os_log_t v30 = v66;
  objc_msgSend(v66, v24, v23);

  (*(void (**)(char *, uint64_t))(v18 + 8))(v20, v17);
  uint64_t v31 = v60;
  uint64_t v32 = v65;
LABEL_16:
  [v31 setInsertContext:v30];
  id v33 = sub_100007A28(v32);
  [v31 setEventMetadata:v33];

  return v31;
}

NSObject *sub_10000856C(uint64_t a1, uint64_t a2)
{
  uint64_t v102 = a2;
  uint64_t v103 = a1;
  uint64_t v2 = sub_100006954(&qword_1000103B8);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)&v89 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100006954(&qword_1000103C0);
  __chkstk_darwin(v5 - 8);
  uint64_t v93 = (char *)&v89 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_10000A870();
  uint64_t v94 = *(void *)(v7 - 8);
  uint64_t v95 = v7;
  uint64_t v8 = __chkstk_darwin(v7);
  uint64_t v91 = (char *)&v89 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v90 = (char *)&v89 - v10;
  uint64_t v11 = sub_10000A940();
  uint64_t v97 = *(void *)(v11 - 8);
  uint64_t v98 = v11;
  __chkstk_darwin(v11);
  uint64_t v96 = (char *)&v89 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_100006954(&qword_1000103C8);
  __chkstk_darwin(v13 - 8);
  uint64_t v15 = (char *)&v89 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_10000A8D0();
  uint64_t v99 = *(void *)(v16 - 8);
  uint64_t v17 = __chkstk_darwin(v16);
  uint64_t v19 = (char *)&v89 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v17);
  int v21 = (char *)&v89 - v20;
  uint64_t v22 = sub_10000A920();
  uint64_t v101 = *(void *)(v22 - 8);
  __chkstk_darwin(v22);
  uint64_t v100 = (char *)&v89 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = sub_10000A950();
  uint64_t v25 = *(void *)(v24 - 8);
  __chkstk_darwin(v24);
  os_log_type_t v27 = (char *)&v89 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  v104 = [objc_allocWithZone((Class)CMSchemaCMSearchContext) init];
  if (!v104) {
    goto LABEL_7;
  }
  v92 = [objc_allocWithZone((Class)CMSchemaCMClientEvent) init];
  if (!v92)
  {

LABEL_7:
    if (qword_100010270 != -1) {
      swift_once();
    }
    uint64_t v32 = sub_10000AA10();
    sub_100006C04(v32, (uint64_t)qword_100010600);
    id v33 = sub_10000AA00();
    os_log_type_t v34 = sub_10000AAB0();
    if (os_log_type_enabled(v33, v34))
    {
      uint64_t v35 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v35 = 0;
      _os_log_impl((void *)&_mh_execute_header, v33, v34, "Failed to build CMClientEvent for search event, either CMInsertContext or CMClientEvent is nil", v35, 2u);
      swift_slowDealloc();
    }

    return 0;
  }
  (*(void (**)(char *, uint64_t, uint64_t))(v25 + 16))(v27, v103, v24);
  int v28 = (*(uint64_t (**)(char *, uint64_t))(v25 + 88))(v27, v24);
  if (v28 == enum case for CacheManagerSearch.started(_:))
  {
    id v29 = [objc_allocWithZone((Class)CMSchemaCMSearchStarted) init];
    if (v29)
    {
      os_log_t v30 = v29;
      [v29 setExists:1];
      uint64_t v31 = v104;
      [v104 setStartedOrChanged:v30];

      (*(void (**)(char *, uint64_t))(v25 + 8))(v27, v24);
LABEL_60:
      uint64_t v36 = v92;
      uint64_t v83 = v102;
LABEL_61:
      [v36 setSearchContext:v31];
      id v88 = sub_100007A28(v83);
      [v36 setEventMetadata:v88];

      return v36;
    }
    if (qword_100010270 != -1) {
      swift_once();
    }
    uint64_t v53 = sub_10000AA10();
    sub_100006C04(v53, (uint64_t)qword_100010600);
    uint64_t v54 = sub_10000AA00();
    os_log_type_t v55 = sub_10000AAB0();
    if (os_log_type_enabled(v54, v55))
    {
      os_log_type_t v56 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)os_log_type_t v56 = 0;
      int v57 = "Failed to build CMClientEvent for search event, CMSearchStarted is nil";
LABEL_32:
      _os_log_impl((void *)&_mh_execute_header, v54, v55, v57, v56, 2u);
      swift_slowDealloc();
      uint64_t v59 = v104;
      v60 = v92;
LABEL_34:

      (*(void (**)(char *, uint64_t))(v25 + 8))(v27, v24);
      return 0;
    }
    goto LABEL_33;
  }
  if (v28 == enum case for CacheManagerSearch.ended(_:))
  {
    (*(void (**)(char *, uint64_t))(v25 + 96))(v27, v24);
    uint64_t v39 = v100;
    uint64_t v38 = v101;
    (*(void (**)(char *, char *, uint64_t))(v101 + 32))(v100, v27, v22);
    id v40 = [objc_allocWithZone((Class)CMSchemaCMSearchEnded) init];
    if (v40)
    {
      os_log_type_t v41 = v40;
      unint64_t v42 = v39;
      uint64_t v43 = sub_10000A8E0();
      uint64_t v31 = v104;
      if ((v43 & 0x100000000) == 0) {
        [v41 setResultCount:v43];
      }
      sub_10000A8F0();
      uint64_t v44 = v99;
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v99 + 48))(v15, 1, v16) == 1)
      {
        sub_100006C3C((uint64_t)v15, &qword_1000103C8);
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v44 + 32))(v21, v15, v16);
        (*(void (**)(char *, char *, uint64_t))(v44 + 16))(v19, v21, v16);
        int v68 = (*(uint64_t (**)(char *, uint64_t))(v44 + 88))(v19, v16);
        if (v68 == enum case for CacheManagerSearch.CacheManagerSearchStrategy.exactMatch(_:))
        {
          uint64_t v69 = 1;
        }
        else if (v68 == enum case for CacheManagerSearch.CacheManagerSearchStrategy.approximateMatch(_:))
        {
          uint64_t v69 = 2;
        }
        else
        {
          (*(void (**)(char *, uint64_t))(v44 + 8))(v19, v16);
          uint64_t v69 = 0;
        }
        [v41 setSearchStrategy:v69];
        (*(void (**)(char *, uint64_t))(v44 + 8))(v21, v16);
      }
      uint64_t v84 = sub_10000A910();
      if ((v85 & 1) == 0) {
        [v41 setHighestMatchScore:*(double *)&v84];
      }
      uint64_t v86 = sub_10000A900();
      if ((v87 & 1) == 0) {
        [v41 setLowestMatchScore:*(double *)&v86];
      }
      [v31 setEnded:v41];

      (*(void (**)(char *, uint64_t))(v38 + 8))(v42, v22);
      goto LABEL_60;
    }
    uint64_t v61 = v104;
    if (qword_100010270 != -1) {
      swift_once();
    }
    uint64_t v62 = sub_10000AA10();
    sub_100006C04(v62, (uint64_t)qword_100010600);
    uint64_t v63 = sub_10000AA00();
    os_log_type_t v64 = sub_10000AAB0();
    BOOL v65 = os_log_type_enabled(v63, v64);
    v66 = v100;
    if (v65)
    {
      unint64_t v67 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v67 = 0;
      _os_log_impl((void *)&_mh_execute_header, v63, v64, "Failed to build CMClientEvent for search event, CMSearchEnded is nil", v67, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v101 + 8))(v66, v22);
  }
  else
  {
    if (v28 != enum case for CacheManagerSearch.failed(_:))
    {
      if (qword_100010270 != -1) {
        swift_once();
      }
      uint64_t v58 = sub_10000AA10();
      sub_100006C04(v58, (uint64_t)qword_100010600);
      uint64_t v54 = sub_10000AA00();
      os_log_type_t v55 = sub_10000AAB0();
      if (os_log_type_enabled(v54, v55))
      {
        os_log_type_t v56 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)os_log_type_t v56 = 0;
        int v57 = "Failed to build CMClientEvent for search event, encountered unknown context type";
        goto LABEL_32;
      }
LABEL_33:
      uint64_t v59 = v54;
      uint64_t v54 = v92;
      v60 = v104;
      goto LABEL_34;
    }
    (*(void (**)(char *, uint64_t))(v25 + 96))(v27, v24);
    uint64_t v46 = v96;
    uint64_t v45 = v97;
    uint64_t v47 = v98;
    (*(void (**)(char *, char *, uint64_t))(v97 + 32))(v96, v27, v98);
    id v48 = [objc_allocWithZone((Class)CMSchemaCMSearchFailed) init];
    if (v48)
    {
      uint64_t v49 = v48;
      sub_10000A930();
      uint64_t v50 = sub_10000A890();
      uint64_t v51 = *(void *)(v50 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v51 + 48))(v4, 1, v50) == 1)
      {
        sub_100006C3C((uint64_t)v4, &qword_1000103B8);
        uint64_t v52 = (uint64_t)v93;
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v94 + 56))(v93, 1, 1, v95);
      }
      else
      {
        v70 = v93;
        sub_10000A880();
        uint64_t v52 = (uint64_t)v70;
        (*(void (**)(char *, uint64_t))(v51 + 8))(v4, v50);
        uint64_t v72 = v94;
        uint64_t v71 = v95;
        if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v94 + 48))(v52, 1, v95) != 1)
        {
          v79 = v90;
          (*(void (**)(char *, uint64_t, uint64_t))(v72 + 32))(v90, v52, v71);
          uint64_t v80 = v91;
          (*(void (**)(char *, char *, uint64_t))(v72 + 16))(v91, v79, v71);
          int v81 = (*(uint64_t (**)(char *, uint64_t))(v72 + 88))(v80, v71);
          if (v81 == enum case for CacheManagerError.ErrorType.invalidId(_:))
          {
            uint64_t v82 = 1;
            uint64_t v36 = v92;
            uint64_t v31 = v104;
            uint64_t v83 = v102;
          }
          else
          {
            uint64_t v36 = v92;
            uint64_t v31 = v104;
            uint64_t v83 = v102;
            if (v81 == enum case for CacheManagerError.ErrorType.internalFailure(_:))
            {
              uint64_t v82 = 2;
            }
            else
            {
              (*(void (**)(char *, uint64_t))(v72 + 8))(v91, v71);
              uint64_t v82 = 0;
            }
          }
          [v49 setReason:v82];
          [v31 setFailed:v49];

          (*(void (**)(char *, uint64_t))(v72 + 8))(v79, v71);
          (*(void (**)(char *, uint64_t))(v45 + 8))(v46, v47);
          goto LABEL_61;
        }
      }

      sub_100006C3C(v52, &qword_1000103C0);
    }
    if (qword_100010270 != -1) {
      swift_once();
    }
    uint64_t v73 = sub_10000AA10();
    sub_100006C04(v73, (uint64_t)qword_100010600);
    v74 = sub_10000AA00();
    os_log_type_t v75 = sub_10000AAB0();
    BOOL v76 = os_log_type_enabled(v74, v75);
    uint64_t v77 = v104;
    if (v76)
    {
      uint64_t v78 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v78 = 0;
      _os_log_impl((void *)&_mh_execute_header, v74, v75, "Failed to build CMClientEvent for search event, either CMSearchFailed or ErrorType is nil", v78, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v45 + 8))(v46, v47);
  }
  return 0;
}

uint64_t sub_100009340(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100006954(&qword_100010380);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000093A8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v36 = a1;
  uint64_t v3 = sub_10000A7B0();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = __chkstk_darwin(v3);
  uint64_t v7 = (char *)&v33 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v33 - v8;
  sub_10000A790();
  uint64_t v10 = *(void **)(v1 + 16);
  if (v10)
  {
    swift_bridgeObjectRetain();
    NSString v11 = sub_10000AA50();
    swift_bridgeObjectRelease();
    id v12 = [v10 valueForKey:v11];

    if (v12)
    {
      sub_10000AB00();
      swift_unknownObjectRelease();
    }
    else
    {
      memset(v37, 0, sizeof(v37));
    }
    sub_10000A690((uint64_t)v37, (uint64_t)&v38);
    if (*((void *)&v39 + 1))
    {
      sub_10000A630((uint64_t)&v38);
      swift_bridgeObjectRetain();
      NSString v13 = sub_10000AA50();
      swift_bridgeObjectRelease();
      [v10 doubleForKey:v13];
      uint64_t v15 = v14;

      if (qword_100010260 != -1) {
        swift_once();
      }
      uint64_t v16 = sub_10000AA10();
      sub_100006C04(v16, (uint64_t)qword_1000105D0);
      swift_retain();
      uint64_t v17 = sub_10000AA00();
      os_log_type_t v18 = sub_10000AAA0();
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
        *(void *)&v37[0] = sub_100009F68(v20, v21, (uint64_t *)&v38);
        sub_10000AAE0();
        swift_release();
        swift_bridgeObjectRelease();
        *(_WORD *)(v19 + 12) = 2048;
        *(void *)&v37[0] = v15;
        uint64_t v4 = v35;
        sub_10000AAE0();
        _os_log_impl((void *)&_mh_execute_header, v17, v18, "The userdefault has key %s with the value %f", (uint8_t *)v19, 0x16u);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {

        swift_release();
      }
      sub_10000A760();
      sub_10000A6F8();
      if (sub_10000AA40()) {
        uint64_t v31 = v7;
      }
      else {
        uint64_t v31 = v9;
      }
      (*(void (**)(uint64_t, char *, uint64_t))(v4 + 16))(v36, v31, v3);
      uint64_t v32 = *(void (**)(char *, uint64_t))(v4 + 8);
      v32(v7, v3);
      return ((uint64_t (*)(char *, uint64_t))v32)(v9, v3);
    }
  }
  else
  {
    long long v38 = 0u;
    long long v39 = 0u;
  }
  sub_10000A630((uint64_t)&v38);
  if (qword_100010260 != -1) {
    swift_once();
  }
  uint64_t v22 = sub_10000AA10();
  sub_100006C04(v22, (uint64_t)qword_1000105D0);
  swift_retain();
  uint64_t v23 = sub_10000AA00();
  os_log_type_t v24 = sub_10000AAA0();
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
    *(void *)&v37[0] = sub_100009F68(v29, v27, (uint64_t *)&v38);
    uint64_t v4 = v35;
    sub_10000AAE0();
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

uint64_t sub_100009934(uint64_t a1)
{
  unint64_t v3 = v1[4];
  uint64_t v4 = v1[3] & 0xFFFFFFFFFFFFLL;
  if ((v3 & 0x2000000000000000) != 0) {
    uint64_t v4 = HIBYTE(v3) & 0xF;
  }
  if (v4)
  {
    uint64_t v5 = v1;
    sub_10000A770();
    if (qword_100010260 != -1) {
      swift_once();
    }
    uint64_t v6 = sub_10000AA10();
    sub_100006C04(v6, (uint64_t)qword_1000105D0);
    swift_retain();
    uint64_t v7 = sub_10000AA00();
    os_log_type_t v8 = sub_10000AAA0();
    if (os_log_type_enabled(v7, v8))
    {
      uint64_t v9 = swift_slowAlloc();
      uint64_t v29 = swift_slowAlloc();
      *(_DWORD *)uint64_t v9 = 136315394;
      uint64_t v10 = v1[5];
      unint64_t v11 = v1[6];
      swift_bridgeObjectRetain();
      sub_100009F68(v10, v11, &v29);
      sub_10000AAE0();
      swift_release();
      swift_bridgeObjectRelease();
      *(_WORD *)(v9 + 12) = 2048;
      sub_10000AAE0();
      _os_log_impl((void *)&_mh_execute_header, v7, v8, "Set key %s to %f", (uint8_t *)v9, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      id v12 = (void *)v1[2];
      if (v12)
      {
LABEL_8:
        id v13 = v12;
        Class isa = sub_10000AA80().super.super.isa;
        swift_bridgeObjectRetain();
        NSString v15 = sub_10000AA50();
        swift_bridgeObjectRelease();
        [v13 setValue:isa forKey:v15];

LABEL_21:
        uint64_t v28 = sub_10000A7B0();
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
    uint64_t v23 = sub_10000AA00();
    os_log_type_t v24 = sub_10000AAA0();
    if (os_log_type_enabled(v23, v24))
    {
      uint64_t v25 = (uint8_t *)swift_slowAlloc();
      uint64_t v29 = swift_slowAlloc();
      *(_DWORD *)uint64_t v25 = 136315138;
      uint64_t v26 = v5[5];
      unint64_t v27 = v5[6];
      swift_bridgeObjectRetain();
      sub_100009F68(v26, v27, &v29);
      sub_10000AAE0();
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
  if (qword_100010260 != -1) {
    swift_once();
  }
  uint64_t v16 = sub_10000AA10();
  sub_100006C04(v16, (uint64_t)qword_1000105D0);
  uint64_t v17 = sub_10000AA00();
  os_log_type_t v18 = sub_10000AAA0();
  if (os_log_type_enabled(v17, v18))
  {
    uint64_t v19 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v19 = 0;
    _os_log_impl((void *)&_mh_execute_header, v17, v18, "Skip userDefault set due to empty identifier", v19, 2u);
    swift_slowDealloc();
  }

  uint64_t v20 = sub_10000A7B0();
  unint64_t v21 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v20 - 8) + 8);

  return v21(a1, v20);
}

uint64_t sub_100009E10()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return _swift_deallocClassInstance(v0, 56, 7);
}

uint64_t type metadata accessor for BiomeBookmarkProvider()
{
  return self;
}

uint64_t sub_100009E7C(uint64_t result, unsigned char **a2)
{
  uint64_t v2 = *a2;
  *uint64_t v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_100009E8C(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_100009EC8(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_100009EF0(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a4();
  sub_100009F68(v6, v7, a3);
  uint64_t v8 = *a1 + 8;
  sub_10000AAE0();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_100009F68(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_10000A03C(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_10000A5D0((uint64_t)v12, *a3);
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
      sub_10000A5D0((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_100006B5C((uint64_t)v12);
  return v7;
}

uint64_t sub_10000A03C(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_10000AAF0();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_10000A1F8(a5, a6);
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
  uint64_t v8 = sub_10000AB20();
  if (!v8)
  {
    sub_10000AB30();
    __break(1u);
LABEL_17:
    uint64_t result = sub_10000AB40();
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

uint64_t sub_10000A1F8(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_10000A290(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_10000A470(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_10000A470(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_10000A290(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_10000A408(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_10000AB10();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_10000AB30();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_10000AA70();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_10000AB40();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_10000AB30();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_10000A408(uint64_t a1, uint64_t a2)
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
  sub_100006954(&qword_1000104B0);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_10000A470(char a1, int64_t a2, char a3, char *a4)
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
    sub_100006954(&qword_1000104B0);
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
  id v13 = a4 + 32;
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
  uint64_t result = sub_10000AB40();
  __break(1u);
  return result;
}

unsigned char **sub_10000A5C0(unsigned char **result, uint64_t a2, uint64_t a3, char a4)
{
  unint64_t v4 = *result;
  *unint64_t v4 = a4;
  *uint64_t result = v4 + 1;
  return result;
}

uint64_t sub_10000A5D0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_10000A630(uint64_t a1)
{
  uint64_t v2 = sub_100006954(&qword_1000104B8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10000A690(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100006954(&qword_1000104B8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_10000A6F8()
{
  unint64_t result = qword_1000104C0;
  if (!qword_1000104C0)
  {
    sub_10000A7B0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000104C0);
  }
  return result;
}

NSData sub_10000A750()
{
  return Data._bridgeToObjectiveC()();
}

uint64_t sub_10000A760()
{
  return Date.init(timeIntervalSinceReferenceDate:)();
}

uint64_t sub_10000A770()
{
  return Date.timeIntervalSinceReferenceDate.getter();
}

NSDate sub_10000A780()
{
  return Date._bridgeToObjectiveC()();
}

uint64_t sub_10000A790()
{
  return Date.init(timeIntervalSinceNow:)();
}

uint64_t sub_10000A7A0()
{
  return static Date.now.getter();
}

uint64_t sub_10000A7B0()
{
  return type metadata accessor for Date();
}

uint64_t sub_10000A7C0()
{
  return UUID.si_data()();
}

uint64_t sub_10000A7D0()
{
  return type metadata accessor for UUID();
}

uint64_t sub_10000A7E0()
{
  return StagingPool.add(timestamp:message:)();
}

uint64_t sub_10000A7F0()
{
  return type metadata accessor for StagingPool();
}

uint64_t sub_10000A810()
{
  return MonotonicTimestamp.init(biomeType:)();
}

uint64_t sub_10000A820()
{
  return type metadata accessor for MonotonicTimestamp();
}

uint64_t sub_10000A830()
{
  return static AppExtension.main()();
}

uint64_t sub_10000A840()
{
  return static Library.Streams.LLMCache.CacheManagerTelemetry.identifier.getter();
}

uint64_t sub_10000A850()
{
  return type metadata accessor for Library.Streams.LLMCache.CacheManagerTelemetry();
}

uint64_t sub_10000A860()
{
  return static StreamResource.publisher(useCase:bmOptions:)();
}

uint64_t sub_10000A870()
{
  return type metadata accessor for CacheManagerError.ErrorType();
}

uint64_t sub_10000A880()
{
  return CacheManagerError.errorType.getter();
}

uint64_t sub_10000A890()
{
  return type metadata accessor for CacheManagerError();
}

uint64_t sub_10000A8A0()
{
  return CacheManagerInsert.Failed.reason.getter();
}

uint64_t sub_10000A8B0()
{
  return type metadata accessor for CacheManagerInsert.Failed();
}

uint64_t sub_10000A8C0()
{
  return type metadata accessor for CacheManagerInsert();
}

uint64_t sub_10000A8D0()
{
  return type metadata accessor for CacheManagerSearch.CacheManagerSearchStrategy();
}

uint64_t sub_10000A8E0()
{
  return CacheManagerSearch.Ended.resultCount.getter();
}

uint64_t sub_10000A8F0()
{
  return CacheManagerSearch.Ended.searchStrategy.getter();
}

uint64_t sub_10000A900()
{
  return CacheManagerSearch.Ended.lowestMatchScore.getter();
}

uint64_t sub_10000A910()
{
  return CacheManagerSearch.Ended.highestMatchScore.getter();
}

uint64_t sub_10000A920()
{
  return type metadata accessor for CacheManagerSearch.Ended();
}

uint64_t sub_10000A930()
{
  return CacheManagerSearch.Failed.reason.getter();
}

uint64_t sub_10000A940()
{
  return type metadata accessor for CacheManagerSearch.Failed();
}

uint64_t sub_10000A950()
{
  return type metadata accessor for CacheManagerSearch();
}

uint64_t sub_10000A960()
{
  return type metadata accessor for CacheManagerTarget();
}

uint64_t sub_10000A970()
{
  return type metadata accessor for MonotonicTimestamp();
}

uint64_t sub_10000A980()
{
  return LLMCacheManagerTelemetry.eventMetadata.getter();
}

uint64_t sub_10000A990()
{
  return LLMCacheManagerTelemetry.monotonicTimestamp.getter();
}

uint64_t sub_10000A9A0()
{
  return LLMCacheManagerTelemetry.target.getter();
}

uint64_t sub_10000A9B0()
{
  return type metadata accessor for LLMCacheManagerTelemetry();
}

uint64_t sub_10000A9C0()
{
  return CacheManagerRequestInvocation.clientTraceId.getter();
}

uint64_t sub_10000A9D0()
{
  return type metadata accessor for CacheManagerRequestInvocation();
}

uint64_t sub_10000A9E0()
{
  return CacheManagerTelemetryEventMetadata.cacheManagerId.getter();
}

uint64_t sub_10000A9F0()
{
  return type metadata accessor for CacheManagerTelemetryEventMetadata();
}

uint64_t sub_10000AA00()
{
  return Logger.logObject.getter();
}

uint64_t sub_10000AA10()
{
  return type metadata accessor for Logger();
}

uint64_t sub_10000AA20()
{
  return Logger.init(_:)();
}

uint64_t sub_10000AA30()
{
  return Publisher.sink(receiveCompletion:receiveValue:)();
}

uint64_t sub_10000AA40()
{
  return dispatch thunk of static Comparable.>= infix(_:_:)();
}

NSString sub_10000AA50()
{
  return String._bridgeToObjectiveC()();
}

void sub_10000AA60(Swift::String a1)
{
}

Swift::Int sub_10000AA70()
{
  return String.UTF8View._foreignCount()();
}

NSNumber sub_10000AA80()
{
  return Double._bridgeToObjectiveC()();
}

uint64_t sub_10000AA90()
{
  return static os_log_type_t.info.getter();
}

uint64_t sub_10000AAA0()
{
  return static os_log_type_t.debug.getter();
}

uint64_t sub_10000AAB0()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_10000AAC0()
{
  return OS_os_log.init(subsystem:category:)();
}

uint64_t sub_10000AAD0()
{
  return Optional.debugDescription.getter();
}

uint64_t sub_10000AAE0()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_10000AAF0()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_10000AB00()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t sub_10000AB10()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_10000AB20()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_10000AB30()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_10000AB40()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t sub_10000AB50()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
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

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
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