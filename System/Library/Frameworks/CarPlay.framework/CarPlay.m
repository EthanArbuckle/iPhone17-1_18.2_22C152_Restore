void sub_2181A6F28(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  id *v3;
  id *v4;
  uint64_t v5;

  objc_destroyWeak(v4);
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v5 - 120));
  _Unwind_Resume(a1);
}

id CarPlayFrameworkACCNavLogging()
{
  if (CarPlayFrameworkACCNavLogging_onceToken != -1) {
    dispatch_once(&CarPlayFrameworkACCNavLogging_onceToken, &__block_literal_global_3_0);
  }
  v0 = (void *)CarPlayFrameworkACCNavLogging_facility;

  return v0;
}

id CPLocalizedStringForKey(void *a1)
{
  id v1 = a1;
  v2 = CPFrameworkBundle();
  v3 = [v2 localizedStringForKey:v1 value:&stru_26C93EB30 table:@"Localizable"];

  return v3;
}

id CPFrameworkBundle()
{
  v0 = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 8uLL, 0);
  id v1 = [v0 objectAtIndex:0];

  v2 = [(id)GSSystemRootDirectory() stringByAppendingPathComponent:v1];
  v3 = [v2 stringByAppendingPathComponent:@"Frameworks/CarPlay.framework"];

  v4 = [MEMORY[0x263F086E0] bundleWithPath:v3];

  return v4;
}

uint64_t __CarPlayFrameworkACCNavLogging_block_invoke()
{
  CarPlayFrameworkACCNavLogging_facility = (uint64_t)os_log_create("com.apple.carplayframework", "ACCNav");

  return MEMORY[0x270F9A758]();
}

__CFString *NSStringFromCPChargingStationConnectorType(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 7) {
    return @"CCS1";
  }
  else {
    return off_264309C30[a1 - 1];
  }
}

id CPSanitizeImage(void *a1, objc_class *a2)
{
  id v3 = a1;
  v4 = [v3 images];

  if (v4)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      CPSanitizeImage_cold_1(a2);
    }
    v5 = [v3 images];
    id v6 = [v5 firstObject];
  }
  else
  {
    id v6 = v3;
  }

  return v6;
}

