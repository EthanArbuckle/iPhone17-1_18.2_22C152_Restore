id DILogHandleDropInSession()
{
  void *v0;
  uint64_t vars8;

  if (DILogHandleDropInSession_once != -1) {
    dispatch_once(&DILogHandleDropInSession_once, &__block_literal_global_208);
  }
  v0 = (void *)DILogHandleDropInSession_logger;
  return v0;
}

void sub_24D0113BC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15)
{
}

void sub_24D011568(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void sub_24D011BB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void sub_24D011F20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void sub_24D0121C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_24D012538(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void sub_24D012794(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_24D012B04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

uint64_t __DILogHandleDropInSession_block_invoke()
{
  DILogHandleDropInSession_logger = (uint64_t)os_log_create("com.apple.dropin", "DropInSession");
  return MEMORY[0x270F9A758]();
}

id DILogHandleDevice()
{
  if (DILogHandleDevice_once != -1) {
    dispatch_once(&DILogHandleDevice_once, &__block_literal_global_0);
  }
  v0 = (void *)DILogHandleDevice_logger;
  return v0;
}

void sub_24D013D80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void sub_24D015208(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __DILogHandleDevice_block_invoke()
{
  DILogHandleDevice_logger = (uint64_t)os_log_create("com.apple.dropin", "Device");
  return MEMORY[0x270F9A758]();
}

id DILogHandleDropInRequest()
{
  if (DILogHandleDropInRequest_once != -1) {
    dispatch_once(&DILogHandleDropInRequest_once, &__block_literal_global_1);
  }
  v0 = (void *)DILogHandleDropInRequest_logger;
  return v0;
}

uint64_t __DILogHandleDropInRequest_block_invoke()
{
  DILogHandleDropInRequest_logger = (uint64_t)os_log_create("com.apple.dropin", "DropInRequest");
  return MEMORY[0x270F9A758]();
}

id DILogHandleDropInCenter()
{
  if (DILogHandleDropInCenter_once != -1) {
    dispatch_once(&DILogHandleDropInCenter_once, &__block_literal_global_2);
  }
  v0 = (void *)DILogHandleDropInCenter_logger;
  return v0;
}

uint64_t __DILogHandleDropInCenter_block_invoke()
{
  DILogHandleDropInCenter_logger = (uint64_t)os_log_create("com.apple.dropin", "DropInCenter");
  return MEMORY[0x270F9A758]();
}

id DILogHandleAudioPowerController()
{
  if (DILogHandleAudioPowerController_once != -1) {
    dispatch_once(&DILogHandleAudioPowerController_once, &__block_literal_global_36);
  }
  v0 = (void *)DILogHandleAudioPowerController_logger;
  return v0;
}

uint64_t __DILogHandleAudioPowerController_block_invoke()
{
  DILogHandleAudioPowerController_logger = (uint64_t)os_log_create("com.apple.dropin", "AudioPowerController");
  return MEMORY[0x270F9A758]();
}

id DILogHandleDIDropInSessionManager()
{
  if (DILogHandleDIDropInSessionManager_once != -1) {
    dispatch_once(&DILogHandleDIDropInSessionManager_once, &__block_literal_global_56);
  }
  v0 = (void *)DILogHandleDIDropInSessionManager_logger;
  return v0;
}

uint64_t __DILogHandleDIDropInSessionManager_block_invoke()
{
  DILogHandleDIDropInSessionManager_logger = (uint64_t)os_log_create("com.apple.dropin", "DIDropInSessionManager");
  return MEMORY[0x270F9A758]();
}

id DILogHandleDeviceManager()
{
  if (DILogHandleDeviceManager_once != -1) {
    dispatch_once(&DILogHandleDeviceManager_once, &__block_literal_global_55);
  }
  v0 = (void *)DILogHandleDeviceManager_logger;
  return v0;
}

void sub_24D01A3F0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_24D01A63C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_24D01AA58(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_24D01AD14(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_24D01B0D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id obj)
{
}

uint64_t __DILogHandleDeviceManager_block_invoke()
{
  DILogHandleDeviceManager_logger = (uint64_t)os_log_create("com.apple.dropin", "DeviceManager");
  return MEMORY[0x270F9A758]();
}

id DILogHandleAudioSystemController()
{
  if (DILogHandleAudioSystemController_once[0] != -1) {
    dispatch_once(DILogHandleAudioSystemController_once, &__block_literal_global_68);
  }
  v0 = (void *)DILogHandleAudioSystemController_logger;
  return v0;
}

void sub_24D01B4F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_24D01B694(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void sub_24D01BB60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_24D01BD04(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

uint64_t __DILogHandleAudioSystemController_block_invoke()
{
  DILogHandleAudioSystemController_logger = (uint64_t)os_log_create("com.apple.dropin", "AudioSystemController");
  return MEMORY[0x270F9A758]();
}

void sub_24D01C6C0(void *a1, void (**a2)(void))
{
  objc_msgSend(a1, sel_lock);
  a2[2](a2);
  objc_msgSend(a1, sel_unlock);
  _Block_release(a2);
}

id NSRecursiveLock.di_synchronize(_:)(void (*a1)(id))
{
  a1(objc_msgSend(v1, sel_lock));
  return objc_msgSend(v1, sel_unlock);
}

void sub_24D01C788(void *a1, int a2, void *aBlock)
{
  v4 = _Block_copy(aBlock);
  _Block_copy(v4);
  id v5 = a1;
  sub_24D01C6C0(v5, (void (**)(void))v4);
  _Block_release(v4);
}

void type metadata accessor for HandleType(uint64_t a1)
{
}

void type metadata accessor for StateReason(uint64_t a1)
{
}

void type metadata accessor for State(uint64_t a1)
{
}

void _s3__C5StateOMa_0(uint64_t a1)
{
}

uint64_t sub_24D01C83C()
{
  uint64_t v0 = sub_24D044428();
  uint64_t v2 = v1;
  if (v0 == sub_24D044428() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_24D0448E8();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

BOOL sub_24D01C8C4(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

BOOL sub_24D01C8D0(char a1, char a2)
{
  return a1 == a2;
}

uint64_t sub_24D01C8E0()
{
  return sub_24D01CD60(*v0, MEMORY[0x263F07B58]);
}

uint64_t sub_24D01C914(uint64_t a1, id *a2)
{
  uint64_t result = sub_24D044408();
  *a2 = 0;
  return result;
}

uint64_t sub_24D01C990(uint64_t a1, id *a2)
{
  char v3 = sub_24D044418();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_24D01CA10@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_24D01CA38();
  *a1 = result;
  return result;
}

uint64_t sub_24D01CA38()
{
  sub_24D044428();
  uint64_t v0 = sub_24D0443F8();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_24D01CA70()
{
  return sub_24D01C83C();
}

void sub_24D01CA7C(uint64_t a1@<X8>)
{
  sub_24D01CAB0();
  *(void *)a1 = v2;
  *(unsigned char *)(a1 + 8) = v3 & 1;
}

uint64_t sub_24D01CAB8()
{
  uint64_t v1 = OUTLINED_FUNCTION_0();
  uint64_t result = nullsub_1(v1);
  uint64_t *v0 = result;
  return result;
}

BOOL sub_24D01CAE0(uint64_t *a1, uint64_t *a2)
{
  return sub_24D01C8C4(*a1, *a2);
}

uint64_t sub_24D01CAEC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_24D0443F8();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_24D01CB34()
{
  OUTLINED_FUNCTION_0();
  uint64_t result = sub_24D0250C4();
  uint64_t *v0 = result;
  v0[1] = v2;
  return result;
}

void type metadata accessor for Category(uint64_t a1)
{
}

void sub_24D01CB70(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_24D01CBB8(uint64_t a1)
{
  uint64_t v2 = sub_24D01CCB8(&qword_26984F600);
  uint64_t v3 = sub_24D01CCB8(&qword_26984F608);
  uint64_t v4 = MEMORY[0x263F8D320];
  return MEMORY[0x270F9F1A8](a1, v2, v3, v4);
}

uint64_t sub_24D01CC50()
{
  return sub_24D01CCB8(&qword_26984F5E8);
}

uint64_t sub_24D01CC84()
{
  return sub_24D01CCB8(&qword_26984F5F0);
}

uint64_t sub_24D01CCB8(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for Category(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_24D01CCFC()
{
  return sub_24D01CCB8(&qword_26984F5F8);
}

uint64_t sub_24D01CD30()
{
  return sub_24D01CD60(*v0, MEMORY[0x263F8D308]);
}

uint64_t sub_24D01CD60(uint64_t a1, uint64_t (*a2)(uint64_t))
{
  uint64_t v3 = sub_24D044428();
  uint64_t v4 = a2(v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_24D01CDA0()
{
  return sub_24D01CDA8();
}

uint64_t sub_24D01CDA8()
{
  sub_24D044428();
  sub_24D044448();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24D01CDFC()
{
  return sub_24D01CE04();
}

uint64_t sub_24D01CE04()
{
  sub_24D044428();
  sub_24D044978();
  sub_24D044448();
  uint64_t v0 = sub_24D044998();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t OUTLINED_FUNCTION_0()
{
  return *(void *)v0;
}

uint64_t sub_24D01CE88()
{
  if (qword_26984F490 != -1) {
    swift_once();
  }
  uint64_t v1 = qword_26984F8A8;
  swift_bridgeObjectRetain();
  sub_24D044458();
  sub_24D044458();
  return v1;
}

id sub_24D01CF24()
{
  uint64_t v1 = v0;
  sub_24D01CFDC();
  uint64_t v2 = (void *)sub_24D044688();
  char v3 = sub_24D044748();

  if (v3)
  {
    id v4 = objc_msgSend(self, sel_mainQueue);
    return v4;
  }
  else
  {
    id v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08A48]), sel_init);
    objc_msgSend(v6, sel_setUnderlyingQueue_, v1);
    return v6;
  }
}

unint64_t sub_24D01CFDC()
{
  unint64_t result = qword_26B184C80;
  if (!qword_26B184C80)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26B184C80);
  }
  return result;
}

uint64_t sub_24D01D01C()
{
  return sub_24D044988();
}

uint64_t sub_24D01D044()
{
  return sub_24D044998();
}

BOOL sub_24D01D08C(char *a1, char *a2)
{
  return sub_24D01C8D0(*a1, *a2);
}

uint64_t sub_24D01D098()
{
  return sub_24D01D044();
}

uint64_t sub_24D01D0A0()
{
  return sub_24D01D01C();
}

uint64_t sub_24D01D0A8()
{
  return sub_24D044998();
}

uint64_t sub_24D01D0FC(uint64_t a1, uint64_t a2)
{
  char v3 = (void *)(v2 + OBJC_IVAR____TtC6DropIn11AudioPlayer_playHandler);
  uint64_t v4 = *(void *)(v2 + OBJC_IVAR____TtC6DropIn11AudioPlayer_playHandler);
  *char v3 = a1;
  v3[1] = a2;
  return sub_24D01DD94(v4);
}

uint64_t sub_24D01D11C(uint64_t a1)
{
  *(void *)(v1 + OBJC_IVAR____TtC6DropIn11AudioPlayer_timeoutTimer) = a1;
  return MEMORY[0x270F9A758]();
}

char *sub_24D01D130(uint64_t a1)
{
  char v3 = v1;
  uint64_t v5 = sub_24D0441A8();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = (uint64_t *)&v3[OBJC_IVAR____TtC6DropIn11AudioPlayer_playHandler];
  uint64_t *v9 = 0;
  v9[1] = 0;
  uint64_t v10 = OBJC_IVAR____TtC6DropIn11AudioPlayer_timeoutTimer;
  *(void *)&v3[OBJC_IVAR____TtC6DropIn11AudioPlayer_timeoutTimer] = 0;
  v11 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
  uint64_t v22 = a1;
  v11(v8, a1, v5);
  objc_allocWithZone(MEMORY[0x263EF93B8]);
  v12 = v3;
  id v13 = sub_24D01DFA8((uint64_t)v8);
  if (v2)
  {
    uint64_t v14 = OUTLINED_FUNCTION_1();
    v15(v14);
    sub_24D01DD94(*v9);
    v16 = *(void **)&v3[v10];

    type metadata accessor for AudioPlayer();
    swift_deallocPartialClassInstance();
  }
  else
  {
    *(void *)&v12[OBJC_IVAR____TtC6DropIn11AudioPlayer_avAudioPlayer] = v13;

    v17 = (objc_class *)type metadata accessor for AudioPlayer();
    v21.receiver = v12;
    v21.super_class = v17;
    char v3 = (char *)objc_msgSendSuper2(&v21, sel_init);
    objc_msgSend(*(id *)&v3[OBJC_IVAR____TtC6DropIn11AudioPlayer_avAudioPlayer], sel_setDelegate_, v3);
    uint64_t v18 = OUTLINED_FUNCTION_1();
    v19(v18);
  }
  return v3;
}

uint64_t sub_24D01D2FC(double a1)
{
  *(void *)(v2 + 24) = v1;
  *(double *)(v2 + 16) = a1;
  return MEMORY[0x270FA2498](sub_24D01D320, 0, 0);
}

uint64_t sub_24D01D320()
{
  uint64_t v1 = v0[2];
  uint64_t v2 = swift_allocObject();
  v0[4] = v2;
  swift_unknownObjectWeakInit();
  uint64_t v3 = swift_task_alloc();
  v0[5] = v3;
  *(void *)(v3 + 16) = v2;
  *(void *)(v3 + 24) = v1;
  uint64_t v4 = (void *)swift_task_alloc();
  v0[6] = v4;
  void *v4 = v0;
  v4[1] = sub_24D01D44C;
  return MEMORY[0x270FA2360]();
}

uint64_t sub_24D01D44C()
{
  *(void *)(*(void *)v1 + 56) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_24D01D588;
  }
  else
  {
    swift_release();
    swift_task_dealloc();
    uint64_t v2 = sub_24D01D570;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24D01D570()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_24D01D588()
{
  swift_release();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

void sub_24D01D5F4(uint64_t a1, uint64_t a2, double a3)
{
  uint64_t v6 = sub_24D044258();
  MEMORY[0x270FA5388](v6 - 8);
  v8 = (char *)v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B184C70);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(void *)(v10 + 64);
  MEMORY[0x270FA5388](v9);
  v12 = (char *)v29 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t v13 = MEMORY[0x25331C870](a2 + 16);
  if (v13)
  {
    uint64_t v14 = (char *)v13;
    v30 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 16);
    v30((char *)v29 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v9);
    uint64_t v15 = *(unsigned __int8 *)(v10 + 80);
    uint64_t v16 = (v15 + 16) & ~v15;
    v31 = v8;
    v29[1] = v15 | 7;
    uint64_t v17 = swift_allocObject();
    uint64_t v18 = *(void (**)(uint64_t, char *, uint64_t))(v10 + 32);
    v18(v17 + v16, v12, v9);
    sub_24D01D0FC((uint64_t)sub_24D01DE30, v17);
    v29[0] = a1;
    v30(v12, a1, v9);
    uint64_t v19 = swift_allocObject();
    v18(v19 + v16, v12, v9);
    v20 = v14;
    uint64_t v21 = (uint64_t)v31;
    sub_24D044248();
    id v22 = objc_allocWithZone((Class)type metadata accessor for OneshotTimer());
    v23 = OneshotTimer.init(timeInterval:queue:identifier:label:timerFiredHandler:)(0, v21, 0x54746F6873656E4FLL, 0xEC00000072656D69, (uint64_t)sub_24D01DF2C, v19, a3);
    sub_24D01D11C((uint64_t)v23);
    uint64_t v24 = OBJC_IVAR____TtC6DropIn11AudioPlayer_avAudioPlayer;
    if ((objc_msgSend(*(id *)&v20[OBJC_IVAR____TtC6DropIn11AudioPlayer_avAudioPlayer], sel_play) & 1) == 0)
    {
      sub_24D01D0FC(0, 0);
      v25 = *(void **)&v20[OBJC_IVAR____TtC6DropIn11AudioPlayer_timeoutTimer];
      if (v25)
      {
        id v26 = v25;
        sub_24D040E04();
      }
      objc_msgSend(*(id *)&v20[v24], sel_stop);
      sub_24D01DD38();
      uint64_t v27 = swift_allocError();
      unsigned char *v28 = 1;
      uint64_t v32 = v27;
      sub_24D0444F8();
    }
  }
}

uint64_t sub_24D01D924(void *a1, char a2)
{
  if (a2)
  {
    id v3 = a1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B184C70);
    return sub_24D0444F8();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B184C70);
    return sub_24D044508();
  }
}

uint64_t sub_24D01D988()
{
  sub_24D01DD38();
  swift_allocError();
  unsigned char *v0 = 2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B184C70);
  return sub_24D0444F8();
}

void sub_24D01D9F0()
{
  uint64_t v1 = v0;
  uint64_t v2 = *(void **)(v0 + OBJC_IVAR____TtC6DropIn11AudioPlayer_timeoutTimer);
  if (v2)
  {
    id v3 = v2;
    sub_24D040E04();
  }
  uint64_t v4 = *(void (**)(void, void))(v1 + OBJC_IVAR____TtC6DropIn11AudioPlayer_playHandler);
  if (v4)
  {
    swift_retain();
    v4(0, 0);
    sub_24D01DD94((uint64_t)v4);
  }
}

void sub_24D01DAE8(uint64_t a1, void *a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *(void **)(v2 + OBJC_IVAR____TtC6DropIn11AudioPlayer_timeoutTimer);
  if (v5)
  {
    id v6 = v5;
    sub_24D040E04();
  }
  uint64_t v7 = *(void (**)(void *, uint64_t))(v3 + OBJC_IVAR____TtC6DropIn11AudioPlayer_playHandler);
  if (v7)
  {
    if (a2)
    {
      v8 = a2;
    }
    else
    {
      sub_24D01DD38();
      v8 = (void *)swift_allocError();
      unsigned char *v9 = 0;
    }
    sub_24D01DD84((uint64_t)v7);
    id v10 = a2;
    v7(v8, 1);
    sub_24D01DD94((uint64_t)v7);
  }
}

void sub_24D01DC40()
{
}

id sub_24D01DC80()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AudioPlayer();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for AudioPlayer()
{
  return self;
}

unint64_t sub_24D01DD38()
{
  unint64_t result = qword_26984F758;
  if (!qword_26984F758)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26984F758);
  }
  return result;
}

uint64_t sub_24D01DD84(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_24D01DD94(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_24D01DDA4()
{
  swift_unknownObjectWeakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_24D01DDDC(uint64_t a1)
{
  sub_24D01D5F4(a1, *(void *)(v1 + 16), *(double *)(v1 + 24));
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_24D01DE30(void *a1, char a2)
{
  char v3 = a2 & 1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B184C70);
  OUTLINED_FUNCTION_0_0(v4);
  return sub_24D01D924(a1, v3);
}

uint64_t objectdestroy_18Tm()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B184C70);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t sub_24D01DF2C()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B184C70);
  OUTLINED_FUNCTION_0_0(v0);
  return sub_24D01D988();
}

id sub_24D01DFA8(uint64_t a1)
{
  uint64_t v2 = v1;
  v13[1] = *(id *)MEMORY[0x263EF8340];
  uint64_t v4 = (void *)sub_24D044188();
  v13[0] = 0;
  id v5 = objc_msgSend(v2, sel_initWithContentsOfURL_error_, v4, v13);

  id v6 = v13[0];
  if (v5)
  {
    uint64_t v7 = sub_24D0441A8();
    v8 = *(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8);
    id v9 = v6;
    v8(a1, v7);
  }
  else
  {
    id v10 = v13[0];
    sub_24D044178();

    swift_willThrow();
    uint64_t v11 = sub_24D0441A8();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v11 - 8) + 8))(a1, v11);
  }
  return v5;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for AudioPlayer.PlaybackError(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFE)
  {
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
    int v5 = (*a1 | (v4 << 8)) - 3;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 3;
  int v5 = v6 - 3;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for AudioPlayer.PlaybackError(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24D01E258);
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

uint64_t sub_24D01E280(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_24D01E28C(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for AudioPlayer.PlaybackError()
{
  return &type metadata for AudioPlayer.PlaybackError;
}

unint64_t sub_24D01E2A8()
{
  unint64_t result = qword_26984F768;
  if (!qword_26984F768)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26984F768);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_0_0(uint64_t a1)
{
  return a1 - 8;
}

uint64_t OUTLINED_FUNCTION_1()
{
  return *(void *)(v0 - 72);
}

uint64_t ActivationState.rawValue.getter()
{
  return *v0 - 1;
}

DropIn::ActivationState_optional __swiftcall ActivationState.init(rawValue:)(Swift::Int rawValue)
{
  char v2 = 10;
  if ((unint64_t)(rawValue + 1) < 0xA) {
    char v2 = rawValue + 1;
  }
  char *v1 = v2;
  return (DropIn::ActivationState_optional)rawValue;
}

void *static ActivationState.allCases.getter()
{
  return &unk_26FF61970;
}

uint64_t sub_24D01E34C()
{
  return sub_24D034208(*v0);
}

uint64_t sub_24D01E354()
{
  return sub_24D034258();
}

uint64_t sub_24D01E35C(uint64_t a1)
{
  return sub_24D034284(a1, *v1);
}

DropIn::ActivationState_optional sub_24D01E364(Swift::Int *a1)
{
  return ActivationState.init(rawValue:)(*a1);
}

uint64_t sub_24D01E36C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = ActivationState.rawValue.getter();
  *a1 = result;
  return result;
}

void sub_24D01E394(void *a1@<X8>)
{
  *a1 = &unk_26FF61970;
}

uint64_t static AppStateActivationError.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)a1;
  uint64_t v3 = *(void *)(a1 + 8);
  int v4 = *(unsigned __int8 *)(a1 + 16);
  uint64_t v5 = *(void *)a2;
  uint64_t v6 = *(void *)(a2 + 8);
  int v7 = *(unsigned __int8 *)(a2 + 16);
  if (!*(unsigned char *)(a1 + 16))
  {
    if (*(unsigned char *)(a2 + 16))
    {
LABEL_25:
      sub_24D01E49C(*(void *)a1, v3, v4);
      uint64_t v8 = 0;
      goto LABEL_26;
    }
    goto LABEL_6;
  }
  if (v4 == 1)
  {
    if (v7 != 1) {
      goto LABEL_25;
    }
LABEL_6:
    swift_bridgeObjectRetain();
    goto LABEL_7;
  }
  if (v2 | v3)
  {
    if (v2 ^ 1 | v3) {
      BOOL v9 = v7 == 2 && v5 == 2;
    }
    else {
      BOOL v9 = v7 == 2 && v5 == 1;
    }
    if (!v9 || v6 != 0) {
      goto LABEL_25;
    }
  }
  else if (v7 != 2 || (v6 | v5) != 0)
  {
    goto LABEL_25;
  }
LABEL_7:
  uint64_t v8 = 1;
LABEL_26:
  sub_24D01E49C(v5, v6, v7);
  sub_24D01E4B4(v2, v3, v4);
  sub_24D01E4B4(v5, v6, v7);
  return v8;
}

uint64_t sub_24D01E49C(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  if (a3 <= 1u) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_24D01E4B4(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  if (a3 <= 1u) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

unint64_t sub_24D01E4D0()
{
  unint64_t result = qword_26984F770;
  if (!qword_26984F770)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26984F770);
  }
  return result;
}

unint64_t sub_24D01E520()
{
  unint64_t result = qword_26984F778;
  if (!qword_26984F778)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26984F780);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26984F778);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t getEnumTagSinglePayload for ActivationState(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xF7)
  {
    if (a2 + 9 >= 0xFFFF00) {
      int v2 = 4;
    }
    else {
      int v2 = 2;
    }
    if ((a2 + 9) >> 8 < 0xFF) {
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
    int v5 = (*a1 | (v4 << 8)) - 10;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0xA;
  int v5 = v6 - 10;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for ActivationState(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 9 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 9) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF7) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF6)
  {
    unsigned int v6 = ((a2 - 247) >> 8) + 1;
    *uint64_t result = a2 + 9;
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
        JUMPOUT(0x24D01E714);
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
          *uint64_t result = a2 + 9;
        break;
    }
  }
  return result;
}

void type metadata accessor for ActivationState()
{
}

uint64_t destroy for AppStateActivationError(uint64_t a1)
{
  return sub_24D01E4B4(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16));
}

uint64_t _s6DropIn23AppStateActivationErrorOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  unsigned __int8 v5 = *(unsigned char *)(a2 + 16);
  sub_24D01E49C(*(void *)a2, v4, v5);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for AppStateActivationError(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  unsigned __int8 v5 = *(unsigned char *)(a2 + 16);
  sub_24D01E49C(*(void *)a2, v4, v5);
  uint64_t v6 = *(void *)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  unsigned __int8 v8 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v5;
  sub_24D01E4B4(v6, v7, v8);
  return a1;
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for AppStateActivationError(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void *)a1;
  uint64_t v5 = *(void *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  unsigned __int8 v6 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v3;
  sub_24D01E4B4(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for AppStateActivationError(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0xFE && *(unsigned char *)(a1 + 17))
    {
      int v2 = *(_DWORD *)a1 + 253;
    }
    else
    {
      unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
      if (v3 <= 2) {
        int v2 = -1;
      }
      else {
        int v2 = v3 ^ 0xFF;
      }
    }
  }
  else
  {
    int v2 = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AppStateActivationError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 254;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 16) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_24D01E8E0(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 16) <= 1u) {
    return *(unsigned __int8 *)(a1 + 16);
  }
  else {
    return (*(_DWORD *)a1 + 2);
  }
}

uint64_t sub_24D01E8F8(uint64_t result, unsigned int a2)
{
  if (a2 >= 2)
  {
    *(void *)__n128 result = a2 - 2;
    *(void *)(result + 8) = 0;
    LOBYTE(a2) = 2;
  }
  *(unsigned char *)(result + 16) = a2;
  return result;
}

void type metadata accessor for AppStateActivationError()
{
}

uint64_t sub_24D01E91C()
{
  swift_release();
  swift_release();
  return v0;
}

uint64_t sub_24D01E94C()
{
  sub_24D01E91C();
  return MEMORY[0x270FA0228](v0, 40, 7);
}

uint64_t type metadata accessor for AppStateActivationResources()
{
  return self;
}

void sub_24D01E9A4()
{
  uint64_t v1 = *(void (**)(unint64_t *))(v0 + 112);
  if (*(unsigned char *)(v0 + 128))
  {
    if (v1)
    {
      unint64_t v6 = *(unsigned __int8 *)(v0 + 128);
      char v7 = 0;
      swift_retain();
      v1(&v6);
      sub_24D01DD94((uint64_t)v1);
    }
  }
  else if (v1)
  {
    int v2 = *(void **)(v0 + 136);
    if (v2)
    {
      unsigned int v3 = *(void **)(v0 + 136);
    }
    else
    {
      sub_24D021964();
      unsigned int v3 = (void *)swift_allocError();
      *(void *)uint64_t v4 = 0;
      *(void *)(v4 + 8) = 0;
      *(unsigned char *)(v4 + 16) = 2;
    }
    unint64_t v6 = (unint64_t)v3;
    char v7 = 1;
    sub_24D01DD84((uint64_t)v1);
    id v5 = v2;
    v1(&v6);
    sub_24D01DD94((uint64_t)v1);
  }
}

void sub_24D01EAA0(char *a1)
{
}

void *sub_24D01EAA8()
{
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR____TtC6DropIn18AppStateActivation_session);
  uint64_t v2 = *(void *)(v0 + OBJC_IVAR____TtC6DropIn18AppStateActivation_ongoingTonePlayer);
  uint64_t v3 = *(void *)(v0 + OBJC_IVAR____TtC6DropIn18AppStateActivation_siriAnnouncement);
  type metadata accessor for AppStateActivationResources();
  uint64_t v4 = (void *)swift_allocObject();
  v4[2] = v1;
  v4[3] = v2;
  v4[4] = v3;
  swift_retain();
  id v5 = v1;
  swift_retain();
  return v4;
}

uint64_t sub_24D01EB24()
{
  uint64_t v2 = sub_24D044298();
  OUTLINED_FUNCTION_1_0();
  uint64_t v4 = v3;
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_24();
  swift_defaultActor_initialize();
  *(void *)(v0 + 136) = 0;
  *(void *)(v0 + 112) = 0;
  *(void *)(v0 + 120) = 0;
  *(void *)(v0 + OBJC_IVAR____TtC6DropIn18AppStateActivation_session) = 0;
  *(void *)(v0 + OBJC_IVAR____TtC6DropIn18AppStateActivation_startTonePlayer) = 0;
  *(void *)(v0 + OBJC_IVAR____TtC6DropIn18AppStateActivation_ongoingTonePlayer) = 0;
  *(void *)(v0 + OBJC_IVAR____TtC6DropIn18AppStateActivation_siriAnnouncement) = 0;
  sub_24D044288();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 32))(v0 + OBJC_IVAR____TtC6DropIn18AppStateActivation_logger, v1, v2);
  *(unsigned char *)(v0 + 128) = 1;
  return v0;
}

uint64_t sub_24D01EC38(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(v2 + 112);
  *(void *)(v2 + 112) = a1;
  *(void *)(v2 + 120) = a2;
  swift_retain();
  return sub_24D01DD94(v3);
}

void sub_24D01EC84(void *a1)
{
  uint64_t v2 = *(void **)(v1 + OBJC_IVAR____TtC6DropIn18AppStateActivation_session);
  *(void *)(v1 + OBJC_IVAR____TtC6DropIn18AppStateActivation_session) = a1;
  id v3 = a1;

  *(unsigned char *)(v1 + 128) = 2;
  sub_24D01E9A4();
  sub_24D01EE38();
}

uint64_t sub_24D01ECD4(unsigned char *a1)
{
  *(unsigned char *)(v1 + 128) = *a1;
  sub_24D01E9A4();
  return sub_24D01EE38();
}

uint64_t sub_24D01ED04(void *a1)
{
  uint64_t v2 = *(void **)(v1 + 136);
  *(void *)(v1 + 136) = a1;
  id v3 = a1;

  char v5 = 0;
  return sub_24D01ECD4(&v5);
}

void sub_24D01ED48()
{
  uint64_t v1 = *(void **)(v0 + 136);
  *(void *)(v0 + 136) = 0;

  uint64_t v2 = *(void **)(v0 + OBJC_IVAR____TtC6DropIn18AppStateActivation_session);
  *(void *)(v0 + OBJC_IVAR____TtC6DropIn18AppStateActivation_session) = 0;

  *(unsigned char *)(v0 + 128) = 1;
  sub_24D01E9A4();
  *(void *)(v0 + OBJC_IVAR____TtC6DropIn18AppStateActivation_startTonePlayer) = 0;
  swift_release();
  uint64_t v3 = OBJC_IVAR____TtC6DropIn18AppStateActivation_ongoingTonePlayer;
  if (*(void *)(v0 + OBJC_IVAR____TtC6DropIn18AppStateActivation_ongoingTonePlayer))
  {
    swift_retain();
    sub_24D03D0D0();
    swift_release();
  }
  *(void *)(v0 + v3) = 0;
  swift_release();
  *(void *)(v0 + OBJC_IVAR____TtC6DropIn18AppStateActivation_siriAnnouncement) = 0;
  swift_release();
  if (qword_26984F488 != -1) {
    swift_once();
  }
  sub_24D023758();
}

void sub_24D01EE38()
{
  switch(*(unsigned char *)(v0 + 128))
  {
    case 1:
      return;
    case 2:
    case 7:
      sub_24D01EEA8();
      break;
    case 3:
      sub_24D01EF04();
      break;
    case 4:
      sub_24D01F918();
      break;
    case 5:
      sub_24D02001C();
      break;
    case 6:
      sub_24D020614();
      break;
    case 8:
      sub_24D020C7C();
      break;
    default:
      OUTLINED_FUNCTION_19(1);
      break;
  }
}

void sub_24D01EEA8()
{
  Swift::Int v1 = *(unsigned __int8 *)(v0 + 128);
  if (v1 == 9)
  {
    char v2 = 9;
  }
  else
  {
    ActivationState.init(rawValue:)(v1);
    char v2 = v3;
    if (v3 == 10) {
      char v2 = 1;
    }
  }
  *(unsigned char *)(v0 + 128) = v2;
  sub_24D01E9A4();
  sub_24D01EE38();
}

uint64_t sub_24D01EF04()
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B184BF0);
  uint64_t v3 = OUTLINED_FUNCTION_12(v2);
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_25();
  uint64_t v4 = sub_24D044548();
  unint64_t v7 = OUTLINED_FUNCTION_11(v0, v5, v6, v4);
  unsigned __int8 v8 = (void *)swift_allocObject();
  v8[2] = v1;
  v8[3] = v7;
  v8[4] = v1;
  swift_retain_n();
  sub_24D02A2E8();
  return swift_release();
}

uint64_t sub_24D01EFC8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 16) = a4;
  return MEMORY[0x270FA2498](sub_24D01EFE8, a4, 0);
}

uint64_t sub_24D01EFE8()
{
  OUTLINED_FUNCTION_5();
  sub_24D021878();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 24) = v1;
  void *v1 = v0;
  v1[1] = sub_24D01F0BC;
  return MEMORY[0x270FA2158]();
}

uint64_t sub_24D01F0BC()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1();
  uint64_t v2 = *(void *)(v1 + 16);
  uint64_t v3 = *v0;
  OUTLINED_FUNCTION_6();
  void *v4 = v3;
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_24D01F19C, v2, 0);
}

uint64_t sub_24D01F19C()
{
  OUTLINED_FUNCTION_5();
  sub_24D01EEA8();
  OUTLINED_FUNCTION_4();
  return v0();
}

uint64_t sub_24D01F1F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[2] = a2;
  v3[3] = a3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B184BF0);
  v3[4] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24D01F28C, a3, 0);
}

uint64_t sub_24D01F28C()
{
  OUTLINED_FUNCTION_21();
  uint64_t v1 = v0[3];
  uint64_t v2 = v0[4];
  sub_24D044548();
  OUTLINED_FUNCTION_33();
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = 0;
  *(void *)(v3 + 24) = 0;
  sub_24D01F590(v2, (uint64_t)&unk_26984F840, v3);
  sub_24D021ED8(v2, &qword_26B184BF0);
  OUTLINED_FUNCTION_33();
  uint64_t v4 = swift_allocObject();
  swift_weakInit();
  uint64_t v5 = (void *)swift_allocObject();
  v5[2] = 0;
  v5[3] = 0;
  v5[4] = v4;
  sub_24D01F590(v2, (uint64_t)&unk_26984F850, (uint64_t)v5);
  sub_24D021ED8(v2, &qword_26B184BF0);
  unint64_t v6 = sub_24D021878();
  unint64_t v7 = (void *)swift_task_alloc();
  v0[5] = v7;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26984F858);
  *unint64_t v7 = v0;
  v7[1] = sub_24D01F424;
  return MEMORY[0x270FA1E50](v1, v6, v8);
}

uint64_t sub_24D01F424()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_6();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_4();
  return v3();
}

uint64_t sub_24D01F500()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_24D022180;
  return sub_24D022540(1);
}

uint64_t sub_24D01F590(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B184BF0);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24D022040(a1, (uint64_t)v10);
  uint64_t v11 = sub_24D044548();
  if (__swift_getEnumTagSinglePayload((uint64_t)v10, 1, v11) == 1)
  {
    sub_24D021ED8((uint64_t)v10, &qword_26B184BF0);
  }
  else
  {
    sub_24D044538();
    (*(void (**)(char *, uint64_t))(*(void *)(v11 - 8) + 8))(v10, v11);
  }
  if (*(void *)(a3 + 16))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    uint64_t v12 = sub_24D0444E8();
    uint64_t v14 = v13;
    swift_unknownObjectRelease();
  }
  else
  {
    uint64_t v12 = 0;
    uint64_t v14 = 0;
  }
  uint64_t v15 = *v4;
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = a2;
  *(void *)(v16 + 24) = a3;
  uint64_t v17 = (void *)(v14 | v12);
  if (v14 | v12)
  {
    v20[0] = 0;
    v20[1] = 0;
    uint64_t v17 = v20;
    v20[2] = v12;
    v20[3] = v14;
  }
  v19[1] = 1;
  v19[2] = v17;
  v19[3] = v15;
  swift_task_create();
  return swift_release();
}

uint64_t sub_24D01F768(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 40) = a4;
  return MEMORY[0x270FA2498](sub_24D01F788, 0, 0);
}

uint64_t sub_24D01F788()
{
  OUTLINED_FUNCTION_5();
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  *(void *)(v0 + 48) = Strong;
  if (Strong)
  {
    return MEMORY[0x270FA2498](sub_24D01F83C, Strong, 0);
  }
  else
  {
    OUTLINED_FUNCTION_4();
    return v2();
  }
}

uint64_t sub_24D01F83C()
{
  OUTLINED_FUNCTION_5();
  *(void *)(v0 + 56) = *(void *)(*(void *)(v0 + 48) + OBJC_IVAR____TtC6DropIn18AppStateActivation_siriAnnouncement);
  swift_retain();
  return MEMORY[0x270FA2498](sub_24D01F8B4, 0, 0);
}

uint64_t sub_24D01F8B4()
{
  OUTLINED_FUNCTION_5();
  uint64_t v1 = *(void *)(v0 + 56);
  swift_release();
  if (v1) {
    swift_release();
  }
  OUTLINED_FUNCTION_4();
  return v2();
}

void sub_24D01F918()
{
  uint64_t v4 = v0;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B184BF0);
  uint64_t v6 = OUTLINED_FUNCTION_12(v5);
  MEMORY[0x270FA5388](v6);
  uint64_t v7 = OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_14();
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_23();
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26984F7B8);
  uint64_t v10 = OUTLINED_FUNCTION_12(v9);
  MEMORY[0x270FA5388](v10);
  uint64_t v11 = OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1_0();
  uint64_t v13 = v12;
  MEMORY[0x270FA5388](v14);
  OUTLINED_FUNCTION_15();
  MEMORY[0x270FA5388](v15);
  OUTLINED_FUNCTION_38();
  static ToneProvider.startToneURL.getter(v16);
  if (__swift_getEnumTagSinglePayload(v3, 1, v11) == 1)
  {
    sub_24D021ED8(v3, &qword_26984F7B8);
    sub_24D021964();
    uint64_t v17 = (void *)OUTLINED_FUNCTION_22();
    OUTLINED_FUNCTION_20(v17, v18, (uint64_t)"invalid start tone URL");
  }
  else
  {
    uint64_t v19 = OUTLINED_FUNCTION_18();
    v20(v19);
    uint64_t v21 = *(void (**)(uint64_t))(v13 + 16);
    uint64_t v22 = OUTLINED_FUNCTION_27();
    v21(v22);
    v23 = OUTLINED_FUNCTION_10((__n128)xmmword_24D046460);
    v21((uint64_t)v23);
    uint64_t v24 = *(void (**)(void))(v13 + 8);
    OUTLINED_FUNCTION_29();
    v24();
    *(_DWORD *)(v1 + *(int *)(v7 + 28)) = 1065353216;
    if (qword_26984F488 != -1) {
      swift_once();
    }
    uint64_t v25 = sub_24D022EDC(v1);
    *(void *)(v4 + OBJC_IVAR____TtC6DropIn18AppStateActivation_startTonePlayer) = v25;
    swift_retain_n();
    swift_release();
    uint64_t v26 = sub_24D044548();
    unint64_t v29 = OUTLINED_FUNCTION_11(v2, v27, v28, v26);
    v30 = (void *)OUTLINED_FUNCTION_37();
    v30[2] = v4;
    v30[3] = v29;
    v30[4] = v25;
    v30[5] = v4;
    swift_retain_n();
    sub_24D02A2E8();
    swift_release();
    swift_release();
    sub_24D021654(v1);
    OUTLINED_FUNCTION_29();
    v24();
  }
  OUTLINED_FUNCTION_30();
}

uint64_t sub_24D01FC44(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(void *)(v5 + 16) = a4;
  *(void *)(v5 + 24) = a5;
  return MEMORY[0x270FA2498](sub_24D01FC64, a5, 0);
}

uint64_t sub_24D01FC64()
{
  OUTLINED_FUNCTION_21();
  if (qword_26984F488 != -1) {
    swift_once();
  }
  sub_24D02366C();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 32) = v1;
  void *v1 = v0;
  v1[1] = sub_24D01FDD0;
  return sub_24D03CD74();
}

uint64_t sub_24D01FDD0()
{
  OUTLINED_FUNCTION_9();
  uint64_t v2 = *v1;
  OUTLINED_FUNCTION_8();
  uint64_t *v4 = v3;
  uint64_t *v4 = *v1;
  *(void *)(v3 + 40) = v0;
  swift_task_dealloc();
  uint64_t v5 = *(void *)(v2 + 24);
  if (v0) {
    uint64_t v6 = sub_24D01FF4C;
  }
  else {
    uint64_t v6 = sub_24D01FEF4;
  }
  return MEMORY[0x270FA2498](v6, v5, 0);
}

uint64_t sub_24D01FEF4()
{
  OUTLINED_FUNCTION_5();
  sub_24D01EEA8();
  OUTLINED_FUNCTION_4();
  return v0();
}

uint64_t sub_24D01FF4C()
{
  OUTLINED_FUNCTION_9();
  uint64_t v1 = *(void **)(v0 + 40);
  *(void *)(*(void *)(v0 + 24) + OBJC_IVAR____TtC6DropIn18AppStateActivation_startTonePlayer) = 0;
  swift_release();
  sub_24D023758();
  sub_24D021964();
  uint64_t v2 = (void *)OUTLINED_FUNCTION_22();
  *(void *)uint64_t v3 = 0xD000000000000019;
  *(void *)(v3 + 8) = 0x800000024D048390;
  *(unsigned char *)(v3 + 16) = 0;
  sub_24D01ED04(v2);

  OUTLINED_FUNCTION_4();
  return v4();
}

void sub_24D02001C()
{
  uint64_t v2 = v0;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B184BF0);
  uint64_t v4 = OUTLINED_FUNCTION_12(v3);
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_24();
  if (qword_26984F480 != -1) {
    swift_once();
  }
  if (byte_269851798)
  {
    OUTLINED_FUNCTION_30();
    sub_24D01EEA8();
  }
  else
  {
    type metadata accessor for DropInSiriAnnouncement();
    swift_allocObject();
    id v6 = sub_24D033B34(0);
    *(void *)(v0 + OBJC_IVAR____TtC6DropIn18AppStateActivation_siriAnnouncement) = v6;
    swift_retain();
    swift_release();
    swift_retain_n();
    uint64_t v7 = sub_24D044278();
    os_log_type_t v8 = sub_24D044618();
    if (os_log_type_enabled(v7, v8))
    {
      uint64_t v9 = (uint8_t *)OUTLINED_FUNCTION_31();
      uint64_t v18 = swift_slowAlloc();
      *(_DWORD *)uint64_t v9 = 136315138;
      uint64_t v10 = sub_24D033AD0();
      uint64_t v12 = sub_24D0390E4(v10, v11, &v18);
      OUTLINED_FUNCTION_36(v12);
      sub_24D044768();
      swift_bridgeObjectRelease();
      swift_release_n();
      _os_log_impl(&dword_24D00D000, v7, v8, "Drop In Siri Announcement %s", v9, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_7();
      OUTLINED_FUNCTION_7();
    }
    else
    {

      swift_release_n();
    }
    uint64_t v13 = sub_24D044548();
    unint64_t v16 = OUTLINED_FUNCTION_11(v1, v14, v15, v13);
    uint64_t v17 = (void *)OUTLINED_FUNCTION_37();
    v17[2] = v2;
    v17[3] = v16;
    v17[4] = v6;
    v17[5] = v2;
    swift_retain_n();
    sub_24D02A2E8();
    swift_release();
    OUTLINED_FUNCTION_30();
  }
}

uint64_t sub_24D02029C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(void *)(v5 + 16) = a5;
  id v6 = (void *)swift_task_alloc();
  *(void *)(v5 + 24) = v6;
  *id v6 = v5;
  v6[1] = sub_24D020330;
  return sub_24D033B88();
}

uint64_t sub_24D020330()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_8();
  *uint64_t v3 = v2;
  uint64_t v5 = *(void *)(v4 + 16);
  uint64_t v6 = *v1;
  OUTLINED_FUNCTION_6();
  *uint64_t v7 = v6;
  *(void *)(v8 + 32) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v9 = sub_24D0204FC;
  }
  else {
    uint64_t v9 = sub_24D020424;
  }
  return MEMORY[0x270FA2498](v9, v5, 0);
}

uint64_t sub_24D020424()
{
  OUTLINED_FUNCTION_9();
  *(void *)(*(void *)(v0 + 16) + OBJC_IVAR____TtC6DropIn18AppStateActivation_siriAnnouncement) = 0;
  swift_release();
  uint64_t v1 = sub_24D044278();
  os_log_type_t v2 = sub_24D044618();
  if (os_log_type_enabled(v1, v2))
  {
    *(_WORD *)swift_slowAlloc() = 0;
    OUTLINED_FUNCTION_35(&dword_24D00D000, v3, v4, "Drop In Siri Announcement successful");
    OUTLINED_FUNCTION_7();
  }

  sub_24D01EEA8();
  OUTLINED_FUNCTION_4();
  return v5();
}

uint64_t sub_24D0204FC()
{
  OUTLINED_FUNCTION_9();
  uint64_t v1 = sub_24D044278();
  os_log_type_t v2 = sub_24D044608();
  if (os_log_type_enabled(v1, v2))
  {
    *(_WORD *)swift_slowAlloc() = 0;
    OUTLINED_FUNCTION_35(&dword_24D00D000, v3, v4, "Drop In Siri Announcement failed");
    OUTLINED_FUNCTION_7();
  }
  uint64_t v5 = *(void **)(v0 + 32);

  sub_24D01ED48();
  sub_24D021964();
  uint64_t v6 = (void *)OUTLINED_FUNCTION_22();
  *(void *)uint64_t v7 = 0xD000000000000023;
  *(void *)(v7 + 8) = 0x800000024D048310;
  *(unsigned char *)(v7 + 16) = 1;
  sub_24D01ED04(v6);

  OUTLINED_FUNCTION_4();
  return v8();
}

void sub_24D020614()
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B184BF0);
  uint64_t v3 = OUTLINED_FUNCTION_12(v2);
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_25();
  if (qword_26984F480 != -1) {
    swift_once();
  }
  if ((byte_269851798 & 1) == 0)
  {
    uint64_t v4 = *(void **)(v1 + OBJC_IVAR____TtC6DropIn18AppStateActivation_session);
    if (v4)
    {
      uint64_t v5 = sub_24D044548();
      unint64_t v8 = OUTLINED_FUNCTION_11(v0, v6, v7, v5);
      uint64_t v9 = (void *)OUTLINED_FUNCTION_37();
      v9[2] = v1;
      v9[3] = v8;
      v9[4] = v4;
      v9[5] = v1;
      swift_retain_n();
      id v10 = v4;
      sub_24D02A2E8();
      swift_release();
    }
    else
    {
      sub_24D021964();
      uint64_t v11 = (void *)OUTLINED_FUNCTION_22();
      *(_OWORD *)uint64_t v12 = xmmword_24D046470;
      *(unsigned char *)(v12 + 16) = 2;
      sub_24D01ED04(v11);
    }
  }
}

uint64_t sub_24D020784(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(void *)(v5 + 120) = a4;
  *(void *)(v5 + 128) = a5;
  return MEMORY[0x270FA2498](sub_24D0207A4, a5, 0);
}

uint64_t sub_24D0207A4()
{
  OUTLINED_FUNCTION_9();
  uint64_t v1 = (void *)v0[15];
  v0[2] = v0;
  v0[3] = sub_24D020894;
  uint64_t v2 = swift_continuation_init();
  v0[10] = MEMORY[0x263EF8330];
  v0[11] = 0x40000000;
  v0[12] = sub_24D0342D0;
  v0[13] = &block_descriptor;
  v0[14] = v2;
  objc_msgSend(v1, sel_startWithCompletionHandler_, v0 + 10);
  return MEMORY[0x270FA23F0](v0 + 2);
}

uint64_t sub_24D020894()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_8();
  *uint64_t v2 = v1;
  *uint64_t v2 = *v0;
  uint64_t v4 = *(void *)(v3 + 48);
  *(void *)(v1 + 136) = v4;
  uint64_t v5 = *(void *)(v3 + 128);
  if (v4) {
    uint64_t v6 = sub_24D020AE8;
  }
  else {
    uint64_t v6 = sub_24D020988;
  }
  return MEMORY[0x270FA2498](v6, v5, 0);
}

uint64_t sub_24D020988()
{
  id v1 = *(id *)(v0 + 120);
  uint64_t v2 = (void *)sub_24D044278();
  os_log_type_t v3 = sub_24D044618();
  if (OUTLINED_FUNCTION_28(v3))
  {
    uint64_t v4 = *(void **)(v0 + 120);
    uint64_t v5 = (_DWORD *)OUTLINED_FUNCTION_31();
    uint64_t v12 = (void *)OUTLINED_FUNCTION_34();
    *uint64_t v5 = 138412290;
    *(void *)(v0 + 80) = v4;
    id v6 = v4;
    sub_24D044768();
    void *v12 = v4;

    OUTLINED_FUNCTION_40(&dword_24D00D000, v7, v8, "Drop in session start issued: %@");
    __swift_instantiateConcreteTypeFromMangledName(&qword_26984F7C0);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_7();
    OUTLINED_FUNCTION_7();
  }
  else
  {
    uint64_t v9 = *(void **)(v0 + 120);

    uint64_t v2 = v9;
  }

  OUTLINED_FUNCTION_4();
  return v10();
}

uint64_t sub_24D020AE8()
{
  id v1 = *(void **)(v0 + 136);
  swift_willThrow();
  id v2 = v1;
  id v3 = v1;
  uint64_t v4 = (void *)sub_24D044278();
  os_log_type_t v5 = sub_24D044608();
  if (OUTLINED_FUNCTION_28(v5))
  {
    id v6 = *(void **)(v0 + 136);
    uint64_t v7 = (_DWORD *)OUTLINED_FUNCTION_31();
    uint64_t v8 = (void *)OUTLINED_FUNCTION_34();
    *uint64_t v7 = 138412290;
    id v9 = v6;
    uint64_t v10 = _swift_stdlib_bridgeErrorToNSError();
    *(void *)(v0 + 80) = v10;
    sub_24D044768();
    void *v8 = v10;

    OUTLINED_FUNCTION_40(&dword_24D00D000, v11, v12, "Failed to start Drop In session. Error: %@");
    __swift_instantiateConcreteTypeFromMangledName(&qword_26984F7C0);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_7();
    OUTLINED_FUNCTION_7();
  }
  else
  {
    uint64_t v13 = *(void **)(v0 + 136);
  }
  uint64_t v14 = *(void **)(v0 + 136);
  sub_24D01ED48();
  sub_24D01ED04(v14);

  OUTLINED_FUNCTION_4();
  return v15();
}

void sub_24D020C7C()
{
  uint64_t v6 = v0;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B184BF0);
  uint64_t v8 = OUTLINED_FUNCTION_12(v7);
  MEMORY[0x270FA5388](v8);
  uint64_t v9 = OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_14();
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_23();
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26984F7B8);
  uint64_t v12 = OUTLINED_FUNCTION_12(v11);
  MEMORY[0x270FA5388](v12);
  uint64_t v13 = OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1_0();
  uint64_t v15 = v14;
  MEMORY[0x270FA5388](v16);
  OUTLINED_FUNCTION_15();
  MEMORY[0x270FA5388](v17);
  OUTLINED_FUNCTION_38();
  static ToneProvider.ongoingToneURL.getter(v18);
  if (__swift_getEnumTagSinglePayload(v5, 1, v13) == 1)
  {
    sub_24D021ED8(v5, &qword_26984F7B8);
    uint64_t v19 = sub_24D044278();
    os_log_type_t v20 = sub_24D044608();
    if (OUTLINED_FUNCTION_28(v20))
    {
      uint64_t v21 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v21 = 0;
      _os_log_impl(&dword_24D00D000, v19, (os_log_type_t)v1, "Invalid ongoing tone URL", v21, 2u);
      OUTLINED_FUNCTION_7();
    }

    sub_24D01EEA8();
  }
  else
  {
    uint64_t v22 = OUTLINED_FUNCTION_18();
    v23(v22);
    uint64_t v24 = *(void (**)(uint64_t))(v15 + 16);
    uint64_t v25 = OUTLINED_FUNCTION_27();
    v24(v25);
    uint64_t v26 = OUTLINED_FUNCTION_10((__n128)xmmword_24D046480);
    v24((uint64_t)v26);
    uint64_t v27 = *(void (**)(uint64_t, uint64_t))(v15 + 8);
    v27(v1, v13);
    *(_DWORD *)(v2 + *(int *)(v9 + 28)) = 1065353216;
    if (qword_26984F488 != -1) {
      swift_once();
    }
    uint64_t v28 = sub_24D022EDC(v2);
    *(void *)(v6 + OBJC_IVAR____TtC6DropIn18AppStateActivation_ongoingTonePlayer) = v28;
    swift_retain_n();
    swift_release();
    uint64_t v29 = sub_24D044548();
    unint64_t v32 = OUTLINED_FUNCTION_11(v4, v30, v31, v29);
    v33 = (void *)OUTLINED_FUNCTION_37();
    v33[2] = v6;
    v33[3] = v32;
    v33[4] = v28;
    v33[5] = v6;
    swift_retain_n();
    sub_24D02A2E8();
    swift_release();
    swift_release();
    sub_24D021654(v2);
    v27(v3, v13);
  }
  OUTLINED_FUNCTION_30();
}

uint64_t sub_24D0210CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(void *)(v5 + 24) = a5;
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v5 + 32) = v6;
  *uint64_t v6 = v5;
  v6[1] = sub_24D021160;
  return sub_24D03CD74();
}

uint64_t sub_24D021160()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_8();
  *uint64_t v3 = v2;
  uint64_t v5 = *(void *)(v4 + 24);
  uint64_t v6 = *v1;
  OUTLINED_FUNCTION_6();
  *uint64_t v7 = v6;
  *(void *)(v8 + 40) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v9 = sub_24D021254;
  }
  else {
    uint64_t v9 = sub_24D01FEF4;
  }
  return MEMORY[0x270FA2498](v9, v5, 0);
}

uint64_t sub_24D021254()
{
  uint64_t v1 = (void *)v0[5];
  *(void *)(v0[3] + OBJC_IVAR____TtC6DropIn18AppStateActivation_ongoingTonePlayer) = 0;
  swift_release();
  id v2 = v1;
  id v3 = v1;
  uint64_t v4 = sub_24D044278();
  os_log_type_t v5 = sub_24D044608();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (void *)v0[5];
    uint64_t v7 = (uint8_t *)OUTLINED_FUNCTION_31();
    uint64_t v8 = (void *)OUTLINED_FUNCTION_34();
    *(_DWORD *)uint64_t v7 = 138412290;
    id v9 = v6;
    uint64_t v10 = _swift_stdlib_bridgeErrorToNSError();
    v0[2] = v10;
    sub_24D044768();
    void *v8 = v10;

    _os_log_impl(&dword_24D00D000, v4, v5, "Failed to schedule ongoing tone: %@", v7, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26984F7C0);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_7();
    OUTLINED_FUNCTION_7();
  }
  else
  {
    uint64_t v11 = (void *)v0[5];
  }
  sub_24D01EEA8();
  OUTLINED_FUNCTION_4();
  return v12();
}

uint64_t sub_24D021418()
{
  sub_24D01DD94(*(void *)(v0 + 112));

  uint64_t v1 = v0 + OBJC_IVAR____TtC6DropIn18AppStateActivation_logger;
  sub_24D044298();
  OUTLINED_FUNCTION_14();
  (*(void (**)(uint64_t))(v2 + 8))(v1);

  swift_release();
  swift_release();
  swift_release();
  swift_defaultActor_destroy();
  return v0;
}

uint64_t sub_24D0214CC()
{
  sub_24D021418();
  return MEMORY[0x270FA2418](v0);
}

uint64_t sub_24D0214F8()
{
  return type metadata accessor for AppStateActivation();
}

uint64_t type metadata accessor for AppStateActivation()
{
  uint64_t result = qword_26984F7A8;
  if (!qword_26984F7A8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_24D021548()
{
  uint64_t result = sub_24D044298();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

void sub_24D021608()
{
}

void sub_24D021610()
{
}

uint64_t __swift_getEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t sub_24D021654(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for DropInPlayer.Settings(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_24D0216B0(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
  v4[1] = sub_24D02178C;
  return v6(a1);
}

uint64_t sub_24D02178C()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_6();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_4();
  return v3();
}

uint64_t __swift_storeEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

unint64_t sub_24D021878()
{
  unint64_t result = qword_26984F7D0;
  if (!qword_26984F7D0)
  {
    type metadata accessor for AppStateActivation();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26984F7D0);
  }
  return result;
}

uint64_t sub_24D0218CC()
{
  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_13();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_2(v0);
  void *v1 = v2;
  v1[1] = sub_24D022180;
  uint64_t v3 = OUTLINED_FUNCTION_3();
  return sub_24D0210CC(v3, v4, v5, v6, v7);
}

unint64_t sub_24D021964()
{
  unint64_t result = qword_26984F7E0;
  if (!qword_26984F7E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_26984F7E0);
  }
  return result;
}

uint64_t sub_24D0219B0()
{
  swift_unknownObjectRelease();

  swift_release();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_24D0219F8()
{
  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_13();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_2(v0);
  void *v1 = v2;
  v1[1] = sub_24D021A90;
  uint64_t v3 = OUTLINED_FUNCTION_3();
  return sub_24D020784(v3, v4, v5, v6, v7);
}

uint64_t sub_24D021A90()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_6();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_4();
  return v3();
}

uint64_t sub_24D021B54()
{
  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_13();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_2(v0);
  void *v1 = v2;
  v1[1] = sub_24D022180;
  uint64_t v3 = OUTLINED_FUNCTION_3();
  return sub_24D02029C(v3, v4, v5, v6, v7);
}

uint64_t objectdestroyTm()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_24D021C38()
{
  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_13();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_2(v0);
  void *v1 = v2;
  v1[1] = sub_24D022180;
  uint64_t v3 = OUTLINED_FUNCTION_3();
  return sub_24D01FC44(v3, v4, v5, v6, v7);
}

uint64_t sub_24D021CD4()
{
  OUTLINED_FUNCTION_9();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_2(v0);
  void *v1 = v2;
  v1[1] = sub_24D022180;
  uint64_t v3 = OUTLINED_FUNCTION_26();
  return sub_24D01EFC8(v3, v4, v5, v6);
}

uint64_t sub_24D021D6C()
{
  OUTLINED_FUNCTION_9();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v5 = swift_task_alloc();
  uint64_t v6 = (void *)OUTLINED_FUNCTION_2(v5);
  *uint64_t v6 = v7;
  v6[1] = sub_24D022180;
  return sub_24D01F1F4(v4, v2, v0);
}

uint64_t sub_24D021E0C()
{
  swift_unknownObjectRelease();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_24D021E44()
{
  OUTLINED_FUNCTION_9();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_2(v0);
  void *v1 = v2;
  v1[1] = sub_24D022180;
  OUTLINED_FUNCTION_32();
  return sub_24D01F500();
}

uint64_t sub_24D021ED8(uint64_t a1, uint64_t *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_14();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
}

uint64_t sub_24D021F2C()
{
  swift_weakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t objectdestroy_54Tm()
{
  swift_unknownObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_24D021FA8()
{
  OUTLINED_FUNCTION_9();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_2(v0);
  void *v1 = v2;
  v1[1] = sub_24D022180;
  uint64_t v3 = OUTLINED_FUNCTION_26();
  return sub_24D01F768(v3, v4, v5, v6);
}

uint64_t sub_24D022040(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B184BF0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24D0220A8()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_24D0220E0()
{
  OUTLINED_FUNCTION_9();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_2(v0);
  void *v1 = v2;
  v1[1] = sub_24D021A90;
  uint64_t v3 = OUTLINED_FUNCTION_32();
  return v4(v3);
}

uint64_t OUTLINED_FUNCTION_2(uint64_t result)
{
  *(void *)(v1 + 16) = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_3()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_4()
{
  return v0 + 8;
}

void OUTLINED_FUNCTION_7()
{
  JUMPOUT(0x25331C7C0);
}

char *OUTLINED_FUNCTION_10(__n128 a1)
{
  *uint64_t v2 = a1;
  v2[1].n128_u64[0] = 0x4014000000000000;
  return (char *)v2 + *(int *)(v1 + 24);
}

unint64_t OUTLINED_FUNCTION_11(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  __swift_storeEnumTagSinglePayload(a1, 1, 1, a4);
  return sub_24D021878();
}

uint64_t OUTLINED_FUNCTION_12(uint64_t a1)
{
  return a1 - 8;
}

uint64_t OUTLINED_FUNCTION_16()
{
  return type metadata accessor for DropInPlayer.Settings(0);
}

uint64_t OUTLINED_FUNCTION_17()
{
  return sub_24D0441A8();
}

uint64_t OUTLINED_FUNCTION_18()
{
  return v0;
}

void OUTLINED_FUNCTION_19(char a1@<W8>)
{
  *(unsigned char *)(v1 + 128) = a1;
  sub_24D01E9A4();
}

uint64_t OUTLINED_FUNCTION_20@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  *(void *)a2 = v3 & 0xFFFFFFFFFFFFLL | 0xD000000000000000;
  *(void *)(a2 + 8) = (a3 - 32) | 0x8000000000000000;
  *(unsigned char *)(a2 + 16) = 0;
  return sub_24D01ED04(a1);
}

uint64_t OUTLINED_FUNCTION_22()
{
  return swift_allocError();
}

uint64_t OUTLINED_FUNCTION_26()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_27()
{
  return v0;
}

BOOL OUTLINED_FUNCTION_28(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_31()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_32()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_33()
{
  return __swift_storeEnumTagSinglePayload(v0, 1, 1, v1);
}

uint64_t OUTLINED_FUNCTION_34()
{
  return swift_slowAlloc();
}

void OUTLINED_FUNCTION_35(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v6, v4, a4, v5, 2u);
}

uint64_t OUTLINED_FUNCTION_36(uint64_t a1)
{
  *(void *)(v1 - 96) = a1;
  return v1 - 96;
}

uint64_t OUTLINED_FUNCTION_37()
{
  return swift_allocObject();
}

void OUTLINED_FUNCTION_40(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v5, v6, a4, v4, 0xCu);
}

uint64_t sub_24D022540(int a1)
{
  *(_DWORD *)(v1 + 168) = a1;
  uint64_t v2 = sub_24D044328();
  *(void *)(v1 + 128) = v2;
  *(void *)(v1 + 136) = *(void *)(v2 - 8);
  *(void *)(v1 + 144) = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24D022600, 0, 0);
}

uint64_t sub_24D022600()
{
  uint64_t v2 = *(void *)(v0 + 136);
  uint64_t v1 = *(void *)(v0 + 144);
  uint64_t v3 = *(void *)(v0 + 128);
  uint64_t v4 = *(unsigned int *)(v0 + 168);
  id v5 = objc_msgSend(self, sel_localOrigin);
  id v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F548F8]), sel_initWithOrigin_, v5);
  *(void *)(v0 + 152) = v6;

  sub_24D01CFDC();
  (*(void (**)(uint64_t, void, uint64_t))(v2 + 104))(v1, *MEMORY[0x263F8F068], v3);
  uint64_t v7 = sub_24D0446B8();
  *(void *)(v0 + 160) = v7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  *(void *)(v0 + 16) = v0;
  *(void *)(v0 + 56) = v0 + 120;
  *(void *)(v0 + 24) = sub_24D0227D4;
  uint64_t v8 = swift_continuation_init();
  *(void *)(v0 + 80) = MEMORY[0x263EF8330];
  *(void *)(v0 + 88) = 0x40000000;
  *(void *)(v0 + 96) = sub_24D02292C;
  *(void *)(v0 + 104) = &block_descriptor_0;
  *(void *)(v0 + 112) = v8;
  objc_msgSend(v6, sel_sendCommand_options_queue_completion_, v4, 0, v7, v0 + 80);
  return MEMORY[0x270FA23F0](v0 + 16);
}

uint64_t sub_24D0227D4()
{
  return MEMORY[0x270FA2498](sub_24D0228B4, 0, 0);
}

uint64_t sub_24D0228B4()
{
  uint64_t v1 = *(void **)(v0 + 160);

  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_24D02292C(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  return sub_24D0339DC(v2, (uint64_t)v3);
}

uint64_t sub_24D022968()
{
  id v0 = objc_msgSend(self, sel_processInfo);
  id v1 = objc_msgSend(v0, sel_processName);

  uint64_t v2 = sub_24D044428();
  uint64_t v4 = v3;

  if (v2 == 0x747365746378 && v4 == 0xE600000000000000)
  {
    uint64_t result = swift_bridgeObjectRelease();
    char v6 = 1;
  }
  else
  {
    char v6 = sub_24D0448E8();
    uint64_t result = swift_bridgeObjectRelease();
  }
  byte_269851798 = v6 & 1;
  return result;
}

uint64_t sub_24D022A44()
{
  swift_weakInit();
  swift_weakAssign();
  swift_release();
  return v0;
}

uint64_t sub_24D022A84()
{
  swift_weakDestroy();
  return MEMORY[0x270FA0228](v0, 24, 7);
}

id sub_24D022ABC()
{
  id v1 = *(void **)(v0 + 48);
  if (v1)
  {
    id v2 = *(id *)(v0 + 48);
  }
  else
  {
    uint64_t v3 = v0;
    id v4 = sub_24D01CF24();
    id v5 = *(void **)(v0 + 48);
    *(void *)(v3 + 48) = v4;
    id v2 = v4;

    id v1 = 0;
  }
  id v6 = v1;
  return v2;
}

void *sub_24D022B14()
{
  type metadata accessor for DropInPlayerManager();
  swift_allocObject();
  uint64_t result = sub_24D022BAC();
  qword_26984F878 = (uint64_t)result;
  return result;
}

uint64_t static DropInPlayerManager.shared.getter()
{
  if (qword_26984F488 != -1) {
    swift_once();
  }
  return swift_retain();
}

void *sub_24D022BAC()
{
  id v1 = v0;
  uint64_t v2 = sub_24D044678();
  uint64_t v12 = *(void *)(v2 - 8);
  uint64_t v13 = v2;
  MEMORY[0x270FA5388](v2);
  uint64_t v11 = (char *)&v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_24D044648();
  MEMORY[0x270FA5388](v4);
  uint64_t v5 = sub_24D044358();
  MEMORY[0x270FA5388](v5 - 8);
  v0[6] = 0;
  id v6 = objc_msgSend(self, sel_sharedInstance);
  uint64_t v7 = (void *)*MEMORY[0x263EF9040];
  v1[2] = v6;
  v1[3] = v7;
  uint64_t v8 = MEMORY[0x263F8EE78];
  v1[4] = MEMORY[0x263F8EE78];
  sub_24D025798(0, (unint64_t *)&qword_26B184C80);
  id v9 = v7;
  sub_24D01CE88();
  sub_24D044348();
  uint64_t v14 = v8;
  sub_24D0257D4(&qword_26984F890, MEMORY[0x263F8F0F8]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26984F898);
  sub_24D02581C(&qword_26984F8A0, &qword_26984F898);
  sub_24D044798();
  (*(void (**)(char *, void, uint64_t))(v12 + 104))(v11, *MEMORY[0x263F8F130], v13);
  v1[5] = sub_24D0446A8();
  sub_24D024720();
  return v1;
}

id *DropInPlayerManager.deinit()
{
  sub_24D024CFC();

  swift_bridgeObjectRelease();
  return v0;
}

uint64_t DropInPlayerManager.__deallocating_deinit()
{
  DropInPlayerManager.deinit();
  return MEMORY[0x270FA0228](v0, 56, 7);
}

uint64_t sub_24D022EDC(uint64_t a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = type metadata accessor for DropInPlayer.Settings(0);
  MEMORY[0x270FA5388](v5 - 8);
  OUTLINED_FUNCTION_1_1();
  uint64_t v8 = v7 - v6;
  uint64_t v9 = sub_24D044398();
  OUTLINED_FUNCTION_1_0();
  uint64_t v11 = v10;
  MEMORY[0x270FA5388](v12);
  OUTLINED_FUNCTION_1_1();
  uint64_t v15 = v14 - v13;
  uint64_t v16 = *(void **)(v3 + 40);
  *(void *)(v14 - v13) = v16;
  (*(void (**)(uint64_t, void, uint64_t))(v11 + 104))(v14 - v13, *MEMORY[0x263F8F0D8], v9);
  uint64_t v17 = v16;
  char v18 = sub_24D0443B8();
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(v11 + 8))(v15, v9);
  if (v18)
  {
    sub_24D024DC8(a1, v8);
    type metadata accessor for DropInPlayer(0);
    swift_allocObject();
    uint64_t v20 = sub_24D03CA88(v8);
    if (v2) {
      return v20;
    }
    sub_24D03CBE4(*(void *)(v3 + 16), 0);
    uint64_t v21 = swift_allocObject();
    *(void *)(v21 + 16) = v3;
    *(void *)(v21 + 24) = v20;
    uint64_t v22 = swift_allocObject();
    *(void *)(v22 + 16) = sub_24D024E6C;
    *(void *)(v22 + 24) = v21;
    aBlock[4] = sub_24D024E84;
    aBlock[5] = v22;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_24D023644;
    aBlock[3] = &block_descriptor_4;
    v23 = _Block_copy(aBlock);
    swift_retain();
    swift_retain();
    swift_retain();
    swift_release();
    dispatch_sync(v17, v23);
    _Block_release(v23);
    char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
    swift_release();
    uint64_t result = swift_release();
    if ((isEscapingClosureAtFileLocation & 1) == 0) {
      return v20;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_24D0231A0(uint64_t a1)
{
  uint64_t v2 = (unint64_t *)(a1 + 32);
  swift_beginAccess();
  unint64_t v3 = *(void *)(a1 + 32);
  if (v3 >> 62)
  {
LABEL_67:
    swift_bridgeObjectRetain();
    uint64_t v4 = sub_24D044888();
    if (v4) {
      goto LABEL_3;
    }
LABEL_10:
    swift_bridgeObjectRelease();
    if (*v2 >> 62) {
      goto LABEL_71;
    }
    uint64_t v5 = *(void *)((*v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
    goto LABEL_12;
  }
  uint64_t v4 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (!v4) {
    goto LABEL_10;
  }
LABEL_3:
  uint64_t v5 = 0;
  while (1)
  {
    if ((v3 & 0xC000000000000001) != 0) {
      MEMORY[0x25331BE00](v5, v3);
    }
    else {
      swift_retain();
    }
    uint64_t Strong = swift_weakLoadStrong();
    swift_release();
    swift_release();
    if (!Strong) {
      break;
    }
    uint64_t v7 = v5 + 1;
    if (__OFADD__(v5, 1))
    {
      __break(1u);
LABEL_57:
      __break(1u);
LABEL_58:
      __break(1u);
LABEL_59:
      __break(1u);
LABEL_60:
      __break(1u);
LABEL_61:
      __break(1u);
LABEL_62:
      __break(1u);
LABEL_63:
      __break(1u);
LABEL_64:
      __break(1u);
LABEL_65:
      __break(1u);
LABEL_66:
      __break(1u);
      goto LABEL_67;
    }
    ++v5;
    if (v7 == v4) {
      goto LABEL_10;
    }
  }
  swift_bridgeObjectRelease();
  if (__OFADD__(v5, 1))
  {
    __break(1u);
  }
  else
  {
    unint64_t v3 = *v2;
    if (!(*v2 >> 62))
    {
      uint64_t v10 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
      goto LABEL_19;
    }
  }
  swift_bridgeObjectRetain();
  uint64_t v10 = sub_24D044888();
  swift_bridgeObjectRelease();
LABEL_19:
  if (v5 + 1 != v10)
  {
    uint64_t v11 = v5 + 5;
    do
    {
      unint64_t v12 = v11 - 4;
      unint64_t v13 = *v2;
      if ((*v2 & 0xC000000000000001) != 0)
      {
        unint64_t v3 = MEMORY[0x25331BE00](v11 - 4);
      }
      else
      {
        if ((v12 & 0x8000000000000000) != 0) {
          goto LABEL_57;
        }
        if (v12 >= *(void *)((v13 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
          goto LABEL_58;
        }
        unint64_t v3 = *(void *)(v13 + 8 * v11);
        swift_retain();
      }
      uint64_t v14 = swift_weakLoadStrong();
      swift_release();
      swift_release();
      if (v14)
      {
        if (v12 != v5)
        {
          unint64_t v3 = *v2;
          if ((*v2 & 0xC000000000000001) != 0)
          {
            uint64_t v15 = MEMORY[0x25331BE00](v5, *v2);
            unint64_t v3 = *v2;
          }
          else
          {
            if (v5 < 0) {
              goto LABEL_61;
            }
            if ((unint64_t)v5 >= *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
              goto LABEL_62;
            }
            uint64_t v15 = *(void *)(v3 + 8 * v5 + 32);
            swift_retain();
          }
          if ((v3 & 0xC000000000000001) != 0)
          {
            uint64_t v16 = MEMORY[0x25331BE00](v11 - 4, v3);
            unint64_t v3 = *v2;
          }
          else
          {
            if ((v12 & 0x8000000000000000) != 0) {
              goto LABEL_63;
            }
            if (v12 >= *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
              goto LABEL_64;
            }
            uint64_t v16 = *(void *)(v3 + 8 * v11);
            swift_retain();
          }
          int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
          *uint64_t v2 = v3;
          if (!isUniquelyReferenced_nonNull_bridgeObject
            || (v3 & 0x8000000000000000) != 0
            || (v3 & 0x4000000000000000) != 0)
          {
            sub_24D025714(v3);
            unint64_t v3 = v18;
            *uint64_t v2 = v18;
          }
          *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 8 * v5 + 0x20) = v16;
          swift_release();
          sub_24D0444B8();
          unint64_t v3 = *v2;
          int v19 = swift_isUniquelyReferenced_nonNull_bridgeObject();
          *uint64_t v2 = v3;
          if (!v19 || (v3 & 0x8000000000000000) != 0 || (v3 & 0x4000000000000000) != 0)
          {
            sub_24D025714(v3);
            unint64_t v3 = v20;
            *uint64_t v2 = v20;
          }
          if ((v12 & 0x8000000000000000) != 0) {
            goto LABEL_65;
          }
          if (v12 >= *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
            goto LABEL_66;
          }
          *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 8 * v11) = v15;
          swift_release();
          unint64_t v3 = (unint64_t)v2;
          sub_24D0444B8();
        }
        if (__OFADD__(v5++, 1)) {
          goto LABEL_60;
        }
      }
      uint64_t v22 = v11 - 3;
      if (__OFADD__(v12, 1)) {
        goto LABEL_59;
      }
      unint64_t v3 = *v2;
      if (*v2 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v23 = sub_24D044888();
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v23 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
      }
      ++v11;
    }
    while (v22 != v23);
  }
  while (1)
  {
LABEL_12:
    if (*v2 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v8 = sub_24D044888();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v8 = *(void *)((*v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    if (v8 >= v5) {
      break;
    }
    __break(1u);
LABEL_71:
    swift_bridgeObjectRetain();
    uint64_t v5 = sub_24D044888();
    swift_bridgeObjectRelease();
  }
  sub_24D025484(v5, v8);
  type metadata accessor for DropInPlayerManager.WeakDropInPlayer();
  swift_allocObject();
  swift_retain();
  sub_24D022A44();
  MEMORY[0x25331BA80]();
  sub_24D02A070(*(void *)((*v2 & 0xFFFFFFFFFFFFFF8) + 0x10));
  sub_24D0444D8();
  sub_24D0444B8();
  return swift_endAccess();
}

uint64_t sub_24D02361C(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_24D023644(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

void sub_24D02366C()
{
  v4[1] = *(id *)MEMORY[0x263EF8340];
  if (qword_26984F480 != -1) {
    swift_once();
  }
  if ((byte_269851798 & 1) == 0)
  {
    sub_24D02459C();
    uint64_t v1 = *(void **)(v0 + 16);
    v4[0] = 0;
    if (objc_msgSend(v1, sel_setActive_error_, 1, v4))
    {
      id v2 = v4[0];
    }
    else
    {
      id v3 = v4[0];
      sub_24D044178();

      swift_willThrow();
    }
  }
}

void sub_24D023758()
{
  v7[1] = *(id *)MEMORY[0x263EF8340];
  if (qword_26984F480 != -1) {
    swift_once();
  }
  if ((byte_269851798 & 1) == 0)
  {
    uint64_t v1 = *(void **)(v0 + 16);
    if (objc_msgSend(v1, sel_isActive))
    {
      v7[0] = 0;
      unsigned int v2 = objc_msgSend(v1, sel_setActive_withOptions_error_, 0, 0, v7);
      id v3 = v7[0];
      if (v2)
      {
        id v4 = v3;
      }
      else
      {
        id v5 = v7[0];
        uint64_t v6 = (void *)sub_24D044178();

        swift_willThrow();
      }
    }
  }
}

uint64_t sub_24D023898()
{
  return sub_24D023DEC((uint64_t)sub_24D025790, (uint64_t)&block_descriptor_36);
}

uint64_t sub_24D0238B8()
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (!result) {
    return result;
  }
  uint64_t v2 = result;
  id v3 = (uint64_t *)(result + 32);
  swift_beginAccess();
  unint64_t v4 = *(void *)(v2 + 32);
  if (v4 >> 62) {
    goto LABEL_79;
  }
  uint64_t v5 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v5; uint64_t v5 = sub_24D044888())
  {
    uint64_t v6 = 0;
    while (1)
    {
      if ((v4 & 0xC000000000000001) != 0)
      {
        unint64_t v0 = MEMORY[0x25331BE00](v6, v4);
      }
      else
      {
        unint64_t v0 = *(void *)(v4 + 8 * v6 + 32);
        swift_retain();
      }
      uint64_t Strong = swift_weakLoadStrong();
      swift_release();
      swift_release();
      if (!Strong)
      {
        swift_bridgeObjectRelease();
        unint64_t v0 = v6 + 1;
        if (!__OFADD__(v6, 1))
        {
          if (!((unint64_t)*v3 >> 62))
          {
            uint64_t v12 = *(void *)((*v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
            goto LABEL_31;
          }
          goto LABEL_91;
        }
        goto LABEL_90;
      }
      uint64_t v8 = v6 + 1;
      if (__OFADD__(v6, 1)) {
        break;
      }
      ++v6;
      if (v8 == v5) {
        goto LABEL_11;
      }
    }
    __break(1u);
LABEL_69:
    __break(1u);
LABEL_70:
    __break(1u);
LABEL_71:
    __break(1u);
LABEL_72:
    __break(1u);
LABEL_73:
    __break(1u);
LABEL_74:
    __break(1u);
LABEL_75:
    __break(1u);
LABEL_76:
    __break(1u);
LABEL_77:
    __break(1u);
LABEL_78:
    __break(1u);
LABEL_79:
    swift_bridgeObjectRetain();
  }
LABEL_11:
  swift_bridgeObjectRelease();
  if ((unint64_t)*v3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v6 = sub_24D044888();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v6 = *(void *)((*v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  while (1)
  {
    if ((unint64_t)*v3 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v9 = sub_24D044888();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v9 = *(void *)((*v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    if (v9 < v6)
    {
      __break(1u);
    }
    else
    {
      sub_24D025484(v6, v9);
      swift_endAccess();
      uint64_t v6 = *v3;
      if (!((unint64_t)*v3 >> 62))
      {
        uint64_t v10 = *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10);
        swift_bridgeObjectRetain_n();
        if (!v10) {
          goto LABEL_26;
        }
        goto LABEL_18;
      }
    }
    if (v6 < 0) {
      id v3 = (uint64_t *)v6;
    }
    else {
      id v3 = (uint64_t *)(v6 & 0xFFFFFFFFFFFFFF8);
    }
    swift_bridgeObjectRetain_n();
    uint64_t v10 = sub_24D044888();
    if (!v10) {
      goto LABEL_26;
    }
LABEL_18:
    if (v10 >= 1) {
      break;
    }
    __break(1u);
LABEL_90:
    __break(1u);
LABEL_91:
    swift_bridgeObjectRetain();
    uint64_t v12 = sub_24D044888();
    swift_bridgeObjectRelease();
LABEL_31:
    if (v0 != v12)
    {
      uint64_t v13 = v6 + 5;
      do
      {
        unint64_t v4 = v13 - 4;
        if ((*v3 & 0xC000000000000001) != 0)
        {
          MEMORY[0x25331BE00](v13 - 4);
        }
        else
        {
          if ((v4 & 0x8000000000000000) != 0) {
            goto LABEL_69;
          }
          if (v4 >= *(void *)((*v3 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
            goto LABEL_70;
          }
          swift_retain();
        }
        unint64_t v0 = swift_weakLoadStrong();
        swift_release();
        swift_release();
        if (v0)
        {
          if (v4 != v6)
          {
            unint64_t v0 = *v3;
            if ((*v3 & 0xC000000000000001) != 0)
            {
              uint64_t v14 = MEMORY[0x25331BE00](v6, *v3);
              unint64_t v0 = *v3;
            }
            else
            {
              if (v6 < 0) {
                goto LABEL_73;
              }
              if ((unint64_t)v6 >= *(void *)((v0 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
                goto LABEL_74;
              }
              uint64_t v14 = *(void *)(v0 + 8 * v6 + 32);
              swift_retain();
            }
            if ((v0 & 0xC000000000000001) != 0)
            {
              uint64_t v15 = MEMORY[0x25331BE00](v13 - 4, v0);
              unint64_t v0 = *v3;
            }
            else
            {
              if ((v4 & 0x8000000000000000) != 0) {
                goto LABEL_75;
              }
              if (v4 >= *(void *)((v0 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
                goto LABEL_76;
              }
              uint64_t v15 = *(void *)(v0 + 8 * v13);
              swift_retain();
            }
            int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
            *id v3 = v0;
            if (!isUniquelyReferenced_nonNull_bridgeObject
              || (v0 & 0x8000000000000000) != 0
              || (v0 & 0x4000000000000000) != 0)
            {
              sub_24D025714(v0);
              unint64_t v0 = v17;
              *id v3 = v17;
            }
            *(void *)((v0 & 0xFFFFFFFFFFFFFF8) + 8 * v6 + 0x20) = v15;
            swift_release();
            sub_24D0444B8();
            unint64_t v0 = *v3;
            int v18 = swift_isUniquelyReferenced_nonNull_bridgeObject();
            *id v3 = v0;
            if (!v18 || (v0 & 0x8000000000000000) != 0 || (v0 & 0x4000000000000000) != 0)
            {
              sub_24D025714(v0);
              unint64_t v0 = v19;
              *id v3 = v19;
            }
            if ((v4 & 0x8000000000000000) != 0) {
              goto LABEL_77;
            }
            if (v4 >= *(void *)((v0 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
              goto LABEL_78;
            }
            *(void *)((v0 & 0xFFFFFFFFFFFFFF8) + 8 * v13) = v14;
            swift_release();
            sub_24D0444B8();
          }
          if (__OFADD__(v6++, 1)) {
            goto LABEL_72;
          }
        }
        unint64_t v0 = v13 - 3;
        if (__OFADD__(v4, 1)) {
          goto LABEL_71;
        }
        if ((unint64_t)*v3 >> 62)
        {
          swift_bridgeObjectRetain();
          uint64_t v21 = sub_24D044888();
          swift_bridgeObjectRelease();
        }
        else
        {
          uint64_t v21 = *(void *)((*v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
        }
        ++v13;
      }
      while (v0 != v21);
    }
  }
  for (uint64_t i = 0; i != v10; ++i)
  {
    if ((v6 & 0xC000000000000001) != 0) {
      MEMORY[0x25331BE00](i, v6);
    }
    else {
      swift_retain();
    }
    if (swift_weakLoadStrong())
    {
      sub_24D03D0D0();
      swift_release();
    }
    swift_release();
  }
LABEL_26:
  swift_release();
  return swift_bridgeObjectRelease_n();
}

uint64_t sub_24D023DCC()
{
  return sub_24D023DEC((uint64_t)sub_24D025398, (uint64_t)&block_descriptor_32);
}

uint64_t sub_24D023DEC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24D044318();
  OUTLINED_FUNCTION_1_0();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_1_1();
  uint64_t v10 = v9 - v8;
  uint64_t v20 = sub_24D044358();
  OUTLINED_FUNCTION_1_0();
  uint64_t v12 = v11;
  MEMORY[0x270FA5388](v13);
  OUTLINED_FUNCTION_1_1();
  uint64_t v16 = v15 - v14;
  uint64_t v17 = swift_allocObject();
  swift_weakInit();
  aBlock[4] = a1;
  aBlock[5] = v17;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_24D025B94;
  aBlock[3] = a2;
  int v18 = _Block_copy(aBlock);
  swift_retain();
  sub_24D044338();
  sub_24D0257D4((unint64_t *)&qword_26B184C50, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B184C60);
  sub_24D02581C((unint64_t *)&qword_26B184C68, &qword_26B184C60);
  sub_24D044798();
  MEMORY[0x25331BCA0](0, v16, v10, v18);
  _Block_release(v18);
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v10, v4);
  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v16, v20);
  swift_release();
  return swift_release();
}

uint64_t sub_24D02403C()
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v2 = (unint64_t *)(result + 32);
    swift_beginAccess();
    unint64_t v3 = *(void *)(v1 + 32);
    if (v3 >> 62) {
      goto LABEL_80;
    }
    uint64_t v4 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v4) {
      goto LABEL_4;
    }
LABEL_11:
    swift_bridgeObjectRelease();
    if (*v2 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v5 = sub_24D044888();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v5 = *(void *)((*v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    while (1)
    {
      unint64_t v3 = *v2;
      if (*v2 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v8 = sub_24D044888();
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v8 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
      }
      if (v8 < v5)
      {
        __break(1u);
      }
      else
      {
        sub_24D025484(v5, v8);
        swift_endAccess();
        unint64_t v3 = *v2;
        if (!(*v2 >> 62))
        {
          uint64_t v9 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
          swift_bridgeObjectRetain_n();
          swift_retain();
          if (!v9) {
            goto LABEL_26;
          }
          goto LABEL_18;
        }
      }
      swift_bridgeObjectRetain_n();
      swift_retain();
      uint64_t v9 = sub_24D044888();
      if (!v9)
      {
LABEL_26:
        swift_release_n();
        return swift_bridgeObjectRelease_n();
      }
LABEL_18:
      uint64_t v10 = 4;
      while (1)
      {
        uint64_t v2 = (unint64_t *)(v10 - 4);
        if ((v3 & 0xC000000000000001) != 0) {
          MEMORY[0x25331BE00](v10 - 4, v3);
        }
        else {
          swift_retain();
        }
        uint64_t v11 = v10 - 3;
        if (__OFADD__(v2, 1)) {
          break;
        }
        if (swift_weakLoadStrong())
        {
          sub_24D03CBE4(*(void *)(v1 + 16), 1);
          swift_release();
        }
        swift_release();
        ++v10;
        if (v11 == v9) {
          goto LABEL_26;
        }
      }
      __break(1u);
LABEL_69:
      __break(1u);
LABEL_70:
      __break(1u);
LABEL_71:
      __break(1u);
LABEL_72:
      __break(1u);
LABEL_73:
      __break(1u);
LABEL_74:
      __break(1u);
LABEL_75:
      __break(1u);
LABEL_76:
      __break(1u);
LABEL_77:
      __break(1u);
LABEL_78:
      __break(1u);
LABEL_79:
      __break(1u);
LABEL_80:
      swift_bridgeObjectRetain();
      uint64_t v4 = sub_24D044888();
      if (!v4) {
        goto LABEL_11;
      }
LABEL_4:
      uint64_t v5 = 0;
      while (1)
      {
        if ((v3 & 0xC000000000000001) != 0) {
          MEMORY[0x25331BE00](v5, v3);
        }
        else {
          swift_retain();
        }
        uint64_t Strong = swift_weakLoadStrong();
        swift_release();
        swift_release();
        if (!Strong) {
          break;
        }
        uint64_t v7 = v5 + 1;
        if (__OFADD__(v5, 1)) {
          goto LABEL_69;
        }
        ++v5;
        if (v7 == v4) {
          goto LABEL_11;
        }
      }
      swift_bridgeObjectRelease();
      if (__OFADD__(v5, 1))
      {
        __break(1u);
LABEL_88:
        swift_bridgeObjectRetain();
        uint64_t v12 = sub_24D044888();
        swift_bridgeObjectRelease();
        goto LABEL_31;
      }
      if (*v2 >> 62) {
        goto LABEL_88;
      }
      uint64_t v12 = *(void *)((*v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
LABEL_31:
      if (v5 + 1 != v12)
      {
        uint64_t v13 = v5 + 5;
        do
        {
          unint64_t v3 = v13 - 4;
          if ((*v2 & 0xC000000000000001) != 0)
          {
            MEMORY[0x25331BE00](v13 - 4);
          }
          else
          {
            if ((v3 & 0x8000000000000000) != 0) {
              goto LABEL_70;
            }
            if (v3 >= *(void *)((*v2 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
              goto LABEL_71;
            }
            swift_retain();
          }
          uint64_t v14 = swift_weakLoadStrong();
          swift_release();
          swift_release();
          if (v14)
          {
            if (v3 != v5)
            {
              unint64_t v15 = *v2;
              if ((*v2 & 0xC000000000000001) != 0)
              {
                uint64_t v16 = MEMORY[0x25331BE00](v5, *v2);
                unint64_t v15 = *v2;
              }
              else
              {
                if (v5 < 0) {
                  goto LABEL_74;
                }
                if ((unint64_t)v5 >= *(void *)((v15 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
                  goto LABEL_75;
                }
                uint64_t v16 = *(void *)(v15 + 8 * v5 + 32);
                swift_retain();
              }
              if ((v15 & 0xC000000000000001) != 0)
              {
                uint64_t v17 = MEMORY[0x25331BE00](v13 - 4, v15);
                unint64_t v15 = *v2;
              }
              else
              {
                if ((v3 & 0x8000000000000000) != 0) {
                  goto LABEL_76;
                }
                if (v3 >= *(void *)((v15 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
                  goto LABEL_77;
                }
                uint64_t v17 = *(void *)(v15 + 8 * v13);
                swift_retain();
              }
              int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
              *uint64_t v2 = v15;
              if (!isUniquelyReferenced_nonNull_bridgeObject
                || (v15 & 0x8000000000000000) != 0
                || (v15 & 0x4000000000000000) != 0)
              {
                sub_24D025714(v15);
                unint64_t v15 = v19;
                *uint64_t v2 = v19;
              }
              *(void *)((v15 & 0xFFFFFFFFFFFFFF8) + 8 * v5 + 0x20) = v17;
              swift_release();
              sub_24D0444B8();
              unint64_t v20 = *v2;
              int v21 = swift_isUniquelyReferenced_nonNull_bridgeObject();
              *uint64_t v2 = v20;
              if (!v21 || (v20 & 0x8000000000000000) != 0 || (v20 & 0x4000000000000000) != 0)
              {
                sub_24D025714(v20);
                unint64_t v20 = v22;
                *uint64_t v2 = v22;
              }
              if ((v3 & 0x8000000000000000) != 0) {
                goto LABEL_78;
              }
              if (v3 >= *(void *)((v20 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
                goto LABEL_79;
              }
              *(void *)((v20 & 0xFFFFFFFFFFFFFF8) + 8 * v13) = v16;
              swift_release();
              sub_24D0444B8();
            }
            if (__OFADD__(v5++, 1)) {
              goto LABEL_73;
            }
          }
          uint64_t v24 = v13 - 3;
          if (__OFADD__(v3, 1)) {
            goto LABEL_72;
          }
          if (*v2 >> 62)
          {
            swift_bridgeObjectRetain();
            uint64_t v25 = sub_24D044888();
            swift_bridgeObjectRelease();
          }
          else
          {
            uint64_t v25 = *(void *)((*v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
          }
          ++v13;
        }
        while (v24 != v25);
      }
    }
  }
  return result;
}

void sub_24D02459C()
{
  v15[1] = *(id *)MEMORY[0x263EF8340];
  uint64_t v1 = *(void **)(v0 + 16);
  id v2 = objc_msgSend(v1, sel_category);
  uint64_t v3 = *(void *)(v0 + 24);
  uint64_t v4 = sub_24D044428();
  uint64_t v6 = v5;
  if (v4 == sub_24D044428() && v6 == v7)
  {

    swift_bridgeObjectRelease_n();
  }
  else
  {
    char v9 = sub_24D0448E8();

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v9 & 1) == 0)
    {
      v15[0] = 0;
      unsigned int v10 = objc_msgSend(v1, sel_setCategory_error_, v3, v15);
      id v11 = v15[0];
      if (v10)
      {
        id v12 = v11;
      }
      else
      {
        id v13 = v15[0];
        uint64_t v14 = (void *)sub_24D044178();

        swift_willThrow();
      }
    }
  }
}

void sub_24D024720()
{
  uint64_t v1 = self;
  id v2 = objc_msgSend(v1, sel_defaultCenter);
  uint64_t v3 = *MEMORY[0x263EF90A0];
  uint64_t v4 = *(void *)(v0 + 16);
  id v5 = sub_24D022ABC();
  uint64_t v6 = swift_allocObject();
  swift_weakInit();
  unint64_t v19 = sub_24D025000;
  uint64_t v20 = v6;
  uint64_t v15 = MEMORY[0x263EF8330];
  uint64_t v16 = 1107296256;
  uint64_t v17 = sub_24D024BB0;
  int v18 = &block_descriptor_24;
  uint64_t v7 = _Block_copy(&v15);
  swift_release();
  id v8 = objc_msgSend(v2, sel_addObserverForName_object_queue_usingBlock_, v3, v4, v5, v7);
  _Block_release(v7);
  swift_unknownObjectRelease();

  id v9 = objc_msgSend(v1, sel_defaultCenter);
  uint64_t v10 = *MEMORY[0x263EF90F8];
  id v11 = sub_24D022ABC();
  uint64_t v12 = swift_allocObject();
  swift_weakInit();
  unint64_t v19 = sub_24D025008;
  uint64_t v20 = v12;
  uint64_t v15 = MEMORY[0x263EF8330];
  uint64_t v16 = 1107296256;
  uint64_t v17 = sub_24D024BB0;
  int v18 = &block_descriptor_28;
  id v13 = _Block_copy(&v15);
  swift_release();
  id v14 = objc_msgSend(v9, sel_addObserverForName_object_queue_usingBlock_, v10, v4, v11, v13);
  _Block_release(v13);
  swift_unknownObjectRelease();
}

void sub_24D024974()
{
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    uint64_t v1 = Strong;
    sub_24D044138();
    if (v10)
    {
      sub_24D025798(0, &qword_26984F880);
      if ((swift_dynamicCast() & 1) == 0)
      {
LABEL_13:
        swift_release();
        return;
      }
      id v2 = (void *)v11;
      sub_24D025798(0, &qword_26984F888);
      id v3 = *(id *)(v1 + 16);
      char v4 = sub_24D044748();

      if ((v4 & 1) == 0 || (uint64_t v5 = sub_24D044148()) == 0)
      {
LABEL_12:

        goto LABEL_13;
      }
      uint64_t v6 = v5;
      uint64_t v8 = sub_24D044428();
      sub_24D0447C8();
      sub_24D024B4C((uint64_t)v9, v6, &v11);
      swift_bridgeObjectRelease();
      sub_24D025070((uint64_t)v9);
      if (v12)
      {
        if ((swift_dynamicCast() & 1) != 0 && v8 == 1)
        {
          sub_24D023898();
          sub_24D023758();
          swift_release();

          return;
        }
        goto LABEL_12;
      }

      swift_release();
      uint64_t v7 = &v11;
    }
    else
    {
      swift_release();
      uint64_t v7 = (long long *)v9;
    }
    sub_24D025010((uint64_t)v7);
  }
}

double sub_24D024B4C@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  if (*(void *)(a2 + 16) && (unint64_t v5 = sub_24D02515C(a1), (v6 & 1) != 0))
  {
    uint64_t v7 = *(void *)(a2 + 56) + 32 * v5;
    sub_24D0251A0(v7, (uint64_t)a3);
  }
  else
  {
    double result = 0.0;
    *a3 = 0u;
    a3[1] = 0u;
  }
  return result;
}

uint64_t sub_24D024BB0(uint64_t a1)
{
  uint64_t v2 = sub_24D044158();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  unint64_t v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v6 = *(void (**)(char *))(a1 + 32);
  sub_24D044128();
  swift_retain();
  v6(v5);
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_24D024CA4()
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    sub_24D023DCC();
    return swift_release();
  }
  return result;
}

void sub_24D024CFC()
{
  uint64_t v1 = self;
  id v2 = objc_msgSend(v1, sel_defaultCenter);
  uint64_t v3 = *(void *)(v0 + 16);
  objc_msgSend(v2, sel_removeObserver_name_object_, v0, *MEMORY[0x263EF90A0], v3);

  id v4 = objc_msgSend(v1, sel_defaultCenter);
  objc_msgSend(v4, sel_removeObserver_name_object_, v0, *MEMORY[0x263EF90F8], v3);
}

uint64_t sub_24D024DC8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for DropInPlayer.Settings(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24D024E2C()
{
  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_24D024E6C()
{
  return sub_24D0231A0(*(void *)(v0 + 16));
}

uint64_t sub_24D024E74()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_24D024E84()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

uint64_t type metadata accessor for DropInPlayerManager()
{
  return self;
}

uint64_t method lookup function for DropInPlayerManager(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for DropInPlayerManager);
}

uint64_t dispatch thunk of DropInPlayerManager.player(settings:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 176))();
}

uint64_t dispatch thunk of DropInPlayerManager.activateAudioSession()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 184))();
}

uint64_t dispatch thunk of DropInPlayerManager.deactivateAudioSession()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 192))();
}

uint64_t type metadata accessor for DropInPlayerManager.WeakDropInPlayer()
{
  return self;
}

ValueMetadata *type metadata accessor for DropInPlayerManager.AudioSessionConfiguration()
{
  return &type metadata for DropInPlayerManager.AudioSessionConfiguration;
}

uint64_t sub_24D024FC8()
{
  swift_weakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_24D025000()
{
}

uint64_t sub_24D025008()
{
  return sub_24D024CA4();
}

uint64_t sub_24D025010(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B184A70);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_24D025070(uint64_t a1)
{
  return a1;
}

char *sub_24D0250C8(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)sub_24D044898();
    __break(1u);
  }
  else if (__dst != __src || &__src[8 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 8 * a2);
  }
  return __src;
}

unint64_t sub_24D02515C(uint64_t a1)
{
  uint64_t v2 = sub_24D0447A8();
  return sub_24D025274(a1, v2);
}

uint64_t sub_24D0251A0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_24D0251FC(uint64_t a1, uint64_t a2)
{
  sub_24D044978();
  sub_24D044448();
  uint64_t v4 = sub_24D044998();
  return sub_24D0253A0(a1, a2, v4);
}

unint64_t sub_24D025274(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v6 = ~v3;
    do
    {
      sub_24D02533C(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      char v7 = MEMORY[0x25331BDC0](v9, a1);
      sub_24D025070((uint64_t)v9);
      if (v7) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v6;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

uint64_t sub_24D02533C(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_24D025398()
{
  return sub_24D02403C();
}

unint64_t sub_24D0253A0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_24D0448E8() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        id v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_24D0448E8() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_24D025484(uint64_t a1, uint64_t a2)
{
  if (a1 < 0)
  {
    __break(1u);
  }
  else
  {
    uint64_t v2 = a2;
    uint64_t v4 = a1;
    if (!(*v3 >> 62))
    {
      uint64_t v6 = *(void *)((*v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
      goto LABEL_4;
    }
  }
  swift_bridgeObjectRetain();
  uint64_t v6 = sub_24D044888();
  swift_bridgeObjectRelease();
LABEL_4:
  if (v6 < v2)
  {
    __break(1u);
    goto LABEL_34;
  }
  if (__OFSUB__(v2, v4))
  {
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  uint64_t v5 = v4 - v2;
  if (__OFSUB__(0, v2 - v4))
  {
LABEL_35:
    __break(1u);
    goto LABEL_36;
  }
  if (!(*v3 >> 62))
  {
    uint64_t v7 = *(void *)((*v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    goto LABEL_9;
  }
LABEL_36:
  swift_bridgeObjectRetain();
  uint64_t v7 = sub_24D044888();
  swift_bridgeObjectRelease();
LABEL_9:
  uint64_t v8 = v7 + v5;
  if (__OFADD__(v7, v5))
  {
    __break(1u);
LABEL_38:
    swift_bridgeObjectRetain();
    uint64_t v12 = sub_24D044888();
    swift_bridgeObjectRelease();
    unint64_t v9 = *v3;
    goto LABEL_17;
  }
  unint64_t v9 = *v3;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *uint64_t v3 = v9;
  uint64_t v7 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v9 & 0x8000000000000000) == 0 && (v9 & 0x4000000000000000) == 0)
  {
    uint64_t v11 = v9 & 0xFFFFFFFFFFFFFF8;
    if (v8 <= *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      goto LABEL_20;
    }
    uint64_t v7 = 1;
  }
  if (v9 >> 62) {
    goto LABEL_38;
  }
  uint64_t v12 = *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10);
LABEL_17:
  if (v12 <= v8) {
    uint64_t v12 = v8;
  }
  swift_bridgeObjectRetain();
  *uint64_t v3 = MEMORY[0x25331BE10](v7, v12, 1, v9);
  swift_bridgeObjectRelease();
  uint64_t v11 = *v3 & 0xFFFFFFFFFFFFFF8;
LABEL_20:
  uint64_t v13 = v11 + 32;
  BOOL v14 = (char *)(v11 + 32 + 8 * v4);
  type metadata accessor for DropInPlayerManager.WeakDropInPlayer();
  swift_arrayDestroy();
  if (!v5) {
    goto LABEL_28;
  }
  if (*v3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v15 = sub_24D044888();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v15 = *(void *)((*v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  if (__OFSUB__(v15, v2))
  {
    __break(1u);
    goto LABEL_41;
  }
  uint64_t result = (uint64_t)sub_24D0250C8((char *)(v13 + 8 * v2), v15 - v2, v14);
  if (*v3 >> 62)
  {
LABEL_41:
    swift_bridgeObjectRetain();
    uint64_t v17 = sub_24D044888();
    uint64_t result = swift_bridgeObjectRelease();
    goto LABEL_26;
  }
  uint64_t v17 = *(void *)((*v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
LABEL_26:
  if (__OFADD__(v17, v5))
  {
    __break(1u);
    return result;
  }
  *(void *)((*v3 & 0xFFFFFFFFFFFFFF8) + 0x10) = v17 + v5;
LABEL_28:
  return sub_24D0444B8();
}

void sub_24D025714(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    sub_24D044888();
    swift_bridgeObjectRelease();
  }
  JUMPOUT(0x25331BE10);
}

uint64_t sub_24D025790()
{
  return sub_24D0238B8();
}

uint64_t sub_24D025798(uint64_t a1, unint64_t *a2)
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

uint64_t sub_24D0257D4(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_24D02581C(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_24D02589C()
{
  uint64_t result = sub_24D044428();
  qword_26984F8A8 = result;
  unk_26984F8B0 = v1;
  return result;
}

uint64_t static Constants.dropInBundleID.getter()
{
  return sub_24D025B20(&qword_26984F490, &qword_26984F8A8);
}

uint64_t sub_24D0258F4()
{
  uint64_t result = sub_24D044428();
  qword_26B184D68 = result;
  unk_26B184D70 = v1;
  return result;
}

uint64_t static Constants.dropInMachServiceName.getter()
{
  return sub_24D025B20(&qword_26B184D78, &qword_26B184D68);
}

uint64_t sub_24D02594C()
{
  uint64_t result = sub_24D044428();
  qword_26B184D40 = result;
  *(void *)algn_26B184D48 = v1;
  return result;
}

uint64_t static Constants.dropInEntitlement.getter()
{
  return sub_24D025B20(qword_26B184D50, &qword_26B184D40);
}

uint64_t sub_24D0259A4()
{
  uint64_t result = sub_24D044428();
  qword_26984F8B8 = result;
  unk_26984F8C0 = v1;
  return result;
}

uint64_t static Constants.dropInDeviceStateManagementEntitlement.getter()
{
  return sub_24D025B20(&qword_26984F498, &qword_26984F8B8);
}

uint64_t sub_24D0259FC()
{
  uint64_t result = sub_24D044428();
  qword_26984F8C8 = result;
  unk_26984F8D0 = v1;
  return result;
}

uint64_t static Constants.audioManagementEntitlement.getter()
{
  return sub_24D025B20(qword_26984F4A0, &qword_26984F8C8);
}

uint64_t sub_24D025A54()
{
  uint64_t result = sub_24D044428();
  qword_26B184A58 = result;
  unk_26B184A60 = v1;
  return result;
}

uint64_t static Constants.dropInUserDefaultsDomain.getter()
{
  return sub_24D025B20(&qword_26B184BC8, &qword_26B184A58);
}

unint64_t static Constants.dropInCoreDaemonUp.getter()
{
  return 0xD000000000000023;
}

uint64_t sub_24D025AC8()
{
  uint64_t result = sub_24D044428();
  qword_26B184BD0 = result;
  *(void *)algn_26B184BD8 = v1;
  return result;
}

uint64_t static Constants.IDS.dropInCommunicationServiceName.getter()
{
  return sub_24D025B20(qword_26B184BE0, &qword_26B184BD0);
}

uint64_t sub_24D025B20(void *a1, uint64_t *a2)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v3 = *a2;
  swift_bridgeObjectRetain();
  return v3;
}

ValueMetadata *type metadata accessor for Constants()
{
  return &type metadata for Constants;
}

ValueMetadata *type metadata accessor for Constants.IDS()
{
  return &type metadata for Constants.IDS;
}

uint64_t sub_24D025B94(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t sub_24D025BD8(uint64_t a1)
{
  return OUTLINED_FUNCTION_1_2(a1);
}

uint64_t sub_24D025BE4(uint64_t a1)
{
  return OUTLINED_FUNCTION_1_2(a1);
}

char *DeviceStateUpdateThrottler.__allocating_init(throttleTimeInterval:)(double a1)
{
  id v3 = objc_allocWithZone(v1);
  return DeviceStateUpdateThrottler.init(throttleTimeInterval:)(a1);
}

char *DeviceStateUpdateThrottler.init(throttleTimeInterval:)(double a1)
{
  sub_24D044678();
  OUTLINED_FUNCTION_1_0();
  uint64_t v15 = v4;
  uint64_t v16 = v3;
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_1_1();
  uint64_t v14 = v6 - v5;
  uint64_t v7 = sub_24D044648();
  MEMORY[0x270FA5388](v7);
  uint64_t v8 = OUTLINED_FUNCTION_2_0();
  MEMORY[0x270FA5388](v8 - 8);
  OUTLINED_FUNCTION_1_1();
  *(void *)&v1[OBJC_IVAR___DIDeviceStateUpdateThrottler_cancellable] = 0;
  *(double *)&v1[OBJC_IVAR___DIDeviceStateUpdateThrottler_throttleTimeInterval] = a1;
  type metadata accessor for DeviceStateUpdateThrottler.DeviceStateUpdateRequest();
  swift_allocObject();
  unint64_t v9 = v1;
  sub_24D0269B8(0, 0, 0xE000000000000000, (uint64_t)nullsub_1, 0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26984F8E8);
  swift_allocObject();
  *(void *)&v9[OBJC_IVAR___DIDeviceStateUpdateThrottler_subject] = sub_24D0442D8();
  sub_24D01CFDC();
  sub_24D01CE88();
  sub_24D044348();
  uint64_t v18 = MEMORY[0x263F8EE78];
  sub_24D026CB0(&qword_26984F890, MEMORY[0x263F8F0F8]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26984F898);
  sub_24D026CF8(&qword_26984F8A0, &qword_26984F898);
  sub_24D044798();
  (*(void (**)(uint64_t, void, uint64_t))(v15 + 104))(v14, *MEMORY[0x263F8F130], v16);
  *(void *)&v9[OBJC_IVAR___DIDeviceStateUpdateThrottler_queue] = sub_24D0446A8();

  v17.receiver = v9;
  v17.super_class = (Class)type metadata accessor for DeviceStateUpdateThrottler();
  uint64_t v10 = (char *)objc_msgSendSuper2(&v17, sel_init);
  uint64_t v11 = swift_retain();
  uint64_t v12 = sub_24D025F84(v11);
  swift_release();

  *(void *)&v10[OBJC_IVAR___DIDeviceStateUpdateThrottler_cancellable] = v12;
  swift_release();
  return v10;
}

uint64_t type metadata accessor for DeviceStateUpdateThrottler.DeviceStateUpdateRequest()
{
  return self;
}

uint64_t sub_24D025F84(uint64_t a1)
{
  uint64_t v3 = sub_24D044668();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26984F900);
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13[1] = a1;
  sub_24D044658();
  v13[0] = *(void *)(v1 + OBJC_IVAR___DIDeviceStateUpdateThrottler_queue);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26984F8E8);
  sub_24D01CFDC();
  sub_24D026CF8(&qword_26984F908, &qword_26984F8E8);
  sub_24D026CB0(&qword_26984F910, (void (*)(uint64_t))sub_24D01CFDC);
  sub_24D0442F8();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  sub_24D026CF8(&qword_26984F918, &qword_26984F900);
  uint64_t v11 = sub_24D0442E8();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v11;
}

id DeviceStateUpdateThrottler.__deallocating_deinit()
{
  if (*(void *)&v0[OBJC_IVAR___DIDeviceStateUpdateThrottler_cancellable])
  {
    swift_retain();
    sub_24D0442A8();
    swift_release();
  }
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DeviceStateUpdateThrottler();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_24D02633C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9 = sub_24D044318();
  OUTLINED_FUNCTION_1_0();
  uint64_t v11 = v10;
  MEMORY[0x270FA5388](v12);
  uint64_t v25 = OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0();
  uint64_t v14 = v13;
  MEMORY[0x270FA5388](v15);
  OUTLINED_FUNCTION_1_1();
  uint64_t v18 = v17 - v16;
  uint64_t v19 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v20 = (void *)swift_allocObject();
  v20[2] = v19;
  v20[3] = a1;
  void v20[4] = a2;
  v20[5] = a3;
  v20[6] = a4;
  v20[7] = a5;
  aBlock[4] = sub_24D026A8C;
  aBlock[5] = v20;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_24D025B94;
  aBlock[3] = &block_descriptor_5;
  int v21 = _Block_copy(aBlock);
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  sub_24D044338();
  sub_24D026CB0((unint64_t *)&qword_26B184C50, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B184C60);
  sub_24D026CF8((unint64_t *)&qword_26B184C68, &qword_26B184C60);
  sub_24D044798();
  MEMORY[0x25331BCA0](0, v18, v5, v21);
  _Block_release(v21);
  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v5, v9);
  (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v18, v25);
  swift_release();
  return swift_release();
}

uint64_t sub_24D0265F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v11 = a1 + 16;
  swift_beginAccess();
  uint64_t result = MEMORY[0x25331C870](v11);
  if (result)
  {
    uint64_t v13 = (char *)result;
    type metadata accessor for DeviceStateUpdateThrottler.DeviceStateUpdateRequest();
    swift_allocObject();
    swift_bridgeObjectRetain();
    swift_retain();
    uint64_t v14 = sub_24D0269B8(a2, a3, a4, a5, a6);
    swift_retain();
    sub_24D0442C8();
    swift_release();
    char v15 = sub_24D026C1C(v19, v14);
    swift_release();
    if (v15)
    {
      swift_retain();
      sub_24D0442B8();
      swift_release();
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_26984F8E8);
      swift_allocObject();
      swift_retain();
      uint64_t v16 = sub_24D0442D8();
      sub_24D025BD8(v16);
      if (*(void *)&v13[OBJC_IVAR___DIDeviceStateUpdateThrottler_cancellable])
      {
        swift_retain();
        sub_24D0442A8();
        swift_release();
      }
      uint64_t v17 = swift_retain();
      uint64_t v18 = sub_24D025F84(v17);
      swift_release();
      sub_24D025BE4(v18);
      sub_24D026B14(0);
    }
    return swift_release();
  }
  return result;
}

void sub_24D0268A4(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5)
{
  id v8 = (id)sub_24D0443F8();
  (*(void (**)(uint64_t, uint64_t, id, void))(a5 + 16))(a5, a1, v8, a4 & 1);
}

id DeviceStateUpdateThrottler.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void DeviceStateUpdateThrottler.init()()
{
}

uint64_t sub_24D026990()
{
  return sub_24D026B14(0);
}

void *sub_24D0269B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[2] = a1;
  v5[3] = a2;
  v5[4] = a3;
  v5[5] = a4;
  v5[6] = a5;
  sub_24D01DD94(0);
  return v5;
}

uint64_t type metadata accessor for DeviceStateUpdateThrottler()
{
  return self;
}

uint64_t sub_24D026A0C()
{
  swift_unknownObjectWeakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_24D026A44()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v0, 64, 7);
}

uint64_t sub_24D026A8C()
{
  return sub_24D0265F0(v0[2], v0[3], v0[4], v0[5], v0[6], v0[7]);
}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

uint64_t method lookup function for DeviceStateUpdateThrottler(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for DeviceStateUpdateThrottler);
}

uint64_t dispatch thunk of DeviceStateUpdateThrottler.__allocating_init(throttleTimeInterval:)()
{
  return (*(uint64_t (**)(void))(v0 + 160))();
}

uint64_t dispatch thunk of DeviceStateUpdateThrottler.handle(state:reason:handler:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xA8))();
}

uint64_t sub_24D026B14(char a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = v1 + 5;
  uint64_t v3 = (void (*)(uint64_t, uint64_t, uint64_t, void))v1[5];
  if (v3)
  {
    uint64_t v6 = v2[2];
    uint64_t v7 = v2[3];
    uint64_t v8 = v2[4];
    swift_retain();
    v3(v6, v7, v8, a1 & 1);
    sub_24D01DD94((uint64_t)v3);
    uint64_t v9 = v2[5];
  }
  else
  {
    uint64_t v9 = 0;
  }
  void *v4 = 0;
  v4[1] = 0;
  return sub_24D01DD94(v9);
}

uint64_t sub_24D026BBC()
{
  sub_24D026B14(1);
  swift_bridgeObjectRelease();
  sub_24D01DD94(*(void *)(v0 + 40));
  return v0;
}

uint64_t sub_24D026BEC()
{
  uint64_t v0 = sub_24D026BBC();
  return MEMORY[0x270FA0228](v0, 56, 7);
}

uint64_t sub_24D026C1C(void *a1, void *a2)
{
  if (a1[2] != a2[2]) {
    return 0;
  }
  if (a1[3] == a2[3] && a1[4] == a2[4]) {
    return 1;
  }
  else {
    return sub_24D0448E8();
  }
}

uint64_t sub_24D026C64(void **a1, void **a2)
{
  return sub_24D026C1C(*a1, *a2);
}

uint64_t sub_24D026C70()
{
  _Block_release(*(const void **)(v0 + 16));
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_24D026CA8(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  sub_24D0268A4(a1, a2, a3, a4, *(void *)(v4 + 16));
}

uint64_t sub_24D026CB0(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_24D026CF8(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_1_2(uint64_t a1)
{
  *(void *)(v2 + v1) = a1;
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_2_0()
{
  return sub_24D044358();
}

uint64_t DIDropInSessionState.description.getter(uint64_t a1)
{
  return sub_24D026D94(a1, (SEL *)&selRef_stringForDropInSessionState_);
}

uint64_t sub_24D026D80()
{
  return DIDropInSessionState.description.getter(*v0);
}

uint64_t DIDropInSessionStateReason.description.getter(uint64_t a1)
{
  return sub_24D026D94(a1, (SEL *)&selRef_stringForDropInSessionStateReason_);
}

uint64_t sub_24D026D94(uint64_t a1, SEL *a2)
{
  id v2 = objc_msgSend(self, *a2, a1);
  uint64_t v3 = sub_24D044428();

  return v3;
}

uint64_t sub_24D026DFC()
{
  return DIDropInSessionStateReason.description.getter(*v0);
}

uint64_t DIDeviceState.description.getter(uint64_t a1)
{
  id v1 = objc_msgSend(self, sel_stringForDeviceState_, a1);
  uint64_t v2 = sub_24D044428();

  return v2;
}

uint64_t sub_24D026E6C()
{
  return DIDeviceState.description.getter(*v0);
}

uint64_t sub_24D026E74(unint64_t a1, void *a2)
{
  if (a1 >> 62) {
    goto LABEL_11;
  }
  uint64_t v4 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v4; uint64_t v4 = sub_24D044888())
  {
    uint64_t v5 = 4;
    while (1)
    {
      if ((a1 & 0xC000000000000001) != 0)
      {
        uint64_t v6 = (void *)MEMORY[0x25331BE00](v5 - 4, a1);
      }
      else
      {
        uint64_t v6 = *(void **)(a1 + 8 * v5);
        swift_unknownObjectRetain();
      }
      uint64_t v7 = v5 - 3;
      if (__OFADD__(v5 - 4, 1)) {
        break;
      }
      objc_msgSend(v6, sel_xpcManagerDidPerformDaemonCheckIn_, a2);
      swift_unknownObjectRelease();
      ++v5;
      if (v7 == v4) {
        goto LABEL_9;
      }
    }
    __break(1u);
LABEL_11:
    swift_bridgeObjectRetain();
  }
LABEL_9:

  return swift_bridgeObjectRelease();
}

id XPCManager.clientContext.getter()
{
  return *(id *)(v0 + OBJC_IVAR___DIXPCManager_clientContext);
}

uint64_t sub_24D026FEC()
{
  return sub_24D027108(&OBJC_IVAR___DIXPCManager_clientQueue);
}

void sub_24D027054(void *a1)
{
}

void sub_24D027098(id *a1)
{
  id v1 = *a1;
  id v2 = *a1;
  sub_24D027054(v1);
}

uint64_t sub_24D0270FC()
{
  return sub_24D027108(&OBJC_IVAR___DIXPCManager_delegate);
}

uint64_t sub_24D027108(void *a1)
{
  uint64_t v2 = v1 + *a1;
  swift_beginAccess();
  return MEMORY[0x25331C870](v2);
}

uint64_t sub_24D0271B0()
{
  return swift_unknownObjectRelease();
}

uint64_t sub_24D0271F8()
{
  return sub_24D0271B0();
}

void (*sub_24D027224(void *a1))(void **a1, char a2)
{
  uint64_t v3 = malloc(0x30uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR___DIXPCManager_delegate;
  v3[4] = v1;
  v3[5] = v4;
  uint64_t v5 = v1 + v4;
  swift_beginAccess();
  v3[3] = MEMORY[0x25331C870](v5);
  return sub_24D0272A8;
}

void sub_24D0272A8(void **a1, char a2)
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

void sub_24D027328()
{
  id v1 = v0;
  oslog = sub_24D044278();
  os_log_type_t v2 = sub_24D044618();
  if (os_log_type_enabled(oslog, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v3 = 67109120;
    sub_24D044768();

    _os_log_impl(&dword_24D00D000, oslog, v2, "Needs Check in = %{BOOL}d", v3, 8u);
    MEMORY[0x25331C7C0](v3, -1, -1);
  }
  else
  {
  }
}

uint64_t sub_24D027440(uint64_t a1)
{
  *(void *)(v1 + OBJC_IVAR___DIXPCManager__connection) = a1;
  return MEMORY[0x270F9A758]();
}

id XPCManager.__allocating_init(clientContext:dispatcher:clientQueue:)(void *a1, void *a2, void *a3)
{
  id v7 = objc_allocWithZone(v3);
  return XPCManager.init(clientContext:dispatcher:clientQueue:)(a1, a2, a3);
}

id XPCManager.init(clientContext:dispatcher:clientQueue:)(void *a1, void *a2, void *a3)
{
  uint64_t v7 = sub_24D044298();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  *(void *)&v3[OBJC_IVAR___DIXPCManager__connection] = 0;
  *(void *)&v3[OBJC_IVAR___DIXPCManager_clientContext] = a1;
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
  swift_unknownObjectWeakAssign();
  uint64_t v11 = v3;
  id v12 = a1;
  sub_24D044288();
  (*(void (**)(char *, char *, uint64_t))(v8 + 32))(&v11[OBJC_IVAR___DIXPCManager_logger], v10, v7);
  v11[OBJC_IVAR___DIXPCManager_needsCheckIn] = 1;
  v11[OBJC_IVAR___DIXPCManager_isConnectionValid] = 0;
  *(_DWORD *)&v11[OBJC_IVAR___DIXPCManager_notifyRegisterToken] = -1;
  *(void *)&v11[OBJC_IVAR___DIXPCManager_checkInObservers] = MEMORY[0x263F8EE78];
  id v13 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08AE0]), sel_init);
  *(void *)&v11[OBJC_IVAR___DIXPCManager_lock] = v13;

  uint64_t v14 = (objc_class *)type metadata accessor for XPCManager();
  v18.receiver = v11;
  v18.super_class = v14;
  id v15 = objc_msgSendSuper2(&v18, sel_init);

  return v15;
}

uint64_t type metadata accessor for XPCManager()
{
  uint64_t result = qword_26B184C20;
  if (!qword_26B184C20) {
    return swift_getSingletonMetadata();
  }
  return result;
}

id XPCManager.__deallocating_deinit()
{
  uint64_t v1 = *(void **)&v0[OBJC_IVAR___DIXPCManager__connection];
  if (v1) {
    objc_msgSend(v1, sel_invalidate);
  }
  v3.receiver = v0;
  v3.super_class = (Class)type metadata accessor for XPCManager();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

uint64_t sub_24D0278DC(uint64_t a1)
{
  objc_super v3 = *(void **)&v1[OBJC_IVAR___DIXPCManager_lock];
  uint64_t v4 = OUTLINED_FUNCTION_13_0();
  *(void *)(v4 + 16) = v1;
  *(void *)(v4 + 24) = a1;
  uint64_t v5 = OUTLINED_FUNCTION_13_0();
  *(void *)(v5 + 16) = sub_24D027B04;
  *(void *)(v5 + 24) = v4;
  v10[4] = sub_24D027B10;
  v10[5] = v5;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 1107296256;
  v10[2] = sub_24D023644;
  v10[3] = &block_descriptor_6;
  uint64_t v6 = _Block_copy(v10);
  uint64_t v7 = v1;
  swift_unknownObjectRetain();
  swift_retain();
  swift_release();
  objc_msgSend(v3, sel_di_synchronize_, v6);
  _Block_release(v6);
  char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  swift_release();
  uint64_t result = swift_release();
  if (isEscapingClosureAtFileLocation) {
    __break(1u);
  }
  return result;
}

uint64_t sub_24D027A3C(uint64_t a1)
{
  uint64_t v1 = (void *)(a1 + OBJC_IVAR___DIXPCManager_checkInObservers);
  swift_beginAccess();
  uint64_t v2 = swift_unknownObjectRetain();
  MEMORY[0x25331BA80](v2);
  sub_24D02A074(*(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10));
  sub_24D0444D8();
  sub_24D0444B8();
  return swift_endAccess();
}

uint64_t sub_24D027AC4()
{
  swift_unknownObjectRelease();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_24D027B04()
{
  return sub_24D027A3C(*(void *)(v0 + 16));
}

uint64_t sub_24D027B10()
{
  return sub_24D02361C(*(uint64_t (**)(void))(v0 + 16));
}

uint64_t block_copy_helper_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_1()
{
  return swift_release();
}

id sub_24D027BC8()
{
  uint64_t v1 = v0;
  uint64_t v128 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void **)(v0 + OBJC_IVAR___DIXPCManager__connection);
  if (v2 && *(unsigned char *)(v0 + OBJC_IVAR___DIXPCManager_isConnectionValid) == 1)
  {
    return v2;
  }
  else
  {
    sub_24D025798(0, &qword_26984F958);
    if (qword_26B184D78 != -1) {
      swift_once();
    }
    uint64_t v4 = qword_26B184D68;
    uint64_t v5 = unk_26B184D70;
    swift_bridgeObjectRetain();
    id v6 = sub_24D0282C0(v4, v5, 4096);
    uint64_t v7 = self;
    id v8 = objc_msgSend(v7, sel_interfaceWithProtocol_, &unk_26FF6AF90);
    objc_msgSend(v6, sel_setRemoteObjectInterface_, v8);
    sub_24D029994();
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_24D046940;
    uint64_t v10 = sub_24D025798(0, (unint64_t *)&qword_26B184C90);
    *(void *)(inited + 32) = v10;
    uint64_t v11 = sub_24D025798(0, &qword_26B184C88);
    *(void *)(inited + 40) = v11;
    NSXPCInterface.setClasses(_:for:argumentIndex:ofReply:)(inited);
    swift_setDeallocating();
    sub_24D029994();
    uint64_t v12 = swift_initStackObject();
    *(_OWORD *)(v12 + 16) = xmmword_24D046950;
    *(void *)(v12 + 32) = sub_24D025798(0, &qword_26B184C78);
    NSXPCInterface.setClasses(_:for:argumentIndex:ofReply:)(v12);
    swift_setDeallocating();
    id v13 = objc_msgSend(v7, sel_interfaceWithProtocol_, &unk_26FF69E90);
    objc_msgSend(v6, sel_setExportedInterface_, v13);
    uint64_t v14 = (void *)MEMORY[0x25331C870](v0 + OBJC_IVAR___DIXPCManager_dispatcher);
    objc_msgSend(v6, sel_setExportedObject_, v14);

    sub_24D029994();
    uint64_t v15 = swift_initStackObject();
    *(_OWORD *)(v15 + 16) = xmmword_24D046950;
    *(void *)(v15 + 32) = type metadata accessor for ClientContext();
    NSXPCInterface.setClasses(_:for:argumentIndex:ofReply:)(v15);
    swift_setDeallocating();
    sub_24D029994();
    uint64_t v16 = swift_initStackObject();
    *(_OWORD *)(v16 + 16) = xmmword_24D046940;
    *(void *)(v16 + 32) = v10;
    *(void *)(v16 + 40) = v11;
    OUTLINED_FUNCTION_3_0(v16);
    swift_setDeallocating();
    sub_24D029994();
    uint64_t v17 = (__n128 *)swift_initStackObject();
    OUTLINED_FUNCTION_5_0(v17, v18, v19, v20, v21, v22, v23, v24, 2, 4, v25);
    OUTLINED_FUNCTION_3_0(v26);
    swift_setDeallocating();
    sub_24D029994();
    uint64_t v27 = (__n128 *)swift_initStackObject();
    OUTLINED_FUNCTION_5_0(v27, v28, v29, v30, v31, v32, v33, v34, v107, v114, v35);
    OUTLINED_FUNCTION_3_0(v36);
    swift_setDeallocating();
    sub_24D029994();
    v37 = (__n128 *)swift_initStackObject();
    OUTLINED_FUNCTION_5_0(v37, v38, v39, v40, v41, v42, v43, v44, v108, v115, v45);
    OUTLINED_FUNCTION_3_0(v46);
    swift_setDeallocating();
    sub_24D029994();
    v47 = (__n128 *)swift_initStackObject();
    OUTLINED_FUNCTION_1_3(v47, v48, v49, v50, v51, v52, v53, v54, v109, v116, v55);
    OUTLINED_FUNCTION_3_0(v56);
    swift_setDeallocating();
    sub_24D029994();
    v57 = (__n128 *)swift_initStackObject();
    OUTLINED_FUNCTION_1_3(v57, v58, v59, v60, v61, v62, v63, v64, v110, v117, v65);
    OUTLINED_FUNCTION_3_0(v66);
    swift_setDeallocating();
    sub_24D029994();
    v67 = (__n128 *)swift_initStackObject();
    OUTLINED_FUNCTION_1_3(v67, v68, v69, v70, v71, v72, v73, v74, v111, v118, v75);
    OUTLINED_FUNCTION_3_0(v76);
    swift_setDeallocating();
    sub_24D029994();
    v77 = (__n128 *)swift_initStackObject();
    OUTLINED_FUNCTION_1_3(v77, v78, v79, v80, v81, v82, v83, v84, v112, v119, v85);
    OUTLINED_FUNCTION_3_0(v86);
    swift_setDeallocating();
    sub_24D029994();
    v87 = (__n128 *)swift_initStackObject();
    OUTLINED_FUNCTION_1_3(v87, v88, v89, v90, v91, v92, v93, v94, v113, v120, v95);
    OUTLINED_FUNCTION_3_0(v96);
    swift_setDeallocating();
    uint64_t v97 = OUTLINED_FUNCTION_8_0();
    swift_unknownObjectWeakInit();
    v126 = sub_24D029A1C;
    uint64_t v127 = v97;
    uint64_t aBlock = MEMORY[0x263EF8330];
    uint64_t v123 = 1107296256;
    v124 = sub_24D025B94;
    v125 = &block_descriptor_9;
    v98 = _Block_copy(&aBlock);
    swift_release();
    objc_msgSend(v6, sel_setInterruptionHandler_, v98);
    _Block_release(v98);
    uint64_t v99 = OUTLINED_FUNCTION_8_0();
    swift_unknownObjectWeakInit();
    v126 = sub_24D029A24;
    uint64_t v127 = v99;
    uint64_t aBlock = MEMORY[0x263EF8330];
    uint64_t v123 = 1107296256;
    v124 = sub_24D025B94;
    v125 = &block_descriptor_13;
    v100 = _Block_copy(&aBlock);
    swift_release();
    objc_msgSend(v6, sel_setInvalidationHandler_, v100);
    _Block_release(v100);
    uint64_t v101 = OBJC_IVAR___DIXPCManager_notifyRegisterToken;
    if (*(_DWORD *)(v1 + OBJC_IVAR___DIXPCManager_notifyRegisterToken) == -1)
    {
      int out_token = -1;
      sub_24D025798(0, (unint64_t *)&qword_26B184C80);
      v102 = sub_24D044688();
      uint64_t v103 = OUTLINED_FUNCTION_8_0();
      swift_unknownObjectWeakInit();
      v126 = sub_24D029A2C;
      uint64_t v127 = v103;
      uint64_t aBlock = MEMORY[0x263EF8330];
      uint64_t v123 = 1107296256;
      v124 = sub_24D0285D0;
      v125 = &block_descriptor_17;
      v104 = _Block_copy(&aBlock);
      swift_release();
      uint32_t v105 = notify_register_dispatch("com.apple.dropin.dropInCoreDaemonUp", &out_token, v102, v104);
      _Block_release(v104);

      if (!v105) {
        *(_DWORD *)(v1 + v101) = out_token;
      }
    }
    *(unsigned char *)(v1 + OBJC_IVAR___DIXPCManager_needsCheckIn) = 0;
    sub_24D027328();
    objc_msgSend(v6, sel_resume);
    *(unsigned char *)(v1 + OBJC_IVAR___DIXPCManager_isConnectionValid) = 1;
    id v106 = v6;
    sub_24D027440((uint64_t)v6);

    return v106;
  }
}

id sub_24D0282C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  uint64_t v5 = (void *)sub_24D0443F8();
  swift_bridgeObjectRelease();
  id v6 = objc_msgSend(v4, sel_initWithMachServiceName_options_, v5, a3);

  return v6;
}

void sub_24D02833C(uint64_t a1)
{
  uint64_t v1 = a1 + 16;
  swift_beginAccess();
  uint64_t v2 = MEMORY[0x25331C870](v1);
  if (v2)
  {
    objc_super v3 = (unsigned char *)v2;
    id v4 = sub_24D044278();
    os_log_type_t v5 = sub_24D044618();
    if (os_log_type_enabled(v4, v5))
    {
      id v6 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_24D00D000, v4, v5, "Connection to DropInCore was interrupted", v6, 2u);
      MEMORY[0x25331C7C0](v6, -1, -1);
    }

    v3[OBJC_IVAR___DIXPCManager_needsCheckIn] = 1;
    sub_24D027328();
    uint64_t v7 = &v3[OBJC_IVAR___DIXPCManager_delegate];
    swift_beginAccess();
    id v8 = (void *)MEMORY[0x25331C870](v7);
    if (v8)
    {
      objc_msgSend(v8, sel_managerDidInterruptConnection_, v3);

      swift_unknownObjectRelease();
    }
    else
    {
    }
  }
}

void sub_24D028474(uint64_t a1)
{
  uint64_t v1 = a1 + 16;
  swift_beginAccess();
  uint64_t v2 = MEMORY[0x25331C870](v1);
  if (v2)
  {
    objc_super v3 = (unsigned char *)v2;
    id v4 = sub_24D044278();
    os_log_type_t v5 = sub_24D044618();
    if (os_log_type_enabled(v4, v5))
    {
      id v6 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_24D00D000, v4, v5, "Connection to DropInCore was invalidated", v6, 2u);
      MEMORY[0x25331C7C0](v6, -1, -1);
    }

    v3[OBJC_IVAR___DIXPCManager_needsCheckIn] = 1;
    sub_24D027328();
    v3[OBJC_IVAR___DIXPCManager_isConnectionValid] = 0;
  }
}

void sub_24D028568(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2 + 16;
  swift_beginAccess();
  uint64_t v3 = MEMORY[0x25331C870](v2);
  if (v3)
  {
    id v4 = (void *)v3;
    if (*(unsigned char *)(v3 + OBJC_IVAR___DIXPCManager_needsCheckIn) == 1) {
      sub_24D028624();
    }
  }
}

uint64_t sub_24D0285D0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);
  return swift_release();
}

uint64_t sub_24D028624()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B184BF0);
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v3 = (char *)v14 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_24D044548();
  __swift_storeEnumTagSinglePayload((uint64_t)v3, 1, 1, v4);
  os_log_type_t v5 = (void *)swift_allocObject();
  v5[2] = 0;
  v5[3] = 0;
  v5[4] = v0;
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v3, 1, v4);
  id v7 = v0;
  if (EnumTagSinglePayload == 1)
  {
    sub_24D029F28((uint64_t)v3);
    uint64_t v8 = 0;
    uint64_t v9 = 0;
  }
  else
  {
    sub_24D044538();
    OUTLINED_FUNCTION_11_0();
    v10();
    if (v5[2])
    {
      swift_getObjectType();
      swift_unknownObjectRetain();
      uint64_t v8 = sub_24D0444E8();
      uint64_t v9 = v11;
      swift_unknownObjectRelease();
    }
    else
    {
      uint64_t v8 = 0;
      uint64_t v9 = 0;
    }
  }
  uint64_t v12 = OUTLINED_FUNCTION_13_0();
  *(void *)(v12 + 16) = &unk_26984F970;
  *(void *)(v12 + 24) = v5;
  if (v9 | v8)
  {
    v14[0] = 0;
    v14[1] = 0;
    v14[2] = v8;
    v14[3] = v9;
  }
  swift_task_create();
  return swift_release();
}

uint64_t sub_24D028814(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[20] = a4;
  uint64_t v5 = sub_24D044318();
  v4[21] = v5;
  v4[22] = *(void *)(v5 - 8);
  v4[23] = swift_task_alloc();
  uint64_t v6 = sub_24D044358();
  v4[24] = v6;
  v4[25] = *(void *)(v6 - 8);
  v4[26] = swift_task_alloc();
  id v7 = (void *)swift_task_alloc();
  v4[27] = v7;
  *id v7 = v4;
  v7[1] = sub_24D028960;
  return sub_24D0290BC();
}

uint64_t sub_24D028960()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1();
  uint64_t v2 = *v1;
  OUTLINED_FUNCTION_6();
  *uint64_t v3 = v2;
  *(void *)(v4 + 224) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v5 = sub_24D028DE8;
  }
  else {
    uint64_t v5 = sub_24D028A44;
  }
  return MEMORY[0x270FA2498](v5, 0, 0);
}

uint64_t sub_24D028A44()
{
  uint64_t v1 = sub_24D044278();
  os_log_type_t v2 = sub_24D044618();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl(&dword_24D00D000, v1, v2, "Checked in with DropInCore Daemon", v3, 2u);
    MEMORY[0x25331C7C0](v3, -1, -1);
  }
  uint64_t v4 = v0[26];
  uint64_t v5 = v0[23];
  uint64_t v7 = v0[21];
  uint64_t v6 = v0[22];
  uint64_t v19 = (char *)v0[20];

  sub_24D025798(0, (unint64_t *)&qword_26B184C80);
  uint64_t v8 = (void *)sub_24D044688();
  uint64_t v9 = OUTLINED_FUNCTION_8_0();
  swift_unknownObjectWeakInit();
  v0[6] = sub_24D02A0A0;
  v0[7] = v9;
  v0[2] = MEMORY[0x263EF8330];
  v0[3] = 1107296256;
  v0[4] = sub_24D025B94;
  v0[5] = &block_descriptor_66;
  uint64_t v10 = _Block_copy(v0 + 2);
  swift_retain();
  sub_24D044338();
  v0[19] = MEMORY[0x263F8EE78];
  sub_24D02A0A8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B184C60);
  sub_24D02A0F8();
  sub_24D044798();
  MEMORY[0x25331BCA0](0, v4, v5, v10);
  _Block_release(v10);

  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);
  OUTLINED_FUNCTION_11_0();
  v11();
  swift_release();
  swift_release();
  uint64_t v12 = *(void **)&v19[OBJC_IVAR___DIXPCManager_lock];
  uint64_t v13 = OUTLINED_FUNCTION_8_0();
  *(void *)(v13 + 16) = v19;
  uint64_t v14 = OUTLINED_FUNCTION_13_0();
  *(void *)(v14 + 16) = sub_24D02A184;
  *(void *)(v14 + 24) = v13;
  v0[12] = sub_24D02A1E8;
  v0[13] = v14;
  v0[8] = MEMORY[0x263EF8330];
  v0[9] = 1107296256;
  v0[10] = sub_24D023644;
  v0[11] = &block_descriptor_76;
  uint64_t v15 = _Block_copy(v0 + 8);
  uint64_t v16 = v19;
  swift_retain();
  swift_release();
  objc_msgSend(v12, sel_di_synchronize_, v15);
  _Block_release(v15);
  LOBYTE(v6) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  uint64_t result = swift_release();
  if (v6)
  {
    __break(1u);
  }
  else
  {
    swift_task_dealloc();
    swift_task_dealloc();
    OUTLINED_FUNCTION_4();
    return v18();
  }
  return result;
}

uint64_t sub_24D028DE8()
{
  uint64_t v15 = v0;
  uint64_t v1 = *(void **)(v0 + 224);
  id v2 = v1;
  id v3 = v1;
  uint64_t v4 = sub_24D044278();
  os_log_type_t v5 = sub_24D044608();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = *(void **)(v0 + 224);
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v8 = swift_slowAlloc();
    uint64_t v14 = v8;
    *(_DWORD *)uint64_t v7 = 136315138;
    swift_getErrorValue();
    uint64_t v9 = sub_24D044928();
    *(void *)(v0 + 144) = sub_24D0390E4(v9, v10, &v14);
    sub_24D044768();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_24D00D000, v4, v5, "Failed to check in with daemon %s", v7, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x25331C7C0](v8, -1, -1);
    MEMORY[0x25331C7C0](v7, -1, -1);
  }
  else
  {
    uint64_t v11 = *(void **)(v0 + 224);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_4();
  return v12();
}

void sub_24D028FE4(uint64_t a1)
{
  uint64_t v1 = a1 + 16;
  swift_beginAccess();
  uint64_t v2 = MEMORY[0x25331C870](v1);
  if (v2)
  {
    id v3 = (void *)v2;
    *(unsigned char *)(v2 + OBJC_IVAR___DIXPCManager_needsCheckIn) = 0;
    sub_24D027328();
  }
}

uint64_t sub_24D029044(void *a1)
{
  swift_beginAccess();
  id v2 = a1;
  unint64_t v3 = swift_bridgeObjectRetain();
  sub_24D026E74(v3, v2);
  return swift_bridgeObjectRelease();
}

uint64_t sub_24D0290BC()
{
  *(void *)(v1 + 16) = v0;
  return MEMORY[0x270FA2498](sub_24D0290DC, 0, 0);
}

uint64_t sub_24D0290DC()
{
  OUTLINED_FUNCTION_5();
  uint64_t v1 = v0[2];
  uint64_t v2 = swift_task_alloc();
  v0[3] = v2;
  *(void *)(v2 + 16) = v1;
  unint64_t v3 = (void *)swift_task_alloc();
  v0[4] = v3;
  *unint64_t v3 = v0;
  v3[1] = sub_24D0291C4;
  return MEMORY[0x270FA2360]();
}

uint64_t sub_24D0291C4()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1();
  uint64_t v3 = v2;
  uint64_t v4 = *v1;
  OUTLINED_FUNCTION_6();
  *uint64_t v5 = v4;
  *(void *)(v3 + 40) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v6 = sub_24D0292B0;
  }
  else
  {
    swift_task_dealloc();
    uint64_t v6 = sub_24D01D570;
  }
  return MEMORY[0x270FA2498](v6, 0, 0);
}

uint64_t sub_24D0292B0()
{
  OUTLINED_FUNCTION_5();
  swift_task_dealloc();
  OUTLINED_FUNCTION_4();
  return v0();
}

uint64_t sub_24D02930C(uint64_t a1)
{
  uint64_t v20 = a1;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B184C70);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v6 = sub_24D027BC8();
  uint64_t v19 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
  v19(v5, a1, v2);
  uint64_t v7 = *(unsigned __int8 *)(v3 + 80);
  uint64_t v8 = (v7 + 16) & ~v7;
  uint64_t v18 = v7 | 7;
  uint64_t v9 = swift_allocObject();
  uint64_t v17 = *(void (**)(uint64_t, char *, uint64_t))(v3 + 32);
  v17(v9 + v8, v5, v2);
  uint64_t v26 = sub_24D029CFC;
  uint64_t v27 = v9;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v23 = 1107296256;
  uint64_t v24 = sub_24D02964C;
  __n128 v25 = &block_descriptor_46;
  unint64_t v10 = _Block_copy(&aBlock);
  swift_release();
  id v11 = objc_msgSend(v6, sel_remoteObjectProxyWithErrorHandler_, v10);
  _Block_release(v10);

  sub_24D044788();
  swift_unknownObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B184C48);
  swift_dynamicCast();
  uint64_t v12 = v21;
  v19(v5, v20, v2);
  uint64_t v13 = swift_allocObject();
  v17(v13 + v8, v5, v2);
  uint64_t v26 = sub_24D029D9C;
  uint64_t v27 = v13;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v23 = 1107296256;
  uint64_t v24 = sub_24D029718;
  __n128 v25 = &block_descriptor_52;
  uint64_t v14 = _Block_copy(&aBlock);
  swift_release();
  objc_msgSend(v12, sel_checkInWithCompletionHandler_, v14);
  _Block_release(v14);
  return swift_unknownObjectRelease();
}

uint64_t sub_24D029604(void *a1)
{
  id v1 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B184C70);
  return sub_24D0444F8();
}

void sub_24D02964C(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

uint64_t sub_24D0296B4(void *a1)
{
  if (a1)
  {
    id v1 = a1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B184C70);
    return sub_24D0444F8();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B184C70);
    return sub_24D044508();
  }
}

void sub_24D029718(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3(a2);
  swift_release();
}

id XPCManager.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void XPCManager.init()()
{
}

uint64_t sub_24D0297F8(uint64_t a1, int *a2)
{
  uint64_t v7 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v3 = swift_task_alloc();
  id v4 = (void *)OUTLINED_FUNCTION_2(v3);
  void *v4 = v5;
  v4[1] = sub_24D0298CC;
  return v7(a1);
}

uint64_t sub_24D0298CC()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_6();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(void))(v1 + 8);
  return v3();
}

uint64_t sub_24D029994()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B184C98);
  if (dynamic_cast_existential_0_class_conditional(v0)) {
    uint64_t v1 = (uint64_t *)&unk_26B184BF8;
  }
  else {
    uint64_t v1 = (uint64_t *)&unk_26B184CA0;
  }
  return __swift_instantiateConcreteTypeFromMangledName(v1);
}

uint64_t sub_24D0299E4()
{
  swift_unknownObjectWeakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_24D029A1C()
{
  sub_24D02833C(v0);
}

void sub_24D029A24()
{
  sub_24D028474(v0);
}

void sub_24D029A2C(uint64_t a1)
{
  sub_24D028568(a1, v1);
}

uint64_t sub_24D029A34@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_24D026FEC();
  *a1 = result;
  return result;
}

uint64_t sub_24D029A64@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_24D0270FC();
  *a1 = result;
  return result;
}

uint64_t sub_24D029A94()
{
  return type metadata accessor for XPCManager();
}

uint64_t sub_24D029A9C()
{
  uint64_t result = sub_24D044298();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for XPCManager(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for XPCManager);
}

uint64_t dispatch thunk of XPCManager.clientQueue.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xA8))();
}

uint64_t dispatch thunk of XPCManager.delegate.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xC0))();
}

uint64_t dispatch thunk of XPCManager.delegate.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xC8))();
}

uint64_t dispatch thunk of XPCManager.delegate.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xD0))();
}

uint64_t dispatch thunk of XPCManager.__allocating_init(clientContext:dispatcher:clientQueue:)()
{
  return (*(uint64_t (**)(void))(v0 + 360))();
}

uint64_t dispatch thunk of XPCManager.addCheckInObserver(_:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x170))();
}

uint64_t dispatch thunk of XPCManager.connection.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x178))();
}

uint64_t sub_24D029CF0(uint64_t a1)
{
  return sub_24D02930C(a1);
}

uint64_t sub_24D029CFC(uint64_t a1)
{
  return sub_24D029DB4(a1, (uint64_t (*)(uint64_t, uint64_t))sub_24D029604);
}

uint64_t objectdestroy_42Tm()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B184C70);
  OUTLINED_FUNCTION_12_0();
  v1 += 8;
  uint64_t v2 = *(unsigned __int8 *)(v1 + 72);
  uint64_t v3 = ((v2 + 16) & ~v2) + *(void *)(v1 + 56);
  uint64_t v4 = v2 | 7;
  OUTLINED_FUNCTION_11_0();
  v5();
  return MEMORY[0x270FA0238](v0, v3, v4);
}

uint64_t sub_24D029D9C(uint64_t a1)
{
  return sub_24D029DB4(a1, (uint64_t (*)(uint64_t, uint64_t))sub_24D0296B4);
}

uint64_t sub_24D029DB4(uint64_t a1, uint64_t (*a2)(uint64_t, uint64_t))
{
  uint64_t v4 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26B184C70) - 8);
  uint64_t v5 = v2 + ((*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  return a2(a1, v5);
}

uint64_t sub_24D029E3C()
{
  swift_unknownObjectRelease();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_24D029E7C(uint64_t a1)
{
  uint64_t v3 = v1[2];
  uint64_t v4 = v1[3];
  uint64_t v5 = v1[4];
  uint64_t v6 = swift_task_alloc();
  uint64_t v7 = (void *)OUTLINED_FUNCTION_2(v6);
  *uint64_t v7 = v8;
  v7[1] = sub_24D021A90;
  return sub_24D028814(a1, v3, v4, v5);
}

uint64_t sub_24D029F28(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B184BF0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_24D029F88()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_24D029FC0(uint64_t a1)
{
  uint64_t v3 = *(int **)(v1 + 16);
  uint64_t v4 = swift_task_alloc();
  uint64_t v5 = (void *)OUTLINED_FUNCTION_2(v4);
  *uint64_t v5 = v6;
  v5[1] = sub_24D021A90;
  uint64_t v7 = (uint64_t (*)(uint64_t, int *))((char *)&dword_26984F978 + dword_26984F978);
  return v7(a1, v3);
}

uint64_t sub_24D02A074(uint64_t result)
{
  unint64_t v2 = *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x18);
  if (result + 1 > (uint64_t)(v2 >> 1)) {
    return MEMORY[0x270F9DBF0](v2 > 1);
  }
  return result;
}

void sub_24D02A0A0()
{
  sub_24D028FE4(v0);
}

unint64_t sub_24D02A0A8()
{
  unint64_t result = qword_26B184C50;
  if (!qword_26B184C50)
  {
    sub_24D044318();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B184C50);
  }
  return result;
}

unint64_t sub_24D02A0F8()
{
  unint64_t result = qword_26B184C68;
  if (!qword_26B184C68)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26B184C60);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B184C68);
  }
  return result;
}

uint64_t sub_24D02A14C()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_24D02A184()
{
  return sub_24D029044(*(void **)(v0 + 16));
}

uint64_t sub_24D02A190(uint64_t a1)
{
  return a1;
}

uint64_t dynamic_cast_existential_0_class_conditional(uint64_t a1)
{
  if (swift_isClassType()) {
    return a1;
  }
  else {
    return 0;
  }
}

__n128 OUTLINED_FUNCTION_1_3(__n128 *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, __n128 a11)
{
  __n128 result = a11;
  a1[1] = a11;
  a1[2].n128_u64[0] = v11;
  return result;
}

void OUTLINED_FUNCTION_3_0(uint64_t a1)
{
  NSXPCInterface.setClasses(_:for:argumentIndex:ofReply:)(a1);
}

uint64_t OUTLINED_FUNCTION_4_0()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

__n128 OUTLINED_FUNCTION_5_0(__n128 *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, __n128 a11)
{
  __n128 result = a11;
  a1[1] = a11;
  a1[2].n128_u64[0] = v11;
  return result;
}

uint64_t OUTLINED_FUNCTION_8_0()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_9_0()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_13_0()
{
  return swift_allocObject();
}

uint64_t sub_24D02A2E8()
{
  uint64_t v3 = OUTLINED_FUNCTION_43();
  if (__swift_getEnumTagSinglePayload(v1, 1, v3) == 1)
  {
    sub_24D030208(v1, &qword_26B184BF0);
  }
  else
  {
    sub_24D044538();
    OUTLINED_FUNCTION_41();
    OUTLINED_FUNCTION_11_0();
    v4();
  }
  if (*(void *)(v0 + 16))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_24D0444E8();
    swift_unknownObjectRelease();
  }
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v2;
  *(void *)(v5 + 24) = v0;
  return swift_task_create();
}

uint64_t sub_24D02A438()
{
  uint64_t v3 = OUTLINED_FUNCTION_43();
  if (__swift_getEnumTagSinglePayload(v1, 1, v3) == 1)
  {
    sub_24D030208(v1, &qword_26B184BF0);
  }
  else
  {
    sub_24D044538();
    OUTLINED_FUNCTION_41();
    OUTLINED_FUNCTION_11_0();
    v4();
  }
  if (*(void *)(v0 + 16))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_24D0444E8();
    swift_unknownObjectRelease();
  }
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v2;
  *(void *)(v5 + 24) = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26984FA90);
  return swift_task_create();
}

uint64_t sub_24D02A598()
{
  return 1;
}

Swift::Bool __swiftcall AppStateControllerDelegate.controllerShouldProceedWithIncomingSession()()
{
  return 1;
}

uint64_t AppStateController.__allocating_init()()
{
  uint64_t v0 = swift_allocObject();
  AppStateController.init()();
  return v0;
}

uint64_t AppStateController.init()()
{
  uint64_t v2 = sub_24D044298();
  OUTLINED_FUNCTION_1_0();
  uint64_t v4 = v3;
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_24();
  swift_defaultActor_initialize();
  *(void *)(v0 + 120) = 0;
  swift_unknownObjectWeakInit();
  OUTLINED_FUNCTION_36_0(OBJC_IVAR____TtC6DropIn18AppStateController_lastDropInState);
  *(void *)(v0 + OBJC_IVAR____TtC6DropIn18AppStateController____lazy_storage___activation) = 0;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26984F9A0);
  OUTLINED_FUNCTION_34_0(v6);
  *(void *)(v0 + OBJC_IVAR____TtC6DropIn18AppStateController____lazy_storage___deactivation) = 0;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26984F9B8);
  OUTLINED_FUNCTION_34_0(v7);
  id v8 = objc_msgSend(objc_allocWithZone((Class)DIDropInCenter), sel_init);
  *(void *)(v0 + OBJC_IVAR____TtC6DropIn18AppStateController_center) = v8;
  id v9 = objc_msgSend(v8, sel_audioPowerController);
  *(void *)(v0 + OBJC_IVAR____TtC6DropIn18AppStateController_audioPowerController) = v9;
  sub_24D044288();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 32))(v0 + OBJC_IVAR____TtC6DropIn18AppStateController_logger, v1, v2);
  *(void *)(v0 + OBJC_IVAR____TtC6DropIn18AppStateController_observer) = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for AppStateControllerSessionObserver()), sel_init);
  return v0;
}

id sub_24D02A794(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 120) = a2;
  swift_unknownObjectWeakAssign();
  uint64_t v3 = *(void *)(v2 + OBJC_IVAR____TtC6DropIn18AppStateController_observer);
  swift_weakAssign();
  uint64_t v4 = *(void **)(v2 + OBJC_IVAR____TtC6DropIn18AppStateController_center);
  objc_msgSend(v4, sel_setDelegate_, v3);
  id v5 = objc_msgSend(v4, sel_sessionManager);
  objc_msgSend(v5, sel_setDelegate_, v3);

  uint64_t v6 = *(void **)(v2 + OBJC_IVAR____TtC6DropIn18AppStateController_audioPowerController);
  return objc_msgSend(v6, sel_setDelegate_, v3);
}

uint64_t sub_24D02A860()
{
  OUTLINED_FUNCTION_5();
  v1[3] = v0;
  uint64_t v2 = sub_24D044298();
  v1[4] = v2;
  OUTLINED_FUNCTION_1_4(v2);
  v1[5] = v3;
  v1[6] = OUTLINED_FUNCTION_22_0();
  OUTLINED_FUNCTION_13_1();
  return MEMORY[0x270FA2498](v4, v5, v6);
}

uint64_t sub_24D02A8EC()
{
  OUTLINED_FUNCTION_5();
  uint64_t v1 = sub_24D02AED8();
  *(void *)(v0 + 56) = v1;
  return MEMORY[0x270FA2498](sub_24D02A954, v1, 0);
}

uint64_t sub_24D02A954()
{
  OUTLINED_FUNCTION_5();
  uint64_t v1 = *(void **)(*(void *)(v0 + 56) + OBJC_IVAR____TtC6DropIn18AppStateActivation_session);
  *(void *)(v0 + 64) = v1;
  id v2 = v1;
  swift_release();
  OUTLINED_FUNCTION_12_1();
  return MEMORY[0x270FA2498](v3, v4, v5);
}

uint64_t sub_24D02A9D4()
{
  uint64_t v1 = (void *)v0[8];

  if (v1) {
    goto LABEL_2;
  }
  id v4 = objc_msgSend(*(id *)(v0[3] + OBJC_IVAR____TtC6DropIn18AppStateController_center), sel_sessionManager);
  id v5 = objc_msgSend(v4, sel_incomingPendingSession);
  v0[9] = v5;

  if (!v5) {
    goto LABEL_2;
  }
  if (objc_msgSend(v5, sel_state) != (id)2)
  {

LABEL_2:
    swift_task_dealloc();
    OUTLINED_FUNCTION_25_0();
    __asm { BRAA            X2, X16 }
  }
  uint64_t v6 = OUTLINED_FUNCTION_4_1();
  v7(v6);
  id v8 = v5;
  id v9 = sub_24D044278();
  os_log_type_t v10 = sub_24D044618();
  if (os_log_type_enabled(v9, v10))
  {
    unint64_t v11 = (uint8_t *)OUTLINED_FUNCTION_31();
    uint64_t v17 = (void *)OUTLINED_FUNCTION_34();
    *(_DWORD *)unint64_t v11 = 138412290;
    v0[2] = v8;
    id v12 = v8;
    sub_24D044768();
    void *v17 = v5;

    _os_log_impl(&dword_24D00D000, v9, v10, "Handling the pending session: %@", v11, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26984F7C0);
    OUTLINED_FUNCTION_28_0();
    OUTLINED_FUNCTION_7();
    OUTLINED_FUNCTION_7();
  }
  else
  {
  }
  OUTLINED_FUNCTION_15_0();
  v13();
  uint64_t v14 = (void *)swift_task_alloc();
  v0[10] = v14;
  *uint64_t v14 = v0;
  v14[1] = sub_24D02AC44;
  OUTLINED_FUNCTION_25_0();
  return sub_24D02D2C8();
}

uint64_t sub_24D02AC44()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_6();
  *id v2 = v1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_13_1();
  return MEMORY[0x270FA2498](v3, v4, v5);
}

uint64_t sub_24D02AD20()
{
  OUTLINED_FUNCTION_5();

  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v1(1);
}

uint64_t sub_24D02AD88()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B184BF0);
  MEMORY[0x270FA5388](v1 - 8);
  OUTLINED_FUNCTION_25();
  uint64_t v2 = sub_24D044548();
  __swift_storeEnumTagSinglePayload(v0, 1, 1, v2);
  sub_24D02F5FC();
  uint64_t v3 = (void *)swift_allocObject();
  OUTLINED_FUNCTION_33_0(v3);
  sub_24D02A2E8();
  return swift_release();
}

uint64_t sub_24D02AE48()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_24D022180;
  return sub_24D02C6D8();
}

uint64_t sub_24D02AED8()
{
  return sub_24D02AF68(&OBJC_IVAR____TtC6DropIn18AppStateController____lazy_storage___activation, (void (*)(void))type metadata accessor for AppStateActivation, sub_24D01EB24);
}

uint64_t sub_24D02AF0C()
{
  return sub_24D02B014((uint64_t *)&unk_26984FAF0);
}

uint64_t sub_24D02AF34()
{
  return sub_24D02AF68(&OBJC_IVAR____TtC6DropIn18AppStateController____lazy_storage___deactivation, (void (*)(void))type metadata accessor for AppStateDeactivation, sub_24D034914);
}

uint64_t sub_24D02AF68(uint64_t *a1, void (*a2)(void), uint64_t (*a3)(void))
{
  uint64_t v4 = *a1;
  uint64_t v5 = *(void *)(v3 + *a1);
  if (v5)
  {
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v8 = v3;
    a2();
    swift_allocObject();
    uint64_t v6 = a3();
    *(void *)(v8 + v4) = v6;
    swift_retain();
    swift_release();
  }
  swift_retain();
  return v6;
}

uint64_t sub_24D02AFEC()
{
  return sub_24D02B014(&qword_26984FAE8);
}

uint64_t sub_24D02B014(uint64_t *a1)
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(a1);
  OUTLINED_FUNCTION_1_0();
  uint64_t v3 = v2;
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_allocObject();
  swift_weakInit();
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v6, *MEMORY[0x263F8F680], v1);
  sub_24D044588();
  return swift_release();
}

uint64_t sub_24D02B110(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t *a4, void *a5)
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(a3);
  MEMORY[0x270FA5388](v9 - 8);
  OUTLINED_FUNCTION_24();
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v11 = result;
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(a4);
    OUTLINED_FUNCTION_14();
    OUTLINED_FUNCTION_39_0();
    v13();
    __swift_storeEnumTagSinglePayload(v5, 0, 1, v12);
    uint64_t v14 = v11 + *a5;
    swift_beginAccess();
    sub_24D03035C(v5, v14, a3);
    swift_endAccess();
    return swift_release();
  }
  return result;
}

uint64_t sub_24D02B238()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B184BF0);
  MEMORY[0x270FA5388](v1 - 8);
  OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_36_0(OBJC_IVAR____TtC6DropIn18AppStateController_lastDropInState);
  uint64_t v2 = sub_24D044548();
  __swift_storeEnumTagSinglePayload(v0, 1, 1, v2);
  sub_24D02F5FC();
  uint64_t v3 = (void *)swift_allocObject();
  OUTLINED_FUNCTION_33_0(v3);
  sub_24D02A2E8();
  return swift_release();
}

uint64_t sub_24D02B304(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 16) = a4;
  return MEMORY[0x270FA2498](sub_24D02B324, a4, 0);
}

uint64_t sub_24D02B324()
{
  OUTLINED_FUNCTION_5();
  uint64_t v1 = sub_24D02AED8();
  *(void *)(v0 + 24) = v1;
  return MEMORY[0x270FA2498](sub_24D02B38C, v1, 0);
}

uint64_t sub_24D02B38C()
{
  OUTLINED_FUNCTION_5();
  sub_24D01ED48();
  swift_release();
  OUTLINED_FUNCTION_12_1();
  return MEMORY[0x270FA2498](v0, v1, v2);
}

uint64_t sub_24D02B3F4()
{
  OUTLINED_FUNCTION_5();
  uint64_t v1 = sub_24D02AF34();
  *(void *)(v0 + 32) = v1;
  return MEMORY[0x270FA2498](sub_24D02B45C, v1, 0);
}

uint64_t sub_24D02B45C()
{
  OUTLINED_FUNCTION_5();
  sub_24D034AE0();
  swift_release();
  OUTLINED_FUNCTION_4();
  return v0();
}

uint64_t sub_24D02B4BC()
{
  OUTLINED_FUNCTION_5();
  v1[2] = v2;
  v1[3] = v0;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26984FAB0);
  v1[4] = v3;
  OUTLINED_FUNCTION_1_4(v3);
  v1[5] = v4;
  v1[6] = OUTLINED_FUNCTION_22_0();
  OUTLINED_FUNCTION_13_1();
  return MEMORY[0x270FA2498](v5, v6, v7);
}

uint64_t sub_24D02B54C()
{
  OUTLINED_FUNCTION_9();
  uint64_t v1 = (void *)v0[2];
  v0[7] = sub_24D02AED8();
  uint64_t v2 = swift_allocObject();
  v0[8] = v2;
  swift_weakInit();
  uint64_t v3 = swift_allocObject();
  v0[9] = v3;
  *(void *)(v3 + 16) = v2;
  *(void *)(v3 + 24) = v1;
  swift_retain();
  id v4 = v1;
  OUTLINED_FUNCTION_12_1();
  return MEMORY[0x270FA2498](v5, v6, v7);
}

uint64_t sub_24D02B610()
{
  OUTLINED_FUNCTION_9();
  uint64_t v1 = *(void *)(v0 + 24);
  sub_24D01EC38((uint64_t)sub_24D02FFCC, *(void *)(v0 + 72));
  swift_release();
  swift_release();
  swift_release();
  return MEMORY[0x270FA2498](sub_24D02B6B4, v1, 0);
}

uint64_t sub_24D02B6B4()
{
  uint64_t v36 = v0;
  id v1 = objc_msgSend(*(id *)(v0 + 16), sel_participants);
  sub_24D02FFD4();
  unint64_t v2 = sub_24D044498();

  if (v2 >> 62)
  {
    swift_bridgeObjectRetain();
    id v3 = (id)sub_24D044888();
    swift_bridgeObjectRelease();
    if (v3) {
      goto LABEL_3;
    }
LABEL_7:
    swift_bridgeObjectRelease();
    uint64_t v32 = 0;
    uint64_t v33 = 0;
    uint64_t v10 = 0;
    uint64_t v11 = 0;
    uint64_t v13 = 0;
    uint64_t v14 = 0;
    uint64_t v16 = 0;
    uint64_t v20 = 0;
    uint64_t v19 = 0;
    uint64_t v34 = 0;
    goto LABEL_8;
  }
  id v3 = *(id *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v3) {
    goto LABEL_7;
  }
LABEL_3:
  sub_24D032528(0, (v2 & 0xC000000000000001) == 0, v2);
  if ((v2 & 0xC000000000000001) != 0) {
    id v4 = (id)MEMORY[0x25331BE00](0, v2);
  }
  else {
    id v4 = *(id *)(v2 + 32);
  }
  uint64_t v5 = v4;
  swift_bridgeObjectRelease();
  id v6 = v5;
  id v7 = objc_msgSend(v6, sel_value);
  uint64_t v33 = sub_24D044428();
  uint64_t v34 = v8;

  id v3 = objc_msgSend(v6, sel_type);
  uint64_t v32 = sub_24D02FB8C(v6, (SEL *)&selRef_givenName);
  uint64_t v10 = v9;
  uint64_t v11 = sub_24D02FB8C(v6, (SEL *)&selRef_familyName);
  uint64_t v13 = v12;
  uint64_t v14 = sub_24D02FB8C(v6, (SEL *)&selRef_displayName);
  uint64_t v16 = v15;
  uint64_t v17 = sub_24D02FBEC(v6);
  uint64_t v19 = v18;

  uint64_t v20 = v17;
LABEL_8:
  *(void *)(v0 + 152) = v34;
  *(void *)(v0 + 160) = v3;
  *(void *)(v0 + 136) = v19;
  *(void *)(v0 + 144) = v33;
  *(void *)(v0 + 120) = v16;
  *(void *)(v0 + 128) = v20;
  *(void *)(v0 + 104) = v13;
  *(void *)(v0 + 112) = v14;
  *(void *)(v0 + 88) = v10;
  *(void *)(v0 + 96) = v11;
  uint64_t v21 = *(void *)(v0 + 24) + 112;
  *(void *)(v0 + 80) = v32;
  if (MEMORY[0x25331C870](v21))
  {
    id v30 = v3;
    uint64_t v22 = v13;
    uint64_t v24 = *(void *)(v0 + 40);
    uint64_t v23 = *(void *)(v0 + 48);
    uint64_t v31 = *(void *)(v0 + 32);
    uint64_t v28 = v16;
    uint64_t v25 = *(void *)(*(void *)(v0 + 24) + 120);
    uint64_t ObjectType = swift_getObjectType();
    sub_24D02AF0C();
    v35[0] = v32;
    v35[1] = v10;
    v35[2] = v11;
    v35[3] = v22;
    v35[4] = v14;
    v35[5] = v28;
    v35[6] = v20;
    v35[7] = v19;
    v35[8] = v33;
    v35[9] = v34;
    v35[10] = v30;
    (*(void (**)(uint64_t, void *, uint64_t, uint64_t))(v25 + 40))(v23, v35, ObjectType, v25);
    swift_unknownObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v23, v31);
  }
  uint64_t v26 = sub_24D02AED8();
  *(void *)(v0 + 168) = v26;
  return MEMORY[0x270FA2498](sub_24D02B9AC, v26, 0);
}

uint64_t sub_24D02B9AC()
{
  OUTLINED_FUNCTION_5();
  sub_24D01EC84(*(void **)(v0 + 16));
  swift_release();
  OUTLINED_FUNCTION_12_1();
  return MEMORY[0x270FA2498](v1, v2, v3);
}

uint64_t sub_24D02BA18()
{
  OUTLINED_FUNCTION_9();
  sub_24D030014(*(void *)(v0 + 80), *(void *)(v0 + 88), *(void *)(v0 + 96), *(void *)(v0 + 104), *(void *)(v0 + 112), *(void *)(v0 + 120), *(void *)(v0 + 128), *(void *)(v0 + 136), *(void *)(v0 + 144), *(void *)(v0 + 152));
  swift_task_dealloc();
  OUTLINED_FUNCTION_4();
  return v1();
}

uint64_t sub_24D02BA98(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v42 = a3;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B184BF0);
  MEMORY[0x270FA5388](v4 - 8);
  id v6 = (char *)&v40 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26984F9A0);
  uint64_t v41 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v40 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26984FA08);
  uint64_t v11 = MEMORY[0x270FA5388](v10 - 8);
  uint64_t v13 = (char *)&v40 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = MEMORY[0x270FA5388](v11);
  uint64_t v16 = (char *)&v40 - v15;
  MEMORY[0x270FA5388](v14);
  uint64_t v18 = (char *)&v40 - v17;
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_26984FAB8);
  MEMORY[0x270FA5388](v19 - 8);
  uint64_t v21 = (char *)&v40 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = *(void **)a1;
  char v23 = *(unsigned char *)(a1 + 8);
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    if (v23)
    {
      uint64_t v25 = result + OBJC_IVAR____TtC6DropIn18AppStateController_activationStatesContinuation;
      swift_beginAccess();
      sub_24D0300A4(v25, (uint64_t)v13, &qword_26984FA08);
      if (__swift_getEnumTagSinglePayload((uint64_t)v13, 1, v7))
      {
        id v26 = v22;
        sub_24D030208((uint64_t)v13, &qword_26984FA08);
      }
      else
      {
        uint64_t v29 = v41;
        (*(void (**)(char *, char *, uint64_t))(v41 + 16))(v9, v13, v7);
        id v30 = v22;
        sub_24D030208((uint64_t)v13, &qword_26984FA08);
        uint64_t v43 = v22;
        id v31 = v22;
        sub_24D044578();
        (*(void (**)(char *, uint64_t))(v29 + 8))(v9, v7);
      }
      uint64_t v32 = v42;
      uint64_t v33 = sub_24D044548();
      __swift_storeEnumTagSinglePayload((uint64_t)v6, 1, 1, v33);
      uint64_t v34 = swift_allocObject();
      swift_weakInit();
      __n128 v35 = (void *)swift_allocObject();
      v35[2] = 0;
      v35[3] = 0;
      v35[4] = v34;
      v35[5] = v32;
      id v36 = v32;
      sub_24D02A2E8();
      sub_24D0301FC(v22, 1);
      swift_release();
      return swift_release();
    }
    uint64_t v27 = result + OBJC_IVAR____TtC6DropIn18AppStateController_activationStatesContinuation;
    swift_beginAccess();
    sub_24D0300A4(v27, (uint64_t)v18, &qword_26984FA08);
    if (__swift_getEnumTagSinglePayload((uint64_t)v18, 1, v7))
    {
      sub_24D030208((uint64_t)v18, &qword_26984FA08);
      uint64_t v28 = 1;
    }
    else
    {
      uint64_t v37 = v41;
      (*(void (**)(char *, char *, uint64_t))(v41 + 16))(v9, v18, v7);
      sub_24D030208((uint64_t)v18, &qword_26984FA08);
      LOBYTE(v43) = (_BYTE)v22;
      sub_24D044568();
      (*(void (**)(char *, uint64_t))(v37 + 8))(v9, v7);
      uint64_t v28 = 0;
    }
    uint64_t v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_26984FAD0);
    __swift_storeEnumTagSinglePayload((uint64_t)v21, v28, 1, v38);
    sub_24D030208((uint64_t)v21, &qword_26984FAB8);
    if (v22 != 9) {
      return swift_release();
    }
    sub_24D0300A4(v27, (uint64_t)v16, &qword_26984FA08);
    if (__swift_getEnumTagSinglePayload((uint64_t)v16, 1, v7))
    {
      swift_release();
      return sub_24D030208((uint64_t)v16, &qword_26984FA08);
    }
    else
    {
      uint64_t v39 = v41;
      (*(void (**)(char *, char *, uint64_t))(v41 + 16))(v9, v16, v7);
      sub_24D030208((uint64_t)v16, &qword_26984FA08);
      uint64_t v43 = 0;
      sub_24D044578();
      swift_release();
      return (*(uint64_t (**)(char *, uint64_t))(v39 + 8))(v9, v7);
    }
  }
  return result;
}

uint64_t sub_24D02BFD8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[19] = a4;
  v5[20] = a5;
  uint64_t v6 = sub_24D044298();
  v5[21] = v6;
  v5[22] = *(void *)(v6 - 8);
  v5[23] = swift_task_alloc();
  v5[24] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24D02C0A8, 0, 0);
}

uint64_t sub_24D02C0A8()
{
  OUTLINED_FUNCTION_9();
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  v0[25] = Strong;
  if (Strong)
  {
    uint64_t v2 = (void *)v0[20];
    v0[2] = v0;
    v0[3] = sub_24D02C204;
    uint64_t v3 = swift_continuation_init();
    v0[10] = MEMORY[0x263EF8330];
    v0[11] = 0x40000000;
    v0[12] = sub_24D0342D0;
    v0[13] = &block_descriptor_1;
    v0[14] = v3;
    objc_msgSend(v2, sel_cancelWithCompletionHandler_, v0 + 10);
    return MEMORY[0x270FA23F0](v0 + 2);
  }
  else
  {
    swift_task_dealloc();
    swift_task_dealloc();
    OUTLINED_FUNCTION_4();
    return v4();
  }
}

uint64_t sub_24D02C204()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1();
  uint64_t v1 = *(void *)(v0 + 48);
  *(void *)(v2 + 208) = v1;
  if (v1) {
    uint64_t v3 = sub_24D02C458;
  }
  else {
    uint64_t v3 = sub_24D02C2EC;
  }
  return MEMORY[0x270FA2498](v3, 0, 0);
}

uint64_t sub_24D02C2EC()
{
  return OUTLINED_FUNCTION_11_1((uint64_t)sub_24D02C304, *(void *)(v0 + 200));
}

uint64_t sub_24D02C304()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_39_0();
  v0();
  return MEMORY[0x270FA2498](sub_24D02C380, 0, 0);
}

uint64_t sub_24D02C380()
{
  OUTLINED_FUNCTION_9();
  uint64_t v0 = sub_24D044278();
  os_log_type_t v1 = sub_24D044608();
  if (os_log_type_enabled(v0, v1))
  {
    *(_WORD *)swift_slowAlloc() = 0;
    OUTLINED_FUNCTION_38_0(&dword_24D00D000, v2, v3, "Session Cancelled");
    OUTLINED_FUNCTION_7();
  }
  swift_release();

  OUTLINED_FUNCTION_15_0();
  v4();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_4();
  return v5();
}

uint64_t sub_24D02C458()
{
  OUTLINED_FUNCTION_9();
  swift_willThrow();
  OUTLINED_FUNCTION_13_1();
  return MEMORY[0x270FA2498](v0, v1, v2);
}

uint64_t sub_24D02C4C0()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_39_0();
  v0();
  return MEMORY[0x270FA2498](sub_24D02C540, 0, 0);
}

uint64_t sub_24D02C540(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  OUTLINED_FUNCTION_30_0();
  uint64_t v13 = *(void **)(v12 + 208);
  id v14 = v13;
  id v15 = v13;
  uint64_t v16 = sub_24D044278();
  os_log_type_t v17 = sub_24D044608();
  if (os_log_type_enabled(v16, v17))
  {
    uint64_t v18 = *(void **)(v12 + 208);
    uint64_t v19 = (uint8_t *)OUTLINED_FUNCTION_31();
    uint64_t v20 = (void *)OUTLINED_FUNCTION_34();
    *(_DWORD *)uint64_t v19 = 138412290;
    id v21 = v18;
    uint64_t v22 = _swift_stdlib_bridgeErrorToNSError();
    *(void *)(v12 + 144) = v22;
    OUTLINED_FUNCTION_27_0();
    void *v20 = v22;

    _os_log_impl(&dword_24D00D000, v16, v17, "Failed to cancel session: %@", v19, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26984F7C0);
    OUTLINED_FUNCTION_29_0();
    OUTLINED_FUNCTION_7();
    OUTLINED_FUNCTION_7();
    swift_release();
  }
  else
  {
    char v23 = *(void **)(v12 + 208);
    swift_release();
  }
  OUTLINED_FUNCTION_15_0();
  v24();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_26_0();
  return v26(v25, v26, v27, v28, v29, v30, v31, v32, a9, a10, a11, a12);
}

uint64_t sub_24D02C6D8()
{
  OUTLINED_FUNCTION_5();
  v1[2] = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26984FA98);
  v1[3] = v2;
  OUTLINED_FUNCTION_1_4(v2);
  v1[4] = v3;
  v1[5] = OUTLINED_FUNCTION_22_0();
  OUTLINED_FUNCTION_13_1();
  return MEMORY[0x270FA2498](v4, v5, v6);
}

uint64_t sub_24D02C768()
{
  OUTLINED_FUNCTION_9();
  *(void *)(v0 + 48) = sub_24D02AF34();
  *(void *)(v0 + 56) = swift_allocObject();
  swift_weakInit();
  swift_retain();
  OUTLINED_FUNCTION_12_1();
  return MEMORY[0x270FA2498](v1, v2, v3);
}

uint64_t sub_24D02C80C()
{
  OUTLINED_FUNCTION_9();
  uint64_t v1 = *(void *)(v0 + 16);
  sub_24D01EC38((uint64_t)sub_24D02FF84, *(void *)(v0 + 56));
  swift_release();
  swift_release_n();
  return MEMORY[0x270FA2498](sub_24D02C8A8, v1, 0);
}

uint64_t sub_24D02C8A8()
{
  if (MEMORY[0x25331C870](v0[2] + 112))
  {
    uint64_t v2 = v0[4];
    uint64_t v1 = v0[5];
    uint64_t v3 = v0[3];
    uint64_t v4 = *(void *)(v0[2] + 120);
    uint64_t ObjectType = swift_getObjectType();
    sub_24D02AFEC();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 48))(v1, ObjectType, v4);
    swift_unknownObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  }
  v0[8] = sub_24D02AF34();
  uint64_t v6 = sub_24D02AED8();
  v0[9] = v6;
  return MEMORY[0x270FA2498](sub_24D02C9A8, v6, 0);
}

uint64_t sub_24D02C9A8()
{
  OUTLINED_FUNCTION_5();
  *(void *)(v0 + 80) = sub_24D01EAA8();
  swift_release();
  OUTLINED_FUNCTION_12_1();
  return MEMORY[0x270FA2498](v1, v2, v3);
}

uint64_t sub_24D02CA14()
{
  OUTLINED_FUNCTION_9();
  sub_24D034A18(*(void *)(v0 + 80));
  swift_release();
  swift_release();
  swift_task_dealloc();
  OUTLINED_FUNCTION_4();
  return v1();
}

uint64_t sub_24D02CA98(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26984F9B8);
  uint64_t v29 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = (char *)&v29 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26984FA10);
  uint64_t v6 = MEMORY[0x270FA5388](v5 - 8);
  uint64_t v8 = (char *)&v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = MEMORY[0x270FA5388](v6);
  uint64_t v11 = (char *)&v29 - v10;
  MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)&v29 - v12;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26984FAA0);
  MEMORY[0x270FA5388](v14 - 8);
  uint64_t v16 = (char *)&v29 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  os_log_type_t v17 = *(void **)a1;
  char v18 = *(unsigned char *)(a1 + 8);
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v20 = result + OBJC_IVAR____TtC6DropIn18AppStateController_deactivationStatesContinuation;
    if (v18)
    {
      swift_beginAccess();
      sub_24D0300A4(v20, (uint64_t)v8, &qword_26984FA10);
      if (!__swift_getEnumTagSinglePayload((uint64_t)v8, 1, v2))
      {
        uint64_t v23 = v29;
        (*(void (**)(char *, char *, uint64_t))(v29 + 16))(v4, v8, v2);
        id v24 = v17;
        sub_24D030208((uint64_t)v8, &qword_26984FA10);
        uint64_t v30 = v17;
        id v25 = v17;
        sub_24D044578();
        swift_release();
        sub_24D0301FC(v17, 1);
        return (*(uint64_t (**)(char *, uint64_t))(v23 + 8))(v4, v2);
      }
      swift_release();
      uint64_t v21 = (uint64_t)v8;
      return sub_24D030208(v21, &qword_26984FA10);
    }
    swift_beginAccess();
    sub_24D0300A4(v20, (uint64_t)v13, &qword_26984FA10);
    if (__swift_getEnumTagSinglePayload((uint64_t)v13, 1, v2))
    {
      sub_24D030208((uint64_t)v13, &qword_26984FA10);
      uint64_t v22 = 1;
    }
    else
    {
      uint64_t v26 = v29;
      (*(void (**)(char *, char *, uint64_t))(v29 + 16))(v4, v13, v2);
      sub_24D030208((uint64_t)v13, &qword_26984FA10);
      LOBYTE(v30) = (_BYTE)v17;
      sub_24D044568();
      (*(void (**)(char *, uint64_t))(v26 + 8))(v4, v2);
      uint64_t v22 = 0;
    }
    uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_26984FAA8);
    __swift_storeEnumTagSinglePayload((uint64_t)v16, v22, 1, v27);
    sub_24D030208((uint64_t)v16, &qword_26984FAA0);
    if (v17 == 8)
    {
      sub_24D0300A4(v20, (uint64_t)v11, &qword_26984FA10);
      if (__swift_getEnumTagSinglePayload((uint64_t)v11, 1, v2))
      {
        swift_release();
        uint64_t v21 = (uint64_t)v11;
        return sub_24D030208(v21, &qword_26984FA10);
      }
      uint64_t v28 = v29;
      (*(void (**)(char *, char *, uint64_t))(v29 + 16))(v4, v11, v2);
      sub_24D030208((uint64_t)v11, &qword_26984FA10);
      uint64_t v30 = 0;
      sub_24D044578();
      swift_release();
      return (*(uint64_t (**)(char *, uint64_t))(v28 + 8))(v4, v2);
    }
    else
    {
      return swift_release();
    }
  }
  return result;
}

uint64_t sub_24D02CEE4()
{
  *(void *)(v1 + 16) = v0;
  return OUTLINED_FUNCTION_11_1((uint64_t)sub_24D02CF00, v0);
}

uint64_t sub_24D02CF00()
{
  OUTLINED_FUNCTION_5();
  uint64_t v1 = sub_24D02AED8();
  *(void *)(v0 + 24) = v1;
  *(unsigned char *)(v0 + 32) = 7;
  return MEMORY[0x270FA2498](sub_24D02CF70, v1, 0);
}

uint64_t sub_24D02CF70()
{
  OUTLINED_FUNCTION_5();
  sub_24D01ECD4((unsigned char *)(v0 + 32));
  swift_release();
  OUTLINED_FUNCTION_4();
  return v1();
}

uint64_t sub_24D02CFD4()
{
  *(void *)(v1 + 16) = v0;
  return OUTLINED_FUNCTION_11_1((uint64_t)sub_24D02CFF0, v0);
}

uint64_t sub_24D02CFF0()
{
  OUTLINED_FUNCTION_5();
  uint64_t v1 = sub_24D02AF34();
  *(void *)(v0 + 24) = v1;
  return MEMORY[0x270FA2498](sub_24D02D058, v1, 0);
}

uint64_t sub_24D02D058()
{
  OUTLINED_FUNCTION_5();
  *(unsigned char *)(v0 + 49) = *(unsigned char *)(*(void *)(v0 + 24) + 128);
  swift_release();
  OUTLINED_FUNCTION_13_1();
  return MEMORY[0x270FA2498](v1, v2, v3);
}

uint64_t sub_24D02D0C0()
{
  OUTLINED_FUNCTION_5();
  if (*(unsigned char *)(v0 + 49) == 3)
  {
    uint64_t v1 = sub_24D02AF34();
    *(void *)(v0 + 32) = v1;
    *(unsigned char *)(v0 + 48) = 4;
    return MEMORY[0x270FA2498](sub_24D02D1A4, v1, 0);
  }
  else
  {
    uint64_t v2 = (void *)swift_task_alloc();
    *(void *)(v0 + 40) = v2;
    *uint64_t v2 = v0;
    v2[1] = sub_24D02D208;
    return sub_24D02C6D8();
  }
}

uint64_t sub_24D02D1A4()
{
  OUTLINED_FUNCTION_5();
  sub_24D034A6C((unsigned char *)(v0 + 48));
  swift_release();
  OUTLINED_FUNCTION_4();
  return v1();
}

uint64_t sub_24D02D208()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_6();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_4();
  return v3();
}

uint64_t sub_24D02D2C8()
{
  OUTLINED_FUNCTION_5();
  v1[19] = v2;
  v1[20] = v0;
  uint64_t v3 = sub_24D044298();
  v1[21] = v3;
  OUTLINED_FUNCTION_1_4(v3);
  v1[22] = v4;
  v1[23] = swift_task_alloc();
  v1[24] = swift_task_alloc();
  v1[25] = swift_task_alloc();
  v1[26] = swift_task_alloc();
  OUTLINED_FUNCTION_13_1();
  return MEMORY[0x270FA2498](v5, v6, v7);
}

uint64_t sub_24D02D384()
{
  OUTLINED_FUNCTION_5();
  uint64_t v1 = sub_24D02AED8();
  *(void *)(v0 + 216) = v1;
  return MEMORY[0x270FA2498](sub_24D02D3EC, v1, 0);
}

uint64_t sub_24D02D3EC()
{
  OUTLINED_FUNCTION_5();
  uint64_t v1 = *(void **)(*(void *)(v0 + 216) + OBJC_IVAR____TtC6DropIn18AppStateActivation_session);
  *(void *)(v0 + 224) = v1;
  id v2 = v1;
  swift_release();
  OUTLINED_FUNCTION_12_1();
  return MEMORY[0x270FA2498](v3, v4, v5);
}

uint64_t sub_24D02D46C()
{
  uint64_t v49 = v0;
  uint64_t v1 = *(void **)(v0 + 224);
  if (v1)
  {
    uint64_t v2 = OUTLINED_FUNCTION_4_1();
    v3(v2);
    id v4 = v1;
    uint64_t v5 = sub_24D044278();
    os_log_type_t v6 = sub_24D044618();
    BOOL v7 = os_log_type_enabled(v5, v6);
    uint64_t v8 = *(NSObject **)(v0 + 224);
    if (v7)
    {
      uint64_t v9 = (uint8_t *)OUTLINED_FUNCTION_31();
      uint64_t v10 = (void *)OUTLINED_FUNCTION_34();
      *(_DWORD *)uint64_t v9 = 138412290;
      *(void *)(v0 + 144) = v8;
      uint64_t v11 = v8;
      OUTLINED_FUNCTION_27_0();
      *uint64_t v10 = v8;

      _os_log_impl(&dword_24D00D000, v5, v6, "Already processing a different Drop In session. Ignoring incoming session for now. Active Session: %@.", v9, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26984F7C0);
      OUTLINED_FUNCTION_29_0();
      OUTLINED_FUNCTION_7();
      OUTLINED_FUNCTION_7();
    }
    else
    {

      uint64_t v5 = v8;
      uint64_t v11 = v8;
    }

    OUTLINED_FUNCTION_15_0();
    v17();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    OUTLINED_FUNCTION_4();
    OUTLINED_FUNCTION_10_0();
    __asm { BRAA            X1, X16 }
  }
  if (MEMORY[0x25331C870](*(void *)(v0 + 160) + 112)
    && (uint64_t v12 = *(void *)(*(void *)(v0 + 160) + 120),
        uint64_t ObjectType = swift_getObjectType(),
        LOBYTE(v12) = (*(uint64_t (**)(uint64_t, uint64_t))(v12 + 32))(ObjectType, v12),
        swift_unknownObjectRelease(),
        (v12 & 1) == 0))
  {
    uint64_t v20 = *(void *)(v0 + 200);
    uint64_t v21 = *(void *)(v0 + 168);
    uint64_t v22 = *(void *)(v0 + 176);
    uint64_t v23 = *(void *)(v0 + 160);
    uint64_t v24 = OBJC_IVAR____TtC6DropIn18AppStateController_logger;
    *(void *)(v0 + 232) = OBJC_IVAR____TtC6DropIn18AppStateController_logger;
    id v25 = *(void (**)(uint64_t, uint64_t, uint64_t))(v22 + 16);
    *(void *)(v0 + 240) = v25;
    *(void *)(v0 + 248) = (v22 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
    v25(v20, v23 + v24, v21);
    uint64_t v26 = sub_24D044278();
    os_log_type_t v27 = sub_24D044618();
    if (os_log_type_enabled(v26, v27))
    {
      *(_WORD *)swift_slowAlloc() = 0;
      OUTLINED_FUNCTION_38_0(&dword_24D00D000, v28, v29, "Client does not wish to proceed. Cancelling session.");
      OUTLINED_FUNCTION_7();
    }
    uint64_t v30 = *(void *)(v0 + 200);
    uint64_t v31 = *(void *)(v0 + 168);
    uint64_t v32 = *(void *)(v0 + 176);
    uint64_t v33 = *(void **)(v0 + 152);

    uint64_t v34 = *(void (**)(uint64_t, uint64_t))(v32 + 8);
    *(void *)(v0 + 256) = v34;
    *(void *)(v0 + 264) = (v32 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
    v34(v30, v31);
    uint64_t v35 = MEMORY[0x263F8D310];
    uint64_t v47 = sub_24D0443D8();
    uint64_t v36 = sub_24D044428();
    v48[3] = v35;
    v48[0] = 0xD00000000000001BLL;
    v48[1] = 0x800000024D0489F0;
    sub_24D032E50((uint64_t)v48, v36, v37);
    uint64_t v38 = sub_24D044428();
    uint64_t v40 = v39;
    id v41 = objc_allocWithZone(MEMORY[0x263F087E8]);
    id v42 = sub_24D032ED4(v38, v40, 5, v47);
    uint64_t v43 = sub_24D044168();
    *(void *)(v0 + 272) = v43;

    *(void *)(v0 + 16) = v0;
    *(void *)(v0 + 24) = sub_24D02D940;
    uint64_t v44 = swift_continuation_init();
    *(void *)(v0 + 80) = MEMORY[0x263EF8330];
    *(void *)(v0 + 88) = 0x40000000;
    *(void *)(v0 + 96) = sub_24D0342D0;
    *(void *)(v0 + 104) = &block_descriptor_59;
    *(void *)(v0 + 112) = v44;
    objc_msgSend(v33, sel_cancelWithError_completionHandler_, v43, v0 + 80);
    OUTLINED_FUNCTION_10_0();
    return MEMORY[0x270FA23F0](v45);
  }
  else
  {
    objc_msgSend(*(id *)(v0 + 152), sel_setDelegate_, *(void *)(*(void *)(v0 + 160) + OBJC_IVAR____TtC6DropIn18AppStateController_observer));
    uint64_t v14 = (void *)swift_task_alloc();
    *(void *)(v0 + 288) = v14;
    *uint64_t v14 = v0;
    v14[1] = sub_24D02DBF0;
    OUTLINED_FUNCTION_10_0();
    return sub_24D02B4BC();
  }
}

uint64_t sub_24D02D940()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1();
  uint64_t v1 = *(void *)(v0 + 48);
  *(void *)(v2 + 280) = v1;
  uint64_t v3 = *(void *)(v0 + 160);
  if (v1) {
    id v4 = sub_24D02DD24;
  }
  else {
    id v4 = sub_24D02DA38;
  }
  return MEMORY[0x270FA2498](v4, v3, 0);
}

uint64_t sub_24D02DA38(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  OUTLINED_FUNCTION_30_0();
  uint64_t v13 = *(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 240);
  uint64_t v14 = *(void *)(v12 + 232);
  uint64_t v15 = *(void *)(v12 + 192);
  uint64_t v17 = *(void *)(v12 + 160);
  uint64_t v16 = *(void *)(v12 + 168);
  char v18 = *(void **)(v12 + 152);

  v13(v15, v17 + v14, v16);
  id v19 = v18;
  uint64_t v20 = sub_24D044278();
  os_log_type_t v21 = sub_24D044618();
  if (os_log_type_enabled(v20, v21))
  {
    uint64_t v22 = *(void **)(v12 + 152);
    uint64_t v23 = (uint8_t *)OUTLINED_FUNCTION_31();
    a9 = (void *)OUTLINED_FUNCTION_34();
    *(_DWORD *)uint64_t v23 = 138412290;
    *(void *)(v12 + 136) = v22;
    id v24 = v22;
    sub_24D044768();
    *a9 = v22;

    _os_log_impl(&dword_24D00D000, v20, v21, "Canceled session: %@", v23, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26984F7C0);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_7();
    OUTLINED_FUNCTION_7();
  }
  else
  {

    uint64_t v20 = *(NSObject **)(v12 + 152);
  }
  id v25 = *(void (**)(uint64_t))(v12 + 256);

  uint64_t v26 = OUTLINED_FUNCTION_42();
  v25(v26);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_26_0();
  return v28(v27, v28, v29, v30, v31, v32, v33, v34, a9, a10, a11, a12);
}

uint64_t sub_24D02DBF0()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_8_1();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_6();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_31_0();
  return v3();
}

void sub_24D02DD24()
{
  uint64_t v2 = *(void **)(v0 + 272);
  uint64_t v1 = *(void **)(v0 + 280);
  uint64_t v3 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 240);
  uint64_t v4 = *(void *)(v0 + 184);
  uint64_t v5 = *(void *)(v0 + 168);
  uint64_t v6 = *(void **)(v0 + 152);
  uint64_t v7 = *(void *)(v0 + 160) + *(void *)(v0 + 232);
  swift_willThrow();

  v3(v4, v7, v5);
  id v8 = v6;
  id v9 = v1;
  id v10 = v8;
  id v11 = v1;
  uint64_t v12 = sub_24D044278();
  os_log_type_t v13 = sub_24D044608();
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v14 = *(void **)(v0 + 280);
    id v25 = v14;
    uint64_t v15 = *(void **)(v0 + 152);
    log = v12;
    uint64_t v16 = swift_slowAlloc();
    uint64_t v17 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v16 = 138412546;
    id v18 = v14;
    uint64_t v19 = _swift_stdlib_bridgeErrorToNSError();
    *(void *)(v0 + 120) = v19;
    sub_24D044768();
    void *v17 = v19;

    *(_WORD *)(v16 + 12) = 2112;
    *(void *)(v0 + 128) = v15;
    id v20 = v15;
    sub_24D044768();
    v17[1] = v15;

    _os_log_impl(&dword_24D00D000, log, v13, "Failed to cancel session: %@. Session: %@.", (uint8_t *)v16, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26984F7C0);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_7();
    OUTLINED_FUNCTION_7();
  }
  else
  {
    os_log_type_t v21 = *(void **)(v0 + 280);
    uint64_t v22 = *(void **)(v0 + 152);
  }
  (*(void (**)(void, void))(v0 + 256))(*(void *)(v0 + 184), *(void *)(v0 + 168));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_25_0();
  __asm { BRAA            X1, X16 }
}

uint64_t sub_24D02DF8C(uint64_t a1)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = v1;
  return OUTLINED_FUNCTION_11_1((uint64_t)sub_24D02DFA8, v1);
}

uint64_t sub_24D02DFA8()
{
  OUTLINED_FUNCTION_5();
  if (objc_msgSend(*(id *)(v0 + 16), sel_state) == (id)6 || objc_msgSend(*(id *)(v0 + 16), sel_state) == (id)7)
  {
    OUTLINED_FUNCTION_4();
    return v1();
  }
  else
  {
    uint64_t v3 = (void *)swift_task_alloc();
    *(void *)(v0 + 32) = v3;
    *uint64_t v3 = v0;
    v3[1] = sub_24D02E090;
    return sub_24D02D2C8();
  }
}

uint64_t sub_24D02E090()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_6();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_4();
  return v3();
}

uint64_t sub_24D02E150()
{
  OUTLINED_FUNCTION_5();
  v1[8] = v2;
  v1[9] = v0;
  v1[6] = v3;
  v1[7] = v4;
  uint64_t v5 = sub_24D044298();
  v1[10] = v5;
  OUTLINED_FUNCTION_1_4(v5);
  v1[11] = v6;
  v1[12] = swift_task_alloc();
  v1[13] = swift_task_alloc();
  v1[14] = swift_task_alloc();
  OUTLINED_FUNCTION_13_1();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_24D02E204()
{
  uint64_t v2 = v0[9];
  uint64_t v3 = OBJC_IVAR____TtC6DropIn18AppStateController_lastDropInState;
  v0[15] = OBJC_IVAR____TtC6DropIn18AppStateController_lastDropInState;
  uint64_t v4 = v2 + v3;
  if ((*(unsigned char *)(v4 + 8) & 1) != 0 || *(void *)v4 != v0[7])
  {
    uint64_t v17 = sub_24D02AED8();
    v0[16] = v17;
    return MEMORY[0x270FA2498](sub_24D02E47C, v17, 0);
  }
  else
  {
    (*(void (**)(void, uint64_t, void))(v0[11] + 16))(v0[12], v2 + OBJC_IVAR____TtC6DropIn18AppStateController_logger, v0[10]);
    uint64_t v5 = sub_24D044278();
    os_log_type_t v6 = sub_24D0445E8();
    BOOL v7 = OUTLINED_FUNCTION_14_0(v6);
    uint64_t v9 = v0[11];
    uint64_t v8 = v0[12];
    uint64_t v10 = v0[10];
    if (v7)
    {
      uint64_t v11 = v0[7];
      uint64_t v12 = (uint8_t *)OUTLINED_FUNCTION_31();
      swift_slowAlloc();
      *(_DWORD *)uint64_t v12 = 136315138;
      id v13 = objc_msgSend(self, sel_stringForDropInSessionState_, v11);
      sub_24D044428();

      uint64_t v14 = OUTLINED_FUNCTION_42();
      v0[5] = sub_24D0390E4(v14, v15, v16);
      sub_24D044768();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_24D00D000, v5, v1, "Ignoring repeated state update: %s", v12, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_7();
      OUTLINED_FUNCTION_7();

      (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v8, v10);
    }
    else
    {

      uint64_t v18 = OUTLINED_FUNCTION_42();
      v20(v18, v19);
    }
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    OUTLINED_FUNCTION_4();
    return v21();
  }
}

uint64_t sub_24D02E47C()
{
  OUTLINED_FUNCTION_5();
  os_log_type_t v1 = *(void **)(*(void *)(v0 + 128) + OBJC_IVAR____TtC6DropIn18AppStateActivation_session);
  *(void *)(v0 + 136) = v1;
  id v2 = v1;
  swift_release();
  OUTLINED_FUNCTION_12_1();
  return MEMORY[0x270FA2498](v3, v4, v5);
}

uint64_t sub_24D02E4FC()
{
  uint64_t v52 = v0;
  id v2 = *(void **)(v0 + 136);
  if (!v2
    || (unsigned int v3 = objc_msgSend(*(id *)(v0 + 136), sel_isEqual_, *(void *)(v0 + 48)), v2, !v3))
  {
    uint64_t v22 = *(void **)(v0 + 48);
    uint64_t v23 = OUTLINED_FUNCTION_4_1();
    v24(v23);
    id v25 = v22;
    uint64_t v26 = (void *)sub_24D044278();
    os_log_type_t v27 = sub_24D044618();
    BOOL v28 = OUTLINED_FUNCTION_14_0(v27);
    uint64_t v29 = *(void **)(v0 + 48);
    if (v28)
    {
      uint64_t v30 = (_DWORD *)OUTLINED_FUNCTION_31();
      uint64_t v31 = (void *)OUTLINED_FUNCTION_34();
      _DWORD *v30 = 138412290;
      *(void *)(v0 + 16) = v29;
      id v32 = v29;
      OUTLINED_FUNCTION_27_0();
      void *v31 = v29;

      OUTLINED_FUNCTION_19_0(&dword_24D00D000, v33, v34, "Ignoring session update from %@. A different session is already processing.");
      __swift_instantiateConcreteTypeFromMangledName(&qword_26984F7C0);
      OUTLINED_FUNCTION_29_0();
      OUTLINED_FUNCTION_7();
      OUTLINED_FUNCTION_7();
    }
    else
    {
    }
    (*(void (**)(void, void))(*(void *)(v0 + 88) + 8))(*(void *)(v0 + 104), *(void *)(v0 + 80));
    goto LABEL_9;
  }
  uint64_t v4 = OUTLINED_FUNCTION_4_1();
  v5(v4);
  os_log_type_t v6 = sub_24D044278();
  os_log_type_t v7 = sub_24D044618();
  BOOL v8 = OUTLINED_FUNCTION_14_0(v7);
  uint64_t v9 = *(void *)(v0 + 80);
  uint64_t v10 = *(void *)(v0 + 88);
  if (v8)
  {
    uint64_t v11 = *(void *)(v0 + 56);
    uint64_t v47 = *(void *)(v0 + 64);
    uint64_t v50 = *(void *)(v0 + 112);
    uint64_t v12 = swift_slowAlloc();
    uint64_t v51 = swift_slowAlloc();
    *(_DWORD *)uint64_t v12 = 136315394;
    uint64_t v49 = v9;
    os_log_type_t type = v1;
    id v13 = self;
    id v14 = objc_msgSend(v13, sel_stringForDropInSessionState_, v11);
    uint64_t v15 = sub_24D044428();
    unint64_t v17 = v16;

    *(void *)(v0 + 24) = sub_24D0390E4(v15, v17, &v51);
    sub_24D044768();
    swift_bridgeObjectRelease();
    *(_WORD *)(v12 + 12) = 2080;
    id v18 = objc_msgSend(v13, sel_stringForDropInSessionStateReason_, v47);
    uint64_t v19 = sub_24D044428();
    unint64_t v21 = v20;

    *(void *)(v0 + 32) = sub_24D0390E4(v19, v21, &v51);
    sub_24D044768();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24D00D000, v6, type, "Drop in session updated state: %s. Reason: %s.", (uint8_t *)v12, 0x16u);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_7();
    OUTLINED_FUNCTION_7();

    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v50, v49);
  }
  else
  {

    uint64_t v37 = OUTLINED_FUNCTION_42();
    v39(v37, v38);
  }
  uint64_t v40 = *(void *)(v0 + 56);
  uint64_t v41 = *(void *)(v0 + 72) + *(void *)(v0 + 120);
  *(void *)uint64_t v41 = v40;
  *(unsigned char *)(v41 + 8) = 0;
  if ((unint64_t)(v40 - 6) < 2)
  {
    id v42 = (void *)swift_task_alloc();
    *(void *)(v0 + 152) = v42;
    *id v42 = v0;
    v42[1] = sub_24D02EA94;
    OUTLINED_FUNCTION_10_0();
    return sub_24D02CFD4();
  }
  if (v40 != 4)
  {
LABEL_9:
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    OUTLINED_FUNCTION_4();
    OUTLINED_FUNCTION_10_0();
    __asm { BRAA            X1, X16 }
  }
  uint64_t v45 = (void *)swift_task_alloc();
  *(void *)(v0 + 144) = v45;
  *uint64_t v45 = v0;
  v45[1] = sub_24D02E97C;
  OUTLINED_FUNCTION_10_0();
  return sub_24D02CEE4();
}

uint64_t sub_24D02E97C()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_8_1();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_6();
  *id v2 = v1;
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_31_0();
  return v3();
}

uint64_t sub_24D02EA94()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_8_1();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_6();
  *id v2 = v1;
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_31_0();
  return v3();
}

uint64_t sub_24D02EBAC()
{
  OUTLINED_FUNCTION_5();
  v1[4] = v2;
  v1[5] = v0;
  v1[3] = v3;
  uint64_t v4 = sub_24D044298();
  v1[6] = v4;
  OUTLINED_FUNCTION_1_4(v4);
  v1[7] = v5;
  v1[8] = OUTLINED_FUNCTION_22_0();
  OUTLINED_FUNCTION_13_1();
  return MEMORY[0x270FA2498](v6, v7, v8);
}

uint64_t sub_24D02EC3C()
{
  OUTLINED_FUNCTION_5();
  uint64_t v1 = sub_24D02AED8();
  *(void *)(v0 + 72) = v1;
  return MEMORY[0x270FA2498](sub_24D02ECA4, v1, 0);
}

uint64_t sub_24D02ECA4()
{
  OUTLINED_FUNCTION_5();
  uint64_t v1 = *(void **)(*(void *)(v0 + 72) + OBJC_IVAR____TtC6DropIn18AppStateActivation_session);
  *(void *)(v0 + 80) = v1;
  id v2 = v1;
  swift_release();
  OUTLINED_FUNCTION_12_1();
  return MEMORY[0x270FA2498](v3, v4, v5);
}

uint64_t sub_24D02ED24()
{
  uint64_t v40 = v2;
  uint64_t v3 = *(void **)(v2 + 80);
  if (v3
    && (uint64_t v0 = (void **)objc_msgSend(*(id *)(v2 + 80), sel_isEqual_, *(void *)(v2 + 24)), v3, v0))
  {
    uint64_t v4 = *(void *)(v2 + 40);
    id v5 = *(id *)(v2 + 32);
    id v6 = objc_msgSend(v5, sel_value);
    uint64_t v36 = sub_24D044428();
    uint64_t v37 = v7;

    id v35 = objc_msgSend(v5, sel_type);
    uint64_t v34 = sub_24D02FB8C(v5, (SEL *)&selRef_givenName);
    uint64_t v9 = v8;
    uint64_t v10 = sub_24D02FB8C(v5, (SEL *)&selRef_familyName);
    uint64_t v12 = v11;
    uint64_t v13 = sub_24D02FB8C(v5, (SEL *)&selRef_displayName);
    uint64_t v15 = v14;
    uint64_t v16 = sub_24D02FBEC(v5);
    unint64_t v18 = v17;

    if (MEMORY[0x25331C870](v4 + 112))
    {
      uint64_t v19 = *(void *)(*(void *)(v2 + 40) + 120);
      uint64_t ObjectType = swift_getObjectType();
      v39[0] = v34;
      v39[1] = v9;
      v39[2] = v10;
      v39[3] = v12;
      v39[4] = v13;
      v39[5] = v15;
      v39[6] = v16;
      v39[7] = v18;
      v39[8] = v36;
      v39[9] = v37;
      v39[10] = v35;
      (*(void (**)(void *, uint64_t, uint64_t))(v19 + 16))(v39, ObjectType, v19);
      swift_unknownObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_24D02FEE0(v16, v18);
    }
    else
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_24D02FEE0(v16, v18);
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    OUTLINED_FUNCTION_35_0();
    uint64_t v21 = OUTLINED_FUNCTION_4_1();
    v22(v21);
    id v23 = v1;
    uint64_t v24 = (void *)sub_24D044278();
    os_log_type_t v25 = sub_24D044618();
    BOOL v26 = OUTLINED_FUNCTION_14_0(v25);
    os_log_type_t v27 = *v0;
    if (v26)
    {
      OUTLINED_FUNCTION_31();
      uint64_t v38 = (void *)OUTLINED_FUNCTION_34();
      id v28 = OUTLINED_FUNCTION_37_0(5.7779e-34);
      OUTLINED_FUNCTION_27_0();
      *uint64_t v38 = v27;

      OUTLINED_FUNCTION_19_0(&dword_24D00D000, v29, v30, "Ignoring session participant update from %@. A different session is already processing.");
      __swift_instantiateConcreteTypeFromMangledName(&qword_26984F7C0);
      OUTLINED_FUNCTION_28_0();
      OUTLINED_FUNCTION_7();
      OUTLINED_FUNCTION_7();
    }
    else
    {
    }
    OUTLINED_FUNCTION_15_0();
    v31();
  }
  swift_task_dealloc();
  OUTLINED_FUNCTION_4();
  return v32();
}

uint64_t sub_24D02EFFC(float a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_24D044298();
  OUTLINED_FUNCTION_1_0();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v9, v2 + OBJC_IVAR____TtC6DropIn18AppStateController_logger, v4);
  uint64_t v10 = sub_24D044278();
  os_log_type_t v11 = sub_24D0445F8();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = (uint8_t *)OUTLINED_FUNCTION_31();
    *(_DWORD *)uint64_t v12 = 134217984;
    v16[1] = a1;
    sub_24D044768();
    _os_log_impl(&dword_24D00D000, v10, v11, "Downlink audio power: %f", v12, 0xCu);
    OUTLINED_FUNCTION_7();
  }

  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v4);
  uint64_t result = MEMORY[0x25331C870](v2 + 112);
  if (result)
  {
    uint64_t v14 = *(void *)(v2 + 120);
    uint64_t ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t, uint64_t, float))(v14 + 8))(ObjectType, v14, a1);
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_24D02F19C()
{
  OUTLINED_FUNCTION_5();
  v1[4] = v2;
  v1[5] = v0;
  v1[3] = v3;
  uint64_t v4 = sub_24D044298();
  v1[6] = v4;
  OUTLINED_FUNCTION_1_4(v4);
  v1[7] = v5;
  v1[8] = OUTLINED_FUNCTION_22_0();
  OUTLINED_FUNCTION_13_1();
  return MEMORY[0x270FA2498](v6, v7, v8);
}

uint64_t sub_24D02F22C()
{
  OUTLINED_FUNCTION_5();
  uint64_t v1 = sub_24D02AED8();
  *(void *)(v0 + 72) = v1;
  return MEMORY[0x270FA2498](sub_24D02F294, v1, 0);
}

uint64_t sub_24D02F294()
{
  OUTLINED_FUNCTION_5();
  uint64_t v1 = *(void **)(*(void *)(v0 + 72) + OBJC_IVAR____TtC6DropIn18AppStateActivation_session);
  *(void *)(v0 + 80) = v1;
  id v2 = v1;
  swift_release();
  OUTLINED_FUNCTION_12_1();
  return MEMORY[0x270FA2498](v3, v4, v5);
}

uint64_t sub_24D02F314(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  OUTLINED_FUNCTION_30_0();
  uint64_t v15 = *(void **)(v14 + 80);
  if (v15
    && (uint64_t v12 = (void **)objc_msgSend(*(id *)(v14 + 80), sel_isEqual_, *(void *)(v14 + 24)),
        v15,
        v12))
  {
    if (MEMORY[0x25331C870](*(void *)(v14 + 40) + 112))
    {
      uint64_t v16 = *(void *)(v14 + 32);
      uint64_t v17 = *(void *)(*(void *)(v14 + 40) + 120);
      uint64_t ObjectType = swift_getObjectType();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v17 + 24))(v16, ObjectType, v17);
      swift_unknownObjectRelease();
    }
  }
  else
  {
    OUTLINED_FUNCTION_35_0();
    uint64_t v19 = OUTLINED_FUNCTION_4_1();
    v20(v19);
    id v21 = v13;
    uint64_t v22 = (void *)sub_24D044278();
    os_log_type_t v23 = sub_24D044618();
    BOOL v24 = OUTLINED_FUNCTION_14_0(v23);
    os_log_type_t v25 = *v12;
    if (v24)
    {
      OUTLINED_FUNCTION_31();
      a9 = (void *)OUTLINED_FUNCTION_34();
      id v26 = OUTLINED_FUNCTION_37_0(5.7779e-34);
      OUTLINED_FUNCTION_27_0();
      *a9 = v25;

      OUTLINED_FUNCTION_19_0(&dword_24D00D000, v27, v28, "Ignoring session end date update from %@. A different session is already processing.");
      __swift_instantiateConcreteTypeFromMangledName(&qword_26984F7C0);
      OUTLINED_FUNCTION_28_0();
      OUTLINED_FUNCTION_7();
      OUTLINED_FUNCTION_7();
    }
    else
    {
    }
    (*(void (**)(void, void))(*(void *)(v14 + 56) + 8))(*(void *)(v14 + 64), *(void *)(v14 + 48));
  }
  swift_task_dealloc();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_26_0();
  return v30(v29, v30, v31, v32, v33, v34, v35, v36, a9, a10, a11, a12);
}

uint64_t AppStateController.deinit()
{
  sub_24D02A190(v0 + 112);
  sub_24D044298();
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_11_0();
  v1();

  swift_release();
  sub_24D030208(v0 + OBJC_IVAR____TtC6DropIn18AppStateController_activationStatesContinuation, &qword_26984FA08);
  swift_release();
  sub_24D030208(v0 + OBJC_IVAR____TtC6DropIn18AppStateController_deactivationStatesContinuation, &qword_26984FA10);
  swift_defaultActor_destroy();
  return v0;
}

uint64_t AppStateController.__deallocating_deinit()
{
  AppStateController.deinit();
  return MEMORY[0x270FA2418](v0);
}

uint64_t AppStateController.unownedExecutor.getter()
{
  return v0;
}

uint64_t sub_24D02F5E0()
{
  return AppStateController.unownedExecutor.getter();
}

unint64_t sub_24D02F5FC()
{
  unint64_t result = qword_26984F9F8;
  if (!qword_26984F9F8)
  {
    type metadata accessor for AppStateController();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26984F9F8);
  }
  return result;
}

uint64_t type metadata accessor for AppStateController()
{
  uint64_t result = qword_26984FA18;
  if (!qword_26984FA18) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_24D02F698()
{
  OUTLINED_FUNCTION_9();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_2(v0);
  void *v1 = v2;
  v1[1] = sub_24D021A90;
  OUTLINED_FUNCTION_26();
  return sub_24D02AE48();
}

uint64_t dispatch thunk of AppStateControllerDelegate.controllerDidUpdateDownlinkAudioPower(_:)(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of AppStateControllerDelegate.controllerDidUpdateDroppedInUser(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t dispatch thunk of AppStateControllerDelegate.controllerDidUpdateSessionEndDate(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t dispatch thunk of AppStateControllerDelegate.controllerShouldProceedWithIncomingSession()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of AppStateControllerDelegate.controllerWillActivate(stateStream:droppedInUser:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 40))();
}

uint64_t dispatch thunk of AppStateControllerDelegate.controllerWillDeactivate(stateStream:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 48))();
}

uint64_t sub_24D02F7A8()
{
  return type metadata accessor for AppStateController();
}

void sub_24D02F7B0()
{
  sub_24D044298();
  if (v0 <= 0x3F)
  {
    sub_24D02FB3C(319, &qword_26984FA70, &qword_26984F9A0);
    if (v1 <= 0x3F)
    {
      sub_24D02FB3C(319, &qword_26984FA78, &qword_26984F9B8);
      if (v2 <= 0x3F) {
        swift_updateClassMetadata2();
      }
    }
  }
}

uint64_t method lookup function for AppStateController(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for AppStateController);
}

uint64_t dispatch thunk of AppStateController.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 168))();
}

uint64_t dispatch thunk of AppStateController.setDelegate(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 176))();
}

uint64_t dispatch thunk of AppStateController.checkPendingSession()()
{
  OUTLINED_FUNCTION_9();
  uint64_t v4 = (uint64_t (*)(void))(*(void *)(*(void *)v0 + 184) + **(int **)(*(void *)v0 + 184));
  unint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  *unint64_t v2 = v1;
  v2[1] = sub_24D02FA4C;
  return v4();
}

uint64_t sub_24D02FA4C()
{
  OUTLINED_FUNCTION_5();
  uint64_t v2 = v1;
  OUTLINED_FUNCTION_0_1();
  uint64_t v3 = *v0;
  OUTLINED_FUNCTION_6();
  void *v4 = v3;
  swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(uint64_t))(v3 + 8);
  return v5(v2);
}

uint64_t dispatch thunk of AppStateController.endSession()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 192))();
}

void sub_24D02FB3C(uint64_t a1, unint64_t *a2, uint64_t *a3)
{
  if (!*a2)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a3);
    unint64_t v4 = sub_24D044758();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t sub_24D02FB8C(void *a1, SEL *a2)
{
  id v2 = [a1 *a2];
  if (!v2) {
    return 0;
  }
  uint64_t v3 = v2;
  uint64_t v4 = sub_24D044428();

  return v4;
}

uint64_t sub_24D02FBEC(void *a1)
{
  id v1 = objc_msgSend(a1, sel_imageData);
  if (!v1) {
    return 0;
  }
  id v2 = v1;
  uint64_t v3 = sub_24D0441C8();

  return v3;
}

uint64_t sub_24D02FC50(uint64_t a1, int *a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v5 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v3;
  *uint64_t v3 = v2;
  v3[1] = sub_24D02FD30;
  return v5(v2 + 32);
}

uint64_t sub_24D02FD30()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1();
  uint64_t v2 = v1;
  uint64_t v4 = *(unsigned char **)(v3 + 16);
  uint64_t v5 = *v0;
  OUTLINED_FUNCTION_6();
  *uint64_t v6 = v5;
  swift_task_dealloc();
  unsigned char *v4 = *(unsigned char *)(v2 + 32);
  OUTLINED_FUNCTION_4();
  return v7();
}

uint64_t sub_24D02FE10()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_24D02FE48()
{
  OUTLINED_FUNCTION_9();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_2(v0);
  void *v1 = v2;
  v1[1] = sub_24D021A90;
  uint64_t v3 = OUTLINED_FUNCTION_21_0();
  return v4(v3);
}

uint64_t sub_24D02FEE0(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_24D02FEF4(a1, a2);
  }
  return a1;
}

uint64_t sub_24D02FEF4(uint64_t a1, unint64_t a2)
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

uint64_t sub_24D02FF4C()
{
  swift_weakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_24D02FF84(uint64_t a1)
{
  return sub_24D02CA98(a1);
}

uint64_t sub_24D02FF8C()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_24D02FFCC(uint64_t a1)
{
  return sub_24D02BA98(a1, *(void *)(v1 + 16), *(void **)(v1 + 24));
}

unint64_t sub_24D02FFD4()
{
  unint64_t result = qword_26984FCD0;
  if (!qword_26984FCD0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, &qword_26984FCD0);
  }
  return result;
}

uint64_t sub_24D030014(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, unint64_t a8, uint64_t a9, uint64_t a10)
{
  if (a10)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_24D02FEE0(a7, a8);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_24D0300A4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(a3);
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_39_0();
  v4();
  return a2;
}

uint64_t sub_24D0300FC()
{
  swift_unknownObjectRelease();
  swift_release();

  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_24D030144(uint64_t a1)
{
  uint64_t v3 = v1[2];
  uint64_t v4 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v5 = v1[5];
  uint64_t v7 = swift_task_alloc();
  uint64_t v8 = (void *)OUTLINED_FUNCTION_2(v7);
  void *v8 = v9;
  v8[1] = sub_24D022180;
  return sub_24D02BFD8(a1, v3, v4, v6, v5);
}

void sub_24D0301FC(id a1, char a2)
{
  if (a2) {
}
  }

uint64_t sub_24D030208(uint64_t a1, uint64_t *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_11_0();
  v3();
  return a1;
}

uint64_t sub_24D03025C()
{
  OUTLINED_FUNCTION_9();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_2(v0);
  void *v1 = v2;
  v1[1] = sub_24D022180;
  uint64_t v3 = OUTLINED_FUNCTION_26();
  return sub_24D02B304(v3, v4, v5, v6);
}

uint64_t sub_24D0302F4(uint64_t a1)
{
  return sub_24D02B110(a1, v1, &qword_26984FA10, &qword_26984F9B8, &OBJC_IVAR____TtC6DropIn18AppStateController_deactivationStatesContinuation);
}

uint64_t sub_24D030328(uint64_t a1)
{
  return sub_24D02B110(a1, v1, &qword_26984FA08, &qword_26984F9A0, &OBJC_IVAR____TtC6DropIn18AppStateController_activationStatesContinuation);
}

uint64_t sub_24D03035C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(a3);
  OUTLINED_FUNCTION_14();
  (*(void (**)(uint64_t, uint64_t))(v5 + 40))(a2, a1);
  return a2;
}

uint64_t OUTLINED_FUNCTION_1_4(uint64_t a1)
{
  return a1 - 8;
}

uint64_t OUTLINED_FUNCTION_4_1()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_11_1(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA2498](a1, a2, 0);
}

BOOL OUTLINED_FUNCTION_14_0(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

void OUTLINED_FUNCTION_19_0(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v6, a4, v5, 0xCu);
}

uint64_t OUTLINED_FUNCTION_21_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_22_0()
{
  return swift_task_alloc();
}

uint64_t OUTLINED_FUNCTION_27_0()
{
  return sub_24D044768();
}

uint64_t OUTLINED_FUNCTION_28_0()
{
  return swift_arrayDestroy();
}

uint64_t OUTLINED_FUNCTION_29_0()
{
  return swift_arrayDestroy();
}

uint64_t OUTLINED_FUNCTION_31_0()
{
  return v0 + 8;
}

uint64_t OUTLINED_FUNCTION_33_0(void *a1)
{
  a1[2] = v1;
  a1[3] = v2;
  a1[4] = v1;
  return swift_retain_n();
}

uint64_t OUTLINED_FUNCTION_34_0(uint64_t a1)
{
  return __swift_storeEnumTagSinglePayload(v1, 1, 1, a1);
}

void OUTLINED_FUNCTION_36_0(uint64_t a1@<X8>)
{
  uint64_t v2 = v1 + a1;
  *(void *)uint64_t v2 = 0;
  *(unsigned char *)(v2 + 8) = 1;
}

id OUTLINED_FUNCTION_37_0(float a1)
{
  float *v1 = a1;
  *uint64_t v2 = v3;
  return v3;
}

void OUTLINED_FUNCTION_38_0(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v5, v4, a4, v6, 2u);
}

uint64_t OUTLINED_FUNCTION_42()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_43()
{
  return sub_24D044548();
}

uint64_t sub_24D030670(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[3] = a4;
  v5[4] = a5;
  v5[2] = a1;
  return MEMORY[0x270FA2498](sub_24D030694, 0, 0);
}

uint64_t sub_24D030694()
{
  OUTLINED_FUNCTION_5();
  uint64_t Strong = swift_weakLoadStrong();
  v0[5] = Strong;
  if (Strong)
  {
    uint64_t v2 = (void *)swift_task_alloc();
    v0[6] = (uint64_t)v2;
    *uint64_t v2 = v0;
    v2[1] = sub_24D03076C;
    OUTLINED_FUNCTION_16_0(v0[4]);
    return sub_24D02D2C8();
  }
  else
  {
    OUTLINED_FUNCTION_2_1();
    return v4();
  }
}

uint64_t sub_24D03076C()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_6();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  swift_release();
  OUTLINED_FUNCTION_8_2();
  return MEMORY[0x270FA2498](v3, v4, v5);
}

uint64_t sub_24D030850()
{
  return OUTLINED_FUNCTION_0_2(*(void *)(v0 + 40));
}

uint64_t sub_24D0308E8(uint64_t a1, void *a2)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B184BF0);
  uint64_t v6 = OUTLINED_FUNCTION_12(v5);
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_14_1();
  uint64_t v7 = sub_24D044548();
  OUTLINED_FUNCTION_10_1(v3, v8, v9, v7);
  uint64_t v10 = (void *)swift_allocObject();
  v10[2] = 0;
  v10[3] = 0;
  v10[4] = v2;
  v10[5] = a2;
  id v11 = v2;
  id v12 = a2;
  sub_24D02A438();
  return swift_release();
}

uint64_t sub_24D0309A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[3] = a4;
  v5[4] = a5;
  v5[2] = a1;
  return MEMORY[0x270FA2498](sub_24D0309C8, 0, 0);
}

uint64_t sub_24D0309C8()
{
  OUTLINED_FUNCTION_5();
  uint64_t Strong = swift_weakLoadStrong();
  v0[5] = Strong;
  if (Strong)
  {
    uint64_t v2 = (void *)swift_task_alloc();
    v0[6] = (uint64_t)v2;
    *uint64_t v2 = v0;
    v2[1] = sub_24D03076C;
    uint64_t v3 = OUTLINED_FUNCTION_16_0(v0[4]);
    return sub_24D02DF8C(v3);
  }
  else
  {
    OUTLINED_FUNCTION_2_1();
    return v5();
  }
}

uint64_t sub_24D030B30(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B184BF0);
  uint64_t v9 = OUTLINED_FUNCTION_12(v8);
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_14_1();
  uint64_t v10 = sub_24D044548();
  OUTLINED_FUNCTION_10_1(v4, v11, v12, v10);
  uint64_t v13 = (void *)swift_allocObject();
  void v13[2] = 0;
  v13[3] = 0;
  v13[4] = v3;
  v13[5] = a1;
  v13[6] = a2;
  v13[7] = a3;
  id v14 = v3;
  id v15 = a1;
  sub_24D02A438();
  return swift_release();
}

uint64_t sub_24D030C04(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v7[5] = a6;
  v7[6] = a7;
  v7[3] = a4;
  v7[4] = a5;
  id v7[2] = a1;
  return MEMORY[0x270FA2498](sub_24D030C2C, 0, 0);
}

uint64_t sub_24D030C2C()
{
  OUTLINED_FUNCTION_5();
  uint64_t Strong = swift_weakLoadStrong();
  v0[7] = Strong;
  if (Strong)
  {
    uint64_t v2 = (void *)swift_task_alloc();
    v0[8] = (uint64_t)v2;
    *uint64_t v2 = v0;
    v2[1] = sub_24D030D08;
    OUTLINED_FUNCTION_16_0(v0[4]);
    return sub_24D02E150();
  }
  else
  {
    OUTLINED_FUNCTION_2_1();
    return v4();
  }
}

uint64_t sub_24D030D08()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_6();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  swift_release();
  OUTLINED_FUNCTION_8_2();
  return MEMORY[0x270FA2498](v3, v4, v5);
}

uint64_t sub_24D030DEC()
{
  return OUTLINED_FUNCTION_0_2(*(void *)(v0 + 56));
}

uint64_t sub_24D030E6C(void *a1, void *a2)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B184BF0);
  uint64_t v6 = OUTLINED_FUNCTION_12(v5);
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24D044528();
  uint64_t v9 = sub_24D044548();
  OUTLINED_FUNCTION_10_1((uint64_t)v8, v10, v11, v9);
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = v2;
  v12[5] = a1;
  v12[6] = a2;
  id v13 = v2;
  id v14 = a1;
  id v15 = a2;
  sub_24D02A438();
  return swift_release();
}

uint64_t sub_24D030F5C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 16) = a1;
  *(void *)(v4 + 24) = a4;
  return MEMORY[0x270FA2498](sub_24D030F7C, 0, 0);
}

uint64_t sub_24D030F7C()
{
  OUTLINED_FUNCTION_5();
  uint64_t Strong = swift_weakLoadStrong();
  *(void *)(v0 + 32) = Strong;
  if (Strong)
  {
    uint64_t v2 = (void *)swift_task_alloc();
    *(void *)(v0 + 40) = v2;
    *uint64_t v2 = v0;
    v2[1] = sub_24D031050;
    return sub_24D02CFD4();
  }
  else
  {
    OUTLINED_FUNCTION_2_1();
    return v4();
  }
}

uint64_t sub_24D031050()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_6();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  swift_release();
  OUTLINED_FUNCTION_8_2();
  return MEMORY[0x270FA2498](v3, v4, v5);
}

uint64_t sub_24D0311A8(void *a1, unint64_t a2)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B184BF0);
  uint64_t v7 = OUTLINED_FUNCTION_12(v6);
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_24();
  if (a2 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t result = sub_24D044888();
    if (result) {
      goto LABEL_3;
    }
LABEL_8:
    return swift_bridgeObjectRelease();
  }
  uint64_t v8 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t result = swift_bridgeObjectRetain();
  if (!v8) {
    goto LABEL_8;
  }
LABEL_3:
  if ((a2 & 0xC000000000000001) != 0)
  {
    id v10 = (id)MEMORY[0x25331BE00](0, a2);
    goto LABEL_6;
  }
  if (*(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    id v10 = *(id *)(a2 + 32);
LABEL_6:
    id v11 = v10;
    swift_bridgeObjectRelease();
    sub_24D044528();
    uint64_t v12 = sub_24D044548();
    OUTLINED_FUNCTION_10_1(v3, v13, v14, v12);
    id v15 = (void *)swift_allocObject();
    id v15[2] = 0;
    v15[3] = 0;
    v15[4] = v2;
    v15[5] = a1;
    v15[6] = v11;
    id v16 = v2;
    id v17 = a1;
    sub_24D02A438();
    return swift_release();
  }
  __break(1u);
  return result;
}

uint64_t sub_24D031328(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[4] = a5;
  v6[5] = a6;
  v6[2] = a1;
  v6[3] = a4;
  return MEMORY[0x270FA2498](sub_24D03134C, 0, 0);
}

uint64_t sub_24D03134C()
{
  OUTLINED_FUNCTION_5();
  uint64_t Strong = swift_weakLoadStrong();
  v0[6] = Strong;
  if (Strong)
  {
    uint64_t v2 = (void *)swift_task_alloc();
    v0[7] = (uint64_t)v2;
    *uint64_t v2 = v0;
    v2[1] = sub_24D031424;
    OUTLINED_FUNCTION_16_0(v0[4]);
    return sub_24D02EBAC();
  }
  else
  {
    OUTLINED_FUNCTION_2_1();
    return v4();
  }
}

uint64_t sub_24D031424()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_6();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  swift_release();
  OUTLINED_FUNCTION_8_2();
  return MEMORY[0x270FA2498](v3, v4, v5);
}

uint64_t sub_24D031588(void *a1, uint64_t a2)
{
  uint64_t v4 = v2;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B184BF0);
  uint64_t v8 = OUTLINED_FUNCTION_12(v7);
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_24();
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26984FCB8);
  uint64_t v10 = OUTLINED_FUNCTION_12(v9);
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (char *)&v31 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_24D044218();
  OUTLINED_FUNCTION_1_0();
  uint64_t v15 = v14;
  uint64_t v17 = *(void *)(v16 + 64);
  uint64_t v19 = MEMORY[0x270FA5388](v18);
  unint64_t v20 = (char *)&v31 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v19);
  uint64_t v22 = (char *)&v31 - v21;
  sub_24D032330(a2, (uint64_t)v12);
  if (__swift_getEnumTagSinglePayload((uint64_t)v12, 1, v13) == 1) {
    return sub_24D0322D0((uint64_t)v12);
  }
  uint64_t v32 = *(void (**)(char *, char *, uint64_t))(v15 + 32);
  v32(v22, v12, v13);
  sub_24D044528();
  uint64_t v24 = sub_24D044548();
  OUTLINED_FUNCTION_10_1(v3, v25, v26, v24);
  (*(void (**)(char *, char *, uint64_t))(v15 + 16))(v20, v22, v13);
  unint64_t v27 = (*(unsigned __int8 *)(v15 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
  uint64_t v28 = (char *)swift_allocObject();
  *((void *)v28 + 2) = 0;
  *((void *)v28 + 3) = 0;
  *((void *)v28 + 4) = v4;
  *((void *)v28 + 5) = a1;
  v32(&v28[v27], v20, v13);
  id v29 = v4;
  id v30 = a1;
  sub_24D02A438();
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v15 + 8))(v22, v13);
}

uint64_t sub_24D0317DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[4] = a5;
  v6[5] = a6;
  v6[2] = a1;
  v6[3] = a4;
  return MEMORY[0x270FA2498](sub_24D031800, 0, 0);
}

uint64_t sub_24D031800()
{
  OUTLINED_FUNCTION_5();
  uint64_t Strong = swift_weakLoadStrong();
  v0[6] = Strong;
  if (Strong)
  {
    uint64_t v2 = (void *)swift_task_alloc();
    v0[7] = (uint64_t)v2;
    *uint64_t v2 = v0;
    v2[1] = sub_24D0318D8;
    OUTLINED_FUNCTION_16_0(v0[4]);
    return sub_24D02F19C();
  }
  else
  {
    OUTLINED_FUNCTION_2_1();
    return v4();
  }
}

uint64_t sub_24D0318D8()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_6();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  swift_release();
  OUTLINED_FUNCTION_8_2();
  return MEMORY[0x270FA2498](v3, v4, v5);
}

uint64_t sub_24D0319BC()
{
  return OUTLINED_FUNCTION_0_2(*(void *)(v0 + 48));
}

uint64_t sub_24D031AAC()
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B184BF0);
  uint64_t v3 = OUTLINED_FUNCTION_12(v2);
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_13_2();
  uint64_t v4 = sub_24D044548();
  OUTLINED_FUNCTION_10_1(v0, v5, v6, v4);
  uint64_t v7 = (void *)swift_allocObject();
  id v7[2] = 0;
  v7[3] = 0;
  v7[4] = v1;
  id v8 = v1;
  sub_24D02A438();
  return swift_release();
}

uint64_t sub_24D031B64(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 16) = a1;
  *(void *)(v4 + 24) = a4;
  return MEMORY[0x270FA2498](sub_24D031B84, 0, 0);
}

uint64_t sub_24D031B84()
{
  OUTLINED_FUNCTION_5();
  uint64_t Strong = swift_weakLoadStrong();
  *(void *)(v0 + 32) = Strong;
  if (Strong)
  {
    return MEMORY[0x270FA2498](sub_24D031C28, Strong, 0);
  }
  else
  {
    OUTLINED_FUNCTION_2_1();
    return v2();
  }
}

uint64_t sub_24D031C28()
{
  OUTLINED_FUNCTION_5();
  sub_24D02B238();
  swift_release();
  OUTLINED_FUNCTION_8_2();
  return MEMORY[0x270FA2498](v0, v1, v2);
}

uint64_t sub_24D031C90()
{
  return OUTLINED_FUNCTION_0_2(*(void *)(v0 + 32));
}

uint64_t sub_24D031CF8(float a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B184BF0);
  uint64_t v5 = OUTLINED_FUNCTION_12(v4);
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_13_2();
  uint64_t v6 = sub_24D044548();
  OUTLINED_FUNCTION_10_1(v1, v7, v8, v6);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = 0;
  *(void *)(v9 + 24) = 0;
  *(void *)(v9 + 32) = v2;
  *(float *)(v9 + 40) = a1;
  id v10 = v2;
  sub_24D02A438();
  return swift_release();
}

uint64_t sub_24D031DC0(uint64_t a1, float a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(float *)(v5 + 40) = a2;
  *(void *)(v5 + 16) = a1;
  *(void *)(v5 + 24) = a5;
  return MEMORY[0x270FA2498](sub_24D031DE4, 0, 0);
}

uint64_t sub_24D031DE4()
{
  OUTLINED_FUNCTION_5();
  uint64_t Strong = swift_weakLoadStrong();
  *(void *)(v0 + 32) = Strong;
  if (Strong)
  {
    return MEMORY[0x270FA2498](sub_24D031E88, Strong, 0);
  }
  else
  {
    OUTLINED_FUNCTION_2_1();
    return v2();
  }
}

uint64_t sub_24D031E88()
{
  OUTLINED_FUNCTION_5();
  sub_24D02EFFC(*(float *)(v0 + 40));
  swift_release();
  OUTLINED_FUNCTION_8_2();
  return MEMORY[0x270FA2498](v1, v2, v3);
}

id sub_24D031F64()
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  swift_weakInit();
  v3.receiver = v0;
  v3.super_class = ObjectType;
  return objc_msgSendSuper2(&v3, sel_init);
}

id sub_24D031FE0()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for AppStateControllerSessionObserver()
{
  return self;
}

uint64_t sub_24D03204C()
{
  return objectdestroyTm_0(44);
}

uint64_t sub_24D032054()
{
  OUTLINED_FUNCTION_21();
  uint64_t v2 = v1;
  uint64_t v3 = *(void *)(v0 + 16);
  uint64_t v4 = *(void *)(v0 + 24);
  uint64_t v5 = *(void *)(v0 + 32);
  float v6 = *(float *)(v0 + 40);
  uint64_t v7 = swift_task_alloc();
  uint64_t v8 = (void *)OUTLINED_FUNCTION_2(v7);
  void *v8 = v9;
  v8[1] = sub_24D03210C;
  return sub_24D031DC0(v2, v6, v3, v4, v5);
}

uint64_t sub_24D03210C()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_6();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(void))(v1 + 8);
  return v3();
}

uint64_t sub_24D0321D0()
{
  return objectdestroyTm_0(40);
}

uint64_t objectdestroyTm_0(uint64_t a1)
{
  swift_unknownObjectRelease();

  return MEMORY[0x270FA0238](v1, a1, 7);
}

uint64_t sub_24D032224(uint64_t a1)
{
  uint64_t v3 = v1[2];
  uint64_t v4 = v1[3];
  uint64_t v5 = v1[4];
  uint64_t v6 = swift_task_alloc();
  uint64_t v7 = (void *)OUTLINED_FUNCTION_2(v6);
  *uint64_t v7 = v8;
  v7[1] = sub_24D032994;
  return sub_24D031B64(a1, v3, v4, v5);
}

uint64_t sub_24D0322D0(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26984FCB8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_24D032330(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26984FCB8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24D032398()
{
  uint64_t v1 = sub_24D044218();
  OUTLINED_FUNCTION_1_0();
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v6 = *(unsigned __int8 *)(v3 + 80);
  uint64_t v7 = (v6 + 48) & ~v6;
  uint64_t v8 = v7 + *(void *)(v5 + 64);
  uint64_t v9 = v6 | 7;
  swift_unknownObjectRelease();

  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v0 + v7, v1);
  return MEMORY[0x270FA0238](v0, v8, v9);
}

uint64_t sub_24D03244C()
{
  OUTLINED_FUNCTION_21();
  sub_24D044218();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_2(v0);
  void *v1 = v2;
  v1[1] = sub_24D032994;
  uint64_t v3 = OUTLINED_FUNCTION_6_0();
  return sub_24D0317DC(v3, v4, v5, v6, v7, v8);
}

unint64_t sub_24D032528(unint64_t result, char a2, uint64_t a3)
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

uint64_t sub_24D03254C()
{
  swift_unknownObjectRelease();

  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_24D03259C()
{
  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_18_0();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_2(v0);
  void *v1 = v2;
  v1[1] = sub_24D032994;
  uint64_t v3 = OUTLINED_FUNCTION_6_0();
  return sub_24D031328(v3, v4, v5, v6, v7, v8);
}

uint64_t sub_24D032634()
{
  swift_unknownObjectRelease();

  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_24D032684()
{
  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_18_0();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_2(v0);
  void *v1 = v2;
  v1[1] = sub_24D032994;
  uint64_t v3 = OUTLINED_FUNCTION_6_0();
  return sub_24D030F5C(v3, v4, v5, v6);
}

uint64_t sub_24D03271C()
{
  return objectdestroy_24Tm(64);
}

uint64_t sub_24D032724(uint64_t a1)
{
  uint64_t v3 = v1[2];
  uint64_t v4 = v1[3];
  uint64_t v5 = v1[4];
  uint64_t v6 = v1[5];
  uint64_t v8 = v1[6];
  uint64_t v7 = v1[7];
  uint64_t v9 = swift_task_alloc();
  uint64_t v10 = (void *)OUTLINED_FUNCTION_2(v9);
  *uint64_t v10 = v11;
  v10[1] = sub_24D032994;
  return sub_24D030C04(a1, v3, v4, v5, v6, v8, v7);
}

uint64_t sub_24D0327F4()
{
  OUTLINED_FUNCTION_21();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_2(v0);
  void *v1 = v2;
  v1[1] = sub_24D032994;
  uint64_t v3 = OUTLINED_FUNCTION_3();
  return sub_24D0309A4(v3, v4, v5, v6, v7);
}

uint64_t objectdestroy_24Tm(uint64_t a1)
{
  swift_unknownObjectRelease();

  return MEMORY[0x270FA0238](v1, a1, 7);
}

uint64_t sub_24D0328EC()
{
  OUTLINED_FUNCTION_21();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_2(v0);
  void *v1 = v2;
  v1[1] = sub_24D032994;
  uint64_t v3 = OUTLINED_FUNCTION_3();
  return sub_24D030670(v3, v4, v5, v6, v7);
}

uint64_t OUTLINED_FUNCTION_0_2@<X0>(uint64_t a1@<X8>)
{
  **(unsigned char **)(v1 + 16) = a1 == 0;
  return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t OUTLINED_FUNCTION_2_1()
{
  **(unsigned char **)(v0 + 16) = 1;
  return v0 + 8;
}

uint64_t OUTLINED_FUNCTION_6_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_10_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_storeEnumTagSinglePayload(a1, 0, 1, a4);
}

uint64_t OUTLINED_FUNCTION_11_2()
{
  return objectdestroy_24Tm(48);
}

uint64_t OUTLINED_FUNCTION_13_2()
{
  return sub_24D044528();
}

uint64_t OUTLINED_FUNCTION_14_1()
{
  return sub_24D044528();
}

uint64_t OUTLINED_FUNCTION_16_0@<X0>(uint64_t a1@<X8>)
{
  return a1;
}

void NSXPCInterface.setClasses(_:for:argumentIndex:ofReply:)(uint64_t a1)
{
  id v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFF9C0]), sel_init);
  uint64_t v3 = *(void *)(a1 + 16);
  if (v3)
  {
    swift_bridgeObjectRetain();
    uint64_t v4 = 0;
    do
    {
      ++v4;
      __swift_instantiateConcreteTypeFromMangledName(&qword_26B184C98);
      objc_msgSend(v2, sel_addObject_, sub_24D044908());
      swift_unknownObjectRelease();
    }
    while (v3 != v4);
    swift_bridgeObjectRelease();
  }
  id v5 = v2;
  sub_24D0445D8();

  sub_24D044878();
  __break(1u);
}

void __swiftcall DIDropInError.nsError(localizedDescription:localizedFailureReason:debugDescription:)(NSError *__return_ptr retstr, Swift::String_optional localizedDescription, Swift::String_optional localizedFailureReason, Swift::String_optional debugDescription)
{
  uint64_t v5 = v4;
  object = debugDescription.value._object;
  uint64_t countAndFlagsBits = debugDescription.value._countAndFlagsBits;
  uint64_t v7 = localizedFailureReason.value._object;
  uint64_t v8 = localizedFailureReason.value._countAndFlagsBits;
  uint64_t v9 = localizedDescription.value._object;
  uint64_t v10 = localizedDescription.value._countAndFlagsBits;
  uint64_t v11 = MEMORY[0x263F8D310];
  uint64_t v32 = sub_24D0443D8();
  unint64_t v12 = (unint64_t)v9;
  if (!v9)
  {
    uint64_t v10 = 0xD000000000000012;
    if (v5 == 2)
    {
      uint64_t v13 = "Unsupported Device";
    }
    else
    {
      if (v5 != 3) {
        goto LABEL_8;
      }
      uint64_t v10 = 0xD000000000000013;
      uint64_t v13 = "Drop In Not Allowed";
    }
    unint64_t v12 = (unint64_t)(v13 - 32) | 0x8000000000000000;
  }
  uint64_t v14 = sub_24D044428();
  uint64_t v16 = v15;
  uint64_t v31 = v11;
  uint64_t v29 = v10;
  unint64_t v30 = v12;
  swift_bridgeObjectRetain();
  sub_24D032E50((uint64_t)&v29, v14, v16);
LABEL_8:
  if (v7)
  {
    uint64_t v17 = sub_24D044428();
    uint64_t v19 = v18;
    uint64_t v31 = v11;
    uint64_t v29 = v8;
    unint64_t v30 = (unint64_t)v7;
    swift_bridgeObjectRetain();
    sub_24D032E50((uint64_t)&v29, v17, v19);
  }
  if (object)
  {
    uint64_t v20 = sub_24D044428();
    uint64_t v22 = v21;
    uint64_t v31 = v11;
    uint64_t v29 = countAndFlagsBits;
    unint64_t v30 = (unint64_t)object;
    swift_bridgeObjectRetain();
    sub_24D032E50((uint64_t)&v29, v20, v22);
  }
  uint64_t v23 = sub_24D044428();
  uint64_t v25 = v24;
  uint64_t v26 = v32;
  id v27 = objc_allocWithZone(MEMORY[0x263F087E8]);
  sub_24D032ED4(v23, v25, v5, v26);
}

void DIDropInError.nsError.getter(NSError *a1@<X8>)
{
}

uint64_t sub_24D032E50(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a1 + 24))
  {
    sub_24D0330BC((_OWORD *)a1, v6);
    sub_24D0330CC(v6, a2, a3);
    return swift_bridgeObjectRelease();
  }
  else
  {
    sub_24D025010(a1);
    sub_24D032F84(a2, a3, v6);
    swift_bridgeObjectRelease();
    return sub_24D025010((uint64_t)v6);
  }
}

id sub_24D032ED4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = (void *)sub_24D0443F8();
  swift_bridgeObjectRelease();
  if (a4)
  {
    uint64_t v8 = (void *)sub_24D0443C8();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v8 = 0;
  }
  id v9 = objc_msgSend(v4, sel_initWithDomain_code_userInfo_, v7, a3, v8);

  return v9;
}

double sub_24D032F84@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  uint64_t v4 = v3;
  swift_bridgeObjectRetain();
  unint64_t v8 = sub_24D0251FC(a1, a2);
  LOBYTE(a2) = v9;
  swift_bridgeObjectRelease();
  if (a2)
  {
    swift_isUniquelyReferenced_nonNull_native();
    uint64_t v11 = *v4;
    uint64_t *v4 = 0x8000000000000000;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26984FD30);
    sub_24D044848();
    swift_bridgeObjectRelease();
    sub_24D0330BC((_OWORD *)(*(void *)(v11 + 56) + 32 * v8), a3);
    sub_24D044858();
    uint64_t *v4 = v11;
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

_OWORD *sub_24D0330BC(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_24D0330CC(_OWORD *a1, uint64_t a2, uint64_t a3)
{
  swift_isUniquelyReferenced_nonNull_native();
  uint64_t v8 = *v3;
  *uint64_t v3 = 0x8000000000000000;
  sub_24D03315C(a1, a2, a3);
  *uint64_t v3 = v8;
  return swift_bridgeObjectRelease();
}

_OWORD *sub_24D03315C(_OWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = (void **)v3;
  uint64_t v8 = (void *)*v3;
  unint64_t v9 = sub_24D0251FC(a2, a3);
  if (__OFADD__(v8[2], (v10 & 1) == 0))
  {
    __break(1u);
    goto LABEL_13;
  }
  unint64_t v11 = v9;
  char v12 = v10;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26984FD30);
  if ((sub_24D044848() & 1) == 0) {
    goto LABEL_5;
  }
  unint64_t v13 = sub_24D0251FC(a2, a3);
  if ((v12 & 1) != (v14 & 1))
  {
LABEL_13:
    double result = (_OWORD *)sub_24D044918();
    __break(1u);
    return result;
  }
  unint64_t v11 = v13;
LABEL_5:
  uint64_t v15 = *v4;
  if (v12)
  {
    uint64_t v16 = (_OWORD *)(v15[7] + 32 * v11);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v16);
    return sub_24D0330BC(a1, v16);
  }
  else
  {
    sub_24D03329C(v11, a2, a3, a1, v15);
    return (_OWORD *)swift_bridgeObjectRetain();
  }
}

_OWORD *sub_24D03329C(unint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4, void *a5)
{
  a5[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v6 = (void *)(a5[6] + 16 * a1);
  *uint64_t v6 = a2;
  v6[1] = a3;
  double result = sub_24D0330BC(a4, (_OWORD *)(a5[7] + 32 * a1));
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

uint64_t __swift_destroy_boxed_opaque_existential_0(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

void sub_24D033358(void *a1, uint64_t a2, void (**a3)(void))
{
  uint64_t v5 = sub_24D044318();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_24D044358();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  char v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = a3;
  if (a1)
  {
    uint64_t v14 = swift_allocObject();
    *(void *)(v14 + 16) = sub_24D0339BC;
    *(void *)(v14 + 24) = v13;
    aBlock[4] = sub_24D0339D8;
    aBlock[5] = v14;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_24D025B94;
    aBlock[3] = &block_descriptor_10;
    uint64_t v15 = _Block_copy(aBlock);
    uint64_t v20 = v9;
    uint64_t v16 = v15;
    _Block_copy(a3);
    id v17 = a1;
    uint64_t v21 = a3;
    id v18 = v17;
    swift_retain();
    sub_24D044338();
    uint64_t v22 = MEMORY[0x263F8EE78];
    sub_24D02A0A8();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B184C60);
    sub_24D02A0F8();
    sub_24D044798();
    MEMORY[0x25331BCA0](0, v12, v8, v16);
    _Block_release(v16);

    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v20);
    swift_release();
    swift_release();
    _Block_release(v21);
  }
  else
  {
    _Block_copy(a3);
    a3[2](a3);
    swift_release();
    _Block_release(a3);
  }
}

uint64_t static DIUtilities.onQueue(_:block:)(void *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t v6 = sub_24D044318();
  OUTLINED_FUNCTION_1_0();
  uint64_t v8 = v7;
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_24D044358();
  OUTLINED_FUNCTION_1_0();
  uint64_t v14 = v13;
  uint64_t v16 = MEMORY[0x270FA5388](v15);
  id v18 = (char *)v23 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a1) {
    return a2(v16);
  }
  uint64_t v19 = swift_allocObject();
  *(void *)(v19 + 16) = a2;
  *(void *)(v19 + 24) = a3;
  aBlock[4] = sub_24D024E84;
  aBlock[5] = v19;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_24D025B94;
  aBlock[3] = &block_descriptor_7;
  uint64_t v20 = _Block_copy(aBlock);
  id v21 = a1;
  swift_retain();
  sub_24D044338();
  v23[1] = MEMORY[0x263F8EE78];
  sub_24D02A0A8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B184C60);
  sub_24D02A0F8();
  sub_24D044798();
  MEMORY[0x25331BCA0](0, v18, v11, v20);
  _Block_release(v20);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v6);
  (*(void (**)(char *, uint64_t))(v14 + 8))(v18, v12);
  return swift_release();
}

uint64_t sub_24D0338AC()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t block_copy_helper_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_2()
{
  return swift_release();
}

uint64_t sub_24D033984()
{
  _Block_release(*(const void **)(v0 + 16));
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_24D0339BC()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

uint64_t sub_24D0339DC(uint64_t a1, uint64_t a2)
{
  **(void **)(*(void *)(a1 + 64) + 40) = a2;
  return MEMORY[0x270FA2400]();
}

uint64_t sub_24D0339FC(uint64_t a1, char a2)
{
  **(unsigned char **)(*(void *)(a1 + 64) + 40) = a2;
  return MEMORY[0x270FA2400]();
}

uint64_t sub_24D033A1C()
{
  return sub_24D044988();
}

uint64_t sub_24D033A44()
{
  return sub_24D044998();
}

uint64_t sub_24D033A90()
{
  return sub_24D044998();
}

uint64_t sub_24D033AD0()
{
  id v1 = *(id *)(v0 + 16);
  id v2 = objc_msgSend(v1, sel_description);
  uint64_t v3 = sub_24D044428();

  return v3;
}

id sub_24D033B34(char a1)
{
  if (a1) {
    uint64_t v2 = 2;
  }
  else {
    uint64_t v2 = 1;
  }
  id result = objc_msgSend(objc_allocWithZone(MEMORY[0x263F285F8]), sel_initWithAnnouncementType_, v2);
  if (result)
  {
    *(void *)(v1 + 16) = result;
    return (id)v1;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_24D033B88()
{
  *(void *)(v1 + 120) = v0;
  return MEMORY[0x270FA2498](sub_24D033BA8, 0, 0);
}

uint64_t sub_24D033BA8()
{
  uint64_t v1 = *(void **)(v0[15] + 16);
  v0[2] = v0;
  v0[7] = v0 + 16;
  v0[3] = sub_24D033CA8;
  uint64_t v2 = swift_continuation_init();
  v0[10] = MEMORY[0x263EF8330];
  v0[11] = 0x40000000;
  v0[12] = sub_24D033E28;
  v0[13] = &block_descriptor_2;
  v0[14] = v2;
  objc_msgSend(v1, sel_performRequestWithCompletion_, v0 + 10);
  return MEMORY[0x270FA23F0](v0 + 2);
}

uint64_t sub_24D033CA8()
{
  return MEMORY[0x270FA2498](sub_24D033D88, 0, 0);
}

uint64_t sub_24D033D88()
{
  if ((*(unsigned char *)(v0 + 128) & 1) == 0)
  {
    sub_24D033EB0();
    swift_allocError();
    swift_willThrow();
  }
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24D033E28(uint64_t a1, char a2)
{
  return sub_24D0339FC(*(void *)(a1 + 32), a2);
}

uint64_t sub_24D033E30()
{
  return MEMORY[0x270FA0228](v0, 24, 7);
}

uint64_t type metadata accessor for DropInSiriAnnouncement()
{
  return self;
}

uint64_t sub_24D033E8C()
{
  return sub_24D033AD0();
}

unint64_t sub_24D033EB0()
{
  unint64_t result = qword_26984FD40;
  if (!qword_26984FD40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26984FD40);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for DropInSiriAnnouncement.AnnouncementError(unsigned int *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if ((a2 + 1) >= 0x10000) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) < 0x100) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4) {
    return *a1;
  }
  if (v3 == 2) {
    return *(unsigned __int16 *)a1;
  }
  return *(unsigned __int8 *)a1;
}

unsigned char *storeEnumTagSinglePayload for DropInSiriAnnouncement.AnnouncementError(unsigned char *result, int a2, int a3)
{
  if ((a3 + 1) >= 0x10000) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) < 0x100) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2)
  {
    switch(v5)
    {
      case 1:
        *unint64_t result = a2;
        return result;
      case 2:
        *(_WORD *)unint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)unint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *unint64_t result = 0;
      break;
    case 2:
      *(_WORD *)unint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x24D033FECLL);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_24D034014()
{
  return 0;
}

ValueMetadata *type metadata accessor for DropInSiriAnnouncement.AnnouncementError()
{
  return &type metadata for DropInSiriAnnouncement.AnnouncementError;
}

unint64_t sub_24D034030()
{
  unint64_t result = qword_26984FD48;
  if (!qword_26984FD48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26984FD48);
  }
  return result;
}

uint64_t sub_24D03407C()
{
  uint64_t v0 = sub_24D044298();
  __swift_allocate_value_buffer(v0, qword_26B185080);
  __swift_project_value_buffer(v0, (uint64_t)qword_26B185080);
  return sub_24D044288();
}

uint64_t *__swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t DIHandleType.description.getter(uint64_t a1)
{
  id v1 = objc_msgSend(self, sel_stringForHandleType_, a1);
  uint64_t v2 = sub_24D044428();

  return v2;
}

uint64_t sub_24D034200()
{
  return DIHandleType.description.getter(*v0);
}

uint64_t sub_24D03420C()
{
  return sub_24D044998();
}

uint64_t sub_24D034258()
{
  return sub_24D044988();
}

uint64_t sub_24D034288()
{
  return sub_24D044998();
}

uint64_t sub_24D0342D0(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (a2)
  {
    id v3 = a2;
    return sub_24D034330(v2, (uint64_t)v3);
  }
  else
  {
    return j__swift_continuation_throwingResume();
  }
}

uint64_t sub_24D034330(uint64_t a1, uint64_t a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B184CA8);
  uint64_t v4 = swift_allocError();
  *uint64_t v5 = a2;
  return MEMORY[0x270FA2410](a1, v4);
}

uint64_t sub_24D034398(double a1)
{
  sub_24D0361F4((uint64_t)&v2, a1 * 1000000000.0);
  if ((v3 & 1) == 0) {
    return v2;
  }
  uint64_t v2 = 0;
  unint64_t v3 = 0xE000000000000000;
  sub_24D0447D8();
  sub_24D044458();
  sub_24D044458();
  sub_24D044458();
  sub_24D044458();
  uint64_t result = sub_24D044878();
  __break(1u);
  return result;
}

uint64_t DeactivationState.rawValue.getter()
{
  return *v0 - 1;
}

DropIn::DeactivationState_optional __swiftcall DeactivationState.init(rawValue:)(Swift::Int rawValue)
{
  char v2 = 9;
  if ((unint64_t)(rawValue + 1) < 9) {
    char v2 = rawValue + 1;
  }
  char *v1 = v2;
  return (DropIn::DeactivationState_optional)rawValue;
}

void *static DeactivationState.allCases.getter()
{
  return &unk_26FF619A0;
}

BOOL sub_24D0344D4(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

uint64_t sub_24D0344E4()
{
  return sub_24D044988();
}

uint64_t sub_24D03450C()
{
  return sub_24D044998();
}

unint64_t sub_24D034558()
{
  unint64_t result = qword_26984FD50;
  if (!qword_26984FD50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26984FD50);
  }
  return result;
}

uint64_t sub_24D0345A4()
{
  return sub_24D03420C();
}

uint64_t sub_24D0345C0()
{
  return sub_24D034288();
}

DropIn::DeactivationState_optional sub_24D0345DC(Swift::Int *a1)
{
  return DeactivationState.init(rawValue:)(*a1);
}

uint64_t sub_24D0345E4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = DeactivationState.rawValue.getter();
  *a1 = result;
  return result;
}

unint64_t sub_24D034610()
{
  unint64_t result = qword_26984FD58;
  if (!qword_26984FD58)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26984FD60);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26984FD58);
  }
  return result;
}

void sub_24D034664(void *a1@<X8>)
{
  *a1 = &unk_26FF619A0;
}

uint64_t getEnumTagSinglePayload for DeactivationState(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xF8)
  {
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
    int v5 = (*a1 | (v4 << 8)) - 9;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 9;
  int v5 = v6 - 9;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for DeactivationState(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 8;
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
        JUMPOUT(0x24D0347C8);
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
          *unint64_t result = a2 + 8;
        break;
    }
  }
  return result;
}

void type metadata accessor for DeactivationState()
{
}

BOOL sub_24D0347FC(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_24D0344D4(*a1, *a2);
}

uint64_t sub_24D034808()
{
  return sub_24D03450C();
}

uint64_t sub_24D034810()
{
  return sub_24D0344E4();
}

void sub_24D034818()
{
  id v1 = *(void (**)(unint64_t *))(v0 + 112);
  if (*(unsigned char *)(v0 + 128))
  {
    if (v1)
    {
      unint64_t v6 = *(unsigned __int8 *)(v0 + 128);
      char v7 = 0;
      swift_retain();
      v1(&v6);
      sub_24D01DD94((uint64_t)v1);
    }
  }
  else if (v1)
  {
    int v2 = *(void **)(v0 + 136);
    if (v2)
    {
      int v3 = *(void **)(v0 + 136);
    }
    else
    {
      sub_24D036584();
      int v3 = (void *)swift_allocError();
      unsigned char *v4 = 0;
    }
    unint64_t v6 = (unint64_t)v3;
    char v7 = 1;
    sub_24D01DD84((uint64_t)v1);
    id v5 = v2;
    v1(&v6);
    sub_24D01DD94((uint64_t)v1);
  }
}

void sub_24D03490C(char *a1)
{
}

uint64_t sub_24D034914()
{
  uint64_t v1 = sub_24D044298();
  OUTLINED_FUNCTION_1_0();
  uint64_t v3 = v2;
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_1_1();
  uint64_t v7 = v6 - v5;
  swift_defaultActor_initialize();
  *(void *)(v0 + 136) = 0;
  *(void *)(v0 + 112) = 0;
  *(void *)(v0 + 120) = 0;
  *(void *)(v0 + OBJC_IVAR____TtC6DropIn20AppStateDeactivation_endTonePlayer) = 0;
  *(void *)(v0 + OBJC_IVAR____TtC6DropIn20AppStateDeactivation_activationResources) = 0;
  sub_24D044288();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 32))(v0 + OBJC_IVAR____TtC6DropIn20AppStateDeactivation_logger, v7, v1);
  *(unsigned char *)(v0 + 128) = 1;
  return v0;
}

void sub_24D034A18(uint64_t a1)
{
  *(void *)(v1 + OBJC_IVAR____TtC6DropIn20AppStateDeactivation_activationResources) = a1;
  swift_retain();
  swift_release();
  *(unsigned char *)(v1 + 128) = 2;
  sub_24D034818();
  sub_24D034B40();
}

uint64_t sub_24D034A6C(unsigned char *a1)
{
  *(unsigned char *)(v1 + 128) = *a1;
  sub_24D034818();
  return sub_24D034B40();
}

uint64_t sub_24D034A9C(void *a1)
{
  uint64_t v2 = *(void **)(v1 + 136);
  *(void *)(v1 + 136) = a1;
  id v3 = a1;

  char v5 = 0;
  return sub_24D034A6C(&v5);
}

uint64_t sub_24D034AE0()
{
  uint64_t v1 = *(void **)(v0 + 136);
  *(void *)(v0 + 136) = 0;

  *(unsigned char *)(v0 + 128) = 1;
  sub_24D034818();
  *(void *)(v0 + OBJC_IVAR____TtC6DropIn20AppStateDeactivation_endTonePlayer) = 0;
  swift_release();
  *(void *)(v0 + OBJC_IVAR____TtC6DropIn20AppStateDeactivation_activationResources) = 0;
  return swift_release();
}

void sub_24D034B40()
{
  switch(*(unsigned char *)(v0 + 128))
  {
    case 1:
      return;
    case 2:
    case 4:
      sub_24D034BAC();
      break;
    case 3:
      sub_24D034C08();
      break;
    case 5:
      sub_24D03526C();
      break;
    case 6:
      sub_24D0352C8();
      break;
    case 7:
      sub_24D035410();
      break;
    case 8:
      sub_24D035F90();
      break;
    default:
      OUTLINED_FUNCTION_7_0(1);
      break;
  }
}

uint64_t sub_24D034BAC()
{
  Swift::Int v1 = *(unsigned __int8 *)(v0 + 128);
  if (v1 == 8)
  {
    char v2 = 8;
  }
  else
  {
    DeactivationState.init(rawValue:)(v1);
    char v2 = v4;
    if (v4 == 9) {
      char v2 = 1;
    }
  }
  *(unsigned char *)(v0 + 128) = v2;
  sub_24D034818();
  return sub_24D034B40();
}

void sub_24D034C08()
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B184BF0);
  uint64_t v3 = OUTLINED_FUNCTION_12(v2);
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_25();
  if (qword_26984F480 != -1) {
    swift_once();
  }
  if ((byte_269851798 & 1) == 0)
  {
    uint64_t v4 = *(void *)(v1 + OBJC_IVAR____TtC6DropIn20AppStateDeactivation_activationResources);
    if (v4 && (char v5 = *(void **)(v4 + 16)) != 0)
    {
      id v6 = v5;
      if (objc_msgSend(v6, sel_state) == (id)6 || objc_msgSend(v6, sel_state) == (id)7)
      {
        char v12 = 4;
        sub_24D034A6C(&v12);
      }
      else
      {
        uint64_t v9 = sub_24D044548();
        __swift_storeEnumTagSinglePayload(v0, 1, 1, v9);
        unint64_t v10 = sub_24D036310();
        uint64_t v11 = (void *)swift_allocObject();
        v11[2] = v1;
        v11[3] = v10;
        v11[4] = v6;
        v11[5] = v1;
        swift_retain_n();
        sub_24D02A2E8();
        swift_release();
      }
    }
    else
    {
      sub_24D036584();
      uint64_t v7 = (void *)swift_allocError();
      unsigned char *v8 = 1;
      sub_24D034A9C(v7);
    }
  }
}

uint64_t sub_24D034DD8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(void *)(v5 + 120) = a4;
  *(void *)(v5 + 128) = a5;
  return MEMORY[0x270FA2498](sub_24D034DF8, a5, 0);
}

uint64_t sub_24D034DF8()
{
  OUTLINED_FUNCTION_9();
  uint64_t v1 = (void *)v0[15];
  v0[2] = v0;
  v0[3] = sub_24D034EE8;
  uint64_t v2 = swift_continuation_init();
  v0[10] = MEMORY[0x263EF8330];
  v0[11] = 0x40000000;
  v0[12] = sub_24D0342D0;
  v0[13] = &block_descriptor_3;
  v0[14] = v2;
  objc_msgSend(v1, sel_endWithCompletionHandler_, v0 + 10);
  return MEMORY[0x270FA23F0](v0 + 2);
}

uint64_t sub_24D034EE8()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_8();
  *uint64_t v2 = v1;
  *uint64_t v2 = *v0;
  uint64_t v4 = *(void *)(v3 + 48);
  *(void *)(v1 + 136) = v4;
  uint64_t v5 = *(void *)(v3 + 128);
  if (v4) {
    id v6 = sub_24D0350A8;
  }
  else {
    id v6 = sub_24D034FDC;
  }
  return MEMORY[0x270FA2498](v6, v5, 0);
}

uint64_t sub_24D034FDC()
{
  OUTLINED_FUNCTION_9();
  uint64_t v0 = sub_24D044278();
  os_log_type_t v1 = sub_24D044618();
  if (os_log_type_enabled(v0, v1))
  {
    uint64_t v2 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v2 = 0;
    _os_log_impl(&dword_24D00D000, v0, v1, "Drop in session end issued", v2, 2u);
    OUTLINED_FUNCTION_7();
  }

  OUTLINED_FUNCTION_4();
  return v3();
}

uint64_t sub_24D0350A8()
{
  uint64_t v16 = v0;
  os_log_type_t v1 = *(void **)(v0 + 136);
  swift_willThrow();
  id v2 = v1;
  id v3 = v1;
  uint64_t v4 = sub_24D044278();
  os_log_type_t v5 = sub_24D044608();
  if (os_log_type_enabled(v4, v5))
  {
    id v6 = *(void **)(v0 + 136);
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v8 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 138412290;
    id v9 = v6;
    uint64_t v10 = _swift_stdlib_bridgeErrorToNSError();
    *(void *)(v0 + 80) = v10;
    sub_24D044768();
    void *v8 = v10;

    _os_log_impl(&dword_24D00D000, v4, v5, "Failed to end active drop in session: %@", v7, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26984F7C0);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_7();
    OUTLINED_FUNCTION_7();
  }
  else
  {
    uint64_t v11 = *(void **)(v0 + 136);
  }
  char v12 = *(void **)(v0 + 136);
  v15[0] = 5;
  sub_24D034A6C(v15);

  OUTLINED_FUNCTION_4();
  return v13();
}

uint64_t sub_24D03526C()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC6DropIn20AppStateDeactivation_activationResources);
  if (v1 && *(void *)(v1 + 24))
  {
    swift_retain();
    sub_24D03D0D0();
    swift_release();
  }
  return sub_24D034BAC();
}

uint64_t sub_24D0352C8()
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B184BF0);
  uint64_t v3 = OUTLINED_FUNCTION_12(v2);
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_25();
  uint64_t v4 = sub_24D044548();
  __swift_storeEnumTagSinglePayload(v0, 1, 1, v4);
  unint64_t v5 = sub_24D036310();
  id v6 = (void *)swift_allocObject();
  _OWORD v6[2] = v1;
  v6[3] = v5;
  v6[4] = v1;
  swift_retain_n();
  sub_24D02A2E8();
  return swift_release();
}

uint64_t sub_24D035398(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 16) = a4;
  return MEMORY[0x270FA2498](sub_24D0353B8, a4, 0);
}

uint64_t sub_24D0353B8()
{
  OUTLINED_FUNCTION_5();
  sub_24D034BAC();
  OUTLINED_FUNCTION_4();
  return v0();
}

uint64_t sub_24D035410()
{
  uint64_t v1 = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B184BF0);
  uint64_t v3 = OUTLINED_FUNCTION_12(v2);
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_1_1();
  uint64_t v4 = type metadata accessor for DropInPlayer.Settings(0);
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_1_1();
  uint64_t v7 = v6 - v5;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26984F7B8);
  uint64_t v9 = OUTLINED_FUNCTION_12(v8);
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_1_1();
  uint64_t v12 = v11 - v10;
  uint64_t v13 = sub_24D0441A8();
  OUTLINED_FUNCTION_1_0();
  uint64_t v15 = v14;
  uint64_t v17 = MEMORY[0x270FA5388](v16);
  uint64_t v19 = (char *)&v32 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v17);
  id v21 = (char *)&v32 - v20;
  static ToneProvider.endToneURL.getter(v12);
  if (__swift_getEnumTagSinglePayload(v12, 1, v13) == 1)
  {
    sub_24D036194(v12);
    uint64_t v22 = sub_24D044278();
    os_log_type_t v23 = sub_24D044608();
    if (os_log_type_enabled(v22, v23))
    {
      uint64_t v24 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v24 = 0;
      _os_log_impl(&dword_24D00D000, v22, v23, "Invalid end tone URL", v24, 2u);
      OUTLINED_FUNCTION_7();
    }

    return sub_24D034BAC();
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v15 + 32))(v21, v12, v13);
    uint64_t v26 = *(void (**)(char *, char *, uint64_t))(v15 + 16);
    v26(v19, v21, v13);
    *(_OWORD *)uint64_t v7 = xmmword_24D046460;
    *(void *)(v7 + 16) = 0x4014000000000000;
    v26((char *)(v7 + *(int *)(v4 + 24)), v19, v13);
    id v27 = *(void (**)(char *, uint64_t))(v15 + 8);
    v27(v19, v13);
    *(_DWORD *)(v7 + *(int *)(v4 + 28)) = 1065353216;
    if (qword_26984F488 != -1) {
      swift_once();
    }
    uint64_t v28 = sub_24D022EDC(v7);
    *(void *)(v1 + OBJC_IVAR____TtC6DropIn20AppStateDeactivation_endTonePlayer) = v28;
    swift_retain_n();
    swift_release();
    sub_24D044548();
    OUTLINED_FUNCTION_14_2();
    unint64_t v29 = sub_24D036310();
    unint64_t v30 = (void *)swift_allocObject();
    uint64_t v33 = (uint64_t (*)(char *, uint64_t))v27;
    v30[2] = v1;
    v30[3] = v29;
    v30[4] = v28;
    v30[5] = v1;
    swift_retain_n();
    sub_24D02A2E8();
    swift_release();
    OUTLINED_FUNCTION_14_2();
    uint64_t v31 = (void *)swift_allocObject();
    v31[2] = v1;
    v31[3] = v29;
    v31[4] = v1;
    swift_retain_n();
    sub_24D02A2E8();
    swift_release();
    swift_release();
    sub_24D021654(v7);
    return v33(v21, v13);
  }
}

uint64_t sub_24D035998(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(void *)(v5 + 24) = a5;
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v5 + 32) = v6;
  *uint64_t v6 = v5;
  v6[1] = sub_24D035A2C;
  return sub_24D03CD74();
}

uint64_t sub_24D035A2C()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_8();
  *uint64_t v3 = v2;
  uint64_t v5 = *(void *)(v4 + 24);
  uint64_t v6 = *v1;
  OUTLINED_FUNCTION_8();
  *uint64_t v7 = v6;
  *(void *)(v8 + 40) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v9 = sub_24D035BB0;
  }
  else {
    uint64_t v9 = sub_24D035B24;
  }
  return MEMORY[0x270FA2498](v9, v5, 0);
}

uint64_t sub_24D035B24()
{
  OUTLINED_FUNCTION_5();
  if (qword_26984F488 != -1) {
    swift_once();
  }
  sub_24D023758();
  OUTLINED_FUNCTION_4();
  return v0();
}

uint64_t sub_24D035BB0()
{
  uint64_t v1 = *(void **)(v0 + 40);
  id v2 = v1;
  id v3 = v1;
  uint64_t v4 = sub_24D044278();
  os_log_type_t v5 = sub_24D044608();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = *(void **)(v0 + 40);
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v8 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 138412290;
    id v9 = v6;
    uint64_t v10 = _swift_stdlib_bridgeErrorToNSError();
    *(void *)(v0 + 16) = v10;
    sub_24D044768();
    void *v8 = v10;

    _os_log_impl(&dword_24D00D000, v4, v5, "Failed to end start tone: %@", v7, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26984F7C0);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_7();
    OUTLINED_FUNCTION_7();
  }
  else
  {
    uint64_t v11 = *(void **)(v0 + 40);
  }
  if (qword_26984F488 != -1) {
    swift_once();
  }
  sub_24D023758();
  OUTLINED_FUNCTION_4();
  return v12();
}

uint64_t sub_24D035DA4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 16) = a4;
  return MEMORY[0x270FA2498](sub_24D035DC4, a4, 0);
}

uint64_t sub_24D035DC4()
{
  OUTLINED_FUNCTION_5();
  uint64_t v1 = sub_24D034398(1.0);
  id v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 24) = v2;
  *id v2 = v0;
  v2[1] = sub_24D035E60;
  return MEMORY[0x270FA1FF0](v1);
}

uint64_t sub_24D035E60()
{
  OUTLINED_FUNCTION_9();
  uint64_t v2 = *v1;
  uint64_t v3 = *v1;
  OUTLINED_FUNCTION_8();
  void *v4 = v3;
  swift_task_dealloc();
  uint64_t v5 = *(void *)(v2 + 16);
  if (v0)
  {

    uint64_t v6 = sub_24D036964;
  }
  else
  {
    uint64_t v6 = sub_24D0353B8;
  }
  return MEMORY[0x270FA2498](v6, v5, 0);
}

uint64_t sub_24D035F90()
{
  *(unsigned char *)(v0 + 128) = 1;
  sub_24D034818();
  return sub_24D034AE0();
}

uint64_t sub_24D035FC0()
{
  sub_24D01DD94(*(void *)(v0 + 112));

  uint64_t v1 = v0 + OBJC_IVAR____TtC6DropIn20AppStateDeactivation_logger;
  uint64_t v2 = sub_24D044298();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  swift_release();
  swift_release();
  swift_defaultActor_destroy();
  return v0;
}

uint64_t sub_24D03605C()
{
  sub_24D035FC0();
  return MEMORY[0x270FA2418](v0);
}

uint64_t sub_24D036088()
{
  return type metadata accessor for AppStateDeactivation();
}

uint64_t type metadata accessor for AppStateDeactivation()
{
  uint64_t result = qword_26984FD80;
  if (!qword_26984FD80) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_24D0360D8()
{
  uint64_t result = sub_24D044298();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_24D036194(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26984F7B8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

BOOL sub_24D0361F4(uint64_t a1, double a2)
{
  uint64_t v3 = (*(void *)&a2 >> 52) & 0x7FFLL;
  unint64_t v4 = *(void *)&a2 & 0xFFFFFFFFFFFFFLL;
  uint64_t v5 = v3 | *(void *)&a2 & 0xFFFFFFFFFFFFFLL;
  if (v5)
  {
    if (v3 != 2047 && a2 > -1.0)
    {
      uint64_t v9 = sub_24D0445B8();
      if (v9 <= 63)
      {
        uint64_t v10 = v9;
        uint64_t v11 = sub_24D044598();
        unint64_t v12 = v11 + __clz(__rbit64(v4));
        uint64_t v13 = v10 - v12;
        if (__OFSUB__(v10, v12))
        {
          __break(1u);
        }
        else
        {
          if (v13 < -64 || v13 > 64)
          {
LABEL_12:
            unint64_t v14 = 0;
            uint64_t v15 = 0;
            if ((v10 & 0x8000000000000000) == 0) {
              goto LABEL_22;
            }
LABEL_23:
            LOBYTE(v5) = 0;
            uint64_t v7 = v14 | v15;
            BOOL result = v10 >= v11;
            goto LABEL_24;
          }
          if ((v13 & 0x8000000000000000) == 0)
          {
            if ((unint64_t)v13 >= 0x40) {
              goto LABEL_12;
            }
            unint64_t v14 = v4 << v13;
            if (v10 < 0) {
              goto LABEL_17;
            }
            goto LABEL_22;
          }
        }
        if ((unint64_t)v13 <= 0xFFFFFFFFFFFFFFC0) {
          goto LABEL_12;
        }
        unint64_t v14 = v4 >> (v12 - v10);
        if (v10 < 0)
        {
LABEL_17:
          uint64_t v15 = 0;
          goto LABEL_23;
        }
LABEL_22:
        uint64_t v15 = 1 << v10;
        goto LABEL_23;
      }
    }
    uint64_t v7 = 0;
    BOOL result = 0;
    LOBYTE(v5) = 1;
  }
  else
  {
    uint64_t v7 = 0;
    BOOL result = 1;
  }
LABEL_24:
  *(void *)a1 = v7;
  *(unsigned char *)(a1 + 8) = v5;
  return result;
}

unint64_t sub_24D036310()
{
  unint64_t result = qword_26984FD98;
  if (!qword_26984FD98)
  {
    type metadata accessor for AppStateDeactivation();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26984FD98);
  }
  return result;
}

uint64_t sub_24D036360()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_24D0363A8()
{
  uint64_t v0 = swift_task_alloc();
  unint64_t v1 = (void *)OUTLINED_FUNCTION_2(v0);
  void *v1 = v2;
  v1[1] = sub_24D036968;
  uint64_t v3 = OUTLINED_FUNCTION_3();
  return sub_24D035998(v3, v4, v5, v6, v7);
}

uint64_t sub_24D036450()
{
  OUTLINED_FUNCTION_9();
  uint64_t v0 = swift_task_alloc();
  unint64_t v1 = (void *)OUTLINED_FUNCTION_2(v0);
  void *v1 = v2;
  v1[1] = sub_24D036968;
  uint64_t v3 = OUTLINED_FUNCTION_26();
  return sub_24D035DA4(v3, v4, v5, v6);
}

uint64_t sub_24D0364EC()
{
  OUTLINED_FUNCTION_9();
  uint64_t v0 = swift_task_alloc();
  unint64_t v1 = (void *)OUTLINED_FUNCTION_2(v0);
  void *v1 = v2;
  v1[1] = sub_24D036968;
  uint64_t v3 = OUTLINED_FUNCTION_26();
  return sub_24D035398(v3, v4, v5, v6);
}

unint64_t sub_24D036584()
{
  unint64_t result = qword_26984FDC8;
  if (!qword_26984FDC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_26984FDC8);
  }
  return result;
}

uint64_t sub_24D0365D0()
{
  swift_unknownObjectRelease();

  swift_release();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_24D036618()
{
  uint64_t v0 = swift_task_alloc();
  unint64_t v1 = (void *)OUTLINED_FUNCTION_2(v0);
  void *v1 = v2;
  v1[1] = sub_24D0366BC;
  uint64_t v3 = OUTLINED_FUNCTION_3();
  return sub_24D034DD8(v3, v4, v5, v6, v7);
}

uint64_t sub_24D0366BC()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_8();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_4();
  return v3();
}

uint64_t sub_24D036780(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFF)
  {
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
    int v5 = (*a1 | (v4 << 8)) - 2;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 2;
  int v5 = v6 - 2;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *sub_24D036808(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 1;
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
        JUMPOUT(0x24D0368D4);
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
          *unint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

unsigned char *sub_24D0368FC(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

void type metadata accessor for AppStateDeactivationError()
{
}

unint64_t sub_24D036918()
{
  unint64_t result = qword_26984FDE0;
  if (!qword_26984FDE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26984FDE0);
  }
  return result;
}

void OUTLINED_FUNCTION_7_0(char a1@<W8>)
{
  *(unsigned char *)(v1 + 128) = a1;
  sub_24D034818();
}

uint64_t OUTLINED_FUNCTION_14_2()
{
  return __swift_storeEnumTagSinglePayload(v1, 1, 1, v0);
}

double sub_24D036994@<D0>(_OWORD *a1@<X8>)
{
  int v3 = (void *)sub_24D0443F8();
  id v4 = objc_msgSend(v1, sel_valueForKey_, v3);

  if (v4)
  {
    sub_24D044788();
    swift_unknownObjectRelease();
    sub_24D0330BC(&v6, v7);
  }
  else
  {
    memset(v7, 0, sizeof(v7));
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B184A70);
  if ((swift_dynamicCast() & 1) == 0)
  {
    double result = 0.0;
    *a1 = xmmword_24D046EF0;
  }
  return result;
}

uint64_t sub_24D036A58@<X0>(uint64_t a1@<X2>, uint64_t a2@<X8>)
{
  int v3 = v2;
  long long v6 = (void *)sub_24D0443F8();
  id v7 = objc_msgSend(v3, sel_valueForKey_, v6);

  if (v7)
  {
    sub_24D044788();
    swift_unknownObjectRelease();
    sub_24D0330BC(&v10, v11);
  }
  else
  {
    memset(v11, 0, sizeof(v11));
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B184A70);
  int v8 = swift_dynamicCast();
  return __swift_storeEnumTagSinglePayload(a2, v8 ^ 1u, 1, a1);
}

void sub_24D036B24(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v8 = sub_24D044758();
  OUTLINED_FUNCTION_0_3();
  uint64_t v70 = v9;
  MEMORY[0x270FA5388](v10);
  unint64_t v12 = &v60[-v11];
  OUTLINED_FUNCTION_0_3();
  uint64_t v14 = v13;
  uint64_t v16 = MEMORY[0x270FA5388](v15);
  uint64_t v69 = &v60[-((v17 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v18 = MEMORY[0x270FA5388](v16);
  uint64_t v71 = &v60[-v19];
  MEMORY[0x270FA5388](v18);
  id v21 = &v60[-v20];
  sub_24D036994(&v74);
  if (*((void *)&v74 + 1) >> 60 == 15)
  {
    OUTLINED_FUNCTION_3_1();
    OUTLINED_FUNCTION_30();
    __swift_storeEnumTagSinglePayload(v22, v23, v24, v25);
  }
  else
  {
    uint64_t v66 = a1;
    uint64_t v72 = a3;
    long long v27 = v74;
    id v28 = objc_allocWithZone(MEMORY[0x263F08928]);
    sub_24D0378D8(v27, *((unint64_t *)&v27 + 1));
    long long v67 = v27;
    id v29 = sub_24D0377F8(v27, *((unint64_t *)&v27 + 1));
    uint64_t v68 = a4;
    uint64_t v30 = v72;
    uint64_t v31 = v29;
    sub_24D044638();
    id v65 = v31;
    int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v12, 1, v30);
    uint64_t v37 = v30;
    if (EnumTagSinglePayload == 1)
    {
      ((void (*)(unsigned char *, uint64_t))v70[1].isa)(v12, v8);
      if (qword_26B184A78 != -1) {
        swift_once();
      }
      uint64_t v38 = sub_24D044298();
      __swift_project_value_buffer(v38, (uint64_t)qword_26B185080);
      swift_bridgeObjectRetain_n();
      uint64_t v39 = sub_24D044278();
      os_log_type_t v40 = sub_24D044608();
      if (os_log_type_enabled(v39, v40))
      {
        uint64_t v41 = swift_slowAlloc();
        *(void *)&long long v74 = swift_slowAlloc();
        *(_DWORD *)uint64_t v41 = 136315394;
        uint64_t v73 = v72;
        swift_getMetatypeMetadata();
        uint64_t v42 = sub_24D044438();
        uint64_t v73 = sub_24D0390E4(v42, v43, (uint64_t *)&v74);
        sub_24D044768();
        swift_bridgeObjectRelease();
        *(_WORD *)(v41 + 12) = 2080;
        swift_bridgeObjectRetain();
        uint64_t v73 = sub_24D0390E4(v66, a2, (uint64_t *)&v74);
        sub_24D044768();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_24D00D000, v39, v40, "Failed to decode %s) data. Key = %s", (uint8_t *)v41, 0x16u);
        swift_arrayDestroy();
        OUTLINED_FUNCTION_7();
        OUTLINED_FUNCTION_7();

        sub_24D02FEE0(v67, *((unint64_t *)&v67 + 1));
      }
      else
      {
        sub_24D02FEE0(v67, *((unint64_t *)&v67 + 1));

        swift_bridgeObjectRelease_n();
      }
      uint64_t v32 = OUTLINED_FUNCTION_3_1();
    }
    else
    {
      uint64_t v44 = v21;
      uint64_t v63 = *(void (**)(unsigned char *, unsigned char *, uint64_t))(v14 + 32);
      uint64_t v64 = v14 + 32;
      v63(v21, v12, v30);
      uint64_t v45 = v66;
      if (qword_26B184A78 != -1) {
        swift_once();
      }
      uint64_t v46 = sub_24D044298();
      __swift_project_value_buffer(v46, (uint64_t)qword_26B185080);
      uint64_t v47 = v14;
      uint64_t v48 = *(void (**)(unsigned char *, unsigned char *, uint64_t))(v14 + 16);
      uint64_t v49 = v71;
      v48(v71, v21, v37);
      swift_bridgeObjectRetain_n();
      uint64_t v50 = v37;
      uint64_t v51 = sub_24D044278();
      os_log_type_t v52 = sub_24D044618();
      int v53 = v52;
      uint64_t v70 = v51;
      if (os_log_type_enabled(v51, v52))
      {
        uint64_t v54 = swift_slowAlloc();
        uint64_t v62 = swift_slowAlloc();
        *(void *)&long long v74 = v62;
        *(_DWORD *)uint64_t v54 = 136315394;
        int v61 = v53;
        swift_bridgeObjectRetain();
        uint64_t v73 = sub_24D0390E4(v45, a2, (uint64_t *)&v74);
        sub_24D044768();
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v54 + 12) = 2080;
        uint64_t v50 = v72;
        v48(v69, v49, v72);
        uint64_t v55 = sub_24D044438();
        uint64_t v57 = sub_24D0390E4(v55, v56, (uint64_t *)&v74);
        OUTLINED_FUNCTION_4_2(v57);
        swift_bridgeObjectRelease();
        (*(void (**)(unsigned char *, uint64_t))(v47 + 8))(v49, v50);
        uint64_t v58 = v70;
        _os_log_impl(&dword_24D00D000, v70, (os_log_type_t)v61, "Decoded Value for Key = %s, Value = %s", (uint8_t *)v54, 0x16u);
        swift_arrayDestroy();
        OUTLINED_FUNCTION_7();
        OUTLINED_FUNCTION_7();

        sub_24D02FEE0(v67, *((unint64_t *)&v67 + 1));
      }
      else
      {
        sub_24D02FEE0(v67, *((unint64_t *)&v67 + 1));
        swift_bridgeObjectRelease_n();
        (*(void (**)(unsigned char *, uint64_t))(v47 + 8))(v49, v50);
      }
      uint64_t v59 = v68;
      v63((unsigned char *)v68, v44, v50);
      uint64_t v32 = v59;
      uint64_t v33 = 0;
      uint64_t v34 = 1;
      uint64_t v35 = v50;
    }
    __swift_storeEnumTagSinglePayload(v32, v33, v34, v35);
    OUTLINED_FUNCTION_30();
  }
}

void sub_24D03741C()
{
  uint64_t v1 = v0;
  OUTLINED_FUNCTION_0_3();
  uint64_t v3 = MEMORY[0x270FA5388](v2);
  MEMORY[0x270FA5388](v3);
  id v12 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08910]), sel_initRequiringSecureCoding_, 0);
  sub_24D044628();
  id v4 = objc_msgSend(v12, sel_encodedData);
  uint64_t v5 = sub_24D0441C8();
  unint64_t v7 = v6;

  uint64_t v8 = (void *)sub_24D0441B8();
  sub_24D02FEF4(v5, v7);
  uint64_t v9 = (void *)sub_24D0443F8();
  objc_msgSend(v1, sel_setValue_forKey_, v8, v9);

  OUTLINED_FUNCTION_30();
}

id sub_24D0377F8(uint64_t a1, unint64_t a2)
{
  uint64_t v3 = v2;
  v11[1] = *(id *)MEMORY[0x263EF8340];
  unint64_t v6 = (void *)sub_24D0441B8();
  v11[0] = 0;
  id v7 = objc_msgSend(v3, sel_initForReadingFromData_error_, v6, v11);

  if (v7)
  {
    id v8 = v11[0];
  }
  else
  {
    id v9 = v11[0];
    sub_24D044178();

    swift_willThrow();
  }
  sub_24D02FEF4(a1, a2);
  return v7;
}

uint64_t sub_24D0378D8(uint64_t a1, unint64_t a2)
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

uint64_t OUTLINED_FUNCTION_3_1()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_4_2(uint64_t a1)
{
  *(void *)(v1 - 120) = a1;
  return sub_24D044768();
}

void UserDefaultsAccessible.value.getter()
{
  OUTLINED_FUNCTION_10_2();
  uint64_t v2 = v1();
  if (v2)
  {
    id v9 = (id)v2;
    OUTLINED_FUNCTION_2_2();
    v3();
    uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
    sub_24D036A58(AssociatedTypeWitness, v0);
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_getAssociatedTypeWitness();
    uint64_t v5 = OUTLINED_FUNCTION_14_3();
    __swift_storeEnumTagSinglePayload(v5, v6, v7, v8);
  }
}

void UserDefaultsAccessible.value.setter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  OUTLINED_FUNCTION_7_1();
  a19 = v20;
  a20 = v21;
  uint64_t v23 = v22;
  uint64_t v25 = v24;
  uint64_t v27 = v26;
  OUTLINED_FUNCTION_15_1();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v29 = sub_24D044758();
  OUTLINED_FUNCTION_0_3();
  uint64_t v31 = v30;
  OUTLINED_FUNCTION_9_1();
  MEMORY[0x270FA5388](v32);
  uint64_t v34 = (char *)&a9 - v33;
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v27, 1, AssociatedTypeWitness);
  uint64_t v36 = (*(uint64_t (**)(uint64_t, uint64_t))(v23 + 24))(v25, v23);
  uint64_t v37 = (void *)v36;
  if (EnumTagSinglePayload == 1)
  {
    if (v36)
    {
      OUTLINED_FUNCTION_2_2();
      v38();
      uint64_t v39 = (void *)sub_24D0443F8();
      swift_bridgeObjectRelease();
      objc_msgSend(v37, sel_removeObjectForKey_, v39);

LABEL_9:
    }
  }
  else if (v36)
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v31 + 16))(v34, v27, v29);
    if (__swift_getEnumTagSinglePayload((uint64_t)v34, 1, AssociatedTypeWitness) == 1)
    {
      uint64_t v40 = 0;
    }
    else
    {
      uint64_t v40 = sub_24D0448D8();
      (*(void (**)(char *, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 8))(v34, AssociatedTypeWitness);
    }
    OUTLINED_FUNCTION_2_2();
    v41();
    uint64_t v42 = (void *)sub_24D0443F8();
    swift_bridgeObjectRelease();
    objc_msgSend(v37, sel_setObject_forKey_, v40, v42);

    swift_unknownObjectRelease();
    goto LABEL_9;
  }
  (*(void (**)(uint64_t, uint64_t))(v31 + 8))(v27, v29);
  OUTLINED_FUNCTION_30();
}

uint64_t (*sub_24D037CA4(void *a1, uint64_t a2, uint64_t a3))()
{
  uint64_t v6 = malloc(0x28uLL);
  *a1 = v6;
  v6[4] = UserDefaultsAccessible.value.modify(v6, a2, a3);
  return sub_24D037D14;
}

uint64_t (*UserDefaultsAccessible.value.modify(void *a1, uint64_t a2, uint64_t a3))()
{
  uint64_t v7 = malloc(0x38uLL);
  *a1 = v7;
  v7[1] = a3;
  _OWORD v7[2] = v3;
  *uint64_t v7 = a2;
  OUTLINED_FUNCTION_15_1();
  swift_getAssociatedTypeWitness();
  uint64_t v8 = sub_24D044758();
  v7[3] = v8;
  OUTLINED_FUNCTION_1_4(v8);
  v7[4] = v9;
  size_t v11 = *(void *)(v10 + 64);
  v7[5] = malloc(v11);
  v7[6] = malloc(v11);
  UserDefaultsAccessible.value.getter();
  return sub_24D037DF4;
}

#error "24D037E68: call analysis failed (funcsize=45)"

void sub_24D037EA8()
{
}

#error "24D037FB8: call analysis failed (funcsize=62)"

uint64_t UserDefaultsAccessible.description.getter()
{
  OUTLINED_FUNCTION_15_1();
  swift_getAssociatedTypeWitness();
  sub_24D044758();
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_9_1();
  MEMORY[0x270FA5388](v0);
  sub_24D0447D8();
  OUTLINED_FUNCTION_19_1();
  OUTLINED_FUNCTION_2_2();
  v1();
  sub_24D044458();
  swift_bridgeObjectRelease();
  sub_24D044458();
  uint64_t v2 = OUTLINED_FUNCTION_12_2();
  v3(v2);
  sub_24D044438();
  sub_24D044458();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_17_0();
  uint64_t v4 = OUTLINED_FUNCTION_4_3();
  v5(v4);
  sub_24D044458();
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t UserDefaultsAccessible<>.value.getter()
{
  OUTLINED_FUNCTION_10_2();
  uint64_t v2 = v1();
  if (v2)
  {
    uint64_t v3 = (void *)v2;
    OUTLINED_FUNCTION_2_2();
    uint64_t v5 = v4();
    unint64_t v7 = v6;
    uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
    sub_24D036B24(v5, v7, AssociatedTypeWitness, v0);

    return swift_bridgeObjectRelease();
  }
  else
  {
    swift_getAssociatedTypeWitness();
    uint64_t v10 = OUTLINED_FUNCTION_14_3();
    return __swift_storeEnumTagSinglePayload(v10, v11, v12, v13);
  }
}

uint64_t sub_24D038250()
{
  return UserDefaultsAccessible<>.value.getter();
}

uint64_t sub_24D038280(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = *(void *)(a4 + a3 - 32);
  uint64_t v6 = *(void *)(a4 + a3 - 24);
  swift_getAssociatedTypeWitness();
  uint64_t v7 = sub_24D044758();
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v12 - v8;
  (*(void (**)(char *, uint64_t))(v10 + 16))((char *)&v12 - v8, a1);
  return UserDefaultsAccessible<>.value.setter((uint64_t)v9, v5, v6);
}

uint64_t UserDefaultsAccessible<>.value.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload(a1, 1, AssociatedTypeWitness);
  uint64_t v8 = (*(uint64_t (**)(uint64_t, uint64_t))(a3 + 24))(a2, a3);
  uint64_t v9 = (void *)v8;
  if (EnumTagSinglePayload == 1)
  {
    if (v8)
    {
      OUTLINED_FUNCTION_2_2();
      v10();
      uint64_t v11 = (void *)sub_24D0443F8();
      swift_bridgeObjectRelease();
      objc_msgSend(v9, sel_removeObjectForKey_, v11);
    }
  }
  else if (v8)
  {
    OUTLINED_FUNCTION_2_2();
    v12();
    sub_24D044758();
    swift_getWitnessTable();
    sub_24D03741C();

    swift_bridgeObjectRelease();
  }
  sub_24D044758();
  OUTLINED_FUNCTION_14();
  return (*(uint64_t (**)(uint64_t))(v13 + 8))(a1);
}

void (*UserDefaultsAccessible<>.value.modify(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5))()
{
  uint64_t v11 = malloc(0x48uLL);
  *a1 = v11;
  v11[3] = a5;
  v11[4] = v5;
  v11[1] = a3;
  id v11[2] = a4;
  *uint64_t v11 = a2;
  OUTLINED_FUNCTION_15_1();
  swift_getAssociatedTypeWitness();
  uint64_t v12 = sub_24D044758();
  v11[5] = v12;
  OUTLINED_FUNCTION_1_4(v12);
  v11[6] = v13;
  size_t v15 = *(void *)(v14 + 64);
  v11[7] = malloc(v15);
  v11[8] = malloc(v15);
  UserDefaultsAccessible<>.value.getter();
  return sub_24D03862C;
}

void sub_24D03862C()
{
  OUTLINED_FUNCTION_7_1();
  uint64_t v1 = *v0;
  uint64_t v2 = (void *)(*v0)[7];
  uint64_t v3 = (void *)(*v0)[8];
  if (v4)
  {
    uint64_t v5 = v1[5];
    uint64_t v6 = v1[6];
    uint64_t v8 = *v1;
    uint64_t v7 = v1[1];
    uint64_t v9 = OUTLINED_FUNCTION_5_1();
    v10(v9);
    UserDefaultsAccessible<>.value.setter((uint64_t)v2, v8, v7);
    (*(void (**)(void *, uint64_t))(v6 + 8))(v3, v5);
  }
  else
  {
    UserDefaultsAccessible<>.value.setter((*v0)[8], *v1, v1[1]);
  }
  free(v3);
  free(v2);
  OUTLINED_FUNCTION_30();
  free(v11);
}

void UserDefaultsAccessible<>.resolvedValue.getter()
{
  OUTLINED_FUNCTION_7_1();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v75 = v5;
  OUTLINED_FUNCTION_0_3();
  uint64_t v77 = v6;
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_16_1();
  uint64_t v71 = v8;
  uint64_t v10 = MEMORY[0x270FA5388](v9);
  uint64_t v70 = (char *)&v66 - v11;
  MEMORY[0x270FA5388](v10);
  uint64_t v69 = ((char *)&v66 - v12);
  uint64_t v74 = v13;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  sub_24D044758();
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_9_1();
  MEMORY[0x270FA5388](v15);
  uint64_t v17 = (char *)&v66 - v16;
  OUTLINED_FUNCTION_0_3();
  uint64_t v19 = v18;
  MEMORY[0x270FA5388](v20);
  OUTLINED_FUNCTION_16_1();
  uint64_t v73 = v21;
  uint64_t v23 = MEMORY[0x270FA5388](v22);
  uint64_t v25 = (char *)&v66 - v24;
  MEMORY[0x270FA5388](v23);
  uint64_t v27 = (char *)&v66 - v26;
  id v28 = (void (*)(uint64_t, char *))*((void *)v2 + 5);
  uint64_t v76 = v0;
  uint64_t v72 = v2;
  v28(v4, v2);
  if (__swift_getEnumTagSinglePayload((uint64_t)v17, 1, AssociatedTypeWitness) == 1)
  {
    OUTLINED_FUNCTION_3_2();
    v29();
    if (qword_26B184A78 != -1) {
      swift_once();
    }
    uint64_t v30 = sub_24D044298();
    __swift_project_value_buffer(v30, (uint64_t)qword_26B185080);
    uint64_t v31 = v77;
    uint64_t v32 = *(void (**)(void))(v77 + 16);
    OUTLINED_FUNCTION_18_1();
    v32();
    uint64_t v33 = v71;
    OUTLINED_FUNCTION_18_1();
    v32();
    uint64_t v34 = sub_24D044278();
    os_log_type_t v35 = sub_24D0445F8();
    int v36 = v35;
    if (os_log_type_enabled(v34, v35))
    {
      uint64_t v37 = swift_slowAlloc();
      uint64_t v69 = swift_slowAlloc();
      os_log_t v79 = v69;
      *(_DWORD *)uint64_t v37 = 136315394;
      os_log_t v68 = v34;
      LODWORD(v67) = v36;
      OUTLINED_FUNCTION_2_2();
      uint64_t v39 = v38();
      uint64_t v78 = sub_24D0390E4(v39, v40, (uint64_t *)&v79);
      sub_24D044768();
      swift_bridgeObjectRelease();
      uint64_t v41 = *(void (**)(void))(v31 + 8);
      uint64_t v77 = v31 + 8;
      OUTLINED_FUNCTION_3_2();
      v41();
      *(_WORD *)(v37 + 12) = 2080;
      uint64_t v72 = (char *)(v37 + 14);
      uint64_t v42 = *(void (**)(uint64_t, uint64_t))(v74 + 16);
      v42(v4, v74);
      uint64_t v43 = sub_24D044438();
      uint64_t v78 = sub_24D0390E4(v43, v44, (uint64_t *)&v79);
      sub_24D044768();
      swift_bridgeObjectRelease();
      ((void (*)(void (*)(void, void, void), uint64_t))v41)(v33, v4);
      os_log_t v45 = v68;
      _os_log_impl(&dword_24D00D000, v68, (os_log_type_t)v67, "[Defaults Default Value] Key = %s, Value = %s", (uint8_t *)v37, 0x16u);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_7();
      OUTLINED_FUNCTION_7();

      uint64_t v46 = v74;
    }
    else
    {
      int v61 = *(void (**)(void))(v31 + 8);
      OUTLINED_FUNCTION_3_2();
      v61();
      OUTLINED_FUNCTION_3_2();
      v61();

      uint64_t v46 = v74;
      uint64_t v42 = *(void (**)(uint64_t, uint64_t))(v74 + 16);
    }
    v42(v4, v46);
  }
  else
  {
    uint64_t v74 = *(void *)(v19 + 32);
    ((void (*)(char *, char *, uint64_t))v74)(v27, v17, AssociatedTypeWitness);
    if (qword_26B184A78 != -1) {
      swift_once();
    }
    uint64_t v47 = sub_24D044298();
    __swift_project_value_buffer(v47, (uint64_t)qword_26B185080);
    (*(void (**)(NSObject *, uint64_t, uint64_t))(v77 + 16))(v69, v76, v4);
    uint64_t v71 = *(void (**)(void, void, void))(v19 + 16);
    v71(v25, v27, AssociatedTypeWitness);
    uint64_t v48 = sub_24D044278();
    os_log_type_t v49 = sub_24D044618();
    LODWORD(v76) = v49;
    if (os_log_type_enabled(v48, v49))
    {
      uint64_t v50 = swift_slowAlloc();
      uint64_t v70 = (char *)(v19 + 32);
      uint64_t v51 = v50;
      os_log_t v68 = (os_log_t)swift_slowAlloc();
      os_log_t v79 = v68;
      *(_DWORD *)uint64_t v51 = 136315394;
      uint64_t v66 = v51 + 4;
      os_log_t v67 = v48;
      OUTLINED_FUNCTION_2_2();
      uint64_t v53 = v52();
      uint64_t v78 = sub_24D0390E4(v53, v54, (uint64_t *)&v79);
      uint64_t v72 = v27;
      sub_24D044768();
      swift_bridgeObjectRelease();
      uint64_t v55 = OUTLINED_FUNCTION_11_3();
      v56(v55);
      *(_WORD *)(v51 + 12) = 2080;
      v71(v73, v25, AssociatedTypeWitness);
      uint64_t v57 = sub_24D044438();
      uint64_t v78 = sub_24D0390E4(v57, v58, (uint64_t *)&v79);
      uint64_t v27 = v72;
      sub_24D044768();
      swift_bridgeObjectRelease();
      uint64_t v59 = OUTLINED_FUNCTION_21_1();
      v60(v59);
      uint64_t v48 = v67;
      _os_log_impl(&dword_24D00D000, v67, (os_log_type_t)v76, "[Defaults Custom Value] Key = %s, Value = %s", (uint8_t *)v51, 0x16u);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_7();
      OUTLINED_FUNCTION_7();
    }
    else
    {
      uint64_t v62 = OUTLINED_FUNCTION_11_3();
      v63(v62);
      uint64_t v64 = OUTLINED_FUNCTION_21_1();
      v65(v64);
    }

    ((void (*)(uint64_t, char *, uint64_t))v74)(v75, v27, AssociatedTypeWitness);
  }
  OUTLINED_FUNCTION_30();
}

void UserDefaultsAccessible<>.description.getter()
{
  OUTLINED_FUNCTION_7_1();
  swift_getAssociatedTypeWitness();
  OUTLINED_FUNCTION_0_3();
  uint64_t v1 = v0;
  OUTLINED_FUNCTION_9_1();
  MEMORY[0x270FA5388](v2);
  sub_24D044758();
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_9_1();
  MEMORY[0x270FA5388](v3);
  sub_24D0447D8();
  OUTLINED_FUNCTION_19_1();
  OUTLINED_FUNCTION_2_2();
  v6(v4, v5);
  sub_24D044458();
  swift_bridgeObjectRelease();
  sub_24D044458();
  uint64_t v7 = OUTLINED_FUNCTION_12_2();
  v8(v7);
  sub_24D044438();
  sub_24D044458();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_17_0();
  uint64_t v9 = OUTLINED_FUNCTION_6_1();
  v10(v9);
  sub_24D0448C8();
  uint64_t v11 = *(void (**)(uint64_t, uint64_t))(v1 + 8);
  OUTLINED_FUNCTION_3_2();
  v11(v12, v13);
  OUTLINED_FUNCTION_17_0();
  uint64_t v14 = OUTLINED_FUNCTION_6_1();
  v15(v14);
  sub_24D0448C8();
  OUTLINED_FUNCTION_3_2();
  v11(v16, v17);
  OUTLINED_FUNCTION_17_0();
  uint64_t v18 = OUTLINED_FUNCTION_4_3();
  v19(v18);
  sub_24D044458();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_30();
}

void sub_24D039014(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);
  free(v1);
}

void sub_24D03905C()
{
  swift_getWitnessTable();
  swift_getWitnessTable();
  UserDefaultsAccessible<>.resolvedValue.getter();
}

uint64_t sub_24D0390E4(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_24D039298(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_24D0251A0((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    uint64_t ObjectType = MEMORY[0x263F8DBE0];
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_24D0251A0((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_24D0391C0()
{
  return 16;
}

__n128 sub_24D0391CC(__n128 *a1, __n128 *a2)
{
  __n128 result = *a1;
  *a2 = *a1;
  return result;
}

uint64_t sub_24D0391E0()
{
  return 32;
}

__n128 sub_24D0391EC(uint64_t a1, _OWORD *a2)
{
  __n128 result = *(__n128 *)a1;
  long long v3 = *(_OWORD *)(a1 + 16);
  *a2 = *(_OWORD *)a1;
  a2[1] = v3;
  return result;
}

uint64_t dispatch thunk of DefaultValueProviding.defaultValue.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of ResolvedValueProviding.resolvedValue.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of UserDefaultsAccessible.userDefaults.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of UserDefaultsAccessible.key.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of UserDefaultsAccessible.value.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of UserDefaultsAccessible.value.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 48))();
}

uint64_t dispatch thunk of UserDefaultsAccessible.value.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 56))();
}

uint64_t dispatch thunk of UserDefaultsAccessible.localizedDescription.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 64))();
}

uint64_t sub_24D039298(void *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      sub_24D0393F0((char *)__src, HIBYTE(a6) & 0xF, __dst);
      sub_24D044778();
      uint64_t result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    uint64_t result = sub_24D0394C8(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    uint64_t v8 = sub_24D044818();
    if (!v8)
    {
      uint64_t result = sub_24D044868();
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

void *sub_24D0393F0(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_24D044898();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

uint64_t sub_24D0394C8(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_24D039560(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = (uint64_t)sub_24D03973C(0, *(void *)(v2 + 16) + 1, 1, v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = (uint64_t)sub_24D03973C((char *)(v3 > 1), v4 + 1, 1, v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_24D039560(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0)
  {
    uint64_t v2 = sub_24D044468();
    if (v2) {
      goto LABEL_6;
    }
    return MEMORY[0x263F8EE78];
  }
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v2 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (!v2) {
    return MEMORY[0x263F8EE78];
  }
LABEL_6:
  unint64_t v3 = sub_24D0396D4(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    unint64_t v4 = v3;
    uint64_t v5 = sub_24D0447E8();
    if ((v6 & 1) != 0 || v5 != v2) {
      goto LABEL_14;
    }
    return (uint64_t)v4;
  }
  sub_24D044898();
  __break(1u);
LABEL_14:
  uint64_t result = sub_24D044868();
  __break(1u);
  return result;
}

void *sub_24D0396D4(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return (void *)MEMORY[0x263F8EE78];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26984FDE8);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  id v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_24D03973C(char *result, int64_t a2, char a3, uint64_t a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26984FDE8);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = (char *)(a4 + 32);
  if (v5)
  {
    sub_24D0398EC(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_24D039814(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_24D039814(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_24D044898();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

char *sub_24D0398EC(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    __src = (char *)sub_24D044898();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

uint64_t OUTLINED_FUNCTION_4_3()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_5_1()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_6_1()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_11_3()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_12_2()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_14_3()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_15_1()
{
  return 255;
}

uint64_t OUTLINED_FUNCTION_17_0()
{
  return sub_24D044458();
}

uint64_t OUTLINED_FUNCTION_19_1()
{
  return sub_24D044458();
}

uint64_t OUTLINED_FUNCTION_21_1()
{
  return v0;
}

uint64_t sub_24D039B24()
{
  return sub_24D03A014(&OBJC_IVAR___DIXPCDispatcher_deviceListDelegate);
}

uint64_t sub_24D039B90()
{
  return sub_24D03A0C0();
}

uint64_t sub_24D039B9C()
{
  return sub_24D039B90();
}

void (*sub_24D039BC8())(void **, char)
{
  uint64_t v2 = OUTLINED_FUNCTION_8_3();
  uint64_t v3 = OUTLINED_FUNCTION_7_2((uint64_t)v2);
  OUTLINED_FUNCTION_1_5(v3, OBJC_IVAR___DIXPCDispatcher_deviceListDelegate);
  *(void *)(v1 + 24) = MEMORY[0x25331C870](v0);
  return sub_24D039C28;
}

uint64_t sub_24D039C60()
{
  return sub_24D03A014(&OBJC_IVAR___DIXPCDispatcher_deviceStatusDelegate);
}

uint64_t sub_24D039CCC()
{
  return sub_24D03A0C0();
}

uint64_t sub_24D039CD8()
{
  return sub_24D039CCC();
}

void (*sub_24D039D04())(void **, char)
{
  uint64_t v2 = OUTLINED_FUNCTION_8_3();
  uint64_t v3 = OUTLINED_FUNCTION_7_2((uint64_t)v2);
  OUTLINED_FUNCTION_1_5(v3, OBJC_IVAR___DIXPCDispatcher_deviceStatusDelegate);
  *(void *)(v1 + 24) = MEMORY[0x25331C870](v0);
  return sub_24D039C28;
}

uint64_t sub_24D039D98()
{
  return sub_24D03A014(&OBJC_IVAR___DIXPCDispatcher_sessionStatusDelegate);
}

uint64_t sub_24D039E04()
{
  return sub_24D03A0C0();
}

uint64_t sub_24D039E10()
{
  return sub_24D039E04();
}

void (*sub_24D039E3C())(void **, char)
{
  uint64_t v2 = OUTLINED_FUNCTION_8_3();
  uint64_t v3 = OUTLINED_FUNCTION_7_2((uint64_t)v2);
  OUTLINED_FUNCTION_1_5(v3, OBJC_IVAR___DIXPCDispatcher_sessionStatusDelegate);
  *(void *)(v1 + 24) = MEMORY[0x25331C870](v0);
  return sub_24D039C28;
}

uint64_t sub_24D039ED0()
{
  return sub_24D03A014(&OBJC_IVAR___DIXPCDispatcher_audioPowerDelegate);
}

uint64_t sub_24D039F3C()
{
  return sub_24D03A0C0();
}

uint64_t sub_24D039F48()
{
  return sub_24D039F3C();
}

void (*sub_24D039F74())(void **, char)
{
  uint64_t v2 = OUTLINED_FUNCTION_8_3();
  uint64_t v3 = OUTLINED_FUNCTION_7_2((uint64_t)v2);
  OUTLINED_FUNCTION_1_5(v3, OBJC_IVAR___DIXPCDispatcher_audioPowerDelegate);
  *(void *)(v1 + 24) = MEMORY[0x25331C870](v0);
  return sub_24D039C28;
}

uint64_t sub_24D03A008()
{
  return sub_24D03A014(&OBJC_IVAR___DIXPCDispatcher_audioStatusDelegate);
}

uint64_t sub_24D03A014(void *a1)
{
  uint64_t v2 = v1 + *a1;
  OUTLINED_FUNCTION_4_4();
  return MEMORY[0x25331C870](v2);
}

uint64_t sub_24D03A0B4()
{
  return sub_24D03A0C0();
}

uint64_t sub_24D03A0C0()
{
  return swift_unknownObjectRelease();
}

uint64_t sub_24D03A118()
{
  return sub_24D03A0B4();
}

void (*sub_24D03A144())(void **, char)
{
  uint64_t v2 = OUTLINED_FUNCTION_8_3();
  uint64_t v3 = OUTLINED_FUNCTION_7_2((uint64_t)v2);
  OUTLINED_FUNCTION_1_5(v3, OBJC_IVAR___DIXPCDispatcher_audioStatusDelegate);
  *(void *)(v1 + 24) = MEMORY[0x25331C870](v0);
  return sub_24D039C28;
}

id XPCDispatcher.__allocating_init(clientContext:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return XPCDispatcher.init(clientContext:)(a1);
}

id XPCDispatcher.init(clientContext:)(void *a1)
{
  id v3 = v1;
  sub_24D044288();
  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_6_2();
  *(void *)&v3[OBJC_IVAR___DIXPCDispatcher_clientContext] = a1;
  id v4 = a1;

  v7.receiver = v3;
  v7.super_class = (Class)type metadata accessor for XPCDispatcher();
  id v5 = objc_msgSendSuper2(&v7, sel_init);

  return v5;
}

uint64_t type metadata accessor for XPCDispatcher()
{
  uint64_t result = qword_26B184C38;
  if (!qword_26B184C38) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_24D03A348()
{
  *(void *)(v1 + 16) = v0;
  return MEMORY[0x270FA2498](sub_24D03A368, 0, 0);
}

uint64_t sub_24D03A368()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_4();
  id v4 = v0;
  id v2 = v1;
  return v4(v2);
}

uint64_t sub_24D03A454(const void *a1, void *a2)
{
  v2[2] = a2;
  v2[3] = _Block_copy(a1);
  a2;
  id v4 = (void *)swift_task_alloc();
  v2[4] = v4;
  void *v4 = v2;
  v4[1] = sub_24D03A4FC;
  return sub_24D03A348();
}

uint64_t sub_24D03A4FC(void *a1)
{
  id v3 = v1;
  uint64_t v5 = *v2;
  uint64_t v6 = *(void **)(*v2 + 16);
  uint64_t v7 = *v2;
  OUTLINED_FUNCTION_6();
  void *v8 = v7;
  swift_task_dealloc();

  int64_t v9 = *(void (***)(void, void, void))(v5 + 24);
  if (v3)
  {
    uint64_t v10 = (void *)sub_24D044168();

    ((void (**)(void, void, void *))v9)[2](v9, 0, v10);
    _Block_release(v9);
  }
  else
  {
    ((void (**)(void, void *, void))v9)[2](v9, a1, 0);
    _Block_release(v9);
  }
  size_t v11 = *(uint64_t (**)(void))(v7 + 8);
  return v11();
}

uint64_t sub_24D03A694(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B184BF0);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_24D044548();
  __swift_storeEnumTagSinglePayload((uint64_t)v6, 1, 1, v7);
  int64_t v8 = (void *)swift_allocObject();
  v8[2] = 0;
  v8[3] = 0;
  v8[4] = a1;
  v8[5] = a2;
  int64_t v9 = (void *)swift_allocObject();
  v9[2] = 0;
  v9[3] = 0;
  v9[4] = &unk_26984FE20;
  v9[5] = v8;
  sub_24D03BA48((uint64_t)v6, (uint64_t)&unk_26984FE30, (uint64_t)v9);
  return swift_release();
}

uint64_t sub_24D03A798()
{
  uint64_t v1 = v0;
  swift_bridgeObjectRetain_n();
  id v2 = sub_24D044278();
  os_log_type_t v3 = sub_24D044618();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    v14[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v4 = 136315138;
    unint64_t v5 = sub_24D03A980();
    uint64_t v6 = swift_bridgeObjectRetain();
    uint64_t v7 = MEMORY[0x25331BAB0](v6, v5);
    unint64_t v9 = v8;
    swift_bridgeObjectRelease();
    sub_24D0390E4(v7, v9, v14);
    sub_24D044768();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24D00D000, v2, v3, "Did load devices %s", v4, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_7();
    OUTLINED_FUNCTION_7();
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  uint64_t v10 = v1 + OBJC_IVAR___DIXPCDispatcher_deviceListDelegate;
  OUTLINED_FUNCTION_4_4();
  uint64_t result = MEMORY[0x25331C870](v10);
  if (result)
  {
    uint64_t v12 = (void *)result;
    sub_24D03A980();
    uint64_t v13 = (void *)sub_24D044488();
    objc_msgSend(v12, sel_didLoadDevices_, v13);

    return swift_unknownObjectRelease();
  }
  return result;
}

unint64_t sub_24D03A980()
{
  unint64_t result = qword_26B184C90;
  if (!qword_26B184C90)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26B184C90);
  }
  return result;
}

void *sub_24D03AA24(void *a1)
{
  return sub_24D03ACD4(a1, "Did add device %@", &OBJC_IVAR___DIXPCDispatcher_deviceListDelegate, (SEL *)&selRef_didAddDevice_);
}

void *sub_24D03AAA8(void *a1)
{
  return sub_24D03ACD4(a1, "Did remove device %@", &OBJC_IVAR___DIXPCDispatcher_deviceListDelegate, (SEL *)&selRef_didRemoveDevice_);
}

void *sub_24D03AB2C(void *a1)
{
  return sub_24D03ACD4(a1, "Did update device %@", &OBJC_IVAR___DIXPCDispatcher_deviceStatusDelegate, (SEL *)&selRef_didUpdateDevice_);
}

void *sub_24D03ABB0(void *a1)
{
  return sub_24D03ACD4(a1, "Did Add Session %@", &OBJC_IVAR___DIXPCDispatcher_sessionStatusDelegate, (SEL *)&selRef_didAddSession_);
}

void *sub_24D03AC34(void *a1)
{
  return sub_24D03ACD4(a1, "Did Remove Session %@", &OBJC_IVAR___DIXPCDispatcher_sessionStatusDelegate, (SEL *)&selRef_didRemoveSession_);
}

void *sub_24D03ACB8(void *a1)
{
  return sub_24D03ACD4(a1, "Did Update Session %@", &OBJC_IVAR___DIXPCDispatcher_sessionStatusDelegate, (SEL *)&selRef_didUpdateSession_);
}

void *sub_24D03ACD4(void *a1, char *a2, void *a3, SEL *a4)
{
  uint64_t v8 = v4;
  id v9 = a1;
  uint64_t v10 = sub_24D044278();
  os_log_type_t v11 = sub_24D044618();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = (uint8_t *)swift_slowAlloc();
    uint64_t v16 = (void *)OUTLINED_FUNCTION_34();
    *(_DWORD *)uint64_t v12 = 138412290;
    format = a2;
    id v13 = v9;
    sub_24D044768();
    void *v16 = v9;

    _os_log_impl(&dword_24D00D000, v10, v11, format, v12, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26984F7C0);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_7();
    OUTLINED_FUNCTION_7();
  }
  else
  {
  }
  uint64_t v14 = v8 + *a3;
  OUTLINED_FUNCTION_4_4();
  unint64_t result = (void *)MEMORY[0x25331C870](v14);
  if (result)
  {
    objc_msgSend(result, *a4, v9);
    return (void *)swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_24D03AEE4(void *a1, void *a2)
{
  id v4 = a1;
  id v5 = a2;
  id v6 = v4;
  id v7 = a2;
  uint64_t v8 = sub_24D044278();
  os_log_type_t v9 = sub_24D044608();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = swift_slowAlloc();
    os_log_type_t v11 = (void *)OUTLINED_FUNCTION_34();
    v19[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v10 = 138412546;
    id v12 = v6;
    sub_24D044768();
    *os_log_type_t v11 = v6;

    *(_WORD *)(v10 + 12) = 2080;
    swift_getErrorValue();
    uint64_t v13 = sub_24D044928();
    sub_24D0390E4(v13, v14, v19);
    sub_24D044768();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_24D00D000, v8, v9, "Session Did Fail %@. Error = %s", (uint8_t *)v10, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26984F7C0);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_7();
    swift_arrayDestroy();
    OUTLINED_FUNCTION_7();
    OUTLINED_FUNCTION_7();
  }
  else
  {
  }
  uint64_t v15 = v2 + OBJC_IVAR___DIXPCDispatcher_sessionStatusDelegate;
  OUTLINED_FUNCTION_4_4();
  uint64_t result = MEMORY[0x25331C870](v15);
  if (result)
  {
    uint64_t v17 = (void *)result;
    uint64_t v18 = (void *)sub_24D044168();
    objc_msgSend(v17, sel_session_didFailWithError_, v6, v18);

    return swift_unknownObjectRelease();
  }
  return result;
}

void *sub_24D03B1BC(void *a1, char a2)
{
  uint64_t v3 = v2;
  id v5 = a1;
  id v6 = sub_24D044278();
  os_log_type_t v7 = sub_24D044618();
  char v13 = a2;
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = swift_slowAlloc();
    os_log_type_t v9 = (void *)OUTLINED_FUNCTION_34();
    *(_DWORD *)uint64_t v8 = 67109378;
    sub_24D044768();
    *(_WORD *)(v8 + 8) = 2112;
    id v10 = v5;
    sub_24D044768();
    void *v9 = v5;

    _os_log_impl(&dword_24D00D000, v6, v7, "Did Update Mute State %{BOOL}d for Session %@", (uint8_t *)v8, 0x12u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26984F7C0);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_7();
    OUTLINED_FUNCTION_7();
  }
  else
  {
  }
  uint64_t v11 = v3 + OBJC_IVAR___DIXPCDispatcher_sessionStatusDelegate;
  OUTLINED_FUNCTION_4_4();
  uint64_t result = (void *)MEMORY[0x25331C870](v11);
  if (result)
  {
    objc_msgSend(result, sel_session_didUpdateUplinkMuteStatus_, v5, v13 & 1);
    return (void *)swift_unknownObjectRelease();
  }
  return result;
}

void *sub_24D03B3E0(float a1)
{
  uint64_t v2 = v1;
  id v4 = sub_24D044278();
  os_log_type_t v5 = sub_24D0445E8();
  if (os_log_type_enabled(v4, v5))
  {
    id v6 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)id v6 = 134217984;
    OUTLINED_FUNCTION_12_3();
    sub_24D044768();
    _os_log_impl(&dword_24D00D000, v4, v5, "Did update audio power %f", v6, 0xCu);
    OUTLINED_FUNCTION_7();
  }

  uint64_t v7 = v2 + OBJC_IVAR___DIXPCDispatcher_audioPowerDelegate;
  OUTLINED_FUNCTION_4_4();
  uint64_t result = (void *)MEMORY[0x25331C870](v7);
  if (result)
  {
    *(float *)&double v9 = a1;
    objc_msgSend(result, sel_didUpdateAudioPower_, v9);
    return (void *)swift_unknownObjectRelease();
  }
  return result;
}

void *sub_24D03B54C(char a1)
{
  return sub_24D03B5C8(a1, "Did update uplink muted to: %{BOOL}d", (SEL *)&selRef_didUpdateUplinkMuteStatus_);
}

void *sub_24D03B5B4(char a1)
{
  return sub_24D03B5C8(a1, "Did update downlink muted to: %{BOOL}d", (SEL *)&selRef_didUpdateDownlinkMuteStatus_);
}

void *sub_24D03B5C8(char a1, const char *a2, SEL *a3)
{
  uint64_t v6 = v3;
  uint64_t v8 = sub_24D044278();
  os_log_type_t v9 = sub_24D044618();
  if (os_log_type_enabled(v8, v9))
  {
    id v10 = (uint8_t *)OUTLINED_FUNCTION_34();
    *(_DWORD *)id v10 = 67109120;
    sub_24D044768();
    _os_log_impl(&dword_24D00D000, v8, v9, a2, v10, 8u);
    OUTLINED_FUNCTION_7();
  }

  uint64_t v11 = v6 + OBJC_IVAR___DIXPCDispatcher_audioStatusDelegate;
  OUTLINED_FUNCTION_4_4();
  uint64_t result = (void *)MEMORY[0x25331C870](v11);
  if (result)
  {
    objc_msgSend(result, *a3, a1 & 1);
    return (void *)swift_unknownObjectRelease();
  }
  return result;
}

id XPCDispatcher.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void XPCDispatcher.init()()
{
}

id XPCDispatcher.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for XPCDispatcher();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_24D03B8B0(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  id v4 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v4;
  void *v4 = v3;
  v4[1] = sub_24D022180;
  return v6();
}

uint64_t sub_24D03B97C(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  os_log_type_t v5 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v5;
  *os_log_type_t v5 = v4;
  v5[1] = sub_24D022180;
  return v7();
}

uint64_t sub_24D03BA48(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24D044548();
  if (__swift_getEnumTagSinglePayload(a1, 1, v6) == 1)
  {
    sub_24D029F28(a1);
  }
  else
  {
    sub_24D044538();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(a1, v6);
  }
  if (*(void *)(a3 + 16))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_24D0444E8();
    swift_unknownObjectRelease();
  }
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = a2;
  *(void *)(v7 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_24D03BBB0()
{
  OUTLINED_FUNCTION_5_2();
  uint64_t result = sub_24D039B24();
  uint64_t *v0 = result;
  return result;
}

uint64_t sub_24D03BBDC()
{
  OUTLINED_FUNCTION_5_2();
  uint64_t result = sub_24D039C60();
  uint64_t *v0 = result;
  return result;
}

uint64_t sub_24D03BC08()
{
  OUTLINED_FUNCTION_5_2();
  uint64_t result = sub_24D039D98();
  uint64_t *v0 = result;
  return result;
}

uint64_t sub_24D03BC34()
{
  OUTLINED_FUNCTION_5_2();
  uint64_t result = sub_24D039ED0();
  uint64_t *v0 = result;
  return result;
}

uint64_t sub_24D03BC60()
{
  OUTLINED_FUNCTION_5_2();
  uint64_t result = sub_24D03A008();
  uint64_t *v0 = result;
  return result;
}

uint64_t sub_24D03BC8C()
{
  return type metadata accessor for XPCDispatcher();
}

uint64_t sub_24D03BC94()
{
  uint64_t result = sub_24D044298();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for XPCDispatcher(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for XPCDispatcher);
}

uint64_t dispatch thunk of XPCDispatcher.deviceListDelegate.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x88))();
}

uint64_t dispatch thunk of XPCDispatcher.deviceListDelegate.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x90))();
}

uint64_t dispatch thunk of XPCDispatcher.deviceListDelegate.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x98))();
}

uint64_t dispatch thunk of XPCDispatcher.deviceStatusDelegate.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xA0))();
}

uint64_t dispatch thunk of XPCDispatcher.deviceStatusDelegate.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xA8))();
}

uint64_t dispatch thunk of XPCDispatcher.deviceStatusDelegate.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xB0))();
}

uint64_t dispatch thunk of XPCDispatcher.sessionStatusDelegate.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xB8))();
}

uint64_t dispatch thunk of XPCDispatcher.sessionStatusDelegate.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xC0))();
}

uint64_t dispatch thunk of XPCDispatcher.sessionStatusDelegate.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xC8))();
}

uint64_t dispatch thunk of XPCDispatcher.audioPowerDelegate.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xD0))();
}

uint64_t dispatch thunk of XPCDispatcher.audioPowerDelegate.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xD8))();
}

uint64_t dispatch thunk of XPCDispatcher.audioPowerDelegate.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xE0))();
}

uint64_t dispatch thunk of XPCDispatcher.audioStatusDelegate.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xE8))();
}

uint64_t dispatch thunk of XPCDispatcher.audioStatusDelegate.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xF0))();
}

uint64_t dispatch thunk of XPCDispatcher.audioStatusDelegate.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xF8))();
}

uint64_t dispatch thunk of XPCDispatcher.__allocating_init(clientContext:)()
{
  return (*(uint64_t (**)(void))(v0 + 256))();
}

uint64_t dispatch thunk of XPCDispatcher.fetchClientContext()()
{
  OUTLINED_FUNCTION_9();
  unint64_t v1 = *(int **)((*MEMORY[0x263F8EED0] & *v0) + 0x108);
  uint64_t v6 = (uint64_t (*)(void))((char *)v1 + *v1);
  uint64_t v2 = swift_task_alloc();
  uint64_t v3 = (void *)OUTLINED_FUNCTION_9_2(v2);
  *uint64_t v3 = v4;
  v3[1] = sub_24D03C180;
  return v6();
}

uint64_t sub_24D03C180()
{
  OUTLINED_FUNCTION_5();
  uint64_t v2 = v1;
  OUTLINED_FUNCTION_0_1();
  uint64_t v3 = *v0;
  OUTLINED_FUNCTION_6();
  void *v4 = v3;
  swift_task_dealloc();
  os_log_type_t v5 = *(uint64_t (**)(uint64_t))(v3 + 8);
  return v5(v2);
}

uint64_t dispatch thunk of XPCDispatcher.didLoadDevices(_:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x110))();
}

uint64_t dispatch thunk of XPCDispatcher.didAddDevice(_:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x118))();
}

uint64_t dispatch thunk of XPCDispatcher.didRemoveDevice(_:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x120))();
}

uint64_t dispatch thunk of XPCDispatcher.didUpdateDevice(_:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x128))();
}

uint64_t dispatch thunk of XPCDispatcher.didAddSession(_:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x130))();
}

uint64_t dispatch thunk of XPCDispatcher.didRemoveSession(_:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x138))();
}

uint64_t dispatch thunk of XPCDispatcher.didUpdateSession(_:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x140))();
}

uint64_t dispatch thunk of XPCDispatcher.session(_:didFailWithError:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x148))();
}

uint64_t dispatch thunk of XPCDispatcher.session(_:didUpdateUplinkMuteStatus:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x150))();
}

uint64_t dispatch thunk of XPCDispatcher.didUpdateAudioPower(_:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x158))();
}

uint64_t dispatch thunk of XPCDispatcher.didUpdateUplinkMuteStatus(_:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x160))();
}

uint64_t dispatch thunk of XPCDispatcher.didUpdateDownlinkMuteStatus(_:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x168))();
}

uint64_t sub_24D03C51C()
{
  _Block_release(*(const void **)(v0 + 16));

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_24D03C55C()
{
  OUTLINED_FUNCTION_9();
  uint64_t v1 = *(const void **)(v0 + 16);
  uint64_t v2 = *(void **)(v0 + 24);
  uint64_t v3 = swift_task_alloc();
  uint64_t v4 = (void *)OUTLINED_FUNCTION_9_2(v3);
  void *v4 = v5;
  v4[1] = sub_24D021A90;
  uint64_t v6 = (uint64_t (*)(const void *, void *))((char *)&dword_26984FE08 + dword_26984FE08);
  return v6(v1, v2);
}

uint64_t sub_24D03C604()
{
  uint64_t v1 = v0[2];
  uint64_t v2 = v0[3];
  uint64_t v3 = (int *)v0[4];
  uint64_t v4 = swift_task_alloc();
  uint64_t v5 = (void *)OUTLINED_FUNCTION_9_2(v4);
  *uint64_t v5 = v6;
  v5[1] = sub_24D022180;
  uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_26984FE18 + dword_26984FE18);
  return v7(v1, v2, v3);
}

uint64_t objectdestroy_15Tm()
{
  swift_unknownObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_24D03C704(uint64_t a1)
{
  uint64_t v3 = v1[2];
  uint64_t v4 = v1[3];
  uint64_t v5 = (int *)v1[4];
  uint64_t v6 = swift_task_alloc();
  uint64_t v7 = (void *)OUTLINED_FUNCTION_9_2(v6);
  *uint64_t v7 = v8;
  v7[1] = sub_24D022180;
  uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_26984FE28 + dword_26984FE28);
  return v9(a1, v3, v4, v5);
}

uint64_t sub_24D03C7CC()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_24D03C804()
{
  OUTLINED_FUNCTION_9();
  uint64_t v2 = v1;
  uint64_t v3 = *(int **)(v0 + 16);
  uint64_t v4 = swift_task_alloc();
  uint64_t v5 = (void *)OUTLINED_FUNCTION_9_2(v4);
  *uint64_t v5 = v6;
  v5[1] = sub_24D021A90;
  uint64_t v7 = (uint64_t (*)(uint64_t, int *))((char *)&dword_26984FE38 + dword_26984FE38);
  return v7(v2, v3);
}

uint64_t OUTLINED_FUNCTION_1_5@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  *(void *)(a1 + 32) = v2;
  *(void *)(a1 + 40) = a2;
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_4_4()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_6_2()
{
  return swift_unknownObjectWeakInit();
}

uint64_t OUTLINED_FUNCTION_7_2(uint64_t result)
{
  void *v1 = result;
  return result;
}

void *OUTLINED_FUNCTION_8_3()
{
  return malloc(0x30uLL);
}

uint64_t OUTLINED_FUNCTION_9_2(uint64_t result)
{
  *(void *)(v1 + 16) = result;
  return result;
}

uint64_t DropInPlayer.Settings.init(repeating:timeout:toneURL:volume:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>, double a5@<D0>, float a6@<S1>)
{
  *(void *)a4 = a1;
  *(void *)(a4 + 8) = a2;
  *(double *)(a4 + 16) = a5;
  uint64_t v9 = type metadata accessor for DropInPlayer.Settings(0);
  uint64_t v10 = a4 + *(int *)(v9 + 24);
  uint64_t v11 = sub_24D0441A8();
  uint64_t v12 = *(void *)(v11 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 16))(v10, a3, v11);
  v13.n128_u32[0] = 1.0;
  if (a6 <= 1.0) {
    v13.n128_f32[0] = a6;
  }
  if (a6 >= 0.0) {
    float v14 = v13.n128_f32[0];
  }
  else {
    float v14 = 0.0;
  }
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, __n128))(v12 + 8))(a3, v11, v13);
  *(float *)(a4 + *(int *)(v9 + 28)) = v14;
  return result;
}

uint64_t type metadata accessor for DropInPlayer.Settings(uint64_t a1)
{
  return sub_24D03D70C(a1, (uint64_t *)&unk_26984FE78);
}

uint64_t sub_24D03CA68(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return MEMORY[0x270F9A758]();
}

uint64_t sub_24D03CA74(uint64_t a1)
{
  *(void *)(v1 + OBJC_IVAR____TtC6DropIn12DropInPlayer_timer) = a1;
  return MEMORY[0x270F9A758]();
}

uint64_t sub_24D03CA88(uint64_t a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = sub_24D0441A8();
  OUTLINED_FUNCTION_1_0();
  uint64_t v7 = v6;
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_1_1();
  uint64_t v11 = v10 - v9;
  *(void *)(v3 + OBJC_IVAR____TtC6DropIn12DropInPlayer_timer) = 0;
  uint64_t v12 = type metadata accessor for DropInPlayer.Settings(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(v11, a1 + *(int *)(v12 + 24), v5);
  id v13 = objc_allocWithZone((Class)type metadata accessor for AudioPlayer());
  float v14 = sub_24D01D130(v11);
  if (v2)
  {
    sub_24D021654(a1);

    type metadata accessor for DropInPlayer(0);
    swift_deallocPartialClassInstance();
  }
  else
  {
    *(void *)(v3 + 16) = v14;
    sub_24D03E1B0(a1, v3 + OBJC_IVAR____TtC6DropIn12DropInPlayer_settings);
  }
  return v3;
}

char *sub_24D03CBE4(uint64_t a1, char a2)
{
  uint64_t v4 = v2;
  uint64_t v6 = sub_24D0441A8();
  OUTLINED_FUNCTION_1_0();
  uint64_t v8 = v7;
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_1_1();
  uint64_t v12 = v11 - v10;
  uint64_t v13 = type metadata accessor for DropInPlayer.Settings(0);
  MEMORY[0x270FA5388](v13);
  OUTLINED_FUNCTION_1_1();
  uint64_t v17 = v16 - v15;
  if (a2)
  {
    sub_24D024DC8(v4 + OBJC_IVAR____TtC6DropIn12DropInPlayer_settings, v17);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 32))(v12, v17 + *(int *)(v13 + 24), v6);
    id v18 = objc_allocWithZone((Class)type metadata accessor for AudioPlayer());
    uint64_t result = sub_24D01D130(v12);
    if (v3) {
      return result;
    }
    sub_24D03CA68((uint64_t)result);
  }
  LODWORD(v14) = *(_DWORD *)(v4 + OBJC_IVAR____TtC6DropIn12DropInPlayer_settings + *(int *)(v13 + 28));
  objc_msgSend(*(id *)(*(void *)(v4 + 16) + OBJC_IVAR____TtC6DropIn11AudioPlayer_avAudioPlayer), sel_setVolume_, v14);
  return (char *)objc_msgSend(*(id *)(*(void *)(v4 + 16) + OBJC_IVAR____TtC6DropIn11AudioPlayer_avAudioPlayer), sel_setAudioSession_, a1);
}

uint64_t sub_24D03CD74()
{
  *(void *)(v1 + 16) = v0;
  return MEMORY[0x270FA2498](sub_24D03CD94, 0, 0);
}

uint64_t sub_24D03CD94()
{
  OUTLINED_FUNCTION_9();
  if (qword_26984F480 != -1) {
    swift_once();
  }
  if ((byte_269851798 & 1) == 0)
  {
    uint64_t v1 = *((void *)v0 + 2);
    if ((objc_msgSend(*(id *)(*(void *)(v1 + 16) + OBJC_IVAR____TtC6DropIn11AudioPlayer_avAudioPlayer), sel_isPlaying) & 1) == 0)
    {
      uint64_t v2 = (double *)(*((void *)v0 + 2) + OBJC_IVAR____TtC6DropIn12DropInPlayer_settings);
      double v3 = *v2;
      v0[3] = *v2;
      double v4 = v2[1];
      v0[4] = v4;
      uint64_t v5 = LOBYTE(v3);
      uint64_t v6 = LOBYTE(v3) & 1;
      if (v5 == 2 || v6 != 0)
      {
        uint64_t v8 = *(void **)(v1 + 16);
        *((void *)v0 + 5) = v8;
        double v9 = v2[2];
        v8;
        uint64_t v10 = (void *)swift_task_alloc();
        *((void *)v0 + 6) = v10;
        *uint64_t v10 = v0;
        v10[1] = sub_24D03CF14;
        return sub_24D01D2FC(v9);
      }
      sub_24D03D170(v4);
    }
  }
  uint64_t v12 = (uint64_t (*)(void))*((void *)v0 + 1);
  return v12();
}

uint64_t sub_24D03CF14()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1();
  uint64_t v3 = v2;
  uint64_t v4 = *v1;
  OUTLINED_FUNCTION_6();
  *uint64_t v5 = v4;
  *(void *)(v3 + 56) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v6 = sub_24D03D070;
  }
  else
  {

    uint64_t v6 = sub_24D03D000;
  }
  return MEMORY[0x270FA2498](v6, 0, 0);
}

uint64_t sub_24D03D000()
{
  OUTLINED_FUNCTION_5();
  if (*(unsigned char *)(v0 + 24) != 2) {
    sub_24D03D170(*(double *)(v0 + 32));
  }
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24D03D070()
{
  OUTLINED_FUNCTION_5();

  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

void sub_24D03D0D0()
{
  if (qword_26984F480 != -1) {
    swift_once();
  }
  if ((byte_269851798 & 1) == 0)
  {
    objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC6DropIn12DropInPlayer_timer), sel_invalidate);
    sub_24D03CA74(0);
    uint64_t v1 = *(void **)(*(void *)(v0 + 16) + OBJC_IVAR____TtC6DropIn11AudioPlayer_avAudioPlayer);
    objc_msgSend(v1, sel_stop);
  }
}

uint64_t sub_24D03D170(double a1)
{
  uint64_t v2 = sub_24D044218();
  OUTLINED_FUNCTION_1_0();
  uint64_t v4 = v3;
  uint64_t v6 = MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v18 - v9;
  sub_24D044208();
  sub_24D0441E8();
  uint64_t v11 = *(void (**)(char *, uint64_t))(v4 + 8);
  v11(v8, v2);
  (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v8, v10, v2);
  uint64_t v12 = swift_allocObject();
  swift_weakInit();
  id v13 = objc_allocWithZone(MEMORY[0x263EFFA20]);
  id v14 = sub_24D03DF1C((uint64_t)v8, 1, (uint64_t)sub_24D03DF14, v12, a1);
  id v15 = v14;
  sub_24D03CA74((uint64_t)v14);
  id v16 = objc_msgSend(self, sel_mainRunLoop);
  objc_msgSend(v16, sel_addTimer_forMode_, v15, *MEMORY[0x263EFF478]);

  return ((uint64_t (*)(char *, uint64_t))v11)(v10, v2);
}

uint64_t sub_24D03D34C()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B184BF0);
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v2 = (char *)&v7 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v4 = result;
    uint64_t v5 = sub_24D044548();
    __swift_storeEnumTagSinglePayload((uint64_t)v2, 1, 1, v5);
    uint64_t v6 = (void *)swift_allocObject();
    _OWORD v6[2] = 0;
    v6[3] = 0;
    v6[4] = v4;
    sub_24D02A438();
    return swift_release();
  }
  return result;
}

uint64_t sub_24D03D440(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 16) = a1;
  *(void *)(v4 + 24) = a4;
  return MEMORY[0x270FA2498](sub_24D03D460, 0, 0);
}

uint64_t sub_24D03D460()
{
  OUTLINED_FUNCTION_9();
  uint64_t v1 = v0[3];
  uint64_t v2 = *(void **)(v1 + 16);
  v0[4] = v2;
  double v3 = *(double *)(v1 + OBJC_IVAR____TtC6DropIn12DropInPlayer_settings + 16);
  v2;
  uint64_t v4 = (void *)swift_task_alloc();
  v0[5] = v4;
  void *v4 = v0;
  v4[1] = sub_24D03D520;
  return sub_24D01D2FC(v3);
}

uint64_t sub_24D03D520()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1();
  double v3 = *(void **)(v2 + 32);
  uint64_t v4 = *v1;
  OUTLINED_FUNCTION_6();
  *uint64_t v5 = v4;
  *(void *)(v6 + 48) = v0;
  swift_task_dealloc();

  if (v0)
  {

    uint64_t v7 = sub_24D03E214;
  }
  else
  {
    uint64_t v7 = sub_24D03D624;
  }
  return MEMORY[0x270FA2498](v7, 0, 0);
}

uint64_t sub_24D03D624()
{
  **(unsigned char **)(v0 + 16) = *(void *)(v0 + 48) != 0;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t DropInPlayer.deinit()
{
  sub_24D021654(v0 + OBJC_IVAR____TtC6DropIn12DropInPlayer_settings);
  return v0;
}

uint64_t DropInPlayer.__deallocating_deinit()
{
  DropInPlayer.deinit();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x270FA0228](v0, v1, v2);
}

uint64_t sub_24D03D6E4()
{
  return type metadata accessor for DropInPlayer(0);
}

uint64_t type metadata accessor for DropInPlayer(uint64_t a1)
{
  return sub_24D03D70C(a1, (uint64_t *)&unk_26984FE60);
}

uint64_t sub_24D03D70C(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_24D03D740()
{
  uint64_t result = type metadata accessor for DropInPlayer.Settings(319);
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for DropInPlayer(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for DropInPlayer);
}

uint64_t dispatch thunk of DropInPlayer.start()()
{
  OUTLINED_FUNCTION_9();
  uint64_t v4 = (uint64_t (*)(void))(*(void *)(*(void *)v0 + 168) + **(int **)(*(void *)v0 + 168));
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_24D03210C;
  return v4();
}

uint64_t dispatch thunk of DropInPlayer.stop()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 176))();
}

uint64_t *initializeBufferWithCopyOfBuffer for DropInPlayer.Settings(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v11 = *a2;
    uint64_t *v4 = *a2;
    uint64_t v4 = (uint64_t *)(v11 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
    a1[2] = a2[2];
    uint64_t v7 = *(int *)(a3 + 24);
    uint64_t v8 = (char *)a1 + v7;
    uint64_t v9 = (char *)a2 + v7;
    uint64_t v10 = sub_24D0441A8();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
    *(_DWORD *)((char *)v4 + *(int *)(a3 + 28)) = *(_DWORD *)((char *)a2 + *(int *)(a3 + 28));
  }
  return v4;
}

uint64_t destroy for DropInPlayer.Settings(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a1 + *(int *)(a2 + 24);
  uint64_t v3 = sub_24D0441A8();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8);
  return v4(v2, v3);
}

uint64_t initializeWithCopy for DropInPlayer.Settings(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  uint64_t v6 = *(int *)(a3 + 24);
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = sub_24D0441A8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 16))(v7, v8, v9);
  *(_DWORD *)(a1 + *(int *)(a3 + 28)) = *(_DWORD *)(a2 + *(int *)(a3 + 28));
  return a1;
}

uint64_t assignWithCopy for DropInPlayer.Settings(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  uint64_t v6 = *(int *)(a3 + 24);
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = sub_24D0441A8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  *(_DWORD *)(a1 + *(int *)(a3 + 28)) = *(_DWORD *)(a2 + *(int *)(a3 + 28));
  return a1;
}

uint64_t initializeWithTake for DropInPlayer.Settings(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  uint64_t v6 = *(int *)(a3 + 24);
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = sub_24D0441A8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
  *(_DWORD *)(a1 + *(int *)(a3 + 28)) = *(_DWORD *)(a2 + *(int *)(a3 + 28));
  return a1;
}

uint64_t assignWithTake for DropInPlayer.Settings(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  uint64_t v6 = *(int *)(a3 + 24);
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = sub_24D0441A8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 40))(v7, v8, v9);
  *(_DWORD *)(a1 + *(int *)(a3 + 28)) = *(_DWORD *)(a2 + *(int *)(a3 + 28));
  return a1;
}

uint64_t getEnumTagSinglePayload for DropInPlayer.Settings(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24D03DD00);
}

uint64_t sub_24D03DD00(unsigned __int8 *a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 253)
  {
    unsigned int v4 = *a1;
    if (v4 >= 2) {
      int v5 = ((v4 + 2147483646) & 0x7FFFFFFF) - 1;
    }
    else {
      int v5 = -2;
    }
    if (v5 < 0) {
      int v5 = -1;
    }
    return (v5 + 1);
  }
  else
  {
    uint64_t v9 = sub_24D0441A8();
    uint64_t v10 = (uint64_t)&a1[*(int *)(a3 + 24)];
    return __swift_getEnumTagSinglePayload(v10, a2, v9);
  }
}

uint64_t storeEnumTagSinglePayload for DropInPlayer.Settings(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24D03DDB0);
}

unsigned char *sub_24D03DDB0(unsigned char *result, uint64_t a2, int a3, uint64_t a4)
{
  int v5 = result;
  if (a3 == 253)
  {
    *uint64_t result = a2 + 2;
  }
  else
  {
    uint64_t v7 = sub_24D0441A8();
    uint64_t v8 = (uint64_t)&v5[*(int *)(a4 + 24)];
    return (unsigned char *)__swift_storeEnumTagSinglePayload(v8, a2, a2, v7);
  }
  return result;
}

uint64_t sub_24D03DE2C()
{
  uint64_t result = sub_24D0441A8();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_24D03DEDC()
{
  swift_weakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_24D03DF14()
{
  return sub_24D03D34C();
}

id sub_24D03DF1C(uint64_t a1, char a2, uint64_t a3, uint64_t a4, double a5)
{
  uint64_t v6 = v5;
  uint64_t v12 = (void *)sub_24D0441D8();
  v17[4] = a3;
  v17[5] = a4;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 1107296256;
  v17[2] = sub_24D03E040;
  v17[3] = &block_descriptor_8;
  id v13 = _Block_copy(v17);
  id v14 = objc_msgSend(v6, sel_initWithFireDate_interval_repeats_block_, v12, a2 & 1, v13, a5);
  _Block_release(v13);

  uint64_t v15 = sub_24D044218();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v15 - 8) + 8))(a1, v15);
  swift_release();
  return v14;
}

void sub_24D03E040(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

uint64_t block_copy_helper_3(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_3()
{
  return swift_release();
}

uint64_t sub_24D03E0C0()
{
  swift_unknownObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_24D03E100()
{
  OUTLINED_FUNCTION_9();
  uint64_t v3 = v2;
  uint64_t v4 = v0[2];
  uint64_t v5 = v0[3];
  uint64_t v6 = v0[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v7;
  *uint64_t v7 = v1;
  v7[1] = sub_24D03210C;
  return sub_24D03D440(v3, v4, v5, v6);
}

uint64_t sub_24D03E1B0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for DropInPlayer.Settings(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void Feature.domain.getter()
{
}

void Feature.feature.getter()
{
}

uint64_t Feature.isEnabled.getter()
{
  uint64_t v3 = &type metadata for Feature;
  unint64_t v4 = sub_24D03E280();
  char v0 = sub_24D044268();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v2);
  return v0 & 1;
}

unint64_t sub_24D03E280()
{
  unint64_t result = qword_26B184B10;
  if (!qword_26B184B10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B184B10);
  }
  return result;
}

uint64_t static Feature.== infix(_:_:)()
{
  return 1;
}

uint64_t Feature.hash(into:)()
{
  return sub_24D044988();
}

uint64_t Feature.hashValue.getter()
{
  return sub_24D044998();
}

uint64_t sub_24D03E340()
{
  return Feature.hashValue.getter();
}

uint64_t sub_24D03E358()
{
  return Feature.hash(into:)();
}

unint64_t sub_24D03E374()
{
  unint64_t result = qword_26984FE98;
  if (!qword_26984FE98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26984FE98);
  }
  return result;
}

const char *sub_24D03E3C0()
{
  return "DropIn";
}

const char *sub_24D03E3D4()
{
  return "Server";
}

unsigned char *storeEnumTagSinglePayload for Feature(unsigned char *result, int a2, int a3)
{
  if ((a3 + 1) >= 0x10000) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) < 0x100) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2)
  {
    switch(v5)
    {
      case 1:
        *unint64_t result = a2;
        return result;
      case 2:
        *(_WORD *)unint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)unint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *unint64_t result = 0;
      break;
    case 2:
      *(_WORD *)unint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x24D03E484);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for Feature()
{
  return &type metadata for Feature;
}

uint64_t DropInUser.givenName.getter()
{
  return OUTLINED_FUNCTION_0_5();
}

uint64_t DropInUser.familyName.getter()
{
  return OUTLINED_FUNCTION_0_5();
}

uint64_t DropInUser.displayName.getter()
{
  return OUTLINED_FUNCTION_0_5();
}

uint64_t DropInUser.imageData.getter()
{
  uint64_t v0 = OUTLINED_FUNCTION_0_5();
  sub_24D03E578(v0, v1);
  return OUTLINED_FUNCTION_0_5();
}

uint64_t sub_24D03E578(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_24D0378D8(a1, a2);
  }
  return a1;
}

uint64_t DropInUser.handleValue.getter()
{
  return OUTLINED_FUNCTION_0_5();
}

uint64_t DropInUser.handleType.getter()
{
  return *(void *)(v0 + 80);
}

double DropInUser.init()@<D0>(uint64_t a1@<X8>)
{
  *(void *)(a1 + 48) = 0;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)a1 = 0u;
  double result = -3.10503618e231;
  *(_OWORD *)(a1 + 56) = xmmword_24D047150;
  *(void *)(a1 + 72) = 0xE000000000000000;
  *(void *)(a1 + 80) = 0;
  return result;
}

__n128 DropInUser.init(handleValue:handleType:givenName:familyName:displayName:imageData:)@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, __n128 a10, uint64_t a11)
{
  __n128 result = a10;
  *(void *)a9 = a4;
  *(void *)(a9 + 8) = a5;
  *(void *)(a9 + 16) = a6;
  *(void *)(a9 + 24) = a7;
  *(void *)(a9 + 32) = a8;
  *(__n128 *)(a9 + 40) = a10;
  *(void *)(a9 + 56) = a11;
  *(void *)(a9 + 64) = a1;
  *(void *)(a9 + 72) = a2;
  *(void *)(a9 + 80) = a3;
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for DropInUser(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for DropInUser(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  unint64_t v2 = *(void *)(a1 + 56);
  if (v2 >> 60 != 15) {
    sub_24D02FEF4(*(void *)(a1 + 48), v2);
  }
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for DropInUser(uint64_t a1, void *a2)
{
  uint64_t v4 = a2[1];
  *(void *)a1 = *a2;
  *(void *)(a1 + 8) = v4;
  uint64_t v5 = a2[3];
  *(void *)(a1 + 16) = a2[2];
  *(void *)(a1 + 24) = v5;
  uint64_t v6 = a2[5];
  *(void *)(a1 + 32) = a2[4];
  *(void *)(a1 + 40) = v6;
  uint64_t v7 = a2 + 6;
  unint64_t v8 = a2[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v8 >> 60 == 15)
  {
    *(_OWORD *)(a1 + 48) = *(_OWORD *)v7;
  }
  else
  {
    uint64_t v9 = *v7;
    sub_24D0378D8(*v7, v8);
    *(void *)(a1 + 48) = v9;
    *(void *)(a1 + 56) = v8;
  }
  uint64_t v10 = a2[9];
  *(void *)(a1 + 64) = a2[8];
  *(void *)(a1 + 72) = v10;
  *(void *)(a1 + 80) = a2[10];
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for DropInUser(void *a1, void *a2)
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
  uint64_t v4 = a2 + 6;
  unint64_t v5 = a2[7];
  if (a1[7] >> 60 != 15)
  {
    if (v5 >> 60 != 15)
    {
      uint64_t v7 = *v4;
      sub_24D0378D8(*v4, a2[7]);
      uint64_t v8 = a1[6];
      unint64_t v9 = a1[7];
      a1[6] = v7;
      a1[7] = v5;
      sub_24D02FEF4(v8, v9);
      goto LABEL_8;
    }
    sub_24D03E890((uint64_t)(a1 + 6));
    goto LABEL_6;
  }
  if (v5 >> 60 == 15)
  {
LABEL_6:
    *((_OWORD *)a1 + 3) = *(_OWORD *)v4;
    goto LABEL_8;
  }
  uint64_t v6 = *v4;
  sub_24D0378D8(*v4, a2[7]);
  a1[6] = v6;
  a1[7] = v5;
LABEL_8:
  a1[8] = a2[8];
  a1[9] = a2[9];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[10] = a2[10];
  return a1;
}

uint64_t sub_24D03E890(uint64_t a1)
{
  return a1;
}

void *__swift_memcpy88_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x58uLL);
}

void *assignWithTake for DropInUser(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = a2[5];
  a1[4] = a2[4];
  a1[5] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = a2 + 6;
  unint64_t v8 = a1[7];
  if (v8 >> 60 != 15)
  {
    unint64_t v9 = a2[7];
    if (v9 >> 60 != 15)
    {
      uint64_t v10 = a1[6];
      a1[6] = *v7;
      a1[7] = v9;
      sub_24D02FEF4(v10, v8);
      goto LABEL_6;
    }
    sub_24D03E890((uint64_t)(a1 + 6));
  }
  *((_OWORD *)a1 + 3) = *(_OWORD *)v7;
LABEL_6:
  uint64_t v11 = a2[9];
  a1[8] = a2[8];
  a1[9] = v11;
  swift_bridgeObjectRelease();
  a1[10] = a2[10];
  return a1;
}

uint64_t getEnumTagSinglePayload for DropInUser(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 88))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 72);
      if (v2 >= 0xFFFFFFFF) {
        LODWORD(v2) = -1;
      }
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for DropInUser(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 88) = 1;
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
      *(void *)(result + 72) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 88) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for DropInUser()
{
  return &type metadata for DropInUser;
}

uint64_t OUTLINED_FUNCTION_0_5()
{
  return v0;
}

uint64_t ClientContext.homeIdentifier.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_24D03EFD0(v1 + OBJC_IVAR___DIClientContext_homeIdentifier, a1, (uint64_t *)&unk_26B184D80);
}

id ClientContext.__allocating_init(homeIdentifier:)(uint64_t a1)
{
  id v3 = objc_allocWithZone(v1);
  sub_24D03EFD0(a1, (uint64_t)v3 + OBJC_IVAR___DIClientContext_homeIdentifier, (uint64_t *)&unk_26B184D80);
  v6.receiver = v3;
  v6.super_class = v1;
  id v4 = objc_msgSendSuper2(&v6, sel_init);
  sub_24D021ED8(a1, (uint64_t *)&unk_26B184D80);
  return v4;
}

id ClientContext.init(homeIdentifier:)(uint64_t a1)
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  sub_24D03EFD0(a1, (uint64_t)v1 + OBJC_IVAR___DIClientContext_homeIdentifier, (uint64_t *)&unk_26B184D80);
  v6.receiver = v1;
  v6.super_class = ObjectType;
  id v4 = objc_msgSendSuper2(&v6, sel_init);
  sub_24D021ED8(a1, (uint64_t *)&unk_26B184D80);
  return v4;
}

uint64_t ClientContext.isEqual(_:)(uint64_t a1)
{
  id v3 = v1;
  swift_getObjectType();
  uint64_t v5 = sub_24D044258();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_24();
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B184D80);
  MEMORY[0x270FA5388](v7 - 8);
  unint64_t v9 = (char *)&v29 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26984FEA8);
  OUTLINED_FUNCTION_14();
  MEMORY[0x270FA5388](v11);
  id v13 = (char *)&v29 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24D03EFD0(a1, (uint64_t)v31, &qword_26B184A70);
  if (v32)
  {
    if (OUTLINED_FUNCTION_0_6())
    {
      id v14 = v13;
      uint64_t v15 = v9;
      uint64_t v16 = v2;
      uint64_t v17 = v5;
      uint64_t v18 = v6;
      id v19 = v30;

      BOOL v27 = v19 == v3;
      uint64_t v6 = v18;
      uint64_t v5 = v17;
      uint64_t v2 = v16;
      unint64_t v9 = v15;
      id v13 = v14;
      if (v27) {
        goto LABEL_5;
      }
    }
  }
  else
  {
    sub_24D021ED8((uint64_t)v31, &qword_26B184A70);
  }
  sub_24D03EFD0(a1, (uint64_t)v31, &qword_26B184A70);
  if (!v32) {
    goto LABEL_16;
  }
  if ((OUTLINED_FUNCTION_0_6() & 1) == 0)
  {
LABEL_18:
    char v20 = 0;
    return v20 & 1;
  }

  sub_24D03EFD0(a1, (uint64_t)v31, &qword_26B184A70);
  if (!v32)
  {
LABEL_16:
    uint64_t v24 = &qword_26B184A70;
    uint64_t v25 = v31;
LABEL_17:
    sub_24D021ED8((uint64_t)v25, v24);
    goto LABEL_18;
  }
  if ((OUTLINED_FUNCTION_0_6() & 1) == 0) {
    goto LABEL_18;
  }
  id v21 = v30;
  uint64_t v22 = (uint64_t)v3 + OBJC_IVAR___DIClientContext_homeIdentifier;
  uint64_t v23 = (uint64_t)&v13[*(int *)(v10 + 48)];
  sub_24D03EFD0((uint64_t)v30 + OBJC_IVAR___DIClientContext_homeIdentifier, (uint64_t)v13, (uint64_t *)&unk_26B184D80);
  sub_24D03EFD0(v22, v23, (uint64_t *)&unk_26B184D80);
  OUTLINED_FUNCTION_4_5((uint64_t)v13);
  if (!v27)
  {
    sub_24D03EFD0((uint64_t)v13, (uint64_t)v9, (uint64_t *)&unk_26B184D80);
    OUTLINED_FUNCTION_4_5(v23);
    if (!v27)
    {
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 32))(v2, v23, v5);
      sub_24D03F02C();
      char v20 = sub_24D0443E8();

      id v28 = *(void (**)(uint64_t, uint64_t))(v6 + 8);
      v28(v2, v5);
      v28((uint64_t)v9, v5);
      sub_24D021ED8((uint64_t)v13, (uint64_t *)&unk_26B184D80);
      return v20 & 1;
    }

    (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
    goto LABEL_23;
  }

  OUTLINED_FUNCTION_4_5(v23);
  if (!v27)
  {
LABEL_23:
    uint64_t v24 = (uint64_t *)&unk_26984FEA8;
    uint64_t v25 = v13;
    goto LABEL_17;
  }
  sub_24D021ED8((uint64_t)v13, (uint64_t *)&unk_26B184D80);
LABEL_5:
  char v20 = 1;
  return v20 & 1;
}

uint64_t sub_24D03EFD0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(a3);
  OUTLINED_FUNCTION_14();
  (*(void (**)(uint64_t, uint64_t))(v5 + 16))(a2, a1);
  return a2;
}

unint64_t sub_24D03F02C()
{
  unint64_t result = qword_26984FEB8;
  if (!qword_26984FEB8)
  {
    sub_24D044258();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26984FEB8);
  }
  return result;
}

unint64_t ClientContext.description.getter()
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B184D80);
  OUTLINED_FUNCTION_14();
  MEMORY[0x270FA5388](v2);
  OUTLINED_FUNCTION_3_3();
  sub_24D0447D8();
  swift_bridgeObjectRelease();
  sub_24D03EFD0(v0 + OBJC_IVAR___DIClientContext_homeIdentifier, v1, (uint64_t *)&unk_26B184D80);
  sub_24D044438();
  sub_24D044458();
  swift_bridgeObjectRelease();
  return 0xD000000000000011;
}

uint64_t static ClientContext.supportsSecureCoding.getter()
{
  return 1;
}

Swift::Void __swiftcall ClientContext.encode(with:)(NSCoder with)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B184D80);
  MEMORY[0x270FA5388](v4 - 8);
  OUTLINED_FUNCTION_3_3();
  sub_24D03EFD0(v1 + OBJC_IVAR___DIClientContext_homeIdentifier, v2, (uint64_t *)&unk_26B184D80);
  uint64_t v5 = sub_24D044258();
  uint64_t v6 = 0;
  if (__swift_getEnumTagSinglePayload(v2, 1, v5) != 1)
  {
    uint64_t v6 = (void *)sub_24D044228();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v2, v5);
  }
  uint64_t v7 = (void *)sub_24D0443F8();
  [(objc_class *)with.super.isa encodeObject:v6 forKey:v7];
}

id ClientContext.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return ClientContext.init(coder:)(a1);
}

id ClientContext.init(coder:)(void *a1)
{
  id v3 = v1;
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B184D80);
  MEMORY[0x270FA5388](v6 - 8);
  OUTLINED_FUNCTION_24();
  sub_24D03F540();
  id v7 = v3;
  uint64_t v8 = sub_24D044738();
  if (v8)
  {
    unint64_t v9 = (void *)v8;
    sub_24D044238();

    uint64_t v10 = sub_24D044258();
    uint64_t v11 = 0;
  }
  else
  {
    uint64_t v10 = sub_24D044258();
    uint64_t v11 = 1;
  }
  __swift_storeEnumTagSinglePayload(v2, v11, 1, v10);
  sub_24D03F580(v2, (uint64_t)v7 + OBJC_IVAR___DIClientContext_homeIdentifier);

  v14.receiver = v7;
  v14.super_class = ObjectType;
  id v12 = objc_msgSendSuper2(&v14, sel_init);

  return v12;
}

unint64_t sub_24D03F540()
{
  unint64_t result = qword_26B184D60;
  if (!qword_26B184D60)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26B184D60);
  }
  return result;
}

uint64_t sub_24D03F580(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B184D80);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

id ClientContext.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void ClientContext.init()()
{
}

id ClientContext.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_24D03F6E8()
{
  return type metadata accessor for ClientContext();
}

uint64_t type metadata accessor for ClientContext()
{
  uint64_t result = qword_26B184DA0;
  if (!qword_26B184DA0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_24D03F738()
{
  sub_24D03F808();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

uint64_t method lookup function for ClientContext(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for ClientContext);
}

uint64_t dispatch thunk of ClientContext.__allocating_init(homeIdentifier:)()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t dispatch thunk of ClientContext.__allocating_init(coder:)()
{
  return (*(uint64_t (**)(void))(v0 + 96))();
}

void sub_24D03F808()
{
  if (!qword_26B184D90)
  {
    sub_24D044258();
    unint64_t v0 = sub_24D044758();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26B184D90);
    }
  }
}

uint64_t OUTLINED_FUNCTION_0_6()
{
  return swift_dynamicCast();
}

uint64_t OUTLINED_FUNCTION_4_5(uint64_t a1)
{
  return __swift_getEnumTagSinglePayload(a1, 1, v1);
}

NSObject *OneshotTimer.__allocating_init(timeInterval:queue:identifier:label:timerFiredHandler:)(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, double a7)
{
  id v15 = objc_allocWithZone(v7);
  return OneshotTimer.init(timeInterval:queue:identifier:label:timerFiredHandler:)(a1, a2, a3, a4, a5, a6, a7);
}

uint64_t sub_24D03F9A8()
{
  return 0;
}

NSObject *OneshotTimer.init(timeInterval:queue:identifier:label:timerFiredHandler:)(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, double a7)
{
  uint64_t v85 = a6;
  uint64_t v76 = a5;
  uint64_t v72 = a4;
  uint64_t v71 = a3;
  id v86 = a1;
  uint64_t v87 = a2;
  sub_24D044318();
  OUTLINED_FUNCTION_1_0();
  uint64_t v79 = v11;
  uint64_t v80 = v10;
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_7_3(v12);
  uint64_t v78 = sub_24D044358();
  OUTLINED_FUNCTION_1_0();
  uint64_t v77 = v13;
  MEMORY[0x270FA5388](v14);
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_7_3(v15);
  uint64_t v75 = sub_24D044308();
  OUTLINED_FUNCTION_1_0();
  uint64_t v74 = v16;
  MEMORY[0x270FA5388](v17);
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_7_3(v18);
  uint64_t v88 = sub_24D044388();
  OUTLINED_FUNCTION_1_0();
  uint64_t v70 = v19;
  uint64_t v21 = MEMORY[0x270FA5388](v20);
  uint64_t v83 = (char *)&v68 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = MEMORY[0x270FA5388](v21);
  uint64_t v69 = (char *)&v68 - v24;
  MEMORY[0x270FA5388](v23);
  uint64_t v84 = (char *)&v68 - v25;
  uint64_t v68 = sub_24D044298();
  OUTLINED_FUNCTION_1_0();
  uint64_t v27 = v26;
  MEMORY[0x270FA5388](v28);
  OUTLINED_FUNCTION_4_6();
  uint64_t v29 = sub_24D0446C8();
  OUTLINED_FUNCTION_1_0();
  uint64_t v31 = v30;
  MEMORY[0x270FA5388](v32);
  uint64_t v34 = (char *)&v68 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24D0403FC();
  aBlock[0] = MEMORY[0x263F8EE78];
  sub_24D041498(&qword_26984FFA0, MEMORY[0x263F8F148]);
  os_log_type_t v35 = v7;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26984FFA8);
  sub_24D02581C(&qword_26984FFB0, &qword_26984FFA8);
  sub_24D044798();
  uint64_t v36 = sub_24D0446D8();
  (*(void (**)(char *, uint64_t))(v31 + 8))(v34, v29);
  *(void *)&v35[OBJC_IVAR___DIOneshotTimer_timer] = v36;
  uint64_t v37 = &v35[OBJC_IVAR___DIOneshotTimer_label];
  uint64_t v38 = v72;
  *(void *)uint64_t v37 = v71;
  *((void *)v37 + 1) = v38;
  uint64_t v39 = &v35[OBJC_IVAR___DIOneshotTimer_identifier];
  uint64_t v40 = sub_24D044258();
  uint64_t v81 = *(void *)(v40 - 8);
  uint64_t v82 = v40;
  (*(void (**)(char *, uint64_t))(v81 + 16))(v39, v87);
  *(double *)&v35[OBJC_IVAR___DIOneshotTimer_timeInterval] = a7;
  swift_bridgeObjectRetain();
  sub_24D044288();
  (*(void (**)(char *, uint64_t, uint64_t))(v27 + 32))(&v35[OBJC_IVAR___DIOneshotTimer_logger], v8, v68);
  uint64_t v41 = v84;
  sub_24D044368();
  uint64_t v42 = v69;
  MEMORY[0x25331B9B0](v41, a7);
  uint64_t v43 = v70;
  uint64_t v44 = v88;
  v70[4](&v35[OBJC_IVAR___DIOneshotTimer_deadline], v42, v88);

  os_log_t v45 = (objc_class *)type metadata accessor for OneshotTimer();
  v90.receiver = v35;
  v90.super_class = v45;
  uint64_t v46 = (char *)objc_msgSendSuper2(&v90, sel_init);
  uint64_t v47 = OBJC_IVAR___DIOneshotTimer_timer;
  uint64_t ObjectType = swift_getObjectType();
  os_log_type_t v49 = &v46[OBJC_IVAR___DIOneshotTimer_deadline];
  uint64_t v50 = v73;
  sub_24D040484(v73);
  uint64_t v51 = v46;
  MEMORY[0x25331BD30](v49, v50, ObjectType, INFINITY);
  OUTLINED_FUNCTION_11_0();
  v52();
  uint64_t v75 = (uint64_t)v46;
  uint64_t v74 = v47;
  swift_getObjectType();
  uint64_t v53 = swift_allocObject();
  swift_unknownObjectWeakInit();
  unint64_t v54 = (void *)swift_allocObject();
  uint64_t v55 = v76;
  v54[2] = v53;
  v54[3] = v55;
  v54[4] = v85;
  aBlock[4] = sub_24D040788;
  aBlock[5] = v54;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_24D025B94;
  aBlock[3] = &block_descriptor_9;
  unint64_t v56 = _Block_copy(aBlock);
  swift_retain();
  swift_retain();
  sub_24D044338();
  sub_24D0407AC();
  sub_24D0446F8();
  _Block_release(v56);
  OUTLINED_FUNCTION_11_0();
  v57();
  OUTLINED_FUNCTION_11_0();
  v58();
  swift_release();
  swift_release();
  v43[2](v83, v41, v44);
  uint64_t v59 = v51;
  uint64_t v60 = sub_24D044278();
  os_log_type_t v61 = sub_24D044618();
  if (os_log_type_enabled(v60, v61))
  {
    uint64_t v62 = swift_slowAlloc();
    uint64_t v63 = (void *)OUTLINED_FUNCTION_34();
    uint64_t v80 = v63;
    *(_DWORD *)uint64_t v62 = 138412546;
    aBlock[0] = v59;
    uint64_t v43 = v59;
    sub_24D044768();
    *uint64_t v63 = v59;

    *(_WORD *)(v62 + 12) = 2048;
    uint64_t v64 = v83;
    uint64_t v65 = sub_24D044378();
    OUTLINED_FUNCTION_8_4();
    ((void (*)(char *, uint64_t))v43)(v64, v88);
    aBlock[0] = v65;
    sub_24D044768();
    _os_log_impl(&dword_24D00D000, v60, v61, "Timer created: %@, Now = %llu", (uint8_t *)v62, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26984F7C0);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_7();
    OUTLINED_FUNCTION_7();
  }
  else
  {
    OUTLINED_FUNCTION_8_4();
    ((void (*)(char *, uint64_t))v43)(v83, v88);

    uint64_t v60 = v59;
  }

  swift_getObjectType();
  sub_24D044718();
  swift_release();

  OUTLINED_FUNCTION_11_0();
  v66();
  ((void (*)(char *, uint64_t))v43)(v84, v88);
  return v59;
}

unint64_t sub_24D0403FC()
{
  unint64_t result = qword_26984FF98;
  if (!qword_26984FF98)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26984FF98);
  }
  return result;
}

uint64_t type metadata accessor for OneshotTimer()
{
  uint64_t result = qword_26984FFC8;
  if (!qword_26984FFC8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_24D040484@<X0>(void *a1@<X8>)
{
  *a1 = 0;
  uint64_t v2 = *MEMORY[0x263F8EFE0];
  uint64_t v3 = sub_24D044308();
  uint64_t v4 = *(uint64_t (**)(void *, uint64_t, uint64_t))(*(void *)(v3 - 8) + 104);
  return v4(a1, v2, v3);
}

uint64_t sub_24D0404FC()
{
  swift_unknownObjectWeakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_24D040534(uint64_t a1, void (*a2)(void, void, void, double))
{
  uint64_t v3 = a1 + 16;
  swift_beginAccess();
  uint64_t v4 = MEMORY[0x25331C870](v3);
  if (v4)
  {
    uint64_t v5 = (void *)v4;
    if (sub_24D0410CC())
    {
    }
    else
    {
      uint64_t v6 = v5;
      id v7 = sub_24D044278();
      os_log_type_t v8 = sub_24D044618();
      if (os_log_type_enabled(v7, v8))
      {
        uint64_t v17 = a2;
        unint64_t v9 = (uint8_t *)swift_slowAlloc();
        uint64_t v10 = (void *)swift_slowAlloc();
        *(_DWORD *)unint64_t v9 = 138412290;
        uint64_t v11 = v6;
        sub_24D044768();
        *uint64_t v10 = v5;

        _os_log_impl(&dword_24D00D000, v7, v8, "Timer fired: %@", v9, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&qword_26984F7C0);
        swift_arrayDestroy();
        MEMORY[0x25331C7C0](v10, -1, -1);
        uint64_t v12 = v9;
        a2 = v17;
        MEMORY[0x25331C7C0](v12, -1, -1);
      }
      else
      {
      }
      sub_24D040E04();
      uint64_t v13 = *(void *)&v6[OBJC_IVAR___DIOneshotTimer_label];
      uint64_t v14 = *(void *)&v6[OBJC_IVAR___DIOneshotTimer_label + 8];
      uint64_t v15 = &v6[OBJC_IVAR___DIOneshotTimer_identifier];
      double v16 = *(double *)&v6[OBJC_IVAR___DIOneshotTimer_timeInterval];
      swift_bridgeObjectRetain();
      a2(v13, v14, v15, v16);

      swift_bridgeObjectRelease();
    }
  }
}

uint64_t sub_24D040748()
{
  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

void sub_24D040788()
{
  sub_24D040534(*(void *)(v0 + 16), *(void (**)(void, void, void, double))(v0 + 24));
}

uint64_t block_copy_helper_4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_4()
{
  return swift_release();
}

uint64_t sub_24D0407AC()
{
  return sub_24D044798();
}

void sub_24D040988(double a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v7 = (void *)sub_24D0443F8();
  id v8 = (id)sub_24D044228();
  (*(void (**)(uint64_t, void *, id, double))(a5 + 16))(a5, v7, v8, a1);
}

id OneshotTimer.__deallocating_deinit()
{
  uint64_t v2 = sub_24D044318();
  OUTLINED_FUNCTION_1_0();
  uint64_t v4 = v3;
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_4_6();
  uint64_t v6 = sub_24D044358();
  OUTLINED_FUNCTION_1_0();
  uint64_t v8 = v7;
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getObjectType();
  aBlock[4] = nullsub_1;
  aBlock[5] = 0;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_24D025B94;
  aBlock[3] = &block_descriptor_6;
  uint64_t v12 = _Block_copy(aBlock);
  sub_24D044338();
  sub_24D0407AC();
  sub_24D0446F8();
  _Block_release(v12);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v1, v2);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v6);
  sub_24D040E04();
  uint64_t v13 = v0;
  uint64_t v14 = sub_24D044278();
  os_log_type_t v15 = sub_24D044618();
  if (os_log_type_enabled(v14, v15))
  {
    double v16 = (uint8_t *)swift_slowAlloc();
    uint64_t v17 = (void *)OUTLINED_FUNCTION_34();
    *(_DWORD *)double v16 = 138412290;
    aBlock[0] = v13;
    uint64_t v18 = v13;
    sub_24D044768();
    void *v17 = v13;

    _os_log_impl(&dword_24D00D000, v14, v15, "Timer destroyed %@", v16, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26984F7C0);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_7();
    OUTLINED_FUNCTION_7();
  }
  else
  {

    uint64_t v14 = v13;
  }

  id v19 = (objc_class *)type metadata accessor for OneshotTimer();
  v21.receiver = v13;
  v21.super_class = v19;
  return objc_msgSendSuper2(&v21, sel_dealloc);
}

void sub_24D040E04()
{
  uint64_t v1 = v0;
  swift_getObjectType();
  uint64_t v2 = &off_24D046000;
  if (sub_24D0446E8())
  {
    id v3 = v0;
    uint64_t v4 = sub_24D044278();
    os_log_type_t v5 = sub_24D0445E8();
    if (os_log_type_enabled(v4, v5))
    {
      log = v4;
      uint64_t v6 = (uint8_t *)swift_slowAlloc();
      uint64_t v14 = (void *)OUTLINED_FUNCTION_34();
      *(_DWORD *)uint64_t v6 = 138412290;
      id v7 = v3;
      uint64_t v2 = &off_24D046000;
      sub_24D044768();
      *uint64_t v14 = v3;

      uint64_t v4 = log;
      _os_log_impl(&dword_24D00D000, log, v5, "Timer is already canceled %@", v6, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26984F7C0);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_7();
      OUTLINED_FUNCTION_7();
    }
    else
    {
    }
  }
  sub_24D044708();
  id v8 = v1;
  uint64_t v9 = sub_24D044278();
  os_log_type_t v10 = sub_24D044618();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    uint64_t v12 = (void *)OUTLINED_FUNCTION_34();
    *(_DWORD *)uint64_t v11 = *((void *)v2 + 26);
    id v13 = v8;
    sub_24D044768();
    void *v12 = v8;

    _os_log_impl(&dword_24D00D000, v9, v10, "Timer cancelled %@", v11, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26984F7C0);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_7();
    OUTLINED_FUNCTION_7();
  }
  else
  {
  }
}

uint64_t sub_24D0410CC()
{
  swift_getObjectType();
  char v1 = sub_24D0446E8();
  id v2 = v0;
  id v3 = sub_24D044278();
  os_log_type_t v4 = sub_24D044618();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = swift_slowAlloc();
    uint64_t v6 = (void *)OUTLINED_FUNCTION_34();
    *(_DWORD *)uint64_t v5 = 67109378;
    sub_24D044768();
    *(_WORD *)(v5 + 8) = 2112;
    id v7 = v2;
    sub_24D044768();
    *uint64_t v6 = v2;

    _os_log_impl(&dword_24D00D000, v3, v4, "Timer isCancelled: %{BOOL}d, %@", (uint8_t *)v5, 0x12u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26984F7C0);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_7();
    OUTLINED_FUNCTION_7();
  }
  else
  {
  }
  return v1 & 1;
}

id OneshotTimer.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void OneshotTimer.init()()
{
}

uint64_t sub_24D0412C8()
{
  return type metadata accessor for OneshotTimer();
}

uint64_t sub_24D0412D0()
{
  uint64_t result = sub_24D044258();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_24D044388();
    if (v2 <= 0x3F)
    {
      uint64_t result = sub_24D044298();
      if (v3 <= 0x3F) {
        return swift_updateClassMetadata2();
      }
    }
  }
  return result;
}

uint64_t method lookup function for OneshotTimer(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for OneshotTimer);
}

uint64_t dispatch thunk of OneshotTimer.__allocating_init(timeInterval:queue:identifier:label:timerFiredHandler:)()
{
  return (*(uint64_t (**)(void))(v0 + 128))();
}

uint64_t dispatch thunk of OneshotTimer.cancelTimer()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x88))();
}

uint64_t sub_24D041458()
{
  _Block_release(*(const void **)(v0 + 16));
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_24D041490(uint64_t a1, uint64_t a2, uint64_t a3, double a4)
{
  sub_24D040988(a4, a1, a2, a3, *(void *)(v4 + 16));
}

uint64_t sub_24D041498(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t OUTLINED_FUNCTION_4_6()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_7_3@<X0>(uint64_t a1@<X8>)
{
  *(void *)(v1 - 256) = a1;
  return 0;
}

uint64_t static ToneProvider.startToneURL.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_24D0415A0(0x74536E49706F7244, 0xEF656E6F54747261, a1);
}

uint64_t static ToneProvider.ongoingToneURL.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_24D0415A0(0xD000000000000011, 0x800000024D049400, a1);
}

uint64_t static ToneProvider.endToneURL.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_24D0415A0(0x6E456E49706F7244, 0xED0000656E6F5464, a1);
}

uint64_t sub_24D0415A0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  if (qword_26984F4B0 != -1) {
    swift_once();
  }
  id v6 = sub_24D0416C0(a1, a2, 7758199, 0xE300000000000000, (void *)qword_26984FFD8);
  if (v6)
  {
    id v7 = v6;
    sub_24D044198();

    uint64_t v8 = 0;
  }
  else
  {
    uint64_t v8 = 1;
  }
  uint64_t v9 = sub_24D0441A8();
  return __swift_storeEnumTagSinglePayload(a3, v8, 1, v9);
}

id sub_24D041668()
{
  sub_24D041764();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id result = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  qword_26984FFD8 = (uint64_t)result;
  return result;
}

id sub_24D0416C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = (void *)sub_24D0443F8();
  swift_bridgeObjectRelease();
  id v7 = (void *)sub_24D0443F8();
  swift_bridgeObjectRelease();
  id v8 = objc_msgSend(a5, sel_URLForResource_withExtension_, v6, v7);

  return v8;
}

ValueMetadata *type metadata accessor for ToneProvider()
{
  return &type metadata for ToneProvider;
}

unint64_t sub_24D041764()
{
  unint64_t result = qword_26984FFE0;
  if (!qword_26984FFE0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26984FFE0);
  }
  return result;
}

id sub_24D0417A4()
{
  if (qword_26B184BC8 != -1) {
    swift_once();
  }
  uint64_t v0 = qword_26B184A58;
  uint64_t v1 = unk_26B184A60;
  id v2 = objc_allocWithZone(MEMORY[0x263EFFA40]);
  swift_bridgeObjectRetain();
  id result = sub_24D04402C(v0, v1);
  qword_26B184A50 = (uint64_t)result;
  return result;
}

uint64_t dropInUserDefaults.getter()
{
  if (qword_26B184A88 != -1) {
    swift_once();
  }
  uint64_t v0 = qword_26B184A50;
  id v1 = (id)qword_26B184A50;
  return v0;
}

id Default.userDefaults.getter()
{
  id v1 = *v0;
  id v2 = *v0;
  return v1;
}

uint64_t Default.key.getter()
{
  uint64_t v1 = *(void *)(v0 + 8);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t Default.defaultValue.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(a1 + 16) - 8) + 16))(a2, v2 + *(int *)(a1 + 32));
}

uint64_t Default.localizedDescription.getter(uint64_t a1)
{
  uint64_t v2 = *(void *)(v1 + *(int *)(a1 + 36));
  swift_bridgeObjectRetain();
  return v2;
}

void sub_24D041968()
{
  swift_getWitnessTable();
  swift_getWitnessTable();
  swift_getWitnessTable();
  UserDefaultsAccessible<>.description.getter();
}

id sub_24D041A0C()
{
  qword_269850000 = 0x407E000000000000;
  if (qword_26B184A88 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)qword_26B184A50;
  qword_26984FFE8 = qword_26B184A50;
  unk_26984FFF0 = 0xD00000000000001ALL;
  qword_26984FFF8 = 0x800000024D049E10;
  qword_269850008 = 0xD000000000000028;
  unk_269850010 = 0x800000024D049E30;
  return v0;
}

uint64_t static Defaults.dropInAvailabilityDuration.getter()
{
  if (qword_26984F4C0 != -1) {
    swift_once();
  }
  OUTLINED_FUNCTION_0_7((long long *)&qword_26984FFE8);
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

id sub_24D041B34()
{
  qword_269850030 = 0x403E000000000000;
  if (qword_26B184A88 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)qword_26B184A50;
  qword_269850018 = qword_26B184A50;
  unk_269850020 = 0xD000000000000022;
  qword_269850028 = 0x800000024D049D80;
  qword_269850038 = 0xD000000000000055;
  unk_269850040 = 0x800000024D049DB0;
  return v0;
}

uint64_t static Defaults.dropInSessionAutoAnswerWaitTimeout.getter()
{
  if (qword_26984F4C8 != -1) {
    swift_once();
  }
  OUTLINED_FUNCTION_0_7((long long *)&qword_269850018);
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

id sub_24D041C5C()
{
  qword_269850060 = 0x404E000000000000;
  if (qword_26B184A88 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)qword_26B184A50;
  qword_269850048 = qword_26B184A50;
  unk_269850050 = 0xD000000000000019;
  qword_269850058 = 0x800000024D049D10;
  qword_269850068 = 0xD000000000000049;
  unk_269850070 = 0x800000024D049D30;
  return v0;
}

uint64_t static Defaults.dropInSessionStartTimeout.getter()
{
  if (qword_26984F4D0 != -1) {
    swift_once();
  }
  OUTLINED_FUNCTION_0_7((long long *)&qword_269850048);
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

id sub_24D041D84()
{
  qword_269850090 = 0x407E000000000000;
  if (qword_26B184A88 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)qword_26B184A50;
  qword_269850078 = qword_26B184A50;
  unk_269850080 = 0xD000000000000017;
  qword_269850088 = 0x800000024D049CC0;
  qword_269850098 = 0xD000000000000026;
  unk_2698500A0 = 0x800000024D049CE0;
  return v0;
}

uint64_t static Defaults.pseudonymExpiryDuration.getter()
{
  if (qword_26984F4D8 != -1) {
    swift_once();
  }
  OUTLINED_FUNCTION_0_7((long long *)&qword_269850078);
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

id sub_24D041EAC()
{
  qword_2698500C0 = 0x40AC200000000000;
  if (qword_26B184A88 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)qword_26B184A50;
  qword_2698500A8 = qword_26B184A50;
  unk_2698500B0 = 0xD000000000000023;
  qword_2698500B8 = 0x800000024D049C50;
  qword_2698500C8 = 0xD000000000000033;
  unk_2698500D0 = 0x800000024D049C80;
  return v0;
}

uint64_t static Defaults.pregeneratedPseudonymExpiryDuration.getter()
{
  if (qword_26984F4E0 != -1) {
    swift_once();
  }
  OUTLINED_FUNCTION_0_7((long long *)&qword_2698500A8);
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

id sub_24D041FD8()
{
  qword_2698500F0 = 0x4082C00000000000;
  if (qword_26B184A88 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)qword_26B184A50;
  qword_2698500D8 = qword_26B184A50;
  unk_2698500E0 = 0xD000000000000023;
  qword_2698500E8 = 0x800000024D049B50;
  qword_2698500F8 = 0xD0000000000000C7;
  unk_269850100 = 0x800000024D049B80;
  return v0;
}

uint64_t static Defaults.pregeneratedPseudonymRenewThreshold.getter()
{
  if (qword_26984F4E8 != -1) {
    swift_once();
  }
  OUTLINED_FUNCTION_0_7((long long *)&qword_2698500D8);
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

id sub_24D042104()
{
  qword_269850120 = 0x407DF00000000000;
  if (qword_26B184A88 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)qword_26B184A50;
  qword_269850108 = qword_26B184A50;
  unk_269850110 = 0xD000000000000018;
  qword_269850118 = 0x800000024D049B00;
  qword_269850128 = 0xD000000000000027;
  unk_269850130 = 0x800000024D049B20;
  return v0;
}

uint64_t static Defaults.dropInSessionMaxDuration.getter()
{
  if (qword_26984F4F0 != -1) {
    swift_once();
  }
  OUTLINED_FUNCTION_0_7((long long *)&qword_269850108);
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

id sub_24D042230()
{
  qword_269850150 = 0x404E000000000000;
  if (qword_26B184A88 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)qword_26B184A50;
  qword_269850138 = qword_26B184A50;
  unk_269850140 = 0xD000000000000013;
  qword_269850148 = 0x800000024D049AB0;
  qword_269850158 = 0xD00000000000002FLL;
  unk_269850160 = 0x800000024D049AD0;
  return v0;
}

uint64_t static Defaults.idsSendEventTimeout.getter()
{
  if (qword_26984F4F8 != -1) {
    swift_once();
  }
  OUTLINED_FUNCTION_0_7((long long *)&qword_269850138);
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

id sub_24D042358()
{
  qword_269850180 = 0x404E000000000000;
  if (qword_26B184A88 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)qword_26B184A50;
  qword_269850168 = qword_26B184A50;
  unk_269850170 = 0xD000000000000015;
  qword_269850178 = 0x800000024D049A60;
  qword_269850188 = 0xD000000000000027;
  unk_269850190 = 0x800000024D049A80;
  return v0;
}

uint64_t static Defaults.idsSendRequestTimeout.getter()
{
  if (qword_26984F500 != -1) {
    swift_once();
  }
  OUTLINED_FUNCTION_0_7((long long *)&qword_269850168);
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

id sub_24D042480()
{
  qword_2698501B0 = 0x404E000000000000;
  if (qword_26B184A88 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)qword_26B184A50;
  qword_269850198 = qword_26B184A50;
  unk_2698501A0 = 0xD000000000000016;
  qword_2698501A8 = 0x800000024D049A10;
  qword_2698501B8 = 0xD000000000000028;
  unk_2698501C0 = 0x800000024D049A30;
  return v0;
}

uint64_t static Defaults.idsSendResponseTimeout.getter()
{
  if (qword_26984F508 != -1) {
    swift_once();
  }
  OUTLINED_FUNCTION_0_7((long long *)&qword_269850198);
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

id sub_24D0425A8()
{
  qword_2698501E0 = 0x404E000000000000;
  if (qword_26B184A88 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)qword_26B184A50;
  qword_2698501C8 = qword_26B184A50;
  unk_2698501D0 = 0xD000000000000016;
  qword_2698501D8 = 0x800000024D0499A0;
  qword_2698501E8 = 0xD000000000000045;
  unk_2698501F0 = 0x800000024D0499C0;
  return v0;
}

uint64_t static Defaults.idsResponseWaitTimeout.getter()
{
  if (qword_26984F510 != -1) {
    swift_once();
  }
  OUTLINED_FUNCTION_0_7((long long *)&qword_2698501C8);
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

id sub_24D0426D0()
{
  qword_269850210 = 0x404E000000000000;
  if (qword_26B184A88 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)qword_26B184A50;
  qword_2698501F8 = qword_26B184A50;
  unk_269850200 = 0xD000000000000017;
  qword_269850208 = 0x800000024D049940;
  qword_269850218 = 0xD000000000000033;
  unk_269850220 = 0x800000024D049960;
  return v0;
}

uint64_t static Defaults.rapportSendEventTimeout.getter()
{
  if (qword_26984F518 != -1) {
    swift_once();
  }
  OUTLINED_FUNCTION_0_7((long long *)&qword_2698501F8);
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

id sub_24D0427F8()
{
  qword_269850240 = 0x404E000000000000;
  if (qword_26B184A88 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)qword_26B184A50;
  qword_269850228 = qword_26B184A50;
  unk_269850230 = 0xD000000000000028;
  qword_269850238 = 0x800000024D0498D0;
  qword_269850248 = 0xD00000000000003DLL;
  unk_269850250 = 0x800000024D049900;
  return v0;
}

uint64_t static Defaults.rapportSendRequestAndResponseWaitTimeout.getter()
{
  if (qword_26984F520 != -1) {
    swift_once();
  }
  OUTLINED_FUNCTION_0_7((long long *)&qword_269850228);
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

id sub_24D042924()
{
  qword_269850270 = 0x404E000000000000;
  if (qword_26B184A88 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)qword_26B184A50;
  qword_269850258 = qword_26B184A50;
  unk_269850260 = 0xD00000000000001ALL;
  qword_269850268 = 0x800000024D049880;
  qword_269850278 = 0xD00000000000002CLL;
  unk_269850280 = 0x800000024D0498A0;
  return v0;
}

uint64_t static Defaults.rapportSendResponseTimeout.getter()
{
  if (qword_26984F528 != -1) {
    swift_once();
  }
  OUTLINED_FUNCTION_0_7((long long *)&qword_269850258);
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

id sub_24D042A4C()
{
  qword_2698502A0 = 0x403E000000000000;
  if (qword_26B184A88 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)qword_26B184A50;
  qword_269850288 = qword_26B184A50;
  unk_269850290 = 0xD000000000000025;
  qword_269850298 = 0x800000024D049810;
  qword_2698502A8 = 0xD00000000000003DLL;
  unk_2698502B0 = 0x800000024D049840;
  return v0;
}

uint64_t static Defaults.startDropInRequestResponseWaitTimeout.getter()
{
  if (qword_26984F530 != -1) {
    swift_once();
  }
  OUTLINED_FUNCTION_0_7((long long *)&qword_269850288);
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

id sub_24D042B74()
{
  byte_2698502D0 = 0;
  if (qword_26B184A88 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)qword_26B184A50;
  qword_2698502B8 = qword_26B184A50;
  unk_2698502C0 = 0xD000000000000014;
  qword_2698502C8 = 0x800000024D0497B0;
  qword_2698502D8 = 0xD000000000000037;
  unk_2698502E0 = 0x800000024D0497D0;
  return v0;
}

uint64_t static Defaults.dropInAnytimeEnabled.getter()
{
  if (qword_26984F538 != -1) {
    swift_once();
  }
  OUTLINED_FUNCTION_1_6((long long *)&qword_2698502B8);
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

id sub_24D042C9C()
{
  byte_269850300 = 0;
  if (qword_26B184A88 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)qword_26B184A50;
  qword_2698502E8 = qword_26B184A50;
  unk_2698502F0 = 0xD000000000000016;
  qword_2698502F8 = 0x800000024D049740;
  qword_269850308 = 0xD000000000000045;
  unk_269850310 = 0x800000024D049760;
  return v0;
}

uint64_t static Defaults.multiUserDropInEnabled.getter()
{
  if (qword_26984F540 != -1) {
    swift_once();
  }
  OUTLINED_FUNCTION_1_6((long long *)&qword_2698502E8);
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

id sub_24D042DC0()
{
  byte_26B184D18 = 0;
  if (qword_26B184A88 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)qword_26B184A50;
  qword_26B184D00 = qword_26B184A50;
  *(void *)algn_26B184D08 = 0xD000000000000023;
  qword_26B184D10 = 0x800000024D0496D0;
  qword_26B184D20 = 0xD000000000000030;
  unk_26B184D28 = 0x800000024D049700;
  return v0;
}

uint64_t static Defaults.forceDropInAccessAllowedForAllUsers.getter()
{
  if (qword_26B184D38 != -1) {
    swift_once();
  }
  OUTLINED_FUNCTION_1_6((long long *)&qword_26B184D00);
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

id sub_24D042EE4()
{
  qword_26B184B30 = 0x403E000000000000;
  if (qword_26B184A88 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)qword_26B184A50;
  qword_26B184B18 = qword_26B184A50;
  unk_26B184B20 = 0xD00000000000002CLL;
  qword_26B184B28 = 0x800000024D049630;
  qword_26B184B38 = 0xD00000000000006ELL;
  unk_26B184B40 = 0x800000024D049660;
  return v0;
}

uint64_t static Defaults.dropInAvailableBroadcastThrottleTimeInterval.getter()
{
  if (qword_26B184B50 != -1) {
    swift_once();
  }
  OUTLINED_FUNCTION_0_7((long long *)&qword_26B184B18);
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

id sub_24D043010()
{
  qword_26B184B70 = 0x4051800000000000;
  if (qword_26B184A88 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)qword_26B184A50;
  qword_26B184B58 = qword_26B184A50;
  unk_26B184B60 = 0xD000000000000014;
  qword_26B184B68 = 0x800000024D0495B0;
  qword_26B184B78 = 0xD000000000000059;
  unk_26B184B80 = 0x800000024D0495D0;
  return v0;
}

uint64_t static Defaults.messageDedupeTimeout.getter()
{
  if (qword_26B184B88 != -1) {
    swift_once();
  }
  OUTLINED_FUNCTION_0_7((long long *)&qword_26B184B58);
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

id sub_24D04313C()
{
  byte_26B184BA8 = 1;
  if (qword_26B184A88 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)qword_26B184A50;
  qword_26B184B90 = qword_26B184A50;
  *(void *)algn_26B184B98 = 0xD000000000000026;
  qword_26B184BA0 = 0x800000024D0494F0;
  qword_26B184BB0 = 0xD00000000000008BLL;
  unk_26B184BB8 = 0x800000024D049520;
  return v0;
}

uint64_t static Defaults.specifyBundleIDForConversationProvider.getter()
{
  if (qword_26B184BC0 != -1) {
    swift_once();
  }
  OUTLINED_FUNCTION_1_6((long long *)&qword_26B184B90);
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

id sub_24D043264()
{
  dword_269850330 = 1059145646;
  if (qword_26B184A88 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)qword_26B184A50;
  *(void *)&xmmword_269850318 = qword_26B184A50;
  *((void *)&xmmword_269850318 + 1) = 0x6C6143656E6F6870;
  qword_269850328 = 0xEF656D756C6F566CLL;
  qword_269850338 = 0xD000000000000045;
  unk_269850340 = 0x800000024D0494A0;
  return v0;
}

uint64_t static Defaults.phoneCallVolume.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_26984F548 != -1) {
    swift_once();
  }
  uint64_t v2 = qword_269850328;
  int v3 = dword_269850330;
  uint64_t v4 = qword_269850338;
  uint64_t v5 = unk_269850340;
  id v6 = (void *)xmmword_269850318;
  *(_OWORD *)a1 = xmmword_269850318;
  *(void *)(a1 + 16) = v2;
  *(_DWORD *)(a1 + 24) = v3;
  *(void *)(a1 + 32) = v4;
  *(void *)(a1 + 40) = v5;
  id v7 = v6;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

id sub_24D0433C0()
{
  byte_269850360 = 0;
  if (qword_26B184A88 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)qword_26B184A50;
  qword_269850348 = qword_26B184A50;
  strcpy(byte_269850350, "mockAudioPower");
  HIBYTE(qword_269850358) = -18;
  qword_269850368 = 0xD00000000000001DLL;
  unk_269850370 = 0x800000024D049480;
  return v0;
}

uint64_t static Defaults.mockAudioPower.getter()
{
  if (qword_26984F550 != -1) {
    swift_once();
  }
  OUTLINED_FUNCTION_1_6((long long *)&qword_269850348);
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

id sub_24D0434F0()
{
  byte_269850390 = 1;
  if (qword_26B184A88 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)qword_26B184A50;
  qword_269850378 = qword_26B184A50;
  unk_269850380 = 0xD000000000000019;
  qword_269850388 = 0x800000024D049420;
  qword_269850398 = 0xD000000000000034;
  unk_2698503A0 = 0x800000024D049440;
  return v0;
}

uint64_t static Defaults.launchCheckInLiveActivity.getter()
{
  if (qword_26984F558 != -1) {
    swift_once();
  }
  OUTLINED_FUNCTION_1_6((long long *)&qword_269850378);
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t sub_24D043618(uint64_t a1)
{
  uint64_t result = swift_getWitnessTable();
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_24D043654(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 24);
}

uint64_t sub_24D04365C()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

void **sub_24D043700(void **a1, void **a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a3 + 16);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(_DWORD *)(v5 + 80);
  uint64_t v7 = *(void *)(v5 + 64) + 7;
  int v8 = *(_DWORD *)(v5 + 80) & 0x100000;
  uint64_t v9 = (char *)*a2;
  *a1 = *a2;
  if (v6 > 7 || v8 != 0 || ((v7 + ((v6 + 24) & ~v6)) & 0xFFFFFFFFFFFFFFF8) + 16 > 0x18)
  {
    a1 = (void **)&v9[(v6 & 0xF8 ^ 0x1F8) & (v6 + 16)];
    swift_retain();
  }
  else
  {
    uint64_t v12 = (void *)(((unint64_t)a1 + 15) & 0xFFFFFFFFFFFFFFF8);
    id v13 = (void *)(((unint64_t)a2 + 15) & 0xFFFFFFFFFFFFFFF8);
    void *v12 = *v13;
    v12[1] = v13[1];
    uint64_t v14 = ((unint64_t)v12 + v6 + 16) & ~v6;
    uint64_t v15 = ((unint64_t)v13 + v6 + 16) & ~v6;
    double v16 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
    uint64_t v17 = v9;
    swift_bridgeObjectRetain();
    v16(v14, v15, v4);
    uint64_t v18 = (void *)((v7 + v14) & 0xFFFFFFFFFFFFFFF8);
    id v19 = (void *)((v7 + v15) & 0xFFFFFFFFFFFFFFF8);
    *uint64_t v18 = *v19;
    v18[1] = v19[1];
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_24D043864(id *a1, uint64_t a2)
{
  unint64_t v3 = (unint64_t)a1 + 15;

  swift_bridgeObjectRelease();
  (*(void (**)(unint64_t))(*(void *)(*(void *)(a2 + 16) - 8) + 8))(((v3 & 0xFFFFFFFFFFFFFFF8)
                                                                                            + *(unsigned __int8 *)(*(void *)(*(void *)(a2 + 16) - 8) + 80)
                                                                                            + 16) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(*(void *)(a2 + 16) - 8) + 80));
  return swift_bridgeObjectRelease();
}

void **sub_24D043908(void **a1, void **a2, uint64_t a3)
{
  uint64_t v4 = *a2;
  *a1 = *a2;
  uint64_t v5 = (void *)(((unint64_t)a1 + 15) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v6 = (void *)(((unint64_t)a2 + 15) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v5 = *v6;
  v5[1] = v6[1];
  uint64_t v7 = *(void *)(a3 + 16);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16);
  uint64_t v10 = v8 + 16;
  uint64_t v11 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v12 = ((unint64_t)v5 + v11 + 16) & ~v11;
  uint64_t v13 = ((unint64_t)v6 + v11 + 16) & ~v11;
  id v14 = v4;
  swift_bridgeObjectRetain();
  v9(v12, v13, v7);
  uint64_t v15 = *(void *)(v10 + 48) + 7;
  double v16 = (void *)((v15 + v12) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v17 = (void *)((v15 + v13) & 0xFFFFFFFFFFFFFFF8);
  void *v16 = *v17;
  v16[1] = v17[1];
  swift_bridgeObjectRetain();
  return a1;
}

void **sub_24D0439F0(void **a1, void **a2, uint64_t a3)
{
  unint64_t v6 = (unint64_t)a2 + 15;
  uint64_t v5 = *a2;
  uint64_t v7 = *a1;
  *a1 = *a2;
  unint64_t v8 = (unint64_t)a1 + 15;
  id v9 = v5;

  uint64_t v10 = (void *)(v8 & 0xFFFFFFFFFFFFFFF8);
  unint64_t v11 = v6 & 0xFFFFFFFFFFFFFFF8;
  *uint64_t v10 = *(void *)(v6 & 0xFFFFFFFFFFFFFFF8);
  v10[1] = *(void *)((v6 & 0xFFFFFFFFFFFFFFF8) + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v12 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v13 = v12 + 24;
  uint64_t v14 = *(unsigned __int8 *)(v12 + 80);
  uint64_t v15 = ((unint64_t)v10 + v14 + 16) & ~v14;
  unint64_t v16 = (v14 + 16 + (v6 & 0xFFFFFFFFFFFFFFF8)) & ~v14;
  (*(void (**)(uint64_t, unint64_t))(v12 + 24))(v15, (v14 + 16 + v11) & ~v14);
  uint64_t v17 = *(void *)(v13 + 40) + 7;
  uint64_t v18 = (void *)((v17 + v15) & 0xFFFFFFFFFFFFFFF8);
  id v19 = (void *)((v17 + v16) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v18 = *v19;
  v18[1] = v19[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *sub_24D043AF0(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = (_OWORD *)(((unint64_t)a1 + 15) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v5 = (_OWORD *)(((unint64_t)a2 + 15) & 0xFFFFFFFFFFFFFFF8);
  _OWORD *v4 = *v5;
  uint64_t v6 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v7 = v6 + 32;
  uint64_t v8 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v9 = ((unint64_t)v4 + v8 + 16) & ~v8;
  uint64_t v10 = ((unint64_t)v5 + v8 + 16) & ~v8;
  (*(void (**)(uint64_t, uint64_t))(v6 + 32))(v9, v10);
  *(_OWORD *)((*(void *)(v7 + 32) + 7 + v9) & 0xFFFFFFFFFFFFFFF8) = *(_OWORD *)((*(void *)(v7 + 32) + 7 + v10) & 0xFFFFFFFFFFFFFFF8);
  return a1;
}

void **sub_24D043BA4(void **a1, void **a2, uint64_t a3)
{
  unint64_t v5 = (unint64_t)a2 + 15;
  uint64_t v6 = *a1;
  *a1 = *a2;
  unint64_t v7 = (unint64_t)a1 + 15;

  v7 &= 0xFFFFFFFFFFFFFFF8;
  v5 &= 0xFFFFFFFFFFFFFFF8;
  *(void *)unint64_t v7 = *(void *)v5;
  *(void *)(v7 + 8) = *(void *)(v5 + 8);
  swift_bridgeObjectRelease();
  uint64_t v8 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v9 = v8 + 40;
  uint64_t v10 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v11 = (v10 + 16 + v7) & ~v10;
  uint64_t v12 = (v10 + 16 + v5) & ~v10;
  (*(void (**)(uint64_t, uint64_t))(v8 + 40))(v11, v12);
  uint64_t v13 = *(void *)(v9 + 24) + 7;
  uint64_t v14 = (void *)((v13 + v11) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v15 = (void *)((v13 + v12) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v14 = *v15;
  v14[1] = v15[1];
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_24D043C90(_DWORD *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a3 + 16);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(unsigned int *)(v5 + 84);
  uint64_t v7 = *(unsigned __int8 *)(v5 + 80);
  if (v6 <= 0x7FFFFFFF) {
    unsigned int v8 = 0x7FFFFFFF;
  }
  else {
    unsigned int v8 = *(_DWORD *)(v5 + 84);
  }
  if (!a2) {
    return 0;
  }
  if (v8 < a2)
  {
    unint64_t v9 = ((*(void *)(*(void *)(v4 - 8) + 64) + ((v7 + 24) & ~v7) + 7) & 0xFFFFFFFFFFFFFFF8) + 16;
    unsigned int v10 = a2 - v8;
    uint64_t v11 = v9 & 0xFFFFFFF8;
    if ((v9 & 0xFFFFFFF8) != 0) {
      unsigned int v12 = 2;
    }
    else {
      unsigned int v12 = v10 + 1;
    }
    if (v12 >= 0x10000) {
      unsigned int v13 = 4;
    }
    else {
      unsigned int v13 = 2;
    }
    if (v12 < 0x100) {
      unsigned int v13 = 1;
    }
    if (v12 >= 2) {
      uint64_t v14 = v13;
    }
    else {
      uint64_t v14 = 0;
    }
    switch(v14)
    {
      case 1:
        int v15 = *((unsigned __int8 *)a1 + v9);
        if (!v15) {
          break;
        }
        goto LABEL_22;
      case 2:
        int v15 = *(unsigned __int16 *)((char *)a1 + v9);
        if (v15) {
          goto LABEL_22;
        }
        break;
      case 3:
        __break(1u);
        JUMPOUT(0x24D043DE0);
      case 4:
        int v15 = *(_DWORD *)((char *)a1 + v9);
        if (!v15) {
          break;
        }
LABEL_22:
        int v17 = v15 - 1;
        if (v11)
        {
          int v17 = 0;
          LODWORD(v11) = *a1;
        }
        return v8 + (v11 | v17) + 1;
      default:
        break;
    }
  }
  unint64_t v18 = ((unint64_t)a1 + 15) & 0xFFFFFFFFFFFFFFF8;
  if ((v6 & 0x80000000) != 0) {
    return __swift_getEnumTagSinglePayload((v18 + v7 + 16) & ~v7, v6, v4);
  }
  unint64_t v19 = *(void *)(v18 + 8);
  if (v19 >= 0xFFFFFFFF) {
    LODWORD(v19) = -1;
  }
  return (v19 + 1);
}

void sub_24D043DF4(char *a1, uint64_t a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(a4 + 16);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(unsigned int *)(v7 + 84);
  if (v8 <= 0x7FFFFFFF) {
    unsigned int v9 = 0x7FFFFFFF;
  }
  else {
    unsigned int v9 = *(_DWORD *)(v7 + 84);
  }
  uint64_t v10 = *(unsigned __int8 *)(v7 + 80);
  size_t v11 = ((*(void *)(*(void *)(v6 - 8) + 64) + ((v10 + 24) & ~v10) + 7) & 0xFFFFFFFFFFFFFFF8) + 16;
  if (v9 >= a3)
  {
    int v15 = 0;
  }
  else
  {
    unsigned int v12 = a3 - v9;
    if (((*(_DWORD *)(*(void *)(v6 - 8) + 64) + ((v10 + 24) & ~v10) + 7) & 0xFFFFFFF8) == 0xFFFFFFF0) {
      unsigned int v13 = v12 + 1;
    }
    else {
      unsigned int v13 = 2;
    }
    if (v13 >= 0x10000) {
      int v14 = 4;
    }
    else {
      int v14 = 2;
    }
    if (v13 < 0x100) {
      int v14 = 1;
    }
    if (v13 >= 2) {
      int v15 = v14;
    }
    else {
      int v15 = 0;
    }
  }
  if (a2 > v9)
  {
    if (((*(_DWORD *)(*(void *)(v6 - 8) + 64) + ((v10 + 24) & ~v10) + 7) & 0xFFFFFFF8) == 0xFFFFFFF0) {
      int v16 = a2 - v9;
    }
    else {
      int v16 = 1;
    }
    if (((*(_DWORD *)(*(void *)(v6 - 8) + 64) + ((v10 + 24) & ~v10) + 7) & 0xFFFFFFF8) != 0xFFFFFFF0)
    {
      int v17 = ~v9 + a2;
      bzero(a1, v11);
      *(_DWORD *)a1 = v17;
    }
    switch(v15)
    {
      case 1:
        a1[v11] = v16;
        return;
      case 2:
        *(_WORD *)&a1[v11] = v16;
        return;
      case 3:
        goto LABEL_42;
      case 4:
        *(_DWORD *)&a1[v11] = v16;
        return;
      default:
        return;
    }
  }
  switch(v15)
  {
    case 1:
      a1[v11] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_32;
    case 2:
      *(_WORD *)&a1[v11] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_32;
    case 3:
LABEL_42:
      __break(1u);
      JUMPOUT(0x24D043FDCLL);
    case 4:
      *(_DWORD *)&a1[v11] = 0;
      goto LABEL_31;
    default:
LABEL_31:
      if (a2)
      {
LABEL_32:
        unint64_t v18 = (void *)((unint64_t)(a1 + 15) & 0xFFFFFFFFFFFFFFF8);
        if ((v8 & 0x80000000) != 0)
        {
          __swift_storeEnumTagSinglePayload(((unint64_t)v18 + v10 + 16) & ~v10, a2, v8, v6);
        }
        else if ((a2 & 0x80000000) != 0)
        {
          *unint64_t v18 = a2 ^ 0x80000000;
          v18[1] = 0;
        }
        else
        {
          v18[1] = (a2 - 1);
        }
      }
      return;
  }
}

uint64_t type metadata accessor for Default()
{
  return __swift_instantiateGenericMetadata();
}

ValueMetadata *type metadata accessor for Defaults()
{
  return &type metadata for Defaults;
}

id sub_24D04402C(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    unint64_t v3 = (void *)sub_24D0443F8();
    swift_bridgeObjectRelease();
  }
  else
  {
    unint64_t v3 = 0;
  }
  id v4 = objc_msgSend(v2, sel_initWithSuiteName_, v3);

  return v4;
}

uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
}

id OUTLINED_FUNCTION_0_7@<X0>(long long *a1@<X8>)
{
  uint64_t v3 = *((void *)a1 + 2);
  uint64_t v4 = *((void *)a1 + 3);
  uint64_t v5 = *((void *)a1 + 4);
  uint64_t v6 = *((void *)a1 + 5);
  long long v7 = *a1;
  *(_OWORD *)uint64_t v1 = *a1;
  *(void *)(v1 + 16) = v3;
  *(void *)(v1 + 24) = v4;
  *(void *)(v1 + 32) = v5;
  *(void *)(v1 + 40) = v6;
  return (id)v7;
}

id OUTLINED_FUNCTION_1_6@<X0>(long long *a1@<X8>)
{
  uint64_t v3 = *((void *)a1 + 2);
  char v4 = *((unsigned char *)a1 + 24);
  uint64_t v5 = *((void *)a1 + 4);
  uint64_t v6 = *((void *)a1 + 5);
  long long v7 = *a1;
  *(_OWORD *)uint64_t v1 = *a1;
  *(void *)(v1 + 16) = v3;
  *(unsigned char *)(v1 + 24) = v4;
  *(void *)(v1 + 32) = v5;
  *(void *)(v1 + 40) = v6;
  return (id)v7;
}

uint64_t sub_24D044128()
{
  return MEMORY[0x270EEE378]();
}

uint64_t sub_24D044138()
{
  return MEMORY[0x270EEE3A8]();
}

uint64_t sub_24D044148()
{
  return MEMORY[0x270EEE3B8]();
}

uint64_t sub_24D044158()
{
  return MEMORY[0x270EEE3D0]();
}

uint64_t sub_24D044168()
{
  return MEMORY[0x270EEF830]();
}

uint64_t sub_24D044178()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_24D044188()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_24D044198()
{
  return MEMORY[0x270EEFE20]();
}

uint64_t sub_24D0441A8()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_24D0441B8()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_24D0441C8()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_24D0441D8()
{
  return MEMORY[0x270EF0998]();
}

uint64_t sub_24D0441E8()
{
  return MEMORY[0x270EF09C0]();
}

uint64_t sub_24D0441F8()
{
  return MEMORY[0x270EF0BA8]();
}

uint64_t sub_24D044208()
{
  return MEMORY[0x270EF0BB8]();
}

uint64_t sub_24D044218()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_24D044228()
{
  return MEMORY[0x270EF0C88]();
}

uint64_t sub_24D044238()
{
  return MEMORY[0x270EF0CB8]();
}

uint64_t sub_24D044248()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_24D044258()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_24D044268()
{
  return MEMORY[0x270F28690]();
}

uint64_t sub_24D044278()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_24D044288()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_24D044298()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_24D0442A8()
{
  return MEMORY[0x270EE3BA8]();
}

uint64_t sub_24D0442B8()
{
  return MEMORY[0x270EE3C88]();
}

uint64_t sub_24D0442C8()
{
  return MEMORY[0x270EE3C98]();
}

uint64_t sub_24D0442D8()
{
  return MEMORY[0x270EE3CB8]();
}

uint64_t sub_24D0442E8()
{
  return MEMORY[0x270EE3E98]();
}

uint64_t sub_24D0442F8()
{
  return MEMORY[0x270EE3FA0]();
}

uint64_t sub_24D044308()
{
  return MEMORY[0x270FA0970]();
}

uint64_t sub_24D044318()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_24D044328()
{
  return MEMORY[0x270FA09D0]();
}

uint64_t sub_24D044338()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_24D044348()
{
  return MEMORY[0x270FA0A00]();
}

uint64_t sub_24D044358()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_24D044368()
{
  return MEMORY[0x270FA0AC0]();
}

uint64_t sub_24D044378()
{
  return MEMORY[0x270FA0AE8]();
}

uint64_t sub_24D044388()
{
  return MEMORY[0x270FA0B00]();
}

uint64_t sub_24D044398()
{
  return MEMORY[0x270FA0BA8]();
}

uint64_t sub_24D0443A8()
{
  return MEMORY[0x270FA0BC8]();
}

uint64_t sub_24D0443B8()
{
  return MEMORY[0x270FA0BF0]();
}

uint64_t sub_24D0443C8()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_24D0443D8()
{
  return MEMORY[0x270F9D0A8]();
}

uint64_t sub_24D0443E8()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_24D0443F8()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_24D044408()
{
  return MEMORY[0x270EF19C8]();
}

uint64_t sub_24D044418()
{
  return MEMORY[0x270EF19E0]();
}

uint64_t sub_24D044428()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_24D044438()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_24D044448()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_24D044458()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_24D044468()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_24D044478()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_24D044488()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_24D044498()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_24D0444A8()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t sub_24D0444B8()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_24D0444D8()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_24D0444E8()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_24D0444F8()
{
  return MEMORY[0x270FA1E18]();
}

uint64_t sub_24D044508()
{
  return MEMORY[0x270FA1E20]();
}

uint64_t sub_24D044528()
{
  return MEMORY[0x270FA1EF0]();
}

uint64_t sub_24D044538()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_24D044548()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_24D044568()
{
  return MEMORY[0x270FA20D8]();
}

uint64_t sub_24D044578()
{
  return MEMORY[0x270FA20E0]();
}

uint64_t sub_24D044588()
{
  return MEMORY[0x270FA2120]();
}

uint64_t sub_24D044598()
{
  return MEMORY[0x270F9DD78]();
}

uint64_t sub_24D0445A8()
{
  return MEMORY[0x270F9DDA0]();
}

uint64_t sub_24D0445B8()
{
  return MEMORY[0x270F9DDB0]();
}

uint64_t sub_24D0445C8()
{
  return MEMORY[0x270EF1C98]();
}

uint64_t sub_24D0445D8()
{
  return MEMORY[0x270EF1CB8]();
}

uint64_t sub_24D0445E8()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_24D0445F8()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_24D044608()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_24D044618()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_24D044628()
{
  return MEMORY[0x270EF1F18]();
}

uint64_t sub_24D044638()
{
  return MEMORY[0x270EF1F90]();
}

uint64_t sub_24D044648()
{
  return MEMORY[0x270FA0C50]();
}

uint64_t sub_24D044658()
{
  return MEMORY[0x270FA0D00]();
}

uint64_t sub_24D044668()
{
  return MEMORY[0x270FA0D20]();
}

uint64_t sub_24D044678()
{
  return MEMORY[0x270FA0D50]();
}

uint64_t sub_24D044688()
{
  return MEMORY[0x270FA0D70]();
}

uint64_t sub_24D044698()
{
  return MEMORY[0x270FA0DA0]();
}

uint64_t sub_24D0446A8()
{
  return MEMORY[0x270FA0DB8]();
}

uint64_t sub_24D0446B8()
{
  return MEMORY[0x270FA0DD0]();
}

uint64_t sub_24D0446C8()
{
  return MEMORY[0x270FA0DE8]();
}

uint64_t sub_24D0446D8()
{
  return MEMORY[0x270FA0E28]();
}

uint64_t sub_24D0446E8()
{
  return MEMORY[0x270FA0E90]();
}

uint64_t sub_24D0446F8()
{
  return MEMORY[0x270FA0EA0]();
}

uint64_t sub_24D044708()
{
  return MEMORY[0x270FA0EC0]();
}

uint64_t sub_24D044718()
{
  return MEMORY[0x270FA0EE0]();
}

uint64_t sub_24D044728()
{
  return MEMORY[0x270FA0F68]();
}

uint64_t sub_24D044738()
{
  return MEMORY[0x270EF20F8]();
}

uint64_t sub_24D044748()
{
  return MEMORY[0x270FA1180]();
}

uint64_t sub_24D044758()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_24D044768()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_24D044778()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_24D044788()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_24D044798()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_24D0447A8()
{
  return MEMORY[0x270F9E8C0]();
}

uint64_t sub_24D0447B8()
{
  return MEMORY[0x270F9E8C8]();
}

uint64_t sub_24D0447C8()
{
  return MEMORY[0x270F9E8E8]();
}

uint64_t sub_24D0447D8()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_24D0447E8()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_24D0447F8()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_24D044808()
{
  return MEMORY[0x270F9EA48]();
}

uint64_t sub_24D044818()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_24D044838()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_24D044848()
{
  return MEMORY[0x270F9EF08]();
}

uint64_t sub_24D044858()
{
  return MEMORY[0x270F9EF20]();
}

uint64_t sub_24D044868()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_24D044878()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_24D044888()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_24D044898()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_24D0448B8()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_24D0448C8()
{
  return MEMORY[0x270F9F770]();
}

uint64_t sub_24D0448D8()
{
  return MEMORY[0x270F9F7C0]();
}

uint64_t sub_24D0448E8()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_24D044908()
{
  return MEMORY[0x270F9FA88]();
}

uint64_t sub_24D044918()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_24D044928()
{
  return MEMORY[0x270EF2680]();
}

uint64_t sub_24D044938()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_24D044948()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_24D044958()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_24D044968()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_24D044978()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_24D044988()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_24D044998()
{
  return MEMORY[0x270F9FC90]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
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

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x270FA0158]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

void free(void *a1)
{
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x270EDA328](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x270EDA378](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x270EDA770](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
}

uint64_t self
{
  return MEMORY[0x270F9A730]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x270F9AA18](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x270F9AA20](obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t swift_allocError()
{
  return MEMORY[0x270FA0190]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x270FA01C0]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x270FA01E0]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x270FA01F0]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x270FA0200]();
}

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x270FA0208]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x270FA23F8]();
}

uint64_t swift_continuation_throwingResume()
{
  return MEMORY[0x270FA2408]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x270FA0240]();
}

uint64_t swift_defaultActor_destroy()
{
  return MEMORY[0x270FA2420]();
}

uint64_t swift_defaultActor_initialize()
{
  return MEMORY[0x270FA2428]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x270FA02C0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x270FA02D0]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x270FA0300]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x270FA0348]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x270FA03B0]();
}

uint64_t swift_getMetatypeMetadata()
{
  return MEMORY[0x270FA03C8]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x270FA03D0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x270FA03E8]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x270FA0400]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x270FA0440]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x270FA0448]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x270FA0478]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
}

uint64_t swift_isClassType()
{
  return MEMORY[0x270FA0490]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x270FA0498]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x270FA04C0]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
}

uint64_t swift_once()
{
  return MEMORY[0x270FA04F0]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x270FA0528]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x270FA0538]();
}

uint64_t swift_setDeallocating()
{
  return MEMORY[0x270FA0550]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x270FA0558]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x270FA0560]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x270FA2450]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x270FA2458]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x270FA2460]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x270FA05D0]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x270FA05E8]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x270FA05F0]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x270FA05F8]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
}

uint64_t swift_weakAssign()
{
  return MEMORY[0x270FA0630]();
}

uint64_t swift_weakDestroy()
{
  return MEMORY[0x270FA0648]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x270FA0650]();
}

uint64_t swift_weakLoadStrong()
{
  return MEMORY[0x270FA0658]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}