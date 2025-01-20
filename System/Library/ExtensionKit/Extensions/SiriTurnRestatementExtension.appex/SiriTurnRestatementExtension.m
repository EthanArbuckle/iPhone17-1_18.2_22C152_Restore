uint64_t sub_1000024B8()
{
  uint64_t v0;

  v0 = sub_100006E40();
  sub_1000068F8(v0, qword_10000C490);
  sub_100005C4C(v0, (uint64_t)qword_10000C490);
  return sub_100006E30();
}

unint64_t sub_100002538(char a1)
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

uint64_t sub_10000266C(char *a1, char *a2)
{
  return sub_100002678(*a1, *a2);
}

uint64_t sub_100002678(char a1, char a2)
{
  unint64_t v3 = 0xD000000000000017;
  unint64_t v4 = 0x8000000100007540;
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
  unint64_t v8 = 0x8000000100007540;
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
    char v11 = sub_100007000();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v11 & 1;
}

Swift::Int sub_100002928()
{
  return sub_100007060();
}

uint64_t sub_100002970()
{
  return sub_100002978();
}

uint64_t sub_100002978()
{
  sub_100006EF0();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_100002AE0()
{
  return sub_100007060();
}

uint64_t sub_100002B24@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_100006C74(*(void *)a1, *(void **)(a1 + 8));
  *a2 = result;
  return result;
}

