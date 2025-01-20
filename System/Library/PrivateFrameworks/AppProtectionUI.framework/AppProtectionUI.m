void sub_247E05958(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
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

void sub_247E05E14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __enablementControllerQueue_block_invoke()
{
  v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.AppProtectionUI.APEnablementController", v2);
  v1 = (void *)enablementControllerQueue_result;
  enablementControllerQueue_result = (uint64_t)v0;
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_2(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_3(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

void OUTLINED_FUNCTION_4(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

id APUIDefaultFrameworkLog()
{
  if (APUIDefaultFrameworkLog_onceToken != -1) {
    dispatch_once(&APUIDefaultFrameworkLog_onceToken, &__block_literal_global_0);
  }
  dispatch_queue_t v0 = (void *)APUIDefaultFrameworkLog_log;

  return v0;
}

uint64_t __APUIDefaultFrameworkLog_block_invoke()
{
  APUIDefaultFrameworkLog_log = (uint64_t)os_log_create("com.apple.appprotection", "frameworkUI");

  return MEMORY[0x270F9A758]();
}

id APEducationIconForEnableableFeature(uint64_t a1)
{
  uint64_t v1 = @"com.apple.appprotection.lock.education";
  if (a1 == 2) {
    uint64_t v1 = @"com.apple.appprotection.hide.education";
  }
  v2 = (objc_class *)MEMORY[0x263F4B540];
  v3 = v1;
  uint64_t v4 = (void *)[[v2 alloc] initWithType:v3];

  v5 = [MEMORY[0x263F4B558] imageDescriptorNamed:*MEMORY[0x263F4B578]];
  v6 = [v4 imageForDescriptor:v5];
  if ([v6 placeholder])
  {
    uint64_t v7 = [v4 prepareImageForDescriptor:v5];

    v6 = (void *)v7;
  }
  v8 = (void *)MEMORY[0x263F827E8];
  uint64_t v9 = [v6 CGImage];
  v10 = [MEMORY[0x263F82B60] mainScreen];
  [v10 scale];
  v11 = objc_msgSend(v8, "imageWithCGImage:scale:orientation:", v9, 0);

  return v11;
}

uint64_t applicationRequiresEmergencyCallButton(void *a1)
{
  id v1 = a1;
  id v2 = objc_alloc(MEMORY[0x263F01878]);
  v3 = [v1 bundleIdentifier];
  uint64_t v4 = 1;
  v5 = (void *)[v2 initWithBundleIdentifier:v3 allowPlaceholder:1 error:0];

  v6 = [v5 entitlements];
  uint64_t v7 = [v6 objectForKey:@"com.apple.private.appprotection.needs_emergency_dialer" ofClass:objc_opt_class()];
  char v8 = [v7 BOOLValue];

  if ((v8 & 1) == 0)
  {
    uint64_t v9 = [v1 bundleIdentifier];
    uint64_t v4 = [v9 isEqualToString:@"com.apple.mobilephone"];
  }
  return v4;
}

void sub_247E0A63C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

uint64_t __performTransition_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  BOOL v3 = v2 != 1;
  [*(id *)(*(void *)(a1 + 32) + 416) setHidden:v2 == 1];
  uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 440);

  return [v4 setHidden:v3];
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_2_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

id APFrameworkBundle()
{
  if (APFrameworkBundle_onceToken != -1) {
    dispatch_once(&APFrameworkBundle_onceToken, &__block_literal_global_3);
  }
  dispatch_queue_t v0 = (void *)APFrameworkBundle_result;

  return v0;
}

uint64_t __APFrameworkBundle_block_invoke()
{
  APFrameworkBundle_result = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];

  return MEMORY[0x270F9A758]();
}

id APUIFrameworkBundle()
{
  if (APUIFrameworkBundle_onceToken != -1) {
    dispatch_once(&APUIFrameworkBundle_onceToken, &__block_literal_global_4);
  }
  dispatch_queue_t v0 = (void *)APUIFrameworkBundle_result;

  return v0;
}

uint64_t __APUIFrameworkBundle_block_invoke()
{
  APUIFrameworkBundle_result = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];

  return MEMORY[0x270F9A758]();
}

id APGetPreferredAuthenticationMechanismLocalizedDescription()
{
  uint64_t v0 = APGetPreferredAuthenticationMechanism();

  return APGetAuthenticationMechanismLocalizedDescription(v0);
}

id APGetAuthenticationMechanismLocalizedDescription(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 2) {
    id v1 = @"UNKNOWN";
  }
  else {
    id v1 = off_26522DB18[a1 - 1];
  }
  uint64_t v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  BOOL v3 = [v2 localizedStringForKey:v1 value:&stru_26FC11A68 table:@"Localizable"];

  return v3;
}

uint64_t APGetPreferredAuthenticationMechanism()
{
  uint64_t v0 = MobileGestalt_get_current_device();
  if (MobileGestalt_get_pearlIDCapability())
  {
    uint64_t v1 = 1;
  }
  else
  {
    if (!MobileGestalt_get_touchIDCapability())
    {
      uint64_t v1 = 3;
      goto LABEL_10;
    }
    uint64_t v1 = 2;
  }
  if ((isBioAuthUsable() & 1) == 0 && !isBioLockedOut()) {
    uint64_t v1 = 3;
  }
LABEL_10:

  return v1;
}

__CFString *APGetPreferredAuthenticationMechanismLocKey()
{
  return off_26522DB18[APGetPreferredAuthenticationMechanism() - 1];
}

uint64_t isBioAuthUsable()
{
  uint64_t v0 = [MEMORY[0x263F10478] currentUser];
  uint64_t v1 = [v0 state];

  uint64_t v2 = [v1 biometry];
  uint64_t v3 = [v2 isUsable];

  return v3;
}

uint64_t isBioLockedOut()
{
  uint64_t v0 = [MEMORY[0x263F10478] currentUser];
  uint64_t v1 = [v0 state];

  uint64_t v2 = [v1 biometry];
  uint64_t v3 = [v2 isLockedOut];

  return v3;
}

id APLocStr(void *a1)
{
  id v1 = a1;
  uint64_t v2 = APFrameworkBundle();
  uint64_t v3 = [v2 localizedStringForKey:v1 value:&stru_26FC11A68 table:@"Localizable"];

  return v3;
}

id APUILocStr(void *a1)
{
  id v1 = a1;
  uint64_t v2 = APUIFrameworkBundle();
  uint64_t v3 = [v2 localizedStringForKey:v1 value:&stru_26FC11A68 table:@"Localizable"];

  return v3;
}

id APGetDescriptionFor(unint64_t a1)
{
  if (a1 > 2) {
    id v1 = @"NOT A VALID STRING TYPE";
  }
  else {
    id v1 = off_26522DB30[a1];
  }
  uint64_t v2 = APUIFrameworkBundle();
  uint64_t v3 = [v2 localizedStringForKey:v1 value:&stru_26FC11A68 table:@"Localizable"];

  return v3;
}

id APUIImageIOQueue()
{
  if (APUIImageIOQueue_onceToken != -1) {
    dispatch_once(&APUIImageIOQueue_onceToken, &__block_literal_global_37);
  }
  uint64_t v0 = (void *)APUIImageIOQueue_q;

  return v0;
}

void __APUIImageIOQueue_block_invoke()
{
  uint64_t v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.AppprotectionUI.ImageIO", v2);
  id v1 = (void *)APUIImageIOQueue_q;
  APUIImageIOQueue_q = (uint64_t)v0;
}

id APUIDataclassLocalizedName(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 bundleIdentifier];
  uint64_t v3 = [&unk_26FC14B60 objectForKey:v2];

  if (v3)
  {
    uint64_t v4 = APUILocStr(v3);
  }
  else
  {
    v5 = [v1 findApplicationRecordWithError:0];
    v6 = [v5 localizedName];
    uint64_t v7 = v6;
    if (v6)
    {
      id v8 = v6;
    }
    else
    {
      id v8 = [v1 bundleIdentifier];
    }
    uint64_t v9 = v8;

    uint64_t v10 = NSString;
    v11 = APUILocStr(@"APP_DATA_FMT");
    uint64_t v4 = objc_msgSend(v10, "stringWithFormat:", v11, v9);
  }

  return v4;
}

void type metadata accessor for APEnablementAction(uint64_t a1)
{
}

void type metadata accessor for APEnableableFeature(uint64_t a1)
{
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_247E0B9F0(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_247E0BA10(uint64_t result, int a2, int a3)
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

uint64_t sub_247E0BA4C()
{
  MKBGetDeviceLockState();
  unsigned int v0 = MKBGetDeviceLockState();
  if (v0 < 4) {
    return (7u >> (v0 & 0xF)) & 1;
  }
  if (qword_2692CF740 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_247E1A1D8();
  __swift_project_value_buffer(v2, (uint64_t)qword_2692CFB80);
  char v3 = sub_247E1A1B8();
  os_log_type_t v4 = sub_247E1A2E8();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v5 = 67109120;
    sub_247E1A3E8();
    _os_log_impl(&dword_247E02000, v3, v4, "unknown return %d from MKBGetDeviceLockState", v5, 8u);
    MEMORY[0x24C56D160](v5, -1, -1);
  }

  return 0;
}

void *sub_247E0BB90@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void sub_247E0BBA0(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_247E0BBE4(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

__n128 __swift_memcpy40_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t sub_247E0BC2C(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 40)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_247E0BC4C(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(void *)__n128 result = (a2 - 1);
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
  *(unsigned char *)(result + 40) = v3;
  return result;
}

void type metadata accessor for APSymbolBadgedAppIconViewMetrics(uint64_t a1)
{
}

void type metadata accessor for APAuthenticationMechanism(uint64_t a1)
{
}

void type metadata accessor for CGPoint(uint64_t a1)
{
}

void sub_247E0BCBC(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_247E0BD0C()
{
  uint64_t v0 = sub_247E1A1D8();
  __swift_allocate_value_buffer(v0, qword_2692CFB80);
  __swift_project_value_buffer(v0, (uint64_t)qword_2692CFB80);
  return sub_247E1A1C8();
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

Swift::Void __swiftcall APEducationVCPresentingViewController.loadView()()
{
  id v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82E00]), sel_init);
  objc_msgSend(v0, sel_setView_, v1);
}

void __swiftcall APEducationVCPresentingViewController.init(nibName:bundle:)(APEducationVCPresentingViewController *__return_ptr retstr, Swift::String_optional nibName, NSBundle_optional bundle)
{
  Class isa = bundle.value.super.isa;
  if (nibName.value._object)
  {
    uint64_t v4 = (void *)sub_247E1A248();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v4 = 0;
  }
  objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithNibName_bundle_, v4, isa);
}

id APEducationVCPresentingViewController.init(nibName:bundle:)(uint64_t a1, uint64_t a2, void *a3)
{
  if (a2)
  {
    v5 = (void *)sub_247E1A248();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }
  v8.receiver = v3;
  v8.super_class = (Class)APEducationVCPresentingViewController;
  id v6 = objc_msgSendSuper2(&v8, sel_initWithNibName_bundle_, v5, a3);

  return v6;
}

void __swiftcall APEducationVCPresentingViewController.init(coder:)(APEducationVCPresentingViewController_optional *__return_ptr retstr, NSCoder coder)
{
}

id APEducationVCPresentingViewController.init(coder:)(void *a1)
{
  v4.super_class = (Class)APEducationVCPresentingViewController;
  id v2 = objc_msgSendSuper2(&v4, sel_initWithCoder_, a1);

  return v2;
}

unint64_t type metadata accessor for APEducationVCPresentingViewController()
{
  unint64_t result = qword_2692CF778;
  if (!qword_2692CF778)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2692CF778);
  }
  return result;
}

void sub_247E0C3D0(char a1, uint64_t a2, uint64_t a3)
{
  if (a2) {
    uint64_t v5 = sub_247E1A148();
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = (id)v5;
  (*(void (**)(uint64_t, void))(a3 + 16))(a3, a1 & 1);
}

uint64_t sub_247E0C440(int a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v24 = a6;
  uint64_t v25 = a7;
  uint64_t v22 = a3;
  int v23 = a1;
  uint64_t v9 = sub_247E1A1E8();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388]();
  v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = sub_247E1A208();
  uint64_t v13 = *(void *)(v26 - 8);
  MEMORY[0x270FA5388]();
  v15 = (char *)&v21 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_247E0CD30(0, &qword_2692CF7F8);
  v16 = (void *)sub_247E1A328();
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = v22;
  *(void *)(v17 + 24) = a4;
  *(unsigned char *)(v17 + 32) = v23;
  *(void *)(v17 + 40) = a2;
  aBlock[4] = v24;
  aBlock[5] = v17;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_247E0DBE8;
  aBlock[3] = v25;
  v18 = _Block_copy(aBlock);
  swift_retain();
  id v19 = a2;
  swift_release();
  sub_247E1A1F8();
  aBlock[0] = MEMORY[0x263F8EE78];
  sub_247E0CD74();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2692CF808);
  sub_247E0CE10();
  sub_247E1A408();
  MEMORY[0x24C56C8D0](0, v15, v12, v18);
  _Block_release(v18);

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v15, v26);
}

id sub_247E0CA08(void *a1, uint64_t a2)
{
  id result = objc_msgSend(a1, sel_delegate);
  if (result)
  {
    objc_msgSend(result, sel_systemActionDelegate_requestsDismissalOfEducationController_, a1, a2);
    return (id)swift_unknownObjectRelease();
  }
  return result;
}

void __swiftcall APEducationViewControllerSystemActionDelegate.init()(APEducationViewControllerSystemActionDelegate *__return_ptr retstr)
{
  id v1 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());

  objc_msgSend(v1, sel_init);
}

id APEducationViewControllerSystemActionDelegate.init()()
{
  swift_unknownObjectWeakInit();
  v2.receiver = v0;
  v2.super_class = (Class)APEducationViewControllerSystemActionDelegate;
  return objc_msgSendSuper2(&v2, sel_init);
}

uint64_t type metadata accessor for APEducationViewControllerSystemActionDelegate(uint64_t a1)
{
  return sub_247E0CD30(a1, &qword_2692CF7F0);
}

uint64_t sub_247E0CC88()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

id sub_247E0CCC8()
{
  return sub_247E0CA08(*(void **)(v0 + 16), *(void *)(v0 + 24));
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

void sub_247E0CCE8(char a1, uint64_t a2)
{
  sub_247E0C3D0(a1, a2, *(void *)(v2 + 16));
}

uint64_t sub_247E0CCF0(int a1, void *a2)
{
  return sub_247E0C440(a1, a2, *(void *)(v2 + 16), *(void *)(v2 + 24), (uint64_t)&unk_26FC10F30, (uint64_t)sub_247E0CD70, (uint64_t)&block_descriptor_17);
}

uint64_t sub_247E0CD30(uint64_t a1, unint64_t *a2)
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

unint64_t sub_247E0CD74()
{
  unint64_t result = qword_2692CF800;
  if (!qword_2692CF800)
  {
    sub_247E1A1E8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2692CF800);
  }
  return result;
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

unint64_t sub_247E0CE10()
{
  unint64_t result = qword_2692CF810;
  if (!qword_2692CF810)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2692CF808);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2692CF810);
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

uint64_t sub_247E0CEB4()
{
  _Block_release(*(const void **)(v0 + 16));

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_247E0CEEC()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_247E0CF24(int a1, void *a2)
{
  return sub_247E0C440(a1, a2, *(void *)(v2 + 16), *(void *)(v2 + 24), (uint64_t)&unk_26FC10FA8, (uint64_t)sub_247E0CD70, (uint64_t)&block_descriptor_33);
}

uint64_t sub_247E0CF68(int a1, void *a2)
{
  return sub_247E0C440(a1, a2, *(void *)(v2 + 16), *(void *)(v2 + 24), (uint64_t)&unk_26FC11020, (uint64_t)sub_247E0CD70, (uint64_t)&block_descriptor_49);
}

uint64_t objectdestroy_13Tm()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_247E0CFEC()
{
  return (*(uint64_t (**)(void, void))(v0 + 16))(*(unsigned __int8 *)(v0 + 32), *(void *)(v0 + 40));
}

uint64_t sub_247E0D020(uint64_t a1)
{
  return a1;
}

void static APSymbolBadgedAppIconView.metricsForEducation()(__n128 *a1@<X8>)
{
}

void static APSymbolBadgedAppIconView.metricsForExtensionShield()(__n128 *a1@<X8>)
{
}

void sub_247E0D0CC(__n128 *a1@<X8>, __n128 a2@<Q2>)
{
  double v3 = CGPointMake();
  *a1 = a2;
  a1[1].n128_f64[0] = v3;
  a1[1].n128_u64[1] = v4;
  a1[2].n128_u64[0] = 0x4010000000000000;
}

char *sub_247E0D124(void *a1, void *a2, double *a3)
{
  double v7 = a3[4];
  double v8 = CGPointMake(a3[2] + v7, a3[3] + v7, *a3, *a3);
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  v15 = (objc_class *)MEMORY[0x263F82828];
  v16 = v3;
  id v17 = objc_msgSend(objc_allocWithZone(v15), sel_initWithFrame_, v8, v10, v12, v14);
  *(void *)&v16[OBJC_IVAR___APSymbolBadgedAppIconView_appIconImageView] = v17;
  objc_msgSend(v17, sel_frame);
  CGFloat MaxX = CGRectGetMaxX(v51);
  double v19 = a3[1];
  double v20 = MaxX - v19 * 0.5;
  objc_msgSend(v17, sel_frame);
  CGFloat MaxY = CGRectGetMaxY(v52);
  double v22 = CGPointMake(v20, MaxY - v19 * 0.5, v19, v19);
  id v26 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82828]), sel_initWithFrame_, v22, v23, v24, v25);
  *(void *)&v16[OBJC_IVAR___APSymbolBadgedAppIconView_badgeImageView] = v26;
  v27 = &v16[OBJC_IVAR___APSymbolBadgedAppIconView_metrics];
  long long v28 = *((_OWORD *)a3 + 1);
  *(_OWORD *)v27 = *(_OWORD *)a3;
  *((_OWORD *)v27 + 1) = v28;
  *((double *)v27 + 4) = a3[4];

  double v29 = *MEMORY[0x263F001A8];
  double v30 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v31 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v32 = *(double *)(MEMORY[0x263F001A8] + 24);
  v50.receiver = v16;
  v50.super_class = (Class)APSymbolBadgedAppIconView;
  v33 = (char *)objc_msgSendSuper2(&v50, sel_initWithFrame_, v29, v30, v31, v32);
  uint64_t v34 = OBJC_IVAR___APSymbolBadgedAppIconView_appIconImageView;
  v35 = *(void **)&v33[OBJC_IVAR___APSymbolBadgedAppIconView_appIconImageView];
  v36 = v33;
  objc_msgSend(v35, sel_setImage_, a1);
  uint64_t v37 = OBJC_IVAR___APSymbolBadgedAppIconView_badgeImageView;
  v38 = *(void **)&v36[OBJC_IVAR___APSymbolBadgedAppIconView_badgeImageView];
  objc_msgSend(v38, sel_setImage_, a2);
  objc_msgSend(v38, sel_setContentMode_, 1);
  objc_msgSend(v35, sel_setContentMode_, 1);
  id v39 = objc_msgSend(v36, sel_layer);
  objc_msgSend(v39, sel_setShadowRadius_, v7);

  id v40 = objc_msgSend(v36, sel_layer);
  LODWORD(v41) = 1041865114;
  objc_msgSend(v40, sel_setShadowOpacity_, v41);

  id v42 = objc_msgSend(v36, sel_layer);
  id v43 = objc_msgSend(self, sel_blackColor);
  id v44 = objc_msgSend(v43, sel_CGColor);

  objc_msgSend(v42, sel_setShadowColor_, v44);
  id v45 = objc_msgSend(v36, sel_layer);
  objc_msgSend(v45, sel_setShadowOffset_, 0.0, v7);

  objc_msgSend(v36, sel_addSubview_, *(void *)&v33[v34]);
  v46 = *(void **)&v36[v37];
  v47 = v36;
  id v48 = v46;
  objc_msgSend(v47, sel_addSubview_, v48);

  return v47;
}

