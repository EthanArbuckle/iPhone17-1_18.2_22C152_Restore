uint64_t sub_100003708()
{
  uint64_t v0;

  v0 = sub_100007130();
  sub_100006C38(v0, qword_10000C480);
  sub_10000616C(v0, (uint64_t)qword_10000C480);
  return sub_100007120();
}

uint64_t sub_10000378C(char a1)
{
  if (a1) {
    return 0x7463657078656E75;
  }
  else {
    return 0x74754F64656D6974;
  }
}

uint64_t sub_1000037DC(char *a1, char *a2)
{
  return sub_1000037E8(*a1, *a2);
}

uint64_t sub_1000037E8(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    uint64_t v3 = 0x7463657078656E75;
  }
  else {
    uint64_t v3 = 0x74754F64656D6974;
  }
  if (v2) {
    unint64_t v4 = 0xED0000726F727245;
  }
  else {
    unint64_t v4 = 0xEF726F7272456465;
  }
  if (a2) {
    uint64_t v5 = 0x7463657078656E75;
  }
  else {
    uint64_t v5 = 0x74754F64656D6974;
  }
  if (a2) {
    unint64_t v6 = 0xEF726F7272456465;
  }
  else {
    unint64_t v6 = 0xED0000726F727245;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = sub_100007250();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

Swift::Int sub_1000038A4()
{
  return sub_1000038AC();
}

Swift::Int sub_1000038AC()
{
  return sub_1000072B0();
}

uint64_t sub_100003948()
{
  return sub_100003950();
}

uint64_t sub_100003950()
{
  sub_100007170();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_1000039D4()
{
  return sub_1000039DC();
}

Swift::Int sub_1000039DC()
{
  return sub_1000072B0();
}

uint64_t sub_100003A74@<X0>(uint64_t *a1@<X0>, char *a2@<X8>)
{
  v8._countAndFlagsBits = *a1;
  uint64_t v3 = (void *)a1[1];
  v4._rawValue = &off_1000085C0;
  v8._object = v3;
  Swift::Int v5 = sub_100007240(v4, v8);
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

uint64_t sub_100003AD4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10000378C(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_100003B10(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[26] = a2;
  v3[27] = a3;
  v3[25] = a1;
  sub_100006128(&qword_10000C040);
  v3[28] = swift_task_alloc();
  sub_100006128(&qword_10000C048);
  v3[29] = swift_task_alloc();
  sub_100006128(&qword_10000C050);
  v3[30] = swift_task_alloc();
  uint64_t v4 = sub_100007060();
  v3[31] = v4;
  v3[32] = *(void *)(v4 - 8);
  v3[33] = swift_task_alloc();
  v3[34] = swift_task_alloc();
  v3[35] = swift_task_alloc();
  v3[36] = swift_task_alloc();
  uint64_t v5 = sub_100007000();
  v3[37] = v5;
  v3[38] = *(void *)(v5 - 8);
  v3[39] = swift_task_alloc();
  sub_100006128(&qword_10000C058);
  v3[40] = swift_task_alloc();
  v3[41] = sub_100006128(&qword_10000C060);
  v3[42] = swift_task_alloc();
  v3[43] = swift_task_alloc();
  return _swift_task_switch(sub_100003D5C, 0, 0);
}

uint64_t sub_100003D5C()
{
  v23 = v0;
  if (qword_10000C0F0 != -1) {
    swift_once();
  }
  v1 = (void *)v0[25];
  uint64_t v2 = sub_100007130();
  v0[44] = sub_10000616C(v2, (uint64_t)qword_10000C480);
  id v3 = v1;
  uint64_t v4 = sub_100007110();
  os_log_type_t v5 = sub_1000071B0();
  BOOL v6 = os_log_type_enabled(v4, v5);
  uint64_t v7 = (void *)v0[25];
  if (v6)
  {
    uint64_t v8 = swift_slowAlloc();
    uint64_t v22 = swift_slowAlloc();
    *(_DWORD *)uint64_t v8 = 136315394;
    uint64_t v9 = sub_1000070F0();
    v0[23] = sub_100006304(v9, v10, &v22);
    sub_1000071D0();

    swift_bridgeObjectRelease();
    *(_WORD *)(v8 + 12) = 2080;
    uint64_t v11 = sub_100007100();
    v0[24] = sub_100006304(v11, v12, &v22);
    sub_1000071D0();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "TaskId: %s, TaskName: %s", (uint8_t *)v8, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  uint64_t v13 = v0[27];
  v0[18] = v0[26];
  v0[19] = v13;
  v14 = (void *)swift_task_alloc();
  v0[45] = v14;
  unint64_t v15 = sub_1000060D4();
  uint64_t v16 = sub_1000061EC(&qword_10000C068, &qword_10000C070);
  uint64_t v17 = sub_1000061EC(&qword_10000C078, &qword_10000C080);
  void *v14 = v0;
  v14[1] = sub_100004078;
  uint64_t v18 = v0[40];
  uint64_t v19 = v0[41];
  uint64_t v20 = v0[25];
  return MLHostExtension.loadConfig<A>(context:)(v18, v20, &type metadata for DeepThoughtWorker, v19, v15, v16, v17);
}

uint64_t sub_100004078()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_100004174, 0, 0);
}

uint64_t sub_100004174()
{
  v84 = v0;
  uint64_t v1 = v0[40];
  uint64_t v2 = sub_100006128(&qword_10000C088);
  uint64_t v3 = *(void *)(v2 - 8);
  int v4 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v1, 1, v2);
  uint64_t v5 = v0[43];
  if (v4 == 1)
  {
    sub_10000695C(v1, &qword_10000C058);
    uint64_t v6 = sub_100007030();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  }
  else
  {
    sub_1000070E0();
    (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  }
  uint64_t v7 = v0[42];
  uint64_t v8 = v0[43];
  swift_bridgeObjectRetain();
  v86._countAndFlagsBits = 0x74736F484C4D2DLL;
  v86._object = (void *)0xE700000000000000;
  sub_100007180(v86);
  v83[0] = sub_100007100();
  v83[1] = v9;
  v87._countAndFlagsBits = 0x74736F484C4D2DLL;
  v87._object = (void *)0xE700000000000000;
  sub_100007180(v87);
  id v10 = objc_allocWithZone((Class)TRIBackgroundMLTaskIdentifiers);
  NSString v11 = sub_100007140();
  swift_bridgeObjectRelease();
  NSString v12 = sub_100007140();
  swift_bridgeObjectRelease();
  [v10 initWithBMLTTaskId:v11 deploymentId:1 treatmentId:v12];

  sub_100006128(&qword_10000C090);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_100007560;
  *(void *)(inited + 32) = 0xD00000000000001CLL;
  *(void *)(inited + 40) = 0x8000000100007770;
  sub_100006AE0(v8, v7, &qword_10000C060);
  uint64_t v14 = sub_100007030();
  uint64_t v15 = *(void *)(v14 - 8);
  int v16 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v15 + 48))(v7, 1, v14);
  uint64_t v17 = v0[42];
  if (v16 == 1)
  {
    sub_10000695C(v0[42], &qword_10000C060);
    *(void *)(inited + 72) = &type metadata for UInt64;
LABEL_7:
    uint64_t v18 = 120000;
    goto LABEL_8;
  }
  uint64_t v18 = sub_100007020();
  char v20 = v19;
  (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v17, v14);
  *(void *)(inited + 72) = &type metadata for UInt64;
  if (v20) {
    goto LABEL_7;
  }
LABEL_8:
  uint64_t v21 = v0[26];
  uint64_t v22 = v0[27];
  v23 = (void *)v0[25];
  *(void *)(inited + 48) = v18;
  sub_1000058AC(inited);
  id v24 = v23;
  sub_100006FF0();
  v25 = self;
  sub_100006128(&qword_10000C098);
  uint64_t v26 = swift_allocObject();
  *(_OWORD *)(v26 + 16) = xmmword_100007570;
  sub_100006FE0();
  *(void *)(v26 + 32) = sub_100006FD0();
  *(void *)(v26 + 40) = v27;
  *(void *)(v26 + 48) = v21;
  *(void *)(v26 + 56) = v22;
  swift_bridgeObjectRetain();
  Class isa = sub_1000071A0().super.isa;
  swift_bridgeObjectRelease();
  id v29 = [v25 pathWithComponents:isa];

  sub_100007150();
  swift_allocObject();
  uint64_t v30 = sub_100006FC0();
  v0[46] = v30;
  v0[22] = v30;
  sub_100006128(&qword_10000C0B0);
  swift_allocObject();
  swift_retain();
  uint64_t v52 = sub_100007050();
  v0[47] = v52;
  if (v52)
  {
    uint64_t v53 = v0[38];
    uint64_t v54 = v0[37];
    uint64_t v55 = v0[29];
    (*(void (**)(uint64_t, void, uint64_t))(v53 + 16))(v55, v0[39], v54);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v53 + 56))(v55, 0, 1, v54);
    v56 = (void *)swift_task_alloc();
    v0[48] = v56;
    void *v56 = v0;
    v56[1] = sub_100004C60;
    uint64_t v58 = v0[29];
    uint64_t v57 = v0[30];
    return LighthouseRuntimeProcessor.processAsync(withContext:)(v57, v58);
  }
  uint64_t v77 = v0[35];
  uint64_t v79 = v0[31];
  uint64_t v78 = v0[32];
  uint64_t v80 = v0[30];
  swift_release();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v78 + 56))(v80, 1, 1, v79);
  (*(void (**)(uint64_t, void, uint64_t))(v78 + 104))(v77, enum case for LighthouseRuntimeProcessorResult.notAllowedToProcess(_:), v79);
  sub_10000695C(v80, &qword_10000C050);
  (*(void (**)(void, void, void))(v78 + 32))(v0[36], v0[35], v0[31]);
  v31 = sub_100007110();
  os_log_type_t v32 = sub_1000071C0();
  if (os_log_type_enabled(v31, v32))
  {
    uint64_t v33 = v0[36];
    uint64_t v34 = v0[34];
    uint64_t v35 = v0[31];
    uint64_t v36 = v0[32];
    v37 = (uint8_t *)swift_slowAlloc();
    v83[0] = swift_slowAlloc();
    *(_DWORD *)v37 = 136315138;
    swift_beginAccess();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v36 + 16))(v34, v33, v35);
    uint64_t v38 = sub_100007160();
    v0[21] = sub_100006304(v38, v39, v83);
    sub_1000071D0();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v31, v32, "Lighthouse runtime process result: %s", v37, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  uint64_t v40 = v0[36];
  uint64_t v42 = v0[32];
  uint64_t v41 = v0[33];
  uint64_t v43 = v0[31];
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v42 + 16))(v41, v40, v43);
  int v44 = (*(uint64_t (**)(uint64_t, uint64_t))(v42 + 88))(v41, v43);
  if (v44 != enum case for LighthouseRuntimeProcessorResult.error(_:))
  {
    if (v44 != enum case for LighthouseRuntimeProcessorResult.success(_:)
      && v44 != enum case for LighthouseRuntimeProcessorResult.cancelled(_:)
      && v44 != enum case for LighthouseRuntimeProcessorResult.notAllowedToProcess(_:))
    {
      (*(void (**)(void, void))(v0[32] + 8))(v0[33], v0[31]);
    }
    uint64_t v59 = v0[43];
    uint64_t v61 = v0[38];
    uint64_t v60 = v0[39];
    uint64_t v63 = v0[36];
    uint64_t v62 = v0[37];
    uint64_t v64 = v0[31];
    uint64_t v65 = v0[32];
    id v66 = objc_allocWithZone((Class)sub_1000070A0());
    uint64_t v82 = sub_100007090();
    (*(void (**)(uint64_t, uint64_t))(v61 + 8))(v60, v62);
    sub_10000695C(v59, &qword_10000C060);
    (*(void (**)(uint64_t, uint64_t))(v65 + 8))(v63, v64);
    goto LABEL_27;
  }
  v45 = (uint64_t *)v0[33];
  (*(void (**)(uint64_t *, void))(v0[32] + 96))(v45, v0[31]);
  uint64_t v46 = *v45;
  uint64_t v47 = v0[28];
  if (!v46)
  {
    uint64_t v67 = sub_100007010();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v67 - 8) + 56))(v47, 1, 1, v67);
    goto LABEL_25;
  }
  v0[20] = v46;
  sub_100006128(&qword_10000C0A8);
  uint64_t v48 = sub_100007010();
  int v49 = swift_dynamicCast();
  uint64_t v50 = *(void *)(v48 - 8);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v50 + 56))(v47, v49 ^ 1u, 1, v48);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v50 + 48))(v47, 1, v48) == 1)
  {
LABEL_25:
    char v51 = 1;
    goto LABEL_26;
  }
  char v51 = 0;
