_TtC27AXWatchRemoteScreenServices28AXTwiceRemoteScreenMessenger *AXTwiceRemoteScreenMessengerObjc()
{
  return +[AXTwiceRemoteScreenMessenger sharedInstance];
}

uint64_t AXWatchRemoteScreenIsTwiceFeatureOn()
{
  return MEMORY[0x270ED8070]("Accessibility", "Twice_RemoteScreen");
}

uint64_t AXWatchRemoteScreenIsPairedGizmoSupported()
{
  v0 = +[AXDeviceRemoteScreenUtil sharedInstance];
  uint64_t v1 = [v0 isPairedGizmoSupported];

  return v1;
}

id AX_NRDEVICECAPABILITY_MULTIBAND_WIFI()
{
  v0 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"776630FC-BE65-4716-B3B0-E36BA8679ECE"];
  return v0;
}

uint64_t AXWatchRemoteScreenIsPairedGizmoHasStingSupport()
{
  v0 = +[AXDeviceRemoteScreenUtil sharedInstance];
  uint64_t v1 = [v0 isPairedGizmoHasStingSupport];

  return v1;
}

id AX_NRDEVICECAPABILITY_STING()
{
  v0 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"15BF559D-D50B-44FE-AC84-DFBA323EC985"];
  return v0;
}

uint64_t AXDeviceRemoteScreenIsBluetoothOn()
{
  if ([MEMORY[0x263F08B88] isMainThread])
  {
    v0 = [getBluetoothManagerClass() sharedInstance];
    uint64_t v1 = [v0 powered];

    return v1;
  }
  else
  {
    uint64_t v5 = 0;
    v6 = &v5;
    uint64_t v7 = 0x2020000000;
    char v8 = 0;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __AXDeviceRemoteScreenIsBluetoothOn_block_invoke;
    block[3] = &unk_264882428;
    block[4] = &v5;
    dispatch_sync(MEMORY[0x263EF83A0], block);
    uint64_t v3 = *((unsigned __int8 *)v6 + 24);
    _Block_object_dispose(&v5, 8);
    return v3;
  }
}

id getBluetoothManagerClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  v0 = (void *)getBluetoothManagerClass_softClass;
  uint64_t v7 = getBluetoothManagerClass_softClass;
  if (!getBluetoothManagerClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getBluetoothManagerClass_block_invoke;
    v3[3] = &unk_264882428;
    v3[4] = &v4;
    __getBluetoothManagerClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_22A5FE52C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __AXDeviceRemoteScreenIsBluetoothOn_block_invoke(uint64_t a1)
{
  id v2 = [getBluetoothManagerClass() sharedInstance];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v2 powered];
}

uint64_t AXDeviceRemoteScreenIsWifiOn()
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2050000000;
  v0 = (void *)getWFClientClass_softClass;
  uint64_t v9 = getWFClientClass_softClass;
  if (!getWFClientClass_softClass)
  {
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __getWFClientClass_block_invoke;
    v5[3] = &unk_264882428;
    v5[4] = &v6;
    __getWFClientClass_block_invoke((uint64_t)v5);
    v0 = (void *)v7[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v6, 8);
  id v2 = objc_alloc_init(v1);
  uint64_t v3 = [v2 powered];

  return v3;
}

void sub_22A5FE674(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

double AXDisplayCornerRadiusWithMargin(double a1)
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  id v2 = (float (*)(__CFString *, double))getMGGetFloat32AnswerSymbolLoc_ptr;
  uint64_t v8 = getMGGetFloat32AnswerSymbolLoc_ptr;
  if (!getMGGetFloat32AnswerSymbolLoc_ptr)
  {
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __getMGGetFloat32AnswerSymbolLoc_block_invoke;
    v4[3] = &unk_264882428;
    v4[4] = &v5;
    __getMGGetFloat32AnswerSymbolLoc_block_invoke((uint64_t)v4);
    id v2 = (float (*)(__CFString *, double))v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v2) {
    AXDisplayCornerRadiusWithMargin_cold_1();
  }
  return fmax(v2(@"DeviceCornerRadius", 0.0) - a1, 13.0);
}

void sub_22A5FE770(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

double AXDisplayCornerRadius()
{
  return AXDisplayCornerRadiusWithMargin(0.0);
}

__CFString *AXkMobileKeyBagLockStatusNotificationID()
{
  return @"com.apple.mobile.keybagd.lock_status";
}

__CFString *AXkNanoOrientationStatusNotificationID()
{
  return @"NanoOrientationSettingChangedNotification";
}

id _AXCurrentPairedGizmo()
{
  v0 = [MEMORY[0x263F57730] sharedInstance];
  id v1 = [v0 getActivePairedDevice];

  if (!v1) {
    goto LABEL_5;
  }
  id v2 = [v1 valueForProperty:*MEMORY[0x263F575B0]];
  if ([v2 BOOLValue])
  {

LABEL_5:
    id v5 = 0;
    goto LABEL_6;
  }
  uint64_t v3 = [v1 valueForProperty:*MEMORY[0x263F575B8]];
  char v4 = [v3 BOOLValue];

  if (v4) {
    goto LABEL_5;
  }
  id v5 = v1;
LABEL_6:

  return v5;
}

void AXNPSSetWatchRemoteScreenEnabled(uint64_t a1)
{
  _AXCurrentPairedGizmo();
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    id v2 = (objc_class *)MEMORY[0x263F57520];
    id v3 = (id)*MEMORY[0x263F8B3C8];
    id v4 = [v2 alloc];
    id v5 = (void *)[v4 initWithDomain:*MEMORY[0x263F8B0F8] pairedDevice:v10];
    [v5 setBool:a1 forKey:v3];
    id v6 = (id)[v5 synchronize];
    uint64_t v7 = objc_opt_new();
    uint64_t v8 = [v5 domain];
    uint64_t v9 = [MEMORY[0x263EFFA08] setWithObject:v3];

    [v7 synchronizeNanoDomain:v8 keys:v9];
  }
}

uint64_t AXIsCrownOrientationOnRightSide()
{
  v0 = _AXCurrentPairedGizmo();
  id v1 = v0;
  if (v0)
  {
    id v2 = [v0 valueForProperty:*MEMORY[0x263F57620]];
    id v3 = [v1 valueForProperty:*MEMORY[0x263F575E8]];
    id v4 = (void *)[objc_alloc(MEMORY[0x263F57520]) initWithDomain:@"com.apple.nano" pairingID:v2 pairingDataStore:v3];
    uint64_t v5 = [v4 BOOLForKey:@"invertUI"] ^ 1;
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

Class __getBluetoothManagerClass_block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!BluetoothManagerLibraryCore_frameworkLibrary)
  {
    v3[1] = (void *)MEMORY[0x263EF8330];
    v3[2] = (void *)3221225472;
    v3[3] = __BluetoothManagerLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_264882448;
    uint64_t v5 = 0;
    BluetoothManagerLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!BluetoothManagerLibraryCore_frameworkLibrary)
    {
      abort_report_np();
LABEL_8:
      __getBluetoothManagerClass_block_invoke_cold_1();
    }
    if (v3[0]) {
      free(v3[0]);
    }
  }
  Class result = objc_getClass("BluetoothManager");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    goto LABEL_8;
  }
  getBluetoothManagerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __BluetoothManagerLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  BluetoothManagerLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getWFClientClass_block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!WiFiKitLibraryCore_frameworkLibrary)
  {
    v3[1] = (void *)MEMORY[0x263EF8330];
    v3[2] = (void *)3221225472;
    v3[3] = __WiFiKitLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_264882480;
    uint64_t v5 = 0;
    WiFiKitLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!WiFiKitLibraryCore_frameworkLibrary)
    {
      abort_report_np();
LABEL_8:
      __getWFClientClass_block_invoke_cold_1();
    }
    if (v3[0]) {
      free(v3[0]);
    }
  }
  Class result = objc_getClass("WFClient");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    goto LABEL_8;
  }
  getWFClientClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __WiFiKitLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  WiFiKitLibraryCore_frameworkLibrary = result;
  return result;
}

void *__getMGGetFloat32AnswerSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v5[0] = 0;
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  id v2 = (void *)libMobileGestaltLibraryCore_frameworkLibrary;
  uint64_t v11 = libMobileGestaltLibraryCore_frameworkLibrary;
  if (!libMobileGestaltLibraryCore_frameworkLibrary)
  {
    v5[1] = (void *)MEMORY[0x263EF8330];
    v5[2] = (void *)3221225472;
    v5[3] = __libMobileGestaltLibraryCore_block_invoke;
    v5[4] = &unk_2648824B8;
    uint64_t v6 = &v8;
    uint64_t v7 = v5;
    long long v12 = xmmword_264882498;
    uint64_t v13 = 0;
    v9[3] = _sl_dlopen();
    libMobileGestaltLibraryCore_frameworkLibrary = *(void *)(v6[1] + 24);
    id v2 = (void *)v9[3];
  }
  _Block_object_dispose(&v8, 8);
  id v3 = v5[0];
  if (!v2)
  {
    id v3 = (void *)abort_report_np();
    __break(1u);
    goto LABEL_7;
  }
  if (v5[0]) {
LABEL_7:
  }
    free(v3);
  uint64_t result = dlsym(v2, "MGGetFloat32Answer");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMGGetFloat32AnswerSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_22A5FEF3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __libMobileGestaltLibraryCore_block_invoke(uint64_t a1)
{
  uint64_t result = _sl_dlopen();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  libMobileGestaltLibraryCore_frameworkLibrary = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

_TtC27AXWatchRemoteScreenServices27AXDeviceRemoteScreenService *AXTwiceRemoteScreenServiceObjc()
{
  return +[AXDeviceRemoteScreenService sharedInstance];
}

uint64_t sub_22A5FF000()
{
  uint64_t v0 = sub_22A60A670();
  __swift_allocate_value_buffer(v0, qword_26AF64F68);
  __swift_project_value_buffer(v0, (uint64_t)qword_26AF64F68);
  return sub_22A60A660();
}

uint64_t AXLogTwiceRemoteScreen.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_26AF64F60 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_22A60A670();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_26AF64F68);
  long long v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);
  return v4(a1, v3, v2);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

void type metadata accessor for AXAction()
{
  if (!qword_26837DCB8)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_26837DCB8);
    }
  }
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

id AXTwiceRemoteScreenService.getter()
{
  if (qword_26837DBD0 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)qword_26837DD20;
  return v0;
}

id sub_22A5FF27C()
{
  id result = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for AXDeviceRemoteScreenService()), sel_init);
  qword_26837DD20 = (uint64_t)result;
  return result;
}

id AXDeviceRemoteScreenService.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

id static AXDeviceRemoteScreenService.sharedInstance.getter()
{
  if (qword_26837DBD0 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)qword_26837DD20;
  return v0;
}

id AXDeviceRemoteScreenService.init()()
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v2 = &v0[OBJC_IVAR____TtC27AXWatchRemoteScreenServices27AXDeviceRemoteScreenService_serviceImpl];
  uint64_t v3 = (objc_class *)type metadata accessor for AXWatchRemoteScreenServiceAXUIService();
  id v4 = objc_allocWithZone(v3);
  uint64_t v5 = v0;
  id v6 = objc_msgSend(v4, sel_init);
  *((void *)v2 + 3) = v3;
  *((void *)v2 + 4) = &off_26DE30ED0;
  *(void *)uint64_t v2 = v6;
  uint64_t v7 = &v5[OBJC_IVAR____TtC27AXWatchRemoteScreenServices27AXDeviceRemoteScreenService_twiceEnabledEvent];
  *(void *)uint64_t v7 = 0xD000000000000036;
  *((void *)v7 + 1) = 0x800000022A60BAF0;
  uint64_t v8 = &v5[OBJC_IVAR____TtC27AXWatchRemoteScreenServices27AXDeviceRemoteScreenService_twiceEnabledKey];
  *(void *)uint64_t v8 = 0x64656C62616E65;
  *((void *)v8 + 1) = 0xE700000000000000;

  v10.receiver = v5;
  v10.super_class = ObjectType;
  return objc_msgSendSuper2(&v10, sel_init);
}

id AXDeviceRemoteScreenService.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

Swift::Bool __swiftcall AXDeviceRemoteScreenService.npsSetTwiceEnabled(_:)(Swift::Bool a1)
{
  BOOL v2 = a1;
  sub_22A5FF6A8(v1 + OBJC_IVAR____TtC27AXWatchRemoteScreenServices27AXDeviceRemoteScreenService_serviceImpl, (uint64_t)v6);
  uint64_t v3 = v7;
  uint64_t v4 = v8;
  __swift_project_boxed_opaque_existential_1(v6, v7);
  (*(void (**)(BOOL, uint64_t, uint64_t))(v4 + 24))(v2, v3, v4);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v6);
  return 1;
}

uint64_t sub_22A5FF6A8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t __swift_destroy_boxed_opaque_existential_1(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

Swift::Bool __swiftcall AXDeviceRemoteScreenService.startTwiceRemoteScreen()()
{
  uint64_t v1 = (void *)sub_22A60A6B0();
  uint64_t v2 = swift_allocObject();
  *(void *)(v2 + 16) = v0;
  objc_super v10 = sub_22A5FF9EC;
  uint64_t v11 = v2;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_22A5FFA0C;
  uint64_t v9 = &block_descriptor;
  uint64_t v3 = _Block_copy(aBlock);
  id v4 = v0;
  swift_release();
  AnalyticsSendEventLazy();
  _Block_release(v3);

  sub_22A5FF6A8((uint64_t)v4 + OBJC_IVAR____TtC27AXWatchRemoteScreenServices27AXDeviceRemoteScreenService_serviceImpl, (uint64_t)aBlock);
  uint64_t v5 = v9;
  id v6 = v10;
  __swift_project_boxed_opaque_existential_1(aBlock, (uint64_t)v9);
  (*((void (**)(void *, unint64_t (*)()))v6 + 1))(v5, v6);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)aBlock);
  return 1;
}

uint64_t sub_22A5FF9B4()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

unint64_t sub_22A5FF9EC()
{
  return sub_22A5FFC48(*(void *)(v0 + 16));
}

id sub_22A5FFA0C(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  uint64_t v3 = v1(v2);
  swift_release();
  if (v3)
  {
    sub_22A5FFE24(0, (unint64_t *)&unk_26AF64F18);
    id v4 = (void *)sub_22A60A680();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v4 = 0;
  }
  return v4;
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

Swift::Bool __swiftcall AXDeviceRemoteScreenService.stopTwiceRemoteScreen()()
{
  uint64_t v1 = (void *)sub_22A60A6B0();
  uint64_t v2 = swift_allocObject();
  *(void *)(v2 + 16) = v0;
  objc_super v10 = sub_22A5FFCF0;
  uint64_t v11 = v2;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_22A5FFA0C;
  uint64_t v9 = &block_descriptor_6;
  uint64_t v3 = _Block_copy(aBlock);
  id v4 = v0;
  swift_release();
  AnalyticsSendEventLazy();
  _Block_release(v3);

  sub_22A5FF6A8((uint64_t)v4 + OBJC_IVAR____TtC27AXWatchRemoteScreenServices27AXDeviceRemoteScreenService_serviceImpl, (uint64_t)aBlock);
  uint64_t v5 = v9;
  id v6 = v10;
  __swift_project_boxed_opaque_existential_1(aBlock, (uint64_t)v9);
  (*((void (**)(void *, unint64_t (*)()))v6 + 2))(v5, v6);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)aBlock);
  return 1;
}

unint64_t sub_22A5FFC48(uint64_t a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26837DE08);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_22A60B180;
  uint64_t v3 = *(void *)(a1 + OBJC_IVAR____TtC27AXWatchRemoteScreenServices27AXDeviceRemoteScreenService_twiceEnabledKey);
  uint64_t v4 = *(void *)(a1 + OBJC_IVAR____TtC27AXWatchRemoteScreenServices27AXDeviceRemoteScreenService_twiceEnabledKey + 8);
  *(void *)(inited + 32) = v3;
  *(void *)(inited + 40) = v4;
  sub_22A5FFE24(0, (unint64_t *)&qword_26837DE10);
  swift_bridgeObjectRetain();
  *(void *)(inited + 48) = sub_22A60A7E0();
  return sub_22A6032F0(inited);
}

unint64_t sub_22A5FFCF0()
{
  return sub_22A5FFC48(*(void *)(v0 + 16));
}