void sub_247E0D498(void *a1, void *a2, uint64_t a3)
{
  double v7 = *(double *)a3;
  uint64_t v8 = *(void *)(a3 + 8);
  double v9 = *(uint64_t (**)(uint64_t))(a3 + 16);
  double v10 = *(void **)(a3 + 24);
  double v11 = *(void (**)())(a3 + 32);
  uint64_t v12 = sub_247E1A1E8();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388]();
  v46 = (char *)&v41 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v47 = sub_247E1A208();
  uint64_t v45 = *(void *)(v47 - 8);
  MEMORY[0x270FA5388]();
  id v44 = (char *)&v41 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v16 = objc_msgSend(a1, sel_bundleIdentifier);
  sub_247E1A258();

  id v17 = objc_allocWithZone(MEMORY[0x263F4B540]);
  v18 = (void *)sub_247E1A248();
  swift_bridgeObjectRelease();
  id v19 = objc_msgSend(v17, sel_initWithBundleIdentifier_, v18);

  id v20 = objc_msgSend(self, sel_imageDescriptorNamed_, *MEMORY[0x263F4B580]);
  objc_msgSend(v20, sel_setSize_, CGPointMake(*(double *)a3, *(double *)a3, v21, v22));
  id v23 = objc_msgSend(v19, sel_imageForDescriptor_, v20);

  uint64_t v48 = v13;
  if (!v23)
  {
    double v30 = self;
    double v31 = (void *)sub_247E1A248();
    id v29 = objc_msgSend(v30, sel___systemImageNamedSwift_, v31);

    if (v29) {
      goto LABEL_5;
    }
LABEL_12:
    __break(1u);
    return;
  }
  id v24 = objc_msgSend(v23, sel_CGImage);
  if (!v24)
  {
    __break(1u);
    goto LABEL_12;
  }
  double v25 = v24;
  id v26 = objc_msgSend(self, sel_mainScreen);
  objc_msgSend(v26, sel_scale);
  double v28 = v27;

  id v29 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F827E8]), sel_initWithCGImage_scale_orientation_, v25, 0, v28);
LABEL_5:
  double aBlock = v7;
  uint64_t v51 = v8;
  CGRect v52 = v9;
  v53 = v10;
  v54 = v11;
  id v32 = objc_msgSend(v3, sel_initWithApplicationIconImage_badgeImage_metrics_, v29, a2, &aBlock);
  if (v23)
  {
    id v33 = v32;
    id v34 = v23;
    if (objc_msgSend(v34, sel_placeholder))
    {
      id v43 = APUIImageIOQueue();
      uint64_t v35 = swift_allocObject();
      long long v36 = *(_OWORD *)(a3 + 16);
      *(_OWORD *)(v35 + 24) = *(_OWORD *)a3;
      *(void *)(v35 + 16) = v19;
      *(_OWORD *)(v35 + 40) = v36;
      *(void *)(v35 + 56) = *(void *)(a3 + 32);
      *(void *)(v35 + 64) = v33;
      v54 = sub_247E0F62C;
      uint64_t v55 = v35;
      double aBlock = MEMORY[0x263EF8330];
      uint64_t v51 = 1107296256;
      CGRect v52 = sub_247E0DBE8;
      v53 = &block_descriptor_31;
      uint64_t v37 = _Block_copy(&aBlock);
      id v42 = v19;
      v38 = v44;
      sub_247E1A1F8();
      uint64_t v49 = MEMORY[0x263F8EE78];
      sub_247E0CD74();
      id v41 = a2;
      __swift_instantiateConcreteTypeFromMangledName(&qword_2692CF808);
      sub_247E0CE10();
      id v39 = v46;
      sub_247E1A408();
      id v40 = v43;
      MEMORY[0x24C56C8D0](0, v38, v39, v37);

      _Block_release(v37);
      (*(void (**)(char *, uint64_t))(v48 + 8))(v39, v12);
      (*(void (**)(char *, uint64_t))(v45 + 8))(v38, v47);
      swift_release();
      return;
    }
  }
  else
  {
  }
}

void sub_247E0D9E0(void *a1, double *a2, void *a3)
{
  id v6 = objc_msgSend(self, sel_imageDescriptorNamed_, *MEMORY[0x263F4B580]);
  objc_msgSend(v6, sel_setSize_, CGPointMake(*a2, *a2, v7, v8));
  id v9 = objc_msgSend(a1, sel_prepareImageForDescriptor_, v6);

  if (v9)
  {
    sub_247E0CD30(0, &qword_2692CF7F8);
    double v10 = sub_247E1A328();
    uint64_t v11 = swift_allocObject();
    *(void *)(v11 + 16) = v9;
    *(void *)(v11 + 24) = a3;
    uint64_t v12 = swift_allocObject();
    *(void *)(v12 + 16) = sub_247E0F63C;
    *(void *)(v12 + 24) = v11;
    v17[4] = sub_247E0FCA4;
    v17[5] = v12;
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 1107296256;
    v17[2] = sub_247E12164;
    v17[3] = &block_descriptor_41;
    uint64_t v13 = _Block_copy(v17);
    id v14 = v9;
    id v15 = a3;
    swift_retain();
    swift_release();
    dispatch_sync(v10, v13);

    _Block_release(v13);
    char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
    swift_release();
    swift_release();
    if (isEscapingClosureAtFileLocation) {
      __break(1u);
    }
  }
}

uint64_t sub_247E0DBE8(uint64_t a1)
{
  id v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

uint64_t sub_247E0DC44(uint64_t a1, uint64_t a2, void *a3, void *a4, uint64_t a5, uint64_t (*a6)(void *, void *, _OWORD *))
{
  uint64_t v6 = *(void *)(a5 + 32);
  long long v7 = *(_OWORD *)(a5 + 16);
  v9[0] = *(_OWORD *)a5;
  v9[1] = v7;
  uint64_t v10 = v6;
  return a6(a3, a4, v9);
}

void sub_247E0DCB0(void *a1, uint64_t a2, uint64_t a3, double *a4)
{
  double v8 = *a4;
  double v7 = a4[1];
  id v9 = (uint64_t (*)(uint64_t))*((void *)a4 + 2);
  uint64_t v10 = (void *)*((void *)a4 + 3);
  uint64_t v11 = (void (*)())*((void *)a4 + 4);
  uint64_t v12 = sub_247E1A1E8();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388]();
  id v44 = (char *)&v42 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_247E1A208();
  uint64_t v45 = *(void *)(v15 - 8);
  MEMORY[0x270FA5388]();
  id v17 = (char *)&v42 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v18 = objc_allocWithZone(MEMORY[0x263F4B540]);
  id v19 = (void *)sub_247E1A248();
  swift_bridgeObjectRelease();
  id v20 = objc_msgSend(v18, sel_initWithType_, v19);

  id v21 = objc_msgSend(self, sel_imageDescriptorNamed_, *MEMORY[0x263F4B5A0]);
  objc_msgSend(v21, sel_setSize_, CGPointMake(v7, v7, v22, v23));
  id v24 = objc_msgSend(v20, sel_imageForDescriptor_, v21);

  uint64_t v46 = v15;
  uint64_t v47 = v13;
  if (!v24)
  {
    double v31 = self;
    id v32 = (void *)sub_247E1A248();
    id v30 = objc_msgSend(v31, sel___systemImageNamedSwift_, v32);

    if (v30) {
      goto LABEL_5;
    }
LABEL_12:
    __break(1u);
    return;
  }
  id v25 = objc_msgSend(v24, sel_CGImage);
  if (!v25)
  {
    __break(1u);
    goto LABEL_12;
  }
  id v26 = v25;
  id v27 = objc_msgSend(self, sel_mainScreen);
  objc_msgSend(v27, sel_scale);
  double v29 = v28;

  id v30 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F827E8]), sel_initWithCGImage_scale_orientation_, v26, 0, v29);
LABEL_5:
  double aBlock = v8;
  uint64_t v50 = *(void *)&v7;
  uint64_t v51 = v9;
  CGRect v52 = v10;
  v53 = v11;
  id v33 = objc_msgSend(v4, sel_initWithApplicationIconImage_badgeImage_metrics_, a1, v30, &aBlock);
  if (v24)
  {
    id v34 = v33;
    id v35 = v24;
    if (objc_msgSend(v35, sel_placeholder))
    {
      id v43 = APUIImageIOQueue();
      uint64_t v36 = swift_allocObject();
      long long v37 = *((_OWORD *)a4 + 1);
      *(_OWORD *)(v36 + 24) = *(_OWORD *)a4;
      *(void *)(v36 + 16) = v20;
      *(_OWORD *)(v36 + 40) = v37;
      *(double *)(v36 + 56) = a4[4];
      *(void *)(v36 + 64) = v34;
      v53 = sub_247E0F5A8;
      uint64_t v54 = v36;
      double aBlock = MEMORY[0x263EF8330];
      uint64_t v50 = 1107296256;
      uint64_t v51 = sub_247E0DBE8;
      CGRect v52 = &block_descriptor_15;
      v38 = _Block_copy(&aBlock);
      id v42 = v20;
      id v39 = v17;
      sub_247E1A1F8();
      uint64_t v48 = MEMORY[0x263F8EE78];
      sub_247E0CD74();
      __swift_instantiateConcreteTypeFromMangledName(&qword_2692CF808);
      sub_247E0CE10();
      id v40 = v44;
      sub_247E1A408();
      id v41 = v43;
      MEMORY[0x24C56C8D0](0, v39, v40, v38);

      _Block_release(v38);
      (*(void (**)(char *, uint64_t))(v47 + 8))(v40, v12);
      (*(void (**)(char *, uint64_t))(v45 + 8))(v39, v46);
      swift_release();
      return;
    }
  }
  else
  {
  }
}

void sub_247E0E1C0(void *a1, uint64_t a2, void *a3)
{
  id v6 = objc_msgSend(self, sel_imageDescriptorNamed_, *MEMORY[0x263F4B5A0]);
  objc_msgSend(v6, sel_setSize_, CGPointMake(*(double *)(a2 + 8), *(double *)(a2 + 8), v7, v8));
  id v9 = objc_msgSend(a1, sel_prepareImageForDescriptor_, v6);

  if (v9)
  {
    sub_247E0CD30(0, &qword_2692CF7F8);
    uint64_t v10 = sub_247E1A328();
    uint64_t v11 = swift_allocObject();
    *(void *)(v11 + 16) = v9;
    *(void *)(v11 + 24) = a3;
    uint64_t v12 = swift_allocObject();
    *(void *)(v12 + 16) = sub_247E0F5F8;
    *(void *)(v12 + 24) = v11;
    v17[4] = sub_247E0FCA4;
    v17[5] = v12;
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 1107296256;
    v17[2] = sub_247E12164;
    v17[3] = &block_descriptor_25;
    uint64_t v13 = _Block_copy(v17);
    id v14 = v9;
    id v15 = a3;
    swift_retain();
    swift_release();
    dispatch_sync(v10, v13);

    _Block_release(v13);
    char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
    swift_release();
    swift_release();
    if (isEscapingClosureAtFileLocation) {
      __break(1u);
    }
  }
}

void sub_247E0E3E0(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  double v7 = *(double *)a4;
  uint64_t v8 = *(void *)(a4 + 8);
  id v9 = *(uint64_t (**)(uint64_t))(a4 + 16);
  uint64_t v10 = *(void **)(a4 + 24);
  uint64_t v11 = *(void (**)())(a4 + 32);
  uint64_t v12 = sub_247E1A1E8();
  uint64_t v51 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v49 = (char *)&v45 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v50 = sub_247E1A208();
  uint64_t v48 = *(void *)(v50 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v47 = (char *)&v45 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v15 = objc_msgSend(a1, sel_bundleIdentifier);
  sub_247E1A258();

  id v16 = objc_allocWithZone(MEMORY[0x263F4B540]);
  id v17 = (void *)sub_247E1A248();
  swift_bridgeObjectRelease();
  id v18 = objc_msgSend(v16, sel_initWithBundleIdentifier_, v17);

  id v19 = objc_msgSend(self, sel_imageDescriptorNamed_, *MEMORY[0x263F4B580]);
  objc_msgSend(v19, sel_setSize_, CGPointMake(*(double *)a4, *(double *)a4, v20, v21));
  id v22 = objc_msgSend(v18, sel_imageForDescriptor_, v19);

  uint64_t v52 = v12;
  if (!v22)
  {
    double v29 = self;
    id v30 = a1;
    double v31 = (void *)sub_247E1A248();
    id v28 = objc_msgSend(v29, sel___systemImageNamedSwift_, v31);

    a1 = v30;
    if (v28) {
      goto LABEL_5;
    }
LABEL_12:
    __break(1u);
    return;
  }
  id v23 = objc_msgSend(v22, sel_CGImage);
  if (!v23)
  {
    __break(1u);
    goto LABEL_12;
  }
  id v24 = v23;
  id v25 = objc_msgSend(self, sel_mainScreen);
  objc_msgSend(v25, sel_scale);
  double v27 = v26;

  id v28 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F827E8]), sel_initWithCGImage_scale_orientation_, v24, 0, v27);
LABEL_5:
  id v32 = (void *)sub_247E1A248();
  swift_bridgeObjectRelease();
  double aBlock = v7;
  uint64_t v55 = v8;
  v56 = v9;
  v57 = v10;
  v58 = v11;
  id v33 = objc_msgSend(v4, sel_initWithApplicationIconImage_symbolType_metrics_, v28, v32, &aBlock);

  if (v22)
  {
    id v34 = v33;
    id v35 = v22;
    if (objc_msgSend(v35, sel_placeholder))
    {
      id v46 = APUIImageIOQueue();
      uint64_t v36 = swift_allocObject();
      long long v37 = *(_OWORD *)(a4 + 16);
      *(_OWORD *)(v36 + 24) = *(_OWORD *)a4;
      *(void *)(v36 + 16) = v18;
      *(_OWORD *)(v36 + 40) = v37;
      *(void *)(v36 + 56) = *(void *)(a4 + 32);
      *(void *)(v36 + 64) = v34;
      v58 = sub_247E0F568;
      uint64_t v59 = v36;
      double aBlock = MEMORY[0x263EF8330];
      uint64_t v55 = 1107296256;
      v56 = sub_247E0DBE8;
      v57 = &block_descriptor_0;
      v38 = _Block_copy(&aBlock);
      id v39 = v18;
      id v45 = a1;
      id v40 = v39;
      id v41 = v47;
      sub_247E1A1F8();
      uint64_t v53 = MEMORY[0x263F8EE78];
      sub_247E0CD74();
      __swift_instantiateConcreteTypeFromMangledName(&qword_2692CF808);
      sub_247E0CE10();
      id v42 = v49;
      uint64_t v43 = v52;
      sub_247E1A408();
      id v44 = v46;
      MEMORY[0x24C56C8D0](0, v41, v42, v38);

      _Block_release(v38);
      (*(void (**)(char *, uint64_t))(v51 + 8))(v42, v43);
      (*(void (**)(char *, uint64_t))(v48 + 8))(v41, v50);
      swift_release();
      return;
    }
  }
  else
  {
  }
}

void sub_247E0E948(void *a1, double *a2, void *a3)
{
  id v6 = objc_msgSend(self, sel_imageDescriptorNamed_, *MEMORY[0x263F4B580]);
  objc_msgSend(v6, sel_setSize_, CGPointMake(*a2, *a2, v7, v8));
  id v9 = objc_msgSend(a1, sel_prepareImageForDescriptor_, v6);

  if (v9)
  {
    sub_247E0CD30(0, &qword_2692CF7F8);
    uint64_t v10 = sub_247E1A328();
    uint64_t v11 = swift_allocObject();
    *(void *)(v11 + 16) = v9;
    *(void *)(v11 + 24) = a3;
    uint64_t v12 = swift_allocObject();
    *(void *)(v12 + 16) = sub_247E0FCA8;
    *(void *)(v12 + 24) = v11;
    v17[4] = sub_247E0F5A0;
    v17[5] = v12;
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 1107296256;
    v17[2] = sub_247E12164;
    v17[3] = &block_descriptor_9;
    uint64_t v13 = _Block_copy(v17);
    id v14 = v9;
    id v15 = a3;
    swift_retain();
    swift_release();
    dispatch_sync(v10, v13);

    _Block_release(v13);
    char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
    swift_release();
    swift_release();
    if (isEscapingClosureAtFileLocation) {
      __break(1u);
    }
  }
}

void sub_247E0EB50(void *a1, uint64_t a2, void *a3)
{
  double v3 = *(void **)(a2 + *a3);
  id v4 = objc_msgSend(a1, sel_CGImage);
  if (v4)
  {
    uint64_t v5 = v4;
    id v6 = objc_msgSend(self, sel_mainScreen);
    objc_msgSend(v6, sel_scale);
    double v8 = v7;

    id v9 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F827E8]), sel_initWithCGImage_scale_orientation_, v5, 0, v8);
    objc_msgSend(v3, sel_setImage_, v9);
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_247E0EC50(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t (*a6)(void *, uint64_t, uint64_t, _OWORD *))
{
  uint64_t v8 = *(void *)(a5 + 32);
  long long v9 = *(_OWORD *)(a5 + 16);
  v13[0] = *(_OWORD *)a5;
  v13[1] = v9;
  uint64_t v14 = v8;
  uint64_t v10 = sub_247E1A258();
  return a6(a3, v10, v11, v13);
}

void __swiftcall APSymbolBadgedAppIconView.init(coder:)(APSymbolBadgedAppIconView_optional *__return_ptr retstr, NSCoder coder)
{
}

void APSymbolBadgedAppIconView.init(coder:)()
{
}

CGSize __swiftcall APSymbolBadgedAppIconView.sizeThatFits(_:)(CGSize a1)
{
  double width = a1.width;
  uint64_t v3 = v1 + OBJC_IVAR___APSymbolBadgedAppIconView_metrics;
  double v4 = *(double *)(v1 + OBJC_IVAR___APSymbolBadgedAppIconView_metrics);
  double v5 = *(double *)(v1 + OBJC_IVAR___APSymbolBadgedAppIconView_metrics + 8);
  CGFloat v6 = (width - v4) * 0.5;
  double v7 = *(double *)(v1 + OBJC_IVAR___APSymbolBadgedAppIconView_metrics + 16);
  double v8 = *(double *)(v1 + OBJC_IVAR___APSymbolBadgedAppIconView_metrics + 24);
  CGFloat v9 = v7 + v4 + v6 - v5;
  rect.origin.x = v9;
  CGFloat v10 = v4 + 0.0 - v5 + v8;
  double v11 = CGPointMake(v4, v4, v7, v8);
  double v13 = v12;
  CGFloat v16 = CGPointMake(v5, v5, v14, v15);
  CGFloat v18 = v17;
  double v19 = *(double *)(v3 + 32);
  v40.origin.x = v9;
  v40.origin.y = v10;
  v40.size.double width = v16;
  v40.size.height = v18;
  double MaxX = CGRectGetMaxX(v40);
  v41.origin.y = 0.0;
  v41.origin.x = v6;
  v41.size.double width = v11;
  v41.size.height = v13;
  double v21 = v19 + MaxX - CGRectGetMaxX(v41);
  v42.origin.x = rect.origin.x;
  v42.origin.y = v10;
  v42.size.double width = v16;
  v42.size.height = v18;
  double MaxY = CGRectGetMaxY(v42);
  v43.origin.y = 0.0;
  v43.origin.x = v6;
  v43.size.double width = v11;
  v43.size.height = v13;
  double v23 = v19 + MaxY - CGRectGetMaxY(v43);
  if (v19 > v21) {
    double v24 = v19;
  }
  else {
    double v24 = v21;
  }
  double v25 = v24 + v24;
  if (qword_2692CF740 != -1) {
    swift_once();
  }
  double v26 = v13 + v23;
  uint64_t v27 = sub_247E1A1D8();
  __swift_project_value_buffer(v27, (uint64_t)qword_2692CFB80);
  id v28 = sub_247E1A1B8();
  os_log_type_t v29 = sub_247E1A2F8();
  if (os_log_type_enabled(v28, v29))
  {
    uint64_t v30 = swift_slowAlloc();
    uint64_t v31 = swift_slowAlloc();
    *(void *)&rect.size.height = v31;
    *(_DWORD *)uint64_t v30 = 136315394;
    type metadata accessor for CGSize(0);
    uint64_t v32 = sub_247E1A288();
    sub_247E0F440(v32, v33, (uint64_t *)&rect.size.height);
    sub_247E1A3E8();
    swift_bridgeObjectRelease();
    *(_WORD *)(v30 + 12) = 2080;
    uint64_t v34 = sub_247E1A288();
    sub_247E0F440(v34, v35, (uint64_t *)&rect.size.height);
    sub_247E1A3E8();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_247E02000, v28, v29, "size that fits %s is %s", (uint8_t *)v30, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x24C56D160](v31, -1, -1);
    MEMORY[0x24C56D160](v30, -1, -1);
  }

  double v36 = v11 + v25;
  double v37 = v26;
  result.height = v37;
  result.double width = v36;
  return result;
}

