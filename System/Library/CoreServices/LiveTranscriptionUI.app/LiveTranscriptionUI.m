id sub_100003CB4()
{
  void *v0;
  uint64_t vars8;

  if (qword_10006CCF8 != -1) {
    dispatch_once(&qword_10006CCF8, &stru_100065C00);
  }
  v0 = (void *)qword_10006CCF0;

  return v0;
}

void sub_100003D08(id a1)
{
  qword_10006CCF0 = (uint64_t)os_log_create("com.apple.Accessibility", "AXLiveTranscriptionUI");

  _objc_release_x1();
}

void sub_100003E34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100003F28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000040E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *sub_100004118(uint64_t a1)
{
  v2 = (void *)sub_100004168();
  result = dlsym(v2, "AXHasCapability");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  off_10006CD00 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_100004168()
{
  v3[0] = 0;
  if (!qword_10006CD08)
  {
    v3[1] = _NSConcreteStackBlock;
    v3[2] = 3221225472;
    v3[3] = sub_100004268;
    v3[4] = &unk_100065C60;
    v3[5] = v3;
    long long v4 = off_100065C48;
    uint64_t v5 = 0;
    qword_10006CD08 = _sl_dlopen();
  }
  uint64_t v0 = qword_10006CD08;
  v1 = (void *)v3[0];
  if (!qword_10006CD08)
  {
    v1 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v3[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

uint64_t sub_100004268()
{
  uint64_t result = _sl_dlopen();
  qword_10006CD08 = result;
  return result;
}

Class sub_1000042DC(uint64_t a1)
{
  sub_100004168();
  Class result = objc_getClass("AXBackBoardServer");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    sub_100051620();
  }
  qword_10006CD10 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class sub_100004334(uint64_t a1)
{
  sub_100004168();
  Class result = objc_getClass("AXUserEventTimer");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    sub_100051648();
  }
  qword_10006CD18 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

int main(int argc, const char **argv, const char **envp)
{
  int v3 = static CommandLine.argc.getter();
  long long v4 = (char **)static CommandLine.unsafeArgv.getter();
  type metadata accessor for LTApplication();
  ObjCClassFromMetadata = (objc_class *)swift_getObjCClassFromMetadata();
  v6 = NSStringFromClass(ObjCClassFromMetadata);
  if (!v6)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    v6 = (NSString *)String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  type metadata accessor for LTApplicationDelegate();
  v7 = (objc_class *)swift_getObjCClassFromMetadata();
  v8 = NSStringFromClass(v7);
  if (!v8)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    v8 = (NSString *)String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  UIApplicationMain(v3, v4, v6, v8);

  return 0;
}

id variable initialization expression of AXLTProviderCaptionsView._provider()
{
  if (qword_10006AE28 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)static AXLTCaptionsProvider.shared;

  return v0;
}

uint64_t variable initialization expression of AXLTCaptionsProvider._audioHistogramSize()
{
  return 0;
}

uint64_t variable initialization expression of AXLTCaptionsProvider.audioSessionResetSubscribed()
{
  return 0;
}

double variable initialization expression of AXLTCaptionsView.verticalLineWidth()
{
  return 4.0;
}

double variable initialization expression of AudioHistogramConfig._levelBarMinHeight()
{
  return 2.0;
}

double variable initialization expression of AudioHistogramConfig._maxBarScale()
{
  return 1.0;
}

uint64_t variable initialization expression of AXLTCaptionsProvider.newCaption()
{
  return 1;
}

double variable initialization expression of AXLTCaptionsView._contentHeight()
{
  return 0.0;
}

uint64_t variable initialization expression of AXLTSettingsManager.textColor()
{
  return sub_100004998(&qword_10006ADF0);
}

uint64_t variable initialization expression of AXLTSettingsManager.backgroundColor()
{
  return sub_100004998(&qword_10006ADF8);
}

uint64_t variable initialization expression of AXLTSettingsManager.titleFont()
{
  return sub_100004998(&qword_10006AE08);
}

uint64_t variable initialization expression of AXLTSettingsManager.textFont()
{
  return sub_100004998(&qword_10006AE00);
}

BOOL variable initialization expression of AXLTSettingsManager.isMicOn()
{
  return _AXSLiveTranscriptionMicOn() != 0;
}

BOOL variable initialization expression of AXLTSettingsManager.isPaused()
{
  return _AXSLiveTranscriptionPaused() != 0;
}

BOOL variable initialization expression of AXLTSettingsManager.inCallOn()
{
  return _AXSLiveTranscriptionInCallEnabled() != 0;
}

double variable initialization expression of AXLTSettingsManager.nubbitIdleOpacity()
{
  return 0.5;
}

void (*variable initialization expression of AXLTSettingsManager.micStateChanged())(void *a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  return sub_10002FB7C;
}

void (*variable initialization expression of AXLTSettingsManager.pausedStateChanged())(void *a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  return sub_10002FBA8;
}

void (*variable initialization expression of AXLTSettingsManager.inCallStateChanged())(void *a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  return sub_10002FBD4;
}

void (*variable initialization expression of AXLTSettingsManager.categoryNameChanged())(void *a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  return sub_10002FCC8;
}

void (*variable initialization expression of AXLTSettingsManager.transcriptionEnabledChanged())(void *a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  return sub_10002FCD4;
}

void (*variable initialization expression of AXLTSettingsManager.nubbitIdleOpacityChanged())(void *a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  return sub_10002FDC8;
}

void (*variable initialization expression of AXLTSettingsManager.textColorChanged())(void *a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  return sub_100030740;
}

void (*variable initialization expression of AXLTSettingsManager.backgroundColorChanged())(void *a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  return sub_10003080C;
}

void *variable initialization expression of AXLTCaptionsProvider._captions()
{
  return &_swiftEmptyArrayStorage;
}

uint64_t variable initialization expression of AXLTCaptionsProvider.activeRequestType()
{
  if (qword_10006AE20 != -1) {
    swift_once();
  }
  uint64_t v0 = (unsigned __int8 *)(static AXLTSettingsManager.shared + OBJC_IVAR___AXLTSettingsManager_isMicOn);
  swift_beginAccess();
  return ~*v0 & 1;
}

uint64_t variable initialization expression of AXLTCaptionsProvider.activePid()
{
  return -1;
}

id variable initialization expression of AXLTCaptionsProvider.transcription()
{
  id v0 = objc_allocWithZone((Class)AXLTLiveTranscription);

  return [v0 init];
}

uint64_t sub_100004768@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = type metadata accessor for AXLTCaption();
  int v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56);

  return v3(a1, 1, 1, v2);
}

id variable initialization expression of AXLTCaptionsProvider.dateFormatter()
{
  id v0 = objc_allocWithZone((Class)NSDateFormatter);

  return [v0 init];
}

id variable initialization expression of AXLTCaptionsProvider.lockScreenObserver()
{
  id v0 = objc_allocWithZone((Class)AXLTLockScreenObserver);

  return [v0 init];
}

char *sub_100004844(unint64_t a1, double a2)
{
  if ((a1 & 0x8000000000000000) != 0)
  {
    Class result = (char *)_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
    return result;
  }
  if (!a1) {
    return (char *)&_swiftEmptyArrayStorage;
  }
  Class result = (char *)static Array._allocateBufferUninitialized(minimumCapacity:)();
  *((void *)result + 2) = a1;
  long long v4 = (double *)(result + 32);
  if (a1 < 4)
  {
    unint64_t v5 = 0;
    double v6 = a2;
LABEL_9:
    unint64_t v10 = a1 - v5;
    do
    {
      *v4++ = v6;
      --v10;
    }
    while (v10);
    return result;
  }
  unint64_t v5 = a1 & 0xFFFFFFFFFFFFFFFCLL;
  v4 += a1 & 0xFFFFFFFFFFFFFFFCLL;
  double v6 = a2;
  int64x2_t v7 = vdupq_lane_s64(*(uint64_t *)&a2, 0);
  v8 = (int64x2_t *)(result + 48);
  unint64_t v9 = a1 & 0xFFFFFFFFFFFFFFFCLL;
  do
  {
    v8[-1] = v7;
    int64x2_t *v8 = v7;
    v8 += 2;
    v9 -= 4;
  }
  while (v9);
  if (v5 != a1) {
    goto LABEL_9;
  }
  return result;
}

double variable initialization expression of AudioHistogramConfig._levelBarMaxHeight()
{
  return 28.0;
}

uint64_t variable initialization expression of AudioHistogramConfig._levelBarCount()
{
  return 16;
}

uint64_t variable initialization expression of AudioHistogramConfig._levelBarKeys()
{
  return 10;
}

double variable initialization expression of AudioHistogramConfig._animationTimerDuration()
{
  return 7.0;
}

double variable initialization expression of AudioHistogramConfig._minBarScale()
{
  return 0.1;
}

uint64_t variable initialization expression of AudioHistogramConfig._randomPower()
{
  return 80;
}

uint64_t variable initialization expression of AudioHistogramConfig._jitter()
{
  return 29;
}

uint64_t variable initialization expression of AudioHistogramConfig._levelBarColor()
{
  return sub_100004998(&qword_10006AE38);
}

uint64_t sub_100004998(void *a1)
{
  if (*a1 != -1) {
    swift_once();
  }

  return swift_retain();
}

int64x2_t variable initialization expression of AudioHistogramConfig._histogram()
{
  id v0 = (int64x2_t *)static Array._allocateBufferUninitialized(minimumCapacity:)();
  v0[1].i64[0] = 16;
  int64x2_t result = vdupq_n_s64(0x3FB999999999999AuLL);
  v0[2] = result;
  v0[3] = result;
  v0[4] = result;
  v0[5] = result;
  v0[6] = result;
  v0[7] = result;
  v0[8] = result;
  v0[9] = result;
  return result;
}

uint64_t variable initialization expression of AXLTAudioHistogramViewGenerator.config()
{
  return sub_10004DFE0();
}

void type metadata accessor for AXLiveTranscriptionTapType(uint64_t a1)
{
}

void type metadata accessor for AXLiveTranscriptionRequest(uint64_t a1)
{
}

void type metadata accessor for CFDictionary(uint64_t a1)
{
}

void type metadata accessor for CFNotificationName(uint64_t a1)
{
}

void type metadata accessor for CFNotificationCenter(uint64_t a1)
{
}

uint64_t initializeBufferWithCopyOfBuffer for BottomView(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

__n128 sub_100004B0C(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t sub_100004B18(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 32)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_100004B38(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)__n128 result = (a2 - 1);
    *(void *)(result + 8) = 0;
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 32) = v3;
  return result;
}

void type metadata accessor for CGRect(uint64_t a1)
{
}

__n128 sub_100004B78(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_100004B84(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_100004BA4(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)__n128 result = (a2 - 1);
    *(void *)(result + 8) = 0;
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 16) = v3;
  return result;
}

void type metadata accessor for CGSize(uint64_t a1)
{
}

uint64_t sub_100004BE0(uint64_t a1, uint64_t a2)
{
  return sub_100004CD8(a1, a2, (uint64_t (*)(uint64_t))&String.hashValue.getter);
}

uint64_t sub_100004BF8()
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  String.hash(into:)();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_100004C4C()
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v0 = Hasher._finalize()();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_100004CC0(uint64_t a1, uint64_t a2)
{
  return sub_100004CD8(a1, a2, (uint64_t (*)(uint64_t))&String._bridgeToObjectiveC());
}

uint64_t sub_100004CD8(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_100004D1C(uint64_t a1, id *a2)
{
  uint64_t result = static String._forceBridgeFromObjectiveC(_:result:)();
  *a2 = 0;
  return result;
}

uint64_t sub_100004D94(uint64_t a1, id *a2)
{
  char v3 = static String._conditionallyBridgeFromObjectiveC(_:result:)();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_100004E14@<X0>(void *a1@<X8>)
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  NSString v2 = String._bridgeToObjectiveC()();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

void *sub_100004E58@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void sub_100004E68(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_100004E74()
{
  uint64_t v0 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v2 = v1;
  if (v0 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = _stringCompareWithSmolCheck(_:_:expecting:)();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_100004F00@<X0>(void *a1@<X8>)
{
  NSString v2 = String._bridgeToObjectiveC()();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_100004F48@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_100004F74(uint64_t a1)
{
  uint64_t v2 = sub_1000050F8((unint64_t *)&qword_10006BC00);
  uint64_t v3 = sub_1000050F8(&qword_10006AEB0);

  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

void type metadata accessor for LaunchOptionsKey(uint64_t a1)
{
}

void type metadata accessor for CFString(uint64_t a1)
{
}

void type metadata accessor for CGPoint(uint64_t a1)
{
}

void sub_100005048(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_100005090()
{
  return sub_1000050F8(&qword_10006AE98);
}

uint64_t sub_1000050C4()
{
  return sub_1000050F8(&qword_10006AEA0);
}

uint64_t sub_1000050F8(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for LaunchOptionsKey(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10000513C()
{
  return sub_1000050F8(&qword_10006AEA8);
}

void *bottomViewHeight.unsafeMutableAddressor()
{
  return &bottomViewHeight;
}

uint64_t destroy for BottomView()
{
  swift_release();
  swift_release();

  return swift_release();
}

uint64_t initializeWithCopy for BottomView(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  uint64_t v3 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for BottomView(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_retain();
  swift_release();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_retain();
  swift_release();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  swift_retain();
  swift_release();
  return a1;
}

__n128 initializeWithTake for BottomView(uint64_t a1, long long *a2)
{
  long long v2 = *a2;
  long long v3 = a2[1];
  long long v4 = a2[3];
  *(_OWORD *)(a1 + 32) = a2[2];
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)a1 = v2;
  *(_OWORD *)(a1 + 16) = v3;
  __n128 result = (__n128)a2[4];
  long long v6 = a2[5];
  long long v7 = a2[7];
  *(_OWORD *)(a1 + 96) = a2[6];
  *(_OWORD *)(a1 + 112) = v7;
  *(__n128 *)(a1 + 64) = result;
  *(_OWORD *)(a1 + 80) = v6;
  return result;
}

uint64_t assignWithTake for BottomView(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  swift_release();
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_release();
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for BottomView(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 128)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 32);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for BottomView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 120) = 0;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 128) = 1;
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
      *(void *)(result + 32) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 128) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for BottomView()
{
  return &type metadata for BottomView;
}

uint64_t sub_10000549C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1000054B8@<X0>(_OWORD *a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v50 = a2;
  uint64_t v41 = type metadata accessor for GlobalCoordinateSpace();
  __chkstk_darwin(v41);
  uint64_t v43 = type metadata accessor for DragGesture();
  uint64_t v45 = *(void *)(v43 - 8);
  __chkstk_darwin(v43);
  long long v4 = (char *)&v41 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100006380(&qword_10006AEB8);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v46 = v5;
  uint64_t v47 = v6;
  __chkstk_darwin(v5);
  v42 = (char *)&v41 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100006380(&qword_10006AEC0);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v48 = v8;
  uint64_t v49 = v9;
  __chkstk_darwin(v8);
  v44 = (char *)&v41 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_100006380(&qword_10006AEC8);
  __chkstk_darwin(v11 - 8);
  v13 = (uint64_t *)((char *)&v41 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v14 = sub_100006380(&qword_10006AED0);
  uint64_t v15 = v14 - 8;
  __chkstk_darwin(v14);
  v17 = (char *)&v41 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_100006380(&qword_10006AED8);
  __chkstk_darwin(v18);
  v20 = (char *)&v41 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t *v13 = static Alignment.center.getter();
  v13[1] = v21;
  uint64_t v22 = sub_100006380(&qword_10006AEE0);
  sub_100005AC4((uint64_t)a1, (uint64_t)v13 + *(int *)(v22 + 44));
  static Alignment.center.getter();
  _FrameLayout.init(width:height:alignment:)();
  sub_100006754((uint64_t)v13, (uint64_t)v17, &qword_10006AEC8);
  v23 = &v17[*(int *)(v15 + 44)];
  long long v24 = v52;
  *(_OWORD *)v23 = v51;
  *((_OWORD *)v23 + 1) = v24;
  *((_OWORD *)v23 + 2) = v53;
  sub_1000067B8((uint64_t)v13, &qword_10006AEC8);
  sub_100006754((uint64_t)v17, (uint64_t)v20, &qword_10006AED0);
  v20[*(int *)(v18 + 36)] = 0;
  sub_1000067B8((uint64_t)v17, &qword_10006AED0);
  static CoordinateSpaceProtocol<>.global.getter();
  DragGesture.init<A>(minimumDistance:coordinateSpace:)();
  v25 = (_OWORD *)swift_allocObject();
  long long v26 = a1[5];
  v25[5] = a1[4];
  v25[6] = v26;
  long long v27 = a1[7];
  v25[7] = a1[6];
  v25[8] = v27;
  long long v28 = a1[1];
  v25[1] = *a1;
  v25[2] = v28;
  long long v29 = a1[3];
  v25[3] = a1[2];
  v25[4] = v29;
  sub_100006338((uint64_t)a1);
  sub_1000063D0(&qword_10006AEE8, (void (*)(uint64_t))&type metadata accessor for DragGesture);
  sub_1000063D0(&qword_10006AEF0, (void (*)(uint64_t))&type metadata accessor for DragGesture.Value);
  v31 = v42;
  uint64_t v30 = v43;
  Gesture<>.onChanged(_:)();
  swift_release();
  (*(void (**)(char *, uint64_t))(v45 + 8))(v4, v30);
  v32 = (_OWORD *)swift_allocObject();
  long long v33 = a1[5];
  v32[5] = a1[4];
  v32[6] = v33;
  long long v34 = a1[7];
  v32[7] = a1[6];
  v32[8] = v34;
  long long v35 = a1[1];
  v32[1] = *a1;
  v32[2] = v35;
  long long v36 = a1[3];
  v32[3] = a1[2];
  v32[4] = v36;
  sub_100006338((uint64_t)a1);
  sub_1000068B8(&qword_10006AEF8, &qword_10006AEB8);
  v37 = v44;
  uint64_t v38 = v46;
  Gesture.onEnded(_:)();
  swift_release();
  (*(void (**)(char *, uint64_t))(v47 + 8))(v31, v38);
  static GestureMask.all.getter();
  sub_1000064B4();
  sub_1000068B8(&qword_10006AF28, &qword_10006AEC0);
  uint64_t v39 = v48;
  View.gesture<A>(_:including:)();
  (*(void (**)(char *, uint64_t))(v49 + 8))(v37, v39);
  return sub_1000067B8((uint64_t)v20, &qword_10006AED8);
}

uint64_t sub_100005AC4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v26 = a2;
  uint64_t v25 = sub_100006380(&qword_10006AF40) - 8;
  __chkstk_darwin(v25);
  long long v4 = (char *)&v25 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for RoundedRectangle();
  uint64_t v6 = v5 - 8;
  __chkstk_darwin(v5);
  uint64_t v8 = (uint64_t *)((char *)&v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v9 = sub_100006380(&qword_10006AF48);
  uint64_t v10 = v9 - 8;
  __chkstk_darwin(v9);
  uint64_t v12 = (uint64_t *)((char *)&v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v13 = sub_100006380(&qword_10006AF50);
  uint64_t v14 = v13 - 8;
  __chkstk_darwin(v13);
  uint64_t v16 = (char *)&v25 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Color.white.getter();
  uint64_t v17 = Color.opacity(_:)();
  swift_release();
  uint64_t v18 = *(void *)(a1 + 8);
  uint64_t v19 = (char *)v8 + *(int *)(v6 + 28);
  uint64_t v20 = enum case for RoundedCornerStyle.continuous(_:);
  uint64_t v21 = type metadata accessor for RoundedCornerStyle();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v21 - 8) + 104))(v19, v20, v21);
  void *v8 = v18;
  v8[1] = v18;
  sub_100006694((uint64_t)v8, (uint64_t)v4);
  *(_WORD *)&v4[*(int *)(v25 + 44)] = 256;
  sub_100006754((uint64_t)v4, (uint64_t)v12 + *(int *)(v10 + 44), &qword_10006AF40);
  *uint64_t v12 = v17;
  swift_retain();
  sub_1000067B8((uint64_t)v4, &qword_10006AF40);
  sub_1000066F8((uint64_t)v8);
  swift_release();
  static Alignment.center.getter();
  _FrameLayout.init(width:height:alignment:)();
  sub_100006754((uint64_t)v12, (uint64_t)v16, &qword_10006AF48);
  uint64_t v22 = &v16[*(int *)(v14 + 44)];
  long long v23 = v28;
  *(_OWORD *)uint64_t v22 = v27;
  *((_OWORD *)v22 + 1) = v23;
  *((_OWORD *)v22 + 2) = v29;
  sub_1000067B8((uint64_t)v12, &qword_10006AF48);
  return sub_100006814((uint64_t)v16, v26);
}

uint64_t sub_100005DA0()
{
  sub_100006380(&qword_10006AF30);
  State.wrappedValue.getter();
  v2.width = 0.0;
  v2.height = 0.0;
  if (CGSizeEqualToSize(v1, v2))
  {
    sub_100006380(&qword_10006AF38);
    Binding.wrappedValue.getter();
    v3.width = 0.0;
    v3.height = 0.0;
    if (!CGSizeEqualToSize(v1, v3)) {
      Binding.wrappedValue.getter();
    }
    State.wrappedValue.setter();
  }
  DragGesture.Value.translation.getter();
  return sub_100005EBC();
}

uint64_t sub_100005EBC()
{
  uint64_t v1 = v0;
  sub_100006380(&qword_10006AF30);
  State.wrappedValue.getter();
  uint64_t v6 = *(void *)(v0 + 24);
  sub_1000065F4((uint64_t)&v6);
  swift_retain();
  sub_100006380(&qword_10006AF38);
  Binding.wrappedValue.getter();
  Binding.wrappedValue.setter();
  sub_100006620((uint64_t)&v6);
  swift_release();
  Binding.wrappedValue.getter();
  Binding.wrappedValue.setter();
  os_log_type_t v2 = static os_log_type_t.debug.getter();
  if (qword_10006AD90 != -1) {
    swift_once();
  }
  CGSize v3 = qword_10006DF88;
  uint64_t result = os_log_type_enabled((os_log_t)qword_10006DF88, v2);
  if (result)
  {
    sub_100006338(v1);
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v5 = 134217984;
    Binding.wrappedValue.getter();
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    sub_10000664C(v1);
    _os_log_impl((void *)&_mh_execute_header, v3, v2, "windowSize height: %f", v5, 0xCu);
    return swift_slowDealloc();
  }
  return result;
}

void sub_100006110()
{
}

void sub_100006170()
{
  id v1 = [self standardUserDefaults];
  long long v4 = *(_OWORD *)(v0 + 24);
  long long v5 = *(_OWORD *)(v0 + 40);
  sub_100006380(&qword_10006AF38);
  Binding.wrappedValue.getter();
  os_log_type_t v2 = NSStringFromCGSize(v6);
  if (!v2)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    os_log_type_t v2 = (NSString *)String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  NSString v3 = String._bridgeToObjectiveC()();
  objc_msgSend(v1, "setObject:forKey:", v2, v3, v4, v5);

  [v1 synchronize];
}

uint64_t sub_100006278()
{
  return static View._viewListCount(inputs:)();
}

uint64_t sub_100006294@<X0>(uint64_t (**a1)@<X0>(uint64_t a1@<X8>)@<X8>)
{
  long long v3 = v1[5];
  v13[4] = v1[4];
  v13[5] = v3;
  long long v4 = v1[7];
  v13[6] = v1[6];
  v13[7] = v4;
  long long v5 = v1[1];
  v13[0] = *v1;
  v13[1] = v5;
  long long v6 = v1[3];
  v13[2] = v1[2];
  v13[3] = v6;
  uint64_t v7 = (uint64_t (*)@<X0>(uint64_t@<X8>))swift_allocObject();
  long long v8 = v1[5];
  *((_OWORD *)v7 + 5) = v1[4];
  *((_OWORD *)v7 + 6) = v8;
  long long v9 = v1[7];
  *((_OWORD *)v7 + 7) = v1[6];
  *((_OWORD *)v7 + 8) = v9;
  long long v10 = v1[1];
  *((_OWORD *)v7 + 1) = *v1;
  *((_OWORD *)v7 + 2) = v10;
  long long v11 = v1[3];
  *((_OWORD *)v7 + 3) = v1[2];
  *((_OWORD *)v7 + 4) = v11;
  *a1 = sub_100006330;
  a1[1] = v7;
  return sub_100006338((uint64_t)v13);
}

uint64_t sub_100006330@<X0>(uint64_t a1@<X8>)
{
  return sub_1000054B8((_OWORD *)(v1 + 16), a1);
}

uint64_t sub_100006338(uint64_t a1)
{
  return a1;
}

uint64_t sub_100006380(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_1000063C8()
{
  return sub_100005DA0();
}

uint64_t sub_1000063D0(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_10000641C()
{
  swift_release();
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 144, 7);
}

void sub_100006464()
{
}

uint64_t sub_10000646C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_1000064B4()
{
  unint64_t result = qword_10006AF00;
  if (!qword_10006AF00)
  {
    sub_10000646C(&qword_10006AED8);
    sub_100006554();
    sub_1000068B8(&qword_10006AF18, &qword_10006AF20);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006AF00);
  }
  return result;
}

unint64_t sub_100006554()
{
  unint64_t result = qword_10006AF08;
  if (!qword_10006AF08)
  {
    sub_10000646C(&qword_10006AED0);
    sub_1000068B8(&qword_10006AF10, &qword_10006AEC8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006AF08);
  }
  return result;
}

uint64_t sub_1000065F4(uint64_t a1)
{
  return a1;
}

uint64_t sub_100006620(uint64_t a1)
{
  return a1;
}

uint64_t sub_10000664C(uint64_t a1)
{
  return a1;
}

uint64_t sub_100006694(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for RoundedRectangle();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000066F8(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for RoundedRectangle();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100006754(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100006380(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_1000067B8(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100006380(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_100006814(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100006380(&qword_10006AF50);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000687C()
{
  return sub_1000068B8(&qword_10006AF58, (uint64_t *)&unk_10006AF60);
}

uint64_t sub_1000068B8(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10000646C(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

double sub_1000068FC()
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_100006974()
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_1000069E8()
{
  uint64_t v1 = type metadata accessor for UserInterfaceSizeClass();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  v96 = &v85[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v4 = sub_100006380(&qword_10006B058);
  uint64_t v5 = __chkstk_darwin(v4);
  v89 = &v85[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v7 = __chkstk_darwin(v5);
  v100 = &v85[-v8];
  uint64_t v9 = __chkstk_darwin(v7);
  v91 = &v85[-v10];
  __chkstk_darwin(v9);
  uint64_t v12 = &v85[-v11];
  uint64_t v13 = sub_100006380(&qword_10006B060);
  __chkstk_darwin(v13 - 8);
  uint64_t v15 = &v85[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v16 = sub_100006380(&qword_10006B038);
  uint64_t v17 = __chkstk_darwin(v16 - 8);
  v87 = &v85[-((v18 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v19 = __chkstk_darwin(v17);
  v97 = &v85[-v20];
  uint64_t v21 = __chkstk_darwin(v19);
  v92 = &v85[-v22];
  uint64_t v23 = __chkstk_darwin(v21);
  v90 = &v85[-v24];
  uint64_t v25 = __chkstk_darwin(v23);
  v104 = &v85[-v26];
  uint64_t v27 = __chkstk_darwin(v25);
  v101 = &v85[-v28];
  uint64_t v29 = __chkstk_darwin(v27);
  v88 = &v85[-v30];
  uint64_t v31 = __chkstk_darwin(v29);
  v93 = &v85[-v32];
  uint64_t v33 = __chkstk_darwin(v31);
  v94 = &v85[-v34];
  uint64_t v35 = __chkstk_darwin(v33);
  v37 = &v85[-v36];
  uint64_t v38 = __chkstk_darwin(v35);
  v40 = &v85[-v39];
  __chkstk_darwin(v38);
  v42 = &v85[-v41];
  uint64_t v98 = v0;
  uint64_t v99 = v0 + OBJC_IVAR____TtC19LiveTranscriptionUI14ForeheadWindow__horizontalSizeClass;
  sub_100006754(v0 + OBJC_IVAR____TtC19LiveTranscriptionUI14ForeheadWindow__horizontalSizeClass, (uint64_t)v15, &qword_10006B060);
  sub_10000E06C((uint64_t)v42);
  v110 = v15;
  sub_1000067B8((uint64_t)v15, &qword_10006B060);
  uint64_t v43 = *(void (**)(void))(v2 + 104);
  unsigned int v103 = enum case for UserInterfaceSizeClass.regular(_:);
  v108 = (void (*)(unsigned char *, void, uint64_t))v43;
  uint64_t v109 = v2 + 104;
  v43(v40);
  v106 = *(void (**)(unsigned char *, void, uint64_t, uint64_t))(v2 + 56);
  uint64_t v107 = v2 + 56;
  v106(v40, 0, 1, v1);
  uint64_t v105 = v4;
  uint64_t v44 = (uint64_t)&v12[*(int *)(v4 + 48)];
  sub_100006754((uint64_t)v42, (uint64_t)v12, &qword_10006B038);
  sub_100006754((uint64_t)v40, v44, &qword_10006B038);
  uint64_t v45 = *(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v2 + 48);
  unsigned int v46 = v45(v12, 1, v1);
  uint64_t v102 = v2;
  if (v46 == 1)
  {
    sub_1000067B8((uint64_t)v40, &qword_10006B038);
    sub_1000067B8((uint64_t)v42, &qword_10006B038);
    if (v45((unsigned char *)v44, 1, v1) != 1)
    {
      uint64_t v47 = v105;
LABEL_13:
      uint64_t v51 = (uint64_t)v101;
      uint64_t v48 = v104;
LABEL_14:
      sub_1000067B8((uint64_t)v12, &qword_10006B058);
      goto LABEL_15;
    }
    sub_1000067B8((uint64_t)v12, &qword_10006B038);
    uint64_t v48 = v104;
    uint64_t v47 = v105;
  }
  else
  {
    sub_100006754((uint64_t)v12, (uint64_t)v37, &qword_10006B038);
    v95 = v45;
    if (v45((unsigned char *)v44, 1, v1) == 1)
    {
LABEL_12:
      sub_1000067B8((uint64_t)v40, &qword_10006B038);
      sub_1000067B8((uint64_t)v42, &qword_10006B038);
      (*(void (**)(unsigned char *, uint64_t))(v2 + 8))(v37, v1);
      uint64_t v47 = v105;
      uint64_t v45 = v95;
      goto LABEL_13;
    }
    uint64_t v49 = v96;
    (*(void (**)(unsigned char *, uint64_t, uint64_t))(v2 + 32))(v96, v44, v1);
    sub_1000084DC();
    int v86 = dispatch thunk of static Equatable.== infix(_:_:)();
    uint64_t v50 = *(void (**)(unsigned char *, uint64_t))(v2 + 8);
    v50(v49, v1);
    sub_1000067B8((uint64_t)v40, &qword_10006B038);
    sub_1000067B8((uint64_t)v42, &qword_10006B038);
    v50(v37, v1);
    sub_1000067B8((uint64_t)v12, &qword_10006B038);
    uint64_t v48 = v104;
    uint64_t v47 = v105;
    uint64_t v45 = v95;
    uint64_t v51 = (uint64_t)v101;
    if ((v86 & 1) == 0) {
      goto LABEL_15;
    }
  }
  uint64_t v52 = (uint64_t)v110;
  sub_100006754(v98 + OBJC_IVAR____TtC19LiveTranscriptionUI14ForeheadWindow__verticalSizeClass, (uint64_t)v110, &qword_10006B060);
  long long v53 = v94;
  sub_10000E06C((uint64_t)v94);
  sub_1000067B8(v52, &qword_10006B060);
  v54 = v45;
  v55 = v93;
  v108(v93, enum case for UserInterfaceSizeClass.compact(_:), v1);
  v106(v55, 0, 1, v1);
  uint64_t v12 = v91;
  uint64_t v56 = (uint64_t)&v91[*(int *)(v47 + 48)];
  sub_100006754((uint64_t)v53, (uint64_t)v91, &qword_10006B038);
  sub_100006754((uint64_t)v55, v56, &qword_10006B038);
  if (v54(v12, 1, v1) != 1)
  {
    v58 = v88;
    sub_100006754((uint64_t)v12, (uint64_t)v88, &qword_10006B038);
    uint64_t v45 = v54;
    if (v54((unsigned char *)v56, 1, v1) != 1)
    {
      uint64_t v79 = v102;
      v80 = v58;
      v81 = v96;
      (*(void (**)(unsigned char *, uint64_t, uint64_t))(v102 + 32))(v96, v56, v1);
      sub_1000084DC();
      LODWORD(v95) = dispatch thunk of static Equatable.== infix(_:_:)();
      v82 = *(void (**)(unsigned char *, uint64_t))(v79 + 8);
      v82(v81, v1);
      sub_1000067B8((uint64_t)v93, &qword_10006B038);
      sub_1000067B8((uint64_t)v94, &qword_10006B038);
      v82(v80, v1);
      sub_1000067B8((uint64_t)v91, &qword_10006B038);
      uint64_t v51 = (uint64_t)v101;
      if (v95)
      {
        char v76 = 1;
        return v76 & 1;
      }
LABEL_15:
      uint64_t v59 = (uint64_t)v110;
      sub_100006754(v99, (uint64_t)v110, &qword_10006B060);
      sub_10000E06C(v51);
      sub_1000067B8(v59, &qword_10006B060);
      v108(v48, v103, v1);
      v106(v48, 0, 1, v1);
      v60 = v100;
      uint64_t v61 = (uint64_t)&v100[*(int *)(v47 + 48)];
      sub_100006754(v51, (uint64_t)v100, &qword_10006B038);
      sub_100006754((uint64_t)v48, v61, &qword_10006B038);
      if (v45(v60, 1, v1) == 1)
      {
        sub_1000067B8((uint64_t)v48, &qword_10006B038);
        sub_1000067B8(v51, &qword_10006B038);
        unsigned int v62 = v45((unsigned char *)v61, 1, v1);
        uint64_t v63 = v102;
        if (v62 == 1)
        {
          sub_1000067B8((uint64_t)v60, &qword_10006B038);
LABEL_22:
          uint64_t v71 = (uint64_t)v110;
          sub_100006754(v98 + OBJC_IVAR____TtC19LiveTranscriptionUI14ForeheadWindow__verticalSizeClass, (uint64_t)v110, &qword_10006B060);
          v72 = v92;
          sub_10000E06C((uint64_t)v92);
          sub_1000067B8(v71, &qword_10006B060);
          v73 = v97;
          v108(v97, v103, v1);
          v106(v73, 0, 1, v1);
          v74 = v89;
          uint64_t v75 = (uint64_t)&v89[*(int *)(v105 + 48)];
          sub_100006754((uint64_t)v72, (uint64_t)v89, &qword_10006B038);
          sub_100006754((uint64_t)v73, v75, &qword_10006B038);
          if (v45(v74, 1, v1) == 1)
          {
            sub_1000067B8((uint64_t)v97, &qword_10006B038);
            sub_1000067B8((uint64_t)v72, &qword_10006B038);
            if (v45((unsigned char *)v75, 1, v1) == 1)
            {
              uint64_t v57 = (uint64_t)v74;
              goto LABEL_25;
            }
          }
          else
          {
            v77 = v87;
            sub_100006754((uint64_t)v74, (uint64_t)v87, &qword_10006B038);
            if (v45((unsigned char *)v75, 1, v1) != 1)
            {
              v83 = v96;
              (*(void (**)(unsigned char *, uint64_t, uint64_t))(v63 + 32))(v96, v75, v1);
              sub_1000084DC();
              char v76 = dispatch thunk of static Equatable.== infix(_:_:)();
              v84 = *(void (**)(unsigned char *, uint64_t))(v63 + 8);
              v84(v83, v1);
              sub_1000067B8((uint64_t)v97, &qword_10006B038);
              sub_1000067B8((uint64_t)v92, &qword_10006B038);
              v84(v77, v1);
              sub_1000067B8((uint64_t)v74, &qword_10006B038);
              return v76 & 1;
            }
            sub_1000067B8((uint64_t)v97, &qword_10006B038);
            sub_1000067B8((uint64_t)v92, &qword_10006B038);
            (*(void (**)(unsigned char *, uint64_t))(v63 + 8))(v77, v1);
          }
          uint64_t v66 = (uint64_t)v74;
          goto LABEL_29;
        }
      }
      else
      {
        v64 = v90;
        sub_100006754((uint64_t)v60, (uint64_t)v90, &qword_10006B038);
        unsigned int v65 = v45((unsigned char *)v61, 1, v1);
        uint64_t v63 = v102;
        if (v65 != 1)
        {
          v67 = v64;
          v68 = v96;
          (*(void (**)(unsigned char *, uint64_t, uint64_t))(v102 + 32))(v96, v61, v1);
          sub_1000084DC();
          char v69 = dispatch thunk of static Equatable.== infix(_:_:)();
          v95 = v45;
          v70 = *(void (**)(unsigned char *, uint64_t))(v63 + 8);
          v70(v68, v1);
          sub_1000067B8((uint64_t)v104, &qword_10006B038);
          sub_1000067B8(v51, &qword_10006B038);
          v70(v67, v1);
          uint64_t v45 = v95;
          sub_1000067B8((uint64_t)v60, &qword_10006B038);
          if ((v69 & 1) == 0)
          {
LABEL_30:
            char v76 = 0;
            return v76 & 1;
          }
          goto LABEL_22;
        }
        sub_1000067B8((uint64_t)v48, &qword_10006B038);
        sub_1000067B8(v51, &qword_10006B038);
        (*(void (**)(unsigned char *, uint64_t))(v63 + 8))(v64, v1);
      }
      uint64_t v66 = (uint64_t)v60;
LABEL_29:
      sub_1000067B8(v66, &qword_10006B058);
      goto LABEL_30;
    }
    v95 = v54;
    v40 = v93;
    v42 = v94;
    v37 = v58;
    uint64_t v2 = v102;
    goto LABEL_12;
  }
  sub_1000067B8((uint64_t)v55, &qword_10006B038);
  sub_1000067B8((uint64_t)v53, &qword_10006B038);
  if (v54((unsigned char *)v56, 1, v1) != 1)
  {
    uint64_t v45 = v54;
    uint64_t v51 = (uint64_t)v101;
    goto LABEL_14;
  }
  uint64_t v57 = (uint64_t)v12;
LABEL_25:
  sub_1000067B8(v57, &qword_10006B038);
  char v76 = 1;
  return v76 & 1;
}

char *sub_100007704()
{
  uint64_t v1 = sub_100006380(&qword_10006B078);
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)&v19 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100006380(&qword_10006B080);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = (uint64_t *)&v0[OBJC_IVAR____TtC19LiveTranscriptionUI14ForeheadWindow__verticalSizeClass];
  *uint64_t v9 = swift_getKeyPath();
  sub_100006380(&qword_10006B088);
  swift_storeEnumTagMultiPayload();
  uint64_t v10 = (uint64_t *)&v0[OBJC_IVAR____TtC19LiveTranscriptionUI14ForeheadWindow__horizontalSizeClass];
  *uint64_t v10 = swift_getKeyPath();
  swift_storeEnumTagMultiPayload();
  uint64_t v11 = OBJC_IVAR____TtC19LiveTranscriptionUI14ForeheadWindow_layoutMonitor;
  id v12 = objc_allocWithZone((Class)SBSSystemApertureLayoutMonitor);
  uint64_t v13 = v0;
  *(void *)&v0[v11] = [v12 init];
  uint64_t v14 = &v13[OBJC_IVAR____TtC19LiveTranscriptionUI14ForeheadWindow__foreheadRect];
  type metadata accessor for CGRect(0);
  long long v20 = 0u;
  long long v21 = 0u;
  Published.init(initialValue:)();
  (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v14, v8, v5);
  uint64_t v15 = &v13[OBJC_IVAR____TtC19LiveTranscriptionUI14ForeheadWindow__frames];
  *(void *)&long long v20 = &_swiftEmptyArrayStorage;
  sub_100006380(&qword_10006B050);
  Published.init(initialValue:)();
  (*(void (**)(char *, char *, uint64_t))(v2 + 32))(v15, v4, v1);
  *(void *)&v13[OBJC_IVAR____TtC19LiveTranscriptionUI14ForeheadWindow_minimumForeheadHeight] = 0x4042AAAAAAAAAAABLL;

  uint64_t v16 = (objc_class *)type metadata accessor for ForeheadWindow();
  v19.receiver = v13;
  v19.super_class = v16;
  uint64_t v17 = (char *)objc_msgSendSuper2(&v19, "init");
  [*(id *)&v17[OBJC_IVAR____TtC19LiveTranscriptionUI14ForeheadWindow_layoutMonitor] addObserver:v17];
  return v17;
}

void sub_1000079F4(unint64_t a1)
{
  if (!AXDeviceHasJindo() || (sub_1000069E8() & 1) != 0)
  {
    CGPoint origin = CGRectZero.origin;
    CGFloat width = CGRectZero.size.width;
    CGFloat height = CGRectZero.size.height;
    swift_getKeyPath();
    swift_getKeyPath();
    CGPoint v63 = origin;
    CGFloat v64 = width;
    CGFloat v65 = height;
    id v5 = v1;
LABEL_4:
    static Published.subscript.setter();
    return;
  }
  swift_getKeyPath();
  swift_getKeyPath();
  *(void *)&v63.CGFloat x = &_swiftEmptyArrayStorage;
  id v62 = v1;
  static Published.subscript.setter();
  unint64_t v58 = a1 >> 62;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v6 = _CocoaArrayWrapper.endIndex.getter();
    if (!v6) {
      goto LABEL_20;
    }
  }
  else
  {
    uint64_t v6 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (!v6) {
      goto LABEL_20;
    }
  }
  if (v6 < 1)
  {
    __break(1u);
    goto LABEL_38;
  }
  uint64_t v7 = 0;
  unint64_t v59 = a1;
  unint64_t v60 = a1 & 0xC000000000000001;
  do
  {
    if (v60) {
      id v8 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
    }
    else {
      id v8 = *(id *)(a1 + 8 * v7 + 32);
    }
    uint64_t v9 = v8;
    [v8 CGRectValue];
    uint64_t v11 = v10;
    uint64_t v13 = v12;
    uint64_t v15 = v14;
    uint64_t v17 = v16;
    swift_getKeyPath();
    swift_getKeyPath();
    uint64_t v18 = (void (*)(CGPoint *, void))static Published.subscript.modify();
    long long v20 = v19;
    long long v21 = *v19;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    char *v20 = v21;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      long long v21 = sub_10003B188(0, *((void *)v21 + 2) + 1, 1, v21);
      char *v20 = v21;
    }
    unint64_t v24 = *((void *)v21 + 2);
    unint64_t v23 = *((void *)v21 + 3);
    if (v24 >= v23 >> 1)
    {
      long long v21 = sub_10003B188((char *)(v23 > 1), v24 + 1, 1, v21);
      char *v20 = v21;
    }
    a1 = v59;
    ++v7;
    *((void *)v21 + 2) = v24 + 1;
    uint64_t v25 = &v21[32 * v24];
    *((void *)v25 + 4) = v11;
    *((void *)v25 + 5) = v13;
    *((void *)v25 + 6) = v15;
    *((void *)v25 + 7) = v17;
    v18(&v63, 0);

    swift_release();
    swift_release();
  }
  while (v6 != v7);
LABEL_20:
  swift_bridgeObjectRelease();
  if (!v58)
  {
    uint64_t v26 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v26 != 2) {
      goto LABEL_22;
    }
LABEL_28:
    uint64_t v6 = a1 & 0xC000000000000001;
    if ((a1 & 0xC000000000000001) == 0)
    {
      if (!*(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
      {
        __break(1u);
        goto LABEL_42;
      }
      id v37 = *(id *)(a1 + 32);
LABEL_31:
      uint64_t v38 = v37;
      [v37 CGRectValue];
      CGFloat v40 = v39;
      CGFloat v42 = v41;
      CGFloat v44 = v43;
      CGFloat v46 = v45;

      if (v6)
      {
        id v47 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
LABEL_35:
        uint64_t v48 = v47;
        [v47 CGRectValue];
        CGFloat v50 = v49;
        CGFloat v52 = v51;
        CGFloat v54 = v53;
        CGFloat v56 = v55;

        v66.origin.CGFloat x = v40;
        v66.origin.CGFloat y = v42;
        v66.size.CGFloat width = v44;
        v66.size.CGFloat height = v46;
        v68.origin.CGFloat x = v50;
        v68.origin.CGFloat y = v52;
        v68.size.CGFloat width = v54;
        v68.size.CGFloat height = v56;
        CGRect v67 = CGRectUnion(v66, v68);
        CGFloat x = v67.origin.x;
        CGFloat y = v67.origin.y;
        CGFloat v34 = v67.size.width;
        CGFloat v36 = v67.size.height;
        goto LABEL_36;
      }
      if (*(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10) >= 2uLL)
      {
        id v47 = *(id *)(a1 + 40);
        goto LABEL_35;
      }
LABEL_42:
      __break(1u);
      return;
    }
LABEL_40:
    id v37 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
    goto LABEL_31;
  }
  swift_bridgeObjectRetain();
  uint64_t v26 = _CocoaArrayWrapper.endIndex.getter();
  swift_bridgeObjectRelease();
  if (v26 == 2) {
    goto LABEL_28;
  }
LABEL_22:
  if (v26 == 1)
  {
    if ((a1 & 0xC000000000000001) == 0)
    {
      if (*(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
      {
        id v27 = *(id *)(a1 + 32);
LABEL_26:
        uint64_t v28 = v27;
        [v27 CGRectValue];
        CGFloat x = v29;
        CGFloat y = v31;
        CGFloat v34 = v33;
        CGFloat v36 = v35;

LABEL_36:
        swift_getKeyPath();
        swift_getKeyPath();
        v63.CGFloat x = x;
        v63.CGFloat y = y;
        CGFloat v64 = v34;
        CGFloat v65 = v36;
        id v57 = v62;
        goto LABEL_4;
      }
      __break(1u);
      goto LABEL_40;
    }
LABEL_38:
    id v27 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
    goto LABEL_26;
  }
}

id sub_100007ED8()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ForeheadWindow();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_10000800C()
{
  return type metadata accessor for ForeheadWindow();
}

uint64_t type metadata accessor for ForeheadWindow()
{
  uint64_t result = qword_10006B020;
  if (!qword_10006B020) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_100008060()
{
  sub_100008220(319, (unint64_t *)&qword_10006B030, &qword_10006B038, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Environment.Content);
  if (v0 <= 0x3F)
  {
    sub_1000081C8();
    if (v1 <= 0x3F)
    {
      sub_100008220(319, &qword_10006B048, &qword_10006B050, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Published);
      if (v2 <= 0x3F) {
        swift_updateClassMetadata2();
      }
    }
  }
}

void sub_1000081C8()
{
  if (!qword_10006B040)
  {
    type metadata accessor for CGRect(255);
    unint64_t v0 = type metadata accessor for Published();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_10006B040);
    }
  }
}

void sub_100008220(uint64_t a1, unint64_t *a2, uint64_t *a3, uint64_t (*a4)(uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v7 = sub_10000646C(a3);
    unint64_t v8 = a4(a1, v7);
    if (!v9) {
      atomic_store(v8, a2);
    }
  }
}

void *sub_100008280()
{
  return &protocol witness table for ObservableObjectPublisher;
}

uint64_t sub_10000828C@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for ForeheadWindow();
  uint64_t result = ObservableObject<>.objectWillChange.getter();
  *a1 = result;
  return result;
}

double sub_1000082CC@<D0>(_OWORD *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  double result = *(double *)&v3;
  *a1 = v3;
  a1[1] = v4;
  return result;
}

uint64_t sub_100008350(uint64_t a1, void **a2)
{
  unint64_t v2 = *a2;
  swift_getKeyPath();
  swift_getKeyPath();
  id v3 = v2;
  return static Published.subscript.setter();
}

uint64_t sub_1000083DC@<X0>(void *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_100008460(uint64_t a1, void **a2)
{
  unint64_t v2 = *a2;
  swift_getKeyPath();
  swift_getKeyPath();
  swift_bridgeObjectRetain();
  id v3 = v2;
  return static Published.subscript.setter();
}

unint64_t sub_1000084DC()
{
  unint64_t result = qword_10006B068;
  if (!qword_10006B068)
  {
    type metadata accessor for UserInterfaceSizeClass();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006B068);
  }
  return result;
}

unint64_t sub_100008534()
{
  unint64_t result = qword_10006B070;
  if (!qword_10006B070)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10006B070);
  }
  return result;
}

uint64_t sub_100008584()
{
  sub_100008620();
  uint64_t result = OS_os_log.init(subsystem:category:)();
  qword_10006DF88 = result;
  return result;
}

uint64_t sub_1000085EC()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for LTUtilities()
{
  return self;
}

unint64_t sub_100008620()
{
  unint64_t result = qword_10006B190;
  if (!qword_10006B190)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10006B190);
  }
  return result;
}

uint64_t sub_100008660()
{
  uint64_t v0 = type metadata accessor for DynamicTypeSize();
  sub_1000092C8(v0, accessibilityLayoutTextSize);
  uint64_t v1 = sub_10000874C(v0, (uint64_t)accessibilityLayoutTextSize);
  uint64_t v2 = enum case for DynamicTypeSize.accessibility1(_:);
  id v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 104);

  return v3(v1, v2, v0);
}

uint64_t accessibilityLayoutTextSize.unsafeMutableAddressor()
{
  if (qword_10006AD98 != -1) {
    swift_once();
  }
  uint64_t v0 = type metadata accessor for DynamicTypeSize();

  return sub_10000874C(v0, (uint64_t)accessibilityLayoutTextSize);
}

uint64_t sub_10000874C(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t isAccessibilityLayout(_:)(uint64_t a1)
{
  uint64_t v2 = sub_100006380(&qword_10006B198);
  __chkstk_darwin(v2 - 8);
  long long v4 = (char *)&v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for DynamicTypeSize();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  unint64_t v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100008958(a1, (uint64_t)v4);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
  {
    sub_1000089C0((uint64_t)v4);
    char v9 = 0;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v8, v4, v5);
    if (qword_10006AD98 != -1) {
      swift_once();
    }
    sub_10000874C(v5, (uint64_t)accessibilityLayoutTextSize);
    sub_100008A20();
    char v9 = dispatch thunk of static Comparable.< infix(_:_:)() ^ 1;
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
  return v9 & 1;
}

uint64_t sub_100008958(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100006380(&qword_10006B198);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000089C0(uint64_t a1)
{
  uint64_t v2 = sub_100006380(&qword_10006B198);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_100008A20()
{
  unint64_t result = qword_10006B1A0;
  if (!qword_10006B1A0)
  {
    type metadata accessor for DynamicTypeSize();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006B1A0);
  }
  return result;
}

uint64_t imageViewForBundleId(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100006380(&qword_10006B198);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a2)
  {
    [objc_allocWithZone((Class)UIImage) init];
    return Image.init(uiImage:)();
  }
  if (static String._unconditionallyBridgeFromObjectiveC(_:)() == a1 && v7 == a2)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    char v9 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if ((v9 & 1) == 0)
    {
      uint64_t v10 = type metadata accessor for DynamicTypeSize();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v6, 1, 1, v10);
      id v11 = iconForBundleId(_:dynamicTypeSize:)(a1, a2, (uint64_t)v6);
      sub_1000089C0((uint64_t)v6);
      if (!v11) {
        [objc_allocWithZone((Class)UIImage) init];
      }
      return Image.init(uiImage:)();
    }
  }

  return Image.init(systemName:)();
}

id iconForBundleId(_:dynamicTypeSize:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100006380(&qword_10006B198);
  __chkstk_darwin(v6 - 8);
  unint64_t v8 = (char *)&v48 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for DynamicTypeSize();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v48 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_100006380(&qword_10006B1A8);
  __chkstk_darwin(v13 - 8);
  uint64_t v15 = (char *)&v48 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a2) {
    return 0;
  }
  uint64_t v16 = qword_10006AE20;
  swift_bridgeObjectRetain();
  if (v16 != -1) {
    swift_once();
  }
  uint64_t v17 = self;
  if (qword_10006AE10 != -1) {
    swift_once();
  }
  id v18 = [v17 preferredFontForTextStyle:titleFontStyle];
  [v18 pointSize];
  double v20 = v19;

  if (static String._unconditionallyBridgeFromObjectiveC(_:)() == a1 && v21 == a2)
  {
    swift_bridgeObjectRelease();
LABEL_10:
    swift_bridgeObjectRelease();
    uint64_t v23 = type metadata accessor for URL();
    uint64_t v24 = *(void *)(v23 - 8);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v24 + 56))(v15, 1, 1, v23);
    NSString v25 = String._bridgeToObjectiveC()();
    id v27 = 0;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v24 + 48))(v15, 1, v23) != 1)
    {
      URL._bridgeToObjectiveC()(v26);
      id v27 = v28;
      (*(void (**)(char *, uint64_t))(v24 + 8))(v15, v23);
    }
    id v29 = [objc_allocWithZone((Class)ISSymbol) initWithSymbolName:v25 bundleURL:v27];

    id v30 = objc_msgSend(v29, "imageForSize:scale:", v20, v20, 1.0);
    if (v30)
    {
      id v31 = v30;
      id result = [v31 CGImage];
      if (result)
      {
        double v33 = result;
        [v31 scale];
        id v35 = [objc_allocWithZone((Class)UIImage) initWithCGImage:v33 scale:0 orientation:v34];

        id v36 = [self blueColor];
        id v37 = [v35 imageWithTintColor:v36 renderingMode:1];

        return v37;
      }
      __break(1u);
      goto LABEL_29;
    }

    return 0;
  }
  char v22 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  if (v22) {
    goto LABEL_10;
  }
  id v38 = objc_allocWithZone((Class)ISIcon);
  NSString v39 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v40 = [v38 initWithBundleIdentifier:v39];

  double v41 = v20 + v20;
  sub_100008958(a3, (uint64_t)v8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) == 1)
  {
    sub_1000089C0((uint64_t)v8);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v12, v8, v9);
    if (qword_10006AD98 != -1) {
      swift_once();
    }
    sub_10000874C(v9, (uint64_t)accessibilityLayoutTextSize);
    sub_100008A20();
    char v42 = dispatch thunk of static Comparable.< infix(_:_:)();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
    if ((v42 & 1) == 0) {
      double v41 = v20 * 4.0;
    }
  }
  id v43 = objc_msgSend(objc_allocWithZone((Class)ISImageDescriptor), "initWithSize:scale:", v41, v41, 1.0);
  id v44 = [v40 prepareImageForDescriptor:v43];
  if (!v44)
  {

    return 0;
  }
  id v45 = v44;
  id result = [v45 CGImage];
  if (result)
  {
    CGFloat v46 = result;
    [v45 scale];
    id v37 = [objc_allocWithZone((Class)UIImage) initWithCGImage:v46 scale:0 orientation:v47];

    return v37;
  }
LABEL_29:
  __break(1u);
  return result;
}

uint64_t *sub_1000092C8(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

void *windowOpacity.unsafeMutableAddressor()
{
  return &windowOpacity;
}

void *fullscreenOpacity.unsafeMutableAddressor()
{
  return &fullscreenOpacity;
}

void *buttonsTopInset.unsafeMutableAddressor()
{
  return &buttonsTopInset;
}

void *topButtonsBarHeight.unsafeMutableAddressor()
{
  return &topButtonsBarHeight;
}

uint64_t sub_10000935C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v32 = a3;
  uint64_t v31 = type metadata accessor for GeometryProxy();
  uint64_t v5 = *(void *)(v31 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  __chkstk_darwin(v31);
  id v30 = (char *)&v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100006380(&qword_10006B1B0);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v29 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100006380(&qword_10006B1B8);
  uint64_t v11 = v10 - 8;
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v29 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)uint64_t v9 = static VerticalAlignment.top.getter();
  *((void *)v9 + 1) = 0;
  v9[16] = 0;
  uint64_t v14 = sub_100006380(&qword_10006B1C0);
  sub_10000960C(a2, a1, (uint64_t)&v9[*(int *)(v14 + 44)]);
  uint64_t v15 = *(void *)(a2 + 72);
  char v16 = static Edge.Set.all.getter();
  sub_100006754((uint64_t)v9, (uint64_t)v13, &qword_10006B1B0);
  uint64_t v17 = &v13[*(int *)(v11 + 44)];
  char *v17 = v16;
  *((void *)v17 + 1) = 0x4020000000000000;
  *((void *)v17 + 2) = v15;
  *((void *)v17 + 3) = 0x4020000000000000;
  *((void *)v17 + 4) = v15;
  v17[40] = 0;
  sub_1000067B8((uint64_t)v9, &qword_10006B1B0);
  id v18 = v30;
  uint64_t v19 = a1;
  uint64_t v20 = v31;
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v30, v19, v31);
  unint64_t v21 = (*(unsigned __int8 *)(v5 + 80) + 112) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  char v22 = (char *)swift_allocObject();
  long long v23 = *(_OWORD *)(a2 + 48);
  *((_OWORD *)v22 + 3) = *(_OWORD *)(a2 + 32);
  *((_OWORD *)v22 + 4) = v23;
  long long v24 = *(_OWORD *)(a2 + 80);
  *((_OWORD *)v22 + 5) = *(_OWORD *)(a2 + 64);
  *((_OWORD *)v22 + 6) = v24;
  long long v25 = *(_OWORD *)(a2 + 16);
  *((_OWORD *)v22 + 1) = *(_OWORD *)a2;
  *((_OWORD *)v22 + 2) = v25;
  (*(void (**)(char *, char *, uint64_t))(v5 + 32))(&v22[v21], v18, v20);
  uint64_t v26 = v32;
  sub_100006754((uint64_t)v13, v32, &qword_10006B1B8);
  id v27 = (uint64_t (**)())(v26 + *(int *)(sub_100006380(&qword_10006B1C8) + 36));
  *id v27 = sub_10000A768;
  v27[1] = (uint64_t (*)())v22;
  v27[2] = 0;
  v27[3] = 0;
  sub_10000A5FC(a2);
  return sub_1000067B8((uint64_t)v13, &qword_10006B1B8);
}

uint64_t sub_10000960C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v73 = a2;
  uint64_t v85 = a3;
  uint64_t v4 = sub_100006380(&qword_10006B1D8);
  uint64_t v5 = __chkstk_darwin(v4 - 8);
  v80 = (uint64_t *)((char *)&v64 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  __chkstk_darwin(v5);
  uint64_t v83 = (uint64_t)&v64 - v7;
  uint64_t v8 = type metadata accessor for ButtonView();
  uint64_t v9 = __chkstk_darwin(v8 - 8);
  uint64_t v84 = (uint64_t)&v64 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __chkstk_darwin(v9);
  uint64_t v87 = (uint64_t)&v64 - v12;
  uint64_t v13 = __chkstk_darwin(v11);
  uint64_t v86 = (uint64_t)&v64 - v14;
  __chkstk_darwin(v13);
  char v16 = (char *)&v64 - v15;
  uint64_t v17 = sub_100006380(&qword_10006B1E0);
  uint64_t v18 = __chkstk_darwin(v17);
  uint64_t v70 = (uint64_t)&v64 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = __chkstk_darwin(v18);
  char v22 = (char *)&v64 - v21;
  __chkstk_darwin(v20);
  long long v24 = (char *)&v64 - v23;
  long long v108 = *(_OWORD *)a1;
  char v109 = *(unsigned char *)(a1 + 16);
  long long v99 = *(_OWORD *)a1;
  LOBYTE(v100) = *(unsigned char *)(a1 + 16);
  uint64_t v72 = sub_100006380(&qword_10006B1E8);
  Binding.projectedValue.getter();
  long long v25 = v104;
  char v26 = v105;
  id v27 = (_OWORD *)swift_allocObject();
  long long v28 = *(_OWORD *)(a1 + 48);
  v27[3] = *(_OWORD *)(a1 + 32);
  v27[4] = v28;
  long long v29 = *(_OWORD *)(a1 + 80);
  v27[5] = *(_OWORD *)(a1 + 64);
  v27[6] = v29;
  long long v30 = *(_OWORD *)(a1 + 16);
  v27[1] = *(_OWORD *)a1;
  v27[2] = v30;
  sub_10000A5FC(a1);
  uint64_t v31 = (uint64_t)v27;
  uint64_t v32 = (uint64_t)v22;
  sub_10003C270(4, v25, *((uint64_t *)&v25 + 1), v26, (uint64_t)sub_10000A830, v31, (uint64_t)v16);
  long long v107 = *(_OWORD *)(a1 + 80);
  long long v104 = *(_OWORD *)(a1 + 80);
  sub_100006380(&qword_10006B1D0);
  State.wrappedValue.getter();
  static Alignment.center.getter();
  _FrameLayout.init(width:height:alignment:)();
  sub_10000A858((uint64_t)v16, (uint64_t)v22);
  uint64_t v69 = v17;
  double v33 = &v22[*(int *)(v17 + 36)];
  long long v34 = v91;
  *(_OWORD *)double v33 = v90;
  *((_OWORD *)v33 + 1) = v34;
  *((_OWORD *)v33 + 2) = v92;
  v81 = v16;
  sub_10000A8BC((uint64_t)v16);
  v82 = v24;
  sub_10000A940((uint64_t)v22, (uint64_t)v24, &qword_10006B1E0);
  GeometryProxy.size.getter();
  long long v104 = v107;
  State.wrappedValue.getter();
  static Alignment.center.getter();
  _FrameLayout.init(width:height:alignment:)();
  uint64_t v79 = v93;
  int v78 = v94;
  uint64_t v77 = v95;
  int v76 = v96;
  uint64_t v74 = v98;
  uint64_t v75 = v97;
  long long v99 = v108;
  LOBYTE(v100) = v109;
  Binding.projectedValue.getter();
  sub_10003C270(0, v104, *((uint64_t *)&v104 + 1), v105, (uint64_t)nullsub_1, 0, v86);
  long long v99 = v108;
  LOBYTE(v100) = v109;
  Binding.projectedValue.getter();
  sub_10003C270(1, v104, *((uint64_t *)&v104 + 1), v105, (uint64_t)nullsub_1, 0, v87);
  uint64_t v35 = *(void *)(a1 + 40);
  if (v35)
  {
    uint64_t v36 = *(void *)(a1 + 48);
    swift_retain();
    GeometryProxy.size.getter();
    long long v104 = v107;
    State.wrappedValue.getter();
    static Alignment.center.getter();
    _FrameLayout.init(width:height:alignment:)();
    uint64_t v73 = v99;
    int v68 = BYTE8(v99);
    uint64_t v67 = v100;
    int v66 = v101;
    uint64_t v64 = v103;
    uint64_t v65 = v102;
    long long v88 = v108;
    char v89 = v109;
    Binding.projectedValue.getter();
    uint64_t v38 = *((void *)&v104 + 1);
    uint64_t v37 = v104;
    char v39 = v105;
    uint64_t v40 = swift_allocObject();
    *(void *)(v40 + 16) = v35;
    *(void *)(v40 + 24) = v36;
    swift_retain();
    uint64_t v41 = (uint64_t)v81;
    char v42 = v39;
    uint64_t v32 = (uint64_t)v22;
    sub_10003C270(3, v37, v38, v42, (uint64_t)sub_10000A918, v40, (uint64_t)v81);
    long long v104 = v107;
    State.wrappedValue.getter();
    static Alignment.center.getter();
    _FrameLayout.init(width:height:alignment:)();
    uint64_t v43 = v70;
    sub_10000A858(v41, v70);
    id v44 = (_OWORD *)(v43 + *(int *)(v69 + 36));
    long long v45 = v105;
    _OWORD *v44 = v104;
    v44[1] = v45;
    v44[2] = v106;
    sub_10000A8BC(v41);
    sub_10000A940(v43, (uint64_t)v22, &qword_10006B1E0);
    sub_100006754((uint64_t)v22, v43, &qword_10006B1E0);
    uint64_t v46 = (uint64_t)v80;
    void *v80 = 0;
    *(unsigned char *)(v46 + 8) = 1;
    *(void *)(v46 + 16) = v73;
    *(unsigned char *)(v46 + 24) = v68;
    *(void *)(v46 + 32) = v67;
    *(unsigned char *)(v46 + 40) = v66;
    uint64_t v47 = v64;
    *(void *)(v46 + 48) = v65;
    *(void *)(v46 + 56) = v47;
    uint64_t v48 = sub_100006380(&qword_10006B200);
    sub_100006754(v43, v46 + *(int *)(v48 + 48), &qword_10006B1E0);
    sub_10000A210(v35);
    sub_1000067B8((uint64_t)v22, &qword_10006B1E0);
    sub_1000067B8(v43, &qword_10006B1E0);
    uint64_t v49 = sub_100006380(&qword_10006B1F0);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v49 - 8) + 56))(v46, 0, 1, v49);
    uint64_t v50 = v83;
    sub_10000A940(v46, v83, &qword_10006B1D8);
    uint64_t v51 = v46;
  }
  else
  {
    uint64_t v52 = sub_100006380(&qword_10006B1F0);
    uint64_t v50 = v83;
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v52 - 8) + 56))(v83, 1, 1, v52);
    uint64_t v51 = (uint64_t)v80;
    uint64_t v41 = (uint64_t)v81;
  }
  uint64_t v71 = v32;
  uint64_t v53 = (uint64_t)v82;
  sub_100006754((uint64_t)v82, v32, &qword_10006B1E0);
  uint64_t v54 = v86;
  sub_10000A858(v86, v41);
  uint64_t v55 = v87;
  uint64_t v56 = v84;
  sub_10000A858(v87, v84);
  sub_100006754(v50, v51, &qword_10006B1D8);
  uint64_t v57 = v32;
  uint64_t v58 = v85;
  sub_100006754(v57, v85, &qword_10006B1E0);
  uint64_t v59 = v51;
  unint64_t v60 = (int *)sub_100006380(&qword_10006B1F8);
  uint64_t v61 = v58 + v60[12];
  *(void *)uint64_t v61 = 0;
  *(unsigned char *)(v61 + 8) = 1;
  *(void *)(v61 + 16) = v79;
  *(unsigned char *)(v61 + 24) = v78;
  *(void *)(v61 + 32) = v77;
  *(unsigned char *)(v61 + 40) = v76;
  uint64_t v62 = v74;
  *(void *)(v61 + 48) = v75;
  *(void *)(v61 + 56) = v62;
  sub_10000A858(v41, v58 + v60[16]);
  sub_10000A858(v56, v58 + v60[20]);
  sub_100006754(v59, v58 + v60[24], &qword_10006B1D8);
  sub_1000067B8(v50, &qword_10006B1D8);
  sub_10000A8BC(v55);
  sub_10000A8BC(v54);
  sub_1000067B8(v53, &qword_10006B1E0);
  sub_1000067B8(v59, &qword_10006B1D8);
  sub_10000A8BC(v56);
  sub_10000A8BC(v41);
  return sub_1000067B8(v71, &qword_10006B1E0);
}

uint64_t sub_100009EEC()
{
  return State.wrappedValue.setter();
}

uint64_t sub_100009F50@<X0>(uint64_t (**a1)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)@<X8>)
{
  long long v3 = v1[3];
  v11[2] = v1[2];
  v11[3] = v3;
  long long v4 = v1[5];
  v11[4] = v1[4];
  v11[5] = v4;
  long long v5 = v1[1];
  v11[0] = *v1;
  v11[1] = v5;
  uint64_t v6 = (uint64_t (*)@<X0>(uint64_t@<X0>, uint64_t@<X8>))swift_allocObject();
  long long v7 = v1[3];
  *((_OWORD *)v6 + 3) = v1[2];
  *((_OWORD *)v6 + 4) = v7;
  long long v8 = v1[5];
  *((_OWORD *)v6 + 5) = v1[4];
  *((_OWORD *)v6 + 6) = v8;
  long long v9 = v1[1];
  *((_OWORD *)v6 + 1) = *v1;
  *((_OWORD *)v6 + 2) = v9;
  *a1 = sub_10000A5F4;
  a1[1] = v6;
  return sub_10000A5FC((uint64_t)v11);
}

double sub_100009FD8@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X8>)
{
  State.init(wrappedValue:)();
  if (a4)
  {
    uint64_t v15 = swift_allocObject();
    *(void *)(v15 + 16) = a4;
    *(void *)(v15 + 24) = a5;
    char v16 = sub_10000A220;
  }
  else
  {
    char v16 = (uint64_t (*)())nullsub_1;
    uint64_t v15 = 0;
  }
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = v16;
  *(void *)(v17 + 24) = v15;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  sub_10000A200(a6);
  sub_10000A210(0);
  swift_retain();
  swift_retain();
  swift_retain();
  sub_10000A200(a6);
  swift_retain();
  sub_10000A210(a6);
  swift_release_n();
  swift_release();
  swift_release_n();
  swift_release_n();
  sub_10000A210(a6);
  swift_release();
  *(void *)a8 = a1;
  *(void *)(a8 + 8) = a2;
  *(unsigned char *)(a8 + 16) = a3;
  *(void *)(a8 + 24) = sub_10000A1F8;
  *(void *)(a8 + 32) = v17;
  *(void *)(a8 + 40) = a6;
  *(void *)(a8 + 48) = a7;
  *(void *)&double result = 4;
  *(_OWORD *)(a8 + 56) = xmmword_100053C50;
  *(void *)(a8 + 72) = 0x4034000000000000;
  *(void *)(a8 + 80) = v20;
  *(void *)(a8 + 88) = v21;
  return result;
}

uint64_t sub_10000A1C0()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000A1F8()
{
  return sub_100021778(*(uint64_t (**)(void))(v0 + 16));
}

uint64_t sub_10000A200(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_10000A210(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_10000A220()
{
  return sub_100021750(*(uint64_t (**)(void))(v0 + 16));
}

uint64_t destroy for TopView(uint64_t a1)
{
  swift_release();
  swift_release();
  swift_release();
  if (*(void *)(a1 + 40)) {
    swift_release();
  }

  return swift_release();
}

uint64_t initializeWithCopy for TopView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  uint64_t v5 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v5;
  long long v7 = (_OWORD *)(a2 + 40);
  uint64_t v6 = *(void *)(a2 + 40);
  swift_retain();
  swift_retain();
  swift_retain();
  if (v6)
  {
    uint64_t v8 = *(void *)(a2 + 48);
    *(void *)(a1 + 40) = v6;
    *(void *)(a1 + 48) = v8;
    swift_retain();
  }
  else
  {
    *(_OWORD *)(a1 + 40) = *v7;
  }
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for TopView(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_retain();
  swift_release();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v4;
  swift_retain();
  swift_release();
  uint64_t v5 = *(void *)(a2 + 40);
  if (!*(void *)(a1 + 40))
  {
    if (v5)
    {
      uint64_t v7 = *(void *)(a2 + 48);
      *(void *)(a1 + 40) = v5;
      *(void *)(a1 + 48) = v7;
      swift_retain();
      goto LABEL_8;
    }
LABEL_7:
    *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
    goto LABEL_8;
  }
  if (!v5)
  {
    swift_release();
    goto LABEL_7;
  }
  uint64_t v6 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = v5;
  *(void *)(a1 + 48) = v6;
  swift_retain();
  swift_release();
LABEL_8:
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  swift_retain();
  swift_release();
  return a1;
}

__n128 initializeWithTake for TopView(uint64_t a1, uint64_t a2)
{
  long long v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  __n128 result = *(__n128 *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  long long v5 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v5;
  *(__n128 *)(a1 + 32) = result;
  *(_OWORD *)(a1 + 48) = v4;
  return result;
}

uint64_t assignWithTake for TopView(uint64_t a1, uint64_t a2)
{
  swift_release();
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_release();
  uint64_t v4 = *(void *)(a2 + 40);
  if (!*(void *)(a1 + 40))
  {
    if (v4)
    {
      uint64_t v6 = *(void *)(a2 + 48);
      *(void *)(a1 + 40) = v4;
      *(void *)(a1 + 48) = v6;
      goto LABEL_8;
    }
LABEL_7:
    *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
    goto LABEL_8;
  }
  if (!v4)
  {
    swift_release();
    goto LABEL_7;
  }
  uint64_t v5 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = v4;
  *(void *)(a1 + 48) = v5;
  swift_release();
LABEL_8:
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for TopView(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 96)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for TopView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 88) = 0;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 96) = 1;
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
    *(unsigned char *)(result + 96) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for TopView()
{
  return &type metadata for TopView;
}

uint64_t sub_10000A5D4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10000A5F4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_10000935C(a1, v2 + 16, a2);
}

uint64_t sub_10000A5FC(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  swift_retain();
  swift_retain();
  swift_retain();
  sub_10000A200(v2);
  swift_retain();
  return a1;
}

uint64_t sub_10000A66C()
{
  uint64_t v1 = type metadata accessor for GeometryProxy();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = *(void *)(v2 + 64);
  swift_release();
  swift_release();
  swift_release();
  if (*(void *)(v0 + 56)) {
    swift_release();
  }
  uint64_t v5 = (v3 + 112) & ~v3;
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v5, v1);

  return _swift_deallocObject(v0, v5 + v4, v3 | 7);
}

uint64_t sub_10000A768()
{
  type metadata accessor for GeometryProxy();

  return sub_100009EEC();
}

uint64_t sub_10000A7D0()
{
  swift_release();
  swift_release();
  swift_release();
  if (*(void *)(v0 + 56)) {
    swift_release();
  }
  swift_release();

  return _swift_deallocObject(v0, 112, 7);
}

uint64_t sub_10000A830()
{
  return (*(uint64_t (**)(void))(v0 + 40))();
}

uint64_t sub_10000A858(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ButtonView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000A8BC(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for ButtonView();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10000A918()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_10000A940(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100006380(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

unint64_t sub_10000A9A8()
{
  unint64_t result = qword_10006B208;
  if (!qword_10006B208)
  {
    sub_10000646C(&qword_10006B210);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006B208);
  }
  return result;
}

void *histogramTrailingSpacing.unsafeMutableAddressor()
{
  return &histogramTrailingSpacing;
}

void *sub_10000AA18(void *a1, void *a2, int *a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v13 = *a2;
    *a1 = *a2;
    uint64_t v4 = (void *)(v13 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    uint64_t v7 = type metadata accessor for AXLTCaption();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(v4, a2, v7);
    uint64_t v8 = a3[6];
    *((unsigned char *)v4 + a3[5]) = *((unsigned char *)a2 + a3[5]);
    *(void *)((char *)v4 + v8) = *(void *)((char *)a2 + v8);
    uint64_t v9 = a3[7];
    uint64_t v10 = (void *)((char *)v4 + v9);
    uint64_t v11 = (void *)((char *)a2 + v9);
    sub_100006380(&qword_10006B218);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v12 = type metadata accessor for DynamicTypeSize();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v12 - 8) + 16))(v10, v11, v12);
    }
    else
    {
      *uint64_t v10 = *v11;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v14 = a3[8];
    uint64_t v15 = a3[9];
    char v16 = (void *)((char *)v4 + v14);
    uint64_t v17 = (void *)((char *)a2 + v14);
    uint64_t v18 = v17[1];
    *char v16 = *v17;
    v16[1] = v18;
    uint64_t v19 = (void *)((char *)v4 + v15);
    uint64_t v20 = (void *)((char *)a2 + v15);
    uint64_t v21 = v20[1];
    *uint64_t v19 = *v20;
    v19[1] = v21;
    uint64_t v22 = a3[10];
    uint64_t v23 = a3[11];
    long long v24 = (void *)((char *)v4 + v22);
    long long v25 = (char *)a2 + v22;
    id v27 = *(void **)v25;
    uint64_t v26 = *((void *)v25 + 1);
    *long long v24 = *(void *)v25;
    v24[1] = v26;
    *(void *)((char *)v4 + v23) = *(void *)((char *)a2 + v23);
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    id v28 = v27;
    swift_retain();
  }
  swift_retain();
  return v4;
}

uint64_t sub_10000ABF8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for AXLTCaption();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  uint64_t v5 = a1 + *(int *)(a2 + 28);
  sub_100006380(&qword_10006B218);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = type metadata accessor for DynamicTypeSize();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  }
  else
  {
    swift_release();
  }
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  swift_release();

  return swift_release();
}

uint64_t sub_10000AD28(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = type metadata accessor for AXLTCaption();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(unsigned char *)(a1 + a3[5]) = *(unsigned char *)(a2 + a3[5]);
  *(void *)(a1 + v7) = *(void *)(a2 + v7);
  uint64_t v8 = a3[7];
  uint64_t v9 = (void *)(a1 + v8);
  uint64_t v10 = (void *)(a2 + v8);
  sub_100006380(&qword_10006B218);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v11 = type metadata accessor for DynamicTypeSize();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
  }
  else
  {
    *uint64_t v9 = *v10;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v12 = a3[8];
  uint64_t v13 = a3[9];
  uint64_t v14 = (void *)(a1 + v12);
  uint64_t v15 = (void *)(a2 + v12);
  uint64_t v16 = v15[1];
  *uint64_t v14 = *v15;
  v14[1] = v16;
  uint64_t v17 = (void *)(a1 + v13);
  uint64_t v18 = (void *)(a2 + v13);
  uint64_t v19 = v18[1];
  void *v17 = *v18;
  v17[1] = v19;
  uint64_t v20 = a3[10];
  uint64_t v21 = a3[11];
  uint64_t v22 = (void *)(a1 + v20);
  uint64_t v23 = a2 + v20;
  long long v25 = *(void **)v23;
  uint64_t v24 = *(void *)(v23 + 8);
  *uint64_t v22 = *(void *)v23;
  v22[1] = v24;
  *(void *)(a1 + v21) = *(void *)(a2 + v21);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  id v26 = v25;
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t sub_10000AEBC(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = type metadata accessor for AXLTCaption();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  *(unsigned char *)(a1 + a3[5]) = *(unsigned char *)(a2 + a3[5]);
  *(void *)(a1 + a3[6]) = *(void *)(a2 + a3[6]);
  if (a1 != a2)
  {
    uint64_t v7 = a3[7];
    uint64_t v8 = (void *)(a1 + v7);
    uint64_t v9 = (void *)(a2 + v7);
    sub_1000067B8(a1 + v7, &qword_10006B218);
    sub_100006380(&qword_10006B218);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v10 = type metadata accessor for DynamicTypeSize();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
    }
    else
    {
      void *v8 = *v9;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v11 = a3[8];
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  *(void *)(a1 + v11) = *(void *)(a2 + v11);
  swift_retain();
  swift_release();
  *(void *)(v12 + 8) = *(void *)(v13 + 8);
  swift_retain();
  swift_release();
  uint64_t v14 = a3[9];
  uint64_t v15 = a1 + v14;
  uint64_t v16 = a2 + v14;
  *(void *)(a1 + v14) = *(void *)(a2 + v14);
  swift_retain();
  swift_release();
  *(void *)(v15 + 8) = *(void *)(v16 + 8);
  swift_retain();
  swift_release();
  uint64_t v17 = a3[10];
  uint64_t v18 = a1 + v17;
  uint64_t v19 = a2 + v17;
  uint64_t v20 = *(void **)(a2 + v17);
  uint64_t v21 = *(void **)v18;
  *(void *)uint64_t v18 = v20;
  id v22 = v20;

  *(void *)(v18 + 8) = *(void *)(v19 + 8);
  swift_retain();
  swift_release();
  *(void *)(a1 + a3[11]) = *(void *)(a2 + a3[11]);
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_10000B0C0(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = type metadata accessor for AXLTCaption();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(unsigned char *)(a1 + a3[5]) = *(unsigned char *)(a2 + a3[5]);
  *(void *)(a1 + v7) = *(void *)(a2 + v7);
  uint64_t v8 = a3[7];
  uint64_t v9 = (void *)(a1 + v8);
  uint64_t v10 = (const void *)(a2 + v8);
  uint64_t v11 = sub_100006380(&qword_10006B218);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v12 = type metadata accessor for DynamicTypeSize();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v12 - 8) + 32))(v9, v10, v12);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v9, v10, *(void *)(*(void *)(v11 - 8) + 64));
  }
  uint64_t v13 = a3[9];
  *(_OWORD *)(a1 + a3[8]) = *(_OWORD *)(a2 + a3[8]);
  *(_OWORD *)(a1 + v13) = *(_OWORD *)(a2 + v13);
  uint64_t v14 = a3[11];
  *(_OWORD *)(a1 + a3[10]) = *(_OWORD *)(a2 + a3[10]);
  *(void *)(a1 + v14) = *(void *)(a2 + v14);
  return a1;
}

uint64_t sub_10000B214(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = type metadata accessor for AXLTCaption();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(unsigned char *)(a1 + a3[5]) = *(unsigned char *)(a2 + a3[5]);
  *(void *)(a1 + v7) = *(void *)(a2 + v7);
  if (a1 != a2)
  {
    uint64_t v8 = a3[7];
    uint64_t v9 = (void *)(a1 + v8);
    uint64_t v10 = (const void *)(a2 + v8);
    sub_1000067B8(a1 + v8, &qword_10006B218);
    uint64_t v11 = sub_100006380(&qword_10006B218);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v12 = type metadata accessor for DynamicTypeSize();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v12 - 8) + 32))(v9, v10, v12);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v9, v10, *(void *)(*(void *)(v11 - 8) + 64));
    }
  }
  uint64_t v13 = a3[8];
  uint64_t v14 = a1 + v13;
  uint64_t v15 = a2 + v13;
  *(void *)(a1 + v13) = *(void *)(a2 + v13);
  swift_release();
  *(void *)(v14 + 8) = *(void *)(v15 + 8);
  swift_release();
  uint64_t v16 = a3[9];
  uint64_t v17 = a1 + v16;
  uint64_t v18 = a2 + v16;
  *(void *)(a1 + v16) = *(void *)(a2 + v16);
  swift_release();
  *(void *)(v17 + 8) = *(void *)(v18 + 8);
  swift_release();
  uint64_t v19 = a3[10];
  uint64_t v20 = a1 + v19;
  uint64_t v21 = a2 + v19;
  id v22 = *(void **)(a1 + v19);
  *(void *)(a1 + v19) = *(void *)(a2 + v19);

  *(void *)(v20 + 8) = *(void *)(v21 + 8);
  swift_release();
  *(void *)(a1 + a3[11]) = *(void *)(a2 + a3[11]);
  swift_release();
  return a1;
}

uint64_t sub_10000B3F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10000B404);
}

uint64_t sub_10000B404(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for AXLTCaption();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v10 = a1;
LABEL_5:
    return v9(v10, a2, v8);
  }
  uint64_t v11 = sub_100006380(&qword_10006B220);
  uint64_t v12 = *(void *)(v11 - 8);
  if (*(_DWORD *)(v12 + 84) == a2)
  {
    uint64_t v8 = v11;
    uint64_t v10 = a1 + *(int *)(a3 + 28);
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    goto LABEL_5;
  }
  unint64_t v14 = *(void *)(a1 + *(int *)(a3 + 32));
  if (v14 >= 0xFFFFFFFF) {
    LODWORD(v14) = -1;
  }
  return (v14 + 1);
}

uint64_t sub_10000B51C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10000B530);
}

uint64_t sub_10000B530(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = type metadata accessor for AXLTCaption();
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v12 = a1;
  }
  else
  {
    uint64_t result = sub_100006380(&qword_10006B220);
    uint64_t v14 = *(void *)(result - 8);
    if (*(_DWORD *)(v14 + 84) != a3)
    {
      *(void *)(a1 + *(int *)(a4 + 32)) = (a2 - 1);
      return result;
    }
    uint64_t v10 = result;
    uint64_t v12 = a1 + *(int *)(a4 + 28);
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
  }

  return v11(v12, a2, a2, v10);
}

uint64_t type metadata accessor for AXLTTitleView()
{
  uint64_t result = qword_10006B280;
  if (!qword_10006B280) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_10000B690()
{
  type metadata accessor for AXLTCaption();
  if (v0 <= 0x3F)
  {
    sub_10000B78C();
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void sub_10000B78C()
{
  if (!qword_10006B290)
  {
    type metadata accessor for DynamicTypeSize();
    unint64_t v0 = type metadata accessor for Environment.Content();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_10006B290);
    }
  }
}

uint64_t sub_10000B7E4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10000B800@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v56 = a1;
  uint64_t v3 = type metadata accessor for AXLTCaption();
  uint64_t v57 = *(void *)(v3 - 8);
  uint64_t v58 = v3;
  __chkstk_darwin(v3);
  uint64_t v55 = (char *)&v45 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v54 = type metadata accessor for NSNotificationCenter.Publisher();
  uint64_t v52 = *(void *)(v54 - 8);
  __chkstk_darwin(v54);
  uint64_t v51 = (char *)&v45 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for AXLTTitleView();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  __chkstk_darwin(v6 - 8);
  uint64_t v9 = (char *)&v45 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100006380(&qword_10006B2D8);
  __chkstk_darwin(v10 - 8);
  uint64_t v12 = (char *)&v45 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_100006380(&qword_10006B2E0);
  uint64_t v14 = v13 - 8;
  __chkstk_darwin(v13);
  uint64_t v16 = (char *)&v45 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v50 = sub_100006380(&qword_10006B2E8);
  __chkstk_darwin(v50);
  uint64_t v49 = (uint64_t)&v45 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)uint64_t v12 = static HorizontalAlignment.leading.getter();
  *((void *)v12 + 1) = 0;
  v12[16] = 0;
  uint64_t v18 = &v12[*(int *)(sub_100006380(&qword_10006B2F0) + 44)];
  *(void *)uint64_t v18 = static VerticalAlignment.center.getter();
  *((void *)v18 + 1) = 0x4018000000000000;
  v18[16] = 0;
  uint64_t v19 = sub_100006380(&qword_10006B2F8);
  sub_10000BDD8(v2, (uint64_t)&v18[*(int *)(v19 + 44)]);
  uint64_t v53 = v2;
  sub_10000DE48(v2, (uint64_t)v9);
  uint64_t v20 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v21 = (v20 + 16) & ~v20;
  uint64_t v22 = v21 + v8;
  uint64_t v23 = v20 | 7;
  uint64_t v24 = swift_allocObject();
  sub_10000DEB0((uint64_t)v9, v24 + v21);
  sub_100006754((uint64_t)v12, (uint64_t)v16, &qword_10006B2D8);
  uint64_t v25 = *(int *)(v14 + 44);
  id v26 = v16;
  id v27 = (uint64_t (**)())&v16[v25];
  *id v27 = sub_10000DF14;
  v27[1] = (uint64_t (*)())v24;
  v27[2] = 0;
  v27[3] = 0;
  sub_1000067B8((uint64_t)v12, &qword_10006B2D8);
  id v28 = [self defaultCenter];
  if (qword_10006ADD0 != -1) {
    swift_once();
  }
  long long v29 = v51;
  NSNotificationCenter.publisher(for:object:)();

  uint64_t v30 = v53;
  sub_10000DE48(v53, (uint64_t)v9);
  uint64_t v47 = v23;
  uint64_t v48 = v22;
  uint64_t v31 = swift_allocObject();
  sub_10000DEB0((uint64_t)v9, v31 + v21);
  uint64_t v32 = v49;
  sub_100006754((uint64_t)v16, v49, &qword_10006B2E0);
  uint64_t v33 = v50;
  uint64_t v34 = v32 + *(int *)(v50 + 52);
  uint64_t v35 = v52;
  uint64_t v36 = *(void (**)(uint64_t, char *, uint64_t))(v52 + 16);
  uint64_t v46 = v21;
  uint64_t v37 = (uint64_t)v26;
  uint64_t v38 = v54;
  v36(v34, v29, v54);
  char v39 = (uint64_t (**)(uint64_t))(v32 + *(int *)(v33 + 56));
  *char v39 = sub_10000DF78;
  v39[1] = (uint64_t (*)(uint64_t))v31;
  (*(void (**)(char *, uint64_t))(v35 + 8))(v29, v38);
  sub_1000067B8(v37, &qword_10006B2E0);
  uint64_t v41 = v57;
  uint64_t v40 = v58;
  char v42 = v55;
  (*(void (**)(char *, uint64_t, uint64_t))(v57 + 16))(v55, v30, v58);
  sub_10000DE48(v30, (uint64_t)v9);
  uint64_t v43 = swift_allocObject();
  sub_10000DEB0((uint64_t)v9, v43 + v46);
  sub_1000068B8(&qword_10006B300, &qword_10006B2E8);
  sub_10000F060(&qword_10006C130, (void (*)(uint64_t))&type metadata accessor for AXLTCaption);
  View.onChange<A>(of:initial:_:)();
  swift_release();
  (*(void (**)(char *, uint64_t))(v41 + 8))(v42, v40);
  return sub_1000067B8(v32, &qword_10006B2E8);
}

uint64_t sub_10000BDD8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v192 = a2;
  uint64_t v203 = sub_100006380(&qword_10006B320);
  uint64_t v3 = __chkstk_darwin(v203);
  v184 = (char *)&v172 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  v208 = (char *)&v172 - v5;
  uint64_t v6 = type metadata accessor for DynamicTypeSize();
  v195 = *(void **)(v6 - 8);
  uint64_t v196 = v6;
  uint64_t v7 = __chkstk_darwin(v6);
  v194 = (char *)&v172 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  v193 = (char *)&v172 - v9;
  uint64_t v204 = sub_100006380(&qword_10006B328);
  uint64_t v10 = __chkstk_darwin(v204);
  v182 = (char *)&v172 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  uint64_t v183 = (uint64_t)&v172 - v12;
  uint64_t v13 = sub_100006380(&qword_10006B330);
  uint64_t v186 = *(void *)(v13 - 8);
  uint64_t v187 = v13;
  __chkstk_darwin(v13);
  v185 = (char *)&v172 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v180 = sub_100006380(&qword_10006B338);
  uint64_t v15 = __chkstk_darwin(v180);
  uint64_t v191 = (uint64_t)&v172 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = __chkstk_darwin(v15);
  v205 = (char *)&v172 - v18;
  uint64_t v19 = __chkstk_darwin(v17);
  v189 = (char *)&v172 - v20;
  __chkstk_darwin(v19);
  v201 = (char *)&v172 - v21;
  uint64_t v22 = type metadata accessor for AXLTTitleView();
  uint64_t v173 = *(void *)(v22 - 8);
  uint64_t v23 = __chkstk_darwin(v22);
  uint64_t v175 = (uint64_t)&v172 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = __chkstk_darwin(v23);
  uint64_t v181 = (uint64_t)&v172 - v26;
  uint64_t v27 = __chkstk_darwin(v25);
  uint64_t v188 = (uint64_t)&v172 - v28;
  uint64_t v174 = v29;
  __chkstk_darwin(v27);
  uint64_t v176 = (uint64_t)&v172 - v30;
  uint64_t v200 = sub_100006380(&qword_10006B340);
  uint64_t v31 = __chkstk_darwin(v200);
  v177 = (char *)&v172 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v33 = __chkstk_darwin(v31);
  v178 = (char *)&v172 - v34;
  __chkstk_darwin(v33);
  v179 = (char *)&v172 - v35;
  uint64_t v197 = sub_100006380(&qword_10006B348);
  __chkstk_darwin(v197);
  uint64_t v199 = (uint64_t)&v172 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v37 = type metadata accessor for Image.ResizingMode();
  uint64_t v38 = *(void *)(v37 - 8);
  __chkstk_darwin(v37);
  uint64_t v40 = (char *)&v172 - ((v39 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v198 = sub_100006380(&qword_10006B350);
  uint64_t v41 = __chkstk_darwin(v198);
  uint64_t v43 = (char *)&v172 - ((v42 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v44 = __chkstk_darwin(v41);
  uint64_t v46 = (char *)&v172 - v45;
  __chkstk_darwin(v44);
  uint64_t v48 = (char *)&v172 - v47;
  uint64_t v49 = sub_100006380(&qword_10006B358);
  uint64_t v50 = __chkstk_darwin(v49 - 8);
  uint64_t v190 = (uint64_t)&v172 - ((v51 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v50);
  uint64_t v206 = (uint64_t)&v172 - v52;
  uint64_t v53 = a1;
  sub_10000D368(0, 0, 0, 0);
  uint64_t v207 = v22;
  uint64_t v202 = a1;
  if (!v54)
  {
    v179 = v46;
    uint64_t v61 = (uint64_t *)(a1 + *(int *)(v22 + 40));
    uint64_t v63 = *v61;
    uint64_t v62 = v61[1];
    uint64_t v231 = v63;
    uint64_t v232 = v62;
    sub_100006380(&qword_10006B308);
    State.wrappedValue.getter();
    Image.init(uiImage:)();
    (*(void (**)(char *, void, uint64_t))(v38 + 104))(v40, enum case for Image.ResizingMode.stretch(_:), v37);
    uint64_t v64 = Image.resizable(capInsets:resizingMode:)();
    swift_release();
    (*(void (**)(char *, uint64_t))(v38 + 8))(v40, v37);
    if (qword_10006AE20 == -1) {
      goto LABEL_6;
    }
    goto LABEL_37;
  }
  uint64_t v55 = Image.init(systemName:)();
  uint64_t v56 = AXLTCaption.text.getter();
  uint64_t v58 = v57;
  if (v56 == placeholderPausedText.getter() && v58 == v59)
  {
    swift_bridgeObjectRelease_n();
    uint64_t v60 = v176;
    sub_10000DE48(v53, v176);
LABEL_13:
    sub_10000F1D8(v60);
    goto LABEL_14;
  }
  char v71 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v60 = v176;
  sub_10000DE48(v53, v176);
  if (v71) {
    goto LABEL_13;
  }
  uint64_t v72 = AXLTCaption.placeholder.getter();
  uint64_t v74 = v73;
  if (v72 == placeholderPausedText.getter() && v74 == v75)
  {
    swift_bridgeObjectRelease_n();
    goto LABEL_13;
  }
  char v171 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_10000F1D8(v60);
  if ((v171 & 1) == 0)
  {
    uint64_t v76 = static Color.blue.getter();
    goto LABEL_15;
  }
LABEL_14:
  uint64_t v76 = static Color.gray.getter();
LABEL_15:
  uint64_t v77 = v76;
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v231 = v55;
  uint64_t v232 = 0;
  LOWORD(v233) = 1;
  uint64_t v234 = KeyPath;
  uint64_t v235 = v77;
  sub_100006380(&qword_10006B390);
  sub_10000EE84();
  uint64_t v79 = (uint64_t)v177;
  View.accessibility(identifier:)();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v80 = (uint64_t)v178;
  ModifiedContent<>.accessibility(hidden:)();
  sub_1000067B8(v79, &qword_10006B340);
  uint64_t v81 = (uint64_t)v179;
  sub_10000A940(v80, (uint64_t)v179, &qword_10006B340);
  sub_100006754(v81, v199, &qword_10006B340);
  swift_storeEnumTagMultiPayload();
  sub_10000EF44(&qword_10006B380, &qword_10006B340, (void (*)(void))sub_10000EE84);
  sub_10000EF44(&qword_10006B3B0, &qword_10006B350, (void (*)(void))sub_10000EDE8);
  _ConditionalContent<>.init(storage:)();
  sub_1000067B8(v81, &qword_10006B340);
  while (1)
  {
    uint64_t v231 = AXLTCaption.appName.getter();
    uint64_t v232 = v82;
    unint64_t v198 = sub_10000EFF4();
    uint64_t v83 = Text.init<A>(_:)();
    uint64_t v85 = v84;
    uint64_t v86 = v207;
    uint64_t v87 = (uint64_t *)(v53 + *(int *)(v207 + 32));
    uint64_t v89 = *v87;
    uint64_t v88 = v87[1];
    char v91 = v90 & 1;
    uint64_t v231 = v89;
    uint64_t v232 = v88;
    sub_100006380(&qword_10006B318);
    State.wrappedValue.getter();
    uint64_t v199 = Text.foregroundColor(_:)();
    uint64_t v200 = v92;
    uint64_t v94 = v93;
    char v96 = v95;
    swift_release();
    sub_10000F048(v83, v85, v91);
    swift_bridgeObjectRelease();
    uint64_t v97 = (uint64_t *)(v53 + *(int *)(v86 + 36));
    uint64_t v99 = *v97;
    uint64_t v98 = v97[1];
    uint64_t v231 = v99;
    uint64_t v232 = v98;
    sub_100006380(&qword_10006B3C0);
    State.wrappedValue.getter();
    uint64_t v100 = v199;
    uint64_t v48 = (char *)v200;
    uint64_t v101 = Text.font(_:)();
    uint64_t v103 = v102;
    uint64_t v64 = v104;
    uint64_t v106 = v105;
    swift_release();
    sub_10000F048(v100, v94, v96 & 1);
    swift_bridgeObjectRelease();
    uint64_t v107 = swift_getKeyPath();
    uint64_t v231 = v101;
    uint64_t v232 = v103;
    LOBYTE(v233) = v64 & 1;
    uint64_t v234 = v106;
    uint64_t v235 = 0x3FE999999999999ALL;
    uint64_t v236 = v107;
    uint64_t v237 = 1;
    LOBYTE(v238) = 0;
    long long v108 = v195;
    uint64_t v109 = v196;
    uint64_t v43 = (char *)v195[13];
    ((void (*)(char *, void, uint64_t))v43)(v193, enum case for DynamicTypeSize.xSmall(_:), v196);
    v110 = v194;
    ((void (*)(char *, void, uint64_t))v43)(v194, enum case for DynamicTypeSize.accessibility3(_:), v109);
    sub_10000F060((unint64_t *)&qword_10006B1A0, (void (*)(uint64_t))&type metadata accessor for DynamicTypeSize);
    if (dispatch thunk of static Comparable.<= infix(_:_:)()) {
      break;
    }
    __break(1u);
LABEL_37:
    swift_once();
LABEL_6:
    uint64_t v65 = self;
    uint64_t v66 = (uint64_t)v48;
    uint64_t v67 = (uint64_t)v43;
    if (qword_10006AE10 != -1) {
      swift_once();
    }
    id v68 = [v65 preferredFontForTextStyle:titleFontStyle];
    [v68 lineHeight];

    id v69 = [v65 preferredFontForTextStyle:titleFontStyle];
    [v69 lineHeight];

    static Alignment.center.getter();
    _FrameLayout.init(width:height:alignment:)();
    uint64_t v231 = v64;
    uint64_t v232 = 0;
    LOWORD(v233) = 1;
    uint64_t v234 = v239;
    LOBYTE(v235) = v240;
    uint64_t v236 = v241;
    LOBYTE(v237) = v242;
    long long v238 = v243;
    sub_100006380(&qword_10006B360);
    sub_10000EDE8();
    View.accessibility(identifier:)();
    swift_release();
    uint64_t v70 = (uint64_t)v179;
    ModifiedContent<>.accessibility(hidden:)();
    sub_1000067B8(v67, &qword_10006B350);
    sub_10000A940(v70, v66, &qword_10006B350);
    sub_100006754(v66, v199, &qword_10006B350);
    swift_storeEnumTagMultiPayload();
    sub_10000EF44(&qword_10006B380, &qword_10006B340, (void (*)(void))sub_10000EE84);
    sub_10000EF44(&qword_10006B3B0, &qword_10006B350, (void (*)(void))sub_10000EDE8);
    _ConditionalContent<>.init(storage:)();
    sub_1000067B8(v66, &qword_10006B350);
    uint64_t v53 = v202;
  }
  uint64_t v111 = v203;
  v112 = &v208[*(int *)(v203 + 48)];
  v113 = (void (*)(void))v108[4];
  v113();
  uint64_t v200 = (uint64_t)v112;
  ((void (*)(char *, char *, uint64_t))v113)(v112, v110, v109);
  uint64_t v114 = *(int *)(v111 + 48);
  v115 = v184;
  v116 = &v184[v114];
  v117 = (void (*)(char *, char *, uint64_t))v108[2];
  v117(v184, v208, v109);
  v117(v116, v112, v109);
  uint64_t v118 = (uint64_t)v182;
  ((void (*)(char *, char *, uint64_t))v113)(v182, v115, v109);
  v119 = (void (*)(char *, uint64_t))v108[1];
  v119(v116, v109);
  v120 = &v115[*(int *)(v203 + 48)];
  ((void (*)(char *, char *, uint64_t))v113)(v115, v208, v109);
  ((void (*)(char *, uint64_t, uint64_t))v113)(v120, v200, v109);
  ((void (*)(uint64_t, char *, uint64_t))v113)(v118 + *(int *)(v204 + 36), v120, v109);
  v119(v115, v109);
  uint64_t v121 = v183;
  sub_10000A940(v118, v183, &qword_10006B328);
  uint64_t v122 = sub_100006380(&qword_10006B3C8);
  unint64_t v123 = sub_10000F0A8();
  uint64_t v124 = sub_1000068B8(&qword_10006B3F8, &qword_10006B328);
  v125 = v185;
  uint64_t v126 = v204;
  View.dynamicTypeSize<A>(_:)();
  sub_1000067B8(v121, &qword_10006B328);
  sub_10000F048(v231, v232, v233);
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v231 = v122;
  uint64_t v232 = v126;
  unint64_t v233 = v123;
  uint64_t v234 = v124;
  swift_getOpaqueTypeConformance2();
  uint64_t v127 = v187;
  View.accessibility(identifier:)();
  (*(void (**)(char *, uint64_t))(v186 + 8))(v125, v127);
  uint64_t v128 = *(int *)(v207 + 20);
  uint64_t v129 = v202;
  if (*(unsigned char *)(v202 + v128) == 1)
  {
    uint64_t v131 = static AXLTUtilities.AXLTLocString(_:)();
    uint64_t v130 = (uint64_t)v201;
  }
  else
  {
    uint64_t v130 = (uint64_t)v201;
    if (*(unsigned char *)(v202 + v128))
    {
      uint64_t v131 = 0;
      unint64_t v132 = 0xE000000000000000;
    }
    else
    {
      uint64_t v131 = static AXLTUtilities.AXLTLocString(_:)();
    }
  }
  uint64_t v231 = v131;
  uint64_t v232 = v132;
  uint64_t v133 = Text.init<A>(_:)();
  uint64_t v135 = v134;
  char v137 = v136 & 1;
  uint64_t v138 = (uint64_t)v189;
  uint64_t v139 = (uint64_t)v205;
  ModifiedContent<>.accessibility(hint:)();
  sub_10000F048(v133, v135, v137);
  swift_bridgeObjectRelease();
  sub_1000067B8(v139, &qword_10006B338);
  sub_10000A940(v138, v130, &qword_10006B338);
  LODWORD(v139) = *(unsigned __int8 *)(v129 + v128);
  uint64_t v140 = v188;
  sub_10000DE48(v129, v188);
  if (v139 == 3)
  {
    sub_10000F1D8(v140);
    uint64_t v141 = v181;
    sub_10000DE48(v129, v181);
LABEL_25:
    sub_10000F1D8(v141);
LABEL_26:
    sub_10000F234((uint64_t)&v214);
    sub_10000A940((uint64_t)&v214, (uint64_t)&v231, &qword_10006B400);
    goto LABEL_27;
  }
  uint64_t v142 = v207;
  int v143 = *(unsigned __int8 *)(v140 + *(int *)(v207 + 20));
  sub_10000F1D8(v140);
  uint64_t v141 = v181;
  sub_10000DE48(v129, v181);
  if (v143 == 2) {
    goto LABEL_25;
  }
  uint64_t v151 = *(void *)(v141 + *(int *)(v142 + 24));
  sub_10000F1D8(v141);
  if (v151 <= 0) {
    goto LABEL_26;
  }
  uint64_t v152 = v175;
  sub_10000DE48(v129, v175);
  unint64_t v153 = (*(unsigned __int8 *)(v173 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v173 + 80);
  uint64_t v154 = swift_allocObject();
  sub_10000DEB0(v152, v154 + v153);
  sub_10000D64C();
  if (qword_10006AE20 != -1) {
    swift_once();
  }
  v155 = self;
  if (qword_10006AE10 != -1) {
    swift_once();
  }
  id v156 = [v155 preferredFontForTextStyle:titleFontStyle];
  [v156 lineHeight];

  static Alignment.center.getter();
  _FrameLayout.init(width:height:alignment:)();
  v208 = v244;
  char v157 = v245;
  uint64_t v158 = v246;
  char v159 = v247;
  uint64_t v160 = v248;
  uint64_t v161 = v249;
  char v162 = static Edge.Set.trailing.getter();
  EdgeInsets.init(_all:)();
  uint64_t v164 = v163;
  uint64_t v166 = v165;
  uint64_t v168 = v167;
  uint64_t v170 = v169;
  v213[0] = 1;
  v212[0] = 0;
  char v211 = v157;
  char v210 = v159;
  char v209 = 0;
  sub_10000F284();
  sub_10000F31C();
  uint64_t v214 = 0;
  char v215 = 1;
  v216 = sub_10000F4D8;
  uint64_t v217 = v154;
  char v218 = 0;
  v219 = v208;
  char v220 = v157;
  uint64_t v221 = v158;
  char v222 = v159;
  uint64_t v223 = v160;
  uint64_t v224 = v161;
  char v225 = v162;
  uint64_t v226 = v164;
  uint64_t v227 = v166;
  uint64_t v228 = v168;
  uint64_t v229 = v170;
  char v230 = 0;
  nullsub_1(&v214);
  sub_10000A940((uint64_t)&v214, (uint64_t)&v231, &qword_10006B400);
  uint64_t v130 = (uint64_t)v201;
LABEL_27:
  uint64_t v144 = v206;
  uint64_t v145 = v190;
  sub_100006754(v206, v190, &qword_10006B358);
  uint64_t v146 = v191;
  sub_100006754(v130, v191, &qword_10006B338);
  sub_10000A940((uint64_t)&v231, (uint64_t)v212, &qword_10006B400);
  uint64_t v147 = v192;
  sub_100006754(v145, v192, &qword_10006B358);
  uint64_t v148 = sub_100006380(&qword_10006B408);
  sub_100006754(v146, v147 + *(int *)(v148 + 48), &qword_10006B338);
  uint64_t v149 = v147 + *(int *)(v148 + 64);
  sub_10000A940((uint64_t)v212, (uint64_t)v213, &qword_10006B400);
  sub_10000A940((uint64_t)v213, v149, &qword_10006B400);
  sub_10000F28C((uint64_t)v213, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, char))sub_10000F260);
  sub_1000067B8(v130, &qword_10006B338);
  sub_1000067B8(v144, &qword_10006B358);
  sub_10000A940((uint64_t)v212, (uint64_t)&v214, &qword_10006B400);
  sub_10000F28C((uint64_t)&v214, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, char))sub_10000F2F8);
  sub_1000067B8(v146, &qword_10006B338);
  return sub_1000067B8(v145, &qword_10006B358);
}

unint64_t sub_10000D368(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = AXLTCaption.appID.getter();
  uint64_t v10 = v9;
  if (a2)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    uint64_t v10 = a2;
  }
  else
  {
    a1 = v8;
  }
  uint64_t v11 = AXLTCaption.appName.getter();
  uint64_t v13 = v12;
  if (a4)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    uint64_t v13 = a4;
  }
  else
  {
    a3 = v11;
  }
  if (a1 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v10 == v14) {
    goto LABEL_14;
  }
  char v16 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  if (v16)
  {
LABEL_15:
    swift_bridgeObjectRelease();
    unint64_t v18 = 0x6C6C69662E63696DLL;
    goto LABEL_16;
  }
  if (a3 == placeholderMicName.getter() && v13 == v17)
  {
LABEL_14:
    swift_bridgeObjectRelease();
    goto LABEL_15;
  }
  char v20 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  if (v20) {
    goto LABEL_15;
  }
  if (a1 == placeholderID.getter() && v10 == v21)
  {
    swift_bridgeObjectRelease();
    goto LABEL_22;
  }
  char v22 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  if (v22)
  {
LABEL_22:
    swift_bridgeObjectRelease();
    if (AXDeviceIsPad()) {
      unint64_t v18 = 1684107369;
    }
    else {
      unint64_t v18 = 0x656E6F687069;
    }
    goto LABEL_16;
  }
  if (a1 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v10 == v23)
  {
    swift_bridgeObjectRelease();
LABEL_29:
    swift_bridgeObjectRelease();
    unint64_t v18 = 0xD00000000000001ALL;
    goto LABEL_16;
  }
  char v24 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  if (v24) {
    goto LABEL_29;
  }
  unint64_t v18 = 0x6F63706F7470616CLL;
  if (a1 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v10 == v25)
  {
    swift_bridgeObjectRelease_n();
  }
  else
  {
    char v26 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v26 & 1) == 0) {
      unint64_t v18 = 0;
    }
  }
LABEL_16:
  swift_bridgeObjectRelease();
  return v18;
}

uint64_t sub_10000D64C()
{
  type metadata accessor for AXLTTitleView();
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  uint64_t result = swift_release();
  if (__OFSUB__(v1, 1))
  {
    __break(1u);
  }
  else
  {
    swift_getKeyPath();
    swift_getKeyPath();
    static Published.subscript.getter();
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_10000D7D8(uint64_t a1)
{
  uint64_t v2 = sub_100006380(&qword_10006B198);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)v17 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000D368(0, 0, 0, 0);
  uint64_t v6 = v5;
  uint64_t result = swift_bridgeObjectRelease();
  if (!v6)
  {
    uint64_t v8 = AXLTCaption.appID.getter();
    uint64_t v10 = v9;
    uint64_t v11 = type metadata accessor for AXLTTitleView();
    sub_10000E37C(&qword_10006B218, (uint64_t (*)(void))&type metadata accessor for DynamicTypeSize, 0x5463696D616E7944, 0xEF657A6953657079, (uint64_t)v4);
    uint64_t v12 = type metadata accessor for DynamicTypeSize();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v4, 0, 1, v12);
    id v13 = iconForBundleId(_:dynamicTypeSize:)(v8, v10, (uint64_t)v4);
    swift_bridgeObjectRelease();
    sub_1000067B8((uint64_t)v4, &qword_10006B198);
    if (!v13) {
      id v13 = [objc_allocWithZone((Class)UIImage) init];
    }
    uint64_t v14 = (uint64_t *)(a1 + *(int *)(v11 + 40));
    uint64_t v16 = *v14;
    uint64_t v15 = v14[1];
    v17[2] = v16;
    v17[3] = v15;
    v17[1] = v13;
    sub_100006380(&qword_10006B308);
    return State.wrappedValue.setter();
  }
  return result;
}

uint64_t sub_10000D9A4(uint64_t a1, uint64_t a2)
{
  uint64_t result = Notification.userInfo.getter();
  if (result)
  {
    uint64_t v4 = result;
    uint64_t v10 = notificationValueKey.getter();
    AnyHashable.init<A>(_:)();
    if (*(void *)(v4 + 16) && (unint64_t v5 = sub_1000486C0((uint64_t)v11), (v6 & 1) != 0))
    {
      sub_10000E914(*(void *)(v4 + 56) + 32 * v5, (uint64_t)&v12);
    }
    else
    {
      long long v12 = 0u;
      long long v13 = 0u;
    }
    swift_bridgeObjectRelease();
    sub_10000ED94((uint64_t)v11);
    if (*((void *)&v13 + 1))
    {
      uint64_t result = swift_dynamicCast();
      if (result)
      {
        uint64_t v7 = (uint64_t *)(a2 + *(int *)(type metadata accessor for AXLTTitleView() + 32));
        uint64_t v9 = *v7;
        uint64_t v8 = v7[1];
        v11[0] = v9;
        v11[1] = v8;
        *(void *)&long long v12 = v10;
        sub_100006380(&qword_10006B318);
        return State.wrappedValue.setter();
      }
    }
    else
    {
      return sub_1000067B8((uint64_t)&v12, &qword_10006C150);
    }
  }
  return result;
}

uint64_t sub_10000DAC0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = sub_100006380(&qword_10006B198);
  __chkstk_darwin(v4 - 8);
  char v6 = (char *)v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = AXLTCaption.appID.getter();
  uint64_t v9 = v8;
  uint64_t v10 = AXLTCaption.appName.getter();
  sub_10000D368(v7, v9, v10, v11);
  uint64_t v13 = v12;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  if (!v13)
  {
    uint64_t v15 = AXLTCaption.appID.getter();
    uint64_t v17 = v16;
    uint64_t v18 = type metadata accessor for AXLTTitleView();
    sub_10000E37C(&qword_10006B218, (uint64_t (*)(void))&type metadata accessor for DynamicTypeSize, 0x5463696D616E7944, 0xEF657A6953657079, (uint64_t)v6);
    uint64_t v19 = type metadata accessor for DynamicTypeSize();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v6, 0, 1, v19);
    id v20 = iconForBundleId(_:dynamicTypeSize:)(v15, v17, (uint64_t)v6);
    swift_bridgeObjectRelease();
    sub_1000067B8((uint64_t)v6, &qword_10006B198);
    if (!v20) {
      id v20 = [objc_allocWithZone((Class)UIImage) init];
    }
    uint64_t v21 = (uint64_t *)(a3 + *(int *)(v18 + 40));
    uint64_t v23 = *v21;
    uint64_t v22 = v21[1];
    v24[2] = v23;
    v24[3] = v22;
    v24[1] = v20;
    sub_100006380(&qword_10006B308);
    return State.wrappedValue.setter();
  }
  return result;
}

uint64_t sub_10000DCC0@<X0>(uint64_t a1@<X0>, char a2@<W1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v8 = type metadata accessor for AXLTCaption();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 32))(a4, a1, v8);
  uint64_t v9 = (int *)type metadata accessor for AXLTTitleView();
  *(unsigned char *)(a4 + v9[5]) = a2;
  *(void *)(a4 + v9[6]) = a3;
  uint64_t v10 = (uint64_t *)(a4 + v9[7]);
  *uint64_t v10 = swift_getKeyPath();
  sub_100006380(&qword_10006B218);
  swift_storeEnumTagMultiPayload();
  uint64_t v11 = (void *)(a4 + v9[8]);
  State.init(wrappedValue:)();
  *uint64_t v11 = v16;
  v11[1] = v17;
  uint64_t v12 = (void *)(a4 + v9[9]);
  State.init(wrappedValue:)();
  *uint64_t v12 = v16;
  v12[1] = v17;
  uint64_t v13 = (void *)(a4 + v9[10]);
  sub_10000F5B8();
  State.init(wrappedValue:)();
  void *v13 = v16;
  v13[1] = v17;
  uint64_t v14 = v9[11];
  type metadata accessor for AudioHistogramConfig();
  swift_allocObject();
  uint64_t result = sub_10004DFE0();
  *(void *)(a4 + v14) = result;
  return result;
}

uint64_t sub_10000DE48(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for AXLTTitleView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000DEB0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for AXLTTitleView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000DF14()
{
  uint64_t v1 = *(void *)(type metadata accessor for AXLTTitleView() - 8);
  uint64_t v2 = v0 + ((*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80));

  return sub_10000D7D8(v2);
}

uint64_t sub_10000DF78(uint64_t a1)
{
  uint64_t v3 = *(void *)(type metadata accessor for AXLTTitleView() - 8);
  uint64_t v4 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));

  return sub_10000D9A4(a1, v4);
}

uint64_t sub_10000DFEC(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *(void *)(type metadata accessor for AXLTTitleView() - 8);
  uint64_t v6 = v2 + ((*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));

  return sub_10000DAC0(a1, a2, v6);
}

uint64_t sub_10000E06C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for EnvironmentValues();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100006380(&qword_10006B088);
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100006754(v2, (uint64_t)v10, &qword_10006B088);
  if (swift_getEnumCaseMultiPayload() == 1) {
    return sub_10000A940((uint64_t)v10, a1, &qword_10006B038);
  }
  os_log_type_t v12 = static os_log_type_t.fault.getter();
  uint64_t v13 = static Log.runtimeIssuesLog.getter();
  os_log_type_t v14 = v12;
  if (os_log_type_enabled(v13, v12))
  {
    uint64_t v15 = (uint8_t *)swift_slowAlloc();
    uint64_t v16 = swift_slowAlloc();
    v17[1] = a1;
    uint64_t v18 = v16;
    *(_DWORD *)uint64_t v15 = 136315138;
    v17[2] = sub_10000E634(0xD000000000000020, 0x80000001000557D0, &v18);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v13, v14, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v15, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  EnvironmentValues.init()();
  swift_getAtKeyPath();
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t sub_10000E2FC@<X0>(uint64_t a1@<X8>)
{
  return sub_10000E37C(&qword_10006B218, (uint64_t (*)(void))&type metadata accessor for DynamicTypeSize, 0x5463696D616E7944, 0xEF657A6953657079, a1);
}

uint64_t sub_10000E33C@<X0>(uint64_t a1@<X8>)
{
  return sub_10000E37C(&qword_10006B418, (uint64_t (*)(void))&type metadata accessor for LayoutDirection, 0x694474756F79614CLL, 0xEF6E6F6974636572, a1);
}

uint64_t sub_10000E37C@<X0>(uint64_t *a1@<X0>, uint64_t (*a2)(void)@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v27 = a3;
  uint64_t v9 = v5;
  uint64_t v11 = type metadata accessor for EnvironmentValues();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  os_log_type_t v14 = (char *)&v24 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_100006380(a1);
  __chkstk_darwin(v15);
  uint64_t v17 = (char *)&v24 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100006754(v9, (uint64_t)v17, a1);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v18 = a2(0);
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(void *)(v18 - 8) + 32))(a5, v17, v18);
  }
  else
  {
    os_log_type_t v20 = static os_log_type_t.fault.getter();
    uint64_t v21 = static Log.runtimeIssuesLog.getter();
    if (os_log_type_enabled(v21, v20))
    {
      unint64_t v25 = a4;
      uint64_t v22 = swift_slowAlloc();
      uint64_t v26 = a5;
      uint64_t v23 = (uint8_t *)v22;
      uint64_t v29 = swift_slowAlloc();
      *(_DWORD *)uint64_t v23 = 136315138;
      uint64_t v28 = sub_10000E634(v27, v25, &v29);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl((void *)&_mh_execute_header, v21, v20, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v23, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    EnvironmentValues.init()();
    swift_getAtKeyPath();
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  }
}

uint64_t sub_10000E634(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_10000E708(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_10000E914((uint64_t)v12, *a3);
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
      sub_10000E914((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_10000E8C4((uint64_t)v12);
  return v7;
}

uint64_t sub_10000E708(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            UnsafeMutableRawBufferPointer.subscript.setter();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_10000E970(a5, a6);
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
  uint64_t v8 = _StringObject.sharedUTF8.getter();
  if (!v8)
  {
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
LABEL_17:
    uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
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

uint64_t sub_10000E8C4(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_10000E914(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_10000E970(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_10000EA08(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_10000EBE8(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_10000EBE8(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_10000EA08(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_10000EB80(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = _StringGuts.copyUTF8(into:)();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
LABEL_10:
      uint64_t v2 = String.UTF8View._foreignCount()();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    _fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_10000EB80(uint64_t a1, uint64_t a2)
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
  sub_100006380(&qword_10006B310);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_10000EBE8(char a1, int64_t a2, char a3, char *a4)
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
    sub_100006380(&qword_10006B310);
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
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_10000ED3C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = EnvironmentValues.foregroundColor.getter();
  *a1 = result;
  return result;
}

uint64_t sub_10000ED68()
{
  return EnvironmentValues.foregroundColor.setter();
}

uint64_t sub_10000ED94(uint64_t a1)
{
  return a1;
}

unint64_t sub_10000EDE8()
{
  unint64_t result = qword_10006B368;
  if (!qword_10006B368)
  {
    sub_10000646C(&qword_10006B360);
    sub_10000F168(&qword_10006B370, &qword_10006B378);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006B368);
  }
  return result;
}

unint64_t sub_10000EE84()
{
  unint64_t result = qword_10006B388;
  if (!qword_10006B388)
  {
    sub_10000646C(&qword_10006B390);
    sub_10000F168(&qword_10006B370, &qword_10006B378);
    sub_1000068B8(&qword_10006B398, &qword_10006B3A0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006B388);
  }
  return result;
}

uint64_t sub_10000EF44(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10000646C(a2);
    a3();
    sub_10000F060(&qword_10006B3A8, (void (*)(uint64_t))&type metadata accessor for AccessibilityAttachmentModifier);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_10000EFF4()
{
  unint64_t result = qword_10006B3B8;
  if (!qword_10006B3B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006B3B8);
  }
  return result;
}

uint64_t sub_10000F048(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_10000F060(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_10000F0A8()
{
  unint64_t result = qword_10006B3D0;
  if (!qword_10006B3D0)
  {
    sub_10000646C(&qword_10006B3C8);
    sub_10000F168(&qword_10006B3D8, &qword_10006B3E0);
    sub_1000068B8(&qword_10006B3E8, &qword_10006B3F0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006B3D0);
  }
  return result;
}

uint64_t sub_10000F168(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10000646C(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10000F1D8(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for AXLTTitleView();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

double sub_10000F234(uint64_t a1)
{
  double result = 0.0;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(void *)(a1 + 32) = 255;
  *(_OWORD *)(a1 + 40) = 0u;
  *(_OWORD *)(a1 + 56) = 0u;
  *(_OWORD *)(a1 + 72) = 0u;
  *(_OWORD *)(a1 + 88) = 0u;
  *(_OWORD *)(a1 + 104) = 0u;
  *(_OWORD *)(a1 + 113) = 0u;
  return result;
}

uint64_t sub_10000F260(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  if (a5 != -1) {
    return sub_10000F284();
  }
  return result;
}

uint64_t sub_10000F284()
{
  return swift_retain();
}

uint64_t sub_10000F28C(uint64_t a1, void (*a2)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, char))
{
  char v4 = *(unsigned char *)(a1 + 128);
  a2(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 72), *(void *)(a1 + 80), *(void *)(a1 + 88), *(void *)(a1 + 96), *(void *)(a1 + 104), *(void *)(a1 + 112), *(void *)(a1 + 120), v4);
  return a1;
}

uint64_t sub_10000F2F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  if (a5 != -1) {
    return sub_10000F31C();
  }
  return result;
}

uint64_t sub_10000F31C()
{
  return swift_release();
}

uint64_t sub_10000F328()
{
  uint64_t v1 = type metadata accessor for AXLTTitleView();
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*(void *)(v1 - 8) + 64);
  uint64_t v5 = type metadata accessor for AXLTCaption();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v0 + v3, v5);
  uint64_t v6 = v0 + v3 + *(int *)(v1 + 28);
  sub_100006380(&qword_10006B218);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = type metadata accessor for DynamicTypeSize();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  }
  else
  {
    swift_release();
  }
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  swift_release();
  swift_release();

  return _swift_deallocObject(v0, v3 + v4, v2 | 7);
}

uint64_t sub_10000F4D8()
{
  type metadata accessor for AXLTTitleView();

  return swift_retain();
}

uint64_t sub_10000F540@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = EnvironmentValues.foregroundColor.getter();
  *a1 = result;
  return result;
}

uint64_t sub_10000F56C()
{
  return EnvironmentValues.foregroundColor.setter();
}

unint64_t sub_10000F5B8()
{
  unint64_t result = qword_10006B410;
  if (!qword_10006B410)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10006B410);
  }
  return result;
}

uint64_t sub_10000F5F8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t WindowState.rawValue.getter(uint64_t result)
{
  return result;
}

BOOL sub_10000F6D4(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

Swift::Int sub_10000F6E8()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void sub_10000F730()
{
  Hasher._combine(_:)(*v0);
}

Swift::Int sub_10000F75C()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

unint64_t sub_10000F7A0@<X0>(unint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  unint64_t result = _s19LiveTranscriptionUI11WindowStateO8rawValueACSgSi_tcfC_0(*a1);
  *a2 = result;
  return result;
}

void sub_10000F7CC(void *a1@<X8>)
{
  *a1 = *v1;
}

NSString sub_10000F7D8()
{
  NSString result = String._bridgeToObjectiveC()();
  qword_10006DFA8 = (uint64_t)result;
  return result;
}

uint64_t sub_10000F810()
{
  uint64_t result = AXDeviceIsPad();
  double v1 = 500.0;
  if (result) {
    double v1 = 1000.0;
  }
  qword_10006DFB0 = *(void *)&v1;
  return result;
}

uint64_t sub_10000F850()
{
  uint64_t result = AXDeviceHasJindo();
  double v1 = 0.0;
  if (result) {
    double v1 = 10.0;
  }
  qword_10006DFB8 = *(void *)&v1;
  return result;
}

uint64_t sub_10000F880()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for RootView();
  uint64_t v3 = __chkstk_darwin(v2);
  uint64_t v118 = &v92[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = __chkstk_darwin(v3);
  v119 = &v92[-v6];
  __chkstk_darwin(v5);
  v110 = &v92[-v7];
  uint64_t v8 = type metadata accessor for UserInterfaceSizeClass();
  int64_t v9 = *(void **)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v103 = &v92[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v11 = sub_100006380(&qword_10006B058);
  uint64_t v12 = __chkstk_darwin(v11);
  uint64_t v98 = &v92[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v14 = __chkstk_darwin(v12);
  uint64_t v105 = &v92[-v15];
  uint64_t v16 = __chkstk_darwin(v14);
  uint64_t v102 = &v92[-v17];
  __chkstk_darwin(v16);
  uint64_t v19 = &v92[-v18];
  uint64_t v20 = sub_100006380(&qword_10006B038);
  uint64_t v21 = __chkstk_darwin(v20 - 8);
  char v96 = &v92[-((v22 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v23 = __chkstk_darwin(v21);
  uint64_t v107 = &v92[-v24];
  uint64_t v25 = __chkstk_darwin(v23);
  uint64_t v97 = &v92[-v26];
  uint64_t v27 = __chkstk_darwin(v25);
  uint64_t v99 = &v92[-v28];
  uint64_t v29 = __chkstk_darwin(v27);
  uint64_t v109 = &v92[-v30];
  uint64_t v31 = __chkstk_darwin(v29);
  uint64_t v104 = &v92[-v32];
  uint64_t v33 = __chkstk_darwin(v31);
  char v95 = &v92[-v34];
  uint64_t v35 = __chkstk_darwin(v33);
  uint64_t v100 = &v92[-v36];
  uint64_t v37 = __chkstk_darwin(v35);
  uint64_t v101 = &v92[-v38];
  uint64_t v39 = __chkstk_darwin(v37);
  uint64_t v41 = &v92[-v40];
  uint64_t v42 = __chkstk_darwin(v39);
  uint64_t v44 = &v92[-v43];
  __chkstk_darwin(v42);
  uint64_t v46 = &v92[-v45];
  uint64_t v117 = v2;
  uint64_t v111 = v1;
  sub_10000E06C((uint64_t)&v92[-v45]);
  uint64_t v47 = (void (*)(void))v9[13];
  unsigned int v106 = enum case for UserInterfaceSizeClass.regular(_:);
  uint64_t v114 = (void (*)(unsigned char *, void, uint64_t))v47;
  v115 = v9 + 13;
  v47(v44);
  v112 = (void (*)(unsigned char *, void, uint64_t, uint64_t))v9[7];
  v113 = v9 + 7;
  v112(v44, 0, 1, v8);
  uint64_t v116 = v11;
  uint64_t v48 = (uint64_t)&v19[*(int *)(v11 + 48)];
  sub_100006754((uint64_t)v46, (uint64_t)v19, &qword_10006B038);
  sub_100006754((uint64_t)v44, v48, &qword_10006B038);
  long long v108 = v9;
  uint64_t v49 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v9[6];
  if (v49((uint64_t)v19, 1, v8) == 1)
  {
    sub_1000067B8((uint64_t)v44, &qword_10006B038);
    sub_1000067B8((uint64_t)v46, &qword_10006B038);
    int v50 = v49(v48, 1, v8);
    uint64_t v51 = v109;
    if (v50 == 1)
    {
      sub_1000067B8((uint64_t)v19, &qword_10006B038);
      sub_10001D74C(v111, (uint64_t)v110, (uint64_t (*)(void))type metadata accessor for RootView);
      uint64_t v52 = (uint64_t)v105;
      goto LABEL_8;
    }
    goto LABEL_6;
  }
  sub_100006754((uint64_t)v19, (uint64_t)v41, &qword_10006B038);
  if (v49(v48, 1, v8) == 1)
  {
    sub_1000067B8((uint64_t)v44, &qword_10006B038);
    sub_1000067B8((uint64_t)v46, &qword_10006B038);
    ((void (*)(unsigned char *, uint64_t))v108[1])(v41, v8);
    uint64_t v51 = v109;
LABEL_6:
    sub_1000067B8((uint64_t)v19, &qword_10006B058);
    uint64_t v53 = v110;
    uint64_t v54 = v111;
    sub_10001D74C(v111, (uint64_t)v110, (uint64_t (*)(void))type metadata accessor for RootView);
    uint64_t v55 = (uint64_t)v107;
    uint64_t v52 = (uint64_t)v105;
LABEL_11:
    sub_10001D7B4((uint64_t)v53, (uint64_t (*)(void))type metadata accessor for RootView);
LABEL_15:
    sub_10001D74C(v54, (uint64_t)v119, (uint64_t (*)(void))type metadata accessor for RootView);
    goto LABEL_16;
  }
  uint64_t v56 = v108;
  uint64_t v57 = (void (*)(unsigned char *, uint64_t, uint64_t))v108[4];
  uint64_t v94 = v49;
  uint64_t v58 = v103;
  v57(v103, v48, v8);
  sub_10001D6E8((unint64_t *)&qword_10006B068, (void (*)(uint64_t))&type metadata accessor for UserInterfaceSizeClass);
  int v93 = dispatch thunk of static Equatable.== infix(_:_:)();
  uint64_t v59 = (void (*)(unsigned char *, uint64_t))v56[1];
  uint64_t v60 = v58;
  uint64_t v49 = v94;
  v59(v60, v8);
  sub_1000067B8((uint64_t)v44, &qword_10006B038);
  sub_1000067B8((uint64_t)v46, &qword_10006B038);
  v59(v41, v8);
  sub_1000067B8((uint64_t)v19, &qword_10006B038);
  uint64_t v53 = v110;
  uint64_t v54 = v111;
  sub_10001D74C(v111, (uint64_t)v110, (uint64_t (*)(void))type metadata accessor for RootView);
  uint64_t v55 = (uint64_t)v107;
  uint64_t v52 = (uint64_t)v105;
  uint64_t v51 = v109;
  if ((v93 & 1) == 0) {
    goto LABEL_11;
  }
LABEL_8:
  uint64_t v61 = v101;
  sub_10000E06C((uint64_t)v101);
  uint64_t v62 = v100;
  v114(v100, enum case for UserInterfaceSizeClass.compact(_:), v8);
  v112(v62, 0, 1, v8);
  uint64_t v63 = v102;
  uint64_t v64 = (uint64_t)&v102[*(int *)(v116 + 48)];
  sub_100006754((uint64_t)v61, (uint64_t)v102, &qword_10006B038);
  sub_100006754((uint64_t)v62, v64, &qword_10006B038);
  if (v49((uint64_t)v63, 1, v8) == 1)
  {
    sub_1000067B8((uint64_t)v62, &qword_10006B038);
    uint64_t v63 = v102;
    sub_1000067B8((uint64_t)v61, &qword_10006B038);
    sub_10001D7B4((uint64_t)v110, (uint64_t (*)(void))type metadata accessor for RootView);
    if (v49(v64, 1, v8) == 1)
    {
      sub_1000067B8((uint64_t)v63, &qword_10006B038);
      sub_10001D74C(v111, (uint64_t)v119, (uint64_t (*)(void))type metadata accessor for RootView);
LABEL_33:
      sub_10001D7B4((uint64_t)v119, (uint64_t (*)(void))type metadata accessor for RootView);
      char v78 = 1;
      return v78 & 1;
    }
    goto LABEL_14;
  }
  uint64_t v65 = v95;
  sub_100006754((uint64_t)v63, (uint64_t)v95, &qword_10006B038);
  if (v49(v64, 1, v8) == 1)
  {
    sub_1000067B8((uint64_t)v100, &qword_10006B038);
    sub_1000067B8((uint64_t)v101, &qword_10006B038);
    sub_10001D7B4((uint64_t)v110, (uint64_t (*)(void))type metadata accessor for RootView);
    ((void (*)(unsigned char *, uint64_t))v108[1])(v65, v8);
LABEL_14:
    sub_1000067B8((uint64_t)v63, &qword_10006B058);
    uint64_t v55 = (uint64_t)v107;
    uint64_t v54 = v111;
    goto LABEL_15;
  }
  uint64_t v81 = v108;
  uint64_t v82 = (void (*)(unsigned char *, uint64_t, uint64_t))v108[4];
  uint64_t v94 = v49;
  uint64_t v83 = v103;
  v82(v103, v64, v8);
  sub_10001D6E8((unint64_t *)&qword_10006B068, (void (*)(uint64_t))&type metadata accessor for UserInterfaceSizeClass);
  char v84 = dispatch thunk of static Equatable.== infix(_:_:)();
  uint64_t v85 = v65;
  uint64_t v86 = (void (*)(unsigned char *, uint64_t))v81[1];
  uint64_t v87 = v83;
  uint64_t v49 = v94;
  v86(v87, v8);
  sub_1000067B8((uint64_t)v100, &qword_10006B038);
  sub_1000067B8((uint64_t)v101, &qword_10006B038);
  sub_10001D7B4((uint64_t)v110, (uint64_t (*)(void))type metadata accessor for RootView);
  v86(v85, v8);
  uint64_t v51 = v109;
  uint64_t v55 = (uint64_t)v107;
  sub_1000067B8((uint64_t)v63, &qword_10006B038);
  sub_10001D74C(v111, (uint64_t)v119, (uint64_t (*)(void))type metadata accessor for RootView);
  if (v84) {
    goto LABEL_33;
  }
LABEL_16:
  uint64_t v66 = v104;
  sub_10000E06C((uint64_t)v104);
  v114(v51, v106, v8);
  v112(v51, 0, 1, v8);
  uint64_t v67 = v52 + *(int *)(v116 + 48);
  sub_100006754((uint64_t)v66, v52, &qword_10006B038);
  sub_100006754((uint64_t)v51, v67, &qword_10006B038);
  if (v49(v52, 1, v8) == 1)
  {
    sub_1000067B8((uint64_t)v51, &qword_10006B038);
    sub_1000067B8((uint64_t)v66, &qword_10006B038);
    if (v49(v67, 1, v8) == 1)
    {
      sub_1000067B8(v52, &qword_10006B038);
      sub_10001D74C((uint64_t)v119, (uint64_t)v118, (uint64_t (*)(void))type metadata accessor for RootView);
      goto LABEL_24;
    }
    goto LABEL_21;
  }
  id v68 = v99;
  sub_100006754(v52, (uint64_t)v99, &qword_10006B038);
  if (v49(v67, 1, v8) == 1)
  {
    sub_1000067B8((uint64_t)v51, &qword_10006B038);
    sub_1000067B8((uint64_t)v66, &qword_10006B038);
    ((void (*)(unsigned char *, uint64_t))v108[1])(v68, v8);
LABEL_21:
    sub_1000067B8(v52, &qword_10006B058);
    sub_10001D74C((uint64_t)v119, (uint64_t)v118, (uint64_t (*)(void))type metadata accessor for RootView);
LABEL_22:
    sub_10001D7B4((uint64_t)v118, (uint64_t (*)(void))type metadata accessor for RootView);
    sub_10001D7B4((uint64_t)v119, (uint64_t (*)(void))type metadata accessor for RootView);
LABEL_30:
    char v78 = 0;
    return v78 & 1;
  }
  id v69 = v108;
  uint64_t v70 = v103;
  ((void (*)(unsigned char *, uint64_t, uint64_t))v108[4])(v103, v67, v8);
  sub_10001D6E8((unint64_t *)&qword_10006B068, (void (*)(uint64_t))&type metadata accessor for UserInterfaceSizeClass);
  LODWORD(v111) = dispatch thunk of static Equatable.== infix(_:_:)();
  char v71 = v49;
  uint64_t v72 = (void (*)(unsigned char *, uint64_t))v69[1];
  uint64_t v73 = v70;
  uint64_t v55 = (uint64_t)v107;
  v72(v73, v8);
  sub_1000067B8((uint64_t)v109, &qword_10006B038);
  sub_1000067B8((uint64_t)v66, &qword_10006B038);
  v72(v68, v8);
  uint64_t v49 = v71;
  uint64_t v74 = v118;
  sub_1000067B8(v52, &qword_10006B038);
  sub_10001D74C((uint64_t)v119, (uint64_t)v74, (uint64_t (*)(void))type metadata accessor for RootView);
  if ((v111 & 1) == 0) {
    goto LABEL_22;
  }
LABEL_24:
  uint64_t v75 = v97;
  sub_10000E06C((uint64_t)v97);
  v114((unsigned char *)v55, v106, v8);
  v112((unsigned char *)v55, 0, 1, v8);
  uint64_t v76 = v98;
  uint64_t v77 = (uint64_t)&v98[*(int *)(v116 + 48)];
  sub_100006754((uint64_t)v75, (uint64_t)v98, &qword_10006B038);
  sub_100006754(v55, v77, &qword_10006B038);
  if (v49((uint64_t)v76, 1, v8) != 1)
  {
    sub_100006754((uint64_t)v76, (uint64_t)v96, &qword_10006B038);
    uint64_t v79 = (uint64_t)v75;
    if (v49(v77, 1, v8) != 1)
    {
      uint64_t v88 = v108;
      uint64_t v89 = v103;
      ((void (*)(unsigned char *, uint64_t, uint64_t))v108[4])(v103, v77, v8);
      sub_10001D6E8((unint64_t *)&qword_10006B068, (void (*)(uint64_t))&type metadata accessor for UserInterfaceSizeClass);
      char v90 = v96;
      char v78 = dispatch thunk of static Equatable.== infix(_:_:)();
      char v91 = (void (*)(unsigned char *, uint64_t))v88[1];
      v91(v89, v8);
      sub_1000067B8(v55, &qword_10006B038);
      sub_1000067B8(v79, &qword_10006B038);
      sub_10001D7B4((uint64_t)v118, (uint64_t (*)(void))type metadata accessor for RootView);
      sub_10001D7B4((uint64_t)v119, (uint64_t (*)(void))type metadata accessor for RootView);
      v91(v90, v8);
      sub_1000067B8((uint64_t)v76, &qword_10006B038);
      return v78 & 1;
    }
    sub_1000067B8(v55, &qword_10006B038);
    sub_1000067B8((uint64_t)v75, &qword_10006B038);
    sub_10001D7B4((uint64_t)v118, (uint64_t (*)(void))type metadata accessor for RootView);
    sub_10001D7B4((uint64_t)v119, (uint64_t (*)(void))type metadata accessor for RootView);
    ((void (*)(unsigned char *, uint64_t))v108[1])(v96, v8);
    goto LABEL_29;
  }
  sub_1000067B8(v55, &qword_10006B038);
  sub_1000067B8((uint64_t)v75, &qword_10006B038);
  sub_10001D7B4((uint64_t)v118, (uint64_t (*)(void))type metadata accessor for RootView);
  sub_10001D7B4((uint64_t)v119, (uint64_t (*)(void))type metadata accessor for RootView);
  if (v49(v77, 1, v8) != 1)
  {
LABEL_29:
    sub_1000067B8((uint64_t)v76, &qword_10006B058);
    goto LABEL_30;
  }
  sub_1000067B8((uint64_t)v76, &qword_10006B038);
  char v78 = 1;
  return v78 & 1;
}

uint64_t sub_1000108F8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v209 = a2;
  uint64_t v213 = a1;
  uint64_t v197 = a3;
  uint64_t v196 = sub_100006380(&qword_10006B538);
  uint64_t v195 = *(void *)(v196 - 8);
  __chkstk_darwin(v196);
  v194 = (char *)&v151 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v187 = (uint64_t (*)(void))type metadata accessor for Color.RGBColorSpace();
  uint64_t v186 = *((void *)v187 - 1);
  __chkstk_darwin(v187);
  v185 = (char *)&v151 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v152 = type metadata accessor for RoundedRectangle();
  __chkstk_darwin(v152);
  char v157 = (double *)((char *)&v151 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v168 = type metadata accessor for Material();
  uint64_t v167 = *(void *)(v168 - 8);
  __chkstk_darwin(v168);
  uint64_t v165 = (char *)&v151 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_100006380(&qword_10006B540);
  __chkstk_darwin(v9 - 8);
  uint64_t v161 = (uint64_t *)((char *)&v151 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v163 = sub_100006380(&qword_10006B548) - 8;
  __chkstk_darwin(v163);
  char v162 = (char *)&v151 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v166 = sub_100006380(&qword_10006B550) - 8;
  __chkstk_darwin(v166);
  uint64_t v164 = (uint64_t)&v151 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v169 = sub_100006380(&qword_10006B558);
  __chkstk_darwin(v169);
  v155 = (char *)&v151 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v153 = sub_100006380(&qword_10006B560);
  __chkstk_darwin(v153);
  id v156 = (char *)&v151 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v154 = sub_100006380(&qword_10006B568);
  __chkstk_darwin(v154);
  uint64_t v175 = (uint64_t)&v151 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v173 = sub_100006380(&qword_10006B570);
  __chkstk_darwin(v173);
  uint64_t v176 = (uint64_t)&v151 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v174 = sub_100006380(&qword_10006B578);
  __chkstk_darwin(v174);
  uint64_t v178 = (uint64_t)&v151 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v177 = sub_100006380(&qword_10006B580);
  __chkstk_darwin(v177);
  uint64_t v180 = (uint64_t)&v151 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v179 = sub_100006380(&qword_10006B588);
  __chkstk_darwin(v179);
  uint64_t v181 = (uint64_t)&v151 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v201 = sub_100006380(&qword_10006B590);
  __chkstk_darwin(v201);
  uint64_t v184 = (uint64_t)&v151 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v193 = sub_100006380(&qword_10006B598);
  uint64_t v192 = *(void *)(v193 - 8);
  __chkstk_darwin(v193);
  uint64_t v191 = (char *)&v151 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v188 = sub_100006380(&qword_10006B5A0);
  __chkstk_darwin(v188);
  uint64_t v190 = (char *)&v151 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v23);
  uint64_t v189 = (uint64_t)&v151 - v24;
  uint64_t v25 = type metadata accessor for GeometryProxy();
  uint64_t v26 = *(void *)(v25 - 8);
  uint64_t v211 = *(void *)(v26 + 64);
  __chkstk_darwin(v25);
  uint64_t v28 = (char *)&v151 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v206 = type metadata accessor for RootView();
  uint64_t v210 = *(void *)(v206 - 8);
  uint64_t v29 = *(void *)(v210 + 64);
  __chkstk_darwin(v206);
  uint64_t v172 = (uint64_t)&v151 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v30);
  uint64_t v32 = (char *)&v151 - v31;
  uint64_t v33 = type metadata accessor for GlobalCoordinateSpace();
  __chkstk_darwin(v33);
  uint64_t v205 = type metadata accessor for DragGesture();
  uint64_t v208 = *(void *)(v205 - 8);
  __chkstk_darwin(v205);
  uint64_t v35 = (char *)&v151 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v159 = sub_100006380(&qword_10006AEB8);
  uint64_t v160 = *(void *)(v159 - 8);
  __chkstk_darwin(v159);
  uint64_t v158 = (char *)&v151 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v183 = sub_100006380(&qword_10006AEC0);
  uint64_t v182 = *(void *)(v183 - 8);
  __chkstk_darwin(v183);
  uint64_t v199 = (char *)&v151 - ((v37 + 15) & 0xFFFFFFFFFFFFFFF0);
  static CoordinateSpaceProtocol<>.global.getter();
  DragGesture.init<A>(minimumDistance:coordinateSpace:)();
  uint64_t v204 = type metadata accessor for RootView;
  uint64_t v200 = v32;
  sub_10001D74C(a2, (uint64_t)v32, (uint64_t (*)(void))type metadata accessor for RootView);
  v212 = *(void (**)(char *, uint64_t, uint64_t))(v26 + 16);
  uint64_t v207 = v28;
  uint64_t v202 = v25;
  v212(v28, a1, v25);
  uint64_t v38 = *(unsigned __int8 *)(v210 + 80);
  uint64_t v39 = (v38 + 16) & ~v38;
  uint64_t v40 = v38 | 7;
  uint64_t v41 = *(unsigned __int8 *)(v26 + 80);
  uint64_t v171 = v39 + v29;
  uint64_t v42 = (v39 + v29 + v41) & ~v41;
  v211 += v42;
  uint64_t v170 = v40;
  uint64_t v210 = v40 | v41;
  uint64_t v43 = swift_allocObject();
  sub_10001C508((uint64_t)v32, v43 + v39);
  uint64_t v44 = *(void (**)(uint64_t, char *, uint64_t))(v26 + 32);
  v44(v43 + v42, v28, v25);
  sub_10001D6E8(&qword_10006AEE8, (void (*)(uint64_t))&type metadata accessor for DragGesture);
  sub_10001D6E8(&qword_10006AEF0, (void (*)(uint64_t))&type metadata accessor for DragGesture.Value);
  uint64_t v45 = v158;
  uint64_t v46 = v205;
  Gesture<>.onChanged(_:)();
  swift_release();
  (*(void (**)(char *, uint64_t))(v208 + 8))(v35, v46);
  uint64_t v47 = (uint64_t)v200;
  sub_10001D74C(v209, (uint64_t)v200, (uint64_t (*)(void))v204);
  uint64_t v48 = v207;
  uint64_t v49 = v202;
  uint64_t v205 = v26 + 16;
  v212(v207, v213, v202);
  uint64_t v50 = swift_allocObject();
  uint64_t v198 = v39;
  sub_10001C508(v47, v50 + v39);
  uint64_t v204 = (uint64_t (*)())v42;
  uint64_t v208 = v26 + 32;
  uint64_t v203 = (void (*)(char *, char *, uint64_t))v44;
  v44(v50 + v42, v48, v49);
  sub_1000068B8(&qword_10006AEF8, &qword_10006AEB8);
  uint64_t v51 = (uint64_t)v199;
  uint64_t v52 = v159;
  Gesture.onEnded(_:)();
  swift_release();
  (*(void (**)(char *, uint64_t))(v160 + 8))(v45, v52);
  uint64_t v53 = static Alignment.center.getter();
  uint64_t v54 = (uint64_t)v161;
  *uint64_t v161 = v53;
  *(void *)(v54 + 8) = v55;
  uint64_t v56 = sub_100006380(&qword_10006B5A8);
  uint64_t v57 = v209;
  sub_1000134C8(v209, v213, v51, v54 + *(int *)(v56 + 44));
  uint64_t v58 = v165;
  static Material.regular.getter();
  LOBYTE(v50) = static Edge.Set.all.getter();
  uint64_t v59 = (uint64_t)v162;
  uint64_t v60 = &v162[*(int *)(v163 + 44)];
  uint64_t v61 = v167;
  uint64_t v62 = v168;
  (*(void (**)(char *, char *, uint64_t))(v167 + 16))(v60, v58, v168);
  v60[*(int *)(sub_100006380(&qword_10006B5B0) + 36)] = v50;
  sub_100006754(v54, v59, &qword_10006B540);
  (*(void (**)(char *, uint64_t))(v61 + 8))(v58, v62);
  sub_1000067B8(v54, &qword_10006B540);
  uint64_t v63 = v57;
  double v64 = sub_100016748();
  uint64_t v65 = v164;
  sub_100006754(v59, v164, &qword_10006B548);
  uint64_t v66 = v65;
  *(double *)(v65 + *(int *)(v166 + 44)) = v64;
  sub_1000067B8(v59, &qword_10006B548);
  uint64_t v67 = v63 + *(int *)(v206 + 32);
  char v68 = *(unsigned char *)v67;
  uint64_t v69 = *(void *)(v67 + 8);
  LOBYTE(v217) = *(unsigned char *)v67;
  *((void *)&v217 + 1) = v69;
  sub_100006380(&qword_10006B5B8);
  State.wrappedValue.getter();
  if (v214 == 4)
  {
    if (AXDeviceIsPad()) {
      double v70 = 34.0;
    }
    else {
      double v70 = 27.0;
    }
  }
  else
  {
    LOBYTE(v217) = v68;
    *((void *)&v217 + 1) = v69;
    State.wrappedValue.getter();
    double v70 = 18.0;
  }
  char v71 = v157;
  uint64_t v72 = (uint64_t)v156;
  uint64_t v73 = (uint64_t)v155;
  uint64_t v74 = v154;
  uint64_t v75 = v153;
  uint64_t v76 = (char *)v157 + *(int *)(v152 + 20);
  uint64_t v77 = enum case for RoundedCornerStyle.continuous(_:);
  uint64_t v78 = type metadata accessor for RoundedCornerStyle();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v78 - 8) + 104))(v76, v77, v78);
  *char v71 = v70;
  v71[1] = v70;
  uint64_t v79 = v73 + *(int *)(v169 + 36);
  sub_10001D74C((uint64_t)v71, v79, (uint64_t (*)(void))&type metadata accessor for RoundedRectangle);
  *(_WORD *)(v79 + *(int *)(sub_100006380(&qword_10006AF40) + 36)) = 256;
  sub_100006754(v66, v73, &qword_10006B550);
  sub_10001D7B4((uint64_t)v71, (uint64_t (*)(void))&type metadata accessor for RoundedRectangle);
  sub_1000067B8(v66, &qword_10006B550);
  uint64_t v80 = *(void *)(v67 + 8);
  LOBYTE(v217) = *(unsigned char *)v67;
  *((void *)&v217 + 1) = v80;
  State.wrappedValue.getter();
  uint64_t v81 = 0;
  if (v214 == 3) {
    uint64_t v81 = static SafeAreaRegions.all.getter();
  }
  char v82 = static Edge.Set.all.getter();
  sub_100006754(v73, v72, &qword_10006B558);
  uint64_t v83 = v72 + *(int *)(v75 + 36);
  *(void *)uint64_t v83 = v81;
  *(unsigned char *)(v83 + 8) = v82;
  sub_1000067B8(v73, &qword_10006B558);
  char v84 = static Edge.Set.all.getter();
  uint64_t v85 = v175;
  sub_100006754(v72, v175, &qword_10006B560);
  uint64_t v86 = v85 + *(int *)(v74 + 36);
  *(unsigned char *)uint64_t v86 = v84;
  *(_OWORD *)(v86 + 8) = 0u;
  *(_OWORD *)(v86 + 24) = 0u;
  *(unsigned char *)(v86 + 40) = 0;
  sub_1000067B8(v72, &qword_10006B560);
  GeometryProxy.size.getter();
  double v88 = v87;
  double v90 = v89;
  uint64_t v92 = *(void *)(v67 + 8);
  LOBYTE(v217) = *(unsigned char *)v67;
  char v91 = v217;
  *((void *)&v217 + 1) = v92;
  State.wrappedValue.getter();
  uint64_t v93 = v209;
  sub_100017F7C(v214, v88, v90);
  GeometryProxy.size.getter();
  double v95 = v94;
  double v97 = v96;
  LOBYTE(v217) = v91;
  *((void *)&v217 + 1) = v92;
  State.wrappedValue.getter();
  sub_100017F7C(v214, v95, v97);
  static Alignment.center.getter();
  _FrameLayout.init(width:height:alignment:)();
  uint64_t v98 = v176;
  sub_100006754(v85, v176, &qword_10006B568);
  uint64_t v99 = (_OWORD *)(v98 + *(int *)(v173 + 36));
  long long v100 = v218;
  *uint64_t v99 = v217;
  v99[1] = v100;
  v99[2] = v219;
  sub_1000067B8(v85, &qword_10006B568);
  GeometryProxy.size.getter();
  double v103 = sub_1000167F8(v101, v102);
  uint64_t v105 = v104;
  uint64_t v106 = v178;
  sub_100006754(v98, v178, &qword_10006B570);
  uint64_t v107 = (double *)(v106 + *(int *)(v174 + 36));
  *uint64_t v107 = v103;
  *((void *)v107 + 1) = v105;
  sub_1000067B8(v98, &qword_10006B570);
  uint64_t v108 = *(void *)(v67 + 8);
  LOBYTE(v214) = *(unsigned char *)v67;
  uint64_t v215 = v108;
  State.wrappedValue.getter();
  int v109 = v216;
  uint64_t v110 = v172;
  sub_10001D74C(v93, v172, (uint64_t (*)(void))type metadata accessor for RootView);
  if (v109)
  {
    uint64_t v111 = v206;
    uint64_t v112 = v110 + *(int *)(v206 + 32);
    char v113 = *(unsigned char *)v112;
    uint64_t v114 = *(void *)(v112 + 8);
    LOBYTE(v214) = v113;
    uint64_t v215 = v114;
    State.wrappedValue.getter();
    int v115 = v216;
    sub_10001D7B4(v110, (uint64_t (*)(void))type metadata accessor for RootView);
    if (v115 == 1) {
      double v116 = 5.0;
    }
    else {
      double v116 = 0.0;
    }
  }
  else
  {
    sub_10001D7B4(v110, (uint64_t (*)(void))type metadata accessor for RootView);
    double v116 = 5.0;
    uint64_t v111 = v206;
  }
  (*(void (**)(char *, void, uint64_t (*)(void)))(v186 + 104))(v185, enum case for Color.RGBColorSpace.sRGBLinear(_:), v187);
  uint64_t v117 = Color.init(_:white:opacity:)();
  uint64_t v118 = v180;
  sub_100006754(v106, v180, &qword_10006B578);
  uint64_t v119 = v118 + *(int *)(v177 + 36);
  *(void *)uint64_t v119 = v117;
  *(double *)(v119 + 8) = v116;
  *(void *)(v119 + 16) = 0;
  *(void *)(v119 + 24) = 0;
  sub_1000067B8(v106, &qword_10006B578);
  uint64_t v120 = v209;
  uint64_t v121 = (uint64_t)v200;
  sub_10001D74C(v209, (uint64_t)v200, (uint64_t (*)(void))type metadata accessor for RootView);
  uint64_t v122 = v207;
  uint64_t v123 = v202;
  v212(v207, v213, v202);
  uint64_t v124 = swift_allocObject();
  uint64_t v125 = v198;
  sub_10001C508(v121, v124 + v198);
  v203((char *)v204 + v124, v122, v123);
  uint64_t v126 = v181;
  sub_100006754(v118, v181, &qword_10006B580);
  uint64_t v127 = (void (**)())(v126 + *(int *)(v179 + 36));
  *uint64_t v127 = sub_10001C710;
  v127[1] = (void (*)())v124;
  v127[2] = 0;
  v127[3] = 0;
  sub_1000067B8(v118, &qword_10006B580);
  uint64_t v187 = (uint64_t (*)(void))type metadata accessor for RootView;
  sub_10001D74C(v120, v121, (uint64_t (*)(void))type metadata accessor for RootView);
  uint64_t v128 = swift_allocObject();
  sub_10001C508(v121, v128 + v125);
  uint64_t v129 = v184;
  sub_100006754(v126, v184, &qword_10006B588);
  uint64_t v130 = (void *)(v129 + *(int *)(v201 + 36));
  *uint64_t v130 = 0;
  v130[1] = 0;
  v130[2] = sub_10001C7DC;
  v130[3] = v128;
  sub_1000067B8(v126, &qword_10006B588);
  uint64_t v131 = *(void **)(v120 + *(int *)(v111 + 96) + 8);
  swift_getKeyPath();
  swift_getKeyPath();
  id v132 = v131;
  static Published.subscript.getter();

  swift_release();
  swift_release();
  sub_10001D74C(v120, v121, (uint64_t (*)(void))type metadata accessor for RootView);
  uint64_t v133 = v207;
  v212(v207, v213, v123);
  uint64_t v134 = swift_allocObject();
  sub_10001C508(v121, v134 + v125);
  uint64_t v135 = v133;
  v203((char *)v204 + v134, v133, v123);
  sub_100006380(&qword_10006BF40);
  sub_10001C8A4(&qword_10006B5C0, &qword_10006B590, (void (*)(void))sub_10001C874);
  sub_10001CBA0();
  char v136 = v191;
  View.onChange<A>(of:initial:_:)();
  swift_release();
  swift_bridgeObjectRelease();
  sub_1000067B8(v129, &qword_10006B590);
  char v137 = *(void **)(v120 + *(int *)(v206 + 84) + 8);
  swift_beginAccess();
  id v138 = v137;
  sub_100006380(&qword_10006B080);
  uint64_t v139 = v194;
  Published.projectedValue.getter();
  swift_endAccess();

  sub_10001D74C(v120, v121, v187);
  uint64_t v140 = v135;
  v212(v135, v213, v123);
  uint64_t v141 = swift_allocObject();
  sub_10001C508(v121, v141 + v198);
  v203((char *)v204 + v141, v140, v123);
  uint64_t v142 = v192;
  uint64_t v143 = (uint64_t)v190;
  uint64_t v144 = v193;
  (*(void (**)(char *, char *, uint64_t))(v192 + 16))(v190, v136, v193);
  uint64_t v145 = v188;
  uint64_t v146 = v195;
  uint64_t v147 = v196;
  (*(void (**)(uint64_t, char *, uint64_t))(v195 + 16))(v143 + *(int *)(v188 + 52), v139, v196);
  uint64_t v148 = (uint64_t (**)(uint64_t))(v143 + *(int *)(v145 + 56));
  *uint64_t v148 = sub_10001CC48;
  v148[1] = (uint64_t (*)(uint64_t))v141;
  (*(void (**)(char *, uint64_t))(v146 + 8))(v139, v147);
  (*(void (**)(char *, uint64_t))(v142 + 8))(v136, v144);
  uint64_t v149 = v189;
  sub_10000A940(v143, v189, &qword_10006B5A0);
  sub_10000A940(v149, v197, &qword_10006B5A0);
  return (*(uint64_t (**)(char *, uint64_t))(v182 + 8))(v199, v183);
}

uint64_t sub_100012198(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v80 = a3;
  uint64_t v5 = type metadata accessor for DragGesture.Value();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v76 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v11 = (char *)&v76 - v10;
  uint64_t v12 = type metadata accessor for RootView();
  __chkstk_darwin(v12);
  uint64_t v14 = (char *)&v76 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v81 = v15;
  uint64_t v16 = (uint64_t *)(a2 + *(int *)(v15 + 72));
  uint64_t v17 = *v16;
  uint64_t v18 = v16[1];
  uint64_t v19 = v16[2];
  *(void *)&long long v83 = *v16;
  *((void *)&v83 + 1) = v18;
  uint64_t v84 = v19;
  uint64_t v82 = sub_100006380(&qword_10006AF30);
  State.wrappedValue.getter();
  v86.double width = 0.0;
  v86.double height = 0.0;
  if (!CGSizeEqualToSize(v85, v86))
  {
    *(void *)&long long v83 = v17;
    *((void *)&v83 + 1) = v18;
    uint64_t v84 = v19;
    State.wrappedValue.getter();
    double width = v85.width;
    DragGesture.Value.translation.getter();
    double v22 = vabdd_f64(width, v21);
    sub_10001D74C(a2, (uint64_t)v14, (uint64_t (*)(void))type metadata accessor for RootView);
    (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v11, a1, v5);
    if (v22 >= 2.0)
    {
      (*(void (**)(char *, uint64_t))(v6 + 8))(v11, v5);
      sub_10001D7B4((uint64_t)v14, (uint64_t (*)(void))type metadata accessor for RootView);
    }
    else
    {
      uint64_t v23 = &v14[*(int *)(v81 + 72)];
      uint64_t v24 = *((void *)v23 + 2);
      long long v83 = *(_OWORD *)v23;
      uint64_t v84 = v24;
      State.wrappedValue.getter();
      double height = v85.height;
      DragGesture.Value.translation.getter();
      double v27 = vabdd_f64(height, v26);
      (*(void (**)(char *, uint64_t))(v6 + 8))(v11, v5);
      uint64_t result = sub_10001D7B4((uint64_t)v14, (uint64_t (*)(void))type metadata accessor for RootView);
      if (v27 < 2.0) {
        return result;
      }
    }
  }
  os_log_type_t v29 = static os_log_type_t.debug.getter();
  if (qword_10006AD90 != -1) {
    swift_once();
  }
  uint64_t v30 = qword_10006DF88;
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, a1, v5);
  if (os_log_type_enabled(v30, v29))
  {
    uint64_t v77 = v8;
    uint64_t v31 = swift_slowAlloc();
    uint64_t v79 = a2;
    uint64_t v32 = (uint8_t *)v31;
    uint64_t v33 = swift_slowAlloc();
    uint64_t v78 = a1;
    *(void *)&v85.double width = v33;
    *(_DWORD *)uint64_t v32 = 136315138;
    DragGesture.Value.translation.getter();
    *(void *)&long long v83 = v34;
    *((void *)&v83 + 1) = v35;
    type metadata accessor for CGSize(0);
    uint64_t v36 = String.init<A>(describing:)();
    *(void *)&long long v83 = sub_10000E634(v36, v37, (uint64_t *)&v85);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v77, v5);
    _os_log_impl((void *)&_mh_execute_header, v30, v29, "drag translation: %s", v32, 0xCu);
    swift_arrayDestroy();
    a1 = v78;
    swift_slowDealloc();
    a2 = v79;
    swift_slowDealloc();
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
  DragGesture.Value.translation.getter();
  uint64_t v38 = v16[2];
  long long v83 = *(_OWORD *)v16;
  uint64_t v84 = v38;
  v85.double width = v39;
  v85.double height = v40;
  State.wrappedValue.setter();
  DragGesture.Value.predictedEndTranslation.getter();
  double v42 = v41;
  DragGesture.Value.translation.getter();
  double v44 = v43;
  DragGesture.Value.predictedEndTranslation.getter();
  double v46 = v45;
  uint64_t result = DragGesture.Value.translation.getter();
  double v48 = v47;
  double v49 = vabdd_f64(v42, v44);
  if (qword_10006ADA8 != -1) {
    uint64_t result = swift_once();
  }
  if (v49 <= *(double *)&qword_10006DFB0 && fabs(v46 - v48) <= *(double *)&qword_10006DFB0)
  {
    uint64_t v50 = v81;
    uint64_t v51 = (uint64_t *)(a2 + *(int *)(v81 + 56));
    uint64_t v52 = *v51;
    uint64_t v53 = v51[1];
    uint64_t v54 = v51[2];
    *(void *)&long long v83 = *v51;
    *((void *)&v83 + 1) = v53;
    uint64_t v84 = v54;
    State.wrappedValue.getter();
    v87.double width = 0.0;
    v87.double height = 0.0;
    if (CGSizeEqualToSize(v85, v87))
    {
      uint64_t v55 = (void *)(a2 + *(int *)(v50 + 48));
      uint64_t v57 = v55[1];
      uint64_t v58 = a1;
      uint64_t v59 = v55[2];
      *(void *)&long long v83 = *v55;
      uint64_t v56 = v83;
      *((void *)&v83 + 1) = v57;
      uint64_t v84 = v59;
      State.wrappedValue.getter();
      CGSize v60 = v85;
      GeometryProxy.size.getter();
      double v62 = v61;
      double v64 = v63;
      uint64_t v65 = a2 + *(int *)(v50 + 32);
      char v66 = *(unsigned char *)v65;
      uint64_t v67 = *(void *)(v65 + 8);
      LOBYTE(v83) = v66;
      *((void *)&v83 + 1) = v67;
      sub_100006380(&qword_10006B5B8);
      State.wrappedValue.getter();
      double v68 = sub_100017F7C(SLOBYTE(v85.width), v62, v64);
      double v70 = v69;
      GeometryProxy.size.getter();
      safeOffset(offset:size:containerSize:foreheadWindowRect:)(v60.width, v60.height, v68, v70, v71, v72, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
      *(void *)&long long v83 = v56;
      *((void *)&v83 + 1) = v57;
      uint64_t v84 = v59;
      v85.double width = v73;
      v85.double height = v74;
      State.wrappedValue.setter();
      *(void *)&long long v83 = v56;
      *((void *)&v83 + 1) = v57;
      uint64_t v84 = v59;
      a1 = v58;
      State.wrappedValue.getter();
      *(void *)&long long v83 = v52;
      *((void *)&v83 + 1) = v53;
      uint64_t v84 = v54;
      State.wrappedValue.setter();
    }
    static Animation.linear(duration:)();
    Animation.delay(_:)();
    swift_release();
    Animation.repeatCount(_:autoreverses:)();
    uint64_t v75 = swift_release();
    __chkstk_darwin(v75);
    *(&v76 - 4) = a1;
    *(&v76 - 3) = a2;
    withAnimation<A>(_:_:)();
    return swift_release();
  }
  return result;
}

uint64_t sub_1000128B4()
{
  uint64_t v0 = type metadata accessor for LayoutDirection();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v16 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v6 = (char *)&v16 - v5;
  DragGesture.Value.translation.getter();
  double v8 = v7;
  double v10 = v9;
  type metadata accessor for RootView();
  sub_10000E33C((uint64_t)v6);
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, enum case for LayoutDirection.rightToLeft(_:), v0);
  char v11 = static LayoutDirection.== infix(_:_:)();
  uint64_t v12 = *(void (**)(char *, uint64_t))(v1 + 8);
  v12(v3, v0);
  v12(v6, v0);
  if (v11) {
    double v8 = -v8;
  }
  GeometryProxy.size.getter();
  return sub_100012A5C(v8, v10, v13, v14);
}

uint64_t sub_100012A5C(double a1, double a2, double a3, double a4)
{
  double v7 = (int *)type metadata accessor for RootView();
  sub_100006380(&qword_10006AF30);
  State.wrappedValue.getter();
  double v8 = (double *)(v4 + v7[12]);
  double v9 = *v8;
  CGFloat v10 = v8[2];
  swift_retain();
  State.wrappedValue.getter();
  State.wrappedValue.setter();
  swift_release();
  State.wrappedValue.getter();
  swift_retain();
  State.wrappedValue.getter();
  State.wrappedValue.setter();
  swift_release();
  CGFloat v18 = v9;
  State.wrappedValue.getter();
  uint64_t v11 = v4 + v7[8];
  LOBYTE(v18) = *(unsigned char *)v11;
  CGFloat v19 = *(double *)(v11 + 8);
  sub_100006380(&qword_10006B5B8);
  State.wrappedValue.getter();
  double v12 = sub_100017F7C(SLOBYTE(v21), a3, a4);
  double v14 = v13;
  uint64_t v15 = *(void **)(v4 + v7[21] + 8);
  swift_getKeyPath();
  swift_getKeyPath();
  id v16 = v15;
  static Published.subscript.getter();

  swift_release();
  swift_release();
  safeOffset(offset:size:containerSize:foreheadWindowRect:)(v21, v22, v12, v14, a3, a4, v18, v19, v10, v20);
  State.wrappedValue.setter();
  State.wrappedValue.getter();
  swift_retain();
  State.wrappedValue.getter();
  State.wrappedValue.setter();
  return swift_release();
}

void sub_100012D54()
{
  type metadata accessor for RootView();
  sub_100006380(&qword_10006AF30);
  State.wrappedValue.setter();
  GeometryProxy.size.getter();
  sub_100012DE4(v0, v1);
  sub_100013294();
}

void sub_100012DE4(double a1, double a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = type metadata accessor for RootView();
  __chkstk_darwin(v6);
  double v8 = (char *)&v38 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for LayoutDirection();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = ((uint64_t (*)(uint64_t))__chkstk_darwin)(v9);
  double v13 = (char *)&v38 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  uint64_t v15 = (char *)&v38 - v14;
  DragGesture.Value.predictedEndTranslation.getter();
  double v17 = v16;
  DragGesture.Value.translation.getter();
  double v19 = v18;
  DragGesture.Value.predictedEndTranslation.getter();
  double v21 = v20;
  DragGesture.Value.translation.getter();
  double v23 = v22;
  double v24 = vabdd_f64(v17, v19);
  if (qword_10006ADA8 != -1) {
    swift_once();
  }
  if (*(double *)&qword_10006DFB0 >= v24)
  {
    uint64_t v28 = v2 + *(int *)(v6 + 32);
    uint64_t v29 = *(void *)(v28 + 8);
    char v39 = *(unsigned char *)v28;
    uint64_t v40 = v29;
    sub_100006380(&qword_10006B5B8);
    State.wrappedValue.getter();
    int v30 = v41;
    sub_10001D74C(v3, (uint64_t)v8, (uint64_t (*)(void))type metadata accessor for RootView);
    if (v30 == 3)
    {
      sub_10001D7B4((uint64_t)v8, (uint64_t (*)(void))type metadata accessor for RootView);
    }
    else
    {
      uint64_t v31 = &v8[*(int *)(v6 + 32)];
      char v32 = *v31;
      uint64_t v33 = *((void *)v31 + 1);
      char v39 = v32;
      uint64_t v40 = v33;
      State.wrappedValue.getter();
      sub_10001D7B4((uint64_t)v8, (uint64_t (*)(void))type metadata accessor for RootView);
      if (v41 != 2 && *(double *)&qword_10006DFB0 < fabs(v21 - v23))
      {
        uint64_t v34 = *(void *)(v28 + 8);
        char v39 = *(unsigned char *)v28;
        uint64_t v40 = v34;
        State.wrappedValue.getter();
        sub_100017F7C(v41, a1, a2);
        double v36 = __chkstk_darwin(v35);
        *(&v38 - 6) = v3;
        *((unsigned char *)&v38 - 40) = v21 - v23 < 0.0;
        *((double *)&v38 - 4) = a1;
        *((double *)&v38 - 3) = a2;
        *((double *)&v38 - 2) = v36;
        *(&v38 - 1) = v37;
        static Animation.default.getter();
        withAnimation<A>(_:_:)();
        swift_release();
      }
    }
  }
  else
  {
    sub_10000E33C((uint64_t)v15);
    (*(void (**)(char *, void, uint64_t))(v10 + 104))(v13, enum case for LayoutDirection.rightToLeft(_:), v9);
    static LayoutDirection.== infix(_:_:)();
    uint64_t v25 = *(void (**)(char *, uint64_t))(v10 + 8);
    v25(v13, v9);
    uint64_t v26 = ((uint64_t (*)(char *, uint64_t))v25)(v15, v9);
    double v27 = __chkstk_darwin(v26);
    *(&v38 - 4) = v2;
    if (v27 <= 0.0) {
      *((unsigned char *)&v38 - 24) = 1;
    }
    else {
      *((unsigned char *)&v38 - 24) = 2;
    }
    *((double *)&v38 - 2) = a1;
    *((double *)&v38 - 1) = a2;
    static Animation.default.getter();
    withAnimation<A>(_:_:)();
    swift_release();
    sub_100013294();
    sub_1000183A0();
    [*(id *)(v2 + *(int *)(v6 + 92)) idleSleepTimerDisabled:0];
  }
  sub_100013294();
}

void sub_100013294()
{
  uint64_t v1 = v0;
  id v2 = [self standardUserDefaults];
  uint64_t v3 = (int *)type metadata accessor for RootView();
  uint64_t v4 = v0 + v3[8];
  LOBYTE(v12) = *(unsigned char *)v4;
  uint64_t v15 = *(void *)(v4 + 8);
  sub_100006380(&qword_10006B5B8);
  State.wrappedValue.getter();
  NSString v5 = String._bridgeToObjectiveC()();
  objc_msgSend(v2, "setInteger:forKey:", LOBYTE(v18.width), v5, v12, v15);

  uint64_t v6 = (long long *)(v0 + v3[12]);
  long long v13 = *v6;
  uint64_t v16 = *((void *)v6 + 2);
  sub_100006380(&qword_10006AF30);
  State.wrappedValue.getter();
  uint64_t v7 = NSStringFromCGSize(v18);
  if (!v7)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v7 = (NSString *)String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  NSString v8 = String._bridgeToObjectiveC()();
  objc_msgSend(v2, "setObject:forKey:", v7, v8, v13, v16);

  uint64_t v9 = (long long *)(v1 + v3[13]);
  long long v14 = *v9;
  uint64_t v17 = *((void *)v9 + 2);
  State.wrappedValue.getter();
  uint64_t v10 = NSStringFromCGSize(v18);
  if (!v10)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v10 = (NSString *)String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  NSString v11 = String._bridgeToObjectiveC()();
  objc_msgSend(v2, "setObject:forKey:", v10, v11, v14, v17);
}

uint64_t sub_1000134C8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v76 = a3;
  uint64_t v82 = a2;
  uint64_t v84 = a4;
  uint64_t v83 = sub_100006380(&qword_10006B640);
  __chkstk_darwin(v83);
  uint64_t v81 = (char *)&v70 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100006380(&qword_10006B648);
  __chkstk_darwin(v6 - 8);
  uint64_t v75 = (uint64_t *)((char *)&v70 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v78 = sub_100006380(&qword_10006B650);
  __chkstk_darwin(v78);
  uint64_t v79 = (uint64_t)&v70 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v77 = (uint64_t)&v70 - v10;
  __chkstk_darwin(v11);
  uint64_t v80 = (uint64_t)&v70 - v12;
  uint64_t v86 = sub_100006380(&qword_10006B658);
  __chkstk_darwin(v86);
  uint64_t v87 = (uint64_t)&v70 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v73 = type metadata accessor for GeometryProxy();
  uint64_t v14 = *(void *)(v73 - 8);
  uint64_t v15 = *(void *)(v14 + 64);
  __chkstk_darwin(v73);
  double v72 = (char *)&v70 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = (int *)type metadata accessor for RootView();
  uint64_t v71 = *((void *)v16 - 1);
  uint64_t v17 = *(void *)(v71 + 64);
  __chkstk_darwin(v16);
  CGSize v18 = (char *)&v70 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v85 = type metadata accessor for IconView();
  __chkstk_darwin(v85);
  uint64_t v74 = (uint64_t)&v70 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = a1;
  uint64_t v21 = a1 + v16[8];
  char v22 = *(unsigned char *)v21;
  uint64_t v23 = *(void *)(v21 + 8);
  LOBYTE(v90) = *(unsigned char *)v21;
  uint64_t v91 = v23;
  sub_100006380(&qword_10006B5B8);
  State.wrappedValue.getter();
  if (v88 == 4)
  {
    uint64_t v24 = a1;
    uint64_t v25 = (uint64_t *)(a1 + v16[17]);
    uint64_t v26 = *v25;
    uint64_t v27 = v25[1];
    *(void *)&long long v88 = v26;
    *((void *)&v88 + 1) = v27;
    sub_100006380(&qword_10006B1D0);
    State.projectedValue.getter();
    uint64_t v81 = v90;
    uint64_t v80 = v91;
    double v28 = v92;
    uint64_t v29 = a1 + v16[13];
    uint64_t v30 = *(void *)(v29 + 16);
    long long v88 = *(_OWORD *)v29;
    uint64_t v89 = v30;
    sub_100006380(&qword_10006AF30);
    State.projectedValue.getter();
    uint64_t v32 = (uint64_t)v90;
    uint64_t v31 = v91;
    double v33 = v92;
    double v34 = v93;
    uint64_t v35 = v82;
    GeometryProxy.size.getter();
    double v37 = v36;
    double v39 = v38;
    sub_10001D74C(v24, (uint64_t)&v70 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(void))type metadata accessor for RootView);
    uint64_t v40 = v72;
    uint64_t v41 = v73;
    (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v72, v35, v73);
    unint64_t v42 = (*(unsigned __int8 *)(v71 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v71 + 80);
    unint64_t v43 = (v17 + *(unsigned __int8 *)(v14 + 80) + v42) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80);
    uint64_t v44 = swift_allocObject();
    sub_10001C508((uint64_t)v18, v44 + v42);
    (*(void (**)(unint64_t, char *, uint64_t))(v14 + 32))(v44 + v43, v40, v41);
    uint64_t v45 = v74;
    sub_1000217A0((uint64_t)v81, v80, v32, v31, (uint64_t)sub_10001D734, v44, v74, v28, v33, v34, v37, v39);
    sub_10001D74C(v45, v87, (uint64_t (*)(void))type metadata accessor for IconView);
    swift_storeEnumTagMultiPayload();
    sub_10001D6E8(&qword_10006B670, (void (*)(uint64_t))type metadata accessor for IconView);
    sub_1000068B8(&qword_10006B678, &qword_10006B640);
    _ConditionalContent<>.init(storage:)();
    return sub_10001D7B4(v45, (uint64_t (*)(void))type metadata accessor for IconView);
  }
  else
  {
    uint64_t v47 = v82;
    LOBYTE(v90) = v22;
    uint64_t v91 = v23;
    State.wrappedValue.getter();
    LODWORD(v74) = v88;
    if (qword_10006AE20 != -1) {
      swift_once();
    }
    double v48 = (uint64_t *)(static AXLTSettingsManager.shared + OBJC_IVAR___AXLTSettingsManager_backgroundColor);
    swift_beginAccess();
    uint64_t v94 = *v48;
    swift_retain();
    State.init(wrappedValue:)();
    long long v49 = v88;
    uint64_t v50 = static HorizontalAlignment.center.getter();
    uint64_t v51 = (uint64_t)v75;
    *uint64_t v75 = v50;
    *(void *)(v51 + 8) = 0;
    *(unsigned char *)(v51 + 16) = 0;
    uint64_t v52 = sub_100006380(&qword_10006B660);
    sub_10001412C(v20, v47, v76, v51 + *(int *)(v52 + 44));
    char v53 = static Edge.Set.top.getter();
    LOBYTE(v88) = v22;
    *((void *)&v88 + 1) = v23;
    State.wrappedValue.getter();
    uint64_t v54 = v87;
    if (v94 == 3 && qword_10006ADB0 != -1) {
      swift_once();
    }
    EdgeInsets.init(_all:)();
    uint64_t v56 = v55;
    uint64_t v58 = v57;
    uint64_t v60 = v59;
    uint64_t v62 = v61;
    uint64_t v63 = v77;
    sub_100006754(v51, v77, &qword_10006B648);
    uint64_t v64 = v63 + *(int *)(v78 + 36);
    *(unsigned char *)uint64_t v64 = v53;
    *(void *)(v64 + 8) = v56;
    *(void *)(v64 + 16) = v58;
    *(void *)(v64 + 24) = v60;
    *(void *)(v64 + 32) = v62;
    *(unsigned char *)(v64 + 40) = 0;
    sub_1000067B8(v51, &qword_10006B648);
    uint64_t v65 = v63;
    uint64_t v66 = v80;
    sub_10000A940(v65, v80, &qword_10006B650);
    uint64_t v67 = v79;
    sub_100006754(v66, v79, &qword_10006B650);
    double v68 = v81;
    unsigned char *v81 = v74;
    *(_OWORD *)(v68 + 8) = v49;
    uint64_t v69 = sub_100006380(&qword_10006B668);
    sub_100006754(v67, (uint64_t)&v68[*(int *)(v69 + 48)], &qword_10006B650);
    swift_retain_n();
    swift_retain_n();
    sub_1000067B8(v67, &qword_10006B650);
    swift_release();
    swift_release();
    sub_100006754((uint64_t)v68, v54, &qword_10006B640);
    swift_storeEnumTagMultiPayload();
    sub_10001D6E8(&qword_10006B670, (void (*)(uint64_t))type metadata accessor for IconView);
    sub_1000068B8(&qword_10006B678, &qword_10006B640);
    _ConditionalContent<>.init(storage:)();
    sub_1000067B8((uint64_t)v68, &qword_10006B640);
    sub_1000067B8(v66, &qword_10006B650);
    swift_release();
    return swift_release();
  }
}

id sub_100013E10()
{
  type metadata accessor for RootView();
  sub_100006380(&qword_10006B5B8);
  State.wrappedValue.getter();
  GeometryProxy.size.getter();
  return sub_100013E94(v3, v0, v1);
}

id sub_100013E94(uint64_t a1, double a2, double a3)
{
  if (a1 == 4)
  {
    __chkstk_darwin(a1);
    static Animation.default.getter();
    withAnimation<A>(_:_:)();
    swift_release();
    sub_100013294();
    sub_1000183A0();
    return [*(id *)(v3 + *(int *)(type metadata accessor for RootView() + 92)) idleSleepTimerDisabled:0];
  }
  else
  {
    [*(id *)(v3 + *(int *)(type metadata accessor for RootView() + 92)) idleSleepTimerDisabled:1];
    sub_100006380(&qword_10006B630);
    State.wrappedValue.getter();
    [v8 invalidate];

    State.wrappedValue.setter();
    sub_100006380(&qword_10006B638);
    State.wrappedValue.getter();
    uint64_t v7 = sub_100017488(a2, a3);
    __chkstk_darwin(v7);
    static Animation.default.getter();
    withAnimation<A>(_:_:)();
    return (id)swift_release();
  }
}

uint64_t sub_10001412C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v284 = a3;
  uint64_t v336 = a2;
  uint64_t v316 = a4;
  uint64_t v311 = sub_100006380(&qword_10006B680);
  __chkstk_darwin(v311);
  v285 = (char *)&v283 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100006380(&qword_10006B688);
  uint64_t v313 = *(void *)(v6 - 8);
  uint64_t v314 = v6;
  __chkstk_darwin(v6);
  v312 = (char *)&v283 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100006380(&qword_10006B690);
  uint64_t v326 = *(void *)(v8 - 8);
  uint64_t v327 = v8;
  __chkstk_darwin(v8);
  v315 = (char *)&v283 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  v310 = (char *)&v283 - v11;
  __chkstk_darwin(v12);
  v325 = (char *)&v283 - v13;
  uint64_t v320 = sub_100006380(&qword_10006B698);
  uint64_t v298 = *(void *)(v320 - 8);
  __chkstk_darwin(v320);
  uint64_t v297 = (uint64_t)&v283 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v318 = sub_100006380(&qword_10006B6A0);
  __chkstk_darwin(v318);
  v319 = (void (*)(char *, uint64_t, uint64_t))((char *)&v283 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v330 = type metadata accessor for GeometryProxy();
  uint64_t v334 = *(void *)(v330 - 8);
  uint64_t v16 = *(void *)(v334 + 64);
  __chkstk_darwin(v330);
  v329 = (char *)&v283 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v17);
  *(void *)&long long v300 = (char *)&v283 - v18;
  uint64_t v19 = type metadata accessor for RootView();
  uint64_t v323 = *(void *)(v19 - 8);
  uint64_t v20 = *(void *)(v323 + 64);
  __chkstk_darwin(v19);
  uint64_t v309 = (uint64_t)&v283 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v21);
  uint64_t v308 = (uint64_t)&v283 - v22;
  __chkstk_darwin(v23);
  uint64_t v307 = (uint64_t)&v283 - v24;
  __chkstk_darwin(v25);
  uint64_t v306 = (uint64_t)&v283 - v26;
  __chkstk_darwin(v27);
  uint64_t v328 = (uint64_t)&v283 - v28;
  __chkstk_darwin(v29);
  *(void *)&long long v299 = (char *)&v283 - v30;
  uint64_t v31 = sub_100006380(&qword_10006B6A8);
  uint64_t v303 = *(void *)(v31 - 8);
  uint64_t v304 = v31;
  __chkstk_darwin(v31);
  v302 = (char *)&v283 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v317 = sub_100006380(&qword_10006B6B0);
  __chkstk_darwin(v317);
  v301 = (char *)&v283 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v34);
  *(void *)&long long v305 = (char *)&v283 - v35;
  uint64_t v36 = sub_100006380(&qword_10006B6B8);
  __chkstk_darwin(v36 - 8);
  uint64_t v324 = (uint64_t)&v283 - ((v37 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v38);
  uint64_t v331 = (uint64_t)&v283 - v39;
  uint64_t v40 = a1 + *(int *)(v19 + 32);
  char v41 = *(unsigned char *)v40;
  uint64_t v42 = *(void *)(v40 + 8);
  LOBYTE(v400[0]) = *(unsigned char *)v40;
  *((void *)&v400[0] + 1) = v42;
  uint64_t v43 = sub_100006380(&qword_10006B5B8);
  State.wrappedValue.getter();
  uint64_t v337 = a1;
  v332 = (int *)v19;
  uint64_t v333 = v40;
  uint64_t v335 = v43;
  uint64_t v321 = v20;
  uint64_t v322 = v16;
  if (LOBYTE(v399[0]) == 1)
  {
    uint64_t v44 = v337;
    uint64_t v45 = (char *)(v337 + *(int *)(v19 + 100));
    char v46 = *v45;
    uint64_t v47 = *((void *)v45 + 1);
    LOBYTE(v399[0]) = v46;
    *((void *)&v399[0] + 1) = v47;
    sub_100006380(&qword_10006B748);
    State.projectedValue.getter();
    uint64_t v297 = *((void *)&v400[0] + 1);
    uint64_t v298 = *(void *)&v400[0];
    LODWORD(v296) = LOBYTE(v400[1]);
    uint64_t v48 = v299;
    sub_10001D74C(v44, v299, (uint64_t (*)(void))type metadata accessor for RootView);
    uint64_t v49 = v330;
    uint64_t v50 = v334;
    uint64_t v51 = v300;
    v295 = *(void (**)(char *, uint64_t, uint64_t))(v334 + 16);
    uint64_t v293 = v334 + 16;
    v295((char *)v300, v336, v330);
    uint64_t v52 = *(unsigned __int8 *)(v323 + 80);
    uint64_t v53 = (v52 + 16) & ~v52;
    uint64_t v54 = *(unsigned __int8 *)(v50 + 80);
    uint64_t v55 = (v20 + v54 + v53) & ~v54;
    uint64_t v291 = v52 | v54 | 7;
    uint64_t v292 = v55 + v16;
    uint64_t v56 = swift_allocObject();
    uint64_t v294 = v53;
    uint64_t v57 = v56 + v53;
    uint64_t v58 = v49;
    uint64_t v59 = v48;
    uint64_t v60 = v56;
    sub_10001C508(v59, v57);
    uint64_t v61 = *(void (**)(uint64_t, uint64_t, uint64_t))(v50 + 32);
    v61(v60 + v55, v51, v58);
    uint64_t v62 = *(void *)(v40 + 8);
    LOBYTE(v400[0]) = *(unsigned char *)v40;
    *((void *)&v400[0] + 1) = v62;
    State.wrappedValue.getter();
    if (LOBYTE(v399[0]) == 2)
    {
      uint64_t v63 = 0;
      uint64_t v64 = 0;
    }
    else
    {
      uint64_t v94 = v328;
      sub_10001D74C(v337, v328, (uint64_t (*)(void))type metadata accessor for RootView);
      double v95 = v329;
      v295(v329, v336, v58);
      uint64_t v64 = swift_allocObject();
      sub_10001C508(v94, v64 + v294);
      v61(v64 + v55, (uint64_t)v95, v58);
      uint64_t v63 = sub_10001E880;
    }
    sub_100009FD8(v298, v297, v296, (uint64_t)sub_10001E398, v60, (uint64_t)v63, v64, (uint64_t)&v409);
    uint64_t v96 = v409;
    uint64_t v97 = v410;
    char v98 = v411;
    uint64_t v99 = v414;
    uint64_t v100 = v415;
    uint64_t v101 = v416;
    uint64_t v102 = v417;
    uint64_t v103 = v418;
    long long v299 = v412;
    long long v300 = v413;
    static Alignment.center.getter();
    _FrameLayout.init(width:height:alignment:)();
    LOBYTE(v399[0]) = v420;
    LOBYTE(v386) = v422;
    *(void *)&v400[0] = v96;
    *((void *)&v400[0] + 1) = v97;
    LOBYTE(v400[1]) = v98;
    *(_OWORD *)((char *)&v400[1] + 8) = v299;
    *(_OWORD *)((char *)&v400[2] + 8) = v300;
    *((void *)&v400[3] + 1) = v99;
    *(void *)&v400[4] = v100;
    *((void *)&v400[4] + 1) = v101;
    *(void *)&v400[5] = v102;
    *((void *)&v400[5] + 1) = v103;
    *(void *)&v400[6] = v419;
    BYTE8(v400[6]) = v420;
    *(void *)&v400[7] = v421;
    BYTE8(v400[7]) = v422;
    v400[8] = v423;
    LOBYTE(v400[9]) = 0;
    static GestureMask.all.getter();
    sub_100006380(&qword_10006B7B0);
    uint64_t v104 = sub_100006380(&qword_10006AEC0);
    sub_10001DA0C(&qword_10006B7B8, &qword_10006B7B0, (void (*)(void))sub_10001E310);
    uint64_t v105 = sub_1000068B8(&qword_10006AF28, &qword_10006AEC0);
    uint64_t v106 = v302;
    View.gesture<A>(_:including:)();
    sub_10001E978((uint64_t)&v409);
    LOBYTE(v96) = static Edge.Set.all.getter();
    EdgeInsets.init(_all:)();
    uint64_t v108 = v107;
    uint64_t v110 = v109;
    uint64_t v112 = v111;
    uint64_t v114 = v113;
    uint64_t v116 = v303;
    uint64_t v115 = v304;
    uint64_t v117 = v301;
    (*(void (**)(char *, char *, uint64_t))(v303 + 16))(v301, v106, v304);
    uint64_t v118 = &v117[*(int *)(v317 + 36)];
    *uint64_t v118 = v96;
    *((void *)v118 + 1) = v108;
    *((void *)v118 + 2) = v110;
    *((void *)v118 + 3) = v112;
    *((void *)v118 + 4) = v114;
    v118[40] = 0;
    (*(void (**)(char *, uint64_t))(v116 + 8))(v106, v115);
    uint64_t v119 = (uint64_t)v117;
    uint64_t v120 = v305;
    sub_10000A940(v119, v305, &qword_10006B6B0);
    sub_100006754(v120, (uint64_t)v319, &qword_10006B6B0);
    swift_storeEnumTagMultiPayload();
    sub_10001E1EC();
    uint64_t v121 = sub_10000646C(&qword_10006B798);
    uint64_t v122 = sub_10001E03C();
    *(void *)&v400[0] = v121;
    *((void *)&v400[0] + 1) = v104;
    *(void *)&v400[1] = v122;
    *((void *)&v400[1] + 1) = v105;
    swift_getOpaqueTypeConformance2();
    uint64_t v123 = v324;
    _ConditionalContent<>.init(storage:)();
    sub_1000067B8(v120, &qword_10006B6B0);
    uint64_t v124 = sub_100006380(&qword_10006B6C0);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v124 - 8) + 56))(v123, 0, 1, v124);
    sub_10000A940(v123, v331, &qword_10006B6B8);
    uint64_t v91 = v336;
    uint64_t v89 = v332;
    double v93 = (char *)v333;
  }
  else
  {
    LOBYTE(v400[0]) = v41;
    *((void *)&v400[0] + 1) = v42;
    State.wrappedValue.getter();
    if (LOBYTE(v399[0]) == 2)
    {
      uint64_t v65 = v337;
      uint64_t v66 = (char *)(v337 + v332[25]);
      char v67 = *v66;
      uint64_t v68 = *((void *)v66 + 1);
      LOBYTE(v399[0]) = v67;
      *((void *)&v399[0] + 1) = v68;
      sub_100006380(&qword_10006B748);
      State.projectedValue.getter();
      *(void *)&long long v305 = *((void *)&v400[0] + 1);
      uint64_t v69 = *(void *)&v400[0];
      LODWORD(v304) = LOBYTE(v400[1]);
      uint64_t v70 = v328;
      sub_10001D74C(v65, v328, (uint64_t (*)(void))type metadata accessor for RootView);
      uint64_t v71 = v334;
      uint64_t v73 = v329;
      uint64_t v72 = v330;
      (*(void (**)(char *, uint64_t, uint64_t))(v334 + 16))(v329, v336, v330);
      unint64_t v74 = (*(unsigned __int8 *)(v323 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v323 + 80);
      unint64_t v75 = (v321 + *(unsigned __int8 *)(v71 + 80) + v74) & ~(unint64_t)*(unsigned __int8 *)(v71 + 80);
      uint64_t v76 = swift_allocObject();
      sub_10001C508(v70, v76 + v74);
      (*(void (**)(unint64_t, char *, uint64_t))(v71 + 32))(v76 + v75, v73, v72);
      sub_100020F90(v69, v305, v304, (uint64_t)sub_10001E0CC, v76, (uint64_t)&v409);
      uint64_t v77 = v409;
      uint64_t v78 = v410;
      LOBYTE(v72) = v411;
      long long v79 = v413;
      uint64_t v80 = v414;
      uint64_t v81 = v415;
      uint64_t v82 = v416;
      long long v305 = v412;
      static Alignment.center.getter();
      _FrameLayout.init(width:height:alignment:)();
      LOBYTE(v348) = v420;
      v347[0] = v422;
      *(void *)&v400[0] = v77;
      *((void *)&v400[0] + 1) = v78;
      LOBYTE(v400[1]) = v72;
      *(_DWORD *)((char *)&v400[1] + 1) = v399[0];
      DWORD1(v400[1]) = *(_DWORD *)((char *)v399 + 3);
      *(_OWORD *)((char *)&v400[1] + 8) = v305;
      *(_OWORD *)((char *)&v400[2] + 8) = v79;
      *((void *)&v400[3] + 1) = v80;
      *(void *)&v400[4] = v81;
      *((void *)&v400[4] + 1) = v82;
      *(void *)&v400[5] = v419;
      BYTE8(v400[5]) = v420;
      *(_DWORD *)((char *)&v400[5] + 9) = v386;
      HIDWORD(v400[5]) = *(_DWORD *)((char *)&v386 + 3);
      *(void *)&v400[6] = v421;
      BYTE8(v400[6]) = v422;
      *(_DWORD *)((char *)&v400[6] + 9) = v373;
      HIDWORD(v400[6]) = *(_DWORD *)((char *)&v373 + 3);
      v400[7] = v423;
      static GestureMask.all.getter();
      uint64_t v83 = sub_100006380(&qword_10006B798);
      *(void *)&long long v305 = sub_100006380(&qword_10006AEC0);
      uint64_t v84 = sub_10001E03C();
      uint64_t v85 = sub_1000068B8(&qword_10006AF28, &qword_10006AEC0);
      uint64_t v86 = v297;
      View.gesture<A>(_:including:)();
      sub_10001E198((uint64_t)&v409);
      uint64_t v87 = v298;
      uint64_t v88 = v320;
      (*(void (**)(void *, uint64_t, uint64_t))(v298 + 16))(v319, v86, v320);
      swift_storeEnumTagMultiPayload();
      sub_10001E1EC();
      *(void *)&v400[0] = v83;
      uint64_t v89 = v332;
      *((void *)&v400[0] + 1) = v305;
      *(void *)&v400[1] = v84;
      *((void *)&v400[1] + 1) = v85;
      swift_getOpaqueTypeConformance2();
      uint64_t v90 = v324;
      _ConditionalContent<>.init(storage:)();
      (*(void (**)(uint64_t, uint64_t))(v87 + 8))(v86, v88);
      uint64_t v91 = v336;
      uint64_t v92 = sub_100006380(&qword_10006B6C0);
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v92 - 8) + 56))(v90, 0, 1, v92);
      sub_10000A940(v90, v331, &qword_10006B6B8);
    }
    else
    {
      uint64_t v125 = sub_100006380(&qword_10006B6C0);
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v125 - 8) + 56))(v331, 1, 1, v125);
      uint64_t v91 = v336;
      uint64_t v89 = v332;
    }
    double v93 = (char *)v333;
  }
  char v126 = *v93;
  uint64_t v127 = *((void *)v93 + 1);
  LOBYTE(v400[0]) = v126;
  *((void *)&v400[0] + 1) = v127;
  State.wrappedValue.getter();
  LODWORD(v305) = LOBYTE(v399[0]);
  uint64_t v128 = v337;
  uint64_t v129 = (uint64_t *)(v337 + v89[16]);
  uint64_t v130 = *v129;
  uint64_t v131 = v129[1];
  *(void *)&v399[0] = v130;
  *((void *)&v399[0] + 1) = v131;
  sub_100006380(&qword_10006B1D0);
  State.projectedValue.getter();
  v302 = (char *)*((void *)&v400[0] + 1);
  uint64_t v303 = *(void *)&v400[0];
  uint64_t v304 = *(void *)&v400[1];
  v399[0] = *(_OWORD *)(v128 + v89[10]);
  sub_100006380(&qword_10006B6C8);
  State.projectedValue.getter();
  *(void *)&long long v300 = *((void *)&v400[0] + 1);
  v301 = *(char **)&v400[0];
  *(void *)&long long v299 = *(void *)&v400[1];
  uint64_t v132 = v128 + v89[11];
  long long v133 = *(_OWORD *)v132;
  uint64_t v134 = *(void *)(v132 + 16);
  v399[0] = v133;
  *(void *)&v399[1] = v134;
  sub_100006380(&qword_10006B6D0);
  State.projectedValue.getter();
  uint64_t v297 = *((void *)&v400[0] + 1);
  uint64_t v298 = *(void *)&v400[0];
  v295 = (void (*)(char *, uint64_t, uint64_t))*((void *)&v400[1] + 1);
  uint64_t v296 = *(void *)&v400[1];
  uint64_t v135 = v328;
  sub_10001D74C(v128, v328, (uint64_t (*)(void))type metadata accessor for RootView);
  uint64_t v136 = v334;
  char v137 = v329;
  uint64_t v138 = v330;
  v319 = *(void (**)(char *, uint64_t, uint64_t))(v334 + 16);
  uint64_t v320 = v334 + 16;
  v319(v329, v91, v330);
  uint64_t v139 = *(unsigned __int8 *)(v323 + 80);
  uint64_t v140 = (v139 + 16) & ~v139;
  uint64_t v141 = *(unsigned __int8 *)(v136 + 80);
  uint64_t v142 = (v321 + v141 + v140) & ~v141;
  uint64_t v321 = v142 + v322;
  uint64_t v318 = v139 | v141 | 7;
  uint64_t v143 = swift_allocObject();
  uint64_t v322 = v140;
  sub_10001C508(v135, v143 + v140);
  uint64_t v323 = v142;
  uint64_t v294 = v143;
  uint64_t v144 = *(void (**)(uint64_t, char *, uint64_t))(v136 + 32);
  uint64_t v334 = v136 + 32;
  uint64_t v317 = (uint64_t)v144;
  v144(v143 + v142, v137, v138);
  if (qword_10006AE28 != -1) {
    swift_once();
  }
  uint64_t v145 = (void *)static AXLTCaptionsProvider.shared;
  type metadata accessor for AXLTCaptionsProvider();
  sub_10001D6E8((unint64_t *)&qword_10006B438, (void (*)(uint64_t))type metadata accessor for AXLTCaptionsProvider);
  id v146 = v145;
  uint64_t v147 = ObservedObject.init(wrappedValue:)();
  uint64_t v286 = v148;
  uint64_t v287 = v147;
  LODWORD(v293) = static Edge.Set.leading.getter();
  GeometryProxy.safeAreaInsets.getter();
  sub_100016498();
  EdgeInsets.init(_all:)();
  uint64_t v291 = v150;
  uint64_t v292 = v149;
  uint64_t v289 = v152;
  uint64_t v290 = v151;
  v408[0] = *(_DWORD *)v404;
  *(_DWORD *)((char *)v408 + 3) = *(_DWORD *)&v404[3];
  char v405 = 0;
  int v288 = static Edge.Set.trailing.getter();
  GeometryProxy.safeAreaInsets.getter();
  sub_100016498();
  EdgeInsets.init(_all:)();
  uint64_t v154 = v153;
  uint64_t v156 = v155;
  uint64_t v158 = v157;
  uint64_t v160 = v159;
  char v161 = static Edge.Set.top.getter();
  uint64_t v162 = *(void *)(v333 + 8);
  LOBYTE(v400[0]) = *(unsigned char *)v333;
  *((void *)&v400[0] + 1) = v162;
  State.wrappedValue.getter();
  int v163 = LOBYTE(v399[0]);
  uint64_t v164 = v306;
  sub_10001D74C(v128, v306, (uint64_t (*)(void))type metadata accessor for RootView);
  if (!v163)
  {
    sub_10001D7B4(v164, (uint64_t (*)(void))type metadata accessor for RootView);
    uint64_t v170 = v307;
    sub_10001D74C(v128, v307, (uint64_t (*)(void))type metadata accessor for RootView);
    uint64_t v165 = v332;
    goto LABEL_18;
  }
  uint64_t v165 = v332;
  uint64_t v166 = v164 + v332[8];
  char v167 = *(unsigned char *)v166;
  uint64_t v168 = *(void *)(v166 + 8);
  LOBYTE(v400[0]) = v167;
  *((void *)&v400[0] + 1) = v168;
  State.wrappedValue.getter();
  int v169 = LOBYTE(v399[0]);
  sub_10001D7B4(v164, (uint64_t (*)(void))type metadata accessor for RootView);
  uint64_t v170 = v307;
  sub_10001D74C(v128, v307, (uint64_t (*)(void))type metadata accessor for RootView);
  if (v169 == 1)
  {
LABEL_18:
    sub_10001D7B4(v170, (uint64_t (*)(void))type metadata accessor for RootView);
    uint64_t v175 = v333;
    goto LABEL_19;
  }
  uint64_t v171 = v170 + v165[8];
  char v172 = *(unsigned char *)v171;
  uint64_t v173 = *(void *)(v171 + 8);
  LOBYTE(v400[0]) = v172;
  *((void *)&v400[0] + 1) = v173;
  State.wrappedValue.getter();
  int v174 = LOBYTE(v399[0]);
  sub_10001D7B4(v170, (uint64_t (*)(void))type metadata accessor for RootView);
  uint64_t v175 = v333;
  if (v174 != 2 && qword_10006ADB0 != -1) {
    swift_once();
  }
LABEL_19:
  char v176 = v405;
  char v403 = 0;
  EdgeInsets.init(_all:)();
  uint64_t v178 = v177;
  uint64_t v180 = v179;
  uint64_t v182 = v181;
  uint64_t v184 = v183;
  char v185 = static Edge.Set.bottom.getter();
  uint64_t v186 = *(void *)(v175 + 8);
  LOBYTE(v400[0]) = *(unsigned char *)v175;
  *((void *)&v400[0] + 1) = v186;
  State.wrappedValue.getter();
  int v187 = LOBYTE(v399[0]);
  uint64_t v188 = v308;
  sub_10001D74C(v337, v308, (uint64_t (*)(void))type metadata accessor for RootView);
  if (v187)
  {
    uint64_t v189 = v188 + v165[8];
    char v190 = *(unsigned char *)v189;
    uint64_t v191 = *(void *)(v189 + 8);
    LOBYTE(v400[0]) = v190;
    *((void *)&v400[0] + 1) = v191;
    State.wrappedValue.getter();
  }
  sub_10001D7B4(v188, (uint64_t (*)(void))type metadata accessor for RootView);
  char v192 = v403;
  char v401 = 0;
  EdgeInsets.init(_all:)();
  char v402 = 0;
  *(void *)&v400[0] = v287;
  *((void *)&v400[0] + 1) = v286;
  LOBYTE(v400[1]) = v305;
  *(_DWORD *)((char *)&v400[1] + 1) = v408[0];
  DWORD1(v400[1]) = *(_DWORD *)((char *)v408 + 3);
  *((void *)&v400[1] + 1) = v303;
  *(void *)&v400[2] = v302;
  *((void *)&v400[2] + 1) = v304;
  *(void *)&v400[3] = v301;
  *((void *)&v400[3] + 1) = v300;
  *(void *)&v400[4] = v299;
  *((void *)&v400[4] + 1) = v298;
  *(void *)&v400[5] = v297;
  *((void *)&v400[5] + 1) = v296;
  *(void *)&v400[6] = v295;
  *((void *)&v400[6] + 1) = sub_10001D83C;
  *(void *)&v400[7] = v294;
  BYTE8(v400[7]) = 0;
  HIDWORD(v400[7]) = *(_DWORD *)&v407[3];
  *(_DWORD *)((char *)&v400[7] + 9) = *(_DWORD *)v407;
  LOBYTE(v400[8]) = v293;
  DWORD1(v400[8]) = *(_DWORD *)&v406[3];
  *(_DWORD *)((char *)&v400[8] + 1) = *(_DWORD *)v406;
  *((void *)&v400[8] + 1) = v292;
  *(void *)&v400[9] = v291;
  *((void *)&v400[9] + 1) = v290;
  *(void *)&v400[10] = v289;
  BYTE8(v400[10]) = v176;
  LOBYTE(v400[11]) = v288;
  *((void *)&v400[11] + 1) = v154;
  *(void *)&v400[12] = v156;
  *((void *)&v400[12] + 1) = v158;
  *(void *)&v400[13] = v160;
  BYTE8(v400[13]) = v192;
  LOBYTE(v400[14]) = v161;
  *((void *)&v400[14] + 1) = v178;
  *(void *)&v400[15] = v180;
  *((void *)&v400[15] + 1) = v182;
  *(void *)&v400[16] = v184;
  BYTE8(v400[16]) = v401;
  LOBYTE(v400[17]) = v185;
  *((void *)&v400[17] + 1) = v193;
  *(void *)&v400[18] = v194;
  *((void *)&v400[18] + 1) = v195;
  *(void *)&v400[19] = v196;
  BYTE8(v400[19]) = 0;
  uint64_t v197 = *(void *)(v175 + 8);
  LOBYTE(v399[0]) = *(unsigned char *)v175;
  *((void *)&v399[0] + 1) = v197;
  State.wrappedValue.getter();
  int v198 = v386;
  uint64_t v199 = v337;
  uint64_t v200 = v309;
  sub_10001D74C(v337, v309, (uint64_t (*)(void))type metadata accessor for RootView);
  if (v198 == 3)
  {
    sub_10001D7B4(v200, (uint64_t (*)(void))type metadata accessor for RootView);
    uint64_t v201 = (uint64_t)v285;
LABEL_24:
    uint64_t v206 = sub_100006380(&qword_10006AEC0);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v206 - 8) + 56))(v201, 1, 1, v206);
    goto LABEL_26;
  }
  uint64_t v202 = v200 + v332[8];
  char v203 = *(unsigned char *)v202;
  uint64_t v204 = *(void *)(v202 + 8);
  LOBYTE(v399[0]) = v203;
  *((void *)&v399[0] + 1) = v204;
  State.wrappedValue.getter();
  int v205 = v386;
  sub_10001D7B4(v200, (uint64_t (*)(void))type metadata accessor for RootView);
  uint64_t v201 = (uint64_t)v285;
  if (v205 == 2) {
    goto LABEL_24;
  }
  uint64_t v207 = sub_100006380(&qword_10006AEC0);
  uint64_t v208 = *(void *)(v207 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v208 + 16))(v201, v284, v207);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v208 + 56))(v201, 0, 1, v207);
LABEL_26:
  static GestureMask.all.getter();
  uint64_t v209 = sub_100006380(&qword_10006B6D8);
  uint64_t v210 = sub_10001C8A4(&qword_10006B6E0, &qword_10006B6D8, (void (*)(void))sub_10001D90C);
  unint64_t v211 = sub_10001DB04();
  uint64_t v213 = v311;
  v212 = v312;
  View.gesture<A>(_:including:)();
  sub_1000067B8(v201, &qword_10006B680);
  memcpy(v399, v400, 0x139uLL);
  sub_10001DB9C((uint64_t)v399);
  uint64_t v214 = v199;
  uint64_t v215 = v328;
  sub_10001D74C(v214, v328, (uint64_t (*)(void))type metadata accessor for RootView);
  long long v217 = v329;
  uint64_t v216 = v330;
  v319(v329, v336, v330);
  uint64_t v218 = swift_allocObject();
  sub_10001C508(v215, v218 + v322);
  ((void (*)(uint64_t, char *, uint64_t))v317)(v218 + v323, v217, v216);
  *(void *)&long long v386 = v209;
  *((void *)&v386 + 1) = v213;
  *(void *)&long long v387 = v210;
  *((void *)&v387 + 1) = v211;
  swift_getOpaqueTypeConformance2();
  long long v219 = v310;
  uint64_t v220 = v314;
  View.onTapGesture(count:perform:)();
  swift_release();
  (*(void (**)(char *, uint64_t))(v313 + 8))(v212, v220);
  (*(void (**)(char *, char *, uint64_t))(v326 + 32))(v325, v219, v327);
  char v221 = *(unsigned char *)v333;
  uint64_t v222 = *(void *)(v333 + 8);
  LOBYTE(v386) = *(unsigned char *)v333;
  *((void *)&v386 + 1) = v222;
  State.wrappedValue.getter();
  if (v373 == 2)
  {
    uint64_t v223 = v332;
    uint64_t v224 = v337;
    char v225 = (long long *)(v337 + v332[15]);
    uint64_t v226 = *((void *)v225 + 2);
    long long v373 = *v225;
    *(void *)&long long v374 = v226;
    sub_100006380(&qword_10006AF30);
    State.projectedValue.getter();
    uint64_t v333 = *((void *)&v386 + 1);
    uint64_t v334 = v386;
    v329 = (char *)*((void *)&v387 + 1);
    uint64_t v330 = v387;
    GeometryProxy.size.getter();
    double v228 = v227;
    double v230 = v229;
    LOBYTE(v386) = v221;
    *((void *)&v386 + 1) = v222;
    State.wrappedValue.getter();
    double v231 = sub_100017F7C(v373, v228, v230);
    uint64_t v233 = v232;
    uint64_t v234 = v224 + v223[12];
    uint64_t v235 = *(void *)(v234 + 16);
    long long v386 = *(_OWORD *)v234;
    *(void *)&long long v387 = v235;
    State.wrappedValue.getter();
    long long v236 = v373;
    GeometryProxy.size.getter();
    uint64_t v238 = v237;
    char v240 = v239;
    type metadata accessor for CGSize(0);
    long long v373 = 0uLL;
    State.init(wrappedValue:)();
    long long v241 = v386;
    uint64_t v242 = v387;
    static Alignment.center.getter();
    _FrameLayout.init(width:height:alignment:)();
    *(_DWORD *)v350 = *(_DWORD *)v346;
    *(_DWORD *)&v350[3] = *(_DWORD *)&v346[3];
    LOBYTE(v344[0]) = v425;
    LOBYTE(v342[0]) = v427[0];
    long long v348 = xmmword_100053F10;
    char v349 = 0;
    *(void *)&long long v351 = v334;
    *((void *)&v351 + 1) = v333;
    uint64_t v352 = v330;
    v353 = v329;
    uint64_t v354 = *(void *)&v231;
    uint64_t v355 = v233;
    long long v356 = v236;
    uint64_t v357 = v238;
    v358 = v240;
    long long v359 = v241;
    uint64_t v360 = v242;
    uint64_t v361 = v424;
    LOBYTE(v362) = v425;
    *(_DWORD *)((char *)&v362 + 1) = *(_DWORD *)v347;
    HIDWORD(v362) = *(_DWORD *)&v347[3];
    uint64_t v363 = v426;
    LOBYTE(v364) = v427[0];
    *(_DWORD *)((char *)&v364 + 1) = v432;
    HIDWORD(v364) = *(_DWORD *)((char *)&v432 + 3);
    long long v365 = *(_OWORD *)&v427[8];
    sub_10001E0C0((uint64_t)&v348);
    sub_10000A940((uint64_t)&v348, (uint64_t)&v373, &qword_10006B750);
    sub_100006380(&qword_10006B758);
    sub_100006380(&qword_10006B760);
    sub_10001C8A4(&qword_10006B768, &qword_10006B758, (void (*)(void))sub_10001DFB8);
    sub_10001C8A4(&qword_10006B778, &qword_10006B760, (void (*)(void))sub_10001E00C);
    _ConditionalContent<>.init(storage:)();
    long long v383 = v396;
    long long v384 = v397;
    v385[0] = v398[0];
    *(_OWORD *)((char *)v385 + 10) = *(_OWORD *)((char *)v398 + 10);
    long long v379 = v392;
    long long v380 = v393;
    long long v381 = v394;
    long long v382 = v395;
    long long v375 = v388;
    long long v376 = v389;
    long long v377 = v390;
    long long v378 = v391;
    long long v373 = v386;
    long long v374 = v387;
LABEL_31:
    nullsub_1(&v373);
    goto LABEL_32;
  }
  LOBYTE(v386) = v221;
  *((void *)&v386 + 1) = v222;
  State.wrappedValue.getter();
  if (v373 == 3)
  {
    uint64_t v243 = v337;
    v244 = (char *)(v337 + v332[25]);
    char v245 = *v244;
    uint64_t v246 = *((void *)v244 + 1);
    LOBYTE(v373) = v245;
    *((void *)&v373 + 1) = v246;
    sub_100006380(&qword_10006B748);
    State.projectedValue.getter();
    long long v247 = v386;
    char v248 = v387;
    uint64_t v249 = v328;
    sub_10001D74C(v243, v328, (uint64_t (*)(void))type metadata accessor for RootView);
    v251 = v329;
    uint64_t v250 = v330;
    v319(v329, v336, v330);
    uint64_t v252 = swift_allocObject();
    sub_10001C508(v249, v252 + v322);
    ((void (*)(uint64_t, char *, uint64_t))v317)(v252 + v323, v251, v250);
    sub_100020F90(v247, *((uint64_t *)&v247 + 1), v248, (uint64_t)sub_10001DF94, v252, (uint64_t)&v424);
    uint64_t v334 = v425;
    uint64_t v335 = v424;
    LODWORD(v333) = v426;
    uint64_t v253 = *(void *)&v427[16];
    v254 = v428;
    uint64_t v255 = v430;
    uint64_t v336 = v431;
    uint64_t v337 = v429;
    static Alignment.center.getter();
    _FrameLayout.init(width:height:alignment:)();
    uint64_t v256 = v432;
    v329 = v434;
    v332 = v436;
    uint64_t v330 = v437;
    char v341 = v433;
    char v339 = v435;
    char v257 = static Edge.Set.all.getter();
    EdgeInsets.init(_all:)();
    uint64_t v259 = v258;
    uint64_t v261 = v260;
    uint64_t v263 = v262;
    uint64_t v265 = v264;
    LOBYTE(v249) = v341;
    char v266 = v339;
    char v343 = 0;
    char v267 = static Edge.Set.bottom.getter();
    EdgeInsets.init(_all:)();
    *(_DWORD *)((char *)&v361 + 1) = v344[0];
    HIDWORD(v361) = *(_DWORD *)((char *)v344 + 3);
    char v345 = 0;
    *(void *)&long long v348 = v335;
    *((void *)&v348 + 1) = v334;
    char v349 = v333;
    *(_DWORD *)v350 = v342[0];
    *(_DWORD *)&v350[3] = *(_DWORD *)((char *)v342 + 3);
    long long v351 = *(_OWORD *)v427;
    uint64_t v352 = v253;
    v353 = v254;
    uint64_t v354 = v337;
    uint64_t v355 = v255;
    *(void *)&long long v356 = v336;
    *((void *)&v356 + 1) = v256;
    LOBYTE(v357) = v249;
    HIDWORD(v357) = *(_DWORD *)&v340[3];
    *(_DWORD *)((char *)&v357 + 1) = *(_DWORD *)v340;
    v358 = v329;
    LOBYTE(v359) = v266;
    DWORD1(v359) = *(_DWORD *)&v338[3];
    *(_DWORD *)((char *)&v359 + 1) = *(_DWORD *)v338;
    *((void *)&v359 + 1) = v332;
    uint64_t v360 = v330;
    LOBYTE(v361) = v257;
    uint64_t v362 = v259;
    uint64_t v363 = v261;
    uint64_t v364 = v263;
    *(void *)&long long v365 = v265;
    BYTE8(v365) = v343;
    HIDWORD(v365) = *(_DWORD *)&v347[3];
    *(_DWORD *)((char *)&v365 + 9) = *(_DWORD *)v347;
    char v366 = v267;
    *(_DWORD *)&v367[3] = *(_DWORD *)&v346[3];
    *(_DWORD *)v367 = *(_DWORD *)v346;
    uint64_t v368 = v268;
    uint64_t v369 = v269;
    uint64_t v370 = v270;
    uint64_t v371 = v271;
    char v372 = 0;
    sub_10001DFAC((uint64_t)&v348);
    sub_10000A940((uint64_t)&v348, (uint64_t)&v373, &qword_10006B750);
    sub_100006380(&qword_10006B758);
    sub_100006380(&qword_10006B760);
    sub_10001C8A4(&qword_10006B768, &qword_10006B758, (void (*)(void))sub_10001DFB8);
    sub_10001C8A4(&qword_10006B778, &qword_10006B760, (void (*)(void))sub_10001E00C);
    _ConditionalContent<>.init(storage:)();
    long long v383 = v396;
    long long v384 = v397;
    v385[0] = v398[0];
    *(_OWORD *)((char *)v385 + 10) = *(_OWORD *)((char *)v398 + 10);
    long long v379 = v392;
    long long v380 = v393;
    long long v381 = v394;
    long long v382 = v395;
    long long v375 = v388;
    long long v376 = v389;
    long long v377 = v390;
    long long v378 = v391;
    long long v373 = v386;
    long long v374 = v387;
    goto LABEL_31;
  }
  sub_10001DC54((uint64_t)&v373);
LABEL_32:
  sub_10000A940((uint64_t)&v373, (uint64_t)&v386, &qword_10006B738);
  uint64_t v272 = v324;
  sub_100006754(v331, v324, &qword_10006B6B8);
  v274 = v325;
  uint64_t v273 = v326;
  v275 = *(void (**)(char *, char *, uint64_t))(v326 + 16);
  v276 = v315;
  uint64_t v277 = v327;
  v275(v315, v325, v327);
  sub_10000A940((uint64_t)&v386, (uint64_t)v347, &qword_10006B738);
  uint64_t v278 = v316;
  sub_100006754(v272, v316, &qword_10006B6B8);
  uint64_t v279 = sub_100006380(&qword_10006B740);
  v275((char *)(v278 + *(int *)(v279 + 48)), v276, v277);
  uint64_t v280 = v278 + *(int *)(v279 + 64);
  sub_10000A940((uint64_t)v347, (uint64_t)&v348, &qword_10006B738);
  sub_10000A940((uint64_t)&v348, v280, &qword_10006B738);
  sub_10001DDC8((uint64_t)&v348, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, __int16))sub_10001DC84);
  v281 = *(void (**)(char *, uint64_t))(v273 + 8);
  v281(v274, v277);
  sub_1000067B8(v331, &qword_10006B6B8);
  sub_10000A940((uint64_t)v347, (uint64_t)&v373, &qword_10006B738);
  sub_10001DDC8((uint64_t)&v373, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, __int16))sub_10001DE4C);
  v281(v276, v277);
  return sub_1000067B8(v272, &qword_10006B6B8);
}

id sub_10001639C(uint64_t a1)
{
  return [*(id *)(a1 + *(int *)(type metadata accessor for RootView() + 92)) idleSleepTimerDisabled:0];
}

id sub_10001644C()
{
  int IsPad = AXDeviceIsPad();
  GeometryProxy.size.getter();
  if (IsPad) {
    uint64_t v3 = 2;
  }
  else {
    uint64_t v3 = 3;
  }
  return sub_100013E94(v3, v1, v2);
}

uint64_t sub_100016498()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for RootView();
  uint64_t v3 = __chkstk_darwin(v2 - 8);
  uint64_t v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = v0 + *(int *)(v3 + 40);
  char v7 = *(unsigned char *)v6;
  uint64_t v8 = *(void *)(v6 + 8);
  char v12 = *(unsigned char *)v6;
  uint64_t v13 = v8;
  sub_100006380(&qword_10006B5B8);
  uint64_t result = State.wrappedValue.getter();
  if (v14)
  {
    char v12 = v7;
    uint64_t v13 = v8;
    State.wrappedValue.getter();
    int v10 = v14;
    sub_10001D74C(v1, (uint64_t)v5, (uint64_t (*)(void))type metadata accessor for RootView);
    if (v10 == 3) {
      sub_10000F880();
    }
    return sub_10001D7B4((uint64_t)v5, (uint64_t (*)(void))type metadata accessor for RootView);
  }
  return result;
}

id sub_100016604()
{
  type metadata accessor for RootView();
  sub_100006380(&qword_10006B5B8);
  State.wrappedValue.getter();
  if (v4)
  {
    id result = (id)State.wrappedValue.getter();
    if (v4 != 1) {
      return result;
    }
    uint64_t v1 = 0;
  }
  else
  {
    uint64_t v1 = 1;
  }
  GeometryProxy.size.getter();
  return sub_100013E94(v1, v2, v3);
}

uint64_t sub_1000166C8()
{
  GeometryProxy.size.getter();
  sub_100013E94(1, v0, v1);
  type metadata accessor for RootView();
  sub_100006380(&qword_10006B748);
  return State.wrappedValue.setter();
}

double sub_100016748()
{
  type metadata accessor for RootView();
  sub_100006380(&qword_10006B5B8);
  State.wrappedValue.getter();
  double result = 1.0;
  if (LOBYTE(v1) == 4)
  {
    sub_100006380(&qword_10006B1D0);
    State.wrappedValue.getter();
    return v1;
  }
  return result;
}

double sub_1000167F8(double a1, double a2)
{
  uint64_t v5 = (int *)type metadata accessor for RootView();
  uint64_t v6 = (double *)(v2 + v5[8]);
  char v7 = *(unsigned char *)v6;
  CGFloat v8 = v6[1];
  sub_100006380(&qword_10006B5B8);
  State.wrappedValue.getter();
  double v9 = 0.0;
  if (LOBYTE(v23) != 3)
  {
    State.wrappedValue.getter();
    if (LOBYTE(v23) == 4)
    {
      sub_100006380(&qword_10006AF30);
      State.wrappedValue.getter();
      if (AXDeviceIsPad()) {
        double v10 = 68.0;
      }
      else {
        double v10 = 54.0;
      }
      safeOffset(offset:size:containerSize:foreheadWindowRect:)(v23, v24, v10, v10, a1, a2, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
      return v11;
    }
    else
    {
      char v12 = (double *)(v2 + v5[12]);
      long long v20 = *(_OWORD *)v12;
      CGFloat v21 = v12[2];
      sub_100006380(&qword_10006AF30);
      State.wrappedValue.getter();
      LOBYTE(v20) = v7;
      State.wrappedValue.getter();
      double v13 = sub_100017F7C(SLOBYTE(v23), a1, a2);
      double v15 = v14;
      uint64_t v16 = *(void **)(v2 + v5[21] + 8);
      swift_getKeyPath();
      swift_getKeyPath();
      id v17 = v16;
      static Published.subscript.getter();

      swift_release();
      swift_release();
      safeOffset(offset:size:containerSize:foreheadWindowRect:)(v23, v24, v13, v15, a1, a2, *(CGFloat *)&v20, v8, v21, v22);
      double v9 = v18;
      if ((sub_10000F880() & 1) == 0)
      {
        State.wrappedValue.getter();
        if (LOBYTE(v23)) {
          return 4.0;
        }
        else {
          return 8.0;
        }
      }
    }
  }
  return v9;
}

void sub_100016A90(double a1, double a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = (int *)type metadata accessor for RootView();
  __chkstk_darwin(v6);
  CGFloat v8 = (char *)&v74 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static os_log_type_t.debug.getter();
  if (qword_10006AD90 != -1) {
    swift_once();
  }
  os_log(_:dso:log:_:_:)();
  id v9 = [self standardUserDefaults];
  NSString v10 = String._bridgeToObjectiveC()();
  id v11 = [v9 integerForKey:v10];

  if ((unint64_t)v11 >= 5) {
    char v12 = 0;
  }
  else {
    char v12 = (char)v11;
  }
  uint64_t v13 = v3 + v6[8];
  uint64_t v15 = *(void *)(v13 + 8);
  LOBYTE(v78) = *(unsigned char *)v13;
  char v14 = v78;
  *((void *)&v78 + 1) = v15;
  LOBYTE(v80.width) = v12;
  sub_100006380(&qword_10006B5B8);
  State.wrappedValue.setter();
  LOBYTE(v78) = v14;
  *((void *)&v78 + 1) = v15;
  State.wrappedValue.getter();
  if (!LOBYTE(v80.width) && UIAccessibilityIsVoiceOverRunning())
  {
    LOBYTE(v78) = v14;
    *((void *)&v78 + 1) = v15;
    LOBYTE(v80.width) = 1;
    State.wrappedValue.setter();
  }
  NSString v16 = String._bridgeToObjectiveC()();
  id v17 = (NSString *)[v9 stringForKey:v16];

  if (v17)
  {
    CGSize v18 = CGSizeFromString(v17);

    uint64_t v19 = v3 + v6[13];
    uint64_t v20 = *(void *)(v19 + 16);
    long long v78 = *(_OWORD *)v19;
    uint64_t v79 = v20;
    CGSize v80 = v18;
    sub_100006380(&qword_10006AF30);
    State.wrappedValue.setter();
  }
  else
  {
    CGFloat v21 = (void *)(v3 + v6[13]);
    uint64_t v23 = v21[1];
    uint64_t v24 = v21[2];
    *(void *)&long long v78 = *v21;
    uint64_t v22 = v78;
    *((void *)&v78 + 1) = v23;
    uint64_t v79 = v24;
    swift_retain();
    sub_100006380(&qword_10006AF30);
    uint64_t v75 = v15;
    State.wrappedValue.getter();
    *(void *)&long long v78 = v22;
    *((void *)&v78 + 1) = v23;
    uint64_t v79 = v24;
    CGFloat width = 10.0;
    CGFloat height = v80.height;
    uint64_t v15 = v75;
    State.wrappedValue.setter();
    swift_release();
  }
  NSString v25 = String._bridgeToObjectiveC()();
  uint64_t v26 = (NSString *)[v9 stringForKey:v25];

  if (v26)
  {
    CGSize v27 = CGSizeFromString(v26);

    uint64_t v28 = v3 + v6[15];
    uint64_t v29 = *(void *)(v28 + 16);
    long long v78 = *(_OWORD *)v28;
    uint64_t v79 = v29;
    CGSize v80 = v27;
    sub_100006380(&qword_10006AF30);
    State.wrappedValue.setter();
  }
  NSString v30 = String._bridgeToObjectiveC()();
  uint64_t v31 = (NSString *)[v9 stringForKey:v30];

  if (!v31)
  {
    LOBYTE(v78) = v14;
    *((void *)&v78 + 1) = v15;
    State.wrappedValue.getter();
    if (LOBYTE(v80.width) == 2)
    {
      uint64_t v37 = (void *)(v3 + v6[15]);
      uint64_t v39 = v37[1];
      uint64_t v40 = v37[2];
      *(void *)&long long v78 = *v37;
      uint64_t v38 = v78;
      *((void *)&v78 + 1) = v39;
      uint64_t v79 = v40;
      sub_100006380(&qword_10006AF30);
      State.wrappedValue.getter();
      CGFloat v41 = (a1 - v80.width) * 0.5;
      *(void *)&long long v78 = v38;
      *((void *)&v78 + 1) = v39;
      uint64_t v79 = v40;
      State.wrappedValue.getter();
      uint64_t v42 = (uint64_t *)(v3 + v6[12]);
      uint64_t v34 = *v42;
      uint64_t v35 = v42[1];
      uint64_t v36 = v42[2];
      *(void *)&long long v78 = *v42;
      *((void *)&v78 + 1) = v35;
      uint64_t v79 = v36;
      v80.CGFloat width = v41;
      v80.CGFloat height = a2 - v80.height + -24.0;
      goto LABEL_25;
    }
    LOBYTE(v78) = v14;
    *((void *)&v78 + 1) = v15;
    State.wrappedValue.getter();
    int width_low = LOBYTE(v80.width);
    sub_10001D74C(v3, (uint64_t)v8, (uint64_t (*)(void))type metadata accessor for RootView);
    if (width_low)
    {
      uint64_t v44 = &v8[v6[8]];
      char v45 = *v44;
      uint64_t v46 = *((void *)v44 + 1);
      LOBYTE(v78) = v45;
      *((void *)&v78 + 1) = v46;
      State.wrappedValue.getter();
      int v47 = LOBYTE(v80.width);
      sub_10001D7B4((uint64_t)v8, (uint64_t (*)(void))type metadata accessor for RootView);
      if (v47 != 1)
      {
        char v48 = 0;
LABEL_23:
        double v50 = sub_100017F7C(v48, a1, a2);
        uint64_t v52 = (uint64_t *)(v3 + v6[12]);
        uint64_t v34 = *v52;
        uint64_t v35 = v52[1];
        uint64_t v36 = v52[2];
        *(void *)&long long v78 = *v52;
        *((void *)&v78 + 1) = v35;
        uint64_t v79 = v36;
        v80.CGFloat width = (a1 - v50) * 0.5;
        v80.CGFloat height = a2 - v51 + -24.0;
        goto LABEL_24;
      }
    }
    else
    {
      sub_10001D7B4((uint64_t)v8, (uint64_t (*)(void))type metadata accessor for RootView);
    }
    uint64_t v49 = *(void *)(v13 + 8);
    LOBYTE(v78) = *(unsigned char *)v13;
    *((void *)&v78 + 1) = v49;
    State.wrappedValue.getter();
    char v48 = LOBYTE(v80.width);
    goto LABEL_23;
  }
  CGSize v32 = CGSizeFromString(v31);

  uint64_t v33 = (uint64_t *)(v3 + v6[12]);
  uint64_t v34 = *v33;
  uint64_t v35 = v33[1];
  uint64_t v36 = v33[2];
  *(void *)&long long v78 = *v33;
  *((void *)&v78 + 1) = v35;
  uint64_t v79 = v36;
  CGSize v80 = v32;
LABEL_24:
  sub_100006380(&qword_10006AF30);
LABEL_25:
  State.wrappedValue.setter();
  char v53 = *(unsigned char *)v13;
  uint64_t v54 = *(void *)(v13 + 8);
  LOBYTE(v78) = v53;
  *((void *)&v78 + 1) = v54;
  State.wrappedValue.getter();
  if (LOBYTE(v80.width) == 4)
  {
    char v55 = 0;
  }
  else
  {
    LOBYTE(v78) = v53;
    *((void *)&v78 + 1) = v54;
    State.wrappedValue.getter();
    char v55 = LOBYTE(v80.width);
  }
  uint64_t v56 = v3 + v6[9];
  char v57 = *(unsigned char *)v56;
  uint64_t v58 = *(void *)(v56 + 8);
  LOBYTE(v78) = v57;
  *((void *)&v78 + 1) = v58;
  LOBYTE(v80.width) = v55;
  State.wrappedValue.setter();
  LOBYTE(v78) = v53;
  *((void *)&v78 + 1) = v54;
  State.wrappedValue.getter();
  if (LOBYTE(v80.width) == 4)
  {
    uint64_t v59 = (uint64_t *)(v3 + v6[13]);
    uint64_t v60 = *v59;
    uint64_t v61 = v59[1];
    uint64_t v62 = v59[2];
    *(void *)&long long v78 = *v59;
    *((void *)&v78 + 1) = v61;
    uint64_t v79 = v62;
    sub_100006380(&qword_10006AF30);
    State.wrappedValue.getter();
    CGFloat v63 = v80.height;
    *(void *)&long long v78 = v34;
    *((void *)&v78 + 1) = v35;
    uint64_t v79 = v36;
    swift_retain();
    State.wrappedValue.getter();
    *(void *)&long long v78 = v34;
    *((void *)&v78 + 1) = v35;
    uint64_t v79 = v36;
    CGFloat width = v80.width;
    CGFloat height = v63;
    State.wrappedValue.setter();
    swift_release();
    sub_1000183A0();
  }
  else
  {
    *(void *)&long long v78 = v34;
    *((void *)&v78 + 1) = v35;
    uint64_t v79 = v36;
    sub_100006380(&qword_10006AF30);
    State.wrappedValue.getter();
    CGFloat v64 = v80.height;
    uint64_t v65 = (void *)(v3 + v6[13]);
    uint64_t v61 = v65[1];
    uint64_t v62 = v65[2];
    *(void *)&long long v78 = *v65;
    uint64_t v60 = v78;
    *((void *)&v78 + 1) = v61;
    uint64_t v79 = v62;
    swift_retain();
    State.wrappedValue.getter();
    *(void *)&long long v78 = v60;
    *((void *)&v78 + 1) = v61;
    uint64_t v79 = v62;
    CGFloat width = v80.width;
    CGFloat height = v64;
    State.wrappedValue.setter();
    swift_release();
    sub_100017488(a1, a2);
    [*(id *)(v3 + v6[23]) idleSleepTimerDisabled:1];
  }
  *(void *)&long long v78 = v60;
  *((void *)&v78 + 1) = v61;
  uint64_t v79 = v62;
  sub_100006380(&qword_10006AF30);
  State.wrappedValue.getter();
  double v66 = sub_10002DC0C(3, v80.width, v80.height, a1, a2);
  *(void *)&long long v78 = v60;
  *((void *)&v78 + 1) = v61;
  uint64_t v79 = v62;
  v80.CGFloat width = v66;
  v80.CGFloat height = v67;
  State.wrappedValue.setter();
  *(void *)&long long v78 = v34;
  *((void *)&v78 + 1) = v35;
  uint64_t v79 = v36;
  State.wrappedValue.getter();
  double v68 = v80.width;
  CGFloat v69 = v80.height;
  LOBYTE(v78) = v53;
  *((void *)&v78 + 1) = v54;
  State.wrappedValue.getter();
  double v70 = sub_100017F7C(SLOBYTE(v80.width), a1, a2);
  safeOffset(offset:size:containerSize:foreheadWindowRect:)(v68, v69, v70, v71, a1, a2, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  *(void *)&long long v78 = v34;
  *((void *)&v78 + 1) = v35;
  uint64_t v79 = v36;
  v80.CGFloat width = v72;
  v80.CGFloat height = v73;
  swift_retain();
  State.wrappedValue.setter();
  swift_release();
}

uint64_t sub_100017398()
{
  static os_log_type_t.debug.getter();
  if (qword_10006AD90 != -1) {
    swift_once();
  }
  os_log(_:dso:log:_:_:)();
  type metadata accessor for RootView();
  sub_100006380(&qword_10006B5B8);
  uint64_t result = State.wrappedValue.getter();
  if (v3 != 4)
  {
    GeometryProxy.size.getter();
    return sub_100017488(v1, v2);
  }
  return result;
}

uint64_t sub_100017488(double a1, double a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = type metadata accessor for RootView();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  __chkstk_darwin(v6 - 8);
  NSString v10 = (uint64_t *)(v2 + *(int *)(v9 + 96));
  uint64_t v11 = *v10;
  uint64_t v12 = v10[1];
  *(void *)&long long aBlock = *v10;
  *((void *)&aBlock + 1) = v12;
  sub_100006380(&qword_10006B630);
  State.wrappedValue.getter();

  if (!v26)
  {
    static os_log_type_t.debug.getter();
    if (qword_10006AD90 != -1) {
      swift_once();
    }
    os_log(_:dso:log:_:_:)();
  }
  *(void *)&long long aBlock = v11;
  *((void *)&aBlock + 1) = v12;
  State.wrappedValue.getter();
  id v13 = v26;
  [v26 invalidate];

  char v14 = self;
  sub_10001D74C(v3, (uint64_t)&aBlock - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(void))type metadata accessor for RootView);
  unint64_t v15 = (*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v16 = swift_allocObject();
  sub_10001C508((uint64_t)&aBlock - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v16 + v15);
  id v17 = (double *)(v16 + ((v8 + v15 + 7) & 0xFFFFFFFFFFFFFFF8));
  double *v17 = a1;
  v17[1] = a2;
  uint64_t v24 = sub_10001D164;
  uint64_t v25 = v16;
  *(void *)&long long aBlock = _NSConcreteStackBlock;
  *((void *)&aBlock + 1) = 1107296256;
  uint64_t v22 = sub_1000315A8;
  uint64_t v23 = &unk_100066520;
  CGSize v18 = _Block_copy(&aBlock);
  swift_release();
  id v19 = [v14 scheduledTimerWithTimeInterval:0 repeats:v18 block:120.0];
  _Block_release(v18);
  long long aBlock = *(_OWORD *)v10;
  id v26 = v19;
  return State.wrappedValue.setter();
}

uint64_t sub_10001774C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)type metadata accessor for RootView();
  char v4 = (double *)(a2 + v3[12]);
  long long v20 = *(_OWORD *)v4;
  CGFloat v21 = v4[2];
  sub_100006380(&qword_10006AF30);
  State.wrappedValue.getter();
  GeometryProxy.size.getter();
  double v6 = v5;
  double v8 = v7;
  uint64_t v9 = a2 + v3[8];
  LOBYTE(v20) = *(unsigned char *)v9;
  *((void *)&v20 + 1) = *(void *)(v9 + 8);
  sub_100006380(&qword_10006B5B8);
  State.wrappedValue.getter();
  double v10 = sub_100017F7C(SLOBYTE(v23), v6, v8);
  double v12 = v11;
  GeometryProxy.size.getter();
  double v14 = v13;
  double v16 = v15;
  id v17 = *(void **)(a2 + v3[21] + 8);
  swift_getKeyPath();
  swift_getKeyPath();
  id v18 = v17;
  static Published.subscript.getter();

  swift_release();
  swift_release();
  safeOffset(offset:size:containerSize:foreheadWindowRect:)(v23, v24, v10, v12, v14, v16, *(CGFloat *)&v20, *((CGFloat *)&v20 + 1), v21, v22);
  State.wrappedValue.setter();
  State.wrappedValue.getter();
  return State.wrappedValue.setter();
}

uint64_t sub_100017944(uint64_t a1, char a2, double a3, double a4)
{
  uint64_t v9 = (int *)type metadata accessor for RootView();
  __chkstk_darwin(v9);
  os_log_t v64 = (os_log_t)((char *)v61 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v12 = a1 + *(int *)(v11 + 32);
  char v13 = *(unsigned char *)v12;
  uint64_t v70 = v12;
  uint64_t v14 = *(void *)(v12 + 8);
  LOBYTE(v67) = v13;
  *((void *)&v67 + 1) = v14;
  sub_100006380(&qword_10006B5B8);
  State.wrappedValue.getter();
  int v65 = v69;
  LOBYTE(v67) = v13;
  *((void *)&v67 + 1) = v14;
  State.wrappedValue.getter();
  if (v69 == 4)
  {
    uint64_t v63 = v4;
    uint64_t v15 = a1 + v9[9];
    char v16 = *(unsigned char *)v15;
    uint64_t v17 = *(void *)(v15 + 8);
    LOBYTE(v67) = v16;
    *((void *)&v67 + 1) = v17;
    State.wrappedValue.getter();
    LOBYTE(v67) = v13;
    *((void *)&v67 + 1) = v14;
    State.wrappedValue.setter();
    uint64_t v18 = a1 + v9[13];
    uint64_t v19 = *(void *)(v18 + 16);
    long long v67 = *(_OWORD *)v18;
    uint64_t v68 = v19;
    sub_100006380(&qword_10006AF30);
    State.wrappedValue.getter();
    uint64_t v20 = *((void *)&v69 + 1);
    CGFloat v21 = (void *)(a1 + v9[12]);
    uint64_t v23 = v21[1];
    uint64_t v24 = v21[2];
    *(void *)&long long v67 = *v21;
    uint64_t v22 = v67;
    *((void *)&v67 + 1) = v23;
    uint64_t v68 = v24;
    swift_retain();
    State.wrappedValue.getter();
    *(void *)&long long v67 = v22;
    *((void *)&v67 + 1) = v23;
    uint64_t v68 = v24;
    v66[0] = v69;
    v66[1] = v20;
    State.wrappedValue.setter();
    swift_release();
    if (a2 == 3)
    {
      char v25 = 1;
    }
    else
    {
      LOBYTE(v67) = v13;
      *((void *)&v67 + 1) = v14;
      State.wrappedValue.getter();
      char v25 = v69;
    }
    os_log_t v32 = v64;
    double v33 = sub_100017F7C(v25, a3, a4);
    double v35 = v34;
    *(void *)&long long v67 = v22;
    *((void *)&v67 + 1) = v23;
    uint64_t v68 = v24;
    State.wrappedValue.getter();
    safeOffset(offset:size:containerSize:foreheadWindowRect:)(*(double *)&v69, *((CGFloat *)&v69 + 1), v33, v35, a3, a4, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    *(void *)&long long v67 = v22;
    *((void *)&v67 + 1) = v23;
    uint64_t v68 = v24;
    *(void *)&long long v69 = v36;
    *((void *)&v69 + 1) = v37;
    State.wrappedValue.setter();
    os_log_type_t v38 = static os_log_type_t.debug.getter();
    if (qword_10006AD90 != -1) {
      swift_once();
    }
    uint64_t v39 = qword_10006DF88;
    sub_10001D74C(a1, (uint64_t)v32, (uint64_t (*)(void))type metadata accessor for RootView);
    if (os_log_type_enabled(v39, v38))
    {
      os_log_t v64 = v39;
      uint64_t v40 = (uint8_t *)swift_slowAlloc();
      uint64_t v62 = swift_slowAlloc();
      v66[0] = v62;
      *(_DWORD *)uint64_t v40 = 136315138;
      v61[1] = v40 + 4;
      CGFloat v41 = (char *)v32 + v9[12];
      uint64_t v42 = *((void *)v41 + 2);
      long long v67 = *(_OWORD *)v41;
      uint64_t v68 = v42;
      State.wrappedValue.getter();
      long long v67 = v69;
      type metadata accessor for CGSize(0);
      uint64_t v43 = String.init<A>(describing:)();
      *(void *)&long long v67 = sub_10000E634(v43, v44, v66);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      sub_10001D7B4((uint64_t)v32, (uint64_t (*)(void))type metadata accessor for RootView);
      _os_log_impl((void *)&_mh_execute_header, v64, v38, "switchToState windowOffset: %s", v40, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      sub_10001D7B4((uint64_t)v32, (uint64_t (*)(void))type metadata accessor for RootView);
    }
  }
  else
  {
    LOBYTE(v67) = v13;
    *((void *)&v67 + 1) = v14;
    LOBYTE(v69) = a2;
    State.wrappedValue.setter();
    if (a2 == 4)
    {
      uint64_t v26 = a1 + v9[9];
      char v27 = *(unsigned char *)v26;
      uint64_t v28 = *(void *)(v26 + 8);
      LOBYTE(v67) = v27;
      *((void *)&v67 + 1) = v28;
      State.wrappedValue.getter();
      a2 = v69;
    }
    uint64_t v29 = a1 + v9[9];
    char v30 = *(unsigned char *)v29;
    uint64_t v31 = *(void *)(v29 + 8);
    LOBYTE(v67) = v30;
    *((void *)&v67 + 1) = v31;
    LOBYTE(v69) = a2;
    State.wrappedValue.setter();
  }
  char v45 = *(unsigned char *)v70;
  uint64_t v46 = *(void *)(v70 + 8);
  LOBYTE(v67) = *(unsigned char *)v70;
  *((void *)&v67 + 1) = v46;
  State.wrappedValue.getter();
  if (v69 != 3)
  {
    double v47 = 0.0;
    if ((v65 - 3) >= 2u)
    {
      sub_100017F7C(v65, a3, a4);
      double v49 = v48;
      LOBYTE(v67) = v45;
      *((void *)&v67 + 1) = v46;
      State.wrappedValue.getter();
      sub_100017F7C(v69, a3, a4);
      double v47 = v49 - v50;
    }
    uint64_t v51 = a1 + v9[12];
    uint64_t v52 = *(void *)(v51 + 16);
    long long v67 = *(_OWORD *)v51;
    uint64_t v68 = v52;
    sub_100006380(&qword_10006AF30);
    State.wrappedValue.getter();
    char v53 = (void *)(a1 + v9[14]);
    uint64_t v55 = v53[1];
    uint64_t v56 = v53[2];
    *(void *)&long long v67 = *v53;
    uint64_t v54 = v67;
    *((void *)&v67 + 1) = v55;
    uint64_t v68 = v56;
    State.wrappedValue.setter();
    sub_100012A5C(0.0, v47, a3, a4);
    *(void *)&long long v67 = v54;
    *((void *)&v67 + 1) = v55;
    uint64_t v68 = v56;
    long long v69 = 0uLL;
    State.wrappedValue.setter();
  }
  sub_100013294();
  char v57 = (uint64_t *)(a1 + v9[17]);
  uint64_t v58 = *v57;
  uint64_t v59 = v57[1];
  *(void *)&long long v67 = v58;
  *((void *)&v67 + 1) = v59;
  *(void *)&long long v69 = 0x3FF0000000000000;
  sub_100006380(&qword_10006B1D0);
  return State.wrappedValue.setter();
}

double sub_100017F7C(char a1, double a2, double a3)
{
  uint64_t v7 = sub_100006380(&qword_10006B198);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for RootView();
  uint64_t v11 = (char *)(v3 + *(int *)(v10 + 32));
  char v12 = *v11;
  uint64_t v13 = *((void *)v11 + 1);
  LOBYTE(v24) = v12;
  uint64_t v25 = v13;
  sub_100006380(&qword_10006B5B8);
  State.wrappedValue.getter();
  if (LOBYTE(v23)) {
    double v14 = 8.0;
  }
  else {
    double v14 = 16.0;
  }
  double v15 = sub_1000187A4(a2, a3) - v14;
  switch(a1)
  {
    case 2:
      sub_100018B88(a2, a3);
      a2 = v15;
      break;
    case 3:
      return a2;
    case 4:
      if (AXDeviceIsPad()) {
        a2 = 68.0;
      }
      else {
        a2 = 54.0;
      }
      break;
    default:
      char v16 = (uint64_t *)(v3 + *(int *)(v10 + 64));
      uint64_t v17 = *v16;
      uint64_t v18 = v16[1];
      uint64_t v24 = v17;
      uint64_t v25 = v18;
      sub_100006380(&qword_10006B1D0);
      State.wrappedValue.getter();
      double v19 = v23;
      sub_10000E2FC((uint64_t)v9);
      uint64_t v20 = type metadata accessor for DynamicTypeSize();
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v9, 0, 1, v20);
      titleAndTextHeight(textHeight:dynamicTypeSize:)((uint64_t)v9, v19);
      sub_1000067B8((uint64_t)v9, &qword_10006B198);
      a2 = v15;
      break;
  }
  return a2;
}

uint64_t sub_100018254(double a1, double a2, uint64_t a3, char a4)
{
  type metadata accessor for RootView();
  sub_100006380(&qword_10006AF30);
  State.wrappedValue.getter();
  sub_10002DC0C(a4, v8, v9, a1, a2);
  State.wrappedValue.setter();
  sub_100006380(&qword_10006B5B8);
  State.wrappedValue.setter();
  sub_100006380(&qword_10006B1D0);
  return State.wrappedValue.setter();
}

uint64_t sub_1000183A0()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for RootView();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  __chkstk_darwin(v2);
  double v5 = (char *)&aBlock - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  static os_log_type_t.debug.getter();
  if (qword_10006AD90 != -1) {
    swift_once();
  }
  os_log(_:dso:log:_:_:)();
  uint64_t v6 = *(int *)(v2 + 76);
  long long aBlock = *(_OWORD *)(v1 + v6);
  sub_100006380(&qword_10006B630);
  State.wrappedValue.getter();
  id v7 = v19;
  [v19 invalidate];

  double v8 = self;
  sub_10001D74C(v1, (uint64_t)&aBlock - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(void))type metadata accessor for RootView);
  unint64_t v9 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v10 = swift_allocObject();
  sub_10001C508((uint64_t)v5, v10 + v9);
  uint64_t v17 = sub_10001D678;
  uint64_t v18 = v10;
  *(void *)&long long aBlock = _NSConcreteStackBlock;
  *((void *)&aBlock + 1) = 1107296256;
  double v15 = sub_1000315A8;
  char v16 = &unk_100066570;
  uint64_t v11 = _Block_copy(&aBlock);
  swift_release();
  id v12 = [v8 scheduledTimerWithTimeInterval:0 repeats:v11 block:30.0];
  _Block_release(v11);
  long long aBlock = *(_OWORD *)(v1 + v6);
  id v19 = v12;
  return State.wrappedValue.setter();
}

uint64_t sub_100018618(double a1, double a2)
{
  type metadata accessor for RootView();
  swift_retain();
  sub_100006380(&qword_10006AF30);
  State.wrappedValue.getter();
  State.wrappedValue.setter();
  swift_release();
  State.wrappedValue.getter();
  sub_100006380(&qword_10006B5B8);
  State.wrappedValue.getter();
  double v4 = sub_100017F7C(SLOBYTE(v7), a1, a2);
  safeOffset(offset:size:containerSize:foreheadWindowRect:)(v7, v8, v4, v5, a1, a2, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  return State.wrappedValue.setter();
}

double sub_1000187A4(double a1, double a2)
{
  uint64_t v4 = type metadata accessor for DynamicTypeSize();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  double v7 = (char *)&v46 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100006380(&qword_10006B198);
  uint64_t v9 = __chkstk_darwin(v8 - 8);
  uint64_t v11 = (char *)&v46 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v13 = (char *)&v46 - v12;
  if (AXDeviceIsPad())
  {
    sub_10000E2FC((uint64_t)v13);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v5 + 56))(v13, 0, 1, v4);
    sub_100006754((uint64_t)v13, (uint64_t)v11, &qword_10006B198);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v11, 1, v4) == 1)
    {
      sub_1000067B8((uint64_t)v11, &qword_10006B198);
      sub_1000067B8((uint64_t)v13, &qword_10006B198);
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v7, v11, v4);
      if (qword_10006AD98 != -1) {
        swift_once();
      }
      sub_10000874C(v4, (uint64_t)accessibilityLayoutTextSize);
      sub_10001D6E8((unint64_t *)&qword_10006B1A0, (void (*)(uint64_t))&type metadata accessor for DynamicTypeSize);
      char v24 = dispatch thunk of static Comparable.< infix(_:_:)();
      (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
      sub_1000067B8((uint64_t)v13, &qword_10006B198);
      if ((v24 & 1) == 0)
      {
        id v36 = [self mainScreen];
        [v36 bounds];
        CGFloat v38 = v37;
        CGFloat v40 = v39;
        CGFloat v42 = v41;
        CGFloat v44 = v43;

        v49.origin.CGFloat x = v38;
        v49.origin.CGFloat y = v40;
        v49.size.CGFloat width = v42;
        v49.size.CGFloat height = v44;
        double Width = CGRectGetWidth(v49);
        goto LABEL_13;
      }
    }
    int IsPadMiniIdiom = AXDeviceIsPadMiniIdiom();
    id v26 = [self mainScreen];
    [v26 bounds];
    CGFloat v28 = v27;
    CGFloat v30 = v29;
    CGFloat v32 = v31;
    CGFloat v34 = v33;

    v48.origin.CGFloat x = v28;
    v48.origin.CGFloat y = v30;
    v48.size.CGFloat width = v32;
    v48.size.CGFloat height = v34;
    double Width = CGRectGetWidth(v48);
    if (!IsPadMiniIdiom || a1 >= a2) {
      goto LABEL_11;
    }
LABEL_13:
    double v35 = 0.84;
    return Width * v35;
  }
  if (a2 < a1)
  {
    id v14 = [self mainScreen];
    [v14 bounds];
    CGFloat v16 = v15;
    CGFloat v18 = v17;
    CGFloat v20 = v19;
    CGFloat v22 = v21;

    v47.origin.CGFloat x = v16;
    v47.origin.CGFloat y = v18;
    v47.size.CGFloat width = v20;
    v47.size.CGFloat height = v22;
    double Width = CGRectGetWidth(v47);
LABEL_11:
    double v35 = 0.5;
    return Width * v35;
  }
  return a1;
}

uint64_t sub_100018B88(double a1, double a2)
{
  uint64_t v5 = sub_100006380(&qword_10006B198);
  __chkstk_darwin(v5 - 8);
  double v7 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = (int *)type metadata accessor for RootView();
  uint64_t v9 = (uint64_t *)(v2 + v8[16]);
  uint64_t v10 = *v9;
  uint64_t v11 = v9[1];
  *(void *)&long long v23 = v10;
  *((void *)&v23 + 1) = v11;
  sub_100006380(&qword_10006B1D0);
  State.wrappedValue.getter();
  double v12 = v25;
  sub_10000E2FC((uint64_t)v7);
  uint64_t v13 = type metadata accessor for DynamicTypeSize();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v7, 0, 1, v13);
  titleAndTextHeight(textHeight:dynamicTypeSize:)((uint64_t)v7, v12);
  sub_1000067B8((uint64_t)v7, &qword_10006B198);
  id v14 = (long long *)(v2 + v8[12]);
  uint64_t v15 = *((void *)v14 + 2);
  long long v23 = *v14;
  uint64_t v24 = v15;
  sub_100006380(&qword_10006AF30);
  State.wrappedValue.getter();
  double v16 = v25;
  CGFloat v17 = v26;
  CGFloat v18 = (void *)(v2 + v8[15]);
  uint64_t v20 = v18[1];
  uint64_t v21 = v18[2];
  *(void *)&long long v23 = *v18;
  uint64_t v19 = v23;
  *((void *)&v23 + 1) = v20;
  uint64_t v24 = v21;
  State.wrappedValue.getter();
  safeOffset(offset:size:containerSize:foreheadWindowRect:)(v16, v17, v25, v26, a1, a2, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  *(void *)&long long v23 = v19;
  *((void *)&v23 + 1) = v20;
  uint64_t v24 = v21;
  return State.wrappedValue.getter();
}

void sub_100018DAC()
{
  static os_log_type_t.debug.getter();
  if (qword_10006AD90 != -1) {
    swift_once();
  }
  os_log(_:dso:log:_:_:)();
  if (qword_10006AE28 != -1) {
    swift_once();
  }
  uint64_t v0 = (unsigned char *)(static AXLTCaptionsProvider.shared + OBJC_IVAR___AXLTCaptionsProvider_isTranscribing);
  swift_beginAccess();
  if (*v0 == 1)
  {
    AXLTCaptionsProvider.stopTranscribing()();
    type metadata accessor for RootView();
    sub_100006380(&qword_10006B638);
    State.wrappedValue.setter();
    id v1 = [self defaultCenter];
    if (qword_10006ADA0 != -1) {
      swift_once();
    }
    [v1 postNotificationName:qword_10006DFA8 object:0 userInfo:0];
  }
}

id sub_100018F70(uint64_t a1, uint64_t a2)
{
  static os_log_type_t.debug.getter();
  if (qword_10006AD90 != -1) {
    swift_once();
  }
  os_log(_:dso:log:_:_:)();
  uint64_t v3 = type metadata accessor for RootView();
  sub_100006380(&qword_10006B5B8);
  id result = (id)State.wrappedValue.getter();
  if (v5 != 4)
  {
    __chkstk_darwin(result);
    static Animation.default.getter();
    withAnimation<A>(_:_:)();
    swift_release();
    sub_100013294();
    sub_1000183A0();
    return [*(id *)(a2 + *(int *)(v3 + 92)) idleSleepTimerDisabled:0];
  }
  return result;
}

uint64_t sub_1000190FC@<X0>(uint64_t *a1@<X8>)
{
  *a1 = swift_getKeyPath();
  sub_100006380(&qword_10006B218);
  swift_storeEnumTagMultiPayload();
  uint64_t v2 = (int *)type metadata accessor for RootView();
  uint64_t v3 = (uint64_t *)((char *)a1 + v2[5]);
  *uint64_t v3 = swift_getKeyPath();
  sub_100006380(&qword_10006B088);
  swift_storeEnumTagMultiPayload();
  uint64_t v4 = (uint64_t *)((char *)a1 + v2[6]);
  *uint64_t v4 = swift_getKeyPath();
  swift_storeEnumTagMultiPayload();
  char v5 = (uint64_t *)((char *)a1 + v2[7]);
  *char v5 = swift_getKeyPath();
  sub_100006380(&qword_10006B418);
  swift_storeEnumTagMultiPayload();
  uint64_t v6 = (char *)a1 + v2[8];
  State.init(wrappedValue:)();
  char *v6 = v30;
  *((void *)v6 + 1) = *((void *)&v30 + 1);
  double v7 = (char *)a1 + v2[9];
  State.init(wrappedValue:)();
  char *v7 = v30;
  *((void *)v7 + 1) = *((void *)&v30 + 1);
  uint64_t v8 = v2[10];
  State.init(wrappedValue:)();
  *(_OWORD *)((char *)a1 + v8) = v30;
  uint64_t v9 = (char *)a1 + v2[11];
  State.init(wrappedValue:)();
  *(_OWORD *)uint64_t v9 = v30;
  *((void *)v9 + 2) = v31;
  uint64_t v10 = (char *)a1 + v2[12];
  type metadata accessor for CGSize(0);
  State.init(wrappedValue:)();
  *(_OWORD *)uint64_t v10 = v30;
  *((void *)v10 + 2) = v31;
  uint64_t v11 = (char *)a1 + v2[13];
  State.init(wrappedValue:)();
  *(_OWORD *)uint64_t v11 = v30;
  *((void *)v11 + 2) = v31;
  double v12 = (char *)a1 + v2[14];
  State.init(wrappedValue:)();
  *(_OWORD *)double v12 = v30;
  *((void *)v12 + 2) = v31;
  uint64_t v13 = (char *)a1 + v2[15];
  State.init(wrappedValue:)();
  *(_OWORD *)uint64_t v13 = v30;
  *((void *)v13 + 2) = v31;
  id v14 = (_OWORD *)((char *)a1 + v2[16]);
  State.init(wrappedValue:)();
  *id v14 = v30;
  uint64_t v15 = (_OWORD *)((char *)a1 + v2[17]);
  State.init(wrappedValue:)();
  *uint64_t v15 = v30;
  double v16 = (char *)a1 + v2[18];
  State.init(wrappedValue:)();
  *(_OWORD *)double v16 = v30;
  *((void *)v16 + 2) = v31;
  uint64_t v17 = v2[19];
  sub_100006380(&qword_10006B428);
  State.init(wrappedValue:)();
  *(_OWORD *)((char *)a1 + v17) = v30;
  CGFloat v18 = (char *)a1 + v2[20];
  State.init(wrappedValue:)();
  *CGFloat v18 = v30;
  *((void *)v18 + 1) = *((void *)&v30 + 1);
  uint64_t v19 = (uint64_t *)((char *)a1 + v2[21]);
  objc_msgSend(objc_allocWithZone((Class)type metadata accessor for ForeheadWindow()), "init", 0, 0);
  sub_10001D6E8(&qword_10006B430, (void (*)(uint64_t))type metadata accessor for ForeheadWindow);
  *uint64_t v19 = ObservedObject.init(wrappedValue:)();
  v19[1] = v20;
  uint64_t v21 = v2[22];
  State.init(wrappedValue:)();
  *(_OWORD *)((char *)a1 + v21) = v30;
  uint64_t v22 = v2[23];
  *(uint64_t *)((char *)a1 + v22) = (uint64_t)objc_msgSend(objc_allocWithZone((Class)LCSystemUtilities), "init", 0);
  uint64_t v23 = v2[24];
  if (qword_10006AE28 != -1) {
    swift_once();
  }
  uint64_t v24 = (uint64_t *)((char *)a1 + v23);
  double v25 = (void *)static AXLTCaptionsProvider.shared;
  type metadata accessor for AXLTCaptionsProvider();
  sub_10001D6E8((unint64_t *)&qword_10006B438, (void (*)(uint64_t))type metadata accessor for AXLTCaptionsProvider);
  id v26 = v25;
  *uint64_t v24 = ObservedObject.init(wrappedValue:)();
  v24[1] = v27;
  CGFloat v28 = (char *)a1 + v2[25];
  sub_100006380(&qword_10006B440);
  uint64_t result = State.init(wrappedValue:)();
  *CGFloat v28 = v30;
  *((void *)v28 + 1) = *((void *)&v30 + 1);
  return result;
}

uint64_t sub_1000195F0@<X0>(uint64_t a1@<X0>, uint64_t (**a2)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)@<X8>)
{
  uint64_t v4 = *(void *)(a1 - 8);
  uint64_t v5 = *(void *)(v4 + 64);
  __chkstk_darwin(a1 - 8);
  sub_10001D74C(v2, (uint64_t)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(void))type metadata accessor for RootView);
  unint64_t v6 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v7 = swift_allocObject();
  uint64_t result = sub_10001C508((uint64_t)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v7 + v6);
  *a2 = sub_10001C56C;
  a2[1] = (uint64_t (*)@<X0>(uint64_t@<X0>, uint64_t@<X8>))v7;
  return result;
}

uint64_t sub_1000196F0()
{
  return EnvironmentValues.verticalSizeClass.getter();
}

uint64_t sub_100019714(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_100019768(a1, a2, a3, a4, (uint64_t (*)(char *))&EnvironmentValues.verticalSizeClass.setter);
}

uint64_t sub_10001972C()
{
  return EnvironmentValues.horizontalSizeClass.getter();
}

uint64_t sub_100019750(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_100019768(a1, a2, a3, a4, (uint64_t (*)(char *))&EnvironmentValues.horizontalSizeClass.setter);
}

uint64_t sub_100019768(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(char *))
{
  uint64_t v7 = sub_100006380(&qword_10006B038);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100006754(a1, (uint64_t)v9, &qword_10006B038);
  return a5(v9);
}

uint64_t sub_10001980C()
{
  return EnvironmentValues.layoutDirection.getter();
}

uint64_t sub_100019830(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for LayoutDirection();
  double v3 = __chkstk_darwin(v2);
  (*(void (**)(char *, uint64_t, double))(v5 + 16))((char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v3);
  return EnvironmentValues.layoutDirection.setter();
}

unint64_t _s19LiveTranscriptionUI11WindowStateO8rawValueACSgSi_tcfC_0(unint64_t result)
{
  if (result >= 5) {
    return 5;
  }
  return result;
}

unint64_t sub_10001990C()
{
  unint64_t result = qword_10006B420;
  if (!qword_10006B420)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006B420);
  }
  return result;
}

unsigned char *initializeBufferWithCopyOfBuffer for ButtonType(unsigned char *result, unsigned char *a2)
{
  void *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for ButtonType(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for WindowState(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x100019AC8);
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

uint64_t sub_100019AF0(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_100019AF8(unsigned char *result, char a2)
{
  void *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for WindowState()
{
  return &type metadata for WindowState;
}

uint64_t type metadata accessor for RootView()
{
  uint64_t result = qword_10006B4A8;
  if (!qword_10006B4A8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_100019B64()
{
  return EnvironmentValues.verticalSizeClass.getter();
}

uint64_t sub_100019B88(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_100019768(a1, a2, a3, a4, (uint64_t (*)(char *))&EnvironmentValues.verticalSizeClass.setter);
}

uint64_t sub_100019BB4()
{
  return EnvironmentValues.horizontalSizeClass.getter();
}

uint64_t sub_100019BD8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_100019768(a1, a2, a3, a4, (uint64_t (*)(char *))&EnvironmentValues.horizontalSizeClass.setter);
}

uint64_t sub_100019C04()
{
  return EnvironmentValues.layoutDirection.getter();
}

uint64_t *sub_100019C2C(uint64_t *a1, uint64_t *a2, int *a3)
{
  unsigned int v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *a1 = *a2;
    unsigned int v4 = (uint64_t *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    sub_100006380(&qword_10006B218);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = type metadata accessor for DynamicTypeSize();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(v4, a2, v7);
    }
    else
    {
      *unsigned int v4 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v9 = a3[5];
    uint64_t v10 = (uint64_t *)((char *)v4 + v9);
    uint64_t v11 = (uint64_t *)((char *)a2 + v9);
    sub_100006380(&qword_10006B088);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v12 = type metadata accessor for UserInterfaceSizeClass();
      uint64_t v13 = *(void *)(v12 - 8);
      if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12))
      {
        uint64_t v14 = sub_100006380(&qword_10006B038);
        memcpy(v10, v11, *(void *)(*(void *)(v14 - 8) + 64));
      }
      else
      {
        (*(void (**)(void *, void *, uint64_t))(v13 + 16))(v10, v11, v12);
        (*(void (**)(void *, void, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
      }
    }
    else
    {
      *uint64_t v10 = *v11;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v15 = a3[6];
    double v16 = (uint64_t *)((char *)v4 + v15);
    uint64_t v17 = (uint64_t *)((char *)a2 + v15);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v18 = type metadata accessor for UserInterfaceSizeClass();
      uint64_t v19 = *(void *)(v18 - 8);
      if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v19 + 48))(v17, 1, v18))
      {
        uint64_t v20 = sub_100006380(&qword_10006B038);
        memcpy(v16, v17, *(void *)(*(void *)(v20 - 8) + 64));
      }
      else
      {
        (*(void (**)(void *, void *, uint64_t))(v19 + 16))(v16, v17, v18);
        (*(void (**)(void *, void, uint64_t, uint64_t))(v19 + 56))(v16, 0, 1, v18);
      }
    }
    else
    {
      *double v16 = *v17;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v21 = a3[7];
    uint64_t v22 = (uint64_t *)((char *)v4 + v21);
    uint64_t v23 = (uint64_t *)((char *)a2 + v21);
    sub_100006380(&qword_10006B418);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v24 = type metadata accessor for LayoutDirection();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v24 - 8) + 16))(v22, v23, v24);
    }
    else
    {
      *uint64_t v22 = *v23;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v25 = a3[8];
    uint64_t v26 = a3[9];
    uint64_t v27 = (char *)v4 + v25;
    CGFloat v28 = (char *)a2 + v25;
    *uint64_t v27 = *v28;
    *((void *)v27 + 1) = *((void *)v28 + 1);
    double v29 = (char *)v4 + v26;
    long long v30 = (char *)a2 + v26;
    *double v29 = *v30;
    *((void *)v29 + 1) = *((void *)v30 + 1);
    uint64_t v31 = a3[10];
    uint64_t v32 = a3[11];
    double v33 = (uint64_t *)((char *)v4 + v31);
    CGFloat v34 = (uint64_t *)((char *)a2 + v31);
    uint64_t v93 = v34[1];
    *double v33 = *v34;
    v33[1] = v93;
    double v35 = (uint64_t *)((char *)v4 + v32);
    id v36 = (uint64_t *)((char *)a2 + v32);
    uint64_t v37 = v36[1];
    *double v35 = *v36;
    v35[1] = v37;
    v35[2] = v36[2];
    uint64_t v38 = a3[12];
    uint64_t v39 = a3[13];
    CGFloat v40 = (char *)v4 + v38;
    double v41 = (char *)a2 + v38;
    *(_OWORD *)CGFloat v40 = *(_OWORD *)v41;
    *((void *)v40 + 2) = *((void *)v41 + 2);
    CGFloat v42 = (char *)v4 + v39;
    double v43 = (char *)a2 + v39;
    *(_OWORD *)CGFloat v42 = *(_OWORD *)v43;
    *((void *)v42 + 2) = *((void *)v43 + 2);
    uint64_t v44 = a3[14];
    uint64_t v45 = a3[15];
    uint64_t v46 = (char *)v4 + v44;
    CGRect v47 = (char *)a2 + v44;
    *(_OWORD *)uint64_t v46 = *(_OWORD *)v47;
    *((void *)v46 + 2) = *((void *)v47 + 2);
    CGRect v48 = (char *)v4 + v45;
    CGRect v49 = (char *)a2 + v45;
    *(_OWORD *)CGRect v48 = *(_OWORD *)v49;
    *((void *)v48 + 2) = *((void *)v49 + 2);
    uint64_t v50 = a3[16];
    uint64_t v51 = a3[17];
    uint64_t v52 = (uint64_t *)((char *)v4 + v50);
    char v53 = (uint64_t *)((char *)a2 + v50);
    uint64_t v91 = v53[1];
    *uint64_t v52 = *v53;
    v52[1] = v91;
    uint64_t v54 = (uint64_t *)((char *)v4 + v51);
    uint64_t v55 = (uint64_t *)((char *)a2 + v51);
    uint64_t v92 = v55[1];
    *uint64_t v54 = *v55;
    v54[1] = v92;
    uint64_t v56 = a3[18];
    uint64_t v57 = a3[19];
    uint64_t v58 = (char *)v4 + v56;
    uint64_t v59 = (char *)a2 + v56;
    *(_OWORD *)uint64_t v58 = *(_OWORD *)v59;
    *((void *)v58 + 2) = *((void *)v59 + 2);
    uint64_t v60 = (uint64_t *)((char *)v4 + v57);
    uint64_t v61 = (char *)a2 + v57;
    uint64_t v62 = *(void **)v61;
    uint64_t v90 = *((void *)v61 + 1);
    void *v60 = *(void *)v61;
    v60[1] = v90;
    uint64_t v63 = a3[20];
    uint64_t v64 = a3[21];
    int v65 = (char *)v4 + v63;
    double v66 = (char *)a2 + v63;
    *int v65 = *v66;
    *((void *)v65 + 1) = *((void *)v66 + 1);
    long long v67 = (uint64_t *)((char *)v4 + v64);
    uint64_t v68 = (uint64_t *)((char *)a2 + v64);
    long long v69 = (void *)v68[1];
    void *v67 = *v68;
    v67[1] = v69;
    uint64_t v70 = a3[22];
    uint64_t v71 = a3[23];
    CGFloat v72 = (uint64_t *)((char *)v4 + v70);
    CGFloat v73 = (char *)a2 + v70;
    uint64_t v74 = *(void **)v73;
    uint64_t v75 = *((void *)v73 + 1);
    void *v72 = *(void *)v73;
    v72[1] = v75;
    uint64_t v76 = *(void **)((char *)a2 + v71);
    *(uint64_t *)((char *)v4 + v71) = (uint64_t)v76;
    uint64_t v77 = a3[24];
    uint64_t v78 = a3[25];
    uint64_t v79 = (uint64_t *)((char *)v4 + v77);
    CGSize v80 = (uint64_t *)((char *)a2 + v77);
    uint64_t v81 = (void *)v80[1];
    *uint64_t v79 = *v80;
    v79[1] = v81;
    uint64_t v82 = (char *)v4 + v78;
    uint64_t v83 = (char *)a2 + v78;
    char *v82 = *v83;
    *((void *)v82 + 1) = *((void *)v83 + 1);
    swift_retain();
    swift_retain();
    swift_retain();
    swift_bridgeObjectRetain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    id v84 = v62;
    swift_retain();
    swift_retain();
    id v85 = v69;
    id v86 = v74;
    swift_retain();
    id v87 = v76;
    id v88 = v81;
  }
  swift_retain();
  return v4;
}

uint64_t sub_10001A294(uint64_t a1, int *a2)
{
  sub_100006380(&qword_10006B218);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v4 = type metadata accessor for DynamicTypeSize();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  }
  else
  {
    swift_release();
  }
  uint64_t v5 = a1 + a2[5];
  sub_100006380(&qword_10006B088);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = type metadata accessor for UserInterfaceSizeClass();
    uint64_t v7 = *(void *)(v6 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6)) {
      (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v5, v6);
    }
  }
  else
  {
    swift_release();
  }
  uint64_t v8 = a1 + a2[6];
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v9 = type metadata accessor for UserInterfaceSizeClass();
    uint64_t v10 = *(void *)(v9 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9)) {
      (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v8, v9);
    }
  }
  else
  {
    swift_release();
  }
  uint64_t v11 = a1 + a2[7];
  sub_100006380(&qword_10006B418);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v12 = type metadata accessor for LayoutDirection();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v12 - 8) + 8))(v11, v12);
  }
  else
  {
    swift_release();
  }
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  swift_release();
  swift_release();

  swift_release();

  return swift_release();
}

void *sub_10001A648(void *a1, void *a2, int *a3)
{
  sub_100006380(&qword_10006B218);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = type metadata accessor for DynamicTypeSize();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  }
  else
  {
    *a1 = *a2;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)((char *)a1 + v7);
  uint64_t v9 = (void *)((char *)a2 + v7);
  sub_100006380(&qword_10006B088);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v10 = type metadata accessor for UserInterfaceSizeClass();
    uint64_t v11 = *(void *)(v10 - 8);
    if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
    {
      uint64_t v12 = sub_100006380(&qword_10006B038);
      memcpy(v8, v9, *(void *)(*(void *)(v12 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, void *, uint64_t))(v11 + 16))(v8, v9, v10);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
    }
  }
  else
  {
    void *v8 = *v9;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v13 = a3[6];
  uint64_t v14 = (void *)((char *)a1 + v13);
  uint64_t v15 = (void *)((char *)a2 + v13);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v16 = type metadata accessor for UserInterfaceSizeClass();
    uint64_t v17 = *(void *)(v16 - 8);
    if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v17 + 48))(v15, 1, v16))
    {
      uint64_t v18 = sub_100006380(&qword_10006B038);
      memcpy(v14, v15, *(void *)(*(void *)(v18 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, void *, uint64_t))(v17 + 16))(v14, v15, v16);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v17 + 56))(v14, 0, 1, v16);
    }
  }
  else
  {
    *uint64_t v14 = *v15;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v19 = a3[7];
  uint64_t v20 = (void *)((char *)a1 + v19);
  uint64_t v21 = (void *)((char *)a2 + v19);
  sub_100006380(&qword_10006B418);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v22 = type metadata accessor for LayoutDirection();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v22 - 8) + 16))(v20, v21, v22);
  }
  else
  {
    void *v20 = *v21;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v23 = a3[8];
  uint64_t v24 = a3[9];
  uint64_t v25 = (char *)a1 + v23;
  uint64_t v26 = (char *)a2 + v23;
  char *v25 = *v26;
  *((void *)v25 + 1) = *((void *)v26 + 1);
  uint64_t v27 = (char *)a1 + v24;
  CGFloat v28 = (char *)a2 + v24;
  *uint64_t v27 = *v28;
  *((void *)v27 + 1) = *((void *)v28 + 1);
  uint64_t v29 = a3[10];
  uint64_t v30 = a3[11];
  uint64_t v31 = (void *)((char *)a1 + v29);
  uint64_t v32 = (void *)((char *)a2 + v29);
  uint64_t v91 = v32[1];
  void *v31 = *v32;
  v31[1] = v91;
  double v33 = (void *)((char *)a1 + v30);
  CGFloat v34 = (void *)((char *)a2 + v30);
  uint64_t v35 = v34[1];
  *double v33 = *v34;
  v33[1] = v35;
  v33[2] = v34[2];
  uint64_t v36 = a3[12];
  uint64_t v37 = a3[13];
  uint64_t v38 = (char *)a1 + v36;
  uint64_t v39 = (char *)a2 + v36;
  *(_OWORD *)uint64_t v38 = *(_OWORD *)v39;
  *((void *)v38 + 2) = *((void *)v39 + 2);
  CGFloat v40 = (char *)a1 + v37;
  double v41 = (char *)a2 + v37;
  *(_OWORD *)CGFloat v40 = *(_OWORD *)v41;
  *((void *)v40 + 2) = *((void *)v41 + 2);
  uint64_t v42 = a3[14];
  uint64_t v43 = a3[15];
  uint64_t v44 = (char *)a1 + v42;
  uint64_t v45 = (char *)a2 + v42;
  *(_OWORD *)uint64_t v44 = *(_OWORD *)v45;
  *((void *)v44 + 2) = *((void *)v45 + 2);
  uint64_t v46 = (char *)a1 + v43;
  CGRect v47 = (char *)a2 + v43;
  *(_OWORD *)uint64_t v46 = *(_OWORD *)v47;
  *((void *)v46 + 2) = *((void *)v47 + 2);
  uint64_t v48 = a3[16];
  uint64_t v49 = a3[17];
  uint64_t v50 = (void *)((char *)a1 + v48);
  uint64_t v51 = (void *)((char *)a2 + v48);
  uint64_t v89 = v51[1];
  *uint64_t v50 = *v51;
  v50[1] = v89;
  uint64_t v52 = (void *)((char *)a1 + v49);
  char v53 = (void *)((char *)a2 + v49);
  uint64_t v90 = v53[1];
  *uint64_t v52 = *v53;
  v52[1] = v90;
  uint64_t v54 = a3[18];
  uint64_t v55 = a3[19];
  uint64_t v56 = (char *)a1 + v54;
  uint64_t v57 = (char *)a2 + v54;
  *(_OWORD *)uint64_t v56 = *(_OWORD *)v57;
  *((void *)v56 + 2) = *((void *)v57 + 2);
  uint64_t v58 = (void *)((char *)a1 + v55);
  uint64_t v59 = (char *)a2 + v55;
  uint64_t v60 = *(void **)v59;
  uint64_t v88 = *((void *)v59 + 1);
  void *v58 = *(void *)v59;
  v58[1] = v88;
  uint64_t v61 = a3[20];
  uint64_t v62 = a3[21];
  uint64_t v63 = (char *)a1 + v61;
  uint64_t v64 = (char *)a2 + v61;
  *uint64_t v63 = *v64;
  *((void *)v63 + 1) = *((void *)v64 + 1);
  int v65 = (void *)((char *)a1 + v62);
  double v66 = (void *)((char *)a2 + v62);
  long long v67 = (void *)v66[1];
  *int v65 = *v66;
  v65[1] = v67;
  uint64_t v68 = a3[22];
  uint64_t v69 = a3[23];
  uint64_t v70 = (void *)((char *)a1 + v68);
  uint64_t v71 = (char *)a2 + v68;
  CGFloat v72 = *(void **)v71;
  uint64_t v73 = *((void *)v71 + 1);
  *uint64_t v70 = *(void *)v71;
  v70[1] = v73;
  uint64_t v74 = *(void **)((char *)a2 + v69);
  *(void *)((char *)a1 + v69) = v74;
  uint64_t v75 = a3[24];
  uint64_t v76 = a3[25];
  uint64_t v77 = (void *)((char *)a1 + v75);
  uint64_t v78 = (void *)((char *)a2 + v75);
  uint64_t v79 = (void *)v78[1];
  void *v77 = *v78;
  v77[1] = v79;
  CGSize v80 = (char *)a1 + v76;
  uint64_t v81 = (char *)a2 + v76;
  char *v80 = *v81;
  *((void *)v80 + 1) = *((void *)v81 + 1);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  id v82 = v60;
  swift_retain();
  swift_retain();
  id v83 = v67;
  id v84 = v72;
  swift_retain();
  id v85 = v74;
  id v86 = v79;
  swift_retain();
  return a1;
}

void *sub_10001AC64(void *a1, void *a2, int *a3)
{
  if (a1 != a2)
  {
    sub_1000067B8((uint64_t)a1, &qword_10006B218);
    sub_100006380(&qword_10006B218);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = type metadata accessor for DynamicTypeSize();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v7 = a3[5];
    uint64_t v8 = (void *)((char *)a1 + v7);
    uint64_t v9 = (void *)((char *)a2 + v7);
    sub_1000067B8((uint64_t)a1 + v7, &qword_10006B088);
    sub_100006380(&qword_10006B088);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v10 = type metadata accessor for UserInterfaceSizeClass();
      uint64_t v11 = *(void *)(v10 - 8);
      if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
      {
        uint64_t v12 = sub_100006380(&qword_10006B038);
        memcpy(v8, v9, *(void *)(*(void *)(v12 - 8) + 64));
      }
      else
      {
        (*(void (**)(void *, void *, uint64_t))(v11 + 16))(v8, v9, v10);
        (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
      }
    }
    else
    {
      void *v8 = *v9;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v13 = a3[6];
    uint64_t v14 = (void *)((char *)a1 + v13);
    uint64_t v15 = (void *)((char *)a2 + v13);
    sub_1000067B8((uint64_t)a1 + v13, &qword_10006B088);
    sub_100006380(&qword_10006B088);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v16 = type metadata accessor for UserInterfaceSizeClass();
      uint64_t v17 = *(void *)(v16 - 8);
      if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v17 + 48))(v15, 1, v16))
      {
        uint64_t v18 = sub_100006380(&qword_10006B038);
        memcpy(v14, v15, *(void *)(*(void *)(v18 - 8) + 64));
      }
      else
      {
        (*(void (**)(void *, void *, uint64_t))(v17 + 16))(v14, v15, v16);
        (*(void (**)(void *, void, uint64_t, uint64_t))(v17 + 56))(v14, 0, 1, v16);
      }
    }
    else
    {
      *uint64_t v14 = *v15;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v19 = a3[7];
    uint64_t v20 = (void *)((char *)a1 + v19);
    uint64_t v21 = (void *)((char *)a2 + v19);
    sub_1000067B8((uint64_t)a1 + v19, &qword_10006B418);
    sub_100006380(&qword_10006B418);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v22 = type metadata accessor for LayoutDirection();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v22 - 8) + 16))(v20, v21, v22);
    }
    else
    {
      void *v20 = *v21;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v23 = a3[8];
  uint64_t v24 = (char *)a1 + v23;
  uint64_t v25 = (char *)a2 + v23;
  *uint64_t v24 = *v25;
  *((void *)v24 + 1) = *((void *)v25 + 1);
  swift_retain();
  swift_release();
  uint64_t v26 = a3[9];
  uint64_t v27 = (char *)a1 + v26;
  CGFloat v28 = (char *)a2 + v26;
  *uint64_t v27 = *v28;
  *((void *)v27 + 1) = *((void *)v28 + 1);
  swift_retain();
  swift_release();
  uint64_t v29 = a3[10];
  uint64_t v30 = (void *)((char *)a1 + v29);
  uint64_t v31 = (void *)((char *)a2 + v29);
  *uint64_t v30 = *v31;
  v30[1] = v31[1];
  swift_retain();
  swift_release();
  uint64_t v32 = a3[11];
  double v33 = (void *)((char *)a1 + v32);
  CGFloat v34 = (char *)a2 + v32;
  *double v33 = *(void *)((char *)a2 + v32);
  v33[1] = *(void *)((char *)a2 + v32 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v33[2] = *((void *)v34 + 2);
  swift_retain();
  swift_release();
  uint64_t v35 = a3[12];
  uint64_t v36 = (void *)((char *)a1 + v35);
  uint64_t v37 = (void *)((char *)a2 + v35);
  *uint64_t v36 = *v37;
  v36[1] = v37[1];
  v36[2] = v37[2];
  swift_retain();
  swift_release();
  uint64_t v38 = a3[13];
  uint64_t v39 = (void *)((char *)a1 + v38);
  CGFloat v40 = (void *)((char *)a2 + v38);
  *uint64_t v39 = *v40;
  v39[1] = v40[1];
  v39[2] = v40[2];
  swift_retain();
  swift_release();
  uint64_t v41 = a3[14];
  uint64_t v42 = (void *)((char *)a1 + v41);
  uint64_t v43 = (void *)((char *)a2 + v41);
  void *v42 = *v43;
  v42[1] = v43[1];
  v42[2] = v43[2];
  swift_retain();
  swift_release();
  uint64_t v44 = a3[15];
  uint64_t v45 = (void *)((char *)a1 + v44);
  uint64_t v46 = (void *)((char *)a2 + v44);
  *uint64_t v45 = *v46;
  v45[1] = v46[1];
  v45[2] = v46[2];
  swift_retain();
  swift_release();
  uint64_t v47 = a3[16];
  uint64_t v48 = (void *)((char *)a1 + v47);
  uint64_t v49 = (void *)((char *)a2 + v47);
  *uint64_t v48 = *v49;
  v48[1] = v49[1];
  swift_retain();
  swift_release();
  uint64_t v50 = a3[17];
  uint64_t v51 = (void *)((char *)a1 + v50);
  uint64_t v52 = (void *)((char *)a2 + v50);
  *uint64_t v51 = *v52;
  v51[1] = v52[1];
  swift_retain();
  swift_release();
  uint64_t v53 = a3[18];
  uint64_t v54 = (void *)((char *)a1 + v53);
  uint64_t v55 = (void *)((char *)a2 + v53);
  *uint64_t v54 = *v55;
  v54[1] = v55[1];
  v54[2] = v55[2];
  swift_retain();
  swift_release();
  uint64_t v56 = a3[19];
  uint64_t v57 = (void *)((char *)a1 + v56);
  uint64_t v58 = (char *)a2 + v56;
  uint64_t v59 = *(void **)((char *)a1 + v56);
  uint64_t v60 = *(void **)((char *)a2 + v56);
  *uint64_t v57 = v60;
  id v61 = v60;

  v57[1] = *((void *)v58 + 1);
  swift_retain();
  swift_release();
  uint64_t v62 = a3[20];
  uint64_t v63 = (char *)a1 + v62;
  uint64_t v64 = (char *)a2 + v62;
  *uint64_t v63 = *v64;
  *((void *)v63 + 1) = *((void *)v64 + 1);
  swift_retain();
  swift_release();
  uint64_t v65 = a3[21];
  double v66 = (void *)((char *)a1 + v65);
  long long v67 = (void *)((char *)a2 + v65);
  *double v66 = *v67;
  uint64_t v68 = (void *)v67[1];
  uint64_t v69 = (void *)v66[1];
  v66[1] = v68;
  id v70 = v68;

  uint64_t v71 = a3[22];
  CGFloat v72 = (void *)((char *)a1 + v71);
  uint64_t v73 = (char *)a2 + v71;
  uint64_t v74 = *(void **)((char *)a1 + v71);
  uint64_t v75 = *(void **)((char *)a2 + v71);
  void *v72 = v75;
  id v76 = v75;

  v72[1] = *((void *)v73 + 1);
  swift_retain();
  swift_release();
  uint64_t v77 = a3[23];
  uint64_t v78 = *(void **)((char *)a2 + v77);
  uint64_t v79 = *(void **)((char *)a1 + v77);
  *(void *)((char *)a1 + v77) = v78;
  id v80 = v78;

  uint64_t v81 = a3[24];
  id v82 = (void *)((char *)a1 + v81);
  id v83 = (void *)((char *)a2 + v81);
  void *v82 = *v83;
  id v84 = (void *)v83[1];
  id v85 = (void *)v82[1];
  v82[1] = v84;
  id v86 = v84;

  uint64_t v87 = a3[25];
  uint64_t v88 = (char *)a1 + v87;
  uint64_t v89 = (char *)a2 + v87;
  char *v88 = *v89;
  *((void *)v88 + 1) = *((void *)v89 + 1);
  swift_retain();
  swift_release();
  return a1;
}

char *sub_10001B3E0(char *a1, char *a2, int *a3)
{
  uint64_t v6 = sub_100006380(&qword_10006B218);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = type metadata accessor for DynamicTypeSize();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
  }
  uint64_t v8 = a3[5];
  uint64_t v9 = &a1[v8];
  uint64_t v10 = &a2[v8];
  uint64_t v11 = sub_100006380(&qword_10006B088);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v12 = type metadata accessor for UserInterfaceSizeClass();
    uint64_t v13 = *(void *)(v12 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v10, 1, v12))
    {
      uint64_t v14 = sub_100006380(&qword_10006B038);
      memcpy(v9, v10, *(void *)(*(void *)(v14 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v9, v10, v12);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(v9, 0, 1, v12);
    }
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v9, v10, *(void *)(*(void *)(v11 - 8) + 64));
  }
  uint64_t v15 = a3[6];
  uint64_t v16 = &a1[v15];
  uint64_t v17 = &a2[v15];
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v18 = type metadata accessor for UserInterfaceSizeClass();
    uint64_t v19 = *(void *)(v18 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48))(v17, 1, v18))
    {
      uint64_t v20 = sub_100006380(&qword_10006B038);
      memcpy(v16, v17, *(void *)(*(void *)(v20 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v19 + 32))(v16, v17, v18);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v19 + 56))(v16, 0, 1, v18);
    }
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v16, v17, *(void *)(*(void *)(v11 - 8) + 64));
  }
  uint64_t v21 = a3[7];
  uint64_t v22 = &a1[v21];
  uint64_t v23 = &a2[v21];
  uint64_t v24 = sub_100006380(&qword_10006B418);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v25 = type metadata accessor for LayoutDirection();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v25 - 8) + 32))(v22, v23, v25);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v22, v23, *(void *)(*(void *)(v24 - 8) + 64));
  }
  uint64_t v26 = a3[9];
  *(_OWORD *)&a1[a3[8]] = *(_OWORD *)&a2[a3[8]];
  *(_OWORD *)&a1[v26] = *(_OWORD *)&a2[v26];
  uint64_t v27 = a3[11];
  *(_OWORD *)&a1[a3[10]] = *(_OWORD *)&a2[a3[10]];
  CGFloat v28 = &a1[v27];
  uint64_t v29 = &a2[v27];
  *(_OWORD *)CGFloat v28 = *(_OWORD *)v29;
  *((void *)v28 + 2) = *((void *)v29 + 2);
  uint64_t v30 = a3[12];
  uint64_t v31 = a3[13];
  uint64_t v32 = &a1[v30];
  double v33 = &a2[v30];
  *(_OWORD *)uint64_t v32 = *(_OWORD *)v33;
  *((void *)v32 + 2) = *((void *)v33 + 2);
  CGFloat v34 = &a1[v31];
  uint64_t v35 = &a2[v31];
  *((void *)v34 + 2) = *((void *)v35 + 2);
  *(_OWORD *)CGFloat v34 = *(_OWORD *)v35;
  uint64_t v36 = a3[14];
  uint64_t v37 = a3[15];
  uint64_t v38 = &a1[v36];
  uint64_t v39 = &a2[v36];
  *((void *)v38 + 2) = *((void *)v39 + 2);
  *(_OWORD *)uint64_t v38 = *(_OWORD *)v39;
  CGFloat v40 = &a1[v37];
  uint64_t v41 = &a2[v37];
  *((void *)v40 + 2) = *((void *)v41 + 2);
  *(_OWORD *)CGFloat v40 = *(_OWORD *)v41;
  uint64_t v42 = a3[17];
  *(_OWORD *)&a1[a3[16]] = *(_OWORD *)&a2[a3[16]];
  *(_OWORD *)&a1[v42] = *(_OWORD *)&a2[v42];
  uint64_t v43 = a3[18];
  uint64_t v44 = a3[19];
  uint64_t v45 = &a1[v43];
  uint64_t v46 = &a2[v43];
  *((void *)v45 + 2) = *((void *)v46 + 2);
  *(_OWORD *)uint64_t v45 = *(_OWORD *)v46;
  *(_OWORD *)&a1[v44] = *(_OWORD *)&a2[v44];
  uint64_t v47 = a3[21];
  *(_OWORD *)&a1[a3[20]] = *(_OWORD *)&a2[a3[20]];
  *(_OWORD *)&a1[v47] = *(_OWORD *)&a2[v47];
  uint64_t v48 = a3[23];
  *(_OWORD *)&a1[a3[22]] = *(_OWORD *)&a2[a3[22]];
  *(void *)&a1[v48] = *(void *)&a2[v48];
  uint64_t v49 = a3[25];
  *(_OWORD *)&a1[a3[24]] = *(_OWORD *)&a2[a3[24]];
  *(_OWORD *)&a1[v49] = *(_OWORD *)&a2[v49];
  return a1;
}

char *sub_10001B8E8(char *a1, char *a2, int *a3)
{
  if (a1 != a2)
  {
    sub_1000067B8((uint64_t)a1, &qword_10006B218);
    uint64_t v6 = sub_100006380(&qword_10006B218);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = type metadata accessor for DynamicTypeSize();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
    }
    uint64_t v8 = a3[5];
    uint64_t v9 = &a1[v8];
    uint64_t v10 = &a2[v8];
    sub_1000067B8((uint64_t)&a1[v8], &qword_10006B088);
    uint64_t v11 = sub_100006380(&qword_10006B088);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v12 = type metadata accessor for UserInterfaceSizeClass();
      uint64_t v13 = *(void *)(v12 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v10, 1, v12))
      {
        uint64_t v14 = sub_100006380(&qword_10006B038);
        memcpy(v9, v10, *(void *)(*(void *)(v14 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v9, v10, v12);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(v9, 0, 1, v12);
      }
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v9, v10, *(void *)(*(void *)(v11 - 8) + 64));
    }
    uint64_t v15 = a3[6];
    uint64_t v16 = &a1[v15];
    uint64_t v17 = &a2[v15];
    sub_1000067B8((uint64_t)&a1[v15], &qword_10006B088);
    uint64_t v18 = sub_100006380(&qword_10006B088);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v19 = type metadata accessor for UserInterfaceSizeClass();
      uint64_t v20 = *(void *)(v19 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v20 + 48))(v17, 1, v19))
      {
        uint64_t v21 = sub_100006380(&qword_10006B038);
        memcpy(v16, v17, *(void *)(*(void *)(v21 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v20 + 32))(v16, v17, v19);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v20 + 56))(v16, 0, 1, v19);
      }
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v16, v17, *(void *)(*(void *)(v18 - 8) + 64));
    }
    uint64_t v22 = a3[7];
    uint64_t v23 = &a1[v22];
    uint64_t v24 = &a2[v22];
    sub_1000067B8((uint64_t)&a1[v22], &qword_10006B418);
    uint64_t v25 = sub_100006380(&qword_10006B418);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v26 = type metadata accessor for LayoutDirection();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v26 - 8) + 32))(v23, v24, v26);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v23, v24, *(void *)(*(void *)(v25 - 8) + 64));
    }
  }
  uint64_t v27 = a3[8];
  CGFloat v28 = &a1[v27];
  uint64_t v29 = &a2[v27];
  *CGFloat v28 = *v29;
  *((void *)v28 + 1) = *((void *)v29 + 1);
  swift_release();
  uint64_t v30 = a3[9];
  uint64_t v31 = &a1[v30];
  uint64_t v32 = &a2[v30];
  char *v31 = *v32;
  *((void *)v31 + 1) = *((void *)v32 + 1);
  swift_release();
  uint64_t v33 = a3[10];
  CGFloat v34 = &a1[v33];
  uint64_t v35 = &a2[v33];
  uint64_t v37 = *(void *)v35;
  uint64_t v36 = *((void *)v35 + 1);
  *(void *)CGFloat v34 = v37;
  *((void *)v34 + 1) = v36;
  swift_release();
  uint64_t v38 = a3[11];
  uint64_t v39 = &a1[v38];
  CGFloat v40 = &a2[v38];
  uint64_t v41 = *(void *)&a2[v38 + 8];
  *(void *)uint64_t v39 = *(void *)&a2[v38];
  *((void *)v39 + 1) = v41;
  swift_bridgeObjectRelease();
  *((void *)v39 + 2) = *((void *)v40 + 2);
  swift_release();
  uint64_t v42 = a3[12];
  uint64_t v43 = &a1[v42];
  uint64_t v44 = &a2[v42];
  *(_OWORD *)uint64_t v43 = *(_OWORD *)v44;
  *((void *)v43 + 2) = *((void *)v44 + 2);
  swift_release();
  uint64_t v45 = a3[13];
  uint64_t v46 = &a1[v45];
  uint64_t v47 = &a2[v45];
  *(_OWORD *)uint64_t v46 = *(_OWORD *)v47;
  *((void *)v46 + 2) = *((void *)v47 + 2);
  swift_release();
  uint64_t v48 = a3[14];
  uint64_t v49 = &a1[v48];
  uint64_t v50 = &a2[v48];
  *(_OWORD *)uint64_t v49 = *(_OWORD *)v50;
  *((void *)v49 + 2) = *((void *)v50 + 2);
  swift_release();
  uint64_t v51 = a3[15];
  uint64_t v52 = &a1[v51];
  uint64_t v53 = &a2[v51];
  *(_OWORD *)uint64_t v52 = *(_OWORD *)v53;
  *((void *)v52 + 2) = *((void *)v53 + 2);
  swift_release();
  uint64_t v54 = a3[16];
  uint64_t v55 = &a1[v54];
  uint64_t v56 = &a2[v54];
  *(void *)uint64_t v55 = *(void *)v56;
  *((void *)v55 + 1) = *((void *)v56 + 1);
  swift_release();
  uint64_t v57 = a3[17];
  uint64_t v58 = &a1[v57];
  uint64_t v59 = &a2[v57];
  *(void *)uint64_t v58 = *(void *)v59;
  *((void *)v58 + 1) = *((void *)v59 + 1);
  swift_release();
  uint64_t v60 = a3[18];
  id v61 = &a1[v60];
  uint64_t v62 = &a2[v60];
  *(_OWORD *)id v61 = *(_OWORD *)v62;
  *((void *)v61 + 2) = *((void *)v62 + 2);
  swift_release();
  uint64_t v63 = a3[19];
  uint64_t v64 = &a1[v63];
  uint64_t v65 = &a2[v63];
  double v66 = *(void **)&a1[v63];
  *(void *)uint64_t v64 = *(void *)v65;

  *((void *)v64 + 1) = *((void *)v65 + 1);
  swift_release();
  uint64_t v67 = a3[20];
  uint64_t v68 = &a1[v67];
  uint64_t v69 = &a2[v67];
  char *v68 = *v69;
  *((void *)v68 + 1) = *((void *)v69 + 1);
  swift_release();
  uint64_t v70 = a3[21];
  uint64_t v71 = &a1[v70];
  CGFloat v72 = &a2[v70];
  uint64_t v74 = *(void *)v72;
  uint64_t v73 = *((void *)v72 + 1);
  uint64_t v75 = (void *)*((void *)v71 + 1);
  *(void *)uint64_t v71 = v74;
  *((void *)v71 + 1) = v73;

  uint64_t v76 = a3[22];
  uint64_t v77 = &a1[v76];
  uint64_t v78 = &a2[v76];
  uint64_t v79 = *(void **)&a1[v76];
  *(void *)uint64_t v77 = *(void *)v78;

  *((void *)v77 + 1) = *((void *)v78 + 1);
  swift_release();
  uint64_t v80 = a3[23];
  uint64_t v81 = *(void **)&a1[v80];
  *(void *)&a1[v80] = *(void *)&a2[v80];

  uint64_t v82 = a3[24];
  id v83 = &a1[v82];
  id v84 = &a2[v82];
  uint64_t v86 = *(void *)v84;
  uint64_t v85 = *((void *)v84 + 1);
  uint64_t v87 = (void *)*((void *)v83 + 1);
  *(void *)id v83 = v86;
  *((void *)v83 + 1) = v85;

  uint64_t v88 = a3[25];
  uint64_t v89 = &a1[v88];
  uint64_t v90 = &a2[v88];
  char *v89 = *v90;
  *((void *)v89 + 1) = *((void *)v90 + 1);
  swift_release();
  return a1;
}

uint64_t sub_10001BFA8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10001BFBC);
}

uint64_t sub_10001BFBC(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_100006380(&qword_10006B220);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v10 = a1;
LABEL_8:
    return v9(v10, a2, v8);
  }
  uint64_t v11 = sub_100006380(&qword_10006B060);
  if (*(_DWORD *)(*(void *)(v11 - 8) + 84) == a2)
  {
    uint64_t v8 = v11;
    uint64_t v12 = *(void *)(v11 - 8);
    uint64_t v13 = a3[5];
LABEL_7:
    uint64_t v10 = a1 + v13;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    goto LABEL_8;
  }
  uint64_t v14 = sub_100006380(&qword_10006B448);
  if (*(_DWORD *)(*(void *)(v14 - 8) + 84) == a2)
  {
    uint64_t v8 = v14;
    uint64_t v12 = *(void *)(v14 - 8);
    uint64_t v13 = a3[7];
    goto LABEL_7;
  }
  unint64_t v16 = *(void *)(a1 + a3[11] + 8);
  if (v16 >= 0xFFFFFFFF) {
    LODWORD(v16) = -1;
  }
  return (v16 + 1);
}

uint64_t sub_10001C12C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10001C140);
}

uint64_t sub_10001C140(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t v8 = sub_100006380(&qword_10006B220);
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v12 = a1;
  }
  else
  {
    uint64_t v13 = sub_100006380(&qword_10006B060);
    if (*(_DWORD *)(*(void *)(v13 - 8) + 84) == a3)
    {
      uint64_t v10 = v13;
      uint64_t v14 = *(void *)(v13 - 8);
      uint64_t v15 = a4[5];
    }
    else
    {
      uint64_t result = sub_100006380(&qword_10006B448);
      if (*(_DWORD *)(*(void *)(result - 8) + 84) != a3)
      {
        *(void *)(a1 + a4[11] + 8) = (a2 - 1);
        return result;
      }
      uint64_t v10 = result;
      uint64_t v14 = *(void *)(result - 8);
      uint64_t v15 = a4[7];
    }
    uint64_t v12 = a1 + v15;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
  }

  return v11(v12, a2, a2, v10);
}

void sub_10001C2AC()
{
  sub_10001C494(319, (unint64_t *)&qword_10006B290, (void (*)(uint64_t))&type metadata accessor for DynamicTypeSize);
  if (v0 <= 0x3F)
  {
    sub_10001C438();
    if (v1 <= 0x3F)
    {
      sub_10001C494(319, (unint64_t *)&qword_10006B4B8, (void (*)(uint64_t))&type metadata accessor for LayoutDirection);
      if (v2 <= 0x3F) {
        swift_initStructMetadata();
      }
    }
  }
}

void sub_10001C438()
{
  if (!qword_10006B030)
  {
    sub_10000646C(&qword_10006B038);
    unint64_t v0 = type metadata accessor for Environment.Content();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_10006B030);
    }
  }
}

void sub_10001C494(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = type metadata accessor for Environment.Content();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t sub_10001C4E8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10001C508(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for RootView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10001C56C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = *(void *)(type metadata accessor for RootView() - 8);
  uint64_t v6 = v2 + ((*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));

  return sub_1000108F8(a1, v6, a2);
}

uint64_t sub_10001C5F0(uint64_t a1)
{
  return sub_10001C624(a1, (uint64_t (*)(uint64_t, unint64_t, uint64_t))sub_100012198);
}

uint64_t sub_10001C60C(uint64_t a1)
{
  return sub_10001C624(a1, (uint64_t (*)(uint64_t, unint64_t, uint64_t))sub_100012D54);
}

uint64_t sub_10001C624(uint64_t a1, uint64_t (*a2)(uint64_t, unint64_t, uint64_t))
{
  uint64_t v4 = *(void *)(type metadata accessor for RootView() - 8);
  unint64_t v5 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v6 = *(void *)(v4 + 64);
  uint64_t v7 = *(void *)(type metadata accessor for GeometryProxy() - 8);
  uint64_t v8 = v2 + ((v5 + v6 + *(unsigned __int8 *)(v7 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80));

  return a2(a1, v2 + v5, v8);
}

void sub_10001C710()
{
  type metadata accessor for RootView();
  type metadata accessor for GeometryProxy();
  GeometryProxy.size.getter();
  sub_100016A90(v0, v1);
}

id sub_10001C7DC()
{
  uint64_t v1 = type metadata accessor for RootView();
  uint64_t v2 = *(void **)(v0
                + ((*(unsigned __int8 *)(*(void *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v1 - 8) + 80))
                + *(int *)(v1 + 92));

  return [v2 idleSleepTimerDisabled:0];
}

uint64_t sub_10001C85C()
{
  return sub_10001E898((uint64_t (*)(unint64_t, uint64_t))sub_100017398);
}

uint64_t sub_10001C874()
{
  return sub_10001C8A4(&qword_10006B5C8, &qword_10006B588, (void (*)(void))sub_10001C920);
}

uint64_t sub_10001C8A4(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10000646C(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10001C920()
{
  return sub_10001C8A4(&qword_10006B5D0, &qword_10006B580, (void (*)(void))sub_10001C950);
}

uint64_t sub_10001C950()
{
  return sub_10001C8A4(&qword_10006B5D8, &qword_10006B578, (void (*)(void))sub_10001C980);
}

uint64_t sub_10001C980()
{
  return sub_10001C8A4(&qword_10006B5E0, &qword_10006B570, (void (*)(void))sub_10001C9B0);
}

uint64_t sub_10001C9B0()
{
  return sub_10001C8A4(&qword_10006B5E8, &qword_10006B568, (void (*)(void))sub_10001C9E0);
}

uint64_t sub_10001C9E0()
{
  return sub_10001C8A4(&qword_10006B5F0, &qword_10006B560, (void (*)(void))sub_10001CA10);
}

unint64_t sub_10001CA10()
{
  unint64_t result = qword_10006B5F8;
  if (!qword_10006B5F8)
  {
    sub_10000646C(&qword_10006B558);
    sub_10001C8A4(&qword_10006B600, &qword_10006B550, (void (*)(void))sub_10001CADC);
    sub_1000068B8(&qword_10006B620, &qword_10006AF40);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006B5F8);
  }
  return result;
}

unint64_t sub_10001CADC()
{
  unint64_t result = qword_10006B608;
  if (!qword_10006B608)
  {
    sub_10000646C(&qword_10006B548);
    sub_1000068B8(&qword_10006B610, &qword_10006B540);
    sub_1000068B8(&qword_10006B618, &qword_10006B5B0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006B608);
  }
  return result;
}

unint64_t sub_10001CBA0()
{
  unint64_t result = qword_10006B628;
  if (!qword_10006B628)
  {
    sub_10000646C(&qword_10006BF40);
    sub_10001D6E8(&qword_10006C130, (void (*)(uint64_t))&type metadata accessor for AXLTCaption);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006B628);
  }
  return result;
}

uint64_t sub_10001CC48(uint64_t a1)
{
  uint64_t v3 = *(void *)(type metadata accessor for RootView() - 8);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  type metadata accessor for GeometryProxy();

  return sub_10001774C(a1, v1 + v4);
}

uint64_t sub_10001CD24()
{
  uint64_t v1 = (int *)type metadata accessor for RootView();
  uint64_t v2 = *(unsigned __int8 *)(*((void *)v1 - 1) + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*((void *)v1 - 1) + 64);
  uint64_t v5 = v0 + v3;
  sub_100006380(&qword_10006B218);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = type metadata accessor for DynamicTypeSize();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v0 + v3, v6);
  }
  else
  {
    swift_release();
  }
  uint64_t v7 = v5 + v1[5];
  sub_100006380(&qword_10006B088);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v8 = type metadata accessor for UserInterfaceSizeClass();
    uint64_t v9 = *(void *)(v8 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8)) {
      (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v7, v8);
    }
  }
  else
  {
    swift_release();
  }
  uint64_t v10 = v5 + v1[6];
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v11 = type metadata accessor for UserInterfaceSizeClass();
    uint64_t v12 = *(void *)(v11 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11)) {
      (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v10, v11);
    }
  }
  else
  {
    swift_release();
  }
  uint64_t v13 = v5 + v1[7];
  sub_100006380(&qword_10006B418);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v14 = type metadata accessor for LayoutDirection();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v14 - 8) + 8))(v13, v14);
  }
  else
  {
    swift_release();
  }
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  swift_release();
  swift_release();

  swift_release();
  swift_release();

  return _swift_deallocObject(v0, ((v4 + v3 + 7) & 0xFFFFFFFFFFFFFFF8) + 16, v2 | 7);
}

id sub_10001D164(uint64_t a1)
{
  uint64_t v3 = *(void *)(type metadata accessor for RootView() - 8);
  uint64_t v4 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));

  return sub_100018F70(a1, v4);
}

uint64_t sub_10001D204(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10001D214()
{
  return swift_release();
}

uint64_t sub_10001D21C()
{
  return sub_100018254(*(double *)(v0 + 32), *(double *)(v0 + 40), *(void *)(v0 + 16), *(unsigned char *)(v0 + 24));
}

uint64_t sub_10001D244()
{
  uint64_t v1 = (int *)type metadata accessor for RootView();
  uint64_t v2 = *(unsigned __int8 *)(*((void *)v1 - 1) + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*((void *)v1 - 1) + 64);
  uint64_t v5 = v0 + v3;
  sub_100006380(&qword_10006B218);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = type metadata accessor for DynamicTypeSize();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v0 + v3, v6);
  }
  else
  {
    swift_release();
  }
  uint64_t v7 = v5 + v1[5];
  sub_100006380(&qword_10006B088);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v8 = type metadata accessor for UserInterfaceSizeClass();
    uint64_t v9 = *(void *)(v8 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8)) {
      (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v7, v8);
    }
  }
  else
  {
    swift_release();
  }
  uint64_t v10 = v5 + v1[6];
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v11 = type metadata accessor for UserInterfaceSizeClass();
    uint64_t v12 = *(void *)(v11 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11)) {
      (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v10, v11);
    }
  }
  else
  {
    swift_release();
  }
  uint64_t v13 = v5 + v1[7];
  sub_100006380(&qword_10006B418);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v14 = type metadata accessor for LayoutDirection();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v14 - 8) + 8))(v13, v14);
  }
  else
  {
    swift_release();
  }
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  swift_release();
  swift_release();

  swift_release();
  swift_release();

  return _swift_deallocObject(v0, v3 + v4, v2 | 7);
}

void sub_10001D678()
{
  type metadata accessor for RootView();

  sub_100018DAC();
}

uint64_t sub_10001D6E8(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_10001D734()
{
  return sub_10001E898((uint64_t (*)(unint64_t, uint64_t))sub_100013E10);
}

uint64_t sub_10001D74C(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_10001D7B4(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_10001D814()
{
  return sub_100017944(*(void *)(v0 + 16), *(unsigned char *)(v0 + 24), *(double *)(v0 + 32), *(double *)(v0 + 40));
}

void sub_10001D83C()
{
  type metadata accessor for RootView();
  type metadata accessor for GeometryProxy();
  GeometryProxy.size.getter();
  sub_100012DE4(v0, v1);
}

uint64_t sub_10001D90C()
{
  return sub_10001C8A4(&qword_10006B6E8, &qword_10006B6F0, (void (*)(void))sub_10001D93C);
}

uint64_t sub_10001D93C()
{
  return sub_10001C8A4(&qword_10006B6F8, &qword_10006B700, (void (*)(void))sub_10001D96C);
}

unint64_t sub_10001D96C()
{
  unint64_t result = qword_10006B708;
  if (!qword_10006B708)
  {
    sub_10000646C(&qword_10006B710);
    sub_10001DA0C(&qword_10006B718, &qword_10006B720, (void (*)(void))sub_10001DAB0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006B708);
  }
  return result;
}

uint64_t sub_10001DA0C(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10000646C(a2);
    a3();
    sub_1000068B8(&qword_10006AF18, &qword_10006AF20);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_10001DAB0()
{
  unint64_t result = qword_10006B728;
  if (!qword_10006B728)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006B728);
  }
  return result;
}

unint64_t sub_10001DB04()
{
  unint64_t result = qword_10006B730;
  if (!qword_10006B730)
  {
    sub_10000646C(&qword_10006B680);
    sub_1000068B8(&qword_10006AF28, &qword_10006AEC0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006B730);
  }
  return result;
}

uint64_t sub_10001DB9C(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 8);
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();

  swift_release();
  swift_release();
  swift_release();
  return a1;
}

uint64_t sub_10001DC3C()
{
  return sub_10001E898((uint64_t (*)(unint64_t, uint64_t))sub_100016604);
}

double sub_10001DC54(uint64_t a1)
{
  *(void *)(a1 + 208) = 0;
  double result = 0.0;
  *(_OWORD *)(a1 + 176) = 0u;
  *(_OWORD *)(a1 + 192) = 0u;
  *(_OWORD *)(a1 + 144) = 0u;
  *(_OWORD *)(a1 + 160) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 128) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)a1 = 0u;
  *(_WORD *)(a1 + 216) = -256;
  return result;
}

uint64_t sub_10001DC84(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,unsigned __int16 a28)
{
  if (HIBYTE(a28) <= 0xFEu)
  {
    __int16 v29 = a28 & 0x1FF;
    return sub_10001DD54(result, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
             a20,
             a21,
             a22,
             a23,
             a24,
             a25,
             a26,
             a27,
             v29,
             SHIBYTE(v29));
  }
  return result;
}

uint64_t sub_10001DD54(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28,char a29)
{
  if (a29) {
    swift_retain();
  }
  swift_retain();
  swift_retain();

  return swift_retain();
}

uint64_t sub_10001DDC8(uint64_t a1, void (*a2)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, __int16))
{
  __int16 v4 = *(_WORD *)(a1 + 216);
  a2(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 72), *(void *)(a1 + 80), *(void *)(a1 + 88), *(void *)(a1 + 96), *(void *)(a1 + 104), *(void *)(a1 + 112), *(void *)(a1 + 120), *(void *)(a1 + 128), *(void *)(a1 + 136), *(void *)(a1 + 144),
    *(void *)(a1 + 152),
    *(void *)(a1 + 160),
    *(void *)(a1 + 168),
    *(void *)(a1 + 176),
    *(void *)(a1 + 184),
    *(void *)(a1 + 192),
    *(void *)(a1 + 200),
    *(void *)(a1 + 208),
    v4);
  return a1;
}

uint64_t sub_10001DE4C(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,unsigned __int16 a28)
{
  if (HIBYTE(a28) <= 0xFEu)
  {
    __int16 v29 = a28 & 0x1FF;
    return sub_10001DF1C(result, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
             a20,
             a21,
             a22,
             a23,
             a24,
             a25,
             a26,
             a27,
             v29,
             SHIBYTE(v29));
  }
  return result;
}

uint64_t sub_10001DF1C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28,char a29)
{
  if (a29) {
    swift_release();
  }
  swift_release();
  swift_release();

  return swift_release();
}

uint64_t sub_10001DF94()
{
  return sub_10001E898((uint64_t (*)(unint64_t, uint64_t))sub_1000166C8);
}

uint64_t sub_10001DFAC(uint64_t result)
{
  *(unsigned char *)(result + 217) = 1;
  return result;
}

unint64_t sub_10001DFB8()
{
  unint64_t result = qword_10006B770;
  if (!qword_10006B770)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006B770);
  }
  return result;
}

uint64_t sub_10001E00C()
{
  return sub_10001C8A4(&qword_10006B780, &qword_10006B788, (void (*)(void))sub_10001E03C);
}

uint64_t sub_10001E03C()
{
  return sub_10001C8A4(&qword_10006B790, &qword_10006B798, (void (*)(void))sub_10001E06C);
}

unint64_t sub_10001E06C()
{
  unint64_t result = qword_10006B7A0;
  if (!qword_10006B7A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006B7A0);
  }
  return result;
}

uint64_t sub_10001E0C0(uint64_t result)
{
  *(unsigned char *)(result + 217) = 0;
  return result;
}

id sub_10001E0CC()
{
  type metadata accessor for RootView();
  type metadata accessor for GeometryProxy();
  GeometryProxy.size.getter();
  return sub_100013E94(1, v0, v1);
}

uint64_t sub_10001E198(uint64_t a1)
{
  return a1;
}

unint64_t sub_10001E1EC()
{
  unint64_t result = qword_10006B7A8;
  if (!qword_10006B7A8)
  {
    sub_10000646C(&qword_10006B6B0);
    sub_10000646C(&qword_10006B7B0);
    sub_10000646C(&qword_10006AEC0);
    sub_10001DA0C(&qword_10006B7B8, &qword_10006B7B0, (void (*)(void))sub_10001E310);
    sub_1000068B8(&qword_10006AF28, &qword_10006AEC0);
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006B7A8);
  }
  return result;
}

uint64_t sub_10001E310()
{
  return sub_10001C8A4(&qword_10006B7C0, &qword_10006B7C8, (void (*)(void))sub_10001E340);
}

unint64_t sub_10001E340()
{
  unint64_t result = qword_10006B7D0;
  if (!qword_10006B7D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006B7D0);
  }
  return result;
}

uint64_t sub_10001E398()
{
  return sub_10001E898((uint64_t (*)(unint64_t, uint64_t))sub_10001639C);
}

uint64_t sub_10001E3B4()
{
  double v1 = (int *)type metadata accessor for RootView();
  uint64_t v2 = *(unsigned __int8 *)(*((void *)v1 - 1) + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v20 = *(void *)(*((void *)v1 - 1) + 64);
  uint64_t v21 = type metadata accessor for GeometryProxy();
  uint64_t v4 = *(void *)(v21 - 8);
  uint64_t v5 = *(unsigned __int8 *)(v4 + 80);
  uint64_t v19 = *(void *)(v4 + 64);
  uint64_t v22 = v0;
  uint64_t v6 = v0 + v3;
  sub_100006380(&qword_10006B218);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = type metadata accessor for DynamicTypeSize();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v0 + v3, v7);
  }
  else
  {
    swift_release();
  }
  uint64_t v8 = v6 + v1[5];
  sub_100006380(&qword_10006B088);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v9 = type metadata accessor for UserInterfaceSizeClass();
    uint64_t v10 = *(void *)(v9 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9)) {
      (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v8, v9);
    }
  }
  else
  {
    swift_release();
  }
  uint64_t v11 = v6 + v1[6];
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v12 = type metadata accessor for UserInterfaceSizeClass();
    uint64_t v13 = *(void *)(v12 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12)) {
      (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v11, v12);
    }
  }
  else
  {
    swift_release();
  }
  uint64_t v14 = v6 + v1[7];
  sub_100006380(&qword_10006B418);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v15 = type metadata accessor for LayoutDirection();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v15 - 8) + 8))(v14, v15);
  }
  else
  {
    swift_release();
  }
  uint64_t v16 = v2 | v5 | 7;
  uint64_t v17 = (v3 + v20 + v5) & ~v5;
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  swift_release();
  swift_release();

  swift_release();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v22 + v17, v21);

  return _swift_deallocObject(v22, v17 + v19, v16);
}

uint64_t sub_10001E880()
{
  return sub_10001E898((uint64_t (*)(unint64_t, uint64_t))sub_10001644C);
}

uint64_t sub_10001E898(uint64_t (*a1)(unint64_t, uint64_t))
{
  uint64_t v2 = *(void *)(type metadata accessor for RootView() - 8);
  unint64_t v3 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = *(void *)(v2 + 64);
  uint64_t v5 = *(void *)(type metadata accessor for GeometryProxy() - 8);
  uint64_t v6 = v1 + ((v3 + v4 + *(unsigned __int8 *)(v5 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));

  return a1(v1 + v3, v6);
}

uint64_t sub_10001E978(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  swift_release();
  swift_release();
  swift_release();
  sub_10000A210(v2);
  swift_release();
  return a1;
}

uint64_t sub_10001E9E4()
{
  return sub_100018618(*(double *)(v0 + 32), *(double *)(v0 + 40));
}

uint64_t sub_10001EA0C()
{
  return sub_1000128B4();
}

uint64_t sub_10001EA2C()
{
  return sub_1000068B8(&qword_10006B7D8, &qword_10006B7E0);
}

uint64_t sub_10001EA6C()
{
  return sub_10001D21C();
}

uint64_t property wrapper backing initializer of AXLTProviderCaptionsView.provider()
{
  type metadata accessor for AXLTCaptionsProvider();
  sub_10001EAD4();

  return ObservedObject.init(wrappedValue:)();
}

unint64_t sub_10001EAD4()
{
  unint64_t result = qword_10006B438;
  if (!qword_10006B438)
  {
    type metadata accessor for AXLTCaptionsProvider();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006B438);
  }
  return result;
}

double AXLTProviderCaptionsView.body.getter@<D0>(_OWORD *a1@<X8>)
{
  v29[0] = *(_OWORD *)v1;
  swift_getKeyPath();
  swift_getKeyPath();
  id v3 = *((id *)&v29[0] + 1);
  static Published.subscript.getter();
  swift_release();
  swift_release();
  sub_10001EE20((uint64_t)v29);
  swift_getKeyPath();
  swift_getKeyPath();
  id v4 = v3;
  static Published.subscript.getter();
  swift_release();
  swift_release();
  sub_10001EE20((uint64_t)v29);
  uint64_t v5 = *(void *)(v1 + 24);
  uint64_t v6 = *(void *)(v1 + 32);
  double v7 = *(double *)(v1 + 40);
  uint64_t v8 = *(void *)(v1 + 48);
  uint64_t v9 = *(void *)(v1 + 56);
  uint64_t v10 = *(void *)(v1 + 72);
  uint64_t v27 = *(void *)(v1 + 64);
  uint64_t v11 = *(void *)(v1 + 80);
  uint64_t v12 = *(void *)(v1 + 96);
  uint64_t v25 = *(void *)(v1 + 104);
  uint64_t v26 = *(void *)(v1 + 88);
  uint64_t v13 = *(void *)(v1 + 112);
  char v14 = *(unsigned char *)(v1 + 16);
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  *(void *)&long long v24 = v26;
  *((void *)&v24 + 1) = v12;
  *(void *)&long long v23 = v10;
  *((void *)&v23 + 1) = v11;
  sub_10002D904(*(uint64_t *)&v28[0], *(uint64_t *)&v28[0], v14, v5, v6, v8, v9, v27, (uint64_t)v28, v7, v23, v24, v25, v13);
  long long v15 = v28[11];
  a1[10] = v28[10];
  a1[11] = v15;
  long long v16 = v28[13];
  a1[12] = v28[12];
  a1[13] = v16;
  long long v17 = v28[7];
  a1[6] = v28[6];
  a1[7] = v17;
  long long v18 = v28[9];
  a1[8] = v28[8];
  a1[9] = v18;
  long long v19 = v28[3];
  a1[2] = v28[2];
  a1[3] = v19;
  long long v20 = v28[5];
  a1[4] = v28[4];
  a1[5] = v20;
  double result = *(double *)v28;
  long long v22 = v28[1];
  *a1 = v28[0];
  a1[1] = v22;
  return result;
}

uint64_t sub_10001ED20@<X0>(void *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_10001EDA4(uint64_t a1, void **a2)
{
  uint64_t v2 = *a2;
  swift_getKeyPath();
  swift_getKeyPath();
  swift_bridgeObjectRetain();
  id v3 = v2;
  return static Published.subscript.setter();
}

uint64_t sub_10001EE20(uint64_t a1)
{
  return a1;
}

uint64_t sub_10001EE4C@<X0>(void *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_10001EED0(uint64_t a1, void **a2)
{
  uint64_t v2 = *a2;
  swift_getKeyPath();
  swift_getKeyPath();
  id v3 = v2;
  return static Published.subscript.setter();
}

uint64_t sub_10001EF44()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t destroy for AXLTProviderCaptionsView(uint64_t a1)
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();

  return swift_release();
}

uint64_t initializeWithCopy for AXLTProviderCaptionsView(uint64_t a1, uint64_t a2)
{
  id v3 = *(void **)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v4;
  uint64_t v5 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v5;
  uint64_t v6 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v6;
  uint64_t v7 = *(void *)(a2 + 80);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = v7;
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  uint64_t v8 = *(void *)(a2 + 112);
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
  *(void *)(a1 + 112) = v8;
  id v9 = v3;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for AXLTProviderCaptionsView(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  uint64_t v4 = *(void **)(a2 + 8);
  uint64_t v5 = *(void **)(a1 + 8);
  *(void *)(a1 + 8) = v4;
  id v6 = v4;

  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_retain();
  swift_release();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_retain();
  swift_release();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_retain();
  swift_release();
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_retain();
  swift_release();
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_retain();
  swift_release();
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  swift_retain();
  swift_release();
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(a2 + 112);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  *(void *)(a1 + 112) = v7;
  swift_retain();
  swift_release();
  return a1;
}

__n128 initializeWithTake for AXLTProviderCaptionsView(uint64_t a1, long long *a2)
{
  long long v2 = *a2;
  long long v3 = a2[1];
  long long v4 = a2[3];
  *(_OWORD *)(a1 + 32) = a2[2];
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)a1 = v2;
  *(_OWORD *)(a1 + 16) = v3;
  __n128 result = (__n128)a2[4];
  long long v6 = a2[5];
  long long v7 = a2[6];
  *(void *)(a1 + 112) = *((void *)a2 + 14);
  *(_OWORD *)(a1 + 80) = v6;
  *(_OWORD *)(a1 + 96) = v7;
  *(__n128 *)(a1 + 64) = result;
  return result;
}

uint64_t assignWithTake for AXLTProviderCaptionsView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void **)(a1 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;

  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  swift_release();
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_release();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_release();
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  swift_release();
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_release();
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  swift_release();
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 112);
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
  *(void *)(a1 + 112) = v6;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for AXLTProviderCaptionsView(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 120)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AXLTProviderCaptionsView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 120) = 1;
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
    *(unsigned char *)(result + 120) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AXLTProviderCaptionsView()
{
  return &type metadata for AXLTProviderCaptionsView;
}

unint64_t sub_10001F37C()
{
  unint64_t result = qword_10006B7E8;
  if (!qword_10006B7E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006B7E8);
  }
  return result;
}

void sub_10001F460(void *a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  id v7 = a1;
  id v8 = a3;
  id v9 = a5;
  static os_log_type_t.default.getter();
  if (qword_10006AD90 != -1) {
    swift_once();
  }
  os_log(_:dso:log:_:_:)();
  exit(1);
}

uint64_t sub_10001F4F4(uint64_t a1)
{
  unint64_t v2 = a1 & 0xC000000000000001;
  if ((a1 & 0xC000000000000001) != 0)
  {
    uint64_t v3 = __CocoaSet.startIndex.getter();
    uint64_t v5 = v4;
    __CocoaSet.endIndex.getter();
    char v6 = static __CocoaSet.Index.== infix(_:_:)();
    swift_bridgeObjectRelease();
    if (v6)
    {
LABEL_3:
      sub_1000204E4(v3, v5, v2 != 0);
      return 0;
    }
LABEL_7:
    sub_10001F9C0(v3, v5, v2 != 0, a1);
    uint64_t v7 = v11;
    sub_1000204E4(v3, v5, v2 != 0);
    return v7;
  }
  uint64_t result = sub_10001FC38(a1);
  if ((v10 & 1) == 0)
  {
    uint64_t v5 = v9;
    if (*(_DWORD *)(a1 + 36) == v9)
    {
      uint64_t v3 = result;
      if (result == 1 << *(unsigned char *)(a1 + 32)) {
        goto LABEL_3;
      }
      goto LABEL_7;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

void sub_10001F604()
{
  uint64_t v0 = (void *)qword_10006B7F0;
  qword_10006B7F0 = 0;

  static os_log_type_t.default.getter();
  if (qword_10006AD90 != -1) {
    swift_once();
  }
  os_log(_:dso:log:_:_:)();
  id v1 = [self sharedApplication];
  [v1 terminateWithSuccess];
}

unint64_t sub_10001F6E8()
{
  sub_100006380((uint64_t *)&unk_10006B8B0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_100054300;
  *(void *)(inited + 32) = 0x646568636E75616CLL;
  *(void *)(inited + 40) = 0xE800000000000000;
  sub_1000204F0(0, &qword_10006C170);
  *(NSNumber *)(inited + 48) = NSNumber.init(BOOLeanLiteral:)(1);
  return sub_10002E220(inited);
}

Class sub_10001F778(uint64_t a1)
{
  id v1 = *(uint64_t (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  uint64_t v3 = v1(v2);
  swift_release();
  if (v3)
  {
    sub_1000204F0(0, &qword_10006B8A8);
    v4.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v4.super.isa = 0;
  }

  return v4.super.isa;
}

id sub_10001F958()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for LTSceneDelegate();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for LTSceneDelegate()
{
  return self;
}

void sub_10001F9C0(uint64_t a1, int a2, char a3, uint64_t a4)
{
  unint64_t v6 = a1;
  if ((a4 & 0xC000000000000001) != 0)
  {
    if (a3)
    {
      __CocoaSet.element(at:)();
      sub_1000204F0(0, &qword_10006B898);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      swift_unknownObjectRelease();
      return;
    }
    goto LABEL_24;
  }
  if (a3) {
    goto LABEL_10;
  }
  if (a1 < 0 || 1 << *(unsigned char *)(a4 + 32) <= a1)
  {
    __break(1u);
    goto LABEL_21;
  }
  if (((*(void *)(a4 + 8 * ((unint64_t)a1 >> 6) + 56) >> a1) & 1) == 0)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  if (*(_DWORD *)(a4 + 36) == a2) {
    goto LABEL_17;
  }
  __break(1u);
LABEL_10:
  if (__CocoaSet.Index.age.getter() != *(_DWORD *)(a4 + 36))
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  __CocoaSet.Index.element.getter();
  sub_1000204F0(0, &qword_10006B898);
  swift_unknownObjectRetain();
  swift_dynamicCast();
  NSDictionary v4 = v16;
  swift_unknownObjectRelease();
  Swift::Int v7 = NSObject._rawHashValue(seed:)(*(void *)(a4 + 40));
  uint64_t v8 = -1 << *(unsigned char *)(a4 + 32);
  unint64_t v6 = v7 & ~v8;
  if (((*(void *)(a4 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
  {
LABEL_23:

    __break(1u);
LABEL_24:
    __break(1u);
    return;
  }
  id v9 = *(id *)(*(void *)(a4 + 48) + 8 * v6);
  char v10 = static NSObject.== infix(_:_:)();

  if ((v10 & 1) == 0)
  {
    uint64_t v11 = ~v8;
    do
    {
      unint64_t v6 = (v6 + 1) & v11;
      if (((*(void *)(a4 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
        goto LABEL_23;
      }
      id v12 = *(id *)(*(void *)(a4 + 48) + 8 * v6);
      char v13 = static NSObject.== infix(_:_:)();
    }
    while ((v13 & 1) == 0);
  }

LABEL_17:
  char v14 = *(void **)(*(void *)(a4 + 48) + 8 * v6);

  id v15 = v14;
}

uint64_t sub_10001FC38(uint64_t a1)
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
  unint64_t v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 2) {
    unint64_t v7 = 2;
  }
  unint64_t v8 = v7 - 2;
  id v9 = (unint64_t *)(a1 + 72);
  uint64_t v2 = 64;
  while (v8)
  {
    unint64_t v10 = *v9++;
    unint64_t v1 = v10;
    --v8;
    v2 += 64;
    if (v10) {
      return __clz(__rbit64(v1)) + v2;
    }
  }
  return v3;
}

void sub_10001FCC0()
{
  id v5 = [self standardUserDefaults];
  NSString v0 = String._bridgeToObjectiveC()();
  unsigned __int8 v1 = [v5 BOOLForKey:v0];

  if (v1)
  {
  }
  else
  {
    NSString v2 = String._bridgeToObjectiveC()();
    aBlock[4] = sub_10001F6E8;
    aBlock[5] = 0;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_10001F778;
    aBlock[3] = &unk_100066768;
    uint64_t v3 = _Block_copy(aBlock);
    AnalyticsSendEventLazy();
    _Block_release(v3);

    static os_log_type_t.debug.getter();
    if (qword_10006AD90 != -1) {
      swift_once();
    }
    os_log(_:dso:log:_:_:)();
    NSString v4 = String._bridgeToObjectiveC()();
    [v5 setBool:1 forKey:v4];

    [v5 synchronize];
  }
}

void sub_10001FED4(void *a1)
{
  self;
  uint64_t v3 = swift_dynamicCastObjCClass();
  if (v3)
  {
    uint64_t v4 = v3;
    id v5 = objc_allocWithZone((Class)type metadata accessor for LTWindow());
    id v17 = a1;
    id v6 = [v5 initWithWindowScene:v4];
    unint64_t v7 = *(void **)(v1 + OBJC_IVAR____TtC19LiveTranscriptionUI15LTSceneDelegate_window);
    *(void *)(v1 + OBJC_IVAR____TtC19LiveTranscriptionUI15LTSceneDelegate_window) = v6;

    unint64_t v8 = CFNotificationCenterGetDarwinNotifyCenter();
    if (kAXSLiveTranscriptionEnabledDidChangeNotification)
    {
      id v9 = v8;
      unint64_t v10 = *(void (__cdecl **)(CFNotificationCenterRef, void *, CFNotificationName, const void *, CFDictionaryRef))(v1 + OBJC_IVAR____TtC19LiveTranscriptionUI15LTSceneDelegate_featureEnabledChanged);
      uint64_t v11 = (__CFString *)kAXSLiveTranscriptionEnabledDidChangeNotification;
      CFNotificationCenterAddObserver(v9, 0, v10, v11, 0, CFNotificationSuspensionBehaviorDeliverImmediately);

      id v12 = CFNotificationCenterGetDarwinNotifyCenter();
      char v13 = *(void (__cdecl **)(CFNotificationCenterRef, void *, CFNotificationName, const void *, CFDictionaryRef))(v1 + OBJC_IVAR____TtC19LiveTranscriptionUI15LTSceneDelegate_systemLanguageChanged);
      char v14 = (__CFString *)String._bridgeToObjectiveC()();
      CFNotificationCenterAddObserver(v12, 0, v13, v14, 0, CFNotificationSuspensionBehaviorDeliverImmediately);

      id v15 = CFNotificationCenterGetDarwinNotifyCenter();
      long long v16 = (__CFString *)String._bridgeToObjectiveC()();
      CFNotificationCenterAddObserver(v15, 0, v13, v16, 0, CFNotificationSuspensionBehaviorDeliverImmediately);

      static os_log_type_t.debug.getter();
      if (qword_10006AD90 != -1) {
        swift_once();
      }
      os_log(_:dso:log:_:_:)();
      sub_10001FCC0();
    }
    else
    {
      __break(1u);
    }
  }
}

void sub_10002010C()
{
  if (qword_10006B7F0)
  {
    [(id)qword_10006B7F0 invalidate];
    NSString v0 = (void *)qword_10006B7F0;
  }
  else
  {
    NSString v0 = 0;
  }
  qword_10006B7F0 = 0;

  int v1 = _AXSLiveTranscriptionEnabled();
  id v2 = [self sharedApplication];
  id v3 = [v2 connectedScenes];

  sub_1000204F0(0, &qword_10006B898);
  sub_100020464();
  uint64_t v4 = static Set._unconditionallyBridgeFromObjectiveC(_:)();

  id v5 = (void *)sub_10001F4F4(v4);
  swift_bridgeObjectRelease();
  if (v5)
  {
    id v6 = [v5 delegate];

    if (v6)
    {
      type metadata accessor for LTSceneDelegate();
      uint64_t v7 = swift_dynamicCastClass();
      if (v7)
      {
        if (v1) {
          double v8 = 1.0;
        }
        else {
          double v8 = 0.0;
        }
        id v9 = *(void **)(v7 + OBJC_IVAR____TtC19LiveTranscriptionUI15LTSceneDelegate_window);
        if (v9) {
          [v9 setAlpha:v8];
        }
        os_log_type_t v10 = static os_log_type_t.default.getter();
        if (qword_10006AD90 != -1) {
          swift_once();
        }
        uint64_t v11 = qword_10006DF88;
        os_log_type_t v12 = v10;
        if (os_log_type_enabled((os_log_t)qword_10006DF88, v10))
        {
          char v13 = (uint8_t *)swift_slowAlloc();
          aBlock[0] = swift_slowAlloc();
          *(_DWORD *)char v13 = 136315138;
          uint64_t v14 = Double.description.getter();
          sub_10000E634(v14, v15, aBlock);
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          swift_bridgeObjectRelease();
          _os_log_impl((void *)&_mh_execute_header, v11, v12, "Window visible: %s", v13, 0xCu);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();
        }
      }
      swift_unknownObjectRelease();
    }
  }
  if (!v1)
  {
    long long v16 = self;
    aBlock[4] = (uint64_t)sub_10001F604;
    aBlock[5] = 0;
    aBlock[0] = (uint64_t)_NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_1000315A8;
    aBlock[3] = (uint64_t)&unk_100066740;
    id v17 = _Block_copy(aBlock);
    id v18 = [v16 scheduledTimerWithTimeInterval:0 repeats:v17 block:10.0];
    _Block_release(v17);
    long long v19 = (void *)qword_10006B7F0;
    qword_10006B7F0 = (uint64_t)v18;
  }
}

unint64_t sub_100020464()
{
  unint64_t result = qword_10006B8A0;
  if (!qword_10006B8A0)
  {
    sub_1000204F0(255, &qword_10006B898);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006B8A0);
  }
  return result;
}

uint64_t sub_1000204CC(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_1000204DC()
{
  return swift_release();
}

uint64_t sub_1000204E4(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_1000204F0(uint64_t a1, unint64_t *a2)
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

void *bottomButtonsBarHeight.unsafeMutableAddressor()
{
  return &bottomButtonsBarHeight;
}

uint64_t sub_100020540@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v34 = a3;
  uint64_t v33 = type metadata accessor for GeometryProxy();
  uint64_t v5 = *(void *)(v33 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  __chkstk_darwin(v33);
  uint64_t v32 = (char *)&v31 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100006380(&qword_10006B920);
  __chkstk_darwin(v7 - 8);
  id v9 = (char *)&v31 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100006380(&qword_10006B928);
  uint64_t v11 = v10 - 8;
  __chkstk_darwin(v10);
  char v13 = (char *)&v31 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_100006380(&qword_10006B930);
  uint64_t v15 = v14 - 8;
  __chkstk_darwin(v14);
  id v17 = (char *)&v31 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)id v9 = static VerticalAlignment.top.getter();
  *((void *)v9 + 1) = 0;
  v9[16] = 0;
  uint64_t v18 = sub_100006380(&qword_10006B938);
  sub_100020868(a2, a1, (uint64_t)&v9[*(int *)(v18 + 44)]);
  sub_100006754((uint64_t)v9, (uint64_t)v13, &qword_10006B920);
  v13[*(int *)(v11 + 44)] = 0;
  sub_1000067B8((uint64_t)v9, &qword_10006B920);
  uint64_t v19 = *(void *)(a2 + 40);
  LOBYTE(v9) = static Edge.Set.all.getter();
  sub_100006754((uint64_t)v13, (uint64_t)v17, &qword_10006B928);
  long long v20 = &v17[*(int *)(v15 + 44)];
  char *v20 = (char)v9;
  *((void *)v20 + 1) = 0x4020000000000000;
  *((void *)v20 + 2) = v19;
  *((void *)v20 + 3) = 0x4020000000000000;
  *((void *)v20 + 4) = v19;
  v20[40] = 0;
  sub_1000067B8((uint64_t)v13, &qword_10006B928);
  uint64_t v21 = v32;
  uint64_t v22 = a1;
  uint64_t v23 = v33;
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v32, v22, v33);
  unint64_t v24 = (*(unsigned __int8 *)(v5 + 80) + 96) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v25 = (char *)swift_allocObject();
  long long v26 = *(_OWORD *)(a2 + 48);
  *((_OWORD *)v25 + 3) = *(_OWORD *)(a2 + 32);
  *((_OWORD *)v25 + 4) = v26;
  *((_OWORD *)v25 + 5) = *(_OWORD *)(a2 + 64);
  long long v27 = *(_OWORD *)(a2 + 16);
  *((_OWORD *)v25 + 1) = *(_OWORD *)a2;
  *((_OWORD *)v25 + 2) = v27;
  (*(void (**)(char *, char *, uint64_t))(v5 + 32))(&v25[v24], v21, v23);
  uint64_t v28 = v34;
  sub_100006754((uint64_t)v17, v34, &qword_10006B930);
  __int16 v29 = (uint64_t (**)())(v28 + *(int *)(sub_100006380(&qword_10006B940) + 36));
  *__int16 v29 = sub_1000215CC;
  v29[1] = (uint64_t (*)())v25;
  _OWORD v29[2] = 0;
  v29[3] = 0;
  sub_100021494(a2);
  return sub_1000067B8((uint64_t)v17, &qword_10006B930);
}

uint64_t sub_100020868@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v45 = a2;
  uint64_t v56 = a3;
  uint64_t v4 = type metadata accessor for ButtonView();
  __chkstk_darwin(v4 - 8);
  uint64_t v54 = (uint64_t)&v39 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)&v39 - v7;
  uint64_t v9 = sub_100006380(&qword_10006B1E0) - 8;
  uint64_t v52 = v9;
  __chkstk_darwin(v9);
  uint64_t v55 = (uint64_t)&v39 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  char v13 = (char *)&v39 - v12;
  __chkstk_darwin(v14);
  uint64_t v16 = (char *)&v39 - v15;
  __chkstk_darwin(v17);
  uint64_t v19 = (char *)&v39 - v18;
  uint64_t v53 = (uint64_t)&v39 - v18;
  long long v77 = *(_OWORD *)a1;
  char v78 = *(unsigned char *)(a1 + 16);
  long long v68 = *(_OWORD *)a1;
  LOBYTE(v69) = *(unsigned char *)(a1 + 16);
  uint64_t v39 = sub_100006380(&qword_10006B1E8);
  Binding.projectedValue.getter();
  sub_10003C270(0, v73, *((uint64_t *)&v73 + 1), v74, (uint64_t)nullsub_1, 0, (uint64_t)v8);
  long long v76 = *(_OWORD *)(a1 + 64);
  long long v73 = *(_OWORD *)(a1 + 64);
  sub_100006380(&qword_10006B1D0);
  State.wrappedValue.getter();
  static Alignment.center.getter();
  _FrameLayout.init(width:height:alignment:)();
  sub_10000A858((uint64_t)v8, (uint64_t)v16);
  long long v20 = &v16[*(int *)(v9 + 44)];
  long long v21 = v60;
  *(_OWORD *)long long v20 = v59;
  *((_OWORD *)v20 + 1) = v21;
  *((_OWORD *)v20 + 2) = v61;
  sub_10000A8BC((uint64_t)v8);
  sub_100021630((uint64_t)v16, (uint64_t)v19);
  GeometryProxy.size.getter();
  long long v73 = v76;
  State.wrappedValue.getter();
  static Alignment.center.getter();
  _FrameLayout.init(width:height:alignment:)();
  uint64_t v51 = v62;
  int v50 = v63;
  uint64_t v49 = v64;
  int v48 = v65;
  uint64_t v46 = v67;
  uint64_t v47 = v66;
  long long v68 = v77;
  LOBYTE(v69) = v78;
  Binding.projectedValue.getter();
  sub_10003C270(1, v73, *((uint64_t *)&v73 + 1), v74, (uint64_t)nullsub_1, 0, (uint64_t)v8);
  GeometryProxy.size.getter();
  long long v73 = v76;
  State.wrappedValue.getter();
  static Alignment.center.getter();
  _FrameLayout.init(width:height:alignment:)();
  uint64_t v45 = v68;
  int v44 = BYTE8(v68);
  uint64_t v43 = v69;
  int v42 = v70;
  uint64_t v40 = v72;
  uint64_t v41 = v71;
  long long v57 = v77;
  char v58 = v78;
  Binding.projectedValue.getter();
  long long v22 = v73;
  LOBYTE(v19) = v74;
  uint64_t v23 = (_OWORD *)swift_allocObject();
  long long v24 = *(_OWORD *)(a1 + 48);
  v23[3] = *(_OWORD *)(a1 + 32);
  v23[4] = v24;
  v23[5] = *(_OWORD *)(a1 + 64);
  long long v25 = *(_OWORD *)(a1 + 16);
  v23[1] = *(_OWORD *)a1;
  v23[2] = v25;
  sub_100021494(a1);
  uint64_t v26 = v54;
  sub_10003C270(2, v22, *((uint64_t *)&v22 + 1), (char)v19, (uint64_t)sub_10000A830, (uint64_t)v23, v54);
  long long v73 = v76;
  State.wrappedValue.getter();
  static Alignment.center.getter();
  _FrameLayout.init(width:height:alignment:)();
  sub_10000A858(v26, (uint64_t)v13);
  long long v27 = &v13[*(int *)(v52 + 44)];
  long long v28 = v74;
  *(_OWORD *)long long v27 = v73;
  *((_OWORD *)v27 + 1) = v28;
  *((_OWORD *)v27 + 2) = v75;
  uint64_t v29 = v26;
  sub_10000A8BC(v26);
  sub_100021630((uint64_t)v13, (uint64_t)v16);
  uint64_t v30 = v53;
  sub_100006754(v53, (uint64_t)v13, &qword_10006B1E0);
  sub_10000A858((uint64_t)v8, v26);
  uint64_t v31 = v55;
  sub_100006754((uint64_t)v16, v55, &qword_10006B1E0);
  uint64_t v32 = v56;
  sub_100006754((uint64_t)v13, v56, &qword_10006B1E0);
  uint64_t v33 = (int *)sub_100006380(&qword_10006B948);
  uint64_t v34 = v32 + v33[12];
  *(void *)uint64_t v34 = 0;
  *(unsigned char *)(v34 + 8) = 1;
  *(void *)(v34 + 16) = v51;
  *(unsigned char *)(v34 + 24) = v50;
  *(void *)(v34 + 32) = v49;
  *(unsigned char *)(v34 + 40) = v48;
  uint64_t v35 = v46;
  *(void *)(v34 + 48) = v47;
  *(void *)(v34 + 56) = v35;
  sub_10000A858(v29, v32 + v33[16]);
  uint64_t v36 = v32 + v33[20];
  *(void *)uint64_t v36 = 0;
  *(unsigned char *)(v36 + 8) = 1;
  *(void *)(v36 + 16) = v45;
  *(unsigned char *)(v36 + 24) = v44;
  *(void *)(v36 + 32) = v43;
  *(unsigned char *)(v36 + 40) = v42;
  uint64_t v37 = v40;
  *(void *)(v36 + 48) = v41;
  *(void *)(v36 + 56) = v37;
  sub_100006754(v31, v32 + v33[24], &qword_10006B1E0);
  sub_1000067B8((uint64_t)v16, &qword_10006B1E0);
  sub_10000A8BC((uint64_t)v8);
  sub_1000067B8(v30, &qword_10006B1E0);
  sub_1000067B8(v31, &qword_10006B1E0);
  sub_10000A8BC(v29);
  return sub_1000067B8((uint64_t)v13, &qword_10006B1E0);
}

uint64_t sub_100020EA8()
{
  return State.wrappedValue.setter();
}

uint64_t sub_100020F08@<X0>(uint64_t (**a1)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)@<X8>)
{
  long long v3 = v1[3];
  v9[2] = v1[2];
  v9[3] = v3;
  v9[4] = v1[4];
  long long v4 = v1[1];
  v9[0] = *v1;
  v9[1] = v4;
  uint64_t v5 = (uint64_t (*)@<X0>(uint64_t@<X0>, uint64_t@<X8>))swift_allocObject();
  long long v6 = v1[3];
  *((_OWORD *)v5 + 3) = v1[2];
  *((_OWORD *)v5 + 4) = v6;
  *((_OWORD *)v5 + 5) = v1[4];
  long long v7 = v1[1];
  *((_OWORD *)v5 + 1) = *v1;
  *((_OWORD *)v5 + 2) = v7;
  *a1 = sub_10002148C;
  a1[1] = v5;
  return sub_100021494((uint64_t)v9);
}

double sub_100020F90@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  if (AXDeviceIsPad())
  {
    double v12 = 50.0;
  }
  else
  {
    id v13 = [self mainScreen];
    [v13 bounds];
    CGFloat v15 = v14;
    CGFloat v17 = v16;
    CGFloat v19 = v18;
    CGFloat v21 = v20;

    v28.origin.CGFloat x = v15;
    v28.origin.CGFloat y = v17;
    v28.size.CGFloat width = v19;
    v28.size.CGFloat height = v21;
    double v12 = CGRectGetWidth(v28) / 5.6 + 8.0;
  }
  State.init(wrappedValue:)();
  if (a4)
  {
    uint64_t v22 = swift_allocObject();
    *(void *)(v22 + 16) = a4;
    *(void *)(v22 + 24) = a5;
    uint64_t v23 = sub_10000A220;
  }
  else
  {
    uint64_t v23 = (uint64_t (*)())nullsub_1;
    uint64_t v22 = 0;
  }
  uint64_t v24 = swift_allocObject();
  *(void *)(v24 + 16) = v23;
  *(void *)(v24 + 24) = v22;
  swift_retain_n();
  swift_retain();
  swift_retain();
  swift_release();
  swift_release();
  swift_release_n();
  *(void *)a6 = a1;
  *(void *)(a6 + 8) = a2;
  *(unsigned char *)(a6 + 16) = a3;
  *(void *)(a6 + 24) = sub_10000A1F8;
  *(void *)(a6 + 32) = v24;
  *(double *)(a6 + 40) = v12;
  *(void *)&double result = 3;
  *(_OWORD *)(a6 + 48) = xmmword_100054330;
  *(void *)(a6 + 64) = v26;
  *(void *)(a6 + 72) = v27;
  return result;
}

uint64_t sub_100021170()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t destroy for BottomButtonsView()
{
  swift_release();
  swift_release();
  swift_release();

  return swift_release();
}

uint64_t initializeWithCopy for BottomButtonsView(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v4;
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for BottomButtonsView(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_retain();
  swift_release();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v4;
  swift_retain();
  swift_release();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_retain();
  swift_release();
  return a1;
}

__n128 initializeWithTake for BottomButtonsView(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  __n128 result = *(__n128 *)(a2 + 16);
  long long v3 = *(_OWORD *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v4;
  *(__n128 *)(a1 + 16) = result;
  *(_OWORD *)(a1 + 32) = v3;
  return result;
}

uint64_t assignWithTake for BottomButtonsView(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_release();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for BottomButtonsView(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 80)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for BottomButtonsView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 72) = 0;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 80) = 1;
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
    *(unsigned char *)(result + 80) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for BottomButtonsView()
{
  return &type metadata for BottomButtonsView;
}

uint64_t sub_10002146C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10002148C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_100020540(a1, v2 + 16, a2);
}

uint64_t sub_100021494(uint64_t a1)
{
  return a1;
}

uint64_t sub_1000214E8()
{
  uint64_t v1 = type metadata accessor for GeometryProxy();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 96) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v5, v6);
}

uint64_t sub_1000215CC()
{
  type metadata accessor for GeometryProxy();

  return sub_100020EA8();
}

uint64_t sub_100021630(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100006380(&qword_10006B1E0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10002169C()
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 96, 7);
}

unint64_t sub_1000216F0()
{
  unint64_t result = qword_10006B950;
  if (!qword_10006B950)
  {
    sub_10000646C(&qword_10006B958);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006B950);
  }
  return result;
}

uint64_t sub_100021750(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_100021778(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_1000217A0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>, double a8@<D0>, double a9@<D1>, double a10@<D2>, double a11@<D3>, double a12@<D4>)
{
  uint64_t v73 = a5;
  uint64_t v70 = a2;
  uint64_t v71 = a4;
  uint64_t v64 = a1;
  double v20 = (int *)type metadata accessor for IconView();
  uint64_t v65 = *((void *)v20 - 1);
  __chkstk_darwin(v20);
  uint64_t v66 = v21;
  uint64_t v67 = (uint64_t)v57 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = sub_100006380(&qword_10006B960);
  __chkstk_darwin(v22 - 8);
  long long v60 = (char *)v57 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v62 = sub_100006380(&qword_10006B538);
  uint64_t v61 = *(void *)(v62 - 8);
  __chkstk_darwin(v62);
  char v58 = (char *)v57 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = sub_100006380(&qword_10006B968);
  uint64_t v68 = *(void *)(v25 - 8);
  uint64_t v69 = v25;
  __chkstk_darwin(v25);
  unsigned __int8 v63 = (char *)v57 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for CGSize(0);
  long long v74 = 0uLL;
  State.init(wrappedValue:)();
  uint64_t v27 = v77;
  *(_OWORD *)(a7 + 56) = v76;
  *(void *)(a7 + 72) = v27;
  if (qword_10006AE28 != -1) {
    swift_once();
  }
  CGRect v28 = (unsigned char *)(static AXLTCaptionsProvider.shared + OBJC_IVAR___AXLTCaptionsProvider_isTranscribing);
  swift_beginAccess();
  LOBYTE(v75) = *v28;
  State.init(wrappedValue:)();
  uint64_t v29 = *((void *)&v74 + 1);
  *(unsigned char *)(a7 + 80) = v74;
  *(void *)(a7 + 96) = 0;
  *(void *)(a7 + 104) = 0;
  *(void *)(a7 + 88) = v29;
  *(void *)(a7 + 112) = nullsub_1;
  *(void *)(a7 + 120) = 0;
  *(void *)(a7 + 128) = 0x4024000000000000;
  uint64_t v75 = 0;
  sub_100006380(&qword_10006B428);
  State.init(wrappedValue:)();
  *(_OWORD *)(a7 + 136) = v74;
  uint64_t v30 = (uint64_t *)(a7 + v20[12]);
  *uint64_t v30 = swift_getKeyPath();
  sub_100006380(&qword_10006B418);
  swift_storeEnumTagMultiPayload();
  uint64_t v31 = v20[13];
  *(void *)(a7 + v31) = [objc_allocWithZone((Class)type metadata accessor for ForeheadWindow()) init];
  uint64_t v59 = v20[14];
  *(void *)(a7 + v59) = 0;
  *(double *)(a7 + 96) = a11;
  *(double *)(a7 + 104) = a12;
  os_log_type_t v32 = static os_log_type_t.debug.getter();
  if (qword_10006AD90 != -1) {
    swift_once();
  }
  uint64_t v33 = qword_10006DF88;
  BOOL v34 = os_log_type_enabled((os_log_t)qword_10006DF88, v32);
  uint64_t v72 = a3;
  if (v34)
  {
    uint64_t v35 = (uint8_t *)swift_slowAlloc();
    uint64_t v75 = swift_slowAlloc();
    *(_DWORD *)uint64_t v35 = 136315138;
    *(double *)&long long v74 = a11;
    *((double *)&v74 + 1) = a12;
    uint64_t v36 = String.init<A>(describing:)();
    *(void *)&long long v74 = sub_10000E634(v36, v37, &v75);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v33, v32, "init containerSize: %s", v35, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    a3 = v72;
    swift_slowDealloc();
  }
  uint64_t v38 = v73;
  if (v73)
  {
    uint64_t v39 = swift_allocObject();
    *(void *)(v39 + 16) = v38;
    *(void *)(v39 + 24) = a6;
    uint64_t v40 = sub_10000A918;
  }
  else
  {
    uint64_t v40 = (uint64_t (*)())nullsub_1;
    uint64_t v39 = 0;
  }
  uint64_t v41 = swift_allocObject();
  *(void *)(v41 + 16) = v40;
  *(void *)(v41 + 24) = v39;
  v57[1] = a6;
  sub_10000A200(v38);
  swift_release();
  *(void *)(a7 + 112) = sub_1000253B4;
  *(void *)(a7 + 120) = v41;
  uint64_t v42 = v70;
  *(void *)a7 = v64;
  *(void *)(a7 + 8) = v42;
  *(double *)(a7 + 16) = a8;
  *(void *)(a7 + 24) = a3;
  *(void *)(a7 + 32) = v71;
  *(double *)(a7 + 40) = a9;
  *(double *)(a7 + 48) = a10;
  uint64_t v43 = *(void **)(a7 + v31);
  swift_beginAccess();
  swift_retain();
  swift_retain();
  id v44 = v43;
  swift_retain();
  swift_retain();
  sub_100006380(&qword_10006B080);
  uint64_t v45 = v58;
  Published.projectedValue.getter();
  swift_endAccess();

  *(void *)&long long v74 = [self mainRunLoop];
  uint64_t v46 = type metadata accessor for NSRunLoop.SchedulerOptions();
  uint64_t v47 = (uint64_t)v60;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v46 - 8) + 56))(v60, 1, 1, v46);
  sub_1000253DC();
  sub_1000068B8(&qword_10006B978, &qword_10006B538);
  sub_1000262E0(&qword_10006B980, (void (*)(uint64_t))sub_1000253DC);
  int v48 = v63;
  uint64_t v49 = v62;
  Publisher.receive<A>(on:options:)();
  sub_1000067B8(v47, &qword_10006B960);

  (*(void (**)(char *, uint64_t))(v61 + 8))(v45, v49);
  uint64_t v50 = v67;
  sub_10002541C(a7, v67);
  unint64_t v51 = (*(unsigned __int8 *)(v65 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v65 + 80);
  uint64_t v52 = swift_allocObject();
  sub_100025484(v50, v52 + v51);
  sub_1000068B8(&qword_10006B988, &qword_10006B968);
  uint64_t v53 = v69;
  uint64_t v54 = Publisher<>.sink(receiveValue:)();
  swift_release();
  sub_10000A210(v73);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v68 + 8))(v48, v53);
  uint64_t v55 = v59;
  uint64_t result = swift_release();
  *(void *)(a7 + v55) = v54;
  return result;
}

uint64_t type metadata accessor for IconView()
{
  uint64_t result = qword_10006B9E8;
  if (!qword_10006B9E8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_100022088@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v148 = a2;
  uint64_t v155 = type metadata accessor for NSNotificationCenter.Publisher();
  uint64_t v157 = *(void *)(v155 - 8);
  __chkstk_darwin(v155);
  uint64_t v134 = (char *)&v117 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for IconView();
  uint64_t v158 = *(void *)(v4 - 8);
  uint64_t v156 = *(void *)(v158 + 64);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v117 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v149 = type metadata accessor for GlobalCoordinateSpace();
  __chkstk_darwin(v149);
  uint64_t v120 = (char *)&v117 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v124 = type metadata accessor for DragGesture();
  uint64_t v126 = *(void *)(v124 - 8);
  __chkstk_darwin(v124);
  uint64_t v9 = (char *)&v117 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v128 = sub_100006380(&qword_10006AEB8);
  uint64_t v152 = *(void *)(v128 - 8);
  __chkstk_darwin(v128);
  uint64_t v122 = (char *)&v117 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_100006380(&qword_10006AEC0);
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v153 = v11;
  uint64_t v154 = v12;
  __chkstk_darwin(v11);
  uint64_t v125 = (char *)&v117 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_100006380(&qword_10006BA48);
  __chkstk_darwin(v14 - 8);
  double v16 = (uint64_t *)((char *)&v117 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v17 = sub_100006380(&qword_10006BA50);
  uint64_t v18 = v17 - 8;
  __chkstk_darwin(v17);
  double v20 = (char *)&v117 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = sub_100006380(&qword_10006BA58);
  uint64_t v118 = v21;
  __chkstk_darwin(v21);
  uint64_t v23 = (char *)&v117 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v127 = sub_100006380(&qword_10006BA60);
  uint64_t v129 = *(void *)(v127 - 8);
  __chkstk_darwin(v127);
  uint64_t v121 = (char *)&v117 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v132 = (void *)sub_100006380(&qword_10006BA68);
  uint64_t v131 = *(v132 - 1);
  __chkstk_darwin(v132);
  uint64_t v123 = (char *)&v117 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v151 = sub_100006380(&qword_10006BA70);
  __chkstk_darwin(v151);
  uint64_t v130 = (char *)&v117 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v133 = sub_100006380(&qword_10006BA78);
  __chkstk_darwin(v133);
  uint64_t v136 = (uint64_t)&v117 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v135 = sub_100006380(&qword_10006BA80);
  __chkstk_darwin(v135);
  uint64_t v138 = (uint64_t)&v117 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v137 = sub_100006380(&qword_10006BA88);
  __chkstk_darwin(v137);
  uint64_t v140 = (uint64_t)&v117 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v139 = sub_100006380(&qword_10006BA90);
  __chkstk_darwin(v139);
  uint64_t v141 = (uint64_t)&v117 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v142 = sub_100006380(&qword_10006BA98);
  __chkstk_darwin(v142);
  uint64_t v144 = (uint64_t)&v117 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v147 = sub_100006380(&qword_10006BAA0);
  __chkstk_darwin(v147);
  uint64_t v143 = (char *)&v117 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v33);
  id v146 = (char *)&v117 - v34;
  __chkstk_darwin(v35);
  uint64_t v145 = (char *)&v117 - v36;
  *double v16 = static Alignment.center.getter();
  v16[1] = v37;
  uint64_t v38 = sub_100006380(&qword_10006BAA8);
  sub_10002344C(a1, (uint64_t)v16 + *(int *)(v38 + 44));
  AXDeviceIsPad();
  AXDeviceIsPad();
  static Alignment.center.getter();
  _FrameLayout.init(width:height:alignment:)();
  sub_100006754((uint64_t)v16, (uint64_t)v20, &qword_10006BA48);
  uint64_t v39 = &v20[*(int *)(v18 + 44)];
  long long v40 = v164;
  *(_OWORD *)uint64_t v39 = v163;
  *((_OWORD *)v39 + 1) = v40;
  *((_OWORD *)v39 + 2) = v165;
  sub_1000067B8((uint64_t)v16, &qword_10006BA48);
  uint64_t v119 = v23;
  sub_100006754((uint64_t)v20, (uint64_t)v23, &qword_10006BA50);
  v23[*(int *)(v21 + 36)] = 0;
  sub_1000067B8((uint64_t)v20, &qword_10006BA50);
  static CoordinateSpaceProtocol<>.global.getter();
  DragGesture.init<A>(minimumDistance:coordinateSpace:)();
  sub_10002541C(a1, (uint64_t)v6);
  uint64_t v41 = *(unsigned __int8 *)(v158 + 80);
  uint64_t v42 = (v41 + 16) & ~v41;
  v156 += v42;
  uint64_t v158 = v41 | 7;
  uint64_t v43 = swift_allocObject();
  sub_100025484((uint64_t)v6, v43 + v42);
  sub_1000262E0(&qword_10006AEE8, (void (*)(uint64_t))&type metadata accessor for DragGesture);
  sub_1000262E0(&qword_10006AEF0, (void (*)(uint64_t))&type metadata accessor for DragGesture.Value);
  id v44 = v122;
  uint64_t v45 = v124;
  Gesture<>.onChanged(_:)();
  swift_release();
  (*(void (**)(char *, uint64_t))(v126 + 8))(v9, v45);
  uint64_t v46 = (uint64_t)v6;
  sub_10002541C(a1, (uint64_t)v6);
  uint64_t v47 = swift_allocObject();
  sub_100025484((uint64_t)v6, v47 + v42);
  sub_1000068B8(&qword_10006AEF8, &qword_10006AEB8);
  int v48 = v125;
  uint64_t v49 = v128;
  Gesture.onEnded(_:)();
  swift_release();
  (*(void (**)(char *, uint64_t))(v152 + 8))(v44, v49);
  static GestureMask.all.getter();
  unint64_t v50 = sub_1000263C8();
  uint64_t v51 = sub_1000068B8(&qword_10006AF28, &qword_10006AEC0);
  uint64_t v52 = v121;
  uint64_t v53 = v118;
  uint64_t v54 = v153;
  uint64_t v55 = (uint64_t)v119;
  View.gesture<A>(_:including:)();
  uint64_t v56 = v48;
  uint64_t v57 = v42;
  (*(void (**)(char *, uint64_t))(v154 + 8))(v56, v54);
  sub_1000067B8(v55, &qword_10006BA58);
  uint64_t v150 = a1;
  sub_10002541C(a1, v46);
  uint64_t v58 = swift_allocObject();
  uint64_t v154 = v46;
  sub_100025484(v46, v58 + v42);
  uint64_t v159 = v53;
  uint64_t v160 = v54;
  unint64_t v161 = v50;
  uint64_t v162 = v51;
  uint64_t v59 = v123;
  swift_getOpaqueTypeConformance2();
  uint64_t v60 = v127;
  View.onTapGesture(count:perform:)();
  swift_release();
  (*(void (**)(char *, uint64_t))(v129 + 8))(v52, v60);
  uint64_t v61 = self;
  id v62 = [v61 defaultCenter];
  if (qword_10006ADC8 != -1) {
    swift_once();
  }
  unsigned __int8 v63 = v134;
  NSNotificationCenter.publisher(for:object:)();

  uint64_t v64 = v154;
  sub_10002541C(v150, v154);
  uint64_t v65 = swift_allocObject();
  sub_100025484(v64, v65 + v57);
  uint64_t v66 = v131;
  uint64_t v67 = *(void (**)(char *, char *, void *))(v131 + 16);
  uint64_t v68 = (uint64_t)v130;
  uint64_t v149 = v57;
  uint64_t v69 = v132;
  v67(v130, v59, v132);
  uint64_t v70 = v151;
  uint64_t v71 = v68 + *(int *)(v151 + 52);
  uint64_t v72 = v157;
  uint64_t v73 = v155;
  uint64_t v152 = *(void *)(v157 + 16);
  uint64_t v153 = v157 + 16;
  ((void (*)(uint64_t, char *, uint64_t))v152)(v71, v63, v155);
  long long v74 = (void *)(v68 + *(int *)(v70 + 56));
  void *v74 = sub_100026578;
  v74[1] = v65;
  uint64_t v75 = *(void (**)(char *, uint64_t))(v72 + 8);
  uint64_t v157 = v72 + 8;
  uint64_t v151 = (uint64_t)v75;
  v75(v63, v73);
  (*(void (**)(char *, void *))(v66 + 8))(v59, v69);
  id v76 = [v61 defaultCenter];
  uint64_t v132 = v61;
  if (qword_10006ADA0 != -1) {
    swift_once();
  }
  NSNotificationCenter.publisher(for:object:)();

  uint64_t v77 = v150;
  uint64_t v78 = v154;
  sub_10002541C(v150, v154);
  uint64_t v79 = swift_allocObject();
  sub_100025484(v78, v79 + v149);
  uint64_t v80 = v136;
  sub_100006754(v68, v136, &qword_10006BA70);
  uint64_t v81 = v133;
  uint64_t v82 = v155;
  ((void (*)(uint64_t, char *, uint64_t))v152)(v80 + *(int *)(v133 + 52), v63, v155);
  id v83 = (void *)(v80 + *(int *)(v81 + 56));
  void *v83 = sub_100026578;
  v83[1] = v79;
  ((void (*)(char *, uint64_t))v151)(v63, v82);
  sub_1000067B8(v68, &qword_10006BA70);
  id v84 = v132;
  id v85 = [v132 defaultCenter];
  NSNotificationCenter.publisher(for:object:)();

  sub_10002541C(v77, v78);
  uint64_t v86 = swift_allocObject();
  sub_100025484(v78, v86 + v149);
  uint64_t v87 = v138;
  sub_100006754(v80, v138, &qword_10006BA78);
  uint64_t v88 = v135;
  ((void (*)(uint64_t, char *, uint64_t))v152)(v87 + *(int *)(v135 + 52), v63, v82);
  uint64_t v89 = (uint64_t (**)(uint64_t))(v87 + *(int *)(v88 + 56));
  char *v89 = sub_1000265E8;
  v89[1] = (uint64_t (*)(uint64_t))v86;
  ((void (*)(char *, uint64_t))v151)(v63, v82);
  sub_1000067B8(v80, &qword_10006BA78);
  id v90 = [v84 defaultCenter];
  if (qword_10006ADE8 != -1) {
    swift_once();
  }
  NSNotificationCenter.publisher(for:object:)();

  uint64_t v91 = v150;
  uint64_t v92 = v154;
  sub_10002541C(v150, v154);
  uint64_t v93 = swift_allocObject();
  uint64_t v94 = v149;
  sub_100025484(v92, v93 + v149);
  uint64_t v95 = v87;
  uint64_t v96 = v87;
  uint64_t v97 = v140;
  sub_100006754(v95, v140, &qword_10006BA80);
  uint64_t v98 = v137;
  uint64_t v99 = v155;
  ((void (*)(uint64_t, char *, uint64_t))v152)(v97 + *(int *)(v137 + 52), v63, v155);
  uint64_t v100 = (uint64_t (**)(uint64_t))(v97 + *(int *)(v98 + 56));
  unsigned char *v100 = sub_100026604;
  v100[1] = (uint64_t (*)(uint64_t))v93;
  ((void (*)(char *, uint64_t))v151)(v63, v99);
  sub_1000067B8(v96, &qword_10006BA80);
  sub_10002541C(v91, v92);
  uint64_t v101 = swift_allocObject();
  sub_100025484(v92, v101 + v94);
  uint64_t v102 = v141;
  sub_100006754(v97, v141, &qword_10006BA88);
  uint64_t v103 = (uint64_t (**)())(v102 + *(int *)(v139 + 36));
  *uint64_t v103 = sub_100026620;
  v103[1] = (uint64_t (*)())v101;
  v103[2] = 0;
  v103[3] = 0;
  sub_1000067B8(v97, &qword_10006BA88);
  sub_10002541C(v91, v92);
  uint64_t v104 = swift_allocObject();
  sub_100025484(v92, v104 + v94);
  uint64_t v105 = v144;
  sub_100006754(v102, v144, &qword_10006BA90);
  uint64_t v106 = (void *)(v105 + *(int *)(v142 + 36));
  *uint64_t v106 = 0;
  v106[1] = 0;
  v106[2] = sub_100026680;
  v106[3] = v104;
  sub_1000067B8(v102, &qword_10006BA90);
  uint64_t v159 = static AXLTUtilities.AXLTLocString(_:)();
  uint64_t v160 = v107;
  sub_10000EFF4();
  uint64_t v108 = Text.init<A>(_:)();
  uint64_t v110 = v109;
  char v112 = v111 & 1;
  sub_100026B48(&qword_10006BAD8, &qword_10006BA98, (void (*)(void))sub_1000266E0);
  uint64_t v113 = (uint64_t)v143;
  View.accessibility(label:)();
  sub_10000F048(v108, v110, v112);
  swift_bridgeObjectRelease();
  sub_1000067B8(v105, &qword_10006BA98);
  uint64_t v114 = (uint64_t)v146;
  ModifiedContent<>.accessibility(identifier:)();
  sub_1000067B8(v113, &qword_10006BAA0);
  uint64_t v115 = (uint64_t)v145;
  ModifiedContent<>.accessibilityCustomAttribute(_:value:)();
  sub_1000067B8(v114, &qword_10006BAA0);
  return sub_10000A940(v115, v148, &qword_10006BAA0);
}

uint64_t sub_10002344C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v54 = type metadata accessor for AccessibilityTraits();
  uint64_t v53 = *(void *)(v54 - 8);
  __chkstk_darwin(v54);
  uint64_t v51 = (char *)&v40 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100006380(&qword_10006BAF8);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v40 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for Image.ResizingMode();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v40 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100006380(&qword_10006BB00);
  __chkstk_darwin(v12 - 8);
  uint64_t v52 = (uint64_t)&v40 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  int v48 = (char *)&v40 - v15;
  __chkstk_darwin(v16);
  uint64_t v50 = (uint64_t)&v40 - v17;
  static Color.white.getter();
  uint64_t v49 = Color.opacity(_:)();
  swift_release();
  AXDeviceIsPad();
  AXDeviceIsPad();
  static Alignment.center.getter();
  _FrameLayout.init(width:height:alignment:)();
  uint64_t v47 = v69;
  int v46 = v70;
  uint64_t v45 = v71;
  int v44 = v72;
  uint64_t v43 = v73;
  uint64_t v42 = v74;
  uint64_t v18 = *(void *)(a1 + 88);
  LOBYTE(v55) = *(unsigned char *)(a1 + 80);
  uint64_t v56 = v18;
  sub_100006380(&qword_10006B638);
  State.wrappedValue.getter();
  Image.init(_internalSystemName:)();
  (*(void (**)(char *, void, uint64_t))(v9 + 104))(v11, enum case for Image.ResizingMode.stretch(_:), v8);
  Image.resizable(capInsets:resizingMode:)();
  swift_release();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  uint64_t v19 = *(void *)(a1 + 88);
  LOBYTE(v55) = *(unsigned char *)(a1 + 80);
  uint64_t v56 = v19;
  State.wrappedValue.getter();
  if (v75 == 1)
  {
    uint64_t v20 = type metadata accessor for SymbolRenderingMode();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v7, 1, 1, v20);
  }
  else
  {
    static SymbolRenderingMode.hierarchical.getter();
    uint64_t v21 = type metadata accessor for SymbolRenderingMode();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56))(v7, 0, 1, v21);
  }
  uint64_t v41 = Image.symbolRenderingMode(_:)();
  swift_release();
  sub_1000067B8((uint64_t)v7, &qword_10006BAF8);
  sub_100023B9C();
  sub_100023B9C();
  static Alignment.center.getter();
  _FrameLayout.init(width:height:alignment:)();
  uint64_t v22 = v75;
  char v23 = v76;
  uint64_t v24 = v77;
  char v25 = v78;
  uint64_t v26 = v79;
  uint64_t v27 = v80;
  uint64_t v28 = *(void *)(a1 + 88);
  LOBYTE(v55) = *(unsigned char *)(a1 + 80);
  uint64_t v56 = v28;
  State.wrappedValue.getter();
  double v29 = 0.0;
  if ((v68 & 1) == 0) {
    double v29 = sub_100023B9C() / 15.0;
  }
  double v30 = sub_100023B9C() / 15.0;
  uint64_t v31 = static Color.white.getter();
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v55 = v41;
  uint64_t v56 = 0;
  __int16 v57 = 1;
  uint64_t v58 = v22;
  char v59 = v23;
  uint64_t v60 = v24;
  char v61 = v25;
  uint64_t v62 = v26;
  uint64_t v63 = v27;
  double v64 = v29;
  double v65 = v30;
  uint64_t v66 = KeyPath;
  uint64_t v67 = v31;
  uint64_t v33 = v51;
  static AccessibilityTraits.isImage.getter();
  sub_100006380(&qword_10006BB08);
  sub_100026A7C();
  uint64_t v34 = (uint64_t)v48;
  View.accessibility(removeTraits:)();
  (*(void (**)(char *, uint64_t))(v53 + 8))(v33, v54);
  swift_release();
  swift_release();
  swift_release();
  uint64_t v35 = v50;
  sub_10000A940(v34, v50, &qword_10006BB00);
  uint64_t v36 = v52;
  sub_100006754(v35, v52, &qword_10006BB00);
  *(void *)a2 = v49;
  *(_WORD *)(a2 + 8) = 256;
  *(void *)(a2 + 16) = v47;
  *(unsigned char *)(a2 + 24) = v46;
  *(void *)(a2 + 32) = v45;
  *(unsigned char *)(a2 + 40) = v44;
  uint64_t v37 = v42;
  *(void *)(a2 + 48) = v43;
  *(void *)(a2 + 56) = v37;
  uint64_t v38 = sub_100006380(&qword_10006BB28);
  sub_100006754(v36, a2 + *(int *)(v38 + 48), &qword_10006BB00);
  swift_retain();
  sub_1000067B8(v35, &qword_10006BB00);
  sub_1000067B8(v36, &qword_10006BB00);
  return swift_release();
}

double sub_100023B9C()
{
  sub_100006380(&qword_10006B638);
  State.wrappedValue.getter();
  int IsPad = AXDeviceIsPad();
  double result = 32.1428571;
  if (IsPad) {
    double result = 40.4761905;
  }
  double v2 = 34.0;
  if (!IsPad) {
    double v2 = 27.0;
  }
  if (v3) {
    return v2;
  }
  return result;
}

uint64_t sub_100023C20(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = type metadata accessor for IconView();
  __chkstk_darwin(v3);
  uint64_t v40 = (uint64_t)&v39 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for LayoutDirection();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v39 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v11 = (char *)&v39 - v10;
  uint64_t v12 = *(void *)(a2 + 8);
  uint64_t v13 = *(void *)(a2 + 16);
  *(void *)&long long v41 = *(void *)a2;
  *((void *)&v41 + 1) = v12;
  uint64_t v42 = v13;
  sub_100006380(&qword_10006BAF0);
  uint64_t v14 = Binding.wrappedValue.getter();
  if (v45 < 1.0)
  {
    uint64_t v39 = (uint64_t)&v39;
    __chkstk_darwin(v14);
    static Animation.default.getter();
    withAnimation<A>(_:_:)();
    swift_release();
  }
  DragGesture.Value.translation.getter();
  double v45 = v15;
  double v46 = v16;
  sub_10000E33C((uint64_t)v11);
  (*(void (**)(char *, void, uint64_t))(v6 + 104))(v8, enum case for LayoutDirection.rightToLeft(_:), v5);
  char v17 = static LayoutDirection.== infix(_:_:)();
  uint64_t v18 = *(void (**)(char *, uint64_t))(v6 + 8);
  v18(v8, v5);
  v18(v11, v5);
  if (v17) {
    double v45 = -v45;
  }
  uint64_t v19 = *(void *)(a2 + 56);
  uint64_t v20 = *(void *)(a2 + 64);
  uint64_t v21 = *(void *)(a2 + 72);
  *(void *)&long long v41 = v19;
  *((void *)&v41 + 1) = v20;
  uint64_t v42 = v21;
  sub_100006380(&qword_10006AF30);
  State.wrappedValue.getter();
  v47.CGFloat width = 0.0;
  v47.CGFloat height = 0.0;
  if (!CGSizeEqualToSize(v44, v47))
  {
    *(void *)&long long v41 = v19;
    *((void *)&v41 + 1) = v20;
    uint64_t v42 = v21;
    State.wrappedValue.getter();
    double v22 = vabdd_f64(v44.width, v45);
    uint64_t v23 = v40;
    sub_10002541C(a2, v40);
    if (v22 >= 2.0)
    {
      sub_1000269C8(v23);
    }
    else
    {
      uint64_t v24 = *(void *)(v23 + 72);
      long long v41 = *(_OWORD *)(v23 + 56);
      uint64_t v42 = v24;
      State.wrappedValue.getter();
      double v25 = vabdd_f64(v44.height, v46);
      uint64_t result = sub_1000269C8(v23);
      if (v25 < 2.0) {
        return result;
      }
    }
  }
  uint64_t v27 = *(void *)(a2 + 56);
  uint64_t v28 = *(void *)(a2 + 64);
  uint64_t v29 = *(void *)(a2 + 72);
  *(void *)&long long v41 = v27;
  *((void *)&v41 + 1) = v28;
  uint64_t v42 = v29;
  State.wrappedValue.getter();
  v48.CGFloat width = 0.0;
  v48.CGFloat height = 0.0;
  if (CGSizeEqualToSize(v44, v48))
  {
    uint64_t v30 = *(void *)(a2 + 24);
    uint64_t v31 = *(void *)(a2 + 32);
    uint64_t v32 = *(void *)(a2 + 40);
    uint64_t v33 = *(void *)(a2 + 48);
    *(void *)&long long v41 = v30;
    *((void *)&v41 + 1) = v31;
    uint64_t v42 = v32;
    uint64_t v43 = v33;
    sub_100006380(&qword_10006AF38);
    Binding.wrappedValue.getter();
    CGSize v34 = v44;
    if (AXDeviceIsPad()) {
      double v35 = 68.0;
    }
    else {
      double v35 = 54.0;
    }
    safeOffset(offset:size:containerSize:foreheadWindowRect:)(v34.width, v34.height, v35, v35, *(double *)(a2 + 96), *(double *)(a2 + 104), CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    *(void *)&long long v41 = v30;
    *((void *)&v41 + 1) = v31;
    uint64_t v42 = v32;
    uint64_t v43 = v33;
    v44.CGFloat width = v36;
    v44.CGFloat height = v37;
    Binding.wrappedValue.setter();
    *(void *)&long long v41 = v30;
    *((void *)&v41 + 1) = v31;
    uint64_t v42 = v32;
    uint64_t v43 = v33;
    Binding.wrappedValue.getter();
    *(void *)&long long v41 = v27;
    *((void *)&v41 + 1) = v28;
    uint64_t v42 = v29;
    State.wrappedValue.setter();
  }
  static Animation.linear(duration:)();
  Animation.delay(_:)();
  swift_release();
  Animation.repeatCount(_:autoreverses:)();
  uint64_t v38 = swift_release();
  __chkstk_darwin(v38);
  withAnimation<A>(_:_:)();
  return swift_release();
}

uint64_t sub_1000240F8(double a1, double a2)
{
  uint64_t v3 = (uint64_t)v2;
  uint64_t v6 = type metadata accessor for IconView();
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)&v32 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = v2[8];
  uint64_t v11 = v2[9];
  *(void *)&long long v34 = v2[7];
  uint64_t v9 = v34;
  *((void *)&v34 + 1) = v10;
  *(void *)&long long v35 = v11;
  sub_100006380(&qword_10006AF30);
  State.wrappedValue.getter();
  double v12 = *(double *)&v36 + a1;
  uint64_t v14 = v2[4];
  uint64_t v15 = v2[5];
  uint64_t v16 = v2[6];
  *(void *)&long long v34 = v2[3];
  uint64_t v13 = v34;
  *((void *)&v34 + 1) = v14;
  *(void *)&long long v35 = v15;
  *((void *)&v35 + 1) = v16;
  swift_retain();
  swift_retain();
  sub_100006380(&qword_10006AF38);
  Binding.wrappedValue.getter();
  *(void *)&long long v34 = v13;
  *((void *)&v34 + 1) = v14;
  *(void *)&long long v35 = v15;
  *((void *)&v35 + 1) = v16;
  uint64_t v32 = *(void *)&v12;
  double v33 = *((double *)&v36 + 1);
  Binding.wrappedValue.setter();
  swift_release();
  swift_release();
  *(void *)&long long v34 = v9;
  *((void *)&v34 + 1) = v10;
  *(void *)&long long v35 = v11;
  State.wrappedValue.getter();
  double v17 = *((double *)&v36 + 1) + a2;
  *(void *)&long long v34 = v13;
  *((void *)&v34 + 1) = v14;
  *(void *)&long long v35 = v15;
  *((void *)&v35 + 1) = v16;
  swift_retain();
  swift_retain();
  Binding.wrappedValue.getter();
  *(void *)&long long v34 = v13;
  *((void *)&v34 + 1) = v14;
  *(void *)&long long v35 = v15;
  *((void *)&v35 + 1) = v16;
  uint64_t v32 = v36;
  double v33 = v17;
  Binding.wrappedValue.setter();
  swift_release();
  swift_release();
  *(void *)&long long v34 = v13;
  *((void *)&v34 + 1) = v14;
  *(void *)&long long v35 = v15;
  *((void *)&v35 + 1) = v16;
  Binding.wrappedValue.getter();
  long long v18 = v36;
  if (AXDeviceIsPad()) {
    double v19 = 68.0;
  }
  else {
    double v19 = 54.0;
  }
  double v20 = *((double *)v2 + 12);
  double v21 = *((double *)v2 + 13);
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  safeOffset(offset:size:containerSize:foreheadWindowRect:)(*(double *)&v18, *((CGFloat *)&v18 + 1), v19, v19, v20, v21, *(CGFloat *)&v34, *((CGFloat *)&v34 + 1), *(CGFloat *)&v35, *((CGFloat *)&v35 + 1));
  uint64_t v22 = v2[4];
  *(void *)&long long v34 = v2[3];
  *((void *)&v34 + 1) = v22;
  long long v35 = *(_OWORD *)(v2 + 5);
  *(void *)&long long v36 = v23;
  *((void *)&v36 + 1) = v24;
  Binding.wrappedValue.setter();
  os_log_type_t v25 = static os_log_type_t.debug.getter();
  if (qword_10006AD90 != -1) {
    swift_once();
  }
  uint64_t v26 = qword_10006DF88;
  sub_10002541C(v3, (uint64_t)v8);
  if (!os_log_type_enabled(v26, v25)) {
    return sub_1000269C8((uint64_t)v8);
  }
  uint64_t v27 = (uint8_t *)swift_slowAlloc();
  uint64_t v32 = swift_slowAlloc();
  *(_DWORD *)uint64_t v27 = 136315138;
  uint64_t v28 = *((void *)v8 + 4);
  *(void *)&long long v34 = *((void *)v8 + 3);
  *((void *)&v34 + 1) = v28;
  long long v35 = *(_OWORD *)(v8 + 40);
  Binding.wrappedValue.getter();
  long long v34 = v36;
  type metadata accessor for CGSize(0);
  uint64_t v29 = String.init<A>(describing:)();
  *(void *)&long long v34 = sub_10000E634(v29, v30, &v32);
  UnsafeMutableRawBufferPointer.copyMemory(from:)();
  swift_bridgeObjectRelease();
  sub_1000269C8((uint64_t)v8);
  _os_log_impl((void *)&_mh_execute_header, v26, v25, "changeOffset iconOffset: %s", v27, 0xCu);
  swift_arrayDestroy();
  swift_slowDealloc();
  return swift_slowDealloc();
}

uint64_t sub_1000244F8()
{
  return sub_100024968();
}

void sub_1000245DC(uint64_t a1)
{
  sub_100006380(&qword_10006AF38);
  Binding.wrappedValue.getter();
  sub_10002DC0C(3, v2, v3, *(double *)(a1 + 96), *(double *)(a1 + 104));
  Binding.wrappedValue.setter();
  sub_100024684();
}

void sub_100024684()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for IconView();
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)&v17 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v5 = [self standardUserDefaults];
  CGFloat v6 = *(double *)(v0 + 32);
  v19.CGFloat width = *(CGFloat *)(v0 + 24);
  v19.CGFloat height = v6;
  long long v20 = *(_OWORD *)(v0 + 40);
  sub_100006380(&qword_10006AF38);
  Binding.wrappedValue.getter();
  uint64_t v7 = NSStringFromCGSize(v21);
  if (!v7)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v7 = (NSString *)String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  NSString v8 = String._bridgeToObjectiveC()();
  [v5 setObject:v7 forKey:v8];

  [v5 synchronize];
  os_log_type_t v9 = static os_log_type_t.debug.getter();
  if (qword_10006AD90 != -1) {
    swift_once();
  }
  uint64_t v10 = qword_10006DF88;
  sub_10002541C(v1, (uint64_t)v4);
  if (os_log_type_enabled(v10, v9))
  {
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    uint64_t v12 = swift_slowAlloc();
    *(_DWORD *)uint64_t v11 = 136315138;
    CGFloat v13 = *((double *)v4 + 3);
    CGFloat v14 = *((double *)v4 + 4);
    uint64_t v18 = v12;
    v19.CGFloat width = v13;
    v19.CGFloat height = v14;
    long long v20 = *(_OWORD *)(v4 + 40);
    Binding.wrappedValue.getter();
    CGSize v19 = v21;
    type metadata accessor for CGSize(0);
    uint64_t v15 = String.init<A>(describing:)();
    *(void *)&v19.CGFloat width = sub_10000E634(v15, v16, &v18);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    sub_1000269C8((uint64_t)v4);
    _os_log_impl((void *)&_mh_execute_header, v10, v9, "save iconOffset: %s", v11, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    sub_1000269C8((uint64_t)v4);
  }
}

uint64_t sub_100024968()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for IconView();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  __chkstk_darwin(v2 - 8);
  id v5 = &v17[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v6 = *(void *)(v0 + 8);
  uint64_t v7 = *(uint64_t (**)())(v0 + 16);
  *(void *)&long long aBlock = *(void *)v0;
  *((void *)&aBlock + 1) = v6;
  CGSize v19 = v7;
  sub_100006380(&qword_10006BAF0);
  uint64_t v8 = Binding.wrappedValue.getter();
  if (v23 < 1.0)
  {
    __chkstk_darwin(v8);
    *(void *)&v17[-16] = v0;
    static Animation.default.getter();
    withAnimation<A>(_:_:)();
    swift_release();
  }
  long long aBlock = *(_OWORD *)(v0 + 136);
  sub_100006380(&qword_10006B630);
  State.wrappedValue.getter();
  double v9 = v23;
  [*(id *)&v23 invalidate];

  uint64_t v10 = self;
  double v11 = *(double *)(v1 + 128);
  sub_10002541C(v1, (uint64_t)&v17[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)]);
  unint64_t v12 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v13 = swift_allocObject();
  sub_100025484((uint64_t)v5, v13 + v12);
  CGSize v21 = sub_100026908;
  uint64_t v22 = v13;
  *(void *)&long long aBlock = _NSConcreteStackBlock;
  *((void *)&aBlock + 1) = 1107296256;
  CGSize v19 = sub_1000315A8;
  long long v20 = &unk_100066B18;
  CGFloat v14 = _Block_copy(&aBlock);
  swift_release();
  double v15 = COERCE_DOUBLE([v10 scheduledTimerWithTimeInterval:0 repeats:v14 block:v11]);
  _Block_release(v14);
  long long aBlock = *(_OWORD *)(v1 + 136);
  double v23 = v15;
  return State.wrappedValue.setter();
}

uint64_t sub_100024C04()
{
  if (qword_10006AE28 != -1) {
    swift_once();
  }
  swift_beginAccess();
  sub_100006380(&qword_10006B638);
  return State.wrappedValue.setter();
}

uint64_t sub_100024CC0(uint64_t a1, uint64_t a2)
{
  sub_100006380(&qword_10006AF38);
  Binding.wrappedValue.getter();
  sub_10002DC0C(3, v4, v5, *(double *)(a2 + 96), *(double *)(a2 + 104));
  Binding.wrappedValue.setter();
  sub_100024684();
  sub_100006380(&qword_10006AF30);
  return State.wrappedValue.setter();
}

uint64_t sub_100024D90(uint64_t a1, void *a2)
{
  uint64_t result = Notification.userInfo.getter();
  if (result)
  {
    uint64_t v4 = result;
    uint64_t v9 = notificationValueKey.getter();
    AnyHashable.init<A>(_:)();
    if (*(void *)(v4 + 16) && (unint64_t v5 = sub_1000486C0((uint64_t)v10), (v6 & 1) != 0))
    {
      sub_10000E914(*(void *)(v4 + 56) + 32 * v5, (uint64_t)&v11);
    }
    else
    {
      long long v11 = 0u;
      long long v12 = 0u;
    }
    swift_bridgeObjectRelease();
    sub_10000ED94((uint64_t)v10);
    if (*((void *)&v12 + 1))
    {
      uint64_t result = swift_dynamicCast();
      if (result)
      {
        uint64_t v7 = a2[1];
        uint64_t v8 = a2[2];
        v10[0] = *a2;
        v10[1] = v7;
        v10[2] = v8;
        *(void *)&long long v11 = v9;
        sub_100006380(&qword_10006BAF0);
        return Binding.wrappedValue.setter();
      }
    }
    else
    {
      return sub_1000067B8((uint64_t)&v11, &qword_10006C150);
    }
  }
  return result;
}

uint64_t sub_100024EA4()
{
  sub_100006380(&qword_10006B630);
  State.wrappedValue.getter();
  [v1 invalidate];

  return State.wrappedValue.setter();
}

uint64_t sub_100024F24()
{
  CGFloat v5 = v0[3];
  CGFloat v6 = v0[4];
  CGFloat v7 = v0[5];
  CGFloat v8 = v0[6];
  sub_100006380(&qword_10006AF38);
  Binding.wrappedValue.getter();
  if (AXDeviceIsPad()) {
    double v1 = 68.0;
  }
  else {
    double v1 = 54.0;
  }
  double v2 = v0[12];
  double v3 = v0[13];
  type metadata accessor for IconView();
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  safeOffset(offset:size:containerSize:foreheadWindowRect:)(v9, v10, v1, v1, v2, v3, v5, v6, v7, v8);
  return Binding.wrappedValue.setter();
}

uint64_t sub_100025064()
{
  return Binding.wrappedValue.setter();
}

uint64_t sub_1000250C4()
{
  static os_log_type_t.debug.getter();
  if (qword_10006AD90 != -1) {
    swift_once();
  }
  uint64_t v0 = os_log(_:dso:log:_:_:)();
  __chkstk_darwin(v0);
  static Animation.default.getter();
  withAnimation<A>(_:_:)();
  return swift_release();
}

uint64_t sub_1000251BC()
{
  if (qword_10006AE20 != -1) {
    swift_once();
  }
  swift_beginAccess();
  sub_100006380(&qword_10006BAF0);
  return Binding.wrappedValue.setter();
}

uint64_t sub_100025288@<X0>(uint64_t a1@<X0>, uint64_t (**a2)@<X0>(uint64_t a1@<X8>)@<X8>)
{
  uint64_t v4 = *(void *)(a1 - 8);
  uint64_t v5 = *(void *)(v4 + 64);
  __chkstk_darwin(a1 - 8);
  sub_10002541C(v2, (uint64_t)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v6 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v7 = swift_allocObject();
  uint64_t result = sub_100025484((uint64_t)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v7 + v6);
  *a2 = sub_100026244;
  a2[1] = (uint64_t (*)@<X0>(uint64_t@<X8>))v7;
  return result;
}

uint64_t sub_10002537C()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_1000253B4()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

unint64_t sub_1000253DC()
{
  unint64_t result = qword_10006B970;
  if (!qword_10006B970)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10006B970);
  }
  return result;
}

uint64_t sub_10002541C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for IconView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100025484(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for IconView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000254E8()
{
  return sub_100024F24();
}

uint64_t sub_10002554C(uint64_t a1, uint64_t *a2, int *a3)
{
  int v3 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  uint64_t v4 = *a2;
  *(void *)a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    uint64_t v6 = v4 + ((v3 + 16) & ~(unint64_t)v3);
  }
  else
  {
    uint64_t v6 = a1;
    uint64_t v7 = a2[2];
    *(void *)(a1 + 8) = a2[1];
    *(void *)(a1 + 16) = v7;
    uint64_t v8 = a2[4];
    *(void *)(a1 + 24) = a2[3];
    *(void *)(a1 + 32) = v8;
    *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 5);
    *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 7);
    *(void *)(a1 + 72) = a2[9];
    *(unsigned char *)(a1 + 80) = *((unsigned char *)a2 + 80);
    *(void *)(a1 + 88) = a2[11];
    *(_OWORD *)(a1 + 96) = *((_OWORD *)a2 + 6);
    uint64_t v9 = a2[15];
    *(void *)(a1 + 112) = a2[14];
    *(void *)(a1 + 120) = v9;
    CGFloat v10 = (void *)a2[17];
    *(void *)(a1 + 128) = a2[16];
    *(void *)(a1 + 136) = v10;
    uint64_t v11 = a3[12];
    CGSize v19 = (uint64_t *)((char *)a2 + v11);
    long long v20 = (void *)(a1 + v11);
    *(void *)(a1 + 144) = a2[18];
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    id v12 = v10;
    swift_retain();
    sub_100006380(&qword_10006B418);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v13 = type metadata accessor for LayoutDirection();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v13 - 8) + 16))(v20, v19, v13);
    }
    else
    {
      void *v20 = *v19;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v14 = a3[13];
    uint64_t v15 = a3[14];
    unint64_t v16 = *(void **)((char *)a2 + v14);
    *(void *)(v6 + v14) = v16;
    *(void *)(v6 + v15) = *(uint64_t *)((char *)a2 + v15);
    id v17 = v16;
  }
  swift_retain();
  return v6;
}

uint64_t sub_10002574C(uint64_t a1, uint64_t a2)
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  swift_release();
  uint64_t v4 = a1 + *(int *)(a2 + 48);
  sub_100006380(&qword_10006B418);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v5 = type metadata accessor for LayoutDirection();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  }
  else
  {
    swift_release();
  }

  return swift_release();
}

uint64_t sub_100025850(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v5 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v5;
  uint64_t v6 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(unsigned char *)(a1 + 80) = *(unsigned char *)(a2 + 80);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
  uint64_t v7 = *(void *)(a2 + 120);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  *(void *)(a1 + 120) = v7;
  uint64_t v8 = *(void **)(a2 + 136);
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  *(void *)(a1 + 136) = v8;
  uint64_t v9 = a3[12];
  uint64_t v18 = (void *)(a1 + v9);
  id v17 = (void *)(a2 + v9);
  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  id v10 = v8;
  swift_retain();
  sub_100006380(&qword_10006B418);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v11 = type metadata accessor for LayoutDirection();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v11 - 8) + 16))(v18, v17, v11);
  }
  else
  {
    *uint64_t v18 = *v17;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v12 = a3[13];
  uint64_t v13 = a3[14];
  uint64_t v14 = *(void **)(a2 + v12);
  *(void *)(a1 + v12) = v14;
  *(void *)(a1 + v13) = *(void *)(a2 + v13);
  id v15 = v14;
  swift_retain();
  return a1;
}

uint64_t sub_100025A08(uint64_t a1, uint64_t a2, int *a3)
{
  *(void *)a1 = *(void *)a2;
  swift_retain();
  swift_release();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_retain();
  swift_release();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_retain();
  swift_release();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_retain();
  swift_release();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 80) = *(unsigned char *)(a2 + 80);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  swift_retain();
  swift_release();
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  uint64_t v6 = *(void *)(a2 + 120);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  *(void *)(a1 + 120) = v6;
  swift_retain();
  swift_release();
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  uint64_t v7 = *(void **)(a1 + 136);
  uint64_t v8 = *(void **)(a2 + 136);
  *(void *)(a1 + 136) = v8;
  id v9 = v8;

  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  swift_retain();
  swift_release();
  if (a1 != a2)
  {
    uint64_t v10 = a3[12];
    uint64_t v11 = (void *)(a1 + v10);
    uint64_t v12 = (void *)(a2 + v10);
    sub_1000067B8(a1 + v10, &qword_10006B418);
    sub_100006380(&qword_10006B418);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v13 = type metadata accessor for LayoutDirection();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v13 - 8) + 16))(v11, v12, v13);
    }
    else
    {
      *uint64_t v11 = *v12;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v14 = a3[13];
  id v15 = *(void **)(a2 + v14);
  unint64_t v16 = *(void **)(a1 + v14);
  *(void *)(a1 + v14) = v15;
  id v17 = v15;

  *(void *)(a1 + a3[14]) = *(void *)(a2 + a3[14]);
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_100025C3C(uint64_t a1, uint64_t a2, int *a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  long long v6 = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 96) = v6;
  *(_OWORD *)(a1 + 112) = *(_OWORD *)(a2 + 112);
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  uint64_t v7 = a3[12];
  uint64_t v8 = (void *)(a1 + v7);
  id v9 = (const void *)(a2 + v7);
  *(_OWORD *)(a1 + 136) = *(_OWORD *)(a2 + 136);
  uint64_t v10 = sub_100006380(&qword_10006B418);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v11 = type metadata accessor for LayoutDirection();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v11 - 8) + 32))(v8, v9, v11);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v8, v9, *(void *)(*(void *)(v10 - 8) + 64));
  }
  uint64_t v12 = a3[14];
  *(void *)(a1 + a3[13]) = *(void *)(a2 + a3[13]);
  *(void *)(a1 + v12) = *(void *)(a2 + v12);
  return a1;
}

uint64_t sub_100025D7C(uint64_t a1, uint64_t a2, int *a3)
{
  *(void *)a1 = *(void *)a2;
  swift_release();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_release();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_release();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_release();
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_release();
  *(unsigned char *)(a1 + 80) = *(unsigned char *)(a2 + 80);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  swift_release();
  long long v6 = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 112) = v6;
  swift_release();
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  uint64_t v7 = *(void **)(a1 + 136);
  *(void *)(a1 + 136) = *(void *)(a2 + 136);

  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  swift_release();
  if (a1 != a2)
  {
    uint64_t v8 = a3[12];
    id v9 = (void *)(a1 + v8);
    uint64_t v10 = (const void *)(a2 + v8);
    sub_1000067B8(a1 + v8, &qword_10006B418);
    uint64_t v11 = sub_100006380(&qword_10006B418);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v12 = type metadata accessor for LayoutDirection();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v12 - 8) + 32))(v9, v10, v12);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v9, v10, *(void *)(*(void *)(v11 - 8) + 64));
    }
  }
  uint64_t v13 = a3[13];
  uint64_t v14 = *(void **)(a1 + v13);
  *(void *)(a1 + v13) = *(void *)(a2 + v13);

  *(void *)(a1 + a3[14]) = *(void *)(a2 + a3[14]);
  swift_release();
  return a1;
}

uint64_t sub_100025F50(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100025F64);
}

uint64_t sub_100025F64(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = sub_100006380(&qword_10006B448);
    id v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 48);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_100026018(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10002602C);
}

uint64_t sub_10002602C(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_100006380(&qword_10006B448);
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 48);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

void sub_1000260D8()
{
  sub_1000261CC();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_1000261CC()
{
  if (!qword_10006B4B8)
  {
    type metadata accessor for LayoutDirection();
    unint64_t v0 = type metadata accessor for Environment.Content();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_10006B4B8);
    }
  }
}

uint64_t sub_100026224()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100026244@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *(void *)(type metadata accessor for IconView() - 8);
  uint64_t v4 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));

  return sub_100022088(v4, a1);
}

uint64_t sub_1000262C8(uint64_t a1)
{
  return sub_100026344(a1, sub_100023C20);
}

uint64_t sub_1000262E0(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_10002632C(uint64_t a1)
{
  return sub_100026344(a1, (uint64_t (*)(uint64_t, uint64_t))sub_1000244F8);
}

uint64_t sub_100026344(uint64_t a1, uint64_t (*a2)(uint64_t, uint64_t))
{
  uint64_t v4 = *(void *)(type metadata accessor for IconView() - 8);
  uint64_t v5 = v2 + ((*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));

  return a2(a1, v5);
}

unint64_t sub_1000263C8()
{
  unint64_t result = qword_10006BAB0;
  if (!qword_10006BAB0)
  {
    sub_10000646C(&qword_10006BA58);
    sub_100026468();
    sub_1000068B8(&qword_10006BAC8, &qword_10006BAD0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006BAB0);
  }
  return result;
}

unint64_t sub_100026468()
{
  unint64_t result = qword_10006BAB8;
  if (!qword_10006BAB8)
  {
    sub_10000646C(&qword_10006BA50);
    sub_1000068B8(&qword_10006BAC0, &qword_10006BA48);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006BAB8);
  }
  return result;
}

uint64_t sub_10002650C()
{
  uint64_t v1 = *(void *)(type metadata accessor for IconView() - 8);
  uint64_t v2 = v0 + ((*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80));
  uint64_t v3 = sub_100024968();
  return (*(uint64_t (**)(uint64_t))(v2 + 112))(v3);
}

uint64_t sub_10002657C()
{
  return sub_100024C04();
}

uint64_t sub_1000265E8(uint64_t a1)
{
  return sub_100026344(a1, sub_100024CC0);
}

uint64_t sub_100026604(uint64_t a1)
{
  return sub_100026344(a1, (uint64_t (*)(uint64_t, uint64_t))sub_100024D90);
}

uint64_t sub_100026620()
{
  return sub_100024968();
}

uint64_t sub_100026680()
{
  type metadata accessor for IconView();

  return sub_100024EA4();
}

unint64_t sub_1000266E0()
{
  unint64_t result = qword_10006BAE0;
  if (!qword_10006BAE0)
  {
    sub_10000646C(&qword_10006BA90);
    sub_1000068B8(&qword_10006BAE8, &qword_10006BA88);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006BAE0);
  }
  return result;
}

uint64_t sub_100026784()
{
  uint64_t v1 = type metadata accessor for IconView();
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*(void *)(v1 - 8) + 64);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  swift_release();
  uint64_t v5 = v0 + v3 + *(int *)(v1 + 48);
  sub_100006380(&qword_10006B418);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = type metadata accessor for LayoutDirection();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  }
  else
  {
    swift_release();
  }

  swift_release();

  return _swift_deallocObject(v0, v3 + v4, v2 | 7);
}

uint64_t sub_100026908()
{
  type metadata accessor for IconView();

  return sub_1000250C4();
}

uint64_t sub_100026978(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100026988()
{
  return swift_release();
}

uint64_t sub_100026990()
{
  return sub_100025064();
}

uint64_t sub_1000269AC()
{
  return sub_1000251BC();
}

uint64_t sub_1000269C8(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for IconView();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_100026A24()
{
  sub_1000245DC(*(void *)(v0 + 16));
}

uint64_t sub_100026A40()
{
  return sub_1000240F8(**(double **)(v0 + 24), *(double *)(*(void *)(v0 + 24) + 8));
}

unint64_t sub_100026A7C()
{
  unint64_t result = qword_10006BB10;
  if (!qword_10006BB10)
  {
    sub_10000646C(&qword_10006BB08);
    sub_100026B48(&qword_10006BB18, &qword_10006BB20, (void (*)(void))sub_10000EDE8);
    sub_1000068B8(&qword_10006B398, &qword_10006B3A0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006BB10);
  }
  return result;
}

uint64_t sub_100026B48(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10000646C(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100026BC4()
{
  return sub_1000068B8(&qword_10006BB30, &qword_10006BB38);
}

uint64_t sub_100026C00()
{
  return sub_100026990();
}

id sub_100026CDC()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for LTApplication();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for LTApplication()
{
  return self;
}

id sub_1000270B4()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for LTApplicationDelegate();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for LTApplicationDelegate()
{
  return self;
}

unint64_t sub_10002711C()
{
  unint64_t result = qword_10006BC00;
  if (!qword_10006BC00)
  {
    type metadata accessor for LaunchOptionsKey(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006BC00);
  }
  return result;
}

void *titleTextSpacing.unsafeMutableAddressor()
{
  return &titleTextSpacing;
}

uint64_t (*variable initialization expression of AXLTCaptionsView.swipeAction())()
{
  return nullsub_1;
}

uint64_t property wrapper backing initializer of AXLTCaptionsView.timer()
{
  sub_100006380(&qword_10006B428);
  State.init(wrappedValue:)();
  return v1;
}

uint64_t _s19LiveTranscriptionUI16AXLTCaptionsViewV14scrollToBottomSbvpfP_0()
{
  State.init(wrappedValue:)();
  return v1;
}

uint64_t property wrapper backing initializer of AXLTCaptionsView.contentHeight()
{
  State.init(wrappedValue:)();
  return v1;
}

uint64_t AXLTCaptionsView.body.getter@<X0>(uint64_t (**a1)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)@<X8>)
{
  uint64_t v3 = (uint64_t (*)@<X0>(uint64_t@<X0>, uint64_t@<X8>))swift_allocObject();
  long long v4 = v1[11];
  *((_OWORD *)v3 + 11) = v1[10];
  *((_OWORD *)v3 + 12) = v4;
  long long v5 = v1[13];
  *((_OWORD *)v3 + 13) = v1[12];
  *((_OWORD *)v3 + 14) = v5;
  long long v6 = v1[7];
  *((_OWORD *)v3 + 7) = v1[6];
  *((_OWORD *)v3 + 8) = v6;
  long long v7 = v1[9];
  *((_OWORD *)v3 + 9) = v1[8];
  *((_OWORD *)v3 + 10) = v7;
  long long v8 = v1[3];
  *((_OWORD *)v3 + 3) = v1[2];
  *((_OWORD *)v3 + 4) = v8;
  long long v9 = v1[5];
  *((_OWORD *)v3 + 5) = v1[4];
  *((_OWORD *)v3 + 6) = v9;
  long long v10 = v1[1];
  *((_OWORD *)v3 + 1) = *v1;
  *((_OWORD *)v3 + 2) = v10;
  *a1 = sub_1000276EC;
  a1[1] = v3;

  return sub_1000276F4((uint64_t)v1);
}

uint64_t sub_1000272EC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v31 = a1;
  uint64_t v33 = a3;
  uint64_t v4 = sub_100006380(&qword_10006BC20);
  __chkstk_darwin(v4 - 8);
  long long v6 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v32 = sub_100006380(&qword_10006BC28);
  __chkstk_darwin(v32);
  long long v8 = (char *)&v30 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v11 = (char *)&v30 - v10;
  uint64_t v12 = sub_100006380(&qword_10006BC30);
  __chkstk_darwin(v12);
  uint64_t v14 = (uint64_t (**)(uint64_t))((char *)&v30 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v15 = type metadata accessor for GeometryProxy();
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = *(void *)(v16 + 64);
  double v18 = __chkstk_darwin(v15);
  if ((*(unsigned char *)(a2 + 16) & 0xFE) == 2)
  {
    (*(void (**)(char *, uint64_t, uint64_t, double))(v16 + 16))((char *)&v30 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0), v31, v15, v18);
    unint64_t v19 = (*(unsigned __int8 *)(v16 + 80) + 240) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
    long long v20 = (char *)swift_allocObject();
    long long v21 = *(_OWORD *)(a2 + 176);
    *((_OWORD *)v20 + 11) = *(_OWORD *)(a2 + 160);
    *((_OWORD *)v20 + 12) = v21;
    long long v22 = *(_OWORD *)(a2 + 208);
    *((_OWORD *)v20 + 13) = *(_OWORD *)(a2 + 192);
    *((_OWORD *)v20 + 14) = v22;
    long long v23 = *(_OWORD *)(a2 + 112);
    *((_OWORD *)v20 + 7) = *(_OWORD *)(a2 + 96);
    *((_OWORD *)v20 + 8) = v23;
    long long v24 = *(_OWORD *)(a2 + 144);
    *((_OWORD *)v20 + 9) = *(_OWORD *)(a2 + 128);
    *((_OWORD *)v20 + 10) = v24;
    long long v25 = *(_OWORD *)(a2 + 48);
    *((_OWORD *)v20 + 3) = *(_OWORD *)(a2 + 32);
    *((_OWORD *)v20 + 4) = v25;
    long long v26 = *(_OWORD *)(a2 + 80);
    *((_OWORD *)v20 + 5) = *(_OWORD *)(a2 + 64);
    *((_OWORD *)v20 + 6) = v26;
    long long v27 = *(_OWORD *)(a2 + 16);
    *((_OWORD *)v20 + 1) = *(_OWORD *)a2;
    *((_OWORD *)v20 + 2) = v27;
    (*(void (**)(char *, char *, uint64_t))(v16 + 32))(&v20[v19], (char *)&v30 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0), v15);
    *uint64_t v14 = sub_10002C5C4;
    v14[1] = (uint64_t (*)(uint64_t))v20;
    swift_storeEnumTagMultiPayload();
    sub_1000276F4(a2);
    sub_100006380(&qword_10006BC40);
    sub_1000068B8(&qword_10006BC48, &qword_10006BC40);
    sub_10002C4FC();
    return _ConditionalContent<>.init(storage:)();
  }
  else
  {
    *(void *)long long v6 = static HorizontalAlignment.leading.getter();
    *((void *)v6 + 1) = 0x4018000000000000;
    v6[16] = 0;
    uint64_t v29 = sub_100006380(&qword_10006BC38);
    sub_10002A834((uint64_t *)a2, (uint64_t)&v6[*(int *)(v29 + 44)]);
    sub_100006754((uint64_t)v6, (uint64_t)v8, &qword_10006BC20);
    *(_WORD *)&v8[*(int *)(v32 + 36)] = 0;
    sub_1000067B8((uint64_t)v6, &qword_10006BC20);
    sub_10000A940((uint64_t)v8, (uint64_t)v11, &qword_10006BC28);
    sub_100006754((uint64_t)v11, (uint64_t)v14, &qword_10006BC28);
    swift_storeEnumTagMultiPayload();
    sub_100006380(&qword_10006BC40);
    sub_1000068B8(&qword_10006BC48, &qword_10006BC40);
    sub_10002C4FC();
    _ConditionalContent<>.init(storage:)();
    return sub_1000067B8((uint64_t)v11, &qword_10006BC28);
  }
}

uint64_t sub_1000276EC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1000272EC(a1, v2 + 16, a2);
}

uint64_t sub_1000276F4(uint64_t a1)
{
  uint64_t v4 = *(void **)(a1 + 176);
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_retain();
  id v2 = v4;
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t sub_1000277F0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10002780C@<X0>(uint64_t a1@<X0>, _OWORD *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v105 = a4;
  uint64_t v96 = type metadata accessor for LocalCoordinateSpace();
  __chkstk_darwin(v96);
  uint64_t v95 = (char *)&v79 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for DragGesture();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v98 = v8;
  uint64_t v99 = v9;
  __chkstk_darwin(v8);
  uint64_t v94 = (char *)&v79 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_100006380(&qword_10006AEB8);
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v101 = v11;
  uint64_t v102 = v12;
  __chkstk_darwin(v11);
  uint64_t v97 = (char *)&v79 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_100006380(&qword_10006AEC0);
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v103 = v14;
  uint64_t v104 = v15;
  __chkstk_darwin(v14);
  uint64_t v100 = (char *)&v79 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)&long long v93 = sub_100006380(&qword_10006BC70) - 8;
  __chkstk_darwin(v93);
  uint64_t v92 = (char *)&v79 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v82 = type metadata accessor for GeometryProxy();
  uint64_t v18 = *(void *)(v82 - 8);
  uint64_t v83 = *(void *)(v18 + 64);
  __chkstk_darwin(v82);
  uint64_t v81 = (char *)&v79 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)&long long v106 = type metadata accessor for ScrollViewProxy();
  uint64_t v20 = *(void *)(v106 - 8);
  uint64_t v21 = *(void *)(v20 + 64);
  __chkstk_darwin(v106);
  long long v22 = (char *)&v79 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v86 = sub_100006380(&qword_10006BC78);
  uint64_t v85 = *(void *)(v86 - 8);
  __chkstk_darwin(v86);
  uint64_t v80 = (char *)&v79 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v88 = sub_100006380(&qword_10006BC80) - 8;
  __chkstk_darwin(v88);
  uint64_t v84 = (uint64_t)&v79 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v90 = sub_100006380(&qword_10006BC88) - 8;
  __chkstk_darwin(v90);
  uint64_t v87 = (uint64_t)&v79 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v91 = sub_100006380(&qword_10006BC90);
  __chkstk_darwin(v91);
  uint64_t v89 = (uint64_t)&v79 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Axis.Set.vertical.getter();
  uint64_t v107 = a2;
  uint64_t v108 = a3;
  uint64_t v109 = a1;
  sub_100006380(&qword_10006BC98);
  sub_10002C5E8();
  ScrollView.init(_:showsIndicators:content:)();
  (*(void (**)(char *, uint64_t, void))(v20 + 16))(v22, a1, v106);
  long long v27 = v81;
  uint64_t v28 = v82;
  (*(void (**)(char *, uint64_t, uint64_t))(v18 + 16))(v81, a3, v82);
  unint64_t v29 = (*(unsigned __int8 *)(v20 + 80) + 240) & ~(unint64_t)*(unsigned __int8 *)(v20 + 80);
  unint64_t v30 = (v21 + *(unsigned __int8 *)(v18 + 80) + v29) & ~(unint64_t)*(unsigned __int8 *)(v18 + 80);
  uint64_t v31 = (char *)swift_allocObject();
  long long v32 = a2[11];
  *((_OWORD *)v31 + 11) = a2[10];
  *((_OWORD *)v31 + 12) = v32;
  long long v33 = a2[13];
  *((_OWORD *)v31 + 13) = a2[12];
  *((_OWORD *)v31 + 14) = v33;
  long long v34 = a2[7];
  *((_OWORD *)v31 + 7) = a2[6];
  *((_OWORD *)v31 + 8) = v34;
  long long v35 = a2[9];
  *((_OWORD *)v31 + 9) = a2[8];
  *((_OWORD *)v31 + 10) = v35;
  long long v36 = a2[3];
  *((_OWORD *)v31 + 3) = a2[2];
  *((_OWORD *)v31 + 4) = v36;
  long long v37 = a2[5];
  *((_OWORD *)v31 + 5) = a2[4];
  *((_OWORD *)v31 + 6) = v37;
  long long v38 = a2[1];
  *((_OWORD *)v31 + 1) = *a2;
  *((_OWORD *)v31 + 2) = v38;
  (*(void (**)(char *, char *, void))(v20 + 32))(&v31[v29], v22, v106);
  (*(void (**)(char *, char *, uint64_t))(v18 + 32))(&v31[v30], v27, v28);
  sub_1000276F4((uint64_t)a2);
  uint64_t v39 = static Alignment.center.getter();
  long long v41 = v40;
  uint64_t v42 = v85;
  uint64_t v43 = (uint64_t)v92;
  CGSize v44 = v80;
  uint64_t v45 = v86;
  (*(void (**)(char *, char *, uint64_t))(v85 + 16))(v92, v80, v86);
  double v46 = (uint64_t (**)@<X0>(uint64_t *@<X8>))(v43 + *(int *)(v93 + 44));
  *double v46 = sub_10004B1D4;
  v46[1] = 0;
  v46[2] = (uint64_t (*)@<X0>(uint64_t *@<X8>))v39;
  v46[3] = v41;
  uint64_t v47 = swift_allocObject();
  *(void *)(v47 + 16) = sub_10002C6D8;
  *(void *)(v47 + 24) = v31;
  uint64_t v48 = v84;
  sub_100006754(v43, v84, &qword_10006BC70);
  uint64_t v49 = (uint64_t (**)(double *))(v48 + *(int *)(v88 + 44));
  *uint64_t v49 = sub_10002C824;
  v49[1] = (uint64_t (*)(double *))v47;
  sub_1000067B8(v43, &qword_10006BC70);
  (*(void (**)(char *, uint64_t))(v42 + 8))(v44, v45);
  uint64_t v50 = v87;
  sub_100006754(v48, v87, &qword_10006BC80);
  uint64_t v51 = (void *)(v50 + *(int *)(v90 + 44));
  *uint64_t v51 = 0x6C6C6F726373;
  v51[1] = 0xE600000000000000;
  sub_1000067B8(v48, &qword_10006BC80);
  sub_10002B86C((uint64_t)a2, (uint64_t)v110);
  long long v106 = v110[0];
  long long v93 = v110[1];
  uint64_t v52 = v111;
  LOBYTE(v47) = v112;
  LOBYTE(v31) = v113;
  uint64_t v53 = v89;
  sub_100006754(v50, v89, &qword_10006BC88);
  uint64_t v54 = v53 + *(int *)(v91 + 36);
  long long v55 = v93;
  *(_OWORD *)uint64_t v54 = v106;
  *(_OWORD *)(v54 + 16) = v55;
  *(void *)(v54 + 32) = v52;
  *(unsigned char *)(v54 + 40) = v47;
  *(unsigned char *)(v54 + 41) = (_BYTE)v31;
  sub_1000067B8(v50, &qword_10006BC88);
  static CoordinateSpaceProtocol<>.local.getter();
  uint64_t v56 = v94;
  DragGesture.init<A>(minimumDistance:coordinateSpace:)();
  __int16 v57 = (_OWORD *)swift_allocObject();
  long long v58 = a2[11];
  v57[11] = a2[10];
  v57[12] = v58;
  long long v59 = a2[13];
  v57[13] = a2[12];
  v57[14] = v59;
  long long v60 = a2[7];
  v57[7] = a2[6];
  v57[8] = v60;
  long long v61 = a2[9];
  v57[9] = a2[8];
  v57[10] = v61;
  long long v62 = a2[3];
  v57[3] = a2[2];
  v57[4] = v62;
  long long v63 = a2[5];
  v57[5] = a2[4];
  v57[6] = v63;
  long long v64 = a2[1];
  v57[1] = *a2;
  void v57[2] = v64;
  sub_1000276F4((uint64_t)a2);
  sub_10002D8BC(&qword_10006AEE8, (void (*)(uint64_t))&type metadata accessor for DragGesture);
  sub_10002D8BC(&qword_10006AEF0, (void (*)(uint64_t))&type metadata accessor for DragGesture.Value);
  double v65 = v97;
  uint64_t v66 = v98;
  Gesture<>.onChanged(_:)();
  swift_release();
  (*(void (**)(char *, uint64_t))(v99 + 8))(v56, v66);
  uint64_t v67 = (_OWORD *)swift_allocObject();
  long long v68 = a2[11];
  v67[11] = a2[10];
  v67[12] = v68;
  long long v69 = a2[13];
  v67[13] = a2[12];
  v67[14] = v69;
  long long v70 = a2[7];
  v67[7] = a2[6];
  v67[8] = v70;
  long long v71 = a2[9];
  v67[9] = a2[8];
  v67[10] = v71;
  long long v72 = a2[3];
  v67[3] = a2[2];
  v67[4] = v72;
  long long v73 = a2[5];
  v67[5] = a2[4];
  v67[6] = v73;
  long long v74 = a2[1];
  v67[1] = *a2;
  v67[2] = v74;
  sub_1000276F4((uint64_t)a2);
  sub_1000068B8(&qword_10006AEF8, &qword_10006AEB8);
  char v76 = v100;
  uint64_t v75 = v101;
  Gesture.onEnded(_:)();
  swift_release();
  (*(void (**)(char *, uint64_t))(v102 + 8))(v65, v75);
  static GestureMask.all.getter();
  sub_10002C8A4();
  sub_1000068B8(&qword_10006AF28, &qword_10006AEC0);
  uint64_t v77 = v103;
  View.simultaneousGesture<A>(_:including:)();
  (*(void (**)(char *, uint64_t))(v104 + 8))(v76, v77);
  return sub_1000067B8(v53, &qword_10006BC90);
}

uint64_t sub_10002831C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v61 = a3;
  uint64_t v62 = a4;
  uint64_t v52 = a2;
  uint64_t v60 = type metadata accessor for ScrollViewProxy();
  uint64_t v58 = *(void *)(v60 - 8);
  uint64_t v59 = *(void *)(v58 + 64);
  __chkstk_darwin(v60);
  __int16 v57 = (char *)&v47 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for GeometryProxy();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(void *)(v8 + 64);
  __chkstk_darwin(v7);
  uint64_t v10 = sub_100006380(&qword_10006BCB0);
  __chkstk_darwin(v10 - 8);
  uint64_t v12 = (char *)&v47 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)uint64_t v12 = static HorizontalAlignment.center.getter();
  *((void *)v12 + 1) = 0;
  v12[16] = 0;
  uint64_t v50 = &v12[*(int *)(sub_100006380(&qword_10006BD80) + 44)];
  uint64_t v63 = *(void *)a1;
  uint64_t v64 = v63;
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v48 = v7;
  uint64_t v49 = KeyPath;
  uint64_t v51 = *(void (**)(char *, uint64_t, uint64_t))(v8 + 16);
  v51((char *)&v47 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), a2, v7);
  uint64_t v14 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v15 = (v14 + 240) & ~v14;
  uint64_t v56 = v15;
  uint64_t v53 = v15 + v9;
  uint64_t v54 = v14 | 7;
  uint64_t v16 = (char *)swift_allocObject();
  long long v17 = *(_OWORD *)(a1 + 176);
  *((_OWORD *)v16 + 11) = *(_OWORD *)(a1 + 160);
  *((_OWORD *)v16 + 12) = v17;
  long long v18 = *(_OWORD *)(a1 + 208);
  *((_OWORD *)v16 + 13) = *(_OWORD *)(a1 + 192);
  *((_OWORD *)v16 + 14) = v18;
  long long v19 = *(_OWORD *)(a1 + 112);
  *((_OWORD *)v16 + 7) = *(_OWORD *)(a1 + 96);
  *((_OWORD *)v16 + 8) = v19;
  long long v20 = *(_OWORD *)(a1 + 144);
  *((_OWORD *)v16 + 9) = *(_OWORD *)(a1 + 128);
  *((_OWORD *)v16 + 10) = v20;
  long long v21 = *(_OWORD *)(a1 + 48);
  *((_OWORD *)v16 + 3) = *(_OWORD *)(a1 + 32);
  *((_OWORD *)v16 + 4) = v21;
  long long v22 = *(_OWORD *)(a1 + 80);
  *((_OWORD *)v16 + 5) = *(_OWORD *)(a1 + 64);
  *((_OWORD *)v16 + 6) = v22;
  long long v23 = *(_OWORD *)(a1 + 16);
  *((_OWORD *)v16 + 1) = *(_OWORD *)a1;
  *((_OWORD *)v16 + 2) = v23;
  long long v55 = *(void (**)(char *, char *, uint64_t))(v8 + 32);
  uint64_t v24 = (char *)&v47 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v55(&v16[v15], v24, v7);
  sub_10002D000((uint64_t)&v64);
  sub_1000276F4(a1);
  sub_100006380(&qword_10006BF40);
  sub_100006380(&qword_10006BD88);
  sub_1000068B8(&qword_10006BD90, &qword_10006BF40);
  sub_10002D05C(&qword_10006BD98, &qword_10006BD88, (void (*)(void))sub_10002D02C);
  ForEach<>.init(_:id:content:)();
  uint64_t v25 = static Alignment.center.getter();
  uint64_t v49 = v26;
  uint64_t v50 = (char *)v25;
  long long v27 = v24;
  uint64_t v28 = v48;
  v51(v24, v52, v48);
  unint64_t v30 = v57;
  uint64_t v29 = v58;
  uint64_t v31 = v60;
  (*(void (**)(char *, uint64_t, uint64_t))(v58 + 16))(v57, v61, v60);
  uint64_t v32 = v29;
  unint64_t v33 = (v53 + *(unsigned __int8 *)(v29 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v29 + 80);
  long long v34 = (char *)swift_allocObject();
  long long v35 = *(_OWORD *)(a1 + 176);
  *((_OWORD *)v34 + 11) = *(_OWORD *)(a1 + 160);
  *((_OWORD *)v34 + 12) = v35;
  long long v36 = *(_OWORD *)(a1 + 208);
  *((_OWORD *)v34 + 13) = *(_OWORD *)(a1 + 192);
  *((_OWORD *)v34 + 14) = v36;
  long long v37 = *(_OWORD *)(a1 + 112);
  *((_OWORD *)v34 + 7) = *(_OWORD *)(a1 + 96);
  *((_OWORD *)v34 + 8) = v37;
  long long v38 = *(_OWORD *)(a1 + 144);
  *((_OWORD *)v34 + 9) = *(_OWORD *)(a1 + 128);
  *((_OWORD *)v34 + 10) = v38;
  long long v39 = *(_OWORD *)(a1 + 48);
  *((_OWORD *)v34 + 3) = *(_OWORD *)(a1 + 32);
  *((_OWORD *)v34 + 4) = v39;
  long long v40 = *(_OWORD *)(a1 + 80);
  *((_OWORD *)v34 + 5) = *(_OWORD *)(a1 + 64);
  *((_OWORD *)v34 + 6) = v40;
  long long v41 = *(_OWORD *)(a1 + 16);
  uint64_t v42 = &v34[v56];
  *((_OWORD *)v34 + 1) = *(_OWORD *)a1;
  *((_OWORD *)v34 + 2) = v41;
  v55(v42, v27, v28);
  (*(void (**)(char *, char *, uint64_t))(v32 + 32))(&v34[v33], v30, v31);
  uint64_t v43 = v62;
  sub_100006754((uint64_t)v12, v62, &qword_10006BCB0);
  CGSize v44 = (uint64_t (**)@<X0>(uint64_t@<X0>, uint64_t@<X8>))(v43 + *(int *)(sub_100006380(&qword_10006BC98) + 36));
  char *v44 = sub_10002D1A4;
  v44[1] = (uint64_t (*)@<X0>(uint64_t@<X0>, uint64_t@<X8>))v34;
  uint64_t v45 = (uint64_t (*)@<X0>(uint64_t@<X0>, uint64_t@<X8>))v49;
  v44[2] = (uint64_t (*)@<X0>(uint64_t@<X0>, uint64_t@<X8>))v50;
  v44[3] = v45;
  sub_1000276F4(a1);
  return sub_1000067B8((uint64_t)v12, &qword_10006BCB0);
}

uint64_t sub_1000287C0@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v61 = a3;
  uint64_t v69 = a4;
  uint64_t v6 = type metadata accessor for AXLTCaption();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v59 = (char *)&v59 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v65 = sub_100006380(&qword_10006BDE8);
  __chkstk_darwin(v65);
  uint64_t v68 = (uint64_t)&v59 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100006380(&qword_10006BDF0);
  __chkstk_darwin(v10 - 8);
  uint64_t v60 = (uint64_t)&v59 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  uint64_t v62 = (char *)&v59 - v13;
  __chkstk_darwin(v14);
  uint64_t v16 = (char *)&v59 - v15;
  uint64_t v17 = sub_100006380(&qword_10006BDC8);
  __chkstk_darwin(v17 - 8);
  long long v19 = (char *)&v59 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = sub_100006380(&qword_10006BDB8);
  uint64_t v21 = v20 - 8;
  __chkstk_darwin(v20);
  long long v23 = (char *)&v59 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = sub_100006380(&qword_10006BDA8);
  __chkstk_darwin(v24);
  uint64_t v26 = (char *)&v59 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v67 = sub_100006380(&qword_10006BD88);
  __chkstk_darwin(v67);
  uint64_t v66 = (uint64_t)&v59 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)long long v19 = static HorizontalAlignment.leading.getter();
  *((void *)v19 + 1) = 0;
  v19[16] = 1;
  uint64_t v28 = (uint64_t)&v19[*(int *)(sub_100006380(&qword_10006BDF8) + 44)];
  uint64_t v63 = a1;
  uint64_t v64 = a2;
  sub_100028F70(a1, a2, v28);
  GeometryProxy.size.getter();
  static Alignment.leading.getter();
  _FrameLayout.init(width:height:alignment:)();
  sub_100006754((uint64_t)v19, (uint64_t)v23, &qword_10006BDC8);
  uint64_t v29 = &v23[*(int *)(v21 + 44)];
  long long v30 = v71;
  *(_OWORD *)uint64_t v29 = v70;
  *((_OWORD *)v29 + 1) = v30;
  *((_OWORD *)v29 + 2) = v72;
  sub_1000067B8((uint64_t)v19, &qword_10006BDC8);
  char v31 = static Edge.Set.bottom.getter();
  if (qword_10006AE20 != -1) {
    swift_once();
  }
  uint64_t v32 = self;
  if (qword_10006AE18 != -1) {
    swift_once();
  }
  id v33 = [v32 preferredFontForTextStyle:textFontStyle];
  [v33 lineHeight];

  EdgeInsets.init(_all:)();
  uint64_t v35 = v34;
  uint64_t v37 = v36;
  uint64_t v39 = v38;
  uint64_t v41 = v40;
  sub_100006754((uint64_t)v23, (uint64_t)v26, &qword_10006BDB8);
  uint64_t v42 = &v26[*(int *)(v24 + 36)];
  char *v42 = v31;
  *((void *)v42 + 1) = v35;
  *((void *)v42 + 2) = v37;
  *((void *)v42 + 3) = v39;
  *((void *)v42 + 4) = v41;
  v42[40] = 0;
  sub_1000067B8((uint64_t)v23, &qword_10006BDB8);
  uint64_t v43 = *(void (**)(char *, uint64_t, uint64_t))(v7 + 16);
  v43(v16, v63, v6);
  CGSize v44 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v7 + 56);
  uint64_t v45 = 1;
  v44(v16, 0, 1, v6);
  uint64_t v46 = *(void *)(*v64 + 16);
  uint64_t v47 = (uint64_t)v62;
  if (v46)
  {
    v43(v62, *v64+ ((*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80))+ *(void *)(v7 + 72) * (v46 - 1), v6);
    uint64_t v45 = 0;
  }
  v44((char *)v47, v45, 1, v6);
  uint64_t v48 = v68;
  uint64_t v49 = v68 + *(int *)(v65 + 48);
  sub_100006754((uint64_t)v16, v68, &qword_10006BDF0);
  sub_100006754(v47, v49, &qword_10006BDF0);
  uint64_t v50 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
  if (v50(v48, 1, v6) != 1)
  {
    uint64_t v52 = v60;
    sub_100006754(v48, v60, &qword_10006BDF0);
    if (v50(v49, 1, v6) != 1)
    {
      uint64_t v53 = v52;
      uint64_t v54 = v59;
      (*(void (**)(char *, uint64_t, uint64_t))(v7 + 32))(v59, v49, v6);
      sub_10002D8BC(&qword_10006C130, (void (*)(uint64_t))&type metadata accessor for AXLTCaption);
      char v55 = dispatch thunk of static Equatable.== infix(_:_:)();
      uint64_t v56 = *(void (**)(char *, uint64_t))(v7 + 8);
      v56(v54, v6);
      sub_1000067B8(v47, &qword_10006BDF0);
      sub_1000067B8((uint64_t)v16, &qword_10006BDF0);
      v56((char *)v53, v6);
      sub_1000067B8(v48, &qword_10006BDF0);
      double v51 = 1.0;
      if (v55) {
        goto LABEL_15;
      }
LABEL_14:
      double v51 = 0.8;
      goto LABEL_15;
    }
    sub_1000067B8(v47, &qword_10006BDF0);
    sub_1000067B8((uint64_t)v16, &qword_10006BDF0);
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v52, v6);
LABEL_12:
    sub_1000067B8(v48, &qword_10006BDE8);
    goto LABEL_14;
  }
  sub_1000067B8(v47, &qword_10006BDF0);
  sub_1000067B8((uint64_t)v16, &qword_10006BDF0);
  if (v50(v49, 1, v6) != 1) {
    goto LABEL_12;
  }
  sub_1000067B8(v48, &qword_10006BDF0);
  double v51 = 1.0;
LABEL_15:
  uint64_t v57 = v66;
  sub_100006754((uint64_t)v26, v66, &qword_10006BDA8);
  *(double *)(v57 + *(int *)(v67 + 36)) = v51;
  sub_1000067B8((uint64_t)v26, &qword_10006BDA8);
  return sub_10000A940(v57, v69, &qword_10006BD88);
}

uint64_t sub_100028F70@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v93 = a3;
  uint64_t v84 = sub_100006380(&qword_10006BDE8);
  __chkstk_darwin(v84);
  *(void *)&long long v86 = (char *)&v78 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100006380(&qword_10006BDF0);
  __chkstk_darwin(v6 - 8);
  uint64_t v80 = (uint64_t)&v78 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  *(void *)&long long v94 = (char *)&v78 - v9;
  __chkstk_darwin(v10);
  uint64_t v82 = (char *)&v78 - v11;
  uint64_t v89 = type metadata accessor for AXLTTextView(0);
  __chkstk_darwin(v89);
  uint64_t v92 = (uint64_t)&v78 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  uint64_t v85 = (uint64_t *)((char *)&v78 - v14);
  __chkstk_darwin(v15);
  uint64_t v91 = (uint64_t)&v78 - v16;
  uint64_t v17 = type metadata accessor for AXLTCaption();
  uint64_t v18 = *(void *)(v17 - 8);
  __chkstk_darwin(v17);
  uint64_t v20 = (char *)&v78 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v21);
  long long v23 = (char *)&v78 - v22;
  uint64_t v24 = type metadata accessor for AXLTTitleView();
  __chkstk_darwin(v24 - 8);
  uint64_t v90 = (uint64_t)&v78 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  double v27 = __chkstk_darwin(v26);
  uint64_t v29 = (char *)&v78 - v28;
  long long v30 = *(void (**)(char *, uint64_t, uint64_t, double))(v18 + 16);
  uint64_t v83 = a1;
  v30(v23, a1, v17, v27);
  uint64_t v95 = a2;
  int v81 = *((unsigned __int8 *)a2 + 16);
  if (qword_10006AE20 != -1) {
    swift_once();
  }
  swift_beginAccess();
  swift_beginAccess();
  id v31 = objc_allocWithZone((Class)UIImage);
  swift_retain();
  swift_retain();
  [v31 init];
  uint64_t v88 = v29;
  uint64_t v79 = v23;
  sub_10000DCC0((uint64_t)v23, v81, 0, (uint64_t)v29);
  uint64_t v32 = v83;
  ((void (*)(char *, uint64_t, uint64_t))v30)(v20, v83, v17);
  uint64_t v33 = (uint64_t)v82;
  ((void (*)(char *, uint64_t, uint64_t))v30)(v82, v32, v17);
  uint64_t v34 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v18 + 56);
  uint64_t v35 = 1;
  uint64_t v36 = v33;
  v34(v33, 0, 1, v17);
  uint64_t v37 = *v95;
  uint64_t v38 = *(void *)(*v95 + 16);
  uint64_t v87 = v20;
  uint64_t v39 = v94;
  if (v38)
  {
    ((void (*)(void, unint64_t, uint64_t))v30)(v94, v37+ ((*(unsigned __int8 *)(v18 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v18 + 80))+ *(void *)(v18 + 72) * (v38 - 1), v17);
    uint64_t v35 = 0;
  }
  v34(v39, v35, 1, v17);
  uint64_t v40 = v86;
  uint64_t v41 = v86 + *(int *)(v84 + 48);
  sub_100006754(v33, v86, &qword_10006BDF0);
  sub_100006754(v39, v41, &qword_10006BDF0);
  uint64_t v42 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v18 + 48);
  if (v42(v40, 1, v17) == 1)
  {
    sub_1000067B8(v39, &qword_10006BDF0);
    sub_1000067B8(v33, &qword_10006BDF0);
    int v43 = v42(v41, 1, v17);
    if (v43 == 1) {
      CGSize v44 = &qword_10006BDF0;
    }
    else {
      CGSize v44 = &qword_10006BDE8;
    }
    if (v43 == 1) {
      int v45 = -1;
    }
    else {
      int v45 = 0;
    }
    LODWORD(v84) = v45;
    uint64_t v46 = v95;
  }
  else
  {
    uint64_t v47 = v80;
    sub_100006754(v40, v80, &qword_10006BDF0);
    if (v42(v41, 1, v17) == 1)
    {
      sub_1000067B8(v94, &qword_10006BDF0);
      sub_1000067B8(v33, &qword_10006BDF0);
      (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v47, v17);
      LODWORD(v84) = 0;
      CGSize v44 = &qword_10006BDE8;
    }
    else
    {
      uint64_t v48 = v79;
      (*(void (**)(char *, uint64_t, uint64_t))(v18 + 32))(v79, v41, v17);
      sub_10002D8BC(&qword_10006C130, (void (*)(uint64_t))&type metadata accessor for AXLTCaption);
      LODWORD(v84) = dispatch thunk of static Equatable.== infix(_:_:)();
      uint64_t v49 = *(void (**)(char *, uint64_t))(v18 + 8);
      v49(v48, v17);
      CGSize v44 = &qword_10006BDF0;
      sub_1000067B8(v94, &qword_10006BDF0);
      sub_1000067B8(v36, &qword_10006BDF0);
      v49((char *)v47, v17);
    }
    uint64_t v46 = v95;
  }
  sub_1000067B8(v40, v44);
  long long v99 = *(_OWORD *)(v46 + 3);
  *(void *)&long long v100 = v46[5];
  sub_100006380(&qword_10006BAF0);
  Binding.projectedValue.getter();
  uint64_t v50 = *((void *)&v101 + 1);
  uint64_t v95 = (uint64_t *)v101;
  uint64_t v51 = v102;
  long long v99 = *((_OWORD *)v46 + 3);
  *(void *)&long long v100 = v46[8];
  sub_100006380(&qword_10006BE00);
  Binding.projectedValue.getter();
  long long v94 = v101;
  uint64_t v52 = v102;
  long long v53 = *(_OWORD *)(v46 + 11);
  long long v99 = *(_OWORD *)(v46 + 9);
  long long v100 = v53;
  sub_100006380(&qword_10006BE08);
  Binding.projectedValue.getter();
  long long v86 = v101;
  uint64_t v54 = v102;
  uint64_t v55 = v103;
  uint64_t v56 = static AXLTSettingsManager.shared;
  uint64_t v57 = (uint64_t *)(static AXLTSettingsManager.shared + OBJC_IVAR___AXLTSettingsManager_textColor);
  swift_beginAccess();
  uint64_t v58 = *v57;
  uint64_t v59 = (uint64_t *)(v56 + OBJC_IVAR___AXLTSettingsManager_textFont);
  swift_beginAccess();
  uint64_t v60 = *v59;
  uint64_t v61 = (uint64_t)v85;
  *uint64_t v85 = 0x4010000000000000;
  uint64_t v62 = (int *)v89;
  (*(void (**)(uint64_t, char *, uint64_t))(v18 + 32))(v61 + *(int *)(v89 + 20), v87, v17);
  *(unsigned char *)(v61 + v62[6]) = 1;
  *(unsigned char *)(v61 + v62[7]) = v84 & 1;
  uint64_t v63 = (void *)(v61 + v62[8]);
  *uint64_t v63 = v95;
  v63[1] = v50;
  v63[2] = v51;
  uint64_t v64 = v61 + v62[9];
  *(_OWORD *)uint64_t v64 = v94;
  *(void *)(v64 + 16) = v52;
  uint64_t v65 = v61 + v62[10];
  *(_OWORD *)uint64_t v65 = v86;
  *(void *)(v65 + 16) = v54;
  *(void *)(v65 + 24) = v55;
  uint64_t v66 = (void *)(v61 + v62[11]);
  uint64_t v96 = v58;
  swift_retain();
  swift_retain();
  State.init(wrappedValue:)();
  uint64_t v67 = v98;
  *uint64_t v66 = v97;
  v66[1] = v67;
  uint64_t v68 = (void *)(v61 + v62[12]);
  uint64_t v96 = v60;
  State.init(wrappedValue:)();
  uint64_t v69 = v98;
  void *v68 = v97;
  v68[1] = v69;
  uint64_t v70 = v91;
  sub_10002D790(v61, v91);
  uint64_t v71 = (uint64_t)v88;
  uint64_t v72 = v90;
  sub_10002D7F4((uint64_t)v88, v90, (uint64_t (*)(void))type metadata accessor for AXLTTitleView);
  uint64_t v73 = v92;
  sub_10002D7F4(v70, v92, type metadata accessor for AXLTTextView);
  uint64_t v74 = v93;
  sub_10002D7F4(v72, v93, (uint64_t (*)(void))type metadata accessor for AXLTTitleView);
  uint64_t v75 = sub_100006380(&qword_10006BE10);
  uint64_t v76 = v74 + *(int *)(v75 + 48);
  *(void *)uint64_t v76 = 0;
  *(unsigned char *)(v76 + 8) = 1;
  sub_10002D7F4(v73, v74 + *(int *)(v75 + 64), type metadata accessor for AXLTTextView);
  sub_10002D85C(v70, type metadata accessor for AXLTTextView);
  sub_10002D85C(v71, (uint64_t (*)(void))type metadata accessor for AXLTTitleView);
  sub_10002D85C(v73, type metadata accessor for AXLTTextView);
  return sub_10002D85C(v72, (uint64_t (*)(void))type metadata accessor for AXLTTitleView);
}

uint64_t sub_1000299C4@<X0>(uint64_t a1@<X0>, _OWORD *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v68 = a4;
  uint64_t v61 = a3;
  uint64_t v58 = a1;
  uint64_t v73 = a5;
  uint64_t v66 = type metadata accessor for ScrollViewProxy();
  uint64_t v64 = *(void *)(v66 - 8);
  uint64_t v67 = *(void *)(v64 + 64);
  __chkstk_darwin(v66);
  uint64_t v63 = (char *)&v53 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v57 = type metadata accessor for GeometryProxy();
  uint64_t v8 = *(void *)(v57 - 8);
  uint64_t v75 = *(void *)(v8 + 64);
  __chkstk_darwin(v57);
  uint64_t v10 = (char *)&v53 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for NamedCoordinateSpace();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)&v53 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v70 = sub_100006380(&qword_10006BDD0);
  uint64_t v72 = *(void *)(v70 - 8);
  __chkstk_darwin(v70);
  uint64_t v76 = (char *)&v53 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v71 = sub_100006380(&qword_10006BDD8);
  uint64_t v69 = *(void *)(v71 - 8);
  __chkstk_darwin(v71);
  uint64_t v65 = (char *)&v53 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v81 = static Color.clear.getter();
  uint64_t v77 = 0x6C6C6F726373;
  uint64_t v78 = (void *)0xE600000000000000;
  static CoordinateSpaceProtocol<>.named<A>(_:)();
  GeometryProxy.frame<A>(in:)();
  uint64_t v18 = v17;
  uint64_t v19 = *(void (**)(char *, uint64_t))(v12 + 8);
  uint64_t v55 = v12 + 8;
  uint64_t v56 = v19;
  v19(v14, v11);
  uint64_t v77 = v18;
  uint64_t v60 = *(void (**)(char *, uint64_t, uint64_t))(v8 + 16);
  uint64_t v74 = v10;
  uint64_t v20 = v57;
  v60(v10, a3, v57);
  uint64_t v21 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v59 = v21 | 7;
  uint64_t v22 = (char *)swift_allocObject();
  long long v23 = a2[11];
  *((_OWORD *)v22 + 11) = a2[10];
  *((_OWORD *)v22 + 12) = v23;
  long long v24 = a2[13];
  *((_OWORD *)v22 + 13) = a2[12];
  *((_OWORD *)v22 + 14) = v24;
  long long v25 = a2[7];
  *((_OWORD *)v22 + 7) = a2[6];
  *((_OWORD *)v22 + 8) = v25;
  long long v26 = a2[9];
  *((_OWORD *)v22 + 9) = a2[8];
  *((_OWORD *)v22 + 10) = v26;
  long long v27 = a2[3];
  *((_OWORD *)v22 + 3) = a2[2];
  *((_OWORD *)v22 + 4) = v27;
  long long v28 = a2[5];
  *((_OWORD *)v22 + 5) = a2[4];
  *((_OWORD *)v22 + 6) = v28;
  long long v29 = a2[1];
  *((_OWORD *)v22 + 1) = *a2;
  *((_OWORD *)v22 + 2) = v29;
  uint64_t v62 = *(void (**)(char *, char *, uint64_t))(v8 + 32);
  v62(&v22[(v21 + 240) & ~v21], v10, v20);
  sub_1000276F4((uint64_t)a2);
  unint64_t v54 = sub_10002D450();
  View.onChange<A>(of:initial:_:)();
  swift_release();
  swift_release();
  uint64_t v77 = 0x6C6C6F726373;
  uint64_t v78 = (void *)0xE600000000000000;
  static CoordinateSpaceProtocol<>.named<A>(_:)();
  GeometryProxy.frame<A>(in:)();
  uint64_t v31 = v30;
  v56(v14, v11);
  uint64_t v81 = v31;
  uint64_t v33 = v63;
  uint64_t v32 = v64;
  uint64_t v34 = v66;
  (*(void (**)(char *, uint64_t, uint64_t))(v64 + 16))(v63, v68, v66);
  uint64_t v35 = v20;
  v60(v74, v61, v20);
  uint64_t v36 = v32;
  unint64_t v37 = (*(unsigned __int8 *)(v32 + 80) + 240) & ~(unint64_t)*(unsigned __int8 *)(v32 + 80);
  unint64_t v38 = (v67 + v21 + v37) & ~v21;
  uint64_t v39 = (char *)swift_allocObject();
  long long v40 = a2[11];
  *((_OWORD *)v39 + 11) = a2[10];
  *((_OWORD *)v39 + 12) = v40;
  long long v41 = a2[13];
  *((_OWORD *)v39 + 13) = a2[12];
  *((_OWORD *)v39 + 14) = v41;
  long long v42 = a2[7];
  *((_OWORD *)v39 + 7) = a2[6];
  *((_OWORD *)v39 + 8) = v42;
  long long v43 = a2[9];
  *((_OWORD *)v39 + 9) = a2[8];
  *((_OWORD *)v39 + 10) = v43;
  long long v44 = a2[3];
  *((_OWORD *)v39 + 3) = a2[2];
  *((_OWORD *)v39 + 4) = v44;
  long long v45 = a2[5];
  *((_OWORD *)v39 + 5) = a2[4];
  *((_OWORD *)v39 + 6) = v45;
  long long v46 = a2[1];
  *((_OWORD *)v39 + 1) = *a2;
  *((_OWORD *)v39 + 2) = v46;
  (*(void (**)(char *, char *, uint64_t))(v36 + 32))(&v39[v37], v33, v34);
  v62(&v39[v38], v74, v35);
  sub_1000276F4((uint64_t)a2);
  uint64_t v77 = (uint64_t)&type metadata for Color;
  uint64_t v78 = &type metadata for CGFloat;
  uint64_t v79 = &protocol witness table for Color;
  unint64_t v80 = v54;
  swift_getOpaqueTypeConformance2();
  uint64_t v47 = v65;
  uint64_t v48 = v70;
  uint64_t v49 = v76;
  View.onChange<A>(of:initial:_:)();
  swift_release();
  (*(void (**)(char *, uint64_t))(v72 + 8))(v49, v48);
  uint64_t v50 = v69;
  uint64_t v51 = v71;
  (*(void (**)(uint64_t, char *, uint64_t))(v69 + 16))(v73, v47, v71);
  return (*(uint64_t (**)(char *, uint64_t))(v50 + 8))(v47, v51);
}

uint64_t sub_10002A0D4(uint64_t a1, double *a2, uint64_t a3)
{
  double v4 = *a2;
  double v5 = -*a2;
  sub_100006380(&qword_10006B1D0);
  State.wrappedValue.getter();
  GeometryProxy.size.getter();
  if (v8 - v6 - *(double *)(a3 + 168) <= v5) {
    sub_10002A1C8();
  }
  sub_100006380(&qword_10006B638);
  uint64_t result = State.wrappedValue.getter();
  if (v4 < 0.0 != LOBYTE(v8)) {
    return State.wrappedValue.setter();
  }
  return result;
}

id sub_10002A1C8()
{
  long long v3 = *(_OWORD *)(v0 + 176);
  sub_100006380(&qword_10006B630);
  State.wrappedValue.getter();
  if (!v4) {
    goto LABEL_4;
  }
  objc_msgSend(v4, "invalidate", v3);
  static os_log_type_t.debug.getter();
  id result = (id)AXLogLiveTranscription();
  if (result)
  {
    id v2 = result;
    os_log(_:dso:log:_:_:)();

LABEL_4:
    State.wrappedValue.setter();
    sub_100006380(&qword_10006B638);
    return (id)State.wrappedValue.setter();
  }
  __break(1u);
  return result;
}

void sub_10002A2DC()
{
  sub_100006380(&qword_10006B1D0);
  State.wrappedValue.setter();
  GeometryProxy.size.getter();
  sub_10002A358(v0);
}

void sub_10002A358(double a1)
{
  uint64_t v2 = v1;
  sub_100006380(&qword_10006B638);
  State.wrappedValue.getter();
  if (v8 == 1)
  {
    sub_100006380(&qword_10006B1D0);
    State.wrappedValue.getter();
    if (v9 > a1)
    {
      State.wrappedValue.getter();
      ScrollViewProxy.setContentOffset(_:)();
      os_log_type_t v4 = static os_log_type_t.debug.getter();
      double v5 = (id)AXLogLiveTranscription();
      if (v5)
      {
        double v6 = v5;
        if (os_log_type_enabled(v5, v4))
        {
          sub_1000276F4(v2);
          uint64_t v7 = (uint8_t *)swift_slowAlloc();
          *(_DWORD *)uint64_t v7 = 134217984;
          State.wrappedValue.getter();
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          sub_10002CE24(v2);
          _os_log_impl((void *)&_mh_execute_header, v6, v4, "Scrolled to bottom: %f", v7, 0xCu);
          swift_slowDealloc();
        }
      }
      else
      {
        __break(1u);
      }
    }
  }
}

void sub_10002A510()
{
  os_log_type_t v0 = static os_log_type_t.debug.getter();
  uint64_t v1 = (id)AXLogLiveTranscription();
  if (v1)
  {
    uint64_t v2 = v1;
    if (os_log_type_enabled(v1, v0))
    {
      long long v3 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)long long v3 = 134217984;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl((void *)&_mh_execute_header, v2, v0, "ScrollView new height: %f", v3, 0xCu);
      swift_slowDealloc();
    }

    GeometryProxy.size.getter();
    sub_10002A358(v4);
  }
  else
  {
    __break(1u);
  }
}

id sub_10002A61C()
{
  uint64_t v1 = v0;
  long long v15 = v0[12];
  LOBYTE(v21) = 0;
  sub_100006380(&qword_10006B638);
  State.wrappedValue.setter();
  static os_log_type_t.debug.getter();
  id result = (id)AXLogLiveTranscription();
  if (result)
  {
    long long v3 = result;
    os_log(_:dso:log:_:_:)();

    long long v21 = v1[11];
    long long v15 = v1[11];
    sub_100006380(&qword_10006B630);
    State.wrappedValue.getter();
    objc_msgSend(v20, "invalidate", v15);

    double v4 = self;
    double v5 = (_OWORD *)swift_allocObject();
    long long v6 = v1[11];
    v5[11] = v1[10];
    v5[12] = v6;
    long long v7 = v1[13];
    v5[13] = v1[12];
    v5[14] = v7;
    long long v8 = v1[7];
    v5[7] = v1[6];
    v5[8] = v8;
    long long v9 = v1[9];
    v5[9] = v1[8];
    v5[10] = v9;
    long long v10 = v1[3];
    v5[3] = v1[2];
    v5[4] = v10;
    long long v11 = v1[5];
    v5[5] = v1[4];
    v5[6] = v11;
    long long v12 = v1[1];
    v5[1] = *v1;
    v5[2] = v12;
    uint64_t v18 = sub_10002CB4C;
    uint64_t v19 = v5;
    *(void *)&long long v15 = _NSConcreteStackBlock;
    *((void *)&v15 + 1) = 1107296256;
    uint64_t v16 = sub_1000315A8;
    uint64_t v17 = &unk_100066D38;
    uint64_t v13 = _Block_copy(&v15);
    sub_1000276F4((uint64_t)v1);
    swift_release();
    id v14 = [v4 scheduledTimerWithTimeInterval:0 repeats:v13 block:60.0];
    _Block_release(v13);
    long long v15 = v21;
    id v20 = v14;
    return (id)State.wrappedValue.setter();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_10002A834@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v115 = a2;
  uint64_t v3 = sub_100006380(&qword_10006BE18);
  __chkstk_darwin(v3 - 8);
  double v5 = (char *)&v92 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v107 = sub_100006380(&qword_10006BDE8);
  __chkstk_darwin(v107);
  *(void *)&long long v108 = (char *)&v92 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v110 = type metadata accessor for AXLTTextView(0);
  __chkstk_darwin(v110);
  long long v8 = (char *)&v92 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v109 = (char **)((char *)&v92 - v10);
  __chkstk_darwin(v11);
  uint64_t v111 = (uint64_t)&v92 - v12;
  uint64_t v13 = type metadata accessor for AXLTTitleView();
  __chkstk_darwin(v13 - 8);
  long long v15 = (char *)&v92 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v16);
  uint64_t v114 = (uint64_t)&v92 - v17;
  uint64_t v18 = sub_100006380(&qword_10006BDF0);
  __chkstk_darwin(v18 - 8);
  uint64_t v104 = (uint64_t)&v92 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v20);
  long long v106 = (char *)&v92 - v21;
  __chkstk_darwin(v22);
  *(void *)&long long v112 = (char *)&v92 - v23;
  __chkstk_darwin(v24);
  long long v26 = (char *)&v92 - v25;
  uint64_t v27 = type metadata accessor for AXLTCaption();
  long long v28 = *(void **)(v27 - 8);
  __chkstk_darwin(v27);
  char v113 = (char *)&v92 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v30);
  uint64_t v32 = (char *)&v92 - v31;
  __chkstk_darwin(v33);
  uint64_t v35 = (char *)&v92 - v34;
  sub_10002B47C((uint64_t)v26);
  uint64_t v105 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v28[6];
  if (v105((uint64_t)v26, 1, v27) == 1)
  {
    sub_1000067B8((uint64_t)v26, &qword_10006BDF0);
    uint64_t v36 = sub_100006380(&qword_10006BE20);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v36 - 8) + 56))(v115, 1, 1, v36);
  }
  else
  {
    uint64_t v96 = v28 + 6;
    uint64_t v98 = v15;
    long long v99 = v8;
    long long v100 = v5;
    unint64_t v38 = (void (*)(char *, uint64_t, uint64_t))v28[4];
    uint64_t v102 = v28 + 4;
    long long v101 = v38;
    v38(v35, (uint64_t)v26, v27);
    uint64_t v39 = (void (*)(char *, char *, uint64_t))v28[2];
    v39(v32, v35, v27);
    int v93 = *((unsigned __int8 *)a1 + 16);
    uint64_t v40 = a1[1];
    long long v94 = a1;
    if (qword_10006AE20 != -1) {
      swift_once();
    }
    swift_beginAccess();
    swift_beginAccess();
    id v41 = objc_allocWithZone((Class)UIImage);
    swift_retain();
    swift_retain();
    [v41 init];
    uint64_t v92 = v32;
    sub_10000DCC0((uint64_t)v32, v93, v40, v114);
    v39(v113, v35, v27);
    uint64_t v42 = v112;
    v39((char *)v112, v35, v27);
    long long v43 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v28[7];
    uint64_t v44 = 1;
    v43(v42, 0, 1, v27);
    long long v45 = v94;
    uint64_t v46 = *v94;
    uint64_t v47 = *(void *)(*v94 + 16);
    uint64_t v48 = v28;
    uint64_t v49 = v35;
    uint64_t v103 = v48;
    uint64_t v50 = (uint64_t)v106;
    if (v47)
    {
      v39(v106, (char *)(v46+ ((*((unsigned __int8 *)v48 + 80) + 32) & ~(unint64_t)*((unsigned __int8 *)v48 + 80))+ v48[9] * (v47 - 1)), v27);
      uint64_t v44 = 0;
    }
    v43(v50, v44, 1, v27);
    uint64_t v51 = v108;
    uint64_t v52 = v108 + *(int *)(v107 + 48);
    uint64_t v53 = v112;
    sub_100006754(v112, v108, &qword_10006BDF0);
    sub_100006754(v50, v52, &qword_10006BDF0);
    unint64_t v54 = v105;
    int v55 = v105(v51, 1, v27);
    uint64_t v97 = v49;
    uint64_t v95 = v27;
    if (v55 == 1)
    {
      sub_1000067B8(v50, &qword_10006BDF0);
      sub_1000067B8(v53, &qword_10006BDF0);
      int v56 = v54(v52, 1, v27);
      if (v56 == 1) {
        uint64_t v57 = &qword_10006BDF0;
      }
      else {
        uint64_t v57 = &qword_10006BDE8;
      }
      if (v56 == 1) {
        int v58 = -1;
      }
      else {
        int v58 = 0;
      }
      LODWORD(v107) = v58;
    }
    else
    {
      uint64_t v59 = v104;
      sub_100006754(v51, v104, &qword_10006BDF0);
      if (v54(v52, 1, v27) == 1)
      {
        sub_1000067B8(v50, &qword_10006BDF0);
        sub_1000067B8(v53, &qword_10006BDF0);
        ((void (*)(uint64_t, uint64_t))v103[1])(v59, v27);
        LODWORD(v107) = 0;
        uint64_t v57 = &qword_10006BDE8;
      }
      else
      {
        uint64_t v60 = v27;
        uint64_t v61 = v92;
        v101(v92, v52, v60);
        sub_10002D8BC(&qword_10006C130, (void (*)(uint64_t))&type metadata accessor for AXLTCaption);
        LODWORD(v107) = dispatch thunk of static Equatable.== infix(_:_:)();
        uint64_t v62 = v50;
        uint64_t v63 = (void (*)(char *, uint64_t))v103[1];
        v63(v61, v60);
        uint64_t v57 = &qword_10006BDF0;
        sub_1000067B8(v62, &qword_10006BDF0);
        sub_1000067B8(v53, &qword_10006BDF0);
        v63((char *)v59, v60);
      }
    }
    sub_1000067B8(v51, v57);
    long long v119 = *(_OWORD *)(v45 + 3);
    *(void *)&long long v120 = v45[5];
    sub_100006380(&qword_10006BAF0);
    Binding.projectedValue.getter();
    long long v64 = v121;
    uint64_t v65 = v122;
    long long v119 = *((_OWORD *)v45 + 3);
    *(void *)&long long v120 = v45[8];
    sub_100006380(&qword_10006BE00);
    Binding.projectedValue.getter();
    long long v112 = v121;
    uint64_t v66 = v122;
    long long v67 = *(_OWORD *)(v45 + 11);
    long long v119 = *(_OWORD *)(v45 + 9);
    long long v120 = v67;
    sub_100006380(&qword_10006BE08);
    Binding.projectedValue.getter();
    long long v108 = v121;
    uint64_t v68 = v122;
    uint64_t v69 = v123;
    uint64_t v70 = static AXLTSettingsManager.shared;
    uint64_t v71 = (uint64_t *)(static AXLTSettingsManager.shared + OBJC_IVAR___AXLTSettingsManager_textColor);
    swift_beginAccess();
    uint64_t v72 = *v71;
    uint64_t v73 = (uint64_t *)(v70 + OBJC_IVAR___AXLTSettingsManager_textFont);
    swift_beginAccess();
    uint64_t v74 = *v73;
    uint64_t v75 = (uint64_t)v109;
    *uint64_t v109 = 0x4010000000000000;
    uint64_t v76 = (int *)v110;
    uint64_t v77 = v95;
    v101((char *)(v75 + *(int *)(v110 + 20)), (uint64_t)v113, v95);
    *(unsigned char *)(v75 + v76[6]) = 0;
    *(unsigned char *)(v75 + v76[7]) = v107 & 1;
    uint64_t v78 = v75 + v76[8];
    *(_OWORD *)uint64_t v78 = v64;
    *(void *)(v78 + 16) = v65;
    uint64_t v79 = v75 + v76[9];
    *(_OWORD *)uint64_t v79 = v112;
    *(void *)(v79 + 16) = v66;
    uint64_t v80 = v75 + v76[10];
    *(_OWORD *)uint64_t v80 = v108;
    *(void *)(v80 + 16) = v68;
    *(void *)(v80 + 24) = v69;
    uint64_t v81 = (void *)(v75 + v76[11]);
    uint64_t v116 = v72;
    swift_retain();
    swift_retain();
    State.init(wrappedValue:)();
    uint64_t v82 = v118;
    void *v81 = v117;
    v81[1] = v82;
    uint64_t v83 = (void *)(v75 + v76[12]);
    uint64_t v116 = v74;
    State.init(wrappedValue:)();
    uint64_t v84 = v118;
    void *v83 = v117;
    v83[1] = v84;
    uint64_t v85 = v111;
    sub_10002D790(v75, v111);
    uint64_t v86 = v114;
    uint64_t v87 = (uint64_t)v98;
    sub_10002D7F4(v114, (uint64_t)v98, (uint64_t (*)(void))type metadata accessor for AXLTTitleView);
    uint64_t v88 = (uint64_t)v99;
    sub_10002D7F4(v85, (uint64_t)v99, type metadata accessor for AXLTTextView);
    uint64_t v89 = (uint64_t)v100;
    sub_10002D7F4(v87, (uint64_t)v100, (uint64_t (*)(void))type metadata accessor for AXLTTitleView);
    uint64_t v90 = sub_100006380(&qword_10006BE28);
    sub_10002D7F4(v88, v89 + *(int *)(v90 + 48), type metadata accessor for AXLTTextView);
    sub_10002D85C(v85, type metadata accessor for AXLTTextView);
    sub_10002D85C(v86, (uint64_t (*)(void))type metadata accessor for AXLTTitleView);
    ((void (*)(char *, uint64_t))v103[1])(v97, v77);
    sub_10002D85C(v88, type metadata accessor for AXLTTextView);
    sub_10002D85C(v87, (uint64_t (*)(void))type metadata accessor for AXLTTitleView);
    uint64_t v91 = sub_100006380(&qword_10006BE20);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v91 - 8) + 56))(v89, 0, 1, v91);
    return sub_10000A940(v89, v115, &qword_10006BE18);
  }
}

uint64_t sub_10002B47C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for AXLTCaptionActionsType();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v37 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v37 - v8;
  uint64_t v10 = type metadata accessor for AXLTCaption();
  __chkstk_darwin(v10);
  v14.n128_f64[0] = __chkstk_darwin(v11);
  uint64_t v16 = (char *)&v37 - v15;
  uint64_t v17 = *v1;
  unint64_t v18 = *(void *)(*v1 + 16);
  if (v18)
  {
    uint64_t v40 = v9;
    id v41 = v6;
    uint64_t v42 = v4;
    uint64_t v43 = a1;
    uint64_t v44 = v12;
    uint64_t v19 = v17 + ((*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80));
    uint64_t v20 = *(void *)(v12 + 72);
    unint64_t v38 = *(void (**)(char *, unint64_t, uint64_t, double))(v12 + 16);
    uint64_t v39 = v13;
    v38(v16, v19 + v20 * (v18 - 1), v10, v14.n128_f64[0]);
    uint64_t v21 = AXLTCaption.appID.getter();
    uint64_t v23 = v22;
    if (v21 == placeholderID.getter() && v23 == v24)
    {
      swift_bridgeObjectRelease_n();
      if (v18 <= 1) {
        goto LABEL_14;
      }
    }
    else
    {
      char v26 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v18 < 2 || (v26 & 1) == 0) {
        goto LABEL_14;
      }
    }
    uint64_t v29 = v19 + v20 * (v18 - 2);
    uint64_t v30 = v40;
    AXLTCaption.actionType.getter();
    uint64_t v32 = v41;
    uint64_t v31 = v42;
    (*(void (**)(char *, void, uint64_t))(v42 + 104))(v41, enum case for AXLTCaptionActionsType.AXLTCaptionActionsSeparate(_:), v3);
    sub_10002D8BC(&qword_10006BE30, (void (*)(uint64_t))&type metadata accessor for AXLTCaptionActionsType);
    char v33 = dispatch thunk of static Equatable.== infix(_:_:)();
    uint64_t v34 = *(void (**)(char *, uint64_t))(v31 + 8);
    v34(v32, v3);
    v34(v30, v3);
    if ((v33 & 1) == 0)
    {
      uint64_t v36 = v39;
      ((void (*)(uint64_t, uint64_t, uint64_t))v38)(v39, v29, v10);
      AXLTCaption.text.getter();
      AXLTCaption.placeholder.setter();
      (*(void (**)(char *, uint64_t))(v44 + 8))(v16, v10);
      uint64_t v35 = v43;
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v44 + 32))(v43, v36, v10);
      return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v44 + 56))(v35, 0, 1, v10);
    }
LABEL_14:
    uint64_t v35 = v43;
    (*(void (**)(uint64_t, char *, uint64_t))(v44 + 32))(v43, v16, v10);
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v44 + 56))(v35, 0, 1, v10);
  }
  uint64_t v27 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, __n128))(v12 + 56);

  return v27(a1, 1, 1, v10, v14);
}

double sub_10002B86C@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  long long v7 = *(_OWORD *)(a1 + 136);
  sub_100006380(&qword_10006B638);
  State.wrappedValue.getter();
  if (v6 == 1)
  {
    sub_100006380(&qword_10006BD78);
    uint64_t v3 = swift_allocObject();
    *(_OWORD *)(v3 + 16) = xmmword_1000545C0;
    *(void *)(v3 + 32) = static Color.black.getter();
    static Color.black.getter();
    uint64_t v4 = Color.opacity(_:)();
    swift_release();
    *(void *)(v3 + 40) = v4;
    *(void *)&long long v7 = v3;
    specialized Array._endMutation()();
    Gradient.init(colors:)();
    static UnitPoint.top.getter();
    LinearGradient.init(gradient:startPoint:endPoint:)();
  }
  sub_100006380(&qword_10006BD40);
  sub_100006380(&qword_10006BD48);
  sub_10002CCA8(&qword_10006BD50, &qword_10006BD40, (void (*)(void))sub_10002CD28);
  sub_10002CCA8(&qword_10006BD68, &qword_10006BD48, (void (*)(void))sub_10002CDD0);
  _ConditionalContent<>.init(storage:)();
  double result = *(double *)&v7;
  *(_OWORD *)a2 = v7;
  *(_OWORD *)(a2 + 16) = v8;
  *(void *)(a2 + 32) = v9;
  *(unsigned char *)(a2 + 40) = v10;
  *(unsigned char *)(a2 + 41) = v11;
  return result;
}

id sub_10002BA40(uint64_t a1, _OWORD *a2)
{
  uint64_t v3 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  char v6 = (char *)&v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = type metadata accessor for DispatchQoS();
  uint64_t v7 = *(void *)(v23 - 8);
  __chkstk_darwin(v23);
  uint64_t v9 = (char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static os_log_type_t.debug.getter();
  id result = (id)AXLogLiveTranscription();
  if (result)
  {
    char v11 = result;
    os_log(_:dso:log:_:_:)();

    sub_10002CB6C();
    uint64_t v12 = (void *)static OS_dispatch_queue.main.getter();
    uint64_t v13 = (_OWORD *)swift_allocObject();
    long long v14 = a2[11];
    v13[11] = a2[10];
    v13[12] = v14;
    long long v15 = a2[13];
    v13[13] = a2[12];
    v13[14] = v15;
    long long v16 = a2[7];
    v13[7] = a2[6];
    _OWORD v13[8] = v16;
    long long v17 = a2[9];
    v13[9] = a2[8];
    v13[10] = v17;
    long long v18 = a2[3];
    v13[3] = a2[2];
    v13[4] = v18;
    long long v19 = a2[5];
    v13[5] = a2[4];
    v13[6] = v19;
    long long v20 = a2[1];
    v13[1] = *a2;
    v13[2] = v20;
    aBlock[4] = sub_10002CC58;
    aBlock[5] = v13;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1000315AC;
    aBlock[3] = &unk_100066D88;
    uint64_t v21 = _Block_copy(aBlock);
    sub_1000276F4((uint64_t)a2);
    swift_release();
    static DispatchQoS.unspecified.getter();
    aBlock[0] = &_swiftEmptyArrayStorage;
    sub_10002D8BC((unint64_t *)&unk_10006C110, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
    sub_100006380(&qword_10006BD38);
    sub_1000068B8((unint64_t *)&qword_10006C120, &qword_10006BD38);
    dispatch thunk of SetAlgebra.init<A>(_:)();
    OS_dispatch_queue.async(group:qos:flags:execute:)();
    _Block_release(v21);

    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    return (id)(*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v23);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_10002BD94@<X0>(uint64_t (**a1)@<X0>(uint64_t@<X0>, uint64_t@<X8>)@<X8>)
{
  long long v3 = v1[11];
  v19[10] = v1[10];
  v19[11] = v3;
  long long v4 = v1[13];
  v19[12] = v1[12];
  v19[13] = v4;
  long long v5 = v1[7];
  v19[6] = v1[6];
  v19[7] = v5;
  long long v6 = v1[9];
  v19[8] = v1[8];
  v19[9] = v6;
  long long v7 = v1[3];
  v19[2] = v1[2];
  v19[3] = v7;
  long long v8 = v1[5];
  v19[4] = v1[4];
  v19[5] = v8;
  long long v9 = v1[1];
  v19[0] = *v1;
  v19[1] = v9;
  char v10 = (uint64_t (*)@<X0>(uint64_t@<X0>, uint64_t@<X8>))swift_allocObject();
  long long v11 = v1[11];
  *((_OWORD *)v10 + 11) = v1[10];
  *((_OWORD *)v10 + 12) = v11;
  long long v12 = v1[13];
  *((_OWORD *)v10 + 13) = v1[12];
  *((_OWORD *)v10 + 14) = v12;
  long long v13 = v1[7];
  *((_OWORD *)v10 + 7) = v1[6];
  *((_OWORD *)v10 + 8) = v13;
  long long v14 = v1[9];
  *((_OWORD *)v10 + 9) = v1[8];
  *((_OWORD *)v10 + 10) = v14;
  long long v15 = v1[3];
  *((_OWORD *)v10 + 3) = v1[2];
  *((_OWORD *)v10 + 4) = v15;
  long long v16 = v1[5];
  *((_OWORD *)v10 + 5) = v1[4];
  *((_OWORD *)v10 + 6) = v16;
  long long v17 = v1[1];
  *((_OWORD *)v10 + 1) = *v1;
  *((_OWORD *)v10 + 2) = v17;
  *a1 = sub_10002DAD4;
  a1[1] = v10;
  return sub_1000276F4((uint64_t)v19);
}

uint64_t destroy for AXLTCaptionsView(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();

  swift_release();
  swift_release();

  return swift_release();
}

uint64_t initializeWithCopy for AXLTCaptionsView(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v4;
  uint64_t v5 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v5;
  uint64_t v6 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v6;
  uint64_t v7 = *(void *)(a2 + 80);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = v7;
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  uint64_t v8 = *(void *)(a2 + 112);
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
  *(void *)(a1 + 112) = v8;
  *(unsigned char *)(a1 + 120) = *(unsigned char *)(a2 + 120);
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  *(unsigned char *)(a1 + 136) = *(unsigned char *)(a2 + 136);
  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  *(_OWORD *)(a1 + 152) = *(_OWORD *)(a2 + 152);
  long long v9 = *(void **)(a2 + 176);
  *(void *)(a1 + 168) = *(void *)(a2 + 168);
  *(void *)(a1 + 176) = v9;
  *(void *)(a1 + 184) = *(void *)(a2 + 184);
  *(unsigned char *)(a1 + 192) = *(unsigned char *)(a2 + 192);
  uint64_t v10 = *(void *)(a2 + 208);
  *(void *)(a1 + 200) = *(void *)(a2 + 200);
  *(void *)(a1 + 208) = v10;
  *(void *)(a1 + 216) = *(void *)(a2 + 216);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_retain();
  id v11 = v9;
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for AXLTCaptionsView(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_retain();
  swift_release();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_retain();
  swift_release();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_retain();
  swift_release();
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_retain();
  swift_release();
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_retain();
  swift_release();
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  swift_retain();
  swift_release();
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 112);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  *(void *)(a1 + 112) = v4;
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 120) = *(unsigned char *)(a2 + 120);
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 136) = *(unsigned char *)(a2 + 136);
  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  swift_retain();
  swift_release();
  *(void *)(a1 + 152) = *(void *)(a2 + 152);
  *(void *)(a1 + 160) = *(void *)(a2 + 160);
  *(void *)(a1 + 168) = *(void *)(a2 + 168);
  uint64_t v5 = *(void **)(a1 + 176);
  uint64_t v6 = *(void **)(a2 + 176);
  *(void *)(a1 + 176) = v6;
  id v7 = v6;

  *(void *)(a1 + 184) = *(void *)(a2 + 184);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 192) = *(unsigned char *)(a2 + 192);
  *(void *)(a1 + 200) = *(void *)(a2 + 200);
  swift_retain();
  swift_release();
  *(void *)(a1 + 208) = *(void *)(a2 + 208);
  *(void *)(a1 + 216) = *(void *)(a2 + 216);
  swift_retain();
  swift_release();
  return a1;
}

__n128 initializeWithTake for AXLTCaptionsView(uint64_t a1, uint64_t a2)
{
  long long v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  long long v3 = *(_OWORD *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  long long v5 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v5;
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 48) = v4;
  long long v6 = *(_OWORD *)(a2 + 96);
  long long v7 = *(_OWORD *)(a2 + 112);
  long long v8 = *(_OWORD *)(a2 + 144);
  *(_OWORD *)(a1 + 128) = *(_OWORD *)(a2 + 128);
  *(_OWORD *)(a1 + 144) = v8;
  *(_OWORD *)(a1 + 96) = v6;
  *(_OWORD *)(a1 + 112) = v7;
  __n128 result = *(__n128 *)(a2 + 160);
  long long v10 = *(_OWORD *)(a2 + 176);
  long long v11 = *(_OWORD *)(a2 + 208);
  *(_OWORD *)(a1 + 192) = *(_OWORD *)(a2 + 192);
  *(_OWORD *)(a1 + 208) = v11;
  *(__n128 *)(a1 + 160) = result;
  *(_OWORD *)(a1 + 176) = v10;
  return result;
}

uint64_t assignWithTake for AXLTCaptionsView(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  swift_release();
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_release();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_release();
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  swift_release();
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_release();
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  swift_release();
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 112);
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
  *(void *)(a1 + 112) = v4;
  swift_release();
  *(unsigned char *)(a1 + 120) = *(unsigned char *)(a2 + 120);
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  swift_release();
  *(unsigned char *)(a1 + 136) = *(unsigned char *)(a2 + 136);
  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  swift_release();
  *(_OWORD *)(a1 + 152) = *(_OWORD *)(a2 + 152);
  *(void *)(a1 + 168) = *(void *)(a2 + 168);

  *(_OWORD *)(a1 + 176) = *(_OWORD *)(a2 + 176);
  swift_release();
  *(unsigned char *)(a1 + 192) = *(unsigned char *)(a2 + 192);
  *(void *)(a1 + 200) = *(void *)(a2 + 200);
  swift_release();
  *(void *)(a1 + 208) = *(void *)(a2 + 208);
  *(void *)(a1 + 216) = *(void *)(a2 + 216);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for AXLTCaptionsView(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 224)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AXLTCaptionsView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 216) = 0;
    *(_OWORD *)(result + 200) = 0u;
    *(_OWORD *)(result + 184) = 0u;
    *(_OWORD *)(result + 168) = 0u;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 224) = 1;
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
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 224) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AXLTCaptionsView()
{
  return &type metadata for AXLTCaptionsView;
}

uint64_t sub_10002C4BC()
{
  return sub_1000068B8(&qword_10006BC10, &qword_10006BC18);
}

unint64_t sub_10002C4FC()
{
  unint64_t result = qword_10006BC50;
  if (!qword_10006BC50)
  {
    sub_10000646C(&qword_10006BC28);
    sub_1000068B8(&qword_10006BC58, &qword_10006BC20);
    sub_1000068B8(&qword_10006BC60, &qword_10006BC68);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006BC50);
  }
  return result;
}

uint64_t sub_10002C5C4(uint64_t a1)
{
  return sub_10002CF68(a1, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_10002780C);
}

uint64_t sub_10002C5DC@<X0>(uint64_t a1@<X8>)
{
  return sub_10002831C(v1[2], v1[3], v1[4], a1);
}

unint64_t sub_10002C5E8()
{
  unint64_t result = qword_10006BCA0;
  if (!qword_10006BCA0)
  {
    sub_10000646C(&qword_10006BC98);
    sub_1000068B8(&qword_10006BCA8, &qword_10006BCB0);
    sub_1000068B8(&qword_10006BCB8, &qword_10006BCC0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006BCA0);
  }
  return result;
}

uint64_t sub_10002C6AC()
{
  return sub_10002D4D0((uint64_t (*)(void))&type metadata accessor for ScrollViewProxy, (uint64_t (*)(void))&type metadata accessor for GeometryProxy);
}

void sub_10002C6D8()
{
  type metadata accessor for ScrollViewProxy();
  type metadata accessor for GeometryProxy();

  sub_10002A510();
}

uint64_t sub_10002C7C0(double *a1, uint64_t (*a2)(double, double))
{
  return a2(*a1, a1[1]);
}

uint64_t sub_10002C7EC()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10002C824(double *a1)
{
  return (*(uint64_t (**)(double, double))(v1 + 16))(*a1, a1[1]);
}

id sub_10002C854()
{
  return sub_10002A61C();
}

uint64_t sub_10002C87C()
{
  return (*(uint64_t (**)(void))(v0 + 120))();
}

unint64_t sub_10002C8A4()
{
  unint64_t result = qword_10006BCC8;
  if (!qword_10006BCC8)
  {
    sub_10000646C(&qword_10006BC90);
    sub_10002C944();
    sub_1000068B8(&qword_10006BD20, &qword_10006BD28);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006BCC8);
  }
  return result;
}

unint64_t sub_10002C944()
{
  unint64_t result = qword_10006BCD0;
  if (!qword_10006BCD0)
  {
    sub_10000646C(&qword_10006BC88);
    sub_10002C9E4();
    sub_1000068B8(&qword_10006BD10, &qword_10006BD18);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006BCD0);
  }
  return result;
}

unint64_t sub_10002C9E4()
{
  unint64_t result = qword_10006BCD8;
  if (!qword_10006BCD8)
  {
    sub_10000646C(&qword_10006BC80);
    sub_10002CA84();
    sub_1000068B8(&qword_10006BD00, &qword_10006BD08);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006BCD8);
  }
  return result;
}

unint64_t sub_10002CA84()
{
  unint64_t result = qword_10006BCE0;
  if (!qword_10006BCE0)
  {
    sub_10000646C(&qword_10006BC70);
    sub_1000068B8(&qword_10006BCE8, &qword_10006BC78);
    sub_1000068B8(&qword_10006BCF0, &qword_10006BCF8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006BCE0);
  }
  return result;
}

id sub_10002CB4C(uint64_t a1)
{
  return sub_10002BA40(a1, (_OWORD *)(v1 + 16));
}

uint64_t sub_10002CB54(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10002CB64()
{
  return swift_release();
}

unint64_t sub_10002CB6C()
{
  unint64_t result = qword_10006BD30;
  if (!qword_10006BD30)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10006BD30);
  }
  return result;
}

uint64_t sub_10002CBB0()
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();

  swift_release();
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 240, 7);
}

uint64_t sub_10002CC58()
{
  return State.wrappedValue.setter();
}

uint64_t sub_10002CCA8(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10000646C(a2);
    a3();
    sub_10002CD7C();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_10002CD28()
{
  unint64_t result = qword_10006BD58;
  if (!qword_10006BD58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006BD58);
  }
  return result;
}

unint64_t sub_10002CD7C()
{
  unint64_t result = qword_10006BD60;
  if (!qword_10006BD60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006BD60);
  }
  return result;
}

unint64_t sub_10002CDD0()
{
  unint64_t result = qword_10006BD70;
  if (!qword_10006BD70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006BD70);
  }
  return result;
}

uint64_t sub_10002CE24(uint64_t a1)
{
  long long v3 = *(void **)(a1 + 176);
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  swift_release();
  swift_release();
  swift_release();
  return a1;
}

uint64_t sub_10002CF20@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = AXLTCaption.id.getter();
  *a1 = result;
  return result;
}

uint64_t sub_10002CF50(uint64_t a1)
{
  return sub_10002CF68(a1, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1000287C0);
}

uint64_t sub_10002CF68(uint64_t a1, uint64_t (*a2)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v4 = *(void *)(type metadata accessor for GeometryProxy() - 8);
  uint64_t v5 = v2 + ((*(unsigned __int8 *)(v4 + 80) + 240) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));

  return a2(a1, v2 + 16, v5);
}

uint64_t sub_10002D000(uint64_t a1)
{
  return a1;
}

uint64_t sub_10002D02C()
{
  return sub_10002D05C(&qword_10006BDA0, &qword_10006BDA8, (void (*)(void))sub_10002D0D8);
}

uint64_t sub_10002D05C(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10000646C(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_10002D0D8()
{
  unint64_t result = qword_10006BDB0;
  if (!qword_10006BDB0)
  {
    sub_10000646C(&qword_10006BDB8);
    sub_1000068B8(&qword_10006BDC0, &qword_10006BDC8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006BDB0);
  }
  return result;
}

uint64_t sub_10002D178()
{
  return sub_10002D4D0((uint64_t (*)(void))&type metadata accessor for GeometryProxy, (uint64_t (*)(void))&type metadata accessor for ScrollViewProxy);
}

uint64_t sub_10002D1A4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = *(void *)(type metadata accessor for GeometryProxy() - 8);
  unint64_t v6 = (*(unsigned __int8 *)(v5 + 80) + 240) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v7 = *(void *)(v5 + 64);
  uint64_t v8 = *(void *)(type metadata accessor for ScrollViewProxy() - 8);
  uint64_t v9 = v2 + ((v6 + v7 + *(unsigned __int8 *)(v8 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));

  return sub_1000299C4(a1, (_OWORD *)(v2 + 16), v2 + v6, v9, a2);
}

uint64_t sub_10002D290()
{
  uint64_t v1 = type metadata accessor for GeometryProxy();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 240) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();

  swift_release();
  swift_release();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v5, v6);
}

uint64_t sub_10002D3CC(uint64_t a1, double *a2)
{
  type metadata accessor for GeometryProxy();

  return sub_10002A0D4(a1, a2, v2 + 16);
}

unint64_t sub_10002D450()
{
  unint64_t result = qword_10006BDE0;
  if (!qword_10006BDE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006BDE0);
  }
  return result;
}

uint64_t sub_10002D4A4()
{
  return sub_10002D4D0((uint64_t (*)(void))&type metadata accessor for ScrollViewProxy, (uint64_t (*)(void))&type metadata accessor for GeometryProxy);
}

uint64_t sub_10002D4D0(uint64_t (*a1)(void), uint64_t (*a2)(void))
{
  uint64_t v4 = a1(0);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(unsigned __int8 *)(v5 + 80);
  uint64_t v7 = (v6 + 240) & ~v6;
  uint64_t v8 = *(void *)(v5 + 64);
  uint64_t v9 = a2(0);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(unsigned __int8 *)(v10 + 80);
  uint64_t v12 = (v7 + v8 + v11) & ~v11;
  uint64_t v13 = v12 + *(void *)(v10 + 64);
  uint64_t v14 = v6 | v11 | 7;
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();

  swift_release();
  swift_release();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v2 + v7, v4);
  (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v2 + v12, v9);

  return _swift_deallocObject(v2, v13, v14);
}

void sub_10002D6A8()
{
  type metadata accessor for ScrollViewProxy();
  type metadata accessor for GeometryProxy();

  sub_10002A2DC();
}

uint64_t sub_10002D790(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for AXLTTextView(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10002D7F4(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_10002D85C(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_10002D8BC(unint64_t *a1, void (*a2)(uint64_t))
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

double sub_10002D904@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, double a10@<D0>, long long a11, long long a12, uint64_t a13, uint64_t a14)
{
  State.init(wrappedValue:)();
  State.init(wrappedValue:)();
  sub_100006380(&qword_10006B428);
  State.init(wrappedValue:)();
  State.init(wrappedValue:)();
  State.init(wrappedValue:)();
  double result = v25;
  *(void *)a9 = a1;
  *(void *)(a9 + 8) = a2;
  *(unsigned char *)(a9 + 16) = a3;
  *(void *)(a9 + 24) = a4;
  *(void *)(a9 + 32) = a5;
  *(double *)(a9 + 40) = a10;
  *(void *)(a9 + 48) = a6;
  *(void *)(a9 + 56) = a7;
  *(void *)(a9 + 64) = a8;
  *(_OWORD *)(a9 + 72) = a11;
  *(_OWORD *)(a9 + 88) = a12;
  *(void *)(a9 + 104) = a13;
  *(void *)(a9 + 112) = a14;
  *(unsigned char *)(a9 + 120) = LOBYTE(v25);
  *(void *)(a9 + 128) = v26;
  *(unsigned char *)(a9 + 136) = LOBYTE(v25);
  *(void *)(a9 + 144) = v26;
  *(_OWORD *)(a9 + 152) = xmmword_1000545D0;
  *(void *)(a9 + 168) = 0x3FF0000000000000;
  *(double *)(a9 + 176) = v25;
  *(void *)(a9 + 184) = v26;
  *(unsigned char *)(a9 + 192) = LOBYTE(v25);
  *(void *)(a9 + 200) = v26;
  *(double *)(a9 + 208) = v25;
  *(void *)(a9 + 216) = v26;
  return result;
}

double safeSize(offset:size:containerSize:)(double a1, double a2, double a3)
{
  return a3;
}

void safeOffset(offset:size:containerSize:foreheadWindowRect:)(double a1, CGFloat a2, double a3, double a4, double a5, double a6, CGFloat a7, CGFloat a8, CGFloat a9, CGFloat a10)
{
  v21.origin.CGFloat x = a7;
  v21.origin.CGFloat y = a8;
  v21.size.CGFloat width = a9;
  v21.size.CGFloat height = a10;
  if (CGRectGetHeight(v21) + a8 + -37.3333333 > a2)
  {
    if (AXDeviceHasJindo())
    {
      v22.origin.CGFloat x = a7;
      v22.origin.CGFloat y = a8;
      v22.size.CGFloat width = a9;
      v22.size.CGFloat height = a10;
      CGRectGetHeight(v22);
    }
  }
}

double iconSize()()
{
  int IsPad = AXDeviceIsPad();
  double result = 54.0;
  if (IsPad) {
    return 68.0;
  }
  return result;
}

double sub_10002DC0C(char a1, double a2, double a3, double a4, double a5)
{
  double v10 = a4 + -10.0;
  if (AXDeviceIsPad()) {
    double v11 = -68.0;
  }
  else {
    double v11 = -54.0;
  }
  if (v10 + v11 >= a2)
  {
    if (a2 >= 10.0) {
      double v14 = a2;
    }
    else {
      double v14 = 10.0;
    }
  }
  else
  {
    int IsPad = AXDeviceIsPad();
    double v13 = 54.0;
    if (IsPad) {
      double v13 = 68.0;
    }
    double v14 = v10 - v13;
  }
  double v15 = a5 + -10.0;
  if (AXDeviceIsPad()) {
    double v16 = -68.0;
  }
  else {
    double v16 = -54.0;
  }
  if (v15 + v16 < a3)
  {
    AXDeviceIsPad();
    return v14;
  }
  if (a3 < 10.0) {
    return v14;
  }
  double v14 = 10.0;
  if (a1 == 3)
  {
LABEL_20:
    if (a4 * 0.5 >= a2 && a1 != 2) {
      return v14;
    }
    goto LABEL_25;
  }
  if (a1 != 2)
  {
    if (a1) {
      return v14;
    }
    goto LABEL_20;
  }
LABEL_25:
  int v18 = AXDeviceIsPad();
  double v19 = 54.0;
  if (v18) {
    double v19 = 68.0;
  }
  return v10 - v19;
}

uint64_t titleAndTextHeight(textHeight:dynamicTypeSize:)(uint64_t a1, double a2)
{
  uint64_t v4 = sub_100006380(&qword_10006B198);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for DynamicTypeSize();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  double v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_10006AE20 != -1) {
    swift_once();
  }
  double v11 = self;
  if (qword_10006AE10 != -1) {
    swift_once();
  }
  id v12 = [v11 preferredFontForTextStyle:titleFontStyle];
  [v12 lineHeight];

  if (qword_10006AE18 != -1) {
    swift_once();
  }
  id v13 = [v11 preferredFontForTextStyle:textFontStyle];
  [v13 lineHeight];

  textLinesNumberMax.getter();
  sub_100008958(a1, (uint64_t)v6);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
  {
    uint64_t result = sub_1000089C0((uint64_t)v6);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v10, v6, v7);
    if (qword_10006AD98 != -1) {
      swift_once();
    }
    sub_10000874C(v7, (uint64_t)accessibilityLayoutTextSize);
    sub_100008A20();
    char v15 = dispatch thunk of static Comparable.< infix(_:_:)();
    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
    if ((v15 & 1) == 0) {
      uint64_t result = textLinesAccessibilityNumberMax.getter();
    }
  }
  if (a2 == 0.0) {
    return textLinesNumberMin.getter();
  }
  return result;
}

void bottomButtonsBarLeftRightInset()()
{
  if ((AXDeviceIsPad() & 1) == 0)
  {
    id v0 = [self mainScreen];
    [v0 bounds];
    CGFloat v2 = v1;
    CGFloat v4 = v3;
    CGFloat v6 = v5;
    CGFloat v8 = v7;

    v9.origin.CGFloat x = v2;
    v9.origin.CGFloat y = v4;
    v9.size.CGFloat width = v6;
    v9.size.CGFloat height = v8;
    CGRectGetWidth(v9);
  }
}

uint64_t *AXLTSettingsManager.shared.unsafeMutableAddressor()
{
  if (qword_10006AE20 != -1) {
    swift_once();
  }
  return &static AXLTSettingsManager.shared;
}

void *titleOpacity.unsafeMutableAddressor()
{
  return &titleOpacity;
}

NSNotificationName *textColorChangedNotification.unsafeMutableAddressor()
{
  if (qword_10006ADD0 != -1) {
    swift_once();
  }
  return &textColorChangedNotification;
}

unint64_t sub_10002E220(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    CGFloat v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100006380(&qword_10006BF30);
  CGFloat v2 = (void *)static _DictionaryStorage.allocate(capacity:)();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  CGFloat v4 = (void **)(a1 + 48);
  while (1)
  {
    uint64_t v5 = (uint64_t)*(v4 - 2);
    uint64_t v6 = (uint64_t)*(v4 - 1);
    double v7 = *v4;
    swift_bridgeObjectRetain();
    id v8 = v7;
    unint64_t result = sub_100048704(v5, v6);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    double v11 = (uint64_t *)(v2[6] + 16 * result);
    *double v11 = v5;
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

unint64_t sub_10002E33C(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100006380(&qword_10006BF20);
  uint64_t v2 = static _DictionaryStorage.allocate(capacity:)();
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
    sub_100031458(v6, (uint64_t)v15);
    unint64_t result = sub_1000486C0((uint64_t)v15);
    if (v8) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v9 = v3[6] + 40 * result;
    long long v10 = v15[0];
    long long v11 = v15[1];
    *(void *)(v9 + 32) = v16;
    *(_OWORD *)uint64_t v9 = v10;
    *(_OWORD *)(v9 + 16) = v11;
    unint64_t result = (unint64_t)sub_1000314C0(&v17, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v3[2] = v14;
    v6 += 72;
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

NSNotificationName *pausedChangedNotification.unsafeMutableAddressor()
{
  if (qword_10006ADC8 != -1) {
    swift_once();
  }
  return &pausedChangedNotification;
}

NSNotificationName *nubbitIdleOpacityChangedNotification.unsafeMutableAddressor()
{
  if (qword_10006ADE8 != -1) {
    swift_once();
  }
  return &nubbitIdleOpacityChangedNotification;
}

NSString *sub_10002E504()
{
  unint64_t result = (NSString *)String._bridgeToObjectiveC()();
  macOSSettingsDidChangedNotification = result;
  return result;
}

NSNotificationName *macOSSettingsDidChangedNotification.unsafeMutableAddressor()
{
  if (qword_10006ADB8 != -1) {
    swift_once();
  }
  return &macOSSettingsDidChangedNotification;
}

Swift::String *macOSTranscriptionEnabledKey.unsafeMutableAddressor()
{
  return &macOSTranscriptionEnabledKey;
}

Swift::String *macOSTranscriptionViewFontKey.unsafeMutableAddressor()
{
  return &macOSTranscriptionViewFontKey;
}

Swift::String *macOSTranscriptionViewFontSizeKey.unsafeMutableAddressor()
{
  return &macOSTranscriptionViewFontSizeKey;
}

Swift::String *macOSTranscriptionViewFontColorKey.unsafeMutableAddressor()
{
  return &macOSTranscriptionViewFontColorKey;
}

Swift::String *macOSTranscriptionViewBackgroundColorKey.unsafeMutableAddressor()
{
  return &macOSTranscriptionViewBackgroundColorKey;
}

NSString *sub_10002E5C4()
{
  unint64_t result = (NSString *)String._bridgeToObjectiveC()();
  micOnChangedNotification = result;
  return result;
}

NSNotificationName *micOnChangedNotification.unsafeMutableAddressor()
{
  if (qword_10006ADC0 != -1) {
    swift_once();
  }
  return &micOnChangedNotification;
}

NSString *sub_10002E648()
{
  unint64_t result = (NSString *)String._bridgeToObjectiveC()();
  pausedChangedNotification = result;
  return result;
}

NSString *sub_10002E680()
{
  unint64_t result = (NSString *)String._bridgeToObjectiveC()();
  textColorChangedNotification = result;
  return result;
}

NSString *sub_10002E6B8()
{
  unint64_t result = (NSString *)String._bridgeToObjectiveC()();
  backgroundColorChangedNotification = result;
  return result;
}

NSNotificationName *backgroundColorChangedNotification.unsafeMutableAddressor()
{
  if (qword_10006ADD8 != -1) {
    swift_once();
  }
  return &backgroundColorChangedNotification;
}

NSString *sub_10002E73C()
{
  unint64_t result = (NSString *)String._bridgeToObjectiveC()();
  textFontChangedNotification = result;
  return result;
}

NSNotificationName *textFontChangedNotification.unsafeMutableAddressor()
{
  if (qword_10006ADE0 != -1) {
    swift_once();
  }
  return &textFontChangedNotification;
}

NSString *sub_10002E7C0()
{
  unint64_t result = (NSString *)String._bridgeToObjectiveC()();
  nubbitIdleOpacityChangedNotification = result;
  return result;
}

void *inactiveOpacity.unsafeMutableAddressor()
{
  return &inactiveOpacity;
}

void *placeholderOpacity.unsafeMutableAddressor()
{
  return &placeholderOpacity;
}

void *titleToBodyTextFontSizeRatio.unsafeMutableAddressor()
{
  return &titleToBodyTextFontSizeRatio;
}

uint64_t sub_10002E81C()
{
  uint64_t result = static Color.white.getter();
  qword_10006BE38 = result;
  return result;
}

uint64_t sub_10002E83C()
{
  uint64_t result = static Color.clear.getter();
  qword_10006BE40 = result;
  return result;
}

uint64_t sub_10002E85C(uint64_t a1)
{
  return sub_10002E884(a1, &enum case for Font.TextStyle.title3(_:), &qword_10006BE48);
}

uint64_t sub_10002E870(uint64_t a1)
{
  return sub_10002E884(a1, &enum case for Font.TextStyle.body(_:), &qword_10006BE50);
}

uint64_t sub_10002E884(uint64_t a1, unsigned int *a2, uint64_t *a3)
{
  sub_100006380(&qword_10006BF38);
  __chkstk_darwin();
  uint64_t v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for Font.TextStyle();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin();
  long long v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void, uint64_t))(v8 + 104))(v10, *a2, v7);
  uint64_t v11 = type metadata accessor for Font.Design();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v6, 1, 1, v11);
  uint64_t v12 = static Font.system(_:design:weight:)();
  sub_1000314F8((uint64_t)v6);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  *a3 = v12;
  return result;
}

UIFontTextStyle sub_10002EA18()
{
  titleFontStyle = UIFontTextStyleBody;
  return UIFontTextStyleBody;
}

UIFontTextStyle *titleFontStyle.unsafeMutableAddressor()
{
  if (qword_10006AE10 != -1) {
    swift_once();
  }
  return &titleFontStyle;
}

UIFontTextStyle sub_10002EA7C()
{
  textFontStyle = UIFontTextStyleTitle3;
  return UIFontTextStyleTitle3;
}

UIFontTextStyle *textFontStyle.unsafeMutableAddressor()
{
  if (qword_10006AE18 != -1) {
    swift_once();
  }
  return &textFontStyle;
}

uint64_t AXLTSettingsManager.delegate.getter()
{
  return swift_unknownObjectWeakLoadStrong();
}

uint64_t AXLTSettingsManager.delegate.setter()
{
  return swift_unknownObjectRelease();
}

void (*AXLTSettingsManager.delegate.modify(void *a1))(void **a1, char a2)
{
  uint64_t v3 = malloc(0x30uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR___AXLTSettingsManager_delegate;
  v3[4] = v1;
  v3[5] = v4;
  swift_beginAccess();
  v3[3] = swift_unknownObjectWeakLoadStrong();
  return sub_10002ECBC;
}

void sub_10002ECBC(void **a1, char a2)
{
  uint64_t v3 = *a1;
  swift_unknownObjectWeakAssign();
  if (a2)
  {
    swift_unknownObjectRelease();
    swift_endAccess();
  }
  else
  {
    swift_endAccess();
    swift_unknownObjectRelease();
  }

  free(v3);
}

uint64_t AXLTSettingsManager.textColor.getter()
{
  return sub_10002EEA8();
}

uint64_t AXLTSettingsManager.textColor.setter(uint64_t a1)
{
  return sub_10002EEFC(a1, &OBJC_IVAR___AXLTSettingsManager_textColor);
}

uint64_t (*AXLTSettingsManager.textColor.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t AXLTSettingsManager.backgroundColor.getter()
{
  return sub_10002EEA8();
}

uint64_t AXLTSettingsManager.backgroundColor.setter(uint64_t a1)
{
  return sub_10002EEFC(a1, &OBJC_IVAR___AXLTSettingsManager_backgroundColor);
}

uint64_t (*AXLTSettingsManager.backgroundColor.modify())()
{
  return j__swift_endAccess;
}

uint64_t AXLTSettingsManager.titleFont.getter()
{
  return sub_10002EEA8();
}

uint64_t AXLTSettingsManager.titleFont.setter(uint64_t a1)
{
  return sub_10002EEFC(a1, &OBJC_IVAR___AXLTSettingsManager_titleFont);
}

uint64_t (*AXLTSettingsManager.titleFont.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t AXLTSettingsManager.textFont.getter()
{
  return sub_10002EEA8();
}

uint64_t sub_10002EEA8()
{
  return swift_retain();
}

uint64_t AXLTSettingsManager.textFont.setter(uint64_t a1)
{
  return sub_10002EEFC(a1, &OBJC_IVAR___AXLTSettingsManager_textFont);
}

uint64_t sub_10002EEFC(uint64_t a1, void *a2)
{
  uint64_t v4 = (void *)(v2 + *a2);
  swift_beginAccess();
  *uint64_t v4 = a1;
  return swift_release();
}

uint64_t (*AXLTSettingsManager.textFont.modify())()
{
  return j_j__swift_endAccess;
}

double AXLTSettingsManager.titleFontPointSize.getter()
{
  return sub_10002F02C(&qword_10006AE10, &titleFontStyle, (SEL *)&selRef_pointSize);
}

double AXLTSettingsManager.titleLineHeight.getter()
{
  return sub_10002F02C(&qword_10006AE10, &titleFontStyle, (SEL *)&selRef_lineHeight);
}

double AXLTSettingsManager.textLineHeight.getter()
{
  return sub_10002F02C(&qword_10006AE18, &textFontStyle, (SEL *)&selRef_lineHeight);
}

double sub_10002F02C(void *a1, void *a2, SEL *a3)
{
  uint64_t v6 = self;
  if (*a1 != -1) {
    swift_once();
  }
  id v7 = [v6 preferredFontForTextStyle:*a2];
  [v7 *a3];
  double v9 = v8;

  return v9;
}

uint64_t AXLTSettingsManager.isMicOn.getter()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR___AXLTSettingsManager_isMicOn);
  swift_beginAccess();
  return *v1;
}

uint64_t AXLTSettingsManager.isMicOn.setter(char a1)
{
  uint64_t v3 = (unsigned char *)(v1 + OBJC_IVAR___AXLTSettingsManager_isMicOn);
  uint64_t result = swift_beginAccess();
  *uint64_t v3 = a1;
  return result;
}

uint64_t (*AXLTSettingsManager.isMicOn.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t AXLTSettingsManager.isPaused.getter()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR___AXLTSettingsManager_isPaused);
  swift_beginAccess();
  return *v1;
}

uint64_t AXLTSettingsManager.isPaused.setter(char a1)
{
  uint64_t v3 = (unsigned char *)(v1 + OBJC_IVAR___AXLTSettingsManager_isPaused);
  uint64_t result = swift_beginAccess();
  *uint64_t v3 = a1;
  return result;
}

uint64_t (*AXLTSettingsManager.isPaused.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t AXLTSettingsManager.inCallOn.getter()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR___AXLTSettingsManager_inCallOn);
  swift_beginAccess();
  return *v1;
}

uint64_t AXLTSettingsManager.inCallOn.setter(char a1)
{
  uint64_t v3 = (unsigned char *)(v1 + OBJC_IVAR___AXLTSettingsManager_inCallOn);
  uint64_t result = swift_beginAccess();
  *uint64_t v3 = a1;
  return result;
}

uint64_t (*AXLTSettingsManager.inCallOn.modify())()
{
  return j_j__swift_endAccess;
}

double AXLTSettingsManager.nubbitIdleOpacity.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR___AXLTSettingsManager_nubbitIdleOpacity;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t AXLTSettingsManager.nubbitIdleOpacity.setter(double a1)
{
  uint64_t v3 = (double *)(v1 + OBJC_IVAR___AXLTSettingsManager_nubbitIdleOpacity);
  uint64_t result = swift_beginAccess();
  *uint64_t v3 = a1;
  return result;
}

uint64_t (*AXLTSettingsManager.nubbitIdleOpacity.modify())()
{
  return j_j__swift_endAccess;
}

id sub_10002F498()
{
  id result = [objc_allocWithZone((Class)type metadata accessor for AXLTSettingsManager()) init];
  static AXLTSettingsManager.shared = (uint64_t)result;
  return result;
}

id static AXLTSettingsManager.shared.getter()
{
  if (qword_10006AE20 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)static AXLTSettingsManager.shared;

  return v0;
}

__CFNotificationCenter *sub_10002F580()
{
  swift_unknownObjectWeakInit();
  uint64_t v1 = OBJC_IVAR___AXLTSettingsManager_textColor;
  uint64_t v2 = qword_10006ADF0;
  uint64_t v3 = v0;
  if (v2 != -1) {
    swift_once();
  }
  *(void *)&v0[v1] = qword_10006BE38;
  uint64_t v4 = OBJC_IVAR___AXLTSettingsManager_backgroundColor;
  uint64_t v5 = qword_10006ADF8;
  swift_retain();
  if (v5 != -1) {
    swift_once();
  }
  *(void *)&v3[v4] = qword_10006BE40;
  uint64_t v6 = OBJC_IVAR___AXLTSettingsManager_titleFont;
  uint64_t v7 = qword_10006AE08;
  swift_retain();
  if (v7 != -1) {
    swift_once();
  }
  *(void *)&v3[v6] = qword_10006BE50;
  uint64_t v8 = OBJC_IVAR___AXLTSettingsManager_textFont;
  uint64_t v9 = qword_10006AE00;
  swift_retain();
  if (v9 != -1) {
    swift_once();
  }
  *(void *)&v3[v8] = qword_10006BE48;
  uint64_t v10 = OBJC_IVAR___AXLTSettingsManager_isMicOn;
  swift_retain();
  v3[v10] = _AXSLiveTranscriptionMicOn() != 0;
  uint64_t v11 = OBJC_IVAR___AXLTSettingsManager_isPaused;
  v3[v11] = _AXSLiveTranscriptionPaused() != 0;
  uint64_t v12 = OBJC_IVAR___AXLTSettingsManager_inCallOn;
  v3[v12] = _AXSLiveTranscriptionInCallEnabled() != 0;
  *(void *)&v3[OBJC_IVAR___AXLTSettingsManager_nubbitIdleOpacity] = 0x3FE0000000000000;
  *(void *)&v3[OBJC_IVAR___AXLTSettingsManager_micStateChanged] = sub_10002FB7C;
  *(void *)&v3[OBJC_IVAR___AXLTSettingsManager_pausedStateChanged] = sub_10002FBA8;
  *(void *)&v3[OBJC_IVAR___AXLTSettingsManager_inCallStateChanged] = sub_10002FBD4;
  *(void *)&v3[OBJC_IVAR___AXLTSettingsManager_categoryNameChanged] = sub_10002FCC8;
  *(void *)&v3[OBJC_IVAR___AXLTSettingsManager_transcriptionEnabledChanged] = sub_10002FCD4;
  *(void *)&v3[OBJC_IVAR___AXLTSettingsManager_nubbitIdleOpacityChanged] = sub_10002FDC8;
  *(void *)&v3[OBJC_IVAR___AXLTSettingsManager_textColorChanged] = sub_100030740;
  *(void *)&v3[OBJC_IVAR___AXLTSettingsManager_backgroundColorChanged] = sub_10003080C;

  v40.receiver = v3;
  v40.super_class = (Class)type metadata accessor for AXLTSettingsManager();
  BOOL v13 = (char *)objc_msgSendSuper2(&v40, "init");
  id result = CFNotificationCenterGetDarwinNotifyCenter();
  if (!kAXSLiveTranscriptionMicOnDidChangeNotification)
  {
    __break(1u);
    goto LABEL_21;
  }
  char v15 = result;
  uint64_t v16 = *(void (__cdecl **)(CFNotificationCenterRef, void *, CFNotificationName, const void *, CFDictionaryRef))&v13[OBJC_IVAR___AXLTSettingsManager_micStateChanged];
  long long v17 = (__CFString *)kAXSLiveTranscriptionMicOnDidChangeNotification;
  CFNotificationCenterAddObserver(v15, 0, v16, v17, 0, CFNotificationSuspensionBehaviorDeliverImmediately);

  id result = CFNotificationCenterGetDarwinNotifyCenter();
  if (!kAXSLiveTranscriptionPausedDidChangeNotification)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  int v18 = result;
  double v19 = *(void (__cdecl **)(CFNotificationCenterRef, void *, CFNotificationName, const void *, CFDictionaryRef))&v13[OBJC_IVAR___AXLTSettingsManager_pausedStateChanged];
  long long v20 = (__CFString *)kAXSLiveTranscriptionPausedDidChangeNotification;
  CFNotificationCenterAddObserver(v18, 0, v19, v20, 0, CFNotificationSuspensionBehaviorDeliverImmediately);

  id result = CFNotificationCenterGetDarwinNotifyCenter();
  if (!kAXSLiveTranscriptionTextColorDidChangeNotification)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  CGRect v21 = result;
  CGRect v22 = *(void (__cdecl **)(CFNotificationCenterRef, void *, CFNotificationName, const void *, CFDictionaryRef))&v13[OBJC_IVAR___AXLTSettingsManager_textColorChanged];
  uint64_t v23 = (__CFString *)kAXSLiveTranscriptionTextColorDidChangeNotification;
  CFNotificationCenterAddObserver(v21, 0, v22, v23, 0, CFNotificationSuspensionBehaviorDeliverImmediately);

  id result = CFNotificationCenterGetDarwinNotifyCenter();
  if (!kAXSLiveTranscriptionBackgroundColorDidChangeNotification)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  uint64_t v24 = result;
  double v25 = *(void (__cdecl **)(CFNotificationCenterRef, void *, CFNotificationName, const void *, CFDictionaryRef))&v13[OBJC_IVAR___AXLTSettingsManager_backgroundColorChanged];
  uint64_t v26 = (__CFString *)kAXSLiveTranscriptionBackgroundColorDidChangeNotification;
  CFNotificationCenterAddObserver(v24, 0, v25, v26, 0, CFNotificationSuspensionBehaviorDeliverImmediately);

  id result = CFNotificationCenterGetDarwinNotifyCenter();
  if (!kAXSLiveCaptionsNubbitIdleOpacityDidChangeNotification)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  uint64_t v27 = result;
  long long v28 = *(void (__cdecl **)(CFNotificationCenterRef, void *, CFNotificationName, const void *, CFDictionaryRef))&v13[OBJC_IVAR___AXLTSettingsManager_nubbitIdleOpacityChanged];
  uint64_t v29 = (__CFString *)kAXSLiveCaptionsNubbitIdleOpacityDidChangeNotification;
  CFNotificationCenterAddObserver(v27, 0, v28, v29, 0, CFNotificationSuspensionBehaviorDeliverImmediately);

  id result = CFNotificationCenterGetDarwinNotifyCenter();
  if (!kAXSLiveTranscriptionInCallEnabledDidChangeNotification)
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  uint64_t v30 = result;
  uint64_t v31 = *(void (__cdecl **)(CFNotificationCenterRef, void *, CFNotificationName, const void *, CFDictionaryRef))&v13[OBJC_IVAR___AXLTSettingsManager_inCallStateChanged];
  uint64_t v32 = (__CFString *)kAXSLiveTranscriptionInCallEnabledDidChangeNotification;
  CFNotificationCenterAddObserver(v30, 0, v31, v32, 0, CFNotificationSuspensionBehaviorDeliverImmediately);

  id result = CFNotificationCenterGetDarwinNotifyCenter();
  if (!kAXSApplePreferredContentSizeCategoryNotification)
  {
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  char v33 = result;
  uint64_t v34 = *(void (__cdecl **)(CFNotificationCenterRef, void *, CFNotificationName, const void *, CFDictionaryRef))&v13[OBJC_IVAR___AXLTSettingsManager_categoryNameChanged];
  uint64_t v35 = (__CFString *)kAXSApplePreferredContentSizeCategoryNotification;
  CFNotificationCenterAddObserver(v33, 0, v34, v35, 0, CFNotificationSuspensionBehaviorDeliverImmediately);

  id result = CFNotificationCenterGetDarwinNotifyCenter();
  if (!kAXSLiveTranscriptionEnabledDidChangeNotification)
  {
LABEL_27:
    __break(1u);
    return result;
  }
  uint64_t v36 = result;
  uint64_t v37 = *(void (__cdecl **)(CFNotificationCenterRef, void *, CFNotificationName, const void *, CFDictionaryRef))&v13[OBJC_IVAR___AXLTSettingsManager_transcriptionEnabledChanged];
  unint64_t v38 = (__CFString *)kAXSLiveTranscriptionEnabledDidChangeNotification;
  CFNotificationCenterAddObserver(v36, 0, v37, v38, 0, CFNotificationSuspensionBehaviorDeliverImmediately);

  sub_100030538();
  swift_beginAccess();
  Strong = (void *)swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    [Strong fontDidChange];
    swift_unknownObjectRelease();
  }
  sub_100030BF4();
  sub_100030830();

  return (__CFNotificationCenter *)v13;
}

void sub_10002FB7C(void *a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
}

void sub_10002FBA8(void *a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
}

void sub_10002FBD4(void *a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
}

void sub_10002FC00(void *a1, uint64_t a2, void *a3, uint64_t a4, void *a5, unsigned int (*a6)(void), void (*a7)(BOOL))
{
  uint64_t v11 = qword_10006AE20;
  id v12 = a1;
  id v13 = a3;
  id v15 = a5;
  if (v11 != -1) {
    swift_once();
  }
  BOOL v14 = a6() != 0;
  a7(v14);
}

void sub_10002FCC8(void *a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
}

void sub_10002FCD4(void *a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
}

void sub_10002FCE0(void *a1, uint64_t a2, void *a3, uint64_t a4, void *a5, SEL *a6)
{
  uint64_t v9 = qword_10006AE20;
  id v10 = a1;
  id v11 = a3;
  id v12 = a5;
  if (v9 != -1) {
    swift_once();
  }
  swift_beginAccess();
  Strong = (void *)swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    [Strong *a6];

    swift_unknownObjectRelease();
  }
  else
  {
  }
}

void sub_10002FDC8(void *a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
}

void sub_10002FDE0(char a1)
{
  os_log_type_t v3 = static os_log_type_t.debug.getter();
  uint64_t v4 = (id)AXLogLiveTranscription();
  if (v4)
  {
    uint64_t v5 = v4;
    if (os_log_type_enabled(v4, v3))
    {
      uint64_t v6 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v6 = 67109120;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl((void *)&_mh_execute_header, v5, v3, "updateMicOnState: %{BOOL}d", v6, 8u);
      swift_slowDealloc();
    }

    uint64_t v7 = (char *)(v1 + OBJC_IVAR___AXLTSettingsManager_isMicOn);
    swift_beginAccess();
    if (*v7 != (a1 & 1))
    {
      char *v7 = a1 & 1;
      if (qword_10006AE28 != -1) {
        swift_once();
      }
      sub_100038EE4();
    }
    id v8 = [self defaultCenter];
    if (qword_10006ADC0 != -1) {
      swift_once();
    }
    NSNotificationName v9 = micOnChangedNotification;
    sub_100006380(&qword_10006BF10);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_100054300;
    uint64_t v14 = notificationValueKey.getter();
    uint64_t v15 = v11;
    AnyHashable.init<A>(_:)();
    char v12 = *v7;
    *(void *)(inited + 96) = &type metadata for Bool;
    *(unsigned char *)(inited + 72) = v12;
    sub_10002E33C(inited);
    Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    objc_msgSend(v8, "postNotificationName:object:userInfo:", v9, 0, isa, v14, v15);
  }
  else
  {
    __break(1u);
  }
}

void sub_10003004C(char a1)
{
  os_log_type_t v3 = static os_log_type_t.debug.getter();
  uint64_t v4 = (id)AXLogLiveTranscription();
  if (v4)
  {
    uint64_t v5 = v4;
    if (os_log_type_enabled(v4, v3))
    {
      uint64_t v6 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v6 = 67109120;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl((void *)&_mh_execute_header, v5, v3, "updatePausedState: %{BOOL}d", v6, 8u);
      swift_slowDealloc();
    }

    uint64_t v7 = (char *)(v1 + OBJC_IVAR___AXLTSettingsManager_isPaused);
    swift_beginAccess();
    if (*v7 != (a1 & 1))
    {
      char *v7 = a1 & 1;
      if (qword_10006AE28 != -1) {
        swift_once();
      }
      if (qword_10006AE20 != -1) {
        swift_once();
      }
      id v8 = (unsigned char *)(static AXLTSettingsManager.shared + OBJC_IVAR___AXLTSettingsManager_isPaused);
      swift_beginAccess();
      if (*v8 == 1) {
        AXLTCaptionsProvider.stopTranscribing()();
      }
      else {
        AXLTCaptionsProvider.startTranscribing()();
      }
      sub_100035A78(0, 0);
    }
    id v9 = [self defaultCenter];
    if (qword_10006ADC8 != -1) {
      swift_once();
    }
    NSNotificationName v10 = pausedChangedNotification;
    sub_100006380(&qword_10006BF10);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_100054300;
    notificationValueKey.getter();
    AnyHashable.init<A>(_:)();
    char v12 = *v7;
    *(void *)(inited + 96) = &type metadata for Bool;
    *(unsigned char *)(inited + 72) = v12;
    sub_10002E33C(inited);
    Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    [v9 postNotificationName:v10 object:0 userInfo:isa];
  }
  else
  {
    __break(1u);
  }
}

void sub_10003032C(char a1)
{
  os_log_type_t v3 = static os_log_type_t.debug.getter();
  uint64_t v4 = (id)AXLogLiveTranscription();
  if (!v4)
  {
    __break(1u);
    return;
  }
  uint64_t v5 = v4;
  if (os_log_type_enabled(v4, v3))
  {
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v6 = 67109120;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v5, v3, "updateInCallState: %{BOOL}d", v6, 8u);
    swift_slowDealloc();
  }

  uint64_t v7 = (unsigned char *)(v1 + OBJC_IVAR___AXLTSettingsManager_inCallOn);
  swift_beginAccess();
  if (*v7 != (a1 & 1))
  {
    unsigned char *v7 = a1 & 1;
    if (qword_10006AE28 != -1) {
      swift_once();
    }
    uint64_t v8 = static AXLTCaptionsProvider.shared;
    if (qword_10006AE20 != -1) {
      swift_once();
    }
    id v9 = (unsigned char *)(static AXLTSettingsManager.shared + OBJC_IVAR___AXLTSettingsManager_inCallOn);
    swift_beginAccess();
    if (*v9 == 1)
    {
      id v10 = [self sharedInstance];
      unsigned __int8 v11 = [v10 isCallActive];

      if ((v11 & 1) == 0) {
        return;
      }
    }
    else if (*(void *)(v8 + OBJC_IVAR___AXLTCaptionsProvider_activePid) != -2)
    {
      return;
    }
    AXLTCaptionsProvider.stopTranscribing()();
    AXLTCaptionsProvider.startTranscribing()();
  }
}

void sub_100030538()
{
  uint64_t v1 = (void *)_AXSLiveCaptionsNubbitIdleOpacity();
  uint64_t v2 = v1;
  if (v1)
  {
    [v1 floatValue];
    double v4 = v3;
    uint64_t v5 = (double *)(v0 + OBJC_IVAR___AXLTSettingsManager_nubbitIdleOpacity);
    swift_beginAccess();
    *uint64_t v5 = v4;
  }
  id v6 = [self defaultCenter];
  if (qword_10006ADE8 != -1) {
    swift_once();
  }
  NSNotificationName v7 = nubbitIdleOpacityChangedNotification;
  sub_100006380(&qword_10006BF10);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_100054300;
  notificationValueKey.getter();
  AnyHashable.init<A>(_:)();
  id v9 = (uint64_t *)(v0 + OBJC_IVAR___AXLTSettingsManager_nubbitIdleOpacity);
  swift_beginAccess();
  uint64_t v10 = *v9;
  *(void *)(inited + 96) = &type metadata for CGFloat;
  *(void *)(inited + 72) = v10;
  sub_10002E33C(inited);
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  [v6 postNotificationName:v7 object:0 userInfo:isa];
}

void sub_100030740(void *a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
}

void sub_100030758(void *a1, uint64_t a2, void *a3, uint64_t a4, void *a5, void (*a6)(void))
{
  uint64_t v9 = qword_10006AE20;
  id v10 = a1;
  id v11 = a3;
  id v12 = a5;
  if (v9 != -1) {
    swift_once();
  }
  a6();
}

void sub_10003080C(void *a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
}

void sub_100030830()
{
  uint64_t v1 = v0;
  uint64_t v2 = _AXSLiveTranscriptionCopyTextColorData();
  if (!v2) {
    goto LABEL_3;
  }
  float v3 = (void *)v2;
  sub_1000204F0(0, &qword_10006BF18);
  sub_1000204F0(0, (unint64_t *)&qword_10006BEA0);
  id v4 = v3;
  uint64_t v5 = Data.init(referencing:)();
  unint64_t v7 = v6;
  int v18 = (void *)static NSKeyedUnarchiver.unarchivedObject<A>(ofClass:from:)();

  sub_100031400(v5, v7);
  if (v18)
  {
    id v10 = v18;
    uint64_t v19 = Color.init(_:)();
    long long v20 = (uint64_t *)(v1 + OBJC_IVAR___AXLTSettingsManager_textColor);
    swift_beginAccess();
    uint64_t *v20 = v19;
  }
  else
  {
LABEL_3:
    if (qword_10006ADF0 != -1) {
      swift_once();
    }
    uint64_t v8 = qword_10006BE38;
    uint64_t v9 = (uint64_t *)(v1 + OBJC_IVAR___AXLTSettingsManager_textColor);
    swift_beginAccess();
    *uint64_t v9 = v8;
    swift_retain();
    id v10 = 0;
  }
  swift_release();
  id v11 = [self defaultCenter];
  if (qword_10006ADD0 != -1) {
    swift_once();
  }
  NSNotificationName v12 = textColorChangedNotification;
  sub_100006380(&qword_10006BF10);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_100054300;
  notificationValueKey.getter();
  AnyHashable.init<A>(_:)();
  uint64_t v14 = (uint64_t *)(v1 + OBJC_IVAR___AXLTSettingsManager_textColor);
  swift_beginAccess();
  uint64_t v15 = *v14;
  *(void *)(inited + 96) = &type metadata for Color;
  *(void *)(inited + 72) = v15;
  swift_retain();
  sub_10002E33C(inited);
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  [v11 postNotificationName:v12 object:0 userInfo:isa];

  swift_beginAccess();
  Strong = (void *)swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    [Strong textColorDidChange];
    swift_unknownObjectRelease();
  }
}

void sub_100030BF4()
{
  uint64_t v1 = v0;
  uint64_t v2 = _AXSLiveTranscriptionCopyBackgroundColorData();
  if (!v2) {
    goto LABEL_3;
  }
  float v3 = (void *)v2;
  sub_1000204F0(0, &qword_10006BF18);
  sub_1000204F0(0, (unint64_t *)&qword_10006BEA0);
  id v4 = v3;
  uint64_t v5 = Data.init(referencing:)();
  unint64_t v7 = v6;
  int v18 = (void *)static NSKeyedUnarchiver.unarchivedObject<A>(ofClass:from:)();

  sub_100031400(v5, v7);
  if (v18)
  {
    id v10 = v18;
    uint64_t v19 = Color.init(_:)();
    long long v20 = (uint64_t *)(v1 + OBJC_IVAR___AXLTSettingsManager_backgroundColor);
    swift_beginAccess();
    uint64_t *v20 = v19;
  }
  else
  {
LABEL_3:
    if (qword_10006ADF8 != -1) {
      swift_once();
    }
    uint64_t v8 = qword_10006BE40;
    uint64_t v9 = (uint64_t *)(v1 + OBJC_IVAR___AXLTSettingsManager_backgroundColor);
    swift_beginAccess();
    *uint64_t v9 = v8;
    swift_retain();
    id v10 = 0;
  }
  swift_release();
  id v11 = [self defaultCenter];
  if (qword_10006ADD8 != -1) {
    swift_once();
  }
  NSNotificationName v12 = backgroundColorChangedNotification;
  sub_100006380(&qword_10006BF10);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_100054300;
  notificationValueKey.getter();
  AnyHashable.init<A>(_:)();
  uint64_t v14 = (uint64_t *)(v1 + OBJC_IVAR___AXLTSettingsManager_backgroundColor);
  swift_beginAccess();
  uint64_t v15 = *v14;
  *(void *)(inited + 96) = &type metadata for Color;
  *(void *)(inited + 72) = v15;
  swift_retain();
  sub_10002E33C(inited);
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  [v11 postNotificationName:v12 object:0 userInfo:isa];

  swift_beginAccess();
  Strong = (void *)swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    [Strong backgroundColorDidChange];
    swift_unknownObjectRelease();
  }
}

uint64_t sub_100030FC4(void *a1, uint64_t a2, SEL *a3)
{
  swift_beginAccess();
  uint64_t result = swift_unknownObjectWeakLoadStrong();
  if (result)
  {
    unint64_t v6 = (void *)result;
    id v7 = a1;
    [v6 *a3];

    return swift_unknownObjectRelease();
  }
  return result;
}

id AXLTSettingsManager.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AXLTSettingsManager();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for AXLTSettingsManager()
{
  return self;
}

uint64_t sub_10003111C@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for AXLTSettingsManager();
  uint64_t result = ObservableObject<>.objectWillChange.getter();
  *a1 = result;
  return result;
}

UIFont_optional __swiftcall AXLTSettingsManager.fontObjc()()
{
  uint64_t v0 = self;
  if (qword_10006AE18 != -1) {
    swift_once();
  }
  id v1 = [v0 preferredFontForTextStyle:textFontStyle];

  objc_super v2 = (objc_class *)v1;
  result.value.super.Class isa = v2;
  result.is_nil = v3;
  return result;
}

UIColor_optional __swiftcall AXLTSettingsManager.textColorObjc()()
{
  uint64_t v0 = (objc_class *)sub_1000312B0();
  result.value.super.Class isa = v0;
  result.is_nil = v1;
  return result;
}

UIColor_optional __swiftcall AXLTSettingsManager.backgroundColorObjc()()
{
  uint64_t v0 = (objc_class *)sub_1000312B0();
  result.value.super.Class isa = v0;
  result.is_nil = v1;
  return result;
}

uint64_t sub_1000312B0()
{
  return UIColor.init(_:)();
}

id sub_100031334()
{
  sub_1000204F0(0, (unint64_t *)&qword_10006BEA0);
  swift_beginAccess();
  swift_retain();
  uint64_t v0 = (void *)UIColor.init(_:)();

  return v0;
}

Swift::Bool __swiftcall AXLTSettingsManager.transcriptionEnabledObjc()()
{
  return _AXSLiveTranscriptionEnabled() != 0;
}

uint64_t sub_100031400(uint64_t a1, unint64_t a2)
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

uint64_t sub_100031458(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100006380(&qword_10006BF28);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

_OWORD *sub_1000314C0(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_1000314D0(uint64_t a1)
{
  return a1;
}

uint64_t sub_1000314F8(uint64_t a1)
{
  uint64_t v2 = sub_100006380(&qword_10006BF38);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t *AXLTCaptionsProvider.shared.unsafeMutableAddressor()
{
  if (qword_10006AE28 != -1) {
    swift_once();
  }
  return &static AXLTCaptionsProvider.shared;
}

uint64_t sub_1000315AC(uint64_t a1)
{
  Swift::Bool v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

uint64_t property wrapper backing initializer of AXLTCaptionsProvider.captions()
{
  return Published.init(initialValue:)();
}

uint64_t AXLTCaptionsProvider.captions.getter()
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  return v1;
}

uint64_t AXLTCaptionsProvider.captions.setter()
{
  swift_getKeyPath();
  swift_getKeyPath();
  id v1 = v0;
  return static Published.subscript.setter();
}

uint64_t (*AXLTCaptionsProvider.captions.modify(void *a1))()
{
  uint64_t v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = static Published.subscript.modify();
  return sub_1000317A4;
}

uint64_t AXLTCaptionsProvider.$captions.getter()
{
  return sub_100031B04((uint64_t)&OBJC_IVAR___AXLTCaptionsProvider__captions, &qword_10006BF50);
}

uint64_t AXLTCaptionsProvider.$captions.setter(uint64_t a1)
{
  return sub_100031B88(a1, &qword_10006BF58, (uint64_t)&OBJC_IVAR___AXLTCaptionsProvider__captions, &qword_10006BF50);
}

uint64_t (*AXLTCaptionsProvider.$captions.modify(void *a1))()
{
  Swift::Bool v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = sub_100006380(&qword_10006BF58);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  id v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR___AXLTCaptionsProvider__captions;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = sub_100006380(&qword_10006BF50);
  Published.projectedValue.getter();
  swift_endAccess();
  return sub_1000318E8;
}

uint64_t property wrapper backing initializer of AudioHistogramConfig.randomPower()
{
  return Published.init(initialValue:)();
}

uint64_t AXLTCaptionsProvider.audioHistogramSize.getter()
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  return v1;
}

uint64_t AXLTCaptionsProvider.audioHistogramSize.setter()
{
  swift_getKeyPath();
  swift_getKeyPath();
  id v1 = v0;
  return static Published.subscript.setter();
}

uint64_t (*AXLTCaptionsProvider.audioHistogramSize.modify(void *a1))()
{
  uint64_t v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = static Published.subscript.modify();
  return sub_1000317A4;
}

void sub_100031A88(void *a1)
{
  id v1 = (void *)*a1;
  (*(void (**)(void, void))(*a1 + 48))(*a1, 0);
  swift_release();
  swift_release();

  free(v1);
}

uint64_t AXLTCaptionsProvider.$audioHistogramSize.getter()
{
  return sub_100031B04((uint64_t)&OBJC_IVAR___AXLTCaptionsProvider__audioHistogramSize, &qword_10006BF68);
}

uint64_t sub_100031B04(uint64_t a1, uint64_t *a2)
{
  return swift_endAccess();
}

uint64_t AXLTCaptionsProvider.$audioHistogramSize.setter(uint64_t a1)
{
  return sub_100031B88(a1, &qword_10006BF70, (uint64_t)&OBJC_IVAR___AXLTCaptionsProvider__audioHistogramSize, &qword_10006BF68);
}

uint64_t sub_100031B88(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v6 = sub_100006380(a2);
  uint64_t v7 = *(void *)(v6 - 8);
  double v8 = __chkstk_darwin(v6);
  (*(void (**)(char *, uint64_t, uint64_t, double))(v7 + 16))((char *)&v11 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v6, v8);
  swift_beginAccess();
  sub_100006380(a4);
  Published.projectedValue.setter();
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
}

uint64_t (*AXLTCaptionsProvider.$audioHistogramSize.modify(void *a1))()
{
  Swift::Bool v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = sub_100006380(&qword_10006BF70);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  uint64_t v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR___AXLTCaptionsProvider__audioHistogramSize;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = sub_100006380(&qword_10006BF68);
  Published.projectedValue.getter();
  swift_endAccess();
  return sub_1000318E8;
}

void sub_100031DC8(uint64_t a1, char a2)
{
  Swift::Bool v3 = *(void **)a1;
  uint64_t v4 = *(void (**)(void, void, void))(*(void *)(*(void *)a1 + 88) + 16);
  v4(*(void *)(*(void *)a1 + 104), v3[14], v3[10]);
  uint64_t v5 = (void *)v3[14];
  size_t v6 = (void *)v3[12];
  uint64_t v7 = (void *)v3[13];
  uint64_t v8 = v3[10];
  uint64_t v9 = v3[11];
  if (a2)
  {
    v4(v3[12], v3[13], v3[10]);
    swift_beginAccess();
    Published.projectedValue.setter();
    swift_endAccess();
    id v10 = *(void (**)(void *, uint64_t))(v9 + 8);
    v10(v7, v8);
    v10(v5, v8);
  }
  else
  {
    swift_beginAccess();
    Published.projectedValue.setter();
    swift_endAccess();
    (*(void (**)(void *, uint64_t))(v9 + 8))(v5, v8);
  }
  free(v5);
  free(v7);
  free(v6);

  free(v3);
}

uint64_t AXLTCaptionsProvider.audioHistogram.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t AXLTCaptionsProvider.audioHistogram.setter(uint64_t a1)
{
  Swift::Bool v3 = (void *)(v1 + OBJC_IVAR___AXLTCaptionsProvider_audioHistogram);
  swift_beginAccess();
  *Swift::Bool v3 = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*AXLTCaptionsProvider.audioHistogram.modify())()
{
  return j__swift_endAccess;
}

uint64_t AXLTCaptionsProvider.isTranscribing.getter()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR___AXLTCaptionsProvider_isTranscribing);
  swift_beginAccess();
  return *v1;
}

uint64_t AXLTCaptionsProvider.isTranscribing.setter(char a1)
{
  Swift::Bool v3 = (unsigned char *)(v1 + OBJC_IVAR___AXLTCaptionsProvider_isTranscribing);
  uint64_t result = swift_beginAccess();
  *Swift::Bool v3 = a1;
  return result;
}

uint64_t (*AXLTCaptionsProvider.isTranscribing.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t AXLTCaptionsProvider.activeRequestType.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR___AXLTCaptionsProvider_activeRequestType;
  swift_beginAccess();
  return *(void *)v1;
}

uint64_t AXLTCaptionsProvider.activeRequestType.setter(uint64_t a1)
{
  Swift::Bool v3 = (void *)(v1 + OBJC_IVAR___AXLTCaptionsProvider_activeRequestType);
  uint64_t result = swift_beginAccess();
  *Swift::Bool v3 = a1;
  return result;
}

uint64_t (*AXLTCaptionsProvider.activeRequestType.modify())()
{
  return j_j__swift_endAccess;
}

id sub_100032214()
{
  id result = [objc_allocWithZone((Class)type metadata accessor for AXLTCaptionsProvider()) init];
  static AXLTCaptionsProvider.shared = (uint64_t)result;
  return result;
}

id static AXLTCaptionsProvider.shared.getter()
{
  if (qword_10006AE28 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)static AXLTCaptionsProvider.shared;

  return v0;
}

Swift::Void __swiftcall AXLTCaptionsProvider.startTranscribing()()
{
  if (qword_10006AE20 != -1) {
    swift_once();
  }
  uint64_t v1 = static AXLTSettingsManager.shared;
  uint64_t v2 = (unsigned char *)(static AXLTSettingsManager.shared + OBJC_IVAR___AXLTSettingsManager_isPaused);
  swift_beginAccess();
  if ((*v2 & 1) == 0)
  {
    Swift::Bool v3 = (unsigned char *)(v1 + OBJC_IVAR___AXLTSettingsManager_inCallOn);
    swift_beginAccess();
    if (*v3 == 1
      && (id v4 = [self sharedInstance],
          unsigned int v5 = [v4 isCallActive],
          v4,
          v5))
    {
      size_t v6 = (void *)(v0 + OBJC_IVAR___AXLTCaptionsProvider_activeRequestType);
      BOOL v7 = 1;
      swift_beginAccess();
      void *v6 = 1;
      uint64_t v8 = -2;
    }
    else
    {
      uint64_t v9 = (unsigned char *)(static AXLTSettingsManager.shared + OBJC_IVAR___AXLTSettingsManager_isMicOn);
      swift_beginAccess();
      BOOL v7 = (*v9 & 1) == 0;
      id v10 = (BOOL *)(v0 + OBJC_IVAR___AXLTCaptionsProvider_activeRequestType);
      swift_beginAccess();
      *id v10 = v7;
      uint64_t v8 = -1;
    }
    *(void *)(v0 + OBJC_IVAR___AXLTCaptionsProvider_activePid) = v8;
    AXLTCaptionsProvider.startTranscribing(_:_:)(v7, (void **)v8);
  }
}

void AXLTCaptionsProvider.startTranscribing(_:_:)(uint64_t a1, void **a2)
{
  os_log_type_t v5 = static os_log_type_t.default.getter();
  size_t v6 = (id)AXLogLiveTranscription();
  if (!v6) {
LABEL_17:
  }
    __break(1u);
  BOOL v7 = v6;
  if (os_log_type_enabled(v6, v5))
  {
    uint64_t v8 = swift_slowAlloc();
    *(_DWORD *)uint64_t v8 = 134218240;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v8 + 12) = 2048;
    long long aBlock = a2;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v7, v5, "startTranscribing for type = %ld, pid = %ld", (uint8_t *)v8, 0x16u);
    swift_slowDealloc();
  }

  uint64_t v9 = &v2[OBJC_IVAR___AXLTCaptionsProvider_activeRequestType];
  swift_beginAccess();
  *(void *)uint64_t v9 = a1;
  uint64_t v10 = OBJC_IVAR___AXLTCaptionsProvider_activePid;
  *(void *)&v2[OBJC_IVAR___AXLTCaptionsProvider_activePid] = a2;
  sub_1000384A4();
  uint64_t v11 = *(void *)&v2[v10];
  if (v11 < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
    goto LABEL_16;
  }
  if (v11 > 0x7FFFFFFF)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  NSNotificationName v12 = *(void **)&v2[OBJC_IVAR___AXLTCaptionsProvider_transcription];
  uint64_t v13 = *(void *)v9;
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = v2;
  uint64_t v39 = sub_100038604;
  uint64_t v40 = v14;
  long long aBlock = _NSConcreteStackBlock;
  uint64_t v36 = 1107296256;
  uint64_t v37 = sub_1000315A8;
  unint64_t v38 = &unk_100066EC8;
  uint64_t v15 = _Block_copy(&aBlock);
  uint64_t v16 = v2;
  swift_release();
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = v16;
  uint64_t v39 = sub_100038624;
  uint64_t v40 = v17;
  long long aBlock = _NSConcreteStackBlock;
  uint64_t v36 = 1107296256;
  uint64_t v37 = sub_1000315A8;
  unint64_t v38 = &unk_100066F18;
  int v18 = _Block_copy(&aBlock);
  uint64_t v19 = v16;
  swift_release();
  long long aBlock = 0;
  unsigned int v20 = [v12 startTranscribing:v13 targetPID:v11 callbackBlock:v15 audioInfoBlock:v18 error:&aBlock];
  _Block_release(v18);
  _Block_release(v15);
  CGRect v21 = aBlock;
  if (v20)
  {
    CGRect v22 = &v19[OBJC_IVAR___AXLTCaptionsProvider_isTranscribing];
    swift_beginAccess();
    *CGRect v22 = 1;
    if (!*(void *)v9)
    {
      uint64_t v23 = OBJC_IVAR___AXLTCaptionsProvider_audioSessionSubscribed;
      if ((v19[OBJC_IVAR___AXLTCaptionsProvider_audioSessionSubscribed] & 1) == 0)
      {
        id v24 = [self defaultCenter];
        id v25 = [self sharedInstance];
        [v24 addObserver:v19 selector:"handleAudioSessionInterruptionWithNotification:" name:AVAudioSessionInterruptionNotification object:v25];

        v19[v23] = 1;
      }
      uint64_t v26 = OBJC_IVAR___AXLTCaptionsProvider_audioSessionResetSubscribed;
      if ((v19[OBJC_IVAR___AXLTCaptionsProvider_audioSessionResetSubscribed] & 1) == 0)
      {
        id v27 = [self defaultCenter];
        id v28 = [self sharedInstance];
        [v27 addObserver:v19 selector:"handleAudioSessionResetWithNotification:" name:AVAudioSessionMediaServicesWereResetNotification object:v28];

        v19[v26] = 1;
      }
    }
    id v29 = [objc_allocWithZone((Class)NSNumber) initWithInt:1057];
    UIAccessibilityNotifications v30 = [v29 unsignedIntValue];

    id v31 = [self sharedApplication];
    UIAccessibilityPostNotification(v30, v31);
  }
  else
  {
    uint64_t v32 = v21;
    _convertNSErrorToError(_:)();

    swift_willThrow();
    static os_log_type_t.error.getter();
    id v33 = (id)AXLogLiveTranscription();
    if (v33)
    {
      uint64_t v34 = v33;
      os_log(_:dso:log:_:_:)();

      swift_errorRelease();
    }
    else
    {
      __break(1u);
    }
  }
}

uint64_t sub_100032A40(void *a1, Class a2)
{
  uint64_t v132 = a1;
  uint64_t v3 = sub_100006380(&qword_10006BDF0);
  uint64_t v4 = __chkstk_darwin(v3 - 8);
  size_t v6 = (char *)&v113 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v113 - v7;
  uint64_t v9 = type metadata accessor for AXLTCaptionActionsType();
  uint64_t v125 = *(void *)(v9 - 8);
  uint64_t v126 = v9;
  __chkstk_darwin(v9);
  uint64_t v124 = (char *)&v113 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for Date();
  uint64_t v122 = *(void *)(v11 - 8);
  uint64_t v123 = v11;
  __chkstk_darwin(v11);
  long long v121 = (char *)&v113 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = type metadata accessor for AXLTCaption();
  uint64_t v128 = *(void *)(v13 - 8);
  uint64_t v14 = __chkstk_darwin(v13);
  uint64_t v16 = (objc_class *)((char *)&v113 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v17 = __chkstk_darwin(v14);
  uint64_t v19 = (char **)((char *)&v113 - v18);
  uint64_t v20 = __chkstk_darwin(v17);
  uint64_t v127 = (char *)&v113 - v21;
  uint64_t v22 = __chkstk_darwin(v20);
  uint64_t v131 = (char *)&v113 - v23;
  uint64_t v24 = __chkstk_darwin(v22);
  uint64_t v118 = (uint64_t)&v113 - v25;
  __chkstk_darwin(v24);
  long long v119 = (char *)&v113 - v26;
  os_log_type_t v27 = static os_log_type_t.debug.getter();
  uint64_t result = (uint64_t)(id)AXLogLiveTranscription();
  if (!result) {
    goto LABEL_55;
  }
  id v29 = result;
  unint64_t v30 = v27;
  BOOL v31 = os_log_type_enabled((os_log_t)result, v27);
  Class v129 = a2;
  uint64_t v130 = v13;
  long long v120 = v8;
  uint64_t v115 = v19;
  uint64_t v114 = v16;
  uint64_t v116 = v6;
  if (v31)
  {
    a2 = v132;
    uint64_t v32 = (uint8_t *)swift_slowAlloc();
    v133[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v32 = 136315138;
    id v33 = [(objc_class *)a2 transcribedText];
    uint64_t v34 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v36 = v35;

    Class v37 = v129;
    v133[4] = sub_10000E634(v34, v36, v133);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();

    _os_log_impl((void *)&_mh_execute_header, v29, v27, "Transcribed data = %s", v32, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    Class v37 = a2;
  }
  uint64_t v38 = OBJC_IVAR___AXLTCaptionsProvider_placeholderTimer;
  uint64_t v39 = *(void **)((char *)v37 + OBJC_IVAR___AXLTCaptionsProvider_placeholderTimer);
  uint64_t v40 = &off_100069000;
  if (!v39)
  {
    id v29 = static os_log_type_t.debug.getter();
    uint64_t result = (uint64_t)(id)AXLogLiveTranscription();
    if (!result)
    {
LABEL_57:
      __break(1u);
LABEL_58:
      __break(1u);
      goto LABEL_59;
    }
    id v41 = (void *)result;
    os_log(_:dso:log:_:_:)();

    uint64_t v39 = *(void **)((char *)v37 + v38);
  }
  [v39 invalidate];
  uint64_t v42 = self;
  placeholderTimeInterval.getter();
  id v43 = objc_msgSend(v42, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", v37, "addPlaceholder", 0, 0);
  uint64_t v44 = *(void **)((char *)v37 + v38);
  *(void *)((char *)v37 + v38) = v43;

  id v45 = [v132 transcribedText];
  static String._unconditionallyBridgeFromObjectiveC(_:)();

  uint64_t v46 = String.count.getter();
  swift_bridgeObjectRelease();
  if (!v46)
  {
    *((unsigned char *)v37 + OBJC_IVAR___AXLTCaptionsProvider_newCaption) = 1;
    static os_log_type_t.debug.getter();
    uint64_t result = (uint64_t)(id)AXLogLiveTranscription();
    if (result)
    {
      uint64_t v59 = (void *)result;
      os_log(_:dso:log:_:_:)();

      return (uint64_t)sub_1000350A0(v132);
    }
    goto LABEL_58;
  }
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  uint64_t v47 = *(void *)(v133[0] + 16);
  swift_bridgeObjectRelease();
  if (!v47) {
    goto LABEL_19;
  }
  swift_getKeyPath();
  uint64_t KeyPath = (void (*)(uint64_t *, void))swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  unint64_t v49 = *(void *)(v133[0] + 16);
  swift_bridgeObjectRelease();
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  if (!v49)
  {
    __break(1u);
    goto LABEL_45;
  }
  uint64_t KeyPath = (void (*)(uint64_t *, void))v133[0];
  if (v49 > *(void *)(v133[0] + 16))
  {
LABEL_45:
    __break(1u);
    goto LABEL_46;
  }
  unint64_t v50 = v49 - 1;
  uint64_t v51 = v128;
  uint64_t v52 = v119;
  uint64_t v53 = v130;
  (*(void (**)(char *, unint64_t, uint64_t))(v128 + 16))(v119, v133[0]+ ((*(unsigned __int8 *)(v51 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v51 + 80))+ *(void *)(v128 + 72) * v50, v130);
  swift_bridgeObjectRelease();
  uint64_t v54 = AXLTCaption.appID.getter();
  uint64_t v56 = v55;
  uint64_t v57 = *(void (**)(char *, uint64_t))(v51 + 8);
  v57(v52, v53);
  if (v54 == placeholderID.getter() && v56 == v58)
  {
    swift_bridgeObjectRelease_n();
LABEL_18:
    swift_getKeyPath();
    swift_getKeyPath();
    static Published.subscript.getter();
    swift_release();
    swift_release();
    uint64_t v61 = *(void *)(v133[0] + 16);
    swift_bridgeObjectRelease();
    swift_getKeyPath();
    swift_getKeyPath();
    uint64_t v62 = (void (*)(uint64_t *, void))static Published.subscript.modify();
    uint64_t v63 = v118;
    sub_100033C60(v61 - 1, v118);
    v57((char *)v63, v130);
    v62(v133, 0);
    swift_release();
    swift_release();
    goto LABEL_19;
  }
  char v60 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v60) {
    goto LABEL_18;
  }
LABEL_19:
  uint64_t v64 = OBJC_IVAR___AXLTCaptionsProvider_captionsID;
  long long v119 = *(char **)((char *)v37 + OBJC_IVAR___AXLTCaptionsProvider_captionsID);
  uint64_t v65 = v132;
  id v66 = [v132 appID];
  uint64_t v118 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v117 = v67;

  id v68 = [v65 appName];
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v70 = v69;

  uint64_t v71 = self;
  id v72 = [v65 timestamp];
  uint64_t v73 = v121;
  static Date._unconditionallyBridgeFromObjectiveC(_:)();

  Class isa = Date._bridgeToObjectiveC()().super.isa;
  (*(void (**)(char *, uint64_t))(v122 + 8))(v73, v123);
  id v75 = [v71 dateToString:isa];

  static String._unconditionallyBridgeFromObjectiveC(_:)();
  id v76 = [v65 transcribedText];
  uint64_t v77 = (void (*)(uint64_t *, void))static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v79 = v78;

  id v80 = [v65 transcription];
  id v81 = [v80 segments];

  sub_1000204F0(0, &qword_10006C178);
  static Array._unconditionallyBridgeFromObjectiveC(_:)();

  Class v37 = v129;
  uint64_t v82 = v124;
  (*(void (**)(char *, void, uint64_t))(v125 + 104))(v124, enum case for AXLTCaptionActionsType.AXLTCaptionActionsNone(_:), v126);
  AXLTCaption.init(id:appID:appName:time:text:segments:placeholder:actionType:)();
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  uint64_t v83 = *(void *)(v133[0] + 16);
  swift_bridgeObjectRelease();
  if (!v83 || *((unsigned char *)v37 + OBJC_IVAR___AXLTCaptionsProvider_newCaption) == 1)
  {
    uint64_t v84 = *(void *)((char *)v37 + v64);
    BOOL v85 = __OFADD__(v84, 1);
    uint64_t v86 = v84 + 1;
    uint64_t v87 = v130;
    if (v85)
    {
      __break(1u);
    }
    else
    {
      *(void *)((char *)v37 + v64) = v86;
      uint64_t v82 = *(char **)(v128 + 16);
      ((void (*)(char *, char *, uint64_t))v82)(v127, v131, v87);
      swift_getKeyPath();
      swift_getKeyPath();
      uint64_t v77 = (void (*)(uint64_t *, void))static Published.subscript.modify();
      uint64_t v70 = v88;
      unint64_t v79 = *v88;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      *uint64_t v70 = v79;
      if (isUniquelyReferenced_nonNull_native) {
        goto LABEL_23;
      }
    }
    unint64_t v79 = sub_10003B3A8(0, *(void *)(v79 + 16) + 1, 1, v79);
    *uint64_t v70 = v79;
LABEL_23:
    unint64_t v91 = *(void *)(v79 + 16);
    unint64_t v90 = *(void *)(v79 + 24);
    if (v91 >= v90 >> 1)
    {
      unint64_t v79 = sub_10003B3A8(v90 > 1, v91 + 1, 1, v79);
      *uint64_t v70 = v79;
    }
    *(void *)(v79 + 16) = v91 + 1;
    uint64_t v92 = v128;
    unint64_t v93 = v79
        + ((*(unsigned __int8 *)(v92 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v92 + 80))
        + *(void *)(v92 + 72) * v91;
    uint64_t v94 = v130;
    (*(void (**)(unint64_t, char *, uint64_t))(v128 + 32))(v93, v127, v130);
    v77(v133, 0);
    swift_release();
    swift_release();
    Class v37 = v129;
    *((unsigned char *)v129 + OBJC_IVAR___AXLTCaptionsProvider_newCaption) = 0;
    uint64_t v95 = (uint64_t)v120;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v92 + 56))(v120, 1, 1, v94);
    uint64_t v96 = (uint64_t)v37 + OBJC_IVAR___AXLTCaptionsProvider_lastFinalCaption;
    swift_beginAccess();
    sub_10003B610(v95, v96);
    swift_endAccess();
    static os_log_type_t.debug.getter();
    uint64_t result = (uint64_t)(id)AXLogLiveTranscription();
    if (result)
    {
      uint64_t v97 = (void *)result;
      os_log(_:dso:log:_:_:)();

      sub_1000369A8();
LABEL_41:
      uint64_t v111 = v131;
      ((void (*)(uint64_t, char *, uint64_t))v82)(v95, v131, v94);
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v92 + 56))(v95, 0, 1, v94);
      uint64_t v112 = (uint64_t)v37 + OBJC_IVAR___AXLTCaptionsProvider_currentCaption;
      swift_beginAccess();
      sub_10003B610(v95, v112);
      swift_endAccess();
      return (*(uint64_t (**)(char *, uint64_t))(v92 + 8))(v111, v94);
    }
    goto LABEL_56;
  }
  uint64_t v98 = (uint64_t)v37 + OBJC_IVAR___AXLTCaptionsProvider_lastFinalCaption;
  swift_beginAccess();
  uint64_t v99 = (uint64_t)v116;
  sub_10003B6C4(v98, (uint64_t)v116);
  uint64_t v100 = v128;
  uint64_t v101 = v130;
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v128 + 48))(v99, 1, v130) == 1)
  {
    sub_1000067B8(v99, &qword_10006BDF0);
    swift_getKeyPath();
    swift_getKeyPath();
    static Published.subscript.getter();
    swift_release();
    swift_release();
    Class v37 = *(Class *)(v133[0] + 16);
    swift_bridgeObjectRelease();
    a2 = (Class)AXLTCaption.text.getter();
    unint64_t v49 = v102;
    swift_getKeyPath();
    uint64_t KeyPath = (void (*)(uint64_t *, void))swift_getKeyPath();
    id v29 = static Published.subscript.modify();
    uint64_t v40 = (char **)v103;
    unint64_t v30 = *v103;
    char v104 = swift_isUniquelyReferenced_nonNull_native();
    char *v40 = (char *)v30;
    if (v104)
    {
      if (v37) {
        goto LABEL_30;
      }
LABEL_47:
      __break(1u);
LABEL_48:
      unint64_t v49 = sub_10003B72C(v49);
      v29->Class isa = (Class)v49;
      if (!v30) {
        goto LABEL_49;
      }
      goto LABEL_37;
    }
LABEL_46:
    unint64_t v30 = sub_10003B72C(v30);
    char *v40 = (char *)v30;
    if (v37)
    {
LABEL_30:
      if ((unint64_t)v37 <= *(void *)(v30 + 16))
      {
        uint64_t v132 = (void *)((*(unsigned __int8 *)(v128 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v128 + 80));
        AXLTCaption.text.setter();
        ((void (*)(uint64_t *, void))v29)(v133, 0);
        swift_release();
        swift_release();
        swift_getKeyPath();
        swift_getKeyPath();
        static Published.subscript.getter();
        swift_release();
        swift_release();
        a2 = *(Class *)(v133[0] + 16);
        swift_bridgeObjectRelease();
        AXLTCaption.segments.getter();
        swift_getKeyPath();
        swift_getKeyPath();
        unint64_t v49 = static Published.subscript.modify();
        unint64_t v30 = (unint64_t)v105;
        id v29 = *v105;
        uint64_t result = swift_isUniquelyReferenced_nonNull_native();
        *(void *)unint64_t v30 = v29;
        if (result)
        {
          uint64_t v92 = v128;
          if (a2) {
            goto LABEL_33;
          }
          goto LABEL_53;
        }
LABEL_52:
        uint64_t result = sub_10003B72C((unint64_t)v29);
        id v29 = result;
        *(void *)unint64_t v30 = result;
        uint64_t v92 = v128;
        if (a2)
        {
LABEL_33:
          if (a2 <= v29[2].isa)
          {
            AXLTCaption.segments.setter();
            ((void (*)(uint64_t *, void))v49)(v133, 0);
            swift_release();
            swift_release();
            Class v37 = v129;
            uint64_t v94 = v130;
            goto LABEL_39;
          }
          goto LABEL_54;
        }
LABEL_53:
        __break(1u);
LABEL_54:
        __break(1u);
LABEL_55:
        __break(1u);
LABEL_56:
        __break(1u);
        goto LABEL_57;
      }
      goto LABEL_50;
    }
    goto LABEL_47;
  }
  uint64_t v40 = v115;
  (*(void (**)(char **, uint64_t, uint64_t))(v100 + 32))(v115, v99, v101);
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  unint64_t v30 = *(void *)(v133[0] + 16);
  swift_bridgeObjectRelease();
  a2 = v114;
  mergeCaptions(_:_:)();
  swift_getKeyPath();
  swift_getKeyPath();
  uint64_t KeyPath = (void (*)(uint64_t *, void))static Published.subscript.modify();
  id v29 = v106;
  unint64_t v49 = *v106;
  char v107 = swift_isUniquelyReferenced_nonNull_native();
  v29->Class isa = (Class)v49;
  if ((v107 & 1) == 0) {
    goto LABEL_48;
  }
  if (!v30)
  {
LABEL_49:
    __break(1u);
LABEL_50:
    __break(1u);
    goto LABEL_51;
  }
LABEL_37:
  if (v30 > *(void *)(v49 + 16))
  {
LABEL_51:
    __break(1u);
    goto LABEL_52;
  }
  unint64_t v108 = v30 - 1;
  uint64_t v92 = v128;
  unint64_t v109 = v49
       + ((*(unsigned __int8 *)(v92 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v92 + 80))
       + *(void *)(v128 + 72) * v108;
  uint64_t v94 = v130;
  (*(void (**)(unint64_t, Class, uint64_t))(v128 + 40))(v109, a2, v130);
  KeyPath(v133, 0);
  swift_release();
  swift_release();
  (*(void (**)(char **, uint64_t))(v92 + 8))(v40, v94);
LABEL_39:
  static os_log_type_t.debug.getter();
  uint64_t result = (uint64_t)(id)AXLogLiveTranscription();
  uint64_t v95 = (uint64_t)v120;
  if (result)
  {
    uint64_t v110 = (void *)result;
    os_log(_:dso:log:_:_:)();

    uint64_t v82 = *(char **)(v92 + 16);
    goto LABEL_41;
  }
LABEL_59:
  __break(1u);
  return result;
}

uint64_t sub_100033C60@<X0>(unint64_t a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t v5 = *v2;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    unint64_t v5 = sub_10003B72C(v5);
  }
  unint64_t v6 = *(void *)(v5 + 16);
  if (v6 <= a1)
  {
    __break(1u);
    goto LABEL_15;
  }
  unint64_t v7 = v6 - 1;
  uint64_t v8 = type metadata accessor for AXLTCaption();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(void *)(v9 + 72);
  unint64_t v11 = v5 + ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80)) + v10 * a1;
  uint64_t result = (*(uint64_t (**)(uint64_t, unint64_t, uint64_t))(v9 + 32))(a2, v11, v8);
  if ((uint64_t)(v7 - a1) < 0)
  {
LABEL_15:
    uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
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
  *(void *)(v5 + 16) = v7;
  unint64_t *v2 = v5;
  return result;
}

void sub_100033DBC(void *a1, char *a2)
{
  uint64_t v4 = (char **)&a2[OBJC_IVAR___AXLTCaptionsProvider_audioHistogram];
  swift_beginAccess();
  *uint64_t v4 = (char *)&_swiftEmptyArrayStorage;
  swift_bridgeObjectRelease();
  id v5 = [a1 audioHistogram];
  sub_1000204F0(0, &qword_10006C170);
  unint64_t v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  os_log_type_t v27 = a2;
  if (v6 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (!v7) {
      goto LABEL_15;
    }
  }
  else
  {
    uint64_t v7 = *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v7) {
      goto LABEL_15;
    }
  }
  if (v7 < 1)
  {
    __break(1u);
    return;
  }
  uint64_t v8 = 0;
  do
  {
    if ((v6 & 0xC000000000000001) != 0) {
      id v9 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
    }
    else {
      id v9 = *(id *)(v6 + 8 * v8 + 32);
    }
    uint64_t v10 = v9;
    objc_msgSend(v9, "doubleValue", v27);
    uint64_t v12 = v11;
    swift_beginAccess();
    uint64_t v13 = *v4;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *uint64_t v4 = v13;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      uint64_t v13 = sub_10003B298(0, *((void *)v13 + 2) + 1, 1, v13);
      *uint64_t v4 = v13;
    }
    unint64_t v16 = *((void *)v13 + 2);
    unint64_t v15 = *((void *)v13 + 3);
    if (v16 >= v15 >> 1)
    {
      uint64_t v13 = sub_10003B298((char *)(v15 > 1), v16 + 1, 1, v13);
      *uint64_t v4 = v13;
    }
    ++v8;
    *((void *)v13 + 2) = v16 + 1;
    *(void *)&v13[8 * v16 + 32] = v12;
    swift_endAccess();
  }
  while (v7 != v8);
LABEL_15:
  swift_bridgeObjectRelease();
  swift_getKeyPath();
  swift_getKeyPath();
  uint64_t v17 = v27;
  static Published.subscript.getter();
  swift_release();
  swift_release();
  uint64_t v18 = *((void *)*v4 + 2);
  if (aBlock[0] != v18)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    aBlock[0] = v18;
    uint64_t v19 = v27;
    static Published.subscript.setter();
  }
  uint64_t v20 = OBJC_IVAR___AXLTCaptionsProvider_histogramTimer;
  objc_msgSend(*(id *)&v27[OBJC_IVAR___AXLTCaptionsProvider_histogramTimer], "invalidate", v27, aBlock[0]);
  uint64_t v21 = self;
  uint64_t v22 = swift_allocObject();
  *(void *)(v22 + 16) = v17;
  aBlock[4] = sub_10003C23C;
  aBlock[5] = v22;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1000315A8;
  aBlock[3] = &unk_100067030;
  uint64_t v23 = _Block_copy(aBlock);
  uint64_t v24 = v17;
  swift_release();
  id v25 = [v21 scheduledTimerWithTimeInterval:0 repeats:v23 block:0.5];
  _Block_release(v23);
  uint64_t v26 = *(void **)&v17[v20];
  *(void *)&v17[v20] = v25;
}

uint64_t sub_100034150(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = (unsigned char *)(a2 + OBJC_IVAR___AXLTCaptionsProvider_isTranscribing);
  uint64_t result = swift_beginAccess();
  if (*v2 == 1) {
    return sub_1000384A4();
  }
  return result;
}

void sub_1000341A8(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

Swift::Void __swiftcall AXLTCaptionsProvider.stopTranscribing()()
{
  uint64_t v1 = sub_100006380(&qword_10006BDF0);
  __chkstk_darwin(v1 - 8);
  uint64_t v3 = (char *)v39 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  os_log_type_t v4 = static os_log_type_t.debug.getter();
  id v5 = (id)AXLogLiveTranscription();
  if (!v5) {
LABEL_18:
  }
    __break(1u);
  unint64_t v6 = v5;
  if (os_log_type_enabled(v5, v4))
  {
    uint64_t v7 = v0;
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v8 = 134217984;
    id v9 = &v7[OBJC_IVAR___AXLTCaptionsProvider_activeRequestType];
    swift_beginAccess();
    uint64_t v41 = *(void *)v9;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    _os_log_impl((void *)&_mh_execute_header, v6, v4, "stopTranscribing for type = %ld", v8, 0xCu);
    swift_slowDealloc();
  }

  uint64_t v10 = OBJC_IVAR___AXLTCaptionsProvider_audioSessionResetSubscribed;
  if (v0[OBJC_IVAR___AXLTCaptionsProvider_audioSessionResetSubscribed] == 1)
  {
    id v11 = [self defaultCenter];
    id v12 = [self sharedInstance];
    [v11 removeObserver:v0 name:AVAudioSessionMediaServicesWereResetNotification object:v12];

    v0[v10] = 0;
  }
  uint64_t v13 = *(void **)&v0[OBJC_IVAR___AXLTCaptionsProvider_transcription];
  uint64_t v14 = &v0[OBJC_IVAR___AXLTCaptionsProvider_activeRequestType];
  swift_beginAccess();
  uint64_t v15 = *(void *)&v0[OBJC_IVAR___AXLTCaptionsProvider_activePid];
  if (v15 < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v15 > 0x7FFFFFFF)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  uint64_t v16 = *(void *)v14;
  id v40 = 0;
  unsigned int v17 = objc_msgSend(v13, "stopTranscribing:targetPID:error:", v16);
  id v18 = v40;
  if (v17)
  {
    uint64_t v19 = &v0[OBJC_IVAR___AXLTCaptionsProvider_isTranscribing];
    swift_beginAccess();
    *uint64_t v19 = 0;
    uint64_t v20 = type metadata accessor for AXLTCaption();
    uint64_t v21 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56);
    v21(v3, 1, 1, v20);
    uint64_t v22 = (uint64_t)&v0[OBJC_IVAR___AXLTCaptionsProvider_lastFinalCaption];
    swift_beginAccess();
    id v23 = v18;
    sub_10003B610((uint64_t)v3, v22);
    swift_endAccess();
    v21(v3, 1, 1, v20);
    uint64_t v24 = (uint64_t)&v0[OBJC_IVAR___AXLTCaptionsProvider_currentCaption];
    swift_beginAccess();
    sub_10003B610((uint64_t)v3, v24);
    swift_endAccess();
    v0[OBJC_IVAR___AXLTCaptionsProvider_newCaption] = 1;
    id v25 = &v0[OBJC_IVAR___AXLTCaptionsProvider_audioHistogram];
    swift_beginAccess();
    *(void *)id v25 = &_swiftEmptyArrayStorage;
    swift_bridgeObjectRelease();
    swift_getKeyPath();
    swift_getKeyPath();
    v39[1] = 0;
    uint64_t v26 = v0;
    static Published.subscript.setter();
    uint64_t v27 = OBJC_IVAR___AXLTCaptionsProvider_placeholderTimer;
    id v28 = *(void **)&v26[OBJC_IVAR___AXLTCaptionsProvider_placeholderTimer];
    if (v28)
    {
LABEL_12:
      [v28 invalidate];
      BOOL v31 = self;
      placeholderTimeInterval.getter();
      id v32 = objc_msgSend(v31, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", v26, "addPlaceholder", 0, 0);
      id v33 = *(void **)&v26[v27];
      *(void *)&v26[v27] = v32;

LABEL_15:
      id v37 = [objc_allocWithZone((Class)NSNumber) initWithInt:1057];
      UIAccessibilityNotifications v38 = [v37 unsignedIntValue];

      UIAccessibilityPostNotification(v38, 0);
      return;
    }
    static os_log_type_t.debug.getter();
    id v29 = (id)AXLogLiveTranscription();
    if (v29)
    {
      unint64_t v30 = v29;
      os_log(_:dso:log:_:_:)();

      id v28 = *(void **)&v26[v27];
      goto LABEL_12;
    }
  }
  else
  {
    id v34 = v40;
    _convertNSErrorToError(_:)();

    swift_willThrow();
    static os_log_type_t.error.getter();
    id v35 = (id)AXLogLiveTranscription();
    if (v35)
    {
      unint64_t v36 = v35;
      os_log(_:dso:log:_:_:)();

      swift_errorRelease();
      goto LABEL_15;
    }
    __break(1u);
  }
  __break(1u);
}

char *sub_10003483C()
{
  uint64_t v1 = sub_100006380(&qword_10006BF68);
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  os_log_type_t v4 = (char *)&v32 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100006380(&qword_10006BF50);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v32 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v9 = &v0[OBJC_IVAR___AXLTCaptionsProvider__captions];
  id v34 = &_swiftEmptyArrayStorage;
  uint64_t v10 = v0;
  sub_100006380(&qword_10006BF40);
  Published.init(initialValue:)();
  (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v9, v8, v5);
  id v11 = &v10[OBJC_IVAR___AXLTCaptionsProvider__audioHistogramSize];
  id v34 = 0;
  Published.init(initialValue:)();
  (*(void (**)(char *, char *, uint64_t))(v2 + 32))(v11, v4, v1);
  *(void *)&v10[OBJC_IVAR___AXLTCaptionsProvider_audioHistogram] = &_swiftEmptyArrayStorage;
  v10[OBJC_IVAR___AXLTCaptionsProvider_isTranscribing] = 0;
  if (qword_10006AE20 != -1) {
    swift_once();
  }
  id v12 = (unsigned char *)(static AXLTSettingsManager.shared + OBJC_IVAR___AXLTSettingsManager_isMicOn);
  swift_beginAccess();
  *(void *)&v10[OBJC_IVAR___AXLTCaptionsProvider_activeRequestType] = (*v12 & 1) == 0;
  *(void *)&v10[OBJC_IVAR___AXLTCaptionsProvider_activePid] = -1;
  uint64_t v13 = OBJC_IVAR___AXLTCaptionsProvider_transcription;
  *(void *)&v10[v13] = [objc_allocWithZone((Class)AXLTLiveTranscription) init];
  v10[OBJC_IVAR___AXLTCaptionsProvider_newCaption] = 1;
  uint64_t v14 = &v10[OBJC_IVAR___AXLTCaptionsProvider_lastFinalCaption];
  uint64_t v15 = type metadata accessor for AXLTCaption();
  uint64_t v16 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56);
  v16(v14, 1, 1, v15);
  v16(&v10[OBJC_IVAR___AXLTCaptionsProvider_currentCaption], 1, 1, v15);
  uint64_t v17 = OBJC_IVAR___AXLTCaptionsProvider_dateFormatter;
  *(void *)&v10[v17] = [objc_allocWithZone((Class)NSDateFormatter) init];
  *(void *)&v10[OBJC_IVAR___AXLTCaptionsProvider_unlockedCaptions] = &_swiftEmptyArrayStorage;
  *(void *)&v10[OBJC_IVAR___AXLTCaptionsProvider_placeholderTimer] = 0;
  *(void *)&v10[OBJC_IVAR___AXLTCaptionsProvider_cleanHistoryTimer] = 0;
  *(void *)&v10[OBJC_IVAR___AXLTCaptionsProvider_histogramTimer] = 0;
  v10[OBJC_IVAR___AXLTCaptionsProvider_audioSessionSubscribed] = 0;
  v10[OBJC_IVAR___AXLTCaptionsProvider_audioSessionResetSubscribed] = 0;
  uint64_t v18 = OBJC_IVAR___AXLTCaptionsProvider_lockScreenObserver;
  *(void *)&v10[v18] = [objc_allocWithZone((Class)AXLTLockScreenObserver) init];
  *(void *)&v10[OBJC_IVAR___AXLTCaptionsProvider_captionsID] = 0;

  uint64_t v19 = (objc_class *)type metadata accessor for AXLTCaptionsProvider();
  v33.receiver = v10;
  v33.super_class = v19;
  uint64_t v20 = (char *)objc_msgSendSuper2(&v33, "init");
  uint64_t v21 = *(void **)&v20[OBJC_IVAR___AXLTCaptionsProvider_dateFormatter];
  uint64_t v22 = v20;
  id v23 = v21;
  NSString v24 = String._bridgeToObjectiveC()();
  [v23 setDateFormat:v24];

  id v25 = self;
  id v26 = [v25 sharedInstance];
  [v26 setDelegate:v22];

  id v27 = [v25 sharedInstance];
  [v27 setUtilityType:1];

  [*(id *)&v22[OBJC_IVAR___AXLTCaptionsProvider_lockScreenObserver] setDelegate:v22];
  id v28 = self;
  historyCheckTimeInterval.getter();
  id v29 = objc_msgSend(v28, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", v22, "cleanOldestCaptionsIfNeeded", 0, 1);
  unint64_t v30 = *(void **)&v22[OBJC_IVAR___AXLTCaptionsProvider_cleanHistoryTimer];
  *(void *)&v22[OBJC_IVAR___AXLTCaptionsProvider_cleanHistoryTimer] = v29;

  sub_100035A78(0, 0);
  AXLTCaptionsProvider.startTranscribing()();

  return v22;
}

id AXLTCaptionsProvider.__deallocating_deinit()
{
  AXLTCaptionsProvider.stopTranscribing()();
  uint64_t v1 = OBJC_IVAR___AXLTCaptionsProvider_placeholderTimer;
  [*(id *)&v0[OBJC_IVAR___AXLTCaptionsProvider_placeholderTimer] invalidate];
  uint64_t v2 = *(void **)&v0[v1];
  *(void *)&v0[v1] = 0;

  uint64_t v3 = *(void **)&v0[OBJC_IVAR___AXLTCaptionsProvider_cleanHistoryTimer];
  if (v3) {
    [v3 invalidate];
  }
  uint64_t v4 = OBJC_IVAR___AXLTCaptionsProvider_audioSessionSubscribed;
  if (v0[OBJC_IVAR___AXLTCaptionsProvider_audioSessionSubscribed] == 1)
  {
    id v5 = [self defaultCenter];
    id v6 = [self sharedInstance];
    [v5 removeObserver:v0 name:AVAudioSessionInterruptionNotification object:v6];

    v0[v4] = 0;
  }
  uint64_t v7 = OBJC_IVAR___AXLTCaptionsProvider_audioSessionResetSubscribed;
  if (v0[OBJC_IVAR___AXLTCaptionsProvider_audioSessionResetSubscribed] == 1)
  {
    id v8 = [self defaultCenter];
    id v9 = [self sharedInstance];
    [v8 removeObserver:v0 name:AVAudioSessionMediaServicesWereResetNotification object:v9];

    v0[v7] = 0;
  }
  v11.receiver = v0;
  v11.super_class = (Class)type metadata accessor for AXLTCaptionsProvider();
  return objc_msgSendSuper2(&v11, "dealloc");
}

NSObject *sub_1000350A0(void *a1)
{
  uint64_t result = [a1 downloadProgress];
  if (result == -2) {
    return result;
  }
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = 0;
  *(void *)(v4 + 24) = 0xE000000000000000;
  if ([a1 downloadProgress] == (id)-1)
  {
    uint64_t v20 = static AXLTUtilities.AXLTLocString(_:)();
LABEL_10:
    *(void *)(v4 + 16) = v20;
    *(void *)(v4 + 24) = v21;
    swift_bridgeObjectRelease();
    goto LABEL_11;
  }
  if ([a1 downloadProgress] != (id)100)
  {
    sub_100006380(&qword_10006C140);
    uint64_t v22 = swift_allocObject();
    *(_OWORD *)(v22 + 16) = xmmword_1000545C0;
    uint64_t v23 = static AXLTUtilities.AXLTLocString(_:)();
    uint64_t v25 = v24;
    *(void *)(v22 + 56) = &type metadata for String;
    *(void *)(v22 + 64) = sub_10003BD9C();
    *(void *)(v22 + 32) = v23;
    *(void *)(v22 + 40) = v25;
    id v26 = [a1 downloadProgress];
    *(void *)(v22 + 96) = &type metadata for Int;
    *(void *)(v22 + 104) = &protocol witness table for Int;
    *(void *)(v22 + 72) = v26;
    uint64_t v20 = String.init(format:_:)();
    goto LABEL_10;
  }
  *(void *)(v4 + 16) = static AXLTUtilities.AXLTLocString(_:)();
  *(void *)(v4 + 24) = v5;
  swift_bridgeObjectRelease();
  id v6 = self;
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v1;
  *(void *)(v7 + 24) = v4;
  aBlock[4] = (uint64_t)sub_10003BE30;
  aBlock[5] = v7;
  aBlock[0] = (uint64_t)_NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_1000315A8;
  aBlock[3] = (uint64_t)&unk_100066FE0;
  id v8 = _Block_copy(aBlock);
  id v9 = v1;
  swift_retain();
  swift_release();
  id v10 = [v6 scheduledTimerWithTimeInterval:0 repeats:v8 block:2.0];
  _Block_release(v8);

  os_log_type_t v11 = static os_log_type_t.debug.getter();
  uint64_t result = (id)AXLogLiveTranscription();
  if (!result)
  {
LABEL_17:
    __break(1u);
    return result;
  }
  id v12 = result;
  os_log_type_t v13 = v11;
  if (os_log_type_enabled(result, v11))
  {
    uint64_t v14 = (uint8_t *)swift_slowAlloc();
    aBlock[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v14 = 136315138;
    buf = v14;
    id v15 = [self currentThread];
    id v16 = [v15 description];
    uint64_t v17 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v19 = v18;

    aBlock[7] = sub_10000E634(v17, v19, aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v12, v13, "Timer: %s", buf, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

LABEL_11:
  os_log_type_t v27 = static os_log_type_t.debug.getter();
  uint64_t result = (id)AXLogLiveTranscription();
  if (!result)
  {
    __break(1u);
    goto LABEL_17;
  }
  id v28 = result;
  os_log_type_t v29 = v27;
  if (os_log_type_enabled(result, v27))
  {
    swift_retain();
    unint64_t v30 = (uint8_t *)swift_slowAlloc();
    aBlock[0] = swift_slowAlloc();
    *(_DWORD *)unint64_t v30 = 136315138;
    swift_beginAccess();
    uint64_t v32 = *(void *)(v4 + 16);
    unint64_t v31 = *(void *)(v4 + 24);
    swift_bridgeObjectRetain();
    void aBlock[6] = sub_10000E634(v32, v31, aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    swift_release();
    _os_log_impl((void *)&_mh_execute_header, v28, v29, "progress %s", v30, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  swift_beginAccess();
  unint64_t v34 = *(void *)(v4 + 16);
  unint64_t v33 = *(void *)(v4 + 24);
  swift_bridgeObjectRetain();
  sub_100035A78(v34, v33);
  swift_bridgeObjectRelease();
  return swift_release();
}

id sub_100035604(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v35 = a3;
  uint64_t v3 = type metadata accessor for AXLTCaption();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = __chkstk_darwin(v3);
  unint64_t v34 = (char *)&v31 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  id v8 = (char *)&v31 - v7;
  static os_log_type_t.debug.getter();
  id result = (id)AXLogLiveTranscription();
  if (!result) {
    goto LABEL_21;
  }
  id v10 = result;
  os_log(_:dso:log:_:_:)();

  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  uint64_t v11 = *(void *)(v36 + 16);
  id result = (id)swift_bridgeObjectRelease();
  if (!v11) {
    return result;
  }
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  unint64_t v12 = *(void *)(v36 + 16);
  swift_bridgeObjectRelease();
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  id result = (id)swift_release();
  if (!v12)
  {
    __break(1u);
    goto LABEL_18;
  }
  if (v12 > *(void *)(v36 + 16))
  {
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  unint64_t v13 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v33 = *(void *)(v4 + 72);
  uint64_t v14 = v36 + v13 + v33 * (v12 - 1);
  id v15 = *(void (**)(char *, uint64_t, uint64_t))(v4 + 16);
  v15(v8, v14, v3);
  swift_bridgeObjectRelease();
  uint64_t v16 = AXLTCaption.appID.getter();
  uint64_t v18 = v17;
  unint64_t v19 = *(void (**)(char *, uint64_t))(v4 + 8);
  v19(v8, v3);
  if (v16 == placeholderID.getter() && v18 == v20)
  {
    swift_bridgeObjectRelease_n();
  }
  else
  {
    char v21 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    id result = (id)swift_bridgeObjectRelease();
    if ((v21 & 1) == 0) {
      return result;
    }
  }
  unint64_t v32 = v13;
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  unint64_t v22 = *(void *)(v36 + 16);
  swift_bridgeObjectRelease();
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  id result = (id)swift_release();
  if (!v22) {
    goto LABEL_19;
  }
  if (v22 > *(void *)(v36 + 16))
  {
LABEL_20:
    __break(1u);
LABEL_21:
    __break(1u);
    return result;
  }
  uint64_t v23 = v15;
  uint64_t v24 = v35;
  uint64_t v25 = v36 + v32 + (v22 - 1) * v33;
  id v26 = v34;
  v23(v34, v25, v3);
  swift_bridgeObjectRelease();
  uint64_t v27 = AXLTCaption.text.getter();
  uint64_t v29 = v28;
  v19(v26, v3);
  swift_beginAccess();
  if (v27 == *(void *)(v24 + 16) && v29 == *(void *)(v24 + 24))
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    char v30 = _stringCompareWithSmolCheck(_:_:expecting:)();
    id result = (id)swift_bridgeObjectRelease();
    if ((v30 & 1) == 0) {
      return result;
    }
  }
  return (id)sub_100035A78(0, 0);
}

uint64_t sub_100035A78(unint64_t a1, unint64_t a2)
{
  uint64_t v3 = v2;
  unint64_t v100 = a2;
  unint64_t v106 = a1;
  uint64_t v99 = type metadata accessor for AXLTCaptionActionsType();
  uint64_t v98 = *(void *)(v99 - 8);
  uint64_t v4 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v6 = (char *)&v87 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __chkstk_darwin(v4);
  id v9 = (char *)&v87 - v8;
  __chkstk_darwin(v7);
  uint64_t v11 = (char *)&v87 - v10;
  uint64_t v12 = type metadata accessor for AXLTCaption();
  uint64_t v102 = *(void *)(v12 - 8);
  uint64_t v13 = __chkstk_darwin(v12);
  uint64_t v92 = (char *)&v87 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __chkstk_darwin(v13);
  uint64_t v89 = (char *)&v87 - v16;
  uint64_t v17 = __chkstk_darwin(v15);
  unint64_t v93 = (char *)&v87 - v18;
  uint64_t v19 = __chkstk_darwin(v17);
  uint64_t v94 = (char *)&v87 - v20;
  uint64_t v21 = __chkstk_darwin(v19);
  uint64_t v23 = (char *)&v87 - v22;
  __chkstk_darwin(v21);
  uint64_t v105 = (char *)&v87 - v24;
  if (qword_10006AE20 != -1) {
    swift_once();
  }
  uint64_t v25 = static AXLTSettingsManager.shared;
  id v26 = (unsigned char *)(static AXLTSettingsManager.shared + OBJC_IVAR___AXLTSettingsManager_isMicOn);
  swift_beginAccess();
  if (*v26 == 1) {
    uint64_t v27 = placeholderMicName.getter();
  }
  else {
    uint64_t v27 = placeholderName.getter();
  }
  uint64_t v103 = v27;
  uint64_t v29 = v28;
  char v30 = (unsigned char *)(v25 + OBJC_IVAR___AXLTSettingsManager_isPaused);
  swift_beginAccess();
  if (*v30 == 1) {
    uint64_t v31 = placeholderPausedText.getter();
  }
  else {
    uint64_t v31 = placeholderText.getter();
  }
  unint64_t KeyPath = v31;
  unint64_t v34 = v32;
  unint64_t v35 = v100;
  char v104 = (void *)v12;
  unint64_t v91 = v6;
  unint64_t v90 = v9;
  if (!v100)
  {
    UIAccessibilityNotifications v38 = &v3[OBJC_IVAR___AXLTCaptionsProvider_captionsID];
    uint64_t v39 = (char *)placeholderID.getter();
    unint64_t v106 = KeyPath;
    goto LABEL_16;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  uint64_t v36 = static AXLTUtilities.AXLTLocString(_:)();
  unint64_t KeyPath = v37;
  if (v36 == v106 && v37 == v35)
  {
    swift_bridgeObjectRelease();
    UIAccessibilityNotifications v38 = &v3[OBJC_IVAR___AXLTCaptionsProvider_captionsID];
    unint64_t v34 = v35;
    uint64_t v39 = (char *)placeholderID.getter();
LABEL_16:
    uint64_t v88 = *(void (**)(char *, void, uint64_t))(v98 + 104);
    v88(v11, enum case for AXLTCaptionActionsType.AXLTCaptionActionsNone(_:), v99);
    goto LABEL_17;
  }
  char v40 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  UIAccessibilityNotifications v38 = &v3[OBJC_IVAR___AXLTCaptionsProvider_captionsID];
  unint64_t KeyPath = v35;
  uint64_t v39 = (char *)placeholderID.getter();
  if (v40)
  {
    unint64_t v34 = v35;
    goto LABEL_16;
  }
  uint64_t v88 = *(void (**)(char *, void, uint64_t))(v98 + 104);
  v88(v11, enum case for AXLTCaptionActionsType.AXLTCaptionActionsPersist(_:), v99);
  unint64_t v34 = v35;
LABEL_17:
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  AXLTCaption.init(id:appID:appName:time:text:segments:placeholder:actionType:)();
  if (__OFADD__(*(void *)v38, 1))
  {
    __break(1u);
LABEL_56:
    __break(1u);
    goto LABEL_57;
  }
  ++*(void *)v38;
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  uint64_t v41 = *(void *)(v107[0] + 16);
  swift_bridgeObjectRelease();
  if (!v41)
  {
    swift_bridgeObjectRelease();
    sub_100006380((uint64_t *)&unk_10006C160);
    uint64_t v49 = v102;
    unint64_t v50 = (*(unsigned __int8 *)(v102 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v102 + 80);
    uint64_t v51 = swift_allocObject();
    *(_OWORD *)(v51 + 16) = xmmword_100054300;
    uint64_t v52 = v104;
    uint64_t v53 = v105;
    (*(void (**)(unint64_t, char *, void *))(v49 + 16))(v51 + v50, v105, v104);
    swift_getKeyPath();
    swift_getKeyPath();
    v107[0] = v51;
    uint64_t v54 = v3;
    static Published.subscript.setter();
    swift_bridgeObjectRelease();
    return (*(uint64_t (**)(char *, void *))(v49 + 8))(v53, v52);
  }
  swift_getKeyPath();
  uint64_t v39 = (char *)&unk_100054778;
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  UIAccessibilityNotifications v38 = *(char **)(v107[0] + 16);
  swift_bridgeObjectRelease();
  unint64_t KeyPath = swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  if (!v38) {
    goto LABEL_56;
  }
  unint64_t KeyPath = v107[0];
  if ((unint64_t)v38 > *(void *)(v107[0] + 16))
  {
LABEL_57:
    __break(1u);
LABEL_58:
    __break(1u);
    goto LABEL_59;
  }
  uint64_t v42 = v102;
  unint64_t v97 = (*(unsigned __int8 *)(v42 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v42 + 80);
  uint64_t v96 = *(void *)(v102 + 72);
  uint64_t v43 = v107[0] + v97 + v96 * (void)(v38 - 1);
  uint64_t v44 = (char *)v104;
  uint64_t v95 = *(void (**)(char *, uint64_t, char *))(v102 + 16);
  v95(v23, v43, (char *)v104);
  swift_bridgeObjectRelease();
  uint64_t v45 = AXLTCaption.appID.getter();
  uint64_t v47 = v46;
  uint64_t v101 = *(void (**)(char *, char *))(v42 + 8);
  v101(v23, v44);
  if (v45 == placeholderID.getter() && v47 == v48)
  {
    swift_bridgeObjectRelease_n();
  }
  else
  {
    char v56 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v56 & 1) == 0)
    {
      swift_bridgeObjectRelease();
      v95(v92, (uint64_t)v105, v44);
      swift_getKeyPath();
      swift_getKeyPath();
      uint64_t v3 = (char *)static Published.subscript.modify();
      UIAccessibilityNotifications v38 = (char *)v69;
      uint64_t v39 = (char *)*v69;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      *(void *)UIAccessibilityNotifications v38 = v39;
      if (isUniquelyReferenced_nonNull_native)
      {
LABEL_41:
        unint64_t v72 = *((void *)v39 + 2);
        unint64_t v71 = *((void *)v39 + 3);
        if (v72 >= v71 >> 1)
        {
          uint64_t v39 = (char *)sub_10003B3A8(v71 > 1, v72 + 1, 1, (unint64_t)v39);
          *(void *)UIAccessibilityNotifications v38 = v39;
        }
        *((void *)v39 + 2) = v72 + 1;
        uint64_t v73 = (char *)v104;
        (*(void (**)(char *, char *, void *))(v102 + 32))(&v39[v97 + v72 * v96], v92, v104);
        ((void (*)(void *, void))v3)(v107, 0);
        swift_release();
        swift_release();
        swift_bridgeObjectRelease();
        uint64_t v67 = v105;
        goto LABEL_53;
      }
LABEL_65:
      uint64_t v39 = (char *)sub_10003B3A8(0, *((void *)v39 + 2) + 1, 1, (unint64_t)v39);
      *(void *)UIAccessibilityNotifications v38 = v39;
      goto LABEL_41;
    }
  }
  swift_getKeyPath();
  uint64_t v39 = (char *)swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  UIAccessibilityNotifications v38 = *(char **)(v107[0] + 16);
  swift_bridgeObjectRelease();
  unint64_t KeyPath = swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  if (!v38) {
    goto LABEL_58;
  }
  unint64_t KeyPath = v107[0];
  if ((unint64_t)v38 > *(void *)(v107[0] + 16))
  {
LABEL_59:
    __break(1u);
LABEL_60:
    __break(1u);
    goto LABEL_61;
  }
  uint64_t v57 = v94;
  uint64_t v39 = (char *)v104;
  v95(v94, v107[0] + v97 + (void)(v38 - 1) * v96, (char *)v104);
  swift_bridgeObjectRelease();
  uint64_t v58 = AXLTCaption.appName.getter();
  uint64_t v60 = v59;
  v101(v57, v39);
  if (v58 == v103 && v60 == v29)
  {
    swift_bridgeObjectRelease_n();
  }
  else
  {
    char v61 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v61 & 1) == 0) {
      goto LABEL_49;
    }
  }
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  UIAccessibilityNotifications v38 = *(char **)(v107[0] + 16);
  swift_bridgeObjectRelease();
  unint64_t KeyPath = swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  if (!v38) {
    goto LABEL_60;
  }
  unint64_t KeyPath = v107[0];
  if ((unint64_t)v38 > *(void *)(v107[0] + 16))
  {
LABEL_61:
    __break(1u);
    goto LABEL_62;
  }
  uint64_t v62 = v93;
  v95(v93, v107[0] + v97 + (void)(v38 - 1) * v96, v39);
  swift_bridgeObjectRelease();
  uint64_t v63 = AXLTCaption.text.getter();
  uint64_t v65 = v64;
  v101(v62, v39);
  if (v63 == v106 && v65 == v34)
  {
    swift_bridgeObjectRelease();
LABEL_38:
    swift_bridgeObjectRelease();
    uint64_t v67 = v105;
    id v68 = v39;
    return ((uint64_t (*)(char *, char *))v101)(v67, v68);
  }
  char v66 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  if (v66) {
    goto LABEL_38;
  }
  uint64_t v74 = (unsigned char *)(static AXLTSettingsManager.shared + OBJC_IVAR___AXLTSettingsManager_isPaused);
  swift_beginAccess();
  if (v100 || (*v74 & 1) != 0)
  {
LABEL_49:
    swift_getKeyPath();
    swift_getKeyPath();
    static Published.subscript.getter();
    swift_release();
    swift_release();
    uint64_t v39 = *(char **)(v107[0] + 16);
    swift_bridgeObjectRelease();
    swift_getKeyPath();
    swift_getKeyPath();
    uint64_t v3 = (char *)static Published.subscript.modify();
    UIAccessibilityNotifications v38 = (char *)v83;
    unint64_t KeyPath = *v83;
    char v84 = swift_isUniquelyReferenced_nonNull_native();
    *(void *)UIAccessibilityNotifications v38 = KeyPath;
    if (v84)
    {
      if (v39) {
        goto LABEL_51;
      }
      goto LABEL_63;
    }
LABEL_62:
    unint64_t KeyPath = sub_10003B72C(KeyPath);
    *(void *)UIAccessibilityNotifications v38 = KeyPath;
    if (v39)
    {
LABEL_51:
      if ((unint64_t)v39 <= *(void *)(KeyPath + 16))
      {
        uint64_t v85 = KeyPath + v97 + (void)(v39 - 1) * v96;
        uint64_t v73 = (char *)v104;
        uint64_t v86 = v105;
        (*(void (**)(uint64_t, char *, void *))(v102 + 24))(v85, v105, v104);
        ((void (*)(void *, void))v3)(v107, 0);
        swift_release();
        swift_release();
        swift_bridgeObjectRelease();
        uint64_t v67 = v86;
LABEL_53:
        id v68 = v73;
        return ((uint64_t (*)(char *, char *))v101)(v67, v68);
      }
      goto LABEL_64;
    }
LABEL_63:
    __break(1u);
LABEL_64:
    __break(1u);
    goto LABEL_65;
  }
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  unint64_t v75 = *(void *)(v107[0] + 16);
  swift_bridgeObjectRelease();
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  uint64_t result = swift_release();
  if (v75)
  {
    if (v75 <= *(void *)(v107[0] + 16))
    {
      id v76 = v89;
      v95(v89, v107[0] + v97 + (v75 - 1) * v96, v39);
      swift_bridgeObjectRelease();
      uint64_t v77 = v90;
      AXLTCaption.actionType.getter();
      v101(v76, v39);
      uint64_t v78 = v98;
      unint64_t v79 = v91;
      uint64_t v80 = v99;
      v88(v91, enum case for AXLTCaptionActionsType.AXLTCaptionActionsPersist(_:), v99);
      sub_10003C1F4(&qword_10006BE30, (void (*)(uint64_t))&type metadata accessor for AXLTCaptionActionsType);
      char v81 = dispatch thunk of static Equatable.== infix(_:_:)();
      uint64_t v82 = *(void (**)(char *, uint64_t))(v78 + 8);
      v82(v79, v80);
      v82(v77, v80);
      if (v81) {
        goto LABEL_38;
      }
      goto LABEL_49;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_1000369A8()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_100006380(&qword_10006BDF0);
  __chkstk_darwin(v2 - 8);
  uint64_t v70 = (char *)&v60 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for AXLTCaptionActionsType();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v60 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v60 - v9;
  uint64_t v11 = (void *)type metadata accessor for AXLTCaption();
  uint64_t v79 = *(v11 - 1);
  uint64_t v12 = __chkstk_darwin(v11);
  uint64_t v69 = (char *)&v60 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __chkstk_darwin(v12);
  uint64_t v74 = (char *)&v60 - v15;
  uint64_t v16 = __chkstk_darwin(v14);
  unint64_t v71 = (char *)&v60 - v17;
  __chkstk_darwin(v16);
  uint64_t v19 = (char *)&v60 - v18;
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  unint64_t v20 = *(void *)(v80[0] + 16);
  uint64_t result = swift_bridgeObjectRelease();
  uint64_t v77 = (char *)v20;
  unint64_t v22 = v20 - 2;
  if (v20 >= 2)
  {
    swift_getKeyPath();
    unint64_t KeyPath = (char *)swift_getKeyPath();
    static Published.subscript.getter();
    swift_release();
    swift_release();
    if (v22 >= *(void *)(v80[0] + 16))
    {
      __break(1u);
    }
    else
    {
      uint64_t v24 = v79;
      unint64_t v78 = (*(unsigned __int8 *)(v24 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v24 + 80);
      unint64_t v66 = *(void *)(v79 + 72);
      unint64_t v67 = v66 * v22;
      uint64_t v25 = *(void (**)(void, void, void))(v79 + 16);
      unint64_t v75 = (unint64_t *)(v79 + 16);
      id v68 = v25;
      v25(v19, v80[0] + v78 + v66 * v22, v11);
      swift_bridgeObjectRelease();
      AXLTCaption.actionType.getter();
      id v26 = *(void (**)(char *, void *))(v24 + 8);
      unint64_t v72 = (unint64_t *)(v24 + 8);
      uint64_t v73 = v26;
      v26(v19, v11);
      (*(void (**)(char *, void, uint64_t))(v5 + 104))(v8, enum case for AXLTCaptionActionsType.AXLTCaptionActionsSeparate(_:), v4);
      sub_10003C1F4(&qword_10006C138, (void (*)(uint64_t))&type metadata accessor for AXLTCaptionActionsType);
      dispatch thunk of RawRepresentable.rawValue.getter();
      dispatch thunk of RawRepresentable.rawValue.getter();
      uint64_t v27 = (char *)v80[0];
      unint64_t KeyPath = (char *)v80[4];
      id v76 = v1;
      uint64_t v1 = *(unint64_t **)(v5 + 8);
      ((void (*)(char *, uint64_t))v1)(v8, v4);
      uint64_t result = ((uint64_t (*)(char *, uint64_t))v1)(v10, v4);
      uint64_t v8 = (char *)v76;
      if (v27 == KeyPath) {
        return result;
      }
      swift_getKeyPath();
      swift_getKeyPath();
      static Published.subscript.getter();
      swift_release();
      swift_release();
      if (v22 < *(void *)(v80[0] + 16))
      {
        uint64_t v65 = (char *)v22;
        unint64_t v29 = v67;
        uint64_t v28 = v68;
        v68(v19, v80[0] + v78 + v67, v11);
        swift_bridgeObjectRelease();
        uint64_t v30 = AXLTCaption.appID.getter();
        unint64_t v22 = v31;
        v73(v19, v11);
        uint64_t v32 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        uint64_t v60 = v30;
        if (v30 == v32 && v22 == v33)
        {
          swift_bridgeObjectRelease();
          micCaptionTextTimeLimit.getter();
        }
        else
        {
          char v35 = _stringCompareWithSmolCheck(_:_:expecting:)();
          swift_bridgeObjectRelease();
          if (v35) {
            micCaptionTextTimeLimit.getter();
          }
          else {
            captionTextTimeLimit.getter();
          }
        }
        double v36 = v34;
        unint64_t v37 = (char *)self;
        swift_getKeyPath();
        unint64_t KeyPath = (char *)swift_getKeyPath();
        static Published.subscript.getter();
        swift_release();
        swift_release();
        if ((unint64_t)v65 < *(void *)(v80[0] + 16))
        {
          uint64_t v64 = v37;
          uint64_t v62 = (char *)v22;
          unint64_t v22 = (unint64_t)v28;
          unint64_t v38 = v78;
          ((void (*)(char *, unint64_t, void *))v22)(v19, v80[0] + v78 + v29, v11);
          swift_bridgeObjectRelease();
          AXLTCaption.time.getter();
          uint64_t v1 = v72;
          uint64_t v39 = v73;
          v73(v19, v11);
          uint64_t v63 = String._bridgeToObjectiveC()();
          swift_bridgeObjectRelease();
          swift_getKeyPath();
          swift_getKeyPath();
          static Published.subscript.getter();
          swift_release();
          swift_release();
          unint64_t KeyPath = v77;
          if ((unint64_t)v77 <= *(void *)(v80[0] + 16))
          {
            uint64_t v61 = v66 * (void)(v77 - 1);
            ((void (*)(char *, unint64_t, void *))v22)(v19, v80[0] + v38 + v61, v11);
            swift_bridgeObjectRelease();
            AXLTCaption.time.getter();
            char v40 = KeyPath;
            unint64_t v66 = (unint64_t)v11;
            v39(v19, v11);
            NSString v41 = String._bridgeToObjectiveC()();
            swift_bridgeObjectRelease();
            uint64_t v11 = v63;
            [v64 timeDifferenceDateStringOld:v63 dateStringNew:v41];
            double v43 = v42;

            if (v43 >= v36) {
              return swift_bridgeObjectRelease();
            }
            uint64_t v64 = KeyPath - 1;
            swift_getKeyPath();
            swift_getKeyPath();
            uint64_t v8 = (char *)v76;
            static Published.subscript.getter();
            swift_release();
            swift_release();
            unint64_t KeyPath = v62;
            if ((unint64_t)v40 <= *(void *)(v80[0] + 16))
            {
              uint64_t v44 = v71;
              unint64_t v22 = v66;
              v68(v71, v80[0] + v78 + v61, v66);
              swift_bridgeObjectRelease();
              uint64_t v45 = AXLTCaption.appID.getter();
              uint64_t v47 = v46;
              v39(v44, (void *)v22);
              if (v60 == v45 && KeyPath == v47)
              {
                swift_bridgeObjectRelease_n();
                unint64_t KeyPath = v65;
                uint64_t v11 = (void *)v66;
              }
              else
              {
                char v48 = _stringCompareWithSmolCheck(_:_:expecting:)();
                swift_bridgeObjectRelease();
                uint64_t result = swift_bridgeObjectRelease();
                unint64_t KeyPath = v65;
                uint64_t v11 = (void *)v66;
                if ((v48 & 1) == 0) {
                  return result;
                }
              }
              swift_getKeyPath();
              swift_getKeyPath();
              static Published.subscript.getter();
              swift_release();
              swift_release();
              if ((unint64_t)KeyPath < *(void *)(v80[0] + 16))
              {
                unint64_t v49 = v67;
                unint64_t v50 = (void (*)(char *, unint64_t, void *))v68;
                uint64_t v51 = (uint64_t)v70;
                uint64_t v1 = v75;
                v68(v70, v80[0] + v78 + v67, v11);
                swift_bridgeObjectRelease();
                (*(void (**)(uint64_t, void, uint64_t, void *))(v79 + 56))(v51, 0, 1, v11);
                uint64_t v52 = (uint64_t)&v8[OBJC_IVAR___AXLTCaptionsProvider_lastFinalCaption];
                swift_beginAccess();
                sub_10003B610(v51, v52);
                swift_endAccess();
                swift_getKeyPath();
                swift_getKeyPath();
                static Published.subscript.getter();
                swift_release();
                swift_release();
                BOOL v53 = (unint64_t)KeyPath >= *(void *)(v80[0] + 16);
                unint64_t KeyPath = (char *)v72;
                unint64_t v22 = (unint64_t)v73;
                if (!v53)
                {
                  v50(v19, v80[0] + v78 + v49, v11);
                  swift_bridgeObjectRelease();
                  swift_getKeyPath();
                  swift_getKeyPath();
                  static Published.subscript.getter();
                  swift_release();
                  swift_release();
                  if ((unint64_t)v77 <= *(void *)(v80[0] + 16))
                  {
                    uint64_t v54 = (char *)v78;
                    uint64_t v55 = v69;
                    v50(v69, v80[0] + v78 + v61, v11);
                    swift_bridgeObjectRelease();
                    mergeCaptions(_:_:)();
                    ((void (*)(char *, void *))v22)(v55, v11);
                    ((void (*)(char *, void *))v22)(v19, v11);
                    swift_getKeyPath();
                    swift_getKeyPath();
                    unint64_t KeyPath = (char *)static Published.subscript.modify();
                    uint64_t v1 = v56;
                    unint64_t v22 = *v56;
                    uint64_t result = swift_isUniquelyReferenced_nonNull_native();
                    unint64_t *v1 = v22;
                    uint64_t v8 = v54;
                    if (result) {
                      goto LABEL_24;
                    }
                    goto LABEL_35;
                  }
LABEL_34:
                  __break(1u);
LABEL_35:
                  uint64_t result = sub_10003B72C(v22);
                  unint64_t v22 = result;
                  unint64_t *v1 = result;
LABEL_24:
                  unint64_t v57 = (unint64_t)v64;
                  uint64_t v58 = v73;
                  if ((unint64_t)v65 >= *(void *)(v22 + 16))
                  {
                    __break(1u);
                  }
                  else
                  {
                    (*(void (**)(char *, char *, void *))(v79 + 40))(&v8[v22 + v67], v74, v11);
                    ((void (*)(void *, void))KeyPath)(v80, 0);
                    swift_release();
                    swift_release();
                    swift_getKeyPath();
                    swift_getKeyPath();
                    uint64_t v59 = (void (*)(void *, void))static Published.subscript.modify();
                    sub_100033C60(v57, (uint64_t)v19);
                    v58(v19, v11);
                    v59(v80, 0);
                    swift_release();
                    return swift_release();
                  }
                  return result;
                }
LABEL_33:
                __break(1u);
                goto LABEL_34;
              }
LABEL_32:
              __break(1u);
              goto LABEL_33;
            }
LABEL_31:
            __break(1u);
            goto LABEL_32;
          }
LABEL_30:
          __break(1u);
          goto LABEL_31;
        }
LABEL_29:
        __break(1u);
        goto LABEL_30;
      }
    }
    __break(1u);
    goto LABEL_29;
  }
  return result;
}

Swift::Void __swiftcall AXLTCaptionsProvider.cleanCaptions()()
{
  static os_log_type_t.debug.getter();
  id v0 = (id)AXLogLiveTranscription();
  if (v0)
  {
    uint64_t v1 = v0;
    os_log(_:dso:log:_:_:)();

    swift_getKeyPath();
    swift_getKeyPath();
    uint64_t v2 = (void (*)(uint64_t *, void))static Published.subscript.modify();
    *uint64_t v3 = &_swiftEmptyArrayStorage;
    swift_bridgeObjectRelease();
    v2(&v4, 0);
    swift_release();
    swift_release();
    sub_100035A78(0, 0);
  }
  else
  {
    __break(1u);
  }
}

NSObject *sub_1000377E4()
{
  uint64_t v1 = v0;
  uint64_t v81 = type metadata accessor for Date();
  uint64_t v72 = *(void *)(v81 - 8);
  __chkstk_darwin(v81);
  uint64_t v80 = (char *)&v70 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = type metadata accessor for AXLTCaption();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v73 = (char *)&v70 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v87 = (char *)&v70 - v7;
  __chkstk_darwin(v8);
  *(void *)&long long v74 = (char *)&v70 - v9;
  __chkstk_darwin(v10);
  uint64_t v12 = (char *)&v70 - v11;
  __chkstk_darwin(v13);
  uint64_t v88 = (char *)&v70 - v14;
  static os_log_type_t.debug.getter();
  uint64_t result = (id)AXLogLiveTranscription();
  if (!result)
  {
LABEL_58:
    __break(1u);
    return result;
  }
  uint64_t v16 = result;
  os_log(_:dso:log:_:_:)();

  if (_AXSBrailleInputDeviceConnected() && _AXSVoiceOverTouchEnabled()) {
    historyTimeIntervalMaxBraille.getter();
  }
  else {
    historyTimeIntervalMax.getter();
  }
  double v18 = v17;
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  uint64_t result = swift_release();
  unint64_t v20 = v89;
  uint64_t v21 = *(void *)(v89 + 16);
  uint64_t v82 = v4;
  uint64_t v84 = v21;
  if (v21)
  {
    unint64_t v22 = 0;
    unint64_t v75 = (uint64_t *)((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
    uint64_t v83 = (char *)v75 + v89;
    uint64_t v86 = (void (*)(char *, char *, uint64_t))(v4 + 16);
    uint64_t v77 = (void (**)(char *, uint64_t))(v72 + 8);
    uint64_t v23 = (void (**)(char *, uint64_t))(v4 + 8);
    unint64_t v71 = v90;
    *(void *)&long long v19 = 134217984;
    long long v70 = v19;
    uint64_t v79 = v0;
    unint64_t v76 = v89;
    while (v22 < *(void *)(v20 + 16))
    {
      uint64_t v24 = *(void *)(v4 + 72);
      uint64_t v85 = *(uint64_t **)(v4 + 16);
      ((void (*)(char *, char *, uint64_t))v85)(v88, &v83[v24 * v22], v3);
      AXLTCaption.time.getter();
      uint64_t v25 = String.count.getter();
      swift_bridgeObjectRelease();
      if (v25 >= 1)
      {
        swift_getKeyPath();
        swift_getKeyPath();
        static Published.subscript.getter();
        swift_release();
        swift_release();
        unint64_t v26 = *(void *)(v89 + 16);
        swift_bridgeObjectRelease();
        if (v26 >= 2)
        {
          uint64_t v27 = self;
          AXLTCaption.time.getter();
          NSString v28 = String._bridgeToObjectiveC()();
          swift_bridgeObjectRelease();
          id v29 = [v27 now];
          uint64_t v30 = v80;
          static Date._unconditionallyBridgeFromObjectiveC(_:)();

          Class isa = Date._bridgeToObjectiveC()().super.isa;
          (*v77)(v30, v81);
          NSString v32 = [v27 dateToString:isa];

          if (!v32)
          {
            static String._unconditionallyBridgeFromObjectiveC(_:)();
            NSString v32 = String._bridgeToObjectiveC()();
            swift_bridgeObjectRelease();
          }
          objc_msgSend(v27, "timeDifferenceDateStringOld:dateStringNew:", v28, v32, v70);
          double v34 = v33;

          if (v18 >= v34)
          {
            (*v23)(v88, v3);
            swift_bridgeObjectRelease();
            uint64_t v4 = v82;
            uint64_t v1 = v79;
            goto LABEL_30;
          }
          swift_getKeyPath();
          swift_getKeyPath();
          uint64_t v1 = v79;
          static Published.subscript.getter();
          swift_release();
          swift_release();
          uint64_t v35 = *(void *)(v89 + 16);
          if (v35)
          {
            unint64_t v36 = 0;
            uint64_t v78 = v89;
            unint64_t v37 = (char *)v75 + v89;
            while (1)
            {
              ((void (*)(char *, char *, uint64_t))v85)(v12, v37, v3);
              sub_10003C1F4(&qword_10006C130, (void (*)(uint64_t))&type metadata accessor for AXLTCaption);
              char v38 = dispatch thunk of static Equatable.== infix(_:_:)();
              uint64_t v39 = (uint64_t (*)(char *, uint64_t))*v23;
              (*v23)(v12, v3);
              if (v38) {
                break;
              }
              ++v36;
              v37 += v24;
              if (v35 == v36)
              {
                swift_bridgeObjectRelease();
                goto LABEL_27;
              }
            }
            swift_bridgeObjectRelease();
            swift_getKeyPath();
            swift_getKeyPath();
            char v40 = (void (*)(uint64_t *, void))static Published.subscript.modify();
            sub_100033C60(v36, (uint64_t)v12);
            v39(v12, v3);
            v40(&v89, 0);
            swift_release();
            swift_release();
            os_log_type_t v41 = static os_log_type_t.debug.getter();
            uint64_t result = (id)AXLogLiveTranscription();
            if (!result) {
              goto LABEL_56;
            }
            double v42 = result;
            double v43 = (char *)v74;
            ((void (*)(void, char *, uint64_t))v85)(v74, v88, v3);
            if (os_log_type_enabled(v42, v41))
            {
              uint64_t v44 = (uint8_t *)swift_slowAlloc();
              *(_DWORD *)uint64_t v44 = v70;
              uint64_t v78 = (uint64_t)(v44 + 4);
              LODWORD(v85) = v41;
              uint64_t v45 = AXLTCaption.id.getter();
              v39(v43, v3);
              uint64_t v89 = v45;
              UnsafeMutableRawBufferPointer.copyMemory(from:)();
              _os_log_impl((void *)&_mh_execute_header, v42, (os_log_type_t)v85, "Removed from captions id: %ld", v44, 0xCu);
              swift_slowDealloc();
            }
            else
            {
              v39(v43, v3);
            }

LABEL_27:
            uint64_t v4 = v82;
            uint64_t v1 = v79;
          }
          else
          {
            swift_bridgeObjectRelease();
            uint64_t v4 = v82;
          }
          unint64_t v20 = v76;
        }
      }
      ++v22;
      uint64_t result = ((uint64_t (*)(char *, uint64_t))*v23)(v88, v3);
      if (v22 == v84) {
        goto LABEL_28;
      }
    }
    __break(1u);
    goto LABEL_55;
  }
LABEL_28:
  swift_bridgeObjectRelease();
LABEL_30:
  uint64_t v46 = (uint64_t *)(v1 + OBJC_IVAR___AXLTCaptionsProvider_unlockedCaptions);
  uint64_t result = swift_beginAccess();
  uint64_t v47 = *v46;
  uint64_t v84 = *(void *)(*v46 + 16);
  uint64_t v85 = v46;
  if (v84)
  {
    unint64_t v76 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
    uint64_t v83 = (char *)(v47 + v76);
    uint64_t v88 = (char *)(v4 + 16);
    uint64_t v77 = (void (**)(char *, uint64_t))(v72 + 8);
    char v48 = (void (**)(char *, uint64_t))(v4 + 8);
    unint64_t v75 = &v91;
    uint64_t result = swift_bridgeObjectRetain();
    unint64_t v49 = 0;
    *(void *)&long long v50 = 134217984;
    long long v74 = v50;
    uint64_t v79 = v47;
    while (v49 < *(void *)(v47 + 16))
    {
      uint64_t v51 = *(void *)(v4 + 72);
      uint64_t v86 = *(void (**)(char *, char *, uint64_t))(v4 + 16);
      v86(v87, &v83[v51 * v49], v3);
      AXLTCaption.time.getter();
      uint64_t v52 = String.count.getter();
      swift_bridgeObjectRelease();
      if (v52 >= 1 && *(void *)(*v85 + 16) >= 2uLL)
      {
        BOOL v53 = self;
        AXLTCaption.time.getter();
        NSString v54 = String._bridgeToObjectiveC()();
        swift_bridgeObjectRelease();
        id v55 = [v53 now];
        char v56 = v80;
        static Date._unconditionallyBridgeFromObjectiveC(_:)();

        Class v57 = Date._bridgeToObjectiveC()().super.isa;
        (*v77)(v56, v81);
        NSString v58 = [v53 dateToString:v57];

        if (!v58)
        {
          static String._unconditionallyBridgeFromObjectiveC(_:)();
          NSString v58 = String._bridgeToObjectiveC()();
          swift_bridgeObjectRelease();
        }
        objc_msgSend(v53, "timeDifferenceDateStringOld:dateStringNew:", v54, v58, (void)v70);
        double v60 = v59;

        if (v18 >= v60)
        {
          (*v48)(v87, v3);
          return swift_bridgeObjectRelease();
        }
        uint64_t v61 = *(void *)(*v85 + 16);
        uint64_t v4 = v82;
        uint64_t v47 = v79;
        if (v61)
        {
          unint64_t v62 = *v85 + v76;
          uint64_t v78 = *v85;
          swift_bridgeObjectRetain();
          unint64_t v63 = 0;
          while (1)
          {
            v86(v12, (char *)v62, v3);
            sub_10003C1F4(&qword_10006C130, (void (*)(uint64_t))&type metadata accessor for AXLTCaption);
            char v64 = dispatch thunk of static Equatable.== infix(_:_:)();
            uint64_t v65 = (uint64_t (*)(char *, uint64_t))*v48;
            (*v48)(v12, v3);
            if (v64) {
              break;
            }
            ++v63;
            v62 += v51;
            if (v61 == v63)
            {
              swift_bridgeObjectRelease();
LABEL_34:
              uint64_t v4 = v82;
              uint64_t v47 = v79;
              goto LABEL_35;
            }
          }
          swift_bridgeObjectRelease();
          swift_beginAccess();
          sub_100033C60(v63, (uint64_t)v12);
          v65(v12, v3);
          swift_endAccess();
          os_log_type_t v66 = static os_log_type_t.debug.getter();
          uint64_t result = (id)AXLogLiveTranscription();
          if (result)
          {
            unint64_t v67 = result;
            id v68 = v73;
            v86(v73, v87, v3);
            if (os_log_type_enabled(v67, v66))
            {
              uint64_t v69 = (uint8_t *)swift_slowAlloc();
              *(_DWORD *)uint64_t v69 = v74;
              uint64_t v86 = (void (*)(char *, char *, uint64_t))(v69 + 4);
              uint64_t v78 = AXLTCaption.id.getter();
              v65(v68, v3);
              v90[3] = v78;
              UnsafeMutableRawBufferPointer.copyMemory(from:)();
              _os_log_impl((void *)&_mh_execute_header, v67, v66, "Removed from unlockedCaptions id: %ld", v69, 0xCu);
              swift_slowDealloc();
            }
            else
            {
              v65(v68, v3);
            }

            goto LABEL_34;
          }
          goto LABEL_57;
        }
      }
LABEL_35:
      ++v49;
      uint64_t result = ((uint64_t (*)(char *, uint64_t))*v48)(v87, v3);
      if (v49 == v84) {
        return swift_bridgeObjectRelease();
      }
    }
LABEL_55:
    __break(1u);
LABEL_56:
    __break(1u);
LABEL_57:
    __break(1u);
    goto LABEL_58;
  }
  return result;
}

uint64_t sub_1000384A4()
{
  uint64_t v1 = static Array._allocateBufferUninitialized(minimumCapacity:)();
  int64x2_t v2 = vdupq_n_s64(0x3FB999999999999AuLL);
  *(void *)(v1 + 16) = 16;
  *(int64x2_t *)(v1 + 32) = v2;
  *(int64x2_t *)(v1 + 48) = v2;
  *(int64x2_t *)(v1 + 64) = v2;
  *(int64x2_t *)(v1 + 80) = v2;
  *(int64x2_t *)(v1 + 96) = v2;
  *(int64x2_t *)(v1 + 112) = v2;
  *(int64x2_t *)(v1 + 128) = v2;
  *(int64x2_t *)(v1 + 144) = v2;
  uint64_t v3 = &v0[OBJC_IVAR___AXLTCaptionsProvider_audioHistogram];
  swift_beginAccess();
  *(void *)uint64_t v3 = v1;
  swift_bridgeObjectRelease();
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  uint64_t result = swift_release();
  if (v6 != *(void *)(*(void *)v3 + 16))
  {
    swift_getKeyPath();
    swift_getKeyPath();
    uint64_t v5 = v0;
    return static Published.subscript.setter();
  }
  return result;
}

uint64_t sub_1000385CC()
{
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100038604(void *a1)
{
  return sub_100032A40(a1, *(Class *)(v1 + 16));
}

uint64_t sub_10003860C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10003861C()
{
  return swift_release();
}

void sub_100038624(void *a1)
{
  sub_100033DBC(a1, *(char **)(v1 + 16));
}

NSObject *sub_1000386FC(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v35 = (char *)&v30 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for DispatchQoS();
  uint64_t v34 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  double v33 = (char *)&v30 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for Notification();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v30 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  os_log_type_t v11 = static os_log_type_t.error.getter();
  uint64_t result = (id)AXLogLiveTranscription();
  if (result)
  {
    uint64_t v13 = result;
    (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, a1, v7);
    BOOL v14 = os_log_type_enabled(v13, v11);
    uint64_t v31 = v5;
    uint64_t v32 = v3;
    if (v14)
    {
      uint64_t v15 = (uint8_t *)swift_slowAlloc();
      aBlock[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v15 = 136315138;
      uint64_t v30 = v15 + 4;
      sub_10003C1F4(&qword_10006C128, (void (*)(uint64_t))&type metadata accessor for Notification);
      uint64_t v16 = dispatch thunk of CustomStringConvertible.description.getter();
      aBlock[9] = sub_10000E634(v16, v17, aBlock);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
      _os_log_impl((void *)&_mh_execute_header, v13, v11, "CaptionsProvider AudioSession reset: %s", v15, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
    }
    double v18 = v36;
    long long v19 = &v36[OBJC_IVAR___AXLTCaptionsProvider_isTranscribing];
    uint64_t result = swift_beginAccess();
    if (*v19 == 1)
    {
      unint64_t v20 = &v18[OBJC_IVAR___AXLTCaptionsProvider_activeRequestType];
      uint64_t result = swift_beginAccess();
      if (!*v20)
      {
        uint64_t v21 = OBJC_IVAR___AXLTCaptionsProvider_audioSessionSubscribed;
        if (v18[OBJC_IVAR___AXLTCaptionsProvider_audioSessionSubscribed] == 1)
        {
          id v22 = [self defaultCenter];
          id v23 = [self sharedInstance];
          [v22 removeObserver:v18 name:AVAudioSessionInterruptionNotification object:v23];

          v18[v21] = 0;
        }
        if (qword_10006AE20 != -1) {
          swift_once();
        }
        sub_10002FDE0(0);
        [*(id *)&v18[OBJC_IVAR___AXLTCaptionsProvider_transcription] resetTranscribing:0];
        sub_1000204F0(0, (unint64_t *)&qword_10006BD30);
        uint64_t v24 = (void *)static OS_dispatch_queue.main.getter();
        uint64_t v25 = swift_allocObject();
        *(void *)(v25 + 16) = v18;
        aBlock[4] = (uint64_t)sub_10003BD00;
        aBlock[5] = v25;
        aBlock[0] = (uint64_t)_NSConcreteStackBlock;
        aBlock[1] = 1107296256;
        aBlock[2] = (uint64_t)sub_1000315AC;
        aBlock[3] = (uint64_t)&unk_100066F68;
        unint64_t v26 = _Block_copy(aBlock);
        uint64_t v27 = v18;
        swift_release();
        NSString v28 = v33;
        static DispatchQoS.unspecified.getter();
        aBlock[0] = (uint64_t)&_swiftEmptyArrayStorage;
        sub_10003C1F4((unint64_t *)&unk_10006C110, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
        sub_100006380(&qword_10006BD38);
        sub_10003BD08();
        id v29 = v35;
        dispatch thunk of SetAlgebra.init<A>(_:)();
        OS_dispatch_queue.async(group:qos:flags:execute:)();
        _Block_release(v26);

        (*(void (**)(char *, uint64_t))(v32 + 8))(v29, v2);
        return (*(uint64_t (**)(char *, uint64_t))(v34 + 8))(v28, v31);
      }
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_100038D3C(uint64_t a1)
{
  uint64_t v2 = (unsigned char *)(a1 + OBJC_IVAR___AXLTCaptionsProvider_isTranscribing);
  swift_beginAccess();
  if (*v2 == 1)
  {
    uint64_t v3 = (void *)(a1 + OBJC_IVAR___AXLTCaptionsProvider_activeRequestType);
    swift_beginAccess();
    if (!*v3)
    {
      if (qword_10006AE20 != -1) {
        swift_once();
      }
      sub_10002FDE0(1);
    }
  }
}

uint64_t sub_100038EE4()
{
  uint64_t v1 = type metadata accessor for AXLTCaptionActionsType();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)v15 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  AXLTCaptionsProvider.stopTranscribing()();
  if (qword_10006AE20 != -1) {
    swift_once();
  }
  uint64_t v5 = (unsigned char *)(static AXLTSettingsManager.shared + OBJC_IVAR___AXLTSettingsManager_isMicOn);
  swift_beginAccess();
  BOOL v6 = (*v5 & 1) == 0;
  uint64_t v7 = (BOOL *)(v0 + OBJC_IVAR___AXLTCaptionsProvider_activeRequestType);
  swift_beginAccess();
  BOOL *v7 = v6;
  AXLTCaptionsProvider.startTranscribing()();
  sub_100035A78(0, 0);
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  unint64_t v8 = *(void *)(v15[0] + 16);
  uint64_t result = swift_bridgeObjectRelease();
  if (v8 >= 2)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    static Published.subscript.getter();
    swift_release();
    swift_release();
    unint64_t v10 = *(void *)(v15[0] + 16);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, void, uint64_t))(v2 + 104))(v4, enum case for AXLTCaptionActionsType.AXLTCaptionActionsSeparate(_:), v1);
    swift_getKeyPath();
    swift_getKeyPath();
    os_log_type_t v11 = (void (*)(void *, void))static Published.subscript.modify();
    uint64_t v13 = v12;
    unint64_t v14 = *v12;
    uint64_t result = swift_isUniquelyReferenced_nonNull_native();
    void *v13 = v14;
    if (result)
    {
      if (v10 >= 2) {
        goto LABEL_6;
      }
    }
    else
    {
      uint64_t result = sub_10003B72C(v14);
      unint64_t v14 = result;
      void *v13 = result;
      if (v10 >= 2)
      {
LABEL_6:
        if (v10 - 2 < *(void *)(v14 + 16))
        {
          type metadata accessor for AXLTCaption();
          AXLTCaption.actionType.setter();
          v11(v15, 0);
          swift_release();
          return swift_release();
        }
LABEL_11:
        __break(1u);
        return result;
      }
    }
    __break(1u);
    goto LABEL_11;
  }
  return result;
}

uint64_t sub_10003921C()
{
  uint64_t v0 = type metadata accessor for AXLTCaptionActionsType();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)v12 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  static os_log_type_t.debug.getter();
  uint64_t result = (uint64_t)(id)AXLogLiveTranscription();
  if (!result) {
    goto LABEL_11;
  }
  uint64_t v5 = (void *)result;
  os_log(_:dso:log:_:_:)();

  sub_100035A78(0, 0);
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  unint64_t v6 = *(void *)(v12[0] + 16);
  uint64_t result = swift_bridgeObjectRelease();
  if (v6 < 2) {
    return result;
  }
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  unint64_t v7 = *(void *)(v12[0] + 16);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, enum case for AXLTCaptionActionsType.AXLTCaptionActionsSeparate(_:), v0);
  swift_getKeyPath();
  swift_getKeyPath();
  unint64_t v8 = (void (*)(void *, void))static Published.subscript.modify();
  unint64_t v10 = v9;
  unint64_t v11 = *v9;
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  *unint64_t v10 = v11;
  if (result)
  {
    if (v7 >= 2) {
      goto LABEL_5;
    }
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  uint64_t result = sub_10003B72C(v11);
  unint64_t v11 = result;
  *unint64_t v10 = result;
  if (v7 < 2) {
    goto LABEL_9;
  }
LABEL_5:
  if (v7 - 2 >= *(void *)(v11 + 16))
  {
LABEL_10:
    __break(1u);
LABEL_11:
    __break(1u);
    return result;
  }
  type metadata accessor for AXLTCaption();
  AXLTCaption.actionType.setter();
  v8(v12, 0);
  swift_release();
  return swift_release();
}

void AXLTCaptionsProvider.phoneCallListenerCallConnected(_:call:)()
{
  static os_log_type_t.default.getter();
  id v0 = (id)AXLogLiveTranscription();
  if (v0)
  {
    uint64_t v1 = v0;
    os_log(_:dso:log:_:_:)();

    if (qword_10006AE20 != -1) {
      swift_once();
    }
    uint64_t v2 = (unsigned char *)(static AXLTSettingsManager.shared + OBJC_IVAR___AXLTSettingsManager_inCallOn);
    swift_beginAccess();
    if (*v2 == 1)
    {
      AXLTCaptionsProvider.stopTranscribing()();
      AXLTCaptionsProvider.startTranscribing()();
    }
  }
  else
  {
    __break(1u);
  }
}

void AXLTCaptionsProvider.phoneCallListenerCallEnded(_:call:)()
{
  static os_log_type_t.default.getter();
  id v1 = (id)AXLogLiveTranscription();
  if (v1)
  {
    uint64_t v2 = v1;
    os_log(_:dso:log:_:_:)();

    if (*(void *)(v0 + OBJC_IVAR___AXLTCaptionsProvider_activePid) == -2)
    {
      sub_100039A1C();
      AXLTCaptionsProvider.stopTranscribing()();
      AXLTCaptionsProvider.startTranscribing()();
    }
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_100039A1C()
{
  uint64_t v39 = type metadata accessor for AXLTCaptionActionsType();
  uint64_t v38 = *(void *)(v39 - 8);
  __chkstk_darwin(v39);
  char v40 = (char *)&v38 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = (void *)type metadata accessor for AXLTCaption();
  uint64_t v50 = *(v3 - 1);
  __chkstk_darwin(v3);
  uint64_t v52 = (char *)&v38 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  unint64_t v7 = (char *)&v38 - v6;
  __chkstk_darwin(v8);
  BOOL v53 = (char *)&v38 - v9;
  static os_log_type_t.debug.getter();
  uint64_t result = (uint64_t)(id)AXLogLiveTranscription();
  if (!result) {
    goto LABEL_48;
  }
  unint64_t v11 = (void *)result;
  os_log(_:dso:log:_:_:)();

  swift_getKeyPath();
  swift_getKeyPath();
  unint64_t v48 = v0;
  static Published.subscript.getter();
  swift_release();
  swift_release();
  uint64_t v12 = v54[0];
  unint64_t v47 = *(void *)(v54[0] + 16);
  if (!v47)
  {
LABEL_19:
    swift_bridgeObjectRelease();
    unint64_t v0 = v48 + OBJC_IVAR___AXLTCaptionsProvider_unlockedCaptions;
    swift_beginAccess();
    unint64_t v47 = v0;
    uint64_t v26 = *(void *)v0;
    unint64_t v49 = *(unint64_t **)(*(void *)v0 + 16);
    if (!v49)
    {
LABEL_37:
      sub_100035A78(0, 0);
      swift_getKeyPath();
      swift_getKeyPath();
      static Published.subscript.getter();
      swift_release();
      swift_release();
      unint64_t v36 = *(void *)(v54[0] + 16);
      uint64_t result = swift_bridgeObjectRelease();
      if (v36 < 2) {
        return result;
      }
      swift_getKeyPath();
      swift_getKeyPath();
      static Published.subscript.getter();
      swift_release();
      swift_release();
      unint64_t v14 = *(unint64_t **)(v54[0] + 16);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, void, uint64_t))(v38 + 104))(v40, enum case for AXLTCaptionActionsType.AXLTCaptionActionsSeparate(_:), v39);
      swift_getKeyPath();
      swift_getKeyPath();
      unint64_t v1 = static Published.subscript.modify();
      uint64_t v3 = v37;
      unint64_t v0 = *v37;
      uint64_t result = swift_isUniquelyReferenced_nonNull_native();
      *uint64_t v3 = v0;
      if ((result & 1) == 0) {
        goto LABEL_45;
      }
      if ((unint64_t)v14 >= 2) {
        goto LABEL_40;
      }
LABEL_46:
      __break(1u);
LABEL_47:
      __break(1u);
LABEL_48:
      __break(1u);
      return result;
    }
    unint64_t v41 = (*(unsigned __int8 *)(v50 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v50 + 80);
    unint64_t v46 = v26 + v41;
    BOOL v53 = (char *)(v50 + 16);
    uint64_t v45 = AXLTCallID;
    unint64_t v27 = v50 + 8;
    swift_bridgeObjectRetain();
    unint64_t v14 = 0;
    uint64_t v43 = v26;
    while (1)
    {
      if ((unint64_t)v14 >= *(void *)(v26 + 16)) {
        goto LABEL_44;
      }
      uint64_t v28 = *(void *)(v50 + 72);
      id v29 = *(void (**)(char *, unint64_t, void *))(v50 + 16);
      v29(v52, v46 + v28 * (void)v14, v3);
      unint64_t v1 = AXLTCaption.appID.getter();
      unint64_t v0 = v30;
      if (v1 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v0 == v31) {
        break;
      }
      unint64_t v1 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v1) {
        goto LABEL_28;
      }
      (*(void (**)(char *, void *))v27)(v52, v3);
LABEL_22:
      unint64_t v14 = (unint64_t *)((char *)v14 + 1);
      if (v14 == v49)
      {
        swift_bridgeObjectRelease();
        goto LABEL_37;
      }
    }
    swift_bridgeObjectRelease_n();
LABEL_28:
    uint64_t v51 = v14;
    uint64_t v32 = *(void *)v47;
    uint64_t v33 = *(void *)(*(void *)v47 + 16);
    if (v33)
    {
      uint64_t v42 = v27 & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
      unint64_t v34 = v32 + v41;
      uint64_t v44 = v32;
      swift_bridgeObjectRetain();
      unint64_t v1 = 0;
      while (1)
      {
        v29(v7, v34, v3);
        sub_10003C1F4(&qword_10006C130, (void (*)(uint64_t))&type metadata accessor for AXLTCaption);
        unint64_t v0 = dispatch thunk of static Equatable.== infix(_:_:)();
        uint64_t v35 = *(void (**)(char *, void *))v27;
        (*(void (**)(char *, void *))v27)(v7, v3);
        if (v0) {
          break;
        }
        ++v1;
        v34 += v28;
        if (v33 == v1)
        {
          swift_bridgeObjectRelease();
          uint64_t v26 = v43;
          goto LABEL_34;
        }
      }
      swift_bridgeObjectRelease();
      unint64_t v0 = v47;
      swift_beginAccess();
      sub_100033C60(v1, (uint64_t)v7);
      v35(v7, v3);
      swift_endAccess();
      v35(v52, v3);
      uint64_t v26 = v43;
      unint64_t v14 = v51;
    }
    else
    {
      uint64_t v35 = *(void (**)(char *, void *))v27;
      uint64_t v26 = v43;
LABEL_34:
      v35(v52, v3);
      unint64_t v14 = v51;
    }
    goto LABEL_22;
  }
  uint64_t v13 = 0;
  unint64_t v41 = (*(unsigned __int8 *)(v50 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v50 + 80);
  uint64_t v42 = v54[0];
  unint64_t v46 = v54[0] + v41;
  uint64_t v51 = (unint64_t *)(v50 + 16);
  uint64_t v45 = AXLTCallID;
  unint64_t v14 = (unint64_t *)(v50 + 8);
  while ((unint64_t)v13 < *(void *)(v12 + 16))
  {
    uint64_t v15 = *(void *)(v50 + 72);
    uint64_t v16 = *(void (**)(char *, unint64_t, void *))(v50 + 16);
    v16(v53, v46 + v15 * (void)v13, v3);
    uint64_t v17 = AXLTCaption.appID.getter();
    unint64_t v0 = v18;
    if (v17 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v0 == v19)
    {
      swift_bridgeObjectRelease_n();
LABEL_11:
      unint64_t v49 = v13;
      swift_getKeyPath();
      swift_getKeyPath();
      static Published.subscript.getter();
      swift_release();
      swift_release();
      uint64_t v20 = *(void *)(v54[0] + 16);
      unint64_t v0 = (unint64_t)v14 & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
      if (v20)
      {
        uint64_t v43 = (unint64_t)v14 & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
        uint64_t v44 = v54[0];
        unint64_t v21 = 0;
        unint64_t v22 = v54[0] + v41;
        while (1)
        {
          v16(v7, v22, v3);
          sub_10003C1F4(&qword_10006C130, (void (*)(uint64_t))&type metadata accessor for AXLTCaption);
          char v23 = dispatch thunk of static Equatable.== infix(_:_:)();
          unint64_t v1 = *v14;
          ((void (*)(char *, void *))*v14)(v7, v3);
          if (v23) {
            break;
          }
          ++v21;
          v22 += v15;
          if (v20 == v21)
          {
            swift_bridgeObjectRelease();
            uint64_t v12 = v42;
            unint64_t v0 = v43;
            goto LABEL_17;
          }
        }
        swift_bridgeObjectRelease();
        swift_getKeyPath();
        swift_getKeyPath();
        uint64_t v24 = (void (*)(void *, void))static Published.subscript.modify();
        unint64_t v0 = v25;
        sub_100033C60(v21, (uint64_t)v7);
        ((void (*)(char *, void *))v1)(v7, v3);
        v24(v54, 0);
        swift_release();
        swift_release();
        ((void (*)(char *, void *))v1)(v53, v3);
        uint64_t v12 = v42;
        uint64_t v13 = v49;
      }
      else
      {
        swift_bridgeObjectRelease();
        unint64_t v1 = *v14;
LABEL_17:
        uint64_t v13 = v49;
        ((void (*)(char *, void *))v1)(v53, v3);
      }
      goto LABEL_5;
    }
    unint64_t v1 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v1) {
      goto LABEL_11;
    }
    ((void (*)(char *, void *))*v14)(v53, v3);
LABEL_5:
    uint64_t v13 = (unint64_t *)((char *)v13 + 1);
    if (v13 == (unint64_t *)v47) {
      goto LABEL_19;
    }
  }
  __break(1u);
LABEL_44:
  __break(1u);
LABEL_45:
  uint64_t result = sub_10003B72C(v0);
  unint64_t v0 = result;
  *uint64_t v3 = result;
  if ((unint64_t)v14 < 2) {
    goto LABEL_46;
  }
LABEL_40:
  if ((unint64_t)v14 - 2 >= *(void *)(v0 + 16)) {
    goto LABEL_47;
  }
  AXLTCaption.actionType.setter();
  ((void (*)(void *, void))v1)(v54, 0);
  swift_release();
  return swift_release();
}

Swift::Void __swiftcall AXLTCaptionsProvider.screenLockStateChanged(_:)(Swift::Bool a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_100006380(&qword_10006BDF0);
  __chkstk_darwin(v4 - 8);
  uint64_t v80 = (uint64_t)&v75 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)&v75 - v7;
  __chkstk_darwin(v9);
  unint64_t v11 = (char *)&v75 - v10;
  uint64_t v82 = type metadata accessor for AXLTCaption();
  uint64_t v12 = *(void *)(v82 - 8);
  __chkstk_darwin(v82);
  uint64_t v78 = (char *)&v75 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  uint64_t v79 = (char *)&v75 - v15;
  __chkstk_darwin(v16);
  unint64_t v76 = (char *)&v75 - v17;
  __chkstk_darwin(v18);
  uint64_t v20 = (char *)&v75 - v19;
  __chkstk_darwin(v21);
  char v23 = (char *)&v75 - v22;
  os_log_type_t v24 = static os_log_type_t.debug.getter();
  unint64_t v25 = (id)AXLogLiveTranscription();
  if (!v25) {
    goto LABEL_35;
  }
  uint64_t v26 = v25;
  BOOL v27 = os_log_type_enabled(v25, v24);
  uint64_t v77 = v8;
  if (v27)
  {
    uint64_t v28 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v28 = 67109120;
    LODWORD(v83[0]) = a1;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v26, v24, "screenLockStateChanged: %{BOOL}d", v28, 8u);
    swift_slowDealloc();
  }

  swift_getKeyPath();
  swift_getKeyPath();
  if (!a1)
  {
    static Published.subscript.getter();
    swift_release();
    swift_release();
    uint64_t v42 = v83[0];
    uint64_t v43 = &v2[OBJC_IVAR___AXLTCaptionsProvider_unlockedCaptions];
    swift_beginAccess();
    sub_10003AF50(v42);
    swift_endAccess();
    uint64_t v44 = *(void *)v43;
    swift_getKeyPath();
    swift_getKeyPath();
    v83[0] = v44;
    swift_bridgeObjectRetain();
    uint64_t v45 = v2;
    static Published.subscript.setter();
    *(void *)uint64_t v43 = &_swiftEmptyArrayStorage;
    swift_bridgeObjectRelease();
    return;
  }
  uint64_t v81 = v12;
  static Published.subscript.getter();
  swift_release();
  swift_release();
  uint64_t v29 = *(void *)(v83[0] + 16);
  swift_bridgeObjectRelease();
  if (!v29) {
    goto LABEL_15;
  }
  swift_getKeyPath();
  unint64_t v30 = (unint64_t *)&unk_100054778;
  unint64_t KeyPath = (void (*)(char *, uint64_t, char *))swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  unint64_t v32 = *(void *)(v83[0] + 16);
  swift_bridgeObjectRelease();
  unint64_t v33 = swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  if (v32)
  {
    unint64_t v33 = v83[0];
    if (v32 <= *(void *)(v83[0] + 16))
    {
      unint64_t v34 = v32 - 1;
      uint64_t v35 = v81;
      uint64_t v36 = v82;
      (*(void (**)(char *, unint64_t, uint64_t))(v81 + 16))(v23, v83[0]+ ((*(unsigned __int8 *)(v35 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v35 + 80))+ *(void *)(v81 + 72) * v34, v82);
      swift_bridgeObjectRelease();
      uint64_t v37 = AXLTCaption.appID.getter();
      uint64_t v39 = v38;
      char v40 = *(void (**)(char *, uint64_t))(v35 + 8);
      v40(v23, v36);
      if (v37 == placeholderID.getter() && v39 == v41)
      {
        swift_bridgeObjectRelease_n();
      }
      else
      {
        char v46 = _stringCompareWithSmolCheck(_:_:expecting:)();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v46 & 1) == 0) {
          goto LABEL_15;
        }
      }
      swift_getKeyPath();
      swift_getKeyPath();
      static Published.subscript.getter();
      swift_release();
      swift_release();
      uint64_t v47 = *(void *)(v83[0] + 16);
      swift_bridgeObjectRelease();
      if (v47 == 1) {
        return;
      }
      swift_getKeyPath();
      swift_getKeyPath();
      static Published.subscript.getter();
      swift_release();
      swift_release();
      uint64_t v48 = *(void *)(v83[0] + 16);
      swift_bridgeObjectRelease();
      swift_getKeyPath();
      swift_getKeyPath();
      unint64_t v49 = (void (*)(void *, void))static Published.subscript.modify();
      sub_100033C60(v48 - 1, (uint64_t)v20);
      v40(v20, v82);
      v49(v83, 0);
      swift_release();
      swift_release();
LABEL_15:
      swift_getKeyPath();
      swift_getKeyPath();
      static Published.subscript.getter();
      swift_release();
      swift_release();
      uint64_t v50 = *(void *)(v83[0] + 16);
      swift_bridgeObjectRelease();
      uint64_t v51 = v81;
      uint64_t v20 = (char *)v82;
      if (!v50) {
        goto LABEL_22;
      }
      uint64_t v52 = (uint64_t)&v2[OBJC_IVAR___AXLTCaptionsProvider_lastFinalCaption];
      swift_beginAccess();
      sub_10003B6C4(v52, (uint64_t)v11);
      if ((*(unsigned int (**)(char *, uint64_t, char *))(v51 + 48))(v11, 1, v20) == 1)
      {
        sub_1000067B8((uint64_t)v11, &qword_10006BDF0);
        goto LABEL_22;
      }
      (*(void (**)(char *, char *, char *))(v51 + 32))(v76, v11, v20);
      swift_getKeyPath();
      swift_getKeyPath();
      static Published.subscript.getter();
      swift_release();
      swift_release();
      unint64_t v53 = *(void *)(v83[0] + 16);
      swift_bridgeObjectRelease();
      swift_getKeyPath();
      swift_getKeyPath();
      NSString v54 = (void (*)(void *, void))static Published.subscript.modify();
      char v56 = v55;
      unint64_t v57 = *v55;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      *char v56 = v57;
      if (isUniquelyReferenced_nonNull_native)
      {
        if (v53) {
          goto LABEL_20;
        }
      }
      else
      {
        unint64_t v57 = sub_10003B72C(v57);
        *char v56 = v57;
        if (v53)
        {
LABEL_20:
          if (v53 <= *(void *)(v57 + 16))
          {
            unint64_t v59 = v57
                + ((*(unsigned __int8 *)(v51 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v51 + 80))
                + *(void *)(v51 + 72) * (v53 - 1);
            double v60 = v76;
            (*(void (**)(unint64_t, char *, char *))(v51 + 24))(v59, v76, v20);
            v54(v83, 0);
            swift_release();
            swift_release();
            (*(void (**)(char *, char *))(v51 + 8))(v60, v20);
LABEL_22:
            uint64_t v61 = (uint64_t)v77;
            (*(void (**)(char *, uint64_t, uint64_t, char *))(v51 + 56))(v77, 1, 1, v20);
            uint64_t v62 = (uint64_t)&v2[OBJC_IVAR___AXLTCaptionsProvider_lastFinalCaption];
            swift_beginAccess();
            sub_10003B610(v61, v62);
            swift_endAccess();
            swift_getKeyPath();
            swift_getKeyPath();
            static Published.subscript.getter();
            swift_release();
            swift_release();
            uint64_t v63 = v83[0];
            char v64 = &v2[OBJC_IVAR___AXLTCaptionsProvider_unlockedCaptions];
            swift_beginAccess();
            *(void *)char v64 = v63;
            swift_bridgeObjectRelease();
            swift_getKeyPath();
            swift_getKeyPath();
            uint64_t v65 = (void (*)(void *, void))static Published.subscript.modify();
            *os_log_type_t v66 = &_swiftEmptyArrayStorage;
            swift_bridgeObjectRelease();
            v65(v83, 0);
            swift_release();
            swift_release();
            uint64_t v67 = (uint64_t)&v2[OBJC_IVAR___AXLTCaptionsProvider_currentCaption];
            swift_beginAccess();
            uint64_t v68 = v80;
            sub_10003B6C4(v67, v80);
            if ((*(unsigned int (**)(uint64_t, uint64_t, char *))(v51 + 48))(v68, 1, v20) == 1)
            {
              sub_1000067B8(v68, &qword_10006BDF0);
              sub_100035A78(0, 0);
              return;
            }
            unint64_t KeyPath = *(void (**)(char *, uint64_t, char *))(v51 + 32);
            uint64_t v69 = v79;
            KeyPath(v79, v68, v20);
            (*(void (**)(char *, char *, char *))(v51 + 16))(v78, v69, v20);
            swift_getKeyPath();
            swift_getKeyPath();
            uint64_t v2 = (char *)static Published.subscript.modify();
            unint64_t v30 = v70;
            unint64_t v33 = *v70;
            char v71 = swift_isUniquelyReferenced_nonNull_native();
            *unint64_t v30 = v33;
            if (v71) {
              goto LABEL_25;
            }
            goto LABEL_31;
          }
          goto LABEL_34;
        }
      }
      __break(1u);
LABEL_34:
      __break(1u);
LABEL_35:
      __break(1u);
      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
LABEL_31:
  unint64_t v33 = sub_10003B3A8(0, *(void *)(v33 + 16) + 1, 1, v33);
  *unint64_t v30 = v33;
LABEL_25:
  unint64_t v73 = *(void *)(v33 + 16);
  unint64_t v72 = *(void *)(v33 + 24);
  if (v73 >= v72 >> 1)
  {
    unint64_t v33 = sub_10003B3A8(v72 > 1, v73 + 1, 1, v33);
    *unint64_t v30 = v33;
  }
  *(void *)(v33 + 16) = v73 + 1;
  uint64_t v74 = v81;
  KeyPath((char *)(v33+ ((*(unsigned __int8 *)(v74 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v74 + 80))+ *(void *)(v81 + 72) * v73), (uint64_t)v78, v20);
  ((void (*)(void *, void))v2)(v83, 0);
  swift_release();
  swift_release();
  (*(void (**)(char *, char *))(v74 + 8))(v79, v20);
}

uint64_t sub_10003AF50(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  unint64_t v3 = *v1;
  int64_t v4 = *(void *)(*v1 + 16);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  if (isUniquelyReferenced_nonNull_native && v5 <= *(void *)(v3 + 24) >> 1)
  {
    if (*(void *)(a1 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_18;
  }
  if (v4 <= v5) {
    int64_t v22 = v4 + v2;
  }
  else {
    int64_t v22 = v4;
  }
  unint64_t v3 = sub_10003B3A8(isUniquelyReferenced_nonNull_native, v22, 1, v3);
  if (!*(void *)(a1 + 16))
  {
LABEL_18:
    if (!v2) {
      goto LABEL_19;
    }
    goto LABEL_21;
  }
LABEL_5:
  uint64_t v8 = *(void *)(v3 + 16);
  uint64_t v9 = (*(void *)(v3 + 24) >> 1) - v8;
  uint64_t v10 = *(void *)(type metadata accessor for AXLTCaption() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  if (v9 < v2)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  unint64_t v13 = v3 + v12 + v11 * v8;
  unint64_t v14 = a1 + v12;
  uint64_t v15 = v11 * v2;
  unint64_t v16 = v13 + v15;
  unint64_t v17 = v14 + v15;
  if (v14 < v16 && v13 < v17) {
    goto LABEL_24;
  }
  swift_arrayInitWithCopy();
  if (!v2)
  {
LABEL_19:
    uint64_t result = swift_bridgeObjectRelease();
    unint64_t *v1 = v3;
    return result;
  }
  uint64_t v19 = *(void *)(v3 + 16);
  BOOL v20 = __OFADD__(v19, v2);
  uint64_t v21 = v19 + v2;
  if (!v20)
  {
    *(void *)(v3 + 16) = v21;
    goto LABEL_19;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_10003B148@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for AXLTCaptionsProvider();
  uint64_t result = ObservableObject<>.objectWillChange.getter();
  *a1 = result;
  return result;
}

char *sub_10003B188(char *result, int64_t a2, char a3, char *a4)
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
      sub_100006380(&qword_10006C158);
      uint64_t v10 = (char *)swift_allocObject();
      int64_t v11 = j__malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 1;
      }
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * (v12 >> 5);
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
        if (v10 != a4 || v13 >= &a4[32 * v8 + 32]) {
          memmove(v13, a4 + 32, 32 * v8);
        }
        *((void *)a4 + 2) = 0;
        goto LABEL_24;
      }
    }
    sub_10003B9D0(0, v8, v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

char *sub_10003B298(char *result, int64_t a2, char a3, char *a4)
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
      sub_100006380((uint64_t *)&unk_10006C100);
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
    sub_10003BC14(0, v8, v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_10003B3A8(char a1, int64_t a2, char a3, unint64_t a4)
{
  if (a3)
  {
    unint64_t v6 = *(void *)(a4 + 24);
    uint64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_29;
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
  if (!v9)
  {
    unint64_t v13 = &_swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  sub_100006380((uint64_t *)&unk_10006C160);
  uint64_t v10 = *(void *)(type metadata accessor for AXLTCaption() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  unint64_t v13 = (void *)swift_allocObject();
  size_t v14 = j__malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (BOOL v15 = v11 == -1) : (BOOL v15 = 0), v15))
  {
LABEL_29:
    uint64_t result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
    return result;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  uint64_t v16 = *(void *)(type metadata accessor for AXLTCaption() - 8);
  unint64_t v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  unint64_t v18 = (unint64_t)v13 + v17;
  if (a1)
  {
    if ((unint64_t)v13 < a4 || v18 >= a4 + v17 + *(void *)(v16 + 72) * v8)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != (void *)a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_10003BABC(0, v8, v18, a4);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v13;
}

uint64_t sub_10003B610(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100006380(&qword_10006BDF0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t type metadata accessor for AXLTCaptionsProvider()
{
  uint64_t result = qword_10006C0D8;
  if (!qword_10006C0D8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_10003B6C4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100006380(&qword_10006BDF0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10003B72C(unint64_t a1)
{
  return sub_10003B3A8(0, *(void *)(a1 + 16), 0, a1);
}

uint64_t sub_10003B740()
{
  return type metadata accessor for AXLTCaptionsProvider();
}

void sub_10003B748()
{
  sub_10003B8B0();
  if (v0 <= 0x3F)
  {
    sub_10003B90C();
    if (v1 <= 0x3F)
    {
      sub_10003B964();
      if (v2 <= 0x3F) {
        swift_updateClassMetadata2();
      }
    }
  }
}

void sub_10003B8B0()
{
  if (!qword_10006C0E8)
  {
    sub_10000646C(&qword_10006BF40);
    unint64_t v0 = type metadata accessor for Published();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_10006C0E8);
    }
  }
}

void sub_10003B90C()
{
  if (!qword_10006C0F0)
  {
    unint64_t v0 = type metadata accessor for Published();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_10006C0F0);
    }
  }
}

void sub_10003B964()
{
  if (!qword_10006C0F8)
  {
    type metadata accessor for AXLTCaption();
    unint64_t v0 = type metadata accessor for Optional();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_10006C0F8);
    }
  }
}

char *sub_10003B9BC(uint64_t a1)
{
  return sub_10003B298(0, *(void *)(a1 + 16), 0, (char *)a1);
}

char *sub_10003B9D0(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    char v5 = (char *)(a4 + 32 * a1 + 32);
    size_t v6 = 32 * v4;
    uint64_t v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  uint64_t result = (char *)_fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_10003BABC(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v8 = *(void *)(type metadata accessor for AXLTCaption() - 8);
    uint64_t v9 = a4 + ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));
    uint64_t v10 = *(void *)(v8 + 72);
    unint64_t v11 = v9 + v10 * a1;
    unint64_t v12 = a3 + v10 * v4;
    if (v11 >= v12 || v11 + v10 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v12;
    }
  }
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

char *sub_10003BC14(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    char v5 = (char *)(a4 + 8 * a1 + 32);
    size_t v6 = 8 * v4;
    uint64_t v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  uint64_t result = (char *)_fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

void sub_10003BD00()
{
  sub_100038D3C(*(void *)(v0 + 16));
}

unint64_t sub_10003BD08()
{
  unint64_t result = qword_10006C120;
  if (!qword_10006C120)
  {
    sub_10000646C(&qword_10006BD38);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006C120);
  }
  return result;
}

uint64_t sub_10003BD64()
{
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 32, 7);
}

unint64_t sub_10003BD9C()
{
  unint64_t result = qword_10006C148;
  if (!qword_10006C148)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006C148);
  }
  return result;
}

uint64_t sub_10003BDF0()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

id sub_10003BE30(uint64_t a1)
{
  return sub_100035604(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

void sub_10003BE38(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for Notification();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  char v5 = (char *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  os_log_type_t v6 = static os_log_type_t.debug.getter();
  uint64_t v7 = (id)AXLogLiveTranscription();
  if (!v7)
  {
    __break(1u);
    return;
  }
  uint64_t v8 = v7;
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, a1, v2);
  os_log_type_t v9 = v6;
  if (os_log_type_enabled(v8, v6))
  {
    uint64_t v10 = (uint8_t *)swift_slowAlloc();
    uint64_t v11 = swift_slowAlloc();
    uint64_t v20 = a1;
    v23[0] = v11;
    *(_DWORD *)uint64_t v10 = 136315138;
    sub_10003C1F4(&qword_10006C128, (void (*)(uint64_t))&type metadata accessor for Notification);
    uint64_t v12 = dispatch thunk of CustomStringConvertible.description.getter();
    *(void *)&long long v24 = sub_10000E634(v12, v13, v23);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "CaptionsProvider AudioSession interruption: %s", v10, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  uint64_t v14 = Notification.userInfo.getter();
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v21 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v22 = v16;
    AnyHashable.init<A>(_:)();
    if (*(void *)(v15 + 16) && (unint64_t v17 = sub_1000486C0((uint64_t)v23), (v18 & 1) != 0))
    {
      sub_10000E914(*(void *)(v15 + 56) + 32 * v17, (uint64_t)&v24);
    }
    else
    {
      long long v24 = 0u;
      long long v25 = 0u;
    }
    swift_bridgeObjectRelease();
    sub_10000ED94((uint64_t)v23);
    if (!*((void *)&v25 + 1))
    {
      sub_1000067B8((uint64_t)&v24, &qword_10006C150);
      return;
    }
    if (swift_dynamicCast())
    {
      if (v21)
      {
        if (v21 != 1) {
          return;
        }
        if (qword_10006AE20 != -1) {
          swift_once();
        }
        char v19 = 0;
      }
      else
      {
        if (qword_10006AE20 != -1) {
          swift_once();
        }
        char v19 = 1;
      }
      sub_10002FDE0(v19);
    }
  }
}

uint64_t sub_10003C1F4(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_10003C23C(uint64_t a1)
{
  return sub_100034150(a1, *(void *)(v1 + 16));
}

uint64_t sub_10003C270@<X0>(char a1@<W0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char a4@<W3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  *(_OWORD *)a7 = xmmword_100054880;
  *(void *)(a7 + 48) = nullsub_1;
  *(void *)(a7 + 56) = 0;
  State.init(wrappedValue:)();
  *(unsigned char *)(a7 + 96) = v21;
  *(void *)(a7 + 104) = v22;
  State.init(wrappedValue:)();
  *(void *)(a7 + 112) = v21;
  *(void *)(a7 + 120) = v22;
  State.init(wrappedValue:)();
  *(void *)(a7 + 128) = v21;
  *(void *)(a7 + 136) = v22;
  type metadata accessor for ButtonView();
  AccessibilityFocusState.init<>()();
  *(unsigned char *)(a7 + 16) = a1;
  if (a5)
  {
    uint64_t v14 = swift_allocObject();
    *(void *)(v14 + 16) = a5;
    *(void *)(v14 + 24) = a6;
    uint64_t v15 = sub_10000A220;
  }
  else
  {
    uint64_t v15 = nullsub_1;
    uint64_t v14 = 0;
  }
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = v15;
  *(void *)(v16 + 24) = v14;
  sub_10000A200(a5);
  swift_release();
  *(void *)(a7 + 48) = sub_10000A1F8;
  *(void *)(a7 + 56) = v16;
  *(void *)(a7 + 24) = a2;
  *(void *)(a7 + 32) = a3;
  *(unsigned char *)(a7 + 40) = a4;
  unint64_t v17 = 0xEA00000000006C6CLL;
  unint64_t v18 = 0x69662E6573756170;
  switch(a1)
  {
    case 1:
      unint64_t v17 = 0xE800000000000000;
      unint64_t v18 = 0x6C6C69662E63696DLL;
      break;
    case 2:
      char v19 = "arrow.down.forward.and.arrow.up.backward";
      goto LABEL_8;
    case 3:
      char v19 = "arrow.up.backward.and.arrow.down.forward";
LABEL_8:
      unint64_t v17 = (unint64_t)(v19 - 32) | 0x8000000000000000;
      unint64_t v18 = 0xD000000000000028;
      break;
    case 4:
      unint64_t v18 = 0xD000000000000010;
      unint64_t v17 = 0x8000000100056780;
      break;
    default:
      break;
  }
  uint64_t result = sub_10000A210(a5);
  *(void *)(a7 + 64) = v18;
  *(void *)(a7 + 72) = v17;
  *(void *)(a7 + 80) = v18;
  *(void *)(a7 + 88) = v17;
  return result;
}

Swift::Double *buttonBackgroundOpacity.unsafeMutableAddressor()
{
  return &buttonBackgroundOpacity;
}

unsigned char *storeEnumTagSinglePayload for ButtonType(unsigned char *result, unsigned int a2, unsigned int a3)
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
    char *result = a2 + 4;
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
        JUMPOUT(0x10003C5B8);
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
          char *result = a2 + 4;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ButtonType()
{
  return &type metadata for ButtonType;
}

unint64_t sub_10003C5F4()
{
  unint64_t result = qword_10006C180;
  if (!qword_10006C180)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006C180);
  }
  return result;
}

uint64_t type metadata accessor for ButtonView()
{
  uint64_t result = qword_10006C1F0;
  if (!qword_10006C1F0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_10003C694@<X0>(char *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v233 = a1;
  uint64_t v227 = a3;
  uint64_t v4 = type metadata accessor for NSNotificationCenter.Publisher();
  char v225 = *(void **)(v4 - 8);
  uint64_t v226 = v4;
  __chkstk_darwin(v4);
  uint64_t v224 = (char *)&v177 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  unsigned int v6 = (void *)type metadata accessor for GeometryProxy();
  unint64_t v211 = (void (**)(char *, void, id))*(v6 - 1);
  id v212 = v6;
  __chkstk_darwin(v6);
  uint64_t v209 = v7;
  uint64_t v210 = (char *)&v177 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for AccessibilityTraits();
  uint64_t v206 = *(void *)(v8 - 8);
  uint64_t v207 = v8;
  __chkstk_darwin(v8);
  int v205 = (char *)&v177 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v238 = type metadata accessor for PlainButtonStyle();
  uint64_t v188 = *(void *)(v238 - 8);
  __chkstk_darwin(v238);
  uint64_t v186 = (char *)&v177 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v185 = sub_100006380(&qword_10006C258);
  uint64_t v182 = *(void *)(v185 - 8);
  __chkstk_darwin(v185);
  uint64_t v179 = (char *)&v177 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100006380(&qword_10006C260);
  uint64_t v180 = *(void *)(v12 - 8);
  uint64_t v181 = v12;
  __chkstk_darwin(v12);
  uint64_t v178 = (char *)&v177 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v177 = sub_100006380(&qword_10006C268);
  __chkstk_darwin(v177);
  uint64_t v189 = (char *)&v177 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v184 = sub_100006380(&qword_10006C270);
  __chkstk_darwin(v184);
  uint64_t v187 = (uint64_t)&v177 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v183 = sub_100006380(&qword_10006C278);
  __chkstk_darwin(v183);
  uint64_t v190 = (uint64_t)&v177 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v191 = sub_100006380(&qword_10006C280);
  __chkstk_darwin(v191);
  uint64_t v192 = (uint64_t)&v177 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v198 = sub_100006380(&qword_10006C288);
  __chkstk_darwin(v198);
  uint64_t v194 = (char *)&v177 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v19);
  uint64_t v196 = (char *)&v177 - v20;
  __chkstk_darwin(v21);
  uint64_t v197 = (char *)&v177 - v22;
  uint64_t v23 = sub_100006380(&qword_10006C290);
  uint64_t v201 = *(void *)(v23 - 8);
  uint64_t v202 = v23;
  __chkstk_darwin(v23);
  uint64_t v200 = (char *)&v177 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v199 = sub_100006380(&qword_10006C298);
  __chkstk_darwin(v199);
  uint64_t v204 = (char *)&v177 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v203 = sub_100006380(&qword_10006C2A0);
  __chkstk_darwin(v203);
  uint64_t v208 = (uint64_t)&v177 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v231 = sub_100006380(&qword_10006C2A8);
  __chkstk_darwin(v231);
  uint64_t v213 = (uint64_t)&v177 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = sub_100006380(&qword_10006C2B0);
  uint64_t v218 = *(void *)(v28 - 8);
  uint64_t v219 = v28;
  __chkstk_darwin(v28);
  long long v217 = (char *)&v177 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v30 = sub_100006380(&qword_10006C2B8);
  uint64_t v222 = *(void *)(v30 - 8);
  uint64_t v223 = v30;
  __chkstk_darwin(v30);
  char v221 = (char *)&v177 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v32);
  uint64_t v214 = (char *)&v177 - v33;
  __chkstk_darwin(v34);
  uint64_t v220 = (char *)&v177 - v35;
  uint64_t v193 = type metadata accessor for ButtonView();
  uint64_t v235 = *(void *)(v193 - 8);
  uint64_t v36 = *(void *)(v235 + 64);
  __chkstk_darwin(v193);
  uint64_t v236 = (uint64_t)&v177 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v37);
  uint64_t v234 = (char *)&v177 - v38;
  __chkstk_darwin(v39);
  uint64_t v41 = (char *)&v177 - v40;
  __chkstk_darwin(v42);
  uint64_t v44 = (char *)&v177 - v43;
  uint64_t v232 = static Color.white.getter();
  uint64_t v46 = *(void *)(a2 + 120);
  char v248 = *(void **)(a2 + 112);
  uint64_t v45 = v248;
  uint64_t v249 = v46;
  sub_100006380(&qword_10006B1D0);
  State.wrappedValue.getter();
  char v248 = v45;
  uint64_t v249 = v46;
  State.wrappedValue.getter();
  static Alignment.center.getter();
  _FrameLayout.init(width:height:alignment:)();
  unsigned __int8 v47 = v276;
  uint64_t v229 = v275;
  uint64_t v230 = v277;
  unsigned __int8 v48 = v278;
  uint64_t v215 = v280;
  uint64_t v216 = v279;
  GeometryProxy.size.getter();
  double v50 = v49;
  char v248 = v45;
  uint64_t v249 = v46;
  State.wrappedValue.getter();
  double v51 = *(double *)&v239;
  int v52 = *(unsigned __int8 *)(a2 + 16);
  uint64_t v237 = a2;
  sub_10000A858(a2, (uint64_t)v44);
  double v195 = v51;
  if (v52 == 1)
  {
    sub_10000A8BC((uint64_t)v44);
    sub_10000A858(v237, (uint64_t)v41);
  }
  else
  {
    int v53 = v44[16];
    sub_10000A8BC((uint64_t)v44);
    sub_10000A858(v237, (uint64_t)v41);
    if (v53)
    {
      sub_10000A8BC((uint64_t)v41);
      uint64_t v54 = v238;
      goto LABEL_7;
    }
  }
  uint64_t v55 = *((void *)v41 + 13);
  LOBYTE(v248) = v41[96];
  uint64_t v249 = v55;
  sub_100006380(&qword_10006B638);
  State.wrappedValue.getter();
  char v56 = v239;
  sub_10000A8BC((uint64_t)v41);
  uint64_t v54 = v238;
  if (v56)
  {
    uint64_t v57 = 0x3FECCCCCCCCCCCCDLL;
    goto LABEL_8;
  }
LABEL_7:
  uint64_t v57 = 0x3FB999999999999ALL;
LABEL_8:
  uint64_t v59 = (uint64_t)v234;
  uint64_t v58 = v235;
  int v228 = static Edge.Set.top.getter();
  EdgeInsets.init(_all:)();
  uint64_t v61 = v60;
  uint64_t v63 = v62;
  uint64_t v65 = v64;
  uint64_t v67 = v66;
  unsigned __int8 v272 = v47;
  unsigned __int8 v270 = v48;
  unsigned __int8 v267 = 0;
  uint64_t v68 = (void *)v237;
  sub_10000A858(v237, v59);
  uint64_t v69 = *(unsigned __int8 *)(v58 + 80);
  uint64_t v70 = (v69 + 16) & ~v69;
  uint64_t v234 = (char *)(v70 + v36);
  uint64_t v238 = v69 | 7;
  uint64_t v71 = swift_allocObject();
  uint64_t v235 = v70;
  uint64_t v72 = sub_10003FB98(v59, v71 + v70);
  __chkstk_darwin(v72);
  *(&v177 - 2) = (uint64_t)v68;
  sub_100006380(&qword_10006BB08);
  sub_100026A7C();
  unint64_t v73 = v179;
  Button.init(action:label:)();
  uint64_t v74 = v186;
  PlainButtonStyle.init()();
  sub_1000068B8(&qword_10006C2C0, &qword_10006C258);
  sub_10004002C(&qword_10006C2C8, (void (*)(uint64_t))&type metadata accessor for PlainButtonStyle);
  uint64_t v75 = v178;
  uint64_t v76 = v185;
  View.buttonStyle<A>(_:)();
  (*(void (**)(char *, uint64_t))(v188 + 8))(v74, v54);
  (*(void (**)(char *, uint64_t))(v182 + 8))(v73, v76);
  uint64_t v77 = v68[1];
  uint64_t v79 = v180;
  uint64_t v78 = v181;
  uint64_t v80 = (uint64_t)v189;
  (*(void (**)(char *, char *, uint64_t))(v180 + 16))(v189, v75, v181);
  *(void *)(v80 + *(int *)(v177 + 36)) = v77;
  (*(void (**)(char *, uint64_t))(v79 + 8))(v75, v78);
  uint64_t v82 = v68[15];
  char v248 = (void *)v68[14];
  uint64_t v81 = v248;
  uint64_t v249 = v82;
  State.wrappedValue.getter();
  char v248 = v81;
  uint64_t v249 = v82;
  State.wrappedValue.getter();
  static Alignment.center.getter();
  _FrameLayout.init(width:height:alignment:)();
  uint64_t v83 = v187;
  sub_100006754(v80, v187, &qword_10006C268);
  uint64_t v84 = (_OWORD *)(v83 + *(int *)(v184 + 36));
  long long v85 = v282;
  *uint64_t v84 = v281;
  v84[1] = v85;
  v84[2] = v283;
  sub_1000067B8(v80, &qword_10006C268);
  uint64_t v86 = v190;
  sub_100006754(v83, v190, &qword_10006C270);
  uint64_t v87 = v86 + *(int *)(v183 + 36);
  *(void *)uint64_t v87 = 0;
  *(void *)(v87 + 8) = 0;
  *(unsigned char *)(v87 + 16) = 0;
  sub_1000067B8(v83, &qword_10006C270);
  GeometryProxy.size.getter();
  double v89 = v88 * 0.5;
  uint64_t v90 = v68[15];
  char v248 = (void *)v68[14];
  uint64_t v249 = v90;
  State.wrappedValue.getter();
  double v91 = v89 - *(double *)&v239 * 0.5;
  uint64_t v92 = v192;
  sub_100006754(v86, v192, &qword_10006C278);
  uint64_t v93 = v92 + *(int *)(v191 + 36);
  *(double *)uint64_t v93 = v91;
  *(void *)(v93 + 8) = 0;
  sub_1000067B8(v86, &qword_10006C278);
  char v248 = (void *)sub_10003E448();
  uint64_t v249 = v94;
  sub_10000EFF4();
  uint64_t v95 = Text.init<A>(_:)();
  uint64_t v97 = v96;
  LOBYTE(v73) = v98 & 1;
  sub_10003FCE8(&qword_10006C2D0, &qword_10006C280, (void (*)(void))sub_10003FD64);
  uint64_t v99 = (uint64_t)v194;
  View.accessibility(label:)();
  sub_10000F048(v95, v97, (char)v73);
  swift_bridgeObjectRelease();
  sub_1000067B8(v92, &qword_10006C280);
  uint64_t v101 = v205;
  uint64_t v100 = v206;
  uint64_t v102 = (uint64_t)v196;
  ModifiedContent<>.accessibility(identifier:)();
  swift_bridgeObjectRelease();
  sub_1000067B8(v99, &qword_10006C288);
  uint64_t v103 = *(void *)(v237 + 104);
  LOBYTE(v248) = *(unsigned char *)(v237 + 96);
  uint64_t v249 = v103;
  sub_100006380(&qword_10006B638);
  State.wrappedValue.getter();
  if (v239 == 1)
  {
    sub_100006380(&qword_10006C338);
    uint64_t v104 = swift_allocObject();
    *(_OWORD *)(v104 + 16) = xmmword_100054300;
    static AccessibilityTraits.isSelected.getter();
    char v248 = (void *)v104;
  }
  else
  {
    char v248 = &_swiftEmptyArrayStorage;
  }
  sub_10004002C(&qword_10006C300, (void (*)(uint64_t))&type metadata accessor for AccessibilityTraits);
  sub_100006380(&qword_10006C308);
  sub_1000068B8(&qword_10006C310, &qword_10006C308);
  uint64_t v105 = v207;
  dispatch thunk of SetAlgebra.init<A>(_:)();
  uint64_t v106 = (uint64_t)v197;
  ModifiedContent<>.accessibilityAddTraits(_:)();
  (*(void (**)(char *, uint64_t))(v100 + 8))(v101, v105);
  sub_1000067B8(v102, &qword_10006C288);
  uint64_t v107 = v237;
  uint64_t v108 = v237 + *(int *)(v193 + 56);
  uint64_t v206 = sub_100006380(&qword_10006C190);
  uint64_t v207 = v108;
  AccessibilityFocusState.projectedValue.getter();
  sub_10003FF54();
  unint64_t v109 = v200;
  View.accessibilityFocused(_:)();
  swift_release();
  swift_release();
  sub_1000067B8(v106, &qword_10006C288);
  uint64_t v110 = v107;
  uint64_t v111 = v236;
  sub_10000A858(v110, v236);
  uint64_t v113 = v210;
  uint64_t v112 = v211;
  id v114 = v212;
  ((void (**)(char *, char *, id))v211)[2](v210, v233, v212);
  unint64_t v115 = (unint64_t)&v234[*((unsigned __int8 *)v112 + 80)] & ~(unint64_t)*((unsigned __int8 *)v112 + 80);
  uint64_t v116 = swift_allocObject();
  sub_10003FB98(v111, v116 + v235);
  ((void (**)(char *, char *, id))v112)[4]((char *)(v116 + v115), v113, v114);
  uint64_t v118 = v201;
  uint64_t v117 = v202;
  uint64_t v119 = (uint64_t)v204;
  (*(void (**)(char *, char *, uint64_t))(v201 + 16))(v204, v109, v202);
  long long v120 = (uint64_t (**)())(v119 + *(int *)(v199 + 36));
  char *v120 = sub_100040290;
  v120[1] = (uint64_t (*)())v116;
  v120[2] = 0;
  v120[3] = 0;
  (*(void (**)(char *, uint64_t))(v118 + 8))(v109, v117);
  id v212 = self;
  id v121 = [v212 defaultCenter];
  uint64_t v122 = v225;
  if (qword_10006ADC0 != -1) {
    swift_once();
  }
  uint64_t v123 = v224;
  NSNotificationCenter.publisher(for:object:)();

  uint64_t v125 = v236;
  uint64_t v124 = v237;
  sub_10000A858(v237, v236);
  uint64_t v126 = swift_allocObject();
  sub_10003FB98(v125, v126 + v235);
  uint64_t v127 = v208;
  sub_100006754(v119, v208, &qword_10006C298);
  uint64_t v128 = v203;
  uint64_t v129 = v127 + *(int *)(v203 + 52);
  uint64_t v130 = (void (**)(char *, void, id))v122[2];
  uint64_t v131 = v226;
  uint64_t v233 = (char *)(v122 + 2);
  unint64_t v211 = v130;
  ((void (*)(uint64_t, char *, uint64_t))v130)(v129, v123, v226);
  uint64_t v132 = (uint64_t (**)(uint64_t))(v127 + *(int *)(v128 + 56));
  *uint64_t v132 = sub_100040360;
  v132[1] = (uint64_t (*)(uint64_t))v126;
  uint64_t v133 = v123;
  uint64_t v134 = v124;
  uint64_t v135 = v125;
  uint64_t v136 = v131;
  char v225 = (void *)v122[1];
  ((void (*)(char *, uint64_t))v225)(v133, v131);
  sub_1000067B8(v119, &qword_10006C298);
  id v137 = [v212 defaultCenter];
  if (qword_10006ADC8 != -1) {
    swift_once();
  }
  *(double *)&unint64_t v138 = v50 * 0.5 - v195 * 0.5;
  NSNotificationCenter.publisher(for:object:)();

  uint64_t v139 = v134;
  sub_10000A858(v134, v135);
  uint64_t v140 = swift_allocObject();
  uint64_t v141 = v235;
  sub_10003FB98(v135, v140 + v235);
  uint64_t v142 = v213;
  sub_100006754(v127, v213, &qword_10006C2A0);
  uint64_t v143 = v231;
  ((void (*)(uint64_t, char *, uint64_t))v211)(v142 + *(int *)(v231 + 52), v133, v136);
  uint64_t v144 = (uint64_t (**)(uint64_t))(v142 + *(int *)(v143 + 56));
  *uint64_t v144 = sub_10004037C;
  v144[1] = (uint64_t (*)(uint64_t))v140;
  ((void (*)(char *, uint64_t))v225)(v133, v136);
  sub_1000067B8(v127, &qword_10006C2A0);
  uint64_t v145 = *(void *)(v139 + 32);
  char v146 = *(unsigned char *)(v139 + 40);
  char v248 = *(void **)(v139 + 24);
  uint64_t v249 = v145;
  LOBYTE(v250) = v146;
  sub_100006380(&qword_10006B1E8);
  Binding.wrappedValue.getter();
  uint64_t v147 = v236;
  sub_10000A858(v139, v236);
  uint64_t v148 = swift_allocObject();
  sub_10003FB98(v147, v148 + v141);
  uint64_t v149 = sub_100006380(&qword_10006B440);
  uint64_t v150 = sub_1000068B8(&qword_10006C320, &qword_10006C2A8);
  unint64_t v151 = sub_100040434();
  uint64_t v152 = v217;
  uint64_t v153 = (void *)v231;
  View.onChange<A>(of:initial:_:)();
  swift_release();
  sub_1000067B8(v142, &qword_10006C2A8);
  AccessibilityFocusState.wrappedValue.getter();
  LOBYTE(v239) = (_BYTE)v248;
  uint64_t v154 = v236;
  sub_10000A858(v139, v236);
  uint64_t v155 = swift_allocObject();
  sub_10003FB98(v154, v155 + v235);
  char v248 = v153;
  uint64_t v249 = v149;
  uint64_t v250 = v150;
  unint64_t v251 = v151;
  swift_getOpaqueTypeConformance2();
  uint64_t v156 = v214;
  uint64_t v157 = v219;
  View.onChange<A>(of:initial:_:)();
  swift_release();
  (*(void (**)(char *, uint64_t))(v218 + 8))(v152, v157);
  uint64_t v158 = v222;
  uint64_t v159 = v223;
  uint64_t v160 = v220;
  (*(void (**)(char *, char *, uint64_t))(v222 + 32))(v220, v156, v223);
  LOBYTE(v150) = v272;
  LODWORD(v237) = v272;
  LOBYTE(v154) = v270;
  LODWORD(v238) = v270;
  uint64_t v235 = *(void *)(v158 + 16);
  int v161 = v267;
  uint64_t v162 = v221;
  ((void (*)(char *, char *, uint64_t))v235)(v221, v160, v159);
  *(void *)&long long v239 = v232;
  WORD4(v239) = 256;
  *(_DWORD *)((char *)&v239 + 10) = v273;
  HIWORD(v239) = v274;
  *(void *)&long long v240 = v229;
  BYTE8(v240) = v150;
  *(_DWORD *)((char *)&v240 + 9) = *(_DWORD *)v271;
  HIDWORD(v240) = *(_DWORD *)&v271[3];
  *(void *)&long long v241 = v230;
  BYTE8(v241) = v154;
  *(_DWORD *)((char *)&v241 + 9) = *(_DWORD *)v269;
  HIDWORD(v241) = *(_DWORD *)&v269[3];
  uint64_t v164 = v215;
  uint64_t v163 = v216;
  *(void *)&long long v242 = v216;
  *((void *)&v242 + 1) = v215;
  long long v243 = v138;
  *(void *)&long long v244 = v57;
  BYTE8(v244) = v228;
  *(_DWORD *)((char *)&v244 + 9) = *(_DWORD *)v268;
  HIDWORD(v244) = *(_DWORD *)&v268[3];
  *(void *)&long long v245 = v61;
  *((void *)&v245 + 1) = v63;
  *(void *)&long long v246 = v65;
  *((void *)&v246 + 1) = v67;
  char v165 = v161;
  LODWORD(v236) = v161;
  char v247 = v161;
  long long v166 = v239;
  long long v167 = v240;
  long long v168 = v242;
  uint64_t v169 = v227;
  *(_OWORD *)(v227 + 32) = v241;
  *(_OWORD *)(v169 + 48) = v168;
  *(_OWORD *)uint64_t v169 = v166;
  *(_OWORD *)(v169 + 16) = v167;
  long long v170 = v243;
  long long v171 = v244;
  long long v172 = v245;
  long long v173 = v246;
  *(unsigned char *)(v169 + 128) = v165;
  *(_OWORD *)(v169 + 96) = v172;
  *(_OWORD *)(v169 + 112) = v173;
  *(_OWORD *)(v169 + 64) = v170;
  *(_OWORD *)(v169 + 80) = v171;
  uint64_t v174 = sub_100006380(&qword_10006C330);
  ((void (*)(uint64_t, char *, uint64_t))v235)(v169 + *(int *)(v174 + 48), v162, v159);
  sub_1000065F4((uint64_t)&v239);
  uint64_t v175 = *(void (**)(char *, uint64_t))(v158 + 8);
  v175(v160, v159);
  v175(v162, v159);
  char v248 = (void *)v232;
  LOWORD(v249) = 256;
  *(_DWORD *)((char *)&v249 + 2) = v273;
  HIWORD(v249) = v274;
  uint64_t v250 = v229;
  LOBYTE(v251) = v237;
  *(_DWORD *)((char *)&v251 + 1) = *(_DWORD *)v271;
  HIDWORD(v251) = *(_DWORD *)&v271[3];
  uint64_t v252 = v230;
  char v253 = v238;
  *(_DWORD *)&v254[3] = *(_DWORD *)&v269[3];
  *(_DWORD *)v254 = *(_DWORD *)v269;
  uint64_t v255 = v163;
  uint64_t v256 = v164;
  unint64_t v257 = v138;
  uint64_t v258 = 0;
  uint64_t v259 = v57;
  char v260 = v228;
  *(_DWORD *)&v261[3] = *(_DWORD *)&v268[3];
  *(_DWORD *)uint64_t v261 = *(_DWORD *)v268;
  uint64_t v262 = v61;
  uint64_t v263 = v63;
  uint64_t v264 = v65;
  uint64_t v265 = v67;
  char v266 = v236;
  return sub_100006620((uint64_t)&v248);
}

uint64_t sub_10003DF98(uint64_t a1)
{
  switch(*(unsigned char *)(a1 + 16))
  {
    case 1:
      sub_100006380(&qword_10006B638);
      State.wrappedValue.getter();
      uint64_t result = _AXSLiveTranscriptionSetMicOn();
      break;
    case 2:
    case 3:
    case 4:
      uint64_t result = (*(uint64_t (**)(void))(a1 + 48))();
      break;
    default:
      sub_100006380(&qword_10006B638);
      State.wrappedValue.getter();
      uint64_t result = _AXSLiveTranscriptionSetPaused();
      break;
  }
  return result;
}

uint64_t sub_10003E078@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = type metadata accessor for ButtonView();
  __chkstk_darwin(v4 - 8);
  unsigned int v6 = (char *)&v29 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v29 - v8;
  uint64_t v10 = type metadata accessor for Image.ResizingMode();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v29 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = *(void *)(a1 + 104);
  LOBYTE(v37) = *(unsigned char *)(a1 + 96);
  uint64_t v38 = v14;
  uint64_t v29 = sub_100006380(&qword_10006B638);
  State.wrappedValue.getter();
  swift_bridgeObjectRetain();
  Image.init(systemName:)();
  (*(void (**)(char *, void, uint64_t))(v11 + 104))(v13, enum case for Image.ResizingMode.stretch(_:), v10);
  double v15 = 0.0;
  uint64_t v30 = Image.resizable(capInsets:resizingMode:)();
  swift_release();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  uint64_t v17 = *(void *)(a1 + 136);
  uint64_t v37 = *(void *)(a1 + 128);
  uint64_t v16 = v37;
  uint64_t v38 = v17;
  sub_100006380(&qword_10006B1D0);
  State.wrappedValue.getter();
  uint64_t v37 = v16;
  uint64_t v38 = v17;
  State.wrappedValue.getter();
  static Alignment.center.getter();
  _FrameLayout.init(width:height:alignment:)();
  uint64_t v18 = v37;
  char v19 = v38;
  char v20 = v40;
  uint64_t v32 = v41;
  uint64_t v33 = v39;
  uint64_t v31 = v42;
  int v21 = *(unsigned __int8 *)(a1 + 16);
  if (v21 == 4)
  {
    uint64_t v35 = v16;
    uint64_t v36 = v17;
    State.wrappedValue.getter();
    double v15 = v34 / -10.0;
    sub_10000A858(a1, (uint64_t)v9);
  }
  else
  {
    sub_10000A858(a1, (uint64_t)v9);
    if (v21 == 1)
    {
      sub_10000A8BC((uint64_t)v9);
      sub_10000A858(a1, (uint64_t)v6);
      goto LABEL_7;
    }
  }
  int v22 = v9[16];
  sub_10000A8BC((uint64_t)v9);
  sub_10000A858(a1, (uint64_t)v6);
  if (v22)
  {
    sub_10000A8BC((uint64_t)v6);
LABEL_9:
    uint64_t v26 = v30;
    uint64_t v25 = static Color.white.getter();
    goto LABEL_10;
  }
LABEL_7:
  uint64_t v23 = *((void *)v6 + 13);
  LOBYTE(v35) = v6[96];
  uint64_t v36 = v23;
  State.wrappedValue.getter();
  char v24 = LOBYTE(v34);
  sub_10000A8BC((uint64_t)v6);
  if ((v24 & 1) == 0) {
    goto LABEL_9;
  }
  static Color.black.getter();
  uint64_t v25 = Color.opacity(_:)();
  swift_release();
  uint64_t v26 = v30;
LABEL_10:
  uint64_t result = swift_getKeyPath();
  *(void *)a2 = v26;
  *(void *)(a2 + 8) = 0;
  *(_WORD *)(a2 + 16) = 1;
  *(void *)(a2 + 24) = v18;
  *(unsigned char *)(a2 + 32) = v19;
  *(void *)(a2 + 40) = v33;
  *(unsigned char *)(a2 + 48) = v20;
  uint64_t v28 = v31;
  *(void *)(a2 + 56) = v32;
  *(void *)(a2 + 64) = v28;
  *(double *)(a2 + 72) = v15;
  *(void *)(a2 + 80) = 0;
  *(void *)(a2 + 88) = result;
  *(void *)(a2 + 96) = v25;
  return result;
}

uint64_t sub_10003E448()
{
  return static AXLTUtilities.AXLTLocString(_:)();
}

uint64_t sub_10003E4EC()
{
  sub_100006380(&qword_10006B1D0);
  State.wrappedValue.setter();
  State.wrappedValue.getter();
  uint64_t result = State.wrappedValue.setter();
  if (*(unsigned char *)(v0 + 16) == 1)
  {
    if (qword_10006AE28 != -1) {
      swift_once();
    }
    swift_beginAccess();
    sub_100006380(&qword_10006B638);
    State.wrappedValue.setter();
    swift_retain();
    State.wrappedValue.getter();
    State.wrappedValue.setter();
    return swift_release();
  }
  else if (!*(unsigned char *)(v0 + 16))
  {
    if (qword_10006AE28 != -1) {
      swift_once();
    }
    swift_beginAccess();
    sub_100006380(&qword_10006B638);
    return State.wrappedValue.setter();
  }
  return result;
}

uint64_t sub_10003E74C(uint64_t a1, uint64_t a2)
{
  uint64_t result = Notification.userInfo.getter();
  if (result)
  {
    uint64_t v4 = result;
    char v8 = notificationValueKey.getter();
    AnyHashable.init<A>(_:)();
    if (*(void *)(v4 + 16) && (unint64_t v5 = sub_1000486C0((uint64_t)v9), (v6 & 1) != 0))
    {
      sub_10000E914(*(void *)(v4 + 56) + 32 * v5, (uint64_t)&v11);
    }
    else
    {
      long long v11 = 0u;
      long long v12 = 0u;
    }
    swift_bridgeObjectRelease();
    sub_10000ED94((uint64_t)v9);
    if (*((void *)&v12 + 1))
    {
      uint64_t result = swift_dynamicCast();
      if ((result & 1) != 0 && *(unsigned char *)(a2 + 16) == 1)
      {
        uint64_t v7 = *(void *)(a2 + 104);
        v9[0] = *(unsigned char *)(a2 + 96);
        uint64_t v10 = v7;
        LOBYTE(v11) = v8;
        sub_100006380(&qword_10006B638);
        return State.wrappedValue.setter();
      }
    }
    else
    {
      return sub_1000067B8((uint64_t)&v11, &qword_10006C150);
    }
  }
  return result;
}

uint64_t sub_10003E86C(uint64_t a1, uint64_t a2)
{
  uint64_t result = Notification.userInfo.getter();
  if (result)
  {
    uint64_t v4 = result;
    char v8 = notificationValueKey.getter();
    AnyHashable.init<A>(_:)();
    if (*(void *)(v4 + 16) && (unint64_t v5 = sub_1000486C0((uint64_t)v9), (v6 & 1) != 0))
    {
      sub_10000E914(*(void *)(v4 + 56) + 32 * v5, (uint64_t)&v11);
    }
    else
    {
      long long v11 = 0u;
      long long v12 = 0u;
    }
    swift_bridgeObjectRelease();
    sub_10000ED94((uint64_t)v9);
    if (*((void *)&v12 + 1))
    {
      uint64_t result = swift_dynamicCast();
      if ((result & 1) != 0 && !*(unsigned char *)(a2 + 16))
      {
        uint64_t v7 = *(void *)(a2 + 104);
        v9[0] = *(unsigned char *)(a2 + 96);
        uint64_t v10 = v7;
        LOBYTE(v11) = v8;
        sub_100006380(&qword_10006B638);
        return State.wrappedValue.setter();
      }
    }
    else
    {
      return sub_1000067B8((uint64_t)&v11, &qword_10006C150);
    }
  }
  return result;
}

uint64_t sub_10003E988()
{
  return AccessibilityFocusState.wrappedValue.setter();
}

void sub_10003EA28(uint64_t a1, unsigned char *a2, uint64_t a3)
{
  uint64_t v5 = type metadata accessor for ButtonView();
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((*a2 & 1) == 0)
  {
    uint64_t v8 = *(void *)(a3 + 32);
    char v9 = *(unsigned char *)(a3 + 40);
    uint64_t v18 = *(void *)(a3 + 24);
    uint64_t v19 = v8;
    char v20 = v9;
    sub_100006380(&qword_10006B1E8);
    Binding.wrappedValue.getter();
    int v10 = v21;
    sub_10000A858(a3, (uint64_t)v7);
    if (v10 == 5)
    {
      sub_10000A8BC((uint64_t)v7);
    }
    else
    {
      uint64_t v11 = *((void *)v7 + 4);
      char v12 = v7[40];
      uint64_t v18 = *((void *)v7 + 3);
      uint64_t v19 = v11;
      char v20 = v12;
      Binding.wrappedValue.getter();
      int v13 = v21;
      int v14 = v7[16];
      sub_10000A8BC((uint64_t)v7);
      if (v13 != 5 && v13 == v14)
      {
        uint64_t v15 = *(void *)(a3 + 32);
        char v16 = *(unsigned char *)(a3 + 40);
        uint64_t v18 = *(void *)(a3 + 24);
        uint64_t v19 = v15;
        char v20 = v16;
        unsigned __int8 v21 = 5;
        Binding.wrappedValue.setter();
      }
    }
  }
}

uint64_t sub_10003EB68()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

void *sub_10003EBA0(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  int v3 = (void *)a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v16 = *a2;
    *int v3 = *a2;
    int v3 = (void *)(v16 + ((v4 + 16) & ~(unint64_t)v4));
  }
  else
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(unsigned char *)(a1 + 16) = *((unsigned char *)a2 + 16);
    uint64_t v5 = a2[4];
    *(void *)(a1 + 24) = a2[3];
    *(void *)(a1 + 32) = v5;
    *(unsigned char *)(a1 + 40) = *((unsigned char *)a2 + 40);
    uint64_t v6 = a2[7];
    *(void *)(a1 + 48) = a2[6];
    *(void *)(a1 + 56) = v6;
    uint64_t v7 = a2[9];
    *(void *)(a1 + 64) = a2[8];
    *(void *)(a1 + 72) = v7;
    uint64_t v8 = a2[11];
    *(void *)(a1 + 80) = a2[10];
    *(void *)(a1 + 88) = v8;
    *(unsigned char *)(a1 + 96) = *((unsigned char *)a2 + 96);
    uint64_t v9 = a2[14];
    *(void *)(a1 + 104) = a2[13];
    *(void *)(a1 + 112) = v9;
    uint64_t v10 = a2[16];
    *(void *)(a1 + 120) = a2[15];
    *(void *)(a1 + 128) = v10;
    uint64_t v11 = *(int *)(a3 + 56);
    __dst = (unsigned char *)(a1 + v11);
    char v12 = (char *)a2 + v11;
    *(void *)(a1 + 136) = a2[17];
    uint64_t v13 = type metadata accessor for AccessibilityTechnologies();
    uint64_t v19 = *(void *)(v13 - 8);
    char v20 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48);
    swift_retain();
    swift_retain();
    swift_retain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_retain();
    swift_retain();
    swift_retain();
    if (v20(v12, 1, v13))
    {
      uint64_t v14 = sub_100006380(&qword_10006C188);
      uint64_t v15 = __dst;
      memcpy(__dst, v12, *(void *)(*(void *)(v14 - 8) + 64));
    }
    else
    {
      uint64_t v15 = __dst;
      (*(void (**)(unsigned char *, char *, uint64_t))(v19 + 16))(__dst, v12, v13);
      (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v19 + 56))(__dst, 0, 1, v13);
    }
    uint64_t v17 = (int *)sub_100006380(&qword_10006C190);
    v15[v17[9]] = v12[v17[9]];
    *(void *)&v15[v17[10]] = *(void *)&v12[v17[10]];
    v15[v17[11]] = v12[v17[11]];
  }
  swift_retain();
  return v3;
}

uint64_t sub_10003EDFC(uint64_t a1, uint64_t a2)
{
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v4 = a1 + *(int *)(a2 + 56);
  uint64_t v5 = type metadata accessor for AccessibilityTechnologies();
  uint64_t v6 = *(void *)(v5 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5)) {
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  }
  sub_100006380(&qword_10006C190);

  return swift_release();
}

uint64_t sub_10003EF08(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v4;
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  uint64_t v5 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v5;
  uint64_t v6 = *(void *)(a2 + 72);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = v6;
  uint64_t v7 = *(void *)(a2 + 88);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = v7;
  *(unsigned char *)(a1 + 96) = *(unsigned char *)(a2 + 96);
  uint64_t v8 = *(void *)(a2 + 112);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  *(void *)(a1 + 112) = v8;
  uint64_t v9 = *(void *)(a2 + 128);
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  *(void *)(a1 + 128) = v9;
  uint64_t v10 = *(int *)(a3 + 56);
  __dst = (unsigned char *)(a1 + v10);
  uint64_t v11 = (char *)(a2 + v10);
  *(void *)(a1 + 136) = *(void *)(a2 + 136);
  uint64_t v12 = type metadata accessor for AccessibilityTechnologies();
  uint64_t v17 = *(void *)(v12 - 8);
  uint64_t v18 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_retain();
  if (v18(v11, 1, v12))
  {
    uint64_t v13 = sub_100006380(&qword_10006C188);
    uint64_t v14 = __dst;
    memcpy(__dst, v11, *(void *)(*(void *)(v13 - 8) + 64));
  }
  else
  {
    uint64_t v14 = __dst;
    (*(void (**)(unsigned char *, char *, uint64_t))(v17 + 16))(__dst, v11, v12);
    (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v17 + 56))(__dst, 0, 1, v12);
  }
  uint64_t v15 = (int *)sub_100006380(&qword_10006C190);
  v14[v15[9]] = v11[v15[9]];
  *(void *)&v14[v15[10]] = *(void *)&v11[v15[10]];
  v14[v15[11]] = v11[v15[11]];
  swift_retain();
  return a1;
}

uint64_t sub_10003F118(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_retain();
  swift_release();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  uint64_t v6 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v6;
  swift_retain();
  swift_release();
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 96) = *(unsigned char *)(a2 + 96);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  swift_retain();
  swift_release();
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  swift_retain();
  swift_release();
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  *(void *)(a1 + 136) = *(void *)(a2 + 136);
  swift_retain();
  swift_release();
  uint64_t v7 = *(int *)(a3 + 56);
  uint64_t v8 = (char *)(a1 + v7);
  uint64_t v9 = (char *)(a2 + v7);
  uint64_t v10 = type metadata accessor for AccessibilityTechnologies();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v11 + 48);
  int v13 = v12(v8, 1, v10);
  int v14 = v12(v9, 1, v10);
  if (!v13)
  {
    if (!v14)
    {
      (*(void (**)(char *, char *, uint64_t))(v11 + 24))(v8, v9, v10);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v11 + 8))(v8, v10);
    goto LABEL_6;
  }
  if (v14)
  {
LABEL_6:
    uint64_t v15 = sub_100006380(&qword_10006C188);
    memcpy(v8, v9, *(void *)(*(void *)(v15 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v8, v9, v10);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
LABEL_7:
  uint64_t v16 = (int *)sub_100006380(&qword_10006C190);
  v8[v16[9]] = v9[v16[9]];
  *(void *)&v8[v16[10]] = *(void *)&v9[v16[10]];
  swift_retain();
  swift_release();
  v8[v16[11]] = v9[v16[11]];
  return a1;
}

uint64_t sub_10003F3DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  long long v4 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v4;
  long long v5 = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 96) = v5;
  long long v6 = *(_OWORD *)(a2 + 128);
  uint64_t v7 = *(int *)(a3 + 56);
  uint64_t v8 = (char *)(a1 + v7);
  uint64_t v9 = (char *)(a2 + v7);
  *(_OWORD *)(a1 + 112) = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 128) = v6;
  uint64_t v10 = type metadata accessor for AccessibilityTechnologies();
  uint64_t v11 = *(void *)(v10 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
  {
    uint64_t v12 = sub_100006380(&qword_10006C188);
    memcpy(v8, v9, *(void *)(*(void *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v8, v9, v10);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  int v13 = (int *)sub_100006380(&qword_10006C190);
  v8[v13[9]] = v9[v13[9]];
  *(void *)&v8[v13[10]] = *(void *)&v9[v13[10]];
  v8[v13[11]] = v9[v13[11]];
  return a1;
}

uint64_t sub_10003F550(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_release();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_release();
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  swift_release();
  uint64_t v6 = *(void *)(a2 + 72);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(a2 + 88);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = v7;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 96) = *(unsigned char *)(a2 + 96);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  swift_release();
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  swift_release();
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  *(void *)(a1 + 136) = *(void *)(a2 + 136);
  swift_release();
  uint64_t v8 = *(int *)(a3 + 56);
  uint64_t v9 = (char *)(a1 + v8);
  uint64_t v10 = (char *)(a2 + v8);
  uint64_t v11 = type metadata accessor for AccessibilityTechnologies();
  uint64_t v12 = *(void *)(v11 - 8);
  int v13 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v12 + 48);
  int v14 = v13(v9, 1, v11);
  int v15 = v13(v10, 1, v11);
  if (!v14)
  {
    if (!v15)
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 40))(v9, v10, v11);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v12 + 8))(v9, v11);
    goto LABEL_6;
  }
  if (v15)
  {
LABEL_6:
    uint64_t v16 = sub_100006380(&qword_10006C188);
    memcpy(v9, v10, *(void *)(*(void *)(v16 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v9, v10, v11);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
LABEL_7:
  uint64_t v17 = (int *)sub_100006380(&qword_10006C190);
  v9[v17[9]] = v10[v17[9]];
  *(void *)&v9[v17[10]] = *(void *)&v10[v17[10]];
  swift_release();
  v9[v17[11]] = v10[v17[11]];
  return a1;
}

uint64_t sub_10003F7B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10003F7C8);
}

uint64_t sub_10003F7C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 32);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = sub_100006380(&qword_10006C190);
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 56);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_10003F87C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10003F890);
}

uint64_t sub_10003F890(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 32) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_100006380(&qword_10006C190);
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 56);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

void sub_10003F93C()
{
  sub_10003FA14();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_10003FA14()
{
  if (!qword_10006C200)
  {
    unint64_t v0 = type metadata accessor for AccessibilityFocusState();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_10006C200);
    }
  }
}

uint64_t sub_10003FA74()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10003FA90@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4 = *(void *)(a1 - 8);
  uint64_t v5 = *(void *)(v4 + 64);
  __chkstk_darwin(a1 - 8);
  uint64_t v6 = static Alignment.center.getter();
  uint64_t v8 = v7;
  sub_10000A858(v2, (uint64_t)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v9 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v10 = swift_allocObject();
  uint64_t result = sub_10003FB98((uint64_t)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v10 + v9);
  *a2 = v6;
  a2[1] = v8;
  a2[2] = (uint64_t)sub_10003FBFC;
  a2[3] = v10;
  return result;
}

uint64_t sub_10003FB98(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ButtonView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10003FBFC@<X0>(char *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = *(void *)(type metadata accessor for ButtonView() - 8);
  uint64_t v6 = v2 + ((*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));

  return sub_10003C694(a1, v6, a2);
}

uint64_t sub_10003FC80()
{
  uint64_t v1 = *(void *)(type metadata accessor for ButtonView() - 8);
  uint64_t v2 = v0 + ((*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80));

  return sub_10003DF98(v2);
}

uint64_t sub_10003FCE0@<X0>(uint64_t a1@<X8>)
{
  return sub_10003E078(*(void *)(v1 + 16), a1);
}

uint64_t sub_10003FCE8(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10000646C(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_10003FD64()
{
  unint64_t result = qword_10006C2D8;
  if (!qword_10006C2D8)
  {
    sub_10000646C(&qword_10006C278);
    sub_10003FCE8(&qword_10006C2E0, &qword_10006C270, (void (*)(void))sub_10003FE30);
    sub_1000068B8(&qword_10006C2F0, &qword_10006C2F8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006C2D8);
  }
  return result;
}

unint64_t sub_10003FE30()
{
  unint64_t result = qword_10006C2E8;
  if (!qword_10006C2E8)
  {
    sub_10000646C(&qword_10006C268);
    sub_10000646C(&qword_10006C258);
    type metadata accessor for PlainButtonStyle();
    sub_1000068B8(&qword_10006C2C0, &qword_10006C258);
    sub_10004002C(&qword_10006C2C8, (void (*)(uint64_t))&type metadata accessor for PlainButtonStyle);
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006C2E8);
  }
  return result;
}

unint64_t sub_10003FF54()
{
  unint64_t result = qword_10006C318;
  if (!qword_10006C318)
  {
    sub_10000646C(&qword_10006C288);
    sub_10003FCE8(&qword_10006C2D0, &qword_10006C280, (void (*)(void))sub_10003FD64);
    sub_10004002C(&qword_10006B3A8, (void (*)(uint64_t))&type metadata accessor for AccessibilityAttachmentModifier);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006C318);
  }
  return result;
}

uint64_t sub_10004002C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100040074()
{
  uint64_t v1 = (int *)(type metadata accessor for ButtonView() - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v13 = *(void *)(*(void *)v1 + 64);
  uint64_t v4 = type metadata accessor for GeometryProxy();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(unsigned __int8 *)(v5 + 80);
  uint64_t v7 = *(void *)(v5 + 64);
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v8 = v0 + v3 + v1[16];
  uint64_t v9 = type metadata accessor for AccessibilityTechnologies();
  uint64_t v10 = *(void *)(v9 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9)) {
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v8, v9);
  }
  uint64_t v11 = (v3 + v13 + v6) & ~v6;
  sub_100006380(&qword_10006C190);
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v0 + v11, v4);

  return _swift_deallocObject(v0, v11 + v7, v2 | v6 | 7);
}

uint64_t sub_100040290()
{
  return sub_10003E4EC();
}

uint64_t sub_100040360(uint64_t a1)
{
  return sub_100040394(a1, sub_10003E74C);
}

uint64_t sub_10004037C(uint64_t a1)
{
  return sub_100040394(a1, sub_10003E86C);
}

uint64_t sub_100040394(uint64_t a1, uint64_t (*a2)(uint64_t, uint64_t))
{
  uint64_t v4 = *(void *)(type metadata accessor for ButtonView() - 8);
  uint64_t v5 = v2 + ((*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));

  return a2(a1, v5);
}

uint64_t sub_10004041C(uint64_t a1, uint64_t a2)
{
  return sub_10004064C(a1, a2, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_10003E988);
}

unint64_t sub_100040434()
{
  unint64_t result = qword_10006C328;
  if (!qword_10006C328)
  {
    sub_10000646C(&qword_10006B440);
    sub_10003C5F4();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006C328);
  }
  return result;
}

uint64_t sub_1000404AC()
{
  uint64_t v1 = (int *)(type metadata accessor for ButtonView() - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*(void *)v1 + 64);
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v5 = v0 + v3 + v1[16];
  uint64_t v6 = type metadata accessor for AccessibilityTechnologies();
  uint64_t v7 = *(void *)(v6 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6)) {
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v5, v6);
  }
  sub_100006380(&qword_10006C190);
  swift_release();

  return _swift_deallocObject(v0, v3 + v4, v2 | 7);
}

uint64_t sub_100040634(uint64_t a1, uint64_t a2)
{
  return sub_10004064C(a1, a2, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_10003EA28);
}

uint64_t sub_10004064C(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v6 = *(void *)(type metadata accessor for ButtonView() - 8);
  uint64_t v7 = v3 + ((*(unsigned __int8 *)(v6 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80));

  return a3(a1, a2, v7);
}

uint64_t sub_1000406E8()
{
  return sub_1000068B8(&qword_10006C340, &qword_10006C348);
}

void *backgroundColorViewInset.unsafeMutableAddressor()
{
  return &backgroundColorViewInset;
}

uint64_t destroy for BackgroundColorView()
{
  swift_release();

  return swift_release();
}

uint64_t _s19LiveTranscriptionUI19BackgroundColorViewVwCP_0(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v3 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v3;
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for BackgroundColorView(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_retain();
  swift_release();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_retain();
  swift_release();
  return a1;
}

__n128 initializeWithTake for BackgroundColorView(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for BackgroundColorView(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  swift_release();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for BackgroundColorView(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for BackgroundColorView(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for BackgroundColorView()
{
  return &type metadata for BackgroundColorView;
}

uint64_t sub_100040910()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10004092C@<X0>(char a1@<W0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t (**a4)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)@<X8>)
{
  uint64_t v8 = type metadata accessor for NSNotificationCenter.Publisher();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = swift_allocObject();
  *(unsigned char *)(v12 + 16) = a1;
  *(void *)(v12 + 24) = a2;
  *(void *)(v12 + 32) = a3;
  uint64_t v13 = self;
  swift_retain();
  swift_retain();
  id v14 = [v13 defaultCenter];
  if (qword_10006ADD8 != -1) {
    swift_once();
  }
  NSNotificationCenter.publisher(for:object:)();

  uint64_t v15 = swift_allocObject();
  *(unsigned char *)(v15 + 16) = a1;
  *(void *)(v15 + 24) = a2;
  *(void *)(v15 + 32) = a3;
  uint64_t v16 = sub_100006380(&qword_10006C350);
  (*(void (**)(char *, char *, uint64_t))(v9 + 16))((char *)a4 + *(int *)(v16 + 52), v11, v8);
  *a4 = sub_100041584;
  a4[1] = (uint64_t (*)@<X0>(uint64_t@<X0>, uint64_t@<X8>))v12;
  uint64_t v17 = (uint64_t (**)(uint64_t))((char *)a4 + *(int *)(v16 + 56));
  int *v17 = sub_1000415D4;
  v17[1] = (uint64_t (*)(uint64_t))v15;
  uint64_t v18 = *(uint64_t (**)(char *, uint64_t))(v9 + 8);
  swift_retain();
  swift_retain();
  return v18(v11, v8);
}

uint64_t sub_100040B4C@<X0>(uint64_t a1@<X0>, int a2@<W1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  LODWORD(v29) = a2;
  v28[1] = a1;
  uint64_t v35 = a5;
  uint64_t v30 = sub_100006380(&qword_10006C358);
  __chkstk_darwin(v30);
  uint64_t v33 = (uint64_t)v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v32 = sub_100006380(&qword_10006C360);
  __chkstk_darwin(v32);
  uint64_t v9 = (char *)v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v31 = sub_100006380(&qword_10006C368);
  __chkstk_darwin(v31);
  uint64_t v11 = (char *)v28 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  id v14 = (char *)v28 - v13;
  uint64_t v34 = sub_100006380(&qword_10006C370);
  uint64_t v15 = *(void *)(v34 - 8);
  __chkstk_darwin(v34);
  uint64_t v17 = (char *)v28 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)&long long v36 = a3;
  *((void *)&v36 + 1) = a4;
  sub_100006380(&qword_10006B318);
  State.wrappedValue.getter();
  static Color.clear.getter();
  char v18 = static Color.== infix(_:_:)();
  swift_release();
  swift_release();
  if (v18)
  {
    uint64_t v19 = 1;
    uint64_t v20 = v35;
  }
  else
  {
    if (v29 == 3)
    {
      sub_100040F6C(3, a3, a4, (uint64_t)v9);
      GeometryProxy.size.getter();
      sub_10004183C((uint64_t)&v36);
      long long v29 = v36;
      uint64_t v21 = v37;
      uint64_t v22 = v38;
      char v23 = v39;
      sub_100006754((uint64_t)v9, (uint64_t)v11, &qword_10006C360);
      char v24 = &v11[*(int *)(v31 + 36)];
      *(_OWORD *)char v24 = v29;
      *((void *)v24 + 2) = v21;
      *((void *)v24 + 3) = v22;
      v24[32] = v23;
      *(_WORD *)(v24 + 33) = 257;
      sub_1000067B8((uint64_t)v9, &qword_10006C360);
      sub_10000A940((uint64_t)v11, (uint64_t)v14, &qword_10006C368);
      sub_100006754((uint64_t)v14, v33, &qword_10006C368);
      swift_storeEnumTagMultiPayload();
      sub_1000415E0();
      sub_1000416CC(&qword_10006C380, &qword_10006C360, (void (*)(void))sub_1000416A4);
      _ConditionalContent<>.init(storage:)();
      uint64_t v25 = (uint64_t)v14;
      uint64_t v26 = &qword_10006C368;
    }
    else
    {
      sub_100040F6C(v29, a3, a4, (uint64_t)v9);
      sub_100006754((uint64_t)v9, v33, &qword_10006C360);
      swift_storeEnumTagMultiPayload();
      sub_1000415E0();
      sub_1000416CC(&qword_10006C380, &qword_10006C360, (void (*)(void))sub_1000416A4);
      _ConditionalContent<>.init(storage:)();
      uint64_t v25 = (uint64_t)v9;
      uint64_t v26 = &qword_10006C360;
    }
    sub_1000067B8(v25, v26);
    uint64_t v20 = v35;
    sub_10000A940((uint64_t)v17, v35, &qword_10006C370);
    uint64_t v19 = 0;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v15 + 56))(v20, v19, 1, v34);
}

uint64_t sub_100040F6C@<X0>(char a1@<W0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v78 = a4;
  uint64_t v73 = sub_100006380(&qword_10006AF40) - 8;
  __chkstk_darwin(v73);
  uint64_t v8 = (char *)&v72 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for RoundedRectangle();
  uint64_t v10 = v9 - 8;
  __chkstk_darwin(v9);
  uint64_t v12 = (double *)((char *)&v72 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v13 = sub_100006380(&qword_10006AF48);
  uint64_t v14 = v13 - 8;
  __chkstk_darwin(v13);
  uint64_t v16 = (uint64_t *)((char *)&v72 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v17 = sub_100006380(&qword_10006C3B0);
  uint64_t v18 = v17 - 8;
  __chkstk_darwin(v17);
  uint64_t v20 = (char *)&v72 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v76 = sub_100006380(&qword_10006C3A0) - 8;
  __chkstk_darwin(v76);
  uint64_t v74 = (uint64_t)&v72 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v77 = sub_100006380(&qword_10006C390) - 8;
  __chkstk_darwin(v77);
  uint64_t v75 = (uint64_t)&v72 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v79 = a2;
  uint64_t v80 = a3;
  sub_100006380(&qword_10006B318);
  State.wrappedValue.getter();
  uint64_t v23 = Color.opacity(_:)();
  swift_release();
  if (a1) {
    double v24 = 15.0;
  }
  else {
    double v24 = 18.0;
  }
  uint64_t v25 = (char *)v12 + *(int *)(v10 + 28);
  uint64_t v26 = enum case for RoundedCornerStyle.continuous(_:);
  uint64_t v27 = type metadata accessor for RoundedCornerStyle();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v27 - 8) + 104))(v25, v26, v27);
  *uint64_t v12 = v24;
  v12[1] = v24;
  sub_100006694((uint64_t)v12, (uint64_t)v8);
  *(_WORD *)&v8[*(int *)(v73 + 44)] = 256;
  sub_100006754((uint64_t)v8, (uint64_t)v16 + *(int *)(v14 + 44), &qword_10006AF40);
  *uint64_t v16 = v23;
  swift_retain();
  sub_1000067B8((uint64_t)v8, &qword_10006AF40);
  sub_1000066F8((uint64_t)v12);
  swift_release();
  char v28 = static Edge.Set.top.getter();
  EdgeInsets.init(_all:)();
  uint64_t v30 = v29;
  uint64_t v32 = v31;
  uint64_t v34 = v33;
  uint64_t v36 = v35;
  sub_100006754((uint64_t)v16, (uint64_t)v20, &qword_10006AF48);
  uint64_t v37 = &v20[*(int *)(v18 + 44)];
  char *v37 = v28;
  *((void *)v37 + 1) = v30;
  *((void *)v37 + 2) = v32;
  *((void *)v37 + 3) = v34;
  *((void *)v37 + 4) = v36;
  v37[40] = 0;
  sub_1000067B8((uint64_t)v16, &qword_10006AF48);
  char v38 = static Edge.Set.leading.getter();
  EdgeInsets.init(_all:)();
  uint64_t v40 = v39;
  uint64_t v42 = v41;
  uint64_t v44 = v43;
  uint64_t v46 = v45;
  uint64_t v47 = v74;
  sub_100006754((uint64_t)v20, v74, &qword_10006C3B0);
  uint64_t v48 = v47 + *(int *)(v76 + 44);
  *(unsigned char *)uint64_t v48 = v38;
  *(void *)(v48 + 8) = v40;
  *(void *)(v48 + 16) = v42;
  *(void *)(v48 + 24) = v44;
  *(void *)(v48 + 32) = v46;
  *(unsigned char *)(v48 + 40) = 0;
  sub_1000067B8((uint64_t)v20, &qword_10006C3B0);
  char v49 = static Edge.Set.trailing.getter();
  EdgeInsets.init(_all:)();
  uint64_t v51 = v50;
  uint64_t v53 = v52;
  uint64_t v55 = v54;
  uint64_t v57 = v56;
  uint64_t v58 = v75;
  sub_100006754(v47, v75, &qword_10006C3A0);
  uint64_t v59 = v58 + *(int *)(v77 + 44);
  *(unsigned char *)uint64_t v59 = v49;
  *(void *)(v59 + 8) = v51;
  *(void *)(v59 + 16) = v53;
  *(void *)(v59 + 24) = v55;
  *(void *)(v59 + 32) = v57;
  *(unsigned char *)(v59 + 40) = 0;
  sub_1000067B8(v47, &qword_10006C3A0);
  char v60 = static Edge.Set.bottom.getter();
  EdgeInsets.init(_all:)();
  uint64_t v62 = v61;
  uint64_t v64 = v63;
  uint64_t v66 = v65;
  uint64_t v68 = v67;
  uint64_t v69 = v78;
  sub_100006754(v58, v78, &qword_10006C390);
  uint64_t v70 = v69 + *(int *)(sub_100006380(&qword_10006C360) + 36);
  *(unsigned char *)uint64_t v70 = v60;
  *(void *)(v70 + 8) = v62;
  *(void *)(v70 + 16) = v64;
  *(void *)(v70 + 24) = v66;
  *(void *)(v70 + 32) = v68;
  *(unsigned char *)(v70 + 40) = 0;
  return sub_1000067B8(v58, &qword_10006C390);
}

uint64_t sub_100041460(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result = Notification.userInfo.getter();
  if (result)
  {
    uint64_t v7 = result;
    uint64_t v10 = notificationValueKey.getter();
    AnyHashable.init<A>(_:)();
    if (*(void *)(v7 + 16) && (unint64_t v8 = sub_1000486C0((uint64_t)v11), (v9 & 1) != 0))
    {
      sub_10000E914(*(void *)(v7 + 56) + 32 * v8, (uint64_t)&v12);
    }
    else
    {
      long long v12 = 0u;
      long long v13 = 0u;
    }
    swift_bridgeObjectRelease();
    sub_10000ED94((uint64_t)v11);
    if (*((void *)&v13 + 1))
    {
      uint64_t result = swift_dynamicCast();
      if (result)
      {
        v11[0] = a3;
        v11[1] = a4;
        *(void *)&long long v12 = v10;
        sub_100006380(&qword_10006B318);
        return State.wrappedValue.setter();
      }
    }
    else
    {
      return sub_1000067B8((uint64_t)&v12, &qword_10006C150);
    }
  }
  return result;
}

uint64_t sub_100041574@<X0>(uint64_t (**a1)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)@<X8>)
{
  return sub_10004092C(*(unsigned char *)v1, *(void *)(v1 + 8), *(void *)(v1 + 16), a1);
}

uint64_t sub_100041584@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_100040B4C(a1, *(unsigned __int8 *)(v2 + 16), *(void *)(v2 + 24), *(void *)(v2 + 32), a2);
}

uint64_t sub_100041594()
{
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_1000415D4(uint64_t a1)
{
  return sub_100041460(a1, *(unsigned __int8 *)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32));
}

unint64_t sub_1000415E0()
{
  unint64_t result = qword_10006C378;
  if (!qword_10006C378)
  {
    sub_10000646C(&qword_10006C368);
    sub_1000416CC(&qword_10006C380, &qword_10006C360, (void (*)(void))sub_1000416A4);
    sub_1000068B8(&qword_10006C3C0, &qword_10006C3C8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006C378);
  }
  return result;
}

uint64_t sub_1000416A4()
{
  return sub_1000416CC(&qword_10006C388, &qword_10006C390, (void (*)(void))sub_10004174C);
}

uint64_t sub_1000416CC(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10000646C(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10004174C()
{
  return sub_1000416CC(&qword_10006C398, &qword_10006C3A0, (void (*)(void))sub_100041774);
}

uint64_t sub_100041774()
{
  return sub_1000416CC(&qword_10006C3A8, &qword_10006C3B0, (void (*)(void))sub_10004179C);
}

unint64_t sub_10004179C()
{
  unint64_t result = qword_10006C3B8;
  if (!qword_10006C3B8)
  {
    sub_10000646C(&qword_10006AF48);
    sub_1000068B8(&qword_10006B620, &qword_10006AF40);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006C3B8);
  }
  return result;
}

double sub_10004183C@<D0>(uint64_t a1@<X8>)
{
  uint64_t v2 = type metadata accessor for RoundedRectangle();
  __chkstk_darwin(v2);
  uint64_t v4 = (int64x2_t *)((char *)v50 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v5 = self;
  id v6 = [v5 mainScreen];
  [v6 bounds];
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;

  v59.origin.CGFloat x = v8;
  v59.origin.CGFloat y = v10;
  v59.size.CGFloat width = v12;
  v59.size.CGFloat height = v14;
  CGFloat Width = CGRectGetWidth(v59);
  id v16 = [v5 mainScreen];
  [v16 bounds];
  CGFloat v18 = v17;
  CGFloat v20 = v19;
  CGFloat v22 = v21;
  CGFloat v24 = v23;

  v60.origin.CGFloat x = v18;
  v60.origin.CGFloat y = v20;
  v60.size.CGFloat width = v22;
  v60.size.CGFloat height = v24;
  CGFloat Height = CGRectGetHeight(v60);
  Rectangle.path(in:)();
  if ((AXDeviceIsPad() & 1) == 0)
  {
    id v26 = [v5 mainScreen];
    [v26 bounds];
    CGFloat v28 = v27;
    CGFloat v30 = v29;
    CGFloat v32 = v31;
    CGFloat v34 = v33;

    v61.origin.CGFloat x = v28;
    v61.origin.CGFloat y = v30;
    v61.size.CGFloat width = v32;
    v61.size.CGFloat height = v34;
    CGRectGetWidth(v61);
  }
  v62.origin.CGFloat x = 0.0;
  v62.origin.CGFloat y = 0.0;
  v62.size.CGFloat width = Width;
  v62.size.CGFloat height = Height;
  CGRectGetHeight(v62);
  v63.origin.CGFloat x = 0.0;
  v63.origin.CGFloat y = 0.0;
  v63.size.CGFloat width = Width;
  v63.size.CGFloat height = Height;
  CGRectGetWidth(v63);
  if ((AXDeviceIsPad() & 1) == 0)
  {
    id v35 = [v5 mainScreen];
    [v35 bounds];
    CGFloat v37 = v36;
    CGFloat v39 = v38;
    CGFloat v41 = v40;
    CGFloat v43 = v42;

    v64.origin.CGFloat x = v37;
    v64.origin.CGFloat y = v39;
    v64.size.CGFloat width = v41;
    v64.size.CGFloat height = v43;
    CGRectGetWidth(v64);
  }
  uint64_t v44 = &v4->i8[*(int *)(v2 + 20)];
  uint64_t v45 = enum case for RoundedCornerStyle.continuous(_:);
  uint64_t v46 = type metadata accessor for RoundedCornerStyle();
  (*(void (**)(__int8 *, uint64_t, uint64_t))(*(void *)(v46 - 8) + 104))(v44, v45, v46);
  *uint64_t v4 = vdupq_n_s64(0x4041000000000000uLL);
  RoundedRectangle.path(in:)();
  sub_1000066F8((uint64_t)v4);
  uint64_t v53 = 0x3FF0000000000000;
  uint64_t v54 = 0;
  uint64_t v55 = 0;
  uint64_t v56 = 0x3FF0000000000000;
  uint64_t v57 = 0;
  uint64_t v58 = 0;
  Path.addPath(_:transform:)();
  sub_100041B8C((uint64_t)v52);
  char v47 = v51;
  double result = *(double *)v50;
  long long v49 = v50[1];
  *(_OWORD *)a1 = v50[0];
  *(_OWORD *)(a1 + 16) = v49;
  *(unsigned char *)(a1 + 32) = v47;
  return result;
}

uint64_t sub_100041B8C(uint64_t a1)
{
  return a1;
}

uint64_t sub_100041BC4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned __int8 a5)
{
  if (a5 - 2 <= 3) {
    return swift_release();
  }
  return result;
}

uint64_t sub_100041BDC()
{
  return sub_1000068B8(&qword_10006C3D0, &qword_10006C350);
}

void *sub_100041C18(void *a1, void *a2, int *a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v33 = *a2;
    *a1 = *a2;
    uint64_t v4 = (void *)(v33 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    *a1 = *a2;
    uint64_t v7 = a3[5];
    CGFloat v8 = (char *)a1 + v7;
    double v9 = (char *)a2 + v7;
    uint64_t v10 = type metadata accessor for AXLTCaption();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
    uint64_t v11 = a3[7];
    *((unsigned char *)v4 + a3[6]) = *((unsigned char *)a2 + a3[6]);
    *((unsigned char *)v4 + v11) = *((unsigned char *)a2 + v11);
    uint64_t v12 = a3[8];
    uint64_t v13 = a3[9];
    CGFloat v14 = (void *)((char *)v4 + v12);
    uint64_t v15 = (void *)((char *)a2 + v12);
    uint64_t v16 = v15[1];
    *CGFloat v14 = *v15;
    v14[1] = v16;
    v14[2] = v15[2];
    double v17 = (void *)((char *)v4 + v13);
    CGFloat v18 = (void *)((char *)a2 + v13);
    uint64_t v19 = v18[1];
    void *v17 = *v18;
    v17[1] = v19;
    v17[2] = v18[2];
    uint64_t v20 = a3[10];
    uint64_t v21 = a3[11];
    CGFloat v22 = (void *)((char *)v4 + v20);
    double v23 = (void *)((char *)a2 + v20);
    uint64_t v24 = v23[1];
    *CGFloat v22 = *v23;
    v22[1] = v24;
    uint64_t v25 = v23[3];
    v22[2] = v23[2];
    v22[3] = v25;
    id v26 = (void *)((char *)v4 + v21);
    double v27 = (void *)((char *)a2 + v21);
    uint64_t v28 = v27[1];
    *id v26 = *v27;
    v26[1] = v28;
    uint64_t v29 = a3[12];
    CGFloat v30 = (void *)((char *)v4 + v29);
    double v31 = (void *)((char *)a2 + v29);
    uint64_t v32 = v31[1];
    *CGFloat v30 = *v31;
    v30[1] = v32;
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_bridgeObjectRetain();
    swift_retain();
    swift_retain();
    swift_retain();
  }
  swift_retain();
  return v4;
}

uint64_t sub_100041DE8(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a1 + *(int *)(a2 + 20);
  uint64_t v3 = type metadata accessor for AXLTCaption();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(v2, v3);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();

  return swift_release();
}

void *sub_100041EE0(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)a1 + v6;
  CGFloat v8 = (char *)a2 + v6;
  uint64_t v9 = type metadata accessor for AXLTCaption();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16))(v7, v8, v9);
  uint64_t v10 = a3[7];
  *((unsigned char *)a1 + a3[6]) = *((unsigned char *)a2 + a3[6]);
  *((unsigned char *)a1 + v10) = *((unsigned char *)a2 + v10);
  uint64_t v11 = a3[8];
  uint64_t v12 = a3[9];
  uint64_t v13 = (void *)((char *)a1 + v11);
  CGFloat v14 = (void *)((char *)a2 + v11);
  uint64_t v15 = v14[1];
  void *v13 = *v14;
  v13[1] = v15;
  v13[2] = v14[2];
  uint64_t v16 = (void *)((char *)a1 + v12);
  double v17 = (void *)((char *)a2 + v12);
  uint64_t v18 = v17[1];
  *uint64_t v16 = *v17;
  v16[1] = v18;
  v16[2] = v17[2];
  uint64_t v19 = a3[10];
  uint64_t v20 = a3[11];
  uint64_t v21 = (void *)((char *)a1 + v19);
  CGFloat v22 = (void *)((char *)a2 + v19);
  uint64_t v23 = v22[1];
  *uint64_t v21 = *v22;
  v21[1] = v23;
  uint64_t v24 = v22[3];
  v21[2] = v22[2];
  v21[3] = v24;
  uint64_t v25 = (void *)((char *)a1 + v20);
  id v26 = (void *)((char *)a2 + v20);
  uint64_t v27 = v26[1];
  void *v25 = *v26;
  v25[1] = v27;
  uint64_t v28 = a3[12];
  uint64_t v29 = (void *)((char *)a1 + v28);
  CGFloat v30 = (void *)((char *)a2 + v28);
  uint64_t v31 = v30[1];
  *uint64_t v29 = *v30;
  v29[1] = v31;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

void *sub_100042064(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)a1 + v6;
  CGFloat v8 = (char *)a2 + v6;
  uint64_t v9 = type metadata accessor for AXLTCaption();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  *((unsigned char *)a1 + a3[6]) = *((unsigned char *)a2 + a3[6]);
  *((unsigned char *)a1 + a3[7]) = *((unsigned char *)a2 + a3[7]);
  uint64_t v10 = a3[8];
  uint64_t v11 = (char *)a1 + v10;
  uint64_t v12 = (char *)a2 + v10;
  *(void *)((char *)a1 + v10) = *(void *)((char *)a2 + v10);
  swift_retain();
  swift_release();
  *((void *)v11 + 1) = *((void *)v12 + 1);
  swift_retain();
  swift_release();
  *((void *)v11 + 2) = *((void *)v12 + 2);
  uint64_t v13 = a3[9];
  CGFloat v14 = (char *)a1 + v13;
  uint64_t v15 = (char *)a2 + v13;
  *(void *)((char *)a1 + v13) = *(void *)((char *)a2 + v13);
  swift_retain();
  swift_release();
  *((void *)v14 + 1) = *((void *)v15 + 1);
  swift_retain();
  swift_release();
  *((void *)v14 + 2) = *((void *)v15 + 2);
  uint64_t v16 = a3[10];
  double v17 = (void *)((char *)a1 + v16);
  uint64_t v18 = (void *)((char *)a2 + v16);
  *(void *)((char *)a1 + v16) = *(void *)((char *)a2 + v16);
  swift_retain();
  swift_release();
  v17[1] = v18[1];
  swift_retain();
  swift_release();
  v17[2] = v18[2];
  void v17[3] = v18[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v19 = a3[11];
  uint64_t v20 = (char *)a1 + v19;
  uint64_t v21 = (char *)a2 + v19;
  *(void *)((char *)a1 + v19) = *(void *)((char *)a2 + v19);
  swift_retain();
  swift_release();
  *((void *)v20 + 1) = *((void *)v21 + 1);
  swift_retain();
  swift_release();
  uint64_t v22 = a3[12];
  uint64_t v23 = (char *)a1 + v22;
  uint64_t v24 = (char *)a2 + v22;
  *(void *)((char *)a1 + v22) = *(void *)((char *)a2 + v22);
  swift_retain();
  swift_release();
  *((void *)v23 + 1) = *((void *)v24 + 1);
  swift_retain();
  swift_release();
  return a1;
}

void *sub_100042264(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)a1 + v6;
  CGFloat v8 = (char *)a2 + v6;
  uint64_t v9 = type metadata accessor for AXLTCaption();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
  uint64_t v10 = a3[7];
  *((unsigned char *)a1 + a3[6]) = *((unsigned char *)a2 + a3[6]);
  *((unsigned char *)a1 + v10) = *((unsigned char *)a2 + v10);
  uint64_t v11 = a3[8];
  uint64_t v12 = a3[9];
  uint64_t v13 = (char *)a1 + v11;
  CGFloat v14 = (char *)a2 + v11;
  *(_OWORD *)uint64_t v13 = *(_OWORD *)v14;
  *((void *)v13 + 2) = *((void *)v14 + 2);
  uint64_t v15 = (char *)a1 + v12;
  uint64_t v16 = (char *)a2 + v12;
  *(_OWORD *)uint64_t v15 = *(_OWORD *)v16;
  *((void *)v15 + 2) = *((void *)v16 + 2);
  uint64_t v17 = a3[10];
  uint64_t v18 = a3[11];
  long long v19 = *(_OWORD *)((char *)a2 + v17);
  long long v20 = *(_OWORD *)((char *)a2 + v17 + 16);
  uint64_t v21 = (_OWORD *)((char *)a1 + v17);
  *uint64_t v21 = v19;
  v21[1] = v20;
  *(_OWORD *)((char *)a1 + v18) = *(_OWORD *)((char *)a2 + v18);
  *(_OWORD *)((char *)a1 + a3[12]) = *(_OWORD *)((char *)a2 + a3[12]);
  return a1;
}

void *sub_100042360(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)a1 + v6;
  CGFloat v8 = (char *)a2 + v6;
  uint64_t v9 = type metadata accessor for AXLTCaption();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 40))(v7, v8, v9);
  uint64_t v10 = a3[7];
  *((unsigned char *)a1 + a3[6]) = *((unsigned char *)a2 + a3[6]);
  *((unsigned char *)a1 + v10) = *((unsigned char *)a2 + v10);
  uint64_t v11 = a3[8];
  uint64_t v12 = (char *)a1 + v11;
  uint64_t v13 = (char *)a2 + v11;
  *(void *)((char *)a1 + v11) = *(void *)((char *)a2 + v11);
  swift_release();
  *((void *)v12 + 1) = *((void *)v13 + 1);
  swift_release();
  *((void *)v12 + 2) = *((void *)v13 + 2);
  uint64_t v14 = a3[9];
  uint64_t v15 = (char *)a1 + v14;
  uint64_t v16 = (char *)a2 + v14;
  *(void *)((char *)a1 + v14) = *(void *)((char *)a2 + v14);
  swift_release();
  *((void *)v15 + 1) = *((void *)v16 + 1);
  swift_release();
  *((void *)v15 + 2) = *((void *)v16 + 2);
  uint64_t v17 = a3[10];
  uint64_t v18 = (void *)((char *)a1 + v17);
  long long v19 = (void *)((char *)a2 + v17);
  *(void *)((char *)a1 + v17) = *(void *)((char *)a2 + v17);
  swift_release();
  v18[1] = v19[1];
  swift_release();
  uint64_t v20 = v19[3];
  v18[2] = v19[2];
  v18[3] = v20;
  swift_bridgeObjectRelease();
  uint64_t v21 = a3[11];
  uint64_t v22 = (char *)a1 + v21;
  uint64_t v23 = (char *)a2 + v21;
  *(void *)((char *)a1 + v21) = *(void *)((char *)a2 + v21);
  swift_release();
  *((void *)v22 + 1) = *((void *)v23 + 1);
  swift_release();
  uint64_t v24 = a3[12];
  uint64_t v25 = (char *)a1 + v24;
  id v26 = (void *)((char *)a2 + v24);
  *(void *)((char *)a1 + v24) = *v26;
  swift_release();
  *((void *)v25 + 1) = v26[1];
  swift_release();
  return a1;
}

uint64_t sub_1000424FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100042510);
}

uint64_t sub_100042510(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for AXLTCaption();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1 + *(int *)(a3 + 20);
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v10(v9, a2, v8);
  }
  else
  {
    unint64_t v12 = *(void *)(a1 + *(int *)(a3 + 32) + 8);
    if (v12 >= 0xFFFFFFFF) {
      LODWORD(v12) = -1;
    }
    return (v12 + 1);
  }
}

uint64_t sub_1000425D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000425EC);
}

uint64_t sub_1000425EC(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = type metadata accessor for AXLTCaption();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = result;
    uint64_t v11 = a1 + *(int *)(a4 + 20);
    unint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v12(v11, a2, a2, v10);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 32) + 8) = (a2 - 1);
  }
  return result;
}

uint64_t type metadata accessor for AXLTTextView(uint64_t a1)
{
  return sub_10004508C(a1, qword_10006C430);
}

uint64_t sub_1000426D0()
{
  uint64_t result = type metadata accessor for AXLTCaption();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_100042798()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1000427B4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  v29[1] = a1;
  uint64_t v30 = sub_100006380(&qword_10006C488);
  __chkstk_darwin(v30);
  uint64_t v4 = (char *)v29 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100006380(&qword_10006C490);
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v31 = sub_100006380(&qword_10006C498);
  __chkstk_darwin(v31);
  uint64_t v9 = (char *)v29 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for AXLTTextView(0);
  __chkstk_darwin(v10);
  unint64_t v12 = (char *)v29 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = AXLTCaption.appID.getter();
  uint64_t v15 = v14;
  if (v13 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v15 == v16)
  {
    swift_bridgeObjectRelease_n();
    sub_1000450C4((uint64_t)v2, (uint64_t)v12, type metadata accessor for AXLTTextView);
    goto LABEL_13;
  }
  char v18 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1000450C4((uint64_t)v2, (uint64_t)v12, type metadata accessor for AXLTTextView);
  if (v18)
  {
LABEL_13:
    sub_10004512C((uint64_t)v12, type metadata accessor for AXLTTextView);
    goto LABEL_14;
  }
  uint64_t v19 = AXLTCaption.appName.getter();
  uint64_t v21 = v20;
  if (v19 == placeholderMicName.getter() && v21 == v22)
  {
    swift_bridgeObjectRelease_n();
    goto LABEL_13;
  }
  char v24 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_10004512C((uint64_t)v12, type metadata accessor for AXLTTextView);
  if (v24)
  {
LABEL_14:
    *(void *)uint64_t v9 = static VerticalAlignment.center.getter();
    *((void *)v9 + 1) = 0;
    v9[16] = 1;
    uint64_t v27 = sub_100006380(&qword_10006C4D8);
    sub_100042BC4(v2, (uint64_t)&v9[*(int *)(v27 + 44)]);
    uint64_t v25 = &qword_10006C498;
    sub_100006754((uint64_t)v9, (uint64_t)v7, &qword_10006C498);
    swift_storeEnumTagMultiPayload();
    sub_1000068B8(&qword_10006C4A0, &qword_10006C498);
    sub_100044F28();
    _ConditionalContent<>.init(storage:)();
    uint64_t v26 = (uint64_t)v9;
    return sub_1000067B8(v26, v25);
  }
  sub_1000435A4((uint64_t)v2, (uint64_t)v4);
  uint64_t v25 = &qword_10006C488;
  sub_100006754((uint64_t)v4, (uint64_t)v7, &qword_10006C488);
  swift_storeEnumTagMultiPayload();
  sub_1000068B8(&qword_10006C4A0, &qword_10006C498);
  sub_100044F28();
  _ConditionalContent<>.init(storage:)();
  uint64_t v26 = (uint64_t)v4;
  return sub_1000067B8(v26, v25);
}

uint64_t sub_100042BC4@<X0>(double *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_100006380(&qword_10006C488);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)v26 - v8;
  uint64_t v10 = sub_100006380(&qword_10006C4E0);
  __chkstk_darwin(v10 - 8);
  unint64_t v12 = (char *)v26 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_100006380(&qword_10006C4E8);
  __chkstk_darwin(v13);
  uint64_t v15 = (char *)v26 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v16);
  char v18 = (char *)v26 - v17;
  *(void *)unint64_t v12 = static VerticalAlignment.center.getter();
  *((void *)v12 + 1) = 0;
  v12[16] = 1;
  uint64_t v19 = sub_100006380(&qword_10006C4F0);
  sub_100042F20(a1, (uint64_t)&v12[*(int *)(v19 + 44)]);
  if (qword_10006AE20 != -1) {
    swift_once();
  }
  uint64_t v20 = self;
  if (qword_10006AE10 != -1) {
    swift_once();
  }
  id v21 = [v20 preferredFontForTextStyle:titleFontStyle];
  [v21 pointSize];

  static Alignment.center.getter();
  _FrameLayout.init(width:height:alignment:)();
  sub_100006754((uint64_t)v12, (uint64_t)v15, &qword_10006C4E0);
  uint64_t v22 = &v15[*(int *)(v13 + 36)];
  long long v23 = v26[1];
  *(_OWORD *)uint64_t v22 = v26[0];
  *((_OWORD *)v22 + 1) = v23;
  *((_OWORD *)v22 + 2) = v26[2];
  sub_1000067B8((uint64_t)v12, &qword_10006C4E0);
  sub_10000A940((uint64_t)v15, (uint64_t)v18, &qword_10006C4E8);
  sub_1000435A4((uint64_t)a1, (uint64_t)v9);
  sub_100006754((uint64_t)v18, (uint64_t)v15, &qword_10006C4E8);
  sub_100006754((uint64_t)v9, (uint64_t)v6, &qword_10006C488);
  sub_100006754((uint64_t)v15, a2, &qword_10006C4E8);
  uint64_t v24 = sub_100006380(&qword_10006C4F8);
  sub_100006754((uint64_t)v6, a2 + *(int *)(v24 + 48), &qword_10006C488);
  sub_1000067B8((uint64_t)v9, &qword_10006C488);
  sub_1000067B8((uint64_t)v18, &qword_10006C4E8);
  sub_1000067B8((uint64_t)v6, &qword_10006C488);
  return sub_1000067B8((uint64_t)v15, &qword_10006C4E8);
}

uint64_t sub_100042F20@<X0>(double *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v40 = a2;
  uint64_t v43 = sub_100006380(&qword_10006AF40);
  __chkstk_darwin(v43);
  uint64_t v4 = (char *)&v40 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v42 = type metadata accessor for RoundedRectangle();
  __chkstk_darwin(v42);
  uint64_t v6 = (double *)((char *)&v40 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v7 = type metadata accessor for AXLTTextView(0);
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v40 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v41 = sub_100006380(&qword_10006C500);
  __chkstk_darwin(v41);
  uint64_t v11 = (char *)&v40 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = AXLTCaption.text.getter();
  uint64_t v14 = v13;
  if (v12 == placeholderPausedText.getter() && v14 == v15)
  {
    swift_bridgeObjectRelease_n();
    sub_1000450C4((uint64_t)a1, (uint64_t)v9, type metadata accessor for AXLTTextView);
LABEL_12:
    sub_10004512C((uint64_t)v9, type metadata accessor for AXLTTextView);
    uint64_t v23 = v40;
    goto LABEL_13;
  }
  char v16 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1000450C4((uint64_t)a1, (uint64_t)v9, type metadata accessor for AXLTTextView);
  if (v16) {
    goto LABEL_12;
  }
  uint64_t v17 = AXLTCaption.placeholder.getter();
  uint64_t v19 = v18;
  if (v17 == placeholderPausedText.getter() && v19 == v20)
  {
    swift_bridgeObjectRelease_n();
    goto LABEL_12;
  }
  char v22 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_10004512C((uint64_t)v9, type metadata accessor for AXLTTextView);
  uint64_t v23 = v40;
  if (v22)
  {
LABEL_13:
    uint64_t v24 = static Color.gray.getter();
    goto LABEL_14;
  }
  uint64_t v24 = static Color.blue.getter();
LABEL_14:
  uint64_t v25 = v24;
  char v26 = static Edge.Set.all.getter();
  double v27 = *a1;
  double v28 = *a1;
  uint64_t v29 = static Alignment.center.getter();
  sub_1000433C8(v28, 0, 0.0, 1, v28, 0, 0.0, 1, (uint64_t)v53, 0.4, 0.0, 1, 0.0, 1, v29, v30, v25, v26);
  swift_release();
  long long v50 = v53[6];
  long long v51 = v53[7];
  uint64_t v52 = v54;
  long long v46 = v53[2];
  long long v47 = v53[3];
  long long v48 = v53[4];
  long long v49 = v53[5];
  long long v44 = v53[0];
  long long v45 = v53[1];
  double v31 = v27 * 0.5;
  uint64_t v32 = (char *)v6 + *(int *)(v42 + 20);
  uint64_t v33 = enum case for RoundedCornerStyle.continuous(_:);
  uint64_t v34 = type metadata accessor for RoundedCornerStyle();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v34 - 8) + 104))(v32, v33, v34);
  double *v6 = v31;
  v6[1] = v31;
  sub_1000450C4((uint64_t)v6, (uint64_t)v4, (uint64_t (*)(void))&type metadata accessor for RoundedRectangle);
  *(_WORD *)&v4[*(int *)(v43 + 36)] = 256;
  sub_100006754((uint64_t)v4, (uint64_t)&v11[*(int *)(v41 + 36)], &qword_10006AF40);
  long long v35 = v51;
  *((_OWORD *)v11 + 6) = v50;
  *((_OWORD *)v11 + 7) = v35;
  *((void *)v11 + 16) = v52;
  long long v36 = v47;
  *((_OWORD *)v11 + 2) = v46;
  *((_OWORD *)v11 + 3) = v36;
  long long v37 = v49;
  *((_OWORD *)v11 + 4) = v48;
  *((_OWORD *)v11 + 5) = v37;
  long long v38 = v45;
  *(_OWORD *)uint64_t v11 = v44;
  *((_OWORD *)v11 + 1) = v38;
  sub_1000065F4((uint64_t)&v44);
  sub_1000067B8((uint64_t)v4, &qword_10006AF40);
  sub_10004512C((uint64_t)v6, (uint64_t (*)(void))&type metadata accessor for RoundedRectangle);
  sub_100006620((uint64_t)&v44);
  return sub_10000A940((uint64_t)v11, v23, &qword_10006C500);
}

uint64_t sub_1000433C8@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10@<D0>, double a11, char a12, double a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18)
{
  char v20 = a18;
  if (a2) {
    a1 = -INFINITY;
  }
  if (a4) {
    a3 = a1;
  }
  if (a6) {
    a5 = a3;
  }
  if (a1 > a3 || a3 > a5) {
    goto LABEL_22;
  }
  if (a8) {
    a7 = -INFINITY;
  }
  if (a12) {
    a11 = a7;
  }
  if (a14) {
    a13 = a11;
  }
  if (a7 > a11 || a11 > a13)
  {
LABEL_22:
    static os_log_type_t.fault.getter();
    uint64_t v29 = (void *)static Log.runtimeIssuesLog.getter();
    os_log(_:dso:log:_:_:)();

    char v20 = a18;
  }
  _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)();
  *(double *)(a9 + 16) = a10;
  *(_OWORD *)(a9 + 72) = v34;
  *(_OWORD *)(a9 + 88) = v35;
  *(_OWORD *)(a9 + 104) = v36;
  *(_OWORD *)(a9 + 120) = v37;
  *(_OWORD *)(a9 + 24) = v31;
  *(_OWORD *)(a9 + 40) = v32;
  *(void *)a9 = a17;
  *(unsigned char *)(a9 + 8) = v20;
  *(_OWORD *)(a9 + 56) = v33;

  return swift_retain();
}

uint64_t sub_1000435A4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v128 = a2;
  uint64_t v3 = type metadata accessor for AXLTCaption();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v123 = (int *)((char *)&v105 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v127 = type metadata accessor for AXLTTextScrollView(0);
  __chkstk_darwin(v127);
  uint64_t v7 = (char *)&v105 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v125 = sub_100006380(&qword_10006C508);
  __chkstk_darwin(v125);
  uint64_t v126 = (uint64_t)&v105 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = (int *)type metadata accessor for AXLTTextView(0);
  uint64_t v119 = *((void *)v9 - 1);
  __chkstk_darwin(v9);
  uint64_t v120 = v10;
  uint64_t v11 = (char *)&v105 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = type metadata accessor for NSNotificationCenter.Publisher();
  uint64_t v122 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  uint64_t v14 = (char *)&v105 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v116 = (void *)type metadata accessor for AccessibilityTraits();
  uint64_t v115 = *(v116 - 1);
  __chkstk_darwin(v116);
  id v114 = (char *)&v105 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = type metadata accessor for AttributedString();
  __chkstk_darwin(v16 - 8);
  uint64_t v18 = (char *)&v105 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v112 = sub_100006380(&qword_10006C510);
  __chkstk_darwin(v112);
  uint64_t v113 = (char *)&v105 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v20);
  uint64_t v118 = (char *)&v105 - v21;
  uint64_t v117 = sub_100006380(&qword_10006C518);
  __chkstk_darwin(v117);
  uint64_t v121 = (uint64_t)&v105 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v124 = sub_100006380(&qword_10006C4C8);
  __chkstk_darwin(v124);
  double v26 = __chkstk_darwin(v23);
  uint64_t v27 = a1 + v9[5];
  if (*(unsigned char *)(a1 + v9[6]) == 1)
  {
    uint64_t v106 = v25;
    uint64_t v107 = (uint64_t)&v105 - v24;
    uint64_t v108 = v11;
    unint64_t v109 = v14;
    uint64_t v110 = v12;
    sub_1000444A0(v27, (uint64_t)v18);
    uint64_t v28 = Text.init(_:)();
    uint64_t v30 = v29;
    char v32 = v31;
    uint64_t v123 = v9;
    uint64_t v33 = v9[11];
    uint64_t v111 = a1;
    long long v34 = (uint64_t *)(a1 + v33);
    uint64_t v36 = *v34;
    uint64_t v35 = v34[1];
    uint64_t v129 = v36;
    uint64_t v130 = v35;
    sub_100006380(&qword_10006B318);
    State.wrappedValue.getter();
    uint64_t v37 = AXLTCaption.appID.getter();
    uint64_t v39 = v38;
    if (v37 == placeholderID.getter() && v39 == v40)
    {
      swift_bridgeObjectRelease_n();
    }
    else
    {
      _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    Color.opacity(_:)();
    swift_release();
    uint64_t v60 = Text.foregroundColor(_:)();
    uint64_t v62 = v61;
    char v64 = v63;
    swift_release();
    sub_10000F048(v28, v30, v32 & 1);
    swift_bridgeObjectRelease();
    uint64_t v65 = v111;
    uint64_t v66 = (uint64_t *)(v111 + v123[12]);
    uint64_t v68 = *v66;
    uint64_t v67 = v66[1];
    uint64_t v129 = v68;
    uint64_t v130 = v67;
    sub_100006380(&qword_10006B3C0);
    State.wrappedValue.getter();
    uint64_t v69 = Text.font(_:)();
    uint64_t v71 = v70;
    char v73 = v72;
    uint64_t v75 = v74;
    swift_release();
    v73 &= 1u;
    sub_10000F048(v60, v62, v64 & 1);
    swift_bridgeObjectRelease();
    uint64_t KeyPath = swift_getKeyPath();
    uint64_t v129 = v69;
    uint64_t v130 = v71;
    LOBYTE(v131) = v73;
    uint64_t v132 = v75;
    uint64_t v133 = KeyPath;
    uint64_t v134 = 0;
    char v135 = 1;
    sub_100006380(&qword_10006C520);
    sub_10004A4B0(&qword_10006C528, &qword_10006C520, &qword_10006B3E8, &qword_10006B3F0);
    uint64_t v77 = (uint64_t)v113;
    View.accessibility(identifier:)();
    sub_10000F048(v69, v71, v73);
    swift_release();
    swift_bridgeObjectRelease();
    LODWORD(v75) = *(unsigned __int8 *)(v65 + v123[7]);
    sub_100006380(&qword_10006C338);
    uint64_t v78 = v115;
    if (v75 == 1)
    {
      uint64_t v79 = swift_allocObject();
      *(_OWORD *)(v79 + 16) = xmmword_1000545C0;
      static AccessibilityTraits.updatesFrequently.getter();
    }
    else
    {
      uint64_t v79 = swift_allocObject();
      *(_OWORD *)(v79 + 16) = xmmword_100054300;
    }
    static AccessibilityTraits.isStaticText.getter();
    uint64_t v129 = v79;
    sub_100048424(&qword_10006C300, (void (*)(uint64_t))&type metadata accessor for AccessibilityTraits);
    sub_100006380(&qword_10006C308);
    sub_1000068B8(&qword_10006C310, &qword_10006C308);
    uint64_t v80 = v114;
    uint64_t v81 = v116;
    dispatch thunk of SetAlgebra.init<A>(_:)();
    uint64_t v82 = v121;
    uint64_t v83 = (uint64_t)v118;
    ModifiedContent<>.accessibilityAddTraits(_:)();
    (*(void (**)(char *, void *))(v78 + 8))(v80, v81);
    sub_1000067B8(v77, &qword_10006C510);
    uint64_t v123 = (int *)self;
    id v84 = [v123 defaultCenter];
    if (qword_10006ADD0 != -1) {
      swift_once();
    }
    long long v85 = v109;
    NSNotificationCenter.publisher(for:object:)();

    uint64_t v86 = (uint64_t)v108;
    sub_1000450C4(v65, (uint64_t)v108, type metadata accessor for AXLTTextView);
    uint64_t v87 = *(unsigned __int8 *)(v119 + 80);
    uint64_t v88 = (v87 + 16) & ~v87;
    v120 += v88;
    uint64_t v119 = v87 | 7;
    uint64_t v89 = swift_allocObject();
    uint64_t v121 = v88;
    sub_100049B94(v86, v89 + v88, type metadata accessor for AXLTTextView);
    sub_100006754(v83, v82, &qword_10006C510);
    uint64_t v90 = v117;
    uint64_t v91 = v82 + *(int *)(v117 + 52);
    uint64_t v92 = v122;
    uint64_t v93 = v83;
    uint64_t v94 = v65;
    uint64_t v95 = v82;
    uint64_t v96 = v110;
    uint64_t v116 = *(void **)(v122 + 16);
    ((void (*)(uint64_t, char *, uint64_t))v116)(v91, v85, v110);
    uint64_t v97 = (uint64_t (**)(uint64_t))(v95 + *(int *)(v90 + 56));
    void *v97 = sub_100048470;
    v97[1] = (uint64_t (*)(uint64_t))v89;
    char v98 = *(void (**)(char *, uint64_t))(v92 + 8);
    v98(v85, v96);
    sub_1000067B8(v93, &qword_10006C510);
    id v99 = [v123 defaultCenter];
    if (qword_10006ADE0 != -1) {
      swift_once();
    }
    NSNotificationCenter.publisher(for:object:)();

    sub_1000450C4(v94, v86, type metadata accessor for AXLTTextView);
    uint64_t v100 = swift_allocObject();
    sub_100049B94(v86, v100 + v121, type metadata accessor for AXLTTextView);
    uint64_t v101 = v106;
    sub_100006754(v95, v106, &qword_10006C518);
    uint64_t v102 = v124;
    ((void (*)(uint64_t, char *, uint64_t))v116)(v101 + *(int *)(v124 + 52), v85, v96);
    uint64_t v103 = (uint64_t (**)(uint64_t))(v101 + *(int *)(v102 + 56));
    *uint64_t v103 = sub_10004860C;
    v103[1] = (uint64_t (*)(uint64_t))v100;
    v98(v85, v96);
    sub_1000067B8(v95, &qword_10006C518);
    uint64_t v104 = v107;
    sub_10000A940(v101, v107, &qword_10006C4C8);
    sub_100006754(v104, v126, &qword_10006C4C8);
    swift_storeEnumTagMultiPayload();
    sub_1000068B8(&qword_10006C4C0, &qword_10006C4C8);
    sub_100048424(&qword_10006C4D0, (void (*)(uint64_t))type metadata accessor for AXLTTextScrollView);
    _ConditionalContent<>.init(storage:)();
    return sub_1000067B8(v104, &qword_10006C4C8);
  }
  else
  {
    (*(void (**)(int *, uint64_t, uint64_t, double))(v4 + 16))(v123, a1 + v9[5], v3, v26);
    uint64_t v41 = (void *)(a1 + v9[8]);
    uint64_t v42 = v41[1];
    uint64_t v43 = v41[2];
    *(void *)&long long v136 = *v41;
    *((void *)&v136 + 1) = v42;
    uint64_t v137 = v43;
    sub_100006380(&qword_10006BAF0);
    Binding.projectedValue.getter();
    uint64_t v122 = v129;
    uint64_t v121 = v130;
    double v44 = v131;
    long long v45 = (long long *)(a1 + v9[9]);
    long long v46 = *v45;
    uint64_t v47 = *((void *)v45 + 2);
    long long v136 = v46;
    uint64_t v137 = v47;
    sub_100006380(&qword_10006BE00);
    Binding.projectedValue.getter();
    uint64_t v48 = v129;
    uint64_t v49 = v130;
    uint64_t v50 = *(void *)&v131;
    long long v51 = (long long *)(a1 + v9[10]);
    long long v52 = *v51;
    uint64_t v54 = *((void *)v51 + 2);
    uint64_t v53 = *((void *)v51 + 3);
    long long v136 = v52;
    uint64_t v137 = v54;
    uint64_t v138 = v53;
    sub_100006380(&qword_10006BE08);
    Binding.projectedValue.getter();
    uint64_t v55 = v129;
    uint64_t v56 = v130;
    uint64_t v57 = *(void *)&v131;
    uint64_t v58 = v132;
    if (qword_10006AE20 != -1) {
      swift_once();
    }
    swift_beginAccess();
    swift_beginAccess();
    swift_retain();
    swift_retain();
    sub_100044D70((uint64_t)v123, v122, v121, v48, v49, v50, v55, v56, (uint64_t)v7, v44, v57, v58);
    sub_1000450C4((uint64_t)v7, v126, type metadata accessor for AXLTTextScrollView);
    swift_storeEnumTagMultiPayload();
    sub_1000068B8(&qword_10006C4C0, &qword_10006C4C8);
    sub_100048424(&qword_10006C4D0, (void (*)(uint64_t))type metadata accessor for AXLTTextScrollView);
    _ConditionalContent<>.init(storage:)();
    return sub_10004512C((uint64_t)v7, type metadata accessor for AXLTTextScrollView);
  }
}

unint64_t sub_1000444A0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = type metadata accessor for Text.LineStyle.Pattern();
  __chkstk_darwin(v4 - 8);
  uint64_t v49 = (char *)&v46 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100006380(&qword_10006C530);
  __chkstk_darwin(v6 - 8);
  uint64_t v48 = (char *)&v46 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for AttributedString();
  uint64_t v47 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v50 = (char *)&v46 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  uint64_t v12 = (char *)&v46 - v11;
  __chkstk_darwin(v13);
  uint64_t v54 = (char *)&v46 - v14;
  uint64_t v15 = type metadata accessor for AttributeContainer();
  __chkstk_darwin(v15 - 8);
  uint64_t v17 = (char *)&v46 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v55 = a1;
  unint64_t v18 = AXLTCaption.segments.getter();
  if (v18 >> 62) {
    goto LABEL_41;
  }
  uint64_t v19 = *(void *)((v18 & 0xFFFFFFFFFFFFFF8) + 0x10);
LABEL_3:
  swift_bridgeObjectRelease();
  if (!v19)
  {
    AXLTCaption.text.getter();
    AttributeContainer.init()();
    return AttributedString.init(_:attributes:)();
  }
  AttributedString.init(stringLiteral:)();
  unint64_t result = AXLTCaption.segments.getter();
  unint64_t v21 = result;
  uint64_t v46 = a2;
  if (result >> 62)
  {
    unint64_t result = _CocoaArrayWrapper.endIndex.getter();
    a2 = result;
    if (result) {
      goto LABEL_6;
    }
LABEL_43:
    swift_bridgeObjectRelease();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v47 + 32))(v46, v54, v8);
  }
  a2 = *(void *)((result & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!a2) {
    goto LABEL_43;
  }
LABEL_6:
  if (a2 >= 1)
  {
    uint64_t v22 = 0;
    long long v52 = (void (**)(char *, uint64_t))(v47 + 8);
    unint64_t v53 = v21 & 0xC000000000000001;
    uint64_t v51 = a2;
    while (1)
    {
      if (v53) {
        id v23 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
      }
      else {
        id v23 = *(id *)(v21 + 8 * v22 + 32);
      }
      uint64_t v24 = v23;
      id v25 = objc_msgSend(v23, "substring", v46);
      static String._unconditionallyBridgeFromObjectiveC(_:)();

      AttributeContainer.init()();
      AttributedString.init(_:attributes:)();
      [v24 confidence];
      if (v26 != 0.0)
      {
        [v24 confidence];
        if (v27 < 0.5)
        {
          uint64_t KeyPath = swift_getKeyPath();
          __chkstk_darwin(KeyPath);
          *(&v46 - 2) = v29;
          swift_getKeyPath();
          static Text.LineStyle.Pattern.dot.getter();
          static Color.blue.getter();
          uint64_t v30 = v48;
          Text.LineStyle.init(pattern:color:)();
          uint64_t v31 = type metadata accessor for Text.LineStyle();
          (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v31 - 8) + 56))(v30, 0, 1, v31);
          sub_1000488C0();
          AttributedString.subscript.setter();
        }
      }
      sub_100048424(&qword_10006C538, (void (*)(uint64_t))&type metadata accessor for AttributedString);
      AttributedString.append<A>(_:)();
      unint64_t v32 = AXLTCaption.segments.getter();
      if (v32 >> 62) {
        uint64_t v33 = _CocoaArrayWrapper.endIndex.getter();
      }
      else {
        uint64_t v33 = *(void *)((v32 & 0xFFFFFFFFFFFFFF8) + 0x10);
      }
      swift_bridgeObjectRelease();
      uint64_t v34 = v33 - 1;
      if (__OFSUB__(v33, 1))
      {
        __break(1u);
LABEL_37:
        __break(1u);
LABEL_38:
        __break(1u);
LABEL_39:
        __break(1u);
LABEL_40:
        __break(1u);
LABEL_41:
        uint64_t v19 = _CocoaArrayWrapper.endIndex.getter();
        goto LABEL_3;
      }
      unint64_t v35 = v22 + 1;
      if (v22 < v34) {
        break;
      }
      (*v52)(v12, v8);

LABEL_9:
      uint64_t v22 = v35;
      if (a2 == v35) {
        goto LABEL_43;
      }
    }
    uint64_t v36 = (char *)[v24 substringRange];
    [v24 substringRange];
    uint64_t v38 = &v36[v37];
    if (__OFADD__(v36, v37)) {
      goto LABEL_37;
    }
    a2 = (uint64_t)v17;
    uint64_t v17 = (char *)v21;
    uint64_t v39 = (uint64_t)(v38 - 1);
    if (__OFSUB__(v38, 1)) {
      goto LABEL_38;
    }
    uint64_t v40 = AXLTCaption.segments.getter();
    if ((v40 & 0xC000000000000001) != 0)
    {
      id v41 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
    }
    else
    {
      if (v35 >= *(void *)((v40 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
        goto LABEL_39;
      }
      id v41 = *(id *)(v40 + 8 * v22 + 40);
    }
    uint64_t v42 = v41;
    swift_bridgeObjectRelease();
    if ((uint64_t)[v42 substringRange] >= v39)
    {
      id v44 = [v42 substringRange];
      if (__OFSUB__(v44, v39)) {
        goto LABEL_40;
      }
      if ((uint64_t)v44 - v39 < 2)
      {
        (*v52)(v12, v8);

        goto LABEL_32;
      }
      uint64_t v43 = v50;
    }
    else
    {
      uint64_t v43 = v50;
    }
    AttributedString.init(stringLiteral:)();
    AttributedString.append<A>(_:)();

    long long v45 = *v52;
    (*v52)(v43, v8);
    v45(v12, v8);
LABEL_32:
    unint64_t v21 = (unint64_t)v17;
    uint64_t v17 = (char *)a2;
    a2 = v51;
    goto LABEL_9;
  }
  __break(1u);
  return result;
}

uint64_t sub_100044B38(uint64_t a1, uint64_t a2)
{
  uint64_t result = Notification.userInfo.getter();
  if (result)
  {
    uint64_t v4 = result;
    uint64_t v10 = notificationValueKey.getter();
    AnyHashable.init<A>(_:)();
    if (*(void *)(v4 + 16) && (unint64_t v5 = sub_1000486C0((uint64_t)v11), (v6 & 1) != 0))
    {
      sub_10000E914(*(void *)(v4 + 56) + 32 * v5, (uint64_t)&v12);
    }
    else
    {
      long long v12 = 0u;
      long long v13 = 0u;
    }
    swift_bridgeObjectRelease();
    sub_10000ED94((uint64_t)v11);
    if (*((void *)&v13 + 1))
    {
      uint64_t result = swift_dynamicCast();
      if (result)
      {
        uint64_t v7 = (uint64_t *)(a2 + *(int *)(type metadata accessor for AXLTTextView(0) + 44));
        uint64_t v9 = *v7;
        uint64_t v8 = v7[1];
        v11[0] = v9;
        v11[1] = v8;
        *(void *)&long long v12 = v10;
        sub_100006380(&qword_10006B318);
        return State.wrappedValue.setter();
      }
    }
    else
    {
      return sub_1000067B8((uint64_t)&v12, &qword_10006C150);
    }
  }
  return result;
}

uint64_t sub_100044C54(uint64_t a1, uint64_t a2)
{
  uint64_t result = Notification.userInfo.getter();
  if (result)
  {
    uint64_t v4 = result;
    uint64_t v10 = notificationValueKey.getter();
    AnyHashable.init<A>(_:)();
    if (*(void *)(v4 + 16) && (unint64_t v5 = sub_1000486C0((uint64_t)v11), (v6 & 1) != 0))
    {
      sub_10000E914(*(void *)(v4 + 56) + 32 * v5, (uint64_t)&v12);
    }
    else
    {
      long long v12 = 0u;
      long long v13 = 0u;
    }
    swift_bridgeObjectRelease();
    sub_10000ED94((uint64_t)v11);
    if (*((void *)&v13 + 1))
    {
      uint64_t result = swift_dynamicCast();
      if (result)
      {
        uint64_t v7 = (uint64_t *)(a2 + *(int *)(type metadata accessor for AXLTTextView(0) + 48));
        uint64_t v9 = *v7;
        uint64_t v8 = v7[1];
        v11[0] = v9;
        v11[1] = v8;
        *(void *)&long long v12 = v10;
        sub_100006380(&qword_10006B3C0);
        return State.wrappedValue.setter();
      }
    }
    else
    {
      return sub_1000067B8((uint64_t)&v12, &qword_10006C150);
    }
  }
  return result;
}

double sub_100044D70@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, double a10@<D0>, uint64_t a11, uint64_t a12)
{
  uint64_t v20 = type metadata accessor for AXLTCaption();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 32))(a9, a1, v20);
  unint64_t v21 = (int *)type metadata accessor for AXLTTextScrollView(0);
  uint64_t v22 = a9 + v21[5];
  *(void *)uint64_t v22 = a2;
  *(void *)(v22 + 8) = a3;
  *(double *)(v22 + 16) = a10;
  id v23 = (void *)(a9 + v21[6]);
  void *v23 = a4;
  v23[1] = a5;
  v23[2] = a6;
  uint64_t v24 = (void *)(a9 + v21[7]);
  *uint64_t v24 = a7;
  v24[1] = a8;
  v24[2] = a11;
  v24[3] = a12;
  id v25 = (_OWORD *)(a9 + v21[8]);
  State.init(wrappedValue:)();
  _OWORD *v25 = v32;
  float v26 = (_OWORD *)(a9 + v21[9]);
  State.init(wrappedValue:)();
  *float v26 = v32;
  float v27 = (uint64_t *)(a9 + v21[10]);
  *float v27 = swift_getKeyPath();
  sub_100006380(&qword_10006B218);
  swift_storeEnumTagMultiPayload();
  uint64_t v28 = v21[11];
  sub_100006380(&qword_10006B428);
  State.init(wrappedValue:)();
  double result = *(double *)&v32;
  *(_OWORD *)(a9 + v28) = v32;
  return result;
}

unint64_t sub_100044F28()
{
  unint64_t result = qword_10006C4A8;
  if (!qword_10006C4A8)
  {
    sub_10000646C(&qword_10006C488);
    sub_100044F9C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006C4A8);
  }
  return result;
}

unint64_t sub_100044F9C()
{
  unint64_t result = qword_10006C4B0;
  if (!qword_10006C4B0)
  {
    sub_10000646C(&qword_10006C4B8);
    sub_1000068B8(&qword_10006C4C0, &qword_10006C4C8);
    sub_100048424(&qword_10006C4D0, (void (*)(uint64_t))type metadata accessor for AXLTTextScrollView);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006C4B0);
  }
  return result;
}

uint64_t type metadata accessor for AXLTTextScrollView(uint64_t a1)
{
  return sub_10004508C(a1, qword_10006C5A8);
}

uint64_t sub_10004508C(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1000450C4(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_10004512C(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_10004518C@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v77 = a2;
  uint64_t v3 = type metadata accessor for AXLTTextScrollView(0);
  uint64_t v74 = *(char **)(v3 - 8);
  __chkstk_darwin(v3 - 8);
  uint64_t v75 = v4;
  uint64_t v79 = (uint64_t)&v63 - ((unint64_t)(v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v82 = type metadata accessor for NSNotificationCenter.Publisher();
  uint64_t v76 = *(void *)(v82 - 8);
  __chkstk_darwin(v82);
  uint64_t v81 = (char *)&v63 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v73 = (void *)type metadata accessor for AccessibilityTraits();
  uint64_t v68 = *(v73 - 1);
  uint64_t v69 = (char *)(v73 - 1);
  uint64_t v70 = v68;
  __chkstk_darwin(v73 - 1);
  uint64_t v71 = (char *)&v63 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100006380(&qword_10006C608);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v63 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100006380(&qword_10006C610);
  uint64_t v11 = v10 - 8;
  __chkstk_darwin(v10);
  long long v13 = (char *)&v63 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_100006380(&qword_10006C618);
  __chkstk_darwin(v14 - 8);
  uint64_t v16 = (char *)&v63 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_100006380(&qword_10006C620);
  uint64_t v18 = v17 - 8;
  __chkstk_darwin(v17);
  uint64_t v20 = (char *)&v63 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v66 = sub_100006380(&qword_10006C628);
  __chkstk_darwin(v66);
  uint64_t v22 = (char *)&v63 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v67 = sub_100006380(&qword_10006C630);
  __chkstk_darwin(v67);
  char v64 = (char *)&v63 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v24);
  uint64_t v65 = (char *)&v63 - v25;
  uint64_t v72 = sub_100006380(&qword_10006C638);
  __chkstk_darwin(v72);
  uint64_t v78 = (uint64_t)&v63 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)uint64_t v16 = static VerticalAlignment.top.getter();
  *((void *)v16 + 1) = 0;
  v16[16] = 1;
  char v63 = &v16[*(int *)(sub_100006380(&qword_10006C640) + 44)];
  *(void *)uint64_t v9 = static VerticalAlignment.bottom.getter();
  *((void *)v9 + 1) = 0;
  v9[16] = 1;
  uint64_t v27 = (uint64_t)&v9[*(int *)(sub_100006380(&qword_10006C648) + 44)];
  uint64_t v80 = a1;
  sub_100045BF0(a1, v27);
  GeometryProxy.size.getter();
  GeometryProxy.size.getter();
  static Alignment.bottomLeading.getter();
  _FrameLayout.init(width:height:alignment:)();
  sub_100006754((uint64_t)v9, (uint64_t)v13, &qword_10006C608);
  uint64_t v28 = &v13[*(int *)(v11 + 44)];
  long long v29 = v85;
  *(_OWORD *)uint64_t v28 = v84;
  *((_OWORD *)v28 + 1) = v29;
  *((_OWORD *)v28 + 2) = v86;
  sub_1000067B8((uint64_t)v9, &qword_10006C608);
  sub_10000A940((uint64_t)v13, (uint64_t)v63, &qword_10006C610);
  GeometryProxy.size.getter();
  GeometryProxy.size.getter();
  static Alignment.center.getter();
  _FrameLayout.init(width:height:alignment:)();
  sub_100006754((uint64_t)v16, (uint64_t)v20, &qword_10006C618);
  uint64_t v30 = &v20[*(int *)(v18 + 44)];
  long long v31 = v88;
  *(_OWORD *)uint64_t v30 = v87;
  *((_OWORD *)v30 + 1) = v31;
  *((_OWORD *)v30 + 2) = v89;
  sub_1000067B8((uint64_t)v16, &qword_10006C618);
  sub_100006754((uint64_t)v20, (uint64_t)v22, &qword_10006C620);
  *(_WORD *)&v22[*(int *)(v66 + 36)] = 0;
  sub_1000067B8((uint64_t)v20, &qword_10006C620);
  sub_100049C7C();
  uint64_t v32 = (uint64_t)v64;
  View.accessibility(identifier:)();
  uint64_t v33 = (uint64_t)v22;
  uint64_t v34 = (uint64_t)v65;
  sub_1000067B8(v33, &qword_10006C628);
  sub_100006380(&qword_10006C338);
  uint64_t v35 = v70;
  uint64_t v36 = swift_allocObject();
  *(_OWORD *)(v36 + 16) = xmmword_1000545C0;
  static AccessibilityTraits.updatesFrequently.getter();
  static AccessibilityTraits.isStaticText.getter();
  uint64_t v83 = v36;
  sub_100048424(&qword_10006C300, (void (*)(uint64_t))&type metadata accessor for AccessibilityTraits);
  sub_100006380(&qword_10006C308);
  sub_1000068B8(&qword_10006C310, &qword_10006C308);
  uint64_t v37 = v71;
  uint64_t v38 = v73;
  dispatch thunk of SetAlgebra.init<A>(_:)();
  ModifiedContent<>.accessibilityAddTraits(_:)();
  (*(void (**)(char *, void *))(v35 + 8))(v37, v38);
  sub_1000067B8(v32, &qword_10006C630);
  char v73 = self;
  id v39 = [v73 defaultCenter];
  if (qword_10006ADD0 != -1) {
    swift_once();
  }
  uint64_t v40 = v81;
  NSNotificationCenter.publisher(for:object:)();

  uint64_t v41 = v79;
  sub_1000450C4(v80, v79, type metadata accessor for AXLTTextScrollView);
  uint64_t v42 = v74[80];
  uint64_t v43 = (v42 + 16) & ~v42;
  uint64_t v74 = &v75[v43];
  uint64_t v71 = (char *)(v42 | 7);
  uint64_t v44 = swift_allocObject();
  sub_100049B94(v41, v44 + v43, type metadata accessor for AXLTTextScrollView);
  uint64_t v45 = v78;
  sub_100006754(v34, v78, &qword_10006C630);
  uint64_t v46 = v72;
  uint64_t v47 = v45 + *(int *)(v72 + 52);
  uint64_t v48 = v34;
  uint64_t v49 = v76;
  uint64_t v50 = v82;
  uint64_t v75 = *(char **)(v76 + 16);
  ((void (*)(uint64_t, char *, uint64_t))v75)(v47, v40, v82);
  uint64_t v51 = (uint64_t (**)(uint64_t))(v45 + *(int *)(v46 + 56));
  *uint64_t v51 = sub_100049FB4;
  v51[1] = (uint64_t (*)(uint64_t))v44;
  long long v52 = *(void (**)(char *, uint64_t))(v49 + 8);
  v52(v40, v50);
  sub_1000067B8(v48, &qword_10006C630);
  id v53 = [v73 defaultCenter];
  if (qword_10006ADE0 != -1) {
    swift_once();
  }
  uint64_t v54 = v81;
  NSNotificationCenter.publisher(for:object:)();

  uint64_t v55 = v79;
  sub_1000450C4(v80, v79, type metadata accessor for AXLTTextScrollView);
  uint64_t v56 = swift_allocObject();
  sub_100049B94(v55, v56 + v43, type metadata accessor for AXLTTextScrollView);
  uint64_t v57 = v77;
  uint64_t v58 = v78;
  sub_100006754(v78, v77, &qword_10006C638);
  uint64_t v59 = sub_100006380(&qword_10006C668);
  uint64_t v60 = v82;
  ((void (*)(uint64_t, char *, uint64_t))v75)(v57 + *(int *)(v59 + 52), v54, v82);
  uint64_t v61 = (uint64_t (**)(uint64_t))(v57 + *(int *)(v59 + 56));
  *uint64_t v61 = sub_100049FE4;
  v61[1] = (uint64_t (*)(uint64_t))v56;
  v52(v54, v60);
  return sub_1000067B8(v58, &qword_10006C638);
}

uint64_t sub_100045BF0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v60 = a2;
  uint64_t v61 = type metadata accessor for AXLTCaption();
  uint64_t v59 = *(void *)(v61 - 8);
  __chkstk_darwin(v61);
  uint64_t v58 = &v28[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v4 = type metadata accessor for AXLTTextScrollView(0);
  uint64_t v5 = v4 - 8;
  uint64_t v52 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v52 + 64);
  __chkstk_darwin(v4);
  uint64_t v7 = &v28[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_1000462F0(v86);
  uint64_t v55 = v86[1];
  uint64_t v56 = v86[0];
  char v8 = v86[2];
  uint64_t v57 = v86[3];
  uint64_t v9 = (uint64_t *)(a1 + *(int *)(v5 + 44));
  uint64_t v11 = *v9;
  uint64_t v10 = v9[1];
  v63[0] = v11;
  v63[1] = v10;
  sub_100006380(&qword_10006B3C0);
  State.wrappedValue.getter();
  uint64_t v54 = v87;
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v51 = swift_getKeyPath();
  GeometryProxy.size.getter();
  static Alignment.topLeading.getter();
  uint64_t v62 = a1;
  _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)();
  uint64_t v38 = v87;
  uint64_t v41 = v89;
  uint64_t v44 = v91;
  uint64_t v45 = v93;
  uint64_t v47 = v95;
  uint64_t v48 = v97;
  uint64_t v49 = v100;
  uint64_t v50 = v99;
  char v71 = v8;
  char v70 = 1;
  char v69 = v88;
  unsigned __int8 v68 = v90;
  unsigned __int8 v67 = v92;
  unsigned __int8 v66 = v94;
  unsigned __int8 v65 = v96;
  unsigned __int8 v64 = v98;
  GeometryProxy.size.getter();
  static Alignment.topLeading.getter();
  _FrameLayout.init(width:height:alignment:)();
  char v12 = v102;
  uint64_t v36 = v101;
  uint64_t v37 = v103;
  LOBYTE(v5) = v104;
  uint64_t v39 = v106;
  uint64_t v40 = v105;
  char v13 = v71;
  char v14 = v70;
  char v15 = v69;
  int v29 = v68;
  int v30 = v67;
  int v31 = v66;
  int v34 = v65;
  int v35 = v64;
  char v73 = v102;
  char v72 = v104;
  uint64_t v46 = type metadata accessor for AXLTTextScrollView;
  sub_1000450C4(a1, (uint64_t)v7, type metadata accessor for AXLTTextScrollView);
  uint64_t v16 = *(unsigned __int8 *)(v52 + 80);
  uint64_t v17 = (v16 + 16) & ~v16;
  uint64_t v52 = v17 + v6;
  uint64_t v43 = v16 | 7;
  uint64_t v18 = swift_allocObject();
  uint64_t v42 = type metadata accessor for AXLTTextScrollView;
  sub_100049B94((uint64_t)v7, v18 + v17, type metadata accessor for AXLTTextScrollView);
  uint64_t v19 = static Alignment.center.getter();
  uint64_t v32 = v20;
  uint64_t v33 = v19;
  uint64_t v21 = swift_allocObject();
  *(void *)(v21 + 16) = sub_10004A06C;
  *(void *)(v21 + 24) = v18;
  v63[0] = v56;
  v63[1] = v55;
  LOBYTE(v63[2]) = v13;
  *(_DWORD *)((char *)&v63[2] + 1) = *(_DWORD *)v85;
  HIDWORD(v63[2]) = *(_DWORD *)&v85[3];
  v63[3] = v57;
  v63[4] = KeyPath;
  v63[5] = v54;
  v63[6] = v51;
  v63[7] = 0;
  LOBYTE(v63[8]) = v14;
  *(_DWORD *)((char *)&v63[8] + 1) = *(_DWORD *)v84;
  HIDWORD(v63[8]) = *(_DWORD *)&v84[3];
  v63[9] = v38;
  LOBYTE(v63[10]) = v15;
  *(_DWORD *)((char *)&v63[10] + 1) = *(_DWORD *)v83;
  HIDWORD(v63[10]) = *(_DWORD *)&v83[3];
  v63[11] = v41;
  LOBYTE(v63[12]) = v29;
  *(_DWORD *)((char *)&v63[12] + 1) = *(_DWORD *)v82;
  HIDWORD(v63[12]) = *(_DWORD *)&v82[3];
  v63[13] = v44;
  LOBYTE(v63[14]) = v30;
  *(_DWORD *)((char *)&v63[14] + 1) = *(_DWORD *)v81;
  HIDWORD(v63[14]) = *(_DWORD *)&v81[3];
  v63[15] = v45;
  LOBYTE(v63[16]) = v31;
  HIDWORD(v63[16]) = *(_DWORD *)&v80[3];
  *(_DWORD *)((char *)&v63[16] + 1) = *(_DWORD *)v80;
  v63[17] = v47;
  LOBYTE(v63[18]) = v34;
  HIDWORD(v63[18]) = *(_DWORD *)&v79[3];
  *(_DWORD *)((char *)&v63[18] + 1) = *(_DWORD *)v79;
  v63[19] = v48;
  LOBYTE(v63[20]) = v35;
  HIDWORD(v63[20]) = *(_DWORD *)&v78[3];
  *(_DWORD *)((char *)&v63[20] + 1) = *(_DWORD *)v78;
  v63[21] = v50;
  v63[22] = v49;
  v63[23] = v36;
  LOBYTE(v63[24]) = v12;
  HIDWORD(v63[24]) = *(_DWORD *)&v77[3];
  *(_DWORD *)((char *)&v63[24] + 1) = *(_DWORD *)v77;
  v63[25] = v37;
  LOBYTE(v63[26]) = v5;
  *(_DWORD *)((char *)&v63[26] + 1) = *(_DWORD *)v76;
  HIDWORD(v63[26]) = *(_DWORD *)&v76[3];
  v63[27] = v40;
  v63[28] = v39;
  LOWORD(v63[29]) = 256;
  *(_DWORD *)((char *)&v63[29] + 2) = v74;
  HIWORD(v63[29]) = v75;
  v63[30] = sub_10004B1D4;
  v63[31] = 0;
  v63[32] = v33;
  v63[33] = v32;
  v63[34] = sub_10004A11C;
  v63[35] = v21;
  uint64_t v23 = v58;
  uint64_t v22 = v59;
  uint64_t v25 = v61;
  uint64_t v24 = v62;
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v59 + 16))(v58, v62, v61);
  sub_1000450C4(v24, (uint64_t)v7, v46);
  uint64_t v26 = swift_allocObject();
  sub_100049B94((uint64_t)v7, v26 + v17, v42);
  sub_100006380(&qword_10006C670);
  sub_10004A1A8();
  sub_100048424(&qword_10006C130, (void (*)(uint64_t))&type metadata accessor for AXLTCaption);
  View.onChange<A>(of:initial:_:)();
  swift_release();
  (*(void (**)(unsigned char *, uint64_t))(v22 + 8))(v23, v25);
  memcpy(v86, v63, sizeof(v86));
  return sub_10004A54C((uint64_t)v86);
}

uint64_t sub_1000462F0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v3 = type metadata accessor for AttributedString();
  __chkstk_darwin(v3 - 8);
  sub_1000444A0(v1, (uint64_t)&v49 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v5 = Text.init(_:)();
  uint64_t v7 = v6;
  char v9 = v8;
  uint64_t v10 = (uint64_t *)(v1 + *(int *)(type metadata accessor for AXLTTextScrollView(0) + 32));
  uint64_t v11 = *v10;
  unint64_t v53 = v10[1];
  uint64_t v54 = v11;
  uint64_t v58 = v11;
  unint64_t v59 = v53;
  uint64_t v52 = sub_100006380(&qword_10006B318);
  State.wrappedValue.getter();
  uint64_t v12 = AXLTCaption.appID.getter();
  uint64_t v14 = v13;
  uint64_t v15 = placeholderID.getter();
  uint64_t v55 = a1;
  if (v12 == v15 && v14 == v16)
  {
    swift_bridgeObjectRelease_n();
  }
  else
  {
    _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  Color.opacity(_:)();
  swift_release();
  uint64_t v17 = Text.foregroundColor(_:)();
  uint64_t v56 = v18;
  uint64_t v57 = v17;
  char v20 = v19;
  unint64_t v22 = v21;
  swift_release();
  char v23 = v20 & 1;
  sub_10000F048(v5, v7, v9 & 1);
  swift_bridgeObjectRelease();
  AXLTCaption.placeholder.getter();
  uint64_t v24 = String.count.getter();
  uint64_t result = swift_bridgeObjectRelease();
  if (v24 >= 1)
  {
    v26._countAndFlagsBits = AXLTCaption.placeholder.getter();
    uint64_t v58 = 10;
    unint64_t v59 = 0xE100000000000000;
    String.append(_:)(v26);
    swift_bridgeObjectRelease();
    sub_10000EFF4();
    uint64_t v27 = Text.init<A>(_:)();
    uint64_t v29 = v28;
    char v31 = v30 & 1;
    uint64_t v58 = v54;
    unint64_t v59 = v53;
    State.wrappedValue.getter();
    Color.opacity(_:)();
    swift_release();
    uint64_t v32 = Text.foregroundColor(_:)();
    int v50 = v20 & 1;
    uint64_t v51 = v34;
    uint64_t v52 = v33;
    uint64_t v35 = v56;
    uint64_t v36 = v57;
    char v38 = v37;
    swift_release();
    sub_10000F048(v27, v29, v31);
    swift_bridgeObjectRelease();
    char v39 = v50;
    uint64_t v40 = v52;
    uint64_t v41 = static Text.+ infix(_:_:)();
    unint64_t v53 = v42;
    uint64_t v54 = v41;
    uint64_t v44 = v43;
    char v46 = v45 & 1;
    sub_10000F048(v36, v35, v39);
    swift_bridgeObjectRelease();
    sub_10000F048(v32, v40, v38 & 1);
    uint64_t result = swift_bridgeObjectRelease();
    unint64_t v22 = v53;
    uint64_t v56 = v44;
    uint64_t v57 = v54;
    char v23 = v46;
  }
  uint64_t v47 = v55;
  uint64_t v48 = v56;
  uint64_t *v55 = v57;
  v47[1] = v48;
  *((unsigned char *)v47 + 16) = v23;
  v47[3] = v22;
  return result;
}

void sub_100046658(double a1, double a2)
{
  os_log_type_t v3 = static os_log_type_t.debug.getter();
  uint64_t v4 = (id)AXLogLiveTranscription();
  if (v4)
  {
    uint64_t v5 = v4;
    if (os_log_type_enabled(v4, v3))
    {
      uint64_t v6 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v6 = 134217984;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl((void *)&_mh_execute_header, v5, v3, "readSize captionHeight: %f", v6, 0xCu);
      swift_slowDealloc();
    }

    sub_10004674C(a2);
  }
  else
  {
    __break(1u);
  }
}

void sub_10004674C(double a1)
{
  uint64_t v2 = type metadata accessor for AXLTTextScrollView(0);
  __chkstk_darwin(v2);
  uint64_t v4 = (char *)v69 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)v69 - v6;
  uint64_t v8 = type metadata accessor for DynamicTypeSize();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = ((char *)v69 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v12 = sub_100006380(&qword_10006B198);
  __chkstk_darwin(v12 - 8);
  uint64_t v14 = (char *)v69 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v15);
  uint64_t v17 = (uint64_t)v69 - v16;
  if (qword_10006AE20 != -1) {
    swift_once();
  }
  char v72 = v7;
  uint64_t v18 = self;
  if (qword_10006AE18 != -1) {
    swift_once();
  }
  id v19 = [v18 preferredFontForTextStyle:textFontStyle];
  [v19 lineHeight];
  double v21 = v20;

  uint64_t v22 = AXLTCaption.appID.getter();
  uint64_t v24 = v23;
  uint64_t v25 = placeholderID.getter();
  uint64_t v27 = v26;
  if (v22 == v25 && v24 == v26)
  {
    swift_bridgeObjectRelease_n();
LABEL_9:
    uint64_t v27 = v73;
    uint64_t v29 = (void *)(v73 + *(int *)(v2 + 20));
    uint64_t v30 = v29[1];
    uint64_t v31 = v29[2];
    *(void *)&long long v74 = *v29;
    *((void *)&v74 + 1) = v30;
    uint64_t v75 = v31;
    double v76 = v21;
    sub_100006380(&qword_10006BAF0);
    goto LABEL_33;
  }
  char v28 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v28) {
    goto LABEL_9;
  }
  double v32 = a1 / v21;
  if ((~*(void *)&v32 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_38;
  }
  if (v32 <= -9.22337204e18)
  {
LABEL_38:
    __break(1u);
    goto LABEL_39;
  }
  if (v32 >= 9.22337204e18)
  {
LABEL_39:
    __break(1u);
    goto LABEL_40;
  }
  uint64_t v70 = v9;
  os_log_type_t v33 = static os_log_type_t.debug.getter();
  uint64_t v34 = (id)AXLogLiveTranscription();
  if (!v34) {
    goto LABEL_44;
  }
  uint64_t v35 = v34;
  os_log_type_t v36 = v33;
  BOOL v37 = os_log_type_enabled(v34, v33);
  uint64_t v71 = (uint64_t)v32;
  if (v37)
  {
    char v38 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)char v38 = 134217984;
    *(void *)&long long v74 = (uint64_t)v32;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v35, v36, "linesCount: %ld", v38, 0xCu);
    swift_slowDealloc();
  }

  uint64_t v27 = v73;
  sub_10000E2FC(v17);
  uint64_t v9 = v70;
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v70 + 56))(v17, 0, 1, v8);
  sub_100006754(v17, (uint64_t)v14, &qword_10006B198);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v14, 1, v8) != 1)
  {
    (*(void (**)(NSObject *, char *, uint64_t))(v9 + 32))(v11, v14, v8);
    if (qword_10006AD98 != -1) {
      goto LABEL_42;
    }
    goto LABEL_19;
  }
  sub_1000067B8((uint64_t)v14, &qword_10006B198);
  sub_1000067B8(v17, &qword_10006B198);
LABEL_20:
  for (uint64_t i = textLinesNumberMax.getter(); ; uint64_t i = textLinesAccessibilityNumberMax.getter())
  {
    uint64_t v41 = i;
    uint64_t v70 = v2;
    uint64_t v9 = v27 + *(int *)(v2 + 24);
    uint64_t v42 = *(void *)v9;
    uint64_t v17 = *(void *)(v9 + 8);
    uint64_t v43 = *(void *)(v9 + 16);
    *(void *)&long long v74 = *(void *)v9;
    *((void *)&v74 + 1) = v17;
    uint64_t v75 = v43;
    uint64_t v8 = sub_100006380(&qword_10006BE00);
    Binding.wrappedValue.getter();
    double v44 = v76;
    uint64_t v2 = v71;
    if (*(uint64_t *)&v76 >= v71) {
      double v44 = *(double *)&v71;
    }
    *(void *)&long long v74 = v42;
    *((void *)&v74 + 1) = v17;
    uint64_t v75 = v43;
    double v76 = v44;
    Binding.wrappedValue.setter();
    BOOL v45 = __OFSUB__(v2, v41);
    uint64_t v11 = (v2 - v41);
    if (v45)
    {
LABEL_40:
      __break(1u);
      goto LABEL_41;
    }
    *(void *)&long long v74 = v42;
    *((void *)&v74 + 1) = v17;
    uint64_t v75 = v43;
    Binding.wrappedValue.getter();
    double v46 = v76;
    if (*(uint64_t *)&v76 <= (uint64_t)v11) {
      double v46 = *(double *)&v11;
    }
    *(void *)&long long v74 = v42;
    *((void *)&v74 + 1) = v17;
    uint64_t v75 = v43;
    double v76 = v46;
    Binding.wrappedValue.setter();
    os_log_type_t v47 = static os_log_type_t.debug.getter();
    uint64_t v48 = (id)AXLogLiveTranscription();
    if (!v48) {
      goto LABEL_45;
    }
    uint64_t v11 = v48;
    uint64_t v49 = (uint64_t)v72;
    sub_1000450C4(v27, (uint64_t)v72, type metadata accessor for AXLTTextScrollView);
    uint64_t v17 = v47;
    BOOL v50 = os_log_type_enabled(v11, v47);
    uint64_t v2 = v70;
    if (v50)
    {
      uint64_t v51 = v49;
      uint64_t v52 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v52 = 134217984;
      v69[1] = v52 + 4;
      uint64_t v53 = v51 + *(int *)(v2 + 24);
      long long v54 = *(_OWORD *)v53;
      uint64_t v55 = *(void *)(v53 + 16);
      long long v74 = v54;
      uint64_t v75 = v55;
      Binding.wrappedValue.getter();
      double v56 = v76;
      sub_10004512C(v51, type metadata accessor for AXLTTextScrollView);
      *(double *)&long long v74 = v56;
      uint64_t v27 = v73;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl((void *)&_mh_execute_header, v11, (os_log_type_t)v17, "lineNumberDisplay: %ld", v52, 0xCu);
      swift_slowDealloc();
    }
    else
    {
      sub_10004512C(v49, type metadata accessor for AXLTTextScrollView);
    }
    uint64_t v57 = v71;

    uint64_t v58 = *(void *)(v9 + 16);
    long long v74 = *(_OWORD *)v9;
    uint64_t v75 = v58;
    Binding.wrappedValue.getter();
    if (!__OFSUB__(v57, *(void *)&v76)) {
      break;
    }
LABEL_41:
    __break(1u);
LABEL_42:
    swift_once();
LABEL_19:
    sub_10000874C(v8, (uint64_t)accessibilityLayoutTextSize);
    sub_100048424((unint64_t *)&qword_10006B1A0, (void (*)(uint64_t))&type metadata accessor for DynamicTypeSize);
    char v39 = dispatch thunk of static Comparable.< infix(_:_:)();
    (*(void (**)(NSObject *, uint64_t))(v9 + 8))(v11, v8);
    sub_1000067B8(v17, &qword_10006B198);
    if (v39) {
      goto LABEL_20;
    }
  }
  unint64_t v59 = (void *)(v27 + *(int *)(v2 + 20));
  uint64_t v60 = v59[1];
  uint64_t v61 = v59[2];
  *(void *)&long long v74 = *v59;
  *((void *)&v74 + 1) = v60;
  uint64_t v75 = v61;
  double v76 = v21 * (double)(v57 - *(void *)&v76);
  sub_100006380(&qword_10006BAF0);
LABEL_33:
  Binding.wrappedValue.setter();
  os_log_type_t v62 = static os_log_type_t.debug.getter();
  char v63 = (id)AXLogLiveTranscription();
  if (v63)
  {
    unsigned __int8 v64 = v63;
    sub_1000450C4(v27, (uint64_t)v4, type metadata accessor for AXLTTextScrollView);
    if (os_log_type_enabled(v64, v62))
    {
      unsigned __int8 v65 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)unsigned __int8 v65 = 134217984;
      unsigned __int8 v66 = &v4[*(int *)(v2 + 20)];
      uint64_t v67 = *((void *)v66 + 1);
      uint64_t v68 = *((void *)v66 + 2);
      *(void *)&long long v74 = *(void *)v66;
      *((void *)&v74 + 1) = v67;
      uint64_t v75 = v68;
      sub_100006380(&qword_10006BAF0);
      Binding.wrappedValue.getter();
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      sub_10004512C((uint64_t)v4, type metadata accessor for AXLTTextScrollView);
      _os_log_impl((void *)&_mh_execute_header, v64, v62, "textHeight: %f", v65, 0xCu);
      swift_slowDealloc();
    }
    else
    {

      sub_10004512C((uint64_t)v4, type metadata accessor for AXLTTextScrollView);
    }
    return;
  }
  __break(1u);
LABEL_44:
  __break(1u);
LABEL_45:
  __break(1u);
}

NSObject *sub_10004704C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = type metadata accessor for AXLTCaption();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v51 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v54 = type metadata accessor for AXLTTextScrollView(0);
  __chkstk_darwin(v54);
  uint64_t v53 = (uint64_t)&v51 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  uint64_t v12 = (char *)&v51 - v11;
  os_log_type_t v13 = static os_log_type_t.debug.getter();
  uint64_t result = (id)AXLogLiveTranscription();
  if (result)
  {
    uint64_t v15 = result;
    sub_1000450C4(a3, (uint64_t)v12, type metadata accessor for AXLTTextScrollView);
    if (os_log_type_enabled(v15, v13))
    {
      uint64_t v16 = swift_slowAlloc();
      uint64_t v55 = a3;
      uint64_t v17 = (uint8_t *)v16;
      *(void *)&long long v57 = swift_slowAlloc();
      uint64_t v52 = a2;
      *(_DWORD *)uint64_t v17 = 136315138;
      (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v8, v12, v5);
      uint64_t v18 = String.init<A>(describing:)();
      uint64_t v60 = sub_10000E634(v18, v19, (uint64_t *)&v57);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      sub_10004512C((uint64_t)v12, type metadata accessor for AXLTTextScrollView);
      _os_log_impl((void *)&_mh_execute_header, v15, v13, "onChange caption: %s", v17, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      a3 = v55;
      swift_slowDealloc();
    }
    else
    {

      sub_10004512C((uint64_t)v12, type metadata accessor for AXLTTextScrollView);
    }
    uint64_t v20 = AXLTCaption.text.getter();
    uint64_t v22 = v21;
    uint64_t v23 = AXLTCaption.appID.getter();
    uint64_t v25 = v24;
    if (v23 == placeholderID.getter() && v25 == v26) {
      goto LABEL_7;
    }
    char v27 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v27) {
      goto LABEL_17;
    }
    uint64_t v28 = AXLTCaption.time.getter();
    unint64_t v30 = v29;
    uint64_t v31 = *(int *)(v54 + 28);
    uint64_t v55 = a3;
    double v32 = (uint64_t *)(a3 + v31);
    uint64_t v33 = *v32;
    uint64_t v34 = v32[1];
    uint64_t v36 = v32[2];
    uint64_t v35 = v32[3];
    *(void *)&long long v57 = *v32;
    *((void *)&v57 + 1) = v34;
    uint64_t v58 = v36;
    uint64_t v59 = v35;
    uint64_t v37 = sub_100006380(&qword_10006BE08);
    Binding.wrappedValue.getter();
    if (v60 == v28 && v61 == v30)
    {
LABEL_7:
      swift_bridgeObjectRelease_n();
LABEL_17:
      sub_100047648(v20, v22);
      return swift_bridgeObjectRelease();
    }
    uint64_t v52 = v37;
    char v38 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if (v38)
    {
      swift_bridgeObjectRelease();
      goto LABEL_17;
    }
    uint64_t v39 = v55;
    uint64_t v40 = v55 + *(int *)(v54 + 24);
    long long v41 = *(_OWORD *)v40;
    uint64_t v42 = *(void *)(v40 + 16);
    long long v57 = v41;
    uint64_t v58 = v42;
    uint64_t v60 = 0;
    sub_100006380(&qword_10006BE00);
    Binding.wrappedValue.setter();
    *(void *)&long long v57 = v33;
    *((void *)&v57 + 1) = v34;
    uint64_t v58 = v36;
    uint64_t v59 = v35;
    uint64_t v60 = v28;
    unint64_t v61 = v30;
    Binding.wrappedValue.setter();
    os_log_type_t v43 = static os_log_type_t.debug.getter();
    uint64_t result = (id)AXLogLiveTranscription();
    if (result)
    {
      double v44 = result;
      uint64_t v45 = v53;
      sub_1000450C4(v39, v53, type metadata accessor for AXLTTextScrollView);
      if (os_log_type_enabled(v44, v43))
      {
        double v46 = (uint8_t *)swift_slowAlloc();
        uint64_t v51 = swift_slowAlloc();
        uint64_t v56 = v51;
        *(_DWORD *)double v46 = 136315138;
        uint64_t v47 = v45 + *(int *)(v54 + 28);
        long long v48 = *(_OWORD *)v47;
        uint64_t v50 = *(void *)(v47 + 16);
        uint64_t v49 = *(void *)(v47 + 24);
        long long v57 = v48;
        uint64_t v58 = v50;
        uint64_t v59 = v49;
        Binding.wrappedValue.getter();
        *(void *)&long long v57 = sub_10000E634(v60, v61, &v56);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease();
        sub_10004512C(v45, type metadata accessor for AXLTTextScrollView);
        _os_log_impl((void *)&_mh_execute_header, v44, v43, "onChange caption, lineNumberDisplaCGFloat y = 0, current time: %s", v46, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {

        sub_10004512C(v45, type metadata accessor for AXLTTextScrollView);
      }
      goto LABEL_17;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_100047648(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v23 = a1;
  uint64_t v5 = type metadata accessor for AXLTTextScrollView(0);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void *)(v6 + 64);
  __chkstk_darwin(v5 - 8);
  uint64_t v9 = (void *)(v2 + *(int *)(v8 + 52));
  uint64_t v10 = v9[1];
  *(void *)&long long aBlock = *v9;
  uint64_t v11 = aBlock;
  *((void *)&aBlock + 1) = v10;
  sub_100006380(&qword_10006B630);
  State.wrappedValue.getter();
  id v12 = v29;
  [v29 invalidate];

  *(void *)&long long aBlock = v11;
  *((void *)&aBlock + 1) = v10;
  id v29 = 0;
  State.wrappedValue.setter();
  os_log_type_t v13 = self;
  textOnScreenTimeInterval.getter();
  double v15 = v14;
  sub_1000450C4(v3, (uint64_t)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for AXLTTextScrollView);
  unint64_t v16 = (*(unsigned __int8 *)(v6 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  uint64_t v17 = swift_allocObject();
  sub_100049B94((uint64_t)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), v17 + v16, type metadata accessor for AXLTTextScrollView);
  uint64_t v18 = (void *)(v17 + ((v7 + v16 + 7) & 0xFFFFFFFFFFFFFFF8));
  *uint64_t v18 = v23;
  v18[1] = a2;
  char v27 = sub_10004A7E4;
  uint64_t v28 = v17;
  *(void *)&long long aBlock = _NSConcreteStackBlock;
  *((void *)&aBlock + 1) = 1107296256;
  uint64_t v25 = sub_1000315A8;
  uint64_t v26 = &unk_1000674A8;
  unint64_t v19 = _Block_copy(&aBlock);
  swift_bridgeObjectRetain();
  swift_release();
  id v20 = [v13 scheduledTimerWithTimeInterval:1 repeats:v19 block:v15];
  _Block_release(v19);
  long long aBlock = *(_OWORD *)v9;
  id v29 = v20;
  return State.wrappedValue.setter();
}

uint64_t sub_1000478C4(uint64_t a1, uint64_t a2)
{
  uint64_t result = Notification.userInfo.getter();
  if (result)
  {
    uint64_t v4 = result;
    uint64_t v10 = notificationValueKey.getter();
    AnyHashable.init<A>(_:)();
    if (*(void *)(v4 + 16) && (unint64_t v5 = sub_1000486C0((uint64_t)v11), (v6 & 1) != 0))
    {
      sub_10000E914(*(void *)(v4 + 56) + 32 * v5, (uint64_t)&v12);
    }
    else
    {
      long long v12 = 0u;
      long long v13 = 0u;
    }
    swift_bridgeObjectRelease();
    sub_10000ED94((uint64_t)v11);
    if (*((void *)&v13 + 1))
    {
      uint64_t result = swift_dynamicCast();
      if (result)
      {
        uint64_t v7 = (uint64_t *)(a2 + *(int *)(type metadata accessor for AXLTTextScrollView(0) + 32));
        uint64_t v9 = *v7;
        uint64_t v8 = v7[1];
        v11[0] = v9;
        v11[1] = v8;
        *(void *)&long long v12 = v10;
        sub_100006380(&qword_10006B318);
        return State.wrappedValue.setter();
      }
    }
    else
    {
      return sub_1000067B8((uint64_t)&v12, &qword_10006C150);
    }
  }
  return result;
}

uint64_t sub_1000479E0(uint64_t a1, uint64_t a2)
{
  uint64_t result = Notification.userInfo.getter();
  if (result)
  {
    uint64_t v4 = result;
    uint64_t v10 = notificationValueKey.getter();
    AnyHashable.init<A>(_:)();
    if (*(void *)(v4 + 16) && (unint64_t v5 = sub_1000486C0((uint64_t)v11), (v6 & 1) != 0))
    {
      sub_10000E914(*(void *)(v4 + 56) + 32 * v5, (uint64_t)&v12);
    }
    else
    {
      long long v12 = 0u;
      long long v13 = 0u;
    }
    swift_bridgeObjectRelease();
    sub_10000ED94((uint64_t)v11);
    if (*((void *)&v13 + 1))
    {
      uint64_t result = swift_dynamicCast();
      if (result)
      {
        uint64_t v7 = (uint64_t *)(a2 + *(int *)(type metadata accessor for AXLTTextScrollView(0) + 36));
        uint64_t v9 = *v7;
        uint64_t v8 = v7[1];
        v11[0] = v9;
        v11[1] = v8;
        *(void *)&long long v12 = v10;
        sub_100006380(&qword_10006B3C0);
        return State.wrappedValue.setter();
      }
    }
    else
    {
      return sub_1000067B8((uint64_t)&v12, &qword_10006C150);
    }
  }
  return result;
}

NSObject *sub_100047AFC(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = (int *)type metadata accessor for AXLTTextScrollView(0);
  double v9 = __chkstk_darwin(v8);
  uint64_t v11 = (char *)v48 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = objc_msgSend(a1, "isValid", v9);
  if (result)
  {
    if (qword_10006AE20 != -1) {
      swift_once();
    }
    long long v13 = self;
    if (qword_10006AE18 != -1) {
      swift_once();
    }
    id v14 = [v13 preferredFontForTextStyle:textFontStyle];
    [v14 lineHeight];
    double v16 = v15;

    uint64_t v17 = (void *)(a2 + v8[5]);
    uint64_t v18 = v17[1];
    uint64_t v19 = v17[2];
    *(void *)&long long v50 = *v17;
    *((void *)&v50 + 1) = v18;
    uint64_t v51 = v19;
    sub_100006380(&qword_10006BAF0);
    uint64_t result = Binding.wrappedValue.getter();
    double v20 = *(double *)&v52 / v16;
    if ((~COERCE__INT64(*(double *)&v52 / v16) & 0x7FF0000000000000) != 0)
    {
      if (v20 > -9.22337204e18)
      {
        if (v20 < 9.22337204e18)
        {
          uint64_t v21 = (uint64_t)v20;
          uint64_t v52 = (uint64_t)v20;
          uint64_t v22 = (uint64_t)v20 - 1;
          if ((uint64_t)v20 < 1)
          {
LABEL_22:
            if (!v21)
            {
              uint64_t v39 = (void *)(a2 + v8[11]);
              uint64_t v41 = v39[1];
              *(void *)&long long v50 = *v39;
              uint64_t v40 = v50;
              *((void *)&v50 + 1) = v41;
              sub_100006380(&qword_10006B630);
              State.wrappedValue.getter();
              id v42 = v49;
              [v49 invalidate];

              *(void *)&long long v50 = v40;
              *((void *)&v50 + 1) = v41;
              uint64_t v49 = 0;
              return State.wrappedValue.setter();
            }
            return result;
          }
          if (placeholderPausedText.getter() == a3 && v23 == a4) {
            goto LABEL_15;
          }
          char v24 = _stringCompareWithSmolCheck(_:_:expecting:)();
          swift_bridgeObjectRelease();
          if (v24)
          {
LABEL_16:
            uint64_t v52 = 1;
            uint64_t v26 = (void *)(a2 + v8[11]);
            uint64_t v28 = v26[1];
            *(void *)&long long v50 = *v26;
            uint64_t v27 = v50;
            *((void *)&v50 + 1) = v28;
            sub_100006380(&qword_10006B630);
            State.wrappedValue.getter();
            id v29 = v49;
            [v49 invalidate];

            *(void *)&long long v50 = v27;
            *((void *)&v50 + 1) = v28;
            uint64_t v49 = 0;
            State.wrappedValue.setter();
            goto LABEL_17;
          }
          if (placeholderText.getter() == a3 && v25 == a4)
          {
LABEL_15:
            swift_bridgeObjectRelease();
            goto LABEL_16;
          }
          char v43 = _stringCompareWithSmolCheck(_:_:expecting:)();
          swift_bridgeObjectRelease();
          if (v43) {
            goto LABEL_16;
          }
          double v44 = (uint64_t *)(a2 + v8[6]);
          uint64_t v45 = *v44;
          uint64_t v46 = v44[1];
          uint64_t v47 = v44[2];
          *(void *)&long long v50 = *v44;
          *((void *)&v50 + 1) = v46;
          uint64_t v51 = v47;
          swift_retain();
          swift_retain();
          sub_100006380(&qword_10006BE00);
          uint64_t result = Binding.wrappedValue.getter();
          if (!__OFADD__(v49, 1))
          {
            *(void *)&long long v50 = v45;
            *((void *)&v50 + 1) = v46;
            uint64_t v51 = v47;
            v48[2] = v49 + 1;
            Binding.wrappedValue.setter();
            swift_release();
            swift_release();
            uint64_t v52 = v22;
LABEL_17:
            os_log_type_t v30 = static os_log_type_t.debug.getter();
            uint64_t result = (id)AXLogLiveTranscription();
            if (result)
            {
              uint64_t v31 = result;
              sub_1000450C4(a2, (uint64_t)v11, type metadata accessor for AXLTTextScrollView);
              os_log_type_t v32 = v30;
              if (os_log_type_enabled(v31, v30))
              {
                uint64_t v33 = (uint8_t *)swift_slowAlloc();
                *(_DWORD *)uint64_t v33 = 134217984;
                uint64_t v34 = &v11[v8[6]];
                long long v35 = *(_OWORD *)v34;
                uint64_t v36 = *((void *)v34 + 2);
                long long v50 = v35;
                uint64_t v51 = v36;
                sub_100006380(&qword_10006BE00);
                Binding.wrappedValue.getter();
                uint64_t v37 = v49;
                sub_10004512C((uint64_t)v11, type metadata accessor for AXLTTextScrollView);
                *(void *)&long long v50 = v37;
                UnsafeMutableRawBufferPointer.copyMemory(from:)();
                _os_log_impl((void *)&_mh_execute_header, v31, v32, "Moving Timer fired, lineNumberDisplay: %ld", v33, 0xCu);
                swift_slowDealloc();
              }
              else
              {
                sub_10004512C((uint64_t)v11, type metadata accessor for AXLTTextScrollView);
              }

              __chkstk_darwin(v38);
              v48[-4] = a2;
              *(double *)&v48[-3] = v16;
              v48[-2] = &v52;
              static Animation.default.getter();
              withAnimation<A>(_:_:)();
              uint64_t result = swift_release();
              uint64_t v21 = v52;
              goto LABEL_22;
            }
LABEL_32:
            __break(1u);
            return result;
          }
LABEL_31:
          __break(1u);
          goto LABEL_32;
        }
LABEL_30:
        __break(1u);
        goto LABEL_31;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_30;
  }
  return result;
}

uint64_t sub_100048074()
{
  return Binding.wrappedValue.setter();
}

uint64_t sub_100048100()
{
  return EnvironmentValues.dynamicTypeSize.getter();
}

uint64_t sub_100048124(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for DynamicTypeSize();
  double v3 = __chkstk_darwin(v2);
  (*(void (**)(char *, uint64_t, double))(v5 + 16))((char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v3);
  return EnvironmentValues.dynamicTypeSize.setter();
}

uint64_t sub_1000481EC@<X0>(uint64_t a1@<X0>, uint64_t (**a2)@<X0>(uint64_t a1@<X8>)@<X8>)
{
  uint64_t v4 = *(void *)(a1 - 8);
  uint64_t v5 = *(void *)(v4 + 64);
  __chkstk_darwin(a1 - 8);
  sub_1000450C4(v2, (uint64_t)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for AXLTTextScrollView);
  unint64_t v6 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v7 = swift_allocObject();
  uint64_t result = sub_100049B94((uint64_t)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v7 + v6, type metadata accessor for AXLTTextScrollView);
  *a2 = sub_100049BFC;
  a2[1] = (uint64_t (*)@<X0>(uint64_t@<X8>))v7;
  return result;
}

uint64_t sub_100048300()
{
  return dispatch thunk of static Equatable.== infix(_:_:)() & 1;
}

uint64_t sub_10004835C@<X0>(uint64_t a1@<X8>)
{
  uint64_t result = EnvironmentValues.lineLimit.getter();
  *(void *)a1 = result;
  *(unsigned char *)(a1 + 8) = v3 & 1;
  return result;
}

uint64_t sub_100048390@<X0>(uint64_t a1@<X8>)
{
  uint64_t result = EnvironmentValues.lineLimit.getter();
  *(void *)a1 = result;
  *(unsigned char *)(a1 + 8) = v3 & 1;
  return result;
}

uint64_t sub_1000483C4()
{
  return EnvironmentValues.lineLimit.setter();
}

uint64_t sub_1000483F4()
{
  return EnvironmentValues.lineLimit.setter();
}

uint64_t sub_100048424(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100048470(uint64_t a1)
{
  return sub_100048638(a1, type metadata accessor for AXLTTextView, sub_100044B38);
}

uint64_t sub_1000484A0()
{
  uint64_t v1 = type metadata accessor for AXLTTextView(0);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = v3 + *(void *)(*(void *)(v1 - 8) + 64);
  uint64_t v5 = v2 | 7;
  uint64_t v6 = v0 + v3 + *(int *)(v1 + 20);
  uint64_t v7 = type metadata accessor for AXLTCaption();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, v4, v5);
}

uint64_t sub_10004860C(uint64_t a1)
{
  return sub_100048638(a1, type metadata accessor for AXLTTextView, sub_100044C54);
}

uint64_t sub_100048638(uint64_t a1, uint64_t (*a2)(void), uint64_t (*a3)(uint64_t, uint64_t))
{
  uint64_t v5 = *(void *)(a2(0) - 8);
  uint64_t v6 = v3 + ((*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));

  return a3(a1, v6);
}

unint64_t sub_1000486C0(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = AnyHashable._rawHashValue(seed:)(*(void *)(v2 + 40));

  return sub_10004877C(a1, v4);
}

unint64_t sub_100048704(uint64_t a1, uint64_t a2)
{
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v4 = Hasher._finalize()();

  return sub_1000489DC(a1, a2, v4);
}

unint64_t sub_10004877C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    do
    {
      sub_100048844(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v8);
      char v6 = static AnyHashable.== infix(_:_:)();
      sub_10000ED94((uint64_t)v8);
      if (v6) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v5;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

uint64_t sub_100048844(uint64_t a1, uint64_t a2)
{
  return a2;
}

void sub_1000488A0()
{
}

unint64_t sub_1000488C0()
{
  unint64_t result = qword_10006C540;
  if (!qword_10006C540)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006C540);
  }
  return result;
}

void sub_100048914()
{
}

uint64_t sub_10004893C()
{
  return 8;
}

uint64_t sub_100048948()
{
  return swift_release();
}

uint64_t sub_100048950(void *a1, void *a2)
{
  *a2 = *a1;
  return swift_retain();
}

uint64_t sub_100048960()
{
  return dispatch thunk of Hashable.hashValue.getter();
}

void *sub_1000489A8(void *result, void *a2)
{
  *a2 = *result;
  return result;
}

uint64_t sub_1000489B4()
{
  return EnvironmentValues.dynamicTypeSize.getter();
}

unint64_t sub_1000489DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        long long v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0);
    }
  }
  return v6;
}

uint64_t *sub_100048AC0(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v29 = *a2;
    *a1 = *a2;
    uint64_t v4 = (uint64_t *)(v29 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    uint64_t v7 = type metadata accessor for AXLTCaption();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(v4, a2, v7);
    uint64_t v8 = a3[5];
    uint64_t v9 = a3[6];
    uint64_t v10 = (uint64_t *)((char *)v4 + v8);
    BOOL v11 = (uint64_t *)((char *)a2 + v8);
    uint64_t v12 = v11[1];
    *uint64_t v10 = *v11;
    v10[1] = v12;
    v10[2] = v11[2];
    long long v13 = (uint64_t *)((char *)v4 + v9);
    BOOL v14 = (uint64_t *)((char *)a2 + v9);
    uint64_t v15 = v14[1];
    void *v13 = *v14;
    v13[1] = v15;
    v13[2] = v14[2];
    uint64_t v16 = a3[7];
    uint64_t v17 = a3[8];
    uint64_t v18 = (uint64_t *)((char *)v4 + v16);
    uint64_t v19 = (uint64_t *)((char *)a2 + v16);
    uint64_t v20 = v19[1];
    *uint64_t v18 = *v19;
    v18[1] = v20;
    uint64_t v21 = v19[3];
    v18[2] = v19[2];
    v18[3] = v21;
    uint64_t v22 = (uint64_t *)((char *)v4 + v17);
    uint64_t v23 = (uint64_t *)((char *)a2 + v17);
    uint64_t v40 = v23[1];
    *uint64_t v22 = *v23;
    v22[1] = v40;
    uint64_t v24 = a3[9];
    uint64_t v25 = a3[10];
    uint64_t v26 = (uint64_t *)((char *)v4 + v24);
    uint64_t v27 = (uint64_t *)((char *)a2 + v24);
    uint64_t v39 = v27[1];
    *uint64_t v26 = *v27;
    v26[1] = v39;
    uint64_t v37 = (uint64_t *)((char *)v4 + v25);
    uint64_t v38 = (uint64_t *)((char *)a2 + v25);
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_bridgeObjectRetain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    sub_100006380(&qword_10006B218);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v28 = type metadata accessor for DynamicTypeSize();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v28 - 8) + 16))(v37, v38, v28);
    }
    else
    {
      void *v37 = *v38;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v30 = a3[11];
    uint64_t v31 = (uint64_t *)((char *)v4 + v30);
    os_log_type_t v32 = (char *)a2 + v30;
    uint64_t v33 = *(void **)v32;
    uint64_t v34 = *((void *)v32 + 1);
    void *v31 = *(void *)v32;
    v31[1] = v34;
    id v35 = v33;
  }
  swift_retain();
  return v4;
}

uint64_t sub_100048D2C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for AXLTCaption();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v5 = a1 + *(int *)(a2 + 40);
  sub_100006380(&qword_10006B218);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = type metadata accessor for DynamicTypeSize();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  }
  else
  {
    swift_release();
  }

  return swift_release();
}

uint64_t sub_100048EA0(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = type metadata accessor for AXLTCaption();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a3[6];
  uint64_t v9 = (void *)(a1 + v7);
  uint64_t v10 = (void *)(a2 + v7);
  uint64_t v11 = v10[1];
  *uint64_t v9 = *v10;
  v9[1] = v11;
  v9[2] = v10[2];
  uint64_t v12 = (void *)(a1 + v8);
  long long v13 = (void *)(a2 + v8);
  uint64_t v14 = v13[1];
  *uint64_t v12 = *v13;
  v12[1] = v14;
  v12[2] = v13[2];
  uint64_t v15 = a3[7];
  uint64_t v16 = a3[8];
  uint64_t v17 = (void *)(a1 + v15);
  uint64_t v18 = (void *)(a2 + v15);
  uint64_t v19 = v18[1];
  void *v17 = *v18;
  v17[1] = v19;
  uint64_t v20 = v18[3];
  v17[2] = v18[2];
  void v17[3] = v20;
  uint64_t v21 = (void *)(a1 + v16);
  uint64_t v22 = (void *)(a2 + v16);
  uint64_t v37 = v22[1];
  *uint64_t v21 = *v22;
  v21[1] = v37;
  uint64_t v23 = a3[9];
  uint64_t v24 = a3[10];
  uint64_t v39 = a3;
  uint64_t v25 = (void *)(a1 + v23);
  uint64_t v26 = (void *)(a2 + v23);
  uint64_t v27 = v26[1];
  void *v25 = *v26;
  v25[1] = v27;
  uint64_t v38 = (void *)(a1 + v24);
  uint64_t v36 = (void *)(a2 + v24);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  sub_100006380(&qword_10006B218);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v28 = type metadata accessor for DynamicTypeSize();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v28 - 8) + 16))(v38, v36, v28);
  }
  else
  {
    *uint64_t v38 = *v36;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v29 = v39[11];
  uint64_t v30 = (void *)(a1 + v29);
  uint64_t v31 = a2 + v29;
  os_log_type_t v32 = *(void **)v31;
  uint64_t v33 = *(void *)(v31 + 8);
  *uint64_t v30 = *(void *)v31;
  v30[1] = v33;
  id v34 = v32;
  swift_retain();
  return a1;
}

uint64_t sub_1000490C8(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = type metadata accessor for AXLTCaption();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  *(void *)(a1 + v7) = *(void *)(a2 + v7);
  swift_retain();
  swift_release();
  *(void *)(v8 + 8) = *(void *)(v9 + 8);
  swift_retain();
  swift_release();
  *(void *)(v8 + 16) = *(void *)(v9 + 16);
  uint64_t v10 = a3[6];
  uint64_t v11 = a1 + v10;
  uint64_t v12 = a2 + v10;
  *(void *)(a1 + v10) = *(void *)(a2 + v10);
  swift_retain();
  swift_release();
  *(void *)(v11 + 8) = *(void *)(v12 + 8);
  swift_retain();
  swift_release();
  *(void *)(v11 + 16) = *(void *)(v12 + 16);
  uint64_t v13 = a3[7];
  uint64_t v14 = (void *)(a1 + v13);
  uint64_t v15 = (void *)(a2 + v13);
  *(void *)(a1 + v13) = *(void *)(a2 + v13);
  swift_retain();
  swift_release();
  v14[1] = v15[1];
  swift_retain();
  swift_release();
  v14[2] = v15[2];
  v14[3] = v15[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v16 = a3[8];
  uint64_t v17 = a1 + v16;
  uint64_t v18 = a2 + v16;
  *(void *)(a1 + v16) = *(void *)(a2 + v16);
  swift_retain();
  swift_release();
  *(void *)(v17 + 8) = *(void *)(v18 + 8);
  swift_retain();
  swift_release();
  uint64_t v19 = a3[9];
  uint64_t v20 = a1 + v19;
  uint64_t v21 = a2 + v19;
  *(void *)(a1 + v19) = *(void *)(a2 + v19);
  swift_retain();
  swift_release();
  *(void *)(v20 + 8) = *(void *)(v21 + 8);
  swift_retain();
  swift_release();
  if (a1 != a2)
  {
    uint64_t v22 = a3[10];
    uint64_t v23 = (void *)(a1 + v22);
    uint64_t v24 = (void *)(a2 + v22);
    sub_1000067B8(a1 + v22, &qword_10006B218);
    sub_100006380(&qword_10006B218);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v25 = type metadata accessor for DynamicTypeSize();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v25 - 8) + 16))(v23, v24, v25);
    }
    else
    {
      void *v23 = *v24;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v26 = a3[11];
  uint64_t v27 = (void *)(a1 + v26);
  uint64_t v28 = a2 + v26;
  uint64_t v29 = *(void **)(a1 + v26);
  uint64_t v30 = *(void **)v28;
  *uint64_t v27 = *(void *)v28;
  id v31 = v30;

  v27[1] = *(void *)(v28 + 8);
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_10004937C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = type metadata accessor for AXLTCaption();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a3[6];
  uint64_t v9 = a1 + v7;
  uint64_t v10 = a2 + v7;
  *(_OWORD *)uint64_t v9 = *(_OWORD *)v10;
  *(void *)(v9 + 16) = *(void *)(v10 + 16);
  uint64_t v11 = a1 + v8;
  uint64_t v12 = a2 + v8;
  *(_OWORD *)uint64_t v11 = *(_OWORD *)v12;
  *(void *)(v11 + 16) = *(void *)(v12 + 16);
  uint64_t v13 = a3[7];
  uint64_t v14 = a3[8];
  long long v15 = *(_OWORD *)(a2 + v13);
  long long v16 = *(_OWORD *)(a2 + v13 + 16);
  uint64_t v17 = (_OWORD *)(a1 + v13);
  _OWORD *v17 = v15;
  v17[1] = v16;
  *(_OWORD *)(a1 + v14) = *(_OWORD *)(a2 + v14);
  uint64_t v18 = a3[10];
  *(_OWORD *)(a1 + a3[9]) = *(_OWORD *)(a2 + a3[9]);
  uint64_t v19 = (void *)(a1 + v18);
  uint64_t v20 = (const void *)(a2 + v18);
  uint64_t v21 = sub_100006380(&qword_10006B218);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v22 = type metadata accessor for DynamicTypeSize();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v22 - 8) + 32))(v19, v20, v22);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v19, v20, *(void *)(*(void *)(v21 - 8) + 64));
  }
  *(_OWORD *)(a1 + a3[11]) = *(_OWORD *)(a2 + a3[11]);
  return a1;
}

uint64_t sub_1000494F8(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = type metadata accessor for AXLTCaption();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  *(void *)(a1 + v7) = *(void *)(a2 + v7);
  swift_release();
  *(void *)(v8 + 8) = *(void *)(v9 + 8);
  swift_release();
  *(void *)(v8 + 16) = *(void *)(v9 + 16);
  uint64_t v10 = a3[6];
  uint64_t v11 = a1 + v10;
  uint64_t v12 = a2 + v10;
  *(void *)(a1 + v10) = *(void *)(a2 + v10);
  swift_release();
  *(void *)(v11 + 8) = *(void *)(v12 + 8);
  swift_release();
  *(void *)(v11 + 16) = *(void *)(v12 + 16);
  uint64_t v13 = a3[7];
  uint64_t v14 = (void *)(a1 + v13);
  long long v15 = (void *)(a2 + v13);
  *(void *)(a1 + v13) = *(void *)(a2 + v13);
  swift_release();
  v14[1] = v15[1];
  swift_release();
  uint64_t v16 = v15[3];
  v14[2] = v15[2];
  v14[3] = v16;
  swift_bridgeObjectRelease();
  uint64_t v17 = a3[8];
  uint64_t v18 = a1 + v17;
  uint64_t v19 = a2 + v17;
  *(void *)(a1 + v17) = *(void *)(a2 + v17);
  swift_release();
  *(void *)(v18 + 8) = *(void *)(v19 + 8);
  swift_release();
  uint64_t v20 = a3[9];
  uint64_t v21 = a1 + v20;
  uint64_t v22 = a2 + v20;
  *(void *)(a1 + v20) = *(void *)(a2 + v20);
  swift_release();
  *(void *)(v21 + 8) = *(void *)(v22 + 8);
  swift_release();
  if (a1 != a2)
  {
    uint64_t v23 = a3[10];
    uint64_t v24 = (void *)(a1 + v23);
    uint64_t v25 = (const void *)(a2 + v23);
    sub_1000067B8(a1 + v23, &qword_10006B218);
    uint64_t v26 = sub_100006380(&qword_10006B218);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v27 = type metadata accessor for DynamicTypeSize();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v27 - 8) + 32))(v24, v25, v27);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v24, v25, *(void *)(*(void *)(v26 - 8) + 64));
    }
  }
  uint64_t v28 = a3[11];
  uint64_t v29 = (void *)(a1 + v28);
  uint64_t v30 = (void *)(a2 + v28);
  id v31 = *(void **)(a1 + v28);
  *uint64_t v29 = *v30;

  v29[1] = v30[1];
  swift_release();
  return a1;
}

uint64_t sub_100049750(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100049764);
}

uint64_t sub_100049764(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for AXLTCaption();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else if (a2 == 0x7FFFFFFF)
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20) + 8);
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
  else
  {
    uint64_t v11 = sub_100006380(&qword_10006B220);
    uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 48);
    uint64_t v13 = v11;
    uint64_t v14 = a1 + *(int *)(a3 + 40);
    return v12(v14, a2, v13);
  }
}

uint64_t sub_100049898(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000498AC);
}

uint64_t sub_1000498AC(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = type metadata accessor for AXLTCaption();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else if (a3 == 0x7FFFFFFF)
  {
    *(void *)(a1 + *(int *)(a4 + 20) + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v11 = sub_100006380(&qword_10006B220);
    uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56);
    uint64_t v13 = v11;
    uint64_t v14 = a1 + *(int *)(a4 + 40);
    return v12(v14, a2, a2, v13);
  }
  return result;
}

void sub_1000499E0()
{
  type metadata accessor for AXLTCaption();
  if (v0 <= 0x3F)
  {
    sub_10000B78C();
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

unint64_t sub_100049AD4()
{
  unint64_t result = qword_10006C5F8;
  if (!qword_10006C5F8)
  {
    sub_10000646C(&qword_10006C600);
    sub_1000068B8(&qword_10006C4A0, &qword_10006C498);
    sub_100044F28();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006C5F8);
  }
  return result;
}

uint64_t sub_100049B74()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100049B94(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_100049BFC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *(void *)(type metadata accessor for AXLTTextScrollView(0) - 8);
  uint64_t v4 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));

  return sub_10004518C(v4, a1);
}

unint64_t sub_100049C7C()
{
  unint64_t result = qword_10006C650;
  if (!qword_10006C650)
  {
    sub_10000646C(&qword_10006C628);
    sub_100049D1C();
    sub_1000068B8(&qword_10006BC60, &qword_10006BC68);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006C650);
  }
  return result;
}

unint64_t sub_100049D1C()
{
  unint64_t result = qword_10006C658;
  if (!qword_10006C658)
  {
    sub_10000646C(&qword_10006C620);
    sub_1000068B8(&qword_10006C660, &qword_10006C618);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006C658);
  }
  return result;
}

uint64_t sub_100049DC0()
{
  uint64_t v1 = type metadata accessor for AXLTTextScrollView(0);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*(void *)(v1 - 8) + 64);
  uint64_t v5 = type metadata accessor for AXLTCaption();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v0 + v3, v5);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v6 = v0 + v3 + *(int *)(v1 + 40);
  sub_100006380(&qword_10006B218);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = type metadata accessor for DynamicTypeSize();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  }
  else
  {
    swift_release();
  }

  swift_release();

  return _swift_deallocObject(v0, v3 + v4, v2 | 7);
}

uint64_t sub_100049FB4(uint64_t a1)
{
  return sub_100048638(a1, type metadata accessor for AXLTTextScrollView, sub_1000478C4);
}

uint64_t sub_100049FE4(uint64_t a1)
{
  return sub_100048638(a1, type metadata accessor for AXLTTextScrollView, sub_1000479E0);
}

uint64_t sub_10004A010@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = EnvironmentValues.font.getter();
  *a1 = result;
  return result;
}

uint64_t sub_10004A03C()
{
  return EnvironmentValues.font.setter();
}

void sub_10004A06C(double a1, double a2)
{
  type metadata accessor for AXLTTextScrollView(0);

  sub_100046658(a1, a2);
}

uint64_t sub_10004A0E4()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10004A11C(double *a1)
{
  return sub_10002C7C0(a1, *(uint64_t (**)(double, double))(v1 + 16));
}

NSObject *sub_10004A128(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *(void *)(type metadata accessor for AXLTTextScrollView(0) - 8);
  uint64_t v6 = v2 + ((*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));

  return sub_10004704C(a1, a2, v6);
}

unint64_t sub_10004A1A8()
{
  unint64_t result = qword_10006C678;
  if (!qword_10006C678)
  {
    sub_10000646C(&qword_10006C670);
    sub_10004A248();
    sub_1000068B8(&qword_10006BD00, &qword_10006BD08);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006C678);
  }
  return result;
}

unint64_t sub_10004A248()
{
  unint64_t result = qword_10006C680;
  if (!qword_10006C680)
  {
    sub_10000646C(&qword_10006C688);
    sub_10004A344(&qword_10006C690, &qword_10006C698, (void (*)(void))sub_10004A314);
    sub_1000068B8(&qword_10006BCF0, &qword_10006BCF8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006C680);
  }
  return result;
}

uint64_t sub_10004A314()
{
  return sub_10004A344(&qword_10006C6A0, &qword_10006C6A8, (void (*)(void))sub_10004A3C0);
}

uint64_t sub_10004A344(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10000646C(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10004A3C0()
{
  return sub_10004A344(&qword_10006C6B0, &qword_10006C6B8, (void (*)(void))sub_10004A3F0);
}

unint64_t sub_10004A3F0()
{
  unint64_t result = qword_10006C6C0;
  if (!qword_10006C6C0)
  {
    sub_10000646C(&qword_10006C6C8);
    sub_10004A4B0(&qword_10006C6D0, &qword_10006C6D8, &qword_10006C6E0, &qword_10006C6E8);
    sub_1000068B8(&qword_10006B3E8, &qword_10006B3F0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006C6C0);
  }
  return result;
}

uint64_t sub_10004A4B0(unint64_t *a1, uint64_t *a2, unint64_t *a3, uint64_t *a4)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10000646C(a2);
    sub_1000068B8(a3, a4);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10004A54C(uint64_t a1)
{
  return a1;
}

uint64_t sub_10004A5D8()
{
  uint64_t v1 = type metadata accessor for AXLTTextScrollView(0);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*(void *)(v1 - 8) + 64);
  uint64_t v5 = type metadata accessor for AXLTCaption();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v0 + v3, v5);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v6 = v0 + v3 + *(int *)(v1 + 40);
  sub_100006380(&qword_10006B218);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = type metadata accessor for DynamicTypeSize();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  }
  else
  {
    swift_release();
  }

  swift_release();
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, ((v4 + v3 + 7) & 0xFFFFFFFFFFFFFFF8) + 16, v2 | 7);
}

NSObject *sub_10004A7E4(void *a1)
{
  uint64_t v3 = *(void *)(type metadata accessor for AXLTTextScrollView(0) - 8);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v5 = v1 + v4;
  uint64_t v6 = (uint64_t *)(v1 + ((*(void *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v7 = *v6;
  uint64_t v8 = v6[1];

  return sub_100047AFC(a1, v5, v7, v8);
}

uint64_t sub_10004A884(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10004A894()
{
  return swift_release();
}

uint64_t sub_10004A89C()
{
  return sub_100048074();
}

uint64_t sub_10004A8C0()
{
  return sub_1000068B8(&qword_10006C6F0, &qword_10006C6F8);
}

void sub_10004AA10()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for RootView();
  __chkstk_darwin(v2);
  unint64_t v4 = (char *)&v24 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v7 = (uint64_t *)((char *)&v24 - v6);
  id v8 = [self clearColor];
  [v0 setBackgroundColor:v8];

  [v0 setClipsToBounds:1];
  [v0 makeKeyAndVisible];
  [v0 setOverrideUserInterfaceStyle:2];
  sub_1000190FC(v7);
  sub_10004AF00((uint64_t)v7, (uint64_t)v4);
  sub_10004AF64();
  AnyView.init<A>(_:)();
  uint64_t v9 = (void *)_makeUIHostingController(_:tracksContentSize:secure:)();
  swift_release();
  self;
  unint64_t v10 = (void *)swift_dynamicCastObjCClassUnconditional();
  id v11 = [v10 view];
  if (!v11)
  {
    __break(1u);
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  uint64_t v12 = v11;
  sub_10004AFBC();
  static Color.clear.getter();
  uint64_t v13 = (void *)UIColor.init(_:)();
  [v12 setBackgroundColor:v13];

  [v1 setRootViewController:v10];
  uint64_t v14 = 18;
  if (!_AXSLiveTranscriptionScreenshotHidingEnabled())
  {
    if (AXSSIsAppleInternalBuild()) {
      uint64_t v14 = 0;
    }
    else {
      uint64_t v14 = 18;
    }
  }
  id v15 = [v1 rootViewController];
  if (!v15) {
    goto LABEL_11;
  }
  uint64_t v16 = v15;
  id v17 = [v15 view];

  if (!v17)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  id v18 = [v17 layer];

  [v18 setDisableUpdateMask:v14];
  uint64_t v19 = CFNotificationCenterGetDarwinNotifyCenter();
  if (kAXSLiveTranscriptionScreenshotHidingDidChangeNotification)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void (__cdecl **)(CFNotificationCenterRef, void *, CFNotificationName, const void *, CFDictionaryRef))&v1[OBJC_IVAR____TtC19LiveTranscriptionUI8LTWindow_screenshotsHidingChanged];
    uint64_t v22 = (__CFString *)kAXSLiveTranscriptionScreenshotHidingDidChangeNotification;
    CFNotificationCenterAddObserver(v20, v1, v21, v22, 0, CFNotificationSuspensionBehaviorDeliverImmediately);

    id v23 = [self defaultCenter];
    [v23 addObserver:v1 selector:"localeDidChangeWithNotification:" name:NSCurrentLocaleDidChangeNotification object:0];

    sub_10004AFFC((uint64_t)v7);
    return;
  }
LABEL_13:
  __break(1u);
}

void sub_10004AD48(uint64_t a1, void *a2)
{
}

void sub_10004AE84()
{
}

id sub_10004AEA8()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for LTWindow();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for LTWindow()
{
  return self;
}

uint64_t sub_10004AF00(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for RootView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_10004AF64()
{
  unint64_t result = qword_10006C730;
  if (!qword_10006C730)
  {
    type metadata accessor for RootView();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006C730);
  }
  return result;
}

unint64_t sub_10004AFBC()
{
  unint64_t result = qword_10006BEA0;
  if (!qword_10006BEA0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10006BEA0);
  }
  return result;
}

uint64_t sub_10004AFFC(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for RootView();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_10004B058(void *a1)
{
  if (!a1) {
    return;
  }
  id v1 = a1;
  uint64_t v2 = 18;
  if (!_AXSLiveTranscriptionScreenshotHidingEnabled())
  {
    if (AXSSIsAppleInternalBuild()) {
      uint64_t v2 = 0;
    }
    else {
      uint64_t v2 = 18;
    }
  }
  id v3 = [v1 rootViewController];
  if (!v3)
  {
    __break(1u);
    goto LABEL_13;
  }
  uint64_t v4 = v3;
  id v5 = [v3 view];

  if (!v5)
  {
LABEL_13:
    __break(1u);
    return;
  }
  id v6 = [v5 layer];

  [v6 setDisableUpdateMask:v2];
}

ValueMetadata *type metadata accessor for SizePreferenceKey()
{
  return &type metadata for SizePreferenceKey;
}

void sub_10004B160()
{
  xmmword_10006E030 = 0uLL;
}

double sub_10004B170@<D0>(_OWORD *a1@<X8>)
{
  if (qword_10006AE30 != -1) {
    swift_once();
  }
  double result = *(double *)&xmmword_10006E030;
  *a1 = xmmword_10006E030;
  return result;
}

uint64_t sub_10004B1D4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = static Color.clear.getter();
  uint64_t result = GeometryProxy.size.getter();
  *a1 = v2;
  a1[1] = v4;
  a1[2] = v5;
  return result;
}

uint64_t sub_10004B214()
{
  uint64_t result = static Color.white.getter();
  microphoneColor = result;
  return result;
}

uint64_t *microphoneColor.unsafeMutableAddressor()
{
  if (qword_10006AE38 != -1) {
    swift_once();
  }
  return &microphoneColor;
}

double AudioHistogramConfig.levelBarMaxHeight.getter()
{
  return sub_10004CC98();
}

double sub_10004B294@<D0>(double *a1@<X8>)
{
  return sub_10004CD04(a1);
}

uint64_t sub_10004B2BC()
{
  return sub_10004CDA8();
}

uint64_t AudioHistogramConfig.levelBarMaxHeight.setter()
{
  return sub_10004CE5C();
}

uint64_t (*AudioHistogramConfig.levelBarMaxHeight.modify(void *a1))()
{
  uint64_t v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = static Published.subscript.modify();
  return sub_1000317A4;
}

uint64_t AudioHistogramConfig.$levelBarMaxHeight.getter()
{
  return sub_100031B04((uint64_t)&OBJC_IVAR____TtC19LiveTranscriptionUI20AudioHistogramConfig__levelBarMaxHeight, &qword_10006C748);
}

uint64_t AudioHistogramConfig.$levelBarMaxHeight.setter(uint64_t a1)
{
  return sub_10004D7A4(a1, &qword_10006C750, (uint64_t)&OBJC_IVAR____TtC19LiveTranscriptionUI20AudioHistogramConfig__levelBarMaxHeight, &qword_10006C748);
}

uint64_t (*AudioHistogramConfig.$levelBarMaxHeight.modify(void *a1))()
{
  id v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = sub_100006380(&qword_10006C750);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  uint64_t v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC19LiveTranscriptionUI20AudioHistogramConfig__levelBarMaxHeight;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = sub_100006380(&qword_10006C748);
  Published.projectedValue.getter();
  swift_endAccess();
  return sub_1000318E8;
}

double AudioHistogramConfig.levelBarMinHeight.getter()
{
  return sub_10004CC98();
}

double sub_10004B4D8@<D0>(double *a1@<X8>)
{
  return sub_10004CD04(a1);
}

uint64_t sub_10004B500()
{
  return sub_10004CDA8();
}

uint64_t AudioHistogramConfig.levelBarMinHeight.setter()
{
  return sub_10004CE5C();
}

uint64_t (*AudioHistogramConfig.levelBarMinHeight.modify(void *a1))()
{
  uint64_t v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = static Published.subscript.modify();
  return sub_1000317A4;
}

uint64_t AudioHistogramConfig.$levelBarMinHeight.getter()
{
  return sub_100031B04((uint64_t)&OBJC_IVAR____TtC19LiveTranscriptionUI20AudioHistogramConfig__levelBarMinHeight, &qword_10006C748);
}

uint64_t AudioHistogramConfig.$levelBarMinHeight.setter(uint64_t a1)
{
  return sub_10004D7A4(a1, &qword_10006C750, (uint64_t)&OBJC_IVAR____TtC19LiveTranscriptionUI20AudioHistogramConfig__levelBarMinHeight, &qword_10006C748);
}

uint64_t (*AudioHistogramConfig.$levelBarMinHeight.modify(void *a1))()
{
  id v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = sub_100006380(&qword_10006C750);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  uint64_t v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC19LiveTranscriptionUI20AudioHistogramConfig__levelBarMinHeight;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = sub_100006380(&qword_10006C748);
  Published.projectedValue.getter();
  swift_endAccess();
  return sub_1000318E8;
}

double AudioHistogramConfig.levelBarWidth.getter()
{
  return sub_10004CC98();
}

double sub_10004B71C@<D0>(double *a1@<X8>)
{
  return sub_10004CD04(a1);
}

double sub_10004B730@<D0>(double *a1@<X8>)
{
  return sub_10004CD04(a1);
}

uint64_t sub_10004B758()
{
  return sub_10004CDA8();
}

uint64_t sub_10004B76C()
{
  return sub_10004CDA8();
}

uint64_t AudioHistogramConfig.levelBarWidth.setter()
{
  return sub_10004CE5C();
}

uint64_t (*AudioHistogramConfig.levelBarWidth.modify(void *a1))()
{
  uint64_t v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = static Published.subscript.modify();
  return sub_1000317A4;
}

uint64_t AudioHistogramConfig.$levelBarWidth.getter()
{
  return sub_100031B04((uint64_t)&OBJC_IVAR____TtC19LiveTranscriptionUI20AudioHistogramConfig__levelBarWidth, &qword_10006C748);
}

uint64_t AudioHistogramConfig.$levelBarWidth.setter(uint64_t a1)
{
  return sub_10004D7A4(a1, &qword_10006C750, (uint64_t)&OBJC_IVAR____TtC19LiveTranscriptionUI20AudioHistogramConfig__levelBarWidth, &qword_10006C748);
}

uint64_t (*AudioHistogramConfig.$levelBarWidth.modify(void *a1))()
{
  id v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = sub_100006380(&qword_10006C750);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  uint64_t v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC19LiveTranscriptionUI20AudioHistogramConfig__levelBarWidth;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = sub_100006380(&qword_10006C748);
  Published.projectedValue.getter();
  swift_endAccess();
  return sub_1000318E8;
}

uint64_t AudioHistogramConfig.levelBarCount.getter()
{
  return sub_10004D0DC();
}

uint64_t sub_10004B988@<X0>(void *a1@<X8>)
{
  return sub_10004D148(a1);
}

uint64_t sub_10004B99C@<X0>(void *a1@<X8>)
{
  return sub_10004D148(a1);
}

uint64_t sub_10004B9C4()
{
  return sub_10004CA0C();
}

uint64_t sub_10004B9D8()
{
  return sub_10004CA0C();
}

uint64_t AudioHistogramConfig.levelBarCount.setter()
{
  return sub_10004D280();
}

uint64_t (*AudioHistogramConfig.levelBarCount.modify(void *a1))()
{
  uint64_t v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = static Published.subscript.modify();
  return sub_1000317A4;
}

uint64_t AudioHistogramConfig.$levelBarCount.getter()
{
  return sub_100031B04((uint64_t)&OBJC_IVAR____TtC19LiveTranscriptionUI20AudioHistogramConfig__levelBarCount, &qword_10006BF68);
}

uint64_t AudioHistogramConfig.$levelBarCount.setter(uint64_t a1)
{
  return sub_10004D7A4(a1, &qword_10006BF70, (uint64_t)&OBJC_IVAR____TtC19LiveTranscriptionUI20AudioHistogramConfig__levelBarCount, &qword_10006BF68);
}

uint64_t (*AudioHistogramConfig.$levelBarCount.modify(void *a1))()
{
  id v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = sub_100006380(&qword_10006BF70);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  uint64_t v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC19LiveTranscriptionUI20AudioHistogramConfig__levelBarCount;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = sub_100006380(&qword_10006BF68);
  Published.projectedValue.getter();
  swift_endAccess();
  return sub_1000318E8;
}

uint64_t AudioHistogramConfig.levelBarKeys.getter()
{
  return sub_10004D0DC();
}

uint64_t sub_10004BBF4@<X0>(void *a1@<X8>)
{
  return sub_10004D148(a1);
}

uint64_t sub_10004BC1C()
{
  return sub_10004CA0C();
}

uint64_t AudioHistogramConfig.levelBarKeys.setter()
{
  return sub_10004D280();
}

uint64_t (*AudioHistogramConfig.levelBarKeys.modify(void *a1))()
{
  uint64_t v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = static Published.subscript.modify();
  return sub_1000317A4;
}

uint64_t AudioHistogramConfig.$levelBarKeys.getter()
{
  return sub_100031B04((uint64_t)&OBJC_IVAR____TtC19LiveTranscriptionUI20AudioHistogramConfig__levelBarKeys, &qword_10006BF68);
}

uint64_t AudioHistogramConfig.$levelBarKeys.setter(uint64_t a1)
{
  return sub_10004D7A4(a1, &qword_10006BF70, (uint64_t)&OBJC_IVAR____TtC19LiveTranscriptionUI20AudioHistogramConfig__levelBarKeys, &qword_10006BF68);
}

uint64_t (*AudioHistogramConfig.$levelBarKeys.modify(void *a1))()
{
  id v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = sub_100006380(&qword_10006BF70);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  uint64_t v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC19LiveTranscriptionUI20AudioHistogramConfig__levelBarKeys;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = sub_100006380(&qword_10006BF68);
  Published.projectedValue.getter();
  swift_endAccess();
  return sub_1000318E8;
}

double AudioHistogramConfig.levelBarSpacing.getter()
{
  return sub_10004CC98();
}

double sub_10004BE38@<D0>(double *a1@<X8>)
{
  return sub_10004CD04(a1);
}

double sub_10004BE4C@<D0>(double *a1@<X8>)
{
  return sub_10004CD04(a1);
}

uint64_t sub_10004BE74()
{
  return sub_10004CDA8();
}

uint64_t sub_10004BE88()
{
  return sub_10004CDA8();
}

uint64_t AudioHistogramConfig.levelBarSpacing.setter()
{
  return sub_10004CE5C();
}

uint64_t (*AudioHistogramConfig.levelBarSpacing.modify(void *a1))()
{
  uint64_t v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = static Published.subscript.modify();
  return sub_1000317A4;
}

uint64_t AudioHistogramConfig.$levelBarSpacing.getter()
{
  return sub_100031B04((uint64_t)&OBJC_IVAR____TtC19LiveTranscriptionUI20AudioHistogramConfig__levelBarSpacing, &qword_10006C748);
}

uint64_t AudioHistogramConfig.$levelBarSpacing.setter(uint64_t a1)
{
  return sub_10004D7A4(a1, &qword_10006C750, (uint64_t)&OBJC_IVAR____TtC19LiveTranscriptionUI20AudioHistogramConfig__levelBarSpacing, &qword_10006C748);
}

uint64_t (*AudioHistogramConfig.$levelBarSpacing.modify(void *a1))()
{
  id v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = sub_100006380(&qword_10006C750);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  uint64_t v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC19LiveTranscriptionUI20AudioHistogramConfig__levelBarSpacing;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = sub_100006380(&qword_10006C748);
  Published.projectedValue.getter();
  swift_endAccess();
  return sub_1000318E8;
}

double AudioHistogramConfig.animationTimerDuration.getter()
{
  return sub_10004CC98();
}

double sub_10004C0A4@<D0>(double *a1@<X8>)
{
  return sub_10004CD04(a1);
}

uint64_t sub_10004C0CC()
{
  return sub_10004CDA8();
}

uint64_t AudioHistogramConfig.animationTimerDuration.setter()
{
  return sub_10004CE5C();
}

uint64_t (*AudioHistogramConfig.animationTimerDuration.modify(void *a1))()
{
  uint64_t v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = static Published.subscript.modify();
  return sub_1000317A4;
}

uint64_t AudioHistogramConfig.$animationTimerDuration.getter()
{
  return sub_100031B04((uint64_t)&OBJC_IVAR____TtC19LiveTranscriptionUI20AudioHistogramConfig__animationTimerDuration, &qword_10006C748);
}

uint64_t AudioHistogramConfig.$animationTimerDuration.setter(uint64_t a1)
{
  return sub_10004D7A4(a1, &qword_10006C750, (uint64_t)&OBJC_IVAR____TtC19LiveTranscriptionUI20AudioHistogramConfig__animationTimerDuration, &qword_10006C748);
}

uint64_t (*AudioHistogramConfig.$animationTimerDuration.modify(void *a1))()
{
  id v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = sub_100006380(&qword_10006C750);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  uint64_t v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC19LiveTranscriptionUI20AudioHistogramConfig__animationTimerDuration;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = sub_100006380(&qword_10006C748);
  Published.projectedValue.getter();
  swift_endAccess();
  return sub_1000318E8;
}

double AudioHistogramConfig.minBarScale.getter()
{
  return sub_10004CC98();
}

double sub_10004C2E8@<D0>(double *a1@<X8>)
{
  return sub_10004CD04(a1);
}

uint64_t sub_10004C310()
{
  return sub_10004CDA8();
}

uint64_t AudioHistogramConfig.minBarScale.setter()
{
  return sub_10004CE5C();
}

uint64_t (*AudioHistogramConfig.minBarScale.modify(void *a1))()
{
  uint64_t v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = static Published.subscript.modify();
  return sub_1000317A4;
}

uint64_t AudioHistogramConfig.$minBarScale.getter()
{
  return sub_100031B04((uint64_t)&OBJC_IVAR____TtC19LiveTranscriptionUI20AudioHistogramConfig__minBarScale, &qword_10006C748);
}

uint64_t AudioHistogramConfig.$minBarScale.setter(uint64_t a1)
{
  return sub_10004D7A4(a1, &qword_10006C750, (uint64_t)&OBJC_IVAR____TtC19LiveTranscriptionUI20AudioHistogramConfig__minBarScale, &qword_10006C748);
}

uint64_t (*AudioHistogramConfig.$minBarScale.modify(void *a1))()
{
  id v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = sub_100006380(&qword_10006C750);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  uint64_t v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC19LiveTranscriptionUI20AudioHistogramConfig__minBarScale;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = sub_100006380(&qword_10006C748);
  Published.projectedValue.getter();
  swift_endAccess();
  return sub_1000318E8;
}

uint64_t property wrapper backing initializer of AudioHistogramConfig.maxBarScale()
{
  return Published.init(initialValue:)();
}

double AudioHistogramConfig.maxBarScale.getter()
{
  return sub_10004CC98();
}

double sub_10004C55C@<D0>(double *a1@<X8>)
{
  return sub_10004CD04(a1);
}

uint64_t sub_10004C584()
{
  return sub_10004CDA8();
}

uint64_t AudioHistogramConfig.maxBarScale.setter()
{
  return sub_10004CE5C();
}

uint64_t (*AudioHistogramConfig.maxBarScale.modify(void *a1))()
{
  uint64_t v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = static Published.subscript.modify();
  return sub_1000317A4;
}

uint64_t AudioHistogramConfig.$maxBarScale.getter()
{
  return sub_100031B04((uint64_t)&OBJC_IVAR____TtC19LiveTranscriptionUI20AudioHistogramConfig__maxBarScale, &qword_10006C748);
}

uint64_t AudioHistogramConfig.$maxBarScale.setter(uint64_t a1)
{
  return sub_10004D7A4(a1, &qword_10006C750, (uint64_t)&OBJC_IVAR____TtC19LiveTranscriptionUI20AudioHistogramConfig__maxBarScale, &qword_10006C748);
}

uint64_t (*AudioHistogramConfig.$maxBarScale.modify(void *a1))()
{
  id v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = sub_100006380(&qword_10006C750);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  uint64_t v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC19LiveTranscriptionUI20AudioHistogramConfig__maxBarScale;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = sub_100006380(&qword_10006C748);
  Published.projectedValue.getter();
  swift_endAccess();
  return sub_1000318E8;
}

uint64_t AudioHistogramConfig.randomPower.getter()
{
  return sub_10004D0DC();
}

uint64_t sub_10004C7A0@<X0>(void *a1@<X8>)
{
  return sub_10004D148(a1);
}

uint64_t sub_10004C7C8()
{
  return sub_10004CA0C();
}

uint64_t AudioHistogramConfig.randomPower.setter()
{
  return sub_10004D280();
}

uint64_t (*AudioHistogramConfig.randomPower.modify(void *a1))()
{
  uint64_t v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = static Published.subscript.modify();
  return sub_1000317A4;
}

uint64_t AudioHistogramConfig.$randomPower.getter()
{
  return sub_100031B04((uint64_t)&OBJC_IVAR____TtC19LiveTranscriptionUI20AudioHistogramConfig__randomPower, &qword_10006BF68);
}

uint64_t AudioHistogramConfig.$randomPower.setter(uint64_t a1)
{
  return sub_10004D7A4(a1, &qword_10006BF70, (uint64_t)&OBJC_IVAR____TtC19LiveTranscriptionUI20AudioHistogramConfig__randomPower, &qword_10006BF68);
}

uint64_t (*AudioHistogramConfig.$randomPower.modify(void *a1))()
{
  id v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = sub_100006380(&qword_10006BF70);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  uint64_t v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC19LiveTranscriptionUI20AudioHistogramConfig__randomPower;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = sub_100006380(&qword_10006BF68);
  Published.projectedValue.getter();
  swift_endAccess();
  return sub_1000318E8;
}

uint64_t AudioHistogramConfig.jitter.getter()
{
  return sub_10004D0DC();
}

uint64_t sub_10004C9E4@<X0>(void *a1@<X8>)
{
  return sub_10004D148(a1);
}

uint64_t sub_10004CA0C()
{
  return static Published.subscript.setter();
}

uint64_t sub_10004CA7C()
{
  return sub_10004CA0C();
}

uint64_t AudioHistogramConfig.jitter.setter()
{
  return sub_10004D280();
}

uint64_t (*AudioHistogramConfig.jitter.modify(void *a1))()
{
  uint64_t v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = static Published.subscript.modify();
  return sub_1000317A4;
}

uint64_t AudioHistogramConfig.$jitter.getter()
{
  return sub_100031B04((uint64_t)&OBJC_IVAR____TtC19LiveTranscriptionUI20AudioHistogramConfig__jitter, &qword_10006BF68);
}

uint64_t AudioHistogramConfig.$jitter.setter(uint64_t a1)
{
  return sub_10004D7A4(a1, &qword_10006BF70, (uint64_t)&OBJC_IVAR____TtC19LiveTranscriptionUI20AudioHistogramConfig__jitter, &qword_10006BF68);
}

uint64_t (*AudioHistogramConfig.$jitter.modify(void *a1))()
{
  id v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = sub_100006380(&qword_10006BF70);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  uint64_t v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC19LiveTranscriptionUI20AudioHistogramConfig__jitter;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = sub_100006380(&qword_10006BF68);
  Published.projectedValue.getter();
  swift_endAccess();
  return sub_1000318E8;
}

double AudioHistogramConfig.magnitude.getter()
{
  return sub_10004CC98();
}

double sub_10004CC98()
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  return v1;
}

double sub_10004CD04@<D0>(double *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  double result = v3;
  *a1 = v3;
  return result;
}

double sub_10004CD80@<D0>(double *a1@<X8>)
{
  return sub_10004CD04(a1);
}

uint64_t sub_10004CDA8()
{
  return static Published.subscript.setter();
}

uint64_t sub_10004CE20()
{
  return sub_10004CDA8();
}

uint64_t AudioHistogramConfig.magnitude.setter()
{
  return sub_10004CE5C();
}

uint64_t sub_10004CE5C()
{
  return static Published.subscript.setter();
}

uint64_t (*AudioHistogramConfig.magnitude.modify(void *a1))()
{
  uint64_t v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = static Published.subscript.modify();
  return sub_1000317A4;
}

uint64_t AudioHistogramConfig.$magnitude.getter()
{
  return sub_100031B04((uint64_t)&OBJC_IVAR____TtC19LiveTranscriptionUI20AudioHistogramConfig__magnitude, &qword_10006C748);
}

uint64_t AudioHistogramConfig.$magnitude.setter(uint64_t a1)
{
  return sub_10004D7A4(a1, &qword_10006C750, (uint64_t)&OBJC_IVAR____TtC19LiveTranscriptionUI20AudioHistogramConfig__magnitude, &qword_10006C748);
}

uint64_t (*AudioHistogramConfig.$magnitude.modify(void *a1))()
{
  double v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = sub_100006380(&qword_10006C750);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  uint64_t v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC19LiveTranscriptionUI20AudioHistogramConfig__magnitude;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = sub_100006380(&qword_10006C748);
  Published.projectedValue.getter();
  swift_endAccess();
  return sub_1000318E8;
}

uint64_t property wrapper backing initializer of AudioHistogramConfig.levelBarColor()
{
  return Published.init(initialValue:)();
}

uint64_t AudioHistogramConfig.levelBarColor.getter()
{
  return sub_10004D0DC();
}

uint64_t sub_10004D0DC()
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_10004D148@<X0>(void *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_10004D1C4@<X0>(void *a1@<X8>)
{
  return sub_10004D148(a1);
}

uint64_t sub_10004D1EC()
{
  return static Published.subscript.setter();
}

uint64_t AudioHistogramConfig.levelBarColor.setter()
{
  return sub_10004D280();
}

uint64_t sub_10004D280()
{
  return static Published.subscript.setter();
}

uint64_t (*AudioHistogramConfig.levelBarColor.modify(void *a1))()
{
  uint64_t v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = static Published.subscript.modify();
  return sub_1000317A4;
}

uint64_t AudioHistogramConfig.$levelBarColor.getter()
{
  return sub_100031B04((uint64_t)&OBJC_IVAR____TtC19LiveTranscriptionUI20AudioHistogramConfig__levelBarColor, &qword_10006C7B8);
}

uint64_t AudioHistogramConfig.$levelBarColor.setter(uint64_t a1)
{
  return sub_10004D7A4(a1, &qword_10006C7C0, (uint64_t)&OBJC_IVAR____TtC19LiveTranscriptionUI20AudioHistogramConfig__levelBarColor, &qword_10006C7B8);
}

uint64_t (*AudioHistogramConfig.$levelBarColor.modify(void *a1))()
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = sub_100006380(&qword_10006C7C0);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  uint64_t v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC19LiveTranscriptionUI20AudioHistogramConfig__levelBarColor;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = sub_100006380(&qword_10006C7B8);
  Published.projectedValue.getter();
  swift_endAccess();
  return sub_1000318E8;
}

uint64_t property wrapper backing initializer of AudioHistogramConfig.histogram()
{
  return Published.init(initialValue:)();
}

uint64_t AudioHistogramConfig.histogram.getter()
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_10004D574@<X0>(void *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_10004D5F8()
{
  return static Published.subscript.setter();
}

uint64_t AudioHistogramConfig.histogram.setter()
{
  return static Published.subscript.setter();
}

uint64_t (*AudioHistogramConfig.histogram.modify(void *a1))()
{
  uint64_t v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = static Published.subscript.modify();
  return sub_1000317A4;
}

uint64_t AudioHistogramConfig.$histogram.getter()
{
  return sub_100031B04((uint64_t)&OBJC_IVAR____TtC19LiveTranscriptionUI20AudioHistogramConfig__histogram, &qword_10006C7D8);
}

uint64_t AudioHistogramConfig.$histogram.setter(uint64_t a1)
{
  return sub_10004D7A4(a1, &qword_10006C7E0, (uint64_t)&OBJC_IVAR____TtC19LiveTranscriptionUI20AudioHistogramConfig__histogram, &qword_10006C7D8);
}

uint64_t sub_10004D7A4(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v6 = sub_100006380(a2);
  uint64_t v7 = *(void *)(v6 - 8);
  double v8 = __chkstk_darwin(v6);
  (*(void (**)(char *, uint64_t, uint64_t, double))(v7 + 16))((char *)&v11 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v6, v8);
  swift_beginAccess();
  sub_100006380(a4);
  Published.projectedValue.setter();
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
}

uint64_t (*AudioHistogramConfig.$histogram.modify(void *a1))()
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = sub_100006380(&qword_10006C7E0);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  uint64_t v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC19LiveTranscriptionUI20AudioHistogramConfig__histogram;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = sub_100006380(&qword_10006C7D8);
  Published.projectedValue.getter();
  swift_endAccess();
  return sub_1000318E8;
}

uint64_t sub_10004D9E4()
{
  return swift_release();
}

uint64_t sub_10004DB50()
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  uint64_t result = swift_release();
  if (__OFSUB__(*(void *)&v2, 1))
  {
    __break(1u);
    goto LABEL_7;
  }
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  uint64_t result = swift_release();
  double v1 = v2 * (double)*(uint64_t *)&v2 + v2 * (double)(*(void *)&v2 - 1);
  if ((~*(void *)&v1 & 0x7FF0000000000000) == 0)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  if (v1 <= -9.22337204e18)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  if (v1 < 9.22337204e18) {
    return (uint64_t)v1;
  }
LABEL_9:
  __break(1u);
  return result;
}

uint64_t AudioHistogramConfig.deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC19LiveTranscriptionUI20AudioHistogramConfig__levelBarMaxHeight;
  uint64_t v2 = sub_100006380(&qword_10006C748);
  uint64_t v3 = *(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);
  v3(v1, v2);
  v3(v0 + OBJC_IVAR____TtC19LiveTranscriptionUI20AudioHistogramConfig__levelBarMinHeight, v2);
  v3(v0 + OBJC_IVAR____TtC19LiveTranscriptionUI20AudioHistogramConfig__levelBarWidth, v2);
  uint64_t v4 = v0 + OBJC_IVAR____TtC19LiveTranscriptionUI20AudioHistogramConfig__levelBarCount;
  uint64_t v5 = sub_100006380(&qword_10006BF68);
  size_t v6 = *(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
  v6(v4, v5);
  v6(v0 + OBJC_IVAR____TtC19LiveTranscriptionUI20AudioHistogramConfig__levelBarKeys, v5);
  v3(v0 + OBJC_IVAR____TtC19LiveTranscriptionUI20AudioHistogramConfig__levelBarSpacing, v2);
  v3(v0 + OBJC_IVAR____TtC19LiveTranscriptionUI20AudioHistogramConfig__animationTimerDuration, v2);
  v3(v0 + OBJC_IVAR____TtC19LiveTranscriptionUI20AudioHistogramConfig__minBarScale, v2);
  v3(v0 + OBJC_IVAR____TtC19LiveTranscriptionUI20AudioHistogramConfig__maxBarScale, v2);
  v6(v0 + OBJC_IVAR____TtC19LiveTranscriptionUI20AudioHistogramConfig__randomPower, v5);
  v6(v0 + OBJC_IVAR____TtC19LiveTranscriptionUI20AudioHistogramConfig__jitter, v5);
  v3(v0 + OBJC_IVAR____TtC19LiveTranscriptionUI20AudioHistogramConfig__magnitude, v2);
  uint64_t v7 = v0 + OBJC_IVAR____TtC19LiveTranscriptionUI20AudioHistogramConfig__levelBarColor;
  uint64_t v8 = sub_100006380(&qword_10006C7B8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  uint64_t v9 = v0 + OBJC_IVAR____TtC19LiveTranscriptionUI20AudioHistogramConfig__histogram;
  uint64_t v10 = sub_100006380(&qword_10006C7D8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8))(v9, v10);
  return v0;
}

uint64_t AudioHistogramConfig.__deallocating_deinit()
{
  AudioHistogramConfig.deinit();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return _swift_deallocClassInstance(v0, v1, v2);
}

uint64_t sub_10004DFE0()
{
  uint64_t v1 = sub_100006380(&qword_10006C7D8);
  uint64_t v40 = *(void *)(v1 - 8);
  uint64_t v41 = v1;
  __chkstk_darwin(v1);
  uint64_t v39 = (char *)v34 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100006380(&qword_10006C7B8);
  uint64_t v37 = *(void *)(v3 - 8);
  uint64_t v38 = v3;
  __chkstk_darwin(v3);
  uint64_t v36 = (char *)v34 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v35 = sub_100006380(&qword_10006BF68);
  uint64_t v5 = *(void *)(v35 - 8);
  __chkstk_darwin(v35);
  uint64_t v7 = (char *)v34 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100006380(&qword_10006C748);
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)v34 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = v0 + OBJC_IVAR____TtC19LiveTranscriptionUI20AudioHistogramConfig__levelBarMaxHeight;
  uint64_t v42 = 0x403C000000000000;
  Published.init(initialValue:)();
  uint64_t v13 = *(void (**)(uint64_t, char *, uint64_t))(v9 + 32);
  v13(v12, v11, v8);
  uint64_t v14 = v0 + OBJC_IVAR____TtC19LiveTranscriptionUI20AudioHistogramConfig__levelBarMinHeight;
  uint64_t v42 = 0x4000000000000000;
  Published.init(initialValue:)();
  v13(v14, v11, v8);
  uint64_t v15 = v0 + OBJC_IVAR____TtC19LiveTranscriptionUI20AudioHistogramConfig__levelBarWidth;
  uint64_t v42 = 0x4000000000000000;
  Published.init(initialValue:)();
  v13(v15, v11, v8);
  uint64_t v16 = v0 + OBJC_IVAR____TtC19LiveTranscriptionUI20AudioHistogramConfig__levelBarCount;
  uint64_t v42 = 16;
  Published.init(initialValue:)();
  id v17 = *(void (**)(uint64_t, char *, uint64_t))(v5 + 32);
  uint64_t v18 = v35;
  v17(v16, v7, v35);
  v34[1] = v5 + 32;
  uint64_t v19 = v0 + OBJC_IVAR____TtC19LiveTranscriptionUI20AudioHistogramConfig__levelBarKeys;
  uint64_t v42 = 10;
  Published.init(initialValue:)();
  v17(v19, v7, v18);
  uint64_t v20 = v0 + OBJC_IVAR____TtC19LiveTranscriptionUI20AudioHistogramConfig__levelBarSpacing;
  uint64_t v42 = 0x4000000000000000;
  Published.init(initialValue:)();
  v13(v20, v11, v8);
  uint64_t v21 = v0 + OBJC_IVAR____TtC19LiveTranscriptionUI20AudioHistogramConfig__animationTimerDuration;
  uint64_t v42 = 0x401C000000000000;
  Published.init(initialValue:)();
  v13(v21, v11, v8);
  uint64_t v22 = v0 + OBJC_IVAR____TtC19LiveTranscriptionUI20AudioHistogramConfig__minBarScale;
  uint64_t v42 = 0x3FB999999999999ALL;
  Published.init(initialValue:)();
  v13(v22, v11, v8);
  uint64_t v23 = v0 + OBJC_IVAR____TtC19LiveTranscriptionUI20AudioHistogramConfig__maxBarScale;
  uint64_t v42 = 0x3FF0000000000000;
  Published.init(initialValue:)();
  v13(v23, v11, v8);
  uint64_t v24 = v0 + OBJC_IVAR____TtC19LiveTranscriptionUI20AudioHistogramConfig__randomPower;
  uint64_t v42 = 80;
  Published.init(initialValue:)();
  v17(v24, v7, v18);
  uint64_t v25 = v0 + OBJC_IVAR____TtC19LiveTranscriptionUI20AudioHistogramConfig__jitter;
  uint64_t v42 = 29;
  Published.init(initialValue:)();
  v17(v25, v7, v18);
  uint64_t v26 = v0 + OBJC_IVAR____TtC19LiveTranscriptionUI20AudioHistogramConfig__magnitude;
  uint64_t v42 = 0x3FF0000000000000;
  Published.init(initialValue:)();
  v13(v26, v11, v8);
  uint64_t v27 = OBJC_IVAR____TtC19LiveTranscriptionUI20AudioHistogramConfig__levelBarColor;
  if (qword_10006AE38 != -1) {
    swift_once();
  }
  uint64_t v42 = microphoneColor;
  swift_retain();
  uint64_t v28 = v36;
  Published.init(initialValue:)();
  (*(void (**)(uint64_t, char *, uint64_t))(v37 + 32))(v0 + v27, v28, v38);
  uint64_t v29 = v0 + OBJC_IVAR____TtC19LiveTranscriptionUI20AudioHistogramConfig__histogram;
  uint64_t v30 = static Array._allocateBufferUninitialized(minimumCapacity:)();
  *(void *)(v30 + 16) = 16;
  int64x2_t v31 = vdupq_n_s64(0x3FB999999999999AuLL);
  *(int64x2_t *)(v30 + 32) = v31;
  *(int64x2_t *)(v30 + 48) = v31;
  *(int64x2_t *)(v30 + 64) = v31;
  *(int64x2_t *)(v30 + 80) = v31;
  *(int64x2_t *)(v30 + 96) = v31;
  *(int64x2_t *)(v30 + 112) = v31;
  *(int64x2_t *)(v30 + 128) = v31;
  *(int64x2_t *)(v30 + 144) = v31;
  uint64_t v42 = v30;
  sub_100006380(&qword_10006C7C8);
  os_log_type_t v32 = v39;
  Published.init(initialValue:)();
  (*(void (**)(uint64_t, char *, uint64_t))(v40 + 32))(v29, v32, v41);
  return v0;
}

uint64_t sub_10004E630@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for AudioHistogramConfig();
  uint64_t result = ObservableObject<>.objectWillChange.getter();
  *a1 = result;
  return result;
}

uint64_t sub_10004E670()
{
  uint64_t v0 = sub_100006380(&qword_10006B960);
  __chkstk_darwin(v0 - 8);
  uint64_t v2 = (char *)v8 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000514C8();
  id v3 = [self mainRunLoop];
  uint64_t v4 = type metadata accessor for NSRunLoop.SchedulerOptions();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56))(v2, 1, 1, v4);
  uint64_t v5 = static NSTimer.publish(every:tolerance:on:in:options:)();

  sub_1000067B8((uint64_t)v2, &qword_10006B960);
  v8[1] = v5;
  type metadata accessor for NSTimer.TimerPublisher();
  sub_100051508(&qword_10006CC48, (void (*)(uint64_t))&type metadata accessor for NSTimer.TimerPublisher);
  uint64_t v6 = ConnectablePublisher.autoconnect()();
  uint64_t result = swift_release();
  qword_10006C738 = v6;
  return result;
}

uint64_t sub_10004E80C()
{
  long long v16 = *v0;
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  sub_100051234((uint64_t)&v16);
  double v1 = 1.0;
  if (v15 > 0.0)
  {
    sub_100006380(&qword_10006B6C8);
    State.wrappedValue.getter();
    double v1 = (double)v14 / v15;
  }
  sub_100006380(&qword_10006CC38);
  State.wrappedValue.getter();
  unint64_t v2 = *(void *)(v12 + 16);
  swift_bridgeObjectRelease();
  id v3 = sub_100004844(v2, 0.0);
  uint64_t v4 = *((void *)v3 + 2);
  if (!v4) {
    return (uint64_t)v3;
  }
  uint64_t v5 = -v4;
  uint64_t v6 = 4;
  while (1)
  {
    unint64_t v7 = v6 - 4;
    State.wrappedValue.getter();
    uint64_t result = v13;
    if ((unint64_t)(v6 - 4) >= *(void *)(v13 + 16)) {
      break;
    }
    double v9 = *(double *)(v13 + 8 * v6);
    swift_bridgeObjectRelease();
    State.wrappedValue.getter();
    uint64_t result = v13;
    if (v7 >= *(void *)(v13 + 16)) {
      goto LABEL_14;
    }
    double v10 = *(double *)(v13 + 8 * v6);
    swift_bridgeObjectRelease();
    State.wrappedValue.getter();
    uint64_t result = v13;
    if (v7 >= *(void *)(v13 + 16)) {
      goto LABEL_15;
    }
    double v11 = *(double *)(v13 + 8 * v6);
    swift_bridgeObjectRelease();
    uint64_t result = swift_isUniquelyReferenced_nonNull_native();
    if ((result & 1) == 0)
    {
      uint64_t result = (uint64_t)sub_10003B9BC((uint64_t)v3);
      id v3 = (char *)result;
    }
    if (v7 >= *((void *)v3 + 2)) {
      goto LABEL_16;
    }
    *(double *)&v3[8 * v6++] = v9 + v1 * (v10 - v11);
    if (v5 + v6 == 4) {
      return (uint64_t)v3;
    }
  }
  __break(1u);
LABEL_14:
  __break(1u);
LABEL_15:
  __break(1u);
LABEL_16:
  __break(1u);
  return result;
}

uint64_t sub_10004EA3C()
{
  v9[1] = v0[2];
  long long v8 = v0[2];
  sub_100006380(&qword_10006CC38);
  State.wrappedValue.getter();
  uint64_t v1 = *(void *)(*(void *)&v9[0] + 16);
  swift_bridgeObjectRelease();
  v9[0] = *v0;
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  sub_100051234((uint64_t)v9);
  if (v1 != (void)v8)
  {
    swift_retain();
    sub_10004D9E4();
    double v3 = v2;
    sub_100051234((uint64_t)v9);
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    static Published.subscript.getter();
    swift_release();
    swift_release();
    sub_100051234((uint64_t)v9);
    sub_100004844(v8, v3);
    State.wrappedValue.setter();
  }
  State.wrappedValue.getter();
  State.wrappedValue.setter();
  sub_100006380(&qword_10006B6C8);
  State.wrappedValue.setter();
  if (qword_10006AE28 != -1) {
    swift_once();
  }
  uint64_t v4 = (uint64_t *)(static AXLTCaptionsProvider.shared + OBJC_IVAR___AXLTCaptionsProvider_audioHistogram);
  swift_beginAccess();
  uint64_t v7 = *v4;
  swift_bridgeObjectRetain();
  State.wrappedValue.setter();
  uint64_t v5 = State.wrappedValue.getter();
  __chkstk_darwin(v5);
  sub_1000513B4(v7, (double (*)(uint64_t, double))sub_1000513AC);
  swift_bridgeObjectRelease();
  return State.wrappedValue.setter();
}

uint64_t sub_10004ED10(uint64_t a1, long long *a2)
{
  double v3 = (double)a1;
  long long v7 = a2[2];
  sub_100006380(&qword_10006CC38);
  State.wrappedValue.getter();
  uint64_t v4 = *(void *)(v6 + 16);
  swift_bridgeObjectRelease();
  sin(v3 / (double)v4 * 3.14159265);
  long long v7 = *a2;
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  sub_100051234((uint64_t)&v7);
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  sub_100051234((uint64_t)&v7);
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  return sub_100051234((uint64_t)&v7);
}

uint64_t sub_10004EED0@<X0>(uint64_t a1@<X8>)
{
  double v2 = v1;
  uint64_t v29 = a1;
  uint64_t v3 = type metadata accessor for ColorRenderingMode();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v28 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100006380(&qword_10006CC18);
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  double v10 = (char *)&v28 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_100006380(&qword_10006CC20);
  uint64_t v12 = v11 - 8;
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)&v28 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  double v15 = (_OWORD *)swift_allocObject();
  long long v16 = v2[3];
  v15[3] = v2[2];
  void v15[4] = v16;
  v15[5] = v2[4];
  long long v17 = v2[1];
  v15[1] = *v2;
  _OWORD v15[2] = v17;
  (*(void (**)(char *, void, uint64_t))(v4 + 104))(v6, enum case for ColorRenderingMode.nonLinear(_:), v3);
  sub_1000511A8((uint64_t)v2);
  Canvas<>.init(opaque:colorMode:rendersAsynchronously:renderer:)();
  long long v33 = *v2;
  swift_retain();
  sub_10004DB50();
  sub_100051234((uint64_t)&v33);
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  sub_100051234((uint64_t)&v33);
  static Alignment.center.getter();
  _FrameLayout.init(width:height:alignment:)();
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v14, v10, v7);
  uint64_t v18 = &v14[*(int *)(v12 + 44)];
  long long v19 = v31;
  *(_OWORD *)uint64_t v18 = v30;
  *((_OWORD *)v18 + 1) = v19;
  *((_OWORD *)v18 + 2) = v32;
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  if (qword_10006AE40 != -1) {
    swift_once();
  }
  uint64_t v20 = qword_10006C738;
  uint64_t v21 = (uint64_t (*)(uint64_t))swift_allocObject();
  long long v22 = v2[3];
  *((_OWORD *)v21 + 3) = v2[2];
  *((_OWORD *)v21 + 4) = v22;
  *((_OWORD *)v21 + 5) = v2[4];
  long long v23 = v2[1];
  *((_OWORD *)v21 + 1) = *v2;
  *((_OWORD *)v21 + 2) = v23;
  uint64_t v24 = v29;
  sub_1000512DC((uint64_t)v14, v29);
  uint64_t v25 = sub_100006380(&qword_10006CC28);
  *(void *)(v24 + *(int *)(v25 + 52)) = v20;
  uint64_t v26 = (uint64_t (**)(uint64_t))(v24 + *(int *)(v25 + 56));
  *uint64_t v26 = sub_1000512D4;
  v26[1] = v21;
  sub_1000511A8((uint64_t)v2);
  swift_retain();
  return sub_1000067B8((uint64_t)v14, &qword_10006CC20);
}

uint64_t sub_10004F2A0(CGContext *a1, long long *a2)
{
  CGContextRef v16 = a1;
  uint64_t v18 = type metadata accessor for CGPathFillRule();
  uint64_t v17 = *(void *)(v18 - 8);
  __chkstk_darwin(v18);
  double v15 = (char *)&v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v21 = *a2;
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  sub_100051234((uint64_t)&v21);
  Mutable = CGPathCreateMutable();
  long long v22 = a2[3];
  sub_100006380(&qword_10006CC38);
  State.wrappedValue.getter();
  uint64_t v5 = *(void *)(v19 + 16);
  swift_bridgeObjectRelease();
  if (v5)
  {
    unint64_t v6 = 0;
    uint64_t v7 = a2 + 3;
    long long v22 = 0x3FF0000000000000uLL;
    uint64_t v23 = 0;
    uint64_t v24 = 0x3FF0000000000000;
    uint64_t v25 = 0;
    uint64_t v26 = 0;
    while (1)
    {
      long long v19 = *v7;
      State.wrappedValue.getter();
      uint64_t result = v20;
      if (v6 >= *(void *)(v20 + 16)) {
        break;
      }
      swift_bridgeObjectRelease();
      swift_getKeyPath();
      swift_getKeyPath();
      swift_retain();
      static Published.subscript.getter();
      swift_release();
      swift_release();
      sub_100051234((uint64_t)&v21);
      swift_getKeyPath();
      swift_getKeyPath();
      swift_retain();
      static Published.subscript.getter();
      swift_release();
      swift_release();
      sub_100051234((uint64_t)&v21);
      CGMutablePathRef.addRoundedRect(in:cornerWidth:cornerHeight:transform:)();
      if (v5 == ++v6) {
        goto LABEL_5;
      }
    }
    __break(1u);
  }
  else
  {
LABEL_5:
    uint64_t v9 = v16;
    CGContextAddPath(v16, Mutable);
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    static Published.subscript.getter();
    swift_release();
    swift_release();
    sub_100051234((uint64_t)&v21);
    GenericGraCGFloat y = (CGColor *)Color.cgColor.getter();
    swift_release();
    if (!GenericGray) {
      GenericGraCGFloat y = CGColorCreateGenericGray(1.0, 1.0);
    }
    CGContextSetFillColorWithColor(v9, GenericGray);

    CGContextSetLineWidth(v9, 0.0);
    uint64_t v11 = v17;
    uint64_t v12 = v15;
    uint64_t v13 = v18;
    (*(void (**)(char *, void, uint64_t))(v17 + 104))(v15, enum case for CGPathFillRule.winding(_:), v18);
    CGContextRef.fillPath(using:)();

    return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v12, v13);
  }
  return result;
}

uint64_t sub_10004F69C(uint64_t a1, long long *a2)
{
  long long v5 = a2[4];
  long long v6 = v5;
  sub_100051344((uint64_t)&v6 + 8, (uint64_t)v7);
  sub_1000065F4((uint64_t)v7);
  sub_100006380(&qword_10006B6C8);
  uint64_t result = State.wrappedValue.getter();
  if (__OFADD__(*(void *)&v4, 1))
  {
    __break(1u);
    goto LABEL_9;
  }
  State.wrappedValue.setter();
  sub_100051234((uint64_t)&v6);
  long long v5 = v6;
  State.wrappedValue.getter();
  long long v5 = *a2;
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  uint64_t result = sub_100051234((uint64_t)&v5);
  if ((~*(void *)&v4 & 0x7FF0000000000000) == 0)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  if (v4 <= -9.22337204e18)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  if (v4 >= 9.22337204e18)
  {
LABEL_11:
    __break(1u);
    return result;
  }
  if (*(uint64_t *)&v4 >= (uint64_t)v4) {
    sub_10004EA3C();
  }
  sub_10004E80C();
  sub_100006380(&qword_10006CC38);
  return State.wrappedValue.setter();
}

uint64_t sub_10004F848@<X0>(uint64_t a1@<X8>)
{
  return sub_10004EED0(a1);
}

uint64_t AXLTAudioHistogramView.config.getter(uint64_t a1, uint64_t a2, char a3)
{
  return sub_10004F968(a1, a2, a3, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))&StateObject.wrappedValue.getter);
}

uint64_t type metadata accessor for AudioHistogramConfig()
{
  uint64_t result = qword_10006C830;
  if (!qword_10006C830) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t (*variable initialization expression of AXLTAudioHistogramView._config())()
{
  return sub_10004F914;
}

uint64_t sub_10004F914()
{
  type metadata accessor for AudioHistogramConfig();
  uint64_t v0 = swift_allocObject();
  sub_10004DFE0();
  return v0;
}

uint64_t AXLTAudioHistogramView.$config.getter(uint64_t a1, uint64_t a2, char a3)
{
  return sub_10004F968(a1, a2, a3, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))&StateObject.projectedValue.getter);
}

uint64_t sub_10004F968(uint64_t a1, uint64_t a2, char a3, uint64_t (*a4)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v6 = a3 & 1;
  uint64_t v7 = type metadata accessor for AudioHistogramConfig();
  uint64_t v8 = sub_100051508(&qword_10006C7E8, (void (*)(uint64_t))type metadata accessor for AudioHistogramConfig);

  return a4(a1, a2, v6, v7, v8);
}

__n128 AXLTAudioHistogramView.body.getter@<Q0>(uint64_t a1@<X8>)
{
  type metadata accessor for AudioHistogramConfig();
  sub_100051508(&qword_10006C7E8, (void (*)(uint64_t))type metadata accessor for AudioHistogramConfig);
  StateObject.wrappedValue.getter();
  sub_1000508DC((uint64_t *)v4);
  long long v2 = v4[3];
  *(_OWORD *)(a1 + 32) = v4[2];
  *(_OWORD *)(a1 + 48) = v2;
  *(_OWORD *)(a1 + 64) = v4[4];
  __n128 result = (__n128)v4[1];
  *(_OWORD *)a1 = v4[0];
  *(__n128 *)(a1 + 16) = result;
  return result;
}

__n128 sub_10004FACC@<Q0>(uint64_t a1@<X8>)
{
  type metadata accessor for AudioHistogramConfig();
  sub_100051508(&qword_10006C7E8, (void (*)(uint64_t))type metadata accessor for AudioHistogramConfig);
  StateObject.wrappedValue.getter();
  sub_1000508DC((uint64_t *)v4);
  long long v2 = v4[3];
  *(_OWORD *)(a1 + 32) = v4[2];
  *(_OWORD *)(a1 + 48) = v2;
  *(_OWORD *)(a1 + 64) = v4[4];
  __n128 result = (__n128)v4[1];
  *(_OWORD *)a1 = v4[0];
  *(__n128 *)(a1 + 16) = result;
  return result;
}

double AXLTAudioHistogramViewGenerator.height.getter()
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  swift_release();
  return v1;
}

uint64_t AXLTAudioHistogramViewGenerator.height.setter()
{
  return static Published.subscript.setter();
}

uint64_t (*AXLTAudioHistogramViewGenerator.height.modify(void *a1))(uint64_t *a1)
{
  uint64_t v3 = OBJC_IVAR____TtC19LiveTranscriptionUI31AXLTAudioHistogramViewGenerator_config;
  a1[2] = v1;
  a1[3] = v3;
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  swift_release();
  *a1 = a1[1];
  return sub_10004FE6C;
}

uint64_t sub_10004FE6C(uint64_t *a1)
{
  uint64_t v2 = *a1;
  swift_getKeyPath();
  swift_getKeyPath();
  a1[1] = v2;
  swift_retain();

  return static Published.subscript.setter();
}

uint64_t AXLTAudioHistogramViewGenerator.histogram.getter()
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  swift_release();
  return v1;
}

uint64_t AXLTAudioHistogramViewGenerator.histogram.setter()
{
  return static Published.subscript.setter();
}

uint64_t (*AXLTAudioHistogramViewGenerator.histogram.modify(void *a1))(uint64_t *a1, char a2)
{
  uint64_t v3 = OBJC_IVAR____TtC19LiveTranscriptionUI31AXLTAudioHistogramViewGenerator_config;
  a1[2] = v1;
  a1[3] = v3;
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  swift_release();
  *a1 = a1[1];
  return sub_100050210;
}

uint64_t sub_100050210(uint64_t *a1, char a2)
{
  uint64_t v4 = *a1;
  swift_getKeyPath();
  swift_getKeyPath();
  a1[1] = v4;
  if (a2)
  {
    swift_bridgeObjectRetain();
    swift_retain();
    static Published.subscript.setter();
    return swift_bridgeObjectRelease();
  }
  else
  {
    swift_retain();
    return static Published.subscript.setter();
  }
}

id AXLTAudioHistogramViewGenerator.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return [v1 init];
}

id AXLTAudioHistogramViewGenerator.init()()
{
  id v1 = v0;
  uint64_t v2 = OBJC_IVAR____TtC19LiveTranscriptionUI31AXLTAudioHistogramViewGenerator_config;
  type metadata accessor for AudioHistogramConfig();
  uint64_t v3 = swift_allocObject();
  uint64_t v4 = v1;
  sub_10004DFE0();
  *(void *)&v1[v2] = v3;
  swift_retain();
  sub_1000508DC((uint64_t *)v10);
  long long v5 = &v4[OBJC_IVAR____TtC19LiveTranscriptionUI31AXLTAudioHistogramViewGenerator_audioHistogramView];
  long long v6 = v10[3];
  *((_OWORD *)v5 + 2) = v10[2];
  *((_OWORD *)v5 + 3) = v6;
  *((_OWORD *)v5 + 4) = v10[4];
  long long v7 = v10[1];
  *(_OWORD *)long long v5 = v10[0];
  *((_OWORD *)v5 + 1) = v7;

  v9.receiver = v4;
  v9.super_class = (Class)type metadata accessor for AXLTAudioHistogramViewGenerator();
  return objc_msgSendSuper2(&v9, "init");
}

UIViewController __swiftcall AXLTAudioHistogramViewGenerator.viewController()()
{
  return (UIViewController)UIHostingController.init(rootView:)();
}

id AXLTAudioHistogramViewGenerator.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AXLTAudioHistogramViewGenerator();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_10005075C(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_10005077C(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_10005077C(char a1, int64_t a2, char a3, char *a4)
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
        goto LABEL_32;
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
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    sub_100006380((uint64_t *)&unk_10006C100);
    double v10 = (char *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 25;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 3);
  }
  else
  {
    double v10 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[8 * v8]) {
      memmove(v13, v14, 8 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[8 * v8] || v13 >= &v14[8 * v8])
  {
    memcpy(v13, v14, 8 * v8);
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_1000508DC@<X0>(uint64_t *a1@<X8>)
{
  sub_100006380(&qword_10006C7C8);
  State.init(wrappedValue:)();
  State.init(wrappedValue:)();
  State.init(wrappedValue:)();
  State.init(wrappedValue:)();
  type metadata accessor for AudioHistogramConfig();
  sub_100051508(&qword_10006C7E8, (void (*)(uint64_t))type metadata accessor for AudioHistogramConfig);
  uint64_t result = ObservedObject.init(wrappedValue:)();
  *a1 = result;
  a1[1] = v3;
  a1[2] = v4;
  a1[3] = v5;
  a1[4] = v4;
  a1[5] = v5;
  a1[6] = v4;
  a1[7] = v5;
  a1[8] = v4;
  a1[9] = v5;
  return result;
}

uint64_t type metadata accessor for AXLTAudioHistogramViewGenerator()
{
  return self;
}

uint64_t sub_100050A2C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100050A48()
{
  return type metadata accessor for AudioHistogramConfig();
}

void sub_100050A50()
{
  sub_100050BD4(319, &qword_10006C840);
  if (v0 <= 0x3F)
  {
    sub_100050BD4(319, (unint64_t *)&qword_10006C0F0);
    if (v1 <= 0x3F)
    {
      sub_100050BD4(319, &qword_10006C848);
      if (v2 <= 0x3F)
      {
        sub_100050C1C();
        if (v3 <= 0x3F) {
          swift_updateClassMetadata2();
        }
      }
    }
  }
}

void sub_100050BD4(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t v3 = type metadata accessor for Published();
    if (!v4) {
      atomic_store(v3, a2);
    }
  }
}

void sub_100050C1C()
{
  if (!qword_10006C850)
  {
    sub_10000646C(&qword_10006C7C8);
    unint64_t v0 = type metadata accessor for Published();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_10006C850);
    }
  }
}

uint64_t destroy for AXLTAudioHistogramView()
{
  return sub_10000F31C();
}

uint64_t _s19LiveTranscriptionUI22AXLTAudioHistogramViewVwCP_0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  char v5 = *((unsigned char *)a2 + 16);
  sub_10000F284();
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for AXLTAudioHistogramView(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  char v5 = *((unsigned char *)a2 + 16);
  sub_10000F284();
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  sub_10000F31C();
  return a1;
}

__n128 initializeWithTake for AXLTAudioHistogramView(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for AXLTAudioHistogramView(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = v3;
  sub_10000F31C();
  return a1;
}

uint64_t getEnumTagSinglePayload for AXLTAudioHistogramView(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && *(unsigned char *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 1) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for AXLTAudioHistogramView(uint64_t result, unsigned int a2, unsigned int a3)
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
      *(unsigned char *)(result + 16) = -(char)a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AXLTAudioHistogramView()
{
  return &type metadata for AXLTAudioHistogramView;
}

unint64_t sub_100050E2C()
{
  unint64_t result = qword_10006CC10;
  if (!qword_10006CC10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006CC10);
  }
  return result;
}

uint64_t destroy for AudioHistogramCanvasView()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();

  return swift_release();
}

void *initializeWithCopy for AudioHistogramCanvasView(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  uint64_t v5 = a2[5];
  a1[4] = a2[4];
  a1[5] = v5;
  uint64_t v6 = a2[7];
  a1[6] = a2[6];
  a1[7] = v6;
  uint64_t v7 = a2[9];
  a1[8] = a2[8];
  a1[9] = v7;
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  return a1;
}

void *assignWithCopy for AudioHistogramCanvasView(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[3] = a2[3];
  swift_retain();
  swift_release();
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[5] = a2[5];
  swift_retain();
  swift_release();
  a1[6] = a2[6];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[7] = a2[7];
  swift_retain();
  swift_release();
  a1[8] = a2[8];
  a1[9] = a2[9];
  swift_retain();
  swift_release();
  return a1;
}

uint64_t assignWithTake for AudioHistogramCanvasView(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_release();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  swift_release();
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_bridgeObjectRelease();
  swift_release();
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_release();
  uint64_t v4 = *(void *)(a2 + 72);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = v4;
  swift_release();
  return a1;
}

ValueMetadata *type metadata accessor for AudioHistogramCanvasView()
{
  return &type metadata for AudioHistogramCanvasView;
}

uint64_t sub_100051134()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100051154()
{
  return GraphicsContext.withCGContext(content:)();
}

uint64_t sub_1000511A8(uint64_t a1)
{
  return a1;
}

uint64_t sub_100051234(uint64_t a1)
{
  return a1;
}

uint64_t sub_100051264()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 96, 7);
}

uint64_t sub_1000512D4(uint64_t a1)
{
  return sub_10004F69C(a1, (long long *)(v1 + 16));
}

uint64_t sub_1000512DC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100006380(&qword_10006CC20);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100051344(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100006380(&qword_10006CC30);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000513AC(uint64_t a1)
{
  return sub_10004ED10(a1, *(long long **)(v1 + 16));
}

double *sub_1000513B4(uint64_t a1, double (*a2)(uint64_t, double))
{
  sub_10005075C(0, 0, 0);
  uint64_t v4 = *(void *)(a1 + 16);
  swift_bridgeObjectRetain();
  if (v4)
  {
    uint64_t v5 = 0;
    uint64_t v6 = a1 + 32;
    do
    {
      double v7 = a2(v5, *(double *)(v6 + 8 * v5));
      unint64_t v9 = *(void *)&_swiftEmptyArrayStorage[2];
      unint64_t v8 = *(void *)&_swiftEmptyArrayStorage[3];
      if (v9 >= v8 >> 1) {
        sub_10005075C(v8 > 1, v9 + 1, 1);
      }
      ++v5;
      *(void *)&_swiftEmptyArrayStorage[2] = v9 + 1;
      _swiftEmptyArrayStorage[v9 + 4] = v7;
    }
    while (v4 != v5);
  }
  swift_bridgeObjectRelease();
  return _swiftEmptyArrayStorage;
}

unint64_t sub_1000514C8()
{
  unint64_t result = qword_10006CC40;
  if (!qword_10006CC40)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10006CC40);
  }
  return result;
}

uint64_t sub_100051508(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100051550(CGContext *a1)
{
  return sub_10004F2A0(a1, *(long long **)(v1 + 32));
}

unint64_t sub_100051574()
{
  unint64_t result = qword_10006CC50;
  if (!qword_10006CC50)
  {
    sub_10000646C(&qword_10006CC28);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006CC50);
  }
  return result;
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

void sub_1000515FC()
{
  dlerror();
  uint64_t v0 = abort_report_np();
  sub_100051620(v0);
}

void sub_100051620()
{
  uint64_t v0 = abort_report_np();
  sub_100051648(v0);
}

void sub_100051648()
{
}

uint64_t static Notification._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Notification._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t Notification.userInfo.getter()
{
  return Notification.userInfo.getter();
}

uint64_t type metadata accessor for Notification()
{
  return type metadata accessor for Notification();
}

uint64_t AttributeScopes.SwiftUIAttributes.underlineStyle.getter()
{
  return AttributeScopes.SwiftUIAttributes.underlineStyle.getter();
}

uint64_t AttributedString.subscript.setter()
{
  return AttributedString.subscript.setter();
}

uint64_t AttributedString.init(stringLiteral:)()
{
  return AttributedString.init(stringLiteral:)();
}

uint64_t AttributedString.append<A>(_:)()
{
  return AttributedString.append<A>(_:)();
}

uint64_t type metadata accessor for AttributedString()
{
  return type metadata accessor for AttributedString();
}

uint64_t AttributedString.init(_:attributes:)()
{
  return AttributedString.init(_:attributes:)();
}

uint64_t AttributeContainer.init()()
{
  return AttributeContainer.init()();
}

uint64_t type metadata accessor for AttributeContainer()
{
  return type metadata accessor for AttributeContainer();
}

uint64_t AttributeDynamicLookup.subscript.getter()
{
  return AttributeDynamicLookup.subscript.getter();
}

uint64_t _convertNSErrorToError(_:)()
{
  return _convertNSErrorToError(_:)();
}

void __swiftcall URL._bridgeToObjectiveC()(NSURL *__return_ptr retstr)
{
}

uint64_t type metadata accessor for URL()
{
  return type metadata accessor for URL();
}

uint64_t Data.init(referencing:)()
{
  return Data.init(referencing:)();
}

NSDate __swiftcall Date._bridgeToObjectiveC()()
{
  return (NSDate)Date._bridgeToObjectiveC()();
}

uint64_t static Date._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Date._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t type metadata accessor for Date()
{
  return type metadata accessor for Date();
}

uint64_t static UUID._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static UUID._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t type metadata accessor for UUID()
{
  return type metadata accessor for UUID();
}

uint64_t type metadata accessor for CGPathFillRule()
{
  return type metadata accessor for CGPathFillRule();
}

uint64_t AXLTCaption.actionType.getter()
{
  return AXLTCaption.actionType.getter();
}

uint64_t AXLTCaption.actionType.setter()
{
  return AXLTCaption.actionType.setter();
}

uint64_t AXLTCaption.placeholder.getter()
{
  return AXLTCaption.placeholder.getter();
}

uint64_t AXLTCaption.placeholder.setter()
{
  return AXLTCaption.placeholder.setter();
}

uint64_t AXLTCaption.init(id:appID:appName:time:text:segments:placeholder:actionType:)()
{
  return AXLTCaption.init(id:appID:appName:time:text:segments:placeholder:actionType:)();
}

uint64_t AXLTCaption.id.getter()
{
  return AXLTCaption.id.getter();
}

uint64_t AXLTCaption.text.getter()
{
  return AXLTCaption.text.getter();
}

uint64_t AXLTCaption.text.setter()
{
  return AXLTCaption.text.setter();
}

uint64_t AXLTCaption.time.getter()
{
  return AXLTCaption.time.getter();
}

uint64_t AXLTCaption.appID.getter()
{
  return AXLTCaption.appID.getter();
}

uint64_t AXLTCaption.appName.getter()
{
  return AXLTCaption.appName.getter();
}

uint64_t AXLTCaption.segments.getter()
{
  return AXLTCaption.segments.getter();
}

uint64_t AXLTCaption.segments.setter()
{
  return AXLTCaption.segments.setter();
}

uint64_t type metadata accessor for AXLTCaption()
{
  return type metadata accessor for AXLTCaption();
}

uint64_t static AXLTUtilities.AXLTLocString(_:)()
{
  return static AXLTUtilities.AXLTLocString(_:)();
}

uint64_t mergeCaptions(_:_:)()
{
  return mergeCaptions(_:_:)();
}

uint64_t placeholderID.getter()
{
  return placeholderID.getter();
}

uint64_t placeholderName.getter()
{
  return placeholderName.getter();
}

uint64_t placeholderText.getter()
{
  return placeholderText.getter();
}

uint64_t placeholderMicName.getter()
{
  return placeholderMicName.getter();
}

uint64_t textLinesNumberMax.getter()
{
  return textLinesNumberMax.getter();
}

uint64_t textLinesNumberMin.getter()
{
  return textLinesNumberMin.getter();
}

uint64_t captionTextTimeLimit.getter()
{
  return captionTextTimeLimit.getter();
}

uint64_t notificationValueKey.getter()
{
  return notificationValueKey.getter();
}

uint64_t placeholderPausedText.getter()
{
  return placeholderPausedText.getter();
}

uint64_t type metadata accessor for AXLTCaptionActionsType()
{
  return type metadata accessor for AXLTCaptionActionsType();
}

uint64_t historyTimeIntervalMax.getter()
{
  return historyTimeIntervalMax.getter();
}

uint64_t micCaptionTextTimeLimit.getter()
{
  return micCaptionTextTimeLimit.getter();
}

uint64_t placeholderTimeInterval.getter()
{
  return placeholderTimeInterval.getter();
}

uint64_t historyCheckTimeInterval.getter()
{
  return historyCheckTimeInterval.getter();
}

uint64_t textOnScreenTimeInterval.getter()
{
  return textOnScreenTimeInterval.getter();
}

uint64_t historyTimeIntervalMaxBraille.getter()
{
  return historyTimeIntervalMaxBraille.getter();
}

uint64_t textLinesAccessibilityNumberMax.getter()
{
  return textLinesAccessibilityNumberMax.getter();
}

uint64_t os_log(_:dso:log:_:_:)()
{
  return os_log(_:dso:log:_:_:)();
}

uint64_t ObservableObject<>.objectWillChange.getter()
{
  return ObservableObject<>.objectWillChange.getter();
}

uint64_t ConnectablePublisher.autoconnect()()
{
  return ConnectablePublisher.autoconnect()();
}

uint64_t Published.init(initialValue:)()
{
  return Published.init(initialValue:)();
}

uint64_t Published.projectedValue.getter()
{
  return Published.projectedValue.getter();
}

uint64_t Published.projectedValue.setter()
{
  return Published.projectedValue.setter();
}

uint64_t static Published.subscript.modify()
{
  return static Published.subscript.modify();
}

uint64_t static Published.subscript.getter()
{
  return static Published.subscript.getter();
}

uint64_t static Published.subscript.setter()
{
  return static Published.subscript.setter();
}

uint64_t type metadata accessor for Published()
{
  return type metadata accessor for Published();
}

uint64_t Publisher.receive<A>(on:options:)()
{
  return Publisher.receive<A>(on:options:)();
}

uint64_t Publisher<>.sink(receiveValue:)()
{
  return Publisher<>.sink(receiveValue:)();
}

uint64_t EdgeInsets.init(_all:)()
{
  return EdgeInsets.init(_all:)();
}

uint64_t ScrollView.init(_:showsIndicators:content:)()
{
  return ScrollView.init(_:showsIndicators:content:)();
}

uint64_t DragGesture.init<A>(minimumDistance:coordinateSpace:)()
{
  return DragGesture.init<A>(minimumDistance:coordinateSpace:)();
}

uint64_t DragGesture.Value.translation.getter()
{
  return DragGesture.Value.translation.getter();
}

uint64_t DragGesture.Value.predictedEndTranslation.getter()
{
  return DragGesture.Value.predictedEndTranslation.getter();
}

uint64_t type metadata accessor for DragGesture.Value()
{
  return type metadata accessor for DragGesture.Value();
}

uint64_t type metadata accessor for DragGesture()
{
  return type metadata accessor for DragGesture();
}

uint64_t type metadata accessor for Environment.Content()
{
  return type metadata accessor for Environment.Content();
}

uint64_t static GestureMask.all.getter()
{
  return static GestureMask.all.getter();
}

uint64_t StateObject.wrappedValue.getter()
{
  return StateObject.wrappedValue.getter();
}

uint64_t _FrameLayout.init(width:height:alignment:)()
{
  return _FrameLayout.init(width:height:alignment:)();
}

uint64_t GeometryProxy.safeAreaInsets.getter()
{
  return GeometryProxy.safeAreaInsets.getter();
}

uint64_t GeometryProxy.size.getter()
{
  return GeometryProxy.size.getter();
}

uint64_t GeometryProxy.frame<A>(in:)()
{
  return GeometryProxy.frame<A>(in:)();
}

uint64_t type metadata accessor for GeometryProxy()
{
  return type metadata accessor for GeometryProxy();
}

uint64_t static PreferenceKey._isReadableByHost.getter()
{
  return static PreferenceKey._isReadableByHost.getter();
}

uint64_t static PreferenceKey._includesRemovedValues.getter()
{
  return static PreferenceKey._includesRemovedValues.getter();
}

uint64_t withAnimation<A>(_:_:)()
{
  return withAnimation<A>(_:_:)();
}

uint64_t LinearGradient.init(gradient:startPoint:endPoint:)()
{
  return LinearGradient.init(gradient:startPoint:endPoint:)();
}

uint64_t ObservedObject.init(wrappedValue:)()
{
  return ObservedObject.init(wrappedValue:)();
}

uint64_t type metadata accessor for DynamicTypeSize()
{
  return type metadata accessor for DynamicTypeSize();
}

uint64_t GraphicsContext.withCGContext(content:)()
{
  return GraphicsContext.withCGContext(content:)();
}

uint64_t static LayoutDirection.== infix(_:_:)()
{
  return static LayoutDirection.== infix(_:_:)();
}

uint64_t type metadata accessor for LayoutDirection()
{
  return type metadata accessor for LayoutDirection();
}

uint64_t ModifiedContent<>.accessibility(identifier:)()
{
  return ModifiedContent<>.accessibility(identifier:)();
}

uint64_t ModifiedContent<>.accessibility(hint:)()
{
  return ModifiedContent<>.accessibility(hint:)();
}

uint64_t ModifiedContent<>.accessibility(hidden:)()
{
  return ModifiedContent<>.accessibility(hidden:)();
}

uint64_t ModifiedContent<>.accessibilityAddTraits(_:)()
{
  return ModifiedContent<>.accessibilityAddTraits(_:)();
}

uint64_t ModifiedContent<>.accessibilityCustomAttribute(_:value:)()
{
  return ModifiedContent<>.accessibilityCustomAttribute(_:value:)();
}

uint64_t static SafeAreaRegions.all.getter()
{
  return static SafeAreaRegions.all.getter();
}

uint64_t ScrollViewProxy.setContentOffset(_:)()
{
  return ScrollViewProxy.setContentOffset(_:)();
}

uint64_t type metadata accessor for ScrollViewProxy()
{
  return type metadata accessor for ScrollViewProxy();
}

uint64_t PlainButtonStyle.init()()
{
  return PlainButtonStyle.init()();
}

uint64_t type metadata accessor for PlainButtonStyle()
{
  return type metadata accessor for PlainButtonStyle();
}

uint64_t RoundedRectangle.path(in:)()
{
  return RoundedRectangle.path(in:)();
}

uint64_t type metadata accessor for RoundedRectangle()
{
  return type metadata accessor for RoundedRectangle();
}

uint64_t _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)()
{
  return _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)();
}

uint64_t EnvironmentValues.dynamicTypeSize.getter()
{
  return EnvironmentValues.dynamicTypeSize.getter();
}

uint64_t EnvironmentValues.dynamicTypeSize.setter()
{
  return EnvironmentValues.dynamicTypeSize.setter();
}

uint64_t EnvironmentValues.foregroundColor.getter()
{
  return EnvironmentValues.foregroundColor.getter();
}

uint64_t EnvironmentValues.foregroundColor.setter()
{
  return EnvironmentValues.foregroundColor.setter();
}

uint64_t EnvironmentValues.layoutDirection.getter()
{
  return EnvironmentValues.layoutDirection.getter();
}

uint64_t EnvironmentValues.layoutDirection.setter()
{
  return EnvironmentValues.layoutDirection.setter();
}

uint64_t EnvironmentValues.verticalSizeClass.getter()
{
  return EnvironmentValues.verticalSizeClass.getter();
}

uint64_t EnvironmentValues.horizontalSizeClass.getter()
{
  return EnvironmentValues.horizontalSizeClass.getter();
}

uint64_t EnvironmentValues.font.getter()
{
  return EnvironmentValues.font.getter();
}

uint64_t EnvironmentValues.font.setter()
{
  return EnvironmentValues.font.setter();
}

uint64_t EnvironmentValues.lineLimit.getter()
{
  return EnvironmentValues.lineLimit.getter();
}

uint64_t EnvironmentValues.lineLimit.setter()
{
  return EnvironmentValues.lineLimit.setter();
}

uint64_t EnvironmentValues.init()()
{
  return EnvironmentValues.init()();
}

uint64_t type metadata accessor for EnvironmentValues()
{
  return type metadata accessor for EnvironmentValues();
}

uint64_t static VerticalAlignment.top.getter()
{
  return static VerticalAlignment.top.getter();
}

uint64_t static VerticalAlignment.bottom.getter()
{
  return static VerticalAlignment.bottom.getter();
}

uint64_t static VerticalAlignment.center.getter()
{
  return static VerticalAlignment.center.getter();
}

uint64_t type metadata accessor for ColorRenderingMode()
{
  return type metadata accessor for ColorRenderingMode();
}

uint64_t type metadata accessor for RoundedCornerStyle()
{
  return type metadata accessor for RoundedCornerStyle();
}

uint64_t static AccessibilityTraits.isSelected.getter()
{
  return static AccessibilityTraits.isSelected.getter();
}

uint64_t static AccessibilityTraits.isStaticText.getter()
{
  return static AccessibilityTraits.isStaticText.getter();
}

uint64_t static AccessibilityTraits.updatesFrequently.getter()
{
  return static AccessibilityTraits.updatesFrequently.getter();
}

uint64_t static AccessibilityTraits.isImage.getter()
{
  return static AccessibilityTraits.isImage.getter();
}

uint64_t type metadata accessor for AccessibilityTraits()
{
  return type metadata accessor for AccessibilityTraits();
}

uint64_t static HorizontalAlignment.center.getter()
{
  return static HorizontalAlignment.center.getter();
}

uint64_t static HorizontalAlignment.leading.getter()
{
  return static HorizontalAlignment.leading.getter();
}

uint64_t static SymbolRenderingMode.hierarchical.getter()
{
  return static SymbolRenderingMode.hierarchical.getter();
}

uint64_t type metadata accessor for SymbolRenderingMode()
{
  return type metadata accessor for SymbolRenderingMode();
}

uint64_t UIHostingController.init(rootView:)()
{
  return UIHostingController.init(rootView:)();
}

uint64_t _ConditionalContent<>.init(storage:)()
{
  return _ConditionalContent<>.init(storage:)();
}

uint64_t type metadata accessor for LocalCoordinateSpace()
{
  return type metadata accessor for LocalCoordinateSpace();
}

uint64_t type metadata accessor for NamedCoordinateSpace()
{
  return type metadata accessor for NamedCoordinateSpace();
}

uint64_t type metadata accessor for GlobalCoordinateSpace()
{
  return type metadata accessor for GlobalCoordinateSpace();
}

uint64_t type metadata accessor for UserInterfaceSizeClass()
{
  return type metadata accessor for UserInterfaceSizeClass();
}

uint64_t AccessibilityFocusState.wrappedValue.getter()
{
  return AccessibilityFocusState.wrappedValue.getter();
}

uint64_t AccessibilityFocusState.wrappedValue.setter()
{
  return AccessibilityFocusState.wrappedValue.setter();
}

uint64_t AccessibilityFocusState.projectedValue.getter()
{
  return AccessibilityFocusState.projectedValue.getter();
}

uint64_t AccessibilityFocusState.init<>()()
{
  return AccessibilityFocusState.init<>()();
}

uint64_t type metadata accessor for AccessibilityFocusState()
{
  return type metadata accessor for AccessibilityFocusState();
}

uint64_t static CoordinateSpaceProtocol<>.local.getter()
{
  return static CoordinateSpaceProtocol<>.local.getter();
}

uint64_t static CoordinateSpaceProtocol<>.named<A>(_:)()
{
  return static CoordinateSpaceProtocol<>.named<A>(_:)();
}

uint64_t static CoordinateSpaceProtocol<>.global.getter()
{
  return static CoordinateSpaceProtocol<>.global.getter();
}

uint64_t _makeUIHostingController(_:tracksContentSize:secure:)()
{
  return _makeUIHostingController(_:tracksContentSize:secure:)();
}

uint64_t type metadata accessor for AccessibilityTechnologies()
{
  return type metadata accessor for AccessibilityTechnologies();
}

uint64_t static Log.runtimeIssuesLog.getter()
{
  return static Log.runtimeIssuesLog.getter();
}

uint64_t static Axis.Set.vertical.getter()
{
  return static Axis.Set.vertical.getter();
}

uint64_t static Edge.Set.all.getter()
{
  return static Edge.Set.all.getter();
}

uint64_t static Edge.Set.top.getter()
{
  return static Edge.Set.top.getter();
}

uint64_t static Edge.Set.bottom.getter()
{
  return static Edge.Set.bottom.getter();
}

uint64_t static Edge.Set.leading.getter()
{
  return static Edge.Set.leading.getter();
}

uint64_t static Edge.Set.trailing.getter()
{
  return static Edge.Set.trailing.getter();
}

uint64_t type metadata accessor for Font.Design()
{
  return type metadata accessor for Font.Design();
}

uint64_t static Font.system(_:design:weight:)()
{
  return static Font.system(_:design:weight:)();
}

uint64_t type metadata accessor for Font.TextStyle()
{
  return type metadata accessor for Font.TextStyle();
}

uint64_t Path.addPath(_:transform:)()
{
  return Path.addPath(_:transform:)();
}

uint64_t Text.foregroundColor(_:)()
{
  return Text.foregroundColor(_:)();
}

uint64_t static Text.+ infix(_:_:)()
{
  return static Text.+ infix(_:_:)();
}

uint64_t Text.font(_:)()
{
  return Text.font(_:)();
}

uint64_t static Text.LineStyle.Pattern.dot.getter()
{
  return static Text.LineStyle.Pattern.dot.getter();
}

uint64_t type metadata accessor for Text.LineStyle.Pattern()
{
  return type metadata accessor for Text.LineStyle.Pattern();
}

uint64_t Text.LineStyle.init(pattern:color:)()
{
  return Text.LineStyle.init(pattern:color:)();
}

uint64_t type metadata accessor for Text.LineStyle()
{
  return type metadata accessor for Text.LineStyle();
}

uint64_t Text.init(_:)()
{
  return Text.init(_:)();
}

uint64_t Text.init<A>(_:)()
{
  return Text.init<A>(_:)();
}

uint64_t static View._makeView(view:inputs:)()
{
  return static View._makeView(view:inputs:)();
}

uint64_t static View._makeViewList(view:inputs:)()
{
  return static View._makeViewList(view:inputs:)();
}

uint64_t View.buttonStyle<A>(_:)()
{
  return View.buttonStyle<A>(_:)();
}

uint64_t View.onTapGesture(count:perform:)()
{
  return View.onTapGesture(count:perform:)();
}

uint64_t View.accessibility(identifier:)()
{
  return View.accessibility(identifier:)();
}

uint64_t View.accessibility(removeTraits:)()
{
  return View.accessibility(removeTraits:)();
}

uint64_t View.accessibility(label:)()
{
  return View.accessibility(label:)();
}

uint64_t static View._viewListCount(inputs:)()
{
  return static View._viewListCount(inputs:)();
}

uint64_t View.dynamicTypeSize<A>(_:)()
{
  return View.dynamicTypeSize<A>(_:)();
}

uint64_t View.simultaneousGesture<A>(_:including:)()
{
  return View.simultaneousGesture<A>(_:including:)();
}

uint64_t View.accessibilityFocused(_:)()
{
  return View.accessibilityFocused(_:)();
}

uint64_t View.gesture<A>(_:including:)()
{
  return View.gesture<A>(_:including:)();
}

uint64_t View.onChange<A>(of:initial:_:)()
{
  return View.onChange<A>(of:initial:_:)();
}

{
  return View.onChange<A>(of:initial:_:)();
}

uint64_t Color.cgColor.getter()
{
  return Color.cgColor.getter();
}

uint64_t type metadata accessor for Color.RGBColorSpace()
{
  return type metadata accessor for Color.RGBColorSpace();
}

uint64_t static Color.== infix(_:_:)()
{
  return static Color.== infix(_:_:)();
}

uint64_t static Color.blue.getter()
{
  return static Color.blue.getter();
}

uint64_t static Color.gray.getter()
{
  return static Color.gray.getter();
}

uint64_t static Color.black.getter()
{
  return static Color.black.getter();
}

uint64_t static Color.clear.getter()
{
  return static Color.clear.getter();
}

uint64_t static Color.white.getter()
{
  return static Color.white.getter();
}

uint64_t Color.opacity(_:)()
{
  return Color.opacity(_:)();
}

uint64_t Color.init(_:white:opacity:)()
{
  return Color.init(_:white:opacity:)();
}

uint64_t Color.init(_:)()
{
  return Color.init(_:)();
}

uint64_t Image.init(uiImage:)()
{
  return Image.init(uiImage:)();
}

uint64_t Image.init(systemName:)()
{
  return Image.init(systemName:)();
}

uint64_t type metadata accessor for Image.ResizingMode()
{
  return type metadata accessor for Image.ResizingMode();
}

uint64_t Image.init(_internalSystemName:)()
{
  return Image.init(_internalSystemName:)();
}

uint64_t Image.symbolRenderingMode(_:)()
{
  return Image.symbolRenderingMode(_:)();
}

uint64_t Image.resizable(capInsets:resizingMode:)()
{
  return Image.resizable(capInsets:resizingMode:)();
}

uint64_t State.init(wrappedValue:)()
{
  return State.init(wrappedValue:)();
}

uint64_t State.wrappedValue.getter()
{
  return State.wrappedValue.getter();
}

uint64_t State.wrappedValue.setter()
{
  return State.wrappedValue.setter();
}

uint64_t State.projectedValue.getter()
{
  return State.projectedValue.getter();
}

uint64_t Button.init(action:label:)()
{
  return Button.init(action:label:)();
}

uint64_t Canvas<>.init(opaque:colorMode:rendersAsynchronously:renderer:)()
{
  return Canvas<>.init(opaque:colorMode:rendersAsynchronously:renderer:)();
}

uint64_t AnyView.init<A>(_:)()
{
  return AnyView.init<A>(_:)();
}

uint64_t Binding.wrappedValue.getter()
{
  return Binding.wrappedValue.getter();
}

uint64_t Binding.wrappedValue.setter()
{
  return Binding.wrappedValue.setter();
}

uint64_t Binding.projectedValue.getter()
{
  return Binding.projectedValue.getter();
}

uint64_t ForEach<>.init(_:id:content:)()
{
  return ForEach<>.init(_:id:content:)();
}

uint64_t Gesture.onEnded(_:)()
{
  return Gesture.onEnded(_:)();
}

uint64_t Gesture<>.onChanged(_:)()
{
  return Gesture<>.onChanged(_:)();
}

uint64_t Gradient.init(colors:)()
{
  return Gradient.init(colors:)();
}

uint64_t static Material.regular.getter()
{
  return static Material.regular.getter();
}

uint64_t type metadata accessor for Material()
{
  return type metadata accessor for Material();
}

uint64_t static Alignment.topLeading.getter()
{
  return static Alignment.topLeading.getter();
}

uint64_t static Alignment.bottomLeading.getter()
{
  return static Alignment.bottomLeading.getter();
}

uint64_t static Alignment.center.getter()
{
  return static Alignment.center.getter();
}

uint64_t static Alignment.leading.getter()
{
  return static Alignment.leading.getter();
}

uint64_t Animation.repeatCount(_:autoreverses:)()
{
  return Animation.repeatCount(_:autoreverses:)();
}

uint64_t Animation.delay(_:)()
{
  return Animation.delay(_:)();
}

uint64_t static Animation.linear(duration:)()
{
  return static Animation.linear(duration:)();
}

uint64_t static Animation.default.getter()
{
  return static Animation.default.getter();
}

uint64_t Rectangle.path(in:)()
{
  return Rectangle.path(in:)();
}

uint64_t static UnitPoint.top.getter()
{
  return static UnitPoint.top.getter();
}

uint64_t type metadata accessor for DispatchWorkItemFlags()
{
  return type metadata accessor for DispatchWorkItemFlags();
}

uint64_t static DispatchQoS.unspecified.getter()
{
  return static DispatchQoS.unspecified.getter();
}

uint64_t type metadata accessor for DispatchQoS()
{
  return type metadata accessor for DispatchQoS();
}

NSDictionary __swiftcall Dictionary._bridgeToObjectiveC()()
{
  return (NSDictionary)Dictionary._bridgeToObjectiveC()();
}

uint64_t static Dictionary._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t dispatch thunk of Hashable.hashValue.getter()
{
  return dispatch thunk of Hashable.hashValue.getter();
}

uint64_t dispatch thunk of static Comparable.< infix(_:_:)()
{
  return dispatch thunk of static Comparable.< infix(_:_:)();
}

uint64_t dispatch thunk of static Comparable.<= infix(_:_:)()
{
  return dispatch thunk of static Comparable.<= infix(_:_:)();
}

uint64_t dispatch thunk of static Equatable.== infix(_:_:)()
{
  return dispatch thunk of static Equatable.== infix(_:_:)();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)String._bridgeToObjectiveC()();
}

uint64_t static String._forceBridgeFromObjectiveC(_:result:)()
{
  return static String._forceBridgeFromObjectiveC(_:result:)();
}

uint64_t static String._conditionallyBridgeFromObjectiveC(_:result:)()
{
  return static String._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t String.init(format:_:)()
{
  return String.init(format:_:)();
}

uint64_t String.init<A>(describing:)()
{
  return String.init<A>(describing:)();
}

uint64_t String.hash(into:)()
{
  return String.hash(into:)();
}

uint64_t String.count.getter()
{
  return String.count.getter();
}

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return String.UTF8View._foreignCount()();
}

uint64_t dispatch thunk of RawRepresentable.rawValue.getter()
{
  return dispatch thunk of RawRepresentable.rawValue.getter();
}

NSArray __swiftcall Array._bridgeToObjectiveC()()
{
  return (NSArray)Array._bridgeToObjectiveC()();
}

uint64_t static Array._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t specialized Array._endMutation()()
{
  return specialized Array._endMutation()();
}

uint64_t static Array._allocateBufferUninitialized(minimumCapacity:)()
{
  return static Array._allocateBufferUninitialized(minimumCapacity:)();
}

uint64_t Double.description.getter()
{
  return Double.description.getter();
}

uint64_t static Set._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Set._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t CGContextRef.fillPath(using:)()
{
  return CGContextRef.fillPath(using:)();
}

uint64_t static os_log_type_t.debug.getter()
{
  return static os_log_type_t.debug.getter();
}

uint64_t static os_log_type_t.error.getter()
{
  return static os_log_type_t.error.getter();
}

uint64_t static os_log_type_t.fault.getter()
{
  return static os_log_type_t.fault.getter();
}

uint64_t static os_log_type_t.default.getter()
{
  return static os_log_type_t.default.getter();
}

uint64_t CGMutablePathRef.addRoundedRect(in:cornerWidth:cornerHeight:transform:)()
{
  return CGMutablePathRef.addRoundedRect(in:cornerWidth:cornerHeight:transform:)();
}

uint64_t static NSKeyedUnarchiver.unarchivedObject<A>(ofClass:from:)()
{
  return static NSKeyedUnarchiver.unarchivedObject<A>(ofClass:from:)();
}

uint64_t static OS_dispatch_queue.main.getter()
{
  return static OS_dispatch_queue.main.getter();
}

uint64_t OS_dispatch_queue.async(group:qos:flags:execute:)()
{
  return OS_dispatch_queue.async(group:qos:flags:execute:)();
}

uint64_t type metadata accessor for NSNotificationCenter.Publisher()
{
  return type metadata accessor for NSNotificationCenter.Publisher();
}

uint64_t NSNotificationCenter.publisher(for:object:)()
{
  return NSNotificationCenter.publisher(for:object:)();
}

uint64_t type metadata accessor for NSTimer.TimerPublisher()
{
  return type metadata accessor for NSTimer.TimerPublisher();
}

uint64_t static NSTimer.publish(every:tolerance:on:in:options:)()
{
  return static NSTimer.publish(every:tolerance:on:in:options:)();
}

uint64_t UIColor.init(_:)()
{
  return UIColor.init(_:)();
}

NSNumber __swiftcall NSNumber.init(BOOLeanLiteral:)(Swift::Bool BOOLeanLiteral)
{
  return (NSNumber)NSNumber.init(BOOLeanLiteral:)(BOOLeanLiteral);
}

Swift::Int __swiftcall NSObject._rawHashValue(seed:)(Swift::Int seed)
{
  return NSObject._rawHashValue(seed:)(seed);
}

uint64_t static NSObject.== infix(_:_:)()
{
  return static NSObject.== infix(_:_:)();
}

uint64_t type metadata accessor for NSRunLoop.SchedulerOptions()
{
  return type metadata accessor for NSRunLoop.SchedulerOptions();
}

uint64_t OS_os_log.init(subsystem:category:)()
{
  return OS_os_log.init(subsystem:category:)();
}

uint64_t type metadata accessor for Optional()
{
  return type metadata accessor for Optional();
}

uint64_t UnsafeMutableRawBufferPointer.copyMemory(from:)()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t UnsafeMutableRawBufferPointer.subscript.setter()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t dispatch thunk of SetAlgebra.init<A>(_:)()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

uint64_t __CocoaSet.startIndex.getter()
{
  return __CocoaSet.startIndex.getter();
}

uint64_t static __CocoaSet.Index.== infix(_:_:)()
{
  return static __CocoaSet.Index.== infix(_:_:)();
}

uint64_t __CocoaSet.Index.age.getter()
{
  return __CocoaSet.Index.age.getter();
}

uint64_t __CocoaSet.Index.element.getter()
{
  return __CocoaSet.Index.element.getter();
}

uint64_t __CocoaSet.element(at:)()
{
  return __CocoaSet.element(at:)();
}

uint64_t __CocoaSet.endIndex.getter()
{
  return __CocoaSet.endIndex.getter();
}

Swift::Int __swiftcall AnyHashable._rawHashValue(seed:)(Swift::Int seed)
{
  return AnyHashable._rawHashValue(seed:)(seed);
}

uint64_t static AnyHashable.== infix(_:_:)()
{
  return static AnyHashable.== infix(_:_:)();
}

uint64_t AnyHashable.init<A>(_:)()
{
  return AnyHashable.init<A>(_:)();
}

uint64_t static CommandLine.unsafeArgv.getter()
{
  return static CommandLine.unsafeArgv.getter();
}

uint64_t static CommandLine.argc.getter()
{
  return static CommandLine.argc.getter();
}

uint64_t _StringGuts.copyUTF8(into:)()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t specialized _ArrayBuffer._getElementSlowPath(_:)()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t _StringObject.sharedUTF8.getter()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t _CocoaArrayWrapper.endIndex.getter()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t static _DictionaryStorage.allocate(capacity:)()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t _fatalErrorMessage(_:_:file:line:flags:)()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t dispatch thunk of CustomStringConvertible.description.getter()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t Hasher.init(_seed:)()
{
  return Hasher.init(_seed:)();
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt a1)
{
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return Hasher._finalize()();
}

uint64_t AXDeviceHasJindo()
{
  return _AXDeviceHasJindo();
}

uint64_t AXDeviceIsPad()
{
  return _AXDeviceIsPad();
}

uint64_t AXDeviceIsPadMiniIdiom()
{
  return _AXDeviceIsPadMiniIdiom();
}

uint64_t AXLogLiveTranscription()
{
  return _AXLogLiveTranscription();
}

uint64_t AXSSIsAppleInternalBuild()
{
  return _AXSSIsAppleInternalBuild();
}

uint64_t AnalyticsSendEventLazy()
{
  return _AnalyticsSendEventLazy();
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return _CFNotificationCenterGetDarwinNotifyCenter();
}

CGColorRef CGColorCreateGenericGray(CGFloat gray, CGFloat alpha)
{
  return _CGColorCreateGenericGray(gray, alpha);
}

void CGContextAddPath(CGContextRef c, CGPathRef path)
{
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
}

void CGContextSetLineWidth(CGContextRef c, CGFloat width)
{
}

CGMutablePathRef CGPathCreateMutable(void)
{
  return _CGPathCreateMutable();
}

CGFloat CGRectGetHeight(CGRect rect)
{
  return _CGRectGetHeight(rect);
}

CGFloat CGRectGetWidth(CGRect rect)
{
  return _CGRectGetWidth(rect);
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  return _CGRectUnion(r1, r2);
}

BOOL CGSizeEqualToSize(CGSize size1, CGSize size2)
{
  return _CGSizeEqualToSize(size1, size2);
}

CGSize CGSizeFromString(NSString *string)
{
  CGSize v3 = _CGSizeFromString(string);
  double height = v3.height;
  double width = v3.width;
  result.double height = height;
  result.double width = width;
  return result;
}

NSString *__cdecl NSStringFromCGSize(CGSize size)
{
  return _NSStringFromCGSize(size);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

BOOL UIAccessibilityIsVoiceOverRunning(void)
{
  return _UIAccessibilityIsVoiceOverRunning();
}

void UIAccessibilityPostNotification(UIAccessibilityNotifications notification, id argument)
{
}

int UIApplicationMain(int argc, char **argv, NSString *principalClassName, NSString *delegateClassName)
{
  return _UIApplicationMain(argc, argv, principalClassName, delegateClassName);
}

uint64_t _AXSBrailleInputDeviceConnected()
{
  return __AXSBrailleInputDeviceConnected();
}

uint64_t _AXSLiveCaptionsNubbitIdleOpacity()
{
  return __AXSLiveCaptionsNubbitIdleOpacity();
}

uint64_t _AXSLiveTranscriptionCopyBackgroundColorData()
{
  return __AXSLiveTranscriptionCopyBackgroundColorData();
}

uint64_t _AXSLiveTranscriptionCopyTextColorData()
{
  return __AXSLiveTranscriptionCopyTextColorData();
}

uint64_t _AXSLiveTranscriptionEnabled()
{
  return __AXSLiveTranscriptionEnabled();
}

uint64_t _AXSLiveTranscriptionInCallEnabled()
{
  return __AXSLiveTranscriptionInCallEnabled();
}

uint64_t _AXSLiveTranscriptionMicOn()
{
  return __AXSLiveTranscriptionMicOn();
}

uint64_t _AXSLiveTranscriptionPaused()
{
  return __AXSLiveTranscriptionPaused();
}

uint64_t _AXSLiveTranscriptionScreenshotHidingEnabled()
{
  return __AXSLiveTranscriptionScreenshotHidingEnabled();
}

uint64_t _AXSLiveTranscriptionSetEnabled()
{
  return __AXSLiveTranscriptionSetEnabled();
}

uint64_t _AXSLiveTranscriptionSetMicOn()
{
  return __AXSLiveTranscriptionSetMicOn();
}

uint64_t _AXSLiveTranscriptionSetPaused()
{
  return __AXSLiveTranscriptionSetPaused();
}

uint64_t _AXSVoiceOverTouchEnabled()
{
  return __AXSVoiceOverTouchEnabled();
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

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return __sl_dlopen();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return __swift_stdlib_reportUnimplementedInitializer();
}

uint64_t abort_report_np()
{
  return _abort_report_np();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

char *dlerror(void)
{
  return _dlerror();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return _dlsym(__handle, __symbol);
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

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

Class objc_getClass(const char *name)
{
  return _objc_getClass(name);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
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

void objc_storeStrong(id *location, id obj)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

long double sin(long double __x)
{
  return _sin(__x);
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

uint64_t swift_dynamicCastObjCClassUnconditional()
{
  return _swift_dynamicCastObjCClassUnconditional();
}

uint64_t swift_endAccess()
{
  return _swift_endAccess();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_getAtKeyPath()
{
  return _swift_getAtKeyPath();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return _swift_getEnumCaseMultiPayload();
}

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
}

uint64_t swift_getKeyPath()
{
  return _swift_getKeyPath();
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

uint64_t swift_storeEnumTagMultiPayload()
{
  return _swift_storeEnumTagMultiPayload();
}

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return _swift_unknownObjectWeakAssign();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return _swift_unknownObjectWeakDestroy();
}

uint64_t swift_unknownObjectWeakInit()
{
  return _swift_unknownObjectWeakInit();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return _swift_unknownObjectWeakLoadStrong();
}

uint64_t swift_updateClassMetadata2()
{
  return _swift_updateClassMetadata2();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}

id objc_msgSend_acquireAssertionToDisableIdleTimerWithReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "acquireAssertionToDisableIdleTimerWithReason:");
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return _[a1 invalidate];
}

id objc_msgSend_registerLiveCaptionsPID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerLiveCaptionsPID:");
}

id objc_msgSend_server(void *a1, const char *a2, ...)
{
  return _[a1 server];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return _[a1 sharedInstance];
}