uint64_t dispatch thunk of AXTwiceRemoteScreenXPCServiceProtocol.startTwiceXPCRequest()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of AXTwiceRemoteScreenXPCServiceProtocol.stopTwiceXPCRequest()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of AXTwiceRemoteScreenXPCServiceProtocol.npsSetTwiceEnabledXPCRequest(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t type metadata accessor for AXDeviceRemoteScreenService()
{
  return self;
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

uint64_t sub_22A5FFE24(uint64_t a1, unint64_t *a2)
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

AXWatchRemoteScreenServices::AXWatchRemoteScreenAXUIServiceMessageID_optional __swiftcall AXWatchRemoteScreenAXUIServiceMessageID.init(rawValue:)(Swift::Int rawValue)
{
  unint64_t v2 = 0x40302010005uLL >> (8 * rawValue);
  if ((unint64_t)rawValue >= 6) {
    LOBYTE(v2) = 5;
  }
  *uint64_t v1 = v2;
  return (AXWatchRemoteScreenServices::AXWatchRemoteScreenAXUIServiceMessageID_optional)rawValue;
}

uint64_t AXWatchRemoteScreenAXUIServiceMessageID.rawValue.getter()
{
  return *v0 + 1;
}

BOOL sub_22A5FFEA0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

unint64_t sub_22A5FFEB8()
{
  unint64_t result = qword_26837DE20;
  if (!qword_26837DE20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26837DE20);
  }
  return result;
}

uint64_t sub_22A5FFF0C()
{
  return sub_22A60A970();
}

uint64_t sub_22A5FFF54()
{
  return sub_22A60A960();
}

uint64_t sub_22A5FFF84()
{
  return sub_22A60A970();
}

AXWatchRemoteScreenServices::AXWatchRemoteScreenAXUIServiceMessageID_optional sub_22A5FFFC8(Swift::Int *a1)
{
  return AXWatchRemoteScreenAXUIServiceMessageID.init(rawValue:)(*a1);
}

void sub_22A5FFFD0(void *a1@<X8>)
{
  *a1 = *v1 + 1;
}

unint64_t sub_22A5FFFE0(uint64_t a1)
{
  unint64_t result = sub_22A600008();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_22A600008()
{
  unint64_t result = qword_26837DE28;
  if (!qword_26837DE28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26837DE28);
  }
  return result;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for AXWatchRemoteScreenAXUIServiceMessageID(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for AXWatchRemoteScreenAXUIServiceMessageID(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 4;
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
        JUMPOUT(0x22A6001C8);
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
          *unint64_t result = a2 + 4;
        break;
    }
  }
  return result;
}

uint64_t sub_22A6001F0(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_22A6001FC(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for AXWatchRemoteScreenAXUIServiceMessageID()
{
  return &type metadata for AXWatchRemoteScreenAXUIServiceMessageID;
}

uint64_t sub_22A600214(void *a1)
{
  id v2 = a1;
  sub_22A60A870();
  sub_22A60A6F0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26837DEB8);
  sub_22A60A8A0();

  return 0;
}

uint64_t sub_22A6002B8()
{
  return sub_22A600214(*v0);
}

uint64_t sub_22A6002C0()
{
  return sub_22A60A5A0();
}

uint64_t sub_22A6002D8()
{
  return sub_22A60A5B0();
}

uint64_t sub_22A6002F0()
{
  return sub_22A60A590();
}

uint64_t sub_22A600318(uint64_t result, void *a2, void (*a3)(void *, uint64_t))
{
  if (a3)
  {
    if (a2)
    {
      sub_22A60172C((uint64_t)a3);
      id v5 = a2;
      a3(a2, 1);

      return sub_22A60171C((uint64_t)a3);
    }
    else
    {
      unint64_t v6 = result;
      if (result)
      {
        swift_retain();
        unint64_t v7 = v6;
      }
      else
      {
        swift_retain();
        unint64_t v7 = sub_22A60340C(MEMORY[0x263F8EE78]);
      }
      swift_bridgeObjectRetain();
      a3((void *)v7, 0);
      sub_22A60171C((uint64_t)a3);
      return swift_bridgeObjectRelease();
    }
  }
  return result;
}

uint64_t sub_22A60041C(uint64_t a1, uint64_t a2, void *a3)
{
  unsigned int v4 = *(void (**)(uint64_t, void *))(a1 + 32);
  if (a2) {
    uint64_t v5 = sub_22A60A690();
  }
  else {
    uint64_t v5 = 0;
  }
  swift_retain();
  id v6 = a3;
  v4(v5, a3);
  swift_release();

  return swift_bridgeObjectRelease();
}

id sub_22A6004C8()
{
  uint64_t v1 = OBJC_IVAR____TtC27AXWatchRemoteScreenServices37AXWatchRemoteScreenServiceAXUIService__client;
  id v2 = *(void **)(v0 + OBJC_IVAR____TtC27AXWatchRemoteScreenServices37AXWatchRemoteScreenServiceAXUIService__client);
  if (v2)
  {
    id v3 = *(id *)(v0 + OBJC_IVAR____TtC27AXWatchRemoteScreenServices37AXWatchRemoteScreenServiceAXUIService__client);
LABEL_6:
    id v13 = v2;
    return v3;
  }
  uint64_t v4 = v0;
  id v5 = objc_msgSend(self, sel_processInfo);
  objc_msgSend(v5, sel_processIdentifier);

  sub_22A60A8F0();
  sub_22A60A6F0();
  swift_bridgeObjectRelease();
  id v6 = objc_allocWithZone(MEMORY[0x263F22190]);
  unint64_t v7 = (void *)sub_22A60A6B0();
  swift_bridgeObjectRelease();
  int v8 = (void *)sub_22A60A6B0();
  id v9 = objc_msgSend(v6, sel_initWithIdentifier_serviceBundleName_, v7, v8);

  objc_super v10 = *(void **)(v4 + v1);
  *(void *)(v4 + v1) = v9;

  id result = *(id *)(v4 + v1);
  if (result)
  {
    id result = objc_msgSend(result, sel_setDelegate_, v4);
    long long v12 = *(void **)(v4 + v1);
    if (v12)
    {
      id v3 = v12;
      id v2 = 0;
      goto LABEL_6;
    }
  }
  __break(1u);
  return result;
}

void sub_22A600654(char a1)
{
  if (qword_26AF64F60 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_22A60A670();
  __swift_project_value_buffer(v2, (uint64_t)qword_26AF64F68);
  id v3 = sub_22A60A650();
  os_log_type_t v4 = sub_22A60A7C0();
  if (os_log_type_enabled(v3, v4))
  {
    id v5 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)id v5 = 67109120;
    LODWORD(v10[0]) = a1 & 1;
    sub_22A60A800();
    _os_log_impl(&dword_22A5FC000, v3, v4, "[TWICE] Client requesting TWICE npsSetTwiceEnabledXPCRequest %{BOOL}d", v5, 8u);
    MEMORY[0x22A6CF070](v5, -1, -1);
  }

  id v6 = sub_22A6004C8();
  if (a1) {
    uint64_t v7 = 4;
  }
  else {
    uint64_t v7 = 5;
  }
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = sub_22A600858;
  *(void *)(v8 + 24) = 0;
  v10[4] = sub_22A60195C;
  v10[5] = v8;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 1107296256;
  v10[2] = sub_22A60041C;
  v10[3] = &block_descriptor_29;
  id v9 = _Block_copy(v10);
  swift_release();
  objc_msgSend(v6, sel_sendAsynchronousMessage_withIdentifier_targetAccessQueue_completion_, 0, v7, 0, v9);
  _Block_release(v9);
}

void sub_22A600858(void *a1, char a2)
{
}

void sub_22A600874()
{
  if (qword_26AF64F60 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_22A60A670();
  __swift_project_value_buffer(v0, (uint64_t)qword_26AF64F68);
  uint64_t v1 = sub_22A60A650();
  os_log_type_t v2 = sub_22A60A7C0();
  if (os_log_type_enabled(v1, v2))
  {
    id v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v3 = 0;
    _os_log_impl(&dword_22A5FC000, v1, v2, "[TWICE] Client requesting TWICE start", v3, 2u);
    MEMORY[0x22A6CF070](v3, -1, -1);
  }

  id v4 = sub_22A6004C8();
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = sub_22A600858;
  *(void *)(v5 + 24) = 0;
  v7[4] = sub_22A60195C;
  v7[5] = v5;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 1107296256;
  v7[2] = sub_22A60041C;
  v7[3] = &block_descriptor_22;
  id v6 = _Block_copy(v7);
  swift_release();
  objc_msgSend(v4, sel_sendAsynchronousMessage_withIdentifier_targetAccessQueue_completion_, 0, 1, 0, v6);
  _Block_release(v6);
}

void sub_22A600A34()
{
  if (qword_26AF64F60 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_22A60A670();
  __swift_project_value_buffer(v0, (uint64_t)qword_26AF64F68);
  uint64_t v1 = sub_22A60A650();
  os_log_type_t v2 = sub_22A60A7C0();
  if (os_log_type_enabled(v1, v2))
  {
    id v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v3 = 0;
    _os_log_impl(&dword_22A5FC000, v1, v2, "[TWICE] Client requesting TWICE stop", v3, 2u);
    MEMORY[0x22A6CF070](v3, -1, -1);
  }

  id v4 = sub_22A6004C8();
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = sub_22A600BF4;
  *(void *)(v5 + 24) = 0;
  v7[4] = sub_22A60195C;
  v7[5] = v5;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 1107296256;
  v7[2] = sub_22A60041C;
  v7[3] = &block_descriptor_15;
  id v6 = _Block_copy(v7);
  swift_release();
  objc_msgSend(v4, sel_sendAsynchronousMessage_withIdentifier_targetAccessQueue_completion_, 0, 2, 0, v6);
  _Block_release(v6);
}

void sub_22A600BF4(void *a1, char a2)
{
}

void sub_22A600C10()
{
  if (qword_26AF64F60 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_22A60A670();
  __swift_project_value_buffer(v0, (uint64_t)qword_26AF64F68);
  uint64_t v1 = sub_22A60A650();
  os_log_type_t v2 = sub_22A60A7C0();
  if (os_log_type_enabled(v1, v2))
  {
    id v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v3 = 0;
    _os_log_impl(&dword_22A5FC000, v1, v2, "[TWICE] Client requesting TWICE restart", v3, 2u);
    MEMORY[0x22A6CF070](v3, -1, -1);
  }

  id v4 = sub_22A6004C8();
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = sub_22A600DD0;
  *(void *)(v5 + 24) = 0;
  v7[4] = sub_22A6016FC;
  v7[5] = v5;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 1107296256;
  v7[2] = sub_22A60041C;
  v7[3] = &block_descriptor_0;
  id v6 = _Block_copy(v7);
  swift_release();
  objc_msgSend(v4, sel_sendAsynchronousMessage_withIdentifier_targetAccessQueue_completion_, 0, 3, 0, v6);
  _Block_release(v6);
}

void sub_22A600DD0(void *a1, char a2)
{
}

void sub_22A600DEC(id a1, char a2, const char *a3, uint64_t (*a4)(void), const char *a5)
{
  if (a2)
  {
    id v17 = a1;
    if (qword_26AF64F60 != -1) {
      swift_once();
    }
    uint64_t v18 = sub_22A60A670();
    __swift_project_value_buffer(v18, (uint64_t)qword_26AF64F68);
    id v19 = a1;
    id v20 = a1;
    oslog = sub_22A60A650();
    os_log_type_t v21 = sub_22A60A7B0();
    if (os_log_type_enabled(oslog, v21))
    {
      v22 = (uint8_t *)swift_slowAlloc();
      v23 = (void *)swift_slowAlloc();
      *(_DWORD *)v22 = 138412290;
      sub_22A601748();
      swift_allocError();
      void *v24 = a1;
      id v25 = a1;
      uint64_t v27 = _swift_stdlib_bridgeErrorToNSError();
      sub_22A60A800();
      void *v23 = v27;
      sub_22A60173C(a1, 1);
      sub_22A60173C(a1, 1);
      _os_log_impl(&dword_22A5FC000, oslog, v21, a3, v22, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26837DEA8);
      swift_arrayDestroy();
      MEMORY[0x22A6CF070](v23, -1, -1);
      MEMORY[0x22A6CF070](v22, -1, -1);

      sub_22A60173C(a1, 1);
      return;
    }
    sub_22A60173C(a1, 1);
    sub_22A60173C(a1, 1);
  }
  else
  {
    uint64_t v8 = qword_26AF64F60;
    swift_bridgeObjectRetain();
    if (v8 != -1) {
      swift_once();
    }
    uint64_t v9 = sub_22A60A670();
    __swift_project_value_buffer(v9, (uint64_t)qword_26AF64F68);
    swift_bridgeObjectRetain();
    oslog = sub_22A60A650();
    os_log_type_t v10 = a4();
    if (os_log_type_enabled(oslog, v10))
    {
      uint64_t v11 = (uint8_t *)swift_slowAlloc();
      uint64_t v12 = swift_slowAlloc();
      uint64_t v27 = v12;
      *(_DWORD *)uint64_t v11 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v13 = sub_22A60A6A0();
      unint64_t v15 = v14;
      sub_22A60173C(a1, 0);
      sub_22A605FB8(v13, v15, &v27);
      sub_22A60A800();
      swift_bridgeObjectRelease();
      sub_22A60173C(a1, 0);
      sub_22A60173C(a1, 0);
      _os_log_impl(&dword_22A5FC000, oslog, v10, a5, v11, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x22A6CF070](v12, -1, -1);
      MEMORY[0x22A6CF070](v11, -1, -1);

      return;
    }
    sub_22A60173C(a1, 0);
    sub_22A60173C(a1, 0);
  }
}

id sub_22A601238()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AXWatchRemoteScreenServiceAXUIService();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for AXWatchRemoteScreenServiceAXUIService()
{
  return self;
}

void sub_22A6012A0()
{
}

void sub_22A6012C4()
{
}

void sub_22A6012E8(char a1)
{
}

void sub_22A60130C(void *a1)
{
  uint64_t v2 = v1;
  v20[1] = *MEMORY[0x263EF8340];
  if (qword_26AF64F60 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_22A60A670();
  __swift_project_value_buffer(v4, (uint64_t)qword_26AF64F68);
  id v5 = a1;
  id v6 = sub_22A60A650();
  os_log_type_t v7 = sub_22A60A7B0();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v19 = v2;
    uint64_t v8 = swift_slowAlloc();
    uint64_t v9 = (void *)swift_slowAlloc();
    uint64_t v10 = swift_slowAlloc();
    v20[0] = v10;
    *(_DWORD *)uint64_t v8 = 136315394;
    sub_22A605FB8(0xD00000000000003CLL, 0x800000022A60BC80, v20);
    sub_22A60A800();
    *(_WORD *)(v8 + 12) = 2112;
    if (a1) {
      id v11 = v5;
    }
    sub_22A60A800();
    *uint64_t v9 = a1;

    _os_log_impl(&dword_22A5FC000, v6, v7, "[TWICE]: %s %@", (uint8_t *)v8, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26837DEA8);
    swift_arrayDestroy();
    MEMORY[0x22A6CF070](v9, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x22A6CF070](v10, -1, -1);
    MEMORY[0x22A6CF070](v8, -1, -1);

    uint64_t v2 = v19;
  }
  else
  {
  }
  uint64_t v12 = *(void **)(v2 + OBJC_IVAR____TtC27AXWatchRemoteScreenServices37AXWatchRemoteScreenServiceAXUIService__client);
  if (a1)
  {
    if (!v12) {
      return;
    }
    sub_22A6016B8();
    id v13 = v5;
    id v14 = v12;
    char v15 = sub_22A60A7F0();

    if ((v15 & 1) == 0) {
      return;
    }
  }
  else if (v12)
  {
    return;
  }
  if (_AXSTwiceRemoteScreenEnabled())
  {
    v16 = sub_22A60A650();
    os_log_type_t v17 = sub_22A60A7C0();
    if (os_log_type_enabled(v16, v17))
    {
      uint64_t v18 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v18 = 0;
      _os_log_impl(&dword_22A5FC000, v16, v17, "[TWICE]: start Twice again after axuiserver disconnected", v18, 2u);
      MEMORY[0x22A6CF070](v18, -1, -1);
    }

    sub_22A600C10();
  }
}

unint64_t sub_22A6016B8()
{
  unint64_t result = qword_26AF64F10;
  if (!qword_26AF64F10)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26AF64F10);
  }
  return result;
}

uint64_t sub_22A6016FC(uint64_t a1, void *a2)
{
  return sub_22A600318(a1, a2, *(void (**)(void *, uint64_t))(v2 + 16));
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

uint64_t sub_22A60171C(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_22A60172C(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

void sub_22A60173C(id a1, char a2)
{
  if (a2) {

  }
  else {
    swift_bridgeObjectRelease();
  }
}

unint64_t sub_22A601748()
{
  unint64_t result = qword_26837DEB0;
  if (!qword_26837DEB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26837DEB0);
  }
  return result;
}

uint64_t objectdestroyTm()
{
  if (*(void *)(v0 + 16)) {
    swift_release();
  }
  return MEMORY[0x270FA0238](v0, 32, 7);
}

void *initializeBufferWithCopyOfBuffer for AXUIServiceError(void *a1, id *a2)
{
  id v3 = *a2;
  id v4 = *a2;
  *a1 = v3;
  return a1;
}

void destroy for AXUIServiceError(id *a1)
{
}

void **assignWithCopy for AXUIServiceError(void **a1, id *a2)
{
  id v3 = *a2;
  id v4 = *a2;
  id v5 = *a1;
  *a1 = v3;

  return a1;
}

void *__swift_memcpy8_8(void *result, void *a2)
{
  *unint64_t result = *a2;
  return result;
}

void **assignWithTake for AXUIServiceError(void **a1, void **a2)
{
  id v3 = *a1;
  *a1 = *a2;

  return a1;
}

uint64_t getEnumTagSinglePayload for AXUIServiceError(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 8)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AXUIServiceError(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)unint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 8) = 1;
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
      *(void *)unint64_t result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 8) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

uint64_t sub_22A601924()
{
  return 0;
}

ValueMetadata *type metadata accessor for AXUIServiceError()
{
  return &type metadata for AXUIServiceError;
}

uint64_t sub_22A601960(unsigned __int8 a1, char a2)
{
  unint64_t v2 = 0xD000000000000010;
  unint64_t v3 = 0x800000022A60BA60;
  uint64_t v4 = a1;
  unint64_t v5 = 0xD000000000000010;
  switch(v4)
  {
    case 1:
      unint64_t v3 = 0xEF64657463656E6ELL;
      unint64_t v5 = 0x6F43656369766564;
      break;
    case 2:
      break;
    case 3:
      unint64_t v3 = 0x800000022A60BA80;
      break;
    case 4:
      unint64_t v5 = 0x6E696D6165727473;
      unint64_t v3 = 0xE900000000000067;
      break;
    case 5:
      unint64_t v3 = 0xE900000000000064;
      unint64_t v5 = 0x657373696D736964;
      break;
    case 6:
      unint64_t v3 = 0xE500000000000000;
      unint64_t v5 = 0x726F727265;
      break;
    default:
      unint64_t v3 = 0xE400000000000000;
      unint64_t v5 = 1701602409;
      break;
  }
  unint64_t v6 = 0x800000022A60BA60;
  switch(a2)
  {
    case 1:
      unint64_t v6 = 0xEF64657463656E6ELL;
      if (v5 == 0x6F43656369766564) {
        goto LABEL_19;
      }
      goto LABEL_22;
    case 2:
      goto LABEL_18;
    case 3:
      unint64_t v6 = 0x800000022A60BA80;
      if (v5 != 0xD000000000000010) {
        goto LABEL_22;
      }
      goto LABEL_19;
    case 4:
      unint64_t v6 = 0xE900000000000067;
      if (v5 != 0x6E696D6165727473) {
        goto LABEL_22;
      }
      goto LABEL_19;
    case 5:
      unint64_t v6 = 0xE900000000000064;
      unint64_t v2 = 0x657373696D736964;
LABEL_18:
      if (v5 == v2) {
        goto LABEL_19;
      }
      goto LABEL_22;
    case 6:
      unint64_t v6 = 0xE500000000000000;
      if (v5 != 0x726F727265) {
        goto LABEL_22;
      }
      goto LABEL_19;
    default:
      unint64_t v6 = 0xE400000000000000;
      if (v5 != 1701602409) {
        goto LABEL_22;
      }
LABEL_19:
      if (v3 == v6) {
        char v7 = 1;
      }
      else {
LABEL_22:
      }
        char v7 = sub_22A60A900();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v7 & 1;
  }
}

uint64_t sub_22A601BB4()
{
  sub_22A60A6E0();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22A601CDC()
{
  return sub_22A60A970();
}

BOOL static AXTwiceBluetoothWifiError.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t AXTwiceBluetoothWifiError.hash(into:)()
{
  return sub_22A60A960();
}

uint64_t AXTwiceBluetoothWifiError.hashValue.getter()
{
  return sub_22A60A970();
}

uint64_t sub_22A601EA8()
{
  return sub_22A60A970();
}

uint64_t sub_22A601EF0()
{
  return sub_22A60A960();
}

uint64_t sub_22A601F1C()
{
  return sub_22A60A970();
}

unint64_t AXTwiceCompanionState.AXTwiceCompanionEvent.stringDescription.getter()
{
  sub_22A6022CC(v0, (uint64_t)&v5);
  switch(v14)
  {
    case 1:

      unint64_t result = 0x4565727574736567;
      break;
    case 2:
      sub_22A60235C((uint64_t)&v10);
      sub_22A60235C((uint64_t)&v6);
      unint64_t result = 0x6E6F697463417861;
      break;
    case 3:
      sub_22A602304(v5, v6);
      unint64_t result = 0x6465766965636572;
      break;
    case 4:
      unint64_t v4 = 0;
      sub_22A60A870();
      sub_22A60A6F0();
      sub_22A60A8A0();
      goto LABEL_8;
    case 5:
      sub_22A60A870();
      swift_bridgeObjectRelease();
      unint64_t v4 = 0xD00000000000001BLL;
      sub_22A60A6F0();
      swift_bridgeObjectRelease();
LABEL_8:
      unint64_t result = v4;
      break;
    case 6:
      unint64_t result = 0xD000000000000014;
      uint64_t v2 = v10 | v9 | v8;
      if (v12 | v13 | v5 | v11 | v2 | v7 | v6)
      {
        unint64_t v3 = v12 | v13 | v11 | v2 | v7 | v6;
        if (v5 != 1 || v3)
        {
          if (v5 != 2 || v3)
          {
            if (v5 != 3 || v3)
            {
              if (v5 != 4 || v3)
              {
                unint64_t result = 0xD000000000000017;
                if ((v5 != 5 || v3) && (v5 != 6 || v3 != 0)) {
                  unint64_t result = 0x5841657461647075;
                }
              }
              else
              {
                unint64_t result = 0xD00000000000001DLL;
              }
            }
          }
          else
          {
            unint64_t result = 0xD000000000000012;
          }
        }
        else
        {
          unint64_t result = 0x754A656369766564;
        }
      }
      break;
    default:

      unint64_t result = 0x6576456863756F74;
      break;
  }
  return result;
}

uint64_t sub_22A6022CC(uint64_t *a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_22A602304(uint64_t a1, unint64_t a2)
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

uint64_t sub_22A60235C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26837DEC0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void static AXTwiceCompanionState.initialState.getter(unsigned char *a1@<X8>)
{
  *a1 = 0;
}

AXWatchRemoteScreenServices::AXTwiceCompanionState_optional __swiftcall AXTwiceCompanionState.init(rawValue:)(Swift::String rawValue)
{
  uint64_t v2 = v1;
  unint64_t v3 = sub_22A60A8E0();
  result.value = swift_bridgeObjectRelease();
  char v5 = 7;
  if (v3 < 7) {
    char v5 = v3;
  }
  *uint64_t v2 = v5;
  return result;
}

uint64_t sub_22A602424(unsigned __int8 *a1, char *a2)
{
  return sub_22A601960(*a1, *a2);
}

uint64_t sub_22A602430()
{
  return sub_22A601CDC();
}

uint64_t sub_22A60243C()
{
  return sub_22A601BB4();
}

uint64_t sub_22A602444()
{
  return sub_22A601CDC();
}

AXWatchRemoteScreenServices::AXTwiceCompanionState_optional sub_22A60244C(Swift::String *a1)
{
  return AXTwiceCompanionState.init(rawValue:)(*a1);
}

uint64_t sub_22A602458@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = AXTwiceCompanionState.description.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

void sub_22A602480(unsigned char *a1@<X8>)
{
  *a1 = 0;
}

unint64_t _s27AXWatchRemoteScreenServices21AXTwiceCompanionStateO8rawValueSSvg_0()
{
  unint64_t result = 0xD000000000000010;
  switch(*v0)
  {
    case 1:
      unint64_t result = 0x6F43656369766564;
      break;
    case 2:
    case 3:
      return result;
    case 4:
      unint64_t result = 0x6E696D6165727473;
      break;
    case 5:
      unint64_t result = 0x657373696D736964;
      break;
    case 6:
      unint64_t result = 0x726F727265;
      break;
    default:
      unint64_t result = 1701602409;
      break;
  }
  return result;
}

unint64_t sub_22A602580()
{
  unint64_t result = qword_26837DEC8;
  if (!qword_26837DEC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26837DEC8);
  }
  return result;
}

unint64_t sub_22A6025D8()
{
  unint64_t result = qword_26837DED0;
  if (!qword_26837DED0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26837DED0);
  }
  return result;
}

unint64_t sub_22A60262C(uint64_t a1)
{
  unint64_t result = sub_22A602654();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_22A602654()
{
  unint64_t result = qword_26837DED8;
  if (!qword_26837DED8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26837DED8);
  }
  return result;
}

uint64_t dispatch thunk of static AXTwiceStateType.initialState.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t getEnumTagSinglePayload for AXTwiceBluetoothWifiError(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for AXTwiceBluetoothWifiError(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 2;
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
        JUMPOUT(0x22A60281CLL);
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
          *unint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AXTwiceBluetoothWifiError()
{
  return &type metadata for AXTwiceBluetoothWifiError;
}

uint64_t __swift_memcpy9_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *(unsigned char *)(result + 8) = *((unsigned char *)a2 + 8);
  *(void *)unint64_t result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for AXTwiceInternalError(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFD && *(unsigned char *)(a1 + 9)) {
    return (*(_DWORD *)a1 + 253);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 8);
  if (v3 <= 3) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for AXTwiceInternalError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFC)
  {
    *(unsigned char *)(result + 8) = 0;
    *(void *)unint64_t result = a2 - 253;
    if (a3 >= 0xFD) {
      *(unsigned char *)(result + 9) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFD) {
      *(unsigned char *)(result + 9) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 8) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_22A6028F4(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 8) <= 2u) {
    return *(unsigned __int8 *)(a1 + 8);
  }
  else {
    return (*(_DWORD *)a1 + 3);
  }
}

uint64_t sub_22A60290C(uint64_t result, unsigned int a2)
{
  if (a2 >= 3)
  {
    *(void *)unint64_t result = a2 - 3;
    LOBYTE(a2) = 3;
  }
  *(unsigned char *)(result + 8) = a2;
  return result;
}

ValueMetadata *type metadata accessor for AXTwiceInternalError()
{
  return &type metadata for AXTwiceInternalError;
}

uint64_t getEnumTagSinglePayload for AXTwiceCompanionState(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFA) {
    goto LABEL_17;
  }
  if (a2 + 6 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 6) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 6;
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
      return (*a1 | (v4 << 8)) - 6;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 6;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 7;
  int v8 = v6 - 7;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for AXTwiceCompanionState(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 6 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 6) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFA) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF9)
  {
    unsigned int v6 = ((a2 - 250) >> 8) + 1;
    *unint64_t result = a2 + 6;
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
        JUMPOUT(0x22A602A90);
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
          *unint64_t result = a2 + 6;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AXTwiceCompanionState()
{
  return &type metadata for AXTwiceCompanionState;
}

uint64_t initializeBufferWithCopyOfBuffer for AXTwiceCompanionState.AXTwiceCompanionEvent(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t sub_22A602AFC(uint64_t a1, unint64_t a2)
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

void destroy for AXTwiceCompanionState.AXTwiceCompanionEvent(uint64_t a1)
{
  unsigned int v2 = *(unsigned __int8 *)(a1 + 72);
  if (v2 >= 6) {
    unsigned int v2 = *(_DWORD *)a1 + 6;
  }
  switch(v2)
  {
    case 0u:
    case 1u:
      uint64_t v3 = *(void **)a1;

      break;
    case 2u:
      if (*(void *)(a1 + 32)) {
        __swift_destroy_boxed_opaque_existential_1(a1 + 8);
      }
      if (*(void *)(a1 + 64))
      {
        __swift_destroy_boxed_opaque_existential_1(a1 + 40);
      }
      break;
    case 3u:
      uint64_t v4 = *(void *)a1;
      unint64_t v5 = *(void *)(a1 + 8);
      sub_22A602304(v4, v5);
      break;
    default:
      return;
  }
}

uint64_t initializeWithCopy for AXTwiceCompanionState.AXTwiceCompanionEvent(uint64_t a1, uint64_t *a2)
{
  unsigned int v4 = *((unsigned __int8 *)a2 + 72);
  if (v4 >= 6) {
    unsigned int v4 = *(_DWORD *)a2 + 6;
  }
  switch(v4)
  {
    case 0u:
      unint64_t v5 = (void *)*a2;
      *(void *)a1 = *a2;
      *(unsigned char *)(a1 + 72) = 0;
      id v6 = v5;
      return a1;
    case 1u:
      uint64_t v9 = (void *)*a2;
      *(void *)a1 = *a2;
      *(unsigned char *)(a1 + 72) = 1;
      id v10 = v9;
      return a1;
    case 2u:
      *(_DWORD *)a1 = *(_DWORD *)a2;
      uint64_t v11 = (_OWORD *)(a1 + 8);
      uint64_t v12 = a2 + 1;
      uint64_t v13 = a2[4];
      if (v13)
      {
        *(void *)(a1 + 32) = v13;
        (**(void (***)(_OWORD *, _OWORD *))(v13 - 8))(v11, v12);
      }
      else
      {
        long long v17 = *(_OWORD *)(a2 + 3);
        *uint64_t v11 = *v12;
        *(_OWORD *)(a1 + 24) = v17;
      }
      uint64_t v18 = (_OWORD *)(a1 + 40);
      uint64_t v19 = a2 + 5;
      uint64_t v20 = a2[8];
      if (v20)
      {
        *(void *)(a1 + 64) = v20;
        (**(void (***)(_OWORD *, _OWORD *))(v20 - 8))(v18, v19);
      }
      else
      {
        long long v21 = *(_OWORD *)(a2 + 7);
        *uint64_t v18 = *v19;
        *(_OWORD *)(a1 + 56) = v21;
      }
      char v16 = 2;
      goto LABEL_17;
    case 3u:
      uint64_t v15 = *a2;
      unint64_t v14 = a2[1];
      sub_22A602AFC(*a2, v14);
      *(void *)a1 = v15;
      *(void *)(a1 + 8) = v14;
      char v16 = 3;
      goto LABEL_17;
    case 4u:
      *(void *)a1 = *a2;
      *(unsigned char *)(a1 + 8) = *((unsigned char *)a2 + 8);
      char v16 = 4;
      goto LABEL_17;
    case 5u:
      *(unsigned char *)a1 = *(unsigned char *)a2;
      char v16 = 5;
LABEL_17:
      *(unsigned char *)(a1 + 72) = v16;
      break;
    default:
      long long v7 = *((_OWORD *)a2 + 3);
      *(_OWORD *)(a1 + 32) = *((_OWORD *)a2 + 2);
      *(_OWORD *)(a1 + 48) = v7;
      *(_OWORD *)(a1 + 57) = *(_OWORD *)((char *)a2 + 57);
      long long v8 = *((_OWORD *)a2 + 1);
      *(_OWORD *)a1 = *(_OWORD *)a2;
      *(_OWORD *)(a1 + 16) = v8;
      break;
  }
  return a1;
}

uint64_t assignWithCopy for AXTwiceCompanionState.AXTwiceCompanionEvent(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    unsigned int v4 = *(unsigned __int8 *)(a1 + 72);
    if (v4 >= 6) {
      unsigned int v4 = *(_DWORD *)a1 + 6;
    }
    switch(v4)
    {
      case 0u:
      case 1u:

        break;
      case 2u:
        if (*(void *)(a1 + 32)) {
          __swift_destroy_boxed_opaque_existential_1(a1 + 8);
        }
        if (*(void *)(a1 + 64)) {
          __swift_destroy_boxed_opaque_existential_1(a1 + 40);
        }
        break;
      case 3u:
        sub_22A602304(*(void *)a1, *(void *)(a1 + 8));
        break;
      default:
        break;
    }
    unsigned int v5 = *(unsigned __int8 *)(a2 + 72);
    if (v5 >= 6) {
      unsigned int v5 = *(_DWORD *)a2 + 6;
    }
    switch(v5)
    {
      case 0u:
        id v6 = *(void **)a2;
        *(void *)a1 = *(void *)a2;
        *(unsigned char *)(a1 + 72) = 0;
        id v7 = v6;
        return a1;
      case 1u:
        uint64_t v11 = *(void **)a2;
        *(void *)a1 = *(void *)a2;
        *(unsigned char *)(a1 + 72) = 1;
        id v12 = v11;
        return a1;
      case 2u:
        *(_DWORD *)a1 = *(_DWORD *)a2;
        uint64_t v13 = (_OWORD *)(a1 + 8);
        unint64_t v14 = (_OWORD *)(a2 + 8);
        uint64_t v15 = *(void *)(a2 + 32);
        if (v15)
        {
          *(void *)(a1 + 32) = v15;
          (**(void (***)(_OWORD *, _OWORD *))(v15 - 8))(v13, v14);
        }
        else
        {
          long long v20 = *(_OWORD *)(a2 + 24);
          *uint64_t v13 = *v14;
          *(_OWORD *)(a1 + 24) = v20;
        }
        long long v21 = (_OWORD *)(a1 + 40);
        v22 = (_OWORD *)(a2 + 40);
        uint64_t v23 = *(void *)(a2 + 64);
        if (v23)
        {
          *(void *)(a1 + 64) = v23;
          (**(void (***)(_OWORD *, _OWORD *))(v23 - 8))(v21, v22);
        }
        else
        {
          long long v24 = *(_OWORD *)(a2 + 56);
          *long long v21 = *v22;
          *(_OWORD *)(a1 + 56) = v24;
        }
        char v18 = 2;
        goto LABEL_27;
      case 3u:
        uint64_t v17 = *(void *)a2;
        unint64_t v16 = *(void *)(a2 + 8);
        sub_22A602AFC(v17, v16);
        *(void *)a1 = v17;
        *(void *)(a1 + 8) = v16;
        char v18 = 3;
        goto LABEL_27;
      case 4u:
        uint64_t v19 = *(void *)a2;
        *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
        *(void *)a1 = v19;
        char v18 = 4;
        goto LABEL_27;
      case 5u:
        *(unsigned char *)a1 = *(unsigned char *)a2;
        char v18 = 5;
LABEL_27:
        *(unsigned char *)(a1 + 72) = v18;
        break;
      default:
        *(_OWORD *)a1 = *(_OWORD *)a2;
        long long v8 = *(_OWORD *)(a2 + 16);
        long long v9 = *(_OWORD *)(a2 + 32);
        long long v10 = *(_OWORD *)(a2 + 48);
        *(_OWORD *)(a1 + 57) = *(_OWORD *)(a2 + 57);
        *(_OWORD *)(a1 + 32) = v9;
        *(_OWORD *)(a1 + 48) = v10;
        *(_OWORD *)(a1 + 16) = v8;
        break;
    }
  }
  return a1;
}

__n128 __swift_memcpy73_8(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  __n128 result = *(__n128 *)(a2 + 16);
  long long v3 = *(_OWORD *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 57) = *(_OWORD *)(a2 + 57);
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)(a1 + 16) = result;
  return result;
}

uint64_t assignWithTake for AXTwiceCompanionState.AXTwiceCompanionEvent(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    unsigned int v4 = *(unsigned __int8 *)(a1 + 72);
    if (v4 >= 6) {
      unsigned int v4 = *(_DWORD *)a1 + 6;
    }
    switch(v4)
    {
      case 0u:
      case 1u:

        break;
      case 2u:
        if (*(void *)(a1 + 32)) {
          __swift_destroy_boxed_opaque_existential_1(a1 + 8);
        }
        if (*(void *)(a1 + 64)) {
          __swift_destroy_boxed_opaque_existential_1(a1 + 40);
        }
        break;
      case 3u:
        sub_22A602304(*(void *)a1, *(void *)(a1 + 8));
        break;
      default:
        break;
    }
    unsigned int v5 = *(unsigned __int8 *)(a2 + 72);
    if (v5 >= 6) {
      unsigned int v5 = *(_DWORD *)a2 + 6;
    }
    switch(v5)
    {
      case 0u:
        *(void *)a1 = *(void *)a2;
        *(unsigned char *)(a1 + 72) = 0;
        return a1;
      case 1u:
        *(void *)a1 = *(void *)a2;
        char v8 = 1;
        goto LABEL_21;
      case 2u:
        long long v9 = *(_OWORD *)(a2 + 48);
        *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
        *(_OWORD *)(a1 + 48) = v9;
        *(void *)(a1 + 64) = *(void *)(a2 + 64);
        long long v10 = *(_OWORD *)(a2 + 16);
        *(_OWORD *)a1 = *(_OWORD *)a2;
        *(_OWORD *)(a1 + 16) = v10;
        char v8 = 2;
        goto LABEL_21;
      case 3u:
        *(_OWORD *)a1 = *(_OWORD *)a2;
        char v8 = 3;
        goto LABEL_21;
      case 4u:
        *(void *)a1 = *(void *)a2;
        *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
        char v8 = 4;
        goto LABEL_21;
      case 5u:
        *(unsigned char *)a1 = *(unsigned char *)a2;
        char v8 = 5;
LABEL_21:
        *(unsigned char *)(a1 + 72) = v8;
        break;
      default:
        long long v6 = *(_OWORD *)(a2 + 48);
        *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
        *(_OWORD *)(a1 + 48) = v6;
        *(_OWORD *)(a1 + 57) = *(_OWORD *)(a2 + 57);
        long long v7 = *(_OWORD *)(a2 + 16);
        *(_OWORD *)a1 = *(_OWORD *)a2;
        *(_OWORD *)(a1 + 16) = v7;
        break;
    }
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for AXTwiceCompanionState.AXTwiceCompanionEvent(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFA && *(unsigned char *)(a1 + 73)) {
    return (*(_DWORD *)a1 + 250);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 72);
  if (v3 >= 7) {
    return (v3 ^ 0xFF) + 1;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for AXTwiceCompanionState.AXTwiceCompanionEvent(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xF9)
  {
    *(_OWORD *)(result + 57) = 0u;
    *(_OWORD *)(result + 32) = 0u;
    *(_OWORD *)(result + 48) = 0u;
    *(_OWORD *)__n128 result = 0u;
    *(_OWORD *)(result + 16) = 0u;
    *(_DWORD *)__n128 result = a2 - 250;
    if (a3 >= 0xFA) {
      *(unsigned char *)(result + 73) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFA) {
      *(unsigned char *)(result + 73) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 72) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_22A603290(uint64_t a1)
{
  uint64_t result = *(unsigned __int8 *)(a1 + 72);
  if (result >= 6) {
    return (*(_DWORD *)a1 + 6);
  }
  return result;
}

uint64_t sub_22A6032AC(uint64_t result, unsigned int a2)
{
  if (a2 > 5)
  {
    *(void *)(result + 64) = 0;
    *(_OWORD *)(result + 32) = 0u;
    *(_OWORD *)(result + 48) = 0u;
    *(_OWORD *)uint64_t result = 0u;
    *(_OWORD *)(result + 16) = 0u;
    *(_DWORD *)uint64_t result = a2 - 6;
    LOBYTE(a2) = 6;
  }
  *(unsigned char *)(result + 72) = a2;
  return result;
}

ValueMetadata *type metadata accessor for AXTwiceCompanionState.AXTwiceCompanionEvent()
{
  return &type metadata for AXTwiceCompanionState.AXTwiceCompanionEvent;
}

unint64_t sub_22A6032F0(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    unsigned int v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26837E0B8);
  unsigned int v2 = (void *)sub_22A60A8C0();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  unsigned int v4 = (void **)(a1 + 48);
  while (1)
  {
    uint64_t v5 = (uint64_t)*(v4 - 2);
    uint64_t v6 = (uint64_t)*(v4 - 1);
    long long v7 = *v4;
    swift_bridgeObjectRetain();
    id v8 = v7;
    unint64_t result = sub_22A6065A8(v5, v6);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v2[6] + 16 * result);
    *uint64_t v11 = v5;
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

unint64_t sub_22A60340C(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26837E0C0);
  uint64_t v2 = sub_22A60A8C0();
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
    sub_22A607174(v6, (uint64_t)v15);
    unint64_t result = sub_22A606620((uint64_t)v15);
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
    unint64_t result = (unint64_t)sub_22A6071DC(&v17, (_OWORD *)(v3[7] + 32 * result));
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

unint64_t sub_22A60353C(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26837E0D8);
  uint64_t v2 = (void *)sub_22A60A8C0();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (uint64_t *)(a1 + 56);
  while (1)
  {
    uint64_t v5 = *(v4 - 3);
    uint64_t v6 = *(v4 - 2);
    uint64_t v8 = *(v4 - 1);
    uint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t result = sub_22A6065A8(v5, v6);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    long long v11 = (uint64_t *)(v2[6] + 16 * result);
    *long long v11 = v5;
    v11[1] = v6;
    uint64_t v12 = (void *)(v2[7] + 16 * result);
    *uint64_t v12 = v8;
    v12[1] = v7;
    uint64_t v13 = v2[2];
    BOOL v14 = __OFADD__(v13, 1);
    uint64_t v15 = v13 + 1;
    if (v14) {
      goto LABEL_11;
    }
    v4 += 4;
    v2[2] = v15;
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

unint64_t sub_22A603660(uint64_t a1, uint64_t *a2)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(a2);
  uint64_t v3 = (void *)sub_22A60A8C0();
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  swift_retain();
  uint64_t v5 = (uint64_t *)(a1 + 48);
  while (1)
  {
    uint64_t v6 = *(v5 - 2);
    uint64_t v7 = *(v5 - 1);
    uint64_t v8 = *v5;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t result = sub_22A6065A8(v6, v7);
    if (v10) {
      break;
    }
    *(void *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    long long v11 = (uint64_t *)(v3[6] + 16 * result);
    *long long v11 = v6;
    v11[1] = v7;
    *(void *)(v3[7] + 8 * result) = v8;
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v3[2] = v14;
    v5 += 3;
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

unint64_t static AXTwiceRemoteScreenMessageKey.jumpstart.getter()
{
  return 0xD000000000000023;
}

unint64_t static AXTwiceRemoteScreenMessageKey.start.getter()
{
  return 0xD00000000000001FLL;
}

unint64_t static AXTwiceRemoteScreenMessageKey.axStatus.getter()
{
  return 0xD000000000000022;
}

unint64_t static AXTwiceRemoteScreenMessageKey.airplay.getter()
{
  return 0xD000000000000021;
}

unint64_t static AXTwiceRemoteScreenMessageKey.streaming.getter()
{
  return 0xD000000000000023;
}

unint64_t static AXTwiceRemoteScreenMessageKey.touchEvent.getter()
{
  return 0xD000000000000024;
}

unint64_t static AXTwiceRemoteScreenMessageKey.axTree.getter()
{
  return 0xD000000000000020;
}

unint64_t static AXTwiceRemoteScreenMessageKey.dismiss.getter()
{
  return 0xD000000000000021;
}

unint64_t static AXTwiceRemoteScreenMessageKey.reset.getter()
{
  return 0xD00000000000001FLL;
}

unint64_t static AXTwiceRemoteScreenMessageKey.ids.getter()
{
  return 0xD00000000000001DLL;
}

unint64_t static AXTwiceRemoteScreenMessageKey.systemLock.getter()
{
  return 0xD000000000000024;
}

void sub_22A6038AC()
{
  qword_26837DEE0 = 0x74736575716572;
  *(void *)algn_26837DEE8 = 0xE700000000000000;
}

uint64_t static AXTwiceRemoteScreenMessageKey.request.getter()
{
  return sub_22A603D0C(&qword_26837DBD8, &qword_26837DEE0);
}

void sub_22A6038F8()
{
  qword_26837DEF0 = 0x73736563637573;
  *(void *)algn_26837DEF8 = 0xE700000000000000;
}

uint64_t static AXTwiceRemoteScreenMessageKey.sucess.getter()
{
  return sub_22A603D0C(&qword_26837DBE0, &qword_26837DEF0);
}

void sub_22A603944()
{
  qword_26837DF00 = 0x6572756C696166;
  *(void *)algn_26837DF08 = 0xE700000000000000;
}

uint64_t static AXTwiceRemoteScreenMessageKey.failure.getter()
{
  return sub_22A603D0C(&qword_26837DBE8, &qword_26837DF00);
}

void sub_22A603990()
{
  qword_26837DF10 = 0x6F656D6954736469;
  *(void *)algn_26837DF18 = 0xEA00000000007475;
}

uint64_t static AXTwiceRemoteScreenMessageKey.idsTimeout.getter()
{
  return sub_22A603D0C(&qword_26837DBF0, &qword_26837DF10);
}

void sub_22A6039E0()
{
  qword_26837DF20 = 0x6567617373656DLL;
  qword_26837DF28 = 0xE700000000000000;
}

uint64_t static AXTwiceRemoteScreenMessageKey.idsMessage.getter()
{
  return sub_22A603D0C(&qword_26837DBF8, &qword_26837DF20);
}

void sub_22A603A2C()
{
  qword_26837DF30 = 0x696669746E656469;
  qword_26837DF38 = 0xEA00000000007265;
}

uint64_t static AXTwiceRemoteScreenMessageKey.idsMessageIdentifier.getter()
{
  return sub_22A603D0C(&qword_26837DC00, &qword_26837DF30);
}

unint64_t static AXTwiceRemoteScreenEventPayloadKey.isGeneratedEvent.getter()
{
  return 0xD000000000000010;
}

void sub_22A603A98()
{
  qword_26837DF40 = 0x69746172656E6567;
  *(void *)algn_26837DF48 = 0xEF746E756F436E6FLL;
}

uint64_t static AXTwiceRemoteScreenEventPayloadKey.generationCount.getter()
{
  return sub_22A603D0C(&qword_26837DC08, &qword_26837DF40);
}

void sub_22A603AF0()
{
  algn_26837DF58[7] = -18;
}

uint64_t static AXTwiceRemoteScreenEventPayloadKey.willUpdateMask.getter()
{
  return sub_22A603D0C(&qword_26837DC10, &qword_26837DF50);
}

void sub_22A603B48()
{
  *(_WORD *)&algn_26837DF68[6] = -4864;
}

uint64_t static AXTwiceRemoteScreenEventPayloadKey.didUpdateMask.getter()
{
  return sub_22A603D0C(&qword_26837DC18, &qword_26837DF60);
}

unint64_t static AXTwiceRemoteScreenEventPayloadKey.useOriginalHIDTime.getter()
{
  return 0xD000000000000012;
}

void sub_22A603BBC()
{
  qword_26837DF70 = 0x656D6954646968;
  *(void *)algn_26837DF78 = 0xE700000000000000;
}

uint64_t static AXTwiceRemoteScreenEventPayloadKey.hidTime.getter()
{
  return sub_22A603D0C(&qword_26837DC20, &qword_26837DF70);
}

unint64_t static AXTwiceRemoteScreenEventPayloadKey.isDisplayIntegrated.getter()
{
  return 0xD000000000000013;
}

void sub_22A603C24()
{
  qword_26837DF80 = 0x44497265646E6573;
  *(void *)algn_26837DF88 = 0xE800000000000000;
}

uint64_t static AXTwiceRemoteScreenEventPayloadKey.senderID.getter()
{
  return sub_22A603D0C(&qword_26837DC28, &qword_26837DF80);
}

void sub_22A603C70()
{
  qword_26837DF90 = 0x49747865746E6F63;
  *(void *)algn_26837DF98 = 0xE900000000000064;
}

uint64_t static AXTwiceRemoteScreenEventPayloadKey.contextId.getter()
{
  return sub_22A603D0C(&qword_26837DC30, &qword_26837DF90);
}

void sub_22A603CC0()
{
  qword_26837DFA0 = 0x6F666E49646E6168;
  *(void *)algn_26837DFA8 = 0xE800000000000000;
}

uint64_t static AXTwiceRemoteScreenEventPayloadKey.handInfo.getter()
{
  return sub_22A603D0C(&qword_26837DC38, &qword_26837DFA0);
}

uint64_t sub_22A603D0C(void *a1, uint64_t *a2)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v3 = *a2;
  swift_bridgeObjectRetain();
  return v3;
}

unint64_t static AXTwiceRemoteScreenEventPayloadKey.hidAttributeData.getter()
{
  return 0xD000000000000010;
}

id sub_22A603D7C()
{
  id result = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for AXTwiceRemoteScreenMessenger()), sel_init);
  qword_26837DFB0 = (uint64_t)result;
  return result;
}

id static AXTwiceRemoteScreenMessenger.sharedInstance.getter()
{
  if (qword_26837DC40 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)qword_26837DFB0;
  return v0;
}

uint64_t AXTwiceRemoteScreenMessenger.delegate.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC27AXWatchRemoteScreenServices28AXTwiceRemoteScreenMessenger_delegate;
  swift_beginAccess();
  return MEMORY[0x22A6CF0D0](v1);
}

uint64_t AXTwiceRemoteScreenMessenger.delegate.setter()
{
  return swift_unknownObjectRelease();
}

void (*AXTwiceRemoteScreenMessenger.delegate.modify(void *a1))(void **a1, char a2)
{
  uint64_t v3 = malloc(0x30uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR____TtC27AXWatchRemoteScreenServices28AXTwiceRemoteScreenMessenger_delegate;
  v3[4] = v1;
  void v3[5] = v4;
  uint64_t v5 = v1 + v4;
  swift_beginAccess();
  v3[3] = MEMORY[0x22A6CF0D0](v5);
  return sub_22A604040;
}

void sub_22A604040(void **a1, char a2)
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

id AXTwiceRemoteScreenMessenger.__deallocating_deinit()
{
  ObjectType = (objc_class *)swift_getObjectType();
  id result = objc_msgSend(self, sel_sharedInstance);
  if (result)
  {
    uint64_t v3 = result;
    objc_msgSend(result, sel_deregisterForIncomingData_, v0);

    v4.receiver = v0;
    v4.super_class = ObjectType;
    return objc_msgSendSuper2(&v4, sel_dealloc);
  }
  else
  {
    __break(1u);
  }
  return result;
}

Swift::Void __swiftcall AXTwiceRemoteScreenMessenger.cleanup()()
{
  id v1 = objc_msgSend(self, sel_sharedInstance);
  if (v1)
  {
    id v2 = v1;
    objc_msgSend(v1, sel_deregisterForIncomingData_, v0);
  }
  else
  {
    __break(1u);
  }
}

Swift::Void __swiftcall AXTwiceRemoteScreenMessenger.reconnectToAXUIServerIfNeeded()()
{
  id v1 = self;
  id v2 = objc_msgSend(v1, sel_sharedInstance);
  if (!v2)
  {
    __break(1u);
    goto LABEL_13;
  }
  uint64_t v3 = v2;
  unsigned __int8 v4 = objc_msgSend(v2, sel_containsClient_, v0);

  if (v4) {
    return;
  }
  id v5 = objc_msgSend(v1, sel_sharedInstance);
  if (!v5)
  {
LABEL_13:
    __break(1u);
    return;
  }
  uint64_t v6 = v5;
  objc_msgSend(v5, sel_registerForIncomingData_, v0);

  if (qword_26AF64F60 != -1) {
    swift_once();
  }
  uint64_t v7 = sub_22A60A670();
  __swift_project_value_buffer(v7, (uint64_t)qword_26AF64F68);
  oslog = sub_22A60A650();
  os_log_type_t v8 = sub_22A60A7C0();
  if (os_log_type_enabled(oslog, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    uint64_t v10 = swift_slowAlloc();
    uint64_t v12 = v10;
    *(_DWORD *)uint64_t v9 = 136315138;
    sub_22A605FB8(0xD00000000000001FLL, 0x800000022A60C090, &v12);
    sub_22A60A800();
    _os_log_impl(&dword_22A5FC000, oslog, v8, "[TWICE] %s", v9, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x22A6CF070](v10, -1, -1);
    MEMORY[0x22A6CF070](v9, -1, -1);
  }
  else
  {
  }
}

Swift::Bool __swiftcall AXTwiceRemoteScreenMessenger.isDeviceConnected()()
{
  id v0 = objc_msgSend(self, sel_sharedInstance);
  if (!v0)
  {
    __break(1u);
    return (char)v0;
  }
  id v1 = v0;
  id v2 = objc_msgSend(v0, sel_connectedDevices);

  if (!v2
    || (__swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26837DFC0),
        uint64_t v3 = sub_22A60A780(),
        v2,
        uint64_t v4 = sub_22A604758(v3),
        swift_bridgeObjectRelease(),
        !v4))
  {
    char v6 = 0;
    goto LABEL_9;
  }
  uint64_t v5 = *(void *)(v4 + 16);
  if (!v5 || _AXSTwiceRemoteScreenPlatform())
  {
LABEL_6:
    char v6 = 0;
    goto LABEL_7;
  }
  uint64_t v7 = (uint64_t *)(v4 + 32);
  while (1)
  {
    uint64_t v8 = *v7;
    uint64_t v9 = sub_22A60A6C0();
    uint64_t v11 = v10;
    if (*(void *)(v8 + 16)) {
      break;
    }
LABEL_11:
    swift_bridgeObjectRelease();
LABEL_12:
    ++v7;
    if (!--v5) {
      goto LABEL_6;
    }
  }
  uint64_t v12 = v9;
  swift_bridgeObjectRetain();
  sub_22A6065A8(v12, v11);
  if ((v13 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    goto LABEL_11;
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (qword_26837DC48 != -1) {
    swift_once();
  }
  char v14 = _s27AXWatchRemoteScreenServices08AXDevicebC4UtilC22isPairedGizmoSupported8deviceIDSbSS_tF_0();
  swift_bridgeObjectRelease();
  if ((v14 & 1) == 0) {
    goto LABEL_12;
  }
  char v6 = 1;
LABEL_7:
  swift_bridgeObjectRelease();
LABEL_9:
  LOBYTE(v0) = v6;
  return (char)v0;
}

uint64_t sub_22A604758(uint64_t a1)
{
  int64_t v2 = *(void *)(a1 + 16);
  uint64_t v9 = MEMORY[0x263F8EE78];
  sub_22A606810(0, v2, 0);
  uint64_t v3 = v9;
  if (v2)
  {
    for (uint64_t i = a1 + 32; ; i += 8)
    {
      swift_bridgeObjectRetain();
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26837DFC0);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26837E108);
      if (!swift_dynamicCast()) {
        break;
      }
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_22A606810(0, *(void *)(v3 + 16) + 1, 1);
        uint64_t v3 = v9;
      }
      unint64_t v6 = *(void *)(v3 + 16);
      unint64_t v5 = *(void *)(v3 + 24);
      if (v6 >= v5 >> 1)
      {
        sub_22A606810(v5 > 1, v6 + 1, 1);
        uint64_t v3 = v9;
      }
      *(void *)(v3 + 16) = v6 + 1;
      *(void *)(v3 + 8 * v6 + 32) = v8;
      if (!--v2) {
        return v3;
      }
    }
    swift_release();
    swift_bridgeObjectRelease();
    return 0;
  }
  return v3;
}

void AXTwiceRemoteScreenMessenger.sendData(_:)()
{
  id v0 = objc_msgSend(self, sel_sharedInstance);
  if (v0)
  {
    id v1 = v0;
    id v2 = (id)sub_22A60A5C0();
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_22A604954(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26837E0C0);
    uint64_t v2 = sub_22A60A8C0();
  }
  else
  {
    uint64_t v2 = MEMORY[0x263F8EE80];
  }
  uint64_t v27 = a1 + 64;
  uint64_t v3 = -1 << *(unsigned char *)(a1 + 32);
  if (-v3 < 64) {
    uint64_t v4 = ~(-1 << -(char)v3);
  }
  else {
    uint64_t v4 = -1;
  }
  unint64_t v5 = v4 & *(void *)(a1 + 64);
  int64_t v26 = (unint64_t)(63 - v3) >> 6;
  uint64_t v6 = v2 + 64;
  swift_bridgeObjectRetain();
  uint64_t result = swift_retain();
  int64_t v8 = 0;
  while (1)
  {
    if (v5)
    {
      unint64_t v11 = __clz(__rbit64(v5));
      v5 &= v5 - 1;
      unint64_t v12 = v11 | (v8 << 6);
      goto LABEL_28;
    }
    int64_t v13 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    if (v13 >= v26) {
      goto LABEL_37;
    }
    unint64_t v14 = *(void *)(v27 + 8 * v13);
    int64_t v15 = v8 + 1;
    if (!v14)
    {
      int64_t v15 = v8 + 2;
      if (v8 + 2 >= v26) {
        goto LABEL_37;
      }
      unint64_t v14 = *(void *)(v27 + 8 * v15);
      if (!v14)
      {
        int64_t v15 = v8 + 3;
        if (v8 + 3 >= v26) {
          goto LABEL_37;
        }
        unint64_t v14 = *(void *)(v27 + 8 * v15);
        if (!v14)
        {
          int64_t v15 = v8 + 4;
          if (v8 + 4 >= v26) {
            goto LABEL_37;
          }
          unint64_t v14 = *(void *)(v27 + 8 * v15);
          if (!v14) {
            break;
          }
        }
      }
    }
LABEL_27:
    unint64_t v5 = (v14 - 1) & v14;
    unint64_t v12 = __clz(__rbit64(v14)) + (v15 << 6);
    int64_t v8 = v15;
LABEL_28:
    long long v17 = (void *)(*(void *)(a1 + 48) + 16 * v12);
    uint64_t v18 = v17[1];
    *(void *)&v36[0] = *v17;
    *((void *)&v36[0] + 1) = v18;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26837DFC0);
    swift_dynamicCast();
    long long v32 = v28;
    long long v33 = v29;
    uint64_t v34 = v30;
    sub_22A6071DC(&v31, v35);
    long long v28 = v32;
    long long v29 = v33;
    uint64_t v30 = v34;
    sub_22A6071DC(v35, v36);
    sub_22A6071DC(v36, &v32);
    uint64_t result = sub_22A60A840();
    uint64_t v19 = -1 << *(unsigned char *)(v2 + 32);
    unint64_t v20 = result & ~v19;
    unint64_t v21 = v20 >> 6;
    if (((-1 << v20) & ~*(void *)(v6 + 8 * (v20 >> 6))) != 0)
    {
      unint64_t v9 = __clz(__rbit64((-1 << v20) & ~*(void *)(v6 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v22 = 0;
      unint64_t v23 = (unint64_t)(63 - v19) >> 6;
      do
      {
        if (++v21 == v23 && (v22 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        BOOL v24 = v21 == v23;
        if (v21 == v23) {
          unint64_t v21 = 0;
        }
        v22 |= v24;
        uint64_t v25 = *(void *)(v6 + 8 * v21);
      }
      while (v25 == -1);
      unint64_t v9 = __clz(__rbit64(~v25)) + (v21 << 6);
    }
    *(void *)(v6 + ((v9 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v9;
    uint64_t v10 = *(void *)(v2 + 48) + 40 * v9;
    *(_OWORD *)uint64_t v10 = v28;
    *(_OWORD *)(v10 + 16) = v29;
    *(void *)(v10 + 32) = v30;
    uint64_t result = (uint64_t)sub_22A6071DC(&v32, (_OWORD *)(*(void *)(v2 + 56) + 32 * v9));
    ++*(void *)(v2 + 16);
  }
  int64_t v16 = v8 + 5;
  if (v8 + 5 >= v26)
  {
LABEL_37:
    swift_release();
    sub_22A6072A4();
    return v2;
  }
  unint64_t v14 = *(void *)(v27 + 8 * v16);
  if (v14)
  {
    int64_t v15 = v8 + 5;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v15 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v15 >= v26) {
      goto LABEL_37;
    }
    unint64_t v14 = *(void *)(v27 + 8 * v15);
    ++v16;
    if (v14) {
      goto LABEL_27;
    }
  }
LABEL_39:
  __break(1u);
  return result;
}

unint64_t sub_22A604D0C(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26837E0F0);
    uint64_t v2 = (void *)sub_22A60A8C0();
  }
  else
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
  }
  uint64_t v23 = a1 + 64;
  uint64_t v3 = -1;
  uint64_t v4 = -1 << *(unsigned char *)(a1 + 32);
  if (-v4 < 64) {
    uint64_t v3 = ~(-1 << -(char)v4);
  }
  unint64_t v5 = v3 & *(void *)(a1 + 64);
  int64_t v22 = (unint64_t)(63 - v4) >> 6;
  unint64_t result = swift_bridgeObjectRetain();
  int64_t v7 = 0;
  if (v5) {
    goto LABEL_9;
  }
LABEL_10:
  int64_t v13 = v7 + 1;
  if (__OFADD__(v7, 1)) {
    goto LABEL_40;
  }
  if (v13 >= v22) {
    goto LABEL_36;
  }
  unint64_t v14 = *(void *)(v23 + 8 * v13);
  int64_t v12 = v7 + 1;
  if (!v14)
  {
    int64_t v12 = v7 + 2;
    if (v7 + 2 >= v22) {
      goto LABEL_36;
    }
    unint64_t v14 = *(void *)(v23 + 8 * v12);
    if (!v14)
    {
      int64_t v12 = v7 + 3;
      if (v7 + 3 >= v22) {
        goto LABEL_36;
      }
      unint64_t v14 = *(void *)(v23 + 8 * v12);
      if (!v14)
      {
        int64_t v12 = v7 + 4;
        if (v7 + 4 >= v22) {
          goto LABEL_36;
        }
        unint64_t v14 = *(void *)(v23 + 8 * v12);
        if (!v14)
        {
          int64_t v15 = v7 + 5;
          if (v7 + 5 < v22)
          {
            unint64_t v14 = *(void *)(v23 + 8 * v15);
            if (v14)
            {
              int64_t v12 = v7 + 5;
              goto LABEL_25;
            }
            while (1)
            {
              int64_t v12 = v15 + 1;
              if (__OFADD__(v15, 1)) {
                goto LABEL_41;
              }
              if (v12 >= v22) {
                break;
              }
              unint64_t v14 = *(void *)(v23 + 8 * v12);
              ++v15;
              if (v14) {
                goto LABEL_25;
              }
            }
          }
LABEL_36:
          sub_22A6072A4();
          return (unint64_t)v2;
        }
      }
    }
  }
LABEL_25:
  uint64_t v10 = (v14 - 1) & v14;
  unint64_t v11 = __clz(__rbit64(v14)) + (v12 << 6);
  while (1)
  {
    sub_22A6071EC(*(void *)(a1 + 48) + 40 * v11, (uint64_t)v30);
    sub_22A606FFC(*(void *)(a1 + 56) + 32 * v11, (uint64_t)v31 + 8);
    v28[0] = v31[0];
    v28[1] = v31[1];
    uint64_t v29 = v32;
    v27[0] = v30[0];
    v27[1] = v30[1];
    sub_22A6071EC((uint64_t)v27, (uint64_t)v26);
    if (!swift_dynamicCast())
    {
      sub_22A607248((uint64_t)v27, &qword_26837E0F8);
      swift_bridgeObjectRelease();
LABEL_35:
      sub_22A6072A4();
      swift_release();
      return 0;
    }
    sub_22A606FFC((uint64_t)v28 + 8, (uint64_t)v26);
    sub_22A607248((uint64_t)v27, &qword_26837E0F8);
    if ((swift_dynamicCast() & 1) == 0)
    {
      swift_bridgeObjectRelease();
      swift_unknownObjectRelease();
      goto LABEL_35;
    }
    unint64_t v5 = v10;
    unint64_t result = sub_22A6065A8(v24, v25);
    unint64_t v16 = result;
    if (v17)
    {
      int64_t v8 = (uint64_t *)(v2[6] + 16 * result);
      swift_bridgeObjectRelease();
      *int64_t v8 = v24;
      v8[1] = v25;
      uint64_t v9 = v2[7];
      unint64_t result = swift_unknownObjectRelease();
      *(void *)(v9 + 8 * v16) = v24;
      int64_t v7 = v12;
      if (!v10) {
        goto LABEL_10;
      }
      goto LABEL_9;
    }
    if (v2[2] >= v2[3]) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v18 = (uint64_t *)(v2[6] + 16 * result);
    *uint64_t v18 = v24;
    v18[1] = v25;
    *(void *)(v2[7] + 8 * result) = v24;
    uint64_t v19 = v2[2];
    BOOL v20 = __OFADD__(v19, 1);
    uint64_t v21 = v19 + 1;
    if (v20) {
      goto LABEL_39;
    }
    v2[2] = v21;
    int64_t v7 = v12;
    if (!v10) {
      goto LABEL_10;
    }
LABEL_9:
    uint64_t v10 = (v5 - 1) & v5;
    unint64_t v11 = __clz(__rbit64(v5)) | (v7 << 6);
    int64_t v12 = v7;
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

Swift::Void __swiftcall AXTwiceRemoteScreenMessenger.receiveMessage(_:)(Swift::OpaquePointer a1)
{
  uint64_t v2 = v1;
  uint64_t v27 = sub_22A60A6C0();
  sub_22A60A860();
  if (*((void *)a1._rawValue + 2) && (unint64_t v4 = sub_22A606620((uint64_t)v30), (v5 & 1) != 0))
  {
    sub_22A606FFC(*((void *)a1._rawValue + 7) + 32 * v4, (uint64_t)&v31);
  }
  else
  {
    long long v31 = 0u;
    long long v32 = 0u;
  }
  sub_22A606FA8((uint64_t)v30);
  if (!*((void *)&v32 + 1)) {
    goto LABEL_17;
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26837DFC0);
  if ((swift_dynamicCast() & 1) == 0) {
    goto LABEL_18;
  }
  sub_22A60A860();
  if (*(void *)(v27 + 16) && (unint64_t v6 = sub_22A606620((uint64_t)v30), (v7 & 1) != 0))
  {
    sub_22A606FFC(*(void *)(v27 + 56) + 32 * v6, (uint64_t)&v31);
  }
  else
  {
    long long v31 = 0u;
    long long v32 = 0u;
  }
  swift_bridgeObjectRelease();
  sub_22A606FA8((uint64_t)v30);
  if (!*((void *)&v32 + 1))
  {
LABEL_17:
    sub_22A607248((uint64_t)&v31, &qword_26837DEC0);
    goto LABEL_18;
  }
  if (swift_dynamicCast())
  {
    if (qword_26AF64F60 != -1) {
      swift_once();
    }
    uint64_t v8 = sub_22A60A670();
    __swift_project_value_buffer(v8, (uint64_t)qword_26AF64F68);
    swift_bridgeObjectRetain_n();
    uint64_t v9 = sub_22A60A650();
    os_log_type_t v10 = sub_22A60A7C0();
    if (os_log_type_enabled(v9, v10))
    {
      unint64_t v11 = (uint8_t *)swift_slowAlloc();
      uint64_t v12 = swift_slowAlloc();
      v30[0] = v12;
      *(_DWORD *)unint64_t v11 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v13 = sub_22A60A6A0();
      unint64_t v15 = v14;
      swift_bridgeObjectRelease();
      *(void *)&long long v31 = sub_22A605FB8(v13, v15, v30);
      sub_22A60A800();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_22A5FC000, v9, v10, "[TWICE] Receive message: %s", v11, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x22A6CF070](v12, -1, -1);
      MEMORY[0x22A6CF070](v11, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    uint64_t v25 = v2 + OBJC_IVAR____TtC27AXWatchRemoteScreenServices28AXTwiceRemoteScreenMessenger_delegate;
    swift_beginAccess();
    uint64_t v26 = MEMORY[0x22A6CF0D0](v25);
    if (v26)
    {
      uint64_t v23 = (void *)v26;
      uint64_t v24 = (void *)sub_22A60A680();
      swift_bridgeObjectRelease();
      goto LABEL_34;
    }
    swift_bridgeObjectRelease();
    return;
  }
LABEL_18:
  uint64_t v28 = sub_22A60A6C0();
  unint64_t v29 = v16;
  sub_22A60A860();
  if (*((void *)a1._rawValue + 2) && (unint64_t v17 = sub_22A606620((uint64_t)v30), (v18 & 1) != 0))
  {
    sub_22A606FFC(*((void *)a1._rawValue + 7) + 32 * v17, (uint64_t)&v31);
  }
  else
  {
    long long v31 = 0u;
    long long v32 = 0u;
  }
  sub_22A606FA8((uint64_t)v30);
  if (!*((void *)&v32 + 1))
  {
    sub_22A607248((uint64_t)&v31, &qword_26837DEC0);
LABEL_26:
    sub_22A60A6C0();
    sub_22A60A860();
    if (*((void *)a1._rawValue + 2) && (unint64_t v19 = sub_22A606620((uint64_t)v30), (v20 & 1) != 0))
    {
      sub_22A606FFC(*((void *)a1._rawValue + 7) + 32 * v19, (uint64_t)&v31);
    }
    else
    {
      long long v31 = 0u;
      long long v32 = 0u;
    }
    sub_22A606FA8((uint64_t)v30);
    if (!*((void *)&v32 + 1))
    {
      sub_22A607248((uint64_t)&v31, &qword_26837DEC0);
      return;
    }
    if (!swift_dynamicCast()) {
      return;
    }
    goto LABEL_32;
  }
  if ((swift_dynamicCast() & 1) == 0) {
    goto LABEL_26;
  }
  sub_22A602304(v28, v29);
LABEL_32:
  uint64_t v21 = v1 + OBJC_IVAR____TtC27AXWatchRemoteScreenServices28AXTwiceRemoteScreenMessenger_delegate;
  swift_beginAccess();
  uint64_t v22 = MEMORY[0x22A6CF0D0](v21);
  if (v22)
  {
    uint64_t v23 = (void *)v22;
    uint64_t v24 = (void *)sub_22A60A680();
LABEL_34:
    objc_msgSend(v23, sel_twiceRemoteScreenReceiveMessage_, v24);

    swift_unknownObjectRelease();
  }
}

Swift::Void __swiftcall AXTwiceRemoteScreenMessenger.didReceiveIncomingData(_:)(Swift::OpaquePointer_optional a1)
{
  if (a1.value._rawValue) {
    AXTwiceRemoteScreenMessenger.receiveMessage(_:)(a1.value);
  }
  else {
    __break(1u);
  }
}

Swift::Void __swiftcall AXTwiceRemoteScreenMessenger.connectedDevicesDidChange(_:)(Swift::OpaquePointer_optional a1)
{
  uint64_t v2 = v1;
  rawValue = a1.value._rawValue;
  if (qword_26AF64F60 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_22A60A670();
  uint64_t v5 = __swift_project_value_buffer(v4, (uint64_t)qword_26AF64F68);
  uint64_t v6 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v5, v5);
  uint64_t v8 = (char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v6 + 16))(v8);
  swift_bridgeObjectRetain_n();
  uint64_t v9 = sub_22A60A650();
  int v10 = sub_22A60A7B0();
  if (os_log_type_enabled(v9, (os_log_type_t)v10))
  {
    int v26 = v10;
    uint64_t v27 = &v24;
    *(void *)&long long v28 = v2;
    uint64_t v11 = swift_slowAlloc();
    uint64_t v25 = swift_slowAlloc();
    v30[0] = v25;
    *(_DWORD *)uint64_t v11 = 136315394;
    uint64_t v29 = sub_22A605FB8(0xD00000000000001DLL, 0x800000022A60C0D0, v30);
    sub_22A60A800();
    *(_WORD *)(v11 + 12) = 2080;
    if (rawValue)
    {
      swift_bridgeObjectRetain();
      uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26837DFC0);
      uint64_t v13 = MEMORY[0x22A6CE990](rawValue, v12);
      unint64_t v15 = v14;
      swift_bridgeObjectRelease();
      uint64_t v29 = sub_22A605FB8(v13, v15, v30);
      sub_22A60A800();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_22A5FC000, v9, (os_log_type_t)v26, "[TWICE] %s %s", (uint8_t *)v11, 0x16u);
      uint64_t v16 = v25;
      swift_arrayDestroy();
      MEMORY[0x22A6CF070](v16, -1, -1);
      MEMORY[0x22A6CF070](v11, -1, -1);

      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v4);
      goto LABEL_7;
    }
    __break(1u);
LABEL_13:
    __break(1u);
    return;
  }

  swift_bridgeObjectRelease_n();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v4);
  if (!rawValue) {
    goto LABEL_13;
  }
LABEL_7:
  if (!rawValue[2])
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26837DFD0);
    uint64_t inited = swift_initStackObject();
    long long v28 = xmmword_22A60B180;
    *(_OWORD *)(inited + 16) = xmmword_22A60B180;
    *(void *)(inited + 32) = 0xD00000000000001ALL;
    *(void *)(inited + 40) = 0x800000022A60C0B0;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26837DFD8);
    uint64_t v18 = swift_initStackObject();
    *(_OWORD *)(v18 + 16) = v28;
    *(void *)(v18 + 32) = 0xD00000000000001DLL;
    *(void *)(v18 + 40) = 0x800000022A60BFC0;
    if (qword_26837DBE8 != -1) {
      swift_once();
    }
    uint64_t v19 = *(void *)algn_26837DF08;
    *(void *)(v18 + 48) = qword_26837DF00;
    *(void *)(v18 + 56) = v19;
    swift_bridgeObjectRetain();
    *(void *)(inited + 48) = sub_22A60353C(v18);
    unint64_t v20 = sub_22A603660(inited, &qword_26837E0D0);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26837DFE0);
    uint64_t v21 = swift_initStackObject();
    *(_OWORD *)(v21 + 16) = v28;
    v30[0] = sub_22A60A6C0();
    v30[1] = v22;
    sub_22A60A860();
    *(void *)(v21 + 96) = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26837DFE8);
    *(void *)(v21 + 72) = v20;
    unint64_t v23 = sub_22A60340C(v21);
    AXTwiceRemoteScreenMessenger.receiveMessage(_:)((Swift::OpaquePointer)v23);
    swift_bridgeObjectRelease();
  }
}