LABEL_26:
  uint64_t v68 = v0[43];
  uint64_t v70 = v0[38];
  uint64_t v69 = v0[39];
  uint64_t v72 = v0[36];
  uint64_t v71 = v0[37];
  uint64_t v73 = v0[31];
  uint64_t v74 = v0[32];
  sub_10000695C(v0[28], &qword_10000C040);
  v83[3] = (uint64_t)&type metadata for DeepThoughtWorkerError;
  v83[4] = sub_1000062B0();
  LOBYTE(v83[0]) = v51;
  id v75 = objc_allocWithZone((Class)sub_1000070A0());
  uint64_t v82 = sub_100007080();
  (*(void (**)(uint64_t, uint64_t))(v70 + 8))(v69, v71);
  sub_10000695C(v68, &qword_10000C060);
  (*(void (**)(uint64_t, uint64_t))(v74 + 8))(v72, v73);
LABEL_27:
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  v76 = (uint64_t (*)(uint64_t))v0[1];
  return v76(v82);
}

uint64_t sub_100004C60()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 392) = v0;
  swift_task_dealloc();
  sub_10000695C(*(void *)(v2 + 232), &qword_10000C048);
  swift_release();
  if (v0) {
    uint64_t v3 = sub_10000534C;
  }
  else {
    uint64_t v3 = sub_100004DB8;
  }
  return _swift_task_switch(v3, 0, 0);
}

