uint64_t sub_1000018F0()
{
  uint64_t v0;

  v0 = sub_100007120();
  sub_100006F3C(v0, qword_10000C0E8);
  sub_100004F0C(v0, (uint64_t)qword_10000C0E8);
  return sub_100007110();
}

uint64_t BiomeSELFIngestorExtension.ingest(dataPool:)(uint64_t a1)
{
  v1[6] = a1;
  sub_1000070D0();
  v1[7] = swift_task_alloc();
  uint64_t v2 = sub_100004EC8(&qword_10000C010);
  v1[8] = v2;
  v1[9] = *(void *)(v2 - 8);
  v1[10] = swift_task_alloc();
  v1[11] = swift_task_alloc();
  v1[12] = swift_task_alloc();
  v1[13] = swift_task_alloc();
  uint64_t v3 = sub_100004EC8(&qword_10000C018);
  v1[14] = v3;
  v1[15] = *(void *)(v3 - 8);
  v1[16] = swift_task_alloc();
  uint64_t v4 = sub_100006FA0();
  v1[17] = v4;
  v1[18] = *(void *)(v4 - 8);
  v1[19] = swift_task_alloc();
  sub_1000070A0();
  v1[20] = swift_task_alloc();
  uint64_t v5 = sub_100004EC8(&qword_10000C020);
  v1[21] = v5;
  v1[22] = *(void *)(v5 - 8);
  v1[23] = swift_task_alloc();
  v1[24] = swift_task_alloc();
  v1[25] = swift_task_alloc();
  v1[26] = swift_task_alloc();
  uint64_t v6 = sub_100007130();
  v1[27] = v6;
  v1[28] = *(void *)(v6 - 8);
  v1[29] = swift_task_alloc();
  v1[30] = swift_task_alloc();
  uint64_t v7 = sub_100007040();
  v1[31] = v7;
  v1[32] = *(void *)(v7 - 8);
  v1[33] = swift_task_alloc();
  sub_100004EC8(&qword_10000C028);
  v1[34] = swift_task_alloc();
  v1[35] = swift_task_alloc();
  sub_100004EC8(&qword_10000C030);
  v1[36] = swift_task_alloc();
  v1[37] = swift_task_alloc();
  v1[38] = swift_task_alloc();
  v1[39] = swift_task_alloc();
  uint64_t v8 = sub_100004EC8(&qword_10000C038);
  v1[40] = v8;
  v1[41] = *(void *)(v8 - 8);
  v1[42] = swift_task_alloc();
  uint64_t v9 = sub_100007030();
  v1[43] = v9;
  v1[44] = *(void *)(v9 - 8);
  v1[45] = swift_task_alloc();
  v1[46] = swift_task_alloc();
  v1[47] = swift_task_alloc();
  v1[48] = swift_task_alloc();
  return _swift_task_switch(sub_100001E38, 0, 0);
}