Swift::Void __swiftcall AXTwiceRemoteScreenMessenger.serverConnectionWasInterrupted()()
{
  if (qword_26AF64F60 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_22A60A670();
  __swift_project_value_buffer(v0, (uint64_t)qword_26AF64F68);
  uint64_t v1 = sub_22A60A650();
  os_log_type_t v2 = sub_22A60A7B0();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    uint64_t v4 = swift_slowAlloc();
    uint64_t v5 = v4;
    *(_DWORD *)uint64_t v3 = 136315138;
    sub_22A605FB8(0xD000000000000020, 0x800000022A60C0F0, &v5);
    sub_22A60A800();
    _os_log_impl(&dword_22A5FC000, v1, v2, "[TWICE] %s", v3, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x22A6CF070](v4, -1, -1);
    MEMORY[0x22A6CF070](v3, -1, -1);
  }

  if (_AXSTwiceRemoteScreenEnabled()) {
    AXTwiceRemoteScreenMessenger.reconnectToAXUIServerIfNeeded()();
  }
}

uint64_t sub_22A605FB8(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_22A60608C(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_22A606FFC((uint64_t)v12, *a3);
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
      sub_22A606FFC((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_22A60608C(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_22A60A810();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_22A606248(a5, a6);
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
  uint64_t v8 = sub_22A60A890();
  if (!v8)
  {
    sub_22A60A8B0();
    __break(1u);
LABEL_17:
    uint64_t result = sub_22A60A8D0();
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

uint64_t sub_22A606248(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_22A6062E0(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_22A606458(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_22A606458(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_22A6062E0(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_22A608648(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_22A60A880();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_22A60A8B0();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_22A60A700();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_22A60A8D0();
    __break(1u);
LABEL_14:
    uint64_t result = sub_22A60A8B0();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

uint64_t sub_22A606458(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AF64F28);
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
  uint64_t result = sub_22A60A8D0();
  __break(1u);
  return result;
}

unint64_t sub_22A6065A8(uint64_t a1, uint64_t a2)
{
  sub_22A60A950();
  sub_22A60A6E0();
  uint64_t v4 = sub_22A60A970();
  return sub_22A606664(a1, a2, v4);
}

unint64_t sub_22A606620(uint64_t a1)
{
  uint64_t v2 = sub_22A60A840();
  return sub_22A606748(a1, v2);
}

unint64_t sub_22A606664(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_22A60A900() & 1) == 0)
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
      while (!v14 && (sub_22A60A900() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_22A606748(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v6 = ~v3;
    do
    {
      sub_22A6071EC(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      char v7 = MEMORY[0x22A6CEA50](v9, a1);
      sub_22A606FA8((uint64_t)v9);
      if (v7) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v6;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

uint64_t sub_22A606810(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_22A606830(a1, a2, a3, (void *)*v3);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_22A606830(char a1, int64_t a2, char a3, void *a4)
{
  if (a3)
  {
    unint64_t v6 = a4[3];
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
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26837E110);
    uint64_t v10 = (void *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 25;
    }
    v10[2] = v8;
    v10[3] = 2 * (v12 >> 3);
  }
  else
  {
    uint64_t v10 = (void *)MEMORY[0x263F8EE78];
  }
  unint64_t v13 = (unint64_t)(v10 + 4);
  unint64_t v14 = (unint64_t)(a4 + 4);
  if (a1)
  {
    if (v10 != a4 || v13 >= v14 + 8 * v8) {
      memmove(v10 + 4, a4 + 4, 8 * v8);
    }
    a4[2] = 0;
    goto LABEL_30;
  }
  if (v14 >= v13 + 8 * v8 || v13 >= v14 + 8 * v8)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26837E108);
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_22A60A8D0();
  __break(1u);
  return result;
}

id _s27AXWatchRemoteScreenServices07AXTwicebC9MessengerC11sendMessageySSSgSDys11AnyHashableVypGF_0(uint64_t a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26837E0E0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_22A60B180;
  *(void *)(inited + 32) = 0xD00000000000001ALL;
  *(void *)(inited + 40) = 0x800000022A60C0B0;
  *(void *)(inited + 48) = a1;
  swift_bridgeObjectRetain();
  unint64_t v3 = sub_22A603660(inited, &qword_26837E100);
  id result = objc_msgSend(self, sel_sharedInstance);
  if (!result)
  {
    __break(1u);
    return result;
  }
  uint64_t v5 = result;
  sub_22A604954(v3);
  swift_bridgeObjectRelease();
  uint64_t v6 = MEMORY[0x263F8EE58];
  int64_t v7 = (void *)sub_22A60A680();
  swift_bridgeObjectRelease();
  id v8 = objc_msgSend(v5, sel_publishDirectIDSMessage_, v7);

  if (v8)
  {
    uint64_t v9 = sub_22A60A690();

    unint64_t v10 = sub_22A604D0C(v9);
    swift_bridgeObjectRelease();
    if (v10)
    {
      if (qword_26837DBF8 == -1)
      {
        if (!*(void *)(v10 + 16)) {
          goto LABEL_19;
        }
      }
      else
      {
        swift_once();
        if (!*(void *)(v10 + 16)) {
          goto LABEL_19;
        }
      }
      uint64_t v11 = qword_26837DF28;
      uint64_t v12 = qword_26837DF20;
      swift_bridgeObjectRetain();
      unint64_t v13 = sub_22A6065A8(v12, v11);
      if ((v14 & 1) == 0)
      {
LABEL_18:
        swift_bridgeObjectRelease();
        goto LABEL_19;
      }
      uint64_t v15 = *(void *)(*(void *)(v10 + 56) + 8 * v13);
      swift_unknownObjectRetain();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v45[0] = v15;
      __swift_instantiateConcreteTypeFromMangledName(&qword_26837E0E8);
      if (swift_dynamicCast())
      {
        if (qword_26837DC00 != -1)
        {
          swift_once();
          if (!*(void *)(v46 + 16)) {
            goto LABEL_19;
          }
          goto LABEL_10;
        }
        if (*(void *)(v46 + 16))
        {
LABEL_10:
          uint64_t v16 = qword_26837DF38;
          uint64_t v17 = qword_26837DF30;
          swift_bridgeObjectRetain();
          unint64_t v18 = sub_22A6065A8(v17, v16);
          if (v19)
          {
            uint64_t v20 = *(void *)(*(void *)(v46 + 56) + 8 * v18);
            swift_unknownObjectRetain();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            uint64_t v46 = v20;
            int v21 = swift_dynamicCast();
            if (v21) {
              uint64_t v22 = v45[0];
            }
            else {
              uint64_t v22 = 0;
            }
            if (v21) {
              id v8 = (id)v45[1];
            }
            else {
              id v8 = 0;
            }
            goto LABEL_21;
          }
          goto LABEL_18;
        }
LABEL_19:
        swift_bridgeObjectRelease();
      }
    }
    uint64_t v22 = 0;
    id v8 = 0;
    goto LABEL_21;
  }
  uint64_t v22 = 0;
LABEL_21:
  if (qword_26AF64F60 != -1) {
    swift_once();
  }
  uint64_t v23 = sub_22A60A670();
  uint64_t v24 = __swift_project_value_buffer(v23, (uint64_t)qword_26AF64F68);
  uint64_t v25 = *(void *)(v23 - 8);
  MEMORY[0x270FA5388](v24, v24);
  uint64_t v27 = (char *)&v41 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v25 + 16))(v27);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  long long v28 = sub_22A60A650();
  os_log_type_t v29 = sub_22A60A7C0();
  int v30 = v29;
  if (os_log_type_enabled(v28, v29))
  {
    uint64_t v31 = swift_slowAlloc();
    int v43 = v30;
    uint64_t v32 = v31;
    uint64_t v33 = swift_slowAlloc();
    uint64_t v42 = v33;
    *(_DWORD *)uint64_t v32 = 136315394;
    uint64_t v44 = v22;
    v45[0] = v33;
    swift_bridgeObjectRetain();
    uint64_t v41 = v6 + 8;
    uint64_t v34 = sub_22A60A6A0();
    unint64_t v36 = v35;
    swift_bridgeObjectRelease();
    uint64_t v46 = sub_22A605FB8(v34, v36, v45);
    sub_22A60A800();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v32 + 12) = 2080;
    if (v8) {
      uint64_t v37 = v44;
    }
    else {
      uint64_t v37 = 0x6E776F6E6B6E75;
    }
    if (v8) {
      unint64_t v38 = (unint64_t)v8;
    }
    else {
      unint64_t v38 = 0xE700000000000000;
    }
    swift_bridgeObjectRetain();
    uint64_t v39 = v37;
    uint64_t v22 = v44;
    uint64_t v46 = sub_22A605FB8(v39, v38, v45);
    sub_22A60A800();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_22A5FC000, v28, (os_log_type_t)v43, "[TWICE] Publish message: %s, with identifier %s", (uint8_t *)v32, 0x16u);
    uint64_t v40 = v42;
    swift_arrayDestroy();
    MEMORY[0x22A6CF070](v40, -1, -1);
    MEMORY[0x22A6CF070](v32, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
  }
  (*(void (**)(char *, uint64_t))(v25 + 8))(v27, v23);
  return (id)v22;
}

uint64_t sub_22A606FA8(uint64_t a1)
{
  return a1;
}

uint64_t sub_22A606FFC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_22A607058@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = *a1 + OBJC_IVAR____TtC27AXWatchRemoteScreenServices28AXTwiceRemoteScreenMessenger_delegate;
  swift_beginAccess();
  uint64_t result = MEMORY[0x22A6CF0D0](v3);
  *a2 = result;
  return result;
}

uint64_t sub_22A6070B0()
{
  return swift_unknownObjectWeakAssign();
}

ValueMetadata *type metadata accessor for AXTwiceRemoteScreenMessageKey()
{
  return &type metadata for AXTwiceRemoteScreenMessageKey;
}

ValueMetadata *type metadata accessor for AXTwiceRemoteScreenEventPayloadKey()
{
  return &type metadata for AXTwiceRemoteScreenEventPayloadKey;
}

uint64_t type metadata accessor for AXTwiceRemoteScreenMessenger()
{
  return self;
}

uint64_t sub_22A60714C(uint64_t a1)
{
  return a1;
}

uint64_t sub_22A607174(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26837E0C8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

_OWORD *sub_22A6071DC(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_22A6071EC(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_22A607248(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_22A6072A4()
{
  return swift_release();
}

id sub_22A6072B4()
{
  id result = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for AXDeviceRemoteScreenUtil()), sel_init);
  qword_26837E118 = (uint64_t)result;
  return result;
}

id AXDeviceRemoteScreenUtil.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

id static AXDeviceRemoteScreenUtil.sharedInstance.getter()
{
  if (qword_26837DC48 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)qword_26837E118;
  return v0;
}

void sub_22A6073D0()
{
  *(_WORD *)&algn_26837E128[6] = -4864;
}

uint64_t static AXDeviceRemoteScreenUtil.AXWatchRemoteScreenFeatureDomain.getter()
{
  if (qword_26837DC50 != -1) {
    swift_once();
  }
  uint64_t v0 = qword_26837E120;
  swift_bridgeObjectRetain();
  return v0;
}

unint64_t static AXDeviceRemoteScreenUtil.AXWatchRemoteScreenFeatureKey.getter()
{
  return 0xD000000000000012;
}

uint64_t AXDeviceRemoteScreenUtil.caSessionIntervalEvent.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR___AXDeviceRemoteScreenUtil_caSessionIntervalEvent);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t AXDeviceRemoteScreenUtil.caSessionIntervalKey.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR___AXDeviceRemoteScreenUtil_caSessionIntervalKey);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t AXDeviceRemoteScreenUtil.caErrorEvent.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR___AXDeviceRemoteScreenUtil_caErrorEvent);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t AXDeviceRemoteScreenUtil.caErrorKey.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR___AXDeviceRemoteScreenUtil_caErrorKey);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t AXDeviceRemoteScreenUtil.caInactiveEvent.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR___AXDeviceRemoteScreenUtil_caInactiveEvent);
  swift_bridgeObjectRetain();
  return v1;
}

id sub_22A6076C4()
{
  swift_bridgeObjectRetain();
  uint64_t v0 = (void *)sub_22A60A6B0();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t AXDeviceRemoteScreenUtil.caInactiveKey.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR___AXDeviceRemoteScreenUtil_caInactiveKey);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_22A60775C()
{
  return 1;
}

uint64_t sub_22A607764()
{
  return sub_22A60A970();
}

uint64_t sub_22A6077A8()
{
  return sub_22A60A960();
}

uint64_t sub_22A6077D0()
{
  return sub_22A60A970();
}

const char *sub_22A607810()
{
  return "Accessibility";
}

const char *sub_22A607824()
{
  return "Twice_RemoteScreen";
}

Swift::Bool __swiftcall AXDeviceRemoteScreenUtil.isTwiceFeatureOn()()
{
  uint64_t v3 = &type metadata for AXDeviceRemoteScreenUtil.AXWatchRemoteScreenFeatureFlags;
  unint64_t v4 = sub_22A609318();
  char v0 = sub_22A60A640();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v2);
  return v0 & 1;
}

Swift::String __swiftcall AXDeviceRemoteScreenUtil.localizedString(key:)(Swift::String key)
{
  uint64_t v1 = sub_22A60936C();
  result._object = v2;
  result._countAndFlagsBits = v1;
  return result;
}

Swift::String __swiftcall AXDeviceRemoteScreenUtil.localizedStingString(key:)(Swift::String key)
{
  uint64_t v1 = sub_22A60936C();
  result._object = v2;
  result._countAndFlagsBits = v1;
  return result;
}

id sub_22A607990(void *a1)
{
  sub_22A60A6C0();
  id v2 = a1;
  sub_22A60936C();

  swift_bridgeObjectRelease();
  uint64_t v3 = (void *)sub_22A60A6B0();
  swift_bridgeObjectRelease();
  return v3;
}

void AXDeviceRemoteScreenUtil.logSessionInterval(beforeDate:afterDate:)()
{
  uint64_t v1 = v0;
  sub_22A60A5D0();
  double v3 = v2;
  sub_22A60A5D0();
  double v5 = v3 - v4;
  uint64_t v6 = (void *)sub_22A60A6B0();
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v1;
  *(double *)(v7 + 24) = v5;
  v10[4] = sub_22A60A188;
  v10[5] = v7;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 1107296256;
  v10[2] = sub_22A5FFA0C;
  v10[3] = &block_descriptor_1;
  id v8 = _Block_copy(v10);
  id v9 = v1;
  swift_release();
  AnalyticsSendEventLazy();
  _Block_release(v8);
}

unint64_t sub_22A607C68(uint64_t a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26837DE08);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_22A60B180;
  uint64_t v3 = *(void *)(a1 + OBJC_IVAR___AXDeviceRemoteScreenUtil_caSessionIntervalKey + 8);
  *(void *)(inited + 32) = *(void *)(a1 + OBJC_IVAR___AXDeviceRemoteScreenUtil_caSessionIntervalKey);
  *(void *)(inited + 40) = v3;
  swift_bridgeObjectRetain();
  *(void *)(inited + 48) = sub_22A60A7A0();
  return sub_22A6032F0(inited);
}

Swift::Void __swiftcall AXDeviceRemoteScreenUtil.logSessionError(errorName:)(Swift::String errorName)
{
  object = errorName._object;
  uint64_t countAndFlagsBits = errorName._countAndFlagsBits;
  double v4 = (void *)sub_22A60A6B0();
  double v5 = (void *)swift_allocObject();
  v5[2] = v1;
  v5[3] = countAndFlagsBits;
  v5[4] = object;
  v8[4] = sub_22A60A1B0;
  v8[5] = v5;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 1107296256;
  v8[2] = sub_22A5FFA0C;
  v8[3] = &block_descriptor_6_0;
  uint64_t v6 = _Block_copy(v8);
  id v7 = v1;
  swift_bridgeObjectRetain();
  swift_release();
  AnalyticsSendEventLazy();
  _Block_release(v6);
}

unint64_t sub_22A608004(uint64_t a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26837DE08);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_22A60B180;
  uint64_t v3 = *(void *)(a1 + OBJC_IVAR___AXDeviceRemoteScreenUtil_caErrorKey + 8);
  *(void *)(inited + 32) = *(void *)(a1 + OBJC_IVAR___AXDeviceRemoteScreenUtil_caErrorKey);
  *(void *)(inited + 40) = v3;
  swift_bridgeObjectRetain();
  *(void *)(inited + 48) = sub_22A60A6B0();
  return sub_22A6032F0(inited);
}

Swift::Void __swiftcall AXDeviceRemoteScreenUtil.logInactiveSession()()
{
  uint64_t v1 = (void *)sub_22A60A6B0();
  uint64_t v2 = swift_allocObject();
  *(void *)(v2 + 16) = v0;
  v5[4] = sub_22A60A1BC;
  void v5[5] = v2;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 1107296256;
  v5[2] = sub_22A5FFA0C;
  v5[3] = &block_descriptor_12;
  uint64_t v3 = _Block_copy(v5);
  id v4 = v0;
  swift_release();
  AnalyticsSendEventLazy();
  _Block_release(v3);
}

unint64_t sub_22A6082A8(uint64_t a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26837DE08);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_22A60B180;
  uint64_t v3 = *(void *)(a1 + OBJC_IVAR___AXDeviceRemoteScreenUtil_caInactiveKey);
  uint64_t v4 = *(void *)(a1 + OBJC_IVAR___AXDeviceRemoteScreenUtil_caInactiveKey + 8);
  *(void *)(inited + 32) = v3;
  *(void *)(inited + 40) = v4;
  sub_22A60A4A0();
  swift_bridgeObjectRetain();
  *(void *)(inited + 48) = sub_22A60A7D0();
  return sub_22A6032F0(inited);
}

id AXDeviceRemoteScreenUtil.init()()
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v2 = &v0[OBJC_IVAR___AXDeviceRemoteScreenUtil_caSessionIntervalEvent];
  *(void *)uint64_t v2 = 0xD00000000000003FLL;
  *((void *)v2 + 1) = 0x800000022A60C4C0;
  uint64_t v3 = &v0[OBJC_IVAR___AXDeviceRemoteScreenUtil_caSessionIntervalKey];
  *(void *)uint64_t v3 = 0x6C61767265746E69;
  *((void *)v3 + 1) = 0xE800000000000000;
  uint64_t v4 = &v0[OBJC_IVAR___AXDeviceRemoteScreenUtil_caErrorEvent];
  *(void *)uint64_t v4 = 0xD000000000000034;
  *((void *)v4 + 1) = 0x800000022A60C500;
  double v5 = &v0[OBJC_IVAR___AXDeviceRemoteScreenUtil_caErrorKey];
  *(void *)double v5 = 0x726F727265;
  *((void *)v5 + 1) = 0xE500000000000000;
  uint64_t v6 = &v0[OBJC_IVAR___AXDeviceRemoteScreenUtil_caInactiveEvent];
  *(void *)uint64_t v6 = 0xD000000000000037;
  *((void *)v6 + 1) = 0x800000022A60C540;
  id v7 = &v0[OBJC_IVAR___AXDeviceRemoteScreenUtil_caInactiveKey];
  *(void *)id v7 = 0x6576697463616E69;
  *((void *)v7 + 1) = 0xE800000000000000;
  v9.receiver = v0;
  v9.super_class = ObjectType;
  return objc_msgSendSuper2(&v9, sel_init);
}

id AXDeviceRemoteScreenUtil.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void *sub_22A608648(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AF64F28);
  uint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_22A6086B0(unint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3 = a1;
  uint64_t v4 = (unsigned __int16)a1 >> 14;
  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    uint64_t v10 = sub_22A60A750();
    uint64_t v11 = v10 + (v4 << 16);
    unint64_t v12 = v10 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    unint64_t v13 = v11 & 0xFFFFFFFFFFFF0000;
    if (!v4) {
      unint64_t v13 = v12;
    }
    return v13 | 4;
  }
  else
  {
    uint64_t v5 = MEMORY[0x22A6CE920](15, a1 >> 16);
    uint64_t v6 = v5 + (v4 << 16);
    unint64_t v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    unint64_t v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4) {
      unint64_t v8 = v7;
    }
    return v8 | 8;
  }
}