void sub_2181A9698(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
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

void sub_2181A9CF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_1(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_debug_impl(a1, v4, OS_LOG_TYPE_DEBUG, a4, v5, 0xCu);
}

uint64_t OUTLINED_FUNCTION_5(uint64_t result, float a2)
{
  float *v3 = a2;
  void *v2 = result;
  return result;
}

void sub_2181B2120(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

void sub_2181B231C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2181B24C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2181B34F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2181B4F24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2181B60B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __CPRootTemplateClasses_block_invoke()
{
  v0 = (void *)MEMORY[0x263EFF9C0];
  if (CPPushableTemplateClasses_onceToken != -1) {
    dispatch_once(&CPPushableTemplateClasses_onceToken, &__block_literal_global_567);
  }
  id v3 = [v0 setWithSet:CPPushableTemplateClasses_classes];
  [v3 addObject:objc_opt_class()];
  uint64_t v1 = [v3 copy];
  v2 = (void *)CPRootTemplateClasses_classes;
  CPRootTemplateClasses_classes = v1;
}

uint64_t __CPAllowedTemplateClassesForCurrentEntitlement_block_invoke()
{
  if (CPCurrentProcessHasMapsEntitlement())
  {
    if (CPNavigationTemplateClasses_onceToken != -1) {
      dispatch_once(&CPNavigationTemplateClasses_onceToken, &__block_literal_global_551);
    }
    v0 = (void *)CPNavigationTemplateClasses_classes;
LABEL_18:
    id v1 = v0;
    goto LABEL_19;
  }
  if (CPCurrentProcessHasAudioEntitlement())
  {
    if (CPAudioTemplateClasses_onceToken != -1) {
      dispatch_once(&CPAudioTemplateClasses_onceToken, &__block_literal_global_553);
    }
    v0 = (void *)CPAudioTemplateClasses_classes;
    goto LABEL_18;
  }
  if (CPCurrentProcessHasCommunicationEntitlement())
  {
    if (CPCommunicationTemplateClasses_onceToken != -1) {
      dispatch_once(&CPCommunicationTemplateClasses_onceToken, &__block_literal_global_555);
    }
    v0 = (void *)CPCommunicationTemplateClasses_classes;
    goto LABEL_18;
  }
  if ((CPCurrentProcessHasChargingEntitlement() & 1) != 0 || CPCurrentProcessHasParkingEntitlement())
  {
    if (CPChargingParkingTemplateClasses_onceToken != -1) {
      dispatch_once(&CPChargingParkingTemplateClasses_onceToken, &__block_literal_global_557);
    }
    v0 = (void *)CPChargingParkingTemplateClasses_classes;
    goto LABEL_18;
  }
  if (CPCurrentProcessHasQuickOrderingEntitlement())
  {
    CPQuickOrderingTemplateClasses();
    id v1 = (id)objc_claimAutoreleasedReturnValue();
  }
  else if (CPCurrentProcessHasPublicSafetyEntitlement())
  {
    CPPublicSafetyTemplateClasses();
    id v1 = (id)objc_claimAutoreleasedReturnValue();
  }
  else if (CPCurrentProcessHasFuelingEntitlement())
  {
    CPFuelingTemplateClasses();
    id v1 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t result = CPCurrentProcessHasDrivingTaskEntitlement();
    if (!result) {
      return result;
    }
    CPDrivingTaskTemplateClasses();
    id v1 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_19:
  CPAllowedTemplateClassesForCurrentEntitlement_allowedTemplateClasses = (uint64_t)v1;

  return MEMORY[0x270F9A758]();
}

id CPQuickOrderingTemplateClasses()
{
  if (CPQuickOrderingTemplateClasses_onceToken != -1) {
    dispatch_once(&CPQuickOrderingTemplateClasses_onceToken, &__block_literal_global_559);
  }
  v0 = (void *)CPQuickOrderingTemplateClasses_classes;

  return v0;
}

id CPPublicSafetyTemplateClasses()
{
  if (CPPublicSafetyTemplateClasses_onceToken != -1) {
    dispatch_once(&CPPublicSafetyTemplateClasses_onceToken, &__block_literal_global_561);
  }
  v0 = (void *)CPPublicSafetyTemplateClasses_classes;

  return v0;
}

id CPFuelingTemplateClasses()
{
  if (CPFuelingTemplateClasses_onceToken != -1) {
    dispatch_once(&CPFuelingTemplateClasses_onceToken, &__block_literal_global_563);
  }
  v0 = (void *)CPFuelingTemplateClasses_classes;

  return v0;
}

id CPDrivingTaskTemplateClasses()
{
  if (CPDrivingTaskTemplateClasses_onceToken != -1) {
    dispatch_once(&CPDrivingTaskTemplateClasses_onceToken, &__block_literal_global_565);
  }
  v0 = (void *)CPDrivingTaskTemplateClasses_classes;

  return v0;
}

uint64_t __CPNavigationTemplateClasses_block_invoke()
{
  v0 = (void *)MEMORY[0x263EFFA08];
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  CPNavigationTemplateClasses_classes = objc_msgSend(v0, "setWithObjects:", v1, v2, v3, v4, v5, v6, v7, v8, v9, objc_opt_class(), 0);

  return MEMORY[0x270F9A758]();
}

uint64_t __CPAudioTemplateClasses_block_invoke()
{
  v0 = (void *)MEMORY[0x263EFFA08];
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  CPAudioTemplateClasses_classes = objc_msgSend(v0, "setWithObjects:", v1, v2, v3, v4, v5, v6, objc_opt_class(), 0);

  return MEMORY[0x270F9A758]();
}

uint64_t __CPCommunicationTemplateClasses_block_invoke()
{
  v0 = (void *)MEMORY[0x263EFFA08];
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  CPCommunicationTemplateClasses_classes = objc_msgSend(v0, "setWithObjects:", v1, v2, v3, v4, v5, v6, v7, v8, objc_opt_class(), 0);

  return MEMORY[0x270F9A758]();
}

uint64_t __CPChargingParkingTemplateClasses_block_invoke()
{
  v0 = (void *)MEMORY[0x263EFFA08];
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  CPChargingParkingTemplateClasses_classes = objc_msgSend(v0, "setWithObjects:", v1, v2, v3, v4, v5, v6, v7, objc_opt_class(), 0);

  return MEMORY[0x270F9A758]();
}

uint64_t __CPQuickOrderingTemplateClasses_block_invoke()
{
  v0 = (void *)MEMORY[0x263EFFA08];
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  CPQuickOrderingTemplateClasses_classes = objc_msgSend(v0, "setWithObjects:", v1, v2, v3, v4, v5, v6, v7, objc_opt_class(), 0);

  return MEMORY[0x270F9A758]();
}

uint64_t __CPPublicSafetyTemplateClasses_block_invoke()
{
  v0 = (void *)MEMORY[0x263EFFA08];
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  CPPublicSafetyTemplateClasses_classes = objc_msgSend(v0, "setWithObjects:", v1, v2, v3, v4, v5, v6, v7, v8, v9, objc_opt_class(), 0);

  return MEMORY[0x270F9A758]();
}

uint64_t __CPFuelingTemplateClasses_block_invoke()
{
  v0 = (void *)MEMORY[0x263EFFA08];
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  CPFuelingTemplateClasses_classes = objc_msgSend(v0, "setWithObjects:", v1, v2, v3, v4, v5, v6, objc_opt_class(), 0);

  return MEMORY[0x270F9A758]();
}

uint64_t __CPDrivingTaskTemplateClasses_block_invoke()
{
  v0 = (void *)MEMORY[0x263EFFA08];
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  CPDrivingTaskTemplateClasses_classes = objc_msgSend(v0, "setWithObjects:", v1, v2, v3, v4, v5, v6, objc_opt_class(), 0);

  return MEMORY[0x270F9A758]();
}

uint64_t __CPPushableTemplateClasses_block_invoke()
{
  v0 = (void *)MEMORY[0x263EFFA08];
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  CPPushableTemplateClasses_classes = objc_msgSend(v0, "setWithObjects:", v1, v2, v3, v4, v5, v6, v7, objc_opt_class(), 0);

  return MEMORY[0x270F9A758]();
}

uint64_t __CPPresentableTemplateClasses_block_invoke()
{
  v0 = (void *)MEMORY[0x263EFFA08];
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  CPPresentableTemplateClasses_classes = objc_msgSend(v0, "setWithObjects:", v1, v2, objc_opt_class(), 0);

  return MEMORY[0x270F9A758]();
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_3_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void sub_2181B81E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

void sub_2181B9680(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
}

void sub_2181B9AB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

__CFString *NSStringFromAccNavLaneGuidanceInfoUpdateInfoType(int a1)
{
  if ((a1 - 1) > 2) {
    return @"DisplayComponentID";
  }
  else {
    return off_26430A568[(__int16)(a1 - 1)];
  }
}

__CFString *NSStringFromAccNavLaneGuidanceInfoUpdateLaneInfoInfoType(int a1)
{
  if ((a1 - 1) > 2) {
    return @"Index";
  }
  else {
    return off_26430A580[(__int16)(a1 - 1)];
  }
}

__CFString *NSStringFromAccNavManeuverInfoUpdateInfoType(int a1)
{
  if ((a1 - 1) > 0xC) {
    return @"DisplayComponentID";
  }
  else {
    return off_26430A598[(__int16)(a1 - 1)];
  }
}

__CFString *NSStringFromAccNavRouteGuidanceUpdateInfoType(int a1)
{
  if ((a1 - 1) > 0x19) {
    return @"DisplayComponentID";
  }
  else {
    return off_26430A600[(__int16)(a1 - 1)];
  }
}

__CFString *NSStringFromCPAccNavType(unint64_t a1)
{
  if (a1 > 0xD) {
    return @"Unknown";
  }
  else {
    return off_26430A718[a1];
  }
}

id NSNumberForCPAccNavTypeFromDouble(uint64_t a1, double a2)
{
  switch(a1)
  {
    case 0:
      uint64_t v4 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", (unint64_t)a2, v2);
      goto LABEL_13;
    case 1:
      uint64_t v4 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", a2, v2);
      goto LABEL_13;
    case 2:
      uint64_t v4 = objc_msgSend(NSNumber, "numberWithUnsignedShort:", (int)a2, v2);
      goto LABEL_13;
    case 3:
      uint64_t v4 = objc_msgSend(NSNumber, "numberWithUnsignedChar:", (int)a2, v2);
      goto LABEL_13;
    case 4:
      uint64_t v4 = objc_msgSend(NSNumber, "numberWithLongLong:", (uint64_t)a2, v2);
      goto LABEL_13;
    case 5:
      uint64_t v4 = objc_msgSend(NSNumber, "numberWithInt:", (int)a2, v2);
      goto LABEL_13;
    case 6:
      uint64_t v4 = objc_msgSend(NSNumber, "numberWithShort:", (int)a2, v2);
      goto LABEL_13;
    case 7:
      uint64_t v4 = objc_msgSend(NSNumber, "numberWithChar:", (int)a2, v2);
LABEL_13:
      break;
    default:
      uint64_t v4 = 0;
      break;
  }
  return v4;
}

uint64_t NotSetFromCPAccNavType(unint64_t a1)
{
  if (a1 > 7) {
    return 0;
  }
  else {
    return (uint64_t)*(&off_26430A788 + a1);
  }
}

void *NotSetFromCPNavEnum(int a1, unint64_t a2)
{
  if (a1 == 6) {
    return &unk_26C95B540;
  }
  if (a2 > 7) {
    return 0;
  }
  return *(&off_26430A788 + a2);
}

void __CPWhiteListedTemplates_block_invoke()
{
  v0 = (void *)MEMORY[0x263EFF9C0];
  if (CPTabTemplates_onceToken != -1) {
    dispatch_once(&CPTabTemplates_onceToken, &__block_literal_global_129);
  }
  id v1 = (id)CPTabTemplates_classes;
  uint64_t v2 = [v0 setWithSet:v1];

  [v2 addObject:objc_opt_class()];
  uint64_t v3 = (void *)CPWhiteListedTemplates_classes;
  CPWhiteListedTemplates_classes = (uint64_t)v2;
}

uint64_t __CPTabTemplates_block_invoke()
{
  int HasAudioEntitlement = CPCurrentProcessHasAudioEntitlement();
  id v1 = (void *)MEMORY[0x263EFFA08];
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  if (HasAudioEntitlement)
  {
    objc_msgSend(v1, "setWithObjects:", v2, v3, 0, v6, v7);
  }
  else
  {
    uint64_t v4 = objc_opt_class();
    objc_msgSend(v1, "setWithObjects:", v2, v3, v4, objc_opt_class(), 0);
  CPTabTemplates_classes = };

  return MEMORY[0x270F9A758]();
}

void sub_2181C0824(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3(uint64_t a1)
{
}

void sub_2181C0CD4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2181C21A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_2181C2B04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2181C3458(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4(uint64_t a1)
{
}

void sub_2181C3F34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2181C6AA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void CPAssertAllowedClass(void *a1, uint64_t a2, const char *a3)
{
  id v5 = a1;
  uint64_t v6 = [MEMORY[0x263EFFA08] setWithObject:a2];
  id v10 = v5;
  if (([v6 containsObject:object_getClass(v10)] & 1) == 0)
  {
    uint64_t v7 = (void *)MEMORY[0x263EFF940];
    uint64_t v8 = *MEMORY[0x263EFF4A0];
    uint64_t v9 = NSStringFromSelector(a3);
    [v7 raise:v8, @"Unsupported object %@ passed to %@. Allowed classes: %@", v10, v9, v6, 0 format];
  }
}

void sub_2181CA5B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__5(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5(uint64_t a1)
{
}

void sub_2181CB0B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2181CE54C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2181CE838(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__6(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__6(uint64_t a1)
{
}

void sub_2181D03E4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_2181D107C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2181D13E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__7(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__7(uint64_t a1)
{
}

void sub_2181D43D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2181D47C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__8(uint64_t a1)
{
}

void sub_2181D9B48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id CarPlayFrameworkGeneralLogging()
{
  if (CarPlayFrameworkGeneralLogging_onceToken != -1) {
    dispatch_once(&CarPlayFrameworkGeneralLogging_onceToken, &__block_literal_global_20);
  }
  v0 = (void *)CarPlayFrameworkGeneralLogging_facility;

  return v0;
}

uint64_t __CarPlayFrameworkGeneralLogging_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.carplayframework", "General");
  uint64_t v1 = CarPlayFrameworkGeneralLogging_facility;
  CarPlayFrameworkGeneralLogging_facility = (uint64_t)v0;

  return MEMORY[0x270F9A758](v0, v1);
}

void sub_2181DC018(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

double luminanceComponent(double a1)
{
  if (a1 <= 0.03928) {
    return a1 / 12.9200001;
  }
  float v1 = (a1 + 0.0549999997) / 1.05499995;
  return powf(v1, 2.4);
}

double CPLuminanceForColor(void *a1)
{
  double v10 = 0.0;
  double v11 = 0.0;
  uint64_t v8 = 0;
  double v9 = 0.0;
  [a1 getRed:&v11 green:&v10 blue:&v9 alpha:&v8];
  if (v11 <= 0.03928)
  {
    double v2 = v11 / 12.9200001;
  }
  else
  {
    float v1 = (v11 + 0.0549999997) / 1.05499995;
    double v2 = powf(v1, 2.4);
  }
  if (v10 <= 0.03928)
  {
    double v4 = v10 / 12.9200001;
  }
  else
  {
    float v3 = (v10 + 0.0549999997) / 1.05499995;
    double v4 = powf(v3, 2.4);
  }
  if (v9 <= 0.03928)
  {
    double v6 = v9 / 12.9200001;
  }
  else
  {
    float v5 = (v9 + 0.0549999997) / 1.05499995;
    double v6 = powf(v5, 2.4);
  }
  return v4 * 0.715200007 + v2 * 0.212599993 + v6 * 0.0722000003;
}

double CPContrastRatioForColors(void *a1, void *a2)
{
  id v3 = a2;
  double v4 = CPLuminanceForColor(a1);
  double v5 = CPLuminanceForColor(v3);

  if (v4 <= v5) {
    double v6 = v5;
  }
  else {
    double v6 = v4;
  }
  if (v4 <= v5) {
    double v7 = v4;
  }
  else {
    double v7 = v5;
  }
  return (v6 + 0.0500000007) / (v7 + 0.0500000007);
}

id CPContrastingColorForColor(void *a1)
{
  id v1 = a1;
  double v2 = [MEMORY[0x263F1C550] whiteColor];
  double v3 = CPContrastRatioForColors(v2, v1);

  if (v3 > 7.0)
  {
    uint64_t v4 = [MEMORY[0x263F1C550] whiteColor];
LABEL_5:
    double v7 = (void *)v4;
    goto LABEL_7;
  }
  double v5 = [MEMORY[0x263F1C550] blackColor];
  double v6 = CPContrastRatioForColors(v5, v1);

  if (v6 > 7.0)
  {
    uint64_t v4 = [MEMORY[0x263F1C550] blackColor];
    goto LABEL_5;
  }
  double v7 = 0;
LABEL_7:

  return v7;
}

BOOL CPColorMeetsContrastRequirement(void *a1)
{
  id v1 = CPContrastingColorForColor(a1);
  BOOL v2 = v1 != 0;

  return v2;
}

uint64_t CPGuidanceStyleForColor(void *a1, void *a2)
{
  double v3 = (void *)MEMORY[0x263F1CB00];
  id v4 = a2;
  id v5 = a1;
  double v6 = [v3 _currentTraitCollection];
  [MEMORY[0x263F1CB00] _setCurrentTraitCollection:v4];

  double v7 = (void *)MEMORY[0x263F1C550];
  id v8 = v5;
  uint64_t v9 = [v8 CGColor];

  double v10 = [v7 colorWithCGColor:v9];
  [MEMORY[0x263F1CB00] _setCurrentTraitCollection:v6];
  double v11 = CPContrastingColorForColor(v10);
  v12 = [MEMORY[0x263F1C550] whiteColor];
  int v13 = [v11 isEqual:v12];

  if (v13) {
    uint64_t v14 = 2;
  }
  else {
    uint64_t v14 = 1;
  }

  return v14;
}

id CPImageByScalingImageToSize(void *a1, double a2, double a3)
{
  id v5 = a1;
  double v6 = [MEMORY[0x263F1C920] _carScreen];
  double v7 = [v6 traitCollection];
  id v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    id v9 = [MEMORY[0x263F1CB00] _currentTraitCollection];
  }
  double v10 = v9;

  if ([v5 isSymbolImage]
    || ([v5 size], v11 <= a2) && (objc_msgSend(v5, "size"), v12 <= a3))
  {
    id v25 = v5;
  }
  else
  {
    [v5 size];
    double v14 = a2 / v13;
    [v5 size];
    if (v14 >= a3 / v15) {
      double v14 = a3 / v15;
    }
    [v5 size];
    double v17 = v16 * v14;
    [v5 size];
    double v19 = v18 * v14;
    id v20 = objc_alloc(MEMORY[0x263F1C680]);
    v21 = [MEMORY[0x263F1C688] formatForTraitCollection:v10];
    v22 = objc_msgSend(v20, "initWithSize:format:", v21, v17, v19);

    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __CPImageByScalingImageToSize_block_invoke;
    v27[3] = &unk_26430B088;
    id v23 = v5;
    id v28 = v23;
    double v29 = v17;
    double v30 = v19;
    v24 = [v22 imageWithActions:v27];
    objc_msgSend(v24, "imageWithRenderingMode:", objc_msgSend(v23, "renderingMode"));
    id v25 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v25;
}

uint64_t __CPImageByScalingImageToSize_block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "drawInRect:", 0.0, 0.0, *(double *)(a1 + 40), *(double *)(a1 + 48));
}

id CPSanitizedBackgroundColor(void *a1)
{
  v44[2] = *MEMORY[0x263EF8340];
  id v1 = (void *)MEMORY[0x263F1CB00];
  id v2 = a1;
  uint64_t v3 = [v1 _currentTraitCollection];
  uint64_t v4 = [MEMORY[0x263F1CB00] traitCollectionWithUserInterfaceIdiom:3];
  id v5 = (void *)MEMORY[0x263F1CB00];
  v44[0] = v4;
  double v6 = [MEMORY[0x263F1CB00] traitCollectionWithUserInterfaceStyle:1];
  v44[1] = v6;
  double v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v44 count:2];
  uint64_t v8 = [v5 traitCollectionWithTraitsFromCollections:v7];

  id v9 = (void *)MEMORY[0x263F1CB00];
  v38 = (void *)v4;
  v43[0] = v4;
  double v10 = [MEMORY[0x263F1CB00] traitCollectionWithUserInterfaceStyle:2];
  v43[1] = v10;
  double v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v43 count:2];
  uint64_t v12 = [v9 traitCollectionWithTraitsFromCollections:v11];

  v37 = (void *)v8;
  [MEMORY[0x263F1CB00] _setCurrentTraitCollection:v8];
  double v13 = [MEMORY[0x263F1C550] tableBackgroundColor];
  double v14 = (void *)MEMORY[0x263F1C550];
  id v15 = v2;
  double v16 = objc_msgSend(v14, "colorWithCGColor:", objc_msgSend(v15, "CGColor"));
  double v17 = [v16 colorWithAlphaComponent:1.0];

  v36 = (void *)v12;
  [MEMORY[0x263F1CB00] _setCurrentTraitCollection:v12];
  double v18 = [MEMORY[0x263F1C550] tableBackgroundColor];
  double v19 = (void *)MEMORY[0x263F1C550];
  id v20 = v15;
  uint64_t v21 = [v20 CGColor];

  v22 = [v19 colorWithCGColor:v21];
  id v23 = [v22 colorWithAlphaComponent:1.0];

  v39 = (void *)v3;
  [MEMORY[0x263F1CB00] _setCurrentTraitCollection:v3];
  if (CPColorMeetsContrastRequirement(v17))
  {
    uint64_t v24 = [v17 copy];

    double v13 = (void *)v24;
  }
  if (CPColorMeetsContrastRequirement(v23))
  {
    uint64_t v25 = [v23 copy];

    double v18 = (void *)v25;
  }
  v26 = (void *)MEMORY[0x263F1CB00];
  v27 = [MEMORY[0x263F1CB00] traitCollectionWithUserInterfaceStyle:0];
  v42[0] = v27;
  id v28 = [MEMORY[0x263F1CB00] traitCollectionWithUserInterfaceIdiom:-1];
  v42[1] = v28;
  double v29 = [MEMORY[0x263F1CB00] traitCollectionWithDisplayGamut:-1];
  v42[2] = v29;
  double v30 = [MEMORY[0x263EFF8C0] arrayWithObjects:v42 count:3];
  v31 = [v26 traitCollectionWithTraitsFromCollections:v30];

  v32 = (void *)MEMORY[0x263F1C550];
  v40[0] = v37;
  v40[1] = v36;
  v41[0] = v13;
  v41[1] = v18;
  v40[2] = v31;
  v41[2] = v18;
  v33 = [NSDictionary dictionaryWithObjects:v41 forKeys:v40 count:3];
  v34 = [v32 _dynamicColorWithColorsByTraitCollection:v33];

  return v34;
}

__CFString *CPSStringFromBOOL(int a1)
{
  if (a1) {
    return @"YES";
  }
  else {
    return @"NO";
  }
}

uint64_t CPCurrentProcessHasTemplateEntitlement()
{
  if ((CPCurrentProcessHasMapsEntitlement() & 1) != 0
    || (CPCurrentProcessHasAudioEntitlement() & 1) != 0
    || (CPCurrentProcessHasCommunicationEntitlement() & 1) != 0
    || (CPCurrentProcessHasChargingEntitlement() & 1) != 0
    || (CPCurrentProcessHasParkingEntitlement() & 1) != 0
    || (CPCurrentProcessHasQuickOrderingEntitlement() & 1) != 0
    || (CPCurrentProcessHasPublicSafetyEntitlement() & 1) != 0
    || (CPCurrentProcessHasFuelingEntitlement() & 1) != 0)
  {
    return 1;
  }

  return CPCurrentProcessHasDrivingTaskEntitlement();
}

uint64_t CPCurrentProcessHasMapsEntitlement()
{
  os_log_t v0 = [MEMORY[0x263F01888] bundleProxyForCurrentProcess];
  id v1 = [MEMORY[0x263EFFA08] setWithObject:@"com.apple.developer.carplay-maps"];
  id v2 = [v0 entitlementValuesForKeys:v1];

  uint64_t v3 = [v2 BOOLForKey:@"com.apple.developer.carplay-maps"];
  if (v3)
  {
    uint64_t v4 = CarPlayFrameworkGeneralLogging();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)double v6 = 0;
      _os_log_impl(&dword_2181A5000, v4, OS_LOG_TYPE_DEFAULT, "Application declares maps entitlement.", v6, 2u);
    }
  }
  return v3;
}

uint64_t CPCurrentProcessHasAudioEntitlement()
{
  os_log_t v0 = [MEMORY[0x263F01888] bundleProxyForCurrentProcess];
  id v1 = [MEMORY[0x263EFFA08] setWithObject:@"com.apple.developer.carplay-audio"];
  id v2 = [v0 entitlementValuesForKeys:v1];

  uint64_t v3 = [v2 BOOLForKey:@"com.apple.developer.carplay-audio"];
  if (v3)
  {
    uint64_t v4 = CarPlayFrameworkGeneralLogging();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)double v6 = 0;
      _os_log_impl(&dword_2181A5000, v4, OS_LOG_TYPE_DEFAULT, "Application declares audio entitlement.", v6, 2u);
    }
  }
  return v3;
}

uint64_t CPCurrentProcessHasCommunicationEntitlement()
{
  os_log_t v0 = [MEMORY[0x263F01888] bundleProxyForCurrentProcess];
  id v1 = [MEMORY[0x263EFFA08] setWithObject:@"com.apple.developer.carplay-communication"];
  id v2 = [v0 entitlementValuesForKeys:v1];

  uint64_t v3 = [v2 BOOLForKey:@"com.apple.developer.carplay-communication"];
  if (v3)
  {
    uint64_t v4 = CarPlayFrameworkGeneralLogging();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)double v6 = 0;
      _os_log_impl(&dword_2181A5000, v4, OS_LOG_TYPE_DEFAULT, "Application declares communications entitlement.", v6, 2u);
    }
  }
  return v3;
}