unint64_t sub_100002B54@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_100002538(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_100002B90(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[40] = a3;
  v4[41] = a4;
  v4[38] = a1;
  v4[39] = a2;
  uint64_t v5 = sub_100006CE0();
  v4[42] = v5;
  v4[43] = *(void *)(v5 - 8);
  v4[44] = swift_task_alloc();
  uint64_t v6 = sub_100006F20();
  v4[45] = v6;
  v4[46] = *(void *)(v6 - 8);
  v4[47] = swift_task_alloc();
  uint64_t v7 = sub_100006D50();
  v4[48] = v7;
  v4[49] = *(void *)(v7 - 8);
  v4[50] = swift_task_alloc();
  uint64_t v8 = sub_100006E10();
  v4[51] = v8;
  v4[52] = *(void *)(v8 - 8);
  v4[53] = swift_task_alloc();
  uint64_t v9 = sub_100006CF0();
  v4[54] = v9;
  v4[55] = *(void *)(v9 - 8);
  v4[56] = swift_task_alloc();
  sub_100005C08(&qword_10000C038);
  v4[57] = swift_task_alloc();
  sub_100005C08(&qword_10000C040);
  v4[58] = swift_task_alloc();
  uint64_t v10 = sub_100006D40();
  v4[59] = v10;
  v4[60] = *(void *)(v10 - 8);
  v4[61] = swift_task_alloc();
  v4[62] = swift_task_alloc();
  v4[63] = swift_task_alloc();
  v4[64] = swift_task_alloc();
  uint64_t v11 = sub_100006CD0();
  v4[65] = v11;
  v4[66] = *(void *)(v11 - 8);
  v4[67] = swift_task_alloc();
  sub_100005C08(&qword_10000C048);
  v4[68] = swift_task_alloc();
  v4[69] = sub_100005C08(&qword_10000C050);
  v4[70] = swift_task_alloc();
  v4[71] = swift_task_alloc();
  uint64_t v12 = sub_100006E50();
  v4[72] = v12;
  v4[73] = *(void *)(v12 - 8);
  v4[74] = swift_task_alloc();
  uint64_t v13 = sub_100006E80();
  v4[75] = v13;
  v4[76] = *(void *)(v13 - 8);
  v4[77] = swift_task_alloc();
  v4[78] = swift_task_alloc();
  v4[79] = sub_100006E60();
  v4[80] = swift_task_alloc();
  return _swift_task_switch(sub_100003070, 0, 0);
}

uint64_t sub_100003070()
{
  v40 = v0;
  if (qword_10000C100 != -1) {
    swift_once();
  }
  v1 = (void *)v0[38];
  uint64_t v2 = sub_100006E40();
  v0[81] = sub_100005C4C(v2, (uint64_t)qword_10000C490);
  id v3 = v1;
  unint64_t v4 = sub_100006E20();
  os_log_type_t v5 = sub_100006F30();
  BOOL v6 = os_log_type_enabled(v4, v5);
  uint64_t v7 = (void *)v0[38];
  if (v6)
  {
    uint64_t v8 = swift_slowAlloc();
    uint64_t v39 = swift_slowAlloc();
    *(_DWORD *)uint64_t v8 = 136315394;
    uint64_t v9 = sub_100006DF0();
    v0[37] = sub_100005FC4(v9, v10, &v39);
    sub_100006F70();

    swift_bridgeObjectRelease();
    *(_WORD *)(v8 + 12) = 2080;
    uint64_t v11 = sub_100006E00();
    v0[29] = sub_100005FC4(v11, v12, &v39);
    sub_100006F70();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "TaskId: %s, TaskName: %s", (uint8_t *)v8, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  unint64_t v20 = v0[41];
  unint64_t v21 = v20 + 1000;
  if (v20 >= 0xFFFFFFFFFFFFFC18)
  {
    __break(1u);
    goto LABEL_12;
  }
  uint64_t v22 = swift_allocObject();
  *(void *)(v22 + 16) = v21;
  v0[16] = sub_100005C94;
  v0[17] = v22;
  v0[12] = _NSConcreteStackBlock;
  v0[13] = 1107296256;
  v0[14] = sub_10000531C;
  v0[15] = &unk_100008828;
  _Block_copy(v0 + 12);
  v0[34] = &_swiftEmptyArrayStorage;
  sub_100005F28(&qword_10000C058, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_100005C08(&qword_10000C060);
  sub_100005DB0();
  sub_100006F90();
  sub_100006EB0();
  swift_allocObject();
  v0[82] = sub_100006E90();
  swift_release();
  sub_100005E54();
  v23 = (void *)sub_100006F60();
  uint64_t v13 = sub_100006E70();
  if ((v21 & 0x8000000000000000) != 0)
  {
LABEL_12:
    __break(1u);
    return MLHostExtension.loadConfig<A>(context:)(v13, v14, v15, v16, v17, v18, v19);
  }
  uint64_t v24 = v0[78];
  uint64_t v25 = v0[77];
  uint64_t v26 = v0[76];
  uint64_t v27 = v0[75];
  v28 = (unint64_t *)v0[74];
  unint64_t v29 = v21;
  uint64_t v30 = v0[73];
  uint64_t v31 = v0[72];
  uint64_t v38 = v0[41];
  long long v37 = *(_OWORD *)(v0 + 39);
  unint64_t *v28 = v29;
  (*(void (**)(unint64_t *, void, uint64_t))(v30 + 104))(v28, enum case for DispatchTimeInterval.milliseconds(_:), v31);
  sub_100006EC0();
  (*(void (**)(unint64_t *, uint64_t))(v30 + 8))(v28, v31);
  v32 = *(void (**)(uint64_t, uint64_t))(v26 + 8);
  v32(v25, v27);
  sub_100006F50();

  v32(v24, v27);
  *(_OWORD *)(v0 + 21) = v37;
  v0[23] = v38;
  v33 = (void *)swift_task_alloc();
  v0[83] = v33;
  unint64_t v34 = sub_100005BB4();
  uint64_t v35 = sub_100005E94(&qword_10000C078, &qword_10000C080);
  uint64_t v19 = sub_100005E94(&qword_10000C088, &qword_10000C090);
  void *v33 = v0;
  v33[1] = sub_1000035C8;
  uint64_t v16 = v0[69];
  uint64_t v13 = v0[68];
  uint64_t v14 = v0[38];
  uint64_t v15 = &type metadata for SiriTurnRestatementExtension;
  unint64_t v17 = v34;
  uint64_t v18 = v35;
  return MLHostExtension.loadConfig<A>(context:)(v13, v14, v15, v16, v17, v18, v19);
}

uint64_t sub_1000035C8()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_1000036C4, 0, 0);
}

uint64_t sub_1000036C4()
{
  uint64_t v64 = v0;
  uint64_t v1 = *(void *)(v0 + 544);
  uint64_t v2 = sub_100005C08(&qword_10000C098);
  uint64_t v3 = *(void *)(v2 - 8);
  int v4 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v1, 1, v2);
  uint64_t v5 = *(void *)(v0 + 568);
  if (v4 == 1)
  {
    sub_10000661C(v1, &qword_10000C048);
    uint64_t v6 = sub_100006D10();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  }
  else
  {
    sub_100006DE0();
    (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  }
  uint64_t v7 = *(void *)(v0 + 560);
  sub_1000067A0(*(void *)(v0 + 568), v7, &qword_10000C050);
  uint64_t v8 = sub_100006D10();
  uint64_t v9 = *(void *)(v8 - 8);
  int v10 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8);
  uint64_t v11 = *(void *)(v0 + 560);
  if (v10 == 1)
  {
    sub_10000661C(*(void *)(v0 + 560), &qword_10000C050);
    uint64_t v12 = *(void *)(v0 + 328);
  }
  else
  {
    uint64_t v13 = *(void *)(v0 + 328);
    uint64_t v14 = sub_100006D00();
    char v16 = v15;
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v11, v8);
    if (v16) {
      uint64_t v12 = v13;
    }
    else {
      uint64_t v12 = v14;
    }
  }
  unint64_t v17 = *(void **)(v0 + 512);
  uint64_t v18 = *(void *)(v0 + 480);
  uint64_t v19 = *(void **)(v0 + 304);
  swift_bridgeObjectRetain();
  v66._countAndFlagsBits = 0x74736F484C4D2DLL;
  v66._object = (void *)0xE700000000000000;
  sub_100006F00(v66);
  v63[0] = sub_100006E00();
  v63[1] = v20;
  v67._countAndFlagsBits = 0x74736F484C4D2DLL;
  v67._object = (void *)0xE700000000000000;
  sub_100006F00(v67);
  id v21 = objc_allocWithZone((Class)TRIBackgroundMLTaskIdentifiers);
  NSString v22 = sub_100006ED0();
  swift_bridgeObjectRelease();
  NSString v23 = sub_100006ED0();
  swift_bridgeObjectRelease();
  [v21 initWithBMLTTaskId:v22 deploymentId:1 treatmentId:v23];

  sub_100005C08(&qword_10000C0A0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_100007350;
  *(void *)(inited + 32) = 0xD00000000000001CLL;
  *(void *)(inited + 40) = 0x8000000100007620;
  *(void *)(inited + 72) = &type metadata for UInt64;
  *(void *)(inited + 48) = v12;
  sub_100005360(inited);
  id v25 = v19;
  sub_100006CC0();
  *unint64_t v17 = 0;
  *(_DWORD *)(v0 + 712) = enum case for LighthouseRuntimeProcessorResult.error(_:);
  uint64_t v26 = *(void (**)(void *))(v18 + 104);
  *(void *)(v0 + 672) = v26;
  *(void *)(v0 + 680) = (v18 + 104) & 0xFFFFFFFFFFFFLL | 0xB2E4000000000000;
  v26(v17);
  sub_100006D80();
  swift_allocObject();
  *(void *)(v0 + 288) = sub_100006D70();
  sub_100005C08(&qword_10000C0B8);
  swift_allocObject();
  uint64_t v27 = sub_100006D30();
  *(void *)(v0 + 688) = v27;
  if (v27)
  {
    uint64_t v28 = *(void *)(v0 + 528);
    uint64_t v29 = *(void *)(v0 + 520);
    uint64_t v30 = *(void *)(v0 + 456);
    (*(void (**)(uint64_t, void, uint64_t))(v28 + 16))(v30, *(void *)(v0 + 536), v29);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v28 + 56))(v30, 0, 1, v29);
    uint64_t v31 = (void *)swift_task_alloc();
    *(void *)(v0 + 696) = v31;
    *uint64_t v31 = v0;
    v31[1] = sub_10000448C;
    uint64_t v33 = *(void *)(v0 + 456);
    uint64_t v32 = *(void *)(v0 + 464);
    return LighthouseRuntimeProcessor.processAsync(withContext:)(v32, v33);
  }
  else
  {
    uint64_t v34 = *(void *)(v0 + 504);
    uint64_t v35 = *(void *)(v0 + 472);
    uint64_t v36 = *(void *)(v0 + 464);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v0 + 480) + 56))(v36, 1, 1, v35);
    ((void (*)(uint64_t, void, uint64_t))v26)(v34, enum case for LighthouseRuntimeProcessorResult.notAllowedToProcess(_:), v35);
    sub_10000661C(v36, &qword_10000C040);
    (*(void (**)(void, void, void))(*(void *)(v0 + 480) + 40))(*(void *)(v0 + 512), *(void *)(v0 + 504), *(void *)(v0 + 472));
    long long v37 = sub_100006E20();
    os_log_type_t v38 = sub_100006F40();
    if (os_log_type_enabled(v37, v38))
    {
      uint64_t v39 = *(void *)(v0 + 512);
      uint64_t v40 = *(void *)(v0 + 496);
      uint64_t v42 = *(void *)(v0 + 472);
      uint64_t v41 = *(void *)(v0 + 480);
      v43 = (uint8_t *)swift_slowAlloc();
      v63[0] = swift_slowAlloc();
      *(_DWORD *)v43 = 136315138;
      swift_beginAccess();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v41 + 16))(v40, v39, v42);
      uint64_t v44 = sub_100006EE0();
      *(void *)(v0 + 280) = sub_100005FC4(v44, v45, v63);
      sub_100006F70();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v37, v38, "Lighthouse runtime process result: %s", v43, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    int v46 = *(_DWORD *)(v0 + 712);
    uint64_t v47 = *(void *)(v0 + 512);
    uint64_t v49 = *(void *)(v0 + 480);
    uint64_t v48 = *(void *)(v0 + 488);
    uint64_t v50 = *(void *)(v0 + 472);
    swift_beginAccess();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v49 + 16))(v48, v47, v50);
    int v51 = (*(uint64_t (**)(uint64_t, uint64_t))(v49 + 88))(v48, v50);
    if (v51 == v46)
    {
      (*(void (**)(void, void))(*(void *)(v0 + 480) + 96))(*(void *)(v0 + 488), *(void *)(v0 + 472));
      swift_errorRelease();
    }
    else if (v51 != enum case for LighthouseRuntimeProcessorResult.success(_:) {
           && v51 != enum case for LighthouseRuntimeProcessorResult.cancelled(_:)
    }
           && v51 != enum case for LighthouseRuntimeProcessorResult.notAllowedToProcess(_:))
    {
      (*(void (**)(void, void))(*(void *)(v0 + 480) + 8))(*(void *)(v0 + 488), *(void *)(v0 + 472));
    }
    sub_100006EA0();
    uint64_t v52 = *(void *)(v0 + 568);
    uint64_t v53 = *(void *)(v0 + 536);
    uint64_t v54 = *(void *)(v0 + 528);
    uint64_t v55 = *(void *)(v0 + 520);
    uint64_t v56 = *(void *)(v0 + 472);
    uint64_t v57 = *(void *)(v0 + 480);
    uint64_t v62 = *(void *)(v0 + 512);
    id v58 = objc_allocWithZone((Class)sub_100006DB0());
    uint64_t v61 = sub_100006DA0();
    swift_release();
    (*(void (**)(uint64_t, uint64_t))(v54 + 8))(v53, v55);
    sub_10000661C(v52, &qword_10000C050);
    (*(void (**)(uint64_t, uint64_t))(v57 + 8))(v62, v56);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
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