id APSymbolBadgedAppIconView.intrinsicContentSize.getter()
{
  return objc_msgSend(v0, sel_sizeThatFits_, 1000.0, 1000.0);
}

Swift::Void __swiftcall APSymbolBadgedAppIconView.layoutSubviews()()
{
  v24.super_class = (Class)APSymbolBadgedAppIconView;
  objc_msgSendSuper2(&v24, sel_layoutSubviews);
  objc_msgSend(v0, sel_bounds);
  uint64_t v1 = (double *)&v0[OBJC_IVAR___APSymbolBadgedAppIconView_metrics];
  double v2 = *(double *)&v0[OBJC_IVAR___APSymbolBadgedAppIconView_metrics];
  double v3 = *(double *)&v0[OBJC_IVAR___APSymbolBadgedAppIconView_metrics + 8];
  double v5 = (v4 - v2) * 0.5;
  double v6 = *(double *)&v0[OBJC_IVAR___APSymbolBadgedAppIconView_metrics + 16];
  double v7 = *(double *)&v0[OBJC_IVAR___APSymbolBadgedAppIconView_metrics + 24];
  double v8 = v6 + v2 + v5 - v3;
  double v9 = v2 + 0.0 - v3 + v7;
  double v10 = CGPointMake(v2, v2, v6, v7);
  double v12 = v11;
  double v15 = CGPointMake(v3, v3, v13, v14);
  double v17 = v16;
  double v18 = v1[4];
  double v19 = *(void **)&v0[OBJC_IVAR___APSymbolBadgedAppIconView_appIconImageView];
  objc_msgSend(v19, sel_setFrame_, v5, 0.0, v10, v12);
  objc_msgSend(*(id *)&v0[OBJC_IVAR___APSymbolBadgedAppIconView_badgeImageView], sel_setFrame_, v8, v9, v15, v17);
  id v20 = objc_msgSend(v19, sel_layer);
  objc_msgSend(v20, sel_shadowRadius);
  double v22 = v21;

  if (v22 != v18)
  {
    id v23 = objc_msgSend(v19, sel_layer);
    objc_msgSend(v23, sel_setShadowRadius_, v18);
  }
}

void __swiftcall APSymbolBadgedAppIconView.init(frame:)(APSymbolBadgedAppIconView *__return_ptr retstr, CGRect frame)
{
  double height = frame.size.height;
  double width = frame.size.width;
  double y = frame.origin.y;
  double x = frame.origin.x;
  id v6 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());

  objc_msgSend(v6, sel_initWithFrame_, x, y, width, height);
}

void APSymbolBadgedAppIconView.init(frame:)()
{
}

uint64_t sub_247E0F440(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_247E0F670(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_247E0F87C((uint64_t)v12, *a3);
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
      sub_247E0F87C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t type metadata accessor for APSymbolBadgedAppIconView(uint64_t a1)
{
  return sub_247E0CD30(a1, &qword_2692CF898);
}

uint64_t sub_247E0F528()
{
  return MEMORY[0x270FA0238](v0, 72, 7);
}

void sub_247E0F568()
{
  sub_247E0E948(*(void **)(v0 + 16), (double *)(v0 + 24), *(void **)(v0 + 64));
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

uint64_t sub_247E0F590()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_247E0F5A0()
{
  return sub_247E1213C(*(uint64_t (**)(void))(v0 + 16));
}

void sub_247E0F5A8()
{
  sub_247E0E1C0(*(void **)(v0 + 16), v0 + 24, *(void **)(v0 + 64));
}

uint64_t sub_247E0F5B8()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

void sub_247E0F5F8()
{
  sub_247E0EB50(*(void **)(v0 + 16), *(void *)(v0 + 24), &OBJC_IVAR___APSymbolBadgedAppIconView_badgeImageView);
}

uint64_t sub_247E0F61C()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

void sub_247E0F62C()
{
  sub_247E0D9E0(*(void **)(v0 + 16), (double *)(v0 + 24), *(void **)(v0 + 64));
}

void sub_247E0F63C()
{
  sub_247E0EB50(*(void **)(v0 + 16), *(void *)(v0 + 24), &OBJC_IVAR___APSymbolBadgedAppIconView_appIconImageView);
}

uint64_t sub_247E0F660()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_247E0F670(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_247E1A3F8();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_247E0F8D8(a5, a6);
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
  uint64_t v8 = sub_247E1A448();
  if (!v8)
  {
    sub_247E1A458();
    __break(1u);
LABEL_17:
    uint64_t result = sub_247E1A488();
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

uint64_t sub_247E0F87C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_247E0F8D8(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_247E0F970(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_247E0FB50(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_247E0FB50(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_247E0F970(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_247E0FAE8(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_247E1A428();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_247E1A458();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_247E1A2A8();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_247E1A488();
    __break(1u);
LABEL_14:
    uint64_t result = sub_247E1A458();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_247E0FAE8(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2692CF8A0);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_247E0FB50(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2692CF8A0);
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
  double v13 = a4 + 32;
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
  uint64_t result = sub_247E1A488();
  __break(1u);
  return result;
}

void sub_247E0FCE4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2 + 16;
  swift_beginAccess();
  uint64_t v3 = MEMORY[0x24C56D1C0](v2);
  if (v3)
  {
    unint64_t v4 = (char *)v3;
    objc_msgSend(*(id *)(v3 + OBJC_IVAR____TtC15AppProtectionUI37APHiddenAppConfirmationViewController_button), sel_setEnabled_, 0);
    size_t v5 = &v4[OBJC_IVAR____TtC15AppProtectionUI37APHiddenAppConfirmationViewController_delegate];
    if (MEMORY[0x24C56D1C0](&v4[OBJC_IVAR____TtC15AppProtectionUI37APHiddenAppConfirmationViewController_delegate]))
    {
      uint64_t v6 = *((void *)v5 + 1);
      uint64_t ObjectType = swift_getObjectType();
      (*(void (**)(char *, uint64_t, uint64_t))(v6 + 8))(v4, ObjectType, v6);

      swift_unknownObjectRelease();
    }
    else
    {
    }
  }
}

void sub_247E0FE04(char a1)
{
  v8.receiver = v1;
  v8.super_class = (Class)type metadata accessor for APHiddenAppConfirmationViewController();
  objc_msgSendSuper2(&v8, sel_viewDidAppear_, a1 & 1);
  uint64_t v3 = *(char **)&v1[OBJC_IVAR____TtC15AppProtectionUI37APHiddenAppConfirmationViewController_welcomeController];
  if (v3)
  {
    unint64_t v4 = *(void **)&v3[OBJC_IVAR____TtC15AppProtectionUI29APOnBoardingWelcomeController_assistant];
    if (v4)
    {
      size_t v5 = v3;
      id v6 = v4;
      id v7 = objc_msgSend(v5, sel_scrollView);
      objc_msgSend(v6, sel_performAdjustmentsForScrollView_, v7);
    }
  }
  else
  {
    __break(1u);
  }
}

void sub_247E0FF18()
{
  v6.receiver = v0;
  v6.super_class = (Class)type metadata accessor for APHiddenAppConfirmationViewController();
  objc_msgSendSuper2(&v6, sel_viewDidLayoutSubviews);
  uint64_t v1 = *(char **)&v0[OBJC_IVAR____TtC15AppProtectionUI37APHiddenAppConfirmationViewController_welcomeController];
  if (v1)
  {
    uint64_t v2 = *(void **)&v1[OBJC_IVAR____TtC15AppProtectionUI29APOnBoardingWelcomeController_assistant];
    if (v2)
    {
      uint64_t v3 = v1;
      id v4 = v2;
      id v5 = objc_msgSend(v3, sel_scrollView);
      objc_msgSend(v4, sel_performAdjustmentsForScrollView_, v5);
    }
  }
  else
  {
    __break(1u);
  }
}

id sub_247E10018()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for APHiddenAppConfirmationViewController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for APHiddenAppConfirmationViewController()
{
  return self;
}

void sub_247E1018C()
{
  *(void *)&v0[OBJC_IVAR____TtC15AppProtectionUI37APHiddenAppConfirmationViewController_welcomeController] = 0;
  *(void *)&v0[OBJC_IVAR____TtC15AppProtectionUI37APHiddenAppConfirmationViewController_navController] = 0;
  uint64_t v1 = OBJC_IVAR____TtC15AppProtectionUI37APHiddenAppConfirmationViewController_button;
  objc_super v2 = (void *)sub_247E1A248();
  id v3 = APUILocStr(v2);

  uint64_t v4 = sub_247E1A258();
  uint64_t v6 = v5;

  uint64_t v7 = sub_247E11CBC(v4, v6);
  swift_bridgeObjectRelease();
  *(void *)&v0[v1] = v7;
  *(void *)&v0[OBJC_IVAR____TtC15AppProtectionUI37APHiddenAppConfirmationViewController_delegate + 8] = 0;
  swift_unknownObjectWeakInit();

  sub_247E1A468();
  __break(1u);
}

void sub_247E102A0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2 + 16;
  swift_beginAccess();
  uint64_t v3 = MEMORY[0x24C56D1C0](v2);
  if (v3)
  {
    uint64_t v4 = (void *)v3;
    uint64_t v5 = v3 + OBJC_IVAR____TtC15AppProtectionUI35APLockedAppDisclosureViewController_delegate;
    if (MEMORY[0x24C56D1C0](v3 + OBJC_IVAR____TtC15AppProtectionUI35APLockedAppDisclosureViewController_delegate))
    {
      uint64_t v6 = *(void *)(v5 + 8);
      uint64_t ObjectType = swift_getObjectType();
      (*(void (**)(void *, uint64_t, uint64_t))(v6 + 8))(v4, ObjectType, v6);

      swift_unknownObjectRelease();
    }
    else
    {
    }
  }
}

void sub_247E1034C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = a2 + 16;
  swift_beginAccess();
  uint64_t v5 = MEMORY[0x24C56D1C0](v4);
  if (v5)
  {
    uint64_t v6 = (void *)v5;
    swift_beginAccess();
    if (MEMORY[0x24C56D1C0](a3 + 16))
    {
      uint64_t v7 = *(void *)(a3 + 24);
      uint64_t ObjectType = swift_getObjectType();
      (*(void (**)(void *, uint64_t, uint64_t))(v7 + 16))(v6, ObjectType, v7);

      swift_unknownObjectRelease();
    }
    else
    {
    }
  }
}

id sub_247E105A4()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for APLockedAppDisclosureViewController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for APLockedAppDisclosureViewController()
{
  return self;
}

void sub_247E10668()
{
  uint64_t v1 = OBJC_IVAR____TtC15AppProtectionUI35APLockedAppDisclosureViewController_scrollViewAssistant;
  *(void *)&v0[v1] = objc_msgSend(objc_allocWithZone((Class)APButtonTrayScrollViewAssistant), sel_init);
  uint64_t v2 = OBJC_IVAR____TtC15AppProtectionUI35APLockedAppDisclosureViewController_button;
  uint64_t v3 = (void *)sub_247E1A248();
  id v4 = APUILocStr(v3);

  uint64_t v5 = sub_247E1A258();
  uint64_t v7 = v6;

  uint64_t v8 = sub_247E11CBC(v5, v7);
  swift_bridgeObjectRelease();
  *(void *)&v0[v2] = v8;
  *(void *)&v0[OBJC_IVAR____TtC15AppProtectionUI35APLockedAppDisclosureViewController_delegate + 8] = 0;
  swift_unknownObjectWeakInit();

  sub_247E1A468();
  __break(1u);
}

id sub_247E10774()
{
  id result = objc_msgSend(objc_allocWithZone((Class)APFeatureSemioticsManager), sel_init);
  qword_26B13A240 = (uint64_t)result;
  return result;
}

APFeatureSemioticsManager __swiftcall APFeatureSemioticsManager.init()()
{
  id v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());

  return (APFeatureSemioticsManager)objc_msgSend(v0, sel_init);
}

id sub_247E1086C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(uint64_t, uint64_t))
{
  a5(a3, a4);
  uint64_t v5 = (void *)sub_247E1A248();
  swift_bridgeObjectRelease();

  return v5;
}

id APFeatureSemioticsManager.init()()
{
  v1.super_class = (Class)APFeatureSemioticsManager;
  return objc_msgSendSuper2(&v1, sel_init);
}

unint64_t type metadata accessor for APFeatureSemioticsManager()
{
  unint64_t result = qword_2692CF960;
  if (!qword_2692CF960)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2692CF960);
  }
  return result;
}

uint64_t sub_247E10B4C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_247E1A1A8();
  MEMORY[0x270FA5388](v4 - 8, v5);
  uint64_t v6 = sub_247E1A238();
  MEMORY[0x270FA5388](v6 - 8, v7);
  if (a1 == 2)
  {
    if ((unint64_t)(a2 - 1) <= 2) {
      goto LABEL_8;
    }
  }
  else if (a1 == 1)
  {
    switch(a2)
    {
      case 3:
        goto LABEL_8;
      case 2:
        sub_247E1A418();
        swift_bridgeObjectRelease();
        size_t v11 = APGetPreferredAuthenticationMechanismLocKey();
        sub_247E1A258();

        sub_247E1A298();
        swift_bridgeObjectRelease();
        int64_t v9 = (void *)sub_247E1A248();
        swift_bridgeObjectRelease();
        id v10 = APUILocStr(v9);
        goto LABEL_12;
      case 1:
LABEL_8:
        uint64_t v8 = APGetPreferredAuthenticationMechanismLocKey();
        sub_247E1A258();

        sub_247E1A298();
        swift_bridgeObjectRelease();
        int64_t v9 = (void *)sub_247E1A248();
        swift_bridgeObjectRelease();
        id v10 = APUILocStr(v9);
LABEL_12:
        id v12 = v10;

        uint64_t v13 = sub_247E1A258();
        return v13;
    }
  }
  sub_247E1A228();
  type metadata accessor for APFeatureSemioticsManager();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v16 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_247E1A198();
  return sub_247E1A278();
}

uint64_t sub_247E10F18(uint64_t a1, uint64_t a2)
{
  if (a2 == 2)
  {
    if (a1 == 1) {
      return 0x687361642E707061;
    }
    else {
      return 6650213;
    }
  }
  else
  {
    uint64_t v4 = APGetPreferredAuthenticationMechanism();
    uint64_t result = 0x646965636166;
    switch(v4)
    {
      case 0:
      case 3:
        if (a1 == 2) {
          uint64_t result = 0x65706F2E6B636F6CLL;
        }
        else {
          uint64_t result = 1801678700;
        }
        break;
      case 1:
        return result;
      case 2:
        uint64_t result = 0x64696863756F74;
        break;
      default:
        type metadata accessor for APAuthenticationMechanism(0);
        sub_247E1A4A8();
        __break(1u);
        JUMPOUT(0x247E1102CLL);
    }
  }
  return result;
}

id sub_247E110E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  *(void *)&v7[OBJC_IVAR____TtC15AppProtectionUI29APOnBoardingWelcomeController_assistant] = 0;
  size_t v11 = (void *)sub_247E1A248();
  swift_bridgeObjectRelease();
  if (!a4)
  {
    id v12 = 0;
    if (a6) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v13 = 0;
    goto LABEL_6;
  }
  id v12 = (void *)sub_247E1A248();
  swift_bridgeObjectRelease();
  if (!a6) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v13 = (void *)sub_247E1A248();
  swift_bridgeObjectRelease();
LABEL_6:
  v16.receiver = v7;
  v16.super_class = (Class)type metadata accessor for APOnBoardingWelcomeController();
  id v14 = objc_msgSendSuper2(&v16, sel_initWithTitle_detailText_symbolName_contentLayout_, v11, v12, v13, a7);

  return v14;
}

id sub_247E11388()
{
  return sub_247E11C04(type metadata accessor for APOnBoardingWelcomeController);
}

uint64_t type metadata accessor for APOnBoardingWelcomeController()
{
  return self;
}

char *sub_247E113D4(double a1, double a2, double a3, double a4)
{
  uint64_t v9 = OBJC_IVAR____TtC15AppProtectionUI45APBraveAndIconoclasticSafeAreaUsingButtonTray_stack;
  id v10 = objc_allocWithZone(MEMORY[0x263F82BF8]);
  size_t v11 = v4;
  *(void *)&v4[v9] = objc_msgSend(v10, sel_init);
  uint64_t v12 = OBJC_IVAR____TtC15AppProtectionUI45APBraveAndIconoclasticSafeAreaUsingButtonTray_background;
  id v13 = objc_msgSend(self, sel_effectWithStyle_, 4);
  id v14 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82E50]), sel_initWithEffect_, v13);

  *(void *)&v11[v12] = v14;
  v19.receiver = v11;
  v19.super_class = (Class)type metadata accessor for APBraveAndIconoclasticSafeAreaUsingButtonTray();
  double v15 = (char *)objc_msgSendSuper2(&v19, sel_initWithFrame_, a1, a2, a3, a4);
  objc_msgSend(v15, sel_setInsetsLayoutMarginsFromSafeArea_, 0);
  objc_msgSend(v15, sel_setLayoutMarginsFollowReadableWidth_, 1);
  objc_msgSend(v15, sel_setLayoutMargins_, 16.0, 24.0, 24.0, 24.0);
  objc_msgSend(v15, sel_addSubview_, *(void *)&v15[OBJC_IVAR____TtC15AppProtectionUI45APBraveAndIconoclasticSafeAreaUsingButtonTray_background]);
  objc_super v16 = *(void **)&v15[OBJC_IVAR____TtC15AppProtectionUI45APBraveAndIconoclasticSafeAreaUsingButtonTray_stack];
  objc_msgSend(v15, sel_addSubview_, v16);
  objc_msgSend(v16, sel_setAxis_, 1);
  objc_msgSend(v16, sel_setAlignment_, 0);
  id v17 = v16;
  objc_msgSend(v17, sel_setDistribution_, 3);

  return v15;
}

id sub_247E11824()
{
  return sub_247E11C04(type metadata accessor for APBraveAndIconoclasticSafeAreaUsingButtonTray);
}

uint64_t type metadata accessor for APBraveAndIconoclasticSafeAreaUsingButtonTray()
{
  return self;
}

