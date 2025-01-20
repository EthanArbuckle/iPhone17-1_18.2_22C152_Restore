uint64_t sub_1000023E0()
{
  uint64_t v0;

  v0 = sub_10000A3C0();
  sub_100009F0C(v0, qword_100010740);
  sub_100009A1C(v0, (uint64_t)qword_100010740);
  return sub_10000A3B0();
}

com_apple_mlhost_TelemetryWorker::TelemetryError_optional __swiftcall TelemetryError.init(rawValue:)(Swift::String rawValue)
{
  object = rawValue._object;
  v6._countAndFlagsBits = rawValue._countAndFlagsBits;
  v2._rawValue = &off_10000C7F8;
  v6._object = object;
  Swift::Int v3 = sub_10000A4E0(v2, v6);
  swift_bridgeObjectRelease();
  if (v3 == 1) {
    v4.value = com_apple_mlhost_TelemetryWorker_TelemetryError_ledgerEmpty;
  }
  else {
    v4.value = com_apple_mlhost_TelemetryWorker_TelemetryError_unknownDefault;
  }
  if (v3) {
    return v4;
  }
  else {
    return 0;
  }
}

uint64_t TelemetryError.rawValue.getter(char a1)
{
  if (a1) {
    return 0x6D4572656764656CLL;
  }
  else {
    return 0x656C6C65636E6163;
  }
}

uint64_t sub_1000024FC(char *a1, char *a2)
{
  return sub_100002590(*a1, *a2);
}

uint64_t sub_100002508(char a1, char a2)
{
  if (*(void *)&aStart_1[8 * a1] == *(void *)&aStart_1[8 * a2]
    && *(void *)&aFinished_1[8 * a1 + 8] == *(void *)&aFinished_1[8 * a2 + 8])
  {
    char v3 = 1;
  }
  else
  {
    char v3 = sub_10000A4F0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

uint64_t sub_100002590(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    uint64_t v3 = 0x6D4572656764656CLL;
  }
  else {
    uint64_t v3 = 0x656C6C65636E6163;
  }
  if (v2) {
    unint64_t v4 = 0xE900000000000064;
  }
  else {
    unint64_t v4 = 0xEB00000000797470;
  }
  if (a2) {
    uint64_t v5 = 0x6D4572656764656CLL;
  }
  else {
    uint64_t v5 = 0x656C6C65636E6163;
  }
  if (a2) {
    unint64_t v6 = 0xEB00000000797470;
  }
  else {
    unint64_t v6 = 0xE900000000000064;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = sub_10000A4F0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

Swift::Int sub_100002640()
{
  return sub_100002648();
}

Swift::Int sub_100002648()
{
  return sub_10000A550();
}

Swift::Int sub_1000026D8()
{
  return sub_10000A550();
}

uint64_t sub_100002744()
{
  return sub_1000027A0();
}

uint64_t sub_10000274C()
{
  sub_10000A400();

  return swift_bridgeObjectRelease();
}

uint64_t sub_1000027A0()
{
  sub_10000A400();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_100002818()
{
  return sub_100002820();
}

Swift::Int sub_100002820()
{
  return sub_10000A550();
}

Swift::Int sub_1000028AC()
{
  return sub_10000A550();
}

uint64_t sub_100002914@<X0>(uint64_t *a1@<X0>, char *a2@<X8>)
{
  v8._countAndFlagsBits = *a1;
  uint64_t v3 = (void *)a1[1];
  v4._rawValue = &off_10000C7F8;
  v8._object = v3;
  Swift::Int v5 = sub_10000A4E0(v4, v8);
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

uint64_t sub_100002974@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = TelemetryError.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

_UNKNOWN **static TelemetryStates.allCases.getter()
{
  return &off_10000C8E0;
}

uint64_t TelemetryStates.rawValue.getter(char a1)
{
  return *(void *)&aStart_1[8 * a1];
}

uint64_t sub_1000029E0(char *a1, char *a2)
{
  return sub_100002508(*a1, *a2);
}

Swift::Int sub_1000029EC()
{
  return sub_1000026D8();
}

uint64_t sub_1000029F4()
{
  return sub_10000274C();
}

Swift::Int sub_1000029FC()
{
  return sub_1000028AC();
}

uint64_t sub_100002A04@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = _s32com_apple_mlhost_TelemetryWorker0D6StatesO8rawValueACSgSS_tcfC_0(*(void *)a1, *(void **)(a1 + 8));
  *a2 = result;
  return result;
}

uint64_t sub_100002A34@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = TelemetryStates.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

void sub_100002A60(void *a1@<X8>)
{
  *a1 = &off_10000C908;
}

uint64_t sub_100002A70(uint64_t a1)
{
  v2[38] = a1;
  v2[39] = v1;
  uint64_t v3 = sub_10000A290();
  v2[40] = v3;
  uint64_t v4 = *(void *)(v3 - 8);
  v2[41] = v4;
  v2[42] = *(void *)(v4 + 64);
  v2[43] = swift_task_alloc();
  v2[44] = swift_task_alloc();
  v2[45] = swift_task_alloc();
  uint64_t v5 = sub_10000A2C0();
  v2[46] = v5;
  v2[47] = *(void *)(v5 - 8);
  v2[48] = swift_task_alloc();
  uint64_t v6 = sub_10000A2E0();
  v2[49] = v6;
  uint64_t v7 = *(void *)(v6 - 8);
  v2[50] = v7;
  v2[51] = *(void *)(v7 + 64);
  v2[52] = swift_task_alloc();
  v2[53] = swift_task_alloc();
  uint64_t v8 = sub_10000A190();
  v2[54] = v8;
  v2[55] = *(void *)(v8 - 8);
  v2[56] = swift_task_alloc();
  uint64_t v9 = sub_10000A270();
  v2[57] = v9;
  v2[58] = *(void *)(v9 - 8);
  v2[59] = swift_task_alloc();
  v2[60] = swift_task_alloc();
  uint64_t v10 = sub_100009FB0();
  v2[61] = v10;
  v2[62] = *(void *)(v10 - 8);
  v2[63] = swift_task_alloc();
  sub_1000099D8(&qword_1000100D8);
  v2[64] = swift_task_alloc();
  v2[65] = swift_task_alloc();
  uint64_t v11 = sub_10000A340();
  v2[66] = v11;
  v2[67] = *(void *)(v11 - 8);
  v2[68] = swift_task_alloc();
  v2[69] = swift_task_alloc();
  v2[70] = swift_task_alloc();
  uint64_t v12 = sub_100009FE0();
  v2[71] = v12;
  v2[72] = *(void *)(v12 - 8);
  v2[73] = swift_task_alloc();
  return _swift_task_switch(sub_100002E5C, 0, 0);
}

uint64_t sub_100002E5C()
{
  if (qword_100010130 != -1) {
    swift_once();
  }
  uint64_t v1 = *(void **)(v0 + 304);
  uint64_t v2 = sub_10000A3C0();
  *(void *)(v0 + 592) = sub_100009A1C(v2, (uint64_t)qword_100010740);
  id v3 = v1;
  uint64_t v4 = sub_10000A3A0();
  os_log_type_t v5 = sub_10000A450();
  BOOL v6 = os_log_type_enabled(v4, v5);
  uint64_t v7 = *(void **)(v0 + 304);
  if (v6)
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    uint64_t v9 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v8 = 138412290;
    *(void *)(v0 + 288) = v7;
    id v10 = v7;
    sub_10000A480();
    *uint64_t v9 = v7;

    _os_log_impl((void *)&_mh_execute_header, v4, v5, "Context: %@", v8, 0xCu);
    sub_1000099D8(&qword_100010100);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  uint64_t v11 = *(void *)(v0 + 584);
  uint64_t v12 = *(void *)(v0 + 576);
  uint64_t v13 = *(void *)(v0 + 568);
  sub_100009FD0();
  *(void *)(v0 + 600) = sub_100009FC0();
  *(void *)(v0 + 608) = v14;
  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v11, v13);
  sub_10000A040();
  *(void *)(v0 + 616) = sub_10000A030();
  *(unsigned char *)(v0 + 857) = 0;
  sub_100009A54();
  uint64_t v16 = sub_10000A420();
  *(void *)(v0 + 624) = v16;
  *(void *)(v0 + 632) = v15;
  return _swift_task_switch(sub_1000030AC, v16, v15);
}

uint64_t sub_1000030AC()
{
  *(void *)(v0 + 640) = sub_100009AAC();
  sub_10000A020();
  return _swift_task_switch(sub_100003140, 0, 0);
}

uint64_t sub_100003140()
{
  uint64_t v1 = *(void **)(v0 + 312);
  *(void *)(v0 + 648) = *v1;
  *(void *)(v0 + 656) = v1[1];
  id v2 = objc_allocWithZone((Class)NSUserDefaults);
  swift_bridgeObjectRetain();
  NSString v3 = sub_10000A3F0();
  swift_bridgeObjectRelease();
  id v4 = [v2 initWithSuiteName:v3];

  if (v4)
  {
    NSString v5 = sub_10000A3F0();
    [v4 doubleForKey:v5];
    double v7 = v6;
  }
  else
  {
    double v7 = 0.0;
  }
  uint64_t v8 = *(void *)(v0 + 560);
  uint64_t v9 = *(void *)(v0 + 552);
  uint64_t v10 = *(void *)(v0 + 544);
  uint64_t v11 = *(void *)(v0 + 536);
  uint64_t v12 = *(void *)(v0 + 528);
  sub_10000A330();
  uint64_t v13 = *(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 16);
  v13(v9, v8, v12);
  v13(v10, v8, v12);
  uint64_t v14 = sub_10000A3A0();
  os_log_type_t v15 = sub_10000A450();
  BOOL v16 = os_log_type_enabled(v14, v15);
  uint64_t v17 = *(void *)(v0 + 552);
  uint64_t v18 = *(void *)(v0 + 544);
  uint64_t v19 = *(void *)(v0 + 536);
  uint64_t v20 = *(void *)(v0 + 528);
  if (v16)
  {
    uint64_t v21 = swift_slowAlloc();
    *(_DWORD *)uint64_t v21 = 134218240;
    sub_10000A300();
    *(void *)(v0 + 192) = v22;
    sub_10000A480();
    v23 = *(void (**)(uint64_t, uint64_t))(v19 + 8);
    v23(v17, v20);
    *(_WORD *)(v21 + 12) = 2048;
    sub_10000A2F0();
    *(void *)(v0 + 248) = v24;
    sub_10000A480();
    v23(v18, v20);
    _os_log_impl((void *)&_mh_execute_header, v14, v15, "TelemetryWorker: startTimestamp: %f -- endTimestamp: %f", (uint8_t *)v21, 0x16u);
    swift_slowDealloc();
  }
  else
  {
    v23 = *(void (**)(uint64_t, uint64_t))(v19 + 8);
    v23(*(void *)(v0 + 552), *(void *)(v0 + 528));
    v23(v18, v20);
  }
  *(void *)(v0 + 664) = v23;

  sub_10000A2F0();
  if (v25 <= v7)
  {
    swift_bridgeObjectRelease();
    v28 = sub_10000A3A0();
    os_log_type_t v29 = sub_10000A470();
    if (os_log_type_enabled(v28, v29))
    {
      v30 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)v30 = 134217984;
      *(double *)(v0 + 216) = v7;
      sub_10000A480();
      _os_log_impl((void *)&_mh_execute_header, v28, v29, "TelemetryWorker has processed already up to %f. Skipping execution.", v30, 0xCu);
      swift_slowDealloc();
    }
    uint64_t v31 = *(void *)(v0 + 560);
    uint64_t v32 = *(void *)(v0 + 528);

    id v33 = objc_allocWithZone((Class)sub_10000A070());
    uint64_t v36 = sub_10000A060();
    swift_release();
    v23(v31, v32);
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
    v34 = *(uint64_t (**)(uint64_t))(v0 + 8);
    return v34(v36);
  }
  else
  {
    *(unsigned char *)(v0 + 865) = 1;
    uint64_t v26 = *(void *)(v0 + 632);
    uint64_t v27 = *(void *)(v0 + 624);
    return _swift_task_switch(sub_100003608, v27, v26);
  }
}

uint64_t sub_100003608()
{
  sub_10000A020();
  return _swift_task_switch(sub_100003684, 0, 0);
}

uint64_t sub_100003684()
{
  uint64_t v1 = v0[65];
  uint64_t v3 = v0[63];
  uint64_t v2 = v0[64];
  uint64_t v4 = v0[61];
  uint64_t v5 = v0[62];
  sub_10000A320();
  sub_100009F90();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v3, v4);
  double v6 = *(void (**)(uint64_t, void, uint64_t, uint64_t))(v5 + 56);
  v0[84] = v6;
  v0[85] = (v5 + 56) & 0xFFFFFFFFFFFFLL | 0xA0D1000000000000;
  v6(v1, 0, 1, v4);
  sub_10000A310();
  v6(v2, 0, 1, v4);
  uint64_t v7 = v0[79];
  uint64_t v8 = v0[78];
  return _swift_task_switch(sub_1000037A4, v8, v7);
}

uint64_t sub_1000037A4()
{
  uint64_t v1 = v0[65];
  uint64_t v2 = v0[64];
  v0[86] = sub_10000A010();
  sub_100009E00(v2, &qword_1000100D8);
  sub_100009E00(v1, &qword_1000100D8);
  return _swift_task_switch(sub_100003848, 0, 0);
}

uint64_t sub_100003848()
{
  if (*(void *)(*(void *)(v0 + 688) + 16))
  {
    uint64_t v1 = sub_10000A3A0();
    os_log_type_t v2 = sub_10000A450();
    if (os_log_type_enabled(v1, v2))
    {
      uint64_t v3 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v3 = 0;
      _os_log_impl((void *)&_mh_execute_header, v1, v2, "Processing 24-hour analytics aggregation", v3, 2u);
      swift_slowDealloc();
    }

    *(unsigned char *)(v0 + 864) = 2;
    uint64_t v4 = *(void *)(v0 + 632);
    uint64_t v5 = *(void *)(v0 + 624);
    return _swift_task_switch(sub_100003B40, v5, v4);
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    double v6 = sub_10000A3A0();
    os_log_type_t v7 = sub_10000A470();
    if (os_log_type_enabled(v6, v7))
    {
      uint64_t v8 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, v7, "No events in ledger.", v8, 2u);
      swift_slowDealloc();
    }
    uint64_t v9 = *(void (**)(uint64_t, uint64_t))(v0 + 664);
    uint64_t v10 = *(void *)(v0 + 560);
    uint64_t v11 = *(void *)(v0 + 528);

    sub_100009B00();
    id v12 = objc_allocWithZone((Class)sub_10000A070());
    uint64_t v15 = sub_10000A050();
    swift_release();
    v9(v10, v11);
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
    uint64_t v13 = *(uint64_t (**)(uint64_t))(v0 + 8);
    return v13(v15);
  }
}