uint64_t sub_10000448C()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 704) = v0;
  swift_task_dealloc();
  sub_10000661C(*(void *)(v2 + 456), &qword_10000C038);
  swift_release();
  if (v0) {
    uint64_t v3 = sub_100004A84;
  }
  else {
    uint64_t v3 = sub_1000045E4;
  }
  return _swift_task_switch(v3, 0, 0);
}

uint64_t sub_1000045E4()
{
  uint64_t v32 = v0;
  uint64_t v1 = *(void *)(v0 + 504);
  uint64_t v3 = *(void *)(v0 + 472);
  uint64_t v2 = *(void *)(v0 + 480);
  uint64_t v4 = *(void *)(v0 + 464);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v2 + 56))(v4, 0, 1, v3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 32))(v1, v4, v3);
  (*(void (**)(void, void, void))(*(void *)(v0 + 480) + 40))(*(void *)(v0 + 512), *(void *)(v0 + 504), *(void *)(v0 + 472));
  uint64_t v5 = sub_100006E20();
  os_log_type_t v6 = sub_100006F40();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = *(void *)(v0 + 512);
    uint64_t v8 = *(void *)(v0 + 496);
    uint64_t v9 = *(void *)(v0 + 472);
    uint64_t v10 = *(void *)(v0 + 480);
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    uint64_t v31 = swift_slowAlloc();
    *(_DWORD *)uint64_t v11 = 136315138;
    swift_beginAccess();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 16))(v8, v7, v9);
    uint64_t v12 = sub_100006EE0();
    *(void *)(v0 + 280) = sub_100005FC4(v12, v13, &v31);
    sub_100006F70();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "Lighthouse runtime process result: %s", v11, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  int v14 = *(_DWORD *)(v0 + 712);
  uint64_t v15 = *(void *)(v0 + 512);
  uint64_t v17 = *(void *)(v0 + 480);
  uint64_t v16 = *(void *)(v0 + 488);
  uint64_t v18 = *(void *)(v0 + 472);
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v17 + 16))(v16, v15, v18);
  int v19 = (*(uint64_t (**)(uint64_t, uint64_t))(v17 + 88))(v16, v18);
  if (v19 == v14)
  {
    (*(void (**)(void, void))(*(void *)(v0 + 480) + 96))(*(void *)(v0 + 488), *(void *)(v0 + 472));
    swift_errorRelease();
  }
  else if (v19 != enum case for LighthouseRuntimeProcessorResult.success(_:) {
         && v19 != enum case for LighthouseRuntimeProcessorResult.cancelled(_:)
  }
         && v19 != enum case for LighthouseRuntimeProcessorResult.notAllowedToProcess(_:))
  {
    (*(void (**)(void, void))(*(void *)(v0 + 480) + 8))(*(void *)(v0 + 488), *(void *)(v0 + 472));
  }
  sub_100006EA0();
  uint64_t v20 = *(void *)(v0 + 568);
  uint64_t v21 = *(void *)(v0 + 536);
  uint64_t v22 = *(void *)(v0 + 528);
  uint64_t v23 = *(void *)(v0 + 520);
  uint64_t v24 = *(void *)(v0 + 512);
  uint64_t v26 = *(void *)(v0 + 472);
  uint64_t v25 = *(void *)(v0 + 480);
  id v27 = objc_allocWithZone((Class)sub_100006DB0());
  uint64_t v30 = sub_100006DA0();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v21, v23);
  sub_10000661C(v20, &qword_10000C050);
  (*(void (**)(uint64_t, uint64_t))(v25 + 8))(v24, v26);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
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