unsigned __int8 *sub_22A60872C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v13 = a1;
  uint64_t v14 = a2;
  swift_bridgeObjectRetain();
  uint64_t v5 = sub_22A60A760();
  unint64_t v6 = v4;
  if ((v4 & 0x1000000000000000) == 0)
  {
    if ((v4 & 0x2000000000000000) == 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v8 = HIBYTE(v6) & 0xF;
    uint64_t v13 = v5;
    uint64_t v14 = v6 & 0xFFFFFFFFFFFFFFLL;
    unint64_t v7 = (unsigned __int8 *)&v13;
    goto LABEL_7;
  }
  uint64_t v5 = sub_22A608A90();
  unint64_t v10 = v9;
  swift_bridgeObjectRelease();
  unint64_t v6 = v10;
  if ((v10 & 0x2000000000000000) != 0) {
    goto LABEL_6;
  }
LABEL_3:
  if ((v5 & 0x1000000000000000) != 0)
  {
    unint64_t v7 = (unsigned __int8 *)((v6 & 0xFFFFFFFFFFFFFFFLL) + 32);
    uint64_t v8 = v5 & 0xFFFFFFFFFFFFLL;
  }
  else
  {
    unint64_t v7 = (unsigned __int8 *)sub_22A60A890();
  }
LABEL_7:
  uint64_t v11 = sub_22A608814(v7, v8, a3);
  swift_bridgeObjectRelease();
  return v11;
}