char *sub_247E11970(double a1, double a2, double a3, double a4)
{
  *(void *)&v4[OBJC_IVAR____TtC15AppProtectionUI42APWelcomeControllerWithBraveButtonTrayView_welcomeView] = 0;
  *(void *)&v4[OBJC_IVAR____TtC15AppProtectionUI42APWelcomeControllerWithBraveButtonTrayView_welcomeScrollView] = 0;
  uint64_t v9 = OBJC_IVAR____TtC15AppProtectionUI42APWelcomeControllerWithBraveButtonTrayView_buttonTray;
  id v10 = objc_allocWithZone((Class)type metadata accessor for APBraveAndIconoclasticSafeAreaUsingButtonTray());
  size_t v11 = v4;
  *(void *)&v4[v9] = objc_msgSend(v10, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);

  v14.receiver = v11;
  v14.super_class = (Class)type metadata accessor for APWelcomeControllerWithBraveButtonTrayView();
  uint64_t v12 = (char *)objc_msgSendSuper2(&v14, sel_initWithFrame_, a1, a2, a3, a4);
  objc_msgSend(v12, sel_addSubview_, *(void *)&v12[OBJC_IVAR____TtC15AppProtectionUI42APWelcomeControllerWithBraveButtonTrayView_buttonTray]);
  return v12;
}

id sub_247E11A84()
{
  v12.receiver = v0;
  v12.super_class = (Class)type metadata accessor for APWelcomeControllerWithBraveButtonTrayView();
  objc_msgSendSuper2(&v12, sel_layoutSubviews);
  objc_super v1 = *(void **)&v0[OBJC_IVAR____TtC15AppProtectionUI42APWelcomeControllerWithBraveButtonTrayView_welcomeView];
  if (v1)
  {
    id v2 = v1;
    objc_msgSend(v0, sel_bounds);
    objc_msgSend(v2, sel_setFrame_);
    objc_msgSend(v2, sel_layoutIfNeeded);
  }
  uint64_t v3 = *(void **)&v0[OBJC_IVAR____TtC15AppProtectionUI42APWelcomeControllerWithBraveButtonTrayView_buttonTray];
  objc_msgSend(v0, sel_bounds);
  double Width = CGRectGetWidth(v13);
  objc_msgSend(v3, sel_systemLayoutSizeFittingSize_withHorizontalFittingPriority_verticalFittingPriority_, CGPointMake(Width, 0.0, v5, v6));
  double v8 = v7;
  objc_msgSend(v0, sel_bounds);
  double v10 = v9 - v8;
  objc_msgSend(v0, sel_bounds);
  return objc_msgSend(v3, sel_setFrame_, 0.0, v10, CGRectGetWidth(v14), v8);
}

id sub_247E11BEC()
{
  return sub_247E11C04(type metadata accessor for APWelcomeControllerWithBraveButtonTrayView);
}

id sub_247E11C04(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

uint64_t type metadata accessor for APWelcomeControllerWithBraveButtonTrayView()
{
  return self;
}

uint64_t sub_247E11CBC(uint64_t a1, uint64_t a2)
{
  uint64_t v24 = a2;
  uint64_t v25 = a1;
  uint64_t v2 = sub_247E1A398();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2, v4);
  double v6 = (char *)&v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_247E1A368();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7, v9);
  size_t v11 = (char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_247E1A3C8();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v15 = MEMORY[0x270FA5388](v12, v14);
  id v17 = (char *)&v24 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15, v18);
  id v20 = (char *)&v24 - v19;
  sub_247E1A3B8();
  (*(void (**)(char *, void, uint64_t))(v8 + 104))(v11, *MEMORY[0x263F821B8], v7);
  sub_247E1A378();
  id v21 = objc_msgSend(self, sel_whiteColor, v24, v25);
  sub_247E1A388();
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v6, *MEMORY[0x263F821F0], v2);
  sub_247E1A358();
  swift_bridgeObjectRetain();
  sub_247E1A3A8();
  sub_247E11F84();
  (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v17, v20, v12);
  uint64_t v22 = sub_247E1A3D8();
  (*(void (**)(char *, uint64_t))(v13 + 8))(v20, v12);
  return v22;
}

unint64_t sub_247E11F84()
{
  unint64_t result = qword_2692CF998;
  if (!qword_2692CF998)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2692CF998);
  }
  return result;
}

double UIEdgeInsetsInsetRect(double a1, double a2, double a3, double a4, double a5, double a6)
{
  return a1 + a6;
}

void sub_247E11FE0()
{
  uint64_t v1 = OBJC_IVAR____TtC15AppProtectionUI45APBraveAndIconoclasticSafeAreaUsingButtonTray_stack;
  *(void *)&v0[v1] = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82BF8]), sel_init);
  uint64_t v2 = OBJC_IVAR____TtC15AppProtectionUI45APBraveAndIconoclasticSafeAreaUsingButtonTray_background;
  id v3 = objc_msgSend(self, sel_effectWithStyle_, 4);
  id v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82E50]), sel_initWithEffect_, v3);

  *(void *)&v0[v2] = v4;
  sub_247E1A468();
  __break(1u);
}

void sub_247E120C4(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  swift_retain();
  id v6 = a3;
  v5(a2, a3);
  swift_release();
}

uint64_t sub_247E1213C(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_247E12164(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

void sub_247E1218C(void *a1, uint64_t a2)
{
  id v4 = objc_msgSend(a1, sel_localizedName);
  uint64_t v5 = sub_247E1A258();
  uint64_t v7 = v6;

  uint64_t v8 = (void *)sub_247E1A248();
  id v9 = APUILocStr(v8);

  sub_247E1A258();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2692CFA60);
  uint64_t v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_247E1B910;
  *(void *)(v10 + 56) = MEMORY[0x263F8D310];
  *(void *)(v10 + 64) = sub_247E18F04();
  *(void *)(v10 + 32) = v5;
  *(void *)(v10 + 40) = v7;
  swift_bridgeObjectRetain();
  sub_247E1A268();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_247E1A418();
  swift_bridgeObjectRelease();
  *(void *)&long long v59 = 0xD000000000000017;
  *((void *)&v59 + 1) = 0x8000000247E1D700;
  size_t v11 = APGetPreferredAuthenticationMechanismLocKey();
  sub_247E1A258();

  sub_247E1A298();
  swift_bridgeObjectRelease();
  uint64_t v12 = (void *)sub_247E1A248();
  swift_bridgeObjectRelease();
  id v13 = APUILocStr(v12);

  sub_247E1A258();
  id v14 = objc_allocWithZone((Class)type metadata accessor for APOnBoardingWelcomeController());
  uint64_t v15 = (void *)sub_247E1A248();
  swift_bridgeObjectRelease();
  uint64_t v16 = (void *)sub_247E1A248();
  swift_bridgeObjectRelease();
  id v17 = (char *)objc_msgSend(v14, sel_initWithTitle_detailText_icon_contentLayout_, v15, v16, 0, 2);

  id v18 = objc_msgSend(objc_allocWithZone((Class)APButtonTrayScrollViewAssistant), sel_initWithDelegate_, a2);
  uint64_t v19 = *(void **)&v17[OBJC_IVAR____TtC15AppProtectionUI29APOnBoardingWelcomeController_assistant];
  *(void *)&v17[OBJC_IVAR____TtC15AppProtectionUI29APOnBoardingWelcomeController_assistant] = v18;

  id v20 = objc_msgSend(a1, sel_application);
  objc_msgSend(self, sel_metricsForEducation);
  long long v57 = v60;
  long long v58 = v59;
  uint64_t v21 = v61;
  id v22 = objc_allocWithZone((Class)APSymbolBadgedAppIconView);
  id v23 = (void *)sub_247E1A248();
  long long v59 = v58;
  long long v60 = v57;
  uint64_t v61 = v21;
  id v24 = objc_msgSend(v22, sel_initWithApplication_symbolType_metrics_, v20, v23, &v59);

  objc_msgSend(v24, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  id v25 = objc_msgSend(v17, sel_headerView);
  id v26 = objc_msgSend(v25, sel_customIconContainerView);

  objc_msgSend(v26, sel_addSubview_, v24);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2692CFA70);
  uint64_t v27 = swift_allocObject();
  *(_OWORD *)(v27 + 16) = xmmword_247E1B920;
  id v28 = objc_msgSend(v24, sel_centerXAnchor);
  id v29 = objc_msgSend(v17, sel_headerView);
  id v30 = objc_msgSend(v29, sel_customIconContainerView);

  if (!v30)
  {
    __break(1u);
    goto LABEL_13;
  }
  id v31 = objc_msgSend(v30, sel_centerXAnchor);

  id v32 = objc_msgSend(v28, sel_constraintEqualToAnchor_, v31);
  *(void *)(v27 + 32) = v32;
  id v33 = objc_msgSend(v24, sel_centerYAnchor);
  id v34 = objc_msgSend(v17, sel_headerView);
  id v35 = objc_msgSend(v34, sel_customIconContainerView);

  if (!v35)
  {
LABEL_13:
    __break(1u);
    return;
  }
  double v36 = self;
  id v37 = objc_msgSend(v35, sel_centerYAnchor);

  id v38 = objc_msgSend(v33, sel_constraintEqualToAnchor_, v37);
  *(void *)(v27 + 40) = v38;
  id v39 = objc_msgSend(v24, sel_heightAnchor);
  id v40 = objc_msgSend(v39, sel_constraintEqualToConstant_, 80.0);

  *(void *)(v27 + 48) = v40;
  id v41 = objc_msgSend(v24, sel_widthAnchor);
  id v42 = objc_msgSend(v41, sel_constraintEqualToConstant_, 80.0);

  *(void *)(v27 + 56) = v42;
  *(void *)&long long v59 = v27;
  sub_247E1A2D8();
  sub_247E0CD30(0, &qword_2692CFA90);
  CGRect v43 = (void *)sub_247E1A2B8();
  swift_bridgeObjectRelease();
  objc_msgSend(v36, sel_activateConstraints_, v43);

  id v44 = (void *)sub_247E1A248();
  id v45 = APUILocStr(v44);

  if (!v45)
  {
    sub_247E1A258();
    id v45 = (id)sub_247E1A248();
    swift_bridgeObjectRelease();
  }
  id v46 = (void *)sub_247E1A248();
  id v47 = APUILocStr(v46);

  if (!v47)
  {
    sub_247E1A258();
    id v47 = (id)sub_247E1A248();
    swift_bridgeObjectRelease();
  }
  uint64_t v48 = (void *)sub_247E1A248();
  objc_msgSend(v17, sel_addBulletedListItemWithTitle_description_symbolName_, v45, v47, v48);

  uint64_t v49 = (void *)sub_247E1A248();
  id v50 = APUILocStr(v49);

  if (!v50)
  {
    sub_247E1A258();
    id v50 = (id)sub_247E1A248();
    swift_bridgeObjectRelease();
  }
  uint64_t v51 = (void *)sub_247E1A248();
  id v52 = APUILocStr(v51);

  if (!v52)
  {
    sub_247E1A258();
    id v52 = (id)sub_247E1A248();
    swift_bridgeObjectRelease();
  }
  uint64_t v53 = (void *)sub_247E1A248();
  objc_msgSend(v17, sel_addBulletedListItemWithTitle_description_symbolName_, v50, v52, v53);

  id v54 = objc_msgSend(v17, sel_navigationItem);
  sub_247E0CD30(0, (unint64_t *)&unk_2692CFA98);
  sub_247E0CD30(0, &qword_2692CFA88);
  uint64_t v55 = swift_allocObject();
  swift_unknownObjectWeakInit();
  sub_247E1A348();
  v56 = (void *)sub_247E1A308();
  objc_msgSend(v54, sel_setRightBarButtonItem_, v56, 0, 0, 0, sub_247E1904C, v55);
}

void sub_247E12A44(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2 + 16;
  swift_beginAccess();
  uint64_t v3 = MEMORY[0x24C56D1C0](v2);
  if (v3)
  {
    id v4 = (void *)v3;
    uint64_t v5 = v3 + OBJC_IVAR____TtC15AppProtectionUI37APHiddenAppConfirmationViewController_delegate;
    if (MEMORY[0x24C56D1C0](v3 + OBJC_IVAR____TtC15AppProtectionUI37APHiddenAppConfirmationViewController_delegate))
    {
      uint64_t v6 = *(void *)(v5 + 8);
      uint64_t ObjectType = swift_getObjectType();
      (*(void (**)(void *, uint64_t, uint64_t))(v6 + 16))(v4, ObjectType, v6);

      swift_unknownObjectRelease();
    }
    else
    {
    }
  }
}

id sub_247E12AF4(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  if ((sub_247E0BA4C() & 1) == 0)
  {
    id v37 = (void *)sub_247E1A248();
    id v38 = APUILocStr(v37);

    sub_247E1A258();
    sub_247E1A268();
    swift_bridgeObjectRelease();
    sub_247E1A418();
    swift_bridgeObjectRelease();
    id v39 = APGetPreferredAuthenticationMechanismLocKey();
    sub_247E1A258();

    sub_247E1A298();
    swift_bridgeObjectRelease();
    id v40 = (void *)sub_247E1A248();
    swift_bridgeObjectRelease();
    id v41 = APUILocStr(v40);

    sub_247E1A258();
    id v42 = (void *)sub_247E1A248();
    swift_bridgeObjectRelease();
    CGRect v43 = (void *)sub_247E1A248();
    swift_bridgeObjectRelease();
    id v16 = objc_msgSend(self, sel_alertControllerWithTitle_message_preferredStyle_, v42, v43, 1);

    objc_msgSend(v16, sel_setSeverity_, 1);
    id v44 = (void *)sub_247E1A248();
    id v45 = APUILocStr(v44);

    sub_247E1A258();
    uint64_t v46 = swift_allocObject();
    swift_unknownObjectWeakInit();
    swift_retain();
    id v47 = (void *)sub_247E1A248();
    swift_bridgeObjectRelease();
    v71 = sub_247E18EE0;
    uint64_t v72 = v46;
    unint64_t aBlock = MEMORY[0x263EF8330];
    uint64_t v68 = 1107296256;
    v69 = sub_247E13EEC;
    v70 = &block_descriptor_26;
    uint64_t v48 = _Block_copy(&aBlock);
    swift_release();
    uint64_t v49 = self;
    id v36 = objc_msgSend(v49, sel_actionWithTitle_style_handler_, v47, 0, v48);
    _Block_release(v48);
    swift_release();

    objc_msgSend(v16, sel_addAction_, v36);
    id v50 = (void *)sub_247E1A248();
    id v51 = APUILocStr(v50);

    sub_247E1A258();
    uint64_t v52 = swift_allocObject();
    swift_unknownObjectWeakInit();
    swift_retain();
    uint64_t v53 = (void *)sub_247E1A248();
    swift_bridgeObjectRelease();
    v71 = sub_247E18EE8;
    uint64_t v72 = v52;
    unint64_t aBlock = MEMORY[0x263EF8330];
    uint64_t v68 = 1107296256;
    v69 = sub_247E13EEC;
    v70 = &block_descriptor_30;
    id v54 = _Block_copy(&aBlock);
    swift_release();
    id v28 = objc_msgSend(v49, sel_actionWithTitle_style_handler_, v53, 1, v54);
    _Block_release(v54);
    swift_release();

    objc_msgSend(v16, sel_addAction_, v28);
LABEL_16:

    return v16;
  }
  char v66 = a4;
  sub_247E1A418();
  swift_bridgeObjectRelease();
  uint64_t v7 = APGetPreferredAuthenticationMechanismLocKey();
  sub_247E1A258();

  sub_247E1A298();
  swift_bridgeObjectRelease();
  sub_247E1A298();
  uint64_t v8 = (void *)sub_247E1A248();
  swift_bridgeObjectRelease();
  id v9 = APUILocStr(v8);

  sub_247E1A258();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2692CFA60);
  uint64_t v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_247E1B910;
  *(void *)(v10 + 56) = MEMORY[0x263F8D310];
  *(void *)(v10 + 64) = sub_247E18F04();
  *(void *)(v10 + 32) = a1;
  *(void *)(v10 + 40) = a2;
  swift_bridgeObjectRetain();
  sub_247E1A268();
  swift_bridgeObjectRelease();
  sub_247E1A418();
  swift_bridgeObjectRelease();
  size_t v11 = APGetPreferredAuthenticationMechanismLocKey();
  sub_247E1A258();

  sub_247E1A298();
  swift_bridgeObjectRelease();
  uint64_t v12 = (void *)sub_247E1A248();
  swift_bridgeObjectRelease();
  id v13 = APUILocStr(v12);

  sub_247E1A258();
  id v14 = (void *)sub_247E1A248();
  swift_bridgeObjectRelease();
  uint64_t v15 = (void *)sub_247E1A248();
  swift_bridgeObjectRelease();
  id v16 = objc_msgSend(self, sel_alertControllerWithTitle_message_preferredStyle_, v14, v15, 1);

  objc_msgSend(v16, sel_setSeverity_, 1);
  id v64 = self;
  id v17 = objc_msgSend(v64, sel_sharedManager);
  id v18 = objc_msgSend(v17, sel_titleForEnablementAction_ofFeature_, 1, 1);

  sub_247E1A258();
  uint64_t v19 = swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_retain();
  id v20 = (void *)sub_247E1A248();
  swift_bridgeObjectRelease();
  v71 = sub_247E18F58;
  uint64_t v72 = v19;
  unint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v68 = 1107296256;
  v69 = sub_247E13EEC;
  v70 = &block_descriptor_34;
  uint64_t v21 = _Block_copy(&aBlock);
  swift_release();
  id v22 = self;
  id v65 = objc_msgSend(v22, sel_actionWithTitle_style_handler_, v20, 0, v21);
  _Block_release(v21);
  swift_release();

  id v23 = (void *)sub_247E1A248();
  id v24 = APUILocStr(v23);

  sub_247E1A258();
  uint64_t v25 = swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_retain();
  id v26 = (void *)sub_247E1A248();
  swift_bridgeObjectRelease();
  v71 = sub_247E18EE8;
  uint64_t v72 = v25;
  unint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v68 = 1107296256;
  v69 = sub_247E13EEC;
  v70 = &block_descriptor_38;
  uint64_t v27 = _Block_copy(&aBlock);
  swift_release();
  id v28 = objc_msgSend(v22, sel_actionWithTitle_style_handler_, v26, 1, v27);
  _Block_release(v27);
  swift_release();

  if (v66)
  {
    id v29 = objc_msgSend(v64, sel_sharedManager);
    id v30 = objc_msgSend(v29, sel_titleForEnablementAction_ofFeature_, 1, 2);

    sub_247E1A258();
    uint64_t v31 = swift_allocObject();
    swift_unknownObjectWeakInit();
    swift_retain();
    id v32 = (void *)sub_247E1A248();
    swift_bridgeObjectRelease();
    v71 = sub_247E18F88;
    uint64_t v72 = v31;
    unint64_t aBlock = MEMORY[0x263EF8330];
    uint64_t v68 = 1107296256;
    v69 = sub_247E13EEC;
    v70 = &block_descriptor_42;
    id v33 = _Block_copy(&aBlock);
    swift_release();
    id v34 = objc_msgSend(v22, sel_actionWithTitle_style_handler_, v32, 0, v33);
    _Block_release(v33);
    swift_release();

    __swift_instantiateConcreteTypeFromMangledName(&qword_2692CFA70);
    uint64_t v35 = swift_allocObject();
    *(_OWORD *)(v35 + 16) = xmmword_247E1B940;
    id v36 = v65;
    *(void *)(v35 + 32) = v65;
    *(void *)(v35 + 40) = v34;
    *(void *)(v35 + 48) = v28;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2692CFA70);
    uint64_t v35 = swift_allocObject();
    *(_OWORD *)(v35 + 16) = xmmword_247E1B930;
    id v36 = v65;
    *(void *)(v35 + 32) = v65;
    *(void *)(v35 + 40) = v28;
  }
  unint64_t aBlock = v35;
  sub_247E1A2D8();
  unint64_t v55 = aBlock;
  if (!(aBlock >> 62))
  {
    uint64_t v56 = *(void *)((aBlock & 0xFFFFFFFFFFFFFF8) + 0x10);
    id v57 = v36;
    id result = v28;
    if (v56) {
      goto LABEL_8;
    }
LABEL_15:
    swift_bridgeObjectRelease();
    objc_msgSend(v16, sel_setPreferredAction_, v36);
    goto LABEL_16;
  }
  id v62 = v36;
  id v63 = v28;
  swift_bridgeObjectRetain();
  uint64_t v56 = sub_247E1A478();
  id result = (id)swift_bridgeObjectRelease();
  if (!v56) {
    goto LABEL_15;
  }