uint64_t sub_100004A84()
{
  uint64_t v49 = v0;
  uint64_t v1 = *(void *)(v0 + 704);
  *(void *)(v0 + 264) = v1;
  swift_errorRetain();
  sub_100005C08(&qword_10000C0A8);
  if (swift_dynamicCast())
  {
    int v2 = (*(uint64_t (**)(void, void))(*(void *)(v0 + 440) + 88))(*(void *)(v0 + 448), *(void *)(v0 + 432));
    if (v2 == enum case for LighthouseRuntimeError.missingDataRecords(_:))
    {
      swift_errorRelease();
      swift_errorRelease();
      char v46 = 0;
      char v3 = 3;
      goto LABEL_25;
    }
    if (v2 == enum case for LighthouseRuntimeError.missingWorkerResult(_:))
    {
      swift_errorRelease();
      swift_errorRelease();
      char v46 = 0;
      char v3 = 4;
      goto LABEL_25;
    }
    (*(void (**)(void, void))(*(void *)(v0 + 440) + 8))(*(void *)(v0 + 448), *(void *)(v0 + 432));
  }
  swift_errorRelease();
  *(void *)(v0 + 216) = v1;
  swift_errorRetain();
  if (swift_dynamicCast())
  {
    int v4 = (*(uint64_t (**)(void, void))(*(void *)(v0 + 416) + 88))(*(void *)(v0 + 424), *(void *)(v0 + 408));
    if (v4 == enum case for StreamBookmarkStoreError.emptyBookmarkName(_:))
    {
      swift_errorRelease();
      swift_errorRelease();
      char v46 = 0;
      char v3 = 6;
      goto LABEL_25;
    }
    if (v4 == enum case for StreamBookmarkStoreError.bookmarkArchive(_:))
    {
      swift_errorRelease();
      swift_errorRelease();
      char v46 = 0;
      char v3 = 7;
      goto LABEL_25;
    }
    if (v4 == enum case for StreamBookmarkStoreError.bookmarkUnarchive(_:))
    {
      swift_errorRelease();
      swift_errorRelease();
      char v46 = 0;
      char v3 = 8;
      goto LABEL_25;
    }
    (*(void (**)(void, void))(*(void *)(v0 + 416) + 8))(*(void *)(v0 + 424), *(void *)(v0 + 408));
  }
  swift_errorRelease();
  *(void *)(v0 + 224) = v1;
  swift_errorRetain();
  if (swift_dynamicCast() && *(unsigned char *)(v0 + 716) == 5)
  {
    swift_errorRelease();
    swift_errorRelease();
    char v46 = 0;
    char v3 = 5;
  }
  else
  {
    swift_errorRelease();
    *(void *)(v0 + 240) = v1;
    swift_errorRetain();
    if (swift_dynamicCast())
    {
      uint64_t v6 = *(void *)(v0 + 392);
      uint64_t v5 = *(void *)(v0 + 400);
      uint64_t v7 = *(void *)(v0 + 384);
      swift_errorRelease();
      (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);
      swift_errorRelease();
      char v46 = 0;
      char v3 = 2;
    }
    else
    {
      swift_errorRelease();
      *(void *)(v0 + 248) = v1;
      swift_errorRetain();
      if (swift_dynamicCast())
      {
        uint64_t v8 = *(void (**)(uint64_t, void, uint64_t))(v0 + 672);
        uint64_t v9 = *(void *)(v0 + 512);
        uint64_t v10 = *(void *)(v0 + 472);
        uint64_t v11 = *(void *)(v0 + 480);
        uint64_t v13 = *(void *)(v0 + 368);
        uint64_t v12 = *(void *)(v0 + 376);
        uint64_t v14 = *(void *)(v0 + 360);
        swift_errorRelease();
        (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v9, v10);
        v8(v9, enum case for LighthouseRuntimeProcessorResult.cancelled(_:), v10);
        (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v12, v14);
        swift_errorRelease();
        char v44 = 9;
        char v46 = 1;
        goto LABEL_26;
      }
      swift_errorRelease();
      *(void *)(v0 + 256) = v1;
      swift_errorRetain();
      if (swift_dynamicCast())
      {
        uint64_t v16 = *(void *)(v0 + 344);
        uint64_t v15 = *(void *)(v0 + 352);
        uint64_t v17 = *(void *)(v0 + 336);
        swift_errorRelease();
        (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v15, v17);
        swift_errorRelease();
        char v46 = 0;
        char v44 = 0;
        goto LABEL_26;
      }
      swift_errorRelease();
      swift_errorRelease();
      char v46 = 0;
      char v3 = 1;
    }
  }
LABEL_25:
  char v44 = v3;
LABEL_26:
  uint64_t v18 = sub_100006E20();
  os_log_type_t v19 = sub_100006F40();
  if (os_log_type_enabled(v18, v19))
  {
    uint64_t v20 = *(void *)(v0 + 512);
    uint64_t v21 = *(void *)(v0 + 496);
    uint64_t v22 = *(void *)(v0 + 472);
    uint64_t v23 = *(void *)(v0 + 480);
    uint64_t v24 = (uint8_t *)swift_slowAlloc();
    v48[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v24 = 136315138;
    swift_beginAccess();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v23 + 16))(v21, v20, v22);
    uint64_t v25 = sub_100006EE0();
    *(void *)(v0 + 280) = sub_100005FC4(v25, v26, v48);
    sub_100006F70();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v18, v19, "Lighthouse runtime process result: %s", v24, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  int v27 = *(_DWORD *)(v0 + 712);
  uint64_t v28 = *(void *)(v0 + 512);
  uint64_t v30 = *(void *)(v0 + 480);
  uint64_t v29 = *(void *)(v0 + 488);
  uint64_t v31 = *(void *)(v0 + 472);
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v30 + 16))(v29, v28, v31);
  int v32 = (*(uint64_t (**)(uint64_t, uint64_t))(v30 + 88))(v29, v31);
  if (v32 == v27)
  {
    (*(void (**)(void, void))(*(void *)(v0 + 480) + 96))(*(void *)(v0 + 488), *(void *)(v0 + 472));
    swift_errorRelease();
  }
  else if (v32 != enum case for LighthouseRuntimeProcessorResult.success(_:) {
         && v32 != enum case for LighthouseRuntimeProcessorResult.cancelled(_:)
  }
         && v32 != enum case for LighthouseRuntimeProcessorResult.notAllowedToProcess(_:))
  {
    (*(void (**)(void, void))(*(void *)(v0 + 480) + 8))(*(void *)(v0 + 488), *(void *)(v0 + 472));
  }
  sub_100006EA0();
  uint64_t v33 = *(void *)(v0 + 568);
  uint64_t v34 = *(void *)(v0 + 536);
  uint64_t v35 = *(void *)(v0 + 528);
  uint64_t v36 = *(void *)(v0 + 520);
  uint64_t v45 = *(void *)(v0 + 512);
  uint64_t v37 = *(void *)(v0 + 472);
  uint64_t v38 = *(void *)(v0 + 480);
  if (v46)
  {
    id v39 = objc_allocWithZone((Class)sub_100006DB0());
    uint64_t v40 = sub_100006DA0();
  }
  else
  {
    v48[3] = (uint64_t)&type metadata for SiriTurnRestatementError;
    v48[4] = sub_100005F70();
    LOBYTE(v48[0]) = v44;
    id v41 = objc_allocWithZone((Class)sub_100006DB0());
    uint64_t v40 = sub_100006D90();
  }
  uint64_t v47 = v40;
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v35 + 8))(v34, v36);
  sub_10000661C(v33, &qword_10000C050);
  (*(void (**)(uint64_t, uint64_t))(v38 + 8))(v45, v37);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v42 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v42(v47);
}