uint64_t CPCurrentProcessHasChargingEntitlement()
{
  os_log_t v0 = [MEMORY[0x263F01888] bundleProxyForCurrentProcess];
  id v1 = [MEMORY[0x263EFFA08] setWithObject:@"com.apple.developer.carplay-charging"];
  id v2 = [v0 entitlementValuesForKeys:v1];

  uint64_t v3 = [v2 BOOLForKey:@"com.apple.developer.carplay-charging"];
  if (v3)
  {
    uint64_t v4 = CarPlayFrameworkGeneralLogging();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)double v6 = 0;
      _os_log_impl(&dword_2181A5000, v4, OS_LOG_TYPE_DEFAULT, "Application declares charging entitlement.", v6, 2u);
    }
  }
  return v3;
}

uint64_t CPCurrentProcessHasParkingEntitlement()
{
  os_log_t v0 = [MEMORY[0x263F01888] bundleProxyForCurrentProcess];
  id v1 = [MEMORY[0x263EFFA08] setWithObject:@"com.apple.developer.carplay-parking"];
  id v2 = [v0 entitlementValuesForKeys:v1];

  uint64_t v3 = [v2 BOOLForKey:@"com.apple.developer.carplay-parking"];
  if (v3)
  {
    uint64_t v4 = CarPlayFrameworkGeneralLogging();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)double v6 = 0;
      _os_log_impl(&dword_2181A5000, v4, OS_LOG_TYPE_DEFAULT, "Application declares parking entitlement.", v6, 2u);
    }
  }
  return v3;
}