unsigned __int8 *sub_22A608814(unsigned __int8 *result, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = a2;
  int v4 = *result;
  if (v4 != 43)
  {
    if (v4 == 45)
    {
      if (a2 >= 1)
      {
        uint64_t v5 = a2 - 1;
        if (a2 != 1)
        {
          unsigned __int8 v6 = a3 + 48;
          unsigned __int8 v7 = a3 + 55;
          unsigned __int8 v8 = a3 + 87;
          if (a3 > 10)
          {
            unsigned __int8 v6 = 58;
          }
          else
          {
            unsigned __int8 v8 = 97;
            unsigned __int8 v7 = 65;
          }
          if (result)
          {
            uint64_t v9 = 0;
            for (uint64_t i = result + 1; ; ++i)
            {
              unsigned int v11 = *i;
              if (v11 < 0x30 || v11 >= v6)
              {
                if (v11 < 0x41 || v11 >= v7)
                {
                  if (v11 < 0x61 || v11 >= v8) {
                    return 0;
                  }
                  char v12 = -87;
                }
                else
                {
                  char v12 = -55;
                }
              }
              else
              {
                char v12 = -48;
              }
              uint64_t v13 = v9 * a3;
              if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63) {
                return 0;
              }
              uint64_t v9 = v13 - (v11 + v12);
              if (__OFSUB__(v13, (v11 + v12))) {
                return 0;
              }
              if (!--v5) {
                return (unsigned __int8 *)v9;
              }
            }
          }
          return 0;
        }
        return 0;
      }
      __break(1u);
      goto LABEL_65;
    }
    if (a2)
    {
      unsigned __int8 v22 = a3 + 48;
      unsigned __int8 v23 = a3 + 55;
      unsigned __int8 v24 = a3 + 87;
      if (a3 > 10)
      {
        unsigned __int8 v22 = 58;
      }
      else
      {
        unsigned __int8 v24 = 97;
        unsigned __int8 v23 = 65;
      }
      if (result)
      {
        uint64_t v25 = 0;
        do
        {
          unsigned int v26 = *result;
          if (v26 < 0x30 || v26 >= v22)
          {
            if (v26 < 0x41 || v26 >= v23)
            {
              if (v26 < 0x61 || v26 >= v24) {
                return 0;
              }
              char v27 = -87;
            }
            else
            {
              char v27 = -55;
            }
          }
          else
          {
            char v27 = -48;
          }
          uint64_t v28 = v25 * a3;
          if ((unsigned __int128)(v25 * (__int128)a3) >> 64 != (v25 * a3) >> 63) {
            return 0;
          }
          uint64_t v25 = v28 + (v26 + v27);
          if (__OFADD__(v28, (v26 + v27))) {
            return 0;
          }
          ++result;
          --v3;
        }
        while (v3);
        return (unsigned __int8 *)(v28 + (v26 + v27));
      }
      return 0;
    }
    return 0;
  }
  if (a2 < 1)
  {
LABEL_65:
    __break(1u);
    return result;
  }
  uint64_t v14 = a2 - 1;
  if (a2 == 1) {
    return 0;
  }
  unsigned __int8 v15 = a3 + 48;
  unsigned __int8 v16 = a3 + 55;
  unsigned __int8 v17 = a3 + 87;
  if (a3 > 10)
  {
    unsigned __int8 v15 = 58;
  }
  else
  {
    unsigned __int8 v17 = 97;
    unsigned __int8 v16 = 65;
  }
  if (!result) {
    return 0;
  }
  uint64_t v9 = 0;
  unint64_t v18 = result + 1;
  do
  {
    unsigned int v19 = *v18;
    if (v19 < 0x30 || v19 >= v15)
    {
      if (v19 < 0x41 || v19 >= v16)
      {
        if (v19 < 0x61 || v19 >= v17) {
          return 0;
        }
        char v20 = -87;
      }
      else
      {
        char v20 = -55;
      }
    }
    else
    {
      char v20 = -48;
    }
    uint64_t v21 = v9 * a3;
    if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63) {
      return 0;
    }
    uint64_t v9 = v21 + (v19 + v20);
    if (__OFADD__(v21, (v19 + v20))) {
      return 0;
    }
    ++v18;
    --v14;
  }
  while (v14);
  return (unsigned __int8 *)v9;
}

