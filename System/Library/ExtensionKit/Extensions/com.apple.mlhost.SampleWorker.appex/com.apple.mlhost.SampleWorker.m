uint64_t sub_100004DC0()
{
  uint64_t v0;

  v0 = sub_10000E050();
  sub_10000D9A8(v0, qword_100014C90);
  sub_10000CAE8(v0, (uint64_t)qword_100014C90);
  return sub_10000E040();
}

uint64_t sub_100004E40(char a1)
{
  if (!a1) {
    return 0x726150776F6C6C61;
  }
  if (a1 == 1) {
    return 0xD000000000000011;
  }
  return 0xD000000000000013;
}

BOOL sub_100004EA4(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

Swift::Int sub_100004EB8()
{
  Swift::UInt v1 = *v0;
  sub_10000E370();
  sub_10000E380(v1);
  return sub_10000E390();
}

void sub_100004F00()
{
  sub_10000E380(*v0);
}

Swift::Int sub_100004F2C()
{
  Swift::UInt v1 = *v0;
  sub_10000E370();
  sub_10000E380(v1);
  return sub_10000E390();
}

uint64_t sub_100004F70()
{
  return sub_100004E40(*v0);
}

uint64_t sub_100004F78@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_10000B620(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_100004FA0()
{
  return 0;
}

void sub_100004FAC(unsigned char *a1@<X8>)
{
  *a1 = 3;
}

uint64_t sub_100004FB8(uint64_t a1)
{
  unint64_t v2 = sub_10000CA94();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100004FF4(uint64_t a1)
{
  unint64_t v2 = sub_10000CA94();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_100005030(void *a1)
{
  uint64_t v3 = sub_10000B990(&qword_1000141A8);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin();
  v6 = &v8[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_10000CA50(a1, a1[3]);
  sub_10000CA94();
  sub_10000E3E0();
  v8[15] = 0;
  sub_10000E2C0();
  if (!v1)
  {
    v8[14] = 1;
    sub_10000E2D0();
    v8[13] = 2;
    sub_10000E2B0();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
}

void sub_1000051D0(void *a1@<X0>, uint64_t a2@<X8>)
{
  double v6 = sub_10000B774(a1);
  if (!v2)
  {
    *(unsigned char *)a2 = v4 & 1;
    *(double *)(a2 + 8) = v6;
    *(unsigned char *)(a2 + 16) = v5;
  }
}

uint64_t sub_100005208(void *a1)
{
  return sub_100005030(a1);
}

com_apple_mlhost_SampleWorker::SampleWorkerError_optional __swiftcall SampleWorkerError.init(rawValue:)(Swift::String rawValue)
{
  object = rawValue._object;
  v6._countAndFlagsBits = rawValue._countAndFlagsBits;
  v2._rawValue = &off_100010950;
  v6._object = object;
  Swift::Int v3 = sub_10000E270(v2, v6);
  swift_bridgeObjectRelease();
  if (v3 == 1) {
    v4.value = com_apple_mlhost_SampleWorker_SampleWorkerError_interrupted;
  }
  else {
    v4.value = com_apple_mlhost_SampleWorker_SampleWorkerError_unknownDefault;
  }
  if (v3) {
    return v4;
  }
  else {
    return 0;
  }
}

uint64_t SampleWorkerError.rawValue.getter(char a1)
{
  if (a1) {
    return 0x7075727265746E69;
  }
  else {
    return 0x656C6C65636E6163;
  }
}

uint64_t sub_1000052C4(char *a1, char *a2)
{
  return sub_100005358(*a1, *a2);
}

uint64_t sub_1000052D0(char a1, char a2)
{
  if (*(void *)&aStart_1[8 * a1] == *(void *)&aStart_1[8 * a2]
    && *(void *)&aFinished_1[8 * a1 + 8] == *(void *)&aFinished_1[8 * a2 + 8])
  {
    char v3 = 1;
  }
  else
  {
    char v3 = sub_10000E2F0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

uint64_t sub_100005358(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    uint64_t v3 = 0x7075727265746E69;
  }
  else {
    uint64_t v3 = 0x656C6C65636E6163;
  }
  if (v2) {
    unint64_t v4 = 0xE900000000000064;
  }
  else {
    unint64_t v4 = 0xEB00000000646574;
  }
  if (a2) {
    uint64_t v5 = 0x7075727265746E69;
  }
  else {
    uint64_t v5 = 0x656C6C65636E6163;
  }
  if (a2) {
    unint64_t v6 = 0xEB00000000646574;
  }
  else {
    unint64_t v6 = 0xE900000000000064;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = sub_10000E2F0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

Swift::Int sub_100005408()
{
  return sub_100005410();
}

Swift::Int sub_100005410()
{
  return sub_10000E390();
}

Swift::Int sub_1000054A0()
{
  return sub_10000E390();
}

uint64_t sub_10000550C()
{
  return sub_100005568();
}

uint64_t sub_100005514()
{
  sub_10000E0C0();

  return swift_bridgeObjectRelease();
}

uint64_t sub_100005568()
{
  sub_10000E0C0();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_1000055E0()
{
  return sub_1000055E8();
}

Swift::Int sub_1000055E8()
{
  return sub_10000E390();
}

Swift::Int sub_100005674()
{
  return sub_10000E390();
}

uint64_t sub_1000056DC@<X0>(uint64_t *a1@<X0>, char *a2@<X8>)
{
  v8._countAndFlagsBits = *a1;
  uint64_t v3 = (void *)a1[1];
  v4._rawValue = &off_100010950;
  v8._object = v3;
  Swift::Int v5 = sub_10000E270(v4, v8);
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

uint64_t sub_10000573C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = SampleWorkerError.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

_UNKNOWN **static SampleWorkerStates.allCases.getter()
{
  return &off_100010A38;
}

uint64_t SampleWorkerStates.rawValue.getter(char a1)
{
  return *(void *)&aStart_1[8 * a1];
}

uint64_t sub_1000057A8(char *a1, char *a2)
{
  return sub_1000052D0(*a1, *a2);
}

Swift::Int sub_1000057B4()
{
  return sub_1000054A0();
}

uint64_t sub_1000057BC()
{
  return sub_100005514();
}

Swift::Int sub_1000057C4()
{
  return sub_100005674();
}

uint64_t sub_1000057CC@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = _s29com_apple_mlhost_SampleWorker0dE6StatesO8rawValueACSgSS_tcfC_0(*(void *)a1, *(void **)(a1 + 8));
  *a2 = result;
  return result;
}

uint64_t sub_1000057FC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = SampleWorkerStates.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

void sub_100005828(void *a1@<X8>)
{
  *a1 = &off_100010A60;
}

uint64_t sub_100005838(uint64_t a1)
{
  v2[27] = a1;
  v2[28] = v1;
  uint64_t v3 = sub_10000E1B0();
  v2[29] = v3;
  v2[30] = *(void *)(v3 - 8);
  v2[31] = swift_task_alloc();
  v2[32] = swift_task_alloc();
  uint64_t v4 = sub_10000E1D0();
  v2[33] = v4;
  v2[34] = *(void *)(v4 - 8);
  v2[35] = swift_task_alloc();
  uint64_t v5 = sub_10000DD10();
  v2[36] = v5;
  v2[37] = *(void *)(v5 - 8);
  v2[38] = swift_task_alloc();
  sub_10000B990(&qword_1000141B8);
  v2[39] = swift_task_alloc();
  uint64_t v6 = sub_10000E000();
  v2[40] = v6;
  v2[41] = *(void *)(v6 - 8);
  v2[42] = swift_task_alloc();
  uint64_t v7 = sub_10000DF80();
  v2[43] = v7;
  v2[44] = *(void *)(v7 - 8);
  v2[45] = swift_task_alloc();
  uint64_t v8 = sub_10000E050();
  v2[46] = v8;
  v2[47] = *(void *)(v8 - 8);
  v2[48] = swift_task_alloc();
  v2[49] = type metadata accessor for SampleWorker();
  v2[50] = swift_task_alloc();
  sub_10000B990(&qword_1000141C0);
  v2[51] = swift_task_alloc();
  uint64_t v9 = sub_10000B990(&qword_1000140B0);
  v2[52] = v9;
  v2[53] = *(void *)(v9 - 8);
  v2[54] = swift_task_alloc();
  v2[55] = swift_task_alloc();
  uint64_t v10 = sub_10000DD60();
  v2[56] = v10;
  v2[57] = *(void *)(v10 - 8);
  v2[58] = swift_task_alloc();
  return _swift_task_switch(sub_100005C5C, 0, 0);
}

uint64_t sub_100005C5C()
{
  uint64_t v2 = *(void *)(v0 + 456);
  uint64_t v1 = *(void *)(v0 + 464);
  uint64_t v3 = *(void *)(v0 + 448);
  sub_10000DD50();
  sub_10000DD40();
  *(void *)(v0 + 472) = v4;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  if (qword_100014240 != -1) {
    swift_once();
  }
  uint64_t v5 = *(void **)(v0 + 216);
  *(void *)(v0 + 480) = sub_10000CAE8(*(void *)(v0 + 368), (uint64_t)qword_100014C90);
  id v6 = v5;
  uint64_t v7 = sub_10000E030();
  os_log_type_t v8 = sub_10000E140();
  BOOL v9 = os_log_type_enabled(v7, v8);
  uint64_t v10 = *(void **)(v0 + 216);
  if (v9)
  {
    v11 = (uint8_t *)swift_slowAlloc();
    uint64_t v12 = (void *)swift_slowAlloc();
    *(_DWORD *)v11 = 138412290;
    *(void *)(v0 + 128) = v10;
    id v13 = v10;
    sub_10000E170();
    *uint64_t v12 = v10;

    _os_log_impl((void *)&_mh_execute_header, v7, v8, "Context: %@", v11, 0xCu);
    sub_10000B990(&qword_100014200);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  uint64_t v14 = *(void *)(v0 + 224);
  uint64_t v15 = *(int *)(*(void *)(v0 + 392) + 20);
  *(_DWORD *)(v0 + 60) = v15;
  *(void *)(v0 + 488) = *(void *)(v14 + v15);
  *(unsigned char *)(v0 + 58) = 0;
  *(void *)(v0 + 496) = sub_10000DE10();
  *(void *)(v0 + 504) = sub_10000DA0C(&qword_1000141C8, (void (*)(uint64_t))&type metadata accessor for LedgerClient);
  uint64_t v17 = sub_10000E110();
  return _swift_task_switch(sub_100005F08, v17, v16);
}

uint64_t sub_100005F08()
{
  v0[64] = sub_10000C904();
  sub_10000DDF0();
  uint64_t v1 = (void *)swift_task_alloc();
  v0[65] = v1;
  uint64_t v2 = sub_10000DA0C(&qword_100014170, (void (*)(uint64_t))type metadata accessor for SampleWorker);
  unint64_t v3 = sub_10000C6D4();
  unint64_t v4 = sub_10000C728();
  *uint64_t v1 = v0;
  v1[1] = sub_100006068;
  uint64_t v5 = v0[51];
  uint64_t v6 = v0[49];
  uint64_t v7 = v0[27];
  return MLHostExtension.loadConfig<A>(context:)(v5, v7, v6, &type metadata for SampleWorkerConfig, v2, v3, v4);
}

uint64_t sub_100006068()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_100006190, 0, 0);
}

uint64_t sub_100006190()
{
  uint64_t v39 = v0;
  uint64_t v1 = *(void *)(v0 + 416);
  uint64_t v2 = *(void *)(v0 + 424);
  uint64_t v3 = *(void *)(v0 + 408);
  sub_10000CB20(*(void *)(v0 + 224), *(void *)(v0 + 400));
  int v4 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v3, 1, v1);
  uint64_t v5 = *(void *)(v0 + 440);
  uint64_t v6 = *(void *)(v0 + 416);
  uint64_t v7 = *(void *)(v0 + 424);
  uint64_t v9 = *(void *)(v0 + 400);
  uint64_t v8 = *(void *)(v0 + 408);
  if (v4 == 1)
  {
    uint64_t v10 = *(void (**)(void, void, void))(v7 + 16);
    v10(*(void *)(v0 + 440), *(void *)(v0 + 400), *(void *)(v0 + 416));
    sub_10000CB84(v9);
    sub_10000CBE0(v8, &qword_1000141C0);
  }
  else
  {
    sub_10000CB84(*(void *)(v0 + 400));
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 32))(v5, v8, v6);
    uint64_t v10 = *(void (**)(void, void, void))(v7 + 16);
  }
  v10(*(void *)(v0 + 432), *(void *)(v0 + 440), *(void *)(v0 + 416));
  v11 = sub_10000E030();
  os_log_type_t v12 = sub_10000E140();
  BOOL v13 = os_log_type_enabled(v11, v12);
  uint64_t v15 = *(void *)(v0 + 424);
  uint64_t v14 = *(void *)(v0 + 432);
  uint64_t v16 = *(void *)(v0 + 416);
  if (v13)
  {
    uint64_t v17 = (uint8_t *)swift_slowAlloc();
    uint64_t v38 = swift_slowAlloc();
    *(_DWORD *)uint64_t v17 = 136315138;
    sub_10000D878(&qword_1000141F8, &qword_1000140B0);
    uint64_t v18 = sub_10000E2E0();
    *(void *)(v0 + 144) = sub_10000A2D4(v18, v19, &v38);
    sub_10000E170();
    swift_bridgeObjectRelease();
    v20 = *(void (**)(uint64_t, uint64_t))(v15 + 8);
    v20(v14, v16);
    _os_log_impl((void *)&_mh_execute_header, v11, v12, "Configuration: %s", v17, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    v20 = *(void (**)(uint64_t, uint64_t))(v15 + 8);
    v20(*(void *)(v0 + 432), *(void *)(v0 + 416));
  }

  *(void *)(v0 + 528) = v20;
  (*(void (**)(void, void, void))(*(void *)(v0 + 376) + 16))(*(void *)(v0 + 384), *(void *)(v0 + 480), *(void *)(v0 + 368));
  v21 = sub_10000E030();
  os_log_type_t v22 = sub_10000E140();
  if (os_log_type_enabled(v21, v22))
  {
    v23 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v23 = 67109120;
    v24 = (uint64_t (*)())[self sharedConnection];
    if (!v24)
    {
      __break(1u);
      return _swift_task_switch(v24, v25, v26);
    }
    v27 = v24;
    unsigned int v28 = [v24 effectiveBoolValueForSetting:MCFeatureDiagnosticsSubmissionAllowed];

    *(_DWORD *)(v0 + 36) = v28 == 1;
    sub_10000E170();
    _os_log_impl((void *)&_mh_execute_header, v21, v22, "D&U enabled: %{BOOL}d", v23, 8u);
    swift_slowDealloc();
  }
  uint64_t v29 = *(int *)(v0 + 60);
  uint64_t v31 = *(void *)(v0 + 376);
  uint64_t v30 = *(void *)(v0 + 384);
  uint64_t v32 = *(void *)(v0 + 368);
  uint64_t v33 = *(void *)(v0 + 224);

  (*(void (**)(uint64_t, uint64_t))(v31 + 8))(v30, v32);
  *(void *)(v0 + 536) = *(void *)(v33 + v29);
  *(unsigned char *)(v0 + 35) = 1;
  uint64_t v34 = sub_10000E110();
  uint64_t v36 = v35;
  v24 = sub_1000065B8;
  uint64_t v25 = v34;
  uint64_t v26 = v36;
  return _swift_task_switch(v24, v25, v26);
}

uint64_t sub_1000065B8()
{
  sub_10000DDF0();
  return _swift_task_switch(sub_100006660, 0, 0);
}

uint64_t sub_100006660()
{
  uint64_t v36 = v0;
  uint64_t v1 = *(void *)(v0 + 344);
  uint64_t v2 = *(void *)(v0 + 352);
  uint64_t v4 = *(void *)(v0 + 328);
  uint64_t v3 = *(void *)(v0 + 336);
  uint64_t v6 = *(void *)(v0 + 312);
  uint64_t v5 = *(void *)(v0 + 320);
  sub_10000DEE0();
  sub_10000DFF0();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v6, 1, v1) == 1)
  {
    sub_10000CBE0(*(void *)(v0 + 312), &qword_1000141B8);
    *(void *)(v0 + 576) = 0;
    if (sub_10000E120())
    {
      uint64_t v7 = *(void **)(v0 + 216);
      swift_bridgeObjectRelease();
      id v8 = v7;
      uint64_t v9 = sub_10000E030();
      os_log_type_t v10 = sub_10000E140();
      BOOL v11 = os_log_type_enabled(v9, v10);
      os_log_type_t v12 = *(void **)(v0 + 216);
      if (v11)
      {
        uint64_t v13 = swift_slowAlloc();
        v35[0] = swift_slowAlloc();
        *(_DWORD *)uint64_t v13 = 136315394;
        uint64_t v14 = sub_10000DFD0();
        *(void *)(v0 + 200) = sub_10000A2D4(v14, v15, v35);
        sub_10000E170();
        swift_bridgeObjectRelease();

        *(_WORD *)(v13 + 12) = 2080;
        uint64_t v16 = sub_10000DFE0();
        *(void *)(v0 + 176) = sub_10000A2D4(v16, v17, v35);
        sub_10000E170();
        swift_bridgeObjectRelease();

        _os_log_impl((void *)&_mh_execute_header, v9, v10, "TaskId: %s, TaskName: %s: asked to stop!", (uint8_t *)v13, 0x16u);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {
      }
      unsigned int v28 = *(void (**)(uint64_t, uint64_t))(v0 + 528);
      uint64_t v29 = *(void *)(v0 + 440);
      uint64_t v30 = *(void *)(v0 + 416);
      v35[3] = (uint64_t)&type metadata for SampleWorkerError;
      v35[4] = sub_10000CC3C();
      LOBYTE(v35[0]) = 0;
      id v31 = objc_allocWithZone((Class)sub_10000DE40());
      uint64_t v34 = sub_10000DE20();
      v28(v29, v30);
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      uint64_t v32 = *(uint64_t (**)(uint64_t))(v0 + 8);
      return v32(v34);
    }
    else
    {
      *(void *)(v0 + 584) = *(void *)(*(void *)(v0 + 224) + *(int *)(v0 + 60));
      *(unsigned char *)(v0 + 33) = 2;
      uint64_t v27 = sub_10000E110();
      return _swift_task_switch(sub_100007094, v27, v26);
    }
  }
  else
  {
    (*(void (**)(void, void, void))(*(void *)(v0 + 352) + 32))(*(void *)(v0 + 360), *(void *)(v0 + 312), *(void *)(v0 + 344));
    sub_10000DDD0();
    uint64_t v18 = sub_10000DF70();
    uint64_t v20 = v19;
    *(void *)(v0 + 544) = v19;
    uint64_t v21 = sub_10000DF60();
    uint64_t v23 = v22;
    *(void *)(v0 + 552) = v22;
    v24 = (void *)swift_task_alloc();
    *(void *)(v0 + 560) = v24;
    void *v24 = v0;
    v24[1] = sub_100006B64;
    uint64_t v25 = *(void *)(v0 + 216);
    return static MLHostAsset.getRemoteAsset(context:assetType:assetSpecifier:)(v25, v18, v20, v21, v23);
  }
}

uint64_t sub_100006B64(uint64_t a1)
{
  *(void *)(*(void *)v1 + 568) = a1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return _swift_task_switch(sub_100006CD4, 0, 0);
}

uint64_t sub_100006CD4()
{
  uint64_t v22 = v0;
  (*(void (**)(void, void))(*(void *)(v0 + 352) + 8))(*(void *)(v0 + 360), *(void *)(v0 + 344));
  *(void *)(v0 + 576) = *(void *)(v0 + 568);
  if (sub_10000E120())
  {
    uint64_t v1 = *(void **)(v0 + 216);
    swift_bridgeObjectRelease();
    id v2 = v1;
    uint64_t v3 = sub_10000E030();
    os_log_type_t v4 = sub_10000E140();
    BOOL v5 = os_log_type_enabled(v3, v4);
    uint64_t v6 = *(void **)(v0 + 216);
    if (v5)
    {
      uint64_t v7 = swift_slowAlloc();
      v21[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v7 = 136315394;
      uint64_t v8 = sub_10000DFD0();
      *(void *)(v0 + 200) = sub_10000A2D4(v8, v9, v21);
      sub_10000E170();
      swift_bridgeObjectRelease();

      *(_WORD *)(v7 + 12) = 2080;
      uint64_t v10 = sub_10000DFE0();
      *(void *)(v0 + 176) = sub_10000A2D4(v10, v11, v21);
      sub_10000E170();
      swift_bridgeObjectRelease();

      _os_log_impl((void *)&_mh_execute_header, v3, v4, "TaskId: %s, TaskName: %s: asked to stop!", (uint8_t *)v7, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
    }
    uint64_t v14 = *(void (**)(uint64_t, uint64_t))(v0 + 528);
    uint64_t v15 = *(void *)(v0 + 440);
    uint64_t v16 = *(void *)(v0 + 416);
    v21[3] = (uint64_t)&type metadata for SampleWorkerError;
    v21[4] = sub_10000CC3C();
    LOBYTE(v21[0]) = 0;
    id v17 = objc_allocWithZone((Class)sub_10000DE40());
    uint64_t v20 = sub_10000DE20();
    swift_release();
    v14(v15, v16);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v18 = *(uint64_t (**)(uint64_t))(v0 + 8);
    return v18(v20);
  }
  else
  {
    *(void *)(v0 + 584) = *(void *)(*(void *)(v0 + 224) + *(int *)(v0 + 60));
    *(unsigned char *)(v0 + 33) = 2;
    uint64_t v13 = sub_10000E110();
    return _swift_task_switch(sub_100007094, v13, v12);
  }
}

uint64_t sub_100007094()
{
  sub_10000DDF0();
  return _swift_task_switch(sub_10000713C, 0, 0);
}

uint64_t sub_10000713C()
{
  uint64_t v39 = v0;
  if (*(void *)(v0 + 576))
  {
    swift_retain_n();
    uint64_t v1 = sub_10000E030();
    os_log_type_t v2 = sub_10000E140();
    if (os_log_type_enabled(v1, v2))
    {
      uint64_t v4 = *(void *)(v0 + 296);
      uint64_t v3 = *(void *)(v0 + 304);
      uint64_t v5 = *(void *)(v0 + 288);
      uint64_t v6 = (uint8_t *)swift_slowAlloc();
      uint64_t v38 = swift_slowAlloc();
      *(_DWORD *)uint64_t v6 = 136315138;
      sub_10000DDC0();
      sub_10000DA0C(&qword_1000141F0, (void (*)(uint64_t))&type metadata accessor for URL);
      uint64_t v7 = sub_10000E2E0();
      unint64_t v9 = v8;
      (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
      *(void *)(v0 + 152) = sub_10000A2D4(v7, v9, &v38);
      sub_10000E170();
      swift_bridgeObjectRelease();
      swift_release_n();
      _os_log_impl((void *)&_mh_execute_header, v1, v2, "autoAsset available: %s", v6, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      swift_release();
    }
    else
    {
      swift_release_n();
    }
  }
  uint64_t v10 = sub_10000DFC0();
  if (v11)
  {
    uint64_t v12 = v10;
    unint64_t v13 = v11;
    uint64_t v14 = (void **)(v0 + 192);
    swift_bridgeObjectRetain_n();
    uint64_t v15 = sub_10000E030();
    os_log_type_t v16 = sub_10000E140();
    if (os_log_type_enabled(v15, v16))
    {
      uint64_t v37 = v12;
      id v17 = (uint8_t *)swift_slowAlloc();
      uint64_t v38 = swift_slowAlloc();
      *(_DWORD *)id v17 = 136315138;
      swift_bridgeObjectRetain();
      *(void *)(v0 + 208) = sub_10000A2D4(v37, v13, &v38);
      uint64_t v14 = (void **)(v0 + 192);
      sub_10000E170();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v15, v16, "taskFolder available: %s", v17, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }

    id v18 = [self defaultManager];
    NSString v19 = sub_10000E0A0();
    swift_bridgeObjectRelease();
    *uint64_t v14 = 0;
    id v20 = [v18 contentsOfDirectoryAtPath:v19 error:v14];

    uint64_t v21 = *v14;
    if (v20)
    {
      sub_10000E0F0();
      id v22 = v21;

      swift_bridgeObjectRetain();
      uint64_t v23 = sub_10000E030();
      os_log_type_t v24 = sub_10000E150();
      if (os_log_type_enabled(v23, v24))
      {
        uint64_t v25 = (uint8_t *)swift_slowAlloc();
        uint64_t v38 = swift_slowAlloc();
        *(_DWORD *)uint64_t v25 = 136315138;
        swift_bridgeObjectRetain();
        uint64_t v26 = sub_10000E100();
        unint64_t v28 = v27;
        swift_bridgeObjectRelease();
        *(void *)(v0 + 136) = sub_10000A2D4(v26, v28, &v38);
        sub_10000E170();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease_n();
        _os_log_impl((void *)&_mh_execute_header, v23, v24, "taskFolder contents: %s", v25, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {
        swift_bridgeObjectRelease_n();
      }
    }
    else
    {
      id v29 = v21;
      sub_10000DD00();

      swift_willThrow();
      swift_errorRelease();
    }
  }
  uint64_t v30 = *(int *)(v0 + 60);
  uint64_t v31 = *(void *)(v0 + 224);
  uint64_t v32 = sub_10000DED0();
  *(void *)(v0 + 592) = *(void *)(v0 + 96);
  sub_10000A92C(v32, 0.5, 2.0);
  *(void *)(v0 + 600) = v33;
  *(void *)(v0 + 608) = *(void *)(v31 + v30);
  *(unsigned char *)(v0 + 34) = 3;
  uint64_t v35 = sub_10000E110();
  return _swift_task_switch(sub_100007740, v35, v34);
}

uint64_t sub_100007740()
{
  sub_10000DDF0();
  return _swift_task_switch(sub_1000077E8, 0, 0);
}

uint64_t sub_1000077E8()
{
  uint64_t v23 = v0;
  if (sub_10000E120())
  {
    *(unsigned char *)(v0 + 59) = 0;
    id v1 = *(id *)(v0 + 216);
    os_log_type_t v2 = sub_10000E030();
    os_log_type_t v3 = sub_10000E140();
    BOOL v4 = os_log_type_enabled(v2, v3);
    uint64_t v5 = *(void **)(v0 + 216);
    if (v4)
    {
      uint64_t v6 = swift_slowAlloc();
      uint64_t v22 = swift_slowAlloc();
      *(_DWORD *)uint64_t v6 = 136315650;
      uint64_t v7 = sub_10000DFD0();
      *(void *)(v0 + 168) = sub_10000A2D4(v7, v8, &v22);
      sub_10000E170();
      swift_bridgeObjectRelease();

      *(_WORD *)(v6 + 12) = 2080;
      uint64_t v9 = sub_10000DFE0();
      *(void *)(v0 + 160) = sub_10000A2D4(v9, v10, &v22);
      sub_10000E170();
      swift_bridgeObjectRelease();

      *(_WORD *)(v6 + 22) = 2048;
      *(void *)(v0 + 184) = 0;
      sub_10000E170();
      _os_log_impl((void *)&_mh_execute_header, v2, v3, "TaskId: %s, TaskName: %s: currentDuration: %f", (uint8_t *)v6, 0x20u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
    }
    *(void *)(v0 + 656) = *(void *)(*(void *)(v0 + 224) + *(int *)(v0 + 60));
    *(unsigned char *)(v0 + 57) = 4;
    uint64_t v20 = sub_10000E110();
    return _swift_task_switch(sub_1000084E0, v20, v19);
  }
  else
  {
    *(void *)(v0 + 616) = 0;
    uint64_t v12 = *(void *)(v0 + 240);
    uint64_t v11 = *(void *)(v0 + 248);
    uint64_t v13 = *(void *)(v0 + 232);
    sub_10000E1C0();
    *(_OWORD *)(v0 + 112) = xmmword_10000E880;
    *(void *)(v0 + 72) = 0;
    *(void *)(v0 + 64) = 0;
    *(unsigned char *)(v0 + 80) = 1;
    uint64_t v14 = sub_10000DA0C(&qword_1000141D0, (void (*)(uint64_t))&type metadata accessor for ContinuousClock);
    sub_10000E310();
    sub_10000DA0C(&qword_1000141D8, (void (*)(uint64_t))&type metadata accessor for ContinuousClock.Instant);
    sub_10000E1E0();
    uint64_t v15 = *(void (**)(uint64_t, uint64_t))(v12 + 8);
    *(void *)(v0 + 624) = v15;
    *(void *)(v0 + 632) = (v12 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
    v15(v11, v13);
    os_log_type_t v16 = (void *)swift_task_alloc();
    *(void *)(v0 + 640) = v16;
    *os_log_type_t v16 = v0;
    v16[1] = sub_100007BF8;
    uint64_t v18 = *(void *)(v0 + 256);
    uint64_t v17 = *(void *)(v0 + 264);
    return dispatch thunk of Clock.sleep(until:tolerance:)(v18, v0 + 64, v17, v14);
  }
}

uint64_t sub_100007BF8()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 648) = v0;
  swift_task_dealloc();
  if (v0)
  {
    (*(void (**)(void, void))(v2 + 624))(*(void *)(v2 + 256), *(void *)(v2 + 232));
    os_log_type_t v3 = sub_1000081DC;
  }
  else
  {
    uint64_t v5 = *(void *)(v2 + 272);
    uint64_t v4 = *(void *)(v2 + 280);
    uint64_t v6 = *(void *)(v2 + 264);
    (*(void (**)(void, void))(v2 + 624))(*(void *)(v2 + 256), *(void *)(v2 + 232));
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
    os_log_type_t v3 = sub_100007D8C;
  }
  return _swift_task_switch(v3, 0, 0);
}

uint64_t sub_100007D8C()
{
  uint64_t v26 = v0;
  double v1 = *(double *)(v0 + 616);
  if (*(double *)(v0 + 592) - *(double *)(v0 + 600) < 0.0) {
    double v2 = 0.0;
  }
  else {
    double v2 = *(double *)(v0 + 592) - *(double *)(v0 + 600);
  }
  double v3 = v1 + 0.25;
  if (v2 <= v1 + 0.25 || (sub_10000E120() & 1) != 0)
  {
    *(unsigned char *)(v0 + 59) = v2 <= v3;
    id v4 = *(id *)(v0 + 216);
    uint64_t v5 = sub_10000E030();
    os_log_type_t v6 = sub_10000E140();
    BOOL v7 = os_log_type_enabled(v5, v6);
    uint64_t v8 = *(void **)(v0 + 216);
    if (v7)
    {
      uint64_t v9 = swift_slowAlloc();
      uint64_t v25 = swift_slowAlloc();
      *(_DWORD *)uint64_t v9 = 136315650;
      uint64_t v10 = sub_10000DFD0();
      *(void *)(v0 + 168) = sub_10000A2D4(v10, v11, &v25);
      sub_10000E170();
      swift_bridgeObjectRelease();

      *(_WORD *)(v9 + 12) = 2080;
      uint64_t v12 = sub_10000DFE0();
      *(void *)(v0 + 160) = sub_10000A2D4(v12, v13, &v25);
      sub_10000E170();
      swift_bridgeObjectRelease();

      *(_WORD *)(v9 + 22) = 2048;
      *(double *)(v0 + 184) = v3;
      sub_10000E170();
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "TaskId: %s, TaskName: %s: currentDuration: %f", (uint8_t *)v9, 0x20u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
    }
    *(void *)(v0 + 656) = *(void *)(*(void *)(v0 + 224) + *(int *)(v0 + 60));
    *(unsigned char *)(v0 + 57) = 4;
    uint64_t v15 = sub_10000E110();
    return _swift_task_switch(sub_1000084E0, v15, v14);
  }
  else
  {
    *(double *)(v0 + 616) = v3;
    uint64_t v17 = *(void *)(v0 + 240);
    uint64_t v16 = *(void *)(v0 + 248);
    uint64_t v18 = *(void *)(v0 + 232);
    sub_10000E1C0();
    *(_OWORD *)(v0 + 112) = xmmword_10000E880;
    *(void *)(v0 + 72) = 0;
    *(void *)(v0 + 64) = 0;
    *(unsigned char *)(v0 + 80) = 1;
    uint64_t v19 = sub_10000DA0C(&qword_1000141D0, (void (*)(uint64_t))&type metadata accessor for ContinuousClock);
    sub_10000E310();
    sub_10000DA0C(&qword_1000141D8, (void (*)(uint64_t))&type metadata accessor for ContinuousClock.Instant);
    sub_10000E1E0();
    uint64_t v20 = *(void (**)(uint64_t, uint64_t))(v17 + 8);
    *(void *)(v0 + 624) = v20;
    *(void *)(v0 + 632) = (v17 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
    v20(v16, v18);
    uint64_t v21 = (void *)swift_task_alloc();
    *(void *)(v0 + 640) = v21;
    void *v21 = v0;
    v21[1] = sub_100007BF8;
    uint64_t v23 = *(void *)(v0 + 256);
    uint64_t v22 = *(void *)(v0 + 264);
    return dispatch thunk of Clock.sleep(until:tolerance:)(v23, v0 + 64, v22, v19);
  }
}

uint64_t sub_1000081DC()
{
  uint64_t v19 = v0;
  (*(void (**)(void, void))(*(void *)(v0 + 272) + 8))(*(void *)(v0 + 280), *(void *)(v0 + 264));
  double v1 = sub_10000E030();
  os_log_type_t v2 = sub_10000E160();
  if (os_log_type_enabled(v1, v2))
  {
    double v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)double v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "Task interrupted while sleeping.", v3, 2u);
    swift_slowDealloc();
  }
  swift_errorRelease();

  uint64_t v4 = *(void *)(v0 + 616);
  *(unsigned char *)(v0 + 59) = 0;
  id v5 = *(id *)(v0 + 216);
  os_log_type_t v6 = sub_10000E030();
  os_log_type_t v7 = sub_10000E140();
  BOOL v8 = os_log_type_enabled(v6, v7);
  uint64_t v9 = *(void **)(v0 + 216);
  if (v8)
  {
    uint64_t v10 = swift_slowAlloc();
    uint64_t v18 = swift_slowAlloc();
    *(_DWORD *)uint64_t v10 = 136315650;
    uint64_t v11 = sub_10000DFD0();
    *(void *)(v0 + 168) = sub_10000A2D4(v11, v12, &v18);
    sub_10000E170();
    swift_bridgeObjectRelease();

    *(_WORD *)(v10 + 12) = 2080;
    uint64_t v13 = sub_10000DFE0();
    *(void *)(v0 + 160) = sub_10000A2D4(v13, v14, &v18);
    sub_10000E170();
    swift_bridgeObjectRelease();

    *(_WORD *)(v10 + 22) = 2048;
    *(void *)(v0 + 184) = v4;
    sub_10000E170();
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "TaskId: %s, TaskName: %s: currentDuration: %f", (uint8_t *)v10, 0x20u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  *(void *)(v0 + 656) = *(void *)(*(void *)(v0 + 224) + *(int *)(v0 + 60));
  *(unsigned char *)(v0 + 57) = 4;
  uint64_t v16 = sub_10000E110();
  return _swift_task_switch(sub_1000084E0, v16, v15);
}

uint64_t sub_1000084E0()
{
  sub_10000DDF0();
  return _swift_task_switch(sub_100008588, 0, 0);
}

uint64_t sub_100008588()
{
  sub_10000DED0();
  int v1 = *(unsigned __int8 *)(v0 + 56);
  if (v1 != 2 && (v1 & 1) != 0)
  {
    uint64_t v7 = dword_1000141E8;
    BOOL v8 = (void *)swift_task_alloc();
    *(void *)(v0 + 664) = v8;
    *BOOL v8 = v0;
    v8[1] = sub_10000886C;
    uint64_t v9 = *(void *)(v0 + 216);
    return ((uint64_t (*)(uint64_t))((char *)&dword_1000141E8 + v7))(v9);
  }
  else
  {
    swift_bridgeObjectRelease();
    sub_10000DED0();
    os_log_type_t v2 = *(void (**)(uint64_t, uint64_t))(v0 + 528);
    uint64_t v3 = *(void *)(v0 + 440);
    uint64_t v4 = *(void *)(v0 + 416);
    if (*(unsigned char *)(v0 + 16) == 1 || *(unsigned char *)(v0 + 59))
    {
      id v5 = objc_allocWithZone((Class)sub_10000DE40());
      uint64_t v6 = sub_10000DE30();
    }
    else
    {
      sub_10000CC3C();
      id v11 = objc_allocWithZone((Class)sub_10000DE40());
      uint64_t v6 = sub_10000DE20();
    }
    uint64_t v13 = v6;
    swift_release();
    v2(v3, v4);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    unint64_t v12 = *(uint64_t (**)(uint64_t))(v0 + 8);
    return v12(v13);
  }
}

uint64_t sub_10000886C()
{
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  return _swift_task_switch(sub_1000089B0, 0, 0);
}

uint64_t sub_1000089B0()
{
  sub_10000DED0();
  uint64_t v1 = *(void (**)(uint64_t, uint64_t))(v0 + 528);
  uint64_t v2 = *(void *)(v0 + 440);
  uint64_t v3 = *(void *)(v0 + 416);
  if (*(unsigned char *)(v0 + 16) == 1 || *(unsigned char *)(v0 + 59))
  {
    id v4 = objc_allocWithZone((Class)sub_10000DE40());
    uint64_t v5 = sub_10000DE30();
  }
  else
  {
    sub_10000CC3C();
    id v6 = objc_allocWithZone((Class)sub_10000DE40());
    uint64_t v5 = sub_10000DE20();
  }
  uint64_t v9 = v5;
  swift_release();
  v1(v2, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v7 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v7(v9);
}

unint64_t CustomEventAnalytics.generateCoreAnalyticsDictionary(context:)(uint64_t a1)
{
  uint64_t v82 = a1;
  sub_10000B990(&qword_100014040);
  ((void (*)(void))__chkstk_darwin)();
  v83 = (char *)&v76 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_10000E020();
  uint64_t v87 = *(void *)(v3 - 8);
  uint64_t v88 = v3;
  ((void (*)(void))__chkstk_darwin)();
  v80 = (char *)&v76 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_10000DEB0();
  uint64_t v85 = *(void *)(v5 - 8);
  uint64_t v86 = v5;
  ((void (*)(void))__chkstk_darwin)();
  v84 = (char *)&v76 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000B990(&qword_100014048);
  ((void (*)(void))__chkstk_darwin)();
  v81 = (char *)&v76 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_10000DDA0();
  uint64_t v89 = *(void *)(v8 - 8);
  uint64_t v90 = v8;
  ((void (*)(void))__chkstk_darwin)();
  v79 = (char *)&v76 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000B990(&qword_100014050);
  uint64_t v10 = ((uint64_t (*)(void))__chkstk_darwin)();
  unint64_t v12 = (char *)&v76 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  uint64_t v14 = (char *)&v76 - v13;
  uint64_t v15 = sub_10000DD30();
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = __chkstk_darwin(v15);
  v77 = (char *)&v76 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v17);
  uint64_t v20 = (char *)&v76 - v19;
  unint64_t v21 = sub_100009BCC((uint64_t)&_swiftEmptyArrayStorage);
  sub_10000DF50();
  sub_10000DA0C(&qword_100014058, (void (*)(uint64_t))&type metadata accessor for CustomEventAnalytics);
  uint64_t v91 = v1;
  sub_10000DFA0();
  uint64_t v22 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v16 + 48);
  int v23 = v22(v14, 1, v15);
  uint64_t v78 = v16;
  if (v23 == 1)
  {
    sub_10000CBE0((uint64_t)v14, &qword_100014050);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v16 + 32))(v20, v14, v15);
    sub_100009CE8();
    uint64_t v76 = v15;
    NSString v24 = sub_10000E0A0();
    swift_bridgeObjectRelease();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    unint64_t v92 = v21;
    sub_10000B2FC((uint64_t)v24, 0xD000000000000013, 0x800000010000EE30, isUniquelyReferenced_nonNull_native);
    unint64_t v21 = v92;
    swift_bridgeObjectRelease();
    uint64_t v15 = v76;
    (*(void (**)(char *, uint64_t))(v16 + 8))(v20, v76);
  }
  uint64_t v26 = v87;
  uint64_t v27 = (uint64_t)v83;
  sub_10000DF90();
  if (v22(v12, 1, v15) == 1)
  {
    sub_10000CBE0((uint64_t)v12, &qword_100014050);
  }
  else
  {
    id v29 = v77;
    uint64_t v28 = v78;
    (*(void (**)(char *, char *, uint64_t))(v78 + 32))(v77, v12, v15);
    sub_100009CE8();
    NSString v30 = sub_10000E0A0();
    swift_bridgeObjectRelease();
    char v31 = swift_isUniquelyReferenced_nonNull_native();
    unint64_t v92 = v21;
    sub_10000B2FC((uint64_t)v30, 0xD000000000000012, 0x800000010000EDF0, v31);
    unint64_t v32 = v92;
    swift_bridgeObjectRelease();
    sub_10000DD20();
    sub_10000E130();
    NSString v33 = sub_10000E0A0();
    swift_bridgeObjectRelease();
    char v34 = swift_isUniquelyReferenced_nonNull_native();
    unint64_t v92 = v32;
    sub_10000B2FC((uint64_t)v33, 0xD000000000000014, 0x800000010000EE10, v34);
    unint64_t v21 = v92;
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v28 + 8))(v29, v15);
  }
  uint64_t v35 = (uint64_t)v84;
  uint64_t v36 = (uint64_t)v81;
  sub_10000DFE0();
  NSString v37 = sub_10000E0A0();
  swift_bridgeObjectRelease();
  char v38 = swift_isUniquelyReferenced_nonNull_native();
  unint64_t v92 = v21;
  sub_10000B2FC((uint64_t)v37, 0x656D614E6B736174, 0xE800000000000000, v38);
  unint64_t v39 = v92;
  swift_bridgeObjectRelease();
  sub_10000DF30();
  uint64_t v41 = v89;
  uint64_t v40 = v90;
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v89 + 48))(v36, 1, v90) == 1)
  {
    sub_10000CBE0(v36, &qword_100014048);
  }
  else
  {
    v42 = v79;
    (*(void (**)(char *, uint64_t, uint64_t))(v41 + 32))(v79, v36, v40);
    sub_10000DD90();
    NSString v43 = sub_10000E0A0();
    swift_bridgeObjectRelease();
    char v44 = swift_isUniquelyReferenced_nonNull_native();
    unint64_t v92 = v39;
    sub_10000B2FC((uint64_t)v43, 0x746174536B736174, 0xE900000000000065, v44);
    unint64_t v39 = v92;
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v41 + 8))(v42, v40);
  }
  uint64_t v45 = v88;
  uint64_t v46 = sub_10000DF20();
  if (*(void *)(v46 + 16) && (unint64_t v47 = sub_10000ACD0(1684107116, 0xE400000000000000), (v48 & 1) != 0)) {
    uint64_t v49 = *(void *)(*(void *)(v46 + 56) + 8 * v47);
  }
  else {
    uint64_t v49 = 0;
  }
  swift_bridgeObjectRelease();
  id v50 = [objc_allocWithZone((Class)NSNumber) initWithInteger:v49];
  char v51 = swift_isUniquelyReferenced_nonNull_native();
  unint64_t v92 = v39;
  sub_10000B2FC((uint64_t)v50, 0x616F4C746E756F63, 0xE900000000000064, v51);
  unint64_t v52 = v92;
  swift_bridgeObjectRelease();
  uint64_t v53 = sub_10000DF20();
  if (*(void *)(v53 + 16) && (unint64_t v54 = sub_10000ACD0(0x737365636F7270, 0xE700000000000000), (v55 & 1) != 0)) {
    uint64_t v56 = *(void *)(*(void *)(v53 + 56) + 8 * v54);
  }
  else {
    uint64_t v56 = 0;
  }
  swift_bridgeObjectRelease();
  id v57 = [objc_allocWithZone((Class)NSNumber) initWithInteger:v56];
  char v58 = swift_isUniquelyReferenced_nonNull_native();
  unint64_t v92 = v52;
  sub_10000B2FC((uint64_t)v57, 0x6F7250746E756F63, 0xEC00000073736563, v58);
  unint64_t v59 = v92;
  swift_bridgeObjectRelease();
  uint64_t v60 = sub_10000DF20();
  if (*(void *)(v60 + 16) && (unint64_t v61 = sub_10000ACD0(0x64656873696E6966, 0xE800000000000000), (v62 & 1) != 0)) {
    uint64_t v63 = *(void *)(*(void *)(v60 + 56) + 8 * v61);
  }
  else {
    uint64_t v63 = 0;
  }
  swift_bridgeObjectRelease();
  id v64 = [objc_allocWithZone((Class)NSNumber) initWithInteger:v63];
  char v65 = swift_isUniquelyReferenced_nonNull_native();
  unint64_t v92 = v59;
  sub_10000B2FC((uint64_t)v64, 0x6E6946746E756F63, 0xED00006465687369, v65);
  unint64_t v66 = v92;
  swift_bridgeObjectRelease();
  sub_10000DEA0();
  uint64_t v67 = sub_10000DF40();
  if (*(void *)(v67 + 16) && (unint64_t v68 = sub_10000AC38(v35), (v69 & 1) != 0))
  {
    (*(void (**)(uint64_t, unint64_t, uint64_t))(v26 + 16))(v27, *(void *)(v67 + 56) + *(void *)(v26 + 72) * v68, v45);
    uint64_t v70 = 0;
  }
  else
  {
    uint64_t v70 = 1;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v26 + 56))(v27, v70, 1, v45);
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v26 + 48))(v27, 1, v45) == 1)
  {
    (*(void (**)(uint64_t, uint64_t))(v85 + 8))(v35, v86);
    sub_10000CBE0(v27, &qword_100014040);
  }
  else
  {
    v71 = v80;
    (*(void (**)(char *, uint64_t, uint64_t))(v26 + 32))(v80, v27, v45);
    sub_10000E010();
    id v73 = [objc_allocWithZone((Class)NSNumber) initWithDouble:v72];
    char v74 = swift_isUniquelyReferenced_nonNull_native();
    unint64_t v92 = v66;
    sub_10000B2FC((uint64_t)v73, 0xD000000000000011, 0x800000010000EDD0, v74);
    unint64_t v66 = v92;
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v26 + 8))(v71, v45);
    (*(void (**)(uint64_t, uint64_t))(v85 + 8))(v35, v86);
  }
  return v66;
}