uint64_t sub_100003B40()
{
  sub_10000A020();
  return _swift_task_switch(sub_100003BBC, 0, 0);
}

uint64_t sub_100003BBC()
{
  uint64_t v1 = v0[55];
  uint64_t v2 = v0[56];
  uint64_t v3 = v0[54];
  uint64_t v4 = enum case for BucketInterval.day(_:);
  uint64_t v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(v1 + 104);
  v0[87] = v5;
  v0[88] = (v1 + 104) & 0xFFFFFFFFFFFFLL | 0xB2E4000000000000;
  v5(v2, v4, v3);
  swift_bridgeObjectRetain();
  sub_10000A260();
  double v6 = (void *)swift_task_alloc();
  v0[89] = v6;
  *double v6 = v0;
  v6[1] = sub_100003CCC;
  uint64_t v7 = v0[86];
  uint64_t v8 = v0[70];
  uint64_t v9 = v0[60];
  return processTaskTelemetry(telemetryConfig:telemetryRange:allEvents:)(v9, v8, v7);
}

uint64_t sub_100003CCC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = (void *)*v4;
  v5[14] = v4;
  v5[15] = a1;
  v5[16] = a2;
  v5[17] = a3;
  v5[18] = a4;
  v5[90] = a2;
  swift_task_dealloc();
  return _swift_task_switch(sub_100003DD8, 0, 0);
}

uint64_t sub_100003DD8()
{
  uint64_t v26 = v0;
  if (*(void *)(v0 + 720))
  {
    uint64_t v1 = *(void *)(v0 + 120);
    *(int8x16_t *)(v0 + 728) = vextq_s8(*(int8x16_t *)(v0 + 136), *(int8x16_t *)(v0 + 136), 8uLL);
    *(void *)(v0 + 744) = v1;
    *(unsigned char *)(v0 + 863) = 3;
    uint64_t v2 = *(void *)(v0 + 632);
    uint64_t v3 = *(void *)(v0 + 624);
    return _swift_task_switch(sub_100004174, v3, v2);
  }
  else
  {
    uint64_t v4 = *(void **)(v0 + 304);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    id v5 = v4;
    double v6 = sub_10000A3A0();
    os_log_type_t v7 = sub_10000A450();
    BOOL v8 = os_log_type_enabled(v6, v7);
    uint64_t v9 = *(void **)(v0 + 304);
    if (v8)
    {
      uint64_t v10 = swift_slowAlloc();
      uint64_t v25 = swift_slowAlloc();
      *(_DWORD *)uint64_t v10 = 136315394;
      uint64_t v11 = sub_10000A370();
      *(void *)(v0 + 200) = sub_1000074F0(v11, v12, &v25);
      sub_10000A480();
      swift_bridgeObjectRelease();

      *(_WORD *)(v10 + 12) = 2080;
      uint64_t v13 = sub_10000A380();
      *(void *)(v0 + 208) = sub_1000074F0(v13, v14, &v25);
      sub_10000A480();
      swift_bridgeObjectRelease();

      _os_log_impl((void *)&_mh_execute_header, v6, v7, "TaskId: %s, TaskName: %s: asked to stop!", (uint8_t *)v10, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
    }
    uint64_t v15 = *(void (**)(uint64_t, uint64_t))(v0 + 664);
    uint64_t v16 = *(void *)(v0 + 560);
    uint64_t v17 = *(void *)(v0 + 528);
    uint64_t v18 = *(void *)(v0 + 480);
    uint64_t v19 = *(void *)(v0 + 456);
    uint64_t v20 = *(void *)(v0 + 464);
    id v21 = objc_allocWithZone((Class)sub_10000A070());
    uint64_t v24 = sub_10000A060();
    swift_release();
    (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v18, v19);
    v15(v16, v17);
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
    uint64_t v22 = *(uint64_t (**)(uint64_t))(v0 + 8);
    return v22(v24);
  }
}

uint64_t sub_100004174()
{
  sub_10000A020();
  return _swift_task_switch(sub_1000041F0, 0, 0);
}

uint64_t sub_1000041F0()
{
  uint64_t v1 = *(void *)(v0 + 736);
  uint64_t v2 = *(void *)(v0 + 728);
  uint64_t v3 = *(void *)(v0 + 720);
  uint64_t v4 = *(void *)(v0 + 312);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v0 + 752) = v5;
  double v6 = *(void **)(v4 + 32);
  *(void *)(v0 + 760) = v6;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_10000858C(v3, v1, v2, v6, v5);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  os_log_type_t v7 = sub_10000A3A0();
  os_log_type_t v8 = sub_10000A450();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "Processing 7-day analytics aggregation", v9, 2u);
    swift_slowDealloc();
  }

  *(unsigned char *)(v0 + 862) = 2;
  uint64_t v10 = *(void *)(v0 + 632);
  uint64_t v11 = *(void *)(v0 + 624);
  return _swift_task_switch(sub_100004340, v11, v10);
}

