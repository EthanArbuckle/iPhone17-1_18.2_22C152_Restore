int main(int argc, const char **argv, const char **envp)
{
  os_log_t v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v9;
  NSObject *v10;
  int v11;
  _DWORD v12[2];

  v3 = os_log_create("com.apple.speech.localspeechrecognition", "xpcservice");
  v4 = (void *)qword_100065420;
  qword_100065420 = (uint64_t)v3;

  unsetenv("TMPDIR");
  if ((_set_user_dir_suffix() & 1) == 0)
  {
    v9 = (void *)qword_100065420;
    if (os_log_type_enabled((os_log_t)qword_100065420, OS_LOG_TYPE_FAULT))
    {
      v10 = v9;
      v11 = *__error();
      v12[0] = 67109120;
      v12[1] = v11;
      _os_log_fault_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_FAULT, "_set_user_dir_suffix failed™: %{darwin.errno}d", (uint8_t *)v12, 8u);
    }
    exit(1);
  }
  v5 = NSTemporaryDirectory();
  +[LSRConnection captureProcessStartTime];
  AFLogInitIfNeeded();
  SFLogInitIfNeeded();
  v6 = objc_opt_new();
  v7 = +[NSXPCListener serviceListener];
  [v7 setDelegate:v6];
  [v7 resume];

  return 0;
}

void *sub_100005D48()
{
  type metadata accessor for Instrumentation();
  uint64_t v0 = swift_allocObject();
  result = sub_100006D8C();
  qword_100064670 = v0;
  return result;
}

uint64_t variable initialization expression of Instrumentation.selfLogger()
{
  type metadata accessor for SelfLoggingHelper();
  uint64_t v0 = sub_100008324();
  *(void *)(v0 + 16) = [self sharedStream];
  return v0;
}

uint64_t variable initialization expression of Instrumentation.signpostLogger()
{
  return sub_100008AC8();
}

uint64_t variable initialization expression of Instrumentation.powerLogger()
{
  type metadata accessor for PowerlogHelper();

  return swift_allocObject();
}

uint64_t variable initialization expression of Instrumentation.coreAnalyticsLogger()
{
  type metadata accessor for CoreAnalyticsLoggingHelper();

  return swift_allocObject();
}

uint64_t variable initialization expression of Instrumentation.ondeviceRecordLogger()
{
  return sub_100010808();
}

BOOL sub_100005EA8(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

BOOL sub_100005EB4(char a1, char a2)
{
  return a1 == a2;
}

void sub_100005EC4()
{
  sub_1000082B4();
  unint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t v9 = sub_100007A58((uint64_t *)&unk_100063F60);
  uint64_t v10 = sub_1000082F8(v9);
  __chkstk_darwin(v10);
  sub_100008250();
  uint64_t v13 = v12 - v11;
  uint64_t v14 = sub_100040F20();
  sub_100008220();
  uint64_t v16 = v15;
  __chkstk_darwin(v17);
  sub_100008260();
  sub_100007A9C(v8, v13);
  if (sub_100007B04(v13, 1, v14) == 1)
  {
    sub_100007B2C(v13);
  }
  else
  {
    sub_1000082CC();
    v18();
    sub_10000DDD4(v0, v6, v4, v2);
    (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v0, v14);
  }
  if (v2 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v19 = sub_1000416B0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v19 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  if (v19 == 2)
  {
    unint64_t v20 = v2 & 0xC000000000000001;
    sub_10002EB08(0, (v2 & 0xC000000000000001) == 0);
    if ((v2 & 0xC000000000000001) != 0) {
      id v21 = (id)sub_100041590();
    }
    else {
      id v21 = *(id *)(v2 + 32);
    }
    v22 = v21;
    sub_10002EB08(1, v20 == 0);
    if (v20) {
      id v23 = (id)sub_100041590();
    }
    else {
      id v23 = *(id *)(v2 + 40);
    }
    v28 = v23;
    id v29 = [v22 startedOrChanged];
    if (v29)
    {
      v30 = v29;
      if (([v29 exists] & 1) == 0) {
        goto LABEL_23;
      }
      sub_100008304();
      uint64_t v36 = v31;
      v37._countAndFlagsBits = sub_10000CE18();
      sub_100041230(v37);
      swift_bridgeObjectRelease();
      uint64_t v32 = sub_10000CEE4();
      sub_100008C30("ES: ANE Model Init", 18, 2, v36, 0xE90000000000003DLL, v32);
      swift_bridgeObjectRelease();
      id v33 = [v28 ended];
      if (v33)
      {
        v34 = v33;
        if ([v33 exists])
        {
          v38._countAndFlagsBits = sub_10000CE18();
          sub_100041230(v38);
          swift_bridgeObjectRelease();
          uint64_t v35 = sub_10000CEE4();
          sub_100009388((unint64_t)"ES: ANE Model Init", 18, 2, 0x656D616E656C6946, 0xE90000000000003DLL, v35);
          swift_bridgeObjectRelease();
        }
      }
      else
      {
LABEL_23:
      }
    }
    else
    {
    }
  }
  else if (v19 >= 1)
  {
    if (qword_1000621B8 != -1) {
      swift_once();
    }
    uint64_t v24 = sub_1000410D0();
    sub_100007B8C(v24, (uint64_t)qword_100064678);
    swift_bridgeObjectRetain();
    v25 = sub_1000410C0();
    os_log_type_t v26 = sub_100041380();
    if (os_log_type_enabled(v25, v26))
    {
      v27 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)v27 = 134217984;
      sub_100041450();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v25, v26, "Unexpected pending ane model initialization event count %ld", v27, 0xCu);
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease();
    }
  }
  sub_1000082D8();
}

void sub_100006310()
{
}

void sub_10000633C()
{
}

void sub_100006368()
{
  sub_1000082B4();
  os_log_type_t v26 = v1;
  v27 = v2;
  v25 = v3;
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  uint64_t v11 = v10;
  uint64_t v13 = v12;
  uint64_t v14 = sub_100007A58((uint64_t *)&unk_100063F60);
  uint64_t v15 = sub_1000082F8(v14);
  __chkstk_darwin(v15);
  uint64_t v16 = sub_10000828C();
  sub_100008220();
  uint64_t v18 = v17;
  __chkstk_darwin(v19);
  sub_100008250();
  uint64_t v22 = v21 - v20;
  sub_100007A9C(v13, v0);
  if (sub_100007B04(v0, 1, v16) == 1)
  {
    sub_100007B2C(v0);
  }
  else
  {
    sub_1000082CC();
    v23();
    v25(v22, v11, v9, v7);
    (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v22, v16);
  }
  sub_100008304();
  uint64_t v28 = v24;
  v29._countAndFlagsBits = v5;
  v29._object = v26;
  sub_100041230(v29);
  v27("ES: ANE Model Init", 18, 2, v28, 0xE90000000000003DLL, v7);
  swift_bridgeObjectRelease();
  sub_1000082D8();
}

void sub_10000650C()
{
}

void sub_100006540()
{
}

void sub_100006574()
{
}

void sub_1000065AC()
{
  sub_1000082B4();
  id v23 = v2;
  uint64_t v24 = v3;
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  uint64_t v11 = v10;
  uint64_t v22 = v12;
  uint64_t v14 = v13;
  uint64_t v15 = sub_100007A58((uint64_t *)&unk_100063F60);
  uint64_t v16 = sub_1000082F8(v15);
  __chkstk_darwin(v16);
  uint64_t v17 = sub_10000828C();
  sub_100008220();
  uint64_t v19 = v18;
  __chkstk_darwin(v20);
  sub_100008260();
  sub_100007A9C(v14, v1);
  if (sub_100007B04(v1, 1, v17) == 1)
  {
    sub_100007B2C(v1);
  }
  else
  {
    sub_1000082CC();
    v21();
    v23(v0, v22, v11, v9);
    (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v0, v17);
  }
  v24(v7, v5, 2, 0, 0xE000000000000000, v9);
  sub_1000082D8();
}

void sub_100006714()
{
  sub_1000082B4();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  uint64_t v11 = sub_100007A58((uint64_t *)&unk_100063F60);
  uint64_t v12 = sub_1000082F8(v11);
  __chkstk_darwin(v12);
  sub_100008260();
  uint64_t v13 = sub_100040F20();
  sub_100008220();
  uint64_t v15 = v14;
  __chkstk_darwin(v16);
  sub_100008250();
  uint64_t v19 = v18 - v17;
  sub_100007A9C(v10, v0);
  if (sub_100007B04(v0, 1, v13) == 1)
  {
    sub_100007B2C(v0);
  }
  else
  {
    sub_1000082CC();
    v20();
    sub_10000E1E0(v19, v8, v6, v4, v2);
    (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v19, v13);
  }
  sub_100009388((unint64_t)"ES: JIT Profile Build Load", 26, 2, 0, 0xE000000000000000, v4);
  sub_1000082D8();
}

uint64_t sub_10000687C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, unint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, double a9, void *a10, char a11, uint64_t a12, void *a13, uint64_t a14, void *a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20,char a21,uint64_t a22,unsigned __int8 a23)
{
  uint64_t v29 = sub_100007A58((uint64_t *)&unk_100063F60);
  uint64_t v30 = sub_1000082F8(v29);
  __chkstk_darwin(v30);
  sub_100008250();
  uint64_t v33 = v32 - v31;
  uint64_t v34 = sub_100040F20();
  sub_100008220();
  uint64_t v36 = v35;
  __chkstk_darwin(v37);
  sub_100008250();
  uint64_t v40 = v39 - v38;
  sub_100007A9C(a1, v33);
  if (sub_100007B04(v33, 1, v34) == 1)
  {
    uint64_t v41 = (uint64_t)a10;
    sub_100007B2C(v33);
  }
  else
  {
    sub_1000082CC();
    v42();
    uint64_t v41 = (uint64_t)a10;
    sub_10000E3AC(v40, a2, a3, a9, a6, a7, a8, a10, a11 & 1, a12, a13, a14, a15, a16 & 1, a17, a18, a19, a20, a21 & 1,
      a22,
      a23);
    (*(void (**)(uint64_t, uint64_t))(v36 + 8))(v40, v34);
  }
  uint64_t v43 = a4;
  uint64_t v44 = HIBYTE(a5) & 0xF;
  if ((a5 & 0x2000000000000000) == 0) {
    uint64_t v44 = a4 & 0xFFFFFFFFFFFFLL;
  }
  if (v44)
  {
    swift_bridgeObjectRetain();
  }
  else
  {
    a5 = 0x800000010004B9D0;
    uint64_t v43 = 0xD000000000000018;
  }
  sub_10000FDC0(v43, a5, a6, a7, a8, v41);
  return swift_bridgeObjectRelease();
}

rusage_info_t sub_100006B3C()
{
  bzero(v2, 0x128uLL);
  pid_t v0 = getpid();
  proc_pid_rusage(v0, 4, v2);
  return v2[31];
}

uint64_t sub_100006BAC(unint64_t a1)
{
  if (a1 >= 6) {
    return 5;
  }
  else {
    return (0x40302010005uLL >> (8 * a1));
  }
}

uint64_t sub_100006BD0(unsigned __int8 a1)
{
  return a1 + 1;
}

BOOL sub_100006BDC(char *a1, char *a2)
{
  return sub_100005EB4(*a1, *a2);
}

Swift::Int sub_100006BE8()
{
  return sub_100006BF0(*v0);
}

Swift::Int sub_100006BF0(unsigned __int8 a1)
{
  return sub_1000417A0();
}

void sub_100006C3C(uint64_t a1)
{
  sub_100006C44(a1, *v1);
}

void sub_100006C44(uint64_t a1, unsigned __int8 a2)
{
}

Swift::Int sub_100006C70(uint64_t a1)
{
  return sub_100006C78(a1, *v1);
}

Swift::Int sub_100006C78(uint64_t a1, unsigned __int8 a2)
{
  return sub_1000417A0();
}

uint64_t sub_100006CC0@<X0>(unint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_100006BAC(*a1);
  *a2 = result;
  return result;
}

uint64_t sub_100006CEC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100006BD0(*v1);
  *a1 = result;
  return result;
}

uint64_t Instrumentation.deinit()
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return v0;
}

uint64_t Instrumentation.__deallocating_deinit()
{
  Instrumentation.deinit();

  return _swift_deallocClassInstance(v0, 56, 7);
}

void *sub_100006D8C()
{
  uint64_t v1 = v0;
  type metadata accessor for SelfLoggingHelper();
  uint64_t v2 = sub_100008324();
  *(void *)(v2 + 16) = [self sharedStream];
  v1[2] = v2;
  type metadata accessor for SignpostHelper();
  swift_allocObject();
  v1[3] = sub_100008AC8();
  type metadata accessor for PowerlogHelper();
  v1[4] = swift_allocObject();
  type metadata accessor for CoreAnalyticsLoggingHelper();
  v1[5] = swift_allocObject();
  type metadata accessor for OndeviceRecordHelper();
  sub_100008324();
  v1[6] = sub_100010808();
  return v1;
}

double variable initialization expression of RequestEndMetrics.cpuRealTimeFactor()
{
  return 0.0;
}

uint64_t variable initialization expression of RequestEndMetrics.numLmeDataStreams()
{
  return sub_100008318(0);
}

uint64_t variable initialization expression of RequestEndMetrics.totalITNRuns()
{
  return sub_100008318(1);
}

uint64_t RequestEndMetrics.deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t RequestEndMetrics.__deallocating_deinit()
{
  RequestEndMetrics.deinit();

  return _swift_deallocClassInstance(v0, 365, 7);
}

uint64_t type metadata accessor for Instrumentation()
{
  return self;
}

uint64_t type metadata accessor for RequestEndMetrics()
{
  return self;
}

void type metadata accessor for SFEntitledAssetType(uint64_t a1)
{
}

unsigned char *initializeBufferWithCopyOfBuffer for Instrumentation.CompletionState(unsigned char *result, unsigned char *a2)
{
  void *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for Instrumentation.CompletionState(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFC)
  {
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
      if (!v4) {
        goto LABEL_17;
      }
    }
    else if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
    }
    else
    {
      int v4 = a1[1];
      if (!a1[1]) {
        goto LABEL_17;
      }
    }
    int v5 = (*a1 | (v4 << 8)) - 5;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 5;
  int v5 = v6 - 5;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for Instrumentation.CompletionState(unsigned char *result, unsigned int a2, unsigned int a3)
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
    void *result = a2 + 4;
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
        JUMPOUT(0x100007100);
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
          void *result = a2 + 4;
        break;
    }
  }
  return result;
}

uint64_t sub_100007128(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_100007134(unsigned char *result, char a2)
{
  void *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for Instrumentation.CompletionState()
{
  return &type metadata for Instrumentation.CompletionState;
}

void type metadata accessor for os_unfair_lock_s(uint64_t a1)
{
}

unint64_t sub_100007164()
{
  unint64_t result = qword_100062C20;
  if (!qword_100062C20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100062C20);
  }
  return result;
}

uint64_t sub_1000071B0(uint64_t a1)
{
  uint64_t v2 = sub_100007C7C(&qword_100062C60, type metadata accessor for SFSpeechError);

  return Error<>._domain.getter(a1, v2);
}

uint64_t sub_10000721C(uint64_t a1)
{
  uint64_t v2 = sub_100007C7C(&qword_100062C60, type metadata accessor for SFSpeechError);

  return Error<>._code.getter(a1, v2);
}

uint64_t sub_10000728C(uint64_t a1)
{
  uint64_t v2 = sub_100007C7C(&qword_100062C98, type metadata accessor for SFSpeechError);

  return _BridgedStoredNSError._getEmbeddedNSError()(a1, v2);
}

id sub_1000072F8()
{
  return *v0;
}

uint64_t sub_100007300@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = result;
  return result;
}

uint64_t sub_100007308(uint64_t a1)
{
  uint64_t v2 = sub_100007C7C(&qword_100062CA0, type metadata accessor for LSRError);

  return Error<>._domain.getter(a1, v2);
}

uint64_t sub_100007374(uint64_t a1)
{
  uint64_t v2 = sub_100007C7C(&qword_100062CA0, type metadata accessor for LSRError);

  return Error<>._code.getter(a1, v2);
}

uint64_t sub_1000073E0(uint64_t a1)
{
  uint64_t v2 = sub_100007C7C((unint64_t *)&qword_100062CD0, type metadata accessor for LSRError);

  return _BridgedStoredNSError._getEmbeddedNSError()(a1, v2);
}

uint64_t sub_100007450()
{
  return sub_1000411F0();
}

uint64_t sub_100007460(uint64_t a1)
{
  uint64_t v2 = sub_100007C7C(&qword_100062C98, type metadata accessor for SFSpeechError);

  return _BridgedStoredNSError.errorCode.getter(a1, v2);
}

uint64_t sub_1000074CC(uint64_t a1)
{
  uint64_t v2 = sub_100007C7C(&qword_100062C98, type metadata accessor for SFSpeechError);

  return _BridgedStoredNSError.errorUserInfo.getter(a1, v2);
}

uint64_t sub_10000753C()
{
  return sub_1000411F0();
}

uint64_t sub_10000754C(uint64_t a1)
{
  uint64_t v2 = sub_100007C7C((unint64_t *)&qword_100062CD0, type metadata accessor for LSRError);

  return _BridgedStoredNSError.errorCode.getter(a1, v2);
}

uint64_t sub_1000075B8(uint64_t a1)
{
  uint64_t v2 = sub_100007C7C((unint64_t *)&qword_100062CD0, type metadata accessor for LSRError);

  return _BridgedStoredNSError.errorUserInfo.getter(a1, v2);
}

uint64_t sub_100007624(void *a1, uint64_t a2)
{
  uint64_t v4 = sub_100007C7C((unint64_t *)&qword_100062CD0, type metadata accessor for LSRError);
  id v5 = a1;

  return _BridgedStoredNSError.init(_bridgedNSError:)(v5, a2, v4);
}

uint64_t sub_1000076B4()
{
  return sub_1000076BC(*v0);
}

uint64_t sub_1000076BC(void *a1)
{
  id v1 = a1;
  uint64_t v2 = sub_100041420();

  return v2;
}

uint64_t sub_1000076F0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100007C7C((unint64_t *)&qword_100062CD0, type metadata accessor for LSRError);

  return _BridgedStoredNSError.hash(into:)(a1, a2, v4);
}

void sub_100007770(uint64_t a1@<X8>)
{
  sub_1000077A4();
  *(void *)a1 = v2;
  *(unsigned char *)(a1 + 8) = v3 & 1;
}

uint64_t sub_1000077AC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = nullsub_2(*v1);
  *a1 = result;
  return result;
}

uint64_t sub_1000077D8(void *a1, uint64_t a2)
{
  uint64_t v4 = sub_100007C7C(&qword_100062C98, type metadata accessor for SFSpeechError);
  id v5 = a1;

  return _BridgedStoredNSError.init(_bridgedNSError:)(v5, a2, v4);
}

uint64_t sub_100007868(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100007C7C(&qword_100062C98, type metadata accessor for SFSpeechError);

  return _BridgedStoredNSError.hash(into:)(a1, a2, v4);
}

Swift::Int sub_1000078E4()
{
  return sub_1000417A0();
}

uint64_t sub_100007944(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100007C7C((unint64_t *)&qword_100062CD0, type metadata accessor for LSRError);

  return static _BridgedStoredNSError.== infix(_:_:)(a1, a2, a3, v6);
}

BOOL sub_1000079C8(uint64_t *a1, uint64_t *a2)
{
  return sub_100005EA8(*a1, *a2);
}

uint64_t sub_1000079D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100007C7C(&qword_100062C98, type metadata accessor for SFSpeechError);

  return static _BridgedStoredNSError.== infix(_:_:)(a1, a2, a3, v6);
}

uint64_t sub_100007A58(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100007A9C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100007A58((uint64_t *)&unk_100063F60);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100007B04(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t sub_100007B2C(uint64_t a1)
{
  uint64_t v2 = sub_100007A58((uint64_t *)&unk_100063F60);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100007B8C(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

void type metadata accessor for SFSpeechError(uint64_t a1)
{
}

void type metadata accessor for LSRError(uint64_t a1)
{
}

uint64_t sub_100007BEC()
{
  return sub_100007C7C(&qword_100062C40, type metadata accessor for LSRError);
}

uint64_t sub_100007C34()
{
  return sub_100007C7C(&qword_100062C48, type metadata accessor for LSRError);
}

uint64_t sub_100007C7C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100007CC4()
{
  return sub_100007C7C(&qword_100062C50, type metadata accessor for SFSpeechError);
}

uint64_t sub_100007D0C()
{
  return sub_100007C7C(&qword_100062C58, type metadata accessor for SFSpeechError);
}

uint64_t sub_100007D54()
{
  return sub_100007C7C(&qword_100062C60, type metadata accessor for SFSpeechError);
}

uint64_t sub_100007D9C()
{
  return sub_100007C7C(&qword_100062C68, type metadata accessor for SFSpeechError);
}

uint64_t sub_100007DE4()
{
  return sub_100007C7C(&qword_100062C70, type metadata accessor for SFSpeechError);
}

uint64_t sub_100007E2C()
{
  return sub_100007C7C(&qword_100062C78, _s3__C4CodeOMa_0);
}

void _s3__C4CodeOMa_0(uint64_t a1)
{
}

uint64_t sub_100007E88()
{
  return sub_100007C7C(&qword_100062C80, _s3__C4CodeOMa_0);
}

unint64_t sub_100007ED4()
{
  unint64_t result = qword_100062C88;
  if (!qword_100062C88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100062C88);
  }
  return result;
}

uint64_t sub_100007F20()
{
  return sub_100007C7C(&qword_100062C90, _s3__C4CodeOMa_0);
}

uint64_t sub_100007F68()
{
  return sub_100007C7C(&qword_100062C98, type metadata accessor for SFSpeechError);
}

uint64_t sub_100007FB0()
{
  return sub_100007C7C(&qword_100062CA0, type metadata accessor for LSRError);
}

uint64_t sub_100007FF8()
{
  return sub_100007C7C(&qword_100062CA8, type metadata accessor for LSRError);
}

uint64_t sub_100008040()
{
  return sub_100007C7C(&qword_100062CB0, type metadata accessor for LSRError);
}

uint64_t sub_100008088()
{
  return sub_100007C7C(&qword_100062CB8, type metadata accessor for Code);
}

void type metadata accessor for Code(uint64_t a1)
{
}

void sub_1000080E4(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_10000812C()
{
  return sub_100007C7C(&qword_100062CC0, type metadata accessor for Code);
}

uint64_t sub_100008174()
{
  return sub_100007C7C(&qword_100062CC8, type metadata accessor for Code);
}

uint64_t sub_1000081BC()
{
  return sub_100007C7C((unint64_t *)&qword_100062CD0, type metadata accessor for LSRError);
}

uint64_t _s22localspeechrecognition31VoiceCommandDebugInfoAggregatedV05hasNobC17AfterRespeakCheckSbvpfi_0()
{
  return 0;
}

uint64_t _s22localspeechrecognition17RequestEndMetricsC8pmOutputSSSgvpfi_0()
{
  return 0;
}

uint64_t _s22localspeechrecognition17RequestEndMetricsC33languageModelInterpolationWeightsSSSgvpfi_0()
{
  return 0;
}

void sub_100008284()
{
}

uint64_t sub_10000828C()
{
  return sub_100040F20();
}

uint64_t _s22localspeechrecognition17RequestEndMetricsC34cpuInstructionsInMillionsPerSeconds6UInt64Vvpfi_0()
{
  return 0;
}

uint64_t sub_1000082F8(uint64_t a1)
{
  return a1 - 8;
}

uint64_t sub_100008318@<X0>(uint64_t a1@<X8>)
{
  return a1 << 32;
}

uint64_t sub_100008324()
{
  return swift_allocObject();
}

uint64_t _s22localspeechrecognition17RequestEndMetricsC20totalITNDurationInNss6UInt64VSgvpfi_0()
{
  return 0;
}

uint64_t sub_100008348()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for CoreAnalyticsLoggingHelper()
{
  return self;
}

uint64_t sub_10000837C(uint64_t a1)
{
  return sub_100008408(a1, qword_100064678, &SFLogFramework);
}

uint64_t *sub_100008390(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_1000083F4(uint64_t a1)
{
  return sub_100008408(a1, qword_100064690, (id *)&SFLogConnection);
}

uint64_t sub_100008408(uint64_t a1, uint64_t *a2, id *a3)
{
  uint64_t v5 = sub_1000410D0();
  sub_100008390(v5, a2);
  sub_100007B8C(v5, (uint64_t)a2);
  uint64_t result = SFLogInitIfNeeded();
  if (*a3)
  {
    id v7 = *a3;
    return sub_1000410E0();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_100008474()
{
  uint64_t v0 = sub_100007A58(&qword_100062E30);
  __chkstk_darwin(v0 - 8);
  uint64_t v2 = (char *)v17 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100007A58(&qword_100062E38);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100040FA0();
  uint64_t v6 = sub_100040F50();
  if (sub_100007B04((uint64_t)v5, 1, v6) == 1)
  {
    id v7 = &qword_100062E38;
    uint64_t v8 = (uint64_t)v5;
LABEL_5:
    sub_100008834(v8, v7);
    return 0;
  }
  uint64_t v9 = sub_100040F40();
  uint64_t v11 = v10;
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  sub_100040FC0();
  uint64_t v12 = sub_100040F80();
  if (sub_100007B04((uint64_t)v2, 1, v12) == 1)
  {
    swift_bridgeObjectRelease();
    id v7 = &qword_100062E30;
    uint64_t v8 = (uint64_t)v2;
    goto LABEL_5;
  }
  uint64_t v14 = sub_100040F70();
  uint64_t v16 = v15;
  (*(void (**)(char *, uint64_t))(*(void *)(v12 - 8) + 8))(v2, v12);
  v17[0] = v9;
  v17[1] = v11;
  v18._countAndFlagsBits = 45;
  v18._object = (void *)0xE100000000000000;
  sub_100041230(v18);
  v19._countAndFlagsBits = v14;
  v19._object = v16;
  sub_100041230(v19);
  swift_bridgeObjectRelease();
  return v17[0];
}

uint64_t sub_100008680()
{
  uint64_t v0 = sub_100040FD0();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = __chkstk_darwin(v0);
  uint64_t v4 = (char *)&v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v2);
  uint64_t v6 = (char *)&v14 - v5;
  sub_100040FE0();
  uint64_t v7 = sub_100008474();
  uint64_t v9 = v8;
  (*(void (**)(char *, char *, uint64_t))(v1 + 16))(v4, v6, v0);
  if (!v9) {
    uint64_t v7 = sub_100040FB0();
  }
  uint64_t v10 = *(void (**)(char *, uint64_t))(v1 + 8);
  v10(v4, v0);
  NSString v11 = sub_1000411E0();
  id v12 = (id)_AFPreferencesReplacementLanguageForLocalRecognizerLanguageCode();

  if (v12)
  {
    uint64_t v7 = sub_1000411F0();

    v10(v6, v0);
    swift_bridgeObjectRelease();
  }
  else
  {
    v10(v6, v0);
  }
  return v7;
}

uint64_t sub_100008834(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100007A58(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t VoiceCommandDebugInfoAggregated.hasVoiceCommandInExhaustiveParses.getter(char a1)
{
  return a1 & 1;
}

uint64_t VoiceCommandDebugInfoAggregated.hasVoiceCommandInExhaustiveParses.setter(uint64_t result)
{
  *uint64_t v1 = result;
  return result;
}

uint64_t (*VoiceCommandDebugInfoAggregated.hasVoiceCommandInExhaustiveParses.modify())(void)
{
  return nullsub_2;
}

uint64_t VoiceCommandDebugInfoAggregated.hasVoiceCommandParses.getter(unint64_t a1)
{
  return (a1 >> 8) & 1;
}

uint64_t VoiceCommandDebugInfoAggregated.hasVoiceCommandParses.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 1) = result;
  return result;
}

uint64_t (*VoiceCommandDebugInfoAggregated.hasVoiceCommandParses.modify())(void)
{
  return nullsub_2;
}

uint64_t VoiceCommandDebugInfoAggregated.hasVoiceCommandEditIntent.getter(unint64_t a1)
{
  return (a1 >> 16) & 1;
}

uint64_t VoiceCommandDebugInfoAggregated.hasVoiceCommandEditIntent.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 2) = result;
  return result;
}

uint64_t (*VoiceCommandDebugInfoAggregated.hasVoiceCommandEditIntent.modify())(void)
{
  return nullsub_2;
}

uint64_t VoiceCommandDebugInfoAggregated.hasVoiceCommandAfterReranking.getter(unint64_t a1)
{
  return (a1 >> 24) & 1;
}

uint64_t VoiceCommandDebugInfoAggregated.hasVoiceCommandAfterReranking.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 3) = result;
  return result;
}

uint64_t (*VoiceCommandDebugInfoAggregated.hasVoiceCommandAfterReranking.modify())(void)
{
  return nullsub_2;
}

uint64_t VoiceCommandDebugInfoAggregated.hasNoVoiceCommandAfterRespeakCheck.getter(unint64_t a1)
{
  return HIDWORD(a1) & 1;
}

uint64_t VoiceCommandDebugInfoAggregated.hasNoVoiceCommandAfterRespeakCheck.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 4) = result;
  return result;
}

uint64_t (*VoiceCommandDebugInfoAggregated.hasNoVoiceCommandAfterRespeakCheck.modify())(void)
{
  return nullsub_2;
}

uint64_t initializeBufferWithCopyOfBuffer for VoiceCommandDebugInfoAggregated(uint64_t result, int *a2)
{
  int v2 = *a2;
  *(unsigned char *)(result + 4) = *((unsigned char *)a2 + 4);
  *(_DWORD *)uint64_t result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for VoiceCommandDebugInfoAggregated(unsigned __int8 *a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0xFF && a1[5])
    {
      int v2 = *(_DWORD *)a1 + 254;
    }
    else
    {
      unsigned int v3 = *a1;
      BOOL v4 = v3 >= 2;
      int v2 = (v3 + 2147483646) & 0x7FFFFFFF;
      if (!v4) {
        int v2 = -1;
      }
    }
  }
  else
  {
    int v2 = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for VoiceCommandDebugInfoAggregated(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(unsigned char *)(result + 4) = 0;
    *(_DWORD *)uint64_t result = a2 - 255;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 5) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 5) = 0;
    }
    if (a2) {
      *(unsigned char *)uint64_t result = a2 + 1;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for VoiceCommandDebugInfoAggregated()
{
  return &type metadata for VoiceCommandDebugInfoAggregated;
}

void *sub_100008A34()
{
  sub_100041020();
  uint64_t result = (void *)sub_100041140();
  off_100062E40 = result;
  return result;
}

_DWORD *sub_100008A78()
{
  type metadata accessor for _Lock();
  uint64_t v0 = swift_allocObject();
  uint64_t result = (_DWORD *)swift_slowAlloc();
  *(void *)(v0 + 16) = result;
  _DWORD *result = 0;
  qword_100062E48 = v0;
  return result;
}

uint64_t sub_100008AC8()
{
  uint64_t v1 = sub_1000410D0();
  sub_100008220();
  uint64_t v3 = v2;
  __chkstk_darwin();
  uint64_t v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100041050();
  sub_100008220();
  uint64_t v8 = v7;
  __chkstk_darwin();
  uint64_t v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1000621B8 != -1) {
    swift_once();
  }
  uint64_t v11 = sub_100007B8C(v1, (uint64_t)qword_100064678);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v11, v1);
  sub_100041030();
  (*(void (**)(uint64_t, char *, uint64_t))(v8 + 32))(v0 + OBJC_IVAR____TtC22localspeechrecognition14SignpostHelper_signposter, v10, v6);
  return v0;
}

uint64_t sub_100008C30(char *a1, uint64_t a2, int a3, uint64_t a4, unint64_t a5, uint64_t a6)
{
  int v58 = a3;
  uint64_t v10 = sub_100007A58(&qword_100062FC8);
  __chkstk_darwin(v10 - 8);
  sub_10000A798();
  v57 = (char *)v11;
  uint64_t v61 = sub_100041020();
  sub_100008220();
  uint64_t v13 = v12;
  uint64_t v15 = __chkstk_darwin(v14);
  uint64_t v17 = (char *)&v53 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = __chkstk_darwin(v15);
  sub_10000A7E0(v18, v19, v20, v21, v22, v23, v24, v25, v53);
  if (qword_1000621B8 != -1) {
    swift_once();
  }
  uint64_t v26 = sub_1000410D0();
  sub_100007B8C(v26, (uint64_t)qword_100064678);
  v27 = sub_1000410C0();
  os_log_type_t v28 = sub_100041370();
  BOOL v29 = os_log_type_enabled(v27, v28);
  uint64_t v60 = v13;
  v55 = v17;
  unint64_t v56 = a5;
  uint64_t v53 = a6;
  uint64_t v54 = a4;
  if (v29)
  {
    uint64_t v30 = (uint8_t *)swift_slowAlloc();
    uint64_t v63 = sub_10000A780();
    *(_DWORD *)uint64_t v30 = 136315138;
    char v31 = v58;
    uint64_t v32 = sub_100041580();
    uint64_t v62 = sub_10002E330(v32, v33, &v63);
    sub_100041450();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v27, v28, "Logging signpost begin event: %s", v30, 0xCu);
    swift_arrayDestroy();
    sub_10000A754();
    sub_10000A754();
  }
  else
  {

    char v31 = v58;
  }
  uint64_t v34 = sub_100041580();
  uint64_t v36 = v35;
  sub_100041040();
  uint64_t v37 = v59;
  uint64_t v38 = sub_100041000();
  if (qword_1000621D0 != -1) {
    uint64_t v38 = swift_once();
  }
  __chkstk_darwin(v38);
  *(&v53 - 4) = v37;
  *(&v53 - 3) = v34;
  *(&v53 - 2) = v36;
  uint64_t v39 = v57;
  sub_10000A098((void (*)(void))sub_10000A4CC);
  sub_10000A404((uint64_t)v39);
  swift_bridgeObjectRelease();
  sub_10000A318();
  sub_100009318();
  sub_10000A364(v40);
  swift_bridgeObjectRetain_n();
  uint64_t v41 = sub_100041040();
  int v42 = sub_1000413D0();
  if ((sub_100041430() & 1) == 0)
  {
    swift_bridgeObjectRelease_n();

    uint64_t v43 = v60;
    uint64_t v44 = *(void (**)(char *, uint64_t, uint64_t))(v60 + 16);
    v45 = v55;
LABEL_18:
    uint64_t v51 = v61;
    v44(v45, v37, v61);
    sub_1000410A0();
    swift_allocObject();
    sub_100041090();
    swift_release();
    return (*(uint64_t (**)(uint64_t, uint64_t))(v43 + 8))(v37, v51);
  }
  int v58 = v42;
  if (v31)
  {
    if ((unint64_t)a1 >> 32)
    {
      __break(1u);
    }
    else
    {
      if (a1 >> 11 == 27)
      {
LABEL_21:
        __break(1u);
        goto LABEL_22;
      }
      if (a1 >> 16 <= 0x10)
      {
        v57 = &v64;
        goto LABEL_17;
      }
    }
    __break(1u);
    goto LABEL_21;
  }
  if (a1)
  {
    v57 = a1;
LABEL_17:
    uint64_t v44 = *(void (**)(char *, uint64_t, uint64_t))(v60 + 16);
    v46 = v55;
    v44(v55, v37, v61);
    uint64_t v47 = swift_slowAlloc();
    uint64_t v48 = sub_10000A780();
    *(_DWORD *)uint64_t v47 = 134349314;
    uint64_t v62 = v53;
    uint64_t v63 = v48;
    sub_100041450();
    *(_WORD *)(v47 + 12) = 2080;
    unint64_t v49 = v56;
    swift_bridgeObjectRetain();
    uint64_t v62 = sub_10002E330(v54, v49, &v63);
    sub_100041450();
    swift_bridgeObjectRelease_n();
    os_signpost_id_t v50 = sub_100041010();
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v41, (os_signpost_type_t)v58, v50, v57, "%{signpost.description:begin_time,public}llu %s", (uint8_t *)v47, 0x16u);
    swift_arrayDestroy();
    sub_10000A754();
    sub_10000A754();

    v45 = v46;
    uint64_t v43 = v60;
    (*(void (**)(char *, uint64_t))(v60 + 8))(v45, v61);
    goto LABEL_18;
  }
LABEL_22:
  uint64_t result = swift_bridgeObjectRelease_n();
  __break(1u);
  return result;
}

uint64_t sub_1000091C4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v8 = sub_100041020();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v13 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1000621C8 != -1) {
    swift_once();
  }
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a1, v8);
  swift_beginAccess();
  sub_10000A4EC((uint64_t)v11, a2, a3, a4);
  return swift_endAccess();
}

uint64_t sub_100009318()
{
  return sub_100041070();
}

uint64_t sub_100009388(unint64_t a1, uint64_t a2, int a3, uint64_t a4, unint64_t a5, uint64_t a6)
{
  uint64_t v67 = a6;
  LODWORD(v80) = a3;
  sub_100041060();
  sub_100008220();
  uint64_t v70 = v10;
  uint64_t v71 = v9;
  __chkstk_darwin(v9);
  sub_10000A798();
  uint64_t v69 = v11;
  uint64_t v12 = sub_100041020();
  sub_100008220();
  uint64_t v14 = v13;
  __chkstk_darwin(v15);
  sub_10000A76C();
  uint64_t v78 = v16;
  sub_10000A7C0();
  __chkstk_darwin(v17);
  v75 = (char *)&v64 - v18;
  sub_10000A7C0();
  uint64_t v20 = __chkstk_darwin(v19);
  sub_10000A7E0(v20, v21, v22, v23, v24, v25, v26, v27, v64);
  uint64_t v28 = sub_100007A58(&qword_100062FC8);
  __chkstk_darwin(v28 - 8);
  sub_10000A76C();
  uint64_t v77 = v29;
  sub_10000A7C0();
  __chkstk_darwin(v30);
  uint64_t v32 = (char *)&v64 - v31;
  if (qword_1000621B8 != -1) {
    swift_once();
  }
  uint64_t v33 = sub_1000410D0();
  sub_100007B8C(v33, (uint64_t)qword_100064678);
  uint64_t v34 = sub_1000410C0();
  os_log_type_t v35 = sub_100041370();
  BOOL v36 = os_log_type_enabled(v34, v35);
  unint64_t v76 = a5;
  uint64_t v68 = a4;
  if (v36)
  {
    uint64_t v37 = swift_slowAlloc();
    v74 = (void (*)(char *, uint64_t, uint64_t))a1;
    uint64_t v38 = (uint8_t *)v37;
    uint64_t v82 = sub_10000A780();
    v65 = v32;
    uint64_t v66 = v12;
    uint64_t v72 = v14;
    *(_DWORD *)uint64_t v38 = 136315138;
    uint64_t v39 = sub_100041580();
    uint64_t v81 = sub_10002E330(v39, v40, &v82);
    uint64_t v14 = v72;
    uint64_t v32 = v65;
    uint64_t v12 = v66;
    sub_100041450();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v34, v35, "Logging signpost end event: %s", v38, 0xCu);
    swift_arrayDestroy();
    sub_10000A754();
    a1 = (unint64_t)v74;
    sub_10000A754();
  }

  uint64_t v41 = sub_100041580();
  uint64_t v43 = v42;
  sub_10000A374((uint64_t)v32, 1, 1, v12);
  uint64_t v44 = v79;
  if (qword_1000621D0 != -1) {
    swift_once();
  }
  uint64_t v45 = qword_100062E48;
  swift_bridgeObjectRetain();
  sub_10000A104(v45, (uint64_t)v32, v41, v43);
  swift_bridgeObjectRelease();
  uint64_t v46 = v77;
  sub_10000A39C((uint64_t)v32, v77);
  if (sub_100007B04(v46, 1, v12) == 1)
  {
    sub_10000A404(v46);
    return sub_10000A404((uint64_t)v32);
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v14 + 32))(v44, v46, v12);
  v74 = *(void (**)(char *, uint64_t, uint64_t))(v14 + 16);
  v74(v75, v44, v12);
  sub_1000410A0();
  swift_allocObject();
  sub_100041090();
  sub_10000A318();
  sub_100009318();
  sub_10000A364(v47);
  swift_bridgeObjectRetain_n();
  uint64_t v48 = sub_100041040();
  sub_100041080();
  LODWORD(v77) = sub_1000413C0();
  uint64_t result = sub_100041430();
  if ((result & 1) == 0)
  {
LABEL_13:
    swift_bridgeObjectRelease_n();

    v52 = *(void (**)(uint64_t, uint64_t))(v14 + 8);
    v52(v78, v12);
    v52(v44, v12);
    swift_release();
    return sub_10000A404((uint64_t)v32);
  }
  if ((v80 & 1) == 0)
  {
    uint64_t v51 = v70;
    uint64_t v50 = v71;
    uint64_t v44 = v69;
    if (!a1)
    {
      swift_bridgeObjectRelease_n();
      __break(1u);
      goto LABEL_13;
    }
LABEL_18:
    swift_retain();
    sub_1000410B0();
    swift_release();
    int v53 = (*(uint64_t (**)(uint64_t, uint64_t))(v51 + 88))(v44, v50);
    uint64_t v72 = v14;
    os_log_t v73 = v48;
    if (v53 == enum case for OSSignpostError.doubleEnd(_:))
    {
      v55 = (const char *)a1;
      char v56 = 0;
      v80 = "[Error] Interval already ended";
    }
    else
    {
      uint64_t v54 = v44;
      v55 = (const char *)a1;
      (*(void (**)(uint64_t, uint64_t))(v51 + 8))(v54, v50);
      v80 = "%{signpost.description:end_time,public}llu %s";
      char v56 = 2;
    }
    v57 = v75;
    v74(v75, v78, v12);
    uint64_t v58 = swift_slowAlloc();
    uint64_t v59 = sub_10000A780();
    *(unsigned char *)uint64_t v58 = v56;
    *(unsigned char *)(v58 + 1) = v56;
    *(_WORD *)(v58 + 2) = 2050;
    uint64_t v81 = v67;
    uint64_t v82 = v59;
    sub_100041450();
    *(_WORD *)(v58 + 12) = 2080;
    unint64_t v60 = v76;
    swift_bridgeObjectRetain();
    uint64_t v81 = sub_10002E330(v68, v60, &v82);
    sub_100041450();
    swift_bridgeObjectRelease_n();
    os_signpost_id_t v61 = sub_100041010();
    os_log_t v62 = v73;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v73, (os_signpost_type_t)v77, v61, v55, v80, (uint8_t *)v58, 0x16u);
    swift_arrayDestroy();
    sub_10000A754();
    sub_10000A754();

    uint64_t v63 = *(void (**)(uint64_t, uint64_t))(v72 + 8);
    v63(v78, v12);
    v63(v79, v12);
    swift_release();
    v63((uint64_t)v57, v12);
    return sub_10000A404((uint64_t)v32);
  }
  uint64_t v51 = v70;
  uint64_t v50 = v71;
  uint64_t v44 = v69;
  if (HIDWORD(a1))
  {
    __break(1u);
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  if (a1 >> 11 != 27)
  {
    if (WORD1(a1) <= 0x10u)
    {
      a1 = (unint64_t)&v83;
      goto LABEL_18;
    }
    goto LABEL_24;
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_100009A9C(const char *a1, uint64_t a2, int a3, uint64_t a4, unint64_t a5, uint64_t a6)
{
  uint64_t v43 = a6;
  int v46 = a3;
  uint64_t v47 = (char *)a1;
  uint64_t v8 = sub_100041020();
  sub_100008220();
  uint64_t v10 = v9;
  __chkstk_darwin(v11);
  sub_10000A76C();
  uint64_t v13 = v12;
  sub_10000A7C0();
  __chkstk_darwin(v14);
  uint64_t v16 = (char *)&v39 - v15;
  if (qword_1000621B8 != -1) {
    swift_once();
  }
  uint64_t v17 = sub_1000410D0();
  sub_100007B8C(v17, (uint64_t)qword_100064678);
  uint64_t v18 = sub_1000410C0();
  os_log_type_t v19 = sub_100041370();
  BOOL v20 = os_log_type_enabled(v18, v19);
  uint64_t v44 = a4;
  unint64_t v45 = a5;
  if (v20)
  {
    uint64_t v40 = v10;
    uint64_t v21 = (uint8_t *)swift_slowAlloc();
    uint64_t v22 = sub_10000A780();
    uint64_t v41 = v13;
    uint64_t v42 = v16;
    uint64_t v49 = v22;
    *(_DWORD *)uint64_t v21 = 136315138;
    uint64_t v23 = sub_100041580();
    uint64_t v48 = sub_10002E330(v23, v24, &v49);
    uint64_t v10 = v40;
    sub_100041450();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v18, v19, "Logging signpost event: %s", v21, 0xCu);
    swift_arrayDestroy();
    uint64_t v13 = v41;
    uint64_t v16 = v42;
    sub_10000A754();
    sub_10000A754();
  }

  sub_100041040();
  sub_100041000();
  sub_10000A318();
  sub_100009318();
  sub_10000A364(v25);
  swift_bridgeObjectRetain_n();
  uint64_t v26 = sub_100041040();
  int v27 = sub_1000413E0();
  uint64_t result = sub_100041430();
  if ((result & 1) == 0) {
    goto LABEL_9;
  }
  LODWORD(v42) = v27;
  if ((v46 & 1) == 0)
  {
    if (!v47)
    {
      swift_bridgeObjectRelease_n();
      __break(1u);
LABEL_9:

      swift_bridgeObjectRelease_n();
      uint64_t v29 = sub_10000A7CC();
      return v30(v29);
    }
    goto LABEL_14;
  }
  if ((unint64_t)v47 >> 32)
  {
    __break(1u);
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  if (v47 >> 11 != 27)
  {
    if (v47 >> 16 <= 0x10)
    {
      uint64_t v47 = &v50;
LABEL_14:
      uint64_t v31 = v43;
      uint64_t v32 = v13;
      (*(void (**)(uint64_t, char *, uint64_t))(v10 + 16))(v13, v16, v8);
      uint64_t v33 = swift_slowAlloc();
      uint64_t v34 = sub_10000A780();
      uint64_t v48 = v31;
      uint64_t v49 = v34;
      *(_DWORD *)uint64_t v33 = 134349314;
      sub_100041450();
      *(_WORD *)(v33 + 12) = 2080;
      unint64_t v35 = v45;
      swift_bridgeObjectRetain();
      uint64_t v48 = sub_10002E330(v44, v35, &v49);
      sub_100041450();
      swift_bridgeObjectRelease_n();
      os_signpost_id_t v36 = sub_100041010();
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v26, (os_signpost_type_t)v42, v36, v47, "%{signpost.description:event_time,public}llu %s", (uint8_t *)v33, 0x16u);
      swift_arrayDestroy();
      sub_10000A754();
      sub_10000A754();

      uint64_t v37 = *(void (**)(uint64_t))(v10 + 8);
      uint64_t v38 = sub_10000A7CC();
      v37(v38);
      return ((uint64_t (*)(uint64_t, uint64_t))v37)(v32, v8);
    }
    goto LABEL_16;
  }
LABEL_17:
  __break(1u);
  return result;
}

uint64_t SignpostHelper.deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC22localspeechrecognition14SignpostHelper_signposter;
  sub_100041050();
  sub_10000A7AC();
  (*(void (**)(uint64_t))(v2 + 8))(v1);
  return v0;
}

uint64_t SignpostHelper.__deallocating_deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC22localspeechrecognition14SignpostHelper_signposter;
  sub_100041050();
  sub_10000A7AC();
  (*(void (**)(uint64_t))(v2 + 8))(v1);
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return _swift_deallocClassInstance(v0, v3, v4);
}

uint64_t sub_100009FB8()
{
  return type metadata accessor for SignpostHelper();
}

uint64_t type metadata accessor for SignpostHelper()
{
  uint64_t result = qword_100062E78;
  if (!qword_100062E78) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_10000A008()
{
  uint64_t result = sub_100041050();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

void sub_10000A098(void (*a1)(void))
{
  uint64_t v3 = *(os_unfair_lock_s **)(v1 + 16);
  os_unfair_lock_lock(v3);
  a1();
  os_unfair_lock_unlock(v3);
}

uint64_t sub_10000A104(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = sub_100007A58(&qword_100062FC8);
  __chkstk_darwin(v8 - 8);
  uint64_t v10 = (char *)&v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = *(os_unfair_lock_s **)(a1 + 16);
  os_unfair_lock_lock(v11);
  if (qword_1000621C8 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v12 = off_100062E40;
  if (*((void *)off_100062E40 + 2))
  {
    swift_bridgeObjectRetain();
    unint64_t v13 = sub_1000255D4(a3, a4);
    if (v14)
    {
      unint64_t v15 = v13;
      uint64_t v16 = v12[7];
      uint64_t v17 = sub_100041020();
      (*(void (**)(char *, unint64_t, uint64_t))(*(void *)(v17 - 8) + 16))(v10, v16 + *(void *)(*(void *)(v17 - 8) + 72) * v15, v17);
      uint64_t v18 = (uint64_t)v10;
      uint64_t v19 = 0;
      uint64_t v20 = v17;
    }
    else
    {
      uint64_t v20 = sub_100041020();
      uint64_t v18 = (uint64_t)v10;
      uint64_t v19 = 1;
    }
    sub_10000A374(v18, v19, 1, v20);
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v21 = sub_100041020();
    sub_10000A374((uint64_t)v10, 1, 1, v21);
  }
  swift_endAccess();
  sub_10000A464((uint64_t)v10, a2);
  os_unfair_lock_unlock(v11);
  return swift_bridgeObjectRelease();
}

uint64_t sub_10000A2E4()
{
  return _swift_deallocClassInstance(v0, 24, 7);
}

uint64_t type metadata accessor for _Lock()
{
  return self;
}

unint64_t sub_10000A318()
{
  unint64_t result = qword_100062FC0;
  if (!qword_100062FC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100062FC0);
  }
  return result;
}

uint64_t sub_10000A364(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_10000A374(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t sub_10000A39C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100007A58(&qword_100062FC8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000A404(uint64_t a1)
{
  uint64_t v2 = sub_100007A58(&qword_100062FC8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10000A464(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100007A58(&qword_100062FC8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000A4CC@<X0>(uint64_t a1@<X8>)
{
  return sub_1000091C4(v1[2], v1[3], v1[4], a1);
}

uint64_t sub_10000A4EC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v11 = *v4;
  *uint64_t v4 = 0x8000000000000000;
  sub_10000A584(a1, a2, a3, isUniquelyReferenced_nonNull_native, a4);
  *uint64_t v4 = v11;

  return swift_bridgeObjectRelease();
}

uint64_t sub_10000A584@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char a4@<W3>, uint64_t a5@<X8>)
{
  uint64_t v6 = (void **)v5;
  uint64_t v12 = (void *)*v5;
  unint64_t v13 = sub_1000255D4(a2, a3);
  uint64_t v15 = v12[2];
  BOOL v16 = (v14 & 1) == 0;
  Swift::Int v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
    goto LABEL_13;
  }
  unint64_t v18 = v13;
  char v19 = v14;
  sub_100007A58((uint64_t *)&unk_100062FD0);
  if (!sub_100041620(a4 & 1, v17)) {
    goto LABEL_5;
  }
  unint64_t v20 = sub_1000255D4(a2, a3);
  if ((v19 & 1) != (v21 & 1))
  {
LABEL_13:
    uint64_t result = sub_100041740();
    __break(1u);
    return result;
  }
  unint64_t v18 = v20;
LABEL_5:
  uint64_t v22 = (uint64_t)*v6;
  if (v19)
  {
    uint64_t v23 = *(void *)(v22 + 56);
    uint64_t v24 = sub_100041020();
    uint64_t v25 = *(void *)(v24 - 8);
    uint64_t v26 = *(void (**)(uint64_t, unint64_t, uint64_t))(v25 + 32);
    unint64_t v27 = *(void *)(v25 + 72) * v18;
    v26(a5, v23 + v27, v24);
    v26(*(void *)(v22 + 56) + v27, a1, v24);
    return sub_10000A374(a5, 0, 1, v24);
  }
  else
  {
    sub_10002736C(v18, a2, a3, a1, *v6);
    uint64_t v29 = sub_100041020();
    sub_10000A374(a5, 1, 1, v29);
    return swift_bridgeObjectRetain();
  }
}

uint64_t sub_10000A754()
{
  return swift_slowDealloc();
}

uint64_t sub_10000A780()
{
  return swift_slowAlloc();
}

uint64_t sub_10000A7CC()
{
  return v0;
}

void sub_10000A7E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  *(void *)(v10 - 136) = (char *)&a9 - v9;
}

uint64_t sub_10000A7F4(uint64_t a1)
{
  *(void *)(v1 + OBJC_IVAR____TtC22localspeechrecognition19EARLanguageDetector_resultStream) = a1;
  return _objc_release_x1();
}

uint64_t sub_10000A808(uint64_t a1, uint64_t a2)
{
  v3[5] = a2;
  v3[6] = v2;
  v3[4] = a1;
  sub_100040FF0();
  v3[7] = swift_task_alloc();
  sub_1000411D0();
  v3[8] = swift_task_alloc();
  return _swift_task_switch(sub_10000A8C8, 0, 0);
}

id sub_10000A8C8()
{
  Class super_class = v0[2].super_class;
  receiver = (char *)v0[3].receiver;
  id v3 = v0[2].receiver;
  uint64_t v4 = OBJC_IVAR____TtC22localspeechrecognition19EARLanguageDetector_audioBufferListeners;
  sub_10000CD4C(0, (unint64_t *)&qword_100063E40);
  type metadata accessor for EARLanguageDetectorAudioBuffer();
  sub_10000CA2C();
  uint64_t v5 = receiver;
  *(void *)&receiver[v4] = sub_100041140();
  uint64_t v6 = OBJC_IVAR____TtC22localspeechrecognition19EARLanguageDetector_audioBufferListenerLock;
  sub_100007A58(&qword_100063E50);
  uint64_t v7 = swift_allocObject();
  *(_DWORD *)(v7 + 16) = 0;
  *(void *)&v5[v6] = v7;
  uint64_t v45 = OBJC_IVAR____TtC22localspeechrecognition19EARLanguageDetector_resultStream;
  *(void *)&v5[OBJC_IVAR____TtC22localspeechrecognition19EARLanguageDetector_resultStream] = 0;
  uint64_t v8 = OBJC_IVAR____TtC22localspeechrecognition19EARLanguageDetector_languageDetector;
  *(void *)&v5[OBJC_IVAR____TtC22localspeechrecognition19EARLanguageDetector_languageDetector] = 0;
  uint64_t v9 = OBJC_IVAR____TtC22localspeechrecognition19EARLanguageDetector_supportedLocales;
  *(void *)&v5[OBJC_IVAR____TtC22localspeechrecognition19EARLanguageDetector_supportedLocales] = _swiftEmptyArrayStorage;
  uint64_t v46 = OBJC_IVAR____TtC22localspeechrecognition19EARLanguageDetector_clientInfo;
  *(void *)&v5[OBJC_IVAR____TtC22localspeechrecognition19EARLanguageDetector_clientInfo] = super_class;
  uint64_t v10 = OBJC_IVAR____TtC22localspeechrecognition19EARLanguageDetector_detectorOptions;
  *(void *)&v5[OBJC_IVAR____TtC22localspeechrecognition19EARLanguageDetector_detectorOptions] = v3;
  uint64_t v11 = self;
  uint64_t v12 = super_class;
  id v13 = v3;
  id result = [v11 sharedInstance];
  if (!result)
  {
    __break(1u);
    return result;
  }
  Class v15 = v0[2].super_class;
  BOOL v16 = (char *)v0[3].receiver;
  uint64_t v17 = OBJC_IVAR____TtC22localspeechrecognition19EARLanguageDetector_assetsManager;
  *(void *)&v16[OBJC_IVAR____TtC22localspeechrecognition19EARLanguageDetector_assetsManager] = result;
  id v18 = result;
  NSString v19 = [(objc_class *)v15 clientID];
  if (!v19)
  {
    sub_1000411F0();
    NSString v19 = sub_1000411E0();
    swift_bridgeObjectRelease();
  }
  id v20 = [v18 installedLanguageDetectorAssetWithClientID:v19];

  if (v20)
  {
    sub_1000411F0();

    sub_10000CD4C(0, (unint64_t *)&unk_100063250);
    swift_bridgeObjectRetain();
    v48._countAndFlagsBits = 0x6F7463657465642FLL;
    v48._object = (void *)0xEE006E6F736A2E72;
    sub_100041230(v48);
    swift_bridgeObjectRelease();
    id v21 = sub_10000AE50();
    uint64_t v22 = *(void **)&v5[v8];
    *(void *)&v5[v8] = v21;

    uint64_t v23 = *(void **)&v5[v8];
    if (v23)
    {
      Class v24 = v0[2].super_class;
      id v25 = v0[3].receiver;
      id v26 = v0[2].receiver;
      id v27 = v23;
      id v28 = [v27 supportedLocales];
      uint64_t v29 = sub_100041270();

      *(void *)&v5[v9] = v29;
      swift_bridgeObjectRelease();

      uint64_t v30 = type metadata accessor for EARLanguageDetector();
      v0[1].receiver = v25;
      v0[1].Class super_class = (Class)v30;
      id v31 = objc_msgSendSuper2(v0 + 1, "init");

      swift_task_dealloc();
      swift_task_dealloc();
      uint64_t v32 = (uint64_t (*)(id))v0->super_class;
      return (id)v32(v31);
    }
    uint64_t v42 = v17;
    uint64_t v43 = v16;
    uint64_t v44 = v10;
    uint64_t v34 = self;
    sub_100041160();
    if (qword_100062238 != -1) {
      swift_once();
    }
    id v35 = (id)qword_100064878;
    sub_100040F90();
    uint64_t v36 = sub_100041200();
    sub_10000CA8C(500, v36, v37, v34);
  }
  else
  {
    uint64_t v42 = v17;
    uint64_t v43 = v16;
    uint64_t v44 = v10;
    sub_100041160();
    if (qword_100062238 != -1) {
      swift_once();
    }
    id v33 = (id)qword_100064878;
    sub_100040F90();
    sub_100041200();
    sub_1000413B0();
    sub_100041110();
  }
  Class v39 = v0[2].super_class;
  id v38 = v0[3].receiver;
  id v40 = v0[2].receiver;
  swift_willThrow();

  swift_bridgeObjectRelease();
  swift_release();

  swift_bridgeObjectRelease();
  type metadata accessor for EARLanguageDetector();
  swift_deallocPartialClassInstance();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v41 = (uint64_t (*)(void))v0->super_class;
  return (id)v41();
}

id sub_10000AE50()
{
  id v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  NSString v1 = sub_1000411E0();
  swift_bridgeObjectRelease();
  id v2 = [v0 initWithConfigFile:v1];

  return v2;
}

id sub_10000AEC4()
{
  uint64_t v1 = sub_100040FF0();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin();
  uint64_t v4 = (char *)v27 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v5 = [objc_allocWithZone((Class)_EARLanguageDetectorRequestContext) init];
  id v6 = [*(id *)(v0 + OBJC_IVAR____TtC22localspeechrecognition19EARLanguageDetector_detectorOptions) languageConstraints];
  if (!v6) {
    goto LABEL_14;
  }
  uint64_t v7 = v6;
  uint64_t v8 = sub_100041270();

  uint64_t v9 = *(void *)(v8 + 16);
  if (v9)
  {
    v27[1] = v0;
    id v28 = v5;
    id v33 = &_swiftEmptyArrayStorage;
    sub_100025574(0, v9, 0);
    uint64_t v11 = *(void (**)(char *, uint64_t, uint64_t))(v2 + 16);
    uint64_t v10 = v2 + 16;
    uint64_t v12 = *(unsigned __int8 *)(v10 + 64);
    v27[0] = v8;
    uint64_t v13 = v8 + ((v12 + 32) & ~v12);
    uint64_t v29 = *(void *)(v10 + 56);
    uint64_t v30 = v11;
    uint64_t v31 = v10;
    uint64_t v32 = v1;
    char v14 = (void (**)(char *, uint64_t))(v10 - 8);
    do
    {
      v30(v4, v13, v1);
      uint64_t v15 = sub_100040F30();
      uint64_t v17 = v16;
      (*v14)(v4, v1);
      id v18 = v33;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_100025574(0, v18[2] + 1, 1);
        id v18 = v33;
      }
      unint64_t v20 = v18[2];
      unint64_t v19 = v18[3];
      if (v20 >= v19 >> 1)
      {
        sub_100025574(v19 > 1, v20 + 1, 1);
        id v18 = v33;
      }
      v18[2] = v20 + 1;
      id v21 = (char *)&v18[2 * v20];
      *((void *)v21 + 4) = v15;
      *((void *)v21 + 5) = v17;
      v13 += v29;
      --v9;
      uint64_t v1 = v32;
    }
    while (v9);
    swift_bridgeObjectRelease();
    id v5 = v28;
  }
  else
  {
    swift_bridgeObjectRelease();
    id v18 = &_swiftEmptyArrayStorage;
  }
  if (!v18[2])
  {
    swift_bridgeObjectRelease();
LABEL_14:
    uint64_t v22 = swift_bridgeObjectRetain();
    goto LABEL_15;
  }
  uint64_t v22 = (uint64_t)v18;
LABEL_15:
  uint64_t v23 = sub_10001A178(v22);
  sub_10000CBE0(v23, v5);
  sub_10000CC54(0x53552D6E65, 0xE500000000000000, v5);
  sub_10000CD4C(0, &qword_100063260);
  Class isa = sub_1000413F0(0).super.super.isa;
  [v5 setWasLanguageToggled:isa];

  uint64_t v25 = sub_100041140();
  sub_10000CCB8(v25, v5);
  return v5;
}

void sub_10000B1C8(uint64_t a1, void (**a2)(void, void))
{
  swift_bridgeObjectRetain();
  Class isa = sub_100041260().super.isa;
  ((void (**)(void, Class))a2)[2](a2, isa);
  swift_bridgeObjectRelease();

  _Block_release(a2);
}

void sub_10000B260(uint64_t a1, void (**a2)(void, void))
{
  sub_100040FF0();
  __chkstk_darwin();
  sub_1000411D0();
  __chkstk_darwin();
  uint64_t v4 = *(void **)(a1 + OBJC_IVAR____TtC22localspeechrecognition19EARLanguageDetector_assetsManager);
  NSString v5 = [*(id *)(a1 + OBJC_IVAR____TtC22localspeechrecognition19EARLanguageDetector_clientInfo) clientID];
  if (!v5)
  {
    sub_1000411F0();
    NSString v5 = sub_1000411E0();
    swift_bridgeObjectRelease();
  }
  id v6 = [v4 installedLanguageDetectorAssetWithClientID:v5];

  if (v6)
  {
    sub_1000411F0();

    sub_10000CD4C(0, (unint64_t *)&unk_100063270);
    swift_bridgeObjectRetain();
    v11._countAndFlagsBits = 0x6F7463657465642FLL;
    v11._object = (void *)0xEE006E6F736A2E72;
    sub_100041230(v11);
    swift_bridgeObjectRelease();
    id v7 = sub_10001A390();
    id v8 = [objc_allocWithZone((Class)EARSpeechModelInfo) initWithModelInfo:v7];

    ((void (**)(void, id))a2)[2](a2, v8);
    _Block_release(a2);
  }
  else
  {
    sub_100041160();
    if (qword_100062238 != -1) {
      swift_once();
    }
    id v9 = (id)qword_100064878;
    sub_100040F90();
    sub_100041200();
    sub_1000413B0();

    a2[2](a2, 0);
    _Block_release(a2);
  }
}

void sub_10000B554(void *a1, int a2, void *aBlock, void (*a4)(void))
{
  id v6 = _Block_copy(aBlock);
  _Block_copy(v6);
  id v7 = a1;
  a4();
  _Block_release(v6);
}

void sub_10000B5C8(void *a1, uint64_t a2, uint64_t a3, void (**a4)(void, void, void))
{
  NSString v5 = *(void **)(a3 + OBJC_IVAR____TtC22localspeechrecognition19EARLanguageDetector_languageDetector);
  if (v5)
  {
    id v9 = objc_allocWithZone((Class)type metadata accessor for EARLanguageDetectorResultStream());
    id v10 = v5;
    id v11 = sub_10000C30C(a1);
    id v12 = v11;
    sub_10000A7F4((uint64_t)v11);
    if ((a2 & 0x8000000000000000) == 0)
    {
      id v13 = sub_10000AEC4();
      id v14 = [v10 startRequestWithSamplingRate:a2 context:v13 delegate:v12];

      id v15 = [self anonymousListener];
      [v15 setDelegate:a3];
      [v15 activate];
      uint64_t v16 = OBJC_IVAR____TtC22localspeechrecognition19EARLanguageDetector_audioBufferListenerLock;
      uint64_t v17 = *(os_unfair_lock_s **)(a3
                                 + OBJC_IVAR____TtC22localspeechrecognition19EARLanguageDetector_audioBufferListenerLock);
      swift_retain();
      os_unfair_lock_lock(v17 + 4);
      swift_release();
      id v18 = objc_allocWithZone((Class)type metadata accessor for EARLanguageDetectorAudioBuffer());
      id v19 = v15;
      id v20 = v14;
      id v21 = sub_10000BCE8(v20);
      swift_beginAccess();
      sub_1000260A0((uint64_t)v21, (uint64_t)v19, v22, v23, v24, v25, v26, v27, v34, v35);
      swift_endAccess();

      id v28 = *(os_unfair_lock_s **)(a3 + v16);
      swift_retain();
      os_unfair_lock_unlock(v28 + 4);
      swift_release();
      id v29 = [v19 endpoint];
      ((void (**)(void, id, void))a4)[2](a4, v29, 0);

      _Block_release(a4);
      return;
    }
    __break(1u);
    goto LABEL_11;
  }
  if (qword_1000621C0 != -1) {
LABEL_11:
  }
    swift_once();
  uint64_t v30 = sub_1000410D0();
  sub_100007B8C(v30, (uint64_t)qword_100064690);
  uint64_t v31 = sub_1000410C0();
  os_log_type_t v32 = sub_100041380();
  if (os_log_type_enabled(v31, v32))
  {
    id v33 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v33 = 0;
    _os_log_impl((void *)&_mh_execute_header, v31, v32, "LanguageDetector is not initialized", v33, 2u);
    swift_slowDealloc();
  }

  _Block_release(a4);
}

BOOL sub_10000B958(uint64_t a1, void *a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = OBJC_IVAR____TtC22localspeechrecognition19EARLanguageDetector_audioBufferListenerLock;
  id v7 = *(os_unfair_lock_s **)(v3 + OBJC_IVAR____TtC22localspeechrecognition19EARLanguageDetector_audioBufferListenerLock);
  swift_retain();
  os_unfair_lock_lock(v7 + 4);
  swift_release();
  swift_beginAccess();
  sub_100025978(a1, v8, v9, v10, v11, v12, v13, v14, (uint64_t)v25, v26);
  uint64_t v16 = v15;
  swift_endAccess();
  uint64_t v17 = *(os_unfair_lock_s **)(v3 + v6);
  swift_retain();
  os_unfair_lock_unlock(v17 + 4);
  swift_release();
  if (v16)
  {
    id v18 = self;
    id v19 = v16;
    id v20 = [v18 interfaceWithProtocol:&OBJC_PROTOCOL____SFXPCEARLanguageDetectorAudioBuffer];
    [a2 setExportedInterface:v20];

    [a2 setExportedObject:v19];
    uint64_t v21 = swift_allocObject();
    *(void *)(v21 + 16) = v19;
    id v29 = sub_10000CBA4;
    uint64_t v30 = v21;
    uint64_t v25 = _NSConcreteStackBlock;
    Swift::Int v26 = 1107296256;
    uint64_t v27 = sub_10001A460;
    id v28 = &unk_100059778;
    uint64_t v22 = _Block_copy(&v25);
    id v23 = v19;
    swift_release();
    [a2 setInvalidationHandler:v22];
    _Block_release(v22);
    [a2 activate];
  }
  return v16 != 0;
}

void sub_10000BBC0()
{
}

id sub_10000BC00()
{
  return sub_10000C2A0(type metadata accessor for EARLanguageDetector);
}

uint64_t type metadata accessor for EARLanguageDetector()
{
  return self;
}

id sub_10000BCE8(void *a1)
{
  uint64_t v3 = qword_1000621C0;
  uint64_t v4 = v1;
  if (v3 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_1000410D0();
  sub_100007B8C(v5, (uint64_t)qword_100064690);
  uint64_t v6 = sub_1000410C0();
  os_log_type_t v7 = sub_100041370();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)sub_10000CDEC();
    uint64_t v13 = sub_10000A780();
    *(_DWORD *)uint64_t v8 = 136315138;
    sub_10002E330(0x293A5F2874696E69, 0xE800000000000000, &v13);
    sub_10000CE04();
    sub_100041450();
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "EARLanguageDetectorAudioBuffer.%s", v8, 0xCu);
    swift_arrayDestroy();
    sub_10000A754();
    sub_10000A754();
  }

  *(void *)&v4[OBJC_IVAR____TtC22localspeechrecognition30EARLanguageDetectorAudioBuffer_audioBuffer] = a1;
  id v9 = a1;

  uint64_t v10 = (objc_class *)type metadata accessor for EARLanguageDetectorAudioBuffer();
  v14.receiver = v4;
  v14.Class super_class = v10;
  id v11 = objc_msgSendSuper2(&v14, "init");

  return v11;
}

void sub_10000BE80(uint64_t a1, unint64_t a2)
{
  uint64_t v3 = v2;
  if (qword_1000621C0 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_1000410D0();
  sub_100007B8C(v5, (uint64_t)qword_100064690);
  uint64_t v6 = sub_1000410C0();
  os_log_type_t v7 = sub_100041370();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)sub_10000CDEC();
    uint64_t v11 = sub_10000A780();
    *(_DWORD *)uint64_t v8 = 136315138;
    sub_10002E330(0xD000000000000016, 0x800000010004BE50, &v11);
    sub_10000CE04();
    sub_100041450();
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "EARLanguageDetectorAudioBuffer.%s", v8, 0xCu);
    swift_arrayDestroy();
    sub_10000A754();
    sub_10000A754();
  }

  if (a2 >> 60 == 15)
  {
    __break(1u);
  }
  else
  {
    id v9 = *(void **)(v3 + OBJC_IVAR____TtC22localspeechrecognition30EARLanguageDetectorAudioBuffer_audioBuffer);
    Class isa = sub_100040E90().super.isa;
    [v9 addAudioSampleData:isa];
  }
}

id sub_10000C0BC()
{
  uint64_t v1 = v0;
  if (qword_1000621C0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_1000410D0();
  sub_100007B8C(v2, (uint64_t)qword_100064690);
  uint64_t v3 = sub_1000410C0();
  os_log_type_t v4 = sub_100041370();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (_DWORD *)sub_10000CDEC();
    uint64_t v9 = sub_10000A780();
    *uint64_t v5 = 136315138;
    sub_10002E330(0x6F69647541646E65, 0xEA00000000002928, &v9);
    sub_10000CD88();
    sub_10000CDCC((void *)&_mh_execute_header, v6, v7, "EARLanguageDetectorAudioBuffer.%s");
    sub_10000CDB0();
    sub_10000A754();
    sub_10000A754();
  }

  return [*(id *)(v1 + OBJC_IVAR____TtC22localspeechrecognition30EARLanguageDetectorAudioBuffer_audioBuffer) endAudio];
}

void sub_10000C248()
{
}

id sub_10000C288()
{
  return sub_10000C2A0(type metadata accessor for EARLanguageDetectorAudioBuffer);
}

id sub_10000C2A0(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.Class super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, "dealloc");
}

uint64_t type metadata accessor for EARLanguageDetectorAudioBuffer()
{
  return self;
}

id sub_10000C30C(void *a1)
{
  id v3 = objc_allocWithZone((Class)NSXPCConnection);
  os_log_type_t v4 = v1;
  id v5 = [v3 initWithListenerEndpoint:a1];
  uint64_t v6 = OBJC_IVAR____TtC22localspeechrecognition31EARLanguageDetectorResultStream_connection;
  *(void *)&v4[OBJC_IVAR____TtC22localspeechrecognition31EARLanguageDetectorResultStream_connection] = v5;
  uint64_t v7 = self;
  id v8 = v5;
  id v9 = [v7 interfaceWithProtocol:&OBJC_PROTOCOL____SFXPCEARLanguageDetectorResultStream];
  [v8 setRemoteObjectInterface:v9];

  uint64_t v10 = *(void **)&v4[v6];
  [v10 activate];
  id v11 = [v10 remoteObjectProxy];
  sub_100041480();
  swift_unknownObjectRelease();
  sub_100007A58(&qword_100063268);
  swift_dynamicCast();
  *(void *)&v4[OBJC_IVAR____TtC22localspeechrecognition31EARLanguageDetectorResultStream_resultStreamProxy] = v15;

  v14.receiver = v4;
  v14.Class super_class = (Class)type metadata accessor for EARLanguageDetectorResultStream();
  id v12 = objc_msgSendSuper2(&v14, "init");

  return v12;
}

id sub_10000C480()
{
  [*(id *)&v0[OBJC_IVAR____TtC22localspeechrecognition31EARLanguageDetectorResultStream_connection] invalidate];
  v2.receiver = v0;
  v2.Class super_class = (Class)type metadata accessor for EARLanguageDetectorResultStream();
  return objc_msgSendSuper2(&v2, "dealloc");
}

id sub_10000C540()
{
  uint64_t v1 = v0;
  if (qword_1000621C0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_1000410D0();
  sub_100007B8C(v2, (uint64_t)qword_100064690);
  id v3 = sub_1000410C0();
  os_log_type_t v4 = sub_100041370();
  if (os_log_type_enabled(v3, v4))
  {
    id v5 = (_DWORD *)sub_10000CDEC();
    uint64_t v9 = sub_10000A780();
    *id v5 = 136315138;
    sub_10002E330(0xD00000000000002ELL, 0x800000010004BDE0, &v9);
    sub_10000CD88();
    sub_10000CDCC((void *)&_mh_execute_header, v6, v7, "EARLanguageDetectorResultStream.%s");
    sub_10000CDB0();
    sub_10000A754();
    sub_10000A754();
  }

  return [*(id *)(v1 + OBJC_IVAR____TtC22localspeechrecognition31EARLanguageDetectorResultStream_resultStreamProxy) languageDetectorDidFinishWithError:0];
}

void sub_10000C6F8(double a1, uint64_t a2, void *a3)
{
  uint64_t v4 = v3;
  if (qword_1000621C0 != -1) {
    swift_once();
  }
  uint64_t v7 = sub_1000410D0();
  sub_100007B8C(v7, (uint64_t)qword_100064690);
  id v8 = a3;
  uint64_t v9 = sub_1000410C0();
  os_log_type_t v10 = sub_100041370();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = swift_slowAlloc();
    id v12 = (void *)swift_slowAlloc();
    uint64_t v15 = sub_10000A780();
    *(_DWORD *)uint64_t v11 = 136315394;
    sub_10002E330(0xD000000000000036, 0x800000010004BDA0, &v15);
    sub_100041450();
    *(_WORD *)(v11 + 12) = 2112;
    id v13 = v8;
    sub_100041450();
    *id v12 = v8;

    _os_log_impl((void *)&_mh_execute_header, v9, v10, "EARLanguageDetectorResultStream.%s %@", (uint8_t *)v11, 0x16u);
    sub_100007A58(&qword_100063550);
    swift_arrayDestroy();
    sub_10000A754();
    sub_10000CDB0();
    sub_10000A754();
    sub_10000A754();
  }
  else
  {
  }
  id v14 = [objc_allocWithZone((Class)EARLanguageDetectorV2Result) initWithLanguageDetectorV2Result:v8];
  [*(id *)(v4 + OBJC_IVAR____TtC22localspeechrecognition31EARLanguageDetectorResultStream_resultStreamProxy) languageDetectorDidRecognizeResult:v14 processedAudioDuration:a1];
}

void sub_10000C9C8()
{
}

uint64_t type metadata accessor for EARLanguageDetectorResultStream()
{
  return self;
}

unint64_t sub_10000CA2C()
{
  unint64_t result = qword_100063240;
  if (!qword_100063240)
  {
    sub_10000CD4C(255, (unint64_t *)&qword_100063E40);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100063240);
  }
  return result;
}

id sub_10000CA8C(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  NSString v6 = sub_1000411E0();
  swift_bridgeObjectRelease();
  id v7 = objc_msgSend(a4, "lsr_errorWithCode:description:", a1, v6);

  return v7;
}

uint64_t sub_10000CB00(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_10000CB14(a1, a2);
  }
  return a1;
}

uint64_t sub_10000CB14(uint64_t a1, unint64_t a2)
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

uint64_t sub_10000CB6C()
{
  return _swift_deallocObject(v0, 24, 7);
}

id sub_10000CBA4()
{
  return sub_10000C0BC();
}

uint64_t sub_10000CBC8(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10000CBD8()
{
  return swift_release();
}

void sub_10000CBE0(uint64_t a1, void *a2)
{
  Class isa = sub_100041320().super.isa;
  swift_bridgeObjectRelease();
  [a2 setDictationLanguages:isa];
}

void sub_10000CC54(uint64_t a1, uint64_t a2, void *a3)
{
  NSString v4 = sub_1000411E0();
  swift_bridgeObjectRelease();
  [a3 setCurrentDictationLanguage:v4];
}

void sub_10000CCB8(uint64_t a1, void *a2)
{
  sub_10000CD4C(0, &qword_100063260);
  Class isa = sub_100041120().super.isa;
  swift_bridgeObjectRelease();
  [a2 setDictationLanguagePriors:isa];
}

uint64_t sub_10000CD4C(uint64_t a1, unint64_t *a2)
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

uint64_t sub_10000CD88()
{
  return sub_100041450();
}

uint64_t sub_10000CDB0()
{
  return swift_arrayDestroy();
}

void sub_10000CDCC(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v6, a4, v5, 0xCu);
}

uint64_t sub_10000CDEC()
{
  return swift_slowAlloc();
}

uint64_t sub_10000CE18()
{
  sub_10000FB6C();
  id v1 = objc_getAssociatedObject(v0, &unk_100063290);
  swift_endAccess();
  if (v1)
  {
    sub_100041480();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v4, 0, sizeof(v4));
  }
  sub_10000FA54((uint64_t)v4, (uint64_t)v5);
  if (v6)
  {
    if (swift_dynamicCast()) {
      return v3;
    }
  }
  else
  {
    sub_10000FABC((uint64_t)v5);
  }
  return 0;
}

uint64_t sub_10000CEE4()
{
  sub_10000FB6C();
  id v1 = objc_getAssociatedObject(v0, &unk_100063280);
  swift_endAccess();
  if (v1)
  {
    sub_100041480();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v4, 0, sizeof(v4));
  }
  sub_10000FA54((uint64_t)v4, (uint64_t)v5);
  if (v6)
  {
    if (swift_dynamicCast()) {
      return v3;
    }
  }
  else
  {
    sub_10000FABC((uint64_t)v5);
  }
  return 0;
}

void sub_10000CFAC()
{
  *(_WORD *)&algn_1000646B8[6] = -4864;
}

void sub_10000CFDC()
{
  qword_1000646C0 = 0x6F69746174636944;
  *(void *)algn_1000646C8 = 0xE90000000000006ELL;
}

void sub_10000D004()
{
  qword_1000646D0 = 1869899074;
  *(void *)algn_1000646D8 = 0xE400000000000000;
}

void sub_10000D020()
{
  *(_WORD *)&algn_1000646E8[6] = -4864;
}

void sub_10000D050()
{
  qword_1000646F0 = 0x6372616553626557;
  *(void *)algn_1000646F8 = 0xE900000000000068;
}

void sub_10000D078()
{
  qword_100064700 = 0x746F687354;
  *(void *)algn_100064708 = 0xE500000000000000;
}

uint64_t sub_10000D098()
{
  sub_100007A58(&qword_100063558);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_100046180;
  *(void *)(inited + 32) = 0xD000000000000011;
  *(void *)(inited + 40) = 0x800000010004C020;
  if (qword_1000621D8 != -1) {
    swift_once();
  }
  uint64_t v1 = *(void *)algn_1000646B8;
  *(void *)(inited + 48) = qword_1000646B0;
  *(void *)(inited + 56) = v1;
  uint64_t v2 = qword_1000621E8;
  swift_bridgeObjectRetain();
  if (v2 != -1) {
    swift_once();
  }
  uint64_t v3 = *(void *)algn_1000646D8;
  *(void *)(inited + 64) = qword_1000646D0;
  *(void *)(inited + 72) = v3;
  uint64_t v4 = qword_1000621F0;
  swift_bridgeObjectRetain();
  if (v4 != -1) {
    swift_once();
  }
  uint64_t v5 = *(void *)algn_1000646E8;
  *(void *)(inited + 80) = qword_1000646E0;
  *(void *)(inited + 88) = v5;
  swift_bridgeObjectRetain();
  uint64_t result = sub_10000F7D8(inited);
  qword_100064710 = result;
  return result;
}

uint64_t sub_10000D1D8()
{
  sub_100007A58(&qword_100063558);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_100046190;
  if (qword_1000621E0 != -1) {
    swift_once();
  }
  uint64_t v1 = *(void *)algn_1000646C8;
  *(void *)(inited + 32) = qword_1000646C0;
  *(void *)(inited + 40) = v1;
  uint64_t v2 = qword_1000621F8;
  swift_bridgeObjectRetain();
  if (v2 != -1) {
    swift_once();
  }
  uint64_t v3 = *(void *)algn_1000646F8;
  *(void *)(inited + 48) = qword_1000646F0;
  *(void *)(inited + 56) = v3;
  swift_bridgeObjectRetain();
  uint64_t result = sub_10000F7D8(inited);
  qword_100064718 = result;
  return result;
}

id sub_10000D2B8()
{
  id result = [objc_allocWithZone((Class)SPIPowerLogger) initWithCurrentProcess];
  qword_100064720 = (uint64_t)result;
  return result;
}

uint64_t sub_10000D2EC(uint64_t a1, uint64_t a2)
{
  if (qword_100062208 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  uint64_t v4 = swift_bridgeObjectRetain();
  char v5 = sub_10000D470(v4, a1, a2);
  swift_bridgeObjectRelease();
  if (qword_100062210 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  uint64_t v6 = swift_bridgeObjectRetain();
  char v7 = sub_10000D470(v6, a1, a2);
  swift_bridgeObjectRelease();
  id v8 = self;
  id v9 = [v8 sharedPreferences];
  unsigned __int8 v10 = [v9 isDictationHIPAACompliant];

  id v11 = [v8 sharedPreferences];
  id v12 = [v11 siriDataSharingOptInStatus];

  if (v5 & 1 | ((v7 & 1) == 0)) {
    char v13 = v5;
  }
  else {
    char v13 = (v12 == (id)1) & ~v10;
  }
  return v13 & 1;
}

uint64_t sub_10000D470(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = a1 + 56;
  uint64_t v7 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v8 = -1;
  if (v7 < 64) {
    uint64_t v8 = ~(-1 << v7);
  }
  unint64_t v9 = v8 & *(void *)(a1 + 56);
  int64_t v10 = (unint64_t)(v7 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v12 = 0;
  while (v9)
  {
    unint64_t v13 = __clz(__rbit64(v9));
    v9 &= v9 - 1;
    unint64_t v14 = v13 | (v12 << 6);
LABEL_21:
    id v18 = (void *)(*(void *)(a1 + 48) + 16 * v14);
    if (*v18 != a2 || v18[1] != a3)
    {
      uint64_t result = sub_100041720();
      if ((result & 1) == 0) {
        continue;
      }
    }
    swift_bridgeObjectRelease();
    swift_release();
    return 1;
  }
  int64_t v15 = v12 + 1;
  if (__OFADD__(v12, 1))
  {
    __break(1u);
    goto LABEL_29;
  }
  if (v15 >= v10) {
    goto LABEL_27;
  }
  unint64_t v16 = *(void *)(v6 + 8 * v15);
  ++v12;
  if (v16) {
    goto LABEL_20;
  }
  int64_t v12 = v15 + 1;
  if (v15 + 1 >= v10) {
    goto LABEL_27;
  }
  unint64_t v16 = *(void *)(v6 + 8 * v12);
  if (v16) {
    goto LABEL_20;
  }
  int64_t v12 = v15 + 2;
  if (v15 + 2 >= v10) {
    goto LABEL_27;
  }
  unint64_t v16 = *(void *)(v6 + 8 * v12);
  if (v16) {
    goto LABEL_20;
  }
  int64_t v12 = v15 + 3;
  if (v15 + 3 >= v10) {
    goto LABEL_27;
  }
  unint64_t v16 = *(void *)(v6 + 8 * v12);
  if (v16) {
    goto LABEL_20;
  }
  int64_t v17 = v15 + 4;
  if (v17 >= v10)
  {
LABEL_27:
    swift_bridgeObjectRelease();
    swift_release();
    return 0;
  }
  unint64_t v16 = *(void *)(v6 + 8 * v17);
  int64_t v12 = v17;
  if (v16)
  {
LABEL_20:
    unint64_t v9 = (v16 - 1) & v16;
    unint64_t v14 = __clz(__rbit64(v16)) + (v12 << 6);
    goto LABEL_21;
  }
  while (1)
  {
    int64_t v12 = v17 + 1;
    if (__OFADD__(v17, 1)) {
      break;
    }
    if (v12 >= v10) {
      goto LABEL_27;
    }
    unint64_t v16 = *(void *)(v6 + 8 * v12);
    ++v17;
    if (v16) {
      goto LABEL_20;
    }
  }
LABEL_29:
  __break(1u);
  return result;
}

unint64_t sub_10000D60C(double a1)
{
  double v1 = a1 * 1000000000.0;
  if ((~*(void *)&v1 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_6;
  }
  if (v1 <= -1.0)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  if (v1 < 1.84467441e19) {
    return (unint64_t)v1;
  }
LABEL_7:
  __break(1u);
  return result;
}

BOOL sub_10000D658()
{
  if (swift_dynamicCastObjCClass()) {
    return 1;
  }
  self;
  if (swift_dynamicCastObjCClass()) {
    return 1;
  }
  self;
  if (swift_dynamicCastObjCClass()) {
    return 1;
  }
  self;
  if (swift_dynamicCastObjCClass()) {
    return 1;
  }
  self;
  if (swift_dynamicCastObjCClass()) {
    return 1;
  }
  self;
  if (swift_dynamicCastObjCClass()) {
    return 1;
  }
  self;
  if (swift_dynamicCastObjCClass()) {
    return 1;
  }
  self;
  if (swift_dynamicCastObjCClass()) {
    return 1;
  }
  self;
  if (swift_dynamicCastObjCClass()) {
    return 1;
  }
  self;
  if (swift_dynamicCastObjCClass()) {
    return 1;
  }
  self;
  if (swift_dynamicCastObjCClass()) {
    return 1;
  }
  self;
  if (swift_dynamicCastObjCClass()) {
    return 1;
  }
  self;
  if (swift_dynamicCastObjCClass()) {
    return 1;
  }
  self;
  if (swift_dynamicCastObjCClass()) {
    return 1;
  }
  self;
  if (swift_dynamicCastObjCClass()) {
    return 1;
  }
  self;
  if (swift_dynamicCastObjCClass()) {
    return 1;
  }
  self;
  if (swift_dynamicCastObjCClass()) {
    return 1;
  }
  self;
  if (swift_dynamicCastObjCClass()) {
    return 1;
  }
  self;
  if (swift_dynamicCastObjCClass()) {
    return 1;
  }
  self;
  if (swift_dynamicCastObjCClass()) {
    return 1;
  }
  self;
  if (swift_dynamicCastObjCClass()) {
    return 1;
  }
  self;
  if (swift_dynamicCastObjCClass()) {
    return 1;
  }
  self;
  return swift_dynamicCastObjCClass() != 0;
}

uint64_t sub_10000D908(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    type metadata accessor for SelfLoggingHelper();
    BOOL v5 = sub_10000D658();
    char v6 = (v5 | sub_10000D2EC(a2, a3)) ^ 1;
  }
  else
  {
    char v6 = 1;
  }
  return v6 & 1;
}

id sub_10000D970(uint64_t a1)
{
  id v2 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  Class isa = sub_100040EF0().super.isa;
  id v4 = [v2 initWithNSUUID:isa];

  uint64_t v5 = sub_100040F20();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(a1, v5);
  return v4;
}

uint64_t sub_10000DA0C(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000011 && a2 == 0x800000010004C020 || (sub_10000FB34() & 1) != 0) {
    return 1;
  }
  if (qword_1000621E0 != -1) {
    swift_once();
  }
  BOOL v5 = qword_1000646C0 == a1 && *(void *)algn_1000646C8 == a2;
  if (v5 || (sub_10000FB34() & 1) != 0) {
    return 2;
  }
  if (qword_1000621F8 != -1) {
    swift_once();
  }
  BOOL v6 = qword_1000646F0 == a1 && *(void *)algn_1000646F8 == a2;
  if (v6 || (sub_10000FB34() & 1) != 0) {
    return 3;
  }
  if (qword_100062200 != -1) {
    swift_once();
  }
  BOOL v7 = qword_100064700 == a1 && *(void *)algn_100064708 == a2;
  if (v7 || (sub_10000FB34() & 1) != 0) {
    return 4;
  }
  if (qword_1000621D8 != -1) {
    swift_once();
  }
  uint64_t v4 = 5;
  if (qword_1000646B0 != a1 || *(void *)algn_1000646B8 != a2)
  {
    if (sub_10000FB34()) {
      return 5;
    }
    else {
      return 0;
    }
  }
  return v4;
}

void *sub_10000DBE4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_10000DCEC(a1, a2, a3, (Class *)ASRSchemaASRAppleNeuralEngineModelInitializationStarted_ptr, (SEL *)&selRef_setStartedOrChanged_);
}

void sub_10000DBF8()
{
  NSString v1 = sub_1000411E0();
  swift_bridgeObjectRelease();
  sub_10000FB6C();
  objc_setAssociatedObject(v0, &unk_100063290, v1, (void *)1);
  swift_endAccess();
}

void sub_10000DC68()
{
  Class isa = sub_1000417B0().super.super.isa;
  swift_beginAccess();
  objc_setAssociatedObject(v0, &unk_100063280, isa, (void *)1);
  swift_endAccess();
}

void *sub_10000DCD8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_10000DCEC(a1, a2, a3, (Class *)ASRSchemaASRAppleNeuralEngineModelInitializationEnded_ptr, (SEL *)&selRef_setEnded_);
}

void *sub_10000DCEC(uint64_t a1, uint64_t a2, uint64_t a3, Class *a4, SEL *a5)
{
  id v6 = [objc_allocWithZone(*a4) init];
  BOOL v7 = v6;
  if (v6) {
    [v6 setExists:1];
  }
  id v8 = [objc_allocWithZone((Class)ASRSchemaASRAppleNeuralEngineModelInitializationContext) init];
  unint64_t v9 = v8;
  if (v8)
  {
    id v10 = v8;
    swift_bridgeObjectRetain();
    sub_10000DBF8();

    id v11 = v10;
    sub_10000DC68();
  }
  id v12 = v9;
  objc_msgSend(v12, *a5, v7);

  return v9;
}

uint64_t sub_10000DDD4(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  if (a4 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t result = sub_1000416B0();
    uint64_t v5 = result;
    if (!result) {
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v5 = *(void *)((a4 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (!v5) {
      goto LABEL_9;
    }
  }
  if (v5 < 1)
  {
    __break(1u);
    return result;
  }
  uint64_t v7 = 0;
  do
  {
    if ((a4 & 0xC000000000000001) != 0) {
      id v8 = (id)sub_100041590();
    }
    else {
      id v8 = *(id *)(a4 + 8 * v7 + 32);
    }
    unint64_t v9 = v8;
    ++v7;
    sub_10000CEE4();
    uint64_t v10 = sub_10000FB5C();
    sub_10000EA4C(v10, v11, v12, v9, v13);
  }
  while (v5 != v7);
LABEL_9:
  sub_1000082D8();
  return swift_bridgeObjectRelease();
}

void sub_10000DED8(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
}

void sub_10000DEF4(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
}

void sub_10000DF10(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
}

void sub_10000DF2C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
}

void sub_10000DF48(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, Class *a5, SEL *a6)
{
  id v18 = [objc_allocWithZone(*a5) init];
  if (v18) {
    [v18 setExists:1];
  }
  id v11 = [objc_allocWithZone((Class)ASRSchemaASRActiveConfigUpdateContext) init];
  objc_msgSend(v11, *a6, v18);
  id v12 = v11;
  sub_10000EA4C(a1, a2, a3, v11, a4);

  if (qword_100062218 != -1) {
    swift_once();
  }
  id v13 = [(id)qword_100064720 captureSnapshot];
  if (v13)
  {
    uint64_t v14 = v13;
    id v15 = [self context];
    if (!v15)
    {
      __break(1u);
      return;
    }
    unint64_t v16 = v15;
    Class isa = sub_100040EF0().super.isa;
    [v14 logWithEventContext:v16 asrIdentifier:isa];
  }
}

void sub_10000E0D8(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
}

void sub_10000E0F4(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, Class *a5, Class *a6, SEL *a7)
{
  id v13 = [objc_allocWithZone(*a5) init];
  uint64_t v14 = v13;
  if (v13) {
    [v13 setExists:1];
  }
  id v15 = [objc_allocWithZone(*a6) init];
  objc_msgSend(v15, *a7, v14);
  id v16 = v15;
  sub_10000EA4C(a1, a2, a3, v15, a4);
}

void sub_10000E1E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v7 = sub_100040F20();
  __chkstk_darwin(v7 - 8);
  sub_100008250();
  uint64_t v10 = v9 - v8;
  id v11 = [objc_allocWithZone((Class)ASRSchemaASRJitLanguageModelEnrollmentEndedTier1) init];
  sub_10000CD4C(0, &qword_100063548);
  id v12 = [objc_allocWithZone((Class)NSUUID) init];
  sub_100040F10();

  id v13 = sub_10000D970(v10);
  if (v11)
  {
    [v11 setLinkId:v13];
    id v14 = v11;
    sub_10000F9F4(a5, v14);
  }
  id v15 = [objc_allocWithZone((Class)ASRSchemaASRJitLanguageModelEnrollmentEnded) init];
  id v16 = v15;
  if (v15) {
    [v15 setLinkId:v13];
  }
  id v17 = [objc_allocWithZone((Class)ASRSchemaASRJitLanguageModelEnrollmentContext) init];
  [v17 setEnded:v16];
  id v18 = v11;
  uint64_t v19 = sub_10000FB5C();
  sub_10000EA4C(v19, v20, v21, v11, a4);

  id v22 = v17;
  uint64_t v23 = sub_10000FB5C();
  sub_10000EA4C(v23, v24, v25, v17, a4);

  sub_1000082D8();
}

void sub_10000E3AC(uint64_t a1, uint64_t a2, unint64_t a3, double a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8, char a9, uint64_t a10, void *a11, uint64_t a12, void *a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18, char a19, uint64_t a20,unsigned __int8 a21)
{
  uint64_t v26 = sub_100040F20();
  __chkstk_darwin(v26 - 8);
  sub_100008250();
  uint64_t v29 = v28 - v27;
  id v30 = [objc_allocWithZone((Class)ASRSchemaASRStarted) init];
  if (!a3)
  {

    return;
  }
  v65 = v30;
  if (v30)
  {
    id v31 = v30;
    objc_msgSend(v31, "setTask:", sub_10000DA0C(a2, a3));

    id v30 = v65;
    if (a6)
    {
      uint64_t v32 = a1;
      uint64_t v33 = self;
      sub_10000F9A8();
      id v34 = v31;
      sub_100041470();
      NSString v35 = sub_1000411E0();
      swift_bridgeObjectRelease();
      uint64_t v36 = (void *)v33;
      a1 = v32;
      id v37 = [v36 convertLanguageCodeToSchemaLocale:v35];

      [v34 setModelLocale:v37];
      id v30 = v65;
    }
  }
  [v30 setIsHighQualityAsset:a9 & 1];
  if (a16 && (sub_10000CD4C(0, &qword_100063568), swift_bridgeObjectRetain(), (id v38 = sub_10000E9D8()) != 0))
  {
    Class v39 = v38;
    sub_10000CD4C(0, &qword_100063548);
    sub_100040F10();
    id v40 = sub_10000D970(v29);
    uint64_t v41 = &selRef_initWithInterpretationIndices_confidenceScore_;
    if (v65)
    {
      id v42 = v65;
      id v43 = v40;
      [v42 setDictationUiInteractionId:v43];

      uint64_t v44 = a20;
      int v45 = a21;
      if (a4 <= 0.0) {
        goto LABEL_17;
      }
LABEL_12:
      type metadata accessor for SelfLoggingHelper();
      unint64_t v46 = sub_10000D60C(a4);
LABEL_18:
      uint64_t v47 = a8;
      [v65 setSpeechProfileAgeInNs:v46];
      NSString v48 = v65;
      if (a8)
      {
        NSString v48 = sub_1000411E0();
        uint64_t v47 = v48;
      }
      char v49 = a19;
      sub_10000FBA0((uint64_t)v48, "setDatapackVersion:");

      char v50 = a11;
      NSString v51 = v65;
      if (a11)
      {
        NSString v51 = sub_1000411E0();
        char v50 = v51;
      }
      sub_10000FBA0((uint64_t)v51, "setHammerVersion:");

      v52 = a13;
      NSString v53 = v65;
      if (a13)
      {
        NSString v53 = sub_1000411E0();
        v52 = v53;
      }
      sub_10000FBA0((uint64_t)v53, "setGeoLanguageModelRegion:");

      [v65 setGeoLanguageModelLoaded:a14 & 1];
      uint64_t v54 = a18;
      NSString v55 = v65;
      if (a18)
      {
        NSString v55 = sub_1000411E0();
        uint64_t v54 = v55;
      }
      sub_10000FBA0((uint64_t)v55, "setPortraitExperimentVariantName:");

      goto LABEL_29;
    }

    uint64_t v44 = a20;
    int v45 = a21;
  }
  else
  {
    uint64_t v41 = &selRef_initWithInterpretationIndices_confidenceScore_;
    if (a4 <= 0.0)
    {
      uint64_t v44 = a20;
      int v45 = a21;
      if (v65)
      {
LABEL_17:
        unint64_t v46 = 0x7FFFFFFFFFFFFFFFLL;
        goto LABEL_18;
      }
    }
    else
    {
      uint64_t v44 = a20;
      int v45 = a21;
      if (v65) {
        goto LABEL_12;
      }
    }
  }
  [v65 setGeoLanguageModelLoaded:a14 & 1];
  char v49 = a19;
LABEL_29:
  [v65 setAtypicalSpeechEnabled:v49 & 1];
  if (v45 != 2) {
    [v65 setIsEmptyTextField:v45 & 1];
  }
  id v56 = [objc_allocWithZone((Class)ASRSchemaASRRequestContext) v41[295]];
  [v56 setStartedOrChanged:v65];
  id v57 = v56;
  sub_10000EA4C(a1, a2, a3, v56, v44);

  if (qword_100062218 != -1) {
    swift_once();
  }
  id v58 = [(id)qword_100064720 captureSnapshot];
  if (!v58) {
    goto LABEL_36;
  }
  uint64_t v59 = v58;
  id v60 = [self context];
  if (v60)
  {
    os_signpost_id_t v61 = v60;
    Class isa = sub_100040EF0().super.isa;
    [v59 logWithEventContext:v61 asrIdentifier:isa];

LABEL_36:
    return;
  }
  __break(1u);
}

id sub_10000E9D8()
{
  id v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  NSString v1 = sub_1000411E0();
  swift_bridgeObjectRelease();
  id v2 = [v0 initWithUUIDString:v1];

  return v2;
}

void sub_10000EA4C(uint64_t a1, uint64_t a2, unint64_t a3, void *a4, uint64_t a5)
{
  uint64_t v11 = sub_100040F20();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  sub_100008250();
  uint64_t v15 = v14 - v13;
  if (!a4)
  {
    sub_10000FB50();
    if (!v16) {
      swift_once();
    }
    uint64_t v23 = sub_1000410D0();
    sub_100007B8C(v23, (uint64_t)qword_100064678);
    v84 = sub_1000410C0();
    os_log_type_t v24 = sub_100041380();
    if (os_log_type_enabled(v84, v24))
    {
      unint64_t v25 = (uint8_t *)sub_10000FB88();
      *(_WORD *)unint64_t v25 = 0;
      _os_log_impl((void *)&_mh_execute_header, v84, v24, "topLevelEvent is nil", v25, 2u);
      sub_10000A754();
    }
    goto LABEL_27;
  }
  uint64_t v80 = v5;
  type metadata accessor for SelfLoggingHelper();
  id v82 = a4;
  if (sub_10000D908((uint64_t)v82, a2, a3))
  {
    sub_10000FB50();
    if (!v16) {
      swift_once();
    }
    uint64_t v17 = sub_1000410D0();
    sub_100007B8C(v17, (uint64_t)qword_100064678);
    id v18 = v82;
    swift_bridgeObjectRetain_n();
    char v83 = v18;
    uint64_t v19 = sub_1000410C0();
    os_log_type_t v20 = sub_100041380();
    if (os_log_type_enabled(v19, v20))
    {
      uint64_t v21 = swift_slowAlloc();
      uint64_t v78 = (void *)swift_slowAlloc();
      v85 = swift_slowAlloc();
      *(_DWORD *)uint64_t v21 = 138412546;
      id v22 = v83;
      sub_100041450();
      *uint64_t v78 = a4;

      *(_WORD *)(v21 + 12) = 2080;
      swift_bridgeObjectRetain();
      sub_10002E330(a2, a3, (uint64_t *)&v85);
      sub_100041450();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v19, v20, "Logging prohibited for event:%@ task:%s", (uint8_t *)v21, 0x16u);
      sub_100007A58(&qword_100063550);
      swift_arrayDestroy();
      sub_10000A754();
      swift_arrayDestroy();
      sub_10000A754();
      sub_10000A754();

      goto LABEL_7;
    }

    swift_bridgeObjectRelease_n();
    uint64_t v32 = v83;
    goto LABEL_26;
  }
  id v26 = [objc_allocWithZone((Class)ASRSchemaASRClientEventMetadata) init];
  if (v26)
  {
    uint64_t v27 = v26;
    sub_10000CD4C(0, &qword_100063548);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 16))(v15, a1, v11);
    id v28 = sub_10000D970(v15);
    [v27 setAsrId:v28];

    id v29 = [objc_allocWithZone((Class)ASRSchemaASRClientEvent) init];
    if (v29)
    {
      id v30 = v29;
      [v29 setEventMetadata:v27];
      self;
      uint64_t v31 = sub_10000FB1C();
      if (v31)
      {
        [v30 setPreheatContext:v31];
      }
      else
      {
        self;
        uint64_t v41 = sub_10000FB1C();
        if (v41)
        {
          [v30 setRequestContext:v41];
        }
        else
        {
          self;
          uint64_t v42 = sub_10000FB1C();
          if (v42)
          {
            [v30 setPartialResultGenerated:v42];
          }
          else
          {
            self;
            uint64_t v43 = sub_10000FB1C();
            if (v43)
            {
              [v30 setPackageGenerated:v43];
            }
            else
            {
              self;
              uint64_t v44 = sub_10000FB1C();
              if (v44)
              {
                [v30 setRecognitionResultTier1:v44];
              }
              else
              {
                self;
                uint64_t v45 = sub_10000FB1C();
                if (v45)
                {
                  [v30 setRescoringDeliberationResultTier1:v45];
                }
                else
                {
                  self;
                  uint64_t v46 = sub_10000FB1C();
                  if (v46)
                  {
                    [v30 setFinalResultGenerated:v46];
                  }
                  else
                  {
                    self;
                    uint64_t v47 = sub_10000FB1C();
                    if (v47)
                    {
                      [v30 setIntermediateUtteranceInfoTier1:v47];
                    }
                    else
                    {
                      self;
                      uint64_t v48 = sub_10000FB1C();
                      if (v48)
                      {
                        [v30 setInitializationContext:v48];
                      }
                      else
                      {
                        self;
                        uint64_t v49 = sub_10000FB1C();
                        if (v49)
                        {
                          [v30 setActiveConfigUpdateContext:v49];
                        }
                        else
                        {
                          self;
                          uint64_t v50 = sub_10000FB1C();
                          if (v50)
                          {
                            [v30 setLanguageModelEnrollmentContext:v50];
                          }
                          else
                          {
                            self;
                            uint64_t v51 = sub_10000FB1C();
                            if (v51)
                            {
                              [v30 setJitLanguageModelEnrollmentEndedTier1:v51];
                            }
                            else
                            {
                              self;
                              uint64_t v52 = sub_10000FB1C();
                              if (v52)
                              {
                                [v30 setAudioPacketArrivalContext:v52];
                              }
                              else
                              {
                                self;
                                uint64_t v53 = sub_10000FB1C();
                                if (v53)
                                {
                                  [v30 setFirstAudioPacketProcessed:v53];
                                }
                                else
                                {
                                  self;
                                  uint64_t v54 = sub_10000FB1C();
                                  if (v54)
                                  {
                                    [v30 setFinalAudioPacketContainingSpeechReceived:v54];
                                  }
                                  else
                                  {
                                    self;
                                    uint64_t v55 = sub_10000FB1C();
                                    if (v55)
                                    {
                                      [v30 setEmbeddedSpeechProcessContext:v55];
                                    }
                                    else
                                    {
                                      self;
                                      uint64_t v56 = sub_10000FB1C();
                                      if (v56)
                                      {
                                        [v30 setAppleNeuralEngineModelInitializationContext:v56];
                                      }
                                      else
                                      {
                                        self;
                                        uint64_t v57 = sub_10000FB1C();
                                        if (v57)
                                        {
                                          [v30 setFrameProcessingReady:v57];
                                        }
                                        else
                                        {
                                          self;
                                          uint64_t v58 = sub_10000FB1C();
                                          if (v58)
                                          {
                                            [v30 setAudioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived:v58];
                                          }
                                          else
                                          {
                                            self;
                                            uint64_t v59 = sub_10000FB1C();
                                            if (v59)
                                            {
                                              [v30 setAudioSpeechPacketArrivalContext:v59];
                                            }
                                            else
                                            {
                                              self;
                                              uint64_t v60 = sub_10000FB1C();
                                              if (v60)
                                              {
                                                [v30 setLeadingSilenceProcessed:v60];
                                              }
                                              else
                                              {
                                                self;
                                                uint64_t v61 = sub_10000FB1C();
                                                if (v61)
                                                {
                                                  [v30 setFirstSecondAfterLeadingSilenceProcessed:v61];
                                                }
                                                else
                                                {
                                                  self;
                                                  uint64_t v62 = sub_10000FB1C();
                                                  if (v62)
                                                  {
                                                    [v30 setFirstAudioPacketRecorded:v62];
                                                  }
                                                  else
                                                  {
                                                    self;
                                                    uint64_t v63 = sub_10000FB1C();
                                                    if (v63)
                                                    {
                                                      [v30 setAudioPacketContainingEndOfFirstWordReadyUpstream:v63];
                                                    }
                                                    else
                                                    {
                                                      self;
                                                      uint64_t v64 = sub_10000FB1C();
                                                      if (v64)
                                                      {
                                                        [v30 setFirstAudioPacketReadyUpstream:v64];
                                                      }
                                                      else
                                                      {
                                                        self;
                                                        uint64_t v65 = sub_10000FB1C();
                                                        if (v65)
                                                        {
                                                          [v30 setFinalAudioPacketContainingSpeechReadyUpstream:v65];
                                                        }
                                                        else
                                                        {
                                                          self;
                                                          uint64_t v66 = sub_10000FB1C();
                                                          if (v66)
                                                          {
                                                            [v30 setDictationVoiceCommandMetricsReported:v66];
                                                          }
                                                          else
                                                          {
                                                            self;
                                                            uint64_t v67 = sub_10000FB1C();
                                                            if (v67)
                                                            {
                                                              [v30 setDictationVoiceCommandInfoTier1:v67];
                                                            }
                                                            else
                                                            {
                                                              sub_10000FB50();
                                                              if (!v16) {
                                                                swift_once();
                                                              }
                                                              uint64_t v74 = sub_1000410D0();
                                                              sub_100007B8C(v74, (uint64_t)qword_100064678);
                                                              v75 = sub_1000410C0();
                                                              os_log_type_t v76 = sub_100041380();
                                                              if (os_log_type_enabled(v75, v76))
                                                              {
                                                                uint64_t v77 = (uint8_t *)sub_10000FB88();
                                                                *(_WORD *)uint64_t v77 = 0;
                                                                _os_log_impl((void *)&_mh_execute_header, v75, v76, "SELF: Failed trying to wrap and emit top-level ASR event because event type was not mapped to loggable message type in the ASR SELF schema.", v77, 2u);
                                                                sub_10000A754();
                                                              }
                                                            }
                                                          }
                                                        }
                                                      }
                                                    }
                                                  }
                                                }
                                              }
                                            }
                                          }
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
      sub_10000FB50();
      if (!v16) {
        swift_once();
      }
      uint64_t v68 = sub_1000410D0();
      sub_100007B8C(v68, (uint64_t)qword_100064678);
      uint64_t v69 = v82;
      uint64_t v70 = sub_1000410C0();
      os_log_type_t v71 = sub_100041370();
      if (os_log_type_enabled(v70, v71))
      {
        uint64_t v72 = (uint8_t *)swift_slowAlloc();
        uint64_t v79 = (void *)swift_slowAlloc();
        *(_DWORD *)uint64_t v72 = 138412290;
        v85 = v69;
        os_log_t v73 = v69;
        sub_100041450();
        *uint64_t v79 = a4;

        _os_log_impl((void *)&_mh_execute_header, v70, v71, "SELF: Wrapping and logging an event of type %@", v72, 0xCu);
        sub_100007A58(&qword_100063550);
        swift_arrayDestroy();
        sub_10000A754();
        sub_10000A754();
      }
      else
      {

        uint64_t v70 = v69;
      }

      if (a5)
      {
        [*(id *)(v80 + 16) emitMessage:v30 timestamp:sub_10000F654(a5)];
      }
      else
      {
        [*(id *)(v80 + 16) emitMessage:v30];
      }
      goto LABEL_94;
    }
    sub_10000FB50();
    if (!v16) {
      swift_once();
    }
    uint64_t v36 = sub_1000410D0();
    sub_100007B8C(v36, (uint64_t)qword_100064678);
    uint64_t v19 = sub_1000410C0();
    os_log_type_t v37 = sub_100041380();
    if (!os_log_type_enabled(v19, v37))
    {

      goto LABEL_94;
    }
    id v38 = (uint8_t *)sub_10000FB88();
    *(_WORD *)id v38 = 0;
    _os_log_impl((void *)&_mh_execute_header, v19, v37, "Failed to create SELF event", v38, 2u);
    sub_10000A754();

LABEL_7:
LABEL_94:
    sub_1000082D8();
    return;
  }
  sub_10000FB50();
  if (!v16) {
    swift_once();
  }
  uint64_t v33 = sub_1000410D0();
  sub_100007B8C(v33, (uint64_t)qword_100064678);
  uint64_t v81 = sub_1000410C0();
  os_log_type_t v34 = sub_100041380();
  if (!os_log_type_enabled(v81, v34))
  {
    uint64_t v32 = v81;
LABEL_26:

    goto LABEL_27;
  }
  NSString v35 = (uint8_t *)sub_10000FB88();
  *(_WORD *)NSString v35 = 0;
  _os_log_impl((void *)&_mh_execute_header, v81, v34, "Failed to create SELF event metadata", v35, 2u);
  sub_10000A754();

LABEL_27:
  sub_1000082D8();
}

uint64_t sub_10000F654(uint64_t a1)
{
  return a1;
}

uint64_t SelfLoggingHelper.deinit()
{
  swift_unknownObjectRelease();
  return v0;
}

uint64_t SelfLoggingHelper.__deallocating_deinit()
{
  swift_unknownObjectRelease();

  return _swift_deallocClassInstance(v0, 24, 7);
}

id *SelfLoggingPreheatWithPowerContainer.deinit()
{
  return v0;
}

uint64_t SelfLoggingPreheatWithPowerContainer.__deallocating_deinit()
{
  SelfLoggingPreheatWithPowerContainer.deinit();

  return _swift_deallocClassInstance(v0, 40, 7);
}

uint64_t type metadata accessor for SelfLoggingHelper()
{
  return self;
}

uint64_t type metadata accessor for SelfLoggingPreheatWithPowerContainer()
{
  return self;
}

uint64_t sub_10000F7D8(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = &_swiftEmptySetSingleton;
    goto LABEL_25;
  }
  sub_100007A58(&qword_100063560);
  uint64_t result = sub_100041550();
  uint64_t v3 = (unsigned char *)result;
  uint64_t v24 = *(void *)(a1 + 16);
  if (!v24)
  {
LABEL_25:
    swift_bridgeObjectRelease();
    return (uint64_t)v3;
  }
  unint64_t v4 = 0;
  uint64_t v5 = result + 56;
  while (v4 < *(void *)(a1 + 16))
  {
    id v6 = (uint64_t *)(a1 + 32 + 16 * v4);
    uint64_t v8 = *v6;
    uint64_t v7 = v6[1];
    sub_100041780();
    swift_bridgeObjectRetain();
    sub_100041220();
    uint64_t result = sub_1000417A0();
    uint64_t v9 = -1 << v3[32];
    unint64_t v10 = result & ~v9;
    unint64_t v11 = v10 >> 6;
    uint64_t v12 = *(void *)(v5 + 8 * (v10 >> 6));
    uint64_t v13 = 1 << v10;
    if (((1 << v10) & v12) != 0)
    {
      uint64_t v14 = *((void *)v3 + 6);
      uint64_t v15 = (void *)(v14 + 16 * v10);
      BOOL v16 = *v15 == v8 && v15[1] == v7;
      if (v16 || (uint64_t result = sub_100041720(), (result & 1) != 0))
      {
LABEL_11:
        uint64_t result = swift_bridgeObjectRelease();
        goto LABEL_22;
      }
      uint64_t v17 = ~v9;
      while (1)
      {
        unint64_t v10 = (v10 + 1) & v17;
        unint64_t v11 = v10 >> 6;
        uint64_t v12 = *(void *)(v5 + 8 * (v10 >> 6));
        uint64_t v13 = 1 << v10;
        if ((v12 & (1 << v10)) == 0) {
          break;
        }
        id v18 = (void *)(v14 + 16 * v10);
        if (*v18 != v8 || v18[1] != v7)
        {
          uint64_t result = sub_100041720();
          if ((result & 1) == 0) {
            continue;
          }
        }
        goto LABEL_11;
      }
    }
    *(void *)(v5 + 8 * v11) = v13 | v12;
    os_log_type_t v20 = (void *)(*((void *)v3 + 6) + 16 * v10);
    *os_log_type_t v20 = v8;
    v20[1] = v7;
    uint64_t v21 = *((void *)v3 + 2);
    BOOL v22 = __OFADD__(v21, 1);
    uint64_t v23 = v21 + 1;
    if (v22) {
      goto LABEL_27;
    }
    *((void *)v3 + 2) = v23;
LABEL_22:
    if (++v4 == v24) {
      goto LABEL_25;
    }
  }
  __break(1u);
LABEL_27:
  __break(1u);
  return result;
}

unint64_t sub_10000F9A8()
{
  unint64_t result = qword_100063570;
  if (!qword_100063570)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100063570);
  }
  return result;
}

void sub_10000F9F4(uint64_t a1, void *a2)
{
  Class isa = sub_100041260().super.isa;
  [a2 setDialogContexts:isa];
}

uint64_t sub_10000FA54(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100007A58(&qword_100064170);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000FABC(uint64_t a1)
{
  uint64_t v2 = sub_100007A58(&qword_100064170);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10000FB1C()
{
  return swift_dynamicCastObjCClass();
}

uint64_t sub_10000FB34()
{
  return sub_100041720();
}

uint64_t sub_10000FB5C()
{
  return v0;
}

uint64_t sub_10000FB6C()
{
  return swift_beginAccess();
}

uint64_t sub_10000FB88()
{
  return swift_slowAlloc();
}

id sub_10000FBA0(uint64_t a1, const char *a2)
{
  uint64_t v5 = *(void **)(v3 - 160);
  return objc_msgSend(v5, a2, v2);
}

void sub_10000FBB8()
{
  qword_100063578 = 0x746163696C707041;
  unk_100063580 = 0xEF656D614E6E6F69;
}

void sub_10000FBE8()
{
  qword_100063588 = 0x65676175676E614CLL;
  unk_100063590 = 0xE800000000000000;
}

void sub_10000FC0C()
{
  unk_1000635A5 = 0;
  unk_1000635A6 = -5120;
}

void sub_10000FC38(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_100007A58(&qword_100063668);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_100046240;
  *(void *)(inited + 32) = 0x6E65764520525341;
  *(void *)(inited + 40) = 0xE900000000000074;
  *(void *)(inited + 48) = a1;
  *(void *)(inited + 56) = a2;
  swift_bridgeObjectRetain();
  uint64_t v7 = sub_100041140();
  if (a3)
  {
    swift_bridgeObjectRetain();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v11 = v7;
    sub_1000100F0(a3, (uint64_t)sub_100010300, 0, isUniquelyReferenced_nonNull_native, &v11);
    uint64_t v7 = v11;
    swift_bridgeObjectRelease();
  }
  NSString v9 = sub_1000411E0();
  sub_10001A4A4(v7);
  swift_bridgeObjectRelease();
  Class isa = sub_100041120().super.isa;
  swift_bridgeObjectRelease();
  SFPLLogRegisteredEvent();
}

uint64_t sub_10000FDC0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  sub_100007A58(&qword_100063668);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_100046240;
  if (qword_100062220 != -1) {
    swift_once();
  }
  uint64_t v13 = unk_100063580;
  *(void *)(inited + 32) = qword_100063578;
  *(void *)(inited + 40) = v13;
  *(void *)(inited + 48) = a1;
  *(void *)(inited + 56) = a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v14 = sub_100041140();
  uint64_t v23 = v14;
  if (qword_100062228 != -1) {
    swift_once();
  }
  uint64_t v16 = qword_100063588;
  uint64_t v15 = unk_100063590;
  swift_bridgeObjectRetain();
  if (a4)
  {
    swift_bridgeObjectRetain();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    sub_100026E7C(a3, a4, v16, v15, isUniquelyReferenced_nonNull_native);
    uint64_t v23 = v14;
  }
  else
  {
    sub_100025890(v16, v15);
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (qword_100062230 != -1) {
    swift_once();
  }
  uint64_t v19 = qword_100063598;
  uint64_t v18 = unk_1000635A0;
  swift_bridgeObjectRetain();
  if (a6)
  {
    swift_bridgeObjectRetain();
    char v20 = swift_isUniquelyReferenced_nonNull_native();
    sub_100026E7C(a5, a6, v19, v18, v20);
    uint64_t v21 = v23;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_100025890(v19, v18);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v21 = v23;
  }
  sub_10000FC38(0xD000000000000024, 0x800000010004C070, v21);
  return swift_bridgeObjectRelease();
}

uint64_t type metadata accessor for PowerlogHelper()
{
  return self;
}

uint64_t sub_1000100A4(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *a1 = a4;
  a1[1] = a5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a2;
}

uint64_t sub_1000100F0(uint64_t a1, uint64_t a2, uint64_t a3, char a4, void *a5)
{
  sub_100010344(a1, a2, a3, &v35);
  swift_bridgeObjectRetain();
  swift_retain();
  uint64_t v7 = sub_100010380();
  if (v8)
  {
    uint64_t v11 = v7;
    uint64_t v12 = v8;
    uint64_t v13 = v9;
    uint64_t v14 = v10;
    while (1)
    {
      uint64_t v15 = (void *)*a5;
      unint64_t v17 = sub_1000255D4(v11, v12);
      uint64_t v18 = v15[2];
      BOOL v19 = (v16 & 1) == 0;
      uint64_t v20 = v18 + v19;
      if (__OFADD__(v18, v19)) {
        break;
      }
      char v21 = v16;
      if (v15[3] >= v20)
      {
        if ((a4 & 1) == 0)
        {
          sub_100007A58(&qword_100064210);
          sub_100041630();
        }
      }
      else
      {
        sub_1000266D8(v20, a4 & 1);
        unint64_t v22 = sub_1000255D4(v11, v12);
        if ((v21 & 1) != (v23 & 1)) {
          goto LABEL_17;
        }
        unint64_t v17 = v22;
      }
      uint64_t v24 = (void *)*a5;
      if (v21)
      {
        swift_bridgeObjectRelease();
        unint64_t v25 = (void *)(v24[7] + 16 * v17);
        swift_bridgeObjectRelease();
        void *v25 = v13;
        v25[1] = v14;
      }
      else
      {
        v24[(v17 >> 6) + 8] |= 1 << v17;
        id v26 = (uint64_t *)(v24[6] + 16 * v17);
        *id v26 = v11;
        v26[1] = v12;
        uint64_t v27 = (void *)(v24[7] + 16 * v17);
        void *v27 = v13;
        v27[1] = v14;
        uint64_t v28 = v24[2];
        BOOL v29 = __OFADD__(v28, 1);
        uint64_t v30 = v28 + 1;
        if (v29) {
          goto LABEL_16;
        }
        v24[2] = v30;
      }
      uint64_t v11 = sub_100010380();
      uint64_t v12 = v31;
      uint64_t v13 = v32;
      uint64_t v14 = v33;
      a4 = 1;
      if (!v31) {
        goto LABEL_14;
      }
    }
    __break(1u);
LABEL_16:
    __break(1u);
LABEL_17:
    uint64_t result = sub_100041740();
    __break(1u);
  }
  else
  {
LABEL_14:
    swift_bridgeObjectRelease();
    swift_release();
    sub_100010520();
    return swift_release();
  }
  return result;
}

uint64_t sub_100010300@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_1000100A4(v7, *a1, a1[1], a1[2], a1[3]);
  uint64_t v4 = v7[0];
  uint64_t v5 = v7[1];
  *a2 = result;
  a2[1] = v6;
  a2[2] = v4;
  a2[3] = v5;
  return result;
}

uint64_t sub_100010344@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X8>)
{
  uint64_t v4 = -1 << *(unsigned char *)(a1 + 32);
  *a4 = a1;
  uint64_t v7 = *(void *)(a1 + 64);
  uint64_t result = a1 + 64;
  uint64_t v6 = v7;
  a4[1] = result;
  a4[2] = ~v4;
  if (-v4 < 64) {
    uint64_t v8 = ~(-1 << -(char)v4);
  }
  else {
    uint64_t v8 = -1;
  }
  a4[3] = 0;
  a4[4] = v8 & v6;
  a4[5] = a2;
  a4[6] = a3;
  return result;
}

uint64_t sub_100010380()
{
  void (*v13)(uint64_t *__return_ptr, void *);
  uint64_t result;
  int64_t v15;
  int64_t v16;
  uint64_t v17;
  unint64_t v18;
  int64_t v19;
  int64_t v20;
  uint64_t v21;
  void v22[4];

  uint64_t v1 = *v0;
  int64_t v3 = v0[3];
  unint64_t v2 = v0[4];
  int64_t v4 = v3;
  if (v2)
  {
    uint64_t v5 = (v2 - 1) & v2;
    unint64_t v6 = __clz(__rbit64(v2)) | (v3 << 6);
LABEL_3:
    uint64_t v7 = (uint64_t *)(*(void *)(v1 + 48) + 16 * v6);
    uint64_t v8 = *v7;
    uint64_t v9 = v7[1];
    uint64_t v10 = (uint64_t *)(*(void *)(v1 + 56) + 16 * v6);
    uint64_t v11 = *v10;
    uint64_t v12 = v10[1];
    v0[3] = v4;
    v0[4] = v5;
    uint64_t v13 = (void (*)(uint64_t *__return_ptr, void *))v0[5];
    v22[0] = v8;
    v22[1] = v9;
    v22[2] = v11;
    v22[3] = v12;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v13(&v21, v22);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return v21;
  }
  uint64_t v15 = v3 + 1;
  if (__OFADD__(v3, 1))
  {
    __break(1u);
  }
  else
  {
    char v16 = (unint64_t)(v0[2] + 64) >> 6;
    if (v15 < v16)
    {
      unint64_t v17 = v0[1];
      uint64_t v18 = *(void *)(v17 + 8 * v15);
      if (v18)
      {
LABEL_7:
        uint64_t v5 = (v18 - 1) & v18;
        unint64_t v6 = __clz(__rbit64(v18)) + (v15 << 6);
        int64_t v4 = v15;
        goto LABEL_3;
      }
      BOOL v19 = v3 + 2;
      int64_t v4 = v3 + 1;
      if (v3 + 2 < v16)
      {
        uint64_t v18 = *(void *)(v17 + 8 * v19);
        if (v18)
        {
LABEL_10:
          uint64_t v15 = v19;
          goto LABEL_7;
        }
        int64_t v4 = v3 + 2;
        if (v3 + 3 < v16)
        {
          uint64_t v18 = *(void *)(v17 + 8 * (v3 + 3));
          if (v18)
          {
            uint64_t v15 = v3 + 3;
            goto LABEL_7;
          }
          BOOL v19 = v3 + 4;
          int64_t v4 = v3 + 3;
          if (v3 + 4 < v16)
          {
            uint64_t v18 = *(void *)(v17 + 8 * v19);
            if (v18) {
              goto LABEL_10;
            }
            uint64_t v15 = v3 + 5;
            int64_t v4 = v3 + 4;
            if (v3 + 5 < v16)
            {
              uint64_t v18 = *(void *)(v17 + 8 * v15);
              if (v18) {
                goto LABEL_7;
              }
              int64_t v4 = v16 - 1;
              uint64_t v20 = v3 + 6;
              while (v20 < v16)
              {
                uint64_t v18 = *(void *)(v17 + 8 * v20++);
                if (v18)
                {
                  uint64_t v15 = v20 - 1;
                  goto LABEL_7;
                }
              }
            }
          }
        }
      }
    }
    uint64_t result = 0;
    v0[3] = v4;
    v0[4] = 0;
  }
  return result;
}

uint64_t sub_100010520()
{
  return swift_release();
}

uint64_t sub_100010528()
{
  sub_100007B2C(v0 + OBJC_IVAR____TtC22localspeechrecognition14OndeviceRecord_asrId);
  sub_100007B2C(v0 + OBJC_IVAR____TtC22localspeechrecognition14OndeviceRecord_requestId);
  sub_100010928();
  sub_100010928();
  sub_100010928();
  sub_100010928();
  sub_100010928();
  sub_100010928();
  sub_100010928();
  sub_100010928();
  sub_100010928();
  sub_100010928();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_1000105F8()
{
  sub_100010528();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return _swift_deallocClassInstance(v0, v1, v2);
}

uint64_t sub_100010650()
{
  return type metadata accessor for OndeviceRecord();
}

uint64_t type metadata accessor for OndeviceRecord()
{
  uint64_t result = qword_100063698;
  if (!qword_100063698) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_1000106A0()
{
  sub_1000107B0();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void sub_1000107B0()
{
  if (!qword_1000642E0)
  {
    sub_100040F20();
    unint64_t v0 = sub_100041440();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1000642E0);
    }
  }
}

uint64_t sub_100010808()
{
  id v1 = [(id)BiomeLibrary() Siri];
  swift_unknownObjectRelease();
  id v2 = [v1 ASR];
  swift_unknownObjectRelease();
  id v3 = [v2 RequestMetricsRecord];
  swift_unknownObjectRelease();
  id v4 = [v3 source];

  *(void *)(v0 + 16) = v4;
  return v0;
}

uint64_t sub_1000108CC()
{
  return _swift_deallocClassInstance(v0, 24, 7);
}

uint64_t type metadata accessor for OndeviceRecordHelper()
{
  return self;
}

uint64_t sub_100010928()
{
  return swift_bridgeObjectRelease();
}

uint64_t type metadata accessor for ExperimentationTriggerLogger()
{
  return self;
}

id sub_100010964(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v54 = a2;
  uint64_t v52 = a4;
  uint64_t v53 = (char *)a5;
  sub_100040FF0();
  sub_100008220();
  uint64_t v56 = v9;
  uint64_t v57 = v8;
  __chkstk_darwin(v8);
  sub_100008250();
  v48[2] = v11 - v10;
  uint64_t v12 = sub_1000411D0();
  __chkstk_darwin(v12 - 8);
  sub_100008250();
  uint64_t v15 = v14 - v13;
  uint64_t v16 = sub_100007A58(&qword_1000641E0);
  __chkstk_darwin(v16 - 8);
  sub_100008250();
  uint64_t v19 = v18 - v17;
  uint64_t v20 = sub_100040E80();
  sub_100008220();
  uint64_t v51 = v21;
  uint64_t v23 = __chkstk_darwin(v22);
  uint64_t v49 = (char *)v48 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v23);
  id v26 = (char *)v48 - v25;
  uint64_t v27 = v5;
  sub_100008680();
  uint64_t v50 = v20;
  sub_10000A374(v19, 1, 1, v20);
  uint64_t v28 = v55;
  id v29 = a3;
  sub_100019AF0(3, v19, 0, (uint64_t)v26);
  if (v28)
  {

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v56 + 8))(a1, v57);
    sub_1000122D8(v19);
  }
  else
  {
    v48[0] = v15;
    v48[1] = 0;
    uint64_t v54 = a1;
    uint64_t v55 = v27;
    sub_1000122D8(v19);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_10000CD4C(0, &qword_100063C78);
    uint64_t v30 = v49;
    sub_100040E20();
    uint64_t v31 = self;
    sub_100040E00();
    Class isa = sub_100041260().super.isa;
    swift_bridgeObjectRelease();
    id v33 = [v31 pathWithComponents:isa];

    uint64_t v34 = sub_1000411F0();
    uint64_t v36 = v35;

    uint64_t v37 = v50;
    id v38 = *(void (**)(char *, uint64_t))(v51 + 8);
    v38(v30, v50);
    id v39 = sub_100010E14(v34, v36, v52, (uint64_t)v53);
    if (v39)
    {
      id v40 = v39;
      v38(v26, v37);
      id v41 = v55;
      *(void *)&v55[OBJC_IVAR____TtC22localspeechrecognition9EAREuclid_euclidInstance] = v40;

      uint64_t v42 = (objc_class *)type metadata accessor for EAREuclid();
      v58.receiver = v41;
      v58.Class super_class = v42;
      id v29 = objc_msgSendSuper2(&v58, "init");
      (*(void (**)(uint64_t, uint64_t))(v56 + 8))(v54, v57);
      return v29;
    }
    uint64_t v53 = v26;

    sub_100041160();
    uint64_t v44 = v54;
    uint64_t v45 = v56;
    uint64_t v46 = v57;
    if (qword_100062238 != -1) {
      swift_once();
    }
    id v29 = (id)qword_100064878;
    id v47 = (id)qword_100064878;
    sub_100040F90();
    sub_100041200();
    sub_100041110();
    swift_willThrow();
    (*(void (**)(uint64_t, uint64_t))(v45 + 8))(v44, v46);
    v38(v53, v37);
  }
  type metadata accessor for EAREuclid();
  swift_deallocPartialClassInstance();
  return v29;
}

id sub_100010E14(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v6 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  NSString v7 = sub_1000411E0();
  swift_bridgeObjectRelease();
  id v8 = [v6 initWithConfiguration:v7 euclidEncoderType:a3 initFlag:a4];

  return v8;
}

void sub_100010EA4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (**a5)(void, void))
{
  if (qword_1000621C0 != -1) {
    swift_once();
  }
  uint64_t v8 = sub_1000410D0();
  sub_100007B8C(v8, (uint64_t)qword_100064690);
  uint64_t v9 = sub_1000410C0();
  os_log_type_t v10 = sub_100041370();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = swift_slowAlloc();
    uint64_t v24 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v11 = 136315394;
    sub_10002E330(0xD000000000000030, 0x800000010004C4C0, (uint64_t *)&v24);
    sub_100041450();
    *(_WORD *)(v11 + 12) = 2048;
    sub_100041450();
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "EAREuclid.%s with %ld requested neighbor(s)", (uint8_t *)v11, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  uint64_t v12 = *(void **)(a4 + OBJC_IVAR____TtC22localspeechrecognition9EAREuclid_euclidInstance);
  NSString v13 = sub_1000411E0();
  id v14 = [v12 findNearestNeighbors:v13 numberOfNeighbors:a3];

  sub_10000CD4C(0, &qword_100063C88);
  unint64_t v15 = sub_100041270();

  swift_bridgeObjectRetain_n();
  uint64_t v16 = sub_1000410C0();
  os_log_type_t v17 = sub_100041370();
  unint64_t v18 = v15 >> 62;
  if (!os_log_type_enabled(v16, v17))
  {

    swift_bridgeObjectRelease_n();
    goto LABEL_10;
  }
  uint64_t v19 = swift_slowAlloc();
  uint64_t v24 = (void *)swift_slowAlloc();
  *(_DWORD *)uint64_t v19 = 136315394;
  sub_10002E330(0xD000000000000030, 0x800000010004C4C0, (uint64_t *)&v24);
  sub_100041450();
  *(_WORD *)(v19 + 12) = 2048;
  if (v18) {
    goto LABEL_22;
  }
  while (1)
  {
    swift_bridgeObjectRelease();
    sub_100041450();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v16, v17, "EAREuclid.%s replying with %ld neighbor(s)", (uint8_t *)v19, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

LABEL_10:
    if (v18)
    {
      swift_bridgeObjectRetain();
      uint64_t v19 = sub_1000416B0();
      swift_bridgeObjectRelease();
      if (!v19) {
        goto LABEL_20;
      }
    }
    else
    {
      uint64_t v19 = *(void *)((v15 & 0xFFFFFFFFFFFFFF8) + 0x10);
      if (!v19) {
        goto LABEL_20;
      }
    }
    uint64_t v24 = &_swiftEmptyArrayStorage;
    uint64_t v16 = &v24;
    sub_1000415E0();
    if ((v19 & 0x8000000000000000) == 0) {
      break;
    }
    __break(1u);
LABEL_22:
    swift_bridgeObjectRetain();
    sub_1000416B0();
    swift_bridgeObjectRelease();
  }
  uint64_t v20 = 0;
  do
  {
    if ((v15 & 0xC000000000000001) != 0) {
      id v21 = (id)sub_100041590();
    }
    else {
      id v21 = *(id *)(v15 + 8 * v20 + 32);
    }
    uint64_t v22 = v21;
    ++v20;
    [objc_allocWithZone((Class)EAREuclidNeighbor) initWithEuclidNeighbor:v21];

    sub_1000415C0();
    sub_1000415F0();
    sub_100041600();
    sub_1000415D0();
  }
  while (v19 != v20);
LABEL_20:
  swift_bridgeObjectRelease();
  sub_10000CD4C(0, (unint64_t *)&unk_100063C90);
  Class isa = sub_100041260().super.isa;
  ((void (**)(void, Class))a5)[2](a5, isa);
  swift_bridgeObjectRelease();

  _Block_release(a5);
}

void sub_100011460(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void (**a6)(void, void))
{
  if (qword_1000621C0 != -1) {
    swift_once();
  }
  uint64_t v7 = sub_1000410D0();
  sub_100007B8C(v7, (uint64_t)qword_100064690);
  uint64_t v8 = sub_1000410C0();
  os_log_type_t v9 = sub_100041370();
  if (os_log_type_enabled(v8, v9))
  {
    os_log_type_t v10 = (uint8_t *)swift_slowAlloc();
    uint64_t v22 = swift_slowAlloc();
    *(_DWORD *)os_log_type_t v10 = 136315138;
    sub_10002E330(0xD000000000000026, 0x800000010004C490, &v22);
    sub_100041450();
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "EAREuclid.%s", v10, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  uint64_t v11 = *(void **)(a5 + OBJC_IVAR____TtC22localspeechrecognition9EAREuclid_euclidInstance);
  NSString v12 = sub_1000411E0();
  NSString v13 = sub_1000411E0();
  id v14 = [v11 distanceBetweenSource:v12 target:v13];

  id v15 = v14;
  uint64_t v16 = sub_1000410C0();
  os_log_type_t v17 = sub_100041370();
  if (os_log_type_enabled(v16, v17))
  {
    uint64_t v18 = swift_slowAlloc();
    uint64_t v19 = (void *)swift_slowAlloc();
    uint64_t v22 = swift_slowAlloc();
    *(_DWORD *)uint64_t v18 = 136315394;
    sub_10002E330(0xD000000000000026, 0x800000010004C490, &v22);
    sub_100041450();
    *(_WORD *)(v18 + 12) = 2112;
    id v20 = v15;
    sub_100041450();
    *uint64_t v19 = v15;

    _os_log_impl((void *)&_mh_execute_header, v16, v17, "EAREuclid.%s replying with distance of %@", (uint8_t *)v18, 0x16u);
    sub_100007A58(&qword_100063550);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  ((void (**)(void, id))a6)[2](a6, v15);

  _Block_release(a6);
}

void sub_1000118EC(uint64_t a1, uint64_t a2, void (**a3)(void, void))
{
  id v4 = *(void **)(a2 + OBJC_IVAR____TtC22localspeechrecognition9EAREuclid_euclidInstance);
  Class isa = sub_100041260().super.isa;
  id v6 = [v4 computeEmbeddings:isa];

  sub_100007A58(&qword_100063C80);
  sub_100041270();

  Class v7 = sub_100041260().super.isa;
  ((void (**)(void, Class))a3)[2](a3, v7);
  swift_bridgeObjectRelease();

  _Block_release(a3);
}

void sub_100011A80(uint64_t a1, void (**a2)(void, void), uint64_t a3, unint64_t a4, SEL *a5)
{
  if (qword_1000621C0 != -1) {
    swift_once();
  }
  uint64_t v7 = sub_1000410D0();
  sub_100007B8C(v7, (uint64_t)qword_100064690);
  uint64_t v8 = sub_1000410C0();
  os_log_type_t v9 = sub_100041370();
  if (os_log_type_enabled(v8, v9))
  {
    os_log_type_t v10 = (_DWORD *)swift_slowAlloc();
    uint64_t v24 = swift_slowAlloc();
    *os_log_type_t v10 = 136315138;
    sub_10002E330(a3, a4, &v24);
    sub_100041450();
    sub_100012338((void *)&_mh_execute_header, v11, v12, "EAREuclid.%s");
    swift_arrayDestroy();
    sub_10000A754();
    sub_10000A754();
  }

  id v13 = objc_retain(objc_retain(objc_retain(objc_retainAutoreleasedReturnValue(objc_msgSend(*(id *)(a1
                                                                                                  + OBJC_IVAR____TtC22localspeechrecognition9EAREuclid_euclidInstance), *a5)))));
  id v14 = sub_1000410C0();
  os_log_type_t v15 = sub_100041370();
  if (os_log_type_enabled(v14, v15))
  {
    uint64_t v16 = swift_slowAlloc();
    os_log_type_t v17 = (void *)swift_slowAlloc();
    uint64_t v24 = swift_slowAlloc();
    *(_DWORD *)uint64_t v16 = 136315394;
    sub_10002E330(a3, a4, &v24);
    sub_100041450();
    *(_WORD *)(v16 + 12) = 2112;
    id v18 = v13;
    sub_100041450();
    *os_log_type_t v17 = v13;

    sub_100012358((void *)&_mh_execute_header, v19, v20, "EAREuclid.%s replying with %@");
    sub_100007A58(&qword_100063550);
    swift_arrayDestroy();
    sub_10000A754();
    swift_arrayDestroy();
    sub_10000A754();
    sub_10000A754();
  }
  else
  {
  }
  ((void (**)(void, id))a2)[2](a2, v13);

  _Block_release(a2);
}

void sub_100011DB0(void *a1, int a2, void *aBlock, uint64_t a4, uint64_t a5, uint64_t a6, void (*a7)(void))
{
  os_log_type_t v9 = _Block_copy(aBlock);
  _Block_copy(v9);
  id v10 = a1;
  a7();
  _Block_release(v9);
}

void sub_100011EEC(uint64_t a1, void (**a2)(void, void), uint64_t a3, unint64_t a4, SEL *a5)
{
  if (qword_1000621C0 != -1) {
    swift_once();
  }
  uint64_t v8 = sub_1000410D0();
  sub_100007B8C(v8, (uint64_t)qword_100064690);
  os_log_type_t v9 = sub_1000410C0();
  os_log_type_t v10 = sub_100041370();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = (_DWORD *)swift_slowAlloc();
    v26[0] = swift_slowAlloc();
    *uint64_t v11 = 136315138;
    uint64_t v27 = sub_10002E330(a3, a4, v26);
    sub_100041450();
    sub_100012338((void *)&_mh_execute_header, v12, v13, "EAREuclid.%s");
    swift_arrayDestroy();
    sub_10000A754();
    sub_10000A754();
  }

  id v14 = objc_retainAutoreleasedReturnValue(objc_msgSend(*(id *)(a1
                                                              + OBJC_IVAR____TtC22localspeechrecognition9EAREuclid_euclidInstance), *a5));
  uint64_t v15 = sub_1000411F0();
  unint64_t v17 = v16;

  uint64_t v27 = v15;
  unint64_t v28 = v17;
  swift_bridgeObjectRetain_n();
  id v18 = sub_1000410C0();
  os_log_type_t v19 = sub_100041370();
  if (os_log_type_enabled(v18, v19))
  {
    uint64_t v20 = swift_slowAlloc();
    v26[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v20 = 136315394;
    sub_10002E330(a3, a4, v26);
    sub_100041450();
    *(_WORD *)(v20 + 12) = 2080;
    swift_bridgeObjectRetain();
    sub_10002E330(v15, v17, v26);
    sub_100041450();
    swift_bridgeObjectRelease_n();
    sub_100012358((void *)&_mh_execute_header, v21, v22, "EAREuclid.%s replying with %s");
    swift_arrayDestroy();
    sub_10000A754();
    sub_10000A754();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  swift_beginAccess();
  NSString v23 = sub_1000411E0();
  ((void (**)(void, NSString))a2)[2](a2, v23);
  swift_bridgeObjectRelease();

  _Block_release(a2);
}

void sub_100012230()
{
}

id sub_100012270()
{
  v2.receiver = v0;
  v2.Class super_class = (Class)type metadata accessor for EAREuclid();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for EAREuclid()
{
  return self;
}

uint64_t sub_1000122D8(uint64_t a1)
{
  uint64_t v2 = sub_100007A58(&qword_1000641E0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_100012338(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v5, v6, a4, v4, 0xCu);
}

void sub_100012358(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v6, a4, v5, 0x16u);
}

uint64_t sub_100012378(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100041310();
  if (sub_100007B04(a1, 1, v6) == 1)
  {
    sub_100008834(a1, &qword_100063DF8);
  }
  else
  {
    sub_100041300();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(a1, v6);
  }
  if (*(void *)(a3 + 16))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_1000412D0();
    swift_unknownObjectRelease();
  }
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = a2;
  *(void *)(v7 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_1000124E8(void *a1, void *a2, void *a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v34 = a6;
  sub_100007A58(&qword_100063DF8);
  ((void (*)(void))__chkstk_darwin)();
  sub_10001513C();
  uint64_t v14 = ((uint64_t (*)(void))__chkstk_darwin)();
  unint64_t v16 = (char *)&v33 - v15;
  __chkstk_darwin(v14);
  id v18 = (char *)&v33 - v17;
  uint64_t v35 = a7;
  if (!a4)
  {
    uint64_t v22 = sub_100041310();
    sub_10000A374((uint64_t)v16, 1, 1, v22);
    id v19 = 0;
    goto LABEL_6;
  }
  id v19 = a4;
  unint64_t v20 = (unint64_t)[v19 priority];
  if ((v20 & 0x8000000000000000) == 0 && v20 < 0x100)
  {
    sub_1000412F0();

    uint64_t v21 = sub_100041310();
    sub_10000A374((uint64_t)v16, 0, 1, v21);
LABEL_6:
    sub_100014B90((uint64_t)v16, (uint64_t)v18);
    sub_10001505C((uint64_t)v18, v7, &qword_100063DF8);
    NSString v23 = (void *)swift_allocObject();
    v23[2] = 0;
    v23[3] = 0;
    v23[4] = a1;
    v23[5] = a2;
    v23[6] = a3;
    v23[7] = a4;
    v23[8] = a5;
    uint64_t v25 = v35;
    uint64_t v24 = v36;
    uint64_t v26 = v34;
    v23[9] = v36;
    v23[10] = v26;
    v23[11] = v25;
    id v27 = v19;
    id v28 = a1;
    id v29 = a2;
    id v30 = a3;
    swift_bridgeObjectRetain();
    id v31 = v24;
    swift_retain();
    sub_100012378(v7, (uint64_t)&unk_100063E38, (uint64_t)v23);
    swift_release();
    return sub_100008834((uint64_t)v18, &qword_100063DF8);
  }
  sub_1000150E8();
  uint64_t result = sub_100041690();
  __break(1u);
  return result;
}

uint64_t sub_100012764(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5, void *a6, void *a7)
{
  *(void *)(v7 + 56) = v20;
  *(_OWORD *)(v7 + 40) = v19;
  objc_allocWithZone((Class)type metadata accessor for EARSpeechRecognizer());
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  swift_bridgeObjectRetain();
  unint64_t v16 = (void *)swift_task_alloc();
  *(void *)(v7 + 64) = v16;
  *unint64_t v16 = v7;
  v16[1] = sub_100012880;
  return sub_10001ABD8();
}

uint64_t sub_100012880(uint64_t a1)
{
  sub_1000150D0();
  uint64_t v5 = v4;
  uint64_t v6 = *v2;
  sub_1000150FC();
  *uint64_t v7 = v6;
  *(void *)(v5 + 72) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v8 = sub_10001297C;
  }
  else
  {
    *(void *)(v5 + 80) = a1;
    uint64_t v8 = sub_1000150C8;
  }
  return _swift_task_switch(v8, 0, 0);
}

void sub_10001297C()
{
  if (qword_1000621C0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_1000410D0();
  sub_100007B8C(v2, (uint64_t)qword_100064690);
  swift_errorRetain();
  swift_errorRetain();
  id v3 = sub_1000410C0();
  os_log_type_t v4 = sub_100041380();
  if (os_log_type_enabled(v3, v4))
  {
    sub_1000151A4();
    uint64_t v5 = (void *)sub_100015214();
    sub_1000151F4(5.7779e-34);
    uint64_t v6 = _swift_stdlib_bridgeErrorToNSError();
    sub_100015158(v6);
    *uint64_t v5 = v0;
    swift_errorRelease();
    swift_errorRelease();
    sub_10001525C((void *)&_mh_execute_header, v7, v8, "Could not create EARSpeechRecognizer local actor: %@");
    sub_100007A58(&qword_100063550);
    swift_arrayDestroy();
    sub_10000A754();
    sub_10000A754();
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
  }

  v1[2] = v1[9];
  swift_errorRetain();
  sub_100007A58((uint64_t *)&unk_100063E20);
  type metadata accessor for LSRError(0);
  if (sub_100015180()) {
    os_log_type_t v9 = (void *)v1[3];
  }
  else {
    os_log_type_t v9 = 0;
  }
  if (!sub_100019DD0(v9)) {
    swift_errorRetain();
  }
  uint64_t v10 = sub_100015234();
  v11(v10);
  swift_errorRelease();
  swift_errorRelease();
  sub_100015130();
  sub_1000151C8();
  __asm { BRAA            X1, X16 }
}

void sub_100012C88(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6, int a7, uint64_t a8, void (**a9)(void, id, void))
{
  v28[1] = a8;
  id v29 = a9;
  uint64_t v16 = sub_100007A58(&qword_1000641E0);
  __chkstk_darwin(v16 - 8);
  uint64_t v18 = (char *)v28 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_100040FF0();
  __chkstk_darwin(v19);
  uint64_t v21 = (char *)v28 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v22 + 16))(v21, a1);
  sub_10001505C(a6, (uint64_t)v18, &qword_1000641E0);
  id v23 = objc_allocWithZone((Class)type metadata accessor for LSRAssets());
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v24 = (id)sub_10001527C((uint64_t)v21, a2, a3, a4, a5, (uint64_t)v18, a7);
  id v25 = sub_100013F28();

  id v26 = [v25 endpoint];
  id v27 = v29;
  v29[2](v29, v26, 0);

  _Block_release(v27);
}

void sub_1000132B0(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, void (**a7)(void, void, void))
{
  uint64_t v13 = sub_100040FF0();
  __chkstk_darwin(v13);
  id v15 = (char *)&v20 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v16 + 16))(v15, a1);
  objc_allocWithZone((Class)type metadata accessor for EAREuclid());
  swift_bridgeObjectRetain();
  id v17 = sub_100010964((uint64_t)v15, a2, a3, a4, a5);
  id v18 = sub_100013F28();

  id v19 = [v18 endpoint];
  ((void (**)(void, id, void))a7)[2](a7, v19, 0);

  _Block_release(a7);
}

uint64_t sub_10001379C(void *a1, void *a2, void *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v12 = sub_100007A58(&qword_100063DF8);
  __chkstk_darwin(v12 - 8);
  sub_10001513C();
  uint64_t v14 = __chkstk_darwin(v13);
  uint64_t v16 = (char *)&v28 - v15;
  __chkstk_darwin(v14);
  id v18 = (char *)&v28 - v17;
  if (!a3)
  {
    uint64_t v21 = sub_100041310();
    uint64_t v22 = 1;
    goto LABEL_6;
  }
  id v19 = a3;
  unint64_t v20 = (unint64_t)[v19 priority];
  if ((v20 & 0x8000000000000000) == 0 && v20 < 0x100)
  {
    sub_1000412F0();

    uint64_t v21 = sub_100041310();
    uint64_t v22 = 0;
LABEL_6:
    sub_10000A374((uint64_t)v16, v22, 1, v21);
    sub_100014B90((uint64_t)v16, (uint64_t)v18);
    sub_10001505C((uint64_t)v18, v6, &qword_100063DF8);
    id v23 = (void *)swift_allocObject();
    v23[2] = 0;
    v23[3] = 0;
    v23[4] = a1;
    v23[5] = a2;
    v23[6] = v5;
    v23[7] = a4;
    v23[8] = a5;
    id v24 = a1;
    id v25 = a2;
    id v26 = v5;
    swift_retain();
    sub_100012378(v6, (uint64_t)&unk_100063E08, (uint64_t)v23);
    swift_release();
    return sub_100008834((uint64_t)v18, &qword_100063DF8);
  }
  sub_1000150E8();
  uint64_t result = sub_100041690();
  __break(1u);
  return result;
}

uint64_t sub_1000139CC(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[6] = a7;
  v8[7] = a8;
  v8[5] = a6;
  objc_allocWithZone((Class)type metadata accessor for EARLanguageDetector());
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = (void *)swift_task_alloc();
  v8[8] = v13;
  *uint64_t v13 = v8;
  v13[1] = sub_100013AA0;
  return sub_10000A808((uint64_t)v11, (uint64_t)v12);
}

uint64_t sub_100013AA0(uint64_t a1)
{
  sub_1000150D0();
  uint64_t v5 = v4;
  uint64_t v6 = *v2;
  sub_1000150FC();
  *uint64_t v7 = v6;
  *(void *)(v5 + 72) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v8 = sub_100013C58;
  }
  else
  {
    *(void *)(v5 + 80) = a1;
    uint64_t v8 = sub_100013B9C;
  }
  return _swift_task_switch(v8, 0, 0);
}

uint64_t sub_100013B9C()
{
  uint64_t v1 = *(void (**)(void))(v0 + 48);
  id v2 = *(id *)(v0 + 80);
  id v3 = sub_100013F28();

  id v4 = [v3 endpoint];
  v1();

  sub_100015130();
  return v5();
}

void sub_100013C58()
{
  if (qword_1000621C0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_1000410D0();
  sub_100007B8C(v2, (uint64_t)qword_100064690);
  swift_errorRetain();
  swift_errorRetain();
  id v3 = sub_1000410C0();
  os_log_type_t v4 = sub_100041380();
  if (os_log_type_enabled(v3, v4))
  {
    sub_1000151A4();
    uint64_t v5 = (void *)sub_100015214();
    sub_1000151F4(5.7779e-34);
    uint64_t v6 = _swift_stdlib_bridgeErrorToNSError();
    sub_100015158(v6);
    *uint64_t v5 = v0;
    swift_errorRelease();
    swift_errorRelease();
    sub_10001525C((void *)&_mh_execute_header, v7, v8, "Could not create EARLanguageDetector local actor: %@");
    sub_100007A58(&qword_100063550);
    swift_arrayDestroy();
    sub_10000A754();
    sub_10000A754();
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
  }

  v1[2] = v1[9];
  swift_errorRetain();
  sub_100007A58((uint64_t *)&unk_100063E20);
  type metadata accessor for LSRError(0);
  if (sub_100015180()) {
    os_log_type_t v9 = (void *)v1[3];
  }
  else {
    os_log_type_t v9 = 0;
  }
  if (!sub_100019DD0(v9)) {
    swift_errorRetain();
  }
  uint64_t v10 = sub_100015234();
  v11(v10);
  swift_errorRelease();
  swift_errorRelease();
  sub_100015130();
  sub_1000151C8();
  __asm { BRAA            X1, X16 }
}

id sub_100013F28()
{
  id v1 = [self anonymousListener];
  [v1 setDelegate:v0];
  [v1 activate];
  uint64_t v2 = OBJC_IVAR____TtC22localspeechrecognition12EARInterface_listenerLock;
  id v3 = *(os_unfair_lock_s **)(v0 + OBJC_IVAR____TtC22localspeechrecognition12EARInterface_listenerLock);
  swift_retain();
  os_unfair_lock_lock(v3 + 4);
  swift_release();
  swift_beginAccess();
  id v4 = v1;
  uint64_t v5 = swift_unknownObjectRetain();
  sub_1000260CC(v5, v4);
  swift_endAccess();

  uint64_t v6 = *(os_unfair_lock_s **)(v0 + v2);
  swift_retain();
  os_unfair_lock_unlock(v6 + 4);
  swift_release();
  return v4;
}

uint64_t sub_10001403C(uint64_t a1, void *a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = OBJC_IVAR____TtC22localspeechrecognition12EARInterface_listenerLock;
  uint64_t v7 = *(os_unfair_lock_s **)(v2 + OBJC_IVAR____TtC22localspeechrecognition12EARInterface_listenerLock);
  swift_retain();
  os_unfair_lock_lock(v7 + 4);
  swift_release();
  swift_beginAccess();
  sub_100025B5C(a1, v8, v9, v10, v11, v12, v13, v14, v22, v23);
  uint64_t v16 = v15;
  swift_endAccess();
  uint64_t v17 = *(os_unfair_lock_s **)(v3 + v6);
  swift_retain();
  os_unfair_lock_unlock(v17 + 4);
  swift_release();
  if (!v16) {
    return v16 != 0;
  }
  type metadata accessor for EARSpeechRecognizer();
  swift_unknownObjectRetain_n();
  if (swift_dynamicCastClass())
  {
    id v18 = &protocolRef__SFXPCEARSpeechRecognizer;
LABEL_8:
    swift_unknownObjectRelease();
LABEL_9:
    id v19 = [self interfaceWithProtocol:*v18];
    [a2 setExportedInterface:v19];
    [a2 setExportedObject:v16];
    [a2 activate];
    swift_unknownObjectRelease_n();

    return v16 != 0;
  }
  type metadata accessor for LSRAssets();
  if (swift_dynamicCastClass())
  {
    id v18 = &protocolRef__SFXPCLSRAssets;
    goto LABEL_8;
  }
  type metadata accessor for EAREuclid();
  if (swift_dynamicCastClass())
  {
    id v18 = &protocolRef__SFXPCEAREuclid;
    goto LABEL_8;
  }
  type metadata accessor for EARLanguageDetector();
  uint64_t v21 = swift_dynamicCastClass();
  swift_unknownObjectRelease();
  if (v21)
  {
    id v18 = &protocolRef__SFXPCEARLanguageDetector;
    goto LABEL_9;
  }
  sub_100041560(23);
  v24._object = (void *)0x800000010004C600;
  v24._countAndFlagsBits = 0xD000000000000015;
  sub_100041230(v24);
  sub_100041610();
  uint64_t result = sub_1000416A0();
  __break(1u);
  return result;
}

void sub_10001431C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void (**a7)(void, void, void))
{
  uint64_t v8 = sub_100040FF0();
  __chkstk_darwin(v8 - 8);
  uint64_t v9 = sub_1000411D0();
  __chkstk_darwin(v9 - 8);
  uint64_t v10 = self;
  NSString v11 = sub_1000411E0();
  NSString v12 = sub_1000411E0();
  id v29 = 0;
  id v13 = [v10 modelRootWithLanguage:v11 assetType:3 clientID:v12 modelOverrideURL:0 error:&v29];

  if (v13)
  {
    id v14 = v29;
    NSString v15 = sub_1000411E0();
    id v16 = [v10 _jitProfileWithLanguage:v15 modelRoot:v13];

    if (v16)
    {
      id v17 = v16;
      Class isa = sub_100041260().super.isa;
      id v19 = [v17 jitProfileFromContextualStrings:isa];

      uint64_t v20 = sub_100040EA0();
      unint64_t v22 = v21;

      v23.super.Class isa = sub_100040E90().super.isa;
    }
    else
    {
      sub_100041160();
      if (qword_100062238 != -1) {
        swift_once();
      }
      id v24 = (id)qword_100064878;
      sub_100040F90();
      sub_100041200();
      sub_1000413A0();
      id v25 = (void *)sub_100041110();
      id v26 = (void *)sub_100040DD0();
      ((void (**)(void, void, void *))a7)[2](a7, 0, v26);

      v23.super.Class isa = 0;
      uint64_t v20 = 0;
      unint64_t v22 = 0xF000000000000000;
    }
    ((void (**)(void, Class, void))a7)[2](a7, v23.super.isa, 0);

    sub_10000CB00(v20, v22);
    _Block_release(a7);
  }
  else
  {
    id v27 = v29;
    _Block_release(a7);
    id v28 = v27;
    sub_100040DE0();

    swift_willThrow();
    swift_unexpectedError();
    __break(1u);
  }
}

void sub_10001478C(uint64_t a1, void (**a2)(void, void, void))
{
  id v3 = [self processStartTimeOnce];
  ((void (**)(void, id, void))a2)[2](a2, v3, 0);

  _Block_release(a2);
}

id sub_100014864()
{
  uint64_t v1 = OBJC_IVAR____TtC22localspeechrecognition12EARInterface_listeners;
  sub_100014FDC();
  sub_10000CA2C();
  uint64_t v2 = v0;
  *(void *)&v0[v1] = sub_100041140();
  uint64_t v3 = OBJC_IVAR____TtC22localspeechrecognition12EARInterface_listenerLock;
  sub_100007A58(&qword_100063E50);
  uint64_t v4 = swift_allocObject();
  *(_DWORD *)(v4 + 16) = 0;
  *(void *)&v2[v3] = v4;

  v6.receiver = v2;
  v6.Class super_class = (Class)type metadata accessor for EARInterface();
  return objc_msgSendSuper2(&v6, "init");
}

id sub_100014948()
{
  v2.receiver = v0;
  v2.Class super_class = (Class)type metadata accessor for EARInterface();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for EARInterface()
{
  return self;
}

uint64_t sub_1000149EC(uint64_t a1, int *a2)
{
  objc_super v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_100014AC8;
  return v6(a1);
}

uint64_t sub_100014AC8()
{
  sub_1000150D0();
  uint64_t v1 = *v0;
  sub_1000150FC();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  sub_100015130();
  return v3();
}

uint64_t sub_100014B90(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100007A58(&qword_100063DF8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100014BF8()
{
  swift_unknownObjectRelease();

  swift_release();

  return _swift_deallocObject(v0, 72, 7);
}

uint64_t sub_100014C50()
{
  sub_100015248();
  uint64_t v1 = *(void *)(v0 + 64);
  uint64_t v2 = swift_task_alloc();
  uint64_t v3 = (void *)sub_1000151E4(v2);
  *uint64_t v3 = v4;
  v3[1] = sub_100014CFC;
  uint64_t v5 = sub_10001510C();
  return sub_1000139CC(v5, v6, v7, v8, v9, v10, v11, v1);
}

uint64_t sub_100014CFC()
{
  sub_1000150D0();
  uint64_t v1 = *v0;
  sub_1000150FC();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  sub_100015130();
  return v3();
}

uint64_t sub_100014DC0()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100014DF8(uint64_t a1)
{
  uint64_t v3 = *(int **)(v1 + 16);
  uint64_t v4 = swift_task_alloc();
  uint64_t v5 = (void *)sub_1000151E4(v4);
  *uint64_t v5 = v6;
  v5[1] = sub_100014CFC;
  uint64_t v7 = (uint64_t (*)(uint64_t, int *))((char *)&dword_100063E10 + dword_100063E10);
  return v7(a1, v3);
}

uint64_t sub_100014EA8()
{
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 96, 7);
}

uint64_t sub_100014F18()
{
  sub_100015248();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)sub_1000151E4(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_1000150CC;
  sub_10001510C();
  sub_1000151C8();
  return sub_100012764(v3, v4, v5, v6, v7, v8, v9);
}

unint64_t sub_100014FDC()
{
  unint64_t result = qword_100063E40;
  if (!qword_100063E40)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100063E40);
  }
  return result;
}

uint64_t sub_10001501C()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 24, 7);
}

void sub_100015054(uint64_t a1, uint64_t a2)
{
}

uint64_t sub_10001505C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100007A58(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_10001510C()
{
  return v0;
}

uint64_t sub_100015130()
{
  return v0 + 8;
}

uint64_t sub_100015158(uint64_t a1)
{
  *(void *)(v1 + 32) = a1;
  return sub_100041450();
}

uint64_t sub_100015180()
{
  return swift_dynamicCast();
}

uint64_t sub_1000151A4()
{
  return swift_slowAlloc();
}

uint64_t sub_1000151E4(uint64_t result)
{
  *(void *)(v1 + 16) = result;
  return result;
}

uint64_t sub_1000151F4(float a1)
{
  *uint64_t v1 = a1;
  return swift_errorRetain();
}

uint64_t sub_100015214()
{
  return swift_slowAlloc();
}

uint64_t sub_100015234()
{
  return 0;
}

void sub_10001525C(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v6, a4, v5, 0xCu);
}

uint64_t sub_10001527C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6, int a7)
{
  uint64_t v8 = v7;
  LODWORD(v110) = a7;
  id v114 = a5;
  uint64_t v107 = sub_100040E80();
  sub_100008220();
  unint64_t v109 = v14;
  uint64_t v16 = __chkstk_darwin(v15);
  v115 = (char *)v98 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v16);
  id v19 = (char *)v98 - v18;
  uint64_t v106 = OBJC_IVAR____TtC22localspeechrecognition9LSRAssets____lazy_storage___contextualData;
  *(void *)&v8[OBJC_IVAR____TtC22localspeechrecognition9LSRAssets____lazy_storage___contextualData] = 1;
  uint64_t v105 = OBJC_IVAR____TtC22localspeechrecognition9LSRAssets____lazy_storage___geoLMHelper;
  *(void *)&v8[OBJC_IVAR____TtC22localspeechrecognition9LSRAssets____lazy_storage___geoLMHelper] = 1;
  v112 = v8;
  uint64_t v111 = a1;
  uint64_t v20 = sub_100008680();
  uint64_t v22 = v21;
  uint64_t v103 = a2;
  uint64_t v108 = a3;
  NSString v23 = sub_1000411E0();
  uint64_t v24 = SFEntitledAssetTypeForTaskName();

  sub_10000CD4C(0, &qword_100063EA8);
  swift_bridgeObjectRetain();
  id v116 = sub_100015F18(v20, v22, v24);
  uint64_t v25 = v113;
  sub_100019AF0(v24, a6, (int)v110, (uint64_t)v19);
  if (v25)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    sub_100019154(a6, &qword_1000641E0);
    sub_100040FF0();
    sub_1000192D0();
    sub_100019374();
    v26();
    sub_100018708(*(id *)&v8[v106]);
    sub_100018708(*(id *)&v8[v105]);
    id v27 = v112;

    type metadata accessor for LSRAssets();
    swift_deallocPartialClassInstance();
    return (uint64_t)v27;
  }
  uint64_t v101 = v20;
  uint64_t v102 = v22;
  uint64_t v113 = a4;
  uint64_t v106 = 0;
  uint64_t v105 = a6;
  id v28 = v115;
  v104 = v19;
  sub_100040E20();
  sub_10000CD4C(0, (unint64_t *)&unk_100063270);
  id v29 = self;
  sub_100040E00();
  Class isa = sub_100041260().super.isa;
  swift_bridgeObjectRelease();
  id v31 = [v29 pathWithComponents:isa];

  sub_1000411F0();
  id v110 = sub_10001A390();
  v98[0] = [self sharedInstance];
  id v32 = v116;
  id v33 = [v98[0] modelQualityTypeStatusStringWithConfig:v116];
  if (v33)
  {
    uint64_t v34 = v33;
    uint64_t v100 = sub_1000411F0();
    unint64_t v99 = v35;
  }
  else
  {
    uint64_t v100 = 0;
    unint64_t v99 = 0xE000000000000000;
  }
  uint64_t v36 = v111;
  uint64_t v37 = v107;
  unint64_t v38 = v109;
  uint64_t v39 = v113;
  int64_t v40 = (int64_t)v112;
  id v41 = &v112[OBJC_IVAR____TtC22localspeechrecognition9LSRAssets_locale];
  sub_100040FF0();
  sub_100008220();
  v98[1] = v42;
  uint64_t v44 = *(void (**)(char *, uint64_t))(v43 + 16);
  v98[2] = v45;
  v44(v41, v36);
  uint64_t v46 = (uint64_t *)(v40 + OBJC_IVAR____TtC22localspeechrecognition9LSRAssets_language);
  uint64_t v47 = v102;
  uint64_t *v46 = v101;
  v46[1] = v47;
  uint64_t v48 = (uint64_t *)(v40 + OBJC_IVAR____TtC22localspeechrecognition9LSRAssets_clientID);
  uint64_t v49 = (uint64_t)v114;
  *uint64_t v48 = v39;
  v48[1] = v49;
  sub_1000191AC(v105, v40 + OBJC_IVAR____TtC22localspeechrecognition9LSRAssets_modelOverridePath, &qword_1000641E0);
  uint64_t v50 = *(void (**)(int64_t, char *, uint64_t))(v38 + 16);
  v50(v40 + OBJC_IVAR____TtC22localspeechrecognition9LSRAssets_configurationFile, v28, v37);
  *(void *)(v40 + OBJC_IVAR____TtC22localspeechrecognition9LSRAssets_assetType) = v24;
  uint64_t v51 = (uint64_t)v104;
  v50(v40 + OBJC_IVAR____TtC22localspeechrecognition9LSRAssets_modelRoot, v104, v37);
  id v52 = v110;
  id v53 = [v110 version];
  uint64_t v54 = sub_1000411F0();
  uint64_t v56 = v55;

  uint64_t v57 = (uint64_t *)(v40 + OBJC_IVAR____TtC22localspeechrecognition9LSRAssets_modelVersion);
  uint64_t *v57 = v54;
  v57[1] = v56;
  objc_super v58 = (uint64_t *)(v40 + OBJC_IVAR____TtC22localspeechrecognition9LSRAssets_modelQualityType);
  unint64_t v59 = v99;
  *objc_super v58 = v100;
  v58[1] = v59;
  id v60 = [v52 tasks];
  uint64_t v61 = sub_100041330();

  uint64_t v62 = *(void *)(v61 + 16);
  if (v62)
  {
    v122 = (char *)_swiftEmptyArrayStorage;
    sub_100025574(0, v62, 0);
    sub_100029D4C(v61);
    sub_100019318();
    uint64_t v113 = v61;
    while ((v40 & 0x8000000000000000) == 0)
    {
      sub_100019398();
      if (v63 == v64) {
        break;
      }
      sub_1000192FC();
      if ((v65 & 1) == 0) {
        goto LABEL_44;
      }
      if (*(_DWORD *)(v61 + 36) != v51) {
        goto LABEL_45;
      }
      sub_1000193C0();
      sub_100019334();
      swift_dynamicCast();
      sub_100019264((uint64_t)v118);
      unint64_t v38 = (unint64_t)v120;
      uint64_t v66 = v121;
      uint64_t v67 = v122;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_100025574(0, *((void *)v67 + 2) + 1, 1);
        uint64_t v67 = v122;
      }
      unint64_t v69 = *((void *)v67 + 2);
      unint64_t v68 = *((void *)v67 + 3);
      if (v69 >= v68 >> 1)
      {
        sub_100025574(v68 > 1, v69 + 1, 1);
        uint64_t v67 = v122;
      }
      *((void *)v67 + 2) = v69 + 1;
      uint64_t v70 = &v67[16 * v69];
      *((void *)v70 + 4) = v38;
      *((void *)v70 + 5) = v66;
      uint64_t v61 = v113;
      sub_100029BEC(v40, v51, v52 & 1, v113);
      sub_10001935C();
      id v28 = *(char **)(v71 - 256);
      id v32 = v116;
      if (v72)
      {
        sub_1000192B8(v40, v51, (char)v52);
        swift_bridgeObjectRelease();
        sub_1000192E0();
        goto LABEL_21;
      }
    }
    __break(1u);
LABEL_44:
    __break(1u);
LABEL_45:
    __break(1u);
    goto LABEL_46;
  }
  swift_bridgeObjectRelease();
  uint64_t v67 = (char *)_swiftEmptyArrayStorage;
  id v52 = (id)v51;
LABEL_21:
  v119 = v67;
  swift_bridgeObjectRetain();
  uint64_t v73 = v106;
  sub_100018780((uint64_t *)&v119);
  uint64_t v106 = v73;
  if (!v73)
  {
    swift_bridgeObjectRelease();
    uint64_t v113 = OBJC_IVAR____TtC22localspeechrecognition9LSRAssets_modelTaskNames;
    *(void *)(v40 + OBJC_IVAR____TtC22localspeechrecognition9LSRAssets_modelTaskNames) = v119;
    id v74 = [v110 samplingRates];
    uint64_t v75 = sub_100041330();

    uint64_t v62 = *(void *)(v75 + 16);
    if (!v62)
    {
      swift_bridgeObjectRelease();
      uint64_t v78 = _swiftEmptyArrayStorage;
LABEL_37:
      *(void *)(v40 + OBJC_IVAR____TtC22localspeechrecognition9LSRAssets_modelSamplingRates) = v78;
      uint64_t v62 = v108;
      if (qword_1000621B8 == -1) {
        goto LABEL_38;
      }
      goto LABEL_49;
    }
    v120 = _swiftEmptyArrayStorage;
    sub_100025594(0, v62, 0);
    sub_100029D4C(v75);
    sub_100019318();
    while ((v40 & 0x8000000000000000) == 0)
    {
      sub_100019398();
      if (v63 == v64) {
        break;
      }
      sub_1000192FC();
      if ((v76 & 1) == 0) {
        goto LABEL_47;
      }
      if (*(_DWORD *)(v75 + 36) != v51) {
        goto LABEL_48;
      }
      sub_1000193C0();
      sub_100019334();
      swift_dynamicCast();
      sub_100019264((uint64_t)v118);
      uint64_t v77 = v122;
      uint64_t v78 = v120;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_100025594(0, v78[2] + 1, 1);
        uint64_t v78 = v120;
      }
      unint64_t v38 = v78[2];
      unint64_t v79 = v78[3];
      if (v38 >= v79 >> 1)
      {
        sub_100025594(v79 > 1, v38 + 1, 1);
        uint64_t v78 = v120;
      }
      v78[2] = v38 + 1;
      v78[v38 + 4] = v77;
      sub_100029BEC(v40, v51, v52 & 1, v75);
      sub_10001935C();
      id v28 = *(char **)(v80 - 256);
      id v32 = v116;
      if (v72)
      {
        sub_1000192B8(v40, v51, (char)v52);
        swift_bridgeObjectRelease();
        sub_1000192E0();
        goto LABEL_37;
      }
    }
LABEL_46:
    __break(1u);
LABEL_47:
    __break(1u);
LABEL_48:
    __break(1u);
LABEL_49:
    swift_once();
LABEL_38:
    uint64_t v81 = sub_1000410D0();
    sub_100007B8C(v81, (uint64_t)qword_100064678);
    id v82 = (id)v40;
    swift_bridgeObjectRetain();
    char v83 = sub_1000410C0();
    os_log_type_t v84 = sub_100041370();
    if (os_log_type_enabled(v83, v84))
    {
      uint64_t v85 = swift_slowAlloc();
      id v114 = v82;
      unint64_t v86 = v62;
      uint64_t v87 = v85;
      v112 = (char *)swift_slowAlloc();
      v119 = v112;
      *(_DWORD *)uint64_t v87 = 136315394;
      swift_bridgeObjectRetain();
      v118[0] = sub_10002E330(v103, v86, (uint64_t *)&v119);
      sub_100041450();
      id v82 = v114;
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v87 + 12) = 2080;
      swift_bridgeObjectRetain();
      uint64_t v88 = sub_100041280();
      unint64_t v90 = v89;
      swift_bridgeObjectRelease();
      v118[0] = sub_10002E330(v88, v90, (uint64_t *)&v119);
      sub_100041450();

      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v83, v84, "LSRAssets.init: Initialized with task name %s and its modelInfo supports the following tasks: %s", (uint8_t *)v87, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      v91 = *(void (**)(char *, uint64_t))(v109 + 8);
      uint64_t v92 = v107;
      v91(v115, v107);
      v91(v104, v92);
    }
    else
    {
      swift_bridgeObjectRelease_n();

      v93 = *(void (**)(char *, uint64_t))(v38 + 8);
      uint64_t v94 = v107;
      v93(v28, v107);
      v93((char *)v52, v94);
    }
    v95 = (objc_class *)type metadata accessor for LSRAssets();
    v117.receiver = v82;
    v117.Class super_class = v95;
    id v27 = (char *)objc_msgSendSuper2(&v117, "init");
    sub_100019154(v105, &qword_1000641E0);
    sub_100019374();
    v96();
    return (uint64_t)v27;
  }
  uint64_t result = swift_release();
  __break(1u);
  return result;
}

id sub_100015F18(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  NSString v5 = sub_1000411E0();
  swift_bridgeObjectRelease();
  id v6 = [v4 initWithLanguage:v5 assetType:a3];

  return v6;
}

id sub_100015F94()
{
  uint64_t v1 = v0;
  uint64_t v2 = OBJC_IVAR____TtC22localspeechrecognition9LSRAssets____lazy_storage___contextualData;
  uint64_t v3 = *(void **)(v0 + OBJC_IVAR____TtC22localspeechrecognition9LSRAssets____lazy_storage___contextualData);
  id v4 = v3;
  if (v3 == (void *)1)
  {
    NSString v5 = self;
    sub_100040E00();
    Class isa = sub_100041260().super.isa;
    swift_bridgeObjectRelease();
    id v7 = [v5 pathWithComponents:isa];

    uint64_t v8 = sub_1000411F0();
    uint64_t v10 = v9;

    id v11 = objc_allocWithZone((Class)_EARContextualData);
    id v4 = sub_100024628(v8, v10);
    NSString v12 = *(void **)(v1 + v2);
    *(void *)(v1 + v2) = v4;
    id v13 = v4;
    sub_100018708(v12);
  }
  sub_100018718(v3);
  return v4;
}

id sub_100016090()
{
  uint64_t v1 = OBJC_IVAR____TtC22localspeechrecognition9LSRAssets____lazy_storage___geoLMHelper;
  uint64_t v2 = *(void **)(v0 + OBJC_IVAR____TtC22localspeechrecognition9LSRAssets____lazy_storage___geoLMHelper);
  id v3 = v2;
  if (v2 == (void *)1)
  {
    id v3 = sub_100017960(*(void *)(v0 + OBJC_IVAR____TtC22localspeechrecognition9LSRAssets_language), *(void *)(v0 + OBJC_IVAR____TtC22localspeechrecognition9LSRAssets_language + 8));
    id v4 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v3;
    id v5 = v3;
    sub_100018708(v4);
  }
  sub_100018718(v2);
  return v3;
}

void sub_100016110(uint64_t a1, void (**a2)(void, void))
{
  uint64_t v4 = sub_100040E80();
  __chkstk_darwin(v4);
  id v6 = (char *)v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v7 + 16))(v6, a1 + OBJC_IVAR____TtC22localspeechrecognition9LSRAssets_modelRoot);
  uint64_t v8 = *(void *)(a1 + OBJC_IVAR____TtC22localspeechrecognition9LSRAssets_modelVersion);
  uint64_t v9 = *(void *)(a1 + OBJC_IVAR____TtC22localspeechrecognition9LSRAssets_modelVersion + 8);
  uint64_t v10 = *(void *)(a1 + OBJC_IVAR____TtC22localspeechrecognition9LSRAssets_modelTaskNames);
  uint64_t v11 = *(void *)(a1 + OBJC_IVAR____TtC22localspeechrecognition9LSRAssets_modelSamplingRates);
  uint64_t v12 = *(void *)(v11 + 16);
  if (v12)
  {
    v18[0] = *(void *)(a1 + OBJC_IVAR____TtC22localspeechrecognition9LSRAssets_modelQualityType);
    v18[3] = v8;
    id v19 = a2;
    uint64_t v20 = _swiftEmptyArrayStorage;
    v18[2] = v9;
    swift_bridgeObjectRetain();
    v18[1] = v10;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_1000415E0();
    uint64_t v13 = 0;
    do
    {
      uint64_t v14 = v13 + 1;
      [objc_allocWithZone((Class)NSNumber) initWithInteger:*(void *)(v11 + 8 * v13 + 32)];
      sub_1000415C0();
      sub_1000415F0();
      sub_100041600();
      sub_1000415D0();
      uint64_t v13 = v14;
    }
    while (v12 != v14);
    swift_bridgeObjectRelease();
    a2 = v19;
  }
  else
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  id v15 = objc_allocWithZone((Class)_SFModelProperties);
  id v17 = sub_10001836C((uint64_t)v6, v16);
  ((void (**)(void, id))a2)[2](a2, v17);

  _Block_release(a2);
}

void sub_1000163D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void (**a6)(void, void))
{
  if (qword_1000621C0 != -1) {
    swift_once();
  }
  uint64_t v8 = sub_1000410D0();
  sub_100007B8C(v8, (uint64_t)qword_100064690);
  uint64_t v9 = sub_1000410C0();
  os_log_type_t v10 = sub_100041370();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    aBlock[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v11 = 136315138;
    sub_10002E330(0xD00000000000003FLL, 0x800000010004C930, aBlock);
    sub_100041450();
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "LSRAssets.%s", v11, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = _swiftEmptyArrayStorage;
  id v13 = sub_100015F94();
  if (v13)
  {
    uint64_t v14 = v13;
    aBlock[4] = (uint64_t)sub_1000191A4;
    aBlock[5] = v12;
    aBlock[0] = (uint64_t)_NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_100016A38;
    aBlock[3] = (uint64_t)&unk_1000598E0;
    id v15 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    sub_1000190C4(a1, a2, a3, a4, (uint64_t)v15, v14, (SEL *)&selRef_iterNamedEntitySourceWithApplication_task_block_);
    _Block_release(v15);
  }
  swift_retain();
  uint64_t v16 = sub_1000410C0();
  os_log_type_t v17 = sub_100041370();
  if (os_log_type_enabled(v16, v17))
  {
    uint64_t v18 = swift_slowAlloc();
    aBlock[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v18 = 136315394;
    sub_10002E330(0xD00000000000003FLL, 0x800000010004C930, aBlock);
    sub_100041450();
    *(_WORD *)(v18 + 12) = 2048;
    swift_beginAccess();
    if (*(void *)(v12 + 16) >> 62)
    {
      swift_bridgeObjectRetain();
      sub_1000416B0();
      swift_bridgeObjectRelease();
    }
    sub_100041450();
    swift_release();
    _os_log_impl((void *)&_mh_execute_header, v16, v17, "LSRAssets.%s replying with %ld sources", (uint8_t *)v18, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_release();
  }
  swift_beginAccess();
  sub_10000CD4C(0, &qword_100063EB8);
  swift_bridgeObjectRetain();
  Class isa = sub_100041260().super.isa;
  ((void (**)(void, Class))a6)[2](a6, isa);
  swift_release();
  swift_bridgeObjectRelease();

  _Block_release(a6);
}

uint64_t sub_10001685C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10 = sub_100007A58(&qword_1000641B0);
  uint64_t v11 = __chkstk_darwin(v10 - 8);
  id v13 = (char *)v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  id v15 = (char *)v21 - v14;
  if (!a1)
  {
    __break(1u);
    goto LABEL_6;
  }
  uint64_t v16 = swift_bridgeObjectRetain();
  v21[0] = (uint64_t)sub_10002ECEC(v16);
  sub_100018780(v21);
  swift_bridgeObjectRelease();
  uint64_t v17 = v21[0];
  sub_1000191AC(a2, (uint64_t)v15, &qword_1000641B0);
  uint64_t v18 = sub_100040EE0();
  if (sub_100007B04((uint64_t)v15, 1, v18) == 1)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  sub_1000191AC(a3, (uint64_t)v13, &qword_1000641B0);
  if (sub_100007B04((uint64_t)v13, 1, v18) != 1)
  {
    id v19 = objc_allocWithZone((Class)_SFContextualNamedEntitySource);
    sub_1000184C4(v17, (uint64_t)v15, (uint64_t)v13, a4);
    swift_beginAccess();
    sub_100041250();
    sub_100019A58(*(void *)((*(void *)(a5 + 16) & 0xFFFFFFFFFFFFFF8) + 0x10));
    sub_1000412C0();
    sub_100041290();
    return swift_endAccess();
  }
LABEL_7:
  __break(1u);
  uint64_t result = swift_release();
  __break(1u);
  return result;
}

uint64_t sub_100016A38(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10 = sub_100007A58(&qword_1000641B0);
  uint64_t v11 = __chkstk_darwin(v10 - 8);
  id v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  id v15 = (char *)&v22 - v14;
  uint64_t v16 = *(void (**)(uint64_t, char *, char *, uint64_t))(a1 + 32);
  if (a2) {
    a2 = sub_100041330();
  }
  if (a3)
  {
    sub_100040ED0();
    uint64_t v17 = sub_100040EE0();
    uint64_t v18 = 0;
  }
  else
  {
    uint64_t v17 = sub_100040EE0();
    uint64_t v18 = 1;
  }
  uint64_t v19 = 1;
  sub_10000A374((uint64_t)v15, v18, 1, v17);
  if (a4)
  {
    sub_100040ED0();
    uint64_t v19 = 0;
  }
  uint64_t v20 = sub_100040EE0();
  sub_10000A374((uint64_t)v13, v19, 1, v20);
  swift_retain();
  v16(a2, v15, v13, a5);
  swift_release();
  swift_bridgeObjectRelease();
  sub_100019154((uint64_t)v13, &qword_1000641B0);
  return sub_100019154((uint64_t)v15, &qword_1000641B0);
}

void sub_100016BEC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void (**a6)(void, void))
{
  if (qword_1000621C0 != -1) {
    swift_once();
  }
  uint64_t v8 = sub_1000410D0();
  sub_100007B8C(v8, (uint64_t)qword_100064690);
  uint64_t v9 = sub_1000410C0();
  os_log_type_t v10 = sub_100041370();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    aBlock[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v11 = 136315138;
    sub_10002E330(0xD000000000000041, 0x800000010004C8B0, aBlock);
    sub_100041450();
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "LSRAssets.%s", v11, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = _swiftEmptyArrayStorage;
  id v13 = sub_100015F94();
  if (v13)
  {
    uint64_t v14 = v13;
    aBlock[4] = (uint64_t)sub_100018760;
    aBlock[5] = v12;
    aBlock[0] = (uint64_t)_NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_1000171D0;
    aBlock[3] = (uint64_t)&unk_100059890;
    id v15 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    sub_1000190C4(a1, a2, a3, a4, (uint64_t)v15, v14, (SEL *)&selRef_iterRankedContactSourceWithApplication_task_block_);
    _Block_release(v15);
  }
  swift_retain();
  uint64_t v16 = sub_1000410C0();
  os_log_type_t v17 = sub_100041370();
  if (os_log_type_enabled(v16, v17))
  {
    uint64_t v18 = swift_slowAlloc();
    aBlock[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v18 = 136315394;
    sub_10002E330(0xD000000000000041, 0x800000010004C8B0, aBlock);
    sub_100041450();
    *(_WORD *)(v18 + 12) = 2048;
    swift_beginAccess();
    if (*(void *)(v12 + 16) >> 62)
    {
      swift_bridgeObjectRetain();
      sub_1000416B0();
      swift_bridgeObjectRelease();
    }
    sub_100041450();
    swift_release();
    _os_log_impl((void *)&_mh_execute_header, v16, v17, "LSRAssets.%s replying with %ld sources", (uint8_t *)v18, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_release();
  }
  swift_beginAccess();
  sub_10000CD4C(0, &qword_100063EB0);
  swift_bridgeObjectRetain();
  Class isa = sub_100041260().super.isa;
  ((void (**)(void, Class))a6)[2](a6, isa);
  swift_release();
  swift_bridgeObjectRelease();

  _Block_release(a6);
}

uint64_t sub_100017070(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6)
{
  uint64_t v12 = sub_100007A58(&qword_1000641B0);
  uint64_t result = __chkstk_darwin(v12 - 8);
  unint64_t v15 = (v14 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v16 = (char *)&v18 - v15;
  if (a2)
  {
    sub_1000191AC(a3, (uint64_t)&v18 - v15, &qword_1000641B0);
    uint64_t v17 = sub_100040EE0();
    uint64_t result = sub_100007B04((uint64_t)v16, 1, v17);
    if (result != 1)
    {
      objc_allocWithZone((Class)_SFContextualRankedContactSource);
      swift_bridgeObjectRetain();
      sub_1000185C0(a1, a2, (uint64_t)v16, a4 & 1, a5);
      swift_beginAccess();
      sub_100041250();
      sub_100019A58(*(void *)((*(void *)(a6 + 16) & 0xFFFFFFFFFFFFFF8) + 0x10));
      sub_1000412C0();
      sub_100041290();
      return swift_endAccess();
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_1000171D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10 = sub_100007A58(&qword_1000641B0);
  __chkstk_darwin(v10 - 8);
  uint64_t v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v13 = *(void (**)(uint64_t, uint64_t, char *, uint64_t, uint64_t))(a1 + 32);
  if (!a2)
  {
    uint64_t v14 = 0;
    if (a3) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v16 = sub_100040EE0();
    uint64_t v17 = 1;
    goto LABEL_6;
  }
  uint64_t v14 = sub_1000411F0();
  a2 = v15;
  if (!a3) {
    goto LABEL_5;
  }
LABEL_3:
  sub_100040ED0();
  uint64_t v16 = sub_100040EE0();
  uint64_t v17 = 0;
LABEL_6:
  sub_10000A374((uint64_t)v12, v17, 1, v16);
  swift_retain();
  v13(v14, a2, v12, a4, a5);
  swift_release();
  swift_bridgeObjectRelease();
  return sub_100019154((uint64_t)v12, &qword_1000641B0);
}

uint64_t sub_100017324(void *a1, int a2, int a3, int a4, void *aBlock, void (*a6)(uint64_t, uint64_t, uint64_t, uint64_t, id, void *))
{
  uint64_t v8 = _Block_copy(aBlock);
  uint64_t v9 = sub_1000411F0();
  uint64_t v11 = v10;
  uint64_t v12 = sub_1000411F0();
  uint64_t v14 = v13;
  _Block_copy(v8);
  id v15 = a1;
  a6(v9, v11, v12, v14, v15, v8);
  _Block_release(v8);

  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void sub_1000173EC(uint64_t a1, void (**a2)(void, NSString), double a3, double a4)
{
  id v31 = a2;
  uint64_t v7 = sub_1000410D0();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1000621C0 != -1) {
    swift_once();
  }
  uint64_t v11 = sub_100007B8C(v7, (uint64_t)qword_100064690);
  uint64_t v12 = sub_1000410C0();
  os_log_type_t v13 = sub_100041370();
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v30 = a1;
    uint64_t v14 = (uint8_t *)swift_slowAlloc();
    uint64_t v32 = swift_slowAlloc();
    *(_DWORD *)uint64_t v14 = 136315138;
    uint64_t v34 = sub_10002E330(0xD00000000000002ELL, 0x800000010004C850, &v32);
    sub_100041450();
    _os_log_impl((void *)&_mh_execute_header, v12, v13, "LSRAssets.%s", v14, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  id v15 = sub_100016090();
  if (v15
    && (uint64_t v16 = v15,
        sub_100040F30(),
        NSString v17 = sub_1000411E0(),
        swift_bridgeObjectRelease(),
        id v18 = [v16 regionIdForLocale:v17 latitude:a3 longitude:a4],
        v16,
        v17,
        v18))
  {
    uint64_t v19 = sub_1000411F0();
    uint64_t v21 = v20;
  }
  else
  {
    uint64_t v19 = 0;
    uint64_t v21 = 0;
  }
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, v11, v7);
  swift_bridgeObjectRetain_n();
  uint64_t v22 = sub_1000410C0();
  os_log_type_t v23 = sub_100041370();
  if (os_log_type_enabled(v22, v23))
  {
    uint64_t v29 = v7;
    uint64_t v30 = v19;
    uint64_t v24 = swift_slowAlloc();
    uint64_t v34 = swift_slowAlloc();
    *(_DWORD *)uint64_t v24 = 136315394;
    uint64_t v32 = sub_10002E330(0xD00000000000002ELL, 0x800000010004C850, &v34);
    sub_100041450();
    *(_WORD *)(v24 + 12) = 2080;
    if (v21)
    {
      uint64_t v32 = 34;
      unint64_t v33 = 0xE100000000000000;
      v35._countAndFlagsBits = v30;
      v35._object = v21;
      sub_100041230(v35);
      v36._countAndFlagsBits = 34;
      v36._object = (void *)0xE100000000000000;
      sub_100041230(v36);
      uint64_t v25 = v32;
      unint64_t v26 = v33;
    }
    else
    {
      unint64_t v26 = 0xE300000000000000;
      uint64_t v25 = 7104878;
    }
    uint64_t v32 = sub_10002E330(v25, v26, &v34);
    sub_100041450();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v22, v23, "LSRAssets.%s replying %s", (uint8_t *)v24, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v29);
    if (!v21) {
      goto LABEL_16;
    }
  }
  else
  {

    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
    if (!v21)
    {
LABEL_16:
      NSString v27 = 0;
      goto LABEL_17;
    }
  }
  NSString v27 = sub_1000411E0();
LABEL_17:
  id v28 = v31;
  v31[2](v31, v27);
  swift_bridgeObjectRelease();

  _Block_release(v28);
}

id sub_100017960(uint64_t a1, unint64_t a2)
{
  uint64_t v50 = sub_1000410D0();
  sub_100008220();
  uint64_t v47 = v4;
  __chkstk_darwin(v5);
  sub_100008250();
  uint64_t v48 = v7 - v6;
  uint64_t v8 = sub_100007A58(&qword_1000641E0);
  __chkstk_darwin(v8 - 8);
  sub_100008250();
  uint64_t v11 = v10 - v9;
  uint64_t v12 = sub_100040E80();
  sub_100008220();
  uint64_t v14 = v13;
  __chkstk_darwin(v15);
  sub_100008250();
  uint64_t v18 = v17 - v16;
  sub_10000CD4C(0, &qword_100063EA8);
  swift_bridgeObjectRetain();
  id v19 = sub_100015F18(a1, a2, 4);
  uint64_t v20 = self;
  id v21 = [v20 sharedInstance];
  NSString v22 = sub_1000411E0();
  uint64_t v49 = v19;
  id v23 = [v21 installedAssetWithConfig:v19 regionId:0 shouldSubscribe:1 subscriberId:v22 expiration:0];

  if (!v23) {
    goto LABEL_8;
  }
  uint64_t v24 = sub_1000411F0();
  unint64_t v26 = v25;

  uint64_t v27 = HIBYTE(v26) & 0xF;
  if ((v26 & 0x2000000000000000) == 0) {
    uint64_t v27 = v24 & 0xFFFFFFFFFFFFLL;
  }
  if (!v27)
  {
    swift_bridgeObjectRelease();
LABEL_8:
    if (qword_1000621C0 != -1) {
      swift_once();
    }
    sub_100007B8C(v50, (uint64_t)qword_100064690);
    swift_bridgeObjectRetain_n();
    id v31 = sub_1000410C0();
    os_log_type_t v32 = sub_100041380();
    if (os_log_type_enabled(v31, v32))
    {
      unint64_t v33 = (uint8_t *)swift_slowAlloc();
      uint64_t v51 = swift_slowAlloc();
      *(_DWORD *)unint64_t v33 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v34 = sub_10002E330(a1, a2, &v51);
      sub_1000193AC(v34);
      sub_100041450();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v31, v32, "GeoLM: region mapping json file is nil Or there is no regionMapping for given language=%s", v33, 0xCu);
      swift_arrayDestroy();
      sub_10000A754();
      sub_10000A754();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    goto LABEL_27;
  }
  id v28 = [v20 jsonFilenameForAssetType:4];
  sub_1000411F0();

  sub_100040E50();
  swift_bridgeObjectRelease();
  if (sub_100007B04(v11, 1, v12) == 1)
  {
    swift_bridgeObjectRelease();
    sub_100019154(v11, &qword_1000641E0);
    uint64_t v29 = 0;
    unint64_t v30 = 0;
  }
  else
  {
    sub_100040E20();
    swift_bridgeObjectRelease();
    Swift::String v35 = *(void (**)(uint64_t, uint64_t))(v14 + 8);
    v35(v11, v12);
    uint64_t v29 = sub_100040E40(0);
    unint64_t v30 = v36;
    v35(v18, v12);
  }
  if (qword_1000621C0 != -1) {
    swift_once();
  }
  uint64_t v37 = sub_100007B8C(v50, (uint64_t)qword_100064690);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v47 + 16))(v48, v37, v50);
  swift_bridgeObjectRetain_n();
  unint64_t v38 = sub_1000410C0();
  os_log_type_t v39 = sub_100041370();
  if (os_log_type_enabled(v38, v39))
  {
    int64_t v40 = (uint8_t *)swift_slowAlloc();
    uint64_t v51 = swift_slowAlloc();
    *(_DWORD *)int64_t v40 = 136315138;
    if (v30) {
      uint64_t v41 = v29;
    }
    else {
      uint64_t v41 = 7104878;
    }
    if (v30) {
      unint64_t v42 = v30;
    }
    else {
      unint64_t v42 = 0xE300000000000000;
    }
    swift_bridgeObjectRetain();
    uint64_t v43 = sub_10002E330(v41, v42, &v51);
    sub_1000193AC(v43);
    sub_100041450();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v38, v39, "GeoLM: region mapping json file=%s", v40, 0xCu);
    swift_arrayDestroy();
    sub_10000A754();
    sub_10000A754();

    (*(void (**)(uint64_t, uint64_t))(v47 + 8))(v48, v50);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    (*(void (**)(uint64_t, uint64_t))(v47 + 8))(v48, v50);
  }
  if (!v30)
  {
LABEL_27:

    return 0;
  }
  sub_100040F30();
  id v44 = objc_allocWithZone((Class)_EARGeoLMHelper);
  id v45 = sub_100018680();

  return v45;
}

void sub_100017FB4()
{
}

id sub_100017FF4()
{
  v2.receiver = v0;
  v2.Class super_class = (Class)type metadata accessor for LSRAssets();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_100018184()
{
  return type metadata accessor for LSRAssets();
}

uint64_t type metadata accessor for LSRAssets()
{
  uint64_t result = qword_100063E90;
  if (!qword_100063E90) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_1000181D4()
{
  sub_100040FF0();
  if (v0 <= 0x3F)
  {
    sub_100018314();
    if (v1 <= 0x3F)
    {
      sub_100040E80();
      if (v2 <= 0x3F) {
        swift_updateClassMetadata2();
      }
    }
  }
}

void sub_100018314()
{
  if (!qword_100063EA0)
  {
    sub_100040E80();
    unint64_t v0 = sub_100041440();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_100063EA0);
    }
  }
}

id sub_10001836C@<X0>(uint64_t a1@<X0>, NSURL *a2@<X8>)
{
  id v3 = v2;
  sub_100040E10(a2);
  uint64_t v6 = v5;
  NSString v7 = sub_1000411E0();
  swift_bridgeObjectRelease();
  Class isa = sub_100041260().super.isa;
  swift_bridgeObjectRelease();
  NSString v9 = sub_1000411E0();
  swift_bridgeObjectRelease();
  sub_10000CD4C(0, &qword_100063260);
  Class v10 = sub_100041260().super.isa;
  swift_bridgeObjectRelease();
  id v11 = [v3 initWithModelRoot:v6 modelVersion:v7 modelTaskNames:isa modelQualityType:v9 modelSamplingRates:v10];

  uint64_t v12 = sub_100040E80();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v12 - 8) + 8))(a1, v12);
  return v11;
}

id sub_1000184C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = v4;
  Class isa = sub_100041260().super.isa;
  swift_bridgeObjectRelease();
  Class v10 = sub_100040EB0().super.isa;
  Class v11 = sub_100040EB0().super.isa;
  id v12 = [v5 initWithSourceApplications:isa fromDate:v10 toDate:v11 limit:a4];

  uint64_t v13 = sub_100040EE0();
  uint64_t v14 = *(void (**)(uint64_t, uint64_t))(*(void *)(v13 - 8) + 8);
  v14(a3, v13);
  v14(a2, v13);
  return v12;
}

id sub_1000185C0(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5)
{
  uint64_t v6 = v5;
  NSString v10 = sub_1000411E0();
  swift_bridgeObjectRelease();
  Class isa = sub_100040EB0().super.isa;
  id v12 = [v6 initWithSourceApplication:v10 rankDate:isa contactOnly:a4 & 1 limit:a5];

  uint64_t v13 = sub_100040EE0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v13 - 8) + 8))(a3, v13);
  return v12;
}

id sub_100018680()
{
  NSString v1 = sub_1000411E0();
  swift_bridgeObjectRelease();
  NSString v2 = sub_1000411E0();
  swift_bridgeObjectRelease();
  id v3 = [v0 initWithLocale:v1 config:v2];

  return v3;
}

void sub_100018708(id a1)
{
  if (a1 != (id)1) {
}
  }

id sub_100018718(id result)
{
  if (result != (id)1) {
    return result;
  }
  return result;
}

uint64_t sub_100018728()
{
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100018760(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5)
{
  return sub_100017070(a1, a2, a3, a4, a5, v5);
}

uint64_t sub_100018768(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100018778()
{
  return swift_release();
}

void sub_100018780(uint64_t *a1)
{
  uint64_t v2 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
    sub_10002F948(v2);
    uint64_t v2 = v3;
  }
  uint64_t v4 = *(void *)(v2 + 16);
  v5[0] = v2 + 32;
  v5[1] = v4;
  sub_1000187EC(v5);
  *a1 = v2;
}

void sub_1000187EC(uint64_t *a1)
{
  Swift::Int v3 = a1[1];
  Swift::Int v4 = sub_100041710(v3);
  if (v4 >= v3)
  {
    if ((v3 & 0x8000000000000000) == 0)
    {
      if (v3) {
        sub_100018E54(0, v3, 1, a1);
      }
      return;
    }
    goto LABEL_144;
  }
  Swift::Int v5 = v4;
  uint64_t v100 = sub_10002DFA8(v3 / 2);
  uint64_t v101 = v3;
  uint64_t v102 = v6;
  v98 = a1;
  if (v3 <= 0)
  {
    uint64_t v103 = (unint64_t *)&_swiftEmptyArrayStorage;
    unint64_t v32 = *((void *)&_swiftEmptyArrayStorage + 2);
LABEL_110:
    if (v32 < 2)
    {
LABEL_121:
      swift_bridgeObjectRelease();
      if (v3 >= -1)
      {
        v100[2] = 0;
        swift_bridgeObjectRelease();
        return;
      }
      goto LABEL_149;
    }
    uint64_t v89 = *v98;
    while (1)
    {
      unint64_t v90 = v32 - 2;
      if (v32 < 2) {
        break;
      }
      if (!v89) {
        goto LABEL_153;
      }
      v91 = v103;
      int64_t v92 = v103[2 * v90 + 4];
      int64_t v93 = v103[2 * v32 + 3];
      sub_100018F1C((char *)(v89 + 16 * v92), (char *)(v89 + 16 * v103[2 * v32 + 2]), v89 + 16 * v93, v102);
      if (v1) {
        goto LABEL_106;
      }
      if (v93 < v92) {
        goto LABEL_139;
      }
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_10002EF74((uint64_t)v103);
        v91 = v96;
      }
      if (v90 >= v91[2]) {
        goto LABEL_140;
      }
      uint64_t v94 = &v91[2 * v90 + 4];
      *uint64_t v94 = v92;
      v94[1] = v93;
      unint64_t v95 = v91[2];
      if (v32 > v95) {
        goto LABEL_141;
      }
      memmove(&v91[2 * v32 + 2], &v91[2 * v32 + 4], 16 * (v95 - v32));
      uint64_t v103 = v91;
      v91[2] = v95 - 1;
      unint64_t v32 = v95 - 1;
      Swift::Int v3 = v101;
      if (v95 <= 2) {
        goto LABEL_121;
      }
    }
LABEL_138:
    __break(1u);
LABEL_139:
    __break(1u);
LABEL_140:
    __break(1u);
LABEL_141:
    __break(1u);
LABEL_142:
    __break(1u);
LABEL_143:
    __break(1u);
LABEL_144:
    __break(1u);
LABEL_145:
    __break(1u);
LABEL_146:
    __break(1u);
LABEL_147:
    __break(1u);
LABEL_148:
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
    return;
  }
  Swift::Int v99 = v5;
  Swift::Int v7 = 0;
  uint64_t v8 = *a1;
  uint64_t v97 = *a1 + 8;
  uint64_t v103 = (unint64_t *)&_swiftEmptyArrayStorage;
  while (1)
  {
    Swift::Int v9 = v7++;
    if (v7 >= v3) {
      goto LABEL_32;
    }
    NSString v10 = (uint64_t *)(v8 + 16 * v7);
    uint64_t v11 = *v10;
    uint64_t v12 = v10[1];
    uint64_t v13 = (void *)(v8 + 16 * v9);
    if (v11 == *v13 && v12 == v13[1])
    {
      Swift::Int v16 = v9 + 2;
      if (v9 + 2 >= v3) {
        goto LABEL_31;
      }
      int v15 = 0;
LABEL_13:
      uint64_t v17 = (void *)(v97 + 16 * v16);
      do
      {
        uint64_t v18 = (void *)(v8 + 16 * v7);
        if (*(v17 - 1) == *v18 && *v17 == v18[1])
        {
          if (v15) {
            goto LABEL_24;
          }
        }
        else if ((v15 ^ sub_100041720()))
        {
          goto LABEL_23;
        }
        v17 += 2;
        Swift::Int v20 = v16 + 1;
        Swift::Int v7 = v16;
        Swift::Int v16 = v20;
      }
      while (v20 < v3);
      Swift::Int v16 = v20;
      goto LABEL_23;
    }
    int v15 = sub_100041720();
    Swift::Int v16 = v9 + 2;
    if (v9 + 2 < v3) {
      goto LABEL_13;
    }
LABEL_23:
    Swift::Int v7 = v16;
    if ((v15 & 1) == 0) {
      goto LABEL_32;
    }
LABEL_24:
    if (v16 < v9) {
      goto LABEL_148;
    }
    if (v9 < v16)
    {
      uint64_t v21 = 16 * v16;
      uint64_t v22 = 16 * v9;
      Swift::Int v23 = v16;
      Swift::Int v24 = v9;
      do
      {
        if (v24 != --v23)
        {
          if (!v8) {
            goto LABEL_152;
          }
          uint64_t v25 = v8 + v21;
          uint64_t v26 = *(void *)(v8 + v22);
          uint64_t v27 = *(void *)(v8 + v22 + 8);
          *(_OWORD *)(v8 + v22) = *(_OWORD *)(v8 + v21 - 16);
          *(void *)(v25 - 16) = v26;
          *(void *)(v25 - 8) = v27;
        }
        ++v24;
        v21 -= 16;
        v22 += 16;
      }
      while (v24 < v23);
    }
LABEL_31:
    Swift::Int v7 = v16;
LABEL_32:
    if (v7 >= v3) {
      goto LABEL_41;
    }
    if (__OFSUB__(v7, v9)) {
      goto LABEL_143;
    }
    if (v7 - v9 >= v99) {
      goto LABEL_41;
    }
    if (__OFADD__(v9, v99)) {
      goto LABEL_146;
    }
    if (v9 + v99 >= v3) {
      Swift::Int v28 = v3;
    }
    else {
      Swift::Int v28 = v9 + v99;
    }
    if (v28 < v9) {
      goto LABEL_147;
    }
    if (v7 == v28)
    {
LABEL_41:
      uint64_t v29 = (char *)v103;
    }
    else
    {
      uint64_t v80 = (void *)(v8 + 16 * v7);
      uint64_t v29 = (char *)v103;
      do
      {
        uint64_t v81 = (uint64_t *)(v8 + 16 * v7);
        uint64_t v82 = *v81;
        uint64_t v83 = v81[1];
        Swift::Int v84 = v9;
        uint64_t v85 = v80;
        do
        {
          BOOL v86 = v82 == *(v85 - 2) && v83 == *(v85 - 1);
          if (v86 || (sub_100041720() & 1) == 0) {
            break;
          }
          if (!v8) {
            goto LABEL_150;
          }
          uint64_t v82 = *v85;
          uint64_t v83 = v85[1];
          *(_OWORD *)uint64_t v85 = *((_OWORD *)v85 - 1);
          *(v85 - 1) = v83;
          *(v85 - 2) = v82;
          v85 -= 2;
          ++v84;
        }
        while (v7 != v84);
        ++v7;
        v80 += 2;
      }
      while (v7 != v28);
      Swift::Int v7 = v28;
    }
    if (v7 < v9) {
      goto LABEL_142;
    }
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      sub_10002EEA0(0, *((void *)v29 + 2) + 1, 1, v29);
      uint64_t v29 = v87;
    }
    unint64_t v31 = *((void *)v29 + 2);
    unint64_t v30 = *((void *)v29 + 3);
    unint64_t v32 = v31 + 1;
    if (v31 >= v30 >> 1)
    {
      sub_10002EEA0(v30 > 1, v31 + 1, 1, v29);
      uint64_t v29 = v88;
    }
    *((void *)v29 + 2) = v32;
    unint64_t v33 = v29 + 32;
    uint64_t v34 = (Swift::Int *)&v29[16 * v31 + 32];
    Swift::Int *v34 = v9;
    v34[1] = v7;
    uint64_t v103 = (unint64_t *)v29;
    if (v31) {
      break;
    }
    unint64_t v32 = 1;
LABEL_90:
    Swift::Int v3 = v101;
    if (v7 >= v101) {
      goto LABEL_110;
    }
  }
  while (1)
  {
    unint64_t v35 = v32 - 1;
    if (v32 >= 4)
    {
      int64_t v40 = &v33[16 * v32];
      uint64_t v41 = *((void *)v40 - 8);
      uint64_t v42 = *((void *)v40 - 7);
      BOOL v46 = __OFSUB__(v42, v41);
      uint64_t v43 = v42 - v41;
      if (v46) {
        goto LABEL_127;
      }
      uint64_t v45 = *((void *)v40 - 6);
      uint64_t v44 = *((void *)v40 - 5);
      BOOL v46 = __OFSUB__(v44, v45);
      uint64_t v38 = v44 - v45;
      char v39 = v46;
      if (v46) {
        goto LABEL_128;
      }
      unint64_t v47 = v32 - 2;
      uint64_t v48 = &v33[16 * v32 - 32];
      uint64_t v50 = *(void *)v48;
      uint64_t v49 = *((void *)v48 + 1);
      BOOL v46 = __OFSUB__(v49, v50);
      uint64_t v51 = v49 - v50;
      if (v46) {
        goto LABEL_129;
      }
      BOOL v46 = __OFADD__(v38, v51);
      uint64_t v52 = v38 + v51;
      if (v46) {
        goto LABEL_131;
      }
      if (v52 >= v43)
      {
        uint64_t v70 = &v33[16 * v35];
        uint64_t v72 = *(void *)v70;
        uint64_t v71 = *((void *)v70 + 1);
        BOOL v46 = __OFSUB__(v71, v72);
        uint64_t v73 = v71 - v72;
        if (v46) {
          goto LABEL_137;
        }
        BOOL v63 = v38 < v73;
        goto LABEL_79;
      }
    }
    else
    {
      if (v32 != 3)
      {
        uint64_t v64 = *((void *)v29 + 4);
        uint64_t v65 = *((void *)v29 + 5);
        BOOL v46 = __OFSUB__(v65, v64);
        uint64_t v57 = v65 - v64;
        char v58 = v46;
        goto LABEL_73;
      }
      uint64_t v37 = *((void *)v29 + 4);
      uint64_t v36 = *((void *)v29 + 5);
      BOOL v46 = __OFSUB__(v36, v37);
      uint64_t v38 = v36 - v37;
      char v39 = v46;
    }
    if (v39) {
      goto LABEL_130;
    }
    unint64_t v47 = v32 - 2;
    id v53 = &v33[16 * v32 - 32];
    uint64_t v55 = *(void *)v53;
    uint64_t v54 = *((void *)v53 + 1);
    BOOL v56 = __OFSUB__(v54, v55);
    uint64_t v57 = v54 - v55;
    char v58 = v56;
    if (v56) {
      goto LABEL_132;
    }
    unint64_t v59 = &v33[16 * v35];
    uint64_t v61 = *(void *)v59;
    uint64_t v60 = *((void *)v59 + 1);
    BOOL v46 = __OFSUB__(v60, v61);
    uint64_t v62 = v60 - v61;
    if (v46) {
      goto LABEL_134;
    }
    if (__OFADD__(v57, v62)) {
      goto LABEL_136;
    }
    if (v57 + v62 >= v38)
    {
      BOOL v63 = v38 < v62;
LABEL_79:
      if (v63) {
        unint64_t v35 = v47;
      }
      goto LABEL_81;
    }
LABEL_73:
    if (v58) {
      goto LABEL_133;
    }
    uint64_t v66 = &v33[16 * v35];
    uint64_t v68 = *(void *)v66;
    uint64_t v67 = *((void *)v66 + 1);
    BOOL v46 = __OFSUB__(v67, v68);
    uint64_t v69 = v67 - v68;
    if (v46) {
      goto LABEL_135;
    }
    if (v69 < v57) {
      goto LABEL_90;
    }
LABEL_81:
    unint64_t v74 = v35 - 1;
    if (v35 - 1 >= v32)
    {
      __break(1u);
LABEL_124:
      __break(1u);
LABEL_125:
      __break(1u);
LABEL_126:
      __break(1u);
LABEL_127:
      __break(1u);
LABEL_128:
      __break(1u);
LABEL_129:
      __break(1u);
LABEL_130:
      __break(1u);
LABEL_131:
      __break(1u);
LABEL_132:
      __break(1u);
LABEL_133:
      __break(1u);
LABEL_134:
      __break(1u);
LABEL_135:
      __break(1u);
LABEL_136:
      __break(1u);
LABEL_137:
      __break(1u);
      goto LABEL_138;
    }
    if (!v8) {
      goto LABEL_151;
    }
    uint64_t v75 = &v33[16 * v74];
    uint64_t v76 = *(void *)v75;
    uint64_t v77 = &v33[16 * v35];
    uint64_t v78 = *((void *)v77 + 1);
    sub_100018F1C((char *)(v8 + 16 * *(void *)v75), (char *)(v8 + 16 * *(void *)v77), v8 + 16 * v78, v102);
    if (v1) {
      break;
    }
    if (v78 < v76) {
      goto LABEL_124;
    }
    if (v35 > v103[2]) {
      goto LABEL_125;
    }
    *(void *)uint64_t v75 = v76;
    *(void *)&v33[16 * v74 + 8] = v78;
    unint64_t v79 = v103[2];
    if (v35 >= v79) {
      goto LABEL_126;
    }
    uint64_t v29 = (char *)v103;
    unint64_t v32 = v79 - 1;
    memmove(&v33[16 * v35], v77 + 16, 16 * (v79 - 1 - v35));
    v103[2] = v79 - 1;
    if (v79 <= 2) {
      goto LABEL_90;
    }
  }
LABEL_106:
  swift_bridgeObjectRelease();
  if (v101 < -1) {
    goto LABEL_145;
  }
  v100[2] = 0;
  swift_bridgeObjectRelease();
}

uint64_t sub_100018E54(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  if (a3 != a2)
  {
    uint64_t v4 = a3;
    uint64_t v6 = result;
    uint64_t v7 = *a4;
    uint64_t v8 = *a4 + 16 * a3;
    while (2)
    {
      Swift::Int v9 = (uint64_t *)(v7 + 16 * v4);
      uint64_t result = *v9;
      uint64_t v10 = v9[1];
      uint64_t v11 = v6;
      uint64_t v12 = (uint64_t *)v8;
      do
      {
        if (result == *(v12 - 2) && v10 == *(v12 - 1)) {
          break;
        }
        uint64_t result = sub_100041720();
        if ((result & 1) == 0) {
          break;
        }
        if (!v7)
        {
          __break(1u);
          return result;
        }
        uint64_t result = *v12;
        uint64_t v10 = v12[1];
        *(_OWORD *)uint64_t v12 = *((_OWORD *)v12 - 1);
        *(v12 - 1) = v10;
        *(v12 - 2) = result;
        v12 -= 2;
        ++v11;
      }
      while (v4 != v11);
      ++v4;
      v8 += 16;
      if (v4 != a2) {
        continue;
      }
      break;
    }
  }
  return result;
}

uint64_t sub_100018F1C(char *a1, char *a2, unint64_t a3, char *a4)
{
  uint64_t v4 = a4;
  uint64_t v6 = a2;
  uint64_t v7 = a1;
  uint64_t v8 = a2 - a1;
  uint64_t v9 = (a2 - a1) / 16;
  uint64_t v10 = a3 - (void)a2;
  uint64_t v11 = (uint64_t)(a3 - (void)a2) / 16;
  if (v9 >= v11)
  {
    sub_10002E038(a2, (uint64_t)(a3 - (void)a2) / 16, a4);
    unint64_t v12 = (unint64_t)&v4[16 * v11];
    if (v7 >= v6 || v10 < 16) {
      goto LABEL_47;
    }
    uint64_t v18 = (char *)(a3 - 16);
    while (1)
    {
      id v19 = v18 + 16;
      Swift::Int v20 = (char *)(v12 - 16);
      BOOL v21 = *(void *)(v12 - 16) == *((void *)v6 - 2) && *(void *)(v12 - 8) == *((void *)v6 - 1);
      if (v21 || (sub_100041720() & 1) == 0)
      {
        BOOL v23 = v19 != (char *)v12 || (unint64_t)v18 >= v12;
        v12 -= 16;
        if (!v23) {
          goto LABEL_43;
        }
      }
      else
      {
        BOOL v22 = v19 != v6 || v18 >= v6;
        Swift::Int v20 = v6 - 16;
        v6 -= 16;
        if (!v22) {
          goto LABEL_43;
        }
      }
      *(_OWORD *)uint64_t v18 = *(_OWORD *)v20;
LABEL_43:
      v18 -= 16;
      if (v6 <= v7 || v12 <= (unint64_t)v4) {
        goto LABEL_47;
      }
    }
  }
  sub_10002E038(a1, (a2 - a1) / 16, a4);
  unint64_t v12 = (unint64_t)&v4[16 * v9];
  if ((unint64_t)v6 < a3 && v8 >= 16)
  {
    while (1)
    {
      BOOL v14 = *(void *)v6 == *(void *)v4 && *((void *)v6 + 1) == *((void *)v4 + 1);
      if (!v14 && (sub_100041720() & 1) != 0) {
        break;
      }
      int v15 = v4;
      BOOL v14 = v7 == v4;
      v4 += 16;
      if (!v14) {
        goto LABEL_15;
      }
LABEL_16:
      v7 += 16;
      if ((unint64_t)v4 >= v12 || (unint64_t)v6 >= a3) {
        goto LABEL_21;
      }
    }
    int v15 = v6;
    BOOL v14 = v7 == v6;
    v6 += 16;
    if (v14) {
      goto LABEL_16;
    }
LABEL_15:
    *(_OWORD *)uint64_t v7 = *(_OWORD *)v15;
    goto LABEL_16;
  }
LABEL_21:
  uint64_t v6 = v7;
LABEL_47:
  sub_10002E038(v4, (uint64_t)(v12 - (void)v4) / 16, v6);
  return 1;
}

void sub_1000190C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, SEL *a7)
{
  NSString v10 = sub_1000411E0();
  NSString v11 = sub_1000411E0();
  objc_msgSend(a6, *a7, v10, v11, a5);
}

uint64_t sub_100019154(uint64_t a1, uint64_t *a2)
{
  sub_100007A58(a2);
  sub_1000192D0();
  sub_100019374();
  v3();
  return a1;
}

uint64_t sub_1000191A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_10001685C(a1, a2, a3, a4, v4);
}

uint64_t sub_1000191AC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  sub_100007A58(a3);
  sub_1000192D0();
  (*(void (**)(uint64_t, uint64_t))(v5 + 16))(a2, a1);
  return a2;
}

uint64_t sub_100019208(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_100019264(uint64_t a1)
{
  return a1;
}

uint64_t sub_1000192B8(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

void sub_100019318()
{
  *(void *)(v1 - 272) = v0 + 56;
}

uint64_t sub_100019334()
{
  long long v2 = *(_OWORD *)(v0 - 128);
  *(_OWORD *)(v0 - 192) = *(_OWORD *)(v0 - 144);
  *(_OWORD *)(v0 - 176) = v2;
  *(void *)(v0 - 160) = *(void *)(v0 - 112);
  return sub_100019208(v0 - 192, v0 - 232);
}

uint64_t sub_100019380()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_1000193AC(uint64_t a1)
{
  *(void *)(v1 - 96) = a1;
  return v1 - 96;
}

uint64_t sub_1000193C0()
{
  uint64_t v4 = *(void *)(v0 + 48) + 40 * v1;
  return sub_100019208(v4, v2 - 144);
}

id sub_1000193E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (uint64_t)v3 + OBJC_IVAR____TtC22localspeechrecognition32EARModelContextDelegateInterface_asrId;
  uint64_t v8 = sub_100040F20();
  sub_10000A374(v7, 1, 1, v8);
  swift_beginAccess();
  uint64_t v9 = v3;
  sub_100019A88(a1, v7);
  swift_endAccess();
  NSString v10 = &v9[OBJC_IVAR____TtC22localspeechrecognition32EARModelContextDelegateInterface_taskName];
  *(void *)NSString v10 = a2;
  *((void *)v10 + 1) = a3;
  *(void *)&v9[OBJC_IVAR____TtC22localspeechrecognition32EARModelContextDelegateInterface_pendingANECompilationContextEvents] = _swiftEmptyArrayStorage;

  v13.receiver = v9;
  v13.Class super_class = (Class)type metadata accessor for EARModelContextDelegateInterface();
  id v11 = objc_msgSendSuper2(&v13, "init");
  sub_100007B2C(a1);
  return v11;
}

uint64_t sub_1000194CC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (void *)(v2 + OBJC_IVAR____TtC22localspeechrecognition32EARModelContextDelegateInterface_taskName);
  *uint64_t v3 = a1;
  v3[1] = a2;
  return swift_bridgeObjectRelease();
}

uint64_t sub_1000194E8(uint64_t a1)
{
  uint64_t v3 = (void *)(v1
                + OBJC_IVAR____TtC22localspeechrecognition32EARModelContextDelegateInterface_pendingANECompilationContextEvents);
  swift_beginAccess();
  *uint64_t v3 = a1;
  return swift_bridgeObjectRelease();
}

void sub_10001953C(uint64_t a1, uint64_t a2)
{
}

void sub_100019580(uint64_t a1, uint64_t a2)
{
}

void sub_1000195AC(uint64_t a1, uint64_t a2, void (*a3)(unsigned char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t), uint64_t (*a4)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v9 = sub_100007A58((uint64_t *)&unk_100063F60);
  uint64_t v10 = __chkstk_darwin(v9 - 8);
  unint64_t v12 = &v26[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v10);
  BOOL v14 = &v26[-v13];
  uint64_t v15 = v4 + OBJC_IVAR____TtC22localspeechrecognition32EARModelContextDelegateInterface_asrId;
  swift_beginAccess();
  sub_100007A9C(v15, (uint64_t)v14);
  uint64_t v16 = sub_100040F20();
  int v17 = sub_100007B04((uint64_t)v14, 1, v16);
  sub_100007B2C((uint64_t)v14);
  if (v17 == 1)
  {
    if (qword_1000621B0 != -1) {
      swift_once();
    }
    uint64_t v18 = mach_continuous_time();
    uint64_t v19 = a4(v18, a1, a2);
    if (v19)
    {
      Swift::Int v20 = (void *)v19;
      BOOL v21 = (void *)(v4
                     + OBJC_IVAR____TtC22localspeechrecognition32EARModelContextDelegateInterface_pendingANECompilationContextEvents);
      swift_beginAccess();
      id v22 = v20;
      sub_100041250();
      sub_100019A5C(*(void *)((*v21 & 0xFFFFFFFFFFFFFF8) + 0x10));
      sub_1000412C0();
      sub_100041290();
      swift_endAccess();
    }
  }
  else
  {
    if (qword_1000621B0 != -1) {
      swift_once();
    }
    sub_100007A9C(v15, (uint64_t)v12);
    uint64_t v23 = *(void *)(v4 + OBJC_IVAR____TtC22localspeechrecognition32EARModelContextDelegateInterface_taskName);
    uint64_t v24 = *(void *)(v4 + OBJC_IVAR____TtC22localspeechrecognition32EARModelContextDelegateInterface_taskName + 8);
    swift_bridgeObjectRetain();
    uint64_t v25 = mach_continuous_time();
    a3(v12, v23, v24, v25, a1, a2);
    swift_bridgeObjectRelease();
    sub_100007B2C((uint64_t)v12);
  }
}

uint64_t sub_10001981C(void *a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t, uint64_t))
{
  uint64_t v6 = sub_1000411F0();
  uint64_t v8 = v7;
  id v9 = a1;
  a4(v6, v8);

  return swift_bridgeObjectRelease();
}

void sub_100019888()
{
}

id sub_1000198C8()
{
  v2.receiver = v0;
  v2.Class super_class = (Class)type metadata accessor for EARModelContextDelegateInterface();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_100019960()
{
  return type metadata accessor for EARModelContextDelegateInterface();
}

uint64_t type metadata accessor for EARModelContextDelegateInterface()
{
  uint64_t result = qword_100063F48;
  if (!qword_100063F48) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_1000199B0()
{
  sub_1000107B0();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

uint64_t sub_100019A5C(uint64_t result)
{
  if (result + 1 > *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
    return sub_1000412A0();
  }
  return result;
}

uint64_t sub_100019A88(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100007A58((uint64_t *)&unk_100063F60);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a2, a1, v4);
  return a2;
}

uint64_t sub_100019AF0@<X0>(uint64_t a1@<X2>, uint64_t a2@<X5>, int a3@<W6>, uint64_t a4@<X8>)
{
  uint64_t v27 = a4;
  int v28 = a3;
  uint64_t v29 = a1;
  uint64_t v26 = sub_100040DF0();
  uint64_t v5 = *(void *)(v26 - 8);
  __chkstk_darwin(v26);
  uint64_t v7 = (char *)&v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100007A58(&qword_1000641E0);
  uint64_t v9 = __chkstk_darwin(v8 - 8);
  uint64_t v11 = (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v13 = (char *)&v25 - v12;
  NSString v14 = sub_1000411E0();
  NSString v15 = sub_1000411E0();
  sub_100019FF4(a2, (uint64_t)v13);
  uint64_t v16 = sub_100040E80();
  uint64_t v18 = 0;
  if (sub_100007B04((uint64_t)v13, 1, v16) != 1)
  {
    sub_100040E10(v17);
    uint64_t v18 = v19;
    (*(void (**)(char *, uint64_t))(*(void *)(v16 - 8) + 8))(v13, v16);
  }
  Swift::Int v20 = self;
  id v30 = 0;
  id v21 = [v20 modelRootWithLanguage:v14 assetType:v29 clientID:v15 modelOverrideURL:v18 isSpelling:v28 & 1 error:&v30];

  id v22 = v30;
  if (v21)
  {
    sub_1000411F0();

    (*(void (**)(char *, void, uint64_t))(v5 + 104))(v7, enum case for URL.DirectoryHint.isDirectory(_:), v26);
    sub_10000A374((uint64_t)v11, 1, 1, v16);
    return sub_100040E60();
  }
  else
  {
    uint64_t v24 = v22;
    sub_100040DE0();

    return swift_willThrow();
  }
}

void *sub_100019DD0(void *result)
{
  if (result)
  {
    uint64_t v1 = result;
    type metadata accessor for LSRError(0);
    sub_100019F14((unint64_t *)&qword_100062CD0, type metadata accessor for LSRError);
    sub_100040D80();
    if ((unint64_t)(v2 - 101) >= 2 && (unint64_t)(v2 - 2) > 1)
    {

      return 0;
    }
    else
    {
      type metadata accessor for SFSpeechError(0);
      sub_1000413B0();
      sub_100040DA0();
      sub_100019F14(&qword_100062C98, type metadata accessor for SFSpeechError);
      sub_100040DC0();

      return v1;
    }
  }
  return result;
}

uint64_t sub_100019F14(unint64_t *a1, void (*a2)(uint64_t))
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

id sub_100019F5C()
{
  sub_100019FB4();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id result = [self bundleForClass:ObjCClassFromMetadata];
  qword_100064878 = (uint64_t)result;
  return result;
}

unint64_t sub_100019FB4()
{
  unint64_t result = qword_100063F70;
  if (!qword_100063F70)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100063F70);
  }
  return result;
}

uint64_t sub_100019FF4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100007A58(&qword_1000641E0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

double sub_10001A05C@<D0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  if (*(void *)(a1 + 16))
  {
    sub_100029B40(a1 + 32, (uint64_t)a2);
  }
  else
  {
    double result = 0.0;
    *a2 = 0u;
    a2[1] = 0u;
  }
  return result;
}

uint64_t sub_10001A07C(uint64_t a1)
{
  uint64_t result = sub_100029D50(a1);
  if (v4) {
    goto LABEL_7;
  }
  if (*(_DWORD *)(a1 + 36) != v3)
  {
    __break(1u);
LABEL_7:
    __break(1u);
    return result;
  }
  if (result == 1 << *(unsigned char *)(a1 + 32)) {
    return 0;
  }
  else {
    return sub_100029CD0(result, v3, 0, a1);
  }
}

uint64_t sub_10001A0E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a1 + 24))
  {
    sub_100029B30((_OWORD *)a1, v6);
    sub_10002615C(v6, a2, a3);
    return swift_bridgeObjectRelease();
  }
  else
  {
    sub_100008834(a1, &qword_100064170);
    sub_100025D18(a2, a3, v6);
    swift_bridgeObjectRelease();
    return sub_100008834((uint64_t)v6, &qword_100064170);
  }
}

uint64_t sub_10001A178(uint64_t a1)
{
  uint64_t v9 = sub_100041340();
  uint64_t v3 = *(void *)(a1 + 16);
  if (v3)
  {
    char v4 = (Swift::Int *)(a1 + 40);
    do
    {
      Swift::Int v5 = *(v4 - 1);
      Swift::Int v6 = *v4;
      swift_bridgeObjectRetain();
      sub_1000274C0(&v8, v5, v6);
      swift_bridgeObjectRelease();
      v4 += 2;
      --v3;
    }
    while (v3);
    swift_bridgeObjectRelease();
    return v9;
  }
  else
  {
    sub_10002A5F4();
  }
  return v1;
}

uint64_t sub_10001A224(unint64_t a1)
{
  unint64_t v2 = a1 >> 62;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    sub_1000416B0();
    swift_bridgeObjectRelease();
  }
  sub_10000CD4C(0, &qword_100063260);
  sub_100029DD0(&qword_1000641B8, &qword_100063260);
  uint64_t result = sub_100041340();
  uint64_t v4 = result;
  uint64_t v9 = result;
  if (!v2)
  {
    uint64_t v5 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v5) {
      goto LABEL_5;
    }
LABEL_13:
    swift_bridgeObjectRelease();
    return v4;
  }
  swift_bridgeObjectRetain();
  uint64_t v5 = sub_1000416B0();
  uint64_t result = swift_bridgeObjectRelease();
  if (!v5) {
    goto LABEL_13;
  }
LABEL_5:
  if (v5 >= 1)
  {
    for (uint64_t i = 0; i != v5; ++i)
    {
      if ((a1 & 0xC000000000000001) != 0) {
        id v7 = (id)sub_100041590();
      }
      else {
        id v7 = *(id *)(a1 + 8 * i + 32);
      }
      sub_100027670(&v8, v7);
    }
    swift_bridgeObjectRelease();
    return v9;
  }
  __break(1u);
  return result;
}

id sub_10001A390()
{
  sub_10002A7B4();
  id v1 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  sub_10002A3A4();
  sub_1000411E0();
  sub_10002A47C();
  id v2 = [v1 initWithConfig:v0];

  return v2;
}

void sub_10001A3F4(uint64_t a1, uint64_t a2)
{
  if (a2) {
    sub_100040DD0();
  }
  uint64_t v2 = sub_10002A494();
  id v5 = v3;
  v4(v2);
}

uint64_t sub_10001A460(uint64_t a1)
{
  id v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

void sub_10001A4A4(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    sub_100007A58((uint64_t *)&unk_100064198);
    uint64_t v2 = (void *)sub_1000416F0();
  }
  else
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
  }
  uint64_t v34 = a1 + 64;
  uint64_t v3 = -1 << *(unsigned char *)(a1 + 32);
  if (-v3 < 64) {
    uint64_t v4 = ~(-1 << -(char)v3);
  }
  else {
    uint64_t v4 = -1;
  }
  unint64_t v5 = v4 & *(void *)(a1 + 64);
  int64_t v33 = (unint64_t)(63 - v3) >> 6;
  Swift::Int v6 = v2 + 8;
  swift_bridgeObjectRetain();
  swift_retain();
  int64_t v7 = 0;
  if (!v5) {
    goto LABEL_9;
  }
LABEL_8:
  unint64_t v8 = __clz(__rbit64(v5));
  v5 &= v5 - 1;
  unint64_t v9 = v8 | (v7 << 6);
  while (1)
  {
    uint64_t v18 = (void *)(*(void *)(a1 + 48) + 16 * v9);
    uint64_t v19 = v18[1];
    *(void *)&v42[0] = *v18;
    *((void *)&v42[0] + 1) = v19;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    swift_dynamicCast();
    long long v38 = v35;
    long long v39 = v36;
    uint64_t v40 = v37;
    Swift::Int v20 = (_OWORD *)sub_10002A5A4();
    sub_100029B30(v20, v21);
    long long v35 = v38;
    long long v36 = v39;
    uint64_t v37 = v40;
    sub_100029B30(&v41, v42);
    sub_100029B30(v42, &v38);
    sub_1000414E0(v2[5]);
    sub_10002A744();
    if (((v24 << v23) & ~v6[v22]) == 0)
    {
      sub_10002A408();
      while (++v26 != v27 || (v25 & 1) == 0)
      {
        BOOL v28 = v26 == v27;
        if (v26 == v27) {
          uint64_t v26 = 0;
        }
        v25 |= v28;
        if (v6[v26] != -1)
        {
          sub_10002A3F4();
          goto LABEL_38;
        }
      }
      __break(1u);
LABEL_42:
      __break(1u);
      goto LABEL_43;
    }
    sub_10002A41C();
LABEL_38:
    sub_10002A3E0();
    *(void *)((char *)v6 + v29) |= v30;
    uint64_t v32 = v2[6] + 40 * v31;
    *(_OWORD *)uint64_t v32 = v35;
    *(_OWORD *)(v32 + 16) = v36;
    *(void *)(v32 + 32) = v37;
    sub_100029B30(&v38, (_OWORD *)(v2[7] + 32 * v31));
    ++v2[2];
    if (v5) {
      goto LABEL_8;
    }
LABEL_9:
    int64_t v10 = v7 + 1;
    if (__OFADD__(v7, 1)) {
      goto LABEL_42;
    }
    if (v10 >= v33) {
      goto LABEL_40;
    }
    unint64_t v11 = *(void *)(v34 + 8 * v10);
    int64_t v12 = v7 + 1;
    if (!v11)
    {
      sub_10002A6EC();
      if (v13 == v14) {
        goto LABEL_40;
      }
      sub_10002A6E0();
      if (!v11)
      {
        sub_10002A6EC();
        if (v13 == v14) {
          goto LABEL_40;
        }
        sub_10002A6E0();
        if (!v11)
        {
          sub_10002A6EC();
          if (v13 == v14) {
            goto LABEL_40;
          }
          sub_10002A6E0();
          if (!v11) {
            break;
          }
        }
      }
    }
LABEL_28:
    unint64_t v5 = (v11 - 1) & v11;
    unint64_t v9 = __clz(__rbit64(v11)) + (v12 << 6);
    int64_t v7 = v12;
  }
  int64_t v16 = v15 + 4;
  if (v16 >= v33)
  {
LABEL_40:
    swift_release();
    sub_100010520();
    return;
  }
  unint64_t v11 = *(void *)(v34 + 8 * v16);
  if (v11)
  {
    int64_t v12 = v16;
    goto LABEL_28;
  }
  while (!__OFADD__(v16, 1))
  {
    sub_10002A6EC();
    if (v13 == v14) {
      goto LABEL_40;
    }
    sub_10002A6E0();
    int64_t v16 = v17 + 1;
    if (v11) {
      goto LABEL_28;
    }
  }
LABEL_43:
  __break(1u);
}

uint64_t sub_10001A7FC(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    sub_100007A58((uint64_t *)&unk_100064198);
    uint64_t v2 = (void *)sub_1000416F0();
  }
  else
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
  }
  uint64_t v28 = a1 + 64;
  uint64_t v3 = -1 << *(unsigned char *)(a1 + 32);
  if (-v3 < 64) {
    uint64_t v4 = ~(-1 << -(char)v3);
  }
  else {
    uint64_t v4 = -1;
  }
  unint64_t v5 = v4 & *(void *)(a1 + 64);
  int64_t v27 = (unint64_t)(63 - v3) >> 6;
  Swift::Int v6 = (char *)(v2 + 8);
  swift_bridgeObjectRetain();
  uint64_t result = swift_retain();
  int64_t v8 = 0;
  if (!v5) {
    goto LABEL_9;
  }
LABEL_8:
  unint64_t v9 = __clz(__rbit64(v5));
  v5 &= v5 - 1;
  unint64_t v10 = v9 | (v8 << 6);
  while (1)
  {
    uint64_t v15 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v10);
    uint64_t v17 = *v15;
    uint64_t v16 = v15[1];
    sub_100029B40(*(void *)(a1 + 56) + 32 * v10, (uint64_t)v40);
    *(void *)&long long v39 = v17;
    *((void *)&v39 + 1) = v16;
    v37[2] = v39;
    v38[0] = v40[0];
    v38[1] = v40[1];
    *(void *)&v37[0] = v17;
    *((void *)&v37[0] + 1) = v16;
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    sub_100029B30(v38, v32);
    long long v33 = v29;
    long long v34 = v30;
    uint64_t v35 = v31;
    sub_100029B30(v32, v36);
    long long v29 = v33;
    long long v30 = v34;
    uint64_t v31 = v35;
    sub_100029B30(v36, v37);
    sub_100029B30(v37, &v33);
    uint64_t result = sub_1000414E0(v2[5]);
    uint64_t v18 = -1 << *((unsigned char *)v2 + 32);
    unint64_t v19 = result & ~v18;
    unint64_t v20 = v19 >> 6;
    if (((-1 << v19) & ~*(void *)&v6[8 * (v19 >> 6)]) == 0)
    {
      char v22 = 0;
      unint64_t v23 = (unint64_t)(63 - v18) >> 6;
      while (++v20 != v23 || (v22 & 1) == 0)
      {
        BOOL v24 = v20 == v23;
        if (v20 == v23) {
          unint64_t v20 = 0;
        }
        v22 |= v24;
        uint64_t v25 = *(void *)&v6[8 * v20];
        if (v25 != -1)
        {
          unint64_t v21 = __clz(__rbit64(~v25)) + (v20 << 6);
          goto LABEL_34;
        }
      }
      __break(1u);
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    unint64_t v21 = __clz(__rbit64((-1 << v19) & ~*(void *)&v6[8 * (v19 >> 6)])) | v19 & 0x7FFFFFFFFFFFFFC0;
LABEL_34:
    *(void *)&v6[(v21 >> 3) & 0x1FFFFFFFFFFFFFF8] |= 1 << v21;
    uint64_t v26 = v2[6] + 40 * v21;
    *(_OWORD *)uint64_t v26 = v29;
    *(_OWORD *)(v26 + 16) = v30;
    *(void *)(v26 + 32) = v31;
    uint64_t result = (uint64_t)sub_100029B30(&v33, (_OWORD *)(v2[7] + 32 * v21));
    ++v2[2];
    if (v5) {
      goto LABEL_8;
    }
LABEL_9:
    int64_t v11 = v8 + 1;
    if (__OFADD__(v8, 1)) {
      goto LABEL_38;
    }
    if (v11 >= v27) {
      goto LABEL_36;
    }
    unint64_t v12 = *(void *)(v28 + 8 * v11);
    int64_t v13 = v8 + 1;
    if (!v12)
    {
      int64_t v13 = v8 + 2;
      if (v8 + 2 >= v27) {
        goto LABEL_36;
      }
      unint64_t v12 = *(void *)(v28 + 8 * v13);
      if (!v12)
      {
        int64_t v13 = v8 + 3;
        if (v8 + 3 >= v27) {
          goto LABEL_36;
        }
        unint64_t v12 = *(void *)(v28 + 8 * v13);
        if (!v12)
        {
          int64_t v13 = v8 + 4;
          if (v8 + 4 >= v27) {
            goto LABEL_36;
          }
          unint64_t v12 = *(void *)(v28 + 8 * v13);
          if (!v12) {
            break;
          }
        }
      }
    }
LABEL_24:
    unint64_t v5 = (v12 - 1) & v12;
    unint64_t v10 = __clz(__rbit64(v12)) + (v13 << 6);
    int64_t v8 = v13;
  }
  int64_t v14 = v8 + 5;
  if (v8 + 5 >= v27)
  {
LABEL_36:
    swift_release();
    sub_100010520();
    return (uint64_t)v2;
  }
  unint64_t v12 = *(void *)(v28 + 8 * v14);
  if (v12)
  {
    int64_t v13 = v8 + 5;
    goto LABEL_24;
  }
  while (1)
  {
    int64_t v13 = v14 + 1;
    if (__OFADD__(v14, 1)) {
      break;
    }
    if (v13 >= v27) {
      goto LABEL_36;
    }
    unint64_t v12 = *(void *)(v28 + 8 * v13);
    ++v14;
    if (v12) {
      goto LABEL_24;
    }
  }
LABEL_39:
  __break(1u);
  return result;
}

uint64_t sub_10001ABC0(uint64_t a1)
{
  return sub_10002A4E8(a1, OBJC_IVAR____TtC22localspeechrecognition19EARSpeechRecognizer_resultStream);
}

uint64_t sub_10001ABCC(uint64_t a1)
{
  return sub_10002A4E8(a1, OBJC_IVAR____TtC22localspeechrecognition19EARSpeechRecognizer_clientInfo);
}

uint64_t sub_10001ABD8()
{
  sub_10002A650();
  v1[141] = v0;
  v1[140] = v2;
  v1[139] = v3;
  v1[138] = v4;
  v1[137] = v5;
  v1[136] = v6;
  v1[142] = swift_getObjectType();
  uint64_t v7 = sub_1000411D0();
  sub_1000082F8(v7);
  v1[143] = swift_task_alloc();
  uint64_t v8 = sub_100007A58(&qword_1000641B0);
  sub_1000082F8(v8);
  v1[144] = swift_task_alloc();
  uint64_t v9 = sub_100041310();
  v1[145] = v9;
  sub_10002A220(v9);
  v1[146] = v10;
  v1[147] = sub_10002A30C();
  v1[148] = swift_task_alloc();
  uint64_t v11 = sub_100040E80();
  v1[149] = v11;
  sub_10002A220(v11);
  v1[150] = v12;
  v1[151] = sub_10002A30C();
  v1[152] = swift_task_alloc();
  uint64_t v13 = sub_100007A58(&qword_1000641E0);
  sub_1000082F8(v13);
  v1[153] = sub_10002A30C();
  v1[154] = swift_task_alloc();
  uint64_t v14 = sub_100040FF0();
  sub_1000082F8(v14);
  v1[155] = sub_10002A30C();
  v1[156] = swift_task_alloc();
  uint64_t v15 = sub_100007A58((uint64_t *)&unk_100063F60);
  sub_10002A220(v15);
  v1[157] = v16;
  v1[158] = *(void *)(v17 + 64);
  v1[159] = sub_10002A30C();
  v1[160] = swift_task_alloc();
  v1[161] = swift_task_alloc();
  v1[162] = swift_task_alloc();
  uint64_t v18 = sub_100041100();
  v1[163] = v18;
  sub_10002A220(v18);
  v1[164] = v19;
  v1[165] = swift_task_alloc();
  return _swift_task_switch(sub_10001AE14, 0, 0);
}

void sub_10001AE14()
{
  id v1 = *(char **)(v0 + 1128);
  uint64_t v2 = OBJC_IVAR____TtC22localspeechrecognition19EARSpeechRecognizer_transaction;
  *(void *)(v0 + 1328) = OBJC_IVAR____TtC22localspeechrecognition19EARSpeechRecognizer_transaction;
  *(void *)&v1[v2] = 0;
  uint64_t v3 = OBJC_IVAR____TtC22localspeechrecognition19EARSpeechRecognizer_resultStream;
  *(void *)(v0 + 1336) = OBJC_IVAR____TtC22localspeechrecognition19EARSpeechRecognizer_resultStream;
  *(void *)&v1[v3] = 0;
  uint64_t v4 = OBJC_IVAR____TtC22localspeechrecognition19EARSpeechRecognizer_audioBufferListeners;
  *(void *)(v0 + 1344) = OBJC_IVAR____TtC22localspeechrecognition19EARSpeechRecognizer_audioBufferListeners;
  sub_10000CD4C(0, (unint64_t *)&qword_100063E40);
  type metadata accessor for EARSpeechRecognitionAudioBuffer();
  sub_100029DD0((unint64_t *)&qword_100063240, (unint64_t *)&qword_100063E40);
  uint64_t v5 = v1;
  *(void *)&v1[v4] = sub_100041140();
  uint64_t v6 = OBJC_IVAR____TtC22localspeechrecognition19EARSpeechRecognizer_audioBufferListenerLock;
  *(void *)(v0 + 1352) = OBJC_IVAR____TtC22localspeechrecognition19EARSpeechRecognizer_audioBufferListenerLock;
  sub_100007A58(&qword_100063E50);
  uint64_t v7 = swift_allocObject();
  *(_DWORD *)(v7 + 16) = 0;
  *(void *)&v5[v6] = v7;
  uint64_t v8 = OBJC_IVAR____TtC22localspeechrecognition19EARSpeechRecognizer_userSpeechProfiles;
  *(void *)(v0 + 1360) = OBJC_IVAR____TtC22localspeechrecognition19EARSpeechRecognizer_userSpeechProfiles;
  *(void *)&v5[v8] = [objc_allocWithZone((Class)NSMutableDictionary) init];
  uint64_t v9 = OBJC_IVAR____TtC22localspeechrecognition19EARSpeechRecognizer_speechProfileLastModifiedDate;
  *(void *)(v0 + 1368) = OBJC_IVAR____TtC22localspeechrecognition19EARSpeechRecognizer_speechProfileLastModifiedDate;
  uint64_t v10 = (uint64_t)&v5[v9];
  uint64_t v11 = sub_100040EE0();
  *(void *)(v0 + 1376) = v11;
  sub_10000A374(v10, 1, 1, v11);
  *(void *)&v1[v2] = os_transaction_create();
  swift_unknownObjectRelease();
  if (qword_1000621C0 != -1) {
    swift_once();
  }
  uint64_t v12 = sub_1000410D0();
  *(void *)(v0 + 1384) = sub_100007B8C(v12, (uint64_t)qword_100064690);
  uint64_t v13 = sub_1000410C0();
  os_log_type_t v14 = sub_100041370();
  if (os_log_type_enabled(v13, v14))
  {
    uint64_t v15 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v15 = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, v14, "LSR will remain active for the lifetime of this recognizer.", v15, 2u);
    sub_10000A754();
  }
  uint64_t v16 = *(void *)(v0 + 1320);
  uint64_t v17 = *(void *)(v0 + 1312);
  uint64_t v18 = *(void *)(v0 + 1304);
  uint64_t v19 = *(void *)(v0 + 1128);
  unint64_t v20 = *(void **)(v0 + 1096);
  uint64_t v21 = *(void **)(v0 + 1088);

  uint64_t v22 = OBJC_IVAR____TtC22localspeechrecognition19EARSpeechRecognizer_supportedFeatures;
  *(void *)(v0 + 1392) = OBJC_IVAR____TtC22localspeechrecognition19EARSpeechRecognizer_supportedFeatures;
  *(void *)(v19 + v22) = v21;
  uint64_t v23 = OBJC_IVAR____TtC22localspeechrecognition19EARSpeechRecognizer_clientInfo;
  *(void *)(v0 + 1400) = OBJC_IVAR____TtC22localspeechrecognition19EARSpeechRecognizer_clientInfo;
  *(void *)(v19 + v23) = v20;
  BOOL v24 = self;
  *(void *)(v0 + 1408) = v24;
  id v25 = v21;
  id v26 = v20;
  id v27 = [v24 processInfo];
  [v27 systemUptime];
  *(void *)(v0 + 1416) = v28;

  id v29 = [v25 modelOptions];
  *(void *)(v0 + 1424) = v29;
  id v30 = [v26 clientID];
  uint64_t v268 = sub_1000411F0();
  uint64_t v32 = v31;

  id v33 = [v25 taskNames];
  uint64_t v34 = sub_100041330();

  (*(void (**)(uint64_t, void, uint64_t))(v17 + 104))(v16, enum case for TaskHint.voicemail(_:), v18);
  uint64_t v35 = (void *)sub_1000410F0();
  sub_10002A6C8();
  v36();
  if (!v35[2])
  {
    id v45 = (id)swift_bridgeObjectRelease();
    __break(1u);
    goto LABEL_108;
  }
  uint64_t v37 = *(void **)(v0 + 1088);
  uint64_t v38 = v35[4];
  uint64_t v39 = v35[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  char v265 = sub_10001DABC(v38, v39, v34);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  id v40 = [v37 taskNames];
  uint64_t v41 = sub_100041330();

  uint64_t v42 = sub_10001A07C(v41);
  uint64_t v44 = v43;
  id v45 = (id)swift_bridgeObjectRelease();
  if (!v44)
  {
LABEL_108:
    __break(1u);
LABEL_109:
    __break(1u);
    _swift_asyncLet_finish(v45, v46, v47, v48);
    return;
  }
  uint64_t v49 = *(void **)(v0 + 1096);

  id v50 = [v49 asrID];
  if (v50)
  {
    uint64_t v51 = v50;
    sub_100040F10();

    uint64_t v52 = 0;
  }
  else
  {
    uint64_t v52 = 1;
  }
  uint64_t v53 = *(void *)(v0 + 1288);
  uint64_t v54 = sub_100040F20();
  sub_10000A374(v53, v52, 1, v54);
  uint64_t v55 = sub_10002A3A4();
  sub_10002A1B4(v55, v56, v57);
  id v45 = [self sharedInstance];
  *(void *)(v0 + 1432) = v45;
  v267 = v45;
  if (!v45) {
    goto LABEL_109;
  }
  id v58 = [*(id *)(v0 + 1088) locale];
  sub_100040F60();

  if (v29)
  {
    id v59 = [v29 modelOverrideURL];
    if (v59)
    {
      uint64_t v60 = v59;
      sub_100040E30();

      uint64_t v61 = 0;
    }
    else
    {
      uint64_t v61 = 1;
    }
    sub_10000A374(*(void *)(v0 + 1224), v61, 1, *(void *)(v0 + 1192));
    uint64_t v62 = sub_10002A494();
    sub_10002A1B4(v62, v63, v64);
  }
  else
  {
    sub_10000A374(*(void *)(v0 + 1232), 1, 1, *(void *)(v0 + 1192));
  }
  BOOL v66 = v42 == sub_1000411F0() && v44 == v65;
  v266 = v29;
  if (!v66) {
    sub_100041720();
  }
  uint64_t v67 = *(void *)(v0 + 1232);
  swift_bridgeObjectRelease();
  id v68 = objc_allocWithZone((Class)type metadata accessor for LSRAssets());
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v69 = sub_10002A5CC();
  uint64_t v72 = sub_10001527C(v69, v70, v44, v268, v32, v67, v71);
  uint64_t v73 = (uint64_t)v32;
  *(void *)(v0 + 1440) = v72;
  *(void *)(v0 + 1448) = 0;
  unint64_t v74 = (void *)v72;
  uint64_t v256 = v73;
  uint64_t v263 = v44;
  uint64_t v264 = v42;
  uint64_t v75 = *(void *)(v0 + 1200);
  uint64_t v258 = *(void *)(v0 + 1128);
  uint64_t v76 = sub_10002A7CC();
  v77(v76);
  uint64_t v78 = self;
  unint64_t v79 = v74;
  sub_100040E00();
  Class isa = sub_100041260().super.isa;
  swift_bridgeObjectRelease();
  id v81 = [v78 pathWithComponents:isa];

  uint64_t v82 = sub_1000411F0();
  uint64_t v260 = v83;
  uint64_t v261 = v82;

  *(void *)(v0 + 1456) = *(void *)(v75 + 8);
  *(void *)(v0 + 1464) = (v75 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  sub_10002A6C8();
  v84();
  uint64_t v85 = sub_10002A7CC();
  v86(v85);
  sub_100040E00();
  sub_100041260();
  sub_10002A79C();
  id v87 = [v78 pathWithComponents:v78];

  sub_1000411F0();
  *(void *)((char *)OBJC_IVAR____TtC22localspeechrecognition19EARSpeechRecognizer_assets + v258) = v79;
  uint64_t v88 = *(void *)&v79[OBJC_IVAR____TtC22localspeechrecognition9LSRAssets_language];
  uint64_t v89 = *(void *)&v79[OBJC_IVAR____TtC22localspeechrecognition9LSRAssets_language + 8];
  uint64_t v90 = OBJC_IVAR____TtC22localspeechrecognition19EARSpeechRecognizer_languageStr;
  *(void *)(v0 + 1472) = OBJC_IVAR____TtC22localspeechrecognition19EARSpeechRecognizer_languageStr;
  v91 = (void *)(v258 + v90);
  void *v91 = v88;
  v91[1] = v89;
  BOOL v92 = *(void *)&v79[OBJC_IVAR____TtC22localspeechrecognition9LSRAssets_modelQualityType] == 20808
     && *(void *)&v79[OBJC_IVAR____TtC22localspeechrecognition9LSRAssets_modelQualityType + 8] == 0xE200000000000000;
  v259 = (uint64_t *)(v258 + v90);
  if (v92) {
    char v93 = 1;
  }
  else {
    char v93 = sub_100041720();
  }
  uint64_t v94 = *(void *)(v0 + 1296);
  uint64_t v95 = *(void *)(v0 + 1280);
  uint64_t v96 = *(void *)(v0 + 1264);
  uint64_t v97 = *(void *)(v0 + 1256);
  uint64_t v98 = *(void *)(v0 + 1136);
  Swift::Int v99 = *(void **)(v0 + 1104);
  *(unsigned char *)(*(void *)(v0 + 1128) + OBJC_IVAR____TtC22localspeechrecognition19EARSpeechRecognizer_isHighQualityAsset) = v93 & 1;
  sub_100029ED4(v94, v95, (uint64_t *)&unk_100063F60);
  unint64_t v100 = (*(unsigned __int8 *)(v97 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v97 + 80);
  unint64_t v101 = (v96 + v100 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v102 = swift_allocObject();
  *(void *)(v0 + 1480) = v102;
  *(void *)(v102 + 16) = v99;
  *(void *)(v102 + 24) = v79;
  sub_10002A1B4(v95, v102 + v100, (uint64_t *)&unk_100063F60);
  uint64_t v103 = (uint64_t *)(v102 + v101);
  *uint64_t v103 = v264;
  v103[1] = v263;
  *(void *)(v102 + ((v101 + 23) & 0xFFFFFFFFFFFFFFF8)) = v98;
  v104 = v79;
  swift_bridgeObjectRetain();
  uint64_t v105 = v104;
  swift_bridgeObjectRetain();
  id v106 = v99;
  swift_retain();
  sub_100029A1C(&qword_1000641F8);
  swift_asyncLet_begin();
  if (qword_1000621B0 != -1) {
    swift_once();
  }
  uint64_t v107 = *(void *)(v0 + 1120);
  uint64_t v108 = *(void **)(v0 + 1088);
  mach_continuous_time();
  sub_10002A3CC();
  sub_100008C30(v109, v110, v111, v112, v113, v114);
  id v115 = [self activeConfigurationForEverything];
  *(void *)(v0 + 1488) = v115;
  id v116 = [v108 taskNames];
  uint64_t v117 = sub_100041330();

  v255 = v115;
  sub_10002908C(v117, v115);
  uint64_t v118 = *(void *)(v107 + 16);
  uint64_t v119 = *(void *)(v0 + 1120);
  if (v118)
  {
    sub_1000255B4(0, v118, 0);
    uint64_t v120 = v119 + 40;
    do
    {
      sub_100041210();
      swift_bridgeObjectRetain();
      uint64_t v121 = sandbox_extension_consume();
      swift_release();
      swift_bridgeObjectRelease();
      unint64_t v123 = _swiftEmptyArrayStorage[2];
      unint64_t v122 = _swiftEmptyArrayStorage[3];
      if (v123 >= v122 >> 1) {
        sub_1000255B4(v122 > 1, v123 + 1, 1);
      }
      _swiftEmptyArrayStorage[2] = v123 + 1;
      _swiftEmptyArrayStorage[v123 + 4] = v121;
      v120 += 16;
      --v118;
    }
    while (v118);
  }
  swift_bridgeObjectRelease();
  *(void *)((char *)OBJC_IVAR____TtC22localspeechrecognition19EARSpeechRecognizer_sandboxExtensionHandles
            + *(void *)(v0 + 1128)) = _swiftEmptyArrayStorage;
  swift_bridgeObjectRetain();
  NSString v124 = sub_1000411E0();
  swift_bridgeObjectRelease();
  uint64_t v125 = *(void *)&v105[OBJC_IVAR____TtC22localspeechrecognition9LSRAssets_assetType];

  uint64_t v126 = sub_100029100((uint64_t)v124, v125, v268, v256, v267);
  uint64_t v128 = v127;

  if (v128)
  {
    swift_bridgeObjectRetain();
    v129 = sub_100024F38(0, 1, 1, (uint64_t)_swiftEmptyArrayStorage);
    unint64_t v131 = *((void *)v129 + 2);
    unint64_t v130 = *((void *)v129 + 3);
    if (v131 >= v130 >> 1) {
      v129 = sub_100024F38((char *)(v130 > 1), v131 + 1, 1, (uint64_t)v129);
    }
    *((void *)v129 + 2) = v131 + 1;
    v132 = v129;
    v133 = &v129[16 * v131];
    *((void *)v133 + 4) = v126;
    *((void *)v133 + 5) = v128;
    sub_10000CD4C(0, (unint64_t *)&unk_100063270);
    id v134 = sub_10001A390();
    id v135 = [v134 version];
    uint64_t v136 = sub_1000411F0();
    unint64_t v138 = v137;
  }
  else
  {
    uint64_t v136 = 0;
    v132 = (char *)_swiftEmptyArrayStorage;
    unint64_t v138 = 0xE000000000000000;
  }
  v139 = *(void **)(v0 + 1104);
  v140 = (uint64_t *)(*(void *)(v0 + 1128)
                   + OBJC_IVAR____TtC22localspeechrecognition19EARSpeechRecognizer_hammerModelVersion);
  uint64_t *v140 = v136;
  v140[1] = v138;
  uint64_t v141 = sub_10002958C(v139, (SEL *)&selRef_geoLMRegionID);
  if (!v142)
  {
    swift_bridgeObjectRelease();
    goto LABEL_48;
  }
  uint64_t v143 = v141;
  uint64_t v144 = v142;
  swift_bridgeObjectRetain();
  sub_10002A5A4();
  NSString v145 = sub_1000411E0();
  swift_bridgeObjectRelease();
  uint64_t v146 = sub_100029280((uint64_t)v145, v268, v256, v143, v144, v261, v260, v267);
  uint64_t v148 = v147;

  if (!v148)
  {
LABEL_48:
    char v152 = 0;
    goto LABEL_49;
  }
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    v132 = sub_100024F38(0, *((void *)v132 + 2) + 1, 1, (uint64_t)v132);
  }
  unint64_t v150 = *((void *)v132 + 2);
  unint64_t v149 = *((void *)v132 + 3);
  if (v150 >= v149 >> 1) {
    v132 = sub_100024F38((char *)(v149 > 1), v150 + 1, 1, (uint64_t)v132);
  }
  *((void *)v132 + 2) = v150 + 1;
  v151 = &v132[16 * v150];
  *((void *)v151 + 4) = v146;
  *((void *)v151 + 5) = v148;
  char v152 = 1;
LABEL_49:
  uint64_t v269 = (uint64_t)v132;
  *(void *)(v0 + 1496) = v132;
  uint64_t v153 = *(void *)(v0 + 1128);
  uint64_t v154 = sub_10002958C(*(void **)(v0 + 1104), (SEL *)&selRef_geoLMRegionID);
  v155 = (uint64_t *)(v153 + OBJC_IVAR____TtC22localspeechrecognition19EARSpeechRecognizer_geoLMRegionID);
  uint64_t *v155 = v154;
  v155[1] = v156;
  *(unsigned char *)(v153 + OBJC_IVAR____TtC22localspeechrecognition19EARSpeechRecognizer_geoLanguageModelLoaded) = v152;
  if (v266 && [v266 enableParallelLoading])
  {
    v157 = sub_1000410C0();
    os_log_type_t v158 = sub_100041360();
    if (os_log_type_enabled(v157, v158))
    {
      v159 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v159 = 0;
      _os_log_impl((void *)&_mh_execute_header, v157, v158, "ASR: enable parallel loading", v159, 2u);
      sub_10000A754();
    }

    swift_isUniquelyReferenced_nonNull_native();
    sub_10002A784();
    sub_10002A540(0xD000000000000015, v160, (uint64_t)"enableParallelLoading");
    sub_10002A758();
  }
  uint64_t v161 = *(void *)(v0 + 1112);
  if (v161 && [*(id *)(v0 + 1112) keepANEModelLoaded])
  {
    swift_isUniquelyReferenced_nonNull_native();
    sub_10002A784();
    sub_10002A540(0xD000000000000012, v162, (uint64_t)"keepANEModelLoaded");
    sub_10002A758();
  }
  id v163 = [*(id *)(v0 + 1096) source];
  uint64_t v164 = sub_1000411F0();
  unint64_t v166 = v165;

  swift_bridgeObjectRelease();
  uint64_t v167 = HIBYTE(v166) & 0xF;
  if ((v166 & 0x2000000000000000) == 0) {
    uint64_t v167 = v164 & 0xFFFFFFFFFFFFLL;
  }
  if (v167)
  {
    id v168 = [*(id *)(v0 + 1096) source];
    sub_1000411F0();

    swift_isUniquelyReferenced_nonNull_native();
    sub_10002A784();
    uint64_t v169 = sub_10002A7E0();
    sub_100026E7C(v169, v170, 0x5374616568657270, 0xED0000656372756FLL, v171);
    sub_10002A758();
  }
  if (v266)
  {
    id v172 = v266;
    sub_1000295E8(v172, (SEL *)&selRef_taskForMemoryLock);
    if (v173)
    {
      swift_isUniquelyReferenced_nonNull_native();
      sub_10002A784();
      uint64_t v174 = sub_10002A5A4();
      sub_100026E7C(v174, v175, 0xD000000000000011, v176, v177);
      sub_10002A758();
    }
    unsigned __int8 v178 = [v172 atypicalSpeech];
  }
  else
  {
    unsigned __int8 v178 = 0;
  }
  *(void *)(v0 + 1504) = &_swiftEmptyDictionarySingleton;
  v179 = *(void **)(v0 + 1088);
  *(unsigned char *)(*(void *)(v0 + 1128) + OBJC_IVAR____TtC22localspeechrecognition19EARSpeechRecognizer_atypicalSpeechEnabled) = v178;
  uint64_t v180 = swift_allocObject();
  *(void *)(v0 + 1512) = v180;
  *(void *)(v180 + 16) = 1;
  if (([v179 flags] & 0x80) != 0) {
    uint64_t v181 = sub_10001E188(v180);
  }
  else {
    uint64_t v181 = 0;
  }
  *(void *)(v0 + 1520) = v181;
  if (v265)
  {
    NSString v182 = sub_1000411E0();
    id v183 = VoicemailConfidenceSubtractionForLanguage(v182);

    if (v183)
    {
      sub_10000CD4C(0, &qword_100063260);
      uint64_t v184 = sub_100041130();
      swift_bridgeObjectRelease();
LABEL_79:

      v185 = sub_100028EAC(v184);
      swift_bridgeObjectRelease();
      goto LABEL_80;
    }
    uint64_t v186 = sub_10001E188(v180);
    swift_bridgeObjectRelease();
    if (v186)
    {
      v187.super.Class isa = sub_100041120().super.isa;
      swift_bridgeObjectRelease();
    }
    else
    {
      v187.super.Class isa = 0;
    }
    id v183 = EtiquetteConfidenceSubtraction(v187.super.isa);

    if (v183)
    {
      sub_10000CD4C(0, &qword_100063260);
      uint64_t v184 = sub_100041130();
      goto LABEL_79;
    }
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  v185 = 0;
LABEL_80:
  *(void *)(v0 + 1528) = v185;
  if (v161)
  {
    id v188 = *(id *)(v0 + 1112);
    unint64_t v189 = (unint64_t)[v188 priority];
    if ((v189 & 0x8000000000000000) != 0 || v189 > 0xFF)
    {
      sub_1000150E8();
      sub_100041690();
      sub_10002A298();
      return;
    }
    v190 = v259;
    uint64_t v191 = *(void *)(v0 + 1168);
    sub_1000412F0();
    sub_1000412F0();
    sub_10002A7E0();
    char v254 = sub_1000412E0();

    v192 = *(void (**)(void))(v191 + 8);
    sub_10002A5A4();
    sub_10002A6C8();
    v192();
    sub_10002A6C8();
    v192();
  }
  else
  {
    v190 = v259;
    char v254 = 0;
  }
  uint64_t v193 = *(void *)(v0 + 1272);
  uint64_t v194 = *(void *)(v0 + 1128);
  v195 = *(void **)(v0 + 1088);
  sub_100029ED4(*(void *)(v0 + 1296), v193, (uint64_t *)&unk_100063F60);
  id v196 = objc_allocWithZone((Class)type metadata accessor for EARModelContextDelegateInterface());
  swift_bridgeObjectRetain();
  id v197 = sub_1000193E0(v193, v264, v263);
  *(void *)((char *)OBJC_IVAR____TtC22localspeechrecognition19EARSpeechRecognizer_modelContextDelegateInterface + v194) = v197;
  mach_continuous_time();
  sub_10000650C();
  uint64_t v198 = v190[1];
  uint64_t v262 = *v190;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v255;
  swift_bridgeObjectRetain();
  HIBYTE(v257) = [v195 flags];
  id v199 = [v195 voiceCommandActiveSet];
  id v200 = v197;
  LODWORD(v195) = ([v195 flags] >> 5) & 1;
  id v201 = objc_allocWithZone((Class)_EARSpeechRecognizer);
  id v202 = sub_100024634(v261, v260, 0, v269, v262, v198, v255, (uint64_t)&_swiftEmptyDictionarySingleton, v257 & 0x100, v199, (uint64_t)v197, (char)v195);
  *(void *)(v0 + 1536) = 0;
  uint64_t v203 = *(void *)(v0 + 1128);
  v204 = *(void **)(v0 + 1088);
  uint64_t v205 = OBJC_IVAR____TtC22localspeechrecognition19EARSpeechRecognizer_recognizer;
  *(void *)(v0 + 1544) = OBJC_IVAR____TtC22localspeechrecognition19EARSpeechRecognizer_recognizer;
  *(void *)(v203 + v205) = v202;
  mach_continuous_time();
  sub_100006540();
  swift_bridgeObjectRelease();
  id v206 = *(id *)(v203 + v205);
  objc_msgSend(v206, "setAllowUtteranceDelay:", ((unint64_t)objc_msgSend(v204, "flags") >> 6) & 1);

  v207 = *(void **)(v203 + v205);
  if (v161)
  {
    id v208 = *(id *)(v0 + 1112);
    id v209 = v207;
    uint64_t v210 = sub_1000295E8(v208, (SEL *)&selRef_aneContext);
    sub_10002A510(v210, v211);
  }
  else
  {
    id v212 = v207;
    sub_10002A804();
  }
  sub_1000411E0();
  sub_10002A47C();
  [v207 setAneContext:v204];

  v213 = *(void **)(v203 + v205);
  if (v266) {
    id v214 = [v266 atypicalSpeech];
  }
  else {
    id v214 = 0;
  }
  v215 = *(void **)(v0 + 1088);
  [v213 setAtypicalSpeech:v214];
  id v216 = v213;
  objc_msgSend(v216, "setConcatenateUtterances:", objc_msgSend(v215, "concatenateUtterances"));

  v217 = *(void **)(v203 + v205);
  if (v161)
  {
    id v218 = *(id *)(v0 + 1112);
    id v219 = v217;
    uint64_t v220 = sub_1000295E8(v218, (SEL *)&selRef_cpuContext);
    sub_10002A510(v220, v221);
  }
  else
  {
    id v222 = v217;
  }
  v223 = *(void **)(v0 + 1088);
  NSString v224 = sub_1000411E0();
  swift_bridgeObjectRelease();
  [v217 setCpuContext:v224];

  id v225 = *(id *)(v203 + v205);
  objc_msgSend(v225, "setDetectUtterances:", objc_msgSend(v223, "isSingleUtteranceTask") ^ 1);

  id v226 = *(id *)(v203 + v205);
  [v225 setDisableAutoPunctuation:((unint64_t)sub_10002A634() & 2) == 0];

  id v227 = *(id *)(v203 + v205);
  [v225 setDisablePartialResults:((unint64_t)sub_10002A634() & 4) == 0];

  id v228 = *(id *)(v203 + v205);
  [v225 setEnableVoiceCommands:((unint64_t)sub_10002A634() >> 9) & 1];

  v229 = *(void **)(v203 + v205);
  id v230 = [v223 detectionOptions];
  if (v230)
  {
    v231 = v230;
    [v230 detectAfterTime];
    double v233 = v232;
  }
  else
  {
    double v233 = 0.0;
  }
  [v229 setEndpointStart:v233];
  v234 = *(void **)(v203 + v205);
  if (v266) {
    id v235 = [v266 farField];
  }
  else {
    id v235 = 0;
  }
  v236 = *(void **)(v0 + 1088);
  [v234 setFarField:v235];
  id v237 = v234;
  objc_msgSend(v237, "setFormatAcrossUtterances:", ((unint64_t)objc_msgSend(v236, "flags") >> 6) & 1);

  v238 = *(void **)(v203 + v205);
  if (v161)
  {
    id v239 = *(id *)(v0 + 1112);
    id v240 = v238;
    uint64_t v241 = sub_1000295E8(v239, (SEL *)&selRef_gpuContext);
    sub_10002A510(v241, v242);
  }
  else
  {
    id v243 = v238;
  }
  v244 = *(void **)(v0 + 1096);
  NSString v245 = sub_1000411E0();
  swift_bridgeObjectRelease();
  [v238 setGpuContext:v245];

  v246 = *(void **)(v203 + v205);
  [v246 setHighPriority:v254 & 1];
  id v247 = v246;
  uint64_t v248 = sub_10002958C(v244, (SEL *)&selRef_inputOrigin);
  sub_10002A510(v248, v249);
  NSString v250 = sub_1000411E0();
  swift_bridgeObjectRelease();
  [v247 setInputOrigin:v250];

  v251 = *(void **)(v203 + v205);
  *(void *)(v0 + 1552) = v251;
  id v252 = v251;
  sub_10002A298();
  _swift_asyncLet_get();
}

uint64_t sub_10001CAC4()
{
  return sub_10002A238((uint64_t)sub_10001CAD8);
}

uint64_t sub_10001CAD8()
{
  os_log_type_t v14 = *(void (**)(uint64_t))(v0 + 1456);
  id v1 = *(void **)(v0 + 1432);
  uint64_t v2 = *(void **)(v0 + 1424);
  uint64_t v3 = *(void *)(v0 + 1296);
  uint64_t v4 = *(void *)(v0 + 1208);
  uint64_t v5 = *(void *)(v0 + 1192);
  uint64_t v6 = *(void **)(v0 + 1112);
  uint64_t v7 = *(void **)(v0 + 1104);
  uint64_t v8 = *(char **)(v0 + 1096);
  uint64_t v9 = *(void **)(v0 + 1088);

  uint64_t v10 = sub_10002A5CC();
  v14(v10);
  sub_100008834(v3, (uint64_t *)&unk_100063F60);
  swift_release();
  sub_10002A430();

  swift_bridgeObjectRelease();
  swift_release();
  sub_10002A51C();
  if (v9)
  {

    sub_100008834((uint64_t)v7, &qword_1000641B0);
    uint64_t v11 = *(void **)(v3 + v4);
  }
  else
  {

    sub_100019380();
    swift_bridgeObjectRelease();

    objc_release(*(id *)((char *)OBJC_IVAR____TtC22localspeechrecognition19EARSpeechRecognizer_modelContextDelegateInterface
                       + v3));
    sub_100008834((uint64_t)v7, &qword_1000641B0);

    sub_100019380();
    swift_bridgeObjectRelease();
  }
  type metadata accessor for EARSpeechRecognizer();
  swift_deallocPartialClassInstance();
  sub_10000A364((uint64_t)&unk_1000641F0);
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
  sub_100015130();
  return v12();
}

uint64_t sub_10001CDEC()
{
  return sub_10002A238((uint64_t)sub_10001CE00);
}

uint64_t sub_10001CE00()
{
  if (*(void *)(v0 + 1000) >> 60 == 15)
  {
    Class isa = 0;
  }
  else
  {
    uint64_t v2 = sub_10002A3A4();
    sub_100029AD8(v2, v3);
    Class isa = sub_100040E90().super.isa;
    uint64_t v4 = sub_10002A3A4();
    sub_10000CB00(v4, v5);
  }
  uint64_t v6 = *(void **)(v0 + 1552);
  uint64_t v7 = *(void *)(v0 + 1544);
  uint64_t v8 = *(void *)(v0 + 1528);
  uint64_t v9 = *(void *)(v0 + 1128);
  uint64_t v10 = *(void **)(v0 + 1104);
  [v6 setJitProfileData:isa];

  id v11 = *(id *)(v9 + v7);
  sub_100029468(v10, (SEL *)&selRef_leftContext);
  sub_100041260();
  sub_10002A47C();
  [v11 setLeftContext:v10];

  uint64_t v12 = *(void **)(v9 + v7);
  id v13 = v12;
  if (v8)
  {
    uint64_t v14 = swift_bridgeObjectRetain();
    sub_100028C98(v14);
    sub_10002A47C();
    sub_10000CD4C(0, &qword_100063260);
    v15.super.Class isa = sub_100041120().super.isa;
    swift_release();
  }
  else
  {
    v15.super.Class isa = 0;
  }
  uint64_t v16 = *(char **)(v0 + 1544);
  uint64_t v17 = *(void *)(v0 + 1520);
  uint64_t v18 = *(void *)(v0 + 1128);
  [v12 setRecognitionConfidenceSubtraction:v15.super.isa];

  uint64_t v19 = *(void **)&v16[v18];
  id v20 = v19;
  if (v17)
  {
    sub_100041120();
    id v20 = (id)sub_10002A79C();
  }
  else
  {
    uint64_t v16 = 0;
  }
  uint64_t v21 = *(void *)(v0 + 1544);
  uint64_t v22 = *(void *)(v0 + 1128);
  uint64_t v23 = *(void **)(v0 + 1104);
  BOOL v24 = *(void **)(v0 + 1088);
  sub_10002A7EC((uint64_t)v20, "setRecognitionReplacements:");

  id v25 = *(id *)(v22 + v21);
  objc_msgSend(v25, "setRecognizeEagerCandidates:", ((unint64_t)objc_msgSend(v24, "flags") >> 2) & 1);

  id v26 = *(id *)(v22 + v21);
  objc_msgSend(v26, "setRecognizeEmoji:", (unint64_t)objc_msgSend(v24, "flags") & 1);

  id v27 = *(id *)(v22 + v21);
  uint64_t v28 = sub_100029468(v23, (SEL *)&selRef_rightContext);
  if (v28)
  {
    if (*(void *)(v28 + 16))
    {
      sub_10002EAE8(0, 1, v28);
      swift_bridgeObjectRetain();
    }
    swift_bridgeObjectRelease();
  }
  uint64_t v29 = *(void *)(v0 + 1544);
  uint64_t v30 = *(void *)(v0 + 1128);
  uint64_t v31 = *(void **)(v0 + 1104);
  NSString v32 = sub_1000411E0();
  swift_bridgeObjectRelease();
  [v27 setRightContext:v32];

  id v33 = *(id *)(v30 + v29);
  uint64_t v34 = sub_100029468(v31, (SEL *)&selRef_selectedText);
  if (v34)
  {
    if (*(void *)(v34 + 16))
    {
      sub_10002EAE8(0, 1, v34);
      swift_bridgeObjectRetain();
    }
    swift_bridgeObjectRelease();
  }
  uint64_t v35 = *(void *)(v0 + 1544);
  uint64_t v36 = *(void *)(v0 + 1128);
  uint64_t v37 = *(void **)(v0 + 1104);
  uint64_t v38 = *(void **)(v0 + 1088);
  NSString v39 = sub_1000411E0();
  swift_bridgeObjectRelease();
  [v33 setSelectedText:v39];

  id v40 = *(id *)(v36 + v35);
  objc_msgSend(v40, "setShouldGenerateVoiceCommandCandidates:", ((unint64_t)objc_msgSend(v38, "flags") >> 8) & 1);

  id v41 = *(id *)(v36 + v35);
  uint64_t v42 = sub_10002940C(v37, (SEL *)&selRef_profileData);
  if (v43 >> 60 == 15)
  {
    Class v44 = 0;
  }
  else
  {
    Class v44 = sub_100040E90().super.isa;
    uint64_t v45 = sub_10002A5A4();
    uint64_t v42 = sub_10000CB00(v45, v46);
  }
  sub_10002A7EC(v42, "setUserProfileData:");

  id v47 = [self clientWithIdentifier:111];
  type metadata accessor for TrialExperimentationAssetManager();
  uint64_t inited = swift_initStackObject();
  *(void *)(inited + 16) = v47;
  uint64_t v110 = inited;
  char v49 = sub_10002B4E8();
  if (v49 != 2)
  {
    uint64_t v50 = v49 & 1;
    [*(id *)(*(void *)(v0 + 1128) + *(void *)(v0 + 1544)) setDisableContextualBiasing:v50];
    uint64_t v51 = sub_1000410C0();
    os_log_type_t v52 = sub_100041370();
    if (os_log_type_enabled(v51, v52))
    {
      uint64_t v53 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v53 = 67109120;
      *(_DWORD *)(v0 + 1560) = v50;
      sub_100041450();
      _os_log_impl((void *)&_mh_execute_header, v51, v52, "Setting disableContextualBiasing=%{BOOL}d based on factor level from Trial.", v53, 8u);
      sub_10000A754();
    }
  }
  uint64_t v54 = (id *)(v0 + 1088);
  uint64_t v55 = *(void *)(v0 + 1128);
  uint64_t v56 = *(void **)(v0 + 1088);
  type metadata accessor for Instrumentation();
  *(void *)(v55 + OBJC_IVAR____TtC22localspeechrecognition19EARSpeechRecognizer_cpuInstructionsUsedAtStart) = sub_100006B3C();
  id v57 = [v56 modelOptions];
  unint64_t v58 = (unint64_t)_swiftEmptyArrayStorage;
  if (v57)
  {
    uint64_t v59 = sub_100029208(v57);
    if (v59) {
      unint64_t v58 = v59;
    }
  }
  id v60 = [*v54 modelOptions];
  if (v60 && (uint64_t v61 = sub_100029198(v60)) != 0)
  {
    uint64_t v109 = v61;
  }
  else
  {
    uint64_t v109 = sub_100041140();
    swift_bridgeObjectRelease();
  }
  id v62 = [*v54 modelOptions];
  if (v62)
  {
    uint64_t v63 = v62;
    id v64 = [v62 speechProfileURLs];

    sub_10002A3A4();
    uint64_t v65 = (void *)sub_100041270();
  }
  else
  {
    uint64_t v65 = _swiftEmptyArrayStorage;
  }
  swift_bridgeObjectRetain_n();
  BOOL v66 = sub_1000410C0();
  os_log_type_t v67 = sub_100041370();
  unint64_t v68 = v58 >> 62;
  if (os_log_type_enabled(v66, v67))
  {
    uint64_t v69 = (uint8_t *)sub_10000CDEC();
    *(_DWORD *)uint64_t v69 = 134217984;
    if (v68)
    {
      swift_bridgeObjectRetain();
      uint64_t v70 = sub_1000416B0();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v70 = *(void *)((v58 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    swift_bridgeObjectRelease();
    *(void *)(v0 + 1080) = v70;
    sub_100041450();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v66, v67, "MUX: EARSpeechRecognizer init speechProfileContainers size=%ld", v69, 0xCu);
    sub_10000A754();
  }
  else
  {
    swift_bridgeObjectRelease_n();

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  if (v68)
  {
    swift_bridgeObjectRetain();
    uint64_t v72 = sub_1000416B0();
    swift_bridgeObjectRelease();
    if (v72) {
      goto LABEL_44;
    }
LABEL_46:
    uint64_t v73 = v65[2];
    swift_bridgeObjectRelease();
    uint64_t v71 = v109;
    if (!v73) {
      goto LABEL_48;
    }
    goto LABEL_47;
  }
  if (!*(void *)((v58 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
    goto LABEL_46;
  }
LABEL_44:
  swift_bridgeObjectRelease();
  uint64_t v71 = v109;
LABEL_47:
  uint64_t v74 = *(void *)(v0 + 1544);
  uint64_t v75 = *(void *)(v0 + 1360);
  uint64_t v76 = *(void *)(v0 + 1128);
  uint64_t v77 = *(void **)(v0 + 1104);
  uint64_t v78 = (uint64_t *)(v76 + *(void *)(v0 + 1472));
  type metadata accessor for EARSpeechRecognizer();
  unint64_t v79 = *(void **)(v76 + v75);
  uint64_t v80 = *v78;
  uint64_t v81 = v78[1];
  uint64_t v82 = *(void **)(v76 + v74);
  id v83 = v79;
  swift_bridgeObjectRetain();
  Swift::Int v84 = v82;
  sub_10001E254(v83, v58, v71, v77, v80, v81, v84);

  swift_bridgeObjectRelease();
LABEL_48:
  uint64_t v85 = *(void *)(v0 + 1472);
  uint64_t v86 = *(void *)(v0 + 1128);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v87 = *(void *)(v86 + v85 + 8);
  *(void *)(v0 + 1008) = *(void *)(v86 + v85);
  *(void *)(v0 + 1016) = v87;
  *(void *)(v0 + 1024) = 45;
  *(void *)(v0 + 1032) = 0xE100000000000000;
  uint64_t v88 = self;
  *(void *)(v0 + 1040) = 95;
  *(void *)(v0 + 1048) = 0xE100000000000000;
  uint64_t v89 = 1;
  unint64_t v108 = sub_10000F9A8();
  sub_100041470();
  NSString v90 = sub_1000411E0();
  swift_bridgeObjectRelease();
  id v91 = objc_msgSend(v88, "speechProfileDateLastModifiedForLanguage:", v90, &type metadata for String, v108, v108, v108);

  if (v91)
  {
    sub_100040ED0();

    uint64_t v89 = 0;
  }
  BOOL v92 = *(void **)(v0 + 1488);
  double v93 = *(double *)(v0 + 1416);
  uint64_t v94 = *(void **)(v0 + 1408);
  uint64_t v95 = *(void *)(v0 + 1152);
  uint64_t v96 = *(char **)(v0 + 1128);
  uint64_t v97 = (uint64_t)&v96[*(void *)(v0 + 1368)];
  sub_10000A374(v95, v89, 1, *(void *)(v0 + 1376));
  swift_beginAccess();
  sub_10002A170(v95, v97, &qword_1000641B0);
  swift_endAccess();
  mach_continuous_time();
  sub_10002A3CC();
  sub_100009388(v98, v99, v100, v101, v102, v103);
  id v104 = [v94 processInfo];
  [v104 systemUptime];
  double v106 = v105;

  swift_setDeallocating();
  *(double *)&v96[OBJC_IVAR____TtC22localspeechrecognition19EARSpeechRecognizer_modelLoadTime] = v106 - v93;

  swift_release();
  swift_bridgeObjectRelease();
  return _swift_asyncLet_finish(v0 + 16, v0 + 992, sub_10001D89C, v0 + 848);
}

uint64_t sub_10001D89C()
{
  return sub_10002A238((uint64_t)sub_10001D8B0);
}

uint64_t sub_10001D8B0()
{
  receiver = (void (*)(uint64_t))v0[91].receiver;
  Class super_class = v0[89].super_class;
  id v3 = v0[89].receiver;
  uint64_t v4 = (uint64_t)v0[81].receiver;
  Class v5 = v0[70].super_class;
  Class v14 = v0[69].super_class;
  id v11 = v0[69].receiver;
  Class v12 = v0[68].super_class;
  id v13 = v0[68].receiver;

  uint64_t v6 = sub_10002A494();
  receiver(v6);
  sub_100008834(v4, (uint64_t *)&unk_100063F60);
  swift_release();
  uint64_t v7 = type metadata accessor for EARSpeechRecognizer();
  v0[61].receiver = v5;
  v0[61].Class super_class = (Class)v7;
  id v8 = objc_msgSendSuper2(v0 + 61, "init");

  swift_release();
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
  uint64_t v9 = (uint64_t (*)(id))v0->super_class;
  return v9(v8);
}

uint64_t sub_10001DABC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a3 + 16))
  {
    sub_100041780();
    sub_100041220();
    Swift::Int v6 = sub_1000417A0();
    uint64_t v7 = -1 << *(unsigned char *)(a3 + 32);
    unint64_t v8 = v6 & ~v7;
    uint64_t v9 = a3 + 56;
    if ((*(void *)(a3 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8))
    {
      uint64_t v10 = *(void *)(a3 + 48);
      id v11 = (void *)(v10 + 16 * v8);
      BOOL v12 = *v11 == a1 && v11[1] == a2;
      if (v12 || (sub_100041720() & 1) != 0) {
        return 1;
      }
      uint64_t v14 = ~v7;
      unint64_t v15 = (v8 + 1) & v14;
      if ((*(void *)(v9 + ((v15 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v15))
      {
        while (1)
        {
          uint64_t v16 = (void *)(v10 + 16 * v15);
          BOOL v17 = *v16 == a1 && v16[1] == a2;
          if (v17 || (sub_100041720() & 1) != 0) {
            break;
          }
          uint64_t result = 0;
          unint64_t v15 = (v15 + 1) & v14;
          if (((*(void *)(v9 + ((v15 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v15) & 1) == 0) {
            return result;
          }
        }
        return 1;
      }
    }
  }
  return 0;
}

uint64_t sub_10001DBF4(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a2 + 16)
    && (Swift::Int v3 = sub_1000414E0(*(void *)(a2 + 40)),
        uint64_t v4 = -1 << *(unsigned char *)(a2 + 32),
        unint64_t v5 = v3 & ~v4,
        ((*(void *)(a2 + 56 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5) & 1) != 0))
  {
    uint64_t v6 = ~v4;
    do
    {
      sub_100019208(*(void *)(a2 + 48) + 40 * v5, (uint64_t)v9);
      char v7 = sub_1000414F0();
      sub_100019264((uint64_t)v9);
      if (v7) {
        break;
      }
      unint64_t v5 = (v5 + 1) & v6;
    }
    while (((*(void *)(a2 + 56 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5) & 1) != 0);
  }
  else
  {
    char v7 = 0;
  }
  return v7 & 1;
}

uint64_t sub_10001DCCC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v7[7] = a6;
  v7[8] = a7;
  v7[5] = a4;
  v7[6] = a5;
  v7[3] = a2;
  v7[4] = a3;
  void v7[2] = a1;
  return _swift_task_switch(sub_10001DCF8, 0, 0);
}

uint64_t sub_10001DCF8()
{
  sub_10002A650();
  id v1 = *(uint64_t **)(v0 + 16);
  *id v1 = sub_10001DD68(*(void **)(v0 + 24), *(void *)(v0 + 32));
  v1[1] = v2;
  Swift::Int v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

uint64_t sub_10001DD68(void *a1, uint64_t a2)
{
  uint64_t v4 = sub_10002940C(a1, (SEL *)&selRef_jitProfileData);
  unint64_t v6 = v5;
  sub_10000CB00(v4, v5);
  if (v6 >> 60 == 15)
  {
    uint64_t v7 = sub_100029468(a1, (SEL *)&selRef_contextualStrings);
    if (v7 && (uint64_t v8 = *(void *)(v7 + 16), swift_bridgeObjectRelease(), v8)
      || (unint64_t v9 = sub_1000294BC(a1)) != 0
      && (v9 >> 62 ? (uint64_t v10 = sub_1000416B0()) : (uint64_t v10 = *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10)),
          swift_bridgeObjectRelease(),
          v10))
    {
      if (qword_1000621B0 != -1) {
        swift_once();
      }
      mach_continuous_time();
      sub_100006574();
      uint64_t v11 = sub_100029468(a1, (SEL *)&selRef_contextualStrings);
      if (v11) {
        BOOL v12 = (void *)v11;
      }
      else {
        BOOL v12 = _swiftEmptyArrayStorage;
      }
      uint64_t v13 = sub_1000294BC(a1);
      if (v13) {
        unint64_t v14 = v13;
      }
      else {
        unint64_t v14 = (unint64_t)_swiftEmptyArrayStorage;
      }
      unint64_t v15 = self;
      sub_100040E00();
      Class isa = sub_100041260().super.isa;
      swift_bridgeObjectRelease();
      id v17 = [v15 pathWithComponents:isa];

      uint64_t v18 = sub_1000411F0();
      uint64_t v20 = v19;

      id v21 = sub_100022D20(*(void *)(a2 + OBJC_IVAR____TtC22localspeechrecognition9LSRAssets_language), *(void *)(a2 + OBJC_IVAR____TtC22localspeechrecognition9LSRAssets_language + 8), v18, v20);
      id v22 = v21;
      if (v21)
      {
        if (v12[2])
        {
          id v22 = v21;
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          Class v23 = sub_100041260().super.isa;
          [v22 createInlineLmeUserDataForContextStrings:v23];

          uint64_t v24 = sub_10002940C(v22, (SEL *)&selRef_dataProfile);
LABEL_31:
          mach_continuous_time();
          sub_100006714();
          swift_bridgeObjectRelease();

          return v24;
        }
        if (v14 >> 62)
        {
          swift_bridgeObjectRetain();
          uint64_t v29 = sub_1000416B0();
          swift_bridgeObjectRelease();
          if (v29) {
            goto LABEL_27;
          }
        }
        else if (*(void *)((v14 & 0xFFFFFFFFFFFFFF8) + 0x10))
        {
LABEL_27:
          uint64_t v24 = sub_100023464(v14, v18, v20, v22);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          goto LABEL_31;
        }
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v24 = 0;
      goto LABEL_31;
    }
    return 0;
  }
  else
  {
    if (qword_1000621C0 != -1) {
      swift_once();
    }
    uint64_t v25 = sub_1000410D0();
    sub_100007B8C(v25, (uint64_t)qword_100064690);
    id v26 = sub_1000410C0();
    os_log_type_t v27 = sub_100041370();
    if (os_log_type_enabled(v26, v27))
    {
      uint64_t v28 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v28 = 0;
      _os_log_impl((void *)&_mh_execute_header, v26, v27, "Configuring recognizer with provided jitProfileData rather than building JIT LME from contextual strings or contextualNamedEntities", v28, 2u);
      swift_slowDealloc();
    }

    return sub_10002940C(a1, (SEL *)&selRef_jitProfileData);
  }
}

uint64_t sub_10001E188(uint64_t a1)
{
  uint64_t v2 = (uint64_t *)(a1 + 16);
  uint64_t v1 = *(void *)(a1 + 16);
  uint64_t v3 = v1;
  if (v1 == 1)
  {
    NSString v4 = sub_1000411E0();
    id v5 = EtiquetteReplacementsForLanguage(v4);

    if (v5)
    {
      uint64_t v3 = sub_100041130();
    }
    else
    {
      uint64_t v3 = 0;
    }
    swift_beginAccess();
    uint64_t v6 = *v2;
    *uint64_t v2 = v3;
    swift_bridgeObjectRetain();
    sub_10002A1FC(v6);
  }
  sub_10002A20C(v1);
  return v3;
}

void sub_10001E254(void *a1, unint64_t a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6, NSObject *a7)
{
  uint64_t v10 = sub_10002940C(a4, (SEL *)&selRef_profileData);
  unint64_t v12 = v11;
  sub_10000CB00(v10, v11);
  if (v12 >> 60 == 15)
  {
    os_log_t oslog = a7;
    if (qword_1000621B0 != -1) {
      swift_once();
    }
    uint64_t v13 = mach_continuous_time();
    sub_100008C30("ES: AOT Profile Load", 20, 2, 0, 0xE000000000000000, v13);
    if (qword_1000621C0 != -1) {
      swift_once();
    }
    uint64_t v14 = sub_1000410D0();
    sub_100007B8C(v14, (uint64_t)qword_100064690);
    id v15 = a1;
    swift_bridgeObjectRetain_n();
    id v16 = v15;
    id v17 = sub_1000410C0();
    os_log_type_t v18 = sub_100041360();
    if (os_log_type_enabled(v17, v18))
    {
      uint64_t v19 = swift_slowAlloc();
      *(_DWORD *)uint64_t v19 = 134218240;
      id v20 = [v16 count];

      *(void *)&v42[0] = v20;
      sub_100041450();

      *(_WORD *)(v19 + 12) = 2048;
      if (a2 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v21 = sub_1000416B0();
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v21 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
      }
      swift_bridgeObjectRelease();
      *(void *)&v42[0] = v21;
      sub_100041450();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v17, v18, "MUX: %ld speech profiles are cached. %ld are available to be loaded", (uint8_t *)v19, 0x16u);
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    uint64_t v25 = self;
    NSString v26 = sub_1000411E0();
    [v25 loadSpeechProfiles:v16 language:v26];

    id v27 = [v16 allKeys];
    uint64_t v28 = sub_100041270();

    sub_10001A05C(v28, &v40);
    swift_bridgeObjectRelease();
    if (!v41) {
      goto LABEL_27;
    }
    sub_100029B30(&v40, v42);
    swift_dynamicCast();
    long long v29 = v39[0];
    swift_bridgeObjectRetain_n();
    uint64_t v30 = sub_1000410C0();
    os_log_type_t v31 = sub_100041370();
    if (os_log_type_enabled(v30, v31))
    {
      NSString v32 = (uint8_t *)swift_slowAlloc();
      *(void *)&v42[0] = swift_slowAlloc();
      *(_DWORD *)NSString v32 = 136380675;
      swift_bridgeObjectRetain();
      *(void *)&long long v40 = sub_10002E330(v29, *((unint64_t *)&v29 + 1), (uint64_t *)v42);
      sub_100041450();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v30, v31, "Configuring recognizer with speech profile at path: %{private}s", v32, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    NSString v33 = sub_1000411E0();
    swift_bridgeObjectRelease();
    id v34 = [v16 objectForKey:v33];

    if (v34)
    {
      sub_100041480();
      swift_unknownObjectRelease();
    }
    else
    {
      memset(v39, 0, sizeof(v39));
    }
    sub_10002A1B4((uint64_t)v39, (uint64_t)&v40, &qword_100064170);
    if (v41)
    {
      sub_100029B30(&v40, v42);
      sub_10000CD4C(0, (unint64_t *)&unk_100064178);
      swift_dynamicCast();
      [oslog setUserProfile:v38];
    }
    else
    {
LABEL_27:
      sub_100008834((uint64_t)&v40, &qword_100064170);
    }
    uint64_t v35 = mach_continuous_time();
    sub_100009388((unint64_t)"ES: AOT Profile Load", 20, 2, 0, 0xE000000000000000, v35);
  }
  else
  {
    if (qword_1000621C0 != -1) {
      swift_once();
    }
    uint64_t v22 = sub_1000410D0();
    sub_100007B8C(v22, (uint64_t)qword_100064690);
    osloga = sub_1000410C0();
    os_log_type_t v23 = sub_100041370();
    if (os_log_type_enabled(osloga, v23))
    {
      uint64_t v24 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v24 = 0;
      _os_log_impl((void *)&_mh_execute_header, osloga, v23, "Configuring recognizer with provided userProfileData rather than loading speech profiles", v24, 2u);
      swift_slowDealloc();
    }
  }
}

id sub_10001E8A4()
{
  uint64_t v1 = *(void *)((char *)OBJC_IVAR____TtC22localspeechrecognition19EARSpeechRecognizer_sandboxExtensionHandles
                 + (void)v0);
  uint64_t v2 = *(void *)(v1 + 16);
  if (v2)
  {
    swift_bridgeObjectRetain();
    for (uint64_t i = 0; i != v2; ++i)
    {
      if (*(void *)(v1 + 8 * i + 32) != -1) {
        sandbox_extension_release();
      }
    }
    swift_bridgeObjectRelease();
  }
  v5.receiver = v0;
  v5.Class super_class = (Class)type metadata accessor for EARSpeechRecognizer();
  return objc_msgSendSuper2(&v5, "dealloc");
}

uint64_t sub_10001EA7C()
{
  return type metadata accessor for EARSpeechRecognizer();
}

uint64_t type metadata accessor for EARSpeechRecognizer()
{
  uint64_t result = qword_100064048;
  if (!qword_100064048) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_10001EAD0(void *a1, void *a2, void *a3, void *a4)
{
  id v98 = a4;
  uint64_t v101 = a3;
  unint64_t ObjectType = swift_getObjectType();
  uint64_t v7 = sub_100041310();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = __chkstk_darwin(v7);
  unint64_t v11 = (char *)&v97 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v13 = (char *)&v97 - v12;
  uint64_t v14 = sub_100007A58((uint64_t *)&unk_100063F60);
  uint64_t v15 = sub_1000082F8(v14);
  uint64_t v16 = __chkstk_darwin(v15);
  uint64_t v99 = (char *)&v97 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v16);
  uint64_t v19 = (char *)&v97 - v18;
  *(void *)(v4 + OBJC_IVAR____TtC22localspeechrecognition19EARSpeechRecognizer_cpuInstructionsUsedAtStart) = 0;
  id v20 = [a1 taskNames];
  uint64_t v21 = sub_100041330();

  Swift::Int v106 = sub_10001A07C(v21);
  uint64_t v23 = v22;
  swift_bridgeObjectRelease();
  Swift::Int v105 = v23;
  if (!v23)
  {
    __break(1u);
    goto LABEL_82;
  }
  uint64_t v102 = v4;
  uint64_t v103 = a2;
  uint64_t v24 = *(void *)((char *)OBJC_IVAR____TtC22localspeechrecognition19EARSpeechRecognizer_assets + v4);
  id v25 = [a2 asrID];
  if (v25)
  {
    NSString v26 = v25;
    sub_100040F10();

    uint64_t v27 = sub_100040F20();
    uint64_t v28 = 0;
  }
  else
  {
    uint64_t v27 = sub_100040F20();
    uint64_t v28 = 1;
  }
  long long v29 = v101;
  sub_10000A374((uint64_t)v19, v28, 1, v27);
  uint64_t v100 = sub_10001DD68(v29, v24);
  unint64_t ObjectType = v30;
  sub_100008834((uint64_t)v19, (uint64_t *)&unk_100063F60);
  id v31 = v98;
  if (!v98)
  {
    uint64_t v34 = 0;
    goto LABEL_10;
  }
  id v32 = v98;
  unint64_t v33 = (unint64_t)[v32 priority];
  if ((v33 & 0x8000000000000000) != 0 || v33 >= 0x100)
  {
LABEL_82:
    sub_1000150E8();
    sub_100041690();
    __break(1u);
    return;
  }
  sub_1000412F0();
  sub_1000412F0();
  uint64_t v34 = sub_1000412E0();

  uint64_t v35 = *(void (**)(uint64_t))(v8 + 8);
  uint64_t v36 = sub_10002A3A4();
  v35(v36);
  ((void (*)(char *, uint64_t))v35)(v13, v7);
LABEL_10:
  uint64_t v37 = *(NSObject **)(v102 + OBJC_IVAR____TtC22localspeechrecognition19EARSpeechRecognizer_recognizer);
  [v37 setAllowUtteranceDelay:((unint64_t)sub_10002A364() >> 6) & 1];
  if (!v31 || (sub_10002958C(v31, (SEL *)&selRef_aneContext), !v38))
  {
    swift_bridgeObjectRelease();
    sub_10002A804();
  }
  sub_1000411E0();
  sub_10002A47C();
  [v37 setAneContext:v11];

  NSString v39 = (char *)sub_10002A568();
  if (v39)
  {
    unint64_t v11 = v39;
    id v40 = [v39 atypicalSpeech];
  }
  else
  {
    id v40 = 0;
  }
  [v37 setAtypicalSpeech:v40];
  -[NSObject setConcatenateUtterances:](v37, "setConcatenateUtterances:", [a1 concatenateUtterances]);
  if (!v31 || (sub_10002958C(v31, (SEL *)&selRef_cpuContext), !v41))
  {
    swift_bridgeObjectRelease();
    sub_10002A804();
  }
  sub_1000411E0();
  sub_10002A47C();
  [v37 setCpuContext:v11];

  -[NSObject setDetectUtterances:](v37, "setDetectUtterances:", [a1 isSingleUtteranceTask] ^ 1);
  [v37 setDisableAutoPunctuation:((unint64_t)sub_10002A364() & 2) == 0];
  [v37 setDisablePartialResults:((unint64_t)sub_10002A364() & 4) == 0];
  [v37 setEnableVoiceCommands:((unint64_t)sub_10002A364() >> 9) & 1];
  id v42 = [a1 detectionOptions];
  if (v42)
  {
    unint64_t v43 = v42;
    [v42 detectAfterTime];
    double v45 = v44;
  }
  else
  {
    double v45 = 0.0;
  }
  [v37 setEndpointStart:v45];
  unint64_t v46 = (char *)sub_10002A568();
  if (v46)
  {
    unint64_t v11 = v46;
    id v47 = [v46 farField];
  }
  else
  {
    id v47 = 0;
  }
  [v37 setFarField:v47];
  [v37 setFormatAcrossUtterances:((unint64_t)sub_10002A364() >> 6) & 1];
  if (!v31 || (sub_10002958C(v31, (SEL *)&selRef_gpuContext), !v48))
  {
    swift_bridgeObjectRelease();
    sub_10002A804();
  }
  sub_1000411E0();
  sub_10002A47C();
  [v37 setGpuContext:v11];

  [v37 setHighPriority:v34 & 1];
  uint64_t v49 = sub_10002958C(v103, (SEL *)&selRef_inputOrigin);
  sub_10002A510(v49, v50);
  sub_1000411E0();
  uint64_t v51 = sub_10002A5F4();
  sub_10002A70C(v51, "setInputOrigin:");

  Class isa = 0;
  if (ObjectType >> 60 != 15)
  {
    uint64_t v34 = v100;
    unint64_t v53 = ObjectType;
    sub_100029AD8(v100, ObjectType);
    sub_10002A7C0();
    Class isa = sub_100040E90().super.isa;
    sub_10000CB00(v34, v53);
  }
  [v37 setJitProfileData:isa];

  sub_100029468(v29, (SEL *)&selRef_leftContext);
  sub_100041260();
  uint64_t v54 = sub_10002A5F4();
  sub_10002A70C(v54, "setLeftContext:");

  [v37 setRecognizeEagerCandidates:((unint64_t)sub_10002A364() >> 2) & 1];
  [v37 setRecognizeEmoji:(unint64_t)sub_10002A364() & 1];
  uint64_t v55 = sub_100029468(v29, (SEL *)&selRef_rightContext);
  if (v55)
  {
    if (*(void *)(v55 + 16))
    {
      uint64_t v34 = *(void *)(v55 + 32);
      swift_bridgeObjectRetain();
    }
    else
    {
      sub_10002A790();
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_10002A790();
  }
  sub_1000411E0();
  uint64_t v56 = sub_10002A5F4();
  sub_10002A70C(v56, "setRightContext:");

  uint64_t v57 = sub_100029468(v29, (SEL *)&selRef_selectedText);
  if (v57)
  {
    if (*(void *)(v57 + 16))
    {
      uint64_t v34 = *(void *)(v57 + 32);
      swift_bridgeObjectRetain();
    }
    else
    {
      sub_10002A790();
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_10002A790();
  }
  sub_1000411E0();
  uint64_t v58 = sub_10002A5F4();
  sub_10002A70C(v58, "setSelectedText:");

  [v37 setShouldGenerateVoiceCommandCandidates:((unint64_t)sub_10002A364() >> 8) & 1];
  uint64_t v59 = sub_10002940C(v29, (SEL *)&selRef_profileData);
  if (v60 >> 60 == 15)
  {
    Class v61 = 0;
  }
  else
  {
    uint64_t v62 = v59;
    unint64_t v63 = v60;
    Class v61 = sub_100040E90().super.isa;
    sub_10000CB00(v62, v63);
  }
  [v37 setUserProfileData:v61];

  id v64 = [v37 activeConfiguration];
  uint64_t v108 = sub_10002952C(v64);
  if (v108)
  {
    Swift::Int v65 = v105;
    swift_bridgeObjectRetain();
    sub_1000274C0(&v107, v106, v65);
    if (v108)
    {
      v66.super.Class isa = sub_100041320().super.isa;
      swift_bridgeObjectRelease();
    }
    else
    {
      v66.super.Class isa = 0;
    }
    [v64 setTaskTypeFilter:v66.super.isa];

    swift_bridgeObjectRelease();
  }
  else
  {
    [v64 setTaskTypeFilter:0];
  }
  [v37 setActiveConfiguration:v64];
  id v67 = sub_10002A568();
  if (v67 && (uint64_t v68 = sub_100029208(v67)) != 0)
  {
    unint64_t v69 = v68;
  }
  else
  {
    swift_bridgeObjectRelease();
    unint64_t v69 = (unint64_t)_swiftEmptyArrayStorage;
  }
  id v70 = sub_10002A568();
  if (v70 && (uint64_t v71 = sub_100029198(v70)) != 0)
  {
    uint64_t v72 = v71;
  }
  else
  {
    uint64_t v72 = sub_100041140();
    swift_bridgeObjectRelease();
  }
  id v73 = sub_10002A568();
  if (v73)
  {
    uint64_t v74 = v73;
    id v75 = [v73 speechProfileURLs];

    sub_100040E80();
    uint64_t v76 = (void *)sub_100041270();
  }
  else
  {
    uint64_t v76 = _swiftEmptyArrayStorage;
  }
  if (qword_1000621C0 != -1) {
    swift_once();
  }
  uint64_t v77 = sub_1000410D0();
  sub_100007B8C(v77, (uint64_t)qword_100064690);
  swift_bridgeObjectRetain_n();
  uint64_t v78 = sub_1000410C0();
  os_log_type_t v79 = sub_100041370();
  unint64_t v80 = v69 >> 62;
  if (os_log_type_enabled(v78, v79))
  {
    uint64_t v81 = (uint8_t *)sub_10000CDEC();
    *(_DWORD *)uint64_t v81 = 134217984;
    if (v80)
    {
      swift_bridgeObjectRetain();
      uint64_t v82 = sub_1000416B0();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v82 = *(void *)((v69 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    swift_bridgeObjectRelease();
    Swift::Int v107 = v82;
    sub_100041450();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v78, v79, "MUX: EARSpeechRecognizer prepareForReuse speechProfileContainers size=%ld", v81, 0xCu);
    sub_10000A754();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  if (v80)
  {
    swift_bridgeObjectRetain();
    uint64_t v83 = sub_1000416B0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v83 = *(void *)((v69 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  uint64_t v84 = v102;
  if (v83)
  {
    swift_bridgeObjectRelease();
LABEL_74:
    type metadata accessor for EARSpeechRecognizer();
    uint64_t v86 = *(void *)(v84 + OBJC_IVAR____TtC22localspeechrecognition19EARSpeechRecognizer_languageStr);
    uint64_t v87 = *(void *)(v84 + OBJC_IVAR____TtC22localspeechrecognition19EARSpeechRecognizer_languageStr + 8);
    id v88 = *(id *)(v84 + OBJC_IVAR____TtC22localspeechrecognition19EARSpeechRecognizer_userSpeechProfiles);
    swift_bridgeObjectRetain();
    sub_10001E254(v88, v69, v72, v101, v86, v87, v37);

    swift_bridgeObjectRelease();
    goto LABEL_75;
  }
  uint64_t v85 = v76[2];
  swift_bridgeObjectRelease();
  if (v85) {
    goto LABEL_74;
  }
LABEL_75:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  id v89 = [v103 asrID];
  if (v89)
  {
    NSString v90 = v89;
    uint64_t v91 = (uint64_t)v99;
    sub_100040F10();

    uint64_t v92 = 0;
  }
  else
  {
    uint64_t v92 = 1;
    uint64_t v91 = (uint64_t)v99;
  }
  uint64_t v93 = sub_100040F20();
  sub_10000A374(v91, v92, 1, v93);
  swift_beginAccess();
  uint64_t v94 = sub_10002A3A4();
  sub_10002A170(v94, v95, v96);
  swift_endAccess();
  sub_1000194CC(v106, v105);
  sub_10000CB00(v100, ObjectType);
}

void sub_10001F834(uint64_t a1, void (**a2)(void, void))
{
  id v3 = [*(id *)(a1 + OBJC_IVAR____TtC22localspeechrecognition19EARSpeechRecognizer_recognizer) modelInfo];
  id v4 = [v3 samplingRates];

  uint64_t v5 = sub_100041330();
  uint64_t v6 = *(void *)(v5 + 16);
  if (v6)
  {
    uint64_t v21 = _swiftEmptyArrayStorage;
    sub_1000415E0();
    int64_t v7 = sub_100029D50(v5);
    int v9 = v8;
    char v11 = v10 & 1;
    while ((v7 & 0x8000000000000000) == 0 && v7 < 1 << *(unsigned char *)(v5 + 32))
    {
      if (((*(void *)(v5 + 56 + (((unint64_t)v7 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v7) & 1) == 0) {
        goto LABEL_12;
      }
      if (*(_DWORD *)(v5 + 36) != v9) {
        goto LABEL_13;
      }
      sub_100019208(*(void *)(v5 + 48) + 40 * v7, (uint64_t)v19);
      v17[0] = v19[0];
      v17[1] = v19[1];
      uint64_t v18 = v20;
      sub_100041500();
      sub_10000CD4C(0, &qword_100063260);
      swift_dynamicCast();
      sub_100019264((uint64_t)v17);
      sub_1000415C0();
      sub_1000415F0();
      sub_100041600();
      sub_1000415D0();
      int64_t v12 = sub_100029BEC(v7, v9, v11 & 1, v5);
      int64_t v7 = v12;
      int v9 = v13;
      char v11 = v14 & 1;
      if (!--v6)
      {
        sub_1000192B8(v12, v13, v14 & 1);
        uint64_t v15 = v21;
        swift_bridgeObjectRelease();
        goto LABEL_10;
      }
    }
    __break(1u);
LABEL_12:
    __break(1u);
LABEL_13:
    __break(1u);
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v15 = _swiftEmptyArrayStorage;
LABEL_10:
    sub_10001A224((unint64_t)v15);
    sub_10000CD4C(0, &qword_100063260);
    sub_100029DD0(&qword_1000641B8, &qword_100063260);
    Class isa = sub_100041320().super.isa;
    ((void (**)(void, Class))a2)[2](a2, isa);
    swift_bridgeObjectRelease();

    _Block_release(a2);
  }
}

void sub_10001FAF4(void *a1, void *a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7, void (**a8)(void, void, void))
{
  id v161 = a2;
  uint64_t v162 = a3;
  id v155 = a1;
  uint64_t v13 = sub_100040FF0();
  __chkstk_darwin(v13 - 8);
  char v160 = (char *)&v133 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_1000411D0();
  __chkstk_darwin(v15 - 8);
  v159 = (char *)&v133 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_1000411B0();
  __chkstk_darwin(v17 - 8);
  uint64_t v18 = sub_100007A58(&qword_1000641B0);
  __chkstk_darwin(v18 - 8);
  unint64_t v147 = (unint64_t)&v133 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v148 = sub_100040EE0();
  uint64_t v146 = *(void *)(v148 - 8);
  __chkstk_darwin(v148);
  uint64_t v145 = (uint64_t)&v133 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = sub_100007A58((uint64_t *)&unk_100063F60);
  uint64_t v22 = __chkstk_darwin(v21 - 8);
  uint64_t v154 = (char *)&v133 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = __chkstk_darwin(v22);
  NSString v26 = (char *)&v133 - v25;
  __chkstk_darwin(v24);
  uint64_t v28 = (char *)&v133 - v27;
  uint64_t v29 = sub_100040F20();
  uint64_t v156 = *(void *)(v29 - 8);
  uint64_t v157 = v29;
  uint64_t v30 = __chkstk_darwin(v29);
  uint64_t v149 = (uint64_t)&v133 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v30);
  char v152 = (char *)&v133 - v32;
  if (qword_1000621C0 != -1) {
    swift_once();
  }
  uint64_t v33 = sub_1000410D0();
  sub_100007B8C(v33, (uint64_t)qword_100064690);
  uint64_t v34 = sub_1000410C0();
  os_log_type_t v35 = sub_100041370();
  BOOL v36 = os_log_type_enabled(v34, v35);
  v151 = v26;
  uint64_t v153 = v28;
  if (v36)
  {
    uint64_t v37 = swift_slowAlloc();
    uint64_t v158 = a6;
    uint64_t v38 = (uint8_t *)v37;
    uint64_t v39 = swift_slowAlloc();
    unint64_t v150 = a8;
    v165[0] = v39;
    *(_DWORD *)uint64_t v38 = 136315138;
    uint64_t v163 = sub_10002E330(0xD000000000000042, 0x800000010004D020, v165);
    sub_100041450();
    _os_log_impl((void *)&_mh_execute_header, v34, v35, "EARSpeechRecognizer.%s", v38, 0xCu);
    swift_arrayDestroy();
    a8 = v150;
    swift_slowDealloc();
    a6 = v158;
    swift_slowDealloc();
  }

  v165[0] = (uint64_t)v161;
  v165[1] = v162;
  uint64_t v163 = 45;
  unint64_t v164 = 0xE100000000000000;
  v165[5] = 95;
  v165[6] = 0xE100000000000000;
  sub_10000F9A8();
  uint64_t v162 = sub_100041470();
  uint64_t v41 = v40;
  id v161 = *(id *)(a7 + OBJC_IVAR____TtC22localspeechrecognition19EARSpeechRecognizer_recognizer);
  id v42 = [v161 modelInfo];
  id v43 = [v42 samplingRates];
  uint64_t v44 = sub_100041330();

  uint64_t v163 = a6;
  sub_100041510();
  LOBYTE(v43) = sub_10001DBF4((uint64_t)v165, v44);
  swift_bridgeObjectRelease();
  sub_100019264((uint64_t)v165);
  if (v43)
  {
    id v45 = [v42 tasks];
    uint64_t v46 = sub_100041330();

    uint64_t v163 = a4;
    unint64_t v164 = (unint64_t)a5;
    swift_bridgeObjectRetain();
    sub_100041510();
    LOBYTE(v45) = sub_10001DBF4((uint64_t)v165, v46);
    swift_bridgeObjectRelease();
    sub_100019264((uint64_t)v165);
    if (v45)
    {
      id v144 = v42;
      uint64_t v158 = a6;
      uint64_t v47 = OBJC_IVAR____TtC22localspeechrecognition19EARSpeechRecognizer_clientInfo;
      id v48 = [*(id *)(a7 + OBJC_IVAR____TtC22localspeechrecognition19EARSpeechRecognizer_clientInfo) asrID];
      uint64_t v143 = v41;
      if (v48)
      {
        uint64_t v49 = v48;
        uint64_t v50 = v149;
        sub_100040F10();

        uint64_t v51 = *(void (**)(char *, uint64_t, uint64_t))(v156 + 32);
        uint64_t v52 = (uint64_t)v153;
        uint64_t v53 = v50;
        uint64_t v54 = v157;
        v51(v153, v53, v157);
        sub_10000A374(v52, 0, 1, v54);
        if (sub_100007B04(v52, 1, v54) != 1)
        {
          v51(v152, v52, v54);
          uint64_t v55 = a7 + OBJC_IVAR____TtC22localspeechrecognition19EARSpeechRecognizer_speechProfileLastModifiedDate;
          swift_beginAccess();
          uint64_t v56 = v147;
          sub_100029ED4(v55, v147, &qword_1000641B0);
          uint64_t v57 = v148;
          int v58 = sub_100007B04(v56, 1, v148);
          char v160 = (char *)v47;
          if (v58 == 1)
          {
            sub_100008834(v56, &qword_1000641B0);
            double v59 = 0.0;
          }
          else
          {
            uint64_t v63 = v146;
            uint64_t v64 = v145;
            (*(void (**)(uint64_t, uint64_t, uint64_t))(v146 + 32))(v145, v56, v57);
            sub_100040EC0();
            double v66 = v65;
            uint64_t v67 = v64;
            uint64_t v47 = (uint64_t)v160;
            (*(void (**)(uint64_t, uint64_t))(v63 + 8))(v67, v57);
            double v59 = -v66;
          }
          uint64_t v68 = (uint64_t)v151;
          uint64_t v69 = v156;
          uint64_t v149 = a4;
          unint64_t v150 = a8;
          if (qword_1000621B0 != -1) {
            swift_once();
          }
          v159 = (char *)qword_100064670;
          (*(void (**)(uint64_t, char *, uint64_t))(v69 + 16))(v68, v152, v54);
          sub_10000A374(v68, 0, 1, v54);
          uint64_t v70 = sub_1000295E8(*(id *)(a7 + v47), (SEL *)&selRef_applicationName);
          if (v71) {
            uint64_t v72 = v70;
          }
          else {
            uint64_t v72 = 0;
          }
          uint64_t v148 = v72;
          unint64_t v73 = 0xE000000000000000;
          if (v71) {
            unint64_t v73 = v71;
          }
          unint64_t v147 = v73;
          id v74 = v144;
          id v75 = [v144 language];
          uint64_t v146 = sub_1000411F0();
          uint64_t v142 = v76;

          id v77 = [v74 version];
          uint64_t v145 = sub_1000411F0();
          uint64_t v78 = v47;
          uint64_t v79 = a7;
          unint64_t v138 = v80;

          int v139 = *(unsigned __int8 *)(a7
                                    + OBJC_IVAR____TtC22localspeechrecognition19EARSpeechRecognizer_isHighQualityAsset);
          uint64_t v81 = *(void **)(a7 + OBJC_IVAR____TtC22localspeechrecognition19EARSpeechRecognizer_hammerModelVersion + 8);
          uint64_t v141 = *(void *)(a7 + OBJC_IVAR____TtC22localspeechrecognition19EARSpeechRecognizer_hammerModelVersion);
          v140 = v81;
          uint64_t v82 = *(void *)(a7 + OBJC_IVAR____TtC22localspeechrecognition19EARSpeechRecognizer_geoLMRegionID);
          uint64_t v83 = *(void **)(a7 + OBJC_IVAR____TtC22localspeechrecognition19EARSpeechRecognizer_geoLMRegionID + 8);
          unsigned int v84 = *(unsigned __int8 *)(v79
                                   + OBJC_IVAR____TtC22localspeechrecognition19EARSpeechRecognizer_geoLanguageModelLoaded);
          uint64_t v85 = sub_1000295E8(*(id *)(v79 + v78), (SEL *)&selRef_dictationUIInteractionID);
          uint64_t v87 = v86;
          uint64_t v153 = (char *)v79;
          unsigned int v88 = *(unsigned __int8 *)(v79
                                   + OBJC_IVAR____TtC22localspeechrecognition19EARSpeechRecognizer_atypicalSpeechEnabled);
          uint64_t v89 = mach_continuous_time();
          id v90 = [v161 leftContext];
          uint64_t v91 = sub_100041270();

          uint64_t v92 = *(void *)(v91 + 16);
          swift_bridgeObjectRelease();
          unsigned __int8 v93 = 0;
          if (!v92)
          {
            Swift::Int v134 = __PAIR64__(v84, v88);
            id v135 = v83;
            uint64_t v136 = v82;
            unint64_t v137 = a5;
            id v94 = v161;
            id v95 = [v161 rightContext];
            uint64_t v96 = sub_1000411F0();
            unint64_t v98 = v97;

            swift_bridgeObjectRelease();
            uint64_t v99 = HIBYTE(v98) & 0xF;
            if ((v98 & 0x2000000000000000) == 0) {
              uint64_t v99 = v96 & 0xFFFFFFFFFFFFLL;
            }
            if (v99)
            {
              unsigned __int8 v93 = 0;
            }
            else
            {
              id v100 = [v94 selectedText];
              uint64_t v101 = sub_1000411F0();
              unint64_t v103 = v102;

              swift_bridgeObjectRelease();
              uint64_t v104 = HIBYTE(v103) & 0xF;
              if ((v103 & 0x2000000000000000) == 0) {
                uint64_t v104 = v101 & 0xFFFFFFFFFFFFLL;
              }
              unsigned __int8 v93 = v104 == 0;
            }
            a5 = v137;
            uint64_t v82 = v136;
            uint64_t v83 = v135;
            LOBYTE(v84) = BYTE4(v134);
            LOBYTE(v88) = v134;
          }
          char v132 = v84;
          uint64_t v105 = (uint64_t)v151;
          sub_10000687C((uint64_t)v151, v149, (unint64_t)a5, v148, v147, v146, v142, v145, v59, v138, v139, v141, v140, v82, v83, v132, v85, v87, 0,
            (void *)0xE000000000000000,
            v88,
            v89,
            v93);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          sub_100008834(v105, (uint64_t *)&unk_100063F60);
          uint64_t v54 = v157;
          (*(void (**)(char *, uint64_t))(v156 + 8))(v152, v157);
          a8 = v150;
          a7 = (uint64_t)v153;
          uint64_t v47 = (uint64_t)v160;
          goto LABEL_34;
        }
      }
      else
      {
        uint64_t v52 = (uint64_t)v153;
        uint64_t v54 = v157;
        sub_10000A374((uint64_t)v153, 1, 1, v157);
      }
      sub_100008834(v52, (uint64_t *)&unk_100063F60);
LABEL_34:
      id v106 = v144;
      id v107 = [*(id *)(a7 + v47) asrID];
      if (v107)
      {
        uint64_t v108 = v107;
        uint64_t v109 = a8;
        uint64_t v110 = (uint64_t)v154;
        sub_100040F10();

        uint64_t v111 = 0;
      }
      else
      {
        uint64_t v109 = a8;
        uint64_t v111 = 1;
        uint64_t v110 = (uint64_t)v154;
      }
      sub_10000A374(v110, v111, 1, v54);
      uint64_t v112 = *(void **)((char *)OBJC_IVAR____TtC22localspeechrecognition19EARSpeechRecognizer_modelContextDelegateInterface
                      + a7);
      id v113 = objc_allocWithZone((Class)type metadata accessor for EARSpeechRecognitionResultStream());
      id v114 = v112;
      id v115 = sub_10002A850(v155, v110, v114);
      id v116 = v115;
      sub_10001ABC0((uint64_t)v115);
      id v117 = v116;
      NSString v118 = sub_1000411E0();
      swift_bridgeObjectRelease();
      NSString v119 = sub_1000411E0();
      id v120 = [v161 runRecognitionWithResultStream:v117 language:v118 task:v119 samplingRate:v158];

      id v121 = [self anonymousListener];
      [v121 setDelegate:a7];
      [v121 activate];
      uint64_t v122 = a7;
      uint64_t v123 = OBJC_IVAR____TtC22localspeechrecognition19EARSpeechRecognizer_audioBufferListenerLock;
      NSString v124 = *(os_unfair_lock_s **)(v122
                                  + OBJC_IVAR____TtC22localspeechrecognition19EARSpeechRecognizer_audioBufferListenerLock);
      swift_retain();
      os_unfair_lock_lock(v124 + 4);
      swift_release();
      id v125 = objc_allocWithZone((Class)type metadata accessor for EARSpeechRecognitionAudioBuffer());
      id v61 = v121;
      id v126 = v120;
      id v127 = sub_1000239D0(v126);
      swift_beginAccess();
      sub_1000261EC((uint64_t)v127, (uint64_t)v61, (uint64_t)&unk_100064150, (uint64_t)&unk_100064158, v128, (uint64_t)type metadata accessor for EARSpeechRecognitionAudioBuffer, v129, v130, v133, v134);
      swift_endAccess();

      unint64_t v131 = *(os_unfair_lock_s **)(v122 + v123);
      swift_retain();
      os_unfair_lock_unlock(v131 + 4);
      swift_release();
      id v62 = [v61 endpoint];
      a8 = v109;
      ((void (**)(void, id, void))v109)[2](v109, v62, 0);

      id v42 = v126;
      goto LABEL_38;
    }
  }
  sub_1000411A0();
  v166._object = (void *)0x800000010004D000;
  v166._countAndFlagsBits = 0xD000000000000018;
  sub_100041190(v166);
  v167._countAndFlagsBits = a4;
  v167._object = a5;
  sub_100041180(v167);
  v168._countAndFlagsBits = 32;
  v168._object = (void *)0xE100000000000000;
  sub_100041190(v168);
  v169._countAndFlagsBits = v162;
  v169._object = v41;
  sub_100041180(v169);
  swift_bridgeObjectRelease();
  v170._countAndFlagsBits = 32;
  v170._object = (void *)0xE100000000000000;
  sub_100041190(v170);
  v165[0] = a6;
  sub_100041170();
  v171._countAndFlagsBits = 0;
  v171._object = (void *)0xE000000000000000;
  sub_100041190(v171);
  sub_1000411C0();
  if (qword_100062238 != -1) {
    swift_once();
  }
  id v60 = (id)qword_100064878;
  sub_100040F90();
  sub_100041200();
  sub_1000413B0();
  id v61 = (id)sub_100041110();
  id v62 = (id)sub_100040DD0();
  ((void (**)(void, void, id))a8)[2](a8, 0, v62);
LABEL_38:

  _Block_release(a8);
}

BOOL sub_100020C00(void *a1, void *a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = OBJC_IVAR____TtC22localspeechrecognition19EARSpeechRecognizer_audioBufferListenerLock;
  int64_t v7 = *(os_unfair_lock_s **)(v3 + OBJC_IVAR____TtC22localspeechrecognition19EARSpeechRecognizer_audioBufferListenerLock);
  swift_retain();
  os_unfair_lock_lock(v7 + 4);
  swift_release();
  swift_beginAccess();
  int v8 = (void *)sub_100025E50(a1);
  swift_endAccess();
  int v9 = *(os_unfair_lock_s **)(v3 + v6);
  swift_retain();
  os_unfair_lock_unlock(v9 + 4);
  swift_release();
  if (v8)
  {
    char v10 = self;
    id v11 = v8;
    id v12 = [v10 interfaceWithProtocol:&OBJC_PROTOCOL____SFXPCEARSpeechRecognitionAudioBuffer];
    [a2 setExportedInterface:v12];

    sub_10002A7EC(v13, "setExportedObject:");
    uint64_t v14 = swift_allocObject();
    *(void *)(v14 + 16) = v11;
    void v18[4] = sub_100029A9C;
    v18[5] = v14;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 1107296256;
    v18[2] = sub_10001A460;
    v18[3] = &unk_1000599D0;
    uint64_t v15 = _Block_copy(v18);
    id v16 = v11;
    swift_release();
    [a2 setInvalidationHandler:v15];
    _Block_release(v15);
    [a2 activate];
  }
  return v8 != 0;
}

uint64_t sub_100020E60()
{
  sub_10002A244();
  uint64_t v3 = v2;
  uint64_t v4 = *(void *)(v1 + 16);
  if (v4)
  {
    uint64_t v5 = v1;
    sub_1000255B4(0, v4, 0);
    uint64_t v6 = v5 + 40;
    do
    {
      sub_100041210();
      swift_bridgeObjectRetain();
      uint64_t v7 = sandbox_extension_consume();
      swift_bridgeObjectRelease();
      swift_release();
      unint64_t v9 = _swiftEmptyArrayStorage[2];
      unint64_t v8 = _swiftEmptyArrayStorage[3];
      if (v9 >= v8 >> 1) {
        sub_1000255B4(v8 > 1, v9 + 1, 1);
      }
      v6 += 16;
      _swiftEmptyArrayStorage[2] = v9 + 1;
      _swiftEmptyArrayStorage[v9 + 4] = v7;
      --v4;
    }
    while (v4);
  }
  char v10 = *(void **)(v0 + OBJC_IVAR____TtC22localspeechrecognition19EARSpeechRecognizer_recognizer);
  uint64_t v11 = *(void *)(v3 + 16);
  if (v11)
  {
    swift_bridgeObjectRetain();
    id v12 = (uint64_t *)(v3 + 40);
    do
    {
      uint64_t v13 = *(v12 - 1);
      uint64_t v14 = *v12;
      objc_allocWithZone((Class)_EARAppLmArtifact);
      swift_bridgeObjectRetain_n();
      id v15 = sub_100024868(v13, v14, (SEL *)&selRef_initWithPath_);
      if (v15)
      {
        id v16 = v15;
        id v17 = [v15 loadLmHandle];
        swift_bridgeObjectRelease();

        if (v17)
        {
          sub_100041250();
          if (*(void *)(((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)(((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
            sub_1000412A0();
          }
          sub_1000412C0();
          sub_100041290();
        }
      }
      else
      {
        swift_bridgeObjectRelease();
      }
      v12 += 2;
      --v11;
    }
    while (v11);
    swift_bridgeObjectRelease();
  }
  id v18 = [v10 extraLmList];
  uint64_t v19 = (void *)sub_10000CD4C(0, (unint64_t *)&qword_1000645F0);
  sub_10002A7C0();
  sub_100041270();

  sub_100021130((unint64_t)_swiftEmptyArrayStorage);
  sub_10002A7C0();
  sub_100041260();
  sub_10002A79C();
  [v10 setExtraLmList:v19];

  uint64_t v20 = _swiftEmptyArrayStorage[2];
  if (v20)
  {
    swift_bridgeObjectRetain();
    for (uint64_t i = 0; i != v20; ++i)
    {
      if (_swiftEmptyArrayStorage[i + 4] != -1) {
        sandbox_extension_release();
      }
    }
    swift_bridgeObjectRelease();
  }
  sub_10002A260();
  return swift_bridgeObjectRelease();
}

uint64_t sub_100021130(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_1000416B0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  if ((unint64_t)*v1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v4 = sub_1000416B0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v4 = *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  if (__OFADD__(v4, v3))
  {
    __break(1u);
    goto LABEL_22;
  }
  unint64_t v5 = *v1;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *uint64_t v1 = v5;
  if (isUniquelyReferenced_nonNull_bridgeObject)
  {
    if ((v5 & 0x8000000000000000) == 0 && (v5 & 0x4000000000000000) == 0)
    {
      uint64_t v7 = v5 & 0xFFFFFFFFFFFFFF8;
      if (v4 + v3 <= *(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        goto LABEL_12;
      }
    }
  }
  if (v5 >> 62) {
    goto LABEL_23;
  }
  while (1)
  {
    swift_bridgeObjectRetain();
    uint64_t v8 = sub_1000415A0();
    swift_bridgeObjectRelease();
    *uint64_t v1 = v8;
    uint64_t v7 = v8 & 0xFFFFFFFFFFFFFF8;
LABEL_12:
    uint64_t result = sub_100029700(v7 + 8 * *(void *)(v7 + 16) + 32, (*(void *)(v7 + 24) >> 1) - *(void *)(v7 + 16), a1);
    if (v10 >= v3) {
      break;
    }
LABEL_22:
    __break(1u);
LABEL_23:
    swift_bridgeObjectRetain();
    sub_1000416B0();
    swift_bridgeObjectRelease();
  }
  if (v10 >= 1)
  {
    uint64_t v11 = *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    BOOL v12 = __OFADD__(v11, v10);
    uint64_t v13 = v11 + v10;
    if (v12)
    {
      __break(1u);
      return result;
    }
    *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10) = v13;
  }
  swift_bridgeObjectRelease();

  return sub_100041290();
}

void sub_100021380(uint64_t a1, uint64_t a2)
{
  sub_100029650(a1, a2, *(void **)(v2 + OBJC_IVAR____TtC22localspeechrecognition19EARSpeechRecognizer_recognizer));
}

void sub_1000213A8(uint64_t a1, uint64_t a2)
{
}

void sub_1000213CC(void *a1, uint64_t a2, void *a3, void (*a4)(uint64_t))
{
  id v6 = a3;
  id v10 = a1;
  sub_100040EA0();

  uint64_t v7 = sub_10002A5CC();
  a4(v7);
  uint64_t v8 = sub_10002A5CC();
  sub_10000CB14(v8, v9);
}

void sub_10002145C(uint64_t a1, uint64_t a2)
{
}

void sub_100021468(uint64_t a1, uint64_t a2, SEL *a3)
{
  unint64_t v5 = *(void **)(v3 + OBJC_IVAR____TtC22localspeechrecognition19EARSpeechRecognizer_recognizer);
  Class isa = sub_100040E90().super.isa;
  objc_msgSend(v5, *a3, isa);
}

void sub_1000214E0(uint64_t a1, void (**a2)(void, void))
{
  id v3 = [*(id *)(a1 + OBJC_IVAR____TtC22localspeechrecognition19EARSpeechRecognizer_recognizer) rightContext];
  sub_1000411F0();

  NSString v4 = sub_1000411E0();
  ((void (**)(void, NSString))a2)[2](a2, v4);
  swift_bridgeObjectRelease();

  _Block_release(a2);
}

void sub_100021598(uint64_t a1, void (**a2)(void, void))
{
  id v3 = [*(id *)(a1 + OBJC_IVAR____TtC22localspeechrecognition19EARSpeechRecognizer_recognizer) modelInfo];
  id v4 = [objc_allocWithZone((Class)EARSpeechModelInfo) initWithModelInfo:v3];

  ((void (**)(void, id))a2)[2](a2, v4);

  _Block_release(a2);
}

void sub_10002164C(uint64_t a1, void (**a2)(void, void))
{
  id v3 = [*(id *)(a1 + OBJC_IVAR____TtC22localspeechrecognition19EARSpeechRecognizer_recognizer) recognitionStatistics];
  sub_10000CD4C(0, &qword_100063260);
  sub_100041130();

  Class isa = sub_100041120().super.isa;
  ((void (**)(void, Class))a2)[2](a2, isa);
  swift_bridgeObjectRelease();

  _Block_release(a2);
}

void sub_10002174C(uint64_t a1, void (**a2)(void, void))
{
  id v3 = [*(id *)(a1 + OBJC_IVAR____TtC22localspeechrecognition19EARSpeechRecognizer_recognizer) recognitionUtterenceStatistics];
  sub_100041130();

  Class isa = sub_100041120().super.isa;
  ((void (**)(void, Class))a2)[2](a2, isa);
  swift_bridgeObjectRelease();

  _Block_release(a2);
}

void sub_10002182C(uint64_t a1, void (**a2)(void, void))
{
  type metadata accessor for Instrumentation();
  rusage_info_t v4 = sub_100006B3C();
  unint64_t v5 = *(void *)(a1 + OBJC_IVAR____TtC22localspeechrecognition19EARSpeechRecognizer_cpuInstructionsUsedAtStart);
  BOOL v6 = (unint64_t)v4 >= v5;
  unint64_t v7 = (unint64_t)v4 - v5;
  if (v6)
  {
    double v8 = (double)v7 / 1000000.0;
    id v9 = [*(id *)(a1 + OBJC_IVAR____TtC22localspeechrecognition19EARSpeechRecognizer_recognizer) recognitionMetrics];
    id v10 = [objc_allocWithZone((Class)EARRecognitionMetrics) initWithRecognitionMetrics:v9 cpuInstructions:v8];

    ((void (**)(void, id))a2)[2](a2, v10);
    _Block_release(a2);
  }
  else
  {
    __break(1u);
  }
}

void sub_100021928(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  sub_10002A34C();
  a19 = v21;
  a20 = v22;
  uint64_t v23 = v20;
  if (qword_1000621C0 != -1) {
    swift_once();
  }
  uint64_t v24 = sub_1000410D0();
  uint64_t v25 = sub_10002A37C(v24, (uint64_t)qword_100064690);
  os_log_type_t v26 = sub_100041370();
  if (os_log_type_enabled(v25, v26))
  {
    uint64_t v27 = (uint8_t *)sub_10000CDEC();
    a10 = sub_10000A780();
    *(_DWORD *)uint64_t v27 = 136315138;
    sub_10002E330(0xD000000000000012, 0x800000010004CF90, &a10);
    sub_10000CE04();
    sub_100041450();
    _os_log_impl((void *)&_mh_execute_header, v25, v26, "EARSpeechRecognizer.%s", v27, 0xCu);
    swift_arrayDestroy();
    sub_10000A754();
    sub_10000A754();
  }

  [*(id *)(v23 + OBJC_IVAR____TtC22localspeechrecognition19EARSpeechRecognizer_recognizer) pauseRecognition];
  if (qword_1000621B0 != -1) {
    swift_once();
  }
  mach_continuous_time();
  sub_10002A65C();
  sub_10002A3B0("ES: Pause Recognition", 21, v28, v29, v30, v31);
  sub_10002A2E0();
}

#error "100021AEC: call analysis failed (funcsize=18)"

uint64_t sub_100021B14()
{
  uint64_t v1 = v0;
  if (qword_1000621C0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_1000410D0();
  id v3 = sub_10002A37C(v2, (uint64_t)qword_100064690);
  os_log_type_t v4 = sub_100041370();
  if (os_log_type_enabled(v3, v4))
  {
    unint64_t v5 = (uint8_t *)sub_10000CDEC();
    uint64_t v15 = sub_10000A780();
    *(_DWORD *)unint64_t v5 = 136315138;
    sub_10002E330(0xD00000000000003DLL, 0x800000010004CF30, &v15);
    sub_100041450();
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "EARSpeechRecognizer.%s", v5, 0xCu);
    swift_arrayDestroy();
    sub_10000A754();
    sub_10000A754();
  }

  BOOL v6 = *(void **)(v1 + OBJC_IVAR____TtC22localspeechrecognition19EARSpeechRecognizer_recognizer);
  NSString v7 = sub_1000411E0();
  NSString v8 = sub_1000411E0();
  sub_10002A6D4();
  NSString v9 = sub_1000411E0();
  [v6 resumeRecognitionWithLeftContext:v7 rightContext:v8 selectedText:v9];

  if (qword_1000621B0 != -1) {
    swift_once();
  }
  mach_continuous_time();
  sub_10002A65C();
  return sub_10002A3B0("ES: Resume Recognition", 22, v10, v11, v12, v13);
}

void sub_100021E34(uint64_t a1, uint64_t a2, uint64_t a3, NSString a4, uint64_t a5, NSString a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  uint64_t v12 = v11;
  if (qword_1000621C0 != -1) {
    swift_once();
  }
  uint64_t v17 = sub_1000410D0();
  id v18 = sub_10002A37C(v17, (uint64_t)qword_100064690);
  os_log_type_t v19 = sub_100041370();
  if (os_log_type_enabled(v18, v19))
  {
    uint64_t v20 = (uint8_t *)sub_10000CDEC();
    uint64_t v24 = sub_10000A780();
    *(_DWORD *)uint64_t v20 = 136315138;
    sub_10002E330(0xD0000000000000A6, 0x800000010004CE80, &v24);
    sub_100041450();
    _os_log_impl((void *)&_mh_execute_header, v18, v19, "EARSpeechRecognizer.%s", v20, 0xCu);
    swift_arrayDestroy();
    sub_10000A754();
    sub_10000A754();
  }

  uint64_t v21 = *(void **)(v12 + OBJC_IVAR____TtC22localspeechrecognition19EARSpeechRecognizer_recognizer);
  if ([v21 respondsToSelector:"updateVoiceCommandContextWithPrefixText:postfixText:selectedText:disambiguationActive:cursorInVisibleText:favorCommandSuppression:abortCommandSuppression:undoEvent:"])
  {
    if (a2) {
      NSString v22 = sub_1000411E0();
    }
    else {
      NSString v22 = 0;
    }
    if (a4) {
      a4 = sub_1000411E0();
    }
    if (a6) {
      a6 = sub_1000411E0();
    }
    [v21 updateVoiceCommandContextWithPrefixText:v22 postfixText:a4 selectedText:a6 disambiguationActive:a7 cursorInVisibleText:a8 favorCommandSuppression:a9 abortCommandSuppression:a10 undoEvent:a11];
  }
}

#error "100022274: call analysis failed (funcsize=103)"

void sub_100022420(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  sub_10002A34C();
  a19 = v20;
  a20 = v21;
  uint64_t v23 = v22;
  if (qword_1000621C0 != -1) {
    swift_once();
  }
  uint64_t v24 = sub_1000410D0();
  uint64_t v25 = sub_10002A37C(v24, (uint64_t)qword_100064690);
  os_log_type_t v26 = sub_100041370();
  if (os_log_type_enabled(v25, v26))
  {
    uint64_t v27 = (uint8_t *)sub_10000CDEC();
    a10 = sub_10000A780();
    *(_DWORD *)uint64_t v27 = 136315138;
    sub_10002E330(0xD000000000000011, 0x800000010004CE40, &a10);
    sub_10000CE04();
    sub_100041450();
    _os_log_impl((void *)&_mh_execute_header, v25, v26, "EARSpeechRecognizer.%s", v27, 0xCu);
    swift_arrayDestroy();
    sub_10000A754();
    sub_10000A754();
  }

  id v28 = v23;
  sub_10001ABCC((uint64_t)v28);
  uint64_t v29 = sub_10002958C(v28, (SEL *)&selRef_inputOrigin);
  sub_10002A510(v29, v30);
  sub_1000411E0();
  uint64_t v31 = sub_10002A79C();
  sub_10002A7EC(v31, "setInputOrigin:");

  sub_10002A2E0();
}

#error "1000225EC: call analysis failed (funcsize=26)"

void sub_10002261C(uint64_t a1, void (**a2)(void, void))
{
  ((void (**)(void, BOOL))a2)[2](a2, (uint64_t)[*(id *)(a1 + OBJC_IVAR____TtC22localspeechrecognition19EARSpeechRecognizer_userSpeechProfiles) count] > 0);

  _Block_release(a2);
}

void sub_100022698(uint64_t a1, void (**a2)(void, void))
{
  id v3 = [*(id *)(a1 + OBJC_IVAR____TtC22localspeechrecognition19EARSpeechRecognizer_userSpeechProfiles) allValues];
  uint64_t v4 = sub_100041270();

  sub_10001A05C(v4, &v8);
  swift_bridgeObjectRelease();
  if (v9)
  {
    sub_10000CD4C(0, (unint64_t *)&unk_100064178);
    if (swift_dynamicCast())
    {
      id v5 = [v7 experimentIds];
      sub_100041330();
    }
  }
  else
  {
    sub_100008834((uint64_t)&v8, &qword_100064170);
  }
  Class isa = sub_100041320().super.isa;
  ((void (**)(void, Class))a2)[2](a2, isa);
  swift_bridgeObjectRelease();

  _Block_release(a2);
}

void sub_100022810(uint64_t a1, void (**a2)(void, double))
{
  a2[2](a2, *(double *)(a1 + OBJC_IVAR____TtC22localspeechrecognition19EARSpeechRecognizer_modelLoadTime));

  _Block_release(a2);
}

void sub_100022878(void *a1, int a2, void *aBlock, void (*a4)(void))
{
  BOOL v6 = _Block_copy(aBlock);
  _Block_copy(v6);
  id v7 = a1;
  a4();
  _Block_release(v6);
}

#error "100022978: call analysis failed (funcsize=80)"

uint64_t sub_100022A68(uint64_t a1, uint64_t a2)
{
  return sub_10002A538(a1, a2, (SEL *)&selRef_setRightContext_, (uint64_t)"setSelectedText(_:)");
}

uint64_t sub_100022A98(void *a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t, uint64_t))
{
  uint64_t v6 = sub_1000411F0();
  uint64_t v8 = v7;
  id v9 = a1;
  a4(v6, v8);

  return swift_bridgeObjectRelease();
}

uint64_t sub_100022B04(uint64_t a1, uint64_t a2)
{
  return sub_10002A538(a1, a2, (SEL *)&selRef_setSelectedText_, (uint64_t)"ES: Resume Recognition");
}

uint64_t sub_100022B1C(uint64_t a1, uint64_t a2, unint64_t a3, SEL *a4)
{
  uint64_t v7 = v4;
  if (qword_1000621C0 != -1) {
    swift_once();
  }
  uint64_t v8 = sub_1000410D0();
  id v9 = sub_10002A37C(v8, (uint64_t)qword_100064690);
  os_log_type_t v10 = sub_100041370();
  if (os_log_type_enabled(v9, v10))
  {
    os_log_type_t v19 = a4;
    uint64_t v11 = (uint8_t *)sub_10000CDEC();
    uint64_t v20 = sub_10000A780();
    *(_DWORD *)uint64_t v11 = 136315138;
    sub_10002E330(0xD000000000000013, a3, &v20);
    sub_100041450();
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "EARSpeechRecognizer.%s", v11, 0xCu);
    swift_arrayDestroy();
    sub_10000A754();
    a4 = v19;
    sub_10000A754();
  }

  uint64_t v12 = *(void **)(v7 + OBJC_IVAR____TtC22localspeechrecognition19EARSpeechRecognizer_recognizer);
  NSString v13 = sub_1000411E0();
  objc_msgSend(v12, *a4, v13);

  if (qword_1000621B0 != -1) {
    swift_once();
  }
  mach_continuous_time();
  sub_10002A65C();
  return sub_10002A3B0("ES: Resume Recognition", 22, v14, v15, v16, v17);
}

id sub_100022D20(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v69 = a4;
  uint64_t v70 = a2;
  uint64_t v71 = a3;
  uint64_t v72 = a1;
  uint64_t v4 = sub_100040DF0();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v59 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v80 = sub_100040E80();
  uint64_t v83 = *(void *)(v80 - 8);
  uint64_t v8 = __chkstk_darwin(v80);
  uint64_t v68 = (char *)&v59 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __chkstk_darwin(v8);
  double v65 = (char *)&v59 - v11;
  uint64_t v12 = __chkstk_darwin(v10);
  uint64_t v62 = (uint64_t)&v59 - v13;
  uint64_t v14 = __chkstk_darwin(v12);
  uint64_t v64 = (uint64_t)&v59 - v15;
  __chkstk_darwin(v14);
  uint64_t v17 = (char *)&v59 - v16;
  v84[0] = 7562094;
  v84[1] = 0xE300000000000000;
  uint64_t v18 = enum case for URL.DirectoryHint.inferFromPath(_:);
  os_log_type_t v19 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 104);
  unsigned int v75 = enum case for URL.DirectoryHint.inferFromPath(_:);
  v19(v7, enum case for URL.DirectoryHint.inferFromPath(_:), v4);
  uint64_t v79 = v5 + 104;
  id v74 = v19;
  unint64_t v20 = sub_10000F9A8();
  uint64_t v82 = v17;
  unint64_t v21 = v20;
  sub_100040E70();
  NSString v22 = *(void (**)(char *, uint64_t))(v5 + 8);
  v22(v7, v4);
  swift_bridgeObjectRelease();
  v84[0] = 0x616E5F53555F6E65;
  v84[1] = 0xEF6E6F736A2E6770;
  uint64_t v60 = v4;
  v19(v7, v18, v4);
  uint64_t v23 = v64;
  unint64_t v81 = v21;
  sub_100040E70();
  uint64_t v77 = v5 + 8;
  uint64_t v78 = v22;
  v22(v7, v4);
  swift_bridgeObjectRelease();
  uint64_t v24 = self;
  id v73 = v24;
  sub_100040E00();
  Class isa = sub_100041260().super.isa;
  swift_bridgeObjectRelease();
  id v26 = [v24 pathWithComponents:isa];

  uint64_t v27 = sub_1000411F0();
  uint64_t v66 = v28;
  uint64_t v67 = v27;

  uint64_t v29 = *(void (**)(uint64_t, uint64_t))(v83 + 8);
  v83 += 8;
  uint64_t v76 = v29;
  uint64_t v30 = v80;
  v29(v23, v80);
  strcpy((char *)v84, "vocdelta.voc");
  BYTE5(v84[1]) = 0;
  HIWORD(v84[1]) = -5120;
  uint64_t v31 = v75;
  uint64_t v32 = v60;
  uint64_t v33 = v74;
  v74(v7, v75, v60);
  uint64_t v34 = v62;
  sub_100040E70();
  v22(v7, v32);
  swift_bridgeObjectRelease();
  uint64_t v35 = v34;
  sub_100040E00();
  Class v36 = sub_100041260().super.isa;
  swift_bridgeObjectRelease();
  id v37 = v73;
  id v38 = [v73 pathWithComponents:v36];

  uint64_t v64 = sub_1000411F0();
  uint64_t v63 = v39;

  v76(v35, v30);
  v84[0] = 0x636F762E6770;
  v84[1] = 0xE600000000000000;
  uint64_t v40 = v31;
  uint64_t v41 = v32;
  v33(v7, v40, v32);
  id v42 = v65;
  sub_100040E70();
  v78(v7, v32);
  swift_bridgeObjectRelease();
  sub_100040E00();
  Class v43 = sub_100041260().super.isa;
  swift_bridgeObjectRelease();
  id v44 = [v37 pathWithComponents:v43];

  uint64_t v62 = sub_1000411F0();
  uint64_t v61 = v45;

  uint64_t v46 = v80;
  uint64_t v47 = (void (*)(char *, uint64_t))v76;
  v76((uint64_t)v42, v80);
  strcpy((char *)v84, "mrec.psh");
  BYTE1(v84[1]) = 0;
  WORD1(v84[1]) = 0;
  HIDWORD(v84[1]) = -402653184;
  v74(v7, v75, v41);
  id v48 = v68;
  sub_100040E70();
  v78(v7, v41);
  swift_bridgeObjectRelease();
  sub_100040E00();
  Class v49 = sub_100041260().super.isa;
  swift_bridgeObjectRelease();
  id v50 = [v73 pathWithComponents:v49];

  uint64_t v51 = sub_1000411F0();
  uint64_t v53 = v52;

  v47(v48, v46);
  id v54 = objc_allocWithZone((Class)_EARUserProfileBuilder);
  uint64_t v55 = v69;
  swift_bridgeObjectRetain();
  uint64_t v56 = v70;
  swift_bridgeObjectRetain();
  id v57 = sub_1000248CC(v71, v55, v72, v56, 0, 0, 0, v67, v66, v64, v63, v62, v61, v51, v53, 1);
  v47(v82, v46);
  return v57;
}

uint64_t sub_100023464(unint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  objc_allocWithZone((Class)_EARContextualData);
  swift_bridgeObjectRetain();
  id v8 = sub_100024868(a2, a3, (SEL *)&selRef_initWithConfiguration_);
  if (!v8) {
    return 0;
  }
  uint64_t v9 = v8;
  if (!(a1 >> 62))
  {
    uint64_t v10 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (v10) {
      goto LABEL_4;
    }
LABEL_18:
    swift_bridgeObjectRelease();
LABEL_19:
    Class isa = sub_100040E90().super.isa;
    id v41 = [a4 createInlineLmeUserDataForContextData:v9 speechProfile:isa];

    if (v41)
    {
      uint64_t v42 = sub_100040EA0();

      return v42;
    }

    return 0;
  }
  swift_bridgeObjectRetain();
  uint64_t result = sub_1000416B0();
  uint64_t v10 = result;
  if (!result) {
    goto LABEL_18;
  }
LABEL_4:
  if (v10 >= 1)
  {
    Class v43 = a4;
    uint64_t v12 = 0;
    uint64_t v13 = v9;
    do
    {
      if ((a1 & 0xC000000000000001) != 0) {
        id v14 = (id)sub_100041590();
      }
      else {
        id v14 = *(id *)(a1 + 8 * v12 + 32);
      }
      uint64_t v15 = v14;
      sub_100007A58(&qword_100064188);
      uint64_t inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_100046240;
      *(void *)(inited + 32) = sub_1000411F0();
      *(void *)(inited + 40) = v17;
      [v15 sourceFramework];
      Class v18 = sub_100041350().super.super.isa;
      uint64_t v19 = sub_10000CD4C(0, &qword_100063260);
      *(void *)(inited + 72) = v19;
      *(void *)(inited + 48) = v18;
      uint64_t v46 = sub_100041140();
      id v20 = [v15 score];
      if (v20)
      {
        id v21 = v20;
        uint64_t v22 = sub_1000411F0();
        uint64_t v45 = (void *)v19;
        v44[0] = v21;
        sub_10001A0E4((uint64_t)v44, v22, v23);
      }
      id v24 = objc_msgSend(v15, "category", v43);
      if (v24)
      {
        id v25 = v24;
        uint64_t v26 = sub_1000411F0();
        uint64_t v45 = (void *)v19;
        v44[0] = v25;
        sub_10001A0E4((uint64_t)v44, v26, v27);
      }
      uint64_t v28 = sub_10002958C(v15, (SEL *)&selRef_language);
      if (v29)
      {
        uint64_t v30 = v28;
        uint64_t v31 = v29;
        uint64_t v32 = sub_1000411F0();
        uint64_t v45 = &type metadata for String;
        v44[0] = v30;
        v44[1] = v31;
        sub_10001A0E4((uint64_t)v44, v32, v33);
      }
      ++v12;
      id v34 = [v15 content];
      uint64_t v35 = sub_1000411F0();
      uint64_t v37 = v36;

      uint64_t v38 = sub_10001A7FC(v46);
      swift_bridgeObjectRelease();
      uint64_t v39 = v37;
      uint64_t v9 = v13;
      sub_100029374(v35, v39, v38, v13);
    }
    while (v10 != v12);
    swift_bridgeObjectRelease();
    a4 = v43;
    goto LABEL_19;
  }
  __break(1u);
  return result;
}

void sub_100023830()
{
}

void sub_100023870()
{
  sub_100023978();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void sub_100023978()
{
  if (!qword_100064058)
  {
    sub_100040EE0();
    unint64_t v0 = sub_100041440();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_100064058);
    }
  }
}

id sub_1000239D0(void *a1)
{
  uint64_t v3 = qword_1000621C0;
  uint64_t v4 = v1;
  if (v3 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_1000410D0();
  sub_100007B8C(v5, (uint64_t)qword_100064690);
  uint64_t v6 = sub_1000410C0();
  os_log_type_t v7 = sub_100041370();
  if (os_log_type_enabled(v6, v7))
  {
    id v8 = (uint8_t *)swift_slowAlloc();
    uint64_t v13 = swift_slowAlloc();
    *(_DWORD *)id v8 = 136315138;
    sub_10002E330(0x293A5F2874696E69, 0xE800000000000000, &v13);
    sub_100041450();
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "EARSpeechRecognitionAudioBuffer.%s", v8, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  *(void *)&v4[OBJC_IVAR____TtC22localspeechrecognition31EARSpeechRecognitionAudioBuffer_audioBuffer] = a1;
  id v9 = a1;

  uint64_t v10 = (objc_class *)type metadata accessor for EARSpeechRecognitionAudioBuffer();
  v14.receiver = v4;
  v14.Class super_class = v10;
  id v11 = objc_msgSendSuper2(&v14, "init");

  return v11;
}

#error "100023C20: call analysis failed (funcsize=76)"

void sub_100023D70()
{
}

void sub_100023DDC()
{
}

void sub_100023E00()
{
  sub_10002A244();
  uint64_t v2 = v1;
  uint64_t v3 = v0;
  if (qword_1000621C0 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_1000410D0();
  uint64_t v5 = sub_10002A37C(v4, (uint64_t)qword_100064690);
  os_log_type_t v6 = sub_100041370();
  if (os_log_type_enabled(v5, v6))
  {
    os_log_type_t v7 = (uint8_t *)sub_10000CDEC();
    sub_10000A780();
    *(_DWORD *)os_log_type_t v7 = 136315138;
    uint64_t v8 = sub_10002A6D4();
    sub_10002E330(v8, v9, v10);
    sub_10000CE04();
    sub_100041450();
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "EARSpeechRecognitionAudioBuffer.%s", v7, 0xCu);
    swift_arrayDestroy();
    sub_10000A754();
    sub_10000A754();
  }

  [*(id *)(v3 + OBJC_IVAR____TtC22localspeechrecognition31EARSpeechRecognitionAudioBuffer_audioBuffer) *v2];
  sub_10002A260();
}

uint64_t sub_100023F90(float a1)
{
  *(void *)(v2 + 24) = v1;
  *(float *)(v2 + 32) = a1;
  return sub_10002A238((uint64_t)sub_100023FAC);
}

uint64_t sub_100023FAC()
{
  if (qword_1000621C0 != -1) {
    swift_once();
  }
  uint64_t v1 = (uint64_t *)(v0 + 16);
  uint64_t v2 = sub_1000410D0();
  uint64_t v3 = sub_10002A37C(v2, (uint64_t)qword_100064690);
  os_log_type_t v4 = sub_100041370();
  if (os_log_type_enabled(v3, v4))
  {
    sub_10000CDEC();
    uint64_t v14 = sub_10000A780();
    sub_10002A4D8(4.8149e-34);
    *(void *)(v0 + 16) = sub_10002A810((uint64_t)"v28@0:8f16@?<v@?Q>20", v14);
    sub_100041450();
    sub_10002A4A0((void *)&_mh_execute_header, v3, v5, "EARSpeechRecognitionAudioBuffer.%s");
    swift_arrayDestroy();
    sub_10000A754();
    sub_10000A754();
  }

  LODWORD(v6) = *(_DWORD *)(v0 + 32);
  id v7 = [*(id *)(*(void *)(v0 + 24)+ OBJC_IVAR____TtC22localspeechrecognition31EARSpeechRecognitionAudioBuffer_audioBuffer) packetArrivalTimestampFromAudioTime:v6];
  uint64_t v8 = sub_1000410C0();
  os_log_type_t v9 = sub_100041370();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = swift_slowAlloc();
    uint64_t v11 = sub_10000A780();
    *(_DWORD *)uint64_t v10 = 136315394;
    *uint64_t v1 = sub_10002A810((uint64_t)"v28@0:8f16@?<v@?Q>20", v11);
    sub_10002A7E0();
    sub_100041450();
    *(_WORD *)(v10 + 12) = 2048;
    *uint64_t v1 = (uint64_t)v7;
    sub_10002A7E0();
    sub_100041450();
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "EARSpeechRecognitionAudioBuffer.%s replying %llu", (uint8_t *)v10, 0x16u);
    swift_arrayDestroy();
    sub_10000A754();
    sub_10000A754();
  }

  uint64_t v12 = *(uint64_t (**)(id))(v0 + 8);
  return v12(v7);
}

uint64_t sub_1000242B0(const void *a1, void *a2, float a3)
{
  v3[2] = a2;
  v3[3] = _Block_copy(a1);
  a2;
  double v6 = (void *)swift_task_alloc();
  v3[4] = v6;
  *double v6 = v3;
  v6[1] = sub_100024368;
  return sub_100023F90(a3);
}

uint64_t sub_100024368()
{
  sub_1000150D0();
  uint64_t v2 = *(const void **)(v1 + 24);
  uint64_t v3 = *(void **)(v1 + 16);
  uint64_t v4 = *v0;
  sub_1000150FC();
  *uint64_t v5 = v4;
  swift_task_dealloc();

  uint64_t v6 = sub_10002A494();
  v7(v6);
  _Block_release(v2);
  sub_100015130();
  return v8();
}

uint64_t sub_10002447C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100007A58(&qword_100063DF8);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100041310();
  sub_10000A374((uint64_t)v6, 1, 1, v7);
  uint64_t v8 = (void *)swift_allocObject();
  v8[2] = 0;
  v8[3] = 0;
  v8[4] = a1;
  v8[5] = a2;
  os_log_type_t v9 = (void *)swift_allocObject();
  v9[2] = 0;
  v9[3] = 0;
  v9[4] = &unk_100064118;
  v9[5] = v8;
  sub_100024C24((uint64_t)v6, (uint64_t)&unk_100064128, (uint64_t)v9);
  return swift_release();
}

void sub_100024580()
{
}

id sub_1000245C0()
{
  v2.receiver = v0;
  v2.Class super_class = (Class)type metadata accessor for EARSpeechRecognitionAudioBuffer();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for EARSpeechRecognitionAudioBuffer()
{
  return self;
}

id sub_100024628(uint64_t a1, uint64_t a2)
{
  return sub_100024868(a1, a2, (SEL *)&selRef_initWithConfiguration_);
}

id sub_100024634(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, uint64_t a8, __int16 a9, void *a10, uint64_t a11, char a12)
{
  NSString v26 = sub_1000411E0();
  swift_bridgeObjectRelease();
  if (a3)
  {
    v24.super.Class isa = sub_100041120().super.isa;
    swift_bridgeObjectRelease();
    if (a4) {
      goto LABEL_3;
    }
LABEL_6:
    v15.super.Class isa = 0;
    if (a6) {
      goto LABEL_4;
    }
    goto LABEL_7;
  }
  v24.super.Class isa = 0;
  if (!a4) {
    goto LABEL_6;
  }
LABEL_3:
  v15.super.Class isa = sub_100041260().super.isa;
  swift_bridgeObjectRelease();
  if (a6)
  {
LABEL_4:
    NSString v16 = sub_1000411E0();
    swift_bridgeObjectRelease();
    goto LABEL_8;
  }
LABEL_7:
  NSString v16 = 0;
LABEL_8:
  if (a8)
  {
    v17.super.Class isa = sub_100041120().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v17.super.Class isa = 0;
  }
  id v29 = 0;
  LOBYTE(v23) = a12 & 1;
  LOWORD(v22) = a9 & 0x101;
  id v18 = objc_msgSend(v27, "initWithConfig:overrides:overrideConfigFiles:language:activeConfiguration:modelLoadingOptions:enableSpeakerCodeTraining:supportEmojiRecognition:voiceCommandActiveSet:modelContextDelegate:enableItn:error:", v26, v24.super.isa, v15.super.isa, v16, a7, v17.super.isa, v22, a10, a11, v23, &v29);

  if (v18)
  {
    id v19 = v29;
  }
  else
  {
    id v20 = v29;
    sub_100040DE0();

    swift_willThrow();
  }

  swift_unknownObjectRelease();
  return v18;
}

id sub_100024868(uint64_t a1, uint64_t a2, SEL *a3)
{
  if (a2)
  {
    NSString v5 = sub_1000411E0();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v5 = 0;
  }
  id v6 = objc_msgSend(v3, *a3, v5);

  return v6;
}

id sub_1000248CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16)
{
  NSString v28 = sub_1000411E0();
  swift_bridgeObjectRelease();
  NSString v18 = sub_1000411E0();
  swift_bridgeObjectRelease();
  if (a5)
  {
    v19.super.Class isa = sub_100041120().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v19.super.Class isa = 0;
  }
  if (a7)
  {
    NSString v20 = sub_1000411E0();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v20 = 0;
  }
  NSString v21 = sub_1000411E0();
  swift_bridgeObjectRelease();
  NSString v22 = sub_1000411E0();
  swift_bridgeObjectRelease();
  NSString v23 = sub_1000411E0();
  swift_bridgeObjectRelease();
  NSString v24 = sub_1000411E0();
  swift_bridgeObjectRelease();
  LOBYTE(v27) = a16 & 1;
  id v25 = [v29 initWithConfiguration:v28 language:v18 overrides:v19.super.isa textNormalizationModelRoot:v20 sdapiOverrides:v21 emptyVoc:v22 pgVoc:v23 paramsetHolder:v24 isJit:v27];

  return v25;
}

uint64_t sub_100024A8C(uint64_t a1, uint64_t a2, int *a3)
{
  id v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v4;
  *uint64_t v4 = v3;
  v4[1] = sub_10002A21C;
  return v6();
}

uint64_t sub_100024B58(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  NSString v5 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v5;
  *NSString v5 = v4;
  v5[1] = sub_10002A21C;
  return v7();
}

uint64_t sub_100024C24(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100041310();
  if (sub_100007B04(a1, 1, v6) == 1)
  {
    sub_100008834(a1, &qword_100063DF8);
  }
  else
  {
    sub_100041300();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(a1, v6);
  }
  if (*(void *)(a3 + 16))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_1000412D0();
    swift_unknownObjectRelease();
  }
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = a2;
  *(void *)(v7 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_100024D94(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_100024E70;
  return v6(a1);
}

uint64_t sub_100024E70()
{
  sub_10002A650();
  sub_1000150D0();
  uint64_t v1 = *v0;
  sub_1000150FC();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(void))(v1 + 8);
  return v3();
}

char *sub_100024F38(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *(void *)(a4 + 24);
    uint64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        uint64_t v7 = a2;
      }
    }
  }
  else
  {
    uint64_t v7 = a2;
  }
  uint64_t v8 = *(void *)(a4 + 16);
  if (v7 <= v8) {
    uint64_t v9 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    sub_100007A58(&qword_100063558);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 16);
  }
  else
  {
    uint64_t v10 = (char *)_swiftEmptyArrayStorage;
  }
  uint64_t v12 = v10 + 32;
  if (v5)
  {
    sub_10002E038((char *)(a4 + 32), v8, v12);
    *(void *)(a4 + 16) = 0;
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_100025028(0, v8, (unint64_t)v12, a4);
  }
  return v10;
}

uint64_t sub_100025028(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  uint64_t result = sub_100041700();
  __break(1u);
  return result;
}

uint64_t sub_100025120()
{
  _Block_release(*(const void **)(v0 + 24));

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_100025160()
{
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)sub_10002A580(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_10002520C;
  uint64_t v3 = sub_10002A494();
  return v4(v3);
}

uint64_t sub_10002520C()
{
  sub_10002A650();
  sub_1000150D0();
  uint64_t v1 = *v0;
  sub_1000150FC();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  sub_100015130();
  return v3();
}

uint64_t sub_1000252D0()
{
  uint64_t v1 = v0[2];
  uint64_t v2 = v0[3];
  uint64_t v3 = (int *)v0[4];
  uint64_t v4 = swift_task_alloc();
  uint64_t v5 = (void *)sub_10002A580(v4);
  *uint64_t v5 = v6;
  v5[1] = sub_10002A21C;
  uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_100064110 + dword_100064110);
  return v7(v1, v2, v3);
}

uint64_t sub_100025390()
{
  swift_unknownObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_1000253D0()
{
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)sub_10002A580(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_10002A21C;
  uint64_t v3 = sub_10002A61C();
  return v4(v3);
}

uint64_t sub_100025488()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_1000254C0(uint64_t a1)
{
  uint64_t v3 = *(int **)(v1 + 16);
  uint64_t v4 = swift_task_alloc();
  uint64_t v5 = (void *)sub_10002A580(v4);
  *uint64_t v5 = v6;
  v5[1] = sub_10002A21C;
  uint64_t v7 = (uint64_t (*)(uint64_t, int *))((char *)&dword_100064130 + dword_100064130);
  return v7(a1, v3);
}

void sub_100025574(char a1, uint64_t a2, char a3)
{
  sub_10002EB30(a1, a2, a3, *v3);
  *uint64_t v3 = v4;
}

void sub_100025594(char a1, uint64_t a2, char a3)
{
  sub_10002EBF0(a1, a2, a3, *v3);
  *uint64_t v3 = v4;
}

void sub_1000255B4(char a1, uint64_t a2, char a3)
{
  sub_10002EBFC(a1, a2, a3, *v3);
  *uint64_t v3 = v4;
}

unint64_t sub_1000255D4(uint64_t a1, uint64_t a2)
{
  sub_100041780();
  sub_100041220();
  Swift::Int v4 = sub_1000417A0();

  return sub_100025690(a1, a2, v4);
}

unint64_t sub_10002564C(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = sub_100041400(*(void *)(v2 + 40));

  return sub_100025774(a1, v4);
}

unint64_t sub_100025690(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_100041720() & 1) == 0)
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
      while (!v14 && (sub_100041720() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_100025774(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t i = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i))
  {
    sub_10000CD4C(0, (unint64_t *)&qword_100063E40);
    id v6 = *(id *)(*(void *)(v2 + 48) + 8 * i);
    char v7 = sub_100041410();

    if ((v7 & 1) == 0)
    {
      uint64_t v8 = ~v4;
      for (unint64_t i = (i + 1) & v8; ((*(void *)(v3 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i) & 1) != 0; unint64_t i = (i + 1) & v8)
      {
        id v9 = *(id *)(*(void *)(v2 + 48) + 8 * i);
        char v10 = sub_100041410();

        if (v10) {
          break;
        }
      }
    }
  }
  return i;
}

uint64_t sub_100025890(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  swift_bridgeObjectRetain();
  unint64_t v6 = sub_1000255D4(a1, a2);
  LOBYTE(a2) = v7;
  swift_bridgeObjectRelease();
  if ((a2 & 1) == 0) {
    return 0;
  }
  swift_isUniquelyReferenced_nonNull_native();
  sub_10002A27C();
  sub_100007A58(&qword_100064210);
  sub_10002A45C();
  swift_bridgeObjectRelease();
  uint64_t v8 = *(void *)(*(void *)(v10 + 56) + 16 * v6);
  sub_10002A5CC();
  sub_100041640();
  *uint64_t v3 = v10;
  swift_bridgeObjectRelease();
  return v8;
}

void sub_100025978(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, Swift::Int a10)
{
  sub_10002A34C();
  sub_10002A6F8();
  if (v13)
  {
    swift_bridgeObjectRetain();
    unint64_t v21 = sub_10002564C((uint64_t)v12);
    char v23 = v22;
    swift_bridgeObjectRelease();
    if ((v23 & 1) == 0)
    {
LABEL_8:
      sub_10002A2E0();
      return;
    }
    swift_isUniquelyReferenced_nonNull_native();
    sub_10002A27C();
    sub_100007A58(&qword_100064220);
    sub_10002A45C();

    sub_10002A4BC();
    type metadata accessor for EARLanguageDetectorAudioBuffer();
    sub_10002A688((unint64_t *)&qword_100063240);
    sub_100041640();
    *uint64_t v10 = a10;
LABEL_7:
    swift_bridgeObjectRelease();
    goto LABEL_8;
  }
  sub_10002A668();
  id v14 = v12;
  uint64_t v15 = sub_100041670();

  if (!v15) {
    goto LABEL_7;
  }
  swift_unknownObjectRelease();
  uint64_t v16 = sub_100041660();
  Swift::Int v17 = sub_10002649C(v11, v16, &qword_100064228, 0, (void (*)(uint64_t))type metadata accessor for EARLanguageDetectorAudioBuffer);
  swift_retain();
  unint64_t v18 = sub_10002564C((uint64_t)v14);
  char v20 = v19;
  swift_release();
  if (v20)
  {

    sub_10002A4BC();
    type metadata accessor for EARLanguageDetectorAudioBuffer();
    sub_10002A688((unint64_t *)&qword_100063240);
    sub_100041640();
    *uint64_t v10 = v17;
    goto LABEL_7;
  }
  __break(1u);
}

void sub_100025B5C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, Swift::Int a10)
{
  sub_10002A34C();
  sub_10002A6F8();
  if (v13)
  {
    swift_bridgeObjectRetain();
    unint64_t v21 = sub_10002564C((uint64_t)v12);
    char v23 = v22;
    swift_bridgeObjectRelease();
    if ((v23 & 1) == 0)
    {
LABEL_8:
      sub_10002A2E0();
      return;
    }
    swift_isUniquelyReferenced_nonNull_native();
    sub_10002A27C();
    sub_100007A58(&qword_1000641C8);
    sub_10002A45C();

    sub_10002A4BC();
    sub_10002A688((unint64_t *)&qword_100063240);
    sub_100041640();
    *uint64_t v10 = a10;
LABEL_7:
    swift_bridgeObjectRelease();
    goto LABEL_8;
  }
  sub_10002A668();
  id v14 = v12;
  uint64_t v15 = sub_100041670();

  if (!v15) {
    goto LABEL_7;
  }
  swift_unknownObjectRelease();
  uint64_t v16 = sub_100041660();
  Swift::Int v17 = sub_100026298(v11, v16);
  swift_retain();
  unint64_t v18 = sub_10002564C((uint64_t)v14);
  char v20 = v19;
  swift_release();
  if (v20)
  {

    sub_10002A4BC();
    sub_10002A688((unint64_t *)&qword_100063240);
    sub_100041640();
    *uint64_t v10 = v17;
    goto LABEL_7;
  }
  __break(1u);
}

double sub_100025D18@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  uint64_t v4 = v3;
  swift_bridgeObjectRetain();
  unint64_t v8 = sub_1000255D4(a1, a2);
  LOBYTE(a2) = v9;
  swift_bridgeObjectRelease();
  if (a2)
  {
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v14 = *v4;
    uint64_t v11 = *v4;
    *uint64_t v4 = 0x8000000000000000;
    Swift::Int v12 = *(void *)(v11 + 24);
    sub_100007A58(&qword_100064190);
    sub_100041620(isUniquelyReferenced_nonNull_native, v12);
    swift_bridgeObjectRelease();
    sub_100029B30((_OWORD *)(*(void *)(v14 + 56) + 32 * v8), a3);
    sub_100041640();
    *uint64_t v4 = v14;
    swift_bridgeObjectRelease();
  }
  else
  {
    double result = 0.0;
    *a3 = 0u;
    a3[1] = 0u;
  }
  return result;
}

uint64_t sub_100025E50(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = *v1;
  if ((v4 & 0xC000000000000001) == 0)
  {
    swift_bridgeObjectRetain();
    unint64_t v16 = sub_10002564C((uint64_t)a1);
    char v18 = v17;
    swift_bridgeObjectRelease();
    if (v18)
    {
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      Swift::Int v22 = *v2;
      Swift::Int v20 = *v2;
      *uint64_t v2 = 0x8000000000000000;
      Swift::Int v21 = *(void *)(v20 + 24);
      sub_100007A58(&qword_100064150);
      sub_100041620(isUniquelyReferenced_nonNull_native, v21);

      uint64_t v15 = *(void *)(*(void *)(v22 + 56) + 8 * v16);
      sub_10000CD4C(0, (unint64_t *)&qword_100063E40);
      type metadata accessor for EARSpeechRecognitionAudioBuffer();
      sub_100029DD0((unint64_t *)&qword_100063240, (unint64_t *)&qword_100063E40);
      sub_100041640();
      *uint64_t v2 = v22;
      goto LABEL_10;
    }
    return 0;
  }
  if (v4 < 0) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = v4 & 0xFFFFFFFFFFFFFF8;
  }
  swift_bridgeObjectRetain();
  id v6 = a1;
  uint64_t v7 = sub_100041670();

  if (!v7)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  swift_unknownObjectRelease();
  uint64_t v8 = sub_100041660();
  Swift::Int v10 = sub_10002649C(v5, v8, (uint64_t *)&unk_100064158, v9, (void (*)(uint64_t))type metadata accessor for EARSpeechRecognitionAudioBuffer);
  swift_retain();
  unint64_t v11 = sub_10002564C((uint64_t)v6);
  char v13 = v12;
  uint64_t result = swift_release();
  if (v13)
  {

    uint64_t v15 = *(void *)(*(void *)(v10 + 56) + 8 * v11);
    sub_10000CD4C(0, (unint64_t *)&qword_100063E40);
    type metadata accessor for EARSpeechRecognitionAudioBuffer();
    sub_100029DD0((unint64_t *)&qword_100063240, (unint64_t *)&qword_100063E40);
    sub_100041640();
    *uint64_t v2 = v10;
LABEL_10:
    swift_bridgeObjectRelease();
    return v15;
  }
  __break(1u);
  return result;
}

uint64_t sub_1000260A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, Swift::Int a10)
{
  return sub_1000261EC(a1, a2, (uint64_t)&unk_100064220, (uint64_t)&unk_100064228, 0, (uint64_t)type metadata accessor for EARLanguageDetectorAudioBuffer, a7, a8, a9, a10);
}

uint64_t sub_1000260CC(uint64_t a1, void *a2)
{
  if ((*v2 & 0xC000000000000001) != 0)
  {
    uint64_t result = sub_10002A830();
    if (__OFADD__(result, 1))
    {
      __break(1u);
      return result;
    }
    *uint64_t v2 = sub_100026298((uint64_t)v2, result + 1);
  }
  swift_isUniquelyReferenced_nonNull_native();
  sub_10002A4F4();
  sub_100026FA8(a1, a2, v6);
  *uint64_t v2 = v7;

  return swift_bridgeObjectRelease();
}

uint64_t sub_10002615C(_OWORD *a1, uint64_t a2, uint64_t a3)
{
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v9 = *v3;
  *uint64_t v3 = 0x8000000000000000;
  sub_1000270D0(a1, a2, a3, isUniquelyReferenced_nonNull_native);
  *uint64_t v3 = v9;

  return swift_bridgeObjectRelease();
}

uint64_t sub_1000261EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, Swift::Int a10)
{
  sub_10002A34C();
  if ((*v10 & 0xC000000000000001) != 0)
  {
    uint64_t v14 = v13;
    uint64_t v15 = v12;
    unint64_t v16 = v11;
    uint64_t result = sub_10002A830();
    if (__OFADD__(result, 1))
    {
      __break(1u);
      return result;
    }
    *Swift::Int v10 = sub_10002649C((uint64_t)v10, result + 1, v16, v15, v14);
  }
  swift_isUniquelyReferenced_nonNull_native();
  sub_10002A4F4();
  sub_10002A6D4();
  sub_100027210();
  *Swift::Int v10 = a10;
  sub_10002A2E0();
  return swift_bridgeObjectRelease();
}

Swift::Int sub_100026298(uint64_t a1, uint64_t a2)
{
  if (!a2)
  {
    swift_unknownObjectRelease();
    return (Swift::Int)&_swiftEmptyDictionarySingleton;
  }
  sub_100007A58(&qword_1000641D0);
  uint64_t v2 = sub_1000416E0();
  uint64_t v19 = v2;
  sub_100041650();
  if (!sub_100041680())
  {
LABEL_16:
    swift_release();
    return v2;
  }
  uint64_t v4 = v3;
  sub_10000CD4C(0, (unint64_t *)&qword_100063E40);
  while (1)
  {
    swift_dynamicCast();
    uint64_t v2 = v19;
    unint64_t v5 = *(void *)(v19 + 16);
    if (*(void *)(v19 + 24) <= v5)
    {
      sub_100026974(v5 + 1, 1);
      uint64_t v2 = v19;
    }
    Swift::Int result = sub_100041400(*(void *)(v2 + 40));
    uint64_t v7 = v2 + 64;
    uint64_t v8 = -1 << *(unsigned char *)(v2 + 32);
    unint64_t v9 = result & ~v8;
    unint64_t v10 = v9 >> 6;
    if (((-1 << v9) & ~*(void *)(v2 + 64 + 8 * (v9 >> 6))) == 0) {
      break;
    }
    unint64_t v11 = __clz(__rbit64((-1 << v9) & ~*(void *)(v2 + 64 + 8 * (v9 >> 6)))) | v9 & 0x7FFFFFFFFFFFFFC0;
LABEL_15:
    *(void *)(v7 + ((v11 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v11;
    *(void *)(*(void *)(v2 + 48) + 8 * v11) = v18;
    *(void *)(*(void *)(v2 + 56) + 8 * v11) = v4;
    ++*(void *)(v2 + 16);
    uint64_t v16 = sub_100041680();
    uint64_t v4 = v17;
    if (!v16) {
      goto LABEL_16;
    }
  }
  char v12 = 0;
  unint64_t v13 = (unint64_t)(63 - v8) >> 6;
  while (++v10 != v13 || (v12 & 1) == 0)
  {
    BOOL v14 = v10 == v13;
    if (v10 == v13) {
      unint64_t v10 = 0;
    }
    v12 |= v14;
    uint64_t v15 = *(void *)(v7 + 8 * v10);
    if (v15 != -1)
    {
      unint64_t v11 = __clz(__rbit64(~v15)) + (v10 << 6);
      goto LABEL_15;
    }
  }
  __break(1u);
  return result;
}

Swift::Int sub_10002649C(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4, void (*a5)(uint64_t))
{
  if (!a2)
  {
    swift_unknownObjectRelease();
    return (Swift::Int)&_swiftEmptyDictionarySingleton;
  }
  sub_100007A58(a3);
  uint64_t v7 = sub_1000416E0();
  uint64_t v21 = v7;
  sub_100041650();
  uint64_t v8 = sub_100041680();
  if (!v8)
  {
LABEL_16:
    swift_release();
    return v7;
  }
  uint64_t v9 = v8;
  sub_10000CD4C(0, (unint64_t *)&qword_100063E40);
  while (1)
  {
    swift_dynamicCast();
    a5(a4);
    swift_dynamicCast();
    uint64_t v7 = v21;
    if (*(void *)(v21 + 24) <= *(void *)(v21 + 16))
    {
      sub_100026C3C();
      uint64_t v7 = v21;
    }
    Swift::Int result = sub_100041400(*(void *)(v7 + 40));
    uint64_t v11 = v7 + 64;
    uint64_t v12 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v13 = result & ~v12;
    unint64_t v14 = v13 >> 6;
    if (((-1 << v13) & ~*(void *)(v7 + 64 + 8 * (v13 >> 6))) == 0) {
      break;
    }
    unint64_t v15 = __clz(__rbit64((-1 << v13) & ~*(void *)(v7 + 64 + 8 * (v13 >> 6)))) | v13 & 0x7FFFFFFFFFFFFFC0;
LABEL_15:
    *(void *)(v11 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
    *(void *)(*(void *)(v7 + 48) + 8 * v15) = v20;
    *(void *)(*(void *)(v7 + 56) + 8 * v15) = v9;
    ++*(void *)(v7 + 16);
    uint64_t v9 = sub_100041680();
    if (!v9) {
      goto LABEL_16;
    }
  }
  char v16 = 0;
  unint64_t v17 = (unint64_t)(63 - v12) >> 6;
  while (++v14 != v17 || (v16 & 1) == 0)
  {
    BOOL v18 = v14 == v17;
    if (v14 == v17) {
      unint64_t v14 = 0;
    }
    v16 |= v18;
    uint64_t v19 = *(void *)(v11 + 8 * v14);
    if (v19 != -1)
    {
      unint64_t v15 = __clz(__rbit64(~v19)) + (v14 << 6);
      goto LABEL_15;
    }
  }
  __break(1u);
  return result;
}

void sub_1000266D8(uint64_t a1, char a2)
{
  uint64_t v4 = v2;
  sub_10002A770();
  sub_100007A58(&qword_100064218);
  char v44 = a2;
  char v6 = (void *)sub_1000416D0();
  if (!v3[2]) {
    goto LABEL_39;
  }
  sub_10002A58C();
  Class v43 = v9;
  if (v7 < 64) {
    uint64_t v10 = ~(-1 << v7);
  }
  else {
    uint64_t v10 = -1;
  }
  unint64_t v11 = v10 & v8;
  id v41 = v2;
  int64_t v42 = (unint64_t)(v7 + 63) >> 6;
  uint64_t v12 = v6 + 8;
  swift_retain();
  int64_t v13 = 0;
  if (!v11) {
    goto LABEL_7;
  }
LABEL_6:
  unint64_t v14 = __clz(__rbit64(v11));
  v11 &= v11 - 1;
  for (unint64_t i = v14 | (v13 << 6); ; unint64_t i = __clz(__rbit64(v18)) + (v13 << 6))
  {
    uint64_t v20 = (uint64_t *)(v3[6] + 16 * i);
    uint64_t v22 = *v20;
    uint64_t v21 = v20[1];
    char v23 = (uint64_t *)(v3[7] + 16 * i);
    uint64_t v24 = *v23;
    uint64_t v25 = v23[1];
    if ((v44 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    sub_100041780();
    sub_100041220();
    sub_1000417A0();
    sub_10002A744();
    if (((v28 << v27) & ~v12[v26]) == 0)
    {
      sub_10002A408();
      while (++v30 != v31 || (v29 & 1) == 0)
      {
        BOOL v32 = v30 == v31;
        if (v30 == v31) {
          uint64_t v30 = 0;
        }
        v29 |= v32;
        if (v12[v30] != -1)
        {
          sub_10002A3F4();
          goto LABEL_30;
        }
      }
      __break(1u);
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return;
    }
    sub_10002A41C();
LABEL_30:
    sub_10002A3E0();
    *(void *)((char *)v12 + v33) |= v34;
    uint64_t v36 = (void *)(v6[6] + 16 * v35);
    *uint64_t v36 = v22;
    v36[1] = v21;
    uint64_t v37 = (void *)(v6[7] + 16 * v35);
    *uint64_t v37 = v24;
    v37[1] = v25;
    ++v6[2];
    if (v11) {
      goto LABEL_6;
    }
LABEL_7:
    int64_t v16 = v13 + 1;
    if (__OFADD__(v13, 1)) {
      goto LABEL_41;
    }
    if (v16 >= v42)
    {
      swift_release();
      uint64_t v4 = v41;
      unint64_t v17 = v43;
      goto LABEL_34;
    }
    unint64_t v17 = v43;
    unint64_t v18 = v43[v16];
    ++v13;
    if (!v18)
    {
      int64_t v13 = v16 + 1;
      if (v16 + 1 >= v42) {
        goto LABEL_32;
      }
      unint64_t v18 = v43[v13];
      if (!v18) {
        break;
      }
    }
LABEL_18:
    unint64_t v11 = (v18 - 1) & v18;
  }
  int64_t v19 = v16 + 2;
  if (v19 < v42)
  {
    unint64_t v18 = v43[v19];
    if (!v18)
    {
      while (1)
      {
        int64_t v13 = v19 + 1;
        if (__OFADD__(v19, 1)) {
          goto LABEL_42;
        }
        if (v13 >= v42) {
          goto LABEL_32;
        }
        unint64_t v18 = v43[v13];
        ++v19;
        if (v18) {
          goto LABEL_18;
        }
      }
    }
    int64_t v13 = v19;
    goto LABEL_18;
  }
LABEL_32:
  swift_release();
  uint64_t v4 = v41;
LABEL_34:
  if (v44)
  {
    sub_10002A6B4();
    if (v39 != v40) {
      *unint64_t v17 = -1 << v38;
    }
    else {
      sub_10002A724(v38);
    }
    v3[2] = 0;
  }
LABEL_39:
  swift_release();
  *uint64_t v4 = v6;
}

uint64_t sub_100026974(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_100007A58(&qword_1000641D0);
  uint64_t v6 = sub_1000416D0();
  uint64_t v7 = v6;
  if (*(void *)(v5 + 16))
  {
    uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
    uint64_t v33 = v2;
    uint64_t v34 = v5 + 64;
    if (v8 < 64) {
      uint64_t v9 = ~(-1 << v8);
    }
    else {
      uint64_t v9 = -1;
    }
    unint64_t v10 = v9 & *(void *)(v5 + 64);
    int64_t v11 = (unint64_t)(v8 + 63) >> 6;
    uint64_t v12 = v6 + 64;
    uint64_t result = swift_retain();
    int64_t v14 = 0;
    if (!v10) {
      goto LABEL_7;
    }
LABEL_6:
    unint64_t v15 = __clz(__rbit64(v10));
    v10 &= v10 - 1;
    for (unint64_t i = v15 | (v14 << 6); ; unint64_t i = __clz(__rbit64(v19)) + (v14 << 6))
    {
      uint64_t v21 = *(void **)(*(void *)(v5 + 48) + 8 * i);
      uint64_t v22 = *(void *)(*(void *)(v5 + 56) + 8 * i);
      if ((a2 & 1) == 0)
      {
        id v23 = v21;
        swift_unknownObjectRetain();
      }
      uint64_t result = sub_100041400(*(void *)(v7 + 40));
      uint64_t v24 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v25 = result & ~v24;
      unint64_t v26 = v25 >> 6;
      if (((-1 << v25) & ~*(void *)(v12 + 8 * (v25 >> 6))) == 0)
      {
        char v28 = 0;
        unint64_t v29 = (unint64_t)(63 - v24) >> 6;
        while (++v26 != v29 || (v28 & 1) == 0)
        {
          BOOL v30 = v26 == v29;
          if (v26 == v29) {
            unint64_t v26 = 0;
          }
          v28 |= v30;
          uint64_t v31 = *(void *)(v12 + 8 * v26);
          if (v31 != -1)
          {
            unint64_t v27 = __clz(__rbit64(~v31)) + (v26 << 6);
            goto LABEL_30;
          }
        }
        __break(1u);
LABEL_41:
        __break(1u);
LABEL_42:
        __break(1u);
        return result;
      }
      unint64_t v27 = __clz(__rbit64((-1 << v25) & ~*(void *)(v12 + 8 * (v25 >> 6)))) | v25 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
      *(void *)(v12 + ((v27 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v27;
      *(void *)(*(void *)(v7 + 48) + 8 * v27) = v21;
      *(void *)(*(void *)(v7 + 56) + 8 * v27) = v22;
      ++*(void *)(v7 + 16);
      if (v10) {
        goto LABEL_6;
      }
LABEL_7:
      int64_t v17 = v14 + 1;
      if (__OFADD__(v14, 1)) {
        goto LABEL_41;
      }
      if (v17 >= v11) {
        break;
      }
      unint64_t v18 = (void *)(v5 + 64);
      unint64_t v19 = *(void *)(v34 + 8 * v17);
      ++v14;
      if (!v19)
      {
        int64_t v14 = v17 + 1;
        if (v17 + 1 >= v11) {
          goto LABEL_32;
        }
        unint64_t v19 = *(void *)(v34 + 8 * v14);
        if (!v19)
        {
          int64_t v20 = v17 + 2;
          if (v20 >= v11)
          {
LABEL_32:
            swift_release();
            uint64_t v3 = v33;
            if ((a2 & 1) == 0) {
              goto LABEL_39;
            }
            goto LABEL_35;
          }
          unint64_t v19 = *(void *)(v34 + 8 * v20);
          if (!v19)
          {
            while (1)
            {
              int64_t v14 = v20 + 1;
              if (__OFADD__(v20, 1)) {
                goto LABEL_42;
              }
              if (v14 >= v11) {
                goto LABEL_32;
              }
              unint64_t v19 = *(void *)(v34 + 8 * v14);
              ++v20;
              if (v19) {
                goto LABEL_18;
              }
            }
          }
          int64_t v14 = v20;
        }
      }
LABEL_18:
      unint64_t v10 = (v19 - 1) & v19;
    }
    swift_release();
    uint64_t v3 = v33;
    unint64_t v18 = (void *)(v5 + 64);
    if ((a2 & 1) == 0) {
      goto LABEL_39;
    }
LABEL_35:
    uint64_t v32 = 1 << *(unsigned char *)(v5 + 32);
    if (v32 >= 64) {
      sub_10002ECD0(0, (unint64_t)(v32 + 63) >> 6, v18);
    }
    else {
      *unint64_t v18 = -1 << v32;
    }
    *(void *)(v5 + 16) = 0;
  }
LABEL_39:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

void sub_100026C3C()
{
  sub_10002A244();
  uint64_t v2 = v0;
  char v4 = v3;
  sub_10002A770();
  sub_100007A58(v5);
  uint64_t v6 = sub_1000416D0();
  if (v1[2])
  {
    sub_10002A58C();
    uint64_t v36 = v0;
    uint64_t v37 = v9;
    if (v7 < 64) {
      uint64_t v10 = ~(-1 << v7);
    }
    else {
      uint64_t v10 = -1;
    }
    unint64_t v11 = v10 & v8;
    int64_t v12 = (unint64_t)(v7 + 63) >> 6;
    uint64_t v13 = v6 + 64;
    swift_retain();
    int64_t v14 = 0;
    if (!v11) {
      goto LABEL_7;
    }
LABEL_6:
    unint64_t v15 = __clz(__rbit64(v11));
    v11 &= v11 - 1;
    for (unint64_t i = v15 | (v14 << 6); ; unint64_t i = __clz(__rbit64(v19)) + (v14 << 6))
    {
      uint64_t v21 = *(void **)(v1[6] + 8 * i);
      uint64_t v22 = *(void **)(v1[7] + 8 * i);
      if ((v4 & 1) == 0)
      {
        id v23 = v21;
        id v24 = v22;
      }
      unint64_t v25 = sub_100041400(*(void *)(v6 + 40)) & ~(-1 << *(unsigned char *)(v6 + 32));
      if (((-1 << v25) & ~*(void *)(v13 + 8 * (v25 >> 6))) == 0)
      {
        sub_10002A408();
        while (++v27 != v28 || (v26 & 1) == 0)
        {
          BOOL v29 = v27 == v28;
          if (v27 == v28) {
            uint64_t v27 = 0;
          }
          v26 |= v29;
          if (*(void *)(v13 + 8 * v27) != -1)
          {
            sub_10002A3F4();
            goto LABEL_30;
          }
        }
        __break(1u);
LABEL_41:
        __break(1u);
LABEL_42:
        __break(1u);
        return;
      }
      sub_10002A41C();
LABEL_30:
      sub_10002A3E0();
      *(void *)(v13 + v30) |= v31;
      *(void *)(*(void *)(v6 + 48) + 8 * v32) = v21;
      *(void *)(*(void *)(v6 + 56) + 8 * v32) = v22;
      ++*(void *)(v6 + 16);
      if (v11) {
        goto LABEL_6;
      }
LABEL_7:
      int64_t v17 = v14 + 1;
      if (__OFADD__(v14, 1)) {
        goto LABEL_41;
      }
      if (v17 >= v12) {
        break;
      }
      unint64_t v18 = v37;
      unint64_t v19 = v37[v17];
      ++v14;
      if (!v19)
      {
        int64_t v14 = v17 + 1;
        if (v17 + 1 >= v12) {
          goto LABEL_32;
        }
        unint64_t v19 = v37[v14];
        if (!v19)
        {
          int64_t v20 = v17 + 2;
          if (v20 >= v12)
          {
LABEL_32:
            swift_release();
            uint64_t v2 = v36;
            if ((v4 & 1) == 0) {
              goto LABEL_39;
            }
            goto LABEL_35;
          }
          unint64_t v19 = v37[v20];
          if (!v19)
          {
            while (1)
            {
              int64_t v14 = v20 + 1;
              if (__OFADD__(v20, 1)) {
                goto LABEL_42;
              }
              if (v14 >= v12) {
                goto LABEL_32;
              }
              unint64_t v19 = v37[v14];
              ++v20;
              if (v19) {
                goto LABEL_18;
              }
            }
          }
          int64_t v14 = v20;
        }
      }
LABEL_18:
      unint64_t v11 = (v19 - 1) & v19;
    }
    swift_release();
    uint64_t v2 = v36;
    unint64_t v18 = v37;
    if ((v4 & 1) == 0) {
      goto LABEL_39;
    }
LABEL_35:
    sub_10002A6B4();
    if (v34 != v35) {
      *unint64_t v18 = -1 << v33;
    }
    else {
      sub_10002A724(v33);
    }
    v1[2] = 0;
  }
LABEL_39:
  swift_release();
  *uint64_t v2 = v6;
  sub_10002A260();
}

uint64_t sub_100026E7C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t v8 = v6;
  sub_10002A7B4();
  Swift::Int v12 = *v6;
  sub_1000255D4(v13, v14);
  sub_10002A6A0();
  if (v17)
  {
    __break(1u);
    goto LABEL_11;
  }
  unint64_t v18 = v15;
  char v19 = v16;
  sub_100007A58(&qword_100064210);
  if (!sub_100041620(a5 & 1, v12)) {
    goto LABEL_5;
  }
  uint64_t v20 = sub_10002A6D4();
  unint64_t v22 = sub_1000255D4(v20, v21);
  if ((v19 & 1) != (v23 & 1))
  {
LABEL_11:
    uint64_t result = sub_100041740();
    __break(1u);
    return result;
  }
  unint64_t v18 = v22;
LABEL_5:
  id v24 = (void *)*v8;
  if (v19)
  {
    unint64_t v25 = (uint64_t *)(v24[7] + 16 * v18);
    uint64_t result = swift_bridgeObjectRelease();
    uint64_t *v25 = v7;
    v25[1] = v5;
  }
  else
  {
    sub_100027320(v18, a3, a4, v7, v5, v24);
    return swift_bridgeObjectRetain();
  }
  return result;
}

id sub_100026FA8(uint64_t a1, void *a2, char a3)
{
  char v4 = (void **)v3;
  uint64_t v7 = (void *)*v3;
  unint64_t v8 = sub_10002564C((uint64_t)a2);
  uint64_t v10 = v7[2];
  BOOL v11 = (v9 & 1) == 0;
  Swift::Int v12 = v10 + v11;
  if (__OFADD__(v10, v11))
  {
    __break(1u);
    goto LABEL_11;
  }
  unint64_t v13 = v8;
  char v14 = v9;
  sub_100007A58(&qword_1000641C8);
  if (!sub_100041620(a3 & 1, v12)) {
    goto LABEL_5;
  }
  unint64_t v15 = sub_10002564C((uint64_t)a2);
  if ((v14 & 1) != (v16 & 1))
  {
LABEL_11:
    sub_10000CD4C(0, (unint64_t *)&qword_100063E40);
    id result = (id)sub_100041740();
    __break(1u);
    return result;
  }
  unint64_t v13 = v15;
LABEL_5:
  char v17 = *v4;
  if (v14)
  {
    uint64_t v18 = v17[7];
    id result = (id)swift_unknownObjectRelease();
    *(void *)(v18 + 8 * v13) = a1;
  }
  else
  {
    sub_100027410(v13, (uint64_t)a2, a1, v17);
    return a2;
  }
  return result;
}

_OWORD *sub_1000270D0(_OWORD *a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = (void **)v4;
  uint64_t v10 = (void *)*v4;
  unint64_t v11 = sub_1000255D4(a2, a3);
  uint64_t v13 = v10[2];
  BOOL v14 = (v12 & 1) == 0;
  Swift::Int v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_13;
  }
  unint64_t v16 = v11;
  char v17 = v12;
  sub_100007A58(&qword_100064190);
  if (!sub_100041620(a4 & 1, v15)) {
    goto LABEL_5;
  }
  unint64_t v18 = sub_1000255D4(a2, a3);
  if ((v17 & 1) != (v19 & 1))
  {
LABEL_13:
    id result = (_OWORD *)sub_100041740();
    __break(1u);
    return result;
  }
  unint64_t v16 = v18;
LABEL_5:
  uint64_t v20 = *v5;
  if (v17)
  {
    uint64_t v21 = (_OWORD *)(v20[7] + 32 * v16);
    sub_100029B9C((uint64_t)v21);
    return sub_100029B30(a1, v21);
  }
  else
  {
    sub_100027454(v16, a2, a3, a1, v20);
    return (_OWORD *)swift_bridgeObjectRetain();
  }
}

void sub_100027210()
{
  sub_10002A34C();
  uint64_t v2 = v1;
  char v3 = v0;
  char v5 = v4;
  uint64_t v7 = v6;
  Swift::Int v8 = *v0;
  uint64_t v22 = v9;
  sub_10002564C(v9);
  sub_10002A6A0();
  if (v12)
  {
    __break(1u);
    goto LABEL_11;
  }
  unint64_t v13 = v10;
  char v14 = v11;
  sub_100007A58(v2);
  if (!sub_100041620(v5 & 1, v8)) {
    goto LABEL_5;
  }
  unint64_t v15 = sub_10002564C(v22);
  if ((v14 & 1) != (v16 & 1))
  {
LABEL_11:
    sub_10000CD4C(0, (unint64_t *)&qword_100063E40);
    sub_100041740();
    __break(1u);
    return;
  }
  unint64_t v13 = v15;
LABEL_5:
  char v17 = (void *)*v3;
  if (v14)
  {
    uint64_t v18 = v17[7];

    *(void *)(v18 + 8 * v13) = v7;
    sub_10002A2E0();
  }
  else
  {
    sub_100027410(v13, v22, v7, v17);
    sub_10002A2E0();
    id v21 = v19;
  }
}

unint64_t sub_100027320(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  a6[(result >> 6) + 8] |= 1 << result;
  uint64_t v6 = (void *)(a6[6] + 16 * result);
  *uint64_t v6 = a2;
  v6[1] = a3;
  uint64_t v7 = (void *)(a6[7] + 16 * result);
  *uint64_t v7 = a4;
  v7[1] = a5;
  uint64_t v8 = a6[2];
  BOOL v9 = __OFADD__(v8, 1);
  uint64_t v10 = v8 + 1;
  if (v9) {
    __break(1u);
  }
  else {
    a6[2] = v10;
  }
  return result;
}

uint64_t sub_10002736C(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  a5[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v8 = (void *)(a5[6] + 16 * a1);
  *uint64_t v8 = a2;
  v8[1] = a3;
  uint64_t v9 = a5[7];
  sub_100041020();
  sub_10002A2F8();
  uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t))(v10 + 32))(v9 + *(void *)(v10 + 72) * a1, a4);
  uint64_t v12 = a5[2];
  BOOL v13 = __OFADD__(v12, 1);
  uint64_t v14 = v12 + 1;
  if (v13) {
    __break(1u);
  }
  else {
    a5[2] = v14;
  }
  return result;
}

unint64_t sub_100027410(unint64_t result, uint64_t a2, uint64_t a3, void *a4)
{
  a4[(result >> 6) + 8] |= 1 << result;
  *(void *)(a4[6] + 8 * result) = a2;
  *(void *)(a4[7] + 8 * result) = a3;
  uint64_t v4 = a4[2];
  BOOL v5 = __OFADD__(v4, 1);
  uint64_t v6 = v4 + 1;
  if (v5) {
    __break(1u);
  }
  else {
    a4[2] = v6;
  }
  return result;
}

_OWORD *sub_100027454(unint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4, void *a5)
{
  a5[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v6 = (void *)(a5[6] + 16 * a1);
  *uint64_t v6 = a2;
  v6[1] = a3;
  uint64_t result = sub_100029B30(a4, (_OWORD *)(a5[7] + 32 * a1));
  uint64_t v8 = a5[2];
  BOOL v9 = __OFADD__(v8, 1);
  uint64_t v10 = v8 + 1;
  if (v9) {
    __break(1u);
  }
  else {
    a5[2] = v10;
  }
  return result;
}

uint64_t sub_1000274C0(Swift::Int *a1, Swift::Int a2, Swift::Int a3)
{
  uint64_t v7 = *v3;
  sub_100041780();
  swift_bridgeObjectRetain();
  sub_100041220();
  Swift::Int v8 = sub_1000417A0();
  uint64_t v9 = -1 << *(unsigned char *)(v7 + 32);
  unint64_t v10 = v8 & ~v9;
  if ((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10))
  {
    uint64_t v11 = *(void *)(v7 + 48);
    uint64_t v12 = (void *)(v11 + 16 * v10);
    BOOL v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_100041720() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v14 = (Swift::Int *)(*(void *)(*v3 + 48) + 16 * v10);
      Swift::Int v15 = v14[1];
      *a1 = *v14;
      a1[1] = v15;
      swift_bridgeObjectRetain();
      return 0;
    }
    uint64_t v17 = ~v9;
    while (1)
    {
      unint64_t v10 = (v10 + 1) & v17;
      if (((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) == 0) {
        break;
      }
      uint64_t v18 = (void *)(v11 + 16 * v10);
      BOOL v19 = *v18 == a2 && v18[1] == a3;
      if (v19 || (sub_100041720() & 1) != 0) {
        goto LABEL_7;
      }
    }
  }
  swift_bridgeObjectRelease();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v21 = *v3;
  *char v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_1000280F0(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *char v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_100027670(void *a1, void *a2)
{
  char v3 = v2;
  uint64_t v6 = *v2;
  if ((*v2 & 0xC000000000000001) != 0)
  {
    if (v6 < 0) {
      uint64_t v7 = *v2;
    }
    else {
      uint64_t v7 = v6 & 0xFFFFFFFFFFFFFF8;
    }
    swift_bridgeObjectRetain();
    id v8 = a2;
    uint64_t v9 = sub_1000414C0();

    if (v9)
    {
      swift_bridgeObjectRelease();

      sub_10000CD4C(0, &qword_100063260);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      *a1 = v27;
      swift_unknownObjectRelease();
      return 0;
    }
    uint64_t result = sub_1000414B0();
    if (__OFADD__(result, 1))
    {
      __break(1u);
      return result;
    }
    Swift::Int v22 = sub_10002790C(v7, result + 1);
    uint64_t v28 = (void *)v22;
    if (*(void *)(v22 + 24) <= *(void *)(v22 + 16))
    {
      id v26 = v8;
      sub_100027DD0();
      char v23 = v28;
    }
    else
    {
      char v23 = (void *)v22;
      id v24 = v8;
    }
    sub_10002806C((uint64_t)v8, v23);
    *char v3 = (uint64_t)v23;
  }
  else
  {
    Swift::Int v10 = *(void *)(v6 + 40);
    swift_bridgeObjectRetain();
    Swift::Int v11 = sub_100041400(v10);
    uint64_t v12 = -1 << *(unsigned char *)(v6 + 32);
    unint64_t v13 = v11 & ~v12;
    if ((*(void *)(v6 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13))
    {
      sub_10000CD4C(0, &qword_100063260);
      id v14 = *(id *)(*(void *)(v6 + 48) + 8 * v13);
      char v15 = sub_100041410();

      if (v15)
      {
LABEL_12:

        swift_bridgeObjectRelease();
        BOOL v19 = *(void **)(*(void *)(*v3 + 48) + 8 * v13);
        *a1 = v19;
        id v20 = v19;
        return 0;
      }
      uint64_t v16 = ~v12;
      while (1)
      {
        unint64_t v13 = (v13 + 1) & v16;
        if (((*(void *)(v6 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13) & 1) == 0) {
          break;
        }
        id v17 = *(id *)(*(void *)(v6 + 48) + 8 * v13);
        char v18 = sub_100041410();

        if (v18) {
          goto LABEL_12;
        }
      }
    }
    swift_bridgeObjectRelease();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v29 = *v3;
    *char v3 = 0x8000000000000000;
    id v8 = a2;
    sub_10002828C((uint64_t)v8, v13, isUniquelyReferenced_nonNull_native);
    *char v3 = v29;
  }
  swift_bridgeObjectRelease();
  *a1 = v8;
  return 1;
}

Swift::Int sub_10002790C(uint64_t a1, uint64_t a2)
{
  if (!a2)
  {
    swift_unknownObjectRelease();
    return (Swift::Int)&_swiftEmptySetSingleton;
  }
  sub_100007A58(&qword_1000641C0);
  uint64_t v2 = sub_100041540();
  uint64_t v14 = v2;
  sub_1000414A0();
  if (!sub_1000414D0())
  {
LABEL_16:
    swift_release();
    return v2;
  }
  sub_10000CD4C(0, &qword_100063260);
  while (1)
  {
    swift_dynamicCast();
    uint64_t v2 = v14;
    if (*(void *)(v14 + 24) <= *(void *)(v14 + 16))
    {
      sub_100027DD0();
      uint64_t v2 = v14;
    }
    Swift::Int result = sub_100041400(*(void *)(v2 + 40));
    uint64_t v4 = v2 + 56;
    uint64_t v5 = -1 << *(unsigned char *)(v2 + 32);
    unint64_t v6 = result & ~v5;
    unint64_t v7 = v6 >> 6;
    if (((-1 << v6) & ~*(void *)(v2 + 56 + 8 * (v6 >> 6))) == 0) {
      break;
    }
    unint64_t v8 = __clz(__rbit64((-1 << v6) & ~*(void *)(v2 + 56 + 8 * (v6 >> 6)))) | v6 & 0x7FFFFFFFFFFFFFC0;
LABEL_15:
    *(void *)(v4 + ((v8 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v8;
    *(void *)(*(void *)(v2 + 48) + 8 * v8) = v13;
    ++*(void *)(v2 + 16);
    if (!sub_1000414D0()) {
      goto LABEL_16;
    }
  }
  char v9 = 0;
  unint64_t v10 = (unint64_t)(63 - v5) >> 6;
  while (++v7 != v10 || (v9 & 1) == 0)
  {
    BOOL v11 = v7 == v10;
    if (v7 == v10) {
      unint64_t v7 = 0;
    }
    v9 |= v11;
    uint64_t v12 = *(void *)(v4 + 8 * v7);
    if (v12 != -1)
    {
      unint64_t v8 = __clz(__rbit64(~v12)) + (v7 << 6);
      goto LABEL_15;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_100027AF4()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_100007A58(&qword_100063560);
  uint64_t v3 = sub_100041530();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    uint64_t v30 = (void *)(v2 + 56);
    if (v5 < 64) {
      uint64_t v6 = ~(-1 << v5);
    }
    else {
      uint64_t v6 = -1;
    }
    unint64_t v7 = v6 & *(void *)(v2 + 56);
    int64_t v8 = (unint64_t)(v5 + 63) >> 6;
    uint64_t v9 = v3 + 56;
    uint64_t result = swift_retain();
    int64_t v11 = 0;
    if (!v7) {
      goto LABEL_7;
    }
LABEL_6:
    unint64_t v12 = __clz(__rbit64(v7));
    v7 &= v7 - 1;
    for (unint64_t i = v12 | (v11 << 6); ; unint64_t i = __clz(__rbit64(v15)) + (v11 << 6))
    {
      id v17 = (uint64_t *)(*(void *)(v2 + 48) + 16 * i);
      uint64_t v18 = *v17;
      uint64_t v19 = v17[1];
      sub_100041780();
      sub_100041220();
      uint64_t result = sub_1000417A0();
      uint64_t v20 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v21 = result & ~v20;
      unint64_t v22 = v21 >> 6;
      if (((-1 << v21) & ~*(void *)(v9 + 8 * (v21 >> 6))) == 0)
      {
        char v24 = 0;
        unint64_t v25 = (unint64_t)(63 - v20) >> 6;
        while (++v22 != v25 || (v24 & 1) == 0)
        {
          BOOL v26 = v22 == v25;
          if (v22 == v25) {
            unint64_t v22 = 0;
          }
          v24 |= v26;
          uint64_t v27 = *(void *)(v9 + 8 * v22);
          if (v27 != -1)
          {
            unint64_t v23 = __clz(__rbit64(~v27)) + (v22 << 6);
            goto LABEL_30;
          }
        }
        __break(1u);
LABEL_38:
        __break(1u);
LABEL_39:
        __break(1u);
        return result;
      }
      unint64_t v23 = __clz(__rbit64((-1 << v21) & ~*(void *)(v9 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
      *(void *)(v9 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v23;
      uint64_t v28 = (void *)(*(void *)(v4 + 48) + 16 * v23);
      void *v28 = v18;
      v28[1] = v19;
      ++*(void *)(v4 + 16);
      if (v7) {
        goto LABEL_6;
      }
LABEL_7:
      int64_t v14 = v11 + 1;
      if (__OFADD__(v11, 1)) {
        goto LABEL_38;
      }
      if (v14 >= v8) {
        goto LABEL_32;
      }
      unint64_t v15 = v30[v14];
      ++v11;
      if (!v15)
      {
        int64_t v11 = v14 + 1;
        if (v14 + 1 >= v8) {
          goto LABEL_32;
        }
        unint64_t v15 = v30[v11];
        if (!v15)
        {
          int64_t v11 = v14 + 2;
          if (v14 + 2 >= v8) {
            goto LABEL_32;
          }
          unint64_t v15 = v30[v11];
          if (!v15)
          {
            int64_t v16 = v14 + 3;
            if (v16 >= v8)
            {
LABEL_32:
              swift_release();
              uint64_t v1 = v0;
              uint64_t v29 = 1 << *(unsigned char *)(v2 + 32);
              if (v29 > 63) {
                sub_10002ECD0(0, (unint64_t)(v29 + 63) >> 6, v30);
              }
              else {
                void *v30 = -1 << v29;
              }
              *(void *)(v2 + 16) = 0;
              break;
            }
            unint64_t v15 = v30[v16];
            if (!v15)
            {
              while (1)
              {
                int64_t v11 = v16 + 1;
                if (__OFADD__(v16, 1)) {
                  goto LABEL_39;
                }
                if (v11 >= v8) {
                  goto LABEL_32;
                }
                unint64_t v15 = v30[v11];
                ++v16;
                if (v15) {
                  goto LABEL_20;
                }
              }
            }
            int64_t v11 = v16;
          }
        }
      }
LABEL_20:
      unint64_t v7 = (v15 - 1) & v15;
    }
  }
  uint64_t result = swift_release();
  *uint64_t v1 = v4;
  return result;
}

uint64_t sub_100027DD0()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_100007A58(&qword_1000641C0);
  uint64_t v3 = sub_100041530();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v28 = v0;
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    uint64_t v6 = (void *)(v2 + 56);
    if (v5 < 64) {
      uint64_t v7 = ~(-1 << v5);
    }
    else {
      uint64_t v7 = -1;
    }
    unint64_t v8 = v7 & *(void *)(v2 + 56);
    int64_t v9 = (unint64_t)(v5 + 63) >> 6;
    uint64_t v10 = v3 + 56;
    uint64_t result = swift_retain();
    int64_t v12 = 0;
    if (!v8) {
      goto LABEL_7;
    }
LABEL_6:
    unint64_t v13 = __clz(__rbit64(v8));
    v8 &= v8 - 1;
    for (unint64_t i = v13 | (v12 << 6); ; unint64_t i = __clz(__rbit64(v16)) + (v12 << 6))
    {
      uint64_t v18 = *(void *)(*(void *)(v2 + 48) + 8 * i);
      uint64_t result = sub_100041400(*(void *)(v4 + 40));
      uint64_t v19 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v20 = result & ~v19;
      unint64_t v21 = v20 >> 6;
      if (((-1 << v20) & ~*(void *)(v10 + 8 * (v20 >> 6))) == 0)
      {
        char v23 = 0;
        unint64_t v24 = (unint64_t)(63 - v19) >> 6;
        while (++v21 != v24 || (v23 & 1) == 0)
        {
          BOOL v25 = v21 == v24;
          if (v21 == v24) {
            unint64_t v21 = 0;
          }
          v23 |= v25;
          uint64_t v26 = *(void *)(v10 + 8 * v21);
          if (v26 != -1)
          {
            unint64_t v22 = __clz(__rbit64(~v26)) + (v21 << 6);
            goto LABEL_30;
          }
        }
        __break(1u);
LABEL_38:
        __break(1u);
LABEL_39:
        __break(1u);
        return result;
      }
      unint64_t v22 = __clz(__rbit64((-1 << v20) & ~*(void *)(v10 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
      *(void *)(v10 + ((v22 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v22;
      *(void *)(*(void *)(v4 + 48) + 8 * v22) = v18;
      ++*(void *)(v4 + 16);
      if (v8) {
        goto LABEL_6;
      }
LABEL_7:
      int64_t v15 = v12 + 1;
      if (__OFADD__(v12, 1)) {
        goto LABEL_38;
      }
      if (v15 >= v9) {
        goto LABEL_32;
      }
      unint64_t v16 = v6[v15];
      ++v12;
      if (!v16)
      {
        int64_t v12 = v15 + 1;
        if (v15 + 1 >= v9) {
          goto LABEL_32;
        }
        unint64_t v16 = v6[v12];
        if (!v16)
        {
          int64_t v12 = v15 + 2;
          if (v15 + 2 >= v9) {
            goto LABEL_32;
          }
          unint64_t v16 = v6[v12];
          if (!v16)
          {
            int64_t v17 = v15 + 3;
            if (v17 >= v9)
            {
LABEL_32:
              swift_release();
              uint64_t v1 = v28;
              uint64_t v27 = 1 << *(unsigned char *)(v2 + 32);
              if (v27 > 63) {
                sub_10002ECD0(0, (unint64_t)(v27 + 63) >> 6, (void *)(v2 + 56));
              }
              else {
                *uint64_t v6 = -1 << v27;
              }
              *(void *)(v2 + 16) = 0;
              break;
            }
            unint64_t v16 = v6[v17];
            if (!v16)
            {
              while (1)
              {
                int64_t v12 = v17 + 1;
                if (__OFADD__(v17, 1)) {
                  goto LABEL_39;
                }
                if (v12 >= v9) {
                  goto LABEL_32;
                }
                unint64_t v16 = v6[v12];
                ++v17;
                if (v16) {
                  goto LABEL_20;
                }
              }
            }
            int64_t v12 = v17;
          }
        }
      }
LABEL_20:
      unint64_t v8 = (v16 - 1) & v16;
    }
  }
  uint64_t result = swift_release();
  *uint64_t v1 = v4;
  return result;
}

unint64_t sub_10002806C(uint64_t a1, void *a2)
{
  sub_100041400(a2[5]);
  unint64_t result = sub_100041490();
  *(void *)((char *)a2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 56) |= 1 << result;
  *(void *)(a2[6] + 8 * result) = a1;
  ++a2[2];
  return result;
}

Swift::Int sub_1000280F0(Swift::Int result, Swift::Int a2, unint64_t a3, char a4)
{
  uint64_t v5 = v4;
  Swift::Int v8 = result;
  unint64_t v9 = *(void *)(*v4 + 16);
  unint64_t v10 = *(void *)(*v4 + 24);
  if (v10 > v9 && (a4 & 1) != 0) {
    goto LABEL_22;
  }
  if (a4)
  {
    sub_100027AF4();
  }
  else
  {
    if (v10 > v9)
    {
      unint64_t result = (Swift::Int)sub_100028414();
      goto LABEL_22;
    }
    sub_100028774();
  }
  uint64_t v11 = *v4;
  sub_100041780();
  sub_100041220();
  unint64_t result = sub_1000417A0();
  uint64_t v12 = -1 << *(unsigned char *)(v11 + 32);
  a3 = result & ~v12;
  uint64_t v13 = v11 + 56;
  if ((*(void *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3))
  {
    uint64_t v14 = *(void *)(v11 + 48);
    int64_t v15 = (void *)(v14 + 16 * a3);
    BOOL v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (unint64_t result = sub_100041720(), (result & 1) != 0))
    {
LABEL_21:
      unint64_t result = sub_100041730();
      __break(1u);
    }
    else
    {
      uint64_t v17 = ~v12;
      while (1)
      {
        a3 = (a3 + 1) & v17;
        if (((*(void *)(v13 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3) & 1) == 0) {
          break;
        }
        uint64_t v18 = (void *)(v14 + 16 * a3);
        if (*v18 != v8 || v18[1] != a2)
        {
          unint64_t result = sub_100041720();
          if ((result & 1) == 0) {
            continue;
          }
        }
        goto LABEL_21;
      }
    }
  }
LABEL_22:
  uint64_t v20 = *v5;
  *(void *)(*v5 + 8 * (a3 >> 6) + 56) |= 1 << a3;
  unint64_t v21 = (Swift::Int *)(*(void *)(v20 + 48) + 16 * a3);
  *unint64_t v21 = v8;
  v21[1] = a2;
  uint64_t v22 = *(void *)(v20 + 16);
  BOOL v23 = __OFADD__(v22, 1);
  uint64_t v24 = v22 + 1;
  if (v23) {
    __break(1u);
  }
  else {
    *(void *)(v20 + 16) = v24;
  }
  return result;
}

void sub_10002828C(uint64_t a1, unint64_t a2, char a3)
{
  unint64_t v6 = *(void *)(*v3 + 16);
  unint64_t v7 = *(void *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0) {
    goto LABEL_14;
  }
  if (a3)
  {
    sub_100027DD0();
  }
  else
  {
    if (v7 > v6)
    {
      sub_1000285C8();
      goto LABEL_14;
    }
    sub_100028A20();
  }
  uint64_t v8 = *v3;
  Swift::Int v9 = sub_100041400(*(void *)(*v3 + 40));
  uint64_t v10 = -1 << *(unsigned char *)(v8 + 32);
  a2 = v9 & ~v10;
  if ((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    sub_10000CD4C(0, &qword_100063260);
    id v11 = *(id *)(*(void *)(v8 + 48) + 8 * a2);
    char v12 = sub_100041410();

    if (v12)
    {
LABEL_13:
      sub_100041730();
      __break(1u);
    }
    else
    {
      uint64_t v13 = ~v10;
      while (1)
      {
        a2 = (a2 + 1) & v13;
        if (((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) == 0) {
          break;
        }
        id v14 = *(id *)(*(void *)(v8 + 48) + 8 * a2);
        char v15 = sub_100041410();

        if (v15) {
          goto LABEL_13;
        }
      }
    }
  }
LABEL_14:
  uint64_t v16 = *v3;
  *(void *)(*v3 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(void *)(*(void *)(v16 + 48) + 8 * a2) = a1;
  uint64_t v17 = *(void *)(v16 + 16);
  BOOL v18 = __OFADD__(v17, 1);
  uint64_t v19 = v17 + 1;
  if (v18) {
    __break(1u);
  }
  else {
    *(void *)(v16 + 16) = v19;
  }
}

void *sub_100028414()
{
  uint64_t v1 = v0;
  sub_100007A58(&qword_100063560);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_100041520();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    unint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  unint64_t result = (void *)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    unint64_t result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = *(void *)(v2 + 56);
  uint64_t v12 = -1;
  if (v10 < 64) {
    uint64_t v12 = ~(-1 << v10);
  }
  unint64_t v13 = v12 & v11;
  int64_t v14 = (unint64_t)(v10 + 63) >> 6;
  if ((v12 & v11) == 0) {
    goto LABEL_12;
  }
LABEL_11:
  unint64_t v15 = __clz(__rbit64(v13));
  v13 &= v13 - 1;
  for (unint64_t i = v15 | (v9 << 6); ; unint64_t i = __clz(__rbit64(v18)) + (v9 << 6))
  {
    uint64_t v20 = (void *)(*(void *)(v2 + 48) + 16 * i);
    uint64_t v21 = v20[1];
    uint64_t v22 = (void *)(*(void *)(v4 + 48) + 16 * i);
    void *v22 = *v20;
    v22[1] = v21;
    unint64_t result = (void *)swift_bridgeObjectRetain();
    if (v13) {
      goto LABEL_11;
    }
LABEL_12:
    int64_t v17 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v17 >= v14) {
      goto LABEL_28;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    ++v9;
    if (!v18)
    {
      int64_t v9 = v17 + 1;
      if (v17 + 1 >= v14) {
        goto LABEL_28;
      }
      unint64_t v18 = *(void *)(v6 + 8 * v9);
      if (!v18)
      {
        int64_t v9 = v17 + 2;
        if (v17 + 2 >= v14) {
          goto LABEL_28;
        }
        unint64_t v18 = *(void *)(v6 + 8 * v9);
        if (!v18) {
          break;
        }
      }
    }
LABEL_25:
    unint64_t v13 = (v18 - 1) & v18;
  }
  int64_t v19 = v17 + 3;
  if (v19 >= v14) {
    goto LABEL_28;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18)
  {
    int64_t v9 = v19;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v19 + 1;
    if (__OFADD__(v19, 1)) {
      break;
    }
    if (v9 >= v14) {
      goto LABEL_28;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v9);
    ++v19;
    if (v18) {
      goto LABEL_25;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

id sub_1000285C8()
{
  uint64_t v1 = v0;
  sub_100007A58(&qword_1000641C0);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_100041520();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    id result = (id)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  id result = (id)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = *(void *)(v2 + 56);
  uint64_t v12 = -1;
  if (v10 < 64) {
    uint64_t v12 = ~(-1 << v10);
  }
  unint64_t v13 = v12 & v11;
  int64_t v14 = (unint64_t)(v10 + 63) >> 6;
  if ((v12 & v11) == 0) {
    goto LABEL_12;
  }
LABEL_11:
  unint64_t v15 = __clz(__rbit64(v13));
  v13 &= v13 - 1;
  for (unint64_t i = v15 | (v9 << 6); ; unint64_t i = __clz(__rbit64(v18)) + (v9 << 6))
  {
    uint64_t v20 = *(void **)(*(void *)(v2 + 48) + 8 * i);
    *(void *)(*(void *)(v4 + 48) + 8 * i) = v20;
    id result = v20;
    if (v13) {
      goto LABEL_11;
    }
LABEL_12:
    int64_t v17 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v17 >= v14) {
      goto LABEL_28;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    ++v9;
    if (!v18)
    {
      int64_t v9 = v17 + 1;
      if (v17 + 1 >= v14) {
        goto LABEL_28;
      }
      unint64_t v18 = *(void *)(v6 + 8 * v9);
      if (!v18)
      {
        int64_t v9 = v17 + 2;
        if (v17 + 2 >= v14) {
          goto LABEL_28;
        }
        unint64_t v18 = *(void *)(v6 + 8 * v9);
        if (!v18) {
          break;
        }
      }
    }
LABEL_25:
    unint64_t v13 = (v18 - 1) & v18;
  }
  int64_t v19 = v17 + 3;
  if (v19 >= v14) {
    goto LABEL_28;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18)
  {
    int64_t v9 = v19;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v19 + 1;
    if (__OFADD__(v19, 1)) {
      break;
    }
    if (v9 >= v14) {
      goto LABEL_28;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v9);
    ++v19;
    if (v18) {
      goto LABEL_25;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_100028774()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_100007A58(&qword_100063560);
  uint64_t v3 = sub_100041530();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_34:
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v6 = v2 + 56;
  if (v5 < 64) {
    uint64_t v7 = ~(-1 << v5);
  }
  else {
    uint64_t v7 = -1;
  }
  unint64_t v8 = v7 & *(void *)(v2 + 56);
  int64_t v29 = (unint64_t)(v5 + 63) >> 6;
  uint64_t v9 = v3 + 56;
  uint64_t result = swift_retain();
  int64_t v11 = 0;
  if (!v8) {
    goto LABEL_7;
  }
LABEL_6:
  unint64_t v12 = __clz(__rbit64(v8));
  v8 &= v8 - 1;
  for (unint64_t i = v12 | (v11 << 6); ; unint64_t i = __clz(__rbit64(v15)) + (v11 << 6))
  {
    int64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + 16 * i);
    uint64_t v18 = *v17;
    uint64_t v19 = v17[1];
    sub_100041780();
    swift_bridgeObjectRetain();
    sub_100041220();
    uint64_t result = sub_1000417A0();
    uint64_t v20 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v21 = result & ~v20;
    unint64_t v22 = v21 >> 6;
    if (((-1 << v21) & ~*(void *)(v9 + 8 * (v21 >> 6))) == 0)
    {
      char v24 = 0;
      unint64_t v25 = (unint64_t)(63 - v20) >> 6;
      while (++v22 != v25 || (v24 & 1) == 0)
      {
        BOOL v26 = v22 == v25;
        if (v22 == v25) {
          unint64_t v22 = 0;
        }
        v24 |= v26;
        uint64_t v27 = *(void *)(v9 + 8 * v22);
        if (v27 != -1)
        {
          unint64_t v23 = __clz(__rbit64(~v27)) + (v22 << 6);
          goto LABEL_30;
        }
      }
      __break(1u);
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    unint64_t v23 = __clz(__rbit64((-1 << v21) & ~*(void *)(v9 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
    *(void *)(v9 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v23;
    uint64_t v28 = (void *)(*(void *)(v4 + 48) + 16 * v23);
    void *v28 = v18;
    v28[1] = v19;
    ++*(void *)(v4 + 16);
    if (v8) {
      goto LABEL_6;
    }
LABEL_7:
    int64_t v14 = v11 + 1;
    if (__OFADD__(v11, 1)) {
      goto LABEL_36;
    }
    if (v14 >= v29) {
      goto LABEL_32;
    }
    unint64_t v15 = *(void *)(v6 + 8 * v14);
    ++v11;
    if (!v15)
    {
      int64_t v11 = v14 + 1;
      if (v14 + 1 >= v29) {
        goto LABEL_32;
      }
      unint64_t v15 = *(void *)(v6 + 8 * v11);
      if (!v15)
      {
        int64_t v11 = v14 + 2;
        if (v14 + 2 >= v29) {
          goto LABEL_32;
        }
        unint64_t v15 = *(void *)(v6 + 8 * v11);
        if (!v15) {
          break;
        }
      }
    }
LABEL_20:
    unint64_t v8 = (v15 - 1) & v15;
  }
  int64_t v16 = v14 + 3;
  if (v16 >= v29)
  {
LABEL_32:
    uint64_t result = swift_release_n();
    uint64_t v1 = v0;
    goto LABEL_34;
  }
  unint64_t v15 = *(void *)(v6 + 8 * v16);
  if (v15)
  {
    int64_t v11 = v16;
    goto LABEL_20;
  }
  while (1)
  {
    int64_t v11 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v11 >= v29) {
      goto LABEL_32;
    }
    unint64_t v15 = *(void *)(v6 + 8 * v11);
    ++v16;
    if (v15) {
      goto LABEL_20;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_100028A20()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_100007A58(&qword_1000641C0);
  uint64_t v3 = sub_100041530();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_34:
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t v28 = v0;
  uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v6 = v2 + 56;
  if (v5 < 64) {
    uint64_t v7 = ~(-1 << v5);
  }
  else {
    uint64_t v7 = -1;
  }
  unint64_t v8 = v7 & *(void *)(v2 + 56);
  int64_t v9 = (unint64_t)(v5 + 63) >> 6;
  uint64_t v10 = v3 + 56;
  uint64_t result = swift_retain();
  int64_t v12 = 0;
  if (!v8) {
    goto LABEL_7;
  }
LABEL_6:
  unint64_t v13 = __clz(__rbit64(v8));
  v8 &= v8 - 1;
  for (unint64_t i = v13 | (v12 << 6); ; unint64_t i = __clz(__rbit64(v16)) + (v12 << 6))
  {
    Swift::Int v18 = *(void *)(v4 + 40);
    id v19 = *(id *)(*(void *)(v2 + 48) + 8 * i);
    uint64_t result = sub_100041400(v18);
    uint64_t v20 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v21 = result & ~v20;
    unint64_t v22 = v21 >> 6;
    if (((-1 << v21) & ~*(void *)(v10 + 8 * (v21 >> 6))) == 0)
    {
      char v24 = 0;
      unint64_t v25 = (unint64_t)(63 - v20) >> 6;
      while (++v22 != v25 || (v24 & 1) == 0)
      {
        BOOL v26 = v22 == v25;
        if (v22 == v25) {
          unint64_t v22 = 0;
        }
        v24 |= v26;
        uint64_t v27 = *(void *)(v10 + 8 * v22);
        if (v27 != -1)
        {
          unint64_t v23 = __clz(__rbit64(~v27)) + (v22 << 6);
          goto LABEL_30;
        }
      }
      __break(1u);
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    unint64_t v23 = __clz(__rbit64((-1 << v21) & ~*(void *)(v10 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
    *(void *)(v10 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v23;
    *(void *)(*(void *)(v4 + 48) + 8 * v23) = v19;
    ++*(void *)(v4 + 16);
    if (v8) {
      goto LABEL_6;
    }
LABEL_7:
    int64_t v15 = v12 + 1;
    if (__OFADD__(v12, 1)) {
      goto LABEL_36;
    }
    if (v15 >= v9) {
      goto LABEL_32;
    }
    unint64_t v16 = *(void *)(v6 + 8 * v15);
    ++v12;
    if (!v16)
    {
      int64_t v12 = v15 + 1;
      if (v15 + 1 >= v9) {
        goto LABEL_32;
      }
      unint64_t v16 = *(void *)(v6 + 8 * v12);
      if (!v16)
      {
        int64_t v12 = v15 + 2;
        if (v15 + 2 >= v9) {
          goto LABEL_32;
        }
        unint64_t v16 = *(void *)(v6 + 8 * v12);
        if (!v16) {
          break;
        }
      }
    }
LABEL_20:
    unint64_t v8 = (v16 - 1) & v16;
  }
  int64_t v17 = v15 + 3;
  if (v17 >= v9)
  {
LABEL_32:
    uint64_t result = swift_release_n();
    uint64_t v1 = v28;
    goto LABEL_34;
  }
  unint64_t v16 = *(void *)(v6 + 8 * v17);
  if (v16)
  {
    int64_t v12 = v17;
    goto LABEL_20;
  }
  while (1)
  {
    int64_t v12 = v17 + 1;
    if (__OFADD__(v17, 1)) {
      break;
    }
    if (v12 >= v9) {
      goto LABEL_32;
    }
    unint64_t v16 = *(void *)(v6 + 8 * v12);
    ++v17;
    if (v16) {
      goto LABEL_20;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

void *sub_100028C98(uint64_t a1)
{
  sub_100007A58(&qword_100064208);
  uint64_t result = (void *)sub_1000416C0();
  uint64_t v3 = result;
  int64_t v4 = 0;
  uint64_t v5 = *(void *)(a1 + 64);
  uint64_t v24 = a1 + 64;
  uint64_t v6 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v7 = -1;
  if (v6 < 64) {
    uint64_t v7 = ~(-1 << v6);
  }
  unint64_t v8 = v7 & v5;
  int64_t v25 = (unint64_t)(v6 + 63) >> 6;
  int64_t v9 = (char *)(result + 8);
  if ((v7 & v5) == 0) {
    goto LABEL_5;
  }
LABEL_4:
  unint64_t v10 = __clz(__rbit64(v8));
  v8 &= v8 - 1;
  for (unint64_t i = v10 | (v4 << 6); ; unint64_t i = __clz(__rbit64(v13)) + (v4 << 6))
  {
    int64_t v15 = (uint64_t *)(*(void *)(a1 + 48) + 16 * i);
    uint64_t v17 = *v15;
    uint64_t v16 = v15[1];
    uint64_t v18 = *(void *)(*(void *)(a1 + 56) + 8 * i);
    id v19 = objc_allocWithZone((Class)NSNumber);
    swift_bridgeObjectRetain();
    uint64_t result = [v19 initWithInteger:v18];
    *(void *)&v9[(i >> 3) & 0x1FFFFFFFFFFFFFF8] |= 1 << i;
    uint64_t v20 = (void *)(v3[6] + 16 * i);
    *uint64_t v20 = v17;
    v20[1] = v16;
    *(void *)(v3[7] + 8 * i) = result;
    uint64_t v21 = v3[2];
    BOOL v22 = __OFADD__(v21, 1);
    uint64_t v23 = v21 + 1;
    if (v22)
    {
      __break(1u);
LABEL_24:
      __break(1u);
      goto LABEL_25;
    }
    v3[2] = v23;
    if (v8) {
      goto LABEL_4;
    }
LABEL_5:
    int64_t v12 = v4 + 1;
    if (__OFADD__(v4, 1)) {
      goto LABEL_24;
    }
    if (v12 >= v25) {
      return v3;
    }
    unint64_t v13 = *(void *)(v24 + 8 * v12);
    ++v4;
    if (!v13)
    {
      int64_t v4 = v12 + 1;
      if (v12 + 1 >= v25) {
        return v3;
      }
      unint64_t v13 = *(void *)(v24 + 8 * v4);
      if (!v13)
      {
        int64_t v4 = v12 + 2;
        if (v12 + 2 >= v25) {
          return v3;
        }
        unint64_t v13 = *(void *)(v24 + 8 * v4);
        if (!v13) {
          break;
        }
      }
    }
LABEL_18:
    unint64_t v8 = (v13 - 1) & v13;
  }
  int64_t v14 = v12 + 3;
  if (v14 >= v25) {
    return v3;
  }
  unint64_t v13 = *(void *)(v24 + 8 * v14);
  if (v13)
  {
    int64_t v4 = v14;
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v4 = v14 + 1;
    if (__OFADD__(v14, 1)) {
      break;
    }
    if (v4 >= v25) {
      return v3;
    }
    unint64_t v13 = *(void *)(v24 + 8 * v4);
    ++v14;
    if (v13) {
      goto LABEL_18;
    }
  }
LABEL_25:
  __break(1u);
  return result;
}

void *sub_100028EAC(uint64_t a1)
{
  sub_100007A58(&qword_100064200);
  uint64_t result = (void *)sub_1000416C0();
  uint64_t v3 = result;
  int64_t v4 = 0;
  uint64_t v5 = *(void *)(a1 + 64);
  uint64_t v24 = a1 + 64;
  uint64_t v6 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v7 = -1;
  if (v6 < 64) {
    uint64_t v7 = ~(-1 << v6);
  }
  unint64_t v8 = v7 & v5;
  int64_t v9 = (unint64_t)(v6 + 63) >> 6;
  unint64_t v10 = (char *)(result + 8);
  if ((v7 & v5) == 0) {
    goto LABEL_5;
  }
LABEL_4:
  unint64_t v11 = __clz(__rbit64(v8));
  v8 &= v8 - 1;
  for (unint64_t i = v11 | (v4 << 6); ; unint64_t i = __clz(__rbit64(v14)) + (v4 << 6))
  {
    uint64_t v16 = (uint64_t *)(*(void *)(a1 + 48) + 16 * i);
    uint64_t v18 = *v16;
    uint64_t v17 = v16[1];
    id v19 = *(void **)(*(void *)(a1 + 56) + 8 * i);
    swift_bridgeObjectRetain();
    uint64_t result = [v19 integerValue];
    *(void *)&v10[(i >> 3) & 0x1FFFFFFFFFFFFFF8] |= 1 << i;
    uint64_t v20 = (void *)(v3[6] + 16 * i);
    *uint64_t v20 = v18;
    v20[1] = v17;
    *(void *)(v3[7] + 8 * i) = result;
    uint64_t v21 = v3[2];
    BOOL v22 = __OFADD__(v21, 1);
    uint64_t v23 = v21 + 1;
    if (v22)
    {
      __break(1u);
LABEL_24:
      __break(1u);
      goto LABEL_25;
    }
    v3[2] = v23;
    if (v8) {
      goto LABEL_4;
    }
LABEL_5:
    int64_t v13 = v4 + 1;
    if (__OFADD__(v4, 1)) {
      goto LABEL_24;
    }
    if (v13 >= v9) {
      return v3;
    }
    unint64_t v14 = *(void *)(v24 + 8 * v13);
    ++v4;
    if (!v14)
    {
      int64_t v4 = v13 + 1;
      if (v13 + 1 >= v9) {
        return v3;
      }
      unint64_t v14 = *(void *)(v24 + 8 * v4);
      if (!v14)
      {
        int64_t v4 = v13 + 2;
        if (v13 + 2 >= v9) {
          return v3;
        }
        unint64_t v14 = *(void *)(v24 + 8 * v4);
        if (!v14) {
          break;
        }
      }
    }
LABEL_18:
    unint64_t v8 = (v14 - 1) & v14;
  }
  int64_t v15 = v13 + 3;
  if (v15 >= v9) {
    return v3;
  }
  unint64_t v14 = *(void *)(v24 + 8 * v15);
  if (v14)
  {
    int64_t v4 = v15;
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v4 = v15 + 1;
    if (__OFADD__(v15, 1)) {
      break;
    }
    if (v4 >= v9) {
      return v3;
    }
    unint64_t v14 = *(void *)(v24 + 8 * v4);
    ++v15;
    if (v14) {
      goto LABEL_18;
    }
  }
LABEL_25:
  __break(1u);
  return result;
}

void sub_10002908C(uint64_t a1, void *a2)
{
  Class isa = sub_100041320().super.isa;
  swift_bridgeObjectRelease();
  [a2 setTaskTypeFilter:isa];
}

uint64_t sub_100029100(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  NSString v8 = sub_1000411E0();
  id v9 = [a5 installedHammerConfigFileForLanguage:a1 assetType:a2 clientID:v8];

  if (!v9) {
    return 0;
  }
  uint64_t v10 = sub_1000411F0();

  return v10;
}

uint64_t sub_100029198(void *a1)
{
  id v2 = [a1 userIdMask];

  if (!v2) {
    return 0;
  }
  uint64_t v3 = sub_100041130();

  return v3;
}

uint64_t sub_100029208(void *a1)
{
  id v2 = [a1 speechProfileContainers];

  if (!v2) {
    return 0;
  }
  sub_10000CD4C(0, &qword_100064168);
  uint64_t v3 = sub_100041270();

  return v3;
}

uint64_t sub_100029280(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8)
{
  NSString v10 = sub_1000411E0();
  swift_bridgeObjectRelease();
  NSString v11 = sub_1000411E0();
  swift_bridgeObjectRelease();
  NSString v12 = sub_1000411E0();
  id v13 = [a8 installedGeoLMRegionSpecificAssetForLanguage:a1 clientID:v10 regionId:v11 mainAssetConfig:v12];

  if (!v13) {
    return 0;
  }
  uint64_t v14 = sub_1000411F0();

  return v14;
}

id sub_100029374(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  NSString v5 = sub_1000411E0();
  swift_bridgeObjectRelease();
  Class isa = sub_100041120().super.isa;
  swift_bridgeObjectRelease();
  id v7 = [a4 addNamedEntity:v5 metadata:isa];

  return v7;
}

uint64_t sub_10002940C(void *a1, SEL *a2)
{
  id v2 = [a1 *a2];
  if (v2)
  {
    uint64_t v3 = v2;
    sub_100040EA0();
  }
  return sub_10002A494();
}

uint64_t sub_100029468(void *a1, SEL *a2)
{
  id v2 = [a1 *a2];
  if (!v2) {
    return 0;
  }
  uint64_t v3 = v2;
  uint64_t v4 = sub_100041270();

  return v4;
}

uint64_t sub_1000294BC(void *a1)
{
  id v1 = [a1 contextualNamedEntities];
  if (!v1) {
    return 0;
  }
  id v2 = v1;
  sub_10000CD4C(0, &qword_1000641A8);
  uint64_t v3 = sub_100041270();

  return v3;
}

uint64_t sub_10002952C(void *a1)
{
  id v1 = [a1 taskTypeFilter];
  if (!v1) {
    return 0;
  }
  id v2 = v1;
  uint64_t v3 = sub_100041330();

  return v3;
}

uint64_t sub_10002958C(void *a1, SEL *a2)
{
  id v2 = [a1 *a2];
  if (v2)
  {
    uint64_t v3 = v2;
    sub_1000411F0();
  }
  return sub_10002A494();
}

uint64_t sub_1000295E8(void *a1, SEL *a2)
{
  id v3 = [a1 *a2];

  if (v3)
  {
    sub_1000411F0();
  }
  return sub_10002A7C0();
}

void sub_100029650(uint64_t a1, uint64_t a2, void *a3)
{
  Class isa = sub_100040E90().super.isa;
  [a3 setUserProfileData:isa];
}

void sub_1000296A8(uint64_t a1, uint64_t a2, void *a3)
{
  NSString v4 = sub_1000411E0();
  [a3 setLeftContextText:v4];
}

uint64_t sub_100029700(uint64_t result, uint64_t a2, unint64_t a3)
{
  unint64_t v5 = result;
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_1000416B0();
    uint64_t result = swift_bridgeObjectRelease();
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
  if (v5)
  {
    if (v6)
    {
      swift_bridgeObjectRetain();
      uint64_t v8 = sub_1000416B0();
      uint64_t result = swift_bridgeObjectRelease();
      if (v8 <= a2)
      {
        if (v7 >= 1)
        {
          sub_1000299C8();
          swift_bridgeObjectRetain();
          for (uint64_t i = 0; i != v7; ++i)
          {
            sub_100007A58(&qword_100064140);
            NSString v10 = sub_100029890(v13, i, a3);
            id v12 = *v11;
            ((void (*)(void *, void))v10)(v13, 0);
            *(void *)(v5 + 8 * i) = v12;
          }
          swift_bridgeObjectRelease();
          return a3;
        }
        goto LABEL_16;
      }
    }
    else
    {
      if (*(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) <= a2)
      {
        sub_10002E264((a3 & 0xFFFFFFFFFFFFFF8) + 32, *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10), v5);
        return a3;
      }
      __break(1u);
    }
    __break(1u);
LABEL_16:
    __break(1u);
  }
  __break(1u);
  return result;
}

void (*sub_100029890(void *a1, uint64_t a2, uint64_t a3))(void *a1)
{
  unint64_t v6 = malloc(0x28uLL);
  *a1 = v6;
  v6[4] = sub_100029940(v6, a2, a3);
  return sub_1000298F8;
}

void sub_1000298F8(void *a1)
{
  id v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);

  free(v1);
}

void (*sub_100029940(void *a1, uint64_t a2, uint64_t a3))(id *a1)
{
  unint64_t v6 = a3 & 0xC000000000000001;
  sub_10002EB08(a2, (a3 & 0xC000000000000001) == 0);
  if (v6) {
    id v7 = (id)sub_100041590();
  }
  else {
    id v7 = *(id *)(a3 + 8 * a2 + 32);
  }
  *a1 = v7;
  return sub_1000299C0;
}

void sub_1000299C0(id *a1)
{
}

unint64_t sub_1000299C8()
{
  unint64_t result = qword_100064148;
  if (!qword_100064148)
  {
    sub_100029A1C(&qword_100064140);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100064148);
  }
  return result;
}

uint64_t sub_100029A1C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100029A64()
{
  return _swift_deallocObject(v0, 24, 7);
}

void sub_100029A9C()
{
}

uint64_t sub_100029AC0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100029AD0()
{
  return swift_release();
}

uint64_t sub_100029AD8(uint64_t a1, unint64_t a2)
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

_OWORD *sub_100029B30(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_100029B40(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_100029B9C(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

int64_t sub_100029BEC(int64_t result, int a2, char a3, uint64_t a4)
{
  if (a3) {
    goto LABEL_20;
  }
  unint64_t v4 = result;
  if (result < 0 || (uint64_t result = 1 << *(unsigned char *)(a4 + 32), result <= (uint64_t)v4))
  {
    __break(1u);
    goto LABEL_18;
  }
  unint64_t v5 = v4 >> 6;
  uint64_t v6 = a4 + 56;
  unint64_t v7 = *(void *)(a4 + 56 + 8 * (v4 >> 6));
  if (((v7 >> v4) & 1) == 0)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  if (*(_DWORD *)(a4 + 36) != a2)
  {
LABEL_19:
    __break(1u);
LABEL_20:
    __break(1u);
    return result;
  }
  unint64_t v8 = v7 & (-2 << (v4 & 0x3F));
  if (v8) {
    return __clz(__rbit64(v8)) | v4 & 0xFFFFFFFFFFFFFFC0;
  }
  unint64_t v9 = v5 + 1;
  if (v5 + 1 < (unint64_t)(result + 63) >> 6)
  {
    unint64_t v10 = *(void *)(v6 + 8 * v9);
    if (v10) {
      return __clz(__rbit64(v10)) + (v9 << 6);
    }
    unint64_t v11 = (unint64_t)(result + 63) >> 6;
    unint64_t v9 = v5 + 2;
    if (v5 + 2 < v11)
    {
      unint64_t v10 = *(void *)(v6 + 8 * v9);
      if (v10) {
        return __clz(__rbit64(v10)) + (v9 << 6);
      }
      while (v5 + 3 < v11)
      {
        unint64_t v10 = *(void *)(a4 + 80 + 8 * v5++);
        if (v10)
        {
          unint64_t v9 = v5 + 2;
          return __clz(__rbit64(v10)) + (v9 << 6);
        }
      }
    }
  }
  return result;
}

uint64_t sub_100029CD0(uint64_t result, int a2, uint64_t a3, uint64_t a4)
{
  if (result < 0 || 1 << *(unsigned char *)(a4 + 32) <= result)
  {
    __break(1u);
    goto LABEL_7;
  }
  if (((*(void *)(a4 + 8 * ((unint64_t)result >> 6) + 56) >> result) & 1) == 0)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  if (*(_DWORD *)(a4 + 36) == a2)
  {
    uint64_t v4 = *(void *)(*(void *)(a4 + 48) + 16 * result);
    swift_bridgeObjectRetain();
    return v4;
  }
LABEL_8:
  __break(1u);
  return result;
}

uint64_t sub_100029D50(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 56);
  if (v1)
  {
    uint64_t v2 = 0;
    return __clz(__rbit64(v1)) + v2;
  }
  char v5 = *(unsigned char *)(a1 + 32);
  unsigned int v6 = v5 & 0x3F;
  uint64_t v3 = 1 << v5;
  if (v6 < 7) {
    return v3;
  }
  unint64_t v1 = *(void *)(a1 + 64);
  if (v1)
  {
    uint64_t v2 = 64;
    return __clz(__rbit64(v1)) + v2;
  }
  uint64_t v2 = 64;
  for (uint64_t i = 9; i - 7 < (unint64_t)(v3 + 63) >> 6; ++i)
  {
    unint64_t v1 = *(void *)(a1 + 8 * i);
    v2 += 64;
    if (v1) {
      return __clz(__rbit64(v1)) + v2;
    }
  }
  return v3;
}

uint64_t sub_100029DD0(unint64_t *a1, unint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10000CD4C(255, a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t *sub_100029E20(uint64_t *a1)
{
  unint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

unint64_t sub_100029E84()
{
  unint64_t result = qword_100062CD0;
  if (!qword_100062CD0)
  {
    type metadata accessor for LSRError(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100062CD0);
  }
  return result;
}

uint64_t sub_100029ED4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  sub_10002A5D8(a1, a2, a3);
  sub_10002A2F8();
  uint64_t v4 = sub_10002A60C();
  v5(v4);
  return v3;
}

uint64_t sub_100029F18()
{
  uint64_t v1 = sub_100007A58((uint64_t *)&unk_100063F60);
  sub_10002A220(v1);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v6 = *(void *)(v5 + 64);

  uint64_t v7 = sub_100040F20();
  if (!sub_100007B04(v0 + v4, 1, v7)) {
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v0 + v4, v7);
  }
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, ((((v6 + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 8, v3 | 7);
}

uint64_t sub_10002A020()
{
  uint64_t v1 = sub_100007A58((uint64_t *)&unk_100063F60);
  sub_10002A220(v1);
  unint64_t v4 = (*(void *)(v3 + 64)
      + ((*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80))
      + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v5 = *(void *)(v0 + v4);
  uint64_t v6 = *(void *)(v0 + v4 + 8);
  uint64_t v7 = *(void *)(v0 + ((v4 + 23) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v8 = swift_task_alloc();
  unint64_t v9 = (void *)sub_10002A580(v8);
  *unint64_t v9 = v10;
  v9[1] = sub_10002520C;
  uint64_t v11 = sub_10002A61C();
  return sub_10001DCCC(v11, v12, v13, v14, v5, v6, v7);
}

uint64_t sub_10002A130()
{
  if (*(void *)(v0 + 16) != 1) {
    swift_bridgeObjectRelease();
  }

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10002A170(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  sub_10002A5D8(a1, a2, a3);
  sub_10002A2F8();
  uint64_t v4 = sub_10002A60C();
  v5(v4);
  return v3;
}

uint64_t sub_10002A1B4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  sub_10002A5D8(a1, a2, a3);
  sub_10002A2F8();
  uint64_t v4 = sub_10002A60C();
  v5(v4);
  return v3;
}

uint64_t sub_10002A1FC(uint64_t result)
{
  if (result != 1) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_10002A20C(uint64_t result)
{
  if (result != 1) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_10002A220(uint64_t a1)
{
  return a1 - 8;
}

uint64_t sub_10002A238(uint64_t a1)
{
  return _swift_task_switch(a1, 0, 0);
}

void sub_10002A27C()
{
  *uint64_t v0 = 0x8000000000000000;
}

uint64_t sub_10002A2B8()
{
  return sub_100041450();
}

uint64_t sub_10002A30C()
{
  return swift_task_alloc();
}

uint64_t sub_10002A328@<X0>(uint64_t a1@<X8>, uint64_t a2, ...)
{
  va_start(va, a2);
  return sub_10002E330(0xD000000000000016, (a1 - 32) | 0x8000000000000000, (uint64_t *)va);
}

id sub_10002A364()
{
  uint64_t v3 = *(const char **)(v1 + 3320);
  return [v0 v3];
}

uint64_t sub_10002A37C(uint64_t a1, uint64_t a2)
{
  sub_100007B8C(a1, a2);
  return sub_1000410C0();
}

uint64_t sub_10002A3A4()
{
  return v0;
}

uint64_t sub_10002A3B0(const char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return sub_100009A9C(a1, a2, 2, 0, 0xE000000000000000, a6);
}

uint64_t sub_10002A430()
{
  return swift_unknownObjectRelease();
}

BOOL sub_10002A45C()
{
  return sub_100041620(v0, v1);
}

uint64_t sub_10002A47C()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_10002A494()
{
  return v0;
}

void sub_10002A4A0(void *a1, NSObject *a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, a2, v5, a4, v4, 0xCu);
}

uint64_t sub_10002A4BC()
{
  return sub_10000CD4C(0, v0);
}

void sub_10002A4D8(float a1)
{
  *uint64_t v1 = a1;
}

uint64_t sub_10002A4E8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  *(void *)(v2 + a2) = a1;
  return _objc_release_x1();
}

void sub_10002A4F4()
{
  *uint64_t v0 = 0x8000000000000000;
}

uint64_t sub_10002A510(uint64_t a1, uint64_t a2)
{
  if (!a2) {
    return 0;
  }
  return result;
}

uint64_t sub_10002A538@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, SEL *a3@<X3>, uint64_t a4@<X8>)
{
  return sub_100022B1C(a1, a2, a4 | 0x8000000000000000, a3);
}

uint64_t sub_10002A540@<X0>(uint64_t a1@<X2>, char a2@<W4>, uint64_t a3@<X8>)
{
  return sub_100026E7C(5457241, 0xE300000000000000, a1, (a3 - 32) | 0x8000000000000000, a2);
}

id sub_10002A568()
{
  uint64_t v3 = *(const char **)(v1 + 3344);
  return [v0 v3];
}

uint64_t sub_10002A580(uint64_t result)
{
  *(void *)(v1 + 16) = result;
  return result;
}

uint64_t sub_10002A5A4()
{
  return v0;
}

uint64_t sub_10002A5B0()
{
  return swift_arrayDestroy();
}

uint64_t sub_10002A5CC()
{
  return v0;
}

uint64_t sub_10002A5D8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  return sub_100007A58(a3);
}

uint64_t sub_10002A5F4()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_10002A60C()
{
  return v0;
}

uint64_t sub_10002A61C()
{
  return v0;
}

id sub_10002A634()
{
  uint64_t v3 = *(const char **)(v1 + 3320);
  return [v0 v3];
}

uint64_t sub_10002A668()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_10002A688(unint64_t *a1)
{
  return sub_100029DD0(a1, v1);
}

uint64_t sub_10002A6D4()
{
  return v0;
}

id sub_10002A70C(uint64_t a1, const char *a2)
{
  return objc_msgSend(v3, a2, v2);
}

uint64_t sub_10002A724@<X0>(uint64_t a1@<X8>)
{
  return sub_10002ECD0(0, (unint64_t)(a1 + 63) >> 6, v1);
}

uint64_t sub_10002A758()
{
  return swift_bridgeObjectRelease();
}

void sub_10002A784()
{
  *(void *)(v1 - 104) = v0;
}

uint64_t sub_10002A79C()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_10002A7C0()
{
  return v0;
}

uint64_t sub_10002A7CC()
{
  return v0;
}

uint64_t sub_10002A7E0()
{
  return v0;
}

id sub_10002A7EC(uint64_t a1, const char *a2)
{
  return objc_msgSend(v2, a2, v3);
}

uint64_t sub_10002A804()
{
  return 0;
}

uint64_t sub_10002A810@<X0>(uint64_t a1@<X8>, uint64_t a2)
{
  return sub_10002E330(0xD00000000000002BLL, a1 | 0x8000000000000000, &a2);
}

uint64_t sub_10002A830()
{
  return sub_100041660();
}

id sub_10002A850(void *a1, uint64_t a2, void *a3)
{
  id v7 = objc_allocWithZone((Class)NSXPCConnection);
  uint64_t v8 = v3;
  id v9 = [v7 initWithListenerEndpoint:a1];
  uint64_t v10 = OBJC_IVAR____TtC22localspeechrecognition32EARSpeechRecognitionResultStream_connection;
  *(void *)&v8[OBJC_IVAR____TtC22localspeechrecognition32EARSpeechRecognitionResultStream_connection] = v9;
  uint64_t v11 = self;
  id v12 = v9;
  id v13 = [v11 interfaceWithProtocol:&OBJC_PROTOCOL____SFXPCEARSpeechRecognitionResultStream];
  [v12 setRemoteObjectInterface:v13];

  uint64_t v14 = *(void **)&v8[v10];
  [v14 activate];
  id v15 = [v14 remoteObjectProxy];
  sub_100041480();
  swift_unknownObjectRelease();
  sub_100007A58(&qword_1000642F8);
  swift_dynamicCast();
  *(void *)&v8[OBJC_IVAR____TtC22localspeechrecognition32EARSpeechRecognitionResultStream_resultStreamProxy] = v20;
  *(void *)&v8[OBJC_IVAR____TtC22localspeechrecognition32EARSpeechRecognitionResultStream_modelContextDelegateInterface] = a3;
  sub_100007A9C(a2, (uint64_t)&v8[OBJC_IVAR____TtC22localspeechrecognition32EARSpeechRecognitionResultStream_asrID]);
  id v16 = a3;

  v19.receiver = v8;
  v19.Class super_class = (Class)type metadata accessor for EARSpeechRecognitionResultStream();
  id v17 = objc_msgSendSuper2(&v19, "init");

  sub_100007B2C(a2);
  return v17;
}

id sub_10002AA0C()
{
  [*(id *)&v0[OBJC_IVAR____TtC22localspeechrecognition32EARSpeechRecognitionResultStream_connection] invalidate];
  v2.receiver = v0;
  v2.Class super_class = (Class)type metadata accessor for EARSpeechRecognitionResultStream();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_10002AAF0()
{
  return type metadata accessor for EARSpeechRecognitionResultStream();
}

uint64_t type metadata accessor for EARSpeechRecognitionResultStream()
{
  uint64_t result = qword_1000642D0;
  if (!qword_1000642D0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_10002AB40(uint64_t a1, void *a2)
{
  if (qword_1000621B0 != -1) {
    swift_once();
  }
  swift_beginAccess();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_100005EC4();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1000194E8((uint64_t)_swiftEmptyArrayStorage);
  uint64_t v4 = *(void **)(v2 + OBJC_IVAR____TtC22localspeechrecognition32EARSpeechRecognitionResultStream_resultStreamProxy);
  if (a2)
  {
    swift_errorRetain();
    sub_100007A58((uint64_t *)&unk_100063E20);
    type metadata accessor for LSRError(0);
    if (swift_dynamicCast()) {
      os_log_type_t v5 = v6;
    }
    else {
      os_log_type_t v5 = 0;
    }
  }
  else
  {
    os_log_type_t v5 = 0;
  }
  if (sub_100019DD0(v5)) {
    goto LABEL_11;
  }
  if (a2)
  {
    swift_errorRetain();
LABEL_11:
    a2 = (void *)sub_100040DD0();
    swift_errorRelease();
  }
  [v4 speechRecognizerDidFinishRecognitionWithError:a2];
}

void sub_10002AD70(uint64_t a1, uint64_t a2)
{
}

void sub_10002AE00(uint64_t a1, uint64_t a2)
{
}

void sub_10002AE90(uint64_t a1, uint64_t a2)
{
}

void sub_10002AF20(uint64_t a1, uint64_t a2)
{
}

void sub_10002AFB0(uint64_t a1, uint64_t a2)
{
}

void sub_10002AFCC(uint64_t a1, uint64_t a2, Class *a3, SEL *a4, SEL *a5)
{
  id v7 = objc_msgSend(objc_allocWithZone(*a3), *a4, a2);
  objc_msgSend(*(id *)(v5 + OBJC_IVAR____TtC22localspeechrecognition32EARSpeechRecognitionResultStream_resultStreamProxy), *a5, v7);
}

id sub_10002B0BC()
{
  return objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC22localspeechrecognition32EARSpeechRecognitionResultStream_resultStreamProxy), "speechRecognizerDidProcessAudioDuration:");
}

void sub_10002B144(double a1, double a2, double a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  id v15 = *(void **)(v8 + OBJC_IVAR____TtC22localspeechrecognition32EARSpeechRecognitionResultStream_resultStreamProxy);
  sub_10000CD4C(0, &qword_100063260);
  Class isa = sub_100041260().super.isa;
  [v15 speechRecognizerDidProduceEndpointFeaturesWithWordCount:a5 trailingSilenceDuration:a6 eosLikelihood:isa pauseCounts:a8 silencePosterior:a1 processedAudioDurationInMilliseconds:a2 acousticEndpointerScore:a3];
}

id sub_10002B2F4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(v2 + OBJC_IVAR____TtC22localspeechrecognition32EARSpeechRecognitionResultStream_resultStreamProxy) speechRecognizerDidReportStatus:a2];
}

void sub_10002B3FC()
{
}

void sub_10002B43C()
{
  sub_1000107B0();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

uint64_t sub_10002B4E8()
{
  uint64_t v1 = *(void **)(v0 + 16);
  NSString v2 = sub_1000411E0();
  NSString v3 = sub_1000411E0();
  id v4 = [v1 levelForFactor:v2 withNamespaceName:v3];

  if (!v4) {
    return 2;
  }
  unsigned int v5 = [v4 BOOLeanValue];

  return v5 ^ 1;
}

uint64_t type metadata accessor for TrialExperimentationAssetManager()
{
  return self;
}

double ClientInfo.init(identifier:)@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = a3 + *(int *)(type metadata accessor for ClientInfo(0) + 32);
  uint64_t v7 = type metadata accessor for ClientInfo.LoggingInfo(0);
  sub_10000A374(v6, 1, 1, v7);
  *(void *)a3 = a1;
  *(void *)(a3 + 8) = a2;
  double result = 0.0;
  *(void *)(a3 + 16) = 0;
  *(void *)(a3 + 24) = 0xE000000000000000;
  *(_OWORD *)(a3 + 32) = xmmword_100046570;
  *(_OWORD *)(a3 + 48) = xmmword_100046570;
  return result;
}

uint64_t ClientInfo.init(identifier:source:applicationName:inputOrigin:loggingInfo:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, void *a9@<X8>, uint64_t a10)
{
  *a9 = a1;
  a9[1] = a2;
  a9[4] = a5;
  a9[5] = a6;
  a9[2] = a3;
  a9[3] = a4;
  a9[6] = a7;
  a9[7] = a8;
  uint64_t v10 = (uint64_t)a9 + *(int *)(type metadata accessor for ClientInfo(0) + 32);

  return sub_10002B70C(a10, v10);
}

uint64_t type metadata accessor for ClientInfo(uint64_t a1)
{
  return sub_10002B6D8(a1, (uint64_t *)&unk_100064410);
}

uint64_t type metadata accessor for ClientInfo.LoggingInfo(uint64_t a1)
{
  return sub_10002B6D8(a1, qword_1000644B8);
}

uint64_t sub_10002B6D8(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_10002B70C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100007A58(&qword_1000643A8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t ClientInfo.init(identifier:applicationName:source:inputOrigin:)()
{
  return sub_10002D25C();
}

uint64_t ClientInfo.init(identifier:applicationName:source:inputOrigin:dictationUIInteractionId:)()
{
  return sub_10002D25C();
}

uint64_t ClientInfo.identifier.getter()
{
  return sub_10002A494();
}

uint64_t ClientInfo.source.getter()
{
  return sub_10002A494();
}

uint64_t ClientInfo.applicationName.getter()
{
  return sub_10002A494();
}

uint64_t ClientInfo.inputOrigin.getter()
{
  return sub_10002A494();
}

uint64_t ClientInfo.loggingInfo.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for ClientInfo(0) + 32);

  return sub_10002B8F8(v3, a1);
}

uint64_t sub_10002B8F8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100007A58(&qword_1000643A8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t ClientInfo.LoggingInfo.asrID.getter()
{
  sub_100040F20();
  sub_1000192D0();
  uint64_t v0 = sub_10002A494();

  return v1(v0);
}

uint64_t ClientInfo.LoggingInfo.requestID.getter()
{
  type metadata accessor for ClientInfo.LoggingInfo(0);
  sub_100040F20();
  sub_1000192D0();
  uint64_t v0 = sub_10002A494();

  return v1(v0);
}

uint64_t ClientInfo.LoggingInfo.dictationUIInteractionID.getter()
{
  return sub_10002A494();
}

uint64_t ClientInfo.LoggingInfo.init(asrID:requestID:dictationUIInteractionID:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v10 = sub_100040F20();
  sub_1000192D0();
  id v12 = *(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 32);
  v12(a5, a1, v10);
  uint64_t v13 = type metadata accessor for ClientInfo.LoggingInfo(0);
  uint64_t result = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v12)(a5 + *(int *)(v13 + 20), a2, v10);
  id v15 = (void *)(a5 + *(int *)(v13 + 24));
  *id v15 = a3;
  v15[1] = a4;
  return result;
}

uint64_t static ClientInfo.LoggingInfo.__derived_struct_equals(_:_:)(uint64_t a1, uint64_t a2)
{
  if ((sub_100040F00() & 1) == 0) {
    return 0;
  }
  uint64_t v4 = type metadata accessor for ClientInfo.LoggingInfo(0);
  if ((sub_100040F00() & 1) == 0) {
    return 0;
  }
  uint64_t v5 = *(int *)(v4 + 24);
  uint64_t v6 = *(void *)(a1 + v5);
  uint64_t v7 = *(void *)(a1 + v5 + 8);
  uint64_t v8 = (void *)(a2 + v5);
  if (v6 == *v8 && v7 == v8[1]) {
    return 1;
  }

  return sub_100041720();
}

uint64_t static ClientInfo.__derived_struct_equals(_:_:)(void *a1, void *a2)
{
  uint64_t v4 = type metadata accessor for ClientInfo.LoggingInfo(0);
  sub_1000192D0();
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)&v42 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100007A58(&qword_1000643B0);
  sub_1000192D0();
  __chkstk_darwin(v9);
  uint64_t v11 = (char *)&v42 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100007A58(&qword_1000643A8);
  uint64_t v13 = __chkstk_darwin(v12 - 8);
  id v15 = (char *)&v42 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = __chkstk_darwin(v13);
  uint64_t v18 = (char *)&v42 - v17;
  __chkstk_darwin(v16);
  uint64_t v20 = (char *)&v42 - v19;
  BOOL v21 = *a1 == *a2 && a1[1] == a2[1];
  if (!v21)
  {
    char v22 = 0;
    if ((sub_100041720() & 1) == 0) {
      return v22 & 1;
    }
  }
  if (a1[2] != a2[2] || a1[3] != a2[3])
  {
    char v22 = 0;
    if ((sub_100041720() & 1) == 0) {
      return v22 & 1;
    }
  }
  uint64_t v24 = a1[5];
  uint64_t v25 = a2[5];
  if (v24)
  {
    if (!v25) {
      goto LABEL_29;
    }
    if (a1[4] != a2[4] || v24 != v25)
    {
      char v22 = 0;
      if ((sub_100041720() & 1) == 0) {
        return v22 & 1;
      }
    }
  }
  else if (v25)
  {
    goto LABEL_29;
  }
  uint64_t v27 = a1[7];
  uint64_t v28 = a2[7];
  if (v27)
  {
    if (v28)
    {
      if (a1[6] != a2[6] || v27 != v28)
      {
        char v22 = 0;
        if ((sub_100041720() & 1) == 0) {
          return v22 & 1;
        }
      }
      goto LABEL_30;
    }
LABEL_29:
    char v22 = 0;
    return v22 & 1;
  }
  if (v28) {
    goto LABEL_29;
  }
LABEL_30:
  uint64_t v30 = type metadata accessor for ClientInfo(0);
  sub_10002B8F8((uint64_t)a1 + *(int *)(v30 + 32), (uint64_t)v20);
  sub_10002B8F8((uint64_t)a2 + *(int *)(v30 + 32), (uint64_t)v18);
  uint64_t v31 = (uint64_t)&v11[*(int *)(v8 + 48)];
  sub_10002B8F8((uint64_t)v20, (uint64_t)v11);
  sub_10002B8F8((uint64_t)v18, v31);
  sub_10002D2E8((uint64_t)v11);
  if (v21)
  {
    sub_10002BF4C((uint64_t)v18, &qword_1000643A8);
    sub_10002BF4C((uint64_t)v20, &qword_1000643A8);
    sub_10002D2E8(v31);
    if (v21) {
      char v22 = -1;
    }
    else {
      char v22 = 0;
    }
  }
  else
  {
    sub_10002B8F8((uint64_t)v11, (uint64_t)v15);
    sub_10002D2E8(v31);
    if (v32)
    {
      char v22 = 0;
    }
    else
    {
      sub_10002BFFC(v31, (uint64_t)v7);
      char v33 = sub_100040F00();
      char v22 = 0;
      if (v33 & 1) != 0 && (sub_100040F00())
      {
        uint64_t v34 = *(int *)(v4 + 24);
        uint64_t v35 = *(void *)&v15[v34];
        uint64_t v36 = *(void *)&v15[v34 + 8];
        uint64_t v37 = &v7[v34];
        BOOL v38 = v35 == *(void *)v37 && v36 == *((void *)v37 + 1);
        if (v38 || (sub_100041720() & 1) != 0) {
          char v22 = 1;
        }
      }
      sub_10002BFA0((uint64_t)v7);
    }
    sub_10002BF4C((uint64_t)v18, &qword_1000643A8);
    sub_10002BF4C((uint64_t)v20, &qword_1000643A8);
    sub_10002BFA0((uint64_t)v15);
  }
  uint64_t v39 = sub_10002A494();
  sub_10002BF4C(v39, v40);
  return v22 & 1;
}

uint64_t sub_10002BF4C(uint64_t a1, uint64_t *a2)
{
  sub_100007A58(a2);
  sub_1000192D0();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
}

uint64_t sub_10002BFA0(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for ClientInfo.LoggingInfo(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10002BFFC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ClientInfo.LoggingInfo(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t *initializeBufferWithCopyOfBuffer for ClientInfo(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3 = a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v14 = *a2;
    *uint64_t v3 = *a2;
    uint64_t v3 = (uint64_t *)(v14 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    uint64_t v5 = a2[1];
    *a1 = *a2;
    a1[1] = v5;
    uint64_t v6 = a2[3];
    a1[2] = a2[2];
    a1[3] = v6;
    uint64_t v7 = a2[5];
    a1[4] = a2[4];
    a1[5] = v7;
    uint64_t v8 = a2[7];
    uint64_t v9 = *(int *)(a3 + 32);
    uint64_t v10 = (char *)a2 + v9;
    uint64_t v11 = (char *)a1 + v9;
    a1[6] = a2[6];
    a1[7] = v8;
    uint64_t v12 = type metadata accessor for ClientInfo.LoggingInfo(0);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (sub_100007B04((uint64_t)v10, 1, v12))
    {
      uint64_t v13 = sub_100007A58(&qword_1000643A8);
      memcpy(v11, v10, *(void *)(*(void *)(v13 - 8) + 64));
    }
    else
    {
      uint64_t v15 = sub_100040F20();
      uint64_t v16 = *(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 16);
      v16(v11, v10, v15);
      v16(&v11[*(int *)(v12 + 20)], &v10[*(int *)(v12 + 20)], v15);
      uint64_t v17 = *(int *)(v12 + 24);
      uint64_t v18 = &v11[v17];
      uint64_t v19 = &v10[v17];
      uint64_t v20 = *((void *)v19 + 1);
      *(void *)uint64_t v18 = *(void *)v19;
      *((void *)v18 + 1) = v20;
      swift_bridgeObjectRetain();
      sub_10000A374((uint64_t)v11, 0, 1, v12);
    }
  }
  return v3;
}

uint64_t destroy for ClientInfo(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 32);
  uint64_t v5 = type metadata accessor for ClientInfo.LoggingInfo(0);
  uint64_t result = sub_100007B04(v4, 1, v5);
  if (!result)
  {
    uint64_t v7 = sub_100040F20();
    uint64_t v8 = *(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8);
    v8(v4, v7);
    v8(v4 + *(int *)(v5 + 20), v7);
    return swift_bridgeObjectRelease();
  }
  return result;
}

void *initializeWithCopy for ClientInfo(void *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  uint64_t v6 = a2[5];
  a1[4] = a2[4];
  a1[5] = v6;
  uint64_t v7 = a2[7];
  uint64_t v8 = *(int *)(a3 + 32);
  uint64_t v9 = (char *)a2 + v8;
  uint64_t v10 = (char *)a1 + v8;
  a1[6] = a2[6];
  a1[7] = v7;
  uint64_t v11 = type metadata accessor for ClientInfo.LoggingInfo(0);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (sub_100007B04((uint64_t)v9, 1, v11))
  {
    uint64_t v12 = sub_100007A58(&qword_1000643A8);
    memcpy(v10, v9, *(void *)(*(void *)(v12 - 8) + 64));
  }
  else
  {
    uint64_t v13 = sub_100040F20();
    uint64_t v14 = *(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 16);
    v14(v10, v9, v13);
    v14(&v10[*(int *)(v11 + 20)], &v9[*(int *)(v11 + 20)], v13);
    uint64_t v15 = *(int *)(v11 + 24);
    uint64_t v16 = &v10[v15];
    uint64_t v17 = &v9[v15];
    uint64_t v18 = *((void *)v17 + 1);
    *(void *)uint64_t v16 = *(void *)v17;
    *((void *)v16 + 1) = v18;
    swift_bridgeObjectRetain();
    sub_10000A374((uint64_t)v10, 0, 1, v11);
  }
  return a1;
}

void *assignWithCopy for ClientInfo(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[6] = a2[6];
  a1[7] = a2[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 32);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = type metadata accessor for ClientInfo.LoggingInfo(0);
  int v10 = sub_100007B04((uint64_t)v7, 1, v9);
  int v11 = sub_100007B04((uint64_t)v8, 1, v9);
  if (!v10)
  {
    if (!v11)
    {
      uint64_t v19 = sub_100040F20();
      uint64_t v20 = *(void (**)(char *, char *, uint64_t))(*(void *)(v19 - 8) + 24);
      v20(v7, v8, v19);
      v20(&v7[*(int *)(v9 + 20)], &v8[*(int *)(v9 + 20)], v19);
      uint64_t v21 = *(int *)(v9 + 24);
      char v22 = &v7[v21];
      uint64_t v23 = &v8[v21];
      *(void *)char v22 = *(void *)v23;
      *((void *)v22 + 1) = *((void *)v23 + 1);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      return a1;
    }
    sub_10002BFA0((uint64_t)v7);
    goto LABEL_6;
  }
  if (v11)
  {
LABEL_6:
    uint64_t v17 = sub_100007A58(&qword_1000643A8);
    memcpy(v7, v8, *(void *)(*(void *)(v17 - 8) + 64));
    return a1;
  }
  uint64_t v12 = sub_100040F20();
  uint64_t v13 = *(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16);
  v13(v7, v8, v12);
  v13(&v7[*(int *)(v9 + 20)], &v8[*(int *)(v9 + 20)], v12);
  uint64_t v14 = *(int *)(v9 + 24);
  uint64_t v15 = &v7[v14];
  uint64_t v16 = &v8[v14];
  *(void *)uint64_t v15 = *(void *)v16;
  *((void *)v15 + 1) = *((void *)v16 + 1);
  swift_bridgeObjectRetain();
  sub_10000A374((uint64_t)v7, 0, 1, v9);
  return a1;
}

_OWORD *initializeWithTake for ClientInfo(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  long long v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  long long v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  uint64_t v6 = *(int *)(a3 + 32);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = type metadata accessor for ClientInfo.LoggingInfo(0);
  if (sub_100007B04((uint64_t)v8, 1, v9))
  {
    uint64_t v10 = sub_100007A58(&qword_1000643A8);
    memcpy(v7, v8, *(void *)(*(void *)(v10 - 8) + 64));
  }
  else
  {
    uint64_t v11 = sub_100040F20();
    uint64_t v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 32);
    v12(v7, v8, v11);
    v12(&v7[*(int *)(v9 + 20)], &v8[*(int *)(v9 + 20)], v11);
    *(_OWORD *)&v7[*(int *)(v9 + 24)] = *(_OWORD *)&v8[*(int *)(v9 + 24)];
    sub_10000A374((uint64_t)v7, 0, 1, v9);
  }
  return a1;
}

void *assignWithTake for ClientInfo(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = a2[5];
  a1[4] = a2[4];
  a1[5] = v8;
  swift_bridgeObjectRelease();
  uint64_t v9 = a2[7];
  a1[6] = a2[6];
  a1[7] = v9;
  swift_bridgeObjectRelease();
  uint64_t v10 = *(int *)(a3 + 32);
  uint64_t v11 = (char *)a1 + v10;
  uint64_t v12 = (char *)a2 + v10;
  uint64_t v13 = type metadata accessor for ClientInfo.LoggingInfo(0);
  int v14 = sub_100007B04((uint64_t)v11, 1, v13);
  int v15 = sub_100007B04((uint64_t)v12, 1, v13);
  if (!v14)
  {
    if (!v15)
    {
      uint64_t v20 = sub_100040F20();
      uint64_t v21 = *(void (**)(char *, char *, uint64_t))(*(void *)(v20 - 8) + 40);
      v21(v11, v12, v20);
      v21(&v11[*(int *)(v13 + 20)], &v12[*(int *)(v13 + 20)], v20);
      uint64_t v22 = *(int *)(v13 + 24);
      uint64_t v23 = &v11[v22];
      uint64_t v24 = &v12[v22];
      uint64_t v26 = *(void *)v24;
      uint64_t v25 = *((void *)v24 + 1);
      *(void *)uint64_t v23 = v26;
      *((void *)v23 + 1) = v25;
      swift_bridgeObjectRelease();
      return a1;
    }
    sub_10002BFA0((uint64_t)v11);
    goto LABEL_6;
  }
  if (v15)
  {
LABEL_6:
    uint64_t v18 = sub_100007A58(&qword_1000643A8);
    memcpy(v11, v12, *(void *)(*(void *)(v18 - 8) + 64));
    return a1;
  }
  uint64_t v16 = sub_100040F20();
  uint64_t v17 = *(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 32);
  v17(v11, v12, v16);
  v17(&v11[*(int *)(v13 + 20)], &v12[*(int *)(v13 + 20)], v16);
  *(_OWORD *)&v11[*(int *)(v13 + 24)] = *(_OWORD *)&v12[*(int *)(v13 + 24)];
  sub_10000A374((uint64_t)v11, 0, 1, v13);
  return a1;
}

uint64_t getEnumTagSinglePayload for ClientInfo(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10002CA08);
}

uint64_t sub_10002CA08(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF) {
    return sub_10002D308(*(void *)(a1 + 8));
  }
  uint64_t v7 = sub_100007A58(&qword_1000643A8);
  uint64_t v8 = a1 + *(int *)(a3 + 32);

  return sub_100007B04(v8, a2, v7);
}

uint64_t storeEnumTagSinglePayload for ClientInfo(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10002CA9C);
}

uint64_t sub_10002CA9C(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_100007A58(&qword_1000643A8);
    uint64_t v8 = v5 + *(int *)(a4 + 32);
    return sub_10000A374(v8, a2, a2, v7);
  }
  return result;
}

void sub_10002CB20()
{
  sub_10002CBC4();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_10002CBC4()
{
  if (!qword_100064420)
  {
    type metadata accessor for ClientInfo.LoggingInfo(255);
    unint64_t v0 = sub_100041440();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_100064420);
    }
  }
}

uint64_t *initializeBufferWithCopyOfBuffer for ClientInfo.LoggingInfo(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v13 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v13 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_100040F20();
    uint64_t v8 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16);
    v8(a1, a2, v7);
    v8((uint64_t *)((char *)a1 + *(int *)(a3 + 20)), (uint64_t *)((char *)a2 + *(int *)(a3 + 20)), v7);
    uint64_t v9 = *(int *)(a3 + 24);
    uint64_t v10 = (uint64_t *)((char *)a1 + v9);
    uint64_t v11 = (uint64_t *)((char *)a2 + v9);
    uint64_t v12 = v11[1];
    *uint64_t v10 = *v11;
    v10[1] = v12;
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t destroy for ClientInfo.LoggingInfo(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100040F20();
  int v5 = *(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(a1, v4);
  v5(a1 + *(int *)(a2 + 20), v4);

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for ClientInfo.LoggingInfo(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100040F20();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16);
  v7(a1, a2, v6);
  v7(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20), v6);
  uint64_t v8 = *(int *)(a3 + 24);
  uint64_t v9 = (void *)(a1 + v8);
  uint64_t v10 = (void *)(a2 + v8);
  uint64_t v11 = v10[1];
  *uint64_t v9 = *v10;
  v9[1] = v11;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for ClientInfo.LoggingInfo(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100040F20();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24);
  v7(a1, a2, v6);
  v7(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20), v6);
  uint64_t v8 = *(int *)(a3 + 24);
  uint64_t v9 = (void *)(a1 + v8);
  uint64_t v10 = (void *)(a2 + v8);
  *uint64_t v9 = *v10;
  v9[1] = v10[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t initializeWithTake for ClientInfo.LoggingInfo(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100040F20();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32);
  v7(a1, a2, v6);
  v7(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20), v6);
  *(_OWORD *)(a1 + *(int *)(a3 + 24)) = *(_OWORD *)(a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t assignWithTake for ClientInfo.LoggingInfo(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100040F20();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40);
  v7(a1, a2, v6);
  v7(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20), v6);
  uint64_t v8 = *(int *)(a3 + 24);
  uint64_t v9 = (void *)(a1 + v8);
  uint64_t v10 = (uint64_t *)(a2 + v8);
  uint64_t v12 = *v10;
  uint64_t v11 = v10[1];
  *uint64_t v9 = v12;
  v9[1] = v11;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ClientInfo.LoggingInfo(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10002D0A0);
}

uint64_t sub_10002D0A0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_100040F20();
  sub_10002D2A8();
  if (*(_DWORD *)(v7 + 84) != a2) {
    return sub_10002D308(*(void *)(a1 + *(int *)(a3 + 24) + 8));
  }

  return sub_100007B04(a1, a2, v6);
}

uint64_t storeEnumTagSinglePayload for ClientInfo.LoggingInfo(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10002D138);
}

void sub_10002D138(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  sub_100040F20();
  sub_10002D2A8();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    sub_10000A374(a1, a2, a2, v8);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 24) + 8) = (a2 - 1);
  }
}

uint64_t sub_10002D1C4()
{
  uint64_t result = sub_100040F20();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_10002D25C()
{
  uint64_t v9 = (uint64_t)v8 + *(int *)(type metadata accessor for ClientInfo(0) + 32);
  uint64_t v10 = type metadata accessor for ClientInfo.LoggingInfo(0);
  uint64_t result = sub_10000A374(v9, 1, 1, v10);
  *uint64_t v8 = v7;
  v8[1] = v6;
  v8[4] = v5;
  v8[5] = v4;
  v8[2] = v3;
  v8[3] = v2;
  v8[6] = v1;
  v8[7] = v0;
  return result;
}

uint64_t sub_10002D2E8(uint64_t a1)
{
  return sub_100007B04(a1, 1, v1);
}

uint64_t sub_10002D308@<X0>(unint64_t a1@<X8>)
{
  if (a1 >= 0xFFFFFFFF) {
    LODWORD(a1) = -1;
  }
  return (a1 + 1);
}

id sub_10002D31C(uint64_t a1)
{
  return sub_10002D580(a1, type metadata accessor for AssistantAssetDelegateInterface, &qword_100064888);
}

uint64_t sub_10002D39C()
{
  return sub_10002FA1C();
}

uint64_t sub_10002D41C(uint64_t a1)
{
  return sub_10002F9B8(a1);
}

void sub_10002D478(uint64_t a1)
{
}

id sub_10002D4AC()
{
  return sub_10002DD58(3, type metadata accessor for AssistantAssetDelegateInterface);
}

uint64_t type metadata accessor for AssistantAssetDelegateInterface()
{
  return self;
}

id sub_10002D560(uint64_t a1)
{
  return sub_10002D580(a1, type metadata accessor for GeneralASRAssetDelegateInterface, &qword_100064890);
}

id sub_10002D580(uint64_t a1, uint64_t (*a2)(void), void *a3)
{
  id result = [objc_allocWithZone((Class)a2()) init];
  *a3 = result;
  return result;
}

id sub_10002D5BC(void *a1, void **a2)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v3 = *a2;

  return v3;
}

Class sub_10002D668(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3();
  v3.super.Class isa = sub_100041120().super.isa;
  swift_bridgeObjectRelease();

  return v3.super.isa;
}

uint64_t sub_10002D6CC()
{
  return sub_10002FA1C();
}

uint64_t sub_10002D74C(uint64_t a1)
{
  return sub_10002F9B8(a1);
}

char *sub_10002D758(uint64_t *a1, uint64_t *a2, uint64_t (*a3)(void), uint64_t a4)
{
  uint64_t v9 = *a1;
  uint64_t v10 = self;
  uint64_t v11 = v4;
  *(void *)&v4[v9] = [v10 sharedInstance];
  uint64_t v12 = *a2;
  *(void *)&v11[v12] = sub_100041140();

  v28.receiver = v11;
  v28.Class super_class = (Class)a3();
  uint64_t v13 = (char *)objc_msgSendSuper2(&v28, "init");
  int v14 = *(void **)&v13[*a1];
  int v15 = v13;
  [v14 registerAssetDelegate:v15 assetType:a4];
  if (qword_1000621B8 != -1) {
    swift_once();
  }
  uint64_t v16 = sub_1000410D0();
  sub_100007B8C(v16, (uint64_t)qword_100064678);
  uint64_t v17 = sub_1000410C0();
  os_log_type_t v18 = sub_100041390();
  if (os_log_type_enabled(v17, v18))
  {
    uint64_t v19 = (_DWORD *)swift_slowAlloc();
    uint64_t v27 = swift_slowAlloc();
    *uint64_t v19 = 136315138;
    id v20 = (id)SFEntitledAssetTypeToString();
    uint64_t v21 = sub_1000411F0();
    unint64_t v23 = v22;

    sub_10002E330(v21, v23, &v27);
    sub_100041450();
    swift_bridgeObjectRelease();
    sub_10002FA94((void *)&_mh_execute_header, v24, v25, "Now observing %s asset updates.");
    swift_arrayDestroy();
    sub_10000A754();
    sub_10000A754();
  }

  return v15;
}

void sub_10002D9E8(uint64_t a1)
{
}

void sub_10002DA04(uint64_t a1, uint64_t a2, void (*a3)(uint64_t))
{
  id v4 = (id)SFEntitledAssetTypeToString();
  uint64_t v5 = sub_1000411F0();
  unint64_t v7 = v6;

  uint64_t v8 = swift_bridgeObjectRetain();
  a3(v8);
  uint64_t v9 = swift_bridgeObjectRetain();
  sub_10002EF88(v9);
  swift_bridgeObjectRelease();
  uint64_t v10 = swift_bridgeObjectRetain();
  uint64_t v11 = sub_10002EDBC(v10);
  swift_release();
  v19[0] = (uint64_t)v11;
  sub_100018780(v19);
  swift_release();
  if (qword_1000621B8 != -1) {
    swift_once();
  }
  uint64_t v12 = sub_1000410D0();
  sub_100007B8C(v12, (uint64_t)qword_100064678);
  swift_bridgeObjectRetain();
  swift_retain();
  uint64_t v13 = sub_1000410C0();
  os_log_type_t v14 = sub_100041390();
  if (os_log_type_enabled(v13, v14))
  {
    uint64_t v15 = swift_slowAlloc();
    v19[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v15 = 136315394;
    swift_bridgeObjectRetain();
    sub_10002E330(v5, v7, v19);
    sub_100041450();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v15 + 12) = 2080;
    swift_bridgeObjectRetain();
    uint64_t v16 = sub_100041280();
    unint64_t v18 = v17;
    swift_release();
    sub_10002E330(v16, v18, v19);
    sub_100041450();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v13, v14, "Received update for %s assets, available languages: %s", (uint8_t *)v15, 0x16u);
    swift_arrayDestroy();
    sub_10000A754();
    sub_10000A754();
  }
  else
  {

    swift_release_n();
    swift_bridgeObjectRelease_n();
  }
}

uint64_t sub_10002DCC4(void *a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t))
{
  uint64_t v6 = sub_100041130();
  id v7 = a1;
  a4(v6);

  return swift_bridgeObjectRelease();
}

id sub_10002DD3C()
{
  return sub_10002DD58(7, type metadata accessor for GeneralASRAssetDelegateInterface);
}

id sub_10002DD58(uint64_t a1, uint64_t (*a2)(void))
{
  id v4 = v2;
  if (qword_1000621B8 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_1000410D0();
  sub_100007B8C(v5, (uint64_t)qword_100064678);
  uint64_t v6 = sub_1000410C0();
  os_log_type_t v7 = sub_100041390();
  if (os_log_type_enabled(v6, v7))
  {
    unint64_t v18 = a2;
    uint64_t v8 = v4;
    uint64_t v9 = (_DWORD *)swift_slowAlloc();
    uint64_t v19 = swift_slowAlloc();
    *uint64_t v9 = 136315138;
    id v10 = (id)SFEntitledAssetTypeToString();
    uint64_t v11 = sub_1000411F0();
    unint64_t v13 = v12;

    sub_10002E330(v11, v13, &v19);
    sub_100041450();
    id v4 = v8;
    a2 = v18;
    swift_bridgeObjectRelease();
    sub_10002FA94((void *)&_mh_execute_header, v14, v15, "No longer observing %s asset updates.");
    swift_arrayDestroy();
    sub_10000A754();
    sub_10000A754();
  }

  uint64_t v16 = (objc_class *)a2();
  v20.receiver = v4;
  v20.Class super_class = v16;
  return objc_msgSendSuper2(&v20, "dealloc");
}

uint64_t type metadata accessor for GeneralASRAssetDelegateInterface()
{
  return self;
}

void *sub_10002DFA8(uint64_t a1)
{
  if (a1 < 0)
  {
    sub_1000150E8();
    id result = (void *)sub_100041690();
    __break(1u);
  }
  else if (a1)
  {
    id result = (void *)sub_1000412B0();
    result[2] = a1;
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

char *sub_10002E038(char *result, uint64_t a2, char *a3)
{
  if (a2 < 0)
  {
    sub_1000150E8();
    id result = (char *)sub_10002FA24();
    __break(1u);
  }
  else if (a3 != result || &result[16 * a2] <= a3)
  {
    return (char *)sub_10002F99C(a3, result);
  }
  return result;
}

char *sub_10002E0A0(char *result, uint64_t a2, char *a3)
{
  if (a2 < 0)
  {
    sub_1000150E8();
    id result = (char *)sub_10002FA24();
    __break(1u);
  }
  else if (a3 != result || &result[8 * a2] <= a3)
  {
    return (char *)sub_10002F99C(a3, result);
  }
  return result;
}

uint64_t sub_10002E108(unint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a2 < 0)
  {
    sub_1000150E8();
    sub_10002FA4C();
LABEL_11:
    uint64_t result = sub_10002FA24();
    __break(1u);
    return result;
  }
  if (a3 + 16 * a2 > a1 && a1 + 16 * a2 > a3)
  {
    sub_1000150E8();
    sub_10002FA3C();
    goto LABEL_11;
  }

  return swift_arrayInitWithCopy();
}

void *sub_10002E1B8(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    sub_1000150E8();
    sub_10002FA4C();
LABEL_11:
    uint64_t result = (void *)sub_10002FA24();
    __break(1u);
    return result;
  }
  if (&__dst[8 * a2] > __src && &__src[8 * a2] > __dst)
  {
    sub_1000150E8();
    sub_10002FA3C();
    goto LABEL_11;
  }

  return memcpy(__dst, __src, 8 * a2);
}

uint64_t sub_10002E264(unint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a2 < 0)
  {
    sub_1000150E8();
    sub_10002FA4C();
LABEL_11:
    uint64_t result = sub_10002FA24();
    __break(1u);
    return result;
  }
  if (a3 + 8 * a2 > a1 && a1 + 8 * a2 > a3)
  {
    sub_1000150E8();
    sub_10002FA3C();
    goto LABEL_11;
  }
  sub_10002F95C();

  return swift_arrayInitWithCopy();
}

uint64_t sub_10002E330(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_10002E404(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    unint64_t ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_100029B40((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    unint64_t ObjectType = &type metadata for _StringGuts;
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_100029B40((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_100029B9C((uint64_t)v12);
  return v7;
}

uint64_t sub_10002E404(void *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      sub_10002E55C((char *)__src, HIBYTE(a6) & 0xF, __dst);
      sub_100041460();
      uint64_t result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    uint64_t result = (uint64_t)sub_10002E634(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    uint64_t v8 = sub_1000415B0();
    if (!v8)
    {
      uint64_t result = sub_100041690();
      __break(1u);
      return result;
    }
  }
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

void *sub_10002E55C(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_100041700();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

void *sub_10002E634(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_10002E6CC(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_10002E8A8(0, v2[2] + 1, 1, (uint64_t)v2);
  }
  unint64_t v4 = v2[2];
  unint64_t v3 = v2[3];
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_10002E8A8((char *)(v3 > 1), v4 + 1, 1, (uint64_t)v2);
  }
  v2[2] = v4 + 1;
  *((unsigned char *)v2 + v4 + 32) = 0;
  return v2;
}

void *sub_10002E6CC(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0)
  {
    Swift::Int v2 = sub_100041240();
    if (v2) {
      goto LABEL_6;
    }
    return &_swiftEmptyArrayStorage;
  }
  if ((a2 & 0x2000000000000000) != 0) {
    Swift::Int v2 = HIBYTE(a2) & 0xF;
  }
  else {
    Swift::Int v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (!v2) {
    return &_swiftEmptyArrayStorage;
  }
LABEL_6:
  unint64_t v3 = sub_10002E840(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    unint64_t v4 = v3;
    uint64_t v5 = sub_100041570();
    if ((v6 & 1) != 0 || v5 != v2) {
      goto LABEL_14;
    }
    return v4;
  }
  sub_100041700();
  __break(1u);
LABEL_14:
  uint64_t result = (void *)sub_100041690();
  __break(1u);
  return result;
}

void *sub_10002E840(uint64_t a1, uint64_t a2)
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
  sub_100007A58((uint64_t *)&unk_1000645D0);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  _OWORD v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_10002E8A8(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *(void *)(a4 + 24);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
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
  int64_t v8 = *(void *)(a4 + 16);
  if (v7 <= v8) {
    int64_t v9 = *(void *)(a4 + 16);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    sub_100007A58((uint64_t *)&unk_1000645D0);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  unint64_t v12 = v10 + 32;
  unint64_t v13 = (char *)(a4 + 32);
  if (v5)
  {
    sub_10002EA58(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_10002E980(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_10002E980(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_100041700();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

char *sub_10002EA58(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    __src = (char *)sub_100041700();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

unint64_t sub_10002EAE8(unint64_t result, char a2, uint64_t a3)
{
  if (a2)
  {
    if ((result & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else if (*(void *)(a3 + 16) > result)
    {
      return result;
    }
    __break(1u);
  }
  return result;
}

unint64_t sub_10002EB0C(unint64_t result, char a2, uint64_t a3)
{
  if (a2)
  {
    if ((result & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else if (*(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) > result)
    {
      return result;
    }
    __break(1u);
  }
  return result;
}

void sub_10002EB30(char a1, uint64_t a2, char a3, uint64_t a4)
{
  if (a3)
  {
    sub_10002FA6C();
    if (v7 != v8)
    {
      if (v6 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return;
      }
      sub_10002FA5C();
    }
  }
  else
  {
    uint64_t v6 = a2;
  }
  uint64_t v9 = *(void *)(a4 + 16);
  if (v6 <= v9) {
    uint64_t v10 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v10 = v6;
  }
  if (v10)
  {
    sub_100007A58(&qword_100063558);
    size_t v11 = (char *)sub_10002FA7C();
    j__malloc_size(v11);
    sub_10002F9C8();
    *((void *)v11 + 2) = v9;
    *((void *)v11 + 3) = v12;
  }
  else
  {
    size_t v11 = (char *)&_swiftEmptyArrayStorage;
  }
  unint64_t v13 = v11 + 32;
  uint64_t v14 = (char *)(a4 + 32);
  if (a1)
  {
    sub_10002E038(v14, v9, v13);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_10002E108((unint64_t)v14, v9, (unint64_t)v13);
  }
  swift_release();
}

void sub_10002EBF0(char a1, uint64_t a2, char a3, uint64_t a4)
{
}

void sub_10002EBFC(char a1, uint64_t a2, char a3, uint64_t a4)
{
}

void sub_10002EC08(char a1, uint64_t a2, char a3, uint64_t a4, uint64_t *a5)
{
  if (a3)
  {
    sub_10002FA6C();
    if (v8 != v9)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return;
      }
      sub_10002FA5C();
    }
  }
  else
  {
    uint64_t v7 = a2;
  }
  uint64_t v10 = *(void *)(a4 + 16);
  if (v7 <= v10) {
    uint64_t v11 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v11 = v7;
  }
  if (v11)
  {
    sub_100007A58(a5);
    uint64_t v12 = (char *)sub_10002FA7C();
    size_t v13 = j__malloc_size(v12);
    *((void *)v12 + 2) = v10;
    *((void *)v12 + 3) = 2 * ((uint64_t)(v13 - 32) / 8);
  }
  else
  {
    uint64_t v12 = (char *)_swiftEmptyArrayStorage;
  }
  uint64_t v14 = v12 + 32;
  uint64_t v15 = (char *)(a4 + 32);
  if (a1)
  {
    sub_10002E0A0(v15, v10, v14);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_10002E1B8(v15, v10, v14);
  }
  swift_release();
}

uint64_t sub_10002ECD0(uint64_t result, uint64_t a2, void *a3)
{
  if (a2 < 0)
  {
    __break(1u);
  }
  else
  {
    for (; a2; --a2)
      *a3++ = result;
  }
  return result;
}

void *sub_10002ECEC(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return _swiftEmptyArrayStorage;
  }
  sub_100007A58(&qword_100063558);
  uint64_t v3 = (void *)sub_10002FA7C();
  j__malloc_size(v3);
  sub_10002F9C8();
  v3[2] = v1;
  v3[3] = v4;
  uint64_t v5 = sub_10002F548((uint64_t)&v7, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  sub_100010520();
  if (v5 != v1)
  {
    __break(1u);
    return _swiftEmptyArrayStorage;
  }
  return v3;
}

void *sub_10002EDBC(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return _swiftEmptyArrayStorage;
  }
  sub_100007A58(&qword_100063558);
  uint64_t v3 = (void *)swift_allocObject();
  size_t v4 = j__malloc_size(v3);
  v3[2] = v1;
  v3[3] = 2 * ((uint64_t)(v4 - 32) / 16);
  uint64_t v5 = sub_10002F748((uint64_t)&v7, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  sub_100010520();
  if (v5 != v1)
  {
    __break(1u);
    return _swiftEmptyArrayStorage;
  }
  return v3;
}

void sub_10002EEA0(char a1, uint64_t a2, char a3, char *a4)
{
  if (a3)
  {
    sub_10002FA6C();
    if (v7 != v8)
    {
      if (v6 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return;
      }
      sub_10002FA5C();
    }
  }
  else
  {
    uint64_t v6 = a2;
  }
  uint64_t v9 = *((void *)a4 + 2);
  if (v6 <= v9) {
    uint64_t v10 = *((void *)a4 + 2);
  }
  else {
    uint64_t v10 = v6;
  }
  if (v10)
  {
    sub_100007A58((uint64_t *)&unk_1000645E0);
    uint64_t v11 = (char *)sub_10002FA7C();
    j__malloc_size(v11);
    sub_10002F9C8();
    *((void *)v11 + 2) = v9;
    *((void *)v11 + 3) = v12;
  }
  else
  {
    uint64_t v11 = (char *)&_swiftEmptyArrayStorage;
  }
  size_t v13 = v11 + 32;
  uint64_t v14 = a4 + 32;
  if (a1)
  {
    if (v11 != a4 || &v14[16 * v9] <= v13) {
      memmove(v13, v14, 16 * v9);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 16 * v9);
  }
  swift_bridgeObjectRelease();
}

void sub_10002EF74(uint64_t a1)
{
}

uint64_t sub_10002EF88(uint64_t isStackAllocationSafe)
{
  uint64_t v2 = isStackAllocationSafe;
  if ((*(unsigned char *)(isStackAllocationSafe + 32) & 0x3Fu) <= 0xD
    || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    __chkstk_darwin(isStackAllocationSafe);
    sub_10002F9DC();
    if (v1) {
      swift_willThrow();
    }
    else {
      return v3;
    }
  }
  else
  {
    swift_slowAlloc();
    sub_10002F9DC();
    uint64_t v2 = v4;
    swift_slowDealloc();
  }
  return v2;
}

void sub_10002F0AC(unint64_t *a1, uint64_t a2, uint64_t a3)
{
  int64_t v4 = 0;
  uint64_t v20 = a3 + 64;
  uint64_t v5 = 1 << *(unsigned char *)(a3 + 32);
  uint64_t v6 = -1;
  if (v5 < 64) {
    uint64_t v6 = ~(-1 << v5);
  }
  unint64_t v7 = v6 & *(void *)(a3 + 64);
  int64_t v8 = (unint64_t)(v5 + 63) >> 6;
  while (1)
  {
    if (v7)
    {
      unint64_t v9 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      unint64_t v10 = v9 | (v4 << 6);
      goto LABEL_20;
    }
    int64_t v11 = v4 + 1;
    if (__OFADD__(v4, 1))
    {
      __break(1u);
      goto LABEL_26;
    }
    if (v11 >= v8) {
      goto LABEL_24;
    }
    unint64_t v12 = *(void *)(v20 + 8 * v11);
    ++v4;
    if (!v12)
    {
      int64_t v4 = v11 + 1;
      if (v11 + 1 >= v8) {
        goto LABEL_24;
      }
      unint64_t v12 = *(void *)(v20 + 8 * v4);
      if (!v12)
      {
        int64_t v4 = v11 + 2;
        if (v11 + 2 >= v8) {
          goto LABEL_24;
        }
        unint64_t v12 = *(void *)(v20 + 8 * v4);
        if (!v12) {
          break;
        }
      }
    }
LABEL_19:
    unint64_t v7 = (v12 - 1) & v12;
    unint64_t v10 = __clz(__rbit64(v12)) + (v4 << 6);
LABEL_20:
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    NSString v14 = sub_1000411E0();
    int IsInstalled = SFEntitledAssetStatusIsInstalled();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    if (IsInstalled)
    {
      *(unint64_t *)((char *)a1 + ((v10 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v10;
      if (__OFADD__(v19++, 1))
      {
        __break(1u);
LABEL_24:
        sub_10002F298(a1, a2, v19, a3);
        return;
      }
    }
  }
  int64_t v13 = v11 + 3;
  if (v13 >= v8) {
    goto LABEL_24;
  }
  unint64_t v12 = *(void *)(v20 + 8 * v13);
  if (v12)
  {
    int64_t v4 = v13;
    goto LABEL_19;
  }
  while (1)
  {
    int64_t v4 = v13 + 1;
    if (__OFADD__(v13, 1)) {
      break;
    }
    if (v4 >= v8) {
      goto LABEL_24;
    }
    unint64_t v12 = *(void *)(v20 + 8 * v4);
    ++v13;
    if (v12) {
      goto LABEL_19;
    }
  }
LABEL_26:
  __break(1u);
}

uint64_t sub_10002F298(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (!a3) {
    return (uint64_t)&_swiftEmptyDictionarySingleton;
  }
  uint64_t v4 = a4;
  uint64_t v5 = a3;
  if (*(void *)(a4 + 16) == a3)
  {
    swift_retain();
    return v4;
  }
  sub_100007A58(&qword_100064218);
  uint64_t result = sub_1000416F0();
  uint64_t v9 = result;
  uint64_t v37 = a1;
  uint64_t v38 = a2;
  if (a2 < 1) {
    unint64_t v10 = 0;
  }
  else {
    unint64_t v10 = *a1;
  }
  uint64_t v11 = 0;
  uint64_t v12 = result + 64;
  while (1)
  {
    if (v10)
    {
      unint64_t v13 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      uint64_t v39 = v11;
      unint64_t v14 = v13 | (v11 << 6);
    }
    else
    {
      uint64_t v15 = v11 + 1;
      if (__OFADD__(v11, 1)) {
        goto LABEL_40;
      }
      if (v15 >= v38) {
        return v9;
      }
      unint64_t v16 = v37[v15];
      uint64_t v17 = v11 + 1;
      if (!v16)
      {
        uint64_t v17 = v11 + 2;
        if (v11 + 2 >= v38) {
          return v9;
        }
        unint64_t v16 = v37[v17];
        if (!v16)
        {
          uint64_t v17 = v11 + 3;
          if (v11 + 3 >= v38) {
            return v9;
          }
          unint64_t v16 = v37[v17];
          if (!v16)
          {
            uint64_t v18 = v11 + 4;
            if (v11 + 4 >= v38) {
              return v9;
            }
            unint64_t v16 = v37[v18];
            if (!v16)
            {
              while (1)
              {
                uint64_t v17 = v18 + 1;
                if (__OFADD__(v18, 1)) {
                  goto LABEL_41;
                }
                if (v17 >= v38) {
                  return v9;
                }
                unint64_t v16 = v37[v17];
                ++v18;
                if (v16) {
                  goto LABEL_24;
                }
              }
            }
            uint64_t v17 = v11 + 4;
          }
        }
      }
LABEL_24:
      unint64_t v10 = (v16 - 1) & v16;
      uint64_t v39 = v17;
      unint64_t v14 = __clz(__rbit64(v16)) + (v17 << 6);
    }
    uint64_t v19 = v4;
    uint64_t v20 = (uint64_t *)(*(void *)(v4 + 48) + 16 * v14);
    uint64_t v22 = *v20;
    uint64_t v21 = v20[1];
    unint64_t v23 = (uint64_t *)(*(void *)(v4 + 56) + 16 * v14);
    uint64_t v24 = *v23;
    uint64_t v25 = v23[1];
    sub_100041780();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_100041220();
    uint64_t result = sub_1000417A0();
    uint64_t v26 = -1 << *(unsigned char *)(v9 + 32);
    unint64_t v27 = result & ~v26;
    unint64_t v28 = v27 >> 6;
    if (((-1 << v27) & ~*(void *)(v12 + 8 * (v27 >> 6))) == 0) {
      break;
    }
    unint64_t v29 = __clz(__rbit64((-1 << v27) & ~*(void *)(v12 + 8 * (v27 >> 6)))) | v27 & 0x7FFFFFFFFFFFFFC0;
LABEL_34:
    *(void *)(v12 + ((v29 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v29;
    uint64_t v34 = (void *)(*(void *)(v9 + 48) + 16 * v29);
    void *v34 = v22;
    v34[1] = v21;
    uint64_t v35 = (void *)(*(void *)(v9 + 56) + 16 * v29);
    *uint64_t v35 = v24;
    v35[1] = v25;
    ++*(void *)(v9 + 16);
    if (__OFSUB__(v5--, 1)) {
      goto LABEL_39;
    }
    uint64_t v4 = v19;
    uint64_t v11 = v39;
    if (!v5) {
      return v9;
    }
  }
  char v30 = 0;
  unint64_t v31 = (unint64_t)(63 - v26) >> 6;
  while (++v28 != v31 || (v30 & 1) == 0)
  {
    BOOL v32 = v28 == v31;
    if (v28 == v31) {
      unint64_t v28 = 0;
    }
    v30 |= v32;
    uint64_t v33 = *(void *)(v12 + 8 * v28);
    if (v33 != -1)
    {
      unint64_t v29 = __clz(__rbit64(~v33)) + (v28 << 6);
      goto LABEL_34;
    }
  }
  __break(1u);
LABEL_39:
  __break(1u);
LABEL_40:
  __break(1u);
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_10002F548(uint64_t result, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = (void *)result;
  uint64_t v6 = a4 + 56;
  uint64_t v7 = -1 << *(unsigned char *)(a4 + 32);
  if (-v7 < 64) {
    uint64_t v8 = ~(-1 << -(char)v7);
  }
  else {
    uint64_t v8 = -1;
  }
  unint64_t v9 = v8 & *(void *)(a4 + 56);
  if (!a2)
  {
    int64_t v12 = 0;
    uint64_t v10 = 0;
LABEL_38:
    *uint64_t v5 = a4;
    v5[1] = v6;
    uint64_t v5[2] = ~v7;
    v5[3] = v12;
    v5[4] = v9;
    return v10;
  }
  uint64_t v10 = a3;
  if (!a3)
  {
    int64_t v12 = 0;
    goto LABEL_38;
  }
  if (a3 < 0)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  uint64_t v11 = a2;
  int64_t v12 = 0;
  uint64_t v13 = 0;
  int64_t v14 = (unint64_t)(63 - v7) >> 6;
  if (!v9) {
    goto LABEL_9;
  }
LABEL_8:
  unint64_t v15 = __clz(__rbit64(v9));
  v9 &= v9 - 1;
  unint64_t v16 = v15 | (v12 << 6);
  while (1)
  {
    ++v13;
    uint64_t v20 = (void *)(*(void *)(a4 + 48) + 16 * v16);
    uint64_t v21 = v20[1];
    *uint64_t v11 = *v20;
    v11[1] = v21;
    if (v13 == v10)
    {
      swift_bridgeObjectRetain();
      goto LABEL_38;
    }
    v11 += 2;
    uint64_t result = swift_bridgeObjectRetain();
    if (v9) {
      goto LABEL_8;
    }
LABEL_9:
    int64_t v17 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_40;
    }
    if (v17 >= v14) {
      goto LABEL_33;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    if (!v18) {
      break;
    }
LABEL_18:
    unint64_t v9 = (v18 - 1) & v18;
    unint64_t v16 = __clz(__rbit64(v18)) + (v17 << 6);
    int64_t v12 = v17;
  }
  v12 += 2;
  if (v17 + 1 >= v14)
  {
    unint64_t v9 = 0;
    int64_t v12 = v17;
    goto LABEL_37;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v12);
  if (v18) {
    goto LABEL_14;
  }
  int64_t v19 = v17 + 2;
  if (v17 + 2 >= v14) {
    goto LABEL_33;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18) {
    goto LABEL_17;
  }
  int64_t v12 = v17 + 3;
  if (v17 + 3 >= v14)
  {
    unint64_t v9 = 0;
    int64_t v12 = v17 + 2;
    goto LABEL_37;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v12);
  if (v18)
  {
LABEL_14:
    int64_t v17 = v12;
    goto LABEL_18;
  }
  int64_t v19 = v17 + 4;
  if (v17 + 4 >= v14)
  {
LABEL_33:
    unint64_t v9 = 0;
LABEL_37:
    uint64_t v10 = v13;
    goto LABEL_38;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18)
  {
LABEL_17:
    int64_t v17 = v19;
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v17 = v19 + 1;
    if (__OFADD__(v19, 1)) {
      break;
    }
    if (v17 >= v14)
    {
      unint64_t v9 = 0;
      int64_t v12 = v14 - 1;
      goto LABEL_37;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    ++v19;
    if (v18) {
      goto LABEL_18;
    }
  }
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_10002F748(uint64_t result, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = (void *)result;
  uint64_t v6 = a4 + 64;
  uint64_t v7 = -1 << *(unsigned char *)(a4 + 32);
  if (-v7 < 64) {
    uint64_t v8 = ~(-1 << -(char)v7);
  }
  else {
    uint64_t v8 = -1;
  }
  unint64_t v9 = v8 & *(void *)(a4 + 64);
  if (!a2)
  {
    int64_t v12 = 0;
    uint64_t v10 = 0;
LABEL_38:
    *uint64_t v5 = a4;
    v5[1] = v6;
    uint64_t v5[2] = ~v7;
    v5[3] = v12;
    v5[4] = v9;
    return v10;
  }
  uint64_t v10 = a3;
  if (!a3)
  {
    int64_t v12 = 0;
    goto LABEL_38;
  }
  if (a3 < 0)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  uint64_t v11 = a2;
  int64_t v12 = 0;
  uint64_t v13 = 0;
  int64_t v14 = (unint64_t)(63 - v7) >> 6;
  if (!v9) {
    goto LABEL_9;
  }
LABEL_8:
  unint64_t v15 = __clz(__rbit64(v9));
  v9 &= v9 - 1;
  unint64_t v16 = v15 | (v12 << 6);
  while (1)
  {
    ++v13;
    uint64_t v20 = (void *)(*(void *)(a4 + 48) + 16 * v16);
    uint64_t v21 = v20[1];
    *uint64_t v11 = *v20;
    v11[1] = v21;
    if (v13 == v10)
    {
      swift_bridgeObjectRetain();
      goto LABEL_38;
    }
    v11 += 2;
    uint64_t result = swift_bridgeObjectRetain();
    if (v9) {
      goto LABEL_8;
    }
LABEL_9:
    int64_t v17 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_40;
    }
    if (v17 >= v14) {
      goto LABEL_33;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    if (!v18) {
      break;
    }
LABEL_18:
    unint64_t v9 = (v18 - 1) & v18;
    unint64_t v16 = __clz(__rbit64(v18)) + (v17 << 6);
    int64_t v12 = v17;
  }
  v12 += 2;
  if (v17 + 1 >= v14)
  {
    unint64_t v9 = 0;
    int64_t v12 = v17;
    goto LABEL_37;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v12);
  if (v18) {
    goto LABEL_14;
  }
  int64_t v19 = v17 + 2;
  if (v17 + 2 >= v14) {
    goto LABEL_33;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18) {
    goto LABEL_17;
  }
  int64_t v12 = v17 + 3;
  if (v17 + 3 >= v14)
  {
    unint64_t v9 = 0;
    int64_t v12 = v17 + 2;
    goto LABEL_37;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v12);
  if (v18)
  {
LABEL_14:
    int64_t v17 = v12;
    goto LABEL_18;
  }
  int64_t v19 = v17 + 4;
  if (v17 + 4 >= v14)
  {
LABEL_33:
    unint64_t v9 = 0;
LABEL_37:
    uint64_t v10 = v13;
    goto LABEL_38;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18)
  {
LABEL_17:
    int64_t v17 = v19;
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v17 = v19 + 1;
    if (__OFADD__(v19, 1)) {
      break;
    }
    if (v17 >= v14)
    {
      unint64_t v9 = 0;
      int64_t v12 = v14 - 1;
      goto LABEL_37;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    ++v19;
    if (v18) {
      goto LABEL_18;
    }
  }
LABEL_41:
  __break(1u);
  return result;
}

void sub_10002F948(uint64_t a1)
{
}

unint64_t sub_10002F95C()
{
  unint64_t result = qword_1000645F0;
  if (!qword_1000645F0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1000645F0);
  }
  return result;
}

void *sub_10002F99C@<X0>(void *__dst@<X2>, const void *a2@<X8>)
{
  return memmove(__dst, a2, v2);
}

uint64_t sub_10002F9B8(uint64_t a1)
{
  *(void *)(v2 + v1) = a1;
  return swift_bridgeObjectRelease();
}

void sub_10002F9DC()
{
  sub_10002ECD0(0, v1, v2);
  sub_10002F0AC(v2, v1, v0);
}

uint64_t sub_10002FA1C()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_10002FA24()
{
  return sub_100041700();
}

uint64_t sub_10002FA7C()
{
  return swift_allocObject();
}

void sub_10002FA94(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v6, a4, v5, 0xCu);
}

void sub_100030728(_Unwind_Exception *a1, int a2)
{
  if (a2)
  {
    _Block_object_dispose(&STACK[0x220], 8);
    objc_begin_catch(a1);
    uint64_t v4 = SFLogConnection;
    if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_ERROR))
    {
      LODWORD(STACK[0x220]) = 136315138;
      STACK[0x224] = (unint64_t)"-[LSRLanguageModel trainAppLmFromNgramCountsArtifact:forApp:language:appLmArtifact:vocabFile:]";
      _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "%s Exception while training.", (uint8_t *)&STACK[0x220], 0xCu);
    }
    uint64_t v5 = SFAnalyticsEventTypeGetName();
    id v6 = v2;
    AnalyticsSendEventLazy();

    objc_end_catch();
    JUMPOUT(0x1000306BCLL);
  }
  _Unwind_Resume(a1);
}

id sub_100030888(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

id sub_100030890(uint64_t a1)
{
  id v2 = objc_alloc_init((Class)NSMutableDictionary);
  [v2 addEntriesFromDictionary:*(void *)(a1 + 32)];
  v6[0] = kSFCoreAnalyticsArtifactIdentifierKey;
  v6[1] = kSFCoreAnalyticsFailedOperationKey;
  v7[0] = &stru_10005A2E0;
  v7[1] = @"transitionArtifact";
  _OWORD v6[2] = kSFCoreAnalyticsTotalTimeKey;
  uint64_t v3 = +[NSNumber numberWithDouble:*(double *)(a1 + 40)];
  void v7[2] = v3;
  uint64_t v4 = +[NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:3];
  [v2 addEntriesFromDictionary:v4];

  return v2;
}

id sub_1000309A8(uint64_t a1)
{
  id v2 = objc_alloc_init((Class)NSMutableDictionary);
  [v2 addEntriesFromDictionary:*(void *)(a1 + 32)];
  v8[0] = kSFCoreAnalyticsArtifactIdentifierKey;
  v8[1] = kSFCoreAnalyticsFailedOperationKey;
  v9[0] = &stru_10005A2E0;
  v9[1] = @"readNgramCounts";
  v8[2] = kSFCoreAnalyticsTotalTimeKey;
  uint64_t v3 = +[NSProcessInfo processInfo];
  [v3 systemUptime];
  uint64_t v5 = +[NSNumber numberWithDouble:v4 - *(double *)(a1 + 40)];
  v9[2] = v5;
  id v6 = +[NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:3];
  [v2 addEntriesFromDictionary:v6];

  return v2;
}

id sub_100030AE4(uint64_t a1)
{
  id v2 = objc_alloc_init((Class)NSMutableDictionary);
  [v2 addEntriesFromDictionary:*(void *)(a1 + 32)];
  v9[0] = kSFCoreAnalyticsArtifactIdentifierKey;
  uint64_t v3 = [*(id *)(a1 + 40) getVersion];
  v10[0] = v3;
  v10[1] = @"parseCustomProns";
  v9[1] = kSFCoreAnalyticsFailedOperationKey;
  v9[2] = kSFCoreAnalyticsTotalTimeKey;
  double v4 = +[NSProcessInfo processInfo];
  [v4 systemUptime];
  id v6 = +[NSNumber numberWithDouble:v5 - *(double *)(a1 + 48)];
  v10[2] = v6;
  uint64_t v7 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:3];
  [v2 addEntriesFromDictionary:v7];

  return v2;
}

uint64_t sub_100030C34(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100030C44(uint64_t a1)
{
}

void sub_100030C4C(uint64_t a1, void *a2)
{
  id v2 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  id v3 = a2;
  id v5 = [v3 prons];
  double v4 = [v3 orthography];

  [v2 setObject:v5 forKey:v4];
}

id sub_100030CD4(uint64_t a1)
{
  id v2 = objc_alloc_init((Class)NSMutableDictionary);
  [v2 addEntriesFromDictionary:*(void *)(a1 + 32)];
  v9[0] = kSFCoreAnalyticsArtifactIdentifierKey;
  id v3 = [*(id *)(a1 + 40) getVersion];
  v10[0] = v3;
  v10[1] = @"readLanguageModel";
  v9[1] = kSFCoreAnalyticsFailedOperationKey;
  v9[2] = kSFCoreAnalyticsTotalTimeKey;
  double v4 = +[NSProcessInfo processInfo];
  [v4 systemUptime];
  id v6 = +[NSNumber numberWithDouble:v5 - *(double *)(a1 + 48)];
  v10[2] = v6;
  uint64_t v7 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:3];
  [v2 addEntriesFromDictionary:v7];

  return v2;
}

id sub_100030E24(uint64_t a1)
{
  id v2 = objc_alloc_init((Class)NSMutableDictionary);
  [v2 addEntriesFromDictionary:*(void *)(a1 + 32)];
  v9[0] = kSFCoreAnalyticsArtifactIdentifierKey;
  id v3 = [*(id *)(a1 + 40) getVersion];
  v10[0] = v3;
  v10[1] = @"createSpeechProfile";
  v9[1] = kSFCoreAnalyticsFailedOperationKey;
  v9[2] = kSFCoreAnalyticsTotalTimeKey;
  double v4 = +[NSProcessInfo processInfo];
  [v4 systemUptime];
  id v6 = +[NSNumber numberWithDouble:v5 - *(double *)(a1 + 48)];
  v10[2] = v6;
  uint64_t v7 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:3];
  [v2 addEntriesFromDictionary:v7];

  return v2;
}

id sub_100030F74(uint64_t a1)
{
  id v2 = objc_alloc_init((Class)NSMutableDictionary);
  [v2 addEntriesFromDictionary:*(void *)(a1 + 32)];
  v12[0] = kSFCoreAnalyticsArtifactIdentifierKey;
  id v3 = [*(id *)(a1 + 40) getVersion];
  v13[0] = v3;
  v12[1] = kSFCoreAnalyticsModelBuildTimeKey;
  double v4 = +[NSNumber numberWithDouble:*(double *)(a1 + 48)];
  v13[1] = v4;
  v12[2] = kSFCoreAnalyticsCustomPronParseTime;
  double v5 = +[NSNumber numberWithDouble:*(double *)(a1 + 56)];
  v13[2] = v5;
  void v12[3] = kSFCoreAnalyticsProfileBuildTime;
  id v6 = +[NSNumber numberWithDouble:*(double *)(a1 + 64)];
  v13[3] = v6;
  v12[4] = kSFCoreAnalyticsTotalTimeKey;
  uint64_t v7 = +[NSProcessInfo processInfo];
  [v7 systemUptime];
  unint64_t v9 = +[NSNumber numberWithDouble:v8 - *(double *)(a1 + 72)];
  void v13[4] = v9;
  uint64_t v10 = +[NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:5];
  [v2 addEntriesFromDictionary:v10];

  return v2;
}

id sub_10003113C(uint64_t a1)
{
  id v2 = objc_alloc_init((Class)NSMutableDictionary);
  [v2 addEntriesFromDictionary:*(void *)(a1 + 32)];
  v8[0] = kSFCoreAnalyticsArtifactIdentifierKey;
  v8[1] = kSFCoreAnalyticsFailedOperationKey;
  v9[0] = &stru_10005A2E0;
  v9[1] = @"unknown";
  v8[2] = kSFCoreAnalyticsTotalTimeKey;
  id v3 = +[NSProcessInfo processInfo];
  [v3 systemUptime];
  double v5 = +[NSNumber numberWithDouble:v4 - *(double *)(a1 + 40)];
  v9[2] = v5;
  id v6 = +[NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:3];
  [v2 addEntriesFromDictionary:v6];

  return v2;
}

void sub_100031568(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = +[NSSet set];
  [v2 setObject:v4 forKey:v3];
}

id sub_1000315E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setObject:a3 forKey:a2];
}

void sub_1000315EC(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = [*(id *)(a1 + 32) sanitizedStringWithString:a2];
  if (!v5 || ![v5 count])
  {
    uint64_t v7 = [*(id *)(a1 + 32) pronunciationsForOrthography:v6];

    id v5 = (id)v7;
  }
  id v8 = [objc_alloc((Class)_EARWordPart) initWithOrthography:v6 pronunciations:v5 tagName:@"\\unknown-first" frequency:1];
  unint64_t v9 = *(void **)(a1 + 32);
  id v11 = v8;
  uint64_t v10 = +[NSArray arrayWithObjects:&v11 count:1];
  [v9 addWordWithParts:v10 templateName:@"\\NT-appvocab"];
}

void sub_100031DC8(_Unwind_Exception *a1, int a2)
{
  if (a2)
  {
    objc_begin_catch(a1);
    id v3 = SFLogConnection;
    if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)(v2 - 128) = 136315138;
      *(void *)(v2 - 124) = "-[LSRLanguageModel trainAppLmFromNgramsSerializedData:customPronsData:language:writeToAppL"
                              "mDir:vocabFile:]";
      _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "%s Exception while training.", (uint8_t *)(v2 - 128), 0xCu);
    }
    objc_end_catch();
    JUMPOUT(0x100031CF4);
  }
  _Unwind_Resume(a1);
}

void sub_100032BA8(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = +[NSSet set];
  [v2 setObject:v4 forKey:v3];
}

void sub_100032C20(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v8 = _NSConcreteStackBlock;
  uint64_t v9 = 3221225472;
  uint64_t v10 = sub_100032E2C;
  id v11 = &unk_100059A78;
  id v12 = objc_alloc_init((Class)NSMutableSet);
  id v13 = *(id *)(a1 + 32);
  id v7 = v12;
  [v5 enumerateObjectsUsingBlock:&v8];

  objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v7, v6, v8, v9, v10, v11);
}

void sub_100032D0C(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = [*(id *)(a1 + 32) sanitizedStringWithString:a2];
  if (!v5 || ![v5 count])
  {
    uint64_t v7 = [*(id *)(a1 + 32) pronunciationsForOrthography:v6];

    id v5 = (id)v7;
  }
  id v8 = [objc_alloc((Class)_EARWordPart) initWithOrthography:v6 pronunciations:v5 tagName:@"\\unknown-first" frequency:1];
  uint64_t v9 = *(void **)(a1 + 32);
  id v11 = v8;
  uint64_t v10 = +[NSArray arrayWithObjects:&v11 count:1];
  [v9 addWordWithParts:v10 templateName:@"\\NT-appvocab"];
}

void sub_100032E2C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) nvAsrPhoneSequenceForXsampaProns:a2];
  [v2 addObject:v3];
}

void sub_10003346C(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, long long a9)
{
  if (a2)
  {
    objc_begin_catch(a1);
    uint64_t v9 = SFLogConnection;
    if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_ERROR))
    {
      LODWORD(a9) = 136315138;
      *(void *)((char *)&a9 + 4) = "-[LSRSpeechAssets _geoLMCompatibleWithMainAsset:geoAssetConfig:]";
      _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%s GeoLM: Exception thrown while reading json configs", (uint8_t *)&a9, 0xCu);
    }
    objc_end_catch();
    JUMPOUT(0x100033398);
  }
  _Unwind_Resume(a1);
}

void sub_100033CF0(id a1)
{
  qword_100065428 = objc_alloc_init(LSRSpeechAssets);

  _objc_release_x1();
}

id sub_1000341E4(void *a1, uint64_t a2)
{
  id v3 = a1;
  id v4 = +[NSOrderedSet orderedSetWithArray:a2];
  id v5 = [v4 array];

  id v6 = objc_alloc_init((Class)NSMutableArray);
  if ([v5 count])
  {
    unint64_t v7 = 0;
    do
    {
      id v8 = [objc_alloc((Class)AFSpeechUtterance) initWithInterpretationIndices:&__NSArray0__struct confidenceScore:0];
      [v8 setSource:2];
      [v6 addObject:v8];

      ++v7;
    }
    while (v7 < (unint64_t)[v5 count]);
  }
  uint64_t v46 = v5;
  id v9 = objc_alloc_init((Class)NSMutableArray);
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  id obj = v3;
  id v47 = [obj countByEnumeratingWithState:&v59 objects:v64 count:16];
  if (v47)
  {
    char v10 = 0;
    uint64_t v11 = 0;
    uint64_t v45 = *(void *)v60;
    do
    {
      for (uint64_t i = 0; i != v47; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v60 != v45) {
          objc_enumerationMutation(obj);
        }
        id v13 = *(void **)(*((void *)&v59 + 1) + 8 * i);
        id v14 = objc_alloc_init((Class)AFSpeechPhrase);
        id v15 = objc_alloc_init((Class)NSMutableOrderedSet);
        v53[0] = _NSConcreteStackBlock;
        v53[1] = 3221225472;
        v53[2] = sub_100034698;
        v53[3] = &unk_100059BB0;
        id v16 = v6;
        uint64_t v57 = v11;
        id v54 = v16;
        uint64_t v55 = v13;
        char v58 = v10 & 1;
        id v17 = v15;
        id v56 = v17;
        [v46 enumerateObjectsUsingBlock:v53];
        id v18 = [v17 count];
        if (v18)
        {
          id v19 = v18;
          uint64_t v20 = [v13 firstObject];
          [v20 lastObject];
          v22 = id v21 = v6;
          char v10 = [v22 hasSpaceAfter] ^ 1;

          unint64_t v23 = [v17 array];
          id v24 = [v23 copy];
          [v14 setInterpretations:v24];

          id v6 = v21;
          [v14 setIsLowConfidence:v19 != (id)1];
          [v9 addObject:v14];
          ++v11;
        }
      }
      id v47 = [obj countByEnumeratingWithState:&v59 objects:v64 count:16];
    }
    while (v47);
  }

  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id v48 = v6;
  id v25 = [v48 countByEnumeratingWithState:&v49 objects:v63 count:16];
  if (v25)
  {
    id v26 = v25;
    uint64_t v27 = *(void *)v50;
    do
    {
      for (j = 0; j != v26; j = (char *)j + 1)
      {
        if (*(void *)v50 != v27) {
          objc_enumerationMutation(v48);
        }
        unint64_t v29 = *(void **)(*((void *)&v49 + 1) + 8 * (void)j);
        char v30 = [v29 interpretationIndices];
        id v31 = [v30 count];

        if (v31)
        {
          unint64_t v32 = 0;
          unint64_t v33 = 0;
          do
          {
            uint64_t v34 = [v29 interpretationIndices];
            uint64_t v35 = [v34 objectAtIndex:v32];
            id v36 = [v35 unsignedIntegerValue];

            uint64_t v37 = [v9 objectAtIndex:v32];
            uint64_t v38 = [v37 interpretations];
            uint64_t v39 = [v38 objectAtIndex:v36];

            char v40 = [v39 tokens];
            v33 += (unint64_t)[v40 count];

            ++v32;
            id v41 = [v29 interpretationIndices];
            id v42 = [v41 count];
          }
          while (v32 < (unint64_t)v42);
          if (v33) {
            objc_msgSend(v29, "setConfidenceScore:", (uint64_t)((double)(uint64_t)objc_msgSend(v29, "confidenceScore") / (double)v33));
          }
        }
      }
      id v26 = [v48 countByEnumeratingWithState:&v49 objects:v63 count:16];
    }
    while (v26);
  }

  return v9;
}

void sub_100034698(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = [*(id *)(a1 + 32) objectAtIndex:a3];
  unint64_t v7 = [v5 objectAtIndexedSubscript:*(void *)(a1 + 56)];
  id v8 = [v7 unsignedIntegerValue];

  id v9 = [*(id *)(a1 + 40) objectAtIndexedSubscript:v8];
  char v10 = sub_1000348F0(v9, *(unsigned char *)(a1 + 64));
  if ([v10 count])
  {
    id v11 = objc_alloc_init((Class)AFSpeechInterpretation);
    [v11 setTokens:v10];
    unsigned int v12 = [*(id *)(a1 + 48) containsObject:v11];
    id v13 = *(void **)(a1 + 48);
    if (v12)
    {
      id v14 = [v13 indexOfObject:v11];
    }
    else
    {
      id v14 = [v13 count];
      [*(id *)(a1 + 48) addObject:v11];
    }
    id v15 = [v6 interpretationIndices];
    id v16 = +[NSNumber numberWithUnsignedInteger:v14];
    id v17 = [v15 arrayByAddingObject:v16];
    [v6 setInterpretationIndices:v17];

    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v18 = v9;
    id v19 = [v18 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v19)
    {
      id v20 = v19;
      uint64_t v21 = *(void *)v26;
      double v22 = 0.0;
      do
      {
        for (uint64_t i = 0; i != v20; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v26 != v21) {
            objc_enumerationMutation(v18);
          }
          objc_msgSend(*(id *)(*((void *)&v25 + 1) + 8 * i), "confidence", (void)v25);
          double v22 = v22 + v24;
        }
        id v20 = [v18 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v20);
    }
    else
    {
      double v22 = 0.0;
    }

    objc_msgSend(v6, "setConfidenceScore:", (uint64_t)(v22 + (double)(uint64_t)objc_msgSend(v6, "confidenceScore")));
  }
}

id sub_1000348F0(void *a1, char a2)
{
  id v3 = a1;
  id v4 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v3, "count"));
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        char v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        id v11 = objc_alloc_init((Class)AFSpeechToken);
        unsigned int v12 = objc_msgSend(v10, "tokenName", (void)v17);
        [v11 setText:v12];

        id v13 = [v10 phoneSequence];
        [v11 setPhoneSequence:v13];

        [v10 start];
        objc_msgSend(v11, "setStartTime:");
        [v10 silenceStart];
        objc_msgSend(v11, "setSilenceStartTime:");
        [v10 end];
        objc_msgSend(v11, "setEndTime:");
        [v11 setRemoveSpaceBefore:a2 & 1];
        a2 = [v10 hasSpaceAfter] ^ 1;
        [v10 confidence];
        [v11 setConfidenceScore:(uint64_t)v14];
        id v15 = [v10 ipaPhoneSequence];
        [v11 setIpaPhoneSequence:v15];

        [v4 addObject:v11];
      }
      id v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v7);
  }

  return v4;
}

uint64_t SFPLLogRegisteredEvent()
{
  return _PLLogRegisteredEvent();
}

void sub_100035588(id a1)
{
}

void sub_100035624(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _delegate];
  [v2 localSpeechRecognitionDidProcessAudioDuration:*(double *)(a1 + 40)];
}

void sub_100035744(id *a1)
{
  id v2 = a1[4];
  id v3 = SFLogConnection;
  if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v53 = *((void *)a1[5] + 3);
    *(_DWORD *)buf = 136315650;
    uint64_t v63 = "-[LSRConnection speechRecognizer:didFinishRecognitionWithError:]_block_invoke";
    __int16 v64 = 2112;
    *(void *)double v65 = v53;
    *(_WORD *)&v65[8] = 2112;
    id v66 = v2;
    _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "%s connection is %@, error %@", buf, 0x20u);
  }
  if (qword_100065440 == *((void *)a1[5] + 2))
  {
    id v4 = SFLogConnection;
    if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v63 = "-[LSRConnection speechRecognizer:didFinishRecognitionWithError:]_block_invoke";
      _os_log_debug_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "%s Schedule cooldown timer only after active request finishes", buf, 0xCu);
    }
    +[LSRConnection _scheduleCooldownTimer];
  }
  id v5 = +[NSProcessInfo processInfo];
  [v5 systemUptime];
  double v7 = v6;

  uint64_t v8 = (double *)a1[5];
  double v9 = v8[14];
  if (v9 <= v7)
  {
    double v11 = v7 - v9;
  }
  else
  {
    char v10 = (void *)SFLogConnection;
    double v11 = -1.0;
    if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_ERROR))
    {
      unsigned int v12 = v10;
      id v13 = +[NSNumber numberWithDouble:v9];
      double v14 = +[NSNumber numberWithDouble:v7];
      *(_DWORD *)buf = 136315650;
      uint64_t v63 = "-[LSRConnection speechRecognizer:didFinishRecognitionWithError:]_block_invoke";
      __int16 v64 = 2112;
      *(void *)double v65 = v13;
      *(_WORD *)&v65[8] = 2112;
      id v66 = v14;
      _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%s _recognitionBeginTime (%@) is greater than recognitionEndTime (%@)", buf, 0x20u);

      uint64_t v8 = (double *)a1[5];
    }
  }
  double v15 = v8[15];
  double v16 = v8[19];
  double v17 = 0.0;
  if (v8[18] - v8[17] - v16 >= 0.0) {
    double v18 = v8[18] - v8[17] - v16;
  }
  else {
    double v18 = 0.0;
  }
  long long v19 = [a1[6] recognitionStatistics];
  long long v20 = v19;
  double v21 = *((double *)a1[5] + 13) * 1000.0;
  if (v21 > 0.0)
  {
    double v22 = [v19 objectForKey:EARRecognitionStatisticRecogCpuTime];
    [v22 doubleValue];
    double v17 = v23 / v21;

    if (v17 < 0.0) {
      double v17 = 0.0;
    }
  }
  double v24 = SFLogConnection;
  if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_INFO))
  {
    uint64_t v25 = *((void *)a1[5] + 13);
    *(_DWORD *)buf = 136315394;
    uint64_t v63 = "-[LSRConnection speechRecognizer:didFinishRecognitionWithError:]_block_invoke";
    __int16 v64 = 2048;
    *(void *)double v65 = v25;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "%s audioDuration: %lf", buf, 0x16u);
    double v24 = SFLogConnection;
  }
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v63 = "-[LSRConnection speechRecognizer:didFinishRecognitionWithError:]_block_invoke";
    __int16 v64 = 2048;
    *(double *)double v65 = v11;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "%s recognitionDuration: %lf", buf, 0x16u);
    double v24 = SFLogConnection;
  }
  double v26 = v7 - v15;
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v63 = "-[LSRConnection speechRecognizer:didFinishRecognitionWithError:]_block_invoke";
    __int16 v64 = 2048;
    *(double *)double v65 = v26;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "%s responseTime(Audio finish to recognizer finish): %lf", buf, 0x16u);
    double v24 = SFLogConnection;
  }
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    uint64_t v27 = *((void *)a1[5] + 16);
    *(_DWORD *)buf = 136315394;
    uint64_t v63 = "-[LSRConnection speechRecognizer:didFinishRecognitionWithError:]_block_invoke";
    __int16 v64 = 2048;
    *(void *)double v65 = v27;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "%s modelLoadTime: %lf", buf, 0x16u);
    double v24 = SFLogConnection;
  }
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v63 = "-[LSRConnection speechRecognizer:didFinishRecognitionWithError:]_block_invoke";
    __int16 v64 = 2048;
    *(double *)double v65 = v18;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "%s TTFW: %lf", buf, 0x16u);
    double v24 = SFLogConnection;
  }
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v63 = "-[LSRConnection speechRecognizer:didFinishRecognitionWithError:]_block_invoke";
    __int16 v64 = 2048;
    *(double *)double v65 = v17;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "%s cpuRtf: %lf", buf, 0x16u);
    double v24 = SFLogConnection;
  }
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    uint64_t v28 = *((void *)a1[5] + 20);
    *(_DWORD *)buf = 136315394;
    uint64_t v63 = "-[LSRConnection speechRecognizer:didFinishRecognitionWithError:]_block_invoke";
    __int16 v64 = 2048;
    *(void *)double v65 = v28;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "%s jitLmeProcessingTime: %lf", buf, 0x16u);
    double v24 = SFLogConnection;
  }
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    uint64_t v29 = *((void *)a1[5] + 21);
    *(_DWORD *)buf = 136315394;
    uint64_t v63 = "-[LSRConnection speechRecognizer:didFinishRecognitionWithError:]_block_invoke";
    __int16 v64 = 2048;
    *(void *)double v65 = v29;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "%s asrInitializationTime: %lf", buf, 0x16u);
  }
  unsigned int v30 = [a1[6] concatenateUtterances];
  id v31 = a1[5];
  if (v30 && v31[6])
  {
    unint64_t v32 = [a1[5] _delegate];
    [v32 localSpeechRecognitionDidFinishRecognition:*((void *)a1[5] + 6)];

    unint64_t v33 = a1[5];
    uint64_t v34 = (void *)v33[6];
    v33[6] = 0;

    id v31 = a1[5];
  }
  uint64_t v35 = SFLogConnection;
  if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_INFO))
  {
    int v36 = *((unsigned __int8 *)v31 + 57);
    int v37 = *((unsigned __int8 *)v31 + 56);
    *(_DWORD *)buf = 136315650;
    uint64_t v63 = "-[LSRConnection speechRecognizer:didFinishRecognitionWithError:]_block_invoke";
    __int16 v64 = 1024;
    *(_DWORD *)double v65 = v36;
    *(_WORD *)&v65[4] = 1024;
    *(_DWORD *)&v65[6] = v37;
    _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_INFO, "%s _recognitionResultIsFinal=%d _recognitionResultPackageGenerated=%d", buf, 0x18u);
    id v31 = a1[5];
  }
  if (!*((unsigned char *)v31 + 57) && *((unsigned char *)v31 + 56))
  {
    uint64_t v38 = [v31 _delegate];
    uint64_t v39 = +[LSRUtilities emptyResultWithIsFinal:1];
    [v38 localSpeechRecognitionDidFinishRecognition:v39];

    id v31 = a1[5];
  }
  if (*((unsigned char *)v31 + 56))
  {
    if (v2) {
      goto LABEL_43;
    }
LABEL_47:
    id v47 = SFAnalyticsEventTypeGetName();
    id v55 = a1[5];
    AnalyticsSendEventLazy();

    id v48 = SFAnalyticsEventTypeGetName();
    id v54 = a1[5];
    AnalyticsSendEventLazy();

    long long v49 = objc_msgSend(a1[5], "_delegate", _NSConcreteStackBlock, 3221225472, sub_10003630C, &unk_100059D20, v54, _NSConcreteStackBlock, 3221225472, sub_1000360AC, &unk_10005A190, v55, *(void *)&v11, *(void *)&v26, *(void *)&v18, *(void *)&v17);
    [v49 localSpeechRecognitionDidSucceed];

    id v2 = 0;
    goto LABEL_53;
  }
  uint64_t v44 = kAFAssistantErrorDomain;
  NSErrorUserInfoKey v60 = NSLocalizedDescriptionKey;
  CFStringRef v61 = @"No speech detected";
  uint64_t v45 = +[NSDictionary dictionaryWithObjects:&v61 forKeys:&v60 count:1];
  uint64_t v46 = +[NSError errorWithDomain:v44 code:1110 userInfo:v45];

  id v2 = (id)v46;
  if (!v46) {
    goto LABEL_47;
  }
LABEL_43:
  char v40 = [v2 domain];
  unsigned int v41 = [v40 isEqualToString:EARErrorDomain];

  if (v41)
  {
    if ([v2 code] == (id)2)
    {
      NSErrorUserInfoKey v58 = NSLocalizedDescriptionKey;
      CFStringRef v59 = @"Recognition request was canceled";
      id v42 = +[NSDictionary dictionaryWithObjects:&v59 forKeys:&v58 count:1];
      uint64_t v43 = 301;
    }
    else
    {
      if ([v2 code] && objc_msgSend(v2, "code") != (id)3) {
        goto LABEL_52;
      }
      NSErrorUserInfoKey v56 = NSLocalizedDescriptionKey;
      CFStringRef v57 = @"Failed to recognize the request";
      id v42 = +[NSDictionary dictionaryWithObjects:&v57 forKeys:&v56 count:1];
      uint64_t v43 = 300;
    }
    uint64_t v50 = +[NSError errorWithDomain:@"kLSRErrorDomain" code:v43 userInfo:v42];

    id v2 = (id)v50;
  }
LABEL_52:
  [a1[5] reportFailureWithError:v2];
LABEL_53:
  [*((id *)a1[5] + 2) cancelRecognition];
  long long v51 = a1[5];
  long long v52 = (void *)v51[2];
  if (v52 == (void *)qword_100065440)
  {
    qword_100065440 = 0;

    long long v51 = a1[5];
    long long v52 = (void *)v51[2];
  }
  v51[2] = 0;
}

id sub_1000360AC(uint64_t a1)
{
  id v2 = +[NSMutableDictionary dictionary];
  id v3 = [*(id *)(a1 + 32) _requestContext];
  [v2 addEntriesFromDictionary:v3];

  v14[0] = kSFCoreAnalyticsAudioDurationKey;
  id v4 = +[NSNumber numberWithDouble:*(double *)(*(void *)(a1 + 32) + 104)];
  v15[0] = v4;
  v14[1] = kSFCoreAnalyticsRecognitionDurationKey;
  id v5 = +[NSNumber numberWithDouble:*(double *)(a1 + 40)];
  v15[1] = v5;
  v14[2] = kSFCoreAnalyticsRecognitionResponseTimeKey;
  double v6 = +[NSNumber numberWithDouble:*(double *)(a1 + 48)];
  v15[2] = v6;
  v14[3] = kSFCoreAnalyticsModelLoadTimeKey;
  double v7 = +[NSNumber numberWithDouble:*(double *)(*(void *)(a1 + 32) + 128)];
  v15[3] = v7;
  v14[4] = kSFCoreAnalyticsTTFWKey;
  uint64_t v8 = +[NSNumber numberWithDouble:*(double *)(a1 + 56)];
  v15[4] = v8;
  v14[5] = kSFCoreAnalyticsCpuRtfKey;
  double v9 = +[NSNumber numberWithDouble:*(double *)(a1 + 64)];
  v15[5] = v9;
  v14[6] = kSFCoreAnalyticsJitLmeProcessingTimeKey;
  char v10 = +[NSNumber numberWithDouble:*(double *)(*(void *)(a1 + 32) + 160)];
  v15[6] = v10;
  v14[7] = kSFCoreAnalyticsAsrInitializationTimeKey;
  double v11 = +[NSNumber numberWithDouble:*(double *)(*(void *)(a1 + 32) + 168)];
  v15[7] = v11;
  unsigned int v12 = +[NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:8];
  [v2 addEntriesFromDictionary:v12];

  return v2;
}

id sub_10003630C(uint64_t a1)
{
  return [*(id *)(a1 + 32) _requestContext];
}

void sub_1000363E0(id *a1)
{
  id v2 = (double *)a1[4];
  if (v2[18] == 0.0)
  {
    id v3 = +[NSProcessInfo processInfo];
    [v3 systemUptime];
    *((void *)a1[4] + 18) = v4;

    id v2 = (double *)a1[4];
  }
  if (v2[19] == 0.0)
  {
    id v5 = [a1[5] recognition];
    double v6 = [v5 oneBest];
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_100036694;
    v21[3] = &unk_10005A140;
    id v7 = a1[5];
    uint64_t v21[4] = a1[4];
    id v22 = v7;
    [v6 enumerateObjectsUsingBlock:v21];
  }
  uint64_t v8 = SFAnalyticsEventTypeGetName();
  id v19 = a1[4];
  id v20 = a1[5];
  AnalyticsSendEventLazy();

  double v9 = +[LSRUtilities recognizedResultFromEARPackage:](LSRUtilities, "recognizedResultFromEARPackage:", a1[5], _NSConcreteStackBlock, 3221225472, sub_100036714, &unk_100059DB8, v19);
  char v10 = (void *)SFLogConnection;
  if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_DEBUG))
  {
    id v15 = a1[5];
    double v16 = v10;
    unsigned int v17 = [v15 isFinal];
    double v18 = "NO";
    if (v17) {
      double v18 = "YES";
    }
    *(_DWORD *)buf = 136315394;
    double v24 = "-[LSRConnection speechRecognizer:didRecognizeFinalResultPackage:]_block_invoke";
    __int16 v25 = 2080;
    double v26 = v18;
    _os_log_debug_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "%s package isFinal=%s", buf, 0x16u);
  }
  *((unsigned char *)a1[4] + 56) = 1;
  if ([a1[5] isFinal]) {
    *((unsigned char *)a1[4] + 57) = 1;
  }
  unsigned int v11 = [a1[6] concatenateUtterances];
  unsigned int v12 = a1[4];
  if (v11)
  {
    id v13 = v9;
    double v14 = (void *)v12[6];
    v12[6] = v13;
  }
  else
  {
    double v14 = [a1[4] _delegate];
    [v14 localSpeechRecognitionDidFinishRecognition:v9];
  }
}

void sub_100036694(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  if (*(double *)(*(void *)(a1 + 32) + 152) == 0.0)
  {
    double v6 = *(void **)(a1 + 40);
    id v7 = a2;
    [v6 utteranceStart];
    double v9 = v8;
    [v7 silenceStart];
    double v11 = v10;

    *(double *)(*(void *)(a1 + 32) + 152) = v9 + v11;
    *a4 = 1;
  }
}

id sub_100036714(uint64_t a1)
{
  id v2 = +[NSMutableDictionary dictionary];
  id v3 = [*(id *)(a1 + 32) _requestContext];
  [v2 addEntriesFromDictionary:v3];

  v10[0] = kSFCoreAnalyticsTextNotEmptyKey;
  uint64_t v4 = [*(id *)(a1 + 40) recognition];
  id v5 = [v4 oneBest];
  double v6 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v5 count] != 0);
  v11[0] = v6;
  v10[1] = kSFCoreAnalyticsIsFinalKey;
  id v7 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [*(id *)(a1 + 40) isFinal]);
  v11[1] = v7;
  double v8 = +[NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:2];
  [v2 addEntriesFromDictionary:v8];

  return v2;
}

void sub_100036924(uint64_t a1)
{
  if (*(double *)(*(void *)(a1 + 32) + 144) == 0.0)
  {
    id v2 = +[NSProcessInfo processInfo];
    [v2 systemUptime];
    *(void *)(*(void *)(a1 + 32) + 144) = v3;
  }
  uint64_t v4 = [*(id *)(a1 + 40) tokens];
  id v5 = +[LSRUtilities transcriptionsWithEARTokens:v4];

  double v6 = [*(id *)(a1 + 40) preITNTokens];
  id v7 = +[LSRUtilities transcriptionsWithEARTokens:v6];

  double v8 = (void *)SFLogConnection;
  if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_DEBUG))
  {
    double v10 = *(void **)(a1 + 40);
    double v11 = v8;
    unsigned int v12 = [v10 tokens];
    int v13 = 136315394;
    double v14 = "-[LSRConnection speechRecognizer:didRecognizePartialResult:]_block_invoke";
    __int16 v15 = 2048;
    id v16 = [v12 count];
    _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "%s Recognized %lu partial result tokens.", (uint8_t *)&v13, 0x16u);
  }
  double v9 = [*(id *)(a1 + 32) _delegate];
  [v9 localSpeechRecognitionDidRecognizePartialResult:v5 rawPartialResult:v7];
}

BOOL sub_100037048()
{
  uint64_t v0 = +[NSXPCConnection currentConnection];
  uint64_t v1 = v0;
  if (v0)
  {
    id v2 = [v0 valueForEntitlement:@"com.apple.assistant.dictation.prerecorded"];
    BOOL v3 = (objc_opt_respondsToSelector() & 1) != 0 && ([v2 BOOLValue] & 1) != 0;
  }
  else
  {
    uint64_t v4 = SFLogConnection;
    if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136315138;
      id v7 = "hasSPIAccess";
      _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "%s Called from outside of an XPC connection", (uint8_t *)&v6, 0xCu);
    }
    BOOL v3 = 0;
  }

  return v3;
}

uint64_t sub_100037878(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t sub_100037AD4(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t sub_100037D60(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t sub_100038318(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t sub_100038988(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_100038DC4(void *a1)
{
  BOOL v2 = sub_100037048();
  BOOL v3 = SFLogConnection;
  if (v2)
  {
    if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_INFO))
    {
      uint64_t v4 = a1[4];
      *(_DWORD *)buf = 136315394;
      unsigned int v17 = "-[LSRConnection initializeLmWithAssetPath:completion:]_block_invoke";
      __int16 v18 = 2112;
      uint64_t v19 = v4;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s Initialize Language Model with assetPath=%@", buf, 0x16u);
    }
    id v5 = [[LSRLanguageModel alloc] initWithAssetPath:a1[4]];
    uint64_t v6 = a1[5];
    id v7 = *(void **)(v6 + 192);
    *(void *)(v6 + 192) = v5;

    uint64_t v8 = a1[6];
    if (v8)
    {
      if (*(void *)(a1[5] + 192))
      {
        (*(void (**)(void, void))(v8 + 16))(a1[6], 0);
      }
      else
      {
        double v11 = +[NSString stringWithFormat:@"Error initializing", NSLocalizedDescriptionKey];
        __int16 v15 = v11;
        unsigned int v12 = +[NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];
        int v13 = +[NSError errorWithDomain:@"kLSRErrorDomain" code:400 userInfo:v12];
        (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v13);
      }
    }
  }
  else
  {
    if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      unsigned int v17 = "-[LSRConnection initializeLmWithAssetPath:completion:]_block_invoke";
      _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "%s Request not authorized", buf, 0xCu);
    }
    uint64_t v9 = a1[6];
    if (v9)
    {
      double v10 = +[NSError errorWithDomain:kAFAssistantErrorDomain code:1700 userInfo:0];
      (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v10);
    }
  }
}

void sub_100039100(void *a1)
{
  BOOL v2 = SFLogConnection;
  if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = a1[4];
    *(_DWORD *)buf = 136315394;
    uint64_t v14 = "-[LSRConnection initializeLmWithLocale:clientID:completion:]_block_invoke";
    __int16 v15 = 2112;
    uint64_t v16 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "%s Initialize Language Model with locale=%@", buf, 0x16u);
  }
  uint64_t v4 = [[LSRLanguageModel alloc] initWithLocale:a1[4] clientID:a1[6]];
  uint64_t v5 = a1[5];
  uint64_t v6 = *(void **)(v5 + 192);
  *(void *)(v5 + 192) = v4;

  uint64_t v7 = a1[7];
  if (v7)
  {
    if (*(void *)(a1[5] + 192))
    {
      (*(void (**)(void, void))(v7 + 16))(a1[7], 0);
    }
    else
    {
      uint64_t v8 = +[NSString stringWithFormat:@"Error initializing", NSLocalizedDescriptionKey];
      unsigned int v12 = v8;
      uint64_t v9 = +[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];
      double v10 = +[NSError errorWithDomain:@"kLSRErrorDomain" code:400 userInfo:v9];
      (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v10);
    }
  }
}

id sub_100039454(uint64_t a1)
{
  return +[SFEntitledAssetManager setPurgeabilityForAssetWithConfig:*(void *)(a1 + 32) purgeable:*(unsigned __int8 *)(a1 + 48) completionHandler:*(void *)(a1 + 40)];
}

uint64_t sub_100039670(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_100039688(void *a1)
{
  id v2 = [objc_alloc((Class)SFEntitledAssetConfig) initWithLanguage:a1[4] taskHint:1002];
  uint64_t v3 = +[SFEntitledAssetManager sharedInstance];
  uint64_t v4 = [v3 installedAssetWithConfig:v2 regionId:0 shouldSubscribe:1 subscriberId:a1[5] expiration:0];

  if (v4)
  {
    uint64_t v5 = [v4 stringByAppendingPathComponent:@"mini.json"];
    uint64_t v6 = +[LSRSpeechAssets assetConfigParameters:v5];
    uint64_t v7 = v6;
    if (v6)
    {
      uint64_t v8 = [v6 objectForKeyedSubscript:@"voicemail-confidence-parameters"];
      if (v8)
      {
        uint64_t v9 = *(void (**)(void))(a1[6] + 16);
      }
      else
      {
        unsigned int v12 = SFLogConnection;
        if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_ERROR))
        {
          int v14 = 136315138;
          __int16 v15 = "-[LSRConnection configParametersForVoicemailWithLanguage:clientID:completion:]_block_invoke";
          _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%s Failed to find voicemail config parameters", (uint8_t *)&v14, 0xCu);
        }
        uint64_t v9 = *(void (**)(void))(a1[7] + 16);
      }
      v9();
    }
    else
    {
      uint64_t v11 = SFLogConnection;
      if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_ERROR))
      {
        int v14 = 136315394;
        __int16 v15 = "-[LSRConnection configParametersForVoicemailWithLanguage:clientID:completion:]_block_invoke";
        __int16 v16 = 2112;
        unsigned int v17 = v5;
        _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%s Failed to read json config parameters from file: %@", (uint8_t *)&v14, 0x16u);
      }
      (*(void (**)(void))(a1[7] + 16))();
    }
  }
  else
  {
    double v10 = SFLogConnection;
    if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_ERROR))
    {
      int v13 = (void *)a1[4];
      int v14 = 136315394;
      __int16 v15 = "-[LSRConnection configParametersForVoicemailWithLanguage:clientID:completion:]_block_invoke";
      __int16 v16 = 2112;
      unsigned int v17 = v13;
      _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%s Failed to find asset path for language:%@", (uint8_t *)&v14, 0x16u);
    }
    (*(void (**)(void))(a1[7] + 16))();
  }
}

void sub_100039AF4(void *a1)
{
  id v5 = [objc_alloc((Class)SFEntitledAssetConfig) initWithLanguage:a1[4] taskHint:0];
  id v2 = +[SFEntitledAssetManager sharedInstance];
  uint64_t v3 = [v2 installedAssetWithConfig:v5 regionId:0 shouldSubscribe:1 subscriberId:a1[5] expiration:0];

  uint64_t v4 = a1[6];
  if (v4) {
    (*(void (**)(uint64_t, void *, void))(v4 + 16))(v4, v3, 0);
  }
}

void sub_100039E7C(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _delegate];
  uint64_t v1 = +[NSError errorWithDomain:kAFAssistantErrorDomain code:1700 userInfo:0];
  [v2 localSpeechRecognitionDidFinishDownloadingAssets:0 error:v1];
}

void sub_100039F00(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _delegate];
  [v2 localSpeechRecognitionDidFinishDownloadingAssets:0 error:*(void *)(a1 + 40)];
}

void sub_100039F58(uint64_t a1)
{
  id v2 = SFAnalyticsEventTypeGetName();
  v24[5] = _NSConcreteStackBlock;
  v24[6] = 3221225472;
  v24[7] = sub_10003A1D0;
  v24[8] = &unk_100059D20;
  id v25 = *(id *)(a1 + 32);
  AnalyticsSendEventLazy();

  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_10003A27C;
  v24[3] = &unk_100059E58;
  v24[4] = *(void *)(a1 + 40);
  uint64_t v3 = objc_retainBlock(v24);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10003A2FC;
  v21[3] = &unk_100059E80;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v22 = v4;
  uint64_t v23 = v5;
  uint64_t v6 = objc_retainBlock(v21);
  v19[0] = 0;
  v19[1] = v19;
  uint64_t v19[2] = 0x2020000000;
  char v20 = 0;
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = *(void **)(a1 + 48);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10003A5B0;
  void v12[3] = &unk_100059FD8;
  id v13 = v8;
  id v9 = *(id *)(a1 + 32);
  char v18 = *(unsigned char *)(a1 + 56);
  id v14 = v9;
  unsigned int v17 = v19;
  double v10 = v3;
  id v15 = v10;
  uint64_t v11 = v6;
  id v16 = v11;
  +[SFEntitledAssetManager subscribeToAssetWithConfig:v7 regionId:0 subscriberId:v13 expiration:0 completionHandler:v12];

  _Block_object_dispose(v19, 8);
}

void sub_10003A1B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_10003A1D0(uint64_t a1)
{
  uint64_t v4 = kSFCoreAnalyticsLanguageKey;
  uint64_t v1 = [*(id *)(a1 + 32) language];
  uint64_t v5 = v1;
  id v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];

  return v2;
}

void sub_10003A27C(uint64_t a1, uint64_t a2, char a3)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003AE70;
  block[3] = &unk_100059E30;
  block[4] = *(void *)(a1 + 32);
  block[5] = a2;
  char v4 = a3;
  dispatch_async((dispatch_queue_t)qword_100065438, block);
}

void sub_10003A2FC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (!v5 || v6)
  {
    id v13 = SFLogConnection;
    if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      id v22 = "-[LSRConnection downloadAssetsForConfig:clientID:detailedProgress:]_block_invoke_6";
      __int16 v23 = 2112;
      double v24 = v7;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%s Failed to download assets with error=%@", buf, 0x16u);
    }
    id v14 = SFAnalyticsEventTypeGetName();
    v19[1] = _NSConcreteStackBlock;
    uint64_t v19[2] = 3221225472;
    void v19[3] = sub_10003AC38;
    v19[4] = &unk_100059D20;
    id v9 = &v20;
    id v20 = *(id *)(a1 + 32);
    AnalyticsSendEventLazy();

    double v10 = qword_100065438;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10003ACFC;
    block[3] = &unk_100059D48;
    block[4] = *(void *)(a1 + 40);
    uint64_t v11 = (id *)v19;
    v19[0] = v7;
    unsigned int v12 = block;
  }
  else
  {
    uint64_t v8 = SFAnalyticsEventTypeGetName();
    v16[1] = _NSConcreteStackBlock;
    v16[2] = 3221225472;
    v16[3] = sub_10003AD54;
    v16[4] = &unk_100059D20;
    id v9 = &v17;
    id v17 = *(id *)(a1 + 32);
    AnalyticsSendEventLazy();

    double v10 = qword_100065438;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10003AE18;
    v15[3] = &unk_100059D48;
    v15[4] = *(void *)(a1 + 40);
    uint64_t v11 = (id *)v16;
    v16[0] = v5;
    unsigned int v12 = v15;
  }
  dispatch_async(v10, v12);
}

void sub_10003A5B0(uint64_t a1, void *a2)
{
  id v3 = a2;
  char v4 = qword_100065438;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003A6B8;
  block[3] = &unk_100059FB0;
  id v9 = v3;
  id v10 = *(id *)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  char v15 = *(unsigned char *)(a1 + 72);
  uint64_t v6 = *(void *)(a1 + 64);
  id v11 = v5;
  uint64_t v14 = v6;
  id v12 = *(id *)(a1 + 48);
  id v13 = *(id *)(a1 + 56);
  id v7 = v3;
  dispatch_async(v4, block);
}

void sub_10003A6B8(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    id v2 = (void *)SFLogConnection;
    if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = *(void *)(a1 + 40);
      uint64_t v14 = *(void **)(a1 + 48);
      id v16 = v2;
      [v14 assetType];
      id v17 = SFEntitledAssetTypeToString();
      char v18 = [*(id *)(a1 + 48) language];
      uint64_t v19 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 136316162;
      int v36 = "-[LSRConnection downloadAssetsForConfig:clientID:detailedProgress:]_block_invoke_6";
      __int16 v37 = 2112;
      uint64_t v38 = v15;
      __int16 v39 = 2112;
      char v40 = v17;
      __int16 v41 = 2112;
      id v42 = v18;
      __int16 v43 = 2112;
      uint64_t v44 = v19;
      _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%s Failed to subscribe %@ to the %@ asset for %@ with error: %@", buf, 0x34u);
    }
  }
  if (*(unsigned char *)(a1 + 80))
  {
    id v3 = +[SFEntitledAssetManager sharedInstance];
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v4 = *(void *)(a1 + 48);
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    _OWORD v32[2] = sub_10003AA64;
    v32[3] = &unk_100059EA8;
    uint64_t v34 = *(void *)(a1 + 72);
    id v33 = *(id *)(a1 + 56);
    [v3 downloadStatusWithConfig:v4 regionId:0 subscriberId:v5 progressHandler:v32 completionHandler:&stru_100059EE8];
  }
  uint64_t v6 = +[SFEntitledAssetManager sharedInstance];
  uint64_t v8 = *(void *)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 48);
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_10003AA8C;
  v29[3] = &unk_100059F10;
  char v31 = *(unsigned char *)(a1 + 80);
  id v30 = *(id *)(a1 + 56);
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_10003AAAC;
  uint64_t v26[3] = &unk_100059F38;
  char v28 = *(unsigned char *)(a1 + 80);
  id v27 = *(id *)(a1 + 64);
  [v6 downloadStatusWithConfig:v7 regionId:0 subscriberId:v8 progressHandler:v29 completionHandler:v26];

  if (*(unsigned char *)(a1 + 80))
  {
    dispatch_assert_queue_V2((dispatch_queue_t)qword_100065438);
    id v9 = qword_1000654A0;
    if (!qword_1000654A0)
    {
      dispatch_queue_t v10 = dispatch_queue_create("com.apple.speech.localspeechrecognition.detailedProgressWait", 0);
      id v11 = (void *)qword_1000654A0;
      qword_1000654A0 = (uint64_t)v10;

      id v9 = qword_1000654A0;
    }
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10003AAC8;
    block[3] = &unk_100059F88;
    id v21 = *(id *)(a1 + 48);
    id v12 = *(id *)(a1 + 40);
    uint64_t v13 = *(void *)(a1 + 72);
    id v22 = v12;
    uint64_t v25 = v13;
    id v23 = *(id *)(a1 + 56);
    id v24 = *(id *)(a1 + 64);
    dispatch_async(v9, block);
  }
}

uint64_t sub_10003AA64(uint64_t result)
{
  unsigned __int8 v1 = atomic_load((unsigned __int8 *)(*(void *)(*(void *)(result + 40) + 8) + 24));
  if ((v1 & 1) == 0) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

uint64_t sub_10003AA8C(uint64_t result)
{
  if (!*(unsigned char *)(result + 40)) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

uint64_t sub_10003AAAC(uint64_t result)
{
  if (!*(unsigned char *)(result + 40)) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

void sub_10003AAC8(uint64_t a1)
{
  id v2 = +[SFEntitledAssetManager sharedInstance];
  [v2 wait];

  id v3 = +[SFEntitledAssetManager sharedInstance];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10003AC00;
  void v8[3] = &unk_100059EA8;
  uint64_t v10 = *(void *)(a1 + 64);
  id v9 = *(id *)(a1 + 48);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  _OWORD v6[2] = sub_10003AC24;
  void v6[3] = &unk_100059F60;
  id v7 = *(id *)(a1 + 56);
  [v3 downloadStatusWithConfig:v4 regionId:0 subscriberId:v5 progressHandler:v8 completionHandler:v6];
}

uint64_t sub_10003AC00(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_10003AC24(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id sub_10003AC38(uint64_t a1)
{
  v4[0] = kSFCoreAnalyticsLanguageKey;
  unsigned __int8 v1 = [*(id *)(a1 + 32) language];
  v4[1] = kSFCoreAnalyticsSuccessKey;
  v5[0] = v1;
  v5[1] = &__kCFBooleanFalse;
  id v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:2];

  return v2;
}

void sub_10003ACFC(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _delegate];
  [v2 localSpeechRecognitionDidFinishDownloadingAssets:0 error:*(void *)(a1 + 40)];
}

id sub_10003AD54(uint64_t a1)
{
  v4[0] = kSFCoreAnalyticsLanguageKey;
  unsigned __int8 v1 = [*(id *)(a1 + 32) language];
  v4[1] = kSFCoreAnalyticsSuccessKey;
  v5[0] = v1;
  v5[1] = &__kCFBooleanTrue;
  id v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:2];

  return v2;
}

void sub_10003AE18(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _delegate];
  [v2 localSpeechRecognitionDidFinishDownloadingAssets:*(void *)(a1 + 40) error:0];
}

void sub_10003AE70(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _delegate];
  [v2 localSpeechRecognitionDidDownloadAssetsWithProgress:*(void *)(a1 + 40) isStalled:*(unsigned __int8 *)(a1 + 48)];
}

void sub_10003B14C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10003B16C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10003B17C(uint64_t a1)
{
}

void sub_10003B184(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (SFEntitledAssetStatusIsInstalled()) {
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v3];
  }
}

void sub_10003B1EC(uint64_t a1)
{
  id v2 = +[LSRSpeechAssets sharedInstance];
  [v2 installedLanguagesForAssetType:*(void *)(a1 + 40) completion:*(void *)(a1 + 32)];
}

id sub_10003B470(uint64_t a1)
{
  id v2 = +[NSMutableDictionary dictionary];
  id v3 = [*(id *)(a1 + 32) _requestContext];
  [v2 addEntriesFromDictionary:v3];

  v9[0] = kSFCoreAnalyticsErrorCode;
  uint64_t v4 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [*(id *)(a1 + 40) code]);
  uint64_t v5 = [v4 stringValue];
  v10[0] = v5;
  v9[1] = kSFCoreAnalyticsErrorDomain;
  uint64_t v6 = [*(id *)(a1 + 40) domain];
  v10[1] = v6;
  id v7 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:2];
  [v2 addEntriesFromDictionary:v7];

  return v2;
}

id sub_10003B6C0(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void sub_10003B764(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v1 = *(void *)(a1 + 40);
  id v6 = 0;
  unsigned __int8 v3 = [v2 _consumeSandboxExtensions:v1 error:&v6];
  id v4 = v6;
  uint64_t v5 = SFLogConnection;
  if (v3)
  {
    if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v8 = "-[LSRConnection initializeWithSandboxExtensions:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s Successfully consumed sandbox extensions", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v8 = "-[LSRConnection initializeWithSandboxExtensions:]_block_invoke";
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%s Failed to consume sandbox extensions: %@", buf, 0x16u);
  }
}

void sub_10003B9AC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  [WeakRetained cancelRecognition];

  [*(id *)(*(void *)(a1 + 32) + 16) endAudio];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 32);
  *(void *)(v3 + 32) = 0;

  [*(id *)(*(void *)(a1 + 32) + 80) discard];
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = 0;

  id v7 = SFAnalyticsEventTypeGetName();
  AnalyticsSendEventLazy();
}

id sub_10003BA8C(uint64_t a1)
{
  return [*(id *)(a1 + 32) _requestContext];
}

void sub_10003BBA4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 16);
  if (v3) {
    [v3 endAudio];
  }
  else {
    *(unsigned char *)(v2 + 40) = 1;
  }
  id v4 = SFAnalyticsEventTypeGetName();
  AnalyticsSendEventLazy();

  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = 0;
}

id sub_10003BC60(uint64_t a1)
{
  return [*(id *)(a1 + 32) _requestContext];
}

id sub_10003BD90(uint64_t a1)
{
  uint64_t v2 = (void *)SFLogConnection;
  if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_DEBUG))
  {
    __int16 v9 = *(void **)(a1 + 32);
    id v10 = v2;
    int v11 = 136315394;
    id v12 = "-[LSRConnection addAudioPacket:]_block_invoke";
    __int16 v13 = 2048;
    id v14 = [v9 length];
    _os_log_debug_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "%s Adding audio packet: %zu", (uint8_t *)&v11, 0x16u);
  }
  uint64_t v3 = +[NSProcessInfo processInfo];
  [v3 systemUptime];
  *(void *)(*(void *)(a1 + 40) + 120) = v4;

  uint64_t v5 = *(void *)(a1 + 40);
  if (*(double *)(v5 + 136) == 0.0)
  {
    id v6 = +[NSProcessInfo processInfo];
    [v6 systemUptime];
    *(void *)(*(void *)(a1 + 40) + 136) = v7;

    uint64_t v5 = *(void *)(a1 + 40);
  }
  if (*(void *)(v5 + 16))
  {
    objc_msgSend(*(id *)(*(void *)(a1 + 40) + 16), "addAudioSamples:count:", objc_msgSend(*(id *)(a1 + 32), "bytes"), (unint64_t)objc_msgSend(*(id *)(a1 + 32), "length") >> 1);
    [*(id *)(a1 + 40) updateAudioDuration:*(void *)(a1 + 32)];
  }
  else
  {
    [*(id *)(v5 + 32) addObject:*(void *)(a1 + 32)];
  }
  id result = *(id *)(*(void *)(a1 + 40) + 80);
  if (result) {
    return [result appendBytes:*(void *)(a1 + 32)];
  }
  return result;
}

void sub_10003DB5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  _Block_object_dispose(&a71, 8);
  _Unwind_Resume(a1);
}

id sub_10003DBA8(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (!v2)
  {
    uint64_t v3 = EtiquetteReplacementsForLanguage(*(void **)(*(void *)(a1 + 32) + 88));
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;

    uint64_t v2 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  }

  return v2;
}

id VoicemailConfidenceSubtractionForLanguage(void *a1)
{
  id v1 = a1;
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = sub_10003DF6C(v1, @"voicemail_confidence_subtraction.json", v2);

  return v3;
}

id EtiquetteConfidenceSubtraction(void *a1)
{
  if (a1)
  {
    id v1 = a1;
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    void v5[2] = sub_10003DF58;
    v5[3] = &unk_100059CD0;
    id v6 = objc_alloc_init((Class)NSMutableDictionary);
    id v2 = v6;
    [v1 enumerateKeysAndObjectsUsingBlock:v5];

    id v3 = [v2 copy];
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

id sub_10003DD5C(void *a1)
{
  id v1 = a1;
  id v2 = [v1 samplingRateFilter];
  id v3 = [v1 taskTypeFilter];
  uint64_t v4 = [v1 farFieldFilter];
  uint64_t v5 = [v1 deviceIdFilter];
  id v6 = [v1 bluetoothDeviceIdFilter];
  uint64_t v7 = [v1 atypicalSpeechFilter];

  uint64_t v8 = +[NSString stringWithFormat:@"sampling rate = %@\ntask type = %@\nfar field = %@\ndevice ID = %@\n[DEPRECATED] bluetooth device ID = %@\natypical speech = %@\n", v2, v3, v4, v5, v6, v7];

  return v8;
}

id sub_10003DE58(uint64_t a1)
{
  id v2 = +[NSMutableDictionary dictionary];
  id v3 = [*(id *)(a1 + 32) _requestContext];
  [v2 addEntriesFromDictionary:v3];

  uint64_t v7 = kSFCoreAnalyticsModelVersionKey;
  uint64_t v4 = [(id)qword_100065488 version];
  uint64_t v8 = v4;
  uint64_t v5 = +[NSDictionary dictionaryWithObjects:&v8 forKeys:&v7 count:1];
  [v2 addEntriesFromDictionary:v5];

  return v2;
}

id sub_10003DF58(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setObject:&off_10005ABC0 forKey:a2];
}

id sub_10003DF6C(void *a1, void *a2, uint64_t a3)
{
  id v5 = a1;
  id v6 = a2;
  if (v5)
  {
    uint64_t v7 = [v5 stringByAppendingPathComponent:v6];
    id v26 = 0;
    uint64_t v8 = +[NSData dataWithContentsOfFile:v7 options:0 error:&v26];
    id v9 = v26;
    if (!v8)
    {
      id v14 = SFLogConnection;
      if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        *(void *)&uint8_t buf[4] = "ReplacementDictionaryForLanguage";
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v6;
        *(_WORD *)&buf[22] = 2112;
        id v28 = v9;
        _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%s Could not read %@: %@", buf, 0x20u);
      }
      id v12 = 0;
      goto LABEL_21;
    }
    id v25 = v9;
    id v10 = +[NSJSONSerialization JSONObjectWithData:v8 options:0 error:&v25];
    id v11 = v25;

    if (v10)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        *(void *)buf = 0;
        *(void *)&buf[8] = buf;
        *(void *)&buf[16] = 0x2020000000;
        LOBYTE(v28) = 1;
        v21[0] = _NSConcreteStackBlock;
        v21[1] = 3221225472;
        v21[2] = sub_10003E368;
        v21[3] = &unk_10005A200;
        uint64_t v24 = a3;
        id v22 = v6;
        id v23 = buf;
        [v10 enumerateKeysAndObjectsUsingBlock:v21];
        if (*(unsigned char *)(*(void *)&buf[8] + 24)) {
          id v12 = v10;
        }
        else {
          id v12 = 0;
        }

        _Block_object_dispose(buf, 8);
        goto LABEL_20;
      }
      id v16 = (void *)SFLogConnection;
      if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_ERROR))
      {
        char v18 = v16;
        uint64_t v19 = objc_opt_class();
        *(_DWORD *)buf = 136315650;
        *(void *)&uint8_t buf[4] = "ReplacementDictionaryForLanguage";
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v6;
        *(_WORD *)&buf[22] = 2112;
        id v28 = v19;
        id v20 = v19;
        _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%s %@ is wrong type: %@", buf, 0x20u);
      }
    }
    else
    {
      uint64_t v15 = SFLogConnection;
      if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        *(void *)&uint8_t buf[4] = "ReplacementDictionaryForLanguage";
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v6;
        *(_WORD *)&buf[22] = 2112;
        id v28 = v11;
        _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%s Could not parse %@: %@", buf, 0x20u);
      }
    }
    id v12 = 0;
LABEL_20:

    id v9 = v11;
LABEL_21:

    goto LABEL_22;
  }
  __int16 v13 = SFLogConnection;
  if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    *(void *)&uint8_t buf[4] = "ReplacementDictionaryForLanguage";
    _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%s Could not locate asset.", buf, 0xCu);
  }
  id v12 = 0;
LABEL_22:

  return v12;
}

void sub_10003E348(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10003E368(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v7 = a2;
  id v8 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_opt_isKindOfClass() & 1) == 0)
  {
    id v9 = SFLogConnection;
    if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      int v11 = 136315906;
      id v12 = "ReplacementDictionaryForLanguage_block_invoke";
      __int16 v13 = 2112;
      uint64_t v14 = v10;
      __int16 v15 = 2112;
      id v16 = v7;
      __int16 v17 = 2112;
      id v18 = v8;
      _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%s %@ contains bogus key/value pair: %@ => %@", (uint8_t *)&v11, 0x2Au);
    }
    *a4 = 1;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
}

id EtiquetteReplacementsForLanguage(void *a1)
{
  id v1 = a1;
  uint64_t v2 = objc_opt_class();
  id v3 = sub_10003DF6C(v1, @"etiquette.json", v2);

  return v3;
}

void sub_10003F7E4(id a1, NSNumber *a2, unint64_t a3, BOOL *a4)
{
  [(NSNumber *)a2 longLongValue];

  sandbox_extension_release();
}

void sub_10003FA10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10003FA2C(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v2 = (void *)SFLogConnection;
    if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_INFO))
    {
      id v3 = v2;
      uint64_t v4 = +[NSXPCListener _UUID];
      int v11 = 136315650;
      id v12 = "-[LSRConnection initWithXPCConnection:]_block_invoke";
      __int16 v13 = 2112;
      uint64_t v14 = WeakRetained;
      __int16 v15 = 2112;
      id v16 = v4;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s %@ cancelling instance %@", (uint8_t *)&v11, 0x20u);
    }
    [WeakRetained[2] cancelRecognition];
    id v5 = WeakRetained[2];
    if (v5 == (id)qword_100065440)
    {
      qword_100065440 = 0;

      id v5 = WeakRetained[2];
    }
    WeakRetained[2] = 0;

    [WeakRetained[4] removeAllObjects];
    objc_storeWeak(WeakRetained + 1, 0);
    [WeakRetained[3] invalidate];
    id v6 = WeakRetained[3];
    WeakRetained[3] = 0;

    objc_storeWeak(WeakRetained + 1, 0);
    id v7 = WeakRetained[25];
    WeakRetained[25] = 0;

    id v8 = WeakRetained[26];
    WeakRetained[26] = 0;

    id v9 = WeakRetained[27];
    WeakRetained[27] = 0;

    id v10 = WeakRetained[28];
    WeakRetained[28] = 0;
  }
}

void sub_10003FBC4(id a1)
{
  id v1 = SFLogConnection;
  if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_INFO))
  {
    int v2 = 136315138;
    id v3 = "-[LSRConnection initWithXPCConnection:]_block_invoke";
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_INFO, "%s Handling SIGTERM", (uint8_t *)&v2, 0xCu);
  }
  exit(0);
}

void sub_1000400CC(id a1)
{
}

uint64_t sub_100040784(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = +[NSNumber numberWithUnsignedLongLong:qword_100065450];

  return _objc_release_x1();
}

void sub_100040804(id a1)
{
  qword_100065450 = mach_continuous_time();
}

uint64_t sub_100040D80()
{
  return _BridgedStoredNSError.code.getter();
}

uint64_t sub_100040DA0()
{
  return _BridgedStoredNSError.userInfo.getter();
}

uint64_t sub_100040DC0()
{
  return _BridgedStoredNSError.init(_:userInfo:)();
}

uint64_t sub_100040DD0()
{
  return _convertErrorToNSError(_:)();
}

uint64_t sub_100040DE0()
{
  return _convertNSErrorToError(_:)();
}

uint64_t sub_100040DF0()
{
  return type metadata accessor for URL.DirectoryHint();
}

uint64_t sub_100040E00()
{
  return URL.pathComponents.getter();
}

void sub_100040E10(NSURL *retstr@<X8>)
{
}

uint64_t sub_100040E20()
{
  return URL.appendingPathComponent(_:)();
}

uint64_t sub_100040E30()
{
  return static URL._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100040E40(Swift::Bool percentEncoded)
{
  return URL.path(percentEncoded:)(percentEncoded)._countAndFlagsBits;
}

uint64_t sub_100040E50()
{
  return URL.init(string:)();
}

uint64_t sub_100040E60()
{
  return URL.init(filePath:directoryHint:relativeTo:)();
}

uint64_t sub_100040E70()
{
  return URL.appending<A>(path:directoryHint:)();
}

uint64_t sub_100040E80()
{
  return type metadata accessor for URL();
}

NSData sub_100040E90()
{
  return Data._bridgeToObjectiveC()();
}

uint64_t sub_100040EA0()
{
  return static Data._unconditionallyBridgeFromObjectiveC(_:)();
}

NSDate sub_100040EB0()
{
  return Date._bridgeToObjectiveC()();
}

uint64_t sub_100040EC0()
{
  return Date.timeIntervalSinceNow.getter();
}

uint64_t sub_100040ED0()
{
  return static Date._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100040EE0()
{
  return type metadata accessor for Date();
}

NSUUID sub_100040EF0()
{
  return UUID._bridgeToObjectiveC()();
}

uint64_t sub_100040F00()
{
  return static UUID.== infix(_:_:)();
}

uint64_t sub_100040F10()
{
  return static UUID._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100040F20()
{
  return type metadata accessor for UUID();
}

uint64_t sub_100040F30()
{
  return Locale.identifier.getter();
}

uint64_t sub_100040F40()
{
  return Locale.LanguageCode.identifier.getter();
}

uint64_t sub_100040F50()
{
  return type metadata accessor for Locale.LanguageCode();
}

uint64_t sub_100040F60()
{
  return static Locale._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100040F70()
{
  return Locale.Region.identifier.getter();
}

uint64_t sub_100040F80()
{
  return type metadata accessor for Locale.Region();
}

uint64_t sub_100040F90()
{
  return static Locale.current.getter();
}

uint64_t sub_100040FA0()
{
  return Locale.Language.languageCode.getter();
}

uint64_t sub_100040FB0()
{
  return Locale.Language.minimalIdentifier.getter();
}

uint64_t sub_100040FC0()
{
  return Locale.Language.region.getter();
}

uint64_t sub_100040FD0()
{
  return type metadata accessor for Locale.Language();
}

uint64_t sub_100040FE0()
{
  return Locale.language.getter();
}

uint64_t sub_100040FF0()
{
  return type metadata accessor for Locale();
}

uint64_t sub_100041000()
{
  return OSSignpostID.init(log:)();
}

uint64_t sub_100041010()
{
  return OSSignpostID.rawValue.getter();
}

uint64_t sub_100041020()
{
  return type metadata accessor for OSSignpostID();
}

uint64_t sub_100041030()
{
  return OSSignposter.init(logger:)();
}

uint64_t sub_100041040()
{
  return OSSignposter.logHandle.getter();
}

uint64_t sub_100041050()
{
  return type metadata accessor for OSSignposter();
}

uint64_t sub_100041060()
{
  return type metadata accessor for OSSignpostError();
}

uint64_t sub_100041070()
{
  return static OSLogIntegerFormatting.decimal.getter();
}

uint64_t sub_100041080()
{
  return OSSignpostIntervalState.signpostID.getter();
}

uint64_t sub_100041090()
{
  return OSSignpostIntervalState.init(id:isOpen:)();
}

uint64_t sub_1000410A0()
{
  return type metadata accessor for OSSignpostIntervalState();
}

uint64_t sub_1000410B0()
{
  return checkForErrorAndConsumeState(state:)();
}

uint64_t sub_1000410C0()
{
  return Logger.logObject.getter();
}

uint64_t sub_1000410D0()
{
  return type metadata accessor for Logger();
}

uint64_t sub_1000410E0()
{
  return Logger.init(_:)();
}

uint64_t sub_1000410F0()
{
  return TaskHint.preferredModelTaskNames.getter();
}

uint64_t sub_100041100()
{
  return type metadata accessor for TaskHint();
}

uint64_t sub_100041110()
{
  return related decl 'e' for SFSpeechErrorCode.init(_:description:)();
}

NSDictionary sub_100041120()
{
  return Dictionary._bridgeToObjectiveC()();
}

uint64_t sub_100041130()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100041140()
{
  return Dictionary.init(dictionaryLiteral:)();
}

uint64_t sub_100041150()
{
  return dispatch thunk of Hashable.hash(into:)();
}

uint64_t sub_100041160()
{
  return String.LocalizationValue.init(stringLiteral:)();
}

uint64_t sub_100041170()
{
  return String.LocalizationValue.StringInterpolation.appendInterpolation<A>(_:specifier:)();
}

void sub_100041180(Swift::String a1)
{
}

void sub_100041190(Swift::String a1)
{
}

uint64_t sub_1000411A0()
{
  return String.LocalizationValue.StringInterpolation.init(literalCapacity:interpolationCount:)();
}

uint64_t sub_1000411B0()
{
  return type metadata accessor for String.LocalizationValue.StringInterpolation();
}

uint64_t sub_1000411C0()
{
  return String.LocalizationValue.init(stringInterpolation:)();
}

uint64_t sub_1000411D0()
{
  return type metadata accessor for String.LocalizationValue();
}

NSString sub_1000411E0()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_1000411F0()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100041200()
{
  return String.init(localized:table:bundle:locale:comment:)();
}

uint64_t sub_100041210()
{
  return String.utf8CString.getter();
}

uint64_t sub_100041220()
{
  return String.hash(into:)();
}

void sub_100041230(Swift::String a1)
{
}

Swift::Int sub_100041240()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_100041250()
{
  return specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
}

NSArray sub_100041260()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_100041270()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100041280()
{
  return Array.description.getter();
}

uint64_t sub_100041290()
{
  return specialized Array._endMutation()();
}

uint64_t sub_1000412A0()
{
  return specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_1000412B0()
{
  return static Array._allocateBufferUninitialized(minimumCapacity:)();
}

uint64_t sub_1000412C0()
{
  return specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_1000412D0()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_1000412E0()
{
  return static TaskPriority.> infix(_:_:)();
}

uint64_t sub_1000412F0()
{
  return TaskPriority.init(rawValue:)();
}

uint64_t sub_100041300()
{
  return TaskPriority.rawValue.getter();
}

uint64_t sub_100041310()
{
  return type metadata accessor for TaskPriority();
}

NSSet sub_100041320()
{
  return Set._bridgeToObjectiveC()();
}

uint64_t sub_100041330()
{
  return static Set._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100041340()
{
  return Set.init(minimumCapacity:)();
}

NSNumber sub_100041350()
{
  return Int._bridgeToObjectiveC()();
}

uint64_t sub_100041360()
{
  return static os_log_type_t.info.getter();
}

uint64_t sub_100041370()
{
  return static os_log_type_t.debug.getter();
}

uint64_t sub_100041380()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_100041390()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_1000413A0()
{
  return static SFSpeechErrorCode.invalidJitProfile.getter();
}

uint64_t sub_1000413B0()
{
  return static SFSpeechErrorCode.noModel.getter();
}

uint64_t sub_1000413C0()
{
  return static os_signpost_type_t.end.getter();
}

uint64_t sub_1000413D0()
{
  return static os_signpost_type_t.begin.getter();
}

uint64_t sub_1000413E0()
{
  return static os_signpost_type_t.event.getter();
}

NSNumber sub_1000413F0(Swift::Bool BOOLeanLiteral)
{
  return NSNumber.init(BOOLeanLiteral:)(BOOLeanLiteral);
}

Swift::Int sub_100041400(Swift::Int seed)
{
  return NSObject._rawHashValue(seed:)(seed);
}

uint64_t sub_100041410()
{
  return static NSObject.== infix(_:_:)();
}

uint64_t sub_100041420()
{
  return NSObject.hashValue.getter();
}

uint64_t sub_100041430()
{
  return OS_os_log.signpostsEnabled.getter();
}

uint64_t sub_100041440()
{
  return type metadata accessor for Optional();
}

uint64_t sub_100041450()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_100041460()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_100041470()
{
  return StringProtocol.replacingOccurrences<A, B>(of:with:options:range:)();
}

uint64_t sub_100041480()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t sub_100041490()
{
  return _HashTable.nextHole(atOrAfter:)();
}

uint64_t sub_1000414A0()
{
  return __CocoaSet.makeIterator()();
}

uint64_t sub_1000414B0()
{
  return __CocoaSet.count.getter();
}

uint64_t sub_1000414C0()
{
  return __CocoaSet.member(for:)();
}

uint64_t sub_1000414D0()
{
  return __CocoaSet.Iterator.next()();
}

Swift::Int sub_1000414E0(Swift::Int seed)
{
  return AnyHashable._rawHashValue(seed:)(seed);
}

uint64_t sub_1000414F0()
{
  return static AnyHashable.== infix(_:_:)();
}

uint64_t sub_100041500()
{
  return AnyHashable.base.getter();
}

uint64_t sub_100041510()
{
  return AnyHashable.init<A>(_:)();
}

uint64_t sub_100041520()
{
  return static _SetStorage.copy(original:)();
}

uint64_t sub_100041530()
{
  return static _SetStorage.resize(original:capacity:move:)();
}

uint64_t sub_100041540()
{
  return static _SetStorage.convert(_:capacity:)();
}

uint64_t sub_100041550()
{
  return static _SetStorage.allocate(capacity:)();
}

void sub_100041560(Swift::Int a1)
{
}

uint64_t sub_100041570()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_100041580()
{
  return StaticString.description.getter();
}

uint64_t sub_100041590()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_1000415A0()
{
  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_1000415B0()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_1000415C0()
{
  return specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
}

uint64_t sub_1000415D0()
{
  return specialized ContiguousArray._endMutation()();
}

uint64_t sub_1000415E0()
{
  return specialized ContiguousArray.reserveCapacity(_:)();
}

uint64_t sub_1000415F0()
{
  return specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
}

uint64_t sub_100041600()
{
  return specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_100041610()
{
  return _print_unlocked<A, B>(_:_:)();
}

BOOL sub_100041620(Swift::Bool isUnique, Swift::Int capacity)
{
  return _NativeDictionary.ensureUnique(isUnique:capacity:)(isUnique, capacity);
}

void sub_100041630()
{
}

uint64_t sub_100041640()
{
  return _NativeDictionary._delete(at:)();
}

uint64_t sub_100041650()
{
  return __CocoaDictionary.makeIterator()();
}

uint64_t sub_100041660()
{
  return __CocoaDictionary.count.getter();
}

uint64_t sub_100041670()
{
  return __CocoaDictionary.lookup(_:)();
}

uint64_t sub_100041680()
{
  return __CocoaDictionary.Iterator.next()();
}

uint64_t sub_100041690()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_1000416A0()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_1000416B0()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_1000416C0()
{
  return static _DictionaryStorage.copy(original:)();
}

uint64_t sub_1000416D0()
{
  return static _DictionaryStorage.resize(original:capacity:move:)();
}

uint64_t sub_1000416E0()
{
  return static _DictionaryStorage.convert(_:capacity:)();
}

uint64_t sub_1000416F0()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_100041700()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

Swift::Int sub_100041710(Swift::Int a1)
{
  return _minimumMergeRunLength(_:)(a1);
}

uint64_t sub_100041720()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_100041730()
{
  return ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_100041740()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_100041770()
{
  return Error._userInfo.getter();
}

uint64_t sub_100041780()
{
  return Hasher.init(_seed:)();
}

void sub_100041790(Swift::UInt a1)
{
}

Swift::Int sub_1000417A0()
{
  return Hasher._finalize()();
}

NSNumber sub_1000417B0()
{
  return UInt64._bridgeToObjectiveC()();
}

uint64_t AFLogInitIfNeeded()
{
  return _AFLogInitIfNeeded();
}

uint64_t AnalyticsSendEventLazy()
{
  return _AnalyticsSendEventLazy();
}

OSStatus AudioFileClose(AudioFileID inAudioFile)
{
  return _AudioFileClose(inAudioFile);
}

OSStatus AudioFileCreateWithURL(CFURLRef inFileRef, AudioFileTypeID inFileType, const AudioStreamBasicDescription *inFormat, AudioFileFlags inFlags, AudioFileID *outAudioFile)
{
  return _AudioFileCreateWithURL(inFileRef, inFileType, inFormat, inFlags, outAudioFile);
}

uint64_t BiomeLibrary()
{
  return _BiomeLibrary();
}

Boolean CFPreferencesAppValueIsForced(CFStringRef key, CFStringRef applicationID)
{
  return _CFPreferencesAppValueIsForced(key, applicationID);
}

OSStatus ExtAudioFileDispose(ExtAudioFileRef inExtAudioFile)
{
  return _ExtAudioFileDispose(inExtAudioFile);
}

OSStatus ExtAudioFileWrapAudioFileID(AudioFileID inFileID, Boolean inForWriting, ExtAudioFileRef *outExtAudioFile)
{
  return _ExtAudioFileWrapAudioFileID(inFileID, inForWriting, outExtAudioFile);
}

OSStatus ExtAudioFileWriteAsync(ExtAudioFileRef inExtAudioFile, UInt32 inNumberFrames, const AudioBufferList *ioData)
{
  return _ExtAudioFileWriteAsync(inExtAudioFile, inNumberFrames, ioData);
}

NSString *NSHomeDirectory(void)
{
  return _NSHomeDirectory();
}

NSString *NSTemporaryDirectory(void)
{
  return _NSTemporaryDirectory();
}

uint64_t QuasarC_setLogLevel()
{
  return _QuasarC_setLogLevel();
}

uint64_t SFAnalyticsEventTypeGetName()
{
  return _SFAnalyticsEventTypeGetName();
}

uint64_t SFEntitledAssetStatusIsInstalled()
{
  return _SFEntitledAssetStatusIsInstalled();
}

uint64_t SFEntitledAssetTypeForTaskName()
{
  return _SFEntitledAssetTypeForTaskName();
}

uint64_t SFEntitledAssetTypeToString()
{
  return _SFEntitledAssetTypeToString();
}

uint64_t SFIsInternalInstall()
{
  return _SFIsInternalInstall();
}

uint64_t SFLSRDelegateGetInterface()
{
  return _SFLSRDelegateGetInterface();
}

uint64_t SFLSRGetInterface()
{
  return _SFLSRGetInterface();
}

uint64_t SFLogInitIfNeeded()
{
  return _SFLogInitIfNeeded();
}

uint64_t _AFPreferencesReplacementLanguageForLocalRecognizerLanguageCode()
{
  return __AFPreferencesReplacementLanguageForLocalRecognizerLanguageCode();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return ___error();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _set_user_dir_suffix()
{
  return __set_user_dir_suffix();
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return __swift_stdlib_bridgeErrorToNSError();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return __swift_stdlib_reportUnimplementedInitializer();
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return _dispatch_queue_attr_make_with_autorelease_frequency(attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return _dispatch_source_create(type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

void exit(int a1)
{
}

void free(void *a1)
{
}

pid_t getpid(void)
{
  return _getpid();
}

int gettimeofday(timeval *a1, void *a2)
{
  return _gettimeofday(a1, a2);
}

tm *__cdecl localtime_r(const time_t *a1, tm *a2)
{
  return _localtime_r(a1, a2);
}

uint64_t mach_continuous_time(void)
{
  return _mach_continuous_time();
}

uint64_t mach_get_times()
{
  return _mach_get_times();
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

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

id objc_begin_catch(void *exc_buf)
{
  return _objc_begin_catch(exc_buf);
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

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_getAssociatedObject(id object, const void *key)
{
  return _objc_getAssociatedObject(object, key);
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
  return _objc_msgSendSuper2(a1, a2);
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

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

void objc_terminate(void)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

int proc_pid_rusage(int pid, int flavor, rusage_info_t *buffer)
{
  return _proc_pid_rusage(pid, flavor, buffer);
}

uint64_t sandbox_check_by_audit_token()
{
  return _sandbox_check_by_audit_token();
}

uint64_t sandbox_extension_consume()
{
  return _sandbox_extension_consume();
}

uint64_t sandbox_extension_release()
{
  return _sandbox_extension_release();
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return _signal(a1, a2);
}

char *__cdecl strerror(int __errnum)
{
  return _strerror(__errnum);
}

uint64_t swift_allocBox()
{
  return _swift_allocBox();
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

uint64_t swift_asyncLet_begin()
{
  return _swift_asyncLet_begin();
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

uint64_t swift_dynamicCastObjCClass()
{
  return _swift_dynamicCastObjCClass();
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

uint64_t swift_getErrorValue()
{
  return _swift_getErrorValue();
}

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
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

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return _swift_stdlib_isStackAllocationSafe();
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

uint64_t swift_unknownObjectRelease_n()
{
  return _swift_unknownObjectRelease_n();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_unknownObjectRetain_n()
{
  return _swift_unknownObjectRetain_n();
}

uint64_t swift_updateClassMetadata2()
{
  return _swift_updateClassMetadata2();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}

int unsetenv(const char *a1)
{
  return _unsetenv(a1);
}

id objc_msgSend_JSONObjectWithData_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "JSONObjectWithData:options:error:");
}

id objc_msgSend_URLByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLByAppendingPathComponent:");
}

id objc_msgSend_URLByAppendingPathComponent_isDirectory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLByAppendingPathComponent:isDirectory:");
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return _[a1 UTF8String];
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return _[a1 UUID];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return _[a1 UUIDString];
}

id objc_msgSend__UUID(void *a1, const char *a2, ...)
{
  return _[a1 _UUID];
}

id objc_msgSend__auditToken(void *a1, const char *a2, ...)
{
  return _[a1 _auditToken];
}

id objc_msgSend__cachedRecognizerCleanUp(void *a1, const char *a2, ...)
{
  return _[a1 _cachedRecognizerCleanUp];
}

id objc_msgSend__cancelCooldownTimer(void *a1, const char *a2, ...)
{
  return _[a1 _cancelCooldownTimer];
}

id objc_msgSend__consumeSandboxExtensions_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_consumeSandboxExtensions:error:");
}

id objc_msgSend__delegate(void *a1, const char *a2, ...)
{
  return _[a1 _delegate];
}

id objc_msgSend__geoLMCompatibleWithMainAsset_geoAssetConfig_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_geoLMCompatibleWithMainAsset:geoAssetConfig:");
}

id objc_msgSend__initWithBestTranscription_rawTranscription_final_speechRecognitionMetadata_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_initWithBestTranscription:rawTranscription:final:speechRecognitionMetadata:");
}

id objc_msgSend__jitProfileWithLanguage_modelRoot_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_jitProfileWithLanguage:modelRoot:");
}

id objc_msgSend__requestContext(void *a1, const char *a2, ...)
{
  return _[a1 _requestContext];
}

id objc_msgSend__scheduleCooldownTimer(void *a1, const char *a2, ...)
{
  return _[a1 _scheduleCooldownTimer];
}

id objc_msgSend__setQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setQueue:");
}

id objc_msgSend__speechRecognizerWithLanguage_overrides_anyConfiguration_taskConfiguration_modelRoot_error_modelLoadTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_speechRecognizerWithLanguage:overrides:anyConfiguration:taskConfiguration:modelRoot:error:modelLoadTime:");
}

id objc_msgSend__userProfileWithModelRoot_language_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_userProfileWithModelRoot:language:");
}

id objc_msgSend_acousticFeatureValuePerFrame(void *a1, const char *a2, ...)
{
  return _[a1 acousticFeatureValuePerFrame];
}

id objc_msgSend_acousticFeatures(void *a1, const char *a2, ...)
{
  return _[a1 acousticFeatures];
}

id objc_msgSend_activeConfiguration(void *a1, const char *a2, ...)
{
  return _[a1 activeConfiguration];
}

id objc_msgSend_activeConfigurationForEverything(void *a1, const char *a2, ...)
{
  return _[a1 activeConfigurationForEverything];
}

id objc_msgSend_activeConfigurationForNothing(void *a1, const char *a2, ...)
{
  return _[a1 activeConfigurationForNothing];
}

id objc_msgSend_addAudioSamples_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addAudioSamples:count:");
}

id objc_msgSend_addEntriesFromDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addEntriesFromDictionary:");
}

id objc_msgSend_addNgramCountWithType_content_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addNgramCountWithType:content:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addProns_forWord_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addProns:forWord:");
}

id objc_msgSend_addSentenceToNgramCounts_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addSentenceToNgramCounts:");
}

id objc_msgSend_addSentenceWithType_uuid_content_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addSentenceWithType:uuid:content:");
}

id objc_msgSend_addWordWithParts_templateName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addWordWithParts:templateName:");
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return _[a1 allKeys];
}

id objc_msgSend_appLmNeedsRebuild_language_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appLmNeedsRebuild:language:error:");
}

id objc_msgSend_appendBytes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendBytes:");
}

id objc_msgSend_applicationName(void *a1, const char *a2, ...)
{
  return _[a1 applicationName];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return _[a1 array];
}

id objc_msgSend_arrayByAddingObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayByAddingObject:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_assetConfigParameters_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "assetConfigParameters:");
}

id objc_msgSend_assetType(void *a1, const char *a2, ...)
{
  return _[a1 assetType];
}

id objc_msgSend_assistantIsEnabled(void *a1, const char *a2, ...)
{
  return _[a1 assistantIsEnabled];
}

id objc_msgSend_atypicalSpeechFilter(void *a1, const char *a2, ...)
{
  return _[a1 atypicalSpeechFilter];
}

id objc_msgSend_audioAnalytics(void *a1, const char *a2, ...)
{
  return _[a1 audioAnalytics];
}

id objc_msgSend_bluetoothDeviceIdFilter(void *a1, const char *a2, ...)
{
  return _[a1 bluetoothDeviceIdFilter];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _[a1 BOOLValue];
}

id objc_msgSend_buildLmWithConfig_root_data_dir_shouldStop_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "buildLmWithConfig:root:data:dir:shouldStop:");
}

id objc_msgSend_bundleForClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleForClass:");
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 bundleIdentifier];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return _[a1 bytes];
}

id objc_msgSend_cancelRecognition(void *a1, const char *a2, ...)
{
  return _[a1 cancelRecognition];
}

id objc_msgSend_captureProcessStartTime(void *a1, const char *a2, ...)
{
  return _[a1 captureProcessStartTime];
}

id objc_msgSend_clientIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 clientIdentifier];
}

id objc_msgSend_close(void *a1, const char *a2, ...)
{
  return _[a1 close];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return _[a1 code];
}

id objc_msgSend_componentsSeparatedByCharactersInSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "componentsSeparatedByCharactersInSet:");
}

id objc_msgSend_computeEmbeddings_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "computeEmbeddings:");
}

id objc_msgSend_concatenateUtterances(void *a1, const char *a2, ...)
{
  return _[a1 concatenateUtterances];
}

id objc_msgSend_confidence(void *a1, const char *a2, ...)
{
  return _[a1 confidence];
}

id objc_msgSend_confidenceScore(void *a1, const char *a2, ...)
{
  return _[a1 confidenceScore];
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return _[a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _[a1 count];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_createAppLmLmeProfileWithLanguage_modelRoot_customPronsData_newOovs_writeToVocabFile_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createAppLmLmeProfileWithLanguage:modelRoot:customPronsData:newOovs:writeToVocabFile:");
}

id objc_msgSend_createDirectoryAtURL_withIntermediateDirectories_attributes_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:");
}

id objc_msgSend_createNgramCountsArtifactFromPhraseCountArtifact_saveTo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createNgramCountsArtifactFromPhraseCountArtifact:saveTo:");
}

id objc_msgSend_createPhraseCountArtifactWithIdentifier_rawPhraseCountsPath_customPronunciationsPath_saveTo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createPhraseCountArtifactWithIdentifier:rawPhraseCountsPath:customPronunciationsPath:saveTo:");
}

id objc_msgSend_createPhraseCountsArtifact_version_locale_rawPhraseCountsPath_customPronunciationsPath_saveTo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createPhraseCountsArtifact:version:locale:rawPhraseCountsPath:customPronunciationsPath:saveTo:");
}

id objc_msgSend_createSpeechProfileFromOovs_customProns_language_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createSpeechProfileFromOovs:customProns:language:");
}

id objc_msgSend_currentConnection(void *a1, const char *a2, ...)
{
  return _[a1 currentConnection];
}

id objc_msgSend_dataProfile(void *a1, const char *a2, ...)
{
  return _[a1 dataProfile];
}

id objc_msgSend_dataWithContentsOfFile_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithContentsOfFile:");
}

id objc_msgSend_dataWithContentsOfFile_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithContentsOfFile:options:error:");
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return _[a1 defaultManager];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return _[a1 description];
}

id objc_msgSend_deserializeModelData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deserializeModelData:");
}

id objc_msgSend_deserializeNgramCountsData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deserializeNgramCountsData:");
}

id objc_msgSend_detectMultipleUtterances(void *a1, const char *a2, ...)
{
  return _[a1 detectMultipleUtterances];
}

id objc_msgSend_deviceIdFilter(void *a1, const char *a2, ...)
{
  return _[a1 deviceIdFilter];
}

id objc_msgSend_dictationIsEnabled(void *a1, const char *a2, ...)
{
  return _[a1 dictationIsEnabled];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return _[a1 dictionary];
}

id objc_msgSend_dictionaryWithDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithDictionary:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_discard(void *a1, const char *a2, ...)
{
  return _[a1 discard];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return _[a1 domain];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return _[a1 doubleValue];
}

id objc_msgSend_downloadStatusWithConfig_regionId_subscriberId_progressHandler_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "downloadStatusWithConfig:regionId:subscriberId:progressHandler:completionHandler:");
}

id objc_msgSend_dumpDirectory(void *a1, const char *a2, ...)
{
  return _[a1 dumpDirectory];
}

id objc_msgSend_dynamicLanguageModel(void *a1, const char *a2, ...)
{
  return _[a1 dynamicLanguageModel];
}

id objc_msgSend_dynamicVocabulary(void *a1, const char *a2, ...)
{
  return _[a1 dynamicVocabulary];
}

id objc_msgSend_effectiveBoolValueForSetting_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "effectiveBoolValueForSetting:");
}

id objc_msgSend_emptyResultWithIsFinal_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "emptyResultWithIsFinal:");
}

id objc_msgSend_enableAutoPunctuation(void *a1, const char *a2, ...)
{
  return _[a1 enableAutoPunctuation];
}

id objc_msgSend_end(void *a1, const char *a2, ...)
{
  return _[a1 end];
}

id objc_msgSend_endAudio(void *a1, const char *a2, ...)
{
  return _[a1 endAudio];
}

id objc_msgSend_enumerateKeysAndObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:");
}

id objc_msgSend_enumerateObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateObjectsUsingBlock:");
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

id objc_msgSend_farFieldFilter(void *a1, const char *a2, ...)
{
  return _[a1 farFieldFilter];
}

id objc_msgSend_fileExistsAtPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileExistsAtPath:");
}

id objc_msgSend_fileURLWithPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileURLWithPath:");
}

id objc_msgSend_filenameForTaskIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "filenameForTaskIdentifier:");
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return _[a1 firstObject];
}

id objc_msgSend_frameDuration(void *a1, const char *a2, ...)
{
  return _[a1 frameDuration];
}

id objc_msgSend_frequency(void *a1, const char *a2, ...)
{
  return _[a1 frequency];
}

id objc_msgSend_generateNgramCountsWithConfig_root_data_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "generateNgramCountsWithConfig:root:data:");
}

id objc_msgSend_getProns(void *a1, const char *a2, ...)
{
  return _[a1 getProns];
}

id objc_msgSend_getVersion(void *a1, const char *a2, ...)
{
  return _[a1 getVersion];
}

id objc_msgSend_hasSpaceAfter(void *a1, const char *a2, ...)
{
  return _[a1 hasSpaceAfter];
}

id objc_msgSend_indexOfObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexOfObject:");
}

id objc_msgSend_initWithAcousticFeatureValue_frameDuration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAcousticFeatureValue:frameDuration:");
}

id objc_msgSend_initWithAssetPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAssetPath:");
}

id objc_msgSend_initWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCapacity:");
}

id objc_msgSend_initWithConfig_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithConfig:");
}

id objc_msgSend_initWithConfig_overrides_overrideConfigFiles_language_activeConfiguration_modelLoadingOptions_enableSpeakerCodeTraining_supportEmojiRecognition_voiceCommandActiveSet_modelContextDelegate_enableItn_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithConfig:overrides:overrideConfigFiles:language:activeConfiguration:modelLoadingOptions:enableSpeakerCodeTraining:supportEmojiRecognition:voiceCommandActiveSet:modelContextDelegate:enableItn:error:");
}

id objc_msgSend_initWithConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithConfiguration:");
}

id objc_msgSend_initWithConfiguration_euclidEncoderType_initFlag_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithConfiguration:euclidEncoderType:initFlag:");
}

id objc_msgSend_initWithConfiguration_language_overrides_sdapiOverrides_emptyVoc_pgVoc_paramsetHolder_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithConfiguration:language:overrides:sdapiOverrides:emptyVoc:pgVoc:paramsetHolder:");
}

id objc_msgSend_initWithConfiguration_ncsRoot_language_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithConfiguration:ncsRoot:language:");
}

id objc_msgSend_initWithConfiguration_overrides_overrideConfigFiles_language_activeConfiguration_modelLoadingOptions_enableSpeakerCodeTraining_supportEmojiRecognition_voiceCommandActiveSet_modelContextDelegate_enableItn_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithConfiguration:overrides:overrideConfigFiles:language:activeConfiguration:modelLoadingOptions:enableSpeakerCodeTraining:supportEmojiRecognition:voiceCommandActiveSet:modelContextDelegate:enableItn:");
}

id objc_msgSend_initWithConfiguration_recognizerConfigPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithConfiguration:recognizerConfigPath:");
}

id objc_msgSend_initWithConfiguration_root_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithConfiguration:root:");
}

id objc_msgSend_initWithContentsOfFile_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithContentsOfFile:");
}

id objc_msgSend_initWithData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithData:");
}

id objc_msgSend_initWithInterpretationIndices_confidenceScore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithInterpretationIndices:confidenceScore:");
}

id objc_msgSend_initWithLanguage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithLanguage:");
}

id objc_msgSend_initWithLanguage_assetType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithLanguage:assetType:");
}

id objc_msgSend_initWithLanguage_taskHint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithLanguage:taskHint:");
}

id objc_msgSend_initWithLocale_clientID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithLocale:clientID:");
}

id objc_msgSend_initWithOrthography_pronunciations_tagName_frequency_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithOrthography:pronunciations:tagName:frequency:");
}

id objc_msgSend_initWithPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPath:");
}

id objc_msgSend_initWithSpeechRecognitionFeatures_acousticFeatures_snr_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSpeechRecognitionFeatures:acousticFeatures:snr:");
}

id objc_msgSend_initWithTaskIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTaskIdentifier:");
}

id objc_msgSend_initWithTokenName_start_end_silenceStart_confidence_hasSpaceAfter_hasSpaceBefore_phoneSequence_ipaPhoneSequence_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTokenName:start:end:silenceStart:confidence:hasSpaceAfter:hasSpaceBefore:phoneSequence:ipaPhoneSequence:");
}

id objc_msgSend_initWithXPCConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithXPCConnection:");
}

id objc_msgSend_inlineItemList(void *a1, const char *a2, ...)
{
  return _[a1 inlineItemList];
}

id objc_msgSend_installedAssetWithConfig_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "installedAssetWithConfig:");
}

id objc_msgSend_installedAssetWithConfig_regionId_shouldSubscribe_subscriberId_expiration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "installedAssetWithConfig:regionId:shouldSubscribe:subscriberId:expiration:");
}

id objc_msgSend_installedLanguagesForAssetType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "installedLanguagesForAssetType:");
}

id objc_msgSend_installedLanguagesForAssetType_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "installedLanguagesForAssetType:completion:");
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return _[a1 intValue];
}

id objc_msgSend_interpretationIndices(void *a1, const char *a2, ...)
{
  return _[a1 interpretationIndices];
}

id objc_msgSend_interpretations(void *a1, const char *a2, ...)
{
  return _[a1 interpretations];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return _[a1 invalidate];
}

id objc_msgSend_ipaPhoneSequence(void *a1, const char *a2, ...)
{
  return _[a1 ipaPhoneSequence];
}

id objc_msgSend_isAdaptableToSpeechModelVersion_locale_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isAdaptableToSpeechModelVersion:locale:");
}

id objc_msgSend_isEqualToDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToDictionary:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isFinal(void *a1, const char *a2, ...)
{
  return _[a1 isFinal];
}

id objc_msgSend_isValid(void *a1, const char *a2, ...)
{
  return _[a1 isValid];
}

id objc_msgSend_isValid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isValid:");
}

id objc_msgSend_jitProfileFromContextualStrings_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "jitProfileFromContextualStrings:");
}

id objc_msgSend_jsonFilenameForAssetType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "jsonFilenameForAssetType:");
}

id objc_msgSend_language(void *a1, const char *a2, ...)
{
  return _[a1 language];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return _[a1 lastObject];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _[a1 length];
}

id objc_msgSend_lexemes(void *a1, const char *a2, ...)
{
  return _[a1 lexemes];
}

id objc_msgSend_lmeThreshold(void *a1, const char *a2, ...)
{
  return _[a1 lmeThreshold];
}

id objc_msgSend_loadCustomPronData_dataRoot_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadCustomPronData:dataRoot:");
}

id objc_msgSend_loadLmHandle(void *a1, const char *a2, ...)
{
  return _[a1 loadLmHandle];
}

id objc_msgSend_loadOovs(void *a1, const char *a2, ...)
{
  return _[a1 loadOovs];
}

id objc_msgSend_localSpeechRecognitionDidDownloadAssetsWithProgress_isStalled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localSpeechRecognitionDidDownloadAssetsWithProgress:isStalled:");
}

id objc_msgSend_localSpeechRecognitionDidFail_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localSpeechRecognitionDidFail:");
}

id objc_msgSend_localSpeechRecognitionDidFinishDownloadingAssets_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localSpeechRecognitionDidFinishDownloadingAssets:error:");
}

id objc_msgSend_localSpeechRecognitionDidFinishRecognition_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localSpeechRecognitionDidFinishRecognition:");
}

id objc_msgSend_localSpeechRecognitionDidProcessAudioDuration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localSpeechRecognitionDidProcessAudioDuration:");
}

id objc_msgSend_localSpeechRecognitionDidRecognizePartialResult_rawPartialResult_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localSpeechRecognitionDidRecognizePartialResult:rawPartialResult:");
}

id objc_msgSend_localSpeechRecognitionDidSucceed(void *a1, const char *a2, ...)
{
  return _[a1 localSpeechRecognitionDidSucceed];
}

id objc_msgSend_localeCodeForLocale_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localeCodeForLocale:");
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return _[a1 localizedDescription];
}

id objc_msgSend_localizedStringForKey_value_table_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedStringForKey:value:table:");
}

id objc_msgSend_localizedStringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedStringWithFormat:");
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return _[a1 longLongValue];
}

id objc_msgSend_lsr_errorWithCode_description_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lsr_errorWithCode:description:");
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return _[a1 mainBundle];
}

id objc_msgSend_maximumRecognitionDuration(void *a1, const char *a2, ...)
{
  return _[a1 maximumRecognitionDuration];
}

id objc_msgSend_metrics(void *a1, const char *a2, ...)
{
  return _[a1 metrics];
}

id objc_msgSend_modelInfo(void *a1, const char *a2, ...)
{
  return _[a1 modelInfo];
}

id objc_msgSend_modelOverrideURL(void *a1, const char *a2, ...)
{
  return _[a1 modelOverrideURL];
}

id objc_msgSend_modelRootWithLanguage_assetType_clientID_modelOverrideURL_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "modelRootWithLanguage:assetType:clientID:modelOverrideURL:error:");
}

id objc_msgSend_modelRootWithLanguage_assetType_clientID_modelOverrideURL_isSpelling_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "modelRootWithLanguage:assetType:clientID:modelOverrideURL:isSpelling:error:");
}

id objc_msgSend_narrowband(void *a1, const char *a2, ...)
{
  return _[a1 narrowband];
}

id objc_msgSend_newlineCharacterSet(void *a1, const char *a2, ...)
{
  return _[a1 newlineCharacterSet];
}

id objc_msgSend_ngramCountsSerializeData(void *a1, const char *a2, ...)
{
  return _[a1 ngramCountsSerializeData];
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithDouble_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithDouble:");
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithInt:");
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithInteger:");
}

id objc_msgSend_numberWithLongLong_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithLongLong:");
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedInteger:");
}

id objc_msgSend_numberWithUnsignedLongLong_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedLongLong:");
}

id objc_msgSend_nvAsrPhoneSequenceForXsampaProns_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "nvAsrPhoneSequenceForXsampaProns:");
}

id objc_msgSend_objectAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectAtIndex:");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_onDeviceOnly(void *a1, const char *a2, ...)
{
  return _[a1 onDeviceOnly];
}

id objc_msgSend_oneBest(void *a1, const char *a2, ...)
{
  return _[a1 oneBest];
}

id objc_msgSend_oovWordsAndFrequenciesInNgramCount(void *a1, const char *a2, ...)
{
  return _[a1 oovWordsAndFrequenciesInNgramCount];
}

id objc_msgSend_oovsFromSentenceAddedToNgramCounts_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "oovsFromSentenceAddedToNgramCounts:");
}

id objc_msgSend_orderedOovs(void *a1, const char *a2, ...)
{
  return _[a1 orderedOovs];
}

id objc_msgSend_orderedSetWithArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "orderedSetWithArray:");
}

id objc_msgSend_orthography(void *a1, const char *a2, ...)
{
  return _[a1 orthography];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return _[a1 path];
}

id objc_msgSend_phoneSequence(void *a1, const char *a2, ...)
{
  return _[a1 phoneSequence];
}

id objc_msgSend_preITNRecognition(void *a1, const char *a2, ...)
{
  return _[a1 preITNRecognition];
}

id objc_msgSend_preITNTokens(void *a1, const char *a2, ...)
{
  return _[a1 preITNTokens];
}

id objc_msgSend_prepareRecognizerWithLanguage_recognitionOverrides_modelOverrideURL_anyConfiguration_task_clientID_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "prepareRecognizerWithLanguage:recognitionOverrides:modelOverrideURL:anyConfiguration:task:clientID:error:");
}

id objc_msgSend_processInfo(void *a1, const char *a2, ...)
{
  return _[a1 processInfo];
}

id objc_msgSend_prons(void *a1, const char *a2, ...)
{
  return _[a1 prons];
}

id objc_msgSend_pronunciationsForOrthography_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pronunciationsForOrthography:");
}

id objc_msgSend_recognition(void *a1, const char *a2, ...)
{
  return _[a1 recognition];
}

id objc_msgSend_recognitionMetadataFromSpeechPhrases_afAudioAnalytics_utteranceStart_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "recognitionMetadataFromSpeechPhrases:afAudioAnalytics:utteranceStart:");
}

id objc_msgSend_recognitionOverrides(void *a1, const char *a2, ...)
{
  return _[a1 recognitionOverrides];
}

id objc_msgSend_recognitionStatistics(void *a1, const char *a2, ...)
{
  return _[a1 recognitionStatistics];
}

id objc_msgSend_recognizedResultFromEARPackage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "recognizedResultFromEARPackage:");
}

id objc_msgSend_releaseAssetSets(void *a1, const char *a2, ...)
{
  return _[a1 releaseAssetSets];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return _[a1 removeAllObjects];
}

id objc_msgSend_removeItemAtURL_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeItemAtURL:error:");
}

id objc_msgSend_reportFailureWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reportFailureWithError:");
}

id objc_msgSend_requestIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 requestIdentifier];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return _[a1 resume];
}

id objc_msgSend_runRecognitionWithResultStream_language_task_samplingRate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "runRecognitionWithResultStream:language:task:samplingRate:");
}

id objc_msgSend_samplingRateFilter(void *a1, const char *a2, ...)
{
  return _[a1 samplingRateFilter];
}

id objc_msgSend_sanitizedStringWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sanitizedStringWithString:");
}

id objc_msgSend_serializedModelWithLanguage_modelData_oovs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "serializedModelWithLanguage:modelData:oovs:");
}

id objc_msgSend_serviceListener(void *a1, const char *a2, ...)
{
  return _[a1 serviceListener];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return _[a1 set];
}

id objc_msgSend_setActiveConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActiveConfiguration:");
}

id objc_msgSend_setAtypicalSpeechFilter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAtypicalSpeechFilter:");
}

id objc_msgSend_setByAddingObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setByAddingObject:");
}

id objc_msgSend_setConcatenateUtterances_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setConcatenateUtterances:");
}

id objc_msgSend_setConfidenceScore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setConfidenceScore:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDetectUtterances_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDetectUtterances:");
}

id objc_msgSend_setDeviceIdFilter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDeviceIdFilter:");
}

id objc_msgSend_setDisableAutoPunctuation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDisableAutoPunctuation:");
}

id objc_msgSend_setEnableSpeakerCodeTraining_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEnableSpeakerCodeTraining:");
}

id objc_msgSend_setEndTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEndTime:");
}

id objc_msgSend_setExportedInterface_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExportedInterface:");
}

id objc_msgSend_setExportedObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExportedObject:");
}

id objc_msgSend_setExtraLmList_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExtraLmList:");
}

id objc_msgSend_setFarFieldFilter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFarFieldFilter:");
}

id objc_msgSend_setInputFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInputFormat:");
}

id objc_msgSend_setInterpretationIndices_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInterpretationIndices:");
}

id objc_msgSend_setInterpretations_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInterpretations:");
}

id objc_msgSend_setInterruptionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInterruptionHandler:");
}

id objc_msgSend_setInvalidationHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInvalidationHandler:");
}

id objc_msgSend_setIpaPhoneSequence_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIpaPhoneSequence:");
}

id objc_msgSend_setIsLowConfidence_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsLowConfidence:");
}

id objc_msgSend_setJitProfileData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setJitProfileData:");
}

id objc_msgSend_setMaximumRecognitionDuration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMaximumRecognitionDuration:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setPhoneSequence_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPhoneSequence:");
}

id objc_msgSend_setRecognitionConfidenceSubtraction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRecognitionConfidenceSubtraction:");
}

id objc_msgSend_setRecognitionReplacements_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRecognitionReplacements:");
}

id objc_msgSend_setRecognizeEagerCandidates_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRecognizeEagerCandidates:");
}

id objc_msgSend_setRemoteObjectInterface_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRemoteObjectInterface:");
}

id objc_msgSend_setRemoveSpaceBefore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRemoveSpaceBefore:");
}

id objc_msgSend_setSamplingRateFilter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSamplingRateFilter:");
}

id objc_msgSend_setSilenceStartTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSilenceStartTime:");
}

id objc_msgSend_setSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSource:");
}

id objc_msgSend_setStartTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStartTime:");
}

id objc_msgSend_setTaskTypeFilter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTaskTypeFilter:");
}

id objc_msgSend_setText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setText:");
}

id objc_msgSend_setTokens_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTokens:");
}

id objc_msgSend_setUserProfileData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUserProfileData:");
}

id objc_msgSend_setValue_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValue:forKey:");
}

id objc_msgSend_setWithObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithObject:");
}

id objc_msgSend_sharedConnection(void *a1, const char *a2, ...)
{
  return _[a1 sharedConnection];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return _[a1 sharedInstance];
}

id objc_msgSend_sharedPreferences(void *a1, const char *a2, ...)
{
  return _[a1 sharedPreferences];
}

id objc_msgSend_silenceStart(void *a1, const char *a2, ...)
{
  return _[a1 silenceStart];
}

id objc_msgSend_snr(void *a1, const char *a2, ...)
{
  return _[a1 snr];
}

id objc_msgSend_speechRecognitionFeatures(void *a1, const char *a2, ...)
{
  return _[a1 speechRecognitionFeatures];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return _[a1 standardUserDefaults];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return _[a1 start];
}

id objc_msgSend_statusForLanguage(void *a1, const char *a2, ...)
{
  return _[a1 statusForLanguage];
}

id objc_msgSend_stringByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingPathComponent:");
}

id objc_msgSend_stringByDeletingLastPathComponent(void *a1, const char *a2, ...)
{
  return _[a1 stringByDeletingLastPathComponent];
}

id objc_msgSend_stringByReplacingHyphensWithUnderscores_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByReplacingHyphensWithUnderscores:");
}

id objc_msgSend_stringForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringForKey:");
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return _[a1 stringValue];
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_subscribeToAssetWithConfig_regionId_subscriberId_expiration_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "subscribeToAssetWithConfig:regionId:subscriberId:expiration:completionHandler:");
}

id objc_msgSend_subscriptionsForSubscriberId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "subscriptionsForSubscriberId:");
}

id objc_msgSend_supportedLanguagesForAssetType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "supportedLanguagesForAssetType:");
}

id objc_msgSend_systemUptime(void *a1, const char *a2, ...)
{
  return _[a1 systemUptime];
}

id objc_msgSend_task(void *a1, const char *a2, ...)
{
  return _[a1 task];
}

id objc_msgSend_taskIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 taskIdentifier];
}

id objc_msgSend_taskTypeFilter(void *a1, const char *a2, ...)
{
  return _[a1 taskTypeFilter];
}

id objc_msgSend_tasks(void *a1, const char *a2, ...)
{
  return _[a1 tasks];
}

id objc_msgSend_tokenName(void *a1, const char *a2, ...)
{
  return _[a1 tokenName];
}

id objc_msgSend_tokenSausage(void *a1, const char *a2, ...)
{
  return _[a1 tokenSausage];
}

id objc_msgSend_tokens(void *a1, const char *a2, ...)
{
  return _[a1 tokens];
}

id objc_msgSend_trainAppLmFromNgramCountsArtifact_forApp_language_appLmArtifact_vocabFile_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "trainAppLmFromNgramCountsArtifact:forApp:language:appLmArtifact:vocabFile:");
}

id objc_msgSend_trainAppLmFromNgramsSerializedData_customPronsData_language_writeToAppLmDir_vocabFile_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "trainAppLmFromNgramsSerializedData:customPronsData:language:writeToAppLmDir:vocabFile:");
}

id objc_msgSend_trainAppLmFromPlainTextAndWriteToAppDirectory_vocabFile_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "trainAppLmFromPlainTextAndWriteToAppDirectory:vocabFile:");
}

id objc_msgSend_transcriptionFromSpeechPhrases_afAudioAnalytics_utteranceStart_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "transcriptionFromSpeechPhrases:afAudioAnalytics:utteranceStart:");
}

id objc_msgSend_transcriptionsWithEARTokens_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "transcriptionsWithEARTokens:");
}

id objc_msgSend_transcriptionsWithTokens_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "transcriptionsWithTokens:");
}

id objc_msgSend_transitionArtifactAt_toStage_configPath_dataRoot_estimationRoot_minimize_saveTo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "transitionArtifactAt:toStage:configPath:dataRoot:estimationRoot:minimize:saveTo:");
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedIntegerValue];
}

id objc_msgSend_unsubscribeFromAssetWithConfig_regionId_subscriberId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unsubscribeFromAssetWithConfig:regionId:subscriberId:");
}

id objc_msgSend_updateAudioDuration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateAudioDuration:");
}

id objc_msgSend_urlForTaskIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "urlForTaskIdentifier:");
}

id objc_msgSend_utteranceStart(void *a1, const char *a2, ...)
{
  return _[a1 utteranceStart];
}

id objc_msgSend_validationError(void *a1, const char *a2, ...)
{
  return _[a1 validationError];
}

id objc_msgSend_valueForEntitlement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueForEntitlement:");
}

id objc_msgSend_version(void *a1, const char *a2, ...)
{
  return _[a1 version];
}

id objc_msgSend_wait(void *a1, const char *a2, ...)
{
  return _[a1 wait];
}

id objc_msgSend_writeToDirectory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeToDirectory:");
}

id objc_msgSend_writeToURL_atomically_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeToURL:atomically:");
}