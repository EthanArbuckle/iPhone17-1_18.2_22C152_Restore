uint64_t sub_100002FE8()
{
  uint64_t v0;

  v0 = sub_100006FC0();
  sub_100006A60(v0, qword_10000C470);
  sub_100005F94(v0, (uint64_t)qword_10000C470);
  return sub_100006FB0();
}

unint64_t sub_100003068(char a1)
{
  unint64_t result = 0xD000000000000017;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x7463657078656E75;
      break;
    case 2:
      return result;
    case 3:
      unint64_t result = 0xD000000000000012;
      break;
    case 4:
      unint64_t result = 0xD000000000000014;
      break;
    case 5:
      unint64_t result = 0xD000000000000010;
      break;
    case 6:
    case 8:
      unint64_t result = 0xD000000000000011;
      break;
    case 7:
      unint64_t result = 0x6B72616D6B6F6F62;
      break;
    default:
      unint64_t result = 0x74754F64656D6974;
      break;
  }
  return result;
}

uint64_t sub_10000319C(char *a1, char *a2)
{
  return sub_1000031A8(*a1, *a2);
}

uint64_t sub_1000031A8(char a1, char a2)
{
  unint64_t v3 = 0xD000000000000017;
  unint64_t v4 = 0x80000001000075A0;
  switch(a1)
  {
    case 1:
      unint64_t v3 = 0x7463657078656E75;
      unint64_t v4 = 0xEF726F7272456465;
      break;
    case 2:
      break;
    case 3:
      unint64_t v3 = 0xD000000000000012;
      v5 = "missingDataRecords";
      goto LABEL_7;
    case 4:
      unint64_t v3 = 0xD000000000000014;
      v5 = "missingWorkerResults";
      goto LABEL_7;
    case 5:
      unint64_t v3 = 0xD000000000000010;
      v5 = "userDefaultsInit";
LABEL_7:
      unint64_t v4 = (unint64_t)(v5 - 32) | 0x8000000000000000;
      break;
    case 6:
      v6 = "emptyBookmarkName";
      goto LABEL_11;
    case 7:
      unint64_t v3 = 0x6B72616D6B6F6F62;
      unint64_t v4 = 0xEF65766968637241;
      break;
    case 8:
      v6 = "bookmarkUnarchive";
LABEL_11:
      unint64_t v4 = (unint64_t)(v6 - 32) | 0x8000000000000000;
      unint64_t v3 = 0xD000000000000011;
      break;
    default:
      unint64_t v3 = 0x74754F64656D6974;
      unint64_t v4 = 0xED0000726F727245;
      break;
  }
  unint64_t v7 = 0xD000000000000017;
  unint64_t v8 = 0x80000001000075A0;
  switch(a2)
  {
    case 1:
      unint64_t v7 = 0x7463657078656E75;
      unint64_t v8 = 0xEF726F7272456465;
      break;
    case 2:
      break;
    case 3:
      unint64_t v7 = 0xD000000000000012;
      v9 = "missingDataRecords";
      goto LABEL_18;
    case 4:
      unint64_t v7 = 0xD000000000000014;
      v9 = "missingWorkerResults";
      goto LABEL_18;
    case 5:
      unint64_t v7 = 0xD000000000000010;
      v9 = "userDefaultsInit";
LABEL_18:
      unint64_t v8 = (unint64_t)(v9 - 32) | 0x8000000000000000;
      break;
    case 6:
      v10 = "emptyBookmarkName";
      goto LABEL_22;
    case 7:
      unint64_t v7 = 0x6B72616D6B6F6F62;
      unint64_t v8 = 0xEF65766968637241;
      break;
    case 8:
      v10 = "bookmarkUnarchive";
LABEL_22:
      unint64_t v8 = (unint64_t)(v10 - 32) | 0x8000000000000000;
      unint64_t v7 = 0xD000000000000011;
      break;
    default:
      unint64_t v7 = 0x74754F64656D6974;
      unint64_t v8 = 0xED0000726F727245;
      break;
  }
  if (v3 == v7 && v4 == v8) {
    char v11 = 1;
  }
  else {
    char v11 = sub_1000070C0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v11 & 1;
}

Swift::Int sub_100003458()
{
  return sub_100007120();
}

uint64_t sub_1000034A0()
{
  return sub_1000034A8();
}

uint64_t sub_1000034A8()
{
  sub_100006FF0();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_100003610()
{
  return sub_100007120();
}

uint64_t sub_100003654@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_100006DDC(*(void *)a1, *(void **)(a1 + 8));
  *a2 = result;
  return result;
}

unint64_t sub_100003684@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_100003068(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_1000036C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[30] = a2;
  v3[31] = a3;
  v3[29] = a1;
  uint64_t v4 = sub_100006E70();
  v3[32] = v4;
  v3[33] = *(void *)(v4 - 8);
  v3[34] = swift_task_alloc();
  uint64_t v5 = sub_100006EE0();
  v3[35] = v5;
  v3[36] = *(void *)(v5 - 8);
  v3[37] = swift_task_alloc();
  uint64_t v6 = sub_100006F90();
  v3[38] = v6;
  v3[39] = *(void *)(v6 - 8);
  v3[40] = swift_task_alloc();
  uint64_t v7 = sub_100006E80();
  v3[41] = v7;
  v3[42] = *(void *)(v7 - 8);
  v3[43] = swift_task_alloc();
  sub_100005F50(&qword_10000C038);
  v3[44] = swift_task_alloc();
  sub_100005F50(&qword_10000C040);
  v3[45] = swift_task_alloc();
  uint64_t v8 = sub_100006ED0();
  v3[46] = v8;
  v3[47] = *(void *)(v8 - 8);
  v3[48] = swift_task_alloc();
  v3[49] = swift_task_alloc();
  v3[50] = swift_task_alloc();
  v3[51] = swift_task_alloc();
  uint64_t v9 = sub_100006E60();
  v3[52] = v9;
  v3[53] = *(void *)(v9 - 8);
  v3[54] = swift_task_alloc();
  sub_100005F50(&qword_10000C048);
  v3[55] = swift_task_alloc();
  v3[56] = sub_100005F50(&qword_10000C050);
  v3[57] = swift_task_alloc();
  v3[58] = swift_task_alloc();
  return _swift_task_switch(sub_100003A4C, 0, 0);
}

uint64_t sub_100003A4C()
{
  v23 = v0;
  if (qword_10000C0E0 != -1) {
    swift_once();
  }
  v1 = (void *)v0[29];
  uint64_t v2 = sub_100006FC0();
  v0[59] = sub_100005F94(v2, (uint64_t)qword_10000C470);
  id v3 = v1;
  uint64_t v4 = sub_100006FA0();
  os_log_type_t v5 = sub_100007020();
  BOOL v6 = os_log_type_enabled(v4, v5);
  uint64_t v7 = (void *)v0[29];
  if (v6)
  {
    uint64_t v8 = swift_slowAlloc();
    uint64_t v22 = swift_slowAlloc();
    *(_DWORD *)uint64_t v8 = 136315394;
    uint64_t v9 = sub_100006F70();
    v0[27] = sub_10000612C(v9, v10, &v22);
    sub_100007040();

    swift_bridgeObjectRelease();
    *(_WORD *)(v8 + 12) = 2080;
    uint64_t v11 = sub_100006F80();
    v0[28] = sub_10000612C(v11, v12, &v22);
    sub_100007040();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "TaskId: %s, TaskName: %s", (uint8_t *)v8, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  uint64_t v13 = v0[31];
  v0[18] = v0[30];
  v0[19] = v13;
  v14 = (void *)swift_task_alloc();
  v0[60] = v14;
  unint64_t v15 = sub_100005EFC();
  uint64_t v16 = sub_100006014(&qword_10000C058, &qword_10000C060);
  uint64_t v17 = sub_100006014(&qword_10000C068, &qword_10000C070);
  void *v14 = v0;
  v14[1] = sub_100003D68;
  uint64_t v18 = v0[55];
  uint64_t v19 = v0[56];
  uint64_t v20 = v0[29];
  return MLHostExtension.loadConfig<A>(context:)(v18, v20, &type metadata for SiriCoreMetricsWorker, v19, v15, v16, v17);
}

uint64_t sub_100003D68()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_100003E64, 0, 0);
}