uint64_t sub_100004340()
{
  sub_10000A020();
  return _swift_task_switch(sub_1000043BC, 0, 0);
}

uint64_t sub_1000043BC()
{
  (*(void (**)(void, void, void))(v0 + 696))(*(void *)(v0 + 448), enum case for BucketInterval.week(_:), *(void *)(v0 + 432));
  sub_10000A260();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 768) = v1;
  void *v1 = v0;
  v1[1] = sub_1000044B0;
  uint64_t v2 = *(void *)(v0 + 688);
  uint64_t v3 = *(void *)(v0 + 560);
  uint64_t v4 = *(void *)(v0 + 472);
  return processTaskTelemetry(telemetryConfig:telemetryRange:allEvents:)(v4, v3, v2);
}

uint64_t sub_1000044B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v5 = (void *)*v4;
  v5[19] = v4;
  v5[20] = a1;
  v5[21] = a2;
  v5[22] = a3;
  v5[23] = a4;
  v5[97] = a2;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  return _swift_task_switch(sub_1000045D8, 0, 0);
}

uint64_t sub_1000045D8()
{
  uint64_t v28 = v0;
  if (*(void *)(v0 + 776))
  {
    uint64_t v1 = *(void *)(v0 + 176);
    *(void *)(v0 + 784) = *(void *)(v0 + 184);
    *(void *)(v0 + 792) = v1;
    *(unsigned char *)(v0 + 861) = 3;
    uint64_t v2 = *(void *)(v0 + 632);
    uint64_t v3 = *(void *)(v0 + 624);
    return _swift_task_switch(sub_100004990, v3, v2);
  }
  else
  {
    uint64_t v4 = *(void **)(v0 + 304);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    id v5 = v4;
    uint64_t v6 = sub_10000A3A0();
    os_log_type_t v7 = sub_10000A450();
    BOOL v8 = os_log_type_enabled(v6, v7);
    uint64_t v9 = *(void **)(v0 + 304);
    if (v8)
    {
      uint64_t v10 = swift_slowAlloc();
      uint64_t v27 = swift_slowAlloc();
      *(_DWORD *)uint64_t v10 = 136315394;
      uint64_t v11 = sub_10000A370();
      *(void *)(v0 + 232) = sub_1000074F0(v11, v12, &v27);
      sub_10000A480();
      swift_bridgeObjectRelease();

      *(_WORD *)(v10 + 12) = 2080;
      uint64_t v13 = sub_10000A380();
      *(void *)(v0 + 240) = sub_1000074F0(v13, v14, &v27);
      sub_10000A480();
      swift_bridgeObjectRelease();

      _os_log_impl((void *)&_mh_execute_header, v6, v7, "TaskId: %s, TaskName: %s: asked to stop!", (uint8_t *)v10, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
    }
    uint64_t v25 = *(void (**)(uint64_t, uint64_t))(v0 + 664);
    uint64_t v15 = *(void *)(v0 + 560);
    uint64_t v16 = *(void *)(v0 + 528);
    uint64_t v18 = *(void *)(v0 + 472);
    uint64_t v17 = *(void *)(v0 + 480);
    uint64_t v19 = *(void *)(v0 + 456);
    uint64_t v20 = *(void *)(v0 + 464);
    id v21 = objc_allocWithZone((Class)sub_10000A070());
    uint64_t v26 = sub_10000A060();
    swift_release();
    uint64_t v22 = *(void (**)(uint64_t, uint64_t))(v20 + 8);
    v22(v18, v19);
    v22(v17, v19);
    v25(v15, v16);
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
    v23 = *(uint64_t (**)(uint64_t))(v0 + 8);
    return v23(v26);
  }
}

uint64_t sub_100004990()
{
  sub_10000A020();
  return _swift_task_switch(sub_100004A0C, 0, 0);
}

uint64_t sub_100004A0C()
{
  sub_10000858C(*(void *)(v0 + 776), *(void *)(v0 + 792), *(void *)(v0 + 784), *(void **)(v0 + 760), *(void **)(v0 + 752));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v1 = sub_10000A3A0();
  os_log_type_t v2 = sub_10000A450();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "Processing custom telemetry", v3, 2u);
    swift_slowDealloc();
  }

  *(unsigned char *)(v0 + 860) = 2;
  uint64_t v4 = *(void *)(v0 + 632);
  uint64_t v5 = *(void *)(v0 + 624);
  return _swift_task_switch(sub_100004B28, v5, v4);
}

uint64_t sub_100004B28()
{
  sub_10000A020();
  return _swift_task_switch(sub_100004BA4, 0, 0);
}

uint64_t sub_100004BA4()
{
  uint64_t v1 = (void (*)(uint64_t, void, uint64_t, uint64_t))v0[84];
  uint64_t v2 = v0[65];
  uint64_t v3 = v0[64];
  uint64_t v4 = v0[61];
  sub_10000A320();
  v1(v2, 0, 1, v4);
  sub_10000A310();
  v1(v3, 0, 1, v4);
  uint64_t v5 = v0[79];
  uint64_t v6 = v0[78];
  return _swift_task_switch(sub_100004C64, v6, v5);
}

uint64_t sub_100004C64()
{
  uint64_t v1 = v0[65];
  uint64_t v2 = v0[64];
  v0[100] = sub_10000A000();
  sub_100009E00(v2, &qword_1000100D8);
  sub_100009E00(v1, &qword_1000100D8);
  return _swift_task_switch(sub_100004D10, 0, 0);
}

uint64_t sub_100004D10()
{
  swift_bridgeObjectRetain();
  uint64_t v1 = sub_10000A3A0();
  os_log_type_t v2 = sub_10000A460();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = v0[100];
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v4 = 134217984;
    v0[28] = *(void *)(v3 + 16);
    sub_10000A480();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "Custom Events: %ld", v4, 0xCu);
    swift_slowDealloc();
  }
  else
  {
    swift_bridgeObjectRelease();
  }

  uint64_t v5 = (void *)swift_task_alloc();
  v0[101] = v5;
  *uint64_t v5 = v0;
  v5[1] = sub_100004E74;
  uint64_t v6 = v0[100];
  uint64_t v7 = v0[70];
  return processCustomTelemetry(customTelemetryEvents:bucketRange:)(v6, v7);
}

uint64_t sub_100004E74(uint64_t a1)
{
  *(void *)(*(void *)v1 + 816) = a1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  return _swift_task_switch(sub_100004F94, 0, 0);
}