uint64_t sub_100004DB8()
{
  uint64_t v48 = v0;
  uint64_t v1 = v0[35];
  uint64_t v3 = v0[31];
  uint64_t v2 = v0[32];
  uint64_t v4 = v0[30];
  swift_release();
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v2 + 56))(v4, 0, 1, v3);
  uint64_t v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 32);
  v5(v1, v4, v3);
  v5(v0[36], v0[35], v0[31]);
  uint64_t v6 = sub_100007110();
  os_log_type_t v7 = sub_1000071C0();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = v0[36];
    uint64_t v9 = v0[34];
    uint64_t v11 = v0[31];
    uint64_t v10 = v0[32];
    NSString v12 = (uint8_t *)swift_slowAlloc();
    v47[0] = swift_slowAlloc();
    *(_DWORD *)NSString v12 = 136315138;
    swift_beginAccess();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 16))(v9, v8, v11);
    uint64_t v13 = sub_100007160();
    v0[21] = sub_100006304(v13, v14, v47);
    sub_1000071D0();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "Lighthouse runtime process result: %s", v12, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  uint64_t v15 = v0[36];
  uint64_t v17 = v0[32];
  uint64_t v16 = v0[33];
  uint64_t v18 = v0[31];
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v17 + 16))(v16, v15, v18);
  int v19 = (*(uint64_t (**)(uint64_t, uint64_t))(v17 + 88))(v16, v18);
  if (v19 == enum case for LighthouseRuntimeProcessorResult.error(_:))
  {
    char v20 = (uint64_t *)v0[33];
    (*(void (**)(uint64_t *, void))(v0[32] + 96))(v20, v0[31]);
    uint64_t v21 = *v20;
    uint64_t v22 = v0[28];
    if (v21)
    {
      v0[20] = v21;
      sub_100006128(&qword_10000C0A8);
      uint64_t v23 = sub_100007010();
      int v24 = swift_dynamicCast();
      uint64_t v25 = *(void *)(v23 - 8);
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v25 + 56))(v22, v24 ^ 1u, 1, v23);
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v25 + 48))(v22, 1, v23) != 1)
      {
        char v26 = 0;
LABEL_14:
        uint64_t v36 = v0[43];
        uint64_t v38 = v0[38];
        uint64_t v37 = v0[39];
        uint64_t v40 = v0[36];
        uint64_t v39 = v0[37];
        uint64_t v41 = v0[31];
        uint64_t v42 = v0[32];
        sub_10000695C(v0[28], &qword_10000C040);
        v47[3] = (uint64_t)&type metadata for DeepThoughtWorkerError;
        v47[4] = sub_1000062B0();
        LOBYTE(v47[0]) = v26;
        id v43 = objc_allocWithZone((Class)sub_1000070A0());
        uint64_t v46 = sub_100007080();
        (*(void (**)(uint64_t, uint64_t))(v38 + 8))(v37, v39);
        sub_10000695C(v36, &qword_10000C060);
        (*(void (**)(uint64_t, uint64_t))(v42 + 8))(v40, v41);
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v35 = sub_100007010();
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v35 - 8) + 56))(v22, 1, 1, v35);
    }
    char v26 = 1;
    goto LABEL_14;
  }
  if (v19 != enum case for LighthouseRuntimeProcessorResult.success(_:)
    && v19 != enum case for LighthouseRuntimeProcessorResult.cancelled(_:)
    && v19 != enum case for LighthouseRuntimeProcessorResult.notAllowedToProcess(_:))
  {
    (*(void (**)(void, void))(v0[32] + 8))(v0[33], v0[31]);
  }
  uint64_t v27 = v0[43];
  uint64_t v29 = v0[38];
  uint64_t v28 = v0[39];
  uint64_t v31 = v0[36];
  uint64_t v30 = v0[37];
  uint64_t v32 = v0[31];
  uint64_t v33 = v0[32];
  id v34 = objc_allocWithZone((Class)sub_1000070A0());
  uint64_t v46 = sub_100007090();
  (*(void (**)(uint64_t, uint64_t))(v29 + 8))(v28, v30);
  sub_10000695C(v27, &qword_10000C060);
  (*(void (**)(uint64_t, uint64_t))(v33 + 8))(v31, v32);