LABEL_8:
  if (v56 >= 1)
  {
    for (uint64_t i = 0; i != v56; ++i)
    {
      if ((v55 & 0xC000000000000001) != 0) {
        id v60 = (id)MEMORY[0x24C56C9D0](i, v55);
      }
      else {
        id v60 = *(id *)(v55 + 8 * i + 32);
      }
      uint64_t v61 = v60;
      objc_msgSend(v16, sel_addAction_, v60);
    }
    goto LABEL_15;
  }
  __break(1u);
  return result;
}

void sub_247E136DC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692CFA78);
  MEMORY[0x270FA5388](v3 - 8, v4);
  uint64_t v6 = (char *)&aBlock[-1] - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v7 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F018D8]), sel_init);
  objc_msgSend(v7, sel_setSensitive_, 1);
  id v8 = objc_msgSend(self, sel_defaultWorkspace);
  if (v8)
  {
    id v9 = v8;
    sub_247E1A178();
    uint64_t v10 = sub_247E1A188();
    uint64_t v11 = *(void *)(v10 - 8);
    uint64_t v12 = 0;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v6, 1, v10) != 1)
    {
      uint64_t v12 = (void *)sub_247E1A168();
      (*(void (**)(char *, uint64_t))(v11 + 8))(v6, v10);
    }
    uint64_t v13 = swift_allocObject();
    swift_beginAccess();
    id v14 = (void *)MEMORY[0x24C56D1C0](a2 + 16);
    swift_unknownObjectWeakInit();
    id v15 = v7;

    aBlock[4] = sub_247E1918C;
    aBlock[5] = v13;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_247E13E40;
    aBlock[3] = &block_descriptor_141;
    id v16 = _Block_copy(aBlock);
    swift_release();
    objc_msgSend(v9, sel_openURL_configuration_completionHandler_, v12, v15, v16);
    _Block_release(v16);
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_247E1395C(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = sub_247E1A1E8();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5, v7);
  id v9 = (char *)&v30 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_247E1A208();
  uint64_t v34 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10, v11);
  uint64_t v13 = (char *)&v30 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    uint64_t v33 = v10;
    if (qword_2692CF740 != -1) {
      swift_once();
    }
    uint64_t v14 = sub_247E1A1D8();
    __swift_project_value_buffer(v14, (uint64_t)qword_2692CFB80);
    id v15 = a2;
    id v16 = a2;
    id v17 = sub_247E1A1B8();
    os_log_type_t v18 = sub_247E1A2E8();
    if (os_log_type_enabled(v17, v18))
    {
      uint64_t v30 = a3;
      uint64_t v19 = (uint8_t *)swift_slowAlloc();
      uint64_t v20 = swift_slowAlloc();
      uint64_t v31 = v6;
      uint64_t v21 = (void *)v20;
      uint64_t v32 = v5;
      *(_DWORD *)uint64_t v19 = 138412290;
      id v22 = a2;
      uint64_t v23 = _swift_stdlib_bridgeErrorToNSError();
      aBlock[0] = v23;
      uint64_t v5 = v32;
      sub_247E1A3E8();
      *uint64_t v21 = v23;
      a3 = v30;

      _os_log_impl(&dword_247E02000, v17, v18, "Error opening passcode settings %@", v19, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2692CFA80);
      swift_arrayDestroy();
      id v24 = v21;
      uint64_t v6 = v31;
      MEMORY[0x24C56D160](v24, -1, -1);
      MEMORY[0x24C56D160](v19, -1, -1);
    }
    else
    {
    }
    uint64_t v10 = v33;
  }
  sub_247E0CD30(0, &qword_2692CF7F8);
  uint64_t v25 = (void *)sub_247E1A328();
  uint64_t v26 = swift_allocObject();
  swift_beginAccess();
  uint64_t v27 = (void *)MEMORY[0x24C56D1C0](a3 + 16);
  swift_unknownObjectWeakInit();

  aBlock[4] = sub_247E19194;
  aBlock[5] = v26;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_247E0DBE8;
  aBlock[3] = &block_descriptor_145;
  id v28 = _Block_copy(aBlock);
  swift_release();
  sub_247E1A1F8();
  aBlock[0] = MEMORY[0x263F8EE78];
  sub_247E0CD74();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2692CF808);
  sub_247E0CE10();
  sub_247E1A408();
  MEMORY[0x24C56C8D0](0, v13, v9, v28);
  _Block_release(v28);

  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
  return (*(uint64_t (**)(char *, uint64_t))(v34 + 8))(v13, v10);
}

void sub_247E13DB0(uint64_t a1)
{
  uint64_t v1 = a1 + 16;
  swift_beginAccess();
  uint64_t v2 = (void *)MEMORY[0x24C56D1C0](v1);
  if (v2)
  {
    uint64_t v3 = v2;
    id v4 = objc_msgSend(v2, sel_delegate);
    if (v4)
    {
      objc_msgSend(v4, sel_educationViewControllerRequestsDismissal_withResult_, v3, 0);

      swift_unknownObjectRelease();
    }
    else
    {
    }
  }
}

uint64_t sub_247E13E40(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = *(void (**)(uint64_t, void *))(a1 + 32);
  if (a2) {
    uint64_t v5 = sub_247E1A218();
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

void sub_247E13EEC(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

void sub_247E13F54(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  uint64_t v4 = a2 + 16;
  swift_beginAccess();
  uint64_t v5 = MEMORY[0x24C56D1C0](v4);
  if (v5)
  {
    id v6 = (void *)v5;
    a3();
  }
}

id sub_247E13FB0()
{
  sub_247E1A418();
  swift_bridgeObjectRelease();
  id v0 = APGetPreferredAuthenticationMechanismLocKey();
  sub_247E1A258();

  sub_247E1A298();
  swift_bridgeObjectRelease();
  uint64_t v1 = (void *)sub_247E1A248();
  swift_bridgeObjectRelease();
  id v2 = APUILocStr(v1);

  sub_247E1A258();
  uint64_t v3 = (void *)sub_247E1A248();
  id v4 = APUILocStr(v3);

  sub_247E1A258();
  uint64_t v5 = (void *)sub_247E1A248();
  swift_bridgeObjectRelease();
  id v6 = (void *)sub_247E1A248();
  swift_bridgeObjectRelease();
  id v7 = objc_msgSend(self, sel_alertControllerWithTitle_message_preferredStyle_, v5, v6, 1, 0xD000000000000025, 0x8000000247E1D810);

  uint64_t v8 = (void *)sub_247E1A248();
  id v9 = APUILocStr(v8);

  sub_247E1A258();
  uint64_t v10 = swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_retain();
  uint64_t v11 = (void *)sub_247E1A248();
  swift_bridgeObjectRelease();
  v15[4] = sub_247E18EE8;
  v15[5] = v10;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 1107296256;
  v15[2] = sub_247E13EEC;
  v15[3] = &block_descriptor_102;
  uint64_t v12 = _Block_copy(v15);
  swift_release();
  id v13 = objc_msgSend(self, sel_actionWithTitle_style_handler_, v11, 0, v12);
  _Block_release(v12);
  swift_release();

  objc_msgSend(v7, sel_addAction_, v13);
  return v7;
}

id sub_247E142A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = (void *)sub_247E1A248();
  id v9 = APUILocStr(v8);

  sub_247E1A258();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2692CFA60);
  uint64_t v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_247E1B910;
  *(void *)(v10 + 56) = MEMORY[0x263F8D310];
  *(void *)(v10 + 64) = sub_247E18F04();
  *(void *)(v10 + 32) = a1;
  *(void *)(v10 + 40) = a2;
  swift_bridgeObjectRetain();
  sub_247E1A268();
  swift_bridgeObjectRelease();
  uint64_t v11 = (void *)sub_247E1A248();
  id v12 = APUILocStr(v11);

  sub_247E1A258();
  id v13 = (void *)sub_247E1A248();
  swift_bridgeObjectRelease();
  uint64_t v14 = (void *)sub_247E1A248();
  swift_bridgeObjectRelease();
  id v15 = objc_msgSend(self, sel_alertControllerWithTitle_message_preferredStyle_, v13, v14, 1);

  id v16 = (void *)sub_247E1A248();
  id v17 = APUILocStr(v16);

  sub_247E1A258();
  uint64_t v18 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v19 = (void *)swift_allocObject();
  v19[2] = a3;
  v19[3] = a4;
  v19[4] = v18;
  swift_bridgeObjectRetain();
  swift_retain();
  uint64_t v20 = (void *)sub_247E1A248();
  swift_bridgeObjectRelease();
  uint64_t v35 = sub_247E18FE8;
  id v36 = v19;
  uint64_t v31 = MEMORY[0x263EF8330];
  uint64_t v32 = 1107296256;
  uint64_t v33 = sub_247E13EEC;
  uint64_t v34 = &block_descriptor_69;
  uint64_t v21 = _Block_copy(&v31);
  swift_release();
  id v22 = self;
  id v23 = objc_msgSend(v22, sel_actionWithTitle_style_handler_, v20, 0, v21);
  _Block_release(v21);
  swift_release();

  objc_msgSend(v15, sel_addAction_, v23);
  id v24 = (void *)sub_247E1A248();
  id v25 = APUILocStr(v24);

  sub_247E1A258();
  uint64_t v26 = swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_retain();
  uint64_t v27 = (void *)sub_247E1A248();
  swift_bridgeObjectRelease();
  uint64_t v35 = sub_247E18EE8;
  id v36 = (void *)v26;
  uint64_t v31 = MEMORY[0x263EF8330];
  uint64_t v32 = 1107296256;
  uint64_t v33 = sub_247E13EEC;
  uint64_t v34 = &block_descriptor_73;
  id v28 = _Block_copy(&v31);
  swift_release();
  id v29 = objc_msgSend(v22, sel_actionWithTitle_style_handler_, v27, 0, v28);
  _Block_release(v28);
  swift_release();

  objc_msgSend(v15, sel_addAction_, v29);
  return v15;
}

void sub_247E14728(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692CFA78);
  MEMORY[0x270FA5388](v5 - 8, v6);
  uint64_t v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v9 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F018D8]), sel_init);
  objc_msgSend(v9, sel_setSensitive_, 1);
  id v10 = objc_msgSend(self, sel_defaultWorkspace);
  if (v10)
  {
    uint64_t v11 = v10;
    unint64_t aBlock = 0;
    unint64_t v21 = 0xE000000000000000;
    sub_247E1A418();
    swift_bridgeObjectRelease();
    unint64_t aBlock = 0xD00000000000001ELL;
    unint64_t v21 = 0x8000000247E1D650;
    sub_247E1A298();
    sub_247E1A178();
    swift_bridgeObjectRelease();
    uint64_t v12 = sub_247E1A188();
    uint64_t v13 = *(void *)(v12 - 8);
    uint64_t v14 = 0;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v8, 1, v12) != 1)
    {
      uint64_t v14 = (void *)sub_247E1A168();
      (*(void (**)(char *, uint64_t))(v13 + 8))(v8, v12);
    }
    uint64_t v15 = swift_allocObject();
    swift_beginAccess();
    id v16 = (void *)MEMORY[0x24C56D1C0](a4 + 16);
    swift_unknownObjectWeakInit();
    id v17 = v9;

    id v24 = sub_247E18FC8;
    uint64_t v25 = v15;
    unint64_t aBlock = MEMORY[0x263EF8330];
    unint64_t v21 = 1107296256;
    id v22 = sub_247E13E40;
    id v23 = &block_descriptor_77;
    uint64_t v18 = _Block_copy(&aBlock);
    swift_release();
    objc_msgSend(v11, sel_openURL_configuration_completionHandler_, v14, v17, v18);
    _Block_release(v18);
  }
  else
  {
    __break(1u);
  }
}

id sub_247E149EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = (void *)sub_247E1A248();
  id v9 = APUILocStr(v8);

  sub_247E1A258();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2692CFA60);
  uint64_t v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_247E1B910;
  *(void *)(v10 + 56) = MEMORY[0x263F8D310];
  *(void *)(v10 + 64) = sub_247E18F04();
  *(void *)(v10 + 32) = a1;
  *(void *)(v10 + 40) = a2;
  swift_bridgeObjectRetain();
  sub_247E1A268();
  swift_bridgeObjectRelease();
  uint64_t v11 = (void *)sub_247E1A248();
  id v12 = APUILocStr(v11);

  sub_247E1A258();
  uint64_t v13 = (void *)sub_247E1A248();
  swift_bridgeObjectRelease();
  uint64_t v14 = (void *)sub_247E1A248();
  swift_bridgeObjectRelease();
  id v15 = objc_msgSend(self, sel_alertControllerWithTitle_message_preferredStyle_, v13, v14, 1);

  id v16 = (void *)sub_247E1A248();
  id v17 = APUILocStr(v16);

  sub_247E1A258();
  uint64_t v18 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v19 = (void *)swift_allocObject();
  v19[2] = a3;
  v19[3] = a4;
  v19[4] = v18;
  swift_bridgeObjectRetain();
  swift_retain();
  uint64_t v20 = (void *)sub_247E1A248();
  swift_bridgeObjectRelease();
  uint64_t v35 = sub_247E19038;
  id v36 = v19;
  uint64_t v31 = MEMORY[0x263EF8330];
  uint64_t v32 = 1107296256;
  uint64_t v33 = sub_247E13EEC;
  uint64_t v34 = &block_descriptor_84;
  unint64_t v21 = _Block_copy(&v31);
  swift_release();
  id v22 = self;
  id v23 = objc_msgSend(v22, sel_actionWithTitle_style_handler_, v20, 0, v21);
  _Block_release(v21);
  swift_release();

  objc_msgSend(v15, sel_addAction_, v23);
  id v24 = (void *)sub_247E1A248();
  id v25 = APUILocStr(v24);

  sub_247E1A258();
  uint64_t v26 = swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_retain();
  uint64_t v27 = (void *)sub_247E1A248();
  swift_bridgeObjectRelease();
  uint64_t v35 = sub_247E18EE8;
  id v36 = (void *)v26;
  uint64_t v31 = MEMORY[0x263EF8330];
  uint64_t v32 = 1107296256;
  uint64_t v33 = sub_247E13EEC;
  uint64_t v34 = &block_descriptor_88;
  id v28 = _Block_copy(&v31);
  swift_release();
  id v29 = objc_msgSend(v22, sel_actionWithTitle_style_handler_, v27, 0, v28);
  _Block_release(v28);
  swift_release();

  objc_msgSend(v15, sel_addAction_, v29);
  return v15;
}

void sub_247E14E70(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692CFA78);
  MEMORY[0x270FA5388](v5 - 8, v6);
  uint64_t v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v9 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F018D8]), sel_init);
  objc_msgSend(v9, sel_setSensitive_, 1);
  id v10 = objc_msgSend(self, sel_defaultWorkspace);
  if (v10)
  {
    uint64_t v11 = v10;
    unint64_t aBlock = 0;
    unint64_t v21 = 0xE000000000000000;
    sub_247E1A418();
    swift_bridgeObjectRelease();
    unint64_t aBlock = 0xD000000000000021;
    unint64_t v21 = 0x8000000247E1D6D0;
    sub_247E1A298();
    sub_247E1A178();
    swift_bridgeObjectRelease();
    uint64_t v12 = sub_247E1A188();
    uint64_t v13 = *(void *)(v12 - 8);
    uint64_t v14 = 0;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v8, 1, v12) != 1)
    {
      uint64_t v14 = (void *)sub_247E1A168();
      (*(void (**)(char *, uint64_t))(v13 + 8))(v8, v12);
    }
    uint64_t v15 = swift_allocObject();
    swift_beginAccess();
    id v16 = (void *)MEMORY[0x24C56D1C0](a4 + 16);
    swift_unknownObjectWeakInit();
    id v17 = v9;

    id v24 = sub_247E18FC8;
    uint64_t v25 = v15;
    unint64_t aBlock = MEMORY[0x263EF8330];
    unint64_t v21 = 1107296256;
    id v22 = sub_247E13E40;
    id v23 = &block_descriptor_92;
    uint64_t v18 = _Block_copy(&aBlock);
    swift_release();
    objc_msgSend(v11, sel_openURL_configuration_completionHandler_, v14, v17, v18);
    _Block_release(v18);
  }
  else
  {
    __break(1u);
  }
}

void sub_247E15134(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692CFA78);
  MEMORY[0x270FA5388](v3 - 8, v4);
  uint64_t v6 = (char *)&aBlock[-1] - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v7 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F018D8]), sel_init);
  objc_msgSend(v7, sel_setSensitive_, 1);
  id v8 = objc_msgSend(self, sel_defaultWorkspace);
  if (v8)
  {
    id v9 = v8;
    sub_247E1A178();
    uint64_t v10 = sub_247E1A188();
    uint64_t v11 = *(void *)(v10 - 8);
    uint64_t v12 = 0;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v6, 1, v10) != 1)
    {
      uint64_t v12 = (void *)sub_247E1A168();
      (*(void (**)(char *, uint64_t))(v11 + 8))(v6, v10);
    }
    uint64_t v13 = swift_allocObject();
    swift_beginAccess();
    uint64_t v14 = (void *)MEMORY[0x24C56D1C0](a2 + 16);
    swift_unknownObjectWeakInit();
    id v15 = v7;

    aBlock[4] = sub_247E18FC8;
    aBlock[5] = v13;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_247E13E40;
    aBlock[3] = &block_descriptor_62;
    id v16 = _Block_copy(aBlock);
    swift_release();
    objc_msgSend(v9, sel_openURL_configuration_completionHandler_, v12, v15, v16);
    _Block_release(v16);
  }
  else
  {
    __break(1u);
  }
}

void sub_247E153B4(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v3 = a3 + 16;
  if (a2)
  {
    if (qword_2692CF740 != -1) {
      swift_once();
    }
    uint64_t v5 = sub_247E1A1D8();
    __swift_project_value_buffer(v5, (uint64_t)qword_2692CFB80);
    id v6 = a2;
    id v7 = a2;
    id v8 = sub_247E1A1B8();
    os_log_type_t v9 = sub_247E1A2E8();
    if (os_log_type_enabled(v8, v9))
    {
      uint64_t v10 = (uint8_t *)swift_slowAlloc();
      uint64_t v11 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v10 = 138412290;
      id v12 = a2;
      uint64_t v16 = _swift_stdlib_bridgeErrorToNSError();
      sub_247E1A3E8();
      void *v11 = v16;

      _os_log_impl(&dword_247E02000, v8, v9, "Error opening notifications settings %@", v10, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2692CFA80);
      swift_arrayDestroy();
      MEMORY[0x24C56D160](v11, -1, -1);
      MEMORY[0x24C56D160](v10, -1, -1);
    }
    else
    {
    }
  }
  swift_beginAccess();
  uint64_t v13 = (void *)MEMORY[0x24C56D1C0](v3);
  if (v13)
  {
    uint64_t v14 = v13;
    id v15 = objc_msgSend(v13, sel_delegate);
    if (v15)
    {
      objc_msgSend(v15, sel_educationViewControllerRequestsDismissal_withResult_, v14, 0);

      swift_unknownObjectRelease();
    }
    else
    {
    }
  }
}