uint64_t sub_100004F94()
{
  uint64_t v27 = v0;
  if (*(void *)(v0 + 816))
  {
    *(unsigned char *)(v0 + 866) = 3;
    uint64_t v1 = *(void *)(v0 + 632);
    uint64_t v2 = *(void *)(v0 + 624);
    return _swift_task_switch(sub_100005340, v2, v1);
  }
  else
  {
    uint64_t v3 = *(void **)(v0 + 304);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    id v4 = v3;
    uint64_t v5 = sub_10000A3A0();
    os_log_type_t v6 = sub_10000A450();
    BOOL v7 = os_log_type_enabled(v5, v6);
    uint64_t v8 = *(void **)(v0 + 304);
    if (v7)
    {
      uint64_t v9 = swift_slowAlloc();
      uint64_t v26 = swift_slowAlloc();
      *(_DWORD *)uint64_t v9 = 136315394;
      uint64_t v10 = sub_10000A370();
      *(void *)(v0 + 264) = sub_1000074F0(v10, v11, &v26);
      sub_10000A480();
      swift_bridgeObjectRelease();

      *(_WORD *)(v9 + 12) = 2080;
      uint64_t v12 = sub_10000A380();
      *(void *)(v0 + 272) = sub_1000074F0(v12, v13, &v26);
      sub_10000A480();
      swift_bridgeObjectRelease();

      _os_log_impl((void *)&_mh_execute_header, v5, v6, "TaskId: %s, TaskName: %s: asked to stop!", (uint8_t *)v9, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
    }
    uint64_t v24 = *(void (**)(uint64_t, uint64_t))(v0 + 664);
    uint64_t v14 = *(void *)(v0 + 560);
    uint64_t v15 = *(void *)(v0 + 528);
    uint64_t v17 = *(void *)(v0 + 472);
    uint64_t v16 = *(void *)(v0 + 480);
    uint64_t v18 = *(void *)(v0 + 456);
    uint64_t v19 = *(void *)(v0 + 464);
    id v20 = objc_allocWithZone((Class)sub_10000A070());
    uint64_t v25 = sub_10000A060();
    swift_release();
    id v21 = *(void (**)(uint64_t, uint64_t))(v19 + 8);
    v21(v17, v18);
    v21(v16, v18);
    v24(v14, v15);
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
    uint64_t v22 = *(uint64_t (**)(uint64_t))(v0 + 8);
    return v22(v25);
  }
}

uint64_t sub_100005340()
{
  sub_10000A020();
  return _swift_task_switch(sub_1000053BC, 0, 0);
}

uint64_t sub_1000053BC()
{
  id v33 = v0;
  uint64_t v1 = v0[102];
  uint64_t v2 = *(void *)(v1 + 16);
  if (v2)
  {
    uint64_t v3 = v0[50];
    os_log_type_t v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
    uint64_t v5 = v3 + 16;
    id v4 = v6;
    uint64_t v7 = *(unsigned __int8 *)(v5 + 64);
    uint64_t v8 = v1 + ((v7 + 32) & ~v7);
    uint64_t v9 = v0[47];
    uint64_t v29 = (void (**)(uint64_t, uint64_t))(v9 + 8);
    v30 = (void (**)(uint64_t, void, uint64_t))(v9 + 104);
    uint64_t v28 = *(void *)(v5 + 56);
    unsigned int v27 = enum case for CoreAnalyticsEvents.customEventTelemetry(_:);
    uint64_t v26 = (v7 + 16) & ~v7;
    uint64_t v31 = v6;
    do
    {
      v4(v0[53], v8, v0[49]);
      sub_10000A2D0();
      swift_bridgeObjectRetain();
      uint64_t v18 = sub_10000A3A0();
      os_log_type_t v19 = sub_10000A460();
      if (os_log_type_enabled(v18, v19))
      {
        uint64_t v20 = swift_slowAlloc();
        uint64_t v32 = swift_slowAlloc();
        *(_DWORD *)uint64_t v20 = 136315138;
        sub_100009C7C(0, &qword_1000100F8);
        uint64_t v21 = sub_10000A3E0();
        *(void *)(v20 + 4) = sub_1000074F0(v21, v22, &v32);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease_n();
        _os_log_impl((void *)&_mh_execute_header, v18, v19, "CUSTOM EVENT: %s", (uint8_t *)v20, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {
        swift_bridgeObjectRelease_n();
      }

      uint64_t v10 = v0[52];
      uint64_t v11 = v0[53];
      uint64_t v12 = v0[48];
      uint64_t v13 = v0[49];
      uint64_t v14 = v0[46];
      (*v30)(v12, v27, v14);
      sub_10000A2B0();
      (*v29)(v12, v14);
      NSString v15 = sub_10000A3F0();
      swift_bridgeObjectRelease();
      v31(v10, v11, v13);
      uint64_t v16 = swift_allocObject();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v16 + v26, v10, v13);
      v0[6] = sub_100009B6C;
      v0[7] = v16;
      v0[2] = _NSConcreteStackBlock;
      v0[3] = 1107296256;
      v0[4] = sub_1000067DC;
      v0[5] = &unk_10000CB00;
      uint64_t v17 = _Block_copy(v0 + 2);
      swift_release();
      AnalyticsSendEventLazy();
      _Block_release(v17);

      (*(void (**)(uint64_t, uint64_t))(v5 - 8))(v11, v13);
      id v4 = v31;
      v8 += v28;
      --v2;
    }
    while (v2);
  }
  swift_bridgeObjectRelease();
  *((unsigned char *)v0 + 856) = 2;
  uint64_t v23 = v0[79];
  uint64_t v24 = v0[78];
  return _swift_task_switch(sub_1000057A0, v24, v23);
}

uint64_t sub_1000057A0()
{
  sub_10000A020();
  return _swift_task_switch(sub_10000581C, 0, 0);
}

uint64_t sub_10000581C()
{
  unint64_t v1 = v0[93];
  uint64_t v2 = v0[92];
  uint64_t v3 = v0[91];
  uint64_t v4 = v0[90];
  id v5 = [(id)BiomeLibrary() Lighthouse];
  swift_unknownObjectRelease();
  id v6 = [v5 Ledger];
  swift_unknownObjectRelease();
  v0[103] = [v6 DediscoPrivacyEvent];
  swift_unknownObjectRelease();
  uint64_t v7 = sub_10000A1A0();
  v0[104] = v7;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v8 = (void *)swift_task_alloc();
  v0[105] = v8;
  *uint64_t v8 = v0;
  v8[1] = sub_10000599C;
  uint64_t v9 = v0[70];
  v10.n128_u64[0] = v1;
  return processDediscoEvents(dediscoEventMap:telemetryRange:dailyTelemetryResults:)(v7, v9, v4, v2, v3, v10);
}

uint64_t sub_10000599C(uint64_t a1)
{
  *(void *)(*(void *)v1 + 848) = a1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return _swift_task_switch(sub_100005B18, 0, 0);
}

uint64_t sub_100005B18()
{
  uint64_t v28 = v0;
  if (*(void *)(v0 + 848))
  {
    *(unsigned char *)(v0 + 858) = 3;
    uint64_t v1 = *(void *)(v0 + 632);
    uint64_t v2 = *(void *)(v0 + 624);
    return _swift_task_switch(sub_100005ED0, v2, v1);
  }
  else
  {
    uint64_t v3 = *(void **)(v0 + 304);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    id v4 = v3;
    id v5 = sub_10000A3A0();
    os_log_type_t v6 = sub_10000A450();
    BOOL v7 = os_log_type_enabled(v5, v6);
    uint64_t v8 = *(void **)(v0 + 304);
    if (v7)
    {
      uint64_t v9 = swift_slowAlloc();
      uint64_t v27 = swift_slowAlloc();
      *(_DWORD *)uint64_t v9 = 136315394;
      uint64_t v10 = sub_10000A370();
      *(void *)(v0 + 296) = sub_1000074F0(v10, v11, &v27);
      sub_10000A480();
      swift_bridgeObjectRelease();

      *(_WORD *)(v9 + 12) = 2080;
      uint64_t v12 = sub_10000A380();
      *(void *)(v0 + 280) = sub_1000074F0(v12, v13, &v27);
      sub_10000A480();
      swift_bridgeObjectRelease();

      _os_log_impl((void *)&_mh_execute_header, v5, v6, "TaskId: %s, TaskName: %s: asked to stop!", (uint8_t *)v9, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
    }
    uint64_t v14 = *(void **)(v0 + 824);
    uint64_t v24 = *(void *)(v0 + 560);
    uint64_t v25 = *(void (**)(uint64_t, uint64_t))(v0 + 664);
    uint64_t v15 = *(void *)(v0 + 528);
    uint64_t v17 = *(void *)(v0 + 472);
    uint64_t v16 = *(void *)(v0 + 480);
    uint64_t v19 = *(void *)(v0 + 456);
    uint64_t v18 = *(void *)(v0 + 464);
    id v20 = objc_allocWithZone((Class)sub_10000A070());
    uint64_t v26 = sub_10000A060();
    swift_release();

    uint64_t v21 = *(void (**)(uint64_t, uint64_t))(v18 + 8);
    v21(v17, v19);
    v21(v16, v19);
    v25(v24, v15);
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
    unint64_t v22 = *(uint64_t (**)(uint64_t))(v0 + 8);
    return v22(v26);
  }
}

uint64_t sub_100005ED0()
{
  sub_10000A020();
  return _swift_task_switch(sub_100005F4C, 0, 0);
}

uint64_t sub_100005F4C()
{
  v54 = v0;
  if (os_variant_has_internal_content())
  {
    uint64_t v1 = v0[106];
    uint64_t v2 = *(void *)(v1 + 16);
    if (v2)
    {
      uint64_t v3 = v0[41];
      os_log_type_t v6 = *(void (**)(uint64_t))(v3 + 16);
      uint64_t v5 = v3 + 16;
      id v4 = v6;
      uint64_t v7 = *(unsigned __int8 *)(v5 + 64);
      uint64_t v8 = v1 + ((v7 + 32) & ~v7);
      v44 = (void (**)(uint64_t, uint64_t))(v5 - 8);
      uint64_t v9 = v0[47];
      uint64_t v48 = *(void *)(v5 + 56);
      v49 = (void (**)(uint64_t, void, uint64_t))(v9 + 104);
      unsigned int v47 = enum case for CoreAnalyticsEvents.dediscoTelemetry(_:);
      v46 = (void (**)(uint64_t, uint64_t))(v9 + 8);
      uint64_t v45 = (v7 + 16) & ~v7;
      v50 = (void (*)(uint64_t, uint64_t, uint64_t))v6;
      do
      {
        uint64_t v20 = v0[44];
        uint64_t v19 = v0[45];
        uint64_t v21 = v0[40];
        uint64_t v51 = v8;
        v4(v19);
        ((void (*)(uint64_t, uint64_t, uint64_t))v4)(v20, v19, v21);
        unint64_t v22 = sub_10000A3A0();
        os_log_type_t v23 = sub_10000A450();
        BOOL v24 = os_log_type_enabled(v22, v23);
        uint64_t v25 = v0[44];
        uint64_t v52 = v2;
        if (v24)
        {
          uint64_t v43 = v0[40];
          uint64_t v26 = swift_slowAlloc();
          uint64_t v53 = swift_slowAlloc();
          *(_DWORD *)uint64_t v26 = 136315138;
          sub_10000A280();
          sub_100009C7C(0, &qword_1000100F8);
          uint64_t v27 = sub_10000A3E0();
          unint64_t v29 = v28;
          swift_bridgeObjectRelease();
          *(void *)(v26 + 4) = sub_1000074F0(v27, v29, &v53);
          swift_bridgeObjectRelease();
          v30 = *v44;
          (*v44)(v25, v43);
          _os_log_impl((void *)&_mh_execute_header, v22, v23, "DeDisco Result: %s", (uint8_t *)v26, 0xCu);
          swift_arrayDestroy();
          swift_slowDealloc();
          uint64_t v10 = v30;
          swift_slowDealloc();
        }
        else
        {
          uint64_t v10 = *v44;
          (*v44)(v25, v0[40]);
        }

        uint64_t v11 = v0[48];
        uint64_t v13 = v0[45];
        uint64_t v12 = v0[46];
        uint64_t v14 = v0[43];
        uint64_t v15 = v0[40];
        (*v49)(v11, v47, v12);
        sub_10000A2B0();
        (*v46)(v11, v12);
        NSString v16 = sub_10000A3F0();
        swift_bridgeObjectRelease();
        v50(v14, v13, v15);
        uint64_t v17 = swift_allocObject();
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v17 + v45, v14, v15);
        v0[12] = sub_100009BC8;
        v0[13] = v17;
        v0[8] = _NSConcreteStackBlock;
        v0[9] = 1107296256;
        v0[10] = sub_1000067DC;
        v0[11] = &unk_10000CB50;
        uint64_t v18 = _Block_copy(v0 + 8);
        swift_release();
        AnalyticsSendEventLazy();
        _Block_release(v18);

        v10(v13, v15);
        id v4 = (void (*)(uint64_t))v50;
        uint64_t v8 = v51 + v48;
        uint64_t v2 = v52 - 1;
      }
      while (v52 != 1);
    }
  }
  swift_bridgeObjectRelease();
  id v31 = objc_allocWithZone((Class)NSUserDefaults);
  swift_bridgeObjectRetain();
  NSString v32 = sub_10000A3F0();
  swift_bridgeObjectRelease();
  id v33 = [v31 initWithSuiteName:v32];

  if (v33)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v34 = sub_10000A3A0();
    os_log_type_t v35 = sub_10000A450();
    if (os_log_type_enabled(v34, v35))
    {
      uint64_t v36 = v0[93];
      uint64_t v37 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v37 = 134217984;
      v0[32] = v36;
      sub_10000A480();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v34, v35, "Marking lastProcessedTimestamp: %f", v37, 0xCu);
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    Class isa = sub_10000A430().super.super.isa;
    NSString v39 = sub_10000A3F0();
    [v33 setValue:isa forKey:v39];
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  *((unsigned char *)v0 + 859) = 4;
  uint64_t v40 = v0[79];
  uint64_t v41 = v0[78];
  return _swift_task_switch(sub_100006590, v41, v40);
}

uint64_t sub_100006590()
{
  sub_10000A020();
  return _swift_task_switch(sub_10000660C, 0, 0);
}

uint64_t sub_10000660C()
{
  uint64_t v1 = (void *)v0[103];
  uint64_t v11 = v0[70];
  uint64_t v12 = (void (*)(uint64_t, uint64_t))v0[83];
  uint64_t v2 = v0[66];
  uint64_t v4 = v0[59];
  uint64_t v3 = v0[60];
  uint64_t v6 = v0[57];
  uint64_t v5 = v0[58];
  id v7 = objc_allocWithZone((Class)sub_10000A070());
  uint64_t v13 = sub_10000A060();
  swift_release();

  uint64_t v8 = *(void (**)(uint64_t, uint64_t))(v5 + 8);
  v8(v4, v6);
  v8(v3, v6);
  v12(v11, v2);
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
  uint64_t v9 = (uint64_t (*)(uint64_t))v0[1];
  return v9(v13);
}

Class sub_1000067DC(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  uint64_t v3 = v1(v2);
  swift_release();
  if (v3)
  {
    sub_100009C7C(0, &qword_1000100F8);
    v4.super.Class isa = sub_10000A3D0().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v4.super.Class isa = 0;
  }

  return v4.super.isa;
}

id sub_100006878(uint64_t a1)
{
  uint64_t v2 = sub_100009FB0();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  uint64_t v5 = (char *)&v38 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1000099D8(&qword_100010118) - 8;
  __chkstk_darwin();
  uint64_t v8 = (char *)&v38 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v49 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  sub_10000A2A0();
  Class isa = sub_10000A560().super.super.isa;
  sub_10000A0A0();
  uint64_t v9 = *(void (**)(char *, char *, uint64_t))(v3 + 16);
  v9(v5, v8, v2);
  sub_100009E00((uint64_t)v8, &qword_100010118);
  Class v47 = sub_100009FA0().super.isa;
  uint64_t v10 = *(void (**)(char *, uint64_t))(v3 + 8);
  v10(v5, v2);
  sub_10000A0A0();
  v9(v5, &v8[*(int *)(v6 + 44)], v2);
  sub_100009E00((uint64_t)v8, &qword_100010118);
  Class v44 = sub_100009FA0().super.isa;
  v10(v5, v2);
  sub_10000A150();
  NSString v11 = sub_10000A3F0();
  swift_bridgeObjectRelease();
  sub_10000A160();
  NSString v46 = sub_10000A3F0();
  swift_bridgeObjectRelease();
  sub_10000A110();
  Class v45 = sub_100009FA0().super.isa;
  v10(v5, v2);
  sub_10000A0E0();
  Class v12 = sub_10000A440().super.super.isa;
  sub_10000A0B0();
  Class v13 = sub_10000A440().super.super.isa;
  sub_10000A0C0();
  Class v14 = sub_10000A440().super.super.isa;
  Class v39 = v14;
  sub_10000A120();
  Class v15 = sub_10000A430().super.super.isa;
  Class v40 = v15;
  sub_10000A0F0();
  Class v16 = sub_10000A430().super.super.isa;
  Class v41 = v16;
  sub_10000A140();
  Class v17 = sub_10000A430().super.super.isa;
  Class v42 = v17;
  sub_10000A100();
  Class v18 = sub_10000A430().super.super.isa;
  Class v43 = v18;
  sub_10000A100();
  Class v19 = sub_10000A430().super.super.isa;
  Class v37 = v18;
  Class v35 = v16;
  Class v36 = v17;
  Class v33 = v14;
  Class v34 = v15;
  Class v31 = v12;
  Class v32 = v13;
  Class v20 = v13;
  Class v21 = v12;
  Class v22 = isa;
  Class v23 = v47;
  Class v25 = v44;
  Class v24 = v45;
  uint64_t v26 = v11;
  NSString v27 = v11;
  unint64_t v28 = v46;
  id v49 = [v49 initWithVersion:isa bucketStart:v47 bucketEnd:v44 taskName:v27 taskState:v46 latestEventTimestamp:v45 countCompleted:v31 countFailed:v32 countDeferred:v33 dailyExecutionLatency:v34 crossExecutionDelay:v35 executionCompletionTime:v36 executionFailureTime:v37 executionDeferralTime:v19];

  uint64_t v29 = sub_10000A170();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v29 - 8) + 8))(a1, v29);
  return v49;
}