uint64_t sub_1000096B0()
{
  return _swift_task_switch(sub_1000096CC, 0, 0);
}

uint64_t sub_1000096CC()
{
  objc_allocWithZone((Class)sub_10000DE40());
  uint64_t v1 = sub_10000DE30();
  uint64_t v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v2(v1);
}

uint64_t sub_100009740(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_1000097D4;
  return sub_100005838(a1);
}

uint64_t sub_1000097D4(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

uint64_t sub_1000098D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v15 = (void *)swift_task_alloc();
  *(void *)(v7 + 16) = v15;
  *uint64_t v15 = v7;
  v15[1] = sub_1000099B4;
  return MLHostExtension.loadConfig<A>(context:)(a1, a2, a6, a3, a7, a4, a5);
}

uint64_t sub_1000099B4()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_100009AA8(uint64_t a1)
{
  uint64_t v2 = sub_10000DA0C(&qword_100014170, (void (*)(uint64_t))type metadata accessor for SampleWorker);

  return MLHostExtension.configuration.getter(a1, v2);
}

uint64_t sub_100009B24@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  sub_10000C6D4();
  sub_10000C728();
  sub_10000DEC0();
  uint64_t v4 = *(int *)(a1 + 20);
  sub_10000DE10();
  *(void *)(a2 + v4) = sub_10000DE00();
  uint64_t v5 = *(int *)(a1 + 24);
  sub_10000C904();
  uint64_t result = sub_10000DFB0();
  *(void *)(a2 + v5) = result;
  return result;
}