id sub_247E155D8()
{
  sub_247E1A418();
  swift_bridgeObjectRelease();
  id v0 = APGetPreferredAuthenticationMechanismLocKey();
  sub_247E1A258();

  sub_247E1A298();
  swift_bridgeObjectRelease();
  uint64_t v1 = (void *)sub_247E1A248();
  swift_bridgeObjectRelease();
  id v2 = APUILocStr(v1);

  sub_247E1A258();
  sub_247E1A418();
  swift_bridgeObjectRelease();
  uint64_t v3 = APGetPreferredAuthenticationMechanismLocKey();
  sub_247E1A258();

  sub_247E1A298();
  swift_bridgeObjectRelease();
  uint64_t v4 = (void *)sub_247E1A248();
  swift_bridgeObjectRelease();
  id v5 = APUILocStr(v4);

  sub_247E1A258();
  id v6 = (void *)sub_247E1A248();
  swift_bridgeObjectRelease();
  id v7 = (void *)sub_247E1A248();
  swift_bridgeObjectRelease();
  id v8 = objc_msgSend(self, sel_alertControllerWithTitle_message_preferredStyle_, v6, v7, 1, 0xD00000000000002ALL, 0x8000000247E1D890);

  os_log_type_t v9 = (void *)sub_247E1A248();
  id v10 = APUILocStr(v9);

  sub_247E1A258();
  uint64_t v11 = swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_retain();
  id v12 = (void *)sub_247E1A248();
  swift_bridgeObjectRelease();
  v16[4] = sub_247E18EE8;
  v16[5] = v11;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 1107296256;
  v16[2] = sub_247E13EEC;
  v16[3] = &block_descriptor_137;
  uint64_t v13 = _Block_copy(v16);
  swift_release();
  id v14 = objc_msgSend(self, sel_actionWithTitle_style_handler_, v12, 0, v13);
  _Block_release(v13);
  swift_release();

  objc_msgSend(v8, sel_addAction_, v14);
  return v8;
}

void sub_247E1592C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2 + 16;
  swift_beginAccess();
  uint64_t v3 = (void *)MEMORY[0x24C56D1C0](v2);
  if (v3)
  {
    uint64_t v4 = v3;
    id v5 = objc_msgSend(v3, sel_delegate);
    if (v5)
    {
      objc_msgSend(v5, sel_educationViewControllerRequestsDismissal_withResult_, v4, 0);

      swift_unknownObjectRelease();
    }
    else
    {
    }
  }
}

char *sub_247E15A0C(void *a1)
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  v1[OBJC_IVAR___APEducationFlowViewController_hasAppeared] = 0;
  v1[OBJC_IVAR___APEducationFlowViewController_checkedHidable] = 2;
  *(void *)&v1[OBJC_IVAR___APEducationFlowViewController_initialAlertController] = 0;
  *(void *)&v1[OBJC_IVAR___APEducationFlowViewController_tccUsers] = 0;
  uint64_t v3 = OBJC_IVAR___APEducationFlowViewController_dispatchGroup;
  uint64_t v4 = v1;
  *(void *)&v1[v3] = dispatch_group_create();
  swift_unknownObjectWeakInit();
  id v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F25208]), sel_initWithApplication_, a1);
  uint64_t v6 = OBJC_IVAR___APEducationFlowViewController_lazyRecordApp;
  *(void *)&v4[OBJC_IVAR___APEducationFlowViewController_lazyRecordApp] = v5;
  id v7 = objc_msgSend(v5, sel_localizedName);
  uint64_t v8 = sub_247E1A258();
  uint64_t v10 = v9;

  id v11 = objc_msgSend(a1, sel_bundleIdentifier);
  uint64_t v12 = sub_247E1A258();
  uint64_t v14 = v13;

  if (v12 == 0xD000000000000012 && v14 == 0x8000000247E1D210)
  {
    swift_bridgeObjectRelease();
LABEL_5:
    swift_bridgeObjectRelease();
    unint64_t v16 = 0x2692CF000;
    id v17 = (void *)sub_247E1A248();
    id v18 = APUILocStr(v17);

    uint64_t v8 = sub_247E1A258();
    uint64_t v10 = v19;

    goto LABEL_7;
  }
  char v15 = sub_247E1A498();
  swift_bridgeObjectRelease();
  if (v15) {
    goto LABEL_5;
  }
  unint64_t v16 = 0x2692CF000uLL;
LABEL_7:
  uint64_t v20 = (uint64_t *)&v4[OBJC_IVAR___APEducationFlowViewController_appName];
  *uint64_t v20 = v8;
  v20[1] = v10;
  unint64_t v21 = *(void **)&v4[v6];
  id v42 = 0;
  id v22 = objc_msgSend(v21, sel_loadRecordWithError_, &v42);
  if (v22)
  {
    id v23 = v22;
    id v24 = v42;
  }
  else
  {
    id v25 = v42;
    uint64_t v26 = (void *)sub_247E1A158();

    swift_willThrow();
  }
  objc_msgSend(*(id *)&v4[v6], sel_detach);
  id v27 = objc_msgSend(objc_allocWithZone((Class)APWrappingView), sel_init);
  *(void *)&v4[OBJC_IVAR___APEducationFlowViewController_containerView] = v27;

  v48.receiver = v4;
  v48.super_class = (Class)APEducationFlowViewController;
  id v28 = (char *)objc_msgSendSuper2(&v48, sel_initWithNibName_bundle_, 0, 0);
  uint64_t v29 = *(void *)&v28[OBJC_IVAR___APEducationFlowViewController_containerView];
  uint64_t v30 = v28;
  objc_msgSend(v30, sel_setView_, v29);
  objc_msgSend(v30, sel_setModalPresentationStyle_, 0);
  dispatch_group_enter(*(dispatch_group_t *)&v30[*(void *)(v16 + 2520)]);
  id v31 = objc_msgSend(self, sel_sharedManager);
  id v32 = objc_msgSend(*(id *)&v30[OBJC_IVAR___APEducationFlowViewController_lazyRecordApp], sel_application);
  uint64_t v33 = swift_allocObject();
  *(void *)(v33 + 16) = v30;
  uint64_t v46 = sub_247E18E38;
  uint64_t v47 = v33;
  id v42 = (id)MEMORY[0x263EF8330];
  uint64_t v43 = 1107296256;
  id v44 = sub_247E15F78;
  id v45 = &block_descriptor_1;
  uint64_t v34 = _Block_copy(&v42);
  uint64_t v35 = v30;
  swift_release();
  objc_msgSend(v31, sel_fetchUsersForRecord_completion_, v32, v34);
  _Block_release(v34);

  id v36 = objc_msgSend(self, sel_sharedManager);
  uint64_t v37 = swift_allocObject();
  *(void *)(v37 + 16) = v35;
  *(void *)(v37 + 24) = a1;
  uint64_t v46 = sub_247E18E58;
  uint64_t v47 = v37;
  id v42 = (id)MEMORY[0x263EF8330];
  uint64_t v43 = 1107296256;
  id v44 = sub_247E16318;
  id v45 = &block_descriptor_11_0;
  id v38 = _Block_copy(&v42);
  id v39 = v35;
  id v40 = a1;
  swift_release();
  objc_msgSend(v36, sel_waitForManagedProtectability_, v38);

  _Block_release(v38);
  return v39;
}

void sub_247E15F20(uint64_t a1, uint64_t a2)
{
  *(void *)(a2 + OBJC_IVAR___APEducationFlowViewController_tccUsers) = a1;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v3 = *(NSObject **)(a2 + OBJC_IVAR___APEducationFlowViewController_dispatchGroup);

  dispatch_group_leave(v3);
}

uint64_t sub_247E15F78(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2;
  uint64_t v3 = *(void (**)(uint64_t))(a1 + 32);
  if (a2)
  {
    sub_247E0CD30(0, &qword_2692CFAA8);
    uint64_t v2 = sub_247E1A2C8();
  }
  swift_retain();
  v3(v2);
  swift_release();

  return swift_bridgeObjectRelease();
}

uint64_t sub_247E16000(uint64_t a1, void *a2, void *a3)
{
  sub_247E0CD30(0, &qword_2692CF7F8);
  uint64_t v5 = sub_247E1A328();
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = a2;
  *(void *)(v6 + 24) = a3;
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = sub_247E18EA0;
  *(void *)(v7 + 24) = v6;
  v12[4] = sub_247E18EB8;
  v12[5] = v7;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 1107296256;
  v12[2] = sub_247E12164;
  uint64_t v12[3] = &block_descriptor_20;
  uint64_t v8 = _Block_copy(v12);
  id v9 = a2;
  id v10 = a3;
  swift_retain();
  swift_release();
  dispatch_sync((dispatch_queue_t)v5, v8);

  _Block_release(v8);
  LOBYTE(v5) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  uint64_t result = swift_release();
  if (v5) {
    __break(1u);
  }
  return result;
}

void sub_247E16184(uint64_t a1, uint64_t a2)
{
  id v4 = objc_msgSend(self, sel_sharedManager);
  LOBYTE(a2) = objc_msgSend(v4, sel_canChangeHiddenStatusOfSubject_, a2);

  *(unsigned char *)(a1 + OBJC_IVAR___APEducationFlowViewController_checkedHidable) = a2;
  sub_247E161FC();
}

void sub_247E161FC()
{
  uint64_t v1 = OBJC_IVAR___APEducationFlowViewController_checkedHidable;
  if (v0[OBJC_IVAR___APEducationFlowViewController_checkedHidable] == 2
    || v0[OBJC_IVAR___APEducationFlowViewController_hasAppeared] != 1)
  {
    return;
  }
  id v2 = objc_msgSend(v0, sel_view);
  if (!v2)
  {
    __break(1u);
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  uint64_t v3 = v2;
  id v4 = objc_msgSend(v2, sel_window);

  if (!v4) {
    return;
  }
  uint64_t v5 = OBJC_IVAR___APEducationFlowViewController_initialAlertController;
  if (*(void *)&v0[OBJC_IVAR___APEducationFlowViewController_initialAlertController]) {
    return;
  }
  int v6 = v0[v1];
  if (v6 == 2) {
    goto LABEL_13;
  }
  id v7 = sub_247E12AF4(*(void *)&v0[OBJC_IVAR___APEducationFlowViewController_appName], *(void *)&v0[OBJC_IVAR___APEducationFlowViewController_appName + 8], (uint64_t)v0, v6 & 1);
  uint64_t v8 = *(void **)&v0[v5];
  *(void *)&v0[v5] = v7;

  if (!*(void *)&v0[v5])
  {
LABEL_14:
    __break(1u);
    return;
  }

  objc_msgSend(v0, sel_presentViewController_animated_completion_);
}

void sub_247E16318(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3(a2);
  swift_release();
}

void __swiftcall APEducationFlowViewController.init(coder:)(APEducationFlowViewController_optional *__return_ptr retstr, NSCoder coder)
{
}

void __swiftcall APEducationFlowViewController.init(nibName:bundle:)(APEducationFlowViewController *__return_ptr retstr, Swift::String_optional nibName, NSBundle_optional bundle)
{
  Class isa = bundle.value.super.isa;
  if (nibName.value._object)
  {
    id v4 = (void *)sub_247E1A248();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v4 = 0;
  }
  objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithNibName_bundle_, v4, isa);
}

void APEducationFlowViewController.init(nibName:bundle:)()
{
}

uint64_t sub_247E165EC()
{
  uint64_t v1 = sub_247E1A1E8();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1, v3);
  uint64_t v5 = (char *)&v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_247E1A208();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6, v8);
  id v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v0;
  if (*(void *)&v0[OBJC_IVAR___APEducationFlowViewController_tccUsers])
  {
    sub_247E1691C(v0);
    return swift_release();
  }
  else
  {
    uint64_t v13 = *(void **)&v0[OBJC_IVAR___APEducationFlowViewController_dispatchGroup];
    sub_247E0CD30(0, &qword_2692CF7F8);
    uint64_t v21 = v7;
    uint64_t v14 = v0;
    id v20 = v13;
    char v15 = (void *)sub_247E1A328();
    uint64_t v16 = swift_allocObject();
    *(void *)(v16 + 16) = sub_247E19054;
    *(void *)(v16 + 24) = v11;
    aBlock[4] = sub_247E19094;
    aBlock[5] = v16;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_247E0DBE8;
    aBlock[3] = &block_descriptor_111;
    id v17 = _Block_copy(aBlock);
    swift_retain();
    sub_247E1A1F8();
    uint64_t v22 = MEMORY[0x263F8EE78];
    sub_247E0CD74();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2692CF808);
    sub_247E0CE10();
    sub_247E1A408();
    id v18 = v20;
    sub_247E1A318();
    _Block_release(v17);
    swift_release();

    (*(void (**)(char *, uint64_t))(v2 + 8))(v5, v1);
    (*(void (**)(char *, uint64_t))(v21 + 8))(v10, v6);
    return swift_release();
  }
}

BOOL sub_247E1691C(void *a1)
{
  id v2 = objc_msgSend(a1, sel_delegate);
  if (v2)
  {
    uint64_t v3 = swift_allocObject();
    *(void *)(v3 + 16) = a1;
    v7[4] = sub_247E190BC;
    v7[5] = v3;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 1107296256;
    v7[2] = sub_247E120C4;
    v7[3] = &block_descriptor_117;
    uint64_t v4 = _Block_copy(v7);
    id v5 = a1;
    swift_release();
    objc_msgSend(v2, sel_educationViewController_requestAuthenticationWithCompletion_, v5, v4);
    swift_unknownObjectRelease();
    _Block_release(v4);
  }
  return v2 == 0;
}

void sub_247E16A28(char a1, int a2, char *a3)
{
  if ((a1 & 1) == 0)
  {
    id v17 = sub_247E13FB0();
    objc_msgSend(a3, sel_presentViewController_animated_completion_, v17, 1, 0);
    goto LABEL_7;
  }
  unint64_t v4 = *(void *)&a3[OBJC_IVAR___APEducationFlowViewController_tccUsers];
  if (v4)
  {
    if (v4 >> 62)
    {
      swift_bridgeObjectRetain_n();
      uint64_t v10 = sub_247E1A478();
      swift_bridgeObjectRelease();
      if (v10 >= 1) {
        goto LABEL_5;
      }
    }
    else
    {
      uint64_t v5 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      if (v5 >= 1)
      {
LABEL_5:
        id v6 = objc_msgSend(*(id *)&a3[OBJC_IVAR___APEducationFlowViewController_lazyRecordApp], sel_application);
        uint64_t v7 = (char *)objc_allocWithZone((Class)type metadata accessor for APLockedAppDisclosureViewController());
        uint64_t v8 = a3;
        uint64_t v9 = sub_247E17814(v6, v4, v8, v7);
        id v17 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F5B8E0]), sel_initWithRootViewController_, v9);
        objc_msgSend(v17, sel_setModalInPresentation_, 1);
        objc_msgSend(v8, sel_presentViewController_animated_completion_, v17, 1, 0);

LABEL_7:

        return;
      }
    }
    swift_bridgeObjectRelease();
  }
  id v11 = objc_msgSend(a3, sel_delegate);
  if (v11)
  {
    uint64_t v12 = v11;
    id v13 = objc_msgSend(*(id *)&a3[OBJC_IVAR___APEducationFlowViewController_lazyRecordApp], sel_application);
    uint64_t v14 = swift_allocObject();
    *(void *)(v14 + 16) = a3;
    aBlock[4] = sub_247E190C4;
    aBlock[5] = v14;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_247E120C4;
    aBlock[3] = &block_descriptor_123;
    char v15 = _Block_copy(aBlock);
    uint64_t v16 = a3;
    swift_release();
    objc_msgSend(v12, sel_educationViewController_requestLockOfApplication_completion_, v16, v13, v15);
    swift_unknownObjectRelease();
    _Block_release(v15);
  }
}

void sub_247E16CCC()
{
  uint64_t v1 = v0;
  v54[2] = *MEMORY[0x263EF8340];
  id v2 = *(void **)&v0[OBJC_IVAR___APEducationFlowViewController_lazyRecordApp];
  id v3 = objc_msgSend(v2, sel_bundleIdentifier);
  uint64_t v4 = sub_247E1A258();
  uint64_t v6 = v5;

  id v7 = objc_allocWithZone(MEMORY[0x263F01878]);
  id v8 = sub_247E17738(v4, v6, 0);
  id v35 = v8;
  v54[0] = 0;
  if (v8)
  {
    id v36 = self;
    id v35 = v35;
    id v37 = objc_msgSend(v36, sel_defaultWorkspace);
    if (!v37)
    {
      __break(1u);
      return;
    }
    id v38 = v37;
    aBlock[0] = 0;
    unsigned int v39 = objc_msgSend(v37, sel_getDefaultApplicationCategories_withCurrentDefaultApplication_error_, v54, v35, aBlock);

    if (v39)
    {
      id v40 = aBlock[0];
      if (v54[0])
      {
LABEL_16:
        id v41 = objc_msgSend(v2, sel_localizedName);
        uint64_t v42 = sub_247E1A258();
        uint64_t v44 = v43;

        id v45 = sub_247E18648(v42, v44);
        swift_bridgeObjectRelease();
        objc_msgSend(v1, sel_presentViewController_animated_completion_, v45, 1, 0);

        goto LABEL_22;
      }
    }
    else
    {
      id v51 = aBlock[0];
      uint64_t v52 = (void *)sub_247E1A158();

      swift_willThrow();
      if (v54[0]) {
        goto LABEL_16;
      }
    }
  }
  id v9 = objc_msgSend(self, sel_currentNotificationSettingsCenter);
  id v10 = objc_msgSend(v2, sel_bundleIdentifier);
  if (!v10)
  {
    sub_247E1A258();
    id v10 = (id)sub_247E1A248();
    swift_bridgeObjectRelease();
  }
  id v11 = objc_msgSend(v9, sel_sourceWithIdentifier_, v10);

  if (v11
    && (id v12 = objc_msgSend(v11, sel_sourceSettings),
        id v13 = objc_msgSend(v12, sel_notificationSettings),
        v12,
        id v14 = objc_msgSend(v13, sel_criticalAlertSetting),
        v13,
        v14 == (id)2))
  {
    id v15 = objc_msgSend(v2, sel_localizedName);
    uint64_t v16 = sub_247E1A258();
    uint64_t v18 = v17;

    id v19 = objc_msgSend(v2, sel_bundleIdentifier);
    uint64_t v20 = sub_247E1A258();
    uint64_t v22 = v21;

    id v23 = sub_247E142A4(v16, v18, v20, v22);
  }
  else
  {
    id v24 = objc_msgSend(v2, sel_bundleIdentifier);
    if (!v24)
    {
      sub_247E1A258();
      id v24 = (id)sub_247E1A248();
      swift_bridgeObjectRelease();
    }
    unsigned int v25 = objc_msgSend(self, sel_authorizationStatusForBundleIdentifier_, v24);

    if (v25 != 3)
    {
      id v46 = objc_msgSend(v1, sel_delegate);
      if (v46)
      {
        uint64_t v47 = v46;
        objc_super v48 = (void *)swift_allocObject();
        v48[2] = v1;
        aBlock[4] = sub_247E18FB8;
        aBlock[5] = v48;
        aBlock[0] = (id)MEMORY[0x263EF8330];
        aBlock[1] = (id)1107296256;
        aBlock[2] = sub_247E120C4;
        aBlock[3] = &block_descriptor_48;
        uint64_t v49 = _Block_copy(aBlock);
        id v50 = v1;
        swift_release();
        objc_msgSend(v47, sel_educationViewController_requestAuthenticationWithCompletion_, v50, v49);
        swift_unknownObjectRelease();

        _Block_release(v49);
        return;
      }

      goto LABEL_22;
    }
    id v26 = objc_msgSend(v2, sel_localizedName);
    uint64_t v27 = sub_247E1A258();
    uint64_t v29 = v28;

    id v30 = objc_msgSend(v2, sel_bundleIdentifier);
    uint64_t v31 = sub_247E1A258();
    uint64_t v33 = v32;

    id v23 = sub_247E149EC(v27, v29, v31, v33);
  }
  uint64_t v34 = v23;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_msgSend(v1, sel_presentViewController_animated_completion_, v34, 1, 0);

LABEL_22:
}