uint64_t sub_100001E38()
{
  if (qword_10000C0E0 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_100007120();
  *(void *)(v0 + 392) = sub_100004F0C(v1, (uint64_t)qword_10000C0E8);
  uint64_t v2 = sub_100007100();
  os_log_type_t v3 = sub_1000071C0();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "INGESTING!", v4, 2u);
    swift_slowDealloc();
  }

  id v5 = objc_allocWithZone((Class)NSUserDefaults);
  NSString v6 = sub_100007170();
  id v7 = [v5 initWithSuiteName:v6];
  *(void *)(v0 + 400) = v7;

  if (v7)
  {
    uint64_t v8 = *(void *)(v0 + 384);
    uint64_t v41 = *(void *)(v0 + 376);
    uint64_t v59 = *(void *)(v0 + 352);
    uint64_t v9 = *(void **)(v0 + 336);
    uint64_t v10 = *(void *)(v0 + 328);
    uint64_t v48 = *(void *)(v0 + 344);
    uint64_t v49 = *(void *)(v0 + 320);
    uint64_t v11 = *(void *)(v0 + 312);
    uint64_t v50 = *(void *)(v0 + 304);
    v44 = *(uint64_t **)(v0 + 280);
    uint64_t v42 = *(void *)(v0 + 264);
    uint64_t v47 = *(void *)(v0 + 256);
    uint64_t v12 = *(void *)(v0 + 224);
    uint64_t v46 = *(void *)(v0 + 248);
    uint64_t v57 = *(void *)(v0 + 216);
    uint64_t v13 = *(void *)(v0 + 176);
    sub_100006FD0();
    swift_allocObject();
    *(void *)(v0 + 408) = sub_100006FC0();
    sub_100007020();
    sub_100004EC8(&qword_10000C040);
    *(void *)(v0 + 416) = *(void *)(v13 + 72);
    *(_DWORD *)(v0 + 648) = *(_DWORD *)(v13 + 80);
    uint64_t v38 = swift_allocObject();
    *(void *)(v0 + 424) = v38;
    *(_OWORD *)(v38 + 16) = xmmword_100007580;
    *uint64_t v9 = 0xD000000000000020;
    v9[1] = 0x8000000100007830;
    unsigned int v45 = enum case for IngestConfig.StreamId.swift<A>(_:);
    v52 = *(void (**)(void *))(v10 + 104);
    v52(v9);
    sub_100007140();
    uint64_t v14 = v12 + 56;
    v15 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v12 + 56);
    *(void *)(v0 + 432) = v15;
    *(void *)(v0 + 440) = v14 & 0xFFFFFFFFFFFFLL | 0xA0D1000000000000;
    v15(v11, 0, 1, v57);
    v15(v50, 1, 1, v57);
    v51 = *(void (**)(uint64_t, uint64_t, uint64_t))(v59 + 16);
    *(void *)(v0 + 448) = v51;
    *(void *)(v0 + 456) = (v59 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
    v51(v41, v8, v48);
    uint64_t v16 = sub_1000070B0();
    *(void *)(v0 + 464) = v16;
    uint64_t v53 = v16;
    uint64_t v37 = *(void *)(v16 - 8);
    v17 = *(void (**)(uint64_t *, uint64_t, uint64_t, uint64_t))(v37 + 56);
    *(void *)(v0 + 472) = v17;
    *(void *)(v0 + 480) = (v37 + 56) & 0xFFFFFFFFFFFFLL | 0xA0D1000000000000;
    v55 = v17;
    v17(v44, 1, 1, v16);
    sub_100006B98(0, &qword_10000C048);
    sub_100007010();
    *uint64_t v9 = 0xD000000000000027;
    v9[1] = 0x8000000100007860;
    ((void (*)(void *, void, uint64_t))v52)(v9, v45, v49);
    sub_100007140();
    v15(v11, 0, 1, v57);
    v15(v50, 1, 1, v57);
    v51(v41, v8, v48);
    v55(v44, 1, 1, v53);
    sub_100004EC8(&qword_10000C050);
    sub_100007060();
    *(_OWORD *)(swift_allocObject() + 16) = xmmword_100007590;
    unsigned int v40 = enum case for RequestLinkConfig.Direction.targetComponent(_:);
    v43 = *(void (**)(uint64_t))(v47 + 104);
    v43(v42);
    sub_100007140();
    sub_100007140();
    sub_100007050();
    sub_100007010();
    *uint64_t v9 = 0xD000000000000028;
    v9[1] = 0x8000000100007890;
    ((void (*)(void *, void, uint64_t))v52)(v9, v45, v49);
    sub_100007140();
    v15(v11, 0, 1, v57);
    v15(v50, 1, 1, v57);
    v51(v41, v8, v48);
    v55(v44, 1, 1, v53);
    sub_100007010();
    *uint64_t v9 = 0xD000000000000029;
    v9[1] = 0x80000001000078C0;
    ((void (*)(void *, void, uint64_t))v52)(v9, v45, v49);
    sub_100007140();
    v15(v11, 0, 1, v57);
    v15(v50, 1, 1, v57);
    v51(v41, v8, v48);
    v55(v44, 1, 1, v53);
    *(_OWORD *)(swift_allocObject() + 16) = xmmword_1000075A0;
    ((void (*)(uint64_t, void, uint64_t))v43)(v42, v40, v46);
    sub_100007140();
    sub_100007140();
    sub_100007050();
    unsigned int v39 = enum case for RequestLinkConfig.Direction.sourceComponent(_:);
    v43(v42);
    sub_100007140();
    sub_100007140();
    sub_100007050();
    sub_100007010();
    *uint64_t v9 = 0xD000000000000023;
    v9[1] = 0x80000001000078F0;
    ((void (*)(void *, void, uint64_t))v52)(v9, v45, v49);
    sub_100007140();
    v15(v11, 0, 1, v57);
    v15(v50, 1, 1, v57);
    v51(v41, v8, v48);
    v55(v44, 1, 1, v53);
    *(_OWORD *)(swift_allocObject() + 16) = xmmword_100007590;
    ((void (*)(uint64_t, void, uint64_t))v43)(v42, v39, v46);
    sub_100007140();
    sub_100007140();
    sub_100007050();
    sub_100007010();
    *uint64_t v9 = 0xD000000000000024;
    v9[1] = 0x8000000100007920;
    ((void (*)(void *, void, uint64_t))v52)(v9, v45, v49);
    sub_100007140();
    v15(v11, 0, 1, v57);
    v15(v50, 1, 1, v57);
    v51(v41, v8, v48);
    v55(v44, 1, 1, v53);
    *(_OWORD *)(swift_allocObject() + 16) = xmmword_100007590;
    ((void (*)(uint64_t, void, uint64_t))v43)(v42, v40, v46);
    sub_100007140();
    sub_100007140();
    sub_100007050();
    sub_100007010();
    *uint64_t v9 = 0xD000000000000022;
    v9[1] = 0x8000000100007950;
    ((void (*)(void *, void, uint64_t))v52)(v9, v45, v49);
    sub_100007140();
    v15(v11, 0, 1, v57);
    v15(v50, 1, 1, v57);
    v51(v41, v8, v48);
    v55(v44, 1, 1, v53);
    *(_OWORD *)(swift_allocObject() + 16) = xmmword_100007590;
    ((void (*)(uint64_t, void, uint64_t))v43)(v42, v39, v46);
    sub_100007140();
    sub_100007140();
    sub_100007050();
    sub_100007010();
    *uint64_t v9 = 0xD000000000000023;
    v9[1] = 0x8000000100007980;
    ((void (*)(void *, void, uint64_t))v52)(v9, v45, v49);
    sub_100007140();
    v15(v11, 0, 1, v57);
    v15(v50, 1, 1, v57);
    v51(v41, v8, v48);
    sub_100004EC8(&qword_10000C058);
    uint64_t v18 = swift_allocObject();
    *(_OWORD *)(v18 + 16) = xmmword_100007590;
    sub_100007140();
    uint64_t v19 = sub_100006A10(v18);
    swift_setDeallocating();
    swift_arrayDestroy();
    swift_deallocClassInstance();
    uint64_t *v44 = v19;
    (*(void (**)(uint64_t *, void, uint64_t))(v37 + 104))(v44, enum case for MessageFilteringPolicy.denylist(_:), v53);
    v55(v44, 0, 1, v53);
    uint64_t result = sub_100007010();
    if (*(void *)(v38 + 16) < 8uLL)
    {
      __break(1u);
    }
    else
    {
      uint64_t v22 = *(void *)(v0 + 168);
      uint64_t v21 = *(void *)(v0 + 176);
      v23 = *(void (**)(uint64_t, unint64_t, uint64_t))(v21 + 16);
      *(void *)(v0 + 488) = v23;
      *(void *)(v0 + 496) = 0;
      v58 = *(void **)(v0 + 400);
      uint64_t v25 = *(void *)(v0 + 200);
      unint64_t v24 = *(void *)(v0 + 208);
      uint64_t v26 = *(void *)(v0 + 152);
      uint64_t v27 = *(void *)(v0 + 144);
      uint64_t v54 = *(void *)(v0 + 136);
      uint64_t v56 = *(void *)(v0 + 192);
      uint64_t v28 = *(void *)(v0 + 48);
      unint64_t v29 = *(void *)(v0 + 424)
          + ((*(unsigned __int8 *)(v0 + 648) + 32) & ~(unint64_t)*(unsigned __int8 *)(v0 + 648));
      *(void *)(v0 + 504) = &_swiftEmptyArrayStorage;
      *(void *)(v0 + 512) = (v21 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
      v23(v24, v29, v22);
      v30 = *(void (**)(uint64_t, uint64_t, uint64_t))(v27 + 16);
      *(void *)(v0 + 520) = v30;
      *(void *)(v0 + 528) = (v27 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
      v30(v26, v28, v54);
      v23(v25, v24, v22);
      sub_100007090();
      v23(v56, v24, v22);
      sub_100004EC8(&qword_10000C060);
      swift_allocObject();
      id v31 = v58;
      swift_retain();
      *(void *)(v0 + 536) = sub_100006FF0();
      v60 = (uint64_t (*)(void))((char *)&async function pointer to dispatch thunk of BiomeEventIngestProcessor.ingest()
                              + async function pointer to dispatch thunk of BiomeEventIngestProcessor.ingest());
      v32 = (void *)swift_task_alloc();
      *(void *)(v0 + 544) = v32;
      void *v32 = v0;
      v32[1] = sub_100003370;
      return v60();
    }
  }
  else
  {
    v33 = sub_100007100();
    uint64_t v34 = sub_1000071B0();
    if (os_log_type_enabled(v33, (os_log_type_t)v34))
    {
      v35 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v35 = 0;
      _os_log_impl((void *)&_mh_execute_header, v33, (os_log_type_t)v34, "Failed to initialize user defaults", v35, 2u);
      swift_slowDealloc();
    }

    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    v36 = *(uint64_t (**)(void))(v0 + 8);
    return v36();
  }
  return result;
}

uint64_t sub_100003370()
{
  *(void *)(*(void *)v1 + 552) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_1000041E4;
  }
  else {
    uint64_t v2 = sub_100003484;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_100003484()
{
  uint64_t v1 = *(void *)(v0 + 176);
  swift_release();
  uint64_t v2 = *(void (**)(void, void))(v1 + 8);
  uint64_t v3 = *(void *)(v0 + 552);
  uint64_t v5 = *(void *)(v0 + 496);
  uint64_t v4 = *(void *)(v0 + 504);
  *(void *)(v0 + 560) = v4;
  v2(*(void *)(v0 + 208), *(void *)(v0 + 168));
  if (v5 == 7)
  {
    uint64_t v53 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 448);
    uint64_t v49 = *(void (**)(uint64_t, void, uint64_t, uint64_t))(v0 + 432);
    uint64_t v6 = *(void *)(v0 + 384);
    uint64_t v7 = *(void *)(v0 + 368);
    uint64_t v51 = *(void *)(v0 + 360);
    uint64_t v58 = v3;
    uint64_t v9 = *(void *)(v0 + 344);
    uint64_t v8 = *(void *)(v0 + 352);
    uint64_t v10 = *(void *)(v0 + 288);
    uint64_t v11 = *(void *)(v0 + 296);
    uint64_t v45 = *(void *)(v0 + 216);
    uint64_t v47 = v9;
    uint64_t v13 = *(void *)(v0 + 120);
    uint64_t v12 = *(NSString **)(v0 + 128);
    uint64_t v44 = *(void *)(v0 + 112);
    uint64_t v14 = *(void *)(v0 + 72);
    swift_bridgeObjectRelease();
    v15 = *(void (**)(uint64_t, uint64_t))(v8 + 8);
    *(void *)(v0 + 568) = v15;
    *(void *)(v0 + 576) = (v8 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
    v15(v6, v9);
    sub_100004EC8(&qword_10000C068);
    uint64_t v16 = swift_allocObject();
    *(_OWORD *)(v16 + 16) = xmmword_100007590;
    uint64_t v17 = sub_100007080();
    swift_allocObject();
    uint64_t v18 = sub_100007070();
    *(void *)(v16 + 56) = v17;
    *(void *)(v16 + 64) = &protocol witness table for RequireInternalBuild;
    *(void *)(v16 + 32) = v18;
    sub_100007020();
    sub_100004EC8(&qword_10000C070);
    unint64_t v19 = (*(unsigned __int8 *)(v14 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80);
    uint64_t v20 = swift_allocObject();
    *(void *)(v0 + 584) = v20;
    *(_OWORD *)(v20 + 16) = xmmword_100007590;
    *uint64_t v12 = sub_100007170();
    (*(void (**)(NSString *, void, uint64_t))(v13 + 104))(v12, enum case for IngestConfig.StreamId.objc<A>(_:), v44);
    sub_100007140();
    v49(v11, 0, 1, v45);
    sub_100007140();
    v49(v10, 0, 1, v45);
    v53(v51, v7, v47);
    sub_100006B98(0, &qword_10000C078);
    sub_1000071D0();
    if (v58)
    {
      swift_errorRelease();
      uint64_t v21 = 1;
    }
    else
    {
      uint64_t v21 = 0;
    }
    unint64_t v36 = v20 + v19;
    uint64_t v54 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 520);
    uint64_t v57 = *(void **)(v0 + 400);
    uint64_t v48 = *(void *)(v0 + 152);
    uint64_t v50 = *(void *)(v0 + 136);
    uint64_t v38 = *(void *)(v0 + 96);
    unint64_t v37 = *(void *)(v0 + 104);
    uint64_t v52 = *(void *)(v0 + 88);
    uint64_t v40 = *(void *)(v0 + 64);
    uint64_t v39 = *(void *)(v0 + 72);
    uint64_t v46 = *(void *)(v0 + 48);
    (*(void (**)(void, uint64_t, uint64_t, void))(v0 + 472))(*(void *)(v0 + 272), v21, 1, *(void *)(v0 + 464));
    sub_100007010();
    uint64_t v41 = *(void (**)(uint64_t, unint64_t, uint64_t))(v39 + 16);
    *(void *)(v0 + 592) = v41;
    *(void *)(v0 + 600) = (v39 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
    v41(v37, v36, v40);
    v54(v48, v46, v50);
    v41(v38, v37, v40);
    sub_1000070C0();
    v41(v52, v37, v40);
    sub_100004EC8(&qword_10000C080);
    swift_allocObject();
    id v42 = v57;
    swift_retain();
    *(void *)(v0 + 608) = sub_100006FF0();
    uint64_t v59 = (uint64_t (*)(void))((char *)&async function pointer to dispatch thunk of BiomeEventIngestProcessor.ingest()
                            + async function pointer to dispatch thunk of BiomeEventIngestProcessor.ingest());
    uint64_t v34 = (void *)swift_task_alloc();
    *(void *)(v0 + 616) = v34;
    *uint64_t v34 = v0;
    v35 = sub_100003AE0;
  }
  else
  {
    uint64_t v22 = *(void (**)(uint64_t, unint64_t, uint64_t))(v0 + 488);
    uint64_t v23 = *(void *)(v0 + 496) + 1;
    *(void *)(v0 + 496) = v23;
    *(void *)(v0 + 504) = v4;
    uint64_t v25 = *(void *)(v0 + 200);
    unint64_t v24 = *(void *)(v0 + 208);
    uint64_t v55 = *(void *)(v0 + 192);
    uint64_t v56 = *(void **)(v0 + 400);
    uint64_t v26 = *(void *)(v0 + 168);
    uint64_t v27 = *(void *)(v0 + 152);
    uint64_t v29 = *(void *)(v0 + 136);
    uint64_t v28 = *(void *)(v0 + 144);
    uint64_t v30 = *(void *)(v0 + 48);
    unint64_t v31 = *(void *)(v0 + 424)
        + ((*(unsigned __int8 *)(v0 + 648) + 32) & ~(unint64_t)*(unsigned __int8 *)(v0 + 648))
        + *(void *)(v0 + 416) * v23;
    *(void *)(v0 + 512) = (*(void *)(v0 + 176) + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
    v22(v24, v31, v26);
    v32 = *(void (**)(uint64_t, uint64_t, uint64_t))(v28 + 16);
    *(void *)(v0 + 520) = v32;
    *(void *)(v0 + 528) = (v28 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
    v32(v27, v30, v29);
    v22(v25, v24, v26);
    sub_100007090();
    v22(v55, v24, v26);
    sub_100004EC8(&qword_10000C060);
    swift_allocObject();
    id v33 = v56;
    swift_retain();
    *(void *)(v0 + 536) = sub_100006FF0();
    uint64_t v59 = (uint64_t (*)(void))((char *)&async function pointer to dispatch thunk of BiomeEventIngestProcessor.ingest()
                            + async function pointer to dispatch thunk of BiomeEventIngestProcessor.ingest());
    uint64_t v34 = (void *)swift_task_alloc();
    *(void *)(v0 + 544) = v34;
    *uint64_t v34 = v0;
    v35 = sub_100003370;
  }
  v34[1] = v35;
  return v59();
}

uint64_t sub_100003AE0()
{
  *(void *)(*(void *)v1 + 624) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_100004ABC;
  }
  else {
    uint64_t v2 = sub_100003BF4;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_100003BF4()
{
  uint64_t v1 = v0[9];
  swift_release();
  uint64_t v2 = *(void (**)(void, void))(v1 + 8);
  v0[79] = v0[70];
  uint64_t v3 = (void (*)(uint64_t, uint64_t))v0[71];
  uint64_t v4 = v0[46];
  uint64_t v5 = v0[43];
  v2(v0[13], v0[8]);
  swift_bridgeObjectRelease();
  v3(v4, v5);
  uint64_t v6 = sub_100007100();
  os_log_type_t v7 = sub_1000071A0();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "Emitting streams telemetry", v8, 2u);
    swift_slowDealloc();
  }

  uint64_t v11 = (uint64_t (*)(void))((char *)&async function pointer to dispatch thunk of OLEStreamTelemetry.emit()
                          + async function pointer to dispatch thunk of OLEStreamTelemetry.emit());
  uint64_t v9 = (void *)swift_task_alloc();
  v0[80] = v9;
  *uint64_t v9 = v0;
  v9[1] = sub_100003D74;
  return v11();
}

uint64_t sub_100003D74()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_100003E70, 0, 0);
}

uint64_t sub_100003E70()
{
  uint64_t v1 = (void *)v0[50];
  if (*(void *)(v0[79] + 16))
  {
    swift_errorRetain();
    swift_bridgeObjectRelease();
    swift_willThrow();

    swift_release();
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_release();
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = (uint64_t (*)(void))v0[1];
  return v2();
}

uint64_t sub_1000041E4()
{
  uint64_t v72 = v0;
  (*(void (**)(void, void, void))(v0 + 488))(*(void *)(v0 + 184), *(void *)(v0 + 208), *(void *)(v0 + 168));
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v1 = sub_100007100();
  os_log_type_t v2 = sub_1000071B0();
  if (os_log_type_enabled(v1, v2))
  {
    log = v1;
    uint64_t v3 = *(void *)(v0 + 176);
    uint64_t v4 = *(void *)(v0 + 184);
    uint64_t v5 = *(void *)(v0 + 168);
    uint64_t v6 = swift_slowAlloc();
    v64 = (void *)swift_slowAlloc();
    uint64_t v71 = swift_slowAlloc();
    *(_DWORD *)uint64_t v6 = 136315394;
    uint64_t v7 = sub_100007000();
    *(void *)(v0 + 32) = sub_10000541C(v7, v8, &v71);
    sub_1000071E0();
    swift_bridgeObjectRelease();
    uint64_t v9 = *(void (**)(uint64_t, uint64_t))(v3 + 8);
    v9(v4, v5);
    *(_WORD *)(v6 + 12) = 2112;
    swift_errorRetain();
    uint64_t v10 = _swift_stdlib_bridgeErrorToNSError();
    *(void *)(v0 + 40) = v10;
    sub_1000071E0();
    void *v64 = v10;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, log, v2, "Error ingesting %s: %@", (uint8_t *)v6, 0x16u);
    sub_100004EC8(&qword_10000C088);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    uint64_t v9 = *(void (**)(uint64_t, uint64_t))(*(void *)(v0 + 176) + 8);
    v9(*(void *)(v0 + 184), *(void *)(v0 + 168));
    swift_errorRelease();
    swift_errorRelease();
  }
  swift_errorRetain();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v12 = *(char **)(v0 + 504);
  if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
    uint64_t v12 = sub_10000530C(0, *((void *)v12 + 2) + 1, 1, *(char **)(v0 + 504));
  }
  unint64_t v14 = *((void *)v12 + 2);
  unint64_t v13 = *((void *)v12 + 3);
  if (v14 >= v13 >> 1) {
    uint64_t v12 = sub_10000530C((char *)(v13 > 1), v14 + 1, 1, v12);
  }
  uint64_t v15 = *(void *)(v0 + 552);
  *((void *)v12 + 2) = v14 + 1;
  *(void *)&v12[8 * v14 + 32] = v15;
  swift_release();
  swift_errorRelease();
  *(void *)(v0 + 560) = v12;
  uint64_t v16 = *(void *)(v0 + 496);
  v9(*(void *)(v0 + 208), *(void *)(v0 + 168));
  if (v16 == 7)
  {
    v65 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 448);
    uint64_t v60 = *(void (**)(uint64_t, void, uint64_t, uint64_t))(v0 + 432);
    uint64_t v17 = *(void *)(v0 + 384);
    uint64_t v18 = *(void *)(v0 + 368);
    uint64_t v62 = *(void *)(v0 + 360);
    uint64_t v20 = *(void *)(v0 + 344);
    uint64_t v19 = *(void *)(v0 + 352);
    uint64_t v21 = *(void *)(v0 + 288);
    uint64_t v22 = *(void *)(v0 + 296);
    uint64_t v56 = *(void *)(v0 + 216);
    uint64_t v58 = v20;
    uint64_t v23 = *(void *)(v0 + 120);
    unint64_t v24 = *(NSString **)(v0 + 128);
    uint64_t v54 = *(void *)(v0 + 112);
    uint64_t v25 = *(void *)(v0 + 72);
    swift_bridgeObjectRelease();
    uint64_t v26 = *(void (**)(uint64_t, uint64_t))(v19 + 8);
    *(void *)(v0 + 568) = v26;
    *(void *)(v0 + 576) = (v19 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
    v26(v17, v20);
    sub_100004EC8(&qword_10000C068);
    uint64_t v27 = swift_allocObject();
    *(_OWORD *)(v27 + 16) = xmmword_100007590;
    uint64_t v28 = sub_100007080();
    swift_allocObject();
    uint64_t v29 = sub_100007070();
    *(void *)(v27 + 56) = v28;
    *(void *)(v27 + 64) = &protocol witness table for RequireInternalBuild;
    *(void *)(v27 + 32) = v29;
    sub_100007020();
    sub_100004EC8(&qword_10000C070);
    unint64_t v30 = (*(unsigned __int8 *)(v25 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v25 + 80);
    uint64_t v31 = swift_allocObject();
    *(void *)(v0 + 584) = v31;
    *(_OWORD *)(v31 + 16) = xmmword_100007590;
    *unint64_t v24 = sub_100007170();
    (*(void (**)(NSString *, void, uint64_t))(v23 + 104))(v24, enum case for IngestConfig.StreamId.objc<A>(_:), v54);
    sub_100007140();
    v60(v22, 0, 1, v56);
    sub_100007140();
    v60(v21, 0, 1, v56);
    v65(v62, v18, v58);
    sub_100006B98(0, &qword_10000C078);
    sub_1000071D0();
    unint64_t v44 = v31 + v30;
    v63 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 520);
    os_log_t loga = *(os_log_t *)(v0 + 400);
    uint64_t v57 = *(void *)(v0 + 152);
    uint64_t v59 = *(void *)(v0 + 136);
    unint64_t v46 = *(void *)(v0 + 96);
    unint64_t v45 = *(void *)(v0 + 104);
    uint64_t v48 = *(void *)(v0 + 64);
    uint64_t v47 = *(void *)(v0 + 72);
    unint64_t v61 = *(void *)(v0 + 88);
    uint64_t v55 = *(void *)(v0 + 48);
    (*(void (**)(void, void, uint64_t, void))(v0 + 472))(*(void *)(v0 + 272), 0, 1, *(void *)(v0 + 464));
    LOBYTE(v71) = 1;
    sub_100007010();
    uint64_t v49 = *(void (**)(unint64_t, unint64_t, uint64_t))(v47 + 16);
    *(void *)(v0 + 592) = v49;
    *(void *)(v0 + 600) = (v47 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
    v49(v45, v44, v48);
    v63(v57, v55, v59);
    v49(v46, v45, v48);
    sub_1000070C0();
    v49(v61, v45, v48);
    sub_100004EC8(&qword_10000C080);
    swift_allocObject();
    uint64_t v50 = loga;
    swift_retain();
    *(void *)(v0 + 608) = sub_100006FF0();
    v70 = (uint64_t (*)(void))((char *)&async function pointer to dispatch thunk of BiomeEventIngestProcessor.ingest()
                            + async function pointer to dispatch thunk of BiomeEventIngestProcessor.ingest());
    uint64_t v51 = (void *)swift_task_alloc();
    *(void *)(v0 + 616) = v51;
    *uint64_t v51 = v0;
    uint64_t v52 = sub_100003AE0;
  }
  else
  {
    v32 = *(void (**)(unint64_t, unint64_t, uint64_t))(v0 + 488);
    uint64_t v33 = *(void *)(v0 + 496) + 1;
    *(void *)(v0 + 496) = v33;
    *(void *)(v0 + 504) = v12;
    os_log_t logb = *(os_log_t *)(v0 + 400);
    unint64_t v35 = *(void *)(v0 + 200);
    unint64_t v34 = *(void *)(v0 + 208);
    uint64_t v36 = *(void *)(v0 + 168);
    uint64_t v37 = *(void *)(v0 + 152);
    unint64_t v66 = *(void *)(v0 + 192);
    uint64_t v39 = *(void *)(v0 + 136);
    uint64_t v38 = *(void *)(v0 + 144);
    uint64_t v40 = *(void *)(v0 + 48);
    unint64_t v41 = *(void *)(v0 + 424)
        + ((*(unsigned __int8 *)(v0 + 648) + 32) & ~(unint64_t)*(unsigned __int8 *)(v0 + 648))
        + *(void *)(v0 + 416) * v33;
    *(void *)(v0 + 512) = (*(void *)(v0 + 176) + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
    v32(v34, v41, v36);
    id v42 = *(void (**)(uint64_t, uint64_t, uint64_t))(v38 + 16);
    *(void *)(v0 + 520) = v42;
    *(void *)(v0 + 528) = (v38 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
    v42(v37, v40, v39);
    v32(v35, v34, v36);
    sub_100007090();
    v32(v66, v34, v36);
    sub_100004EC8(&qword_10000C060);
    swift_allocObject();
    v43 = logb;
    swift_retain();
    *(void *)(v0 + 536) = sub_100006FF0();
    v70 = (uint64_t (*)(void))((char *)&async function pointer to dispatch thunk of BiomeEventIngestProcessor.ingest()
                            + async function pointer to dispatch thunk of BiomeEventIngestProcessor.ingest());
    uint64_t v51 = (void *)swift_task_alloc();
    *(void *)(v0 + 544) = v51;
    *uint64_t v51 = v0;
    uint64_t v52 = sub_100003370;
  }
  v51[1] = v52;
  return v70();
}

uint64_t sub_100004ABC()
{
  uint64_t v28 = v0;
  (*(void (**)(void, void, void))(v0 + 592))(*(void *)(v0 + 80), *(void *)(v0 + 104), *(void *)(v0 + 64));
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v1 = sub_100007100();
  os_log_type_t v2 = sub_1000071B0();
  if (os_log_type_enabled(v1, v2))
  {
    log = v1;
    uint64_t v3 = *(void *)(v0 + 72);
    uint64_t v4 = *(void *)(v0 + 80);
    uint64_t v5 = *(void *)(v0 + 64);
    uint64_t v6 = swift_slowAlloc();
    unint64_t v24 = (void *)swift_slowAlloc();
    uint64_t v27 = swift_slowAlloc();
    *(_DWORD *)uint64_t v6 = 136315394;
    uint64_t v7 = sub_100007000();
    *(void *)(v0 + 16) = sub_10000541C(v7, v8, &v27);
    sub_1000071E0();
    swift_bridgeObjectRelease();
    uint64_t v9 = *(void (**)(uint64_t, uint64_t))(v3 + 8);
    v9(v4, v5);
    *(_WORD *)(v6 + 12) = 2112;
    swift_errorRetain();
    uint64_t v10 = _swift_stdlib_bridgeErrorToNSError();
    *(void *)(v0 + 24) = v10;
    sub_1000071E0();
    *unint64_t v24 = v10;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, log, v2, "Error ingesting %s: %@", (uint8_t *)v6, 0x16u);
    sub_100004EC8(&qword_10000C088);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    uint64_t v9 = *(void (**)(uint64_t, uint64_t))(*(void *)(v0 + 72) + 8);
    v9(*(void *)(v0 + 80), *(void *)(v0 + 64));
    swift_errorRelease();
    swift_errorRelease();
  }
  swift_errorRetain();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v12 = *(char **)(v0 + 560);
  if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
    uint64_t v12 = sub_10000530C(0, *((void *)v12 + 2) + 1, 1, *(char **)(v0 + 560));
  }
  unint64_t v14 = *((void *)v12 + 2);
  unint64_t v13 = *((void *)v12 + 3);
  if (v14 >= v13 >> 1) {
    uint64_t v12 = sub_10000530C((char *)(v13 > 1), v14 + 1, 1, v12);
  }
  uint64_t v15 = *(void *)(v0 + 624);
  *((void *)v12 + 2) = v14 + 1;
  *(void *)&v12[8 * v14 + 32] = v15;
  swift_release();
  swift_errorRelease();
  *(void *)(v0 + 632) = v12;
  uint64_t v16 = *(void (**)(uint64_t, uint64_t))(v0 + 568);
  uint64_t v17 = *(void *)(v0 + 368);
  uint64_t v18 = *(void *)(v0 + 344);
  v9(*(void *)(v0 + 104), *(void *)(v0 + 64));
  swift_bridgeObjectRelease();
  v16(v17, v18);
  uint64_t v19 = sub_100007100();
  os_log_type_t v20 = sub_1000071A0();
  if (os_log_type_enabled(v19, v20))
  {
    uint64_t v21 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v21 = 0;
    _os_log_impl((void *)&_mh_execute_header, v19, v20, "Emitting streams telemetry", v21, 2u);
    swift_slowDealloc();
  }

  uint64_t v26 = (uint64_t (*)(void))((char *)&async function pointer to dispatch thunk of OLEStreamTelemetry.emit()
                          + async function pointer to dispatch thunk of OLEStreamTelemetry.emit());
  uint64_t v22 = (void *)swift_task_alloc();
  *(void *)(v0 + 640) = v22;
  *uint64_t v22 = v0;
  v22[1] = sub_100003D74;
  return v26();
}

uint64_t sub_100004EC8(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100004F0C(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_100004F44@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  return sub_100004F84(a1, a2, a3);
}

uint64_t sub_100004F4C@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  return sub_100004F84(a1, a2, a3);
}

uint64_t sub_100004F54@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  return sub_100004F84(a1, a2, a3);
}

uint64_t sub_100004F5C@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  return sub_100004F84(a1, a2, a3);
}