id sub_100006C1C(uint64_t a1)
{
  uint64_t v2 = sub_100009FB0();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  uint64_t v5 = (char *)&v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1000099D8(&qword_100010118) - 8;
  __chkstk_darwin();
  uint64_t v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v25 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  sub_10000A2A0();
  Class isa = sub_10000A560().super.super.isa;
  sub_10000A1C0();
  uint64_t v9 = *(void (**)(char *, char *, uint64_t))(v3 + 16);
  v9(v5, v8, v2);
  sub_100009E00((uint64_t)v8, &qword_100010118);
  Class v23 = sub_100009FA0().super.isa;
  uint64_t v10 = *(void (**)(char *, uint64_t))(v3 + 8);
  v10(v5, v2);
  sub_10000A1C0();
  v9(v5, &v8[*(int *)(v6 + 44)], v2);
  sub_100009E00((uint64_t)v8, &qword_100010118);
  Class v11 = sub_100009FA0().super.isa;
  v10(v5, v2);
  sub_10000A1B0();
  Class v12 = sub_10000A440().super.super.isa;
  sub_10000A210();
  Class v13 = sub_10000A440().super.super.isa;
  sub_10000A1E0();
  Class v14 = sub_10000A440().super.super.isa;
  sub_10000A1D0();
  Class v15 = sub_10000A440().super.super.isa;
  sub_10000A1F0();
  Class v16 = sub_10000A440().super.super.isa;
  Class v17 = isa;
  Class v18 = v23;
  id v19 = [v25 initWithVersion:isa bucketStart:v23 bucketEnd:v11 tasksCount:v12 tasksRun:v13 tasksDeferred:v14 tasksFailed:v15 tasksCompleted:v16];

  uint64_t v20 = sub_10000A220();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v20 - 8) + 8))(a1, v20);
  return v19;
}

uint64_t sub_100006ED4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_100006F84;
  return MLHostExtension.shouldRun(context:)(a1, a2, a3);
}

uint64_t sub_100006F84(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

uint64_t sub_100007080(uint64_t a1)
{
  long long v4 = v1[1];
  *(_OWORD *)(v2 + 16) = *v1;
  *(_OWORD *)(v2 + 32) = v4;
  *(_OWORD *)(v2 + 48) = v1[2];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 64) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_100007134;
  return sub_100002A70(a1);
}

uint64_t sub_100007134(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

uint64_t sub_100007230(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  Class v15 = (void *)swift_task_alloc();
  *(void *)(v7 + 16) = v15;
  *Class v15 = v7;
  v15[1] = sub_100007314;
  return MLHostExtension.loadConfig<A>(context:)(a1, a2, a6, a3, a7, a4, a5);
}

uint64_t sub_100007314()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_100007408(uint64_t a1)
{
  unint64_t v2 = sub_100008538();

  return MLHostExtension.configuration.getter(a1, v2);
}

double sub_100007454@<D0>(_OWORD *a1@<X8>)
{
  sub_10000984C(v4);
  long long v2 = v4[1];
  *a1 = v4[0];
  a1[1] = v2;
  double result = *(double *)&v5;
  a1[2] = v5;
  return result;
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

uint64_t sub_1000074F0(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_1000075C4(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_100009EAC((uint64_t)v12, *a3);
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
      sub_100009EAC((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_100009E5C((uint64_t)v12);
  return v7;
}

uint64_t sub_1000075C4(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_10000A490();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_100007780(a5, a6);
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
  uint64_t v8 = sub_10000A4B0();
  if (!v8)
  {
    sub_10000A4C0();
    __break(1u);
LABEL_17:
    uint64_t result = sub_10000A4D0();
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

uint64_t sub_100007780(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_100007818(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_1000079F8(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_1000079F8(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_100007818(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_100007990(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_10000A4A0();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_10000A4C0();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_10000A410();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_10000A4D0();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_10000A4C0();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_100007990(uint64_t a1, uint64_t a2)
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
  sub_1000099D8((uint64_t *)&unk_100010120);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  _OWORD v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_1000079F8(char a1, int64_t a2, char a3, char *a4)
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
    sub_1000099D8((uint64_t *)&unk_100010120);
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
  Class v13 = a4 + 32;
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
  uint64_t result = sub_10000A4D0();
  __break(1u);
  return result;
}

uint64_t _s32com_apple_mlhost_TelemetryWorker0D6StatesO8rawValueACSgSS_tcfC_0(uint64_t a1, void *a2)
{
  v6._countAndFlagsBits = a1;
  v3._rawValue = &off_10000C848;
  v6._object = a2;
  unint64_t v4 = sub_10000A4E0(v3, v6);
  swift_bridgeObjectRelease();
  if (v4 >= 5) {
    return 5;
  }
  else {
    return v4;
  }
}

unint64_t sub_100007B94()
{
  unint64_t result = qword_100010060;
  if (!qword_100010060)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010060);
  }
  return result;
}

unint64_t sub_100007BEC()
{
  unint64_t result = qword_100010068;
  if (!qword_100010068)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010068);
  }
  return result;
}

unint64_t sub_100007C44()
{
  unint64_t result = qword_100010070;
  if (!qword_100010070)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010070);
  }
  return result;
}

unint64_t sub_100007C9C()
{
  unint64_t result = qword_100010078;
  if (!qword_100010078)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010078);
  }
  return result;
}

unint64_t sub_100007CF4()
{
  unint64_t result = qword_100010080;
  if (!qword_100010080)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010080);
  }
  return result;
}

unint64_t sub_100007D4C()
{
  unint64_t result = qword_100010088;
  if (!qword_100010088)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010088);
  }
  return result;
}