void sub_247E17230(char a1, uint64_t a2, char *a3)
{
  if (a1)
  {
    uint64_t v4 = *(void **)&a3[OBJC_IVAR___APEducationFlowViewController_lazyRecordApp];
    uint64_t v5 = (char *)objc_allocWithZone((Class)type metadata accessor for APHiddenAppConfirmationViewController());
    sub_247E17F24(v4, a3, v5);
    id v7 = v6;
    objc_msgSend(v6, sel_setModalInPresentation_, 1);
  }
  else
  {
    id v7 = sub_247E13FB0();
  }
  objc_msgSend(a3, sel_presentViewController_animated_completion_, v7, 1, 0);
}

void sub_247E172F0(char *a1)
{
  id v2 = objc_msgSend(a1, sel_delegate);
  if (v2)
  {
    id v3 = v2;
    id v4 = objc_msgSend(*(id *)&a1[OBJC_IVAR___APEducationFlowViewController_lazyRecordApp], sel_application);
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = a1;
    v8[4] = sub_247E191A4;
    v8[5] = v5;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 1107296256;
    v8[2] = sub_247E120C4;
    v8[3] = &block_descriptor_164;
    uint64_t v6 = _Block_copy(v8);
    id v7 = a1;
    swift_release();
    objc_msgSend(v3, sel_educationViewController_requestHideOfApplication_completion_, v7, v4, v6);
    swift_unknownObjectRelease();
    _Block_release(v6);
  }
}

void sub_247E17428(char a1, int a2, id a3)
{
  if (a1)
  {
    id v4 = objc_msgSend(a3, sel_delegate);
    if (v4)
    {
      objc_msgSend(v4, sel_educationViewControllerRequestsDismissal_withResult_, a3, 2);
      swift_unknownObjectRelease();
    }
  }
  else
  {
    id v5 = sub_247E155D8();
    objc_msgSend(a3, sel_presentViewController_animated_completion_, v5, 1, 0);
  }
}

void sub_247E174F8(char a1, int a2, id a3)
{
  if (a1)
  {
    id v4 = objc_msgSend(a3, sel_delegate);
    if (v4)
    {
      objc_msgSend(v4, sel_educationViewControllerRequestsDismissal_withResult_, a3, 1);
      swift_unknownObjectRelease();
    }
  }
  else
  {
    id v5 = sub_247E155D8();
    objc_msgSend(a3, sel_presentViewController_animated_completion_, v5, 1, 0);
  }
}

void sub_247E175C8()
{
  id v1 = objc_msgSend(v0, sel_presentedViewController);
  if (v1)
  {
    id v2 = v1;
    uint64_t v3 = swift_allocObject();
    *(void *)(v3 + 16) = v0;
    v6[4] = sub_247E1919C;
    v6[5] = v3;
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 1107296256;
    v6[2] = sub_247E0DBE8;
    v6[3] = &block_descriptor_158;
    id v4 = _Block_copy(v6);
    id v5 = v0;
    swift_release();
    objc_msgSend(v2, sel_dismissViewControllerAnimated_completion_, 1, v4);
    _Block_release(v4);
  }
}

id sub_247E176C4()
{
  id result = objc_msgSend(v0, sel_delegate);
  if (result)
  {
    objc_msgSend(result, sel_educationViewControllerRequestsDismissal_withResult_, v0, 0);
    return (id)swift_unknownObjectRelease();
  }
  return result;
}

id sub_247E17738(uint64_t a1, uint64_t a2, char a3)
{
  v10[1] = *(id *)MEMORY[0x263EF8340];
  id v5 = (void *)sub_247E1A248();
  swift_bridgeObjectRelease();
  v10[0] = 0;
  id v6 = objc_msgSend(v3, sel_initWithBundleIdentifier_allowPlaceholder_error_, v5, a3 & 1, v10);

  if (v6)
  {
    id v7 = v10[0];
  }
  else
  {
    id v8 = v10[0];
    sub_247E1A158();

    swift_willThrow();
  }
  return v6;
}