unint64_t sub_100009BCC(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_10000B990(&qword_100014238);
  uint64_t v2 = (void *)sub_10000E240();
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
    unint64_t result = sub_10000ACD0(v5, v6);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v2[6] + 16 * result);
    uint64_t *v11 = v5;
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

uint64_t sub_100009CE8()
{
  uint64_t result = sub_10000DD20();
  if ((~*(void *)&v1 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_6;
  }
  if (v1 <= -9.22337204e18)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  if (v1 < 9.22337204e18)
  {
    id v2 = [objc_allocWithZone((Class)NSNumber) initWithLongLong:(uint64_t)v1];
    id v3 = [v2 stringValue];

    uint64_t v4 = sub_10000E0B0();
    return v4;
  }
LABEL_7:
  __break(1u);
  return result;
}

unint64_t sub_100009DB0(char a1, char a2, double a3)
{
  uint64_t v6 = sub_10000E3C0();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = &type metadata for SampleWorkerConfig;
  LOBYTE(v16) = a1;
  unint64_t v17 = *(void *)&a3;
  char v18 = a2;
  sub_10000E3A0();
  sub_10000E3B0();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  char v10 = sub_100009F78();
  swift_release();
  unint64_t v16 = 0xD000000000000013;
  unint64_t v17 = 0x800000010000EE50;
  uint64_t v15 = v10;
  sub_10000B990(&qword_100014180);
  sub_10000D878(&qword_100014188, &qword_100014180);
  uint64_t v11 = sub_10000E080();
  BOOL v13 = v12;
  swift_bridgeObjectRelease();
  v20._countAndFlagsBits = v11;
  v20._object = v13;
  sub_10000E0D0(v20);
  swift_bridgeObjectRelease();
  v21._countAndFlagsBits = 41;
  v21._object = (void *)0xE100000000000000;
  sub_10000E0D0(v21);
  return v16;
}

char *sub_100009F78()
{
  swift_retain();
  sub_10000E1F0();
  swift_release();
  sub_10000E260();
  if (*((void *)&v9 + 1))
  {
    uint64_t v0 = (char *)&_swiftEmptyArrayStorage;
    do
    {
      v6[0] = v7;
      v6[1] = v8;
      v6[2] = v9;
      v1._object = (void *)*((void *)&v7 + 1);
      if (*((void *)&v7 + 1))
      {
        v1._countAndFlagsBits = *(void *)&v6[0];
        sub_10000E0D0(v1);
        v10._countAndFlagsBits = 8250;
        v10._object = (void *)0xE200000000000000;
        sub_10000E0D0(v10);
        sub_10000E200();
        sub_10000CBE0((uint64_t)v6, &qword_100014190);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v0 = sub_10000A1C4(0, *((void *)v0 + 2) + 1, 1, v0);
        }
        unint64_t v3 = *((void *)v0 + 2);
        unint64_t v2 = *((void *)v0 + 3);
        if (v3 >= v2 >> 1) {
          uint64_t v0 = sub_10000A1C4((char *)(v2 > 1), v3 + 1, 1, v0);
        }
        *((void *)v0 + 2) = v3 + 1;
        uint64_t v4 = &v0[16 * v3];
        *((void *)v4 + 4) = 0;
        *((void *)v4 + 5) = 0xE000000000000000;
      }
      else
      {
        sub_10000CBE0((uint64_t)v6, &qword_100014190);
      }
      sub_10000E260();
    }
    while (*((void *)&v9 + 1));
  }
  else
  {
    uint64_t v0 = (char *)&_swiftEmptyArrayStorage;
  }
  swift_release();
  return v0;
}