uint64_t sub_22A608A90()
{
  unint64_t v0 = sub_22A60A770();
  uint64_t v4 = sub_22A608B10(v0, v1, v2, v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_22A608B10(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  if ((a4 & 0x1000000000000000) != 0)
  {
    uint64_t v9 = sub_22A608C68(a1, a2, a3, a4);
    if (v9)
    {
      uint64_t v10 = v9;
      unsigned int v11 = sub_22A608648(v9, 0);
      unint64_t v12 = sub_22A608D68((unint64_t)v14, (uint64_t)(v11 + 4), v10, a1, a2, a3, a4);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      if (v12 != v10)
      {
        __break(1u);
LABEL_11:
        sub_22A60A890();
LABEL_4:
        JUMPOUT(0x22A6CE8D0);
      }
    }
    else
    {
      unsigned int v11 = (void *)MEMORY[0x263F8EE78];
    }
    uint64_t v13 = MEMORY[0x22A6CE8D0](v11 + 4, v11[2]);
    swift_release();
    return v13;
  }
  else
  {
    if ((a4 & 0x2000000000000000) == 0)
    {
      if ((a3 & 0x1000000000000000) != 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
    v14[0] = a3;
    v14[1] = a4 & 0xFFFFFFFFFFFFFFLL;
    return MEMORY[0x22A6CE8D0]((char *)v14 + (a1 >> 16), (a2 >> 16) - (a1 >> 16));
  }
}

uint64_t sub_22A608C68(unint64_t a1, unint64_t a2, unint64_t a3, uint64_t a4)
{
  unint64_t v4 = a4;
  uint64_t v5 = a3;
  unint64_t v6 = a2;
  unint64_t v7 = a1;
  uint64_t v8 = (a3 >> 59) & 1;
  if ((a4 & 0x1000000000000000) == 0) {
    LOBYTE(v8) = 1;
  }
  uint64_t v9 = 4 << v8;
  if ((a1 & 0xC) == 4 << v8)
  {
    a1 = sub_22A6086B0(a1, a3, a4);
    unint64_t v7 = a1;
  }
  if ((v6 & 0xC) == v9)
  {
    a1 = sub_22A6086B0(v6, v5, v4);
    unint64_t v6 = a1;
    if ((v4 & 0x1000000000000000) == 0) {
      return (v6 >> 16) - (v7 >> 16);
    }
  }
  else if ((v4 & 0x1000000000000000) == 0)
  {
    return (v6 >> 16) - (v7 >> 16);
  }
  unint64_t v11 = HIBYTE(v4) & 0xF;
  if ((v4 & 0x2000000000000000) == 0) {
    unint64_t v11 = v5 & 0xFFFFFFFFFFFFLL;
  }
  if (v11 < v7 >> 16)
  {
    __break(1u);
  }
  else if (v11 >= v6 >> 16)
  {
    a1 = v7;
    a2 = v6;
    a3 = v5;
    a4 = v4;
    return MEMORY[0x270F9D808](a1, a2, a3, a4);
  }
  __break(1u);
  return MEMORY[0x270F9D808](a1, a2, a3, a4);
}

unint64_t sub_22A608D68(unint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, unint64_t a7)
{
  uint64_t v9 = (void *)result;
  if (!a2) {
    goto LABEL_5;
  }
  if (!a3)
  {
    unint64_t v12 = a4;
    uint64_t v11 = 0;
    goto LABEL_33;
  }
  if (a3 < 0) {
    goto LABEL_36;
  }
  unint64_t v10 = a5 >> 14;
  unint64_t v27 = a4 >> 14;
  if (a4 >> 14 == a5 >> 14)
  {
LABEL_5:
    uint64_t v11 = 0;
    unint64_t v12 = a4;
LABEL_33:
    *uint64_t v9 = a4;
    v9[1] = a5;
    v9[2] = a6;
    v9[3] = a7;
    v9[4] = v12;
    return v11;
  }
  uint64_t v11 = 0;
  uint64_t v14 = (a6 >> 59) & 1;
  if ((a7 & 0x1000000000000000) == 0) {
    LOBYTE(v14) = 1;
  }
  uint64_t v15 = 4 << v14;
  uint64_t v21 = (a7 & 0xFFFFFFFFFFFFFFFLL) + 32;
  uint64_t v22 = a7 & 0xFFFFFFFFFFFFFFLL;
  uint64_t v16 = HIBYTE(a7) & 0xF;
  if ((a7 & 0x2000000000000000) == 0) {
    uint64_t v16 = a6 & 0xFFFFFFFFFFFFLL;
  }
  unint64_t v23 = v16;
  uint64_t v26 = a3 - 1;
  unint64_t v12 = a4;
  while (1)
  {
    unint64_t v17 = v12 & 0xC;
    Swift::String result = v12;
    if (v17 == v15) {
      Swift::String result = sub_22A6086B0(v12, a6, a7);
    }
    if (result >> 14 < v27 || result >> 14 >= v10) {
      break;
    }
    if ((a7 & 0x1000000000000000) != 0)
    {
      Swift::String result = sub_22A60A740();
      char v19 = result;
      if (v17 != v15) {
        goto LABEL_23;
      }
    }
    else
    {
      unint64_t v18 = result >> 16;
      if ((a7 & 0x2000000000000000) != 0)
      {
        v28[0] = a6;
        v28[1] = v22;
        char v19 = *((unsigned char *)v28 + v18);
        if (v17 != v15) {
          goto LABEL_23;
        }
      }
      else
      {
        Swift::String result = v21;
        if ((a6 & 0x1000000000000000) == 0) {
          Swift::String result = sub_22A60A890();
        }
        char v19 = *(unsigned char *)(result + v18);
        if (v17 != v15)
        {
LABEL_23:
          if ((a7 & 0x1000000000000000) == 0) {
            goto LABEL_24;
          }
          goto LABEL_27;
        }
      }
    }
    Swift::String result = sub_22A6086B0(v12, a6, a7);
    unint64_t v12 = result;
    if ((a7 & 0x1000000000000000) == 0)
    {
LABEL_24:
      unint64_t v12 = (v12 & 0xFFFFFFFFFFFF0000) + 65540;
      goto LABEL_29;
    }
LABEL_27:
    if (v23 <= v12 >> 16) {
      goto LABEL_35;
    }
    unint64_t v12 = sub_22A60A710();
LABEL_29:
    *(unsigned char *)(a2 + v11) = v19;
    if (v26 == v11)
    {
      uint64_t v11 = a3;
      goto LABEL_33;
    }
    ++v11;
    if (v10 == v12 >> 14) {
      goto LABEL_33;
    }
  }
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
  return result;
}

uint64_t _s27AXWatchRemoteScreenServices08AXDevicebC4UtilC22isPairedGizmoSupported8deviceIDSbSS_tF_0()
{
  uint64_t v0 = sub_22A60A630();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = *(void *)(v1 + 64);
  MEMORY[0x270FA5388]();
  unint64_t v3 = (char *)&v16 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26837E178);
  MEMORY[0x270FA5388]();
  uint64_t v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22A60A600();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v1 + 48))(v5, 1, v0) == 1)
  {
    sub_22A607248((uint64_t)v5, &qword_26837E178);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v1 + 32))((char *)&v16 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0), v5, v0);
    uint64_t result = (uint64_t)objc_msgSend(self, sel_sharedInstance);
    if (!result)
    {
      __break(1u);
      return result;
    }
    unint64_t v7 = (void *)result;
    uint64_t v8 = (void *)sub_22A60A610();
    id v9 = objc_msgSend(v7, sel_deviceForBluetoothID_, v8);

    if (v9)
    {
      id v10 = AX_NRDEVICECAPABILITY_MULTIBAND_WIFI();
      MEMORY[0x270FA5388]();
      sub_22A60A620();

      uint64_t v11 = (void *)sub_22A60A610();
      unint64_t v12 = *(void (**)(char *, uint64_t))(v1 + 8);
      v12((char *)&v16 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0), v0);
      unsigned int v13 = objc_msgSend(v9, sel_supportsCapability_, v11);

      if (v13)
      {
        if (objc_msgSend(v9, sel_valueForProperty_, *MEMORY[0x263F575B0]))
        {
          sub_22A60A830();
          swift_unknownObjectRelease();
        }
        else
        {
          memset(v18, 0, sizeof(v18));
        }
        sub_22A60A3E4((uint64_t)v18, (uint64_t)v19);
        if (v20)
        {
          sub_22A60A4A0();
          if (swift_dynamicCast())
          {
            id v14 = v17;
            unsigned __int8 v15 = objc_msgSend(v17, sel_BOOLValue);

            v12(v3, v0);
            return (v15 & 1) == 0;
          }
        }
        else
        {

          sub_22A607248((uint64_t)v19, &qword_26837DEC0);
        }
        v12(v3, v0);
        return 1;
      }
      v12(v3, v0);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v1 + 8))((char *)&v16 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0), v0);
    }
  }
  return 0;
}