char *sub_247E17814(void *a1, uint64_t a2, void *a3, char *a4)
{
  uint64_t v7 = OBJC_IVAR____TtC15AppProtectionUI35APLockedAppDisclosureViewController_scrollViewAssistant;
  id v8 = objc_allocWithZone((Class)APButtonTrayScrollViewAssistant);
  id v9 = a4;
  *(void *)&a4[v7] = objc_msgSend(v8, sel_init);
  uint64_t v10 = OBJC_IVAR____TtC15AppProtectionUI35APLockedAppDisclosureViewController_button;
  id v11 = (void *)sub_247E1A248();
  id v12 = APUILocStr(v11);

  uint64_t v13 = sub_247E1A258();
  uint64_t v15 = v14;

  uint64_t v16 = sub_247E11CBC(v13, v15);
  swift_bridgeObjectRelease();
  *(void *)&v9[v10] = v16;
  *(void *)&v9[OBJC_IVAR____TtC15AppProtectionUI35APLockedAppDisclosureViewController_delegate + 8] = 0;
  *(void *)(swift_unknownObjectWeakInit() + 8) = &off_26FC10880;
  uint64_t v68 = a3;
  swift_unknownObjectWeakAssign();
  uint64_t v17 = *(void **)&a4[v7];
  id v18 = objc_allocWithZone((Class)APTCCDisclosureController);
  sub_247E0CD30(0, &qword_2692CFAA8);
  id v19 = a1;
  id v20 = v17;
  uint64_t v21 = (void *)sub_247E1A2B8();
  swift_bridgeObjectRelease();
  id v22 = objc_msgSend(v18, sel_initWithApplication_users_includeDoneButton_scrollViewAssistant_, v19, v21, 0, v20);

  *(void *)&v9[OBJC_IVAR____TtC15AppProtectionUI35APLockedAppDisclosureViewController_tccController] = v22;
  v69.receiver = v9;
  v69.super_class = (Class)type metadata accessor for APLockedAppDisclosureViewController();
  id v23 = (char *)objc_msgSendSuper2(&v69, sel_initWithNibName_bundle_, 0, 0);
  id v24 = *(void **)&v23[OBJC_IVAR____TtC15AppProtectionUI35APLockedAppDisclosureViewController_scrollViewAssistant];
  unsigned int v25 = v23;
  objc_msgSend(v24, sel_setDelegate_, v25);
  id v26 = objc_allocWithZone((Class)type metadata accessor for APWelcomeControllerWithBraveButtonTrayView());
  uint64_t v27 = v25;
  id v28 = objc_msgSend(v26, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  objc_msgSend(v27, sel_setView_, v28);

  uint64_t v29 = OBJC_IVAR____TtC15AppProtectionUI35APLockedAppDisclosureViewController_tccController;
  id v30 = *(void **)&v27[OBJC_IVAR____TtC15AppProtectionUI35APLockedAppDisclosureViewController_tccController];
  objc_msgSend(v27, sel_addChildViewController_, v30);
  id result = (char *)objc_msgSend(v30, sel_view);
  if (!result)
  {
    __break(1u);
    goto LABEL_12;
  }
  uint64_t v32 = result;
  id result = (char *)objc_msgSend(v27, sel_view);
  if (!result)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  uint64_t v33 = result;
  objc_msgSend(result, sel_bounds);
  double v35 = v34;
  double v37 = v36;
  double v39 = v38;
  double v41 = v40;

  objc_msgSend(v32, sel_setFrame_, v35, v37, v39, v41);
  id result = (char *)objc_msgSend(v27, sel_view);
  if (!result)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  uint64_t v42 = result;
  id result = (char *)objc_msgSend(*(id *)&v27[v29], sel_view);
  if (!result)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  uint64_t v43 = result;
  v67 = v19;
  objc_msgSend(v42, sel_addSubview_, result);

  objc_msgSend(*(id *)&v27[v29], sel_didMoveToParentViewController_, v27);
  sub_247E0CD30(0, &qword_2692CFA88);
  uint64_t v44 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v45 = sub_247E1A348();
  uint64_t v46 = OBJC_IVAR____TtC15AppProtectionUI35APLockedAppDisclosureViewController_button;
  char v66 = (void *)v45;
  objc_msgSend(*(id *)&v27[OBJC_IVAR____TtC15AppProtectionUI35APLockedAppDisclosureViewController_button], sel_addAction_forControlEvents_, 0, 0, 0, sub_247E19104, v44);
  id result = (char *)objc_msgSend(v27, sel_view);
  if (!result)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  uint64_t v47 = result;
  objc_super v48 = (char *)objc_retain(*(id *)(swift_dynamicCastClassUnconditional()
                                  + OBJC_IVAR____TtC15AppProtectionUI42APWelcomeControllerWithBraveButtonTrayView_buttonTray));

  id v49 = *(id *)&v27[v46];
  objc_msgSend(v49, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  objc_msgSend(*(id *)&v48[OBJC_IVAR____TtC15AppProtectionUI45APBraveAndIconoclasticSafeAreaUsingButtonTray_stack], sel_addArrangedSubview_, v49);

  id result = (char *)objc_msgSend(v27, sel_view);
  if (!result)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  id v50 = result;
  id v51 = (char *)swift_dynamicCastClassUnconditional();
  id v52 = objc_msgSend(*(id *)&v27[v29], sel_view);
  uint64_t v53 = OBJC_IVAR____TtC15AppProtectionUI42APWelcomeControllerWithBraveButtonTrayView_welcomeView;
  id v54 = *(void **)&v51[OBJC_IVAR____TtC15AppProtectionUI42APWelcomeControllerWithBraveButtonTrayView_welcomeView];
  *(void *)&v51[OBJC_IVAR____TtC15AppProtectionUI42APWelcomeControllerWithBraveButtonTrayView_welcomeView] = v52;
  id v55 = v52;

  if (*(void *)&v51[v53]) {
    objc_msgSend(v51, sel_insertSubview_aboveSubview_, *(void *)&v51[OBJC_IVAR____TtC15AppProtectionUI42APWelcomeControllerWithBraveButtonTrayView_buttonTray]);
  }

  id result = (char *)objc_msgSend(v27, sel_view);
  if (result)
  {
    uint64_t v56 = result;
    uint64_t v57 = swift_dynamicCastClassUnconditional();
    id v58 = objc_msgSend(*(id *)&v27[v29], sel_scrollView);
    long long v59 = *(void **)(v57
                   + OBJC_IVAR____TtC15AppProtectionUI42APWelcomeControllerWithBraveButtonTrayView_welcomeScrollView);
    *(void *)(v57 + OBJC_IVAR____TtC15AppProtectionUI42APWelcomeControllerWithBraveButtonTrayView_welcomeScrollView) = v58;

    id v60 = objc_msgSend(v27, sel_navigationItem);
    sub_247E0CD30(0, (unint64_t *)&unk_2692CFA98);
    uint64_t v61 = swift_allocObject();
    *(void *)(v61 + 24) = &off_26FC10880;
    swift_unknownObjectWeakInit();
    uint64_t v62 = swift_allocObject();
    swift_unknownObjectWeakInit();
    uint64_t v63 = swift_allocObject();
    *(void *)(v63 + 16) = v62;
    *(void *)(v63 + 24) = v61;
    uint64_t v65 = v63;
    sub_247E1A348();
    id v64 = (void *)sub_247E1A308();
    objc_msgSend(v60, sel_setRightBarButtonItem_, v64, 0, 0, 0, sub_247E19184, v65);

    return v27;
  }
LABEL_17:
  __break(1u);
  return result;
}

void sub_247E17F24(void *a1, void *a2, char *a3)
{
  *(void *)&a3[OBJC_IVAR____TtC15AppProtectionUI37APHiddenAppConfirmationViewController_welcomeController] = 0;
  *(void *)&a3[OBJC_IVAR____TtC15AppProtectionUI37APHiddenAppConfirmationViewController_navController] = 0;
  uint64_t v6 = OBJC_IVAR____TtC15AppProtectionUI37APHiddenAppConfirmationViewController_button;
  uint64_t v7 = a3;
  id v8 = (void *)sub_247E1A248();
  id v9 = APUILocStr(v8);

  uint64_t v10 = sub_247E1A258();
  uint64_t v12 = v11;

  uint64_t v13 = sub_247E11CBC(v10, v12);
  swift_bridgeObjectRelease();
  *(void *)&a3[v6] = v13;
  uint64_t v14 = &v7[OBJC_IVAR____TtC15AppProtectionUI37APHiddenAppConfirmationViewController_delegate];
  *(void *)&v7[OBJC_IVAR____TtC15AppProtectionUI37APHiddenAppConfirmationViewController_delegate + 8] = 0;
  swift_unknownObjectWeakInit();
  id v15 = objc_msgSend(a1, sel_application);
  *(void *)&v7[OBJC_IVAR____TtC15AppProtectionUI37APHiddenAppConfirmationViewController_app] = v15;
  *((void *)v14 + 1) = &off_26FC10868;
  swift_unknownObjectWeakAssign();

  v69.receiver = v7;
  v69.super_class = (Class)type metadata accessor for APHiddenAppConfirmationViewController();
  id v16 = objc_msgSendSuper2(&v69, sel_initWithNibName_bundle_, 0, 0);
  id v17 = objc_allocWithZone((Class)type metadata accessor for APWelcomeControllerWithBraveButtonTrayView());
  id v18 = (char *)v16;
  id v19 = objc_msgSend(v17, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  objc_msgSend(v18, sel_setView_, v19);

  sub_247E1218C(a1, (uint64_t)v18);
  uint64_t v20 = OBJC_IVAR____TtC15AppProtectionUI37APHiddenAppConfirmationViewController_welcomeController;
  uint64_t v21 = *(void **)&v18[OBJC_IVAR____TtC15AppProtectionUI37APHiddenAppConfirmationViewController_welcomeController];
  *(void *)&v18[OBJC_IVAR____TtC15AppProtectionUI37APHiddenAppConfirmationViewController_welcomeController] = v22;

  uint64_t v23 = *(void *)&v18[v20];
  if (!v23)
  {
    __break(1u);
    goto LABEL_19;
  }
  id v24 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F5B8E0]), sel_initWithRootViewController_, v23);
  uint64_t v25 = OBJC_IVAR____TtC15AppProtectionUI37APHiddenAppConfirmationViewController_navController;
  id v26 = *(void **)&v18[OBJC_IVAR____TtC15AppProtectionUI37APHiddenAppConfirmationViewController_navController];
  *(void *)&v18[OBJC_IVAR____TtC15AppProtectionUI37APHiddenAppConfirmationViewController_navController] = v24;

  if (!*(void *)&v18[v25])
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  objc_msgSend(v18, sel_addChildViewController_);
  uint64_t v27 = *(void **)&v18[v25];
  if (!v27)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  id v28 = objc_msgSend(v27, sel_view);
  if (!v28)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  uint64_t v29 = v28;
  id v30 = objc_msgSend(v18, sel_view);
  if (!v30)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  uint64_t v31 = v30;
  objc_msgSend(v30, sel_bounds);
  double v33 = v32;
  double v35 = v34;
  double v37 = v36;
  double v39 = v38;

  objc_msgSend(v29, sel_setFrame_, v33, v35, v37, v39);
  id v40 = objc_msgSend(v18, sel_view);
  if (!v40)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  double v41 = v40;
  uint64_t v42 = *(void **)&v18[v25];
  if (!v42)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  id v43 = objc_msgSend(v42, sel_view);
  if (!v43)
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  uint64_t v44 = v43;
  uint64_t v68 = a2;
  objc_msgSend(v41, sel_addSubview_, v43);

  uint64_t v45 = *(void **)&v18[v25];
  if (!v45)
  {
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  objc_msgSend(v45, sel_didMoveToParentViewController_, v18);
  sub_247E0CD30(0, &qword_2692CFA88);
  uint64_t v46 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v47 = (void *)sub_247E1A348();
  uint64_t v48 = OBJC_IVAR____TtC15AppProtectionUI37APHiddenAppConfirmationViewController_button;
  objc_msgSend(*(id *)&v18[OBJC_IVAR____TtC15AppProtectionUI37APHiddenAppConfirmationViewController_button], sel_addAction_forControlEvents_, v47, 0x2000, 0, 0, 0, sub_247E19044, v46);
  id v49 = objc_msgSend(v18, sel_view);
  if (!v49)
  {
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  id v50 = v49;
  uint64_t v67 = v20;
  id v51 = (char *)objc_retain(*(id *)(swift_dynamicCastClassUnconditional()
                                  + OBJC_IVAR____TtC15AppProtectionUI42APWelcomeControllerWithBraveButtonTrayView_buttonTray));

  id v52 = *(id *)&v18[v48];
  objc_msgSend(v52, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  objc_msgSend(*(id *)&v51[OBJC_IVAR____TtC15AppProtectionUI45APBraveAndIconoclasticSafeAreaUsingButtonTray_stack], sel_addArrangedSubview_, v52);

  id v53 = objc_msgSend(v18, sel_view);
  if (!v53)
  {
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  id v54 = v53;
  id v55 = (char *)swift_dynamicCastClassUnconditional();
  uint64_t v56 = *(void **)&v18[v25];
  if (!v56)
  {
LABEL_29:
    __break(1u);
LABEL_30:
    __break(1u);
    goto LABEL_31;
  }
  id v57 = objc_msgSend(v56, sel_view);
  uint64_t v58 = OBJC_IVAR____TtC15AppProtectionUI42APWelcomeControllerWithBraveButtonTrayView_welcomeView;
  long long v59 = *(void **)&v55[OBJC_IVAR____TtC15AppProtectionUI42APWelcomeControllerWithBraveButtonTrayView_welcomeView];
  *(void *)&v55[OBJC_IVAR____TtC15AppProtectionUI42APWelcomeControllerWithBraveButtonTrayView_welcomeView] = v57;
  id v60 = v57;

  if (*(void *)&v55[v58]) {
    objc_msgSend(v55, sel_insertSubview_aboveSubview_, *(void *)&v55[OBJC_IVAR____TtC15AppProtectionUI42APWelcomeControllerWithBraveButtonTrayView_buttonTray]);
  }

  id v61 = objc_msgSend(v18, sel_view);
  if (!v61) {
    goto LABEL_30;
  }
  uint64_t v62 = v61;
  uint64_t v63 = swift_dynamicCastClassUnconditional();
  id v64 = *(void **)&v18[v67];
  if (v64)
  {
    id v65 = objc_msgSend(v64, sel_scrollView);
    char v66 = *(void **)(v63
                   + OBJC_IVAR____TtC15AppProtectionUI42APWelcomeControllerWithBraveButtonTrayView_welcomeScrollView);
    *(void *)(v63 + OBJC_IVAR____TtC15AppProtectionUI42APWelcomeControllerWithBraveButtonTrayView_welcomeScrollView) = v65;

    return;
  }
LABEL_31:
  __break(1u);
}

void sub_247E18510()
{
  id v1 = objc_msgSend(v0, sel_delegate);
  if (v1)
  {
    id v2 = v1;
    id v3 = objc_msgSend(*(id *)&v0[OBJC_IVAR___APEducationFlowViewController_lazyRecordApp], sel_application);
    uint64_t v4 = swift_allocObject();
    *(void *)(v4 + 16) = v0;
    v7[4] = sub_247E191AC;
    v7[5] = v4;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 1107296256;
    v7[2] = sub_247E120C4;
    v7[3] = &block_descriptor_152;
    id v5 = _Block_copy(v7);
    uint64_t v6 = v0;
    swift_release();
    objc_msgSend(v2, sel_educationViewController_requestLockOfApplication_completion_, v6, v3, v5);
    swift_unknownObjectRelease();
    _Block_release(v5);
  }
}

id sub_247E18648(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (void *)sub_247E1A248();
  swift_bridgeObjectRelease();
  id v5 = APUILocStr(v4);

  sub_247E1A258();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2692CFA60);
  uint64_t v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_247E1B910;
  *(void *)(v6 + 56) = MEMORY[0x263F8D310];
  *(void *)(v6 + 64) = sub_247E18F04();
  *(void *)(v6 + 32) = a1;
  *(void *)(v6 + 40) = a2;
  swift_bridgeObjectRetain();
  sub_247E1A268();
  swift_bridgeObjectRelease();
  uint64_t v7 = (void *)sub_247E1A248();
  swift_bridgeObjectRelease();
  id v8 = APUILocStr(v7);

  sub_247E1A258();
  id v9 = (void *)sub_247E1A248();
  swift_bridgeObjectRelease();
  uint64_t v10 = (void *)sub_247E1A248();
  swift_bridgeObjectRelease();
  id v11 = objc_msgSend(self, sel_alertControllerWithTitle_message_preferredStyle_, v9, v10, 1);

  uint64_t v12 = (void *)sub_247E1A248();
  id v13 = APUILocStr(v12);

  sub_247E1A258();
  uint64_t v14 = swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_retain();
  id v15 = (void *)sub_247E1A248();
  swift_bridgeObjectRelease();
  id v30 = sub_247E18FC0;
  uint64_t v31 = v14;
  uint64_t v26 = MEMORY[0x263EF8330];
  uint64_t v27 = 1107296256;
  id v28 = sub_247E13EEC;
  uint64_t v29 = &block_descriptor_54;
  id v16 = _Block_copy(&v26);
  swift_release();
  id v17 = self;
  id v18 = objc_msgSend(v17, sel_actionWithTitle_style_handler_, v15, 0, v16);
  _Block_release(v16);
  swift_release();

  objc_msgSend(v11, sel_addAction_, v18);
  id v19 = (void *)sub_247E1A248();
  id v20 = APUILocStr(v19);

  sub_247E1A258();
  uint64_t v21 = swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_retain();
  uint64_t v22 = (void *)sub_247E1A248();
  swift_bridgeObjectRelease();
  id v30 = sub_247E18EE8;
  uint64_t v31 = v21;
  uint64_t v26 = MEMORY[0x263EF8330];
  uint64_t v27 = 1107296256;
  id v28 = sub_247E13EEC;
  uint64_t v29 = &block_descriptor_58;
  uint64_t v23 = _Block_copy(&v26);
  swift_release();
  id v24 = objc_msgSend(v17, sel_actionWithTitle_style_handler_, v22, 0, v23);
  _Block_release(v23);
  swift_release();

  objc_msgSend(v11, sel_addAction_, v24);
  return v11;
}

void _sSo29APEducationFlowViewControllerC15AppProtectionUIE5coderABSgSo7NSCoderC_tcfc_0()
{
  v0[OBJC_IVAR___APEducationFlowViewController_hasAppeared] = 0;
  v0[OBJC_IVAR___APEducationFlowViewController_checkedHidable] = 2;
  *(void *)&v0[OBJC_IVAR___APEducationFlowViewController_initialAlertController] = 0;
  *(void *)&v0[OBJC_IVAR___APEducationFlowViewController_tccUsers] = 0;
  uint64_t v1 = OBJC_IVAR___APEducationFlowViewController_dispatchGroup;
  *(void *)&v0[v1] = dispatch_group_create();
  swift_unknownObjectWeakInit();

  sub_247E1A468();
  __break(1u);
}

void _sSo29APEducationFlowViewControllerC15AppProtectionUIE13viewDidAppearyySbF_0()
{
  v0[OBJC_IVAR___APEducationFlowViewController_hasAppeared] = 1;
  uint64_t v1 = OBJC_IVAR___APEducationFlowViewController_checkedHidable;
  if (v0[OBJC_IVAR___APEducationFlowViewController_checkedHidable] == 2) {
    return;
  }
  id v2 = objc_msgSend(v0, sel_view);
  if (!v2)
  {
    __break(1u);
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  id v3 = v2;
  id v4 = objc_msgSend(v2, sel_window);

  if (!v4) {
    return;
  }
  uint64_t v5 = OBJC_IVAR___APEducationFlowViewController_initialAlertController;
  if (*(void *)&v0[OBJC_IVAR___APEducationFlowViewController_initialAlertController]) {
    return;
  }
  int v6 = v0[v1];
  if (v6 == 2) {
    goto LABEL_12;
  }
  id v7 = sub_247E12AF4(*(void *)&v0[OBJC_IVAR___APEducationFlowViewController_appName], *(void *)&v0[OBJC_IVAR___APEducationFlowViewController_appName + 8], (uint64_t)v0, v6 & 1);
  id v8 = *(void **)&v0[v5];
  *(void *)&v0[v5] = v7;

  if (!*(void *)&v0[v5])
  {
LABEL_13:
    __break(1u);
    return;
  }

  objc_msgSend(v0, sel_presentViewController_animated_completion_);
}

uint64_t type metadata accessor for APEducationFlowViewController(uint64_t a1)
{
  return sub_247E0CD30(a1, (unint64_t *)&unk_2692CFA50);
}

uint64_t sub_247E18E00()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_247E18E38(uint64_t a1)
{
  sub_247E15F20(a1, *(void *)(v1 + 16));
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

uint64_t sub_247E18E58(uint64_t a1)
{
  return sub_247E16000(a1, *(void **)(v1 + 16), *(void **)(v1 + 24));
}

uint64_t sub_247E18E60()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

void sub_247E18EA0()
{
  sub_247E16184(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_247E18EA8()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_247E18EB8()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

void sub_247E18EE0(uint64_t a1)
{
  sub_247E136DC(a1, v1);
}

void sub_247E18EE8(uint64_t a1)
{
  sub_247E1592C(a1, v1);
}

unint64_t sub_247E18F04()
{
  unint64_t result = qword_2692CFA68;
  if (!qword_2692CFA68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2692CFA68);
  }
  return result;
}

void sub_247E18F58(uint64_t a1)
{
  sub_247E13F54(a1, v1, (void (*)(void))sub_247E165EC);
}

void sub_247E18F88(uint64_t a1)
{
  sub_247E13F54(a1, v1, sub_247E16CCC);
}

void sub_247E18FB8(char a1, uint64_t a2)
{
  sub_247E17230(a1, a2, *(char **)(v2 + 16));
}

void sub_247E18FC0(uint64_t a1)
{
  sub_247E15134(a1, v1);
}

void sub_247E18FC8(uint64_t a1, void *a2)
{
  sub_247E153B4(a1, a2, v2);
}

void sub_247E18FE8(uint64_t a1)
{
  sub_247E14728(a1, v1[2], v1[3], v1[4]);
}

uint64_t objectdestroy_65Tm()
{
  swift_bridgeObjectRelease();
  swift_release();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

void sub_247E19038(uint64_t a1)
{
  sub_247E14E70(a1, v1[2], v1[3], v1[4]);
}

void sub_247E19044(uint64_t a1)
{
  sub_247E0FCE4(a1, v1);
}

void sub_247E1904C(uint64_t a1)
{
  sub_247E12A44(a1, v1);
}

BOOL sub_247E19054()
{
  return sub_247E1691C(*(void **)(v0 + 16));
}

uint64_t sub_247E1905C()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_247E19094()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

void sub_247E190BC(char a1, int a2)
{
  sub_247E16A28(a1, a2, *(char **)(v2 + 16));
}

void sub_247E190C4(char a1, int a2)
{
  sub_247E174F8(a1, a2, *(id *)(v2 + 16));
}

uint64_t sub_247E190CC()
{
  swift_unknownObjectWeakDestroy();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_247E19104(uint64_t a1)
{
  sub_247E102A0(a1, v1);
}

uint64_t sub_247E1910C()
{
  swift_unknownObjectWeakDestroy();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_247E19144()
{
  swift_release();
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

void sub_247E19184(uint64_t a1)
{
  sub_247E1034C(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_247E1918C(uint64_t a1, void *a2)
{
  return sub_247E1395C(a1, a2, v2);
}

void sub_247E19194()
{
  sub_247E13DB0(v0);
}

void sub_247E1919C()
{
  sub_247E172F0(*(char **)(v0 + 16));
}

void sub_247E191A4(char a1, int a2)
{
  sub_247E17428(a1, a2, *(id *)(v2 + 16));
}

id APEnablementSuggestion.subject.getter()
{
  return *v0;
}

uint64_t APEnablementSuggestion.feature.getter()
{
  return *(void *)(v0 + 8);
}

uint64_t APEnablementSuggestion.action.getter()
{
  return *(void *)(v0 + 16);
}

id sub_247E192D0()
{
  id result = objc_msgSend(objc_allocWithZone((Class)APEnablementOracle), sel_init);
  qword_26B13A230 = (uint64_t)result;
  return result;
}

APEnablementOracle __swiftcall APEnablementOracle.init()()
{
  id v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());

  return (APEnablementOracle)objc_msgSend(v0, sel_init);
}

id static APEnablementOracle.shared.getter()
{
  id v0 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_sharedInstance);

  return v0;
}

id APEnablementOracle.init()()
{
  v1.super_class = (Class)APEnablementOracle;
  return objc_msgSendSuper2(&v1, sel_init);
}

id APEnablementOracle.enablementSuggestion(for:)@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  id v3 = v2;
  v15[1] = *MEMORY[0x263EF8340];
  uint64_t v14 = 0;
  v15[0] = 0;
  id v13 = 0;
  unsigned int v6 = objc_msgSend(v3, sel_getPreferredEnablementAction_preferredEnableableFeature_forSubject_error_, v15, &v14, a1, &v13);
  id v7 = v13;
  if (v6)
  {
    uint64_t v8 = v14;
    uint64_t v9 = v15[0];
    *a2 = a1;
    a2[1] = v8;
    a2[2] = v9;
    id v10 = v7;
    return a1;
  }
  else
  {
    id v12 = v13;
    sub_247E1A158();

    return (id)swift_willThrow();
  }
}

uint64_t initializeBufferWithCopyOfBuffer for APEnablementSuggestion(uint64_t a1, uint64_t a2)
{
  id v3 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  id v4 = v3;
  return a1;
}

void destroy for APEnablementSuggestion(id *a1)
{
}

uint64_t assignWithCopy for APEnablementSuggestion(uint64_t a1, uint64_t a2)
{
  id v4 = *(void **)a2;
  uint64_t v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  return a1;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for APEnablementSuggestion(uint64_t a1, uint64_t a2)
{
  id v4 = *(void **)a1;
  *(void *)a1 = *(void *)a2;

  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  return a1;
}

uint64_t getEnumTagSinglePayload for APEnablementSuggestion(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 24)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for APEnablementSuggestion(uint64_t result, int a2, int a3)
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
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 24) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for APEnablementSuggestion()
{
  return &type metadata for APEnablementSuggestion;
}

unint64_t type metadata accessor for APEnablementOracle()
{
  unint64_t result = qword_2692CFAB0;
  if (!qword_2692CFAB0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2692CFAB0);
  }
  return result;
}

uint64_t sub_247E197E4(uint64_t a1, uint64_t a2, id a3)
{
  if (a1 != 1 && a1 != 2) {
    return 0;
  }
  if (a2 == 1)
  {
    unsigned __int8 v11 = objc_msgSend(a3, sel_isLocked);
    if (a1 == 1 && (v11 & 1) != 0) {
      return 0;
    }
    unsigned __int8 v9 = objc_msgSend(a3, sel_isLocked);
    id v10 = &selRef_canChangeLockedStatusOfSubject_;
    if (a1 != 2)
    {
LABEL_22:
      id v12 = self;
      goto LABEL_31;
    }
    goto LABEL_21;
  }
  if (a2 != 3)
  {
    if (a2 != 2) {
      return 0;
    }
    if (objc_msgSend(a3, sel_isLocked))
    {
      unsigned int v7 = objc_msgSend(a3, sel_isHidden);
      if (a1 == 1 && !v7) {
        return 0;
      }
    }
    unsigned __int8 v8 = objc_msgSend(a3, sel_isHidden);
    if (a1 == 1 && (v8 & 1) != 0) {
      return 0;
    }
    unsigned __int8 v9 = objc_msgSend(a3, sel_isHidden);
    id v10 = &selRef_canChangeHiddenStatusOfSubject_;
    if (a1 != 2) {
      goto LABEL_22;
    }
LABEL_21:
    if (v9) {
      goto LABEL_22;
    }
    return 0;
  }
  if (objc_msgSend(a3, sel_isLocked))
  {
    if (a1 == 1) {
      return 0;
    }
  }
  else
  {
    unsigned __int8 v13 = objc_msgSend(a3, sel_isHidden);
    if (a1 == 1 && (v13 & 1) != 0) {
      return 0;
    }
  }
  if ((objc_msgSend(a3, sel_isLocked) & 1) != 0
    || (unsigned int v14 = objc_msgSend(a3, sel_isHidden), a1 != 2)
    || v14)
  {
    id v12 = self;
    id v15 = objc_msgSend(v12, sel_sharedManager);
    unsigned __int8 v16 = objc_msgSend(v15, sel_canChangeLockedStatusOfSubject_, a3);

    if (v16) {
      return 1;
    }
    id v10 = &selRef_canChangeHiddenStatusOfSubject_;
LABEL_31:
    id v17 = objc_msgSend(v12, sel_sharedManager);
    id v5 = objc_msgSend(v17, *v10, a3);

    return (uint64_t)v5;
  }
  return 0;
}

uint64_t sub_247E199E8(uint64_t *a1, void *a2, void *a3)
{
  id v6 = self;
  id v7 = objc_msgSend(v6, sel_sharedManager);
  unsigned __int8 v8 = objc_msgSend(v7, sel_canChangeLockedStatusOfSubject_, a3);

  if ((v8 & 1) != 0
    || (id v9 = objc_msgSend(v6, sel_sharedManager),
        unsigned int v10 = objc_msgSend(v9, sel_canChangeHiddenStatusOfSubject_, a3),
        v9,
        v10))
  {
    uint64_t result = (uint64_t)objc_msgSend(a3, sel_isLocked);
    if (result)
    {
      uint64_t v12 = 2;
    }
    else
    {
      uint64_t result = (uint64_t)objc_msgSend(a3, sel_isHidden);
      uint64_t v12 = 1;
      if (result) {
        uint64_t v12 = 2;
      }
    }
    *a1 = v12;
    *a2 = 3;
  }
  else
  {
    sub_247E1A258();
    id v13 = objc_allocWithZone(MEMORY[0x263F087E8]);
    unsigned int v14 = (void *)sub_247E1A248();
    swift_bridgeObjectRelease();
    objc_msgSend(v13, sel_initWithDomain_code_userInfo_, v14, 3, 0);

    return swift_willThrow();
  }
  return result;
}

uint64_t sub_247E1A148()
{
  return MEMORY[0x270EEF830]();
}

uint64_t sub_247E1A158()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_247E1A168()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_247E1A178()
{
  return MEMORY[0x270EEFF00]();
}

uint64_t sub_247E1A188()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_247E1A198()
{
  return MEMORY[0x270EF0FA0]();
}

uint64_t sub_247E1A1A8()
{
  return MEMORY[0x270EF10A8]();
}

uint64_t sub_247E1A1B8()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_247E1A1C8()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_247E1A1D8()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_247E1A1E8()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_247E1A1F8()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_247E1A208()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_247E1A218()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_247E1A228()
{
  return MEMORY[0x270EF18D0]();
}

uint64_t sub_247E1A238()
{
  return MEMORY[0x270EF1958]();
}

uint64_t sub_247E1A248()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_247E1A258()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_247E1A268()
{
  return MEMORY[0x270EF1A50]();
}

uint64_t sub_247E1A278()
{
  return MEMORY[0x270EF1AF8]();
}

uint64_t sub_247E1A288()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_247E1A298()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_247E1A2A8()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_247E1A2B8()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_247E1A2C8()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_247E1A2D8()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_247E1A2E8()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_247E1A2F8()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_247E1A308()
{
  return MEMORY[0x270F82478]();
}

uint64_t sub_247E1A318()
{
  return MEMORY[0x270FA0C20]();
}

uint64_t sub_247E1A328()
{
  return MEMORY[0x270FA0D70]();
}

uint64_t sub_247E1A338()
{
  return MEMORY[0x270FA0DA0]();
}

uint64_t sub_247E1A348()
{
  return MEMORY[0x270F82960]();
}

uint64_t sub_247E1A358()
{
  return MEMORY[0x270F82998]();
}

uint64_t sub_247E1A368()
{
  return MEMORY[0x270F829B0]();
}

uint64_t sub_247E1A378()
{
  return MEMORY[0x270F829B8]();
}

uint64_t sub_247E1A388()
{
  return MEMORY[0x270F82A78]();
}

uint64_t sub_247E1A398()
{
  return MEMORY[0x270F82AD0]();
}

uint64_t sub_247E1A3A8()
{
  return MEMORY[0x270F82B18]();
}

uint64_t sub_247E1A3B8()
{
  return MEMORY[0x270F82B28]();
}

uint64_t sub_247E1A3C8()
{
  return MEMORY[0x270F82B58]();
}

uint64_t sub_247E1A3D8()
{
  return MEMORY[0x270F82B60]();
}

uint64_t sub_247E1A3E8()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_247E1A3F8()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_247E1A408()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_247E1A418()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_247E1A428()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_247E1A438()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_247E1A448()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_247E1A458()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_247E1A468()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_247E1A478()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_247E1A488()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_247E1A498()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_247E1A4A8()
{
  return MEMORY[0x270F9FA68]();
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  MEMORY[0x270EE71C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  MEMORY[0x270EE71D0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x270EE7218]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  MEMORY[0x270EE7238]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x270EE7270]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

uint64_t MKBGetDeviceLockState()
{
  return MEMORY[0x270F4AE40]();
}

uint64_t MobileGestalt_get_current_device()
{
  return MEMORY[0x270F960E8]();
}

uint64_t MobileGestalt_get_pearlIDCapability()
{
  return MEMORY[0x270F96188]();
}

uint64_t MobileGestalt_get_touchIDCapability()
{
  return MEMORY[0x270F96198]();
}

uint64_t _APErrorCodeDescription()
{
  return MEMORY[0x270F0CCB0]();
}

uint64_t _APMakeNSError()
{
  return MEMORY[0x270F0CCB8]();
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

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
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

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x270ED9340]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9448](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
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

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
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

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
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

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x270FA0200]();
}

uint64_t swift_dynamicCastClassUnconditional()
{
  return MEMORY[0x270FA0270]();
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

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x270FA0448]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x270FA0498]();
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

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}

void xpc_connection_cancel(xpc_connection_t connection)
{
}

xpc_connection_t xpc_connection_create(const char *name, dispatch_queue_t targetq)
{
  return (xpc_connection_t)MEMORY[0x270EDBE40](name, targetq);
}

void xpc_connection_resume(xpc_connection_t connection)
{
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return (xpc_object_t)MEMORY[0x270EDC020](original);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x270EDC0A8](xdict, key);
}

xpc_endpoint_t xpc_endpoint_create(xpc_connection_t connection)
{
  return (xpc_endpoint_t)MEMORY[0x270EDC180](connection);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x270EDC200](object);
}

const char *__cdecl xpc_type_get_name(xpc_type_t type)
{
  return (const char *)MEMORY[0x270EDC428](type);
}