uint64_t sub_100003E64()
{
  uint64_t v63 = v0;
  uint64_t v1 = *(void *)(v0 + 440);
  uint64_t v2 = sub_100005F50(&qword_10000C078);
  uint64_t v3 = *(void *)(v2 - 8);
  int v4 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v1, 1, v2);
  uint64_t v5 = *(void *)(v0 + 464);
  if (v4 == 1)
  {
    sub_100006784(v1, &qword_10000C048);
    uint64_t v6 = sub_100006EA0();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  }
  else
  {
    sub_100006F60();
    (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  }
  uint64_t v7 = *(void *)(v0 + 456);
  uint64_t v8 = *(void *)(v0 + 464);
  swift_bridgeObjectRetain();
  v65._countAndFlagsBits = 0x74736F484C4D2DLL;
  v65._object = (void *)0xE700000000000000;
  sub_100007000(v65);
  v62[0] = sub_100006F80();
  v62[1] = v9;
  v66._countAndFlagsBits = 0x74736F484C4D2DLL;
  v66._object = (void *)0xE700000000000000;
  sub_100007000(v66);
  id v10 = objc_allocWithZone((Class)TRIBackgroundMLTaskIdentifiers);
  NSString v11 = sub_100006FD0();
  swift_bridgeObjectRelease();
  NSString v12 = sub_100006FD0();
  swift_bridgeObjectRelease();
  [v10 initWithBMLTTaskId:v11 deploymentId:1 treatmentId:v12];

  sub_100005F50(&qword_10000C080);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1000073B0;
  *(void *)(inited + 32) = 0xD00000000000001CLL;
  *(void *)(inited + 40) = 0x8000000100007670;
  sub_100006908(v8, v7, &qword_10000C050);
  uint64_t v14 = sub_100006EA0();
  uint64_t v15 = *(void *)(v14 - 8);
  int v16 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v15 + 48))(v7, 1, v14);
  uint64_t v17 = *(void *)(v0 + 456);
  if (v16 == 1)
  {
    sub_100006784(*(void *)(v0 + 456), &qword_10000C050);
    *(void *)(inited + 72) = &type metadata for UInt64;
  }
  else
  {
    uint64_t v18 = sub_100006E90();
    char v20 = v19;
    (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v17, v14);
    *(void *)(inited + 72) = &type metadata for UInt64;
    if ((v20 & 1) == 0) {
      goto LABEL_8;
    }
  }
  uint64_t v18 = 120000;