uint64_t sub_10000531C(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

unint64_t sub_100005360(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    char v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100005C08(&qword_10000C0C8);
  uint64_t v2 = sub_100006FD0();
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
    sub_1000067A0(v6, (uint64_t)&v15, &qword_10000C0D0);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_100006728(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v3[6] + 16 * result);
    *uint64_t v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_100006804(&v17, (_OWORD *)(v3[7] + 32 * result));
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

uint64_t sub_100005498()
{
  return _swift_task_switch(sub_1000054B4, 0, 0);
}

uint64_t sub_1000054B4()
{
  objc_allocWithZone((Class)sub_100006DB0());
  uint64_t v1 = sub_100006DA0();
  uint64_t v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v2(v1);
}

uint64_t sub_100005528(uint64_t a1)
{
  uint64_t v4 = *v1;
  uint64_t v5 = v1[1];
  uint64_t v6 = v1[2];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_1000055D8;
  return sub_100002B90(a1, v4, v5, v6);
}

uint64_t sub_1000055D8(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  char v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

uint64_t sub_1000056D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v15 = (void *)swift_task_alloc();
  *(void *)(v7 + 16) = v15;
  *uint64_t v15 = v7;
  v15[1] = sub_1000057B8;
  return MLHostExtension.loadConfig<A>(context:)(a1, a2, a6, a3, a7, a4, a5);
}

uint64_t sub_1000057B8()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_1000058AC(uint64_t a1)
{
  unint64_t v2 = sub_100005BB4();

  return MLHostExtension.configuration.getter(a1, v2);
}

void sub_1000058F8(void *a1@<X8>)
{
  *a1 = 0xD00000000000001CLL;
  a1[1] = 0x8000000100007340;
  a1[2] = 120000;
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

unint64_t sub_100005980()
{
  unint64_t result = qword_10000C008[0];
  if (!qword_10000C008[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_10000C008);
  }
  return result;
}

uint64_t destroy for SiriTurnRestatementExtension()
{
  return swift_bridgeObjectRelease();
}

void *_s28SiriTurnRestatementExtension28SiriTurnRestatementExtensionVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for SiriTurnRestatementExtension(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  return a1;
}

__n128 initializeWithTake for SiriTurnRestatementExtension(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

void *assignWithTake for SiriTurnRestatementExtension(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  return a1;
}

uint64_t getEnumTagSinglePayload for SiriTurnRestatementExtension(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 24)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SiriTurnRestatementExtension(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 24) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SiriTurnRestatementExtension()
{
  return &type metadata for SiriTurnRestatementExtension;
}

uint64_t sub_100005B60()
{
  return *(void *)(swift_getOpaqueTypeConformance2() + 8);
}

unint64_t sub_100005BB4()
{
  unint64_t result = qword_10000C028;
  if (!qword_10000C028)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_10000C028);
  }
  return result;
}

uint64_t sub_100005C08(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100005C4C(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_100005C84()
{
  return _swift_deallocObject(v0, 24, 7);
}

void sub_100005C94()
{
  if (qword_10000C100 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_100006E40();
  sub_100005C4C(v0, (uint64_t)qword_10000C490);
  uint64_t v1 = sub_100006E20();
  os_log_type_t v2 = sub_100006F30();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v3 = 134217984;
    sub_100006F70();
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "Timeout after %llums, force exiting", v3, 0xCu);
    swift_slowDealloc();
  }

  exit(0);
}

uint64_t sub_100005D98(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100005DA8()
{
  return swift_release();
}

unint64_t sub_100005DB0()
{
  unint64_t result = qword_10000C068;
  if (!qword_10000C068)
  {
    sub_100005E0C(&qword_10000C060);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C068);
  }
  return result;
}

uint64_t sub_100005E0C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_100005E54()
{
  unint64_t result = qword_10000C070;
  if (!qword_10000C070)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10000C070);
  }
  return result;
}

uint64_t sub_100005E94(unint64_t *a1, unint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100005E0C(&qword_10000C050);
    sub_100005F28(a2, (void (*)(uint64_t))&type metadata accessor for LighthouseRuntimeParams);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100005F28(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_100005F70()
{
  unint64_t result = qword_10000C0B0;
  if (!qword_10000C0B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C0B0);
  }
  return result;
}

uint64_t sub_100005FC4(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_100006098(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_1000066C8((uint64_t)v12, *a3);
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
      sub_1000066C8((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_100006678((uint64_t)v12);
  return v7;
}

uint64_t sub_100006098(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_100006F80();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_100006254(a5, a6);
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
  uint64_t v8 = sub_100006FB0();
  if (!v8)
  {
    sub_100006FC0();
    __break(1u);
LABEL_17:
    uint64_t result = sub_100006FE0();
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

uint64_t sub_100006254(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_1000062EC(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_1000064CC(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_1000064CC(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_1000062EC(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_100006464(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_100006FA0();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_100006FC0();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_100006F10();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_100006FE0();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_100006FC0();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_100006464(uint64_t a1, uint64_t a2)
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
  sub_100005C08(&qword_10000C0C0);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_1000064CC(char a1, int64_t a2, char a3, char *a4)
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
    sub_100005C08(&qword_10000C0C0);
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
  uint64_t result = sub_100006FE0();
  __break(1u);
  return result;
}

uint64_t sub_10000661C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100005C08(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_100006678(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_1000066C8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_100006728(uint64_t a1, uint64_t a2)
{
  sub_100007050();
  sub_100006EF0();
  Swift::Int v4 = sub_100007060();

  return sub_100006814(a1, a2, v4);
}

uint64_t sub_1000067A0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100005C08(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

_OWORD *sub_100006804(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

unint64_t sub_100006814(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_100007000() & 1) == 0)
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
      while (!v14 && (sub_100007000() & 1) == 0);
    }
  }
  return v6;
}

uint64_t *sub_1000068F8(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

unsigned char *initializeBufferWithCopyOfBuffer for SiriTurnRestatementError(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for SiriTurnRestatementError(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for SiriTurnRestatementError(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x100006AC8);
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

uint64_t sub_100006AF0(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_100006AFC(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for SiriTurnRestatementError()
{
  return &type metadata for SiriTurnRestatementError;
}

unint64_t sub_100006B18()
{
  unint64_t result = qword_10000C0D8;
  if (!qword_10000C0D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C0D8);
  }
  return result;
}

unint64_t sub_100006B70()
{
  unint64_t result = qword_10000C0E0;
  if (!qword_10000C0E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C0E0);
  }
  return result;
}

unint64_t sub_100006BC8()
{
  unint64_t result = qword_10000C0E8;
  if (!qword_10000C0E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C0E8);
  }
  return result;
}

unint64_t sub_100006C20()
{
  unint64_t result = qword_10000C0F0;
  if (!qword_10000C0F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C0F0);
  }
  return result;
}

uint64_t sub_100006C74(uint64_t a1, void *a2)
{
  v6._countAndFlagsBits = a1;
  v3._rawValue = &off_100008688;
  v6._object = a2;
  unint64_t v4 = sub_100006FF0(v3, v6);
  swift_bridgeObjectRelease();
  if (v4 >= 9) {
    return 9;
  }
  else {
    return v4;
  }
}

uint64_t sub_100006CC0()
{
  return PluginContext.init(trialId:parameters:attachments:trialNamespace:MLHostContext:)();
}

uint64_t sub_100006CD0()
{
  return type metadata accessor for PluginContext();
}

uint64_t sub_100006CE0()
{
  return type metadata accessor for TimedOutError();
}

uint64_t sub_100006CF0()
{
  return type metadata accessor for LighthouseRuntimeError();
}

uint64_t sub_100006D00()
{
  return LighthouseRuntimeParams.processTimeoutInMilliseconds.getter();
}

uint64_t sub_100006D10()
{
  return type metadata accessor for LighthouseRuntimeParams();
}

uint64_t sub_100006D30()
{
  return LighthouseRuntimeProcessor.init(task:plugin:enforceDiagnosticCheck:)();
}

uint64_t sub_100006D40()
{
  return type metadata accessor for LighthouseRuntimeProcessorResult();
}

uint64_t sub_100006D50()
{
  return type metadata accessor for LighthouseProcessorTaskAlreadyRunning();
}

uint64_t sub_100006D60()
{
  return static AppExtension.main()();
}

uint64_t sub_100006D70()
{
  return SiriTurnRestatementPlugin.init()();
}

uint64_t sub_100006D80()
{
  return type metadata accessor for SiriTurnRestatementPlugin();
}

uint64_t sub_100006D90()
{
  return MLHostResult.init(error:policy:)();
}

uint64_t sub_100006DA0()
{
  return MLHostResult.init(status:policy:)();
}

uint64_t sub_100006DB0()
{
  return type metadata accessor for MLHostResult();
}

uint64_t sub_100006DE0()
{
  return MLHostParameters.taskParameters.getter();
}

uint64_t sub_100006DF0()
{
  return MLHostExtensionContext.taskId.getter();
}

uint64_t sub_100006E00()
{
  return MLHostExtensionContext.taskName.getter();
}

uint64_t sub_100006E10()
{
  return type metadata accessor for StreamBookmarkStoreError();
}

uint64_t sub_100006E20()
{
  return Logger.logObject.getter();
}

uint64_t sub_100006E30()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_100006E40()
{
  return type metadata accessor for Logger();
}

uint64_t sub_100006E50()
{
  return type metadata accessor for DispatchTimeInterval();
}

uint64_t sub_100006E60()
{
  return type metadata accessor for DispatchWorkItemFlags();
}

uint64_t sub_100006E70()
{
  return static DispatchTime.now()();
}

uint64_t sub_100006E80()
{
  return type metadata accessor for DispatchTime();
}

uint64_t sub_100006E90()
{
  return DispatchWorkItem.init(flags:block:)();
}

uint64_t sub_100006EA0()
{
  return dispatch thunk of DispatchWorkItem.cancel()();
}

uint64_t sub_100006EB0()
{
  return type metadata accessor for DispatchWorkItem();
}

uint64_t sub_100006EC0()
{
  return + infix(_:_:)();
}

NSString sub_100006ED0()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_100006EE0()
{
  return String.init<A>(describing:)();
}

uint64_t sub_100006EF0()
{
  return String.hash(into:)();
}

void sub_100006F00(Swift::String a1)
{
}

Swift::Int sub_100006F10()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_100006F20()
{
  return type metadata accessor for CancellationError();
}

uint64_t sub_100006F30()
{
  return static os_log_type_t.info.getter();
}

uint64_t sub_100006F40()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_100006F50()
{
  return OS_dispatch_queue.asyncAfter(deadline:execute:)();
}

uint64_t sub_100006F60()
{
  return static OS_dispatch_queue.main.getter();
}

uint64_t sub_100006F70()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_100006F80()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_100006F90()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

uint64_t sub_100006FA0()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_100006FB0()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_100006FC0()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_100006FD0()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_100006FE0()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

Swift::Int sub_100006FF0(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases, string);
}

uint64_t sub_100007000()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_100007010()
{
  return Error._getEmbeddedNSError()();
}

uint64_t sub_100007020()
{
  return Error._code.getter();
}

uint64_t sub_100007030()
{
  return Error._domain.getter();
}

uint64_t sub_100007040()
{
  return Error._userInfo.getter();
}

uint64_t sub_100007050()
{
  return Hasher.init(_seed:)();
}

Swift::Int sub_100007060()
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

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void exit(int a1)
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