uint64_t CPCurrentProcessHasQuickOrderingEntitlement()
{
  os_log_t v0 = [MEMORY[0x263F01888] bundleProxyForCurrentProcess];
  id v1 = [MEMORY[0x263EFFA08] setWithObject:@"com.apple.developer.carplay-quick-ordering"];
  id v2 = [v0 entitlementValuesForKeys:v1];

  uint64_t v3 = [v2 BOOLForKey:@"com.apple.developer.carplay-quick-ordering"];
  if (v3)
  {
    uint64_t v4 = CarPlayFrameworkGeneralLogging();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)double v6 = 0;
      _os_log_impl(&dword_2181A5000, v4, OS_LOG_TYPE_DEFAULT, "Application declares quick ordering entitlement.", v6, 2u);
    }
  }
  return v3;
}

uint64_t CPCurrentProcessHasPublicSafetyEntitlement()
{
  os_log_t v0 = [MEMORY[0x263F01888] bundleProxyForCurrentProcess];
  id v1 = [MEMORY[0x263EFFA08] setWithObject:@"com.apple.developer.carplay-public-safety"];
  id v2 = [v0 entitlementValuesForKeys:v1];

  uint64_t v3 = [v2 BOOLForKey:@"com.apple.developer.carplay-public-safety"];
  if (v3)
  {
    uint64_t v4 = CarPlayFrameworkGeneralLogging();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)double v6 = 0;
      _os_log_impl(&dword_2181A5000, v4, OS_LOG_TYPE_DEFAULT, "Application declares public safety entitlement.", v6, 2u);
    }
  }
  return v3;
}