LABEL_8:
  v21 = *(void **)(v0 + 408);
  uint64_t v22 = *(void *)(v0 + 376);
  v23 = *(void **)(v0 + 232);
  *(void *)(inited + 48) = v18;
  sub_1000056D4(inited);
  id v24 = v23;
  sub_100006E50();
  void *v21 = 0;
  *(_DWORD *)(v0 + 512) = enum case for LighthouseRuntimeProcessorResult.error(_:);
  v25 = *(void (**)(void *))(v22 + 104);
  v25(v21);
  sub_100006E40();
  swift_allocObject();
  *(void *)(v0 + 208) = sub_100006E30();
  sub_100005F50(&qword_10000C098);
  swift_allocObject();
  uint64_t v26 = sub_100006EC0();
  *(void *)(v0 + 488) = v26;
  if (v26)
  {
    uint64_t v27 = *(void *)(v0 + 424);
    uint64_t v28 = *(void *)(v0 + 416);
    uint64_t v29 = *(void *)(v0 + 352);
    (*(void (**)(uint64_t, void, uint64_t))(v27 + 16))(v29, *(void *)(v0 + 432), v28);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v27 + 56))(v29, 0, 1, v28);
    v30 = (void *)swift_task_alloc();
    *(void *)(v0 + 496) = v30;
    void *v30 = v0;
    v30[1] = sub_100004A78;
    uint64_t v32 = *(void *)(v0 + 352);
    uint64_t v31 = *(void *)(v0 + 360);
    return LighthouseRuntimeProcessor.processAsync(withContext:)(v31, v32);
  }
  else
  {
    uint64_t v33 = *(void *)(v0 + 400);
    uint64_t v34 = *(void *)(v0 + 368);
    uint64_t v35 = *(void *)(v0 + 360);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v0 + 376) + 56))(v35, 1, 1, v34);
    ((void (*)(uint64_t, void, uint64_t))v25)(v33, enum case for LighthouseRuntimeProcessorResult.notAllowedToProcess(_:), v34);
    sub_100006784(v35, &qword_10000C040);
    (*(void (**)(void, void, void))(*(void *)(v0 + 376) + 40))(*(void *)(v0 + 408), *(void *)(v0 + 400), *(void *)(v0 + 368));
    v36 = sub_100006FA0();
    os_log_type_t v37 = sub_100007030();
    if (os_log_type_enabled(v36, v37))
    {
      uint64_t v38 = *(void *)(v0 + 408);
      uint64_t v39 = *(void *)(v0 + 392);
      uint64_t v40 = *(void *)(v0 + 368);
      uint64_t v41 = *(void *)(v0 + 376);
      v42 = (uint8_t *)swift_slowAlloc();
      v62[0] = swift_slowAlloc();
      *(_DWORD *)v42 = 136315138;
      swift_beginAccess();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v41 + 16))(v39, v38, v40);
      uint64_t v43 = sub_100006FE0();
      *(void *)(v0 + 200) = sub_10000612C(v43, v44, v62);
      sub_100007040();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v36, v37, "Lighthouse runtime process result: %s", v42, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    int v45 = *(_DWORD *)(v0 + 512);
    uint64_t v46 = *(void *)(v0 + 408);
    uint64_t v48 = *(void *)(v0 + 376);
    uint64_t v47 = *(void *)(v0 + 384);
    uint64_t v49 = *(void *)(v0 + 368);
    swift_beginAccess();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v48 + 16))(v47, v46, v49);
    int v50 = (*(uint64_t (**)(uint64_t, uint64_t))(v48 + 88))(v47, v49);
    if (v50 == v45)
    {
      (*(void (**)(void, void))(*(void *)(v0 + 376) + 96))(*(void *)(v0 + 384), *(void *)(v0 + 368));
      swift_errorRelease();
    }
    else if (v50 != enum case for LighthouseRuntimeProcessorResult.success(_:) {
           && v50 != enum case for LighthouseRuntimeProcessorResult.cancelled(_:)
    }
           && v50 != enum case for LighthouseRuntimeProcessorResult.notAllowedToProcess(_:))
    {
      (*(void (**)(void, void))(*(void *)(v0 + 376) + 8))(*(void *)(v0 + 384), *(void *)(v0 + 368));
    }
    uint64_t v51 = *(void *)(v0 + 464);
    uint64_t v53 = *(void *)(v0 + 424);
    uint64_t v52 = *(void *)(v0 + 432);
    uint64_t v54 = *(void *)(v0 + 408);
    uint64_t v55 = *(void *)(v0 + 416);
    uint64_t v57 = *(void *)(v0 + 368);
    uint64_t v56 = *(void *)(v0 + 376);
    id v58 = objc_allocWithZone((Class)sub_100006F20());
    uint64_t v61 = sub_100006F10();
    (*(void (**)(uint64_t, uint64_t))(v53 + 8))(v52, v55);
    sub_100006784(v51, &qword_10000C050);
    (*(void (**)(uint64_t, uint64_t))(v56 + 8))(v54, v57);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    v59 = *(uint64_t (**)(uint64_t))(v0 + 8);
    return v59(v61);
  }
}