uint64_t sub_100004F64@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  return sub_100004F84(a1, a2, a3);
}

uint64_t sub_100004F6C@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  return sub_100004F84(a1, a2, a3);
}

uint64_t sub_100004F74@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  return sub_100004F84(a1, a2, a3);
}

uint64_t sub_100004F7C@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  return sub_100004F84(a1, a2, a3);
}

uint64_t sub_100004F84@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  id v6 = objc_allocWithZone((Class)sub_1000070F0());
  sub_100006EA0(a1, a2);
  uint64_t result = sub_1000070E0();
  *a3 = result;
  return result;
}

void __swiftcall BiomeSELFIngestorExtension.init()()
{
  if (qword_10000C0E0 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_100007120();
  sub_100004F0C(v0, (uint64_t)qword_10000C0E8);
  oslog = sub_100007100();
  os_log_type_t v1 = sub_1000071C0();
  if (os_log_type_enabled(oslog, v1))
  {
    os_log_type_t v2 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)os_log_type_t v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, oslog, v1, "Initializing", v2, 2u);
    swift_slowDealloc();
  }
}

uint64_t sub_1000050DC(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_100005170;
  return BiomeSELFIngestorExtension.ingest(dataPool:)(a1);
}

uint64_t sub_100005170()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_100005264(uint64_t a1)
{
  unint64_t v2 = sub_100006C80();

  return IngestionExtension.configuration.getter(a1, v2);
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

char *sub_10000530C(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = *((void *)a4 + 3);
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
    uint64_t v8 = *((void *)a4 + 2);
    if (v7 <= v8) {
      uint64_t v9 = *((void *)a4 + 2);
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      sub_100004EC8(&qword_10000C0B0);
      uint64_t v10 = (char *)swift_allocObject();
      int64_t v11 = j__malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 25;
      }
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * (v12 >> 3);
      unint64_t v13 = v10 + 32;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
      unint64_t v13 = (char *)&_swiftEmptyArrayStorage + 32;
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[8 * v8 + 32]) {
          memmove(v13, a4 + 32, 8 * v8);
        }
        *((void *)a4 + 2) = 0;
        goto LABEL_24;
      }
    }
    sub_100006D94(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_10000541C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_1000054F0(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_100006D34((uint64_t)v12, *a3);
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
      sub_100006D34((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_100006CE4((uint64_t)v12);
  return v7;
}

uint64_t sub_1000054F0(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_1000071F0();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_1000056AC(a5, a6);
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
  uint64_t v8 = sub_100007230();
  if (!v8)
  {
    sub_100007240();
    __break(1u);
LABEL_17:
    uint64_t result = sub_100007250();
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

uint64_t sub_1000056AC(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_100005744(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_100005924(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_100005924(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_100005744(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_1000058BC(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_100007220();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_100007240();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_100007180();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_100007250();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_100007240();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_1000058BC(uint64_t a1, uint64_t a2)
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
  sub_100004EC8(&qword_10000C0A8);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_100005924(char a1, int64_t a2, char a3, char *a4)
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
    sub_100004EC8(&qword_10000C0A8);
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
  unint64_t v13 = a4 + 32;
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
  uint64_t result = sub_100007250();
  __break(1u);
  return result;
}

uint64_t sub_100005A74(uint64_t a1, char *a2)
{
  unint64_t v3 = v2;
  uint64_t v6 = sub_100007130();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin();
  int64_t v9 = (char *)v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *v2;
  sub_100006EF8(&qword_10000C0C0);
  swift_bridgeObjectRetain();
  unint64_t v34 = a2;
  uint64_t v11 = sub_100007150();
  uint64_t v12 = -1 << *(unsigned char *)(v10 + 32);
  unint64_t v13 = v11 & ~v12;
  uint64_t v33 = v10 + 56;
  if ((*(void *)(v10 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13))
  {
    uint64_t v29 = v2;
    uint64_t v30 = a1;
    uint64_t v31 = ~v12;
    uint64_t v28 = v7;
    uint64_t v16 = *(void (**)(void, void, void))(v7 + 16);
    uint64_t v15 = v7 + 16;
    unint64_t v14 = v16;
    uint64_t v32 = *(void *)(v15 + 56);
    uint64_t v17 = (void (**)(char *, uint64_t))(v15 - 8);
    v27[1] = v15 & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
    while (1)
    {
      uint64_t v18 = v10;
      unint64_t v19 = v32 * v13;
      unint64_t v20 = *(void *)(v10 + 48) + v32 * v13;
      uint64_t v21 = v14;
      v14(v9, v20, v6);
      sub_100006EF8(&qword_10000C0C8);
      char v22 = sub_100007160();
      uint64_t v23 = *v17;
      (*v17)(v9, v6);
      if (v22) {
        break;
      }
      unint64_t v13 = (v13 + 1) & v31;
      unint64_t v14 = v21;
      uint64_t v10 = v18;
      if (((*(void *)(v33 + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13) & 1) == 0)
      {
        swift_bridgeObjectRelease();
        unint64_t v3 = v29;
        a1 = v30;
        uint64_t v7 = v28;
        goto LABEL_7;
      }
    }
    swift_bridgeObjectRelease();
    v23(v34, v6);
    v21(v30, *(void *)(*v29 + 48) + v19, v6);
    return 0;
  }
  else
  {
    swift_bridgeObjectRelease();
    unint64_t v14 = *(void (**)(void, void, void))(v7 + 16);
LABEL_7:
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v25 = v34;
    v14(v9, v34, v6);
    uint64_t v35 = *v3;
    *unint64_t v3 = 0x8000000000000000;
    sub_100006158((uint64_t)v9, v13, isUniquelyReferenced_nonNull_native);
    *unint64_t v3 = v35;
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, char *, uint64_t))(v7 + 32))(a1, v25, v6);
    return 1;
  }
}

uint64_t sub_100005D70()
{
  uint64_t v1 = v0;
  uint64_t v42 = sub_100007130();
  uint64_t v2 = *(void *)(v42 - 8);
  __chkstk_darwin();
  unint64_t v41 = (char *)&v35 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = *v0;
  sub_100004EC8((uint64_t *)&unk_10000C0D0);
  uint64_t v5 = sub_100007210();
  uint64_t v6 = v5;
  if (*(void *)(v4 + 16))
  {
    uint64_t v7 = 1 << *(unsigned char *)(v4 + 32);
    uint64_t v8 = *(void *)(v4 + 56);
    uint64_t v37 = (void *)(v4 + 56);
    if (v7 < 64) {
      uint64_t v9 = ~(-1 << v7);
    }
    else {
      uint64_t v9 = -1;
    }
    unint64_t v10 = v9 & v8;
    uint64_t v35 = v0;
    int64_t v36 = (unint64_t)(v7 + 63) >> 6;
    uint64_t v39 = v2;
    uint64_t v11 = v5 + 56;
    uint64_t result = swift_retain();
    int64_t v13 = 0;
    uint64_t v38 = v6;
    unint64_t v14 = v41;
    uint64_t v15 = v42;
    while (1)
    {
      if (v10)
      {
        unint64_t v17 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        int64_t v40 = v13;
        unint64_t v18 = v17 | (v13 << 6);
      }
      else
      {
        int64_t v19 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v19 >= v36) {
          goto LABEL_33;
        }
        unint64_t v20 = v37[v19];
        int64_t v21 = v13 + 1;
        if (!v20)
        {
          int64_t v21 = v13 + 2;
          if (v13 + 2 >= v36) {
            goto LABEL_33;
          }
          unint64_t v20 = v37[v21];
          if (!v20)
          {
            int64_t v21 = v13 + 3;
            if (v13 + 3 >= v36) {
              goto LABEL_33;
            }
            unint64_t v20 = v37[v21];
            if (!v20)
            {
              uint64_t v22 = v13 + 4;
              if (v13 + 4 >= v36)
              {
LABEL_33:
                swift_release();
                uint64_t v1 = v35;
                uint64_t v34 = 1 << *(unsigned char *)(v4 + 32);
                if (v34 > 63) {
                  bzero(v37, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v37 = -1 << v34;
                }
                *(void *)(v4 + 16) = 0;
                break;
              }
              unint64_t v20 = v37[v22];
              if (!v20)
              {
                while (1)
                {
                  int64_t v21 = v22 + 1;
                  if (__OFADD__(v22, 1)) {
                    goto LABEL_39;
                  }
                  if (v21 >= v36) {
                    goto LABEL_33;
                  }
                  unint64_t v20 = v37[v21];
                  ++v22;
                  if (v20) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v21 = v13 + 4;
            }
          }
        }
LABEL_23:
        unint64_t v10 = (v20 - 1) & v20;
        int64_t v40 = v21;
        unint64_t v18 = __clz(__rbit64(v20)) + (v21 << 6);
      }
      uint64_t v23 = v4;
      uint64_t v24 = *(void *)(v4 + 48);
      uint64_t v25 = *(void *)(v39 + 72);
      uint64_t v26 = *(void (**)(char *, unint64_t, uint64_t))(v39 + 32);
      v26(v14, v24 + v25 * v18, v15);
      uint64_t v6 = v38;
      sub_100006EF8(&qword_10000C0C0);
      uint64_t result = sub_100007150();
      uint64_t v27 = -1 << *(unsigned char *)(v6 + 32);
      unint64_t v28 = result & ~v27;
      unint64_t v29 = v28 >> 6;
      if (((-1 << v28) & ~*(void *)(v11 + 8 * (v28 >> 6))) != 0)
      {
        unint64_t v16 = __clz(__rbit64((-1 << v28) & ~*(void *)(v11 + 8 * (v28 >> 6)))) | v28 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v30 = 0;
        unint64_t v31 = (unint64_t)(63 - v27) >> 6;
        do
        {
          if (++v29 == v31 && (v30 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v32 = v29 == v31;
          if (v29 == v31) {
            unint64_t v29 = 0;
          }
          v30 |= v32;
          uint64_t v33 = *(void *)(v11 + 8 * v29);
        }
        while (v33 == -1);
        unint64_t v16 = __clz(__rbit64(~v33)) + (v29 << 6);
      }
      *(void *)(v11 + ((v16 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v16;
      uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))v26)(*(void *)(v6 + 48) + v16 * v25, v41, v42);
      ++*(void *)(v6 + 16);
      uint64_t v4 = v23;
      int64_t v13 = v40;
    }
  }
  uint64_t result = swift_release();
  uint64_t *v1 = v6;
  return result;
}

uint64_t sub_100006158(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t v31 = a1;
  uint64_t v6 = sub_100007130();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin();
  uint64_t v9 = (char *)&v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v10 = *(void *)(*v3 + 16);
  unint64_t v11 = *(void *)(*v3 + 24);
  unint64_t v28 = v3;
  uint64_t v29 = v7;
  if (v11 > v10 && (a3 & 1) != 0) {
    goto LABEL_12;
  }
  if (a3)
  {
    sub_100005D70();
  }
  else
  {
    if (v11 > v10)
    {
      sub_1000063D0();
      goto LABEL_12;
    }
    sub_100006674();
  }
  uint64_t v12 = *v3;
  sub_100006EF8(&qword_10000C0C0);
  uint64_t v13 = sub_100007150();
  uint64_t v14 = -1 << *(unsigned char *)(v12 + 32);
  a2 = v13 & ~v14;
  uint64_t v30 = v12;
  uint64_t v15 = v12 + 56;
  if ((*(void *)(v12 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    uint64_t v16 = ~v14;
    int64_t v19 = *(void (**)(char *, unint64_t, uint64_t))(v7 + 16);
    uint64_t v18 = v7 + 16;
    unint64_t v17 = v19;
    uint64_t v20 = *(void *)(v18 + 56);
    do
    {
      v17(v9, *(void *)(v30 + 48) + v20 * a2, v6);
      sub_100006EF8(&qword_10000C0C8);
      char v21 = sub_100007160();
      (*(void (**)(char *, uint64_t))(v18 - 8))(v9, v6);
      if (v21) {
        goto LABEL_15;
      }
      a2 = (a2 + 1) & v16;
    }
    while (((*(void *)(v15 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) != 0);
  }
LABEL_12:
  uint64_t v22 = v29;
  uint64_t v23 = *v28;
  *(void *)(v23 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v22 + 32))(*(void *)(v23 + 48) + *(void *)(v22 + 72) * a2, v31, v6);
  uint64_t v25 = *(void *)(v23 + 16);
  BOOL v26 = __OFADD__(v25, 1);
  uint64_t v27 = v25 + 1;
  if (!v26)
  {
    *(void *)(v23 + 16) = v27;
    return result;
  }
  __break(1u);
LABEL_15:
  uint64_t result = sub_100007260();
  __break(1u);
  return result;
}

void *sub_1000063D0()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_100007130();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  uint64_t v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100004EC8((uint64_t *)&unk_10000C0D0);
  uint64_t v6 = *v0;
  uint64_t v7 = sub_100007200();
  uint64_t v8 = v7;
  if (!*(void *)(v6 + 16))
  {
    uint64_t result = (void *)swift_release();
LABEL_27:
    uint64_t *v1 = v8;
    return result;
  }
  uint64_t v22 = v1;
  uint64_t result = (void *)(v7 + 56);
  unint64_t v10 = (unint64_t)((1 << *(unsigned char *)(v8 + 32)) + 63) >> 6;
  if (v8 != v6 || (unint64_t)result >= v6 + 56 + 8 * v10) {
    uint64_t result = memmove(result, (const void *)(v6 + 56), 8 * v10);
  }
  uint64_t v23 = v6 + 56;
  int64_t v11 = 0;
  *(void *)(v8 + 16) = *(void *)(v6 + 16);
  uint64_t v12 = 1 << *(unsigned char *)(v6 + 32);
  uint64_t v13 = -1;
  if (v12 < 64) {
    uint64_t v13 = ~(-1 << v12);
  }
  unint64_t v14 = v13 & *(void *)(v6 + 56);
  int64_t v24 = (unint64_t)(v12 + 63) >> 6;
  while (1)
  {
    if (v14)
    {
      unint64_t v15 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      unint64_t v16 = v15 | (v11 << 6);
      goto LABEL_9;
    }
    int64_t v18 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
      __break(1u);
      goto LABEL_29;
    }
    if (v18 >= v24) {
      goto LABEL_25;
    }
    unint64_t v19 = *(void *)(v23 + 8 * v18);
    ++v11;
    if (!v19)
    {
      int64_t v11 = v18 + 1;
      if (v18 + 1 >= v24) {
        goto LABEL_25;
      }
      unint64_t v19 = *(void *)(v23 + 8 * v11);
      if (!v19)
      {
        int64_t v11 = v18 + 2;
        if (v18 + 2 >= v24) {
          goto LABEL_25;
        }
        unint64_t v19 = *(void *)(v23 + 8 * v11);
        if (!v19) {
          break;
        }
      }
    }
LABEL_24:
    unint64_t v14 = (v19 - 1) & v19;
    unint64_t v16 = __clz(__rbit64(v19)) + (v11 << 6);
LABEL_9:
    unint64_t v17 = *(void *)(v3 + 72) * v16;
    (*(void (**)(char *, unint64_t, uint64_t))(v3 + 16))(v5, *(void *)(v6 + 48) + v17, v2);
    uint64_t result = (void *)(*(uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32))(*(void *)(v8 + 48) + v17, v5, v2);
  }
  int64_t v20 = v18 + 3;
  if (v20 >= v24)
  {
LABEL_25:
    uint64_t result = (void *)swift_release();
    uint64_t v1 = v22;
    goto LABEL_27;
  }
  unint64_t v19 = *(void *)(v23 + 8 * v20);
  if (v19)
  {
    int64_t v11 = v20;
    goto LABEL_24;
  }
  while (1)
  {
    int64_t v11 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (v11 >= v24) {
      goto LABEL_25;
    }
    unint64_t v19 = *(void *)(v23 + 8 * v11);
    ++v20;
    if (v19) {
      goto LABEL_24;
    }
  }
LABEL_29:
  __break(1u);
  return result;
}

uint64_t sub_100006674()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_100007130();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  uint64_t v5 = (char *)&v33 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *v0;
  sub_100004EC8((uint64_t *)&unk_10000C0D0);
  uint64_t v7 = sub_100007210();
  uint64_t v8 = v7;
  if (!*(void *)(v6 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    uint64_t *v1 = v8;
    return result;
  }
  uint64_t v9 = 1 << *(unsigned char *)(v6 + 32);
  uint64_t v10 = *(void *)(v6 + 56);
  uint64_t v34 = v0;
  uint64_t v35 = v6 + 56;
  if (v9 < 64) {
    uint64_t v11 = ~(-1 << v9);
  }
  else {
    uint64_t v11 = -1;
  }
  unint64_t v12 = v11 & v10;
  int64_t v36 = (unint64_t)(v9 + 63) >> 6;
  uint64_t v37 = v3 + 16;
  uint64_t v13 = v7 + 56;
  uint64_t v38 = v3;
  unint64_t v14 = (uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32);
  uint64_t result = swift_retain();
  int64_t v16 = 0;
  while (1)
  {
    if (v12)
    {
      unint64_t v18 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v19 = v18 | (v16 << 6);
      goto LABEL_24;
    }
    int64_t v20 = v16 + 1;
    if (__OFADD__(v16, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v20 >= v36) {
      goto LABEL_33;
    }
    unint64_t v21 = *(void *)(v35 + 8 * v20);
    ++v16;
    if (!v21)
    {
      int64_t v16 = v20 + 1;
      if (v20 + 1 >= v36) {
        goto LABEL_33;
      }
      unint64_t v21 = *(void *)(v35 + 8 * v16);
      if (!v21)
      {
        int64_t v16 = v20 + 2;
        if (v20 + 2 >= v36) {
          goto LABEL_33;
        }
        unint64_t v21 = *(void *)(v35 + 8 * v16);
        if (!v21) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v12 = (v21 - 1) & v21;
    unint64_t v19 = __clz(__rbit64(v21)) + (v16 << 6);
LABEL_24:
    uint64_t v23 = v6;
    uint64_t v24 = *(void *)(v6 + 48);
    uint64_t v25 = *(void *)(v38 + 72);
    (*(void (**)(char *, unint64_t, uint64_t))(v38 + 16))(v5, v24 + v25 * v19, v2);
    sub_100006EF8(&qword_10000C0C0);
    uint64_t result = sub_100007150();
    uint64_t v26 = -1 << *(unsigned char *)(v8 + 32);
    unint64_t v27 = result & ~v26;
    unint64_t v28 = v27 >> 6;
    if (((-1 << v27) & ~*(void *)(v13 + 8 * (v27 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v27) & ~*(void *)(v13 + 8 * (v27 >> 6)))) | v27 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v29 = 0;
      unint64_t v30 = (unint64_t)(63 - v26) >> 6;
      do
      {
        if (++v28 == v30 && (v29 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v31 = v28 == v30;
        if (v28 == v30) {
          unint64_t v28 = 0;
        }
        v29 |= v31;
        uint64_t v32 = *(void *)(v13 + 8 * v28);
      }
      while (v32 == -1);
      unint64_t v17 = __clz(__rbit64(~v32)) + (v28 << 6);
    }
    *(void *)(v13 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    uint64_t result = (*v14)(*(void *)(v8 + 48) + v17 * v25, v5, v2);
    ++*(void *)(v8 + 16);
    uint64_t v6 = v23;
  }
  int64_t v22 = v20 + 3;
  if (v22 >= v36)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    uint64_t v1 = v34;
    goto LABEL_35;
  }
  unint64_t v21 = *(void *)(v35 + 8 * v22);
  if (v21)
  {
    int64_t v16 = v22;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v16 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v16 >= v36) {
      goto LABEL_33;
    }
    unint64_t v21 = *(void *)(v35 + 8 * v16);
    ++v22;
    if (v21) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_100006A10(uint64_t a1)
{
  uint64_t v2 = sub_100007130();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v6 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v16 - v7;
  uint64_t v9 = *(void *)(a1 + 16);
  sub_100006EF8(&qword_10000C0C0);
  uint64_t result = sub_100007190();
  uint64_t v17 = result;
  if (v9)
  {
    uint64_t v13 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    uint64_t v11 = v3 + 16;
    unint64_t v12 = v13;
    uint64_t v14 = a1 + ((*(unsigned __int8 *)(v11 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 64));
    uint64_t v15 = *(void *)(v11 + 56);
    do
    {
      v12(v6, v14, v2);
      sub_100005A74((uint64_t)v8, v6);
      (*(void (**)(char *, uint64_t))(v11 - 8))(v8, v2);
      v14 += v15;
      --v9;
    }
    while (v9);
    return v17;
  }
  return result;
}

uint64_t sub_100006B98(uint64_t a1, unint64_t *a2)
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

unint64_t sub_100006BD4()
{
  unint64_t result = qword_10000C090;
  if (!qword_10000C090)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C090);
  }
  return result;
}

uint64_t sub_100006C2C()
{
  return *(void *)(swift_getOpaqueTypeConformance2() + 8);
}

unint64_t sub_100006C80()
{
  unint64_t result = qword_10000C0A0;
  if (!qword_10000C0A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C0A0);
  }
  return result;
}

ValueMetadata *type metadata accessor for BiomeSELFIngestorExtension()
{
  return &type metadata for BiomeSELFIngestorExtension;
}

uint64_t sub_100006CE4(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_100006D34(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_100006D94(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 8 * a1 + 32;
    unint64_t v6 = a3 + 8 * v4;
    if (v5 >= v6 || v5 + 8 * v4 <= a3)
    {
      sub_100004EC8(&qword_10000C0B8);
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_100007250();
  __break(1u);
  return result;
}

uint64_t sub_100006EA0(uint64_t a1, unint64_t a2)
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

uint64_t sub_100006EF8(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100007130();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t *sub_100006F3C(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_100006FA0()
{
  return type metadata accessor for StagingPool();
}

uint64_t sub_100006FC0()
{
  return OLEStreamTelemetry.init()();
}

uint64_t sub_100006FD0()
{
  return type metadata accessor for OLEStreamTelemetry();
}

uint64_t sub_100006FE0()
{
  return static AppExtension.main()();
}

uint64_t sub_100006FF0()
{
  return BiomeEventIngestProcessor.init(eventIngestor:config:userDefaults:biomeUseCase:telemetry:)();
}

uint64_t sub_100007000()
{
  return IngestConfig.streamIdString.getter();
}

uint64_t sub_100007010()
{
  return IngestConfig.init(streamId:dataVersion:monotonicTimestampPath:eventPath:collectionPolicy:filteringPolicy:innerTypeBuilder:requestLinkConfigs:)();
}

uint64_t sub_100007020()
{
  return CollectionPolicy.init(demands:)();
}

uint64_t sub_100007030()
{
  return type metadata accessor for CollectionPolicy();
}

uint64_t sub_100007040()
{
  return type metadata accessor for RequestLinkConfig.Direction();
}

uint64_t sub_100007050()
{
  return RequestLinkConfig.init(direction:componentName:componentIdTagPath:traceIdTagPath:exclusive:)();
}

uint64_t sub_100007060()
{
  return type metadata accessor for RequestLinkConfig();
}

uint64_t sub_100007070()
{
  return RequireInternalBuild.init()();
}

uint64_t sub_100007080()
{
  return type metadata accessor for RequireInternalBuild();
}

uint64_t sub_100007090()
{
  return BiomeSELFEventIngestor.init(dataPool:config:)();
}

uint64_t sub_1000070A0()
{
  return type metadata accessor for BiomeSELFEventIngestor();
}

uint64_t sub_1000070B0()
{
  return type metadata accessor for MessageFilteringPolicy();
}

uint64_t sub_1000070C0()
{
  return BiomeProvisionalSELFIngestor.init(dataPool:config:)();
}

uint64_t sub_1000070D0()
{
  return type metadata accessor for BiomeProvisionalSELFIngestor();
}

uint64_t sub_1000070E0()
{
  return DillSiriInstrumentationWrapper.init(dillData:anyEventType:)();
}

uint64_t sub_1000070F0()
{
  return type metadata accessor for DillSiriInstrumentationWrapper();
}

uint64_t sub_100007100()
{
  return Logger.logObject.getter();
}

uint64_t sub_100007110()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_100007120()
{
  return type metadata accessor for Logger();
}

uint64_t sub_100007130()
{
  return type metadata accessor for ProtoTagPath();
}

uint64_t sub_100007140()
{
  return ProtoTagPath.init(_:)();
}

uint64_t sub_100007150()
{
  return dispatch thunk of Hashable._rawHashValue(seed:)();
}

uint64_t sub_100007160()
{
  return dispatch thunk of static Equatable.== infix(_:_:)();
}

NSString sub_100007170()
{
  return String._bridgeToObjectiveC()();
}

Swift::Int sub_100007180()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_100007190()
{
  return Set.init(minimumCapacity:)();
}

uint64_t sub_1000071A0()
{
  return static os_log_type_t.debug.getter();
}

uint64_t sub_1000071B0()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_1000071C0()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_1000071D0()
{
  return static BMIntelligenceFlowTranscriptDatastreamEvent.messageFilteringPolicy()();
}

uint64_t sub_1000071E0()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_1000071F0()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_100007200()
{
  return static _SetStorage.copy(original:)();
}

uint64_t sub_100007210()
{
  return static _SetStorage.resize(original:capacity:move:)();
}

uint64_t sub_100007220()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_100007230()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_100007240()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_100007250()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t sub_100007260()
{
  return ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
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

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_deallocClassInstance()
{
  return _swift_deallocClassInstance();
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