LABEL_15:
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  int v44 = (uint64_t (*)(uint64_t))v0[1];
  return v44(v46);
}

uint64_t sub_10000534C()
{
  uint64_t v45 = v0;
  swift_release();
  uint64_t v1 = *(void *)(v0 + 256);
  **(void **)(v0 + 288) = *(void *)(v0 + 392);
  int v2 = enum case for LighthouseRuntimeProcessorResult.error(_:);
  (*(void (**)(void))(v1 + 104))();
  uint64_t v3 = sub_100007110();
  os_log_type_t v4 = sub_1000071C0();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = *(void *)(v0 + 288);
    uint64_t v6 = *(void *)(v0 + 272);
    uint64_t v7 = *(void *)(v0 + 248);
    uint64_t v8 = *(void *)(v0 + 256);
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    v44[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v9 = 136315138;
    swift_beginAccess();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))(v6, v5, v7);
    uint64_t v10 = sub_100007160();
    *(void *)(v0 + 168) = sub_100006304(v10, v11, v44);
    sub_1000071D0();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Lighthouse runtime process result: %s", v9, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  uint64_t v12 = *(void *)(v0 + 288);
  uint64_t v14 = *(void *)(v0 + 256);
  uint64_t v13 = *(void *)(v0 + 264);
  uint64_t v15 = *(void *)(v0 + 248);
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v14 + 16))(v13, v12, v15);
  int v16 = (*(uint64_t (**)(uint64_t, uint64_t))(v14 + 88))(v13, v15);
  if (v16 == v2)
  {
    uint64_t v17 = *(uint64_t **)(v0 + 264);
    (*(void (**)(uint64_t *, void))(*(void *)(v0 + 256) + 96))(v17, *(void *)(v0 + 248));
    uint64_t v18 = *v17;
    uint64_t v19 = *(void *)(v0 + 224);
    if (v18)
    {
      *(void *)(v0 + 160) = v18;
      sub_100006128(&qword_10000C0A8);
      uint64_t v20 = sub_100007010();
      int v21 = swift_dynamicCast();
      uint64_t v22 = *(void *)(v20 - 8);
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v22 + 56))(v19, v21 ^ 1u, 1, v20);
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v22 + 48))(v19, 1, v20) != 1)
      {
        char v23 = 0;
LABEL_14:
        uint64_t v33 = *(void *)(v0 + 344);
        uint64_t v35 = *(void *)(v0 + 304);
        uint64_t v34 = *(void *)(v0 + 312);
        uint64_t v37 = *(void *)(v0 + 288);
        uint64_t v36 = *(void *)(v0 + 296);
        uint64_t v38 = *(void *)(v0 + 248);
        uint64_t v39 = *(void *)(v0 + 256);
        sub_10000695C(*(void *)(v0 + 224), &qword_10000C040);
        v44[3] = (uint64_t)&type metadata for DeepThoughtWorkerError;
        v44[4] = sub_1000062B0();
        LOBYTE(v44[0]) = v23;
        id v40 = objc_allocWithZone((Class)sub_1000070A0());
        uint64_t v43 = sub_100007080();
        (*(void (**)(uint64_t, uint64_t))(v35 + 8))(v34, v36);
        sub_10000695C(v33, &qword_10000C060);
        (*(void (**)(uint64_t, uint64_t))(v39 + 8))(v37, v38);
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v32 = sub_100007010();
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v32 - 8) + 56))(v19, 1, 1, v32);
    }
    char v23 = 1;
    goto LABEL_14;
  }
  if (v16 != enum case for LighthouseRuntimeProcessorResult.success(_:)
    && v16 != enum case for LighthouseRuntimeProcessorResult.cancelled(_:)
    && v16 != enum case for LighthouseRuntimeProcessorResult.notAllowedToProcess(_:))
  {
    (*(void (**)(void, void))(*(void *)(v0 + 256) + 8))(*(void *)(v0 + 264), *(void *)(v0 + 248));
  }
  uint64_t v24 = *(void *)(v0 + 344);
  uint64_t v26 = *(void *)(v0 + 304);
  uint64_t v25 = *(void *)(v0 + 312);
  uint64_t v28 = *(void *)(v0 + 288);
  uint64_t v27 = *(void *)(v0 + 296);
  uint64_t v29 = *(void *)(v0 + 248);
  uint64_t v30 = *(void *)(v0 + 256);
  id v31 = objc_allocWithZone((Class)sub_1000070A0());
  uint64_t v43 = sub_100007090();
  (*(void (**)(uint64_t, uint64_t))(v26 + 8))(v25, v27);
  sub_10000695C(v24, &qword_10000C060);
  (*(void (**)(uint64_t, uint64_t))(v30 + 8))(v28, v29);