unint64_t sub_22A609318()
{
  unint64_t result = qword_26837E160;
  if (!qword_26837E160)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26837E160);
  }
  return result;
}

uint64_t sub_22A60936C()
{
  type metadata accessor for AXDeviceRemoteScreenUtil();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v1 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  uint64_t v2 = (void *)sub_22A60A6B0();
  unint64_t v3 = (void *)sub_22A60A6B0();
  id v4 = objc_msgSend(v1, sel_localizedStringForKey_value_table_, v2, 0, v3);

  uint64_t v5 = sub_22A60A6C0();
  return v5;
}

id sub_22A60944C()
{
  id result = objc_msgSend(self, sel_sharedInstance);
  if (!result) {
    goto LABEL_85;
  }
  id v1 = result;
  id v2 = objc_msgSend(result, sel_getActivePairedDevice);

  if (!v2) {
    return v2;
  }
  if (objc_msgSend(v2, sel_valueForProperty_, *MEMORY[0x263F575B0]))
  {
    sub_22A60A830();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v29 = 0u;
    long long v30 = 0u;
  }
  sub_22A60A3E4((uint64_t)&v29, (uint64_t)&v31);
  if (v33)
  {
    sub_22A60A4A0();
    if (swift_dynamicCast())
    {
      unsigned int v3 = objc_msgSend(v27, sel_BOOLValue);

      if (v3) {
        goto LABEL_62;
      }
    }
  }
  else
  {
    sub_22A607248((uint64_t)&v31, &qword_26837DEC0);
  }
  if (objc_msgSend(v2, sel_valueForProperty_, *MEMORY[0x263F575B8]))
  {
    sub_22A60A830();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v29 = 0u;
    long long v30 = 0u;
  }
  sub_22A60A3E4((uint64_t)&v29, (uint64_t)&v31);
  if (v33)
  {
    sub_22A60A4A0();
    if (swift_dynamicCast())
    {
      unsigned int v4 = objc_msgSend(v27, sel_BOOLValue);

      if (v4)
      {
LABEL_62:

        return 0;
      }
    }
  }
  else
  {
    sub_22A607248((uint64_t)&v31, &qword_26837DEC0);
  }
  if (objc_msgSend(v2, sel_valueForProperty_, *MEMORY[0x263F57668]))
  {
    sub_22A60A830();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v29 = 0u;
    long long v30 = 0u;
  }
  sub_22A60A3E4((uint64_t)&v29, (uint64_t)&v31);
  if (!v33)
  {
    sub_22A607248((uint64_t)&v31, &qword_26837DEC0);
    return v2;
  }
  if ((swift_dynamicCast() & 1) == 0) {
    return v2;
  }
  uint64_t v31 = (uint64_t)v27;
  uint64_t v32 = v28;
  *(void *)&long long v29 = 46;
  *((void *)&v29 + 1) = 0xE100000000000000;
  sub_22A60A44C();
  uint64_t v5 = (void *)sub_22A60A820();
  swift_bridgeObjectRelease();
  if (!v5[2]
    || ((uint64_t v7 = v5[4],
         unint64_t v6 = v5[5],
         swift_bridgeObjectRetain(),
         id result = (id)swift_bridgeObjectRelease(),
         uint64_t v8 = HIBYTE(v6) & 0xF,
         uint64_t v9 = v7 & 0xFFFFFFFFFFFFLL,
         (v6 & 0x2000000000000000) != 0)
      ? (uint64_t v10 = HIBYTE(v6) & 0xF)
      : (uint64_t v10 = v7 & 0xFFFFFFFFFFFFLL),
        !v10))
  {
    swift_bridgeObjectRelease();
    return v2;
  }
  if ((v6 & 0x1000000000000000) != 0)
  {
    uint64_t v12 = (uint64_t)sub_22A60872C(v7, v6, 10);
    LOBYTE(v7) = v26;
    goto LABEL_60;
  }
  if ((v6 & 0x2000000000000000) == 0)
  {
    if ((v7 & 0x1000000000000000) != 0) {
      uint64_t v11 = (unsigned __int8 *)((v6 & 0xFFFFFFFFFFFFFFFLL) + 32);
    }
    else {
      uint64_t v11 = (unsigned __int8 *)sub_22A60A890();
    }
    uint64_t v12 = (uint64_t)sub_22A608814(v11, v9, 10);
    LOBYTE(v7) = v13 & 1;
LABEL_60:
    swift_bridgeObjectRelease();
    if ((v7 & 1) != 0 || v12 >= 9) {
      return v2;
    }
    goto LABEL_62;
  }
  uint64_t v31 = v7;
  uint64_t v32 = v6 & 0xFFFFFFFFFFFFFFLL;
  if (v7 == 43)
  {
    if (v8)
    {
      if (v8 != 1 && (BYTE1(v7) - 48) <= 9u)
      {
        uint64_t v12 = (BYTE1(v7) - 48);
        if (v8 == 2) {
          goto LABEL_59;
        }
        if ((BYTE2(v7) - 48) <= 9u)
        {
          uint64_t v12 = 10 * (BYTE1(v7) - 48) + (BYTE2(v7) - 48);
          uint64_t v14 = v8 - 3;
          if (v14)
          {
            unsigned __int8 v15 = (unsigned __int8 *)&v31 + 3;
            while (1)
            {
              unsigned int v16 = *v15 - 48;
              if (v16 > 9) {
                goto LABEL_57;
              }
              uint64_t v17 = 10 * v12;
              if ((unsigned __int128)(v12 * (__int128)10) >> 64 != (10 * v12) >> 63) {
                goto LABEL_57;
              }
              uint64_t v12 = v17 + v16;
              if (__OFADD__(v17, v16)) {
                goto LABEL_57;
              }
              LOBYTE(v7) = 0;
              ++v15;
              if (!--v14) {
                goto LABEL_60;
              }
            }
          }
          goto LABEL_59;
        }
      }
      goto LABEL_57;
    }
  }
  else
  {
    if (v7 != 45)
    {
      if (v8 && (v7 - 48) <= 9u)
      {
        uint64_t v12 = (v7 - 48);
        if (v8 == 1) {
          goto LABEL_59;
        }
        if ((BYTE1(v7) - 48) <= 9u)
        {
          uint64_t v12 = 10 * (v7 - 48) + (BYTE1(v7) - 48);
          uint64_t v18 = v8 - 2;
          if (v18)
          {
            char v19 = (unsigned __int8 *)&v31 + 2;
            while (1)
            {
              unsigned int v20 = *v19 - 48;
              if (v20 > 9) {
                goto LABEL_57;
              }
              uint64_t v21 = 10 * v12;
              if ((unsigned __int128)(v12 * (__int128)10) >> 64 != (10 * v12) >> 63) {
                goto LABEL_57;
              }
              uint64_t v12 = v21 + v20;
              if (__OFADD__(v21, v20)) {
                goto LABEL_57;
              }
              LOBYTE(v7) = 0;
              ++v19;
              if (!--v18) {
                goto LABEL_60;
              }
            }
          }
          goto LABEL_59;
        }
      }
LABEL_57:
      uint64_t v12 = 0;
      LOBYTE(v7) = 1;
      goto LABEL_60;
    }
    if (v8)
    {
      if (v8 != 1 && (BYTE1(v7) - 48) <= 9u)
      {
        if (v8 == 2)
        {
          LOBYTE(v7) = 0;
          uint64_t v12 = -(uint64_t)(BYTE1(v7) - 48);
          goto LABEL_60;
        }
        if ((BYTE2(v7) - 48) <= 9u)
        {
          uint64_t v12 = -10 * (BYTE1(v7) - 48) - (BYTE2(v7) - 48);
          uint64_t v22 = v8 - 3;
          if (v22)
          {
            unint64_t v23 = (unsigned __int8 *)&v31 + 3;
            while (1)
            {
              unsigned int v24 = *v23 - 48;
              if (v24 > 9) {
                goto LABEL_57;
              }
              uint64_t v25 = 10 * v12;
              if ((unsigned __int128)(v12 * (__int128)10) >> 64 != (10 * v12) >> 63) {
                goto LABEL_57;
              }
              uint64_t v12 = v25 - v24;
              if (__OFSUB__(v25, v24)) {
                goto LABEL_57;
              }
              LOBYTE(v7) = 0;
              ++v23;
              if (!--v22) {
                goto LABEL_60;
              }
            }
          }
LABEL_59:
          LOBYTE(v7) = 0;
          goto LABEL_60;
        }
      }
      goto LABEL_57;
    }
    __break(1u);
  }
  __break(1u);
LABEL_85:
  __break(1u);
  return result;
}