uint64_t sub_100004A78()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 504) = v0;
  swift_task_dealloc();
  sub_100006784(*(void *)(v2 + 352), &qword_10000C038);
  swift_release();
  if (v0) {
    uint64_t v3 = sub_100004FF8;
  }
  else {
    uint64_t v3 = sub_100004BD0;
  }
  return _swift_task_switch(v3, 0, 0);
}

uint64_t sub_100004BD0()
{
  uint64_t v32 = v0;
  uint64_t v1 = *(void *)(v0 + 400);
  uint64_t v3 = *(void *)(v0 + 368);
  uint64_t v2 = *(void *)(v0 + 376);
  uint64_t v4 = *(void *)(v0 + 360);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v2 + 56))(v4, 0, 1, v3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 32))(v1, v4, v3);
  (*(void (**)(void, void, void))(*(void *)(v0 + 376) + 40))(*(void *)(v0 + 408), *(void *)(v0 + 400), *(void *)(v0 + 368));
  uint64_t v5 = sub_100006FA0();
  os_log_type_t v6 = sub_100007030();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = *(void *)(v0 + 408);
    uint64_t v8 = *(void *)(v0 + 392);
    uint64_t v10 = *(void *)(v0 + 368);
    uint64_t v9 = *(void *)(v0 + 376);
    NSString v11 = (uint8_t *)swift_slowAlloc();
    uint64_t v31 = swift_slowAlloc();
    *(_DWORD *)NSString v11 = 136315138;
    swift_beginAccess();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 16))(v8, v7, v10);
    uint64_t v12 = sub_100006FE0();
    *(void *)(v0 + 200) = sub_10000612C(v12, v13, &v31);
    sub_100007040();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "Lighthouse runtime process result: %s", v11, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  int v14 = *(_DWORD *)(v0 + 512);
  uint64_t v15 = *(void *)(v0 + 408);
  uint64_t v17 = *(void *)(v0 + 376);
  uint64_t v16 = *(void *)(v0 + 384);
  uint64_t v18 = *(void *)(v0 + 368);
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v17 + 16))(v16, v15, v18);
  int v19 = (*(uint64_t (**)(uint64_t, uint64_t))(v17 + 88))(v16, v18);
  if (v19 == v14)
  {
    (*(void (**)(void, void))(*(void *)(v0 + 376) + 96))(*(void *)(v0 + 384), *(void *)(v0 + 368));
    swift_errorRelease();
  }
  else if (v19 != enum case for LighthouseRuntimeProcessorResult.success(_:) {
         && v19 != enum case for LighthouseRuntimeProcessorResult.cancelled(_:)
  }
         && v19 != enum case for LighthouseRuntimeProcessorResult.notAllowedToProcess(_:))
  {
    (*(void (**)(void, void))(*(void *)(v0 + 376) + 8))(*(void *)(v0 + 384), *(void *)(v0 + 368));
  }
  uint64_t v20 = *(void *)(v0 + 464);
  uint64_t v22 = *(void *)(v0 + 424);
  uint64_t v21 = *(void *)(v0 + 432);
  uint64_t v24 = *(void *)(v0 + 408);
  uint64_t v23 = *(void *)(v0 + 416);
  uint64_t v25 = *(void *)(v0 + 368);
  uint64_t v26 = *(void *)(v0 + 376);
  id v27 = objc_allocWithZone((Class)sub_100006F20());
  uint64_t v30 = sub_100006F10();
  (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v21, v23);
  sub_100006784(v20, &qword_10000C050);
  (*(void (**)(uint64_t, uint64_t))(v26 + 8))(v24, v25);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v28 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v28(v30);
}