uint64_t CPCurrentProcessHasFuelingEntitlement()
{
  os_log_t v0 = [MEMORY[0x263F01888] bundleProxyForCurrentProcess];
  id v1 = [MEMORY[0x263EFFA08] setWithObject:@"com.apple.developer.carplay-fueling"];
  id v2 = [v0 entitlementValuesForKeys:v1];

  uint64_t v3 = [v2 BOOLForKey:@"com.apple.developer.carplay-fueling"];
  if (v3)
  {
    uint64_t v4 = CarPlayFrameworkGeneralLogging();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)double v6 = 0;
      _os_log_impl(&dword_2181A5000, v4, OS_LOG_TYPE_DEFAULT, "Application declares fueling entitlement.", v6, 2u);
    }
  }
  return v3;
}

uint64_t CPCurrentProcessHasDrivingTaskEntitlement()
{
  os_log_t v0 = [MEMORY[0x263F01888] bundleProxyForCurrentProcess];
  id v1 = [MEMORY[0x263EFFA08] setWithObject:@"com.apple.developer.carplay-driving-task"];
  id v2 = [v0 entitlementValuesForKeys:v1];

  uint64_t v3 = [v2 BOOLForKey:@"com.apple.developer.carplay-driving-task"];
  if (v3)
  {
    uint64_t v4 = CarPlayFrameworkGeneralLogging();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)double v6 = 0;
      _os_log_impl(&dword_2181A5000, v4, OS_LOG_TYPE_DEFAULT, "Application declares driving task entitlement.", v6, 2u);
    }
  }
  return v3;
}