uint64_t _s27AXWatchRemoteScreenServices08AXDevicebC4UtilC28isPairedGizmoHasStingSupportSbyF_0()
{
  uint64_t v0 = sub_22A60944C();
  if (!v0)
  {
    if (qword_26AF64F60 != -1) {
      swift_once();
    }
    uint64_t v14 = sub_22A60A670();
    __swift_project_value_buffer(v14, (uint64_t)qword_26AF64F68);
    id v1 = sub_22A60A650();
    os_log_type_t v15 = sub_22A60A7C0();
    if (os_log_type_enabled(v1, v15))
    {
      unsigned int v16 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unsigned int v16 = 0;
      _os_log_impl(&dword_22A5FC000, v1, v15, "[TWICE] currentPairedGizmo is nil", v16, 2u);
      MEMORY[0x22A6CF070](v16, -1, -1);
    }
    goto LABEL_12;
  }
  id v1 = v0;
  id v2 = AX_NRDEVICECAPABILITY_STING();
  uint64_t v3 = sub_22A60A630();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3, v5);
  uint64_t v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22A60A620();

  uint64_t v8 = (void *)sub_22A60A610();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
  LODWORD(v3) = [v1 supportsCapability:v8];

  if (!v3)
  {
LABEL_12:

    return 0;
  }
  if (qword_26AF64F60 != -1) {
    swift_once();
  }
  uint64_t v9 = sub_22A60A670();
  __swift_project_value_buffer(v9, (uint64_t)qword_26AF64F68);
  uint64_t v10 = sub_22A60A650();
  os_log_type_t v11 = sub_22A60A7C0();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v12 = 0;
    _os_log_impl(&dword_22A5FC000, v10, v11, "[TWICE] currentPairedGizmo is sting supported", v12, 2u);
    MEMORY[0x22A6CF070](v12, -1, -1);
  }

  return 1;
}

uint64_t _s27AXWatchRemoteScreenServices08AXDevicebC4UtilC22isPairedGizmoSupportedSbyF_0()
{
  uint64_t v0 = sub_22A60944C();
  if (!v0)
  {
    if (qword_26AF64F60 != -1) {
      swift_once();
    }
    uint64_t v14 = sub_22A60A670();
    __swift_project_value_buffer(v14, (uint64_t)qword_26AF64F68);
    id v1 = sub_22A60A650();
    os_log_type_t v15 = sub_22A60A7C0();
    if (os_log_type_enabled(v1, v15))
    {
      unsigned int v16 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unsigned int v16 = 0;
      _os_log_impl(&dword_22A5FC000, v1, v15, "[TWICE] currentPairedGizmo is nil", v16, 2u);
      MEMORY[0x22A6CF070](v16, -1, -1);
    }
    goto LABEL_17;
  }
  id v1 = v0;
  id v2 = AX_NRDEVICECAPABILITY_MULTIBAND_WIFI();
  uint64_t v3 = sub_22A60A630();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3, v5);
  uint64_t v7 = (char *)&v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22A60A620();

  uint64_t v8 = (void *)sub_22A60A610();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
  LODWORD(v3) = [v1 supportsCapability:v8];

  if (!v3)
  {
    if (qword_26AF64F60 != -1) {
      swift_once();
    }
    uint64_t v17 = sub_22A60A670();
    __swift_project_value_buffer(v17, (uint64_t)qword_26AF64F68);
    uint64_t v18 = sub_22A60A650();
    os_log_type_t v19 = sub_22A60A7C0();
    if (os_log_type_enabled(v18, v19))
    {
      unsigned int v20 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unsigned int v20 = 0;
      _os_log_impl(&dword_22A5FC000, v18, v19, "[TWICE] currentPairedGizmo is NOT multiband wifi", v20, 2u);
      MEMORY[0x22A6CF070](v20, -1, -1);
    }

LABEL_17:
    return 0;
  }
  if (qword_26AF64F60 != -1) {
    swift_once();
  }
  uint64_t v9 = sub_22A60A670();
  __swift_project_value_buffer(v9, (uint64_t)qword_26AF64F68);
  uint64_t v10 = sub_22A60A650();
  os_log_type_t v11 = sub_22A60A7C0();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v12 = 0;
    _os_log_impl(&dword_22A5FC000, v10, v11, "[TWICE] currentPairedGizmo is TWICE supported", v12, 2u);
    MEMORY[0x22A6CF070](v12, -1, -1);
  }

  return 1;
}

uint64_t _s27AXWatchRemoteScreenServices08AXDevicebC4UtilC15pairedGizmoNameSSSgyF_0()
{
  id v0 = sub_22A60944C();
  if (v0)
  {
    id v1 = v0;
    if (objc_msgSend(v0, sel_valueForProperty_, *MEMORY[0x263F57610]))
    {
      sub_22A60A830();

      swift_unknownObjectRelease();
    }
    else
    {

      memset(v8, 0, sizeof(v8));
    }
    sub_22A60A3E4((uint64_t)v8, (uint64_t)v9);
    if (v10)
    {
      if (swift_dynamicCast()) {
        return v7;
      }
    }
    else
    {
      sub_22A607248((uint64_t)v9, &qword_26837DEC0);
    }
  }
  else
  {
    if (qword_26AF64F60 != -1) {
      swift_once();
    }
    uint64_t v2 = sub_22A60A670();
    __swift_project_value_buffer(v2, (uint64_t)qword_26AF64F68);
    uint64_t v3 = sub_22A60A650();
    os_log_type_t v4 = sub_22A60A7C0();
    if (os_log_type_enabled(v3, v4))
    {
      uint64_t v5 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl(&dword_22A5FC000, v3, v4, "[TWICE] currentPairedGizmo is nil", v5, 2u);
      MEMORY[0x22A6CF070](v5, -1, -1);
    }
  }
  return 0;
}

uint64_t sub_22A60A150()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

unint64_t sub_22A60A188()
{
  return sub_22A607C68(*(void *)(v0 + 16));
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

unint64_t sub_22A60A1B0()
{
  return sub_22A608004(*(void *)(v0 + 16));
}

unint64_t sub_22A60A1BC()
{
  return sub_22A6082A8(*(void *)(v0 + 16));
}

uint64_t type metadata accessor for AXDeviceRemoteScreenUtil()
{
  return self;
}

uint64_t getEnumTagSinglePayload for AXDeviceRemoteScreenUtil.AXWatchRemoteScreenFeatureFlags(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for AXDeviceRemoteScreenUtil.AXWatchRemoteScreenFeatureFlags(unsigned char *result, int a2, int a3)
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
        *id result = a2;
        return result;
      case 2:
        *(_WORD *)id result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)id result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *id result = 0;
      break;
    case 2:
      *(_WORD *)id result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x22A60A2D8);
    case 4:
      *(_DWORD *)id result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for AXDeviceRemoteScreenUtil.AXWatchRemoteScreenFeatureFlags()
{
  return &type metadata for AXDeviceRemoteScreenUtil.AXWatchRemoteScreenFeatureFlags;
}

unint64_t sub_22A60A314()
{
  unint64_t result = qword_26837E168;
  if (!qword_26837E168)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26837E168);
  }
  return result;
}

uint64_t sub_22A60A368()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t objectdestroy_2Tm()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_22A60A3E4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26837DEC0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_22A60A44C()
{
  unint64_t result = qword_26837E170;
  if (!qword_26837E170)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26837E170);
  }
  return result;
}

unint64_t sub_22A60A4A0()
{
  unint64_t result = qword_26837DE10;
  if (!qword_26837DE10)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26837DE10);
  }
  return result;
}

void AXDisplayCornerRadiusWithMargin_cold_1()
{
}

void __getBluetoothManagerClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  __getWFClientClass_block_invoke_cold_1(v0);
}

void __getWFClientClass_block_invoke_cold_1()
{
}

uint64_t sub_22A60A590()
{
  return MEMORY[0x270EEE918]();
}

uint64_t sub_22A60A5A0()
{
  return MEMORY[0x270EEE928]();
}

uint64_t sub_22A60A5B0()
{
  return MEMORY[0x270EEE948]();
}

uint64_t sub_22A60A5C0()
{
  return MEMORY[0x270EF0128]();
}

uint64_t sub_22A60A5D0()
{
  return MEMORY[0x270EF02C0]();
}

uint64_t sub_22A60A5E0()
{
  return MEMORY[0x270EF0BB0]();
}

uint64_t sub_22A60A5F0()
{
  return MEMORY[0x270EF0C38]();
}

uint64_t sub_22A60A600()
{
  return MEMORY[0x270EF0C50]();
}

uint64_t sub_22A60A610()
{
  return MEMORY[0x270EF0C90]();
}

uint64_t sub_22A60A620()
{
  return MEMORY[0x270EF0CC0]();
}

uint64_t sub_22A60A630()
{
  return MEMORY[0x270EF0D10]();
}

uint64_t sub_22A60A640()
{
  return MEMORY[0x270F28690]();
}

uint64_t sub_22A60A650()
{
  return MEMORY[0x270FA2DF8]();
}

uint64_t sub_22A60A660()
{
  return MEMORY[0x270FA2E10]();
}

uint64_t sub_22A60A670()
{
  return MEMORY[0x270FA2E28]();
}

uint64_t sub_22A60A680()
{
  return MEMORY[0x270EF1810]();
}

uint64_t sub_22A60A690()
{
  return MEMORY[0x270EF1848]();
}

uint64_t sub_22A60A6A0()
{
  return MEMORY[0x270F9D060]();
}

uint64_t sub_22A60A6B0()
{
  return MEMORY[0x270EF19A8]();
}

uint64_t sub_22A60A6C0()
{
  return MEMORY[0x270EF19F0]();
}

uint64_t sub_22A60A6D0()
{
  return MEMORY[0x270F9D6B8]();
}

uint64_t sub_22A60A6E0()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_22A60A6F0()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_22A60A700()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_22A60A710()
{
  return MEMORY[0x270F9D7E8]();
}

uint64_t sub_22A60A720()
{
  return MEMORY[0x270F9D800]();
}

uint64_t sub_22A60A740()
{
  return MEMORY[0x270F9D810]();
}

uint64_t sub_22A60A750()
{
  return MEMORY[0x270F9D860]();
}

uint64_t sub_22A60A760()
{
  return MEMORY[0x270F9D8E0]();
}

uint64_t sub_22A60A770()
{
  return MEMORY[0x270F9D8F0]();
}

uint64_t sub_22A60A780()
{
  return MEMORY[0x270EF1BB0]();
}

uint64_t sub_22A60A790()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t sub_22A60A7A0()
{
  return MEMORY[0x270EF1C10]();
}

uint64_t sub_22A60A7B0()
{
  return MEMORY[0x270FA2E68]();
}

uint64_t sub_22A60A7C0()
{
  return MEMORY[0x270FA2E88]();
}

uint64_t sub_22A60A7D0()
{
  return MEMORY[0x270EF2188]();
}

uint64_t sub_22A60A7E0()
{
  return MEMORY[0x270EF2190]();
}

uint64_t sub_22A60A7F0()
{
  return MEMORY[0x270FA1188]();
}

uint64_t sub_22A60A800()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_22A60A810()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_22A60A820()
{
  return MEMORY[0x270EF23E0]();
}

uint64_t sub_22A60A830()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_22A60A840()
{
  return MEMORY[0x270F9E8C0]();
}

uint64_t sub_22A60A850()
{
  return MEMORY[0x270F9E8C8]();
}

uint64_t sub_22A60A860()
{
  return MEMORY[0x270F9E8E8]();
}

uint64_t sub_22A60A870()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_22A60A880()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_22A60A890()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_22A60A8A0()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_22A60A8B0()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_22A60A8C0()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_22A60A8D0()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_22A60A8E0()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_22A60A8F0()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_22A60A900()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_22A60A910()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_22A60A920()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_22A60A930()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_22A60A940()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_22A60A950()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_22A60A960()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_22A60A970()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x270F18A48]();
}

uint64_t _AXSTwiceRemoteScreenEnabled()
{
  return MEMORY[0x270F90B30]();
}

uint64_t _AXSTwiceRemoteScreenPlatform()
{
  return MEMORY[0x270F90B38]();
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

uint64_t _sl_dlopen()
{
  return MEMORY[0x270F76310]();
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x270FA0158]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x270ED8458]();
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

char *dlerror(void)
{
  return (char *)MEMORY[0x270ED9620]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x270ED9648](__handle, __symbol);
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

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x270F9A658](name);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
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

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D8](oslog, type);
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

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x270FA01C8]();
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

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
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

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x270FA0440]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x270FA0478]();
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

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x270FA0558]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x270FA0560]();
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