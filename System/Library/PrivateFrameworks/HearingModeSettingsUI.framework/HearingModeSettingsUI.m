BOOL isAudiogramValid(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  id v4;
  BOOL v5;
  void v7[4];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v1 = a1;
  v2 = frequencyToHearingDecibelLevelMapFromAudiogram(v1);
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v3 = requiredFrequencyBins();
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __isAudiogramValid_block_invoke;
  v7[3] = &unk_2653641C0;
  v4 = v2;
  v8 = v4;
  v9 = &v10;
  [v3 enumerateObjectsUsingBlock:v7];

  v5 = *((unsigned char *)v11 + 24) == 0;
  _Block_object_dispose(&v10, 8);

  return v5;
}

void sub_2512271C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id requiredFrequencyBins()
{
  v0 = (void *)requiredFrequencyBins_requiredFrequencyBins;
  if (!requiredFrequencyBins_requiredFrequencyBins)
  {
    uint64_t v1 = objc_msgSend(objc_alloc(MEMORY[0x263EFF8C0]), "initWithObjects:", &unk_27021C7A8, &unk_27021C7B8, &unk_27021C7C8, &unk_27021C7D8, &unk_27021C7E8, &unk_27021C7F8, 0);
    v2 = (void *)requiredFrequencyBins_requiredFrequencyBins;
    requiredFrequencyBins_requiredFrequencyBins = v1;

    v0 = (void *)requiredFrequencyBins_requiredFrequencyBins;
  }
  return v0;
}

id frequencyToHearingDecibelLevelMapFromAudiogram(void *a1)
{
  id v1 = a1;
  if (v1)
  {
    id v2 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    uint64_t v10 = 0;
    v11 = &v10;
    uint64_t v12 = 0x2020000000;
    char v13 = 0;
    v3 = [v1 sensitivityPoints];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __frequencyToHearingDecibelLevelMapFromAudiogram_block_invoke;
    v7[3] = &unk_265364198;
    v9 = &v10;
    id v4 = v2;
    id v8 = v4;
    [v3 enumerateObjectsUsingBlock:v7];

    if (*((unsigned char *)v11 + 24)) {
      id v5 = 0;
    }
    else {
      id v5 = v4;
    }

    _Block_object_dispose(&v10, 8);
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

void sub_2512277CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __frequencyToHearingDecibelLevelMapFromAudiogram_block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  v7 = [v6 frequency];
  id v8 = [MEMORY[0x263F0A830] hertzUnit];
  [v7 doubleValueForUnit:v8];
  double v10 = v9;

  v11 = requiredFrequencyBins();
  uint64_t v12 = [NSNumber numberWithDouble:v10];
  int v13 = [v11 containsObject:v12];

  if (v13)
  {
    uint64_t v35 = 0;
    v36 = &v35;
    uint64_t v37 = 0x3032000000;
    v38 = __Block_byref_object_copy_;
    v39 = __Block_byref_object_dispose_;
    id v40 = 0;
    uint64_t v29 = 0;
    v30 = &v29;
    uint64_t v31 = 0x3032000000;
    v32 = __Block_byref_object_copy_;
    v33 = __Block_byref_object_dispose_;
    id v34 = 0;
    v14 = [v6 tests];
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __frequencyToHearingDecibelLevelMapFromAudiogram_block_invoke_628;
    v28[3] = &unk_265364170;
    v28[4] = &v35;
    v28[5] = &v29;
    [v14 enumerateObjectsUsingBlock:v28];
    v15 = (void *)v36[5];
    if (v15 && v30[5])
    {
      v16 = [MEMORY[0x263F0A830] decibelHearingLevelUnit];
      [v15 doubleValueForUnit:v16];
      double v18 = v17;

      v19 = (void *)v30[5];
      v20 = [MEMORY[0x263F0A830] decibelHearingLevelUnit];
      [v19 doubleValueForUnit:v20];
      double v22 = v21;

      id v23 = objc_alloc_init(MEMORY[0x263EFF9A0]);
      v24 = [NSNumber numberWithDouble:v18];
      [v23 setObject:v24 forKey:@"left"];

      v25 = [NSNumber numberWithDouble:v22];
      [v23 setObject:v25 forKey:@"right"];

      v26 = *(void **)(a1 + 32);
      v27 = [NSNumber numberWithDouble:v10];
      [v26 setObject:v23 forKey:v27];
    }
    else
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
      *a4 = 1;
    }

    _Block_object_dispose(&v29, 8);
    _Block_object_dispose(&v35, 8);
  }
}

void sub_251227AD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va1, a7);
  va_start(va, a7);
  uint64_t v8 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
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

uint64_t __frequencyToHearingDecibelLevelMapFromAudiogram_block_invoke_628(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40))
  {
    uint64_t v10 = v3;
    id v3 = (id)[v3 side];
    id v4 = v10;
    if (!v3)
    {
      id v5 = [v10 clampedSensitivity];
      if (v5) {
        [v10 clampedSensitivity];
      }
      else {
      id v6 = [v10 sensitivity];
      }
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), v6);

      id v4 = v10;
    }
  }
  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    uint64_t v11 = v4;
    id v3 = (id)[v4 side];
    id v4 = v11;
    if (v3 == (id)1)
    {
      v7 = [v11 clampedSensitivity];
      if (v7) {
        [v11 clampedSensitivity];
      }
      else {
      uint64_t v8 = [v11 sensitivity];
      }
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v8);

      id v4 = v11;
    }
  }
  return MEMORY[0x270F9A758](v3, v4);
}

void __isAudiogramValid_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  id v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:a2];

  if (!v6)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
}

id hearing_log()
{
  if (hearing_log_onceToken[0] != -1) {
    dispatch_once(hearing_log_onceToken, &__block_literal_global_3);
  }
  v0 = (void *)hearing_log___logger;
  return v0;
}

uint64_t __hearing_log_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.HearmingMode", "Headphone");
  uint64_t v1 = hearing_log___logger;
  hearing_log___logger = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_25122F940(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_25122FCE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id sub_25123240C()
{
  os_log_t v0 = self;
  id v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F0A410]), sel_init);
  id v2 = objc_msgSend(v0, sel_makeStandardViewControllerWithHealthStore_entryPoint_, v1, 0);

  return v2;
}

id sub_251232480(void *a1)
{
  (*(void (**)(void *))((*MEMORY[0x263F8EED0] & *v1) + 0x70))(a1);
  id v2 = objc_msgSend(self, sel_makeStandardViewControllerAudioGramImportFlowProvider_, v1);
  return v2;
}

id sub_2512325CC()
{
  id v0 = objc_allocWithZone(MEMORY[0x263F82E10]);
  return objc_msgSend(v0, sel_init);
}

id sub_251232604()
{
  id v1 = (void **)(v0 + OBJC_IVAR____TtC21HearingModeSettingsUI20HMHearingTestService_enrollmentViewController);
  swift_beginAccess();
  id v2 = *v1;
  return v2;
}

void sub_25123265C(void *a1)
{
  id v3 = (void **)(v1 + OBJC_IVAR____TtC21HearingModeSettingsUI20HMHearingTestService_enrollmentViewController);
  swift_beginAccess();
  id v4 = *v3;
  void *v3 = a1;
}

uint64_t (*sub_2512326B0())()
{
  return j__swift_endAccess;
}

void sub_251232710(void *a1)
{
  id v2 = objc_msgSend(a1, sel_navigationController);
  if (v2)
  {
    id v3 = v2;
    id v4 = (id)(*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v1) + 0x68))();
    objc_msgSend(v3, sel_pushViewController_animated_, v4, 1);
  }
}

id HMHearingTestService.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

id HMHearingTestService.init()()
{
  uint64_t v1 = OBJC_IVAR____TtC21HearingModeSettingsUI20HMHearingTestService_enrollmentViewController;
  id v2 = objc_allocWithZone(MEMORY[0x263F82E10]);
  id v3 = v0;
  *(void *)&v0[v1] = objc_msgSend(v2, sel_init);

  v5.receiver = v3;
  v5.super_class = (Class)type metadata accessor for HMHearingTestService();
  return objc_msgSendSuper2(&v5, sel_init);
}

uint64_t type metadata accessor for HMHearingTestService()
{
  return self;
}

id HMHearingTestService.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for HMHearingTestService();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t method lookup function for HMHearingTestService(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for HMHearingTestService);
}

uint64_t dispatch thunk of HMHearingTestService.hearingTestViewController.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x58))();
}

uint64_t dispatch thunk of HMHearingTestService.hearingTestViewController(enrollmentViewController:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x60))();
}

uint64_t dispatch thunk of HMHearingTestService.didTapImportAudiogramLink(in:completion:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x80))();
}

BOOL HearingFlowType.init(rawValue:)(uint64_t a1)
{
  return a1 && a1 == 1;
}

BOOL sub_251232B28(void *a1, void *a2)
{
  return *a1 == *a2;
}

uint64_t sub_251232B3C()
{
  return sub_25126C9E8();
}

uint64_t sub_251232B84()
{
  return sub_25126C9D8();
}

uint64_t sub_251232BB0()
{
  return sub_25126C9E8();
}

void *sub_251232BF4@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  BOOL v2 = *result != 1 && *result != 0;
  *(void *)a2 = *result == 1;
  *(unsigned char *)(a2 + 8) = v2;
  return result;
}

void sub_251232C24(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_251232C74()
{
  uint64_t v1 = OBJC_IVAR____TtC21HearingModeSettingsUI27HearingAssistFlowController____lazy_storage___initialViewController;
  BOOL v2 = *(void **)(v0
                + OBJC_IVAR____TtC21HearingModeSettingsUI27HearingAssistFlowController____lazy_storage___initialViewController);
  if (v2)
  {
    id v3 = *(id *)(v0
               + OBJC_IVAR____TtC21HearingModeSettingsUI27HearingAssistFlowController____lazy_storage___initialViewController);
LABEL_8:
    id v8 = v2;
    return (uint64_t)v3;
  }
  uint64_t v4 = v0;
  uint64_t v5 = *(void *)(v0 + OBJC_IVAR____TtC21HearingModeSettingsUI27HearingAssistFlowController_flowType);
  if (v5 == 1)
  {
    id v6 = objc_msgSend(objc_allocWithZone((Class)HMHearingAidAudiogramViewController), sel_init);
LABEL_7:
    v7 = *(void **)(v0 + v1);
    *(void *)(v4 + v1) = v6;
    id v3 = v6;

    BOOL v2 = 0;
    goto LABEL_8;
  }
  if (!v5)
  {
    type metadata accessor for HearingAssistWelcomeController();
    id v6 = sub_25124B850(objc_retain(*(id *)(v0
                                         + OBJC_IVAR____TtC21HearingModeSettingsUI27HearingAssistFlowController_hmsClient)));
    goto LABEL_7;
  }
  uint64_t result = sub_25126C968();
  __break(1u);
  return result;
}

uint64_t sub_251232D9C(uint64_t a1)
{
  *(void *)(v1
            + OBJC_IVAR____TtC21HearingModeSettingsUI27HearingAssistFlowController____lazy_storage___initialViewController) = a1;
  return MEMORY[0x270F9A758]();
}

uint64_t sub_251232DB0@<X0>(void **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & **a1) + 0x70))();
  *a2 = result;
  return result;
}

uint64_t sub_251232E0C(id *a1, void **a2)
{
  return (*(uint64_t (**)(id))((*MEMORY[0x263F8EED0] & **a2) + 0x78))(*a1);
}

void (*sub_251232E70(uint64_t *a1))(uint64_t *a1)
{
  a1[1] = v1;
  *a1 = sub_251232C74();
  return sub_251232EB8;
}

void sub_251232EB8(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v1 = a1[1];
  id v3 = *(void **)(v1
                + OBJC_IVAR____TtC21HearingModeSettingsUI27HearingAssistFlowController____lazy_storage___initialViewController);
  *(void *)(v1
            + OBJC_IVAR____TtC21HearingModeSettingsUI27HearingAssistFlowController____lazy_storage___initialViewController) = v2;
}

uint64_t sub_251232ED0()
{
  return 0;
}

id sub_251232F74()
{
  type metadata accessor for HearingFlowNavigationController();
  uint64_t v1 = (void *)(*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x70))();
  uint64_t v2 = swift_unknownObjectRetain();
  return sub_251250EAC(v2, v1);
}

id HearingAssistFlowController.headphoneDevice.getter()
{
  return *(id *)(v0 + OBJC_IVAR____TtC21HearingModeSettingsUI27HearingAssistFlowController_headphoneDevice);
}

uint64_t sub_251233010()
{
  return *(void *)(v0 + OBJC_IVAR____TtC21HearingModeSettingsUI27HearingAssistFlowController_flowType);
}

id HearingAssistFlowController.__allocating_init(withDevice:serviceClient:flow:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v7 = (char *)objc_allocWithZone(v3);
  *(void *)&v7[OBJC_IVAR____TtC21HearingModeSettingsUI27HearingAssistFlowController____lazy_storage___initialViewController] = 0;
  *(void *)&v7[OBJC_IVAR____TtC21HearingModeSettingsUI27HearingAssistFlowController_headphoneDevice] = a1;
  *(void *)&v7[OBJC_IVAR____TtC21HearingModeSettingsUI27HearingAssistFlowController_flowType] = a3;
  *(void *)&v7[OBJC_IVAR____TtC21HearingModeSettingsUI27HearingAssistFlowController_hmsClient] = a2;
  v9.receiver = v7;
  v9.super_class = v3;
  return objc_msgSendSuper2(&v9, sel_init);
}

id HearingAssistFlowController.init(withDevice:serviceClient:flow:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)&v3[OBJC_IVAR____TtC21HearingModeSettingsUI27HearingAssistFlowController____lazy_storage___initialViewController] = 0;
  *(void *)&v3[OBJC_IVAR____TtC21HearingModeSettingsUI27HearingAssistFlowController_headphoneDevice] = a1;
  *(void *)&v3[OBJC_IVAR____TtC21HearingModeSettingsUI27HearingAssistFlowController_flowType] = a3;
  *(void *)&v3[OBJC_IVAR____TtC21HearingModeSettingsUI27HearingAssistFlowController_hmsClient] = a2;
  v5.receiver = v3;
  v5.super_class = (Class)type metadata accessor for HearingAssistFlowController();
  return objc_msgSendSuper2(&v5, sel_init);
}

uint64_t type metadata accessor for HearingAssistFlowController()
{
  return self;
}

id HearingAssistFlowController.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void HearingAssistFlowController.init()()
{
}

id HearingAssistFlowController.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for HearingAssistFlowController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t sub_2512332E0()
{
  unint64_t result = qword_269B2ADE8;
  if (!qword_269B2ADE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B2ADE8);
  }
  return result;
}

ValueMetadata *type metadata accessor for HearingFlowType()
{
  return &type metadata for HearingFlowType;
}

uint64_t method lookup function for HearingAssistFlowController(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for HearingAssistFlowController);
}

uint64_t dispatch thunk of HearingAssistFlowController.initialViewController.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x70))();
}

uint64_t dispatch thunk of HearingAssistFlowController.initialViewController.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x78))();
}

uint64_t dispatch thunk of HearingAssistFlowController.initialViewController.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x80))();
}

uint64_t dispatch thunk of HearingAssistFlowController.flowContainerController.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x88))();
}

uint64_t dispatch thunk of HearingAssistFlowController.__allocating_init(withDevice:serviceClient:flow:)()
{
  return (*(uint64_t (**)(void))(v0 + 144))();
}

uint64_t sub_251233440()
{
  uint64_t v0 = sub_25126C0E8();
  __swift_allocate_value_buffer(v0, qword_269B2D448);
  __swift_project_value_buffer(v0, (uint64_t)qword_269B2D448);
  return sub_25126C0D8();
}

uint64_t sub_2512334C0()
{
  if (qword_269B2B920 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_25126C0E8();
  return __swift_project_value_buffer(v0, (uint64_t)qword_269B2D448);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_25123355C@<X0>(uint64_t a1@<X8>)
{
  if (qword_269B2B920 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_25126C0E8();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_269B2D448);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);
  return v4(a1, v3, v2);
}

id HMHearingProtectionViewController.HearingProtectionSeporatorView.init(frame:)(double a1, double a2, double a3, double a4)
{
  v10.receiver = v4;
  v10.super_class = (Class)type metadata accessor for HMHearingProtectionViewController.HearingProtectionSeporatorView();
  return objc_msgSendSuper2(&v10, sel_initWithFrame_, a1, a2, a3, a4);
}

uint64_t type metadata accessor for HMHearingProtectionViewController.HearingProtectionSeporatorView()
{
  return self;
}

id HMHearingProtectionViewController.HearingProtectionSeporatorView.init(coder:)(void *a1)
{
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for HMHearingProtectionViewController.HearingProtectionSeporatorView();
  id v3 = objc_msgSendSuper2(&v5, sel_initWithCoder_, a1);

  return v3;
}

id HMHearingProtectionViewController.HearingProtectionSeporatorView.__deallocating_deinit()
{
  return sub_25123B6EC(type metadata accessor for HMHearingProtectionViewController.HearingProtectionSeporatorView);
}

BOOL HMHearingProtectionViewController.isCurrentNoiseModeOff(device:)()
{
  return sub_25126BD78() == 1;
}

Swift::Void __swiftcall HMHearingProtectionViewController.submitHPDeviceAnalytics(pid:lsrValue:)(Swift::Int pid, Swift::Bool lsrValue)
{
  id v4 = objc_msgSend(objc_allocWithZone((Class)sub_25126BC28()), sel_init);
  uint64_t v2 = (void *)sub_25126C5F8();
  sub_25126BBD8();

  id v3 = (void *)sub_25126C588();
  sub_25126BBD8();

  sub_25126BBE8();
}

uint64_t HMHearingProtectionViewController.setupListener(device:)@<X0>(uint64_t *a1@<X8>)
{
  v20 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B2ADF0);
  MEMORY[0x270FA5388]();
  uint64_t v2 = (char *)&v19 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B2ADF8);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388]();
  id v6 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B2AE00);
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388]();
  objc_super v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B2AE08);
  uint64_t v11 = *(void *)(v19 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v13 = (char *)&v19 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25126BD88();
  sub_25123E030(&qword_269B2AE10, &qword_269B2ADF8);
  sub_25126C318();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  sub_25123DFF4(0, &qword_269B2AE18);
  id v21 = (id)sub_25126C6D8();
  uint64_t v14 = sub_25126C698();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v2, 1, 1, v14);
  sub_25123E030(&qword_269B2AE20, &qword_269B2AE00);
  sub_25123B87C();
  sub_25126C2F8();
  sub_25123DF98((uint64_t)v2, &qword_269B2ADF0);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  swift_allocObject();
  swift_unknownObjectWeakInit();
  sub_25123E030(&qword_269B2AE28, &qword_269B2AE08);
  uint64_t v15 = v19;
  uint64_t v16 = sub_25126C338();
  swift_release();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v15);
  uint64_t result = sub_25126C238();
  double v18 = v20;
  v20[3] = result;
  *double v18 = v16;
  return result;
}

uint64_t HMHearingProtectionViewController.aboutSpecifiers.getter()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_25126C448();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2, v4);
  id v6 = &v23[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B2AE30);
  uint64_t v7 = sub_251252320();
  uint64_t v9 = sub_25125232C(0x65705374756F6261, 0xEF73726569666963, v7, v8);
  v24 = v0;
  uint64_t v10 = (*(uint64_t (**)(void (*)(void *), unsigned char *))(*(void *)v9 + 144))(sub_25123BA68, v23);
  swift_release();
  v26[0] = v0;
  sub_25126C3D8();
  uint64_t v11 = sub_25123DFF4(0, &qword_269B2AE38);
  uint64_t v12 = sub_2512547C8((uint64_t)v6);
  uint64_t v14 = v13;
  (*(void (**)(unsigned char *, uint64_t))(v3 + 8))(v6, v2);
  v25[3] = v11;
  v25[0] = v1;
  uint64_t v15 = swift_allocObject();
  swift_unknownObjectWeakInit();
  id v16 = v1;
  swift_retain();
  char v17 = sub_251243A48();
  v22.n128_u64[1] = (unint64_t)sub_25123BA70;
  v22.n128_u64[0] = 0;
  sub_251252268(0, 0, v12, v14, (uint64_t)v25, 0, 0, 13, (uint64_t)v26, 0, v17 & 1, 0, 0, v22, v15);
  swift_release();
  uint64_t v18 = (*(uint64_t (**)(void *))(*(void *)v10 + 168))(v26);
  swift_release();
  uint64_t v19 = sub_25123BACC((uint64_t)v26);
  uint64_t v20 = (*(uint64_t (**)(uint64_t))(*(void *)v18 + 184))(v19);
  swift_release();
  return v20;
}

void sub_251234214(void *a1, uint64_t a2)
{
  id v35 = a1;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B2AFB0);
  MEMORY[0x270FA5388](v3 - 8, v4);
  v36 = (char *)&v33 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_25126C428();
  MEMORY[0x270FA5388](v6 - 8, v7);
  uint64_t v8 = sub_25126C448();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8, v10);
  uint64_t v12 = (char *)&v33 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v39 = a2;
  sub_25126C3D8();
  sub_25123DFF4(0, &qword_269B2AE38);
  uint64_t v13 = sub_2512547C8((uint64_t)v12);
  uint64_t v15 = v14;
  id v16 = *(void (**)(char *, uint64_t))(v9 + 8);
  v16(v12, v8);
  uint64_t v34 = a2;
  uint64_t v39 = a2;
  sub_25126C418();
  sub_25126C408();
  sub_25126C3F8();
  sub_25126C408();
  sub_25126C438();
  uint64_t v17 = sub_2512547C8((uint64_t)v12);
  uint64_t v19 = v18;
  v16(v12, v8);
  uint64_t v39 = v17;
  uint64_t v40 = v19;
  uint64_t v37 = v13;
  uint64_t v38 = v15;
  uint64_t v20 = sub_25126BB68();
  uint64_t v21 = (uint64_t)v36;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v36, 1, 1, v20);
  sub_25123DF44();
  uint64_t v22 = sub_25126C798();
  uint64_t v24 = v23;
  LOBYTE(v16) = v25;
  sub_25123DF98(v21, &qword_269B2AFB0);
  swift_bridgeObjectRelease();
  if (v16)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_25123DFF4(0, &qword_269B2AFC0);
    ObjCClassFromMetadata = (objc_class *)swift_getObjCClassFromMetadata();
    v27 = NSStringFromClass(ObjCClassFromMetadata);
    if (!v27)
    {
      sub_25126C488();
      v27 = (NSString *)sub_25126C458();
      swift_bridgeObjectRelease();
    }
    id v28 = v35;
    objc_msgSend(v35, sel_setProperty_forKey_, v27, *MEMORY[0x263F600C0]);

    uint64_t v29 = (void *)sub_25126C458();
    objc_msgSend(v28, sel_setProperty_forKey_, v29, *MEMORY[0x263F600E8]);

    uint64_t v39 = v22;
    uint64_t v40 = v24;
    uint64_t v37 = v17;
    uint64_t v38 = v19;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269B2AFC8);
    sub_25123E030((unint64_t *)&qword_269B2AFD0, &qword_269B2AFC8);
    v41.location = sub_25126C738();
    v30 = NSStringFromRange(v41);
    if (!v30)
    {
      sub_25126C488();
      v30 = (NSString *)sub_25126C458();
      swift_bridgeObjectRelease();
    }
    objc_msgSend(v28, sel_setProperty_forKey_, v30, *MEMORY[0x263F600D0]);

    id v31 = objc_msgSend(self, sel_valueWithNonretainedObject_, v34);
    objc_msgSend(v28, sel_setProperty_forKey_, v31, *MEMORY[0x263F600E0]);

    v32 = (void *)sub_25126C458();
    objc_msgSend(v28, sel_setProperty_forKey_, v32, *MEMORY[0x263F600C8]);
  }
}

id sub_25123471C(void *a1, uint64_t a2, void (*a3)(void))
{
  id v4 = a1;
  a3();

  sub_25123DFF4(0, &qword_269B2AE98);
  uint64_t v5 = (void *)sub_25126C528();
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t HMHearingProtectionViewController.lineSeparatorSpecifiers.getter()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B2AE30);
  uint64_t v2 = sub_251252320();
  uint64_t v4 = sub_25125232C(0xD000000000000017, 0x8000000251272490, v2, v3);
  v13[3] = sub_25123DFF4(0, &qword_269B2AE38);
  v13[0] = v1;
  id v5 = v1;
  char v6 = sub_251243A48();
  __n128 v7 = sub_251252268(0, 0, 0, 0xE000000000000000, (uint64_t)v13, 0, 0, 6, (uint64_t)v14, 0, v6 & 1, 0, 0, (__n128)0, 0);
  uint64_t v8 = (*(uint64_t (**)(unsigned char *, __n128))(*(void *)v4 + 152))(v14, v7);
  swift_release();
  sub_25123BACC((uint64_t)v14);
  uint64_t v9 = (*(uint64_t (**)(uint64_t (*)(void *), void))(*(void *)v8 + 176))(sub_25123493C, 0);
  uint64_t v10 = swift_release();
  uint64_t v11 = (*(uint64_t (**)(uint64_t))(*(void *)v9 + 184))(v10);
  swift_release();
  return v11;
}

uint64_t sub_25123493C(void *a1)
{
  uint64_t v2 = (objc_class *)type metadata accessor for HMHearingProtectionViewController.HearingProtectionSeporatorView();
  id v3 = objc_msgSend(objc_allocWithZone(v2), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  objc_msgSend(v3, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  id v4 = objc_msgSend(v3, sel_heightAnchor);
  id v5 = objc_msgSend(v4, sel_constraintEqualToConstant_, 1.0);

  objc_msgSend(v5, sel_setActive_, 1);
  char v6 = self;
  id v7 = v3;
  id v8 = objc_msgSend(v6, sel_tertiaryLabelColor);
  objc_msgSend(v7, sel_setBackgroundColor_, v8);

  __swift_instantiateConcreteTypeFromMangledName(&qword_269B2AF58);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_25126E8B0;
  sub_25126BD08();
  *(void *)(inited + 32) = sub_25126BCD8();
  *(void *)(inited + 40) = v10;
  *(void *)(inited + 72) = v2;
  *(void *)(inited + 48) = v7;
  id v11 = v7;
  *(void *)(inited + 80) = sub_25126BCF8();
  *(void *)(inited + 88) = v12;
  *(void *)(inited + 120) = MEMORY[0x263F8D4F8];
  *(unsigned char *)(inited + 96) = 1;
  sub_251234B54(inited);
  uint64_t v13 = (void *)sub_25126C3B8();
  swift_bridgeObjectRelease();
  objc_msgSend(a1, sel_setUserInfo_, v13);

  __swift_instantiateConcreteTypeFromMangledName(&qword_269B2AF08);
  objc_msgSend(a1, sel_setProperty_forKey_, sub_25126C978(), *MEMORY[0x263F5FFE0]);

  return swift_unknownObjectRelease();
}

unint64_t sub_251234B54(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    id v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B2AF70);
  uint64_t v2 = sub_25126C908();
  id v3 = (void *)v2;
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
    sub_25123DA6C(v6, (uint64_t)&v15, &qword_269B2AF78);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_25123BF30(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    id v11 = (uint64_t *)(v3[6] + 16 * result);
    uint64_t *v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_25123DA50(&v17, (_OWORD *)(v3[7] + 32 * result));
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

unint64_t sub_251234C8C(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    id v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B2AF38);
  uint64_t v2 = sub_25126C908();
  id v3 = (void *)v2;
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
    sub_25123DA6C(v6, (uint64_t)&v13, &qword_269B2AF40);
    uint64_t v7 = v13;
    unint64_t result = sub_25123BFA8(v13);
    if (v9) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(void *)(v3[6] + 8 * result) = v7;
    unint64_t result = (unint64_t)sub_25123DA50(&v14, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v10 = v3[2];
    BOOL v11 = __OFADD__(v10, 1);
    uint64_t v12 = v10 + 1;
    if (v11) {
      goto LABEL_11;
    }
    v3[2] = v12;
    v6 += 40;
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

unint64_t sub_251234DBC(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B2AFD8);
  uint64_t v2 = (void *)sub_25126C908();
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
    unint64_t result = sub_25123BF30(v5, v6);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    BOOL v11 = (uint64_t *)(v2[6] + 16 * result);
    uint64_t *v11 = v5;
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

unint64_t sub_251234EE0(uint64_t a1, uint64_t *a2)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(a2);
  uint64_t v3 = (void *)sub_25126C908();
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  swift_retain();
  uint64_t v5 = (void **)(a1 + 48);
  while (1)
  {
    uint64_t v6 = (uint64_t)*(v5 - 2);
    uint64_t v7 = (uint64_t)*(v5 - 1);
    uint64_t v8 = *v5;
    swift_bridgeObjectRetain();
    id v9 = v8;
    unint64_t result = sub_25123BF30(v6, v7);
    if (v11) {
      break;
    }
    *(void *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v12 = (uint64_t *)(v3[6] + 16 * result);
    *uint64_t v12 = v6;
    v12[1] = v7;
    *(void *)(v3[7] + 8 * result) = v9;
    uint64_t v13 = v3[2];
    BOOL v14 = __OFADD__(v13, 1);
    uint64_t v15 = v13 + 1;
    if (v14) {
      goto LABEL_11;
    }
    v3[2] = v15;
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

unint64_t sub_251234FF8(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B2AF90);
  uint64_t v2 = (void *)sub_25126C908();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (id *)(a1 + 48);
  while (1)
  {
    uint64_t v5 = (uint64_t)*(v4 - 2);
    uint64_t v6 = (uint64_t)*(v4 - 1);
    id v7 = *v4;
    id v8 = *v4;
    swift_bridgeObjectRetain();
    unint64_t result = sub_25123BF30(v5, v6);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    char v11 = (uint64_t *)(v2[6] + 16 * result);
    uint64_t *v11 = v5;
    v11[1] = v6;
    *(void *)(v2[7] + 8 * result) = v7;
    uint64_t v12 = v2[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v4 += 3;
    v2[2] = v14;
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

Swift::Void __swiftcall HMHearingProtectionViewController.openSafetyInformation()()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_25126C448();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2, v4);
  uint64_t v6 = (char *)v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for HearingProtectionAboutViewController();
  id v7 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
  id v8 = self;
  uint64_t v21 = (uint64_t)v0;
  sub_25126C3D8();
  sub_25123DFF4(0, &qword_269B2AE38);
  sub_2512547C8((uint64_t)v6);
  (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  id v9 = (void *)sub_25126C458();
  swift_bridgeObjectRelease();
  id v10 = objc_msgSend(v8, sel_preferenceSpecifierNamed_target_set_get_detail_cell_edit_, v9, 0, 0, 0, 0, 13, 0);

  if (v10)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_269B2AE40);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_25126E8C0;
    *(void *)(inited + 32) = 0x7365726464617462;
    *(void *)(inited + 40) = 0xE900000000000073;
    id v12 = v10;
    id v13 = objc_msgSend(v1, sel_address);
    uint64_t v14 = sub_25126C488();
    uint64_t v16 = v15;

    uint64_t v21 = v14;
    uint64_t v22 = v16;
    v20[2] = 58;
    v20[3] = 0xE100000000000000;
    v20[0] = 45;
    v20[1] = 0xE100000000000000;
    sub_25123D01C();
    sub_25123D070();
    sub_25126C608();
    swift_bridgeObjectRelease();
    sub_251234DBC(inited);
    long long v17 = (void *)sub_25126C3B8();
    swift_bridgeObjectRelease();
    objc_msgSend(v12, sel_setUserInfo_, v17);
  }
  objc_msgSend(v7, sel_setSpecifier_, v10);
  id v18 = objc_msgSend(v1, sel_navigationController);
  if (v18)
  {
    uint64_t v19 = v18;
    objc_msgSend(v18, sel_pushViewController_animated_, v7, 1);
  }
}

BOOL static PlaceCardUseCase.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t PlaceCardUseCase.hash(into:)()
{
  return sub_25126C9D8();
}

uint64_t PlaceCardUseCase.hashValue.getter()
{
  return sub_25126C9E8();
}

BOOL sub_25123552C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_251235544()
{
  return sub_25126C9D8();
}

id sub_251235574(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = v3;
  if (a2)
  {
    uint64_t v6 = (void *)sub_25126C458();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v6 = 0;
  }
  id v7 = objc_msgSend(objc_allocWithZone(v4), sel_initWithNibName_bundle_, v6, a3);

  return v7;
}

id sub_2512355EC(uint64_t a1, uint64_t a2, void *a3)
{
  *(void *)&v3[OBJC_IVAR____TtC21HearingModeSettingsUI36HearingProtectionAboutViewController_headphoneDevice] = 0;
  *(void *)&v3[OBJC_IVAR____TtC21HearingModeSettingsUI36HearingProtectionAboutViewController____lazy_storage___totalAttenuation] = 0;
  *(void *)&v3[OBJC_IVAR____TtC21HearingModeSettingsUI36HearingProtectionAboutViewController____lazy_storage___passiveAttenuation] = 0;
  *(void *)&v3[OBJC_IVAR____TtC21HearingModeSettingsUI36HearingProtectionAboutViewController____lazy_storage___properFitPlaceCard] = 0;
  *(void *)&v3[OBJC_IVAR____TtC21HearingModeSettingsUI36HearingProtectionAboutViewController____lazy_storage___fitPlaceCard] = 0;
  *(void *)&v3[OBJC_IVAR____TtC21HearingModeSettingsUI36HearingProtectionAboutViewController____lazy_storage___maintenanceCarePlaceCard] = 0;
  *(void *)&v3[OBJC_IVAR____TtC21HearingModeSettingsUI36HearingProtectionAboutViewController____lazy_storage___deviceInformationSection] = 0;
  if (a2)
  {
    uint64_t v5 = (void *)sub_25126C458();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v5 = 0;
  }
  v8.receiver = v3;
  v8.super_class = (Class)type metadata accessor for HearingProtectionAboutViewController();
  id v6 = objc_msgSendSuper2(&v8, sel_initWithNibName_bundle_, v5, a3);

  return v6;
}

void sub_25123574C()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_25126C448();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2, v4);
  id v6 = (char *)v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v7 = (objc_class *)type metadata accessor for HearingProtectionAboutViewController();
  v13.receiver = v0;
  v13.super_class = v7;
  objc_msgSendSuper2(&v13, sel_viewDidLoad);
  id v8 = objc_msgSend(v0, sel_view);
  if (v8)
  {
    id v9 = v8;
    id v10 = objc_msgSend(self, sel_redColor);
    objc_msgSend(v9, sel_setBackgroundColor_, v10);

    v12[1] = v1;
    sub_25126C3D8();
    sub_2512547C8((uint64_t)v6);
    (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
    char v11 = (void *)sub_25126C458();
    swift_bridgeObjectRelease();
    objc_msgSend(v1, sel_setTitle_, v11);
  }
  else
  {
    __break(1u);
  }
}

void *sub_251235958()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR____TtC21HearingModeSettingsUI36HearingProtectionAboutViewController_headphoneDevice);
  swift_beginAccess();
  uint64_t v2 = *v1;
  id v3 = v2;
  return v2;
}

void sub_2512359A8(void *a1)
{
  id v3 = (void **)(v1 + OBJC_IVAR____TtC21HearingModeSettingsUI36HearingProtectionAboutViewController_headphoneDevice);
  swift_beginAccess();
  uint64_t v4 = *v3;
  char *v3 = a1;
}

uint64_t (*sub_2512359FC())()
{
  return j__swift_endAccess;
}

uint64_t sub_251235A58()
{
  return sub_251236ACC(&OBJC_IVAR____TtC21HearingModeSettingsUI36HearingProtectionAboutViewController____lazy_storage___totalAttenuation, (uint64_t (*)(uint64_t))sub_251235A78);
}

uint64_t sub_251235A78(void *a1)
{
  uint64_t v2 = sub_25126C448();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2, v4);
  id v6 = (char *)v33 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B2AE30);
  v39[0] = a1;
  sub_25126C3D8();
  uint64_t v7 = type metadata accessor for HearingProtectionAboutViewController();
  uint64_t v8 = sub_2512547C8((uint64_t)v6);
  uint64_t v10 = v9;
  (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  uint64_t v11 = sub_251252320();
  uint64_t v13 = sub_25125232C(v11, v12, v8, v10);
  v36[2] = a1;
  uint64_t v14 = (*(uint64_t (**)(void (*)(void *), void *))(*(void *)v13 + 144))(sub_25123DF24, v36);
  swift_release();
  uint64_t v38 = v7;
  v37[0] = a1;
  id v15 = a1;
  char v16 = sub_251243A48();
  __n128 v17 = sub_251252268(0, 0, 0, 0xE000000000000000, (uint64_t)v37, 0, 0, 6, (uint64_t)v39, 0, v16 & 1, 0, 0, (__n128)0, 0);
  uint64_t v18 = (*(uint64_t (**)(void *, __n128))(*(void *)v14 + 152))(v39, v17);
  swift_release();
  sub_25123BACC((uint64_t)v39);
  v35[2] = v15;
  uint64_t v19 = (*(uint64_t (**)(uint64_t (*)(void *), void *))(*(void *)v18 + 176))(sub_25123DF2C, v35);
  swift_release();
  uint64_t v38 = v7;
  v37[0] = v15;
  id v20 = v15;
  char v21 = sub_251243A48();
  __n128 v22 = sub_251252268(0, 0, 0, 0xE000000000000000, (uint64_t)v37, 0, 0, 6, (uint64_t)v39, 0, v21 & 1, 0, 0, (__n128)0, 0);
  uint64_t v23 = (*(uint64_t (**)(void *, __n128))(*(void *)v19 + 152))(v39, v22);
  swift_release();
  sub_25123BACC((uint64_t)v39);
  v34[2] = v20;
  uint64_t v24 = (*(uint64_t (**)(uint64_t (*)(void *), void *))(*(void *)v23 + 176))(sub_25123DF34, v34);
  swift_release();
  uint64_t v38 = v7;
  v37[0] = v20;
  id v25 = v20;
  char v26 = sub_251243A48();
  __n128 v27 = sub_251252268(0, 0, 0, 0xE000000000000000, (uint64_t)v37, 0, 0, 6, (uint64_t)v39, 0, v26 & 1, 0, 0, (__n128)0, 0);
  uint64_t v28 = (*(uint64_t (**)(void *, __n128))(*(void *)v24 + 152))(v39, v27);
  swift_release();
  sub_25123BACC((uint64_t)v39);
  v33[2] = v25;
  uint64_t v29 = (*(uint64_t (**)(uint64_t (*)(void *), void *))(*(void *)v28 + 176))(sub_25123DF3C, v33);
  uint64_t v30 = swift_release();
  uint64_t v31 = (*(uint64_t (**)(uint64_t))(*(void *)v29 + 184))(v30);
  swift_release();
  return v31;
}

void sub_251235F20(void *a1, uint64_t a2)
{
  id v35 = a1;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B2AFB0);
  MEMORY[0x270FA5388](v3 - 8, v4);
  v36 = (char *)&v33 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_25126C428();
  MEMORY[0x270FA5388](v6 - 8, v7);
  uint64_t v8 = sub_25126C448();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8, v10);
  uint64_t v12 = (char *)&v33 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v39 = a2;
  sub_25126C3D8();
  type metadata accessor for HearingProtectionAboutViewController();
  uint64_t v13 = sub_2512547C8((uint64_t)v12);
  uint64_t v15 = v14;
  char v16 = *(void (**)(char *, uint64_t))(v9 + 8);
  v16(v12, v8);
  uint64_t v34 = a2;
  uint64_t v39 = a2;
  sub_25126C418();
  sub_25126C408();
  sub_25126C3F8();
  sub_25126C408();
  sub_25126C438();
  uint64_t v17 = sub_2512547C8((uint64_t)v12);
  uint64_t v19 = v18;
  v16(v12, v8);
  uint64_t v39 = v17;
  uint64_t v40 = v19;
  uint64_t v37 = v13;
  uint64_t v38 = v15;
  uint64_t v20 = sub_25126BB68();
  uint64_t v21 = (uint64_t)v36;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v36, 1, 1, v20);
  sub_25123DF44();
  uint64_t v22 = sub_25126C798();
  uint64_t v24 = v23;
  LOBYTE(v16) = v25;
  sub_25123DF98(v21, &qword_269B2AFB0);
  swift_bridgeObjectRelease();
  if (v16)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_25123DFF4(0, &qword_269B2AFC0);
    ObjCClassFromMetadata = (objc_class *)swift_getObjCClassFromMetadata();
    __n128 v27 = NSStringFromClass(ObjCClassFromMetadata);
    if (!v27)
    {
      sub_25126C488();
      __n128 v27 = (NSString *)sub_25126C458();
      swift_bridgeObjectRelease();
    }
    id v28 = v35;
    objc_msgSend(v35, sel_setProperty_forKey_, v27, *MEMORY[0x263F600C0]);

    uint64_t v29 = (void *)sub_25126C458();
    objc_msgSend(v28, sel_setProperty_forKey_, v29, *MEMORY[0x263F600E8]);

    uint64_t v39 = v22;
    uint64_t v40 = v24;
    uint64_t v37 = v17;
    uint64_t v38 = v19;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269B2AFC8);
    sub_25123E030((unint64_t *)&qword_269B2AFD0, &qword_269B2AFC8);
    v41.location = sub_25126C738();
    uint64_t v30 = NSStringFromRange(v41);
    if (!v30)
    {
      sub_25126C488();
      uint64_t v30 = (NSString *)sub_25126C458();
      swift_bridgeObjectRelease();
    }
    objc_msgSend(v28, sel_setProperty_forKey_, v30, *MEMORY[0x263F600D0]);

    id v31 = objc_msgSend(self, sel_valueWithNonretainedObject_, v34);
    objc_msgSend(v28, sel_setProperty_forKey_, v31, *MEMORY[0x263F600E0]);

    v32 = (void *)sub_25126C458();
    objc_msgSend(v28, sel_setProperty_forKey_, v32, *MEMORY[0x263F600C8]);
  }
}

uint64_t sub_25123640C(void *a1, uint64_t a2)
{
  uint64_t v20 = a1;
  uint64_t v3 = sub_25126C448();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3, v5);
  uint64_t v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = a2;
  sub_25126C3D8();
  type metadata accessor for HearingProtectionAboutViewController();
  uint64_t v19 = sub_2512547C8((uint64_t)v7);
  uint64_t v9 = v8;
  uint64_t v10 = *(void (**)(char *, uint64_t))(v4 + 8);
  v10(v7, v3);
  uint64_t v21 = a2;
  sub_25126C3D8();
  uint64_t v11 = sub_2512547C8((uint64_t)v7);
  uint64_t v13 = v12;
  v10(v7, v3);
  uint64_t v21 = a2;
  sub_25126C3D8();
  uint64_t v14 = sub_2512547C8((uint64_t)v7);
  uint64_t v16 = v15;
  v10(v7, v3);
  sub_25123A328(v19, v9, v11, v13, v14, v16, v20);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25123661C(void *a1, uint64_t a2)
{
  uint64_t v20 = a1;
  uint64_t v3 = sub_25126C448();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3, v5);
  uint64_t v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = a2;
  sub_25126C3D8();
  type metadata accessor for HearingProtectionAboutViewController();
  uint64_t v19 = sub_2512547C8((uint64_t)v7);
  uint64_t v9 = v8;
  uint64_t v10 = *(void (**)(char *, uint64_t))(v4 + 8);
  v10(v7, v3);
  uint64_t v21 = a2;
  sub_25126C3D8();
  uint64_t v11 = sub_2512547C8((uint64_t)v7);
  uint64_t v13 = v12;
  v10(v7, v3);
  uint64_t v21 = a2;
  sub_25126C3D8();
  uint64_t v14 = sub_2512547C8((uint64_t)v7);
  uint64_t v16 = v15;
  v10(v7, v3);
  sub_25123A328(v19, v9, v11, v13, v14, v16, v20);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_251236830(void *a1, uint64_t a2)
{
  uint64_t v20 = a1;
  uint64_t v3 = sub_25126C448();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3, v5);
  uint64_t v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = a2;
  sub_25126C3D8();
  type metadata accessor for HearingProtectionAboutViewController();
  uint64_t v19 = sub_2512547C8((uint64_t)v7);
  uint64_t v9 = v8;
  uint64_t v10 = *(void (**)(char *, uint64_t))(v4 + 8);
  v10(v7, v3);
  uint64_t v21 = a2;
  sub_25126C3D8();
  uint64_t v11 = sub_2512547C8((uint64_t)v7);
  uint64_t v13 = v12;
  v10(v7, v3);
  uint64_t v21 = a2;
  sub_25126C3D8();
  uint64_t v14 = sub_2512547C8((uint64_t)v7);
  uint64_t v16 = v15;
  v10(v7, v3);
  sub_25123A328(v19, v9, v11, v13, v14, v16, v20);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_251236A40(uint64_t a1)
{
  *(void *)(v1
            + OBJC_IVAR____TtC21HearingModeSettingsUI36HearingProtectionAboutViewController____lazy_storage___totalAttenuation) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_251236A58(uint64_t *a1))(void *a1, uint64_t a2)
{
  a1[1] = v1;
  *a1 = sub_251235A58();
  return sub_251236AA0;
}

uint64_t sub_251236AA0(void *a1, uint64_t a2)
{
  return sub_251239114(a1, a2, &OBJC_IVAR____TtC21HearingModeSettingsUI36HearingProtectionAboutViewController____lazy_storage___totalAttenuation);
}

uint64_t sub_251236AAC()
{
  return sub_251236ACC(&OBJC_IVAR____TtC21HearingModeSettingsUI36HearingProtectionAboutViewController____lazy_storage___passiveAttenuation, (uint64_t (*)(uint64_t))sub_251236B34);
}

uint64_t sub_251236ACC(uint64_t *a1, uint64_t (*a2)(uint64_t))
{
  uint64_t v3 = *a1;
  uint64_t v4 = *(void *)(v2 + *a1);
  if (v4)
  {
    uint64_t v5 = v4;
  }
  else
  {
    uint64_t v5 = a2(v2);
    *(void *)(v2 + v3) = v5;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  return v5;
}

uint64_t sub_251236B34(void *a1)
{
  uint64_t v2 = sub_25126C448();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2, v4);
  uint64_t v6 = (char *)v38 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B2AE30);
  v45[0] = a1;
  sub_25126C3D8();
  uint64_t v7 = type metadata accessor for HearingProtectionAboutViewController();
  uint64_t v8 = sub_2512547C8((uint64_t)v6);
  uint64_t v10 = v9;
  (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  uint64_t v11 = sub_251252320();
  uint64_t v13 = sub_25125232C(v11, v12, v8, v10);
  v42[2] = a1;
  uint64_t v14 = (*(uint64_t (**)(void (*)(void *), void *))(*(void *)v13 + 144))(sub_25123DEA4, v42);
  swift_release();
  uint64_t v44 = v7;
  v43[0] = a1;
  id v15 = a1;
  char v16 = sub_251243A48();
  __n128 v17 = sub_251252268(0, 0, 0, 0xE000000000000000, (uint64_t)v43, 0, 0, 6, (uint64_t)v45, 0, v16 & 1, 0, 0, (__n128)0, 0);
  uint64_t v18 = (*(uint64_t (**)(void *, __n128))(*(void *)v14 + 152))(v45, v17);
  swift_release();
  sub_25123BACC((uint64_t)v45);
  v41[2] = v15;
  uint64_t v19 = (*(uint64_t (**)(uint64_t (*)(void *), void *))(*(void *)v18 + 176))(sub_25123DEAC, v41);
  swift_release();
  uint64_t v44 = v7;
  v43[0] = v15;
  id v20 = v15;
  char v21 = sub_251243A48();
  __n128 v22 = sub_251252268(0, 0, 0, 0xE000000000000000, (uint64_t)v43, 0, 0, 6, (uint64_t)v45, 0, v21 & 1, 0, 0, (__n128)0, 0);
  uint64_t v23 = (*(uint64_t (**)(void *, __n128))(*(void *)v19 + 152))(v45, v22);
  swift_release();
  sub_25123BACC((uint64_t)v45);
  v40[2] = v20;
  uint64_t v24 = (*(uint64_t (**)(void (*)(void *), void *))(*(void *)v23 + 176))(sub_25123DEB4, v40);
  swift_release();
  uint64_t v44 = v7;
  v43[0] = v20;
  id v25 = v20;
  char v26 = sub_251243A48();
  __n128 v27 = sub_251252268(0, 0, 0, 0xE000000000000000, (uint64_t)v43, 0, 0, 6, (uint64_t)v45, 0, v26 & 1, 0, 0, (__n128)0, 0);
  uint64_t v28 = (*(uint64_t (**)(void *, __n128))(*(void *)v24 + 152))(v45, v27);
  swift_release();
  sub_25123BACC((uint64_t)v45);
  v39[2] = v25;
  uint64_t v29 = (*(uint64_t (**)(void (*)(void *), void *))(*(void *)v28 + 176))(sub_25123DEE8, v39);
  swift_release();
  uint64_t v44 = v7;
  v43[0] = v25;
  id v30 = v25;
  char v31 = sub_251243A48();
  __n128 v32 = sub_251252268(0, 0, 0, 0xE000000000000000, (uint64_t)v43, 0, 0, 6, (uint64_t)v45, 0, v31 & 1, 0, 0, (__n128)0, 0);
  uint64_t v33 = (*(uint64_t (**)(void *, __n128))(*(void *)v29 + 152))(v45, v32);
  swift_release();
  sub_25123BACC((uint64_t)v45);
  v38[2] = v30;
  uint64_t v34 = (*(uint64_t (**)(void (*)(void *), void *))(*(void *)v33 + 176))(sub_25123DEF0, v38);
  uint64_t v35 = swift_release();
  uint64_t v36 = (*(uint64_t (**)(uint64_t))(*(void *)v34 + 184))(v35);
  swift_release();
  return v36;
}

void sub_2512370C8(void *a1, uint64_t a2)
{
  uint64_t v4 = sub_25126C448();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4, v6);
  uint64_t v8 = (char *)v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10[1] = a2;
  sub_25126C3D8();
  type metadata accessor for HearingProtectionAboutViewController();
  sub_2512547C8((uint64_t)v8);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  uint64_t v9 = (void *)sub_25126C458();
  swift_bridgeObjectRelease();
  objc_msgSend(a1, sel_setProperty_forKey_, v9, *MEMORY[0x263F600F8]);
}

uint64_t sub_251237218(void *a1, uint64_t a2)
{
  id v20 = a1;
  uint64_t v3 = sub_25126C448();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3, v5);
  uint64_t v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = a2;
  sub_25126C3D8();
  type metadata accessor for HearingProtectionAboutViewController();
  uint64_t v19 = sub_2512547C8((uint64_t)v7);
  uint64_t v9 = v8;
  uint64_t v10 = *(void (**)(char *, uint64_t))(v4 + 8);
  v10(v7, v3);
  uint64_t v21 = a2;
  sub_25126C3D8();
  uint64_t v11 = sub_2512547C8((uint64_t)v7);
  uint64_t v13 = v12;
  v10(v7, v3);
  uint64_t v21 = a2;
  sub_25126C3D8();
  uint64_t v14 = sub_2512547C8((uint64_t)v7);
  uint64_t v16 = v15;
  v10(v7, v3);
  sub_25123A328(v19, v9, v11, v13, v14, v16, v20);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

id sub_251237428()
{
  id v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F828E0]), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  objc_msgSend(v0, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  objc_msgSend(v0, sel_setNumberOfLines_, 0);
  objc_msgSend(v0, sel_setLineBreakMode_, 0);
  LODWORD(v1) = 1148846080;
  objc_msgSend(v0, sel_setContentCompressionResistancePriority_forAxis_, 1, v1);
  return v0;
}

uint64_t sub_2512374C8()
{
  return 111;
}

void sub_2512374D0(void *a1, void *a2)
{
  id v27 = a1;
  uint64_t v3 = sub_25126C448();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3, v5);
  uint64_t v7 = (char *)&v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F828E0]), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  objc_msgSend(v8, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  objc_msgSend(v8, sel_setNumberOfLines_, 0);
  objc_msgSend(v8, sel_setLineBreakMode_, 0);
  LODWORD(v9) = 1148846080;
  objc_msgSend(v8, sel_setContentCompressionResistancePriority_forAxis_, 1, v9);
  uint64_t v28 = a2;
  sub_25126C3D8();
  type metadata accessor for HearingProtectionAboutViewController();
  sub_2512547C8((uint64_t)v7);
  uint64_t v10 = *(void (**)(char *, uint64_t))(v4 + 8);
  v10(v7, v3);
  uint64_t v11 = (void *)sub_25126C458();
  swift_bridgeObjectRelease();
  objc_msgSend(v8, sel_setText_, v11);

  objc_msgSend(v8, sel_setTag_, 111);
  id v12 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F828E0]), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  objc_msgSend(v12, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  objc_msgSend(v12, sel_setNumberOfLines_, 0);
  objc_msgSend(v12, sel_setLineBreakMode_, 0);
  LODWORD(v13) = 1148846080;
  objc_msgSend(v12, sel_setContentCompressionResistancePriority_forAxis_, 1, v13);
  uint64_t v28 = a2;
  sub_25126C3D8();
  sub_2512547C8((uint64_t)v7);
  v10(v7, v3);
  uint64_t v14 = (void *)sub_25126C458();
  swift_bridgeObjectRelease();
  objc_msgSend(v12, sel_setText_, v14);

  objc_msgSend(v12, sel_setTextAlignment_, 2);
  objc_msgSend(v12, sel_setTag_, 111);
  uint64_t v15 = *(uint64_t (**)(id))((*MEMORY[0x263F8EED0] & *a2) + 0x150);
  uint64_t v16 = (void *)v15(v8);
  __n128 v17 = (void *)v15(v12);
  id v18 = objc_allocWithZone((Class)type metadata accessor for HearingProtectionAboutSplitView());
  uint64_t v19 = sub_25123ACBC(1, v16, v17);
  objc_msgSend(v19, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B2AF00);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_25126E8C0;
  uint64_t v21 = sub_25126BD08();
  *(void *)(inited + 32) = sub_25126BCD8();
  *(void *)(inited + 40) = v22;
  *(void *)(inited + 48) = v19;
  uint64_t v23 = v19;
  sub_251234EE0(inited, &qword_269B2AF10);
  uint64_t v24 = (void *)sub_25126C3B8();
  swift_bridgeObjectRelease();
  id v25 = v27;
  objc_msgSend(v27, sel_setUserInfo_, v24);

  uint64_t v28 = (void *)v21;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B2AF08);
  objc_msgSend(v25, sel_setProperty_forKey_, sub_25126C978(), *MEMORY[0x263F5FFE0]);
  swift_unknownObjectRelease();
}

unsigned char *sub_251237988(char a1, void *a2, void *a3)
{
  id v7 = objc_allocWithZone(v3);
  return sub_25123ACBC(a1, a2, a3);
}

void sub_2512379D4(void *a1, uint64_t a2)
{
  uint64_t v4 = sub_25126C448();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4, v6);
  id v8 = &v17[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  id v9 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F828E0]), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  objc_msgSend(v9, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  objc_msgSend(v9, sel_setNumberOfLines_, 0);
  objc_msgSend(v9, sel_setLineBreakMode_, 0);
  LODWORD(v10) = 1148846080;
  objc_msgSend(v9, sel_setContentCompressionResistancePriority_forAxis_, 1, v10);
  uint64_t v18 = a2;
  sub_25126C3D8();
  type metadata accessor for HearingProtectionAboutViewController();
  sub_2512547C8((uint64_t)v8);
  (*(void (**)(unsigned char *, uint64_t))(v5 + 8))(v8, v4);
  uint64_t v11 = (void *)sub_25126C458();
  swift_bridgeObjectRelease();
  objc_msgSend(v9, sel_setText_, v11);

  objc_msgSend(v9, sel_setTag_, 111);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B2AF98);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_25126E8C0;
  uint64_t v13 = sub_25126BD08();
  *(void *)(inited + 32) = sub_25126BCD8();
  *(void *)(inited + 40) = v14;
  *(void *)(inited + 48) = v9;
  id v15 = v9;
  sub_251234EE0(inited, &qword_269B2AFA8);
  sub_25123DFF4(0, &qword_269B2AFA0);
  uint64_t v16 = (void *)sub_25126C3B8();
  swift_bridgeObjectRelease();
  objc_msgSend(a1, sel_setUserInfo_, v16);

  uint64_t v18 = v13;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B2AF08);
  objc_msgSend(a1, sel_setProperty_forKey_, sub_25126C978(), *MEMORY[0x263F5FFE0]);
  swift_unknownObjectRelease();
}

uint64_t sub_251237CB4(uint64_t a1)
{
  *(void *)(v1
            + OBJC_IVAR____TtC21HearingModeSettingsUI36HearingProtectionAboutViewController____lazy_storage___passiveAttenuation) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_251237CCC(uint64_t *a1))(void *a1, uint64_t a2)
{
  a1[1] = v1;
  *a1 = sub_251236AAC();
  return sub_251237D14;
}

uint64_t sub_251237D14(void *a1, uint64_t a2)
{
  return sub_251239114(a1, a2, &OBJC_IVAR____TtC21HearingModeSettingsUI36HearingProtectionAboutViewController____lazy_storage___passiveAttenuation);
}

uint64_t sub_251237D20()
{
  return sub_251237D54(&OBJC_IVAR____TtC21HearingModeSettingsUI36HearingProtectionAboutViewController____lazy_storage___properFitPlaceCard, (uint64_t)sub_25123DCDC, (unint64_t)sub_251237DB8);
}

uint64_t sub_251237D54(uint64_t *a1, uint64_t a2, unint64_t a3)
{
  uint64_t v4 = *a1;
  uint64_t v5 = *(void *)&v3[*a1];
  if (v5)
  {
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v6 = sub_251237E5C(v3, a2, a3);
    *(void *)&v3[v4] = v6;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  return v6;
}

uint64_t sub_251237DBC(uint64_t a1)
{
  *(void *)(v1
            + OBJC_IVAR____TtC21HearingModeSettingsUI36HearingProtectionAboutViewController____lazy_storage___properFitPlaceCard) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_251237DD4(uint64_t *a1))(void *a1, uint64_t a2)
{
  a1[1] = v1;
  *a1 = sub_251237D20();
  return sub_251237E1C;
}

uint64_t sub_251237E1C(void *a1, uint64_t a2)
{
  return sub_251239114(a1, a2, &OBJC_IVAR____TtC21HearingModeSettingsUI36HearingProtectionAboutViewController____lazy_storage___properFitPlaceCard);
}

uint64_t sub_251237E28()
{
  return sub_251237D54(&OBJC_IVAR____TtC21HearingModeSettingsUI36HearingProtectionAboutViewController____lazy_storage___fitPlaceCard, (uint64_t)sub_25123DAD0, (unint64_t)sub_251237DB8);
}

uint64_t sub_251237E5C(void *a1, uint64_t a2, unint64_t a3)
{
  unint64_t v33 = a3;
  uint64_t v5 = sub_25126C448();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5, v7);
  id v9 = (char *)&v32 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v38[0] = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B2AE30);
  sub_25126C3D8();
  uint64_t v10 = type metadata accessor for HearingProtectionAboutViewController();
  uint64_t v11 = sub_2512547C8((uint64_t)v9);
  uint64_t v13 = v12;
  uint64_t v14 = *(void (**)(char *, uint64_t))(v6 + 8);
  v14(v9, v5);
  uint64_t v15 = sub_251252320();
  uint64_t v17 = sub_25125232C(v15, v16, v11, v13);
  *((void *)&v37 + 1) = v10;
  *(void *)&long long v36 = a1;
  id v18 = a1;
  char v19 = sub_251243A48();
  __n128 v20 = sub_251252268(0, 0, 0, 0xE000000000000000, (uint64_t)&v36, 0, 0, 6, (uint64_t)v38, 0, v19 & 1, 0, 0, (__n128)0, 0);
  uint64_t v21 = (*(uint64_t (**)(void *, __n128))(*(void *)v17 + 152))(v38, v20);
  swift_release();
  sub_25123BACC((uint64_t)v38);
  id v35 = v18;
  uint64_t v22 = (*(uint64_t (**)(uint64_t, unsigned char *))(*(void *)v21 + 176))(a2, v34);
  swift_release();
  v38[0] = v18;
  sub_25126C3D8();
  uint64_t v23 = sub_2512547C8((uint64_t)v9);
  uint64_t v25 = v24;
  v14(v9, v5);
  long long v37 = 0u;
  long long v36 = 0u;
  swift_unknownObjectWeakInit();
  char v26 = sub_251243A48();
  v31.n128_u64[0] = 0;
  v31.n128_u64[1] = v33;
  sub_251252268(0, 0, v23, v25, (uint64_t)&v36, 0, 0, 13, (uint64_t)v38, 0, v26 & 1, 0, 0, v31, 0);
  swift_unknownObjectWeakDestroy();
  uint64_t v27 = (*(uint64_t (**)(void *))(*(void *)v22 + 168))(v38);
  swift_release();
  uint64_t v28 = sub_25123BACC((uint64_t)v38);
  uint64_t v29 = (*(uint64_t (**)(uint64_t))(*(void *)v27 + 184))(v28);
  swift_release();
  return v29;
}

uint64_t sub_251238200()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B2AF28);
  MEMORY[0x270FA5388](v0 - 8, v1);
  uint64_t v3 = (char *)&v17 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_25126BB28();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4, v6);
  uint64_t v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25126BB18();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4) == 1) {
    return sub_25123DF98((uint64_t)v3, &qword_269B2AF28);
  }
  (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v8, v3, v4);
  uint64_t v10 = self;
  id v11 = objc_msgSend(v10, sel_sharedApplication);
  uint64_t v12 = (void *)sub_25126BB08();
  unsigned int v13 = objc_msgSend(v11, sel_canOpenURL_, v12);

  if (v13)
  {
    id v14 = objc_msgSend(v10, sel_sharedApplication);
    uint64_t v15 = (void *)sub_25126BB08();
    sub_251234C8C(MEMORY[0x263F8EE78]);
    type metadata accessor for OpenExternalURLOptionsKey(0);
    sub_25123DA0C(&qword_269B2AF30);
    uint64_t v16 = (void *)sub_25126C3B8();
    swift_bridgeObjectRelease();
    objc_msgSend(v14, sel_openURL_options_completionHandler_, v15, v16, 0);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v8, v4);
}

uint64_t sub_25123848C(uint64_t a1)
{
  *(void *)(v1
            + OBJC_IVAR____TtC21HearingModeSettingsUI36HearingProtectionAboutViewController____lazy_storage___fitPlaceCard) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_2512384A4(uint64_t *a1))(void *a1, uint64_t a2)
{
  a1[1] = v1;
  *a1 = sub_251237E28();
  return sub_2512384EC;
}

uint64_t sub_2512384EC(void *a1, uint64_t a2)
{
  return sub_251239114(a1, a2, &OBJC_IVAR____TtC21HearingModeSettingsUI36HearingProtectionAboutViewController____lazy_storage___fitPlaceCard);
}

uint64_t sub_2512384F8()
{
  return sub_251236ACC(&OBJC_IVAR____TtC21HearingModeSettingsUI36HearingProtectionAboutViewController____lazy_storage___maintenanceCarePlaceCard, (uint64_t (*)(uint64_t))sub_251238518);
}

uint64_t sub_251238518(void *a1)
{
  uint64_t v2 = sub_25126C448();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2, v4);
  uint64_t v6 = &v29[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B2AE30);
  v33[0] = a1;
  sub_25126C3D8();
  uint64_t v7 = type metadata accessor for HearingProtectionAboutViewController();
  uint64_t v8 = sub_2512547C8((uint64_t)v6);
  uint64_t v10 = v9;
  id v11 = *(void (**)(unsigned char *, uint64_t))(v3 + 8);
  v11(v6, v2);
  uint64_t v12 = sub_251252320();
  uint64_t v14 = sub_25125232C(v12, v13, v8, v10);
  *((void *)&v32 + 1) = v7;
  *(void *)&long long v31 = a1;
  id v15 = a1;
  char v16 = sub_251243A48();
  __n128 v17 = sub_251252268(0, 0, 0, 0xE000000000000000, (uint64_t)&v31, 0, 0, 6, (uint64_t)v33, 0, v16 & 1, 0, 0, (__n128)0, 0);
  uint64_t v18 = (*(uint64_t (**)(void *, __n128))(*(void *)v14 + 152))(v33, v17);
  swift_release();
  sub_25123BACC((uint64_t)v33);
  id v30 = v15;
  uint64_t v19 = (*(uint64_t (**)(void (*)(void *), unsigned char *))(*(void *)v18 + 176))(sub_25123DA64, v29);
  swift_release();
  v33[0] = v15;
  sub_25126C3D8();
  uint64_t v20 = sub_2512547C8((uint64_t)v6);
  uint64_t v22 = v21;
  v11(v6, v2);
  long long v32 = 0u;
  long long v31 = 0u;
  swift_unknownObjectWeakInit();
  char v23 = sub_251243A48();
  v28.n128_u64[1] = (unint64_t)sub_2512388C4;
  v28.n128_u64[0] = 0;
  sub_251252268(0, 0, v20, v22, (uint64_t)&v31, 0, 0, 13, (uint64_t)v33, 0, v23 & 1, 0, 0, v28, 0);
  swift_unknownObjectWeakDestroy();
  uint64_t v24 = (*(uint64_t (**)(void *))(*(void *)v19 + 168))(v33);
  swift_release();
  uint64_t v25 = sub_25123BACC((uint64_t)v33);
  uint64_t v26 = (*(uint64_t (**)(uint64_t))(*(void *)v24 + 184))(v25);
  swift_release();
  return v26;
}

uint64_t sub_2512388C4()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B2AF28);
  MEMORY[0x270FA5388](v0 - 8, v1);
  uint64_t v3 = (char *)&v17 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_25126BB28();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4, v6);
  uint64_t v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25126BB18();
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4);
  if (result == 1)
  {
    __break(1u);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v8, v3, v4);
    uint64_t v10 = self;
    id v11 = objc_msgSend(v10, sel_sharedApplication);
    uint64_t v12 = (void *)sub_25126BB08();
    unsigned int v13 = objc_msgSend(v11, sel_canOpenURL_, v12);

    if (v13)
    {
      id v14 = objc_msgSend(v10, sel_sharedApplication);
      id v15 = (void *)sub_25126BB08();
      sub_251234C8C(MEMORY[0x263F8EE78]);
      type metadata accessor for OpenExternalURLOptionsKey(0);
      sub_25123DA0C(&qword_269B2AF30);
      char v16 = (void *)sub_25126C3B8();
      swift_bridgeObjectRelease();
      objc_msgSend(v14, sel_openURL_options_completionHandler_, v15, v16, 0);
    }
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  }
  return result;
}

uint64_t sub_251238B40(uint64_t a1)
{
  *(void *)(v1
            + OBJC_IVAR____TtC21HearingModeSettingsUI36HearingProtectionAboutViewController____lazy_storage___maintenanceCarePlaceCard) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_251238B58(uint64_t *a1))(void *a1, uint64_t a2)
{
  a1[1] = v1;
  *a1 = sub_2512384F8();
  return sub_251238BA0;
}

uint64_t sub_251238BA0(void *a1, uint64_t a2)
{
  return sub_251239114(a1, a2, &OBJC_IVAR____TtC21HearingModeSettingsUI36HearingProtectionAboutViewController____lazy_storage___maintenanceCarePlaceCard);
}

uint64_t sub_251238BAC()
{
  return sub_251236ACC(&OBJC_IVAR____TtC21HearingModeSettingsUI36HearingProtectionAboutViewController____lazy_storage___deviceInformationSection, (uint64_t (*)(uint64_t))sub_251238BCC);
}

uint64_t sub_251238BCC(void *a1)
{
  uint64_t v2 = sub_25126C448();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2, v4);
  uint64_t v6 = (char *)v39 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B2AE30);
  v43[0] = a1;
  sub_25126C3D8();
  uint64_t v7 = type metadata accessor for HearingProtectionAboutViewController();
  uint64_t v8 = sub_2512547C8((uint64_t)v6);
  uint64_t v10 = v9;
  id v11 = *(void (**)(char *, uint64_t))(v3 + 8);
  uint64_t v40 = v2;
  v11(v6, v2);
  v39[1] = v3 + 8;
  uint64_t v12 = sub_251252320();
  uint64_t v14 = sub_25125232C(v12, v13, v8, v10);
  v43[0] = a1;
  sub_25126C3D8();
  uint64_t v15 = sub_2512547C8((uint64_t)v6);
  uint64_t v17 = v16;
  v11(v6, v2);
  uint64_t v42 = v7;
  v41[0] = a1;
  id v18 = a1;
  char v19 = sub_251243A48();
  __n128 v20 = sub_251252268(0, 0, v15, v17, (uint64_t)v41, (uint64_t)sel_getFeatureVersion, 0, 4, (uint64_t)v43, 0, v19 & 1, 0, 0, (__n128)0, 0);
  uint64_t v21 = (*(uint64_t (**)(void *, __n128))(*(void *)v14 + 152))(v43, v20);
  swift_release();
  sub_25123BACC((uint64_t)v43);
  v43[0] = v18;
  sub_25126C3D8();
  uint64_t v22 = sub_2512547C8((uint64_t)v6);
  uint64_t v24 = v23;
  v11(v6, v40);
  uint64_t v42 = v7;
  v41[0] = v18;
  id v25 = v18;
  char v26 = sub_251243A48();
  __n128 v27 = sub_251252268(0, 0, v22, v24, (uint64_t)v41, (uint64_t)sel_getUpdateVersion, 0, 4, (uint64_t)v43, 0, v26 & 1, 0, 0, (__n128)0, 0);
  uint64_t v28 = (*(uint64_t (**)(void *, __n128))(*(void *)v21 + 152))(v43, v27);
  swift_release();
  sub_25123BACC((uint64_t)v43);
  v43[0] = v25;
  sub_25126C3D8();
  uint64_t v29 = sub_2512547C8((uint64_t)v6);
  uint64_t v31 = v30;
  v11(v6, v40);
  uint64_t v42 = v7;
  v41[0] = v25;
  id v32 = v25;
  char v33 = sub_251243A48();
  __n128 v34 = sub_251252268(0, 0, v29, v31, (uint64_t)v41, (uint64_t)sel_getYearOfRelease, 0, 4, (uint64_t)v43, 0, v33 & 1, 0, 0, (__n128)0, 0);
  uint64_t v35 = (*(uint64_t (**)(void *, __n128))(*(void *)v28 + 152))(v43, v34);
  swift_release();
  uint64_t v36 = sub_25123BACC((uint64_t)v43);
  uint64_t v37 = (*(uint64_t (**)(uint64_t))(*(void *)v35 + 184))(v36);
  swift_release();
  return v37;
}

uint64_t sub_2512390A8(uint64_t a1)
{
  *(void *)(v1
            + OBJC_IVAR____TtC21HearingModeSettingsUI36HearingProtectionAboutViewController____lazy_storage___deviceInformationSection) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_2512390C0(uint64_t *a1))(void *a1, uint64_t a2)
{
  a1[1] = v1;
  *a1 = sub_251238BAC();
  return sub_251239108;
}

uint64_t sub_251239108(void *a1, uint64_t a2)
{
  return sub_251239114(a1, a2, &OBJC_IVAR____TtC21HearingModeSettingsUI36HearingProtectionAboutViewController____lazy_storage___deviceInformationSection);
}

uint64_t sub_251239114(void *a1, uint64_t a2, void *a3)
{
  *(void *)(a1[1] + *a3) = *a1;
  return swift_bridgeObjectRelease();
}

uint64_t sub_251239128()
{
  return 49;
}

uint64_t sub_251239164()
{
  uint64_t v1 = v0;
  uint64_t v2 = (void *)MEMORY[0x263F8EED0];
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x88))();
  if (result)
  {
    uint64_t v4 = (void *)result;
    uint64_t v5 = (void *)sub_25126BD58();

    id v6 = objc_msgSend(v5, sel_firmwareVersion);
    if (v6)
    {
      sub_25126C488();
    }
    uint64_t v7 = (*(uint64_t (**)(void))((*v2 & *v1) + 0x130))();
    swift_bridgeObjectRetain();
    sub_25126C4D8();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_25126C4D8();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return v7;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_251239328()
{
  return 875704370;
}

id sub_25123936C()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_25126C0E8();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2, v4);
  id v6 = (char *)v37 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  id result = objc_msgSend(v0, sel_specifier);
  if (result)
  {
    uint64_t v8 = result;
    id v9 = objc_msgSend(result, sel_userInfo);

    if (v9)
    {
      sub_25126C7A8();
      swift_unknownObjectRelease();
    }
    else
    {
      long long v40 = 0u;
      long long v41 = 0u;
    }
    sub_25123D3B8((uint64_t)&v40, (uint64_t)v42);
    if (v43)
    {
      sub_25123DFF4(0, &qword_269B2AEA0);
      if ((swift_dynamicCast() & 1) == 0) {
        goto LABEL_17;
      }
      id v10 = v38;
      *(void *)&long long v40 = 0x7365726464617462;
      *((void *)&v40 + 1) = 0xE900000000000073;
      id v11 = objc_msgSend(v38, sel___swift_objectForKeyedSubscript_, sub_25126C978());
      swift_unknownObjectRelease();
      if (v11)
      {
        sub_25126C7A8();
        swift_unknownObjectRelease();
      }
      else
      {
        long long v40 = 0u;
        long long v41 = 0u;
      }
      sub_25123D3B8((uint64_t)&v40, (uint64_t)v42);
      if (v43)
      {
        if (swift_dynamicCast())
        {
          uint64_t v13 = (uint64_t)v38;
          uint64_t v12 = v39;
          sub_25126BDF8();
          uint64_t v14 = (void *)sub_25126BDD8();
          uint64_t v15 = sub_25126BDC8();

          if (*(void *)(v15 + 16))
          {
            unint64_t v16 = sub_25123BF30(v13, v12);
            if (v17)
            {
              id v18 = *(id *)(*(void *)(v15 + 56) + 8 * v16);
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              char v19 = (void *)MEMORY[0x263F8EED0];
              __n128 v20 = *(uint64_t (**)(id))((*MEMORY[0x263F8EED0] & *v1) + 0x90);
              v37[0] = v18;
              uint64_t v21 = v20(v18);
              v37[5] = (id)(*(uint64_t (**)(uint64_t))((*v19 & *v1) + 0xA0))(v21);
              v37[6] = (id)(*(uint64_t (**)(void))((*v19 & *v1) + 0xB8))();
              v37[7] = (id)(*(uint64_t (**)(void))((*v19 & *v1) + 0xE8))();
              v37[8] = (id)(*(uint64_t (**)(void))((*v19 & *v1) + 0x100))();
              v37[9] = (id)(*(uint64_t (**)(void))((*v19 & *v1) + 0x118))();
              v42[0] = MEMORY[0x263F8EE78];
              unint64_t v22 = swift_bridgeObjectRetain();
              sub_25123C298(v22, (uint64_t (*)(uint64_t, void, unint64_t))sub_25123C5FC);
              unint64_t v23 = swift_bridgeObjectRetain();
              sub_25123C298(v23, (uint64_t (*)(uint64_t, void, unint64_t))sub_25123C5FC);
              unint64_t v24 = swift_bridgeObjectRetain();
              sub_25123C298(v24, (uint64_t (*)(uint64_t, void, unint64_t))sub_25123C5FC);
              unint64_t v25 = swift_bridgeObjectRetain();
              sub_25123C298(v25, (uint64_t (*)(uint64_t, void, unint64_t))sub_25123C5FC);
              unint64_t v26 = swift_bridgeObjectRetain();
              sub_25123C298(v26, (uint64_t (*)(uint64_t, void, unint64_t))sub_25123C5FC);
              __swift_instantiateConcreteTypeFromMangledName(&qword_269B2AEA8);
              swift_arrayDestroy();
              unint64_t v27 = v42[0];
              sub_25123DFF4(0, &qword_269B2AE98);
              uint64_t v28 = (void *)sub_25126C528();
              uint64_t v29 = (void *)sub_25126C458();
              objc_msgSend(v1, sel_setValue_forKey_, v28, v29);

              uint64_t v30 = sub_2512399F4(v27);
              swift_bridgeObjectRelease();
              return (id)v30;
            }
          }

          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
        }
        else
        {
        }
LABEL_17:
        sub_25123DFF4(0, &qword_269B2AE98);
        uint64_t v31 = (void *)sub_25126C528();
        id v32 = (void *)sub_25126C458();
        objc_msgSend(v1, sel_setValue_forKey_, v31, v32);

        uint64_t v33 = sub_25124E850();
        (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v6, v33, v2);
        __n128 v34 = sub_25126C0C8();
        os_log_type_t v35 = sub_25126C638();
        if (os_log_type_enabled(v34, v35))
        {
          uint64_t v36 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v36 = 0;
          _os_log_impl(&dword_251222000, v34, v35, "HearingProtectionAboutViewController dependencies not meet", v36, 2u);
          MEMORY[0x253399FB0](v36, -1, -1);
        }

        (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
        return (id)sub_2512399F4(MEMORY[0x263F8EE78]);
      }
    }
    sub_25123DF98((uint64_t)v42, &qword_269B2AE90);
    goto LABEL_17;
  }
  __break(1u);
  return result;
}

uint64_t sub_2512399F4(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_25126C8C8();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  uint64_t v3 = MEMORY[0x263F8EE78];
  if (!v2) {
    return v3;
  }
  uint64_t v13 = MEMORY[0x263F8EE78];
  uint64_t result = sub_25123C46C(0, v2 & ~(v2 >> 63), 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    if ((a1 & 0xC000000000000001) != 0)
    {
      for (uint64_t i = 0; i != v2; ++i)
      {
        MEMORY[0x253399500](i, a1);
        sub_25123DFF4(0, &qword_269B2AE98);
        swift_dynamicCast();
        uint64_t v3 = v13;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_25123C46C(0, *(void *)(v3 + 16) + 1, 1);
          uint64_t v3 = v13;
        }
        unint64_t v7 = *(void *)(v3 + 16);
        unint64_t v6 = *(void *)(v3 + 24);
        if (v7 >= v6 >> 1)
        {
          sub_25123C46C(v6 > 1, v7 + 1, 1);
          uint64_t v3 = v13;
        }
        *(void *)(v3 + 16) = v7 + 1;
        sub_25123DA50(v12, (_OWORD *)(v3 + 32 * v7 + 32));
      }
    }
    else
    {
      uint64_t v8 = (id *)(a1 + 32);
      sub_25123DFF4(0, &qword_269B2AE98);
      do
      {
        id v9 = *v8;
        swift_dynamicCast();
        uint64_t v3 = v13;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_25123C46C(0, *(void *)(v3 + 16) + 1, 1);
          uint64_t v3 = v13;
        }
        unint64_t v11 = *(void *)(v3 + 16);
        unint64_t v10 = *(void *)(v3 + 24);
        if (v11 >= v10 >> 1)
        {
          sub_25123C46C(v10 > 1, v11 + 1, 1);
          uint64_t v3 = v13;
        }
        *(void *)(v3 + 16) = v11 + 1;
        sub_25123DA50(v12, (_OWORD *)(v3 + 32 * v11 + 32));
        ++v8;
        --v2;
      }
      while (v2);
    }
    return v3;
  }
  __break(1u);
  return result;
}

id sub_251239CC8(void *a1, void *a2)
{
  id v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82E00]), sel_init);
  objc_msgSend(v4, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  objc_msgSend(v4, sel_addSubview_, a1);
  objc_msgSend(v4, sel_addSubview_, a2);
  id v29 = self;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_269B2B040);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_25126E8D0;
  id v6 = objc_msgSend(v4, sel_leadingAnchor);
  id v7 = objc_msgSend(a1, byte_26536423A);
  id v8 = objc_msgSend(v6, sel_constraintEqualToAnchor_, v7);

  *(void *)(v5 + 32) = v8;
  id v9 = objc_msgSend(v4, sel_trailingAnchor);
  id v10 = objc_msgSend(a1, sel_trailingAnchor);
  id v11 = objc_msgSend(v9, sel_constraintEqualToAnchor_, v10);

  *(void *)(v5 + 40) = v11;
  id v12 = objc_msgSend(v4, sel_topAnchor);
  id v13 = objc_msgSend(a1, sel_topAnchor);
  id v14 = objc_msgSend(v12, sel_constraintEqualToAnchor_, v13);

  *(void *)(v5 + 48) = v14;
  id v15 = objc_msgSend(a1, sel_bottomAnchor);
  id v16 = objc_msgSend(a2, sel_topAnchor);
  id v17 = objc_msgSend(v15, sel_constraintEqualToAnchor_constant_, v16, -4.0);

  *(void *)(v5 + 56) = v17;
  id v18 = objc_msgSend(v4, sel_leadingAnchor);
  id v19 = objc_msgSend(a2, sel_leadingAnchor);
  id v20 = objc_msgSend(v18, sel_constraintEqualToAnchor_, v19);

  *(void *)(v5 + 64) = v20;
  id v21 = objc_msgSend(v4, sel_trailingAnchor);
  id v22 = objc_msgSend(a2, sel_trailingAnchor);
  id v23 = objc_msgSend(v21, sel_constraintEqualToAnchor_, v22);

  *(void *)(v5 + 72) = v23;
  id v24 = objc_msgSend(a2, sel_bottomAnchor);
  id v25 = objc_msgSend(v4, sel_bottomAnchor);
  id v26 = objc_msgSend(v24, sel_constraintLessThanOrEqualToAnchor_, v25);

  *(void *)(v5 + 80) = v26;
  sub_25126C558();
  sub_25123DFF4(0, &qword_269B2AEB0);
  unint64_t v27 = (void *)sub_25126C528();
  swift_bridgeObjectRelease();
  objc_msgSend(v29, sel_activateConstraints_, v27);

  return v4;
}

id sub_25123A08C(void *a1)
{
  id v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82E00]), sel_init);
  objc_msgSend(v2, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  objc_msgSend(v2, sel_addSubview_, a1);
  uint64_t v3 = self;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_269B2B040);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_25126E8E0;
  id v5 = objc_msgSend(v2, sel_leadingAnchor);
  id v6 = objc_msgSend(a1, sel_leadingAnchor);
  id v7 = objc_msgSend(v5, sel_constraintEqualToAnchor_, v6);

  *(void *)(v4 + 32) = v7;
  id v8 = objc_msgSend(v2, sel_trailingAnchor);
  id v9 = objc_msgSend(a1, sel_trailingAnchor);
  id v10 = objc_msgSend(v8, sel_constraintEqualToAnchor_, v9);

  *(void *)(v4 + 40) = v10;
  id v11 = objc_msgSend(v2, sel_topAnchor);
  id v12 = objc_msgSend(a1, sel_topAnchor);
  id v13 = objc_msgSend(v11, sel_constraintEqualToAnchor_, v12);

  *(void *)(v4 + 48) = v13;
  id v14 = objc_msgSend(a1, sel_bottomAnchor);
  id v15 = objc_msgSend(v2, sel_bottomAnchor);
  id v16 = objc_msgSend(v14, sel_constraintLessThanOrEqualToAnchor_, v15);

  *(void *)(v4 + 56) = v16;
  sub_25126C558();
  sub_25123DFF4(0, &qword_269B2AEB0);
  id v17 = (void *)sub_25126C528();
  swift_bridgeObjectRelease();
  objc_msgSend(v3, sel_activateConstraints_, v17);

  return v2;
}

uint64_t sub_25123A328(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7)
{
  id v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F828E0]), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  objc_msgSend(v8, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  objc_msgSend(v8, sel_setNumberOfLines_, 0);
  objc_msgSend(v8, sel_setLineBreakMode_, 0);
  LODWORD(v9) = 1148846080;
  objc_msgSend(v8, sel_setContentCompressionResistancePriority_forAxis_, 1, v9);
  id v10 = (void *)sub_25126C458();
  objc_msgSend(v8, sel_setText_, v10);

  objc_msgSend(v8, sel_setTag_, 999);
  id v11 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F828E0]), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  objc_msgSend(v11, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  objc_msgSend(v11, sel_setNumberOfLines_, 0);
  objc_msgSend(v11, sel_setLineBreakMode_, 0);
  LODWORD(v12) = 1148846080;
  objc_msgSend(v11, sel_setContentCompressionResistancePriority_forAxis_, 1, v12);
  id v13 = (void *)sub_25126C458();
  objc_msgSend(v11, sel_setText_, v13);

  objc_msgSend(v11, sel_setTag_, 111);
  id v14 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F828E0]), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  objc_msgSend(v14, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  objc_msgSend(v14, sel_setNumberOfLines_, 0);
  objc_msgSend(v14, sel_setLineBreakMode_, 0);
  LODWORD(v15) = 1148846080;
  objc_msgSend(v14, sel_setContentCompressionResistancePriority_forAxis_, 1, v15);
  id v16 = (void *)sub_25126C458();
  objc_msgSend(v14, sel_setText_, v16);

  objc_msgSend(v14, sel_setTag_, 111);
  objc_msgSend(v14, sel_setTextAlignment_, 2);
  id v17 = (void *)MEMORY[0x263F8EED0];
  id v18 = (void *)(*(uint64_t (**)(id, id))((*MEMORY[0x263F8EED0] & *v7) + 0x148))(v8, v11);
  id v19 = *(uint64_t (**)(id))((*v17 & *v7) + 0x150);
  id v20 = v18;
  id v21 = (void *)v19(v14);
  id v22 = objc_allocWithZone((Class)type metadata accessor for HearingProtectionAboutSplitView());
  id v23 = sub_25123ACBC(0, v20, v21);
  objc_msgSend(v23, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B2AF00);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_25126E8C0;
  sub_25126BD08();
  *(void *)(inited + 32) = sub_25126BCD8();
  *(void *)(inited + 40) = v25;
  *(void *)(inited + 48) = v23;
  id v26 = v23;
  sub_251234EE0(inited, &qword_269B2AF10);
  unint64_t v27 = (void *)sub_25126C3B8();
  swift_bridgeObjectRelease();
  objc_msgSend(a7, sel_setUserInfo_, v27);

  __swift_instantiateConcreteTypeFromMangledName(&qword_269B2AF08);
  objc_msgSend(a7, sel_setProperty_forKey_, sub_25126C978(), *MEMORY[0x263F5FFE0]);

  return swift_unknownObjectRelease();
}

uint64_t sub_25123A764()
{
  return 999;
}

double sub_25123A76C()
{
  return *MEMORY[0x263F839B8];
}

id sub_25123A85C()
{
  return sub_25123B6EC(type metadata accessor for HearingProtectionAboutViewController);
}

uint64_t UILabel.update(newFont:newColor:styleType:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B2AEB8);
  uint64_t v8 = v7 - 8;
  MEMORY[0x270FA5388](v7, v9);
  id v11 = (uint64_t *)((char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  id v12 = objc_msgSend(v3, sel_tag);
  id v13 = (char *)v11 + *(int *)(v8 + 56);
  void *v11 = v12;
  uint64_t v14 = sub_25126BCE8();
  uint64_t v15 = *(void *)(v14 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))(v13, a3, v14);
  if ((*(unsigned int (**)(char *, uint64_t))(v15 + 88))(v13, v14) != *MEMORY[0x263F47300] || v12 != (id)111) {
    return sub_25123DF98((uint64_t)v11, &qword_269B2AEB8);
  }
  objc_msgSend(v3, sel_setFont_, a1);
  objc_msgSend(v3, sel_setTextColor_, a2);
  return (*(uint64_t (**)(char *, uint64_t))(v15 + 8))(v13, v14);
}

uint64_t sub_25123AAAC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return UILabel.update(newFont:newColor:styleType:)(a1, a2, a3);
}

BOOL sub_25123AAD0(char a1, char a2)
{
  return a1 == a2;
}

uint64_t sub_25123AAE0()
{
  return sub_25126C9D8();
}

uint64_t sub_25123AB08()
{
  return sub_25126C9E8();
}

uint64_t sub_25123AB50()
{
  return sub_25126C9E8();
}

uint64_t sub_25123AB98()
{
  return sub_25126C9E8();
}

uint64_t sub_25123ABDC()
{
  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC21HearingModeSettingsUI31HearingProtectionAboutSplitView_usecase);
}

id sub_25123ABEC()
{
  return *(id *)(v0 + OBJC_IVAR____TtC21HearingModeSettingsUI31HearingProtectionAboutSplitView_leftContainer);
}

id sub_25123ABFC()
{
  return *(id *)(v0 + OBJC_IVAR____TtC21HearingModeSettingsUI31HearingProtectionAboutSplitView_rightContainer);
}

id sub_25123AC0C()
{
  uint64_t v1 = OBJC_IVAR____TtC21HearingModeSettingsUI31HearingProtectionAboutSplitView____lazy_storage___stackView;
  id v2 = *(void **)(v0
                + OBJC_IVAR____TtC21HearingModeSettingsUI31HearingProtectionAboutSplitView____lazy_storage___stackView);
  if (v2)
  {
    id v3 = *(id *)(v0
               + OBJC_IVAR____TtC21HearingModeSettingsUI31HearingProtectionAboutSplitView____lazy_storage___stackView);
  }
  else
  {
    id v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82BF8]), sel_init);
    objc_msgSend(v4, sel_setAxis_, 0);
    objc_msgSend(v4, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
    objc_msgSend(v4, sel_setSpacing_, 0.0);
    id v5 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v4;
    id v3 = v4;

    id v2 = 0;
  }
  id v6 = v2;
  return v3;
}

unsigned char *sub_25123ACBC(char a1, void *a2, void *a3)
{
  *(void *)&v3[OBJC_IVAR____TtC21HearingModeSettingsUI31HearingProtectionAboutSplitView____lazy_storage___stackView] = 0;
  v3[OBJC_IVAR____TtC21HearingModeSettingsUI31HearingProtectionAboutSplitView_usecase] = a1;
  *(void *)&v3[OBJC_IVAR____TtC21HearingModeSettingsUI31HearingProtectionAboutSplitView_leftContainer] = a2;
  *(void *)&v3[OBJC_IVAR____TtC21HearingModeSettingsUI31HearingProtectionAboutSplitView_rightContainer] = a3;
  v30.receiver = v3;
  v30.super_class = (Class)type metadata accessor for HearingProtectionAboutSplitView();
  id v6 = a2;
  id v7 = a3;
  uint64_t v8 = objc_msgSendSuper2(&v30, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  id v9 = sub_25123AC0C();
  uint64_t v10 = OBJC_IVAR____TtC21HearingModeSettingsUI31HearingProtectionAboutSplitView_leftContainer;
  objc_msgSend(v9, sel_addArrangedSubview_, *(void *)&v8[OBJC_IVAR____TtC21HearingModeSettingsUI31HearingProtectionAboutSplitView_leftContainer]);

  id v11 = sub_25123AC0C();
  uint64_t v12 = OBJC_IVAR____TtC21HearingModeSettingsUI31HearingProtectionAboutSplitView_rightContainer;
  objc_msgSend(v11, sel_addArrangedSubview_, *(void *)&v8[OBJC_IVAR____TtC21HearingModeSettingsUI31HearingProtectionAboutSplitView_rightContainer]);

  if (v8[OBJC_IVAR____TtC21HearingModeSettingsUI31HearingProtectionAboutSplitView_usecase])
  {
    if (v8[OBJC_IVAR____TtC21HearingModeSettingsUI31HearingProtectionAboutSplitView_usecase] != 1)
    {
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_269B2B040);
      uint64_t v18 = swift_allocObject();
      *(_OWORD *)(v18 + 16) = xmmword_25126E8F0;
      id v19 = objc_msgSend(*(id *)&v8[v10], sel_widthAnchor);
      id v20 = objc_msgSend(*(id *)&v8[v12], sel_widthAnchor);
      id v21 = objc_msgSend(v19, sel_constraintEqualToAnchor_multiplier_, v20, 0.5);

      *(void *)(v18 + 32) = v21;
      sub_25126C558();
      id v22 = sub_25123AC0C();
      objc_msgSend(v22, sel_setSpacing_, 10.0);

      goto LABEL_7;
    }
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_269B2B040);
    uint64_t v13 = swift_allocObject();
    *(_OWORD *)(v13 + 16) = xmmword_25126E8F0;
    id v14 = objc_msgSend(*(id *)&v8[v10], sel_widthAnchor);
    id v15 = objc_msgSend(*(id *)&v8[v12], sel_widthAnchor);
    id v16 = objc_msgSend(v14, sel_constraintEqualToAnchor_, v15);
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_269B2B040);
    uint64_t v13 = swift_allocObject();
    *(_OWORD *)(v13 + 16) = xmmword_25126E8F0;
    id v14 = objc_msgSend(*(id *)&v8[v10], sel_widthAnchor);
    id v15 = objc_msgSend(*(id *)&v8[v12], sel_widthAnchor);
    id v16 = objc_msgSend(v14, sel_constraintEqualToAnchor_multiplier_, v15, 2.0);
  }
  id v17 = v16;

  *(void *)(v13 + 32) = v17;
  sub_25126C558();
LABEL_7:
  id v23 = self;
  sub_25123DFF4(0, &qword_269B2AEB0);
  id v24 = (void *)sub_25126C528();
  swift_bridgeObjectRelease();
  objc_msgSend(v23, sel_activateConstraints_, v24);

  uint64_t v25 = v8;
  id v26 = sub_25123AC0C();
  objc_msgSend(v25, sel_addSubview_, v26);

  id v27 = sub_25123AC0C();
  uint64_t v28 = v25;
  objc_msgSend(v27, sel_pinToOther_, v28);

  return v28;
}

uint64_t sub_25123B058(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v33 = a3;
  uint64_t v29 = a1;
  uint64_t v30 = a2;
  uint64_t v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B2AEB8);
  MEMORY[0x270FA5388](v32, v4);
  __n128 v34 = (uint64_t *)((char *)&v28 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  id v6 = objc_msgSend(*(id *)(v3 + OBJC_IVAR____TtC21HearingModeSettingsUI31HearingProtectionAboutSplitView_rightContainer), sel_subviews);
  sub_25123DFF4(0, &qword_269B2AEE0);
  uint64_t v7 = sub_25126C538();

  id v8 = objc_msgSend(*(id *)(v3 + OBJC_IVAR____TtC21HearingModeSettingsUI31HearingProtectionAboutSplitView_leftContainer), sel_subviews);
  unint64_t v9 = sub_25126C538();

  uint64_t v35 = v7;
  sub_25123C298(v9, (uint64_t (*)(uint64_t, void, unint64_t))sub_25123C830);
  unint64_t v10 = v35;
  uint64_t v35 = MEMORY[0x263F8EE78];
  if (v10 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t result = sub_25126C8C8();
    uint64_t v11 = result;
    if (!result) {
      goto LABEL_19;
    }
  }
  else
  {
    uint64_t v11 = *(void *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (!v11) {
      goto LABEL_19;
    }
  }
  if (v11 < 1)
  {
    __break(1u);
    return result;
  }
  if ((v10 & 0xC000000000000001) != 0)
  {
    for (uint64_t i = 0; i != v11; ++i)
    {
      MEMORY[0x253399500](i, v10);
      self;
      if (swift_dynamicCastObjCClass())
      {
        MEMORY[0x253399200]();
        if (*(void *)((v35 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v35 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          sub_25126C568();
        }
        sub_25126C578();
        sub_25126C558();
      }
      else
      {
        swift_unknownObjectRelease();
      }
    }
  }
  else
  {
    for (uint64_t j = 0; j != v11; ++j)
    {
      id v15 = *(void **)(v10 + 8 * j + 32);
      self;
      if (swift_dynamicCastObjCClass())
      {
        MEMORY[0x253399200](v15);
        if (*(void *)((v35 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v35 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          sub_25126C568();
        }
        sub_25126C578();
        sub_25126C558();
      }
    }
  }
LABEL_19:
  swift_bridgeObjectRelease();
  unint64_t v16 = v35;
  swift_bridgeObjectRelease();
  if (v16 >> 62) {
    goto LABEL_33;
  }
  uint64_t v17 = *(void *)((v16 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (uint64_t k = v17; k; uint64_t k = sub_25126C8C8())
  {
    int v18 = *MEMORY[0x263F47300];
    uint64_t v19 = 4;
    uint64_t v20 = 0;
    if ((v16 & 0xC000000000000001) != 0)
    {
LABEL_22:
      id v21 = (id)MEMORY[0x253399500](v20, v16);
      goto LABEL_24;
    }
    while (1)
    {
      id v21 = *(id *)(v16 + 8 * v19);
LABEL_24:
      id v22 = v21;
      uint64_t v23 = v20 + 1;
      if (__OFADD__(v20, 1)) {
        break;
      }
      id v24 = objc_msgSend(v21, sel_tag);
      uint64_t v25 = (char *)v34 + *(int *)(v32 + 48);
      *__n128 v34 = v24;
      uint64_t v26 = sub_25126BCE8();
      uint64_t v27 = *(void *)(v26 - 8);
      (*(void (**)(char *, uint64_t, uint64_t))(v27 + 16))(v25, v33, v26);
      if ((*(unsigned int (**)(char *, uint64_t))(v27 + 88))(v25, v26) == v18 && v24 == (id)111)
      {
        objc_msgSend(v22, sel_setFont_, v29);
        objc_msgSend(v22, sel_setTextColor_, v30);
        (*(void (**)(char *, uint64_t))(v27 + 8))(v25, v26);
      }
      else
      {
        sub_25123DF98((uint64_t)v34, &qword_269B2AEB8);
      }

      if (v23 == k) {
        return swift_bridgeObjectRelease_n();
      }
      uint64_t v20 = ++v19 - 4;
      if ((v16 & 0xC000000000000001) != 0) {
        goto LABEL_22;
      }
    }
    __break(1u);
LABEL_33:
    swift_bridgeObjectRetain();
  }
  return swift_bridgeObjectRelease_n();
}

id _sSo33HMHearingProtectionViewControllerC21HearingModeSettingsUIE0eb9SeporatorC0C5coderAESgSo7NSCoderC_tcfC_0(void *a1)
{
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

void sub_25123B528()
{
  *(void *)&v0[OBJC_IVAR____TtC21HearingModeSettingsUI31HearingProtectionAboutSplitView____lazy_storage___stackView] = 0;

  sub_25126C8B8();
  __break(1u);
}

id _sSo33HMHearingProtectionViewControllerC21HearingModeSettingsUIE0eb9SeporatorC0C5frameAESo6CGRectV_tcfC_0(double a1, double a2, double a3, double a4)
{
  id v9 = objc_allocWithZone(v4);
  return objc_msgSend(v9, sel_initWithFrame_, a1, a2, a3, a4);
}

void sub_25123B674()
{
}

id sub_25123B6D4()
{
  return sub_25123B6EC(type metadata accessor for HearingProtectionAboutSplitView);
}

id sub_25123B6EC(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

uint64_t sub_25123B780()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & **v0) + 0x90))();
}

_DWORD *sub_25123B7D4@<X0>(_DWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_DWORD *)a2 = *result;
  *(unsigned char *)(a2 + 4) = 0;
  return result;
}

void sub_25123B7E4(_DWORD *a1@<X8>)
{
  *a1 = *v1;
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

unint64_t sub_25123B87C()
{
  unint64_t result = qword_269B2B260;
  if (!qword_269B2B260)
  {
    sub_25123DFF4(255, &qword_269B2AE18);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B2B260);
  }
  return result;
}

uint64_t sub_25123B8E4()
{
  swift_unknownObjectWeakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_25123B91C()
{
  uint64_t v1 = v0 + 16;
  if (qword_269B2B920 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_25126C0E8();
  __swift_project_value_buffer(v2, (uint64_t)qword_269B2D448);
  objc_super v3 = sub_25126C0C8();
  os_log_type_t v4 = sub_25126C648();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_251222000, v3, v4, "Hearing Protection: Listening mode changed, reload", v5, 2u);
    MEMORY[0x253399FB0](v5, -1, -1);
  }

  swift_beginAccess();
  uint64_t v6 = MEMORY[0x25339A050](v1);
  if (v6)
  {
    uint64_t v7 = (void *)v6;
    id v8 = (void *)sub_25126C458();
    objc_msgSend(v7, sel_reloadSpecifierID_, v8);
  }
}

void sub_25123BA68(void *a1)
{
  sub_251234214(a1, *(void *)(v1 + 16));
}

void sub_25123BA70()
{
  swift_beginAccess();
  uint64_t v1 = (void *)MEMORY[0x25339A050](v0 + 16);
  if (v1)
  {
    uint64_t v2 = v1;
    objc_msgSend(v1, sel_openAboutHearingProtection);
  }
}

uint64_t sub_25123BACC(uint64_t a1)
{
  return a1;
}

uint64_t sub_25123BB20(uint64_t a1, uint64_t a2)
{
  return sub_25123BC8C(a1, a2, MEMORY[0x263F07B58]);
}

uint64_t sub_25123BB38(uint64_t a1, id *a2)
{
  uint64_t result = sub_25126C468();
  *a2 = 0;
  return result;
}

uint64_t sub_25123BBB0(uint64_t a1, id *a2)
{
  char v3 = sub_25126C478();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_25123BC30@<X0>(uint64_t *a1@<X8>)
{
  sub_25126C488();
  uint64_t v2 = sub_25126C458();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_25123BC74(uint64_t a1, uint64_t a2)
{
  return sub_25123BC8C(a1, a2, MEMORY[0x263F8D308]);
}

uint64_t sub_25123BC8C(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = sub_25126C488();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_25123BCD0()
{
  sub_25126C488();
  sub_25126C4C8();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25123BD24()
{
  sub_25126C488();
  sub_25126C9C8();
  sub_25126C4C8();
  uint64_t v0 = sub_25126C9E8();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_25123BD98()
{
  uint64_t v0 = sub_25126C488();
  uint64_t v2 = v1;
  if (v0 == sub_25126C488() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_25126C958();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_25123BE24@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_25126C458();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_25123BE6C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_25126C488();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_25123BE98(uint64_t a1)
{
  uint64_t v2 = sub_25123DA0C(&qword_269B2AF30);
  uint64_t v3 = sub_25123DA0C((unint64_t *)&unk_269B2B000);
  uint64_t v4 = MEMORY[0x263F8D320];
  return MEMORY[0x270F9F1A8](a1, v2, v3, v4);
}

unint64_t sub_25123BF30(uint64_t a1, uint64_t a2)
{
  sub_25126C9C8();
  sub_25126C4C8();
  uint64_t v4 = sub_25126C9E8();
  return sub_25123C03C(a1, a2, v4);
}

unint64_t sub_25123BFA8(uint64_t a1)
{
  sub_25126C488();
  sub_25126C9C8();
  sub_25126C4C8();
  uint64_t v2 = sub_25126C9E8();
  swift_bridgeObjectRelease();
  return sub_25123C120(a1, v2);
}

unint64_t sub_25123C03C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    unint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_25126C958() & 1) == 0)
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
      while (!v14 && (sub_25126C958() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_25123C120(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v5 = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
  {
    uint64_t v6 = sub_25126C488();
    uint64_t v8 = v7;
    if (v6 == sub_25126C488() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    char v11 = sub_25126C958();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v11 & 1) == 0)
    {
      uint64_t v12 = ~v4;
      unint64_t v5 = (v5 + 1) & v12;
      if ((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
      {
        while (1)
        {
          uint64_t v13 = sub_25126C488();
          uint64_t v15 = v14;
          if (v13 == sub_25126C488() && v15 == v16) {
            break;
          }
          char v18 = sub_25126C958();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v18 & 1) == 0)
          {
            unint64_t v5 = (v5 + 1) & v12;
            if ((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5)) {
              continue;
            }
          }
          return v5;
        }
        goto LABEL_16;
      }
    }
  }
  return v5;
}

uint64_t sub_25123C298(unint64_t a1, uint64_t (*a2)(uint64_t, void, unint64_t))
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v5 = sub_25126C8C8();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v5 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  unint64_t v6 = *v2;
  if (*v2 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_25126C8C8();
    swift_bridgeObjectRelease();
    uint64_t v8 = v7 + v5;
    if (!__OFADD__(v7, v5)) {
      goto LABEL_5;
    }
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  uint64_t v7 = *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t v8 = v7 + v5;
  if (__OFADD__(v7, v5)) {
    goto LABEL_25;
  }
LABEL_5:
  unint64_t v6 = *v2;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  unint64_t *v2 = v6;
  uint64_t v7 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v6 & 0x8000000000000000) == 0 && (v6 & 0x4000000000000000) == 0)
  {
    uint64_t v10 = v6 & 0xFFFFFFFFFFFFFF8;
    if (v8 <= *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      goto LABEL_15;
    }
    uint64_t v7 = 1;
  }
  if (v6 >> 62) {
    goto LABEL_27;
  }
  uint64_t v11 = *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    if (v11 <= v8) {
      uint64_t v11 = v8;
    }
    swift_bridgeObjectRetain();
    unint64_t v6 = MEMORY[0x253399510](v7, v11, 1, v6);
    swift_bridgeObjectRelease();
    unint64_t *v2 = v6;
    uint64_t v10 = v6 & 0xFFFFFFFFFFFFFF8;
LABEL_15:
    uint64_t result = a2(v10 + 8 * *(void *)(v10 + 16) + 32, (*(void *)(v10 + 24) >> 1) - *(void *)(v10 + 16), a1);
    if (v13 >= v5) {
      break;
    }
LABEL_26:
    __break(1u);
LABEL_27:
    swift_bridgeObjectRetain();
    uint64_t v11 = sub_25126C8C8();
    swift_bridgeObjectRelease();
  }
  if (v13 >= 1)
  {
    uint64_t v14 = *(void *)((*v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
    BOOL v15 = __OFADD__(v14, v13);
    uint64_t v16 = v14 + v13;
    if (v15)
    {
      __break(1u);
      return result;
    }
    *(void *)((*v2 & 0xFFFFFFFFFFFFFF8) + 0x10) = v16;
  }
  swift_bridgeObjectRelease();
  return sub_25126C558();
}

uint64_t sub_25123C46C(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_25123C48C(a1, a2, a3, *v3);
  NSObject *v3 = (char *)result;
  return result;
}

uint64_t sub_25123C48C(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_269B2AF50);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 1;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 5);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[32 * v8]) {
      memmove(v13, v14, 32 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[32 * v8] || v13 >= &v14[32 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_25126C918();
  __break(1u);
  return result;
}

uint64_t sub_25123C5FC(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_25126C8C8();
    swift_bridgeObjectRelease();
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
  if (!a1) {
    goto LABEL_19;
  }
  uint64_t v8 = a3 & 0xFFFFFFFFFFFFFF8;
  if (v6)
  {
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_25126C8C8();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_25123E030((unint64_t *)&qword_269B2AF48, &qword_269B2AEA8);
        swift_bridgeObjectRetain();
        for (unint64_t i = 0; i != v7; ++i)
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_269B2AEA8);
          uint64_t v12 = sub_25123CA64(v16, i, a3);
          id v14 = *v13;
          ((void (*)(void (**)(id *), void))v12)(v16, 0);
          *(void *)(a1 + 8 * i) = v14;
        }
        swift_bridgeObjectRelease();
        return a3;
      }
      goto LABEL_18;
    }
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  uint64_t v9 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v9 > a2)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v8 + 32 >= a1 + 8 * v9 || v8 + 32 + 8 * v9 <= a1)
  {
    sub_25123DFF4(0, &qword_269B2AE98);
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  uint64_t result = sub_25126C918();
  __break(1u);
  return result;
}

uint64_t sub_25123C830(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_25126C8C8();
    swift_bridgeObjectRelease();
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
  if (!a1) {
    goto LABEL_19;
  }
  uint64_t v8 = a3 & 0xFFFFFFFFFFFFFF8;
  if (v6)
  {
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_25126C8C8();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_25123E030(&qword_269B2AF20, &qword_269B2AF18);
        swift_bridgeObjectRetain();
        for (unint64_t i = 0; i != v7; ++i)
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_269B2AF18);
          uint64_t v12 = sub_25123CAD0(v16, i, a3);
          id v14 = *v13;
          ((void (*)(void (**)(id *), void))v12)(v16, 0);
          *(void *)(a1 + 8 * i) = v14;
        }
        swift_bridgeObjectRelease();
        return a3;
      }
      goto LABEL_18;
    }
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  uint64_t v9 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v9 > a2)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v8 + 32 >= a1 + 8 * v9 || v8 + 32 + 8 * v9 <= a1)
  {
    sub_25123DFF4(0, &qword_269B2AEE0);
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  uint64_t result = sub_25126C918();
  __break(1u);
  return result;
}

uint64_t (*sub_25123CA64(void (**a1)(id *a1), unint64_t a2, uint64_t a3))()
{
  unint64_t v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((void *)v6 + 4) = sub_25123CB80(v6, a2, a3);
  return sub_25123CACC;
}

uint64_t (*sub_25123CAD0(void (**a1)(id *), unint64_t a2, uint64_t a3))()
{
  unint64_t v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((void *)v6 + 4) = sub_25123CC08(v6, a2, a3);
  return sub_25123CACC;
}

void sub_25123CB38(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);
  free(v1);
}

void (*sub_25123CB80(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
{
  uint64_t v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    id v4 = (id)MEMORY[0x253399500](a2, a3);
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) > a2)
  {
    id v4 = *(id *)(a3 + 8 * a2 + 32);
LABEL_5:
    *(void *)uint64_t v3 = v4;
    return sub_25123CC00;
  }
  __break(1u);
  return result;
}

void sub_25123CC00(id *a1)
{
}

void (*sub_25123CC08(void (*result)(id *), unint64_t a2, uint64_t a3))(id *)
{
  uint64_t v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    id v4 = (id)MEMORY[0x253399500](a2, a3);
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) > a2)
  {
    id v4 = *(id *)(a3 + 8 * a2 + 32);
LABEL_5:
    *(void *)uint64_t v3 = v4;
    return sub_25123E198;
  }
  __break(1u);
  return result;
}

uint64_t _sSo33HMHearingProtectionViewControllerC21HearingModeSettingsUIE09openAbouteB0yyF_0()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B2AF28);
  MEMORY[0x270FA5388](v0 - 8, v1);
  uint64_t v3 = (char *)&v22 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_25126BB28();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4, v6);
  uint64_t v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_25126C0E8();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9, v11);
  uint64_t v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_251247964();
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v13, v14, v9);
  BOOL v15 = sub_25126C0C8();
  os_log_type_t v16 = sub_25126C648();
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v17 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v17 = 0;
    _os_log_impl(&dword_251222000, v15, v16, "About Hearing Protection Link tapped", v17, 2u);
    MEMORY[0x253399FB0](v17, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v10 + 8))(v13, v9);
  sub_25126BB18();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4) == 1) {
    return sub_25123DF98((uint64_t)v3, &qword_269B2AF28);
  }
  (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v8, v3, v4);
  id v19 = objc_msgSend(self, sel_sharedApplication);
  uint64_t v20 = (void *)sub_25126BB08();
  sub_251234C8C(MEMORY[0x263F8EE78]);
  type metadata accessor for OpenExternalURLOptionsKey(0);
  sub_25123DA0C(&qword_269B2AF30);
  id v21 = (void *)sub_25126C3B8();
  swift_bridgeObjectRelease();
  objc_msgSend(v19, sel_openURL_options_completionHandler_, v20, v21, 0);

  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v8, v4);
}

uint64_t type metadata accessor for HearingProtectionAboutViewController()
{
  return self;
}

unint64_t sub_25123D01C()
{
  unint64_t result = qword_269B2AE48;
  if (!qword_269B2AE48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B2AE48);
  }
  return result;
}

unint64_t sub_25123D070()
{
  unint64_t result = qword_269B2AE50;
  if (!qword_269B2AE50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B2AE50);
  }
  return result;
}

uint64_t sub_25123D0C4()
{
  uint64_t v1 = sub_25126C448();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1, v3);
  uint64_t v5 = &v9[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  if (*v0)
  {
    if (*v0 == 1) {
      v9[14] = 1;
    }
    else {
      v9[15] = 2;
    }
    sub_25126C3D8();
    uint64_t v6 = sub_2512547C8((uint64_t)v5);
    (*(void (**)(unsigned char *, uint64_t))(v2 + 8))(v5, v1);
  }
  else
  {
    v9[13] = 0;
    sub_25126C3D8();
    uint64_t v6 = sub_2512547C8((uint64_t)v5);
    uint64_t v7 = *(void (**)(unsigned char *, uint64_t))(v2 + 8);
    v7(v5, v1);
    v9[12] = 0;
    sub_25126C3D8();
    sub_2512547C8((uint64_t)v5);
    v7(v5, v1);
  }
  return v6;
}

void sub_25123D304()
{
  *(void *)&v0[OBJC_IVAR____TtC21HearingModeSettingsUI36HearingProtectionAboutViewController_headphoneDevice] = 0;
  *(void *)&v0[OBJC_IVAR____TtC21HearingModeSettingsUI36HearingProtectionAboutViewController____lazy_storage___totalAttenuation] = 0;
  *(void *)&v0[OBJC_IVAR____TtC21HearingModeSettingsUI36HearingProtectionAboutViewController____lazy_storage___passiveAttenuation] = 0;
  *(void *)&v0[OBJC_IVAR____TtC21HearingModeSettingsUI36HearingProtectionAboutViewController____lazy_storage___properFitPlaceCard] = 0;
  *(void *)&v0[OBJC_IVAR____TtC21HearingModeSettingsUI36HearingProtectionAboutViewController____lazy_storage___fitPlaceCard] = 0;
  *(void *)&v0[OBJC_IVAR____TtC21HearingModeSettingsUI36HearingProtectionAboutViewController____lazy_storage___maintenanceCarePlaceCard] = 0;
  *(void *)&v0[OBJC_IVAR____TtC21HearingModeSettingsUI36HearingProtectionAboutViewController____lazy_storage___deviceInformationSection] = 0;

  sub_25126C8B8();
  __break(1u);
}

uint64_t sub_25123D3B8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B2AE90);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t type metadata accessor for HearingProtectionAboutSplitView()
{
  return self;
}

unint64_t sub_25123D68C()
{
  unint64_t result = qword_269B2AEE8;
  if (!qword_269B2AEE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B2AEE8);
  }
  return result;
}

unint64_t sub_25123D6E4()
{
  unint64_t result = qword_269B2AEF0;
  if (!qword_269B2AEF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B2AEF0);
  }
  return result;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

ValueMetadata *type metadata accessor for PlaceCardUseCase()
{
  return &type metadata for PlaceCardUseCase;
}

uint64_t getEnumTagSinglePayload for SetUpSection(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *_s21HearingModeSettingsUI16PlaceCardUseCaseOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25123D8C0);
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

uint64_t sub_25123D8E8(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_25123D8F0(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for HearingProtectionAboutSplitView.UseCase()
{
  return &type metadata for HearingProtectionAboutSplitView.UseCase;
}

void type metadata accessor for CBListeningMode(uint64_t a1)
{
}

void *__swift_project_boxed_opaque_existential_0(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
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

void type metadata accessor for OpenExternalURLOptionsKey(uint64_t a1)
{
}

void sub_25123D9C4(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_25123DA0C(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for OpenExternalURLOptionsKey(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

_OWORD *sub_25123DA50(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

void sub_25123DA64(void *a1)
{
}

uint64_t sub_25123DA6C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

void sub_25123DAD0(void *a1)
{
}

void sub_25123DAD8(void *a1, char a2)
{
  uint64_t v5 = *(void **)(v2 + 16);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B2AF58);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_25126E900;
  BOOL v7 = (uint64_t *)sub_25124F60C();
  uint64_t v9 = *v7;
  uint64_t v8 = v7[1];
  *(void *)(inited + 32) = v9;
  *(void *)(inited + 40) = v8;
  *(void *)(inited + 72) = MEMORY[0x263F8D4F8];
  *(unsigned char *)(inited + 48) = 1;
  swift_bridgeObjectRetain();
  uint64_t v10 = sub_25124F4CC();
  uint64_t v12 = *v10;
  uint64_t v11 = v10[1];
  *(void *)(inited + 80) = v12;
  *(void *)(inited + 88) = v11;
  uint64_t v13 = *(uint64_t (**)(uint64_t))((*MEMORY[0x263F8EED0] & *v5) + 0x88);
  uint64_t v14 = swift_bridgeObjectRetain();
  uint64_t v15 = v13(v14);
  *(void *)(inited + 120) = __swift_instantiateConcreteTypeFromMangledName(&qword_269B2AF60);
  *(void *)(inited + 96) = v15;
  os_log_type_t v16 = sub_25124F444();
  uint64_t v17 = v16[1];
  *(void *)(inited + 128) = *v16;
  *(void *)(inited + 136) = v17;
  uint64_t v18 = type metadata accessor for HearingTopLevelCaseObjectWrapper();
  v22[3] = &type metadata for PlaceCardUseCase;
  v22[4] = &off_270214430;
  LOBYTE(v22[0]) = a2;
  swift_bridgeObjectRetain();
  id v19 = sub_25124F1E8((uint64_t)v22);
  *(void *)(inited + 168) = v18;
  *(void *)(inited + 144) = v19;
  sub_251234B54(inited);
  uint64_t v20 = (void *)sub_25126C3B8();
  swift_bridgeObjectRelease();
  objc_msgSend(a1, sel_setUserInfo_, v20);

  v22[0] = type metadata accessor for HearingTopLevelCell();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B2AF68);
  objc_msgSend(a1, sel_setProperty_forKey_, sub_25126C978(), *MEMORY[0x263F5FFE0]);
  swift_unknownObjectRelease();
  id v21 = (void *)sub_25126C588();
  objc_msgSend(a1, sel_setProperty_forKey_, v21, *MEMORY[0x263F600A8]);
}

void sub_25123DCDC(void *a1)
{
  int v3 = *(void **)(v1 + 16);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B2AF80);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_25126E8B0;
  uint64_t v5 = sub_25124F4CC();
  uint64_t v7 = *v5;
  uint64_t v6 = v5[1];
  *(void *)(inited + 32) = v7;
  *(void *)(inited + 40) = v6;
  uint64_t v8 = *(uint64_t (**)(uint64_t))((*MEMORY[0x263F8EED0] & *v3) + 0x88);
  uint64_t v9 = swift_bridgeObjectRetain();
  *(void *)(inited + 48) = v8(v9);
  uint64_t v10 = sub_25124F444();
  uint64_t v11 = v10[1];
  *(void *)(inited + 56) = *v10;
  *(void *)(inited + 64) = v11;
  type metadata accessor for HearingTopLevelCaseObjectWrapper();
  v14[3] = &type metadata for PlaceCardUseCase;
  v14[4] = &off_270214430;
  LOBYTE(v14[0]) = 1;
  swift_bridgeObjectRetain();
  *(void *)(inited + 72) = sub_25124F1E8((uint64_t)v14);
  sub_251234FF8(inited);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B2AF88);
  uint64_t v12 = (void *)sub_25126C3B8();
  swift_bridgeObjectRelease();
  objc_msgSend(a1, sel_setUserInfo_, v12);

  v14[0] = type metadata accessor for HearingTopLevelCell();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B2AF68);
  objc_msgSend(a1, sel_setProperty_forKey_, sub_25126C978(), *MEMORY[0x263F5FFE0]);
  swift_unknownObjectRelease();
  uint64_t v13 = (void *)sub_25126C588();
  objc_msgSend(a1, sel_setProperty_forKey_, v13, *MEMORY[0x263F600A8]);
}

void sub_25123DEA4(void *a1)
{
  sub_2512370C8(a1, *(void *)(v1 + 16));
}

uint64_t sub_25123DEAC(void *a1)
{
  return sub_251237218(a1, *(void *)(v1 + 16));
}

void sub_25123DEB4(void *a1)
{
  sub_2512379D4(a1, *(void *)(v1 + 16));
}

void sub_25123DEE8(void *a1)
{
  sub_2512374D0(a1, *(void **)(v1 + 16));
}

void sub_25123DEF0(void *a1)
{
  sub_2512379D4(a1, *(void *)(v1 + 16));
}

void sub_25123DF24(void *a1)
{
  sub_251235F20(a1, *(void *)(v1 + 16));
}

uint64_t sub_25123DF2C(void *a1)
{
  return sub_25123640C(a1, *(void *)(v1 + 16));
}

uint64_t sub_25123DF34(void *a1)
{
  return sub_25123661C(a1, *(void *)(v1 + 16));
}

uint64_t sub_25123DF3C(void *a1)
{
  return sub_251236830(a1, *(void *)(v1 + 16));
}

unint64_t sub_25123DF44()
{
  unint64_t result = qword_269B2AFB8;
  if (!qword_269B2AFB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B2AFB8);
  }
  return result;
}

uint64_t sub_25123DF98(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_25123DFF4(uint64_t a1, unint64_t *a2)
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

uint64_t sub_25123E030(unint64_t *a1, uint64_t *a2)
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

uint64_t sub_25123E0D8()
{
  return sub_25123DA0C(&qword_269B2AFE8);
}

uint64_t sub_25123E10C()
{
  return sub_25123DA0C(&qword_269B2AFF0);
}

uint64_t sub_25123E140()
{
  return sub_25123DA0C(&qword_269B2AFF8);
}

void sub_25123E174()
{
}

void *sub_25123E19C()
{
  return &unk_269B2D460;
}

NSAttributedString __swiftcall HKAudiogramSample.audiogramSelectionDescription(date:font:)(Swift::String date, UIFont font)
{
  uint64_t v3 = sub_25126BB68();
  MEMORY[0x270FA5388](v3 - 8, v4);
  uint64_t v5 = sub_25126C448();
  MEMORY[0x270FA5388](v5 - 8, v6);
  result.super.Class isa = (Class)(id)HKIntegerFormatter();
  if (!result.super.isa)
  {
    __break(1u);
    return result;
  }
  Class isa = result.super.isa;
  sub_25126C3D8();
  sub_25123DFF4(0, (unint64_t *)&unk_269B2B010);
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  uint64_t v10 = self;
  id v11 = objc_msgSend(v10, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_25126BB58();
  uint64_t v12 = sub_25126C4A8();
  uint64_t v14 = v13;
  sub_25126C3D8();
  v71 = v10;
  id v15 = objc_msgSend(v10, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_25126BB58();
  sub_25126C4A8();
  v76 = v2;
  id v16 = objc_msgSend(v2, sel_hearingLevelSummary);
  id v17 = objc_msgSend(v16, sel_leftEarMetrics);

  id v18 = objc_msgSend(v17, sel_averageSensitivity);
  HKHearingLevelClassificationForSensitivity();
  id v19 = (id)HKLocalizedStringForHearingLevelClassification();
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v67 = sub_25126C488();
    uint64_t v68 = v21;
  }
  else
  {
    swift_bridgeObjectRetain();
    uint64_t v67 = v12;
    uint64_t v68 = v14;
  }
  v72 = v18;
  if (v18 && (id v22 = objc_msgSend(v18, sel__unit, v67, v68)) != 0)
  {
    uint64_t v23 = v22;
    objc_msgSend(v18, sel_doubleValueForUnit_, v22);
    id v25 = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithDouble_, v24);
  }
  else
  {
    id v25 = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithInteger_, 0);
  }
  Class v75 = isa;
  v70 = v25;
  id v26 = -[objc_class stringFromNumber:](isa, sel_stringFromNumber_, v25, v67, v68);
  if (v26)
  {
    uint64_t v27 = v26;
    sub_25126C488();
  }
  else
  {
    swift_bridgeObjectRetain();
  }
  sub_25126C4D8();
  swift_bridgeObjectRelease();
  sub_25126C4D8();
  id v28 = objc_msgSend(v76, sel_hearingLevelSummary);
  id v29 = objc_msgSend(v28, sel_rightEarMetrics);

  id v30 = objc_msgSend(v29, sel_averageSensitivity);
  HKHearingLevelClassificationForSensitivity();
  id v31 = (id)HKLocalizedStringForHearingLevelClassification();
  if (v31)
  {
    uint64_t v32 = v31;
    sub_25126C488();
    swift_bridgeObjectRelease();

    object = date._object;
    if (!v30) {
      goto LABEL_18;
    }
  }
  else
  {
    object = date._object;
    if (!v30)
    {
LABEL_18:
      id v37 = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithInteger_, 0);
      goto LABEL_19;
    }
  }
  id v34 = objc_msgSend(v30, sel__unit);
  if (!v34) {
    goto LABEL_18;
  }
  uint64_t v35 = v34;
  objc_msgSend(v30, sel_doubleValueForUnit_, v34);
  id v37 = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithDouble_, v36);

LABEL_19:
  date._object = v37;
  id v38 = [(objc_class *)v75 stringFromNumber:v37];
  v69 = v30;
  if (v38)
  {
    uint64_t v39 = v38;
    sub_25126C488();
    swift_bridgeObjectRelease();
  }
  sub_25126C4D8();
  swift_bridgeObjectRelease();
  sub_25126C4D8();
  id v40 = [(objc_class *)font.super.isa fontDescriptor];
  id v41 = objc_msgSend(v40, sel_fontDescriptorWithSymbolicTraits_, 2);

  if (v41)
  {
    [(objc_class *)font.super.isa pointSize];
    id v43 = objc_msgSend(self, sel_fontWithDescriptor_size_, v41, v42);
  }
  else
  {
    uint64_t v44 = self;
    [(objc_class *)font.super.isa pointSize];
    id v43 = objc_msgSend(v44, sel_boldSystemFontOfSize_);
  }
  v45 = self;
  [(objc_class *)font.super.isa pointSize];
  id v46 = objc_msgSend(v45, sel_systemFontOfSize_);
  id v47 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F089B8]), sel_init);
  v48 = (void *)sub_25125E2EC(date._countAndFlagsBits, object, v43);

  v49 = (void *)sub_25125E2EC(10, 0xE100000000000000, v46);
  sub_25126C3D8();
  id v50 = objc_msgSend(v71, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_25126BB58();
  uint64_t v51 = sub_25126C4A8();
  v53 = (void *)sub_25125E2EC(v51, v52, v43);

  swift_bridgeObjectRelease();
  sub_25126C4D8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_25126C4D8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v54 = (void *)sub_25125E2EC(32, 0xE100000000000000, v46);

  swift_bridgeObjectRelease();
  v55 = (void *)sub_25125E2EC(10, 0xE100000000000000, v46);

  sub_25126C3D8();
  id v56 = objc_msgSend(v71, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_25126BB58();
  uint64_t v57 = sub_25126C4A8();
  v59 = (void *)sub_25125E2EC(v57, v58, v43);

  swift_bridgeObjectRelease();
  sub_25126C4D8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_25126C4D8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v60 = (void *)sub_25125E2EC(32, 0xE100000000000000, v46);

  swift_bridgeObjectRelease();
  v61 = (void *)sub_25125E2EC(10, 0xE100000000000000, v46);

  id v62 = objc_msgSend(v76, sel_localizedIngestionSource);
  uint64_t v63 = sub_25126C488();
  uint64_t v65 = v64;

  v66.super.Class isa = (Class)sub_25125E2EC(v63, v65, v46);
  swift_bridgeObjectRelease();

  return v66;
}

Class sub_25123EB24(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v6 = sub_25126C488();
  uint64_t v8 = v7;
  id v9 = a4;
  id v10 = a1;
  v11._countAndFlagsBits = v6;
  v11._object = v8;
  v12.super.Class isa = HKAudiogramSample.audiogramSelectionDescription(date:font:)(v11, (UIFont)v9).super.isa;

  swift_bridgeObjectRelease();
  return v12.super.isa;
}

uint64_t HMHearingAidAudiogramViewController.flowController.getter()
{
  swift_beginAccess();
  id v1 = objc_getAssociatedObject(v0, &unk_269B2D460);
  swift_endAccess();
  if (v1)
  {
    sub_25126C7A8();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v4, 0, sizeof(v4));
  }
  sub_25123D3B8((uint64_t)v4, (uint64_t)v5);
  if (v6)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_269B2B020);
    if (swift_dynamicCast()) {
      return v3;
    }
    else {
      return 0;
    }
  }
  else
  {
    sub_25123ECCC((uint64_t)v5);
    return 0;
  }
}

uint64_t sub_25123ECCC(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B2AE90);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t HMHearingAidAudiogramViewController.flowController.setter(void *a1)
{
  swift_beginAccess();
  objc_setAssociatedObject(v1, &unk_269B2D460, a1, (void *)1);
  swift_endAccess();
  return swift_unknownObjectRelease();
}

id sub_25123EE20@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_flowController);
  *a2 = result;
  return result;
}

id sub_25123EE5C(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setFlowController_, *a1);
}

id sub_25123EE70()
{
  return objc_retain(*(id *)(v0
                           + OBJC_IVAR____TtCE21HearingModeSettingsUICSo35HMHearingAidAudiogramViewController29HearingAidAudiogramFooterView_inLabel));
}

id sub_25123EE84()
{
  uint64_t v0 = sub_25126C448();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0, v2);
  uint64_t v4 = (char *)&v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v5 = objc_msgSend(self, sel_linkButton);
  objc_msgSend(v5, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  sub_25123DFF4(0, (unint64_t *)&unk_269B2B010);
  sub_25126C3D8();
  sub_2512547C8((uint64_t)v4);
  (*(void (**)(char *, uint64_t))(v1 + 8))(v4, v0);
  uint64_t v6 = (void *)sub_25126C458();
  swift_bridgeObjectRelease();
  objc_msgSend(v5, sel_setTitle_forState_, v6, 0);

  return v5;
}

id sub_25123F008()
{
  return objc_retain(*(id *)(v0
                           + OBJC_IVAR____TtCE21HearingModeSettingsUICSo35HMHearingAidAudiogramViewController29HearingAidAudiogramFooterView_button));
}

double sub_25123F018()
{
  return *(double *)(v0
                   + OBJC_IVAR____TtCE21HearingModeSettingsUICSo35HMHearingAidAudiogramViewController29HearingAidAudiogramFooterView_inputSize);
}

char *sub_25123F02C(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return sub_25123F060(a1);
}

char *sub_25123F060(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_25126C448();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4, v6);
  uint64_t v8 = (char *)v43 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = OBJC_IVAR____TtCE21HearingModeSettingsUICSo35HMHearingAidAudiogramViewController29HearingAidAudiogramFooterView_button;
  id v10 = self;
  Swift::String v11 = v2;
  id v12 = objc_msgSend(v10, sel_linkButton);
  objc_msgSend(v12, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  sub_25123DFF4(0, (unint64_t *)&unk_269B2B010);
  sub_25126C3D8();
  sub_2512547C8((uint64_t)v8);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  uint64_t v13 = (void *)sub_25126C458();
  swift_bridgeObjectRelease();
  objc_msgSend(v12, sel_setTitle_forState_, v13, 0);

  *(void *)&v2[v9] = v12;
  *(void *)&v11[OBJC_IVAR____TtCE21HearingModeSettingsUICSo35HMHearingAidAudiogramViewController29HearingAidAudiogramFooterView_inLabel] = a1;
  id v14 = a1;
  objc_msgSend(v14, sel_bounds);
  id v15 = &v11[OBJC_IVAR____TtCE21HearingModeSettingsUICSo35HMHearingAidAudiogramViewController29HearingAidAudiogramFooterView_inputSize];
  *(void *)id v15 = v16;
  *((void *)v15 + 1) = v17;

  LODWORD(v18) = 1148846080;
  objc_msgSend(v14, sel_setContentCompressionResistancePriority_forAxis_, 1, v18);
  id v19 = (objc_class *)_s29HearingAidAudiogramFooterViewCMa();
  v44.receiver = v11;
  v44.super_class = v19;
  uint64_t v20 = (char *)objc_msgSendSuper2(&v44, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  objc_msgSend(v20, sel_addSubview_, v14);
  uint64_t v21 = OBJC_IVAR____TtCE21HearingModeSettingsUICSo35HMHearingAidAudiogramViewController29HearingAidAudiogramFooterView_button;
  objc_msgSend(v20, sel_addSubview_, *(void *)&v20[OBJC_IVAR____TtCE21HearingModeSettingsUICSo35HMHearingAidAudiogramViewController29HearingAidAudiogramFooterView_button]);
  v43[0] = self;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_269B2B040);
  uint64_t v22 = swift_allocObject();
  *(_OWORD *)(v22 + 16) = xmmword_25126EDA0;
  id v23 = objc_msgSend(v14, sel_leadingAnchor);
  id v24 = objc_msgSend(v20, sel_leadingAnchor);
  id v25 = objc_msgSend(v23, sel_constraintEqualToAnchor_, v24);

  *(void *)(v22 + 32) = v25;
  id v26 = objc_msgSend(v14, sel_trailingAnchor);
  id v27 = objc_msgSend(v20, sel_trailingAnchor);
  id v28 = objc_msgSend(v26, sel_constraintEqualToAnchor_, v27);

  *(void *)(v22 + 40) = v28;
  id v29 = objc_msgSend(v14, sel_topAnchor);
  id v30 = objc_msgSend(v20, sel_topAnchor);
  id v31 = objc_msgSend(v29, sel_constraintEqualToAnchor_, v30);

  *(void *)(v22 + 48) = v31;
  id v32 = objc_msgSend(*(id *)&v20[v21], sel_topAnchor);
  id v33 = objc_msgSend(v14, sel_bottomAnchor);
  id v34 = objc_msgSend(v32, sel_constraintEqualToAnchor_constant_, v33, 2.0);

  *(void *)(v22 + 56) = v34;
  id v35 = objc_msgSend(*(id *)&v20[v21], sel_leadingAnchor);
  id v36 = objc_msgSend(v20, sel_leadingAnchor);
  id v37 = objc_msgSend(v35, sel_constraintEqualToAnchor_, v36);

  *(void *)(v22 + 64) = v37;
  id v38 = objc_msgSend(*(id *)&v20[v21], sel_bottomAnchor);
  id v39 = objc_msgSend(v20, sel_bottomAnchor);
  id v40 = objc_msgSend(v38, sel_constraintEqualToAnchor_, v39);

  *(void *)(v22 + 72) = v40;
  v43[1] = (id)v22;
  sub_25126C558();
  sub_25123DFF4(0, &qword_269B2AEB0);
  id v41 = (void *)sub_25126C528();
  swift_bridgeObjectRelease();
  objc_msgSend(v43[0], sel_activateConstraints_, v41);

  return v20;
}

uint64_t _s29HearingAidAudiogramFooterViewCMa()
{
  return self;
}

double sub_25123F654()
{
  v4.receiver = v0;
  v4.super_class = (Class)_s29HearingAidAudiogramFooterViewCMa();
  objc_msgSendSuper2(&v4, sel_intrinsicContentSize);
  double v2 = v1;
  objc_msgSend(*(id *)&v0[OBJC_IVAR____TtCE21HearingModeSettingsUICSo35HMHearingAidAudiogramViewController29HearingAidAudiogramFooterView_inLabel], sel_intrinsicContentSize);
  objc_msgSend(*(id *)&v0[OBJC_IVAR____TtCE21HearingModeSettingsUICSo35HMHearingAidAudiogramViewController29HearingAidAudiogramFooterView_button], sel_intrinsicContentSize);
  return v2;
}

id sub_25123F6D0()
{
  v9.receiver = v0;
  v9.super_class = (Class)_s29HearingAidAudiogramFooterViewCMa();
  objc_msgSendSuper2(&v9, sel_layoutSubviews);
  objc_msgSend(v0, sel_frame);
  double v2 = v1;
  double v4 = v3;
  objc_msgSend(v0, sel_frame);
  double v6 = v5;
  objc_msgSend(v0, sel_intrinsicContentSize);
  return objc_msgSend(v0, sel_setFrame_, v2, v4, v6, v7);
}

void sub_25123F858()
{
}

id sub_25123F8B8()
{
  v2.receiver = v0;
  v2.super_class = (Class)_s29HearingAidAudiogramFooterViewCMa();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

Swift::Void __swiftcall HMHearingAidAudiogramViewController.audiogramIngestionDidSaveAudiogram(_:)(HKAudiogramSample a1)
{
  objc_msgSend(v1, sel_insertAudiogram_, a1.super.super.super.isa);
}

id sub_25123F958()
{
  id v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F28EC0]), sel_initWithDelegate_, v0);
  objc_msgSend(v1, sel_setAnalyticsClient_, 2);
  return v1;
}

void __swiftcall HMHearingAidAudiogramViewController._tableFooterView(with:)(UIView *__return_ptr retstr, UILabel *with)
{
  [(UILabel *)with setTranslatesAutoresizingMaskIntoConstraints:0];
  id v3 = objc_allocWithZone((Class)_s29HearingAidAudiogramFooterViewCMa());
  double v4 = with;
  double v5 = sub_25123F060(v4);
  [(UILabel *)v4 bounds];
  objc_msgSend(v5, sel_setFrame_, 0.0, 0.0);

  objc_msgSend(v5, sel_layoutSubviews);
  double v6 = *(void **)&v5[OBJC_IVAR____TtCE21HearingModeSettingsUICSo35HMHearingAidAudiogramViewController29HearingAidAudiogramFooterView_button];
  sub_25123DFF4(0, &qword_269B2B050);
  uint64_t v7 = swift_allocObject();
  swift_unknownObjectWeakInit();
  id v8 = v6;
  objc_super v9 = (void *)sub_25126C728();
  objc_msgSend(v8, sel_addAction_forControlEvents_, v9, 64, 0, 0, 0, sub_2512416E8, v7);
}

Swift::Void __swiftcall HMHearingAidAudiogramViewController.traitCollectionDidChange(_:)(UITraitCollection_optional a1)
{
  v4.super_class = (Class)HMHearingAidAudiogramViewController;
  objc_msgSendSuper2(&v4, sel_traitCollectionDidChange_, a1.value.super.isa);
  id v2 = objc_msgSend(v1, sel_view);
  if (v2)
  {
    id v3 = v2;
    objc_msgSend(v2, sel_layoutIfNeeded);
  }
  else
  {
    __break(1u);
  }
}

uint64_t HMHearingAidAudiogramViewController.validAudiograms.getter()
{
  return sub_25123FDEC(MEMORY[0x263F42930], "validAudiograms early exit as we dont have a headphoneDevice no flow controller");
}

id sub_25123FD50(void *a1, uint64_t a2, void (*a3)(void))
{
  id v4 = a1;
  a3();

  sub_25123DFF4(0, &qword_269B2B100);
  double v5 = (void *)sub_25126C528();
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t HMHearingAidAudiogramViewController.invalidAudiograms.getter()
{
  return sub_25123FDEC(MEMORY[0x263F42938], "invalidAudiograms early exit as we dont have a headphoneDevice no flow controller");
}

uint64_t sub_25123FDEC(uint64_t (*a1)(void), const char *a2)
{
  double v5 = v2;
  uint64_t v6 = sub_25126C0E8();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6, v8);
  id v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v11 = objc_msgSend(v5, sel_flowController);
  if (v11)
  {
    id v12 = objc_msgSend(v11, sel_headphoneDevice);
    swift_unknownObjectRelease();
    uint64_t v13 = (void *)sub_25126BD68();
    uint64_t v14 = a1();

    return v14;
  }
  else
  {
    uint64_t v16 = sub_251250BE0();
    (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v10, v16, v6);
    uint64_t v17 = sub_25126C0C8();
    os_log_type_t v18 = sub_25126C638();
    if (os_log_type_enabled(v17, v18))
    {
      id v19 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v19 = 0;
      _os_log_impl(&dword_251222000, v17, v18, a2, v19, 2u);
      MEMORY[0x253399FB0](v19, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
    return MEMORY[0x263F8EE78];
  }
}

Swift::Void __swiftcall HMHearingAidAudiogramViewController.addDeviceLisenters()()
{
  id v1 = v0;
  uint64_t v2 = sub_25126C0E8();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2, v4);
  uint64_t v6 = (char *)&v38 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B2B058);
  uint64_t v40 = *(void *)(v7 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v7, v8);
  id v11 = (char *)&v38 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9, v12);
  uint64_t v14 = (char *)&v38 - v13;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B2B060);
  uint64_t v41 = *(void *)(v15 - 8);
  MEMORY[0x270FA5388](v15, v16);
  os_log_type_t v18 = (char *)&v38 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B2B068);
  uint64_t v42 = *(void *)(v19 - 8);
  uint64_t v43 = v19;
  MEMORY[0x270FA5388](v19, v20);
  uint64_t v22 = (char *)&v38 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v44 = v1;
  id v23 = objc_msgSend(v1, sel_flowController);
  if (v23)
  {
    uint64_t v39 = v15;
    id v24 = objc_msgSend(v23, sel_headphoneDevice);
    swift_unknownObjectRelease();
    if (!objc_msgSend(v44, sel_listener))
    {
      memset(v46, 0, sizeof(v46));
      sub_25123ECCC((uint64_t)v46);
      id v29 = (void *)sub_25126BD68();
      sub_25126BF38();

      uint64_t v30 = sub_25126C2B8();
      id v31 = *(void (**)(char *, uint64_t))(v40 + 8);
      v31(v14, v7);
      *(void *)&v46[0] = v30;
      id v32 = (void *)sub_25126BD68();
      sub_25126BE98();

      uint64_t v33 = sub_25126C2B8();
      v31(v11, v7);
      uint64_t v45 = v33;
      __swift_instantiateConcreteTypeFromMangledName(&qword_269B2B070);
      sub_25123E030(&qword_269B2B078, &qword_269B2B070);
      sub_25126C1E8();
      sub_25123E030(&qword_269B2B080, &qword_269B2B060);
      uint64_t v34 = v39;
      sub_25126C318();
      (*(void (**)(char *, uint64_t))(v41 + 8))(v18, v34);
      swift_allocObject();
      id v35 = v44;
      swift_unknownObjectWeakInit();
      sub_25123E030((unint64_t *)&unk_269B2B088, &qword_269B2B068);
      uint64_t v36 = v43;
      uint64_t v37 = sub_25126C338();
      swift_release();
      (*(void (**)(char *, uint64_t))(v42 + 8))(v22, v36);
      objc_msgSend(v35, sel_setListener_, v37);

      swift_release();
      return;
    }
    sub_25126C7A8();

    swift_unknownObjectRelease();
    sub_25123ECCC((uint64_t)v46);
  }
  uint64_t v25 = sub_251250BE0();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v6, v25, v2);
  id v26 = sub_25126C0C8();
  os_log_type_t v27 = sub_25126C638();
  if (os_log_type_enabled(v26, v27))
  {
    id v28 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v28 = 0;
    _os_log_impl(&dword_251222000, v26, v27, "addDeviceLisenters early exit as we dont have a headphoneDevice no flow controller", v28, 2u);
    MEMORY[0x253399FB0](v28, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
}

void sub_251240598()
{
  id v1 = v0;
  uint64_t v2 = sub_25126C0E8();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2, v4);
  uint64_t v6 = (char *)&v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v7 = objc_msgSend(v1, sel_flowController);
  if (v7)
  {
    id v21 = objc_msgSend(v7, sel_headphoneDevice);
    swift_unknownObjectRelease();
    id v8 = objc_msgSend(v1, sel_selectedSample);
    if (v8)
    {
      uint64_t v9 = v8;
      sub_25126BC68();
      sub_25124082C();
      id v10 = objc_msgSend(v1, sel_navigationController);
      if (v10)
      {
        id v11 = v10;
        uint64_t v12 = self;
        sub_25126BDA8();
        uint64_t v13 = (void *)sub_25126C458();
        swift_bridgeObjectRelease();
        id v14 = objc_msgSend(v12, sel_makeTestResultsControllerWithSample_bluetoothAddress_, v9, v13);

        objc_msgSend(v11, sel_pushViewController_animated_, v14, 1);
      }

      id v15 = v21;

      return;
    }
  }
  uint64_t v16 = sub_251250BE0();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v6, v16, v2);
  uint64_t v17 = sub_25126C0C8();
  os_log_type_t v18 = sub_25126C638();
  if (os_log_type_enabled(v17, v18))
  {
    uint64_t v19 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v19 = 0;
    _os_log_impl(&dword_251222000, v17, v18, "addDeviceLisenters early exit as we dont have a headphoneDevice no flow controller", v19, 2u);
    MEMORY[0x253399FB0](v19, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
}

void sub_25124082C()
{
  sub_25126BCA8();
  id v1 = (void *)sub_25126BC88();
  id v2 = objc_msgSend(v0, sel_flowController);
  if (v2)
  {
    id v3 = objc_msgSend(v2, sel_headphoneDevice);
    swift_unknownObjectRelease();
    uint64_t v4 = (void *)sub_25126BD58();

    id v5 = objc_msgSend(v4, sel_productID);
    sub_25124B5C8((uint64_t)v5);
  }
  sub_25126BC98();

  id v6 = (id)sub_25126BC88();
  sub_25126BC98();
}

Swift::Void __swiftcall HMHearingAidAudiogramViewController.refreshAudiogramList()()
{
  sub_25126BDF8();
  uint64_t v0 = (void *)sub_25126BDD8();
  id v1 = (void *)sub_25126BDE8();

  v3[4] = sub_251240A50;
  v3[5] = 0;
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 1107296256;
  v3[2] = sub_251240CB4;
  v3[3] = &block_descriptor;
  id v2 = _Block_copy(v3);
  objc_msgSend(v1, sel_triggerFetchAudiogramsWithCompletion_, v2);
  _Block_release(v2);
}

uint64_t sub_251240A50(void *a1)
{
  uint64_t v2 = sub_25126C0E8();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2, v4);
  id v6 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_25124B4BC();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v6, v7, v2);
  id v8 = a1;
  id v9 = a1;
  id v10 = sub_25126C0C8();
  os_log_type_t v11 = sub_25126C648();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = swift_slowAlloc();
    uint64_t v19 = v2;
    uint64_t v13 = (uint8_t *)v12;
    uint64_t v14 = swift_slowAlloc();
    *(_DWORD *)uint64_t v13 = 136315138;
    uint64_t v21 = v14;
    if (a1) {
      uint64_t v15 = 0x64656C696146;
    }
    else {
      uint64_t v15 = 0x6564656563637553;
    }
    if (a1) {
      unint64_t v16 = 0xE600000000000000;
    }
    else {
      unint64_t v16 = 0xE900000000000064;
    }
    uint64_t v20 = sub_251240E7C(v15, v16, &v21);
    sub_25126C768();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_251222000, v10, v11, "Audiogram Refresh: [HMHearingAidAudiogramViewController] Refresh Trigger %s", v13, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x253399FB0](v14, -1, -1);
    MEMORY[0x253399FB0](v13, -1, -1);

    return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v6, v19);
  }
  else
  {

    return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  }
}

void sub_251240CB4(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3(a2);
  swift_release();
}

Swift::Void __swiftcall HMHearingAidAudiogramViewController.setAGListResult()()
{
  sub_25126BC68();
  sub_25124082C();
}

uint64_t sub_251240E7C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_251240F50(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_2512419AC((uint64_t)v12, *a3);
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
      sub_2512419AC((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_251240F50(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_25126C778();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_25124110C(a5, a6);
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
  uint64_t v8 = sub_25126C838();
  if (!v8)
  {
    sub_25126C8A8();
    __break(1u);
LABEL_17:
    uint64_t result = sub_25126C918();
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

uint64_t sub_25124110C(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_2512411A4(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_251241384(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_251241384(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_2512411A4(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_25124131C(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_25126C7F8();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_25126C8A8();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_25126C4F8();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_25126C918();
    __break(1u);
LABEL_14:
    uint64_t result = sub_25126C8A8();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_25124131C(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B2B108);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  _OWORD v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_251241384(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_269B2B108);
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
  uint64_t result = sub_25126C918();
  __break(1u);
  return result;
}

void sub_2512414D4()
{
  id v1 = v0;
  uint64_t v2 = sub_25126C448();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2, v4);
  unint64_t v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = OBJC_IVAR____TtCE21HearingModeSettingsUICSo35HMHearingAidAudiogramViewController29HearingAidAudiogramFooterView_button;
  id v8 = objc_msgSend(self, sel_linkButton);
  objc_msgSend(v8, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  sub_25123DFF4(0, (unint64_t *)&unk_269B2B010);
  sub_25126C3D8();
  sub_2512547C8((uint64_t)v6);
  (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  int64_t v9 = (void *)sub_25126C458();
  swift_bridgeObjectRelease();
  objc_msgSend(v8, sel_setTitle_forState_, v9, 0);

  *(void *)&v1[v7] = v8;
  sub_25126C8B8();
  __break(1u);
}

uint64_t sub_2512416B0()
{
  swift_unknownObjectWeakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_2512416E8()
{
  swift_beginAccess();
  id v1 = (void *)MEMORY[0x25339A050](v0 + 16);
  if (v1)
  {
    uint64_t v2 = v1;
    id v3 = objc_msgSend(v1, sel_addAudiogramViewController);
    objc_msgSend(v2, sel_presentViewController_animated_completion_, v3, 1, 0);
  }
}

void sub_251241770()
{
  uint64_t v1 = v0 + 16;
  swift_beginAccess();
  uint64_t v2 = (void *)MEMORY[0x25339A050](v0 + 16);
  if (v2)
  {
    id v3 = v2;
    objc_msgSend(v2, sel_retrieveAndShowAudiograms);
  }
  swift_beginAccess();
  uint64_t v4 = (void *)MEMORY[0x25339A050](v1);
  if (v4)
  {
    uint64_t v5 = v4;
    id v6 = objc_msgSend(v4, sel_tableView);

    objc_msgSend(v6, sel_reloadData);
  }
  swift_beginAccess();
  uint64_t v7 = (void *)MEMORY[0x25339A050](v1);
  if (v7)
  {
    id v8 = v7;
    id v9 = objc_msgSend(v7, sel_view);

    if (!v9)
    {
      __break(1u);
      goto LABEL_13;
    }
    objc_msgSend(v9, sel_setNeedsLayout);
  }
  swift_beginAccess();
  uint64_t v10 = (void *)MEMORY[0x25339A050](v1);
  if (!v10) {
    return;
  }
  size_t v11 = v10;
  id v12 = objc_msgSend(v10, sel_view);

  if (!v12)
  {
LABEL_13:
    __break(1u);
    return;
  }
  objc_msgSend(v12, sel_layoutIfNeeded);
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

char *keypath_get_selector_flowController()
{
  return sel_flowController;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_25124190C(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_25124192C(uint64_t result, int a2, int a3)
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

void type metadata accessor for CGSize()
{
  if (!qword_269B2B0F8)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_269B2B0F8);
    }
  }
}

uint64_t sub_2512419AC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_251241A10(char a1)
{
  uint64_t v2 = sub_25126C448();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2, v4);
  id v6 = (char *)&v36 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_25126C428();
  MEMORY[0x270FA5388](v7 - 8, v8);
  if (a1)
  {
    if (a1 == 1)
    {
      LOBYTE(v38) = 1;
      sub_25126C3D8();
      uint64_t v37 = sub_2512547C8((uint64_t)v6);
      uint64_t v10 = v9;
      size_t v11 = *(void (**)(char *, uint64_t))(v3 + 8);
      v11(v6, v2);
      LOBYTE(v38) = 1;
      sub_25126C3D8();
      uint64_t v12 = sub_2512547C8((uint64_t)v6);
      uint64_t v14 = v13;
      v11(v6, v2);
      type metadata accessor for TableSectionViewModel();
      uint64_t v15 = swift_allocObject();
      uint64_t v16 = v37;
      uint64_t v17 = v10;
      uint64_t v18 = v12;
      uint64_t v19 = v14;
      int v20 = 1;
    }
    else
    {
      LOBYTE(v38) = 2;
      sub_25126C3D8();
      uint64_t v37 = sub_2512547C8((uint64_t)v6);
      uint64_t v30 = v29;
      id v31 = *(void (**)(char *, uint64_t))(v3 + 8);
      v31(v6, v2);
      LOBYTE(v38) = 2;
      sub_25126C3D8();
      uint64_t v32 = sub_2512547C8((uint64_t)v6);
      uint64_t v34 = v33;
      v31(v6, v2);
      type metadata accessor for TableSectionViewModel();
      uint64_t v15 = swift_allocObject();
      uint64_t v16 = v37;
      uint64_t v17 = v30;
      uint64_t v18 = v32;
      uint64_t v19 = v34;
      int v20 = 2;
    }
  }
  else
  {
    char v39 = 0;
    sub_25126C418();
    sub_25126C408();
    uint64_t v38 = *MEMORY[0x263F0AD50];
    uint64_t v21 = v38;
    sub_25126C3E8();
    sub_25126C408();
    sub_25126C438();
    uint64_t v22 = sub_2512547C8((uint64_t)v6);
    uint64_t v24 = v23;
    uint64_t v25 = *(void (**)(char *, uint64_t))(v3 + 8);
    v25(v6, v2);
    char v39 = 0;
    sub_25126C418();
    sub_25126C408();
    uint64_t v38 = v21;
    sub_25126C3E8();
    sub_25126C408();
    sub_25126C438();
    uint64_t v26 = sub_2512547C8((uint64_t)v6);
    uint64_t v28 = v27;
    v25(v6, v2);
    type metadata accessor for TableSectionViewModel();
    uint64_t v15 = swift_allocObject();
    uint64_t v16 = v22;
    uint64_t v17 = v24;
    uint64_t v18 = v26;
    uint64_t v19 = v28;
    int v20 = 0;
  }
  sub_251242F64(v16, v17, v18, v19, v20);
  return v15;
}

uint64_t sub_251241EB4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  uint64_t v10 = swift_allocObject();
  sub_251242F64(a1, a2, a3, a4, a5);
  return v10;
}

uint64_t type metadata accessor for TableSectionViewModel()
{
  uint64_t result = qword_269B2C2D0;
  if (!qword_269B2C2D0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_251241F70()
{
  uint64_t v0 = sub_25126C448();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0, v2);
  uint64_t v4 = (char *)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for TableSectionViewModel();
  sub_25126C3D8();
  uint64_t v5 = sub_2512547C8((uint64_t)v4);
  (*(void (**)(char *, uint64_t))(v1 + 8))(v4, v0);
  return v5;
}

BOOL sub_251242088(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

uint64_t sub_251242098()
{
  return sub_25126C9D8();
}

uint64_t sub_2512420C0()
{
  return sub_25126C9E8();
}

BOOL sub_251242108(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_251242120()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_251242150()
{
  uint64_t v1 = *(void *)(v0 + 32);
  swift_bridgeObjectRetain();
  return v1;
}

void *sub_251242180()
{
  return &unk_2702146D8;
}

uint64_t sub_25124218C()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_251242194()
{
  return *(unsigned __int8 *)(v0 + 56);
}

id sub_2512421A0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  if (a3)
  {
    id v6 = (void *)sub_25126C458();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v6 = 0;
  }
  id v7 = objc_msgSend(objc_allocWithZone(v4), sel_initWithStyle_reuseIdentifier_, a1, v6);

  return v7;
}

id sub_25124221C()
{
  swift_beginAccess();
  uint64_t v1 = *(void **)(v0 + 64);
  return v1;
}

void sub_251242260(uint64_t a1)
{
  swift_beginAccess();
  uint64_t v3 = *(void **)(v1 + 64);
  *(void *)(v1 + 64) = a1;
}

uint64_t (*sub_2512422A8())()
{
  return j_j__swift_endAccess;
}

id sub_2512422FC()
{
  id v0 = objc_allocWithZone((Class)type metadata accessor for BinaryConfirmationSelectTableViewCell());
  return objc_msgSend(v0, sel_initWithStyle_reuseIdentifier_, 3, 0);
}

id sub_251242338()
{
  swift_beginAccess();
  uint64_t v1 = *(void **)(v0 + 72);
  return v1;
}

void sub_25124237C(uint64_t a1)
{
  swift_beginAccess();
  uint64_t v3 = *(void **)(v1 + 72);
  *(void *)(v1 + 72) = a1;
}

uint64_t (*sub_2512423C4())()
{
  return j__swift_endAccess;
}

void *sub_251242418(char a1)
{
  uint64_t v2 = a1 & 1;
  uint64_t v3 = *v1;
  if (a1) {
    uint64_t v4 = (void *)(*(uint64_t (**)(void))(v3 + 160))();
  }
  else {
    uint64_t v4 = (void *)(*(uint64_t (**)(void))(v3 + 136))();
  }
  uint64_t v5 = v4;
  (*(void (**)(uint64_t))((*MEMORY[0x263F8EED0] & *v4) + 0x88))(v2);
  return v5;
}

uint64_t sub_2512424C8()
{
  return sub_25126C268();
}

void sub_251242510()
{
  uint64_t v1 = v0;
  char v2 = (*(uint64_t (**)(void))(*(void *)v0 + 192))();
  if (v2 != 2)
  {
    char v3 = v2;
    uint64_t v4 = (void *)(*(uint64_t (**)(void))(*(void *)v0 + 136))();
    uint64_t v5 = (void *)MEMORY[0x263F8EED0];
    id v6 = *(void (**)(uint64_t))((*MEMORY[0x263F8EED0] & *v4) + 0xA0);
    if (v3)
    {
      v6(0);

      id v7 = (void *)(*(uint64_t (**)(void))(*(void *)v1 + 160))();
      uint64_t v8 = *(void (**)(uint64_t))((*v5 & *v7) + 0xA0);
      uint64_t v9 = 1;
    }
    else
    {
      v6(1);

      id v7 = (void *)(*(uint64_t (**)(void))(*(void *)v1 + 160))();
      uint64_t v8 = *(void (**)(uint64_t))((*v5 & *v7) + 0xA0);
      uint64_t v9 = 0;
    }
    id v10 = v7;
    v8(v9);
  }
}

uint64_t sub_2512426D4()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_25126C298();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_251242748@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 192))();
  *a2 = result;
  return result;
}

uint64_t sub_251242794(unsigned __int8 *a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(**(void **)a2 + 200))(*a1);
}

void sub_2512427DC()
{
}

void (*sub_251242850(uint64_t a1))(uint64_t a1)
{
  *(void *)a1 = v1;
  swift_getKeyPath();
  swift_getKeyPath();
  sub_25126C298();
  swift_release();
  swift_release();
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a1 + 9);
  return sub_2512428F0;
}

void sub_2512428F0(uint64_t a1)
{
  char v2 = *(unsigned char *)(a1 + 8);
  swift_getKeyPath();
  swift_getKeyPath();
  *(unsigned char *)(a1 + 9) = v2;
  swift_retain();
  sub_25126C2A8();
  sub_251242510();
}

uint64_t sub_251242970()
{
  return 2;
}

uint64_t sub_251242978()
{
  return swift_endAccess();
}

uint64_t sub_2512429DC(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B2B190);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2, v4);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))((char *)&v7 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v2);
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B2B188);
  sub_25126C288();
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(a1, v2);
}

void (*sub_251242B08(void *a1))(uint64_t a1, char a2)
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B2B190);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  uint64_t v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC21HearingModeSettingsUI21TableSectionViewModel__selectedState;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_269B2B188);
  sub_25126C278();
  swift_endAccess();
  return sub_251242C18;
}

void sub_251242C18(uint64_t a1, char a2)
{
  uint64_t v3 = *(void **)a1;
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
    sub_25126C288();
    swift_endAccess();
    id v10 = *(void (**)(void *, uint64_t))(v9 + 8);
    v10(v7, v8);
    v10(v5, v8);
  }
  else
  {
    swift_beginAccess();
    sub_25126C288();
    swift_endAccess();
    (*(void (**)(void *, uint64_t))(v9 + 8))(v5, v8);
  }
  free(v5);
  free(v7);
  free(v6);
  free(v3);
}

id sub_251242D88()
{
  uint64_t v1 = sub_25126C448();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1, v3);
  uint64_t v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_251241A10(*(unsigned char *)(v0 + 56));
  swift_bridgeObjectRetain();
  swift_release();
  size_t v6 = (void *)sub_25126C458();
  swift_bridgeObjectRelease();
  id v7 = objc_msgSend(self, sel_alertControllerWithTitle_message_preferredStyle_, v6, 0, 1);

  uint64_t v12 = v0;
  sub_25126C3D8();
  type metadata accessor for TableSectionViewModel();
  sub_2512547C8((uint64_t)v5);
  (*(void (**)(char *, uint64_t))(v2 + 8))(v5, v1);
  uint64_t v8 = (void *)sub_25126C458();
  swift_bridgeObjectRelease();
  id v9 = objc_msgSend(self, sel_actionWithTitle_style_handler_, v8, 0, 0);

  objc_msgSend(v7, sel_addAction_, v9);
  return v7;
}

uint64_t sub_251242F64(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  int v19 = a5;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B2B188);
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10, v12);
  uint64_t v14 = (char *)&v18 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)(v5 + 48) = &unk_2702146B0;
  uint64_t v15 = (objc_class *)type metadata accessor for BinaryConfirmationSelectTableViewCell();
  *(void *)(v5 + 64) = objc_msgSend(objc_allocWithZone(v15), sel_initWithStyle_reuseIdentifier_, 3, 0);
  *(void *)(v5 + 72) = objc_msgSend(objc_allocWithZone(v15), sel_initWithStyle_reuseIdentifier_, 3, 0);
  uint64_t v16 = v5 + OBJC_IVAR____TtC21HearingModeSettingsUI21TableSectionViewModel__selectedState;
  char v20 = 2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B2B180);
  sub_25126C268();
  (*(void (**)(uint64_t, char *, uint64_t))(v11 + 32))(v16, v14, v10);
  *(void *)(v5 + 16) = a1;
  *(void *)(v5 + 24) = a2;
  *(void *)(v5 + 32) = a3;
  *(void *)(v5 + 40) = a4;
  *(unsigned char *)(v5 + 56) = v19;
  return v5;
}

uint64_t type metadata accessor for BinaryConfirmationSelectTableViewCell()
{
  return self;
}

uint64_t sub_251243108()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  uint64_t v1 = v0 + OBJC_IVAR____TtC21HearingModeSettingsUI21TableSectionViewModel__selectedState;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B2B188);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t sub_251243198()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  uint64_t v1 = (char *)v0 + OBJC_IVAR____TtC21HearingModeSettingsUI21TableSectionViewModel__selectedState;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B2B188);
  (*(void (**)(char *, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = *((unsigned int *)*v0 + 12);
  uint64_t v4 = *((unsigned __int16 *)*v0 + 26);
  return MEMORY[0x270FA0228](v0, v3, v4);
}

uint64_t sub_251243264@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for TableSectionViewModel();
  uint64_t result = sub_25126C248();
  *a1 = result;
  return result;
}

const char *sub_2512432A4()
{
  return "circle";
}

uint64_t sub_2512432B0()
{
  return 0x656C63726963;
}

void *sub_2512432C4()
{
  return &unk_265364418;
}

unint64_t sub_2512432D0()
{
  return 0xD000000000000015;
}

id sub_2512432EC()
{
  id result = objc_msgSend(self, sel_tertiaryLabelColor);
  qword_269B2D468 = (uint64_t)result;
  return result;
}

uint64_t *sub_251243328()
{
  if (qword_269B2C030 != -1) {
    swift_once();
  }
  return &qword_269B2D468;
}

id sub_251243374()
{
  if (qword_269B2C030 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)qword_269B2D468;
  return v0;
}

uint64_t *sub_2512433D0()
{
  return &qword_269B2B170;
}

uint64_t sub_2512433DC()
{
  swift_beginAccess();
  uint64_t v0 = qword_269B2B170;
  swift_bridgeObjectRetain();
  return v0;
}

uint64_t sub_251243430(uint64_t a1, long long *a2)
{
  qword_269B2B170 = a1;
  off_269B2B178 = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_25124348C())()
{
  return j_j__swift_endAccess;
}

void sub_2512434E4()
{
  uint64_t v0 = (void *)sub_25126C458();
  id v1 = objc_msgSend(self, sel_systemImageNamed_, v0);

  if (!v1) {
    __break(1u);
  }
}

id sub_251243550()
{
  id v1 = (void **)(v0 + OBJC_IVAR____TtC21HearingModeSettingsUI37BinaryConfirmationSelectTableViewCell_accessoryImage);
  swift_beginAccess();
  uint64_t v2 = *v1;
  return v2;
}

void sub_2512435A8(void *a1)
{
  uint64_t v3 = (void **)(v1 + OBJC_IVAR____TtC21HearingModeSettingsUI37BinaryConfirmationSelectTableViewCell_accessoryImage);
  swift_beginAccess();
  uint64_t v4 = *v3;
  void *v3 = a1;
}

uint64_t (*sub_2512435FC())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_251243658()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC21HearingModeSettingsUI37BinaryConfirmationSelectTableViewCell_itemState);
  swift_beginAccess();
  return *v1;
}

void sub_2512436A0(unsigned __int8 a1)
{
  int v3 = a1;
  uint64_t v4 = sub_25126C448();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4, v6);
  uint64_t v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v9 = &v1[OBJC_IVAR____TtC21HearingModeSettingsUI37BinaryConfirmationSelectTableViewCell_itemState];
  swift_beginAccess();
  char *v9 = a1;
  if (v3 != 2)
  {
    id v10 = objc_msgSend(v1, sel_textLabel);
    if (v10)
    {
      uint64_t v11 = v10;
      type metadata accessor for TableSectionViewModel();
      sub_25126C3D8();
      sub_2512547C8((uint64_t)v8);
      (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
      uint64_t v12 = (void *)sub_25126C458();
      swift_bridgeObjectRelease();
      objc_msgSend(v11, sel_setText_, v12);
    }
  }
}

void (*sub_251243844(void *a1))(void *a1, char a2)
{
  int v3 = malloc(0x40uLL);
  *a1 = v3;
  v3[3] = v1;
  uint64_t v4 = sub_25126C448();
  v3[4] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[5] = v5;
  uint64_t v6 = malloc(*(void *)(v5 + 64));
  uint64_t v7 = OBJC_IVAR____TtC21HearingModeSettingsUI37BinaryConfirmationSelectTableViewCell_itemState;
  void v3[6] = v6;
  v3[7] = v7;
  swift_beginAccess();
  return sub_251243910;
}

void sub_251243910(void *a1, char a2)
{
  int v3 = (void *)*a1;
  swift_endAccess();
  if ((a2 & 1) == 0)
  {
    uint64_t v4 = (void *)v3[3];
    if (*((unsigned char *)v4 + v3[7]) != 2)
    {
      id v5 = objc_msgSend(v4, sel_textLabel);
      if (v5)
      {
        uint64_t v6 = v5;
        uint64_t v8 = v3[5];
        uint64_t v7 = v3[6];
        uint64_t v9 = v3[4];
        type metadata accessor for TableSectionViewModel();
        sub_25126C3D8();
        sub_2512547C8(v7);
        (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v7, v9);
        id v10 = (void *)sub_25126C458();
        swift_bridgeObjectRelease();
        objc_msgSend(v6, sel_setText_, v10);
      }
    }
  }
  free((void *)v3[6]);
  free(v3);
}

uint64_t sub_251243A48()
{
  return 0;
}

void sub_251243A50()
{
  uint64_t v1 = (char *)v0 + OBJC_IVAR____TtC21HearingModeSettingsUI37BinaryConfirmationSelectTableViewCell_accessoryIsSelected;
  swift_beginAccess();
  if (*v1 == 1)
  {
    uint64_t v2 = (void *)sub_25126C458();
    id v3 = objc_msgSend(self, sel_systemImageNamed_, v2);

    if (v3)
    {
LABEL_5:
      (*(void (**)(id))((*MEMORY[0x263F8EED0] & *v0) + 0x70))(v3);
      sub_251243CB8();
      return;
    }
    __break(1u);
  }
  uint64_t v4 = (void *)sub_25126C458();
  id v3 = objc_msgSend(self, sel_systemImageNamed_, v4);

  if (v3) {
    goto LABEL_5;
  }
  __break(1u);
}

uint64_t sub_251243B84()
{
  uint64_t v1 = (unsigned __int8 *)(v0
                         + OBJC_IVAR____TtC21HearingModeSettingsUI37BinaryConfirmationSelectTableViewCell_accessoryIsSelected);
  swift_beginAccess();
  return *v1;
}

void sub_251243BCC(char a1)
{
  id v3 = (unsigned char *)(v1 + OBJC_IVAR____TtC21HearingModeSettingsUI37BinaryConfirmationSelectTableViewCell_accessoryIsSelected);
  swift_beginAccess();
  unsigned char *v3 = a1;
  sub_251243A50();
}

void (*sub_251243C24(uint64_t a1))(uint64_t a1, char a2)
{
  *(void *)(a1 + 24) = v1;
  swift_beginAccess();
  return sub_251243C84;
}

void sub_251243C84(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    sub_251243A50();
  }
}

void sub_251243CB8()
{
  id v1 = objc_msgSend(self, sel_preferredFontForTextStyle_, *MEMORY[0x263F83570]);
  objc_msgSend(v1, sel_pointSize);
  id v3 = objc_msgSend(self, sel_configurationWithPointSize_weight_scale_, 4, 3, v2);
  uint64_t v4 = (void *)MEMORY[0x263F8EED0];
  id v5 = (void *)(*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x68))();
  id v12 = objc_msgSend(v5, sel_imageWithConfiguration_, v3);

  id v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82828]), sel_initWithImage_, v12);
  if ((*(uint64_t (**)(void))((*v4 & *v0) + 0x98))())
  {
    id v7 = objc_msgSend(v0, sel_tintColor);
  }
  else
  {
    if (qword_269B2C030 != -1) {
      swift_once();
    }
    id v7 = (id)qword_269B2D468;
  }
  uint64_t v8 = v7;
  objc_msgSend(v6, sel_setTintColor_, v7);

  objc_msgSend(v0, sel_setAccessoryView_, v6);
  id v9 = objc_msgSend(v0, sel_textLabel);
  if (v9)
  {
    id v10 = v9;
    id v11 = v1;
    objc_msgSend(v10, sel_setFont_, v11);

    id v3 = v11;
  }
}

void sub_251243EFC(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

id sub_251243F70()
{
  return sub_2512461E4(type metadata accessor for BinaryConfirmationSelectTableViewCell);
}

uint64_t sub_251243F98()
{
  uint64_t v1 = OBJC_IVAR____TtC21HearingModeSettingsUI36HearingAidUserAgeCheckViewController____lazy_storage___sections;
  if (*(void *)(v0
                 + OBJC_IVAR____TtC21HearingModeSettingsUI36HearingAidUserAgeCheckViewController____lazy_storage___sections))
  {
    uint64_t v2 = *(void *)(v0
                   + OBJC_IVAR____TtC21HearingModeSettingsUI36HearingAidUserAgeCheckViewController____lazy_storage___sections);
  }
  else
  {
    uint64_t v2 = sub_251244000(v0);
    *(void *)(v0 + v1) = v2;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_251244000(uint64_t a1)
{
  uint64_t v109 = a1;
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B2ADF0);
  MEMORY[0x270FA5388](v1 - 8, v2);
  v99 = (char *)&v82 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v95 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B2B200);
  uint64_t v96 = *(void *)(v95 - 8);
  MEMORY[0x270FA5388](v95, v4);
  v94 = (char *)&v82 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B2B208);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v100 = v6;
  uint64_t v101 = v7;
  MEMORY[0x270FA5388](v6, v8);
  v97 = (char *)&v82 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B2B210);
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v102 = v10;
  uint64_t v103 = v11;
  MEMORY[0x270FA5388](v10, v12);
  v98 = (char *)&v82 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v110 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B2B190);
  uint64_t v113 = *(void *)(v110 - 8);
  uint64_t v15 = MEMORY[0x270FA5388](v110, v14);
  v93 = (char *)&v82 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = MEMORY[0x270FA5388](v15, v17);
  v92 = (char *)&v82 - v19;
  MEMORY[0x270FA5388](v18, v20);
  v82 = (char *)&v82 - v21;
  uint64_t v88 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B2B218);
  uint64_t v114 = *(void *)(v88 - 8);
  MEMORY[0x270FA5388](v88, v22);
  v86 = (char *)&v82 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = sub_25126C448();
  uint64_t v25 = *(void *)(v24 - 8);
  MEMORY[0x270FA5388](v24, v26);
  uint64_t v28 = (char *)&v82 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  v112 = (void *)sub_251241A10(0);
  LOBYTE(v116) = 1;
  sub_25126C3D8();
  uint64_t v29 = sub_2512547C8((uint64_t)v28);
  uint64_t v31 = v30;
  uint64_t v32 = *(void (**)(char *, uint64_t))(v25 + 8);
  v32(v28, v24);
  LOBYTE(v116) = 1;
  sub_25126C3D8();
  uint64_t v33 = sub_2512547C8((uint64_t)v28);
  uint64_t v35 = v34;
  v32(v28, v24);
  type metadata accessor for TableSectionViewModel();
  v111 = (void *)swift_allocObject();
  sub_251242F64(v29, v31, v33, v35, 1);
  LOBYTE(v116) = 2;
  sub_25126C3D8();
  v108 = (void (*)(char *, uint64_t))sub_2512547C8((uint64_t)v28);
  uint64_t v37 = v36;
  v32(v28, v24);
  LOBYTE(v116) = 2;
  sub_25126C3D8();
  uint64_t v38 = sub_2512547C8((uint64_t)v28);
  uint64_t v40 = v39;
  v32(v28, v24);
  uint64_t v87 = swift_allocObject();
  uint64_t v41 = sub_251242F64((uint64_t)v108, v37, v38, v40, 2);
  uint64_t v42 = (void (**)(uint64_t))(*v112 + 216);
  v89 = *v42;
  v90 = v42;
  uint64_t v43 = v82;
  v89(v41);
  uint64_t v44 = v110;
  uint64_t v45 = sub_25126C2B8();
  id v46 = *(void (**)(char *, uint64_t))(v113 + 8);
  v113 += 8;
  v108 = v46;
  v46(v43, v44);
  uint64_t v116 = v45;
  uint64_t v107 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B2B220);
  uint64_t v91 = MEMORY[0x263EFDCF8];
  uint64_t v106 = sub_25123E030(&qword_269B2B228, &qword_269B2B220);
  id v47 = v86;
  sub_25126C318();
  swift_release();
  uint64_t v48 = swift_allocObject();
  swift_weakInit();
  uint64_t v49 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v50 = swift_allocObject();
  *(void *)(v50 + 16) = v48;
  *(void *)(v50 + 24) = v49;
  uint64_t v105 = sub_25123E030(&qword_269B2B230, &qword_269B2B218);
  uint64_t v51 = v88;
  sub_25126C338();
  swift_release();
  v104 = *(void (**)(char *, uint64_t))(v114 + 8);
  v114 += 8;
  v104(v47, v51);
  swift_beginAccess();
  sub_25126C228();
  swift_endAccess();
  uint64_t v52 = swift_release();
  v53 = (void (**)(uint64_t))(*v111 + 216);
  v84 = *v53;
  v85 = v53;
  v84(v52);
  uint64_t v54 = v110;
  uint64_t v55 = sub_25126C2B8();
  v108(v43, v54);
  uint64_t v116 = v55;
  sub_25126C318();
  swift_release();
  uint64_t v56 = swift_allocObject();
  swift_weakInit();
  uint64_t v57 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v58 = swift_allocObject();
  *(void *)(v58 + 16) = v56;
  *(void *)(v58 + 24) = v57;
  sub_25126C338();
  swift_release();
  v104(v47, v51);
  swift_beginAccess();
  sub_25126C228();
  swift_endAccess();
  uint64_t v59 = swift_release();
  uint64_t v60 = v87;
  v83 = *(void (**)(uint64_t))(*(void *)v87 + 216);
  v83(v59);
  uint64_t v61 = sub_25126C2B8();
  v108(v43, v54);
  uint64_t v116 = v61;
  sub_25126C318();
  swift_release();
  uint64_t v62 = swift_allocObject();
  uint64_t v63 = v60;
  swift_weakInit();
  uint64_t v64 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v65 = swift_allocObject();
  *(void *)(v65 + 16) = v62;
  *(void *)(v65 + 24) = v64;
  sub_25126C338();
  swift_release();
  v104(v47, v51);
  swift_beginAccess();
  sub_25126C228();
  swift_endAccess();
  uint64_t v66 = swift_release();
  uint64_t v67 = ((uint64_t (*)(uint64_t))v89)(v66);
  uint64_t v68 = ((uint64_t (*)(uint64_t))v84)(v67);
  v83(v68);
  sub_25123E030(&qword_269B2B238, &qword_269B2B190);
  v69 = v94;
  sub_25126C1F8();
  sub_25123E030((unint64_t *)&unk_269B2B240, &qword_269B2B200);
  uint64_t v70 = v95;
  v71 = v69;
  uint64_t v72 = sub_25126C2D8();
  (*(void (**)(char *, uint64_t))(v96 + 8))(v71, v70);
  uint64_t v116 = v72;
  sub_25123DFF4(0, &qword_269B2AE18);
  id v115 = (id)sub_25126C6D8();
  uint64_t v73 = sub_25126C698();
  uint64_t v74 = (uint64_t)v99;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v73 - 8) + 56))(v99, 1, 1, v73);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B2B250);
  sub_25123E030(&qword_269B2B258, &qword_269B2B250);
  sub_25123B87C();
  Class v75 = v97;
  sub_25126C2F8();
  sub_251247880(v74);

  swift_release();
  sub_25123E030(&qword_269B2B268, &qword_269B2B208);
  v76 = v98;
  uint64_t v77 = v100;
  sub_25126C2E8();
  (*(void (**)(char *, uint64_t))(v101 + 8))(v75, v77);
  swift_getKeyPath();
  uint64_t v116 = v109;
  sub_25123E030((unint64_t *)&unk_269B2B270, &qword_269B2B210);
  uint64_t v78 = v102;
  sub_25126C348();
  swift_release();
  (*(void (**)(char *, uint64_t))(v103 + 8))(v76, v78);
  swift_beginAccess();
  sub_25126C228();
  swift_endAccess();
  swift_release();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_269B2B040);
  uint64_t v79 = swift_allocObject();
  *(_OWORD *)(v79 + 16) = xmmword_25126EE60;
  v80 = v111;
  *(void *)(v79 + 32) = v112;
  *(void *)(v79 + 40) = v80;
  *(void *)(v79 + 48) = v63;
  uint64_t v116 = v79;
  sub_25126C558();
  return v116;
}

unsigned __int8 *sub_251244E88@<X0>(unsigned __int8 *result@<X0>, BOOL *a2@<X8>)
{
  int v2 = *result;
  BOOL v6 = (v2 & 1) == 0 && v2 != 2 && result[1] != 2 && result[2] != 2;
  *a2 = v6;
  return result;
}

uint64_t sub_251244EB0@<X0>(void **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & **a1) + 0xA8))();
  *a2 = result;
  return result;
}

void sub_251244F0C(void **a1, void *a2)
{
  int v2 = *a1;
  id v4 = *(id *)(*a2
             + OBJC_IVAR____TtC21HearingModeSettingsUI36HearingAidUserAgeCheckViewController____lazy_storage___continueButton);
  *(void *)(*a2
            + OBJC_IVAR____TtC21HearingModeSettingsUI36HearingAidUserAgeCheckViewController____lazy_storage___continueButton) = *a1;
  id v3 = v2;
}

id sub_251244F5C@<X0>(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_isEnabled);
  *a2 = (_BYTE)result;
  return result;
}

id sub_251244F90(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setEnabled_, *a1);
}

uint64_t sub_251245000()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC21HearingModeSettingsUI36HearingAidUserAgeCheckViewController_delegate;
  swift_beginAccess();
  return MEMORY[0x25339A050](v1);
}

uint64_t sub_2512450A0()
{
  return swift_unknownObjectRelease();
}

void (*sub_2512450FC(void *a1))(void **a1, char a2)
{
  id v3 = malloc(0x30uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR____TtC21HearingModeSettingsUI36HearingAidUserAgeCheckViewController_delegate;
  v3[4] = v1;
  v3[5] = v4;
  uint64_t v5 = v1 + v4;
  swift_beginAccess();
  v3[3] = MEMORY[0x25339A050](v5);
  return sub_251245180;
}

void sub_251245180(void **a1, char a2)
{
  id v3 = *a1;
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

id sub_251245200()
{
  uint64_t v1 = OBJC_IVAR____TtC21HearingModeSettingsUI36HearingAidUserAgeCheckViewController____lazy_storage___continueButton;
  int v2 = *(void **)(v0
                + OBJC_IVAR____TtC21HearingModeSettingsUI36HearingAidUserAgeCheckViewController____lazy_storage___continueButton);
  if (v2)
  {
    id v3 = *(id *)(v0
               + OBJC_IVAR____TtC21HearingModeSettingsUI36HearingAidUserAgeCheckViewController____lazy_storage___continueButton);
  }
  else
  {
    id v4 = sub_251245264(v0);
    uint64_t v5 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v4;
    id v3 = v4;

    int v2 = 0;
  }
  id v6 = v2;
  return v3;
}

id sub_251245264(uint64_t a1)
{
  uint64_t v2 = sub_25126C448();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2, v4);
  id v6 = (char *)v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v7 = objc_msgSend(self, sel_boldButton);
  v10[1] = a1;
  sub_25126C3D8();
  type metadata accessor for HearingAidUserAgeCheckViewController();
  sub_2512547C8((uint64_t)v6);
  (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  uint64_t v8 = (void *)sub_25126C458();
  swift_bridgeObjectRelease();
  objc_msgSend(v7, sel_setTitle_forState_, v8, 0);

  objc_msgSend(v7, sel_setEnabled_, 0);
  objc_msgSend(v7, sel_addTarget_action_forControlEvents_, a1, sel_continueButtonTapped_, 64);
  return v7;
}

uint64_t sub_251245408(uint64_t a1)
{
  *(void *)(v1
            + OBJC_IVAR____TtC21HearingModeSettingsUI36HearingAidUserAgeCheckViewController____lazy_storage___continueButton) = a1;
  return MEMORY[0x270F9A758]();
}

id sub_25124541C()
{
  uint64_t v1 = OBJC_IVAR____TtC21HearingModeSettingsUI36HearingAidUserAgeCheckViewController____lazy_storage___cancelButton;
  uint64_t v2 = *(void **)(v0
                + OBJC_IVAR____TtC21HearingModeSettingsUI36HearingAidUserAgeCheckViewController____lazy_storage___cancelButton);
  if (v2)
  {
    id v3 = *(id *)(v0
               + OBJC_IVAR____TtC21HearingModeSettingsUI36HearingAidUserAgeCheckViewController____lazy_storage___cancelButton);
  }
  else
  {
    id v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F824A8]), sel_initWithBarButtonSystemItem_target_action_, 1, v0, sel_cancelButtonTapped_);
    uint64_t v5 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v4;
    id v3 = v4;

    uint64_t v2 = 0;
  }
  id v6 = v2;
  return v3;
}

uint64_t sub_2512454A4(uint64_t a1)
{
  *(void *)(v1
            + OBJC_IVAR____TtC21HearingModeSettingsUI36HearingAidUserAgeCheckViewController____lazy_storage___cancelButton) = a1;
  return MEMORY[0x270F9A758]();
}

id sub_2512454B8()
{
  id v1 = objc_allocWithZone(v0);
  return sub_2512454E4();
}

id sub_2512454E4()
{
  id v1 = v0;
  swift_getObjectType();
  uint64_t v2 = sub_25126C448();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2, v4);
  id v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)&v0[OBJC_IVAR____TtC21HearingModeSettingsUI36HearingAidUserAgeCheckViewController____lazy_storage___sections] = 0;
  swift_unknownObjectWeakInit();
  *(void *)&v0[OBJC_IVAR____TtC21HearingModeSettingsUI36HearingAidUserAgeCheckViewController____lazy_storage___continueButton] = 0;
  *(void *)&v0[OBJC_IVAR____TtC21HearingModeSettingsUI36HearingAidUserAgeCheckViewController____lazy_storage___cancelButton] = 0;
  *(void *)&v0[OBJC_IVAR____TtC21HearingModeSettingsUI36HearingAidUserAgeCheckViewController_listeners] = MEMORY[0x263F8EE88];
  sub_25126C3D8();
  sub_2512547C8((uint64_t)v6);
  id v7 = *(void (**)(char *, uint64_t))(v3 + 8);
  v7(v6, v2);
  uint64_t v8 = (void *)sub_25126C458();
  swift_bridgeObjectRelease();
  sub_25126C3D8();
  sub_2512547C8((uint64_t)v6);
  v7(v6, v2);
  uint64_t v9 = (void *)sub_25126C458();
  swift_bridgeObjectRelease();
  uint64_t v10 = (objc_class *)type metadata accessor for HearingAidUserAgeCheckViewController();
  v13.receiver = v1;
  v13.super_class = v10;
  id v11 = objc_msgSendSuper2(&v13, sel_initWithTitle_detailText_icon_adoptTableViewScrollView_, v8, v9, 0, 1);

  return v11;
}

uint64_t sub_251245710()
{
  return MEMORY[0x263F8EE88];
}

void sub_25124571C()
{
  id v1 = (char *)objc_allocWithZone(v0);
  *(void *)&v1[OBJC_IVAR____TtC21HearingModeSettingsUI36HearingAidUserAgeCheckViewController____lazy_storage___sections] = 0;
  swift_unknownObjectWeakInit();
  *(void *)&v1[OBJC_IVAR____TtC21HearingModeSettingsUI36HearingAidUserAgeCheckViewController____lazy_storage___continueButton] = 0;
  *(void *)&v1[OBJC_IVAR____TtC21HearingModeSettingsUI36HearingAidUserAgeCheckViewController____lazy_storage___cancelButton] = 0;
  *(void *)&v1[OBJC_IVAR____TtC21HearingModeSettingsUI36HearingAidUserAgeCheckViewController_listeners] = MEMORY[0x263F8EE88];

  sub_25126C8B8();
  __break(1u);
}

void sub_2512457D8()
{
  *(void *)&v0[OBJC_IVAR____TtC21HearingModeSettingsUI36HearingAidUserAgeCheckViewController____lazy_storage___sections] = 0;
  swift_unknownObjectWeakInit();
  *(void *)&v0[OBJC_IVAR____TtC21HearingModeSettingsUI36HearingAidUserAgeCheckViewController____lazy_storage___continueButton] = 0;
  *(void *)&v0[OBJC_IVAR____TtC21HearingModeSettingsUI36HearingAidUserAgeCheckViewController____lazy_storage___cancelButton] = 0;
  *(void *)&v0[OBJC_IVAR____TtC21HearingModeSettingsUI36HearingAidUserAgeCheckViewController_listeners] = MEMORY[0x263F8EE88];

  sub_25126C8B8();
  __break(1u);
}

void sub_251245884()
{
  id v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82C78]), sel_initWithFrame_style_, 2, 0.0, 0.0, 0.0, 0.0);
  objc_msgSend(v0, sel_setTableView_, v1);

  id v2 = objc_msgSend(v0, sel_tableView);
  if (!v2)
  {
    __break(1u);
    goto LABEL_10;
  }
  uint64_t v3 = v2;
  id v4 = objc_msgSend(self, sel_systemBackgroundColor);
  objc_msgSend(v3, sel_setBackgroundColor_, v4);

  id v5 = objc_msgSend(v0, sel_tableView);
  if (!v5)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  id v6 = v5;
  objc_msgSend(v5, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);

  id v7 = objc_msgSend(v0, sel_tableView);
  if (!v7)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  uint64_t v8 = v7;
  objc_msgSend(v7, sel_setShowsVerticalScrollIndicator_, 0);

  id v9 = objc_msgSend(v0, sel_tableView);
  if (!v9)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  uint64_t v10 = v9;
  objc_msgSend(v9, sel_setShowsHorizontalScrollIndicator_, 0);

  id v11 = objc_msgSend(v0, sel_tableView);
  if (!v11)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  uint64_t v12 = v11;
  sub_25123DFF4(0, &qword_269B2B1D8);
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  uint64_t v14 = (void *)sub_25126C458();
  objc_msgSend(v12, sel_registerClass_forHeaderFooterViewReuseIdentifier_, ObjCClassFromMetadata, v14);

  id v15 = objc_msgSend(v0, sel_tableView);
  if (!v15)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  uint64_t v16 = v15;
  objc_msgSend(v15, sel_setDelegate_, v0);

  id v17 = objc_msgSend(v0, sel_tableView);
  if (v17)
  {
    uint64_t v18 = v17;
    objc_msgSend(v17, sel_setDataSource_, v0);

    v21.receiver = v0;
    v21.super_class = (Class)type metadata accessor for HearingAidUserAgeCheckViewController();
    objc_msgSendSuper2(&v21, sel_viewDidLoad);
    id v19 = objc_msgSend(v0, sel_buttonTray);
    uint64_t v20 = (void *)(*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xA8))();
    objc_msgSend(v19, sel_addButton_, v20);

    return;
  }
LABEL_15:
  __break(1u);
}

id HearingAidUserAgeCheckViewController.__allocating_init(title:detailText:symbolName:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  id v9 = (void *)sub_25126C458();
  swift_bridgeObjectRelease();
  if (!a4)
  {
    uint64_t v10 = 0;
    if (a6) {
      goto LABEL_3;
    }
LABEL_5:
    id v11 = 0;
    goto LABEL_6;
  }
  uint64_t v10 = (void *)sub_25126C458();
  swift_bridgeObjectRelease();
  if (!a6) {
    goto LABEL_5;
  }
LABEL_3:
  id v11 = (void *)sub_25126C458();
  swift_bridgeObjectRelease();
LABEL_6:
  id v12 = objc_msgSend(objc_allocWithZone(v6), sel_initWithTitle_detailText_symbolName_, v9, v10, v11);

  return v12;
}

void HearingAidUserAgeCheckViewController.init(title:detailText:symbolName:)()
{
}

id HearingAidUserAgeCheckViewController.__allocating_init(title:detailText:icon:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = v5;
  id v9 = (void *)sub_25126C458();
  swift_bridgeObjectRelease();
  if (a4)
  {
    uint64_t v10 = (void *)sub_25126C458();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v10 = 0;
  }
  id v11 = objc_msgSend(objc_allocWithZone(v6), sel_initWithTitle_detailText_icon_, v9, v10, a5);

  return v11;
}

void HearingAidUserAgeCheckViewController.init(title:detailText:icon:)()
{
}

id HearingAidUserAgeCheckViewController.__allocating_init(title:detailText:symbolName:adoptTableViewScrollView:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7)
{
  uint64_t v8 = v7;
  id v12 = (void *)sub_25126C458();
  swift_bridgeObjectRelease();
  if (!a4)
  {
    objc_super v13 = 0;
    if (a6) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v14 = 0;
    goto LABEL_6;
  }
  objc_super v13 = (void *)sub_25126C458();
  swift_bridgeObjectRelease();
  if (!a6) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v14 = (void *)sub_25126C458();
  swift_bridgeObjectRelease();
LABEL_6:
  id v15 = objc_msgSend(objc_allocWithZone(v8), sel_initWithTitle_detailText_symbolName_adoptTableViewScrollView_, v12, v13, v14, a7 & 1);

  return v15;
}

void HearingAidUserAgeCheckViewController.init(title:detailText:symbolName:adoptTableViewScrollView:)()
{
}

id HearingAidUserAgeCheckViewController.__allocating_init(title:detailText:icon:adoptTableViewScrollView:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, char a6)
{
  id v7 = v6;
  id v11 = (void *)sub_25126C458();
  swift_bridgeObjectRelease();
  if (a4)
  {
    id v12 = (void *)sub_25126C458();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v12 = 0;
  }
  id v13 = objc_msgSend(objc_allocWithZone(v7), sel_initWithTitle_detailText_icon_adoptTableViewScrollView_, v11, v12, a5, a6 & 1);

  return v13;
}

void HearingAidUserAgeCheckViewController.init(title:detailText:icon:adoptTableViewScrollView:)()
{
}

id HearingAidUserAgeCheckViewController.__deallocating_deinit()
{
  return sub_2512461E4(type metadata accessor for HearingAidUserAgeCheckViewController);
}

id sub_2512461E4(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

Swift::Int __swiftcall HearingAidUserAgeCheckViewController.numberOfSections(in:)(UITableView *in)
{
  unint64_t v1 = sub_251243F98();
  if (v1 >> 62) {
    Swift::Int v2 = sub_25126C8C8();
  }
  else {
    Swift::Int v2 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  return v2;
}

Swift::Int __swiftcall HearingAidUserAgeCheckViewController.tableView(_:numberOfRowsInSection:)(UITableView *_, Swift::Int numberOfRowsInSection)
{
  Swift::Int result = sub_251243F98();
  if ((result & 0xC000000000000001) != 0)
  {
    uint64_t v4 = MEMORY[0x253399500](numberOfRowsInSection, result);
    goto LABEL_5;
  }
  if (numberOfRowsInSection < 0)
  {
    __break(1u);
  }
  else if (*(void *)((result & 0xFFFFFFFFFFFFFF8) + 0x10) > (unint64_t)numberOfRowsInSection)
  {
    uint64_t v4 = *(void *)(result + 8 * numberOfRowsInSection + 32);
    swift_retain();
LABEL_5:
    swift_bridgeObjectRelease();
    uint64_t v5 = *(void *)(v4 + 48);
    swift_bridgeObjectRetain();
    swift_release();
    Swift::Int v6 = *(void *)(v5 + 16);
    swift_bridgeObjectRelease();
    return v6;
  }
  __break(1u);
  return result;
}

unint64_t HearingAidUserAgeCheckViewController.tableView(_:cellForRowAt:)()
{
  unint64_t v0 = sub_25126BBA8();
  unint64_t result = sub_251243F98();
  if ((result & 0xC000000000000001) == 0)
  {
    if ((v0 & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else if (v0 < *(void *)((result & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      Swift::Int v2 = *(void **)(result + 8 * v0 + 32);
      swift_retain();
      goto LABEL_5;
    }
    __break(1u);
    goto LABEL_11;
  }
  Swift::Int v2 = (void *)MEMORY[0x253399500](v0, result);
LABEL_5:
  swift_bridgeObjectRelease();
  uint64_t v3 = v2[6];
  unint64_t result = sub_25126BB98();
  if ((result & 0x8000000000000000) != 0)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  if (result < *(void *)(v3 + 16))
  {
    uint64_t v4 = (*(uint64_t (**)(void))(*v2 + 184))(*(unsigned __int8 *)(v3 + result + 32));
    swift_release();
    return v4;
  }
LABEL_12:
  __break(1u);
  return result;
}

void __swiftcall HearingAidUserAgeCheckViewController.tableView(_:viewForHeaderInSection:)(UIView_optional *__return_ptr retstr, UITableView *_, Swift::Int viewForHeaderInSection)
{
  uint64_t v5 = sub_251243F98();
  if ((v5 & 0xC000000000000001) == 0)
  {
    if (viewForHeaderInSection < 0)
    {
      __break(1u);
    }
    else if (*(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10) > (unint64_t)viewForHeaderInSection)
    {
      swift_retain();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      swift_release();
      goto LABEL_5;
    }
    __break(1u);
    return;
  }
  MEMORY[0x253399500](viewForHeaderInSection, v5);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  swift_unknownObjectRelease();
LABEL_5:
  Swift::Int v6 = (void *)sub_25126C458();
  id v7 = [(UITableView *)_ dequeueReusableHeaderFooterViewWithIdentifier:v6];

  if (v7)
  {
    uint64_t v8 = v7;
    HearingAidUserAgeCheckViewController.headerConfiguration(title:)(v9);
    swift_bridgeObjectRelease();
    MEMORY[0x253399300](v9);
  }
  else
  {
    swift_bridgeObjectRelease();
  }
}

uint64_t HearingAidUserAgeCheckViewController.headerConfiguration(title:)@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_25126C1B8();
  uint64_t v3 = MEMORY[0x263F81F20];
  a1[3] = v2;
  a1[4] = v3;
  __swift_allocate_boxed_opaque_existential_1(a1);
  sub_25126C198();
  swift_bridgeObjectRetain();
  sub_25126C1A8();
  uint64_t v4 = self;
  sub_25126C488();
  uint64_t v5 = (void *)sub_25126C458();
  swift_bridgeObjectRelease();
  id v6 = objc_msgSend(v4, sel_hk_preferredFontForTextStyle_symbolicTraits_, v5, 2);

  id v7 = (void (*)(unsigned char *, void))sub_25126C158();
  sub_25126C118();
  v7(v11, 0);
  id v8 = objc_msgSend(self, sel_labelColor);
  id v9 = (uint64_t (*)(unsigned char *, void))sub_25126C158();
  sub_25126C138();
  return v9(v11, 0);
}

unint64_t HearingAidUserAgeCheckViewController.tableView(_:didSelectRowAt:)()
{
  unint64_t v0 = sub_25126BBA8();
  unint64_t result = sub_251243F98();
  if ((result & 0xC000000000000001) == 0)
  {
    if ((v0 & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else if (v0 < *(void *)((result & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      uint64_t v2 = *(void **)(result + 8 * v0 + 32);
      swift_retain();
      goto LABEL_5;
    }
    __break(1u);
    goto LABEL_13;
  }
  uint64_t v2 = (void *)MEMORY[0x253399500](v0, result);
LABEL_5:
  swift_bridgeObjectRelease();
  uint64_t v3 = v2[6];
  unint64_t result = sub_25126BB98();
  if ((result & 0x8000000000000000) != 0)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  if (result >= *(void *)(v3 + 16))
  {
LABEL_14:
    __break(1u);
    return result;
  }
  (*(void (**)(void))(*v2 + 200))(*(unsigned __int8 *)(v3 + result + 32));
  return swift_release();
}

void sub_251246D5C()
{
}

void sub_251246D80(uint64_t a1, uint64_t a2)
{
  swift_getObjectType();
  uint64_t v4 = v2;
  uint64_t v5 = (void *)sub_25126C458();
  id v6 = objc_msgSend(self, sel_systemImageNamed_, v5);

  if (v6)
  {
    *(void *)&v4[OBJC_IVAR____TtC21HearingModeSettingsUI37BinaryConfirmationSelectTableViewCell_accessoryImage] = v6;
    v4[OBJC_IVAR____TtC21HearingModeSettingsUI37BinaryConfirmationSelectTableViewCell_itemState] = 2;
    v4[OBJC_IVAR____TtC21HearingModeSettingsUI37BinaryConfirmationSelectTableViewCell_accessoryIsSelected] = 0;

    if (a2)
    {
      id v7 = (void *)sub_25126C458();
      swift_bridgeObjectRelease();
    }
    else
    {
      id v7 = 0;
    }
    v19.receiver = v4;
    v19.super_class = (Class)type metadata accessor for BinaryConfirmationSelectTableViewCell();
    id v8 = objc_msgSendSuper2(&v19, sel_initWithStyle_reuseIdentifier_, 3, v7);

    id v9 = v8;
    id v10 = objc_msgSend(v9, sel_textLabel);
    if (v10)
    {
      id v11 = v10;
      objc_msgSend(v10, sel_setNumberOfLines_, 0);
    }
    objc_msgSend(v9, sel_setSelectionStyle_, 0);
    id v12 = self;
    id v13 = v9;
    id v14 = objc_msgSend(v12, sel_secondarySystemBackgroundColor);
    objc_msgSend(v13, sel_setBackgroundColor_, v14);

    sub_251243CB8();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_269B2B280);
    uint64_t v15 = swift_allocObject();
    *(_OWORD *)(v15 + 16) = xmmword_25126E8C0;
    uint64_t v16 = sub_25126C1C8();
    uint64_t v17 = MEMORY[0x263F82018];
    *(void *)(v15 + 32) = v16;
    *(void *)(v15 + 40) = v17;
    id v18 = v13;
    sub_25126C6F8();

    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();
  }
  else
  {
    __break(1u);
  }
}

void sub_251246FBC()
{
  unint64_t v1 = (void *)sub_25126C458();
  id v2 = objc_msgSend(self, sel_systemImageNamed_, v1);

  if (!v2) {
    __break(1u);
  }
  *(void *)&v0[OBJC_IVAR____TtC21HearingModeSettingsUI37BinaryConfirmationSelectTableViewCell_accessoryImage] = v2;
  v0[OBJC_IVAR____TtC21HearingModeSettingsUI37BinaryConfirmationSelectTableViewCell_itemState] = 2;
  v0[OBJC_IVAR____TtC21HearingModeSettingsUI37BinaryConfirmationSelectTableViewCell_accessoryIsSelected] = 0;

  sub_25126C8B8();
  __break(1u);
}

uint64_t type metadata accessor for HearingAidUserAgeCheckViewController()
{
  return self;
}

uint64_t sub_2512470BC(uint64_t a1)
{
  return a1;
}

uint64_t *__swift_allocate_boxed_opaque_existential_1(uint64_t *a1)
{
  unint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

unint64_t sub_25124714C()
{
  unint64_t result = qword_269B2B1E0;
  if (!qword_269B2B1E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B2B1E0);
  }
  return result;
}

unint64_t sub_2512471A4()
{
  unint64_t result = qword_269B2B1E8;
  if (!qword_269B2B1E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B2B1E8);
  }
  return result;
}

uint64_t sub_2512471F8()
{
  return MEMORY[0x263EFDDD8];
}

unsigned char *storeEnumTagSinglePayload for SetUpSection(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x2512472D0);
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

ValueMetadata *type metadata accessor for SetUpSection()
{
  return &type metadata for SetUpSection;
}

uint64_t sub_251247308()
{
  return type metadata accessor for TableSectionViewModel();
}

void sub_251247310()
{
  sub_2512473D4();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void sub_2512473D4()
{
  if (!qword_269B2B1F8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269B2B180);
    unint64_t v0 = sub_25126C2C8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_269B2B1F8);
    }
  }
}

uint64_t getEnumTagSinglePayload for TableSectionViewModel.State(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for TableSectionViewModel.State(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25124758CLL);
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

unsigned char *sub_2512475B4(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for TableSectionViewModel.State()
{
  return &type metadata for TableSectionViewModel.State;
}

ValueMetadata *type metadata accessor for BinaryConfirmationSelectTableViewCell.Constants()
{
  return &type metadata for BinaryConfirmationSelectTableViewCell.Constants;
}

uint64_t method lookup function for HearingAidUserAgeCheckViewController(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for HearingAidUserAgeCheckViewController);
}

uint64_t sub_2512475F8()
{
  swift_weakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_251247630()
{
  swift_unknownObjectWeakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_25124766C(unsigned __int8 *a1)
{
  int v2 = *a1;
  if (v2 == 2 || (v2 & 1) != 0)
  {
    uint64_t v4 = *(void *)(v1 + 24);
    swift_beginAccess();
    uint64_t Strong = swift_weakLoadStrong();
    if (Strong)
    {
      unsigned int v6 = (void *)(*(uint64_t (**)(uint64_t))(*(void *)Strong + 240))(Strong);
      swift_release();
      swift_beginAccess();
      BOOL v7 = (void *)MEMORY[0x25339A050](v4 + 16);
      if (v7)
      {
        int v8 = v7;
        objc_msgSend(v7, sel_presentViewController_animated_completion_, v6, 1, 0);
      }
    }
  }
}

uint64_t objectdestroy_33Tm()
{
  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

void sub_25124779C(unsigned __int8 *a1)
{
  int v2 = *a1;
  if (v2 != 2 && (v2 & 1) == 0)
  {
    uint64_t v4 = *(void *)(v1 + 24);
    swift_beginAccess();
    uint64_t Strong = swift_weakLoadStrong();
    if (Strong)
    {
      unsigned int v6 = (void *)(*(uint64_t (**)(uint64_t))(*(void *)Strong + 240))(Strong);
      swift_release();
      swift_beginAccess();
      BOOL v7 = (void *)MEMORY[0x25339A050](v4 + 16);
      if (v7)
      {
        int v8 = v7;
        objc_msgSend(v7, sel_presentViewController_animated_completion_, v6, 1, 0);
      }
    }
  }
}

uint64_t sub_251247880(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B2ADF0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

char *keypath_get_selector_isEnabled()
{
  return sel_isEnabled;
}

uint64_t sub_2512478F0()
{
  uint64_t v0 = sub_25126C0E8();
  __swift_allocate_value_buffer(v0, qword_269B2D470);
  __swift_project_value_buffer(v0, (uint64_t)qword_269B2D470);
  return sub_25126C0D8();
}

uint64_t sub_251247964()
{
  if (qword_269B2C2E8 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_25126C0E8();
  return __swift_project_value_buffer(v0, (uint64_t)qword_269B2D470);
}

uint64_t sub_2512479C8@<X0>(uint64_t a1@<X8>)
{
  if (qword_269B2C2E8 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_25126C0E8();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_269B2D470);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);
  return v4(a1, v3, v2);
}

id sub_251247A70()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_25126C0E8();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2, v4);
  unsigned int v6 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = OBJC_IVAR____TtC21HearingModeSettingsUI44HearingAidTuningVoiceEntertainmentController__headphoneDevice;
  int v8 = *(void **)(v0
                + OBJC_IVAR____TtC21HearingModeSettingsUI44HearingAidTuningVoiceEntertainmentController__headphoneDevice);
  if (!v8 || (v9 = v8, id v10 = sub_251254C3C(), v9, !v10))
  {
    sub_25126C0B8();
    id v11 = sub_25126C0C8();
    os_log_type_t v12 = sub_25126C638();
    if (os_log_type_enabled(v11, v12))
    {
      id v13 = (uint8_t *)swift_slowAlloc();
      uint64_t v14 = swift_slowAlloc();
      uint64_t v20 = v1;
      uint64_t v15 = v14;
      uint64_t v22 = v14;
      *(_DWORD *)id v13 = 136315138;
      uint64_t v21 = sub_251240E7C(0x6E6F687064616568, 0xEF65636976654465, &v22);
      sub_25126C768();
      _os_log_impl(&dword_251222000, v11, v12, "%s: connected device !", v13, 0xCu);
      swift_arrayDestroy();
      uint64_t v16 = v15;
      uint64_t v1 = v20;
      MEMORY[0x253399FB0](v16, -1, -1);
      MEMORY[0x253399FB0](v13, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
    id v10 = *(id *)(v1 + v7);
    id v17 = v10;
  }
  return v10;
}

uint64_t sub_251247C94()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_251247CE0(uint64_t a1)
{
  uint64_t v3 = (void *)(v1 + OBJC_IVAR____TtC21HearingModeSettingsUI44HearingAidTuningVoiceEntertainmentController_listeners);
  swift_beginAccess();
  void *v3 = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_251247D34())()
{
  return j__swift_endAccess;
}

id HearingAidTuningVoiceEntertainmentController.__allocating_init(nibName:bundle:)(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = v3;
  if (a2)
  {
    unsigned int v6 = (void *)sub_25126C458();
    swift_bridgeObjectRelease();
  }
  else
  {
    unsigned int v6 = 0;
  }
  id v7 = objc_msgSend(objc_allocWithZone(v4), sel_initWithNibName_bundle_, v6, a3);

  return v7;
}

id HearingAidTuningVoiceEntertainmentController.init(nibName:bundle:)(uint64_t a1, uint64_t a2, void *a3)
{
  *(void *)&v3[OBJC_IVAR____TtC21HearingModeSettingsUI44HearingAidTuningVoiceEntertainmentController__headphoneDevice] = 0;
  *(void *)&v3[OBJC_IVAR____TtC21HearingModeSettingsUI44HearingAidTuningVoiceEntertainmentController_listeners] = MEMORY[0x263F8EE88];
  *(void *)&v3[OBJC_IVAR____TtC21HearingModeSettingsUI44HearingAidTuningVoiceEntertainmentController____lazy_storage___amplificationSliderSection] = 0;
  *(void *)&v3[OBJC_IVAR____TtC21HearingModeSettingsUI44HearingAidTuningVoiceEntertainmentController____lazy_storage___swipeControlAmpSwitchSection] = 0;
  *(void *)&v3[OBJC_IVAR____TtC21HearingModeSettingsUI44HearingAidTuningVoiceEntertainmentController____lazy_storage___transparencyBalanceSection] = 0;
  *(void *)&v3[OBJC_IVAR____TtC21HearingModeSettingsUI44HearingAidTuningVoiceEntertainmentController____lazy_storage___toneDarkLightSection] = 0;
  *(void *)&v3[OBJC_IVAR____TtC21HearingModeSettingsUI44HearingAidTuningVoiceEntertainmentController____lazy_storage___ambientNoiseReductionSection] = 0;
  *(void *)&v3[OBJC_IVAR____TtC21HearingModeSettingsUI44HearingAidTuningVoiceEntertainmentController____lazy_storage___conversationBoostSection] = 0;
  *(void *)&v3[OBJC_IVAR____TtC21HearingModeSettingsUI44HearingAidTuningVoiceEntertainmentController____lazy_storage___resetAllTuningsSection] = 0;
  if (a2)
  {
    uint64_t v5 = (void *)sub_25126C458();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v5 = 0;
  }
  v8.receiver = v3;
  v8.super_class = (Class)type metadata accessor for HearingAidTuningVoiceEntertainmentController();
  id v6 = objc_msgSendSuper2(&v8, sel_initWithNibName_bundle_, v5, a3);

  return v6;
}

uint64_t type metadata accessor for HearingAidTuningVoiceEntertainmentController()
{
  return self;
}

void sub_251247FAC()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_25126C0E8();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2, v4);
  id v6 = (char *)&v35 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v7 = objc_msgSend(v0, sel_specifier);
  if (!v7)
  {
    __break(1u);
    goto LABEL_25;
  }
  objc_super v8 = v7;
  id v9 = objc_msgSend(v7, sel_userInfo);

  if (v9)
  {
    sub_25126C7A8();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v40 = 0u;
    long long v41 = 0u;
  }
  sub_25123D3B8((uint64_t)&v40, (uint64_t)v42);
  if (!v43) {
    goto LABEL_17;
  }
  sub_25123DFF4(0, &qword_269B2AEA0);
  if ((swift_dynamicCast() & 1) == 0) {
    goto LABEL_18;
  }
  id v10 = v39;
  id v11 = (void *)sub_25126C458();
  id v12 = objc_msgSend(v10, sel_objectForKey_, v11);

  if (v12)
  {
    sub_25126C7A8();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v40 = 0u;
    long long v41 = 0u;
  }
  sub_25123D3B8((uint64_t)&v40, (uint64_t)v42);
  if (!v43)
  {

LABEL_17:
    sub_25123ECCC((uint64_t)v42);
    goto LABEL_18;
  }
  sub_25126BDB8();
  if (swift_dynamicCast())
  {
    id v13 = v39;
    uint64_t v14 = *(void **)((char *)v1
                   + OBJC_IVAR____TtC21HearingModeSettingsUI44HearingAidTuningVoiceEntertainmentController__headphoneDevice);
    *(void *)((char *)v1
              + OBJC_IVAR____TtC21HearingModeSettingsUI44HearingAidTuningVoiceEntertainmentController__headphoneDevice) = v39;
    id v15 = v13;

    uint64_t v16 = (void *)MEMORY[0x263F8EED0];
    (*(void (**)(void))((*MEMORY[0x263F8EED0] & *v1) + 0xC0))(MEMORY[0x263F8EE88]);
    id v17 = sub_251247A70();
    if (v17)
    {
      id v18 = v17;
      id v19 = sub_251254C3C();

      if (v19)
      {
        uint64_t v20 = (void *)sub_25126BD68();

        sub_25126C058();
        sub_25124AAD8();
        uint64_t v21 = sub_25126C248();

        v42[0] = v21;
        swift_allocObject();
        swift_unknownObjectWeakInit();
        sub_25126C258();
        sub_25126C338();
        swift_release();
        swift_release();
        uint64_t v22 = (void (*)(uint64_t *, void))(*(uint64_t (**)(uint64_t *))((*v16 & *v1) + 0xC8))(v42);
        sub_25126C228();
        swift_release();
        v22(v42, 0);
      }
      uint64_t v23 = (objc_class *)type metadata accessor for HearingAidTuningVoiceEntertainmentController();
      v38.receiver = v1;
      v38.super_class = v23;
      objc_msgSendSuper2(&v38, sel_viewDidLoad);

      return;
    }
LABEL_25:
    __break(1u);
    return;
  }

LABEL_18:
  if (qword_269B2C2E8 != -1) {
    swift_once();
  }
  uint64_t v24 = __swift_project_value_buffer(v2, (uint64_t)qword_269B2D470);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v6, v24, v2);
  uint64_t v25 = sub_25126C0C8();
  os_log_type_t v26 = sub_25126C638();
  if (os_log_type_enabled(v25, v26))
  {
    uint64_t v27 = swift_slowAlloc();
    uint64_t v28 = swift_slowAlloc();
    uint64_t v37 = v6;
    uint64_t v29 = v3;
    uint64_t v30 = v28;
    v42[0] = v28;
    *(_DWORD *)uint64_t v27 = 136315650;
    *(void *)&long long v40 = sub_251240E7C(0x4C64694477656976, 0xED0000292864616FLL, v42);
    sub_25126C768();
    *(_WORD *)(v27 + 12) = 2048;
    *(void *)&long long v40 = 42;
    sub_25126C768();
    *(_WORD *)(v27 + 22) = 2080;
    sub_25126BDF8();
    uint64_t v31 = (void *)sub_25126BDD8();
    sub_25126BDC8();

    sub_25126BDB8();
    uint64_t v32 = sub_25126C3C8();
    uint64_t v36 = v2;
    unint64_t v34 = v33;
    swift_bridgeObjectRelease();
    *(void *)&long long v40 = sub_251240E7C(v32, v34, v42);
    sub_25126C768();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_251222000, v25, v26, "%s: %ld Depedencies not meet! %s", (uint8_t *)v27, 0x20u);
    swift_arrayDestroy();
    MEMORY[0x253399FB0](v30, -1, -1);
    MEMORY[0x253399FB0](v27, -1, -1);

    (*(void (**)(char *, uint64_t))(v29 + 8))(v37, v36);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  }
}

uint64_t sub_25124862C()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_25126C0E8();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2, v4);
  id v6 = (char *)v28 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v7 = sub_251247A70();

  if (v7)
  {
    objc_super v8 = (void *)MEMORY[0x263F8EED0];
    v28[5] = (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v1) + 0xD0))();
    void v28[6] = (*(uint64_t (**)(void))((*v8 & *v1) + 0xE8))();
    v28[7] = (*(uint64_t (**)(void))((*v8 & *v1) + 0x100))();
    v28[8] = (*(uint64_t (**)(void))((*v8 & *v1) + 0x118))();
    v28[9] = (*(uint64_t (**)(void))((*v8 & *v1) + 0x130))();
    v28[10] = (*(uint64_t (**)(void))((*v8 & *v1) + 0x148))();
    v28[11] = (*(uint64_t (**)(void))((*v8 & *v1) + 0x160))();
    unint64_t v30 = MEMORY[0x263F8EE78];
    unint64_t v9 = swift_bridgeObjectRetain();
    sub_25124A838(v9);
    unint64_t v10 = swift_bridgeObjectRetain();
    sub_25124A838(v10);
    unint64_t v11 = swift_bridgeObjectRetain();
    sub_25124A838(v11);
    unint64_t v12 = swift_bridgeObjectRetain();
    sub_25124A838(v12);
    unint64_t v13 = swift_bridgeObjectRetain();
    sub_25124A838(v13);
    unint64_t v14 = swift_bridgeObjectRetain();
    sub_25124A838(v14);
    unint64_t v15 = swift_bridgeObjectRetain();
    sub_25124A838(v15);
    __swift_instantiateConcreteTypeFromMangledName(&qword_269B2AEA8);
    swift_arrayDestroy();
    unint64_t v16 = v30;
    sub_25123DFF4(0, &qword_269B2AE98);
    id v17 = (void *)sub_25126C528();
    id v18 = (void *)sub_25126C458();
    objc_msgSend(v1, sel_setValue_forKey_, v17, v18);

    uint64_t v19 = sub_2512399F4(v16);
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_25123DFF4(0, &qword_269B2AE98);
    uint64_t v20 = (void *)sub_25126C528();
    uint64_t v21 = (void *)sub_25126C458();
    objc_msgSend(v1, sel_setValue_forKey_, v20, v21);

    if (qword_269B2C2E8 != -1) {
      swift_once();
    }
    uint64_t v22 = __swift_project_value_buffer(v2, (uint64_t)qword_269B2D470);
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v6, v22, v2);
    uint64_t v23 = sub_25126C0C8();
    os_log_type_t v24 = sub_25126C638();
    if (os_log_type_enabled(v23, v24))
    {
      uint64_t v25 = swift_slowAlloc();
      uint64_t v26 = swift_slowAlloc();
      unint64_t v30 = v26;
      *(_DWORD *)uint64_t v25 = 136315394;
      uint64_t v29 = sub_251240E7C(0x6569666963657073, 0xEC00000029287372, (uint64_t *)&v30);
      sub_25126C768();
      *(_WORD *)(v25 + 12) = 2048;
      uint64_t v29 = 68;
      sub_25126C768();
      _os_log_impl(&dword_251222000, v23, v24, "%s: %ld Depedencies not meet, bailing out of specifiers returning empty conroller!", (uint8_t *)v25, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x253399FB0](v26, -1, -1);
      MEMORY[0x253399FB0](v25, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
    return 0;
  }
  return v19;
}

uint64_t sub_251248C68()
{
  return sub_2512492F0(&OBJC_IVAR____TtC21HearingModeSettingsUI44HearingAidTuningVoiceEntertainmentController____lazy_storage___amplificationSliderSection, 0x636966696C706D41, 0xED00006E6F697461, (uint64_t)sub_25124B04C);
}

unint64_t sub_251248CA8(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B2B358);
  uint64_t v2 = (void *)sub_25126C908();
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
    id v7 = *v4;
    swift_bridgeObjectRetain();
    id v8 = v7;
    unint64_t result = sub_25123BF30(v5, v6);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    unint64_t v11 = (uint64_t *)(v2[6] + 16 * result);
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

uint64_t sub_251248DC4(uint64_t a1)
{
  *(void *)(v1
            + OBJC_IVAR____TtC21HearingModeSettingsUI44HearingAidTuningVoiceEntertainmentController____lazy_storage___amplificationSliderSection) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_251248DDC(uint64_t *a1))(void *a1, uint64_t a2)
{
  a1[1] = v1;
  *a1 = sub_251248C68();
  return sub_251248E24;
}

uint64_t sub_251248E24(void *a1, uint64_t a2)
{
  return sub_251239114(a1, a2, &OBJC_IVAR____TtC21HearingModeSettingsUI44HearingAidTuningVoiceEntertainmentController____lazy_storage___amplificationSliderSection);
}

uint64_t sub_251248E30()
{
  return sub_251248E50(&OBJC_IVAR____TtC21HearingModeSettingsUI44HearingAidTuningVoiceEntertainmentController____lazy_storage___swipeControlAmpSwitchSection, (uint64_t (*)(uint64_t))sub_251248EB8);
}

uint64_t sub_251248E50(uint64_t *a1, uint64_t (*a2)(uint64_t))
{
  uint64_t v3 = *a1;
  uint64_t v4 = *(void *)(v2 + *a1);
  if (v4)
  {
    uint64_t v5 = v4;
  }
  else
  {
    uint64_t v5 = a2(v2);
    *(void *)(v2 + v3) = v5;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  return v5;
}

uint64_t sub_251248EB8(void *a1)
{
  unint64_t v33 = a1;
  uint64_t v2 = sub_25126C448();
  uint64_t v32 = v2;
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2, v4);
  uint64_t v6 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v38[0] = a1;
  sub_25126C3D8();
  uint64_t v7 = type metadata accessor for HearingAidTuningVoiceEntertainmentController();
  uint64_t v8 = sub_2512547C8((uint64_t)v6);
  uint64_t v10 = v9;
  uint64_t v31 = *(void (**)(char *, uint64_t))(v3 + 8);
  v31(v6, v2);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B2AE30);
  uint64_t v11 = sub_251252320();
  uint64_t v13 = v12;
  uint64_t v14 = sub_251252320();
  uint64_t v16 = sub_25125232C(v11, v13, v14, v15);
  uint64_t v35 = v8;
  uint64_t v36 = v10;
  uint64_t v17 = (*(uint64_t (**)(uint64_t (*)(), char *))(*(void *)v16 + 144))(sub_25124ADF0, v34);
  swift_bridgeObjectRelease();
  swift_release();
  id v18 = v33;
  v38[0] = v33;
  sub_25126C3D8();
  uint64_t v19 = sub_2512547C8((uint64_t)v6);
  uint64_t v21 = v20;
  v31(v6, v32);
  void v37[3] = v7;
  v37[0] = v18;
  id v22 = v18;
  char v23 = sub_251243A48();
  __n128 v24 = sub_251252268(0, 0, v19, v21, (uint64_t)v37, (uint64_t)sel_swipeToGainEnabled, (uint64_t)sel_setSwipeToGainEnabledWithEnabled_, 6, (uint64_t)v38, 0, v23 & 1, 0, 0, (__n128)0, 0);
  uint64_t v25 = (*(uint64_t (**)(void *, __n128))(*(void *)v17 + 152))(v38, v24);
  swift_release();
  sub_25123BACC((uint64_t)v38);
  uint64_t v26 = (*(uint64_t (**)(uint64_t (*)(), void))(*(void *)v25 + 176))(nullsub_1, 0);
  uint64_t v27 = swift_release();
  uint64_t v28 = (*(uint64_t (**)(uint64_t))(*(void *)v26 + 184))(v27);
  swift_release();
  return v28;
}

uint64_t sub_251249250(uint64_t a1)
{
  *(void *)(v1
            + OBJC_IVAR____TtC21HearingModeSettingsUI44HearingAidTuningVoiceEntertainmentController____lazy_storage___swipeControlAmpSwitchSection) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_251249268(uint64_t *a1))(void *a1, uint64_t a2)
{
  a1[1] = v1;
  *a1 = sub_251248E30();
  return sub_2512492B0;
}

uint64_t sub_2512492B0(void *a1, uint64_t a2)
{
  return sub_251239114(a1, a2, &OBJC_IVAR____TtC21HearingModeSettingsUI44HearingAidTuningVoiceEntertainmentController____lazy_storage___swipeControlAmpSwitchSection);
}

uint64_t sub_2512492BC()
{
  return sub_2512492F0(&OBJC_IVAR____TtC21HearingModeSettingsUI44HearingAidTuningVoiceEntertainmentController____lazy_storage___transparencyBalanceSection, 0x65636E616C6142, 0xE700000000000000, (uint64_t)sub_25124AE6C);
}

uint64_t sub_2512492F0(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = *a1;
  uint64_t v6 = *(void *)&v4[*a1];
  if (v6)
  {
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v7 = sub_2512493EC(v4, a2, a3, a4);
    *(void *)&v4[v5] = v7;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  return v7;
}

uint64_t sub_251249354(uint64_t a1)
{
  *(void *)(v1
            + OBJC_IVAR____TtC21HearingModeSettingsUI44HearingAidTuningVoiceEntertainmentController____lazy_storage___transparencyBalanceSection) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_25124936C(uint64_t *a1))(void *a1, uint64_t a2)
{
  a1[1] = v1;
  *a1 = sub_2512492BC();
  return sub_2512493B4;
}

uint64_t sub_2512493B4(void *a1, uint64_t a2)
{
  return sub_251239114(a1, a2, &OBJC_IVAR____TtC21HearingModeSettingsUI44HearingAidTuningVoiceEntertainmentController____lazy_storage___transparencyBalanceSection);
}

uint64_t sub_2512493C0()
{
  return sub_2512492F0(&OBJC_IVAR____TtC21HearingModeSettingsUI44HearingAidTuningVoiceEntertainmentController____lazy_storage___toneDarkLightSection, 1701736276, 0xE400000000000000, (uint64_t)sub_25124AE64);
}

uint64_t sub_2512493EC(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = sub_25126C448();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6, v8);
  uint64_t v10 = &v26[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v29[0] = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B2AE30);
  sub_25126C3D8();
  uint64_t v11 = type metadata accessor for HearingAidTuningVoiceEntertainmentController();
  uint64_t v12 = sub_2512547C8((uint64_t)v10);
  uint64_t v14 = v13;
  (*(void (**)(unsigned char *, uint64_t))(v7 + 8))(v10, v6);
  uint64_t v15 = sub_251252320();
  uint64_t v17 = sub_25125232C(v15, v16, v12, v14);
  v28[3] = v11;
  v28[0] = a1;
  id v18 = a1;
  char v19 = sub_251243A48();
  __n128 v20 = sub_251252268(0, 0, 0, 0, (uint64_t)v28, 0, 0, -1, (uint64_t)v29, 0, v19 & 1, 0, 0, (__n128)0, 0);
  uint64_t v21 = (*(uint64_t (**)(void *, __n128))(*(void *)v17 + 152))(v29, v20);
  swift_release();
  sub_25123BACC((uint64_t)v29);
  id v27 = v18;
  uint64_t v22 = (*(uint64_t (**)(uint64_t, unsigned char *))(*(void *)v21 + 176))(a4, v26);
  uint64_t v23 = swift_release();
  uint64_t v24 = (*(uint64_t (**)(uint64_t))(*(void *)v22 + 184))(v23);
  swift_release();
  return v24;
}

uint64_t sub_251249664(uint64_t a1)
{
  *(void *)(v1
            + OBJC_IVAR____TtC21HearingModeSettingsUI44HearingAidTuningVoiceEntertainmentController____lazy_storage___toneDarkLightSection) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_25124967C(uint64_t *a1))(void *a1, uint64_t a2)
{
  a1[1] = v1;
  *a1 = sub_2512493C0();
  return sub_2512496C4;
}

uint64_t sub_2512496C4(void *a1, uint64_t a2)
{
  return sub_251239114(a1, a2, &OBJC_IVAR____TtC21HearingModeSettingsUI44HearingAidTuningVoiceEntertainmentController____lazy_storage___toneDarkLightSection);
}

uint64_t sub_2512496D0()
{
  return sub_251248E50(&OBJC_IVAR____TtC21HearingModeSettingsUI44HearingAidTuningVoiceEntertainmentController____lazy_storage___ambientNoiseReductionSection, (uint64_t (*)(uint64_t))sub_2512496F0);
}

uint64_t sub_2512496F0(void *a1)
{
  uint64_t v2 = sub_25126C448();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2, v4);
  uint64_t v6 = &v22[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B2AE30);
  v25[0] = a1;
  sub_25126C3D8();
  uint64_t v7 = type metadata accessor for HearingAidTuningVoiceEntertainmentController();
  uint64_t v8 = sub_2512547C8((uint64_t)v6);
  uint64_t v10 = v9;
  (*(void (**)(unsigned char *, uint64_t))(v3 + 8))(v6, v2);
  uint64_t v11 = sub_251252320();
  uint64_t v13 = sub_25125232C(v11, v12, v8, v10);
  v24[3] = v7;
  v24[0] = a1;
  id v14 = a1;
  char v15 = sub_251243A48();
  __n128 v16 = sub_251252268(0, 0, 0, 0, (uint64_t)v24, 0, 0, -1, (uint64_t)v25, 0, v15 & 1, 0, 0, (__n128)0, 0);
  uint64_t v17 = (*(uint64_t (**)(void *, __n128))(*(void *)v13 + 152))(v25, v16);
  swift_release();
  sub_25123BACC((uint64_t)v25);
  id v23 = v14;
  uint64_t v18 = (*(uint64_t (**)(void (*)(void *), unsigned char *))(*(void *)v17 + 176))(sub_25124ADF4, v22);
  uint64_t v19 = swift_release();
  uint64_t v20 = (*(uint64_t (**)(uint64_t))(*(void *)v18 + 184))(v19);
  swift_release();
  return v20;
}

uint64_t sub_251249974(uint64_t a1)
{
  *(void *)(v1
            + OBJC_IVAR____TtC21HearingModeSettingsUI44HearingAidTuningVoiceEntertainmentController____lazy_storage___ambientNoiseReductionSection) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_25124998C(uint64_t *a1))(void *a1, uint64_t a2)
{
  a1[1] = v1;
  *a1 = sub_2512496D0();
  return sub_2512499D4;
}

uint64_t sub_2512499D4(void *a1, uint64_t a2)
{
  return sub_251239114(a1, a2, &OBJC_IVAR____TtC21HearingModeSettingsUI44HearingAidTuningVoiceEntertainmentController____lazy_storage___ambientNoiseReductionSection);
}

uint64_t sub_2512499E0()
{
  return sub_251248E50(&OBJC_IVAR____TtC21HearingModeSettingsUI44HearingAidTuningVoiceEntertainmentController____lazy_storage___conversationBoostSection, (uint64_t (*)(uint64_t))sub_251249A00);
}

uint64_t sub_251249A00(void *a1)
{
  uint64_t v32 = a1;
  uint64_t v2 = sub_25126C448();
  uint64_t v31 = v2;
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2, v4);
  uint64_t v6 = (char *)&v29 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v37[0] = a1;
  sub_25126C3D8();
  uint64_t v7 = type metadata accessor for HearingAidTuningVoiceEntertainmentController();
  uint64_t v8 = sub_2512547C8((uint64_t)v6);
  uint64_t v10 = v9;
  uint64_t v30 = *(void (**)(char *, uint64_t))(v3 + 8);
  v30(v6, v2);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B2AE30);
  uint64_t v11 = sub_251252320();
  uint64_t v13 = v12;
  uint64_t v14 = sub_251252320();
  uint64_t v16 = sub_25125232C(v11, v13, v14, v15);
  uint64_t v34 = v8;
  uint64_t v35 = v10;
  uint64_t v17 = (*(uint64_t (**)(uint64_t (*)(), char *))(*(void *)v16 + 144))(sub_25124ADF0, v33);
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v18 = v32;
  v37[0] = v32;
  sub_25126C3D8();
  uint64_t v19 = sub_2512547C8((uint64_t)v6);
  uint64_t v21 = v20;
  v30(v6, v31);
  v36[3] = v7;
  v36[0] = v18;
  id v22 = v18;
  char v23 = sub_251243A48();
  __n128 v24 = sub_251252268(0, 0, v19, v21, (uint64_t)v36, (uint64_t)sel_hearingBoostEnabled, (uint64_t)sel_setHearingBoostWithEnabled_, 6, (uint64_t)v37, 0, v23 & 1, 0, 0, (__n128)0, 0);
  uint64_t v25 = (*(uint64_t (**)(void *, __n128))(*(void *)v17 + 152))(v37, v24);
  swift_release();
  uint64_t v26 = sub_25123BACC((uint64_t)v37);
  uint64_t v27 = (*(uint64_t (**)(uint64_t))(*(void *)v25 + 184))(v26);
  swift_release();
  return v27;
}

uint64_t sub_251249D4C(uint64_t a1)
{
  *(void *)(v1
            + OBJC_IVAR____TtC21HearingModeSettingsUI44HearingAidTuningVoiceEntertainmentController____lazy_storage___conversationBoostSection) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_251249D64(uint64_t *a1))(void *a1, uint64_t a2)
{
  a1[1] = v1;
  *a1 = sub_2512499E0();
  return sub_251249DAC;
}

uint64_t sub_251249DAC(void *a1, uint64_t a2)
{
  return sub_251239114(a1, a2, &OBJC_IVAR____TtC21HearingModeSettingsUI44HearingAidTuningVoiceEntertainmentController____lazy_storage___conversationBoostSection);
}

uint64_t sub_251249DB8()
{
  return sub_251248E50(&OBJC_IVAR____TtC21HearingModeSettingsUI44HearingAidTuningVoiceEntertainmentController____lazy_storage___resetAllTuningsSection, sub_251249DD8);
}

uint64_t sub_251249DD8(uint64_t a1)
{
  uint64_t v2 = sub_25126C448();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2, v4);
  uint64_t v6 = (char *)v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B2AE30);
  uint64_t v7 = sub_251252320();
  uint64_t v9 = v8;
  uint64_t v10 = sub_251252320();
  uint64_t v12 = sub_25125232C(v7, v9, v10, v11);
  v24[0] = a1;
  sub_25126C3D8();
  type metadata accessor for HearingAidTuningVoiceEntertainmentController();
  uint64_t v13 = sub_2512547C8((uint64_t)v6);
  uint64_t v15 = v14;
  (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  memset(v23, 0, sizeof(v23));
  uint64_t v16 = swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_retain();
  char v17 = sub_251243A48();
  v22.n128_u64[1] = (unint64_t)sub_25124AC98;
  v22.n128_u64[0] = 0;
  sub_251252268(0, 0, v13, v15, (uint64_t)v23, 0, 0, 13, (uint64_t)v24, 0, v17 & 1, 0, 0, v22, v16);
  swift_release();
  uint64_t v18 = (*(uint64_t (**)(void *))(*(void *)v12 + 168))(v24);
  swift_release();
  uint64_t v19 = sub_25123BACC((uint64_t)v24);
  uint64_t v20 = (*(uint64_t (**)(uint64_t))(*(void *)v18 + 184))(v19);
  swift_release();
  return v20;
}

uint64_t sub_25124A068(uint64_t a1)
{
  *(void *)(v1
            + OBJC_IVAR____TtC21HearingModeSettingsUI44HearingAidTuningVoiceEntertainmentController____lazy_storage___resetAllTuningsSection) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_25124A080(uint64_t *a1))(void *a1, uint64_t a2)
{
  a1[1] = v1;
  *a1 = sub_251249DB8();
  return sub_25124A0C8;
}

uint64_t sub_25124A0C8(void *a1, uint64_t a2)
{
  return sub_251239114(a1, a2, &OBJC_IVAR____TtC21HearingModeSettingsUI44HearingAidTuningVoiceEntertainmentController____lazy_storage___resetAllTuningsSection);
}

id sub_25124A0D4()
{
  id result = sub_251247A70();
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v2 = (void *)sub_25126BD68();

    sub_25126BE18();
    int v4 = v3;

    id v5 = objc_allocWithZone(NSNumber);
    LODWORD(v6) = v4;
    return objc_msgSend(v5, sel_initWithFloat_, v6);
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_25124A1E8(void *a1)
{
  id v2 = sub_251247A70();
  if (v2)
  {
    int v3 = v2;
    id v4 = (id)sub_25126BD68();

    objc_msgSend(a1, sel_floatValue);
    sub_25126BE28();
  }
  else
  {
    __break(1u);
  }
}

id sub_25124A2EC()
{
  id result = sub_251247A70();
  if (result)
  {
    uint64_t v1 = result;
    id v2 = (void *)sub_25126BD68();

    sub_25126BED8();
    return (id)sub_251253C48();
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_25124A3C8(void *a1)
{
  id v2 = sub_251247A70();
  if (v2)
  {
    int v3 = v2;
    id v4 = (id)sub_25126BD68();

    objc_msgSend(a1, sel_BOOLValue);
    sub_25126BEE8();
  }
  else
  {
    __break(1u);
  }
}

id sub_25124A4E4(uint64_t a1)
{
  id v2 = v1;
  id v4 = (void *)sub_25126BB78();
  id v5 = (objc_class *)type metadata accessor for HearingAidTuningVoiceEntertainmentController();
  v14.receiver = v1;
  v14.super_class = v5;
  id v6 = objc_msgSendSuper2(&v14, sel_tableView_cellForRowAtIndexPath_, a1, v4);

  self;
  uint64_t v7 = (void *)swift_dynamicCastObjCClass();
  if (!v7 || (id v8 = v7, objc_msgSend(v7, sel_type) != (id)13))
  {

    id v11 = (id)sub_25126BB78();
    v13.receiver = v2;
    v13.super_class = v5;
    id v8 = objc_msgSendSuper2(&v13, sel_tableView_cellForRowAtIndexPath_, a1, v11);
    goto LABEL_6;
  }
  id v9 = objc_msgSend(v8, sel_textLabel);
  if (v9)
  {
    uint64_t v10 = v9;
    id v11 = objc_msgSend(self, sel_redColor);
    objc_msgSend(v10, sel_setTextColor_, v11);

LABEL_6:
  }
  return v8;
}

id HearingAidTuningVoiceEntertainmentController.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for HearingAidTuningVoiceEntertainmentController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_25124A838(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_25126C8C8();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  unint64_t v4 = *v1;
  if (*v1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v5 = sub_25126C8C8();
    swift_bridgeObjectRelease();
    uint64_t v6 = v5 + v3;
    if (!__OFADD__(v5, v3)) {
      goto LABEL_5;
    }
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  uint64_t v5 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t v6 = v5 + v3;
  if (__OFADD__(v5, v3)) {
    goto LABEL_25;
  }
LABEL_5:
  unint64_t v4 = *v1;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *uint64_t v1 = v4;
  uint64_t v5 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v4 & 0x8000000000000000) == 0 && (v4 & 0x4000000000000000) == 0)
  {
    uint64_t v8 = v4 & 0xFFFFFFFFFFFFFF8;
    if (v6 <= *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      goto LABEL_15;
    }
    uint64_t v5 = 1;
  }
  if (v4 >> 62) {
    goto LABEL_27;
  }
  uint64_t v9 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    if (v9 <= v6) {
      uint64_t v9 = v6;
    }
    swift_bridgeObjectRetain();
    unint64_t v4 = MEMORY[0x253399510](v5, v9, 1, v4);
    swift_bridgeObjectRelease();
    *uint64_t v1 = v4;
    uint64_t v8 = v4 & 0xFFFFFFFFFFFFFF8;
LABEL_15:
    uint64_t result = sub_25123C5FC(v8 + 8 * *(void *)(v8 + 16) + 32, (*(void *)(v8 + 24) >> 1) - *(void *)(v8 + 16), a1);
    if (v11 >= v3) {
      break;
    }
LABEL_26:
    __break(1u);
LABEL_27:
    swift_bridgeObjectRetain();
    uint64_t v9 = sub_25126C8C8();
    swift_bridgeObjectRelease();
  }
  if (v11 >= 1)
  {
    uint64_t v12 = *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    BOOL v13 = __OFADD__(v12, v11);
    uint64_t v14 = v12 + v11;
    if (v13)
    {
      __break(1u);
      return result;
    }
    *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10) = v14;
  }
  swift_bridgeObjectRelease();
  return sub_25126C558();
}

void sub_25124AA04()
{
  *(void *)&v0[OBJC_IVAR____TtC21HearingModeSettingsUI44HearingAidTuningVoiceEntertainmentController__headphoneDevice] = 0;
  *(void *)&v0[OBJC_IVAR____TtC21HearingModeSettingsUI44HearingAidTuningVoiceEntertainmentController_listeners] = MEMORY[0x263F8EE88];
  *(void *)&v0[OBJC_IVAR____TtC21HearingModeSettingsUI44HearingAidTuningVoiceEntertainmentController____lazy_storage___amplificationSliderSection] = 0;
  *(void *)&v0[OBJC_IVAR____TtC21HearingModeSettingsUI44HearingAidTuningVoiceEntertainmentController____lazy_storage___swipeControlAmpSwitchSection] = 0;
  *(void *)&v0[OBJC_IVAR____TtC21HearingModeSettingsUI44HearingAidTuningVoiceEntertainmentController____lazy_storage___transparencyBalanceSection] = 0;
  *(void *)&v0[OBJC_IVAR____TtC21HearingModeSettingsUI44HearingAidTuningVoiceEntertainmentController____lazy_storage___toneDarkLightSection] = 0;
  *(void *)&v0[OBJC_IVAR____TtC21HearingModeSettingsUI44HearingAidTuningVoiceEntertainmentController____lazy_storage___ambientNoiseReductionSection] = 0;
  *(void *)&v0[OBJC_IVAR____TtC21HearingModeSettingsUI44HearingAidTuningVoiceEntertainmentController____lazy_storage___conversationBoostSection] = 0;
  *(void *)&v0[OBJC_IVAR____TtC21HearingModeSettingsUI44HearingAidTuningVoiceEntertainmentController____lazy_storage___resetAllTuningsSection] = 0;

  sub_25126C8B8();
  __break(1u);
}

unint64_t sub_25124AAD8()
{
  unint64_t result = qword_269B2B338;
  if (!qword_269B2B338)
  {
    sub_25126C058();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B2B338);
  }
  return result;
}

uint64_t sub_25124AB30()
{
  swift_unknownObjectWeakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_25124AB68()
{
  uint64_t v1 = v0 + 16;
  if (qword_269B2C2E8 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_25126C0E8();
  __swift_project_value_buffer(v2, (uint64_t)qword_269B2D470);
  uint64_t v3 = sub_25126C0C8();
  os_log_type_t v4 = sub_25126C648();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_251222000, v3, v4, "objectWillChange: reload called", v5, 2u);
    MEMORY[0x253399FB0](v5, -1, -1);
  }

  swift_beginAccess();
  uint64_t v6 = (void *)MEMORY[0x25339A050](v1);
  if (v6)
  {
    uint64_t v7 = v6;
    objc_msgSend(v6, sel_reloadSpecifiers);
  }
}

uint64_t method lookup function for HearingAidTuningVoiceEntertainmentController(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for HearingAidTuningVoiceEntertainmentController);
}

void sub_25124AC98()
{
  uint64_t v1 = v0 + 16;
  swift_beginAccess();
  uint64_t v2 = MEMORY[0x25339A050](v0 + 16);
  if (v2)
  {
    uint64_t v3 = (void *)v2;
    id v4 = sub_251247A70();

    if (v4)
    {
      uint64_t v5 = (void *)sub_25126BD68();
      swift_allocObject();
      swift_beginAccess();
      uint64_t v6 = (void *)MEMORY[0x25339A050](v1);
      swift_unknownObjectWeakInit();

      swift_retain();
      sub_25126BE08();

      swift_release_n();
    }
  }
}

void sub_25124AD94()
{
  swift_beginAccess();
  uint64_t v1 = (void *)MEMORY[0x25339A050](v0 + 16);
  if (v1)
  {
    uint64_t v2 = v1;
    objc_msgSend(v1, sel_reloadSpecifiers);
  }
}

void sub_25124ADF4(void *a1)
{
}

uint64_t sub_25124ADFC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B2AF78);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void sub_25124AE64(void *a1)
{
}

void sub_25124AE6C(void *a1)
{
}

void sub_25124AE74(void *a1, char a2)
{
  uint64_t v8 = type metadata accessor for HearingAidTuningValuesSliderCell();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B2B340);
  objc_msgSend(a1, sel_setProperty_forKey_, sub_25126C978(), *MEMORY[0x263F5FFE0], v8);
  swift_unknownObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B2AF58);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_25126E8B0;
  *(void *)(inited + 32) = 0x745F726564696C73;
  *(void *)(inited + 40) = 0xEB00000000657079;
  *(unsigned char *)(inited + 48) = a2;
  *(void *)(inited + 72) = &type metadata for HearingAidTuningValuesSliderCell.SliderType;
  *(void *)(inited + 80) = 0x6E6F687064616568;
  *(void *)(inited + 88) = 0xEF65636976654465;
  id v5 = sub_251247A70();
  if (v5)
  {
    id v6 = v5;
    *(void *)(inited + 120) = sub_25126BDB8();
    *(void *)(inited + 96) = v6;
    sub_251234B54(inited);
    uint64_t v7 = (void *)sub_25126C3B8();
    swift_bridgeObjectRelease();
    objc_msgSend(a1, sel_setUserInfo_, v7);
  }
  else
  {
    __break(1u);
  }
}

void sub_25124AFE4(void *a1)
{
  id v2 = (id)sub_25126C458();
  objc_msgSend(a1, sel_setProperty_forKey_, v2, *MEMORY[0x263F600F8]);
}

void sub_25124B04C(void *a1)
{
  type metadata accessor for HearingAidTuningAmplificationSliderCell();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B2B348);
  objc_msgSend(a1, sel_setProperty_forKey_, sub_25126C978(), *MEMORY[0x263F5FFE0]);
  swift_unknownObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B2B350);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_25126E8C0;
  *(void *)(inited + 32) = 0x6E6F687064616568;
  *(void *)(inited + 40) = 0xEF65636976654465;
  id v3 = sub_251247A70();
  if (v3)
  {
    *(void *)(inited + 48) = v3;
    sub_251248CA8(inited);
    sub_25126BDB8();
    uint64_t v4 = (void *)sub_25126C3B8();
    swift_bridgeObjectRelease();
    objc_msgSend(a1, sel_setUserInfo_, v4);
  }
  else
  {
    __break(1u);
  }
}

unint64_t sub_25124B17C()
{
  unint64_t result = qword_269B2AF48;
  if (!qword_269B2AF48)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269B2AEA8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B2AF48);
  }
  return result;
}

uint64_t sub_25124B1D8(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = objc_allocWithZone((Class)sub_25126BD28());
  id v5 = a3;
  swift_bridgeObjectRetain();
  return sub_25126BD18();
}

id _HearingAidInternalViewController.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

id _HearingAidInternalViewController.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for _HearingAidInternalViewController();
  return objc_msgSendSuper2(&v2, sel_init);
}

uint64_t type metadata accessor for _HearingAidInternalViewController()
{
  return self;
}

id _HearingAidInternalViewController.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for _HearingAidInternalViewController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t method lookup function for _HearingAidInternalViewController(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for _HearingAidInternalViewController);
}

uint64_t dispatch thunk of _HearingAidInternalViewController.makeMediaAssistViewController(address:audiogramSample:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x50))();
}

uint64_t sub_25124B438()
{
  uint64_t v0 = sub_25126C0E8();
  __swift_allocate_value_buffer(v0, qword_269B2D488);
  __swift_project_value_buffer(v0, (uint64_t)qword_269B2D488);
  return sub_25126C0D8();
}

uint64_t sub_25124B4BC()
{
  if (qword_269B2C2F0 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_25126C0E8();
  return __swift_project_value_buffer(v0, (uint64_t)qword_269B2D488);
}

uint64_t sub_25124B520@<X0>(uint64_t a1@<X8>)
{
  if (qword_269B2C2F0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_25126C0E8();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_269B2D488);
  id v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);
  return v4(a1, v3, v2);
}

uint64_t sub_25124B5C8(uint64_t result)
{
  return result;
}

uint64_t sub_25124B62C()
{
  return swift_unknownObjectRetain();
}

uint64_t sub_25124B6E0(uint64_t a1)
{
  uint64_t v3 = (void *)(v1 + OBJC_IVAR____TtC21HearingModeSettingsUI30HearingAssistWelcomeController_flowController);
  swift_beginAccess();
  void *v3 = a1;
  return swift_unknownObjectRelease();
}

uint64_t sub_25124B734@<X0>(void **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & **a1) + 0x78))();
  *a2 = result;
  return result;
}

uint64_t sub_25124B790(uint64_t a1, void **a2)
{
  uint64_t v2 = *(uint64_t (**)(uint64_t))((*MEMORY[0x263F8EED0] & **a2) + 0x80);
  uint64_t v3 = swift_unknownObjectRetain();
  return v2(v3);
}

uint64_t (*sub_25124B7F4())()
{
  return j__swift_endAccess;
}

id sub_25124B850(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return sub_25124B884(a1);
}

id sub_25124B884(void *a1)
{
  uint64_t v2 = v1;
  swift_getObjectType();
  uint64_t v4 = sub_25126C448();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)&v1[OBJC_IVAR____TtC21HearingModeSettingsUI30HearingAssistWelcomeController_flowController] = 0;
  *(void *)&v1[OBJC_IVAR____TtC21HearingModeSettingsUI30HearingAssistWelcomeController____lazy_storage___primaryBoldButton] = 0;
  *(void *)&v1[OBJC_IVAR____TtC21HearingModeSettingsUI30HearingAssistWelcomeController____lazy_storage___secondaryLinkButton] = 0;
  *(void *)&v1[OBJC_IVAR____TtC21HearingModeSettingsUI30HearingAssistWelcomeController_lisenters] = MEMORY[0x263F8EE88];
  *(void *)&v1[OBJC_IVAR____TtC21HearingModeSettingsUI30HearingAssistWelcomeController_serviceClient] = a1;
  id v15 = a1;
  sub_25126C3D8();
  sub_2512547C8((uint64_t)v7);
  uint64_t v8 = *(void (**)(char *, uint64_t))(v5 + 8);
  v8(v7, v4);
  uint64_t v9 = (void *)sub_25126C458();
  swift_bridgeObjectRelease();
  sub_25126C3D8();
  sub_2512547C8((uint64_t)v7);
  v8(v7, v4);
  uint64_t v10 = (void *)sub_25126C458();
  swift_bridgeObjectRelease();
  uint64_t v11 = (objc_class *)type metadata accessor for HearingAssistWelcomeController();
  v16.receiver = v2;
  v16.super_class = v11;
  id v12 = objc_msgSendSuper2(&v16, sel_initWithTitle_detailText_icon_contentLayout_, v9, v10, 0, 2);

  return v12;
}

uint64_t type metadata accessor for HearingAssistWelcomeController()
{
  return self;
}

id sub_25124BAE0()
{
  return sub_25124BB88(&OBJC_IVAR____TtC21HearingModeSettingsUI30HearingAssistWelcomeController____lazy_storage___primaryBoldButton, 0x263F5B898, (SEL *)&selRef_boldButton, 0);
}

uint64_t sub_25124BB00(uint64_t a1)
{
  *(void *)(v1
            + OBJC_IVAR____TtC21HearingModeSettingsUI30HearingAssistWelcomeController____lazy_storage___primaryBoldButton) = a1;
  return MEMORY[0x270F9A758]();
}

void (*sub_25124BB14(id *a1))(uint64_t *a1, uint64_t a2)
{
  a1[1] = v1;
  *a1 = sub_25124BAE0();
  return sub_25124BB5C;
}

void sub_25124BB5C(uint64_t *a1, uint64_t a2)
{
}

id sub_25124BB68()
{
  return sub_25124BB88(&OBJC_IVAR____TtC21HearingModeSettingsUI30HearingAssistWelcomeController____lazy_storage___secondaryLinkButton, 0x263F5B8D0, (SEL *)&selRef_linkButton, 1);
}

id sub_25124BB88(uint64_t *a1, uint64_t a2, SEL *a3, int a4)
{
  uint64_t v5 = *a1;
  uint64_t v6 = *(void **)(v4 + *a1);
  if (v6)
  {
    id v7 = *(id *)(v4 + *a1);
  }
  else
  {
    id v9 = [self *a3];
    sub_25124D43C(v9, a4);
    uint64_t v10 = *(void **)(v4 + v5);
    *(void *)(v4 + v5) = v9;
    id v7 = v9;

    uint64_t v6 = 0;
  }
  id v11 = v6;
  return v7;
}

uint64_t sub_25124BC14(uint64_t a1)
{
  *(void *)(v1
            + OBJC_IVAR____TtC21HearingModeSettingsUI30HearingAssistWelcomeController____lazy_storage___secondaryLinkButton) = a1;
  return MEMORY[0x270F9A758]();
}

void (*sub_25124BC28(id *a1))(uint64_t *a1, uint64_t a2)
{
  a1[1] = v1;
  *a1 = sub_25124BB68();
  return sub_25124BC70;
}

void sub_25124BC70(uint64_t *a1, uint64_t a2)
{
}

void sub_25124BC7C(uint64_t *a1, uint64_t a2, void *a3)
{
  uint64_t v4 = *a1;
  uint64_t v3 = a1[1];
  uint64_t v5 = *(void **)(v3 + *a3);
  *(void *)(v3 + *a3) = v4;
}

void sub_25124BC90(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_25126C0E8();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v4, v6);
  id v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = (void *)(*(uint64_t (**)(uint64_t))((*MEMORY[0x263F8EED0] & *v1) + 0x78))(v7);
  if (v10)
  {
    id v11 = objc_msgSend(v10, sel_headphoneDevice);
    swift_unknownObjectRelease();
    id v12 = self;
    sub_25126BDA8();
    BOOL v13 = (void *)sub_25126C458();
    swift_bridgeObjectRelease();
    id v22 = objc_msgSend(v12, sel_makeTestResultsControllerWithSample_bluetoothAddress_, a1, v13);

    id v14 = objc_msgSend(v2, sel_navigationController);
    if (v14)
    {
      id v15 = v14;
      objc_msgSend(v14, sel_pushViewController_animated_, v22, 1);
    }
    objc_super v16 = v22;
  }
  else
  {
    uint64_t v17 = sub_251250BE0();
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v9, v17, v4);
    uint64_t v18 = sub_25126C0C8();
    os_log_type_t v19 = sub_25126C638();
    if (os_log_type_enabled(v18, v19))
    {
      uint64_t v20 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v20 = 0;
      _os_log_impl(&dword_251222000, v18, v19, "HearingAssistWelcomeController::audiogramIngestionDidSaveAudiogram early exit as we dont have a headphoneDevice no flow controller", v20, 2u);
      MEMORY[0x253399FB0](v20, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v5 + 8))(v9, v4);
  }
}

uint64_t sub_25124BF78()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_25124BFC4(uint64_t a1)
{
  uint64_t v3 = (void *)(v1 + OBJC_IVAR____TtC21HearingModeSettingsUI30HearingAssistWelcomeController_lisenters);
  swift_beginAccess();
  void *v3 = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_25124C018())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_25124C074()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_25126C0E8();
  uint64_t v49 = *(void *)(v2 - 8);
  uint64_t v50 = v2;
  MEMORY[0x270FA5388](v2, v3);
  uint64_t v48 = (char *)&v48 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B2B058);
  uint64_t v52 = *(void *)(v5 - 8);
  uint64_t v53 = v5;
  MEMORY[0x270FA5388](v5, v6);
  uint64_t v51 = (char *)&v48 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B2B390);
  uint64_t v55 = *(void *)(v8 - 8);
  uint64_t v56 = v8;
  MEMORY[0x270FA5388](v8, v9);
  uint64_t v54 = (char *)&v48 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B2B398);
  uint64_t v58 = *(void *)(v11 - 8);
  uint64_t v59 = v11;
  MEMORY[0x270FA5388](v11, v12);
  uint64_t v57 = (char *)&v48 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_25126C448();
  uint64_t v15 = *(void *)(v14 - 8);
  MEMORY[0x270FA5388](v14, v16);
  uint64_t v18 = (char *)&v48 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  os_log_type_t v19 = (objc_class *)type metadata accessor for HearingAssistWelcomeController();
  v61.receiver = v0;
  v61.super_class = v19;
  objc_msgSendSuper2(&v61, sel_viewDidLoad);
  v60[0] = v0;
  sub_25126C3D8();
  sub_2512547C8((uint64_t)v18);
  uint64_t v20 = *(void (**)(char *, uint64_t))(v15 + 8);
  v20(v18, v14);
  uint64_t v21 = (void *)sub_25126C458();
  swift_bridgeObjectRelease();
  v60[0] = v0;
  sub_25126C3D8();
  sub_2512547C8((uint64_t)v18);
  v20(v18, v14);
  id v22 = (void *)sub_25126C458();
  swift_bridgeObjectRelease();
  char v23 = (void *)sub_25126C458();
  objc_msgSend(v1, sel_addBulletedListItemWithTitle_description_symbolName_, v21, v22, v23);

  v60[0] = v1;
  sub_25126C3D8();
  sub_2512547C8((uint64_t)v18);
  v20(v18, v14);
  __n128 v24 = (void *)sub_25126C458();
  swift_bridgeObjectRelease();
  v60[0] = v1;
  sub_25126C3D8();
  sub_2512547C8((uint64_t)v18);
  v20(v18, v14);
  uint64_t v25 = (void *)sub_25126C458();
  swift_bridgeObjectRelease();
  uint64_t v26 = (void *)sub_25126C458();
  objc_msgSend(v1, sel_addBulletedListItemWithTitle_description_symbolName_, v24, v25, v26);

  uint64_t v27 = (void *)MEMORY[0x263F8EED0];
  uint64_t v28 = (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v1) + 0x78))();
  if (v28)
  {
    uint64_t v29 = (void *)v28;
    sub_25124CF2C();
    id v30 = objc_msgSend(v29, sel_headphoneDevice);
    uint64_t v31 = (void *)sub_25126BD68();

    uint64_t v32 = v51;
    sub_25126BE98();

    uint64_t v33 = v53;
    uint64_t v34 = sub_25126C2B8();
    (*(void (**)(char *, uint64_t))(v52 + 8))(v32, v33);
    v60[0] = v34;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269B2B070);
    sub_25123E030(&qword_269B2B078, &qword_269B2B070);
    uint64_t v35 = v54;
    sub_25126C318();
    swift_release();
    sub_25123E030(&qword_269B2B3A0, &qword_269B2B390);
    sub_25124E1E4();
    uint64_t v36 = v56;
    uint64_t v37 = v57;
    sub_25126C328();
    (*(void (**)(char *, uint64_t))(v55 + 8))(v35, v36);
    swift_allocObject();
    swift_unknownObjectWeakInit();
    sub_25123E030((unint64_t *)&unk_269B2B3C8, &qword_269B2B398);
    uint64_t v38 = v59;
    sub_25126C338();
    swift_release();
    (*(void (**)(char *, uint64_t))(v58 + 8))(v37, v38);
    uint64_t v39 = (void (*)(void *, void))(*(uint64_t (**)(void *))((*v27 & *v1) + 0xE0))(v60);
    sub_25126C228();
    swift_release();
    v39(v60, 0);
    return swift_unknownObjectRelease();
  }
  else
  {
    uint64_t v41 = sub_251250BE0();
    uint64_t v43 = v48;
    uint64_t v42 = v49;
    uint64_t v44 = v50;
    (*(void (**)(char *, uint64_t, uint64_t))(v49 + 16))(v48, v41, v50);
    uint64_t v45 = sub_25126C0C8();
    os_log_type_t v46 = sub_25126C638();
    if (os_log_type_enabled(v45, v46))
    {
      id v47 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v47 = 0;
      _os_log_impl(&dword_251222000, v45, v46, "Can not load HearingAssistWelcomeController due to depedencies not met flowController is nil", v47, 2u);
      MEMORY[0x253399FB0](v47, -1, -1);
    }

    return (*(uint64_t (**)(char *, uint64_t))(v42 + 8))(v43, v44);
  }
}

void sub_25124C92C(char a1)
{
  uint64_t v2 = v1;
  v9.receiver = v1;
  v9.super_class = (Class)type metadata accessor for HearingAssistWelcomeController();
  objc_msgSendSuper2(&v9, sel_viewDidAppear_, a1 & 1);
  sub_25126BCA8();
  uint64_t v4 = (void *)sub_25126BC88();
  sub_25126BC68();
  sub_25126BC98();

  uint64_t v5 = (void *)sub_25126BC88();
  uint64_t v6 = (void *)(*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v2) + 0x78))();
  if (v6)
  {
    id v7 = objc_msgSend(v6, sel_headphoneDevice);
    swift_unknownObjectRelease();
    uint64_t v8 = (void *)sub_25126BD58();

    objc_msgSend(v8, sel_productID);
  }
  sub_25126BC98();
}

void sub_25124CAB0(char a1)
{
  v7.receiver = v1;
  v7.super_class = (Class)type metadata accessor for HearingAssistWelcomeController();
  objc_msgSendSuper2(&v7, sel_viewWillAppear_, a1 & 1);
  sub_25126BDF8();
  uint64_t v3 = (void *)sub_25126BDD8();
  uint64_t v4 = (void *)sub_25126BDE8();

  v6[4] = sub_25124CB98;
  v6[5] = 0;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 1107296256;
  v6[2] = sub_251240CB4;
  v6[3] = &block_descriptor_0;
  uint64_t v5 = _Block_copy(v6);
  objc_msgSend(v4, sel_triggerFetchAudiogramsWithCompletion_, v5);
  _Block_release(v5);
}

uint64_t sub_25124CB98(void *a1)
{
  uint64_t v2 = sub_25126C0E8();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2, v4);
  uint64_t v6 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_269B2C2F0 != -1) {
    swift_once();
  }
  uint64_t v7 = __swift_project_value_buffer(v2, (uint64_t)qword_269B2D488);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v6, v7, v2);
  id v8 = a1;
  id v9 = a1;
  uint64_t v10 = sub_25126C0C8();
  os_log_type_t v11 = sub_25126C648();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = (uint8_t *)swift_slowAlloc();
    uint64_t v13 = swift_slowAlloc();
    uint64_t v19 = v13;
    *(_DWORD *)uint64_t v12 = 136315138;
    uint64_t v21 = v13;
    if (a1) {
      uint64_t v14 = 0x64656C696146;
    }
    else {
      uint64_t v14 = 0x6564656563637553;
    }
    if (a1) {
      unint64_t v15 = 0xE600000000000000;
    }
    else {
      unint64_t v15 = 0xE900000000000064;
    }
    uint64_t v20 = sub_251240E7C(v14, v15, &v21);
    sub_25126C768();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_251222000, v10, v11, "Audiogram Refresh: [HearingAssistWelcomeController] Refresh Trigger %s", v12, 0xCu);
    uint64_t v16 = v19;
    swift_arrayDestroy();
    MEMORY[0x253399FB0](v16, -1, -1);
    MEMORY[0x253399FB0](v12, -1, -1);
  }
  else
  {
  }
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v6, v2);
}

uint64_t sub_25124CF2C()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_25126C0E8();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v2, v4);
  uint64_t v7 = (char *)&v43 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5, v8);
  uint64_t v10 = (char *)&v43 - v9;
  uint64_t v11 = sub_25126C448();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v14 = MEMORY[0x270FA5388](v11, v13);
  uint64_t v16 = (char *)&v43 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = (*(uint64_t (**)(uint64_t))((*MEMORY[0x263F8EED0] & *v0) + 0x78))(v14);
  if (v17)
  {
    uint64_t v18 = (void *)v17;
    uint64_t v44 = v10;
    uint64_t v45 = v2;
    id v19 = objc_msgSend(v0, sel_buttonTray);
    os_log_type_t v46 = v0;
    sub_25126C3D8();
    type metadata accessor for HearingAssistWelcomeController();
    sub_2512547C8((uint64_t)v16);
    (*(void (**)(char *, uint64_t))(v12 + 8))(v16, v11);
    uint64_t v20 = (void *)sub_25126C458();
    swift_bridgeObjectRelease();
    objc_msgSend(v19, sel_setCaptionText_, v20);

    uint64_t v21 = (void *)MEMORY[0x263F8EED0];
    id v22 = *(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v1) + 0x98);
    char v23 = (void *)v22();
    sub_25124D43C(v23, 0);

    id v24 = objc_msgSend(v1, (SEL)&selRef_animateWithDuration_animations_ + 3);
    uint64_t v25 = (void *)v22();
    objc_msgSend(v24, sel_addButton_, v25);

    id v26 = objc_msgSend(v18, sel_headphoneDevice);
    uint64_t v27 = (void *)sub_25126BD68();

    LODWORD(v22) = sub_25126BF78();
    if (v22 == 2)
    {
      uint64_t v28 = *(uint64_t (**)(void))((*v21 & *v1) + 0xB0);
      uint64_t v29 = (void *)v28();
      sub_25124D43C(v29, 1);

      id v30 = objc_msgSend(v1, (SEL)&selRef_animateWithDuration_animations_ + 3);
      uint64_t v31 = (void *)v28();
      objc_msgSend(v30, sel_addButton_, v31);

      uint64_t v32 = sub_251250BE0();
      uint64_t v34 = v44;
      uint64_t v33 = v45;
      (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v44, v32, v45);
      uint64_t v35 = sub_25126C0C8();
      os_log_type_t v36 = sub_25126C638();
      if (os_log_type_enabled(v35, v36))
      {
        uint64_t v37 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v37 = 0;
        _os_log_impl(&dword_251222000, v35, v36, "Hearing Test Supported -- Adding second button", v37, 2u);
        MEMORY[0x253399FB0](v37, -1, -1);

        swift_unknownObjectRelease();
      }
      else
      {
        swift_unknownObjectRelease();
      }
      return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v34, v33);
    }
    else
    {
      return swift_unknownObjectRelease();
    }
  }
  else
  {
    uint64_t v38 = sub_251250BE0();
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v7, v38, v2);
    uint64_t v39 = sub_25126C0C8();
    os_log_type_t v40 = sub_25126C638();
    if (os_log_type_enabled(v39, v40))
    {
      uint64_t v41 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v41 = 0;
      _os_log_impl(&dword_251222000, v39, v40, "Can not load HearingAssistWelcomeController due to depedencies not met flowController is nil", v41, 2u);
      MEMORY[0x253399FB0](v41, -1, -1);
    }

    return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v7, v2);
  }
}

void sub_25124D43C(void *a1, int a2)
{
  uint64_t v3 = v2;
  v31[1] = a2;
  uint64_t v5 = sub_25126C0E8();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5, v7);
  uint64_t v9 = (char *)v31 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_25126C448();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v13 = MEMORY[0x270FA5388](v10, v12);
  uint64_t v15 = (char *)v31 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = (void *)(*(uint64_t (**)(uint64_t))((*MEMORY[0x263F8EED0] & *v2) + 0x78))(v13);
  if (v16)
  {
    uint64_t v17 = v16;
    id v18 = objc_msgSend(v16, sel_headphoneDevice);
    id v19 = (void *)sub_25126BD68();

    sub_25126BF78();
    id v20 = objc_msgSend(v17, sel_headphoneDevice);
    uint64_t v21 = (void *)sub_25126BD68();

    unint64_t v22 = sub_25126BE68();
    if (v22 >> 62)
    {
      swift_bridgeObjectRetain();
      sub_25126C8C8();
      swift_bridgeObjectRelease();
    }
    uint64_t v23 = swift_bridgeObjectRelease();
    MEMORY[0x270FA5388](v23, v24);
    sub_25126C748();
    uint64_t v32 = v3;
    sub_25126C3D8();
    type metadata accessor for HearingAssistWelcomeController();
    sub_2512547C8((uint64_t)v15);
    (*(void (**)(char *, uint64_t))(v11 + 8))(v15, v10);
    uint64_t v29 = (void *)sub_25126C458();
    swift_bridgeObjectRelease();
    objc_msgSend(a1, sel_setTitle_forState_, v29, 0);

    sub_25123DFF4(0, &qword_269B2B050);
    swift_allocObject();
    swift_unknownObjectWeakInit();
    id v30 = (void *)sub_25126C728();
    objc_msgSend(a1, sel_addAction_forControlEvents_, v30, 64);
    swift_unknownObjectRelease();
  }
  else
  {
    uint64_t v25 = sub_251250BE0();
    (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v9, v25, v5);
    id v26 = sub_25126C0C8();
    os_log_type_t v27 = sub_25126C638();
    if (os_log_type_enabled(v26, v27))
    {
      uint64_t v28 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v28 = 0;
      _os_log_impl(&dword_251222000, v26, v27, "Can not load HearingAssistWelcomeController due to depedencies not met flowController is nil", v28, 2u);
      MEMORY[0x253399FB0](v28, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
  }
}

void sub_25124DAA8(uint64_t a1)
{
  uint64_t v2 = sub_25126C0E8();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2, v4);
  uint64_t v6 = (char *)&v32 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = a1 + 16;
  swift_beginAccess();
  uint64_t v8 = (void *)MEMORY[0x25339A050](a1 + 16);
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = (void *)MEMORY[0x263F8EED0];
    uint64_t v11 = (void *)(*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v8) + 0x78))();

    if (v11)
    {
      id v12 = objc_msgSend(v11, sel_headphoneDevice);
      swift_unknownObjectRelease();
      type metadata accessor for HMHearingTestService();
      uint64_t v13 = HMHearingTestService.__allocating_init()();
      uint64_t v14 = (void *)(*(uint64_t (**)(void))((*v10 & *v13) + 0x58))();

      self;
      uint64_t v15 = (void *)swift_dynamicCastObjCClass();
      if (v15)
      {
        id v16 = objc_msgSend(v15, sel_topViewController);
        if (v16)
        {
          uint64_t v17 = v16;
          swift_beginAccess();
          uint64_t v18 = MEMORY[0x25339A050](v7);
          if (v18)
          {
            id v19 = (void *)v18;
            id v20 = objc_retain(*(id *)(v18
                                    + OBJC_IVAR____TtC21HearingModeSettingsUI30HearingAssistWelcomeController_serviceClient));

            sub_25126BCA8();
            uint64_t v21 = (void *)sub_25126BC88();
            sub_25126BC68();
            sub_25126BC98();

            sub_25123DFF4(0, &qword_269B2B3D8);
            uint64_t v22 = swift_allocObject();
            swift_beginAccess();
            uint64_t v23 = (void *)MEMORY[0x25339A050](v7);
            swift_unknownObjectWeakInit();
            uint64_t v24 = swift_allocObject();
            uint64_t v25 = (void *)MEMORY[0x25339A050](v7);

            swift_unknownObjectWeakInit();
            swift_retain();

            uint64_t v26 = swift_allocObject();
            *(void *)(v26 + 16) = v24;
            *(void *)(v26 + 24) = v17;
            swift_retain();
            id v27 = v17;
            static HearingModeUIService.showOcclusionAlert(_:serviceClient:presentAction:passAction:)(v12, v20, sub_25124E664, v22, sub_25124E73C, v26);
            swift_release();
            swift_release();
            swift_release_n();

            return;
          }
        }
      }
    }
  }
  uint64_t v28 = sub_251250BE0();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v6, v28, v2);
  uint64_t v29 = sub_25126C0C8();
  os_log_type_t v30 = sub_25126C638();
  if (os_log_type_enabled(v29, v30))
  {
    uint64_t v31 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v31 = 0;
    _os_log_impl(&dword_251222000, v29, v30, "Unable to show results page as depedencies not met.", v31, 2u);
    MEMORY[0x253399FB0](v31, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
}

id HearingAssistWelcomeController.__allocating_init(title:detailText:symbolName:contentLayout:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v8 = v7;
  id v12 = (void *)sub_25126C458();
  swift_bridgeObjectRelease();
  if (!a4)
  {
    uint64_t v13 = 0;
    if (a6) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v14 = 0;
    goto LABEL_6;
  }
  uint64_t v13 = (void *)sub_25126C458();
  swift_bridgeObjectRelease();
  if (!a6) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v14 = (void *)sub_25126C458();
  swift_bridgeObjectRelease();
LABEL_6:
  id v15 = objc_msgSend(objc_allocWithZone(v8), sel_initWithTitle_detailText_symbolName_contentLayout_, v12, v13, v14, a7);

  return v15;
}

void HearingAssistWelcomeController.init(title:detailText:symbolName:contentLayout:)()
{
}

id HearingAssistWelcomeController.__allocating_init(title:detailText:icon:contentLayout:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6)
{
  uint64_t v7 = v6;
  uint64_t v11 = (void *)sub_25126C458();
  swift_bridgeObjectRelease();
  if (a4)
  {
    id v12 = (void *)sub_25126C458();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v12 = 0;
  }
  id v13 = objc_msgSend(objc_allocWithZone(v7), sel_initWithTitle_detailText_icon_contentLayout_, v11, v12, a5, a6);

  return v13;
}

void HearingAssistWelcomeController.init(title:detailText:icon:contentLayout:)()
{
}

id HearingAssistWelcomeController.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for HearingAssistWelcomeController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t sub_25124E1E4()
{
  unint64_t result = qword_269B2B3A8;
  if (!qword_269B2B3A8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269B2B3B0);
    sub_25124E258();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B2B3A8);
  }
  return result;
}

unint64_t sub_25124E258()
{
  unint64_t result = qword_269B2B3B8;
  if (!qword_269B2B3B8)
  {
    sub_25123DFF4(255, &qword_269B2B100);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B2B3B8);
  }
  return result;
}

uint64_t sub_25124E2C0()
{
  swift_unknownObjectWeakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_25124E2F8()
{
  uint64_t v1 = v0 + 16;
  swift_beginAccess();
  objc_super v2 = (void *)MEMORY[0x25339A050](v0 + 16);
  if (v2)
  {
    uint64_t v3 = v2;
    id v4 = objc_msgSend(v2, sel_buttonTray);

    objc_msgSend(v4, sel_removeAllButtons);
  }
  swift_beginAccess();
  uint64_t v5 = MEMORY[0x25339A050](v1);
  if (v5)
  {
    uint64_t v6 = (void *)v5;
    sub_25124CF2C();
  }
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

uint64_t method lookup function for HearingAssistWelcomeController(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for HearingAssistWelcomeController);
}

uint64_t dispatch thunk of HearingAssistWelcomeController.flowController.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x78))();
}

uint64_t dispatch thunk of HearingAssistWelcomeController.flowController.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x80))();
}

uint64_t dispatch thunk of HearingAssistWelcomeController.flowController.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x88))();
}

uint64_t dispatch thunk of HearingAssistWelcomeController.audiogramIngestionDidSaveAudiogram(_:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xC8))();
}

id sub_25124E4A8(id result, uint64_t a2, uint64_t a3)
{
  if (result) {
    return objc_msgSend(*(id *)(v3 + 16), sel_removeAction_forControlEvents_, result, a3);
  }
  return result;
}

void sub_25124E4C8()
{
  swift_beginAccess();
  uint64_t v1 = (void *)MEMORY[0x25339A050](v0 + 16);
  if (v1)
  {
    uint64_t v2 = v1;
    id v3 = objc_msgSend(v1, sel_navigationController);
    if (v3)
    {
      id v4 = v3;
      id v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F28EC0]), sel_initWithDelegate_, v2);
      objc_msgSend(v5, sel_setAnalyticsClient_, 2);
      objc_msgSend(v4, sel_presentViewController_animated_completion_, v5, 1, 0);
    }
  }
}

void sub_25124E590()
{
  swift_beginAccess();
  uint64_t v1 = (void *)MEMORY[0x25339A050](v0 + 16);
  if (v1)
  {
    uint64_t v2 = v1;
    id v3 = objc_msgSend(v1, sel_navigationController);

    if (v3)
    {
      type metadata accessor for HearingAidUserAgeCheckViewController();
      id v4 = sub_2512454B8();
      objc_msgSend(v3, sel_pushViewController_animated_, v4, 1);
    }
  }
  sub_25126BCA8();
  id v5 = (void *)sub_25126BC88();
  sub_25126BC68();
  sub_25126BC98();
}

void sub_25124E65C()
{
  sub_25124DAA8(v0);
}

void sub_25124E664(uint64_t a1)
{
  swift_beginAccess();
  id v3 = (void *)MEMORY[0x25339A050](v1 + 16);
  if (v3)
  {
    id v4 = v3;
    id v5 = objc_msgSend(v3, sel_navigationController);

    if (v5)
    {
      objc_msgSend(v5, sel_presentViewController_animated_completion_, a1, 1, 0);
    }
  }
}

uint64_t sub_25124E6FC()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

void sub_25124E73C()
{
  uint64_t v1 = *(void *)(v0 + 24);
  uint64_t v2 = *(void *)(v0 + 16) + 16;
  swift_beginAccess();
  id v3 = (void *)MEMORY[0x25339A050](v2);
  if (v3)
  {
    id v4 = v3;
    id v5 = objc_msgSend(v3, sel_navigationController);

    if (v5)
    {
      objc_msgSend(v5, sel_pushViewController_animated_, v1, 1);
    }
  }
}

uint64_t sub_25124E7D8()
{
  uint64_t v0 = sub_25126C0E8();
  __swift_allocate_value_buffer(v0, qword_269B2D4A0);
  __swift_project_value_buffer(v0, (uint64_t)qword_269B2D4A0);
  return sub_25126C0D8();
}

uint64_t sub_25124E850()
{
  if (qword_269B2C300 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_25126C0E8();
  return __swift_project_value_buffer(v0, (uint64_t)qword_269B2D4A0);
}

uint64_t sub_25124E8B4@<X0>(uint64_t a1@<X8>)
{
  if (qword_269B2C300 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_25126C0E8();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_269B2D4A0);
  id v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);
  return v4(a1, v3, v2);
}

uint64_t sub_25124E95C(void *a1, uint64_t a2)
{
  uint64_t v4 = sub_25126C448();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4, v6);
  uint64_t v8 = (char *)&v33 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  switch(a2)
  {
    case 0:
      uint64_t v41 = 0;
      sub_25126C3D8();
      uint64_t v9 = sub_2512547C8((uint64_t)v8);
      uint64_t v10 = *(void (**)(char *, uint64_t))(v5 + 8);
      v10(v8, v4);
      uint64_t v41 = 0;
      sub_25126C3D8();
      sub_2512547C8((uint64_t)v8);
      v10(v8, v4);
      return v9;
    case 1:
      uint64_t v36 = v4;
      id v16 = objc_msgSend(self, sel_sharedInstance);
      uint64_t v41 = sub_25126BDA8();
      unint64_t v42 = v17;
      uint64_t v39 = 45;
      unint64_t v40 = 0xE100000000000000;
      uint64_t v37 = 58;
      unint64_t v38 = 0xE100000000000000;
      sub_25123DF44();
      sub_25126C788();
      swift_bridgeObjectRelease();
      uint64_t v18 = (void *)sub_25126C458();
      swift_bridgeObjectRelease();
      unsigned int v19 = objc_msgSend(v16, sel_activeHearingProtectionEnabledForAddress_, v18);

      BOOL v20 = v19 == 0;
      if (v19) {
        uint64_t v21 = 28239;
      }
      else {
        uint64_t v21 = 6710863;
      }
      if (v20) {
        unint64_t v22 = 0xE300000000000000;
      }
      else {
        unint64_t v22 = 0xE200000000000000;
      }
      if (qword_269B2C300 != -1) {
        swift_once();
      }
      uint64_t v23 = sub_25126C0E8();
      __swift_project_value_buffer(v23, (uint64_t)qword_269B2D4A0);
      swift_bridgeObjectRetain_n();
      id v24 = a1;
      uint64_t v25 = sub_25126C0C8();
      os_log_type_t v26 = sub_25126C648();
      if (os_log_type_enabled(v25, v26))
      {
        uint64_t v27 = swift_slowAlloc();
        uint64_t v34 = swift_slowAlloc();
        uint64_t v41 = v34;
        *(_DWORD *)uint64_t v27 = 136315394;
        swift_bridgeObjectRetain();
        uint64_t v39 = sub_251240E7C(v21, v22, &v41);
        uint64_t v35 = v21;
        sub_25126C768();
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v27 + 12) = 2080;
        uint64_t v28 = sub_25126BDA8();
        uint64_t v39 = sub_251240E7C(v28, v29, &v41);
        sub_25126C768();

        swift_bridgeObjectRelease();
        _os_log_impl(&dword_251222000, v25, v26, "HearingTopLevelCellUseCase hearingProtection string value %s %s ", (uint8_t *)v27, 0x16u);
        uint64_t v30 = v34;
        swift_arrayDestroy();
        MEMORY[0x253399FB0](v30, -1, -1);
        MEMORY[0x253399FB0](v27, -1, -1);
      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      uint64_t v41 = 1;
      sub_25126C3D8();
      uint64_t v9 = sub_2512547C8((uint64_t)v8);
      (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v36);
      uint64_t v41 = 0;
      unint64_t v42 = 0xE000000000000000;
      sub_25126C7E8();
      swift_bridgeObjectRelease();
      uint64_t v41 = 0xD000000000000018;
      unint64_t v42 = 0x8000000251274870;
      sub_25126C4D8();
      swift_bridgeObjectRelease();
      return v9;
    case 2:
      uint64_t v41 = 2;
      sub_25126C3D8();
      uint64_t v9 = sub_2512547C8((uint64_t)v8);
      uint64_t v11 = *(void (**)(char *, uint64_t))(v5 + 8);
      v11(v8, v4);
      uint64_t v41 = 2;
      sub_25126C3D8();
      sub_2512547C8((uint64_t)v8);
      v11(v8, v4);
      return v9;
    case 3:
      id v12 = (void *)sub_25126BD68();
      char v13 = sub_25126BF48();

      uint64_t v14 = (void *)sub_25126BD68();
      char v15 = sub_25126BF08();

      __swift_instantiateConcreteTypeFromMangledName(&qword_269B2B3E0);
      if (v13)
      {
        if (v13 == 2)
        {
          if (v15 && v15 != 2)
          {
            if (v15 != 1) {
              goto LABEL_36;
            }
            goto LABEL_24;
          }
LABEL_30:
          uint64_t v41 = 3;
          goto LABEL_33;
        }
        if (v13 == 1)
        {
          if (!v15 || v15 == 2)
          {
            uint64_t v41 = 3;
            goto LABEL_33;
          }
          if (v15 == 1)
          {
            uint64_t v41 = 3;
            goto LABEL_33;
          }
        }
LABEL_36:
        sub_25126C948();
        __break(1u);
        JUMPOUT(0x25124F12CLL);
      }
      if (v15 == 2) {
        goto LABEL_30;
      }
      if (v15 != 1)
      {
        if (!v15) {
          goto LABEL_30;
        }
        goto LABEL_36;
      }
LABEL_24:
      uint64_t v41 = 3;
LABEL_33:
      sub_25126C3D8();
      sub_2512547C8((uint64_t)v8);
      uint64_t v31 = *(void (**)(char *, uint64_t))(v5 + 8);
      v31(v8, v4);
      uint64_t v41 = 3;
      sub_25126C3D8();
      uint64_t v9 = sub_2512547C8((uint64_t)v8);
      v31(v8, v4);
      return v9;
    default:
      uint64_t v41 = a2;
      sub_25126C968();
      __break(1u);
      goto LABEL_36;
  }
}

unint64_t HearingTopLevelCellUseCase.init(rawValue:)(unint64_t a1)
{
  return sub_2512506B4(a1);
}

unint64_t sub_25124F164@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result = sub_2512506B4(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

uint64_t sub_25124F198(void *a1)
{
  return sub_25124E95C(a1, *v1);
}

uint64_t sub_25124F1A0(uint64_t a1, uint64_t a2)
{
  return sub_2512506C4(a2);
}

BOOL HearingOcclusionUseCase.init(rawValue:)(uint64_t a1)
{
  return a1 && a1 == 1;
}

uint64_t sub_25124F1CC()
{
  return sub_2512506C4(*v0);
}

uint64_t sub_25124F1D4@<X0>(uint64_t a1@<X8>)
{
  return sub_251250938(v1 + OBJC_IVAR____TtC21HearingModeSettingsUI32HearingTopLevelCaseObjectWrapper_usecase, a1);
}

id sub_25124F1E8(uint64_t a1)
{
  id v3 = objc_allocWithZone(v1);
  sub_251250938(a1, (uint64_t)v3 + OBJC_IVAR____TtC21HearingModeSettingsUI32HearingTopLevelCaseObjectWrapper_usecase);
  v6.receiver = v3;
  v6.super_class = v1;
  id v4 = objc_msgSendSuper2(&v6, sel_init);
  __swift_destroy_boxed_opaque_existential_0(a1);
  return v4;
}

id sub_25124F25C(uint64_t a1)
{
  sub_251250938(a1, (uint64_t)v1 + OBJC_IVAR____TtC21HearingModeSettingsUI32HearingTopLevelCaseObjectWrapper_usecase);
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for HearingTopLevelCaseObjectWrapper();
  id v3 = objc_msgSendSuper2(&v5, sel_init);
  __swift_destroy_boxed_opaque_existential_0(a1);
  return v3;
}

uint64_t sub_25124F2BC(uint64_t a1)
{
  uint64_t v3 = *(void *)(v1 + OBJC_IVAR____TtC21HearingModeSettingsUI32HearingTopLevelCaseObjectWrapper_usecase + 24);
  uint64_t v4 = *(void *)(v1 + OBJC_IVAR____TtC21HearingModeSettingsUI32HearingTopLevelCaseObjectWrapper_usecase + 32);
  __swift_project_boxed_opaque_existential_0((void *)(v1 + OBJC_IVAR____TtC21HearingModeSettingsUI32HearingTopLevelCaseObjectWrapper_usecase), v3);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 8))(a1, v3, v4);
}

id HearingTopLevelCaseObjectWrapper.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void HearingTopLevelCaseObjectWrapper.init()()
{
}

id HearingTopLevelCaseObjectWrapper.__deallocating_deinit()
{
  return sub_251250678(type metadata accessor for HearingTopLevelCaseObjectWrapper);
}

uint64_t sub_25124F3F0()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & **v0) + 0x60))();
}

void *sub_25124F444()
{
  return &unk_265364438;
}

unint64_t static HearingTopLevelCell.useCaseKey.getter()
{
  return 0xD00000000000001DLL;
}

void sub_25124F4AC()
{
  qword_269B2C310 = 0x656369766564;
  unk_269B2C318 = 0xE600000000000000;
}

uint64_t *sub_25124F4CC()
{
  if (qword_269B2C308 != -1) {
    swift_once();
  }
  return &qword_269B2C310;
}

uint64_t static HearingTopLevelCell.deviceKey.getter()
{
  if (qword_269B2C308 != -1) {
    swift_once();
  }
  uint64_t v0 = qword_269B2C310;
  swift_bridgeObjectRetain();
  return v0;
}

void *sub_25124F60C()
{
  return &unk_265364448;
}

unint64_t static HearingTopLevelCell.hideDisclosureKey.getter()
{
  return 0xD000000000000024;
}

id sub_25124F674(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  objc_super v5 = v4;
  if (a3)
  {
    uint64_t v8 = (void *)sub_25126C458();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v8 = 0;
  }
  id v9 = objc_msgSend(objc_allocWithZone(v5), sel_initWithStyle_reuseIdentifier_specifier_, a1, v8, a4);

  return v9;
}

id sub_25124F704(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  if (a3)
  {
    uint64_t v7 = (void *)sub_25126C458();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v7 = 0;
  }
  v11.receiver = v4;
  v11.super_class = (Class)type metadata accessor for HearingTopLevelCell();
  id v8 = objc_msgSendSuper2(&v11, sel_initWithStyle_reuseIdentifier_specifier_, a1, v7, a4);

  if (v8)
  {

    id v9 = v8;
    objc_msgSend(v9, sel_setAccessoryType_, 1);
  }
  return v8;
}

id sub_25124F838(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    objc_super v5 = (void *)sub_25126C458();
    swift_bridgeObjectRelease();
  }
  else
  {
    objc_super v5 = 0;
  }
  v8.receiver = v3;
  v8.super_class = (Class)type metadata accessor for HearingTopLevelCell();
  id v6 = objc_msgSendSuper2(&v8, sel_initWithStyle_reuseIdentifier_, a1, v5);

  objc_msgSend(v6, sel_setAccessoryType_, 1);
  return v6;
}

void sub_25124F96C()
{
}

void sub_25124FA24(void *a1)
{
  uint64_t v3 = sub_25126C148();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3, v5);
  uint64_t v7 = (char *)v55 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_25126C1B8();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8, v10);
  id v12 = (char *)v55 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a1)
  {
    __break(1u);
    goto LABEL_61;
  }
  if (objc_msgSend(a1, sel_userInfo))
  {
    sub_25126C7A8();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v65 = 0u;
    long long v66 = 0u;
  }
  sub_25123D3B8((uint64_t)&v65, (uint64_t)v68);
  if (!v69)
  {
    id v16 = &qword_269B2AE90;
    unint64_t v17 = (long long *)v68;
LABEL_21:
    sub_25123DF98((uint64_t)v17, v16);
    goto LABEL_22;
  }
  sub_25123DFF4(0, &qword_269B2AEA0);
  if ((swift_dynamicCast() & 1) == 0) {
    goto LABEL_22;
  }
  uint64_t v58 = v9;
  char v13 = (void *)v63;
  *(void *)&v62[0] = 0xD00000000000001DLL;
  *((void *)&v62[0] + 1) = 0x8000000251274790;
  uint64_t v14 = sub_25126C978();
  id v59 = v13;
  id v15 = objc_msgSend(v13, sel___swift_objectForKeyedSubscript_, v14);
  swift_unknownObjectRelease();
  if (v15)
  {
    sub_25126C7A8();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v62, 0, sizeof(v62));
  }
  sub_25123D3B8((uint64_t)v62, (uint64_t)&v63);
  if (!*((void *)&v64 + 1))
  {
    sub_25123DF98((uint64_t)&v63, &qword_269B2AE90);
    long long v65 = 0u;
    long long v66 = 0u;
    uint64_t v67 = 0;
    goto LABEL_20;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B2B3F8);
  if ((swift_dynamicCast() & 1) == 0)
  {
    uint64_t v67 = 0;
    long long v65 = 0u;
    long long v66 = 0u;
    goto LABEL_20;
  }
  if (!*((void *)&v66 + 1))
  {
LABEL_20:

    id v16 = (uint64_t *)&unk_269B2B3F0;
    unint64_t v17 = &v65;
    goto LABEL_21;
  }
  id v57 = v1;
  sub_2512509E4(&v65, (uint64_t)v68);
  if (qword_269B2C308 != -1) {
    swift_once();
  }
  long long v63 = xmmword_269B2C310;
  swift_bridgeObjectRetain_n();
  id v18 = objc_msgSend(v59, sel___swift_objectForKeyedSubscript_, sub_25126C978());
  swift_unknownObjectRelease();
  if (v18)
  {
    sub_25126C7A8();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v63 = 0u;
    long long v64 = 0u;
  }
  sub_25123D3B8((uint64_t)&v63, (uint64_t)&v65);
  if (*((void *)&v66 + 1))
  {
    sub_25126BDB8();
    if (swift_dynamicCast())
    {
      id v56 = *(id *)&v62[0];
      swift_bridgeObjectRelease();
      *(void *)&long long v63 = 0xD000000000000024;
      *((void *)&v63 + 1) = 0x80000002512747B0;
      id v26 = objc_msgSend(v59, sel___swift_objectForKeyedSubscript_, sub_25126C978());
      swift_unknownObjectRelease();
      if (v26)
      {
        sub_25126C7A8();
        swift_unknownObjectRelease();
      }
      else
      {
        long long v63 = 0u;
        long long v64 = 0u;
      }
      sub_25123D3B8((uint64_t)&v63, (uint64_t)&v65);
      if (*((void *)&v66 + 1))
      {
        if (swift_dynamicCast() & 1) != 0 && (v62[0])
        {
          id v27 = 0;
          id v28 = v57;
          goto LABEL_42;
        }
      }
      else
      {
        sub_25123DF98((uint64_t)&v65, &qword_269B2AE90);
      }
      unint64_t v29 = (objc_class *)type metadata accessor for HearingTopLevelCell();
      id v28 = v57;
      v61.receiver = v57;
      v61.super_class = v29;
      id v27 = objc_msgSendSuper2(&v61, sel_accessoryType);
LABEL_42:
      objc_msgSend(v28, sel_setAccessoryType_, v27);
      *(void *)&long long v63 = 0xD000000000000024;
      *((void *)&v63 + 1) = 0x80000002512747B0;
      id v30 = objc_msgSend(v59, sel___swift_objectForKeyedSubscript_, sub_25126C978());
      swift_unknownObjectRelease();
      if (v30)
      {
        sub_25126C7A8();
        swift_unknownObjectRelease();
      }
      else
      {
        long long v63 = 0u;
        long long v64 = 0u;
      }
      sub_25123D3B8((uint64_t)&v63, (uint64_t)&v65);
      id v31 = v57;
      if (*((void *)&v66 + 1))
      {
        if (swift_dynamicCast() & 1) != 0 && (v62[0])
        {
          id v32 = 0;
          goto LABEL_51;
        }
      }
      else
      {
        sub_25123DF98((uint64_t)&v65, &qword_269B2AE90);
      }
      uint64_t v33 = (objc_class *)type metadata accessor for HearingTopLevelCell();
      v60.receiver = v31;
      v60.super_class = v33;
      id v32 = objc_msgSendSuper2(&v60, sel_selectionStyle);
LABEL_51:
      objc_msgSend(v31, sel_setSelectionStyle_, v32);
      uint64_t v34 = v69;
      uint64_t v35 = v70;
      __swift_project_boxed_opaque_existential_0(v68, v69);
      v55[3] = (*(uint64_t (**)(id, uint64_t, uint64_t))(v35 + 8))(v56, v34, v35);
      v55[2] = v36;
      swift_bridgeObjectRelease();
      uint64_t v37 = v69;
      uint64_t v38 = v70;
      __swift_project_boxed_opaque_existential_0(v68, v69);
      (*(void (**)(id, uint64_t, uint64_t))(v38 + 8))(v56, v37, v38);
      v55[1] = v39;
      v55[0] = v40;
      swift_bridgeObjectRelease();
      if (objc_msgSend(a1, sel_propertyForKey_, *MEMORY[0x263F600A8]))
      {
        sub_25126C7A8();
        swift_unknownObjectRelease();
        sub_25123DA50(&v63, &v65);
        sub_25123DFF4(0, &qword_269B2B400);
        swift_dynamicCast();
        uint64_t v41 = *(void **)&v62[0];
        id v42 = objc_msgSend(*(id *)&v62[0], sel_BOOLValue);

        sub_25126C0F8();
        sub_25126C1A8();
        uint64_t v43 = self;
        double v44 = *MEMORY[0x263F81838];
        if (objc_msgSend(v43, sel__preferredFontForTextStyle_weight_, *MEMORY[0x263F83570], *MEMORY[0x263F81838]))
        {
          uint64_t v45 = (void (*)(long long *, void))sub_25126C158();
          sub_25126C118();
          v45(&v65, 0);
          if (v42)
          {
            sub_25126C168();
            sub_25126C128();
            (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
          }
          else
          {
            id v46 = objc_msgSend(self, sel_tertiaryLabelColor);
          }
          id v47 = (void (*)(long long *, void))sub_25126C158();
          sub_25126C138();
          v47(&v65, 0);
          sub_25126C108();
          if (objc_msgSend(v43, sel__preferredFontForTextStyle_weight_, *MEMORY[0x263F83580], v44))
          {
            uint64_t v48 = (void (*)(long long *, void))sub_25126C178();
            sub_25126C118();
            v48(&v65, 0);
            uint64_t v49 = self;
            uint64_t v50 = &selRef_secondaryLabelColor;
            if (!v42) {
              uint64_t v50 = &selRef_tertiaryLabelColor;
            }
            id v51 = [v49 *v50];
            uint64_t v52 = (void (*)(long long *, void))sub_25126C178();
            sub_25126C138();
            v52(&v65, 0);
            sub_25126C188();
            objc_msgSend(v57, sel_setUserInteractionEnabled_, v42);
            *((void *)&v66 + 1) = v8;
            uint64_t v67 = MEMORY[0x263F81F20];
            boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v65);
            uint64_t v54 = v58;
            (*(void (**)(uint64_t *, char *, uint64_t))(v58 + 16))(boxed_opaque_existential_1, v12, v8);
            MEMORY[0x253399350](&v65);

            (*(void (**)(char *, uint64_t))(v54 + 8))(v12, v8);
            __swift_destroy_boxed_opaque_existential_0((uint64_t)v68);
            return;
          }
LABEL_63:
          __break(1u);
          return;
        }
LABEL_62:
        __break(1u);
        goto LABEL_63;
      }
LABEL_61:
      __break(1u);
      goto LABEL_62;
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();

    sub_25123DF98((uint64_t)&v65, &qword_269B2AE90);
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v68);
LABEL_22:
  if (qword_269B2C300 != -1) {
    swift_once();
  }
  uint64_t v19 = sub_25126C0E8();
  __swift_project_value_buffer(v19, (uint64_t)qword_269B2D4A0);
  id v20 = a1;
  uint64_t v21 = sub_25126C0C8();
  os_log_type_t v22 = sub_25126C638();
  if (os_log_type_enabled(v21, v22))
  {
    uint64_t v23 = (uint8_t *)swift_slowAlloc();
    id v24 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v23 = 138412290;
    v68[0] = v20;
    id v25 = v20;
    sub_25126C768();
    void *v24 = a1;

    _os_log_impl(&dword_251222000, v21, v22, "HearingTopLevelCell refreshCellContents dependencies not meet %@", v23, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_269B2AF88);
    swift_arrayDestroy();
    MEMORY[0x253399FB0](v24, -1, -1);
    MEMORY[0x253399FB0](v23, -1, -1);
  }
  else
  {
  }
}

id HearingTopLevelCell.__deallocating_deinit()
{
  return sub_251250678(type metadata accessor for HearingTopLevelCell);
}

id sub_251250678(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

unint64_t sub_2512506B4(unint64_t result)
{
  if (result > 3) {
    return 0;
  }
  return result;
}

uint64_t sub_2512506C4(uint64_t a1)
{
  uint64_t v2 = sub_25126C448();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2, v4);
  uint64_t v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1 == 1)
  {
    uint64_t v12 = 1;
    sub_25126C3D8();
    uint64_t v7 = sub_2512547C8((uint64_t)v6);
    uint64_t v8 = *(void (**)(char *, uint64_t))(v3 + 8);
    v8(v6, v2);
    uint64_t v12 = 1;
    sub_25126C3D8();
    sub_2512547C8((uint64_t)v6);
    v8(v6, v2);
    return v7;
  }
  if (!a1)
  {
    uint64_t v12 = 0;
    sub_25126C3D8();
    uint64_t v7 = sub_2512547C8((uint64_t)v6);
    uint64_t v9 = *(void (**)(char *, uint64_t))(v3 + 8);
    v9(v6, v2);
    uint64_t v12 = 0;
    sub_25126C3D8();
    sub_2512547C8((uint64_t)v6);
    v9(v6, v2);
    return v7;
  }
  uint64_t v12 = a1;
  uint64_t result = sub_25126C968();
  __break(1u);
  return result;
}

uint64_t sub_251250938(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t type metadata accessor for HearingTopLevelCaseObjectWrapper()
{
  return self;
}

uint64_t type metadata accessor for HearingTopLevelCell()
{
  return self;
}

uint64_t sub_2512509E4(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

unint64_t sub_251250A00()
{
  unint64_t result = qword_269B2B408;
  if (!qword_269B2B408)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B2B408);
  }
  return result;
}

unint64_t sub_251250A58()
{
  unint64_t result = qword_269B2B410;
  if (!qword_269B2B410)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B2B410);
  }
  return result;
}

uint64_t sub_251250AAC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

ValueMetadata *type metadata accessor for HearingTopLevelCellUseCase()
{
  return &type metadata for HearingTopLevelCellUseCase;
}

ValueMetadata *type metadata accessor for HearingOcclusionUseCase()
{
  return &type metadata for HearingOcclusionUseCase;
}

uint64_t method lookup function for HearingTopLevelCaseObjectWrapper(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for HearingTopLevelCaseObjectWrapper);
}

void type metadata accessor for HMMultiState()
{
  if (!qword_269B2B418)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_269B2B418);
    }
  }
}

uint64_t sub_251250B5C()
{
  uint64_t v0 = sub_25126C0E8();
  __swift_allocate_value_buffer(v0, qword_269B2D4B8);
  __swift_project_value_buffer(v0, (uint64_t)qword_269B2D4B8);
  return sub_25126C0D8();
}

uint64_t sub_251250BE0()
{
  if (qword_269B2C620 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_25126C0E8();
  return __swift_project_value_buffer(v0, (uint64_t)qword_269B2D4B8);
}

uint64_t sub_251250C44@<X0>(uint64_t a1@<X8>)
{
  if (qword_269B2C620 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_25126C0E8();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_269B2D4B8);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);
  return v4(a1, v3, v2);
}

uint64_t sub_251250D48()
{
  return swift_unknownObjectRetain();
}

uint64_t sub_251250DFC(uint64_t a1)
{
  uint64_t v3 = (void *)(v1 + OBJC_IVAR____TtC21HearingModeSettingsUI31HearingFlowNavigationController_flowController);
  swift_beginAccess();
  void *v3 = a1;
  return swift_unknownObjectRelease();
}

uint64_t (*sub_251250E50())()
{
  return j__swift_endAccess;
}

id sub_251250EAC(uint64_t a1, void *a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = (char *)objc_allocWithZone(v3);
  uint64_t v7 = &v6[OBJC_IVAR____TtC21HearingModeSettingsUI31HearingFlowNavigationController_flowController];
  *(void *)&v6[OBJC_IVAR____TtC21HearingModeSettingsUI31HearingFlowNavigationController_flowController] = 0;
  swift_beginAccess();
  *(void *)uint64_t v7 = a1;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  v11.receiver = v6;
  v11.super_class = v3;
  id v8 = objc_msgSendSuper2(&v11, sel_initWithRootViewController_, a2);
  objc_msgSend(v8, sel_setModalInPresentation_, 1);
  id v9 = v8;
  objc_msgSend(v9, sel_setModalPresentationStyle_, 2);

  swift_unknownObjectRelease();
  return v9;
}

id sub_251250F94(uint64_t a1, void *a2)
{
  uint64_t v5 = &v2[OBJC_IVAR____TtC21HearingModeSettingsUI31HearingFlowNavigationController_flowController];
  *(void *)&v2[OBJC_IVAR____TtC21HearingModeSettingsUI31HearingFlowNavigationController_flowController] = 0;
  swift_beginAccess();
  *(void *)uint64_t v5 = a1;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  v9.receiver = v2;
  v9.super_class = (Class)type metadata accessor for HearingFlowNavigationController();
  id v6 = objc_msgSendSuper2(&v9, sel_initWithRootViewController_, a2);
  objc_msgSend(v6, sel_setModalInPresentation_, 1);
  id v7 = v6;
  objc_msgSend(v7, sel_setModalPresentationStyle_, 2);

  swift_unknownObjectRelease();
  return v7;
}

uint64_t type metadata accessor for HearingFlowNavigationController()
{
  return self;
}

void sub_251251094()
{
  *(void *)&v0[OBJC_IVAR____TtC21HearingModeSettingsUI31HearingFlowNavigationController_flowController] = 0;

  sub_25126C8B8();
  __break(1u);
}

uint64_t sub_251251178(uint64_t result)
{
  if (result)
  {
    uint64_t v2 = (void *)result;
    unint64_t result = swift_dynamicCastObjCProtocolConditional();
    if (result)
    {
      uint64_t v3 = (void *)result;
      uint64_t v4 = *(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v1) + 0x58);
      id v5 = v2;
      objc_msgSend(v3, sel_setFlowController_, v4());

      return swift_unknownObjectRelease();
    }
  }
  return result;
}

id sub_251251310(void *a1, char a2)
{
  sub_251251530(a1);
  v13[2] = &unk_27022BAD8;
  uint64_t v5 = swift_dynamicCastObjCProtocolConditional();
  if (v5)
  {
    id v6 = (void *)v5;
    id v7 = *(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v2) + 0x58);
    id v8 = a1;
    objc_msgSend(v6, sel_setFlowController_, v7());

    swift_unknownObjectRelease();
    uint64_t v9 = type metadata accessor for HearingFlowNavigationController();
    v12.receiver = v2;
    uint64_t v10 = &v12;
  }
  else
  {
    uint64_t v9 = type metadata accessor for HearingFlowNavigationController();
    v13[0] = v2;
    uint64_t v10 = (objc_super *)v13;
  }
  v10->super_class = (Class)v9;
  return [(objc_super *)v10 pushViewController:a1 animated:a2 & 1];
}

void sub_251251530(void *a1)
{
  if (!a1)
  {
    __break(1u);
    return;
  }
  swift_getObjectType();
  uint64_t ObjCClassFromMetadata = (objc_class *)swift_getObjCClassFromMetadata();
  uint64_t v3 = NSStringFromClass(ObjCClassFromMetadata);
  uint64_t v4 = sub_25126C488();
  uint64_t v6 = v5;

  if (sub_25126C508()) {
    goto LABEL_3;
  }
  self;
  if (swift_dynamicCastObjCClass() || (sub_25126BD28(), swift_dynamicCastClass()))
  {
    swift_bridgeObjectRelease();
    id v14 = objc_msgSend(a1, sel_navigationItem);
    objc_msgSend(v14, sel_setHidesBackButton_, 1);
  }
  else
  {
    if (v4 == 0xD000000000000027 && v6 == 0x8000000251274C00)
    {
LABEL_3:
      swift_bridgeObjectRelease();
      return;
    }
    char v7 = sub_25126C958();
    swift_bridgeObjectRelease();
    if (v7) {
      return;
    }
    id v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F824A8]), sel_initWithBarButtonSystemItem_target_action_, 1, 0, 0);
    sub_25123DFF4(0, &qword_269B2B050);
    uint64_t v9 = swift_allocObject();
    swift_unknownObjectWeakInit();
    uint64_t v10 = (void *)sub_25126C728();
    objc_msgSend(v8, sel_setPrimaryAction_, v10, 0, 0, 0, sub_251251B90, v9);

    id v11 = objc_msgSend(a1, sel_navigationItem);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_269B2B040);
    uint64_t v12 = swift_allocObject();
    *(_OWORD *)(v12 + 16) = xmmword_25126E8F0;
    *(void *)(v12 + 32) = v8;
    sub_25126C558();
    sub_25123DFF4(0, &qword_269B2B5A0);
    id v13 = v8;
    id v14 = (id)sub_25126C528();
    swift_bridgeObjectRelease();
    objc_msgSend(v11, sel_setRightBarButtonItems_, v14);
  }
}

void sub_251251854(char a1)
{
  v4.receiver = v1;
  v4.super_class = (Class)type metadata accessor for HearingFlowNavigationController();
  objc_msgSendSuper2(&v4, sel_viewWillDisappear_, a1 & 1);
  sub_25126BCA8();
  uint64_t v3 = (void *)sub_25126BC88();
  sub_25126BC78();
}

id sub_251251930(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = a2;
  if (a1)
  {
    uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
    if (!v3) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  uint64_t ObjCClassFromMetadata = 0;
  if (a2) {
LABEL_3:
  }
    uint64_t v3 = swift_getObjCClassFromMetadata();
LABEL_4:
  id v5 = objc_allocWithZone(v2);
  return objc_msgSend(v5, sel_initWithNavigationBarClass_toolbarClass_, ObjCClassFromMetadata, v3);
}

void sub_2512519A8()
{
}

id sub_251251A08(void *a1)
{
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithRootViewController_, a1);

  return v3;
}

void sub_251251A4C()
{
}

void sub_251251AB0()
{
}

id sub_251251B14()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for HearingFlowNavigationController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_251251B58()
{
  swift_unknownObjectWeakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_251251B90()
{
  swift_beginAccess();
  uint64_t v1 = (void *)MEMORY[0x25339A050](v0 + 16);
  if (v1)
  {
    objc_super v2 = v1;
    objc_msgSend(v1, sel_dismissViewControllerAnimated_completion_, 1, 0);
  }
}

uint64_t sub_251251BF4()
{
  uint64_t v0 = sub_25126C0E8();
  __swift_allocate_value_buffer(v0, qword_269B2D4D0);
  __swift_project_value_buffer(v0, (uint64_t)qword_269B2D4D0);
  return sub_25126C0D8();
}

uint64_t sub_251251C7C()
{
  if (qword_269B2C628 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_25126C0E8();
  return __swift_project_value_buffer(v0, (uint64_t)qword_269B2D4D0);
}

uint64_t sub_251251CE0@<X0>(uint64_t a1@<X8>)
{
  if (qword_269B2C628 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_25126C0E8();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_269B2D4D0);
  objc_super v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);
  return v4(a1, v3, v2);
}

uint64_t sub_251251D88()
{
  return 0;
}

uint64_t sub_251251D94()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_251251DC4(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  void *v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*sub_251251DFC())()
{
  return nullsub_1;
}

uint64_t sub_251251E1C(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return result;
}

uint64_t (*sub_251251E54())()
{
  return nullsub_1;
}

double sub_251251E74@<D0>(_OWORD *a1@<X8>)
{
  double result = 0.0;
  *a1 = 0u;
  a1[1] = 0u;
  return result;
}

uint64_t sub_251251E80@<X0>(uint64_t a1@<X8>)
{
  return sub_251251E8C(v1 + 32, a1);
}

uint64_t sub_251251E8C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B2AE90);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_251251EF4(uint64_t a1)
{
  return sub_251251EFC(a1, v1 + 32);
}

uint64_t sub_251251EFC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B2AE90);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t (*sub_251251F64())()
{
  return nullsub_1;
}

uint64_t sub_251251F84()
{
  return *(void *)(v0 + 64);
}

uint64_t sub_251251F8C(uint64_t result)
{
  *(void *)(v1 + 64) = result;
  return result;
}

uint64_t (*sub_251251F94())()
{
  return nullsub_1;
}

uint64_t sub_251251FB4()
{
  return *(void *)(v0 + 72);
}

uint64_t sub_251251FBC(uint64_t result)
{
  *(void *)(v1 + 72) = result;
  return result;
}

uint64_t (*sub_251251FC4())()
{
  return nullsub_1;
}

uint64_t sub_251251FE4()
{
  return *(void *)(v0 + 80);
}

uint64_t sub_251251FEC(uint64_t result)
{
  *(void *)(v1 + 80) = result;
  return result;
}

uint64_t (*sub_251251FF4())()
{
  return nullsub_1;
}

uint64_t sub_251252014()
{
  return *(void *)(v0 + 88);
}

uint64_t sub_25125201C(uint64_t result)
{
  *(void *)(v1 + 88) = result;
  return result;
}

uint64_t (*sub_251252024())()
{
  return nullsub_1;
}

uint64_t sub_251252044()
{
  return *(unsigned __int8 *)(v0 + 96);
}

uint64_t sub_25125204C(uint64_t result)
{
  *(unsigned char *)(v1 + 96) = result;
  return result;
}

uint64_t (*sub_251252054())()
{
  return nullsub_1;
}

uint64_t sub_251252074()
{
  return *(void *)(v0 + 104);
}

uint64_t sub_25125207C(uint64_t result)
{
  *(void *)(v1 + 104) = result;
  return result;
}

uint64_t (*sub_251252084())()
{
  return nullsub_1;
}

uint64_t sub_2512520A4()
{
  uint64_t v1 = *(void *)(v0 + 112);
  sub_2512521F0(v1);
  return v1;
}

uint64_t sub_2512520D8(uint64_t a1, uint64_t a2)
{
  uint64_t result = sub_251252238(*(void *)(v2 + 112));
  *(void *)(v2 + 112) = a1;
  *(void *)(v2 + 120) = a2;
  return result;
}

uint64_t (*sub_251252110())()
{
  return nullsub_1;
}

uint64_t sub_251252130()
{
  uint64_t v1 = *(void *)(v0 + 128);
  sub_2512521F0(v1);
  return v1;
}

uint64_t sub_251252164(uint64_t a1, uint64_t a2)
{
  uint64_t result = sub_251252238(*(void *)(v2 + 128));
  *(void *)(v2 + 128) = a1;
  *(void *)(v2 + 136) = a2;
  return result;
}

uint64_t (*sub_25125219C())()
{
  return nullsub_1;
}

uint64_t sub_2512521BC()
{
  uint64_t v1 = *(void *)(v0 + 144);
  sub_2512521F0(v1);
  return v1;
}

uint64_t sub_2512521F0(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_251252200(uint64_t a1, uint64_t a2)
{
  uint64_t result = sub_251252238(*(void *)(v2 + 144));
  *(void *)(v2 + 144) = a1;
  *(void *)(v2 + 152) = a2;
  return result;
}

uint64_t sub_251252238(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t (*sub_251252248())()
{
  return nullsub_1;
}

__n128 sub_251252268@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10, char a11, long long a12, long long a13, __n128 a14, uint64_t a15)
{
  *(void *)a9 = a1;
  *(void *)(a9 + 8) = a2;
  *(void *)(a9 + 16) = a3;
  *(void *)(a9 + 24) = a4;
  sub_25123D3B8(a5, a9 + 32);
  *(void *)(a9 + 64) = a6;
  *(void *)(a9 + 72) = a7;
  *(void *)(a9 + 80) = a8;
  *(void *)(a9 + 88) = a10;
  *(unsigned char *)(a9 + 96) = a11;
  *(_OWORD *)(a9 + 104) = a12;
  *(_OWORD *)(a9 + 120) = a13;
  __n128 result = a14;
  *(__n128 *)(a9 + 136) = a14;
  *(void *)(a9 + 152) = a15;
  return result;
}

uint64_t sub_251252314()
{
  return MEMORY[0x263F8EE78];
}

uint64_t sub_251252320()
{
  return 0;
}

uint64_t sub_25125232C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = swift_allocObject();
  sub_251252394(a1, a2, a3, a4);
  return v8;
}

void sub_251252394(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 24) = MEMORY[0x263F8EE78];
  if (a2)
  {
    uint64_t v6 = (void *)sub_25126C458();
    swift_bridgeObjectRelease();
    if (a4)
    {
LABEL_3:
      char v7 = (void *)sub_25126C458();
      swift_bridgeObjectRelease();
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v6 = 0;
    if (a4) {
      goto LABEL_3;
    }
  }
  char v7 = 0;
LABEL_6:
  id v8 = objc_msgSend(self, sel_groupSpecifierWithID_name_, v6, v7);

  if (v8)
  {
    *(void *)(v4 + 16) = v8;
    swift_beginAccess();
    id v9 = v8;
    MEMORY[0x253399200]();
    if (*(void *)((*(void *)(v4 + 24) & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*(void *)(v4 + 24) & 0xFFFFFFFFFFFFFF8)
                                                                                       + 0x18) >> 1)
      sub_25126C568();
    sub_25126C578();
    sub_25126C558();
    swift_endAccess();
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_2512524CC(void (*a1)(void))
{
  a1(*(void *)(v1 + 16));
  return swift_retain();
}

uint64_t sub_251252514()
{
  uint64_t v1 = *(void *)(*v0 + 88);
  uint64_t v2 = *(void *)(*v0 + 80);
  (*(void (**)(uint64_t, uint64_t))(v1 + 16))(v2, v1);
  if (v3)
  {
    uint64_t v4 = (void *)sub_25126C458();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v4 = 0;
  }
  (*(void (**)(void *__return_ptr, uint64_t, uint64_t))(v1 + 24))(v18, v2, v1);
  uint64_t v5 = v19;
  if (v19)
  {
    uint64_t v6 = __swift_project_boxed_opaque_existential_0(v18, v19);
    uint64_t v7 = *(void *)(v5 - 8);
    MEMORY[0x270FA5388](v6, v6);
    id v9 = (char *)v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v7 + 16))(v9);
    uint64_t v10 = sub_25126C938();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v5);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v18);
  }
  else
  {
    uint64_t v10 = 0;
  }
  uint64_t v11 = (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 40))(v2, v1);
  uint64_t v12 = (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 32))(v2, v1);
  if ((*(uint64_t (**)(uint64_t, uint64_t))(v1 + 72))(v2, v1)) {
    uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  }
  else {
    uint64_t ObjCClassFromMetadata = 0;
  }
  id v14 = self;
  id v15 = objc_msgSend(v14, sel_preferenceSpecifierNamed_target_set_get_detail_cell_edit_, v4, v10, v11, v12, ObjCClassFromMetadata, (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 48))(v2, v1), 0);

  uint64_t result = swift_unknownObjectRelease();
  if (v15)
  {
    swift_beginAccess();
    id v17 = v15;
    MEMORY[0x253399200]();
    if (*(void *)((v0[3] & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v0[3] & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      sub_25126C568();
    }
    sub_25126C578();
    sub_25126C558();
    swift_endAccess();

    return swift_retain();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_251252828(uint64_t a1)
{
  sub_2512419AC(a1, (uint64_t)v5);
  sub_25123DFF4(0, &qword_269B2AE98);
  if (swift_dynamicCast())
  {
    swift_beginAccess();
    id v2 = v4;
    MEMORY[0x253399200]();
    if (*(void *)((*(void *)(v1 + 24) & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*(void *)(v1 + 24) & 0xFFFFFFFFFFFFFF8)
                                                                                       + 0x18) >> 1)
      sub_25126C568();
    sub_25126C578();
    sub_25126C558();
    swift_endAccess();
  }
  return swift_retain();
}

uint64_t sub_251252914()
{
  uint64_t v1 = v0;
  id v2 = *(uint64_t (***)(void, void))(*(void *)v0 + 88);
  uint64_t v3 = *(void *)(*(void *)v0 + 80);
  uint64_t v4 = v2[2](v3, v2);
  uint64_t v22 = v5;
  uint64_t v23 = v4;
  uint64_t v6 = v2[11](v3, v2);
  uint64_t v8 = v7;
  uint64_t v9 = v2[10](v3, v2);
  uint64_t v11 = v10;
  uint64_t v12 = v2[9](v3, v2);
  uint64_t v13 = v2[6](v3, v2);
  uint64_t v14 = v2[12](v3, v2);
  uint64_t v16 = v15;
  id v17 = objc_allocWithZone((Class)type metadata accessor for HeadphoneSpecifier());
  HeadphoneSpecifier.init(name:setAction:getAction:detail:cell:edit:buttonAction:)(v23, v22, v6, v8, v9, v11, v12, v13, 0, v14, v16);
  uint64_t v19 = v18;
  swift_beginAccess();
  id v20 = v19;
  MEMORY[0x253399200]();
  if (*(void *)((*(void *)(v1 + 24) & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*(void *)(v1 + 24) & 0xFFFFFFFFFFFFFF8)
                                                                                     + 0x18) >> 1)
    sub_25126C568();
  sub_25126C578();
  sub_25126C558();
  swift_endAccess();

  return swift_retain();
}

__n128 HeadphoneSpecifier.__allocating_init(name:setAction:getAction:detail:cell:edit:buttonAction:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, long long a9, uint64_t a10)
{
  id v19 = objc_allocWithZone(v10);
  HeadphoneSpecifier.init(name:setAction:getAction:detail:cell:edit:buttonAction:)(a1, a2, a3, a4, a5, a6, a7, a8, a9, *((uint64_t *)&a9 + 1), a10);
  return result;
}

uint64_t type metadata accessor for HeadphoneSpecifier()
{
  return self;
}

unint64_t sub_251252BD8(void (*a1)(void *))
{
  swift_beginAccess();
  unint64_t v3 = *(void *)(v1 + 24);
  if (!(v3 >> 62))
  {
    uint64_t v4 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v4) {
      goto LABEL_3;
    }
LABEL_10:
    swift_bridgeObjectRelease();
    swift_retain();
    return v1;
  }
  swift_bridgeObjectRetain();
  uint64_t v4 = sub_25126C8C8();
  if (!v4) {
    goto LABEL_10;
  }
LABEL_3:
  unint64_t result = v4 - 1;
  if (__OFSUB__(v4, 1))
  {
    __break(1u);
    goto LABEL_13;
  }
  if ((v3 & 0xC000000000000001) != 0)
  {
LABEL_13:
    id v6 = (id)MEMORY[0x253399500](result, v3);
    goto LABEL_8;
  }
  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (result < *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    id v6 = *(id *)(v3 + 8 * result + 32);
LABEL_8:
    uint64_t v7 = v6;
    swift_bridgeObjectRelease();
    a1(v7);
    swift_retain();

    return v1;
  }
  __break(1u);
  return result;
}

uint64_t sub_251252CF4()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_251252D2C()
{
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_251252D54()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0228](v0, 32, 7);
}

void sub_251252D94(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v7 = v6;
  uint64_t v39 = a5;
  uint64_t v40 = a6;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B2AFB0);
  MEMORY[0x270FA5388](v12 - 8, v13);
  uint64_t v15 = (char *)&v37 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v37 = a1;
  uint64_t v41 = a1;
  unint64_t v42 = a2;
  swift_bridgeObjectRetain();
  sub_25126C4D8();
  swift_bridgeObjectRetain();
  sub_25126C4D8();
  swift_bridgeObjectRelease();
  uint64_t v17 = v41;
  unint64_t v16 = v42;
  id v18 = (void *)sub_25126C458();
  objc_msgSend(v7, sel_setProperty_forKey_, v18, *MEMORY[0x263F600F8]);

  uint64_t v41 = v17;
  unint64_t v42 = v16;
  uint64_t v38 = a3;
  uint64_t v44 = a3;
  unint64_t v45 = a4;
  uint64_t v19 = sub_25126BB68();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v15, 1, 1, v19);
  sub_25123DF44();
  uint64_t v20 = sub_25126C798();
  unint64_t v22 = v21;
  LOBYTE(a3) = v23;
  sub_251253630((uint64_t)v15);
  if (a3)
  {
    if (qword_269B2C628 != -1) {
      swift_once();
    }
    uint64_t v32 = sub_25126C0E8();
    __swift_project_value_buffer(v32, (uint64_t)qword_269B2D4D0);
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain();
    uint64_t v33 = sub_25126C0C8();
    os_log_type_t v34 = sub_25126C638();
    if (os_log_type_enabled(v33, v34))
    {
      uint64_t v35 = swift_slowAlloc();
      uint64_t v36 = swift_slowAlloc();
      uint64_t v41 = v36;
      *(_DWORD *)uint64_t v35 = 136315650;
      swift_bridgeObjectRetain();
      uint64_t v44 = sub_251240E7C(v17, v16, &v41);
      sub_25126C768();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v35 + 12) = 2080;
      swift_bridgeObjectRetain();
      uint64_t v44 = sub_251240E7C(v37, a2, &v41);
      sub_25126C768();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v35 + 22) = 2080;
      swift_bridgeObjectRetain();
      uint64_t v44 = sub_251240E7C(v38, a4, &v41);
      sub_25126C768();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_251222000, v33, v34, "updateSpecifierLinkedFooter: ERROR: range not found footer.range(of: linkString) %s %s %s", (uint8_t *)v35, 0x20u);
      swift_arrayDestroy();
      MEMORY[0x253399FB0](v36, -1, -1);
      MEMORY[0x253399FB0](v35, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
    }
  }
  else
  {
    sub_25123DFF4(0, &qword_269B2AFC0);
    uint64_t ObjCClassFromMetadata = (objc_class *)swift_getObjCClassFromMetadata();
    id v25 = NSStringFromClass(ObjCClassFromMetadata);
    if (!v25)
    {
      sub_25126C488();
      id v25 = (NSString *)sub_25126C458();
      swift_bridgeObjectRelease();
    }
    objc_msgSend(v7, sel_setProperty_forKey_, v25, *MEMORY[0x263F600C0]);

    id v26 = (void *)sub_25126C458();
    objc_msgSend(v7, sel_setProperty_forKey_, v26, *MEMORY[0x263F600E8]);

    uint64_t v41 = v20;
    unint64_t v42 = v22;
    uint64_t v44 = v17;
    unint64_t v45 = v16;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269B2AFC8);
    sub_251253C90();
    v46.location = sub_25126C738();
    id v27 = NSStringFromRange(v46);
    if (!v27)
    {
      sub_25126C488();
      id v27 = (NSString *)sub_25126C458();
      swift_bridgeObjectRelease();
    }
    objc_msgSend(v7, sel_setProperty_forKey_, v27, *MEMORY[0x263F600D0]);

    uint64_t v28 = v39;
    uint64_t ObjectType = swift_getObjectType();
    uint64_t v41 = v28;
    swift_unknownObjectRetain();
    uint64_t v29 = sub_25126C938();
    __swift_destroy_boxed_opaque_existential_0((uint64_t)&v41);
    id v30 = objc_msgSend(self, sel_valueWithNonretainedObject_, v29);
    swift_unknownObjectRelease();
    objc_msgSend(v7, sel_setProperty_forKey_, v30, *MEMORY[0x263F600E0]);

    sub_25126BBC8();
    id v31 = (void *)sub_25126C458();
    swift_bridgeObjectRelease();
    objc_msgSend(v7, sel_setProperty_forKey_, v31, *MEMORY[0x263F600C8]);
  }
}

uint64_t HeadphoneSpecifier.getAction.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC21HearingModeSettingsUI18HeadphoneSpecifier_getAction);
  sub_2512521F0(v1);
  return v1;
}

uint64_t HeadphoneSpecifier.setAction.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC21HearingModeSettingsUI18HeadphoneSpecifier_setAction);
  sub_2512521F0(v1);
  return v1;
}

uint64_t HeadphoneSpecifier.buttonTapAction.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC21HearingModeSettingsUI18HeadphoneSpecifier_buttonTapAction);
  sub_2512521F0(v1);
  return v1;
}

void HeadphoneSpecifier.init(name:setAction:getAction:detail:cell:edit:buttonAction:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  uint64_t v15 = (uint64_t *)&v11[OBJC_IVAR____TtC21HearingModeSettingsUI18HeadphoneSpecifier_getAction];
  uint64_t *v15 = a5;
  v15[1] = a6;
  unint64_t v16 = (uint64_t *)&v11[OBJC_IVAR____TtC21HearingModeSettingsUI18HeadphoneSpecifier_setAction];
  uint64_t *v16 = a3;
  v16[1] = a4;
  uint64_t v17 = (uint64_t *)&v11[OBJC_IVAR____TtC21HearingModeSettingsUI18HeadphoneSpecifier_buttonTapAction];
  *uint64_t v17 = a10;
  v17[1] = a11;
  if (a2)
  {
    sub_2512521F0(a10);
    sub_2512521F0(a3);
    sub_2512521F0(a5);
    id v18 = (void *)sub_25126C458();
    swift_bridgeObjectRelease();
    uint64_t v19 = a9;
    if (a7) {
      goto LABEL_3;
    }
  }
  else
  {
    sub_2512521F0(a10);
    sub_2512521F0(a3);
    sub_2512521F0(a5);
    id v18 = 0;
    uint64_t v19 = a9;
    if (a7)
    {
LABEL_3:
      uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
      uint64_t v25 = a3;
      if (!v19) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  uint64_t ObjCClassFromMetadata = 0;
  uint64_t v25 = a3;
  if (v19) {
LABEL_4:
  }
    uint64_t v19 = swift_getObjCClassFromMetadata();
LABEL_5:
  unint64_t v21 = (objc_class *)type metadata accessor for HeadphoneSpecifier();
  v29.receiver = v11;
  v29.super_class = v21;
  id v22 = objc_msgSendSuper2(&v29, sel_initWithName_target_set_get_detail_cell_edit_, v18, 0, sel_setSepcifierEnabledWithEnabled_, sel_specifierEnabled, ObjCClassFromMetadata, a8, v19);

  if (v22)
  {
    v28.receiver = v22;
    v28.super_class = v21;
    id v23 = v22;
    objc_msgSendSuper2(&v28, sel_setTarget_, v23);
    v27.receiver = v23;
    v27.super_class = v21;
    id v24 = v23;
    objc_msgSendSuper2(&v27, sel_setButtonAction_, sel_buttonTappedWithSender_);
    sub_251252238(a10);
    sub_251252238(a5);
    sub_251252238(v25);
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_251253630(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B2AFB0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_251253690()
{
  uint64_t v1 = *(uint64_t (**)(void))(v0 + OBJC_IVAR____TtC21HearingModeSettingsUI18HeadphoneSpecifier_buttonTapAction);
  if (v1) {
    return v1();
  }
  return result;
}

uint64_t sub_251253748()
{
  uint64_t v1 = *(uint64_t (**)(void))(v0 + OBJC_IVAR____TtC21HearingModeSettingsUI18HeadphoneSpecifier_getAction);
  if (v1) {
    return v1();
  }
  else {
    return 0;
  }
}

uint64_t sub_2512537F4()
{
  uint64_t v1 = *(uint64_t (**)(void))(v0 + OBJC_IVAR____TtC21HearingModeSettingsUI18HeadphoneSpecifier_setAction);
  if (v1) {
    return v1();
  }
  return result;
}

id HeadphoneSpecifier.__allocating_init(name:target:set:get:detail:cell:edit:)(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t ObjCClassFromMetadata, uint64_t a7, uint64_t a8)
{
  uint64_t v24 = a5;
  uint64_t v25 = a7;
  uint64_t v23 = a4;
  if (a2)
  {
    uint64_t v12 = (void *)sub_25126C458();
    swift_bridgeObjectRelease();
    uint64_t v13 = a3[3];
    if (v13) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v12 = 0;
    uint64_t v13 = a3[3];
    if (v13)
    {
LABEL_3:
      uint64_t v14 = __swift_project_boxed_opaque_existential_0(a3, v13);
      uint64_t v15 = *(void *)(v13 - 8);
      MEMORY[0x270FA5388](v14, v14);
      uint64_t v17 = (char *)&v22 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
      (*(void (**)(char *))(v15 + 16))(v17);
      uint64_t v18 = sub_25126C938();
      (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v13);
      __swift_destroy_boxed_opaque_existential_0((uint64_t)a3);
      if (!ObjCClassFromMetadata) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  uint64_t v18 = 0;
  if (ObjCClassFromMetadata) {
LABEL_4:
  }
    uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
LABEL_5:
  if (a8) {
    a8 = swift_getObjCClassFromMetadata();
  }
  id v19 = objc_allocWithZone(v8);
  id v20 = objc_msgSend(v19, sel_initWithName_target_set_get_detail_cell_edit_, v12, v18, v23, v24, ObjCClassFromMetadata, v25, a8);

  swift_unknownObjectRelease();
  return v20;
}

void HeadphoneSpecifier.init(name:target:set:get:detail:cell:edit:)()
{
}

id HeadphoneSpecifier.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void HeadphoneSpecifier.init()()
{
}

id HeadphoneSpecifier.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for HeadphoneSpecifier();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_251253C48()
{
  return sub_25126C708();
}

unint64_t sub_251253C90()
{
  unint64_t result = qword_269B2AFD0;
  if (!qword_269B2AFD0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269B2AFC8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B2AFD0);
  }
  return result;
}

uint64_t sub_251253CEC(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t sub_251253D00(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t sub_251253D14(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t sub_251253D28(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t sub_251253D3C(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t sub_251253D50(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t sub_251253D64(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 56))();
}

uint64_t sub_251253D78(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 64))();
}

uint64_t sub_251253D8C(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 72))();
}

uint64_t sub_251253DA0(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 80))();
}

uint64_t sub_251253DB4(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 88))();
}

uint64_t sub_251253DC8(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 96))();
}

uint64_t initializeBufferWithCopyOfBuffer for AnyBindable(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for AnyBindable(void *a1)
{
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  if (a1[7]) {
    uint64_t result = __swift_destroy_boxed_opaque_existential_0((uint64_t)(a1 + 4));
  }
  if (a1[14]) {
    uint64_t result = swift_release();
  }
  if (a1[16]) {
    uint64_t result = swift_release();
  }
  if (a1[18])
  {
    return swift_release();
  }
  return result;
}

uint64_t initializeWithCopy for AnyBindable(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  id v6 = (_OWORD *)(a2 + 32);
  uint64_t v7 = *(void *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v7)
  {
    *(void *)(a1 + 56) = v7;
    (**(void (***)(uint64_t, _OWORD *, uint64_t))(v7 - 8))(a1 + 32, v6, v7);
  }
  else
  {
    long long v8 = v6[1];
    *(_OWORD *)(a1 + 32) = *v6;
    *(_OWORD *)(a1 + 48) = v8;
  }
  uint64_t v9 = *(void *)(a2 + 112);
  long long v10 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v10;
  *(unsigned char *)(a1 + 96) = *(unsigned char *)(a2 + 96);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  if (v9)
  {
    uint64_t v11 = *(void *)(a2 + 120);
    *(void *)(a1 + 112) = v9;
    *(void *)(a1 + 120) = v11;
    swift_retain();
  }
  else
  {
    *(_OWORD *)(a1 + 112) = *(_OWORD *)(a2 + 112);
  }
  uint64_t v12 = *(void *)(a2 + 128);
  if (v12)
  {
    uint64_t v13 = *(void *)(a2 + 136);
    *(void *)(a1 + 128) = v12;
    *(void *)(a1 + 136) = v13;
    swift_retain();
  }
  else
  {
    *(_OWORD *)(a1 + 128) = *(_OWORD *)(a2 + 128);
  }
  uint64_t v14 = *(void *)(a2 + 144);
  if (v14)
  {
    uint64_t v15 = *(void *)(a2 + 152);
    *(void *)(a1 + 144) = v14;
    *(void *)(a1 + 152) = v15;
    swift_retain();
  }
  else
  {
    *(_OWORD *)(a1 + 144) = *(_OWORD *)(a2 + 144);
  }
  return a1;
}

uint64_t assignWithCopy for AnyBindable(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 56);
  if (*(void *)(a1 + 56))
  {
    if (v4)
    {
      __swift_assign_boxed_opaque_existential_0((uint64_t *)(a1 + 32), (uint64_t *)(a2 + 32));
      goto LABEL_8;
    }
    __swift_destroy_boxed_opaque_existential_0(a1 + 32);
  }
  else if (v4)
  {
    *(void *)(a1 + 56) = v4;
    (**(void (***)(uint64_t, uint64_t))(v4 - 8))(a1 + 32, a2 + 32);
    goto LABEL_8;
  }
  long long v5 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v5;
LABEL_8:
  uint64_t v6 = *(void *)(a1 + 112);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(unsigned char *)(a1 + 96) = *(unsigned char *)(a2 + 96);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  uint64_t v7 = *(void *)(a2 + 112);
  if (v6)
  {
    if (v7)
    {
      uint64_t v8 = *(void *)(a2 + 120);
      *(void *)(a1 + 112) = v7;
      *(void *)(a1 + 120) = v8;
      swift_retain();
      swift_release();
      goto LABEL_15;
    }
    swift_release();
  }
  else if (v7)
  {
    uint64_t v9 = *(void *)(a2 + 120);
    *(void *)(a1 + 112) = v7;
    *(void *)(a1 + 120) = v9;
    swift_retain();
    goto LABEL_15;
  }
  *(_OWORD *)(a1 + 112) = *(_OWORD *)(a2 + 112);
LABEL_15:
  uint64_t v10 = *(void *)(a2 + 128);
  if (*(void *)(a1 + 128))
  {
    if (v10)
    {
      uint64_t v11 = *(void *)(a2 + 136);
      *(void *)(a1 + 128) = v10;
      *(void *)(a1 + 136) = v11;
      swift_retain();
      swift_release();
      goto LABEL_22;
    }
    swift_release();
  }
  else if (v10)
  {
    uint64_t v12 = *(void *)(a2 + 136);
    *(void *)(a1 + 128) = v10;
    *(void *)(a1 + 136) = v12;
    swift_retain();
    goto LABEL_22;
  }
  *(_OWORD *)(a1 + 128) = *(_OWORD *)(a2 + 128);
LABEL_22:
  uint64_t v13 = *(void *)(a2 + 144);
  if (!*(void *)(a1 + 144))
  {
    if (v13)
    {
      uint64_t v15 = *(void *)(a2 + 152);
      *(void *)(a1 + 144) = v13;
      *(void *)(a1 + 152) = v15;
      swift_retain();
      return a1;
    }
LABEL_28:
    *(_OWORD *)(a1 + 144) = *(_OWORD *)(a2 + 144);
    return a1;
  }
  if (!v13)
  {
    swift_release();
    goto LABEL_28;
  }
  uint64_t v14 = *(void *)(a2 + 152);
  *(void *)(a1 + 144) = v13;
  *(void *)(a1 + 152) = v14;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t *__swift_assign_boxed_opaque_existential_0(uint64_t *result, uint64_t *a2)
{
  if (result != a2)
  {
    uint64_t v3 = result;
    uint64_t v4 = result[3];
    uint64_t v5 = a2[3];
    if (v4 == v5)
    {
      uint64_t v10 = *(void *)(v4 - 8);
      if ((*(unsigned char *)(v10 + 82) & 2) != 0)
      {
        uint64_t v12 = *a2;
        swift_retain();
        uint64_t result = (uint64_t *)swift_release();
        uint64_t *v3 = v12;
      }
      else
      {
        uint64_t v11 = *(uint64_t (**)(void))(v10 + 24);
        return (uint64_t *)v11();
      }
    }
    else
    {
      result[3] = v5;
      uint64_t v6 = *(void *)(v4 - 8);
      uint64_t v7 = *(void *)(v5 - 8);
      uint64_t v8 = v7;
      int v9 = *(_DWORD *)(v7 + 80);
      if ((*(unsigned char *)(v6 + 82) & 2) != 0)
      {
        if ((v9 & 0x20000) != 0)
        {
          *uint64_t result = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(result, a2, v5);
        }
        return (uint64_t *)swift_release();
      }
      else
      {
        (*(void (**)(unsigned char *, uint64_t *, uint64_t))(v6 + 32))(v13, result, v4);
        if ((v9 & 0x20000) != 0)
        {
          uint64_t *v3 = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(v3, a2, v5);
        }
        return (uint64_t *)(*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v13, v4);
      }
    }
  }
  return result;
}

__n128 __swift_memcpy160_8(uint64_t a1, uint64_t a2)
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
  __n128 result = *(__n128 *)(a2 + 96);
  long long v7 = *(_OWORD *)(a2 + 112);
  long long v8 = *(_OWORD *)(a2 + 144);
  *(_OWORD *)(a1 + 128) = *(_OWORD *)(a2 + 128);
  *(_OWORD *)(a1 + 144) = v8;
  *(__n128 *)(a1 + 96) = result;
  *(_OWORD *)(a1 + 112) = v7;
  return result;
}

uint64_t assignWithTake for AnyBindable(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  if (*(void *)(a1 + 56)) {
    __swift_destroy_boxed_opaque_existential_0(a1 + 32);
  }
  long long v6 = *(_OWORD *)(a2 + 48);
  uint64_t v7 = *(void *)(a2 + 112);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v6;
  uint64_t v8 = *(void *)(a1 + 112);
  long long v9 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v9;
  *(unsigned char *)(a1 + 96) = *(unsigned char *)(a2 + 96);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  if (v8)
  {
    if (v7)
    {
      uint64_t v10 = *(void *)(a2 + 120);
      *(void *)(a1 + 112) = v7;
      *(void *)(a1 + 120) = v10;
      swift_release();
      goto LABEL_10;
    }
    swift_release();
  }
  else if (v7)
  {
    uint64_t v11 = *(void *)(a2 + 120);
    *(void *)(a1 + 112) = v7;
    *(void *)(a1 + 120) = v11;
    goto LABEL_10;
  }
  *(_OWORD *)(a1 + 112) = *(_OWORD *)(a2 + 112);
LABEL_10:
  uint64_t v12 = *(void *)(a2 + 128);
  if (*(void *)(a1 + 128))
  {
    if (v12)
    {
      uint64_t v13 = *(void *)(a2 + 136);
      *(void *)(a1 + 128) = v12;
      *(void *)(a1 + 136) = v13;
      swift_release();
      goto LABEL_17;
    }
    swift_release();
  }
  else if (v12)
  {
    uint64_t v14 = *(void *)(a2 + 136);
    *(void *)(a1 + 128) = v12;
    *(void *)(a1 + 136) = v14;
    goto LABEL_17;
  }
  *(_OWORD *)(a1 + 128) = *(_OWORD *)(a2 + 128);
LABEL_17:
  uint64_t v15 = *(void *)(a2 + 144);
  if (!*(void *)(a1 + 144))
  {
    if (v15)
    {
      uint64_t v17 = *(void *)(a2 + 152);
      *(void *)(a1 + 144) = v15;
      *(void *)(a1 + 152) = v17;
      return a1;
    }
LABEL_23:
    *(_OWORD *)(a1 + 144) = *(_OWORD *)(a2 + 144);
    return a1;
  }
  if (!v15)
  {
    swift_release();
    goto LABEL_23;
  }
  uint64_t v16 = *(void *)(a2 + 152);
  *(void *)(a1 + 144) = v15;
  *(void *)(a1 + 152) = v16;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for AnyBindable(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 160)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  unint64_t v3 = *(void *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for AnyBindable(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)(result + 152) = 0;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 160) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 160) = 0;
    }
    if (a2) {
      *(void *)(result + 8) = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AnyBindable()
{
  return &type metadata for AnyBindable;
}

uint64_t sub_251254698()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for PSSpecifierGroupBuilder()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t method lookup function for HeadphoneSpecifier(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for HeadphoneSpecifier);
}

uint64_t dispatch thunk of HeadphoneSpecifier.__allocating_init(name:setAction:getAction:detail:cell:edit:buttonAction:)()
{
  return (*(uint64_t (**)(void))(v0 + 104))();
}

void type metadata accessor for PSTableCellType()
{
  if (!qword_269B2B440)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_269B2B440);
    }
  }
}

uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
}

uint64_t sub_2512547C8(uint64_t a1)
{
  sub_25126BB68();
  MEMORY[0x270FA5388]();
  sub_25126C448();
  MEMORY[0x270FA5388]();
  (*(void (**)(char *, uint64_t))(v3 + 16))((char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  type metadata accessor for HearingTopLevelCell();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v5 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_25126BB58();
  return sub_25126C4A8();
}

uint64_t sub_251254930(uint64_t a1)
{
  uint64_t v2 = sub_25126BB68();
  MEMORY[0x270FA5388](v2 - 8, v3);
  uint64_t v4 = sub_25126C448();
  MEMORY[0x270FA5388](v4, v5);
  (*(void (**)(char *, uint64_t))(v7 + 16))((char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  type metadata accessor for HearingTopLevelCell();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v9 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_25126BB58();
  return sub_25126C4A8();
}

uint64_t sub_251254AAC()
{
  uint64_t v0 = sub_25126C0E8();
  __swift_allocate_value_buffer(v0, qword_269B2D4E8);
  __swift_project_value_buffer(v0, (uint64_t)qword_269B2D4E8);
  return sub_25126C0D8();
}

uint64_t sub_251254B30()
{
  if (qword_269B2C6B0 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_25126C0E8();
  return __swift_project_value_buffer(v0, (uint64_t)qword_269B2D4E8);
}

uint64_t sub_251254B94@<X0>(uint64_t a1@<X8>)
{
  if (qword_269B2C6B0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_25126C0E8();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_269B2D4E8);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);
  return v4(a1, v3, v2);
}

id sub_251254C3C()
{
  uint64_t v0 = sub_25126C0E8();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0, v2);
  uint64_t v4 = (char *)&v32 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25126BDF8();
  uint64_t v5 = (void *)sub_25126BDD8();
  uint64_t v6 = sub_25126BDA8();
  uint64_t v8 = v7;
  uint64_t v9 = sub_25126BDC8();

  if (*(void *)(v9 + 16) && (unint64_t v10 = sub_25123BF30(v6, v8), (v11 & 1) != 0))
  {
    id v12 = *(id *)(*(void *)(v9 + 56) + 8 * v10);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (qword_269B2C6B0 != -1) {
      swift_once();
    }
    uint64_t v13 = __swift_project_value_buffer(v0, (uint64_t)qword_269B2D4E8);
    (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v4, v13, v0);
    id v14 = v12;
    uint64_t v15 = sub_25126C0C8();
    os_log_type_t v16 = sub_25126C628();
    int v17 = v16;
    if (os_log_type_enabled(v15, v16))
    {
      uint64_t v18 = swift_slowAlloc();
      int v34 = v17;
      uint64_t v19 = v18;
      id v20 = (void *)swift_slowAlloc();
      uint64_t v35 = swift_slowAlloc();
      uint64_t v36 = (uint64_t)v14;
      uint64_t v37 = v35;
      *(_DWORD *)uint64_t v19 = 138412546;
      os_log_t v33 = v15;
      id v21 = v14;
      sub_25126C768();
      void *v20 = v14;

      *(_WORD *)(v19 + 12) = 2080;
      uint64_t v32 = v19 + 14;
      __swift_instantiateConcreteTypeFromMangledName(&qword_269B2B448);
      uint64_t v22 = swift_allocObject();
      *(_OWORD *)(v22 + 16) = xmmword_25126E8C0;
      *(void *)(v22 + 56) = sub_25126BDB8();
      *(void *)(v22 + 64) = sub_25125A7BC(&qword_269B2B450, MEMORY[0x263F42900]);
      *(void *)(v22 + 32) = v21;
      id v23 = v21;
      uint64_t v24 = sub_25126C498();
      uint64_t v36 = sub_251240E7C(v24, v25, &v37);
      sub_25126C768();

      swift_bridgeObjectRelease();
      os_log_t v26 = v33;
      _os_log_impl(&dword_251222000, v33, (os_log_type_t)v34, "Connected Device is device: %@::%s", (uint8_t *)v19, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_269B2AF88);
      swift_arrayDestroy();
      MEMORY[0x253399FB0](v20, -1, -1);
      uint64_t v27 = v35;
      swift_arrayDestroy();
      MEMORY[0x253399FB0](v27, -1, -1);
      MEMORY[0x253399FB0](v19, -1, -1);
    }
    else
    {
    }
    (*(void (**)(char *, uint64_t))(v1 + 8))(v4, v0);
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (qword_269B2C6B0 != -1) {
      swift_once();
    }
    __swift_project_value_buffer(v0, (uint64_t)qword_269B2D4E8);
    objc_super v28 = sub_25126C0C8();
    os_log_type_t v29 = sub_25126C638();
    if (os_log_type_enabled(v28, v29))
    {
      id v30 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v30 = 0;
      _os_log_impl(&dword_251222000, v28, v29, "Connected Device is nil!", v30, 2u);
      MEMORY[0x253399FB0](v30, -1, -1);
    }

    return 0;
  }
  return v14;
}

Swift::Void __swiftcall HearingModeUIService.configHearingModeClient()()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_25126C6C8();
  uint64_t v25 = *(void *)(v2 - 8);
  uint64_t v26 = v2;
  MEMORY[0x270FA5388](v2, v3);
  uint64_t v5 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_25126C688();
  MEMORY[0x270FA5388](v6, v7);
  uint64_t v8 = sub_25126C378();
  MEMORY[0x270FA5388](v8 - 8, v9);
  id v10 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F472F8]), sel_init);
  objc_msgSend(v0, sel_setHmsClient_, v10);

  id v11 = objc_msgSend(v0, sel_hmsClient);
  if (!v11)
  {
    __break(1u);
    goto LABEL_7;
  }
  id v12 = v11;
  sub_25123DFF4(0, &qword_269B2AE18);
  sub_25126C368();
  aBlocuint64_t k = MEMORY[0x263F8EE78];
  sub_25125A7BC(&qword_269B2B458, MEMORY[0x263F8F0F8]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B2B460);
  sub_25123E030(&qword_269B2B468, &qword_269B2B460);
  sub_25126C7B8();
  (*(void (**)(char *, void, uint64_t))(v25 + 104))(v5, *MEMORY[0x263F8F130], v26);
  uint64_t v13 = (void *)sub_25126C6E8();
  objc_msgSend(v12, sel_setDispatchQueue_, v13);

  id v14 = objc_msgSend(v1, sel_hmsClient);
  if (!v14)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  uint64_t v15 = v14;
  uint64_t v16 = swift_allocObject();
  swift_unknownObjectWeakInit();
  id v31 = sub_25125A83C;
  uint64_t v32 = v16;
  aBlocuint64_t k = MEMORY[0x263EF8330];
  uint64_t v28 = 1107296256;
  os_log_type_t v29 = sub_2512555CC;
  id v30 = &block_descriptor_1;
  int v17 = _Block_copy(&aBlock);
  swift_release();
  objc_msgSend(v15, sel_setInterruptionHandler_, v17);
  _Block_release(v17);

  id v18 = objc_msgSend(v1, sel_hmsClient);
  if (!v18)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  uint64_t v19 = v18;
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakDestroy();
  id v31 = sub_251255610;
  uint64_t v32 = 0;
  aBlocuint64_t k = MEMORY[0x263EF8330];
  uint64_t v28 = 1107296256;
  os_log_type_t v29 = sub_2512555CC;
  id v30 = &block_descriptor_4;
  id v20 = _Block_copy(&aBlock);
  objc_msgSend(v19, sel_setInvalidationHandler_, v20);
  _Block_release(v20);

  id v21 = objc_msgSend(v1, sel_hmsClient);
  if (v21)
  {
    uint64_t v22 = v21;
    id v31 = sub_2512557D4;
    uint64_t v32 = 0;
    aBlocuint64_t k = MEMORY[0x263EF8330];
    uint64_t v28 = 1107296256;
    os_log_type_t v29 = sub_251240CB4;
    id v30 = &block_descriptor_7;
    id v23 = _Block_copy(&aBlock);
    objc_msgSend(v22, sel_activateWithCompletion_, v23);
    _Block_release(v23);

    return;
  }
LABEL_9:
  __break(1u);
}

uint64_t sub_2512555CC(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);
  return swift_release();
}

void sub_251255610()
{
  if (qword_269B2C6B0 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_25126C0E8();
  __swift_project_value_buffer(v0, (uint64_t)qword_269B2D4E8);
  oslog = sub_25126C0C8();
  os_log_type_t v1 = sub_25126C638();
  if (os_log_type_enabled(oslog, v1))
  {
    uint64_t v2 = swift_slowAlloc();
    uint64_t v3 = swift_slowAlloc();
    uint64_t v5 = v3;
    *(_DWORD *)uint64_t v2 = 136315394;
    sub_251240E7C(0xD000000000000019, 0x80000002512763B0, &v5);
    sub_25126C768();
    *(_WORD *)(v2 + 12) = 2048;
    sub_25126C768();
    _os_log_impl(&dword_251222000, oslog, v1, "HearingModeUIService: %s: %ld hearing client invalidated! Retrying to standup discovery stack", (uint8_t *)v2, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x253399FB0](v3, -1, -1);
    MEMORY[0x253399FB0](v2, -1, -1);
  }
  else
  {
  }
}

void sub_2512557D4(uint64_t a1)
{
  if (a1)
  {
    if (qword_269B2C6B0 != -1) {
      swift_once();
    }
    uint64_t v1 = sub_25126C0E8();
    __swift_project_value_buffer(v1, (uint64_t)qword_269B2D4E8);
    oslog = sub_25126C0C8();
    os_log_type_t v2 = sub_25126C638();
    if (os_log_type_enabled(oslog, v2))
    {
      uint64_t v3 = swift_slowAlloc();
      uint64_t v4 = swift_slowAlloc();
      uint64_t v6 = v4;
      *(_DWORD *)uint64_t v3 = 136315394;
      sub_251240E7C(0xD000000000000019, 0x80000002512763B0, &v6);
      sub_25126C768();
      *(_WORD *)(v3 + 12) = 2048;
      sub_25126C768();
      _os_log_impl(&dword_251222000, oslog, v2, "HearingModeUIService: %s: %ld failed to acitivate HMServiceClient", (uint8_t *)v3, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x253399FB0](v4, -1, -1);
      MEMORY[0x253399FB0](v3, -1, -1);
    }
    else
    {
    }
  }
}

uint64_t sub_2512559E4()
{
  uint64_t v0 = sub_25125C148((uint64_t)&unk_270214CC0);
  uint64_t result = swift_arrayDestroy();
  qword_269B2C6C0 = v0;
  return result;
}

uint64_t sub_251255A30()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B2B4B8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_25126F730;
  *(void *)(inited + 32) = 0xD000000000000015;
  *(void *)(inited + 40) = 0x8000000251276350;
  *(void *)(inited + 48) = 0xD000000000000011;
  *(void *)(inited + 56) = 0x8000000251276370;
  *(void *)(inited + 64) = 0x5F474E4952414548;
  *(void *)(inited + 72) = 0xEF44495F54534554;
  *(void *)(inited + 80) = 0xD000000000000016;
  *(void *)(inited + 88) = 0x8000000251276390;
  uint64_t v1 = sub_25125C148(inited);
  swift_setDeallocating();
  uint64_t result = swift_arrayDestroy();
  qword_269B2C6D0 = v1;
  return result;
}

uint64_t HearingModeUIService.decoratedSpecifiers(_:btAddress:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = v3;
  sub_25126BDF8();
  uint64_t v9 = (void *)sub_25126BDD8();
  *(void *)&v117[0] = a2;
  *((void *)&v117[0] + 1) = a3;
  uint64_t v118 = 58;
  unint64_t v119 = 0xE100000000000000;
  unint64_t v103 = sub_25123DF44();
  unint64_t v104 = v103;
  uint64_t v101 = MEMORY[0x263F8D310];
  unint64_t v102 = v103;
  uint64_t v10 = sub_25126C788();
  uint64_t isUniquelyReferenced_nonNull_native = v11;
  uint64_t v13 = sub_25126BDC8();

  if (!*(void *)(v13 + 16) || (unint64_t v14 = sub_25123BF30(v10, isUniquelyReferenced_nonNull_native), (v15 & 1) == 0))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_16;
  }
  id v16 = *(id *)(*(void *)(v13 + 56) + 8 * v14);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v17 = sub_2512568DC(a1);
  if (!v17)
  {

LABEL_16:
    if (qword_269B2C6B0 != -1) {
      goto LABEL_96;
    }
    goto LABEL_17;
  }
  unint64_t v18 = v17;
  id v113 = v5;
  unint64_t v19 = sub_25126BD68();
  id v20 = (id)(v18 >> 62);
  uint64_t v112 = (uint64_t)v16;
  if (v18 >> 62)
  {
    swift_bridgeObjectRetain_n();
    uint64_t v21 = sub_25126C8C8();
    swift_bridgeObjectRelease();
    if (v21 < 0) {
      goto LABEL_114;
    }
    if (v21 >= 1) {
      uint64_t v4 = 1;
    }
    else {
      uint64_t v4 = v21;
    }
    swift_bridgeObjectRetain();
    uint64_t isUniquelyReferenced_nonNull_native = sub_25126C8C8();
    swift_bridgeObjectRelease();
    if (isUniquelyReferenced_nonNull_native >= v4)
    {
      swift_bridgeObjectRetain();
      uint64_t v100 = sub_25126C8C8();
      uint64_t isUniquelyReferenced_nonNull_native = v18;
      swift_bridgeObjectRelease();
      if (v100 >= v21) {
        goto LABEL_115;
      }
      __break(1u);
    }
LABEL_104:
    __break(1u);
    goto LABEL_105;
  }
  uint64_t v21 = *(void *)((v18 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v21 >= 1) {
    uint64_t v4 = 1;
  }
  else {
    uint64_t v4 = *(void *)((v18 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRetain();
  if (v21 < (unint64_t)v4) {
    goto LABEL_104;
  }
  if ((v18 & 0xC000000000000001) == 0) {
    goto LABEL_13;
  }
LABEL_10:
  if ((unint64_t)v21 >= 2)
  {
    sub_25123DFF4(0, &qword_269B2AE98);
    uint64_t v22 = v4;
    do
    {
      uint64_t v23 = v22 + 1;
      sub_25126C808();
      uint64_t v22 = v23;
    }
    while (v21 != v23);
  }
  while (1)
  {
LABEL_13:
    uint64_t v107 = (void *)v19;
    if (v20)
    {
      swift_bridgeObjectRetain();
      sub_25126C8D8();
      uint64_t v114 = v31;
      uint64_t v4 = v32;
      unint64_t v24 = v33;
      swift_bridgeObjectRelease_n();
    }
    else
    {
      uint64_t v114 = (v18 & 0xFFFFFFFFFFFFFF8) + 32;
      unint64_t v24 = (2 * v21) | 1;
    }
    unint64_t v111 = v18;
    int64_t v34 = v24 >> 1;
    if (v4 != v24 >> 1)
    {
      swift_unknownObjectRetain();
      uint64_t v35 = (void *)MEMORY[0x263F8EE80];
      while (1)
      {
        if (v4 >= v34) {
          goto LABEL_93;
        }
        id v36 = *(id *)(v114 + 8 * v4);
        id v37 = objc_msgSend(v36, sel_identifier, v101, v102, v103, v104);
        if (v37) {
          break;
        }

LABEL_26:
        if (v34 == ++v4)
        {
          swift_unknownObjectRelease();
          goto LABEL_42;
        }
      }
      uint64_t v38 = v37;
      uint64_t v39 = sub_25126C488();
      uint64_t v21 = v40;

      id v20 = v36;
      uint64_t isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      *(void *)&v117[0] = v35;
      unint64_t v19 = sub_25123BF30(v39, v21);
      uint64_t v42 = v35[2];
      BOOL v43 = (v41 & 1) == 0;
      uint64_t v44 = v42 + v43;
      if (__OFADD__(v42, v43)) {
        goto LABEL_94;
      }
      char v45 = v41;
      if (v35[3] < v44)
      {
        sub_25125B95C(v44, isUniquelyReferenced_nonNull_native);
        unint64_t v46 = sub_25123BF30(v39, v21);
        if ((v45 & 1) != (v47 & 1)) {
          goto LABEL_113;
        }
        unint64_t v19 = v46;
        uint64_t v35 = *(void **)&v117[0];
        if ((v45 & 1) == 0) {
          goto LABEL_33;
        }
LABEL_37:
        uint64_t v52 = v35[7];

        *(void *)(v52 + 8 * v19) = v20;
LABEL_38:

        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        goto LABEL_26;
      }
      if (isUniquelyReferenced_nonNull_native)
      {
        uint64_t v35 = *(void **)&v117[0];
        if (v41) {
          goto LABEL_37;
        }
      }
      else
      {
        sub_25125BF94();
        uint64_t v35 = *(void **)&v117[0];
        if (v45) {
          goto LABEL_37;
        }
      }
LABEL_33:
      v35[(v19 >> 6) + 8] |= 1 << v19;
      uint64_t v48 = (uint64_t *)(v35[6] + 16 * v19);
      uint64_t *v48 = v39;
      v48[1] = v21;
      *(void *)(v35[7] + 8 * v19) = v20;
      uint64_t v49 = v35[2];
      BOOL v50 = __OFADD__(v49, 1);
      uint64_t v51 = v49 + 1;
      if (v50) {
        goto LABEL_95;
      }
      v35[2] = v51;
      swift_bridgeObjectRetain();
      goto LABEL_38;
    }
LABEL_42:
    swift_unknownObjectRelease();
    id v20 = v107;
    uint64_t v21 = (uint64_t)sub_25125C1E0(v111, (uint64_t)v20);
    uint64_t isUniquelyReferenced_nonNull_native = (uint64_t)sub_25125C600(v21);
    swift_bridgeObjectRelease();

    unint64_t v110 = (unint64_t)isUniquelyReferenced_nonNull_native >> 62;
    if ((unint64_t)isUniquelyReferenced_nonNull_native >> 62)
    {
LABEL_105:
      uint64_t v21 = isUniquelyReferenced_nonNull_native < 0
          ? isUniquelyReferenced_nonNull_native
          : isUniquelyReferenced_nonNull_native & 0xFFFFFFFFFFFFFF8;
      swift_bridgeObjectRetain();
      uint64_t v53 = sub_25126C8C8();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v53 = *(void *)((isUniquelyReferenced_nonNull_native & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    uint64_t v4 = MEMORY[0x263F8EE78];
    uint64_t v115 = isUniquelyReferenced_nonNull_native;
    if (!v53) {
      break;
    }
    id v108 = v20;
    uint64_t v116 = MEMORY[0x263F8EE78];
    sub_25125B4B8(0, v53 & ~(v53 >> 63), 0);
    if ((v53 & 0x8000000000000000) == 0)
    {
      uint64_t v54 = 0;
      uint64_t v4 = v116;
      unint64_t v55 = isUniquelyReferenced_nonNull_native & 0xC000000000000001;
      uint64_t v56 = *MEMORY[0x263F600A8];
      while (v53 != v54)
      {
        if (v55) {
          id v57 = (id)MEMORY[0x253399500](v54, isUniquelyReferenced_nonNull_native);
        }
        else {
          id v57 = *(id *)(isUniquelyReferenced_nonNull_native + 8 * v54 + 32);
        }
        uint64_t v58 = v57;
        *(void *)&v117[0] = 0;
        *((void *)&v117[0] + 1) = 0xE000000000000000;
        sub_25126C7E8();
        id v59 = objc_msgSend(v58, sel_description);
        uint64_t v60 = sub_25126C488();
        unint64_t v62 = v61;

        swift_bridgeObjectRelease();
        uint64_t v118 = v60;
        unint64_t v119 = v62;
        sub_25126C4D8();
        if (objc_msgSend(v58, sel_propertyForKey_, v56))
        {
          sub_25126C7A8();
          swift_unknownObjectRelease();
        }
        else
        {
          memset(v117, 0, sizeof(v117));
        }
        __swift_instantiateConcreteTypeFromMangledName(&qword_269B2AE90);
        sub_25126C4B8();
        sub_25126C4D8();
        swift_bridgeObjectRelease();
        uint64_t v63 = v118;
        unint64_t v64 = v119;

        unint64_t v19 = *(void *)(v116 + 16);
        unint64_t v65 = *(void *)(v116 + 24);
        if (v19 >= v65 >> 1) {
          sub_25125B4B8(v65 > 1, v19 + 1, 1);
        }
        ++v54;
        *(void *)(v116 + 16) = v19 + 1;
        unint64_t v66 = v116 + 16 * v19;
        *(void *)(v66 + 32) = v63;
        *(void *)(v66 + 40) = v64;
        uint64_t isUniquelyReferenced_nonNull_native = v115;
        if (v53 == v54)
        {
          id v20 = v108;
          goto LABEL_58;
        }
      }
      __break(1u);
      goto LABEL_92;
    }
    __break(1u);
LABEL_111:
    __break(1u);
LABEL_112:
    __break(1u);
LABEL_113:
    sub_25126C998();
    __break(1u);
LABEL_114:
    __break(1u);
LABEL_115:
    unint64_t v18 = isUniquelyReferenced_nonNull_native;
    if ((isUniquelyReferenced_nonNull_native & 0xC000000000000001) != 0) {
      goto LABEL_10;
    }
  }
LABEL_58:
  uint64_t v67 = 7104878;
  uint64_t isUniquelyReferenced_nonNull_native = (uint64_t)&off_265364000;
  if (objc_msgSend(v113, sel_delegate, v101, v102, v103, v104))
  {
    self;
    uint64_t v68 = swift_dynamicCastObjCClass();
    swift_unknownObjectRelease();
    if (v68)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_269B2B448);
      uint64_t v21 = swift_allocObject();
      *(_OWORD *)(v21 + 16) = xmmword_25126E8C0;
      if (objc_msgSend(v113, sel_delegate))
      {
        self;
        uint64_t v69 = swift_dynamicCastObjCClassUnconditional();
        *(void *)(v21 + 56) = sub_25123DFF4(0, &qword_269B2B470);
        *(void *)(v21 + 64) = sub_25125D1B8();
        *(void *)(v21 + 32) = v69;
        uint64_t v67 = sub_25126C498();
        unint64_t v71 = v70;
        goto LABEL_63;
      }
      goto LABEL_112;
    }
  }
  unint64_t v71 = 0xE300000000000000;
LABEL_63:
  if (qword_269B2C6B0 != -1) {
    swift_once();
  }
  uint64_t v72 = sub_25126C0E8();
  __swift_project_value_buffer(v72, (uint64_t)qword_269B2D4E8);
  id v73 = v20;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v74 = sub_25126C0C8();
  os_log_type_t v75 = sub_25126C648();
  uint64_t v109 = v73;
  if (os_log_type_enabled(v74, v75))
  {
    uint64_t v76 = swift_slowAlloc();
    uint64_t v106 = swift_slowAlloc();
    *(void *)&v117[0] = v106;
    *(_DWORD *)uint64_t v76 = 16778498;
    char v77 = sub_25126BFC8();

    LOBYTE(v118) = v77;
    sub_25126C768();

    *(_WORD *)(v76 + 5) = 256;
    uint64_t v105 = v67;
    char v78 = sub_25126BFA8();

    LOBYTE(v118) = v78;
    sub_25126C768();

    *(_WORD *)(v76 + 8) = 256;
    char v79 = sub_25126BF78();

    LOBYTE(v118) = v79;
    sub_25126C768();

    *(_WORD *)(v76 + 11) = 2080;
    uint64_t v80 = swift_bridgeObjectRetain();
    uint64_t v81 = MEMORY[0x253399230](v80, MEMORY[0x263F8D310]);
    unint64_t v83 = v82;
    swift_bridgeObjectRelease();
    uint64_t v118 = sub_251240E7C(v81, v83, (uint64_t *)v117);
    sub_25126C768();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v76 + 21) = 2080;
    swift_bridgeObjectRetain();
    uint64_t v118 = sub_251240E7C(v105, v71, (uint64_t *)v117);
    sub_25126C768();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_251222000, v74, v75, "HearingModeUIService decoratedSpecifiers: HP: %hhu  HA:%hhu  HT:%hhu VS:%s BTSC:%s", (uint8_t *)v76, 0x1Fu);
    swift_arrayDestroy();
    MEMORY[0x253399FB0](v106, -1, -1);
    MEMORY[0x253399FB0](v76, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
  }
  id v84 = objc_msgSend(v113, sel_headphoneDevice);
  id v85 = objc_allocWithZone((Class)sub_25126BC28());
  v86 = (void *)sub_25126BC18();
  sub_25126BC08();

  uint64_t isUniquelyReferenced_nonNull_native = v112;
  sub_25125CA3C();
  swift_bridgeObjectRelease();
  *(void *)&v117[0] = MEMORY[0x263F8EE78];
  if (v110)
  {
    unint64_t v87 = v115;
    swift_bridgeObjectRetain();
    uint64_t v21 = sub_25126C8C8();
    if (v21) {
      goto LABEL_70;
    }
LABEL_85:
    swift_bridgeObjectRelease();
    uint64_t v98 = MEMORY[0x263F8EE78];
    if ((MEMORY[0x263F8EE78] & 0x8000000000000000) == 0)
    {
LABEL_86:
      if ((v98 & 0x4000000000000000) == 0)
      {
        uint64_t v99 = *(void *)(v98 + 16);
LABEL_88:
        swift_release();
        if (v99 <= 0)
        {
          swift_bridgeObjectRelease();
          unint64_t v87 = MEMORY[0x263F8EE78];
        }
        uint64_t v29 = sub_2512399F4(v87);

        swift_bridgeObjectRelease();
        return v29;
      }
    }
LABEL_109:
    swift_bridgeObjectRetain();
    uint64_t v99 = sub_25126C8C8();
    swift_release();
    goto LABEL_88;
  }
  unint64_t v87 = v115;
  uint64_t v21 = *(void *)((v115 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (!v21) {
    goto LABEL_85;
  }
LABEL_70:
  unint64_t v88 = v87 & 0xC000000000000001;
  uint64_t v89 = 4;
  unint64_t v19 = (unint64_t)&unk_269B2C000;
  while (1)
  {
    id v91 = v88 ? (id)MEMORY[0x253399500](v89 - 4, v87) : *(id *)(v87 + 8 * v89);
    v92 = v91;
    id v20 = (id)(v89 - 3);
    if (__OFADD__(v89 - 4, 1)) {
      break;
    }
    if (qword_269B2C6C8 != -1) {
      swift_once();
    }
    uint64_t v93 = qword_269B2C6D0;
    swift_bridgeObjectRetain();
    id v94 = objc_msgSend(v92, sel_identifier);
    if (!v94) {
      goto LABEL_111;
    }
    uint64_t v4 = (uint64_t)v94;
    uint64_t v95 = sub_25126C488();
    uint64_t v97 = v96;

    uint64_t isUniquelyReferenced_nonNull_native = sub_2512569F8(v95, v97, v93);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (isUniquelyReferenced_nonNull_native)
    {
      sub_25126C848();
      uint64_t isUniquelyReferenced_nonNull_native = *(void *)(*(void *)&v117[0] + 16);
      sub_25126C878();
      sub_25126C888();
      sub_25126C858();
    }
    else
    {
    }
    ++v89;
    BOOL v90 = v20 == (id)v21;
    unint64_t v87 = v115;
    if (v90)
    {
      swift_bridgeObjectRelease();
      uint64_t v98 = *(void *)&v117[0];
      uint64_t isUniquelyReferenced_nonNull_native = v112;
      if ((*(void *)&v117[0] & 0x8000000000000000) == 0) {
        goto LABEL_86;
      }
      goto LABEL_109;
    }
  }
LABEL_92:
  __break(1u);
LABEL_93:
  __break(1u);
LABEL_94:
  __break(1u);
LABEL_95:
  __break(1u);
LABEL_96:
  swift_once();
LABEL_17:
  uint64_t v25 = sub_25126C0E8();
  __swift_project_value_buffer(v25, (uint64_t)qword_269B2D4E8);
  uint64_t v26 = sub_25126C0C8();
  os_log_type_t v27 = sub_25126C648();
  if (os_log_type_enabled(v26, v27))
  {
    uint64_t v28 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v28 = 0;
    _os_log_impl(&dword_251222000, v26, v27, "HearingModeUIService: Return Empty Specifiers, No device!", v28, 2u);
    MEMORY[0x253399FB0](v28, -1, -1);
  }

  return MEMORY[0x263F8EE78];
}

uint64_t sub_2512568DC(uint64_t a1)
{
  uint64_t v6 = MEMORY[0x263F8EE78];
  uint64_t v2 = *(void *)(a1 + 16);
  sub_25126C868();
  if (!v2) {
    return v6;
  }
  for (uint64_t i = a1 + 32; ; i += 32)
  {
    sub_2512419AC(i, (uint64_t)v5);
    sub_25123DFF4(0, &qword_269B2AE98);
    if (!swift_dynamicCast()) {
      break;
    }
    sub_25126C848();
    sub_25126C878();
    sub_25126C888();
    sub_25126C858();
    if (!--v2) {
      return v6;
    }
  }
  swift_release();

  return 0;
}

uint64_t sub_2512569F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a3 + 16))
  {
    sub_25126C9C8();
    sub_25126C4C8();
    uint64_t v6 = sub_25126C9E8();
    uint64_t v7 = -1 << *(unsigned char *)(a3 + 32);
    unint64_t v8 = v6 & ~v7;
    uint64_t v9 = a3 + 56;
    if ((*(void *)(a3 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8))
    {
      uint64_t v10 = *(void *)(a3 + 48);
      uint64_t v11 = (void *)(v10 + 16 * v8);
      BOOL v12 = *v11 == a1 && v11[1] == a2;
      if (v12 || (sub_25126C958() & 1) != 0) {
        return 1;
      }
      uint64_t v14 = ~v7;
      unint64_t v15 = (v8 + 1) & v14;
      if ((*(void *)(v9 + ((v15 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v15))
      {
        while (1)
        {
          id v16 = (void *)(v10 + 16 * v15);
          BOOL v17 = *v16 == a1 && v16[1] == a2;
          if (v17 || (sub_25126C958() & 1) != 0) {
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

Swift::Void __swiftcall HearingModeUIService.submitHPDeviceAnalytics()()
{
  id v1 = objc_msgSend(v0, sel_headphoneDevice);
  id v2 = objc_allocWithZone((Class)sub_25126BC28());
  id v3 = (id)sub_25126BC18();
  sub_25126BC08();
}

void sub_251256BA8()
{
}

uint64_t sub_251256C6C()
{
  swift_beginAccess();
  id v1 = objc_getAssociatedObject(v0, &byte_269B2D500);
  swift_endAccess();
  if (v1)
  {
    sub_25126C7A8();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v4, 0, sizeof(v4));
  }
  sub_25123D3B8((uint64_t)v4, (uint64_t)v5);
  if (v6)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_269B2B508);
    if (swift_dynamicCast()) {
      return v3;
    }
  }
  else
  {
    sub_25123DF98((uint64_t)v5, &qword_269B2AE90);
  }
  return 0;
}

id sub_251256D50(void *a1, void *a2)
{
  uint64_t v4 = sub_25126C0E8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4, v6);
  unint64_t v8 = (char *)&v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_269B2C6B0 != -1) {
    swift_once();
  }
  uint64_t v9 = __swift_project_value_buffer(v4, (uint64_t)qword_269B2D4E8);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v8, v9, v4);
  id v10 = a1;
  id v11 = a2;
  id v12 = v10;
  id v13 = v11;
  uint64_t v14 = sub_25126C0C8();
  os_log_type_t v15 = sub_25126C648();
  int v16 = v15;
  if (os_log_type_enabled(v14, v15))
  {
    uint64_t v17 = swift_slowAlloc();
    uint64_t v30 = swift_slowAlloc();
    uint64_t v32 = v30;
    *(_DWORD *)uint64_t v17 = 16778242;
    int v28 = v16;
    char v18 = sub_25126BFC8();

    LOBYTE(v31) = v18;
    sub_25126C768();

    uint64_t v29 = v4;
    *(_WORD *)(v17 + 5) = 256;
    char v19 = sub_25126BFA8();

    LOBYTE(v31) = v19;
    sub_25126C768();

    *(_WORD *)(v17 + 8) = 256;
    char v20 = sub_25126BF78();

    LOBYTE(v31) = v20;
    sub_25126C768();

    *(_WORD *)(v17 + 11) = 2080;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269B2B448);
    uint64_t v21 = swift_allocObject();
    *(_OWORD *)(v21 + 16) = xmmword_25126E8C0;
    *(void *)(v21 + 56) = sub_25123DFF4(0, &qword_269B2B470);
    *(void *)(v21 + 64) = sub_25125D1B8();
    *(void *)(v21 + 32) = v13;
    id v22 = v13;
    uint64_t v23 = sub_25126C498();
    uint64_t v31 = sub_251240E7C(v23, v24, &v32);
    sub_25126C768();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_251222000, v14, (os_log_type_t)v28, "HearingModeUIService listener triggered: HP: %hhu  HA:%hhu  HT:%hhu BTSC:%s", (uint8_t *)v17, 0x15u);
    uint64_t v25 = v30;
    swift_arrayDestroy();
    MEMORY[0x253399FB0](v25, -1, -1);
    MEMORY[0x253399FB0](v17, -1, -1);

    (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v29);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  }
  return objc_msgSend(v13, sel_reloadSpecifiers);
}

char *sub_251257110()
{
  return &byte_269B2D500;
}

uint64_t sub_25125711C()
{
  return byte_269B2D500;
}

uint64_t sub_251257160(char a1)
{
  uint64_t result = swift_beginAccess();
  byte_269B2D500 = a1;
  return result;
}

uint64_t (*sub_2512571A8())()
{
  return j__swift_endAccess;
}

Swift::Bool __swiftcall HearingModeUIService._showOcclusionDetectionPlacard()()
{
  id v1 = v0;
  uint64_t v2 = sub_25126C0E8();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v2, v4);
  uint64_t v7 = &v72[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v9 = MEMORY[0x270FA5388](v5, v8);
  id v11 = &v72[-v10];
  MEMORY[0x270FA5388](v9, v12);
  uint64_t v14 = &v72[-v13];
  id v15 = objc_msgSend(v0, sel_headphoneDevice);
  if (v15 && (v16 = v15, id v17 = sub_251254C3C(), v16, v17))
  {
    char v18 = (void *)sub_25126BD68();
    int v19 = sub_25126BFC8();

    if (v19 == 2)
    {
      char v20 = (void *)sub_25126BD68();
      int v21 = sub_25126BF98();

      if (v21 == 1)
      {
        id v22 = (void *)sub_25126BD68();
        int v23 = sub_25126BFE8();

        if (v23)
        {
          unint64_t v24 = (void *)sub_25126BD68();
          int v25 = sub_25126BFE8();

          BOOL v26 = v25 == 2;
          if (qword_269B2C6B0 != -1) {
            swift_once();
          }
          uint64_t v27 = __swift_project_value_buffer(v2, (uint64_t)qword_269B2D4E8);
          (*(void (**)(unsigned char *, uint64_t, uint64_t))(v3 + 16))(v14, v27, v2);
          int v28 = sub_25126C0C8();
          os_log_type_t v29 = sub_25126C648();
          uint64_t v30 = &unk_269B2C000;
          if (os_log_type_enabled(v28, v29))
          {
            BOOL v73 = v25 == 2;
            uint64_t v31 = swift_slowAlloc();
            LODWORD(v75) = v25;
            uint64_t v32 = v31;
            uint64_t v74 = swift_slowAlloc();
            uint64_t v78 = v74;
            uint64_t v33 = 8 * byte_269B2C6D8;
            uint64_t v34 = *(void *)&aUnknown_1[v33];
            *(_DWORD *)uint64_t v32 = 136315394;
            unint64_t v35 = *(void *)((char *)&unk_25126F878 + v33);
            uint64_t v76 = v2;
            uint64_t v77 = sub_251240E7C(v34, v35, &v78);
            sub_25126C768();
            uint64_t v30 = (unsigned char *)&unk_269B2C000;
            swift_bridgeObjectRelease();
            *(_WORD *)(v32 + 12) = 1024;
            LODWORD(v77) = v73;
            sub_25126C768();
            _os_log_impl(&dword_251222000, v28, v29, "previousShouldShowPlacardStatus %s shouldShowPlacard %{BOOL}d", (uint8_t *)v32, 0x12u);
            uint64_t v36 = v74;
            swift_arrayDestroy();
            MEMORY[0x253399FB0](v36, -1, -1);
            uint64_t v37 = v32;
            int v25 = v75;
            MEMORY[0x253399FB0](v37, -1, -1);

            (*(void (**)(unsigned char *, uint64_t))(v3 + 8))(v14, v76);
          }
          else
          {

            (*(void (**)(unsigned char *, uint64_t))(v3 + 8))(v14, v2);
          }
          unint64_t v62 = v30;
          if (!v30[1752])
          {
            swift_bridgeObjectRelease();
            goto LABEL_48;
          }
          char v63 = sub_25126C958();
          swift_bridgeObjectRelease();
          if (v63) {
            goto LABEL_48;
          }
          if (v62[1752] && v62[1752] == 1)
          {
            swift_bridgeObjectRelease();
          }
          else
          {
            char v64 = sub_25126C958();
            swift_bridgeObjectRelease();
            if ((v64 & 1) == 0)
            {
LABEL_42:
              if (v62[1752] && v62[1752] != 1)
              {
                swift_bridgeObjectRelease();
              }
              else
              {
                char v65 = sub_25126C958();
                swift_bridgeObjectRelease();
                if ((v65 & 1) == 0) {
                  goto LABEL_53;
                }
              }
              if (v25 != 2) {
                goto LABEL_55;
              }
LABEL_48:
              id v61 = objc_msgSend(v1, sel_hmsClient);
              if (!v61)
              {
                __break(1u);
                return (char)v61;
              }
              unint64_t v66 = v61;
              uint64_t v67 = (void *)sub_25126BD68();
              sub_25126BEA8();

              uint64_t v68 = (void *)sub_25126C458();
              swift_bridgeObjectRelease();
              if (v25 == 2) {
                uint64_t v69 = 7;
              }
              else {
                uint64_t v69 = 8;
              }
              objc_msgSend(v66, sel_occlusionIndicationShownForDeviceAddress_featureID_type_action_, v68, 2, v69, 0);

LABEL_53:
              if (v25 == 2)
              {
                char v70 = 1;
LABEL_56:
                v62[1752] = v70;

                goto LABEL_31;
              }
LABEL_55:
              char v70 = 2;
              goto LABEL_56;
            }
          }
          if (v25 != 2) {
            goto LABEL_48;
          }
          goto LABEL_42;
        }
      }
    }
    if (qword_269B2C6B0 != -1) {
      swift_once();
    }
    uint64_t v42 = __swift_project_value_buffer(v2, (uint64_t)qword_269B2D4E8);
    (*(void (**)(unsigned char *, uint64_t, uint64_t))(v3 + 16))(v11, v42, v2);
    id v43 = v17;
    uint64_t v44 = sub_25126C0C8();
    os_log_type_t v45 = sub_25126C638();
    if (os_log_type_enabled(v44, v45))
    {
      uint64_t v46 = swift_slowAlloc();
      uint64_t v75 = swift_slowAlloc();
      uint64_t v78 = v75;
      *(_DWORD *)uint64_t v46 = 136315906;
      uint64_t v77 = sub_251240E7C(0xD000000000000020, 0x8000000251274E20, &v78);
      sub_25126C768();
      *(_WORD *)(v46 + 12) = 2080;
      char v47 = (void *)sub_25126BD68();
      unsigned __int8 v48 = sub_25126BFC8();
      uint64_t v76 = v2;
      int v49 = v48;

      if (v49 == 2) {
        uint64_t v50 = 0x6574726F70707553;
      }
      else {
        uint64_t v50 = 0x7070755320746F4ELL;
      }
      if (v49 == 2) {
        unint64_t v51 = 0xE900000000000064;
      }
      else {
        unint64_t v51 = 0xED0000646574726FLL;
      }
      uint64_t v77 = sub_251240E7C(v50, v51, &v78);
      sub_25126C768();

      swift_bridgeObjectRelease();
      *(_WORD *)(v46 + 22) = 2080;
      uint64_t v52 = (void *)sub_25126BD68();
      int v53 = sub_25126BF98();

      if (v53 == 1) {
        uint64_t v54 = 0x64656C62616E45;
      }
      else {
        uint64_t v54 = 0x62616E4520746F4ELL;
      }
      if (v53 == 1) {
        unint64_t v55 = 0xE700000000000000;
      }
      else {
        unint64_t v55 = 0xEB0000000064656CLL;
      }
      uint64_t v77 = sub_251240E7C(v54, v55, &v78);
      sub_25126C768();

      swift_bridgeObjectRelease();
      *(_WORD *)(v46 + 32) = 2080;
      uint64_t v56 = (void *)sub_25126BD68();
      unsigned int v57 = sub_25126BFE8();

      HMOcclusionResultToString(v57);
      uint64_t v58 = sub_25126C4E8();
      uint64_t v77 = sub_251240E7C(v58, v59, &v78);
      sub_25126C768();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_251222000, v44, v45, "%s: Region status %s HearingProtection %s Occlusion Result %s returning without showing placard", (uint8_t *)v46, 0x2Au);
      uint64_t v60 = v75;
      swift_arrayDestroy();
      MEMORY[0x253399FB0](v60, -1, -1);
      MEMORY[0x253399FB0](v46, -1, -1);

      (*(void (**)(unsigned char *, uint64_t))(v3 + 8))(v11, v76);
    }
    else
    {

      (*(void (**)(unsigned char *, uint64_t))(v3 + 8))(v11, v2);
    }
  }
  else
  {
    sub_25126C0B8();
    uint64_t v38 = sub_25126C0C8();
    os_log_type_t v39 = sub_25126C638();
    if (os_log_type_enabled(v38, v39))
    {
      uint64_t v40 = (uint8_t *)swift_slowAlloc();
      uint64_t v41 = swift_slowAlloc();
      uint64_t v78 = v41;
      *(_DWORD *)uint64_t v40 = 136315138;
      uint64_t v77 = sub_251240E7C(0xD000000000000020, 0x8000000251274E20, &v78);
      sub_25126C768();
      _os_log_impl(&dword_251222000, v38, v39, "%s: No headphone device", v40, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x253399FB0](v41, -1, -1);
      MEMORY[0x253399FB0](v40, -1, -1);
    }

    (*(void (**)(unsigned char *, uint64_t))(v3 + 8))(v7, v2);
  }
  BOOL v26 = 0;
LABEL_31:
  LOBYTE(v61) = v26;
  return (char)v61;
}

unint64_t HearingModeUIService._getHearingAssistPayload(_:device:inUsecase:)(uint64_t a1, uint64_t a2, void *a3, unint64_t a4)
{
  uint64_t v5 = v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B2AF58);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_25126F730;
  *(void *)(inited + 32) = 0x65726464612D7462;
  *(void *)(inited + 40) = 0xEA00000000007373;
  *(void *)(inited + 72) = MEMORY[0x263F8D310];
  *(void *)(inited + 48) = a1;
  *(void *)(inited + 56) = a2;
  swift_bridgeObjectRetain();
  id v11 = (uint64_t *)sub_25125EC58();
  uint64_t v13 = *v11;
  uint64_t v12 = v11[1];
  *(void *)(inited + 80) = v13;
  *(void *)(inited + 88) = v12;
  swift_bridgeObjectRetain();
  id v14 = objc_msgSend(v5, sel_hmsClient);
  *(void *)(inited + 120) = __swift_instantiateConcreteTypeFromMangledName(&qword_269B2B480);
  *(void *)(inited + 96) = v14;
  id v15 = sub_25124F4CC();
  uint64_t v16 = v15[1];
  *(void *)(inited + 128) = *v15;
  *(void *)(inited + 136) = v16;
  *(void *)(inited + 168) = sub_25126BDB8();
  *(void *)(inited + 144) = a3;
  swift_bridgeObjectRetain();
  id v17 = a3;
  char v18 = (uint64_t *)sub_25124F444();
  uint64_t v20 = *v18;
  uint64_t v19 = v18[1];
  *(void *)(inited + 176) = v20;
  *(void *)(inited + 184) = v19;
  swift_bridgeObjectRetain();
  unint64_t v21 = HearingTopLevelCellUseCase.init(rawValue:)(a4);
  v27[3] = &type metadata for HearingTopLevelCellUseCase;
  v27[4] = &off_270214A08;
  if (v22) {
    unint64_t v23 = 0;
  }
  else {
    unint64_t v23 = v21;
  }
  v27[0] = v23;
  uint64_t v24 = type metadata accessor for HearingTopLevelCaseObjectWrapper();
  id v25 = sub_25124F1E8((uint64_t)v27);
  *(void *)(inited + 216) = v24;
  *(void *)(inited + 192) = v25;
  return sub_251234B54(inited);
}

void sub_251257F2C(int a1, void *a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, NSObject *a10)
{
  uint64_t v41 = a4;
  uint64_t v42 = a6;
  id v40 = a3;
  int v43 = a1;
  id v14 = a10;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B2B488);
  MEMORY[0x270FA5388](v15 - 8, v16);
  char v18 = (char *)&v36 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_269B2C6B0 != -1) {
    swift_once();
  }
  uint64_t v19 = sub_25126C0E8();
  __swift_project_value_buffer(v19, (uint64_t)qword_269B2D4E8);
  id v20 = a2;
  id v21 = a2;
  char v22 = sub_25126C0C8();
  os_log_type_t v23 = sub_25126C648();
  if (os_log_type_enabled(v22, v23))
  {
    uint64_t v37 = a7;
    uint64_t v38 = a8;
    uint64_t v24 = swift_slowAlloc();
    uint64_t v25 = swift_slowAlloc();
    uint64_t v45 = v25;
    *(_DWORD *)uint64_t v24 = 67109378;
    LODWORD(v44) = v43;
    sub_25126C768();
    *(_WORD *)(v24 + 8) = 2080;
    os_log_type_t v39 = a10;
    if (a2)
    {
      swift_getErrorValue();
      uint64_t v26 = sub_25126C9A8();
      unint64_t v28 = v27;
    }
    else
    {
      uint64_t v26 = 0;
      unint64_t v28 = 0xE000000000000000;
    }
    uint64_t v44 = sub_251240E7C(v26, v28, &v45);
    sub_25126C768();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_251222000, v22, v23, "fetchOcclusionResult: %d %s", (uint8_t *)v24, 0x12u);
    swift_arrayDestroy();
    MEMORY[0x253399FB0](v25, -1, -1);
    MEMORY[0x253399FB0](v24, -1, -1);

    a8 = v38;
    id v14 = v39;
    a7 = v37;
  }
  else
  {
  }
  uint64_t v29 = sub_25126C5D8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v29 - 8) + 56))(v18, 1, 1, v29);
  sub_25126C5B8();
  id v30 = v40;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  uint64_t v31 = sub_25126C5A8();
  uint64_t v32 = swift_allocObject();
  uint64_t v33 = MEMORY[0x263F8F500];
  *(void *)(v32 + 16) = v31;
  *(void *)(v32 + 24) = v33;
  *(_DWORD *)(v32 + 32) = v43;
  uint64_t v34 = v41;
  *(void *)(v32 + 40) = v30;
  *(void *)(v32 + 48) = v34;
  uint64_t v35 = v42;
  *(void *)(v32 + 56) = a5;
  *(void *)(v32 + 64) = v35;
  *(void *)(v32 + 72) = a7;
  *(void *)(v32 + 80) = a8;
  *(void *)(v32 + 88) = a9;
  sub_25125852C((uint64_t)v18, (uint64_t)&unk_269B2B498, v32);
  swift_release();
  dispatch_group_leave(v14);
}

uint64_t sub_25125828C(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(void *)(v8 + 64) = v14;
  *(_OWORD *)(v8 + 48) = v13;
  *(void *)(v8 + 32) = a7;
  *(void *)(v8 + 40) = a8;
  *(void *)(v8 + 16) = a5;
  *(void *)(v8 + 24) = a6;
  *(_DWORD *)(v8 + 80) = a4;
  sub_25126C5B8();
  *(void *)(v8 + 72) = sub_25126C5A8();
  uint64_t v10 = sub_25126C598();
  return MEMORY[0x270FA2498](sub_251258340, v10, v9);
}

uint64_t sub_251258340()
{
  int v1 = *(_DWORD *)(v0 + 80);
  uint64_t v2 = swift_release();
  switch(v1)
  {
    case 0:
    case 1:
      uint64_t v3 = *(void (**)(void))(v0 + 40);
      uint64_t v4 = (void *)sub_25126BC48();
      v3();

      break;
    case 2:
    case 7:
      uint64_t v6 = *(void (**)(void *))(v0 + 40);
      uint64_t v5 = *(void *)(v0 + 48);
      sub_25126BD98();
      uint64_t v7 = swift_allocObject();
      *(void *)(v7 + 16) = v6;
      *(void *)(v7 + 24) = v5;
      swift_retain();
      uint64_t v8 = (void *)sub_25126BC58();
      swift_release();
      swift_bridgeObjectRelease();
      v6(v8);

      break;
    case 3:
    case 4:
    case 5:
    case 6:
      (*(void (**)(uint64_t))(v0 + 56))(v2);
      break;
    default:
      break;
  }
  uint64_t v9 = *(uint64_t (**)(void))(v0 + 8);
  return v9();
}

uint64_t sub_25125852C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25126C5D8();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_25126C5C8();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_25123DF98(a1, &qword_269B2B488);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_25126C598();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

void sub_2512586D8(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  swift_retain();
  id v6 = a3;
  v5(a2, a3);
  swift_release();
}

Swift::Void __swiftcall HearingModeUIService._showOcclusionTutorial()()
{
  int v1 = v0;
  uint64_t v2 = sub_25126C0E8();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2, v4);
  id v6 = (char *)&v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v7 = objc_msgSend(v0, sel_headphoneDevice);
  if (v7 && (uint64_t v8 = v7, v9 = sub_251254C3C(), v8, v9))
  {
    sub_25126BD98();
    id v10 = objc_allocWithZone((Class)sub_25126BCC8());
    uint64_t v11 = (void *)sub_25126BCB8();
    objc_msgSend(v11, sel_setModalInPresentation_, 1);
    id v12 = objc_msgSend(v11, sel_navigationItem);
    sub_25123DFF4(0, &qword_269B2B5A0);
    sub_25123DFF4(0, &qword_269B2B050);
    *(void *)(swift_allocObject() + 16) = v11;
    id v13 = v11;
    sub_25126C728();
    uint64_t v14 = (void *)sub_25126C658();
    objc_msgSend(v12, sel_setRightBarButtonItem_, v14);

    id v15 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F829B8]), sel_initWithRootViewController_, v13);
    id v16 = objc_msgSend(v1, sel_delegate);
    if (v16)
    {
      uint64_t v17 = v16;
      if (objc_msgSend(v16, sel_respondsToSelector_, sel_presentViewController_)) {
        objc_msgSend(v17, sel_presentViewController_, v15);
      }
      swift_unknownObjectRelease();
    }
    id v18 = objc_msgSend(v1, sel_hmsClient);
    if (v18)
    {
      uint64_t v19 = v18;
      id v20 = (void *)sub_25126BD68();
      sub_25126BEA8();

      uint64_t v27 = sub_25126C458();
      swift_bridgeObjectRelease();
      objc_msgSend(v19, sel_occlusionIndicationShownForDeviceAddress_featureID_type_action_, v27, 2, 7, 3);

      id v21 = (void *)v27;
    }
    else
    {
      __break(1u);
    }
  }
  else
  {
    sub_25126C0B8();
    char v22 = sub_25126C0C8();
    os_log_type_t v23 = sub_25126C638();
    if (os_log_type_enabled(v22, v23))
    {
      uint64_t v24 = (uint8_t *)swift_slowAlloc();
      uint64_t v25 = swift_slowAlloc();
      uint64_t v29 = v25;
      *(_DWORD *)uint64_t v24 = 136315138;
      uint64_t v28 = sub_251240E7C(0xD000000000000018, 0x8000000251274E50, &v29);
      sub_25126C768();
      _os_log_impl(&dword_251222000, v22, v23, "%s: No headphone device", v24, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x253399FB0](v25, -1, -1);
      MEMORY[0x253399FB0](v24, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  }
}

Swift::Void __swiftcall HearingModeUIService.hearingTestTapped()()
{
  int v1 = v0;
  uint64_t v2 = sub_25126C0E8();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2, v4);
  id v6 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v7 = objc_msgSend(v0, sel_headphoneDevice);
  if (v7 && (uint64_t v8 = v7, v9 = sub_251254C3C(), v8, v9))
  {
    id v10 = objc_msgSend(v1, sel_hmsClient);
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = swift_allocObject();
      swift_unknownObjectWeakInit();
      uint64_t v13 = swift_allocObject();
      swift_unknownObjectWeakInit();
      swift_retain();
      swift_retain();
      _sSo20HearingModeUIServiceC0aB10SettingsUIE18showOcclusionAlert_13serviceClient13presentAction04passL0y16HeadphoneManager0N6DeviceC_So09HMServiceJ0CySo16UIViewControllerCcyyctFZ_0(v9, v11, sub_25125D85C, v12, (uint64_t)sub_25125D908, v13);

      swift_release_n();
      swift_release_n();
    }
    else
    {
      __break(1u);
    }
  }
  else
  {
    sub_25126C0B8();
    uint64_t v14 = sub_25126C0C8();
    os_log_type_t v15 = sub_25126C638();
    if (os_log_type_enabled(v14, v15))
    {
      id v16 = (uint8_t *)swift_slowAlloc();
      uint64_t v17 = swift_slowAlloc();
      uint64_t v19 = v17;
      *(_DWORD *)id v16 = 136315138;
      uint64_t v18 = sub_251240E7C(0xD000000000000013, 0x8000000251274E70, &v19);
      sub_25126C768();
      _os_log_impl(&dword_251222000, v14, v15, "%s: No headphone device", v16, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x253399FB0](v17, -1, -1);
      MEMORY[0x253399FB0](v16, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  }
}

Swift::Bool __swiftcall HearingModeUIService._getHearingAssist()()
{
  uint64_t v1 = sub_25126C0E8();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1, v3);
  uint64_t v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v6 = objc_msgSend(v0, sel_headphoneDevice);
  if (v6 && (v7 = v6, id v8 = sub_251254C3C(), v7, v8))
  {
    id v9 = (void *)sub_25126BD68();
    int v10 = sub_25126BF68();

    return v10 == 1;
  }
  else
  {
    sub_25126C0B8();
    uint64_t v12 = sub_25126C0C8();
    os_log_type_t v13 = sub_25126C638();
    if (os_log_type_enabled(v12, v13))
    {
      uint64_t v14 = (uint8_t *)swift_slowAlloc();
      uint64_t v15 = swift_slowAlloc();
      uint64_t v17 = v15;
      *(_DWORD *)uint64_t v14 = 136315138;
      uint64_t v16 = sub_251240E7C(0xD000000000000013, 0x8000000251274E90, &v17);
      sub_25126C768();
      _os_log_impl(&dword_251222000, v12, v13, "%s: No headphone device", v14, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x253399FB0](v15, -1, -1);
      MEMORY[0x253399FB0](v14, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v2 + 8))(v5, v1);
    return 0;
  }
}

Swift::Void __swiftcall HearingModeUIService.submitHADeviceAnalytics(enrolled:)(Swift::Int enrolled)
{
  id v11 = objc_msgSend(objc_allocWithZone((Class)sub_25126BC28()), sel_init);
  id v2 = objc_msgSend(v1, sel_headphoneDevice);
  if (v2)
  {
    id v3 = v2;
    id v4 = objc_msgSend(v1, sel_headphoneDevice);
    if (v4)
    {
      uint64_t v5 = v4;
      id v6 = (void *)sub_25126BD58();

      objc_msgSend(v6, sel_productID);
      id v7 = (id)sub_25126C9F8();
    }
    else
    {
      id v7 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F8C6D0]), sel_init);
    }
    id v9 = v7;
    sub_25126BBD8();

    int v10 = (void *)sub_25126C5F8();
    sub_25126BBD8();

    sub_25126BBE8();
    id v8 = v3;
  }
  else
  {
    id v8 = v11;
  }
}

Swift::String __swiftcall HearingModeUIService.getHearingAidString(_:)(Swift::String a1)
{
  object = a1._object;
  uint64_t countAndFlagsBits = a1._countAndFlagsBits;
  uint64_t v3 = sub_25126C448();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3, v5);
  uint64_t v68 = (char *)&v62 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_25126C0E8();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v7, v9);
  uint64_t v12 = (char *)&v62 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = MEMORY[0x270FA5388](v10, v13);
  uint64_t v69 = (char *)&v62 - v15;
  MEMORY[0x270FA5388](v14, v16);
  uint64_t v18 = (char *)&v62 - v17;
  sub_25126BDF8();
  uint64_t v19 = (void *)sub_25126BDD8();
  v74[0] = countAndFlagsBits;
  v74[1] = (uint64_t)object;
  uint64_t v72 = 58;
  unint64_t v73 = 0xE100000000000000;
  uint64_t v70 = 45;
  unint64_t v71 = 0xE100000000000000;
  sub_25123DF44();
  uint64_t v20 = sub_25126C788();
  uint64_t v22 = v21;
  uint64_t v23 = sub_25126BDC8();

  if (*(void *)(v23 + 16))
  {
    unint64_t v24 = sub_25123BF30(v20, v22);
    if (v25)
    {
      uint64_t v65 = v3;
      uint64_t v66 = v7;
      id v26 = *(id *)(*(void *)(v23 + 56) + 8 * v24);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      id v64 = v26;
      uint64_t v27 = (void *)sub_25126BD68();
      sub_25126C0B8();
      id v28 = v27;
      uint64_t v29 = sub_25126C0C8();
      os_log_type_t v30 = sub_25126C648();
      if (os_log_type_enabled(v29, v30))
      {
        uint64_t v31 = swift_slowAlloc();
        uint64_t v62 = swift_slowAlloc();
        v74[0] = v62;
        *(_DWORD *)uint64_t v31 = 136315650;
        unsigned __int8 v32 = sub_25126BFC8();
        HMRegionStatusToString(v32);
        uint64_t v33 = sub_25126C4E8();
        uint64_t v72 = sub_251240E7C(v33, v34, v74);
        uint64_t v63 = v4;
        sub_25126C768();

        swift_bridgeObjectRelease();
        *(_WORD *)(v31 + 12) = 2080;
        unsigned __int8 v35 = sub_25126BF78();
        HMRegionStatusToString(v35);
        uint64_t v36 = sub_25126C4E8();
        uint64_t v72 = sub_251240E7C(v36, v37, v74);
        sub_25126C768();

        swift_bridgeObjectRelease();
        *(_WORD *)(v31 + 22) = 2080;
        unsigned __int8 v38 = sub_25126BFA8();
        HMRegionStatusToString(v38);
        uint64_t v39 = sub_25126C4E8();
        uint64_t v72 = sub_251240E7C(v39, v40, v74);
        uint64_t v4 = v63;
        sub_25126C768();

        swift_bridgeObjectRelease();
        _os_log_impl(&dword_251222000, v29, v30, "Hearing Mode: Fetching footer with mode HP - %s, HT - %s, HA - %s", (uint8_t *)v31, 0x20u);
        uint64_t v41 = v62;
        swift_arrayDestroy();
        MEMORY[0x253399FB0](v41, -1, -1);
        MEMORY[0x253399FB0](v31, -1, -1);
      }
      else
      {
      }
      char v47 = *(void (**)(char *, uint64_t))(v8 + 8);
      v47(v18, v66);
      char v48 = sub_25126BFC8();
      char v49 = sub_25126BF78();
      char v50 = sub_25126BFA8();
      uint64_t v51 = v65;
      uint64_t v52 = v69;
      if (v48 == 3)
      {
        if (v49 != 3)
        {
          if (v49 == 2)
          {
            if (v50 == 3 || v50 == 2 || v50 == 1) {
              goto LABEL_56;
            }
          }
          else if (v49 == 1 && (v50 == 3 || v50 == 2 || v50 == 1))
          {
            goto LABEL_56;
          }
          goto LABEL_57;
        }
        if (v50 != 3)
        {
          if (v50 == 2 || v50 == 1) {
            goto LABEL_56;
          }
          goto LABEL_57;
        }
      }
      else
      {
        if (v48 != 2)
        {
          if (v48 == 1)
          {
            if (v49 == 3)
            {
              if (v50 == 3 || v50 == 2 || v50 == 1) {
                goto LABEL_56;
              }
            }
            else if (v49 == 2)
            {
              if (v50 == 3 || v50 == 2 || v50 == 1) {
                goto LABEL_56;
              }
            }
            else if (v49 == 1 && (v50 == 3 || v50 == 2 || v50 == 1))
            {
              goto LABEL_56;
            }
          }
          goto LABEL_57;
        }
        if (v49 == 3)
        {
          if (v50 == 3 || v50 == 2 || v50 == 1) {
            goto LABEL_56;
          }
          goto LABEL_57;
        }
        if (v49 != 2)
        {
          if (v49 == 1 && (v50 == 3 || v50 == 2 || v50 == 1)) {
            goto LABEL_56;
          }
          goto LABEL_57;
        }
        if (v50 == 3)
        {
LABEL_56:
          int v53 = v68;
          v74[0] = v67;
          sub_25126C3D8();
          sub_25123DFF4(0, &qword_269B2B3D8);
          uint64_t v54 = (uint64_t)v53;
LABEL_61:
          uint64_t v45 = sub_251254930(v54);
          unint64_t v46 = v58;

          (*(void (**)(char *, uint64_t))(v4 + 8))(v53, v51);
          goto LABEL_62;
        }
        if (v50 != 2)
        {
          if (v50 == 1) {
            goto LABEL_56;
          }
LABEL_57:
          sub_25126C0B8();
          unint64_t v55 = sub_25126C0C8();
          os_log_type_t v56 = sub_25126C648();
          if (os_log_type_enabled(v55, v56))
          {
            unsigned int v57 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)unsigned int v57 = 0;
            _os_log_impl(&dword_251222000, v55, v56, "Hearing Mode: Reached erroneous state", v57, 2u);
            MEMORY[0x253399FB0](v57, -1, -1);
          }

          v47(v52, v66);
          int v53 = v68;
          v74[0] = v67;
          sub_25126C3D8();
          sub_25123DFF4(0, &qword_269B2B3D8);
          goto LABEL_60;
        }
      }
      int v53 = v68;
      v74[0] = v67;
      sub_25126C3D8();
      sub_25123DFF4(0, &qword_269B2B3D8);
LABEL_60:
      uint64_t v54 = (uint64_t)v53;
      goto LABEL_61;
    }
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_25126C0B8();
  uint64_t v42 = sub_25126C0C8();
  os_log_type_t v43 = sub_25126C648();
  if (os_log_type_enabled(v42, v43))
  {
    uint64_t v44 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v44 = 0;
    _os_log_impl(&dword_251222000, v42, v43, "Hearing Mode: Invalid BT Address while fetching footer", v44, 2u);
    MEMORY[0x253399FB0](v44, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v8 + 8))(v12, v7);
  uint64_t v45 = 0;
  unint64_t v46 = 0xE000000000000000;
LABEL_62:
  uint64_t v59 = v45;
  uint64_t v60 = (void *)v46;
  result._object = v60;
  result._uint64_t countAndFlagsBits = v59;
  return result;
}

unsigned __int8 *sub_25125A5B8@<X0>(unsigned __int8 *result@<X0>, _WORD *a2@<X8>)
{
  *a2 = *result;
  return result;
}

void sub_25125A5C8(unsigned char *a1@<X8>)
{
  *a1 = *v1;
}

BOOL sub_25125A5D4(_DWORD *a1, _DWORD *a2)
{
  return *a1 == *a2;
}

uint64_t sub_25125A5E8(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_25125A6C4;
  return v6(a1);
}

uint64_t sub_25125A6C4()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_25125A7BC(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_25125A804()
{
  swift_unknownObjectWeakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_25125A83C()
{
  uint64_t v1 = v0 + 16;
  if (qword_269B2C6B0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_25126C0E8();
  __swift_project_value_buffer(v2, (uint64_t)qword_269B2D4E8);
  uint64_t v3 = sub_25126C0C8();
  os_log_type_t v4 = sub_25126C638();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = swift_slowAlloc();
    uint64_t v6 = swift_slowAlloc();
    v9[0] = v6;
    *(_DWORD *)uint64_t v5 = 136315394;
    sub_251240E7C(0xD000000000000019, 0x80000002512763B0, v9);
    sub_25126C768();
    *(_WORD *)(v5 + 12) = 2048;
    sub_25126C768();
    _os_log_impl(&dword_251222000, v3, v4, "HearingModeUIService: %s: %ld hearing client interrupted! Retrying to standup discovery stack", (uint8_t *)v5, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x253399FB0](v6, -1, -1);
    MEMORY[0x253399FB0](v5, -1, -1);
  }

  swift_beginAccess();
  uint64_t v7 = (void *)MEMORY[0x25339A050](v1);
  if (v7)
  {
    uint64_t v8 = v7;
    objc_msgSend(v7, sel_configHearingModeClient);
  }
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

uint64_t sub_25125AA28(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *v3;
  sub_25126C9C8();
  swift_bridgeObjectRetain();
  sub_25126C4C8();
  uint64_t v8 = sub_25126C9E8();
  uint64_t v9 = -1 << *(unsigned char *)(v7 + 32);
  unint64_t v10 = v8 & ~v9;
  if ((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10))
  {
    uint64_t v11 = *(void *)(v7 + 48);
    uint64_t v12 = (void *)(v11 + 16 * v10);
    BOOL v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_25126C958() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v14 = (uint64_t *)(*(void *)(*v3 + 48) + 16 * v10);
      uint64_t v15 = v14[1];
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
      if (v19 || (sub_25126C958() & 1) != 0) {
        goto LABEL_7;
      }
    }
  }
  swift_bridgeObjectRelease();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v21 = *v3;
  uint64_t *v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_25125AEB8(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  uint64_t *v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_25125ABD8()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B2B4C0);
  uint64_t v3 = sub_25126C7D8();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    os_log_type_t v30 = (void *)(v2 + 56);
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
    while (1)
    {
      if (v7)
      {
        unint64_t v14 = __clz(__rbit64(v7));
        v7 &= v7 - 1;
        unint64_t v15 = v14 | (v11 << 6);
      }
      else
      {
        int64_t v16 = v11 + 1;
        if (__OFADD__(v11, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v16 >= v8) {
          goto LABEL_33;
        }
        unint64_t v17 = v30[v16];
        ++v11;
        if (!v17)
        {
          int64_t v11 = v16 + 1;
          if (v16 + 1 >= v8) {
            goto LABEL_33;
          }
          unint64_t v17 = v30[v11];
          if (!v17)
          {
            int64_t v11 = v16 + 2;
            if (v16 + 2 >= v8) {
              goto LABEL_33;
            }
            unint64_t v17 = v30[v11];
            if (!v17)
            {
              int64_t v18 = v16 + 3;
              if (v18 >= v8)
              {
LABEL_33:
                swift_release();
                uint64_t v1 = v0;
                uint64_t v29 = 1 << *(unsigned char *)(v2 + 32);
                if (v29 > 63) {
                  bzero(v30, ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  void *v30 = -1 << v29;
                }
                *(void *)(v2 + 16) = 0;
                break;
              }
              unint64_t v17 = v30[v18];
              if (!v17)
              {
                while (1)
                {
                  int64_t v11 = v18 + 1;
                  if (__OFADD__(v18, 1)) {
                    goto LABEL_39;
                  }
                  if (v11 >= v8) {
                    goto LABEL_33;
                  }
                  unint64_t v17 = v30[v11];
                  ++v18;
                  if (v17) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v11 = v18;
            }
          }
        }
LABEL_23:
        unint64_t v7 = (v17 - 1) & v17;
        unint64_t v15 = __clz(__rbit64(v17)) + (v11 << 6);
      }
      BOOL v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
      uint64_t v20 = *v19;
      uint64_t v21 = v19[1];
      sub_25126C9C8();
      sub_25126C4C8();
      uint64_t result = sub_25126C9E8();
      uint64_t v22 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v23 = result & ~v22;
      unint64_t v24 = v23 >> 6;
      if (((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6))) != 0)
      {
        unint64_t v12 = __clz(__rbit64((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v25 = 0;
        unint64_t v26 = (unint64_t)(63 - v22) >> 6;
        do
        {
          if (++v24 == v26 && (v25 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v27 = v24 == v26;
          if (v24 == v26) {
            unint64_t v24 = 0;
          }
          v25 |= v27;
          uint64_t v28 = *(void *)(v9 + 8 * v24);
        }
        while (v28 == -1);
        unint64_t v12 = __clz(__rbit64(~v28)) + (v24 << 6);
      }
      *(void *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
      BOOL v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
      *BOOL v13 = v20;
      v13[1] = v21;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v1 = v4;
  return result;
}

uint64_t sub_25125AEB8(uint64_t result, uint64_t a2, unint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v8 = result;
  unint64_t v9 = *(void *)(*v4 + 16);
  unint64_t v10 = *(void *)(*v4 + 24);
  if (v10 > v9 && (a4 & 1) != 0) {
    goto LABEL_22;
  }
  if (a4)
  {
    sub_25125ABD8();
  }
  else
  {
    if (v10 > v9)
    {
      uint64_t result = (uint64_t)sub_25125B054();
      goto LABEL_22;
    }
    sub_25125B208();
  }
  uint64_t v11 = *v4;
  sub_25126C9C8();
  sub_25126C4C8();
  uint64_t result = sub_25126C9E8();
  uint64_t v12 = -1 << *(unsigned char *)(v11 + 32);
  a3 = result & ~v12;
  uint64_t v13 = v11 + 56;
  if ((*(void *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3))
  {
    uint64_t v14 = *(void *)(v11 + 48);
    unint64_t v15 = (void *)(v14 + 16 * a3);
    BOOL v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (uint64_t result = sub_25126C958(), (result & 1) != 0))
    {
LABEL_21:
      uint64_t result = sub_25126C988();
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
        int64_t v18 = (void *)(v14 + 16 * a3);
        if (*v18 != v8 || v18[1] != a2)
        {
          uint64_t result = sub_25126C958();
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
  uint64_t v21 = (uint64_t *)(*(void *)(v20 + 48) + 16 * a3);
  *uint64_t v21 = v8;
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

void *sub_25125B054()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B2B4C0);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_25126C7C8();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    uint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 56);
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
    int64_t v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v20 >= v13) {
      goto LABEL_28;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      int64_t v9 = v20 + 1;
      if (v20 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v21 = *(void *)(v6 + 8 * v9);
      if (!v21)
      {
        int64_t v9 = v20 + 2;
        if (v20 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v21 = *(void *)(v6 + 8 * v9);
        if (!v21) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v21 - 1) & v21;
    unint64_t v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (void *)(*(void *)(v2 + 48) + v16);
    uint64_t v18 = v17[1];
    BOOL v19 = (void *)(*(void *)(v4 + 48) + v16);
    void *v19 = *v17;
    v19[1] = v18;
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v22 = v20 + 3;
  if (v22 >= v13) {
    goto LABEL_28;
  }
  unint64_t v21 = *(void *)(v6 + 8 * v22);
  if (v21)
  {
    int64_t v9 = v22;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v9);
    ++v22;
    if (v21) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_25125B208()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B2B4C0);
  uint64_t v3 = sub_25126C7D8();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
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
  while (1)
  {
    if (v8)
    {
      unint64_t v14 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v15 = v14 | (v11 << 6);
      goto LABEL_24;
    }
    int64_t v16 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v16 >= v29) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v11;
    if (!v17)
    {
      int64_t v11 = v16 + 1;
      if (v16 + 1 >= v29) {
        goto LABEL_33;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v11);
      if (!v17)
      {
        int64_t v11 = v16 + 2;
        if (v16 + 2 >= v29) {
          goto LABEL_33;
        }
        unint64_t v17 = *(void *)(v6 + 8 * v11);
        if (!v17) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v8 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v11 << 6);
LABEL_24:
    BOOL v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v20 = *v19;
    uint64_t v21 = v19[1];
    sub_25126C9C8();
    swift_bridgeObjectRetain();
    sub_25126C4C8();
    uint64_t result = sub_25126C9E8();
    uint64_t v22 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v23 = result & ~v22;
    unint64_t v24 = v23 >> 6;
    if (((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6))) != 0)
    {
      unint64_t v12 = __clz(__rbit64((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v22) >> 6;
      do
      {
        if (++v24 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v27 = v24 == v26;
        if (v24 == v26) {
          unint64_t v24 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v9 + 8 * v24);
      }
      while (v28 == -1);
      unint64_t v12 = __clz(__rbit64(~v28)) + (v24 << 6);
    }
    *(void *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
    int64_t v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
    *int64_t v13 = v20;
    v13[1] = v21;
    ++*(void *)(v4 + 16);
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v29)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    uint64_t v1 = v0;
    goto LABEL_35;
  }
  unint64_t v17 = *(void *)(v6 + 8 * v18);
  if (v17)
  {
    int64_t v11 = v18;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v11 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v11 >= v29) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v11);
    ++v18;
    if (v17) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_25125B4B8(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_25125B4D8(a1, a2, a3, *v3);
  uint64_t *v3 = (char *)result;
  return result;
}

uint64_t sub_25125B4D8(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_269B2B4B8);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  int64_t v13 = v10 + 32;
  unint64_t v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[16 * v8] || v13 >= &v14[16 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_25126C918();
  __break(1u);
  return result;
}

uint64_t sub_25125B644(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B2B500);
  char v36 = a2;
  uint64_t v6 = sub_25126C8F8();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v35 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  int64_t v34 = (unint64_t)(v8 + 63) >> 6;
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
    if (v21 >= v34) {
      break;
    }
    uint64_t v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v35 + 8 * v21);
    ++v13;
    if (!v23)
    {
      int64_t v13 = v21 + 1;
      if (v21 + 1 >= v34) {
        goto LABEL_33;
      }
      unint64_t v23 = *(void *)(v35 + 8 * v13);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v34)
        {
LABEL_33:
          swift_release();
          if ((v36 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v23 = *(void *)(v35 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v13 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v34) {
              goto LABEL_33;
            }
            unint64_t v23 = *(void *)(v35 + 8 * v13);
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
    int64_t v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v20);
    uint64_t v31 = *v29;
    uint64_t v30 = v29[1];
    uint64_t v32 = *(void *)(*(void *)(v5 + 56) + 8 * v20);
    if ((v36 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_retain();
    }
    sub_25126C9C8();
    sub_25126C4C8();
    uint64_t result = sub_25126C9E8();
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
    int64_t v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
    *int64_t v18 = v31;
    v18[1] = v30;
    *(void *)(*(void *)(v7 + 56) + 8 * v17) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v22 = (void *)(v5 + 64);
  if ((v36 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v33 = 1 << *(unsigned char *)(v5 + 32);
  if (v33 >= 64) {
    bzero(v22, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v22 = -1 << v33;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  uint64_t *v3 = v7;
  return result;
}

uint64_t sub_25125B95C(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B2B4B0);
  char v38 = a2;
  uint64_t v6 = sub_25126C8F8();
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
    uint64_t v22 = (void *)(v5 + 64);
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
    int64_t v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v20);
    uint64_t v31 = *v29;
    uint64_t v30 = v29[1];
    uint64_t v32 = *(void **)(*(void *)(v5 + 56) + 8 * v20);
    if ((v38 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      id v33 = v32;
    }
    sub_25126C9C8();
    sub_25126C4C8();
    uint64_t result = sub_25126C9E8();
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
    int64_t v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
    *int64_t v18 = v31;
    v18[1] = v30;
    *(void *)(*(void *)(v7 + 56) + 8 * v17) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v35;
  uint64_t v22 = (void *)(v5 + 64);
  if ((v38 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v34 = 1 << *(unsigned char *)(v5 + 32);
  if (v34 >= 64) {
    bzero(v22, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v22 = -1 << v34;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  uint64_t *v3 = v7;
  return result;
}

uint64_t sub_25125BC6C(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = *v4;
  unint64_t v12 = sub_25123BF30(a2, a3);
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
    sub_25125BDDC();
LABEL_7:
    int64_t v18 = (void *)*v5;
    if (v16)
    {
LABEL_8:
      uint64_t v19 = v18[7];
      uint64_t result = swift_release();
      *(void *)(v19 + 8 * v12) = a1;
      return result;
    }
    goto LABEL_11;
  }
  sub_25125B644(v15, a4 & 1);
  unint64_t v21 = sub_25123BF30(a2, a3);
  if ((v16 & 1) != (v22 & 1))
  {
LABEL_17:
    uint64_t result = sub_25126C998();
    __break(1u);
    return result;
  }
  unint64_t v12 = v21;
  int64_t v18 = (void *)*v5;
  if (v16) {
    goto LABEL_8;
  }
LABEL_11:
  v18[(v12 >> 6) + 8] |= 1 << v12;
  unint64_t v23 = (uint64_t *)(v18[6] + 16 * v12);
  *unint64_t v23 = a2;
  v23[1] = a3;
  *(void *)(v18[7] + 8 * v12) = a1;
  uint64_t v24 = v18[2];
  BOOL v25 = __OFADD__(v24, 1);
  uint64_t v26 = v24 + 1;
  if (v25)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v18[2] = v26;
  return swift_bridgeObjectRetain();
}

void *sub_25125BDDC()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B2B500);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_25126C8E8();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
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
    uint64_t v20 = *(void *)(*(void *)(v2 + 56) + v19);
    unint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *unint64_t v21 = *v17;
    v21[1] = v18;
    *(void *)(*(void *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    uint64_t result = (void *)swift_retain();
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

id sub_25125BF94()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B2B4B0);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_25126C8E8();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (id)swift_release();
    *uint64_t v1 = v4;
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
    uint64_t v20 = *(void **)(*(void *)(v2 + 56) + v19);
    unint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *unint64_t v21 = *v17;
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

uint64_t sub_25125C148(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t result = sub_25126C5E8();
  uint64_t v8 = result;
  if (v2)
  {
    uint64_t v4 = (uint64_t *)(a1 + 40);
    do
    {
      uint64_t v5 = *(v4 - 1);
      uint64_t v6 = *v4;
      swift_bridgeObjectRetain();
      sub_25125AA28(&v7, v5, v6);
      swift_bridgeObjectRelease();
      v4 += 2;
      --v2;
    }
    while (v2);
    return v8;
  }
  return result;
}

id sub_25125C1E0(unint64_t a1, uint64_t a2)
{
  uint64_t v23 = MEMORY[0x263F8EE78];
  if (a1 >> 62) {
    goto LABEL_44;
  }
  for (uint64_t i = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10); i; uint64_t i = sub_25126C8C8())
  {
    unint64_t v4 = 0;
    while (1)
    {
      if ((a1 & 0xC000000000000001) != 0)
      {
        id v5 = (id)MEMORY[0x253399500](v4, a1);
        goto LABEL_11;
      }
      if (v4 >= *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
        break;
      }
      id v5 = *(id *)(a1 + 8 * v4 + 32);
LABEL_11:
      uint64_t v6 = v5;
      unint64_t v7 = v4 + 1;
      if (__OFADD__(v4, 1)) {
        goto LABEL_43;
      }
      if (qword_269B2C6B8 != -1) {
        swift_once();
      }
      uint64_t v8 = qword_269B2C6C0;
      swift_bridgeObjectRetain();
      id result = objc_msgSend(v6, sel_identifier);
      if (!result)
      {
        __break(1u);
        return result;
      }
      uint64_t v10 = result;
      uint64_t v11 = sub_25126C488();
      uint64_t v13 = v12;

      LOBYTE(v11) = sub_2512569F8(v11, v13, v8);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v11) {
        goto LABEL_5;
      }
      id v14 = objc_msgSend(v6, sel_identifier);
      if (!v14) {
        goto LABEL_32;
      }
      unint64_t v15 = v14;
      uint64_t v16 = sub_25126C488();
      uint64_t v8 = v17;

      if (v16 == 0xD000000000000015 && v8 == 0x8000000251276350 || (sub_25126C958() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        uint64_t v8 = a2;
        char v18 = sub_25126BFC8();
        goto LABEL_25;
      }
      if (v16 == 0xD000000000000011 && v8 == 0x8000000251276370 || (sub_25126C958() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        uint64_t v8 = a2;
        char v18 = sub_25126BFA8();
        goto LABEL_25;
      }
      if (v8)
      {
        if (v16 == 0x5F474E4952414548 && v8 == 0xEF44495F54534554 || (sub_25126C958() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          uint64_t v8 = a2;
          char v18 = sub_25126BF78();
LABEL_25:
          char v19 = v18 == 1;
          if (v22) {
            goto LABEL_40;
          }
          goto LABEL_33;
        }
        if (v16 == 0xD000000000000016 && v8 == 0x8000000251276390)
        {
          swift_bridgeObjectRelease();
LABEL_5:
          if (v22) {
            goto LABEL_40;
          }
          goto LABEL_6;
        }
        char v20 = sub_25126C958();
        swift_bridgeObjectRelease();
        char v19 = v20 ^ 1;
        if (v22)
        {
LABEL_40:
          swift_bridgeObjectRelease();

          swift_release();
          return (id)v8;
        }
      }
      else
      {
LABEL_32:
        char v19 = 1;
        if (v22) {
          goto LABEL_40;
        }
      }
LABEL_33:
      if (v19)
      {

        goto LABEL_7;
      }
LABEL_6:
      sub_25126C848();
      sub_25126C878();
      sub_25126C888();
      sub_25126C858();
LABEL_7:
      ++v4;
      if (v7 == i)
      {
        uint64_t v8 = v23;
        goto LABEL_46;
      }
    }
    __break(1u);
LABEL_43:
    __break(1u);
LABEL_44:
    ;
  }
  uint64_t v8 = MEMORY[0x263F8EE78];
LABEL_46:
  swift_bridgeObjectRelease();
  return (id)v8;
}

id sub_25125C600(unint64_t a1)
{
  unint64_t v1 = a1;
  if (a1 >> 62) {
    goto LABEL_39;
  }
  uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    id result = (id)MEMORY[0x263F8EE78];
    if (!v2) {
      return result;
    }
    uint64_t v24 = MEMORY[0x263F8EE78];
    id result = (id)sub_25126C868();
    if (v2 < 0)
    {
      __break(1u);
LABEL_41:
      __break(1u);
      return result;
    }
    uint64_t v4 = 0;
    unint64_t v22 = v1 & 0xC000000000000001;
    id v5 = &off_265364000;
    uint64_t v20 = *MEMORY[0x263F600A8];
    unint64_t v21 = v1;
    while (v2 != v4)
    {
      if (v22) {
        id v6 = (id)MEMORY[0x253399500](v4, v1);
      }
      else {
        id v6 = *(id *)(v1 + 8 * v4 + 32);
      }
      unint64_t v7 = v6;
      id v8 = [v6 (SEL)v5[339]];
      if (v8)
      {
        int64_t v9 = v8;
        uint64_t v10 = sub_25126C488();
        uint64_t v12 = v11;

        if (v10 == 0xD000000000000015 && v12 == 0x8000000251276350 || (sub_25126C958() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          sub_25126BFC8();
        }
        else if (v10 == 0xD000000000000011 && v12 == 0x8000000251276370 || (sub_25126C958() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          sub_25126BFA8();
        }
        else if (v12)
        {
          if (v10 == 0x5F474E4952414548 && v12 == 0xEF44495F54534554 || (sub_25126C958() & 1) != 0)
          {
            swift_bridgeObjectRelease();
            sub_25126BF78();
          }
          else if (v10 == 0xD000000000000016 && v12 == 0x8000000251276390)
          {
            swift_bridgeObjectRelease();
          }
          else
          {
            sub_25126C958();
            swift_bridgeObjectRelease();
          }
        }
      }
      if (qword_269B2C6B8 != -1) {
        swift_once();
      }
      uint64_t v13 = qword_269B2C6C0;
      swift_bridgeObjectRetain();
      id v14 = v5;
      id result = [v7 (SEL)v5[339]];
      if (!result) {
        goto LABEL_41;
      }
      unint64_t v15 = result;
      uint64_t v16 = sub_25126C488();
      uint64_t v18 = v17;

      LOBYTE(v16) = sub_2512569F8(v16, v18, v13);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v16 & 1) == 0)
      {
        char v19 = (void *)sub_25126C588();
        objc_msgSend(v7, sel_setProperty_forKey_, v19, v20);
      }
      if (v23) {
        return (id)swift_release();
      }
      ++v4;
      sub_25126C848();
      sub_25126C878();
      sub_25126C888();
      sub_25126C858();
      id v5 = v14;
      unint64_t v1 = v21;
      if (v2 == v4) {
        return (id)v24;
      }
    }
    __break(1u);
LABEL_39:
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_25126C8C8();
    swift_bridgeObjectRelease();
  }
}

void sub_25125CA3C()
{
  unint64_t v1 = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B2B4C8);
  uint64_t v61 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2, v3);
  id v6 = (char *)&v57 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = MEMORY[0x270FA5388](v4, v7);
  uint64_t v10 = (char *)&v57 - v9;
  MEMORY[0x270FA5388](v8, v11);
  uint64_t v13 = (char *)&v57 - v12;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B2B4D0);
  uint64_t v62 = *(void *)(v14 - 8);
  uint64_t v63 = v14;
  MEMORY[0x270FA5388](v14, v15);
  uint64_t v17 = (char *)&v57 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B2B4D8);
  uint64_t v64 = *(void *)(v18 - 8);
  uint64_t v65 = v18;
  MEMORY[0x270FA5388](v18, v19);
  unint64_t v21 = (char *)&v57 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_251256C6C();
  uint64_t v60 = sub_25126C238();
  unint64_t v22 = (void *)sub_25126C3B8();
  swift_bridgeObjectRelease();
  swift_beginAccess();
  objc_setAssociatedObject(v0, &byte_269B2D500, v22, (void *)1);
  swift_endAccess();

  id v23 = sub_251254C3C();
  if (!v23)
  {
    if (qword_269B2C6B0 != -1) {
      swift_once();
    }
    uint64_t v50 = sub_25126C0E8();
    __swift_project_value_buffer(v50, (uint64_t)qword_269B2D4E8);
    uint64_t v51 = sub_25126C0C8();
    os_log_type_t v52 = sub_25126C638();
    if (os_log_type_enabled(v51, v52))
    {
      int v53 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)int v53 = 0;
      _os_log_impl(&dword_251222000, v51, v52, "HearingModeUIService listener precondition fail no device", v53, 2u);
      MEMORY[0x253399FB0](v53, -1, -1);
    }
    goto LABEL_16;
  }
  uint64_t v24 = v23;
  BOOL v25 = (void *)sub_25126BD68();

  id v26 = objc_msgSend(v1, sel_delegate);
  if (!v26)
  {
LABEL_12:
    if (qword_269B2C6B0 != -1) {
      swift_once();
    }
    uint64_t v54 = sub_25126C0E8();
    __swift_project_value_buffer(v54, (uint64_t)qword_269B2D4E8);
    uint64_t v51 = sub_25126C0C8();
    os_log_type_t v55 = sub_25126C638();
    if (!os_log_type_enabled(v51, v55))
    {

      return;
    }
    os_log_type_t v56 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)os_log_type_t v56 = 0;
    _os_log_impl(&dword_251222000, v51, v55, "observeSpecifiers: no delegate!", v56, 2u);
    MEMORY[0x253399FB0](v56, -1, -1);

LABEL_16:
    return;
  }
  id v27 = v26;
  self;
  uint64_t v28 = swift_dynamicCastObjCClass();
  if (!v28)
  {
    swift_unknownObjectRelease();
    goto LABEL_12;
  }
  uint64_t v58 = v28;
  sub_25126BFD8();
  uint64_t v29 = sub_25126C2B8();
  unsigned int v57 = v21;
  uint64_t v30 = v1;
  uint64_t v31 = v29;
  id v59 = v27;
  uint64_t v32 = v25;
  id v33 = *(void (**)(char *, uint64_t))(v61 + 8);
  v33(v13, v2);
  uint64_t v68 = v31;
  uint64_t v34 = v32;
  sub_25126BFB8();
  uint64_t v35 = sub_25126C2B8();
  v33(v10, v2);
  uint64_t v67 = v35;
  sub_25126BF88();
  uint64_t v36 = sub_25126C2B8();
  v33(v6, v2);
  uint64_t v66 = v36;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B2B4E0);
  sub_25123E030(&qword_269B2B4E8, &qword_269B2B4E0);
  sub_25126C1F8();
  sub_25123E030(&qword_269B2B4F0, &qword_269B2B4D0);
  uint64_t v37 = v57;
  uint64_t v38 = v63;
  sub_25126C318();
  (*(void (**)(char *, uint64_t))(v62 + 8))(v17, v38);
  uint64_t v39 = swift_allocObject();
  uint64_t v40 = v58;
  *(void *)(v39 + 16) = v34;
  *(void *)(v39 + 24) = v40;
  sub_25123E030(&qword_269B2B4F8, &qword_269B2B4D8);
  swift_unknownObjectRetain();
  id v41 = v34;
  uint64_t v42 = v65;
  os_log_type_t v43 = v37;
  uint64_t v44 = sub_25126C338();
  swift_release();
  (*(void (**)(char *, uint64_t))(v64 + 8))(v43, v42);
  swift_retain();
  uint64_t v45 = sub_251256C6C();
  if (v45)
  {
    uint64_t v46 = v45;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v68 = v46;
    sub_25125BC6C(v44, 0x4F676E6972616548, 0xEF72657672657362, isUniquelyReferenced_nonNull_native);
    uint64_t v48 = v68;
    swift_bridgeObjectRelease();
    if (v48)
    {
      char v49 = (void *)sub_25126C3B8();
      swift_bridgeObjectRelease();
    }
    else
    {
      char v49 = 0;
    }
    swift_beginAccess();
    objc_setAssociatedObject(v30, &byte_269B2D500, v49, (void *)1);
    swift_endAccess();
    swift_release();

    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
  }
  else
  {
    __break(1u);
  }
}

unint64_t sub_25125D1B8()
{
  unint64_t result = qword_269B2B478;
  if (!qword_269B2B478)
  {
    sub_25123DFF4(255, &qword_269B2B470);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B2B478);
  }
  return result;
}

const char *HMOcclusionResultToString(unsigned int a1)
{
  if (a1 > 7) {
    return "?";
  }
  else {
    return off_265364458[a1];
  }
}

unint64_t _sSo20HearingModeUIServiceC0aB10SettingsUIE20_getOcclusionPayload_6device9inUsecaseSDySSypGSS_16HeadphoneManager0L6DeviceCSitF_0(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B2AF58);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_25126E900;
  *(void *)(inited + 32) = 0x65726464612D7462;
  *(void *)(inited + 40) = 0xEA00000000007373;
  *(void *)(inited + 72) = MEMORY[0x263F8D310];
  *(void *)(inited + 48) = a1;
  *(void *)(inited + 56) = a2;
  swift_bridgeObjectRetain();
  uint64_t v9 = sub_25124F4CC();
  uint64_t v10 = v9[1];
  *(void *)(inited + 80) = *v9;
  *(void *)(inited + 88) = v10;
  *(void *)(inited + 120) = sub_25126BDB8();
  *(void *)(inited + 96) = a3;
  swift_bridgeObjectRetain();
  id v11 = a3;
  uint64_t v12 = (uint64_t *)sub_25124F444();
  uint64_t v14 = *v12;
  uint64_t v13 = v12[1];
  *(void *)(inited + 128) = v14;
  *(void *)(inited + 136) = v13;
  swift_bridgeObjectRetain();
  BOOL v15 = HearingOcclusionUseCase.init(rawValue:)(a4);
  v21[3] = &type metadata for HearingOcclusionUseCase;
  v21[4] = &off_270214A20;
  BOOL v17 = (v16 & 1) == 0 && v15;
  v21[0] = v17;
  uint64_t v18 = type metadata accessor for HearingTopLevelCaseObjectWrapper();
  id v19 = sub_25124F1E8((uint64_t)v21);
  *(void *)(inited + 168) = v18;
  *(void *)(inited + 144) = v19;
  return sub_251234B54(inited);
}

void _sSo20HearingModeUIServiceC0aB10SettingsUIE18showOcclusionAlert_13serviceClient13presentAction04passL0y16HeadphoneManager0N6DeviceC_So09HMServiceJ0CySo16UIViewControllerCcyyctFZ_0(void *a1, void *a2, void (*a3)(void), uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v38 = a6;
  id v39 = a2;
  uint64_t v41 = a4;
  uint64_t v42 = a3;
  uint64_t v40 = sub_25126C398();
  uint64_t v37 = *(void *)(v40 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v40, v8);
  id v11 = (char *)v36 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9, v12);
  uint64_t v14 = (char *)v36 - v13;
  BOOL v15 = dispatch_group_create();
  dispatch_group_enter(v15);
  aBlocuint64_t k = sub_25126BDA8();
  uint64_t v44 = v16;
  uint64_t v51 = 45;
  unint64_t v52 = 0xE100000000000000;
  uint64_t v49 = 58;
  unint64_t v50 = 0xE100000000000000;
  sub_25123DF44();
  uint64_t v17 = sub_25126C788();
  uint64_t v19 = v18;
  swift_bridgeObjectRelease();
  uint64_t v20 = (void *)sub_25126BD58();
  id v21 = objc_msgSend(v20, sel_identifier);

  if (v21)
  {
    sub_25126C488();
  }
  unint64_t v22 = (void *)sub_25126C458();
  swift_bridgeObjectRelease();
  id v23 = (void *)swift_allocObject();
  _OWORD v23[2] = a1;
  v23[3] = v17;
  v36[1] = v17;
  uint64_t v25 = v41;
  uint64_t v24 = v42;
  v23[4] = v19;
  v23[5] = v24;
  v23[6] = v25;
  v23[7] = a5;
  v23[8] = v38;
  v23[9] = v15;
  char v47 = sub_25125DC18;
  uint64_t v48 = v23;
  aBlocuint64_t k = MEMORY[0x263EF8330];
  uint64_t v44 = 1107296256;
  uint64_t v45 = sub_2512586D8;
  uint64_t v46 = &block_descriptor_18;
  id v26 = _Block_copy(&aBlock);
  id v27 = a1;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  uint64_t v28 = v15;
  swift_release();
  objc_msgSend(v39, sel_fetchOcclusionResultForDeviceIdentifier_featureID_completion_, v22, 3, v26);
  _Block_release(v26);

  sub_25126C388();
  MEMORY[0x253399090](v11, 0.75);
  uint64_t v29 = *(void (**)(char *, uint64_t))(v37 + 8);
  uint64_t v30 = v40;
  v29(v11, v40);
  sub_25126C678();
  v29(v14, v30);
  if (sub_25126C358())
  {
    if (qword_269B2C6B0 != -1) {
      swift_once();
    }
    uint64_t v31 = sub_25126C0E8();
    __swift_project_value_buffer(v31, (uint64_t)qword_269B2D4E8);
    uint64_t v32 = sub_25126C0C8();
    os_log_type_t v33 = sub_25126C638();
    if (os_log_type_enabled(v32, v33))
    {
      uint64_t v34 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v34 = 0;
      _os_log_impl(&dword_251222000, v32, v33, "timeout for fetching fetchOcclusionResult: Timed Out", v34, 2u);
      MEMORY[0x253399FB0](v34, -1, -1);
    }

    uint64_t v35 = (void *)sub_25126BC48();
    swift_bridgeObjectRelease();
    v42(v35);
  }
  else
  {
    swift_bridgeObjectRelease();
  }
}

uint64_t sub_25125D780()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_25125D7B8()
{
  id v1 = objc_msgSend(*(id *)(v0 + 16), sel_navigationController);
  if (v1)
  {
    uint64_t v2 = v1;
    id v3 = objc_msgSend(v1, sel_presentingViewController);

    if (v3)
    {
      objc_msgSend(v3, sel_dismissViewControllerAnimated_completion_, 1, 0);
    }
  }
}

void sub_25125D85C(uint64_t a1)
{
  swift_beginAccess();
  id v3 = (void *)MEMORY[0x25339A050](v1 + 16);
  if (v3)
  {
    uint64_t v4 = v3;
    id v5 = objc_msgSend(v3, sel_delegate);

    if (v5)
    {
      if (objc_msgSend(v5, sel_respondsToSelector_, sel_presentViewController_)) {
        objc_msgSend(v5, sel_presentViewController_, a1);
      }
      swift_unknownObjectRelease();
    }
  }
}

void sub_25125D908()
{
  swift_beginAccess();
  uint64_t v1 = (void *)MEMORY[0x25339A050](v0 + 16);
  if (v1)
  {
    uint64_t v2 = v1;
    id v3 = objc_msgSend(v1, sel_delegate);

    if (v3)
    {
      if (objc_msgSend(v3, sel_respondsToSelector_, sel_presentViewController_))
      {
        type metadata accessor for HMHearingTestService();
        uint64_t v4 = HMHearingTestService.__allocating_init()();
        id v5 = (void *)(*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v4) + 0x58))();

        objc_msgSend(v3, sel_presentViewController_, v5);
      }
      swift_unknownObjectRelease();
    }
  }
}

const char *HMRegionStatusToString(unsigned int a1)
{
  if (a1 > 3) {
    return "?";
  }
  else {
    return off_265364498[(char)a1];
  }
}

unint64_t _sSo20HearingModeUIServiceC0aB10SettingsUIE03getA7AidLinkyS2SF_0()
{
  sub_25126BDF8();
  uint64_t v0 = (void *)sub_25126BDD8();
  sub_25123DF44();
  uint64_t v1 = sub_25126C788();
  uint64_t v3 = v2;
  uint64_t v4 = sub_25126BDC8();

  if (*(void *)(v4 + 16) && (unint64_t v5 = sub_25123BF30(v1, v3), (v6 & 1) != 0))
  {
    unint64_t v7 = 0xD000000000000034;
    id v8 = *(id *)(*(void *)(v4 + 56) + 8 * v5);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v9 = (void *)sub_25126BD68();
    if (sub_25126BFC8() == 3
      || sub_25126BF78() == 3
      || sub_25126BFA8() == 3)
    {

      return 0xD000000000000020;
    }
    else
    {
    }
  }
  else
  {
    unint64_t v7 = 0xD000000000000034;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return v7;
}

ValueMetadata *type metadata accessor for HearingModeUIService.AssociatedKeys()
{
  return &type metadata for HearingModeUIService.AssociatedKeys;
}

uint64_t sub_25125DBC0()
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();

  return MEMORY[0x270FA0238](v0, 80, 7);
}

void sub_25125DC18(int a1, void *a2)
{
  sub_251257F2C(a1, a2, *(void **)(v2 + 16), *(void *)(v2 + 24), *(void *)(v2 + 32), *(void *)(v2 + 40), *(void *)(v2 + 48), *(void *)(v2 + 56), *(void *)(v2 + 64), *(NSObject **)(v2 + 72));
}

uint64_t sub_25125DC4C()
{
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v0, 96, 7);
}

uint64_t sub_25125DCA4()
{
  int v2 = *(_DWORD *)(v0 + 32);
  uint64_t v3 = *(void *)(v0 + 40);
  uint64_t v4 = *(void *)(v0 + 48);
  uint64_t v5 = *(void *)(v0 + 56);
  uint64_t v6 = *(void *)(v0 + 64);
  unint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v7;
  void *v7 = v1;
  v7[1] = sub_25125DD84;
  return sub_25125828C((uint64_t)v7, v8, v9, v2, v3, v4, v5, v6);
}

uint64_t sub_25125DD84()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_25125DE78()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_25125DEB0(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_25125DD84;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_269B2B4A0 + dword_269B2B4A0);
  return v6(a1, v4);
}

uint64_t sub_25125DF68()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_25125DF90()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

id sub_25125DFD0()
{
  return sub_251256D50(*(void **)(v0 + 16), *(void **)(v0 + 24));
}

void type metadata accessor for HMRegionStatus(uint64_t a1)
{
}

void type metadata accessor for HMOcclusionResult(uint64_t a1)
{
}

Swift::Void __swiftcall UIView.pinToOther(_:)(UIView *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = self;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_269B2B040);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_25126E8E0;
  id v6 = objc_msgSend(v2, sel_leadingAnchor);
  unint64_t v7 = [(UIView *)a1 leadingAnchor];
  id v8 = objc_msgSend(v6, sel_constraintEqualToAnchor_, v7);

  *(void *)(v5 + 32) = v8;
  id v9 = objc_msgSend(v2, sel_trailingAnchor);
  uint64_t v10 = [(UIView *)a1 trailingAnchor];
  id v11 = objc_msgSend(v9, sel_constraintEqualToAnchor_, v10);

  *(void *)(v5 + 40) = v11;
  id v12 = objc_msgSend(v2, sel_topAnchor);
  uint64_t v13 = [(UIView *)a1 topAnchor];
  id v14 = objc_msgSend(v12, sel_constraintEqualToAnchor_, v13);

  *(void *)(v5 + 48) = v14;
  id v15 = objc_msgSend(v2, sel_bottomAnchor);
  uint64_t v16 = [(UIView *)a1 bottomAnchor];
  id v17 = objc_msgSend(v15, sel_constraintEqualToAnchor_, v16);

  *(void *)(v5 + 56) = v17;
  sub_25126C558();
  sub_25123DFF4(0, &qword_269B2AEB0);
  id v18 = (id)sub_25126C528();
  swift_bridgeObjectRelease();
  objc_msgSend(v4, sel_activateConstraints_, v18);
}

void sub_25125E284(void *a1, uint64_t a2, void *a3)
{
  uint64_t v4 = a3;
  id v5 = a1;
  UIView.pinToOther(_:)(v4);
}

unint64_t sub_25125E2F0(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B2B5D0);
  uint64_t v2 = sub_25126C908();
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
    sub_25125EBF0(v6, (uint64_t)&v13);
    uint64_t v7 = v13;
    unint64_t result = sub_25123BFA8(v13);
    if (v9) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(void *)(v3[6] + 8 * result) = v7;
    unint64_t result = (unint64_t)sub_25123DA50(&v14, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v10 = v3[2];
    BOOL v11 = __OFADD__(v10, 1);
    uint64_t v12 = v10 + 1;
    if (v11) {
      goto LABEL_11;
    }
    v3[2] = v12;
    v6 += 40;
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

void type metadata accessor for Key()
{
  if (!qword_269B2B5A8)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_269B2B5A8);
    }
  }
}

id sub_25125E464(uint64_t a1, uint64_t a2, void *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B2B520);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_25126E8C0;
  uint64_t v5 = (void *)*MEMORY[0x263F814F0];
  *(void *)(inited + 32) = *MEMORY[0x263F814F0];
  *(void *)(inited + 64) = sub_25123DFF4(0, &qword_269B2B528);
  *(void *)(inited + 40) = a3;
  swift_bridgeObjectRetain();
  id v6 = v5;
  id v7 = a3;
  sub_25125E2F0(inited);
  id v8 = objc_allocWithZone(MEMORY[0x263F086A0]);
  char v9 = (void *)sub_25126C458();
  swift_bridgeObjectRelease();
  type metadata accessor for Key();
  sub_25125EBAC((unint64_t *)&unk_269B2B530);
  uint64_t v10 = (void *)sub_25126C3B8();
  swift_bridgeObjectRelease();
  id v11 = objc_msgSend(v8, sel_initWithString_attributes_, v9, v10);

  objc_msgSend(v13, sel_appendAttributedString_, v11);
  return v13;
}

void OBWelcomeController.fitNoiseSetupCancelButton(fitDelegate:)(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_25126C0E8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4, v6);
  id v8 = (char *)v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    id v9 = objc_allocWithZone(MEMORY[0x263F824A8]);
    swift_unknownObjectRetain();
    id v10 = objc_msgSend(v9, sel_initWithBarButtonSystemItem_target_action_, 1, 0, 0);
    sub_25123DFF4(0, &qword_269B2B050);
    uint64_t v11 = swift_allocObject();
    swift_unknownObjectWeakInit();
    uint64_t v12 = swift_allocObject();
    *(void *)(v12 + 16) = v11;
    *(void *)(v12 + 24) = a1;
    swift_unknownObjectRetain();
    id v13 = (void *)sub_25126C728();
    objc_msgSend(v10, sel_setPrimaryAction_, v13);

    id v14 = objc_msgSend(v2, sel_navigationItem);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_269B2B040);
    uint64_t v15 = swift_allocObject();
    *(_OWORD *)(v15 + 16) = xmmword_25126E8F0;
    *(void *)(v15 + 32) = v10;
    v21[1] = v15;
    sub_25126C558();
    sub_25123DFF4(0, &qword_269B2B5A0);
    id v16 = v10;
    v21[0] = sub_25126C528();
    swift_bridgeObjectRelease();
    objc_msgSend(v14, sel_setRightBarButtonItems_, v21[0]);
    swift_unknownObjectRelease();

    id v17 = (void *)v21[0];
  }
  else
  {
    sub_25126C0A8();
    id v18 = sub_25126C0C8();
    os_log_type_t v19 = sub_25126C638();
    if (os_log_type_enabled(v18, v19))
    {
      uint64_t v20 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v20 = 0;
      _os_log_impl(&dword_251222000, v18, v19, "No delegate", v20, 2u);
      MEMORY[0x253399FB0](v20, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  }
}

void sub_25125E910(void *a1, uint64_t a2, uint64_t a3)
{
  swift_unknownObjectRetain();
  id v5 = a1;
  OBWelcomeController.fitNoiseSetupCancelButton(fitDelegate:)(a3);
  swift_unknownObjectRelease();
}

uint64_t sub_25125E978(uint64_t a1)
{
  uint64_t v2 = sub_25125EBAC((unint64_t *)&unk_269B2B530);
  uint64_t v3 = sub_25125EBAC(&qword_269B2B5C8);
  uint64_t v4 = MEMORY[0x263F8D320];
  return MEMORY[0x270F9F1A8](a1, v2, v3, v4);
}

uint64_t sub_25125EA10()
{
  swift_unknownObjectWeakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_25125EA48()
{
  swift_release();
  swift_unknownObjectRelease();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

void sub_25125EA88()
{
  uint64_t v1 = *(void **)(v0 + 24);
  uint64_t v2 = *(void *)(v0 + 16) + 16;
  swift_beginAccess();
  uint64_t v3 = MEMORY[0x25339A050](v2);
  if (v3)
  {
    uint64_t v4 = (void *)v3;
    if (objc_msgSend(v1, sel_respondsToSelector_, sel_fitNoiseCheckCancelled_)) {
      objc_msgSend(v1, sel_fitNoiseCheckCancelled_, v4);
    }
  }
}

uint64_t sub_25125EB10()
{
  return sub_25125EBAC(&qword_269B2B5B0);
}

uint64_t sub_25125EB44()
{
  return sub_25125EBAC(&qword_269B2B5B8);
}

uint64_t sub_25125EB78()
{
  return sub_25125EBAC(&qword_269B2B5C0);
}

uint64_t sub_25125EBAC(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for Key();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_25125EBF0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B2B5D8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void *sub_25125EC58()
{
  return &unk_2653644B8;
}

unint64_t sub_25125EC64()
{
  return 0xD000000000000010;
}

id sub_25125EC80()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_25126C0E8();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2, v4);
  uint64_t v6 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = OBJC_IVAR____TtC21HearingModeSettingsUI32HearingAidSettingsViewController__headphoneDevice;
  id v8 = *(void **)(v0 + OBJC_IVAR____TtC21HearingModeSettingsUI32HearingAidSettingsViewController__headphoneDevice);
  if (!v8 || (v9 = v8, id v10 = sub_251254C3C(), v9, !v10))
  {
    sub_25126C0B8();
    uint64_t v11 = sub_25126C0C8();
    os_log_type_t v12 = sub_25126C638();
    if (os_log_type_enabled(v11, v12))
    {
      id v13 = (uint8_t *)swift_slowAlloc();
      uint64_t v14 = swift_slowAlloc();
      uint64_t v20 = v1;
      uint64_t v15 = v14;
      uint64_t v22 = v14;
      *(_DWORD *)id v13 = 136315138;
      uint64_t v21 = sub_251240E7C(0x6E6F687064616568, 0xEF65636976654465, &v22);
      sub_25126C768();
      _os_log_impl(&dword_251222000, v11, v12, "%s: connected device !", v13, 0xCu);
      swift_arrayDestroy();
      uint64_t v16 = v15;
      uint64_t v1 = v20;
      MEMORY[0x253399FB0](v16, -1, -1);
      MEMORY[0x253399FB0](v13, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
    id v10 = *(id *)(v1 + v7);
    id v17 = v10;
  }
  return v10;
}

uint64_t sub_25125EEA4()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_25125EEF0(uint64_t a1)
{
  uint64_t v3 = (void *)(v1 + OBJC_IVAR____TtC21HearingModeSettingsUI32HearingAidSettingsViewController_listeners);
  swift_beginAccess();
  void *v3 = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_25125EF44())()
{
  return j__swift_endAccess;
}

id HearingAidSettingsViewController.__allocating_init(nibName:bundle:)(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = v3;
  if (a2)
  {
    uint64_t v6 = (void *)sub_25126C458();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v6 = 0;
  }
  id v7 = objc_msgSend(objc_allocWithZone(v4), sel_initWithNibName_bundle_, v6, a3);

  return v7;
}

id HearingAidSettingsViewController.init(nibName:bundle:)(uint64_t a1, uint64_t a2, void *a3)
{
  *(void *)&v3[OBJC_IVAR____TtC21HearingModeSettingsUI32HearingAidSettingsViewController__headphoneDevice] = 0;
  *(void *)&v3[OBJC_IVAR____TtC21HearingModeSettingsUI32HearingAidSettingsViewController__hmsClient] = 0;
  uint64_t v5 = &v3[OBJC_IVAR____TtC21HearingModeSettingsUI32HearingAidSettingsViewController_address];
  *(void *)uint64_t v5 = 0;
  *((void *)v5 + 1) = 0xE000000000000000;
  *(void *)&v3[OBJC_IVAR____TtC21HearingModeSettingsUI32HearingAidSettingsViewController_listeners] = MEMORY[0x263F8EE88];
  *(void *)&v3[OBJC_IVAR____TtC21HearingModeSettingsUI32HearingAidSettingsViewController____lazy_storage___hearingOptionsControlCenterSection] = 0;
  *(void *)&v3[OBJC_IVAR____TtC21HearingModeSettingsUI32HearingAidSettingsViewController____lazy_storage___adjustMediaAssistSection] = 0;
  if (a2)
  {
    uint64_t v6 = (void *)sub_25126C458();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v6 = 0;
  }
  v9.receiver = v3;
  v9.super_class = (Class)type metadata accessor for HearingAidSettingsViewController();
  id v7 = objc_msgSendSuper2(&v9, sel_initWithNibName_bundle_, v6, a3);

  return v7;
}

uint64_t type metadata accessor for HearingAidSettingsViewController()
{
  return self;
}

uint64_t sub_25125F1A0()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_25126C448();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2, v4);
  uint64_t v6 = &v26[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B2AE30);
  uint64_t v7 = sub_251252320();
  uint64_t v9 = v8;
  uint64_t v10 = sub_251252320();
  uint64_t v12 = sub_25125232C(v7, v9, v10, v11);
  id v27 = v0;
  uint64_t v13 = (*(uint64_t (**)(uint64_t (*)(void *), unsigned char *))(*(void *)v12 + 144))(sub_251263C5C, v26);
  swift_release();
  v29[0] = v0;
  sub_25126C3D8();
  uint64_t v14 = type metadata accessor for HearingAidSettingsViewController();
  uint64_t v15 = sub_2512547C8((uint64_t)v6);
  uint64_t v17 = v16;
  (*(void (**)(unsigned char *, uint64_t))(v3 + 8))(v6, v2);
  v28[3] = v14;
  v28[0] = v1;
  id v18 = v1;
  char v19 = sub_251243A48();
  __n128 v20 = sub_251252268(0, 0, v15, v17, (uint64_t)v28, 0, 0, 13, (uint64_t)v29, 0, v19 & 1, 0, 0, (__n128)0, 0);
  uint64_t v21 = (*(uint64_t (**)(void *, __n128))(*(void *)v13 + 152))(v29, v20);
  swift_release();
  sub_25123BACC((uint64_t)v29);
  uint64_t v22 = (*(uint64_t (**)(id (*)(void *), void))(*(void *)v21 + 176))(sub_25125F8A0, 0);
  uint64_t v23 = swift_release();
  uint64_t v24 = (*(uint64_t (**)(uint64_t))(*(void *)v22 + 184))(v23);
  swift_release();
  return v24;
}

uint64_t sub_25125F48C(void *a1, uint64_t a2)
{
  uint64_t v4 = sub_25126C448();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4, v6);
  uint64_t v8 = (char *)&v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_25126C428();
  MEMORY[0x270FA5388](v9 - 8, v10);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B2B6D0);
  MEMORY[0x270FA5388](v11 - 8, v12);
  uint64_t v14 = (char *)&v27 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_25126BB48();
  uint64_t v16 = *(void *)(v15 - 8);
  MEMORY[0x270FA5388](v15, v17);
  char v19 = (char *)&v27 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  __n128 v20 = *(void **)(a2 + OBJC_IVAR____TtC21HearingModeSettingsUI32HearingAidSettingsViewController__headphoneDevice);
  if (v20)
  {
    uint64_t v30 = a2;
    uint64_t v31 = v5;
    id v21 = v20;
    sub_25126BD48();

    sub_25126C068();
    swift_release();
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v14, 1, v15) != 1)
    {
      (*(void (**)(char *, char *, uint64_t))(v16 + 32))(v19, v14, v15);
      id v22 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08790]), sel_init);
      objc_msgSend(v22, sel_setDateStyle_, 3);
      objc_msgSend(v22, sel_setTimeStyle_, 0);
      uint64_t v23 = (void *)sub_25126BB38();
      id v24 = objc_msgSend(v22, sel_stringFromDate_, v23);

      sub_25126C488();
      uint64_t v28 = v4;
      id v29 = a1;

      uint64_t v32 = v30;
      sub_25126C418();
      sub_25126C408();
      sub_25126C3F8();
      swift_bridgeObjectRelease();
      sub_25126C408();
      sub_25126C438();
      type metadata accessor for HearingAidSettingsViewController();
      sub_251254930((uint64_t)v8);
      (*(void (**)(char *, uint64_t))(v31 + 8))(v8, v28);
      uint64_t v25 = (void *)sub_25126C458();
      swift_bridgeObjectRelease();
      objc_msgSend(v29, sel_setProperty_forKey_, v25, *MEMORY[0x263F600F8]);

      return (*(uint64_t (**)(char *, uint64_t))(v16 + 8))(v19, v15);
    }
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v16 + 56))(v14, 1, 1, v15);
  }
  return sub_25123DF98((uint64_t)v14, &qword_269B2B6D0);
}

id sub_25125F8A0(void *a1)
{
  return objc_msgSend(a1, sel_setButtonAction_, sel_useNewTestResultTapped);
}

uint64_t sub_25125F8B4()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_25126C448();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2, v4);
  uint64_t v6 = &v26[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v29[0] = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B2AE30);
  sub_25126C3D8();
  uint64_t v7 = type metadata accessor for HearingAidSettingsViewController();
  uint64_t v8 = sub_2512547C8((uint64_t)v6);
  uint64_t v10 = v9;
  uint64_t v11 = *(void (**)(unsigned char *, uint64_t))(v3 + 8);
  v11(v6, v2);
  uint64_t v12 = sub_251252320();
  uint64_t v14 = sub_25125232C(v12, v13, v8, v10);
  uint64_t v27 = v1;
  uint64_t v15 = (*(uint64_t (**)(uint64_t (*)(uint64_t), unsigned char *))(*(void *)v14 + 144))(sub_251263C64, v26);
  swift_release();
  v29[0] = v1;
  sub_25126C3D8();
  uint64_t v16 = sub_2512547C8((uint64_t)v6);
  uint64_t v18 = v17;
  v11(v6, v2);
  v28[3] = v7;
  v28[0] = v1;
  id v19 = v1;
  char v20 = sub_251243A48();
  __n128 v21 = sub_251252268(0, 0, v16, v18, (uint64_t)v28, (uint64_t)sel_mediaAssistEnabled, (uint64_t)sel_setMediaAssistWithEnabled_, 6, (uint64_t)v29, 0, v20 & 1, 0, 0, (__n128)0, 0);
  uint64_t v22 = (*(uint64_t (**)(void *, __n128))(*(void *)v15 + 152))(v29, v21);
  swift_release();
  uint64_t v23 = sub_25123BACC((uint64_t)v29);
  uint64_t v24 = (*(uint64_t (**)(uint64_t))(*(void *)v22 + 184))(v23);
  swift_release();
  return v24;
}

uint64_t sub_25125FBAC(uint64_t a1, uint64_t a2)
{
  uint64_t v16 = a1;
  uint64_t v3 = sub_25126C448();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3, v5);
  uint64_t v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = a2;
  sub_25126C3D8();
  type metadata accessor for HearingAidSettingsViewController();
  uint64_t v8 = sub_2512547C8((uint64_t)v7);
  unint64_t v10 = v9;
  uint64_t v11 = *(void (**)(char *, uint64_t))(v4 + 8);
  v11(v7, v3);
  uint64_t v17 = a2;
  sub_25126C3D8();
  uint64_t v12 = sub_2512547C8((uint64_t)v7);
  unint64_t v14 = v13;
  v11(v7, v3);
  sub_251252D94(v12, v14, v8, v10, a2, (uint64_t)sel_openMediaAssistFooterLink);
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25125FD64()
{
  return sub_251260260(&OBJC_IVAR____TtC21HearingModeSettingsUI32HearingAidSettingsViewController____lazy_storage___hearingOptionsControlCenterSection, (uint64_t (*)(uint64_t))sub_25125FD84);
}

uint64_t sub_25125FD84(void *a1)
{
  uint64_t v2 = sub_25126C448();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2, v4);
  uint64_t v6 = &v26[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B2AE30);
  uint64_t v7 = sub_251252320();
  uint64_t v9 = v8;
  uint64_t v10 = sub_251252320();
  uint64_t v12 = sub_25125232C(v7, v9, v10, v11);
  uint64_t v27 = a1;
  uint64_t v13 = (*(uint64_t (**)(void (*)(void *), unsigned char *))(*(void *)v12 + 144))(sub_251264BA8, v26);
  swift_release();
  v29[0] = a1;
  sub_25126C3D8();
  uint64_t v14 = type metadata accessor for HearingAidSettingsViewController();
  uint64_t v15 = sub_2512547C8((uint64_t)v6);
  uint64_t v17 = v16;
  (*(void (**)(unsigned char *, uint64_t))(v3 + 8))(v6, v2);
  v28[3] = v14;
  v28[0] = a1;
  id v18 = a1;
  char v19 = sub_251243A48();
  __n128 v20 = sub_251252268(0, 0, v15, v17, (uint64_t)v28, 0, 0, 13, (uint64_t)v29, 0, v19 & 1, 0, 0, (__n128)0, 0);
  uint64_t v21 = (*(uint64_t (**)(void *, __n128))(*(void *)v13 + 152))(v29, v20);
  swift_release();
  sub_25123BACC((uint64_t)v29);
  uint64_t v22 = (*(uint64_t (**)(id (*)(void *), void))(*(void *)v21 + 176))(sub_2512601C0, 0);
  uint64_t v23 = swift_release();
  uint64_t v24 = (*(uint64_t (**)(uint64_t))(*(void *)v22 + 184))(v23);
  swift_release();
  return v24;
}

void sub_251260070(void *a1, uint64_t a2)
{
  uint64_t v4 = sub_25126C448();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4, v6);
  uint64_t v8 = (char *)v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10[1] = a2;
  sub_25126C3D8();
  type metadata accessor for HearingAidSettingsViewController();
  sub_2512547C8((uint64_t)v8);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  uint64_t v9 = (void *)sub_25126C458();
  swift_bridgeObjectRelease();
  objc_msgSend(a1, sel_setProperty_forKey_, v9, *MEMORY[0x263F600F8]);
}

id sub_2512601C0(void *a1)
{
  return objc_msgSend(a1, sel_setButtonAction_, sel_hearingOptionsInControllcenterTapped);
}

uint64_t sub_2512601D4(uint64_t a1)
{
  *(void *)(v1
            + OBJC_IVAR____TtC21HearingModeSettingsUI32HearingAidSettingsViewController____lazy_storage___hearingOptionsControlCenterSection) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_2512601EC(uint64_t *a1))(void *a1, uint64_t a2)
{
  a1[1] = v1;
  *a1 = sub_25125FD64();
  return sub_251260234;
}

uint64_t sub_251260234(void *a1, uint64_t a2)
{
  return sub_251239114(a1, a2, &OBJC_IVAR____TtC21HearingModeSettingsUI32HearingAidSettingsViewController____lazy_storage___hearingOptionsControlCenterSection);
}

uint64_t sub_251260240()
{
  return sub_251260260(&OBJC_IVAR____TtC21HearingModeSettingsUI32HearingAidSettingsViewController____lazy_storage___adjustMediaAssistSection, (uint64_t (*)(uint64_t))sub_2512602C8);
}

uint64_t sub_251260260(uint64_t *a1, uint64_t (*a2)(uint64_t))
{
  uint64_t v3 = *a1;
  uint64_t v4 = *(void *)(v2 + *a1);
  if (v4)
  {
    uint64_t v5 = v4;
  }
  else
  {
    uint64_t v5 = a2(v2);
    *(void *)(v2 + v3) = v5;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  return v5;
}

uint64_t sub_2512602C8(void *a1)
{
  uint64_t v2 = sub_25126C448();
  uint64_t v30 = v2;
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2, v4);
  uint64_t v6 = (char *)&v28 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B2AE30);
  uint64_t v7 = sub_251252320();
  uint64_t v9 = sub_25125232C(0xD000000000000018, 0x8000000251276820, v7, v8);
  v33[0] = a1;
  sub_25126C3D8();
  uint64_t v10 = type metadata accessor for HearingAidSettingsViewController();
  uint64_t v11 = sub_2512547C8((uint64_t)v6);
  uint64_t v13 = v12;
  id v29 = *(void (**)(char *, uint64_t))(v3 + 8);
  v29(v6, v2);
  uint64_t v32 = v10;
  v31[0] = a1;
  id v14 = a1;
  char v15 = sub_251243A48();
  __n128 v16 = sub_251252268(0, 0, v11, v13, (uint64_t)v31, (uint64_t)sel_getPMEMedia_, (uint64_t)sel_setPMEMediaWithEnabled_, 6, (uint64_t)v33, 0, v15 & 1, 0, 0, (__n128)0, 0);
  uint64_t v17 = (*(uint64_t (**)(void *, __n128))(*(void *)v9 + 152))(v33, v16);
  swift_release();
  sub_25123BACC((uint64_t)v33);
  v33[0] = v14;
  sub_25126C3D8();
  uint64_t v18 = sub_2512547C8((uint64_t)v6);
  uint64_t v20 = v19;
  v29(v6, v30);
  uint64_t v32 = v10;
  v31[0] = v14;
  id v21 = v14;
  char v22 = sub_251243A48();
  __n128 v23 = sub_251252268(0, 0, v18, v20, (uint64_t)v31, (uint64_t)sel_getPMEVoice_, (uint64_t)sel_setPMEVoiceWithEnabled_, 6, (uint64_t)v33, 0, v22 & 1, 0, 0, (__n128)0, 0);
  uint64_t v24 = (*(uint64_t (**)(void *, __n128))(*(void *)v17 + 152))(v33, v23);
  swift_release();
  uint64_t v25 = sub_25123BACC((uint64_t)v33);
  uint64_t v26 = (*(uint64_t (**)(uint64_t))(*(void *)v24 + 184))(v25);
  swift_release();
  return v26;
}

uint64_t sub_25126064C(uint64_t a1)
{
  *(void *)(v1
            + OBJC_IVAR____TtC21HearingModeSettingsUI32HearingAidSettingsViewController____lazy_storage___adjustMediaAssistSection) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_251260664(uint64_t *a1))(void *a1, uint64_t a2)
{
  a1[1] = v1;
  *a1 = sub_251260240();
  return sub_2512606AC;
}

uint64_t sub_2512606AC(void *a1, uint64_t a2)
{
  return sub_251239114(a1, a2, &OBJC_IVAR____TtC21HearingModeSettingsUI32HearingAidSettingsViewController____lazy_storage___adjustMediaAssistSection);
}

id sub_2512606B8()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_25126C448();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2, v4);
  uint64_t v6 = (char *)v56 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v66[0] = v0;
  sub_25126C3D8();
  uint64_t v7 = type metadata accessor for HearingAidSettingsViewController();
  uint64_t v8 = sub_251254930((uint64_t)v6);
  uint64_t v59 = v9;
  uint64_t v60 = v8;
  uint64_t v10 = *(void (**)(char *, uint64_t))(v3 + 8);
  v10(v6, v2);
  v66[0] = v0;
  sub_25126C3D8();
  uint64_t v58 = sub_2512547C8((uint64_t)v6);
  uint64_t v12 = v11;
  v10(v6, v2);
  v66[0] = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B2AE30);
  sub_25126C3D8();
  uint64_t v62 = v7;
  uint64_t v13 = sub_2512547C8((uint64_t)v6);
  uint64_t v15 = v14;
  v56[1] = v3 + 8;
  uint64_t v57 = v2;
  uint64_t v61 = v10;
  v10(v6, v2);
  __n128 v16 = v1;
  uint64_t v17 = sub_251252320();
  uint64_t v19 = sub_25125232C(v17, v18, v13, v15);
  v63[2] = v58;
  v63[3] = v12;
  v63[4] = v60;
  v63[5] = v59;
  v63[6] = v1;
  uint64_t v20 = (*(uint64_t (**)(void (*)(), void *))(*(void *)v19 + 144))(sub_251263C6C, v63);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  id result = sub_25125EC80();
  if (result)
  {
    char v22 = result;
    __n128 v23 = (void *)sub_25126BD68();

    LODWORD(v22) = sub_25126BF08();
    if (!v22)
    {
      v66[0] = v16;
      sub_25126C3D8();
      uint64_t v45 = v62;
      uint64_t v46 = sub_2512547C8((uint64_t)v6);
      uint64_t v48 = v47;
      v61(v6, v57);
      *((void *)&v65 + 1) = v45;
      *(void *)&long long v64 = v16;
      uint64_t v49 = swift_allocObject();
      swift_unknownObjectWeakInit();
      id v50 = v16;
      swift_retain();
      char v51 = sub_251243A48();
      v55.n128_u64[1] = (unint64_t)sub_251263F24;
      v55.n128_u64[0] = 0;
      sub_251252268(0, 0, v46, v48, (uint64_t)&v64, 0, 0, 13, (uint64_t)v66, 0, v51 & 1, 0, 0, v55, v49);
      swift_release();
      uint64_t v52 = (*(uint64_t (**)(void *))(*(void *)v20 + 168))(v66);
      uint64_t v53 = sub_25123BACC((uint64_t)v66);
      uint64_t v44 = (*(uint64_t (**)(uint64_t))(*(void *)v52 + 184))(v53);
      swift_release();
LABEL_8:
      swift_release();
      return (id)v44;
    }
    v66[0] = v16;
    sub_25126C3D8();
    uint64_t v24 = sub_2512547C8((uint64_t)v6);
    uint64_t v26 = v25;
    uint64_t v27 = v57;
    v61(v6, v57);
    long long v64 = 0u;
    long long v65 = 0u;
    uint64_t v28 = swift_allocObject();
    swift_unknownObjectWeakInit();
    uint64_t v29 = swift_allocObject();
    swift_unknownObjectWeakInit();
    swift_retain();
    swift_retain();
    char v30 = sub_251243A48();
    *(void *)&v54[24] = sub_251263D8C;
    *(void *)&v54[8] = sub_251263CE0;
    *(void *)&v54[16] = v28;
    *(void *)uint64_t v54 = 0;
    sub_251252268(0, 0, v24, v26, (uint64_t)&v64, 0, 0, 6, (uint64_t)v66, 0, v30 & 1, *(long long *)v54, *(long long *)&v54[16], (__n128)(unint64_t)v29, 0);
    swift_release();
    swift_release();
    (*(void (**)(void *))(*(void *)v20 + 168))(v66);
    swift_release();
    sub_25123BACC((uint64_t)v66);
    id result = sub_25125EC80();
    if (result)
    {
      uint64_t v31 = result;
      uint64_t v32 = (void *)sub_25126BD68();

      LODWORD(v31) = sub_25126BF08();
      if (v31 == 1)
      {
        v66[0] = v16;
        sub_25126C3D8();
        uint64_t v34 = v62;
        uint64_t v35 = sub_2512547C8((uint64_t)v6);
        uint64_t v37 = v36;
        v61(v6, v27);
        *((void *)&v65 + 1) = v34;
        *(void *)&long long v64 = v16;
        uint64_t v38 = type metadata accessor for HearingAidTuningVoiceEntertainmentController();
        v16;
        char v39 = sub_251243A48();
        memset(&v54[8], 0, 24);
        *(void *)uint64_t v54 = v38;
        __n128 v40 = sub_251252268(0, 0, v35, v37, (uint64_t)&v64, 0, 0, 2, (uint64_t)v66, 0, v39 & 1, *(long long *)v54, *(long long *)&v54[16], (__n128)0, 0);
        uint64_t v41 = (*(uint64_t (**)(void *, __n128))(*(void *)v20 + 152))(v66, v40);
        uint64_t v42 = sub_25123BACC((uint64_t)v66);
        MEMORY[0x270FA5388](v42, v43);
        (*(void (**)(void))(*(void *)v41 + 176))(sub_251263E48);
        swift_release();
        uint64_t v33 = swift_release();
      }
      uint64_t v44 = (*(uint64_t (**)(uint64_t))(*(void *)v20 + 184))(v33);
      goto LABEL_8;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

unint64_t sub_251260E84(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B2B6C8);
  uint64_t v2 = (void *)sub_25126C908();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (id *)(a1 + 48);
  while (1)
  {
    uint64_t v5 = (uint64_t)*(v4 - 2);
    uint64_t v6 = (uint64_t)*(v4 - 1);
    id v7 = *v4;
    id v8 = *v4;
    swift_bridgeObjectRetain();
    unint64_t result = sub_25123BF30(v5, v6);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v2[6] + 16 * result);
    uint64_t *v11 = v5;
    v11[1] = v6;
    *(void *)(v2[7] + 8 * result) = v7;
    uint64_t v12 = v2[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v4 += 3;
    v2[2] = v14;
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

unint64_t sub_251260F9C(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B2B6B8);
  uint64_t v2 = (void *)sub_25126C908();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (unsigned char *)(a1 + 48);
  while (1)
  {
    uint64_t v5 = *((void *)v4 - 2);
    uint64_t v6 = *((void *)v4 - 1);
    char v7 = *v4;
    swift_bridgeObjectRetain();
    unint64_t result = sub_25123BF30(v5, v6);
    if (v9) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    char v10 = (uint64_t *)(v2[6] + 16 * result);
    *char v10 = v5;
    v10[1] = v6;
    *(unsigned char *)(v2[7] + result) = v7;
    uint64_t v11 = v2[2];
    BOOL v12 = __OFADD__(v11, 1);
    uint64_t v13 = v11 + 1;
    if (v12) {
      goto LABEL_11;
    }
    v4 += 24;
    v2[2] = v13;
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

id sub_2512610B0()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_25126C448();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2, v4);
  uint64_t v6 = (char *)&v39[-1] - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  id result = sub_25125EC80();
  if (result)
  {
    id v8 = result;
    char v9 = (void *)sub_25126BD68();

    LODWORD(v8) = sub_25126BF08();
    if (!v8) {
      return (id)MEMORY[0x263F8EE78];
    }
    id result = sub_25125EC80();
    if (result)
    {
      char v10 = result;
      uint64_t v11 = (void *)sub_25126BD58();

      id v12 = objc_msgSend(v11, sel_firmwareVersion);
      if (v12)
      {
        uint64_t v38 = sub_25126C488();
        unint64_t v14 = v13;
      }
      else
      {
        uint64_t v38 = 0;
        unint64_t v14 = 0xE000000000000000;
      }
      __swift_instantiateConcreteTypeFromMangledName(&qword_269B2AE30);
      uint64_t v16 = sub_251252320();
      uint64_t v18 = v17;
      uint64_t v19 = sub_251252320();
      uint64_t v21 = sub_25125232C(v16, v18, v19, v20);
      v40[0] = v1;
      sub_25126C3D8();
      uint64_t v22 = type metadata accessor for HearingAidSettingsViewController();
      uint64_t v23 = sub_2512547C8((uint64_t)v6);
      uint64_t v25 = v24;
      (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
      v39[3] = v22;
      v39[0] = v1;
      uint64_t v26 = sub_25123DFF4(0, &qword_269B2B610);
      id v27 = v1;
      char v28 = sub_251243A48();
      memset(&v35[8], 0, 32);
      *(void *)uint64_t v35 = v26;
      __n128 v29 = sub_251252268(0, 0, v23, v25, (uint64_t)v39, 0, 0, 2, (uint64_t)v40, 0, v28 & 1, *(long long *)v35, *(long long *)&v35[16], (__n128)*(unint64_t *)&v35[32], 0);
      uint64_t v30 = (*(uint64_t (**)(void *, __n128))(*(void *)v21 + 152))(v40, v29);
      swift_release();
      uint64_t v31 = sub_25123BACC((uint64_t)v40);
      MEMORY[0x270FA5388](v31, v32);
      *((void *)&v36 + 1) = v38;
      unint64_t v37 = v14;
      uint64_t v33 = (*(uint64_t (**)(void))(*(void *)v30 + 176))(sub_251264030);
      swift_bridgeObjectRelease();
      uint64_t v34 = swift_release();
      uint64_t v15 = (*(uint64_t (**)(uint64_t))(*(void *)v33 + 184))(v34);
      swift_release();
      return (id)v15;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

void sub_25126144C()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_25126C0E8();
  uint64_t v3 = *(void (***)(char *, uint64_t))(v2 - 8);
  MEMORY[0x270FA5388](v2, v4);
  uint64_t v6 = (char *)&v101 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_25126C6B8();
  v127 = *(char **)(v7 - 8);
  uint64_t v128 = v7;
  MEMORY[0x270FA5388](v7, v8);
  v126 = (char *)&v101 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B2ADF0);
  MEMORY[0x270FA5388](v10 - 8, v11);
  v125 = (char *)&v101 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v119 = (void (*)(char *, uint64_t, uint64_t, uint64_t))__swift_instantiateConcreteTypeFromMangledName(&qword_269B2B618);
  MEMORY[0x270FA5388](v119, v13);
  uint64_t v118 = (char *)&v101 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v117 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B2B620);
  uint64_t v16 = MEMORY[0x270FA5388](v117, v15);
  uint64_t v116 = (char *)&v101 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = MEMORY[0x270FA5388](v16, v18);
  uint64_t v21 = MEMORY[0x270FA5388](v19, v20);
  MEMORY[0x270FA5388](v21, v22);
  uint64_t v111 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B2B628);
  MEMORY[0x270FA5388](v111, v23);
  id v108 = (char *)&v101 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v114 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B2B630);
  uint64_t v112 = *(void *)(v114 - 8);
  MEMORY[0x270FA5388](v114, v25);
  uint64_t v109 = (char *)&v101 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v115 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B2B638);
  uint64_t v113 = *(void *)(v115 - 8);
  MEMORY[0x270FA5388](v115, v27);
  unint64_t v110 = (char *)&v101 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v121 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B2B640);
  uint64_t v120 = *(void *)(v121 - 8);
  MEMORY[0x270FA5388](v121, v29);
  uint64_t v31 = (char *)&v101 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B2B648);
  uint64_t v123 = *(void *)(v32 - 8);
  uint64_t v124 = v32;
  MEMORY[0x270FA5388](v32, v33);
  v122 = (char *)&v101 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v35 = objc_msgSend(v0, sel_specifier);
  if (!v35)
  {
    __break(1u);
    goto LABEL_36;
  }
  long long v36 = v35;
  id v37 = objc_msgSend(v35, sel_userInfo);

  if (v37)
  {
    sub_25126C7A8();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v132 = 0u;
    long long v133 = 0u;
  }
  sub_25123D3B8((uint64_t)&v132, (uint64_t)v134);
  if (!v135) {
    goto LABEL_28;
  }
  sub_25123DFF4(0, &qword_269B2AEA0);
  if ((swift_dynamicCast() & 1) == 0) {
    goto LABEL_29;
  }
  uint64_t v106 = v1;
  uint64_t v38 = (void *)v130;
  char v39 = (void *)sub_25126C458();
  id v107 = v38;
  id v40 = objc_msgSend(v38, sel_objectForKey_, v39);

  if (v40)
  {
    sub_25126C7A8();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v132 = 0u;
    long long v133 = 0u;
  }
  sub_25123D3B8((uint64_t)&v132, (uint64_t)v134);
  if (!v135)
  {

LABEL_28:
    sub_25123DF98((uint64_t)v134, &qword_269B2AE90);
    goto LABEL_29;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {

    goto LABEL_29;
  }
  id v104 = (id)v130;
  id v105 = v131;
  uint64_t v41 = (void *)sub_25126C458();
  id v42 = objc_msgSend(v107, sel_objectForKey_, v41);

  if (v42)
  {
    sub_25126C7A8();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v132 = 0u;
    long long v133 = 0u;
  }
  sub_25123D3B8((uint64_t)&v132, (uint64_t)v134);
  if (!v135)
  {

    swift_bridgeObjectRelease();
    goto LABEL_28;
  }
  sub_25123DFF4(0, &qword_269B2B650);
  if (swift_dynamicCast())
  {
    id v103 = (id)v130;
    sub_25126BDF8();
    uint64_t v43 = (void *)sub_25126BDD8();
    v134[0] = v104;
    v134[1] = v105;
    *(void *)&long long v132 = 58;
    *((void *)&v132 + 1) = 0xE100000000000000;
    uint64_t v130 = 45;
    v131 = (void *)0xE100000000000000;
    sub_25123DF44();
    uint64_t v102 = sub_25126C788();
    uint64_t v45 = v44;
    uint64_t v46 = sub_25126BDC8();

    if (*(void *)(v46 + 16))
    {
      unint64_t v47 = sub_25123BF30(v102, v45);
      if (v48)
      {
        uint64_t v49 = v31;
        id v50 = *(id *)(*(void *)(v46 + 56) + 8 * v47);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        char v51 = v106;
        uint64_t v52 = *(void **)((char *)v106
                       + OBJC_IVAR____TtC21HearingModeSettingsUI32HearingAidSettingsViewController__hmsClient);
        id v53 = v103;
        *(void *)((char *)v106 + OBJC_IVAR____TtC21HearingModeSettingsUI32HearingAidSettingsViewController__hmsClient) = v103;
        id v54 = v53;
        __n128 v55 = v51;
        id v56 = v54;

        uint64_t v57 = *(void **)((char *)v55
                       + OBJC_IVAR____TtC21HearingModeSettingsUI32HearingAidSettingsViewController__headphoneDevice);
        *(void *)((char *)v55
                  + OBJC_IVAR____TtC21HearingModeSettingsUI32HearingAidSettingsViewController__headphoneDevice) = v50;
        id v58 = v50;

        uint64_t v59 = (void *)((char *)v55 + OBJC_IVAR____TtC21HearingModeSettingsUI32HearingAidSettingsViewController_address);
        id v60 = v105;
        void *v59 = v104;
        v59[1] = v60;
        swift_bridgeObjectRelease();
        id v61 = sub_25125EC80();
        if (v61)
        {
          uint64_t v62 = v61;
          uint64_t v63 = (void *)sub_25126BD68();

          sub_25126BF58();
          id v64 = sub_25125EC80();
          if (v64)
          {
            long long v65 = v64;
            id v105 = v58;
            uint64_t v66 = (void *)sub_25126BD68();

            sub_25126BE78();
            id v67 = sub_25125EC80();
            if (v67)
            {
              uint64_t v68 = v67;
              uint64_t v69 = (void *)sub_25126BD68();

              sub_25126BE88();
              sub_25123E030(&qword_269B2B658, &qword_269B2B620);
              sub_25126C1F8();
              id v70 = sub_25125EC80();
              if (v70)
              {
                unint64_t v71 = v70;
                id v104 = v56;
                uint64_t v72 = (void *)sub_25126BD68();

                sub_25126BF28();
                id v73 = sub_25125EC80();
                if (v73)
                {
                  uint64_t v74 = v73;
                  sub_25126BD48();

                  sub_25126C078();
                  swift_release();
                  sub_25123E030(&qword_269B2B660, &qword_269B2B628);
                  sub_25123E030(&qword_269B2B668, &qword_269B2B618);
                  uint64_t v75 = v109;
                  sub_25126C1F8();
                  sub_25123E030(&qword_269B2B670, &qword_269B2B630);
                  uint64_t v76 = v110;
                  uint64_t v77 = v114;
                  sub_25126C318();
                  (*(void (**)(char *, uint64_t))(v112 + 8))(v75, v77);
                  sub_25123E030(&qword_269B2B678, &qword_269B2B638);
                  uint64_t v78 = v115;
                  char v79 = (void *)sub_25126C2D8();
                  (*(void (**)(char *, uint64_t))(v113 + 8))(v76, v78);
                  v134[0] = v79;
                  sub_25123DFF4(0, &qword_269B2AE18);
                  *(void *)&long long v132 = sub_25126C6D8();
                  uint64_t v80 = sub_25126C698();
                  unint64_t v119 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v80 - 8) + 56);
                  uint64_t v81 = (uint64_t)v125;
                  v119(v125, 1, 1, v80);
                  __swift_instantiateConcreteTypeFromMangledName(&qword_269B2B680);
                  sub_25123E030(&qword_269B2B688, &qword_269B2B680);
                  sub_25123B87C();
                  sub_25126C2F8();
                  sub_25123DF98(v81, &qword_269B2ADF0);

                  swift_release();
                  unint64_t v82 = v126;
                  sub_25126C6A8();
                  v134[0] = (id)sub_25126C6D8();
                  v119((char *)v81, 1, 1, v80);
                  sub_25123E030(&qword_269B2B690, &qword_269B2B640);
                  uint64_t v83 = v121;
                  id v84 = v122;
                  sub_25126C308();
                  sub_25123DF98(v81, &qword_269B2ADF0);

                  (*((void (**)(char *, uint64_t))v127 + 1))(v82, v128);
                  (*(void (**)(char *, uint64_t))(v120 + 8))(v49, v83);
                  swift_allocObject();
                  swift_unknownObjectWeakInit();
                  sub_25123E030(&qword_269B2B698, &qword_269B2B648);
                  uint64_t v85 = v124;
                  sub_25126C338();
                  swift_release();
                  (*(void (**)(char *, uint64_t))(v123 + 8))(v84, v85);
                  v86 = (void (*)(id *, void))(*(uint64_t (**)(id *))((*MEMORY[0x263F8EED0] & *v55)
                                                                                           + 0xE0))(v134);
                  sub_25126C228();
                  swift_release();
                  v86(v134, 0);
                  unint64_t v87 = (objc_class *)type metadata accessor for HearingAidSettingsViewController();
                  v129.receiver = v55;
                  v129.super_class = v87;
                  objc_msgSendSuper2(&v129, sel_viewDidLoad);

                  return;
                }
                goto LABEL_40;
              }
LABEL_39:
              __break(1u);
LABEL_40:
              __break(1u);
              return;
            }
LABEL_38:
            __break(1u);
            goto LABEL_39;
          }
LABEL_37:
          __break(1u);
          goto LABEL_38;
        }
LABEL_36:
        __break(1u);
        goto LABEL_37;
      }
    }

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {

    swift_bridgeObjectRelease();
  }
LABEL_29:
  uint64_t v88 = sub_251247964();
  uint64_t v89 = v3;
  BOOL v90 = v6;
  ((void (*)(char *, uint64_t, uint64_t))v3[2])(v6, v88, v2);
  id v91 = sub_25126C0C8();
  os_log_type_t v92 = sub_25126C638();
  if (os_log_type_enabled(v91, v92))
  {
    uint64_t v93 = swift_slowAlloc();
    uint64_t v128 = v2;
    uint64_t v94 = v93;
    uint64_t v95 = (void *)swift_slowAlloc();
    v126 = (char *)v89;
    v127 = v90;
    uint64_t v96 = v95;
    v134[0] = v95;
    *(_DWORD *)uint64_t v94 = 136315650;
    *(void *)&long long v132 = sub_251240E7C(0x4C64694477656976, 0xED0000292864616FLL, (uint64_t *)v134);
    sub_25126C768();
    *(_WORD *)(v94 + 12) = 2048;
    *(void *)&long long v132 = 191;
    sub_25126C768();
    *(_WORD *)(v94 + 22) = 2080;
    sub_25126BDF8();
    uint64_t v97 = (void *)sub_25126BDD8();
    sub_25126BDC8();

    sub_25126BDB8();
    uint64_t v98 = sub_25126C3C8();
    unint64_t v100 = v99;
    swift_bridgeObjectRelease();
    *(void *)&long long v132 = sub_251240E7C(v98, v100, (uint64_t *)v134);
    sub_25126C768();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_251222000, v91, v92, "%s: %ld Dependencies not meet! %s", (uint8_t *)v94, 0x20u);
    swift_arrayDestroy();
    MEMORY[0x253399FB0](v96, -1, -1);
    MEMORY[0x253399FB0](v94, -1, -1);

    (*((void (**)(char *, uint64_t))v126 + 1))(v127, v128);
  }
  else
  {

    v89[1](v90, v2);
  }
}

uint64_t sub_25126260C()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_25126C0E8();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v2, v4);
  uint64_t v7 = (char *)&v36 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5, v8);
  uint64_t v10 = (char *)&v36 - v9;
  id v11 = sub_25125EC80();

  if (v11)
  {
    uint64_t v12 = sub_251247964();
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v10, v12, v2);
    uint64_t v13 = sub_25126C0C8();
    os_log_type_t v14 = sub_25126C648();
    if (os_log_type_enabled(v13, v14))
    {
      uint64_t v15 = swift_slowAlloc();
      uint64_t v16 = swift_slowAlloc();
      unint64_t v38 = v16;
      *(_DWORD *)uint64_t v15 = 136315394;
      uint64_t v37 = sub_251240E7C(0x6569666963657073, 0xEC00000029287372, (uint64_t *)&v38);
      sub_25126C768();
      *(_WORD *)(v15 + 12) = 2048;
      uint64_t v37 = 230;
      sub_25126C768();
      _os_log_impl(&dword_251222000, v13, v14, "%s: %ld Updated UI", (uint8_t *)v15, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x253399FB0](v16, -1, -1);
      MEMORY[0x253399FB0](v15, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v3 + 8))(v10, v2);
    __swift_instantiateConcreteTypeFromMangledName(&qword_269B2B6A0);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_25126FA30;
    uint64_t v18 = (void *)MEMORY[0x263F8EED0];
    *(void *)(inited + 32) = (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v1) + 0x128))();
    *(void *)(inited + 40) = (*(uint64_t (**)(void))((*v18 & *v1) + 0xF0))();
    *(void *)(inited + 48) = (*(uint64_t (**)(void))((*v18 & *v1) + 0x110))();
    *(void *)(inited + 56) = (*(uint64_t (**)(void))((*v18 & *v1) + 0xE8))();
    *(void *)(inited + 64) = (*(uint64_t (**)(void))((*v18 & *v1) + 0x130))();
    uint64_t v19 = v1;
    uint64_t v20 = sub_2512640F8(inited);

    unint64_t v38 = MEMORY[0x263F8EE78];
    uint64_t v21 = *(void *)(v20 + 16);
    if (v21)
    {
      swift_bridgeObjectRetain();
      for (uint64_t i = 0; i != v21; ++i)
      {
        unint64_t v23 = swift_bridgeObjectRetain();
        sub_25124A838(v23);
      }
      swift_bridgeObjectRelease_n();
      unint64_t v24 = v38;
    }
    else
    {
      swift_bridgeObjectRelease();
      unint64_t v24 = MEMORY[0x263F8EE78];
    }
    sub_25123DFF4(0, &qword_269B2AE98);
    uint64_t v33 = (void *)sub_25126C528();
    uint64_t v34 = (void *)sub_25126C458();
    objc_msgSend(v19, sel_setValue_forKey_, v33, v34);

    uint64_t v32 = sub_2512399F4(v24);
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_25123DFF4(0, &qword_269B2AE98);
    uint64_t v25 = (void *)sub_25126C528();
    uint64_t v26 = (void *)sub_25126C458();
    objc_msgSend(v1, sel_setValue_forKey_, v25, v26);

    uint64_t v27 = sub_251247964();
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v7, v27, v2);
    uint64_t v28 = sub_25126C0C8();
    os_log_type_t v29 = sub_25126C638();
    if (os_log_type_enabled(v28, v29))
    {
      uint64_t v30 = swift_slowAlloc();
      uint64_t v31 = swift_slowAlloc();
      unint64_t v38 = v31;
      *(_DWORD *)uint64_t v30 = 136315394;
      uint64_t v37 = sub_251240E7C(0x6569666963657073, 0xEC00000029287372, (uint64_t *)&v38);
      sub_25126C768();
      *(_WORD *)(v30 + 12) = 2048;
      uint64_t v37 = 226;
      sub_25126C768();
      _os_log_impl(&dword_251222000, v28, v29, "%s: %ld Dependencies not meet, bailing out of specifiers returning empty conroller!", (uint8_t *)v30, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x253399FB0](v31, -1, -1);
      MEMORY[0x253399FB0](v30, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v3 + 8))(v7, v2);
    return 0;
  }
  return v32;
}

id sub_251262D00(char a1)
{
  v4.receiver = v1;
  v4.super_class = (Class)type metadata accessor for HearingAidSettingsViewController();
  objc_msgSendSuper2(&v4, sel_viewWillAppear_, a1 & 1);
  return objc_msgSend(v1, sel_reloadSpecifiers);
}

id sub_251262DC4()
{
  id result = sub_25125EC80();
  if (result)
  {
    uint64_t v1 = result;
    sub_25123DFF4(0, &qword_269B2B400);
    uint64_t v2 = (void *)sub_25126BD68();

    sub_25126BF48();
    return (id)sub_25126C708();
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_251262EE4(void *a1)
{
}

uint64_t sub_251262F14()
{
  return sub_2512643B0("openHearingAssistFooterLink tapped");
}

uint64_t sub_251262F54()
{
  return sub_2512643B0("openMediaAssistFooterLink tapped");
}

void sub_251262F94()
{
  uint64_t v1 = v0;
  id v2 = sub_25125EC80();
  if (!v2)
  {
    __break(1u);
    goto LABEL_9;
  }
  uint64_t v3 = *(void **)&v0[OBJC_IVAR____TtC21HearingModeSettingsUI32HearingAidSettingsViewController__hmsClient];
  if (!v3)
  {
LABEL_9:
    __break(1u);
    return;
  }
  uint64_t v4 = (uint64_t)v2;
  type metadata accessor for HearingAssistFlowController();
  uint64_t v8 = HearingAssistFlowController.__allocating_init(withDevice:serviceClient:flow:)(v4, (uint64_t)v3, 1);
  id v5 = objc_msgSend(v1, sel_navigationController);
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = (void *)(*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v8) + 0x88))();
    objc_msgSend(v6, sel_presentViewController_animated_completion_, v7, 1, 0);
  }
}

unint64_t sub_2512630F4(uint64_t a1)
{
  uint64_t v1 = a1;
  if (*(void *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_269B2AF70);
    id v2 = (void *)sub_25126C908();
  }
  else
  {
    id v2 = (void *)MEMORY[0x263F8EE80];
  }
  uint64_t v32 = v1 + 64;
  uint64_t v3 = -1 << *(unsigned char *)(v1 + 32);
  if (-v3 < 64) {
    uint64_t v4 = ~(-1 << -(char)v3);
  }
  else {
    uint64_t v4 = -1;
  }
  unint64_t v5 = v4 & *(void *)(v1 + 64);
  int64_t v31 = (unint64_t)(63 - v3) >> 6;
  uint64_t v6 = &v37;
  uint64_t v7 = &v39;
  unint64_t result = swift_bridgeObjectRetain();
  int64_t i = 0;
  uint64_t v10 = MEMORY[0x263F8EE58] + 8;
  uint64_t v11 = MEMORY[0x263F8D4F8];
  if (v5) {
    goto LABEL_10;
  }
LABEL_11:
  int64_t v20 = i + 1;
  if (__OFADD__(i, 1)) {
    goto LABEL_35;
  }
  if (v20 >= v31) {
    goto LABEL_32;
  }
  unint64_t v21 = *(void *)(v32 + 8 * v20);
  int64_t v22 = i + 1;
  if (!v21)
  {
    int64_t v22 = i + 2;
    if (i + 2 >= v31) {
      goto LABEL_32;
    }
    unint64_t v21 = *(void *)(v32 + 8 * v22);
    if (!v21)
    {
      int64_t v22 = i + 3;
      if (i + 3 >= v31) {
        goto LABEL_32;
      }
      unint64_t v21 = *(void *)(v32 + 8 * v22);
      if (!v21)
      {
        int64_t v22 = i + 4;
        if (i + 4 >= v31) {
          goto LABEL_32;
        }
        unint64_t v21 = *(void *)(v32 + 8 * v22);
        if (!v21)
        {
          int64_t v23 = i + 5;
          if (i + 5 < v31)
          {
            unint64_t v21 = *(void *)(v32 + 8 * v23);
            if (v21)
            {
              int64_t v22 = i + 5;
              goto LABEL_26;
            }
            while (1)
            {
              int64_t v22 = v23 + 1;
              if (__OFADD__(v23, 1)) {
                goto LABEL_36;
              }
              if (v22 >= v31) {
                break;
              }
              unint64_t v21 = *(void *)(v32 + 8 * v22);
              ++v23;
              if (v21) {
                goto LABEL_26;
              }
            }
          }
LABEL_32:
          sub_251264B38();
          return (unint64_t)v2;
        }
      }
    }
  }
LABEL_26:
  uint64_t v34 = (v21 - 1) & v21;
  unint64_t v19 = __clz(__rbit64(v21)) + (v22 << 6);
  for (i = v22; ; unint64_t v19 = __clz(__rbit64(v5)) | (i << 6))
  {
    unint64_t v24 = (uint64_t *)(*(void *)(v1 + 48) + 16 * v19);
    uint64_t v35 = *v24;
    uint64_t v36 = v24[1];
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    sub_25123DA50(v6, v7);
    sub_25123DA50(v7, v40);
    sub_25123DA50(v40, &v38);
    unint64_t result = sub_25123BF30(v35, v36);
    unint64_t v25 = result;
    if (v26)
    {
      int64_t v33 = i;
      uint64_t v12 = v7;
      uint64_t v13 = v6;
      uint64_t v14 = v1;
      uint64_t v15 = v11;
      uint64_t v16 = v10;
      uint64_t v17 = (uint64_t *)(v2[6] + 16 * result);
      swift_bridgeObjectRelease();
      *uint64_t v17 = v35;
      v17[1] = v36;
      uint64_t v10 = v16;
      uint64_t v11 = v15;
      uint64_t v1 = v14;
      uint64_t v6 = v13;
      uint64_t v7 = v12;
      int64_t i = v33;
      uint64_t v18 = (_OWORD *)(v2[7] + 32 * v25);
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v18);
      unint64_t result = (unint64_t)sub_25123DA50(&v38, v18);
      unint64_t v5 = v34;
      if (!v34) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
    if (v2[2] >= v2[3]) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v27 = (uint64_t *)(v2[6] + 16 * result);
    uint64_t *v27 = v35;
    v27[1] = v36;
    unint64_t result = (unint64_t)sub_25123DA50(&v38, (_OWORD *)(v2[7] + 32 * result));
    uint64_t v28 = v2[2];
    BOOL v29 = __OFADD__(v28, 1);
    uint64_t v30 = v28 + 1;
    if (v29) {
      goto LABEL_34;
    }
    v2[2] = v30;
    unint64_t v5 = v34;
    if (!v34) {
      goto LABEL_11;
    }
LABEL_10:
    uint64_t v34 = (v5 - 1) & v5;
  }
  __break(1u);
LABEL_34:
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
  return result;
}

id sub_251263454(uint64_t a1)
{
  return sub_2512634CC(a1, MEMORY[0x263F42910]);
}

void sub_251263484(void *a1)
{
}

id sub_2512634B4(uint64_t a1)
{
  return sub_2512634CC(a1, MEMORY[0x263F42920]);
}

id sub_2512634CC(uint64_t a1, void (*a2)(void))
{
  id result = sub_25125EC80();
  if (result)
  {
    uint64_t v4 = result;
    sub_25123DFF4(0, &qword_269B2B400);
    unint64_t v5 = (void *)sub_25126BD68();

    a2();
    return (id)sub_25126C708();
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_251263568(void *a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  swift_unknownObjectRetain();
  id v6 = a1;
  id result = sub_25125EC80();
  if (result)
  {
    uint64_t v8 = result;
    sub_25123DFF4(0, &qword_269B2B400);
    uint64_t v9 = (void *)sub_25126BD68();

    a4();
    uint64_t v10 = (void *)sub_25126C708();
    swift_unknownObjectRelease();

    return v10;
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_251263634(void *a1)
{
}

void sub_25126364C(void *a1, void (*a2)(uint64_t))
{
  id v4 = sub_25125EC80();
  if (v4)
  {
    unint64_t v5 = v4;
    id v7 = (id)sub_25126BD68();

    if (objc_msgSend(a1, sel_BOOLValue)) {
      uint64_t v6 = 1;
    }
    else {
      uint64_t v6 = 2;
    }
    a2(v6);
  }
  else
  {
    __break(1u);
  }
}

void sub_2512636F0(void *a1, uint64_t a2, void *a3, void (*a4)(uint64_t))
{
  id v6 = a3;
  id v7 = a1;
  id v8 = sub_25125EC80();
  if (v8)
  {
    uint64_t v9 = v8;
    id v11 = (id)sub_25126BD68();

    if (objc_msgSend(v6, sel_BOOLValue)) {
      uint64_t v10 = 1;
    }
    else {
      uint64_t v10 = 2;
    }
    a4(v10);
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_251263798(char a1)
{
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for HearingAidSettingsViewController();
  id v3 = objc_msgSendSuper2(&v5, sel_viewDidDisappear_, a1 & 1);
  return (*(uint64_t (**)(id))((*MEMORY[0x263F8EED0] & *v1) + 0x188))(v3);
}

void sub_2512638D0()
{
  sub_25125EC80();
  id v0 = objc_allocWithZone((Class)sub_25126BC28());
  id v1 = (id)sub_25126BC18();
  sub_25126BBF8();
}

id HearingAidSettingsViewController.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for HearingAidSettingsViewController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_2512639F8(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_251263A18(a1, a2, a3, (void *)*v3);
  uint64_t *v3 = result;
  return result;
}

uint64_t sub_251263A18(char a1, int64_t a2, char a3, void *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_269B2B6A0);
    uint64_t v10 = (void *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 25;
    }
    void v10[2] = v8;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_269B2AEA8);
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_25126C918();
  __break(1u);
  return result;
}

void sub_251263BA4()
{
  *(void *)&v0[OBJC_IVAR____TtC21HearingModeSettingsUI32HearingAidSettingsViewController__headphoneDevice] = 0;
  *(void *)&v0[OBJC_IVAR____TtC21HearingModeSettingsUI32HearingAidSettingsViewController__hmsClient] = 0;
  id v1 = &v0[OBJC_IVAR____TtC21HearingModeSettingsUI32HearingAidSettingsViewController_address];
  *(void *)id v1 = 0;
  *((void *)v1 + 1) = 0xE000000000000000;
  *(void *)&v0[OBJC_IVAR____TtC21HearingModeSettingsUI32HearingAidSettingsViewController_listeners] = MEMORY[0x263F8EE88];
  *(void *)&v0[OBJC_IVAR____TtC21HearingModeSettingsUI32HearingAidSettingsViewController____lazy_storage___hearingOptionsControlCenterSection] = 0;
  *(void *)&v0[OBJC_IVAR____TtC21HearingModeSettingsUI32HearingAidSettingsViewController____lazy_storage___adjustMediaAssistSection] = 0;

  sub_25126C8B8();
  __break(1u);
}

uint64_t sub_251263C5C(void *a1)
{
  return sub_25125F48C(a1, *(void *)(v1 + 16));
}

uint64_t sub_251263C64(uint64_t a1)
{
  return sub_25125FBAC(a1, *(void *)(v1 + 16));
}

void sub_251263C6C()
{
  sub_251252D94(*(void *)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32), *(void *)(v0 + 40), *(void *)(v0 + 48), (uint64_t)sel_openHearingAssistFooterLink);
}

uint64_t sub_251263CA8()
{
  swift_unknownObjectWeakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_251263CE0()
{
  swift_beginAccess();
  uint64_t v1 = MEMORY[0x25339A050](v0 + 16);
  if (v1)
  {
    objc_super v2 = (void *)v1;
    id v3 = sub_25125EC80();

    if (v3)
    {
      id v4 = (void *)sub_25126BD68();

      sub_25126BF08();
      sub_251253C48();
    }
    else
    {
      __break(1u);
    }
  }
  else
  {
    sub_25123DFF4(0, &qword_269B2B400);
    sub_25126C708();
  }
}

void sub_251263D8C(void *a1)
{
  swift_beginAccess();
  uint64_t v3 = MEMORY[0x25339A050](v1 + 16);
  if (v3)
  {
    id v4 = (void *)v3;
    id v5 = sub_25125EC80();

    if (v5)
    {
      unint64_t v6 = (void *)sub_25126BD68();

      if (objc_msgSend(a1, sel_respondsToSelector_, sel_BOOLValue))
      {
        objc_msgSend(a1, sel_BOOLValue);
        sub_25126BF18();

        return;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
  }
}

void sub_251263E48(void *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B2B6C0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_25126E8C0;
  *(void *)(inited + 32) = 0x6E6F687064616568;
  *(void *)(inited + 40) = 0xEF65636976654465;
  *(void *)(inited + 48) = sub_25125EC80();
  sub_251260E84(inited);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B2AF60);
  uint64_t v3 = (void *)sub_25126C3B8();
  swift_bridgeObjectRelease();
  objc_msgSend(a1, sel_setUserInfo_, v3);
}

void sub_251263F24()
{
  swift_beginAccess();
  uint64_t v1 = MEMORY[0x25339A050](v0 + 16);
  if (v1)
  {
    objc_super v2 = (char *)v1;
    id v3 = sub_25125EC80();
    if (v3)
    {
      id v4 = *(void **)&v2[OBJC_IVAR____TtC21HearingModeSettingsUI32HearingAidSettingsViewController__hmsClient];
      if (v4)
      {
        uint64_t v5 = (uint64_t)v3;
        type metadata accessor for HearingAssistFlowController();
        id v6 = v4;
        uint64_t v7 = sub_251232ED0();
        uint64_t v8 = HearingAssistFlowController.__allocating_init(withDevice:serviceClient:flow:)(v5, (uint64_t)v6, v7);
        uint64_t v9 = (void *)(*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v8) + 0x88))();
        objc_msgSend(v2, sel_presentViewController_animated_completion_, v9, 1, 0);

        return;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
  }
}

void sub_251264030(void *a1)
{
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v3 = *(void *)(v1 + 24);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B2AE40);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_25126E8C0;
  *(void *)(inited + 32) = 0x6F69737265567766;
  *(void *)(inited + 40) = 0xE90000000000006ELL;
  *(void *)(inited + 48) = v4;
  *(void *)(inited + 56) = v3;
  swift_bridgeObjectRetain();
  sub_251234DBC(inited);
  id v6 = (void *)sub_25126C3B8();
  swift_bridgeObjectRelease();
  objc_msgSend(a1, sel_setUserInfo_, v6);
}

uint64_t sub_2512640F8(uint64_t result)
{
  uint64_t v1 = result;
  uint64_t v2 = *(void *)(result + 16);
  if (!v2)
  {
    uint64_t v4 = MEMORY[0x263F8EE78];
LABEL_32:
    swift_bridgeObjectRelease();
    return v4;
  }
  unint64_t v3 = 0;
  uint64_t v4 = MEMORY[0x263F8EE78];
  while (v3 < *(void *)(v1 + 16))
  {
    unint64_t v5 = *(void *)(v1 + 8 * v3 + 32);
    swift_bridgeObjectRetain();
    uint64_t result = (uint64_t)sub_25125EC80();
    if (!result) {
      goto LABEL_35;
    }
    id v6 = (void *)result;
    uint64_t v7 = (void *)sub_25126BD68();

    LODWORD(v6) = sub_25126BF48();
    if (v6 == 1) {
      goto LABEL_21;
    }
    if (v5 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t result = sub_25126C8C8();
      if (!result)
      {
LABEL_20:
        swift_bridgeObjectRelease();
LABEL_21:
        char v16 = 1;
        if (v19)
        {
LABEL_31:
          swift_release();
          swift_bridgeObjectRelease();
          goto LABEL_32;
        }
        goto LABEL_22;
      }
    }
    else
    {
      uint64_t v8 = *(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10);
      uint64_t result = swift_bridgeObjectRetain();
      if (!v8) {
        goto LABEL_20;
      }
    }
    if ((v5 & 0xC000000000000001) != 0)
    {
      id v9 = (id)MEMORY[0x253399500](0, v5);
    }
    else
    {
      if (!*(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
        goto LABEL_34;
      }
      id v9 = *(id *)(v5 + 32);
    }
    uint64_t v10 = v9;
    swift_bridgeObjectRelease();
    id v11 = objc_msgSend(v10, sel_identifier);

    if (!v11) {
      goto LABEL_21;
    }
    uint64_t v12 = sub_25126C488();
    uint64_t v14 = v13;

    if (v12 == 0xD000000000000018 && v14 == 0x8000000251276820)
    {
      swift_bridgeObjectRelease();
      if (v19) {
        goto LABEL_31;
      }
      goto LABEL_4;
    }
    char v15 = sub_25126C958();
    swift_bridgeObjectRelease();
    char v16 = v15 ^ 1;
    if (v19) {
      goto LABEL_31;
    }
LABEL_22:
    if (v16)
    {
      uint64_t result = swift_isUniquelyReferenced_nonNull_native();
      if ((result & 1) == 0) {
        uint64_t result = sub_2512639F8(0, *(void *)(v4 + 16) + 1, 1);
      }
      unint64_t v18 = *(void *)(v4 + 16);
      unint64_t v17 = *(void *)(v4 + 24);
      if (v18 >= v17 >> 1) {
        uint64_t result = sub_2512639F8(v17 > 1, v18 + 1, 1);
      }
      *(void *)(v4 + 16) = v18 + 1;
      *(void *)(v4 + 8 * v18 + 32) = v5;
      goto LABEL_5;
    }
LABEL_4:
    uint64_t result = swift_bridgeObjectRelease();
LABEL_5:
    if (v2 == ++v3) {
      goto LABEL_32;
    }
  }
  __break(1u);
LABEL_34:
  __break(1u);
LABEL_35:
  __break(1u);
  return result;
}

uint64_t sub_2512643B0(const char *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B2AF28);
  MEMORY[0x270FA5388](v2 - 8, v3);
  unint64_t v5 = (char *)&v26 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_25126BB28();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6, v8);
  uint64_t v10 = (char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_25126C0E8();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11, v13);
  char v15 = (char *)&v26 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_251247964();
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v15, v16, v11);
  unint64_t v17 = sub_25126C0C8();
  os_log_type_t v18 = sub_25126C648();
  if (os_log_type_enabled(v17, v18))
  {
    uint64_t v19 = (uint8_t *)swift_slowAlloc();
    int64_t v20 = a1;
    unint64_t v21 = v19;
    *(_WORD *)uint64_t v19 = 0;
    _os_log_impl(&dword_251222000, v17, v18, v20, v19, 2u);
    MEMORY[0x253399FB0](v21, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v12 + 8))(v15, v11);
  sub_25126BB18();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) == 1) {
    return sub_25123DF98((uint64_t)v5, &qword_269B2AF28);
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v10, v5, v6);
  id v23 = objc_msgSend(self, sel_sharedApplication);
  unint64_t v24 = (void *)sub_25126BB08();
  sub_251234C8C(MEMORY[0x263F8EE78]);
  type metadata accessor for OpenExternalURLOptionsKey(0);
  sub_25123DA0C(&qword_269B2AF30);
  unint64_t v25 = (void *)sub_25126C3B8();
  swift_bridgeObjectRelease();
  objc_msgSend(v23, sel_openURL_options_completionHandler_, v24, v25, 0);

  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v10, v6);
}

uint64_t method lookup function for HearingAidSettingsViewController(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for HearingAidSettingsViewController);
}

uint64_t sub_251264B38()
{
  return swift_release();
}

uint64_t sub_251264B40(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B2AF40);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void sub_251264BA8(void *a1)
{
  sub_251260070(a1, *(void *)(v1 + 16));
}

uint64_t sub_251264BB0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a1 - 8) + 56))(a2, 1, 1, a1);
}

uint64_t *sub_251264BE8(uint64_t a1, void *a2, uint64_t a3)
{
  unint64_t v5 = sub_251265430(a1, a2, a3);
  (*(void (**)(uint64_t))(*(void *)(*(void *)(v3 + 80) - 8) + 8))(a1);
  return v5;
}

uint64_t *sub_251264C4C(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = *v3;
  uint64_t v6 = sub_251265244(a1, a2, a3);
  (*(void (**)(uint64_t))(*(void *)(*(void *)(v5 + 80) - 8) + 8))(a1);
  return v6;
}

uint64_t sub_251264CC4()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 80);
  uint64_t v2 = sub_25126C758();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2, v4);
  uint64_t v6 = (char *)&v9 - v5;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v1 - 8) + 56))((char *)&v9 - v5, 1, 1, v1);
  uint64_t v7 = v0 + *(void *)(*(void *)v0 + 104);
  swift_beginAccess();
  (*(void (**)(uint64_t, char *, uint64_t))(v3 + 40))(v7, v6, v2);
  return swift_endAccess();
}

uint64_t sub_251264E0C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(*(void *)v2 + 80);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](a1, a2);
  uint64_t v6 = (char *)&v10 - v5;
  uint64_t v8 = v2 + *(void *)(v7 + 104);
  swift_beginAccess();
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 48))(v8, 1, v3);
  if (!result)
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v8, v3);
    uint64_t v10 = *(void *)(v2 + *(void *)(*(void *)v2 + 112));
    sub_25126C218();
    return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }
  return result;
}

uint64_t sub_251264FA0()
{
  uint64_t v0 = swift_retain();
  sub_251264E0C(v0, v1);
  return swift_release();
}

uint64_t sub_251264FDC()
{
  uint64_t v1 = v0 + *(void *)(*(void *)v0 + 104);
  uint64_t v2 = sub_25126C758();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);

  return v0;
}

uint64_t sub_251265080()
{
  sub_251264FDC();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x270FA0228](v0, v1, v2);
}

uint64_t sub_2512650D8()
{
  return sub_251264CC4();
}

uint64_t sub_2512650FC()
{
  return sub_25126C1D8();
}

uint64_t sub_251265124(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_25126512C(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for UIControlSubscription();
  swift_allocObject();
  uint64_t v7 = sub_251265244(a1, a2, a3);
  uint64_t v9[3] = v6;
  v9[4] = swift_getWitnessTable();
  v9[0] = v7;
  sub_25126C208();
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)v9);
}

uint64_t sub_251265204(uint64_t a1)
{
  return sub_25126512C(a1, *(void **)v1, *(void *)(v1 + 8));
}

void *sub_251265218()
{
  id v1 = v0;
  return v0;
}

uint64_t *sub_251265244(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v19 = a2;
  uint64_t v20 = a3;
  uint64_t v5 = *v3;
  uint64_t v6 = *(void *)(*v3 + 80);
  uint64_t v7 = sub_25126C758();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7, v9);
  uint64_t v11 = (char *)&v18 - v10;
  uint64_t v12 = (uint64_t)v3 + *(void *)(v5 + 104);
  uint64_t v13 = *(void *)(v6 - 8);
  uint64_t v14 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v13 + 56);
  v14(v12, 1, 1, v6);
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v11, a1, v6);
  v14((uint64_t)v11, 0, 1, v6);
  swift_beginAccess();
  (*(void (**)(uint64_t, char *, uint64_t))(v8 + 40))(v12, v11, v7);
  swift_endAccess();
  char v15 = v19;
  uint64_t v16 = v20;
  *(uint64_t *)((char *)v3 + *(void *)(*v3 + 112)) = (uint64_t)v19;
  objc_msgSend(v15, sel_addTarget_action_forControlEvents_, v3, sel_eventHandler, v16);
  return v3;
}

uint64_t *sub_251265430(uint64_t a1, void *a2, uint64_t a3)
{
  return sub_251265244(a1, a2, a3);
}

uint64_t type metadata accessor for UIControlSubscription()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_25126549C()
{
  return swift_getWitnessTable();
}

uint64_t sub_2512654B8()
{
  return swift_getWitnessTable();
}

uint64_t sub_2512654D4()
{
  return MEMORY[0x263F8E658];
}

uint64_t sub_2512654E0()
{
  uint64_t result = sub_25126C758();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_initClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_25126557C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 16);
}

void *sub_251265584(void *a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v4;
  id v5 = v3;
  return a1;
}

uint64_t sub_2512655B4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a2;
  id v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  return a1;
}

uint64_t sub_251265600(uint64_t a1, void *a2)
{
  uint64_t v4 = *(void **)a1;
  *(void *)a1 = *a2;

  *(void *)(a1 + 8) = a2[1];
  return a1;
}

uint64_t sub_251265640(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 16)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_251265688(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)uint64_t result = a2 ^ 0x80000000;
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
      *(void *)uint64_t result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

uint64_t type metadata accessor for UIControlPublisher()
{
  return __swift_instantiateGenericMetadata();
}

void type metadata accessor for Event()
{
  if (!qword_269B2B6D8)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_269B2B6D8);
    }
  }
}

id sub_251265738()
{
  uint64_t v1 = OBJC_IVAR____TtC21HearingModeSettingsUI39HearingAidTuningAmplificationSliderCell____lazy_storage___slider;
  uint64_t v2 = *(void **)((char *)v0
                + OBJC_IVAR____TtC21HearingModeSettingsUI39HearingAidTuningAmplificationSliderCell____lazy_storage___slider);
  if (v2)
  {
    id v3 = *(id *)((char *)v0
               + OBJC_IVAR____TtC21HearingModeSettingsUI39HearingAidTuningAmplificationSliderCell____lazy_storage___slider);
  }
  else
  {
    uint64_t v4 = v0;
    id v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82BD8]), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
    objc_msgSend(v5, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
    sub_25123DFF4(0, &qword_269B2B6E8);
    v11[0] = sub_251265218();
    v11[1] = v6;
    swift_allocObject();
    swift_unknownObjectWeakInit();
    __swift_instantiateConcreteTypeFromMangledName(&qword_269B2B6F0);
    sub_25123E030(&qword_269B2B6F8, &qword_269B2B6F0);
    sub_25126C338();
    swift_release();

    uint64_t v7 = (void (*)(id *, void))(*(uint64_t (**)(id *))((*MEMORY[0x263F8EED0] & *v0) + 0x98))(v11);
    sub_25126C228();
    swift_release();
    v7(v11, 0);
    uint64_t v8 = *(void **)((char *)v0 + v1);
    *(void *)((char *)v4 + v1) = v5;
    id v3 = v5;

    uint64_t v2 = 0;
  }
  id v9 = v2;
  return v3;
}

uint64_t sub_25126591C(uint64_t a1)
{
  *(void *)(v1
            + OBJC_IVAR____TtC21HearingModeSettingsUI39HearingAidTuningAmplificationSliderCell____lazy_storage___slider) = a1;
  return MEMORY[0x270F9A758]();
}

void (*sub_251265930(id *a1))(uint64_t *a1, uint64_t a2)
{
  a1[1] = v1;
  *a1 = sub_251265738();
  return sub_251265978;
}

void sub_251265978(uint64_t *a1, uint64_t a2)
{
}

id sub_251265984()
{
  id v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82BF8]), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  objc_msgSend(v0, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  objc_msgSend(v0, sel_setAxis_, 0);
  objc_msgSend(v0, sel_setSpacing_, 15.0);
  return v0;
}

id sub_251265A08()
{
  return objc_retain(*(id *)(v0
                           + OBJC_IVAR____TtC21HearingModeSettingsUI39HearingAidTuningAmplificationSliderCell_stackView));
}

uint64_t sub_251265A18()
{
  return sub_2512688C0();
}

uint64_t sub_251265A24(uint64_t a1)
{
  return sub_251268914(a1, &OBJC_IVAR____TtC21HearingModeSettingsUI39HearingAidTuningAmplificationSliderCell_listeners);
}

uint64_t (*sub_251265A30())()
{
  return j_j__swift_endAccess;
}

id sub_251265A8C()
{
  return sub_2512689CC(&OBJC_IVAR____TtC21HearingModeSettingsUI39HearingAidTuningAmplificationSliderCell__headphoneDevice);
}

void sub_251265A98(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_25126C0E8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4, v6);
  uint64_t v8 = (char *)&v82 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B2B710);
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9, v11);
  uint64_t v13 = (char *)&v82 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a1)
  {
    __break(1u);
    goto LABEL_36;
  }
  if (objc_msgSend(a1, sel_userInfo))
  {
    sub_25126C7A8();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v90 = 0u;
    long long v91 = 0u;
  }
  sub_25123D3B8((uint64_t)&v90, (uint64_t)v92);
  if (!v93) {
    goto LABEL_19;
  }
  sub_25123DFF4(0, &qword_269B2AEA0);
  if ((swift_dynamicCast() & 1) == 0) {
    goto LABEL_20;
  }
  uint64_t v14 = v89;
  char v15 = (void *)sub_25126C458();
  id v88 = v14;
  id v16 = objc_msgSend(v14, sel_objectForKey_, v15);

  if (v16)
  {
    sub_25126C7A8();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v90 = 0u;
    long long v91 = 0u;
  }
  sub_25123D3B8((uint64_t)&v90, (uint64_t)v92);
  if (!v93)
  {

LABEL_19:
    sub_25123ECCC((uint64_t)v92);
    goto LABEL_20;
  }
  sub_25126BDB8();
  if (swift_dynamicCast())
  {
    unint64_t v17 = v89;
    id v18 = sub_251254C3C();
    if (v18)
    {
      uint64_t v19 = *(void **)((char *)v2
                     + OBJC_IVAR____TtC21HearingModeSettingsUI39HearingAidTuningAmplificationSliderCell__headphoneDevice);
      *(void *)((char *)v2
                + OBJC_IVAR____TtC21HearingModeSettingsUI39HearingAidTuningAmplificationSliderCell__headphoneDevice) = v18;
      id v20 = v18;

      id v21 = sub_251265A8C();
      if (v21)
      {
        int64_t v22 = v21;
        id v23 = (void *)sub_25126BD68();

        sub_25126BE58();
        swift_allocObject();
        swift_unknownObjectWeakInit();
        sub_25123E030(&qword_269B2B720, &qword_269B2B710);
        sub_25126C338();
        swift_release();
        (*(void (**)(char *, uint64_t))(v10 + 8))(v13, v9);
        unint64_t v24 = (void (*)(uint64_t *, void))(*(uint64_t (**)(uint64_t *))((*MEMORY[0x263F8EED0] & *v2)
                                                                                           + 0x98))(v92);
        sub_25126C228();
        swift_release();
        v24(v92, 0);
        unint64_t v25 = *(void **)((char *)v2
                       + OBJC_IVAR____TtC21HearingModeSettingsUI39HearingAidTuningAmplificationSliderCell_stackView);
        id v26 = objc_msgSend(v25, sel_arrangedSubviews);
        sub_25123DFF4(0, &qword_269B2AEE0);
        unint64_t v27 = sub_25126C538();

        if (v27 >> 62)
        {
          swift_bridgeObjectRetain();
          uint64_t v28 = sub_25126C8C8();
          swift_bridgeObjectRelease();
        }
        else
        {
          uint64_t v28 = *(void *)((v27 & 0xFFFFFFFFFFFFFF8) + 0x10);
        }
        swift_bridgeObjectRelease();
        if (v28)
        {

LABEL_33:
          return;
        }
        id v87 = v20;
        uint64_t v34 = *MEMORY[0x263F83628];
        uint64_t v35 = self;
        uint64_t v84 = v34;
        id v85 = v35;
        id v36 = objc_msgSend(v35, sel_configurationWithTextStyle_, v34);
        uint64_t v37 = (void *)sub_25126C458();
        long long v38 = self;
        id v39 = objc_msgSend(v38, sel_systemImageNamed_withConfiguration_, v37, v36);

        if (!v39
          || (id v40 = objc_msgSend(self, sel_systemGrayColor),
              id v41 = objc_msgSend(v39, sel_imageWithTintColor_renderingMode_, v40, 1),
              v40,
              v39,
              !v41))
        {
          id v41 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F827E8]), sel_init);
        }
        id v42 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82828]), sel_initWithImage_, v41);

        objc_msgSend(v42, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
        objc_msgSend(v42, sel_setContentMode_, 1);
        id v86 = v42;
        id v43 = objc_msgSend(v25, sel_addArrangedSubview_, v42);
        uint64_t v44 = *(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v2) + 0x70);
        uint64_t v45 = (*MEMORY[0x263F8EED0] & *v2) + 112;
        uint64_t v46 = (void *)((uint64_t (*)(id))v44)(v43);
        id v47 = sub_251265A8C();
        if (v47)
        {
          char v48 = v47;
          uint64_t v49 = (void *)sub_25126BD68();

          sub_25126BE38();
          int v51 = v50;

          LODWORD(v52) = v51;
          objc_msgSend(v46, sel_setValue_, v52);

          uint64_t v82 = v45;
          uint64_t v83 = v44;
          id v54 = (void *)((uint64_t (*)(uint64_t))v44)(v53);
          objc_msgSend(v25, sel_addArrangedSubview_, v54);

          id v55 = objc_msgSend(v85, sel_configurationWithTextStyle_, v84);
          id v56 = (void *)sub_25126C458();
          id v57 = objc_msgSend(v38, sel_systemImageNamed_withConfiguration_, v56, v55);

          if (!v57
            || (id v58 = objc_msgSend(self, sel_systemGrayColor),
                id v59 = objc_msgSend(v57, sel_imageWithTintColor_renderingMode_, v58, 1),
                v58,
                v57,
                !v59))
          {
            id v59 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F827E8]), sel_init);
          }
          id v60 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82828]), sel_initWithImage_, v59);

          objc_msgSend(v60, sel_setContentMode_, 1);
          objc_msgSend(v60, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
          objc_msgSend(v25, sel_addArrangedSubview_, v60);
          id v61 = objc_msgSend(v2, sel_contentView);
          objc_msgSend(v61, sel_addSubview_, v25);

          id v85 = self;
          __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_269B2B040);
          uint64_t v62 = swift_allocObject();
          *(_OWORD *)(v62 + 16) = xmmword_25126E8E0;
          id v63 = objc_msgSend(v25, sel_leadingAnchor);
          id v64 = objc_msgSend(v2, (SEL)&off_265364298);
          id v65 = objc_msgSend(v64, sel_leadingAnchor);

          id v66 = objc_msgSend(v63, sel_constraintEqualToAnchor_constant_, v65, 10.0);
          *(void *)(v62 + 32) = v66;
          id v67 = objc_msgSend(v25, sel_trailingAnchor);
          id v68 = objc_msgSend(v2, (SEL)&off_265364298);
          id v69 = objc_msgSend(v68, sel_trailingAnchor);

          id v70 = objc_msgSend(v67, sel_constraintEqualToAnchor_constant_, v69, -10.0);
          *(void *)(v62 + 40) = v70;
          id v71 = objc_msgSend(v25, sel_topAnchor);
          id v72 = objc_msgSend(v2, (SEL)&off_265364298);
          id v73 = objc_msgSend(v72, sel_topAnchor);

          id v74 = objc_msgSend(v71, sel_constraintEqualToAnchor_constant_, v73, 10.0);
          *(void *)(v62 + 48) = v74;
          id v75 = objc_msgSend(v25, sel_bottomAnchor);
          id v76 = objc_msgSend(v2, (SEL)&off_265364298);
          id v77 = objc_msgSend(v76, sel_bottomAnchor);

          id v78 = objc_msgSend(v75, sel_constraintEqualToAnchor_constant_, v77, -10.0);
          *(void *)(v62 + 56) = v78;
          v92[0] = v62;
          sub_25126C558();
          sub_25123DFF4(0, &qword_269B2AEB0);
          char v79 = (void *)sub_25126C528();
          swift_bridgeObjectRelease();
          objc_msgSend(v85, sel_activateConstraints_, v79);

          uint64_t v80 = (void *)v83();
          uint64_t v81 = (void *)sub_25126C458();
          objc_msgSend(v80, sel_setAccessibilityIdentifier_, v81);

          goto LABEL_33;
        }
        goto LABEL_37;
      }
LABEL_36:
      __break(1u);
LABEL_37:
      __break(1u);
      return;
    }
  }
  else
  {
  }
LABEL_20:
  uint64_t v29 = sub_251247964();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v8, v29, v4);
  uint64_t v30 = sub_25126C0C8();
  os_log_type_t v31 = sub_25126C638();
  if (os_log_type_enabled(v30, v31))
  {
    uint64_t v32 = swift_slowAlloc();
    uint64_t v33 = swift_slowAlloc();
    v92[0] = v33;
    *(_DWORD *)uint64_t v32 = 136315394;
    *(void *)&long long v90 = sub_251240E7C(0xD00000000000001ALL, 0x8000000251276A50, v92);
    sub_25126C768();
    *(_WORD *)(v32 + 12) = 2048;
    *(void *)&long long v90 = 58;
    sub_25126C768();
    _os_log_impl(&dword_251222000, v30, v31, "%s: %ld Depedencies not meet, bailing out of HearingAidTuningAmplificationSliderCell refresh", (uint8_t *)v32, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x253399FB0](v33, -1, -1);
    MEMORY[0x253399FB0](v32, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
}

uint64_t sub_251266798()
{
  return 1;
}

uint64_t sub_2512668F4()
{
  uint64_t v1 = sub_25126C448();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1, v3);
  uint64_t v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = v0;
  sub_25126C3D8();
  type metadata accessor for HearingAidTuningAmplificationSliderCell();
  uint64_t v6 = sub_2512547C8((uint64_t)v5);
  (*(void (**)(char *, uint64_t))(v2 + 8))(v5, v1);
  return v6;
}

uint64_t sub_251266A20()
{
  return sub_251266C08((SEL *)&selRef_accessibilityValue);
}

id sub_251266AB0()
{
  uint64_t v1 = (void *)(*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x70))();
  id v2 = objc_msgSend(v1, sel_accessibilityTraits);

  return v2;
}

id sub_251266B2C(void *a1, uint64_t a2, SEL *a3)
{
  uint64_t v4 = *(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *a1) + 0x70);
  uint64_t v5 = a1;
  uint64_t v6 = (void *)v4();
  id v7 = [v6 *a3];

  if (v7)
  {
    sub_25126C488();

    id v7 = (id)sub_25126C458();
    swift_bridgeObjectRelease();
  }
  else
  {
  }
  return v7;
}

uint64_t sub_251266BFC()
{
  return sub_251266C08((SEL *)&selRef_accessibilityHint);
}

uint64_t sub_251266C08(SEL *a1)
{
  uint64_t v3 = (void *)(*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v1) + 0x70))();
  id v4 = [v3 *a1];

  if (!v4) {
    return 0;
  }
  uint64_t v5 = sub_25126C488();

  return v5;
}

void sub_251266CB0()
{
}

void sub_251266CC8()
{
}

void sub_251266CD4(SEL *a1)
{
  uint64_t v3 = *(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v1) + 0x70);
  id v4 = (void *)v3();
  [v4 *a1];

  id v5 = (id)v3();
  objc_msgSend(v5, sel_sendActionsForControlEvents_, 64);
}

void sub_251266D90(void *a1, uint64_t a2, SEL *a3)
{
  id v4 = *(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *a1) + 0x70);
  id v5 = a1;
  uint64_t v6 = (void *)v4();
  [v6 *a3];

  id v7 = (id)v4();
  objc_msgSend(v7, sel_sendActionsForControlEvents_, 64);
}

double sub_251266EDC()
{
  uint64_t v1 = (void *)(*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x70))();
  objc_msgSend(v1, sel_accessibilityActivationPoint);
  double v3 = v2;

  return v3;
}

uint64_t sub_25126704C()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B2AF50);
  uint64_t v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_25126E8C0;
  uint64_t v2 = (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x70))();
  *(void *)(v1 + 56) = sub_25123DFF4(0, &qword_269B2B6E8);
  *(void *)(v1 + 32) = v2;
  return v1;
}

id sub_2512670F4(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  *(void *)&v4[OBJC_IVAR____TtC21HearingModeSettingsUI39HearingAidTuningAmplificationSliderCell____lazy_storage___slider] = 0;
  uint64_t v8 = OBJC_IVAR____TtC21HearingModeSettingsUI39HearingAidTuningAmplificationSliderCell_stackView;
  id v9 = objc_allocWithZone(MEMORY[0x263F82BF8]);
  uint64_t v10 = v4;
  id v11 = objc_msgSend(v9, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  objc_msgSend(v11, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  objc_msgSend(v11, sel_setAxis_, 0);
  objc_msgSend(v11, sel_setSpacing_, 15.0);
  *(void *)&v4[v8] = v11;
  *(void *)&v10[OBJC_IVAR____TtC21HearingModeSettingsUI39HearingAidTuningAmplificationSliderCell_listeners] = MEMORY[0x263F8EE88];
  *(void *)&v10[OBJC_IVAR____TtC21HearingModeSettingsUI39HearingAidTuningAmplificationSliderCell__headphoneDevice] = 0;

  if (a3)
  {
    uint64_t v12 = (void *)sub_25126C458();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v12 = 0;
  }
  v16.receiver = v10;
  v16.super_class = (Class)type metadata accessor for HearingAidTuningAmplificationSliderCell();
  id v13 = objc_msgSendSuper2(&v16, sel_initWithStyle_reuseIdentifier_specifier_, a1, v12, a4);

  id v14 = v13;
  if (v14) {

  }
  return v14;
}

id sub_251267274(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)&v3[OBJC_IVAR____TtC21HearingModeSettingsUI39HearingAidTuningAmplificationSliderCell____lazy_storage___slider] = 0;
  uint64_t v6 = OBJC_IVAR____TtC21HearingModeSettingsUI39HearingAidTuningAmplificationSliderCell_stackView;
  id v7 = objc_allocWithZone(MEMORY[0x263F82BF8]);
  uint64_t v8 = v3;
  id v9 = objc_msgSend(v7, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  objc_msgSend(v9, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  objc_msgSend(v9, sel_setAxis_, 0);
  objc_msgSend(v9, sel_setSpacing_, 15.0);
  *(void *)&v3[v6] = v9;
  *(void *)&v8[OBJC_IVAR____TtC21HearingModeSettingsUI39HearingAidTuningAmplificationSliderCell_listeners] = MEMORY[0x263F8EE88];
  *(void *)&v8[OBJC_IVAR____TtC21HearingModeSettingsUI39HearingAidTuningAmplificationSliderCell__headphoneDevice] = 0;

  if (a3)
  {
    uint64_t v10 = (void *)sub_25126C458();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v10 = 0;
  }
  v13.receiver = v8;
  v13.super_class = (Class)type metadata accessor for HearingAidTuningAmplificationSliderCell();
  id v11 = objc_msgSendSuper2(&v13, sel_initWithStyle_reuseIdentifier_, a1, v10);

  return v11;
}

id sub_2512673D4(void *a1)
{
  *(void *)&v1[OBJC_IVAR____TtC21HearingModeSettingsUI39HearingAidTuningAmplificationSliderCell____lazy_storage___slider] = 0;
  uint64_t v3 = OBJC_IVAR____TtC21HearingModeSettingsUI39HearingAidTuningAmplificationSliderCell_stackView;
  id v4 = objc_allocWithZone(MEMORY[0x263F82BF8]);
  id v5 = v1;
  id v6 = objc_msgSend(v4, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  objc_msgSend(v6, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  objc_msgSend(v6, sel_setAxis_, 0);
  objc_msgSend(v6, sel_setSpacing_, 15.0);
  *(void *)&v1[v3] = v6;
  *(void *)&v5[OBJC_IVAR____TtC21HearingModeSettingsUI39HearingAidTuningAmplificationSliderCell_listeners] = MEMORY[0x263F8EE88];
  *(void *)&v5[OBJC_IVAR____TtC21HearingModeSettingsUI39HearingAidTuningAmplificationSliderCell__headphoneDevice] = 0;

  v9.receiver = v5;
  v9.super_class = (Class)type metadata accessor for HearingAidTuningAmplificationSliderCell();
  id v7 = objc_msgSendSuper2(&v9, sel_initWithCoder_, a1);

  return v7;
}

id sub_25126750C()
{
  return sub_25126AD10(type metadata accessor for HearingAidTuningAmplificationSliderCell);
}

uint64_t sub_251267590(char a1)
{
  uint64_t v2 = sub_25126C448();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2, v4);
  id v6 = &v9[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  if (a1)
  {
    if (a1 == 1) {
      v9[14] = 1;
    }
    else {
      v9[15] = 2;
    }
    sub_25126C3D8();
  }
  else
  {
    v9[13] = 0;
    sub_25126C3D8();
  }
  uint64_t v7 = sub_2512547C8((uint64_t)v6);
  (*(void (**)(unsigned char *, uint64_t))(v3 + 8))(v6, v2);
  return v7;
}

uint64_t sub_251267724(char a1)
{
  uint64_t v2 = sub_25126C448();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2, v4);
  id v6 = &v11[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  if (a1)
  {
    if (a1 == 1)
    {
      v11[13] = 1;
      sub_25126C3D8();
      uint64_t v7 = sub_2512547C8((uint64_t)v6);
      uint64_t v8 = *(void (**)(unsigned char *, uint64_t))(v3 + 8);
      v8(v6, v2);
      v11[12] = 1;
    }
    else
    {
      v11[15] = 2;
      sub_25126C3D8();
      uint64_t v7 = sub_2512547C8((uint64_t)v6);
      uint64_t v8 = *(void (**)(unsigned char *, uint64_t))(v3 + 8);
      v8(v6, v2);
      v11[14] = 2;
    }
    sub_25126C3D8();
    sub_2512547C8((uint64_t)v6);
    v8(v6, v2);
  }
  else
  {
    v11[11] = 0;
    sub_25126C3D8();
    uint64_t v7 = sub_251254930((uint64_t)v6);
    objc_super v9 = *(void (**)(unsigned char *, uint64_t))(v3 + 8);
    v9(v6, v2);
    v11[10] = 0;
    sub_25126C3D8();
    sub_251254930((uint64_t)v6);
    v9(v6, v2);
  }
  return v7;
}

id sub_2512679F8(void *a1, uint64_t a2, char a3)
{
  if (a3)
  {
    if (a3 == 1) {
      sub_25126BFF8();
    }
    else {
      sub_25126BEB8();
    }
  }
  else
  {
    sub_25126C028();
  }
  return objc_msgSend(a1, sel_setValue_);
}

uint64_t sub_251267A5C(void *a1, void *a2, int a3)
{
  LODWORD(v3) = a3;
  uint64_t v6 = sub_25126C0E8();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6, v8);
  uint64_t v10 = (char *)&v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_251247964();
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v10, v11, v6);
  id v12 = a1;
  id v13 = a2;
  id v14 = sub_25126C0C8();
  os_log_type_t v15 = sub_25126C648();
  int v16 = v15;
  if (os_log_type_enabled(v14, v15))
  {
    uint64_t v17 = swift_slowAlloc();
    int v28 = v3;
    uint64_t v3 = v17;
    uint64_t v27 = swift_slowAlloc();
    uint64_t v30 = v27;
    *(_DWORD *)uint64_t v3 = 136316418;
    double v29 = COERCE_DOUBLE(sub_251240E7C(0xD00000000000001BLL, 0x8000000251276AC0, &v30));
    HIDWORD(v25) = v16;
    sub_25126C768();
    uint64_t v26 = v6;
    *(_WORD *)(v3 + 12) = 2048;
    *(void *)&double v29 = 179;
    sub_25126C768();
    *(_WORD *)(v3 + 22) = 2048;
    sub_25126C028();
    double v29 = v18;
    sub_25126C768();
    *(_WORD *)(v3 + 32) = 2048;
    sub_25126BFF8();
    double v29 = v19;
    sub_25126C768();

    *(_WORD *)(v3 + 42) = 2048;
    sub_25126BEB8();
    double v29 = v20;
    sub_25126C768();

    *(_WORD *)(v3 + 52) = 2048;
    objc_msgSend(v13, sel_value);
    double v29 = v21;
    sub_25126C768();

    _os_log_impl(&dword_251222000, v14, BYTE4(v25), "%s: %ld  b:%f t:%f ns:%f slider:%f", (uint8_t *)v3, 0x3Eu);
    uint64_t v22 = v27;
    swift_arrayDestroy();
    MEMORY[0x253399FB0](v22, -1, -1);
    uint64_t v23 = v3;
    LOBYTE(v3) = v28;
    MEMORY[0x253399FB0](v23, -1, -1);

    (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v26);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  }
  if ((_BYTE)v3)
  {
    objc_msgSend(v13, sel_value);
    if (v3 == 1) {
      return sub_25126C008();
    }
    else {
      return sub_25126BEC8();
    }
  }
  else
  {
    objc_msgSend(v13, sel_value);
    return sub_25126C038();
  }
}

uint64_t sub_251267E04(void *a1, unsigned __int8 a2)
{
  uint64_t v28 = sub_25126C448();
  uint64_t v4 = *(void *)(v28 - 8);
  MEMORY[0x270FA5388](v28, v5);
  uint64_t v27 = (char *)&v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_25126C428();
  uint64_t v9 = MEMORY[0x270FA5388](v7 - 8, v8);
  uint64_t v11 = MEMORY[0x270FA5388](v9, v10);
  uint64_t v13 = MEMORY[0x270FA5388](v11, v12);
  MEMORY[0x270FA5388](v13, v14);
  objc_msgSend(a1, sel_value);
  float v16 = v15;
  id v17 = (id)AXFormatFloatWithPercentage();
  if (v17)
  {
    float v18 = v17;
    uint64_t v26 = sub_25126C488();

    int v19 = a2;
    if (a2) {
      goto LABEL_3;
    }
LABEL_8:
    float v20 = (void (**)(uint64_t, uint64_t))(v4 + 8);
    if (v16 <= 0.5) {
      char v30 = 0;
    }
    else {
      char v29 = 0;
    }
    goto LABEL_6;
  }
  uint64_t v26 = 0;
  int v19 = a2;
  if (!a2) {
    goto LABEL_8;
  }
LABEL_3:
  if (v19 == 1)
  {
    float v20 = (void (**)(uint64_t, uint64_t))(v4 + 8);
    if (v16 <= 0.5) {
      char v32 = 1;
    }
    else {
      char v31 = 1;
    }
LABEL_6:
    sub_25126C418();
    sub_25126C408();
    sub_25126C3F8();
    swift_bridgeObjectRelease();
    sub_25126C408();
    uint64_t v21 = (uint64_t)v27;
    sub_25126C438();
    uint64_t v24 = sub_251254930(v21);
    (*v20)(v21, v28);
    return v24;
  }
  swift_bridgeObjectRelease();
  objc_msgSend(a1, sel_value);
  id v22 = (id)AXFormatFloatWithPercentage();
  if (!v22) {
    return 0;
  }
  uint64_t v23 = v22;
  uint64_t v24 = sub_25126C488();

  return v24;
}

uint64_t sub_251268298(char a1)
{
  if (!a1) {
    return 0x622E726564696C73;
  }
  if (a1 == 1) {
    return 0x742E726564696C73;
  }
  return 0xD000000000000015;
}

unint64_t sub_251268308(unint64_t result)
{
  if (result >= 3) {
    return 3;
  }
  return result;
}

uint64_t sub_251268318(uint64_t result)
{
  return result;
}

uint64_t *sub_251268320@<X0>(uint64_t *result@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v2 = *result;
  if ((unint64_t)*result >= 3) {
    LOBYTE(v2) = 3;
  }
  *a2 = v2;
  return result;
}

void sub_251268338(void *a1@<X8>)
{
  *a1 = *v1;
}

id sub_251268344()
{
  uint64_t v1 = OBJC_IVAR____TtC21HearingModeSettingsUI32HearingAidTuningValuesSliderCell____lazy_storage___slider;
  uint64_t v2 = *(void **)((char *)v0
                + OBJC_IVAR____TtC21HearingModeSettingsUI32HearingAidTuningValuesSliderCell____lazy_storage___slider);
  if (v2)
  {
    id v3 = *(id *)((char *)v0
               + OBJC_IVAR____TtC21HearingModeSettingsUI32HearingAidTuningValuesSliderCell____lazy_storage___slider);
  }
  else
  {
    uint64_t v4 = v0;
    id v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82BD8]), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
    objc_msgSend(v5, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
    sub_25123DFF4(0, &qword_269B2B6E8);
    v14[0] = sub_251265218();
    v14[1] = v6;
    uint64_t v7 = swift_allocObject();
    swift_unknownObjectWeakInit();
    uint64_t v8 = swift_allocObject();
    *(void *)(v8 + 16) = v5;
    *(void *)(v8 + 24) = v7;
    id v9 = v5;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269B2B6F0);
    sub_25123E030(&qword_269B2B6F8, &qword_269B2B6F0);
    sub_25126C338();
    swift_release();

    uint64_t v10 = (void (*)(id *, void))(*(uint64_t (**)(id *))((*MEMORY[0x263F8EED0] & *v4) + 0xA8))(v14);
    sub_25126C228();
    swift_release();
    v10(v14, 0);
    uint64_t v11 = *(void **)((char *)v4 + v1);
    *(void *)((char *)v4 + v1) = v9;
    id v3 = v9;

    uint64_t v2 = 0;
  }
  id v12 = v2;
  return v3;
}

void sub_251268548(void *a1, uint64_t a2)
{
  uint64_t v4 = sub_25126C0E8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4, v6);
  uint64_t v8 = (char *)&v30 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  objc_msgSend(a1, sel_value);
  swift_beginAccess();
  uint64_t v9 = MEMORY[0x25339A050](a2 + 16);
  if (v9)
  {
    uint64_t v10 = (void *)v9;
    uint64_t v11 = sub_251247964();
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v8, v11, v4);
    id v12 = v10;
    uint64_t v13 = sub_25126C0C8();
    int v14 = sub_25126C648();
    if (os_log_type_enabled(v13, (os_log_type_t)v14))
    {
      char v31 = a1;
      uint64_t v15 = swift_slowAlloc();
      *(_DWORD *)uint64_t v15 = 134218240;
      id v16 = sub_2512689C0();
      if (!v16)
      {
LABEL_11:

        __break(1u);
        goto LABEL_12;
      }
      id v17 = v16;
      HIDWORD(v30) = v14;
      float v18 = (void *)sub_25126BD68();

      sub_25126BEB8();
      float v20 = v19;

      double v32 = v20;
      sub_25126C768();

      *(_WORD *)(v15 + 12) = 2048;
      id v21 = sub_2512689C0();
      if (!v21)
      {
LABEL_12:

        __break(1u);
        return;
      }
      id v22 = v21;
      uint64_t v23 = (void *)sub_25126BD68();

      sub_25126C028();
      float v25 = v24;

      double v32 = v25;
      sub_25126C768();

      _os_log_impl(&dword_251222000, v13, BYTE4(v30), "Slider value change:  %f %f", (uint8_t *)v15, 0x16u);
      MEMORY[0x253399FB0](v15, -1, -1);
      a1 = v31;
    }
    else
    {

      uint64_t v13 = v12;
    }

    (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
    int v26 = *((unsigned __int8 *)&v12->isa
          + OBJC_IVAR____TtC21HearingModeSettingsUI32HearingAidTuningValuesSliderCell_sliderType);
    id v27 = sub_2512689C0();
    if (v27)
    {
      uint64_t v28 = v27;
      char v29 = (void *)sub_25126BD68();

      sub_251267A5C(v29, a1, v26);
      return;
    }
    __break(1u);
    goto LABEL_11;
  }
}

uint64_t sub_25126884C(uint64_t a1)
{
  *(void *)(v1 + OBJC_IVAR____TtC21HearingModeSettingsUI32HearingAidTuningValuesSliderCell____lazy_storage___slider) = a1;
  return MEMORY[0x270F9A758]();
}

void (*sub_251268860(id *a1))(uint64_t *a1, uint64_t a2)
{
  a1[1] = v1;
  *a1 = sub_251268344();
  return sub_2512688A8;
}

void sub_2512688A8(uint64_t *a1, uint64_t a2)
{
}

uint64_t sub_2512688B4()
{
  return sub_2512688C0();
}

uint64_t sub_2512688C0()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_251268908(uint64_t a1)
{
  return sub_251268914(a1, &OBJC_IVAR____TtC21HearingModeSettingsUI32HearingAidTuningValuesSliderCell_listeners);
}

uint64_t sub_251268914(uint64_t a1, void *a2)
{
  uint64_t v4 = (void *)(v2 + *a2);
  swift_beginAccess();
  *uint64_t v4 = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_251268964())()
{
  return j__swift_endAccess;
}

id sub_2512689C0()
{
  return sub_2512689CC(&OBJC_IVAR____TtC21HearingModeSettingsUI32HearingAidTuningValuesSliderCell__headphoneDevice);
}

id sub_2512689CC(uint64_t *a1)
{
  uint64_t v3 = v1;
  uint64_t v4 = sub_25126C0E8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4, v6);
  uint64_t v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *a1;
  uint64_t v10 = *(void **)(v1 + *a1);
  if (!v10 || (v11 = v10, id v12 = sub_251254C3C(), v11, !v12))
  {
    sub_25126C0B8();
    uint64_t v13 = sub_25126C0C8();
    os_log_type_t v14 = sub_25126C638();
    if (os_log_type_enabled(v13, v14))
    {
      uint64_t v15 = (uint8_t *)swift_slowAlloc();
      uint64_t v16 = swift_slowAlloc();
      uint64_t v22 = v3;
      uint64_t v17 = v16;
      uint64_t v24 = v16;
      *(_DWORD *)uint64_t v15 = 136315138;
      uint64_t v23 = sub_251240E7C(0x6E6F687064616568, 0xEF65636976654465, &v24);
      sub_25126C768();
      _os_log_impl(&dword_251222000, v13, v14, "%s: connected device !", v15, 0xCu);
      swift_arrayDestroy();
      uint64_t v18 = v17;
      uint64_t v3 = v22;
      MEMORY[0x253399FB0](v18, -1, -1);
      MEMORY[0x253399FB0](v15, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
    id v12 = *(id *)(v3 + v9);
    id v19 = v12;
  }
  return v12;
}

void sub_251268BF0(void *a1)
{
  uint64_t v3 = sub_25126C0E8();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3, v5);
  uint64_t v7 = (char *)&v145 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B2B710);
  uint64_t v153 = *(void *)(v8 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v8, v9);
  id v12 = (char *)&v145 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = MEMORY[0x270FA5388](v10, v13);
  uint64_t v16 = (char *)&v145 - v15;
  MEMORY[0x270FA5388](v14, v17);
  id v19 = (char *)&v145 - v18;
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B2B738);
  v151 = *(void (***)(void, void))(v20 - 8);
  v152 = (uint64_t (*)(void))v20;
  MEMORY[0x270FA5388](v20, v21);
  uint64_t v23 = (char *)&v145 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a1)
  {
    __break(1u);
    goto LABEL_39;
  }
  if (objc_msgSend(a1, sel_userInfo))
  {
    sub_25126C7A8();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v159 = 0u;
    long long v160 = 0u;
  }
  sub_25123D3B8((uint64_t)&v159, (uint64_t)aBlock);
  if (!v155) {
    goto LABEL_25;
  }
  id v149 = v23;
  sub_25123DFF4(0, &qword_269B2AEA0);
  if ((swift_dynamicCast() & 1) == 0) {
    goto LABEL_26;
  }
  v148 = v1;
  uint64_t v24 = v158;
  float v25 = (void *)sub_25126C458();
  id v150 = v24;
  id v26 = objc_msgSend(v24, sel_objectForKey_, v25);

  if (v26)
  {
    sub_25126C7A8();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v159 = 0u;
    long long v160 = 0u;
  }
  sub_25123D3B8((uint64_t)&v159, (uint64_t)aBlock);
  if (!v155) {
    goto LABEL_24;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_29:

    goto LABEL_26;
  }
  LODWORD(v147) = v158;
  id v27 = (void *)sub_25126C458();
  id v28 = objc_msgSend(v150, sel_objectForKey_, v27);

  if (v28)
  {
    sub_25126C7A8();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v159 = 0u;
    long long v160 = 0u;
  }
  char v29 = v148;
  sub_25123D3B8((uint64_t)&v159, (uint64_t)aBlock);
  if (!v155)
  {
LABEL_24:

LABEL_25:
    sub_25123ECCC((uint64_t)aBlock);
    goto LABEL_26;
  }
  sub_25126BDB8();
  if ((swift_dynamicCast() & 1) == 0) {
    goto LABEL_29;
  }
  uint64_t v30 = v158;
  id v31 = sub_251254C3C();
  if (v31)
  {
    id v146 = v30;
    double v32 = v29;
    uint64_t v33 = *(void **)((char *)v29
                   + OBJC_IVAR____TtC21HearingModeSettingsUI32HearingAidTuningValuesSliderCell__headphoneDevice);
    *(void *)((char *)v32 + OBJC_IVAR____TtC21HearingModeSettingsUI32HearingAidTuningValuesSliderCell__headphoneDevice) = v31;
    id v34 = v31;

    id v35 = sub_2512689C0();
    if (v35)
    {
      id v36 = v35;
      uint64_t v37 = (void *)sub_25126BD68();

      sub_25126C048();
      uint64_t v38 = sub_25126BD38();
      id v39 = *(void (**)(char *, uint64_t))(v153 + 8);
      v39(v19, v8);
      aBlock[0] = v38;
      id v40 = sub_2512689C0();
      id v41 = v149;
      if (v40)
      {
        id v42 = v40;
        id v43 = (void *)sub_25126BD68();

        sub_25126C018();
        uint64_t v44 = sub_25126BD38();
        v39(v16, v8);
        *(void *)&long long v159 = v44;
        id v45 = sub_2512689C0();
        if (v45)
        {
          uint64_t v46 = v45;
          id v47 = (void *)sub_25126BD68();

          sub_25126BEF8();
          uint64_t v48 = sub_25126BD38();
          v39(v12, v8);
          v158 = (void *)v48;
          __swift_instantiateConcreteTypeFromMangledName(&qword_269B2B748);
          sub_25123E030(&qword_269B2B750, &qword_269B2B748);
          sub_25126C1F8();
          uint64_t v49 = swift_allocObject();
          swift_unknownObjectWeakInit();
          uint64_t v50 = swift_allocObject();
          *(void *)(v50 + 16) = v49;
          *(void *)(v50 + 24) = v34;
          sub_25123E030(&qword_269B2B758, &qword_269B2B738);
          id v51 = v34;
          double v52 = v152;
          sub_25126C338();
          swift_release();
          ((void (**)(id, uint64_t (*)(void)))v151)[1](v41, v52);
          uint64_t v53 = (void *)MEMORY[0x263F8EED0];
          uint64_t v54 = (*(uint64_t (**)(uint64_t *))((*MEMORY[0x263F8EED0] & *v32) + 0xA8))(aBlock);
          sub_25126C228();
          swift_release();
          ((void (*)(uint64_t *, void))v54)(aBlock, 0);
          uint64_t v55 = OBJC_IVAR____TtC21HearingModeSettingsUI32HearingAidTuningValuesSliderCell_sliderType;
          *((unsigned char *)v32 + OBJC_IVAR____TtC21HearingModeSettingsUI32HearingAidTuningValuesSliderCell_sliderType) = (_BYTE)v147;
          id v56 = objc_msgSend(v32, sel_contentView);
          id v57 = objc_msgSend(v56, sel_subviews);

          sub_25123DFF4(0, &qword_269B2AEE0);
          unint64_t v58 = sub_25126C538();

          id v59 = *(uint64_t (**)(void))((*v53 & *v32) + 0x80);
          id v60 = (void *)v59();
          LOBYTE(v54) = sub_251269F88((uint64_t)v60, v58);
          swift_bridgeObjectRelease();

          if (v54)
          {

            return;
          }
          id v147 = v51;
          id v66 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82E00]), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
          objc_msgSend(v66, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
          id v67 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F828E0]), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
          v152 = v59;
          id v68 = v67;
          objc_msgSend(v67, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
          sub_251267724(*((unsigned char *)v32 + v55));
          swift_bridgeObjectRelease();
          id v69 = (void *)sub_25126C458();
          swift_bridgeObjectRelease();
          uint64_t v153 = v55;
          objc_msgSend(v68, sel_setText_, v69);

          id v70 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F828E0]), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
          objc_msgSend(v70, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
          sub_251267724(*((unsigned char *)v32 + v153));
          swift_bridgeObjectRelease();
          id v71 = (void *)sub_25126C458();
          swift_bridgeObjectRelease();
          objc_msgSend(v70, sel_setText_, v71);

          v151 = (void (**)(void, void))v68;
          id v72 = v68;
          id v73 = v152;
          objc_msgSend(v66, sel_addSubview_, v72);
          id v149 = v70;
          objc_msgSend(v66, sel_addSubview_, v70);
          id v74 = objc_msgSend(v32, sel_contentView);
          objc_msgSend(v74, sel_addSubview_, v66);

          int v75 = *((unsigned __int8 *)v32 + v153);
          id v76 = (void *)v73();
          id v77 = sub_2512689C0();
          if (v77)
          {
            id v78 = v77;
            char v79 = (void *)sub_25126BD68();

            if (v75)
            {
              if (v75 == 1) {
                sub_25126BFF8();
              }
              else {
                sub_25126BEB8();
              }
            }
            else
            {
              sub_25126C028();
            }
            id v80 = v148;
            objc_msgSend(v76, sel_setValue_);

            id v81 = objc_msgSend(v80, (SEL)&off_265364298);
            uint64_t v82 = (void *)v73();
            objc_msgSend(v81, sel_addSubview_, v82);

            id v145 = self;
            __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_269B2B040);
            uint64_t v83 = swift_allocObject();
            *(_OWORD *)(v83 + 16) = xmmword_25126FD50;
            id v84 = v151;
            id v85 = objc_msgSend(v151, sel_topAnchor);
            id v86 = objc_msgSend(v66, (SEL)&selRef_resetOcclusionData + 3);
            id v87 = objc_msgSend(v85, sel_constraintEqualToAnchor_, v86);

            *(void *)(v83 + 32) = v87;
            id v88 = objc_msgSend(v84, sel_leadingAnchor);
            id v89 = objc_msgSend(v66, byte_26536423A);
            id v90 = objc_msgSend(v88, sel_constraintEqualToAnchor_, v89);

            *(void *)(v83 + 40) = v90;
            long long v91 = v84;
            os_log_type_t v92 = v152;
            id v93 = objc_msgSend(v91, sel_bottomAnchor);
            id v94 = objc_msgSend(v66, sel_bottomAnchor);
            id v95 = objc_msgSend(v93, sel_constraintEqualToAnchor_, v94);

            *(void *)(v83 + 48) = v95;
            id v96 = v149;
            id v97 = objc_msgSend(v149, (SEL)&selRef_resetOcclusionData + 3);
            id v98 = objc_msgSend(v66, (SEL)&selRef_resetOcclusionData + 3);
            id v99 = objc_msgSend(v97, sel_constraintEqualToAnchor_, v98);

            *(void *)(v83 + 56) = v99;
            id v100 = objc_msgSend(v96, sel_trailingAnchor);
            id v101 = objc_msgSend(v66, (SEL)&selRef_deviceDisconnectedHandler_ + 4);
            id v102 = objc_msgSend(v100, sel_constraintEqualToAnchor_, v101);

            *(void *)(v83 + 64) = v102;
            id v103 = objc_msgSend(v96, sel_bottomAnchor);
            id v104 = objc_msgSend(v66, sel_bottomAnchor);
            id v105 = objc_msgSend(v103, sel_constraintEqualToAnchor_, v104);

            *(void *)(v83 + 72) = v105;
            id v106 = objc_msgSend(v66, sel_topAnchor);
            id v107 = objc_msgSend(v148, sel_contentView);
            id v108 = objc_msgSend(v107, sel_topAnchor);

            id v109 = objc_msgSend(v106, sel_constraintEqualToAnchor_constant_, v108, 10.0);
            *(void *)(v83 + 80) = v109;
            id v110 = objc_msgSend(v66, sel_trailingAnchor);
            id v111 = objc_msgSend(v148, sel_contentView);
            id v112 = objc_msgSend(v111, sel_trailingAnchor);

            id v113 = objc_msgSend(v110, sel_constraintEqualToAnchor_constant_, v112, -20.0);
            *(void *)(v83 + 88) = v113;
            id v114 = objc_msgSend(v66, sel_leadingAnchor);
            id v115 = objc_msgSend(v148, sel_contentView);
            id v116 = objc_msgSend(v115, sel_leadingAnchor);

            id v117 = objc_msgSend(v114, sel_constraintEqualToAnchor_constant_, v116, 20.0);
            *(void *)(v83 + 96) = v117;
            uint64_t v118 = (void *)v92();
            id v119 = objc_msgSend(v118, sel_topAnchor);

            id v120 = objc_msgSend(v66, sel_bottomAnchor);
            id v121 = objc_msgSend(v119, sel_constraintEqualToAnchor_constant_, v120, 10.0);

            *(void *)(v83 + 104) = v121;
            v122 = (void *)v92();
            id v123 = objc_msgSend(v122, sel_bottomAnchor);

            id v124 = objc_msgSend(v148, sel_contentView);
            id v125 = objc_msgSend(v124, sel_bottomAnchor);

            id v126 = objc_msgSend(v123, sel_constraintEqualToAnchor_constant_, v125, -10.0);
            *(void *)(v83 + 112) = v126;
            v127 = (void *)v92();
            id v128 = objc_msgSend(v127, sel_leadingAnchor);

            id v129 = objc_msgSend(v148, sel_contentView);
            id v130 = objc_msgSend(v129, sel_leadingAnchor);

            id v131 = objc_msgSend(v128, sel_constraintEqualToAnchor_constant_, v130, 20.0);
            *(void *)(v83 + 120) = v131;
            long long v132 = (void *)v92();
            id v133 = objc_msgSend(v132, sel_trailingAnchor);

            id v134 = objc_msgSend(v148, sel_contentView);
            id v135 = objc_msgSend(v134, sel_trailingAnchor);

            id v136 = objc_msgSend(v133, sel_constraintEqualToAnchor_constant_, v135, -20.0);
            *(void *)(v83 + 128) = v136;
            aBlock[0] = v83;
            sub_25126C558();
            sub_25123DFF4(0, &qword_269B2AEB0);
            v137 = (void *)sub_25126C528();
            swift_bridgeObjectRelease();
            objc_msgSend(v145, sel_activateConstraints_, v137);

            v138 = (void *)v92();
            id v139 = v146;
            v140 = v147;
            v141 = (void *)sub_25126C458();
            swift_bridgeObjectRelease();
            objc_msgSend(v138, sel_setAccessibilityIdentifier_, v141);

            v142 = (void *)v92();
            uint64_t v143 = swift_allocObject();
            swift_unknownObjectWeakInit();
            v156 = sub_25126B160;
            uint64_t v157 = v143;
            aBlock[0] = MEMORY[0x263EF8330];
            aBlock[1] = 1107296256;
            aBlock[2] = (uint64_t)sub_25126A110;
            v155 = &block_descriptor_2;
            v144 = _Block_copy(aBlock);
            swift_release();
            objc_msgSend(v142, sel_setAccessibilityValueBlock_, v144);
            _Block_release(v144);

            return;
          }
LABEL_42:
          __break(1u);
          return;
        }
LABEL_41:
        __break(1u);
        goto LABEL_42;
      }
LABEL_40:
      __break(1u);
      goto LABEL_41;
    }
LABEL_39:
    __break(1u);
    goto LABEL_40;
  }

LABEL_26:
  uint64_t v61 = sub_251247964();
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v7, v61, v3);
  uint64_t v62 = sub_25126C0C8();
  os_log_type_t v63 = sub_25126C638();
  if (os_log_type_enabled(v62, v63))
  {
    uint64_t v64 = swift_slowAlloc();
    uint64_t v65 = swift_slowAlloc();
    aBlock[0] = v65;
    *(_DWORD *)uint64_t v64 = 136315394;
    *(void *)&long long v159 = sub_251240E7C(0xD00000000000001ALL, 0x8000000251276A50, aBlock);
    sub_25126C768();
    *(_WORD *)(v64 + 12) = 2048;
    *(void *)&long long v159 = 266;
    sub_25126C768();
    _os_log_impl(&dword_251222000, v62, v63, "%s: %ld Dependencies not meet, bailing out of specifiers returning empty!", (uint8_t *)v64, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x253399FB0](v65, -1, -1);
    MEMORY[0x253399FB0](v64, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
}

uint64_t sub_251269F88(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62) {
    goto LABEL_20;
  }
  uint64_t v3 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v3; uint64_t v3 = sub_25126C8C8())
  {
    unint64_t v4 = a2 & 0xC000000000000001;
    if ((a2 & 0xC000000000000001) == 0)
    {
      id v5 = *(id *)(a2 + 32);
      goto LABEL_5;
    }
    while (1)
    {
      id v5 = (id)MEMORY[0x253399500](0, a2);
LABEL_5:
      uint64_t v6 = v5;
      sub_25123DFF4(0, &qword_269B2AEE0);
      char v7 = sub_25126C718();

      if (v7)
      {
LABEL_6:
        swift_bridgeObjectRelease();
        return 1;
      }
      if (v3 == 1) {
        goto LABEL_18;
      }
      if (v4) {
        break;
      }
      unint64_t v4 = 5;
      while (1)
      {
        unint64_t v12 = v4 - 3;
        if (__OFADD__(v4 - 4, 1)) {
          break;
        }
        id v13 = *(id *)(a2 + 8 * v4);
        char v14 = sub_25126C718();

        if (v14) {
          goto LABEL_6;
        }
        ++v4;
        if (v12 == v3) {
          goto LABEL_18;
        }
      }
      __break(1u);
    }
    uint64_t v9 = 1;
    while (1)
    {
      MEMORY[0x253399500](v9, a2);
      uint64_t v10 = v9 + 1;
      if (__OFADD__(v9, 1)) {
        break;
      }
      char v11 = sub_25126C718();
      swift_unknownObjectRelease();
      if (v11) {
        goto LABEL_6;
      }
      ++v9;
      if (v10 == v3) {
        goto LABEL_18;
      }
    }
    __break(1u);
LABEL_20:
    swift_bridgeObjectRetain();
  }
LABEL_18:
  swift_bridgeObjectRelease();
  return 0;
}

id sub_25126A110(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);
  uint64_t v4 = v3;
  swift_release();
  if (v4)
  {
    id v5 = (void *)sub_25126C458();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

uint64_t sub_25126A260()
{
  return sub_251267590(*(unsigned char *)(v0
                                + OBJC_IVAR____TtC21HearingModeSettingsUI32HearingAidTuningValuesSliderCell_sliderType));
}

uint64_t sub_25126A280()
{
  return sub_25126A468((SEL *)&selRef_accessibilityValue);
}

id sub_25126A310()
{
  uint64_t v1 = (void *)(*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x80))();
  id v2 = objc_msgSend(v1, sel_accessibilityTraits);

  return v2;
}

id sub_25126A38C(void *a1, uint64_t a2, SEL *a3)
{
  uint64_t v4 = *(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *a1) + 0x80);
  id v5 = a1;
  uint64_t v6 = (void *)v4();
  id v7 = [v6 *a3];

  if (v7)
  {
    sub_25126C488();

    id v7 = (id)sub_25126C458();
    swift_bridgeObjectRelease();
  }
  else
  {
  }
  return v7;
}

uint64_t sub_25126A45C()
{
  return sub_25126A468((SEL *)&selRef_accessibilityHint);
}

uint64_t sub_25126A468(SEL *a1)
{
  uint64_t v3 = (void *)(*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v1) + 0x80))();
  id v4 = [v3 *a1];

  if (!v4) {
    return 0;
  }
  uint64_t v5 = sub_25126C488();

  return v5;
}

uint64_t sub_25126A510()
{
  return swift_bridgeObjectRelease();
}

void sub_25126A518()
{
}

void sub_25126A530()
{
}

void sub_25126A53C(SEL *a1)
{
  uint64_t v3 = *(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v1) + 0x80);
  id v4 = (void *)v3();
  [v4 *a1];

  id v5 = (id)v3();
  objc_msgSend(v5, sel_sendActionsForControlEvents_, 64);
}

void sub_25126A5F8(void *a1, uint64_t a2, SEL *a3)
{
  id v4 = *(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *a1) + 0x80);
  id v5 = a1;
  uint64_t v6 = (void *)v4();
  [v6 *a3];

  id v7 = (id)v4();
  objc_msgSend(v7, sel_sendActionsForControlEvents_, 64);
}

double sub_25126A744()
{
  uint64_t v1 = (void *)(*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x80))();
  objc_msgSend(v1, sel_accessibilityActivationPoint);
  double v3 = v2;

  return v3;
}

uint64_t sub_25126A8B4()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B2AF50);
  uint64_t v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_25126E8C0;
  uint64_t v2 = (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x80))();
  *(void *)(v1 + 56) = sub_25123DFF4(0, &qword_269B2B6E8);
  *(void *)(v1 + 32) = v2;
  return v1;
}

id sub_25126A95C(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  *(void *)&v4[OBJC_IVAR____TtC21HearingModeSettingsUI32HearingAidTuningValuesSliderCell____lazy_storage___slider] = 0;
  *(void *)&v4[OBJC_IVAR____TtC21HearingModeSettingsUI32HearingAidTuningValuesSliderCell_listeners] = MEMORY[0x263F8EE88];
  *(void *)&v4[OBJC_IVAR____TtC21HearingModeSettingsUI32HearingAidTuningValuesSliderCell__headphoneDevice] = 0;
  *(void *)&v4[OBJC_IVAR____TtC21HearingModeSettingsUI32HearingAidTuningValuesSliderCell_bluetoothDevice] = 0;
  *(void *)&v4[OBJC_IVAR____TtC21HearingModeSettingsUI32HearingAidTuningValuesSliderCell_hms] = 0;
  v4[OBJC_IVAR____TtC21HearingModeSettingsUI32HearingAidTuningValuesSliderCell_sliderType] = 0;
  if (a3)
  {
    id v7 = (void *)sub_25126C458();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v7 = 0;
  }
  v11.receiver = v4;
  v11.super_class = (Class)type metadata accessor for HearingAidTuningValuesSliderCell();
  id v8 = objc_msgSendSuper2(&v11, sel_initWithStyle_reuseIdentifier_specifier_, a1, v7, a4);

  id v9 = v8;
  if (v9) {

  }
  return v9;
}

uint64_t sub_25126AA6C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t (*a6)(uint64_t, uint64_t, uint64_t, void *))
{
  if (a4)
  {
    uint64_t v9 = sub_25126C488();
    uint64_t v11 = v10;
  }
  else
  {
    uint64_t v9 = 0;
    uint64_t v11 = 0;
  }
  id v12 = a5;
  return a6(a3, v9, v11, a5);
}

id sub_25126AAE8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)&v3[OBJC_IVAR____TtC21HearingModeSettingsUI32HearingAidTuningValuesSliderCell____lazy_storage___slider] = 0;
  *(void *)&v3[OBJC_IVAR____TtC21HearingModeSettingsUI32HearingAidTuningValuesSliderCell_listeners] = MEMORY[0x263F8EE88];
  *(void *)&v3[OBJC_IVAR____TtC21HearingModeSettingsUI32HearingAidTuningValuesSliderCell__headphoneDevice] = 0;
  *(void *)&v3[OBJC_IVAR____TtC21HearingModeSettingsUI32HearingAidTuningValuesSliderCell_bluetoothDevice] = 0;
  *(void *)&v3[OBJC_IVAR____TtC21HearingModeSettingsUI32HearingAidTuningValuesSliderCell_hms] = 0;
  v3[OBJC_IVAR____TtC21HearingModeSettingsUI32HearingAidTuningValuesSliderCell_sliderType] = 0;
  if (a3)
  {
    id v5 = (void *)sub_25126C458();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v5 = 0;
  }
  v8.receiver = v3;
  v8.super_class = (Class)type metadata accessor for HearingAidTuningValuesSliderCell();
  id v6 = objc_msgSendSuper2(&v8, sel_initWithStyle_reuseIdentifier_, a1, v5);

  return v6;
}

uint64_t sub_25126ABD4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t, uint64_t, uint64_t))
{
  if (a4)
  {
    a4 = sub_25126C488();
    uint64_t v8 = v7;
  }
  else
  {
    uint64_t v8 = 0;
  }
  return a5(a3, a4, v8);
}

id sub_25126AC30(void *a1)
{
  *(void *)&v1[OBJC_IVAR____TtC21HearingModeSettingsUI32HearingAidTuningValuesSliderCell____lazy_storage___slider] = 0;
  *(void *)&v1[OBJC_IVAR____TtC21HearingModeSettingsUI32HearingAidTuningValuesSliderCell_listeners] = MEMORY[0x263F8EE88];
  *(void *)&v1[OBJC_IVAR____TtC21HearingModeSettingsUI32HearingAidTuningValuesSliderCell__headphoneDevice] = 0;
  *(void *)&v1[OBJC_IVAR____TtC21HearingModeSettingsUI32HearingAidTuningValuesSliderCell_bluetoothDevice] = 0;
  *(void *)&v1[OBJC_IVAR____TtC21HearingModeSettingsUI32HearingAidTuningValuesSliderCell_hms] = 0;
  v1[OBJC_IVAR____TtC21HearingModeSettingsUI32HearingAidTuningValuesSliderCell_sliderType] = 0;
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for HearingAidTuningValuesSliderCell();
  id v3 = objc_msgSendSuper2(&v5, sel_initWithCoder_, a1);

  return v3;
}

id sub_25126ACF8()
{
  return sub_25126AD10(type metadata accessor for HearingAidTuningValuesSliderCell);
}

id sub_25126AD10(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

uint64_t sub_25126ADC4()
{
  swift_unknownObjectWeakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_25126ADFC(void **a1)
{
  uint64_t v2 = *a1;
  swift_beginAccess();
  uint64_t v3 = MEMORY[0x25339A050](v1 + 16);
  if (v3)
  {
    id v4 = (void *)v3;
    id v5 = sub_251265A8C();
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = (void *)sub_25126BD68();

      sub_25126BE38();
      objc_msgSend(v2, sel_value);
      id v8 = sub_251265A8C();
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = (void *)sub_25126BD68();

        objc_msgSend(v2, sel_value);
        sub_25126BE48();

        return;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
  }
}

void sub_25126AED4()
{
  swift_beginAccess();
  uint64_t v1 = (void *)MEMORY[0x25339A050](v0 + 16);
  if (v1)
  {
    uint64_t v2 = v1;
    uint64_t v3 = (void *)(*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v1) + 0x70))();
    id v4 = sub_251265A8C();
    if (v4)
    {
      id v5 = v4;
      id v6 = (void *)sub_25126BD68();

      sub_25126BE38();
      int v8 = v7;

      LODWORD(v9) = v8;
      objc_msgSend(v3, sel_setValue_, v9);
    }
    else
    {
      __break(1u);
    }
  }
}

uint64_t type metadata accessor for HearingAidTuningAmplificationSliderCell()
{
  return self;
}

uint64_t sub_25126AFD8()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

void sub_25126B018()
{
  sub_251268548(*(void **)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_25126B020()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

void sub_25126B060()
{
  uint64_t v1 = *(void *)(v0 + 16) + 16;
  swift_beginAccess();
  uint64_t v2 = MEMORY[0x25339A050](v1);
  if (v2)
  {
    uint64_t v3 = (void *)v2;
    id v4 = sub_251254C3C();
    if (v4)
    {
      id v5 = v4;
      int v6 = *((unsigned __int8 *)v3 + OBJC_IVAR____TtC21HearingModeSettingsUI32HearingAidTuningValuesSliderCell_sliderType);
      int v7 = (void *)(*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v3) + 0x80))();
      int v8 = (void *)sub_25126BD68();
      if (v6)
      {
        if (v6 == 1) {
          sub_25126BFF8();
        }
        else {
          sub_25126BEB8();
        }
      }
      else
      {
        sub_25126C028();
      }
      objc_msgSend(v7, sel_setValue_);
    }
  }
}

uint64_t sub_25126B160()
{
  swift_beginAccess();
  uint64_t v1 = (void *)MEMORY[0x25339A050](v0 + 16);
  if (!v1) {
    return 0;
  }
  uint64_t v2 = v1;
  unsigned __int8 v3 = *((unsigned char *)v1 + OBJC_IVAR____TtC21HearingModeSettingsUI32HearingAidTuningValuesSliderCell_sliderType);
  id v4 = (void *)(*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v1) + 0x80))();
  uint64_t v5 = sub_251267E04(v4, v3);

  return v5;
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

uint64_t type metadata accessor for HearingAidTuningValuesSliderCell()
{
  return self;
}

unint64_t sub_25126B264()
{
  unint64_t result = qword_269B2B778;
  if (!qword_269B2B778)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B2B778);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for HearingAidTuningValuesSliderCell.SliderType(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25126B384);
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

ValueMetadata *type metadata accessor for HearingAidTuningValuesSliderCell.SliderType()
{
  return &type metadata for HearingAidTuningValuesSliderCell.SliderType;
}

uint64_t sub_25126B3CC()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

id sub_25126B3DC()
{
  type metadata accessor for ResourceBundleClass();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id result = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  qword_269B2D3E8 = (uint64_t)result;
  return result;
}

uint64_t sub_25126B430(uint64_t a1)
{
  return sub_25126B88C(a1, qword_269B2D508);
}

uint64_t sub_25126B45C()
{
  return sub_25126B954(&qword_269B2D3F0, (uint64_t)qword_269B2D508);
}

uint64_t sub_25126B480@<X0>(uint64_t a1@<X8>)
{
  return sub_25126B9CC(&qword_269B2D3F0, (uint64_t)qword_269B2D508, a1);
}

uint64_t sub_25126B4A4(uint64_t a1)
{
  return sub_25126B88C(a1, qword_269B2D520);
}

uint64_t sub_25126B4C8()
{
  return sub_25126B954(&qword_269B2D3F8, (uint64_t)qword_269B2D520);
}

uint64_t sub_25126B4EC@<X0>(uint64_t a1@<X8>)
{
  return sub_25126B9CC(&qword_269B2D3F8, (uint64_t)qword_269B2D520, a1);
}

uint64_t sub_25126B510(uint64_t a1)
{
  return sub_25126B88C(a1, qword_269B2D538);
}

uint64_t sub_25126B534()
{
  return sub_25126B954(&qword_269B2D400, (uint64_t)qword_269B2D538);
}

uint64_t sub_25126B558@<X0>(uint64_t a1@<X8>)
{
  return sub_25126B9CC(&qword_269B2D400, (uint64_t)qword_269B2D538, a1);
}

uint64_t sub_25126B57C(uint64_t a1)
{
  return sub_25126B88C(a1, qword_269B2D550);
}

uint64_t sub_25126B5A0()
{
  return sub_25126B954(&qword_269B2D408, (uint64_t)qword_269B2D550);
}

uint64_t sub_25126B5C4@<X0>(uint64_t a1@<X8>)
{
  return sub_25126B9CC(&qword_269B2D408, (uint64_t)qword_269B2D550, a1);
}

uint64_t sub_25126B5E8(uint64_t a1)
{
  return sub_25126B88C(a1, qword_269B2D568);
}

uint64_t sub_25126B60C()
{
  return sub_25126B954(&qword_269B2D410, (uint64_t)qword_269B2D568);
}

uint64_t sub_25126B630@<X0>(uint64_t a1@<X8>)
{
  return sub_25126B9CC(&qword_269B2D410, (uint64_t)qword_269B2D568, a1);
}

uint64_t sub_25126B654(uint64_t a1)
{
  return sub_25126B88C(a1, qword_269B2D580);
}

uint64_t sub_25126B678()
{
  return sub_25126B954(&qword_269B2D418, (uint64_t)qword_269B2D580);
}

uint64_t sub_25126B69C@<X0>(uint64_t a1@<X8>)
{
  return sub_25126B9CC(&qword_269B2D418, (uint64_t)qword_269B2D580, a1);
}

uint64_t sub_25126B6C0(uint64_t a1)
{
  return sub_25126B88C(a1, qword_269B2D598);
}

uint64_t sub_25126B6E4()
{
  return sub_25126B954(&qword_269B2D420, (uint64_t)qword_269B2D598);
}

uint64_t sub_25126B708@<X0>(uint64_t a1@<X8>)
{
  return sub_25126B9CC(&qword_269B2D420, (uint64_t)qword_269B2D598, a1);
}

uint64_t sub_25126B72C(uint64_t a1)
{
  return sub_25126B88C(a1, qword_269B2D5B0);
}

uint64_t sub_25126B750()
{
  return sub_25126B954(&qword_269B2D428, (uint64_t)qword_269B2D5B0);
}

uint64_t sub_25126B774@<X0>(uint64_t a1@<X8>)
{
  return sub_25126B9CC(&qword_269B2D428, (uint64_t)qword_269B2D5B0, a1);
}

uint64_t sub_25126B798(uint64_t a1)
{
  return sub_25126B88C(a1, qword_269B2D5C8);
}

uint64_t sub_25126B7BC()
{
  return sub_25126B954(&qword_269B2D430, (uint64_t)qword_269B2D5C8);
}

uint64_t sub_25126B7E0@<X0>(uint64_t a1@<X8>)
{
  return sub_25126B9CC(&qword_269B2D430, (uint64_t)qword_269B2D5C8, a1);
}

uint64_t sub_25126B804(uint64_t a1)
{
  return sub_25126B88C(a1, qword_269B2D5E0);
}

uint64_t sub_25126B81C()
{
  return sub_25126B954(&qword_269B2D438, (uint64_t)qword_269B2D5E0);
}

uint64_t sub_25126B840@<X0>(uint64_t a1@<X8>)
{
  return sub_25126B9CC(&qword_269B2D438, (uint64_t)qword_269B2D5E0, a1);
}

uint64_t sub_25126B864(uint64_t a1)
{
  return sub_25126B88C(a1, qword_269B2D5F8);
}

uint64_t sub_25126B88C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_25126C098();
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  if (qword_269B2D3E0 != -1) {
    swift_once();
  }
  id v4 = (id)qword_269B2D3E8;
  return sub_25126C088();
}

uint64_t sub_25126B930()
{
  return sub_25126B954(&qword_269B2D440, (uint64_t)qword_269B2D5F8);
}

uint64_t sub_25126B954(void *a1, uint64_t a2)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_25126C098();
  return __swift_project_value_buffer(v3, a2);
}

uint64_t sub_25126B9A8@<X0>(uint64_t a1@<X8>)
{
  return sub_25126B9CC(&qword_269B2D440, (uint64_t)qword_269B2D5F8, a1);
}

uint64_t sub_25126B9CC@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_25126C098();
  uint64_t v6 = __swift_project_value_buffer(v5, a2);
  int v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);
  return v7(a3, v6, v5);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t sub_25126BAF8()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_25126BB08()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_25126BB18()
{
  return MEMORY[0x270EEFF00]();
}

uint64_t sub_25126BB28()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_25126BB38()
{
  return MEMORY[0x270EF0998]();
}

uint64_t sub_25126BB48()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_25126BB58()
{
  return MEMORY[0x270EF0FA0]();
}

uint64_t sub_25126BB68()
{
  return MEMORY[0x270EF10A8]();
}

uint64_t sub_25126BB78()
{
  return MEMORY[0x270EF16E0]();
}

uint64_t sub_25126BB88()
{
  return MEMORY[0x270EF1700]();
}

uint64_t sub_25126BB98()
{
  return MEMORY[0x270F816F8]();
}

uint64_t sub_25126BBA8()
{
  return MEMORY[0x270F81740]();
}

uint64_t sub_25126BBB8()
{
  return MEMORY[0x270EF1738]();
}

uint64_t sub_25126BBC8()
{
  return MEMORY[0x270FA1140]();
}

uint64_t sub_25126BBD8()
{
  return MEMORY[0x270F390E0]();
}

uint64_t sub_25126BBE8()
{
  return MEMORY[0x270F390E8]();
}

uint64_t sub_25126BBF8()
{
  return MEMORY[0x270F390F0]();
}

uint64_t sub_25126BC08()
{
  return MEMORY[0x270F390F8]();
}

uint64_t sub_25126BC18()
{
  return MEMORY[0x270F39100]();
}

uint64_t sub_25126BC28()
{
  return MEMORY[0x270F39108]();
}

uint64_t sub_25126BC38()
{
  return MEMORY[0x270F39110]();
}

uint64_t sub_25126BC48()
{
  return MEMORY[0x270F39118]();
}

uint64_t sub_25126BC58()
{
  return MEMORY[0x270F39128]();
}

uint64_t sub_25126BC68()
{
  return MEMORY[0x270F39130]();
}

uint64_t sub_25126BC78()
{
  return MEMORY[0x270F39138]();
}

uint64_t sub_25126BC88()
{
  return MEMORY[0x270F39140]();
}

uint64_t sub_25126BC98()
{
  return MEMORY[0x270F39148]();
}

uint64_t sub_25126BCA8()
{
  return MEMORY[0x270F39150]();
}

uint64_t sub_25126BCB8()
{
  return MEMORY[0x270F39158]();
}

uint64_t sub_25126BCC8()
{
  return MEMORY[0x270F39160]();
}

uint64_t sub_25126BCD8()
{
  return MEMORY[0x270F39168]();
}

uint64_t sub_25126BCE8()
{
  return MEMORY[0x270F39170]();
}

uint64_t sub_25126BCF8()
{
  return MEMORY[0x270F39178]();
}

uint64_t sub_25126BD08()
{
  return MEMORY[0x270F39180]();
}

uint64_t sub_25126BD18()
{
  return MEMORY[0x270F39188]();
}

uint64_t sub_25126BD28()
{
  return MEMORY[0x270F39190]();
}

uint64_t sub_25126BD38()
{
  return MEMORY[0x270F30AB8]();
}

uint64_t sub_25126BD48()
{
  return MEMORY[0x270F30AC0]();
}

uint64_t sub_25126BD58()
{
  return MEMORY[0x270F30AC8]();
}

uint64_t sub_25126BD68()
{
  return MEMORY[0x270F30AD0]();
}

uint64_t sub_25126BD78()
{
  return MEMORY[0x270F30AD8]();
}

uint64_t sub_25126BD88()
{
  return MEMORY[0x270F30AE0]();
}

uint64_t sub_25126BD98()
{
  return MEMORY[0x270F30AE8]();
}

uint64_t sub_25126BDA8()
{
  return MEMORY[0x270F30AF0]();
}

uint64_t sub_25126BDB8()
{
  return MEMORY[0x270F30AF8]();
}

uint64_t sub_25126BDC8()
{
  return MEMORY[0x270F30B00]();
}

uint64_t sub_25126BDD8()
{
  return MEMORY[0x270F30B08]();
}

uint64_t sub_25126BDE8()
{
  return MEMORY[0x270F30B10]();
}

uint64_t sub_25126BDF8()
{
  return MEMORY[0x270F30B18]();
}

uint64_t sub_25126BE08()
{
  return MEMORY[0x270F30B88]();
}

uint64_t sub_25126BE18()
{
  return MEMORY[0x270F30B90]();
}

uint64_t sub_25126BE28()
{
  return MEMORY[0x270F30B98]();
}

uint64_t sub_25126BE38()
{
  return MEMORY[0x270F30BA0]();
}

uint64_t sub_25126BE48()
{
  return MEMORY[0x270F30BA8]();
}

uint64_t sub_25126BE58()
{
  return MEMORY[0x270F30BB8]();
}

uint64_t sub_25126BE68()
{
  return MEMORY[0x270F30BD0]();
}

uint64_t sub_25126BE78()
{
  return MEMORY[0x270F30BD8]();
}

uint64_t sub_25126BE88()
{
  return MEMORY[0x270F30BE0]();
}

uint64_t sub_25126BE98()
{
  return MEMORY[0x270F30BE8]();
}

uint64_t sub_25126BEA8()
{
  return MEMORY[0x270F30BF0]();
}

uint64_t sub_25126BEB8()
{
  return MEMORY[0x270F30BF8]();
}

uint64_t sub_25126BEC8()
{
  return MEMORY[0x270F30C00]();
}

uint64_t sub_25126BED8()
{
  return MEMORY[0x270F30C08]();
}

uint64_t sub_25126BEE8()
{
  return MEMORY[0x270F30C10]();
}

uint64_t sub_25126BEF8()
{
  return MEMORY[0x270F30C18]();
}

uint64_t sub_25126BF08()
{
  return MEMORY[0x270F30C20]();
}

uint64_t sub_25126BF18()
{
  return MEMORY[0x270F30C28]();
}

uint64_t sub_25126BF28()
{
  return MEMORY[0x270F30C30]();
}

uint64_t sub_25126BF38()
{
  return MEMORY[0x270F30C38]();
}

uint64_t sub_25126BF48()
{
  return MEMORY[0x270F30C40]();
}

uint64_t sub_25126BF58()
{
  return MEMORY[0x270F30C48]();
}

uint64_t sub_25126BF68()
{
  return MEMORY[0x270F30C50]();
}

uint64_t sub_25126BF78()
{
  return MEMORY[0x270F30C58]();
}

uint64_t sub_25126BF88()
{
  return MEMORY[0x270F30C60]();
}

uint64_t sub_25126BF98()
{
  return MEMORY[0x270F30C68]();
}

uint64_t sub_25126BFA8()
{
  return MEMORY[0x270F30C70]();
}

uint64_t sub_25126BFB8()
{
  return MEMORY[0x270F30C78]();
}

uint64_t sub_25126BFC8()
{
  return MEMORY[0x270F30C80]();
}

uint64_t sub_25126BFD8()
{
  return MEMORY[0x270F30C88]();
}

uint64_t sub_25126BFE8()
{
  return MEMORY[0x270F30C90]();
}

uint64_t sub_25126BFF8()
{
  return MEMORY[0x270F30C98]();
}

uint64_t sub_25126C008()
{
  return MEMORY[0x270F30CA0]();
}

uint64_t sub_25126C018()
{
  return MEMORY[0x270F30CA8]();
}

uint64_t sub_25126C028()
{
  return MEMORY[0x270F30CB0]();
}

uint64_t sub_25126C038()
{
  return MEMORY[0x270F30CB8]();
}

uint64_t sub_25126C048()
{
  return MEMORY[0x270F30CC0]();
}

uint64_t sub_25126C058()
{
  return MEMORY[0x270F30CC8]();
}

uint64_t sub_25126C068()
{
  return MEMORY[0x270F30CD0]();
}

uint64_t sub_25126C078()
{
  return MEMORY[0x270F30CD8]();
}

uint64_t sub_25126C088()
{
  return MEMORY[0x270EEB1D0]();
}

uint64_t sub_25126C098()
{
  return MEMORY[0x270EEB1E0]();
}

uint64_t sub_25126C0A8()
{
  return MEMORY[0x270F39198]();
}

uint64_t sub_25126C0B8()
{
  return MEMORY[0x270F30CE0]();
}

uint64_t sub_25126C0C8()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_25126C0D8()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_25126C0E8()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_25126C0F8()
{
  return MEMORY[0x270F81D48]();
}

uint64_t sub_25126C108()
{
  return MEMORY[0x270F81D68]();
}

uint64_t sub_25126C118()
{
  return MEMORY[0x270F81DB8]();
}

uint64_t sub_25126C128()
{
  return MEMORY[0x270F81DC0]();
}

uint64_t sub_25126C138()
{
  return MEMORY[0x270F81DC8]();
}

uint64_t sub_25126C148()
{
  return MEMORY[0x270F81DD8]();
}

uint64_t sub_25126C158()
{
  return MEMORY[0x270F81DF0]();
}

uint64_t sub_25126C168()
{
  return MEMORY[0x270F81DF8]();
}

uint64_t sub_25126C178()
{
  return MEMORY[0x270F81E50]();
}

uint64_t sub_25126C188()
{
  return MEMORY[0x270F81E70]();
}

uint64_t sub_25126C198()
{
  return MEMORY[0x270F81E78]();
}

uint64_t sub_25126C1A8()
{
  return MEMORY[0x270F81EB0]();
}

uint64_t sub_25126C1B8()
{
  return MEMORY[0x270F81EE0]();
}

uint64_t sub_25126C1C8()
{
  return MEMORY[0x270F823A0]();
}

uint64_t sub_25126C1D8()
{
  return MEMORY[0x270EE3828]();
}

uint64_t sub_25126C1E8()
{
  return MEMORY[0x270EE3848]();
}

uint64_t sub_25126C1F8()
{
  return MEMORY[0x270EE3858]();
}

uint64_t sub_25126C208()
{
  return MEMORY[0x270EE3AE8]();
}

uint64_t sub_25126C218()
{
  return MEMORY[0x270EE3AF0]();
}

uint64_t sub_25126C228()
{
  return MEMORY[0x270EE3B98]();
}

uint64_t sub_25126C238()
{
  return MEMORY[0x270EE3BB0]();
}

uint64_t sub_25126C248()
{
  return MEMORY[0x270EE3C20]();
}

uint64_t sub_25126C258()
{
  return MEMORY[0x270EE3CF0]();
}

uint64_t sub_25126C268()
{
  return MEMORY[0x270EE3DA8]();
}

uint64_t sub_25126C278()
{
  return MEMORY[0x270EE3DB0]();
}

uint64_t sub_25126C288()
{
  return MEMORY[0x270EE3DB8]();
}

uint64_t sub_25126C298()
{
  return MEMORY[0x270EE3DD8]();
}

uint64_t sub_25126C2A8()
{
  return MEMORY[0x270EE3DE0]();
}

uint64_t sub_25126C2B8()
{
  return MEMORY[0x270F30CE8]();
}

uint64_t sub_25126C2C8()
{
  return MEMORY[0x270EE3DF0]();
}

uint64_t sub_25126C2D8()
{
  return MEMORY[0x270EE3E08]();
}

uint64_t sub_25126C2E8()
{
  return MEMORY[0x270EE3E78]();
}

uint64_t sub_25126C2F8()
{
  return MEMORY[0x270EE3F78]();
}

uint64_t sub_25126C308()
{
  return MEMORY[0x270EE3F90]();
}

uint64_t sub_25126C318()
{
  return MEMORY[0x270EE3FB0]();
}

uint64_t sub_25126C328()
{
  return MEMORY[0x270EE3FD8]();
}

uint64_t sub_25126C338()
{
  return MEMORY[0x270EE4008]();
}

uint64_t sub_25126C348()
{
  return MEMORY[0x270EE4010]();
}

uint64_t sub_25126C358()
{
  return MEMORY[0x270FA0988]();
}

uint64_t sub_25126C368()
{
  return MEMORY[0x270FA0A10]();
}

uint64_t sub_25126C378()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_25126C388()
{
  return MEMORY[0x270FA0AC0]();
}

uint64_t sub_25126C398()
{
  return MEMORY[0x270FA0B00]();
}

uint64_t sub_25126C3A8()
{
  return MEMORY[0x270FA0BC8]();
}

uint64_t sub_25126C3B8()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_25126C3C8()
{
  return MEMORY[0x270F9D138]();
}

uint64_t sub_25126C3D8()
{
  return MEMORY[0x270EF18D0]();
}

uint64_t sub_25126C3E8()
{
  return MEMORY[0x270EF18F0]();
}

uint64_t sub_25126C3F8()
{
  return MEMORY[0x270EF1908]();
}

uint64_t sub_25126C408()
{
  return MEMORY[0x270EF1918]();
}

uint64_t sub_25126C418()
{
  return MEMORY[0x270EF1928]();
}

uint64_t sub_25126C428()
{
  return MEMORY[0x270EF1938]();
}

uint64_t sub_25126C438()
{
  return MEMORY[0x270EF1950]();
}

uint64_t sub_25126C448()
{
  return MEMORY[0x270EF1958]();
}

uint64_t sub_25126C458()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_25126C468()
{
  return MEMORY[0x270EF19C8]();
}

uint64_t sub_25126C478()
{
  return MEMORY[0x270EF19E0]();
}

uint64_t sub_25126C488()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_25126C498()
{
  return MEMORY[0x270EF1A50]();
}

uint64_t sub_25126C4A8()
{
  return MEMORY[0x270EF1AF8]();
}

uint64_t sub_25126C4B8()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_25126C4C8()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_25126C4D8()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_25126C4E8()
{
  return MEMORY[0x270F9D7C0]();
}

uint64_t sub_25126C4F8()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_25126C508()
{
  return MEMORY[0x270F9D878]();
}

uint64_t sub_25126C518()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_25126C528()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_25126C538()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_25126C548()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t sub_25126C558()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_25126C568()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_25126C578()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_25126C588()
{
  return MEMORY[0x270EF1BD8]();
}

uint64_t sub_25126C598()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_25126C5A8()
{
  return MEMORY[0x270FA1EA0]();
}

uint64_t sub_25126C5B8()
{
  return MEMORY[0x270FA1EA8]();
}

uint64_t sub_25126C5C8()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_25126C5D8()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_25126C5E8()
{
  return MEMORY[0x270F9DEF0]();
}

uint64_t sub_25126C5F8()
{
  return MEMORY[0x270EF1CE0]();
}

uint64_t sub_25126C608()
{
  return MEMORY[0x270FA2BC8]();
}

uint64_t sub_25126C618()
{
  return MEMORY[0x270F82418]();
}

uint64_t sub_25126C628()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_25126C638()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_25126C648()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_25126C658()
{
  return MEMORY[0x270F82478]();
}

uint64_t sub_25126C668()
{
  return MEMORY[0x270F824A0]();
}

uint64_t sub_25126C678()
{
  return MEMORY[0x270FA0C08]();
}

uint64_t sub_25126C688()
{
  return MEMORY[0x270FA0C50]();
}

uint64_t sub_25126C698()
{
  return MEMORY[0x270FA0CD0]();
}

uint64_t sub_25126C6A8()
{
  return MEMORY[0x270FA0CF0]();
}

uint64_t sub_25126C6B8()
{
  return MEMORY[0x270FA0D20]();
}

uint64_t sub_25126C6C8()
{
  return MEMORY[0x270FA0D50]();
}

uint64_t sub_25126C6D8()
{
  return MEMORY[0x270FA0D70]();
}

uint64_t sub_25126C6E8()
{
  return MEMORY[0x270FA0DB8]();
}

uint64_t sub_25126C6F8()
{
  return MEMORY[0x270F828E0]();
}

uint64_t sub_25126C708()
{
  return MEMORY[0x270EF2180]();
}

uint64_t sub_25126C718()
{
  return MEMORY[0x270FA1180]();
}

uint64_t sub_25126C728()
{
  return MEMORY[0x270F82960]();
}

uint64_t sub_25126C738()
{
  return MEMORY[0x270EF2210]();
}

uint64_t sub_25126C748()
{
  return MEMORY[0x270F82B98]();
}

uint64_t sub_25126C758()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_25126C768()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_25126C778()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_25126C788()
{
  return MEMORY[0x270EF24A0]();
}

uint64_t sub_25126C798()
{
  return MEMORY[0x270EF2560]();
}

uint64_t sub_25126C7A8()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_25126C7B8()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_25126C7C8()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_25126C7D8()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_25126C7E8()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_25126C7F8()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_25126C808()
{
  return MEMORY[0x270F9EA30]();
}

uint64_t sub_25126C818()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_25126C828()
{
  return MEMORY[0x270F9EA48]();
}

uint64_t sub_25126C838()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_25126C848()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t sub_25126C858()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_25126C868()
{
  return MEMORY[0x270F9EBE0]();
}

uint64_t sub_25126C878()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t sub_25126C888()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t sub_25126C898()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_25126C8A8()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_25126C8B8()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_25126C8C8()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_25126C8D8()
{
  return MEMORY[0x270F9F088]();
}

uint64_t sub_25126C8E8()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_25126C8F8()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_25126C908()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_25126C918()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_25126C938()
{
  return MEMORY[0x270F9F7C0]();
}

uint64_t sub_25126C948()
{
  return MEMORY[0x270F9F7C8]();
}

uint64_t sub_25126C958()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_25126C968()
{
  return MEMORY[0x270F9FA68]();
}

uint64_t sub_25126C978()
{
  return MEMORY[0x270F9FA88]();
}

uint64_t sub_25126C988()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_25126C998()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_25126C9A8()
{
  return MEMORY[0x270EF2680]();
}

uint64_t sub_25126C9B8()
{
  return MEMORY[0x270F9FC28]();
}

uint64_t sub_25126C9C8()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_25126C9D8()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_25126C9E8()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_25126C9F8()
{
  return MEMORY[0x270EF2760]();
}

uint64_t AXFormatFloatWithPercentage()
{
  return MEMORY[0x270F09240]();
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x270EE4C90](applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x270EE4CD0](key, applicationID, keyExistsAndHasValidFormat);
}

CFIndex CFPreferencesGetAppIntegerValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x270EE4CE0](key, applicationID, keyExistsAndHasValidFormat);
}

uint64_t HKHearingLevelClassificationForSensitivity()
{
  return MEMORY[0x270EF3708]();
}

uint64_t HKIntegerFormatter()
{
  return MEMORY[0x270F38258]();
}

uint64_t HKLocalizedStringForHearingLevelClassification()
{
  return MEMORY[0x270EF3748]();
}

uint64_t IsAppleInternalBuild()
{
  return MEMORY[0x270F243B8]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x270F95FE8]();
}

uint64_t MGGetStringAnswer()
{
  return MEMORY[0x270F95FF8]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x270EF2A50](aClassName);
}

void NSLog(NSString *format, ...)
{
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x270EF2C28](range.location, range.length);
}

BOOL UIContentSizeCategoryIsAccessibilityCategory(UIContentSizeCategory category)
{
  return MEMORY[0x270F82CD0](category);
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

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x270ED8070]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
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

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x270ED9628](__path, *(void *)&__mode);
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

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x270F9A648](object, key);
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

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x270FA0180]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x270FA01A0]();
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

uint64_t swift_deletedMethodError()
{
  return MEMORY[0x270FA0250]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x270FA0268]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x270FA0288]();
}

uint64_t swift_dynamicCastObjCClassUnconditional()
{
  return MEMORY[0x270FA0290]();
}

uint64_t swift_dynamicCastObjCProtocolConditional()
{
  return MEMORY[0x270FA0298]();
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

uint64_t swift_getKeyPath()
{
  return MEMORY[0x270FA03B8]();
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

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x270FA0458]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x270FA0478]();
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