__CFString *NSStringFromCPManeuverType(unint64_t a1)
{
  id v2 = [NSNumber numberWithUnsignedInteger:a1];
  uint64_t v3 = NotSetFromCPAccNavType(3uLL);
  char v4 = [v2 isEqual:v3];

  if (v4)
  {
    id v5 = 0;
  }
  else if (a1 >= 0x36)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"ERROR - %d", a1);
    id v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v5 = off_26430B0F0[a1];
  }

  return v5;
}

__CFString *NSStringFromCPJunctionType(uint64_t a1)
{
  id v2 = [NSNumber numberWithUnsignedInteger:a1];
  uint64_t v3 = NotSetFromCPAccNavType(3uLL);
  char v4 = [v2 isEqual:v3];

  if (v4)
  {
    id v5 = 0;
  }
  else if (a1)
  {
    if (a1 == 1)
    {
      id v5 = @"Roundabout";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"ERROR - %d", a1);
      id v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    id v5 = @"Intersection";
  }

  return v5;
}

__CFString *NSStringFromCPTrafficSide(uint64_t a1)
{
  id v2 = [NSNumber numberWithUnsignedInteger:a1];
  uint64_t v3 = NotSetFromCPAccNavType(3uLL);
  char v4 = [v2 isEqual:v3];

  if (v4)
  {
    id v5 = 0;
  }
  else if (a1)
  {
    if (a1 == 1)
    {
      id v5 = @"Left";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"ERROR - %d", a1);
      id v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    id v5 = @"Right";
  }

  return v5;
}