unint64_t sub_10000A124()
{
  return sub_100009DB0(*(unsigned char *)v0, *(unsigned char *)(v0 + 16), *(double *)(v0 + 8));
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

char *sub_10000A1C4(char *result, int64_t a2, char a3, char *a4)
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
      sub_10000B990(&qword_100014198);
      Swift::String v10 = (char *)swift_allocObject();
      int64_t v11 = j__malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * (v12 >> 4);
      BOOL v13 = v10 + 32;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      Swift::String v10 = (char *)&_swiftEmptyArrayStorage;
      BOOL v13 = (char *)&_swiftEmptyArrayStorage + 32;
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[16 * v8 + 32]) {
          memmove(v13, a4 + 32, 16 * v8);
        }
        *((void *)a4 + 2) = 0;
        goto LABEL_24;
      }
    }
    sub_10000C958(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_10000A2D4(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_10000A3A8(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_10000D90C((uint64_t)v12, *a3);
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
      sub_10000D90C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_10000D8BC((uint64_t)v12);
  return v7;
}

uint64_t sub_10000A3A8(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_10000E180();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_10000A564(a5, a6);
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
  uint64_t v8 = sub_10000E1A0();
  if (!v8)
  {
    sub_10000E210();
    __break(1u);
LABEL_17:
    uint64_t result = sub_10000E250();
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

uint64_t sub_10000A564(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_10000A5FC(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_10000A7DC(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_10000A7DC(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_10000A5FC(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_10000A774(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_10000E190();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_10000E210();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_10000E0E0();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_10000E250();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_10000E210();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_10000A774(uint64_t a1, uint64_t a2)
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
  sub_10000B990(&qword_100014208);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_10000A7DC(char a1, int64_t a2, char a3, char *a4)
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
    sub_10000B990(&qword_100014208);
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
  uint64_t result = sub_10000E250();
  __break(1u);
  return result;
}

uint64_t sub_10000A92C(uint64_t result, double a2, double a3)
{
  if (a2 == a3)
  {
    __break(1u);
    goto LABEL_7;
  }
  double v5 = a3 - a2;
  if ((~COERCE__INT64(a3 - a2) & 0x7FF0000000000000) == 0)
  {
LABEL_7:
    __break(1u);
    return result;
  }
  uint64_t v6 = result;
  uint64_t result = swift_stdlib_random();
  if (v5 * ((double)0 * 1.11022302e-16) + a2 == a3) {
    return sub_10000A92C(v6, a2, a3);
  }
  return result;
}

uint64_t sub_10000A9D8(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_10000A9F8(a1, a2, a3, (void *)*v3);
  *unint64_t v3 = result;
  return result;
}

uint64_t sub_10000A9F8(char a1, int64_t a2, char a3, void *a4)
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
  sub_10000B990(&qword_100014220);
  uint64_t v10 = *(void *)(sub_10000DDA0() - 8);
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
  uint64_t v16 = *(void *)(sub_10000DDA0() - 8);
  unint64_t v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  char v18 = (char *)v13 + v17;
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
  Swift::String v21 = &v18[v20];
  unint64_t v22 = (unint64_t)&v19[v20];
  if (v19 >= v21 || (unint64_t)v18 >= v22)
  {
    swift_arrayInitWithCopy();
LABEL_32:
    swift_release();
    return (uint64_t)v13;
  }
LABEL_36:
  uint64_t result = sub_10000E250();
  __break(1u);
  return result;
}

unint64_t sub_10000AC38(uint64_t a1)
{
  sub_10000DEB0();
  sub_10000DA0C(&qword_100014228, (void (*)(uint64_t))&type metadata accessor for LedgerTransition);
  uint64_t v2 = sub_10000E070();

  return sub_10000AD48(a1, v2);
}

unint64_t sub_10000ACD0(uint64_t a1, uint64_t a2)
{
  sub_10000E370();
  sub_10000E0C0();
  Swift::Int v4 = sub_10000E390();

  return sub_10000AF08(a1, a2, v4);
}

unint64_t sub_10000AD48(uint64_t a1, uint64_t a2)
{
  uint64_t v19 = a1;
  uint64_t v4 = sub_10000DEB0();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin();
  int64_t v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = v2;
  uint64_t v8 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v9 = a2 & ~v8;
  uint64_t v18 = v2 + 64;
  if ((*(void *)(v2 + 64 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9))
  {
    uint64_t v10 = ~v8;
    BOOL v13 = *(void (**)(char *, unint64_t, uint64_t))(v5 + 16);
    uint64_t v12 = v5 + 16;
    uint64_t v11 = v13;
    uint64_t v14 = *(void *)(v12 + 56);
    do
    {
      v11(v7, *(void *)(v20 + 48) + v14 * v9, v4);
      sub_10000DA0C(&qword_100014230, (void (*)(uint64_t))&type metadata accessor for LedgerTransition);
      char v15 = sub_10000E090();
      (*(void (**)(char *, uint64_t))(v12 - 8))(v7, v4);
      if (v15) {
        break;
      }
      unint64_t v9 = (v9 + 1) & v10;
    }
    while (((*(void *)(v18 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9) & 1) != 0);
  }
  return v9;
}

unint64_t sub_10000AF08(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_10000E2F0() & 1) == 0)
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
      while (!v14 && (sub_10000E2F0() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_10000AFEC(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_10000B990(&qword_100014238);
  char v38 = a2;
  uint64_t v6 = sub_10000E230();
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
    unint64_t v22 = (void *)(v5 + 64);
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
    id v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v20);
    uint64_t v31 = *v29;
    uint64_t v30 = v29[1];
    unint64_t v32 = *(void **)(*(void *)(v5 + 56) + 8 * v20);
    if ((v38 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      id v33 = v32;
    }
    sub_10000E370();
    sub_10000E0C0();
    uint64_t result = sub_10000E390();
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
    uint64_t v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
    *uint64_t v18 = v31;
    v18[1] = v30;
    *(void *)(*(void *)(v7 + 56) + 8 * v17) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v35;
  unint64_t v22 = (void *)(v5 + 64);
  if ((v38 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v34 = 1 << *(unsigned char *)(v5 + 32);
  if (v34 >= 64) {
    bzero(v22, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *unint64_t v22 = -1 << v34;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

void sub_10000B2FC(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = *v4;
  unint64_t v12 = sub_10000ACD0(a2, a3);
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
    sub_10000B46C();
LABEL_7:
    uint64_t v18 = (void *)*v5;
    if (v16)
    {
LABEL_8:
      uint64_t v19 = v18[7];

      *(void *)(v19 + 8 * v12) = a1;
      return;
    }
    goto LABEL_11;
  }
  sub_10000AFEC(v15, a4 & 1);
  unint64_t v20 = sub_10000ACD0(a2, a3);
  if ((v16 & 1) != (v21 & 1))
  {
LABEL_17:
    sub_10000E300();
    __break(1u);
    return;
  }
  unint64_t v12 = v20;
  uint64_t v18 = (void *)*v5;
  if (v16) {
    goto LABEL_8;
  }
LABEL_11:
  v18[(v12 >> 6) + 8] |= 1 << v12;
  unint64_t v22 = (uint64_t *)(v18[6] + 16 * v12);
  *unint64_t v22 = a2;
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

id sub_10000B46C()
{
  Swift::String v1 = v0;
  sub_10000B990(&qword_100014238);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_10000E220();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (id)swift_release();
    *Swift::String v1 = v4;
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
    void *v21 = *v17;
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

uint64_t sub_10000B620(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x726150776F6C6C61 && a2 == 0xEC0000006C616974;
  if (v3 || (sub_10000E2F0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x800000010000F110 || (sub_10000E2F0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000013 && a2 == 0x800000010000F130)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v6 = sub_10000E2F0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

double sub_10000B774(void *a1)
{
  uint64_t v2 = sub_10000B990(&qword_1000141A0);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  uint64_t v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000CA50(a1, a1[3]);
  sub_10000CA94();
  sub_10000E3D0();
  char v12 = 0;
  sub_10000E290();
  char v11 = 1;
  sub_10000E2A0();
  double v8 = v7;
  char v10 = 2;
  sub_10000E280();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  sub_10000D8BC((uint64_t)a1);
  return v8;
}

uint64_t _s29com_apple_mlhost_SampleWorker0dE6StatesO8rawValueACSgSS_tcfC_0(uint64_t a1, void *a2)
{
  v6._countAndFlagsBits = a1;
  v3._rawValue = &off_1000109A0;
  v6._object = a2;
  unint64_t v4 = sub_10000E270(v3, v6);
  swift_bridgeObjectRelease();
  if (v4 >= 5) {
    return 5;
  }
  else {
    return v4;
  }
}

uint64_t sub_10000B990(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t type metadata accessor for SampleWorker()
{
  uint64_t result = qword_100014750;
  if (!qword_100014750) {
    return swift_getSingletonMetadata();
  }
  return result;
}

unint64_t sub_10000BA24()
{
  unint64_t result = qword_100014068;
  if (!qword_100014068)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100014068);
  }
  return result;
}

unint64_t sub_10000BA7C()
{
  unint64_t result = qword_100014070;
  if (!qword_100014070)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100014070);
  }
  return result;
}

unint64_t sub_10000BAD4()
{
  unint64_t result = qword_100014078;
  if (!qword_100014078)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100014078);
  }
  return result;
}

unint64_t sub_10000BB2C()
{
  unint64_t result = qword_100014080;
  if (!qword_100014080)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100014080);
  }
  return result;
}

unint64_t sub_10000BB84()
{
  unint64_t result = qword_100014088;
  if (!qword_100014088)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100014088);
  }
  return result;
}

unint64_t sub_10000BBDC()
{
  unint64_t result = qword_100014090;
  if (!qword_100014090)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100014090);
  }
  return result;
}

unint64_t sub_10000BC34()
{
  unint64_t result = qword_100014098;
  if (!qword_100014098)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100014098);
  }
  return result;
}

uint64_t sub_10000BC88()
{
  return sub_10000D878(&qword_1000140A0, &qword_1000140A8);
}

uint64_t sub_10000BCC4(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

unsigned char *initializeBufferWithCopyOfBuffer for SampleWorkerError(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for SampleWorkerError(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for SampleWorkerError(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x10000BE78);
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

uint64_t sub_10000BEA0(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_10000BEAC(unsigned char *result, char a2)
{
  *uint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for SampleWorkerError()
{
  return &type metadata for SampleWorkerError;
}

uint64_t getEnumTagSinglePayload for SampleWorkerStates(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for SampleWorkerStates(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x10000C024);
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

ValueMetadata *type metadata accessor for SampleWorkerStates()
{
  return &type metadata for SampleWorkerStates;
}

uint64_t *sub_10000C05C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  unsigned int v4 = a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v9 = *a2;
    *a1 = *a2;
    unsigned int v4 = (uint64_t *)(v9 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    uint64_t v7 = sub_10000B990(&qword_1000140B0);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(v4, a2, v7);
    uint64_t v8 = *(int *)(a3 + 24);
    *(uint64_t *)((char *)v4 + *(int *)(a3 + 20)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 20));
    *(uint64_t *)((char *)v4 + v8) = *(uint64_t *)((char *)a2 + v8);
    swift_retain();
  }
  swift_retain();
  return v4;
}

uint64_t sub_10000C13C(uint64_t a1)
{
  uint64_t v2 = sub_10000B990(&qword_1000140B0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  swift_release();

  return swift_release();
}

uint64_t sub_10000C1C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_10000B990(&qword_1000140B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 24);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  *(void *)(a1 + v7) = *(void *)(a2 + v7);
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t sub_10000C254(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_10000B990(&qword_1000140B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  swift_retain();
  swift_release();
  *(void *)(a1 + *(int *)(a3 + 24)) = *(void *)(a2 + *(int *)(a3 + 24));
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_10000C300(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_10000B990(&qword_1000140B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 24);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  *(void *)(a1 + v7) = *(void *)(a2 + v7);
  return a1;
}

uint64_t sub_10000C388(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_10000B990(&qword_1000140B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  swift_release();
  *(void *)(a1 + *(int *)(a3 + 24)) = *(void *)(a2 + *(int *)(a3 + 24));
  swift_release();
  return a1;
}

uint64_t sub_10000C424(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10000C438);
}

uint64_t sub_10000C438(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_10000B990(&qword_1000140B0);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20));
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
}

uint64_t sub_10000C4FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10000C510);
}

uint64_t sub_10000C510(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_10000B990(&qword_1000140B0);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20)) = (a2 - 1);
  }
  return result;
}

void sub_10000C5D0()
{
  sub_10000C66C();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_10000C66C()
{
  if (!qword_100014110)
  {
    sub_10000C6D4();
    sub_10000C728();
    unint64_t v0 = sub_10000DEF0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_100014110);
    }
  }
}

unint64_t sub_10000C6D4()
{
  unint64_t result = qword_100014118;
  if (!qword_100014118)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100014118);
  }
  return result;
}

unint64_t sub_10000C728()
{
  unint64_t result = qword_100014120;
  if (!qword_100014120)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100014120);
  }
  return result;
}

__n128 initializeBufferWithCopyOfBuffer for SampleWorkerConfig(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for SampleWorkerConfig(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && a1[17]) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *a1;
  BOOL v4 = v3 >= 2;
  int v5 = (v3 + 2147483646) & 0x7FFFFFFF;
  if (!v4) {
    int v5 = -1;
  }
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for SampleWorkerConfig(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 255;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2) {
      *(unsigned char *)__n128 result = a2 + 1;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SampleWorkerConfig()
{
  return &type metadata for SampleWorkerConfig;
}

uint64_t sub_10000C838()
{
  return sub_10000DA0C(&qword_100014060, (void (*)(uint64_t))type metadata accessor for SampleWorker);
}

uint64_t sub_10000C880()
{
  return *(void *)(swift_getOpaqueTypeConformance2() + 8);
}

unint64_t sub_10000C904()
{
  unint64_t result = qword_100014178;
  if (!qword_100014178)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100014178);
  }
  return result;
}

uint64_t sub_10000C958(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 16 * a1 + 32;
    unint64_t v6 = a3 + 16 * v4;
    if (v5 >= v6 || v5 + 16 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_10000E250();
  __break(1u);
  return result;
}

void *sub_10000CA50(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_10000CA94()
{
  unint64_t result = qword_1000149E0[0];
  if (!qword_1000149E0[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_1000149E0);
  }
  return result;
}

uint64_t sub_10000CAE8(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_10000CB20(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SampleWorker();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000CB84(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for SampleWorker();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10000CBE0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_10000B990(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_10000CC3C()
{
  unint64_t result = qword_1000141E0;
  if (!qword_1000141E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000141E0);
  }
  return result;
}

uint64_t sub_10000CC90(uint64_t a1)
{
  v2[5] = a1;
  v2[6] = v1;
  uint64_t v3 = sub_10000DF50();
  v2[7] = v3;
  v2[8] = *(void *)(v3 - 8);
  v2[9] = swift_task_alloc();
  v2[10] = swift_task_alloc();
  v2[11] = swift_task_alloc();
  uint64_t v4 = sub_10000DD30();
  v2[12] = v4;
  v2[13] = *(void *)(v4 - 8);
  v2[14] = swift_task_alloc();
  uint64_t v5 = sub_10000DE90();
  v2[15] = v5;
  v2[16] = *(void *)(v5 - 8);
  v2[17] = swift_task_alloc();
  uint64_t v6 = sub_10000DDA0();
  v2[18] = v6;
  v2[19] = *(void *)(v6 - 8);
  v2[20] = swift_task_alloc();
  sub_10000B990(&qword_100014050);
  v2[21] = swift_task_alloc();
  v2[22] = swift_task_alloc();
  return _swift_task_switch(sub_10000CEC0, 0, 0);
}

uint64_t sub_10000CEC0()
{
  uint64_t v1 = v0[21];
  uint64_t v2 = v0[22];
  uint64_t v3 = v0[12];
  uint64_t v4 = v0[13];
  uint64_t v5 = v0[6];
  v0[23] = *(void *)(v5 + *(int *)(type metadata accessor for SampleWorker() + 20));
  uint64_t v6 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v4 + 56);
  v6(v2, 1, 1, v3);
  v6(v1, 1, 1, v3);
  v0[24] = sub_10000DFE0();
  v0[25] = v7;
  sub_10000DE10();
  sub_10000DA0C(&qword_1000141C8, (void (*)(uint64_t))&type metadata accessor for LedgerClient);
  uint64_t v9 = sub_10000E110();
  return _swift_task_switch(sub_10000CFF4, v9, v8);
}

uint64_t sub_10000CFF4()
{
  uint64_t v1 = v0[22];
  uint64_t v2 = v0[21];
  v0[26] = sub_10000DDE0();
  swift_bridgeObjectRelease();
  sub_10000CBE0(v2, &qword_100014050);
  sub_10000CBE0(v1, &qword_100014050);
  return _swift_task_switch(sub_10000D0A4, 0, 0);
}

uint64_t sub_10000D0A4()
{
  uint64_t v63 = v0;
  uint64_t v1 = v0[26];
  int64_t v2 = *(void *)(v1 + 16);
  if (v2)
  {
    uint64_t v3 = v0[19];
    uint64_t v4 = v0[16];
    char v62 = &_swiftEmptyArrayStorage;
    sub_10000A9D8(0, v2, 0);
    uint64_t v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16);
    uint64_t v5 = v4 + 16;
    uint64_t v7 = v1 + ((*(unsigned __int8 *)(v5 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 64));
    uint64_t v56 = *(void *)(v5 + 56);
    char v58 = v6;
    uint64_t v60 = v3;
    uint64_t v8 = &_swiftEmptyArrayStorage;
    do
    {
      uint64_t v9 = v0[17];
      uint64_t v10 = v0[15];
      v58(v9, v7, v10);
      sub_10000DE80();
      sub_10000DE70();
      sub_10000DD80();
      (*(void (**)(uint64_t, uint64_t))(v5 - 8))(v9, v10);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_10000A9D8(0, v8[2] + 1, 1);
        uint64_t v8 = v62;
      }
      unint64_t v12 = v8[2];
      unint64_t v11 = v8[3];
      unint64_t v0 = v61;
      if (v12 >= v11 >> 1)
      {
        sub_10000A9D8(v11 > 1, v12 + 1, 1);
        uint64_t v8 = v62;
      }
      uint64_t v13 = v61[20];
      uint64_t v14 = v61[18];
      v8[2] = v12 + 1;
      (*(void (**)(unint64_t, uint64_t, uint64_t))(v60 + 32))((unint64_t)v8+ ((*(unsigned __int8 *)(v60 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v60 + 80))+ *(void *)(v60 + 72) * v12, v13, v14);
      char v62 = v8;
      v7 += v56;
      --v2;
    }
    while (v2);
  }
  swift_bridgeObjectRelease();
  sub_10000C904();
  sub_10000DFB0();
  if (qword_100014240 != -1) {
    swift_once();
  }
  uint64_t v15 = sub_10000E050();
  sub_10000CAE8(v15, (uint64_t)qword_100014C90);
  swift_retain_n();
  uint64_t v16 = sub_10000E030();
  os_log_type_t v17 = sub_10000E140();
  if (os_log_type_enabled(v16, v17))
  {
    uint64_t v18 = (uint8_t *)swift_slowAlloc();
    char v62 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v18 = 136315138;
    uint64_t v19 = sub_10000DF00();
    char v21 = v61;
    v61[4] = sub_10000A2D4(v19, v20, (uint64_t *)&v62);
    sub_10000E170();
    swift_bridgeObjectRelease();
    swift_release_n();
    _os_log_impl((void *)&_mh_execute_header, v16, v17, "Custom Machine: %s", v18, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_release_n();

    char v21 = v61;
  }
  uint64_t v23 = v21[10];
  uint64_t v22 = v21[11];
  uint64_t v24 = v21[7];
  uint64_t v25 = v21[8];
  sub_10000DF10();
  swift_bridgeObjectRelease();
  id v57 = *(void (**)(uint64_t, uint64_t, uint64_t))(v25 + 16);
  v57(v23, v22, v24);
  unint64_t v26 = sub_10000E030();
  os_log_type_t v27 = sub_10000E140();
  BOOL v28 = os_log_type_enabled(v26, v27);
  uint64_t v29 = v21[10];
  uint64_t v31 = v21[7];
  uint64_t v30 = v21[8];
  if (v28)
  {
    unint64_t v32 = (uint8_t *)swift_slowAlloc();
    char v62 = (void *)swift_slowAlloc();
    *(_DWORD *)unint64_t v32 = 136315138;
    sub_10000DA0C(&qword_100014218, (void (*)(uint64_t))&type metadata accessor for CustomEventAnalytics);
    uint64_t v33 = sub_10000E2E0();
    v21[3] = sub_10000A2D4(v33, v34, (uint64_t *)&v62);
    sub_10000E170();
    swift_bridgeObjectRelease();
    unint64_t v59 = *(void (**)(uint64_t, uint64_t))(v30 + 8);
    v59(v29, v31);
    _os_log_impl((void *)&_mh_execute_header, v26, v27, "Generated analytics: %s", v32, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    char v21 = v61;
    swift_slowDealloc();
  }
  else
  {
    unint64_t v59 = *(void (**)(uint64_t, uint64_t))(v30 + 8);
    v59(v29, v31);
  }

  uint64_t v35 = (void *)v21[5];
  v57(v21[9], v21[11], v21[7]);
  id v36 = v35;
  uint64_t v37 = sub_10000E030();
  os_log_type_t v38 = sub_10000E140();
  BOOL v39 = os_log_type_enabled(v37, v38);
  uint64_t v40 = v21[11];
  uint64_t v41 = v21[9];
  uint64_t v42 = v21[7];
  NSString v43 = v21;
  char v44 = (void *)v21[5];
  if (v39)
  {
    char v55 = v21 + 2;
    uint64_t v45 = (uint8_t *)swift_slowAlloc();
    char v62 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v45 = 136315138;
    CustomEventAnalytics.generateCoreAnalyticsDictionary(context:)((uint64_t)v44);
    sub_10000D968();
    uint64_t v46 = sub_10000E060();
    uint64_t v54 = v42;
    unint64_t v48 = v47;
    swift_bridgeObjectRelease();
    *char v55 = sub_10000A2D4(v46, v48, (uint64_t *)&v62);
    sub_10000E170();
    swift_bridgeObjectRelease();

    uint64_t v49 = v41;
    uint64_t v42 = v54;
    id v50 = v59;
    v59(v49, v54);

    _os_log_impl((void *)&_mh_execute_header, v37, v38, "Generated CA Data: %s", v45, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    uint64_t v51 = v41;
    id v50 = v59;
    v59(v51, v42);
  }
  swift_release();
  v50(v40, v42);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  unint64_t v52 = (uint64_t (*)(void))v43[1];
  return v52();
}

uint64_t sub_10000D878(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10000BCC4(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10000D8BC(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_10000D90C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_10000D968()
{
  unint64_t result = qword_100014210;
  if (!qword_100014210)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100014210);
  }
  return result;
}

uint64_t *sub_10000D9A8(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_10000DA0C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t getEnumTagSinglePayload for SampleWorkerConfig.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFE) {
    goto LABEL_17;
  }
  if (a2 + 2 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 2) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 2;
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
      return (*a1 | (v4 << 8)) - 2;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 2;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 3;
  int v8 = v6 - 3;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for SampleWorkerConfig.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 2 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 2) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFE) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFD)
  {
    unsigned int v6 = ((a2 - 254) >> 8) + 1;
    *uint64_t result = a2 + 2;
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
        JUMPOUT(0x10000DBB0);
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
          *uint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

unsigned char *sub_10000DBD8(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for SampleWorkerConfig.CodingKeys()
{
  return &type metadata for SampleWorkerConfig.CodingKeys;
}

unint64_t sub_10000DBF4()
{
  unint64_t result = qword_100014AF0;
  if (!qword_100014AF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100014AF0);
  }
  return result;
}

unint64_t sub_10000DC4C()
{
  unint64_t result = qword_100014C00;
  if (!qword_100014C00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100014C00);
  }
  return result;
}

unint64_t sub_10000DCA4()
{
  unint64_t result = qword_100014C08[0];
  if (!qword_100014C08[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_100014C08);
  }
  return result;
}

uint64_t sub_10000DD00()
{
  return _convertNSErrorToError(_:)();
}

uint64_t sub_10000DD10()
{
  return type metadata accessor for URL();
}

uint64_t sub_10000DD20()
{
  return Date.timeIntervalSince1970.getter();
}

uint64_t sub_10000DD30()
{
  return type metadata accessor for Date();
}

uint64_t sub_10000DD40()
{
  return UUID.uuidString.getter();
}

uint64_t sub_10000DD50()
{
  return UUID.init()();
}

uint64_t sub_10000DD60()
{
  return type metadata accessor for UUID();
}

uint64_t sub_10000DD70()
{
  return static AppExtension.main()();
}

uint64_t sub_10000DD80()
{
  return LedgerState.init(index:timestamp:)();
}

uint64_t sub_10000DD90()
{
  return LedgerState.index.getter();
}

uint64_t sub_10000DDA0()
{
  return type metadata accessor for LedgerState();
}

uint64_t sub_10000DDC0()
{
  return MLHostAsset.url.getter();
}

uint64_t sub_10000DDD0()
{
  return type metadata accessor for MLHostAsset();
}

uint64_t sub_10000DDE0()
{
  return dispatch thunk of LedgerClient.getCustomTaskEvents(startDate:endDate:taskName:)();
}

uint64_t sub_10000DDF0()
{
  return dispatch thunk of LedgerClient.sendCustomTaskEvent<A>(state:context:)();
}

uint64_t sub_10000DE00()
{
  return LedgerClient.__allocating_init()();
}

uint64_t sub_10000DE10()
{
  return type metadata accessor for LedgerClient();
}

uint64_t sub_10000DE20()
{
  return MLHostResult.init(error:policy:)();
}

uint64_t sub_10000DE30()
{
  return MLHostResult.init(status:policy:)();
}

uint64_t sub_10000DE40()
{
  return type metadata accessor for MLHostResult();
}

uint64_t sub_10000DE70()
{
  return TaskCustomEvent.date.getter();
}

uint64_t sub_10000DE80()
{
  return TaskCustomEvent.eventName.getter();
}

uint64_t sub_10000DE90()
{
  return type metadata accessor for TaskCustomEvent();
}

uint64_t sub_10000DEA0()
{
  return LedgerTransition.init(start:end:)();
}

uint64_t sub_10000DEB0()
{
  return type metadata accessor for LedgerTransition();
}

uint64_t sub_10000DEC0()
{
  return MLHostParameters.init(taskParameters:)();
}

uint64_t sub_10000DED0()
{
  return MLHostParameters.taskParameters.getter();
}

uint64_t sub_10000DEE0()
{
  return MLHostParameters.systemParameters.getter();
}

uint64_t sub_10000DEF0()
{
  return type metadata accessor for MLHostParameters();
}

uint64_t sub_10000DF00()
{
  return dispatch thunk of LedgerStateMachine.description.getter();
}

uint64_t sub_10000DF10()
{
  return dispatch thunk of LedgerStateMachine.processStates(states:)();
}

uint64_t sub_10000DF20()
{
  return CustomEventAnalytics.stateCountMap.getter();
}

uint64_t sub_10000DF30()
{
  return CustomEventAnalytics.latestValidState.getter();
}

uint64_t sub_10000DF40()
{
  return CustomEventAnalytics.transitionStatsMap.getter();
}

uint64_t sub_10000DF50()
{
  return type metadata accessor for CustomEventAnalytics();
}

uint64_t sub_10000DF60()
{
  return MLHostAssetParameters.assetSpecifier.getter();
}

uint64_t sub_10000DF70()
{
  return MLHostAssetParameters.assetType.getter();
}

uint64_t sub_10000DF80()
{
  return type metadata accessor for MLHostAssetParameters();
}

uint64_t sub_10000DF90()
{
  return StateMachineAnalytics.lastEventTimestamp.getter();
}

uint64_t sub_10000DFA0()
{
  return StateMachineAnalytics.firstEventTimestamp.getter();
}

uint64_t sub_10000DFB0()
{
  return getCustomStateMachine<A>(states:)();
}

uint64_t sub_10000DFC0()
{
  return MLHostExtensionContext.taskFolder.getter();
}

uint64_t sub_10000DFD0()
{
  return MLHostExtensionContext.taskId.getter();
}

uint64_t sub_10000DFE0()
{
  return MLHostExtensionContext.taskName.getter();
}

uint64_t sub_10000DFF0()
{
  return MLHostSystemParameters.mobileAsset.getter();
}

uint64_t sub_10000E000()
{
  return type metadata accessor for MLHostSystemParameters();
}

uint64_t sub_10000E010()
{
  return LedgerTransitionStatistics.mean.getter();
}

uint64_t sub_10000E020()
{
  return type metadata accessor for LedgerTransitionStatistics();
}

uint64_t sub_10000E030()
{
  return Logger.logObject.getter();
}

uint64_t sub_10000E040()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_10000E050()
{
  return type metadata accessor for Logger();
}

uint64_t sub_10000E060()
{
  return Dictionary.description.getter();
}

uint64_t sub_10000E070()
{
  return dispatch thunk of Hashable._rawHashValue(seed:)();
}

uint64_t sub_10000E080()
{
  return BidirectionalCollection<>.joined(separator:)();
}

uint64_t sub_10000E090()
{
  return dispatch thunk of static Equatable.== infix(_:_:)();
}

NSString sub_10000E0A0()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_10000E0B0()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10000E0C0()
{
  return String.hash(into:)();
}

void sub_10000E0D0(Swift::String a1)
{
}

Swift::Int sub_10000E0E0()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_10000E0F0()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10000E100()
{
  return Array.description.getter();
}

uint64_t sub_10000E110()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_10000E120()
{
  return static Task<>.isCancelled.getter();
}

uint64_t sub_10000E130()
{
  return Double.description.getter();
}

uint64_t sub_10000E140()
{
  return static os_log_type_t.info.getter();
}

uint64_t sub_10000E150()
{
  return static os_log_type_t.debug.getter();
}

uint64_t sub_10000E160()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_10000E170()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_10000E180()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_10000E190()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_10000E1A0()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_10000E1B0()
{
  return type metadata accessor for ContinuousClock.Instant();
}

uint64_t sub_10000E1C0()
{
  return ContinuousClock.init()();
}

uint64_t sub_10000E1D0()
{
  return type metadata accessor for ContinuousClock();
}

uint64_t sub_10000E1E0()
{
  return dispatch thunk of InstantProtocol.advanced(by:)();
}

uint64_t sub_10000E1F0()
{
  return dispatch thunk of _AnySequenceBox._makeIterator()();
}

uint64_t sub_10000E200()
{
  return _print_unlocked<A, B>(_:_:)();
}

uint64_t sub_10000E210()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_10000E220()
{
  return static _DictionaryStorage.copy(original:)();
}

uint64_t sub_10000E230()
{
  return static _DictionaryStorage.resize(original:capacity:move:)();
}

uint64_t sub_10000E240()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_10000E250()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t sub_10000E260()
{
  return dispatch thunk of _AnyIteratorBoxBase.next()();
}

Swift::Int sub_10000E270(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases, string);
}

uint64_t sub_10000E280()
{
  return KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
}

uint64_t sub_10000E290()
{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

uint64_t sub_10000E2A0()
{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

uint64_t sub_10000E2B0()
{
  return KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
}

uint64_t sub_10000E2C0()
{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

uint64_t sub_10000E2D0()
{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

uint64_t sub_10000E2E0()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t sub_10000E2F0()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_10000E300()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_10000E310()
{
  return dispatch thunk of Clock.now.getter();
}

uint64_t sub_10000E330()
{
  return Error._getEmbeddedNSError()();
}

uint64_t sub_10000E340()
{
  return Error._code.getter();
}

uint64_t sub_10000E350()
{
  return Error._domain.getter();
}

uint64_t sub_10000E360()
{
  return Error._userInfo.getter();
}

uint64_t sub_10000E370()
{
  return Hasher.init(_seed:)();
}

void sub_10000E380(Swift::UInt a1)
{
}

Swift::Int sub_10000E390()
{
  return Hasher._finalize()();
}

uint64_t sub_10000E3A0()
{
  return Mirror.init(reflecting:)();
}

uint64_t sub_10000E3B0()
{
  return Mirror.children.getter();
}

uint64_t sub_10000E3C0()
{
  return type metadata accessor for Mirror();
}

uint64_t sub_10000E3D0()
{
  return dispatch thunk of Decoder.container<A>(keyedBy:)();
}

uint64_t sub_10000E3E0()
{
  return dispatch thunk of Encoder.container<A>(keyedBy:)();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
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

uint64_t swift_errorInMain()
{
  return _swift_errorInMain();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
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

uint64_t swift_stdlib_random()
{
  return _swift_stdlib_random();
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