uint64_t sub_100004FF8()
{
  uint64_t v39 = v0;
  uint64_t v1 = *(void *)(v0 + 504);
  *(void *)(v0 + 192) = v1;
  swift_errorRetain();
  sub_100005F50(&qword_10000C088);
  if (swift_dynamicCast())
  {
    int v2 = (*(uint64_t (**)(void, void))(*(void *)(v0 + 336) + 88))(*(void *)(v0 + 344), *(void *)(v0 + 328));
    if (v2 == enum case for LighthouseRuntimeError.missingDataRecords(_:))
    {
      swift_errorRelease();
      swift_errorRelease();
      char v3 = 3;
      goto LABEL_22;
    }
    if (v2 == enum case for LighthouseRuntimeError.missingWorkerResult(_:))
    {
      swift_errorRelease();
      swift_errorRelease();
      char v3 = 4;
      goto LABEL_22;
    }
    (*(void (**)(void, void))(*(void *)(v0 + 336) + 8))(*(void *)(v0 + 344), *(void *)(v0 + 328));
  }
  swift_errorRelease();
  *(void *)(v0 + 184) = v1;
  swift_errorRetain();
  if (swift_dynamicCast())
  {
    int v4 = (*(uint64_t (**)(void, void))(*(void *)(v0 + 312) + 88))(*(void *)(v0 + 320), *(void *)(v0 + 304));
    if (v4 == enum case for StreamBookmarkStoreError.emptyBookmarkName(_:))
    {
      swift_errorRelease();
      swift_errorRelease();
      char v3 = 6;
      goto LABEL_22;
    }
    if (v4 == enum case for StreamBookmarkStoreError.bookmarkArchive(_:))
    {
      swift_errorRelease();
      swift_errorRelease();
      char v3 = 7;
      goto LABEL_22;
    }
    if (v4 == enum case for StreamBookmarkStoreError.bookmarkUnarchive(_:))
    {
      swift_errorRelease();
      swift_errorRelease();
      char v3 = 8;
      goto LABEL_22;
    }
    (*(void (**)(void, void))(*(void *)(v0 + 312) + 8))(*(void *)(v0 + 320), *(void *)(v0 + 304));
  }
  swift_errorRelease();
  *(void *)(v0 + 160) = v1;
  swift_errorRetain();
  if (swift_dynamicCast())
  {
    swift_errorRelease();
    swift_errorRelease();
    char v3 = 5;
  }
  else
  {
    swift_errorRelease();
    *(void *)(v0 + 168) = v1;
    swift_errorRetain();
    if (swift_dynamicCast())
    {
      uint64_t v6 = *(void *)(v0 + 288);
      uint64_t v5 = *(void *)(v0 + 296);
      uint64_t v7 = *(void *)(v0 + 280);
      swift_errorRelease();
      (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);
      swift_errorRelease();
      char v3 = 2;
    }
    else
    {
      swift_errorRelease();
      *(void *)(v0 + 176) = v1;
      swift_errorRetain();
      if (swift_dynamicCast())
      {
        uint64_t v9 = *(void *)(v0 + 264);
        uint64_t v8 = *(void *)(v0 + 272);
        uint64_t v10 = *(void *)(v0 + 256);
        swift_errorRelease();
        (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v8, v10);
        swift_errorRelease();
        char v3 = 0;
      }
      else
      {
        swift_errorRelease();
        swift_errorRelease();
        char v3 = 1;
      }
    }
  }
LABEL_22:
  NSString v11 = sub_100006FA0();
  os_log_type_t v12 = sub_100007030();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = *(void *)(v0 + 408);
    char v36 = v3;
    uint64_t v14 = *(void *)(v0 + 392);
    uint64_t v15 = *(void *)(v0 + 368);
    uint64_t v16 = *(void *)(v0 + 376);
    uint64_t v17 = (uint8_t *)swift_slowAlloc();
    v38[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v17 = 136315138;
    swift_beginAccess();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v16 + 16))(v14, v13, v15);
    char v3 = v36;
    uint64_t v18 = sub_100006FE0();
    *(void *)(v0 + 200) = sub_10000612C(v18, v19, v38);
    sub_100007040();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v11, v12, "Lighthouse runtime process result: %s", v17, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  int v20 = *(_DWORD *)(v0 + 512);
  uint64_t v21 = *(void *)(v0 + 408);
  uint64_t v23 = *(void *)(v0 + 376);
  uint64_t v22 = *(void *)(v0 + 384);
  uint64_t v24 = *(void *)(v0 + 368);
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v23 + 16))(v22, v21, v24);
  int v25 = (*(uint64_t (**)(uint64_t, uint64_t))(v23 + 88))(v22, v24);
  if (v25 == v20)
  {
    (*(void (**)(void, void))(*(void *)(v0 + 376) + 96))(*(void *)(v0 + 384), *(void *)(v0 + 368));
    swift_errorRelease();
  }
  else if (v25 != enum case for LighthouseRuntimeProcessorResult.success(_:) {
         && v25 != enum case for LighthouseRuntimeProcessorResult.cancelled(_:)
  }
         && v25 != enum case for LighthouseRuntimeProcessorResult.notAllowedToProcess(_:))
  {
    (*(void (**)(void, void))(*(void *)(v0 + 376) + 8))(*(void *)(v0 + 384), *(void *)(v0 + 368));
  }
  uint64_t v26 = *(void *)(v0 + 464);
  uint64_t v28 = *(void *)(v0 + 424);
  uint64_t v27 = *(void *)(v0 + 432);
  uint64_t v30 = *(void *)(v0 + 408);
  uint64_t v29 = *(void *)(v0 + 416);
  uint64_t v31 = *(void *)(v0 + 368);
  uint64_t v32 = *(void *)(v0 + 376);
  v38[3] = (uint64_t)&type metadata for SiriCoreMetricsWorkerError;
  v38[4] = sub_1000060D8();
  LOBYTE(v38[0]) = v3;
  id v33 = objc_allocWithZone((Class)sub_100006F20());
  uint64_t v37 = sub_100006F00();
  (*(void (**)(uint64_t, uint64_t))(v28 + 8))(v27, v29);
  sub_100006784(v26, &qword_10000C050);
  (*(void (**)(uint64_t, uint64_t))(v32 + 8))(v30, v31);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v34 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v34(v37);
}