__CFString *NSStringFromCPLaneStatus(unint64_t a1)
{
  id v2 = [NSNumber numberWithInteger:a1];
  uint64_t v3 = NotSetFromCPAccNavType(3uLL);
  char v4 = [v2 isEqual:v3];

  if (v4)
  {
    id v5 = 0;
  }
  else if (a1 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"ERROR - %d", a1);
    id v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v5 = off_26430B2A0[a1];
  }

  return v5;
}

__CFString *NSStringFromCPDistanceUnits(uint64_t a1)
{
  unsigned int v1 = a1;
  id v2 = [NSNumber numberWithUnsignedChar:a1];
  uint64_t v3 = NotSetFromCPAccNavType(3uLL);
  char v4 = [v2 isEqual:v3];

  if (v4)
  {
    id v5 = 0;
  }
  else if (v1 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"ERROR - %d", v1);
    id v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v5 = off_26430B2B8[(char)v1];
  }

  return v5;
}

id NSUnitLengthFromCPDistanceUnits(uint64_t a1)
{
  int v1 = a1;
  id v2 = [NSNumber numberWithUnsignedChar:a1];
  uint64_t v3 = NotSetFromCPAccNavType(3uLL);
  char v4 = [v2 isEqual:v3];

  if (v4)
  {
    id v5 = 0;
  }
  else
  {
    switch(v1)
    {
      case 0:
        id v5 = [MEMORY[0x263F08CE8] kilometers];
        break;
      case 1:
        id v5 = [MEMORY[0x263F08CE8] miles];
        break;
      case 2:
        id v5 = [MEMORY[0x263F08CE8] meters];
        break;
      case 3:
        id v5 = [MEMORY[0x263F08CE8] yards];
        break;
      case 4:
        id v5 = [MEMORY[0x263F08CE8] feet];
        break;
      default:
        id v5 = [MEMORY[0x263F08CE8] millimeters];
        break;
    }
  }

  return v5;
}