unint64_t sub_100007DA4()
{
  unint64_t result = qword_100010090;
  if (!qword_100010090)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010090);
  }
  return result;
}

unint64_t sub_100007DFC()
{
  unint64_t result = qword_100010098;
  if (!qword_100010098)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010098);
  }
  return result;
}

unint64_t sub_100007E54()
{
  unint64_t result = qword_1000100A0;
  if (!qword_1000100A0)
  {
    sub_100007EB0(qword_1000100A8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000100A0);
  }
  return result;
}

uint64_t sub_100007EB0(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

unsigned char *initializeBufferWithCopyOfBuffer for TelemetryError(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for TelemetryError(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for TelemetryError(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x100008064);
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

uint64_t sub_10000808C(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_100008098(unsigned char *result, char a2)
{
  *uint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for TelemetryError()
{
  return &type metadata for TelemetryError;
}

uint64_t getEnumTagSinglePayload for TelemetryStates(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for TelemetryStates(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x100008210);
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

unsigned char *sub_100008238(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for TelemetryStates()
{
  return &type metadata for TelemetryStates;
}

uint64_t initializeBufferWithCopyOfBuffer for TelemetryWorker(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

void destroy for TelemetryWorker(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  uint64_t v2 = *(void **)(a1 + 40);
}

void *initializeWithCopy for TelemetryWorker(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  uint64_t v5 = (void *)a2[4];
  unsigned int v6 = (void *)a2[5];
  a1[4] = v5;
  a1[5] = v6;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v7 = v5;
  id v8 = v6;
  return a1;
}

void *assignWithCopy for TelemetryWorker(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = (void *)a2[4];
  uint64_t v5 = (void *)a1[4];
  a1[4] = v4;
  id v6 = v4;

  id v7 = (void *)a2[5];
  id v8 = (void *)a1[5];
  a1[5] = v7;
  id v9 = v7;

  return a1;
}

__n128 initializeWithTake for TelemetryWorker(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for TelemetryWorker(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void **)(a1 + 32);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);

  id v6 = *(void **)(a1 + 40);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);

  return a1;
}

uint64_t getEnumTagSinglePayload for TelemetryWorker(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 48)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for TelemetryWorker(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 48) = 1;
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
    *(unsigned char *)(result + 48) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for TelemetryWorker()
{
  return &type metadata for TelemetryWorker;
}

uint64_t sub_1000084E4()
{
  return *(void *)(swift_getOpaqueTypeConformance2() + 8);
}

unint64_t sub_100008538()
{
  unint64_t result = qword_1000100C8;
  if (!qword_1000100C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_1000100C8);
  }
  return result;
}

uint64_t sub_10000858C(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  id v141 = a5;
  id v137 = a4;
  uint64_t v110 = a3;
  uint64_t v109 = a2;
  uint64_t v6 = sub_10000A090();
  uint64_t v108 = *(void *)(v6 - 8);
  uint64_t v7 = ((uint64_t (*)(void))__chkstk_darwin)();
  v146 = (char *)v105 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v107 = v8;
  __chkstk_darwin(v7);
  v142 = (char *)v105 - v9;
  uint64_t v10 = sub_10000A220();
  uint64_t v118 = *(void *)(v10 - 8);
  uint64_t v11 = *(void *)(v118 + 64);
  uint64_t v12 = __chkstk_darwin(v10);
  v139 = (char *)v105 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  v138 = (char *)v105 - v13;
  uint64_t v117 = sub_10000A190();
  uint64_t v14 = *(void *)(v117 - 8);
  __chkstk_darwin(v117);
  v116 = (char *)v105 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v148 = sub_10000A2C0();
  uint64_t v143 = *(void *)(v148 - 8);
  __chkstk_darwin(v148);
  v147 = (char *)v105 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_10000A170();
  uint64_t v18 = *(void *)(v17 - 8);
  uint64_t v19 = *(void *)(v18 + 64);
  uint64_t v20 = __chkstk_darwin(v17);
  uint64_t v21 = __chkstk_darwin(v20);
  v136 = (void (**)(char *, char *, uint64_t))((char *)v105 - v22);
  __chkstk_darwin(v21);
  v135 = (Class (**)(uint64_t))((char *)v105 - v23);
  uint64_t v24 = *(void *)(a1 + 16);
  uint64_t v149 = v6;
  v140 = (void (**)(char *, uint64_t))v10;
  if (v24)
  {
    uint64_t v145 = v24;
    uint64_t v106 = v11;
    *(void *)&long long v133 = sub_100009C7C(0, &qword_100010108);
    uint64_t v26 = *(void (**)(uint64_t, uint64_t, uint64_t))(v18 + 16);
    uint64_t v25 = v18 + 16;
    v132 = v26;
    uint64_t v27 = *(unsigned __int8 *)(v25 + 64);
    uint64_t v28 = a1 + ((v27 + 32) & ~v27);
    uint64_t v131 = *(void *)(v25 + 56);
    v130 = (void (**)(char *, void, uint64_t))(v143 + 104);
    v129 = (void (**)(char *, uint64_t))(v143 + 8);
    LODWORD(v127) = enum case for CoreAnalyticsEvents.taskStatusTelemetry(_:);
    v128 = (Class (**)(uint64_t))((v27 + 16) & ~v27);
    v126 = (uint8_t *)v128 + v19;
    v125 = (uint64_t *)(v27 | 7);
    *(void *)&long long v124 = v25 + 16;
    v123 = &v153;
    v122 = (void (**)(void (**)(char *, char *, uint64_t), uint64_t))(v25 - 8);
    v114 = (void (**)(char *, uint64_t))(v14 + 8);
    p_uint64_t aBlock = &aBlock;
    v105[1] = a1;
    swift_bridgeObjectRetain();
    *(void *)&long long v29 = 136315394;
    long long v112 = v29;
    v111 = (char *)&type metadata for Any + 8;
    v134 = (void (**)(char *, uint64_t))v25;
    v144 = (void (**)(char *, char *, uint64_t))((char *)v105 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0));
    uint64_t v115 = v17;
    do
    {
      uint64_t v31 = (uint64_t)v135;
      Class v32 = v132;
      v132((uint64_t)v135, v28, v17);
      id v33 = sub_100006878(v31);
      [v137 sendEvent:v33];

      Class v35 = v147;
      uint64_t v34 = v148;
      (*v130)(v147, v127, v148);
      sub_10000A2B0();
      (*v129)(v35, v34);
      NSString v36 = sub_10000A3F0();
      swift_bridgeObjectRelease();
      v32(v31, v28, v17);
      uint64_t v37 = swift_allocObject();
      (*(void (**)(char *, uint64_t, uint64_t))v124)((char *)v128 + v37, v31, v17);
      v155 = sub_100009C0C;
      uint64_t v156 = v37;
      uint64_t aBlock = (uint64_t)_NSConcreteStackBlock;
      uint64_t v152 = 1107296256;
      v153 = sub_1000067DC;
      v154 = &unk_10000CBA0;
      uint64_t v38 = _Block_copy(&aBlock);
      swift_release();
      AnalyticsSendEventLazy();
      _Block_release(v38);

      if (qword_100010130 != -1) {
        swift_once();
      }
      uint64_t v39 = sub_10000A3C0();
      sub_100009A1C(v39, (uint64_t)qword_100010740);
      Class v40 = v136;
      v32((uint64_t)v136, v28, v17);
      Class v41 = v144;
      v32((uint64_t)v144, v28, v17);
      Class v42 = sub_10000A3A0();
      os_log_type_t v43 = sub_10000A460();
      int v44 = v43;
      if (os_log_type_enabled(v42, v43))
      {
        uint64_t v45 = swift_slowAlloc();
        uint64_t v121 = swift_slowAlloc();
        uint64_t aBlock = v121;
        *(_DWORD *)uint64_t v45 = v112;
        NSString v46 = v40;
        Class v47 = v116;
        sub_10000A0D0();
        uint64_t v48 = sub_10000A180();
        unint64_t v50 = v49;
        (*v114)(v47, v117);
        uint64_t v150 = sub_1000074F0(v48, v50, &aBlock);
        int v120 = v44;
        sub_10000A480();
        swift_bridgeObjectRelease();
        uint64_t v51 = *v122;
        uint64_t v52 = v46;
        uint64_t v17 = v115;
        (*v122)(v52, v115);
        *(_WORD *)(v45 + 12) = 2080;
        uint64_t v119 = v45 + 14;
        sub_10000A130();
        sub_100009C7C(0, &qword_1000100F8);
        uint64_t v53 = sub_10000A3E0();
        unint64_t v55 = v54;
        swift_bridgeObjectRelease();
        uint64_t v56 = v53;
        uint64_t v10 = (uint64_t)v140;
        uint64_t v150 = sub_1000074F0(v56, v55, &aBlock);
        sub_10000A480();
        v57 = v144;
        swift_bridgeObjectRelease();
        v51(v57, v17);
        _os_log_impl((void *)&_mh_execute_header, v42, (os_log_type_t)v120, "%s Output: %s", (uint8_t *)v45, 0x16u);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {

        v30 = *v122;
        (*v122)(v41, v17);
        v30(v40, v17);
      }
      v28 += v131;
      --v145;
    }
    while (v145);
    swift_bridgeObjectRelease();
    uint64_t v11 = v106;
  }
  uint64_t v58 = v109;
  uint64_t v59 = *(void *)(v109 + 16);
  v60 = v146;
  if (v59)
  {
    id v137 = (id)sub_100009C7C(0, &qword_100010110);
    v61 = *(char **)(v118 + 16);
    uint64_t v62 = *(unsigned __int8 *)(v118 + 80);
    uint64_t v63 = v58 + ((v62 + 32) & ~v62);
    v136 = *(void (***)(char *, char *, uint64_t))(v118 + 72);
    v135 = (Class (**)(uint64_t))(v143 + 104);
    v134 = (void (**)(char *, uint64_t))(v143 + 8);
    LODWORD(v132) = enum case for CoreAnalyticsEvents.deviceStatusTelemetry(_:);
    *(void *)&long long v133 = (v62 + 16) & ~v62;
    uint64_t v131 = v133 + v11;
    v130 = (void (**)(char *, void, uint64_t))(v62 | 7);
    v129 = (void (**)(char *, uint64_t))(v118 + 32);
    v128 = &v153;
    uint64_t v64 = v118 + 16;
    v127 = (void (**)(char *, uint64_t))(v118 + 8);
    v125 = &aBlock;
    swift_bridgeObjectRetain();
    *(void *)&long long v65 = 136315138;
    long long v124 = v65;
    v123 = (Class (**)(uint64_t))((char *)&type metadata for Any + 8);
    uint64_t v118 = v64;
    v144 = (void (**)(char *, char *, uint64_t))v61;
    do
    {
      uint64_t v145 = v59;
      uint64_t v66 = (uint64_t)v138;
      ((void (*)(char *, uint64_t, uint64_t))v61)(v138, v63, v10);
      id v67 = sub_100006C1C(v66);
      [v141 sendEvent:v67];

      v69 = v147;
      uint64_t v68 = v148;
      ((void (*)(char *, void, uint64_t))*v135)(v147, v132, v148);
      sub_10000A2B0();
      v70 = v69;
      v61 = (char *)v144;
      (*v134)(v70, v68);
      NSString v71 = sub_10000A3F0();
      swift_bridgeObjectRelease();
      ((void (*)(uint64_t, uint64_t, uint64_t))v61)(v66, v63, v10);
      uint64_t v72 = swift_allocObject();
      ((void (*)(void, uint64_t, uint64_t))*v129)(v72 + v133, v66, v10);
      v155 = sub_100009D68;
      uint64_t v156 = v72;
      uint64_t aBlock = (uint64_t)_NSConcreteStackBlock;
      uint64_t v152 = 1107296256;
      v153 = sub_1000067DC;
      v154 = &unk_10000CC40;
      v73 = _Block_copy(&aBlock);
      swift_release();
      AnalyticsSendEventLazy();
      _Block_release(v73);

      if (qword_100010130 != -1) {
        swift_once();
      }
      uint64_t v74 = sub_10000A3C0();
      sub_100009A1C(v74, (uint64_t)qword_100010740);
      v75 = v139;
      ((void (*)(char *, uint64_t, uint64_t))v61)(v139, v63, v10);
      v76 = sub_10000A3A0();
      os_log_type_t v77 = sub_10000A460();
      if (os_log_type_enabled(v76, v77))
      {
        v78 = (uint8_t *)swift_slowAlloc();
        uint64_t aBlock = swift_slowAlloc();
        *(_DWORD *)v78 = v124;
        v126 = v78 + 4;
        sub_10000A200();
        sub_100009C7C(0, &qword_1000100F8);
        uint64_t v79 = sub_10000A3E0();
        unint64_t v81 = v80;
        swift_bridgeObjectRelease();
        uint64_t v82 = v79;
        uint64_t v10 = (uint64_t)v140;
        uint64_t v150 = sub_1000074F0(v82, v81, &aBlock);
        sub_10000A480();
        v60 = v146;
        swift_bridgeObjectRelease();
        v61 = (char *)v144;
        (*v127)(v75, v10);
        _os_log_impl((void *)&_mh_execute_header, v76, v77, "Device Telemetry Output: %s", v78, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {

        (*v127)(v75, v10);
      }
      v63 += (uint64_t)v136;
      uint64_t v59 = v145 - 1;
    }
    while (v145 != 1);
    swift_bridgeObjectRelease();
  }
  uint64_t result = v110;
  uint64_t v84 = *(void *)(v110 + 16);
  if (v84)
  {
    uint64_t v85 = *(unsigned __int8 *)(v108 + 80);
    uint64_t v86 = v110 + ((v85 + 32) & ~v85);
    uint64_t v145 = *(void *)(v108 + 72);
    LODWORD(v144) = enum case for CoreAnalyticsEvents.pushTaskTelemetry(_:);
    v87 = *(void **)(v143 + 104);
    v143 += 104;
    v140 = (void (**)(char *, uint64_t))(v143 - 96);
    id v141 = v87;
    v88 = (void (**)(char *, uint64_t, uint64_t))(v108 + 16);
    v138 = (char *)(((v85 + 16) & ~v85) + v107);
    v139 = (char *)((v85 + 16) & ~v85);
    id v137 = (id)(v85 | 7);
    v136 = (void (**)(char *, char *, uint64_t))(v108 + 32);
    v135 = &v153;
    v134 = (void (**)(char *, uint64_t))(v108 + 8);
    swift_bridgeObjectRetain();
    *(void *)&long long v89 = 136315138;
    long long v133 = v89;
    v132 = (void (*)(uint64_t, uint64_t, uint64_t))((char *)&type metadata for Any + 8);
    do
    {
      v91 = v147;
      uint64_t v90 = v148;
      ((void (*)(char *, void, uint64_t))v141)(v147, v144, v148);
      sub_10000A2B0();
      (*v140)(v91, v90);
      NSString v92 = sub_10000A3F0();
      swift_bridgeObjectRelease();
      v93 = *v88;
      v94 = v142;
      uint64_t v95 = v149;
      (*v88)(v142, v86, v149);
      uint64_t v96 = swift_allocObject();
      (*v136)(&v139[v96], v94, v95);
      v155 = sub_100009C50;
      uint64_t v156 = v96;
      uint64_t aBlock = (uint64_t)_NSConcreteStackBlock;
      uint64_t v152 = 1107296256;
      v153 = sub_1000067DC;
      v154 = &unk_10000CBF0;
      v97 = _Block_copy(&aBlock);
      swift_release();
      AnalyticsSendEventLazy();
      _Block_release(v97);

      if (qword_100010130 != -1) {
        swift_once();
      }
      uint64_t v98 = sub_10000A3C0();
      sub_100009A1C(v98, (uint64_t)qword_100010740);
      v93(v60, v86, v149);
      v99 = sub_10000A3A0();
      os_log_type_t v100 = sub_10000A460();
      if (os_log_type_enabled(v99, v100))
      {
        uint64_t v101 = swift_slowAlloc();
        uint64_t aBlock = swift_slowAlloc();
        *(_DWORD *)uint64_t v101 = v133;
        sub_10000A080();
        sub_100009C7C(0, &qword_1000100F8);
        uint64_t v102 = sub_10000A3E0();
        unint64_t v104 = v103;
        swift_bridgeObjectRelease();
        *(void *)(v101 + 4) = sub_1000074F0(v102, v104, &aBlock);
        swift_bridgeObjectRelease();
        (*v134)(v146, v149);
        _os_log_impl((void *)&_mh_execute_header, v99, v100, "Push Telemetry Output: %s", (uint8_t *)v101, 0xCu);
        swift_arrayDestroy();
        v60 = v146;
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {

        (*v134)(v60, v149);
      }
      v86 += v145;
      --v84;
    }
    while (v84);
    return swift_bridgeObjectRelease();
  }
  return result;
}

void sub_10000984C(void *a1@<X8>)
{
  id v2 = [(id)BiomeLibrary() Lighthouse];
  swift_unknownObjectRelease();
  id v3 = [v2 Ledger];
  swift_unknownObjectRelease();
  id v4 = [v3 TaskTelemetry];
  swift_unknownObjectRelease();
  id v5 = [v4 source];

  id v6 = [(id)BiomeLibrary() Lighthouse];
  swift_unknownObjectRelease();
  id v7 = [v6 Ledger];
  swift_unknownObjectRelease();
  id v8 = [v7 DeviceTelemetry];
  swift_unknownObjectRelease();
  id v9 = [v8 source];

  *a1 = 0xD000000000000010;
  a1[1] = 0x800000010000AD50;
  a1[2] = 0xD000000000000017;
  a1[3] = 0x800000010000AD70;
  a1[4] = v5;
  a1[5] = v9;
}

uint64_t sub_1000099D8(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100009A1C(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

unint64_t sub_100009A54()
{
  unint64_t result = qword_1000100E0;
  if (!qword_1000100E0)
  {
    sub_10000A040();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000100E0);
  }
  return result;
}

unint64_t sub_100009AAC()
{
  unint64_t result = qword_1000100E8;
  if (!qword_1000100E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000100E8);
  }
  return result;
}

unint64_t sub_100009B00()
{
  unint64_t result = qword_1000100F0;
  if (!qword_1000100F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000100F0);
  }
  return result;
}

uint64_t sub_100009B54()
{
  return sub_100009CD0((uint64_t (*)(void))&type metadata accessor for CustomEventAnalytics);
}

uint64_t sub_100009B6C()
{
  return sub_100009D94((void (*)(void))&type metadata accessor for CustomEventAnalytics, (uint64_t (*)(void))&CustomEventAnalytics.coreAnalyticsDictionary.getter);
}

uint64_t sub_100009B98(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100009BA8()
{
  return swift_release();
}

uint64_t sub_100009BB0()
{
  return sub_100009CD0((uint64_t (*)(void))&type metadata accessor for DediscoAnalytics);
}

uint64_t sub_100009BC8()
{
  return sub_100009D94((void (*)(void))&type metadata accessor for DediscoAnalytics, (uint64_t (*)(void))&DediscoAnalytics.coreAnalyticsDictionary.getter);
}

uint64_t sub_100009BF4()
{
  return sub_100009CD0((uint64_t (*)(void))&type metadata accessor for TaskTelemetry);
}

uint64_t sub_100009C0C()
{
  return sub_100009D94((void (*)(void))&type metadata accessor for TaskTelemetry, (uint64_t (*)(void))&TaskTelemetry.coreAnalyticsDictionary.getter);
}

uint64_t sub_100009C38()
{
  return sub_100009CD0((uint64_t (*)(void))&type metadata accessor for PushTelemetry);
}

uint64_t sub_100009C50()
{
  return sub_100009D94((void (*)(void))&type metadata accessor for PushTelemetry, (uint64_t (*)(void))&PushTelemetry.coreAnalyticsDictionary.getter);
}

uint64_t sub_100009C7C(uint64_t a1, unint64_t *a2)
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

uint64_t sub_100009CB8()
{
  return sub_100009CD0((uint64_t (*)(void))&type metadata accessor for DeviceTelemetry);
}

uint64_t sub_100009CD0(uint64_t (*a1)(void))
{
  uint64_t v2 = a1(0);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(unsigned __int8 *)(v3 + 80);
  uint64_t v5 = (v4 + 16) & ~v4;
  uint64_t v6 = v5 + *(void *)(v3 + 64);
  uint64_t v7 = v4 | 7;
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1 + v5, v2);

  return _swift_deallocObject(v1, v6, v7);
}

uint64_t sub_100009D68()
{
  return sub_100009D94((void (*)(void))&type metadata accessor for DeviceTelemetry, (uint64_t (*)(void))&DeviceTelemetry.coreAnalyticsDictionary.getter);
}

uint64_t sub_100009D94(void (*a1)(void), uint64_t (*a2)(void))
{
  return a2();
}

uint64_t sub_100009E00(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_1000099D8(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_100009E5C(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_100009EAC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t *sub_100009F0C(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_100009F90()
{
  return Date.addingTimeInterval(_:)();
}

NSDate sub_100009FA0()
{
  return Date._bridgeToObjectiveC()();
}

uint64_t sub_100009FB0()
{
  return type metadata accessor for Date();
}

uint64_t sub_100009FC0()
{
  return UUID.uuidString.getter();
}

uint64_t sub_100009FD0()
{
  return UUID.init()();
}

uint64_t sub_100009FE0()
{
  return type metadata accessor for UUID();
}

uint64_t sub_100009FF0()
{
  return static AppExtension.main()();
}

uint64_t sub_10000A000()
{
  return dispatch thunk of LedgerClient.getCustomTaskEvents(startDate:endDate:taskName:)();
}

uint64_t sub_10000A010()
{
  return dispatch thunk of LedgerClient.getTaskStatusEvents(startDate:endDate:)();
}

uint64_t sub_10000A020()
{
  return dispatch thunk of LedgerClient.sendCustomTaskEvent<A>(state:context:)();
}

uint64_t sub_10000A030()
{
  return LedgerClient.__allocating_init()();
}

uint64_t sub_10000A040()
{
  return type metadata accessor for LedgerClient();
}

uint64_t sub_10000A050()
{
  return MLHostResult.init(error:policy:)();
}

uint64_t sub_10000A060()
{
  return MLHostResult.init(status:policy:)();
}

uint64_t sub_10000A070()
{
  return type metadata accessor for MLHostResult();
}

uint64_t sub_10000A080()
{
  return PushTelemetry.coreAnalyticsDictionary.getter();
}

uint64_t sub_10000A090()
{
  return type metadata accessor for PushTelemetry();
}

uint64_t sub_10000A0A0()
{
  return TaskTelemetry.bucketRange.getter();
}

uint64_t sub_10000A0B0()
{
  return TaskTelemetry.countFailed.getter();
}

uint64_t sub_10000A0C0()
{
  return TaskTelemetry.countDeferred.getter();
}

uint64_t sub_10000A0D0()
{
  return TaskTelemetry.bucketInterval.getter();
}

uint64_t sub_10000A0E0()
{
  return TaskTelemetry.countCompleted.getter();
}

uint64_t sub_10000A0F0()
{
  return TaskTelemetry.crossExecutionDelay.getter();
}

uint64_t sub_10000A100()
{
  return TaskTelemetry.executionFailureTime.getter();
}

uint64_t sub_10000A110()
{
  return TaskTelemetry.latestEventTimestamp.getter();
}

uint64_t sub_10000A120()
{
  return TaskTelemetry.dailyExecutionLatency.getter();
}

uint64_t sub_10000A130()
{
  return TaskTelemetry.coreAnalyticsDictionary.getter();
}

uint64_t sub_10000A140()
{
  return TaskTelemetry.executionCompletionTime.getter();
}

uint64_t sub_10000A150()
{
  return TaskTelemetry.taskName.getter();
}

uint64_t sub_10000A160()
{
  return TaskTelemetry.taskState.getter();
}

uint64_t sub_10000A170()
{
  return type metadata accessor for TaskTelemetry();
}

uint64_t sub_10000A180()
{
  return BucketInterval.description.getter();
}

uint64_t sub_10000A190()
{
  return type metadata accessor for BucketInterval();
}

uint64_t sub_10000A1A0()
{
  return getDediscoData(dediscoStream:telemetryRange:)();
}

uint64_t sub_10000A1B0()
{
  return DeviceTelemetry.tasksCount.getter();
}

uint64_t sub_10000A1C0()
{
  return DeviceTelemetry.bucketRange.getter();
}

uint64_t sub_10000A1D0()
{
  return DeviceTelemetry.tasksFailed.getter();
}

uint64_t sub_10000A1E0()
{
  return DeviceTelemetry.tasksDeferred.getter();
}

uint64_t sub_10000A1F0()
{
  return DeviceTelemetry.tasksCompleted.getter();
}

uint64_t sub_10000A200()
{
  return DeviceTelemetry.coreAnalyticsDictionary.getter();
}

uint64_t sub_10000A210()
{
  return DeviceTelemetry.tasksRun.getter();
}

uint64_t sub_10000A220()
{
  return type metadata accessor for DeviceTelemetry();
}

uint64_t sub_10000A260()
{
  return TelemetryConfig.init(bucketInterval:contextId:deviceTelemetry:pushTelemetry:)();
}

uint64_t sub_10000A270()
{
  return type metadata accessor for TelemetryConfig();
}

uint64_t sub_10000A280()
{
  return DediscoAnalytics.coreAnalyticsDictionary.getter();
}

uint64_t sub_10000A290()
{
  return type metadata accessor for DediscoAnalytics();
}

uint64_t sub_10000A2A0()
{
  return currentDataVersion.getter();
}

uint64_t sub_10000A2B0()
{
  return CoreAnalyticsEvents.rawValue.getter();
}

uint64_t sub_10000A2C0()
{
  return type metadata accessor for CoreAnalyticsEvents();
}

uint64_t sub_10000A2D0()
{
  return CustomEventAnalytics.coreAnalyticsDictionary.getter();
}

uint64_t sub_10000A2E0()
{
  return type metadata accessor for CustomEventAnalytics();
}

uint64_t sub_10000A2F0()
{
  return TelemetryBucketRange.endTimestamp.getter();
}

uint64_t sub_10000A300()
{
  return TelemetryBucketRange.startTimestamp.getter();
}

uint64_t sub_10000A310()
{
  return TelemetryBucketRange.telemetryEndDate.getter();
}

uint64_t sub_10000A320()
{
  return TelemetryBucketRange.telemetryStartDate.getter();
}

uint64_t sub_10000A330()
{
  return TelemetryBucketRange.init(from:)();
}

uint64_t sub_10000A340()
{
  return type metadata accessor for TelemetryBucketRange();
}

uint64_t sub_10000A370()
{
  return MLHostExtensionContext.taskId.getter();
}

uint64_t sub_10000A380()
{
  return MLHostExtensionContext.taskName.getter();
}

uint64_t sub_10000A3A0()
{
  return Logger.logObject.getter();
}

uint64_t sub_10000A3B0()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_10000A3C0()
{
  return type metadata accessor for Logger();
}

NSDictionary sub_10000A3D0()
{
  return Dictionary._bridgeToObjectiveC()();
}

uint64_t sub_10000A3E0()
{
  return Dictionary.description.getter();
}

NSString sub_10000A3F0()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_10000A400()
{
  return String.hash(into:)();
}

Swift::Int sub_10000A410()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_10000A420()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

NSNumber sub_10000A430()
{
  return Double._bridgeToObjectiveC()();
}

NSNumber sub_10000A440()
{
  return Int._bridgeToObjectiveC()();
}

uint64_t sub_10000A450()
{
  return static os_log_type_t.info.getter();
}

uint64_t sub_10000A460()
{
  return static os_log_type_t.debug.getter();
}

uint64_t sub_10000A470()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_10000A480()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_10000A490()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_10000A4A0()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_10000A4B0()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_10000A4C0()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_10000A4D0()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

Swift::Int sub_10000A4E0(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases, string);
}

uint64_t sub_10000A4F0()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
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

Swift::Int sub_10000A550()
{
  return Hasher._finalize()();
}

NSNumber sub_10000A560()
{
  return UInt32._bridgeToObjectiveC()();
}

uint64_t AnalyticsSendEventLazy()
{
  return _AnalyticsSendEventLazy();
}

uint64_t BiomeLibrary()
{
  return _BiomeLibrary();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_release(const void *aBlock)
{
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

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
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

uint64_t os_variant_has_internal_content()
{
  return _os_variant_has_internal_content();
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

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return _swift_getTypeByMangledNameInContextInMetadataState2();
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