unint64_t sub_1000056D4(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    char v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100005F50(&qword_10000C0A8);
  uint64_t v2 = sub_100007090();
  char v3 = (void *)v2;
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  uint64_t v5 = v2 + 64;
  uint64_t v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_100006908(v6, (uint64_t)&v15, &qword_10000C0B0);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_100006890(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    NSString v11 = (uint64_t *)(v3[6] + 16 * result);
    *NSString v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_10000696C(&v17, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v3[2] = v14;
    v6 += 48;
    if (!--v4)
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

uint64_t sub_10000580C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_100006E28;
  return MLHostExtension.shouldRun(context:)(a1, a2, a3);
}

uint64_t sub_1000058BC(uint64_t a1)
{
  uint64_t v5 = *v1;
  uint64_t v4 = v1[1];
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v6;
  void *v6 = v2;
  v6[1] = sub_100005964;
  return sub_1000036C0(a1, v5, v4);
}

uint64_t sub_100005964(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

uint64_t sub_100005A60(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v15 = (void *)swift_task_alloc();
  *(void *)(v7 + 16) = v15;
  *uint64_t v15 = v7;
  v15[1] = sub_100005B44;
  return MLHostExtension.loadConfig<A>(context:)(a1, a2, a6, a3, a7, a4, a5);
}

uint64_t sub_100005B44()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_100005C38(uint64_t a1)
{
  unint64_t v2 = sub_100005EFC();

  return MLHostExtension.configuration.getter(a1, v2);
}

void sub_100005C84(void *a1@<X8>)
{
  *a1 = 0xD000000000000015;
  a1[1] = 0x80000001000073A0;
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

unint64_t sub_100005D00()
{
  unint64_t result = qword_10000C008[0];
  if (!qword_10000C008[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_10000C008);
  }
  return result;
}

void *initializeBufferWithCopyOfBuffer for SiriCoreMetricsWorker(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for SiriCoreMetricsWorker()
{
  return swift_bridgeObjectRelease();
}

void *assignWithCopy for SiriCoreMetricsWorker(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 initializeWithTake for SiriCoreMetricsWorker(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

void *assignWithTake for SiriCoreMetricsWorker(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for SiriCoreMetricsWorker(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 16)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SiriCoreMetricsWorker(uint64_t result, int a2, int a3)
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SiriCoreMetricsWorker()
{
  return &type metadata for SiriCoreMetricsWorker;
}

uint64_t sub_100005EA8()
{
  return *(void *)(swift_getOpaqueTypeConformance2() + 8);
}

unint64_t sub_100005EFC()
{
  unint64_t result = qword_10000C028;
  if (!qword_10000C028)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_10000C028);
  }
  return result;
}

uint64_t sub_100005F50(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100005F94(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_100005FCC(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100006014(unint64_t *a1, unint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100005FCC(&qword_10000C050);
    sub_100006094(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100006094(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100006EA0();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_1000060D8()
{
  unint64_t result = qword_10000C090;
  if (!qword_10000C090)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C090);
  }
  return result;
}

uint64_t sub_10000612C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_100006200(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_100006830((uint64_t)v12, *a3);
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
      sub_100006830((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_1000067E0((uint64_t)v12);
  return v7;
}

uint64_t sub_100006200(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_100007050();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_1000063BC(a5, a6);
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
  uint64_t v8 = sub_100007070();
  if (!v8)
  {
    sub_100007080();
    __break(1u);
LABEL_17:
    uint64_t result = sub_1000070A0();
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

uint64_t sub_1000063BC(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_100006454(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_100006634(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_100006634(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_100006454(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_1000065CC(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_100007060();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_100007080();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_100007010();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_1000070A0();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_100007080();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_1000065CC(uint64_t a1, uint64_t a2)
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
  sub_100005F50(&qword_10000C0A0);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_100006634(char a1, int64_t a2, char a3, char *a4)
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
    sub_100005F50(&qword_10000C0A0);
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
  uint64_t result = sub_1000070A0();
  __break(1u);
  return result;
}

uint64_t sub_100006784(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100005F50(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_1000067E0(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_100006830(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_100006890(uint64_t a1, uint64_t a2)
{
  sub_100007110();
  sub_100006FF0();
  Swift::Int v4 = sub_100007120();

  return sub_10000697C(a1, a2, v4);
}

uint64_t sub_100006908(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100005F50(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

_OWORD *sub_10000696C(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

unint64_t sub_10000697C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_1000070C0() & 1) == 0)
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
      while (!v14 && (sub_1000070C0() & 1) == 0);
    }
  }
  return v6;
}

uint64_t *sub_100006A60(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

unsigned char *initializeBufferWithCopyOfBuffer for SiriCoreMetricsWorkerError(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for SiriCoreMetricsWorkerError(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF8) {
    goto LABEL_17;
  }
  if (a2 + 8 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 8) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 8;
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
      return (*a1 | (v4 << 8)) - 8;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 8;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 9;
  int v8 = v6 - 9;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for SiriCoreMetricsWorkerError(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 8 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 8) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF8) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF7)
  {
    unsigned int v6 = ((a2 - 248) >> 8) + 1;
    *uint64_t result = a2 + 8;
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
        JUMPOUT(0x100006C30);
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
          *uint64_t result = a2 + 8;
        break;
    }
  }
  return result;
}

uint64_t sub_100006C58(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_100006C64(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for SiriCoreMetricsWorkerError()
{
  return &type metadata for SiriCoreMetricsWorkerError;
}

unint64_t sub_100006C80()
{
  unint64_t result = qword_10000C0B8;
  if (!qword_10000C0B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C0B8);
  }
  return result;
}

unint64_t sub_100006CD8()
{
  unint64_t result = qword_10000C0C0;
  if (!qword_10000C0C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C0C0);
  }
  return result;
}

unint64_t sub_100006D30()
{
  unint64_t result = qword_10000C0C8;
  if (!qword_10000C0C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C0C8);
  }
  return result;
}

unint64_t sub_100006D88()
{
  unint64_t result = qword_10000C0D0;
  if (!qword_10000C0D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C0D0);
  }
  return result;
}

uint64_t sub_100006DDC(uint64_t a1, void *a2)
{
  v6._countAndFlagsBits = a1;
  v3._rawValue = &off_1000085D0;
  v6._object = a2;
  unint64_t v4 = sub_1000070B0(v3, v6);
  swift_bridgeObjectRelease();
  if (v4 >= 9) {
    return 9;
  }
  else {
    return v4;
  }
}

uint64_t sub_100006E30()
{
  return SiriCoreMetricsV2.init()();
}

uint64_t sub_100006E40()
{
  return type metadata accessor for SiriCoreMetricsV2();
}

uint64_t sub_100006E50()
{
  return PluginContext.init(trialId:parameters:attachments:trialNamespace:MLHostContext:)();
}

uint64_t sub_100006E60()
{
  return type metadata accessor for PluginContext();
}

uint64_t sub_100006E70()
{
  return type metadata accessor for TimedOutError();
}

uint64_t sub_100006E80()
{
  return type metadata accessor for LighthouseRuntimeError();
}

uint64_t sub_100006E90()
{
  return LighthouseRuntimeParams.processTimeoutInMilliseconds.getter();
}

uint64_t sub_100006EA0()
{
  return type metadata accessor for LighthouseRuntimeParams();
}

uint64_t sub_100006EC0()
{
  return LighthouseRuntimeProcessor.init(task:plugin:enforceDiagnosticCheck:)();
}

uint64_t sub_100006ED0()
{
  return type metadata accessor for LighthouseRuntimeProcessorResult();
}

uint64_t sub_100006EE0()
{
  return type metadata accessor for LighthouseProcessorTaskAlreadyRunning();
}

uint64_t sub_100006EF0()
{
  return static AppExtension.main()();
}

uint64_t sub_100006F00()
{
  return MLHostResult.init(error:policy:)();
}

uint64_t sub_100006F10()
{
  return MLHostResult.init(status:policy:)();
}

uint64_t sub_100006F20()
{
  return type metadata accessor for MLHostResult();
}

uint64_t sub_100006F60()
{
  return MLHostParameters.taskParameters.getter();
}

uint64_t sub_100006F70()
{
  return MLHostExtensionContext.taskId.getter();
}

uint64_t sub_100006F80()
{
  return MLHostExtensionContext.taskName.getter();
}

uint64_t sub_100006F90()
{
  return type metadata accessor for StreamBookmarkStoreError();
}

uint64_t sub_100006FA0()
{
  return Logger.logObject.getter();
}

uint64_t sub_100006FB0()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_100006FC0()
{
  return type metadata accessor for Logger();
}

NSString sub_100006FD0()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_100006FE0()
{
  return String.init<A>(describing:)();
}

uint64_t sub_100006FF0()
{
  return String.hash(into:)();
}

void sub_100007000(Swift::String a1)
{
}

Swift::Int sub_100007010()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_100007020()
{
  return static os_log_type_t.info.getter();
}

uint64_t sub_100007030()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_100007040()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_100007050()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_100007060()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_100007070()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_100007080()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_100007090()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_1000070A0()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

Swift::Int sub_1000070B0(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases, string);
}

uint64_t sub_1000070C0()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_1000070D0()
{
  return Error._getEmbeddedNSError()();
}

uint64_t sub_1000070E0()
{
  return Error._code.getter();
}

uint64_t sub_1000070F0()
{
  return Error._domain.getter();
}

uint64_t sub_100007100()
{
  return Error._userInfo.getter();
}

uint64_t sub_100007110()
{
  return Hasher.init(_seed:)();
}

Swift::Int sub_100007120()
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

id objc_retain(id a1)
{
  return _objc_retain(a1);
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

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}