uint64_t CPDistanceUnitsFromNSUnitLength(void *a1)
{
  id v1 = a1;
  id v2 = [MEMORY[0x263F08CE8] kilometers];
  char v3 = [v1 isEqual:v2];

  if (v3)
  {
    unsigned __int8 v4 = 0;
  }
  else
  {
    id v5 = [MEMORY[0x263F08CE8] miles];
    char v6 = [v1 isEqual:v5];

    if (v6)
    {
      unsigned __int8 v4 = 1;
    }
    else
    {
      double v7 = [MEMORY[0x263F08CE8] meters];
      char v8 = [v1 isEqual:v7];

      if (v8)
      {
        unsigned __int8 v4 = 2;
      }
      else
      {
        id v9 = [MEMORY[0x263F08CE8] yards];
        char v10 = [v1 isEqual:v9];

        if (v10)
        {
          unsigned __int8 v4 = 3;
        }
        else
        {
          double v11 = [MEMORY[0x263F08CE8] feet];
          char v12 = [v1 isEqual:v11];

          if (v12)
          {
            unsigned __int8 v4 = 4;
          }
          else
          {
            double v13 = NotSetFromCPAccNavType(3uLL);
            unsigned __int8 v4 = [v13 integerValue];
          }
        }
      }
    }
  }

  return v4;
}

__CFString *NSStringFromCPGuidanceState(uint64_t a1)
{
  unsigned int v1 = a1;
  id v2 = [NSNumber numberWithUnsignedChar:a1];
  char v3 = NotSetFromCPAccNavType(3uLL);
  char v4 = [v2 isEqual:v3];

  if (v4)
  {
    id v5 = 0;
  }
  else if (v1 >= 7)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"ERROR - %d", v1);
    id v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v5 = off_26430B2E0[(char)v1];
  }

  return v5;
}

__CFString *NSStringFromCPManeuverState(unint64_t a1)
{
  id v2 = [NSNumber numberWithInteger:a1];
  char v3 = NotSetFromCPAccNavType(3uLL);
  char v4 = [v2 isEqual:v3];

  if (v4)
  {
    id v5 = 0;
  }
  else if (a1 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"ERROR - %d", a1);
    id v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v5 = off_26430B318[a1];
  }

  return v5;
}

__CFString *NSStringFromCPStopType(uint64_t a1)
{
  unsigned int v1 = a1;
  id v2 = [NSNumber numberWithUnsignedChar:a1];
  char v3 = NotSetFromCPAccNavType(3uLL);
  char v4 = [v2 isEqual:v3];

  if (v4)
  {
    id v5 = 0;
  }
  else if (v1 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"ERROR - %d", v1);
    id v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v5 = off_26430B338[(char)v1];
  }

  return v5;
}

__CFString *NSStringFromCPRerouteReason(char a1)
{
  if ((a1 - 1) > 3u) {
    return @"Unknown";
  }
  else {
    return off_26430B358[(char)(a1 - 1)];
  }
}

__CFString *NSStringFromCPNavEnum(unsigned int a1)
{
  if (a1 >= 0xA)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"ERROR - %d", a1);
    unsigned int v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    unsigned int v1 = off_26430B378[(char)a1];
  }

  return v1;
}

void sub_2181DFB30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,id a27)
{
  objc_destroyWeak(v28);
  objc_destroyWeak(v27);
  objc_destroyWeak(location);
  objc_destroyWeak(&a27);
  _Unwind_Resume(a1);
}

void sub_2181E2A50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__9(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__9(uint64_t a1)
{
}

void sub_2181E35E4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2181E3660(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void CPSanitizeImage_cold_1(objc_class *a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  unsigned int v1 = NSStringFromClass(a1);
  id v2 = [MEMORY[0x263F08B88] callStackSymbols];
  int v3 = 138412546;
  char v4 = v1;
  __int16 v5 = 2112;
  char v6 = v2;
  _os_log_error_impl(&dword_2181A5000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Animated images are not supported by %@. Using the first image instead.\n%@", (uint8_t *)&v3, 0x16u);
}

uint64_t BSEqualArrays()
{
  return MEMORY[0x270F10798]();
}

uint64_t CRNavigationClientInterface()
{
  return MEMORY[0x270F15220]();
}

uint64_t CRNavigationServiceInterface()
{
  return MEMORY[0x270F15228]();
}

uint64_t GSSystemRootDirectory()
{
  return MEMORY[0x270F306A0]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x270EF2A50](aClassName);
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x270EF2BD8](directory, domainMask, expandTilde);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x270EF2C38](aSelector);
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return (NSData *)MEMORY[0x270F06078](image);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _UISceneSettingsDiffActionPerformActionsWithDelayForTransitionContext()
{
  return MEMORY[0x270F063B0]();
}

uint64_t _UISceneSettingsDiffActionPerformChangesWithTransitionContext()
{
  return MEMORY[0x270F063B8]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
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

objc_property_t class_getProperty(Class cls, const char *name)
{
  return (objc_property_t)MEMORY[0x270F9A488](cls, name);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9458](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x270ED94B8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x270ED94C8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x270ED94D0](dsema, timeout);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

uint64_t dyld_program_sdk_at_least()
{
  return MEMORY[0x270ED9718]();
}

void exit(int a1)
{
}

void free(void *a1)
{
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
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

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
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

int objc_sync_enter(id obj)
{
  return MEMORY[0x270F9AA18](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x270F9AA20](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

Class object_getClass(id a1)
{
  return (Class)MEMORY[0x270F9AA40](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

float powf(float a1, float a2)
{
  MEMORY[0x270EDAD00](a1, a2);
  return result;
}

char *__cdecl property_copyAttributeValue(objc_property_t property, const char *attributeName)
{
  return (char *)MEMORY[0x270F9AA88](property, attributeName);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x270EDC0C0](xdict, key);
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}