LABEL_15:
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v41 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v41(v43);
}

unint64_t sub_1000058AC(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100006128(&qword_10000C0C0);
  uint64_t v2 = sub_100007220();
  uint64_t v3 = (void *)v2;
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
    sub_100006AE0(v6, (uint64_t)&v15, &qword_10000C0C8);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_100006A68(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    unint64_t v11 = (uint64_t *)(v3[6] + 16 * result);
    *unint64_t v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_100006B44(&v17, (_OWORD *)(v3[7] + 32 * result));
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

uint64_t sub_1000059E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_100006FB8;
  return MLHostExtension.shouldRun(context:)(a1, a2, a3);
}

uint64_t sub_100005A94(uint64_t a1)
{
  uint64_t v5 = *v1;
  uint64_t v4 = v1[1];
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v6;
  *uint64_t v6 = v2;
  v6[1] = sub_100005B3C;
  return sub_100003B10(a1, v5, v4);
}

uint64_t sub_100005B3C(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

uint64_t sub_100005C38(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v15 = (void *)swift_task_alloc();
  *(void *)(v7 + 16) = v15;
  *uint64_t v15 = v7;
  v15[1] = sub_100005D1C;
  return MLHostExtension.loadConfig<A>(context:)(a1, a2, a6, a3, a7, a4, a5);
}

uint64_t sub_100005D1C()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_100005E10(uint64_t a1)
{
  unint64_t v2 = sub_1000060D4();

  return MLHostExtension.configuration.getter(a1, v2);
}

void sub_100005E5C(void *a1@<X8>)
{
  *a1 = 0xD000000000000011;
  a1[1] = 0x8000000100007560;
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

unint64_t sub_100005ED8()
{
  unint64_t result = qword_10000C010[0];
  if (!qword_10000C010[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_10000C010);
  }
  return result;
}

void *initializeBufferWithCopyOfBuffer for DeepThoughtWorker(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for DeepThoughtWorker()
{
  return swift_bridgeObjectRelease();
}

void *assignWithCopy for DeepThoughtWorker(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 initializeWithTake for DeepThoughtWorker(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

void *assignWithTake for DeepThoughtWorker(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for DeepThoughtWorker(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for DeepThoughtWorker(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for DeepThoughtWorker()
{
  return &type metadata for DeepThoughtWorker;
}

uint64_t sub_100006080()
{
  return *(void *)(swift_getOpaqueTypeConformance2() + 8);
}

unint64_t sub_1000060D4()
{
  unint64_t result = qword_10000C030;
  if (!qword_10000C030)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_10000C030);
  }
  return result;
}

uint64_t sub_100006128(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_10000616C(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_1000061A4(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_1000061EC(unint64_t *a1, unint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_1000061A4(&qword_10000C060);
    sub_10000626C(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10000626C(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100007030();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_1000062B0()
{
  unint64_t result = qword_10000C0A0;
  if (!qword_10000C0A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C0A0);
  }
  return result;
}

uint64_t sub_100006304(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_1000063D8(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_100006A08((uint64_t)v12, *a3);
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
      sub_100006A08((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_1000069B8((uint64_t)v12);
  return v7;
}

uint64_t sub_1000063D8(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_1000071E0();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_100006594(a5, a6);
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
  uint64_t v8 = sub_100007200();
  if (!v8)
  {
    sub_100007210();
    __break(1u);
LABEL_17:
    uint64_t result = sub_100007230();
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

uint64_t sub_100006594(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_10000662C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_10000680C(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_10000680C(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_10000662C(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_1000067A4(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_1000071F0();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_100007210();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_100007190();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_100007230();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_100007210();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_1000067A4(uint64_t a1, uint64_t a2)
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
  sub_100006128(&qword_10000C0B8);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_10000680C(char a1, int64_t a2, char a3, char *a4)
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
    sub_100006128(&qword_10000C0B8);
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
  uint64_t result = sub_100007230();
  __break(1u);
  return result;
}

uint64_t sub_10000695C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100006128(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_1000069B8(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_100006A08(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_100006A68(uint64_t a1, uint64_t a2)
{
  sub_1000072A0();
  sub_100007170();
  Swift::Int v4 = sub_1000072B0();

  return sub_100006B54(a1, a2, v4);
}

uint64_t sub_100006AE0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100006128(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

_OWORD *sub_100006B44(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

unint64_t sub_100006B54(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_100007250() & 1) == 0)
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
      while (!v14 && (sub_100007250() & 1) == 0);
    }
  }
  return v6;
}

uint64_t *sub_100006C38(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

unsigned char *initializeBufferWithCopyOfBuffer for DeepThoughtWorkerError(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for DeepThoughtWorkerError(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for DeepThoughtWorkerError(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 1;
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
        JUMPOUT(0x100006E08);
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
          *uint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

uint64_t sub_100006E30(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_100006E3C(unsigned char *result, char a2)
{
  *uint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for DeepThoughtWorkerError()
{
  return &type metadata for DeepThoughtWorkerError;
}

unint64_t sub_100006E5C()
{
  unint64_t result = qword_10000C0D0;
  if (!qword_10000C0D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C0D0);
  }
  return result;
}

unint64_t sub_100006EB4()
{
  unint64_t result = qword_10000C0D8;
  if (!qword_10000C0D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C0D8);
  }
  return result;
}

unint64_t sub_100006F0C()
{
  unint64_t result = qword_10000C0E0;
  if (!qword_10000C0E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C0E0);
  }
  return result;
}

unint64_t sub_100006F64()
{
  unint64_t result = qword_10000C0E8;
  if (!qword_10000C0E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C0E8);
  }
  return result;
}

uint64_t sub_100006FC0()
{
  return SiriPenetrationRateMetrics.init(bookmarkLocation:)();
}

uint64_t sub_100006FD0()
{
  return static SiriPenetrationRateMetrics.DEFAULT_BOOKMARK_LOCATION.getter();
}

uint64_t sub_100006FE0()
{
  return type metadata accessor for SiriPenetrationRateMetrics();
}

uint64_t sub_100006FF0()
{
  return PluginContext.init(trialId:parameters:attachments:trialNamespace:MLHostContext:)();
}

uint64_t sub_100007000()
{
  return type metadata accessor for PluginContext();
}

uint64_t sub_100007010()
{
  return type metadata accessor for TimedOutError();
}

uint64_t sub_100007020()
{
  return LighthouseRuntimeParams.processTimeoutInMilliseconds.getter();
}

uint64_t sub_100007030()
{
  return type metadata accessor for LighthouseRuntimeParams();
}

uint64_t sub_100007050()
{
  return LighthouseRuntimeProcessor.init(task:plugin:enforceDiagnosticCheck:)();
}

uint64_t sub_100007060()
{
  return type metadata accessor for LighthouseRuntimeProcessorResult();
}

uint64_t sub_100007070()
{
  return static AppExtension.main()();
}

uint64_t sub_100007080()
{
  return MLHostResult.init(error:policy:)();
}

uint64_t sub_100007090()
{
  return MLHostResult.init(status:policy:)();
}

uint64_t sub_1000070A0()
{
  return type metadata accessor for MLHostResult();
}

uint64_t sub_1000070E0()
{
  return MLHostParameters.taskParameters.getter();
}

uint64_t sub_1000070F0()
{
  return MLHostExtensionContext.taskId.getter();
}

uint64_t sub_100007100()
{
  return MLHostExtensionContext.taskName.getter();
}

uint64_t sub_100007110()
{
  return Logger.logObject.getter();
}

uint64_t sub_100007120()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_100007130()
{
  return type metadata accessor for Logger();
}

NSString sub_100007140()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_100007150()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100007160()
{
  return String.init<A>(describing:)();
}

uint64_t sub_100007170()
{
  return String.hash(into:)();
}

void sub_100007180(Swift::String a1)
{
}

Swift::Int sub_100007190()
{
  return String.UTF8View._foreignCount()();
}

NSArray sub_1000071A0()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_1000071B0()
{
  return static os_log_type_t.info.getter();
}

uint64_t sub_1000071C0()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_1000071D0()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_1000071E0()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_1000071F0()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_100007200()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_100007210()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_100007220()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_100007230()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

Swift::Int sub_100007240(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases, string);
}

uint64_t sub_100007250()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_100007260()
{
  return Error._getEmbeddedNSError()();
}

uint64_t sub_100007270()
{
  return Error._code.getter();
}

uint64_t sub_100007280()
{
  return Error._domain.getter();
}

uint64_t sub_100007290()
{
  return Error._userInfo.getter();
}

uint64_t sub_1000072A0()
{
  return Hasher.init(_seed:)();
}

Swift::Int sub_1000072B0()
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